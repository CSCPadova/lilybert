\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

dolce = _\markup\italic "dol."


arco = _\markup \italic "coll'arco"

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
    \terzinequarto
}


IcrIn =  %\transpose sol do
\relative do {\key sol\major%\clef violin

    r8 sol' sol sol sol4 r
    r8 si si si si4 r
    r re,2 re4

    %4
    re r r2
    la'8 la16 la la8[la] la si si la\mbreak
    la re, re re re4 r

    %7
    r8 la' la la la4 r
    re,2. la'4
    si8 si16[si] si8[si] si la \grace si16 la8 sol

    %10
    sol4 r r2
    R1*3

    %14
    sol2 la
    si4 re, re re
    re2 si'

    %17
    la1~
    la4 la la la\mbreak
    re,1~

    %20
    re
    re4 r r2
    R1

    %23
    r4 re re r\mbreak
    R1*4

    %28
    si'8 r la r sol r la r
    si r la r sol r la r
    si r la r sol r la r\mbreak

    %31
    si4 r r2
    r4 sol si la
    sol1~\p

    %34
    sol~
    sol~
    sol\mbreak

    %37
    sol4 r r2
    R1
    r8 la8 si4 r r8 la

    %40
    r8 la [si si] la r re, r
    sol4 r re(si8) r
    re4 r re si8 r\mbreak

    %43
    re8 r si'4 sol re
    si4. re8 si sol' sol si
    sol4 si sol si

    %46
    sol sol8. sol16 sol4 r
    R1*23

    %70
    re1~
    re~
    re~

    %73
    re~
    re4 re re re
    re re re2\mbreak

    %76
    la'4 r re,2
    la'4 r re,2
    la'4 la8. la16 la4 r

    %79
    R1*4\mbreak

    %83
    re,1~
    re~
    re~

    %86
    re2 la'4 r
    R1*4\mbreak

    %91
    re,1~
    re
    re4 r r2

    %94
    R1*13
    re1
    R1

    %109
    r4 la'8. la16 la4 r
    r2 la2
    la4 r la2

    %112
    la4 r re, r\mbreak
    re r r2
    la'1

    %115
    sol8 sol[sol sol] sol4 r
    r re la'2
    re,4 r r2

    %118
    R1*17
    la'1\p(\mbreak
    la)
    (la)

    %138
    (la2) re,
    la'1
    (la)

    %141
    re,\f
    r4 la' la la\mbreak
    r4 re,8. re16 re2

    %144
    r4 la' la la
    re, r r2
    R1

    %147
    la'\f
    la\mbreak
    la4 r r2

    %150
    r4 la\p la r
    R1*11

    %162
    la4 r r2\mbreak
    la4 r r2
    R1*7

    %171
    r4 la la r
    r la la r
    r la la r

    %174
    r re, re r
    r re\mbreak re r
    r re re r

    %177
    r re re r
    r sol sol r
    r sol sol r\mbreak

    %180
    re r r2
    re1~
    re~

    %183
    re4 re8 re re4 r
    R1*27
    r2 r8 re re re\mbreak %fine pag. 18R

    %212
    si'4 r r2
    re,4 r r2
    r re'8 do si la

    %215
    sol4 r r2
    R1*3\mbreak

    %219
    sol1~\p
    sol~
    sol~

    %222
    sol2 re4 r
    R1*4

    %227
    sol,1~\mbreak
    sol
    sol4 r r2

    %230
    R1*19
    re'4 r r2
    la'1
    sol4 r r la

    %252
    si r r la
    si r r2\mbreak
    R1*2

    %256
    r4 si si si
    si r r2\fermata
    si8 r la r sol r la r

    %259
    si r la r\mbreak sol r la r
    si r la r sol r la r
    si4 r r2

    %262
    r4 sol si la
    sol r r2
    R1*3

    %267
    r4 si sol re4
    si4. re8 si sol' sol si
    sol4 si sol sol8. sol16

    %270
    sol4 r r2\fermata

}

IcrIIn = %\transpose sol do
\relative do {\key sol\major%\clef violin

    r8 si si si si4 r
    r8 sol' sol sol sol4 r
    r re2 re4

    %4
    re r r2
    re8 re16 re re8[re] re sol sol re\mbreak
    re8 re re re re4 r

    %7
    r8 re re re re4 r
    re2. re4
    sol8 sol16[sol] sol8 sol sol re re si

    %10
    si4 r r2
    R1*3

    %14
    si2 re
    sol4 re re re
    re2 sol

    %17
    la1~
    la4 la la la\mbreak
    re,1~

    %20
    re
    re4 r r2
    R1

    %23
    r4 re re r
    R1*4

    %28
    sol8 r re r si r re r
    sol r re r si r re r
    sol r re r si r re r\mbreak

    %31
    sol4 r r2
    r4 sol sol re
    sol,1~\p

    %34
    sol~
    sol~
    sol\mbreak

    %37
    sol4 r r2
    R1
    r8 re' sol4 r r8 re

    %40
    r8 re[sol si] la r re, r
    si4 r re(si8) r
    re4 r re si8 r\mbreak

    %43
    re r si'4 sol re
    si4. re8 si si si re
    si4 re si re

    %46
    si si8. si16 si4 r
    R1*24

    %71
    re1~
    re~
    re~

    %74
    re4 re re re
    re re re2\mbreak

    %76
    la'4 r re,2
    la'4 r re,2
    la'4 la8. la16 la4 r

    %79
    R1*4\mbreak

    %83
    re,1~
    re~
    re~

    %86
    re2 la'4 r
    R1*4\mbreak

    %91
    re,1~
    re
    re4 r r2
    R1*13

    %107
    re1
    r
    r4 la'8. la16 la4 r
    r2 la2
    re,4 r la'2

    %112
    re,4 r re r\mbreak
    re r r2
    la'1

    %115
    sol8 sol[sol sol] sol4 r
    r re la'2
    re,4 r r2

    %118
    R1*17
    la'1\p(\mbreak
    la)
    (la)

    %138
    (la2) re,
    la'1
    (la)

    %141
    re,\f
    r4 la' la la\mbreak
    r4 re,8. re16 re2

    %144
    r4 la' la la
    re, r r2
    R1

    %147
    la'\f
    la\mbreak
    la4 r r2

    %150
    r4 la\p la r
    R1*11

    %162
    la4 r r2\mbreak
    la4 r r2
    R1*7

    %171
    r4 la la r
    r la la r
    r la la r

    %174
    r re, re r
    r re\mbreak re r
    r re re r

    %177
    r re re r
    r sol sol r
    r sol sol r\mbreak

    %180
    re r r2
    re1~
    re~

    %183
    re4 re8 re re4 r
    R1*27
    r2 r8 re re re\mbreak %fine pag. 18R

    %212
    si'4 r r2
    re,4 r r2
    r re'8 do si la

    %215
    sol4 r r2
    R1*3\mbreak

    %219
    sol1~\p
    sol~
    sol~

    %222
    sol2 re4 r
    R1*4

    %227
    sol,1~\mbreak
    sol
    sol4 r r2

    %230
    R1*19
    re'4 r r2
    re1
    si4 r r re

    %252
    sol r r re
    sol r r2\mbreak
    R1*2

    %256
    r4 sol sol sol
    sol r r2\fermata
    sol8 r re r si r re r

    %259
    sol r re r\mbreak si r re r
    sol r re r si r re r
    sol4 r r2

    %362
    r4 sol sol re
    si r r2
    R1*3

    %267
    r4 si' sol re4
    si4. re8 si si si re
    si4 re si si8. si16

    %270
    si4 r r2\fermata


}

IclIn = %\transpose sol do
\relative do''
{\key sol\major

    r8 sol' sol sol sol4 r
    r8 si si si si4 r
    re,1~

    %4
    re2 do8 si la sol
    fad4 r r2\mbreak
    r8 fad' fad fad fad4 r

    %7
    r8 la la la la4 r
    la2. do,4
    si r r2

    %10
    R1*4

    %14
    sol'2 re
    re1~
    re4 si' sol si

    %17
    la1~
    la4 la la sol\mbreak
    fad r r8 sol la sol

    %20
    fad2 sol8 re si' fad
    sol si sol red mi fad sol sold
    la sol! fad mi fad8-. fad16 sol mi8-.[mi16 fad]

    %23
    re4 re re r\mbreak
    R1*4

    %28
    re2~re8 re re re
    re2~re8 re re re
    re2~re8 sol la la\mbreak

    %31
    si4 r r2
    r4 mi, re fad
    sol r mi2\soli(

    %34
    re fad)
    sol8 si-. sol-. re-. mi2(
    re fad)\mbreak

    %37
    sol4 r r2
    R1
    r4 r8 re fad4(sol8) re

    %40
    fad4(sol8-.) re mi la-. sol-. fad-.
    sol r r4 re4(si8 do)
    re sol fad sol re4 si8 do\mbreak

    %43
    re r r4 r2
    r8 re sol si sol re si re
    sol4 si sol si

    %46
    sol sol8. sol16 sol4 r
    R1*24

    %71
    r4 sol sol sol
    fad r r2
    r4 sol sol sol

    %74
    fad1~
    fad2 mi\mbreak
    mi fad

    %77
    mi fad
    mi4 la8. la16 la4 r
    R1*3

    %82
    r2 r4 re,\mbreak
    re8 sol \sf sol2\p fad4
    mi8 si'\sf(si2\p) la4

    %85
    la4. sol16 fad sol8(la si sol)
    fad2(mi4-!) r4
    R1*3

    %90
    r2 r4 re\mbreak
    re8 sol\sf sol2\p fad4
    mi8 si'\sf si2\p la4

    %93
    la8 r sol r fad r mi r
    re4 r r2
    R1*12

    %107
    re2 fad4. re8
    \grace mi16 re8 dod dod4 \mbreak dod8 [si16 dod re8 si]
    \grace dod?16 si8 la la4. sol'16 [la si8 sol]

    %110
    fad4 r sol2(
    fad4-.) r sol2(
    fad4-.) r re8 r r4\mbreak

    %113
    re4 r r2
    r4 la' la la
    sol4 r r2

    %116
    r4 re fad \grace fad16 mi8 re16 mi
    re4 r r2
    r8 fad-. mi-. re-.\mbreak dod si la sol

    %119
    fad4 r r2
    R1*19

    %139
    r2 la'8. \sf sib32\p la sol8[fad]
    sol mi mi fa! sol8.\sf la32\p sol fa8[mi]
    fa!1\f~

    %142
    fa?~\mbreak
    fa?~
    fa?~

    %145
    fa?4 r r2
    R1
    mi2\f(fa)

    %148
    mi(fa)\mbreak
    mi4 r8 fa\p mi[mi] r fa
    mi4 mi-. mi-. r

    %151
    R1*10
    r4 fa16 la sol fa mi8 re do! sib
    la do! fa16 la sol fa mi8 re do! sib\mbreak
    la sib-. do!-. re-. mi-. fa-. sol-. la-.

    %164
    sib4-. r r2
    R1*5

    %170
    r4 fa fa r
    r mi mi r
    r fa fa r

    %173
    r sol sol r
    r fa fa r
    r la\mbreak la r

    %176
    r sib sib r
    r do do r
    r sib sib r

    %179
    r sib? sib r\mbreak
    la r r2
    fad!2 sol

    %182
    fad! sol
    fad!4 re16 dod re dod re4 r
    R1*27

    %211
    r4 \grace la'16 sol8\f fad16 mi re8 re re re\mbreak
    si'4 \grace do16 si8 la16 sol fad8-. fad-. fad-. fad-.
    re4 \grace mi16 re8 do16 si la8 sol' fad mi
    re dod re mi re do si la

    %215
    sol4 r r2
    R1*2

    %218
    r2 r4 sol\mbreak
    sol8 do\sf do2\p si4
    la8 mi'\sf mi2\p re4

    %221
    re4. do16 si do8 re mi do
    \afterGrace si2({do16[si)]} la4-. r
    R1*3

    %226
    r2 r4 sol
    sol8 do\sf (do2\p) si4\mbreak
    la8 mi'\sf mi2\p re4

    %229
    re8 r do r si r la r
    sol4 r r2
    R1*18

    %249
    re'4 r r2
    fad1
    sol4 r r fad

    %252
    (sol-.) r r fad
    (sol-.) r8 red(mi4-.) r8 dod(\mbreak
    re4\puntopz) r8 si(do!4-.) r8 lad

    %255
    si4 r8 sold'(la4-.) r8 fad
    sol!2. sol4
    sol2 r\fermata

    %258
    re2~re8 re re re
    re2~\mbreak re8 re re re
    re2~re8 fad la la

    %261
    si4 r r2
    r4 mi, re fad
    sol r r2

    %264
    R1*3
    sol4\f si sol re
    si8 re sol si sol re si re
    sol4 si sol sol8. sol16

    %270
    sol4 r r2\fermata

}

IclIIn = %\transpose sol do
\relative do'' {\key sol\major

    r8 si si si si4 r
    r8 sol' sol sol sol4 r
    si,2 do8 si la sol

    %4
    fad sol la si do4 r
    re, r r2\mbreak
    r8 la' re re re4 r

    %7
    r8 fad fad fad fad4 r
    do2. la4
    sol r r2

    %10
    R1*4

    %14
    si2 la
    si do
    re1

    %17
    mi4 mi mi mi
    mi1\mbreak
    re8 re[mi re] dod2

    %20
    r8 do! re do si re si fad'
    sol si sol red mi fad sol sold
    la sol! fad mi fad8-. fad16 sol mi8-.[mi16 fad]

    %23
    re4 fad, fad r\mbreak
    R1*4

    %28
    re'2~re8 re re re
    re2~re8 re re re
    re2~re8 re re re\mbreak

    %31
    re4 r r2
    r4 do si la
    si r do2\soli(

    %34
    si la)
    si8 sol'-. re-. si-. do2(
    si la)\mbreak

    %37
    si4 r r2
    R1
    r4 r8 re do4(si8) re

    %40
    do4(si8) si do do[si la]
    si r r4 re4(si8 do)
    re sol fad sol re4 si8 do\mbreak

    %43
    re r r4 r2
    r8 si re sol re si sol si
    si4 re si re

    %46
    si si8. si16 si4 r
    R1*24

    %71
    r4 mi mi mi
    re r r2
    r4 mi mi mi

    %74
    re1~
    re\mbreak
    dod2 re

    %77
    dod re
    dod4 dod8. dod16 dod4 r
    R1*3

    %82
    r2 r4 re\mbreak
    re8 si si2 la4
    sol8 sol'(sol2) fad4

    %85
    fad4. mi16 re  mi8[(fad] sol mi)
    re2(dod4-!) r
    R1*3
    r2 r4 re

    %91
    re8 si\sf si2\p la4
    sol8 sol'\sf sol2\p fad4
    fad8 r mi r re r dod r

    %94
    re4 r r2
    R1*12

    %107
    fad,2 re'
    \grace mi16 re8 dod dod4 \mbreak dod8 [si16 dod re8 si]
    \grace dod?16 si8 la la4. sol'16 [la si8 sol]

    %110
    fad4 r mi2(
    re4-.) r mi2(
    re4-.) r fad,8 r r4\mbreak

    %113
    fad4 r r2
    r4 do'! do do
    si r r2

    %116
    r4 re2 dod4
    re r r2
    r8 fad-. mi-. re-.\mbreak dod si la sol

    %119
    fad4 r r2
    R1*19

    %139
    r2 fa'8.\sf sol32\p fa mi8[red]
    mi dod dod re mi8.\sf fa32\p mi  re8[dod]
    re1\f

    %142
    mib\mbreak
    re
    mib

    %145
    re4 r r2
    R1
    dod2\f(re)

    %148
    dod?(re)\mbreak
    dod4 r8 re\p dod[dod] r re
    dod4 dod dod r

    %151
    R1*10
    r4 fa16 la sol fa mi8 re do! sib
    la do! fa16 la sol fa mi8 re do! sib\mbreak
    la sib-. do!-. re-. mi-. fa-. sol-. la-.

    %164
    sib4-. r r2
    R1*5

    %170
    r4 la, la r
    r dod dod r
    r re re r

    %173
    r mi mi r
    r re re r
    r fad!\mbreak fad r

    %176
    r sol sol r
    r la la r
    r sol sol r

    %179
    r sol sol r\mbreak
    fad! r r2
    la,2 sib

    %182
    la sib
    la4 re16 dod re dod re4 r
    R1*27

    %211
    r4 \grace la'16 sol8\f fad16 mi re8 re re re\mbreak
    si'4 \grace do16 si8 la16 sol fad8-. fad-. fad-. fad-.
    re4 \grace mi16 re8 do16 si la8 sol' fad mi
    re dod re mi re do si la

    %215
    sol4 r r2
    R1*2

    %218
    r2 r4 sol\mbreak
    sol8 mi\sf mi2\p re4
    do8 do'\sf do2\p si4

    %221
    si4. la16 sol la8 si do la
    \afterGrace sol2({la16[sol)]} fad4-. r
    R1*3

    %226
    r2 r4 sol
    sol8 mi\sf mi2\p re4\mbreak
    do8 do'\sf do2\p si4

    %229
    si8 r la r sol r fad r
    sol4 r r2
    R1*18

    %249
    re'4 r r2
    la1
    si4 r r re(

    %252
    re-.) r r re~
    re\puntopz r8 red(mi4-.) r8 dod(\mbreak
    re4\puntopz) r8 si(do!4-.) r8 lad

    %255
    si4 r8 sold(la4-.) r8 fad
    si2. si4
    si2 r\fermata

    %258
    re2~re8 re re re
    re2~\mbreak re8 re re re
    re2~ re8 re re re

    %261
    re4 r r2
    r4 do si la
    si r r2

    %264
    R1*3
    si4\f sol' re si
    sol8 si[re sol] re si sol si
    si4 re si si8. si16

    %270
    si4 r r2\fermata

}

IflIn = \relative do'' {

    sol'2~sol8 \grace la16 sol16 fad sol8[la]
    \grace {sol16[la]} si2~si8 \grace do16 si16 la si8[do]
    \grace {si16[do]} re2 do8 si la sol

    %4
    fad16 la sol si la do si re do4 r
    re, r r2\mbreak
    fad2~fad8 \grace la16 fad16 mi fad8[sol]

    %7
    \grace{fad16[sol]} la2~la8 \grace si16 la16 sol la8[si]
    do16 si do si do si do si do si la sol fad mi re do
    si4 r r2

    %10
    sol'4 r r2
    R1*3

    %14
    sol2 la
    si do
    re8 re16(do) do8-.[si16(la)] sol8 si re si

    %17
    la8(la4 la la la8)
    la8(mi'4) la,8 la(mi'4) la,8\mbreak
    la re,[mi re] dod2

    %20
    r8 do'! re do si re si fad
    sol si sol red mi fad sol sold
    la sol! fad mi fad-.[fad16 sol] mi8-. mi16 fad

    %23
    re4 re' re r
    R1*4

    %28
    re8 r do r si r la r
    re8 r do r si r la r
    re8 r do r si r la r\mbreak

    %31
    si4 r r2
    r4 mi, re8 si' \grace si16 la8[sol16 fad]
    sol4 r r2

    %34
    r \grace re'16 do8[si16 do] re8 do
    si[re] si r r2
    r \grace re16 do8[si16 do] re8 do\mbreak

    %37
    si4 r r2
    R1
    r2 r8 re re4

    %40
    r8 re re8-.[si-.] do do[si la]
    sol r r4 re'\f (si8 do)
    re sol,[(fad sol)] re'4(si8 do)\mbreak

    %43
    re8 r si r sol r re r
    si4-. r r2
    R1*2

    %47
    \grace sol8\solo sol'2 \grace si,8 si'2
    \grace re,8 re'2 do8 si la sol
    fad4-. sol-. la-. si-.

    %50
    \grace re,8 do'2 r\mbreak
    R1*3

    %54
    sol,16 la si do re do si la sol4 r
    sol16 la si do re do si la sol4 r
    sol16 la si do re do si la sol4 r

    %57
    mi'4 r r2\mbreak
    re4 r fad r
    sol2 r8\grace do16 si8 la si

    %60
    sol4 r r8 \grace do16 si8 la si
    sol4 r r8 sol si re
    re dod do4. si8 la sol

    %63
    \tuplet3/2{
        \con fad8[mi re] \senza re re re fad[re re] la' re, re
        sol re' si sol[re si] la re re fad[re  re]\mbreak
        sol re' si sol[re si] la re re fad[re re]

        %66
        sol si si \grace do16 si8[la si]
    } si16 do re do si la sol fad
    \tuplet3/2{mi8 sol sol \grace la16 sol8[fad sol]} sol16 la si la sol fad mi re
    \tuplet3/2{dod8 mi mi mi[sol sol ] sol si si si[dod dod]}

    %69
    re,16 re' dod si la sol fad mi re4 r\mbreak
    R1
    dod'1

    %72
    re4 r r2
    dod1
    re4 r r2

    %75
    R1*4

    %79
    la4. si16 la sol8 fad sol la
    si re re4. si8 sol fad
    \grace sol16 fad8 mi mi mi la4. sol8

    %82
    sol2 fad4 r\mbreak
    R1*3

    %86
    r2 r8 mi fad sol
    la4. si16 la sol8 fad sol la
    si re re4. si8 sol fad

    %89
    fad8 mi mi mi la4. sol8
    sol2 (fad4) r\mbreak
    R1*2

    %93
    la8 fad sol mi re4 dod
    re4 r8 re mi4 r8 mi
    fad4 r8 fad sol4 r8 sol

    %96
    la sold16 la dod8[si16 dod]mi8 red16 mi dod8[si16 dod]\mbreak
    la8 sold16 la dod8[si16 dod]mi8 red16 mi dod8[si16 dod]
    re4 re,8-. mi-. fad4-. fad8-. sol-.

    %99
    la-. do!-. fad,-. la-. re,-. fad-. la-. fad-.
    sol si4 lad8 si (lad si) lad
    si si4 lad8 si (lad si) lad

    %102
    si-. si(dod re) dod(si la sol)\mbreak
    fad16 la si dod re dod re dod re la si dod re dod re dod
    re la si dod re dod re mi fad8 la, re fad

    %105
    la4. fad8 re-. la-. fad-. re-.
    mi1\tr
    re4 r r2
    R1*2

    %110
    r2 mi'
    re4 r mi2
    re4 r re8 r r4\mbreak

    %113
    re4 r r2
    R1
    r8 si si2 la8 sol
    fad dod'16 re \grace dod16 si8 [la16 sol] fad4 \grace fad16 mi8 re16 mi

    %117
    re4 r r2
    R1*2

    %120
    la'2 si8 la sold la
    \grace re,8 re'4. dod16 si la8[fad sol? la]
    la sold sol!4-! sol16 la si la sol fad mi re

    %123
    \grace mi16 re8 dod dod4. mi8 la sol
    sol2 \grace mi8 fad4 r\mbreak
    R1*5

    %130
    la,8 si16 dod re mi fad sold la8 dod mi dod\mbreak
    re4. la8 fad4 re
    la8 si16 dod re mi fad sold la8 dod mi dod

    %133
    re4. la8 fad4 re
    la8 la' sol16 fad mi re dod?8 la' sol16 fad mi re
    la4 r r2\mbreak
    R1*5

    %141
    fa'2\f sib8\ff do!16 re do8[sib]
    sib?(la do! la) sol fa-. (fa-. fa-.)\mbreak
    fa?16 sol fa mib re8 r sib' do16 re do8[sib]
    sib? la do! la sol fa? fa fa

    %145
    fa1\p~
    fa
    mi4 r r2
    R1*3

    %151
    la2 \grace do!16 sib8 la sib do
    la4 do8 la sol4 do,!
    la'2 sib8 la sib do

    %154
    la4 do8 la sol4 r
    sib4. sol8 la4 r\mbreak
    re4. si!8 do!2

    %157
    si!1
    (sib)
    la2 \con \tuplet3/2{sol8 re' dod re[sib sol]}

    %160
    fa2 sol8(la sib do!)
    la4 r r2
    R1*3

    %165
    la2 \grace do16 sib8 la sib do
    la4 do8 la sol4 do,!
    la'2 \grace la16 sib?8 la sib do

    %168
    la(sib do! dod) re(la sib sol)\mbreak
    fa4. la8 \grace la16 sol8 fa sol la
    fa?4 r r2
    R1*7

    %178
    r4 sib2 sol4
    r sib2 sol4\mbreak
    fad!8 fad[sol la] sib si do! dod

    %181
    re la fad! do'! sib re sib sol
    re la' fad! do'!  sib re sib sol
    re'4 r r2

    %184
    \grace sol,,8\solo sol'2 \grace si,8 si'2
    \grace re,8 re'2 do8 si la sol\mbreak
    fad4 sol la si

    %187
    \grace do,8 do'2 r
    R1*3

    %191
    sol,16 la si do re do si la sol4 r
    sol16 la si do re do si la sol4 r\mbreak
    sol16 la si do re do si la sol4 r

    %194
    R1
    re'4 r fad r
    sol2 r8 si la si

    %197
    sol4 r r8 \grace sol16 si8 la si
    sol4 r r8 sol(si re)\mbreak
    re dod do4. si8 la sol

    %200
    fad(mi) re-. re-. \senza \tuplet 3/2{
        fad8 re re la'[fad fad]
        sol re' si sol[re si] la re re fad[re re]
        sol re' si sol[re si] la re re fad[re re]
    }
    sol16[si, do re mi fad sol la] si8 si si si

    %204
    si16[re, mi fad sol la si do] re8 re re re\mbreak
    re1
    re

    %207
    re
    re2 red
    mi re!8 do si la

    %210
    sol4. sol8 \grace sol16 la8 sol la si
    sol4 r r2\mbreak
    R1*3

    %215
    re'4. mi16 re do8 si do re
    red mi mi4. re8 do si
    si la la la re4. do8

    %218
    do2 si4 r\mbreak
    R1*3

    %222
    r2 r8 la si do
    re4. mi16 re do8 si do re
    red mi mi4. re8 do si

    %225
    \grace do16 si8 la la la re4. do8
    do2 si4 r
    R1*2

    %229
    re,8 si do la sol4 fad
    \senza \tuplet3/2{
        sol8 sol' re si[si' sol] re re' si sol[si re]
        do la fad re[do la] re do la re[do la]

        %232
        sol sol' re si [si' sol] re re' si sol[si re]
        do la fad re[do la] re do la re[do la]
    }
    sol4 r8 sol la4 r8 la\mbreak

    %235
    si4 r8 si do4 r8 do
    si16 re sol re si' sol re' si do si la sol fad mi re do
    si16 re sol re si' sol re' si do si la sol fad mi re do

    %238
    si re do si do re mi fad sol la si do re8 re
    mi, r mi16 fad sol sol mi fad sol fad \grace la16 sol8 fad16 mi
    re8 sol si, re \grace re8 do4 si8 la\mbreak

    %241
    si16[sol sol' fad mi re do si] do[la la' sol fad mi re do]
    re[si si' la sol fad mi re] mi[do do' si la sol fad mi]
    \grace re8 re'1~

    %244
    re
    r16 re,[do si do re mi fad sol la si do] re8 re
    mi4. red8 mi red mi red\mbreak

    %247
    mi8 mi4 red8 mi red mi red
    mi4 fad sol dod,,
    re re'4. mi16 re do si la sol

    %250
    la1\tr
    sol4 r r2
    R1*5

    %257
    si4~\fermata_\markup\italic"Cadenza" si16 la si do la2\tr
    sol4 r r2
    R1*8

    %267
    r8 r16 sol si sol re si sol' re si sol re'' si sol re
    si8 re,-.[sol-. si-.] re sol si re
    si4 si sol si,8. si16

    %270
    si4 r r2\fermata

}

IflIIn = \relative do'' {

    si2~si8 re si re
    \grace{do16[re]} sol2~sol8 \grace la16 sol16 fad sol8[la]
    si4 re,2 re4

    %4
    re2~re8 si' la sol
    fad4 r r2\mbreak
    re2~re8 la re mi

    %7
    fad2~fad8 \grace sol16 fad16 mi fad8 sol
    la16 sold la sold la sold la sold la sol fad mi re do si la
    sol4 r r2

    %10
    si4 r r2
    R1*3

    %14
    si2 re
    re1
    re2 sol~

    %17
    sol4 sol sol sol
    sol1\mbreak
    fad4 r r8 sol la sol

    %20
    fad2 sol8 re' si fad
    sol si sol red mi fad sol sold
    la sol! fad mi fad-. fad16 sol mi8-.[mi16 fad]

    %23
    re4 fad fad r\mbreak
    R1*4

    %28
    re8 r fad r sol r re r
    re8 r fad r sol r re r
    re8 r fad r sol r re r\mbreak

    %31
    re4 r r2
    r4 do si8[re] \grace re16 do8 si16 la
    si4 r r2

    %34
    r \grace si'16 la8[sol16 la] si8 la
    sol[si] sol r r2
    r \grace si16 la8[sol16 la] si8 la\mbreak

    %37
    sol4 r r2
    R1
    r2 r8 re-. re4-.

    %40
    r8 re-. re-. re-. mi la[sol fad]
    sol r r4 re(si8 do)
    re sol[(fad sol)] re4(si8 do)\mbreak

    %43
    re r sol r re r si r
    sol4 r r2
    R1*6\mbreak

    %51
    \grace re8 re'2 \grace fad,8 fad'2
    \grace la,8 la'2 la16 si do si la sol fad mi
    re4-! re(mi fad)

    %54
    \grace sol,8 sol'2 r8 \grace do16 si8(la si)
    sol4 r r8 \grace do16 si8 la si
    sol4 r r8 sol8(si re)

    %57
    re dod(do4. si8) la sol\mbreak
    \con \tuplet3/2{fad8 mi re \senza re[re re] fad re re la' [re, re]}
    sol si,16 do re do si la sol4 r

    %60
    sol16 la si do re do si la sol4 r
    sol16 la si do re do si la sol4 r
    mi' r r2

    %63
    re4 r fad r
    sol r do16 si la sol fad mi re do\mbreak
    si4 r do'16 si la sol fad mi re do

    %66
    \tuplet3/2{si8 sol' sol \grace la16 sol8[fad sol]} sol16 la si la sol fad mi re
    \tuplet3/2{dod8[mi mi] \grace fad16 mi8 re mi} mi16 fad sol fad mi re dod si
    la4-. dod mi sol

    %69
    fad16 re dod si la sol fad mi re4 r\mbreak
    R1
    sol'

    %72
    fad4 r r2
    sol1
    fad4 r r2

    %75
    R1*4

    %79
    fad4. sol16 fad mi8 re mi fad
    sol si si4. sol8 mi re
    \grace mi16 re8 dod dod dod fad4. mi8

    %82
    mi(dod? re mi) re4 r\mbreak
    R1*3

    %86
    r2 r8 dod re mi
    fad4. sol16 fad mi8 re mi fad
    sol si si4. sol8 mi re

    %89
    re8 dod dod dod fad4. mi8
    mi(dod re mi) re4 r\mbreak
    R1*2

    %93
    fad8 re si sol fad4 mi
    fad16[re re' dod si la sol fad] sol[mi mi' re dod si la sol]
    la[fad fad' mi re dod si la] si[sol sol' fad mi re dod si]

    %96
    la4-. dod-. mi-. dod-.\mbreak
    la dod mi sol
    fad16 re dod re fad re sol mi la fad mi fad la fad si sol

    %99
    do! si la si la sol fad sol fad mi re mi re do! si do
    si8 sol'4 fad8 sol (fad sol) fad
    sol sol4 fad8 sol \parentSlur (fad sol) fad

    %102
    sol-. sol(la si) la(sol fad mi)\mbreak
    re4 r fad r
    fad fad fad fad

    %105
    fad r re8 fad re fad
    dod1\tr
    re4 r r2
    R1*2

    %110
    r2 sol
    fad4 r sol2
    fad4 r fad8 r r4\mbreak

    %113
    fad4 r r2
    R1
    r8 sol sol2 fad8 mi

    %116
    re4 re2 dod4
    re r r2
    R1*6

    %124
    r2 r8 la re fad\mbreak
    si, dod16 re mi re dod si la8 la' \grace sol16 fad8 \grace mi16 re8
    dod16 si re dod mi re dod si la8 re mi fad

    %127
    \grace sol16 fad8 mi mi4. fad8 sol la
    lad si si4. la8 sol fad
    mi16 red mi fad sol fad sol la si la sol fad sol fad mi re?

    %130
    dod4 r r2\mbreak
    fad8 re16 dod re mi fad sol la8 si16 la sol fad mi re
    dod4 r r2

    %133
    fad8 re16 dod re mi fad sol la8 si16 la sol fad mi re
    dod4 re8 re dod4 re8 re
    dod?4 r r2\mbreak

    %136
    R1*5
    re1\f
    mib\mbreak
    re

    %144
    sib'?8 la do! la sol fa! fa fa
    re1~\p
    re

    %147
    dod4 r r2
    R1*3

    %151
    fa2 \grace la16 sol8 fa sol la
    fa4 la8 fa mi4 r
    fa?2 \grace fa16 sol8 fa sol la

    %154
    fa4 la8 fa mi4 r
    mi2 fa?4 r\mbreak
    sib4. sold8 la2

    %157
    r8 fa?(mi re) sol(fa mi re)
    mi(sol mi re) do(mi sol mi)
    fa2(re4 sib)

    %160
    la(fa'2 mi4)
    fa r r2
    R1*3

    %165
    fa2 \grace la16 sol8 fa sol la
    fa4 la8 fa mi4 r
    fa?2 \grace fa16 sol8 fa sol la

    %168
    fa2~fa8 fa fa fa\mbreak
    fa?4 fa2 mi4
    fa? r r2

    %171
    R1*7
    sol2. sib4
    sol2. sib4\mbreak
    la8 fad[sol la] sib si do! dod

    %181
    re la fad! do'! sib re sib sol
    re la' fad! do'!  sib re sib sol
    re'4 re,16 dod re dod re4 r

    %184
    R1*4
    \grace re,8 re'2 \grace fad,8 fad'2
    \grace la,8 la'2 la16 si do si la sol fad mi
    re4 re(mi fad)

    %191
    sol2 r8 si(la si)
    sol4 r r8 \grace la16 si8 la si\mbreak
    sol4 r r8 sol si re

    %194
    re dod do4. si8 la sol
    fad(mi) re-. re-. \senza \tuplet3/2{fad8 re re la'[fad fad]}
    sol si,16 do re do si la sol4 r

    %197
    sol16 la si do re do si la sol4 r
    sol16 la si do re do si la sol4 r\mbreak
    mi'4 r r2

    %200
    re4 r fad r\mbreak
    sol r do16 si la sol fad mi re do
    si4 r do'16 si la sol fad mi re do
    si[sol la si do re mi fad] sol8 sol sol sol
    sol16[si, do re mi fad sol la] si8 si si si\mbreak

    %205
    r8 dod,[(\<re mi fad sol la si)]\!
    do-. do16(si) la8-.[la16(sol)] fad8-. fad16(mi) re8[re]
    do'16 re do si la si la sol fad sol fad mi re8 re

    %208
    re2 red
    mi r
    si8 re sol re do re fad re

    %211
    si4 r r2\mbreak
    R1*3

    %215
    si'4. do16 si la8 sol la si
    si do do4. si8 la sol
    sol fad fad fad si4. la8

    %218
    la fad sol la sol4 r\mbreak
    R1*3

    %222
    r2 r8 fad sol la
    si4. do16 si la8 sol la si
    si do do4. si8 la sol

    %225
    \grace la16 sol8 fad fad fad si4. la8
    la fad sol la sol4 r
    R1*2

    %229
    si,8 sol mi la si4 la
    sol-. si-. re-. r
    fad-. do-. la-. fad-.

    %232
    sol-. si-. re-. r
    fad-. do-. la-. fad-.
    si16[sol sol' fad mi re do si] do[la la' sol fad mi re do]\mbreak

    %235
    re si si' la sol fad mi re mi do do' si la sol fad mi
    \grace re8 re'1~
    re

    %238
    r16 si, la sol la si do re mi fad sol la si8 si
    do,8 r do16 re mi mi do re mi re \grace fad16 mi8 re16 do
    si8 re sol, si \grace si8 la4 sol8 fad\mbreak

    %241
    sol4 r8 sol la4 r8 la
    si4 r8 si do4 r8 do
    si16 re sol re si' sol re' do do si la sol fad mi re do

    %244
    si16 re sol re si' sol re' do do si la sol fad mi re do
    si si[la sol] la si do re mi fad sol la si8 si
    do4. si8 do si do si\mbreak

    %247
    do do4 si8 do si do si
    do4 r r dod,
    re2~re8 mi fad sol

    %250
    fad1\tr
    sol4 r r2
    R1*5

    %257
    sol4~\fermata sol16 fad sol la fad2
    sol4 r r2
    R1*8

    %267
    r8 r16 sol si sol re si sol' re si sol re'' si sol re
    si8 re,-.[sol-. si-.] re sol si re
    si4 re, si sol8. sol16

    %270
    sol4 r r2\fermata

}

IvlIn = \relative do'' {

    <sol' si, re,>2~sol8 \grace la16 sol16 fad sol8[la]
    \grace {sol16[la]} si2~si8 \grace do16 si16 la si8[do]
    \grace {si16[do]} re2 do8 si la sol

    %4
    fad16 la sol si la do si re do4 r
    <<re,,\\re>> r r2\mbreak
    <fad' la, re,>2~fad8 \grace la16 fad16 mi fad8[sol]

    %7
    \grace{fad16[sol]} la2~la8 \grace si16 la16 sol la8[si]
    do16 si do si do si do si do si la sol fad mi re do
    si4 r r2

    %10
    sol4\p r r2
    r8 \grace do16\sf si16[la si8 (do] re\p mi fa) si,
    do1~

    %13
    do8 [\grace sol'16 fad16\sf mi fad8 sol] la\p si do fad,
    sol16\f re re re sol re re re la' re, re re la' re, re re
    si' sol sol sol si sol sol sol do la la la do la la la
    re8 re16(do) do8-. [si16(la)] sol8 si re si

    %17
    la8(la4 la la la8)
    la8(mi'4) la,8 la(mi'4) la,8\mbreak
    la re,16[re] mi mi re re dod dod dod dod dod dod dod dod

    %20
    la8 do'!16[do] re re do do si si re re si si fad fad
    sol sol si si sol sol red red mi mi fad fad sol sol sold sold
    la la sol! sol fad fad mi mi fad8-. fad16 sol mi8-.[mi16 fad]

    %23
    re!4 \stemUp <re' re, re,> <re re, re,> r\stemNeutral \mbreak
    si2\p \grace re16 do8(si do la)
    re4 re8(si) la4 re,

    %26
    si'2 \grace re16 do8(si do la)
    re4 re8(si) la4 re,
    re'16\f si sol re do' la fad re si' sol re si la' fad do la

    %29
    re'16 si sol re do' la fad re si' sol re si la' fad do la
    re'16 si sol re do' la fad re si' sol re si la' fad do la\mbreak
    si' do la si sol la fad sol mi fad re mi do re si do

    %32
    mi8[sol] \grace fad16 mi8 re16 do si8[re] \grace re16 do8 si16 la
    sol4 r mi2\p
    (re do)

    %35
    si(mi)
    re(do)\mbreak
    si4 r8 re' fad4\p (sol8\sf) re

    %38
    fad4\p (sol8\sf) re mi[mi] \grace sol16 fad8 mi16 fad
    sol4 r r2
    R1

    %41
    r8 sol16\f[sol] fad fad sol sol re re re re si16 si do do
    re re sol sol fad fad sol sol re re re re si16 si do do\mbreak
    re8 [r16 sol] si sol re si sol' re si sol re' si sol re

    %44
    si8 re-.[sol-. si-.] re-. sol-. si-. re-.
    si4 \stemUp <si si, re,> <sol si, re,> <si si, re,>
    <sol si, re,>\stemNeutral  <sol, sol,>8. <sol sol,>16 <sol sol,>4 r

    %47
    R1
    r8 re8-.\p (re-. re-.) re-. \parentSlur (re-. re-. re-.)
    fad8-. re-. sol-. re-. la'-. re,-. si'-. re,-.

    %50
    do' la fad la do(si la sol)\mbreak
    fad4 r r2
    r8 la-.(la-. la-.) la-.(la-. la-. la-.)

    %53
    fad-! r re4(mi fad)
    sol8 sol-.[(sol-. sol-.)] sol4 r
    r8 sol-.[(sol-. sol-.)] sol4-! r

    %56
    r8 sol-.[(sol-. sol-.)] sol4-! r
    r8 dod do-.(do-.) do(si la sol)\mbreak
    fad4 r la r

    %59
    si8 sol-.[(sol-. sol-.)] sol4-! r
    r8 sol-.[(sol-. sol-.)] sol4-! r
    r8 sol-.[(sol-. sol-.)] sol4-! r

    %62
    r8 dod do do do(si la sol)
    fad4 r la r
    si r fad' r\mbreak

    %65
    sol r fad r
    sol r si, si8 sol
    mi4 r sol sol8 fad

    %68
    mi4 mi-. sol-. dod-.
    re r r16 re'\f dod si la sol fad mi\mbreak
    re la la la fad' re re re la' fad fad fad la fad la re

    %71
    dod8 dod4(dod dod) dod8
    re,16 la la la fad' re re re la' fad fad fad la fad la re
    dod8 dod4(dod dod) dod8

    %74
    re16 re, re re fad re re re re' re, re re fad re re re
    re' re, re re fad re re re mi sol si la sol fad mi re\mbreak
    la'8 la16[si] dod si dod la re8 re,16 mi fad8[sold]

    %77
    la8 la16 si dod si dod la re8 re,16 mi fad8[sold]
    la4<<{la,8. la16 la4}\\{la8. la16 la4}>> r
    r8 re,\p re re re re re re

    %80
    re8 re' re, re' re, re re re
    re re re re re re re re
    re re re re re8-. r re4\mbreak

    %83
    re8 sol\sf sol2\p fad4
    mi8 si'\sf(si2\p) la4
    la4. sol16 fad sol8(la si sol)

    %86
    fad2(mi4\staccatissimo) r
    r8 re-. (re-. re-.) re re re re
    re8 re' re, re' re, re re re

    %89
    re re re re re re re re
    re re re re re8 r re4\mbreak
    re8 sol\sf sol2\p fad4

    %92
    mi8 si'\sf si2\p la4
    la8 r sol r fad r mi r
    fad4 r8 fad-. sol4-. r8 sol-.

    %95
    la4 r8 la si4 r8 si
    la r dod r mi r dod r\mbreak
    la r dod r mi r sol, r

    %98
    fad4 fad8-. sol-. la4-. la8-. si-.
    do! do,[do do] do do do do
    si4 r r2

    %101
    si'4 r r2
    r8 si(dod re) dod(si la sol)\mbreak
    fad4 r <<re'\\fad,>> r

    %104
    <fad' la, re,> r \once\stemUp <la la, re,> r
    r8 la fad fad fad fad fad fad
    mi16\f \repeat unfold 15 {mi}

    %107
    re8\ff re16 fad la8[la] fad fad16 la re8[re]
    re dod dod4~\mbreak dod8 si16 dod re8[si]
    si la la4. sol16[la] si8 sol

    %110
    fad[si16 la] la8[la] la la4 la8
    fad[si16 la] la8[la] la la4 la8
    la16 la[si dod] re dod re dod re la si dod re dod re dod\mbreak

    %113
    re dod si la sol fad mi re re dod si la sol fad mi re
    do! \repeat unfold 15 {do}
    si8 si'' si2 la8 sol

    %116
    fad dod'16 re \grace dod16 si8[la16 sol] fad4 \grace fad16 mi8 re16 mi
    re8 la'16[si] sol la fad sol mi fad re mi dod re si dod
    la8 fad'16[sol] mi fad re mi\mbreak dod re si dod la si sol la  %%<---

    %119
    fad8-! la-.[si-. dod-. re-.\p mi-. fad-. sol-.]
    fad,8-. re-. fad-. re-. fad-. re-. fad-. re-.
    fad-. re-. fad-. re-. fad-. re-. fad-. re-.

    %122
    si8 mi si mi si mi si mi
    la, mi' la, mi' la, mi' la, mi'
    dod mi dod mi re4 r\mbreak

    %125
    si'8 r si r la4 r
    si8 r si r la4 r
    r8 mi mi mi mi4 r

    %128
    r8 si' si si si4 r
    mi,8 r sol r si r mi, r
    mi1(\mbreak

    %131
    fad)
    (sol)
    (fad)

    %134
    mi4-. fad-. mi-. fad-.
    mi r la'8.\f sib32\sf la sol8\p[fad!]\mbreak
    sol mi mi fa sol8.\sf[la32\p sol fa8 mi]

    %137
    fa re re mi fa8.\sf[sol32\p fa] mi8 re
    dod la mi' dod re sib la sold
    la4 r la8.\sf sib32\p la sol8[fad!]

    %140
    sol mi mi fa sol8.\sf la32\p sol fa8[mi]
    <<re4\f\\re>> r sib''8\ff do!16 re do8[sib]
    sib?(la do! la) sol fa-. (fa-. fa-.)\mbreak

    %143
    fa?16 sol fa mib re8 r sib' do16 re do8[sib]
    sib? la do! la sol fa? fa fa
    fa? re'\p(re,4) r8 re'(re,4)

    %146
    r8 re' re,4 r8 re'8 re re
    dod mi,16\ff[mi] dod dod sol' sol fa fa la la fa fa re re
    la la mi' mi dod dod sol' sol fa fa la la fa fa re re\mbreak

    %149
    la4 r8 fa\p(mi-.)[mi-.] r fa
    (mi4-.) mi-. mi-. r
    fa8 do! fa do sol' do, mi do

    %152
    fa do fa do mi do mi do
    fa do fa do sol' do, mi do
    fa? do fa do mi do mi do

    %155
    r do mi do r fa la fa\mbreak
    r8 sib(re sold,) r fa? la fa
    si!1

    %158
    (sib)
    la2 (sol)
    r4 la-. sol-. sol-.

    %161
    la8 do!\f fa16 la sol fa mi fa re mi do re sib do
    la8 do fa16 la sol fa mi fa re mi do re sib do\mbreak
    la8 \grace do16 sib16 la32 sib do8[\grace mi16 re16 do32 re] mi8 \grace sol16 fa16 mi32 fa sol8[\grace si16 la16 sol32 la]

    %164
    sib8\p(sol-. mi-. do-.) sib-.(sol-. mi-. do-.)
    fa?-. do!-. fa-. do-. mi-. do-. mi-. do-.
    fa? do fa do mi do mi do

    %167
    fa? do fa do sol' do, mi do
    la'4 r re r\mbreak
    r la sol sol

    %170
    fa? r r8 la'8-.(la-. la-.)
    la8.\sf(sib16) la4 r8 la-.\p(la-. la-.)
    la8.\sf sib16 la4 r8 la\p la re

    %173
    dod8.\sf(mi16) sol,4 r8 sol-.\p(sol-. sol-.)
    fa8. la16 re,4 r8 la'-. la-. la-.
    re,\sf(re') re4~\mbreak re8 la re do!

    %176
    sib16\sf do! sib la sol4 r8 sol sol sol
    fad!8.\sf la16 re,4 r8 do'!-. do-. do-.
    \grace re16 do8\sf sib sib4 r8 sol-. sol-. sol-.

    %179
    \grace {sol16[la]} sib8.\sf la16 sol4~sol8 sib16 la \grace do16 sib8[la16 sol]\mbreak
    fad!8 fad16\ff[fad] sol sol la la sib sib si si do! do dod dod
    re re la la fad! fad do'! do sib sib re re sib sib sol sol

    %182
    re re la' la fad! fad do' do sib sib re re sib sib sol sol
    \grace dod8 re4 re,16 dod re dod re4 r
    R1

    %185
    r8 re,\p re re re re re re\mbreak
    fad8 re sol re la' re, si' re,
    do' la fad la do si la sol
    fad4 r r2

    %189
    r8 la-.(la-. la-.) la-. la-. la-. la-.
    fad8 r re4(mi fad)
    sol8 sol-.[(sol-. sol-.)] sol4-! r

    %192
    r8 sol-.[(sol-. sol-.)] sol4-! r\mbreak
    r8 sol[sol sol] sol4 r
    r8 dod do do do(si la sol)

    %195
    fad4 r la r
    si8 sol[sol sol] sol4 r
    r8 sol[sol sol] sol4 r

    %198
    r8 sol[sol sol] sol4 r\mbreak
    r8 dod do do do si la sol
    fad4 r la r

    %201
    si r fad' r
    sol r fad r
    sol r r8 si,,-. re-. sol-.

    %204
    si4-. r r8 re,-. sol-. si-.\mbreak
    re4 r r2
    fad8 r do r la r fad r

    %207
    do'2(la)
    r8 re-.(re-. re-.) r red-.(red-. red-.)
    r mi-.(mi-. mi-.) re!(do si la)

    %210
    r8 sol\staccatissimo sol(si) \grace si16 la8 sol la si
    sol4 \grace la'16\f sol8 fad16 mi re8 re re re\mbreak
    si'4 \grace do16 si8 la16 sol fad8-. fad-. fad-. fad-.
    re'4 \grace mi16 re8 do16 si la la sol sol fad fad mi mi
    re re dod dod re re mi mi re re do do si si la la

    %215
    sol8\p sol sol sol sol sol sol sol
    sol,8 sol' sol, sol' \repeat unfold 2 {sol,8 sol'}
    \repeat unfold 2 {sol,8 sol'} \repeat unfold 2 {sol,8 sol'}

    %218
    \repeat unfold 2 {sol,8 sol'} sol,8 r sol'4\mbreak
    sol8 do\sf do2\p si4
    la8 mi'\sf mi2\p re4

    %221
    re4. do16 si do8 re mi do
    \afterGrace si2({do16[si)]} la4\staccatissimo r
    \repeat unfold 14 {sol,8 sol'} sol,8 r sol'4

    %227
    sol8 do\sf do2\p si4\mbreak
    la8 mi'\sf mi2\p re4
    re8 r do r si r la r

    %230
    sol4 r4 si8 r si r
    do4 r4 do8 r do r
    si4 r4 si8 r si r

    %233
    do4 r do8 r do r
    si4 r8 si do4 r8 do\mbreak
    re4 r8 re mi4 r8 mi
    re r sol r fad r do r

    %237
    si r sol' r fad r do r
    si4 r r re4
    (mi8-.) r mi r mi r mi r

    %240
    si re si re \grace re8 do4 si8 la\mbreak
    si4 r8 si do4 r8 do
    re4 r8 re mi4 r8 mi

    %243
    re r sol r fad r do r
    si r sol' r fad r do r
    si4 r r8 si re re

    %246
    mi4 r r2\mbreak
    mi4 r r2
    mi4 r r dod,

    %249
    re16\f si''\p[si si] \repeat unfold 12 {sib}
    la\f \repeat unfold 15 {la}
    sol16 re mi re la' re, mi re si' re, mi re do' la sol fad

    %252
    sol16 re mi re la' re, mi re si' re, mi re do' la sol fad
    sol fad sol la \grace la8 sol8 red mi16 red mi fad sol8 dod,\mbreak
    re16 dod re mi fad8 si, do16 si do re mi8 lad,

    %255
    si16 lad si do re8 sold, la?16 sold la si do8 fad,
    sol!8 sol'4(si sol) sol8
    sol2 r\fermata

    %258
    re'16 si sol re do' la <\parenthesize fad> re si' sol re si la' fad do la
    re' si sol re do' la fad re\mbreak si' sol re si la' fad do la
    re' si sol re do' la fad re si' sol re si la' fad do la

    %261
    si' do la si sol la fad sol mi fad re mi do re si do
    mi8 sol \grace fad16 mi8[re16 do] si8 re \grace re16 do8[si16 la]
    sol4 r r2

    %264
    r8 \grace do16\p si16[la si8 do] re mi fa si,
    do1~\mbreak
    do8[\grace sol'16 fad16 mi fad8 sol] la si do fad,

    %267
    sol[r16 sol]\f si sol re si sol' re si sol re' si sol re
    si8 re-.[sol-. si-.] re sol si re
    si4 \stemUp <si si, re,> <sol si, re,> <sol, sol,>8. <sol sol,>16

    %270
    <sol sol,>4 r r2\fermata

}

IvlIIn = \relative do'' {

    <si re,>8 si,16[do] re do si la sol8 re'' si re
    sol si,,16[do] re do si la \once\stemUp sol8 re'' sol la
    si16 re, re re \repeat unfold 12 {re}

    %4
    \repeat unfold 8 {re} fad,8 si la sol
    fad4 r r2\mbreak
    re'8 fad,16[sol] la sol fad mi re8 \grace mi'16 re dod re8[mi]

    %7
    fad fad,16[sol] la sol fad mi re8[\grace sol'16 fad16 mi fad8 sol]
    la16 sold la sold la sold la sold la sol fad mi re do si la
    sol4 r r2

    %10
    si,8[\grace la'16\sf sol16 fad] sol8[si] re\p(si fad sol)
    fa1
    mi8[\grace re'16 do16(si)] do8\sf[re] mi\p(do la sol)\mbreak

    %13
    fad!4 do2 do'4
    si16\f si si si si si si si re re re re re re re re
    re re re re re re re re re re re re re re re re

    %16
    re16 sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol\mbreak

    %19
    fad8 r r4 r8 sol16 sol la la sol sol
    fad fad fad fad fad fad fad fad sol sol re re si si fad fad
    sol sol si si sol sol red red mi mi fad fad sol sol sold sold
    la la sol! sol fad fad mi mi fad8-. fad16 sol mi8-.[mi16 fad]

    %23
    re!4  <fad' la, re,> <fad la, re,> r \mbreak
    sol,8\p re sol re la' re, fad re

    %25
    si' re, sol re \repeat unfold 2{fad8 re}
    \repeat unfold 2{sol re} la' re, fad re
    si' re, sol re \repeat unfold 2{fad re}

    %28
    re'16\f\repeat unfold 11 {re} do la fad la
    sol re' re re re re re re re re re re do la fad la
    sol re' re re re re re re re re re re do la fad la\mbreak

    %31
    si8-. la-. sol-. fad-. mi-. re-. do-. si-.
    sol'16 sol sol sol sol sol sol sol sol8[si] \grace si16 la8 sol16 fad
    sol4 r do,2\p

    %34
    (si do)
    sol(do)
    si(la)\mbreak
    sol4 r r8 do'(si4)

    %38
    r8 do(si sol) do-. la-. re-. re,-.
    si' re-. si-. sol-. re4 r
    R1

    %41
    r8 sol16\f[sol] fad fad sol sol re re re re si16 si do do
    re re sol sol fad fad sol sol re re re re si16 si do do\mbreak
    \once\stemUp re8[r16 sol'] si sol re si sol' re si sol re' si sol re

    %44
    si8 si[re sol] si re sol si
    sol4 \stemUp <si si, re,> <sol si, re,> <si si, re,>
    <sol si, re,> \stemNeutral <re, si>8. <re si>16 <re si>4 r

    %47
    R1
    r8 si8-.\p(si-. si-.) si-. si-. si-. si-.
    re8 r re r re r re r

    %50
    r do-.(do-. do-.) do' (si la sol)\mbreak
    fad4 r r2
    r8 fad-.(fad-. fad-.) fad-. (fad-. fad-. fad-.)

    %53
    re8\puntopz r re4(dod do)
    si8 si-.[(si-. si-.)] si4 r
    r8 si-.[(si-. si-.)] si4-! r

    %56
    r8 re-.(re-. re-.) re4-! r
    r8 sol mi-. mi-. la (si la sol)\mbreak
    fad4 r fad r

    %59
    sol8 si,-.[(si-. si-.)] si4\staccatissimo r
    r8 si-. (si-. si-.) si4\staccatissimo r
    r8 re-. (re-. re-.) re4-! r

    %62
    r8 sol mi mi la (si la sol)
    fad4 r fad r
    re r do' r\mbreak

    %65
    si r do r
    si r sol sol8 mi
    dod4 r mi mi8 re

    %68
    dod4 dod-. mi-. sol-.
    fad-. r r16 re'\f dod si la sol fad mi\mbreak
    re8 <<{la'4 la la la8}\\{fad4 fad fad fad8}>>

    %71
    sol16 mi mi mi dod' sol sol sol mi' dod dod dod sol' mi la sol
    fad8 <<{la,4 la la la8}\\{fad4 fad fad fad8}>>
    sol16 mi mi mi dod' sol sol sol mi' dod dod dod sol' mi la sol

    %74
    fad fad, fad fad re' fad, fad fad fad' fad, fad fad re' fad, fad fad
    fad' fad, fad fad re' fad, fad fad si si si si si si si si\mbreak
    dod16 la la la la la la la la8 re,16 mi fad8[sold]

    %77
    la16 la la la la la la la la8 re,16 mi fad8[sold]
    la4 <<{la,8. la16 la4}\\{la8. la16 la4}>> r
    r8 re\p re re re re re re

    %80
    re8 re' re, re' re, re re re
    re re re re re re re re
    re re re re re8-. r re4\mbreak

    %83
    re8 si sol2(la4)
    sol8 sol'(sol2) fad4
    fad4. mi16 re mi8(fad sol mi)

    %86
    re2(dod4-!) r
    r8 re-.(re-. re-.) re re re re
    re8 re' re, re' re, re re re

    %89
    re re re re re re re re
    re re re re re8 r re4\mbreak
    re8 si\sf si2\p la4

    %92
    sol8 sol'\sf sol2\p fad4
    fad8 r mi r re r dod r
    re4 r8 re-. mi4-. r8 mi-.

    %95
    fad4 r8 fad sol4 r8 sol
    <\parenthesize fad> r la r dod r mi, r\mbreak
    dod r la' r dod r mi, r

    %98
    re4 re8-. mi-. fad4-. fad8-. sol-.
    la8 la,[la la] la la la la
    sol4 r r2

    %101
    re'4 r r2
    r8 sol(la si la sol fad mi)\mbreak
    re4 r <<la'\\ fad>> r

    %104
    <<re'\\fad,>> r <<fad'\\la,>> r
    r8 fad' re re re re re re
    dod16\f \repeat unfold 15 {dod}

    %107
    re16\ff <<{la[la la] la la la la la la la la }\\{fad16[fad fad] fad fad fad fad fad fad fad fad}>> la16 fad la re
    re8 dod dod4~\mbreak dod8 si16 dod re8[si]
    si la la4. sol16[la si8 sol]

    %110
    fad-. sol-. la-. fad' sol16 fad mi re dod si la sol
    fad8-. sol-. la-. fad' sol16 fad mi re dod si la sol
    fad la[si dod] re dod re dod re la si dod re dod re dod\mbreak

    %113
    re dod si la sol fad mi re re' dod si la sol fad mi re
    \repeat unfold 16 {la16}
    sol8 sol'' sol2 fad8 mi

    %116
    re16 re re re re re re re re re re re dod dod dod dod
    re4 r r2
    r8 fad16 sol mi fad re mi\mbreak dod re si dod la si sol la

    %119
    fad4 r r2
    fad8-. re-. fad-. re-. fad-. re-. fad-. re-.
    fad-. re-. fad-. re-. fad-. re-. fad-. re-.

    %122
    si8 mi si mi si mi si mi
    la, mi' la, mi' la, mi' la, mi'
    dod mi dod mi re4 r\mbreak

    %125
    re8 r re r re4 r
    re8 r re r re4 r
    r8 si si si si4 r

    %128
    r8 sol' sol sol sol4 r
    si,8 r mi r sol r re r
    dod1(\mbreak

    %131
    re)
    (mi)
    (re)

    %134
    dod4-. re-. dod-. re-.
    dod?4 r fa'8.\f sol32\sf fa mi8\p[red]\mbreak
    mi dod dod re mi8.\sf [fa32\p mi  re8 dod]

    %137
    re fa, fa sol la8.\sf sib32 la sol8[fa]
    mi4(sol fa re)
    dod4 r fa8.\sf sol32\p fa mi8[red]

    %140
    mi dod dod re mi8.\sf fa32\p mi re8 [dod]
    re16\f fa? re fa  re\ff fa re fa re fa re fa re fa re fa
    mib16 fa? mib fa \repeat unfold 3 {mib fa mib fa}\mbreak

    %143
    re16 fa? re fa \repeat unfold 3 {re16 fa re fa}
    mib16 fa?  mib fa\repeat unfold 3 {mib16 fa mib fa}\mbreak
    re16 fa? re\p fa \repeat unfold 3 {re16 fa re fa}
    re16 fa? re fa re fa re fa re16 fa re fa re16 fa re fa

    %147
    mi8 mi16\ff[mi] dod dod sol' sol fa fa  la la fa fa re re
    la la mi' mi dod dod sol' sol fa fa  la la fa fa re re\mbreak
    la4 r8 re\p(dod) [dod-.] r re(

    %150
    dod4) dod-. dod-. r
    fa8 do! fa do sol' do, mi do
    fa do fa do mi do mi do
    fa do fa do sol' do, mi do
    fa? do fa do mi do mi do

    %155
    r do mi do r fa la fa\mbreak
    r8 sib(re sold,) r fa? la fa
    r8 fa?(mi re) sol(fa mi re)

    %158
    mi sol mi re do(mi sol mi)
    fa2 re
    r4 fa-. fa-. mi-.

    %161
    fa8 do'!\f fa16 la sol fa mi fa re mi do re sib do
    la8 do fa16 la sol fa mi fa re mi do re sib do\mbreak
    la8 \grace do16 sib16 la32 sib do8[\grace mi16 re16 do32 re] mi8 \grace sol16 fa16 mi32 fa sol8[\grace si16 la16 sol32 la]

    %164
    sib8\p(sol-. mi-. do-.) sib-.(sol-. mi-. do-.)
    la-. do!-. fa-. do-. mi-. do-. mi-. do-.
    fa? do fa do sol' do, mi do

    %167
    fa? do fa do sol' do, mi do
    fa4 r fa r\mbreak
    r fa2(mi4)

    %170
    fa16\f fa do\p do la la do do fa fa do do la la do do
    dod\f dod mi mi la,\p la mi' mi dod dod sol' sol mi mi dod dod
    la\f la fa' fa re\p re la' la fa fa la la fa fa re re

    %173
    mi\f mi sol sol dod,\p dod mi mi la, la sol' sol mi mi dod dod
    re\f re la' la fa\p fa la la re, re la' la fa fa re re
    fad! \f fad la la re,\p re do'! do\mbreak la la do do la la fad fad

    %176
    sol\f sol re' re sib\p sib re re sol, sol sib sib sol sol re re
    la' la do do fad, fad la la re, re do' do la la fad fad
    sol sol re' re sib sib re re sol, sol sib sib sol sol fa fa

    %179
    mib mib sol sol mib mib sol sol mib mib re re do do dod dod
    re8\noBeam  fad!16\ff[fad] sol sol la la sib sib si si do! do dod dod
    re re la la fad! fad do'! do sib sib re re sib sib sol sol

    %182
    re re la' la fad! fad do' do sib sib re re sib sib sol sol
    \grace dod8 re4 re,16 dod re dod re4 r
    R1

    %185
    r8 si!\p si si si si si si\mbreak
    re8 r re r re r re r
    r do-.(do-. do-.) do'si la sol

    %188
    fad4 r r2
    r8 fad-.(fad-. fad-.) fad-. fad-. fad-. fad-.
    re8 r re4(dod do)

    %191
    si8 si-.[(si-. si-.)] si4-! r
    r8 si-.[(si-. si-.)] si4-. r\mbreak
    r8 re re re re4 r

    %194
    r8 sol mi mi la si la sol
    fad4 r fad r
    sol8 si,[si si] si4 r


    %197
    r8 si si si si4 r
    r8 re re re re4 r\mbreak
    r8 sol mi mi la si la sol

    %200
    fad4 r fad r
    si r do r
    si r do r

    %203
    si r r8 sol,-. si-. re-.
    sol4-. r r8 sol,-. re'-. sol-.\mbreak
    si4 r r2

    %206
    do8 r la r fad r re r
    la'2(fad)
    r8 sol-.(sol-. sol-.) r8 sol-.(sol-. sol-.)

    %209
    r8 sol-.(sol-. sol-.) fad(mi re do)
    r8 si\staccatissimo si(re) \grace re16 do8 si do re
    si4\grace la'16\f sol8 fad16 mi re8 re re re\mbreak

    %212
    si'4 \grace do16 si8 la16 sol fad8-. fad-. fad-. fad-.
    re'4 \grace mi16 re8 do16 si la la sol sol fad fad mi mi
    re re dod dod re re mi mi re re do do si si la la

    %215
    sol8\p sol sol sol sol sol sol sol
    sol8 sol' sol, sol' sol,8 sol' sol, sol'
    \repeat unfold 2 {sol,8 sol'} \repeat unfold 2 {sol,8 sol'}

    %218
    sol, sol' sol, sol' sol, r si4\mbreak
    si8 mi\sf mi2\p re4
    do8 do'\sf do2\p si4

    %221
    si4. la16 sol la8 si do la
    \afterGrace sol2({la16[sol)]} fad4\staccatissimo r
    \repeat unfold 14 {sol,8 sol'} sol,8 r si4

    %227
    si8 mi\sf mi2\p re4\mbreak
    do8 do'\sf do2\p si4
    do8 r la r sol r fad r

    %230
    sol4 r re8 r re r
    fad4 r fad8 r fad r
    sol4 r re8 r re r

    %233
    fad4 r fad8 r fad r
    sol4 r8 sol la4 r8 la\mbreak
    si4 r8 si do4 r8 do

    %236
    si re, re re re re re re
    re re re re re re re re
    re4 r r si'

    %239
    (do8) r sol r sol r do r
    sol si sol si \grace si8 la4 sol8 fad\mbreak
    sol4 r8 sol la4 r8 la

    %242
    si4 r8 si do4 r8 do
    si re, re re re re re re
    re re re re re re re re

    %245
    re4 r r8 sol si si
    sol4 r r2\mbreak
    sol4 r r2

    %348
    sol4 r r dod,
    re16 sol'[sol sol] sol sol sol sol sol sol sol sol sol sol sol sol
    <fad la,>\f \repeat unfold 15 {<fad la,>}

    %251
    sol16 re,[re re] \repeat unfold 12 { re}
    \repeat unfold 16 {re}
    re4 r8 red'(mi4) r8 dod(\mbreak

    %254
    re4-.) r8 si(do!4-.) r8 lad(
    si4-.) r8 sold(la4) r8 fad
    sol! si4(sol' si,) si8

    %257
    si2 r\fermata
    \repeat unfold 12 {re16} do16 la fad la
    sol re' re re re re re re re re re re do16 la fad la

    %260
    sol16 re' re re re re re re re re re re do la fad la
    si8 la sol fad mi re do si
    sol'16 sol sol sol sol sol sol sol sol8 [si] \grace si16 la8 sol16 fad

    %263
    sol8\p \grace la16 sol16 fad sol8([si] re si fad) sol
    fa1
    mi8[\grace re'16 do16 si] do8 re mi do la <\parenthesize sol>\mbreak

    %266
    fad4 do2 do'4
    si8 [r16 sol'\f] si sol re si sol' re si sol re' si sol re
    si8 si[re sol] si re sol si

    %269
    sol4 \stemUp <si si, re,> <sol si, re,> <re, si>8. <re si>16
    <re si>4 r r2\fermata

}

Ivlan = \relative do' {

    sol8 sol' sol, sol' \repeat unfold 2 {sol,8 sol'}
    \repeat unfold 2 {sol,8 sol'} \repeat unfold 2 {sol,8 sol'}
    \repeat unfold 2 {sol,8 sol'} \repeat unfold 2 {sol,8 sol'}

    %4
    la8 la la la la8 sol fad mi
    re4 r r2\mbreak
    re8 re' re, re' re, re re re

    %7
    re8 re' re, re' re, re re re
    re re re re re re re re
    sol4 r r2

    %10
    si,1\p ^\markup\italic"leg."
    (re)
    (do)(\mbreak

    %13
    la)
    si8\f re sol si la fad la fad
    sol8 si re si la la la la

    %16
    si si si si si si si si
    do,8 re mi re do re mi re
    dod re mi re dod re mi dod\mbreak

    %19
    re re re re re re re re
    re re re re re re' si fad
    sol si sol red mi fad sol sold

    %23
    la sol! fad mi fad fad16 sol mi8[mi16 fad] re4 re' re, r\mbreak
    si'2\p \grace re16 do8(si do la)
    re4 re8(si) la4 re,

    %26
    si'2 \grace re16 do8(si do la)
    re4 re8(si) la4 re,
    si'8\f re, la' re, sol re fad re

    %29
    si' re, la' re, sol re fad re
    si' re, la' re, sol re fad re\mbreak
    sol fad mi re do si la sol

    %32
    do do do do re re re re
    sol sol sol sol sol\p sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol\mbreak

    %37
    sol4 r r8 la(sol4)
    r8 la(sol4) do8-. la-. re-. re,-.
    si' re-. si-. sol-. re4 r

    %40
    R1
    r8 sol-.\f fad-. sol-. re re(si) do
    re sol-.[fad-. sol-.] re re(si) do\mbreak
    re sol[sol sol] sol sol sol sol

    %44
    sol,8 sol' sol, sol' \repeat unfold 2{sol,8 sol'}
    sol,4 sol' sol,4 sol'
    sol, sol sol r

    %47
    R1
    r8 sol'\p sol sol sol sol sol sol
    do8 r si r fad r sol r

    %50
    la la la la la8 sol fad mi\mbreak
    re4 r r2
    r8 re re re re re re re

    %53
    re re re re re re re re
    sol,8 sol'[sol sol] sol4 r
    r8 mi mi mi mi4 r

    %56
    r8 si si si si4 r
    r8 mi la sol (fad) sol fad mi\mbreak
    re4 r re r

    %59
    sol8 sol[sol sol] sol4 r
    r8 mi mi mi mi4 r
    r8 si si si si4 r

    %62
    r8 mi la sol (fad) sol fad mi
    re4 r re r
    sol r re r\mbreak

    %65
    sol r re r
    sol r sol sol8 sol
    sol4 r sol sol8 sold

    %68
    la4 la la la,
    re r r16 re'\f [dod si la sol fad mi]\mbreak
    re8 re re re re re re re

    %71
    re re re re re re re re
    re re re re re re re re
    re re re re re re re re

    %74
    re'8 re dod dod si si la la
    sol sol fad fad sol sol si sold\mbreak
    la, la'[la sol?] fad re16 mi fad8[sold]

    %77
    la, la'[la sol!] fad re16 mi fad8[sold]
    la4 la, la r
    R1*4\mbreak

    %83
    re8\sf re re re re\p re re re
    re8\sf re re re re\p re re re
    re re re re re re re re

    %86
    re8 (fad sol sold) la4 r
    R1*4\mbreak

    %91
    re,8 re' re, re' \repeat unfold 2{re,8 re'}
    \repeat unfold 2{re,8 re'}\repeat unfold 2{re,8 re'}
    re,8 r sol r la r la, r

    %94
    re4 r8 re re4 r8 re
    re4 r8 re re4 r8 re
    dod4-! r r la'\mbreak

    %97
    la, r r la
    re4 re8 re re4 re8 re
    re1\tenuto

    %100
    sol4 r r2
    sol4 r r2
    sol1\tenuto

    %103
    la4 r la r
    la r la r
    r8 la la la la la la la

    %106
    la,8\f \repeat unfold 7 {la}
    re16 fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol\mbreak fad fad fad fad fad fad fad fad
    \repeat unfold 16 {mi}

    %110
    fad8 mi re fad dod mi sol mi
    fad8 mi re fad dod mi sol mi
    re sol fad mi re sol fad mi\mbreak

    %113
    \repeat unfold8 {re8}
    re8 fad la sol fad mi red red
    mi sol mi re! dod dod dod dod

    %116
    re8 re sol sol la la la, la
    re4 r r2
    r8 re'-. dod-. si-.\mbreak la sol fad mi

    %119
    re4 r r2
    R1*5\mbreak

    %125
    sol8 r sol r fad4 r
    sol8 r sol r fad4 r
    r8 sol sol sol sol4 r

    %128
    r8 sol sol sol sol4 r
    sol8 r sol r sol r sold r
    la,1(\mbreak

    %131
    la)
    (la)
    (la)

    %134
    la4 la' la, la'
    la,8 la' la la la la la la\mbreak
    la la la la la la la la

    %137
    la la la la la la la la
    la la la la sib sib sib sib
    la la la la la la la la

    %140
    la la la la la la la la
    sib8 fa\ff [sib fa] sib fa sib fa
    do' fa, mib' do la fa la fa\mbreak

    %143
    \repeat unfold 2 {sib8 fa} \repeat unfold 2 {sib8 fa}
    do'8 fa,? mib' do la fa la fa
    sib4 r8 sib\p(la4) r8 la(

    %146
    sol4) r8 sol(sold4) r8 sold(
    la-.) mi\ff[dod sol'] fa la fa re
    la mi'[dod sol'] fa la fa re\mbreak

    %149
    la4 r8 sold'\p(la)[la-.] r sold(
    la4-.) la,-. la-. r
    fa'\p r r2

    %152
    fa?4 r do! r
    fa r r2
    fa?4 r do! r

    %155
    R1*2
    sol'1\p\tenuto

    %158
    (do,!)
    re2(sib)
    r4 re-. sib-. do-.

    %161
    fa,8 fa'\f la sib do! sib la sol
    fa,? fa'[la sib] do! sib la sol\mbreak
    fa?-. sol-. la-. sib-. do,!-. re-. mi-. fa-.

    %164
    sol2\p(do,!)
    fa4 r r2
    fa?4 r do! r

    %167
    fa r r2
    fa?4 r sib, r\mbreak
    r re-. sib-. do-.

    %170
    fa8\f do! la\p do fa do la do
    dod\f mi la,\p mi' dod sol' mi dod
    la\f fa' re\p la' fa la fa re

    %173
    mi\f sol dod,\p mi la, mi' dod la
    re\f la' fa\p la re, la' fa re
    fad!\f la re,\p do'!\mbreak la do la fad!

    %176
    sol\f re' sib\p re sol, sib sol re
    la'\f do! fad,!\p la re, la' fad re
    sol\f re' sib\p re sol, sib sol  fa

    %179
    mib\f sol mib\p sol mib re do! dod\mbreak
    re8 fad!\<[sol la] sib si do! dod\!
    re\ff la fad! do'! sib re sib sol

    %182
    re la' fad! do'! sib re sib sol
    re'4 re,8 re re4 r
    R1

    %185
    r8 sol\p sol sol sol sol sol sol\mbreak
    do8 r si r fad r sol r
    la la la la la8 sol fad mi

    %188
    re4 r r2
    r8 re-.(re-. re-.) \repeat unfold 4 {re8-.}
    re re re re re re re re

    %191
    sol,8 sol'[sol sol] sol4 r
    r8 mi mi mi mi4 r\mbreak
    r8 si si si si4 r

    %194
    r8 mi la sol fad sol fad mi
    re4 r re r
    sol8 sol[sol sol] sol4 r

    %197
    r8 mi mi mi mi4 r
    r8 si si si si4 r\mbreak
    r8 mi la sol fad sol fad mi

    %200
    re4 r re r
    sol r re r
    sol r re r

    %203
    sol r r8 sol-. re-. si-.
    sol4-. r r8 sol'-. re-. si-.\mbreak
    sol4 r r2

    %206
    re'8 r re r re r re r
    re2(do)
    r8 si-.(si-. si-.) r8 si-.(si-. si-.)

    %209
    r do do do do do do do
    re re re re re re re re
    sol4 \grace la16 sol8\f fad16 mi re8-. re-. re-. re-.\mbreak

    %212
    si'4 \grace do16 si8 la16 sol fad8-. fad-. fad-. fad-.
    re'4 \grace mi16 re8 do16 si la8 sol fad mi
    re dod re mi re do si la

    %215
    sol4 r r2
    R1*3

    %219
    sol8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}

    %222
    sol,8 (si do dod) re4 r
    R1*4

    %227
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8 r do r re r re r

    %230
    <re si>1\p\tenuto
    (<re do>)
    (<re si>)

    %233
    (<re do>)
    <<re4\\si>>  r8 sol' sol4 r8 sol\mbreak
    sol4 r8 sol sol4 r8 sol

    %236
    sol r si r la r re, r
    sol r si r la r re, r
    sol4 r r sol(

    %239
    \parenthesize la8) r do,4-. do-. do
    re8 re re re re re re re\mbreak
    sol4 r8 sol sol4 r8 sol

    %242
    sol4 r8 sol sol4 r8 sol
    sol4 si8 r la r re, r
    sol r si r la r re, r

    %245
    sol4 r r8 sol sol sol
    do,4 r r2\mbreak
    do4 r r2

    %248
    do4 r r dod
    re8\f re\p[re re] re8 re re re
    re8 \f re re re re re re re

    %251
    sol8 si fad re sol re la' re,
    si' sol fad re sol re la' re,
    si'4 r8 red,(mi4-.) r8 dod(\mbreak

    %254
    re4) r8 si(do!4-.) r8 lad(
    si4-.) r8 sold(la4-.) r8 fad(
    sol!4-.) si do dod

    %257
    re1\fermata
    si'8 re, la' re, sol re fad re
    si' re, la' re,\mbreak  sol re fad re

    %260
    si' re, la' re, sol re fad re
    sol fad mi re do si la sol
    do do do do re re re re

    %263
    si1\p
    re
    do\mbreak

    %266
    la
    sol8 sol'\f[sol sol] sol sol sol sol
    sol sol sol sol sol sol sol sol

    %269
    sol4 sol sol sol,
    sol r r2\fermata

}


Ifgn = \relative do {

    sol8 sol' sol, sol' \repeat unfold 2 {sol,8 sol'}
    \repeat unfold 2 {sol,8 sol'} \repeat unfold 2 {sol,8 sol'}
    \repeat unfold 2 {sol,8 sol'} \repeat unfold 2 {sol,8 sol'}

    %4
    la8 la la la la8 sol fad mi
    re4 r r2\mbreak
    re8 re[fad la] re,4 re'

    %7
    re,8 re[fad la] re,4 re'
    re,2~re8 re' re,[re']
    sol,4 r r2

    %10
    sol1\p \tenuto ~
    sol~
    sol~\mbreak

    %13
    sol
    sol8\f re' si sol fad la fad re
    sol si re si la8 la la la

    %16
    si8 si si si si si si si
    do,8 re mi re do re mi re
    dod re mi re dod re mi dod\mbreak

    %19
    re8 re re re re re re re
    re8 re re re  re8 re' si fad
    sol si sol red mi fad sol sold

    %22
    la sol! fad mi fad fad16 sol mi8[mi16 fad]
    re4 re' re, r\mbreak
    R1*4

    %28
    si'8\f re, la' re, sol re fad re
    si' re, la' re, sol re fad re
    si' re, la' re, sol re fad re\mbreak

    %31
    sol fad mi re do si la sol
    do do do do re re re re
    sol,4 r r2

    %34
    R1
    sol'\p\tenuto~
    sol\mbreak

    %37
    sol4 r r2
    R1*3

    %41
    r8 sol-.\f fad-. sol-. re re(si) do
    re sol-.[fad-. sol-.] re re(si) do\mbreak
    re sol[sol sol] sol8 sol sol sol

    %44
    sol,8 sol' sol, sol' \repeat unfold 2{sol,8 sol'}
    sol,4 sol' sol,4 sol'
    sol, sol sol r

    %47
    R1
    r8 sol'\p sol sol sol8 sol sol sol
    do8 r si r fad r sol r

    %50
    la8 la la la la8 sol fad mi\mbreak
    re4 r r2
    r8 re re re re8 re re re

    %53
    re8 re re re re re re re
    sol,8 sol'[sol sol] sol4 r
    r8 mi mi mi mi4 r

    %56
    r8 si si si si4 r
    r8 mi la sol (fad) sol fad mi\mbreak
    re4 r re r

    %59
    sol8 sol[sol sol] sol4 r
    r8 mi mi mi mi4 r
    r8 si si si si4 r

    %62
    r8 mi la sol (fad) sol fad mi
    re4 r re r
    sol r re r\mbreak

    %65
    sol r re r
    sol r sol sol8 sol
    sol4 r sol sol8 sold

    %68
    la4 la la la,
    re r r16 re'\f [dod si la sol fad mi]\mbreak
    re8 re re re re re re re

    %71
    re re re re re re re re
    re re re re re re re re
    re re re re re re re re

    %74
    re'8 re dod dod si si la la
    sol sol fad fad sol sol si sold\mbreak
    la, la'[la sol?] fad re16 mi fad8[sold]

    %77
    la, la'[la sol!] fad re16 mi fad8[sold]
    la4 la, la r
    R1*4\mbreak

    %83


    re8\sf re re re re\p re re re
    re8\sf re re re re\p re re re
    re re re re re re re re

    %86
    re8 (fad sol sold) la4 r
    R1*4\mbreak

    %91
    re,8 re' re, re' \repeat unfold 2{re,8 re'}
    \repeat unfold 2{re,8 re'}\repeat unfold 2{re,8 re'}
    re,8 r sol r la r la, r

    %94
    re4 r8 re re4 r8 re
    re4 r8 re re4 r8 re
    dod4-! r r la'\mbreak

    %97
    la, r r la
    re4 re8 re re4 re8 re
    re1\tenuto

    %100
    sol4 r r2
    sol4 r r2
    sol1\tenuto

    %103
    la4 r la r
    la r la r
    r8 la la la la la la la

    %106
    la,8\f \repeat unfold 7 {la}
    re\ff re re re re re re re
    mi8 sol mi sol\mbreak \repeat unfold 2{re8 fad}
    \repeat unfold 2{dod mi} la,8 si dod la

    %110
    re mi fad re mi dod la dod
    re mi fad re mi dod la dod
    re sol fad mi re sol fad mi\mbreak

    %113
    \repeat unfold8 {re8}
    re8 fad la sol fad mi red red
    mi sol mi re! dod dod dod dod

    %116
    re8 re sol sol la la la, la
    re4 r r2
    r8 re'-. dod-. si-.\mbreak la sol fad mi

    %119
    re4 r r2
    R1*5\mbreak

    %125
    sol8 r sol r fad4 r
    sol8 r sol r fad4 r
    r8 sol sol sol sol4 r

    %128
    r8 sol sol sol sol4 r
    sol8 r sol r sol r sold r
    la,1(\mbreak

    %131
    la)
    (la)
    (la)

    %134
    la4 la' la, la'
    la,1~\mbreak
    la~

    %137
    la
    la4 la' sib sib,?
    la1~

    %140
    la
    sib'8 fa\ff [sib fa] sib fa sib fa
    do' fa, mib' do la fa la fa\mbreak

    %143
    \repeat unfold 2 {sib8 fa} \repeat unfold 2 {sib8 fa}
    do'8 fa,? mib' do la fa la fa
    sib4 r8 sib\p(la4) r8 la(

    %146
    sol4) r8 sol(sold4) r8 sold(
    la-.) mi\ff[dod sol'] fa la fa re
    la mi'[dod sol'] fa la fa re\mbreak

    %149
    la4 r8 sold'\p(la)[la-.] r sold(
    la4-.) la,-. la-. r
    fa'\p r r2

    %152
    fa?4 r do! r
    fa r r2
    fa?4 r do! r

    %155
    R1*2
    sol'1\p\tenuto

    %158
    (do,!)
    re2(sib)
    r4 re-. sib-. do-.

    %161
    fa,8 fa'\f la sib do! sib la sol
    fa,? fa'[la sib] do! sib la sol\mbreak
    fa?-. sol-. la-. sib-. do,!-. re-. mi-. fa-.

    %164
    sol2\p(do,!)
    fa4 r r2
    fa?4 r do! r

    %167
    fa r r2
    fa?4 r sib, r\mbreak
    r re-. sib-. do-.

    %170
    fa4 r r2
    la1\tenuto ~
    la~

    %173
    la~
    la
    <<{la1
       sib
       do}\\{fad,?  sol la}>>

    %178
    r8 <<{sib sib sib sib4}\\{sol8 sol sol sol4}>> r
    r8 <<{sib? sib sib sib4}\\{sol8 sol sol sol4}>> r\mbreak
    <<la8\\fad!>> fad!\<[sol la] sib si do! dod\!
    re\ff la fad! do'! sib re sib sol

    %182
    re la' fad! do'! sib re sib sol
    re'4 re,8 re re4 r
    R1

    %185
    r8 sol\p sol sol sol sol sol sol\mbreak
    do8 r si r fad r sol r
    la la la la la8 sol fad mi

    %188
    re4 r r2
    r8 re-.(re-. re-.) \repeat unfold 4 {re8-.}
    re re re re re re re re

    %191
    sol,8 sol'[sol sol] sol4 r
    r8 mi mi mi mi4 r\mbreak
    r8 si si si si4 r

    %194
    r8 mi la sol fad sol fad mi
    re4 r re r
    sol8 sol[sol sol] sol4 r

    %197
    r8 mi mi mi mi4 r
    r8 si si si si4 r\mbreak
    r8 mi la sol fad sol fad mi

    %200
    re4 r re r
    sol r re r
    sol r re r

    %203
    sol r r8 sol-. re-. si-.
    sol4-. r r8 sol'-. re-. si-.\mbreak
    sol4 r r2

    %206
    re'8 r re r re r re r
    re2(do)
    r8 si-.(si-. si-.) r8 si-.(si-. si-.)

    %209
    r do do do do do do do
    re re re re re re re re
    sol4 \grace la16 sol8\f fad16 mi re8-. re-. re-. re-.\mbreak

    %212
    si'4 \grace do16 si8 la16 sol fad8-. fad-. fad-. fad-.
    re'4 \grace mi16 re8 do16 si la8 sol fad mi
    re dod re mi re do si la

    %215
    sol4 r r2
    R1*3

    %219
    sol8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}

    %222
    sol,8 (si do dod) re4 r
    R1*4

    %227
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8 r do r re r re r

    %230
    sol,4 r sol'8 r sol r
    re4 r re8 r re r
    sol4 r sol8 r sol r

    %233
    re4 r re8 r re r
    sol4 r8 sol sol4 r8 sol\mbreak
    sol4 r8 sol sol4 r8 sol

    %236
    sol r si r la r re, r
    sol r si r la r re, r
    sol4 r r si,(

    %239
    do4-.) do-. do-. do
    re8 re re re re re re re\mbreak
    sol4 r8 sol sol4 r8 sol

    %242
    sol4 r8 sol sol4 r8 sol
    sol4 si8 r la r re, r
    sol r si r la r re, r

    %245
    sol4 r r8 sol sol sol
    do,4 r r2\mbreak
    do4 r r2

    %248
    do4 r r dod
    re8\f re\p[re re] re8 re re re
    re8\f re re re re re re re

    %251
    sol8 si fad re sol re la' re,
    si' sol fad re sol re la' re,
    si'4 r8 red,(mi4-.) r8 dod(\mbreak

    %254
    re4) r8 si(do!4-.) r8 lad(
    si4-.) r8 sold(la4-.) r8 fad(
    sol!4-.) si do dod

    %257
    re1\fermata
    si'8 re, la' re, sol re fad re
    si' re, la' re,\mbreak  sol re fad re

    %260
    si' re, la' re, sol re fad re
    sol fad mi re do si la sol
    do8 do do do re re re re

    %263
    sol,1~\p
    sol~
    sol~\mbreak

    %266
    sol
    sol8 sol'\f[sol sol] sol sol sol sol
    sol sol sol sol sol sol sol sol

    %269
    sol4 sol sol sol,
    sol r r2\fermata

}

Ibsn = \relative do {

    sol8 sol' sol, sol' \repeat unfold 2 {sol,8 sol'}
    \repeat unfold 2 {sol,8 sol'} \repeat unfold 2 {sol,8 sol'}
    \repeat unfold 2 {sol,8 sol'} \repeat unfold 2 {sol,8 sol'}

    %4
    la8 la la la la8 sol fad mi
    re4 r r2\mbreak
    re8 re' re, re' re, re re re

    %7
    re8 re' re, re' re, re re re
    re8 re re re re re re re
    sol4 r r2

    %10
    sol1\p \tenuto ~
    sol~
    sol~\mbreak

    %13
    sol
    sol8\f re' si sol fad la fad re
    sol si re si la8 la la la

    %16
    si8 si si si si si si si
    do,8 re mi re do re mi re
    dod re mi re dod re mi dod\mbreak

    %19
    re8 re re re re re re re
    re8 re re re  re8 re' si fad
    sol si sol red mi fad sol sold

    %22
    la sol! fad mi fad fad16 sol mi8[mi16 fad]
    re4 re' re, r\mbreak
    R1*4

    %28
    si'8\f re, la' re, sol re fad re
    si' re, la' re, sol re fad re
    si' re, la' re, sol re fad re\mbreak

    %31
    sol fad mi re do si la sol
    do8 do do do re re re re
    sol,4 r r2

    %34
    R1
    sol'\p\tenuto~
    sol\mbreak

    %37
    sol4 r r2
    R1*3

    %41
    r8 sol-.\f fad-. sol-. re re(si) do
    re sol-.[fad-. sol-.] re re(si) do\mbreak
    re sol[sol sol] sol8 sol sol sol

    %44
    sol,8 sol' sol, sol' \repeat unfold 2{sol,8 sol'}
    sol,4 sol' sol,4 sol'
    sol, sol sol r

    %47
    R1
    r8 sol'\p sol sol sol8 sol sol sol
    do8 r si r fad r sol r

    %50
    la8 la la la la8 sol fad mi\mbreak
    re4 r r2
    r8 re re re re8 re re re

    %53
    re8 re re re re re re re
    sol,8 sol'[sol sol] sol4 r
    r8 mi mi mi mi4 r

    %56
    r8 si si si si4 r
    r8 mi la sol (fad) sol fad mi\mbreak
    re4 r re r

    %59
    sol8 sol[sol sol] sol4 r
    r8 mi mi mi mi4 r
    r8 si si si si4 r

    %62
    r8 mi la sol (fad) sol fad mi
    re4 r re r
    sol r re r\mbreak

    %65
    sol r re r
    sol r sol sol8 sol
    sol4 r sol sol8 sold

    %68
    la4 la la la,
    re r r16 re'\f [dod si la sol fad mi]\mbreak
    re8 re re re re re re re

    %71
    re re re re re re re re
    re re re re re re re re
    re re re re re re re re

    %74
    re'8 re dod dod si si la la
    sol sol fad fad sol sol si sold\mbreak
    la, la'[la sol?] fad re16 mi fad8[sold!]

    %77
    la, la'[la sol!] fad re16 mi fad8[sold]
    la4 la, la r
    R1*4\mbreak

    %83

    re8\sf re re re re\p re re re
    re8\sf re re re re\p re re re
    re re re re re re re re

    %86
    re8 (fad sol sold) la4 r
    R1*4\mbreak

    %91
    re,8 re' re, re' \repeat unfold 2{re,8 re'}
    \repeat unfold 2{re,8 re'}\repeat unfold 2{re,8 re'}
    re,8 r sol r la r la, r

    %94
    re4 r8 re re4 r8 re
    re4 r8 re re4 r8 re
    dod4-! r r la'\mbreak

    %97
    la, r r la
    re4 re8 re re4 re8 re
    re1\tenuto

    %100
    sol4 r r2
    sol4 r r2
    sol1\tenuto

    %103
    la4 r la r
    la r la r
    r8 la la la la la la la

    %106
    la,8\f \repeat unfold 7 {la}
    re\ff re re re re re re re
    mi8 sol mi sol\mbreak \repeat unfold 2{re8 fad}
    \repeat unfold 2{dod mi} la,8 si dod la

    %110
    re mi fad re mi dod la dod
    re mi fad re mi dod la dod
    re sol fad mi re sol fad mi\mbreak

    %113
    \repeat unfold8 {re8}
    re8 fad la sol fad mi red red
    mi sol mi re! dod dod dod dod

    %116
    re8 re sol sol la la la, la
    re4 r r2
    r8 re'-. dod-. si-.\mbreak la sol fad mi

    %119
    re4 r r2
    R1*5\mbreak

    %125
    sol8 r sol r fad4 r
    sol8 r sol r fad4 r
    r8 sol sol sol sol4 r

    %128
    r8 sol sol sol sol4 r
    sol8 r sol r sol r sold r
    la,1(\mbreak

    %131
    la)
    (la)
    (la)

    %134
    la4 la' la, la'
    la,1~\mbreak
    la~

    %137
    la
    la4 la' sib sib,?
    la1~

    %140
    la
    sib'8 fa\ff [sib fa] sib fa sib fa
    do' fa, mib' do la fa la fa\mbreak

    %143
    \repeat unfold 2 {sib8 fa} \repeat unfold 2 {sib8 fa}
    do'8 fa,? mib' do la fa la fa
    sib4 r8 sib\p(la4) r8 la(

    %146
    sol4) r8 sol(sold4) r8 sold(
    la-.) mi\ff[dod sol'] fa la fa re
    la mi'[dod sol'] fa la fa re\mbreak

    %149
    la4 r8 sold'\p(la)[la-.] r sold(
    la4-.) la,-. la-. r
    fa'\p r r2

    %152
    fa?4 r do! r
    fa r r2
    fa?4 r do! r

    %155
    R1*2
    sol'1\p\tenuto

    %158
    (do,!)
    re2(sib)
    r4 re-. sib-. do-.

    %161
    fa,8 fa'\f la sib do! sib la sol
    fa,? fa'[la sib] do! sib la sol\mbreak
    fa?-. sol-. la-. sib-. do,!-. re-. mi-. fa-.

    %164
    sol2\p(do,!)
    fa4 r r2
    fa?4 r do! r

    %167
    fa r r2
    fa?4 r sib, r\mbreak
    r re-. sib-. do-.

    %170
    fa8\f do! la\p do fa do la do
    dod\f mi la,\p mi' dod sol' mi dod
    la\f fa' re\p la' fa la fa re

    %173
    mi\f sol dod,\p mi la, mi' dod la
    re\f la' fa\p la re, la' fa re
    fad!\f la re,\p do'!\mbreak la do la fad!

    %176
    sol\f re' sib\p re sol, sib sol re
    la'\f do! fad,!\p la re, la' fad re
    sol\f re' sib\p re sol, sib sol  fa

    %179
    mib\f sol mib\p sol mib re do! dod\mbreak
    re8 fad!\<[sol la] sib si do! dod\!
    re\ff la fad! do'! sib re sib sol

    %182
    re la' fad! do'! sib re sib sol
    re'4 re,8 re re4 r
    R1

    %185
    r8 sol\p sol sol sol sol sol sol\mbreak
    do8 r si r fad r sol r
    la la la la la8 sol fad mi

    %188
    re4 r r2
    r8 re-.(re-. re-.) \repeat unfold 4 {re8-.}
    re re re re re re re re

    %191
    sol,8 sol'[sol sol] sol4 r
    r8 mi mi mi mi4 r\mbreak
    r8 si si si si4 r

    %194
    r8 mi la sol fad sol fad mi
    re4 r re r
    sol8 sol[sol sol] sol4 r

    %197
    r8 mi mi mi mi4 r
    r8 si si si si4 r\mbreak
    r8 mi la sol fad sol fad mi

    %200
    re4 r re r
    sol r re r
    sol r re r

    %203
    sol r r8 sol-. re-. si-.
    sol4-. r r8 sol'-. re-. si-.\mbreak
    sol4 r r2

    %206
    re'8 r re r re r re r
    re2(do)
    r8 si-.(si-. si-.) r8 si-.(si-. si-.)

    %209
    r do do do do do do do
    re re re re re re re re
    sol4 \grace la16 sol8\f fad16 mi re8-. re-. re-. re-.\mbreak

    %212
    si'4 \grace do16 si8 la16 sol fad8-. fad-. fad-. fad-.
    re'4 \grace mi16 re8 do16 si la8 sol fad mi
    re dod re mi re do si la

    %215
    sol4 r r2
    R1*3

    %219
    sol8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}

    %222
    sol,8 (si do dod) re4 r
    R1*4

    %227
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8\sf sol' sol,\p sol' \repeat unfold 2{sol,8 sol'}
    sol,8 r do r re r re r

    %230
    sol,4 r sol'8 r sol r
    re4 r re8 r re r
    sol4 r sol8 r sol r

    %233
    re4 r re8 r re r
    sol4 r8 sol sol4 r8 sol\mbreak
    sol4 r8 sol sol4 r8 sol

    %236
    sol r si r la r re, r
    sol r si r la r re, r
    sol4 r r si,(

    %239
    do4-.) do-. do-. do
    re8 re re re re re re re\mbreak
    sol4 r8 sol sol4 r8 sol

    %242
    sol4 r8 sol sol4 r8 sol
    sol4 si8 r la r re, r
    sol r si r la r re, r

    %245
    sol4 r r8 sol sol sol
    do,4 r r2\mbreak
    do4 r r2

    %248
    do4 r r dod
    re8\f re\p[re re] re8 re re re
    re8\f re re re re re re re

    %251
    sol8 si fad re sol re la' re,
    si' sol fad re sol re la' re,
    si'4 r8 red,(mi4-.) r8 dod(\mbreak

    %254
    re4) r8 si(do!4-.) r8 lad(
    si4-.) r8 sold(la4-.) r8 fad(
    sol!4-.) si do dod

    %257
    re1\fermata
    si'8 re, la' re, sol re fad re
    si' re, la' re,\mbreak  sol re fad re

    %260
    si' re, la' re, sol re fad re
    sol fad mi re do si la sol
    do8 do do do re re re re

    %263
    sol,1~\p
    sol~
    sol~\mbreak

    %266
    sol
    sol8 sol'\f[sol sol] sol sol sol sol
    sol sol sol sol sol sol sol sol

    %269
    sol4 sol sol sol,
    sol r r2\fermata

}

Ibfn = {

    \figuremode {

        \set Staff.useBassFigureExtenders = ##t
        \override Staff.BassFigureAlignmentPositioning.direction = #DOWN


    }

}

forma = {
    \time 4/4
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 2=60
    s1*270
    \bar "|."


}

IcrI = {
    \Iglobal
    \clef bass
    <<\IcrIn \forma >>

}

IcrII = {
    \Iglobal
    \clef bass
    <<\IcrIIn \forma >>

}

IclI = {
    \Iglobal
    <<\IclIn \forma >>

}

IclII = {
    \Iglobal
    <<\IclIIn \forma >>

}

IflI = {
    \Iglobal
    <<\IflIn \forma >>

}

IflII = {
    \Iglobal
    <<\IflIIn \forma >>

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma >>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma >>

}

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma >>

}

Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma >>


}

Ibs = {
    \Iglobal
    \clef bass
    <<\Ibsn \forma >>

}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto
}


IIcrIn =  %\transpose mi do
\relative do {
    \key do\major

    r16
    mib4 r r
    mib r r
    <<mib2.\\{s4\sf s2\p}>>

    %4
    mib8 r mib r r4
    R2.
    mib~

    %7
    mib
    sol8 r fa r r4\mbreak
    R2.*8

    %17
    mib,2.~\p
    mib~
    mib

    %20
    fa'4 r r
    fa4 r r\mbreak
    fa4 r r

    %23
    sib,8 r r4 r
    sib8 r r4 r
    sib8 r r4 r

    %26
    R2.
    sol'4 fa2\mbreak
    fa8 r r4 r

    %29
    sib,8 r r4 r
    sib8 r r4 r
    R2.

    %32
    fa'8 sol16 mib fa2\mbreak
    sib,2.~\p
    sib~

    %35
    sib~
    sib
    mib,~

    %38
    mib~\<
    mib\mbreak
    mib'4\! r r\fermata

    %41
    R2.
    fa8 r fa r r4\fermata
    R2.*16

    %59
    R2.\fermata

}


IIcrIIn = %\transpose mi do,
\relative do {
    \key do\major

    r16
    mib,4 r r
    mib r r
    <<mib2.\\{s4\sf s2\p}>>

    %4
    mib8 r mib r r4
    R2.
    mib'~

    %7
    mib
    mib8 r sib r r4\mbreak
    R2.*8

    %17
    mib,2.~\p
    mib~
    mib

    %20
    fa'4 r r
    fa4 r r\mbreak
    fa4 r r

    %23
    sib,8 r r4 r
    sib8 r r4 r
    sib8 r r4 r

    %26
    R2.
    mib4 fa2\mbreak
    sib,8 r r4 r

    %29
    sib8 r r4 r
    sib8 r r4 r
    R2.

    %32
    sib8 mib fa2\mbreak
    sib,2.~\p
    sib~

    %35
    sib~
    sib
    mib,~

    %38
    mib~\<
    mib\mbreak
    mib4\! r r\fermata

    %41
    R2.
    fa'8 r sib, r r4\fermata
    R2.*16

    %59
    R2.\fermata

}

IIclIn = %\transpose mib do
\relative do' {
    \key mib\major

    mib16
    mib4 r r
    mib r r
    sol r r

    %4
    \grace re16 do8-. r sib-. r r4
    R2.*3
    \grace fa'16 sol8. fa16 fa4 r\mbreak

    %9
    R2.*8

    %17
    r8 sol r sol r sol
    r lab r lab r lab
    r sol r sol r sol

    %20
    la4 r r
    sib r r\mbreak
    la r r

    %23
    r16 fa (sib\sf sol) fa(re mib sol) fa(re do mib)
    re fa[(sib\sf sol)] fa(re mib sol) fa(re do mib)
    re8 r r4 r

    %26
    R2.*2\mbreak
    r16 fa (sib sol) fa(re mib sol) fa(re do mib)

    %29
    re fa[(sib sol)] fa(re mib sol) fa(re do mib)
    re8 r r4 r
    R2.

    %32
    fa16(sib sol fa) re(fa re fa) \grace fa16 mib8( re16 do)\mbreak
    sib4 r r
    R2.*5
    r4 sib'4. sol8\mbreak
    lab4 r r\fermata
    R2.

    %42
    lab8. fa16 re4 r\fermata
    R2.*14

    %57
    r8 re\p r re r re
    r re r re r re
    re4 r r\fermata

}

IIclIIn =  %\transpose mib do
\relative do' {
    \key mib\major

    sol16
    sol4 r r
    sol r r
    mib' r r

    %4
    \grace sib8 lab-. r sol-. r r4
    R2.*3
    \grace fa'16 mib8. re16 re4 r\mbreak

    %8
    R2.*8

    %17
    r8 mib r mib r mib
    r do r do r do
    r sib r mib r mib

    %20
    mib4 r r
    re r r\mbreak
    mib r r

    %23
    r16 re (sol\sf mib) re(sib do mib) re(sib la do)
    sib re [(sol\sf mib)] re(sib do mib) re(sib la do)
    sib8 r r4 r

    %26
    R2.*2\mbreak
    r16 re (sol mib) re(sib do mib) re(sib la do)

    %29
    sib re [(sol mib)] re(sib do mib) re(sib la do)
    sib8 r r4 r
    R2.

    %32
    re16 fa mib do sib(re sib re) \grace re16 do8 sib16 la\mbreak
    sib4 r r
    R2.*5
    r4 sol'4. mib8\mbreak
    do4 r r\fermata
    R2.

    %52
    re8. fa16 lab4 r\fermata
    R2.*14

    %57
    r8 re,\p r re r re
    r re r re r re
    re4 r r\fermata

}

IIflIn = \relative do'' {

    r16
    R2.*7

    %8
    r4 r16 re(mib fa) sol lab(la sib)\mbreak
    sib4. mib8(sol, do)
    sib8.(lab16) lab8 r fa8.[\grace{sol16[mib fa]} sol16]

    %11
    lab4~lab16 re fa mib re do sib lab
    sol sol-.[lab-. sib-.] do-. re-. mib-. fa-. sol-. sib,(lab sol)
    \grace lab16 sol8. fa16 fa8 r r4

    %14
    R2.*3

    %17
    mib'16(sib) sib-. sib-. sib(sol) sol-. sol-. sol do32 sib lab[sol fa mib]
    lab8 r r4 r
    mib'16(sib) sib-. sib-. sib(sol) sol-. sol-. sol do32 sib lab[sol fa mib]

    %20
    la16 do-.[mib-. re-.] do-. sib-. la-. sol-. fa-. mib-. re-. do-.
    r16 re'-. fa-. mib-. re -. do-. sib-. la-. sol-. fa-. mib-. re-.\mbreak
    r16 do'-. mib-. re-. do-. sib-. la-. sol-. fa-. mib-. re-. do-.

    %23
    re8 r r4 r
    re'8 r r4 r
    re16-. re,-.[mib -. fa-.] sol-. la-. sib-. do-. re-. mib-. fa-. mib-.

    %26
    re-. do-. sib-. la-. sol-. fa-. mib-. re-. do-. re-. mib-. fa-.
    sol(la sib sol) sol(fa re fa) \grace fa16 mib8 re16 do\mbreak
    re8 r r4 r

    %29
    re'8 r r4 r
    re16 re,-.[mib-. fa-.] sol-. la-. sib-. do-. re sib32[la] sib[la sib la]
    sib16-. sol32[fad] sol fad sol fad sol16-. mib32[re] mib re mib re mib16 do[(re mib)]

    %32
    fa16 (sib sol mib) re(fa sib re)\grace re16 do8 sib16 la\mbreak
    sib8 r r4 r
    R2.*3

    %37
    sol16-. sol(fad sol) sol4\tr \grace lab16 sol fad32 sol \grace lab16 sol [fad32 sol]
    lab!16 lab[\parentSlur (sol lab)] lab4\tr \grace sib16 lab sol32 lab \grace sib16 lab [sol32 lab]
    sib16-. sib[ (la sib)] sib4\tr \grace do16 sib la32 sib \grace do16 sib [la32 sib]\mbreak

    %40
    do4.\fermata mib8 re do
    sib2.~
    sib8.\parenthesize \f re16 fa4 r\fermata

    %43
    R2.
    sib,4. mib8(sol, do)
    sib8. lab16 lab8 r fa8.[\grace{sol32 [fa <\parenthesize mib> fa]} sol16]

    %46
    lab4~lab16 re fa mib re do sib lab\mbreak
    sol8 r r4 r
    do8. sol16 do4~do16 mib32 re \grace fa16 mib [re32 do]
    re8.(si16) sol8 r r4

    %50
    R2.
    fad4. la8 do do
    sib4~sib16[sib32 (do) re16-. re-.] \grace mib16 re32[(do16.)] \grace re16 do32(sib16.)\mbreak

    %53
    la4~la16 do(la fad) re mib!(re do)
    sib8 r r4 r
    R2.

    %56
    r8 mib'(si do la sol)
    fad4~fad16 [la32 \parentSlur (sib) do16 do] sib (re) re (sib)
    la?4~la16 la32 (sib) do16-. do-. sib (re) re (sib)

    %59
    la8. fad16\fermata re4 r\fermata

}

IIflIIn = \relative do'' {

    r16
    R2.*11

    %12
    r16 mib-. fa-. sol-. lab-. sib-. do-. re-. mib-. sol,[(fa mib)]
    \grace fa16 mib8.(re16) re re[(mib fa)] sol(lab la sib)
    sib4. mib8(sol, do)

    %15
    sib8.(lab16) lab8 r fa8.[\grace{sol16[mib fa]} sol16]\mbreak
    lab4~lab16 re fa mib re do sib lab
    sol8 r r4 r

    %18
    mib'16(do) do-. do-. do(lab) lab-. lab-. lab32 sib do re mib re mib do
    sib8 sol4(mib) sol8
    mib16 la-.[do-. sib-.] la-. sol-. fa-. mib-. re-. do-. sib-. la-.

    %21
    r16 sib' re do sib-. la-. sol-. fa-. mib-. re-. do-. sib-.\mbreak
    r16 la'do sib la-. sol-. fa-. mib-. re-. do-. sib-. la-.
    sib8 r r4 r

    %24
    sib'8 r r4 r
    sib16 sib,-.[do-. re-.] mib-. fa-. sol-. la-. sib-. do-.  re-. do-.
    sib-. la-. sol-. fa-. mib-. re-. do-. sib-. la-. sib-. do-. re-.

    %27
    mib[(fa) sol16 mib] mib(re sib re) \grace re16 do8 sib16 la \mbreak
    sib8 r r4 r
    sib'8 r r4 r

    %30
    sib16 sib,-.[do-. re-.] mib-. fa-. sol-. la-. sib sol32[fad] sol fad sol fad
    sol16-. mib32[re] mib re mib re mib16 do32[si] do si do si do16 la[(sib do)]
    re8 mib16 do sib re re fa \grace fa16 mib8 re16 do\mbreak

    %33
    re8 r r4 r
    R2.*3

    %37
    mib16-. mib(re mib) mib4\tr \grace fa16 mib16 re32 mib \grace fa16 mib16 [re32 mib]
    fa16-. fa[(mi fa)] fa4\tr \grace sol16 fa16 mi?32 fa \grace sol16 fa16 [mi?32 fa]
    sol16-. sol[(fad sol)] sol4\tr \grace la?16 sol fad 32 sol \grace la?16 sol [fad32 sol]\mbreak

    %40
    lab4.\fermata do8 sib lab
    sol mib\<(re mib fa sol)\!
    lab8.\f fa16 lab4 r\fermata

    %43
    R2.*2
    r4 r16 sib,32[(do)] re16-. re32 (mib) fa16-.[fa32(sol)] lab16 fa

    %46
    re4-. r r\mbreak
    sol4~sol16 si(re do) si(lab! sol fa)
    mib4~mib8 sol(mib do)

    %49
    sol'4~sol16 fad (sol lab!) sol(fa mib re)
    mib8 r r4 r
    do4. fad8 la la

    %52
    sol4~sol16 [sol32(la?) sib16-. sib-.] \grace do16 sib32[(la16.-.)] \grace sib16 la32(sol16.-.)\mbreak
    fad4~fad16 la?(fad re) fad do(sib la)
    sol8 r r4 r

    %55
    R2.
    r8 sol'(fa! mib do sib)
    la4~la16[fad'32(sol) la?16-. la-.] sol(sib) sib (sol)

    %58
    fad4~fad16[fad32(sol) la16-. la-.] sol(sib) sib(sol)
    fad4 r r\fermata

}

IIvlIn = \relative do'' {

    <mib, sol,>16
    <mib sol,>4\f sol\p(fa)
    <mib sol,>\f sib'4\p(lab)
    sol\f mib'8\p(re do sib)

    %4
    \grace re16 do8-. r sib-. r r4
    R2.
    sol'8-.\p fa-. mib-. re-. do-. sib-.

    %7
    do'-. sib-. lab-. sol-. fa-. sol-.
    \grace lab16 sol8.[(fa16)] fa8-. r r4\mbreak
    \repeat unfold 3{sol,16 sib,-. sib-. sib-.}

    %10
    \repeat unfold 3{lab'16 sib, sib sib}
    \repeat unfold 3{lab'16 sib, sib sib}
    sol'8 r r4 r16 sib(lab sol)

    %13
    \grace lab16 sol8. fa16 fa8 r r4
    \repeat unfold 3{sol16 sib, sib sib}
    \repeat unfold 3{lab'16 sib, sib sib}\mbreak

    %16
    \repeat unfold 3{lab'16 sib, sib sib}
    sol'16 sib,-.[(sib-. sib-.)] mib sib-.[(sib-. sib-.)] mib sib-.[(sib-. sib-.)]
    \repeat unfold 3{mib16 do-.[(do-. do-.)]}

    %19
    \repeat unfold 2{mib16 sib-.[(sib-. sib-.)]} sib-. mib-. sol-. sib-.
    <mib, do>2.\fp

    %21
    <re sib>2.\fp\mbreak
    la'2.\fp
    sib8 sol-.[(fa-. sol-. re-. do-.)]

    %24
    re\f sol-.\p[(fa-. sol-. re-. do-.)]
    re\f r r4 r
    R2.

    %27
    sol'16(la\sf sib sol\f) sol(fa re fa) \grace fa16 mib8 re16 do\mbreak
    re8 sol,-.[fa-. sol-. re-. do-.]

    %29
    re\f sol-.\p[fa-. sol-. re-. do-.]
    re\f r r4 r

    %31
    r r r16 do'\sf(re mib)
    fa\f(sib sol mib) re(fa sib16 re) \grace re16 do8 sib16 la\mbreak
    sib8 r r4 r

    %34
    R2.
    r8 sib-.\p sib-. sib-. sib\sf(do)
    lab!-.\p lab-. lab-. lab-. lab\sf(sib)

    %37
    sol-. sol,-.[(sol-. sol-. sol-. sol-.)]
    lab lab-.\<[(lab-. lab-. lab-. lab-.)]\!
    \footnote #' (-1 . 2) \markup\column\smaller {" ""Qui e altrove, dopo il crescendo, indicato con  ”cres.” il manoscritto usa ”rinf.”"" "} sib8\f sib sib sib sib sib\mbreak

    %40
    do4 r r\fermata
    r8 mib\p\<[(re mib fa sol)]\!
    lab8.\f fa16 re4 r

    %43
    R2.
    sol,16\p sib,-. (sib-. sib-.) sol'16 sib,-. (sib-. sib-.) sol'16 sib,-. (sib-. sib-.)
    \repeat unfold 3{lab'16 sib,-.(sib-. sib-.)}

    %46
    \repeat unfold 3{lab'16 sib,-. (sib-. sib-.)}\mbreak
    sol'8 sol-.[(sol-. sol-. sol-. sol-.)]
    sol8 sol-.[(sol-. sol-. sol-. sol-.)]

    %49
    sol8 sol-.[(sol-. sol-. sol-. sol-.)]
    sol16[do,32(re) mib16\f fa] sol-. mib -. re-. si-. do(mib) sol-. sol-.
    fad8\f fad-.\p[(fad-. fad-. fad-. fad-.)]

    %52
    sol\f sol-.\p[(sol-. sol-. sol-. sol-.)]\mbreak
    la\f  do\p[la la la do,]
    sib re'[(la sib fad sol)]

    %55
    <mib! sol,>\f sib''\p[(fad sol re mib)]
    do4\f r r
    \repeat unfold 2{r16 la(fad re)}  r16 sib'(sol re)

    %58
    \repeat unfold 2{r16 la'(fad re)} r16 sib' sol re
    la'?4 r r\fermata

}

IIvlIIn = \relative do'' {

    <mib, sol,>16
    <mib sol,>4\f sib\p(lab)
    sol\f sol'\p(fa)
    <mib sol,>\f do'8\p(sib lab sol)

    %4
    \grace sib16 lab8 r sol-. r r4
    R2.
    mib'8-.\p re-. do-. sib-. lab-. sol-.

    %7
    lab'-. sol-. fa-. mib-. re-.  mib-.
    \grace fa16 mib8.[(re16)] re8-. r r4\mbreak
    \repeat unfold 3{mib,16 sib-. sib-. sib-.}

    %10
    \repeat unfold 3{fa'16 sib, sib sib}
    \repeat unfold 3{fa'16 sib, sib sib}
    sib8 r r4 r16 sol' fa mib

    %13
    \grace fa16 mib8.(re16) re8 r r4
    \repeat unfold 3{mib16 sib-. sib-. sib-.}
    \repeat unfold 3{fa'16 sib, sib sib}\mbreak

    %16
    \repeat unfold 3{fa'16 sib, sib sib}
    mib16 sol,-.[(sol-. sol-.)] sib sol-.[(sol-. sol-.)] sib sol-.[(sol-. sol-.)]
    \repeat unfold 3{do16 lab-.[( lab-. lab-.)]}

    %19
    sib sol-.[(sol-. sol-.)] sib sol-.[(sol-. sol-.)] sol16-. sib-. mib-. sol-.
    la,2.\fp
    sib\fp\mbreak
    <mib do>2.\fp
    <re sib>8 mib-.[re-. mib-. sib-. la-.]

    %24
    sib\f mib-.\p[re-. mib-. sib-. la-.]
    sib\f r r4 r
    R2.

    %27
    mib'16[(fa)\sf sol16 mib\f] mib(re sib re) \grace re16 do8 sib16 la \mbreak
    sib8 mib, [re mib sib la]
    sib\f mib-.\p[re-. mib-. sib-. la-.]

    %30
    sib\f r r4 r
    r r r16 la'\sf(sib do)
    re\f fa mib do sib re re fa \grace fa16 mib8 re16 do\mbreak

    %33
    re8 sib-.[sib-. sib-. sib\sf(do)]
    lab!-.\p lab-. lab-. lab-. lab\sf(sib)
    sol-.\p sol-. sol-. sol-. sol\sf(mi)

    %36
    fa-.\p fa-. fa-. fa-. fa\sf(re)
    mib mib-.[(mib-. mib-. mib-. mib-.)]
    fa fa\< fa fa fa fa\!

    %39
    sol\f sol sol sol sol sol\mbreak
    mib4 r r\fermata
    r8 sib'\p\< sib sib sib sib\!

    %42
    re\f r <lab sib,>4 r\fermata
    R2.
    mib16\p sib sib sib \repeat unfold 2 {mib16 sib sib sib}

    %45
    \repeat unfold 3 {fa'16 sib, sib sib}
    \repeat unfold 3 {fa'16 sib, sib sib}\mbreak
    re8 re-.[(re-. re-. re-. re-.)]

    %48
    mib mib-.[(mib-. mib-. mib-. mib-.)]
    re re-.[(re-. re-. fa-. fa-.)]
    mib16[do32(re) mib16\f fa] sol-. mib -. re-. si-. do(mib) sol-. sol-.

    %51
    do,8\f do\p[do do do do]
    sib\f sib\p[sib sib sib sib]\mbreak
    fad'\f la\p[fad fad fad la,?]

    %54
    sol r r4 r
    <mib'! sol,>\f r r
    do r r
    \repeat unfold 2{r16 la'(fad re)}  r16 sib'(sol re)

    %58
    \repeat unfold 2{r16 la'(fad re)} r16 sib' sol re
    fad4 r r\fermata



}

IIvlan = \relative do' {

    r16
    R2.*15
    sib8 r sib r re r

    %17
    <<sib2.\tenuto\\sol\p>>
    <<do\\lab>>
    <<sib\\sol>>

    %20
    fa'2.^\arco\fp
    fa\fp\mbreak
    fa\fp

    %23
    <<sib,2.\\{s4\sf s2\p}>>
    <<sib2.\\{s4\sf s2\p}>>
    sib4\f r r

    %26
    sib2.\p\tenuto
    mib8\f mib fa[fa] fa, fa\mbreak
    sib4 r r

    %29
    sib\f r r
    sib2(sib8-!) r
    sol'-! r mib-! r do16-! mib\sf[(re do)]

    %32
    sib8\f mib fa[fa] fa, fa\mbreak
    sib8\p\noBeam sib sib sib sib\sf  sib
    sib\p sib sib sib sib8\sf [sib]

    %35
    sib\p sib sib sib sib8\sf [sib]
    sib\p sib sib sib sib8\sf [sib]
    mib8-. mib-. mib-. mib-. mib-. mib-.

    %38
    mib8-.\< mib-. mib-. mib-. mib-. mib-.\!
    mib8-.\f mib-. mib-. mib-. mib-. mib-.\mbreak
    lab,4 r r\fermata

    %41
    r8 sol'(lab sol re mib)
    fa\f r sib, r r4\fermata
    sib'8-.\p ^\solo lab-. sol-. fa-. mib-. re-.

    %44
    mib-.\pizz r mib-. r mib-. r
    re-. r re-. r re-. r
    sib-. r sib-. r sib-. r\mbreak

    %47
    si r si r si r
    do r do r do r
    si r si r si r

    %50
    do16\ff[do32(re mib16 fa)] sol-. mib-. re-. si-. do(mib) sol-. sol-.
    re2.\fp
    re\fp\mbreak

    %53
    re\fp
    re8 r r4 r
    mib!\f r r

    %56
    do\f r r
    re2.~\p\tenuto
    re

    %59
    re4 r r\fermata

}


IIfgn = \relative do {

    r16
    R2.*15
    sib8 r sib r re r

    %17
    mib8 r mib r mib r
    mib r mib r mib r
    mib r mib r mib r

    %20
    fa2.^\arco\fp
    fa\fp\mbreak
    fa\fp

    %23
    sib,4 sib'8 r sib r
    sib,4\f sib'8\p r sib r
    sib,4\f r r

    %26
    sib2.\p\tenuto
    mib8\f mib fa[fa] fa, fa\mbreak
    sib4 sib'8 r sib r

    %29
    sib,4 sib'8 r sib r
    sib,2(sib8-!) r
    sol'-! r mib-! r do16-! mib\sf[(re do)]

    %32
    sib8\f mib fa[fa] fa, fa\mbreak
    sib'2 sol4\sf
    fa\p(mib! re\sf)

    %35
    mib\p(sol sib\sf)
    sib,\p(re sib\sf)
    mib8-. mib-. mib-. mib-. mib-. mib-.

    %38
    mib8-.\< mib-. mib-. mib-. mib-. mib-.\!
    mib8-.\f mib-. mib-. mib-. mib-. mib-.\mbreak
    lab,4 r r\fermata

    %41
    r8 sol'(lab sol re mib)
    fa\f r sib, r r4\fermata
    sib'8-.\p ^\solo lab-. sol-. fa-. mib-. re-.

    %44
    mib-.\pizz r mib-. r mib-. r
    re-. r re-. r re-. r
    sib-. r sib-. r sib-. r\mbreak

    %47
    si r si r si r
    do r do r do r
    si r si r si r

    %50
    do16\ff[do32(re mib16 fa)] sol-. mib-. re-. si-. do(mib) sol-. sol-.
    re4\f re\p re
    re\f re\p re\mbreak

    %53
    re\f re\p re
    sol r r
    mib!\f r r

    %56
    do\f r r
    re8\p r re r re r
    re r re r re r

    %59
    re4 r r\fermata

}

IIbsn = \relative do {

    r16
    mib4 r r
    mib r r
    mib2.\fp\tenuto
    mib8 r mib, r r4

    %5
    sib''8-.\soli lab-. sol-. fa-. mib-. re-.
    mib2.~
    mib

    %8
    sib'8-. r sib,-. r r4\mbreak
    mib8^\markup\italic"pizz[icato]" r mib r mib r
    re r re r re r

    %11
    sib r sib r sib r
    mib r r4 r16 sol^\arco(lab la)
    sib8-. r sib,-. r r4

    %14
    mib8-.\p^\pizz r mib-. r mib-. r
    re-. r re-. r re-. r\mbreak
    sib r sib r re r

    %17
    mib r mib r mib r
    mib r mib r mib r
    mib r mib r mib r

    %20
    fa2.^\arco\fp
    fa\fp\mbreak
    fa\fp

    %23
    sib,4 r r
    sib\f r r
    sib\f r r

    %26
    sib2.\p\tenuto
    mib8\f mib fa[fa] fa, fa\mbreak
    sib4 r r

    %29
    sib\f r r
    sib2(sib8-!) r
    sol'-! r mib-! r do16-! mib\sf[(re do)]

    %32
    sib8\f mib fa[fa] fa, fa\mbreak
    sib2.~\p
    sib~

    %35
    sib~
    sib
    mib8-. mib-. mib-. mib-. mib-. mib-.

    %38
    mib8-.\< mib-. mib-. mib-. mib-. mib-.\!
    mib8-.\f mib-. mib-. mib-. mib-. mib-.\mbreak
    lab,4 r r\fermata

    %41
    r8 sol'(lab sol re mib)
    fa\f r sib, r r4\fermata
    sib'8-.\p ^\solo lab-. sol-. fa-. mib-. re-.

    %44
    mib-.\pizz r mib-. r mib-. r
    re-. r re-. r re-. r
    sib-. r sib-. r sib-. r\mbreak

    %47
    si r si r si r
    do r do r do r
    si r si r si r

    %50
    do16\ff[do32(re mib16 fa)] sol-. mib-. re-. si-. do(mib) sol-. sol-.
    re4\f re\p re
    re4\f re\p re\mbreak

    %53
    re4\f re\p re
    sol r r
    mib!\f r r

    %56
    do\f r r
    re8\p r re r re r
    re r re r re r

    %59
    re4 r r_\markup\italic\large\right-align"Subito il Rondò"\fermata

}

IIbfn = \figuremode {

    \set Staff.useBassFigureExtenders = ##t
    \override Staff.BassFigureAlignmentPositioning.direction = #DOWN


}


forma = {
    \time 3/4
    \tempo 4=53
    \partial 16 s16
    s2.*59
    \bar "|."


}

IIcrI = {
    \IIglobal
    \clef bass
    <<\IIcrIn \forma >>

}

IIcrII = {
    \IIglobal
    \clef bass
    <<\IIcrIIn \forma >>

}

IIclI = {
    \IIglobal
    \clef tenor
    <<\IIclIn \forma >>

}

IIclII = {
    \IIglobal
    \clef tenor
    <<\IIclIIn \forma >>

}

IIflI = {
    \IIglobal
    <<\IIflIn \forma >>

}

IIflII = {
    \IIglobal
    <<\IIflIIn \forma >>

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma >>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma >>

}

IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma >>

}

IIfg = {
    \IIglobal
    \clef bass
    <<\IIfgn \forma >>

}

IIbs = {
    \IIglobal
    \clef bass
    <<\IIbsn \forma >>

}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto
}


IIIcrIn = %\transpose sol do,
\relative do {\key do\major

    R2.*8

    %9
    sol'2.\f
    la4. si
    sol2.

    %12
    la8 re, re re4 r8
    sol2.
    la4. si

    %15
    si \grace si16 la8 sol la\mbreak
    sol4 si8 sol4 r8
    R2.*12\mbreak

    %29
    la2.~\f
    la~
    la8 la la la la la

    %32
    la4. r4 r8
    R2.*7
    re,2.\pp~
    re~

    %42
    re~
    re
    re8 r r si'4.\f\mbreak

    %45
    la8 re, re re4.
    la'2.
    re,4 r8 r4 r8

    %48
    R2.*3

    %51
    r4 r8 sol4 r8
    sol4 r8 sol4 r8
    sol4 r8 r4 r8

    %54
    R2.
    r4 r8 re4 r8
    re4 r8 re4 r8

    %57
    re2.~\f
    re~
    re~

    %60
    re8 re re re re re\mbreak
    re4 r8 r4 r8
    R2.*2

    %64
    la'2.\f
    re,4 r8 r4 r8
    R2.*3

    %69
    r4 r8 re4 r8
    re4 r8 re4 r8
    re4 r8 r4 r8

    %72
    R2.*10

    %82
    sol2.\f
    la4. si
    sol2.

    %85
    la8 re, re re4 r8
    sol2.
    la4. si

    %88
    si \grace si16 la8 sol la
    sol4 si8 sol4 r8\mbreak
    R2.*14

    %104
    r4 r8 re4 r8
    re4 r8 re re re
    re4. r4 r8

    %107
    R2.
    re4.\p r4\fermata r8
    R2.*4

    %113
    sol2.\f
    la4. si4 sol8
    si4. \grace si16 la8 sol la

    %116
    sol4 r8 r sol sol\mbreak
    sol4 r8 r sol sol
    sol4 r8 r sol sol

    %119
    sol2.~
    sol~
    sol~

    %122
    sol8 sol sol sol sol sol\mbreak
    sol4 r8 r4 r8
    R2.*5
    R2.\fermata

    %130
    R2.*4

    %134
    sol2.\f
    la4. si
    si \grace si16 la8 sol la

    %137
    sol r r r4 r8
    R2.*3

    %141
    sol4. sol8 re si
    sol4.~sol8 si re
    sol si[la] si si la

    %144
    si si la si si la\mbreak
    si4 r8 la4 r8
    sol4. r4 r8\fermata

}


IIIcrIIn = %\transpose sol do,
\relative do {\key do\major

    R2.*8

    %9
    si2.\f
    re4. sol4 re8
    si2.

    %12
    re8 re[re] re4 r8
    si2.
    re4. sol4 re8

    %15
    sol4. re8 re re\mbreak
    si4 re8  si4 r8
    R2.*12\mbreak

    %29
    la'2.~\f
    la~
    la8 la la la la la

    %32
    la4. r4 r8
    R2.*7
    re,2.\pp~
    re~

    %42
    re~
    re
    re8 r r sol4.\f\mbreak

    %45
    re8 re re re4.
    la'2.
    re,4 r8 r4 r8

    %48
    R2.*3

    %51
    r4 r8 sol,4 r8
    sol4 r8 sol4 r8
    sol4 r8 r4 r8

    %54
    R2.
    r4 r8 re'4 r8
    re4 r8 re4 r8

    %57
    re2.~\f
    re~
    re~

    %60
    re8 re re re re re\mbreak
    re4 r8 r4 r8
    R2.*2

    %64
    la'2.\f
    re,4 r8 r4 r8
    R2.*3

    %69
    r4 r8 re4 r8
    re4 r8 re4 r8
    re4 r8 r4 r8

    %72
    R2.*10

    %82
    si2.\f
    re4. sol4 re8
    si2.

    %85
    re8 re[re] re4 r8
    si2.
    re4. sol4 re8

    %88
    sol4. re8 re re
    si4 re8  si4 r8\mbreak
    R2.*14

    %104
    r4 r8 re4 r8
    re4 r8 re re re
    re4. r4 r8

    %107
    R2.
    re4.\p r4\fermata r8
    R2.*4

    %113
    si2.\f
    re4. sol4 re8
    sol4. re8 re re

    %116
    si4 r8 r sol sol\mbreak
    sol4 r8 r sol sol
    sol4 r8 r sol sol

    %119
    sol2.~
    sol~
    sol~

    %122
    sol8 sol sol sol sol sol\mbreak
    sol4 r8 r4 r8
    R2.*5
    R2.\fermata

    %130
    R2.*4

    %134
    si2.\f
    re4. sol4 re8
    sol4. re

    %137
    si8 r r r4 r8
    R2.*3

    %141
    si4. sol'8 re si
    sol4.~sol8 si re
    si sol'[re] sol sol re

    %144
    sol sol re sol sol re\mbreak
    sol4 r8 re4 r8
    si4. r4 r8\fermata

}

IIIclIn = %\transpose sol do
\relative do' {\key sol\major

    R2.*8

    %9
    sol'4. \parenthesize \f \grace la16 sol8 fad sol
    la4 si8 \parenthesize sol4 \parenthesize re8
    sol4. \grace la16 sol8 fad sol

    %12
    la4 re,8 re mi fad
    sol4. \grace la16 sol8 fad sol
    la4 si8 sol4 re8

    %15
    si'4. \grace si16 la8 sol la\mbreak
    sol4 si8 sol4 r8
    R2.*12\mbreak

    %29
    mi4. fad
    mi fad
    mi8 la[la] la la la

    %32
    la4. r4 r8
    R2.*11
    r4 r8 re,4.\parenthesize \f ~\mbreak

    %45
    re8 re[dod] \grace dod16 si8 la sol
    fad' sol la \grace la16 sol8 fad mi
    re4 r8 r4 r8

    %48
    R2.*3

    %51
    r4 r8 mi4.\f
    (sol) si4(sol8)
    mi4-. r8 r4 r8

    %54
    R2.\mbreak
    r4 r8 re4.
    (fad) la4(fad8)

    %57
    re2.~\f
    re~
    re~

    %60
    re8 fad sol la fad sol\mbreak
    la4 r8 r4 r8

    %62
    R2.*2
    fad4.\f mi
    fad2.\p

    %66
    mi\mbreak
    fad
    mi

    %69
    re4 r8 re4 r8
    fad4 r8 la4 r8
    fad4 r8 r4 r8

    %72
    R2.*10

    %82
    sol4.\parenthesize \f \grace la16 sol8 fad sol
    la4 si8 <\parenthesize sol>4 <\parenthesize re>8
    sol4. \grace la16 sol8 fad sol

    %85
    la4 re,8 re mi fad
    sol4. \grace la16 sol8 fad sol
    la4 si8 sol4 re8

    %88
    si'4. \grace si16 la8 sol la
    sol4 si8 sol4 r8\mbreak
    R2.*12

    %102
    sol4 r8 sol4 r8\mbreak
    sol4 r8 sol4 r8
    fad!4 r8 re4 r8

    %105
    fad4 r8 la la la
    la4. r4 r8
    R2.
    do,4.\p r4\fermata r8

    %109
    R2.*4

    %113
    sol'4.\f \grace la16 sol8 fad sol
    la4 si8 sol4 re8
    si'4. \grace si16 la8 sol la

    %116
    sol4 r8 r mi mi\mbreak
    re4 r8 r mi mi
    re4 r8 r mi mi

    %119
    re4 r8 sol fad sol
    re do si sol' fad sol
    re do si sol' fad sol
    re si do re si do\mbreak

    %123
    re4 r8 r4 r8
    R2.*5
    R2.\fermata

    %130
    R2.*4

    %134
    sol4.\f \grace la16 sol8 fad sol
    la4 si8 sol4 re8
    si'4. \grace si16 la8 sol la

    %137
    sol sol-. _\markup\italic"stac[cate]"[sol-.] r si,-. sol'-.
    r mi-. mi-. r fad-. fad-.\mbreak
    r sol-. sol-. r si,-. sol'-.

    %140
    r mi-. mi-. r fad-. fad-.
    sol4. sol8 re si
    sol4.~sol8 si re

    %143
    si sol'[fad] sol sol fad
    sol sol fad sol sol fad\mbreak
    sol4 r8 fad4 r8

    %146
    sol4. r4 r8\fermata


}

IIIclIIn = %\transpose sol do
\relative do' {\key sol\major

    R2.*8

    %9
    si4.\parenthesize \f si8 re si
    do4 re8 si4 sol8
    si4. si8 re si

    %12
    re4 re8 re mi fad
    si,4. si8 re si
    do4 re8 si4 sol8

    %15
    sol'4. re8 re re\mbreak
    si4 re8 si4 r8
    R2.*12\mbreak

    %29
    dod4. re
    dod re
    dod8 dod[dod] dod dod dod

    %32
    dod?4. r4 r8
    R2.*11
    r4 r8 re4.\parenthesize \f~\mbreak

    %45
    re8 si[la] \grace la16 sol8 fad mi
    re' mi fad \grace fad16 mi8 re dod
    re4 r8 r4 r8

    %48
    R2.*3

    %51
    r4 r8 mi4.\f
    (sol) si4(sol8)
    mi4-. r8 r4 r8

    %54
    R2.\mbreak
    r4 r8 re4.
    (fad) la4(fad8)

    %57
    re4\f r8 re dod re
    la sol fad re' dod re
    la sol fad re' dod re

    %60
    la re re re re re\mbreak
    re4 r8 r4 r8
    R2.*2

    %64
    re4.\f dod
    re2.\p
    ~re4. dod\mbreak

    %67
    re2.-~
    re4. dod
    re4 r8 fad,4 r8

    %70
    re'4 r8 fad4 r8
    re4 r8 r4 r8
    R2.*10\mbreak

    %82
    si4.\parenthesize \f si8 re si
    do4 re8 si4 sol8
    si4. si8 re si

    %85
    re4 re8 re mi fad
    si,4. si8 re si
    do4 re8 si4 sol8

    %88
    sol'4. re8 re re
    si4 re8 si4 r8\mbreak
    R2.*12

    %102
    sib!4 r8 sib4 r8\mbreak
    sib?4 r8 sib4 r8
    la4 r8 fad4 r8

    %105
    la4 r8 do do do
    do4. r4 r8
    R2.

    %108
    la4.\p r4\fermata r8
    R2.*4

    %113
    si4.\f si8 re si
    do4 re8 si4 sol8
    sol'4. re8 re re

    %116
    si4 r8 r do do\mbreak
    si4 r8 r do do
    si4 r8 r do do

    %119
    si4 r8 sol4.
    sol2.~
    sol~

    %122
    sol8 sol sol sol sol sol\mbreak
    sol4 r8 r4 r8
    R2.*5
    R2.\fermata

    %130
    R2.*4

    %134
    si4. \f si8 re si
    do4 re8 si4 sol8
    sol'4. re8 re re

    %137
    r si-._\markup\italic"stac[cate]"  si-. r sol-. si-.
    r do-. do-. r la-. la-.\mbreak
    r si-. si-. r sol-. si-.

    %140
    r do-. do-. r la-. la-.
    si4. sol'8 re si
    sol4.~sol8 si re

    %143
    si si[la] si si la
    si si la si si la\mbreak
    si4 r8 la4 r8

    %146
    si4. r4 r8\fermata

}

IIIflIn = \relative do'' {

    R2.*8

    %9
    sol'4.\parenthesize \f \grace la16 sol8 (fad sol)
    la4 si8(sol4) re8
    sol4. \grace la16 sol8 fad sol

    %12
    la16 re dod re la fad re8 mi fad
    sol4. \grace la16 sol8 fad sol
    la4 si8 sol4 re8

    %15
    si'4. \grace si16 la8 sol la\mbreak
    sol4 si8 sol4 r8
    sol16\solo la si do re si sol la si do re si

    %18
    la re dod re la fad re re' dod re la fad
    sol la si dod? re si sol la si dod re si
    la re dod re la fad re re' dod re la fad

    %21
    sol4. \grace la16 sol8 fad mi\mbreak
    la4. re16 dod si la sol fad
    sol4. \grace la16 sol8 fad mi

    %24
    fad8 r r r4 r8
    r4 r8 re'8(re,) re-.
    re'(mi,) mi-. re'(fad,) fad-.

    %27
    re'(sol,) sol-. re'(fad,) fad-.
    mi16 red mi fad sol la si8 mi, mi\mbreak
    mi4 r8 re'4.

    %30
    dod4 r8 re4.
    dod8 la[la] la la la
    la4 r8 r4 r8

    %33
    re4.\solo(la)
    fad \grace fad16 mi8(re mi)
    re mi fad sol4 fad8

    %36
    mi la sol fad sol la\mbreak  %%<--------------------- p-58 fine
    \grace {sol16[la]} si8 r r si16 la sol la si sol
    la8 re dod \grace dod16 si8 la sol

    %39
    fad4(sol8) mi4 la8
    re,4. r4 r8
    R2.*3

    %44
    r4 r8 si'16\f la sol la si sol\mbreak
    la8 re dod \grace dod16 si8 la sol
    fad sol la \grace la16 sol8 fad mi

    %47
    re8 r r r4 r8
    r16 re, fad re la' fad re' la fad' re la' fad\mbreak
    re'4. r4 r8

    %50
    re16 dod re dod re dod si lad si lad si la
    sol8 r r r4 r8
    R2.*2

    %54
    mi'16 red mi red mi re dod sid dod sid dod si\mbreak
    la8 r r r4 r8
    R2.

    %57
    r4 r8 re\parenthesize \f dod re
    la sol fad re' dod re
    la sol fad re' dod re

    %60
    la fad sol la fad sol\mbreak
    la4 r8 r4 r8
    re16 la si dod? re mi fad dod! re mi fad sol

    %63
    la8-. fad-. re-. la-. fad-. re-.
    la4. mi'\tr
    re8 re'-.[re-.] r re-. fad,-.

    %66
    r mi-. sol-. r mi-. la-.\mbreak
    r8 re-. re-. r re-. fad,-.
    r mi-. sol-. r mi-. la-.

    %69
    fad r r r4 r8
    r16 re, fad re la' fad re' la fad' re la' fad
    re'2.~

    %72
    re4\p mi8 (do!4 re8)
    si4 do8 (la4 si8)\mbreak
    sol4. \grace la16 sol8(fad sol)

    %75
    la4(si8) sol4(re8)
    sol4. \grace la16 sol8(fad sol)
    la16 re dod re la fad re8(mi fad)

    %78
    sol4. \grace la16 sol8 fad sol
    la4 si8 (sol4) re8
    si'4. \grace si16 la8 sol la

    %81
    sol4-. si8-. sol4-. r8\mbreak
    sol4.\f \grace la16 sol8 (fad sol)
    la4 si8(sol4) re8
    sol4. \grace la16 sol8 fad sol

    %85
    la16 re dod re la fad re8 mi fad
    sol4. \grace la16 sol8 fad sol
    la4 si8 sol4 re8

    %88
    si'4. \grace si16 la8 sol la
    sol4 si8 sol4 r8\mbreak
    re'4. \grace re16 do8(sib do)

    %91
    sib4. \grace sib16 la8(sol la)
    sol4 sib8 (la4) re8
    do4  sib8\parentSlur (la4) r8

    %94
    re4. \grace re16 do8 sib do
    sib4. \grace sib16 la8 sol la
    sol4 sib8(la4) fad!8

    %97
    sol4-. sib8-. sol4-. r8\mbreak
    r4 r8 fa!16 sol la sib do fa,
    re' sib la sib do sib fa sol la sib do fa,

    %100
    re'2.~
    re~
    re16 sol,[fad! sol la sol] sib sol[fad sol la sol]\mbreak

    %103
    sib sol[fad sol la sol] sib sol[fad sol la sol]
    fad4 r8 fad4 r8
    la4 r8 do do do

    %106
    do4. r4 r8
    R2.
    fad,!4. r4\fermata r8

    %109
    sol4. \grace la16 sol8 fad! sol\mbreak
    la4 si!8 sol4 re8
    sol4. \grace la16 sol8 fad sol

    %112
    la4 re8 re, mi! fad!
    sol4. \grace la16 sol8 fad sol
    la4 si8 sol4 re8

    %115
    si'4. \grace si16 la8 sol la
    sol16 re'[do si do re] mi8 r r\mbreak
    r16 re do si do re mi8-. r r

    %118
    r16 re do si do re mi8-. r r
    re r r sol, fad sol
    re do si sol' fad sol

    %121
    re do si sol' fad sol
    re si' do re si do\mbreak
    re4 r8 r4 r8

    %124
    R2.*5
    R2.\fermata

    %130
    sol,4.\p \grace la16 sol8 fad sol
    la4 si8 (sol4) re8\mbreak
    sol4. \grace la16 sol8 fad sol

    %133
    la16 re dod re la fad re8 mi fad
    sol4. \f\grace la16 sol8 fad sol
    la4 si8 sol4 re8

    %136
    si'4. \grace si16 la8 sol la
    sol2.\p~
    sol4. fad\mbreak

    %139
    sol2.~
    sol4. fad
    sol8\f sol[si] re4 si8

    %142
    sol sol[si] re4 si8
    sol sol[fad] sol sol fad
    sol sol fad sol sol fad

    %145
    sol4 r8 re'4 r8
    si4. r4 r8\fermata

}

IIIflIIn = \relative do'' {

    R2.*8

    %9
    si4.\parenthesize \f si8 \parentSlur (re si)
    do4 re8 (\parentSlur (si4) sol8
    si4. si8 re si

    %12
    la16 re dod re la fad re8 r r
    si'4. si8 re si
    do4 re8 si4 sol8

    %15
    sol'4. \grace re16 do8 si do\mbreak
    si4 re8 si4 r8
    R2.*4

    %21
    mi4. \grace fad16 mi8 re dod\mbreak
    fad2.
    mi4. \grace fad16 mi8 re dod

    %24
    re16 re[mi fad sol la] si la sol la si dod
    re2.~
    re~

    %27
    re~
    re\mbreak
    dod4 r8 fad,4.

    %30
    (mi4) r8 fad4.
    mi8 dod[dod] dod dod dod
    dod?4 r8 r4 r8

    %33
    R2.
    re4.\solo (la)
    fad8 la re si mi re

    %36
    dod la dod re mi fad\mbreak
    \grace {mi16[fad]} sol8 r r sol16 fad mi fad sol mi
    fad8 si la \grace la16 sol8 fad mi

    %39
    re4. la
    fad r4 r8
    R2.*3

    %44
    r4 r8 sol'16\f fad mi fad sol mi\mbreak
    fad8 si la \grace la16 sol8 fad mi
    re mi fad \grace fad16 mi8 re dod

    %47
    re16 re,[fad re la' fad] re' la fad' re la' fad
    re'2.~\mbreak
    re4. re16 dod re dod re dod

    %50
    si lad si lad si la sol fad sol fad sol fad
    mi8 r r r4 r8
    R2.

    %53
    r4 r8 mi'16 red mi red mi re
    dod sid dod sid dod si la sold la sold la sol\mbreak
    fad8 r r r4 r8

    %56
    R2.
    re2.~\f
    re~

    %59
    re~
    re\mbreak
    re16 re mi fad sol la si la sol la si dod

    %62
    re4.(la)
    fad8 r r r4 r8
    re4. dod

    %65
    re8 fad-.[fad-.] r fad-. re-.
    r si-. mi-. r dod-. mi-.\mbreak
    r fad-. fad-. r fad-. re-.

    %68
    r si-. mi-. r dod-. mi-.
    re16 re, [fad re la' fad] re' la fad' re la' fad
    re'2.

    %71
    re,~
    re4\p mi8(do!4 re8)
    si4 do8(la4 si8)\mbreak

    %74
    sol4 r8 r4 r8
    r8 re'-. re-. r re-. re-.
    r8 re-. re-. r re-. re-.

    %77
    re4 r8 r4 r8
    r8 re-. re-. r re-. re-.
    r8 re-. re-. r re-. re-.

    %80
    r re-. re-. \grace re16 do8-. si-. do-.
    si4-. re8-. si4-. r8\mbreak
    si4.\f si8 \parentSlur (re si)

    %83
    do4 re8\parentSlur ( si4) sol8
    si4. si8 re si

    %85
    la16 re dod re la fad re8 r r
    si'4. si8 re si
    do4 re8 si4 sol8

    %88
    sol'4. \grace re16 do8 si do
    si4 re8 si4 r8\mbreak
    sib'4. \grace sib16 la8 (sol la)

    %91
    sol4. \grace re16 do8(sib do)
    sib4 sol'8 (fad4) fad8
    la4 sol8(fad4) r8

    %94
    sib4. \grace sib16 la8 sol la
    sol4. \grace re16 do8 sib do
    sib4 re8 (do4) la8

    %97
    sib4-. re8-. sib4-. r8\mbreak
    fa'2.~
    fa

    %100
    fa?8-. r r re16 mi! fad sol la re,
    sib' sol fad sol la sol re mi fad sol la re,
    sib'8 r r sol r r\mbreak

    %103
    R2.
    r4 r8 re4 r8
    fad4 r8 la la la

    %106
    la4. r4 r8
    R2.
    do,4. r4\fermata r8

    %109
    R2.\mbreak
    r8 re-.(re-.) r re-.(re-.)
    r8 re-.(re-.) r re-.(re-.)

    %112
    r re re re mi fad
    sol4. \grace la16 sol8 fad sol
    la4 si8 sol4 re8

    %115
    sol4. \grace re16 do8 si do
    si16 si'[la sol la si] do8 r r\mbreak
    r16 si la sol la si do8 r r

    %118
    r16 si la sol la si do8 r r
    si r r sol fad sol
    re do si sol' fad sol

    %121
    re do si sol' fad sol
    re sol sol sol sol sol\mbreak
    sol4 r8 r4 r8

    %124
    R2.*5

    %129
    R2.\fermata
    R
    r8 re-. re-. r re-. re-.\mbreak

    %132
    r8 re-. re-. r re-. re-.
    r8 re-. re-. re mi fad
    sol4. \f \grace la16 sol8 fad sol

    %135
    la4 si8 sol4 re8
    sol4. re8 re re
    si2.\p

    %138
    la\mbreak
    si
    la


    %141
    si8\f re[sol] si4 re,8
    si re[sol] si4 re,8
    si si[la] si si la

    %144
    si si la si si la\mbreak
    si4 r8 fad'4 r8
    sol4. r4 r8\fermata

}

IIIvlIn = \relative do'' {

    sol'4._\markup\italic"sotto voce" (\grace la16 sol8 fad sol)
    la4 si8 (sol4) re8
    sol4. (\grace la16 sol8 fad sol)

    %4
    la4 (re8-!) re,4-. r8
    sol4. (\grace la16 sol8 fad sol)
    la4 si8(sol4) re8

    %7
    si'4.  \grace si16 la8 sol la\mbreak
    sol4 si8-. sol4-. r8
    sol4.\ff \grace la16 sol8(fad sol)

    %10
    la4 si8(sol4) re8
    sol4. \grace la16 sol8 fad sol
    la16 re dod re la fad re-. (re mi-. mi fad-. fad)

    %13
    sol4. \grace la16 sol8 fad sol
    la4 si8 sol4 re8
    si'4. \grace si16 la8 sol la\mbreak

    %16
    sol16 si re, sol si, re sol,4 r8
    r sol-.\p si-. r sol-. si-.
    \repeat unfold 2{r8 la-. re-.}

    %19
    \repeat unfold 2{r sol,-. si-.}
    \repeat unfold 2{r8 la-. re-.}
    sol,16 la, sol' la, sol' la, sol' la, fad' la, mi' la,\mbreak

    %22
    la' la, la' la, la' la, fad' la, fad' la, fad' sol,
    sol' la, sol' la, sol' la, sol' la, fad' la, mi' la,
    fad'8 r r r4 r8

    %25
    r fad-.(fad-.) r fad-. re'-.
    r mi,-. re'-. r fad,-. re'-.
    r sol,-. re'-. r fad,-. re'-.

    %28
    r mi,-.(mi-.) r mi mi'\mbreak
    mi16 dod'\f si la si dod re la sol fad mi re
    la' dod si la si dod re la sol fad mi re
    la'8 <<{la[la] la la la}\\{dod,8[dod] dod dod dod}>>

    %32
    <<la'4\\dod,?>> r8 r4 r8
    R2.*7
    re,4.\p \grace mi16 re8(dod) re
    sol4.~ sol8 (la sol)

    %42
    fad(re' dod) si(mi re)
    dod(la' sol) fad sol la
    \grace {sol16[la]} si4 r8 si16 \f la sol la si sol\mbreak

    %45
    la16 la re re dod dod si si la la sol sol
    fad la, sol' la, la' la, sol' la, fad' la, mi' la,
    re4 r8 r4 r8

    %48
    re4\p r8 r4 r8\mbreak
    re4 r8 r4 r8
    R2.

    %51
    r4 r8 mi,16\ff fad sol la si sol
    mi fad sol la si sol mi fad sol la si sol
    mi4-. r8 r4 r8

    %54
    R2.\mbreak
    r4 r8 re16 mi fad sol la fad
    re mi fad sol la fad re mi fad sol la fad

    %57
    re re''\f[re re re re] re re, dod' re, re' re,
    la' re, sol re fad re re' re, dod' re, re' re,
    la' re, sol re fad re re' re, dod' re, re' re,

    %60
    la' re, fad re sol re la' re, fad re sol re\mbreak
    la'4 r8 r4 r8
    re,4 r8 r4 r8

    %63
    fad4 r8 r4 r8
    fad16\f re' fad, re' fad, re' dod mi, dod' mi, dod' mi,
    re'4 r8 fad,,4-.\p r8

    %66
    mi4 r8 mi4 r8\mbreak
    fad4 r8 fad4 r8
    mi4 r8 mi4 r8   %%%<--------------

    %69
    re4 r8 <re' fad, la,>4\f r8
    <fad la, re,>4 r8 \once\stemUp <la re, re,>4 r8
    \once\stemUp <re re, re,>4 r8 r4 r8

    %72
    re,,4._\markup\italic {\dynamic pp e leg[gero]}(fad)
    sol(fad)\mbreak
    sol\p \grace la16 sol8(fad sol)

    %75
    la4 si8 (sol4) re8
    sol4. \grace la16 sol8(fad sol)
    la4(re8) re,(mi fad)

    %78
    sol4. \grace la16 sol8(fad sol)
    la4 si8(sol4) re8
    si'4. \grace si16 la8(sol la)

    %81
    sol4-. si8-. sol4-. r8  %%% <-------- p 66
    sol'4.\f \grace la16 sol8 (fad sol)  %%% inizia la ripresa vedi battita 9 f1no a battuta 16

    %83
    la4 si8(sol4) re8
    sol4. \grace la16 sol8 fad sol
    la16 re dod re la fad re re mi mi fad fad

    %86
    sol4. \grace la16 sol8 fad sol
    la4 si8 sol4 re8
    si'4. \grace si16 la8 sol la

    %89
    sol4 si8 sol4 r8\mbreak
    re,-. sol-. sib-. re,-. fad-. la-.
    re,-. sol-. sib-. re,-. fad-. la-.

    %92
    re,-. sol-. sib-. re,-. fad-. la-.
    re,-. sol-. sib-. re,-. fad-. la-.
    re,-. sol-. sib-. re,-. fad-. la-.

    %95
    re,-. sol-. sib-. re,-. fad-. la-.
    re,-. sol-. sib-. re,-. fad-. la-.
    sol-. re-. sib-. sol4-. r8\mbreak

    %98
    r4 r8  r fa'-.(fa-.)
    r8 fa?-.(fa-.) r8 fa-.(fa-.)
    r8 fa?-. fa-. r la-. (la-.)
    r sib-. (sib-.) r la-. (la-.)

    %102
    \repeat unfold 2{r8 sib sib}\mbreak
    r sib?-.(sib-.) r sib-.(sib-.)
    la16 re[dod re dod re] fad!-.\f re[dod re dod re]

    %105
    la' re,[dod re dod re] do'!8 do do
    do(sol fad) re_\markup\italic"smorz[ate]"(do la)
    fad(re do) la(do fad)

    %108
    la4. r4\fermata r8
    sol4.\p \grace la16 sol8(fad sol)\mbreak
    la4 si!8(sol4) re8

    %111
    sol4.\grace la16 sol8 fad sol
    la4(re8) re, mi fad
    sol sol'\f sol \grace la16 sol8 fad sol

    %114
    la4 si8 sol4 re8
    si'4. \grace si16 la8 sol la
    sol r r r <do mi, sol,> <do mi, sol,>\mbreak

    %117
    <si re, sol,> r r r <do mi, sol,> <do mi, sol,>
    <si re, sol,> r r r <do mi, sol,> <do mi, sol,>
    <si re, sol,> r r sol16\f sol fad fad sol sol

    %120
    re re do do si si sol' sol fad fad sol sol
    re re do do si si sol' sol fad fad sol sol
    re re si si do do re re si si do do\mbreak

    %123
    re4 r8 r4 r8
    re2.\pp
    (dod)

    %126
    (do!)
    (si)
    (la4-!) r8 r4 r8

    %129
    fad4 r8 r4 r8\fermata
    sol4. \grace la16 sol8 fad sol
    la4 si8(sol4) re8\mbreak

    %132
    sol4. \grace la16 sol8 fad sol
    la4(si8-!) re,4 r8
    sol'4.\ff \grace la16 sol8 fad sol

    %135
    la4 si8 sol4 re8
    si'4. \grace si16 la8 sol la
    sol\p r r si, r r

    %138
    la r r la r r\mbreak
    si r r si r r
    la r r la r r

    %141
    sol16\f sol'[si sol si sol] re sol re sol re do
    si sol' si sol si sol re sol re sol re do
    si8 <sol' si, re,>[<fad la, re,>] <sol si, re,><sol si, re,><fad la, re,>

    %144
    <sol si, re,><sol si, re,><fad la, re,><sol si, re,><sol si, re,><fad la, re,>\mbreak
    <sol si, re,>4 r8 <re' re, re,>4 r8
    <si re, re,>4. r4 r8\fermata

}

IIIvlIIn = \relative do'' {

    \repeat unfold 2{si,16 re si re si re}
    do re do re do re si re si re si re
    sol, re' sol, re' sol, re'  sol, re' sol, re' sol, re'

    %4
    la16 re la re la re la re dod re do la
    si re si re si re si re si re si re
    do re do re do re si re si re si re

    %7
    si re si re si re do re do re do re\mbreak
    si4-. re8-. si4-. r8
    si'16\f re si re si re si16 re si re si re

    %10
    do16 re do re do re si re si re si re
    <re si>4. si16 re si re si re
    la16 re dod re la fad re-. re mi-. mi fad-. fad

    %13
    sol re' si re si re si re si re si re
    do re do re do re si re si re si re
    si re sol, si sol re fad re fad re fad re\mbreak

    %16
    si re sol si sol re si4 r8
    r8 re-.\p sol-. r8 re-. sol-.
    r8 re-. la'-. r fad-. la-.

    %19
    \repeat unfold 2{r8 re,-. sol-.}
    \repeat unfold 2{r8 fad-. la-.}
    mi16 la, mi' la, mi' la, mi' la, re la dod la\mbreak

    %22
    fad' la, fad' la, fad' la, re la re la re la
    mi' la, mi' la, mi' la,  mi' la, re la dod la
    re8 r r r4 r8

    %25
    r8 re-.(re-.) r re-.(re-.)
    r re-.(re-.) r re-.(re-.)
    r re-.(re-.) r re-.(re-.)

    %28
    r re-.(re-.) r re(re)\mbreak
    dod16 la'\f la la la la la la la la la la
    la la la la la la la la la la la la

    %31
    la8 <<
        {
            dod[dod] dod dod dod
            dod?4
        }\\{mi,8[mi] mi mi mi
            mi4}
    >> r8 r4 r8
    R2.*7
    re4.\p \grace mi16 re8(dod) re

    %41
    si (mi re) dod4.
    re8(fad la) sol4.~
    sol8 dod mi re(mi fad)

    %44
    \grace {mi16[fad]} sol4 r8 sol16\f fad mi fad sol mi\mbreak
    fad16 fad si si la la sol sol fad fad mi mi
    re la mi' la, fad' la, mi' la, re la dod la

    %47
    <<re4\\fad,>> r8 r4 r8
    fad4\p r8 r4 r8\mbreak
    fad4 r8 r4 r8

    %50
    R2.
    r4 r8 mi16\ff fad sol la si sol
    mi fad sol la si sol mi fad sol la si sol
    mi4-. r8 r4 r8

    %54
    R2.\mbreak
    r4 r8 re16 mi fad sol la fad
    re mi fad sol la fad re mi fad sol la fad

    %57
    re8 r r <<{re16\f re re re re re}\\{re re re re re re}>>
    <<{\repeat unfold 36 {re16}}\\{\repeat unfold 36 {re16}}>>
    <<re4\\re>> r8 r4 r8
    fad4 r8 r4 r8

    %63
    re'4 r8 r4 r8
    fad16\f la, fad' la, fad' la, mi' la, mi' la, mi' la,
    fad'4 r8 re,4\p r8

    %66
    re4 r8 dod4 r8\mbreak
    re4 r8 re4 r8
    re4 r8 dod4 r8

    %69
    re4 r8 <re' fad, la,>4\f r8
    <fad la, re,>4 r8 \once\stemUp <la la, re,>4 r8
    <fad la, re,>4 r8 r4 r8

    %72
    re,4.\pp(do!)
    si la\mbreak
    si16\pp re si re si re si16 re si re si re

    %75
    do! re do re do re  si re si re si re
    si re si re si re si re si re si re
    la re la re la re la re la re la re

    %78
    si re si re si re si re si re si re
    do re do re do re  si re si re si re
    si re si re si re do re do re do re

    %81
    si16 re sol si sol re si4 r8\mbreak
    si'16\f re si re si re si re si re si re

    %83
    do16 re do re do re si re si re si re
    <re si>4. si16 re si re si re
    la16 re dod re la fad re-. re mi-. mi fad-. fad

    %86
    sol re' si re si re si re si re si re
    do re do re do re si re si re si re
    si16 re sol, si sol re fad re fad re fad re

    %89
    si re sol si sol re si4 r8\mbreak
    re-. sol-. sib-. re,-. fad-. la-.
    re,-. sol-. sib-. re,-. fad-. la-.

    %92
    re,-. sol-. sib-. re,-. fad-. la-.
    re,-. sol-. sib-. re,-. fad-. la-.
    re,-. sol-. sib-. re,-. fad-. la-.

    %95
    re,-. sol-. sib-. re,-. fad-. la-.
    re,-. sol-. sib-. re,-. fad-. la-.
    sol-. re-. sib-. sol4-. r8\mbreak

    %98
    r4 r8 r do-.(do-.)
    r re-. (re-.) r do-. (do-.)
    r re-. (re-.) r re-. (re-.)

    %101
    r re-. (re-.) r re-. (re-.)
    \repeat unfold 2{r sol-.(sol-.)}\mbreak
    r sol-.(sol-.) r sol-.(sol-.)

    %104
    fad4 r8 re'4\f r8
    fad4 r8 la la la
    la(sol fad) re_\markup\italic"smorz."(do la)

    %107
    fad(re do) la(do fad)
    do4. r4\fermata r8
    si16\p re si re si re si re si re si re\mbreak

    %110
    do re do re do re si re si re si re
    si re si re si re si re si re si re
    la re la re la re la re dod re do la

    %113
    si re'\f[si re si re] si re si re si re
    do16 re do re do re si re si re si re
    si16 re sol, si sol re fad re fad re fad re

    %116
    si8 r r r <<{mi' mi}\\{do do}>> \mbreak
    <<re8\\sol,>> r8 r r <<{mi' mi}\\{do do}>>
    <<re8\\sol,>> r8 r r <<{mi' mi}\\{do do}>>

    %119
    <re sol,>16 sol[sol sol sol sol] sol,\f sol sol sol sol sol
    \repeat unfold 36 {sol16}
    sol4 r8 r4 r8
    sold2.\pp

    %125
    (mi)
    (fad)
    (sol)
    mi4-! r8 r4 r8

    %129
    do4 r8 r4 r8\fermata
    si16 re si re si re si re si re si re
    do re do re do re si re si re si re\mbreak

    %132
    si re si re si re si re si re si re
    la16 re dod re fad la re, re mi mi fad fad
    sol \ff re'[si re si re] si re si re si re

    %135
    do16 re do la re do si re si re si re
    si16 re sol, si re, sol fad la fad la re, fad
    <sol si,>8\p r r sol r r

    %138
    sol r r fad r r\mbreak
    sol r r sol r r
    sol r r fad r r

    %141
    sol16\f sol'[si sol si sol] re sol re sol re do
    si sol' si sol si sol re sol re sol re do
    si8 <sol' si, re,>[<fad la, re,>] <sol si, re,><sol si, re,><fad la, re,>

    %144
    <sol si, re,><sol si, re,><fad la, re,><sol si, re,><sol si, re,><fad la, re,>\mbreak
    <sol si, re,>4 r8 <fad la, re,>4 r8
    <sol si, re,>4. r4 r8\fermata

}

IIIvlan = \relative do' {

    sol'4.\p \grace la16 sol8 fad sol
    la4 si8 (sol4) re8
    sol4. (\grace la16 sol8 fad sol)

    %4
    la4 (re8-!) re,4-. r8
    sol4. (\grace la16 sol8 fad sol)
    la4 si8(sol4) re8

    %7
    si'4. \grace si16 la8 sol la\mbreak
    sol4 si8-. sol4-. r8
    sol \parenthesize \f sol sol sol sol sol

    %10
    fad8-. la-. re,-. sol sol, sol'
    sol, sol' sol sol sol sol
    fad8-. la-. fad-. re-. mi-. fad

    %13
    sol sol, sol' sol sol sol
    fad8 la re, sol sol, sol'
    sol si re re, re re\mbreak

    %16
    sol8 si, re sol,4 r8
    sol'4\p r8 sol4 r8
    fad4 r8 re4 r8

    %19
    sol4 r8 sol4 r8
    fad4 r8 re4 r8
    la4 r8 la4 r8\mbreak

    %22
    la4 r8 la4 r8
    la4 r8 la4 r8
    re4 r8 r4 r8

    %25
    re4 r8 si'4 r8
    sol4 r8 la4 r8
    si4 r8 la4 r8

    %28
    sol4 r8 sold4 r8\mbreak
    la, la' sol! fad la re,
    la la' sol fad la re,

    %31
    la la' mi dod mi dod
    la si' la sol fad mi
    re4. r4 r8

    %34
    R2.*6
    re8\pp re re \repeat unfold 21 {re}

    %44
    sol4 r8 sol\f sol sol\mbreak
    re re re sol sol sol
    la la la la, la la

    %47
    re4 r8 r4 r8
    re4\p r8 r4 r8\mbreak
    re4 r8 r4 r8

    %50
    R2.
    r4 r8 mi16\ff fad sol la si sol
    mi fad sol la si sol mi fad sol la si sol

    %53
    mi4-. r8 r4 r8
    R2.\mbreak
    r4 r8 re16\f mi fad sol la fad

    %56
    re mi fad sol la fad re mi fad sol la fad
    re8 r r si'-._\markup\italic{\dynamic f sempre} lad-. si-.
    fad-. mi-. re-. si'-. lad-. si-.

    %59
    fad-. mi-. re-. si'-. lad-. si-.
    fad-. re-. mi-. fad-. re-. mi-.\mbreak
    fad4 r8 r4 r8

    %62
    re4 r8 r4 r8
    re8 r r r4 r8
    la'8\parenthesize \f la la la, la la

    %65
    re16_\markup\italic {\dynamic p e sciolte} dod re mi fad re si lad si dod re si
    sol' fad sol la si sol la sold la si dod la\mbreak
    re dod re mi fad re si lad si dod re si

    %68
    sol fad sol la si sol la sold la si dod la
    re4 r8 re,4\f r8
    re4 r8 re4 r8

    %71
    re2.\pp~
    re~
    re\mbreak

    %74
    sol\pp~
    sol
    sol

    %77
    fad4.(re)
    sol2.
    sol

    %80
    sol4.(re)
    sol4 sol8-. sol,4-. r8
    sol'8\f sol sol sol sol sol

    %83
    fad8-. la-. re,-. sol sol, sol'
    sol, sol' sol sol sol sol
    fad8-. la-. fad-. re-. mi-. fad

    %86
    sol sol, sol' sol sol sol
    fad8 la re, sol sol, sol'
    sol si re re, re re\mbreak

    %89
    sol8 si, re sol,4 r8
    R2.*8\mbreak
    r4 r8 la4-. r8

    %99
    sib4 r8 la4 r8
    sib4 r8 fad!4 r8
    sol4 r8 fad!4 r8

    %102
    sol'4-. r8 mib4-. r8\mbreak
    re4 r8 dod4 r8
    re4 r8 re4\f r8

    %105
    re4 r8 re-. fad-. la-.
    re,2.~\tenuto _\markup\italic"smorz."
    re~

    %108
    re4. r4\fermata r8
    sol4-.\p^\pizz r8 sol4-. r8\mbreak
    fad4 r8 sol4 r8

    %111
    sol4 r8 sol4 r8
    fad4 r8 re4 r8
    sol4.\f \grace la16 sol8 fad sol

    %114
    la4 si8 sol4 re8
    si'4. \grace si16 la8 sol la
    sol4 r8 r sol sol\mbreak

    %117
    sol4 r8 r sol sol
    sol4 r8 r sol sol
    sol4 r8 mi'8-._\markup\italic{\dynamic f sempre}  red-. mi-.

    %120
    si-. la-. sol-. mi'-. red-. mi-.
    si-. la-. sol-. mi'-. red-. mi-.
    si-. sol-. la-. si-. sol-. la-.\mbreak

    %123
    si4. r4 r8
    mi,2.\parenthesize \pp
    (la)

    %126
    (re,)
    mi
    (do4-!) r8 r4 r8
    re4-! r8 r4 r8\fermata
    sol2.\pp~

    %131
    sol~\mbreak
    sol
    fad4.(re)

    %134
    sol4.\f \grace la16 sol8 fad sol
    la4 si8 sol4 re8
    si'4. \grace si16 la8 sol la

    %137
    sol16_\markup\italic {\dynamic p e sciolte} fad sol la si sol mi red mi fad sol mi
    do si do re! mi do re dod re mi fad re\mbreak
    sol fad sol la si sol mi red mi fad sol mi

    %140
    do si do re! mi do re dod re mi fad re
    sol8\f sol[sol] sol sol sol
    sol,8 sol'[sol] sol sol sol

    %143
    sol,8 sol'[re] sol sol re
    sol sol re sol sol re\mbreak
    sol4 r8 re4 r8

    %146
    sol4. r4 r8\fermata

}


IIIfgn = \relative do {

    sol'2.
    fad4.(sol)
    sol,(sol')

    %4
    fad(re)
    sol2.
    fad4.(sol)

    %7
    sol(re)\mbreak
    sol4 sol8 sol,4 r8
    sol'2.\f

    %10
    fad8 la re, sol sol, sol'
    sol, sol' sol sol4.
    fad8-. la-. fad-. re-. mi-. fad-.

    %13
    sol2.
    fad8 la re, sol sol, sol'
    sol si re re, re re

    %16
    sol8 si, re sol,4 r8
    sol'4\p r8 sol4 r8
    fad4 r8 re4 r8

    %19
    sol4 r8 sol4 r8
    fad4 r8 re4 r8
    la4 r8 la4 r8\mbreak

    %22
    la4 r8 la4 r8
    la4 r8 la4 r8
    re4 r8 r4 r8

    %25
    re4 r8 si'4 r8
    sol4 r8 la4 r8
    si4 r8 la4 r8

    %28
    sol4 r8 sold4 r8\mbreak
    la, la' sol! fad la re,
    la la' sol fad la re,

    %31
    la la' mi dod mi dod
    la si' la sol fad mi
    re4. r4 r8

    %34
    R2.*6
    re8\pp re re \repeat unfold 21 {re}

    %44
    sol4 r8 sol\f sol sol\mbreak
    re re re sol sol sol
    la la la la, la la

    %47
    re4 r8 r4 r8
    re4\p r8 r4 r8\mbreak
    re4 r8 r4 r8

    %50
    R2.
    r4 r8 mi16\ff fad sol la si sol
    mi fad sol la si sol mi fad sol la si sol

    %53
    mi4-. r8 r4 r8
    R2.\mbreak
    r4 r8 re16\f mi fad sol la fad

    %56
    re mi fad sol la fad re mi fad sol la fad
    re8 r r si'-._\markup\italic{\dynamic f sempre} lad-. si-.
    fad-. mi-. re-. si'-. lad-. si-.

    %59
    fad-. mi-. re-. si'-. lad-. si-.
    fad-. re-. mi-. fad-. re-. mi-.\mbreak
    fad4 r8 r4 r8

    %62
    re4 r8 r4 r8
    re8 r r r4 r8
    la'8\parenthesize \f la la la, la la

    %65
    re16_\markup\italic {\dynamic p e sciolte} dod re mi fad re si lad si dod re si
    sol' fad sol la si sol la sold la si dod la\mbreak
    re dod re mi fad re si lad si dod re si

    %68
    sol fad sol la si sol la sold la si dod la
    re4 r8 re,4\f r8
    re4 r8 re4 r8

    %71
    re2.\pp~
    re~
    re\mbreak

    %74
    sol\p
    (fad4. sol)
    sol,(sol')

    %77
    fad4.(re)
    sol2.
    (fad4. sol)

    %80
    sol4.(re)
    sol4 sol8-. sol,4-. r8
    sol'2.\f

    %83
    fad8 la re, sol sol, sol'
    sol, sol' sol sol4.
    fad8-. la-. fad-. re-. mi-. fad-.

    %86
    sol2.
    fad8 la re, sol sol, sol'
    sol si re re, re re

    %89
    sol8 si, re sol,4 r8
    R2.*8\mbreak
    r4 r8 la4-. r8

    %99
    sib4 r8 la4 r8
    sib4 r8 fad!4 r8
    sol4 r8 fad!4 r8

    %102
    sol'4-. r8 mib4-. r8\mbreak
    re4 r8 dod4 r8
    re4 r8 re4\f r8

    %105
    re4 r8 re-. fad-. la-.
    re,2.~\tenuto _\markup\italic"smorz."
    re~

    %108
    re4. r4\fermata r8
    sol4-.\p^\pizz r8 sol4-. r8\mbreak
    fad4 r8 sol4 r8

    %111
    sol4 r8 sol4 r8
    fad4 r8 re4 r8
    sol\f sol sol sol sol sol

    %114
    fad8 la re, sol sol, sol'
    sol si re re, re re
    sol4 r8 r sol sol\mbreak

    %117
    sol4 r8 r sol sol
    sol4 r8 r sol sol
    sol4 r8 mi'8-._\markup\italic{\dynamic f sempre}  red-. mi-.

    %120
    si-. la-. sol-. mi'-. red-. mi-.
    si-. la-. sol-. mi'-. red-. mi-.
    si-. sol-. la-. si-. sol-. la-.\mbreak

    %123
    si4. r4 r8
    mi,2.\parenthesize \pp
    (la)

    %126
    (re,)
    mi
    (do4-!) r8 r4 r8
    re4-! r8 r4 r8\fermata
    sol2.\pp

    %131
    (fad4. sol)\mbreak
    sol, sol'
    fad re

    %134
    sol8\f sol sol sol sol sol
    fad8 re' re, sol sol, sol'
    sol si re re, re re

    %137
    sol16_\markup\italic {\dynamic p e sciolte} fad sol la si sol mi red mi fad sol mi
    do si do re! mi do re dod re mi fad re\mbreak
    sol fad sol la si sol mi red mi fad sol mi

    %140
    do si do re! mi do re dod re mi fad re
    sol8\f sol[sol] sol sol sol
    sol,8 sol'[sol] sol sol sol

    %143
    sol,8 sol'[re] sol sol re
    sol sol re sol sol re\mbreak
    sol4 r8 re4 r8

    %146
    sol4. r4 r8\fermata

}

IIIbsn = \relative do {

    sol'2.~\p
    sol
    sol

    %4
    fad4.(re-!)
    sol2.~
    sol

    %7
    sol4. re\mbreak
    sol4 sol8 sol,4 r8
    sol'\ff sol sol sol sol sol

    %10
    fad8-. la-. re,-. sol sol, sol'
    sol, sol' sol sol sol sol
    fad8-. la-. fad-. re-. mi-. fad

    %13
    sol sol, sol' sol sol sol
    fad8 la re, sol sol, sol'
    sol si re re, re re\mbreak

    %16
    sol8 si, re sol,4 r8
    sol'4\p r8 sol4 r8
    fad4 r8 re4 r8

    %19
    sol4 r8 sol4 r8
    fad4 r8 re4 r8
    la4 r8 la4 r8\mbreak

    %22
    la4 r8 la4 r8
    la4 r8 la4 r8
    re4 r8 r4 r8

    %25
    re4 r8 si'4 r8
    sol4 r8 la4 r8
    si4 r8 la4 r8

    %28
    sol4 r8 sold4 r8\mbreak
    la, la' sol! fad la re,
    la la' sol fad la re,

    %31
    la la' mi dod mi dod
    la si' la sol fad mi
    re4. r4 r8

    %34
    R2.*6
    re8\pp re re \repeat unfold 21 {re}

    %44
    sol4 r8 sol\f sol sol\mbreak
    re re re sol sol sol
    la la la la, la la

    %47
    re4 r8 r4 r8
    re4\p r8 r4 r8\mbreak
    re4 r8 r4 r8

    %50
    R2.
    r4 r8 mi16\ff fad sol la si sol
    mi fad sol la si sol mi fad sol la si sol

    %53
    mi4-. r8 r4 r8
    R2.\mbreak
    r4 r8 re16\f mi fad sol la fad

    %56
    re mi fad sol la fad re mi fad sol la fad
    re8 r r si'-._\markup\italic{\dynamic f sempre} lad-. si-.
    fad-. mi-. re-. si'-. lad-. si-.

    %59
    fad-. mi-. re-. si'-. lad-. si-.
    fad-. re-. mi-. fad-. re-. mi-.\mbreak
    fad4 r8 r4 r8

    %62
    re4 r8 r4 r8
    re8 r r r4 r8
    la'8\parenthesize \f la la la, la la

    %65
    re16_\markup\italic {\dynamic p e sciolte} dod re mi fad re si lad si dod re si
    sol' fad sol la si sol la sold la si dod la\mbreak
    re dod re mi fad re si lad si dod re si

    %68
    sol fad sol la si sol la sold la si dod la
    re4 r8 re,4\f r8
    re4 r8 re4 r8

    %71
    re2.\pp~
    re~
    re\mbreak

    %74
    sol\pp~
    sol
    sol

    %77
    fad4.(re)
    sol2.
    sol

    %80
    sol4.(re)
    sol4 sol8-. sol,4-. r8
    sol'8\f sol sol sol sol sol

    %83
    fad8-. la-. re,-. sol sol, sol'
    sol, sol' sol sol sol sol
    fad8-. la-. fad-. re-. mi-. fad

    %86
    sol sol, sol' sol sol sol
    fad8 la re, sol sol, sol'
    sol si re re, re re

    %89
    sol8 si, re sol,4 r8\mbreak
    R2.*8\mbreak
    r4 r8 la4-. r8

    %99
    sib4 r8 la4 r8
    sib4 r8 fad!4 r8
    sol4 r8 fad!4 r8

    %102
    sol'4-. r8 mib4-. r8\mbreak
    re4 r8 dod4 r8
    re4 r8 re4\f r8

    %105
    re4 r8 re-. fad-. la-.
    re,2.~\tenuto _\markup\italic"smorz."
    re~

    %108
    re4. r4\fermata r8
    sol4-.\p^\pizz r8 sol4-. r8\mbreak
    fad4 r8 sol4 r8

    %111
    sol4 r8 sol4 r8
    fad4 r8 re4 r8
    sol\f sol sol sol sol sol

    %114
    fad8 la re, sol sol, sol'
    sol si re re, re re
    sol4 r8 r sol sol\mbreak

    %117
    sol4 r8 r sol sol
    sol4 r8 r sol sol
    sol4 r8 mi'8-._\markup\italic{\dynamic f sempre}  red-. mi-.

    %120
    si-. la-. sol-. mi'-. red-. mi-.
    si-. la-. sol-. mi'-. red-. mi-.
    si-. sol-. la-. si-. sol-. la-.\mbreak

    %123
    si4. r4 r8
    mi,2.\parenthesize \pp
    (la)

    %126
    (re,)
    mi
    (do4-!) r8 r4 r8
    re4-! r8 r4 r8\fermata
    sol2.\pp~

    %131
    sol~\mbreak
    sol
    fad4.(re)

    %134
    sol8\f sol sol sol sol sol
    fad8 re' re, sol sol, sol'
    sol si re re, re re

    %137
    sol16_\markup\italic {\dynamic p e sciolte} fad sol la si sol mi red mi fad sol mi
    do si do re! mi do re dod re mi fad re\mbreak
    sol fad sol la si sol mi red mi fad sol mi

    %140
    do si do re! mi do re dod re mi fad re
    sol8\f sol[sol] sol sol sol
    sol,8 sol'[sol] sol sol sol

    %143
    sol,8 sol'[re] sol sol re
    sol sol re sol sol re\mbreak
    sol4 r8 re4 r8

    %146
    sol4. r4 r8\fermata

}

IIIbfn = {

    \figuremode {

        \set Staff.useBassFigureExtenders = ##t
        \override Staff.BassFigureAlignmentPositioning.direction = #DOWN


    }

}

forma = {
    \time 6/8
    \tempo 4. = 80
    s2.*146
    \bar "|."

}

IIIcrI = {
    \IIIglobal
    \clef bass
    <<\IIIcrIn \forma >>

}

IIIcrII = {
    \IIIglobal
    \clef bass
    <<\IIIcrIIn \forma >>

}

IIIclI = {
    \IIIglobal
    \clef tenor
    <<\IIIclIn \forma >>

}

IIIclII = {
    \IIIglobal
    \clef tenor
    <<\IIIclIIn \forma >>

}

IIIflI = {
    \IIIglobal
    <<\IIIflIn \forma >>

}

IIIflII = {
    \IIIglobal
    <<\IIIflIIn \forma >>

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma >>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma >>

}

IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma >>

}

IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma >>

}

IIIbs = {
    \IIIglobal
    \clef bass
    <<\IIIbsn \forma >>

}
#(set-global-staff-size 18)



\paper  {

    systems-per-page = #1
    print-first-page-number = ##t
    first-page-number = #2

}


\header {
    title = \markup\smaller\center-column{"Concerto a due Flauti Traversi [v. 3.0]" }
    composer = \markup \center-column{"D. Cimarosa (1749–1801)"}

}

\markup \huge "[1.] Allegro"

\score {

    \new StaffGroup \with {
        \override StaffGrouper.staff-staff-spacing.padding = #2
    }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{" Corni""in Ges [I]"}
                \set Staff.midiInstrument = #"french horn"
                \set Staff.shortInstrumentName = "cr1"
                \IcrI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"french horn"
                \set Staff.shortInstrumentName = "cr2"
                \set Staff.instrumentName = \markup \center-column{" Corni""in Ges [II]"}
                \IcrII
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"clarinet"
                \set Staff.shortInstrumentName = "cl1"
                \set Staff.instrumentName = \markup \center-column{"Clarinetti"" in Ges [I]"}
                \IclI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"clarinet"
                \set Staff.shortInstrumentName = "cl2"
                \set Staff.instrumentName = \markup \center-column{"Clarinetti"" in Ges [II]"}
                \IclII
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl1"
                \set Staff.instrumentName = \markup \center-column{"Flauti [I]"}
                \key sol\major
                \IflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl2"
                \key sol\major
                \set Staff.instrumentName = \markup \center-column{"Flauti [II]"}
                \IflII
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \key sol\major
                \set Staff.instrumentName = \markup \center-column{"VV.ni [I]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \key sol\major
                \set Staff.instrumentName = \markup \center-column{"VV.ni [II]"}
                \IvlII
            >>
        >>

        \new Staff <<

            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \key sol\major
            \set Staff.instrumentName = \markup \center-column{"Viole"}
            \Ivla
        >>

        \new Staff <<
            \key sol\major
            \set Staff.shortInstrumentName = "fg"
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotti"}
            \Ifg
        >>

        \new Staff  <<
            \key sol\major
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bs"
            \set Staff.instrumentName = \markup \center-column{"Bassi"}
            \Ibs
        >>
    >>


    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\pageBreak

\markup \huge "[2.] [Largo]"

\score {

    \new StaffGroup \with {
        \override StaffGrouper.staff-staff-spacing.padding = #2
    }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{" Corni""in elafa [I]"}
                \set Staff.midiInstrument = #"french horn"
                \set Staff.shortInstrumentName = "cr1"
                \IIcrI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"french horn"
                \set Staff.shortInstrumentName = "cr2"
                \set Staff.instrumentName = \markup \center-column{" Corni""in elafa [II]"}
                \IIcrII
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"clarinet"
                \set Staff.shortInstrumentName = "cl1"
                \set Staff.instrumentName = \markup \center-column{"Clar[inetti]""[I]"}
                \IIclI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"clarinet"
                \set Staff.shortInstrumentName = "cl2"
                \set Staff.instrumentName = \markup \center-column{"Clar[inetti]""[II]"}
                \IIclII
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl1"
                \set Staff.instrumentName = \markup \center-column{"Flauti [I]"}
                \key mib\major
                \IIflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl2"
                \set Staff.instrumentName = \markup \center-column{"Flauti [II]"}
                \key mib\major
                \IIflII
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \set Staff.instrumentName = \markup \center-column{"VV.ni [I]"}
                \key mib\major
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \set Staff.instrumentName = \markup \center-column{"VV.ni [II]"}
                \key mib\major
                \IIvlII
            >>
        >>

        \new Staff <<

            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \set Staff.instrumentName = \markup \center-column{"Viole"}
            \key mib\major
            \IIvla
        >>

        \new Staff <<
            \set Staff.shortInstrumentName = "fg"
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotti"}
            \key mib\major
            \IIfg
        >>

        \new Staff  <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bs"
            \set Staff.instrumentName = \markup \center-column{"Bassi"}
            \key mib\major
            \IIbs
        >>
    >>


    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\pageBreak

\markup \huge "[3.] Allegretto, ma non tanto"

\score {

    \new StaffGroup \with {
        \override StaffGrouper.staff-staff-spacing.padding = #2
    }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{" [Corni""in Ges [I]"}
                \set Staff.midiInstrument = #"french horn"
                \set Staff.shortInstrumentName = "cr1"
                \IIIcrI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"french horn"
                \set Staff.shortInstrumentName = "cr2"
                \set Staff.instrumentName = \markup \center-column{"[Corni""in Ges [II]]"}
                \IIIcrII
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"clarinet"
                \set Staff.shortInstrumentName = "cl1"
                \set Staff.instrumentName = \markup \center-column{"[Clarinetti""in Ges [I]]"}
                \IIIclI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"clarinet"
                \set Staff.shortInstrumentName = "cl2"
                \set Staff.instrumentName = \markup \center-column{"[Clarinetti""in Ges [II]]"}
                \IIIclII
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl1"
                \set Staff.instrumentName = \markup \center-column{"[Flauti [I]]"}
                \key sol\major
                \IIIflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl2"
                \set Staff.instrumentName = \markup \center-column{"[Flauti [II]]"}
                \key sol\major
                \IIIflII
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \set Staff.instrumentName = \markup \center-column{"[VV.ni [I]]"}
                \key sol\major
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \set Staff.instrumentName = \markup \center-column{"[VV.ni [II]]"}
                \key sol\major
                \IIIvlII
            >>
        >>

        \new Staff <<

            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \set Staff.instrumentName = \markup \center-column{"[Viole]"}
            \key sol\major
            \IIIvla
        >>

        \new Staff <<
            \set Staff.shortInstrumentName = "fg"
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"[Fagotti]"}
            \key sol\major
            \IIIfg
        >>

        \new Staff  <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bs"
            \set Staff.instrumentName = \markup \center-column{"[Bassi]"}
            \key sol\major
            \IIIbs
        >>
    >>


    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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