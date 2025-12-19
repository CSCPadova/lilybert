\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = ^\markup\italic"tasto"

tr = \trill

pf = #(make-dynamic-script "pf")

ten = ^\markup\italic"ten."

pizz = ^\markup\italic"pizzicato"

arco = ^\markup\italic"coll'arco"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

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

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

pratubeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

pratubem = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.flat"
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

turnshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-4
    \center-column {\musicglyph #"scripts.turn"}}

beqturnshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-4
    \center-column {\musicglyph #"scripts.turn"}}


pradies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.sharp"
      \musicglyph #"scripts.prall"}}

turnbeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
      \musicglyph #"scripts.turn"}}

mordbeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
      \musicglyph #"scripts.mordent"}}

turndies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {\musicglyph #"scripts.turn"
	  \musicglyph #"accidentals.sharp"
      }}

turnbeqdies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1.5
    \center-column {
	 "♮♯"
      \musicglyph #"scripts.turn"}}

turnbem = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.flat"
      \musicglyph #"scripts.turn"}}

turnbemshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-2
    \center-column {
	  \musicglyph #"accidentals.flat"
      \musicglyph #"scripts.turn"}}

turnshift = ^\markup  {\halign #-2.5 \musicglyph #"scripts.turn"}

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



mbreak = { }



Iglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.4
  \override TupletBracket.bracket-visibility = ##f
  \terzine \senza
}


Ivln = \relative do'' {

  r4 mi\tr\pf do'\staccatissimo
  r re,\staccatissimo fa\staccatissimo
  r mi,\tr re'\staccatissimo

  %4
  r la,\staccatissimo do'\staccatissimo
  r mi(re)
  r fa,(sol,)

  %7
  r la'(red,)
  mi8(sold si4) r
  do'\p(mi, la,)

  %10
  re,\staccatissimo ^\f r r\mbreak
  si''\p(re, sol,)
  do,\staccatissimo^\f r r

  %13
  la''\pf\staccatissimo do,\tr la'\staccatissimo
  sol\staccatissimo mi,\tr sol'\staccatissimo
  fa\staccatissimo mi\tr(mi)

  %16
  re\staccatissimo r si\pp(
  do\staccatissimo) mi,\tr do'8\staccatissimo mi,
  re4\staccatissimo sol^\f(fa\tr)

  %19
  mib\staccatissimo^\p sol(do)
  r lab\staccatissimo do,\tr
  r re(sib')

  %22
  r sol\staccatissimo sib,\tr\mbreak
  <do' mib, lab,>4\f\staccatissimo  r r
  <sib mib, sol,>\staccatissimo r r

  %25
  lab'2.^\p
  sol
  <fad do re,>4\f\staccatissimo r r

  %28
  r si,!^\p (fa'!)
  <mi sib sol do,>^\f\staccatissimo r r
  r la,\p(la')

  %31
  r la,(re,)
  <sol' si, re, sol,>\staccatissimo^\f r r
  R2.

  %34
  r4 r mi\p\mbreak
  re(si fa)
  r sol,^\pp(mi')

  %37
  fa(si, re)
  re2(do4\tr)
  r sol'\staccatissimo^\pf mi'\staccatissimo

  %40
  r fa,\tr si\staccatissimo
  r sol,\staccatissimo re''\staccatissimo
  r mi,\tr do'\staccatissimo

  %43
  dod'2\f(si4\staccatissimo\p)
  fad2\f(mi4\p\staccatissimo)
  R2.

  %46
  red4(fad si)\mbreak
  la8.\tr(sold32 la) mi'4\staccatissimo r
  sol,!8.\tr(fad32 sol) mi'4\staccatissimo r

  %49
  <do mi, la,>\f\staccatissimo r r
  <si si, mi, sol,>\staccatissimo r r
  r la2\p

  %52
  si,,4\staccatissimo sol''\staccatissimo r
  R2.
  <mi sol, sol,>4^\f\staccatissimo r r

  %55
  r mi\p\staccatissimo re,\staccatissimo
  la\f\staccatissimo do'\staccatissimo \p r
  r la'\staccatissimo sol,\staccatissimo\mbreak

  %58
  la,\f\staccatissimo fad''\p\staccatissimo r
  r re\staccatissimo do,\staccatissimo
  sol\staccatissimo\f si'\p\staccatissimo r

  %61
  r sol'\staccatissimo fa,!\staccatissimo
  sol,\f\staccatissimo mi''\p\staccatissimo r
  sol2\mf(sol4)

  %64
  fa\staccatissimo\p r r
  la2.\mf
  sol4\staccatissimo\p r r

  %67
  si2.\mf
  la4\p\staccatissimo r r
  <fa la, re,>\f\staccatissimo r r\mbreak

  %70
  do,2\p(si4\tr)
  r mi'\tr\pf do'\staccatissimo
  r re,\staccatissimo fa\staccatissimo

  %73
  r mi,\tr re'\staccatissimo
  r la,\staccatissimo do'\staccatissimo
  r mi(re)

  %76
  r fa,(sol,)
  <la'' do, fa,>\f\staccatissimo r r
  <sol do, mi,>\staccatissimo r r

  %79
  fa2.\p
  mi
  <re fa, sib,>4\f\staccatissimo re2\p

  %82
  <re fa, la,>4\f\staccatissimo re2\p \mbreak
  r4 fa\tr re'\staccatissimo
  r fa,,\tr re'\staccatissimo

  %85
  <sold si, re,>\f r r
  R2.*2
  r4 r do\p(

  %89
  si sold re)
  r mi,(do')
  si\tr do8 la, si re16 si

  %92
  si2(do4)

}

Imdn = \relative do'' {

  r16 mi la mi re do mi do si la sold la
  sold re' do si fa' mi re si' la sold re' do
  si fa'-4 mi re do-1 si-2 la-1 sold-2 si-5 fa mi re

  %4
  do la' mi si do mi sold, la mi do' si la
  mi' fad, sol! la do sib la sol fa re' la do
  si fa' mi re do si la sol fa mi sol do\mbreak

  %7
  \stemUp si la sol fa-1 mi-3 red la' do,  \giu si la \su red \giu la
  sold \su mi' \giu si sold \stemDown mi [sold si] \su\stemUp mi \stemDown re' si sold re
  \giu la do mi \stemUp \su do'\noBeam si la mi' re <<{do si la sol}\\{s s s sol}>>

  %10
  <<{s la' s mi s fa s dod s re s la}\\{fa s dod s re s mi s fa s fad}>>
  \giu \stemDown sol, si re \su\stemUp si'\noBeam la sol re' do <<{si la sol fa}\\{s s s fa}>>
  <<{s sol' s re s mi s si s do s sol}\\{mi s si s do s re s mi s mi}>>

  %13
  \stemDown fa la \stemUp do[fa] la do fa, la do fa do la
  \stemDown mi,[sol] \stemUp do mi sol do mi, sol do mi do sol
  <<{s8 re'16 fa, s8 do'16 mi, s8 la16 do,}\\{re, si' s8 do,16 sol' s8 fad16 [la]}>>

  %16
  <<
    {
      si sol' re si sol s s s r sol' si, re
      r do mi sol do si la sol fa mi re do
      si sol' re si sol s s s r sol' si, re
    }\\{
      s4 \giu \once \override Rest #'staff-position = #+2  r16 sol,, si re \su fa s s s
      mi s s s s2
      s4 \giu \once \override Rest #'staff-position = #+2 r16 sol, si re \su fa s s s
    }
  >>

  %19
  \stemDown mib\p do' \stemUp mib'[re] do si! re do sol sib lab sol
  <<lab\\r>> \stemDown fa,[lab] \stemUp do fa lab do sib lab sol fa mib
  <<re\\{sib, [sib']}>> re' do sib la! do sib fa lab sol fa

  %22
  <<sol\\r>> \stemDown mib,[sol sib] mib \stemUp sol[sib lab] sol fa mib reb
  do\f do' lab mib do lab' mib do lab mib' do lab
  \stemNeutral r16 sib do re mib fa sol lab sib sol fa mib

  %25
  r lab\p fa do lab fa' do lab fa do' lab fa
  r sol la! si! do re mib fa sol mib re do\mbreak
  \giu\stemDown re,,^\f fad la \su do \stemUp fad la do fad la fad do la

  %28
  <<{si s s s r re fa! si re si fa re}\\{\giu r sol,, si\su re sol}>>
  \giu \stemDown do,, mi sol sib \su\stemUp mi-2 sol-1 sib mi sol mi sib sol
  <<{la s s s r do fa la do la fa do}\\{\giu r16 fa,, la \su do fa}>>

  %31
  \stemNeutral la' la, si dod re mi fa sol la fa re do\mbreak
  si sol' re si sol si re fa mi do sol sib
  la fa' mi re sol, mi' re do fa, re' do si!

  %34
  do sol do mi sol fa mi re do si la sol
  fa re' do si fa' mi re do si la sol fa
  mi sol do sol mi\p sol mi do r sol' mi do\mbreak

  %37
  r si re fa mi re do si \giu \stemUp la sol re' fa,
  \once\slurUp fa2(mi4\mordent)

  %39
  \su \stemNeutral r16 sol'\f do sol fa mi sol mi re do si do
  si fa' mi re si' fa mi fa re' si la si
  fa' re la' sol fa mi re do si la sol fa

  %42
  mi mi' re do si la sol fa <<mi\\r>> \stemDown re do si\mbreak
  \giu lad\su dod mi \stemUp sol\noBeam mi' sol, fad mi <<red\\r>> \stemDown si red fad
  \stemUp la fad' mi red la' fad red la <<{s mi' s re
                                   s do s si s la s sol s fa! s mi}\\{sol r fad s
                                                                      mi s re s do s \giu si s la s lad}>>\mbreak

  %46
  \su\stemDown si red fad \stemUp si\noBeam red fad si fad red si lad si
  \stemDown do, la'! \stemUp mi'[la] do mi do la mi la mi do
  \stemDown si, sol' \stemUp mi'[sol] si mi si sol mi si' sol mi\mbreak

  %49
  r do' la mi \stemNeutral do la' mi do la mi' do la
  r si' sol mi si sol' mi si sol mi' si sol
  r la la' fad mi red fad do si la sol fad

  %52
  <<sol\\r>> \stemDown mi sol si\mbreak \stemUp mi sol si la sol fad mi re!\stemNeutral
  \stemNeutral do la' sol fad si, sol' fad mi la, fad' mi red
  <<\stemDown mi4\staccatissimo\\{\giu \stemDown r16 mi,, fad sol la}>> \su\stemUp si[dod red] mi fad sol la

  %55
  si do si la si sol fad mi\mbreak si' fa! mi re
  <<{do s s s r}\\{\giu r la si\su do re}>> \stemUp mi[fad sold] la si do re
  mi fa mi re mi do si la mi' si la sol

  %58
  <<fad\\r>> \stemDown re[mi fad] sol \stemUp la[si dod] re mi fad sol\mbreak
  la si la sol  la fad mi re la' mi re do!
  <<{si s s s r}\\{\giu r sol, la si \su do}>> \stemUp re[mi fad] sol la si do

  %61
  re mi re do re si la sol re' la sol fa!\mbreak
  <<mi\\r>> \stemDown do[re mi] fa \stemUp sol[la si] do si do re
  mi do sol \stemDown mi\noBeam sib[mi] \stemUp sol do mi do sol do

  %64
  \giu\stemDown la,\su do \stemUp fa[la] do fa do la fa\noBeam \stemDown do\giu la\su do\mbreak %% fine pagina 4 OK
  \stemUp fad' re la \stemDown fad\noBeam do[fad] \stemUp la re fad re la re
  \stemDown si,[re] \stemUp sol si re sol re si <<sol\\r>> \stemDown re si re

  %67
  \stemUp sold' mi si \stemDown sold\noBeam re[sold] \stemUp si mi sold mi si mi
  \stemDown do,[mi] \stemUp la do mi la mi do la mi' do la\mbreak
  r mi' fa sol fa mi re do si fa' re si

  %70
  \stemNeutral la2\p(sold4\prall)
  r16 mi'\f la mi re do mi do si la sold la
  sold  re' do si fa' mi re si' la sold re' do\mbreak

  %73
  si fa'-4 mi re do-1 si-2 la-1 sold-2 si-5 fa mi re
  do la' mi si do mi sold, la mi do' si la
  mi' fad, sol! la do sib la sol fa re' la do

  %76
  si! fa' mi re do-2 si-1 la-2 sol-1 fa-2 mi-1 sol do-5\mbreak
  r la' fa do la fa' do la fa do' la fa
  r sol la si do re mi fa sol mi re do

  %79
  r fa\p re la fa re' la fa re la' fa re
  r mi fad sold la si do re mi do si la
  r4 fa'16\f sib re fa\mbreak re sib fa fa'

  %82
  r4 fa,16 la re fa re la fa fa'
  r re,\p dod re mi re dod re fa re dod re
  r re dod re mi re dod re fa re dod re

  %85
  r si'\f re do si la sold fad mi re do si\mbreak
  la do mi la sol! fa! mi re do si la sol
  fad re' do si mi, do' si la re, si' la sold

  %88
  la mi la do mi re do si la sol fa mi
  re si' la sold re' do si la sold fad mi re\mbreak
  do mi la mi do mi do la r la'' mi do

  %91
  r fa re si r mi do la r re si sold
  sold?2(la4\mordent)

}

Imsn = \relative do {

  la4\staccatissimo r r
  si\staccatissimo r r
  sold\staccatissimo r r

  %4
  la\staccatissimo r r
  dod2 re4\mbreak
  sol,2 do!4

  %7
  fa,2.
  \shiftOn mi4 s s
  s2.*9

  %18
  sol'4 s s
  s2.*4
  lab4\staccatissimo r r

  %24
  sol4\staccatissimo r r
  fa2.\p
  mib\mbreak

  %27
  s2.*4
  fa2.~\mbreak
  fa4 si, do

  %33
  fa sol sol,
  <<
    {
      do2.~
      do~

      %36
      do~
      do2 \once\stemDown si4
      \shiftOn si2 (\stemDown do4)
    }\\{
      s2.*2
      s2 do,4
      do2.~
      do
    }
  >>

  %39
  do'4\staccatissimo r r
  re\staccatissimo r r
  si\staccatissimo r r

  %42
  do\staccatissimo r r
  s2.*6
  la'4\staccatissimo r r

  %50
  sol\staccatissimo r r
  fad\staccatissimo r red'\staccatissimo\mbreak
  s2.

  %53
  la4 si si,
  s2.
  r4 sol'\staccatissimo sold\staccatissimo

  %56
  s2.
  r4 do\staccatissimo dod\staccatissimo\mbreak
  s2.

  %59
  r4 fad,\staccatissimo fad\staccatissimo
  s2.
  r4 si\staccatissimo si\staccatissimo

  %62
  s2.*7
  re4\staccatissimo r r
  mi,2.

  %71
  la,4\staccatissimo r r
  si\staccatissimo r r\mbreak
  sold\staccatissimo r r

  %74
  la\staccatissimo r r
  dod2 re4
  sol,2  do!4

  %77
  fa\staccatissimo r r
  mi\staccatissimo r r
  re2.\p

  %80
  do
  sib16\f re fa sib sib,2\mbreak
  la16 re fa la la,2

  %83
  sold4\staccatissimo r r
  la\staccatissimo r r
  si\f re sold

  %86
  do, mi la\mbreak
  re, mi mi,
  la2.~

  %89
  la~
  la2 la4
  re mi mi,

  %92
  la2.

}


Ibcn = \relative do {

  la4\staccatissimo\pf r r
  si\staccatissimo r r
  sold\staccatissimo r r

  %4
  la\staccatissimo r r
  dod2 re4
  sol,2 do!4

  %7
  fa,2.
  mi4 r mi
  la2.

  %10
  re,4^\f\staccatissimo r r\mbreak
  sol2.\p
  do,4\f\staccatissimo r r

  %13
  fa'2.\pf
  mi
  re4 do fad,

  %16
  sol2.\pp~
  sol
  sol4 sol'\f(fa\tr)

  %19
  mib2.\p
  fa
  \once\slurDown sib,2(re4)

  %22
  mib2.
  lab4\staccatissimo\f \mbreak r r
  sol\staccatissimo r r

  %25
  fa2.\p
  mib
  re4\staccatissimo \f r r

  %28
  sol\staccatissimo \p r r
  do,\f\staccatissimo r r
  fa\staccatissimo\p r r

  %31
  fa2.~
  fa4\f r r
  R2.

  %34
  do\p~
  do~
  do2 do,4\pp\mbreak

  %37
  do2.~
  do
  do'4\pf\staccatissimo r r

  %40
  re\staccatissimo r r
  si\staccatissimo r r
  do\staccatissimo r r

  %43
  lad2\f(si4\staccatissimo\p)
  red2\f(mi4\staccatissimo\p)
  R2.

  %46
  si
  do2 do4
  si2 si4

  %49
  la\staccatissimo\f r r
  sol\staccatissimo r r\mbreak
  r fad'\p\staccatissimo red\staccatissimo

  %52
  mi\staccatissimo r r
  R2.
  mi,4\f\staccatissimo r r

  %55
  r sol\p\staccatissimo sold\staccatissimo
  la\f\staccatissimo r r
  r do\staccatissimo\p dod\staccatissimo

  %58
  re\f\staccatissimo r r
  r fad,\p\staccatissimo fad\staccatissimo
  sol\f\staccatissimo r r

  %61
  r si\p\staccatissimo si\staccatissimo\mbreak
  do\staccatissimo\f r r
  sib'2.\mf

  %64
  la4\staccatissimo r r
  do2.\mf
  si!4\staccatissimo\p r r

  %67
  re2.\mf
  do4\staccatissimo\p r r
  re,\staccatissimo\f r r

  %70
  mi2.\p
  la,4\staccatissimo\pf r r
  si\staccatissimo r r

  %73
  sold\staccatissimo r r\mbreak
  la\staccatissimo r r
  dod2 re4

  %76
  sol,2 do!4
  fa\f\staccatissimo r r
  mi\staccatissimo r r

  %79
  re2.\p
  do
  sib4\staccatissimo \f sib2\p

  %82
  la4\staccatissimo\f la2\p
  sold4\staccatissimo r r
  la\staccatissimo r r

  %85
  si\f\staccatissimo r r
  R2.*2\mbreak
  la2.\p~

  %89
  la~
  la
  re4 mi mi,

  %92
  la2.

}

Ibfn =  \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp


}


forma = {

  \key la\minor
  \time 3/4
  \tempo 2 = 60
  s2.*38
  \bar ":..:"\break
  s2.*54
  \bar ":|."

}

Ivl = {
  \Iglobal
  \notypeset
  <<\Ivln \forma>>

}

Imd = {
  \Iglobal
  %\clef soprano
  \context Staff = up
  <<\Imdn \forma>>

}

Ims = {
  \Iglobal
  \clef bass
  \context Staff = down
  <<\Imsn \forma\Ibfn>>

}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma>>
  \typeset

}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con
}


IIvln = \relative do'' {
    
    r4
    r la\pf sib sib
    r8 do do,4 r fa'
    re re sol, mi
    
    %4
    r8 do16(mi fa la fa do) sib8(la) r4
    r r16 si'(re do) do8 r r4
    r r16 la(do si) re8.. fa32 fa8(mi16.\tr) re32\mbreak
    
    %7
    do8 r r4 r la
    r8 mi r re r16 fa\p fad (sol) la\staccatissimo fa(mi re)
    re(mi fa mi) mi(sol si, do) sol\staccatissimo do(re red) mi\staccatissimo sol(fa mi)
    
    %10
    mi(fa sol fa) r4 r2
    r4 r16 fa'\f(mi re) do4(si\tr)
    do16\staccatissimo sol'(mi do) sol\staccatissimo mi'(do sol) fa8(mi\tr) r4\mbreak
    
    %13
    r mi\pf fa fa
    r8 sol sol,4 r2
    do'8(re) sol,4~sol8 sol r fad
    
    %16
    r4sib,16(sol') r8 r2
    r4 sol8\p r do, r fa r
    la,4\f(sib8) r r4 sib'\pf
    
    %19
    do8 r r4 r re\mbreak
    r8 la r sol r16 sib,\p si(do) re\staccatissimo sib(la sol)
    sol(la sib la) la\staccatissimo do( mi fa) do\staccatissimo fa(sol sold) la\staccatissimo do,(sib la)
    
    %22
    la(sib do sib) r4 r2
    r4 r16 sib'\f(la sol) fa4(mi\tr)
    fa8 r r4 la16\p(do) r8 r4\mbreak
    
    %25
    do16\pp(fa) r8 r la,,16^\f(do) fa(la do red) red4~
    red?(mi\p)
    
}

IImdn = \relative do'' {
    \override TupletBracket.bracket-visibility = ##f \terzine \con

    la'8.^\markup {\halign #-2 \musicglyph #"scripts.turn" } sib16
    do8 do4 sib32[la sol fa] mi8 sib'4 la32[sol fa mi]
    sol4(fa16\prall) mi (fa fa') fa(mib) mib(re) re(dod) dod(re)
    re(fad, la sol) sol(re') do!32[(sib la sol)] fa8(mi16.\pratu) fa32 \con \tuplet 3/2 { sol16(fa mi ) re[(do sib)]}

    %4
    do8(sib32\prall) la sib16 la4 r8 do16[(fa)] la( do sib la)
    la(sol fad sol) \grace {fad16[sol la]} sol4~sol16 si(do mi) re(do si la)
    sol(la mi fa) fa8.^\markup {\halign #-2 \musicglyph #"scripts.turn" }  re'16 do8(si16.\prall) la32 la8(sol16.\prall) fa32

    %7
    mi16\staccatissimo do'(si la sold la si la sol fa mi\prall re dod re fa la)\mbreak
    do,4(si\pratu) r16 re\p red  (mi) fa\staccatissimo  re(do\prall si)
    si?(do re do) do4 r16 mi(fa fad) sol\staccatissimo mi(re\prall dod)

    %10
    dod?(re mi re) re(mi fa fad sol sold la sib! si do dod re
    red mi re do si \f la sol fa) mi4(re\upprall)
    do do, r mi'8.^\markup {\halign #-2 \musicglyph #"scripts.turn" } fa16\mbreak

    %13
    sol8 sol4 fa32 mi re do si8\noBeam fa'4 mi32 re do si
    re4(do16\prall) si(do re) mi (fa sol la)\override Slur.outside-staff-priority = #400 do(sib! la\prall sol)
    <mib' fad,>8 re4 do32[sib la sol] la8.^\markup {\halign #-3 \musicglyph #"scripts.turn" } sib16 re(do sib\prall la)

    %16
    la[(sib32 do)] sib32(la sol16) r8 re16(re') do(sib la sol) fa!(mi re\prall do)\mbreak
    sol'\staccatissimo la,(do sib) r8 re16\p(sol,) r8 sib16(la) r8 \revert Slur.outside-staff-priority do16(do,)
    mib4\f(re16\prall) dod(re fad) sol(sib dod re) \override Slur.outside-staff-priority = #400 sib'\staccatissimo sol(fa\prall mi!)

    %19
    fa\staccatissimo fa'(mi re dod re mi re do sib la\prall sol fad sol sib re)
    fa,!4(mi\pratu) r16 sol,\p sold (la) sib\staccatissimo sol(fa\prall mi)\mbreak
    mi(fa sol fa) fa4 r16 la(sib si) do\staccatissimo la(sol\prall fad)

    %22
    fad?( sol la sol) sol(la sib si do dod re red mi fa fad sol)
    sold(la sol fa! mi\f re! do! sib!) \revert Slur.outside-staff-priority  la4(sol\upprall)
    fa8(la16 do) fa(la mi fa) r8 do16\p(fa) la(do sold la)\mbreak

    %25
    r8 fa16\pp(la) do(fa) fa\f(mi) mi(red) red(do) do(si) si(la)
    \grace {sold16[si]} la4(sold\prall\p)

}

IImsn = \relative do {
    
    r4
    r fa sol sol
    r8 la la,4 r la'
    sib sib do do\mbreak
    
    %4
    fa, fa, fa' fa
    mi mi mi mi
    re re sol, si
    
    %7
    do fa, r fa
    sol sol sol sol
    sol sol sol sol
    
    %10
    sol r r2\mbreak
    r4 fa'\f sol sol,
    do mi8. sol16 do4 r
    
    %13
    r do, re re
    r8 mi mi,4 r2\mbreak
    la4 sib! do re
    
    %16
    sol sol, r2
    r4 mi'\p fa la,\mbreak
    r8 sib\f sib'4 r sol
    
    %19
    la sib r sib,
    do do do\p do\mbreak
    do do do do
    
    %22
    do r r2
    r4 la'\f do do,\mbreak
    fa, r r2
    
    %25
    r fa'4\f fa
    mi2
    
}


IIbcn = \relative do {
    
    r4
    r fa_\pizz sol sol
    r8 la la,4 r la'
    sib sib do do\mbreak
    
    %4
    fa, fa, fa' fa
    mi mi mi mi
    re re sol, si
    
    %7
    do fa, r fa
    sol sol sol\pp sol
    sol sol sol sol
    
    %10
    sol r r2\mbreak
    r4 fa'\f sol sol,
    do mi8. sol16 do4 r
    
    %13
    r do,\p re re
    r8 mi mi,4 r2\mbreak
    la4 sib! do re
    
    %16
    sol sol, r2
    r4 mi'\pp fa la,\mbreak
    r8 sib\f sib'4 r sol\p
    
    %19
    la sib r sib,
    do do do\pp do\mbreak
    do do do do
    
    %22
    do r r2
    r4 la'\f do do,\mbreak
    fa, r r2
    
    %25
    r \set Staff.midiInstrument = #"cello" fa'4\f \arco fa
    mi2

}

IIbfn =  \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp


}


forma = {

    \key fa\major
    \time 4/4
    \tempo 4 = 57
    \partial 4 s4
    s1*25
    s2
    \bar "|."

}

IIvl = {
    \IIglobal
    \notypeset
    <<\IIvln \forma>>

}

IImd = {
    \IIglobal
    %\clef soprano
    \context Staff = up
    <<\IImdn \forma>>

}

IIms = {
    \IIglobal
    \clef bass
    \context Staff = down
    <<\IImsn \forma\IIbfn>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma>>
    \typeset

}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


IIIvln = \relative do'' {

    r2 do8\staccatissimo mi16 do la4\staccatissimo
    r2 si16 la sold fad mi4\staccatissimo
    r4 r8 la16\p mi do8\staccatissimo r r4

    %4
    r8 si'16 sold mi4\staccatissimo r2
    r8 mi'16\f do la8\staccatissimo sol'!16 mi fa8\staccatissimo r r4
    r8 re16 si sol8\staccatissimo fa'16 re mi8\staccatissimo r r4\mbreak

    %7
    r2 r8 do16 la sol fad  mi red
    mi8\staccatissimo r r4 r8 mi16 fa mi re! do si
    la8\staccatissimo r r4 do'8\staccatissimo mi16 do la4\staccatissimo

    %10
    r2 si16 la sold fad mi4\staccatissimo
    r4 r8 la16\p mi do8\staccatissimo r r4
    r8 si'16 sold mi4\staccatissimo r2

    %13
    r8 mi'16\f do la8\staccatissimo r r re16 la si8\staccatissimo r\mbreak
    r8 do'16 sold la8\staccatissimo r r si,16 fad sold8\staccatissimo r
    r4 r8 fa16 si, la4(sold\tr)

    %16
    la8\staccatissimo r r4 r8 do' si16 la sol fa
    mi4\staccatissimo r sol16\p do mi, sol do,4
    r2 re16 do si la sol4\staccatissimo

    %19
    r2 re'16 sol si, re sol,4\staccatissimo\mbreak
    r2 mi'16 re do si do4\staccatissimo
    r16 si\f do re mi re mi fa sol8 mi do4\tr

    %22
    r la'16 do fa, la do,4\staccatissimo sol'16 do mi, sol
    si,4(do) r2
    r si''16 do re do si la sol fa

    %25
    mi4\staccatissimo r mi,8 sol16 mi do4\staccatissimo
    r2 re16 do si la sol4\staccatissimo\mbreak
    r4 r8 sol'16\p mi do8\staccatissimo r r4

    %28
    r8 re'16 si sol4\staccatissimo r2
    r4 r8 mi'16 \f do la8\staccatissimo r r fa'16 re
    si8\staccatissimo r r re'16 fa, mi8\staccatissimo r r4

    %31
    r8 la,16 fa re fa la re mi,8\staccatissimo sol16 do, fa8\staccatissimo re16 si
    mi4\staccatissimo r r16 sol do sol mi sol mi do\mbreak
    la4\staccatissimo r do'8\staccatissimo mi16 do la4

    %34
    r2 si16 la sold fad mi4\staccatissimo
    r r8 la16\p mi do8\staccatissimo r r4
    r8 si'16 sold mi4\staccatissimo r2

    %37
    r8 mi'16\f do la8\staccatissimo sol'!16 mi fa8\staccatissimo r r4
    r8 re16 si sol8\staccatissimo fa'16 re mi8\staccatissimo r r4\mbreak
    r2 r8 do16 la sol fa  mi red

    %40
    mi8\staccatissimo r r4 r8 mi16 fa mi re! do si
    la8\staccatissimo r r4 do'8\staccatissimo mi16 do la4\staccatissimo
    r2 si16 la sold fad mi4\staccatissimo
    
    %43
    r4 r8 la16\p mi do8\staccatissimo r r4
    r8 si'16 sold mi4\staccatissimo r2
    r8 mi'16\f do la8\staccatissimo r r re16 la si8\staccatissimo r\mbreak
    
    %46
    r8 do'16 sold la8\staccatissimo r r si,16 fad sold8\staccatissimo r
    r4 r8 fa16 si, la4(sold\tr)
    la8\staccatissimo r r4 do16 mi la mi do mi do la
    
    %49
    fad'4\staccatissimo r r do''\staccatissimo\p
    sol,,^\staccatissimo\f r r do''\staccatissimo\p\mbreak %% fine 2do sistema ultima pagina OOOKKK
    lab,,\staccatissimo\f r r do''\staccatissimo \p
    
    %52
    la,,!\f\staccatissimo r r do''\staccatissimo\p
    sib,,8\staccatissimo\f r r4 r2
    r sib16 re sol re sib re sib sol
    
    %55
    red'4\staccatissimo r r la''\staccatissimo\p 
    mi,\staccatissimo \f r r la'\staccatissimo\p 
    fa,!\staccatissimo\f r r la'\staccatissimo\p 
    
    %58
    fad,\staccatissimo\f r r la'\staccatissimo\p\mbreak
    sol,8\f\staccatissimo r r4 r2
    r r8 si'16 sol mi8\staccatissimo sol16 mi
    
    %61
    do8\staccatissimo r r4 r8 la'16 fad re8\staccatissimo fad16 re
    si8\staccatissimo r r4 r8 sol'16 mi do8\staccatissimo mi16 do
    la8\staccatissimo r r4 r8si,16 red fad la sol fad
    
    %64
    sol8\staccatissimo r r4 r8 si16 red fad la sol fad\mbreak
    mi8\staccatissimo r r4 sol,8\staccatissimo si16 sol mi4\staccatissimo
    r2 fad16 mi red dod si4\staccatissimo
    
    %67
    r r8 mi16\p si sol8\staccatissimo r r4
    r8 fad'16 red si4\staccatissimo r2
    r4 r8 la''16\f mi fad8\staccatissimo r r sol16 red
    
    %70
    mi8\staccatissimo r r4 r2
    r4 r8 mi16 re! do8\staccatissimo do16 si lad4(\mbreak
    si) r si,16 red fad red si red fad si
    
    %73
    si,8\staccatissimo r r do'16 fad, mi4(red\tr)
    r2 fad'16\p si red, fad si,4\staccatissimo 
    r8 si\staccatissimo sol'\staccatissimo mi fad16 si red, fad si,4\staccatissimo
    
    %76
    r r8 sol,16\f si mi8\staccatissimo r r si16 mi
    sol8\staccatissimo r r mi16 sol si8\staccatissimo r r sol16 si\mbreak
    mi8  re16 do si la sol fad mi4(red\tr)
    
    %79
    mi8\staccatissimo si16 mi sold8\staccatissimo r r mi'16 la sold8\staccatissimo r
    r2 do,8\staccatissimo mi16 do la4\staccatissimo    
    r2 si16 la sold fad mi4\staccatissimo
    
    %82
    r4 r8 la16\p mi do8\staccatissimo r r4
    r8 si'16 sold mi4\staccatissimo r2
    r8 mi'16\f do la8\staccatissimo sol'!16 mi fa8\staccatissimo r r4
    
    %85
    r8 re16 si sol8\staccatissimo fa'16 re mi8\staccatissimo r r4\mbreak
    r2 r8 do16 la sol fad  mi red
    mi8\staccatissimo r r4 r8 mi16 fa mi re! do si
    
    %88
    la8\staccatissimo r r4 do'8\staccatissimo mi16 do la4\staccatissimo
    r2 si16 la sold fad mi4\staccatissimo
    r4 r8 la16\p mi do8\staccatissimo r r4
    
    %91
    r8 si'16 sold mi4\staccatissimo r2
    r8 mi'16\f do la8\staccatissimo r r re16 la si8\staccatissimo r\mbreak
    r8 do'16 sold la8\staccatissimo r r si,16 fad sold8\staccatissimo r
    
    %94
    r4 r8 fa16 si, la4(sold\tr)
    la8\staccatissimo r r4 r2
    
}

IIImdn = \relative do'' {

    do'8\staccatissimo mi16 do la8\staccatissimo do16 la mi4\staccatissimo r8 do'
    si16 la sold fad mi4\staccatissimo r8 si16 la sold fad mi re
    do8\staccatissimo mi\staccatissimo\p la\staccatissimo do\staccatissimo mi\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo

    %4
    red(mi) r4 mi,,16\f fad sold la si do re si\mbreak
    do8\staccatissimo r r4 r8 fa'16 re la8\staccatissimo do16 la
    si8\staccatissimo r r4 r8 mi16 do sold8\staccatissimo si16 sold

    %7
    la8\staccatissimo do16 si la sol! fa mi red8\staccatissimo la'\staccatissimo r la,
    sold16 mi' re! do si la sold fad mi8\staccatissimo r r4
    do''8\staccatissimo mi16 do la8\staccatissimo do16 la mi4\staccatissimo r8 do'

    %10
    si16 la sold fad mi4\staccatissimo r8 si16 la sold fad mi re
    do8\staccatissimo mi\staccatissimo\p la\staccatissimo do\staccatissimo mi\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo
    red(mi) r4 mi,,16\f fad sold la si do re si\mbreak

    %13
    do8\staccatissimo r r la'16 mi fa8\staccatissimo r r sol16 re
    mi8\staccatissimo r r fa'16 dod re8\staccatissimo r r mi,16 si\mbreak
    do8\staccatissimo la'16 mi sol fa mi re do4(si\prallprall)

    %16
    la16 do mi la mi do mi do la8\staccatissimo r r4
    sol'16 do mi, sol do,4\staccatissimo r8 sol'\staccatissimo\p mi'\staccatissimo do\staccatissimo
    re16 do si la sol4\staccatissimo r8 re,16 sol si8 sol16 si

    %19
    re\f sol si, re sol,4\staccatissimo r8 sol'\p\staccatissimo fa'\staccatissimo re\staccatissimo\mbreak
    mi16 re do si do4\staccatissimo r16 si,\f do re mi re mi fa
    sol8 mi do4\tr r8 sol'16 la do sib la sol

    %22
    la do fa, la do,4\staccatissimo sol'16 do mi, sol do,4\staccatissimo
    sol'16 fa mi re fa mi re do mi re do si re do si la
    si do re mi re do si la sol4\staccatissimo r %%% fie pagina 18

    %25 OOOOKKKKK
    mi'8\staccatissimo sol16 mi do8\staccatissimo mi16 do sol4\staccatissimo r8 mi''
    re16 do si la sol4\staccatissimo r8 re16 do si la sol fa
    mi8\staccatissimo mi\staccatissimo\p sol\staccatissimo do\staccatissimo mi\staccatissimo sol\staccatissimo do\staccatissimo mi\staccatissimo

    %28
    dod(re) r4 sol,,16\f la si do re mi fa re
    mi8 sol16 mi do8\staccatissimo r r la'16 fa re8\staccatissimo r\mbreak
    r re'16 si sol8\staccatissimo r r mi'16 do sol do sol mi

    %31
    la4\tenuto sol16 fa mi re do4(re\tr)
    do16 mi sol mi do mi do sol mi8\staccatissimo r r4
    do''8\staccatissimo mi16 do la8\staccatissimo do16 la mi4\staccatissimo r8 do'

    %34
    si16 la sold fad mi4\staccatissimo r8 si16 la sold fad mi re
    do8\staccatissimo mi\staccatissimo\p la\staccatissimo do\staccatissimo mi\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo
    red(mi) r4 mi,,16\f fad sold la si do re si\mbreak

    %37
    do8\staccatissimo r r4 r8 fa'16 re la8\staccatissimo do16 la
    si8\staccatissimo r r4 r8 mi16 do sold8\staccatissimo si16 sold
    la8\staccatissimo do16 si la sol! fa mi red8\staccatissimo la'\staccatissimo r la,

    %40
    sold16 mi' re! do si la sold fad mi8\staccatissimo r r4
    do''8\staccatissimo mi16 do la8\staccatissimo do16 la mi4\staccatissimo r8 do'
    si16 la sold fad mi4\staccatissimo r8 si16 la sold fad mi re

    %43
    do8\staccatissimo mi\staccatissimo\p la\staccatissimo do\staccatissimo mi\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo
    red(mi) r4 mi,,16\f fad sold la si do re si\mbreak
    do8\staccatissimo r r la'16 mi fa8\staccatissimo r r sol16 re

    %46
    mi8\staccatissimo r r fa'16 dod re8\staccatissimo r r mi,16 si\mbreak
    do8\staccatissimo la'16 mi sol fa mi re do4(si\prallprall)
    la16 do mi la mi do mi do la8\staccatissimo r r4

    %49
    r4 <<
        {
            mib'\p mib mib
            \override Rest #'staff-position = #-1 r mib\p mib mib
            r mib\p mib mib
            r mib mib mib
        }\\{
            do do do
            s do do do
            s do do do
            s\stemUp\shiftOn fad, fad fad
        }
    >> \revert Rest #'staff-position

    %53
    r16 re'\f sol sib re sib sol re do' sib la sol fad  mi re do
    sib re sol re sib re sib sol r2
    r4 <<
        {
            la'\p la la\mbreak
            r do,\p do do
            r do'\p do do
            r do,\p do do
        }\\{
            do do do
            s la la la
            s la' la la
            s\stemUp\shiftOn red,, red red
        }
    >>

    %59
    r16 si'!\f mi sol si sol mi si la' sol fad mi red dod si la
    sol si mi si sol si sol mi si4\staccatissimo r
    mi16 la do mi do la do mi la4\staccatissimo r\mbreak

    %62
    re,,16 sol si re si sol si re sol4\staccatissimo r
    do,,16 fad la do la fad la do fad4\staccatissimo r
    r8 sol,16 si mi sol fad mi red8\staccatissimo red16 fad la do si la

    %65
    sol8\staccatissimo si16 sol mi8\staccatissimo sol16 mi si4\staccatissimo r8 sol'
    fad16mi red dod si4\staccatissimo r8 fad 16mi red dod si la\mbreak
    sol8\staccatissimo si\p\staccatissimo mi\staccatissimo sol\staccatissimo si\staccatissimo mi\staccatissimo sol\staccatissimo si\staccatissimo

    %68
    lad(si) r4 si,16\f dod red mi fad sol la? fad
    sol8 mi'16 si do8\staccatissimo r r re16 la si8\staccatissimo r
    r do16 si la8\staccatissimo r r mi,16^\p re do8\staccatissimo r

    %71
    r mi''16\f re do8\staccatissimo do16-4 si lad8\staccatissimo sol\staccatissimo fad\staccatissimo  mi\staccatissimo \mbreak
    red16 fad si fad red fad red si fad'4. la,8
    sol\staccatissimo mi'16 si re! do si la sol4(fad\prallprall)

    %74
    sol16\p si mi, sol si,4\staccatissimo r8 si\staccatissimo la'\staccatissimo fad\staccatissimo
    sol16 si mi, sol  si,4\staccatissimo r8 si'\staccatissimo^\f la'\staccatissimo fad\staccatissimo
    sol16 si mi, sol si mi si sol mi si' sol mi si sol' mi si\mbreak

    %77
    sol mi' si sol mi si' sol mi si sol' mi si\stemUp \giu sol\su mi' \giu si sol
    mi sol si\su mi  re do si\giu la \stemUp \once\slurUp sol4(fad\prallprall)
    mi4\staccatissimo \su \stemNeutral r8 si''16 mi, la8\staccatissimo r r si'16 re

    %80
    do8\staccatissimo mi16 do la8\staccatissimo do16 la mi4\staccatissimo r8 do'
    si16 la sold fad mi4\staccatissimo r8 si16 la sold fad mi re
    do8\staccatissimo mi\staccatissimo\p la\staccatissimo do\staccatissimo mi\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo

    %83
    red(mi) r4 mi,,16\f fad sold la si do re si\mbreak
    do8\staccatissimo r r4 r8 fa'16 re la8\staccatissimo do16 la
    si8\staccatissimo r r4 r8 mi16 do sold8\staccatissimo si16 sold

    %86
    la8\staccatissimo do16 si la sol! fa mi red8\staccatissimo la'\staccatissimo r la,
    sold16 mi' re! do si la sold fad mi8\staccatissimo r r4
    do''8\staccatissimo mi16 do la8\staccatissimo do16 la mi4\staccatissimo r8 do'

    %89
    si16 la sold fad mi4\staccatissimo r8 si16 la sold fad mi re
    do8\staccatissimo mi\staccatissimo\p la\staccatissimo do\staccatissimo mi\staccatissimo la\staccatissimo do\staccatissimo mi\staccatissimo
    red(mi) r4 mi,,16\f fad sold la si do re si\mbreak

    %92
    do8\staccatissimo r r la'16 mi fa8\staccatissimo r r sol16 re
    mi8\staccatissimo r r fa'16 dod re8\staccatissimo r r mi,16 si\mbreak
    do8\staccatissimo la'16 mi sol fa mi re do4(si\prallprall)

    %95
    la16 do mi la mi do mi do la8\staccatissimo r r4
}

IIImsn = \relative do {

    <la 'la,>4 la la la
    sold sold sold sold
    la8\staccatissimo r r4 r2

    %4
    r4 sold\staccatissimo\p sold\f  sold\mbreak
    la do, re fa
    sol! si, do mi

    %7
    fa fa fa fa
    mi\staccatissimo  r r8 mi16 fa mi re do si
    la4 la' la la\mbreak

    %10
    sold sold sold sold
    la8\staccatissimo r r4 r2
    r4 sold\staccatissimo\p sold\f  sold

    %13
    la do re sol,!
    do fa, si mi,\mbreak
    la re, mi mi,

    %16
    la r r8 la' sol16 fa mi re
    do4 do do\p do
    si si si si

    %19
    si\f si si\p si\mbreak
    do do do do\f
    mi mi mi mi

    %22
    fa fa mi mi
    re8 si' do,[la'] si, sol' la,[fad']
    sol,4 sol' r sol,\mbreak

    %25
    do do do do
    si si si si
    do8\staccatissimo r r4 r2

    %28
    r4 si\p si\f si
    do mi fa fa,\mbreak
    sol si do mi

    %31
    fa fa sol sol,
    do\staccatissimo r r2
    la'4 la la la

    %34
    sold sold sold sold
    la8\staccatissimo r r4 r2
    r4 sold\staccatissimo\p sold\f  sold\mbreak

    %37
    la do, re fa
    sol! si, do mi
    fa fa fa fa

    %40
    mi\staccatissimo  r r8 mi16 fa mi re do si
    la4 la' la la\mbreak
    sold sold sold sold

    %43
    la8\staccatissimo r r4 r2
    r4 sold\staccatissimo\p sold\f  sold
    la do re sol,!

    %46
    do fa, si mi,\mbreak
    la re, mi mi,
    la r r2

    %49
    fad4\staccatissimo\f r r2
    sol4\staccatissimo \f r r2
    lab4\staccatissimo\f r r2

    %52
    la!4\f\staccatissimo r r2
    sib4\f sib la re
    sol,\staccatissimo r sol'\staccatissimo r

    %55
    red\staccatissimo \f r r2\mbreak
    mi!4\staccatissimo\f r r2
    fa!4\staccatissimo\f r r2

    %58
    fad4\staccatissimo\f r r2
    sol4\f sol fad si
    mi, mi sol sol

    %61
    la la fad fad\mbreak
    sol sol mi mi
    fad fad red red

    %64
    mi lad,(si) si
    mi mi mi mi
    red red red red\mbreak

    %67
    mi8\staccatissimo r r4 r2
    r4 red\staccatissimo\p red\staccatissimo\f red
    mi la re,! sol

    %70
    do,\staccatissimo r do,^\staccatissimo^\p r
    do'\f r r do'(
    si) si red, red

    %73
    mi la si si,
    mi\p mi red red
    mi mi red red\f

    %76
    mi r r2\mbreak
    R1
    \stemDown sol,4 la si \once\stemUp \once\shiftOn si,

    %79
    \stemUp \once\shiftOn mi4\stemNeutral \stemNeutral re'\staccatissimo do\staccatissimo si\staccatissimo
    <la 'la,>4 la la la
    sold sold sold sold

    %82
    la8\staccatissimo r r4 r2
    r4 sold\staccatissimo\p sold\f  sold\mbreak
    la do, re fa

    %85
    sol! si, do mi
    fa fa fa fa
    mi\staccatissimo  r r8 mi16 fa mi re do si

    %88
    la4 la' la la\mbreak
    sold sold sold sold
    la8\staccatissimo r r4 r2

    %91
    r4 sold\staccatissimo\p sold\f  sold
    la do re sol,!
    do fa, si mi,\mbreak

    %94
    la re, mi mi,
    la r r2

}


IIIbcn = \relative do {

    la'4\staccatissimo\pf r la\staccatissimo r
    sold\staccatissimo r sold\staccatissimo r
    la8\staccatissimo r r4 r2

    %4
    r sold4\staccatissimo r
    la\staccatissimo do,\staccatissimo re\staccatissimo r
    r si\staccatissimo do\staccatissimo r

    %7
    r2 fa4\staccatissimo  r
    mi\staccatissimo r r8 mi16\f fa mi re do si
    la4\staccatissimo r la'\staccatissimo\pf  r

    %10
    sold\staccatissimo r sold\staccatissimo r
    la8\staccatissimo r r4 r2
    r sold4\staccatissimo r

    %13
    la\staccatissimo do\staccatissimo re\staccatissimo sol,!\staccatissimo
    do\staccatissimo fa,\staccatissimo  si\staccatissimo mi,\staccatissimo
    la\staccatissimo re,\staccatissimo mi\staccatissimo mi,^\staccatissimo

    %16
    la\staccatissimo r r8 la' sol16 fa mi re
    do4\staccatissimo r do\staccatissimo\p r
    si\staccatissimo r si\staccatissimo r

    %19
    si\staccatissimo\f r si\staccatissimo \p r
    do\staccatissimo r do\staccatissimo r
    mi\staccatissimo \pf r mi\staccatissimo r

    %22
    fa\staccatissimo r mi\staccatissimo r
    re(do) r2
    r r4 sol\staccatissimo

    %25
    do\staccatissimo r do\staccatissimo r
    si\staccatissimo r si\staccatissimo r
    do8\staccatissimo r r4 r2

    %28
    r si4\staccatissimo r
    do\staccatissimo r fa,^\staccatissimo r
    sol\staccatissimo r do\staccatissimo r

    %31
    fa\staccatissimo r sol\staccatissimo sol,\staccatissimo
    do\staccatissimo r r2
    la'4\staccatissimo r la\staccatissimo r

    %34
    sold\staccatissimo r sold\staccatissimo r
    la8\staccatissimo r r4 r2
    r sold4\staccatissimo r

    %37
    la\staccatissimo do,\staccatissimo re\staccatissimo r
    r si\staccatissimo do\staccatissimo r
    r2 fa4\staccatissimo  r

    %40
    mi\staccatissimo r r8 mi16\f fa mi re do si
    la4\staccatissimo r la'\staccatissimo\pf  r
    sold\staccatissimo r sold\staccatissimo r

    %43
    la8\staccatissimo r r4 r2
    r sold4\staccatissimo r
    la\staccatissimo do\staccatissimo re\staccatissimo sol,!\staccatissimo

    %46
    do\staccatissimo fa,\staccatissimo  si\staccatissimo mi,\staccatissimo
    la\staccatissimo re,\staccatissimo mi\staccatissimo mi,^\staccatissimo
    la\staccatissimo r r2

    %49
    fad4\staccatissimo\f r r2
    sol4\staccatissimo r r2
    lab4\staccatissimo r r2

    %52
    la!4\staccatissimo r r2
    sib4\staccatissimo r r2
    R1

    %55
    red4\staccatissimo\f r r2
    mi!4\staccatissimo r r2
    fa!4\staccatissimo r r2  %%% fine pagina

    %58
    fad4\staccatissimo r r2
    sol4\staccatissimo r r2
    r r4 sol\staccatissimo\pf

    %61
    la\staccatissimo r r fad\staccatissimo
    sol\staccatissimo r r mi\staccatissimo
    fad\staccatissimo r r red\staccatissimo

    %64
    mi\staccatissimo lad,(si\staccatissimo) si\staccatissimo
    mi\staccatissimo r mi\staccatissimo r
    red\staccatissimo r red\staccatissimo r

    %67
    mi8\staccatissimo r r4 r2
    r red4\staccatissimo r
    mi\staccatissimo la\staccatissimo re,! sol\staccatissimo

    %70
    do,\staccatissimo r r2
    r r4 do'(
    si) r red,\staccatissimo  r

    %73
    mi\staccatissimo la\staccatissimo si\staccatissimo si,^\staccatissimo
    R1
    r2 r4 red\staccatissimo

    %76
    mi\staccatissimo r r2
    R1
    sol,4 la si si

    %79
    mi\staccatissimo re'\staccatissimo do\staccatissimo si\staccatissimo
    la\staccatissimo r la\staccatissimo r
    sold\staccatissimo r sold\staccatissimo r

    %82
    la8\staccatissimo r r4 r2
    r sold4\staccatissimo r
    la\staccatissimo do,\staccatissimo re\staccatissimo r

    %85
    r si\staccatissimo do\staccatissimo r
    r2 fa4\staccatissimo r
    mi\staccatissimo r r8 mi16\f fa mi re do si

    %88
    la4\staccatissimo r la'\staccatissimo\pf r
    sold\staccatissimo r sold\staccatissimo r
    la8\staccatissimo r r4 r2

    %91
    r sold4\staccatissimo r
    la\staccatissimo do\staccatissimo re\staccatissimo sol,!\staccatissimo
    do\staccatissimo fa,\staccatissimo  si\staccatissimo mi,\staccatissimo

    %94
    la\staccatissimo re,\staccatissimo mi\staccatissimo mi,^\staccatissimo
    la\staccatissimo r r2

}

IIIbfn =  \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp


}


forma = {

    \key do\major
    \time 4/4
    \tempo 2 = 60
    s1*95
    \bar "|."

}

IIIvl = {
    \IIIglobal
    %\notypeset
    <<\IIIvln \forma>>

}

IIImd = {
    \IIIglobal
    %\clef soprano
    \context Staff = up
    <<\IIImdn \forma>>

}

IIIms = {
    \IIIglobal
    \clef bass
    \context Staff = down
    <<\IIImsn \forma\IIIbfn>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma>>
    \typeset

}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup \huge {[1.] Presto}

\score {

  \new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
  } <<

    \new Staff \with {
      fontSize = #-1
      \override StaffSymbol.staff-space = #(magstep -1)
    } <<
      \set Staff.midiInstrument = #"violin"
      \set Staff.instrumentName = \markup \center-column{"Violino"}
      \Ivl
    >>

    \new PianoStaff <<

      \set PianoStaff.midiInstrument = #"harpsichord"
      \new Staff = "up" \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      }
      <<
        \set PianoStaff.instrumentName =  \markup \center-column{"Cembalo"}
        \Imd
      >>

      \new Staff = "down"  \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      }
      <<
        \Ims
      >>
    >>

    \new Staff \with {
      fontSize = #-1
      \override StaffSymbol.staff-space = #(magstep -1)
    } <<
      \set Staff.midiInstrument = #"cello"
      \set Staff.instrumentName = \markup \center-column{"Violoncello"}
      \Ibc
    >>
  >>

  \layout {

    indent = 1.9\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup \huge {[2.] Andante}

\score {

  \new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
  } <<

    \new Staff \with {
      fontSize = #-1
      \override StaffSymbol.staff-space = #(magstep -1)
    } <<
      \set Staff.midiInstrument = #"violin"
      \IIvl
    >>

    \new PianoStaff <<

      \set PianoStaff.midiInstrument = #"harpsichord"
      \new Staff = "up" \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      }
      <<
        \IImd
      >>

      \new Staff = "down"  \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      }
      <<
        \IIms
      >>
    >>

    \new Staff \with {
      fontSize = #-1
      \override StaffSymbol.staff-space = #(magstep -1)
    } <<
      \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      \IIbc
    >>
  >>

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup \huge {[3.] Presto ma non tanto}

\score {

  \new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
  } <<

    \new Staff \with {
      fontSize = #-1
      \override StaffSymbol.staff-space = #(magstep -1)
    } <<
      \set Staff.midiInstrument = #"violin"
      \IIIvl
    >>

    \new PianoStaff <<

      \set PianoStaff.midiInstrument = #"harpsichord"
      \new Staff = "up" \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      }
      <<
        \IIImd
      >>

      \new Staff = "down"  \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      }
      <<
        \IIIms
      >>
    >>

    \new Staff \with {
      fontSize = #-1
      \override StaffSymbol.staff-space = #(magstep -1)
    } <<
      \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      \IIIbc
    >>
  >>

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

