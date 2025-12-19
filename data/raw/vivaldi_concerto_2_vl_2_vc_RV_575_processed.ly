\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

pf = #(make-dynamic-script "pf")

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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IvlIn =  \relative do'' {

    r8 sol' re si sol,[la16 si do re mi fad]
    sol8 sol' re si sol,[la16 si do re mi fad]
    sol8 sol' re si re,[mi16 fad sol la si do]

    %4
    re8 re' la fad  re,[mi16 fad sol la si do]
    re8 re' la fad re,4 r
    re'16[do re8 fad sol] do,16 [si do8 fad sol]

    %7
    si,16[la si8 fad' sol] la,16[sol la8 fad' sol]
    si16[la si8 fad sol] do16[si do8 fad, sol]\mbreak
    re'16[do re8 fad, sol] do,4 r

    %10
    do r do r
    do r do16[si do8 la' do,]
    si16[la si8 sol' si,] la16[sol la8 fad' la,]

    %13
    si16[la si8 sol' si,] do16[si do8 la' do,]
    si16[la si8 sol' si,] la16[re do si la sol fad mi]
    re8 sol do, re si''16 do si do si do si do

    %16
    si8 sol si re\mbreak si16 do si do si do si do
    si8 sol si re re16 la fad re re' la fad re
    la8 re fad la re16 la fad re re' la fad re

    %19
    la8 re fad la si16 sol sol re re sol sol si
    si sol sol re re16 sol sol si si(la) si8 r si
    si16(la) si8 r si la16 fad fad do do fad fad la

    %22
    la fad fad do do fad fad la la(sol) la8 r la\mbreak
    la16(sol) la8 r la sol16 mi mi si si mi mi sol
    sol mi mi si si mi mi sol sol(fad) sol8 r sol

    %25
    sol16(fad) sol8 r sol fad16 re re la la re re fad
    sol(fad) sol8 r sol fad16 re re la la re re fad
    sol la fad sol mi8.\tr re16 re8 re' la fad

    %28
    re,[mi16 fad sol la si dod] re8 re' la fad\mbreak
    re,8[mi16 fad sol la si dod] re8 re la fad
    la,[si16 dod re mi fad sol] la8 la' mi dod

    %31
    la,[si16 dod re mi fad sol] la8 la' mi dod
    la,4 r la''16[sol la8 dod re]
    sol,16[fad sol8 dod re] fad,16[mi fad8 dod' re]

    %34
    mi,16[re mi8 dod' re] re,16[dod re8 dod' re]
    la,[sol16 fad mi re dod si] la8 re sol, la
    re16 mi fad re fad sol la fad\mbreak fad' sol la fad la si dod la

    %37
    re8 la fad re la' fad re la
    fad' re la fad la'16 si dod re la si dod re
    si8 \once\stemUp sol, sol4\tr si'16 dod re mi si dod re mi

    %40
    dod8  \once\stemUp la, la4\tr dod'16 re  mi fad dod re mi fad
    re8  \once\stemUp si, si4\tr re'16 mi fad sol re mi fad sol
    dod, re mi fad dod re mi fad si, dod re mi si dod re mi\mbreak

    %43
    lad, si dod lad si dod re si lad si dod lad si dod re si
    lad8 si si lad si si la? sol
    fad4 r r2

    %46
    R1*5  %%% inizio p. 9
    r8 si fad re si,[dod16 re mi fad sol la]
    si8 si' fad re si,[dod16 re mi fad sol la]

    %53
    si8 si' fad re dod4 r
    mi16[re mi8 dod' mi,] re16[dod re8 si' re,]
    dod16[si dod8 lad' dod,] re16[dod re8 si' re,]\mbreak

    %56 inizio p. 10
    mi16[re mi8 dod' mi,] re16[dod re8 si' re,]
    dod fad dod lad si fad re si
    mi4 fad si'16 fad fad re re fad fad si

    %59
    si fad fad re re fad fad si la(sold) la8 r la
    la16(sold) la8 r la sold16 mi mi si si mi mi sold
    sold? mi mi si si mi mi sol sol \parentSlur (fad) sol8 r sol

    %62
    sol16 \parentSlur (fad) sol8 r sol\mbreak fad16 re re la la re re fad
    fad re re la la re re fa fa(mi) fa8 r8 fa
    fa?16(mi) fa8 r fa! mi16 do do sol sol do do mi

    %65
    mi do do sol sol do do mi fad? re re la la re re fad
    fad re re la la re re fad sol8 sol re si
    sol,[la16 si do re mi fad] sol8 sol' re si\mbreak

    %68
    si16[la si8 sol' si,]
    la16[re do si la sol fad mi] re8 sol do, re
    sol'16 re sol si sol re sol si sol4 r

    %71
    si16 sol si re si sol si re si4 r
    re16 si re sol re si re sol re4 r
    re16 si re sol re si re sol do, la do fad do la do fad

    %74
    si, sol si mi si sol si mi la, fad la re la fad la re\mbreak
    si do si do si do si do re8 sol, la fad
    sol4 r r2

    %77
    R1
    r2 r8 sol la fad
    sol sol re si do16[si do8 la' do,]

    %80
    si16[la si8 sol' si,] la16[sol la8 fad' la,]
    si16[la si8 sol' si,] do16[si do8 la' do,]
    si16[la si8 sol' si,]\mbreak la16[re do si la sol fad mi]

    %83
    re8 sol do, re sol,2\fermata

}

IvlIIn = \relative do'' {

    r2 r8 sol' re si
    sol,[la16 si do re mi fad] sol8 sol' re si
    sol,[la16 si do re mi fad] la8 re' la fad

    %4
    re,[mi16 fad sol la si do] re8 re' la fad
    re,8[mi16 fad sol la si do] re4 r
    re16[do re8 fad sol] do,16 [si do8 fad sol]

    %7
    si,16[la si8 fad' sol] la,16[sol la8 fad' sol]
    si16[la si8 fad sol] do16[si do8 fad, sol]\mbreak
    re'16[do re8 fad, sol] fad4 r

    %10
    fad r fad r
    fad r fad8 la, fad' la,
    sol16[fad sol8 re' sol,] fad16[mi fad8 re' fad,]

    %13
    sol16[fad sol8 re' sol,] la16[sol la8 fad' la,]
    sol16[fad sol8 re' sol,] fad16[re' do si la sol fad mi]
    re8 sol do, re sol'16 la sol la sol la sol la

    %16
    sol8 re sol si\mbreak sol16 la sol la sol la sol la
    sol8 re sol si la16 fad re la la' fad re la
    fad8 la re fad la16 fad re la la' fad re la

    %19
    fad8 la re fad sol16 re re si si re re sol
    sol re re si si re re sol sol(fad) sol8 r sol
    sol16(fad) sol8 r sol fad16 do do la la do do fad

    %22
    fad do do la la do do fad fad(mi) fad8 r fad\mbreak
    fad16(mi) fad8 r fad mi16 si si sol sol si si mi
    mi si si sol sol si si mi mi(re) mi8 r mi

    %25
    mi16(re) mi8 r mi re16 la la fad fad la la re
    mi\parentSlur (re) mi8 r mi re16 la la fad fad la la re
    mi fad re mi dod8.\tr re16 re4 r

    %28
    r8 re' la fad re,[mi16 fad sol la si dod]\mbreak
    re8 re' la fad re,16[mi fad sol la si dod re]
    dod8 la' mi dod la,[si16 dod re mi fad sol]

    %31
    la8 la' mi dod la,[si16 dod re mi fad sol]
    la4 r la'16[sol la8 dod re]
    sol,16[fad sol8 dod re] fad,16[mi fad8 dod' re]

    %34
    mi,16[re mi8 dod' re] re,16[dod re8 dod' re]
    la,[sol16 fad mi re dod si] la8 re sol, la
    re4 r re16 mi fad re fad sol la fad  %% inizio p 7

    %37
    fad' sol la fad la si dod la re8 la fad re
    la' fad re la fad4 r
    re'16 mi fad sol re mi fad sol mi8 mi, mi4\tr

    %40
    mi'16 fad sol la mi fad sol la fad8 fad, fad4\tr
    fad'16 sol la si fad sol la si sol8 sol, sol'4~
    sol fad2 mi4~\mbreak

    %43
    mi re16 mi fad re dod re mi dod re mi fad re
    dod8 re dod dod si si dod  dod
    re4 r r2

    %46
    R1*5
    r2 r8 si' fad re
    si,[dod16 re mi fad sol la] si8 si' fad re

    %53
    si,16[dod re mi fad sol la si] lad4 r
    dod16[si dod8 lad' dod,] si16[dod si8 fad' si,]
    lad16[sold lad8 fad' lad,] si16[dod si8 fad' si,]\mbreak

    %56
    dod16[si dod8 lad' dod,] si16[dod si8 fad' si,]
    lad fad' dod lad si fad re si
    mi4 fad fad'16 re re si si re re fad

    %59
    fad re re si si re re fad fad(mi) fad8 r fad
    fad16(mi) fad8 r fad mi16 si si sold sold si si mi
    mi si si sold sold si si mi mi \parentSlur (re) mi8 r mi

    %62
    mi16 \parentSlur (re) mi8 r mi\mbreak re16 la la fad fad la la re
    re la la fad fad la la re re(do) re8 r re
    re16(do) re8 r re do16 sol sol mi mi sol sol do

    %65
    do sol sol mi mi sol sol do la fad' fad re re fad fad la
    la fad fad re re fad fad la si4 r
    r8 sol re si sol,[la16 si do re mi fad]\mbreak

    %68
    sol [fad sol8 re' sol,]
    fad16 [re' do si la sol fad mi] re8 sol do, re
    re'16 si re sol re si re sol re4 r

    %71
    sol16 re sol si sol re sol si sol4 r
    si16 sol si re si sol si re si4 r
    si16 sol si re si sol si re la fad la do la fad la do

    %74
    sol mi sol si sol mi sol si fad re fad la fad re fad la\mbreak
    sol la sol la sol la sol la si8 si, do la
    si4 r r2

    %77
    R1
    r2 r8 si re la
    si8 re si sol la16[sol la8 fad' la,]

    %80
    sol16[fad sol8 re' sol,] fad16[mi fad8 re' fad,]
    sol16[fad sol8 re' sol,] la16[sol la8 fad' la,]
    sol16[fad sol8 re' sol,]\mbreak fad16[re' do si la sol fad mi]

    %83
    re8 sol do, re sol,2\fermata

}


IvlIripn =  \relative do'' {

    r8 sol' re si sol,[la16 si do re mi fad]
    sol8 sol' re si sol,[la16 si do re mi fad]
    sol8 sol' re si re,[mi16 fad sol la si do]

    %4
    re8 re' la fad  re,[mi16 fad sol la si do]
    re8 re' la fad re,4 r
    re'16[do re8 fad sol] do,16 [si do8 fad sol]

    %7
    si,16[la si8 fad' sol] la,16[sol la8 fad' sol]
    si16[la si8 fad sol] do16[si do8 fad, sol]\mbreak
    re'16[do re8 fad, sol] do,4 r

    %10
    do r do r
    do r do16[si do8 la' do,]
    si16[la si8 sol' si,] la16[sol la8 fad' la,]

    %13
    si16[la si8 sol' si,] do16[si do8 la' do,]
    si16[la si8 sol' si,] la16[re do si la sol fad mi]
    re8 sol do, re sol,4 r

    %16
    R1*11
    r2 r8 re''' la fad

    %28
    re,[mi16 fad sol la si dod] re8 re' la fad\mbreak
    re,8[mi16 fad sol la si dod] re8 re la fad
    la,[si16 dod re mi fad sol] la8 la' mi dod

    %31
    la,[si16 dod re mi fad sol] la8 la' mi dod
    la,4 r la''16[sol la8 dod re]
    sol,16[fad sol8 dod re] fad,16[mi fad8 dod' re]

    %34
    mi,16[re mi8 dod' re] re,16[dod re8 dod' re]
    la,[sol16 fad mi re dod si] la8 re sol, la
    re4 r r2

    %37
    R1*7
    r2 si''8 si la sol
    fad4 r r2

    %46
    R1*5  %%% inizio p. 9
    r8 si fad re si,[dod16 re mi fad sol la]
    si8 si' fad re si,[dod16 re mi fad sol la]

    %53
    si8 si' fad re dod4 r
    mi16[re mi8 dod' mi,] re16[dod re8 si' re,]
    dod16[si dod8 lad' dod,] re16[dod re8 si' re,]\mbreak

    %56 inizio p. 10
    mi16[re mi8 dod' mi,] re16[dod re8 si' re,]
    dod fad dod lad si fad re si
    mi4 fad si, r

    %59
    R1*7
    r2 r8 sol'' re si
    sol,[la16 si do re mi fad] sol8 sol' re si\mbreak

    %68
    si16[la si8 sol' si,]
    la16[re do si la sol fad mi] re8 sol do, re
    sol,4 r sol'' r

    %71
    sol r sol r
    sol r sol r
    sol r r2

    %74
    R1\mbreak
    sol4 r r8 sol la fad
    sol4 r r2

    %77
    R1
    r2 r8 sol la fad
    sol sol re si do16[si do8 la' do,]

    %80
    si16[la si8 sol' si,] la16[sol la8 fad' la,]
    si16[la si8 sol' si,] do16[si do8 la' do,]
    si16[la si8 sol' si,]\mbreak la16[re do si la sol fad mi]

    %83
    re8 sol do, re sol,2\fermata

}

IvlIIripn = \relative do'' {

    r2 r8 sol' re si
    sol,[la16 si do re mi fad] sol8 sol' re si
    sol,[la16 si do re mi fad] la8 re' la fad

    %4
    re,[mi16 fad sol la si do] re8 re' la fad
    re,8[mi16 fad sol la si do] re4 r
    re16[do re8 fad sol] do,16 [si do8 fad sol]

    %7
    si,16[la si8 fad' sol] la,16[sol la8 fad' sol]
    si16[la si8 fad sol] do16[si do8 fad, sol]\mbreak
    re'16[do re8 fad, sol] fad4 r

    %10
    fad r fad r
    fad r fad8 la, fad' la,
    sol16[fad sol8 re' sol,] fad16[mi fad8 re' fad,]

    %13
    sol16[fad sol8 re' sol,] la16[sol la8 fad' la,]
    sol16[fad sol8 re' sol,] fad16[re' do si la sol fad mi]
    re8 sol do, re sol,4 r

    %16
    R1*12

    %28
    r8 re''' la fad re,[mi16 fad sol la si dod]\mbreak
    re8 re' la fad re,16[mi fad sol la si dod re]
    dod8 la' mi dod la,[si16 dod re mi fad sol]

    %31
    la8 la' mi dod la,[si16 dod re mi fad sol]
    la4 r la'16[sol la8 dod re]
    sol,16[fad sol8 dod re] fad,16[mi fad8 dod' re]

    %34
    mi,16[re mi8 dod' re] re,16[dod re8 dod' re]
    la,[sol16 fad mi re dod si] la8 re sol, la
    re4 r r2 %% inizio p 7

    %37
    R1*7
    r2 si'8 si dod  dod
    re4 r r2

    %46
    R1*5
    r2 r8 si' fad re
    si,[dod16 re mi fad sol la] si8 si' fad re

    %53
    si,16[dod re mi fad sol la si] lad4 r
    dod16[si dod8 lad' dod,] si16[dod si8 fad' si,]
    lad16[sold lad8 fad' lad,] si16[dod si8 fad' si,]\mbreak

    %56
    dod16[si dod8 lad' dod,] si16[dod si8 fad' si,]
    lad fad' dod lad si fad re si
    mi4 fad si, r

    %59
    R1*8
    r8 sol'' re si sol,[la16 si do re mi fad]\mbreak

    %68
    sol [fad sol8 re' sol,]
    fad16 [re' do si la sol fad mi] re8 sol do, re
    sol,4 r re'' r

    %71
    re r re r
    re r re r
    re r r2

    %74
    R1\mbreak
    re4 r r8 si do la
    si4 r r2

    %77
    R1
    r2 r8 si re la
    si8 re si sol la16[sol la8 fad' la,]

    %80
    sol16[fad sol8 re' sol,] fad16[mi fad8 re' fad,]
    sol16[fad sol8 re' sol,] la16[sol la8 fad' la,]
    sol16[fad sol8 re' sol,]\mbreak fad16[re' do si la sol fad mi]

    %83
    re8 sol do, re sol,2\fermata

}

Ivlan = \relative do'{

    si4 r re r
    si r re r
    si r fad' r

    %4
    la, r fad' r
    la, r fad'8[sol16 la si do re mi]
    fad,8 r la si r4 la8 si

    %7
    r4 la8 si r4 la8 si
    r4 la8 si r4 la8 si\mbreak
    r4 la8 si la4 r

    %10
    la r la r
    la r la8 fad fad fad
    sol sol sol sol la la la la

    %13
    sol sol sol sol fad fad fad fad
    sol sol sol sol re16[re' do si la sol fad mi]
    re8 sol do, re sol,4 r

    %16
    R1*11
    r2 fad'4 r
    fad r fad r\mbreak

    %29
    fad r fad r
    mi r dod r
    dod? r dod r

    %32
    dod?8[re16 mi fad sol la si] dod8 r mi, fad
    r4 mi8 fad r4 mi8 fad
    r4 mi8 fad r4 mi8 fad

    %35
    la[sol16 fad mi re dod si] la8 re sol, la
    re4 r r2\mbreak
    R1*7

    %44
    r2 re8 re la' la
    la4 r r2
    R1*5

    %51
    re,4 r re r
    re r re r
    re r fad r

    %54
    lad8 lad lad lad si si si si
    dod dod dod dod si si si si\mbreak
    lad lad lad lad si si si si

    %57
    fad fad dod lad si' fad re si
    mi4 fad si, r
    R1*7

    %66
    r2 re4 r
    re r si r\mbreak
    re re

    %69
    re16[re' do si la sol fad mi] re8 sol do, re
    sol,4 r si' r
    si r si r

    %72
    si r si r
    si r r2
    R1

    %75
    si4 r r8 re, mi re
    re4 r r2
    R1

    %78
    r2 r8 re mi re
    re4 r fad8 fad fad fad
    sol sol sol sol la la la la

    %81
    sol sol sol sol fad fad fad fad
    sol sol sol sol\mbreak re16[re' do si la sol fad mi]
    re8 sol do, re sol,2\fermata

}

IvcIn = \relative do {

    sol8[la16 si do re mi fad] sol,8[la16 si do re mi fad]
    sol,8[la16 si do re mi fad] sol,8[la16 si do re mi fad]
    sol,[la si do re mi fad sol] re8[mi16 fad sol la si do]

    %4
    re,8[mi16 fad sol la si do] re,8[mi16 fad sol la si do]
    re,8[mi16 fad sol la si do] re,8[mi16 fad sol la si do]
    re8 r re, sol, r4 re'8 sol,

    %7
    r4 re'8 sol, r4 re'8 sol,
    r4 re'8 sol, r4 re'8 sol,\mbreak
    r4 re'8 sol, re' re' la fad

    %10
    re,[mi16 fad sol la si do] re8 re' la fad
    re,[mi16 fad sol la si do] re8[re' re,16 do re8]
    re'[re, re16 do re8] re'[re, re16 do re8]

    %13
    re'[re, re16 do re8] re'[re, re16 do re8]
    re'[re, re16 do re8] re16[re' do si la sol fad mi]
    re8 sol do, re sol,4 r

    %16
    si'16 do si do si do si do\mbreak si8 sol si re
    si16 do si do si do si do fad,4 r
    re'16 la fad re re' la fad re la8 re fad la

    %19
    re16 la fad re re' la fad re si4 sol
    sol sol mi''16 do do sol sol do do mi
    mi do do sol sol do do mi mi(re) mi8 r mi

    %22
    mi16(re) mi8 r mi re16 si si fad fad si si re\mbreak
    re si si fad fad si si re re(do) re8 r re
    re16(do) re8 r re dod16 la la mi mi la la dod

    %25
    dod? la la mi mi la la dod! re(dod) re8 r re
    dod16 la la mi mi la la dod re(dod) re8 r re
    la re, la' la, re[mi16 fad sol la si dod]

    %28
    re,8[mi16 fad sol la si dod] re,8[mi16 fad sol la si dod]\mbreak  %%fine p 5
    re,8[mi16 fad sol la si dod] re,[mi fad sol la si dod re]
    la,8[si16 dod re mi fad sol] la,8[si16 dod re mi fad sol]

    %31
    la,8[si16 dod re mi fad sol] la,8[si16 dod re mi fad sol]
    la,8[si16 dod re mi fad sol] la8 r la re,
    r4 la'8 re, r4 la'8 re,

    %34
    r4 la'8 re, r4 la'8 re,
    la'8[sol16 fad mi re dod si] la8 re sol, la
    re4 r\mbreak re, r

    %37
    re16 mi fad re fad sol la fad fad' sol la fad la si dod la
    re8 la fad re fad mi fad re
    sol fad sol sol, sold' fad sold mi

    %40
    la sold la la, lad' sold lad fad
    si lad si si, si'4 si

    %42
    lad la sold sol\mbreak
    fad si, fad' si,
    fad'8 si, fad' fad, sol sol la la

    %45
    la'16 si dod re la si dod re si8 sol, sol4\tr
    \clef tenor si'16 dod re mi si dod re mi dod8\clef bass la, la4
    \clef tenor dod'16 re mi fad dod re mi fad re8\clef bass si,8 si4

    %48
    \clef tenor re'16 mi fad sol re mi fad sol dod, re mi fad dod re mi fad\mbreak
    si, dod re mi si dod re mi lad, si dod lad si dod re si
    lad si dod lad si dod re si lad8  si si lad

    %51
    \clef bass si,8[dod16 re mi fad sol la] si,8[dod16 re mi fad sol la]
    si,8[dod16 re mi fad sol la] si,8[dod16 re mi fad sol la]
    si,[dod re mi fad sol la si] fad,8[sold16 lad si dod re mi]

    %54
    fad,8[fad' fad,16 mi fad8] fad'[fad, fad16 mi fad8]
    fad'[fad, fad16 mi fad8] fad'[fad, fad16 mi fad8]\mbreak
    fad'[fad, fad16 mi fad8] fad'[fad, fad16 mi fad8]

    %57
    fad'\clef tenor fad' dod lad si\clef bass fad re si
    mi4 fad si, si
    si si red'16 si si fad fad si si red

    %60
    red? si si fad fad si si red! mi \parentSlur (red) mi8 r mi
    mi16 \parentSlur (red) mi8 r mi dod16 la la mi mi la la dod
    dod? la la mi mi la la dod! re\parentSlur (dod) re8 r re

    %63
    re16 \parentSlur (dod) re8 r re si16 sol sol re re sol sol si
    si sol sol re re sol sol si do(si) do8 r do
    do16(si) do8 r do re,4 re

    %66
    re re sol,8[la16 si do re mi fad]
    sol,8[la16 si do re mi fad] sol,8[la16 si do re mi fad]\mbreak
    sol,4 sol

    %69
    re'16[re' do si la sol fad mi] re8 sol do, re
    sol,4 r sol r
    sol r sol r

    %72
    sol r sol r
    sol r r2
    R1\mbreak

    %75
    sol4 r r8 sol do re
    \clef tenor re'16 si re  sol re si re sol do, la do fad do la do fad
    si, sol si mi si sol si mi la, fad la re la fad la re

    %78
    si do si do si do si do re8\clef bass sol, do, re
    sol,4 r re'8[re' re,16 do re8]
    re'[re, re16 do re8] re'[re, re16 do re8]

    %81
    re'[re, re16 do re8] re'[re, re16 do re8]
    re'[re, re16 do re8]\mbreak  re16[re' do si la sol fad mi]
    re8 sol do, re sol,2\fermata

}

IvcIIn = \relative do {

    sol8[la16 si do re mi fad] sol,8[la16 si do re mi fad]
    sol,8[la16 si do re mi fad] sol,8[la16 si do re mi fad]
    sol,[la si do re mi fad sol] re8[mi16 fad sol la si do]

    %4
    re,8[mi16 fad sol la si do] re,8[mi16 fad sol la si do]
    re,8[mi16 fad sol la si do] re,8[mi16 fad sol la si do]
    re8 r re, sol, r4 re'8 sol,

    %7
    r4 re'8 sol, r4 re'8 sol,
    r4 re'8 sol, r4 re'8 sol,\mbreak
    r4 re'8 sol, re[mi16 fad sol la si do]

    %10
    re8 re' la fad re,[mi16 fad sol la si do]
    re8 re' la fad re8[re' re,16 do re8]
    re'[re, re16 do re8] re'[re, re16 do re8]

    %13
    re'[re, re16 do re8] re'[re, re16 do re8]
    re'[re, re16 do re8] re16[re' do si la sol fad mi]
    re8 sol do, re sol,4 r

    %16
    sol'16 la sol la sol la sol la\mbreak sol8 re sol si
    sol16 la sol la sol la sol la re,4 r
    la'16 fad re la la' fad re la fad8 la re fad

    %19
    la16 fad re la la' fad re la sol4 sol
    sol sol do'16 sol sol mi mi sol sol do
    do sol sol mi mi sol sol do do(si) do8 r do

    %22
    do16(si) do8 r do si16 fad fad re re fad fad si\mbreak
    si fad fad re re fad fad si si(la) si8 r si
    si16(la) si8 r si la16 mi mi dod dod mi mi la

    %25
    la mi mi dod dod mi mi la la8 fad r la
    la16 mi mi dod dod mi mi la la8 fad r la
    la re, la' la, re[mi16 fad sol la si dod]

    %28
    re,8[mi16 fad sol la si dod] re,8[mi16 fad sol la si dod]\mbreak  %%fine p 5
    re,8[mi16 fad sol la si dod] re,[mi fad sol la si dod re]
    la,8[si16 dod re mi fad sol] la,8[si16 dod re mi fad sol]

    %31
    la,8[si16 dod re mi fad sol] la,8[si16 dod re mi fad sol]
    la,8[si16 dod re mi fad sol] la8 r la re,
    r4 la'8 re, r4 la'8 re,

    %34
    r4 la'8 re, r4 la'8 re,
    la'8[sol16 fad mi re dod si] la8 re sol, la
    re4 r\mbreak re, r

    %37
    r2 re16 mi fad re fad sol la fad
    fad' sol la fad la si dod la re8 mi, fad re
    sol fad sol sol, sold' fad sold mi

    %40
    la sold la la, lad' sold lad fad
    si lad si si, si'4 si

    %42
    lad la sold sol\mbreak
    fad si, fad' si,
    fad'8 si, fad' fad, sol sol la la

    %45
    r2 re16 mi fad sol re mi fad sol
    mi8 mi, mi4\tr mi'16 fad sol la mi fad sol la
    fad8 fad, fad4\tr fad'16 sol la si fad sol la si

    %48
    sol8 sol, sol'2 fad4~\mbreak
    fad mi2 \clef tenor re'16 mi fad re
    dod re mi dod re mi fad re dod8 re dod dod

    %51
    \clef bass si,8[dod16 re mi fad sol la] si,8[dod16 re mi fad sol la]
    si,8[dod16 re mi fad sol la] si,8[dod16 re mi fad sol la]
    si,[dod re mi fad sol la si] fad,8[sold16 lad si dod re mi]

    %54
    fad,8[fad' fad,16 mi fad8] fad'[fad, fad16 mi fad8]
    fad'[fad, fad16 mi fad8] fad'[fad, fad16 mi fad8]\mbreak
    fad'[fad, fad16 mi fad8] fad'[fad, fad16 mi fad8]

    %57
    fad'\clef tenor fad' dod lad si\clef bass fad re si
    mi4 fad si, si
    si si si'16 fad fad red red fad fad si

    %60
    si fad fad red red fad fad si si8 sold r si
    si sold r sold la16 mi mi dod dod mi mi la
    la mi mi dod dod mi mi la\mbreak la8 fad r la

    %63
    la fad r fad sol16 re re si si re re sol
    sol re re si si re re sol sol8 mi r sol
    sol mi r do re4 re

    %66
    re re sol,8[la16 si do re mi fad]
    sol,8[la16 si do re mi fad] sol,8[la16 si do re mi fad]\mbreak
    sol,4 sol

    %69
    re'16[re' do si la sol fad mi] re8 sol do, re
    sol,4 r sol r
    sol r sol r

    %72
    sol r sol r
    sol r r2
    R1\mbreak

    %75
    sol4 r r8 sol do re
    \clef tenor fad'16 re fad la fad re fad la mi do mi sol mi do mi sol
    re si re fad re si re fad do la do mi do la do mi

    %78
    re mi re mi re mi re mi fad8\clef bass sol, do, re
    sol,4 r re'8[re' re,16 do re8]
    re'[re, re16 do re8] re'[re, re16 do re8]

    %81
    re'[re, re16 do re8] re'[re, re16 do re8]
    re'[re, re16 do re8]\mbreak  re16[re' do si la sol fad mi]
    re8 sol do, re sol,2\fermata

}

Ibcn = \relative do {

    sol8[la16 si do re mi fad] sol,8[la16 si do re mi fad]
    sol,8[la16 si do re mi fad] sol,8[la16 si do re mi fad]
    sol,[la si do re mi fad sol] re8[mi16 fad sol la si do]

    %4
    re,8[mi16 fad sol la si do] re,8[mi16 fad sol la si do]
    re,8[mi16 fad sol la si do] re,8[mi16 fad sol la si do]
    re8 r re, sol, r4 re'8 sol,

    %7
    r4 re'8 sol, r4 re'8 sol,
    r4 re'8 sol, r4 re'8 sol,\mbreak
    r4 re'8 sol, re'4 r

    %10
    re r re r
    re r re8[re' re,16 do re8]
    re'[re, re16 do re8] re'[re, re16 do re8]

    %13
    re'[re, re16 do re8] re'[re, re16 do re8]
    re'[re, re16 do re8] re16[re' do si la sol fad mi]
    re8 sol do, re sol,4 r

    %16
    sol r\mbreak sol r
    sol r re' r
    re r re r

    %19
    re r sol, sol
    sol sol do do
    do do fad fad

    %22
    fad fad si, si\mbreak
    si si mi mi
    mi mi la, la

    %25
    la la la la
    la la la la
    la8 re la' la, re[mi16 fad sol la si dod]

    %28
    re,8[mi16 fad sol la si dod] re,8[mi16 fad sol la si dod]\mbreak  %%fine p 5
    re,8[mi16 fad sol la si dod] re,[mi fad sol la si dod re]
    la,8[si16 dod re mi fad sol] la,8[si16 dod re mi fad sol]

    %31
    la,8[si16 dod re mi fad sol] la,8[si16 dod re mi fad sol]
    la,8[si16 dod re mi fad sol] la8 r la re,
    r4 la'8 re, r4 la'8 re,

    %34
    r4 la'8 re, r4 la'8 re,
    la'8[sol16 fad mi re dod si] la8 re sol, la
    re4 r\mbreak re, r

    %37
    re r re r
    re r fad'8 mi fad re
    sol fad sol sol, sold' fad sold mi

    %40
    la sold la la, lad' sold lad fad
    si lad si si, si'4 si

    %42
    lad la sold sol\mbreak
    fad si, fad' si,
    fad'8 si, fad' fad, sol sol la la

    %45
    re, mi fad re sol la si sol
    sold fad sold mi la si dod si
    lad sold lad fad si dod re dod

    %48
    si4 si lad la\mbreak
    sold sol fad si
    fad si fad8 si fad' fad,

    %51
    si[dod16 re mi fad sol la] si,8[dod16 re mi fad sol la]
    si,8[dod16 re mi fad sol la] si,8[dod16 re mi fad sol la]
    si,[dod re mi fad sol la si] fad,8[sold16 lad si dod re mi]

    %54
    fad,8[fad' fad,16 mi fad8] fad'[fad, fad16 mi fad8]
    fad'[fad, fad16 mi fad8] fad'[fad, fad16 mi fad8]\mbreak
    fad'[fad, fad16 mi fad8] fad'[fad, fad16 mi fad8]

    %57
    fad'\clef tenor fad' dod lad si\clef bass fad re si
    mi4 fad si, si
    si si si si

    %60
    si si mi mi
    mi mi la, la
    la la re re

    %63
    re re sol sol,
    sol sol do do
    do do re re

    %66
    re re sol,8[la16 si do re mi fad]
    sol,8[la16 si do re mi fad] sol,8[la16 si do re mi fad]\mbreak
    sol,4 sol

    %69
    re'16[re' do si la sol fad mi] re8 sol do, re
    sol,4 r sol r
    sol r sol r

    %72
    sol r sol r
    sol r r2
    R1\mbreak

    %75
    sol4 r r8 sol do re
    sol,4 r r2
    R1

    %78
    r2 r8 sol' do, re
    sol,4 r re'8[re' re,16 do re8]
    re'[re, re16 do re8] re'[re, re16 do re8]

    %81
    re'[re, re16 do re8] re'[re, re16 do re8]
    re'[re, re16 do re8]\mbreak  re16[re' do si la sol fad mi]
    re8 sol do, re sol,2\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp




}

forma = {

    \key sol\major
    \time 4/4
    \tempo 2 = 60
    s1*67
    \set Score.measureLength = #(ly:make-moment 2 4) s2
    \set Score.measureLength = #(ly:make-moment 4 4) s1*15
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

IvlIrip = {
    \Iglobal
    <<\IvlIripn \forma>>

}

IvlIIrip = {
    \Iglobal
    <<\IvlIIripn \forma>>

}

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

IvcI = {
    \Iglobal
    \clef bass
    <<\IvcIn \forma>>

}

IvcII = {
    \Iglobal
    \clef bass
    <<\IvcIIn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IIvlIn =  \relative do'' {

    sol'8.[mi16 sol8. la16 si8. sol16]
    fad8. mi16 fad4 r
    fad8.[red16 fad8. sol16 la8. fad16]

    %4
    sol8. fad16 sol4 r
    sol8.[mi16 sol8. la16 si8. sol16]
    do2.~

    %7
    do8.[fad,16 la8. si16 do8. la16]
    si2.~
    si8. [mi,16 sol8. la16 si8. sol16]

    %10
    la2.~\mbreak
    la8.[re,16 fad8. sol16 la8. fad16]
    sol8.[la16 sol8. la16 sol8. la16]

    %13
    sol4 \tr r r
    si8.[do16 si8. do16 si8. do16]
    re4. do8 si la

    %16
    si8. do16 la4. sol8
    sol4 r r
    R2.*2\mbreak

    %20
    r4 si8.[la16 la8. sold16]
    sold?4~sold8.[sold16 la8. si16]
    dod4 la8.[sol?16 sol8. fad16]

    %23
    fad4~fad8.[fad16 sol8. la16]
    si4 sol8.[fad16 fad8. mi16]
    mi2.~

    %26
    mi4 fad8.[mi16 mi8. re16]
    re4. mi8 fad4
    mi8 re dod4.\tr si8\mbreak

    %29
    si4 r r
    sol'8.[mi16 sol8. la16 si8. sol16]
    fad8. mi16 fad4 r

    %32
    fad8.[red16 fad8. sol16 la8. fad16]
    sol8. fad16 sol4 r
    si8.[do16 si8. do16 si8. do16]

    %35
    la8.[si16 la8. si16 la8. si16]
    sol4 r r
    R2.

    %38
    sol8.[la16 sol8. la16 sol8. la16]
    si4. la8 sol fad
    sol8. la16 fad4.\tr mi8

    %41
    mi4 r r
    R2.*2
    sol4 fad fad

    %45
    mi2.\fermata

}

IIvlIIn = \relative do'' {

    mi8.[si16 mi8. fad16 sol8. mi16]
    red8. dod?16 red4 r
    red8.[si16 red8. mi16 fad8. red16]

    %4
    mi8. red16 mi4 r
    mi8.[si16 mi8. fad16 sol8. mi16]
    la2.~

    %7
    la8.[re,16 fad8. sol16 la8. fad16]
    sol2.~
    sol8.[do,16 mi8. fad16 sol8. mi16]

    %10
    fad2.~\mbreak
    fad8.[si,16 re8. mi16 fad8. re16]
    si'8.[do16 si8. do16 si8. do16]

    %13
    si4\tr r r
    sol8.[la16 sol8. la16 sol8. la16]
    si4. la8 sol fad

    %16
    sol8. la16 fad4. sol8
    sol4 r r
    R2.*2\mbreak

    %20
    r4 sol8.[fad16 fad8. mi16]
    mi4~mi8. [mi16 fad8. sold16]
    la4 mi8.[mi16 mi8. re16]

    %23
    re4~re8.[re16 mi8. fad16]
    sol4 re8.[re16 re8. dod16]
    dod?2.~

    %26
    dod?4 dod!8.[dod16 dod8. si16]
    si4. dod8 re4
    dod8 si lad4.\tr si8\mbreak

    %29
    si4 r r
    mi8.[si16 mi8. fad16 sol8. mi16]
    red8. dod16 red4 r

    %32
    red8. [si16 red8. mi16 fad8. red16]
    mi8. red16 mi4 r
    sol8.[la16 sol8. la16 sol8. la16]

    %35
    fad8.[sol16 fad8. sol16 fad8. sol16]
    mi4 r r
    R2.

    %38
    mi8.[fad16 mi8. fad16 mi8. fad16]
    sol4. fad8 mi red
    mi8. fad16 red4.\tr mi8

    %41
    mi4 r r
    R2.*2
    mi4 mi red

    %45
    mi2.\fermata

}

IIvcIn = \relative do {

    R2.
    \clef tenor red'8.[si16 red8. mi16 fad8. mi16]
    red?8. dod16 red4 r

    %4
    mi8.[si16 mi8. fad16 sol8. fad16]
    mi8. red16 mi4 r
    do8.[la16 do8. re?16 mi8. do16]

    %7
    fad2.~
    fad8.[si,16 re8. mi16 fad8. re16]
    mi2.~

    %10
    mi8.[la,16 do8. re16 mi8. do16]\mbreak
    re2.\parentSlur (
    re4) r r

    %13
    \clef bass si8.[do16 si8. do16 si8. do16]
    si4\tr r r
    sol, la8. [si16 do8. re16]

    %16
    sol,8. do16 re4 re,
    si''8.[do16 si8. do16 si8. do16]
    re4. do8 si la

    %19
    si8. do16 la4.\tr sol8\mbreak
    sol4 r r
    r mi'8.[re16 re8. dod16]

    %22
    dod?4~dod8.[dod16 re8. mi16]
    fad4 re8.[do?16 do8. si16]
    si4~si8.[si16 dod? 8. re16]

    %25
    mi4 dod8.[si16 si8. lad16]
    lad?2 lad4
    fad2 si,4

    %28
    mi fad fad,\mbreak
    si si'8.[la16 sol8. fad16]
    mi4 r r

    %31
    \clef tenor red'8.[si16 red8. mi16 fad8. mi16]
    red8. dod16 red4 r
    mi8.[si16 mi8. fad16 sol8. fad16]

    %34
    mi8. red16 mi4 r
    R2.
    \clef bass si8.[do16 si8. do16 si8. do16]

    %37
    la8.[si16 la8. si16 la8. si16]\mbreak
    sol4 mi mi
    mi fad8.[sol16 la8. si16]

    %40
    mi,8. la16 si4 si,
    sol'8.[la16 sol8. la16 sol8. la16]
    si4. la8 sol fad

    %43
    sol8. la16 fad4.\tr mi8
    mi4 si' si
    si2.\fermata

}

IIvcIIn = \relative do {

    R2.
    \clef tenor si'8. [fad16 si8. dod16 red8. dod16]
    si8. la16 si4 r

    %4
    \clef bass si8.[sol16 sol8. la16 si8. la16]
    sol8. fad16 sol4 r
    la8.[mi16 la8. si16 do8. la16]

    %7
    re2.~
    re8.[sol,16 si8. do16 re8. si16]
    do2.~

    %10
    do8.[fad,16 la8. si16 do8. la16]\mbreak
    la2.
    si4 r r

    %13
    sol8.[la16 sol8. la16 sol8. la16]
    sol4\tr r r
    sol, la8. [si16 do8. re16]

    %16
    sol,8. do16 re4 re,
    sol'8.[la16 sol8. la16 sol8. la16]
    si4. la8 sol fad

    %19
    sol8. la16 fad4.\tr sol8\mbreak
    sol4 r r
    r si8.[si16 si8. la16]

    %22
    la4~la8.[la16 si8. dod16]
    re4 la8.[la16 la8. sol16]
    sol4~sol8.[sol16 la8. si16]

    %25
    dod4 sold8.[sold16 sold8. fad16]
    fad2 fad4
    fad2 si,4

    %28
    mi fad fad,\mbreak
    si si'8.[la16 sol8. fad16]
    mi4 r r

    %31
    \clef tenor si'8.[fad16 si8. dod16 red8. dod16]
    si8. la16 si4 r
    \clef bass  si8.[sol16 sol8. la16 si8. la16]

    %34
    sol8. fad16  sol4 r
    R2.
    sol8.[la16 sol8. la16 sol8. la16]

    %37
    fad8.[sol16 fad8. sol16 fad8. sol16]\mbreak
    mi4 mi mi
    mi fad8.[sol16 la8. si16]

    %40
    mi,8. la16 si4 si,
    mi8.[fad16 mi8. fad16 mi8. fad16]
    sol4. fad8 mi red

    %43
    mi8. fad16 red4.\tr mi8
    mi4 fad fad
    sol2.\fermata

}

IIbcn = \relative do {

    mi4 mi mi
    si si si
    si si si

    %4
    mi mi mi
    mi mi mi
    la, la la

    %7
    re re re
    sol sol sol
    do, do do

    %10
    fad fad fad\mbreak
    re re re
    sol, sol sol

    %13
    sol sol sol
    sol4 r r
    sol la8. [si16 do8. re16]

    %16
    sol,8. do16 re4 re,
    sol r r
    sol la8. [si16 do8. re16]

    %19
    sol,8. do16 re4 re,\mbreak
    sol r r
    mi' mi mi

    %22
    la, la la
    re re re
    sol sol sol

    %25
    dod, dod dod
    fad fad fad
    si, si si

    %28
    mi fad fad,\mbreak
    si si'8.[la16 sol8. fad16]
    mi4 mi mi

    %31
    si si si
    si si si
    mi mi mi

    %34
    mi mi mi
    fad red si
    mi mi mi

    %37
    fad red si\mbreak
    mi mi mi
    mi fad8.[sol16 la8. si16]

    %40
    mi,8. la16 si4 si,
    mi mi mi,
    mi fad8.[sol16 la8. si16]

    %43
    mi,8. la16 si4 si
    mi si si
    mi,2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp




}

forma = {

    \key sol\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 30
    s2.*45
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

IIvcI = {
    \IIglobal
    \clef bass
    <<\IIvcIn \forma>>

}

IIvcII = {
    \IIglobal
    \clef bass
    <<\IIvcIIn \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


IIIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIIvlIn =  \relative do'' {

    sol4 sol'4. fad16 mi
    re8[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 re si' sol

    %4
    re'4 sol4. fad16 mi
    re8[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 re si' sol

    %7
    re'4 re4. do16 si
    do8 si16 la do8 si16 la si4
    re re4. do16 si

    %10
    do8 si16 la do8 si16 la si4
    sol'16[fad mi re do si la sol fad mi re do]\mbreak
    si8 la sol \once\stemDown sol'' dod,4

    %13
    re4. sol8 dod,4
    re4. sol8 si,16 la sol fad
    sol8 re sol, \once\stemDown sol'' si,16 la sol fad

    %16
    sol8 re sol,4 r
    r8 si' [re sol si la16 sol]
    la8 re, fad la re16 do si la

    %19
    si[sol fad mi re do si la]sol8 sol'\mbreak  %%% fine p. 20
    fad16 sol la sol re mi fad re la8 fad'
    sol4 r r

    %22
    R2.*3
    si16 do re do si sol si do re si la sol
    la si do si la fad la si do la sol fad

    %27
    sol la si la sol mi sol la si sol fad mi
    fad sol la sol fad re fad sol la fad mi re\mbreak
    si'4 r r

    %30
    R2.*3
    sol16 la si la sol la sol fad mi fad mi re
    dod2.

    %35
    re~
    re
    dod16 re mi dod la si dod la mi' fad sol mi\mbreak

    %38
    fad la sol fad mi8 re mi dod
    re4 re4. dod16 si
    la8[sol16 fad mi8 re16 dod si8 la]

    %41
    re4 re'4. dod16 si
    la8[sol16 fad mi8 re16 dod si8 la]
    re4 la''4. sol16 fad

    %44
    sol8 fad16 mi sol8 fad16 mi fad4
    la la4. sol16 fad
    sol8 fad16 mi sol8 fad16 mi fad4

    %47
    re,8 [fad la la' fad16 mi re dod]\mbreak
    re8 la re, la'' fad16 mi re dod
    re8 la re,  la'' fad16 mi re dod

    %50
    fad re la re la re la re la re la re
    mi dod la dod la dod la dod la dod la dod
    fad re la re la re la re la re la re

    %53
    mi dod la dod la dod la dod la4
    R2.*4
    la'16 fad la, fad' la, fad' la, fad' la, fad' la, fad'

    %59
    re si re, si' re, si' re, si' re, si' re, si'
    si' sold si, sold' si, sold' si, sold' si, sold' si, sold'
    mi dod mi, dod' mi, dod' mi, dod' mi, dod' mi, dod'

    %62
    fad re la re la re la re la re la re
    fad re la re la re la re la re la re
    fad re la re la re la re la re la re

    %65
    fad re la re la re la re la re la re\mbreak
    sol4(fad) mi
    re2 r4

    %68
    R2.*8\mbreak
    re,4 re'4. dod16 si
    la8[sol16 fad mi8 re16 dod si8 la]

    %78
    re4 re'4. dod16 si
    fad'8[mi16 re dod8 si lad sold]
    fad4 fad'4. mi16 re

    %81
    mi8 re16 dod mi8 re16 dod re4
    fad fad4. mi16 re
    mi8 re16 dod mi8 re16 dod re4

    %84
    si8[re fad si fad16 mi re dod]
    si8 fad si, \once\stemDown si'' fad16 mi re dod
    si8 fad si, \once\stemDown si'' fad16 mi re dod\mbreak

    %87
    si4(re) fad
    dod2.
    lad'4(si) dod?

    %90
    re,4. dod8 si4
    mi(sol) si
    dod2.

    %93
    re,4(fad) la
    si2.
    dod,4(mi) sol\mbreak

    %96
    lad2.
    si8.(lad?16) si2
    dod8.(si16) dod2

    %99
    re8.(dod16) re2
    dod4(si) lad
    si4. dod8 re4

    %102
    dod8 si lad4.\tr si8
    si4 si4. la?16 sol
    fad8[mi16 re dod8 si lad sold]\mbreak

    %105
    la8 re, si' fad re' si
    fad'4 fad4. mi16 re
    mi8 re16 dod mi8 re16 dod re4

    %108
    fad fad4. mi16 re
    mi8 re16 dod mi8 re16 dod re4
    re re4. do!16 si

    %111
    do8 si16 la do8 si16 la si4
    re re4. do16 si
    do8 si16 la do8 si16 la si4

    %114
    re16 re' do re re, re' do re re, re' do si\mbreak
    do do si do re, do' si do re, do' si la
    si4 r r

    %117
    R2.
    re16 re, re' re, re' re, re' re, re' re, re' re,
    do' re, do' re, do' re, do' re, do' re, do' re,

    %120
    si'4 r r
    R2.
    r8 re, sol si re si

    %123
    la16 fad la fad la fad la fad la fad la fad\mbreak
    re' fad, re' fad, re' fad, re' fad, re' fad, re' fad,
    sol mi sol mi sol mi sol mi sol mi sol mi

    %126
    do' mi, do' mi, do' mi, do' mi, do' mi, do' mi,
    fad re fad re fad re fad re fad re fad re
    si' re, si' re, si' re, si' re, si' re, si' re,

    %129
    mi do mi do mi do mi do mi do mi do
    la' mi la mi la mi la mi la mi la mi
    fad re fad re sol re sol re la' re, la' re,

    %132
    si' re, si' re, la' re, la' re, sol re sol re\mbreak
    fad8 re fad la re la
    si do16 re si8 sol la fad

    %135
    sol4 r r
    R2.*12
    si16 do si do si do si do si do si do

    %149
    si8 sol si re si sol
    si16 do si do si do si do si do si do
    si8 sol si re si sol\mbreak

    %152
    re'4(do) si
    do(si) la
    si re,4. do16 si

    %155
    do8 si16 la do8 si16 la si4
    re re4. do16 si
    do8 si16 la do8 si16 la si4

    %158
    sol'16[fad mi re do si la sol] fad mi re do
    si8 la sol \once\stemDown sol'' dod,4
    re4. sol8 dod,4

    %161
    re4. sol8 si,16 la sol fad
    sol8 re  sol, \once\stemDown sol'' si,16 la sol fad
    sol8 re  sol, \once\stemDown sol'' si,16 la sol fad

    %164
    sol2.\fermata

}

IIIvlIIn = \relative do'' {

    sol4 si4. la16 sol
    re'8[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 re si' sol

    %4
    si4 si4. la16 sol
    re'8[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 re si' sol

    %7
    si4 si4. la16 sol
    la8 sol16 fad la8 sol16 fad sol4
    si4 si4. la16 sol

    %10
    la8 sol16 fad la8 sol16 fad sol4
    sol'16[fad mi re do si la sol fad mi re do]\mbreak
    si8 la sol \once\stemDown sol'' dod,4

    %13
    re4. sol8 dod,4
    re4. sol8 si,16 la sol fad
    sol8 re sol, \once\stemDown sol'' si,16 la sol fad

    %16
    sol8 re sol,4 r
    r16 sol''[fad mi re do si la] sol8 sol'
    fad16 sol la fad re mi fad re la8 fad'

    %19
    sol [si, re sol si la16 sol]\mbreak
    la8 re, fad la re16 do si la
    si4 r r

    %22
    R2.*3
    sol16 la si la sol re sol la si sol fad mi
    fad sol la sol fad re fad sol la fad mi re

    %27
    mi fad sol fad mi dod mi fad sol mi re dod
    re mi fad mi re la re mi fad la sol fad\mbreak
    sol4 r r

    %30
    R2.*4
    dod,16 re mi re dod re dod si la si la sol
    fad2.

    %36
    sol~
    sol2 dod16 re mi dod\mbreak
    re fad mi re dod8 si dod mi

    %39
    fad4 fad4. mi16 re
    la8[sol16 fad mi8 re16 dod si8 la]

    %41
    fad'4 fad'4. mi16 re
    la8[sol16 fad mi8 re16 dod si8 la]
    re4 fad'4. mi16 re

    %44
    mi8 re16 dod mi8 re16 dod re4
    fad fad4. mi16 re
    mi8 re16 dod mi8 re16 dod re4

    %47
    re,8 [fad la la' fad16 mi re dod]\mbreak
    re8 la re, la'' fad16 mi re dod
    re8 la re,  la'' fad16 mi re dod

    %50
    re,4(fad) re'
    dod4.\tr si8 la4
    re8.[(mi16) fad8.(sol16)] la4

    %53
    \grace re,8 dod4.\tr si8 la4
    R2.*4
    re,4(fad) do'?

    %59
    do\tr  si8 la si4
    mi, \parentSlur (sold) re'
    re\tr dod8 si dod4

    %62
    re,(fad) la
    fad' mi8. fad16 re4
    re,(fad) la

    %65
    fad' mi8. fad16 re4\mbreak
    mi(re) dod
    re2 r4

    %68
    R2.*8\mbreak
    fad,4 fad'4. mi16 re
    la8[sol16 fad mi8 re16 dod si8 la]

    %78
    fad'4 fad'4. mi16 re
    fad8[mi16 re dod8 si lad sold]
    fad4 re'4. dod16 si

    %81
    dod8 lad dod lad si4
    re re4. dod16 si
    dod8 lad dod lad si4

    %84
    si8[re fad si fad16 mi re dod]
    si8 fad si, \once\stemDown si'' fad16 mi re dod
    si8 fad si, \once\stemDown si'' fad16 mi re dod\mbreak

    %87
    si4 r r
    lad(dod?) mi
    fad,2.

    %90
    si4(re) fad
    sol2.
    la,4(dod) mi

    %93
    fad2.
    sol,4(si) re
    mi2.~\mbreak

    %96
    mi
    re8.(dod16) re2
    mi8.(re16) mi2

    %99
    fad8.(mi16) fad2
    mi4(re) dod
    re4. mi8 fad4

    %102
    mi8 re dod4.\tr si8
    si4 re4. dod16 si
    fad'8[mi16 re dod8 si lad sold]\mbreak

    %105
    fad8 re fad re si' fad
    re'4 re4. dod16 si
    dod8 lad dod lad si4

    %108
    re4 re4. dod16 si
    dod8 lad dod lad si4
    si4 si4. la16 sol

    %111
    la8 sol16 fad la8 sol16 fad sol4
    si4 si4. la16 sol
    la8 sol16 fad la8 sol16 fad sol4

    %114
    re'16 si' la si re, si' la si re, si' la sol\mbreak
    la la sol la re, la' sol la re, la' sol fad
    sol4 r r

    %117
    R2.
    si16 re, si' re, si' re, si' re, si' re, si' re,
    la' re, la' re, la' re, la' re, la' re, la' re,

    %120
    sol4 r r
    R2.
    r8 si, re sol si sol

    %123
    fad16 re fad re fad re fad re fad re fad re\mbreak
    fad re fad re fad re fad re fad re fad re
    si' sol si sol si sol si sol si sol si sol

    %126
    mi do mi do mi do mi do mi do mi do
    la' fad la fad la fad la fad la fad la fad
    re si re si re si re si re si re si

    %129
    sol' mi sol mi sol mi sol mi sol mi sol mi
    do la do la do la do la do la do la
    la re, la' re, si' re, si' re, do' re, do' re,

    %132
    re' re, re' re, do' re, do' re, si' re, si' re,\mbreak
    la'8 la re fad la fad
    sol la16 si re,8[si' do la]

    %135
    sol4 r r
    R2.*12
    sol16 la sol la sol la sol la sol la sol la

    %149
    sol8 re sol si sol re
    sol16 la sol la sol la sol la sol la sol la
    sol8 re sol si sol re\mbreak

    %152
    si'4(la) sol
    la(sol) fad
    sol si,4. la16 sol

    %155
    la8 sol16 fad la8 sol16 fad sol4
    si si4. la16 sol
    la8 sol16 fad la8 sol16 fad sol4

    %158
    sol'16[fad mi re do si la sol] fad mi re do
    si8 la sol \once\stemDown sol'' dod,4
    re4. sol8 dod,4

    %161
    re4. sol8 si,16 la sol fad
    sol8 re  sol, \once\stemDown sol'' si,16 la sol fad
    sol8 re  sol, \once\stemDown sol'' si,16 la sol fad

    %164
    sol2.\fermata

}


IIIvlIripn =  \relative do'' {

    sol4 sol'4. fad16 mi
    re8[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 re si' sol

    %4
    re'4 sol4. fad16 mi
    re8[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 re si' sol

    %7
    re'4 re4. do16 si
    do8 si16 la do8 si16 la si4
    re re4. do16 si

    %10
    do8 si16 la do8 si16 la si4
    sol'16[fad mi re do si la sol fad mi re do]\mbreak
    si8 la sol \once\stemDown sol'' dod,4

    %13
    re4. sol8 dod,4
    re4. sol8 si,16 la sol fad
    sol8 re sol, \once\stemDown sol'' si,16 la sol fad

    %16
    sol8 re sol,4 r
    r8 si' [re sol si la16 sol]
    la8 re, fad la re16 do si la

    %19
    si[sol fad mi re do si la]sol8 sol'\mbreak  %%% fine p. 20
    fad16 sol la sol re mi fad re la8 fad'
    sol4 r r

    %22
    R2.*17
    fad,4 fad'4. mi16 re
    la8[sol16 fad mi8 re16 dod si8 la]

    %41
    re4 re'4. dod16 si
    la8[sol16 fad mi8 re16 dod si8 la]
    re4 la''4. sol16 fad

    %44
    sol8 fad16 mi sol8 fad16 mi fad4
    la la4. sol16 fad
    sol8 fad16 mi sol8 fad16 mi fad4

    %47
    re,8 [fad la la' fad16 mi re dod]\mbreak
    re8 la re, la'' fad16 mi re dod
    re8 la re,  la'' fad16 mi re dod

    %50
    re4 r r
    R2.*25
    re,4 re'4. dod16 si
    la8[sol16 fad mi8 re16 dod si8 la]

    %78
    re4 re'4. dod16 si
    fad'8[mi16 re dod8 si lad sold]
    fad4 fad'4. mi16 re

    %81
    mi8 re16 dod mi8 re16 dod re4
    fad fad4. mi16 re
    mi8 re16 dod mi8 re16 dod re4

    %84
    si8[re fad si fad16 mi re dod]
    si8 fad si, \once\stemDown si'' fad16 mi re dod
    si8 fad si, \once\stemDown si'' fad16 mi re dod\mbreak

    %87
    si4 r r
    R2.*15
    si4 si'4. la16 sol
    fad8[mi16 re dod8 si lad sold]\mbreak

    %105
    la8 re, si' fad re' si
    fad'4 fad4. mi16 re
    mi8 re16 dod mi8 re16 dod re4

    %108
    fad fad4. mi16 re
    mi8 re16 dod mi8 re16 dod re4
    re re4. do!16 si

    %111
    do8 si16 la do8 si16 la si4
    re re4. do16 si
    do8 si16 la do8 si16 la si4

    %114
    R2.*40
    re4 re4. do16 si

    %155
    do8 si16 la do8 si16 la si4
    re re4. do16 si
    do8 si16 la do8 si16 la si4

    %158
    sol'16[fad mi re do si la sol] fad mi re do
    si8 la sol \once\stemDown sol'' dod,4
    re4. sol8 dod,4

    %161
    re4. sol8 si,16 la sol fad
    sol8 re  sol, \once\stemDown sol'' si,16 la sol fad
    sol8 re  sol, \once\stemDown sol'' si,16 la sol fad

    %164
    sol2.\fermata

}

IIIvlIIripn = \relative do'' {

    sol4 si4. la16 sol
    re'8[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 re si' sol

    %4
    si4 si4. la16 sol
    re'8[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 re si' sol

    %7
    si4 si4. la16 sol
    la8 sol16 fad la8 sol16 fad sol4
    si4 si4. la16 sol

    %10
    la8 sol16 fad la8 sol16 fad sol4
    sol'16[fad mi re do si la sol fad mi re do]\mbreak
    si8 la sol \once\stemDown sol'' dod,4

    %13
    re4. sol8 dod,4
    re4. sol8 si,16 la sol fad
    sol8 re sol, \once\stemDown sol'' si,16 la sol fad

    %16
    sol8 re sol,4 r
    r16 sol''[fad mi re do si la] sol8 sol'
    fad16 sol la fad re mi fad re la8 fad'

    %19
    sol [si, re sol si la16 sol]\mbreak
    la8 re, fad la re16 do si la
    si4 r r

    %22
    R2.*17
    fad4 fad4. mi16 re
    la8[sol16 fad mi8 re16 dod si8 la]

    %41
    fad'4 fad'4. mi16 re
    la8[sol16 fad mi8 re16 dod si8 la]
    re4 fad'4. mi16 re

    %44
    mi8 re16 dod mi8 re16 dod re4
    fad fad4. mi16 re
    mi8 re16 dod mi8 re16 dod re4

    %47
    re,8 [fad la la' fad16 mi re dod]\mbreak
    re8 la re, la'' fad16 mi re dod
    re8 la re,  la'' fad16 mi re dod

    %50
    re4 r r
    R2.*25
    fad,4 fad'4. mi16 re
    la8[sol16 fad mi8 re16 dod si8 la]

    %78
    fad'4 fad'4. mi16 re
    fad8[mi16 re dod8 si lad sold]
    fad4 re'4. dod16 si

    %81
    dod8 lad dod lad si4
    re re4. dod16 si
    dod8 lad dod lad si4

    %84
    si8[re fad si fad16 mi re dod]
    si8 fad si, \once\stemDown si'' fad16 mi re dod
    si8 fad si, \once\stemDown si'' fad16 mi re dod\mbreak

    %87
    si4 r r
    R2.*15
    re,4 re'4. dod16 si
    fad'8[mi16 re dod8 si lad sold]\mbreak

    %105
    fad8 re fad re si' fad
    re'4 re4. dod16 si
    dod8 lad dod lad si4

    %108
    re4 re4. dod16 si
    dod8 lad dod lad si4
    si4 si4. la16 sol

    %111
    la8 sol16 fad la8 sol16 fad sol4
    si4 si4. la16 sol
    la8 sol16 fad la8 sol16 fad sol4

    %114
    R2.*40
    si4 si4. la16 sol


    %155
    la8 sol16 fad la8 sol16 fad sol4
    si si4. la16 sol
    la8 sol16 fad la8 sol16 fad sol4

    %158
    sol'16[fad mi re do si la sol] fad mi re do
    si8 la sol \once\stemDown sol'' dod,4
    re4. sol8 dod,4

    %161
    re4. sol8 si,16 la sol fad
    sol8 re  sol, \once\stemDown sol'' si,16 la sol fad
    sol8 re  sol, \once\stemDown sol'' si,16 la sol fad

    %164
    sol2.\fermata

}

IIIvlan = \relative do'{

    si8 la si do re mi
    re'[do16 si la8 sol16 fad mi8 re16 do]
    si8[la16 sol si8 sol re' si]

    %4
    si la si do re mi
    re'[do16 si la8 sol16 fad mi8 re16 do]
    si8[la16 sol si8 sol re' si]

    %7
    re4 re4. re8
    fad4 fad re
    re re4. re8

    %10
    fad4 fad re
    si r r\mbreak
    re8 do si re mi[la]

    %13
    la sol fad re mi la
    la sol fad re mi fad
    sol re sol, re' mi fad

    %16
    sol re sol,4 r
    R2.*22
    fad'8 mi fad sol la si

    %40
    la[sol16 fad mi8 re16 dod si8 la]
    fad'8 mi fad sol la si
    la[sol16 fad mi8 re16 dod si8 la]

    %43
    la4 fad' la
    dod dod la
    la la4. la8

    %46
    dod4 dod la
    fad4 r8 la si dod\mbreak
    re la re, la' si dod

    %49
    re la re, la' si dod
    re4 r r
    R2.*25

    %76
    fad,8 mi fad sol la si
    la[sol16 fad mi8 re16 dod si8 la]
    re4 re8 mi fad sol

    %79
    fad[mi16 re dod8 si lad sold]
    fad16[re' mi fad sol? la? si dod] re8 re,
    lad'4 lad fad

    %82
    re8[mi16 fad sol la? si dod] re8 re,
    lad'4 lad fad
    fad r8 fad sol lad,

    %85
    si fad' si, [fad' sol lad,]
    si fad' si, [fad' sol lad,]\mbreak
    si4 r r

    %88
    R2.*15
    re8 dod re mi fad sol
    fad[mi16 re dod8 si lad sold]\mbreak %% fine p. 29

    %105
    fad'8 re re si fad' re
    re16[mi fad sol la si dod re] re,8 fad
    lad4 lad fad

    %108
    re16[mi fad sol la? si dod re] re,8 fad
    lad4 lad fad
    si,16 [do? re mi fad sol la? si] sol8 re

    %111
    fad4 fad re
    si16 [do re mi fad sol la si] sol8 re
    fad4 fad re\mbreak

    %114
    R2.*40
    si16[do re mi fad sol la si] re,8 re
    fad4 fad re

    %156
    si16[do re mi fad sol la si] re,8 re
    fad4 fad re
    si r r

    %159
    re8 do si re mi la
    la sol fad re mi la
    la sol fad re mi fad

    %162
    sol re sol, re' mi fad
    sol re sol, re' re re
    si2.\fermata

}

IIIvcIn = \relative do {

    sol'8 fad sol la si do
    re[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 sol, sol' sol,

    %4
    sol' fad sol la si do
    re[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 sol, sol' sol,

    %7
    sol16[la si do re mi fad sol] sol,8 sol'
    re re' la re, sol4
    sol,16[la si do re mi fad sol] sol,8 sol'

    %10
    re re' la re, sol4
    sol, r r\mbreak
    sol4. si'8 la sol

    %13
    fad mi re si' la sol
    fad mi re si do? re
    sol,4. si8 do re

    %16
    sol,4 r r
    sol4 r8 sol sol' sol,
    re'4 r8 re re' re,

    %19
    sol,4 r8 sol sol' sol,\mbreak
    re'4 r8 re re' re,
    sol, [si re sol] si la16 sol

    %22
    la8[re, fad la re16 do si la]
    si[sol fad  mi re do si la] sol8 sol'
    fad16 sol la fad re mi fad re la8 fad'

    %25
    sol4 sol sol,
    re' re' re,
    sol la la,

    %28
    re re' re,\mbreak
    si'16 do re do si sol si do re si la sol
    la si do si la fad la si do la sol fad

    %31
    sol la si la sol mi sol la si sol fad mi
    fad sol la sol fad re fad sol la fad mi re
    si'4 r r

    %34
    R2.
    fad16 sol la sol fad sol fad mi re mi re dod
    si2.

    %37
    la\mbreak   %%% fine p. 22
    re4 la' la,
    re8 dod re mi fad sol

    %40
    la[sol16 fad mi8 re16 dod si8 la]
    re dod re mi fad sol
    la[sol16 fad mi8 re16 dod si8 la]

    %43
    re16[mi fad sol la si dod re] re,8 re'
    la, la' mi la, re4
    re16[mi fad sol la si dod re] re,8 re'

    %46
    la, la' mi la, re4
    re r8 fad sol la\mbreak
    re,4 r8 fad sol la

    %49
    re,4 r8 fad sol la
    re, dod re mi fad re
    la'4 la, r

    %52
    re8 dod re mi fad re
    la'4 la, r
    \clef tenor fad''16 re la re la re la re la re la re

    %55
    mi dod la dod la dod la dod la dod la dod
    fad re la re la re la re la re la re\mbreak
    mi dod la dod la dod la dod la4

    %58
    \clef bass re,8 do? re mi fad re
    la'4 la, r
    mi'8  re mi fad sold mi

    %61
    la4 la, r
    re8 dod re mi fad mi
    re4 r r

    %64
    re8 dod re mi fad mi
    re4 r fad\mbreak
    sol la la,

    %67
    la'16 fad la, fad' la, fad' la, fad' la, fad' la, fad'
    re si re, si' re, si' re, si' re, si' re, si'
    si' sold si, sold' si, sold' si, sold' si, sold' si, sold'

    %70
    mi dod mi, dod' mi, dod' mi, dod' mi, dod' mi, dod'
    \clef tenor fad' re la re la re la re la re la re
    fad re la re la re la re la re la re

    %73
    fad re la re la re la re la re la re
    fad re la re la re la re la re la re
    sol4(fad) mi\mbreak

    %76
    re \clef bass re,8 mi fad sol
    la[sol16 fad mi8 re16 dod si8 la]
    re dod si dod re mi

    %79
    fad[mi16 re dod8 si lad sold]
    fad16[si dod re mi fad sol? la?] si8 si,
    fad fad' dod fad, si4

    %82
    si8[dod16 re mi fad sol la] si8 si,
    fad fad' dod fad, si4
    si r8 re mi fad

    %85
    si fad si, re mi fad
    si fad si, re mi fad\mbreak
    \clef tenor fad16 si re si fad si re si fad si re si

    %88
    fad lad dod lad fad lad dod lad fad lad dod lad
    fad lad dod lad fad lad dod lad fad lad dod lad
    fad si re si  fad si re si  fad si re si

    %91
    sol si mi si sol si mi si sol si mi si
    la dod mi dod la dod mi dod la dod mi la,
    fad la re la fad la re la fad la re la

    %94
    sol si re si sol si re si sol si re si
    mi, sol dod sol mi sol dod sol mi sol dod sol\mbreak
    fad lad dod lad fad lad dod lad fad lad dod lad

    %97
    fad si re si  fad si re si  fad si re si
    fad dod' mi dod fad, dod' mi dod fad, dod' mi dod
    si re fad re si re fad re si re fad re

    %100
    fad, dod' mi dod fad, dod' mi dod fad, dod' mi dod
    fad, si re si  fad si re si  fad si re si
    \clef bass mi,4 fad fad,

    %103
    si'8 lad si dod re mi
    fad[mi16 re dod8 si lad sold]\mbreak %% fine p. 29
    fad8 [re] si si' si, si'

    %106
    si,16[dod re mi fad sol la si] si,8 si'
    fad, fad' dod fad, si4
    si16[dod re mi fad sol la si] si,8 si'

    %109
    fad, fad' dod fad, si4
    sol16 [la si do? re mi fad sol] sol,8 sol'
    re re' la re, sol4

    %112
    sol,16 [la si do re mi fad sol] sol,8 sol'
    re re' la re, sol4
    sol,2 r4\mbreak

    %115
    re'2 r4
    re16 re' do re re, re' do re re, re' do si
    do do si do re, do' si do re, do' si la

    %115
    si4 r r
    R2.
    re16 re, re' re, re' re, re' re, re' re, re' re,

    %118
    do' re, do' re, do' re, do' re, do' re, do' re,
    si'4 sol sol,
    re' re re\mbreak

    %124
    re re re
    mi mi mi
    mi mi mi

    %127
    re re re
    re re re
    do do do

    %130
    do do do
    re re re
    re re re\mbreak

    %133
    re re re
    sol4. sol8 do, re
    r8 re sol si re si

    %136
    la16 fad la fad la fad la fad la fad la fad
    re' fad, re' fad, re' fad, re' fad, re' fad, re' fad,
    sol mi sol mi sol mi sol mi sol mi sol mi

    %139
    do' mi, do' mi, do' mi, do' mi, do' mi, do' mi,
    fad re fad re fad re fad re fad re fad re
    si' re, si' re, si' re, si' re, si' re, si' re,

    %142
    mi do mi do mi do mi do mi do mi do\mbreak
    la' mi la mi la mi la mi la mi la mi
    fad re fad re sol re sol re la' re, la' re,

    %145
    si' re, si' re, la' re, la' re, sol re sol re
    fad8 re fad la re la
    si[do16 re si8 sol la fad]

    %148
    sol4 r r
    si16 do si do si do si do si do si do
    si8 sol si re si sol

    %151
    si16 do si do si do si do si do si do\mbreak
    si[\parenthesize si, do re mi fad sol la] si8 sol
    do,4 re re,

    %154
    sol16[la si do re mi fad sol] sol,8 sol'
    re re' la re, sol4
    sol,16[la si do re mi fad sol] sol,8 sol'

    %157
    re re' la re, sol4
    sol, r r
    sol4. si'8 la sol

    %160
    fad mi re si' la sol
    fad mi re si do re
    sol,4. si8 do re

    %163
    sol,4. sol8 re' re,
    sol2.\fermata

}

IIIvcIIn = \relative do {

    sol'8 fad sol la si do
    re[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 sol, sol' sol,

    %4
    sol' fad sol la si do
    re[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 sol, sol' sol,

    %7
    sol16[la si do re mi fad sol] sol,8 sol'
    re re' la re, sol4
    sol,16[la si do re mi fad sol] sol,8 sol'

    %10
    re re' la re, sol4
    sol, r r\mbreak
    sol4. si'8 la sol

    %13
    fad mi re si' la sol
    fad mi re si do? re
    sol,4. si8 do re

    %16
    sol,4 r r
    sol4 r8 sol sol' sol,
    re'4 r8 re re' re,

    %19
    sol,4 r8 sol sol' sol,\mbreak
    re'4 r8 re re' re,
    sol,16[sol' fad mi re do si la] sol8 sol'

    %22
    fad16 sol la fad re mi fad re la8 fad'
    sol [si, re sol] si la16 sol
    la8 re, fad la re16 do si la

    %25
    si4 sol sol,
    re' re' re,
    sol la la,

    %28
    re re' re,\mbreak
    sol16 la si \parenthesize la sol re sol la si sol fad mi
    fad sol la sol fad re fad sol la fad mi re

    %31
    mi fad sol fad mi dod mi fad sol mi re dod
    re mi fad mi re la re mi fad la sol fad
    sol4 sol,2

    %34
    la2.
    re
    si16 dod re dod si dod si la sol fad mi re

    %37
    la'2.\mbreak
    re4 la' la,
    re8 dod re mi fad sol

    %40
    la[sol16 fad mi8 re16 dod si8 la]
    re dod re mi fad sol
    la[sol16 fad mi8 re16 dod si8 la]

    %43
    re16[mi fad sol la si dod re] re,8 re'
    la, la' mi la, re4
    re16[mi fad sol la si dod re] re,8 re'

    %46
    la, la' mi la, re4
    re r8 fad sol la\mbreak
    re,4 r8 fad sol la

    %49
    re,4 r8 fad sol la
    re, dod re mi fad re
    la'4 la, r

    %52
    re8 dod re mi fad re
    la'4 la, r
    \clef tenor re(fad) re'

    %55
    dod4.\tr si8 la4
    re8.[mi16 fad8. sol16] la4\mbreak
    \appoggiatura re,8 dod4.\tr si8 la4

    %58
    \clef bass re,8 do? re mi fad re
    la'4 la, r
    mi'8  re mi fad sold mi

    %61
    la4 la, r
    re8 dod re mi fad mi
    re4 r r

    %64
    re8 dod re mi fad mi
    re4 r fad\mbreak
    sol la la,

    %67
    \clef tenor re(fad) do'
    do\tr si8 la si4
    mi,(sold) re'

    %70
    re dod8(si) dod4
    re,(fad) la
    fad' mi8. fad16 re4

    %73
    re,(fad) la
    fad' mi8. fad16 re4
    mi(re) dod\mbreak

    %76
    re \clef bass re,8 mi fad sol
    la[sol16 fad mi8 re16 dod si8 la]
    re dod si dod re mi

    %79
    fad[mi16 re dod8 si lad sold]
    fad16[si dod re mi fad sol? la?] si8 si,
    fad fad' dod fad, si4

    %82
    si8[dod16 re mi fad sol la] si8 si,
    fad fad' dod fad, si4
    si r8 re mi fad

    %85
    si fad si, re mi fad
    si fad si, re mi fad\mbreak
    fad16 fad si fad fad  fad si fad fad fad si fad

    %88
    fad fad lad fad fad fad lad fad fad fad lad fad
    fad fad lad fad fad fad lad fad fad fad lad fad
    fad fad si fad fad  fad si fad fad fad si fad

    %91
    mi sol si sol mi sol si sol mi sol si sol
    mi la dod la mi la dod la mi la dod la
    re,  fad la fad re fad la fad re fad la fad

    %94
    re sol si sol re sol si sol re sol si sol
    dod, mi sol mi dod mi sol mi dod mi sol mi\mbreak
    fad fad lad fad fad fad lad fad fad fad lad fad

    %97
    fad fad si fad fad fad si fad fad fad si fad
    fad lad dod lad fad lad dod lad fad lad dod lad
    fad si re si fad si re si fad si re si

    %100
    fad lad dod lad fad lad dod lad fad lad dod lad
    fad fad si fad fad fad si fad fad fad si fad
    mi4 fad fad,

    %103
    si'8 lad si dod re mi
    fad[mi16 re dod8 si lad sold]\mbreak %% fine p. 29
    fad8 [re] si si' si, si'

    %106
    si,16[dod re mi fad sol la si] si,8 si'
    fad, fad' dod fad, si4
    si16[dod re mi fad sol la si] si,8 si'

    %109
    fad, fad' dod fad, si4
    sol16 [la si do? re mi fad sol] sol,8 sol'
    re re' la re, sol4

    %112
    sol,16 [la si do re mi fad sol] sol,8 sol'
    re re' la re, sol4
    sol,2 r4\mbreak

    %115
    re'2 r4
    re16 si' la si re, si' la si re, si' la sol
    la la sol la re, la' sol la re, la' sol fad

    %118
    sol4 r r
    R2.
    si16 re, si' re, si' re, si' re, si' re, si' re,

    %121
    la' re, la' re, la' re, la' re, la' re, la' re,
    sol4 sol sol,
    re' re re\mbreak

    %124
    re re re
    mi mi mi
    mi mi mi

    %127
    re re re
    re re re
    do do do

    %130
    do do do
    re re re
    re re re\mbreak

    %133
    re re re
    sol4. sol8 do, re
    r8 si re sol si sol

    %136
    fad16 re fad re fad re fad re fad re fad re
    fad re fad re fad re fad re fad re fad re
    si' sol si sol si sol si sol si sol si sol

    %139
    mi do mi do mi do mi do mi do mi do
    la' fad la fad la fad la fad la fad la fad
    re si re si re si re si re si re si

    %142
    sol' mi sol mi sol mi sol mi sol mi sol mi\mbreak
    do' la do la do la do la do la do la
    la fad la fad si sol si sol do la do la

    %145
    re si re si do la do la si sol si sol
    la8 fad la re la fad
    sol la16 si sol8[si do la]

    %148
    sol4 r r
    sol16 la sol la sol la sol la sol la sol la
    sol8 re sol si sol re

    %151
    sol16 la sol la sol la sol la sol la sol la\mbreak
    sol[sol, la si do re mi fad] sol8 sol,
    do4 re re,

    %154
    sol16[la si do re mi fad sol] sol,8 sol'
    re re' la re, sol4
    sol,16[la si do re mi fad sol] sol,8 sol'

    %157
    re re' la re, sol4
    sol, r r
    sol4. si'8 la sol

    %160
    fad mi re si' la sol
    fad mi re si do re
    sol,4. si8 do re

    %163
    sol,4. sol8 re' re,
    sol2.\fermata

}

IIIbcn = \relative do {

    sol'8 fad sol la si do
    re[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 sol, sol' sol,

    %4
    sol' fad sol la si do
    re[do16 si la8 sol16 fad mi8 re16 do]
    si8 la16 sol sol'8 sol, sol' sol,

    %7
    sol16[la si do re mi fad sol] sol,8 sol'
    re re' la re, sol4
    sol,16[la si do re mi fad sol] sol,8 sol'

    %10
    re re' la re, sol4
    sol, r r\mbreak
    sol4. si'8 la sol

    %13
    fad mi re si' la sol
    fad mi re si do? re
    sol,4. si8 do re

    %16
    sol,4 r r
    sol4 r8 sol sol' sol,
    re'4 r8 re re' re,

    %19
    sol,4 r8 sol sol' sol,\mbreak
    re'4 r8 re re' re,
    sol,4 r8 sol sol' sol,

    %22
    re4 r8 re fad re
    sol4 r8 sol sol' sol,
    re4 r8 re fad re

    %25
    sol4 sol' sol,
    re' re' re,
    sol la la,

    %28
    re re' re,\mbreak
    sol, sol' sol,
    re re' re,

    %31
    sol la la
    re, re' re,
    sol2.

    %34
    la
    re
    sol,

    %37
    la\mbreak
    re4 la' la,
    re8 dod re mi fad sol

    %40
    la[sol16 fad mi8 re16 dod si8 la]
    re dod re mi fad sol
    la[sol16 fad mi8 re16 dod si8 la]

    %43
    re16[mi fad sol la si dod re] re,8 re'
    la, la' mi la, re4
    re16[mi fad sol la si dod re] re,8 re'

    %46
    la, la' mi la, re4
    re r8 fad sol la\mbreak
    re,4 r8 fad sol la

    %49
    re,4 r8 fad sol la
    re, dod re mi fad re
    la'4 la, r

    %52
    re8 dod re mi fad re
    la'4 la, r
    re8 dod re mi fad re

    %55
    la'4 la, r
    re8 dod re mi fad re\mbreak
    la'4 la, r

    %58
    re8 do? re mi fad re
    la'4 la, r
    mi'8  re mi fad sold mi

    %61
    la4 la, r
    re8 dod re mi fad mi
    re4 r r

    %64
    re8 dod re mi fad mi
    re4 r fad\mbreak
    sol la la,

    %67
    re,8 mi fad mi fad re
    sol4 sol r
    mi8 fad sold fad sold mi

    %70
    la4 la r
    re8 dod re mi fad mi
    re4 r r

    %73
    re8 dod re mi fad mi
    re4 r fad
    sol la la,\mbreak

    %76
    re8 dod re mi fad sol
    la[sol16 fad mi8 re16 dod si8 la]
    re dod si dod re mi

    %79
    fad[mi16 re dod8 si lad sold]
    fad16[si dod re mi fad sol? la?] si8 si,
    fad fad' dod fad, si4

    %82
    si8[dod16 re mi fad sol la] si8 si,
    fad fad' dod fad, si4
    si r8 re mi fad

    %85
    si fad si, re mi fad
    si fad si, re mi fad\mbreak
    si,2.

    %88
    fad'
    lad,
    si4~si8 la? sol fad

    %91
    mi4 mi'2
    la,2.
    re

    %94
    sol,
    dod\mbreak
    re2.~

    %97
    re~
    re~
    re~

    %100
    re
    si2 si4
    mi fad fad,

    %103
    si'8 lad si dod re mi
    fad[mi16 re dod8 si lad sold]\mbreak %% fine p. 29
    fad8 [re] si si' si, si'

    %106
    si,16[dod re mi fad sol la si] si,8 si'
    fad, fad' dod fad, si4
    si16[dod re mi fad sol la si] si,8 si'

    %109
    fad, fad' dod fad, si4
    sol16 [la si do? re mi fad sol] sol,8 sol'
    re re' la re, sol4

    %112
    sol,16 [la si do re mi fad sol] sol,8 sol'
    re re' la re, sol4
    sol,2 r4\mbreak

    %115
    re'2 r4
    sol,2 r4
    re'2 r4

    %118
    sol sol,2
    la'4 re,2
    sol4 sol,2

    %121
    la'4 re,2
    sol,4 sol' sol,
    re' re re\mbreak

    %124
    re re re
    mi mi mi
    mi mi mi

    %127
    re re re
    re re re
    do do do

    %130
    do do do
    re re re
    re re re\mbreak

    %133
    re re re
    sol4. sol8 do, re
    sol,4 sol sol

    %136
    re're re
    re re re
    mi mi mi

    %139
    mi mi mi
    re re re
    re re re

    %142
    do do do\mbreak
    do do do
    re re re

    %145
    re re re
    re re re
    sol4. sol8 do, re

    %148
    sol,2 r4
    sol2 r4
    sol2 r4

    %151
    sol2 r4\mbreak
    sol'2 sol,4
    do re re,

    %154
    sol16[la si do re mi fad sol] sol,8 sol'
    re re' la re, sol4
    sol,16[la si do re mi fad sol] sol,8 sol'

    %157
    re re' la re, sol4
    sol, r r
    sol4. si'8 la sol

    %160
    fad mi re si' la sol
    fad mi re si do re
    sol,4. si8 do re

    %163
    sol,4. sol8 re' re,
    sol2.\fermata

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key sol\major
  \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
  \tempo 2. = 47
  s2.*164
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

IIIvlIrip = {
  \IIIglobal
  <<\IIIvlIripn \forma>>

}

IIIvlIIrip = {
  \IIIglobal
  <<\IIIvlIIripn \forma>>

}

IIIvla = {
  \IIIglobal
  \clef alto
  <<\IIIvlan \forma>>

}

IIIvcI = {
  \IIIglobal
  \clef bass
  <<\IIIvcIn \forma>>

}

IIIvcII = {
  \IIIglobal
  \clef bass
  <<\IIIvcIIn \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

\paper  {

  systems-per-page = #2

}

  \markup\huge "[1.] All[egr]o"

  \score {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino""obbligato I]"}
            \IvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino""obbligato II]"}
            \IvlII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino]  Pmo"" di ripieno" }
            \IvlIrip
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino] 2do""di ripieno"}
            \IvlIIrip
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"[Viola]"}
          \Ivla
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Violoncello""obbligato I]" }
            \IvcI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Violoncello""obbligato II]"}
            \IvcII
          >>
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"contrabass"
          \set Staff.instrumentName = \markup \center-column{"[Basso]"}
          \Ibc

        >>
      >>

    \layout {

      indent = 2.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

}

\bookpart {

\paper  {

  systems-per-page = #4

}

  \markup\huge "[2.] Largo"

  \score {

      \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIvcI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIvcII
          >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"contrabass"
          \IIbc
        >>
      >>

    \layout {

      indent = 1\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

}

\bookpart {

\paper  {

  systems-per-page = #2

}

  \markup\huge "[3.] All[egr]o"

  \score {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlII
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlIrip
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlIIrip
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIIvcI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIIvcII
          >>
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"contrabass"
          \IIIbc
        >>
      >>

    \layout {

      indent = 1\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

}
