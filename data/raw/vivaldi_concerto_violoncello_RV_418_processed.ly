\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

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
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IvlIn =  \relative do'' {

  la4 la,8 do' si la
  mi'4 mi, r
  la'8(mi do la mi[do])

  %4
  la do(mi la do mi)
  sold,8. la16 si4 r
  si'8(sold re si sold re)

  %7
  sold, si(mi sold si re)
  do8.\tr si16 la4 r\mbreak
  fa' fa4.\tr(mi16 fa)

  %10
  si4 re, r
  mi mi4.\tr(re16 mi)
  la4 do, r

  %13
  re re4.\tr(do16 re)
  \senza  \tuplet 3/2 { mi,8 mi'-.(re-. do-.[si-. la-.] sold-. fad-. mi-.) }
  do'4 r16 do re mi la,8 mi

  %16
  fa4 r16 re' mi fa re8 la\mbreak
  sold4 r16 sold' la si re,8 si
  do sib4 la sold8

  %19
  do re4 mi la,8
  sold'16(la) sold(la) sold(la) sold(la) do,(la) si(sold)
  la(la') sold(la) sold(la) sold(la) do,(la) si(sold)

  %22
  la4 r r %%%%%%%%%% fine ripresa
  la,8 do mi la do, la\mbreak
  re fa la re fa, re

  %25
  mi sold si mi sold, mi
  la, do mi la do, la
  re fa la re fa, re

  %28
  sol,? si re sol si, sol
  do mi sol do mi, do\mbreak
  la fa' la fa do[la]

  %31
  si si' re si re, si
  do4 r r
  r8 do mi sol do do,

  %34
  re4 r r
  r8 sol, si re sol si,
  do4 do do\mbreak

  %37
  re re re
  mi mi mi
  fa fa fa

  %40
  sol sol sol
  mi r r
  R2.*3

  %45
  do'4 do,8 mi' re do\mbreak
  sol'4 sol, r  %%%%%% inizio p. 4
  do'8(sol mi do sol mi)

  %48
  do mi(sol do mi sol)
  si,8. do16 re4 r
  si'8(fa re si fa re)

  %51
  sol, si(re sol si re)
  mi8.\tr re16 do4 r
  mi r16 mi fa sol do,8 sol

  %54
  la4 r16 fa' sol la re,8 la
  si4 r16 si' do re fa,8 re\mbreak
  mi8 re4 do si8

  %57
  mi fa4 sol do,8
  fa16(sol) fa(sol) fa(sol) fa(sol) mi(do) re(si)
  do(sol') fa(sol) fa(sol) fa(sol) mi(do) re(si)

  %60
  do4 r r
  R2.*3
  mi,8\pp sol do mi sol r\mbreak

  %65
  mi, sol do mi sol r
  fa, la do fa la r
  fad, la re fad la r

  %68
  fad, la re fad la r
  sol, si re sol si r
  sold, si mi sold si r

  %71
  sold, si mi sold si r
  la, do mi la do r\mbreak
  la, do fa la do r

  %74
  sol, si re sol si r
  sol, si re sol si r
  sol2.

  %77
  fa~
  fa
  mi~

  %80
  mi\mbreak
  re~
  re~

  %83
  re
  mi4 r r
  R2.*9

  %94
  mi4 mi,8 sol' fad mi
  si'4 si,8 red dod si
  sold'4 mi,8 re'? do? si\mbreak

  %97
  do4 la, r
  fa''? fa4.\tr(mi16 fa)
  si4 re, r

  %100
  mi mi4.\tr(re16 mi)
  la4 do, r
  re re4.\tr(do16 re)

  %103
  \tuplet 3/2 { mi,8 mi'-.(re-. do-.[si-. la-.] sold-. fad-. mi-.) }
  do'4 r r
  R2.*7

  %112
  mi,8(sold si mi si sold)
  mi(la do mi sold mi)
  do(mi la do mi, do)

  %115
  la(re fa la fa re)
  la(re fa re la fa)
  re4 r r\mbreak

  %118
  R2.*2
  la'8 r re, r fad r
  sol r do, r mi r

  %122
  fa? r si, r re r
  mi4 mi mi
  re re re\mbreak

  %125
  do do do
  si si si
  la r r

  %128
  r8 la(do mi la do)
  re,4 r r
  r8 mi sold si mi mi,

  %131
  la4 r r\mbreak
  la,8 la' sold fad sold mi
  la, la' fa? mi fa re

  %134
  la la' do si do la
  re dod re fa, mi re
  mi fa mi re do si

  %137
  la4 r r
  R2.*3
  la'4 la,8 do' si la

  %142
  mi'4 mi, r
  la'8(mi do la mi[do])
  la do(mi la do mi)

  %145
  sold,8. la16 si4 r
  si'8(sold re si sold re)
  sold, si(mi sold si re)

  %148
  do8.\tr si16 la4 r\mbreak
  fa' fa4.\tr(mi16 fa)
  si4 re, r

  %151
  mi mi4.\tr(re16 mi)
  la4 do, r
  re re4.\tr(do16 re)

  %154
  \senza  \tuplet 3/2 { mi,8 mi'-.(re-. do-.[si-. la-.] sold-. fad-. mi-.) }
  do'4 r16 do re mi la,8 mi
  fa4 r16 re' mi fa re8 la\mbreak

  %157
  sold4 r16 sold' la si re,8 si
  do sib4 la sold8
  do8 re4 mi la,8

  %160
  sold'16(la) sold(la) sold(la) sold(la) do,(la) si(sold)
  la(la') sold(la) sold(la) sold(la) do,(la) si(sold)
  la4\fermata r r

}

IvlIIn = \relative do'' {

  la4 la,8 do' si la
  mi'4 mi, r
  la'8(mi do la mi[do])

  %4
  la do(mi la do mi)
  sold,8. la16 si4 r
  si'8(sold re si sold re)

  %7
  sold, si(mi sold si re)
  do8.\tr si16 la4 r\mbreak
  re re4.\tr(do16 re)

  %10
  fa4 si, r
  do do4.\tr(si16 do)
  mi4 la, r

  %13
  si si4.\tr (la16 si)
  \senza  \tuplet 3/2 { mi,8 mi'-.(re-. do-.[si-. la-.] sold-. fad-. mi-.) }
  do'4 r16 do re mi la,8 mi

  %16
  fa4 r16 re' mi fa re8 la\mbreak
  sold4 r16 sold' la si re,8 si
  do sib4 la sold8

  %19
  do re4 mi la,8
  si?16(do) si(do) si(do) si(do) la(do) re(si)
  la(do) si(do) si(do) si(do) la(do) re(si)

  %22
  la4 r r %%%%%%%% fine ripresa
  la,8 do mi la do, la\mbreak
  re fa la re fa, re

  %25
  mi sold si mi sold, mi
  la, do mi la do, la
  re fa la re fa, re

  %28
  sol,? si re sol si, sol
  do mi sol do mi, do\mbreak
  la fa' la fa do[la]

  %31
  si si' re si re, si
  do4 r r
  r8 do mi sol do do,

  %34
  re4 r r
  r8 sol, si re sol si,
  do4 do do\mbreak

  %37
  re re re
  mi mi mi
  fa fa fa

  %40
  sol sol sol
  mi r r
  R2.*3

  %45
  do'4 do,8 mi' re do\mbreak
  sol'4 sol, r  %%%%%% inizio p. 4
  sol'8(mi do sol mi do)

  %48
  sol do(mi sol do mi)
  re8. do16 si4 r
  fa'8(re si fa re si)

  %51
  si re(sol si re si)
  do8. re16 mi4 r
  mi r16 mi fa sol do,8 sol

  %54
  la4 r16 fa' sol la re,8 la
  si4 r16 si' do re fa,8 re\mbreak
  mi8 re4 do si8

  %57
  mi fa4 sol do,8
  re16(mi) re(mi) re(mi) re(mi) do(mi) fa(re)
  do(mi) re(mi) re(mi) re(mi) do(mi) fa(re)

  %60
  do4 r r
  R2.*3
  do,8\pp mi sol do mi r\mbreak

  %65
  do, mi sol do mi r
  do, fa la do fa r
  re, fad la re fad r

  %68
  re, fad la re fad r
  re, sol si re sol r
  mi, sold si mi sold r

  %71
  mi, sold si mi sold r
  mi, la do mi la r\mbreak
  fa, la do fa la r

  %74
  re,, sol si re sol r
  re, sol si re sol r
  mi2.

  %77
  la
  si
  sol

  %80
  la~\mbreak
  la
  sol

  %83
  fa2 si,4
  sol r r
  R2.*9

  %94
  mi'4 mi,8 sol' fad mi
  si'4 si,8 red dod si
  sold'4 mi,8 re'? do? si\mbreak

  %97
  do4 la, r
  re' re4.\tr(do16 re)
  fa4 si, r

  %100
  do do4.\tr(si16 do)
  mi4 la, r
  si si4.\tr(la16 si)

  %103
  \tuplet 3/2 { mi,8 mi'-.(re-. do-.[si-. la-.] sold-. fad-. mi-.) }
  do'4 r r
  R2.*7

  %112
  si,8 (mi sold si sold mi)
  do (mi la do mi si)
  la(do mi la do, la)

  %115
  fa(la re fa re la)
  \once\slurDashed fa (la re fa re la)
  fa4 r r

  %118
  R2.*2
  la8 r re, r fad r
  sol r do, r mi r

  %122
  fa? r si, r re r
  mi4 mi mi
  re re re\mbreak

  %125
  do do do
  si si si
  la r r

  %128
  r8 la(do mi la do)
  re,4 r r
  r8 mi sold si mi mi,

  %131
  la4 r r\mbreak
  la,8 la' sold fad sold mi
  la, la' fa? mi fa re

  %134
  la la' do si do la
  re dod re fa, mi re
  mi fa mi re do si

  %137
  la4 r r
  R2.*3
  la'4 la,8 do' si la

  %142
  mi'4 mi, r
  la'8(mi do la mi[do])
  la do(mi la do mi)

  %145
  sold,8. la16 si4 r
  si'8(sold re si sold re)
  sold, si(mi sold si re)

  %148
  do8.\tr si16 la4 r\mbreak
  re re4.\tr(do16 re)
  fa4 si, r

  %151
  do do4.\tr(si16 do)
  mi4 la, r
  si si4.\tr (la16 si)

  %154
  \tuplet 3/2 { mi,8 mi'-.(re-. do-.[si-. la-.] sold-. fad-. mi-.) }
  do'4 r16 do re mi la,8 mi
  fa4 r16 re' mi fa re8 la\mbreak

  %157
  sold4 r16 sold' la si re,8 si
  do sib4 la sold8
  do8 re4 mi la,8

  %160
  si16(do) si(do) si(do) si(do) la(do) re(si)
  la(do) si(do) si(do) si(do) la(do) re(si)
  la4\fermata r r

}

Ivlan = \relative do'{

  la'4 la,8 do' si la
  mi'4 mi, r
  do do do

  %4
  do do do
  si sold r
  sold? sold sold

  %7
  si si sold'
  mi do r\mbreak
  la' la fa

  %10
  re4. si8(re si)
  sol'?4 sol mi
  do4. la8(do la)

  %13
  fa'4 fa re
  si do si8 sold
  mi4 r r8 do'

  %16
  la4 r r8 fa'\mbreak
  si,4 r r8 sold'
  mi4 fa si,8 mi

  %19
  mi4 mi mi
  mi8 mi mi mi mi sold
  mi mi mi mi mi sold

  %22
  mi4 r r %%%% fine ripresa  OOOKKKK
  R2.*22
  do'4 do,8 mi' re do

  %46
  sol4 sol, r
  mi' mi mi
  mi mi mi

  %49
  sol sol, r
  re' re re
  re re si

  %52
  sol sol r
  sol' r r8 mi
  do4 r r8 fa

  %55
  re4 r r8 si'\mbreak
  sol4 la re,8 sol
  sol4 sol mi

  %58
  si'16 sol si sol si sol si sol sol8 si
  sol16 sol si sol si sol si sol sol8 si
  sol4 r r

  %61
  R2.*3
  do,4\pp do do\mbreak
  do do do

  %66
  fa, fa fa
  re' re re
  re re re

  %69
  sol, sol sol
  mi' mi mi
  mi mi mi

  %72
  la, la la\mbreak
  fa' fa fa
  sol sol sol

  %75
  fa fa fa
  mi do do
  re re re

  %78
  sol sol sol
  do, do do
  fa fa fa\mbreak

  %81
  si, si si
  si si si
  sol sol sol

  %84
  do4 r r
  R2.*9
  sol'4 sol sol

  %95
  fad fad fad
  si, si sold'\mbreak
  mi do r

  %98
  la' la fa?
  re4. si8 (re si)
  sol'4 sol mi

  %101
  do4. la8(do la)
  fa'4 fa re
  si4 do si8 sold

  %104
  mi4 r r\mbreak
  R2.*15
  la'8 r re, r fad r
  sol r do, r mi r

  %122
  fa? r si, r re r
  mi4 mi mi
  re re re\mbreak

  %125
  do do do
  si si si
  la r r

  %128
  r8 la(do mi la do)
  re,4 r r
  r8 mi sold si mi mi,

  %131
  la4 r r\mbreak
  la,8 la' sold fad sold mi
  la, la' fa? mi fa re

  %134
  la la' do si do la
  re dod re fa, mi re
  mi fa mi re do si

  %137
  la4 r r
  R2.*3
  la'4 la,8 do' si la

  %142
  mi'4 mi, r
  do do do
  do do do

  %145
  si sold r
  sold? sold sold
  si si sold'

  %148
  mi do r\mbreak
  la' la fa
  re4. si8(re si)

  %151
  sol'?4 sol mi
  do4. la8(do la)
  fa'4 fa re

  %154
  si do si8 sold
  mi4 r r8 do'
  la4 r r8 fa'\mbreak

  %157
  si,4 r r8 sold'
  mi4 fa si,8 mi
  mi4 mi mi

  %160
  mi8 mi mi mi mi sold
  mi mi mi mi mi sold
  mi4\fermata r r

}

Ivcn = \relative do {

  la'4 la,8 do' si la
  mi'4 mi, r
  la, la la

  %4
  la la la
  mi'8(sold si mi si sold)
  mi4 mi mi

  %7
  mi mi mi
  la,8(do mi la do la)\mbreak
  re,(fa la re fa re)

  %10
  sol,,?(si re sol si sol)
  do,(mi sol do mi do)
  fa,,(la do fa la fa)

  %13
  si,(re fa si re si)
  sold4 la mi
  la, r r8 la

  %16
  re4 r r8 re\mbreak
  mi4 r r8 mi
  la,4 re mi

  %19
  la, la' la,
  mi'16 la mi la mi la mi la la,8 mi'
  la,16 la' mi la mi la mi la la,8 mi'

  %22
  la4 la,8 do' si la
  \clef tenor mi'4 mi4.\tr(re16 mi)\mbreak
  \appoggiatura mi8 fa4 r16 re mi fa la, re mi fa

  %25
  sold,4 \clef bass r16 sold la si mi, re do si
  do8 la r16 do' re mi la, do re mi
  re, fa sol la re, fa sol la re, fa sol la

  %28
  sol,? si' do re sol, si do re sol, si do re
  do, mi fa sol do, mi fa sol do, mi fa sol
  fa, la' si do fa, la si do fa, la si do

  %31
  fa, si do re fa, si do re fa, si do re
  mi,8 do(mi sol\clef tenor do mi)
  sol4 \appoggiatura fa8 mi4.\tr(re16 mi)

  %34
  fa8\clef bass sol,,(si re sol si)
  \clef tenor fa'4\appoggiatura mi8 re2\tr
  mi16(fa) mi(fa) mi(fa) mi(fa) mi(fa) mi(sol)\mbreak

  %37
  fa8-.(fa-.fa-. fa-. fa-. fa-.)
  sol16 la sol la sol la sol la sol la sol si
  la8 la la la la la

  %40
  si16 do si do si do si do si do si re
  do4 \clef bass r8 sol, mi do
  sol do' re2\tr

  %43
  do4 r16 sol[fa mi re do si la]
  sol8 do' re2\tr
  do4 do,8  mi' re do\mbreak  %%%fine p 3

  %46  OO KKKK
  \clef tenor sol'4 sol, r
  \clef bass do, do do
  do do do

  %49
  sol8(si re sol re si)
  sol4 sol sol
  sol sol sol

  %52
  do8 mi sol do sol mi
  do4 r r8 do
  fa4 r r8 fa

  %55
  sol4 r r8 sol,\mbreak
  do4 fa sol
  do, do do

  %58
  sol16 do sol do sol do sol do do8 sol
  do,16 do' sol do sol do sol do do8 sol
  do4 r16 do' si do sol do fa, do'

  %61
  mi,4 r16 do' si do mi, do' re, do'
  do,4 \clef tenor sol''4. fa16 mi
  re4 la'4. sol16 fa

  %64
  do mi do mi do mi do mi do mi do mi\mbreak
  sib mi sib mi sib mi sib mi sib mi sib mi
  la, fa' la, fa' la, fa' la, fa' la, fa' la, fa'

  %67
  re fad re fad re fad re fad re fad re fad
  do fad? do fad do fad do fad do fad do fad
  si,? sol' si, sol'  si, sol' si, sol'  si, sol' si, sol'

  %70
  mi sold mi sold mi sold mi sold mi sold mi sold
  re sold? re sold re sold re sold re sold re sold
  do, la' do, la' do,  la' do, la' do, la' do, la'\mbreak

  %73
  \clef violin la(sol la) la  la(sol la) la  la(sol la) la
  re, si' re, si' re, si' re, si' re, si' re, si'
  si(la si) si si(la si) si si(la si) si

  %76
  mi, do' mi, do' mi, do' mi, do' mi, do' mi, do'
  fa, do' fa, do' fa, do' fa, do' fa, do' fa, do'
  re, si' re, si' re, si' re, si' re, si' re, si'

  %79
  mi, si' mi, si'  mi, si' mi, si'  mi, si' mi, si'
  do, la' do, la' do, la' do, la' do, la' do, la'\mbreak
  re, la' re, la' re, la' re, la' re, la' re, la'

  %82
  si, sol' si, sol' si, sol' si, sol' si, sol' si, sol'
  si, fa' si, fa' si, fa' si, fa' si, fa' si, fa'
  mi8 do \clef bass sol mi do r

  %85
  \clef tenor do'16 re mi do la si do la fad sol la fad
  si,8(red fad) do'_\upl si_\upl fad_\upl
  mi(sol si) mi\upl sol\upl si,

  %88
  do16 re do la red mi red si mi8 r
  \clef violin r8 mi-.(fad-. sol-. la-. si-.)
  do4(si) la

  %91
  sol8\clef tenor mi,-.(fad-. sol-. la-. si-.)
  do4(si) la
  \clef bass sol8 mi la, mi' si red

  %94
  mi4 mi mi
  red red red
  mi mi mi\mbreak

  %97
  la,8(do mi la do la)
  re,?(fa la re fa re)
  sol,, si (re sol si sol)

  %100
  do,(mi sol do mi do)
  fa,, la (do fa la fa)
  si,(re fa si re si)

  %103
  sold4 la mi
  \terzinequarto\con \tuplet 3/2 {la,8 la'(si) do[(si) la]} la, la'\mbreak
  \tuplet 3/2 { re, re'(mi) fa[(mi) re] } re, fa'

  %106
  sol,,? si'16(do) re(do) re(do) si(la) sol(fa)
  mi8\clef tenor do'16(re) mi(re) mi(re) do(si) la(sol)
  fa8 re'16(mi) fa(mi) fa(mi) re(do) si( la)

  %109
  sol8 mi'16(fa) sol(fa) sol(fa) mi(re) do(si)
  la8(fa') fa(la) la(fa)
  fa(re) re(do) si(la)\mbreak

  %112
  sold fad mi4 r16 mi fad sold
  la si do8\upl r4 r16 sold la si
  do re  mi8 r4 r16 la, si do  %%%%%%% b 114 =K

  %115
  re mi fa8 r4 r16 la, re mi
  fa sol la8 r16 la sol la fa la sol la
  re,4 r16 \clef violin si' la si sold si la si

  %118
  mi,4 r16 do' si do la do si do
  fa,4 r8 re' re do16 si
  do8 [mi, fa do' do si16 la]

  %121
  si8[red, mi si' si la16 sold]
  la8[dod, re? la' la sold16 fad?]
  sold la sold mi sold la sold mi sold la sold mi

  %124
  fa ? sol? fa re fa sol fa re fa sol fa re
  mi fa mi do mi fa mi do mi fa mi do
  re mi re si re mi re si re mi re si

  %127
  do8\clef bass la,(do mi la do)
  \clef tenor mi4 mi4.\tr(re16 mi)
  fa8 re,(fa la re[fa)]

  %130
  sold4 sold4.\tr(fad16 sold)
  la8 mi do la \clef bass mi[do]\mbreak
  la4 \clef tenor si'4.\tr(la16 si)

  %133
  do4 re4.\tr(do16 re)
  mi8-.(mi-. mi-. mi-. mi-. mi-.)
  fa!-.(fa-. fa-. fa-. fa-. fa-.)

  %136
  sold-.(sold-. sold-. sold-. sold-. sold-.)
  la4 r16 \clef bass mi do la mi la mi do
  la8 la'16 si si2\tr

  %139
  la4 r16 mi' do la mi la mi do\mbreak
  la8 la'16 si si2\tr
  la4 la,8 do' si la

  %142
  mi'4 mi, r
  la, la la
  la la la

  %145
  mi'8(sold si mi si sold)
  mi4 mi mi
  mi mi mi

  %148
  la,8(do mi la do la)\mbreak
  re,(fa la re fa re)
  sol,,?(si re sol si sol)

  %151
  do,(mi sol do mi do)
  fa,,(la do fa la fa)
  si,(re fa si re si)

  %154
  sold4 la mi
  la, r r8 la
  re4 r r8 re\mbreak

  %157
  mi4 r r8 mi
  la,4 re mi
  la, la' la,

  %160
  mi'16 la mi la mi la mi la la,8 mi'
  la,16 la' mi la mi la mi la la,8 mi'
  la4\fermata r r

}

Ibcn = \relative do {

  la'4 la,8 do' si la
  mi'4 mi, r
  la, la la

  %4
  la la la
  mi'8(sold si mi si sold)
  mi4 mi mi

  %7
  mi mi mi
  la,8(do mi la do la)\mbreak
  re,(fa la re fa re)

  %10
  sol,,?(si re sol si sol)
  do,(mi sol do mi do)
  fa,,(la do fa la fa)

  %13
  si,(re fa si re si)
  sold4 la mi
  la, r r8 la

  %16
  re4 r r8 re\mbreak
  mi4 r r8 mi
  la,4 re mi

  %19
  la, la' la,
  mi'16 la mi la mi la mi la la,8 mi'
  la,16 la' mi la mi la mi la la,8 mi'

  %22
  la,4 la r %%%%%%%%%% fine ripresa
  la la r\mbreak
  re re r

  %25
  mi mi r
  la, la r
  re re r

  %28
  sol, sol r
  do do r\mbreak
  fa, fa fa

  %31
  sol sol sol
  do r r
  do do do

  %34
  sol r r
  sol sol sol
  do r r\mbreak

  %37
  R2.*4
  do4 r8 sol' mi do
  sol do sol'[fa sol sol,]

  %43
  do4 r8 sol' mi do
  sol do sol'[fa sol sol,]
  do'4 do,8  mi' re do\mbreak  %%%fine p 3

  %46  OO KKKK
  \clef tenor sol'4 sol, r
  \clef bass do, do do
  do do do

  %49
  sol8(si re sol re si)
  sol4 sol sol
  sol sol sol

  %52
  do8 mi sol do sol mi
  do4 r r8 do
  fa4 r r8 fa

  %55
  sol4 r r8 sol,\mbreak
  do4 fa sol
  do, do do

  %58
  sol16 do sol do sol do sol do do8 sol
  do,16 do' sol do sol do sol do do8 sol
  do4 r mi8 re

  %61
  do4 r do8 si
  do si do re mi do
  sol' re si do re sol,

  %64
  do2._\markup\italic \bold\larger"[pp]"]~\mbreak
  do
  fa,

  %67
  re'~
  re
  sol,

  %70
  mi'~
  mi
  la,\mbreak

  %73
  fa'
  sol
  fa

  %76
  mi4 do2
  re2.
  sol

  %79
  do,
  fa\mbreak
  si,~

  %82
  si
  sol
  do4 r r

  %85
  la2.
  si
  mi

  %88
  la,8 la' si la sol fad\mbreak
  mi2.
  la4 red,2

  %91
  mi2.
  la4 red,2
  mi4 la, si

  %94
  mi mi mi
  red red red
  mi mi mi\mbreak

  %97
  la,8(do mi la do la)
  re,?(fa la re fa re)
  sol,, si (re sol si sol)

  %100
  do,(mi sol do mi do)
  fa,, la (do fa la fa)
  si,(re fa si re si)

  %103
  sold4 la mi
  la, r la\mbreak
  re r re

  %106
  sol, r r
  do r r
  re r r

  %109
  mi r r
  fa re2~
  re red4\mbreak

  %112
  mi mi mi
  la, la' mi
  la, la la'

  %115
  re, re re
  re re re
  re mi re\mbreak

  %118
  do fa mi
  re sold mi
  la r r

  %121
  R2.*17
  la,4 mi' mi,
  la r r

  %140
  la mi' mi,
  la4 la8 do' si la
  mi'4 mi, r

  %143
  la, la la
  la la la
  mi'8(sold si mi si sold)

  %146
  mi4 mi mi
  mi mi mi
  la,8(do mi la do la)\mbreak

  %149
  re,(fa la re fa re)
  sol,,(si re sol si sol)
  do,(mi sol do mi do)

  %152
  fa,,(la do fa la fa)
  si,(re fa si re si)
  sold4 la mi

  %155
  la, r r8 la
  re4 r r8 re\mbreak
  mi4 r r8 mi

  %158
  la,4 re mi
  la, la' la,
  mi'16 la mi la mi la mi la la,8 mi'

  %161
  la,16 la' mi la mi la mi la la,8 mi'
  la,4\fermata r r %%%%%%%%%% fine ripresa

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key la\minor
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 55
  s2.*162
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

Ivla = {
  \Iglobal
  \clef alto
  <<\Ivlan \forma>>

}

Ivc = {
  \Iglobal
  \clef bass
  <<\Ivcn \forma>>

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

  dod8 (re) r16 la fa re si'?8(do?) r16 mi, do la
  mi''8(fa) r16 la, fa re sib'2 %%%%%% a metà inizia ripresa
  si do

  %4
  dod re
  mi8(fa) r16 la, fa re\mbreak r la'' sol fa sol8 mi
  re4 r la,8 si dod la %%%%%  a metà fine ripresa

  %7
  r2 re8 mi fa re
  r2 sol8 sib mi, do?
  r2 fa8 sol la fa\mbreak

  %10
  r2 do8 re mi do
  r2 mi8 re mi do
  r2 mi8 re do re

  %13
  do la16 sib do8 do\mbreak fa4 r
  fad8 sol fad re sol4 r
  sold8 la sold mi la4 r

  %16
  re,8 do re sib r2
  fa'8 mi fa re\mbreak r2
  dod8 re dod la r2

  %19
  mi'8 dod fa re sol mi la la,
  re sol, la4\fermata re r16 la' fa re
  sib'2 si

  %22
  do dod
  re mi8(fa) r16 la, fa re\mbreak
  r la'' sol fa sol8 mi re4\fermata r

}

IIvlIIn = \relative do'' {

  r2 sold8 la r16 mi do la
  dod'8(re) r16 la fa re sol?2~  %%%%%%%% ripresa
  sol~sol~

  %4
  sol la
  dod8(re) r16 la fa re\mbreak  r fa' mi re mi8 dod
  re4 r la,8 si dod la %%%%%  a metà fine ripresa

  %7
  r2 re8 mi fa re
  r2 sol8 sib mi, do?
  r2 fa8 sol la fa\mbreak

  %10
  r2 do8 re mi do
  r2 mi8 re mi do
  r2 mi8 re do re

  %13
  do la16 sib do8 do\mbreak fa4 r
  fad8 sol fad re sol4 r
  sold8 la sold mi la4 r

  %16
  re,8 do re sib r2
  fa'8 mi fa re\mbreak r2
  dod8 re dod la r2

  %19
  mi'8 dod fa re sol mi la la,
  re sol, la4\fermata re r16 la' fa re
  sol2~sol~

  %22
  sol~sol
  la dod8(re) r16 la fa re
  r fa' mi re mi8 dod re4\fermata r

}

IIvlan = \relative do'{

  r4 r16 la' fa re \parenthesize r4 r16 mi do la
  r4 r16 la' fa re re2~
  re mi~

  %4
  mi fa
  r4 r16 la fa re\mbreak r16 la' la la sib8 la
  fa4 r la,8 si dod la %%%%%  a metà fine ripresa

  %7
  r2 re8 mi fa re
  r2 sol8 sib mi, do?
  r2 fa8 sol la fa\mbreak

  %10
  r2 do8 re mi do
  r2 mi8 re mi do
  r2 mi8 re do re

  %13
  do la16 sib do8 do\mbreak fa4 r
  fad8 sol fad re sol4 r
  sold8 la sold mi la4 r

  %16
  re,8 do re sib r2
  fa'8 mi fa re\mbreak r2
  dod8 re dod la r2

  %19
  mi'8 dod fa re sol mi la la,
  re sol, la4\fermata re r16 la' fa re
  re2~ re

  %22
  mi~ mi
  fa r4 r16 la fa re
  r16 la' la la sib8 la fa4\fermata r

}

IIvcn = \relative do{

  r4 r16 la' fa re \parenthesize r4 r16 mi do la
  r4 r16 la' fa re sol re sib sol sol' re sib sol  %%%% metà ripresa
  sol' re si sol sol' re si sol do' sol mi do do' sol mi do

  %4
  la' mi dod la la' mi dod la re' la fa re re' la fa re
  r4 r16 la' fa re\mbreak r re la' re, sol,8 la
  \clef tenor re'8 mi16 fa la,8 fa' mi16 la,8 la dod mi16  %%%% metà ripresa

  %7
  fa8 mi16 re re8 re la' [fa16 mi re8 re]
  mi16 dod \appoggiatura si8 la fa'4~fa8[mi16 re do?8 sib?]
  la32 fa la do fa8\noBeam~fa32 do fa la do8\noBeam~do16[sib (la sol fa8 mib)]\mbreak

  %10
  re4~re16 sib sib16.\tr(la64 sib) mi?4~mi16 do do16.\tr( sib64 do)
  fa16(sol la) fa \appoggiatura do8 si4\tr \appoggiatura si8 do4~do16 mi sol sib?
  \senza sib4~\tuplet 3/2 { sib32 sol(la sib[la sol)] la(fa sol la[sol fa)] } sol4~\tuplet 3/2 { sol32 mi(fa sol[fa mi)] fa(re mi fa[mi re)] }

  %13
  mi16(do) fa(sol) sol8.\tr fa16\mbreak fa8 fa,~fa16 sol la sib
  do mib mib8(re16) do sib la sib8 sol~sol16 la si dod
  re fa fa8(mi?16) re dod si dod8 la \tuplet 3/2 { r16 la-.( si-. dod-.[re-. mi-.)] }

  %16
  fa8 sib,?~\tuplet 3/2 { sib16 sib-.(do?-. re-.[mi-. fa-.)] } sol8 dod,~\tuplet 3/2 { dod16 dod-.(re-. mi-.[fa-. sol-.)] }
  la8 re,~\tuplet 3/2 { re16(mi re) fa[(mi re)]\mbreak re(fa re) fa[(mi re)] re(fa re) fa[(mi re)] }
  \appoggiatura do?8 sib\tr la \tuplet 3/2 { r16 la-.(si-. dod-.[re-. mi-.] fa-. sol-. la-. fa-.[mi-. re-.)] } dod8.\tr re16

  %19
  sol,8. mi'16 la,8. fa'16 sib,?8. sol'16 dod,8. la'16
  fa8 mi16 re dod8.\tr_\fermata re16 re4 \clef bass r16 la fa re
  sol re sib sol sol' re sib sol sol' re si sol sol' re si sol

  %22
  do' sol mi do do' sol mi do la' mi dod la la' mi dod la
  re' la fa re re' la fa re r4 r16 la' fa re
  r re la' re, sol,8 la re,4\fermata r

}

IIbcn = \relative do {

  r4 r16 la' fa re \parenthesize r4 r16 mi do la
  r4 r16 la' fa re sol re sib sol sol' re sib sol  %%%% metà ripresa
  sol' re si sol sol' re si sol do' sol mi do do' sol mi do

  %4
  la' mi dod la la' mi dod la re' la fa re re' la fa re
  r4 r16 la' fa re\mbreak r re la' re, sol,8 la
  re,8 mi fa re r2 %%% metà ripresa

  %7
  re'8 mi fa re r2
  la8 dod re re, r2
  fa'8 sol la fa r2\mbreak

  %10
  sib,8 do re sib r2
  re8 fa sol sol, r2
  sol'8 mi do fa do4 r

  %13
  r2\mbreak fa8 sol la sol
  fad4 r sol8 la sib la
  sold4 r la8 sol? fa mi

  %16
  re4 r mi8 re mi dod
  r2\mbreak fa8 mi fa re
  r2 re8 sol la la,

  %16
  R1
  r2 re4 r16 la' fa re
  sol re sib sol sol' re sib sol sol' re si sol sol' re si sol

  %22
  do' sol mi do do' sol mi do la' mi dod la la' mi dod la
  re' la fa re re' la fa re r4 r16 la' fa re
  r re la' re, sol,8 la re,4\fermata r

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key re\minor
  \time 4/4
  \tempo 4 = 40
  s1*24
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

IIvla = {
  \IIglobal
  \clef alto
  <<\IIvlan \forma>>

}

IIvc = {
  \IIglobal
  \clef bass
  <<\IIvcn \forma>>

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

  la16(mi la) do la (mi la) do
  la8 la' mi16 re do si
  la(mi la) do la (mi la) do

  %4
  la re do8~do16 fa mi8~
  mi16 fa mi8~mi16 do' si la
  si8 mi, r4

  %7
  mi16(si mi) sold mi(si mi) sold
  la8[mi do la]
  fad'16(do fad) la fad(do fad) la\mbreak

  %10
  sol?8[re si sol]
  mi'16(sib mi) sol mi(sib mi) sol
  fa8[do la fa]

  %13
  mi16(si' mi) sold si8 r
  la,16(mi la) do la (mi la) do %% inizio ripresa
  si(mi, si') re si(mi, si') re

  %16
  do(mi, do') mi do(mi, do') mi
  re8 fa mi16 re do si
  do8 la' si,16 la sold si\mbreak

  %19
  la8 fa' mi16 re do si\mbreak
  do8 la' si,16 la sold si
  la4 r

  %22
  R2*6
  r8la[do mi]
  fa sol la4~\mbreak

  %30
  la16 sol fa  mi re8 do
  r sol[si re]
  mi fa sol4~

  %33
  sol16 fa mi re do8 si
  r8 fa[la do]
  re mi fa4~

  %36
  fa16 mi re do si8 la
  sol4 r
  R2*4

  %42
  si16(sol si) re si(sol si) re
  si8[re sol] r
  r re[fa] r

  %45
  r re[sol] r
  r re[fa] r
  R2*3

  %50
  mi16(do mi) sol mi(do mi) sol
  mi4 r
  R2*2

  %54
  do16(sol do) mi do(sol do) mi
  do8[la' sol16 fa mi re]
  do(sol do) mi do(sol do) mi

  %57
  do mi re8~re16 fa mi re
  mi sol fa8~fa16 la sol fa
  sol8 do, r4\mbreak

  %60
  sol'16(mi sol) sib sol(mi sol) sib
  dod,(la dod) mi dod(la dod) mi
  fa(re fa) la fa(re fa)la

  %63
  sib,(sol sib) re sib(sol sib) re
  dod(la dod) mi dod(la dod) mi
  fa8 sib la16 sol fa mi

  %66
  fa8 la mi16 re dod mi
  re8[sib' la16 sol fa mi]
  fa8[la mi16 re dod mi]\mbreak

  %69
  re4 r
  R2*35
  la16(fa la) do  la(fa la) do

  %106
  la8 fa' mi16 re do sib?
  la(fa la) do  la(fa la) do
  la8 la' sol16 fa mi re

  %109
  dod(la dod) mi dod(la dod) mi
  dod8 sib' la16 sol fa mi
  fa(re fa) la fa(re fa) la\mbreak

  %112
  sold mi sold si? sold mi sold si
  la8 mi re16 do si la
  sold8 mi r4

  %115
  R2*8
  r8 mi'[mi mi]
  re[re re re]

  %125
  do[do do do]
  si[si si si]
  re[re re re]

  %128
  do[do do do]
  sold'[sold sold sold]
  la[la la la]\mbreak

  %131
  fa[fa fa fa]
  mi4 r
  R2*3

  %136
  mi8[mi mi mi]
  mi[mi mi mi]
  re[re re re]

  %139
  re[re re re]
  do[do do do]\mbreak
  do[do do do]

  %142
  si[si si si]
  si[si si si]
  la,[si do la]

  %145
  si[do re si]
  do[re do si]
  la[si do la]

  %148
  si[do re si]
  do4  r
  R2*4

  %154
  la'16(mi la) do la (mi la) do %% inizio ripresa
  si(mi, si') re si(mi, si') re
  do(mi, do') mi do(mi, do') mi

  %157
  re8 fa mi16 re do si
  do8 la' si,16 la sold si\mbreak
  la8 fa' mi16 re do si\mbreak

  %160
  do8 la' si,16 la sold si
  la4\fermopz r

}

IIIvlIIn = \relative do'' {

  la16(mi la) do la (mi la) do
  la8 la' mi16 re do si
  la(mi la) do la (mi la) do

  %4
  la si la8~la16 re do8~
  do16 re do8~do16 mi mi mi
  sold4 r

  %7
  mi8 re4.
  do2
  re8 do4.\mbreak

  %10
  si2
  do8 sib4.
  la2

  %13
  r16 sold(si mi) sold8 r
  la,16(mi la) do la (mi la) do
  si(mi, si') re si(mi, si') re

  %16
  do(mi, do') mi do(mi, do') mi
  re8 fa mi16 re do si
  do8 la' si,16 la sold si\mbreak

  %19
  la8 fa' mi16 re do si\mbreak
  do8 la' si,16 la sold si
  la4 r

  %22
  R2*6
  r8 do[mi la]
  r do, [do do]\mbreak

  %30
  la[la la la]
  r si[re sol]
  si,[si si si]

  %33
  sol[sol sol sol]
  r la[do fa]
  la,[la la la]

  %36
  fa[fa fa fa]
  re4 r
  R2*4

  %42
  sol16(re sol) si sol(re sol) si
  sol8[si re] r
  r si[re] r

  %45
  r si[re] r
  r si[re] r
  R2*3

  %50
  \slurDashed do16 (si do) mi do (si do) mi\slurSolid
  do4 r
  R2*2

  %54
  do16(sol do) mi do(sol do) mi
  do8[la' sol16 fa mi re]
  do(sol do) mi do(sol do) mi

  %57
  do do si8~si16 re do si
  do mi re8~re16 fa mi re
  mi8 do r4\mbreak

  %60
  r r8 mi
  mi2
  re4 r8 re

  %63
  re2
  dod4 r8 mi
  re sib' la16 sol fa mi

  %66
  fa8 la mi16 re dod mi
  re8[sib' la16 sol fa mi]
  fa8[la mi16 re dod mi]\mbreak

  %69
  re4 r
  R2*35
  la16(fa la) do  la(fa la) do

  %106
  la8 fa' mi16 re do sib?
  la(fa la) do  la(fa la) do
  la8 la' sol16 fa mi re

  %109
  dod(la dod) mi dod(la dod) mi
  dod8 sib' la16 sol fa mi
  fa(re fa) la fa(re fa) la\mbreak

  %112
  sold mi sold si? sold mi sold si
  la8 mi re16 do si la
  sold8 mi r4

  %115
  R2*8
  r8 do'[do do]
  la[la la la]

  %125
  la[la la la]
  sol[sol sol sol]
  si[si si si]

  %128
  la[la la la]
  re[re re re]
  mi[mi mi mi]\mbreak

  %131
  re[re re re]
  do4 r
  R2*3

  %136
  si8[si si si]
  do[do do do]
  la[la la la]

  %139
  si[si si si]
  sol[sol sol sol]\mbreak
  la[la la la]

  %142
  fad[fad fad fad]
  sold[sold sold sold]
  la,[si do la]

  %145
  si[do re si]
  do[re do si]
  la[si do la]

  %148
  si[do re si]
  do4  r
  R2*4

  %154
  la'16(mi la) do la (mi la) do
  si(mi, si') re si(mi, si') re
  do(mi, do') mi do(mi, do') mi

  %157
  re8 fa mi16 re do si
  do8 la' si,16 la sold si\mbreak
  la8 fa' mi16 re do si\mbreak

  %160
  do8 la' si,16 la sold si
  la4\fermopz r

}

IIIvlan = \relative do'{

  r8 do[mi do]
  r do[si sold]
  do[do mi do]

  %4
  do4 mi
  mi mi
  mi r

  %7
  sold2
  mi
  fad\mbreak

  %10
  do
  mi
  do

  %13
  r8 si[la sold]
  r do[mi do] %% ripresa
  r sold [si sold]

  %16
  r mi'[mi do]
  r la'[si, sold']
  mi do sold mi'

  %19
  do[la' si, sold']\mbreak
  mi do sold mi'
  do4 r

  %22
  R2*6
  la4 r
  fa'8[fa fa fa]\mbreak

  %30
  fa[fa fa fa]
  si,4 r
  mi8[mi mi mi]

  %33
  mi[mi mi mi]
  la,4 r
  re8[re re re]

  %36
  re[re re re]
  sol,4 r
  R2*4

  %42
  re'8[re re re]
  re4 r
  R2*6\mbreak

  %50
  sol8[sol sol sol]
  sol4 r
  R2*2

  %54
  r8 mi[sol mi]
  r do[re si]
  r mi[sol mi]

  %57
  sol4 sol
  sol sol
  sol8 mi r4\mbreak

  %60
  sib' sol~
  sol mi8 dod
  la'4 fa~

  %63
  fa re8 sib
  sol'4 mi8 dod
  la[sol' mi dod]

  %66
  la re dod4
  la8[sol' mi dod]
  la re dod4\mbreak

  %69
  re4 r
  R2*35
  r8 la[do la]

  %106
  r la'[sol mi]
  do[do do la]
  r fa'[re sib]

  %109
  r mi[mi dod]
  r re[mi dod]
  la[fa' la fa]\mbreak

  %112
  r si?[si sold]
  r do[la fa]
  si, si r4

  %115
  R2*8
  r8 la[la la]
  re[re re re]

  %125
  re[re re re]
  re[re re re]
  mi[mi mi mi]

  %128
  mi[mi mi mi]
  si'[si si si]
  do[do do do]\mbreak

  %131
  la[la la la]
  la4 r
  R2*3

  %136
  sold8[sold sold sold]
  la[la la la]
  fad[fad fad fad]

  %139
  sol?[sol sol sol]
  mi[mi mi mi]\mbreak
  fa[fa fa fa]

  %142
  red[red red red]
  mi[mi mi mi]
  la,[si do la]

  %145
  si[do re si]
  do[re do si]
  la[si do la]

  %148
  si[do re si]
  do4  r
  R2*4

  %154
  r8 do[mi do] %% ripresa
  r sold [si sold]
  r mi'[mi do]

  %157
  r la'[si, sold']
  mi do sold mi'
  do[la' si, sold']\mbreak

  %160
  mi do sold mi'
  do4\fermopz r

}

IIIvcn = \relative do{

  r8 la[do la]
  r la'[sold mi]
  la[la, do la]

  %4
  la4 la
  la la
  mi'16 sold si mi mi, sold si mi

  %7
  mi,8[mi sold mi]
  la4 la,
  r8 re[fad re]\mbreak

  %10
  sol?4 sol,
  r8 do[mi do]
  fa4 fa,

  %13
  r8 sold'[fad mi]
  la[la, do la]
  r mi'[sold mi]

  %16
  r la,[do la]
  r re'[sold, mi]
  la[la, mi' mi,]

  %19
  la[re' sold, mi]\mbreak
  la la, mi' mi,
  la'16(mi la) do la(mi la) do

  %22
  la8 mi re16 do si la
  la'(mi la) do la(mi la) do
  la8 [mi re16 do si la]

  %25
  \clef tenor la' do si8~si16 re do si
  do mi re8~re16 fa mi re
  mi8 la, r mi'

  %28
  mi16 fa mi la, mi' fa mi la,
  la'8 si do4~\mbreak
  do16 si la sol fa8 mi

  %31
  re16 mi re si re mi re si
  sol'8 la si4~
  si16 la sol fa mi8 re

  %34
  do16 re do la do re do la
  fa'8 sol la4~
  la16 sol fa mi re8 do

  %37
  \clef bass si16 sol re si sol8 r
  do'16 sol mi do sol8 r
  re''16 si sol re sol,8 r\mbreak

  %40
  sol'16 la la si si do do re
  re mi mi fa fa sol sol la
  la4 r

  %43
  sol,,16 sol sol sol sol' re si sol
  sol sol sol sol fa' re si sol
  sol sol sol sol sol' re si sol

  %46
  sol sol sol sol fa' re si sol
  \clef tenor mi''\prall(re mi) fa mi\prall(re mi) fa
  mi\prall(re mi) fa mi\prall(re mi) fa

  %49
  sol8 do,16 re re4\tr \mbreak
  do r
  mi16\prall\p(re mi) fa mi\prall(re mi) fa

  %52
  mi\prall(re mi) fa mi\prall(re mi) fa
  sol8 do,16 re re4\tr
  do8[\clef bass do, mi do]

  %55
  r fa[si, sol]
  do,[do' mi do]
  do,4 sol'

  %58
  do, sol'
  do16 mi sol do do, mi sol do\mbreak
  do,8[do mi do]

  %61
  r la[dod la]
  r re[fa re]
  r sol,[sib sol]

  %64
  r la[dod la]
  re[sol dod, la]
  re,[fa'16 sol la8 la,]

  %67
  re[sol dod, la]
  re, fa'16 sol la8 la,\mbreak
  re8 re16 mi fa re fa sol

  %70
  la8\clef tenor re16 mi fa re fa sol
  la8 la4 la8~
  la sol4 fa16 mi

  %73
  fa8 fa4 fa8~
  fa mi4 re16 dod
  re la re fa re la re fa

  %76
  mi fa sol4 fa16 mi
  re la re fa re la re fa\mbreak
  mi16 fa sol4 fa16 mi

  %79
  fa8\clef bass re, r16 fa' mi fa
  sol, mi' re mi fa, re' do re
  mi, do' si do re, si' la si

  %82
  do, la' sol la sib,? sol' fa sol
  la, fa' mi fa sol, mi' re mi
  fa sol sol la la si si do

  %85
  do8\clef tenor sib?16 la sib do re mi
  \clef violin fa sol sol la la sib? sib do\mbreak
  do8 do4 do8~

  %88
  do sib?4 la16 sol
  la8 fa r16 fa sol la
  \clef bass do,,,\clef violin fa'' sol la

  %91
  \clef bass do,,,\clef violin fa'' sol la \clef bass do,,,\clef violin mi'' fa sol
  \clef bass do,,,\clef violin mi'' fa sol \clef bass do,,,\clef violin re'' mi fa
  \clef bass do,,\clef violin re'' mi fa \clef bass do,,\clef violin do'' re mi

  %94
  \clef bass do,,\clef violin do'' re mi \clef bass do,,\clef violin sib'' do re
  \clef bass do,,\clef violin sib'' do re \clef bass do,,\clef violin la'' sib do
  \clef bass do,,\clef violin la'' sib do \clef bass do,,4 \clef violin r8 do''16 la

  %97
  re16 sib8.~\parenthesize sib8 re16 sib
  mi16 do8.~\parenthesize do8 mi16 do
  fa sol la sib do8 r

  %100
  do16 la8.~\parenthesize la8 do16 la
  sib16 sol8.~\parenthesize sol8 sib16 sol\mbreak
  la fa8.~\parenthesize fa8 la16 fa

  %103
  sib16 sol8.~\parenthesize sol8 sib16 sol
  la8[sol16 fa sol8 mi]
  fa[\clef bass fa, la fa]

  %106
  r la[do, do,]
  fa[fa' la fa]
  r re'[sib sol]

  %109
  la[la, dod la]
  r sol' [dod, la]
  re,[re' fa re]\mbreak

  %112
  r mi[sold mi]
  r la[fa re]
  mi mi, r mi''

  %115
  la,16(mi la) do la(mi la) do
  la8 mi' re16 do si la
  si(mi, si') re si(mi, si') re

  %118
  si8 fa' mi16 re do si
  do(la do) mi do(la do) mi
  re(la re) fa re(la re) fa\mbreak

  %121
  mi(re mi) fa mi re do si
  do8 la r \clef violin mi'
  mi16 fa mi la, mi' fa mi la,

  %124
  fa' sol fa la, fa' sol fa la,
  fad' sol fad la, fad' sol fad la,
  sol' la sol la, sol' la sol la,

  %127
  sold' la sold la, sold' la sold la,
  la' si la la, la' si la la,
  si' do si la, si' do si la,

  %130
  do' re do la, do' re do la,\mbreak
  re' mi re la, re' mi re la,
  mi''4 r16 mi re mi

  %133
  do4\tr~do16 mi re mi
  do4\tr~do16 mi re mi
  do4 r8 mi

  %136
  mi16 re do si mi re do si
  <<{do do do do do do do do}\\{r la la la la la la la}>>
  re do si la re do si la

  %139
  <<{si si si si si si si si}\\{r sol sol sol sol sol sol sol}>>
  do si la sol do si la sol\mbreak
  <<{la la la la la la la la}\\{r fa fa fa fa fa fa fa}>>

  %142
  si la sold fad si la sold fad
  <<{sold sold sold sold sold sold sold sold}\\{r mi mi mi mi mi mi mi}>>
  la sold la la, la' sold la la,

  %145
  re8.[mi16 (fa8) mi16 re]
  mi8 la,4.
  la'16 sold la la, la' sold la la,

  %148
  re8.[mi16 (fa8) mi16 re]
  mi8 \clef bass la, sol?16 fa mi re
  do8 fa mi16 re do si

  %151
  la8\clef tenor mi'' fa4~
  fa mi16 re do si
  \appoggiatura re8 do si16 la si4\tr

  %154
  la8[\clef bass la, do la]
  r mi'[sold mi]
  r la,[do la]

  %157
  r re'[sold, mi]
  la[la, mi' mi,]
  la[re' sold, mi]\mbreak

  %160
  la la, mi' mi,
  la4\fermopz r

}

IIIbcn = \relative do {

  r8 la[do la]
  r la'[sold mi]
  la[la, do la]

  %4
  la4 la
  la la
  mi'16 sold si mi mi, sold si mi

  %7
  mi,8[mi sold mi]
  la4 la,
  r8 re[fad re]\mbreak

  %10
  sol?4 sol,
  r8 do[mi do]
  fa4 fa,

  %13
  r8 sold'[fad mi]
  la[la, do la]
  r mi'[sold mi]

  %16
  r la,[do la]
  r re'[sold, mi]
  la[la, mi' mi,]

  %19
  la[re' sold, mi]\mbreak
  la la, mi' mi,
  la4 la

  %22
  la r
  la la
  la r

  %25
  la' sold
  la si
  do8[la do, la]

  %28
  do2
  fa~\mbreak
  fa

  %31
  si,
  mi~
  mi

  %34
  la,
  re~
  re

  %37
  sol,4 r
  sol r
  sol r\mbreak

  %40
  do8[re mi fa]
  sol[la si do]
  sol4 sol,

  %43
  sol sol
  sol sol
  sol sol

  %46
  sol sol
  do'8[do sol sol]
  mi[mi do do]

  %49
  r do[sol' sol,]\mbreak
  do4 do,
  do''8[do sol sol]

  %52
  mi[mi do do]
  r do[sol' sol,]
  do[do mi do]

  %55
  r fa[si, sol]
  do,[do' mi do]
  do,4 sol'

  %58
  do, sol'
  do16 mi sol do do, mi sol do\mbreak
  do,8[do mi do]

  %61
  r la[dod la]
  r re[fa re]
  r sol,[sib sol]

  %64
  r la[dod la]
  re[sol dod, la]
  re,[fa'16 sol la8 la,]

  %67
  re[sol dod, la]
  re, fa'16 sol la8 la,\mbreak
  re4 r

  %70
  re r
  re dod
  dod? la

  %73
  re re
  sold, la
  re re

  %76
  dod dod
  re re\mbreak
  dod dod

  %79
  re8[mi fa re]
  sol r fa r
  mi r re r

  %82
  do r sib r
  la r sol r
  fa4 r

  %85
  fa r
  fa r\mbreak
  fa' mi

  %88
  re do
  fa8[sol la fa]
  do, r do r

  %91
  do r do r
  do r do r
  do r do r\mbreak

  %94
  do r do r
  do r do r
  \once\stemUp do[do'' la fa]

  %97
  sib,[re sib re]
  do[mi do mi]
  re[fa la do]

  %100
  la[fa la fa]
  sol[mi sol mi]\mbreak
  fa[la fa la]

  %103
  sol[mi sol mi]
  fa[la, sib do]
  fa,[fa' la fa]

  %106
  r la[do, do,]
  fa[fa' la fa]
  r re'[sib sol]

  %109
  la[la, dod la]
  r sol' [dod, la]
  re,[re' fa re]\mbreak

  %112
  r mi[sold mi]
  r la[fa re]
  mi[mi, sold mi]

  %115
  r la[do la]
  r la'[fa re]
  r mi[sold mi]

  %118
  r re'[sold, mi]
  r la,[do la]
  r re[fa re]\mbreak

  %121
  r la'[sold mi]
  la[la, do la]
  la2~

  %124
  la~
  la~
  la~

  %127
  la~
  la~
  la~

  %130
  la~\mbreak
  la~
  la8[la do la]

  %133
  r la[do la]
  r la[do la]
  r la[do la]

  %136
  R2*13
  r8 re[mi mi,]
  la[fa' mi mi,]

  %151
  la[la' re la]
  sold2
  la8[la, mi' mi,]

  %154
  la [la do la]
  r mi'[sold mi]
  r la,[do la]

  %157
  r re'[sold, mi]
  la[la, mi' mi,]
  la[re' sold, mi]\mbreak

  %160
  la la, mi' mi,
  la4\fermopz r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key la\minor
  \time 2/4
  \tempo 2 = 60
  s2*161
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

IIIvla = {
  \IIIglobal
  \clef alto
  <<\IIIvlan \forma>>

}

IIIvc = {
  \IIIglobal
  \clef bass
  <<\IIIvcn \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] All[egr]o"

\score {
  {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino  I]"}
            \IvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
            \IvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"[Viola]"}
          \Ivla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"Violon[cello]"}
          \Ivc
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"church organ"
          \set Staff.instrumentName = \markup \center-column{"[Basso]"}
          \Ibc

        >>
      >>
  }

  \layout {

    indent = 1.8\cm

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

\pageBreak

\markup\huge "[2.] [Largo]"

\score {
  {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

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
          \IIvc
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"church organ"
          \IIbc

        >>
      >>

  }

  \layout {

    indent = 0.5\cm

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

\pageBreak

\markup\huge "[3.] All[egr]o"

\score {
  {

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

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \IIIvc
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"church organ"
          \IIIbc

        >>
      >>
  }

  \layout {

    indent = 0.5\cm

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



