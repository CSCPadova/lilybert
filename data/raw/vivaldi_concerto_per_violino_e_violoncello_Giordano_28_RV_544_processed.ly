\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto solo"

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

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

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

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
}

Ivln = \relative do'' {

  fa,16^\markup\italic\column\tiny{"Il Violino Principale può suonare li soli del Violoncello et al rovescio il Violon[cel]lo"\vspace #-0.3"può suonare li soli del Violino suonandoli come stanno."}_\markup\italic\tiny "Li soli del Viol[in]o principale vanno sempre suonati all'ottava alta." [la do8 do do] fa do la fa
  fa16 [la do8 do do] fa do la fa
  fa16[la do8 do do] mi,16 sol do8 sib' sib

  %4
  fa,16 la do8 la' la mi,16 sol do8 sib' sib
  fa,16 la do8 la' la sol16[la sol fa mi re do sib]
  la[do fa8 fa fa] la fa do la\mbreak

  %7
  la16[do fa8 fa fa] la fa do la
  do'[sib16 la sib8 sol] la(sib) do4
  do8[sib16 la sib8 sol] la(sib) do4

  %10
  mi,16(fa sol8) mi16(fa sol8) fa do la fa
  do''8[sib16 la sib8 sol] la(sib) do4
  do8[sib16 la sib8 sol] la(sib) do4

  %13
  mi,16(fa sol8) mi16(fa sol8) fa4 \clef tenor r8 fa,_\markup\italic\tiny\center-align"[Violino] all'ottava alta"
  mi16(re) do(sib) la8 sol fa(sol la) sib
  do sib16 la fa'8 mi16 re\mbreak re4\tr do

  %16
  R1
  r2 r4  r8 do
  re16 fa re sib re fa re sib do fa do la do fa do la

  %19
  re fa re sib re fa re sib do fa do la do fa do la
  sib re sib sol sib re sib sol la sib la sol fa4\mbreak
  R1*2

  %23
  r2 r4 r8
  do' re16 do re mi mi re mi fa\mbreak fa mi fa sol sol fa sol  la
  la8[sol16 fa sol8 mi]fa[mi16 re do8 sol']

  %26
  la[sol16 fa sol8 mi] fa4 r
  R1*2
  r2 \clef violin fa16[la do8 do do]

  %30
  fa do la fa fa16[la do8 do do]
  fa do la fa mi16[sol do8 do do]
  sol' mi do sol mi16[sol do8 do do]

  %33
  sol' mi do sol sol16[si re8 re re]\mbreak  %%%% fine p 3  OK
  sol re si sol sol16[si re8 re re]
  sol re si sol sol'[fa16 mi fa8 re]

  %36
  mi(fa) sol4 sol8[fa16 mi fa8 re]
  mi(fa) sol4 si,16(do re8) si16(do re8)
  do sol mi do sol''[fa16 mi fa8 re]

  %39
  mi(fa) sol4 sol8[fa16 mi fa8 re]
  mi(fa) sol4 si,16(do re8) si16(do re8)
  do\clef tenor mi,, do'4~do8[si16(do) re(do) re(si)]

  %42
  do8[si16(do) re(do) re(si)]\mbreak do8[si16(do) re(do) re(si)]
  do8[do16(re) mi(re) mi(do)] re8 [re16 mi fa mi fa re]
  mi8 do r4 r2

  %45
  R1*2
  do16 mi, do' mi, do' mi, do' mi, \clef bass fa la, fa'la, fa' la, fa' la,
  \clef tenor si' re, si' re, si' re, si' re,\clef bass mi sol, mi' sol, mi' sol, mi' sol,

  %49
  la' do, la' do, la' do, la' do, re fa, re' fa, re' fa, re' fa,\mbreak
  \clef tenor sold'8[fad16 mi la8 re] do si16 la si4\tr
  \clef violin la'16[do mi8 mi mi] la mi do la

  %52
  la16[do mi8 mi mi] la mi do la
  sold16[si mi8 mi mi] si' sold mi si
  sold16[si mi8 mi mi] si' sold mi si

  %55
  la16[do mi8 mi mi]\mbreak mi[re16 do re8 si]
  do(re) mi4 mi8[re16 do re8 si]
  do(re) mi4 sold,16(la si8) sold16(la si8)

  %58
  la mi do la mi''[re16 do re8 si]
  do(re) mi4 mi8[re16 do re8 si]
  do(re) mi4 sold,16(la si8) sold16(la si8)

  %61
  la4 r r2
  R1*9
  fa16[la do8 do do] fa do la fa

  %72
  fa16[la do8 do do] fa do la fa
  fa16[la do8 do do] mi,16 sol do8 sib' sib
  fa,16 la do8 la' la mi,16 sol do8 sib' sib

  %75
  fa,16 la do8 la' la\mbreak sol4 r8 \clef tenor fa,
  mi16(re) do(sib) la8 sol fa(sol la) sib
  do  sib16 la fa'8 mi16 re re4\tr do

  %78
  R1
  r2 r4 r8 do
  re16 fa re sib re fa re sib do fa do la do fa do la

  %81
  re fa re sib re fa re sib do fa do la do fa do la
  sib re sib sol sib re sib sol la sib la sol fa4\mbreak %%%%%% fine p. 8 battuta 82
  R1*2

  %85
  r2 r4 r8 do'
  re16 do re mi mi re mi fa fa mi fa sol sol fa sol la
  la8[sol16 fa sol8 mi] fa[mi16 re do8 sol']

  %88
  la[sol16 fa sol8 mi] fa[mi16 re do8 sol']
  la sol16 fa sol4\tr fa4. sol8
  la sol16 fa sol4\tr\mbreak fa4 r

  %91
  R1*5
  \clef violin fa16[la do8 do do] fa do la fa
  fa16 [la do8 do do] fa do la fa

  %98
  fa16[la do8 do do] mi,16 sol do8 sib' sib
  fa,16 la do8 la' la mi,16 sol do8 sib' sib
  fa,16 la do8 la' la sol16[la sol fa mi re do sib]

  %101
  la[do fa8 fa fa] la fa do la\mbreak
  la16[do fa8 fa fa] la fa do la
  do'[sib16 sol sib8 sol] la(sib) do4

  %104
  do8[sib16 la sib8 sol] la(sib) do4
  mi,16(fa sol8) mi16(fa sol8) fa do la fa
  do''8[sib16 la sib8 sol] la(sib) do4

  %107
  do8[sib16 la sib8 sol] la(sib) do4
  mi,16(fa sol8) mi16(fa sol8) fa4\fermata r

}

IvlIn =  \relative do'' {

  fa,16_\markup\italic\tiny"Il Primo di ripieno si cava dal Violino Principale nelli Ripieni." [la do8 do do] fa do la fa
  fa16 [la do8 do do] fa do la fa
  fa16[la do8 do do] mi,16 sol do8 sib' sib

  %4
  fa,16 la do8 la' la mi,16 sol do8 sib' sib
  fa,16 la do8 la' la sol16[la sol fa mi re do sib]
  la[do fa8 fa fa] la fa do la\mbreak

  %7
  la16[do fa8 fa fa] la fa do la
  do'[sib16 la sib8 sol] la(sib) do4
  do8[sib16 la sib8 sol] la(sib) do4

  %10
  mi,16(fa sol8) mi16(fa sol8) fa do la fa
  do''8[sib16 la sib8 sol] la(sib) do4
  do8[sib16 la sib8 sol] la(sib) do4

  %13
  mi,16(fa sol8) mi16(fa sol8) fa4 r
  R1*15
  r2 fa,16[la do8 do do]

  %30
  fa do la fa fa16[la do8 do do]
  fa do la fa mi16[sol do8 do do]
  sol' mi do sol mi16[sol do8 do do]

  %33
  sol' mi do sol sol16[si re8 re re]\mbreak  %%%% fine p 3  OK
  sol re si sol sol16[si re8 re re]
  sol re si sol sol'[fa16 mi fa8 re]

  %36
  mi(fa) sol4 sol8[fa16 mi fa8 re]
  mi(fa) sol4 si,16(do re8) si16(do re8)
  do sol mi do sol''[fa16 mi fa8 re]

  %39
  mi(fa) sol4 sol8[fa16 mi fa8 re]
  mi(fa) sol4 si,16(do re8) si16(do re8)
  do4 r r2

  %42
  R1*9
  la16[do mi8 mi mi] la mi do la
  la16[do mi8 mi mi] la mi do la

  %53
  sold16[si mi8 mi mi] si' sold mi si
  sold16[si mi8 mi mi] si' sold mi si
  la16[do mi8 mi mi]\mbreak mi[re16 do re8 si]

  %56
  do(re) mi4 mi8[re16 do re8 si]
  do(re) mi4 sold,16(la si8) sold16(la si8)
  la mi do la mi''[re16 do re8 si]

  %59
  do(re) mi4 mi8[re16 do re8 si]
  do(re) mi4 sold,16(la si8) sold16(la si8)
  la4 r r2

  %62
  R1*9
  fa16[la do8 do do] fa do la fa
  fa16[la do8 do do] fa do la fa

  %73
  fa16[la do8 do do] mi,16 sol do8 sib' sib
  fa,16 la do8 la' la mi,16 sol do8 sib' sib
  fa,16 la do8 la' la\mbreak sol4 r

  %76
  R1*20
  fa,16 [la do8 do do] fa do la fa
  fa16 [la do8 do do] fa do la fa

  %98
  fa16[la do8 do do] mi,16 sol do8 sib' sib
  fa,16 la do8 la' la mi,16 sol do8 sib' sib
  fa,16 la do8 la' la sol16[la sol fa mi re do sib]

  %101
  la[do fa8 fa fa] la fa do la\mbreak
  la16[do fa8 fa fa] la fa do la
  do'[sib16 la sib8 sol] la(sib) do4

  %104
  do8[sib16 la sib8 sol] la(sib) do4
  mi,16(fa sol8) mi16(fa sol8) fa do la fa
  do''8[sib16 la sib8 sol] la(sib) do4

  %107
  do8[sib16 la sib8 sol] la(sib) do4
  mi,16(fa sol8) mi16(fa sol8) fa4\fermata r

}

IvlIIn = \relative do'' {

  r2 fa,16[la do8 do do]
  fa do la fa fa16[la do8 do do]
  fa do la fa do16 mi sol8 sol'8 sol

  %4
  la,,16 do fa8 fa' fa do,16 mi sol8 sol' sol
  la,,16 do fa8 fa' fa mi16[fa mi re do sib la sol]
  fa[la do8 do do] fa do la fa\mbreak

  %7
  fa16[la do8 do do] fa do la fa
  la'[sol16 fa sol8 mi] fa(sol) la4
  la8[sol16 fa sol8 mi] fa(sol) la4

  %10
  sol16(la sib8) sol16(la sib8) la fa do la
  la'[sol16 fa sol8 mi] fa(sol) la4
  la8[sol16 fa sol8 mi] fa(sol) la4

  %13
  sol16(la sib8) sol16(la sib8) la4 r
  R1*16
  fa,16[la do8 do do] fa do la fa

  %31
  fa16[la do8 do do] do sol mi do
  mi16[sol do8 do do] sol' mi do sol
  mi16[sol do8 do do] sol' re si sol\mbreak

  %34
  sol16[si re8 re re] sol re si sol
  sol16[si re8 re re] mi[re16 do re8 si]
  do(re) mi4 mi8[re16 do re8 si]

  %37
  do(re) mi4 re16(mi fa8) re16(mi fa8)
  mi do sol mi mi'[re16 do re8 si]
  do(re) mi4 mi8[re16 do re8 si]

  %40
  do(re) mi4 re16(mi fa8) re16(mi fa8)
  mi4 r r2
  R1*9

  %51
  r2 la,16[do mi8 mi mi]
  la mi do la la16[do mi8 mi mi]
  mi si sold mi sold16[si mi8 mi mi]

  %54
  si' sold mi si sold16[si mi8 mi mi]
  mi do la mi\mbreak do'[si16 la si8 sold] %%% inizio p 6
 \once\slurDashed la8 (si) do4 do8[si16 la si8 sold]

  %57
  la(si) do4 si16(do re8) si16(do re8)
  do la mi do do'[si16 la si8 sold]
  la(si) do4 do8[si16 la si8 sold]

  %60
  \once\slurDashed la8 (si) do4 si16(do re8) si16(do re8)
  la4 r r2
  R1*9

  %71
  r2 fa16[la do8 do do]
  fa do la fa fa16[la do8 do do]
  fa do la fa do16 mi sol8 sol' sol

  %74
  la,,16 do fa8 fa' fa do,16 mi sol8 sol' sol
  la,,16 do fa8 fa' fa mi4 r
  R1*20

  %96
  r2 fa,16[la do8 do do]
  fa do la fa fa16[la do8 do do]
  fa do la fa do16 mi sol8 sol'8 sol

  %99
  la,,16 do fa8 fa' fa do,16 mi sol8 sol' sol
  la,,16 do fa8 fa' fa mi16[fa mi re do sib la sol]
  fa[la do8 do do] fa do la fa\mbreak

  %102
  fa16[la do8 do do] fa do la fa
  la'[sol16 fa sol8 mi] fa(sol) la4
  la8[sol16 fa sol8 mi] fa(sol) la4

  %105
  sol16(la sib8) sol16(la sib8) la fa do la
  la'[sol16 fa sol8 mi] fa(sol) la4
  la8[sol16 fa sol8 mi] fa(sol) la4

  %108
  sol16(la sib8) sol16(la sib8) la4\fermata r

}

Ivlan =  \relative do' {

   fa1~
   fa~
   fa2 do~

   %4
   do1~
   do~
   do~\mbreak

   %7
   do~
   do~
   do~

   %10
   do~
   do~
   do~

   %13
   do2 do4  r
   R1*15
   r2 do~

   %30
   do1~
   do~
   do~

   %33
   do4 sol' sol2~\mbreak
   sol1~
   sol1~

   %36
   sol1~
   sol1~
   sol1~

   %39
   sol1~
   sol1
   sol4 r r2

   %42
   R1*9
   mi1~
   mi1~

   %53
   mi1~
   mi1~
   mi1~

   %56
   mi1~
   mi1~
   mi1~

   %59
   mi1~
   mi1
   mi4 r r2

   %62
   R1*9
   do1~
   do~

   %73
   do~
   do~
   do2 do4 r

   %76
   R1*20
   fa1~
   fa~

   %98
   fa2 do~
   do1~
   do~

   %101
   do~\mbreak
   do~
   do~

   %104
   do~
   do~
   do~

   %107
   do~
   do2 do4\fermata r

}

Ivcn = \relative do {

  fa8_\markup\italic\tiny"Quando il Violon[cel]lo no hà soli suona unisono con il Basso." [la16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 fa,] mi mi'16 re do8 mi,

  %4
  fa[la'16 sol fa8 fa,] mi mi'16 re do8 mi,
  fa[la'16 sol fa8 fa,] do'4 re8 mi
  fa8 [la16 sol fa8 la,] fa[la'16 sol fa8 la,]

  %7
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa'16[la do8 do do] fa do la fa
  fa16[la do8 do do] fa do la fa

  %10
  do'4 do,4 fa, r
  fa'16[la do8 do do] fa do la fa
  fa16[la do8 do do] fa do la fa

  %13
  do'4 do, fa4 r
  R1
  r2 r4 r8 \clef violin fa''

  %16
  mi16(re) do(sib) la8 sol fa(sol la) sib
  do sib16 la fa'8 mi16 re re4\tr do
  R1*2

  %20
  r2 r4 r8 do
  re16 fa re sib re fa re sib do fa do la do fa do la
  re fa re sib re fa re sib do fa do la do fa do la

  %23
  sib re sib sol sib re sib sol la sib la sol fa4
  R1*2
  r2 r4 r8 do'

  %27
  re16 do re mi mi re mi fa fa mi fa sol sol fa sol la
  la8[sol16 fa sol8mi] fa[mi16 re do8 sol']
  la[sol16 fa sol8 mi] fa4 r

  %30
  \clef bass fa,,,8[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 fa,] do[mi'16 re do8 mi,]
  do[do'16 sib do8 mi,] do[do'16 sib do8 mi,]

  %33
  \once\stemUp do[\once \stemDown do''16 sib do8 do,] si[si'16 la sol8 si,]\mbreak
  sol[si'16 la sol8 si,] sol[si'16 la sol8 si,]
  sol[si'16 la sol8 si,] do16[mi sol8 sol sol]

  %36
  do sol mi do do16[re sol8 sol sol]
  do sol mi do sol'4 sol,
  do r do16[mi sol8 sol sol]

  %39
  do sol mi do do16[mi sol8 sol sol]
  do sol mi do sol'4 sol,
  do4 r r2

  %42
  R1*2
  \clef violin r8 mi' do'4~do8[si16(do) re(do) re(si)]
  do8[si16(do) re(do) re(si)] do8[si16(do) re(do) re(si)]

  %46
  do8[do16(re) mi(re) mi(do)] re8 [re16 mi fa mi fa re]
  mi8 do r4 r2
  R1*3

  %51
  \clef bass la,8[do16 si la8 do,] la[do'16 si la8 do,]
  la[do'16 si la8 do,] la[do'16 si la8 la,]
  mi'[sold16 fad mi8 sold,] mi[mi'16 re mi8 sold,]

  %54
  mi[mi'16 re mi8 sold,] mi[mi'16 re mi8 sold,]
  la[do'16 si do8 do,]\mbreak la16[do mi8 mi mi]
  la mi do la la16[re mi8 mi mi]

  %57
  la mi do la mi'4 mi,
  la r la16[do mi8 mi mi]
  la mi do la la16[do mi8 mi mi]

  %60
  la mi do la mi'4 mi,
  \clef violin la''16 mi mi la la si? do si la mi mi la la si do la
  si mi, mi si' si do re do \mbreak si mi, mi si' si do re si

  %63
  do la la do do re mi re dod sol sol dod dod re mi dod
  re la la re re mi fad mi red la la red red mi fad red
  mi si? si mi mi fad sol fad mi si si mi mi fa? sol mi

  %66
  fa do do fa fa sol la sol fa do do fa fa sol la fa
  mi si si mi mi fa sol mi re la la re re mi fa re
  do sol sol do do re mi do\mbreak sib! sol sol sib sib do re sib

  %69
  la fa fa la la sib do la re sib sib fa fa sib sib re
  do la la fa fa la la do sib sol sol mi mi sol sol sib
  la4 r \clef bass fa,,8[la'16 sol fa8 la,]

  %72
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 fa,] mi[mi'16 re do8 mi,]
  fa[la'16 sol fa8 fa,] mi[mi'16 re do8 mi,]

  %75
  fa[la'16 sol fa8 fa,] do'4 r
  R1
  r2 r4 r8 \clef violin fa''

  %78
  mi16(re) do(sib) la8 sol fa(sol la) sib
  do  sib16 la fa'8 mi16 re re4\tr do
  R1*2

  %82
  r2 r4 r8 do\mbreak
  re16 fa re sib re fa re sib do fa do la do fa do la
  re fa re sib re fa re sib do fa do la do fa do la

  %85
  sib re sib sol sib re sib sol la sib la sol fa4
  R1*4
  r2 r4 r8 do'

  %91
  re16 do re mi mi re mi fa fa mi fa sol sol fa sol la
  la8[sol16 fa sol8 mi] fa[mi16 re do8 sol']
  la[sol16 fa sol8 mi] fa[mi16 re do8 sol']

  %94
  la sol16 fa sol4\tr fa4. sol8
  la sol16 fa sol4\tr fa8[mi16 re do sib la sol]
  \clef bass fa,4 r fa,8[la'16 sol fa8 la,]

  %97
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 fa,] mi mi'16 re do8 mi,
  fa[la'16 sol fa8 fa,] mi mi'16 re do8 mi,

  %100
  fa[la'16 sol fa8 fa,] do'4 re8 mi
  fa8 [la16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]

  %103
  fa'16[la do8 do do] fa do la fa
  fa16[la do8 do do] fa do la fa
  do'4 do,4 fa, r

  %106
  fa'16[la do8 do do] fa do la fa
  fa16[la do8 do do] fa do la fa
  do'4 do, fa4\fermata r

}

Ibcn = \relative do {

  fa8 [la16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 fa,] mi mi'16 re do8 mi,

  %4
  fa[la'16 sol fa8 fa,] mi mi'16 re do8 mi,
  fa[la'16 sol fa8 fa,] do'4 re8 mi
  fa8 [la16 sol fa8 la,] fa[la'16 sol fa8 la,]

  %7
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa'16[la do8 do do] fa do la fa
  fa16[la do8 do do] fa do la fa

  %10
  do'4 do,4 fa, r
  fa'16[la do8 do do] fa do la fa
  fa16[la do8 do do] fa do la fa

  %13
  do'4 do, fa8 sol la fa
  do4. do8 fa mi fa sol
  la4. sib8\mbreak fa sol la fa

  %16
  do4. do8 fa mi fa sol
  la4. sib8 fa sol la fa
  sib,4 sib fa' fa

  %19
  sib, sib fa' fa
  sol mi fa8 sol la fa
  sib,4 sib fa' fa

  %22
  sib, sib fa' fa
  sol mi fa8 sol la fa
  sib,4 do\mbreak re mi

  %25
  fa4 mi8 do fa4. mi8
  fa la, sib do fa sol la fa
  sib,4 do re mi

  %28
  fa mi8 do fa4. mi8
  fa la, sib do fa,[la'16 sol fa8 la,]
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]

  %31
  fa[la'16 sol fa8 fa,] do[mi'16 re do8 mi,]
  do[do'16 sib do8 mi,] do[do'16 sib do8 mi,]
  \once\stemUp do[\once \stemDown do''16 sib do8 do,] si[si'16 la sol8 si,]\mbreak

  %34
  sol[si'16 la sol8 si,] sol[si'16 la sol8 si,]
  sol[si'16 la sol8 si,] do16[mi sol8 sol sol]
  do sol mi do do16[re sol8 sol sol]

  %37
  do sol mi do sol'4 sol,
  do r do16[mi sol8 sol sol]
  do sol mi do do16[mi sol8 sol sol]

  %40
  do sol mi do sol'4 sol,
  do8 re mi re do4 sol'8 sol,
  do4 sol'8 sol,\mbreak do4 sol'8 sol,

  %43
  do4 r si r
  do8 re mi re do4 sol'8 sol,
  do4 sol'8 sol, do4 sol'8 sol,

  %46
  do4 r si r
  mi8 mi mi mi la, la la la
  re re re re sol, sol sol sol

  %49
  do do do do fa, fa fa fa\mbreak
  mi'8 re do si la la' mi mi,
  la'[do16 si la8 do,] la[do'16 si la8 do,]

  %52
  la[do'16 si la8 do,] la[do'16 si la8 la,]
  mi'[sold16 fad mi8 sold,] mi[mi'16 re mi8 sold,]
  mi[mi'16 re mi8 sold,] mi[mi'16 re mi8 sold,]

  %55
  la[do'16 si do8 do,]\mbreak la16[do mi8 mi mi]
  la mi do la la16[re mi8 mi mi]
  la mi do la mi'4 mi,

  %58
  la r la16[do mi8 mi mi]
  la mi do la la16[do mi8 mi mi]
  la mi do la mi'4 mi,

  %61
  la8 la la la la la la la
  sold sold sold sold\mbreak sold sold sold sold
  la la la la la' la sol? sol

  %64
  fad fad fad fad si si la la
  sol sol sol sol sol sol sol sol
  la la la la la la la la

  %67
  sol sol sol sol fa fa fa fa
  mi mi mi mi\mbreak sol [sol] mi mi
  fa fa fa fa fa fa fa fa

  %70
  fa fa fa fa sol sol do, [do]
  fa[la16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]

  %73
  fa[la'16 sol fa8 fa,] mi[mi'16 re do8 mi,]
  fa[la'16 sol fa8 fa,] mi[mi'16 re do8 mi,]
  fa[la'16 sol fa8 fa,] do' do' la fa

  %76
  do4. do8 fa mi fa sol
  la4. sib8 fa sol la fa
  do4. do8 fa mi fa sol

  %79
  la4. sib8 fa sol la fa
  sib,4 sib fa' fa
  sib, sib fa' fa

  %82
  sol mi fa8 sol la fa\mbreak
  sib,4 sib fa' fa
  sib, sib fa' fa

  %85
  sol mi fa8 sol la fa
  sib,4 do re mi
  fa mi8 do fa4 mi8 do

  %88
  fa4 mi8 do fa4 mi8 do
  fa4 do fa8 sol la mi
  fa4 do\mbreak fa8 sol la fa

  %91
  sib,4 do re mi
  fa mi8 do fa4 mi8 do
  fa4 mi8 do fa4 mi8 do

  %94
  fa4 do fa8 sol la mi
  fa4 do fa r
  fa8[la16 sol fa8 la,] fa[la'16 sol fa8 la,]

  %97
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 fa,] mi mi'16 re do8 mi,
  fa[la'16 sol fa8 fa,] mi mi'16 re do8 mi,

  %100
  fa[la'16 sol fa8 fa,] do'4 re8 mi
  fa8 [la16 sol fa8 la,] fa[la'16 sol fa8 la,]
  fa[la'16 sol fa8 la,] fa[la'16 sol fa8 la,]

  %103
  fa'16[la do8 do do] fa do la fa
  fa16[la do8 do do] fa do la fa
  do'4 do,4 fa, r

  %106
  fa'16[la do8 do do] fa do la fa
  fa16[la do8 do do] fa do la fa
  do'4 do, fa\fermata r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 55
  s1*108
  \bar"|."


}

Ivl = {
  \Iglobal
  \notypeset
  <<\Ivln \forma>>

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
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIvln = \relative do' {

  do,16 re
  mi8 fa16 sol la8 sol si(do) r si16 do
  re do si la sol si re fa, mi8. re16 do4
  R1

  %4
  r2 r4 r8 mi16 fa
  sol si do8~do16 sol fa mi fa do' re8~re16 la sol fad
  sol re' mi8~mi16 si la sol\mbreak la mi' fa8~fa16 mi re do

  %7
  do8\tr si r4 r2
  R1*2
  si16 la si la si re do si la8 la la la

  %11
  do16 si do si do mi re do si8 si si si
  \con\tupletSpan 8 \tuplet 3/2 {
    si16 (re do si[do re)] \senza re, (fa mi re[mi fa)] mi mi' re do[re mi] mi,[sol fad] mi fad sol
    fad[fad' mi] re mi fad fad,[la sol] fad[sol la] sol la si si[do re] re mi fad fad[mi re]

    %14
    sol fad? mi
  } re [sol,] la8.\tr sol16 sol4 r
  R1*2
  r4 r8 sol16 la si8 do r fad,16 sol

  %18
  la8 si r mi,16 fad sol8 la r sol
  sol\tr fad r16 do' re do si8 si si si
  do sol do4~do8[sib16 la sib8 sib]

  %21
  sib? la re4~\mbreak re8[do16 si? do8 do]
  do\tr si r16 si do si do do re do re re  mi re
  mi mi fa mi fa fa sol fa si,4. re8

  %24
  mi re16 do si8.\tr do16 do4 r8 fa
  sol fa16 mi re8.\tr do16 do2\fermata

}

IIvcn = \relative do'' {

  r8
  R1
  r2 r4 r8 do,16 re
  mi8 fa16 sol la8 sol si(do) r si16 do

  %4
  re do si la sol si re fa, mi8. re16 do4
  R1*2
  r4 r8 mi16 fa sol si do8~do16 sol fa mi

  %8
  fa do' re8~re16 la sol fad sol re' mi8~mi16 si la sol
  la mi' fa8~fa16 mi re do do8\tr si r4
  sol'16 fad sol fad sol8 sol fad fad fad fad

  %11
  la16 sol la sol la8 la sol sol sol sol
  R1*2
  r2 \senza \tuplet 3/2 {
    si,16 re do si[do re] re, fa mi re[mi fa]

    %15
    mi mi' re do[re mi] mi,[sol fad] mi fad sol fad[fad' mi] re mi fad fad,[la sol] fad[sol la]
    sol la si si[do re] re mi fad fad[mi re] sol fad? mi
  } re [sol,] la8.\tr sol16
  sol4 r8 si16 do re8 mi r la,16 si

  %18
  do8 re r sol,16 la si8 do r si
  si\tr la r16 la si la sol8 sol fa? fa
  mi4 r8 mi fa4. sol8

  %21
  do,4 r8 fa\mbreak sol4. la8
  re,4 r16 sol la sol la la si la si si do si
  do do re do re re mi re re4. si8

  %24
  do16 sol' fa mi re8. do16 do4 r8 re
  mi re16 do si8.\tr do16 do2\fermata

}

IIbcn = \relative do {

  do8
  do mi fa mi re do si'[la]
  sol re si sol do re mi do
  do mi fa mi re do si'[la]

  %4
  sol re si sol do re mi re
  do re mi do re mi fad re
  mi fa? sol mi\mbreak fa sol la fa

  %7
  sol fa mi re do re mi do
  re mi fad re mi fa? sol mi
  fa sol la fa sol fa sol sol,

  %10
  sol4 r re'8 mi fad re
  re4 r sol8 la si la
  sol4 si,\mbreak do do

  %13
  re re mi re8 do
  si sol re'[re,] sol4 si
  do do re re\mbreak

  %16
  mi4 re8 do si sol re'[re,]
  sol sol' sol,4 r8 do' re,4
  r8 si' do,4 r8 la' sol sol,

  %19
  re' mi fad re sol4 sol,
  do8 re mi do re4. mi8
  fa sol la fa\mbreak mi4. fad8

  %22
  sol fad sol sol, r2
  r sol'8 fa? sol sol,
  do fa sol sol, do do' si sol

  %25
  do, fa sol sol, do2\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 4/4
  \tempo 4 = 35
  \partial 8 s8
  s1*25
  \bar"|."


}

IIvl = {
  \IIglobal
  \notypeset
  \clef tenor
  <<\IIvln \forma>>

}

IIvc = {
  \IIglobal
  \clef violin
  <<\IIvcn \forma>>

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

IIIvln = \relative do'' {

  fa,4 r8 fa mi do
  fa4 r8 fa mi do
  fa4 r8 do' la fa

  %4
  sol4 r8 sib sol mi
  fa4 r8 do' la fa
  sol4 r8 sib sol mi

  %7
  fa2 r4
  do'8 la fa' do la' do,  %%%%% ripresa
  re4 re re

  %10
  re8 sib sol' re sib' re,
  mi4 mi mi
  mi8 do la' mi do' mi,

  %13
  fa4 fa fa
  fa8 re sib' fa re' fa,\mbreak
  mi do sol' mi sib' sol

  %16
  mi4 r8 do mi, do
  mi' do sol' mi sib' sol
  mi4 r8 do mi, do

  %19
  mi' do sol' mi sib' sol
  la4 r8 do, la fa
  sib,4 r8 re' sib sol

  %22
  do,4 r8 mi' do la
  re,4 r8 fa' re sib
  mi, fa sib,4 do   %% fine ripresa

  %25
  \clef tenor r16 fa mi re do re do sib la sib la sol
  fa la do fa fa, la do fa fa, la do fa
  fa, fa' mi re do re do sib la sib la sol

  %28
  fa la do fa fa, la do fa fa, la do fa
  fa,2.\tr~
  fa~

  %31
  fa~
  \once \tieDown fa~
  fa16 do' do fa fa do do la la do do fa

  %34
  re2.~
  re16 re re sol sol re re si si re re sol\mbreak
  mi2.~

  %37
  mi16 mi mi la la mi mi dod dod mi mi la
  fa sol fa sol fa sol fa sol fa sol fa sol
  mi fa mi fa mi fa mi fa mi fa mi fa

  %40
  re mi re mi  re mi re mi  re mi re mi
  dod mi dod la dod mi dod la dod mi dod la
  re fa re la re fa re la re fa re la

  %43
  dod mi dod la dod mi dod la dod mi dod la
  re fa re la re fa re la re fa re la\mbreak
  mi'8 fa16 sol mi8 fa16 sol mi8 fa16 sol

  %46
  fa8 re dod4. re8
  re4 \clef violin r8 re' dod la
  re4 r8 re, dod la

  %49
  re4 r8 re' dod la
  re4 r8 re, dod la
  re' la fa' re la' la,

  %52
  sib4 sib sib
  do8 sol mi' do sol' sol,
  la4 la la

  %55
  sib8 fa re' sib fa' fa,
  sol4 sol sol
  la8 mi dod' la mi' mi,

  %58
  fa re la' fa re' la\mbreak
  mi'4 r8 la, dod, la
  fa' re la' fa re' la

  %61
  mi'4 r8 la, dod, la
  re sol la4 la,
  \clef tenor re,16 fa mi re la' fa mi re la' fa mi re

  %64
  re'8 la fa la re la
  re,4 r r
  R2.

  %67
  re16 fa mi re la' fa mi re re'8 la
  sib sib sib sib sib4\tr
  do,16 mi re do sol' mi re do do'8 sol

  %70
  la la la la la4\tr
  sib16 re do sib fa re' do sib fa re' do sib\mbreak
  mi, sold fad mi si' sold fad mi mi' re do si

  %73
  do mi do la do mi do la do mi do la
  re fa re la re fa re la re fa re la
  do mi do la do mi do la do mi do la

  %76
  re fa re la re fa re la re fa re la
  do8 re si4.\tr la8
  \clef violin do' la mi' do la' mi

  %79
  si'4 r8 si, sold mi
  do' la mi' do la' mi
  si'4 r8 si, sold mi

  %82
  la re mi4 mi,
  \clef tenor la,16 [mi fa mi fa mi fa mi fa mi fa mi]\mbreak
  si'[mi, fa mi fa mi fa mi fa mi fa mi]

  %85
  do'[mi, fa mi fa mi fa mi fa mi fa mi]
  re'[mi, fa mi fa mi fa mi fa mi fa mi]
  do'4 la r

  %88
  la'16[la, si la si la si la si la si la]
  fa'[re fa re fa re fa re fa re fa re]
  sol[sol, la sol la sol la sol la sol la sol]

  %91
  mi'[do mi do mi do mi do mi do mi do]
  fa[fa, sol fa sol fa sol fa sol fa sol fa]
  re' si re si re si re si re si re si

  %94
  mi do si do mi do si do mi do si do\mbreak
  re4 do si
  do r r

  %97
  R2.*4
  \clef violin mi'8 do sol' mi do' sol
  la4 la la

  %103
  mi8 do sol' mi sib' sol
  la4 la la
  re,8 sib fa' re sib' fa\mbreak

  %106
  mi do sol' mi sib' sol
  mi4 r8 do mi, do
  mi' do sol' mi sib' sol

  %109
  mi4 r8 do mi, do
  fa16\clef tenor fa mi re do re do sib la sib la sol
  fa4 r r

  %112
  la16 sib do sib la sib do sib la do sib la
  sib do re do sib do re do sib re do sib\mbreak
  do re mi re do re mi re do mi re do

  %115
  re mi fa mi re mi fa mi re fa mi re
  mi fa sol fa mi fa sol fa mi sol fa mi
  fa4 r16 fa, la do fa fa, la do

  %118
  fa4 r16 fa, la do fa fa, la do
  fa8 fa, sol4. fa8
  fa4\clef violin  r r\mbreak

  %121
  R2.*7
  do''8 la fa' do la' do,  %%%%% ripresa
  re4 re re

  %130
  re8 sib sol' re sib' re,
  mi4 mi mi
  mi8 do la' mi do' mi,

  %133
  fa4 fa fa
  fa8 re sib' fa re' fa,\mbreak
  mi do sol' mi sib' sol

  %136
  mi4 r8 do mi, do
  mi' do sol' mi sib' sol
  mi4 r8 do mi, do

  %139
  mi' do sol' mi sib' sol
  la4 r8 do, la fa
  sib,4 r8 re' sib sol

  %142
  do,4 r8 mi' do la
  re,4 r8 fa' re sib
  mi, fa sib,4 do

  %145
  fa4\fermata r r

}

IIIvlIn =  \relative do'' {

  fa,4 r8 fa mi do
  fa4 r8 fa mi do
  fa4 r8 do' la fa

  %4
  sol4 r8 sib sol mi
  fa4 r8 do' la fa
  sol4 r8 sib sol mi

  %7
  fa2 r4
  do'8 la fa' do la' do,  %%%%% ripresa
  re4 re re

  %10
  re8 sib sol' re sib' re,
  mi4 mi mi
  mi8 do la' mi do' mi,

  %13
  fa4 fa fa
  fa8 re sib' fa re' fa,\mbreak
  mi do sol' mi sib' sol

  %16
  mi4 r8 do mi, do
  mi' do sol' mi sib' sol
  mi4 r8 do mi, do

  %19
  mi' do sol' mi sib' sol
  la4 r8 do, la fa
  sib,4 r8 re' sib sol

  %22
  do,4 r8 mi' do la
  re,4 r8 fa' re sib
  mi, fa sib,4 do   %% fine ripresa

  %25
  fa r r
  R2.*21
  re'4 r8 re dod la
  re4 r8 re, dod la

  %49
  re4 r8 re' dod la
  re4 r8 re, dod la
  re' la fa' re la' la,

  %52
  sib4 sib sib
  do8 sol mi' do sol' sol,
  la4 la la

  %55
  sib8 fa re' sib fa' fa,
  sol4 sol sol
  la8 mi dod' la mi' mi,

  %58
  fa re la' fa re' la\mbreak
  mi'4 r8 la, dod, la
  fa' re la' fa re' la

  %61
  mi'4 r8 la, dod, la
  re sol la4 la,
  re r r
  R2.*14
  do'8 la mi' do la' mi

  %79
  si'4 r8 si, sold mi
  do' la mi' do la' mi
  si'4 r8 si, sold mi

  %82
  la re mi4 mi,
  mi'4 r r
  R2.*17
  mi8 do sol' mi do' sol
  la4 la la

  %103
  mi8 do sol' mi sib' sol
  la4 la la
  re,8 sib fa' re sib' fa\mbreak

  %106
  mi do sol' mi sib' sol
  mi4 r8 do mi, do
  mi' do sol' mi sib' sol

  %109
  mi4 r8 do mi, do
  fa4 r r
  R2.*17

  %128
  do'8 la fa' do la' do,  %%%%% ripresa
  re4 re re
  re8 sib sol' re sib' re,

  %131
  mi4 mi mi
  mi8 do la' mi do' mi,
  fa4 fa fa

  %134
  fa8 re sib' fa re' fa,\mbreak
  mi do sol' mi sib' sol
  mi4 r8 do mi, do

  %137
  mi' do sol' mi sib' sol
  mi4 r8 do mi, do
  mi' do sol' mi sib' sol

  %140
  la4 r8 do, la fa
  sib,4 r8 re' sib sol
  do,4 r8 mi' do la

  %143
  re,4 r8 fa' re sib
  mi, fa sib,4 do
  fa\fermata r r

}

IIIvlIIn = \relative do'' {

  fa,4 r8 fa mi do
  fa4 r8 fa mi do
  fa4 r8 do' la fa

  %4
  sol4 r8 sib sol mi
  fa4 r8 do' la fa
  sol4 r8 sib sol mi

  %7
  fa2 r4
  R2.
  fa8 re sib' fa re' fa,

  %10
  sol4 sol sol
  sol8 mi do' sol mi' sol,
  la4 la la

  %13
  la8 fa re' la fa' la,
  sib4 sib sib\mbreak
  do8 sol mi' do sol' mi

  %16
  sib'4 r8 do, mi, do
  do' sol mi' do sol' mi
  sib'4 r8 do, mi, do

  %19
  do' sol mi' do sol' mi
  fa4 r8 do la fa
  sib,4 r8 re' sib sol

  %22
  do,4 r8 mi' do la
  re,4 r8 fa' re sib
  mi, fa sib,4 do   %% fine ripresa

  %25
  fa r r
  R2.*21re'4 r8 re dod la
  re4 r8 re, dod la

  %49
  re4 r8 re' dod la
  re4 r8 re, dod la
  re4 r r

  %52
  sol8 re sib' sol re' re,
  mi4 mi mi
  fa8 do la' fa do' do,

  %55
  re4 re re
  mi8 si sol' mi si' si,
  dod4 dod dod

  %58
  re8 la fa' re la' fa\mbreak %% fine p. 12 ms. OK
  dod'4 r8 la dod, la
  re la fa' re la' fa

  %61
  dod'4 r8 la dod, la
  re sol la4 la,
  re r r

  %64
  R2.*14
  la'8 mi do' la mi' do
  sold'4 r8 si, sold mi

  %80
  la mi do' la mi' do
  sold'4 r8 si, sold mi
  la re mi4 mi,

  %83
  la4 r r
  R2.*18
  la8 fa do' la fa' do

  %103
  do4 do do
  la8 fa do' la mib' do
  sib4 sib sib\mbreak

  %106
  sol8 sol mi' do sol' mi
  sib'4 r8 do, mi, do
  do' sol mi'[do sol' mi]

  %109
  sib'4 r8 do, mi, do
  fa4 r r
  R2.*18

  %129
  fa8 re sib' fa re' fa,
  sol4 sol sol
  sol8 mi do' sol mi' sol,

  %132
  la4 la la
  la8 fa re' la fa' la,
  sib4 sib sib\mbreak

  %135
  do8 sol mi' do sol' mi
  sib'4 r8 do, mi, do
  do' sol mi' do sol' mi

  %138
  sib'4 r8 do, mi, do
  do' sol mi' do sol' mi
  fa4 r8 do la fa

  %141
  sib,4 r8 re' sib sol
  do,4 r8 mi' do la
  re,4 r8 fa' re sib

  %144
  mi, fa sib,4 do
  fa\fermata r r

}

IIIvlan =  \relative do' {

  fa4 r8 fa mi do
  fa4 r8 fa mi do
  fa4 r8 do' la fa

  %4
  sol4 r8 sib sol mi
  fa4 r8 do' la fa
  sol4 r8 sib sol mi

  %7
  fa2 r4
  do4 r8 do do do
  fa,4 r8 fa' fa fa

  %10
  re4 r8 re re re
  sol,4 r8 sol sol sol
  mi'4 r8 mi mi mi

  %13
  la,4 r8 la la la
  fa'4 r8 fa fa fa\mbreak
  sol4 sol sol

  %16
  sol r8 do mi, do
  sol'4 sol sol
  sol r8 do mi, do

  %19
  sol'4 sol mi
  do r8 do' la fa
  sib,4 r8 re' sib sol

  %22
  do,4 r8 mi' do la
  re,4 r8 fa' re sib
  mi, fa sib,4 do

  %25
  fa4 r r%%%5 fine ripresa
  R2.*21
  re4 r8 re' dod la

  %48
  re4 r8 re, dod la
  re4 r8 re' dod la
  re4 r8 re, dod la

  %51
  re4 r8 fa fa fa
  re4 r8 re re sib
  sol4 r8 mi' mi mi

  %54
  do4 r8 do do la
  fa4 r8 re' re re
  si4 r8 si si sol

  %57
  mi4 r8 dod' dod dod
  la4 r8 la la la\mbreak
  la4 r8 la' dod, la

  %60
  la4 r8 la la la
  la4 r8 la' dod, la
  re sol la4 la,

  %63
  re r r
  R2.*14
  mi4 r8 mi mi mi

  %79
  mi4 r8 si' sold mi
  mi4 r8 mi mi mi
  mi4 r8 si' sold mi

  %82
  la re mi4 mi,
  la, r r\mbreak %%% fine p. 13
  R2.*17

  %101
  sol'4. sol8 sol mi
  do4 r8 do' do la
  sol4 r8 sol sol mi

  %104
  do4 r8 do' do la
  fa4 r8 fa fa re\mbreak
  mi4 r8 mi mi mi

  %107
  sol4 r8 do mi, do
  sol'4 sol sol
  sol r8 do mi, re

  %110
  fa4 r r
  R2.*17
  do4 r8 do do do

  %129
  fa,4 r8 fa' fa fa
  re4 r8 re re re
  sol,4 r8 sol sol sol

  %132
  mi'4 r8 mi mi mi
  la,4 r8 la la la
  fa'4 r8 fa fa fa\mbreak

  %135
  sol4 sol sol
  sol r8 do mi, do
  sol'4 sol sol

  %138
  sol r8 do mi, do
  sol'4 sol mi
  do r8 do' la fa

  %141
  sib,4 r8 re' sib sol
  do,4 r8 mi' do la
  re,4 r8 fa' re sib

  %144
  mi, fa sib,4 do
  fa4\fermata r r

}

IIIvcn = \relative do {

  fa4 r8 fa mi do
  fa4 r8 fa mi do
  fa4 r8 do' la fa

  %4
  sol4 r8 sib sol mi
  fa4 r8 do' la fa
  sol4 r8 sib sol mi

  %7
  fa2 r4
  fa r8 la, fa' la,  %%% inizio ripresa
  sib4 r8 sib re sib

  %10
  sib4 r8 sib sol' sib,
  do4 r8 do  mi do
  do4 r8 do la' do,

  %13
  re4 r8 re fa re
  re4 r8 re sib' re,\mbreak
  do4 do do

  %16
  do r8 do' mi, do
  do4 do do
  do r8 do' mi, do

  %19
  do4 do do
  fa r8 do' la fa
  sib,4 r8 re' sib sol

  %22
  do,4 r8 mi' do la
  re,4 r8 fa' re sib
  mi, fa sib,4 do

  %25
  fa4 r r%%%5 fine ripresa
  R2.*3
  \clef violin r16 fa'' mi re do re do sib la sib la sol

  %30
  fa la do fa fa, la do fa fa, la do fa
  fa, fa' mi re do re do sib la sib la sol
  fa la do fa fa, la do fa fa, la do fa

  %33
  fa,2.~
  fa16 fa fa sib sib fa fa re re fa fa sib
  sol2.~\mbreak

  %36
  sol16 sol sol do do sol sol mi mi sol sol do
  la dod dod mi mi dod dod la la dod dod mi
  re mi re mi re mi re mi re mi re mi

  %39
  dod re dod re dod re dod re do re do re
  si do si do si do si do sib do sib do
  la dod la mi la dod la mi la dod la mi

  %42
  la re la fa la re la fa la re la fa
  la dod la mi la dod la mi la dod la mi
  la re la fa la re la fa la re la fa\mbreak

  %45
  dod'8 re16 mi dod8 re16 mi dod8 re16 mi
  re8 fa mi4. re8
  re4\clef bass r8 re, dod la

  %48
  re4 r8 re, dod la
  re4 r8 re' dod la
  re4 r8 re, dod la

  %51
  re4 r8 re fa re
  sol,4 r8 sol sib sol
  do4 r8 do mi do

  %54
  fa,4 r8 fa la fa
  sib4 r8 sib re sib
  mi,4 r8 mi sol mi

  %57
  la4 r8 la dod la
  re4 r8 re fa re\mbreak
  dod4 r8 la' dod, la

  %60
  re4 r8 re fa re
  dod4 r8 la' dod, la
  re sol la4 la,

  %63
  re4 r r
  R2.
  \clef violin re'16 fa mi re la' fa mi re la' fa mi re

  %66
  re'8 la fa la re la
  re,4 r r
  sol16 sib la sol re' sib la sol sol'8 re

  %69
  mi mi mi mi mi4\tr
  fa,16 la sol fa do' la sol fa fa'8 do
  re re re re re4\tr\mbreak

  %72
  si16 re do si mi si la sold si8 sold
  la16 do la mi la do la mi la do la mi
  la re la fa la re la fa la re la fa

  %75
  la do la mi la do la mi la do la mi
  la re la fa la re la fa la re la fa
  la8 si sold4.\tr la8

  %78
  la4\clef bass r8 la,, do la
  mi'4 r8 si' sold mi
  la,4 r8 la do la

  %81
  mi'4 r8 si' sold mi
  la re mi4 mi,
  la, r r

  %84
  R2.*12
  \clef violin mi'''16 do mi do mi do mi do mi do mi do
  fa fa, sol fa sol fa sol fa sol fa sol fa

  %98
  re' si re si re si re si re si re si
  mi do si do mi do si do mi do si do
  re4 (do) si

  %101
  \clef bass do,,4 r8 do mi do
  fa4 r8 fa la fa
  do4 r8 do mi do

  %104
  fa4 r8 fa do' fa,
  sib,4 r8 sib re sib\mbreak
  do4 r8 do do' do,

  %107
  do4 r8 do' mi, do
  do4 do do
  do r8 do' mi, do

  %110
  fa4 r r
  \clef violin r16 fa'' mi re do re do sib la sib la sol
  fa4 r r

  %113
  \clef bass sol, r r\mbreak
  la r r
  sib r r

  %116
  do r r
  fa,8 fa' fa,4 r
  r8 fa' fa,4 r

  %119
  r8 fa do'4 do,
  \clef violin la''16 sib do sib la sib do sib la do sib la\mbreak
  sib do re do sib do re do sib re do sib

  %122
  do re mi re do re mi re do mi re do
  re mi fa mi re mi fa mi re fa mi re
  mi fa sol fa mi fa sol fa mi sol fa mi

  %125
  fa4 r16 fa, la do fa fa, la do
  fa4 r16 fa, la do fa fa, la do
  fa8 fa, sol4. fa8\mbreak

  %128
  fa4 \clef bass r8 la,, fa' la,  %%% inizio ripresa
  sib4 r8 sib re sib
  sib4 r8 sib sol' sib,

  %131
  do4 r8 do  mi do
  do4 r8 do la' do,
  re4 r8 re fa re

  %134
  re4 r8 re sib' re,\mbreak
  do4 do do
  do r8 do' mi, do

  %137
  do4 do do
  do r8 do' mi, do
  do4 do do

  %140
  fa r8 do' la fa
  sib,4 r8 re' sib sol
  do,4 r8 mi' do la

  %143
  re,4 r8 fa' re sib
  mi, fa sib,4 do
  fa4\fermata r r

}

IIIbcn = \relative do {

  fa4 r8 fa mi do
  fa4 r8 fa mi do
  fa4 r8 do' la fa

  %4
  sol4 r8 sib sol mi
  fa4 r8 do' la fa
  sol4 r8 sib sol mi

  %7
  fa2 r4
  fa r8 la, fa' la,  %%% inizio ripresa
  sib4 r8 sib re sib

  %10
  sib4 r8 sib sol' sib,
  do4 r8 do  mi do
  do4 r8 do la' do,

  %13
  re4 r8 re fa re
  re4 r8 re sib' re,\mbreak
  do4 do do

  %16
  do r8 do' mi, do
  do4 do do
  do r8 do' mi, do

  %19
  do4 do do
  fa r8 do' la fa
  sib,4 r8 re' sib sol

  %22
  do,4 r8 mi' do la
  re,4 r8 fa' re sib
  mi, fa sib,4 do

  %25
  fa2.~ %%%5 fine ripresa
  fa~
  fa~\mbreak

  %28
  fa~
  fa~
  fa~

  %31
  fa~
  fa~
  fa

  %34
  sib,
  si\mbreak
  do

  %37
  dod
  re2 r4
  R2.*2

  %41
  la2.~
  la~
  la~

  %44
  la~\mbreak
  la
  re4 la' la,

  %47
  re r8 re' dod la
  re4 r8 re, dod la
  re4 r8 re' dod la

  %50
  re4 r8 re, dod la
  re4 r8 re fa re
  sol,4 r8 sol sib sol

  %53
  do4 r8 do mi do
  fa,4 r8 fa la fa
  sib4 r8 sib re sib

  %56
  mi,4 r8 mi sol mi
  la4 r8 la dod la
  re4 r8 re fa re\mbreak

  %59
  dod4 r8 la' dod, la
  re4 r8 re fa re
  dod4 r8 la' dod, la

  %62
  re sol la4 la,
  re4 r r
  re r r

  %65
  re r r
  re r r
  re2 fad4

  %68
  sol sol,2
  do'4 do,2
  fa4 fa,2

  %71
  sib'4 sib,2\mbreak
  sold4 mi2
  la2.~

  %74
  la~
  la~
  la~

  %77
  la8 re mi4 mi,
  la r8 la do la
  mi'4 r8 si' sold mi

  %80
  la,4 r8 la do la
  mi'4 r8 si' sold mi
  la re mi4 mi,

  %83
  la, la'2~\mbreak
  la4 sold2
  la4 la,2~

  %86
  la4 sold2
  la8 si do re do si
  la4 dod2

  %89
  re4 re' re,
  si2.
  do4 do' do,

  %92
  la2.
  si4 si' si,
  do do' do,\mbreak

  %95
  fa sol sol,
  do do' do,
  la2.

  %98
  si4 si' si,
  do do' do,
  fa sol sol,

  %101
  do4 r8 do mi do
  fa4 r8 fa la fa
  do4 r8 do mi do

  %104
  fa4 r8 fa do' fa,
  sib,4 r8 sib re sib\mbreak
  do4 r8 do do' do,

  %107
  do4 r8 do' mi, do
  do4 do do
  do r8 do' mi, do

  %110
  fa4 r r
  fa r r
  fa r r

  %113
  sol r r\mbreak
  la r r
  sib r r

  %116
  do r r
  fa,8 fa' fa,4 r
  r8 fa' fa,4 r

  %119
  r8 fa do'4 do,
  fa r r\mbreak
  sol r r

  %122
  la r r
  sib r r
  do r r

  %125
  fa,8 fa' fa,4 r
  r8 fa' fa,4 r
  fa do do,\mbreak

  %128
  fa'4 r8 la, fa' la,  %%% inizio ripresa
  sib4 r8 sib re sib
  sib4 r8 sib sol' sib,

  %131
  do4 r8 do  mi do
  do4 r8 do la' do,
  re4 r8 re fa re

  %134
  re4 r8 re sib' re,\mbreak
  do4 do do
  do r8 do' mi, do

  %137
  do4 do do
  do r8 do' mi, do
  do4 do do

  %140
  fa r8 do' la fa
  sib,4 r8 re' sib sol
  do,4 r8 mi' do la

  %143
  re,4 r8 fa' re sib
  mi, fa sib,4 do
  fa4\fermata r r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 65
  s2.*145
  \bar"|."


}

IIIvl = {
  \IIIglobal
  %\notypeset
  <<\IIIvln \forma>>

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

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #3

  }

  \markup\huge "[1.] All[egr]o"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
      } <<


        \new Staff  <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"principale"}
          \Ivl
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"\vspace #-0.2"di Ripieno"}
          \IvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"\vspace #-0.2"di Ripieno"}
          \IvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"[Viola]"}
          \Ivla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"Violoncello"}
          \Ivc
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"contrabass"
          \set Staff.instrumentName = \markup \center-column{"[Basso]"}
          \Ibc

        >>
      >>

    }

    \layout {

      indent = 1.7\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

  \paper  {

    systems-per-page = #6

  }

  \markup\huge "[2.] Largo"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
      } <<


        \new Staff  <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"Violino"}
          \IIvl
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violoncello"}
          \IIvc
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"harpsichord"
          \set Staff.instrumentName = \markup \center-column{"[Basso]"}
          \IIbc

        >>
      >>

    }

    \layout {

      indent = 1.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}


\bookpart {

  \paper  {

    systems-per-page = #3

  }

  \markup\huge "[3.] [Allegro]"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
      } <<


        \new Staff  <<
          \set Staff.midiInstrument = #"violin"
          \IIIvl
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
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \IIIvc
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"contrabass"
          \IIIbc

        >>
      >>
    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #6
        \override BarLine #'hair-thickness = #1.2
        \override SpacingSpanner.uniform-stretching = ##t
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

}



