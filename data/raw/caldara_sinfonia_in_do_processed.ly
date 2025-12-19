\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

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
    \terzine \con
}


ItpIn = \relative do'' {

    do,8 do16 do mi mi sol sol do8. mi16 re8. fa16
    mi8 mi,16 mi sol sol do do mi8. sol16 fa8. la16
    sol4 r8 sol\mbreak la la16 la la8 la

    %4
    sol4 r8 sol la4 r8 la
    la fa r la sol4 r8 sol
    sol mi r sol\mbreak fa4 r8 fa

    %7
    fa fa mi mi re re16 re re re re re
    re8 sol, sol sol sol sol16 sol sol8 sol
    sol4 r r2\mbreak

    %10
    R1*3
    r2 r8 sol' sol sol\mbreak
    la r r sol la r r mi

    %15
    fa r r fad sol4 r
    r8 do,,\solo mi sol do re16 mi re8 mi16 fa
    mi8 mi, sol do mi fa16 sol fa8 sol16 la\mbreak

    %18
    sol4 r8 mi16 fa sol8 sol sol8.\tr fa32 sol
    la8 fa fa8.\tr mi32 fa sol8 mi mi8.\tr re32 mi
    fa8 re re8.\tr do32 re mi16 mi(fa sol)  fa16 fa(sol la)

    %21
    sol8 do16 sol \grace sol8 fa mi mi re16\f re re re re re\mbreak
    re4 r r2
    R1*3

    %26
    r2 r8 re16 re re8 re
    re sol,16 sol sol8 sol sol4 r
    r8 mi' mi fad16 sol fad8 re r4

    %29
    r8 re16 re re re re re re4 r8 re\mbreak
    sol,4 r r2
    r r8 re'16 re re4

    %32
    r8 re16 re re4 r8 sol la fad
    sol4 r8 re sol,4 r8 re'\mbreak
    sol, re' re re re4 r

    %35
    r8 sol, sol sol sol4 r
    r8 fa' fa fa mi4 r
    R1*11

    %48
    r2 r8 la fad re
    sol4 r8 sol la fad re re16 re\mbreak
    re8 sol, sol sol sol4 r

    %51
    r8 sol' sol[fad] sol4 r
    R1*12
    r8 mi16 fa sol4 r8 re16 fad sol4

    %65
    r8 sol la re, re4 r\mbreak
    R1*18
    r2 r8 mi mi mi

    %85
    mi4 r r8 re re re\mbreak
    re4 r r2
    R1*19\mbreak

    %106
    do,8 do16 do mi mi sol sol do8. [mi16 re8 fa]
    mi8 mi,16 mi sol sol do do mi8. [sol16 fa8. la16]
    sol4 r8 sol la la16 la la8 la

    %109
    la4 r8 la sol sol16 sol sol8 sol\mbreak
    sol4 r8 fa mi mi16 mi mi8 mi
    mi4 r r2

    %112
    R1
    r2 r8 re16 re re re re re\mbreak
    re8 sol, sol sol sol re'16 re re re re re

    %115
    re8 sol, r4 r2
    R1
    r2 r8 mi'16 fa sol8 mi\mbreak

    %118
    mi fa sol la16 sib la8 r r sol
    fa r r fad sol re16 mi fa8 re
    mi4 r r2

    %121
    R1*3
    r2 r8 do16 do do8 do
    do4 r r8 re16 re re8 re\mbreak

    %126
    re sol sol fa mi4 r
    R1
    r8 sol,16 sol sol4 r8 sol16 sol sol4

    %129
    r8 do16 mi re8. do16\mbreak do4 r8 sol
    do,4 r8 sol' do, do16 do mi8 sol
    do4 r8 sol do,4 r

}

ItpIIn = \relative do'' {

    R1
    do,8 do16 do mi mi sol sol do8. mi16 re8. fa16
    mi8 mi,16 mi sol sol do do\mbreak do8 fa16 fa fa8 fa

    %4
    mi4 r8 mi fa4 r8 fa
    fa re r fa mi4 r8 mi
    mi do r mi\mbreak re4 r8 re

    %7
    re re do do sol sol sol sol
    re' re16 re re8 re re sol, sol sol
    sol4 r r2\mbreak

    %10
    R1*3
    r2 r8 mi' mi mi\mbreak
    fa r r mi fa r r do

    %15
    re r \parenthesize r re16 re re4 r
    R1
    r8 do,\solo mi sol do re16 mi fa8 sol16 la\mbreak

    %18
    mi8 mi, sol do16 re mi8 mi mi8.\tr re32 mi
    fa8 re re8.\tr do32 re mi8 do do8.\tr si32 do
    re8 sol, r sol do16 do(re mi) re re(mi fa)

    %21
    mi8 mi \grace mi re[do] do sol16\f sol sol sol sol sol\mbreak
    sol4 r r2
    R1*3

    %26
    r2 r8 re'16 re re8[re]
    re sol,16 sol sol8 sol sol4 r
    r8 do do re16 mi re8 re16 re re re re re

    %29
    re4 r r8 re16 re re re re re\mbreak
    sol,4 r r2
    r r4 r8 re'16 re

    %32
    re4 r8 re16 re sol,4 r8 re'16 re
    re8 sol la fad sol4 r8 re\mbreak
    sol,4 r r8 re' re re

    %35
    re4 r r8 sol, sol sol
    sol re' re re do4 r
    R1*11

    %48
    r2 r8 re re re
    do4 r8 mi re re re re16 re\mbreak
    re8 sol, r4 r8 sol sol sol

    %51
    sol re' re re16 re re4 r
    R1*12
    r8 do16 re mi4 r8 re re4

    %65
    r8 do do re re4 r\mbreak
    R1*19
    r8 mi mi mi re4 r\mbreak

    %86
    r8 re re re do4 r
    R1*20
    do,8 do16 do mi mi sol sol do8.[mi16 re8. fa16]

    %108
    mi8 mi,16 mi sol sol do do do8 fa16 fa fa8 fa
    fad4 r8 fad sol re16 re re8 re\mbreak
    re4 r8 re do do16 do do8 do

    %111
    do4 r r2
    R1
    r2 r8 sol sol sol\mbreak

    %114
    sol re'16  re re re re re re8 sol, sol sol
    sol4 r r2
    R1

    %117
    r2 r8 do16 re mi8 do\mbreak
    do re mi fa16 sol fa8 r r mi
    re r r do sol sol16 do re sol, sol8

    %120
    do4 r r2
    R1*4
    r8 do16 do do8 do re4 r\mbreak

    %126
    sol,8 mi' mi re do4 r
    R1
    r4 r8 sol16 sol sol4 r8 sol16 sol

    %129
    do,4 r8 sol'\mbreak do, do'16 mi re8. do16
    do4 r8 sol do, do16 do mi8 sol
    do4 r8 sol do,4 r

}

IobIn = \relative do'' {

    r8 sol' sol fa mi sol sol fa
    mi sol r sol sol16 mi fa sol fa8 la
    sol do,16 mi sol8 sib\mbreak la4 r8 la

    %4
    sol do,16 mi sol8 sib la la16 sol la8 fa
    fa re r la' sol sol16 fa sol8 mi
    mi do r sol'\mbreak fa fa16 mi fa8re

    %7
    re si do mi r sol sol re
    re si si re re si si sol
    r16 sol si re sol8 sol~sol fa r fa~\mbreak

    %10
    fa mi r mi4 re8 r re~
    re do r do4 si8 r sol'~
    sol la16 sol sol8 la16 sol \once\stemDown fa8 re, r fa'~

    %13
    fa sol16 fa fa8 sol16 fa \once\stemDown mi8 do, r sol''\mbreak
    la sol fa mi fa mi re do
    re do si[la] sol sol'4 fa8

    %16
    mi4 r r2
    R1*4
    r2 r8 sol\f sol sol16 la\mbreak

    %22
    si8 la16 sol la8 sol16 fad sol8 re re8. fa16
    mi8 sol do8. do,16 re8 sol si8. si,16
    do8 fad la8. la,16 si8 sol r fa'

    %25
    mi la r sol fad si r la\mbreak
    sol do r la16 sol fad8 la16 sol fad mi re do
    si8 sol' sol sol sol sol sol sol

    %28
    sol sol sol sol fad re16 fad la8 fad
    sol re16 sol si8 sol la re,16 la' do8 la\mbreak
    si4 r r2

    %31
    r r8 re, fad la
    do fad, fad do si16 re sol si la8 fad
    sol16 re sol si la8 fad sol16 re si sol la8.\tr sol16\mbreak

    %34
    sol8 sol16 sol si si re re sol8.[ si,16 la8. do16]
    si8 si16 si re re sol sol si8. re,16 do8. mi16
    re8 sol,16 si re8 fa mi4 r8 mi

    %37
    mi la,16 dod mi8 sol fad4 r8 fad\mbreak
    fad? si,16 red fad8 la sol4 r8 si
    do la r la si si16 la si8 sol

    %40
    sol  mi r sol la la16 sol la8 fad
    fad? re r fad! sol sol16 fad sol8 mi\mbreak
    mi do r fad la fad re do

    %43
    si4 r8 mi sol mi do si
    la4 r8 re fad re si la
    sol4 r8 do mi do la[sol]\mbreak

    %46
    fad16 re' mi fad sol8 si4 la8 r la~
    la sol r sol4 fad8 r fad~
    fad? mi r do'16 si la8 fad! re si'

    %49
    do, re16 do do8 re16 do do8 re, r do'\mbreak
    si sol' fad mi re mi re do
    si sol'4 fad8\tr sol4 r

    %52
    R1*7
    r8 si fad red si red fad si~
    si sold4 mi8 mi4 r

    %61
    r8 la mi dod la dod mi la~\mbreak
    la fad4 re8 re4 r
    r8 sol re si sol si re[sol]~

    %64
    sol mi4 do8 re sol si8. si,16
    do8 fad la8. la,16 si8 sol' r sol\mbreak
    fad si r si la do r la

    %67
    sol si r sol fad la r fad
    mi sol sol sol fad si si si
    si, la' la la sol mi16 red mi fad sol lad\mbreak

    %70
    si4 r r2
    R1
    r8 si, red fad la fad red[la]

    %73
    sol16 si mi sol fad8 red mi4 r\mbreak
    r8 mi,\solo sol si mi16\upl mi(fad sol) fad\upl fad(sol la)
    sol8 sol, si mi sol16\upl sol(la si) la\upl la(si do)

    %76
    si4 r8 sol16 la si8 si si8.\tr la32 sol
    la8 fad r fad16 sol la8 la la8.\tr sol32 fad\mbreak
    sol8 mi r si'16 la sold\upl sold(fad sold) sold\upl sold(fad sold)

    %79
    \grace sold8 la4 r8 la16 sol? fad\upl fad(mi fad) fad\upl fad(mi fad)
    \grace fad?8 sol4 r8 sol sol16 mi do mi sol mi do mi
    la4 r8 la la16 fad re fad la fad re fad\mbreak

    %82
    si4 r8 si si16 sold mi sold si sold mi sold
    do\upl do(si la) si\upl si(la sold) la\upl mi(re do) re\upl re(do si)
    do8 do do do do si r mi

    %85
    la si do la fad re r re\mbreak
    sol la si sol mi do r mi
    fad sol la fad red si r mi

    %88
    fad sol la lad si4 r
    R1*17
    r8 sol sol fa? mi sol sol fa

    %107
    mi sol r sol sol16 mi fa sol fa8 la
    sol do,16 mi sol8 sib la4 r8 la
    la re,16 fad la8 do si4 r8 si\mbreak

    %110
    re sol,16 fa! sol8 fa mi4 r8 sol
    do fa,16 mi fa8 mi re4 r8 fad
    si mi,16 re mi8 re do4 r8 mi

    %113
    la re,16 do re8 do si sol r sol'\mbreak
    sol re re si si re re si
    si sol sol'4 r8 do, re fa

    %116
    r fa mi sol r mi fa la
    r fa re si do mi4 fa8\mbreak
    sol sib4 la16 sol la8 sol fa mi

    %119
    re do si?[la] la re16 mi fa sol la si?
    do8 sol sol sol16 fa mi8 re16 do sol'8. sib,16
    la8 do fa8. la,16 si!8 [re sol8. si,16]\mbreak

    %122
    do8 fa la8. do,16 re8 sol si8. re,16
    mi8 sol r sol la fa r fa
    sol mi r fa mi mi mi mi

    %125
    mi mi mi mi re re re re\mbreak
    re sol, si re do4 r
    R1

    %128
    r8 sol si re fa re si[fa]
    mi16 sol do mi re8\tr si\mbreak do16 sol do mi re8 si
    do16 sol mi do re8.\tr do16 do8 do mi sol

    %131
    do la fa sol do,4 r

}

IobIIn = \relative do'' {

    r8 mi mi re do mi re re
    do mi r mi mi16 do re mi re8 fa
    mi sol mi do16 mi\mbreak fa4 r8 fa

    %4
    mi sol mi do16 mi fa8 fa16 mi fa8 re
    re4 r8 fa mi mi16 re mi8 do
    do4 r8  do\mbreak re re16 do re8 si

    %7
    si sol r sol' sol re re si
    si re re si si sol r16 sol si re
    sol8 re4 mi8~mi re r re~\mbreak

    %10
    re do mi\noBeam do4 si8 re si~
    si la r la4 sol8 r si
    la la la[la] re mi16 re re8 mi16 re

    %13
    re8 si r si do re16 do do8 re16 do\mbreak
    do mi fa la la8 sol la sol fa mi
    fa mi re do si mi4 re8

    %16
    do4 r r2
    R1*4
    r2 r8 si\f si si16 la\mbreak

    %22
    sol8 re' do si16 la si8 sol r sol'~
    sol mi4 fa re mi8~
    mi do4 re8~re si do re

    %25
    r do re mi r re mi fad\mbreak
    r mi~mi16 re do si la8 fad'16 mi re do si la
    sol8 si  si si si si si si

    %28
    la la la la la re fad la
    si, re sol si re, fad la fad\mbreak
    sol4 r r2

    %31
    r r8 re re fad
    la do la fad sol si, do[la]
    si si16 re do8 la si16 re si sol la8.\tr sol16\mbreak

    %34
    sol4 r r2
    r8 sol16 sol si si re re sol8. si,16 la8. do16
    si8 re si sol16 si do4 r8 mi

    %37
    dod mi dod16 la dod8 re4 r8 fad?\mbreak
    red fad red si16 red mi4 r8 sol
    la fad r fad sol sol16 fad sol8 mi

    %40
    mi4 r8 mi fad fad16 mi fad8 re
    re4 r8 re mi mi16 re mi8 do\mbreak
    do la r la' r4 la~

    %43
    la8 sol sol4 r sol~
    sol8 fad fad4 r fad~
    fad8 mi mi4 r r8 re\mbreak

    %46 OOKK
    re la si\noBeam re4 do8 r do~
    do si r si4 la8 r la~
    la sol r sol fad re r fad

    %49
    sol sol sol sol la si16 la la8 si16 la\mbreak
    sol8 mi' re do si sol' fad mi
    re do16 si la8. sol16 sol4 r

    %52
    R1*8
    r8 mi' si sold mi sold si[mi]~
    mi dod4 la8 la4 r\mbreak

    %62
    r8 re la fad re fad la[re]~
    re si4 sol8 sol4 r
    r8 do sol mi re re'4 mi8~

    %65
    mi do4 re si mi8\mbreak
    red mi fad sol r red mi fad
    r si, re! mi r la, do red

    %68
    mi mi mi mi red red red red
    fad fad fad fad mi sol16 fad sol8 mi\mbreak
    red4 r r2

    %71
    R1
    r8 si si red fad la fad red
    mi sol, la [fad] sol4 r\mbreak

    %74
    R1
    r8 mi\solo sol si mi16\upl mi(fad sol) fad\upl fad(sol la)
    sol8 sol, si mi16 fad sol8 sol sol8.\tr fad32 mi

    %77
    fad8 red r red16 mi fad8 fad fad8.\tr mi32 red\mbreak
    mi4 r r r8 mi16 re?
    dod\upl dod(si dod) dod\upl dod(si dod) re4 r8 re16 do

    %80
    si_\upl si(la si) si si sol si do4 r8 do
    do16 la fa la do la fa la re4 r8 re\mbreak
    re16 si sol si re si sol re' mi4 r8 mi

    %83
    mi16\upl mi(re do) re\upl re(do si) do\upl do(si la) si_\upl si(la sold)
    la8 la la la la sold r si
    do re mi do la4 r8 la\mbreak

    %86
    si do re si sol4 r8 sol
    la si do la fad4 r8 si'
    si sol fad mi red4 r

    %89
    R1*17
    r8 mi mi re do mi mi re
    do mi r mi mi16 do re mi re8 fa

    %108
    mi sol mi do16 mi fa4 r8 fa
    fad la fad re16 fad sol4 r8 re\mbreak
    si sol si16 do re8 do4 r8 do

    %111
    la fa? la16 si do8 si4 r8 si
    sol mi sol16 la si8 la4 r8 la
    fa re fa16 sol la8 sol sol' sol re\mbreak

    %114
    re si si re re si si sol
    sol4 r8 sol la do r la
    si re r si do mi r do

    %117
    re fa r re mi sol mi re\mbreak
    do re mi sol fa do la' sol
    fa mi re do si si16 do re8 sol~

    %120
    sol mi mi mi16 re do4 r8 do~
    do la4 re si mi8~\mbreak
    mi do4 fa re sol8~

    %123
    sol mi fa sol r re mi fa
    r do re si do do do do
    do do do do do do do la\mbreak

    %126
    si sol16 si re8 si do4 r
    R1
    r8 sol sol si re fa re si

    %129
    do mi, fa[re]\mbreak mi mi16 sol fa8 re
    mi16 sol mi do re8.\tr do16 do8 do mi sol
    do la fa sol do,4 r

}

IvlIn = \relative do'' {

    r8 do,16 do mi mi sol sol do\upl do(re mi) re\upl re(mi fa)
    mi8 mi,16 mi sol sol do do mi\upl mi(fa sol) fa\upl fa(sol la)
    sol mi do mi sol mi do mi\mbreak la fa do fa la fa do fa

    %4
    sol mi do mi sol mi do mi la sol fa mi fa mi re dod
    re\upl re(dod re) re re(dod re) sol fa mi re mi re do si!
    do\upl do(si do)  do\upl do(si do)\mbreak fa mi re do re do si la

    %7
    si sol la si do re mi fad sol sol si si sol sol re re
    si si re re si si sol sol re re sol sol re re si si
    sol4 r8 sol'' sol16(fa) fa\upl re'\upl re8 fa,\mbreak

    %10
    fa16(mi) mi\upl do'\upl do8 mi, mi16(re) re\upl si'\upl si8 re,
    re16(do) do\upl la'\upl la8 do, do16(si) si\upl sol'\upl sol8 si,
    la16 sol' la sol la, sol' la sol la, fa' sol fa la, fa' sol fa

    %13
    si, fa' sol fa si, fa' sol fa do mi fa mi do mi fa mi\mbreak
    la la sol sol fa fa mi mi fa fa mi mi re re do do
    re re do do si si la la sol8 sol, r4

    %16
    R1*5
    r2 r16 sol''\f sol sol sol la si do\mbreak
    re si la sol la la sol fad sol si re8 r16 re, mi fa

    %23
    mi sol do8 r16 mi, re mi re sol si8 r16 si, do re
    do fad la8 r16 la, si do si re sol8 r16 fa[\tuplet 3/2 { fa (mi re)] }
    mi do la'8 r16 sol\tuplet 3/2 { sol(fad mi)} fad re si'8 r16 la\tuplet 3/2 { la(sol fad) }\mbreak  %%% fine p 12

    %26
    sol mi do'8~do16 si la sol fad sol la sol fad mi re do
    si sol' fad sol si, sol' fad sol si, sol' fad sol si, sol' fad sol
    la, sol' fad sol la, sol' fad sol fad re fad la fad re fad la

    %29
    sol re sol si sol re sol si la re, la' do la re, la' do\mbreak
    si8 re\p~re16(sol,) la8\upl r si~si16(sol) la8\upl
    r sol~sol16 mi fad sol fad fad re\f re fad fad la la

    %32
    do do la la fad fad do do si re sol si la(sol) fad fad
    sol re sol si la(sol) fad fad sol re si sol la8.\tr sol16\mbreak
    sol8 sol,16 sol si si re re sol_\upl sol(la si) la_\upl la(si do)

    %35
    si8 si,16 si re re sol sol si-\upl si(do re) do\upl do(re mi)
    re si sol si re si sol re' mi do sol do mi do sol do
    mi dod la dod mi dod la dod fad re la re fad re la re\mbreak

    %38
    fad? red si red fad red si red sol mi si mi sol mi si mi
    fad\upl fad(mi fad) fad\upl fad(mi fad) si la sol fad sol fad mi red
    mi\upl mi(red mi) mi\upl mi(red mi) la sol fad mi fad mi re dod

    %41
    re\upl re(dod re) re\upl re(dod re) sol fad mi re mi re do si\mbreak  %% fine p. 16
    do do la la do do fad fad la la fad fad re re do do
    si si sol sol si si mi mi sol sol mi mi do do si si

    %44
    la la fad fad la la re re fad fad re re si si la la
    sol sol mi mi sol sol do do mi mi do do la la sol sol\mbreak
    fad8 re r re'~re16(do) do\upl la' la8 do,~

    %47
    do16(si) si\upl sol' sol8\upl si,~si16(la) la\upl fad'\upl fad8 la,~
    la16(sol) sol mi' mi8 sol, fad16 re' mi re fad, re' mi re
    sol, do re do sol do re do la do re do la do re do\mbreak

    %50
    si si sol' sol fad fad mi mi re re mi mi re re do do
    si8 sol' sol,, fad'' sol sol,,\p sol sol
    sol sol' fad re sol sol, sol sol

    %53
    sol4 r sol'8 sol, si re\mbreak
    sol fad? mi mi la la, r la'
    fad mi re [re] sol sol, r sol

    %56
    re' re red red mi mi mi mi
    fad mi red[si] mi4 r\mbreak
    mi r fad r

    %59
    r16 si\f si si si dod red mi fad red dod si fad' la sol fad
    sold mi mi mi mi fad sold la si sold fad mi si' re dod si
    \once\stemDown  dod la, la la la si dod re mi dod si la mi' sol? fad mi\mbreak

    %62
    fad re re re re mi fad sol la fad mi re la' do! si la
    \once\stemDown si sol, sol sol sol la si do re si la sol re' fa! mi re
    mi do sol'8 r16 mi re do re si sol'8 r16 re do si

    %65
    do la la'8 r16 do, si la si sol sol'8 r16 sol\tuplet 3/2 { sol(fad mi) }\mbreak
    red si si'8 r16 si\tuplet 3/2 { si(la sol) } la si, la'8 r16 la \tuplet 3/2 { la(sol fad) }
    sol si, sol'8 r16 sol\tuplet 3/2 { sol(fad mi) } fad si, fad'8 r16 fad \tuplet 3/2 { fad(mi red)}

    %68
    mi lad, mi'8 r16 sol \tuplet 3/2 { sol(fad mi) } red si' la si red, si' la si
    si, la' sol la si, la' sol la sol fad? mi red mi fad! sol lad\mbreak
    si8 fad\p~fad16(red) sol8 r sol~sol16 (mi) fad8

    %71
    r la~la16(fad) si8 r si~si16 sol fad mi
    red red si si red red fad fad la la fad fad red red la la
    sol si mi sol fad(mi) red red mi si sol mi sol8. fad?16\mbreak

    %74
    mi4 r r2
    R1*3\mbreak
    r8 sol\p sol sol si si si si

    %79
    la la la la la la la la
    sol sol sol sol sol sol do[do]
    do do do do la la re[re]\mbreak

    %82
    re re re re si si mi mi
    mi la, re,[mi] la,4 r
    r2 r16 mi''\f mi mi fad fad sold sold

    %85
    la la si si do do la la fad re re re mi mi fad fad\mbreak %% fine p 27
    sol sol la la si si sol sol mi do do do re re mi mi
    fad fad sol sol la la fad fad red red si' si la la sol sol

    %88
    fad fad sol sol fad fad mi mi \once\stemDown red8 si, r si''\solo
    si16 sold32 la si16 sold mi si' do re do mi,(fa? mi) r re si' re,\mbreak
    do(mi la do) r si re sold, \grace sold8 la4 r8 la

    %91
    la16 fad32 sol? la16 fad re la' si do si re, mi re r do la' do,
    si(re sol si) r la do fad,\grace fad8 sol4 r8 mi
    fa!16\upl fa(mi fa) fa sol la sol32 fa fa8 mi r fad\mbreak

    %94
    sol16 sol(fad sol) sol la si la32 sol sol8 fad r sold
    la16\upl la(sold la) la [si] do16. si64 la la8 sold r si16 mi,
    do' mi, do' mi, do' mi, do' mi, fa re' re8 r16 la re do

    %97
    si fa si fa si fa si fa mi do' do8 r16 sol do si\mbreak
    la mi la mi la mi la mi re si' si8 r16 fad si la
    sold re sold re sold re sold re do la' la8 r16 mi la sold

    %100
    la red, la' red, la' red, la' red, mi si' sold si mi, si' sold si
    mi, do' la do mi, do' la do mi, re' si re mi, re' si re\mbreak
    mi, do' si do mi, do' si do mi, do' la do mi, do' la do

    %103
    mi, si' la si mi, si' la si mi, si' sold si mi, si' sold si
    la sold? fa mi red mi la, si mi, sold! si re sold! si re, mi
    do mi la mi si'8.\tr la16 la4 r\mbreak

    %106
    r8 do,,16\f do mi mi sol sol do\upl do(re mi) re\upl re(mi fa)
    mi8 mi,16 mi sol sol do do mi\upl mi(fa sol) fa\upl fa(sol la)
    sol mi do mi sol mi do mi\mbreak la fa do fa la fa do fa

    %109
    la fad re fad la fad re fad si sol re sol si sol re sol\mbreak
    re' do si la si la sol fa? mi\upl mi(red mi) mi\upl mi(red mi)
    do' si la sol la sol fa mi re\upl re(dod re) re\upl re(dod re)

    %112
    si' la sol fa sol fa mi re do!\upl do(si do) do\upl do(si do)
    la' sol fa mi fa mi re do si si sol sol si si re re\mbreak
    sol sol re re si si sol sol re re sol sol re re si si

    %115
    sol4 r8 do' do16(la) la fa'\upl fa8 do
    re16(si) si re\upl sol8 mi mi16(do) do\upl la'\upl la8 fa
    fa16(re) re\upl si'\upl re8 fa, mi16 do' re do mi, do' re do\mbreak

    %118
    mi, sib' do sib mi, sib' do sib la la sol sol fa fa mi mi
    re re do do si? si la la sol8 sol, r4
    r16 do' do do do re mi fa sol mi re do sol' sib, la sol

    %121
    la do fa8 r16 la, si! do si re sol8 r16 si, do re\mbreak
    do fa la8 r16 do, re mi re sol si8 r16 re, mi fa
    mi sol do8 r16 sib\tuplet 3/2 { sib(la sol) } la dod, re8 r16 la'\tuplet 3/2 { la(sol fa) }

    %124
    sol si, do8 r16 fa \tuplet 3/2 { fa(mi re) } mi do' si do mi, do' si do
    mi, do' si do mi, do' si do re, do' si do re, do' si do\mbreak
    si sol si do si sol si do do8 sol\p~ sol16(mi) fa8

    %127
    r mi~mi16(do) re8 r do~do16 la si do
    si si sol\f sol si si re re fa fa re re si si fa fa
    mi sol do mi \tuplet 3/2 { re(do si)} si8\tr\mbreak do16 sol do mi \tuplet 3/2 { re(do si)} si8\tr

    %130
    do16 sol mi do re8.\tr do16 do8 do16 do mi mi sol sol
    do do la la fa fa sol sol do,4 r

}

IvlIIn = \relative do'' {

    R1
    r8 do,16 do mi mi sol sol do\upl do(re mi) re\upl re(mi fa)
    mi8 sol r mi\mbreak fa8 la r fa

    %4
    mi sol r mi do la'4 fa8
    re16\upl re(dod re) re\upl re(dod re) mi8 sol4 mi8
    do?16\upl do(si do) do\upl do(si do)\mbreak re8 fa4 re8

    %7
    si16 sol la si do re mi fad sol sol si si sol sol re re
    si si re re si si sol sol re re sol sol re re si si
    sol4 r8 mi''~mi re fa [re]~\mbreak

    %10
    re do mi\noBeam do4 si8\noBeam re si~
    si la do\noBeam la4 sol8\noBeam si sol'~
    sol fa r fa~fa mi re[do]

    %13
    si sol si[re] mi sol mi do\mbreak
    r8 do la'16 la sol fa la la sol sol fa fa mi mi
    fa fa mi mi re re do do si8 sol, r4

    %16
    R1*5
    r2 r16 sol'\f si re sol8 sol16 la\mbreak
    si re, do si mi do si la re8[si] sol re'

    %23
    r mi la do r re, sol si
    r do, fad la r si,~si16 la la8
    sol do~do16 si si8 la re~re16 do do8\mbreak

    %26
    si mi mi16 re do8 do16 si la8 r la
    sol16 si si8 sol16 si si8 sol16 si si8 sol16 si si8
    do16 mi mi8 do16 mi mi8 re16 fad fad8 re16 fad fad8

    %29
    sol re r sol fad16 re fad la fad re fad la\mbreak
    sol4 r8 sol\parenthesize \p ~sol16(mi) fad8\upl r mi~
    mi16 (do) re8\upl r do16 si la re fad\f fad la, re fad fad

    %32
    re, fad la la re, fad la la sol si si8 \tuplet 3/2 { do16(si la) } la8
    sol16 si si8 \tuplet 3/2 { do16(si la) } la8 sol sol sol fad\mbreak
    sol4 r r2

    %35
    r8 sol,16 sol si si re re sol _\upl sol \parenthesize (la si) la_\upl la(si do)
    si8 re r si do mi r mi
    dod mi r dod re fad r fad\mbreak

    %38
    red fad r red mi sol4 mi8
    fad16\upl fad( mi fad) fad\upl fad(  mi fad) sol8 si4 sol8
    mi16\upl mi(red mi) mi\upl mi(red mi) fad8 la4 fad8

    %41
    re?16 re(dod re) re\upl re(dod re) mi8 sol4 mi8\mbreak
    mi16 mi do? do la la la' la la fad re fad la re, fad la
    sol re si si sol sol sol' sol sol mi do mi sol do, mi sol

    %44
    fad do la la fad fad fad' fad fad re si re fad si, re fad
    mi si sol si mi, mi mi' mi mi do la do mi la, do mi\mbreak
    fad,8 re r si''4 la8 do la~

    %47
    la sol si\noBeam sol4 fad8 la fad~
    fad mi do'8. si16 la8 fad re4
    r8 sol mi do r la fad re\mbreak

    %50
    si' mi16 mi re re do do si si sol' sol fad fad mi mi
    re8 sol sol,, fad'' sol sol,,\p sol sol
    sol sol' fad re sol sol, sol sol

    %53
    sol4 r sol'8 sol, si re\mbreak
    sol fad? mi mi la la, r la'
    fad mi re [re] sol sol, r sol

    %56
    re' re red red mi mi mi mi
    fad mi red[si] mi4 r\mbreak
    mi r fad r

    %59
    r16 si\f si si si dod red mi fad red dod si fad' la sol fad
    sold mi mi mi mi fad sold la si sold fad mi si' re dod si
    \once\stemDown  dod la, la la la si dod re mi dod si la mi' sol? fad mi\mbreak

    %62
    fad re re re re mi fad sol la fad mi re la' do! si la
    \once\stemDown si sol, sol sol sol la si do re si la sol re' fa! mi re
    mi8 mi sol do r re, sol si

    %65
    r do, fad la r si, mi sol\mbreak
    fad si, r sol'~sol16 fad fad8 r fad~
    fad16 mi mi8 r mi~mi16 re re8 r fad

    %68
    mi16 do lad8 si dod si red fad si
    si, red fad la sol sol16 fad sol8 mi\mbreak
    red si r red\parenthesize \p ~red16 (si) mi8 r mi~

    %71
    mi16(dod) fad8 r fad~fad16(red) sol8 r la16 sol
    fad si, red red fad, si red red si, red fad fad si, red fad fad
    mi sol sol8 la16(sol) fad fad mi8 mi mi red\mbreak

    %74
    mi4 r r2
    R1*3\mbreak
    r8 mi\p mi mi mi mi mi mi

    %79
    la la la la re, re re re
    sol sol sol sol mi mi mi mi
    fa fa fa fa sold sold sold sold\mbreak

    %82
    sold sold sold sold sold sold sold sold
    la la re, mi la,4 r
    r2 r16 mi''\f mi mi fad fad sold sold

    %85
    la la si si do do la la fad re re re mi mi fad fad\mbreak %% fine p 27
    sol sol la la si si sol sol mi do do do re re mi mi
    fad fad sol sol la la fad fad red si sol' sol fad fad mi mi

    %88
    red red si' si la la sol sol fad4 r
    r8 <<{mi8\p mi mi}\\{si si si}>> r <<{mi8 mi mi}\\{do si si}>>
    r <<{la' la sold}\\{do, si si}>> r <<{la' la mi}\\{do do si}>>

    %91
    r <<{re re re}\\{la la la}>> r <<{re re re}\\{si la la}>>
    r <<{sol' sol fad}\\{si, la la}>> r <<{sol' sol mi}\\{si la la}>>
    r <<{do re re}\\{la sol sol}>>  r <<{do do re}\\{sol, la la}>>\mbreak

    %94
    r <<{re mi mi}\\{si la la}>> r <<{re re mi}\\{la, si si}>>
    r <<{mi fad fad}\\{do si si}>> r <<{mi sold sold}\\{si, mi mi}>>
    r <<{la la la}\\{do, do do}>> r <<{fa fa fa}\\{re re re}>>

    %97
    r <<{fa fa fa}\\{re re re}>> r <<{mi mi mi}\\{do do do}>>\mbreak
    r <<{mi mi mi}\\{do do do}>>  r <<{re re re}\\{si si si}>>
    r <<{re re re}\\{si si si}>> r <<{do do do}\\{la la la}>>

    %100
    r <<{la' la la sold4}\\{red8 red red mi4}>> r8 <<sold\\si,>>
    <<{la'[la]}\\{do,[do]}>> r <<{la' si[si]}\\{do, si[si]}>> r <<si'\\re,>>\mbreak
    <<{si'[si]}\\{do,[do]}>> r <<{si' la[la]}\\{do, do[do]}>> r <<la'\\do,>>

    %103
    <<{la'[la]}\\{si,[si]}>> r <<{la' sold[sold]}\\{si, si[si]}>> r <<sold'\\re>>
    <<{la' do, do do}\\{mi la, la la}>> r <<{mi' mi mi}\\{si si si}>>
    <<{mi la4 sold8 la4}\\{do,8\stemUp do, re mi la,4}>> r\mbreak

    %106
    R1
    r8 do16\parenthesize \f do mi mi sol sol do\upl do(re mi) re\upl re(mi fa)
    mi8 sol r mi fa la r la

    %109
    fad la r fad sol si r re,\mbreak
    re sol4 re8 mi16\upl mi(red mi) mi\upl mi(red mi)
    mi8 fa4 do8 re16\upl re(dod re) re\upl re(dod re)

    %112
    re8 mi4 si8 do!16\upl do(si do) do\upl do(si do)
    do8 re4 sol,8 si16 si sol sol si si re re\mbreak
    sol sol re re si si sol sol re re sol sol re re si si

    %115
    sol4 r8 do'~do la4 re8~
    re si4 mi do fa8~
    fa re si[sol] do mi sol fa\mbreak

    %118
    mi re do mi fa16 do do do la' la sol sol
    fa fa mi mi re re do do sol8 sol, r4
    r16 do mi sol do8 do16 re mi8 sol mi do

    %121
    r la re fa r si, mi sol\mbreak
    r do, fa la r re, sol re
    mi do r sol'~sol16 fa fa8 sol fa~

    %124
    fa16 mi mi8 fa re do16 mi mi8 do16 mi mi8
    do16 mi mi8 do16 mi mi8 fa16 la la8 fa16 la la8\mbreak
    sol16 si si8 si16 re fa,8 mi4 r8 do\parenthesize \p ~

    %127
    do16 la si8 r la~la16(fa) sol8 r fa16 mi
    re sol si\f si re, sol si si sol, si re re sol, si re re
    do mi mi8 \tuplet 3/2 { fa16(mi re) } re8\tr \mbreak do16 mi mi8 \tuplet 3/2 { fa16(mi re) } re8\tr

    %130
    do do do8. si16 do8 do16 do mi mi sol sol
    do do la la fa fa sol sol do,4 r

}

Ivlan = \relative do' {

    do'8 do, do do do do' si sol
    do do, do do do4 r
    do'8 do, do do\mbreak do do do do

    %4
    do mi mi sol fa fa fa fa
    fa4 r mi8 mi mi mi
    mi4 r\mbreak re8 re re re

    %7
    re sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol16 la si8 do la la re,[sol]\mbreak

    %10
    sol sol do, fa fa fa si, mi
    mi mi la, re re re sol, re'
    re re re re re re re re

    %13
    sol sol sol sol do, do do do\mbreak
    fa4 r fa r
    fa r sol r

    %16
    do8\p do, do do do do' si sol
    do do, do do do4 r\mbreak
    do'8 do, mi [sol] do do, r do

    %19
    fa fa, r fa' do' do, r la'
    fa sol r sol mi do r si
    do mi fa[fa] sol sol sol sol\mbreak

    %22
    sol si do [re] sol, sol sol sol
    sol sol la la re, re sol sol
    do, do la' la re,[r16 sol, la8 si]

    %25
    do[r16 la si8 do] re[r16 si do8 re]\mbreak
    mi [r16 re] do8 do re re re fad
    sol sol fad fad mi mi re re

    %28
    do do do do re re re re
    re re re re re re re re\mbreak   %%% fine p. 13
    sol4 r8 mi~mi16(do) re8\upl r do~

    %31
    do16(la) si8_\upl r do re re re re
    re re re re sol mi do[re]
    si sol do re si sol do re\mbreak

    %34
    sol sol, sol sol sol sol' fa! re
    sol sol, sol sol sol4 r
    sol'8 sol sol sol sol sol sol sol

    %37
    la la la la la la la la\mbreak
    si si si si si si si si
    la do, do do si mi mi si

    %40
    si si si si la re re la
    la la la la sol do do sol\mbreak
    la la la la re re re re

    %43
    re re re si do do do do
    do do do la si si si si
    si si si sol la la la la\mbreak

    %46
    la la re[sol,] la la' la re,
    re re sol do, do do fad si,
    si si mi[la,] la la si re

    %49
    mi mi mi mi fad fad fad fad\mbreak
    sol4 r sol r
    sol8 la re re, sol4 r

    %52
    R1*7
    r8 red red si red fa fa fa
    mi mi mi mi mi mi sold sold

    %61
    la mi mi mi mi mi dod[dod]\mbreak
    re re re re re re fad fad
    sol re re re re re si[si]

    %64
    do do do do sol' sol sol sol
    mi mi la la re, re sol la\mbreak
    si[r16 sol fad8 mi] fad[r16 fad mi8 red]

    %67
    mi[r16 mi re!8 do] re[r16 re do8 si]
    do[r16 do si8 lad] si si si si
    red red red red mi mi do[do]\mbreak

    %70
    r8 si4 r8 si16 sol do8  r dod
    dod?16(la) re8 r red red16 si mi8 r la,
    si si si si si si si si

    %73
    mi do la[si] mi sol la si\mbreak  %%% fin qui OOKK
    mi, mi mi mi mi mi red[si]
    mi mi mi mi mi4 r

    %76
    mi8 mi, sol si mi mi mi mi
    fad fad la fad red si si si\mbreak
    mi4 r r2

    %79
    R1*4
    r2 r8 la re, mi
    la, red red red mi16 sold sold sold la la si si

    %85
    do do re re mi mi do do la fad fad fad  sol sol la la\mbreak
    si si do do re re si si sol mi mi mi fad fad sol sol
    la la si si do do la la fad red si8 r4

    %88
    si r si r8 si'16 la
    sold8 sold sold sold la la sold sold\mbreak

    %90
    la la mi mi la, la' la la16 sol?
    fad8 fad fad fad sol sol fad fad
    sol sol re re sol, sol' sol sol,

    %93
    la la si si do do do do\mbreak
    si si dod dod re re re re
    do? do red red mi mi mi mi

    %96
    la la la la re,? re re re
    sol sol sol sol do, do do do\mbreak
    fa fa fa fa si, si si si

    %99
    mi mi mi mi la, la la la
    fa' fa fa fa mi mi mi mi
    r mi mi mi r mi mi mi\mbreak

    %102
    r mi mi mi r mi mi mi
    r mi mi mi r mi mi mi
    la la la la sold sold sold sold

    %105
    la do, re mi la,16 la' [sol fa] mi re do si\mbreak
    do8 do do do do do' si la
    do do, do do do4 r

    %108
    do'8 do, do do do do do do
    re re re re re re re re\mbreak
    sol sol sol sol sol sol sol sol

    %111
    la la la la re,4 r
    sol8 sol sol sol do,4 r
    fa8 fa fa fa re si sol[sol']\mbreak

    %114
    sol sol sol sol sol sol sol sol
    sol sol sol sol fa fa re[re]
    sol sol mi mi la la fa fa

    %117
    re re sol sol sol do, do do\mbreak
    do do do do do4 r
    fa r sol r8 sol16 fa

    %120
    mi8 mi mi mi mi mi mi mi
    do do re re re re mi mi\mbreak
    mi mi fa fa sol sol si si

    %123
    do[r16 do, re8 mi] fa[r16 fa mi8 re]
    mi[r16 mi re8 sol] do do si si
    la la sol sol fa fa fa fa\mbreak

    %126
    sol sol sol sol do,4 r8 la'~
    la16(fa sol8) r fa~fa16(re mi8) r fa
    sol sol\f[sol sol] sol sol sol sol

    %129
    do la fa sol\mbreak mi[do] fa sol
    mi do fa sol mi do mi sol
    do la fa sol do,4 r

}

Ifgn = \relative do {

    do'8 do, do do do do' si sol
    do do, do do do4 r
    do'8 do, do do\mbreak fa fa fa fa

    %4
    do' do, do do fa4 r8 fa
    fa fa fa fa mi4 r8 mi
    mi mi mi mi\mbreak re4 r8 re

    %7
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol16 la si8 do re re, r si'\mbreak

    %10
    do do, r la' si si, r sol'
    la la, r fad' sol sol, r sol'
    re re re re re re re re

    %13
    sol sol sol sol do, do do do\mbreak
    fa4 r fa r
    fa r sol8 sol16 la si sol la si

    %16
    do8\p do, do do do do' si sol
    do do, do do do4 r\mbreak
    do'8 do, mi [sol] do do, r do

    %19
    fa fa, r fa' do' do, r la'
    fa sol r sol mi do r si
    do mi fa[fa] sol sol sol sol\mbreak

    %22
    sol si do re si si si si
    do do la la si si sol sol
    la la fad fad sol [r16 sol, la8 si]

    %25
    do[r16 la si8 do] re[r16 si do8 re]\mbreak
    mi [r16 re] do8 do re re re fad
    sol sol fad fad mi mi re re

    %28
    do do do do re re re re
    re re re re re re re re\mbreak   %%% fine p. 13
    sol4 r8 mi~mi16(do) re8\upl r do~

    %31
    do16(la) si8_\upl r do re re re re
    re re re re sol mi do[re]
    si sol do re si sol do re\mbreak

    %34
    sol sol, sol sol sol sol' fa! re
    sol sol, sol sol sol4 r
    sol'8 sol, sol sol do do do do

    %37
    la' la, la la re re re re\mbreak
    si' si, si si mi mi mi mi
    la la la la sol4 r8 sol

    %40
    sol sol sol sol fad4 r8 fad
    fad? fad fad fad mi4 r8 mi\mbreak
    la la la la fad fad fad fad

    %43
    sol sol sol sol mi mi mi mi
    fad fad fad fad re re re re
    mi mi mi mi do do do do\mbreak

    %46
    re re'16 do si la sol8 la la, r fad'
    sol sol, r mi' fad fad, r re'
    mi mi, r do' re re re re

    %49
    mi mi mi mi fad fad fad fad\mbreak
    sol4 r sol r
    r2 r8 sol,^\markup\italic "Fagotto 1. solo" si re

    %52
    <<
        {
            sol la16 si la8 si16 do si8 si, re sol
            si8 do16 re do8 re16 mi re4 r8 si16 do\mbreak
            re8 re re8.\tr do32 si do16 la sold la la8 la16 si

            %55
            do8 do do8.\tr si32 la si16 sol fad sol sol8 si~
            si la4 do si mi8
            la, la la8.\tr sol32 fa sol4 r8 si16 si\mbreak

            %58
            mi mi re re do do si si la la lad lad lad8.\tr si16
            si8 si, r si'
        }\\{
            r2 r8 sol,_\markup\italic "Fagotto 2." si re
            sol la16 si la8 si16 do si8 si, re sol16 la\mbreak
            si8 si si8.\tr la32 sold la8 mi la, fad'16 sol?
            la8 la la8.\tr sol32 fa sol8 re sol,[sol']~
            sol fad4 la sol16 fad sol8 sol
            fad fad fad8.\tr mi32 red mi8 si'16 si mi mi re re\mbreak
            do do si si la la sol sol fad fad mi mi re re dod dod
            si4 r
        }
    >> si'8\tu si, si si
    mi mi' mi mi mi mi, mi mi

    %61
    la, la' la la la la, la la\mbreak
    re re' re re re re, re re
    sol, sol' sol sol sol sol, sol sol

    %64
    do do' do do si si sol sol
    la la fad fad sol sol sol la\mbreak
    si[r16 sol fad8 mi] fad[r16 fad mi8 red]

    %67
    mi[r16 mi re!8 do] re[r16 re do8 si]
    do[r16 do si8 lad] si si si si
    red red red red mi mi do[do]\mbreak

    %70
    si4 r r2
    R1
    r8 si [si si] si si si si

    %73
    mi do la[si] mi sol la si\mbreak
    mi, mi mi mi mi mi red[si]
    mi mi mi mi mi4 r

    %76
    mi8 mi, sol si mi mi mi mi
    fad fad la fad red si si si\mbreak
    mi4 r r2

    %79
    R1*4
    r2 r8 la re, mi
    la, red red red mi mi' [mi re]

    %85
    do si la la re re re do\mbreak
    si la sol sol do do do si

    %87
    la sol fad fad si4 r
    si, r si r
    R1*16

    %105
    r2 r16 la' [sol fa] mi re do si\mbreak
    do8 do do do do do' si la
    do do, do do do4 r

    %108
    do'8 do, do do fa fa fa fa
    re' re, re re sol sol sol sol\mbreak
    si4 r8 si do do do do

    %111
    \parenthesize la4 r8 \parenthesize la si si si si
    sol4 r8 sol la la la la
    fa4 r8 fa sol sol sol sol\mbreak

    %114
    sol sol sol sol sol sol sol sol
    sol sol16 fa mi8 mi fa fa, r fa'
    sol sol, r sol' la la, r la'

    %117
    si si, r si' do do, do do\mbreak
    do do do do fa4 r
    fa r sol r8 sol16 fa

    %120
    mi8 mi mi mi mi mi do mi
    fa fa re re sol sol mi mi\mbreak
    la la fa fa sol sol si si

    %123
    do[r16 do, re8 mi] fa[r16 fa mi8 re]
    mi[r16 mi re8 sol] do do si si
    la la sol sol fa fa fa fa\mbreak

    %126
    sol sol sol sol do,4 r
    R1
    r8 sol'\f [sol sol] sol sol sol sol

    %129
    do la fa sol\mbreak mi[do] fa sol
    mi do fa sol mi do mi sol
    do la fa sol do,4 r

}

Itmpn = \relative do {

    do8 do do do do4 r8 sol
    do do do do do4 r
    do r\mbreak r2

    %4
    do4 r r2
    R1*2
    r2 sol4 r8 sol

    %8
    sol4 r8 sol sol4 r8 sol
    sol4 r r2\mbreak
    R1*3

    %13
    r2 r8 do do do\mbreak
    do4 r r2
    r r8 sol sol sol

    %16
    do4 r r2
    R1*4
    r2 r8 sol sol sol\mbreak

    %22
    sol4 r r2
    R1*4
    sol4 r sol r

    %28
    R1*2\mbreak
    sol4 r r2
    R1*3\mbreak

    %34
    sol8 sol sol sol sol4 r
    sol8 sol sol sol sol4 r
    r8 sol sol sol do4 r

    %37
    R1*69
    do8 do do do do4 r8 sol
    do do do do do4 r

    %108
    do r r2
    r sol4 r8 sol\mbreak
    sol sol sol sol do4 r

    %111
    R1*2
    r2 r4 r8 sol\mbreak
    sol4 r8 sol sol4 r8 sol

    %115
    sol4 r r2
    R1*2\mbreak
    do4 r r2

    %119
    r r8 sol sol sol
    do4 r r2
    R1*3

    %124
    r2 do4 r
    do r r2\mbreak
    r8 sol sol sol do4 r

    %127
    R1
    r4 r8 sol sol4 r8 sol
    do4 r8 sol\mbreak do4 r8 sol

    %130
    do4 r8 sol do do do do
    do4 r8 sol do4 r

}

Ibcn = \relative do {

    do'8 do, do do do do' si sol
    do do, do do do4 r
    do'8 do, do do\mbreak fa fa fa fa

    %4
    do' do, do do fa4 r8 fa
    fa fa fa fa mi4 r8 mi
    mi mi mi mi\mbreak re4 r8 re

    %7
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol16 la si8 do re re, r si'\mbreak

    %10
    do do, r la' si si, r sol'
    la la, r fad' sol sol, r sol'
    re re re re re re re re

    %13
    sol sol sol sol do, do do do\mbreak
    fa4 r fa r
    fa r sol8 sol16 la si sol la si

    %16
    do8 do, do^\markup\italic{Violoncello \dynamic p}[do] do do' si sol
    do do, do do do4 r\mbreak
    do'8 do, mi [sol] do do, r do

    %19
    fa fa, r fa' do' do, r la'
    fa sol r sol mi do r si
    do mi fa[fa] sol sol\tu sol sol\mbreak

    %22
    sol si do re si si si si
    do do la la si si sol sol
    la la fad fad sol [r16 sol, la8 si]

    %25
    do[r16 la si8 do] re[r16 si do8 re]\mbreak
    mi [r16 re] do8 do re re re fad
    sol sol fad fad mi mi re re

    %28
    do do do do re re re re
    re re re re re re re re\mbreak   %%% fine p. 13
    sol4 r r2

    %31
    r r8 re re re
    re re re re sol mi do[re]
    si sol do re si sol do re\mbreak

    %34
    sol sol, sol sol sol sol' fa! re
    sol sol, sol sol sol4 r
    sol'8 sol, sol sol do do do do

    %37
    la' la, la la re re re re\mbreak
    si' si, si si mi mi mi mi
    la la la la sol4 r8 sol

    %40
    sol sol sol sol fad4 r8 fad
    fad? fad fad fad mi4 r8 mi\mbreak
    la la la la fad fad fad fad

    %43
    sol sol sol sol mi mi mi mi
    fad fad fad fad re re re re
    mi mi mi mi do do do do\mbreak

    %46
    re re'16 do si la sol8 la la, r fad'
    sol sol, r mi' fad fad, r re'
    mi mi, r do' re re re re

    %49
    mi mi mi mi fad fad fad fad\mbreak
    sol4 r sol r
    sol8 si re re, sol sol,\pp sol sol

    %52
    sol sol' fad re sol sol, sol sol
    sol4 r sol'8 sol, si re\mbreak
    sol fad? mi mi la la, r la'

    %55
    fad mi re [re] sol sol, r sol
    re' re red red mi mi mi mi
    fad mi red[si] mi4 r\mbreak

    %58
    mi r fad r8 fad,
    si si' si si si si, si si
    mi mi' mi mi mi mi, mi mi

    %61
    la, la' la la la la, la la\mbreak
    re re' re re re re, re re
    sol, sol' sol sol sol sol, sol sol

    %64
    do do' do do si si sol sol
    la la fad fad sol sol sol la\mbreak
    si[r16 sol fad8 mi] fad[r16 fad mi8 red]

    %67
    mi[r16 mi re!8 do] re[r16 re do8 si]
    do[r16 do si8 lad] si si si si
    red red red red mi mi do[do]\mbreak

    %70
    si4 r8 si^\markup\italic{Violoncello solo} si16 sol do8  r dod
    dod?16(la) re8 r red red16 si mi8 r la,
    si si\tu [si si] si si si si

    %73
    mi do la[si] mi sol la si\mbreak
    mi,4 r r2
    R1*9

    %84
    r2 r8 mi'[mi re]
    do si la la re re re do\mbreak
    si la sol sol do do do si

    %87
    la sol fad fad si4 r
    si, r si r8 si'16^\markup\italic "Violoncello solo" la
    sold8 sold sold sold la la sold sold\mbreak

    %90
    la la mi mi la, la' la la16 sol?
    fad8 fad fad fad sol sol fad fad
    sol sol re re sol, sol' sol sol,

    %93
    la la si si do do do do\mbreak
    si si dod dod re re re re
    do? do red red mi mi mi mi

    %96
    la la la la re,? re re re
    sol sol sol sol do, do do do\mbreak
    fa fa fa fa si, si si si

    %99
    mi mi mi mi la, la la la
    fa' fa fa fa mi mi mi mi
    r mi mi mi r mi mi mi\mbreak

    %102
    r mi mi mi r mi mi mi
    r mi mi mi r mi mi mi
    la la la la sold sold sold sold

    %105
    la do, re mi la,16 la'\tu [sol fa] mi re do si\mbreak
    do8 do do do do do' si la
    do do, do do do4 r

    %108
    do'8 do, do do fa fa fa fa
    re' re, re re sol sol sol sol\mbreak
    si4 r8 si do do do do

    %111
    \parenthesize la4 r8 \parenthesize la si si si si
    sol4 r8 sol la la la la
    fa4 r8 fa sol sol sol sol\mbreak

    %114
    sol sol sol sol sol sol sol sol
    sol sol16 fa mi8 mi fa fa, r fa'
    sol sol, r sol' la la, r la'

    %117
    si si, r si' do do, do do\mbreak
    do do do do fa4 r
    fa r sol r8 sol16 fa

    %120
    mi8 mi mi mi mi mi do mi
    fa fa re re sol sol mi mi\mbreak
    la la fa fa sol sol si si

    %123
    do[r16 do, re8 mi] fa[r16 fa mi8 re]
    mi[r16 mi re8 sol] do do si si
    la la sol sol fa fa fa fa\mbreak

    %126
    sol sol sol sol do,4 r8 la'^\markup\italic\center-align "Violoncello solo"~
    la16(fa sol8) r fa~fa16(re mi8) r fa
    sol sol\f\tu[sol sol] sol sol sol sol

    %129
    do la fa sol\mbreak mi[do] fa sol
    mi do fa sol mi do mi sol
    do la fa sol do,4 r

}

Ibfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}


forma = {

    \key do\major
    \time 4/4
    \tempo 2 = 52
    s1*131
    \bar "|."

}


ItpI = {
    \Iglobal
    <<\ItpIn \forma>>

}



ItpII = {
    \Iglobal
    <<\ItpIIn \forma>>

}


IobI = {
    \Iglobal
    <<\IobIn \forma>>

}

IobII = {
    \Iglobal
    <<\IobIIn \forma>>

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

Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma>>

}

Itmp = {
    \Iglobal
    \clef bass
    <<\Itmpn \forma>>

}


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}




IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    r8 r16 mi[do8. mi16] la,4 la'
    r8 r16 sold[si8. red,16] mi2
    r8 r16 sold[si8. dod,16] \grace dod8 re!2

    %4
    do8. mi16 sold,8. si16 la2\mbreak
    r8 r16 do[mi8. la16] \grace la8 sol4 r8 fa
    mi8.[mi16 sol8. do16] fa,4 r8 mi

    %7
    mi4 re fad8(sol fad sol)
    do,4\tr si sol,2
    r8 r16 sol''[mi8. sol16] do,4 sib'

    %10
    \parenthesize r8 r16 sol[la8. mi16] fa8.[dod16 re8. la16]
    si8.[fad16 sol8. re16] mi8.[si16 do8. re16]\mbreak
    sol,4 fa''!2 si8(do)

    %13
    sol,,4 mi''2 si'8(do)
    sol,,4 re''2 si'8 do
    \terzinequarto\senza \tuplet 3/2 {do [(si la) sol(fa mi )] la [(sol fa) mi(re do)]}

    %16
    si8.[la'16 sol8. fad16] \grace fad8 sol4 r8 fa
    mi do r re\mbreak r8 sol, do si
    do8.[mi,16 fa8. sol16] do,4 r %% fine ritornello

    %19
    r8 r16 sol''[mi8. sol16] do,4 do'
    r8 r16 la[re8. la16] \grace la8 sib2
    r8 r16 sol[mi8. sol16] sol8. do,16 sib8. la16\mbreak

    %22
    la8. do16 mi,8. sol16 fa2
    r8 r16 do'[fa8. la16] sib4 r8 la
    la4 sol si!8(do si do)

    %25
    fa,4\tr mi do,2
    r8 r16 do'[mi8. fa16] sol4 r8 sib\mbreak
    la fa r sol r do, fa mi

    %28
    fa8.[la,16 sib8. do16] fa,2
    r8 r16 fa'[re8. fa16] sib,4 sib'
    r8 sold(la) mi\upl r sold(la) mi\upl

    %31
    do4 si! red8(mi red mi)\mbreak
    la,4\tr sold mi2
    r8 r16 mi'[do8. mi16] la,4 la'

    %34
    r8 r16 sold[si8. red,16] mi2
    r8 r16 sold[si8. dod,16] \grace dod4 re!2
    r8 r16 si'[do?8. la16] sold8.[si16 la8. mi16]\mbreak

    %37
    fa8.[red16 mi8. si16] do8.[sold16 la8. si16]
    mi,4 re'2 sold8.(la16)
    mi,4 do'2 sold'8(la)

    %40
    mi,4 si'2 sold'8(la)
    \tuplet 3/2 { la[(sol! fa) mi(re do)]  fa(mi re) do(si la)}\mbreak
    sold8.[fa'16 mi8. red16] mi4 r8 re

    %43
    do la r si r mi, la sold
    la8.[do,16 re8. mi16] la,2 la'8.[do,16 re8. mi16] la,2

}

IIvlan = \relative do' {

    do2 r8 r16 do[mi8. fa16]
    si,4 sold r8 r16 si[do8. re16]
    mi2 r8 r16 la[si8. sold16]

    %4
    mi4 re do  r8 r16 la'\mbreak
    sol4 r8 r16 mi re8.[si16 do8. re16]
    do4 r8 mi re4 do

    %7
    do si do la'
    la8.[fad16 sol8. re16] si8.[sol16 si8. re16]
    do2 r8 r16 sol'[fa8. sol16]

    %10
    la8. mi16 fa4 la2
    r8 r16 re,[mi8. fad16] sol2\mbreak
    r4 re si8. la16 sol4

    %13
    r sol' mi8. re16 do4
    r re si8. la16 sol4
    sol' mi do la'

    %16
    sol si,8. la16 sol4 r8 r16 re'
    do8 mi la4\mbreak sol8 fa mi re
    mi4 do r2

    %19
    mi2 r8 r16 mi[sol8. la16]
    re,2 r4 re
    do8. mi16 sol4 r do,~\mbreak

    %22
    do sib la r8 r16 re
    do4 r8 r16 fa mi4 fa
    fa mi fa re'

    %25
    re8. si!16 do8. sol16 mi8.[do16 fa8. re16]
    sol2 r8 r16 mi[fa8. sol16]\mbreak
    do,8 la re4 do8 sib la sol

    %28
    fa4 r8 r16 mi' fa8.[la16 sol8. fa16]
    sib2 r8 r16 re,[mi8. fa16]
    mi4 r8 r16 la sold8.[re16 do8. la'16]

    %31
    la4 sold la fa\mbreak
    fa8.[red16 mi8. si16] sold8. mi16 mi'8. re?16
    do2 r8 r16 do[mi8. fa16]

    %34
    si,4 sold r8 r16 si [do8. re16]
    mi2 r8 r16 si[do8. re16]
    sold,4 la si do\mbreak

    %37
    si r8 r16 mi re8. do16 si4
    r si' sold8. fad16 mi4
    r mi  do8. si16 la4

    %40
    r si' sold8. fad?16 mi4~
    mi do la fa'!\mbreak
    mi sold8. fad16 mi4 r8 r16 si

    %43
    la8 do fa!4 mi8 re do[si]
    do4 la \parenthesize r2 do4 la \parenthesize r2

}

IIbcn = \relative do {

    la2 r8 r16 la[do8. re16]
    mi2 r8 r16 sold[la8. si16]
    mi,2 r8 r16 fad[sold8. mi16]

    %4
    la2 r8 r16 la[sol!8. fa!16]\mbreak
    mi4 do si8.[sol16 la8. si16]
    do4 r8 do re8.[re16 mi8. fa16]

    %7
    sol2 la
    r4 sol sol fa
    mi2 r8 r16 mi[re8. mi16]

    %10
    fa2 r4 fad
    sol2 r\mbreak
    r8 r16 si,[do8. re16] sol,2

    %13
    r8 r16 do[re8. mi16] sol,2
    r8 r16 si[do8. re16] sol,4 fa'
    mi2 fa

    %16
    sol r8 r16 sol, la8. si16
    do4 fa\mbreak sol sol,
    do2 r8 r16 mi[do8. si16]

    %19
    do2 r8 r16 do[mi8. fa16]
    sol2 r8 r16 sol[fa8. sol16]
    mi2 r4 mi\mbreak

    %22
    fa2 r8 r16 si[do8. sib16]
    la2 sol4 fa
    do2 re

    %25
    r4 do do re
    mi2 r8 r16 do[re8. mi16]\mbreak
    fa4 sib do do,

    %28
    fa2 r8 r16 fa [sol8. la16]
    re,2 r4 re~
    re do si la

    %31
    mi'2 fa\mbreak
    r4 mi~mi8. re16 do8. si16
    la2 r8 r16 la [do8. re16]

    %34
    mi2 r8 r16 sold[la8. si16]
    mi,2 r8 r16 sold[la8. si16]
    mi,2 r4 la~\mbreak

    %37
    la sold la r
    r8 r16 sold[la8. si16] mi,2
    r8 r16 la[si8. do16] mi,2

    %40
    r8 r16 sold[la8. si16] mi,4 re
    do2 re\mbreak
    mi r8 r16 mi[fad8. sold16]

    %43
    la4 re, mi mi,
    \parenthesize la2 r8 r16 fa'[mi8. re16] \parenthesize la2 \parenthesize r

}

IIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}


forma = {

    \key do\major
    \time 4/4
    \tempo 2 = 40
    s1*18
    \bar ":..:"\break
    \repeat volta 2 {s1*25}
    \alternative {{s1}{s}}
    \bar "|."

}


IIvlI = {
    \IIglobal
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

}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}


IIItpIn = \relative do'' {

    do4 r8
    mi4 r8
    sol sol fa16 mi

    %4
    re4 r8
    R4.
    r8 la' la

    %7
    sol4 r8
    r sol sol\mbreak
    \grace sol fa4 mi8

    %10
    mi re r
    R4.*10
    r8 re16 re re re

    %22
    re8 r r
    r sol, sol
    sol4 r8\mbreak

    %25
    r16 mi' re sol fad8
    sol4 r8
    R4.*6

    %33
    r8 mi mi
    r fad fad\mbreak
    r sol sol

    %36
    r la sol
    mi re16 re re re
    sol,8 r re'

    %39
    sol, r re'
    sol, do re
    sol,4.

    %42
    re'4 r8
    sol4 r8
    re re fa

    %45
    mi re16 mi do8\mbreak
    do4 r8
    mi4 r8

    %48
    sol sol fa16 mi
    re4 r8
    R4.

    %51
    r8 la' la
    sib r r
    r sol sol

    %54
    la4 r8
    r fa fa\mbreak
    mi mi16 mi mi mi

    %57
    mi8 mi,16 mi mi mi
    mi4 r8
    R4.*9

    %68
    r8 mi16 mi mi mi
    mi8 r r
    R4.*4

    %74
    r8 mi16 mi mi mi
    mi4 r8\mbreak
    R4.*14

    %90
    do'4 r8
    mi4 r8
    sol sol fa16 mi

    %93
    re4 r8
    R4.\mbreak
    r8 sol sol

    %96
    la4 r8
    r la la
    sol4 r8

    %99
    r sol sol
    fa4 r8
    r fa fa

    %102
    \grace fa mi4 mi8\mbreak
    mi re fa
    fa mi r

    %105
    R4.*10
    r8 sol,16 sol sol sol
    sol8 r r\mbreak

    %117
    r do do
    do4 r8
    \senza \tuplet 3/2 { fa16(mi re) } mi8[re\tr]

    %120
    do4 r8
    R4.*6
    r8 la' la

    %128
    r si si
    r do do
    r fa, mi\mbreak

    %131
    fa mi re
    do r sol
    do, r sol'

    %134
    do, r sol'
    do,4 r8

}

IIItpIIn = \relative do'' {

    mi,4 r8
    sol4 r8
    mi' mi re16 do

    %4
    sol4 r8
    R4.
    r8 fa' fa

    %7
    mi4 r8
    r mi mi\mbreak
    re4 do8

    %10
    sol4 r8
    R4.*11
    r8 re'16 re re re

    %23
    re8 r r
    r sol, sol\mbreak
    sol16 do re re re re

    %26
    re4 r8
    R4.*6
    r8 do do

    %34
    r re re
    r mi mi
    r re re

    %37
    mi re16 re re re
    re8 r re
    sol, r re'

    %40
    sol, do re
    sol,4.
    sol4 r8

    %43
    re'4 r8
    sol, sol re'
    do sol mi

    %46
    mi4 r8
    la4 r8
    mi' mi re16 do

    %49
    sol4 r8
    R4.
    r8 re' re

    %52
    re r r
    r do do
    do4 r8

    %55
    r re re
    mi mi16 mi mi mi
    mi8 mi,16 mi mi mi

    %58
    mi4 r8
    R4.*10
    r8 mi16 mi mi mi

    %70
    mi8 r r
    R4.*3
    r8 mi16 mi mi mi

    %75
    mi4 r8\mbreak
    R4.*14
    mi4 r8

    %91
    sol4 r8
    mi' mi re16 do
    sol4 r8

    %94
    R4.\mbreak
    r8 do do
    do4 r8

    %97
    r fa fa
    mi4 r8
    r mi mi

    %100
    re4 r8
    r re re
    \grace re do4 do8\mbreak

    %103
    sol sol re'
    re do r
    R4.*11

    %116
    r8 sol16 sol sol sol\mbreak
    sol8 r r
    r do do

    %119
    do sol16 sol sol sol
    sol4 r8
    R4.*6

    %127
    r8 fa' fa
    r sol sol
    r la la

    %130
    r re, mi\mbreak
    re do16 do sol sol
    mi8[r sol]

    %133
    do, r sol'
    do, r sol'
    do,4 r8

}

IIIobIn = \relative do'' {

    do8 mi re
    do sol' fa
    mi do' re

    %4
    si la16 si sol8
    la la la
    la fa r

    %7
    sol sol sol
    sol mi r\mbreak
    fa fa mi

    %10
    mi (re) sol
    sol(fad do)
    do si r

    %13
    R4.
    r8 r sol'
    fa re do

    %16
    do'4 r8\mbreak
    re, do si
    si'4 r8

    %19
    do, si la
    la'4 sol8
    fad re la

    %22
    fad re \once\stemDown fad'
    sol4 r8
    sol4 r8\mbreak

    %25
    la re, fad
    sol4 r8
    R4.*5

    %32
    r8 r sol
    mi do la
    fad' re si\mbreak

    %35
    sol' mi do
    la' do,(si)
    do si la

    %38
    sol fad la
    sol fad la
    sol \parenthesize do re

    %41
    sol,4.
    sol8 si la
    sol re' do

    %44
    si sol' fa
    mi re16 mi do8
    do mi re

    %47
    do sol' fa
    mi do' re
    si la16 si sol8

    %50
    do do do
    do la r
    r sib sib

    %53
    sib? sol r
    r la la
    la fa r\mbreak

    %56
    mi16 sold la8 la
    la(sold) re
    re do r

    %59
    R4.
    r8 r mi
    fa8. sol16 la8

    %62
    \grace la sol4 fa8
    mi8. fa16 sol8
    \grace sol fa4 mi8

    %65
    re8. mi16 fa8
    \grace fa mi4 re8\mbreak
    do4 la'8

    %68
    sold si sold
    mi sold4
    la r8

    %71
    la4 r8
    fa mi sold
    la sol!16 fa mi re

    %74
    do8 re si
    la4 r8\mbreak
    R4.*14

    %90
    do8 mi re
    do sol' fa
    mi do' re

    %93
    si la16 si sol8
    sib sib sib\mbreak
    sib? sol r

    %96
    la la la
    la fa r
    sol sol sol

    %99
    sol mi r
    fa fa fa
    fa re r

    %102
    mi sol do\mbreak
    do si fa
    fa mi r

    %105
    R4.
    r8 r sol16 la
    sib8 r r

    %108
    la sol fa
    do'4 r8\mbreak
    si? la sol

    %111
    fa mi re
    re'4 r8
    mi, re do

    %114
    do'4 r8
    si sol re
    si sol fa'\mbreak

    %117
    mi4 r8
    mi4 r8
    re sol, si\tr

    %120
    do4 r8
    R4.*5
    r8 r mi

    %127
    fa la4
    sol8 si4
    la8 do4

    %130
    re8 fa, \parenthesize (mi)\mbreak
    fa mi re
    do si re

    %133
    do si re
    do fa, sol
    do,4 r8

}

IIIobIIn = \relative do'' {

    R4.
    do8 mi re
    do sol' fa16 mi

    %4
    re8 do si16 do
    fa8 fa fa
    fa re r

    %7
    mi mi mi
    mi do r\mbreak
    re re do

    %10
    do si si
    si la la
    la sol r

    %13
    R4.
    r8 r si
    do re mi

    %16
    fa4 la8\mbreak
    si, do re
    re4 sol8

    %19
    la, si do
    do4 si8
    la re, fad

    %22
    la re do
    si4 r8
    si4 r8\mbreak

    %25
    do si la
    si4 r8
    R4.*5

    %32
    r8 r si
    do mi4
    re8 fa4\mbreak

    %35
    sol8 sol4
    do,16 si la8 sol
    la sol fad

    %38
    sol fad la
    sol fad la
    sol \parenthesize do re

    %41
    sol,4.
    R
    sol8 si la

    %44
    sol re' si
    do re mi\mbreak
    R4.

    %47
    do8 mi re
    do sol' fa16 mi
    re8 do si

    %50
    la la' la
    la fad r
    r sol sol

    %53
    sol mi r
    r fa fa
    fa re r\mbreak

    %56
    mi do do
    do si si
    si la r

    %59
    R4.
    r8 r do
    re4 la8

    %62
    si8. do16 re8
    \grace re do4 sol8
    la8. si16 do8

    %65
    \grace do16 si4 si8~
    si sold mi\mbreak
    mi mi'16 re do8

    %68
    si mi, sold
    si mi si
    do4 r8

    %71
    do4 r8
    la si16 do re8
    do re mi

    %74
    la, si sold
    la4 r8\mbreak
    R4.*15

    %91
    do8 mi re
    do sol' fa16 mi
    re8 do si

    %94
    sol' sol sol\mbreak
    sol mi r
    fa fa fa

    %97
    fa re r
    mi mi mi
    mi do r

    %100
    re re re
    re si r
    do mi mi\mbreak

    %103
    mi re re
    re do r
    R4.

    %106
    r8 r mi~
    mi fa sol
    do,4 la'8

    %109
    fad sol la\mbreak
    re,4 re8
    re mi fa

    %112
    sol4 si8
    do, re mi
    fa4 la8

    %115
    sol re si
    fa si re\mbreak
    do4 r8

    %118
    do4 r8
    la sol fa
    sol4 r8

    %121
    R4.*5
    r8 r do~
    do la re

    %128
    r si mi
    r do16 mi fa8
    r re do\mbreak

    %131
    re do si
    do si re
    do si re

    %134
    do fa, sol
    do,4 r8

}

IIIvlIn = \relative do'' {

    do8 mi re
    do sol' fa
    mi do' re

    %4
    si la16 si sol8
    \once\stemDown la fa, mi
    fa fa'16 sol la fa

    %7
    \once\stemDown  sol8 mi, re
    \once\stemUp do mi'16 fa sol mi\mbreak
    fa8 fa mi

    %10
    mi(re) sol
    sol \parenthesize (fad do)
    do(si) sol'\p

    %13
    sol(fad) do
    do(si) sol'\f
    \grace fa mi4\tr do'16(si)

    %16
    do8 mi, re\mbreak
    re4\tr si'16 la
    si8 re, do

    %19
    do4\tr la'16 sol
    la8 do,(si)
    re, fad la

    %22
    do fad la
    r16 sol(fad sol si sol)
    r sol (fad sol si sol)\mbreak

    %25
    la8 re, fad
    \grace fad? sol4 r8
    mi\pp \grace re dod4\tr

    %28
    re8(fad la)
    re, \grace do si4\tr
    do8(mi sol)

    %31
    do, \appoggiatura si la4\tr
    si8(fad') sol
    mi16 \f re do si do la

    %34
    fad' mi re do re si\mbreak
    sol' fad mi re mi do
    la'8 do, \parenthesize (si)

    %37
    do si la
    sol fad16 sol la fad
    sol8 fad16 sol la fad

    %40
    sol8 do, re
    sol,4 r8
    sol'8 si la

    %43
    sol re' do
    si sol' fa
    mi re16 mi do8\mbreak

    %46
    do mi re
    do sol' fa
    mi do' re

    %49
    si la16 si sol8
    \once\stemDown do la, sol
    \once\stemUp fa la'16 si do la

    %52
    \once\stemDown sib8 sol, fa!
    \once\stemUp mi sol'16 la sib sol
    \once\stemDown la8 fa, mi

    %55
    \once\stemUp re re''16 do si! la\mbreak
    sold8 mi la
    la(sold) re

    %58
    re(do) la'\p
    la(sold) re
    re(do) mi\f

    %61
    fa4 re'16 do
    si8 sol,(fa')
    mi4 do'16 si

    %64
    la8 fa,(mi')
    re4 si'16 la
    sold8 mi,(re')\mbreak

    %67
    do4(la'8)
    sold(re si)
    sold(mi re)

    %70
    r16 la'(sold la si la)
    r la(sold la si la)
    fa'8 mi sold

    %73
    la sol!16 fa mi re
    do8 re si
    la4 r8\mbreak

    %76
    la\pp \grace re dod4\tr
    re8(fa la)
    sib \grace re, dod4\tr

    %79
    re8 re, r
    sol \grace do si4\tr
    do8(mi sol)

    %82
    la \grace do, si4\tr
    do8 do, r
    fa'\upl fa(mib)

    %85
    lab (fad) sol
    re(mib) do\mbreak
    sol'\upl mi! (fa?)

    %88
    do(mib fad)
    sol sol, r
    do\f mi! re

    %91
    do sol' fa
    mi do' re
    si\tr la16 si sol8

    %94
    \once\stemDown sib sol, fa\mbreak
    \once\stemUp mi sol'16 la sib sol
    \once\stemDown la8 fa,_\upl mi_\upl

    %97
    \once\stemUp re fa'16 sol la fa
    \once\stemDown sol8 mi,_\upl re_\upl
    \once\stemUp do mi'16 fa sol mi

    %100
    \once\stemDown fa8 re,_\upl do_\upl
    \once\stemUp si re'16 mi fa re
    mi8 sol do\mbreak

    %103
    do(si) fa
    fa(mi) do'\p
    do(si) fa

    %106
    fa(mi) sol\f
    sib4 la16 sol
    la8(mi) fa

    %109
    do'4 si!16 la\mbreak
    si8(fad) sol
    fa!4 re'16 do

    %112
    re8 fa, mi
    mi4\tr do'16 si
    do8 mi,(re)

    %115
    sol,, si re
    fa si re\mbreak
    r16 do(si do mi do)

    %118
    r do(si do mi do)
    re8 sol, si\tr
    do4 r8

    %121
    la'\pp \grace sol fad4\tr
    sol8(si re)
    sol, \grace fa mi4\tr \mbreak

    %124
    fa8(la do)
    fa, \grace  mi re4\tr
    mi8\upl si'(do)

    %127
    la16\f sol fa mi fa re
    si' la sol fa sol mi
    do' si la sol la fa

    %130
    re'8 fa, (mi)
    fa mi re
    do si16 do re si

    %133
    do8 si16 do re si
    do8 fa, sol
    do,4 r8

}

IIIvlIIn = \relative do'' {

    do8 mi re
    do sol' fa
    mi do' re

    %4
    si la16 si sol8
    \once\stemDown la fa, mi
    fa fa'16 sol la fa

    %7
    \once\stemDown  sol8 mi, re
    \once\stemUp do mi'16 fa sol mi\mbreak
    fa8 fa mi

    %10
    mi(re) sol
    sol \parenthesize (fad do)
    do\parenthesize (si) si\p
    si(la) la
    la\parenthesize (sol) sol'\f
    \grace fa mi4\tr do'16(si)

    %16
    do8 mi, re\mbreak
    re4\tr si'16 la
    si8 re, do

    %19
    do4\tr la'16 sol
    la8 do,(si)
    re, fad la

    %22
    do fad la
    r16 si,(la si re si)
    r si(la si re si)\mbreak

    %25
    do8 si la
    si4 r8
    si\pp la la

    %38
    la la la
    la sol sol
    sol sol sol

    %31
    sol la fad
    sol la si
    do\f mi do

    %34
    la fad' re\mbreak
    si fad'? mi
    do la \parenthesize (sol)

    %37
    la sold fad
    sol fad16 sol la fad
    sol8 fad16 sol la fad

    %40
    sol8 do, re
    sol,4 r8
    sol'8 si la

    %43
    sol re' do
    si sol' fa
    mi re16 mi do8\mbreak

    %46
    do mi re
    do sol' fa
    mi do' re

    %49
    si la16 si sol8
    \once\stemDown do la, sol
    \once\stemUp fa la'16 si do la

    %52
    \once\stemDown sib8 sol, fa!
    \once\stemUp mi sol'16 la sib sol
    \once\stemDown la8 fa, mi

    %55
    \once\stemUp re re''16 do si! la\mbreak
    sold8 mi la
    la(sold) re

    %58
    re\parenthesize (do) do\p
    do\parenthesize(si) si
    si\parenthesize(la) mi'\f

    %61
    fa4 re'16 do
    si8 sol,(fa')
    mi4 do'16 si

    %64
    la8 fa,(mi')
    re4 si'16 la
    sold8 mi,(re')\mbreak

    %67
    do4(la'8)
    sold(re si)
    sold(mi re)

    %70
    r16 do(si do re do)
    r do(si do re do)
    la'8 la re

    %73
    do re mi
    la, si sold
    la4 r8\mbreak

    %76
    dod\pp mi la,
    la\parenthesize (do re)
    re mi la,

    %79
    la la la
    si re sol,
    sol do do

    %82
    do re sol,
    sol sol sol
    si\upl re(do)

    %85
    mib\upl mib(re)
    re(do) mib\mbreak
    do do do16 re

    %88
    mib8 do re
    si4 r8
    do\f mi! re

    %91
    do sol' fa
    mi do' re
    si\tr la16 si sol8

    %94
    \once\stemDown sib sol, fa\mbreak
    \once\stemUp mi sol'16 la sib sol
    \once\stemDown la8 fa,_\upl mi_\upl

    %97
    \once\stemUp re fa'16 sol la fa
    \once\stemDown sol8 mi,_\upl re_\upl
    \once\stemUp do mi'16 fa sol mi

    %100
    \once\stemDown fa8 re,_\upl do_\upl
    \once\stemUp si re'16 mi fa re
    mi8 sol do\mbreak

    %103
    do(si) fa
    fa\parenthesize (mi) mi\p
    mi\parenthesize (re) re

    %106
    re\parenthesize (do) sol'\f
    sib4 la16 sol
    la8(mi) fa

    %109
    do'4 si!16 la\mbreak
    si8(fad) sol
    fa!4 re'16 do

    %112
    re8 fa, mi
    mi4\tr do'16 si
    do8 mi,(re)

    %115
    sol,, si re
    fa si re\mbreak
    r16 mi,(re mi sol mi)

    %118
    r mi(re mi sol mi)
    fa8 mi re\tr
    do4 r8

    %121
    mi'8\pp re re
    re re re
    do do do\mbreak

    %124
    do do do
    do re si
    do re mi

    %127
    fa\f la fa
    re si' sol
    mi do' la

    %130
    fa re \parenthesize (do)\mbreak
    re do si
    do si16 do re si

    %133
    do8 si16 do re si
    do8 fa, sol
    do,4 r8

}

IIIvlan = \relative do' {

    sol'8 do, re
    mi4 r8
    do mi fa

    %4
    sol sol, sol'
    fa r r
    r re re

    %7
    mi r r
    r do do\mbreak
    re sol sol

    %10
    sol [sol r16 mi]
    re8 re re
    sol sol16\p la si do

    %13
    re8 re,16 mi fad8
    sol sol sol
    sol sol mi

    %16
    la la la\mbreak
    sol sol sol
    sol sol sol

    %19
    fad fad fad
    re fad sol
    la4 r8

    %22
    re,4 r8
    sol sol fad
    mi mi re\mbreak

    %25
    do re re,
    sol si re
    sol sol sol

    %28
    fad fad fad
    fa! fa fa
    mi mi mi

    %31
    mi fad re
    sol sol sol
    sol sol la

    %34
    la la si\mbreak
    la si do
    re, re re

    %37
    do re re
    sol fad16 sol la fad
    sol8 fad16 sol la fad

    %40
    sol8 do, re
    sol, si re
    re fa, la

    %43
    si4 r8
    re re re
    do sol' sol\mbreak

    %46
    sol do, re
    mi4 r8
    do mi fa

    %49
    sol sol, sol'
    la r r
    r fad fad

    %52
    sol r r
    r mi mi
    fa! r r

    %55
    r re re\mbreak
    mi[mi r16 fa]
    mi8 mi mi

    %58
    mi la,16 si do re
    mi8 mi16 fad sold8
    la la la~

    %61
    la sol fa?16 mi
    re8 sol sol~
    sol fa mi16 re

    %64
    do8 fa fa~
    fa mi re16 do
    si8 mi mi\mbreak

    %67
    la la,16 si do re
    mi4 r8
    mi4 r8
    la la sol!

    %71
    fa fa mi
    re do si
    la si do

    %74
    fa re mi
    la, do mi\mbreak
    la\pp sol sol

    %77
    fa fa fa
    sol sol sol
    fa fa fa

    %80
    sol fa fa
    mi mi mi
    fa fa fa

    %83
    mi mi mi
    re si do
    do do  si!

    %86
    si do do\mbreak
    sib sib lab
    lab? lab lab

    %89
    sol'8[r16 sol mi fa]
    sol8\f do, re
    mi4 r8

    %92
    do mi fa
    sol sol, sol'
    sol r r\mbreak

    %95
    r mi mi
    fa r r
    r re re

    %98
    mi r r
    do r r
    re r r

    %101
    r si si
    do[mi r16 la]\mbreak
    sol8 sol,16 la si8

    %104
    do do16 re mi fa
    sol8 sol,16 la si8
    do mi mi16 fa

    %107
    sol8 fa mi
    fa sib la~
    la sol fad\mbreak

    %110
    sol do si!
    si si si
    sol sol sol

    %113
    la la la
    fa fa fa
    re4 r8

    %116
    sol4 r8\mbreak
    do do si
    la la sol

    %119
    fa sol sol,
    do mi sol
    do\pp do do

    %122
    si si si
    sib sib sib\mbreak
    la la la

    %125
    la si? sol
    do do do,
    do\f do re

    %128
    re re mi
    mi mi fa
    fa sol sol\mbreak

    %131
    fa sol sol,
    do si16 do re si
    do8 si16 do re si

    %134
    do8 fa sol
    do,4 r8

}

IIIfgn = \relative do {

    do4 r8
    do4 r8
    do mi fa

    %4
    sol4 sol,8
    r fa' mi
    re r r

    %7
    r mi re
    do r r\mbreak
    re si do

    %10
    sol' sol16 la si do
    re8 re,16 mi fad8
    sol sol16\p la si do
    re8 re,16 mi fad8
    sol sol, sol'
    do si la

    %16
    la sol fad\mbreak
    si la sol
    sol fad mi

    %19
    la sol fad
    fad? re sol
    re4 r8

    %22
    re4 r8
    sol sol fad
    mi mi re\mbreak

    %25
    do re re,
    sol si re
    sol sol sol

    %28
    fad fad fad
    fa! fa fa
    mi mi mi

    %31
    mi fad re
    r8 r sol
    do, do do

    %34
    re re re\mbreak
    mi mi mi
    fad fad sol
    do re re,

    %38
    sol fad16 sol la fad
    sol8 fad16 sol la fad
    sol8 do, re

    %41
    sol, si re
    sol4 r8
    sol4 r8

    %44
    sol si sol
    do4 do,8\mbreak
    do4 r8

    %47
    do4 r8
    do mi fa
    sol4 sol,8

    %50
    r la' sol
    fad r r
    r sol fa!

    %53
    mi r r
    r fa mi
    re r r\mbreak

    %56
    mi la,16 si do re
    mi8 mi16 fad sold8
    la la,16 si do re

    %59
    mi8 mi16 fad sold8
    la la la
    re, mi fa

    %62
    sol sol16 la si8
    do, re mi
    fa fa16 sol la8

    %65
    si, do re
    mi mi16 fad sold8\mbreak
    la la,16 si do re

    %68
    mi4 r8
    mi4 r8
    la la sol!

    %71
    fa fa mi
    re do si
    la si do

    %74
    fa re mi
    la, do mi\mbreak
    la sol sol

    %77
    fa fa fa
    sol sol sol
    fa fa fa

    %80
    sol fa fa
    mi mi mi
    fa fa fa

    %83
    mi mi mi
    re si do
    do do  si!

    %86
    si do do\mbreak
    sib sib lab
    lab? lab lab

    %89
    sol[r16 sol' mi re]
    do4 r8

    %91
    do4 r8
    do4 r8
    sol4 r8

    %94
    R4.*7
    r8 sol sol
    do4 do8\mbreak

    %103
    sol4 sol8
    do do16 re mi fa
    sol8 sol,16 la si8
    do do do

    %107
    do re mi
    fa sol la
    re, mi fad\mbreak

    %110
    sol la si16 do
    re8 do si
    si la sol

    %113
    do si la
    la sol fa
    sol4 r8

    %116
    sol r r\mbreak
    do do si
    la la sol

    %119
    fa sol sol,
    do mi sol
    do do do

    %122
    si si si
    sib sib sib\mbreak
    la la la

    %125
    la si? sol
    do do do,
    fa fa r

    %128
    sol sol sol
    la la la
    si si do\mbreak
    fa, sol sol,

    %132
    do' si16 do re si
    do8 si16 do re si
    do8 fa, sol

    %135
    do,4 r8

}

IIItmpn = \relative do {

    do4 r8
    do4 r8
    do4 r8

    %4
    sol4 r8
    R4.*4\mbreak
    r8 r do

    %10
    sol4 r8
    R4.*15
    sol4 r8

    %27
    R4.*11
    sol8 r r
    sol r r

    %40
    R4.
    sol8 r r
    sol4 r8

    %43
    sol4 r8
    sol4 r8
    do4 r8\mbreak

    %46
    do4 r8
    do4 r8
    do4 r8

    %49
    sol4 r8
    R4.*40
    do4 r8

    %91
    do4 r8
    do4 r8
    sol4 r8

    %94
    R4.*7
    r8 sol sol
    do4 do8\mbreak

    %103
    sol4 sol8
    do4 r8
    R4.*10

    %115
    sol4 r8
    sol r r\mbreak
    do4 r8

    %118
    do4 r8
    r sol sol
    do4 r8

    %121
    R4.*9
    r8 r do\mbreak
    do sol4

    %132
    do4 r8
    do4 r8
    do4 sol8

    %135
    do4 r8

}

IIIbcn = \relative do {

    do4 r8
    do4 r8
    do mi fa

    %4
    sol4 sol,8
    r fa' mi
    re r r

    %7
    r mi re
    do r r\mbreak
    re si do

    %10
    sol' sol16 la si do
    re8 re,16 mi fad8
    sol4 r8

    %13
    R4.
    r8 r sol
    do si la

    %16
    la sol fad\mbreak
    si la sol
    sol fad mi

    %19
    la sol fad
    fad? re sol
    re4 r8

    %22
    re4 r8
    sol sol fad
    mi mi re\mbreak

    %25
    do re re,
    <<{sol8^\markup\italic "Violon[cello]" si re}\\sol,4>>
    sol'8 sol sol

    %28
    fad fad fad
    fa! fa fa
    mi mi mi

    %31
    mi fad re
    r8 r sol\tu
    do, do do
    re re re\mbreak

    %35
    mi mi mi
    fad fad sol
    do re re,

    %38
    sol fad16 sol la fad
    sol8 fad16 sol la fad
    sol8 do, re

    %41
    sol, si re
    sol4 r8
    sol4 r8

    %44
    sol si sol
    do4 do,8\mbreak
    do4 r8

    %47
    do4 r8
    do mi fa
    sol4 sol,8

    %50
    r la' sol
    fad r r
    r sol fa!

    %53
    mi r r
    r fa mi
    re r r\mbreak

    %56
    mi la,16 si do re
    mi8 mi16 fad sold8
    <<la8\\{la_\markup\italic "Violon[cello]" la,16 si do re}>>
    mi8 mi16 fad sold8
    la la <<la\\la_\tu>>
    re, mi fa

    %62
    sol sol16 la si8
    do, re mi
    fa fa16 sol la8

    %65
    si, do re
    mi mi16 fad sold8\mbreak
    la la,16 si do re

    %68
    mi4 r8
    mi4 r8
    la la sol!

    %71
    fa fa mi
    re do si
    la si do

    %74
    fa re mi
    la,4 r8\mbreak
    R4.*13

    %89
    r8 r16 sol' mi re
    do4 r8
    do4 r8

    %92
    do mi fa
    sol4 sol,8
    r sol' fa\mbreak

    %95
    mi r r
    r fa mi
    re r r

    %98
    r mi re
    do r r
    r re do

    %101
    si r r
    do do16 re mi fa\mbreak
    sol8 sol,16 la si8

    %104
    <<do\\{do_\markup\italic "Violoncello" do16 re mi fa}>>
    sol8 sol,16 la si8
    do do <<do\\do_\tu>>

    %107
    do re mi
    fa sol la
    re, mi fad\mbreak

    %110
    sol la si16 do
    re8 do si
    si la sol

    %113
    do si la
    la sol fa
    sol4 r8

    %116
    sol r r\mbreak
    do do si
    la la sol

    %119
    fa sol sol,
    do4 r8
    R4.*5

    %126
    r8 r do
    fa fa fa
    sol sol sol

    %129
    la la la
    si si do\mbreak
    fa, sol sol,

    %132
    do' si16 do re si
    do8 si16 do re si
    do8 fa, sol

    %135
    do,4 r8

}

IIIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}


forma = {

    \key do\major
    \time 3/8
    \tempo 4. = 67
    s4.*41
    \bar ":..:"\break
    s4.*94
    \bar ":|."  %%% 135

}


IIItpI = {
    \IIIglobal
    <<\IIItpIn \forma>>

}


IIItpII = {
    \IIIglobal
    <<\IIItpIIn \forma>>

}


IIIobI = {
    \IIIglobal
    <<\IIIobIn \forma>>

}

IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>

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

IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma>>

}

IIItmp = {
    \IIIglobal
    \clef bass
    <<\IIItmpn \forma>>

}


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    print-first-page-number = ##f
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #2

    }

    \header {
        title = \markup\center-column{"Sinfonia in Do maggiore"}
        composer = \markup \center-column{"A. Caldara (1670 - 1736)"}

    }

    \markup\huge "[1.] [Allegro]"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        }<<

            \new GrandStaff <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Tromba 1."}
                    \set Staff.midiInstrument = #"trumpet"
                    \set Staff.shortInstrumentName = "tp1"
                    \ItpI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Tromba 2."}
                    \set Staff.midiInstrument = #"trumpet"
                    \set Staff.shortInstrumentName = "tp2"
                    \ItpII
                >>
            >>

            \new GrandStaff <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Oboe I."}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IobI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Oboe 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IobII
                >>
            >>

            \new GrandStaff <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{Violetta}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Fagotto 1. & 2."}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \Ifg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Tympano"}
                \set Staff.midiInstrument = #"timpani"
                \set Staff.shortInstrumentName = "tmp"
                \Itmp
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Cembalo""Violoncello"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

}

\bookpart {

    \paper  {

        systems-per-page = #6

    }

    \markup\huge "[2.] Staccato - Andante, piano"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        }<<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Violino 1. e 2.]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{[Violetta]}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Cembalo""Violoncello]"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

        systems-per-page = #2

    }

    \markup\huge "[3.] Allegro"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        }<<

            \new GrandStaff <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Tromba 1."}
                    \set Staff.midiInstrument = #"trumpet"
                    \set Staff.shortInstrumentName = "tp1"
                    \IIItpI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Tromba 2."}
                    \set Staff.midiInstrument = #"trumpet"
                    \set Staff.shortInstrumentName = "tp2"
                    \IIItpII
                >>
            >>

            \new GrandStaff <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Oboe I."}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IIIobI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Oboe 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IIIobII
                >>
            >>

            \new GrandStaff <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{Violetta}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \IIIfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Tympano"}
                \set Staff.midiInstrument = #"timpani"
                \set Staff.shortInstrumentName = "tmp"
                \IIItmp
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Cembalo""Violoncello"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

}


