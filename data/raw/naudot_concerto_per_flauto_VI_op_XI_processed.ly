\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

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
}

Ifln = \relative do'' {

    R1*19
    sol'4 re si8_+ la16 si sol re' mi fad
    sol8 re sol sol-+ la re, la' la-+

    %22
    si la16 si do8 si la re, r16 re mi fad\mbreak
    sol(fad sol) re sol8 sol-+ la16(sol la) re, la'8 la-+
    si la16 si do8 si la4-+ r8 la

    %25
    si16 sol sol8-+ mi' sol, la16 fad fad8-+ re' fad,
    sol16 mi mi8 dod' mi, fad re r la'-+
    si8. la16 sol fad mi re dod8-+ la r la\mbreak

    %28
    re16 fad(mi fad) re fad(mi re) mi sol(fad sol) mi sol(fad mi)
    fad la(sol la) fad la(sol fad) sol si(la si) sol (si la sol)
    la8 si16 dod re(dod re) fad, mi4.-+ re16 dod

    %31
    re fad sol la si(la si) re, dod4.-+ si16 la\mbreak
    si re mi fad sol fad sol si, la4._+ sol16 fad
    sol si dod re mi(re mi) sol, fad4._+ mi16 re

    %34
    mi la(sol la) mi(fad sol) la fad re'(dod re) la(si do) re
    si mi(re mi) si(dod re) mi dod la'(sol la) mi(fad sol) la\mbreak
    fad8-+ mi16 re dod si la sol fad re'(dod re) mi,8 dod'-+

    %37
    re4 r r2
    R1*14
    re4 la fad8_+ mi16 fad re la' si dod

    %53
    re8 la re re-+ mi la, mi' mi-+
    fad mi16 fad sol8 fad mi la, r16 la si dod\mbreak
    re(dod re) la re8 re-+ mi16(re mi) la, mi'8 mi-+

    %56
    fad re16 mi fad re mi fad sol8 re sol sol-+
    la re, la' la-+  si sol16 la si sol la si
    do8. si16 la sol fad mi red8 si'16 la si8 si

    %59
    si16 mi,(red mi) do' si la sol la8 la16 sol la8 la\mbreak
    la16 re, (dod re) si' la sol fad sol8 sol16 fad sol8 sol
    sol la16 sol la sol fad mi fad8 fad16 mi fad8 fad

    %62
    fad sol16 fad sol fad mi red mi8 fad16 sol fad8.-+ mi16
    red si(la si) red4-+ mi16 si(la si) mi4-+
    fad16 si,(la si) fad'4-+ sol16 si,(la si) sol'4-+\mbreak

    %65
    la16 si,(la si) la'4-+ si16 si,(la si) si'4~
    si8 do16 si la sol fad mi red8 si mi16(re do) si
    do(si la) sol fad8._+ mi16 mi4 r

    %68
    R1*6
    r2 r4 r8 re'
    sol16 sol, si re fa8 sol16 fa mi8 sol16 fa mi re mi do\mbreak

    %76
    la' la, dod mi sol8 la16 sol fad?8 la16 sol fad mi fad re
    si' si, red fad la8 si16 la sol8 si16 la sol fad sol mi
    do' do, mi sol si8 do16 si la8 do16 si la sol la fad

    %79
    re' re, fad la do8 re16 do si8 sol r16 si do si\mbreak
    la8 re~re16 la re la sol8 do~do16 sol do sol
    fad8 si~si16 fad si fad mi8 la~la16 mi la mi

    %82
    re8 sol~sol16 re sol re do(si do) re do(mi re) do
    si8 sol r4 r2
    R1*5

    %89
    r4 r8 si' si16(la sold) la si(la sold) fad\mbreak
    mi(fad sold) la si8 mi, mi16(fad sold) la si8 mi,
    re si'16 la sold(fad mi) re do8-+ si16 do la8 la'

    %92
    la16(sol fad) sol la(sol fad) mi re(mi fad) sol la8 re,
    re16(mi fad) sol la8 re, do la'16 sol fad mi re do\mbreak
    si8_+ la16 si sol8 sol' sol16(fad mi) re sol(fad mi) re

    %95
    mi(fa mi) re do8 la' la16 (sol fad?) mi la(sol fad) mi
    fad(sol fad) mi re8 si' si16(la sol) fad si(la sol) fad
    sol(la sol) fad mi8 do' do16(si la) sol do(si la) sol\mbreak

    %98
    la(si la) sol fad8 re' re16(do si) la re(do si) la
    si(do si) la sol8 re mi16(re mi) sol fad(mi fad) la
    sol(fad mi) re do(si la) sol mi'(re mi) sol fad(mi fad) la

    %101
    sol(fad sol) si la(sol la) do si8 la16 sol fad8 sol\mbreak
    do, la'16 sol la do,(si la) si(la si) do re(mi fad) re
    sol8 do16 si la(si) sol(la) fad re sol do la8.-+ sol16

    %104
    sol4 r r2
    R1*18

}

IvlIn =  \relative do'' {

    sol'4 fad-+ sol16 sol, la si do re mi fad
    sol4 fad-+ sol16 sol, la si do re mi fad
    sol8 re sol la16 si la8 re, la' si16 do

    %4
    si8 re, sol la16 si la8 re, la' si16 do
    si8 sol si do16 si la sol la si la do si la\mbreak
    sol8 sol, sol' la16 sol fad mi fad sol fad la sol fad

    %7
    mi8 mi, mi' fad16 mi re8 mi16 fad sol4~
    sol fad8 sol16 fad mi8 fad16 sol la4~
    la sol8 la16 sol fad8 si16 la sol fad mi re

    %10
    dod8 la la'4 fad8-+ mi16 re mi8 dod-+
    re la la'4 fad8-+ mi16 re mi8 dod-+\mbreak
    re4 r8 re sol re16 do si re sol fad

    %13
    sol8 re16 do si re sol fad sol8 re16 do si re sol fa
    mi fad? mi re do8 mi la mi16 re dod mi la sol
    la8 mi16 re dod mi la sol la8 mi16 re dod mi la sol

    %16
    fad8-+ mi16 fad re mi fad re sol4 fad-+\mbreak
    sol16 sol, la si do re mi fad sol4 fad-+
    sol8 fad16 mi re do si la sol sol' fad mi re do si la

    %19
    sol la si do re8 re, sol4 re %%% fine
    si8\p la16 si sol4 re' r
    sol r8 sol sol4 r8 fad

    %22
    sol do16 si la8 sol fad4 r
    sol r8 sol sol4 r8 fad
    sol do16 si la8 sol fad4 r\mbreak

    %25
    r8 si si4 r8 la la4
    r8 sol sol4 r8 fad fad4
    r2 r8 la mi'4

    %28
    r8 la, re2 dod4-+
    re16 fad mi fad re fad mi re mi sol fad sol mi sol fad mi
    fad8 re r4 r8 dod'16 si la sol fad mi

    %31
    fad8 re r4 r8 la'16 sol fad mi re dod\mbreak
    re8 si r4 r8 fad'16 mi re dod si la
    si8 sol r4 r8 re'16 dod si la sol fad

    %34
    sol8 mi r la la fad re fad
    r sol mi sol r dod la dod
    re4 r8 dod re la r mi'16 fad

    %37
    re4\f dod-+ re16 re, mi fad sol la si dod\mbreak
    re4 dod-+ re16 re, mi fad sol la si dod
    re8 la re mi16 fad mi8 la, mi' fad16 sol

    %40
    fad8 la, re mi16 fad mi8 la, mi' fad16 sol
    fad8 re fad sol16 fad mi8 mi la la
    la sol16 fad sol8 la16 sol fad8 fad si si

    %43
    si16 mi, fad sol la8 la la16 re, mi fad sol8 sol\mbreak
    sol fad16 mi fad sol la fad si la sol fad mi fad sol la
    fad8 mi16 re dod la' sol la fad8 mi16 re dod la' sol la

    %46
    fad la re,la' fad la re, la' si la sol fad mi sol fad sol
    mi sol dod, sol' mi sol dod, sol' la sol fad mi re fad mi fad\mbreak
    re fad si, fad' re fad si, fad' sol fad mi re dod mi re mi

    %49
    dod mi la, mi' dod mi la, mi' fad8 re la'4
    fad8-+ mi16 re mi8 dod-+ re la la'4
    fad8-+ mi16 re mi8 dod-+ re4 la

    %52
    fad16_+\p mi fad8 re4 r2
    la'8 fad r re' re dod r4\mbreak
    r8 re mi re re-+ dod r4

    %55
    r r8 re re-+[dod] r4
    r2 r4 sol'~
    sol fad-+ sol r

    %58
    r2 r16 la sol fad sol8 sol
    sol fad16 sol la sol fad mi fad8 fad16 mi fad8 fad
    fad mi16 fad sol fad mi red mi8 si16 la si8 si

    %61
    do do16 si do8 do do4~do16 mi re do\mbreak
    si8 si16 la si8 si si4 la-+
    si r16 si la si sol'4~sol16 si, la si

    %64
    red4~red16 si la si mi4~mi16 si la si
    fad'4~fad16 si, la si sol'4~sol16 la sol la
    fad4-+ r r2

    %67
    r4 r16 si\f la si sold fad mi fad sold la si sol
    la8 la, r16 la' sol? la fad mi re mi fad sol la fad
    sol8 sol, r16 sol' fad sol mi sol do, mi la si la sol

    %70
    fad la re, fad si do si la sol si mi, sol do re do si
    la do fad, la re mi re do si re sol, si mi sol, la sol\mbreak
    fad la re, la' re fad, sol fad mi sol do, sol' do mi, fad mi

    %73
    re fad si, fad' si re, mi re do mi la, mi' la do, re do
    si re sol, re' sol si la sol fad8 la, re,4
    r8 re'\p re8 [re,] r2

    %76
    r8 mi' mi8[mi,] r2
    r8 fad' fad[fad,] r2\mbreak
    r8 sol' sol[sol,] r2

    %79
    r8 la' la[fad] sol re r mi
    mi-+ re r re re-+ do r do
    do-+ si r si si_+ la r la

    %82
    la_+ sol r sol sol4 fad_+
    sol16 sol'\f fad mi re do si la sol sol' fad mi re do si la\mbreak
    sol sol' fad mi re mi fa re mi la sol fad mi re dod si

    %85
    la la' sol fad mi re dod si la la' sol fad mi fad sol mi
    fad si la sol fad mi red do si si' la sol fad mi red do
    si si' la sol fad sol la fad sol la sol fad mi re dod si

    %88
    lad8 fad'16 mi fad si, si' la sol fad mi re dod8.-+si16
    si8\p si si la sold sold sold sold
    sold? sold sold sold sold sold sold sold

    %91
    sold sold si sold la la la sol
    fad fad fad fad fad fad fad fad
    fad fad fad fad fad fad la fad

    %94
    sol4 r si8 si si si
    do4 r dod8 dod dod dod
    re4 r red8 red red red

    %97
    mi4 r mi8 mi mi mi
    fad4 r fad8 fad fad fad
    sol4 r r2

    %100
    R1*4
    sol4 fad-+ sol16 sol, la si do re mi fad
    sol4 fad-+ sol16 sol, la si do re mi fad

    %106
    sol8 re sol la16 si la8 re, la' si16 do
    si8 re, sol la16 si la8 re, la' si16 do
    si8 sol si do16 si la sol la si la do si la\mbreak

    %109
    sol8 sol, sol' la16 sol fad mi fad sol fad la sol fad
    mi8 mi, mi' fad16 mi re8 mi16 fad sol4~
    sol fad8 sol16 fad mi8 fad16 sol la4~

    %112
    la sol8 la16 sol fad8 si16 la sol fad mi re
    dod8 la la'4 fad8-+ mi16 re mi8 dod-+
    re la la'4 fad8-+ mi16 re mi8 dod-+\mbreak

    %115
    re4 r8 re sol re16 do si re sol fad
    sol8 re16 do si re sol fad sol8 re16 do si re sol fa
    mi fad? mi re do8 mi la mi16 re dod mi la sol

    %118
    la8 mi16 re dod mi la sol la8 mi16 re dod mi la sol
    fad8-+ mi16 fad re mi fad re sol4 fad-+\mbreak
    sol16 sol, la si do re mi fad sol4 fad-+

    %121
    sol8 fad16 mi re do si la sol sol' fad mi re do si la
    sol la si do re8 re, sol4\fermata r

}

IvlIIn = \relative do'' {

    si4 la si r
    si la si r
    si8 sol r sol' sol4 fad-+

    %4
    sol8 sol, r sol' sol4 fad-+
    sol8 sol, sol' sol sol4 fad~
    fad8 sol16 fad mi2 re4~

    %7
    re8 mi16 re do2 si8 do16 si\mbreak
    la4 re2 do8 re16 do
    si8 dod re mi la, re16 dod si la sol fad

    %10
    mi4 r8 dod' re la sol mi
    fad fad' mi dod re la sol mi
    fad fad'16 sol fad8 mi re re re re

    %13
    re16 do si do re8 re re16 do si do re do si la\mbreak
    sol4 r8 sol'16 fad mi re dod re mi8 mi
    mi16 re dod re mi8 mi mi16 re dod re mi re dod si

    %16
    la4 r8 la si4 la-+
    si r si la-+
    si16 sol' fad mi re do si la sol sol' fad mi re do si la\mbreak

    %19
    sol la si do re8 re, sol4 re %%%%%%% fine ripresa
    si8\p la16 si sol4 sol r
    si r8 sol re'4 r8 re

    %22
    sol mi fad sol re4 r
    si r8 sol re'4 r8 re
    sol mi fad sol re4 r

    %25
    r8 re' sol,[mi'] r do fad,[re']
    r si mi,[dod'] r la re,4\mbreak
    r2 r4 r8 la'

    %28
    fad4 r8 fad sol4 la
    re, r8 re' sol,4 r8 sol
    re4 r8 re' dod la r4

    %31
    r8 re re sol,16 fad mi4 r
    r8 si' si mi,16 re dod4 r
    r8 sol' sol dod,16 si la4 r8 si

    %34
    si la r dod re re fad re\mbreak
    r mi sol mi r la dod la
    la4 r8 la re,4 r8 sol

    %37
    fad4\f mi_+ fad r
    fad mi-+ fad r
    fad8 re r re' re4 dod-+

    %40
    re8 re, r re' re4 dod-+
    re8 re, re'4~re8 mi16 re do8 re16 do
    si8 si mi mi mi re16 do re8 mi16 re\mbreak

    %43
    dod8 dod do re16 do si8 si si16 do re mi
    la,8 si16 dod re8 re re4 dod-+
    re16 la sol fad mi8 dod'_+ re16 la sol fad mi8 dod'8_+

    %46
    re fad re fad sol si16 la sol8 si,
    dod mi dod mi fad la16 sol fad8 la,\mbreak
    si re si re mi sol16 fad mi8 sol,

    %49
    la dod la dod re fad mi dod
    re la sol mi fad fad' mi dod
    re la sol mi re'4 la

    %52
    fad8\p mi16 fad re4 r2
    fad8 re r fad la la, r4
    r8 la' la, [la'] la4 r

    %55
    r r8 fad mi la, r4\mbreak
    r2 r4 si'8 sol
    re'4 re, re'8 si r4

    %58
    r2 r4 r8 si
    mi4 r8 mi mi4 r8 mi
    red4 r8 si si4 r8 mi,

    %61
    mi4 r8 la la4 r8 re,
    re4 r8 si sol4 do8 la'
    fad4 r8 si mi,4 r8 si'

    %64
    si,4 r8 si' sol4 r8 si\mbreak
    red,4 r8 fad mi4 mi'16 fad mi fad
    red4 r r2

    %67
    r r4 r16 mi\f re mi
    dod si la si dod re mi dod re8 re, r16 re' do re
    si la sol la si do re si do8 mi16 re do re do si

    %70
    la8 fad'16 mi re mi re do si8 sol'16 fad mi fad mi re\mbreak
    do8 la'16 sol fad sol fad mi re8 si'16 la sol8 mi
    la, la'16 sol fad8 re sol, sol'16 fad mi8 do

    %73
    fad, fad'16 mi re8 si mi, mi'16 re do8 la
    re, re'16 do si re do si la4 r
    r8 re, si[sol] r2

    %76
    r8 mi' dod[la] r2\mbreak
    r8 fad 'red[si] r2
    r8 sol' mi[do] r2

    %79
    r8 la' fad[re] re' si r sol
    do si r si si la r la
    la sol r sol sol fad r fad

    %82
    fad mi r mi mi4 re
    re r si' si
    si si do r

    %85
    dod dod dod dod\mbreak
    re4 r red red
    red? red mi sol,

    %88
    fad si~si lad8.-+ si16
    si8 si, red si mi mi mi mi
    mi mi mi mi mi mi mi mi

    %91
    mi mi mi mi mi mi do la
    re re re re re re re re\mbreak
    re re re re re re re re

    %94
    re4 r re8 re re sol
    sol4 r mi8 la la la
    la4 r fad8 fad fad si

    %97
    si4 r sol8 sol sol do
    do4 r la8 la la re
    re4 r r2

    %100
    R1*4
    si4 la si r
    si la si r

    %106
    si8 sol r sol' sol4 fad-+
    sol8 sol, r sol' sol4 fad-+
    sol8 sol, sol' sol sol4 fad~

    %109
    fad8 sol16 fad mi2 re4~
    re8 mi16 re do2 si8 do16 si\mbreak
    la4 re2 do8 re16 do

    %112
    si8 dod re mi la, re16 dod si la sol fad
    mi4 r8 dod' re la sol mi
    fad fad' mi dod re la sol mi

    %115
    fad fad'16 sol fad8 mi re re re re
    re16 do si do re8 re re16 do si do re do si la\mbreak
    sol4 r8 sol'16 fad mi re dod re mi8 mi

    %118
    mi16 re dod re mi8 mi mi16 re dod re mi re dod si
    la4 r8 la si4 la-+
    si r si la-+

    %121
    si16 sol' fad mi re do si la sol sol' fad mi re do si la\mbreak
    sol la si do re8 re, sol4\fermata r

}

IvlIIIn = \relative do'' {

    sol'4 fad-+ sol16 sol, la si do re mi fad
    sol4 fad-+ sol16 sol, la si do re mi fad
    sol8 re sol la16 si la8 re, la' si16 do

    %4
    si8 re, sol la16 si la8 re, la' si16 do
    si8 sol si do16 si la sol la si la do si la\mbreak
    sol8 sol, sol' la16 sol fad mi fad sol fad la sol fad

    %7
    mi8 mi, mi' fad16 mi re8 mi16 fad sol4~
    sol fad8 sol16 fad mi8 fad16 sol la4~
    la sol8 la16 sol fad8 si16 la sol fad mi re

    %10
    dod8 la la'4 fad8-+ mi16 re mi8 dod-+
    re la la'4 fad8-+ mi16 re mi8 dod-+\mbreak
    re4 r8 re sol re16 do si re sol fad

    %13
    sol8 re16 do si re sol fad sol8 re16 do si re sol fa
    mi fad? mi re do8 mi la mi16 re dod mi la sol
    la8 mi16 re dod mi la sol la8 mi16 re dod mi la sol

    %16
    fad8-+ mi16 fad re mi fad re sol4 fad-+\mbreak
    sol16 sol, la si do re mi fad sol4 fad-+
    sol8 fad16 mi re do si la sol sol' fad mi re do si la

    %19
    sol la si do re8 re, sol2 %%% fine
    R1*17

    %37
    re'4\f dod-+ re16 re, mi fad sol la si dod\mbreak
    re4 dod-+ re16 re, mi fad sol la si dod
    re8 la re mi16 fad mi8 la, mi' fad16 sol

    %40
    fad8 la, re mi16 fad mi8 la, mi' fad16 sol
    fad8 re fad sol16 fad mi8 mi la la
    la sol16 fad sol8 la16 sol fad8 fad si si

    %43
    si16 mi, fad sol la8 la la16 re, mi fad sol8 sol\mbreak
    sol fad16 mi fad sol la fad si la sol fad mi fad sol la
    fad8 mi16 re dod la' sol la fad8 mi16 re dod la' sol la

    %46
    fad8 re fad re si'16 la sol fad mi sol fad sol
    mi8 dod mi dod la'16 sol fad mi re fad mi fad\mbreak
    re8 si re si  sol'16 fad mi re dod mi re mi

    %49
    dod8 la dod la fad'8 re la'4
    fad8-+ mi16 re mi8 dod-+ re la la'4
    fad8-+ mi16 re mi8 dod-+ re2

    %52
    R1*15

    %67
    r4 r16 si'\f la si sold fad mi fad sold la si sol
    la8 la, r16 la' sol? la fad mi re mi fad sol la fad
    sol8 sol, r16 sol' fad sol mi8 mi mi mi

    %70
    fad fad fad fad sol sol sol sol
    la la la la si sol mi la
    fad[re re sol16 fad] mi8 [do do fad16 mi]

    %73
    re8 [si si mi16 re] do8[la la re16 do]\mbreak
    si8 sol sol'16 si la sol fad8 la, re,4
    R1*8

    %83
    sol16 sol'\f fad mi re do si la sol sol' fad mi re do si la\mbreak
    sol sol' fad mi re mi fa re mi la sol fad mi re dod si

    %85
    la la' sol fad mi re dod si la la' sol fad mi fad sol mi
    fad si la sol fad mi red do si si' la sol fad mi red do
    si si' la sol fad sol la fad sol la sol fad mi re dod si

    %88
    lad8 fad'16 mi fad si, si' la sol fad mi re dod8.-+si16
    si4 r r2

    %90
    R1*14
    sol'4 fad-+ sol16 sol, la si do re mi fad
    sol4 fad-+ sol16 sol, la si do re mi fad

    %106
    sol8 re sol la16 si la8 re, la' si16 do
    si8 re, sol la16 si la8 re, la' si16 do
    si8 sol si do16 si la sol la si la do si la\mbreak

    %109
    sol8 sol, sol' la16 sol fad mi fad sol fad la sol fad
    mi8 mi, mi' fad16 mi re8 mi16 fad sol4~
    sol fad8 sol16 fad mi8 fad16 sol la4~

    %112
    la sol8 la16 sol fad8 si16 la sol fad mi re
    dod8 la la'4 fad8-+ mi16 re mi8 dod-+
    re la la'4 fad8-+ mi16 re mi8 dod-+\mbreak

    %115
    re4 r8 re sol re16 do si re sol fad
    sol8 re16 do si re sol fad sol8 re16 do si re sol fa
    mi fad? mi re do8 mi la mi16 re dod mi la sol

    %118
    la8 mi16 re dod mi la sol la8 mi16 re dod mi la sol
    fad8-+ mi16 fad re mi fad re sol4 fad-+\mbreak
    sol16 sol, la si do re mi fad sol4 fad-+

    %121
    sol8 fad16 mi re do si la sol sol' fad mi re do si la
    sol la si do re8 re, sol4\fermata r

}

Ivlan = \relative do'{

    re4 re re r
    re re re r
    re8 re re re re4 r8 re

    %4
    re8 re re re re4 r8 re
    re4 r8 re re re re16 mi re do
    si8 si si si si4 r8 sol'

    %7
    sol sol, sol' sol sol4 r8 re
    re la' la la la4 r8 la\mbreak
    re,4 r re8 re mi mi

    %10
    mi4 r8 la la la, r la'
    la la, r la' la la, la' la
    la la la la si4 r8 si

    %13
    si si, r si' si si, r si'
    do4 r la8 la, r la'
    la la, r la' la la, r mi'

    %16
    re4 r8 re re4 re\mbreak
    re r re re
    re16 sol fad mi re do si la sol sol' fad mi re do si la

    %19
    sol la si do re8 re, sol'4 re
    si16\p la si8 sol4 sol r
    si r8 sol re'4 r8 re

    %22
    sol mi fad sol re4 r
    si r8 sol re'4 r8 re
    sol mi fad sol re4 r

    %25
    R1*2\mbreak
    r2 r4 r8 la'
    fad4 r8 fad sol4 la

    %29
    re, r8 mi la4 r8 la
    re,4 r r2
    R1*3

    %34
    r2 r8 re\p fad re
    r mi sol mi r la dod la
    R1

    %37
    la4\f la la r
    la la la r
    la la la r8 la\mbreak

    %40
    la4 r8 la la4 la
    la r8 la la4 r8 mi
    mi4 r8 si' si4 r8 mi,

    %43
    mi4 re re mi
    dod la' sol8 si la la
    la4 r8 la la4 r8 la

    %46
    la4 r8 la re,4 si'8 la16 sol
    la4 r8 la re,4 la'8 sol16 fad
    sol4 r8 sol dod,4 sol'8 fad16 mi\mbreak

    %49
    fad4 r8 la la4 r8 la
    la4 si8 la la4 r8 la
    la4 si8 sol re'4 la

    %52
    fad8\p mi16 fad re4 r2
    R1*3
    r2 r4 si'8 sol

    %57
    re'4 re, r2
    R1*9
    r2 si'8 \f si si si

    %68
    mi, mi mi la la la la la
    re, re re sol sol sol, r la\mbreak
    la4 r8 si si4 r8 do

    %71
    do4 r8 re re re mi mi
    re4 re'8 re re4 do8 do
    do4 si8 si si4 la8 la

    %74
    la4 sol8 re r2
    R1*8
    r2 re4 re

    %84
    re sol sol r
    mi mi mi la
    la r fad fad

    %87
    fad si si dod\mbreak
    dod? si si8 sol fad mi
    red4 r r2

    %90
    R1
    r8 si' si si la4 r
    R1

    %93
    r2 r8 la la la
    sol4 r re8 re re re
    do4 r mi8 mi mi  mi

    %96
    re4 r fad8 fad fad fad
    mi4 r sol8 sol sol sol
    fad4 r la8 la la la

    %99
    sol4 r r2
    R1*4
    re4 re re r

    %105
    re re re r
    re8 re re re re4 r8 re
    re8 re re re re4 r8 re

    %108
    re4 r8 re re re re16 mi re do
    si8 si si si si4 r8 sol'
    sol sol, sol' sol sol4 r8 re

    %111
    re la' la la la4 r8 la\mbreak
    re,4 r re8 re mi mi
    mi4 r8 la la la, r la'

    %114
    la la, r la' la la, la' la
    la la la la si4 r8 si
    si si, r si' si si, r si'

    %117
    do4 r la8 la, r la'
    la la, r la' la la, r mi'
    re4 r8 re re4 re\mbreak

    %120
    re r re re
    re16 sol fad mi re do si la sol sol' fad mi re do si la
    sol la si do re8 re, sol2\fermata

}

Ifgn = \relative do {

    sol'4 re sol, r
    sol' re sol, r
    sol'8 la si sol re' re, re re

    %4
    sol sol, sol sol' re' re, re re
    sol, sol' sol sol, re'4 r8 re\mbreak
    mi fad sol mi si'4 r8 si,

    %7
    do re mi do sol'4 sol,
    re' re, la' fad
    sol8 la si dod re4 sol

    %10
    la8 si dod la re fad, sol la
    re, re' dod la re fad, sol la\mbreak
    re, re'16 mi re8 do si la sol la

    %13
    si la sol la si4 sol
    do8 re mi re dod si la si
    dod si la si dod4 la

    %16
    re8 do? si la sol4 re
    sol, r sol' re\mbreak
    sol8 fad16 mi re do si la sol sol' fad mi re do si la

    %19
    sol la si do re8 re, sol4 r
    R1*17
    re''4\f la re, r\mbreak

    %38
    re' la re, r
    re'8 re, fad re la'4 la,
    re8 mi fad re la'4 la,

    %41
    re r8 re la'4 la,
    mi'8 mi mi mi, si' si'16 la sold8 mi\mbreak
    la, la'16 sol fad8 re sol, sol'16 fad mi8 do

    %44
    fad4 re sol8 mi la la,
    re, re' la' la, re, re' la' la,
    re4 r8 re sol mi16 fad sol8 mi

    %47
    la la, la' sol fad re16 mi fad8 re
    sol sol, sol' fad mi dod16 re mi8 dod\mbreak
    fad fad, fad' mi re re' dod la

    %50
    re fad, sol la re, re' dod la
    re fad, sol la re,4 r
    R1*15
    r2 mi8 \f mi mi mi,


    %68
    la la' la la re, re re re,
    sol sol' sol sol do,4 r8 la
    re4 r8 si mi4 r8 do\mbreak

    %71
    fad4 r8 re sol4 do,
    re r8 si' do4 r8 la
    si4 r8 sol la4 r8 fad

    %74
    sol sol sol sol re'4 r
    R1*8
    r2 sol,4\f sol

    %84
    sol sol do, r
    la' la la la

    %86
    re, r si' si
    si si mi, mi
    mi re mi fad

    %89
    si, r r2
    R1*14


    %104
    sol'4 re sol, r
    sol' re sol, r
    sol'8 la si sol re' re, re re

    %107
    sol sol, sol sol' re' re, re re
    sol, sol' sol sol, re'4 r8 re\mbreak
    mi fad sol mi si'4 r8 si,

    %110
    do re mi do sol'4 sol,
    re' re, la' fad
    sol8 la si dod re4 sol

    %113
    la8 si dod la re fad, sol la
    re, re' dod la re fad, sol la\mbreak
    re, re'16 mi re8 do si la sol la

    %116
    si la sol la si4 sol
    do8 re mi re dod si la si
    dod si la si dod4 la

    %119
    re8 do? si la sol4 re
    sol, r sol' re\mbreak
    sol8 fad16 mi re do si la sol sol' fad mi re do si la

    %122
    sol la si do re8 re, sol4\fermata r

}

Ibcn = \relative do {

    sol'4 re sol, r
    sol' re sol, r
    sol'8 la si sol re' re, re re

    %4
    sol sol, sol sol' re' re, re re
    sol, sol' sol sol, re'4 r8 re\mbreak
    mi fad sol mi si'4 r8 si,

    %7
    do re mi do sol'4 sol,
    re' re, la' fad
    sol8 la si dod re4 sol

    %10
    la8 si dod la re fad, sol la
    re, re' dod la re fad, sol la\mbreak
    re, re'16 mi re8 do si la sol la

    %13
    si la sol la si4 sol
    do8 re mi re dod si la si
    dod si la si dod4 la

    %16
    re8 do? si la sol4 re
    sol, r sol' re\mbreak
    sol8 fad16 mi re do si la sol sol' fad mi re do si la

    %19
    sol la si do re8 re, sol'4 re
    si8\p la16 si sol4 r2
    R1

    %22
    r2 r8 re'16 do si8 la
    sol4 r r2
    r r8 re'16 do si8 la\mbreak

    %25
    sol4 r8 sol' fad4 r8 fad
    mi4 r8 la re,4 r8 fad
    sol la si sol la4 r

    %28
    R1*2
    r8 re,16 mi fad8 re la' la, r4
    r8 fad' sol [mi] la4 r

    %32
    r8 re, mi dod fad4 r
    r8 si, dod la re re, re'4~\mbreak
    re dod8 la re4 r8 re

    %35
    sol4 r8 mi la4 r8 la,
    re4 r8 la' si fad sol la
    re4 \f la re, r

    %38
    re' la re, r
    re'8 re, fad re la'4 la,
    re8 mi fad re la'4 la,

    %41
    re r8 re la'4 la,
    mi'8 mi mi mi, si' si'16 la sold8 mi\mbreak
    la, la'16 sol fad8 re sol, sol'16 fad mi8 do

    %44
    fad4 re sol8 mi la la,
    re, re' la' la, re, re' la' la,
    re4 r8 re sol mi16 fad sol8 mi

    %47
    la la, la' sol fad re16 mi fad8 re
    sol sol, sol' fad mi dod16 re mi8 dod\mbreak
    fad fad, fad' mi re re' dod la

    %50
    re fad, sol la re, re' dod la
    re fad, sol la re4 la
    fad8\p mi16 fad re8 la re4 r

    %53
    r fad8 re r la' dod la
    re re, dod re la' la, la' sol\mbreak
    fad mi fad re la' la, dod la

    %56
    re re' do! si16 la si8 sol r4
    r r8 re sol4 r8 sol,
    la si do la si4 r8 sol'

    %59
    do4 r8 do fad,4 r8 fad
    si4 r8 si mi,4 r8 mi
    la4 r8 la re,4 r8 re\mbreak

    %62
    sol4 r8 sol, do2
    si1^\tasto~
    si~

    %65
    si~
    si2. sol4
    la si mi8\f mi mi mi,

    %68
    la la' la la re, re re re,
    sol sol' sol sol do,4 r8 la
    re4 r8 si mi4 r8 do\mbreak

    %71
    fad4 r8 re sol4 do,
    re r8 si' do4 r8 la
    si4 r8 sol la4 r8 fad

    %74
    sol sol sol sol re'4 r8 re
    si4\p sol do r8 do,
    dod4 r8 la re4 r8 re

    %77
    red4 si mi r8 mi
    mi4 do fad r8 fad
    fad4 re sol r8 sol\mbreak

    %80
    fad4 r8 fad mi4 r8 mi
    re4 r8 re do4 r8 do
    si4 r8 si la4 re

    %83
    sol, r sol'\f sol
    sol sol do, r
    la' la la la

    %86
    re, r si' si
    si si mi, mi
    mi re mi fad

    %89
    si, r r2
    R1
    r8 mi\p mi mi la4 r

    %92
    R1
    r2 r8 re, re re
    sol4 r sol8 sol sol sol

    %95
    do,4 r la'8 la la la
    re,4 r si'8 si si si
    mi,4 r do'8 do do do

    %98
    fad,4 r re'8 re re re\mbreak
    sol,4 r8 si, do4 do'
    si sol do, re

    %101
    mi fad sol8 si la sol
    fad mi fad re sol4 r8 la
    si4 do re8 mi do re

    %104
    sol,4 re sol, r
    sol' re sol, r
    sol'8 la si sol re' re, re re

    %107
    sol sol, sol sol' re' re, re re
    sol, sol' sol sol, re'4 r8 re\mbreak
    mi fad sol mi si'4 r8 si,

    %110
    do re mi do sol'4 sol,
    re' re, la' fad
    sol8 la si dod re4 sol

    %113
    la8 si dod la re fad, sol la
    re, re' dod la re fad, sol la\mbreak
    re, re'16 mi re8 do si la sol la

    %116
    si la sol la si4 sol
    do8 re mi re dod si la si
    dod si la si dod4 la

    %119
    re8 do? si la sol4 re
    sol, r sol' re\mbreak
    sol8 fad16 mi re do si la sol sol' fad mi re do si la

    %122
    sol la si do re8 re, sol2\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    s2 <4>4 <7>
    s2 <4>4 <7>
    s2 <4>4 <3>
    <9> <6> <4> <3>
    <9> <6> <4> <3>
    <4> <3> <4> <5/>
    <9> <6>8 <5/> s4 <6 5>
    <_+>2 s4 <6 5>8 <_+>
    s4 <5/> s <6 5>8 <_+>
    s2 <6>
    <6> s
    s <5/>
    <5/> s
    s4 <6>8 <6> s2
    s1*2
    s4 <4>8 <7> s2
    <6>1
    s
    s2 s4 <6>8 <6>
    s1
    s2 s4 <6>8 <6>
    s4 <6> <7> <6>
    <7> <6+> s2
    <9>4 <6> <_+> s
    s1*2
    s2 <_+>
    s8 <6> <6 5>4 <_+>2
    s8 <6> <6 5>4 s2
    s8 <6> <5/>4 s <6>
    <2> <5/> s2
    <6 5> <_+>
    s4 s8 <_+> <5> <6> <6 5> <_+>
    s4 <_+> s2
    s4 <_+>s2
    s <4>4 <7 _+>
    s2 <4>4 <7 _+>
    s2 <4>4 <_+>
    <4> <3> <4> <5/>
    <9 _+> <5/> <9> <7>
    <9>2 <6 5>4 <_+>
    s <_+> s <_+>
    s2 <6 5>
    <7 _+> <6>
    <7> <6+ 5>
    <7> s4 <5/>
    s <6 5>8 <_+> s4 <5/>
    s <6 5>8 <_+> s4 <_+>
    <6>1
    s4 <6> s8 <_+> s4
    s <5/> <4>8 <_+> s4
    <6>2 <4>8 <_+> s4
    s2 <6>
    s1
    <9>4 <6> <_+> s8 <6>
    <7>2 <7>
    <7 _+> s
    <7> <7>
    <7> <7>4 <6>
    <_+>2 <6 4>
    <7 _+> <6 4>
    <7 _+> <6 4>
    <_+>2. <6>4
    <6 5> <7 4+> <_+>2
    <_+>1
    s2 <9>4 <8>
    <9> <8> <7> <6>
    <7> <5/> s <6 5>
    s4 s8 <6> <9>4 <8>
    <9> <8> <9> <8>
    <9> <8> s2
    s1
    <5/>
    <5/>
    <6>2 <7>
    <5/> s4 s8 <6>
    <7>4 <6> <7> <6>
    <7> <6> <7> <6>
    <7> <6> <7> <7>
    s1
    s
    <_+>
    s2 <_+>
    <_+> s4 <6+ 5>
    <4+> <6> <6+ 5> <_+>
    <_+>1
    s
    s8 <_+> s4 s2
    s1*3
    s2 <_+>
    s <_+>
    s <7>
    <7> <7>
    s4 s8 <6> <6 5>4 <4+>
    <6>2 <6 5>
    <7>4 <5/> s <6>
    <5/>2 s4 s8 <6>
    <6>4 <6 5> s <6 5>
    s1*2  %%%%% ripresa
    s2 <4>4 <7>
    s2 <4>4 <7>
    s2 <4>4 <3>
    <9> <6> <4> <3>
    <9> <6> <4> <3>
    <4> <3> <4> <5/>
    <9> <6>8 <5/> s4 <6 5>
    <_+>2 s4 <6 5>8 <_+>
    s4 <5/> s <6 5>8 <_+>
    s2 <6>
    <6> s
    s <5/>
    <5/> s
    s4 <6>8 <6> s2
    s1*2
    s4 <4>8 <7> s2

}

forma = {

    \key sol\major
    \time 4/4
    \tempo 2 = 60
    s1*122
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

IvlIII = {
    \Iglobal
    <<\IvlIIIn \forma>>

}


Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}


Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma>>

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

    si16 do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do\mbreak
    \appoggiatura do8 si la16 sol fad mi

    %4
    re8. do16 si do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do

    %7
    \appoggiatura do8 si la16 sol fad la
    sol4 r8
    R4.*7  %% fine ripresa

    %16
    r8 r si16 la
    \appoggiatura la8 sol \appoggiatura fad mi la16 sol
    \appoggiatura sol8 fad \appoggiatura mi re sol16 fad

    %19
    \appoggiatura fad8 mi8 mi8.(fad32 sol)
    dod,8-+ \appoggiatura si la mi'16 fa
    \appoggiatura fa?8 mi la, mi'16 sol

    %22
    \appoggiatura sol8 fad! mi la16 sol
    \appoggiatura sol8 fad8 mi16 re mi dod
    re8. mi16 re fa

    %25
    mi re mi fad? sol la\mbreak
    fad-+ mi fad re sol fad
    mi fa mi re do si

    %28
    la4-+ si16 do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do\mbreak

    %31
    \appoggiatura do8 si la16 sol fad mi
    re8. do16 si do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi

    %34
    \appoggiatura mi8 re \appoggiatura do si si'16 do
    \appoggiatura do8 si la16 sol fad la
    sol4 r8

    %37
    R4.*19
    r8 r re16 do
    sib-+ la sib8 sib'16 la

    %58
    sol-+ fad sol8 re16 do\mbreak
    sib8-+ mib16 re do sib
    la_+ sol la8 re16 do

    %61
    sib-+ la sib8 sib'16 la
    sol-+ fad sol re sol re
    do_+ sib la8._+ sol16

    %64
    sol4 r8
    R4.*7

    %72
    r8 r re'16 do
    \appoggiatura do8 si16 la (sol8) sol'16 fa
    \appoggiatura fa8 mib16 re(do8) do16 sib

    %75
    \appoggiatura sib8 la16 sol(fa8) fa'16 mib
    \appoggiatura mib8 re16 do (sib8) sib'16 la
    sol fa mib re do sib\mbreak

    %78
    \appoggiatura sib8 la16 sol(fa8) fa'16 do
    re mib do8.-+ sib16
    sib8. re16 re mib

    %81
    do-+ sib do8 fa16 mib
    re-+ do re sol sol fa
    mi-+ re mi8 la16 sol

    %84
    fad8.-+ mib!16 re do
    sib-+ la sib8 sib'16 la
    sol-+ fad sol8 re16 do\mbreak

    %87
    sib8-+ mib16 re do sib
    la_+ sol la8 re16 do
    sib-+ la sib8 sib'16 la

    %90
    sol-+ fad sol re sol re
    do_+ sib la8._+ sol16
    sol4.

    %93
    R4.*19
    r8 r si16 do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi

    %114
    \appoggiatura mi8 re \appoggiatura do si si'16 do\mbreak
    \appoggiatura do8 si la16 sol fad mi
    re8. do16 si do

    %117
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do
    \appoggiatura do8 si la16 sol fad la

    %120
    sol4 r8
    R4.*7
    R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvlIn =  \relative do'' {

    r8
    r r si16\p do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re do16 si la do

    %4
    si do si la sol[fad]
    sol8 re si'16 do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi

    %7
    \appoggiatura mi8 re do16 si la do
    si4 si16\f do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi

    %10
    \appoggiatura mi8 re \appoggiatura do si si'16 do\mbreak
    \appoggiatura do8 si la16 sol fad mi
    re8. do16 si do

    %13
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do
    \appoggiatura do8 si la16 sol fad la

    %16
    sol4 re8\p %%% fine ripresa OK
    re dod4-+
    re8 la r

    %19
    R4.
    r8 r dod16 re
    re8-+ dod r

    %22
    r r mi
    re dod16 si la sol
    fad4_+ si8\mbreak

    %25
    \appoggiatura la sol4 mi'8
    la,4 re8
    sol, la16 si la sol

    %28
    fad4 r8
    r r si16\p do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi

    %31
    \appoggiatura mi8 re do16 si la do
    si do si la sol fad
    sol8 re si'16 do

    %34
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re do16 si la do
    si4 si'16\f la

    %37
    \appoggiatura la8 sol \appoggiatura fad mi la16 sol
    \appoggiatura sol8 fad \appoggiatura mi re sol16 fad
    \appoggiatura fad8 mi8 mi8.(fad32 sol)

    %40
    \appoggiatura re8 dod8-+ \appoggiatura si la mi'16 fa
    \appoggiatura fa?8 mi la, mi'16 sol
    \appoggiatura sol8 fad! mi la16 sol

    %43
    \appoggiatura sol8 fad8 mi16 re mi dod
    re8. mi16 re fa
    mi re mi fad? sol la\mbreak

    %46
    fad-+ mi fad re sol fad
    mi fa mi re do si
    la4-+ si16 do

    %49
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do\mbreak
    \appoggiatura do8 si la16 sol fad mi
    re8. do16 si do

    %53
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do
    \appoggiatura do8 si la16 sol fad la

    %56
    sol4 r8
    r r re16\p do
    sib-+ la sib8 sib'16 la

    %59
    sol-+ fad sol8 sol,~
    sol fad16 sol la fad
    sol fad sol re re' do

    %62
    sib_+ la sib sol sib8
    la16_+ sol fad8._+ sol16
    sol4 re'16\f do

    %65
    sib-+ la sib8 sib'16 la
    sol-+ fad sol8 re16 do\mbreak
    sib8-+ mib16 re do sib

    %68
    la_+ sol la8 re16 do
    sib-+ la sib8 sib'16 la
    sol-+ fad sol re sol re

    %71
    do_+ sib la8._+ sol16
    sol4 r8
    re'16\p do si la sol8

    %74
    sol'16 fa? mib re do8
    do16 sib la sol fa8
    fa'16 mib re do sib8\mbreak

    %77
    sib'16 la sol fa mib re
    do sib la sol fa la
    sib do la8.-+ sib16

    %80
    sib8 fa sib
    sib la do
    do sib re

    %83
    re do16 re do sib
    la8._+ la16 sol fad
    sol4 re'16 do

    %86
    sib-+ la sib8 sib'16 la
    sol-+ fad sol8 sol,~
    sol fad16 sol la fad

    %89
    sol fad sol re re' do
    sib_+ la sib sol sib8
    la16_+ sol fad8._+ sol16

    %92
    sol4 re'16\f do
    si-+ la (sol8 )sol'16 fa
    \appoggiatura fa8 mib16 re(do8) do16 sib

    %95
    \appoggiatura sib8 la16 sol(fa8) fa'16 mib
    \appoggiatura mib8 re16 do (sib8) sib'16 la
    sol fa mib re do sib\mbreak

    %98
    \appoggiatura sib8 la16 sol(fa8) fa'16 do
    re mib do8.-+ sib16
    sib8. re16 re mib

    %101
    do-+ sib do8 fa16 mib
    re-+ do re sol sol fa
    mi-+ re mi8 la16 sol

    %104
    fad8.-+ mib!16 re do
    sib-+ la sib8 sib'16 la
    sol-+ fad sol8 re16 do\mbreak

    %107
    sib8-+ mib16 re do sib
    la_+ sol la8 re16 do
    sib-+ la sib8 sib'16 la

    %110
    sol-+ fad sol re sol re
    do_+ sib la8._+ sol16
    sol4 r8

    %113
    r8 r si16\p do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi

    %116
    \appoggiatura mi8 re do16 si la do
    si do si la sol[fad]
    sol8 re si'16 do

    %119
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re do16 si la do
    si4 si16\f do

    %122
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do\mbreak
    \appoggiatura do8 si la16 sol fad mi

    %125
    re8. do16 si do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do

    %128
    \appoggiatura do8 si la16 sol fad la
    sol4\fermata r8

}

IIvlIIn = \relative do'' {

    r8
    sol,4.\p~
    sol
    sol'8 do, re

    %4
    sol,4.~
    sol~
    sol

    %7
    sol'8 do, re
    sol,4 re'16\f mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do

    %10
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re do16 si la do
    si do si la sol fad

    %13
    sol8 re si'16 do\mbreak
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re do16 si la do

    %16
    si4 sol16\p fad  %%% ripresa
    mi8 la la,
    re4 r8

    %19
    R4.
    r8 r la'16 re,
    la'8 la, r

    %22
    r r la'
    la4 la8
    la re, si

    %25
    do4 dod8
    re4 re8
    re do mi\mbreak

    %28
    re16 mi re do si la
    sol4.~\p
    sol

    %31
    sol'8 do, re
    sol,4.~
    sol~

    %34
    sol
    sol'8 do, re
    sol,4 re''8\f~

    %37
    re dod4-+
    re4 re8
    si4 sol8

    %40
    mi4 dod'16 re
    re8-+ dod dod
    re dod mi

    %43
    la,16 re dod si la sol\mbreak
    fad8 si8. la16
    sol4 mi'8

    %46
    re4 re8
    sol, la16 si la sol
    fad4_+ re16 mi

    %49
    \appoggiatura mi8 re \appoggiatura do si si'16 do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re do16 si la do

    %52
    si do si la sol fad
    sol8 re si'16 do\mbreak
    \appoggiatura do8 si \appoggiatura la sol re'16 mi

    %55
    \appoggiatura mi8 re do16 si la do
    si4 r8
    sol,4.\p~

    %58
    sol
    sol'8 do,4
    re re8

    %61
    sol,4.~
    sol4 sol'8
    do, re4

    %64
    sol, sib'16\f la
    sol_+ fad sol8 re'16 do
    sib-+ la sib8 sib'16 la

    %67
    sol-+ fad sol8 sol,~
    sol fad16 sol la fad\mbreak
    sol fad sol re re' do

    %70
    sib_+ la sib8. sib16
    la_+ sol fad8._+ sol16
    sol4 r8

    %73
    R4.*7
    r8 fa\p fa
    fa4 fa8

    %82
    fa4 sol8
    sol do, mib
    re4.

    %85
    sol,~
    sol
    sol'8 do,4

    %88
    re re8
    sol,4.~
    sol4 sol'8\mbreak

    %91
    do, re4
    sol,4.
    re'8. re'16\f si8

    %94
    do do, r
    do8. do'16 la8
    sib \once\stemUp sib, fa''

    %97
    sib,16 la sol fa  mib re
    do4 la'8
    sib16 do la8. -+ sib16

    %100
    sib8 fa sib
    sib la do
    do sib re

    %103
    re do16 re do sib
    la8. la16 sol fad\mbreak
    sol4 re'16 do

    %106
    sib -+ la sib8 sib'16 la
    sol-+ fad sol8 sol,~
    sol fad16 sol la fad

    %109
    sol fad sol re re' do
    sib_+ la sib8. sib16
    la_+ sol fad8._+ sol16

    %112
    sol4 r8
    sol,4.\p~
    sol

    %115
    sol'8 do, re
    sol,4.~
    sol~

    %118
    sol
    sol'8 do, re
    sol,4 re'16\f mi

    %121
    \appoggiatura mi8 re \appoggiatura do si si'16 do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re do16 si la do

    %124
    si do si la sol fad
    sol8 re si'16 do\mbreak
    \appoggiatura do8 si \appoggiatura la sol re'16 mi

    %127
    \appoggiatura mi8 re do16 si la do
    si4\fermata r8

}

IIvlIIIn = \relative do'' {

    r8
    R4.*7
    r8 r si16\f do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi

    %10
    \appoggiatura mi8 re \appoggiatura do si si'16 do\mbreak
    \appoggiatura do8 si la16 sol fad mi
    re8. do16 si do

    %13
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do
    \appoggiatura do8 si la16 sol fad la

    %16
    sol4 r8 %%% fine ripresa OK
    R4.*19
    r8 r si16\f la

    %37
    \appoggiatura la8 sol \appoggiatura fad mi la16 sol
    \appoggiatura sol8 fad \appoggiatura mi re sol16 fad
    \appoggiatura fad8 mi8 mi8.(fad32 sol)

    %40
    \appoggiatura re8 dod8 \appoggiatura si la mi'16 fa
    \appoggiatura fa?8 mi la, mi'16 sol
    \appoggiatura sol8 fad! mi la16 sol

    %43
    \appoggiatura sol8 fad8 mi16 re mi dod
    re8. mi16 re fa
    mi re mi fad? sol la\mbreak

    %46
    fad-+ mi fad re sol fad
    mi fa mi re do si
    la4_+ si16 do

    %49
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do\mbreak
    \appoggiatura do8 si la16 sol fad mi
    re8. do16 si do

    %53
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do
    \appoggiatura do8 si la16 sol fad la

    %56
    sol4 r8
    R4.*7
    r8 r re16\f do

    %65
    sib-+ la sib8 sib'16 la
    sol-+ fad sol8 re16 do\mbreak
    sib8-+ mib16 re do sib

    %68
    la_+ sol la8 re16 do
    sib-+ la sib8 sib'16 la
    sol-+ fad sol re sol re

    %71
    do_+ sib la8._+ sol16
    sol4 r8
    R4.*19

    %92
    r8 r re'16\f do
    si-+ la (sol8 )sol'16 fa
    \appoggiatura fa8 mib16 re(do8) do16 sib

    %95
    \appoggiatura sib8 la16 sol(fa8) fa'16 mib
    \appoggiatura mib8 re16 do (sib8) sib'16 la
    sol fa mib re do sib\mbreak

    %98
    \appoggiatura sib8 la16 sol(fa8) fa'16 do
    re mib do8.-+ sib16
    sib8. re16 re mib

    %101
    do-+ sib do8 fa16 mib
    re-+ do re sol sol fa
    mi-+ re mi8 la16 sol

    %104
    fad8.-+ mib!16 re do
    sib-+ la sib8 sib'16 la
    sol-+ fad sol8 re16 do\mbreak

    %107
    sib8-+ mib16 re do sib
    la_+ sol la8 re16 do
    sib-+ la sib8 sib'16 la

    %110
    sol-+ fad sol re sol re
    do_+ sib la8._+ sol16
    sol4 r8

    %113
    R4.*7
    r8 r si16\f do
    \appoggiatura do8 si \appoggiatura la sol re'16 mi

    %122
    \appoggiatura mi8 re \appoggiatura do si si'16 do\mbreak
    \appoggiatura do8 si la16 sol fad mi
    re8. do16 si do

    %125
    \appoggiatura do8 si \appoggiatura la sol re'16 mi
    \appoggiatura mi8 re \appoggiatura do si si'16 do
    \appoggiatura do8 si la16 sol fad la

    %128
    sol4 \fermata r8

}

IIvlan = \relative do'{

    r8
    sol4.\p~
    sol
    sol'8 do, re

    %4
    sol,4.~
    sol~
    sol

    %7
    sol'8 do, re
    sol,4 re'8\f
    re4.~

    %10
    re
    re16 sol mi8 fad
    sol4 re8

    %13
    re4.-~
    re
    re8 mi re

    %16
    re4 sol16 \p fad\mbreak  %ripresa
    mi8 la la,
    re4 r8

    %19
    R4.
    r8 r la'16 re,
    la'8 la, r

    %22
    r r la'
    la16 re, mi4
    re r8

    %25
    do4 dod8
    re4 r8
    R4.*2

    %29
    sol,4.\p~
    sol
    sol'8 do, re

    %32
    sol,4.~
    sol~
    sol
    sol'8 do, re

    %36
    sol,4 si'8\f\mbreak
    si la la
    la4 sol8

    %39
    sol si4
    la4 la8
    la4 la8

    %42
    la4 la8
    la4 la8
    la sol sol

    %45
    sol4 do8
    la4 sol8
    sol do, mi

    %48
    re4 re8
    re4.~
    re

    %51
    re16 sol mi8 fad
    sol4 re8
    re4.~

    %54
    re\mbreak
    re8 mi re
    re4 r8

    %57
    sol,4.\p~
    sol
    sol'8 do,4

    %60
    re re8
    sol,4.~
    sol4 sol'8

    %63
    do, re4
    re4 re8\f
    re4.~

    %66
    re
    re8 do mib
    re4 re8

    %69
    re4.~
    re4 re8
    mib re la\mbreak

    %72
    sib4 r8
    R4.*7
    r8 fa'\p fa

    %81
    fa4 do8
    re4 re8
    mi?4 do8

    %84
    re4 r8
    sol,4.~
    sol

    %87
    sol'8 do,4
    re4 re8
    sol,4.~

    %90
    sol4 sol'8
    do, re4
    sol,4.

    %93
    sol'4\f sol8
    sol4 r8
    fa4 fa8\mbreak

    %96
    fa4 r8
    mib4 sol8
    fa4 fa8

    %99
    sib,16 sol' fa8 mib
    re4 fa8
    fa4 fa8

    %102
    fa4 sol8
    sol do, mib
    re4 re8

    %105
    re4.~
    re
    re8 do mib

    %108
    re4 re8
    re4.
    re4 re8

    %111
    mib re la\mbreak
    sib4 r8
    sol4.\p~

    %114
    sol
    sol'8 do, re
    sol,4.~

    %117
    sol~
    sol
    sol'8 do, re

    %120
    sol,4 re'8
    re4.\f~
    re

    %123
    re16 sol mi8 fad
    sol4 re8
    re4.-~

    %126
    re
    re8 mi re
    re4\fermata r8

}

IIfgn = \relative do {

    r8
    R4.*7
    r8 r sol'\f
    sol,4.~

    %10
    sol
    sol'8 do, re
    sol,4.~

    %13
    sol~
    sol
    sol'8 do, re

    %16
    sol,4 r8  %%fine ripresa
    R4.*19
    r8 r sol'16\f fad

    %37
    mi8 la la,
    re4 si'16 la
    sol4 mi8

    %40
    la4 la16 re,
    la'8 la, la'
    re la dod,

    %43
    re  la' la,
    re si sol
    do4 do8

    %46
    do4 si8
    do4 la8\mbreak
    re4 sol8

    %49
    sol,4.~
    sol
    sol'8 do, re

    %52
    sol,4.~
    sol~
    sol

    %55
    sol'8 do, re
    sol,4 r8
    R4.*7

    %64
    r8 r sol'\f
    sol,4.~
    sol

    %67
    sol'8 do,4
    re re,8
    sol4.~

    %70
    sol8. la16 sib8\mbreak
    do re re,
    sol4 r8

    %73
    R4.*19
    r8 r sol'\f
    sol4 sol,8

    %94
    do4 r8
    fa4 fa,8
    sib4 re8

    %97
    mib4 mib8\mbreak
    fa4 fa8
    sol16 mib fa8 fa,

    %100
    sib re sib
    fa'4 la,8
    sib4 si8

    %103
    do4 la8
    re16 mib re do sib la
    sol4.~

    %106
    sol
    sol'8\f do,4
    re re,8

    %109
    sol4.~
    sol8. la16 sib8
    do re re,

    %112
    sol4 r8
    R4.*7
    r8 r sol'

    %121
    sol,4.~
    sol
    sol'8 do, re

    %124
    sol,4.~
    sol~
    sol

    %127
    sol'8 do, re
    sol,4\fermata r8

}

IIbcn = \relative do {

    r8
    R4.*7
    r8 r sol'\f
    sol,4.~

    %10
    sol
    sol'8 do, re
    sol,4.~

    %13
    sol~
    sol
    sol'8 do, re

    %16
    sol,4 r8  %%fine ripresa
    R4.
    r8 r si'16^\p la

    %19
    sol4 mi8
    la  la, r
    r r la'

    %22
    re la dod
    re la la,
    re4 r8\mbreak

    %25
    R4.
    r8 r si
    do4 la8

    %28
    re4 r8
    R4.*7
    r8 r sol16\f fad

    %37
    mi8 la la,
    re4 si'16 la
    sol4 mi8

    %40
    la4 la16 re,
    la'8 la, la'
    re la dod,

    %43
    re  la' la,
    re si sol
    do4 do8

    %46
    do4 si8
    do4 la8\mbreak
    re4 sol8

    %49
    sol,4.~
    sol
    sol'8 do, re

    %52
    sol,4.~
    sol~
    sol

    %55
    sol'8 do, re
    sol,4 r8
    R4.*7

    %64
    r8 r sol'\f
    sol,4.~
    sol

    %67
    sol'8 do,4
    re re,8
    sol4.~

    %70
    sol8. la16 sib8\mbreak
    do re re,
    sol4 r8

    %73
    R4.*7
    r8 re' sib
    fa'4 la,8

    %82
    sib4 si8
    do4 la8
    re4 r8

    %85
    R4.*7
    r8 r sol\f
    sol4 sol,8

    %94
    do4 r8
    fa4 fa,8
    sib4 re8

    %97
    mib4 mib8\mbreak
    fa4 fa8
    sol16 mib fa8 fa,

    %100
    sib re sib
    fa'4 la,8
    sib4 si8

    %103
    do4 la8
    re16 mib re do sib la
    sol4.~

    %106
    sol
    sol'8\f do,4
    re re,8

    %109
    sol4.~
    sol8. la16 sib8
    do re re,

    %112
    sol4 r8
    R4.*7
    r8 r sol'

    %121
    sol,4.~
    sol
    sol'8 do, re

    %124
    sol,4.~
    sol~
    sol

    %127
    sol'8 do, re
    sol,4\fermata r8

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s4.*10
    s8 <6 5>4
    s4.*3
    s8 <6 5>4  %% fine ripresa
    s4.*2
    s8 s <6>
    <6 5>4.
    <_+>
    s8 s <_+>
    s <_+> <5/>
    s <_+> s
    s4.*2
    s8 s <6>
    <9> <8> <7>
    s4.*9
    <7>8 <7 _+> s
    s4 <6>8
    <6 5>4.
    <_+>4 s16 <_!>
    <4>8 <_+> s
    s <_+> <5/>
    s <_+> s
    s <6>4
    <6 5>4.
    <4+>4 <6>8
    <9> <8> <7>
    s4.*3
    s8 <6 5> s
    s4.*3
    s8 <6 5> s
    s4.*11
    s8 <6 5>4
    <4> <_+>8
    s4.*2
    <6 5>8 <4> <_+>
    s4.*8
    s8 <6> s
    <4> <3> <5/>
    <9> <8> <5/>
    <9> <8> <7>
    <_+>4.
    s4.*8
    <_!>4.
    s
    <7>
    s
    <6 5>
    <7>
    <5>16 <6 5> s4
    s4.
    <4>8 <3> <5/>
    <9> <8> <5/>
    <9> <8> <7>
    <_+>4.
    s
    s
    s8 <6 5>4
    <4>4 <7 _+>8
    s4.*2
    <6 5>8 <_+> s
    s4.*11
    s8 <6 5>4
    s4.*3
    s8 <6 5>4

}

forma = {

    \key sol\major
    \time 3/8
    \tempo 4 = 60
    \partial 8 s8
    s4.*56 \break
    \key sol\minor
    s4.*56\break
    \key sol\major
    \appoggiatura s8 s4.*16
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

IIvlIII = {
    \IIglobal
    <<\IIvlIIIn \forma>>

}


IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>

}


IIfg = {
    \IIglobal
    \clef bass
    <<\IIfgn \forma>>

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

    R4.*24
    sol'8 fad4-+
    sol8 fad16-+ mi re8

    %27
    mi re4-+
    do-+ si8
    mi16(re mi) re do si

    %30
    mi16(re mi) re do si
    mi16(re mi) re do si
    la4-+ la8

    %33
    re16(do re) mi re do
    si(la si) do re si\mbreak
    mi(re mi) fad mi re

    %36
    dod8-+ la mi'
    la16(sol la) si la sol
    fad(mi re) mi fad sol

    %39
    la fad si la sol fad
    mi8 la la
    la sol16 fad mi re

    %42
    dod8 la' la
    la sol16 fad mi re
    dod-+ si la si dod re

    %45
    mi(re dod) re mi fad\mbreak
    sol(fad mi) fad sol la
    fad(mi re) mi fad sol

    %48
    la(sol fad) sol la si
    la(sol fad) sol la si
    la8 si16 dod re8

    %51
    sol, sol sol
    sol  la16 sol fad mi
    fad8-+ mi la

    %54
    fad-+ mi la
    re, mi dod-+
    re4 r8

    %57
    R4.*27
    re8 dod4-+
    re8 dod16-+ si la8

    %86
    si la4_+
    sol_+ fad8
    si16(la si) la sol fad

    %89
    si16(la si) la sol fad
    si16(la si) la sol fad
    mi8 mi' fad-+

    %92
    sol16 mi dod mi la, sol'
    fad8-+ la si-+
    do16 la fad la re, do'

    %95
    si8 re, mi-+
    fa16 re si re sol, fa'
    mi8 mi fad!-+

    %98
    sol16 mi dod mi la, sol'
    fad8-+ fad sol-+
    la16 fad red fad si, la'

    %101
    sol mi(red mi) sol mi
    fad la red, fad si, la'
    sol mi(red mi) sol mi\mbreak

    %104
    la mi(red mi) la mi
    si' mi,(red mi) si' mi,
    do' la(sol la) fad la

    %107
    re, la'(sol  la) fad la
    si sol(fad sol) mi sol
    do, sol'(fad sol) mi sol

    %110
    la fad(mi fad) red fad
    si, fad'(mi fad) red fad\mbreak
    sol8 fad mi

    %113
    red-+ si r
    R4.*20
    r8 r si'

    %135
    do16(re do) si la sol
    fad8-+ re la'-+
    si16 do si la sol fad

    %138
    mi8-+ do sol'-+
    la16(si la) sol fad mi
    red8-+ si fad'-+

    %141
    sol16(la sol) fad mi re\mbreak
    dod re mi re dod si
    lad8-+ fad fad'16 mi

    %144
    re fad si, fad' si la
    sol la sol fad mi re
    dod mi la, mi' la sol

    %147
    fad sol fad mi re dod?
    si re sol, re' sol fad
    mi fad mi re dod si\mbreak

    %150
    lad dod? fad, dod' fad mi
    re8-+ si si'16 la
    sol fad mi re dod si

    %153
    lad8 fad si'16 la
    sol fad mi re dod si
    lad'8 fad si

    %156
    mi,16 re dod8.-+ si16
    si4 r8
    R4.*13

    %171
    sol'8 fad4-+\mbreak
    sol8 fad16-+ mi re8
    mi re4-+

    %174
    do-+ si8
    mi16(re mi) re do si
    mi16(re mi) re do si

    %177
    mi16(re mi) re do si
    la4-+ la8
    re16(do re) la sol la

    %180
    fad(mi fad) la sol la\mbreak
    re(do re) la sol la
    fad(mi fad) la sol la

    %183
    do(si do) mi re do
    si8-+ sol re'
    sol16(fad sol) re do re

    %186
    si(la si) re do re
    sol(fad sol) re do re
    si(la si) re do re\mbreak

    %189
    fa(mi fa) la sol fa
    mi8-+ do mi
    la16(sol la) mi re mi

    %192
    dod(si dod) mi re mi
    la(sol la) mi re mi
    dod(si dod) mi re mi

    %195
    sol(fad sol) si la sol
    fad8.-+ mi16 re do?\mbreak
    si(sol si) re sol re

    %198
    si(sol si) re sol re
    si(sol si) re sol re
    mi(re do) si la sol

    %201
    do8 do do
    do re16 do si la
    si do la8._+ sol16

    %204
    sol4.
    R4.*22
    R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIIvlIn =  \relative do'' {

    sol'16 re re re re re
    la' re, re re re re
    si' re, re re re re

    %4
    la' sol fad mi re8
    sol16\p re re re re re
    la' re, re re re re

    %7
    si' re, re re re re
    la'\f sol fad mi re do\mbreak
    si la sol la si do

    %10
    re do si do re mi
    fa mi re mi fa sol
    mi8-+ do mi16 re

    %13
    dod si la si dod re
    mi re dod re mi fad
    sol fad mi fad sol la

    %16
    fad8-+ re la'16 sol\mbreak
    fad mi re mi fad sol
    la sol fad sol la si

    %19
    do si la si do re
    si8.-+ la16 sol8
    si,16 do re8 sol

    %22
    si,16 do re8 sol
    si,16 do re8 re,
    sol4.

    %25
    sol8 \p la4_+
    si8 sol si
    do sol4

    %28
    fad_+ sol8
    sol4 r8\mbreak
    sol4 r8

    %31
    sol4 la8
    fad4 r8
    fad'4 r8

    %34
    re4 r8
    sol4 r8
    mi4 r8

    %37
    mi mi mi
    la,4 re8
    fad sol16 fad mi re

    %40
    dod4 la8
    si8. la16 sol fad
    mi4 la8

    %43
    si8. la16 sol fad\mbreak
    mi4 r8
    dod'16 si la si dod re

    %46
    mi re dod re mi dod
    re la si dod re mi
    fad mi re mi fad sol

    %49
    fad mi re mi fad sol
    fad mi fad sol fad sol
    mi re mi fad mi re

    %52
    dod8 dod dod\mbreak
    re dod dod
    re dod la


    %55
    fad sol mi
    re'16\f la la la la la
    mi' la, la la la la

    %58
    fad' la, la la la la
    mi' re dod si la8
    re16\p la la la la la

    %61
    mi' la, la la la la
    fad' la, la la la la
    mi'4 la,8\f

    %64
    re dod16 si la sol
    fad mi re mi fad sol
    la sol fad sol la si

    %67
    do si la si do re
    do si la si do re
    si8-+ sol re'

    %70
    sol fad16 mi re do\mbreak
    si la sol la si do
    re do si do re mi

    %73
    fa mi re mi fa sol
    fa mi re mi fa sol
    mi8-+ do mi

    %76
    la sol16 fad mi re
    dod si la si dod re
    mi re dod re mi fad\mbreak

    %79
    sol fad mi fad sol la
    sol fad mi fad sol la
    fad8.-+ mi16 re8

    %82
    mi la, dod-+
    re4.
    R4.*4

    %88
    sol,16\p fad sol fad mi re
    sol fad sol fad mi re
    sol fad sol fad mi re

    %91
    dod8 la r
    R4.*2\mbreak
    la''4\p la8

    %95
    re, si r
    R4.*2
    mi4 mi8

    %99
    la,4 r8
    R4.*3
    r8 r si

    %104
    mi,4 mi8
    mi4 sol8
    fad4 fad8

    %107
    fad4 re'8
    re4 sol,8
    mi4 do'8

    %110
    do4 la8
    red4 si8
    si la sol\mbreak

    %113
    fad4 si'8\f
    sold mi sold
    la la sol?

    %116
    fad re fad
    sol sol fad
    mi do mi

    %119
    fad fad mi
    red si red
    mi16 si mi si mi si

    %122
    fad' si, fad' si, fad' si,
    sol' si, sol' si, sol' si,\mbreak
    fad' si, fad' si, fad' si,

    %125
    mi red mi sol fad mi
    red si' si si si si
    si si si si si si

    %128
    la la la la la la
    la la la la la la
    sol sol sol sol sol sol

    %131
    sol sol sol sol sol sol\mbreak
    fad fad fad fad fad fad
    mi red mi sol fad mi

    %134
    red8 si r
    r mi\p do
    la' fad, fad

    %137
    sol re' si
    sol' mi, mi
    fad do' la

    %140
    fad' red, red
    mi si' sol
    mi' sol, sol\mbreak

    %143
    fad dod' lad
    si re re
    si si sol

    %146
    la mi' dod
    re la fad
    sol re' si

    %149
    dod sol mi
    fad dod' lad
    si4 r8

    %152
    R4.*5
    r16 si'\f si si si si
    mi, fa mi re do si\mbreak

    %159
    do mi do mi do mi
    la la la la la la
    re, mi re do si la

    %162
    si re si re si re
    sol fad sol re mi fa
    mi re mi fad sol mi

    %165
    la sol la mi fad sol\mbreak
    fad re fad re fad re
    sol re sol re sol re

    %168
    la' re, la' re, la' re,
    si' la si re do si
    la sol fad mi re8

    %171
    R4.*4
    do16\p si do si la sol
    do si do si la sol\mbreak

    %177
    do si do si la sol
    fad4 fad8
    la la r

    %180
    la la r
    la la r
    la la r

    %183
    fad la fad
    sol re r
    re' re r

    %186
    re re r
    re re r
    re re r\mbreak

    %189
    si re si
    do sol r
    mi' mi r

    %192
    mi mi r
    mi mi r
    mi mi r

    %195
    dod mi dod
    re la r
    re re si

    %198
    re re si
    re re re
    sol,4 mi8\mbreak

    %201
    la16 sol la si la sol
    fad4 fad8
    sol16 la fad8._+ sol16

    %204
    sol'16\f re re re re re
    la' re, re re re re
    si' re, re re re re

    %207
    la' sol fad mi re8
    sol16\p re re re re re
    la' re, re re re re

    %210
    si' re, re re re re
    la'\f sol fad mi re do\mbreak
    si la sol la si do

    %213
    re do si do re mi
    fa mi re mi fa sol
    mi8-+ do mi16 re

    %216
    dod si la si dod re
    mi re dod re mi fad
    sol fad mi fad sol la

    %219
    fad8-+ re la'16 sol\mbreak
    fad mi re mi fad sol
    la sol fad sol la si

    %222
    do si la si do re
    si8.-+ la16 sol8
    si,16 do re8 sol

    %225
    si,16 do re8 sol
    si,16 do re8 re,
    sol4.\fermata

}

IIIvlIIn = \relative do'' {

    sol'8 sol sol
    fad fad fad
    sol si sol

    %4
    fad4.
    sol8\p sol sol
    fad fad fad

    %7
    sol si sol
    fad16\f sol la sol fad mi
    re8 re, re'16 do

    %10
    si la sol la si do
    re do si do re si
    do4 r8

    %13
    r r mi16 re\mbreak
    dod si la si dod re
    mi re dod re mi dod

    %16
    re4 r8
    r r la'16 sol
    fad mi re mi fad sol

    %19
    la sol fad sol la fad
    sol4.
    si,16 do re8 sol

    %22
    si,16 do re8 sol
    si,16 do re8 re,
    sol4. %%%%% rirpesa

    %25
    sol8\p re4
    sol8 si sol
    do, si4

    %28
    la sol8\mbreak
    mi'4 r8
    mi4 r8

    %31
    mi4 mi8
    re4 r8
    re4 r8

    %34
    sol4 r8
    mi4 r8
    la4 r8

    %37
    la la la
    la,4 la'8
    la sol si

    %40
    la4 fad8
    sol sol,16 la si sol
    la4 re8

    %43
    re sol, si
    la4 r8
    la'4 r8

    %46
    la, la la
    re4 r8
    re'4 r8

    %49
    re, re re\mbreak
    re4 re'8
    dod16 si dod re dod re

    %52
    mi4 la,8
    re la la
    re la la

    %55
    re, si' la
    re\f re re
    dod dod dod

    %58
    re fad re
    dod4.
    re8 re re

    %61
    dod dod dod
    re fad re
    dod dod mi

    %64
    la,16 si la sol fad mi
    re4 la'16 sol
    fad mi re mi fad sol

    %67
    la sol fad sol la si
    la sol fad sol la fad
    sol la si8 si

    %70
    si la4_+
    sol8 r re'16 do
    si la sol la si do

    %73
    re do si do re mi
    re do si do re si
    do4.

    %76
    r8 r sol'16 fad\mbreak
    mi8 mi, mi'16 re
    dod si la si dod re

    %79
    mi re dod re mi fad
    mi re dod re mi dod
    re4 la8

    %82
    sol fad mi
    re4.
    R4.*4

    %88
    sol,8\p sol sol
    sol sol sol
    sol sol sol

    %91
    la4 r8
    R4.*2
    fad'8 re fad

    %95
    sol sol, r\mbreak
    R4.*2
    dod8 la dod

    %99
    re4 r8
    R4.*3
    r8 r mi

    %104
    do4 do8
    sol4 sol8
    la4 la8

    %107
    si4 si8
    sol4 sol8
    la4 la'8

    %110
    fad4 fad8
    sol4 sol8
    mi la,4

    %113
    si r8
    r r mi'\f
    dod la dod

    %116
    re re do!
    si sol si\mbreak
    do do si

    %119
    la fad la
    si si la
    sol4 mi'8~

    %122
    mi red4-+
    mi8 mi mi
    mi red red

    %125
    sol16 fad sol si la sol
    fad sol sol sol sol sol
    mi mi mi mi mi mi

    %128
    fad fad fad fad fad fad\mbreak
    red red red red red red
    mi mi mi mi mi mi

    %131
    mi mi mi mi mi mi
    mi mi mi mi red red
    mi fad sol si la sol

    %134
    fad4 r8
    r la,\p la
    re re, re

    %137
    re sol sol
    do do, do
    do fad fad\mbreak

    %140
    si si, si
    si mi mi
    sol mi mi

    %143
    dod lad' fad
    si fad re
    mi mi mi

    %146
    la dod la
    la re, re
    sol si sol

    %149
    sol dod, dod
    fad lad fad
    fad4 r8

    %152
    R4.*5
    r16 re'\f re re re re
    si la sold fad mi8\mbreak

    %159
    mi mi' mi
    do16 do do do do do
    la sol fad mi re8

    %162
    re4.
    re'8 re re
    sol, sol'16 fad mi re

    %165
    dod8 mi dod
    la4 la'8
    si si si

    %168
    fad re fad
    sol16 fad sol si la sol
    fad8-+ re r

    %171
    R4.*4
    do,8\p do do\mbreak
    do do do

    %177
    do do do
    re4 r8
    fad fad r

    %180
    re re r
    fad fad r
    re re r

    %183
    re re re
    re si r
    si' si r

    %186
    sol sol r
    si si r
    sol sol r

    %189
    sol sol sol
    sol mi r\mbreak
    dod' dod r

    %192
    la la r
    dod? dod r
    la la r

    %195
    la la la
    la fad r
    sol sol, sol'

    %198
    sol sol, sol'
    sol sol si,
    do do do

    %201
    la la la
    re4 re8
    sol, re' re

    %204
    sol'8\f sol sol
    fad fad fad
    sol si sol

    %207
    fad4.
    sol8\p sol sol
    fad fad fad

    %210
    sol si sol
    fad16\f sol la sol fad mi
    re8 re, re'16 do

    %213
    si la sol la si do
    re do si do re si
    do4 r8

    %216
    r r mi16 re\mbreak
    dod si la si dod re
    mi re dod re mi dod

    %219
    re4 r8
    r r la'16 sol
    fad mi re mi fad sol

    %222
    la sol fad sol la fad
    sol4.
    si,16 do re8 sol

    %225
    si,16 do re8 sol
    si,16 do re8 re,
    sol4.\fermata

}

IIIvlIIIn = \relative do'' {

    sol'16 re re re re re
    la' re, re re re re
    si' re, re re re re

    %4
    la' sol fad mi re8
    sol16\p re re re re re
    la' re, re re re re

    %7
    si' re, re re re re
    la'\f sol fad mi re do\mbreak
    si la sol la si do

    %10
    re do si do re mi
    fa mi re mi fa sol
    mi8-+ do mi16 re

    %13
    dod si la si dod re
    mi re dod re mi fad
    sol fad mi fad sol la

    %16
    fad8-+ re la'16 sol\mbreak
    fad mi re mi fad sol
    la sol fad sol la si

    %19
    do si la si do re
    si8.-+ la16 sol8
    si,16 do re8 sol

    %22
    si,16 do re8 sol
    si,16 do re8 re,
    sol4 r8

    %25
    R4.*31
    re'16\f la la la la la
    mi' la, la la la la

    %58
    fad' la, la la la la
    mi' re dod si la8
    re16\p la la la la la

    %61
    mi' la, la la la la
    fad' la, la la la la
    mi'4 la,8\f

    %64
    re dod16 si la sol
    fad mi re mi fad sol
    la sol fad sol la si

    %67
    do si la si do re
    do si la si do re
    si8-+ sol re'

    %70
    sol fad16 mi re do\mbreak
    si la sol la si do
    re do si do re mi

    %73
    fa mi re mi fa sol
    fa mi re mi fa sol
    mi8-+ do mi

    %76
    la sol16 fad mi re
    dod si la si dod re
    mi re dod re mi fad\mbreak

    %79
    sol fad mi fad sol la
    sol fad mi fad sol la
    fad8.-+ mi16 re8

    %82
    mi la, dod-+
    re4.
    R4.*29

    %113
    r8 r si'\f
    sold mi sold
    la la sol?

    %116
    fad re fad
    sol sol fad
    mi do mi

    %119
    fad fad mi
    red si red
    mi16 si mi si mi si

    %122
    fad' si, fad' si, fad' si,
    sol' si, sol' si, sol' si,\mbreak
    fad' si, fad' si, fad' si,

    %125
    mi red mi sol fad mi
    red si' si si si si
    si si si si si si

    %128
    la la la la la la
    la la la la la la
    sol sol sol sol sol sol

    %131
    sol sol sol sol sol sol\mbreak
    fad fad fad fad fad fad
    mi red mi sol fad mi

    %134
    red8 si r
    R4.*22
    r16 si'\f si si si si
    mi, fa mi re do si\mbreak

    %159
    do mi do mi do mi
    la la la la la la
    re, mi re do si la

    %162
    si re si re si re
    sol fad sol re mi fa
    mi re mi fad sol mi

    %165
    la sol la mi fad sol\mbreak
    fad re fad re fad re
    sol re sol re sol re

    %168
    la' re, la' re, la' re,
    si' la si re do si
    la sol fad mi re8

    %171
    R4.*33
    sol16\f re re re re re
    la' re, re re re re
    si' re, re re re re

    %207
    la' sol fad mi re8
    sol16\p re re re re re
    la' re, re re re re

    %210
    si' re, re re re re
    la'\f sol fad mi re do\mbreak
    si la sol la si do

    %213
    re do si do re mi
    fa mi re mi fa sol
    mi8-+ do mi16 re

    %216
    dod si la si dod re
    mi re dod re mi fad
    sol fad mi fad sol la

    %219
    fad8-+ re la'16 sol\mbreak
    fad mi re mi fad sol
    la sol fad sol la si

    %222
    do si la si do re
    si8.-+ la16 sol8
    si,16 do re8 sol

    %225
    si,16 do re8 sol
    si,16 do re8 re,
    sol4.\fermata

}

IIIvlan = \relative do'{

    si'8 si si
    la la la
    re, re re

    %4
    re4.
    si'8\p si si
    la la la

    %7
    re, re re
    re4.
    re16\f do si do re8

    %10
    re re re
    re re re
    sol,4 r8

    %13
    mi'8 mi mi
    mi mi mi16 re
    dod re mi8 mi

    %16
    la, r mi'\mbreak
    fad16 sol la8 la
    la la la16 sol

    %19
    fad sol la8 la
    re,4.
    si16 do re8 sol

    %22
    si,16 do re8 sol
    si,16 do re8 re,
    sol4. %%%ripresa

    %25
    sol'8\p re4
    sol8 si sol
    do, si4

    %28
    la sol8
    do4 r8
    do4 r8

    %31
    do4 la8\mbreak
    la4 r8
    re4 r8

    %34
    sol4 r8
    mi4 r8
    la4 r8

    %37
    mi mi mi
    re4 re8
    re4 mi8

    %40
    mi4 fad8
    sol sol,16 la si sol
    la4 fad'8

    %43
    fad mi mi
    mi4 r8
    mi4 r8

    %46
    mi mi  mi
    re4 r8
    la4 r8

    %49
    la la la\mbreak
    la4 r8
    la' la la

    %52
    la4 r8
    la4 r8
    la4 r8

    %55
    r sol sol
    fad\f fad fad
    mi mi mi

    %58
    la, la la
    la4.
    fad'8 \p fad fad

    %61
    mi mi mi
    la, la la
    la4.

    %64
    fad'8\f mi la
    la fad16 sol fad mi
    re8 re re\mbreak

    %67
    fad fad fad
    fad fad fad
    re4.

    %70
    re8 re re
    re re re
    re re re16 do

    %73
    si8 re si
    si re si
    sol4 r8

    %76
    mi' mi mi
    mi mi mi
    mi mi mi16 re

    %79
    dod8 mi dod
    dod? mi dod
    la4 la8

    %82
    si la sol\mbreak
    fad4 r8
    R4.*4

    %88
    sol8\p sol sol
    sol sol sol
    sol8. la16 si sol

    %91
    la4.
    mi'8 la la
    la fad sol

    %94
    fad re fad
    sol sol, r
    re' sol sol

    %97
    sol16 la sol fad mi re
    dod8 la dod
    re re mi

    %100
    fad si re
    si sol si\mbreak
    si4 si8

    %103
    si4 mi,8
    do4 do8
    sol4 sol8

    %106
    la4 la8
    si4 si8
    sol4 sol8

    %109
    la4 la'8
    fad4 fad8
    sol4 sol8

    %112
    mi la,4
    si r8
    si\f si mi

    %115
    mi mi mi
    la, la re
    re re re

    %118
    sol, sol do\mbreak
    do do do
    fad, fad si

    %121
    si si si
    si si si
    si si si'

    %124
    si si si
    sol mi do'
    si16 si si si si si

    %127
    do do do do do do
    do do do do do do
    si si si si si si

    %130
    si si si si si si\mbreak
    do do do do do do
    si si si si si si

    %133
    si la sol8 do
    si4 r8
    r la\p la

    %136
    re4 r8
    r sol, sol
    do4 r8

    %139
    r fad, fad
    si4 r8
    r mi, mi

    %142
    la4 r8
    r lad fad
    si4 r8

    %145
    r mi, mi
    la4 r8\mbreak
    r re, re

    %148
    sol4 r8
    r dod, dod
    fad4 r8

    %151
    R4.*6
    r16 fad\f fad fad fad fad
    sold8 si si

    %159
    la4 mi8
    mi16 mi mi mi mi mi
    fad8 la la

    %162
    sol4.
    re8 si re
    mi4.

    %165
    mi8 mi mi
    re re re
    re si re

    %168
    re fad re\mbreak
    re re re
    re4 r8

    %171
    R4.*4
    do8 do do
    do do do

    %177
    do do do
    re4 r8
    fad fad r

    %180
    re re r
    fad fad r
    re re r

    %183
    la' la la
    re,4 r8
    si' si r

    %186
    sol sol r
    si si r
    sol sol r

    %189
    re re re
    mi4 r8\mbreak
    dod' dod r

    %192
    la la r
    dod dod r
    la la r

    %195
    mi mi mi
    la,4 r8
    sol' sol, sol'

    %198
    sol sol, sol'
    sol sol sol,
    do do do

    %201
    la la la
    re4 re8
    sol, re' re,

    %204
    si''8\f si si
    la la la
    re, re re

    %207
    re4.
    si'8\p si si
    la la la

    %210
    re, re re
    re4.
    re16\f do si do re8

    %213
    re re re
    re re re
    sol,4 r8

    %216
    mi'8 mi mi
    mi mi mi16 re
    dod re mi8 mi

    %219
    la, r mi'\mbreak
    fad16 sol la8 la
    la la la16 sol

    %222
    fad sol la8 la
    re,4.
    si16 do re8 sol

    %225
    si,16 do re8 sol
    si,16 do re8 re,
    sol4.\fermata

}

IIIfgn = \relative do {

    sol'8 sol sol
    re re re
    sol sol sol

    %4
    re re'16 do si la
    sol8\p sol sol
    re re re

    %7
    sol sol sol
    re\f re re
    sol, sol sol

    %10
    sol' sol sol
    sol, sol sol
    do mi16 re do si

    %13
    la8 la la
    la' la la\mbreak
    la, la la

    %16
    re re' dod
    re, re re
    re' re re

    %19
    re, re re
    sol4.
    si,16 do re8 sol

    %22
    si,16 do re8 sol
    si,16 do re8 re,
    sol si re %%%5ripresa

    %25
    sol, r r
    R4.*30
    re'8\f re re

    %57
    la la la
    re re re,\mbreak
    la' la'16 sol fad mi

    %60
    re8\p re re
    la la la
    re re re,

    %63
    la' la'\f sol
    fad16 sol  la8 la,
    re, re re

    %66
    re' re re
    re, re re
    re' re re

    %69
    sol4.
    sol8 re' re,
    sol sol sol

    %72
    sol, sol sol
    sol' sol sol
    sol, sol sol\mbreak

    %75
    do8. re16 do si
    la4 r8
    la' la la

    %78
    la, la la
    la' la la
    la, la la

    %81
    re8. mi16 fad8
    sol la la,
    re r r

    %84
    R4.*29
    si8\f red si
    mi mi, mi'

    %115
    la, dod la
    re re, re'
    sol, si sol

    %118
    do do, do'
    fad, la fad
    si si si

    %121
    mi,4 mi'8
    si si si\mbreak
    mi mi mi

    %124
    si si si
    do do' la
    si16 sol sol sol sol sol

    %127
    do do do do do do
    fad, fad fad fad fad fad
    si si si si si si

    %130
    mi, mi mi mi mi mi
    la la la la la la
    si si si si si si

    %133
    mi,8 mi la\mbreak
    si16 la sol8 mi
    la4 r8

    %136
    R4.*21
    si8\f si, si'
    sold mi sold
    la4.

    %160
    la8 la, la'
    fad re fad
    sol4.

    %163
    si8 sol si
    do do si
    la dod la

    %166
    re, re' do?
    si4 sol8
    re re re

    %169
    sol sol sol,
    re' r r
    R4.*33

    %204
    sol8 \f sol sol
    re re re
    sol sol sol

    %207
    re re'16 do si la
    sol8\p sol sol
    re re re

    %210
    sol sol sol
    re\f re re
    sol, sol sol

    %213
    sol' sol sol
    sol, sol sol
    do mi16 re do si

    %216
    la8 la la
    la' la la\mbreak
    la, la la

    %219
    re re' dod
    re, re re
    re' re re

    %222
    re, re re
    sol4.
    si,16 do re8 sol

    %225
    si,16 do re8 sol
    si,16 do re8 re,
    sol4.\fermata

}

IIIbcn = \relative do {

    sol'8 sol sol
    re re re
    sol sol sol

    %4
    re re'16 do si la
    sol8\p sol sol
    re re re

    %7
    sol sol sol
    re\f re re
    sol, sol sol

    %10
    sol' sol sol
    sol, sol sol
    do mi16 re do si

    %13
    la8 la la
    la' la la\mbreak
    la, la la

    %16
    re re' dod
    re, re re
    re' re re

    %19
    re, re re
    sol4.
    si,16 do re8 sol

    %22
    si,16 do re8 sol
    si,16 do re8 re,
    sol si re %%%5ripresa

    %25
    sol, r r
    R4.*3
    do4\p r8

    %30
    do4 r8
    do do do
    re4 r8

    %33
    R4.*4\mbreak
    dod8 dod dod
    re4 re'8

    %39
    re sol,4
    la r8
    R4.

    %42
    r8 r fad
    sol8. la16 si sol
    la4.

    %45
    la,\tasto~
    la~
    la~

    %48
    la~
    la~
    la~

    %51
    la~
    la~
    la~

    %54
    la4 la8
    si sol la
    re\f re re

    %57
    la la la
    re re re,\mbreak
    la' la'16 sol fad mi

    %60
    re8\p re re
    la la la
    re re re,

    %63
    la' la'\f sol
    fad16 sol  la8 la,
    re, re re

    %66
    re' re re
    re, re re
    re' re re

    %69
    sol4.
    sol8 re' re,
    sol sol sol

    %72
    sol, sol sol
    sol' sol sol
    sol, sol sol\mbreak

    %75
    do8. re16 do si
    la4 r8
    la' la la

    %78
    la, la la
    la' la la
    la, la la

    %81
    re8. mi16 fad8
    sol la la,
    re la'16 sol fad mi

    %84
    re8 mi4\p
    fad8 re fad
    sol fad4

    %87
    mi8 la re,
    R4.*4
    dod'8 la dod

    %93
    re re, r
    R4.*2
    si'8 sol si\mbreak

    %97
    do do, r
    R4.*2
    red'8 si red

    %101
    mi si mi
    red si red
    mi4 r8

    %104
    R4.*9
    si,8\f red si
    mi mi, mi'

    %115
    la, dod la
    re re, re'
    sol, si sol

    %118
    do do, do'
    fad, la fad
    si si si

    %121
    mi,4 mi'8
    si si si\mbreak
    mi mi mi

    %124
    si si si
    do do' la
    si16 sol sol sol sol sol

    %127
    do do do do do do
    fad, fad fad fad fad fad
    si si si si si si

    %130
    mi, mi mi mi mi mi
    la la la la la la
    si si si si si si

    %133
    mi,8 mi la\mbreak
    si16 la sol8 mi
    la4\p r8

    %136
    r re re
    sol,4 r8
    r8 do do

    %139
    fad,4 r8
    r si si
    mi,4 r8

    %142
    r mi mi
    fad4 r8
    r si si,

    %145
    mi4 r8
    r la la,
    re4 r8

    %148
    r sol sol,
    dod4 r8
    r fad fad,

    %151
    si re si
    mi sol mi\mbreak
    fad4 re8

    %154
    mi sol mi
    fad mi re
    mi fad fad,

    %157
    si'\f si, si'
    sold mi sold
    la4.

    %160
    la8 la, la'
    fad re fad
    sol4.

    %163
    si8 sol si
    do do si
    la dod la

    %166
    re, re' do?
    si4 sol8
    re re re

    %169
    sol sol sol,
    re' re'16 do si la
    sol8 la4\p

    %172
    si8 sol si
    do si4
    la8 re re,

    %175
    R4.*8
    re8 fad re
    sol8 sol, r

    %185
    R4.*4
    sol'8 si sol
    do do, r

    %191
    R4.*4
    la'8 dod la
    re re, r

    %197
    R4.*7
    sol8\f sol sol
    re re re

    %206
    sol sol sol
    re re'16 do si la
    sol8\p sol sol

    %209
    re re re
    sol sol sol
    re\f re re

    %212
    sol, sol sol
    sol' sol sol
    sol, sol sol

    %215
    do mi16 re do si
    la8 la la
    la' la la\mbreak

    %218
    la, la la
    re re' dod
    re, re re

    %221
    re' re re
    re, re re
    sol4.

    %224
    si,16 do re8 sol
    si,16 do re8 sol
    si,16 do re8 re,

    %227
    sol4.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*10
    <7->4.
    s
    <_+>
    <_+>
    <7 _+>
    s4 <5/>8
    s4.
    s
    <7>
    s
    <6>
    <6>
    <6>8 <4> <7>
    s4.*7
    <6 5>4.
    s4.*5
    <5/>4.
    s
    s8 <6 5>4
    <_+>4.
    s
    s
    <9>8 <8> s
    <_+>4.
    <_+>
    <7 _+>
    <6 4>
    <6 4>
    <6 4>
    <6 4>
    <7 _+>
    <7 _+>
    <6 4>8 <_+> s
    <6 4> <_+> s
    s <6 5> <_+>
    s4.
    <_+>
    s
    <_+>
    s
    <_+>
    s
    <_+>
    <6>8 <_+> s
    s4.
    s
    <7>
    <7>
    s4.*4
    <7->4.
    <7>
    s
    <_+>
    <_+>
    <_+>
    <7 _+>
    <7 _+>
    s
    <6 5>8 <6 4> <7 _+>
    s4.
    s8 <6+>4
    <6>4.
    <6 5>8 <6>4
    <7>8 <7 _+> s
    s4.*4
    <5/>4.
    s4.*3
    <5/>4.
    s4.*3
    <5/>4.
    s
    <5/>
    s4.*10
    <_+>4.
    <_+>
    <_+>
    s4.*3
    <7>4.
    <7 _+>
    s
    <4>8 <7 _+> s
    s4.
    <4>8 <_+>4
    <7>8 s <6 5>
    <6+>4.
    <7>
    <7>
    <7 _+>
    s
    <7>
    <4>4 <7 _+>8
    s4 <6 5>8
    <_+> <6> s
    <7>4.
    s8 <7> s
    s4.
    s8 <7>4
    <7>4.
    s8 <7 _+> s
    s4.
    s8 <6+ 5> s
    <_+>4.
    s
    <7>
    s8 <7 _+> s
    s4.
    s
    <7>
    s8 <7 _+> s
    s4.
    <6+ 5>
    <_+>4 <6>8
    <6+ 5>4.
    <_+>8 s <6>
    <6+ 5> <4> <7 _+>
    s4.
    <5/>
    s
    s
    <5/>
    s
    <6>
    s <_+>
    s
    <6>
    s4.*3
    s8 <6>4
    <6>4.
    <6 5>8 <6>4
    <7>8 <7> s
    s4.*8
    <7>4.
    s4.*5
    <7->4.
    s4.*5
    <_+>4.
    s4.*8
    s4.*10
    <7->4.
    s
    <_+>
    <_+>
    <7 _+>
    s4 <5/>8
    s4.
    s
    <7>
    s
    <6>
    <6>
    <6>8 <4> <7>

}

forma = {

    \key sol\major
    \time 3/8
    \tempo 4. = 70
    s4.*227
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

IIIvlIII = {
    \IIIglobal
    <<\IIIvlIIIn \forma>>

}


IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>

}


IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}
#(set-global-staff-size 15.7)


\pointAndClickOff

\header {
    title = \markup\smaller {"Concerto VI Op. XI"}
    composer = \markup \center-column{"J. C. Naudot (c1690 - 1762)"}
		}

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] Allegro"

\score {

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flauto"}
                    \Ifl
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino""primo"}
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino""secondo"}
                    \IvlII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino""ripieno"}
                    \IvlIII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Alto""Viola"}
                    \Ivla
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                    \Ifg
                >>
                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.instrumentName = \markup \center-column{"Organo e""Violoncello"}
                    \Ibc
                >>
            >>

    \layout {

        indent = 1.6\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
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

\markup\huge "[2.] Aria - Affettuoso"

\score {

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IIfl
                >>

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

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \IIfg
                >>
                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIbc
                >>
            >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #5
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

\markup\huge "[3.] Allegro"

\score {

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIfl
                >>

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

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \IIIfg
                >>
                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIIbc
                >>
            >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
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
