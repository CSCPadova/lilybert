\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

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

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"doux"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = _\markup \italic { Soli }

solo = _\markup \italic { Solo }

tu = _\markup \italic "Tutti"

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
    \senza
}

IobIn = \relative do'' {

    r8 do mi, sol do, do' mi, sol
    \once\stemUp do, [mi'16 re do8 si] do[mi16 re do8 si]
    do[sol'16 fa mi8 re] mi[sol16 fa mi8 re]

    %4
    mi r  sol r sol r sol r
    sol do, mi, sol do, do' mi, sol
    do,[re16 mi fa sol la si] do8 do mi, sol

    %7
    do, do' mi, sol do,(mi sol si)
    do(mi sib4) la8 re fad, la\mbreak
    re, re' fad, la re,(fad la dod)

    %10
    re(fad do?4) si8 mi sold, si
    mi, mi' sold, si mi,(sold si re)
    sold(si re,4) do8[si16 la fa'8 do]

    %13
    re[do16 si sol'?8 re] mi[re16 do sol'8 re]
    mi[re16 do sol'8 re] mi16 do si do mi, do' si do
    fa, do' si do sol do si do la do si do mi, do' si do\mbreak

    %16
    fa, do' si do sol do si do la do si do mi, do' si do
    re, do' si do re, do' si do re, si' la si re, si' la si
    do4 r r2

    %19
    R1*7\mbreak
    r8 do mi, sol do, do' mi, sol
    do,4 r mi'8 do mi sol

    %28
    la do, fa la la4 r
    fad8 re fad la si re, sol si
    si4 r sold8 mi sold si\mbreak

    %31
    do mi, la do do4 r
    fa,8[re16 mi fa8 fa] fa(mi) mi(re)
    re[re16 mi fa8 fa] fa(mi) mi(re)

    %34
    re[si16 do re8 re] re(do) do(si)
    si4 r mi8 mi mi mi
    re re re re re re re re\mbreak

    %37
    mi4 r r2
    R1*12
    r8 r16 do16 [do8. la'16] la8. [sol16 sol8. fad16]  % ripresa

    %51
    fad?4 r8 r16 si si8.[la16 la8. sol16]
    sol4 r8 r16 do do8.[sib16 sib8. la16]\mbreak
    la4 r8 r16 re re8.[do16 do8. si16]

    %54
    si8. [sol16 sol8. sol16] sol8.[sol16 fad8. fad16]
    sol4 r r2
    R1*4

    %60
    r8 fa fa(mi) re[re16 mi fa8 mi]
    re[re16 mi fa8 mi] mi4 r
    r2 r8 sol sol(fa)

    %63
    mi[mi16 fa sol8 fa] mi[mi16 fa sol8 mi]
    fa4 r r2
    r8 la la(sol) fad[fad16 sol  la8 sol]

    %66
    fad[fad16 sol  la8 fad] sol4 r
    R1*9
    r2 mi8 do mi sol

    %77
    la do, fa la la4 r
    fad8 re fad la si re, sol si\mbreak
    si4 r sold8 mi sold si

    %80
    do mi, la do do4 r
    fa,4 r fa r
    fa r fa r

    %83
    do,8 do' mi, sol do, do' mi, sol
    do, do' mi, sol do,4 r8 do'
    fa,4 sol do,2\fermata

}

IobIIn = \relative do'' {

    R1
    r8 do mi, sol do, do' mi, sol
    \once\stemUp do, [mi'16 re do8 si] do[mi16 re do8 si]

    %4
    do[sol'16 fa mi8 re] mi[sol16 fa mi8 re]
    mi do mi, sol do, do' mi, sol
    do,[re16 mi fa sol la si] do8 do mi, sol

    %7
    do, do' mi, sol do,(mi sol si)
    do(mi sib4) la8 re fad, la\mbreak
    re, re' fad, la re,(fad la dod)

    %10
    re(fad do?4) si8 mi sold, si
    mi, mi' sold, si mi,(sold si re)
    sold(si re,4) do8[si16 la fa'8 do]

    %13
    re[do16 si sol'?8 re] mi[re16 do sol'8 re]
    mi[re16 do sol'8 re] mi16 do si do mi, do' si do
    fa, do' si do sol do si do la do si do mi, do' si do\mbreak

    %16
    fa, do' si do sol do si do la do si do mi, do' si do
    re, do' si do re, do' si do re, si' la si re, si' la si
    do4 r r2

    %19
    R1*7
    r8 do mi, sol do, do' mi, sol
    do,4 r do'8 sol do mi

    %28
    do la do fa re4 r
    re8 la re fad re si re sol
    mi4 r  mi8 si mi sold\mbreak

    %31
    mi do mi la fa?4 r
    re8[si16 do re8 re] re(do) do(si)
    si[si16 do re8 re] re(do) do(si)

    %34
    si[sol16 la si8 si] si(la) la(sol)
    sol4 r do8 do do do
    do do do do si si si si\mbreak

    %37
    do4 r r2
    R1*12
    r8 r16 mi16[mi8. mi16] mi8.[dod16 dod8. la16]

    %51
    la4 r8 r16 fad' fad8.[red16 red8. si16]
    si4 r8 r16 sol' sol8.[mi16 mi8. do16]\mbreak
    do4 r8 r16 la' la8.[fad16 fad8. re16]

    %54
    re8.[si16 si8. si16] la8. [la16 la8. la16]
    si4 r r2
    R1*4

    %60
    r8 re re(do) si[si16 do re8 do]
    si[si16 do re8 si] do4 r
    r2 r8 mi mi(re)

    %63
    dod[dod16 re mi8 re] dod[dod16 re mi8 dod]
    re4 r r2
    r8 fa fa(mi) red[red16 mi fad8 mi]

    %66
    red[red16 mi fad8 red] mi4 r
    R1*9
    r2 do8 sol do mi

    %77
    do la do fa re4 r
    re8 la re fad re si re sol\mbreak
    mi4 r mi8 si mi sold

    %80
    mi do mi la fa4 r
    re r re r
    re r re r

    %83
    do,8 do' mi, sol do, do' mi, sol
    do, do' mi, sol do,4 r8 do'
    fa,4 sol do,2\fermata

}

IvlsoloIn =  \relative do'' {

    r8 do mi, sol do, do' mi, sol
    \once\stemUp do, [mi'16 re do8 si] do[mi16 re do8 si]
    do[sol'16 fa mi8 re] mi[sol16 fa mi8 re]

    %4
    mi r  sol r sol r sol r
    sol do, mi, sol do, do' mi, sol
    do,[re16 mi fa sol la si] do8 do mi, sol

    %7
    do, do' mi, sol do,(mi sol si)
    do(mi sib4) la8 re fad, la\mbreak
    re, re' fad, la re,(fad la dod)

    %10
    re(fad do?4) si8 mi sold, si
    mi, mi' sold, si mi,(sold si re)
    sold(si re,4) do8[si16 la fa'8 do]

    %13
    re[do16 si sol'?8 re] mi[re16 do sol'8 re]
    mi[re16 do sol'8 re] mi16 do si do mi, do' si do
    fa, do' si do sol do si do la do si do mi, do' si do\mbreak

    %16
    fa, do' si do sol do si do la do si do mi, do' si do
    re, do' si do re, do' si do re, si' la si re, si' la si
    do do' sol mi do do' sol mi do do' sol mi do do' sol mi

    %19
    do8 mi sol do do,4 r
    r16 mi' do sol mi mi' do sol mi mi' do sol mi mi' do sol\mbreak
    mi8 sol do mi mi,4 r  %%% inizio p. 6

    %22
    sol'16 mi fa sol mi(fa sol) fa mi(fa sol) fa mi sol fa mi
    fa re mi fa re(mi fa) mi re(mi fa) mi re fa mi re
    sol mi fa sol  mi(fa sol) fa mi(fa sol) fa mi sol fa mi

    %25
    fa re mi fa re(mi fa) mi re(mi fa) mi re fa mi re\mbreak
    mi8 do, mi, sol do, do' mi, sol
    do,16 mi mi sol sol si si do do mi, mi do' do mi, mi do'

    %28
    la fa fa la la fa fa la re, fad fad la la dod dod re
    re fad, fad re' re fad, fad re' si sol sol si si sol sol si
    mi, sold sold si si red? red mi mi sold, sold mi' mi sold, sold mi'\mbreak

    %31
    do la la do do la la do fa, la la do do mi mi fa
    fa4 r r2
    fa4 r r2

    %34
    fa4 r r2
    fa4 r do'16 mi, mi do' do mi, mi do'
    do re, re do' do re, re do' si re, re si' si re, re si'\mbreak

    %37
    do do sol mi do do' sol mi do do' sol mi do do' sol sib
    la8 fa la do la fa la do
    re16 re la fad re re' la fad re re' la fad  re re' la do

    %40
    si8 sol si re si sol si re
    mi16 mi si sold mi mi' si sold mi mi' si sold mi mi' si re\mbreak
    do8 la do mi do la do mi

    %43
    fa16 fa do la fa fa' do la fa fa' do la fa fa' do mi
    re8 si re fa re si re fa
    sol16 sol re do sol sol' re si sol sol' re si sol sol' re fa

    %46
    mi sol mi sol mi sol mi sol mi sol mi sol mi sol mi sol\mbreak
    re sol re sol re sol re sol re sol re sol re sol re sol
    mi sol mi sol mi sol mi sol mi sol mi sol mi sol mi sol

    %49
    re sol re sol re sol re sol re sol re sol re sol re sol
    mi8.[do,16 do8. la'16] la8.[sol16 sol8. fad16]
    fad?8.[fad,16 fad8. si'16] si8.[la16 la8. sol16]

    %52
    sol8.[sol,16 sol8. do'16] do8.[sib16 sib8. la16]\mbreak %%fine p. 11
    la8.[la,16 la8. re'16] re8.[do16 do8. si?16]
    si8.[sol16 sol8. sol16] sol8.[sol16 fad8. fad16]

    %55
    sol8 sol, si, re sol, sol' si, re
    sol,[si'16 la sol8 fad] sol[si16 la sol8 fad]
    sol[re'16 do si8 la] si[re16 do si 8 la]

    %58
    si r re r re r re r
    re sol, si, re sol, sol' si, re\mbreak
    sol,4 r r2

    %61
    r r8 do' mi, sol
    do, do' mi, sol do,4 r
    R1

    %64
    r8 re' fa, la re, re' fa, la
    re,4 r r2
    r r8 mi' sol, si

    %67
    mi, mi' sol, si mi, mi' sol, si\mbreak
    mi,16 mi' sol si sol mi sol si sol mi sol si sol mi sol si
    si8 mi, sol si r mi, sol si

    %70
    fa16 re fa la fa re fa la fa re fa la fa re fa la
    la8 re, fa la r re, fa la
    mi16 do mi sol mi do mi sol mi do mi sol mi do mi sol\mbreak

    %73
    sol8 si, re sol r si, re sol
    mi16 do mi sol mi do mi sol mi do mi sol mi do mi sol
    sol8 si, re sol r si, re sol

    %76
    sol16 mi, mi sol sol si si do do mi, mi do' do mi, mi do'
    la fa fa la la fa fa la re, fad fad la la dod dod re
    re fad, fad re' re fad, fad re' si sol sol si si sol sol si\mbreak

    %79
    mi, sold sold si si red? red mi mi sold, sold mi' mi sold, sold mi'
    do la la do do la la do fa, la la do do mi mi fa
    fa[sol la sol fa mi re do] si[do re do si la sol fa]

    %82
    re[mi fa mi re do si la]sol4 r
    do8 do' mi, sol do, do' mi, sol
    do, do' mi, sol do,4 r8 do'

    %85
    fa,4 sol do,2\fermata

}

IvlsoloIIn =  \relative do'' {

    r8 do mi, sol do, do' mi, sol
    \once\stemUp do, [mi'16 re do8 si] do[mi16 re do8 si]
    do[sol'16 fa mi8 re] mi[sol16 fa mi8 re]

    %4
    mi r  sol r sol r sol r
    sol do, mi, sol do, do' mi, sol
    do,[re16 mi fa sol la si] do8 do mi, sol

    %7
    do, do' mi, sol do,(mi sol si)
    do(mi sib4) la8 re fad, la\mbreak
    re, re' fad, la re,(fad la dod)

    %10
    re(fad do?4) si8 mi sold, si
    mi, mi' sold, si mi,(sold si re)
    sold(si re,4) do8[si16 la fa'8 do]

    %13
    re[do16 si sol'?8 re] mi[re16 do sol'8 re]
    mi[re16 do sol'8 re] mi16 do si do mi, do' si do
    fa, do' si do sol do si do la do si do mi, do' si do\mbreak

    %16
    fa, do' si do sol do si do la do si do mi, do' si do
    re, do' si do re, do' si do re, si' la si re, si' la si
    do4 r r2

    %19
    r16 do' sol mi do do' sol mi do do' sol mi do do' sol mi
    do8 mi sol do do,4 r\mbreak
    r16 mi' do sol mi mi' do sol mi mi' do sol mi mi' do sol

    %22
    mi'16 do re mi do(re mi) re do(re mi) re do mi re do
    re si do re si(do re) re si(do re) do si re do si
    mi do re mi do(re mi) re do(re mi) re do mi re do

    %25
    re si do re si(do re) do si(do re) do si re do si\mbreak
    do8 do, mi, sol do, do' mi, sol
    do,16 mi mi sol sol si si do do mi, mi do' do mi, mi do'

    %28
    la fa fa la la fa fa la re, fad fad la la dod dod re
    re fad, fad re' re fad, fad re' si sol sol si si sol sol si
    mi, sold sold si si red? red mi mi sold, sold mi' mi sold, sold mi'\mbreak

    %31
    do la la do do la la do fa, la la do do mi mi fa
    fa4 r r2
    fa4 r r2

    %34
    fa4 r r2
    fa4 r do'16 mi, mi do' do mi, mi do'
    do re, re do' do re, re do' si re, re si' si re, re si'\mbreak

    %37
    do4 r r2
    r16 fa, do la fa fa' do la fa fa' do la fa fa' do mib
    re8 re fad la fad re fad la

    %40
    sol16 sol re si sol sol' re si sol sol' re si sol sol' re fa?
    mi8 mi sold si sold mi sold si\mbreak
    la16 la mi do la la' mi do la la' mi do la la' mi sol

    %43
    fa8 fa la do la fa la do
    si16 si fa re si si' fa re si si' fa re si si' fa la
    sol8 sol si re si sol si re

    %46
    do16 mi do mi do mi do mi do mi do mi do mi do mi\mbreak
    si re si re si re si re si re si re si re si re
    do mi do mi do mi do mi do mi do mi do mi do mi

    %49
    si re si re si re si re si re si re si re si re
    do8.[do,16 do8. la'16] la8.[sol16 sol8. fad16]
    fad?8.[fad,16 fad8. si'16] si8.[la16 la8. sol16]

    %52
    sol8.[sol,16 sol8. do'16] do8.[sib16 sib8. la16]\mbreak %%fine p. 11
    la8.[la,16 la8. re'16] re8.[do16 do8. si?16]
    si8.[sol16 sol8. sol16] sol8.[sol16 fad8. fad16]

    %55
    sol8 sol, si, re sol, sol' si, re
    sol,[si'16 la sol8 fad] sol[si16 la sol8 fad]
    sol[re'16 do si8 la] si[re16 do si 8 la]

    %58
    si r re r re r re r
    re sol, si, re sol, sol' si, re\mbreak
    sol,4 r r2

    %61
    r r8 do' mi, sol
    do, do' mi, sol do,4 r
    R1

    %64
    r8 re' fa, la re, re' fa, la
    re,4 r r2
    r r8 mi' sol, si

    %67
    mi, mi' sol, si mi, mi' sol, si\mbreak
    mi,4 r r2
    sol'16 mi sol si sol mi sol si sol mi sol si sol mi sol si

    %70
    la8 re, fa la r re, fa la
    fa16 re fa la fa re fa la fa re fa la fa re fa la
    sol8 do, mi sol r do, mi sol\mbreak

    %73
    re16 si re sol re si re sol re si re sol re si re sol
    sol8 do, mi sol r do, mi sol
    re16 si re sol re si re sol re si re sol re si re sol

    %76
    mi mi, mi sol sol si si do do mi, mi do' do mi, mi do'
    la fa fa la la fa fa la re, fad fad la la dod dod re
    re fad, fad re' re fad, fad re' si sol sol si si sol sol si\mbreak

    %79
    mi, sold sold si si red? red mi mi sold, sold mi' mi sold, sold mi'
    do la la do do la la do fa, la la do do mi mi fa
    fa[sol la sol fa mi re do] si[do re do si la sol fa]

    %82
    re[mi fa mi re do si la]sol4 r
    do8 do' mi, sol do, do' mi, sol
    do, do' mi, sol do,4 r8 do'

    %85
    fa,4 sol do,2\fermata

}

IvlIn =  \relative do'' {

    r8 do mi, sol do, do' mi, sol
    \once\stemUp do, [mi'16 re do8 si] do[mi16 re do8 si]
    do[sol'16 fa mi8 re] mi[sol16 fa mi8 re]

    %4
    mi r  sol r sol r sol r
    sol do, mi, sol do, do' mi, sol
    do,[re16 mi fa sol la si] do8 do mi, sol

    %7
    do, do' mi, sol do,(mi sol si)
    do(mi sib4) la8 re fad, la\mbreak
    re, re' fad, la re,(fad la dod)

    %10
    re(fad do?4) si8 mi sold, si
    mi, mi' sold, si mi,(sold si re)
    sold(si re,4) do8[si16 la fa'8 do]

    %13
    re[do16 si sol'?8 re] mi[re16 do sol'8 re]
    mi[re16 do sol'8 re] mi16 do si do mi, do' si do
    fa, do' si do sol do si do la do si do mi, do' si do\mbreak

    %16
    fa, do' si do sol do si do la do si do mi, do' si do
    re, do' si do re, do' si do re, si' la si re, si' la si
    do4 r r2

    %19
    do,4 r r2
    do4 r r2\mbreak
    do4 r r2

    %22
    do4 r r2
    R1*3\mbreak
    r8 do' mi, sol do, do' mi, sol

    %27
    do,16 mi mi sol sol si si do do mi, mi do' do mi, mi do'
    la fa fa la la fa fa la re, fad fad la la dod dod re
    re fad, fad re' re fad, fad re' si sol sol si si sol sol si

    %30
    mi, sold sold si si red? red mi mi sold, sold mi' mi sold, sold mi'\mbreak
    do la la do do la la do fa, la la do do mi mi fa
    fa4 r r2

    %33
    fa4 r r2
    fa4 r r2
    fa4 r do'16 mi, mi do' do mi, mi do'

    %36
    do re, re do' do re, re do' si re, re si' si re, re si'\mbreak
    do4 r r2
    R1*8

    %46
    sol8 sol sol sol sol sol sol sol\mbreak
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %49
    sol sol sol sol sol sol sol sol
    do8.[do,16 do8. la'16] la8.[sol16 sol8. fad16]
    fad?8.[fad,16 fad8. si'16] si8.[la16 la8. sol16]

    %52
    sol8.[sol,16 sol8. do'16] do8.[sib16 sib8. la16]\mbreak %%fine p. 11
    la8.[la,16 la8. re'16] re8.[do16 do8. si?16]
    si8.[sol16 sol8. sol16] sol8.[sol16 fad8. fad16]

    %55
    sol8 sol, si, re sol, sol' si, re
    sol,[si'16 la sol8 fad] sol[si16 la sol8 fad]
    sol[re'16 do si8 la] si[re16 do si 8 la]

    %58
    si r re r re r re r
    re sol, si, re sol, sol' si, re\mbreak
    sol,4 r r2

    %61
    r r8 do' mi, sol
    do, do' mi, sol do,4 r
    R1

    %64
    r8 re' fa, la re, re' fa, la
    re,4 r r2
    r r8 mi' sol, si

    %67
    mi, mi' sol, si mi, mi' sol, si\mbreak
    mi,4 r r2
    R1*7

    %76
    mi'16 mi, mi sol sol si si do do mi, mi do' do mi, mi do'
    la fa fa la la fa fa la re, fad fad la la dod dod re
    re fad, fad re' re fad, fad re' si sol sol si si sol sol si\mbreak

    %79
    mi, sold sold si si red? red mi mi sold, sold mi' mi sold, sold mi'
    do la la do do la la do fa, la la do do mi mi fa
    fa[sol la sol fa mi re do] si[do re do si la sol fa]

    %82
    re[mi fa mi re do si la]sol4 r
    do8 do' mi, sol do, do' mi, sol
    do, do' mi, sol do,4 r8 do'

    %85
    fa,4 sol do,2\fermata

}

IvlIIn =  \relative do'' {

    R1
    r8 do mi, sol do, do' mi, sol
    \once\stemUp do, [mi'16 re do8 si] do[mi16 re do8 si]

    %4
    do[sol'16 fa mi8 re] mi[sol16 fa mi8 re]
    mi do mi, sol do, do' mi, sol
    do,[re16 mi fa sol la si] do8 do mi, sol

    %7
    do, do' mi, sol do,(mi sol si)
    do(mi sib4) la8 re fad, la\mbreak
    re, re' fad, la re,(fad la dod)

    %10
    re(fad do?4) si8 mi sold, si
    mi, mi' sold, si mi,(sold si re)
    sold(si re,4) do8[si16 la fa'8 do]

    %13
    re[do16 si sol'?8 re] mi[re16 do sol'8 re]
    mi[re16 do sol'8 re] mi16 do si do mi, do' si do
    fa, do' si do sol do si do la do si do mi, do' si do\mbreak

    %16
    fa, do' si do sol do si do la do si do mi, do' si do
    re, do' si do re, do' si do re, si' la si re, si' la si
    do4 r r2

    %19
    do,4 r r2
    do4 r r2\mbreak
    do4 r r2

    %22
    do4 r r2
    R1*3\mbreak
    r8 do' mi, sol do, do' mi, sol

    %27
    do,16 mi mi sol sol si si do do mi, mi do' do mi, mi do'
    la fa fa la la fa fa la re, fad fad la la dod dod re
    re fad, fad re' re fad, fad re' si sol sol si si sol sol si

    %30
    mi, sold sold si si red? red mi mi sold, sold mi' mi sold, sold mi'\mbreak
    do la la do do la la do fa, la la do do mi mi re
    re4 r r2

    %33
    re4 r r2
    re4 r r2
    re4 r do'16 mi, mi do' do mi, mi do'

    %36
    do re, re do' do re, re do' si re, re si' si re, re si'\mbreak
    do4 r r2
    R1*8

    %46
    sol8 sol sol sol sol sol sol sol\mbreak
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %49
    sol sol sol sol sol sol sol sol
    sol8.[mi16 mi8. mi16] mi8.[dod16 dod8. la16]
    la8. [re,16 re8. fad'16] fad8.[red16 red8. si16]

    %52
    si8.[mi,16 mi8. sol'16] sol8.[mi16 mi8. do16]\mbreak
    do8.[fa,16 fa8. la'16] la8.[fad16 fad8. re16]
    re8.[si16 si8. si16] la8. [la16 la8. la16]

    %55
    si4 r r2
    r8 sol si, re sol, sol' si, re
    sol, [si'16 la sol8 fad] sol[si16 la sol8 fad]

    %58
    sol[re'16 do si8 la] si[re16 do si8 la]
    si sol si, re sol, sol' si, re\mbreak
    sol,4 r r2

    %61
    r r8 do' mi, sol
    do, do' mi, sol do,4 r
    R1

    %64
    r8 re' fa, la re, re' fa, la
    re,4 r r2
    r r8 mi' sol, si

    %67
    mi, mi' sol, si mi, mi' sol, si\mbreak
    mi,4 r r2
    R1*7

    %76
    r16 mi mi sol sol si si do do mi, mi do' do mi, mi do'
    la fa fa la la fa fa la re, fad fad la la dod dod re
    re fad, fad re' re fad, fad re' si sol sol si si sol sol si\mbreak

    %79
    mi, sold sold si si red? red mi mi sold, sold mi' mi sold, sold mi'
    do la la do do la la do fa, la la do do mi mi fa
    fa[sol la sol fa mi re do] si[do re do si la sol fa]

    %82
    re[mi fa mi re do si la]sol4 r
    do8 do' mi, sol do, do' mi, sol
    do, do' mi, sol do,4 r8 do'

    %85
    fa,4 sol do,2\fermata

}

Ivlan = \relative do' {

    R1*2
    r8 do' mi, sol do, do' mi, sol
    do,[mi'16 re do8 si] do[mi16 re do8 si]

    %5
    do do mi, sol do, do' mi, sol
    do,4 r r8 do' mi, sol
    do, do' mi, sol do,4 r

    %8
    sol' sol do,8 re' fad, la\mbreak
    re, re' fad, la re,4 r
    la' la re,8 mi' sold, si

    %11
    mi, mi' sold, si mi,4 r
    si' sold mi8 mi do' do
    fa, fa re re sol sol re re

    %14
    sol sol re re sol sol mi mi
    fa fa sol sol la la mi mi\mbreak
    fa fa sol sol la la sol, sol

    %17
    la la la la sol sol sol sol'
    mi4 r r2
    do4 r r2

    %20
    do4 r r2\mbreak
    do4 r r2
    do4 r r2

    %23
    R1*3\mbreak
    r8 do' mi, sol do, do' mi ,sol
    do,4 r sol'8 sol sol sol

    %28
    do, do do do la4 r
    la'8 la la la re, re re re
    si4 r si'8 si si si\mbreak

    %31
    mi, mi mi mi do4 r
    si4 r r2
    si4 r r2

    %34
    si4 r r2
    si4 r sol'8 sol sol sol
    la la la la re, re sol sol\mbreak

    %37
    sol4 r r2
    R1*12
    mi8.[sol16 sol8. la16] la8.[la16 la8. la16]

    %51
    la4 r8 r16 red, red8.[fad16 fad8. mi16]
    mi4 r8 r16 mi mi8.[sol16 sol8. fa16]\mbreak
    fa4 r8 r16 fad fad8.[la16 la8. sol16]

    %54
    sol8.[re16 re8. re16] mi8.[mi16 re8. re16]
    re4 r re r
    re r re r

    %57
    r8 sol si, re sol, sol' si, re
    sol,[si'16 la sol8 fad] sol[si16 la sol8 fad]
    sol sol si, re sol, sol' si, re\mbreak

    %60
    sol,4 r r2
    r r8 do' mi, sol
    do, do' mi, sol do,4 r

    %63
    R1
    r8 re' fa, la re, re' fa, la
    re,4 r r2

    %66
    r r8 mi' sol, si
    mi, mi' sol, si mi, mi' sol, si\mbreak
    mi,4 r r2

    %69
    R1*7
    r2 sol8 sol sol sol
    do, do do do la4 r

    %78
    la'8 la la la re, re re re\mbreak
    si4 r si'8 si si si
    mi, mi mi mi do4 r

    %81
    si r si r
    si r si r
    do8 do' mi, sol do, do' mi, sol

    %84
    do, do' mi, sol do,4 r8 do'
    fa,4 sol do,2\fermata

}

Ibcn = \relative do {

    R1*3
    r8 do' mi, sol do, do' mi, sol
    do, do' mi, sol do, do' mi, sol

    %6
    do,4 r r8 do' mi, sol
    do, do' mi, sol do,4 r
    mi mi fa8 re' fad, la\mbreak

    %9
    re, re' fad, la re,4 r
    fad fad sol8 mi' sold, si
    mi, mi' sold, si mi,4 r

    %12
    mi mi la8 la la la
    si si si si do do si si
    do do si si do do, do do

    %15
    re re mi mi fa fa do do\mbreak
    re re mi mi fa fa do do
    fa fa fa fa sol sol sol, sol

    %18
    do4 r r2
    do4 r r2
    do4 r r2\mbreak

    %21
    do4 r r2
    do4 r r2
    R1*3\mbreak

    %26
    r8 do' mi, sol do, do' mi, sol
    do,4 r mi8 mi mi mi
    fa fa fa fa fad4 r

    %29
    fad?8 fad fad fad sol sol sol sol
    sold4 r sold8 sold sold sold\mbreak
    la la la la la4 r

    %32
    sol16 sol, sol sol' sol sol, sol sol' sol sol, sol sol' sol sol, sol sol'
    sol sol, sol sol' sol sol, sol sol' sol sol, sol sol' sol sol, sol sol'
    sol sol, sol sol' sol sol, sol sol' sol sol, sol sol' sol sol, sol sol'

    %35
    sol4 r do,8 do do do
    fa fa fa fa sol sol sol sol\mbreak
    do,4 r r2

    %38
    fa4 r r2
    fad4 r r2
    sol4 r r2

    %41
    sold4 r r2\mbreak
    la4 r r2
    la4 r r2

    %44
    si4 r r2
    si4 r r2
    do4 r r2\mbreak

    %47
    R1*3
    do,8.[do16 do8. dod16] dod8.[la16 la8. re16]
    re4 r8 r16 red red8.[si16 si8. mi16]

    %52
    mi4 r8 r16 mi mi8.[do16 do8. fa16]\mbreak
    fa4 r8 r16 fad fad8.[re16 re8. sol16]
    sol8.[sol,16 sol8. sol16] do8.[do16 re8. re16]

    %55
    sol,4 r sol r
    sol r sol r
    sol r sol r

    %58
    sol8 sol' si, re sol, sol' si, re
    sol, sol' si, re sol, sol' si, re\mbreak
    sol,4 r r2

    %61
    r r8 do' mi, sol
    do, do' mi, sol do,4 r
    R1

    %64
    r8 re' fa, la re, re' fa, la
    re,4 r r2
    r r8 mi' sol, si

    %67
    mi, mi' sol, si mi, mi' sol, si\mbreak
    mi, mi mi mi mi mi mi mi
    dod dod dod dod dod dod dod dod

    %70
    re re re re re re re re
    si si si si si si si si
    do? do do do do do do do\mbreak

    %73
    si si si si si si si si
    do do do do do do do do
    si si si si si si si si

    %76
    do4 r mi8 mi mi mi
    fa fa fa fa fad4 r
    fad?8 fad fad fad sol sol sol sol\mbreak

    %79
    sold4 r sold8 sold sold sold
    la la la la la4 r
    sol r sol r

    %82
    sol r sol r
    do,8 do' mi, sol do, do' mi, sol
    do, do' mi, sol do,4 r8 do'

    %85
    fa,4 sol do,2\fermata

}

Ibfn = \figuremode{

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*7
    s4 <6 5-> s2
    s1
    s4 <6 5> s2
    s1
    <_+>4 <7> s2
    <5>4 <6> s2
    s1*3
    <6 5>1
    s1*13
    s2 <6>
    <7>1
    s1*3
    <6 5>1
    s1*8
    <6>1
    s1*4
    s2 s8. <7>16 s8. <_+>16
    s2 s8. <7>16 s4
    s2 s8. <7->16 s4
    s2 s8. <7>16 s4
    s2 <6 5>4 <_+>
    s1*14
    <7>1
    s
    <7>
    s1*9
    <7>1

}

forma = {

    \key do\major
    \time 4/4
    \tempo 2 = 60
    s1*85
    \bar"|."

}

IobI = {
    \Iglobal
    \notypeset
    <<\IobIn \forma>>

}

IobII = {
    \Iglobal
    <<\IobIIn \forma>>

}

IvlsoloI = {
    \Iglobal
    <<\IvlsoloIn \forma>>

}

IvlsoloII = {
    \Iglobal
    <<\IvlsoloIIn \forma>>

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
    \senza
}

IIobIn = \relative do'' {

    mib16 fa sol8 sol
    sol(fa) mib
    re16 mib fa8 fa

    %4
    fa(mib) re
    mib16 fa sol8 sol
    sol(fa) mib

    %7
    sol(fa) mib
    re4.
    mib16 fa sol8 sol

    %10
    sol(fa) mib
    re16 mib fa8 fa
    fa(mib) re

    %13
    mib16 fa sol8 sol
    sol(fa) mib
    sol(fa) mib

    %16
    re4.
    sol16 lab sib8 sib
    lab(sol) lab

    %19
    fa16 sol lab8 lab
    sol(fa) sol
    mib16 fa sol8 sol

    %22
    sol(fa) mib
    re16 mib fa8 fa
    fa(mib) re

    %25
    mib16 fa sol8 sol
    sol(fa) mib
    fa(mib) re

    %28
    do4.
    sol'16 lab sib8 sib
    lab(sol) lab

    %31
    fa16 sol lab8 lab
    sol(fa) sol
    mib16 fa sol8 sol

    %34
    sol(fa) mib
    re16 mib fa8 fa
    fa(mib) re

    %37
    mib16 fa sol8 sol
    sol(fa) mib
    fa(mib) re

    %40
    do4.\fermata
    mi16 fa sol8 sol
    sol(fa) mi

    %43
    re16 mi fa8 fa
    fa(mi) re
    mi16 fa sol8 sol

    %46
    sol(fa) mi
    sol(fa) mi
    re4.

    %49
    sol16 la sol fa mi re
    mi8 sol r
    la16 si la sol fa mi

    %52
    fa8 la r
    si16 do si la sol fa\mbreak
    sol8 si r

    %55
    do16 re do si la sol
    la8 do r
    re16 do si la sol fa

    %58
    mi16 fa sol8 sol
    sol(fa) mi
    re16 mi fa8 fa

    %61
    fa(mi) re
    mi16 fa sol8 sol
    sol(fa) mi

    %64
    fa(mi) re
    do4.\fermata

}

IIobIIn = \relative do'' {

    do16 re mib8 mib
    mib(re) do
    si16 do re8 re

    %4
    re(do) si
    do16 re mib8 mib
    mib(re) do

    %7
    mib(re) do
    si4.
    do16 re mib8 mib

    %10
    mib(re) do
    si16 do re8 re
    re(do) si

    %13
    do16 re mib8 mib
    mib(re) do
    mib(re) do

    %16
    si4.
    mi16 fa sol8 sol
    fa(mi) fa

    %19
    re16 mib! fa8 fa
    mib(fa) mib
    do16 re mib8 mib

    %22
    mib(re) do
    si16 do re8 re
    re(do) si

    %25
    do16 re mib8 mib
    mib(re) do
    re(do) si

    %28
    do4.
    mi16 fa sol8 sol
    fa(mi) fa

    %31
    re16 mib? fa8 fa\mbreak
    mib(re) mib
    do16 re mib8 mib

    %34
    mib(re) do
    si16 do re8 re
    re(do) si

    %37
    do16 re mib8 mib
    mib(re) do
    re(do) si

    %40
    do4.\fermata
    do16 re mi8 mi
    mi(re) do

    %43
    si16 do re8 re
    re(do) si
    do16 re mi8 mi

    %46
    mi(re) do
    mi(re) do
    si4.

    %49
    si16 do si la sol fa
    sol8 mi' r
    do16 re do si la sol

    %52
    la8 fa' r
    re16 mi re do si la\mbreak
    si8 sol' r

    %55
    mi16 fa mi re do si
    do8 la' r
    si16 la sol fa mi re

    %58
    do re mi8 mi
    mi(re) do
    si16 do re8 re

    %61
    re(do) si
    do16 re mi8 mi
    mi(re) do

    %64
    re(do) si
    do4.\fermata

}

IIvlIn =  \relative do'' {

    do,4 do'8
    do,4.
    sol4 sol'8

    %4
    sol,4.
    do4 do'8
    do,4.

    %7
    do4 do'8
    sol4.
    mib'16 fa sol8 sol

    %10
    sol(fa) mib
    re16 mib fa8 fa
    fa(mib) re

    %13
    mib16 fa sol8 sol
    sol(fa) mib
    sol(fa) mib

    %16
    re4.
    do,4 do'8
    fa,4.

    %19
    sib,4 sib'8
    mib,4.
    mib4 do'8

    %22
    do,4.
    sol4 sol'8
    sol,4.

    %25
    do4 do'8
    do,4.
    sol4 sol'8

    %28
    do,4.
    sol''16 lab sib8 sib
    lab(sol) lab

    %31
    fa16 sol lab8 lab
    sol(fa) sol
    mib16 fa sol8 sol

    %34
    sol(fa) mib
    re16 mib fa8 fa
    fa(mib) re

    %37
    mib16 fa sol8 sol
    sol(fa) mib
    fa(mib) re

    %40
    do4.\fermata
    mi16 fa sol8 sol
    sol(fa) mi

    %43
    re16 mi fa8 fa
    fa(mi) re
    mi16 fa sol8 sol

    %46
    sol(fa) mi
    sol(fa) mi
    re4.

    %49
    sol16 la sol fa mi re
    mi8 sol r
    la16 si la sol fa mi

    %52
    fa8 la r
    si16 do si la sol fa\mbreak
    sol8 si r

    %55
    do16 re do si la sol
    la8 do r
    re16 do si la sol fa

    %58
    mi16 fa sol8 sol
    sol(fa) mi
    re16 mi fa8 fa

    %61
    fa(mi) re
    mi16 fa sol8 sol
    sol(fa) mi

    %64
    fa(mi) re
    do4.\fermata

}

IIvlIIn =  \relative do'' {

    do,4 do'8
    do,4.
    sol4 sol'8

    %4
    sol,4.
    do4 do'8
    do,4.

    %7
    do4 do'8
    sol4.
    do16 re mib8 mib

    %10
    mib(re) do
    si16 do re8 re
    re(do) si

    %13
    do16 re mib8 mib
    mib(re) do
    mib(re) do

    %16
    si4.
    do,4 do'8
    fa,4.

    %19
    sib,4 sib'8
    mib,4.
    mib4 do'8

    %22
    do,4.
    sol4 sol'8
    sol,4.

    %25
    do4 do'8
    do,4.
    sol4 sol'8

    %28
    do,4.
    mi'16 fa sol8 sol
    fa(mi) fa

    %31
    re16 mib? fa8 fa\mbreak
    mib(re) mib
    do16 re mib8 mib

    %34
    mib(re) do
    si16 do re8 re
    re(do) si

    %37
    do16 re mib8 mib
    mib(re) do
    re(do) si

    %40
    do4.\fermata
    do16 re mi8 mi
    mi(re) do

    %43
    si16 do re8 re
    re(do) si
    do16 re mi8 mi

    %46
    mi(re) do
    mi(re) do
    si4.

    %49
    si16 do si la sol fa
    sol8 mi' r
    do16 re do si la sol

    %52
    la8 fa' r
    re16 mi re do si la\mbreak
    si8 sol' r

    %55
    mi16 fa mi re do si
    do8 la' r
    si16 la sol fa mi re

    %58
    do re mi8 mi
    mi(re) do
    si16 do re8 re

    %61
    re(do) si
    do16 re mi8 mi
    mi(re) do

    %64
    re(do) si
    do4.\fermata

}

IIvlan = \relative do' {

    R4.*8
    sol'4 sol8
    sol4.

    %11
    sol4 sol8
    sol4.
    sol4 sol8

    %14
    sol4.
    sol4 sol8
    sol4.\mbreak

    %17
    R4.*12
    sib8 sol mi
    do4.

    %31
    lab'8 fa re\mbreak
    sib4.
    sol'4 mib8

    %34
    do4.
    fa4 re8
    si4.

    %37
    sol'4 mib8
    do4.
    si4 sol'8

    %40
    mib4.\fermata
    sol4 mi8
    do4.

    %43
    fa4 re8
    si4.
    sol'4 mi8

    %46
    do4.
    do4 sol'8
    sol4.

    %49
    re4 r8
    mi16 fa mi re do si
    la8 la' r

    %52
    fa16 sol fa mi re do
    si8 si' r\mbreak
    sol16 la sol fa mi re

    %55
    do8 do' r
    la16 si la sol fa mi
    re4 r8

    %58
    sol4 mi8
    do4.
    fa4 re8

    %61
    si4.
    sol'4 mi8
    do4 sol'8

    %64
    sol4 sol8
    mi4.\fermata

}

IIbcn = \relative do {

    R4.*8
    do4 do'8
    do,4.

    %11
    sol4 sol'8
    sol,4.
    do4 do'8

    %14
    do,4.
    do4 do'8
    sol4.

    %17
    R4.*12
    do,4 do'8
    fa,4.

    %31
    sib,4 sib'8
    mib,4.
    mib4 do'8

    %34
    do,4.
    sol4 sol'8
    sol,4.

    %37
    do4 do'8
    do,4.
    sol4 sol'8

    %40
    do,4.\fermata
    do8 do' do,
    do do' do,

    %43
    sol sol' sol,
    sol sol' sol,
    do do' do,

    %46
    do do' do,
    do do' do,
    sol4.

    %49
    sol'4 r8
    do16 re do si la sol
    fa8 fa, r

    %52
    re''16 mi re do si la
    sol8 sol, r
    mi''16 fa mi re do si

    %55
    la8 la, r
    fa''16 sol fa mi re do
    si8 si, r

    %58
    do do' do,
    do do' do,
    sol sol' sol,

    %61
    sol sol' sol,
    do do' do,
    do do' do,

    %64
    sol sol' sol,
    do4.\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*10
    <7 _!>4.
    s4.*17
    <7 _!>4.
    s4.*3
    <6>4.
    s
    <7 _!>
    s
    s
    s
    <7 _!>
    s
    s
    s
    <7>
    s4.*16
    <7>4.
    s
    s
    s
    <7>

}

forma = {

    \key sol\minor
    \time 3/8
    \tempo 4 = 60
    s4.*8 \bar"||"
    s4.*8 \bar"||"
    s4.*12 \bar"||"
    s4.*12 \bar"||"\break
    \key do\major
    \time 3/8 \bar ".|:"
    s4.*8\break \bar ":..:"
    s4.*17
    \bar":|."

}

IIobI = {
    \IIglobal
    %\notypeset
    <<\IIobIn \forma>>

}

IIobII = {
    \IIglobal
    <<\IIobIIn \forma>>

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

#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

\paper  {

    systems-per-page = #2

}


    \markup\huge\bold\fill-line{"Ottone in Villa [RV 729, 1713] - Sinfonia"}
    \markup \fill-line{"  ""  ""A. Vivaldi (1678-1741)"}

\markup\huge "[1.] All[egr]o"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    }<<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName =  \markup \center-column{"Oboè [1.]"}
                \set Staff.midiInstrument = #"oboe"
                \IobI
            >>

            \new Staff <<
                \set Staff.instrumentName =  \markup \center-column{"Oboè [2.]"}
                \set Staff.midiInstrument = #"oboe"
                \IobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Viol[in]o [I]""Solo"}
                \IvlsoloI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino II""Solo]"}
                \IvlsoloII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino 1.]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino 2.]"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \Ivla
        >>
        \new Staff  \with {
            fontSize = #+2
            \override StaffSymbol.staff-space = #(magstep +2)
        } <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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

    systems-per-page = #3

}

\markup\huge "[2.] Larghetto"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    }<<

        \new PianoStaff \with {instrumentName = \markup\huge\center-column{"2 Oboè"}} <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIobII
            >>
        >>

        \new PianoStaff \with {instrumentName = \markup\huge\center-column{"Violini"}} <<

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
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \IIvla
        >>
        \new Staff  \with {
            fontSize = #+2
            \override StaffSymbol.staff-space = #(magstep +2)
        } <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \IIbc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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
