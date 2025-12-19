\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

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


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

Ialton = \relative do' {

    \autoBeamOff

    R1*16
    r2 r4 r8 la
    re [la fad la] fad16 [re fad la] fad [re fad la]

    %19
    fad8[re] r4 r r8 la'
    re re mi mi16 mi fad8. fad16 mi4\mbreak
    r2 r4 r8 fad

    %22
    mi la, r fad' mi[la,] fad'4~
    fad8 [sol16 fad] mi8[dod] re8.\tr[dod32 re] mi8 [dod]
    re16 [mi re mi] fad [re mi fad] mi [re dod re] mi [dod re mi]

    %25
    re2~re\parentSlur (\mbreak
    re16) [mi dod re] si [dod la si] sold [si dod re] mi4\tr
    r16 si [dod re] mi4\tr r16 si [dod re] mi4\tr~

    %28
    mi16 [fad mi fad] re [mi re mi] dod [la' sold fad] mi4~
    mi16 [fad mi fad] re [mi re mi] dod [la sold la] dod [la sold la]
    re[la sold la] re[la sold la] mi'[la, sold la] mi' [la, sold la]\mbreak

    %31
    fad'[mi re dod] si[la sold? fad] mi2~
    mi16[la sold la] mi[la sold la] fad[si la si] fad[si la si]
    sold[dod si dod] sold[dod si dod] la[re dod re] la[re dod re]

    %34
    si[mi re mi] si[mi re mi] dod8 sold la re
    dod4 (re8) si la4 r\mbreak
    R1*3

    %39
    r4 r8 dod re dod re dod16 dod
    re8 dod re dod r2\mbreak
    R1

    %42
    r2 r4 r8 dod
    re dod re dod16 dod re8 dod re dod
    fad mi re dod si[lad] si dod

    %45
    lad4. si8 si4 r\mbreak
    R1
    r4 r8 fad' re dod re16[si] dod[re]

    %48
    mi8 re dod si dod16[si] la8 r4
    R1
    r2 r4 r8 la\mbreak %%% fine pagina 9

    %51
    re [la fad la] fad16 [re fad la] fad [re fad la]
    re8. re,16 re4 r r8 la'
    re re16 re mi8 mi fad8. fad16 mi4

    %54
    r2 r4 r8 fad
    mi la, r fad' mi[la,] fad'4\parentSlur (\mbreak
    fad8)[sol16 fad] mi8 [dod] re8.\tr[dod32 re] mi4~

    %57
    mi16 [fad mi fad] re [mi re mi] dod8 re mi dod
    si re mi re dod8. si16 la4
    R1

    %60
    r8 si mi re dod[re16 mi] fad8[mi]\mbreak
    re8[mi16 fad] sol8[fad] mi16[re mi fad] re[dod re mi]
    dod[la sold la] dod[la sold la] re[la sold la] re[la sold la]

    %63
    mi'[la, sold la]mi'[la, sold la] fad'[la, sold la] fad'[la, sold la]
    sol'8 mi fad [re] mi2
    re4 r r2\mbreak

    %66
    r4 r8 la si16[la si re]dod[si dod mi]
    re8 dod16[si] la8 dod re8.[mi16] mi8.\tr[re32 mi]
    fad8 mi re8[si] dod4. re8

    %69
    re2 r
    R1*8

}

Itesto = \lyricmode {

    Lau -- da - - te lau -- date _ pu -- eri, _ Do -- minum _ lau -- date _

    lau -- da - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - te nomen _ Do -- mini. _

    Sit no -- men Do -- mini _  bene - dictum _ sit no -- men Do -- mini _  bene - dictum _

    ex hoc nunc et usque _ in sae -- culum. _

    A solis _ ortu _ usque _ ad oc -- casum _ lau -- da - - - bile _ lau -- da -- bile _ nomen _ Do -- mini. _

    Ex __ celsus _ su  - - - - - - - per super _ omnes _ gentes  _ Do -- minus _ et super _

    cae -  - los glo - - - - - - - - - - ria _ e -- ius glo - - - ria _ glo - - - ria _ e - ius.

}

Itpn = %\transpose do re

\relative do''

{
    \key do\major

    R1
    r4 r8 sol do sol mi sol
    mi16 do mi sol mi do mi sol mi8 do r sol'

    %4
    do do re8. do32 re mi8 do r4
    r8 sol' sol4 r8 sol sol4\mbreak
    r8 sol sol2 \parentSlur (sol4)~

    %7
    sol~sol \parentSlur (sol16) fa mi fa sol mi fa sol
    fa mi re mi fa re mi fa mi8 do r mi
    re sol, r mi' re sol, r sol'

    %10
    la4 si do8 si16 la sol8 \parenthesize la\mbreak
    la8. si16 si8.\tr la32 si do8 si16 la sol8 fa
    mi4 fa8 re do2~

    %13
    do~do4 r8 re
    re2~re~
    re \parentSlur (re16) re mi fad sol4\mbreak

    %16
    r16 re mi fad sol4 r16 re mi fad sol4~
    sol8 la re, fad sol4 r
    r2 r4 r8 sol,

    %19
    do sol mi sol mi16 do mi sol mi do mi sol
    mi8 do r sol' do do re8.\tr do32 re\mbreak
    mi8 do r4 r8 sol' sol4

    %22
    r8 sol sol4 r8 sol sol4~
    sol \parentSlur (sol2) \parentSlur (sol4)~
    sol16 fa mi fa sol mi fa sol fa mi re mi fa re mi fa

    %25
    mi8 sol do,4 r2
    R1*9
    r2 r8 re re4~\mbreak

    %36
    re2 \parentSlur (re)~
    re16 re mi fad sol4 r16 re\p mi fad sol4
    r16 re\f mi fad sol4~sol8 la re, fad

    %39
    sol4 r r2
    R1*9
    r2 r4 r8 sol,

    %50
    do sol mi sol mi16 do mi sol mi do mi sol
    mi8 do r sol' sol4 r8 sol'
    mi do r16 mi, mi mi mi4 r16 sol sol sol

    %53
    sol4 r8 sol do do re8.\tr do32 re
    mi8 do r4 r8 sol' sol4
    r8 sol sol2 \parentSlur (sol4)~

    %56
    sol r8 sol sol4 r8 sol
    sol4 la re, r
    r r8 re re2\parentSlur (

    %59
    re\f) \parentSlur (re2\ff)~
    re4 r r2\mbreak
    R1*4

    %65
    r4 r8 sol la4 si\mbreak
    do8 si16 la sol8 do, r2
    r4 r8 sol' la8. si16 si8.\tr la32 si

    %68
    do8 sol r4 r2\fermata _\markup\italic"Cadenza"
    r4 r8 do, do2
    do4 r8 re re2~\mbreak

    %71
    re \parentSlur (re)~
    re16 re mi fad sol4 r16 re mi fad sol4
    r16 re mi fad sol4\parentSlur (sol8) la re, fad

    %74
    sol4 r8 do do4 r8 do,
    do4 r8 do, do4 r8 sol'\mbreak
    mi4 r8 sol mi4 r8 sol

    %77
    mi2 r

}

IvlIn = \relative do'' {

    r4 r8 la re la fad la
    fad16 re fad la fad re fad la fad8 re r4
    r r8 la' re re mi8.\tr re32 mi

    %4
    fad8 re r la re16 la re la mi' la, mi' la,
    fad'8 re r fad mi la, r fad'\mbreak
    mi la, r la re16 la re la mi' la, mi' la,

    %7
    fad' la, fad' la, mi' la, mi' la, fad' mi re mi fad re mi fad
    mi re dod re mi dod re mi  re8 la' la4\f
    r8 la, la4 r8 la' la4

    %10
    r8 re,\p sol mi la sol fad8.\tr mi32 fad\mbreak
    sol8 sol, r mi' la la, r mi'~
    mi re4 dod8 re16 re dod dod si si la  la

    %13
    sold sold si si sold sold fad fad mi4 r8 sold
    la la, r dod' si mi, r dod'\p
    si mi, r dod'\f si mi, r16 dod' si la\mbreak

    %16
    sold8 mi r16 dod' si la sold8 mi r16 fad mi re
    dod8 re r mi la16 la sol! sol fad fad mi mi
    re4 r r2

    %19
    r4 r16 fad fad fad fad4 r16 la la la
    la4 r r r8 la\mbreak
    re16 la re la mi' la, mi' la, fad'8 re r la\p

    %22
    la4 r8 la\f la4 r8 la
    re16 la re la mi' la, mi' la, fad' la, fad' la, mi'8 mi,
    R1

    %25
    re'16 re dod dod si si la la sold sold si si sold sold fad fad\mbreak  %%fine p.2
    mi8 la re, red mi4 r16 mi'\f re dod
    si8 sold r16 mi'\p re dod si8 sold r16 mi'\f re dod

    %28
    si8 sold la si mi, mi'\p~mi16 la, re dod
    si8 sold la si mi,4 r
    R1*2

    %32
    r4 mi^\markup\italic"moderato"~ mi8 re fad4~
    fad8 mi sold4~sold8 fad la4\parentSlur (
    la8) sold16 la si8 sold mi4 mi'\f~

    %35
    mi8 fad4 sold8 la la, r dod\mbreak
    si8 mi, r dod' si mi, r dod'
    si sold r16 fad\f mi re dod8 la r16 fad'\p mi re

    %38
    dod8 la r16 fad'\f mi re dod8 re r mi
    la,4 r r2
    r2 r16 dod'\f red?  mid fad4\mbreak

    %41
    r16 dod\p red mid fad4 r16 dod\f red mid fad4~
    fad8 sold dod, mid fad4 r
    R1*2

    %45
    r2 r16 fad\f sold lad si4\mbreak
    r16 fad\p sold lad si4 r16 fad\f sold lad si4~
    si16 fad mi re dod8.\tr si16 si4 r

    %48
    r2 r4 r8 la
    re8 la fad la fad16 re fad la fad re fad la
    fad8 re r16 fad fad fad fad4 r16 la la la\mbreak

    %51
    la4 r r r8 la
    re8 la fad la fad16 re fad la fad re fad la
    fad8 re r4 \parenthesize r \parenthesize r8 la'

    %54
    re16 la re la mi' la, mi' la, fad'8 re r la\p
    la4 r8 la\f la4 r8 la\p\mbreak
    re16 la re la mi' la, mi' la, fad' la, fad' la, mi'8 la,

    %57
    R1
    r2 r4 r8 dod\f
    si mi, r dod'\p si mi, r dod'\f

    %60
    si mi, r4 r2\mbreak
    R1*4
    r4 r16 re' mi fad sol8 mi fad sol\mbreak

    %66
    la8 sol fad16(mi fad8) r2
    R1
    r2 r4 r8 la,

    %69
    re16 re dod dod si si la la sold sold si si sold sold fad fad
    mi4 r8 sold la la, r dod'\mbreak
    si8 mi, r dod'\p si mi, r dod'\f

    %72
    si mi, r16 fad mi re dod8 la r16 fad'\p mi re
    dod8 la r16 fad'\f mi re dod8 re r mi
    la16 la' si dod re4 r16 la,\p si dod re4

    %75
    r16 la,\f si dod re4~re8 mi la, dod\mbreak
    re16 fad la re mi,8 dod' re,16 fad la re mi,8 dod'
    re2 r

}

IvlIIn = \relative do'' {

    r4 r8 la re la fad la
    fad16 re fad la fad re fad la fad8 re r4
    r r8 la' re re mi8.\tr re32 mi

    %4
    fad8 re r la re16 la re la mi' la, mi' la,
    fad'8 re r fad mi la, r fad'\mbreak
    mi la, r la re16 la re la mi' la, mi' la,

    %7
    fad' la, fad' la, mi' la, mi' la, fad' mi re mi fad re mi fad
    mi re dod re mi dod re mi  re8 la' la4\f
    r8 la, la4 r8 la' la4

    %10
    r8 re,\p sol mi la sol fad8.\tr mi32 fad\mbreak
    sol8 sol, r mi' la la, r mi'~
    mi re4 dod8 re16 re dod dod si si la  la

    %13
    sold sold si si sold sold fad fad mi4 r8 sold
    la la, r dod' si mi, r dod'\p
    si mi, r dod'\f si mi, r16 dod' si la\mbreak

    %16
    sold8 mi r16 dod' si la sold8 mi r16 fad mi re
    dod8 re r mi la16 la sol! sol fad fad mi mi
    re4 r r2

    %19
    r4 r16 fad fad fad fad4 r16 la la la
    la4 r r r8 la\mbreak
    re16 la re la mi' la, mi' la, fad'8 re r la\p

    %22
    la4 r8 la\f la4 r8 la
    re16 la re la mi' la, mi' la, fad' la, fad' la, mi'8 mi,
    R1

    %25
    re'16 re dod dod si si la la sold sold si si sold sold fad fad\mbreak
    r2 mi4 r
    r16 sold\f la si dod la mi'8 r16 sold,\p la si dod la mi'8

    %28
    si16 mi, mi'8 r4 r r16 la,\p si dod
    re(si) mi8 r4 la,16(mi) mi'8 r4
    R1*5

    %35
    r2 r4 r8 dod
    si8 mi, r dod' si mi, r dod'
    si sold r16 fad\f mi re dod8 la r16 fad'\p mi re

    %38
    dod8 la r16 fad'\f mi re dod8 re r mi
    la,4 r r2
    r r4 r16 fad''\f mi re

    %41
    dod8 la' r16 fad\p mi re dod8 la' r16 fad\f mi re
    dod8 si16 la sold8. sold16 fad4 r
    R1*2

    %45
    r2 r4 r16 si\f lad si
    fad8 re' r16 si\p lad si fad8 re' r16 si\f lad si
    fad re' dod si lad8. si16 si4 r

    %48
    r2 r8 la re[la]
    fad8 la \parenthesize la re, fad16 re fad la fad re fad la
    fad8 re r16 fad fad fad fad4 r16 la la la\mbreak  %%% fine p.9

    %51
    la4 r r r8 la
    re8 la fad la fad16 re fad la fad re fad la
    fad8 re r4 \parenthesize r \parenthesize r8 la'

    %54
    re16 la re la mi' la, mi' la, fad'8 re r la\p
    la4 r8 la\f la4 r8 la\p\mbreak
    re16 la re la mi' la, mi' la, fad' la, fad' la, mi'8 la,

    %57
    R1
    r2 r4 r8 dod\f
    si mi, r dod'\p si mi, r dod'\f

    %60
    si mi, r4 r2\mbreak
    R1*4
    r4 r16 re' mi fad sol8 mi fad sol\mbreak

    %66
    la8 sol fad16(mi fad8) r2
    R1
    r2 r4 r8 la,

    %69
    re16 re dod dod si si la la sold sold si si sold sold fad fad
    mi4 r8 sold la la, r dod'\mbreak
    si8 mi, r dod'\p si mi, r dod'\f

    %72
    si mi, r16 fad mi re dod8 la r16 fad'\p mi re
    dod8 la r16 fad'\f mi re dod8 re r mi
    la16 la' si dod re4 r16 la,\p si dod re4

    %75
    r16 la,\f si dod re4~re8 mi la, dod\mbreak
    re16 fad la re mi,8 dod' re,16 fad la re mi,8 dod'
    re2 r

}

Ivlan = \relative do' {

    fad8 sol la sol fad sol la dod,
    re4 r8 la la4 r
    r2 la'8 fad dod mi

    %4
    la,4 r8 dod la fad' r dod
    re fad r re mi16 dod mi dod re8 re
    mi16 dod mi dod re8 fad r fad mi dod

    %7
    r re mi dod r re re' re,
    si sol' dod, la' la4 r8 re,
    la'4 r8 la la4 r

    %10
    R1*2
    r4 r8 la re16 re dod dod si si la la
    sold sold si si sold sold fad fad mi4 r8 si

    %14
    dod16 la dod la la' mi la mi sold mi sold mi la mi la mi
    sold mi sold mi la mi la mi sold8 mi r4\mbreak
    R1

    %17
    r4 r8 mi la16 la sol! sol fad fad mi mi
    re4 r r2
    r4 r16 re re re re4 r16 fad fad fad

    %20
    fad4 r r2\mbreak
    R1*4
    re'16 re dod dod si si la la sold sold si si sold sold fad fad\mbreak

    %26
    mi8 la re, red mi4 r
    R1*8
    r2 r4 r8 la\mbreak

    %36
    sold16 mi sold mi la mi la mi sold mi sold mi la mi la mi
    sold8 mi r4 r2
    R1

    %39
    la8 si dod la fad mid fad mid
    r2 r4 r16 re \f dod si\mbreak
    la8 fad r16 re'\p dod si la8 fad r16 re'\f dod si

    %42
    la8 si dod dod fad, 4r
    R1*2
    r2 r4 r16 sol'\f fad mi\mbreak

    %46
    re8 si r16 sol'\p fad mi re8 si r16 sol'\f fad mi
    re8 mi fad fad, si lad si si'
    sold4 mi mi r8 mi

    %49
    fad sol la sol fad sol la dod,
    re4 r16 re re re re4 r16 fad fad fad\mbreak
    re4 r r2

    %52
    la'4 r8 re, la4 r
    R1
    r2 r4 r8 re

    %55
    dod16 la dod la re la re la dod la dod la re8 re,\mbreak
    r re' dod [la] r re dod la
    fad4 sold la r

    %58
    r2 r4 r8 la'
    sold16 mi sold mi la mi la mi sold mi sold mi la mi la mi
    sold(fad sold8) r4 r2\mbreak

    %61
    R1*7
    r2 r4 r8 re
    re'16 re dod dod si si la la sold sold si si sold sold fad fad

    %70
    mi4 r8 re dod16 la dod la la' mi la mi\mbreak
    sold mi sold mi la mi la mi sold mi sold mi la mi la mi
    sold8 mi r4 r2

    %73
    R1
    r4 r16 re dod si la4 r16 re dod si
    la4 r16 si la sol fad8 sol la la\mbreak

    %76
    mi'4 r8 la la4 r8 la
    la2 r

}

Ibcn = \relative do {

    re8\solo mi fad mi re mi fad mi
    re mi fad mi re4 r
    re r re8 re' la sol

    %4
    fad si la sol fad re' dod la
    re4 r8 re dod16 la dod la re la re la\mbreak
    dod la dod la re8 re, r re' dod[la]

    %7
    r re dod la re4 r8 re,
    mi4 la re, r8 re'
    dod16 la dod la re la re la dod la dod la re8 re,

    %10
    sol fad mi la fad4 r8 re\mbreak
    sol fad mi la fad4 dod
    re8 si' sol la re16 re dod dod si si la la

    %13
    sold sold si si sold sold fad fad mi4 r8 re
    dod16 la dod la la' mi la mi sold mi sold mi la mi la mi
    sold mi sold mi la mi la mi sold8 mi r4\mbreak

    %16
    R1
    r4 r8 mi la16 la sol! sol fad fad mi mi
    re8 mi fad mi re mi fad mi

    %19
    re4 r re r
    re8 re' la sol fad re r la'\mbreak
    fad8 re' dod la re4 r8 re

    %22
    dod16 la dod la re la re la dod la dod la re8 re,
    r re' dod[la] r re dod la
    re4 r8 re, mi4 la

    %25
    re16 re dod dod si si la la sold sold si si sold sold fad fad\mbreak
    mi8 la re, red mi mi, r16 dod'' si la
    sold8 mi r16 dod' si la sold8 mi r16 dod' si la

    %28
    sold8 mi fad sold la la, r16 dod' si la
    sold8 mi fad sold la la, r la'
    si si, r si' dod dod, r dod'\mbreak

    %31
    re8 re, re'4~re16 dod si la sold fad mi re
    dod8 dod, r dod' re re, r re'
    mi mi, r mi' fad fad, r fad'

    %34
    sold sold, r mi' la8 si dod si
    la fad re mi la,4 r8 la'\mbreak
    sold16 mi sold mi la mi la mi sold mi sold mi la mi la mi

    %37
    sold8 mi r4 r2
    R1
    la8 si dod la fad mid fad mid

    %40
    fad mid fad mid16 red mid8 dod r16 re'^\f dod si\mbreak
    la8 fad r16 re'^\p dod si la8 fad r16 re'^\f dod si
    la8 si dod dod, fad sold la fad

    %43
    mid fad mid fad mid fad mid fad
    re lad si dod re fad sol mi
    fad mi fad fad, si4 r16 sol'^\f fad mi\mbreak

    %46
    re8 si r16 sol'^\p fad mi re8 si r16 sol'^\f fad mi
    re8 mi fad fad, si lad si si'
    sold4 mi la8 sol? fad mi

    %49
    re mi fad mi re mi fad mi
    re4 r re r\mbreak
    re8 mi fad mi re mi fad mi

    %52
    re4 r re r
    re8 re' la sol fad re r la'
    re, re' dod la re4 r8 re

    %55
    dod16 la dod la re la re la dod la dod la re8 re,\mbreak
    r re' dod [la] r re dod la
    fad4 sold la8 la, r la'

    %58
    la sold16 fad sold8 mi la si dod la
    sold16 mi sold mi la mi la mi sold mi sold mi la mi la mi
    sold8 mi, r mi' la sol fad sol16 la\mbreak

    %61
    si8 la sol la16 si dod4 re
    la8 la, r la' si si, r si'
    dod dod, r dod' re re, r re'

    %64
    mi dod re si sol4 la
    re16 la re la re la re la sol8 fad mi la\mbreak
    fad re r re' sol, fad mi la

    %67
    fad sol la4 sol8 mi la sol
    fad la si sol la4_\markup\italic"adagio a placet" r8 la
    re16 re dod dod si si la la sold sold si si sold sold fad fad

    %70
    mi4 r8 re dod16 la dod la la' mi la mi\mbreak
    sold mi sold mi la mi la mi sold mi sold mi la mi la mi
    sold8 mi r4 r2

    %73
    R1
    r4 r16 si'^\f la sol fad8 re r16 si'^\p la sol
    fad8 re r16 si'^\f la sol fad8 sol la la,\mbreak

    %76
    re4 sol8 la re re, sol la
    re,2 r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    <6>4 <5> <6> <6>
    s1*7
    s2 s4 <6\\>
    s s <7 _+> s8 <_+>
    <6>1
    s1*2
    s4 s8 <_+>
    \bassFigureExtendersOn <5 7>8 <5 7> \bassFigureExtendersOff
    <6> <6>
    s1*3
    <6>1
    s
    s
    s2 <7>
    s4 <6\\> s2
    <7 _+>4 <6> <_+> s16 <6> s8
    <6>4 s16 <6> s8 <6> <_+> s4
    s <6> s s16 <6> s8
    s1
    s8 <7> s <7>  \bassFigureExtendersOn <5>4 s8 <_>16 <_>
    s2 s8 <4\+> <4\+> s
    s <6> s4<9>8< 8> s4\bassFigureExtendersOff
    <9>8 <8> s4 <9>8 <8> s4
    <9>8 <8> s <_+> s2
    s1
    <6>2 <6>
    <6>1
    s
    s2 <6>8 <6> <6> <6>
    <6> <6> <6>\bassFigureExtendersOn <6>\bassFigureExtendersOff <6> <_+> s16 <5> s8
    <6>4 s16 <5> s8 <6>4 s16 <5> s8
    <6>8 <6\\> <_+> s s4 <6>
    <7>8 <6> <7> <5> <7> <5> <7> <5>
    <6> <6> s4 <6>8 <_+> <5> <6>
    <_+>2 s4 s16 <5> s8
    <6>4 s16 <5> s8 <6>4 s16 <5> s8
    <6>4 <_+> s <6>
    <6> <_+> s4 <6>8 <6\\>
    s1*4
    s2 <6>
    s4 <6> s2
    s1
    s
    <7>4 <5> s2
    <2>4 <6> s2
    s1
    s4 s8 <_+> s4 <5>
    <5>4 <5> <6> s
    s2 <7>4 s8 <7>
    <5>4 s8 <5> s2
    <5>8 <6> s4 <6>\bassFigureExtendersOn <6>\bassFigureExtendersOff
    s2 <5>4 <6>
    <6>2 <5>4 <6>
    <6>2 <5>4 <5>
    <6> <5> s2
    s4 <6\\> s2
    <7 _+>4 s8 <4\+> <6>4 s
    <6>2 <_+>
    <6>1
    s
    s4 s16 <5> s8 <6>4 s16 <5> s8
    <6>4 s16 <5> s8 s2

}

forma = {

    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 50
    s1*77
    \bar "||"

}

Ialto = {
    \new Voice = "laudate"
    \notypeset
    \Iglobal
    <<\Ialton\forma>>
}


Itp = {
    \Iglobal
    <<\Itpn \forma>>
}


IvlI = {
    \Iglobal
    \clef violin
    <<\IvlIn \forma>>
}


IvlII = {
    \Iglobal
    \clef violin
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

IIalton = \relative do' {

    \autoBeamOff
    si4 dod8 lad si8. fad16 fad4 re' r8 fad
    sol[mi] fad[re] mi4. re16 dod\mbreak
    re8[si] re [mi] fad4 fad,

    %4
    R1*3
    r2 si4 dod8 si16 [lad]\mbreak
    si8. fad16 fad4 re' r8 fad

    %9
    sol[mi] fad[re]mi4. re16 dod
    re8[si] \parenthesize re[mi] fad4 fad,
    r2 r4 dod'8 fad

    %12
    re4 dod8[(fad)] re8. re16 dod4\mbreak
    r4 re8 fad sol,4. la16 sol
    fad8. fad16 fad8 la fad[re fad la]

    %15
    do4. si16[la] si8[sol si re]
    fa4. mi16[re] \parenthesize mi8[sol, dod! mi]
    sol4. fad16[mi] fad8 mi re si\mbreak

    %18
    dod!4. re8 re4 r
    R1*3
    r4 la4. la8 la si16[dod]\mbreak

    %23
    re4 re, r8 si' si dod16[re]
    mi8. mi,16 mi4 dod'8 dod dod red16 mi
    fad[mi fad dod] re[si dod re] mi[re mi si] dod[la si dod]

    %26
    re[dod re la] si[sold la si] dod[si dod sold] la[fad sold la]
    si[sold la si] dod[la si dod] red[si dod red] mid [dod red mid]\mbreak
    fad[red mid fad] sold[mid fad sold] dod,8 red16[mid] fad8[fad,]

    %29
    sold4. fad8 fad4 r
    R1
    r4 r8 dod' lad4 si8 dod

    %32
    re mi fad si, lad8. sold?16 fad4\mbreak
    R1
    r2 r4 si8 si

    %35
    dod dod16 dod dod8 si16 dod re[dod] si8 r4
    r2 r4 r8 dod
    re dod16[mi] re8 dod [fad] re dod re~\mbreak

    %38
    re red mi fad sol16[fad] mi8 r4
    r2 fad4 si,
    la8 si16[do] si8 la16 si sol8[si] mi4~

    %41
    mi8[re16 dod!] re4~re8[do?16 si] do!4\parentSlur (
    do?8)[si16 la] si[mi, sold? si] do?[si la sold] la[sold fad mi]\mbreak
    red8[fad] si4 r16 si[la sol] fad[si la si]

    %44
    sol8[si] mi4 r16 mi[re do] si[mi re mi]
    do[si do mi] do[si do mi] dod[si dod mi] dod[si dod mi]
    re[dod re fad] re[dod re fad] red[dod red fad] red[dod red fad]

    %47
    mi[red mi sol] fad[mi fad la] sol[fad mi red] mi8[dod]\mbreak
    red4. mi8 mi4 r
    R1*2

    %51
    r2 si4 mi,8 si'
    do[si] do4 la8[si16 do] re8 do16 re\mbreak
    si8 la sol4 r r8 mi'~

    %54
    mi re4 do8~do la si[do?]
    re8 sol,4\tr fad16[sol] mi'8 sol,4\tr fad16[sol]
    re'8 sol,4\tr fad16[sol] do[la si do] re[la re do]

    %57
    si[sol' fad mi] re[mi do? re] si[sol' fad mi] re[mi do re]\mbreak
    si8[mi re dod?] si16[la sol8] la4
    sol r r2

    %60
    r r4 si8 si
    mi red mi fad red8. dod16 si8 mi
    re dod si dod lad fad r4\mbreak

    %63
    R1
    r4 re'8 fad si, dod16 re mi8 re
    dod[(si)] la4 r2

    %66
    r r4 si8 si
    dod dod16 dod dod[re] si[dod] re8 si sol'4\parentSlur (
    sol8) fad4 mi8~mi re4 dod8~

    %69
    dod[si16 lad] si8 fad fad4 mi
    fad2\fermata

}

IItesto = \lyricmode {

    Quis sicut  _ Do -- minus _ quis quis si -- cut Do -- minus _  De -- us noster _

    quis si -- cut Do -- minus _ quis quis si -- cut Do -- minus _  De -- us noster _

    qui in al -- tis ha -- bitat _

    et hu -- mi -- lia _ res -- picit _ in cae - - - - - - - - - lo et in ter - ra.

    Su -- scitans _ a ter -- ra a ter -- ra i -- nopem _ et de ster  - co -- re - - - - - - - - - - - - - -e -- rigens _

    pau -- perem. _

    Ut col -- locet _ eum _ cum prin -- ci -- pibus, _ cum prin -- ci -- pibus _ po -- puli  _ su -- i.

    Qui habi - tare _ facit _ ste -- rilem _  in domo, _ matrem _ fili - orum _ lae - tan

    - - - - - - - - - - - - - - - - - - - - - - - - - - - tem.

    Glo -- ria _ Patri  _ glo - ria _ Fi -- lio _ et Spi -- ri -- tu -- i San - - - - - - - - - - - - - - - - - cto.

    Si -- cut erat _  in prin -- ci -- pio _ et nunc et nunc et semper _  et in sae -- cula _ sæcu - lorum _

    et in sae -- cula _ sæcu - lorum _ a - - - - - men a - men.

}

IIvlIn = \relative do'' {

    R1.
    R1
    r2 r16 fad, sol lad si [si la! la]

    %4
    sold sold lad si dod dod si si lad8 [sol'\p( fad mid)]
    r fad\p [(mi? red)]  mi16\f(red) mi8~mi4~
    mi16\p(red) mi8~mi4 \parentSlur (mi8\f) [lad si si,]

    %7
    dod4. si8 si4 r\mbreak
    R1*2
    r2 r16 fad\f sold lad si [si la la]

    %11
    sold sold la si dod dod si si lad8 fad r4
    r2 r4 fad16 fad mi mi\mbreak
    re8 si r4 r2

    %14
    re16\p re la' la re8 re, r2
    r  sol16\f sol si si re8 [re,]
    r2  sol16\p sol do? do  \once\stemDown mi8 [dod,!]

    %17
    r2 re'16\f re fad fad  sol8 [\once\stemUp re,]\mbreak
    r2  r16 la'\f si dod re [re do do]
    si si dod? re mi mi re re  dod8 [sib'\p(la sold)]

    %20
    r8 la[(sol? fad)] sol16\f fad sol4~sol8\p~
    sol16 fad sol4~sol8~ sol8\f dod re [re,]
    mi4.\tr re8 re4 r\mbreak % fine primo sistema p. 15

    %23
    r16 la\f si dod re re dod dod si8 mi, r4
    r16 si' dod re mi mi re re dod8 fad, r4
    r8 la\p[fad fad'] r si,\f[mi, mi']

    %26
    r la,\p [re, re'] r sold,\f[dod, dod']
    r si\p[mi, mi'] r red\f[sold, sold'?]\mbreak
    r8 si,\p[dod, si'] r la\f[la, dod']

    %29
    re16 si dod re mid,8.\tr fad16 fad8[re'\p(dod sid)]
    r dod[(si? lad)] r si\f\noBeam la?16 si sold dod
    la8 dod fad4 r2

    %32
    R1\mbreak
    r8 sol\p[(fad mid)] r fad[(mi? red)]
    r mi\f re?16 mi dod fad re8 fad si4

    %35
    r2 r16 fad, sold? lad si [si la la]
    sold sold lad si dod dod si si lad8 dod fad4
    R1

    %38
    r2 r16 si, dod red mi [mi red red]
    dod dod red mi fad fad mi mi red8 fad si4
    r2 r4 r8 sol\p

    %41
    \grace sol8 fad4 r8 si \grace fad8 mi4 r8 la
    \grace mi8 re4 r8 si'  mi,,4_\markup\italic"tenuto" r\mbreak
    R1*2

    %45
    r8 mi\f[mi' mi,] r mi\p[mi' mi,]
    r la\f[la' la,] r fad\p[fad' fad,]
    r si\f [si' si,] r si,\p[si' si,]\mbreak

    %48
    r fad'\f[fad' fad,] mi[dod'\p(si lad)]
    r si[(la? sold)] la16\f(sold) la4~la8\p~
    la16 sold la4~la8~la\f[red mi mi,]

    %51
    fad4.\tr mi8 mi4 r
    R1
    r16 sol si do re re do do si8 re sol4

    %54
    R1*5
    r8 mi\p [re dod] r re do si
    r do\noBeam\f si16 do la re si8 re sol4

    %61
    R1
    r2 r8 sol\p(fad mid)\mbreak
    r fad[(mi red)] r mi\noBeam\f re16 mi dod fad

    %64
    re8 fad si4 r2
    r16 mi,, fad sol la la sol sol fad fad sold la si [si la la]
    sold sold la si dod dod si si lad8 dod fad4

    %67
    r2 r4 r8 re\p\mbreak
    dod4 r8 si la4 r8 sol
    fad4 r si4.^\markup\italic"ada[gio]" lad8

    %70
    lad?2\fermopz

}

IIvlan = \relative do' {

    R1.
    R1
    r2 r4 fad

    %4
    si, sold' dod, r
    dod r r8 dod dod lad
    r dod [dod lad16 si] dod4 re

    %7
    r8 si[lad(si)] si4 r
    R1*2
    r2 r4 fad'

    %11
    si, sold' dod, r
    R1*6\mbreak % inizio p. 15
    r2 r4 la'

    %19
    re, si' mi, r
    mi r r8 mi mi dod
    r mi[mi dod16 re] mi4 fad

    %22
    r8 si, dod[re] re4 r\mbreak
    R1*6
    r2 la'4 r

    %30
    sold \parenthesize r fad r8 dod
    dod4 r r2
    R1\mbreak

    %33
    re4 r dod r
    si r8 fad' fad4 \parenthesize r
    r2 r4 fad

    %36
    si, sold' dod, r
    R1\mbreak
    r2 r4 si'

    %39
    mi, dod' fad, r
    R1*8
    r2 sol4 r

    %49
    fad r r8 mi[fad red16 mi]
    fad8 mi fad[red16 mi] fad4 sol
    r8 dod,[si red] mi4 r

    %52
    R1*7
    si'4 r la \parenthesize r
    sol r8 re re4 r

    %61
    R1
    r2 dod4 r\mbreak
    dod'4 r si r8 fad

    %64
    fad4 r r2
    r4 mi la, fad'
    si, sold' dod,! r

    %67
    R1*3
    R2^\markup\center-align {(\musicglyph #"scripts.ufermata")}

}

IIbcn = \relative do {

    si8[si' mi, fad] sol  fad16 mi re8 [dod] si8[si' lad fad]
    mi'4 re8 si dod[si lad fad]\mbreak
    si la? sol4 fad red

    %4
    mi mid fad^\p r
    fad^\p r r8 fad^\f lad dod
    r8 fad,^\p [lad dod] fad,^\f mi re sol

    %7
    mi4 fad si,8 si' mi, fad\mbreak
    sol fad16 mi re8 dod si si' lad fad
    mi'4 re8 si  dod  si lad fad

    %10
    si la? sol4 fad red
    mi mid fad8 sold lad fad
    si, [si' lad fad] si si, fad' lad\mbreak

    %13
    si la16 sol fad8 re mi re dod la
    re4 r re r
    mi fad sol r8 sol

    %16
    la4 si do la
    si dod? re8 dod si sol
    la [sol la la,] re4 mi

    %19
    sol sold la\p r
    la\parenthesize r r8 la^\f dod mi
    r la, ^\p[dod mi] la,^\f sol fad si

    %22
    sol4 la fad8 re16 mi fad [fad mi mi]\mbreak
    re8 [mi fad re] sol16 mi mi fad sold [sold fad fad]
    mi8 [fad sold mi] la16 fad fad sold la [la sold sold]

    %25
    fad4 r8 si sold4 la
    fad r8 sold mid4 r8 fad
    sold4 la si dod\mbreak

    %28
    red, mid fad r8 la
    si [sold dod dod, ]fad4 r
    mi r red r8 mid

    %31
    fad [sold la sold] fad mi re dod
    si [dod re mi] fad sold lad fad\mbreak
    si4^\p r la \parenthesize r

    %34
    sold^\f r8 lad si si,16 dod re8 [si]
    mi [dod fad fad,] si4 re
    mi mid fad8 sold? lad fad

    %37
    si [lad si lad] si lad si lad
    sol [fad mi si ]mi4 sold
    la lad si8 si, red si

    %40
    fad' [mi red si] mi4 r8 mi
    si'4~si8 la16 sold la4~la8 sol?16 fad
    sol4 sold la r8 la,\mbreak

    %43
    si4 r8 si dod4 red
    mi r8 mi fad4 sold
    la8 la, r la' sol sol, r sol'

    %46
    fad fad, r fad' si si, r la'
    sol4 red mi8 fad sol la\mbreak
    si [la si si,] mi4 r

    %49
    re' r r8 do^\f la fad
    red [do'^\p la fad] si, la'^\f sol do
    la4 si mi,8 fad sol mi

    %52
    la [la, la' sol] fad mi re fad\mbreak
    sol [la si la] sol la si do?
    la [si sold la] re, fad sol? la

    %55
    si4 r8 si, do4 r8 do
    si4 r8 si la la' fad re
    sol4 r8 re mi4 r8 re\mbreak

    %58
    mi[dod si dod] re4 re,
    sol r fad' \parenthesize r
    mi4 r8 fad sol la sol fad

    %61
    mi [fad sol la] si la sol mi
    fad [mi re mi] fad4 r\mbreak
    la4 r sold r8 lad

    %64
    si si,16 dod re8 si sol'4 mi
    la dod, re red
    mi mid fad8 mi? re si

    %67
    mi [dod fad fad,] si4 r8 si'\mbreak
    la4 sol fad mi
    re re, sol2

    %70
    fad\fermopz

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6>8 <_+> s4 <6> s4 s8 <6>
    s4 <6> <5+>8 \bassFigureExtendersOn <5+> s <6> \bassFigureExtendersOff
    s4 <5>8 <6> <_+>4 <6>
    <_+> <6> <_+> s
    <_+> s s8 <7  _+> \bassFigureExtendersOn <7 _+>  s
    s <7  _+> <7  _+> s \bassFigureExtendersOff <7> <4\+> <6> s
    <6 5>4 <_+> s <6>8 <_+>
    s4 <6> s s8 <6>
    s4 <6> <5+> <6>
    s <5>8 <6> <_+>4 <6>
    <_+> <6> <_+>2
    s4 s8 <6> s4 <_+>
    <5> <6> <5> <6>
    s1
    <6->4 <5> s2
    <6->4\bassFigureExtendersOn <6->\bassFigureExtendersOff <5> <_+>
    <6> <6> s <6>
    <_+>1
    s
    s4 s s8 <7  3> \bassFigureExtendersOn <7 3>  s
    s <7 3> <7  3> s \bassFigureExtendersOff <7> <4> <6> s
    <6>2 s4 <6>
    s2 s8 <5> <6>\bassFigureExtendersOn <6>\bassFigureExtendersOff
    <_+>2 s8 <5> <6> <6\\>
    s2 <6>
    <6>4 s8 <5+> <6>4 s8 <5>
    <6\\>4 <6> <5> <_+>
    <6> <5> s s8 <6>
    <6\\>4 <_+> s2
    <6 _+> <6>4 s8 <5>
    s2 <_+>8\bassFigureExtendersOn <_+>\bassFigureExtendersOff <6>4
    <5> <6> <_+>8 <_+> s4
    <6>2 <6>
    <6>4 s8 <5> s4 <6>
    <6> <_+> s <_+>8 <6>
    <_+>4 <6> <_+>4 <6>8 <_+>
    s8 <6> s <6> s <6> <5>\bassFigureExtendersOn <5>\bassFigureExtendersOff
    <5> <6\\> s <_+> s4 <6>
    s <6> <_+> s8 <_+>
    <6\\>4 <6>8 <_+> s2
    <5 4>4 <3> <5 4> <_->
    <5 4> <6 3> <_-> s8 <_->
    <_+>4 s8 <_+> <7>4 <5>
    s2 <7>4 <5>
    <_-> s <4\+> s
    <6>2 <_+>4 s8 <_>16\bassFigureExtendersOn <_>\bassFigureExtendersOff
    <6>4 <6> <_!> <6>
    <_+>4\bassFigureExtendersOn <_+>\bassFigureExtendersOff s2
    <6>2 s8  <6> <6> <6\\>
    <6> <6> <6> <6\\> <7 _+>8\bassFigureExtendersOn <7 _+>\bassFigureExtendersOff <6> <5>
    <6>4 <_+> s <6>
    <_->2 <6>
    s4 <6>8 <6> s4 <6>8\bassFigureExtendersOn <6>\bassFigureExtendersOff
    s4 <5>8 <_-> <7>4 <3>
    s s8 <6> <5>2
    <6> <5>4 <6>
    s2 <5>
    <5>4 <6> <6 4> <5 3>
    <5>2 <6>
    <6>4 s8 <_>16\bassFigureExtendersOn <_>\bassFigureExtendersOff <5>4 <5>8 <6\\>
    s8 <6\\> <6>4 <_+> <6>
    <6>8 <6> <6> <6> <_+>2
    <6>2 <6>4 s8 <5>
    s4 <6> <5>2
    s4 <6> s <6>
    <_+> <6> <_+> s
    <6> <_+> s s8 <6>
    <7> <6> <7> <6> <7> <6> <7> <6>
    <7>4 <6> <7> <6>
    <_+>

}

forma = {

    \time 2/4
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 37
    \set Score.measureLength = #(ly:make-moment 6 4)
    s1.
    \set Score.measureLength = #(ly:make-moment 4 4)
    s1*68
    \set Score.measureLength = #(ly:make-moment 2 4)
    s2
    \bar "||"

}

IIalto = {
    \new Voice = "quis"
    \notypeset
    \IIglobal
    <<\IIalton\forma>>
}


IIvlI = {
    \IIglobal
    \clef violin
    <<\IIvlIn \forma>>
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

}

IIIalton = \relative do' {

    \autoBeamOff
    R2.
    R1.*5
    re4 la8 [re16 mi] fad4~fad8[mi16 fad] sol8[fad mi re]

    %8
    dod16[re mi8]~mi[dod16 re] mi4~mi8[re16 mi] fad8[mi re dod]
    re4 la r r2 r4
    r8 re[la] re16[mi fad8 dod] mi16[re dod re mi8] r4.\mbreak

    %11
    r4 r8 la,[dod la] si16[la sol fad] mi8[si' mi si]
    dod16[si la sol] fad8[dod' fad dod] re16[dod si la] sol8[re' sol re]
    mi16[re dod si] la8[mi' la mi] fad re r4 r

    %14
    R1.
    re4 la8 [re16 mi] fad4~fad8[mi16 fad] sol8[fad mi re]\mbreak
    dod16[re mi8]~mi[dod16 re] mi4~mi8[re16 mi] fad8[mi re dod]

    %17
    re16[fad mi fad] re[mi dod re] si[dod la si] sold[fad' mi fad] re[mi dod re] si[dod la si]
    sold[mi fad sold] la[si dod re] mi8[re] dod[la'] si,2\tr
    la4 \parenthesize r \parenthesize r la16[re dod re] la[re dod re] la[re dod re]

    %20
    dod4 la r la16[re dod re] la[re dod re] la[re dod re]
    si[sol si re] si[sol si re] si[sol si re] si[mi re mi] si[mi re mi] si[mi re mi]
    dod[la dod mi] dod[la dod mi] dod[la dod mi] dod[fad mi fad] dod[fad mi fad] dod[fad mi fad]

    %23
    re[si re fad] re[si re fad] re[si re fad] mi[la sol la] mi[la sol la] mi[la sol la]
    fad8[re16 mi] fad8[mi] re[fad] la[re,16 mi] fad8[mi] re[fad]
    la[re,] mi2 re4 r r

    %26
    r2 r4 re16[fad mi fad] re[fad mi fad] re[fad mi fad]\mbreak
    mi[sol fad sol] mi[sol fad sol] mi[sol fad sol] fad8[sol fad mi] re4~
    re8^\markup\italic"adagio"[si] dod4. re8 re4 r r

    %29
    R2.
    R1.*4
    R1.^\markup\center-align {(\musicglyph #"scripts.ufermata")}

}

IIItesto = \lyricmode {

    A - - - - - - - men a - - - - - - - - - - - - men a - - - - - - - - - - - - - - - - - men

    a - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - men a - - - - - - - - - men.

}

IIItpn = %\transpose do re

\relative do''

{
    \key do\major
    R2.
    R1.
    r2 r4 sol'4 do,8 mi16 fa sol4~

    %4
    sol8 fa16 sol la8 sol fa mi fa mi16 fa sol8 [fa mi re]
    mi16 fa mi fa sol8 la16 si do8 sol mi16 do mi fa sol8[la16 si] do8 sol16 fa
    mi8 do' re,4. do8 r2 r4

    %7
    R1.*2
    do8 mi16 fa sol8 la16 si do8 sol mi16 do mi fa sol8 [la16 si] do8 sol16 fa
    mi8 do do,4 r r8 re'[sol, re'16 mi fa8 re]\mbreak

    %11
    mi16 re do re mi4 la do, r la'
    re, r si' mi, r do'
    sol r \parenthesize r sol do,8 mi16 fa sol4~

    %14
    sol8 fa16 sol la8 sol fa mi fa8[mi16 fa] sol8 fa mi re
    mi4 r r r2 r4
    R1.*3

    %19
    re16 sol fa sol re sol fa sol re sol fa sol mi4 r r
    re16 sol fa sol re sol fa sol re sol fa sol mi4 r r\mbreak
    R1.*3

    %24
    do8 mi16 fa sol8 la16 si do8 sol mi16 do mi fa sol8 [la16 si] do8 sol
    mi8 do r4 \parenthesize r do16 mi re mi do [mi re mi] do mi re mi
    re fa mi fa re fa mi fa re fa mi fa mi sol fa sol mi [sol fa sol] mi sol fa sol\mbreak

    %27
    fa la sol la fa la sol la fa la sol la sol8 la sol fa mi4
    mi8 fa re4. do8 do4 r r
    R2.

    %30
    R1.
    r2 r4 sol'4 do,8 mi16 fa sol4~
    sol8 fa16 sol la8 sol fa mi fa mi16 fa sol8 [fa mi re]

    %33
    mi16 fa mi fa sol8 la16 si do8 sol mi16 do mi fa sol8[la16 si] do8 sol16 fa
    mi8 do' re,4. do8 do4\fermopz  r r

}

IIIvlIn = \relative do'' {

    R2.
    r2 r4 mi4 la,8 mi'16 fad sol4~
    sol8 fad16 sol la8 sol fad mi fad16(sol) la8 \parentSlur (la) [re,16(mi)] fad4~

    %4
    fad8 mi16 fad sol8 fad mi re~re16 [dod re mi] fad8 mi re dod
    re16 mi re mi fad4 r re16 la re mi \grace sol8 fad4~fad16 re fad mi\mbreak
    re8 la r8 si dod8. re16 re re, fad re fad [fad la fad] la la dod la

    %7
    re4 r r r2 r4
    mi^\f la,8 mi'16 fad sol4~sol8 fad16 (sol) la8 [sol fad mi]
    fad la re4 r re,16 la re mi fad4~fad16 re  fad mi
    re8 la' mi'4 r r2 r4\mbreak

    %11
    R1.*2
    r2 r4 r8 re,16_\markup\italic"unisoni moderato" mi fad8 [re16 mi] fad4~
    fad8 mi16 fad sol8 fad mi re mi re16 mi fad8 [mi re dod]

    %15
    re4 r r r2 r4
    mi4\p la,8 mi'16 fad sol4~sol8 fad16 sol la8 [sol fad mi]
    fad16 la sol la fad sol mi fad re mi dod re si4 r r

    %18
    r2 r4 r r r8 mi
    dod la r mi' dod la r4 r r8 fad'\f
    la la, r mi' \p dod la r4 r la\p~\mbreak

    %21
    la sol r r r si~
    si la r r r dod~
    dod si r r r mi~

    %24
    mi re r <la' la, re,>\f r r
    r8 re, dod4.\tr\p re8 re4 r r
    R1.*3

    %29
    R2.
    r2 r4 mi4 la,8 mi'16 fad sol4~
    sol8 fad16 sol la8 sol fad mi fad16(sol) la8 \parentSlur (la) [re,16(mi)] fad4~

    %32
    fad8 mi16 fad sol8 fad mi re~re16 [dod re mi] fad8 mi re dod
    re16 mi re mi fad4 r re16 la re mi \grace sol8 fad4~fad16 re fad mi\mbreak
    re8 la r8 si dod8. re16 re4\fermopz r r

}

IIIvlIIn = \relative do'' {

    re4 la8 re16 mi fad4~
    fad8 mi16 fad sol8 fad mi re dod16 re mi8~mi [dod16 re] mi4~
    mi8 re16 mi fad8 mi re dod re4 r re

    %4
    re r re re r la
    la r r la r r
    la r8 sol mi la r2 r4

    %7
    R1.*22
    re4 la8 re16 mi fad4~
    fad8 mi16 fad sol8 fad mi re dod16 re mi8~mi [dod16 re] mi4~

    %31
    mi8 re16 mi fad8 mi re dod re4 r re
    re r re re r la
    la r r la r r

    %34
    la r8 sol mi la \parenthesize re4\fermopz r r

}

IIIvlan = \relative do' {

    la4 r re
    re r si mi r r
    dod r la' la r la,

    %4
    la r la' re, r la'
    la r r r2 r4\mbreak
    re, r la la r r

    %7
    la r r r2 r4
    R1.*21
    la4 r re

    %30
    re r si mi r r
    dod r la' la r la,
    la r la' re, r la'

    %33
    la r r r2 r4\mbreak
    re, r la la\fermopz r r

}

IIIbcn = \relative do {

    re4 fad re
    sol sol, sold' la r r
    la r la re fad, re

    %4
    re' r re, sol r la
    re, r r re r r\mbreak
    re'8 fad, sol4 la re, r r

    %7
    re fad re sol sol, sold'
    la r r la r la
    re, r r re r r

    %10
    re fad re la' dod la\mbreak
    re re, fad sol \parenthesize r sold
    la r lad si r si

    %13
    dod r dod re r re,
    re' r re, sol r la
    re, fad re sol sol, sold'

    %16
    la r \parenthesize r  la r la
    re r re, mi r r
    mi r r la8 dod, re4 mi

    %19
    la,  r la re r re
    la r la re \parenthesize r fad\mbreak
    sol r sol sold r sold

    %22
    la r la lad r lad
    si r si dod r dod
    re r r re, r r

    %25
    re la' la, re r re
    fad r la re, r re\mbreak
    sol r sol re r fad_\markup\italic \center-column{"Cadenza"\vspace # -0.2"ad libitum"}

    %28
    sol la la, re r r
    re4 fad re
    sol sol, sold' la r r

    %31
    la r la re fad, re
    re' r re, sol r la
    re, r r re r r\mbreak

    %34
    re'8 fad, sol4 la re,\fermopz r r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> s
    <7> <6> <6> s2.
    <7>4 s <7> s <6> s
    s1.*3
    s4 <6> s <7> <6> <6>
    s2. <7>4 s <7>
    s1.*3
    s4 s <6> s s <6>
    <6> s <6> s2.
    s1.
    s2. <7>4 <6> <6>
    s2. <7>4 s <7>
    s2. <_+>
    <_+> s4 <6> <_+>
    s1.
    s2. s4 s <6>
    s2. <6>
    s <6>
    <5> <6 5>4 s <6 5>
    <5>1.
    s
    <6>4 s <5> s2.
    s1.*2
    s4 <6> s
    <7> <6> <6> s2.
    <7>4 s <7> s <6> s

}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 55
    s2.
    \set Score.measureLength = #(ly:make-moment 6 4)
    s1.*27
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2.
    \set Score.measureLength = #(ly:make-moment 6 4)
    s1.*5
    \bar "|."

}

IIIalto = {
    \new Voice = "amen"
    %\notypeset
    \IIIglobal
    <<\IIIalton\forma>>
}


IIItp = {
    \IIIglobal
    <<\IIItpn \forma>>
}


IIIvlI = {
    \IIIglobal
    \clef violin
    <<\IIIvlIn \forma>>
}


IIIvlII = {
    \IIIglobal
    \clef violin
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
#(set-global-staff-size 16.5)


\pointAndClickOff


\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}


\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge\bold\fill-line {"Laudate pueri [ZWV 81]"}
    \markup \fill-line{"  ""  ""J. D. Zelenka (1679-1745)"}

    \markup \huge {[1. Allegro]}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"trumpet"
                \set Staff.instrumentName = \markup  \center-column {"Tromba"}
                \Itp
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino 1"}
                \IvlI
                \key re\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino 2"}
                \IvlII
                \key re\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \Ivla
                \key re\major
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key re\major\time 4/4  r1^\markup \right-align"Tenore" }
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \Ialto
                \key re\major
                \new Lyrics \lyricsto "laudate" \Itesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Basso""Continuo]"}
                \key re\major
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.8
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[2. Andante]}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violini""Uniso[ni]"}
                \IIvlI
                \key re\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \IIvla
                \key re\major
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key re\major \time 2/4  \numericTimeSignature si4^\markup \right-align"Tenore" }
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \IIalto
                \key re\major
                \new Lyrics \lyricsto "quis" \IItesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Basso""Continuo]"}
                \key re\major
                \IIbc
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[3.] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"trumpet"
                \set Staff.instrumentName = \markup  \center-column {"Tromba"}
                \IIItp
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino 1"}
                \IIIvlI
                \key re\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino 2"}
                \IIIvlII
                \key re\major
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \IIIvla
                \key re\major
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key re\major \numericTimeSignature \time 3/4  \override Staff.TimeSignature.style = #'single-digit r2.^\markup \right-align"Tenore" }
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \IIIalto
                \key re\major
                \new Lyrics \lyricsto "amen" \IIItesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Basso""Continuo]"}
                \key re\major
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.8
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
