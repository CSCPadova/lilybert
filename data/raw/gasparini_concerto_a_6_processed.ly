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


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}


IvlIn = \relative do'' {

    mi4 mi mi2
    mi4 mi mi2
    R1

    %4
    mi4 mi mi2~
    mi4 re mi2\mbreak
    mi4 re mi2

    %7
    r8 mi re mi do4 si
    la sold mi si'
    do mi mi sold

    %10
    la si mi, mi
    mi si'\mbreak do si
    do si do si

    %13
    do2 si
    r4 la fa2
    mi4 la2 sold4

    %16
    r8 la sol? la fa4 mi
    fa la\mbreak la4. dod8
    la4 la re, mi

    %19
    fa la la dod
    la la la la
    la la la2

    %22
    la r_\fermata
    r4 la la2\mbreak
    si2 r4 si

    %25
    la2 sol
    r4 sol fa!2~
    fa4 mi2 red4

    %28
    mi2 r4 si'
    si2 la
    fa mi4 la~

    %31
    la sold\mbreak la2
    fa mi4 la~
    la sold la2

    %34
    la,4 r8 la si4 r8 si
    do16 si la si do si do re mi8 si mi mi
    mi4 red mi r8 mi\mbreak

    %37
    do16 si la si do re  mi fa mi2
    mi4 r mi16 re mi fad mi sol fad mi
    la si la sol fad si la si sold4 r8 mi

    %40
    mi16 fa mi re do8 do si4 r8 si\mbreak  %%% fine p. 8
    la16 si do re  mi re mi fad sol8 mi r si'
    la4 si si r8 mi,

    %43
    mi2  mi16 re mi fa mi fa mi re
    do4 r8 la sol4 r\mbreak
    R1*2

    %47
    r2 re'4 r8 re
    mi4 r8 mi fad16 mi re mi fad sol la fad\mbreak
    sol4 r sol r8 sol

    %50
    la4 r re, r8 sol
    sol4 r r2
    r sol4 r8 sol\mbreak

    %53
    la4 r8 la si16 la sol la si do re si
    do8 sol do do do4 si
    do r8 do la4 r

    %56
    r mi re4. do8\mbreak
    si16 la sol la si re do si la4 r8 re~
    re re mi4 r8 mi fad16 re do re

    %59
    si4 sol'8. fa?16 mi re do re mi sol fa mi
    re do si do re8 sol,\mbreak sol4 mi'~
    mi re2 do4~

    %62
    do fa mi sol
    fa16 mi re mi fa la sol fa mi re do re mi sol fa mi\mbreak
    re do si do re fa mi re do si la si do mi re do

    %65
    si do re do si8. si16 la2
    R1
    mi'4 r8 mi fad4 r8 fad\mbreak

    %68
    sold16 fa? mi fa sold la si sold la8 mi la la
    la4 sold la r8 la
    sold16 fa mi fa sold si la sold fad2

    %71
    mi4 si'~\mbreak si la~
    la sol~sol fad~
    fad mi2 red4

    %74
    mi r8 si' si4 r8 si\mbreak
    do4. do8 la4 r8 si
    sol4 r8 la fad4 r8 si

    %77
    mi,4 r8 mi mi2
    mi1

}

IvlIIn = \relative do'' {

    do4 si do2
    do4 si do2
    R1

    %4
    do4 do si2
    la sold\mbreak
    la sold

    %7
    r r8 mi' re mi
    do4 si la sold
    mi si' do mi

    %10
    mi sold la re,
    do si\mbreak la' sold
    la sold la sold

    %13
    la2 sold
    r4 mi2 re4~
    re do si2

    %16
    dod r8 la' sol la
    fa4 mi\mbreak fa la
    re, mi la la

    %19
    re, la la mi'
    fa mi fa mi
    fa mi fa2

    %22
    mi r_\fermata
    r4 fad2 la4\mbreak
    sol2 r4 fad

    %25
    fad?2 mi
    r4 si' la4. sol8
    sol4. fad8 fad2

    %28
    mi r4 sold
    mi2 mi
    re2. do4

    %31
    si2\mbreak do
    re2. do4
    si2 dod

    %34
    R1
    r2 mi,4 r8 mi
    fad4 r8 fad  sold16 fad mi fad sold la si sold\mbreak

    %37
    la8 mi la la la4 sold
    la16 si do re mi re mi fad sol fad sol la sol si la sol
    fad4 r8 fad mi4 si16 do re si

    %40
    do re do re mi8 mi mi16 re mi fa mi fa mi re\mbreak
    do4 r8 do si4 r8 sold
    la4 r r2

    %43
    la4 r8 la si4 r8 si
    do16 si la si do si do re mi8 si mi mi\mbreak
    mi4 r8 re mi4 r

    %46
    R1*2
    la,16 sol la si la si la sol fad4 r8 re'\mbreak
    re4 r mi16 re do re mi fa sol mi

    %50
    fa4 r sol r8 si,
    do16 si do re do mi re do si8.[la16 sol8 fa]
    mi4 r si'16 la sol la si re do si\mbreak

    %53
    la4 r re16 do si do re mi fa re
    mi4 sol4. sol8 sol4
    sol r8 mi re4. re8

    %56
    sol,4 r r2\mbreak
    sol4 r8 sol la4 r8 la
    si16 la sol la si do re si do si la si do re mi do

    %59
    re do si do re mi fa re mi4 r8 la
    fa16 mi re mi fa la sol fa\mbreak mi4 do
    si16 la sol la si re do si la sol fa sol la si do la

    %62
    re mi re do si do si la sold8 mi mi'4~
    mi re2 do4~\mbreak
    do si2 la4~

    %65
    la sold la2
    R1*4
    r2 la4 r8 la

    %71
    si4 r8 si\mbreak do16 si la si do mi re do
    si la sol la si re do si la sol fa sol la do si la
    sol fa mi fa sol si la sol fad!2

    %74
    mi8 si' mi4 r8 si' sold4\mbreak
    mi r r8 la fa4
    r8 sol mi4 r8 fad re4

    %77
    r8 mi do la si4. si8
    la1

}

IvlIIIn = \relative do'' {

    la4 sold la2
    la4 sold la2
    R1

    %4
    la4 la si2
    do4 la si2\mbreak
    do4 la si2

    %7
    si2 la4 si
    r8 mi re mi do4 si
    la sold la si

    %10
    do mi la, si
    la mi\mbreak mi' mi
    mi mi mi mi

    %13
    mi2 mi
    r4 la, la2
    la4 mi' mi2

    %16
    mi re4. dod8
    r la sol la\mbreak fa4 mi
    fa la re dod

    %19
    la la la la
    la dod la dod
    re dod re2

    %22
    dod r\fermata
    r4 re2 do4\mbreak
    si2 r4 si

    %25
    do si si2
    r4 sol la re
    do mi si2

    %28
    si r 4mi~
    mi re do2
    si sold4 la

    %31
    mi'2\mbreak mi
    r4 si sold la
    mi'2 mi

    %34
    R1*3\mbreak
    la,4 r8 la si4 r8 si
    do16 si la si do si do re mi8 si mi mi

    %39
    mi4 red mi r8 si
    la4 r si' r8 mi,\mbreak
    mi4 r si16 do re si mi fad sold la

    %42
    fad4 r8 si sold4 r8 si
    la4 r r2
    r mi4 r8 mi\mbreak

    %45
    fad4 r8 fad sold16 fad mi fad sold la si sold
    la8 mi la la la4 sold
    R1*2\mbreak

    %49
    sol?4 r8 re mi4 r
    la,16 sol la si do si do la si4 r
    mi16 re mi fa mi sol fa mi re4 r8 si

    %52
    sol sol'16 fa mi fa sol la si8 si, re mi\mbreak
    re4 re re r
    do r8 do re4 r8 re

    %55
    mi16 re do re mi fad sol mi fad mi re mi fad sol la fad
    sol fad? mi fad sol la si sol la sol fad! sol la si do la\mbreak
    si8 re, sol[sol,] re' re re4

    %58
    re r8 si la4 r8 la
    sol4 r8 si mi,4 r8 fa
    sol4 r8 sol'\mbreak sol2

    %61
    re16 do si do re fa mi re do si la si do re mi do
    fa sol fa mi re mi re do si4 do
    la4. si8 sol4. sol8\mbreak

    %64
    la4 si do4. la8
    mi' mi, mi4 mi r
    R1*2\mbreak

    %68
    r2 la4 r8 la
    si4 r8 si do16 si la si do si do re
    mi8 si mi mi mi4 red

    %71
    mi r\mbreak r8 mi do4
    r8 re si4 r8 dod? la4
    r8 si sol4 r8 si si4

    %74
    si r8 si si4 r\mbreak
    r la' fa16 mi re mi fa la sol fa
    mi re do re mi sol fa mi re do si do re fa mi re

    %77
    do si la si do mi re do si4. mi8
    dod1

}

IvlaIn = \relative do'' {

    mi,4 mi mi2
    mi4 mi mi2
    R1

    %4
    mi4 mi mi2
    do4 re si2
    do4 re si2

    %7
    si do4 mi
    mi2 r8 mi' re mi
    do4 si la sold

    %10
    la mi la si
    do sold\mbreak <la mi> si
    la si la si

    %13
    la2 si
    r4 mi, fa2
    la4 la si2

    %16
    la la4 la
    re4. dod8\mbreak r la sol la
    fa4 mi fa la

    %19
    re4. dod8 re4 dod
    re mi la, dod
    la dod la2

    %22
    la r\fermata
    r4 la re2\mbreak
    re r4 fad,

    %25
    fad?2 sol
    r r4 r8 si
    sol4 do fad,2

    %28
    sol r4 si
    sold2 mi
    la si4 mi,

    %31
    si'2\mbreak la
    la si4 mi,
    si'2 la

    %34
    R1*4
    r2 mi4 r8 mi
    fad4 r8 fad sold16 fad mi fad sold la si sold

    %40
    la8 mi la la la4 sold\mbreak
    la r8 la sold4 r8 mi'
    dod4 r8 red si4 r8 sold

    %43
    mi16 sold? fa sold la si do re si4 r8 si
    la2 r\mbreak
    si16 la si do si do si la sold8. la16 si do re si

    %46
    do si la si do mi re do si do re si mi fa mi re
    dod4 r8 mi la,4 r
    R1\mbreak

    %49
    si16 la sol la si do re si do4 r
    la4 r8 la sol4 r
    do r8 do re4 \parenthesize r8 re

    %52
    mi16 re do re mi re mi fa sol8 re sol sol\mbreak
    sol4 fad sol r8 sol
    mi16 fa? mi re do do si la sol4 r8 si

    %55
    mi,4 la~la8 re, re'4~
    re do2 la4\mbreak
    r8 re si sol do16 si la si do mi re do

    %58
    si4 sol2 fad4
    r8 re' sol,4 r8 sol mi4
    r8 re' sol, si\mbreak mi,2

    %61
    si'4 mi, r la
    fa re' sold, r
    r8 la' fa4 r8 sol mi4\mbreak

    %64
    r8 fad re4 r8 mi do4
    r2 la4 r8 la
    si4 r8 si do16 si la si do si do re

    %67
    mi8 si mi mi mi4 red\mbreak
    mi4 r8 mi do16 si la si do mi re do
    si4 mi mi la,8 do

    %70
    si4 r8 si la2
    sold4 r8 mi'\mbreak mi4 r8 fad
    re4 r8 mi dod4 r8 red

    %73
    si4 r8 do? si2
    r4 mi re16 do si do re fa mi re\mbreak
    do4 mi2 re4~

    %76
    re do2 si4~
    si la2 sold4
    la1

}

IvlaIIn = \relative do' {

    do4 mi do2
    do4 mi do2
    R1

    %4
    do4 do sol'2
    la4 la, mi'2\mbreak
    la4 la, mi'2

    %7
    mi mi4 sold
    mi mi mi2
    r8 mi re mi do4 si

    %10
    la sold la mi'
    mi mi\mbreak mi sold
    mi sold mi sold

    %13
    mi2 sold
    r4 dod, la2
    mi'4 do? mi2

    %16
    dod2 re4 la
    la' la\mbreak re,4. dod8
    r8 la' sol la fa4 mi

    %19
    re mi la,8 la' sol la
    fa4 la fa la
    fa la fa2

    %22
    la r\fermata
    r4 re, la' fad\mbreak
    re2 r4 red~

    %25
    red fad si,2
    r2 r4 r8 sol'
    sol4. la8 fad4 si

    %28
    sol2 r4 sold
    si mi, mi2
    fa si,4 do

    %31
    mi2\mbreak mi
    fa si,4 do
    mi2 mi

    %34
    R1*6
    la,4 r8 la si4 r8 si\mbreak
    do16 si la si do si do re mi8 si mi mi

    %42
    mi4 red mi8[re?16 do si do re si]
    do4 r8 mi mi4 r8 mi
    mi4 r8 mi mi4 r\mbreak

    %45
    R1
    r2 re4 r8 re
    mi4 r8 mi fa16 mi re mi fa sol la sib

    %48
    la4 r8 la la4 r8 la\mbreak
    si?4 r do, r8 do
    do4 r8 fa re16 do re mi fa mi fa re

    %51
    mi4 r si'16 la sol la si do re si
    do4 do,2 si4\mbreak
    re4 r8 la' sol4 r

    %54
    R1
    do,4 r8 do re4 r8 re
    mi16 re do re mi fad sol mi fad mi re mi fad sol la fad\mbreak

    %57
    sol8 re sol sol sol4 fad
    sol r8 sol do,4 r8 do
    sol' re re2 do4

    %60
    re2\mbreak mi
    R1*3\mbreak
    r2 la,4 r8 la %%% inizio p. 79

    %65
    si4 r8 si do16 si la si do re mi fa
    re do si do re fa mi re  do4 r8 do
    si4 si si2\mbreak

    %68
    si4 si' r8 mi, mi4
    mi r8 mi mi4 do8 mi
    mi sold16 fa mi4 la r8 la,

    %71
    mi'16 fa sold fa mi re do si\mbreak la4 do
    re4. re8 mi4 r8 fad
    sol4 r8 mi si4 si'16 do si la

    %74
    sold fa mi fa sold la sold la si4 r8 mi,
    mi4 r fa r8 re
    sol4 do la si

    %77
    mi, mi fa4. si,8
    dod1

}

IvlaIIIn = \relative do' {

    la4 si la2
    la4 si la2
    R1

    %4
    la4 la sol2
    fa mi\mbreak
    fa mi

    %7
    si'4 mi, la mi
    la mi la mi
    la mi r8 mi' re mi

    %10
    do4 si la sold
    la si\mbreak do mi
    do mi do mi

    %13
    do2 mi
    r4 la, re,2
    re'4 la mi' mi,

    %16
    mi2 la4. la8
    la4. la8\mbreak la4 la
    re4. dod8 r8 la sol la

    %19
    fa4 mi re mi
    fa mi' re mi
    re mi re2

    %22
    mi r\fermata
    r4 re re2\mbreak
    sol, r4 si

    %25
    fad si si2
    r4 sol do re
    sol, la si2

    %28
    mi, r4 si'
    si2 do
    la mi4 do'

    %31
    mi2\mbreak do
    la mi4 mi
    mi2 la

    %34
    R1*7
    r2 mi4 r8 mi
    fad4 r8 fad sold16 fad mi fad sold la si sold

    %43
    la8 mi la la la4 sold
    la r r2\mbreak
    R1

    %46
    la4 r8 la si4 r8 si
    dod16 si la si dod re mi dod re8 la re re
    re4 dod re r\mbreak

    %49
    re r8 sol, sol4 r
    la r8 do si4 r
    sol r8 sol sol4 r8 re'

    %52
    do4 r8 do sol4 r8 sol\mbreak
    re'4 re, sol r8 sol
    do4 r8 do sol4 sol

    %55
    do,2 r
    R1*2
    sol'4 r8 sol la4 r8 la

    %59
    si16 la sol la si do re si do8 sol do do
    do4 si\mbreak do2
    sol4 r8 sold la2

    %62
    re,4. re'8 mi4 do
    re4. re,8 mi4. mi8\mbreak
    fad4 sold la r8 la

    %65
    mi4 r8 mi la4 r8 la
    mi4 r8 mi la2
    R1*3

    %70
    mi4 r8 mi fad4 r8 fad
    sold16 fad mi fad sold la si sold\mbreak la8 mi la4
    si4. do8 \parenthesize dod4 red,?

    %73
    mi4. la8 si2
    mi,4. mi8 sold2\mbreak
    la4 r8 do re4 r8 re,

    %76
    mi4 r8 mi fad4 r8 sold
    la4 r8 la mi2
    la1

}

IbcIn = \relative do {

    la4 mi la2
    la4 mi la2
    R1

    %4
    la2 sol
    fa mi\mbreak
    fa mi

    %7
    mi'1~
    mi~
    mi

    %10
    r8 mi re mi do4 si
    la sold\mbreak la mi
    la mi' la, mi

    %13
    la2 mi
    r4 dod' re2
    la mi

    %16
    la1\parentSlur (
    la)~
    la

    %19
    r8 la' sol la fa4 mi
    re dod re la
    re la re2

    %22
    la r\fermata
    r4 fad'2 fad4\mbreak
    sol2 r4 red~

    %25
    red red? mi2
    r4 mi la, si
    do la si2

    %28
    mi, r4 sold
    sold2 la4 do
    re2 mi4 mi

    %31
    mi2\mbreak la,
    re mi4 mi
    mi2 la,

    %34
    R1*7\mbreak
    r2 mi'4 r8 mi
    fad4 r8 fad sold2

    %43
    la8 la, la'4~la sold
    la la, mi2\mbreak
    si' mi

    %46
    la, si
    dod4 la re2
    la re\mbreak

    %49
    sol, do
    fa, sol
    do sol'8.[fa16 mi8 re]

    %52
    do2 sol\mbreak
    re'4 re, sol2
    do4 mi8 do sol'4 sol,

    %55
    do2 r
    R1*2

    %58
    sol'4 r8 sol la4 r8 la
    si4 si, do2~
    do4 si\mbreak do2

    %61
    sol'4. sold8 la2
    re, mi4 do
    re2 mi4. mi8\mbreak

    %64
    fad4 sold la4. la,8
    mi'4 mi, la la'
    mi mi, la la'

    %67
    sol mi si2\mbreak
    mi la,
    mi'4 mi, la2

    %70
    mi' fad
    mi\mbreak la4 la,
    si4. si8 dod4 red

    %73
    mi4. la,8 si2
    mi, sold\mbreak
    la4 do re2

    %76
    mi4. mi8 fad4 sold
    la2 mi
    la,1

}

IbcIIn = \relative do {

    la4 mi la2
    la4 mi la2
    R1

    %4
    la2 sol
    fa mi\mbreak
    fa mi

    %7
    mi'1~
    mi~
    mi

    %10
    r8 mi re mi do4 si
    la sold\mbreak la mi
    la mi' la, mi

    %13
    la2 mi
    r4 dod' re2
    la mi

    %16
    la1\parentSlur (
    la)~
    la

    %19
    r8 la' sol la fa4 mi
    re dod re la
    re la re2

    %22
    la r\fermata
    r4 fad2 fad4\mbreak
    sol2 r4 red'

    %25
    red?2 mi
    r4 mi la, si
    do la si2

    %28
    mi, r4 sold
    sold2 la4 do
    re2 mi

    %31
    mi\mbreak la,
    re mi4 mi
    mi2 la,

    %34
    la4 la'2 sold4
    la2 sol4 mi
    si2 mi\mbreak

    %37
    la, mi'
    la,4 la' sol sol,8 do
    la4 si mi4. mi8

    %40
    la4 la, mi'2\mbreak
    la, mi'
    fad2 sold

    %43
    la8 la, la'4~la sold
    la la, mi2\mbreak
    si' mi

    %46
    la, si
    dod4 la re2
    la re\mbreak

    %49
    sol, do
    fa, sol
    do sol'8.[fa16 mi8 re]

    %52
    do2 sol\mbreak
    re'4 re, sol2
    do4 mi8 do sol'4 sol,

    %55
    do \clef alto do' re2
    mi fad4 fad,\mbreak
    sol \clef tenor sol2 fad4

    %58
    sol2 la
    si \clef bass do,~
    do4 si\mbreak do2

    %61
    sol'4. sold8 la2
    re, mi4 do
    re2 mi4. mi8\mbreak

    %64
    fad4 sold la2
    mi4 mi, la la'
    mi mi, la la'

    %67
    sol mi si2\mbreak
    mi la,
    mi'4 mi, la2

    %70
    mi' fad
    mi\mbreak la4 la,
    si4. si8 dod4 red

    %73
    mi4. la,8 si2
    mi, sold\mbreak
    la4 do re2

    %76
    mi4. mi8 fad4 sold
    la2 mi
    la,1

}

IbfIn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s2 <6>
    <7>4 <6> <_+>2
    <7>4 <6> s2
    <5 3>2 <6 4>
    <5 3> <6 4>
    <5 3> <6 4>
    s1*4
    s2 <9>4 <8>
    <4> <3-> <5 4> <3>
    <5 3>2 <6 4>
    <5 3> <6 4>
    <5 3> <6 4>
    s1*4
    s4 <6 5>2 s4
    s1
    s4 <6 5> s2
    s2 <6->4 <5>
    s <7 5> <4> <3>
    <_->1
    <6 5>
    <6 5>2 <7 _+>4 <6 4>
    <5 4> <3>  s2
    <6 5> <7 _+>4 <6 4>
    <5 4> <3> s2
    s1*10
    s2 <_->
    <4>4 <3> <_+>2
    <_-> <7>4 <6>
    s2 <_->
    <4>4< 3> <_+>2
    s1*3
    s2 <4>4 <3>
    <4> <3> s2
    s1*6
    <4 2>4 s s2
    <6>4 <6 5> <4> <3>
    <7 _-> <6 5> <_+> s
    <9> <8> <7> <6->
    s2 <9>4 <8>
    <4> <3> s2
    <7>4 <5 4> <3> s
    s2 <4>4 <3>
    s1
    <4>4 <3> s2
    <_+> <7>4 <6+>
    <_+>2 s
    <7>4 <6-> s2
    <9+>4 <8> <4> <3>
    s1
    s4 <6> <9 5> <8 6>
    <7> <6> <5-> s
    <9> <8> <4> <3>

}

IbfIIn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s2 <6>
    <7>4 <6> <_+>2
    <7>4 <6> s2
    <5 3>2 <6 4>
    <5 3> <6 4>
    <5 3> <6 4>
    s1*4
    s2 <9>4 <8>
    <4> <3-> <5 4> <3>
    <5 3>2 <6 4>
    <5 3> <6 4>
    <5 3> <6 4>
    s1*7
    s2 <6->4 <5>
    s <7 5> <4> <3>
    <_->1
    s
    <6 5>2 <7 _+>4 <6 4>
    <5 4> <3>  s2
    <6 5> <7 _+>4 <6 4>
    <5 4> <3> s2
    s4 <2>2 s4
    s1
    s2 <_+>  %% fine p. 7 OK

    %%bar 37
    s <4>4 <3>
    s1
    <6 5>2 <_+>
    s <4>4 <3>
    s2 <_+>
    <7>4 <6+> s2
    s1
    s2 <_->
    <4>4 <3> <_+>2
    s <7>4 <6>
    s2 <_->
    <4>4< 3> <_+>2
    s1*3
    s2 <4>4 <3>
    <4> <3> s2
    s1
    s2 <_+>
    s1
    s2 s4 <6 5>
    <5> <6> <7> <6+>
    s2 <9>4 <8>
    <4 2> s s2
    <6>4 <6 5> <4> <3>
    <7 _-> <6 5> <_+> s
    <9> <8> <7> <6->
    s2 <9>4 <8>
    <4> <3> s2
    <7>4 <5 4> <3> s
    s2 <4>4 <3>
    <_+>1
    <4>4 <3> s2
    <_+> <7>4 <6+>
    <_+>2 s
    <7>4 <6-> s2
    <9+>4 <8> <4> <3>
    s1
    s4 <6> <9 5> <8 6>
    <7> <6> <5-> s
    <9> <8> <4> <3>

}

forma = {

    \key la\minor
    \time 4/4
    \tempo 2 = 40
    s1*33
    \bar ":..:"\break
    \mark\markup\huge "[Allegro]"
    \tempo 2 = 57
    s1*45
    \bar ":|."

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


IvlaI = {
    \Iglobal
    <<\IvlaIn \forma>>

}


IvlaII = {
    \Iglobal
    \clef alto
    <<\IvlaIIn \forma>>

}

IvlaIII = {
    \Iglobal
    \clef tenor
    <<\IvlaIIIn \forma>>

}

IbcI = {
    \Iglobal
    \clef bass
    <<\IbcIn \forma\IbfIn>>

}

IbcII = {
    \Iglobal
    \clef bass
    <<\IbcIIn \forma \IbfIIn>>
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


IIvlIn = \relative do'' {

    la4 si do re mi2
    mi2. re4 do2
    re do si

    %4
    do2. re4 mi2
    fa1 mi2
    fa1 mi2

    %7
    re1 do2
    re1 do2
    re re2. mi4\mbreak

    %10
    mi1.
    si'2. si4 si2
    la2. si4 do2

    %13
    si mi, si'
    la2. si4 do2
    la la, si

    %16
    re1 mi2
    re1 mi2\mbreak
    re2 re2. la'4

    %19
    si1.
    si,2 si si
    do2. si4 la2

    %22
    la' sol fa
    mi2. re4 do2
    mi la sol

    %25
    fa2. mi4 re2
    do si2. si4\mbreak
    la1.

    %28
    si'2 si si
    la2. la4 la2
    la re, sol

    %31
    sol2. fa4 mi2
    sol la do
    fa,2. la4 sold2

    %34
    la si2. si4
    dod1.
    mi,2 mi2. mi4\mbreak

    %37
    mi1.
    la2 la2. la4
    sold1.

    %40
    sold2 sold2. sold4
    la1.
    la2 la2. la4

    %43
    fa1.
    fad2 fad2. fad4
    sol1.

    %46
    sold2 sold2. sold4\mbreak
    la2. si4 do2
    do si la

    %49
    sold2. fa4 mi2
    sold sold sold
    la2. si4 do2

    %52
    la la2. sold4
    la1.
    sold2 sold2. sold4

    %55
    la2. si4 do2
    la la2. sold4
    la1.

}


IIvlIIn = \relative do'' {

    do2. do4 si2
    do2. si4 la2
    si la sold

    %4
    la2. la4 la2
    do1 si2
    do1  si2

    %7
    la1 sol2
    la1 sol2
    la la2. si4\mbreak

    %10
    sold1.
    sold'2. sold4 sold2
    mi1 mi2

    %13
    re si mi
    mi2. re4 do2
    la1 mi2

    %16
    fa1 sol2
    fa1 sol2\mbreak
    re'2 re2. re4

    %19
    si1.
    sold2 sold sold
    la2. si4 do2

    %22
    do do2. si4
    do2. re4 mi2
    do fa  mi

    %25
    re2. do4 si2
    la2 la2. sold4\mbreak
    la1.

    %28
    mi'2 mi mi
    mi2. re4 do2
    fa re re

    %31
    do2. re4 mi2
    mi fa mi
    la2. la4 mi2

    %34
    mi mi2. mi4
    mi1.
    do2 do2. do4\mbreak

    %37
    si1.
    mi2 re2. mi4
    mi1.

    %40
    mi2 mi2. si4
    do1.
    dod2 dod2. dod4

    %43
    re1.
    re2 re2. re4
    si1.

    %46
    mi2 mi mi\mbreak
    mi2. re4 do2
    mi fa2. fa4

    %49
    mi1.
    mi2 mi mi
    mi2. re4 do2

    %52
    mi2 mi2. mi4
    mi1.
    mi2 mi mi

    %55
    mi2. re4 do2
    mi2 mi2. mi4
    mi1.

}

IIvlIIIn = \relative do'' {

    R1.*10
    mi2. mi4 mi2
    mi2. re4 do2

    %13
    re2. do4 si2
    do2. re4 mi2
    fa1 mi2

    %16
    re1 do2
    re1 do2\mbreak
    re re2. mi4

    %19
    mi1.
    R1.*8
    si2 si si

    %29
    do2. si4 la2
    la' sol2. fa4
    mi2. re4 do2

    %32
    mi la sol
    fa2. mi4 re2
    do si2. si4

    %35
    la1.
    R1.*2
    la2 la2. la4

    %39
    si1.
    R1.*2
    mi2 mi2. mi4

    %43
    re1.
    R1.*2
    si2 si si\mbreak

    %47
    do2. si4 la2
    la re2. re4
    si1.

    %50
    si2 si si
    la2. la4 mi'2
    do si2. si4

    %53
    la1.
    si2 si si
    la2. la4 mi'2

    %56
    do si2. si4
    do1.

}

IIvlaIn = \relative do'' {

    R1.*10
    si2. si4 si2
    do2. si4 la2

    %13
    si la sold
    la1 la2
    do1 si2

    %16
    la1 sol?2
    la1 sol2\mbreak
    la la2. la4

    %19
    sold1.
    R1.*8
    sold2 sold sold

    %29
    la2. si4 do2
    do do2. si4
    do1 do2

    %32
    do do mi
    re2. do4 si2
    la la2. sold4

    %35
    la1.\mbreak
    R1.*2
    do2 re2. re4

    %39
    si1.
    R1.*2
    la2 la2. la4

    %43
    la1.
    R1.*2
    sold2 sold sold\mbreak

    %47
    mi1 mi2
    do' fa, re'
    sold,2. sold4 sold2

    %50
    sold2 sold sold
    mi1 mi2
    mi' si2. mi4

    %53
    do1.
    sold2 sold sold
    mi1 mi2

    %56
    mi' si2. mi4
    dod1.

}

IIvlaIIn = \relative do' {

    R1.*10
    sold'2. sold4 sold2
    la1 la2

    %13
    fa mi mi
    mi1 mi2
    do1 mi2

    %16
    la1 mi2
    do1 mi2\mbreak
    la,1.

    %19
    mi'
    R1.*8
    mi2 sold mi

    %29
    mi1 mi2
    fa si, re
    sol,1 sol2

    %32
    sol' do, sol'
    re2. fad4 sold2\mbreak
    mi mi2. mi4

    %35
    mi1.
    R1.*2
    la,2 la2. la4

    %39
    mi'1.
    R1.*2
    mi2 mi2. mi4

    %43
    fa1.
    R1.*2
    si2 si si\mbreak

    %47
    la1 la2
    la fa la
    mi1.

    %50
    si2 si si
    do la2. la'4
    mi2 mi2. mi4

    %53
    mi1.
    si2 si si
    do la2. la'4

    %56
    mi2 mi2. mi4
    mi1.

}

IIvlaIIIn = \relative do' {

    R1.*10
    mi2. mi4 mi2
    la,2. la4 la2

    %13
    re mi1
    la, la2
    la1 sol2

    %16
    fa1 mi2
    fa1 mi2\mbreak
    do'1.

    %19
    si
    R1.*8
    mi2 mi mi

    %29
    la,2. la4 la2
    fa sol sol
    do1 do2

    %32
    do do do
    re1 mi2
    la, mi' mi,

    %35
    la1.\mbreak
    R1.*2
    fa2 fa2. fa4

    %39
    mi1.
    R1.*2
    la2 la2. la4

    %43
    re1.
    R1.*2
    mi2 mi mi\mbreak

    %47
    la,2. la4 la2
    do re2. re4
    mi1.

    %50
    mi2 mi mi
    do2. si4 la2
    re, mi1

    %53
    la1.
    mi'2 mi mi
    do2. si4 la2

    %56
    re, mi1
    la1.

}

IIbcIn = \relative do {

    la2 la' sold2
    la1.
    re,2 mi1

    %4
    la,1.
    la'1 sol2
    la1 sol2

    %7
    fa1 mi2
    fa1 mi2
    fa1.\mbreak

    %10
    mi
    mi
    la,

    %13
    re2 mi1
    la,1.
    la'1 sol2

    %16
    fa1 mi2
    fa1 mi2\mbreak
    fa1.

    %19
    mi
    mi
    la1 la,2

    %22
    fa sol1
    do1.
    do

    %25
    re1 mi2
    la, mi'1
    la,1.

    %28
    mi'
    la,
    fa2 sol1

    %31
    do1.
    do2 fa do
    re1 mi2

    %34
    la, mi'1
    la,1.
    la'\mbreak

    %37
    sol
    fa
    mi

    %40
    mi
    la,
    la

    %43
    re
    re
    sol,

    %46
    mi'\mbreak
    la,
    do2 re1

    %49
    mi1.
    mi2 mi mi
    do2. si4 la2

    %52
    re2 mi1
    la,1.
    mi'2 mi mi

    %55
    do2. si4 la2
    re2 mi1
    la,1.

}

IIbcIIn = \relative do {

    la'1 sold2
    la1.
    re,2 mi1

    %4
    la,1.
    la'1 sol2
    la1 sol2

    %7
    fa1 mi2
    fa1 mi2
    fa1.\mbreak

    %10
    mi
    mi
    la,

    %13
    re2 mi1
    la,1.
    la'1 sol2

    %16
    fa1 mi2
    fa1 mi2\mbreak
    fa1.

    %19
    mi
    mi
    la1 la,2

    %22
    fa sol1
    do1.
    do

    %25
    re1 mi2
    la, mi'1
    la,1.

    %28
    mi'
    la,
    fa2 sol1

    %31
    do1.
    do2 fa do
    re1 mi2

    %34
    la, mi'1
    la,1.
    la'\mbreak

    %37
    sol
    fa
    mi

    %40
    mi
    la,
    la

    %43
    re
    re
    sol,

    %46
    mi'\mbreak
    la,
    do2 re1

    %49
    mi1.
    mi
    la,

    %52
    re2 mi1
    la,1.
    mi'1 mi2

    %55
    la,1.
    re2 mi1
    la,1.

}

IIbfIn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.*2
    <6>2 <6 4> <5 3>
    s1.
    <6>1 <6>2
    <6>1 <6>2
    <6>1 <6>2
    <6>1 <6>2
    <6>1.
    <_+>
    s
    s
    s2 <5 4> <3>
    s1.
    <6>1 <6>2
    <6>1 <6>2
    <6>1 <6>2
    <6>1.
    <_+>
    s1.*2
    s2 <4> <3>
    s1.*2
    s1 <7 _+>2
    s <4> <3>
    s1.*6
    s1 <7 _+>2
    s <4> <3>
    s1.*2
    <6>1.
    <7>2 <6>1
    <_+>1.
    s
    <_->
    <_+>
    <_->
    <_+>
    s
    <_+>
    s
    s
    <_+>


}

IIbfIIn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.*2
    <6>2 <6 4> <5 3>
    s1.
    <6>1 <6>2
    <6>1 <6>2
    <6>1 <6>2
    <6>1 <6>2
    <6>1.
    <_+>
    s
    s
    s2 <5 4> <3>
    s1.
    <6>1 <6>2
    <6>1 <6>2
    <6>1 <6>2
    <6>1.
    <_+>
    s1.*2
    s2 <4> <3>
    s1.*2
    s1 <7 _+>2
    s <4> <3>
    s1.*6
    s1 <7 _+>2
    s <4> <3>
    s1.*2
    <6>1.
    <7>2 <6>1
    <_+>1.
    s
    <_->
    <_+>
    <_->
    <_+>
    s
    <_+>
    s
    s
    <_+>
    s
    s
    s2 <4> <3>
    <_->1.
    s
    s
    s2 <4> <3>

}

forma = {

    \time 3/2
    \tempo 1 = 60
    s1.*57
    \bar ":|."

}


IIvlI = {
    \IIglobal
    %\notypeset
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


IIvlaI = {
    \IIglobal
    <<\IIvlaIn \forma>>

}


IIvlaII = {
    \IIglobal
    \clef alto
    <<\IIvlaIIn \forma>>

}

IIvlaIII = {
    \IIglobal
    \clef tenor
    <<\IIvlaIIIn \forma>>

}

IIbcI = {
    \IIglobal
    \clef bass
    <<\IIbcIn \forma\IIbfIn>>

}

IIbcII = {
    \IIglobal
    \clef bass
    <<\IIbcIIn \forma \IIbfIIn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    systems-per-page = #2
    print-first-page-number = ##f
    first-page-number = #2

}

\header {
    title = \markup \smaller "Concerto a 6"
    composer = \markup \center-column{"   ""F. Gasparini (1661-1727"}
}

\markup\huge "[Adagio]"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new PianoStaff
        <<
            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>
            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>

            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"[Violini]"}
                \set Staff.midiInstrument = #"violin"
                \IvlIII
            >>
        >>

        \new PianoStaff <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\time 4/4  mi'4 mi' mi'2}
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \IvlaI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IvlaII
            >>

            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"[Viole]"}
                \set Staff.midiInstrument = #"viola"
                \IvlaIII
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column\smaller{"[Basso I]"}
            \set Staff.midiInstrument = #"cello"
            \IbcI
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column\smaller{"[Basso II]"}
            \set Staff.midiInstrument = #"contrabass"
            \IbcII
        >>
    >>

    \layout {

        indent = 1.7\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }

        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

\markup\huge "[Andante]"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new PianoStaff
        <<
            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>
            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlIII
            >>
        >>

        \new PianoStaff <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\time 3/2\numericTimeSignature  r1.}
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \IIvlaI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIvlaII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIvlaIII
            >>
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \IIbcI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"contrabass"
            \IIbcII
        >>
    >>

    \layout {

        indent = 1.7\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }

        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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


