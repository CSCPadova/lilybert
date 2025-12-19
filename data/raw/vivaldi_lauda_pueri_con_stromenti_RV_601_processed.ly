\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

tasto =_\markup\italic "T.S."

solo = ^\markup \italic { Solo }

dolce =_\markup\italic"Doux"

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.6

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

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



mbreak = { }


Iglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

Ivln = \relative do'' {

  re16
  re4 sol8. la16
  sol4 fad8. sol16
  la8 do,16. re32 la8 si16. do32

  %4
  do4(si8.) sol'16
  la8 do,16. re32 la8 si16. do32
  do4(si16.) sol'32 la16. si32

  %7
  si,8[r16 si dod8 r16 re]
  dod8 la' r16 mi fad16. sol32
  fad8 la r16 mi fad16. sol32

  %10
  fad8 la, r16 mi fad16. sol32\mbreak
  fad8 la r16 mi fad16. sol32
  fad8 re'16. mi32 mi4\tr

  %13
  re r8 r16 re
  re4 sol8. la16
  sol4(fa16.) mi32 fa16. sol32

  %16
  mi8 [do do,] r16 mi'
  mi4 la8. si16
  la4(sol16.) fad32 sol16. la32

  %19
  fad8[re re, re'16. mi32]
  re4(do8) do16. re32
  do4(si8) re16. mi32

  %22
  re4(do8) do16. re32\mbreak %% fine prima pagina
  do4(si8) sol'
  la16.[sol32 fad16. mi32 re16. do32 si16. la32]

  %25
  si8 la16. sol32 la4\tr
  sol r
  R2*5

  %32
  r4 r8 r16 re'\mbreak
  re4 sol8. la16
  sol4(fad8.) sol16

  %35
  la8 do,16 re la8 si16 do
  do4(si8) re\p
  mi16 mi fad mi mi mi fad mi

  %38
  la2
  re,16 re mi re re re mi re
  sol2
  do,16 do re do do do re do

  %42
  fad2
  sol4 r8 re16.\f mi32\mbreak
  re4(do8) do16. re32

  %45
  \appoggiatura do8 si\p[sol si sol]
  dod[la dod la]
  re[si re si]

  %48
  mi[dod mi dod]
  fad[re fad re]
  sol16[la sol fad  mi re dod si]

  %51
  la\p la si la la la si la
  la la si la la la si la
  re16\f[re, mi fad sol la si dod]\mbreak

  %54
  re la si dod re mi fad sol
  la8 re, mi8.\tr la,16
  la4 re8. mi16

  %57
  dod8 la' r16 mi fad16. sol32
  fad8 la r16 mi fad16. sol32
  fad8 la, r16 mi fad16. sol32

  %60
  fad8 la r16 mi fad16. sol32
  fad8 re'16. mi32 mi8.\tr re16
  re4 r

  %63
  R2*4
  r4 r8 r16 mi
  mi4 la8. si16

  %69
  la4(sold8.) la16
  si8 re,16. mi32 si8 do16. re32
  do8[do\p do do]

  %72
  fa[fa fa fa]
  fa?[fa fa fa]
  si,[si si si]

  %75
  re[re re re]\mbreak
  do do do16 la do mi
  fa[sol la sol fa mi re do]

  %78
  si sol si re si sol si re
  mi[fa sol fa mi re do si]
  la fa la do la fa la do

  %81
  re[mi fa mi re do si la]
  sold8 fad!16 mi re'8 do16 si
  do si la8 r la

  %84
  la16 la si la la la si la
  mi' la, si la la la si la\mbreak
  fa' la, si la la la si la

  %87
  la'8\f sol16 fa mi re do si
  do8 si16 la si8. la16
  la4 la'8. sol16

  %90
  sol4(fad!16.) mi32 fad16. sol32
  la8 do,16. re32 la8 si16. do32
  do4(si8) re16. mi32

  %93
  re4(do8) do16. re32
  do4(si)
  R2*3\mbreak

  %98
  r4 r8 re16. mi32
  re4(do8) do16. re32
  do4 si8 re

  %101
  re16 do si la sol fad mi re
  mi[fad sol la si do re mi]
  mi re do si la sol fad mi

  %104
  fad sol la si do re mi fad
  fad[mi re do si la sol fad]
  sol[la si do re mi fad sol]

  %107
  sol[fad mi re do si la sol]
  fad sol la8 r re
  dod16 dod re dod la'4\mbreak

  %110
  do,!16 do re do la'4
  si,16 si do si sol'4
  la,16 la si la si si do si

  %113
  do do re do re re mi re
  mi mi fad mi fad fad sol fad
  sol8 fad16 mi re do si la

  %116
  si8 la16 sol la8.\tr sol16
  sol'8 re sol, re'16. mi32
  re4(do16.) si32 do16. re32

  %119
  do4(si8) re16. mi32\mbreak
  re4(do16.) si32 do16. re32
  do4(si8) re

  %122
  re,16 re mi re fad fad sol fad
  la la si la do do re do
  fad[sol la sol fad mi re do]

  %125
  re8[re re re]
  mi[mi mi mi]
  re8[do16 si do re mi fad]

  %128
  sol8 fad16 mi re do si la
  si8 la16 sol la8.\tr sol16\mbreak
  re'4 sol8. la16

  %131
  sol4(fad8) sol
  la16.[sol32 fad16. mi32 re16. do32 si16. la32]
  si8 la16. sol32 la4\tr

  %134
  sol2\fermata

}

IvlIn = \relative do'' {

  re16
  re4 sol8. la16
  sol4 fad8. sol16
  la8 do,16. re32 la8 si16. do32

  %4
  do4(si8.) sol'16
  la8 do,16. re32 la8 si16. do32
  do4(si16.) sol'32 la16. si32

  %7
  si,8[r16 si dod8 r16 re]
  dod8 la' r16 mi fad16. sol32
  fad8 la r16 mi fad16. sol32

  %10
  fad8 la, r16 mi fad16. sol32\mbreak
  fad8 la r16 mi fad16. sol32
  fad8 re'16. mi32 mi4\tr

  %13
  re r8 r16 re
  re4 sol8. la16
  sol4(fa16.) mi32 fa16. sol32

  %16
  mi8 [do do,] r16 mi'
  mi4 la8. si16
  la4(sol16.) fad32 sol16. la32

  %19
  fad8[re re, re'16. mi32]
  re4(do8) do16. re32
  do4(si8) re16. mi32

  %22
  re4(do8) do16. re32\mbreak %% fine prima pagina
  do4(si8) sol'
  fad16.[mi32 re16. do32 si16. la32 sol16. fad32]

  %25
  sol4 fad^\markup \center-align{\italic\bold [tr]}

  sol r
  R2*5

  %32
  r4 r8 r16 re'\mbreak
  re4 sol8. la16
  sol4(fad8.) sol16

  %35
  la8 do,16 re la8 si16 do
  do4(si8) si\p
  do16 do re do do do re do

  %38
  do2
  si16 si do si si si do si
  si2

  %41
  la16 la si la la la si la
  la2
  si4 r8 re\mbreak

  %44
  re4(do8) do16. re32
  \appoggiatura do8 si\p [si re si]
  mi[dod mi dod]
  sol'[re sol re]

  %48
  sol[mi sol la,]
  la'[fad la fad]
  mi16[fad mi re dod si la sol]

  %51
  la8\p[la sol sol]
  fad[fad mi mi]
  fad16\f[re mi fad sol la si dod]\mbreak

  %54
  re la si dod re mi fad sol
  la8 re, mi8.\tr la,16
  la4 re8. mi16

  %57
  dod8 la' r16 mi fad16. sol32
  fad8 la r16 mi fad16. sol32
  fad8 la, r16 mi fad16. sol32

  %60
  fad8 la r16 mi fad16. sol32
  fad8 re'16. mi32 mi8.\tr re16
  re4 r

  %63
  R2*4
  r4 r8 r16 mi
  mi4 la8. si16

  %69
  la4(sold8.) la16
  si8 re,16. mi32 si8 do16. re32
  do8[mi,\p mi do']

  %72
  la[la la la]
  la[la la la]
  sold[sold sold sold]

  %75
  si[si si si]\mbreak
  mi,[mi mi do']
  la[la la la]

  %78
  si[si si si]
  sol[sol sol sol]
  la[la la la]

  %81
  la[la la la]
  si[si sold sold]
  do[do do do]

  %84
  do[do do do]
  do[do do do]\mbreak
  re[re re re]

  %87
  la'8\f sol16 fa mi re do si
  do8 si16 la si8. la16
  la4 la'8. sol16

  %90
  sol4(fad!16.) mi32 fad16. sol32
  la8 do,16. re32 la8 si16. do32
  do4(si8) re16. mi32

  %93
  re4(do8) do16. re32
  do4(si)
  R2*3\mbreak

  %98
  r4 r8 re16. mi32
  re4(do8) do16. re32
  do4 si8 re

  %101
  si[sol re sol]~
  sol[mi sol do]~
  do[la mi la]~

  %104
  la[fad la re]~
  re[si fad si]~
  si[sol si mi]~

  %107
  mi[do sol mi]
  re[fad fad fad]
  mi[mi mi mi]\mbreak

  %110
  la[la la la]
  re[re re re]
  fad,[fad sol sol]

  %113
  la[la si si]
  do[do re re]
  si[mi la, fad]

  %116
  re' [sol, sol fad]
  sol re' sol, re'16. mi32
  re4(do16.) si32 do16. re32

  %119
  do4(si8) re16. mi32\mbreak
  re4(do16.) si32 do16. re32
  do4(si8) re

  %122
  re,16 re mi re re re mi re
  fad fad sol fad la la si la
  re[mi fad mi re do si la]

  %125
  si8[si si si]
  la[la la la]
  la[do16 si do re mi fad]

  %128
  sol8 fad16 mi re do si la
  si8 la16 sol la8.\tr sol16\mbreak
  re'4 sol8. la16

  %131
  sol4(fad8) sol
  fad16.[mi32 re16. do32 si16. la32 sol16. fad32]
  sol4 fad\tr

  %134
  sol2\fermata

}

Ivlan = \relative do' {

  r16
  si'4 si8. do16
  si4 la8. sol16
  fad4 fad8. fad16

  %4
  re4 re8. si'16
  fad4 fad8. fad16
  re4 re8. sol16

  %7
  re8[r16 sol la8 r16 si]
  mi,8 dod r16 dod re16. mi32
  re8 fad r16 dod re16. mi32

  %10
  re8 fad r16 dod re16. mi32\mbreak
  re8 fad r16 dod re16. mi32
  re8 la' dod,4

  %13
  la r8 r16 la'
  si4 si8. do16
  si4 si8. si16

  %16
  sol8[sol, sol] r16 sol'
  dod4 dod8. re16
  dod4 dod8. dod16

  %19
  la8[la, la fad']
  fad4. fad8
  re4. re8

  %22
  fad4. fad8\mbreak
  re4. re8
  re4. re8

  %25
  re4 re
  si r
  R2*6

  %33
  si'4 si8. do16
  si4 la8. sol16
  fad4 fad8. fad16

  %36
  re4 re
  R2*6
  r4 r8 si'16. do32\mbreak

  %44
  si4 la8 la16. fad32
  re4 r
  la r

  %47
  si r
  la r
  re r

  %50
  R2
  fad8[fad mi mi]
  re[re dod dod]

  %53
  re4 r\mbreak
  re r
  re8[si' la8.^\markup \center-align{\italic\bold [tr]} fad16]

  %56
  fad4 fad8. sol16
  mi8 dod r16 dod re16. mi32
  re8 fad r16 dod re16. mi32

  %59
  re8 fad r16 dod re16. mi32
  re8 fad r16 dod re16. mi32
  re8 la' dod,4

  %62
  la r
  R2*4
  r4 r8 r16 do'

  %68
  do4 do8. re16
  do4 si8. la16
  sold4 sold8. sold16

  %71
  mi8[la,\p la la]
  re[re re re]
  re[re re re]

  %74
  mi[mi mi mi]
  sold,[sold sold sold]\mbreak
  la[la la la]

  %77
  re[re re re]
  sol[sol sol sol]
  do,[do do do]

  %80
  fa[fa fa fa]
  fa?[fa fa fa]
  mi[mi mi mi]

  %83
  la[la la la]
  la[la la la]
  la[la la la]\mbreak

  %86
  la,[la la la]
  la8\f[la' si sold]
  mi[mi sold sold]

  %89
  mi4 mi8 dod'
  la4 la8. sol16
  fad4 fad8. fad16

  %92
  re4 re8. re16
  fad4 fad8. fad16
  re4 re

  %95
  R2*3\mbreak
  r4 r8 si'16. do32
  la4 fad8. fad16

  %100
  re4 re
  si8[si si si]
  do[do do do]

  %103
  do[do do do]
  re[re re re]
  re[re re re]

  %106
  mi[mi mi mi]
  do[do do do]
  re[re re re]

  %109
  la[la la la]\mbreak
  fad'[fad fad fad]
  sol[sol sol sol]

  %112
  re[re re re]
  re[re re re]
  re[re re re]

  %115
  sol8[do fad, re]
  sol sol, re' re,
  sol4 r8 si'\p

  %118
  si4 la8 fad
  re4. si'8\mbreak
  si4 la8 fad

  %121
  re4 re
  fad,8 r la r
  re r re r

  %124
  la4 r
  sol'8[sol sol sol]
  sol[sol sol sol]

  %127
  fad[sol re do]
  si[do fad, re]
  sol sol' re re,\mbreak

  %130
  si''4 si8. do16
  si4 la8 si
  re,4. re8

  %133
  re4 re
  sol,2\fermata

}

Ivocen = \relative do'' {

  \autoBeamOff
  r16
  R2*25
  r4 r8 sol
  re'16[do si la sol8] mi'

  %28
  mi\tr re16[do] re8 sol,
  fad16[sol la si] do8 do
  do si16[la] si8 sol

  %31
  mi'16[re dod si la8] sol
  fad8. mi16 re4\mbreak
  R2*3

  %36
  r4 r8 re'8
  mi16[mi fad mi] mi[mi fad mi]
  la[sol fad mi] fad[mi re dod]

  %39
  re[re mi re] re[re mi re]
  sol[fad mi re] mi[re do si]
  do[do re do] do[do re do]

  %42
  fad16[mi re do] re[do si la]
  si[la sol fad] sol4\mbreak
  r4 r8 la

  %45
  si16[sol fad sol] si[sol fad sol]
  dod[la sol la] dod[la sol la]
  re[si la si] re[si la si]

  %48
  mi[dod si dod] mi[dod si dod]
  fad[re dod re] fad[re dod re]
  sol[la sol fad  mi re dod si]

  %51
  la [la si la] la [la si la]
  la [la si la] la [la si la]
  re[re, mi fad sol la si dod]\mbreak

  %54
  re [la si dod re mi] fad [sol]
  la8 re, mi8.\tr re16
  re4 r

  %57
  R2*4
  r4 r8 la
  fad16\tr[mi fad sol la8] si

  %63
  si la16[sol] la8 re\mbreak
  dod16\tr[si dod re mi8] sol,
  sol fad16[mi] fad8 re'

  %66
  re16[do si la sold8] re'
  re do16[si] do4
  R2*2

  %70
  r4 r8 mi
  mi16[re do si la sol fa mi]
  fa8[re fa la]

  %73
  fa'16[sol fa mi re do si la]
  sold8[mi sold si]
  mi16[re mi fa] mi[re do si]\mbreak

  %76
  do4 r16 la[do mi]
  fa[sol la sol fa mi re do]

  %78
  si [sol si re] si [sol si re]
  mi[fa sol fa mi re do si]
  la [fa la do] la [fa la do]

  %81
  re[mi fa mi re do si la]
  sold8 fad!16 [mi] re'8 do16 [si]
  do si la8 r la

  %84
  la16 [la si la] la [la si la]
  mi' [la, si la] la [la si la]\mbreak
  fa' [la, si la] la [la si la]

  %87
  la'8 [sol16 fa mi re] do [si]
  do8 si16 [la] si8. la16
  la4 r

  %90
  R2*4
  r4 r8 sol
  re'16[do si la sol8] mi'

  %96
  mi\tr re16[do] re8 sol,
  fad16[sol la si] do8 do\mbreak
  do si16[la] si4

  %99
  R2
  r4 r8 re
  re16 [do si la] sol [fad mi re]
  mi[fad sol la si do re mi]
  mi [re do si] la [sol fad mi]

  %104
  fad [sol la si] do [re mi fad]
  fad[mi re do si la sol fad]
  sol[la si do re mi fad sol]

  %107
  sol[fad mi re do si la sol]
  fad [sol] la8 r re
  dod16 [dod re dod] la'4\mbreak

  %110
  do,!16 [do re do] la'4
  si,16 [si do si] sol'4
  la,16 [la si la] si [si do si]

  %113
  do [do re do] re [re mi re]
  mi [mi fad mi] fad [fad sol fad]
  sol8 [fad16 mi re do] si [la]

  %116
  si8 la16 [sol] la8.\tr sol16
  sol4 r8 re'16.[mi32]
  re4(do16.)[si32 do16. re32]

  %119
  do4(si8) [re16.mi32]\mbreak
  re4(do16.)[si32 do16. re32]
  do4(si8) re

  %122
  re,16 [re mi re] fad [fad sol fad]
  la [la si la] do [do re do]
  fad[sol la sol fad mi re do]

  %125
  si2
  dod
  re8[do16 si do re mi fad]

  %128
  sol8 [fad16 mi re do] si [la]
  si8 la16 [sol] la8.\tr sol16\mbreak
  sol4 r

  %131
  R2*4

}

Itesto = \lyricmode {

  Lauda - te pueri _ _ lauda - - te Dominum _ _ lauda - te Dominum _ _

  lauda - - - - - - - - - - - - - te lauda - - - - - - - - - - - - - - - - - te

  nomen _ Domini. _ _

  Lauda - te pueri _ _ lauda - te Dominum _ _ lauda - - te Dominum _ _

  lauda - - - - - - - - - - - - - - - - te nomen _ Domini _ _

  lauda - - - - - - te nomen _ Domini _ _ lauda - te pueri _ _ lauda - - te Dominum _ _

  lauda - - - - - - - - - - - te lauda - - - - - - - - - - - - - te nomen _ Domini _ _

  lauda - - - te lauda - - - - - - - - - te nomen _ Domini. _ _

}

Ibcn = \relative do {

  r16
  r8 sol [sol' sol,]
  r re'[re' re,]
  r re[re' re,]

  %4
  r sol,[sol' sol,]
  r re'[re' re,]
  r sol,[sol' sol,]

  %7
  r sol[sol' sol,]
  r la[la' la,]
  r la[la' la,]

  %10
  r la[la' la,]\mbreak
  r la[la' la,]
  r re[la' la,]

  %13
  re,[re' re' re,]
  r8 sol,[sol' sol,]
  r8 sol [sol' sol,]

  %16
  r do[do' do,]
  r la[la' la,]
  r la[la' la,]

  %19
  r re[re' re,]
  r re[re' re,]
  r sol,[sol' sol,]

  %22
  r re'[re' re,]\mbreak
  r sol,[sol' sol,]
  r re'[re' re,]

  %25
  sol sol, re' re,
  sol4 r
  r8 sol[sol' sol,]

  %28
  r8 sol[sol' sol,]
  r re'[re' re,]
  r sol,[sol' sol,]

  %31
  r dod[dod' dod,]
  r re[re' re,]\mbreak
  r sol,[sol' sol,]

  %34
  r re'[re' re,]
  r re[re' re,]
  r sol,[sol' sol,]

  %37
  r do[do' do,]
  r fad,[fad' fad,]
  r si[si' si,]

  %40
  r mi,[mi' mi,]
  r la[la' la,]
  r re,[re' re,]

  %43
  r sol[sol' sol,]\mbreak
  r re'[re' re,]
  r sol,[sol' sol,]

  %46
  r la[la' la,]
  r si[si' si,]
  r la[la' la,]

  %49
  r re[re' re,]
  r la[la' la,]
  R2*2

  %53
  re4 r\mbreak
  re r
  re8[si' la la,]

  %56
  re,[re' re' re,]
  r la[la' la,]
  r la[la' la,]

  %59
  r la[la' la,]
  r la[la' la,]
  r8 re[la' la,]

  %62
  re,[re' re' re,]
  r re[re' re,]\mbreak
  r la[la' la,]

  %65
  r re,[re' re,]
  r mi[mi' mi,]
  r la[la' la,]

  %68
  r la[la' la,]
  r mi'[mi' mi,]
  r mi[mi' mi,]

  %71
  la,4 r
  fa'8[re fa la]
  re4 r

  %74
  sold,8[mi sold si]
  mi,4 r\mbreak
  la8[mi do la]

  %77
  R2*10
  la8\f[re' sold, mi]
  la la, mi' mi,

  %89
  la[la' dod la]
  r re,[re' re,]
  r re[re' re,]

  %92
  r sol,[sol' sol,]
  r re'[re' re,]
  r sol,[sol' sol,]

  %95
  r sol[sol' sol,]
  r sol[sol' sol,]
  r re'[re' re,]\mbreak

  %98
  r sol,[sol' sol,]
  r re'[re' re,]
  r sol,[sol' sol,]

  %101
  R2
  do4 r
  R2

  %104
  re4 r
  R2
  mi4 r

  %107
  R2
  re4 r
  R2*6

  %115
  sol8[do fad, re]
  sol sol, re' re,
  sol[sol sol' sol,]

  %118
  r re'[re' re,]
  r sol, [sol' sol,]\mbreak
  r re'[re' re,]

  %121
  r sol, [sol' sol,]
  re' r re r
  re r re r

  %124
  re4 r
  R2*2
  r8 sol[re do]

  %128
  si[do fad, re]
  sol sol' re re,\mbreak
  sol[sol sol' sol,]

  %131
  r re' [re' re,]
  r re[re' re,]
  sol sol, re' re,

  %134
  sol2\fermata

}


Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  s16
  s2
  s8 <6 4> <5 3> s
  s <7> s s
  s <5 4> <3> s
  s <7> s s
  s <5 4> <3> s
  s4 <6 4+>
  <_+> s
  s8 <6 4> <3+> s
  s <6 4> <3+> s
  s <6 4> <3+> s
  s2*3
  s4 <7->
  s2
  <_+>
  s4 <7>
  s2
  s8 <7> s4
  s8 <5 4> <3> s
  s4 <7>
  s8 <5 4> <3> s
  s2*5
  s4 <7>
  s2*4
  s8 <6 4> <5 3> s
  s <7> s s
  s8 <6 4> <5 3> s
  s2*9
  <_+>2
  s
  <_+>
  s
  <7>
  s2*6
  <_+>2
  s2*3
  s4 <_+>
  s2
  s
  s8 <_+> s4
  s2
  <7 _+>
  s
  s
  <6 4>4 <5 3+>
  s8 <7> s4
  s2*19
  s8 <5 4> <3+> s
  s <7> s4
  s8 <5 4> <3> s
  s <7> s4
  s2*3
  s4 <7>
  s2
  <7>
  s8 <5 4> <3> s
  s2*17
  s8 <7> s4
  s8 <5 4> <3> s
  s4 <7>
  s8 <5 4> <3> s
  s2*9
  s8 <6 5> <5 3> <6 4>
  s8 <5 3>

}

forma = {

  \time 2/4
  \key sol\major
  \tempo 4 = 80
  \partial 16 s16
  s2*134
  \bar "|."

}


Ivl = {
  \Iglobal
  \notypeset
  <<\Ivln\forma>>
}

IvlI = {
  \Iglobal
  <<\IvlIn\forma>>
}

Ivla = {
  \Iglobal
  \clef alto
  <<\Ivlan\forma>>
}

Ivoce = {
  \new Voice = "laudate"
  \Iglobal
  %\clef soprano
  <<\Ivocen\forma>>
}



Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn\forma\Ibfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

IIvln = \relative do'' {

  r8 mi, sol mi sol mi
  sol'4(la si)
  r8 red,, fad red fad red

  %4
  fad'4(sol la)
  r8 mi, sol mi sol mi
  r mi sold mi si' sold\mbreak

  %7
  sold'4(la si)
  mi,8 do do8\tr(si16 do) do8\tr(si16 do)
  do8\tr(si16 do) do8\tr(si16 do) do8\tr(si16 do)

  %10
  r8 re, fad re la' fad
  fad'4(sol la)
  re,8 si si8\tr(la16 si) si8\tr(la16 si)

  %13
  si8\tr(la16 si) si8\tr(la16 si) si8\tr(la16 si)
  r8 si'(sol mi red mi)
  si2.~

  %16
  si8 si'(sol mi dob lad)
  si2 r4\mbreak
  r r16 si mi sol si8 r

  %19
  sol,4 fad2\tr
  sol4 r16 si mi sol si8 r
  sol4 fad2\tr

  %22
  mi4 r r
  r8 sol,\p si sol si sol
  R2.

  %25
  r8 mi\p sol mi sol mi
  R2.
  r8 mi\p sol mi sol mi

  %28
  la'2.\mbreak
  mi8\tr(re16 mi) mi8\tr(re16 mi) mi8\tr(re16 mi)
  sol2.

  %31
  re8\tr(dod16 re) re8\tr(dod16 re) re8\tr(dod16 re)
  fad2.
  sol8 sol, si sol si sol

  %34
  R2.
  r8 fad'(re si lad si)
  fad2.~

  %37
  fad8 fad'(re si sol! mid)
  fad2 r4\mbreak %%% fine p. 9
  R2.*2

  %41
  r8 lad\p dod lad dod lad
  mi'4(re dod)
  re dod2\tr

  %44
  re8 re,\f fad re fad re
  sol'4(fad mi)
  re8 re re8\tr(dod16 re) re8\tr(dod16 re)

  %47
  re8\tr(dod16 re) re8\tr(dod16 re) re8\tr(dod16 re)
  si'4 r16 si, re fad si8 r\mbreak
  re,4 dod2\tr

  %50
  re4 r16 si re fad si8 r
  re,4 dod2\tr
  si4 r r

  %53
  r8 re,\p fad re fad re
  R2.
  r8 fad lad fad dod' lad

  %56
  lad'4(si) dod
  fad,8 re re8\tr(dod16 re) re8\tr(dod16 re)
  re8\tr(dod16 re) re8\tr(dod16 re) re8\tr(dod16 re)\mbreak

  %59 fine p. 10
  dod8 fad, la fad la fad
  la'2.
  si8 sol, si sol si sol

  %62
  R2.
  do'2.\p
  mi,8\tr(re16 mi) mi8\tr(re16 mi) mi8\tr(re16 mi)

  %65
  la2.
  fad8\tr(mi16 fad) fad8\tr(mi16 fad) fad8\tr(mi16 fad)
  si2.

  %68
  si4 r r
  R2.
  si2.\p~

  %71
  si
  do,8\tr(si16 do) do8\tr(si16 do) do8\tr(si16 do)
  la'2.

  %74
  si,8\tr(la16 si) si8\tr(la16 si) si8\tr(la16 si)
  sol'2.
  \slurDashed la,8\tr(sol16 la) la8\tr(sol16 la) la8\tr(sol16 la) \slurSolid\mbreak

  %77
  la'2.~
  la8 si, red si red si
  sol'4 r r

  %80
  r8 si8\p(sol mi red mi)
  si2.~
  si8 si'(sol mi dob lad)

  %83
  si2 r4
  si8 r dod r red r
  mi r fad r sol r\mbreak

  %86
  r4 r16 si, mi sol si8 r
  sol,4 fad2\tr
  sol4 r16 si mi sol si8 r

  %89
  sol4 fad2\tr
  sol8 si,\f si8\tr(la16 si) si8\tr(la16 si)
  mi8 si si8\tr(la16 si) si8\tr(la16 si)

  %92
  sol'8 si, si8\tr(la16 si) si8\tr(la16 si)
  si'4-. sol-. fad-.
  mi2.\fermata

}

IIvlIn = \relative do'' {

  r8 si, mi si mi si
  mi'4(fad sol)
  r8 si,, red si red si

  %4
  red'4(mi fad)
  r8 si,, mi si mi si
  re'2.~\mbreak

  %7
  re
  do8 la \slurDashed la8\tr (sold16 la) la8\tr (sold16 la)
  la8\tr (sold16 la) la8\tr (sold16 la) la8^\markup \center-align{\italic\bold [tr]} (sold16 la)

  %10
  do2.~
  do
  si8 sol sol8\tr (fad16 sol) sol8\tr (fad16 sol)
  sol8\tr (fad16 sol) sol8\tr (fad16 sol) sol8\tr (fad16 sol)\slurSolid

  %14
  R2.
  r8 si'(sol mi red mi)
  si2.~

  %17
  si8 si' sol mi dob lad\mbreak
  si4 r16 sol si mi sol8 r
  mi,4 red2\tr

  %20
  mi4 r16 sol si mi sol8 r
  mi4 red2\tr
  mi4 r r

  %23
  r8 mi,\p sol mi sol mi
  R2.
  r8 si\p mi si mi si

  %26
  R2.
  r8 do\p mi do mi do
  mi'2.\mbreak

  %29
  sol,8\tr(fad16 sol) sol8\tr(fad16 sol) sol8\tr(fad16 sol)
  mi'2 sol,4
  fad8\tr(mi16 fad) fad8\tr(mi16 fad) fad8\tr(mi16 fad)

  %32
  red'2.
  mi8 mi, sol mi sol mi
  R2.*2

  %36
  r8 fad'(re si lad si)
  fad2.~
  fad8 fad'(re si sol! mid)\mbreak

  %39
  fad4 r r
  R2.
  r8 fad\p lad fad lad fad

  %42
  dod'4(si lad)
  si2 lad4
  si8 si,\f re si re si

  %45
  mi'4(re dod)
  si8 si si4\tr si\tr
  si\tr si\tr si\tr

  %48
  fad' r16 fad, si re fad8 r\mbreak
  si,4 lad2\tr
  si4 r16 fad si re fad8 r

  %51
  si,4 lad2\tr
  si4 r r
  r8 si,\p re si re si

  %54
  R2.
  mi'2.~
  mi

  %57
  re8 si si4\tr si\tr
  si\tr si\tr si\tr \mbreak
  lad8 dod, fad dod fad dod

  %60
  fad'2.
  sol8 mi, sol mi sol mi
  R2.

  %63
  mi'2.\p
  dod8\tr(si16 dod) dod8\tr(si16 dod) dod8\tr(si16 dod)
  fad2.

  %66
  red8\tr(dod16 red) red8\tr(dod16 red) red8\tr(dod16 red)
  sol2.
  fad4 r r

  %69
  R2.
  sol2.\p~
  sol

  %72
  mi8\tr(re16 mi) mi8\tr(re16 mi) mi8\tr(re16 mi)
  fad2.
  re8\tr(do16 re) re8\tr(do16 re) re8\tr(do16 re)

  %75
  mi2.
  do8\tr(si16 do) do8\tr(si16 do) do8\tr(si16 do)\mbreak
  fad2.~

  %78
  fad8 fad, si fad si fad
  mi'4 r r
  R2.

  %81
  r8 si'\p(sol mi red mi)
  si2.~
  si8 si'(sol mi dob lad)

  %84
  si8 r lad r si r
  si r red r si r\mbreak
  r4 r16 sol si mi sol8 r

  %87
  mi,4 red2\tr
  mi4 r16 sol si mi sol8 r
  mi4 red2\tr

  %90
  mi8 sol,\f sol8\tr(fad16 sol) sol8\tr(fad16 sol)
  sol8\tr(fad16 sol) sol8\tr(fad16 sol) sol8\tr(fad16 sol)
  mi'8 sol, sol8\tr(fad16 sol) sol8\tr(fad16 sol)

  %93
  sol'4-\parenthesize -. mi-\parenthesize -. red-\parenthesize -.
  mi2.\fermata

}

IIvlan = \relative do' {

  sol2.
  si'
  si,~

  %4
  si
  sol
  sold4 sold' sold\mbreak

  %7
  si(la) sold
  la8 do, mi do mi do
  mi do mi do mi do

  %10
  la4 fad' fad
  la(sol) fad
  sol8 si, re si re si

  %13
  re si re si re si
  sol'4 sol r
  sol sol r

  %16
  sol sol r
  sol sol r\mbreak
  sol r8 mi mi4

  %19
  si si4. si8
  sol4 r8 mi' mi4
  si si4. si8

  %22
  sol4 r r
  r8 si\p mi si mi si
  R2.

  %25
  r8 sol\p si sol si sol
  R2.
  r8 la\p do la do la

  %28
  do'2.\mbreak
  si,4 si si
  si'2.

  %31
  red,4 red red
  si2.
  si4 si si

  %34
  R2.
  re4\p re r
  re re r

  %37
  re re r
  re re r\mbreak
  R2.*2

  %41
  dod4\p dod dod
  lad' fad2
  fad fad4

  %44
  fad\f fad,2
  dod'4 re mi
  fad2.~

  %47
  fad
  re4 r8 fad fad4\mbreak
  fad fad2

  %50
  fad4 r8 fad fad4
  fad fad2
  re4 r r

  %53
  r8 fad,\p si fad si fad
  R2.
  dod'4 dod dod

  %56
  dod?8 fad dod fad dod fad
  fad fad re fad re fad
  re fad re fad re fad\mbreak

  %59
  fad lad, dod lad dod lad
  red2.
  si8 si mi si mi si

  %62
  R2.
  la'4\p la la
  la sol sol

  %65
  fad fad fad
  si la la
  sol sol sol

  %68
  red r r
  R2.
  r8 sol\p si sol si sol

  %71
  sol4 sol mi
  mi8 do mi do mi do
  re4 re re

  %74
  re8 si re si re si
  do4 do do
  do8 la do la do la\mbreak

  %77
  do4 do do
  red8 red fad red fad red
  si4 r r

  %80
  sol'\p sol r
  sol sol r
  sol sol r

  %83
  sol sol r
  fad8 r fad r fad r
  sol r si r sol r\mbreak

  %86
  r4 r8 mi mi4
  si si4. si8
  sol4 r8 mi' mi4

  %89
  si si4. si8
  si8 sol\f si sol si sol
  sol sol si sol si sol

  %92
  si sol si sol si sol
  si'4 si si
  sol2.\fermata

}

IIvocen = \relative do'' {

  \autoBeamOff
  R2.*21
  si4 mi, do'
  do\tr si8[la] si4

  %24
  fad'8[mi] red[dod] si[la]
  sol[fad] mi4 r
  si'(mi) si

  %27
  do2 r8 mi
  la8[sol] fad[mi] re[do]\mbreak
  si8\tr[(la16 si)] si8\tr[(la16 si)] si8\tr[(la16 si)]

  %30
  sol'8[fad mi re do si]
  la8\tr[(sold16 la)] la8\tr[(sold16 la)] la8\tr[(sold16 la)]
  fad'8[mi red dod si la]

  %33
  sol8. fad16 mi4 r
  fad'8[mi] re[dod] si lad
  si2.\tr~

  %36
  si~
  si~
  si\mbreak

  %39
  lad16[lad si dod] si[si dod re] dod[dod re mi]
  re[re mi fad] lad,[lad si dod] si[si dod re]
  dod8. fad,16 fad4 r

  %42
  mi' re dod8 mi
  \con\terzinequarto \tuplet 3/2 { re8[do si] } dod4.\tr si8
  si2 r4

  %45
  R2.*7
  fad'4 si, sol'
  sol fad8[mi] fad4

  %54
  sol8[fad] mi[re] dod[si]
  lad[sold] fad4 r
  dod'(re) mi

  %57
  re2 r4
  fad re dod8 si\mbreak
  fad'8. fad,16 fad4 r

  %60
  fad'8[mi red dod] si[la]
  sol2 r4
  mi sol la8 si

  %63
  do8\tr[si16 do] do8\tr[si16 do] do8\tr[si16 do]
  dod2.
  re8\tr[dod16 re] re8\tr[dod16 re] re8\tr[dod16 re]

  %66
  red2.
  mi8\tr[red16 mi] mi8\tr[red16 mi]\mbreak mi8\tr[red16 mi]
  fad8[mi red] dod si4

  %69
  la'8[fad] fad4.\tr mi8
  mi2 r4
  sol8[fad] mi[re] do si

  %72
  do8\tr[si16 do] do8\tr[si16 do] do8\tr[si16 do]
  fad8[mi re do si la]
  si8\tr[la16 si] si8\tr[la16 si] si8\tr[la16 si]

  %75
  mi8[re do si la sol]
  la8\tr[sol16 la] la8\tr[sol16 la] la8\tr[sol16 la]\mbreak
  fad'8[sol la sol fad mi]

  %78
  red8. dod16 si4 r
  mi, sol si8 mi
  mi2.\tr~

  %81
  mi~
  mi~
  mi4 sol8[mi dob lad]

  %84
  si16[si dod re] dod[dod red mi] red[red mi fad]
  mi[mi fad sol] fad[fad sol la] sol[sol la si]\mbreak
  si,4. si8 mi4

  %87
  mi, fad4.\tr mi8
  mi2 r4
  mi' fad4.\tr mi8

  %90
  mi2 r4
  R2.*4

}

IItesto = \lyricmode {

  Sit nomen _ Domini _ _ sit benedictum _ _ _ ex hoc nunc et usque _ in sae - - - - - - - - culum _

  et usque _ in sae - - - - - - - culum _ et usque _ in se - culum. _

  Sit nomen _ Domini _ _ sit benedictum _ _ _ ex hoc nunc et usque _ in sae -- culum _

  ex hoc nunc et usque _ in sae - - - - - - - - - - - - culum_ in seculum _ _

  et usque _ in sae - - - - - - - - - - - - culum _ et usque _ in sae - - - - - - - - culum _

  in saeculum _ _ in saeculum. _ _

}

IIbcn = \relative do {

  mi4 r r
  r8 mi' red si mi mi,
  si4 r4 r

  %4
  r8 si' mi mi, red si
  mi4 r r
  mi mi mi\mbreak

  %7
  mi mi mi
  la8 la, do la do la
  do la do la do la

  %10
  re4 re re
  re re re
  sol8 sol, si sol si sol

  %13
  si sol si sol si sol
  mi'4 mi, r
  mi' mi, r

  %16
  mi' mi, r
  mi' mi, r\mbreak
  mi'8 mi' si sol mi sol,

  %19
  mi mi' si' la si si,
  mi mi' si sol mi sol,
  mi mi' si' la si si,

  %22
  mi4 r r
  mi r mi
  red si red

  %25
  mi r mi
  mi,8 mi' sol mi sol mi
  la4 r la,

  %28
  la la la\mbreak
  mi' mi mi
  mi mi mi

  %31
  fad si, si
  si si si
  mi mi mi

  %34
  si2 r4
  si' si, r
  si' si, r

  %37
  si' si, r
  si' si, r\mbreak
  fad' si, lad

  %40
  si fad' si,
  fad' fad fad
  fad,8 fad' si si, fad' fad,

  %43
  si si' fad[mi fad fad,]
  si4 r r
  fad8 fad' si si, fad' fad,

  %46
  si si re si re si
  re si re si re si
  si' si, re dod re si\mbreak

  %49
  si' si, fad'[mi fad fad,]
  si' si, re dod re si
  si' si, fad'[mi fad fad,]

  %52
  si4 r r
  si r si
  mi2 mid4

  %55
  fad r fad
  fad8 lad fad lad fad lad
  si, re si re si re

  %58
  si re si re si re\mbreak
  fad4 r r
  si,8 red si red si red

  %61
  mi,4 r r
  mi'8 sol mi sol mi sol
  la,4 la la

  %64
  R2.
  re4 re re
  R2.

  %67
  mi4 mi mi
  si si' sol
  do8 la si la si si,

  %70
  mi, mi' sol mi sol mi
  mi4 mi mi
  la8 la, do la do la

  %73
  re4 re re
  sol8 sol, si sol si sol
  do4 do do

  %76
  fad8 fad, la fad la fad\mbreak
  fad'4 fad fad
  si, si si

  %79
  mi8 sol mi sol mi sol
  mi4 mi, r
  mi' mi, r

  %82
  mi' mi, r
  mi' mi, r
  si'8 r fad' r si, r

  %85
  mi r red r mi r\mbreak
  mi mi' si sol mi sol,
  mi mi' si' la si si,

  %88
  mi mi' si sol mi sol,
  mi mi' si' la si si,
  mi, mi' sol mi sol mi

  %91
  sol mi sol mi sol mi
  sol mi sol mi sol mi
  mi4 si' si,

  %94
  mi,2.\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  s2.*5
  <7 _+>2.
  s2.*3
  <7>2.
  s2.*12
  <6 4>4 s <5 3>
  s2.*7
  <6+>4 <_+> s
  s2.
  s
  <3!>
  s2.*4
  <_+>2.
  s4 <_+>2
  <_+>2.
  s
  s4 <_+>2
  s2.
  <_+>
  s2.*7
  <6 4>4 s <5 3>
  s2 <6 5>4
  <7 _+>2.
  s2.*3
  <_+>2.
  <7 _+>
  s2.*7
  <_+>2.
  s2.*9
  <7 _+>2.
  s2.*5
  s4 <_+>2

}

forma = {

  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \key mi\minor
  \tempo 2. = 50
  s2.*94
  \bar "|."

}


IIvl = {
  \IIglobal
  \notypeset
  <<\IIvln\forma>>
}

IIvlI = {
  \IIglobal
  <<\IIvlIn\forma>>
}

IIvla = {
  \IIglobal
  \clef alto
  <<\IIvlan\forma>>
}

IIvoce = {
  \new Voice = "sit"
  \IIglobal
  %\clef soprano
  <<\IIvocen\forma>>
}



IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn\forma\IIbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

IIIvln = \relative do'' {

  re,8\p re' re, mi fad fad fad mi
  re re' re, mi fad fad fad sol
  la la' la, si dod dod dod re

  %4
  mi dod' mi, fad sol sol sol la
  si si si dod re2~
  re1~

  %7
  re2 dod8 sol(fad mi)
  r sol(fad mi) fad sol,(fad mi)
  r sol(fad mi)\mbreak fad re'\f re re

  %10
  do do do do si  mi mi mi
  re re re re dod?4 r
  r8 sol\p(fad mi) r sol(fad mi)

  %13
  r sol(fad mi) r sol(fad mi)
  r sol(fad mi) fa2~
  fa mi\fermata

  %16
  r re8\p re' re, mi
  fad? fad fad sol la la' la, si
  dod dod dod re\mbreak mi dod' mi, fad

  %19
  sol sol sol la si si si dod
  re1~
  re

  %22
  dod2 r8 sol,(fad mi)
  r sol(fad mi) r sol(fad mi)
  r sol(fad mi) re' r do r

  %25
  do? r si r mi r re r\mbreak
  re r dod? mi, la4\tr~la16 re dod si
  la4\tr~la16 fad' mi re dod4\tr~dod16 la' sold fad

  %28
  mi dod si la fad' re dod si dod re mi8~mi16 la sold fad
  mi dod si la fad' re dod si dod\f la si dod re mi fad sold
  la8 sold16 fad mi re dod si dod8 si16 la si8.\tr( la16)

  %31
  la\f dod re mi fad la sold fad mi dod re mi fad la sold fad\mbreak
  mi8 la dod, si la4 r
  la8 la' la, si dod dod dod re

  %34
  mi la mi fad sold sold sold la
  si si si re dod2~
  dod1

  %37
  dod4 r r8 sol,(fad mi)
  r sol(fad mi) r sol(fad mi)
  r sol(fad mi) la' r la r\mbreak

  %40
  sol[si] sol re si' r si r
  la dod la mi fad16 la fad re fad la fad re
  mi sol mi dod mi sol mi dod re fad re si re fad re si

  %43
  dod4\tr r16 la dod mi fad la fad re fad la fad re
  dod4\tr r16 la dod mi fad la fad re fad la fad re\mbreak
  dod la dod mi la(sol) fad(mi) fad8 mi16 re mi8.\tr re16

  %46
  re4 r8 la si16 sol'8. dod,16 la'8.
  re,16 si'8. mi,16 dod'8. re8 dod16 si la sol fad mi
  fad8 mi16 re mi8\tr re fad16 la fad re fad la fad re

  %49
  mi sol mi dod mi sol mi dod sol' si sol mi sol si sol mi
  fad8 re mi dod re2\fermata

}

IIIvlIn = \relative do'' {

  r2 re,8\p re' re, mi
  fad fad fad mi re re' re, mi
  fad fad fad sol la la' la, si

  %4
  dod dod dod re mi dod' mi, fad
  sol sol sol la fad2~
  fad1~

  %7
  fad2 mi8 mi(re dod)
  r mi(re dod) re mi,(re dod)
  r mi(re dod)\mbreak re la'\f la la

  %10
  la la la la sol si si si
  si si si si la4 r
  r8 mi\p(re dod) r8 mi(re dod)

  %13
  r8 mi(re dod) r8 mi(re dod)
  r8 mi(re dod) re2~
  re dod\fermata

  %16
  R1
  re8\p re' re, mi fad fad fad sol
  la la' la, si\mbreak dod dod dod re

  %19
  mi dod' mi, fad sol sol sol la
  fad1~
  fad

  %22
  mi2 r8 \slurDashed mi, (re dod)
  r8 mi(re dod) r8 mi(re dod)
  r8 mi(re dod)\slurSolid la'8 r la r

  %25
  sol r sol r si r si r\mbreak
  la r la r r dod, dod4
  r8 dod dod4 r8 dod dod4

  %28
  r8 dod' la si r dod la si
  r dod la si mi,16\f la si dod re mi fad sold
  la8 sold16 fad mi re dod si dod8 si16 la si8.\tr(la16)

  %31
  la16\f la si dod re fad mi re dod la si dod re fad mi re\mbreak
  dod8 mi la, sold la4 r
  r2 la8 la' la, si

  %34
  dod dod dod re mi si' mi, fad
  sold sold sold si la2~
  la1

  %37
  la4 r r8 mi, (re dod)
  r8 mi(re dod) r8 mi(re dod)
  r8 mi(re dod) fad' r fad r\mbreak

  %40
  re sol re si sol' r mi r
  mi8 la mi dod re16 fad re la re fad re la
  dod mi dod la dod mi dod la si re si fad si re si mi,

  %43
  mi4 r16 mi la dod re fad re la re fad re la
  mi4 r16 mi la dod re fad re la re fad re la\mbreak
  la dod mi la mi8 dod la re re dod

  %46
  la la fad fad re re' mi, mi'
  fad, fad' la, dod fad, re' mi dod
  la re re dod re16 fad re la re fad re la

  %49
  dod mi dod la dod mi dod la mi' sol mi dod mi sol mi dod
  re8 fad, sol mi re2\fermata

}

IIIvlan = \relative do' {

  la1\p~
  la~
  la~

  %4
  la~
  la2~la8 la' la la
  r la la la r la la la

  %7
  r la la la r la, la la
  mi' la, la la re la la la
  mi' la, la la\mbreak la fad'\f fad fad

  %10
  fad fad fad fad re sol sol sol
  sold sold sold sold mi4 r
  r8 la, la la re la la la

  %13
  mi' la, la la fad' la, la la
  sol' la, la dod si2~
  si mi,\fermata

  %16
  r la\p~
  la1~
  la~

  %19
  la~
  la8 la' la la r la la la
  r la la la r la la la

  %22
  la2 r8 la, la la
  re la la la mi' la, la la
  fad' la, la la la r fad' r

  %25
  re r re r sold r sold r\mbreak
  mi r mi r r la, la4
  r8 la la4 r8 la la4

  %28
  r8 la re sold, r la re sold,
  r la re sold, la\f la' sold mi
  la re sold, mi la la, mi'[mi,]

  %31
  dod' la' fad si mi, la fad si\mbreak
  mi,4. mi8 dod4 r
  mi1~

  %34
  mi~
  mi2~mi8 mi mi mi
  r mi mi mi r mi mi mi

  %37
  mi4 r r8 la, la la
  re la la la mi' la, la la
  fad' la, la la re' r re r\mbreak

  %40
  si r si r mi, r si' r
  dod r dod r re, re re re
  la la la la re re sold, sold

  %43
  la la la la la la la la
  la la la la la la la la\mbreak
  la la la la re re la la

  %46
  re re re re sol, si la dod
  si re dod la re sol dod, la
  re re, la''[la,]la' la la la

  %49
  la dod dod dod dod dod dod dod
  la la, si la la2\fermata

}

IIIvocen = \relative do'' {

  \autoBeamOff
  R1*15
  re,1\p
  fad2 la

  %18
  dod\mbreak mi
  sol~sol
  fad re

  %21
  R1
  la'8 sol16[fad] mi[re] dod[si] la2~
  la la

  %24
  r4 r8 la16 la re8 do16 si do8 do
  do?(si16[la)] si8 si16 si mi8 re16 dod? re8 re\mbreak
  re(dod16[si)] dod8 mi16 dod la4\tr~la16 [re dod si]

  %27
  la4\tr~la16 [fad' mi re] dod4\tr~dod16 [la' sold fad]
  mi [dod si la] fad' [re dod si] dod [re mi8]~mi16 [la sold fad]
  mi [dod si la] fad' [re dod si] dod\f [la si dod re mi fad sold]

  %30
  la8 [sold16 fad] mi [re] dod [si] dod8 si16 [la] si8.\tr(la16)
  la4\f r r2\mbreak
  r2 la~

  %33
  la dod
  mi sold~
  sold la

  %36
  la, r
  la'8 sol16[fad] mi[re] dod[si] la2~
  la la

  %39
  r4 r8la16 la re[mi fad mi] re[do] si[la]\mbreak
  si8 sol r si16 si mi[fad] sol16 fad mi[re] dod[si]
  dod si la8 r mi'16 mi fad16 [la fad re] fad [la fad re]

  %42
  mi [sol mi dod] mi [sol mi dod] re [fad re si] re [fad re si]
  dod4\tr r16 la [dod mi] fad [la fad re] fad [la fad re]
  dod4\tr r16 la [dod mi] fad [la fad re] fad [la fad re]\mbreak

  %45
  dod [la dod mi] la[(sol) fad(mi)] fad8 mi16 [re] \once\slurDashed mi8.\tr (re16)
  re4 r8 la si16 [sol'8.] dod,16 [la'8.]
  re,16 [si'8.] mi,16 [dod'8.] re8 [dod16 si] la [sol] fad [mi]

  %48
  fad8 mi16 [re] mi8\tr re re4 r
  R1*2

}

IIItesto = \lyricmode {

  A solis _ or - - - tu usque _ ad occa - sum laudabile _ _ _ _ nomen _ eius _

  laudabile _ _ _ _ nomen _ eius _ lauda - - - - - - - - - - - bile _ nomen _ eius. _

  A solis _ or - tu usque _ ad occa - sum lauda - - bile _ nomen _ laudabile _ _ _ _ nomen _ eius _ _

  lauda - - - - - - - - - - - - - - - - bile nomen _ eius _ lauda - - - - - bile _ nomen _ eius. _ _

}

IIIbcn = \relative do {

  re1\tasto^\p~
  re~
  re2 la~

  %4
  la1~
  la2 re8\tasto re' re re
  fad, re' re re mi, re' re re

  %7
  re, re' re re la,2\tasto~
  la1~
  la2\mbreak re8\f re re re

  %10
  re re re re sol mi mi mi
  mi mi mi mi la4 r
  la,1\tasto^\p~

  %13
  la~
  la2 sold~
  sold la\fermata

  %16
  re1\tasto^\p~
  re
  la1~

  %19
  la
  re8 re' re re fad, re' re re
  mi, re' re re re, re' re re

  %22
  la,1\tasto~
  la~
  la4. la8 fad r re' r

  %25
  sol r sol, r mi' r mi r\mbreak
  la r la, r r2
  R1*2

  %29
  r2 la8\f la' sold mi
  la re sold, mi la la, mi'[mi,]
  la la' re, sold, la la' re, sold,\mbreak

  %32
  la8 la' mi mi, la4 r
  la1~
  la2 mi'~

  %35
  mi la,8 la' la la
  dod, la' la la si, la' la la
  la,4 r la2~

  %38
  la1~
  la2 fad'8 r fad r\mbreak
  sol r sol, r sol' r sold r

  %41
  la r la, r re4 r
  R1*5
  r2 re8 sol dod, la

  %48
  re re, la''[la,] re re re re
  la' la, la la la la la la
  re re sol, la re2\fermata

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1*9
  <7->1
  <7 _+>
  s1*12
  s2 s4 <7->
  <5 4> <3> <_+> <7>
  <5 4> <3> s2

}

forma = {

  \time 4/4
  \key re\major
  \tempo 4 = 53
  s1*50
  \bar "|."

}


IIIvl = {
  \IIIglobal
  \notypeset
  <<\IIIvln\forma>>
}

IIIvlI = {
  \IIIglobal
  <<\IIIvlIn\forma>>
}

IIIvla = {
  \IIIglobal
  \clef alto
  <<\IIIvlan\forma>>
}

IIIvoce = {
  \new Voice = "solis"
  \IIIglobal
  %\clef soprano
  <<\IIIvocen\forma>>
}


IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn\forma\IIIbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IVglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

IVvln = \relative do'' {

  fad,8
  si8. dod16 si8 si,4 re'8 dod8. re16 dod8 lad,4 mi''8
  re8. mi16 re8 si,4 re'8 dod4 fad,8 r r lad'(
  si4) si,8 fad8. sol16 la8 sol4 mi8 r r sold'(

  %4
  la4) la,8 mi8. fad16 sol8 fad4 re8 r r lad'
  si8. dod16 si8 fad'4(re8) si8. dod16 si8 fad'4(re8)\mbreak
  si8. dod16 si8 fad'4 si,8 lad'4.~lad4 mi8

  %7
  re8. dod16 si8 mi,4 fad8 si,4. r8 r si'\p
  fad'4 \appoggiatura mi8 re \appoggiatura dod si4 si8 fad'4 \appoggiatura mi8 re \appoggiatura dod si4 si8

  %9
  sol'4 \appoggiatura fad8 mi \appoggiatura re dod4 si8 si8. lad16 lad8 r r lad'(
  si4) si,8 fad8. sol16 la8 sol4 mi8 r r sold'(\mbreak
  la4) la,8 mi8. fad16 sol8 fad4 re8 r r la'

  %12
  si4 dod32[re mi fad] sol4 mi8 dod4 re32[mi fad sol] la4 dod,8
  re8.[mi16 re8] la'4 fad8 re8. [mi16 re8] la'4 fad8
  re8.[mi16 re8] la'4 re,8 dod8. si16 la8 r r sol'(

  %15
  fad8.) mi16 re8 mi4. re8.\f mi16 re8 re,4 re'8\mbreak
  mi8. fad16 mi8 la,,4 sol''8 fad4 re8 mi4 dod8
  re4 la'8\p la4 sol8 fad8. sol16 la8 red,4 la'8

  %18
  sol8. fad16 mi8 si'4 sol8 sol fad mi mi8. re16 dod8
  re4 lad'8(si4) si,8 fad'4 fad,8 fad8. sol16 la8
  sol4 sol'8(si4) mi,8 sol4 si,8 si(mi) sol\mbreak

  %21
  lad,4 lad'8(si4) si,8 si'4 si,8 fad4.~
  fad4 re'8 re4(dod8) si4 lad'8(si4) si,8
  si8. dod16 si8 fad'4 re8 si8.[dod16 si8] fad'4 re8

  %24
  si8.[dod16 si8] fad'4 re8 si4 lad'8(si4) si,8\mbreak
  sol'8.[fad16 mi8] lad8.[sold16 fad8] si4 si,8 r r fad
  sol8.[fad16 mi8] lad8.[sold16 fad8] si4. r8 r fad'

  %27
  si4 si,8 fad4.~fad4 re'8 re4 dod8
  si4. r8 r lad'8\f(si4) si,8 fad8. sol16 la8
  sol4 mi8 r r sold'(\mbreak la4) la,8 mi8. fad16 sol8

  %30
  fad4 re8 r r si'' re,8. dod16 si8 mi,4 fad8
  si,1.\fermata

}

IVvlIn = \relative do'' {

  fad,8
  si8. dod16 si8 si,4 re'8 dod8. re16 dod8 lad,4 mi''8
  re8. mi16 re8 si,4 re'8 dod4 fad,8 r r lad'(
  si4) si,8 fad8. sol16 la8 sol4 mi8 r r sold'(

  %4
  la4) la,8 mi8. fad16 sol8 fad4 re8 r r lad'
  si8. dod16 si8 fad'4(re8) si8. dod16 si8 fad'4(re8)\mbreak
  si8. dod16 si8 fad'4 si,8 lad'4.~lad4 mi8

  %7
  re8. dod16 si8 mi,4 fad8 si,4. r8 r fad'\p
  fad4 fad8 fad4 fad8 fad4 fad8 fad4 fad8
  sol4 sol8 sold4 sold8 dod,4 dod8 r r lad''8(

  %10
  si4) si,8 fad8. sol16 la8 sol4 mi8 r r sold'(\mbreak
  la4) la,8 mi8. fad16 sol8 fad4 re8 r r la'
  si4 dod32[re mi fad] sol4 mi8 dod4 re32[mi fad sol] la4 dod,8

  %13
  re8.[mi16 re8] la'4 fad8 re8. [mi16 re8] la'4 fad8
  re8.[mi16 re8] la'4 re,8 dod8. si16 la8 r r mi'(
  re4) re8 re4 dod8 re8.\f mi16 re8 re,4 re'8\mbreak

  %16
  mi8. fad16 mi8 la,,4 sol''8 fad4 re8 mi4 dod8
  re4 fad8\p fad4 mi8 red8. mi16 fad8 si,4 fad'8
  mi4 si8 sol'4 mi8 mi4 si8 dod8. si16 lad8

  %19
  si4 lad'8(si4) si,8 red2.
  mi mi\mbreak
  dod4 lad'8(si4) si,8 si'4 si,8 fad4.~

  %22
  fad4 si8 si4 lad8 si4 lad'8(si4) si,8
  si8. dod16 si8 fad'4 re8 si8.[dod16 si8] fad'4 re8
  si8.[dod16 si8] fad'4 re8 si4 lad'8(si4) si,8\mbreak

  %25
  sol'8.[fad16 mi8] lad8.[sold16 fad8] si4 si,8 r r fad
  sol8.[fad16 mi8] lad8.[sold16 fad8] si4. r8 r fad'
  si4 si,8 fad4.~fad4 si8 si4 lad8

  %28
  si4. r8 r lad'8\f(si4) si,8 fad8. sol16 la8
  sol4 mi8 r r sold'(\mbreak la4) la,8 mi8. fad16 sol8
  fad4 re8 r r si'' re,8. dod16 si8 mi,4 fad8

  %31
  si,1.\fermata

}

IVvlan = \relative do' {

  r8
  fad,4 fad8 fad4 fad8 lad4 lad8 lad4 lad8
  fad4 fad8 fad4 fad8 lad4 lad8 dod4 dod8
  fad4 fad8 si,4 si8 si4 si8 si4 si8

  %4
  mi4 mi8 la,4 la8 la4 re8 dod4 dod8
  re4 re8 dod4 dod8 si4 si8 la4 la8\mbreak
  sol4 sol8 fad4 fad8 mi4 mi8 dod'4 fad8

  %7
  fad4 fad8 mi4 fad8 si,4. r8 r re\p
  re4 re8 re4 re8 re4 re8 re4 re8
  si4 si8 dod4 dod8 dod4 dod8 fad4 fad8

  %10
  fad4 fad8 si,4 si8 si4 si8 mi4 mi8\mbreak
  mi4 mi8 la,4 la8 la4 la8 fad'4 fad8
  re4 re8 si'4 si8 mi,4 mi8 dod'4 dod8

  %13
  fad,4 fad8 mi4 mi8 re4 re8 dod4 dod8
  si4 si8 la4 si8 mi4 mi8 mi4 dod8
  la4 la8 la4 la8 fad'4\f fad8 fad4 fad8\mbreak

  %16
  dod4 dod8 dod4 dod8 la4 la8 si4 la8
  la4. r8 r la'\p la4 la8 fad4 red8
  si4 si8 si4 si8 si4 si'8 lad4 lad8

  %19
  fad4 dod8 fad4 re8 si4 si8 si4 si8
  si4 si8 si4 si8 si4 si8 si4 si8\mbreak
  fad'4 fad8 fad4 re8 re4 re8 re4 re8

  %22
  re4 re8 fad4 fad8 fad4 dod8 fad4 re8
  re4 re8 dod4 dod8 si4 si8 la4 la8
  sol4 sol8 fad4 fad8 re'4 dod8 fad4 re8\mbreak

  %25
  si4 sol'8 dod,4 fad8 fad4 fad8 mi4 re8
  si4 sol'8 dod,4 fad8 fad4 fad8 mi4 re8
  re4 re8 re4 re8 re4 re8 fad4 fad8

  %28
  re4\f re8 dod4 fad8 fad4 fad8 si,4 si8
  si4 si8 mi4 mi8\mbreak mi4 mi8 la,4 la8
  la4 la8 fad'4 fad8 fad4 si8 mi,4 fad8

  %31
  si,1.\fermata

}

IVvocen = \relative do'' {

  \autoBeamOff
  r8
  R1.*6
  r2. r4. r8 r si
  fad'4 \appoggiatura mi8 re \appoggiatura dod si4 si8 fad'4 \appoggiatura mi8 re \appoggiatura dod si4 si8

  %9
  sol'4 \appoggiatura fad8 mi \appoggiatura re dod4 si8 si8. lad16 lad8 r r fad'
  fad4 red8 si4 si8 sol'16[la] si4 r8 r mi,\mbreak
  mi4 dod8  la4 la8 fad'16[sol] la4 r8 r la,

  %12
  si4 dod32[re mi fad] sol4 mi8 dod4 re32[mi fad sol] la4 dod,8
  re8.[mi16 re8] la'4 fad8 re8. [mi16 re8] la'4 fad8
  re8.[mi16 re8] la'4 re,8 dod8. si16 la8 r r sol'(

  %15
  fad8.) mi16 re8 mi4. re r\mbreak
  R1.  %%% inizio p. 18
  r8 r fad fad4 mi8 red8. mi16 fad8 si,4 fad'8

  %18
  sol16[fad] mi4 r8 sol sol sol[fad] mi8 mi8. re16[dod8]
  re4. r fad4 fad,8 fad8. sol16 la8
  sol8. fad16 sol8 r4. sol'4 si,8 si mi sol\mbreak

  %21
  lad,8. sold16 fad8 r r fad' si4 si,8 fad4.~
  fad4 si8 re4(dod8) si4. r
  si8. dod16[si8] fad'4 re8 si8.[dod16 si8] fad'4 re8

  %24
  si8.[dod16 si8] fad'4 re8 si8. lad32[sol] fad8 r r fad'\mbreak
  sol8.[fad16 mi8] lad8.[sold16 fad8] si4 si,8 r r fad
  sol8.[fad16 mi8] lad8.[sold16 fad8] si4. r8 r fad'

  %27
  si4 si,8 fad4.~fad4 si8 re4(dod8)
  si2. r
  R1.*3

}

IVtesto = \lyricmode {

  Excelsus _ _ super _  omnes _ super _ omnes _ gentes _ Dominus _ _ et super _ super _ caelos _ et

  super _ super _ caelos _ glo - - - - - - - - - - - - - - - - - - ria _ glo -- ria _ ejus. _

  Quis sicut _ Dominus _ _ Deus _ noster _ qui in altis _ habitat _ _ et humilia _ _ _ respicit _ _

  et humilia _ _ _ respicit _ _ in caelo _ et in terra _

  et humilia _ _ res - - - - - - picit _ in cae - - lo in ter - ra in caelo _ et in terra. _

}

IVbcn = \relative do {

  r8
  si4 si8 si4 si8 fad'4 fad8 fad4 fad8
  si,4 si8 si4 si8 fad'4 fad8 mi4 mi8
  red4 red8 red4 red8 mi4 mi8 re4 re8

  %4
  dod4 dod8 dod4 dod8 re4 re8 fad4 fad8
  si4 si8 la4 la8 sol4 sol8 fad4 fad8\mbreak
  mi4 mi8 re4 re8 dod4 dod8 fad,4 fad8

  %7
  si4 si'8 mi,4 fad8 si,4. r8 r si_\markup\italic"Senza Org[ano]"
  si4 si8 si4 si8 si4 si8 si4 si8
  mi4 mi8 mid4 mid8 fad4 fad8 mi?4 mi8

  %10
  red4 red8 red4 red8 mi4 mi8 re4 re8\mbreak
  dod4 dod8 dod4 dod8 re4 re8 re4 re8
  sol4 sol8 sol4 sol8 la4 la8 la4 la8

  %13
  re4 re8 dod4 dod8 si4 si8 la4 la8
  sol4 sol8 fad4 sold8 la4 la,8 la4 la8
  re4 re8 la'4 la,8 re4\tu re8 re4 re8\mbreak

  %16
  la4 la8 la4 la8 re4 re8 sol,4 la8
  re4. r8 r8 la'_\markup\italic"Senza Org." si4 si,8 si4 si8
  mi4 mi8 mi4 mi8 mi4 mi8 fad4 fad8

  %19
  si,4 fad'8 re4 si8 si4 si8 si4 si8
  mi4 mi8 mi4 mi8 mi4 mi8 mi4 mi8\mbreak
  fad4 mi8 re4 si8 si4 si8 si4 si8

  %22
  si4 si8 fad'4 fad8 si,4 fad'8 re4 si8
  si'4 si8 la4 la8 sol4 sol8 fad4 fad8
  mi4 mi8 re4 si8 si4 fad'8 re4 si8\mbreak

  %25
  mi4 mi8 fad4 mi8 re4 re8 dod4 si8
  mi4 mi8 fad4 mi8 re4 re8 dod4 si8
  si4 si8 si4 si8 si4 si8 fad'4 fad,8

  %28
  si4\f\tu si8 fad'4 mi8 red4 red8 red4 red8
  mi4 mi8 re!4 re8\mbreak dod4 dod8 dod4 dod8
  re4 re8 re4 re8 si'4 si,8 mi4 fad8

  %31
  si,1.\fermata

}

IVbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s8
  s1.*2
  s2. s4. <6 4+>
  s2. s4. <_+>
  s1.
  s4. s <6+> <7 _+>
  s1.*21
  s4. <_+> s s
  s s4 <6 4+>8

}

forma = {

  \time 12/8
  \key si\minor
  \tempo 4 = 60
  \partial 8 s8
  s1.*31
  \bar "|."

}


IVvl = {
  \IVglobal
  \notypeset
  <<\IVvln\forma>>
}

IVvlI = {
  \IVglobal
  <<\IVvlIn\forma>>
}

IVvla = {
  \IVglobal
  \clef alto
  <<\IVvlan\forma>>
}

IVvoce = {
  \new Voice = "super"
  \IVglobal
  %\clef soprano
  <<\IVvocen\forma>>
}



IVbc = {
  \IVglobal
  \clef bass
  <<\IVbcn\forma\IVbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


Vglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

Vvln = \relative do'' {

  sol16 sol,32 la si16 si32 do re16 mi32 fad
  sol4 r8
  sol,16 sol'32 la si16 si32 do re16[si']

  %4
  \stemDown la \stemUp re,,32 mi fad16 fad32 sol \stemNeutral la16[do']
  \stemDown si \stemUp sol,32 la si16 si32 do \stemNeutral re16[si']
  la re, sol do, fad si,

  %7
  mi la, re sol, do fad,
  sol sol,32 la si16 si32 do re16[re']
  do re,32 mi fad16 fad32 sol la16 do\mbreak

  %10
  si sol,32 la si16 si32 do re16[si']
  la4 r8
  sol'\p re mib

  %13
  \appoggiatura mib re8. do16 sib8
  do re la
  \appoggiatura la sib8. la16 sol8

  %16
  sib' sol re
  mib16 re do8 sib\tr
  la16 sol' fa?8 mib

  %19
  re16 do sib8 la
  sol16 fa'? mib8 re
  do16 sib' la8 sol

  %22
  fad!8. mi16 re8
  sol,16 \f sol,32 la si?16 si32 do re16 mi32 fad  %%% fine p. 20
  sol16 si do la re re,

  %25
  sol,4 r8
  R4.
  sol16 sol'32 la si16 si32 do re16[si']

  %28
  la4 r8
  \stemDown la16 \stemUp re,,32 mi fad16 fad32 sol \stemNeutral la16 [do']
  si4 r8

  %31
  la16 re, sol do, fad si,
  mi la, re sol, do fad,
  sol re si re sol,8

  %34
  sol'16\p sol,32 la si16 si32 do re16[re']\mbreak
  do re,32 mi fad16 fad32 sol la16 do
  si sol,32 la si16 si32 do re16[si']

  %37
  la re,32 mi fad16 fad32 sol la16[re,]
  sol4 r8
  sol'8\p re mib8

  %40
  \appoggiatura mib? re8. do16 sib8
  do re la
  \appoggiatura la sib8. la16 sol8

  %43
  re' sol re
  mib16 re do8 sib\tr
  la16 sol' fa8 mib\mbreak

  %46
  re16 do sib8 la\tr
  sol16 fa' mib8 re
  do16 sib la8 sol

  %49
  fad!16 mib' re8 do
  sib la sol
  sol' fa mi

  %52
  fa16 mi re dod re8
  sol16 mi mi8.\tr re16
  re\f re,32 mi fad16 fad32 sol la16[fad'!]

  %55
  mi la,32 si dod16 dod32 re mi16[sol]
  fad re,32 mi fad16 fad32 sol la16[la']
  si mi, la re, sol dod,\mbreak

  %58
  re8 sol, la
  re,4 r8
  fad'16\p si,32 do red16 red32 mi fad16[si,]

  %61
  la' si, sol' si, fad' si,
  sol' mi,32 fad sol16 sol32 la si16[mi,]
  mi' la,32 si dod16 dod32 re mi16[la,]

  %64
  sol' la, fad' la, mi' la,
  fad' re,32 mi fad16 fad32 sol la16[re,]
  re' re,mi fad sol la

  %67
  si do re mi fad sol
  la re, sol do, fad si,\mbreak
  mi la, re sol, do fad,

  %70
  sol re si re sol,8
  sol'16 sol,32 la si16 si32 do re16 mi32 fad
  sol4 r8

  %73
  sol'8\p re mib
  \appoggiatura mib? re8. do16 sib8
  do16 mib re do sib la

  %76
  \appoggiatura la sib8. la16 sol8
  sib'16 la sol fa mib re
  mib32(re do8.) mib32[(re do16)]

  %79
  la'16 sol fa mib re do\mbreak
  re32 do sib8. re32 [do sib16]
  sol'16 fa? mib re do sib

  %82
  do32 sib la8. do32 [sib la16]
  la'16 sol fad! mi? re do
  sib8.\tr la16 sol8

  %85
  re' re re
  mib4.
  fad

  %88
  sol8 fad16 mi re8
  sol fad16 mi re do
  \con \tuplet 3/2 { si!16 la sol } la8.\tr [sol16]\mbreak

  %91
  sol\f sol32 la si!16 si32 do re16[sol]
  si, sol32 la si16 si32 do re16[sol]
  fad la la, re re,[fad']

  %94
  sol sol,32 la si16 si32 do re16[sol]
  fad fad,32 sol la16 la32 si do16[la']
  si8 si, la

  %97
  sol4.\fermata

}

VvlIn = \relative do'' {

  sol16 sol,32 la si16 si32 do re16 mi32 fad
  sol4 r8
  sol,16 re'32 re sol16 sol32 la si16[sol']

  %4
  \once \stemDown fad la,,32 la re16 re32 mi fad16 [\once\stemUp la']
  \once\stemDown sol re,32 re sol16 sol32 la si16 [sol']
  la re, sol do, fad si,

  %7
  mi la, re sol, do fad,
  sol sol,32 la si16 si32 do re16[si']
  la16 re,32 mi fad16 fad32 sol la16 la\mbreak

  %10
  sol sol,32 la si16 si32 do re16[sol]
  fad4 r8
  sol'\p re mib

  %13
  \appoggiatura mib re8. do16 sib8
  do re la
  \appoggiatura la sib8. la16 sol8

  %16
  sib' sol re
  mib16 re do8 sib\tr
  la16 sol' fa?8 mib

  %19
  re16 do sib8 la
  sol16 fa'? mib8 re
  do16 sib' la8 sol

  %22
  fad!8. mi16 re8
  sol,16 \f sol,32 la si?16 si32 do re16 mi32 fad  %%% fine p. 20
  sol16 si do la re re,

  %25
  sol,4 r8
  R4.
  sol16 re'32 re sol16[sol32 la] si16 sol'

  %28
  fad4 r8
  \once\stemDown fad16 la,,32 la re16[re32 mi] fad16 la'
  sol4 r8

  %31
  la16 re, sol do, fad si,
  mi la, re sol, do fad,
  sol re si re sol,8

  %34
  sol'16\p sol,32 la si16 si32 do re16[si']\mbreak
  la re,32 mi fad16 fad32 sol la16 la
  sol sol,32 la si16 si32 do re16[sol]

  %37
  fad re32 mi fad16 fad32 sol la16[re,]
  sol4 r8
  sol'8\p re mib8

  %40
  \appoggiatura mib? re8. do16 sib8
  do re la
  \appoggiatura la sib8. la16 sol8

  %43
  re' sol re
  mib16 re do8 sib\tr
  la16 sol' fa8 mib\mbreak

  %46
  re16 do sib8 la\tr
  sol16 fa' mib8 re
  do16 sib la8 sol

  %49
  fad!16 mib' re8 do
  sib la sol
  sol' fa mi

  %52
  fa16 mi re dod re8
  sol16 mi mi8.\tr re16
  la16\f la,32 la re16 re32 mi fad16[re']

  %55
  dod mi,32 mi la16 la32 si dod16[mi]
  re la,32 la re16 re32 mi fad16[fad']
  si mi, la re, sol dod,\mbreak

  %58
  re8 sol, la
  re,4 r8
  red'16\p fad,32 fad si16[si32 do] red16 red

  %61
  fad si, mi si red si
  si si,32 si mi16 mi32 fad sol16[sol]
  dod mi,32 mi la16 la32 si dod16[dod]

  %64
  mi la, re la dod la
  la la,32 la re16 re32 mi fad16[fad]
  re' re,mi fad sol la

  %67
  si do re mi fad sol
  la re, sol do, fad si,\mbreak
  mi la, re sol, do fad,

  %70
  sol re si re sol,8
  sol'16 sol,32 la si16 si32 do re16 mi32 fad
  sol4 r8

  %73
  sol'8\p re mib
  \appoggiatura mib? re8. do16 sib8
  do16 mib re do sib la

  %76
  \appoggiatura la sib8. la16 sol8
  sib'16 la sol fa mib re
  mib32(re do8.) mib32[(re do16)]

  %79
  la'16 sol fa mib re do\mbreak
  re32 do sib8. re32 [do sib16]
  sol'16 fa? mib re do sib

  %82
  do32 sib la8. do32 [sib la16]
  la'16 sol fad! mi? re do
  sib8.\tr la16 sol8

  %85
  re' re re
  mib4.
  fad

  %88
  sol8 fad16 mi re8
  sol fad16 mi re do
  \con \tuplet 3/2 { si!16 la sol } la8.\tr [sol16]\mbreak

  %91
  sol16\f re32 re sol16 sol32 la si!16 re
  sol, re32 re sol16 sol32 la si16 re
  re fad! fad, la re, la'

  %94
  si re,32 re sol16 sol32 la si16[si]
  la re,32 mi fad16 fad32 sol la16[fad']
  sol8 sol, fad

  %97
  sol4.\fermata

}

Vvlan = \relative do' {

  sol'16 sol,32 la si16 si32 do re16 mi32 fad
  sol4 r8
  si,16 si re re sol r

  %4
  fad, fad la la re r
  si si re re sol r
  fad8 mi re

  %7
  do si la
  sol16 sol32 la si16 si32 do re16 r
  r re32 mi fad16 fad32 sol la16 r\mbreak

  %10
  r sol,32 la si16 si32 do re16 r
  re4 r8
  re8 sib' la

  %13
  sib fad! re
  fad la fad
  re4 sib8

  %16
  re re' sib
  sol sol mib
  do do' la

  %19
  fa fa re
  sib sol' sib
  fad! re sib'

  %22
  la4 la8
  sol16\f sol,32 la si!16 si32 do re16 mi32 fad\mbreak
  sol16 si do la re re,

  %25
  sol,4 r8
  R4.
  fad16 si re[re sol] r

  %28
  R4.
  fad,16 fad la la re r
  R4.

  %31
  fad8 mi re
  do si la
  sol4.

  %34
  sol'16\p sol,32 la si16 si32 do re16 r\mbreak
  r re32 mi fad16 fad32 sol la16 r
  r sol,32 la si16 si32 do re16 r

  %37
  r re32 mi fad16 fad32 sol la16 re,
  sol4 r8
  re8\p sib' la

  %40
  sib fad! re
  fad la fad
  re4 sib8

  %43
  re re' sib
  sol sol mib
  do do' la

  %46
  fa fa re
  sib sol' sol
  mib mib do

  %49
  la la' fad!
  re4 re8
  dod re mi

  %52
  la, sol' la
  re, dod4
  fad!16\f fad,32 fad la16 la32 la re16 r

  %55
  dod dod mi mi la r
  fad, fad la la re r
  sol8 fad mi\mbreak

  %58
  re sol la
  re,4 r8
  si\p si si

  %61
  red mi fad
  sol si, si
  la la la

  %64
  dod re mi
  fad la, la
  re'16 re, mi fad sol la

  %67
  si8 sol sol
  fad mi re\mbreak
  do si la

  %70
  sol4.
  sol'16 sol,32 la si16 si32 do re16 mi32 fad
  sol4 r8

  %73
  re8\p sib' la
  sib fad! re
  fad la fad

  %76
  re4 sib8
  re re' sib
  sol sol mib

  %79
  do do' la
  fa fa re
  sib sib' sol

  %82
  mib mib do
  fad! la fad
  re4 sib8

  %85
  sib' re sib
  sol sol do
  la la re,

  %88
  sib re sib
  sib re sib
  re fad fad\mbreak

  %91
  si,!16\f si re re sol sol
  si, si re re sol re
  re re re re re re

  %94
  re re re re re re
  re re re re re re
  re8 re re

  %97
  si4.\fermata

}

Vvocen = \relative do'' {

  \autoBeamOff
  R4.*25
  sol'8. sol,16 sol8
  R4.

  %28
  la'8. re,16 re8
  R4.
  sol,16 sol sol8 sol'

  %31
  la[sol fad]
  mi[re] do
  si8. la16 sol8

  %34
  re'8. re16 re re\mbreak
  do8 re,8. do'16
  si8[re,] si'

  %37
  la8. re,16 re8
  R4.
  sol'8 [re] mib8

  %40
  \appoggiatura mib? re8. do16 sib8
  do re la
  \appoggiatura la sib8. la16 sol8

  %43
  re' sol re
  mib16 [re do8 sib\tr]
  la16 [sol' fa8 mib]\mbreak

  %46
  re16 [do sib8 la\tr]
  sol16 [fa' mib8 re]
  do16 [sib la8 sol]

  %49
  fad!16 [mib' re8 do]
  sib [la sol]
  sol' fa mi

  %52
  fa16 [mi re dod] re8
  sol16 [mi] mi8.\tr re16
  re4 r8

  %55
  R4.*4
  re8. la16 la8
  fad'8. si,16 si8

  %61
  fad' sol la
  sol8. fad16 mi8
  mi8. la,16 la8

  %64
  mi' fad sol
  fad8. mi16 re8
  r16 re,16[mi fad sol la]

  %67
  si[do re  mi fad sol]
  la8[sol fad]\mbreak
  mi[re] do

  %70
  si8. la16 sol8
  R4.*2
  sol'8 [re] mib
  \appoggiatura mib? re8. do16 sib8
  do16 [mib] re [do] sib [la]

  %76
  \appoggiatura la sib8. la16 sol8
  sib'16 [la] sol [fa] mib [re]
  mib32[(re do8.)] mib32[(re do16)]

  %79
  la'16 [sol fa mib re do]\mbreak
  re32 [do sib8.] re32 [do sib16]
  sol'16 [fa? mib re do sib]

  %82
  do32 [sib la8.] do32 [sib la16]
  la'16 [sol fad! mi? re do]
  sib8.\tr la16 sol8

  %85
  re' re re
  mib4.
  fad

  %88
  sol8 fad16 [mi] re8
  sol fad16 [mi] re [do]
  \con \tuplet 3/2 { si!16 [la sol] } la8.\tr sol16\mbreak

  %91
  sol4 r8
  si re sol
  \appoggiatura si, la4\tr sol8

  %94
  sol4.
  R4.*3

}

Vtesto = \lyricmode {

  Suscitans _ _ suscitans _ _ suscitans _ _ a ter - ra

  inopem _ _ suscitans _ _ a terra _ a terra _ inopem _ _ et de stercore _ _ erigens _ _ pauperem _ _

  erigens _ _ pau - - - - - - - perem _ e -- rigens _ pauperem. _ _

  Suscitans _ _ suscitans _ _ a terra _ inopem _ _  suscitans _ _ a terra _ inopem _ _

  a ter - - ra inopem _ _ et de stercore _ _ erigens _ _ pauperem _ _

  erigens _ _ pau - - - - - - - - - perem _ erigens _ _ pau - - perem _ erigens _ _ pau - pe -- rem

  erigens _ _ pauperem. _ _




}

Vbcn = \relative do {

  sol'16 sol,32 la si16 si32 do re16 mi32 fad
  sol4 r8
  sol,16 sol' sol sol sol, r

  %4
  re re' re re re, r
  sol sol' sol sol sol, r
  fad'8 mi re

  %7
  do si la
  sol16 sol32 la si16 si32 do re16 r
  r re32 mi fad16 fad32 sol la16 r\mbreak

  %10
  r sol,32 la si16 si32 do re16 r
  re4 r8
  sol,8^\p _\markup\italic"Senza Org." sol'-. fad-.

  %13
  sol-. re-. sol,-.
  la'-. fad-. re-.
  sol-. re-. sol,-.

  %16
  sol' sib sol
  do mib, do
  fa la fa

  %19
  sib re, sib
  mib do' sib
  la fad? sol

  %22
  re re, re
  sol'16\f\tu sol,32 la si!16 si32 do re16 mi32 fad\mbreak
  sol16 si do la re re,

  %25
  sol,4 r8
  R4.
  sol16 sol' sol sol sol, r

  %28
  re'4 r8
  re,16 re' re re re, r
  sol4 r8

  %31
  fad' mi re
  do si la
  sol4.

  %34
  sol'16 sol,32 la si16 si32 do re16 r\mbreak
  r re32 mi fad16 fad32 sol la16 r
  r sol,32 la si16 si32 do re16 r

  %37
  r re32 mi fad16 fad32 sol la16 re,
  sol4 r8
  sol,_\markup\italic"Senza Org." sol' fad

  %40
  sol re sol,
  la' fad re
  sol re sol,

  %43
  sol' sib sol
  do mib, do
  fa la fa\mbreak

  %46
  sib re, sib
  mib do' sib
  la do, la

  %49
  re fad! re
  sol re sib
  la si! dod

  %52
  re mi fa
  sol la la,
  re16\tu re re re re, r

  %55
  la' la' la la la, r
  re re re re re, r
  sol'8 fad mi\mbreak

  %58
  re sol la
  re,4 r8
  si si si

  %61
  si si si
  mi mi mi
  la, la la

  %64
  la la la
  re re re
  re'16 re, mi fad sol la

  %67
  si8 sol sol
  fad mi re\mbreak
  do si la

  %70
  sol4.
  sol'16 sol,32 la si16 si32 do re16 mi32 fad
  sol4 r8

  %73
  sol,_\markup\italic"Senza Org." sol' fad
  sol re sol,
  la' fad re

  %76
  sol re sol,
  sol' sib sol
  do mib, do

  %79
  fa la fa\mbreak
  sib re, sib
  mib sol mib

  %82
  la do, la
  re fad! re
  sol re sol,

  %85
  sol' sib sol
  do, mib do
  re re' do

  %88
  sol sol, sol'
  sol sol, sol'
  sol re re,\mbreak

  %91
  sol16 sol' sol sol sol, sol'
  sol, sol' sol sol sol, sol'
  re, re' re re re, re'

  %94
  sol, sol' sol sol sol,[sol']
  re re' re re re,[re']
  sol,8 re re,

  %97
  sol4.\fermata

}

Vbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4.*5
  <6>8 <6> <8>
  <6> <6> <6>
  s4.*27
  s16 <7> s4
  s4.*18
  <_+>4.
  <_+>
  s4.*4
  <_+>4.
  <7 5>8 <6 4> <7 5>
  s4.
  <_+>
  <7 5>8 <6 4> <7 5>
  s4.*25
  <_!>4.
  s
  s
  <_+>
  s
  <_+>
  s8 <6 4> <5 3>

}

forma = {

  \time 3/8
  \override Staff.TimeSignature.style = #'single-digit
  \key sol\major
  \tempo 4 = 77
  s4.*97
  \bar "|."

}


Vvl = {
  \Vglobal
  \notypeset
  <<\Vvln\forma>>
}

VvlI = {
  \Vglobal
  <<\VvlIn\forma>>
}

Vvla = {
  \Vglobal
  \clef alto
  <<\Vvlan\forma>>
}

Vvoce = {
  \new Voice = "suscitans"
  \Vglobal
  %\clef soprano
  <<\Vvocen\forma>>
}



Vbc = {
  \Vglobal
  \clef bass
  <<\Vbcn\forma\Vbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

VIvln = \relative do'' {

  do8
  mi[re16 do sol'8 do,]
  si do fa4~
  fa8[mi16 re mi8 re16 do]

  %4
  re8 sol, fa'4~
  fa8[mi16 re mi8 re16 do]
  re4 r8 sol,

  %7
  sol si4 re8~
  re mi4 fad8
  sol re4 mi8

  %10
  re do4 si8
  mi re4 do8
  si la16 sol sol'8 re\mbreak

  %13
  si la16 sol sol'8 re
  si [la16 sol sol'8 re]
  si la16 sol la4\tr

  %16
  sol4 r8 do\p
  mi[re16 do] sol'8 do,

  %18
  si do fa4~
  fa8 mi16 re mi8 re16 do
  re4 fa~

  %21
  fa8 mi16 re mi8 re16 do
  re4 r
  sol,8 si4(do8)

  %24
  re mi4 fa8\mbreak
  mi[sol16 fa mi8 re16 do]
  re8[si la sol]

  %27
  mi'[sol16 fa mi8 re16 do]
  re8[si la sol]
  mi' re16 do sol'8 fa16 mi

  %30
  re8 sol, r4
  sol8 si4 re8~
  re mi4 fad8

  %33
  sol fad4 mi8
  re do4 si8
  mi re4 do8

  %36
  si8[la16 sol] sol'8[re]\mbreak
  si[la16 sol] sol'8[re]
  si la16 sol la4\tr

  %39
  sol8\f re' si la16 sol
  si'8 la4 sol8
  fad[mi16 re la'8 fad]

  %42
  sol[re si' sol]
  fad[mi16 re la'8 fad]
  sol si, la4

  %45
  sol r8 re'\p
  fad fad fad  sol16 la\mbreak
  do,8 do4 do8~
  do si16 do re do si la

  %49
  si la sol8 r4
  sol8 si re fa!
  mi sol4 do,8

  %52
  si16[do] re4 fa8
  mi sol4 do,8
  si16[do] re4 fa8

  %55
  mi[re16 do] re8[do16 si]\mbreak
  do8[sol do fa]
  mi[re16 do] re8[do16 si]

  %58
  do16[re mi fa sol8 mi]
  re sol, r re'
  re sol, sol mi'

  %61
  re sol,4.
  fa'8 sol, sol fa'
  mi do r4

  %64
  mib8 re16 mib fa8 mib16 re
  mib8[do si do]
  re16[mib] fa4 re8\mbreak

  %67
  mib8[do si do]
  re16[mib] fa4 re8
  mib16 re do8 r4

  %70
  sol'8 sol, sol do
  si16 do re8 do8[si]
  do16[re mi fa] sol8 [sol,]

  %73
  do[fa mi re]
  do16[re mi fa sol8 sol,]
  do[fa mi re]

  %76
  mi\tr[re16 do] re8\tr[do16 si]
  mi8\tr[re16 do] re8\tr[do16 si]\mbreak
  do16[re mi fa] sol8 do,

  %79
  mi4(re\tr)
  do r8 sol'~
  sol fa4 mi8~

  %82
  mi re4 do8~
  do16[re mi fa] sol[fa mi re]
  do[re mi fa] sol8 do,

  %85
  re2\tr
  mi8\f[re16 do sol'8 do,]
  si do r si'~

  %88
  si la4 sol8~\mbreak
  sol fa4 mi16 re
  do re mi fa sol8 do,

  %91
  si[sol' re mi16 fa]
  mi8[sol re mi16 fa]
  mi8[sol re mi16 fa]

  %94
  mi8[do re si]
  do2\fermata

}

VIvlIn = \relative do'' {

  r8
  sol'4 sol
  \repeat unfold 13{sol4 sol}
  sol fad

  %16
  sol r
  sol\p sol
  \repeat unfold 15{sol sol}

  %33
  sol la
  sol la
  sol la

  %36
  sol sol\mbreak
  sol sol
  sol fad

  %39
  sol\f re'
  re re
  re re

  %42
  re re
  re re
  re re

  %45
  si r
  re\p re\mbreak
  re re

  %48
  re re
  re sol,
  \repeat unfold 36 {sol sol}

  %86
  sol\f sol
  \repeat unfold 7{sol4 sol}{sol4 sol}
  mi2\fermata

}

VIvlan = \relative do' {

  r8_\markup\italic"Violetta con il Bas[so]"
  do[re mi do]
  sol'[do, si sol]
  sol'[si, do do']

  %4
  si[sol si, sol]
  sol'[si, do do']
  sol[si, la sol]

  %7
  sol'[sol, la si]
  do[do' do, do']
  si[la sol do,]

  %10
  sol'[sol, si sol]
  sol' [la si fad]
  sol[sol, si sol]\mbreak

  %13
  sol'[sol, si sol]
  sol'[sol, si sol]
  sol' sol, re' re,

  %16
  sol4 r
  do8[re mi do]
  sol'[do, si sol]

  %19
  sol'[si, do do']
  sol[si, la sol]
  sol'[si, do do']

  %22
  si[sol mi do]
  si[sol' fa mi]
  sol,[do' do, si]\mbreak

  %25
  do[si' do do,]
  sol'[sol, la si]
  do[si' do do,]

  %28
  sol' [sol, la si]
  do[do' si do]
  sol[si do do,]

  %31
  si[la sol sol']
  do,[do' do re,]
  re[re' re re,]

  %34
  re[re' re re,]
  re[re' re re,]
  sol[sol, si sol]\mbreak

  %37
  sol'[sol, si sol]
  sol' sol, re' re,
  sol[si' sol si,]

  %40
  sol'[re' do si]
  la[fad re re']
  si[sol sol, sol']

  %43
  re'[fad, re re']
  si sol re re,
  sol [sol' si sol]

  %46
  re[re' la fad]\mbreak
  re[mi fad mi]
  re [mi fad re]

  %49
  sol[la si sol]
  sol,[la si sol]
  do[re mi do]

  %52
  sol[la si sol]
  do[re mi do]
  sol[la si sol]

  %55
  do[do' si sol]\mbreak
  do,[re mi si]
  do mi sol sol,

  %58
  do[re mi do]
  sol'[la si sol]
  sol,[la si do]

  %61
  si[do si la]
  sol[la si sol]
  do[re mib re]

  %64
  do[do' sol si]
  do[do, sol' do,]
  si[do re si]\mbreak

  %67
  do[do' sol do,]
  si[do re si]
  do[re mib re]

  %70
  do[re mi? do]
  sol'[la si sol]
  do,[re mi re]

  %73
  do[sol la si]
  do[re mi re]
  do[sol la si]

  %76
  do[do' si sol]
  do,[do' si sol]\mbreak
  do,[re mi re]

  %79
  do[fa sol sol,]
  do[re mi do]
  si[la sol si]

  %82
  do[re mi fa]
  mi[do si sol]
  do[re mi do]

  %85
  sol'[fa sol sol,]
  do\f[re mi do]
  sol'[do, mi do]

  %88
  si[sol la si]\mbreak
  do[sol la si]
  do[re mi do]

  %91
  sol'[la si sol]
  do,[do' si sol]
  do,[do' si sol]

  %94
  do,[do' sol sol,]
  do2\fermata



}

VIvocen = \relative do'' {

  \autoBeamOff
  r8
  R2*15
  r4 r8 do8
  mi[re16 do] sol'8 do,

  %18
  si do fa4~
  fa8 mi16[re] mi8 re16[do]
  re4 fa~

  %21
  fa8 mi16[re] mi8 re16[do]
  re4 r
  sol,8 si4(do8)

  %24
  re mi4 fa8\mbreak
  mi[sol16 fa mi8 re16 do]
  re8[si la sol]

  %27
  mi'[sol16 fa mi8 re16 do]
  re8[si la sol]
  mi' re16[do] sol'8 fa16[mi]

  %30
  re8 sol, r4
  sol8 si4 re8~
  re mi4 fad8

  %33
  sol fad4 mi8
  re do4 si8
  mi re4 do8

  %36
  si8[la16 sol] sol'8[re]\mbreak
  si[la16 sol] sol'8[re]
  si la16 sol la4\tr

  %39
  sol4 r
  R2*5
  r4 r8 re'

  %46
  fad fad fad  sol16[la]\mbreak
  do,8 do4 do8~
  do si16[do] re[do] si[la]

  %49
  si[la] sol8 r4
  sol8 si re fa!
  mi sol4 do,8

  %52
  si16[do] re4 fa8
  mi sol4 do,8
  si16[do] re4 fa8

  %55
  mi[re16 do] re8[do16 si]\mbreak
  do8[sol do fa]
  mi[re16 do] re8[do16 si]

  %58
  do16[re mi fa sol8 mi]
  re sol, r re'
  re sol, sol mi'

  %61
  re sol,4.
  fa'8 sol, sol fa'
  mi do r4

  %64
  mib8 re16[mib] fa8 mib16[re]
  mib8[do si do]
  re16[mib] fa4 re8\mbreak

  %67
  mib8[do si do]
  re16[mib] fa4 re8
  mib16[re] do8 r4

  %70
  sol'8 sol, sol do
  si16[do] re8 do8[si]
  do16[re mi fa] sol8 [sol,]

  %73
  do[fa mi re]
  do16[re mi fa sol8 sol,]
  do[fa mi re]

  %76
  mi\tr[re16 do] re8\tr[do16 si]
  mi8\tr[re16 do] re8\tr[do16 si]\mbreak
  do16[re mi fa] sol8 do,

  %79
  mi4(re\tr)
  do r8 sol'~
  sol fa4 mi8~

  %82
  mi re4 do8~
  do16[re mi fa] sol[fa mi re]
  do[re mi fa] sol8 do,

  %85
  re2\tr
  do4 r
  R2*9

}

VItesto = \lyricmode {

  Ut collocet _ _ eum _ cum principibus _ _ _ cum principibus _ _ _ cum principibus _ _ _

  po - - - - - puli _ sui _ cum princi - pibus _ po - - - - - - - - - - - - - puli _ sui _

  Qui habitare _ _ _ facit _ ste -- rilem _ in domo _ matrem _ filio - - rum

  laetan - - - - - - - - - - - - - - - - tem

  qui habitare _ _ _ facit _ ste -- rilem _ in domo _ sterilem _ _ in do - - - - - - - - mo

  matrem _ filio - - rum laetan - - - - - - - - - - tem

  lae -- tantem _ ma -- trem fi -- lio - - - rum laetantem. _ _

}

VIbcn = \relative do {

  r8
  do[re mi do]
  sol'[do, si sol]
  sol'[si, do do']

  %4
  si[sol si, sol]
  sol'[si, do do']
  sol[si, la sol]

  %7
  sol'[sol, la si]
  do[do' do, do']
  si[la sol do,]

  %10
  sol'[sol, si sol]
  sol' [la si fad]
  sol[sol, si sol]\mbreak

  %13
  sol'[sol, si sol]
  sol'[sol, si sol]
  sol' sol, re' re,

  %16
  sol4 r
  do8[re mi do]
  sol'[do, si sol]

  %19
  sol'[si, do do']
  sol[si, la sol]
  sol'[si, do do']

  %22
  si[sol mi do]
  si[sol' fa mi]
  sol,[do' do, si]\mbreak

  %25
  do[si' do do,]
  sol'[sol, la si]
  do[si' do do,]

  %28
  sol' [sol, la si]
  do[do' si do]
  sol[si do do,]

  %31
  si[la sol sol']
  do,[do' do re,]
  re[re' re re,]

  %34
  re[re' re re,]
  re[re' re re,]
  sol[sol, si sol]\mbreak

  %37
  sol'[sol, si sol]
  sol' sol, re' re,
  sol[si' sol si,]

  %40
  sol'[re' do si]
  la[fad re re']
  si[sol sol, sol']

  %43
  re'[fad, re re']
  si sol re re,
  sol [sol' si sol]

  %46
  re[re' la fad]\mbreak
  re[mi fad mi]
  re [mi fad re]

  %49
  sol[la si sol]
  sol,[la si sol]
  do[re mi do]

  %52
  sol[la si sol]
  do[re mi do]
  sol[la si sol]

  %55
  do[do' si sol]\mbreak
  do,[re mi si]
  do mi sol sol,

  %58
  do[re mi do]
  sol'[la si sol]
  sol,[la si do]

  %61
  si[do si la]
  sol[la si sol]
  do[re mib re]

  %64
  do[do' sol si]
  do[do, sol' do,]
  si[do re si]\mbreak

  %67
  do[do' sol do,]
  si[do re si]
  do[re mib re]

  %70
  do[re mi? do]
  sol'[la si sol]
  do,[re mi re]

  %73
  do[sol la si]
  do[re mi re]
  do[sol la si]

  %76
  do[do' si sol]
  do,[do' si sol]\mbreak
  do,[re mi re]

  %79
  do[fa sol sol,]
  do[re mi do]
  si[la sol si]

  %82
  do[re mi fa]
  mi[do si sol]
  do[re mi do]

  %85
  sol'[fa sol sol,]
  do\f[re mi do]
  sol'[do, mi do]

  %88
  si[sol la si]\mbreak
  do[sol la si]
  do[re mi do]

  %91
  sol'[la si sol]
  do,[do' si sol]
  do,[do' si sol]

  %94
  do,[do' sol sol,]
  do2\fermata

}

VIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  s8
  s2
  s
  <7>
  s
  <7>
  s
  s
  s4 s8 <6 4+>
  s2
  s
  s4 s8 <6 5>
  s2*3
  s4 <_+>
  s2
  s
  s
  <7>
  s
  <7>
  s2*10
  <9>8 <8>4 <_+>8
  <4>4 <6 3+>
  <6 4> <7 5 3+>
  <6 4> <7 5 3+>
  s2*10
  <_+>2
  <7>
  s
  s
  s4 s8 <7->
  s2*5
  s4 s8 <6 5>
  s2*7
  <_+>2
  <_->
  s
  <_->
  s
  <_->
  <_!>
  s
  s
  s8 <7> s4
  s2
  s8 <7> s4
  s2*5
  s4 <7>
  s2*6
  s8 <7> s4
  s8 <7> s4

}

forma = {

  \time 2/4
  \key do\major
  \tempo 2 = 57
  \partial 8 s8
  s2*95
  \bar "|."

}


VIvl = {
  \VIglobal
  \notypeset
  <<\VIvln\forma>>
}

VIvlI = {
  \VIglobal
  <<\VIvlIn\forma>>
}

VIvla = {
  \VIglobal
  \clef alto
  <<\VIvlan\forma>>
}

VIvoce = {
  \new Voice = "ut"
  \VIglobal
  %\clef soprano
  <<\VIvocen\forma>>
}



VIbc = {
  \VIglobal
  \clef bass
  <<\VIbcn\forma\VIbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

VIIfln = \relative do'' {

  mi8 \appoggiatura re do16 si la8 la'16 mi \appoggiatura mi8 fa mi r la
  si16 la sold fa mi8 si' \appoggiatura si do16 si la8 r mi
  fa re'~re16.[do32 si la sol fa] mi8 do'~do16.[si32 la sol fa mi]

  %4
  re8 si'~si16.[la32 sold fad mi re] do8\tr re\tr mi\tr fa?\tr
  fa\tr mi r la fa\tr mi r mi\mbreak
  fa8 mi16 re sold8 fad16 mi la8 mi r si'

  %7
  do si16 la sold8.\tr la16 la4\fermata r
  R1*2
  la8 \once\tieDashed re~ re16 do si la si2\mbreak

  %11
  sol8.[re'16 do si la sol] la2
  re,16 re mi fa mi mi fa sol si, si do re do do re mi
  re8 si re4~re8 do16 si do4~

  %14
  do si do8[sol' \appoggiatura fa mi re16 do]
  la'8 sol r do re16[do si la sol fa mi re]
  mi mi fa sol fa fa sol la sol8 do,16 re re4\tr\mbreak

  %17
  do4 r r2
  r r4 re(
  do8)[si16 la si8 la16 sold] la8 mi' la4~

  %20
  la8[sol16 fa mi8 re] do la r4
  re8 [fa la re16 la]\mbreak si2
  do,16[re mi fa sol la si do] la2

  %23
  si,16[do re mi fa sol la si] sold2
  la4 r8 do do16 re do8 r16 do re do
  si do si8 r16 si do si la si la8 r16 la si la

  %26
  sold8 mi sold si do2
  la4 sold\tr \mbreak la16[sol? fa mi re do si la]
  mi'4 r r2

  %29
  la8[re, re re16 mi] fa!4 sold
  la sold\tr\fermata la2

}

VIIvln = \relative do'' {

  r8 mi,\p mi mi r mi mi mi
  r sold sold sold r mi mi mi
  r la la si r sol sol la

  %4
  r fa fa la do8\tr re\tr mi\tr fa?\tr
  fa\tr mi r la fa\tr mi r mi\mbreak
  la, la si si do re mi mi,

  %7
  do' do si si do4\fermata r
  R1*6
  r2 r8 sol\p sol sol

  %15
  r sol sol sol r sol sol sol
  r mi' do do mi mi re re\mbreak
  mi4 r r2

  %18
  R1*6
  la4 r8 do do16 re do8 r16 do re do
  si do si8 r16 si do si la si la8 r16 la si la

  %26
  sold8 mi sold si do2
  la4 sold\tr \mbreak la16[sol? fa mi re do si la]
  mi'4 r r2

  %29
  la8[re, re re16 mi] fa!4 sold
  la sold\tr\fermata la2

}

VIIvlIn = \relative do'' {

  r8 do,\p do do r do do do
  r mi mi  mi r do do do
  r fa fa fa r mi mi mi

  %4
  r re re fa mi re do re
  re do do do re do do do\mbreak
  fa fa mi mi mi re do si

  %7
  mi mi mi mi do4\fermata r
  R1*6
  r2 r8 mi\p mi mi

  %15
  r mi mi mi r re re re
  r sol la la do do do si\mbreak
  do4 r r2

  %18
  R1*6
  r8 do,\p do do do do do do
  re si si si do fad fad fad

  %26
  sold sold sold sold mi mi mi mi
  mi mi mi mi\mbreak mi mi mi mi
  do la la la re re mi mi

  %29
  fa fa fa mi re re mi mi
  la, la mi'[mi] la,2\fermata

}

VIIvlan = \relative do' {

  r8 la\p la la r la la la
  r mi' mi mi r la, la la
  r re re re r do do do

  %4
  r si si si la la la la
  la la la la la la la la\mbreak
  re re re re do si la sold

  %7
  la la mi' [mi,] la4\fermata r
  R1*6
  r2 r8 do\p do do

  %15
  r do do do r si si si
  r do fa fa do do sol sol\mbreak
  do4 r r2

  %18
  R1*6
  r8 la\p la la la la la la
  si sold sold sold la red red red

  %26
  mi mi mi mi la, la la la
  la la mi' mi\mbreak la, la la la
  la la la la re re mi mi

  %29
  fa fa fa mi re re mi mi
  la, la mi'[mi] la,2\fermata

}

VIIvocen = \relative do'' {

  \autoBeamOff

  R1*6
  r2 mi8\fermata \appoggiatura re do16 si la8 la'16 mi
  fa\tr mi mi8 re4~re8 fa mi16[re] do si

  %9
  do[si] la8 r4 mi'8 la la16[sol] fa mi
  fa2 re8. [la'16 sol fa mi re]\mbreak
  mi2 do8.[sol'16 fa mi re do]

  %12
  si[si do re] do[do re mi] re[re mi fa] mi[mi fa sol]
  si,8 sol fa'4~fa8 mi16[re] mi8 re16 do
  re2 do4 r

  %15
  R1*2\mbreak
  sol'8 \appoggiatura fa mi16 re do8 sol'16 mi mi\tr re re8 r4
  la'8 \appoggiatura sol fa16 mi re8 la'16 fa fa\tr mi mi8 fa4(

  %19
  mi8) re16[do] re8 do16 si do8 la r4
  r2 la8 do mi la16 mi
  fa2\mbreak sol,16[la si do re mi fa sol]

  %22
  mi2 fa,16[sol la si do re mi fa]
  re2 mi,16 [fad sold la si do re mi]
  do4 r8 mi mi16[fa mi8] r16 mi [fa mi]

  %25
  re [mi re8] r16 re [mi re] do [re do8] r16 do [re do]
  si4 r la8 do mi la16 mi
  fa[mi re do] si4\tr \mbreak la r

  %28
  mi'8 la, la la16 la sib4 dod
  re1
  do16 [mi re do] si4\tr la2\fermata

}

VIItesto = \lyricmode {

  Gloria _ _ Patri _ et Fílio _ _ et Spiritui _ _ _ Sancto _

  et Spiritui _ _ _ Sanc - - - - - - - - to et Spiritui _ _ _ Sancto _

  Gloria _ _ Patri _ et Fílio _ _ Gloria _ _ Patri _ et Fílio _ _ et Spiritui _ _ _ Sancto _

  et Spiritui _ _ _ Sanc - - - - - - - - - - - - - to et Spiritui _ _ _ Sanc - to

  et Spiritui _ _ _ Sanc - - - - to.

}

VIIbcn = \relative do {

  R1*6
  la4 mi' <<la,4\fermata\\{ r8 la la la}>>
  r 8do' si la sold re' sold, mi

  %9
  la la, la la r la la la
  r re re re r sol sol sol\mbreak
  r do, do do r fa fa fad

  %12
  sol1~
  sol8 si, la sol sol' sol, do do'
  sol fa sol sol, do4 r

  %15
  R1*2
  r8 do do do r sol' sol dod,
  r re re re r la' re sold,

  %19
  la la, re mi la, si do re
  mi4. sold8 la la, la la
  r re re re\mbreak r sol sol sol

  %22
  r do, do do r fa fa fa
  r si, si si r mi mi mi
  la,4 r r2

  %25
  R1*6

}

VIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1*7
  s2 <6 5>4 s8 <7>
  s1*2
  s2 s4 s8 <6 5>
  <5 3>4 <6 4> <7 5> <6 4>
  <5 3>2 <7>
  s1*4
  s2 s4 s8 <7>
  s1
  <6 4>4 s8 <6 5> s2

}

forma = {

  \time 4/4
  \key la\minor
  \tempo 4 = 40
  s1*30
  \bar "||"
  \mark\markup\smaller \center-column{"D.C.""al S."}

}


VIIfl = {
  \VIIglobal
  \notypeset
  <<\VIIfln\forma>>
}


VIIvl = {
  \VIIglobal
  <<\VIIvln\forma>>
}

VIIvlI = {
  \VIIglobal
  <<\VIIvlIn\forma>>
}

VIIvla = {
  \VIIglobal
  \clef alto
  <<\VIIvlan\forma>>
}

VIIvoce = {
  \new Voice = "gloria"
  \VIIglobal
  %\clef soprano
  <<\VIIvocen\forma>>
}



VIIbc = {
  \VIIglobal
  \clef bass
  <<\VIIbcn\forma\VIIbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

VIIIvln = \relative do'' {

  re16
  re4 sol8. la16
  sol4(fad8.) sol16
  la8 do,16. re32 la8 si16. do32

  %4
  do4(si16.) sol'32 la16. si32
  si,8. [si16 dod8. re16]
  dod8 la' r16 mi fad16. sol32

  %7
  fad8 la r16 mi fad16. sol32
  fad8 mi16. re32 mi4\tr
  re r

  %10
  R2*7
  la4 re8. mi16
  re4(dod8) mi

  %19
  fad8 sol16 la la,8 sol'
  fad mi16 re mi4\tr
  re re8\p re\mbreak

  %22
  re fa mi16 re do si
  do8. si16 la4
  r do8 do

  %25
  do mi re16 do si la
  si8. la16 sol8 re'16 mi
  re4(do8) do16 re

  %28
  si re do si do re mi fad
  sol8 fad16 mi re do si la
  si8 la16 sol la4\tr \mbreak

  %31
  sol sol16 la si do
  re8 do16 si do re mi fad
  sol8 sol, la4\tr

  %34
  re4\f sol8. la16
  sol4 fad8 sol
  la16[sol fad mi re do si la]

  %37
  si8 la16 sol la4\tr
  sol2\fermata

}

VIIIvlIn = \relative do'' {

  re16
  re4 sol8. la16
  sol4(fad8.) sol16
  la8 do,16. re32 la8 si16. do32

  %4
  do4(si16.) sol'32 la16. si32
  si,8. [si16 dod8. re16]
  dod8 la' r16 mi fad16. sol32

  %7
  fad8 la r16 mi fad16. sol32
  fad8 mi16. re32 mi4\tr
  re r

  %10
  R2*7
  la4 re8. mi16
  re4(dod8) mi

  %19
  fad8 sol16 la la,8 sol'
  fad mi16 re mi4\tr
  re re8\p re\mbreak

  %22
  re fa mi16 re do si
  do8. si16 la4
  r do8 do

  %25
  do mi re16 do si la
  si8. la16 sol8 re'16 mi
  re4(do8) do16 re

  %28
  si re do si do re mi fad
  sol8 fad16 mi re do si la
  si8 la16 sol la4\tr \mbreak

  %31
  sol sol16 la si do
  re8 do16 si do re mi fad
  sol8 sol, la4\tr

  %34
  re4\f sol8. la16
  sol4 fad8 sol
  fad16[mi re do si la sol fad]

  %37
  sol4 fad
  sol2\fermata

}

VIIIvlan = \relative do' {

  r16
  si'4 si8. do16
  si4 la8. sol16
  fad4 fad8. fad16

  %4
  re4 re8. si'16
  re,8.[sol16 la8. si16]
  mi,8 dod r16 dod re16. mi32

  %7
  re8 fad r16 dod re16. mi32
  re8 re4 dod8
  re4 r

  %10
  R2*7
  fad4 fad8. sol16
  fad4 mi8 dod

  %19
  la4 dod
  la dod
  la r\mbreak

  %22
  r8 la'\p [si sold]
  mi[re mi do]
  la[do' la fad]

  %25
  la4. fad8
  re4. si'8
  si4 la8 fad

  %28
  re4 fad
  re8 mi la, fad'
  re4 fad\mbreak

  %31
  re8 si re4
  si fad'
  re re8 fad

  %34
  si4\f si8. do16
  si4 la8 si
  la4 fad

  %37
  re re
  si2\fermata

}

VIIIvocen = \relative do'' {

  \autoBeamOff

  r16
  R2*9
  re16[do si la] sol8 mi'\mbreak
  mi[re16 do] re4

  %12
  fad,16[sol] la[si] do8 do
  do si16[la] si4
  mi16[fad] sol[fad] mi[re] dod[si]

  %15
  la8 si16[dod] re8 sol
  fad mi16[re] mi4\tr
  re r

  %18
  R2*3
  r4 re8 re\mbreak
  re fa mi16 [re] do [si]

  %23
  do8. si16 la4
  r do8 do

  %25
  do mi re16 [do] si [la]
  si8. la16 sol8 re'16 [mi]
  re4(do8) do16 [re]

  %28
  si [re] do [si] do [re] mi [fad]
  sol8 fad16 mi re [do] si [la]
  si8 la16 [sol] la4\tr \mbreak

  %31
  sol sol16 [la] si [do]
  re8 do16 si do [re] mi [fad]
  sol8 sol, la4\tr

  %34
  sol2
  R2*4

}

VIIItesto = \lyricmode {

  Gloria _ _ Patri _ Gloria _ _ et Filio _ _ et Spiritui _ _ Sancto _ et Spi -- ritui _ Sancto _

  Sicut _ erat _ in principio _ _ _ sicut _ erat _ in prin -- cipio _ _

  et nunc et semper _ et in sæcula _ _ sæcu - lorum _ a -- men

  et in sæcula _ _ sæculorum _ _ _ a -- men.

}

VIIIbcn = \relative do {

  r16
  r8 sol[sol' sol,]
  r re'[re' re,]
  r re[re' re,]

  %4
  r8 sol,[sol' sol,]
  r8 sol[sol' sol,]
  r la[la' la,]

  %7
  r la[la' la,]
  r re[la' la,]
  re[do si la]

  %10
  sol[sol sol' sol,]\mbreak
  r8 sol[sol' sol,]
  r re'[re' re,]

  %13
  r8 sol,[sol' sol,]
  r8 sol[sol' sol,]
  r la' [fad dod]

  %16
  re[si' la la,]
  re,[re' re' re,]
  r la[la' la,]

  %19
  r la[la' la,]
  r re[la' la,]
  re,[re' re' re,]\mbreak

  %22
  r re'[sold, mi]
  la[si do la]
  fad[la fad re]

  %25
  r do'[fad, re]
  sol[sol, sol' sol,]
  r re'[re' re,]

  %28
  r sol[re do]
  si do fad,[re]
  sol sol' re re,\mbreak

  %31
  sol[sol' re si]
  sol[sol' re do]
  si[sol re' re,]

  %34
  sol[sol sol' sol,]
  r re'[re' re,]
  r re[re' re,]

  %37
  sol sol, re' re,
  sol2\fermata

}

VIIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s16
  s2*6
  s8 <6 4> <3+> s
  s2*4
  s4 <7>
  s2
  <6>2
  s2*3
  s8 <6 4> <5 3+> s
  s4 s8 <7>
  s4 <_+>
  s2
  s8 <_-> s4
  s2*4
  s8 <6 4> <7> s
  s2*7
  s8 <5 4> <3> <6 4>
  s8 <5 3>

}

forma = {

  \time 2/4
  \key sol\major
  \tempo 2 = 53
  \partial 16 s16
  s2*38
  \bar "|."

}


VIIIvl = {
  \VIIIglobal
  \notypeset
  <<\VIIIvln\forma>>
}

VIIIvlI = {
  \VIIIglobal
  <<\VIIIvlIn\forma>>
}

VIIIvla = {
  \VIIIglobal
  \clef alto
  <<\VIIIvlan\forma>>
}

VIIIvoce = {
  \new Voice = "sicut"
  \VIIIglobal
  %\clef soprano
  <<\VIIIvocen\forma>>
}



VIIIbc = {
  \VIIIglobal
  \clef bass
  <<\VIIIbcn\forma\VIIIbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IXglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

IXvln = \relative do'' {

  R4.*14
  sol16[fad sol la si sol]
  la[sol la si do la]

  %17
  si[la si do re si]
  do[si do re mi do]
  si8 sol'16 la si8

  %20
  si sol mi~
  mi fad16 sol la8
  la fad re~

  %23
  re mi16 fad sol8
  sol mi do~
  do16 fad la do, si la

  %26
  si8 si'16 do re8
  r si16 do re8
  si do la\mbreak

  %29
  sol4 r8
  R4.*7

  %37
  la16\p[si la sol fa mi]
  fa8 fa4\tr
  sol16[la sol fa mi re]

  %40
  mi8 mi4\tr
  fa16[sol fa  mi re do]
  re[do re mi fa re]\mbreak

  %43
  mi[fa mi re do si]
  do8 la r
  la16[sold la re do si]

  %46
  la[sold la re do si]
  la[sold la fa' mi re]
  do[si do la' sol fa]

  %49
  mi[fa? mi fa mi fa]
  mi[fa? mi fa mi fa]
  mi[la sol fa mi re]

  %52
  do8 [re si]
  la\f  la'16 si do8
  do la fa~

  %55
  fa sol16 la si8
  si sol mi~\mbreak
  mi fa16 sol la8

  %58
  la fa re~
  re16 sold si re, do si
  do8 re si

  %61
  la4 r8
  R4.*3
  do16 si do re mi do

  %66
  mi8\p[fa sol]
  dod,4.~
  dod16[si la si dod re]

  %69
  mi[fa sol la sib8]~\mbreak
  sib[la16 sol fa mi]
  fa mi fa sol la fa
  fad!8 sol la

  %73
  red,4.~
  red16[dod si dod red mi]
  fad[sol la si do8]~

  %76
  do[si16 la sol fad]
  sol fad sol la si sol
  mi[red mi si la si]

  %79
  fad'[mi fad si, la si]
  sol'[fad sol si, la si]
  la'[sol la si, la si]

  %82
  sol'[fad sol la si8]
  mi, fad4\tr\mbreak
  mi16 red mi fad sol mi

  %85
  fad mi fad sol la fad
  sol fad sol la si sol
  la sol la si do la

  %88
  sol8 la fad
  mi4 r8
  R4.*4

  %94
  si'16 la si do re si
  si\p si si si si si
  re si si si si si

  %97
  re si si si si si\mbreak
  do la la la la la
  do la la la la la

  %100
  si sol sol sol sol sol
  si sol sol sol sol sol
  fad mi fad sol la fad

  %103
  sol,16[la si do re mi]
  la,[si do re mi fad]
  si,[do re mi fad sol]
  do,[re mi fad sol la]

  %107
  re,8[mi16 fad sol8]
  sol, la4\tr
  si16 la si do re si

  %110
  re[sol sol sol sol sol]\mbreak
  mi[sol sol sol sol sol]
  re[sol sol sol sol sol]

  %113
  do,[sol' sol sol sol sol]
  si,[la si do re si]
  do[si do re mi fad]

  %116
  sol\f[la si do re8]
  sol, la4\tr
  sol8 re si

  %119
  sol16[la si do re8]
  sol la4\tr
  sol16 re re re re re

  %122
  sol re re re re re
  si'8 do la
  sol4.\fermata

}

IXvlIn = \relative do'' {

  R4.*16
  sol16 fad sol la si sol
  la sol la si do la

  %19
  sol4 re'8
  mi4.
  la

  %22
  re,
  sol
  do,

  %25
  fad
  sol8 sol16 la si8
  r sol16 la si8

  %28
  sol la fad\mbreak
  sol4 r8
  R4.*7

  %37
  mi8\p mi  mi
  re re4\tr
  re8 re re

  %40
  do do4\tr
  do8 do do
  si16 la si do re si\mbreak

  %43
  si8 si si
  mi,4 r8
  do'16 si do8 r

  %46
  do16 si do8 r
  do16 si do8 r
  mi16 re mi8 r

  %49
  do16 re do re do re
  do re do re do re
  do fa mi re do si

  %52
  la8 si sold
  mi'4.\f
  fa

  %55
  si
  mi,\mbreak
  la

  %58
  re,
  sold
  la8 si sold

  %61
  la4 r8
  R4.*3
  la,16 sold la si do la

  %66
  mi'8\p fa sol
  sol4.~
  sol~

  %69
  sol~\mbreak
  sol8 mi dod
  re16 dod re mi fa re

  %72
  fad!8 sol la
  la4.~
  la~

  %75
  la~
  la8 fad red
  mi16 red mi fad sol mi

  %78
  sol fad sol8 r
  la16 sol la8 r
  mi16 red mi8 r

  %81
  fad16 mi fad8 r
  mi16 red mi fad sol8
  sol red4\tr\mbreak

  %84
  mi4 r8
  R4.
  mi16 red mi fad sol mi

  %87
  fad mi fad sol la fad
  mi8 fad red
  mi4 r8

  %90
  R4.*4
  sol16 fad sol la si sol
  sol\p [sol sol sol sol sol]

  %96
  si [sol sol sol sol sol]
  si [sol sol sol sol sol]\mbreak
  la[fad fad fad fad fad]

  %99
  la[fad fad fad fad fad]
  sol[mi mi mi mi mi]
  sol[mi mi mi mi mi]

  %102
  re dod re mi fad re
  re,8 do si
  mi re do

  %105
  fad mi re
  sol fad mi
  si'4 r8

  %108
  si fad4\tr
  sol16 fad sol la si sol
  re'[sol sol sol sol sol]\mbreak

  %111
  mi[sol sol sol sol sol]
  re[sol sol sol sol sol]
  do,[sol' sol sol sol sol]

  %114
  si,[la si do re si]
  do[si do re mi fad]
  sol\f[fad sol la si8]

  %117
  si fad4\tr
  sol8 re si
  sol16 la si do re8

  %120
  sol la4\tr
  sol16 si, si si si si
  re si si si si si

  %123
  sol'8 la fad
  sol4.\fermata

}

IXvlan = \relative do' {

  R4.*14
  re4 re8
  re4 re8

  %17
  re4 re8
  re4 re8
  re4 si'8

  %20
  sol sol16 fad mi re
  do8 do'16 si la sol
  fad8 fad16 mi re do

  %23
  si8 si'16 la sol fad
  mi8 mi16 re do si
  la8 la' fad

  %26
  re re r
  re re r
  re mi re\mbreak

  %29
  si4 r8
  R4.*7
  do'8\p do do

  %38
  re re re
  si si si
  do do do

  %41
  la la la
  si si si\mbreak
  sold sold sold

  %44
  la,4 r8
  mi' mi r
  mi mi r

  %47
  mi mi r
  mi mi r
  mi mi r

  %50
  mi mi r
  mi mi r
  mi fa mi

  %53
  do'4.\f
  la8 la16 sol fa mi
  re8 re'16 do si la

  %56
  sol8 sol16 fa mi re\mbreak
  do8 do'16 si la sol
  fa8 fa16 mi re do

  %59
  si8 si' sold
  mi fa mi
  do4 r8

  %62
  R4.*3
  mi8 mi mi
  sib'4.

  %67
  mi,8 sol mi
  dod mi dod
  la4 r8\mbreak

  %70
  mi'4 la,8
  la la la
  do'4.

  %73
  fad,!8 la fad
  red fad red
  si4 r8

  %76
  fad'4 si,8
  si si si
  si' si r

  %79
  si si r
  si si r
  si si r

  %82
  si si r
  si si4\mbreak
  si4 si8

  %85
  si4 si8
  si4 si8
  si4 si8

  %88
  si do si
  sol4 r8
  R4.*4

  %94
  re8 re re
  re' re re
  re re re

  %97
  re re re\mbreak
  re re re
  re re re

  %100
  sol, sol sol
  dod, dod dod
  la la la

  %103
  si la sol
  do si la
  re do si

  %106
  mi re do
  sol'4 r8
  re re4\tr

  %109
  re8 re re
  si' si si\mbreak
  do do do

  %112
  si si si
  la la la
  sol sol sol

  %115
  fad re do
  si\f la sol
  re' re4\tr

  %118
  si4 r8
  si4  r8
  re re4\tr

  %121
  sol,16 sol' sol sol sol sol
  sol, sol' sol sol sol sol
  re8 mi re

  %124
  si4.\fermata

}

IXvocen = \relative do'' {

  \autoBeamOff
  sol16[fad sol la si sol]
  la[sol la si do la]
  si[la si do re si]

  %4
  do[si do re mi do]
  si8 sol r
  sol'16[la sol fad mi re]

  %7
  do8[si la]
  fad'16[sol fad mi re do]
  si8[la sol]

  %10
  mi'16[re do si la sol]
  fad8 [la do]
  fad[sol la]

  %13
  sol[fad16 mi re8]
  sol, la4\tr \mbreak
  sol4.

  %16
  R4.*13
  sol16[fad sol la si sol]
  la[sol la si do la]

  %31
  si[la sol la si do]
  re8 re, r
  la'16[sold la si do la]

  %34
  si[la si do re si]
  do[si la si do re]
  mi8 mi, r

  %37
  la'16[si la sol fa mi]
  fa8 fa4\tr
  sol16[la sol fa mi re]

  %40
  mi8 mi4\tr
  fa16[sol fa  mi re do]
  re[do re mi fa re]\mbreak

  %43
  mi[fa mi re do si]
  do8 la r
  la16[sold la re do si]

  %46
  la[sold la re do si]
  la[sold la fa' mi re]
  do[si do la' sol fa]

  %49
  mi[fa? mi fa mi fa]
  mi[fa? mi fa mi fa]
  mi[la sol fa mi re]

  %52
  do8 [re si]
  la4 r8
  R4.*7

  %61
  la16[sold la si do la]
  si[la si do re si]
  do8 la'4~

  %64
  la8[sol16 fa mi re]
  do[si] la8 r
  mi'[fa sol]

  %67
  dod,4.~
  dod16[si la si dod re]
  mi[fa sol la sib8]~\mbreak

  %70
  sib[la16 sol fa mi]
  fa[mi] re8 r
  fad![sol la]

  %73
  red,4.~
  red16[dod si dod red mi]
  fad[sol la si do8]~

  %76
  do[si16 la sol fad]
  sol[fad] mi8 r
  mi16[red mi si la si]

  %79
  fad'[mi fad si, la si]
  sol'[fad sol si, la si]
  la'[sol la si, la si]

  %82
  sol'[fad sol la si8]
  mi, fad4\tr\mbreak
  mi4 r8

  %85
  R4.*5
  sol,16[fad sol la si sol]
  la[sol la si do la]

  %92
  si[la si do re si]
  do[si do re mi do]
  si8 sol r

  %95
  sol'16 [sol sol sol sol sol]
  si [sol sol sol sol sol]
  si [sol sol sol sol sol]\mbreak

  %98
  la[fad fad fad fad fad]
  la[fad fad fad fad fad]
  sol[mi mi mi mi mi]

  %101
  sol[mi mi mi mi mi]
  fad8 re r
  sol,16[la si do re mi]

  %104
  la,[si do re mi fad]
  si,[do re mi fad sol]
  do,[re mi fad sol la]

  %107
  re,8[mi16 fad sol8]
  sol, la4\tr
  sol r8

  %110
  re'16[sol sol sol sol sol]\mbreak
  mi[sol sol sol sol sol]
  re[sol sol sol sol sol]

  %113
  do,[sol' sol sol sol sol]
  si,[la si do re si]
  do[si do re mi fad]

  %116
  sol[la si do re8]
  sol, la4\tr
  sol8 re[si]

  %119
  sol16[la si do re8]
  sol la4\tr
  sol4 r8

  %122
  R4.*3

}

IXtesto = \lyricmode {

  A - - - - men a  - - - - - - - men a -- men.

  A - - - men a - - - men s - - - - - - - - - men a  - - - - - - - men.

  A - - - - men a - - - men a - - - men a - - - - - - men.

  A - - - -  men a  - - - - - - - men a  - - - - men a -- men a - - - - - - men amen _ a - men

  a -- men.

}

IXbcn = \relative do {

  sol8 sol'4~
  sol8 fad4
  sol8 si, sol

  %4
  la' do fad,
  sol si, sol
  mi' fad sol

  %7
  la4 la,8
  re mi fad
  sol4 sol,8

  %10
  do re mi
  re fad la
  re, mi fad

  %13
  sol4.
  mi8 re re,\mbreak
  sol sol'4~

  %16
  sol8 fad4
  sol,8 sol'4~
  sol8 fad4

  %19
  sol8 si16 la sol8
  do mi,16 re do8
  fad la16 sol fad8

  %22
  si re,16 do si8
  mi sol16 fad mi8
  la do,16 si la8

  %25
  re fad16 mi re8
  sol sol, r
  sol' sol, r

  %28
  sol' do, re\mbreak
  sol, sol'4~
  sol8 fad4

  %31
  sol8 fad mi
  re sold mi
  la, la'4~

  %34
  la8 sold4
  la8 sol! fa
  mi sold mi

  %37
  la,4 r8
  R4.*6
  la'8 do, la

  %45
  la' la, r
  la' la, r
  la' la, r

  %48
  la' la, r
  la' la, r
  la' la, r

  %51
  la' la, r
  la' re, mi
  la do16 si la8

  %54
  re fa,16 mi re8
  sol si16 la sol8
  do mi,16 re do8\mbreak

  %57
  fa la16 sol fa8
  si re,16 do si8
  mi sold16 fad! mi8

  %60
  la re, mi
  la, la'4~
  la8 sold4

  %63
  la16 sold la si do la
  si8 re sold,
  la la, la

  %66
  sol'?4.
  la8 mi dod
  la4 r8

  %69
  dod' la mi\mbreak
  dod4 la'8
  re, re, re

  %72
  la''4.
  si8 fad red
  si4 r8

  %75
  red' si fad
  red4 si'8
  mi, mi, mi

  %78
  mi' mi, r
  red' si r
  mi mi, r

  %81
  red' si r
  mi mi, r
  mi' si' si,\mbreak

  %84
  mi, mi'4~
  mi8 red4
  mi8 mi'4~

  %87
  mi8 red4
  mi8 la, si
  mi, re16 do si la

  %90
  sol8 sol'4~
  sol8 fad4
  sol,8 sol'4~

  %93
  sol8 fad4
  sol8 sol, sol
  R4.*7

  %102
  re'8 re, re
  R4.*5
  sol8 re' re,

  %109
  sol' sol, sol
  R4.*7
  sol'8 re' re,

  %118
  sol4 r8
  sol,4 r8
  sol' re' re,

  %121
  sol,16 sol' sol sol sol sol
  sol, sol' sol sol sol sol
  sol,8 do re

  %124
  sol,4.\fermata

}

IXbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4.
  <2>8 <3>4
  s4.*13
  <2>8 <3>4
  s4.
  <2>8 <3>4
  s4.
  <7>
  <7>
  <7>
  <7>
  <7>
  <7>
  s4.*4
  <2>8 <3>4
  s4.*3
  <2>8 <3>4
  s4.*17
  s8 <_-> <_+>
  s4.
  <7 _->4.
  <7->
  <7>
  <7>
  <7>
  <7 _+>
  s4.*4
  <7>4.
  s
  <6 _->
  <7 _+>
  s
  <6 5>
  <7>
  <_->
  <6+ 3->
  <7 _+>
  s
  <6 5>
  <7->
  s4.*8
  <2>8 <3>4
  s4. <4 2>8 <6 5 3>4
  s4.*3
  <2>8 <3>4
  s4.
  <4 2>8 <6 5 3>4

}

forma = {

  \time 3/8
  \override Staff.TimeSignature.style = #'single-digit
  \key sol\major
  \tempo 4. = 55
  s4.*124
  \bar "|."

}


IXvl = {
  \IXglobal
  %\notypeset
  <<\IXvln\forma>>
}

IXvlI = {
  \IXglobal
  <<\IXvlIn\forma>>
}

IXvla = {
  \IXglobal
  \clef alto
  <<\IXvlan\forma>>
}

IXvoce = {
  \new Voice = "amen"
  \IXglobal
  %\clef soprano
  <<\IXvocen\forma>>
}



IXbc = {
  \IXglobal
  \clef bass
  <<\IXbcn\forma\IXbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #4

  }

  \markup \huge "[1.] All[egr]o non molto"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.instrumentName = \markup\center-column {"Violini [I]"\vspace #-0.2"Hautbois [I]"}
          \set Staff.midiInstrument = #"oboe"
          \Ivl
        >>
        \new Staff <<
          \set Staff.instrumentName = \markup \center-column {"Violini [II]"\vspace #-0.2"Hautbois [II]"}
          \set Staff.midiInstrument = #"oboe"
          \IvlI
        >>
        \new Staff <<
          \set Staff.instrumentName = \markup  \center-column {"[Viola]"}
          \set Staff.midiInstrument = #"viola"
          \Ivla
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"synth voice"
          \Ivoce
          \new Lyrics \lyricsto "laudate" \Itesto
        >>

        \new Staff  <<
          \set Staff.instrumentName = \markup\center-column {"[Basso]"}
          \set Staff.midiInstrument = #"cello"
          \Ibc
        >>
      >>

    }

    \layout {

      indent = 1.7\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

  \markup \huge "[2.] All[egr]o"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \IIvl
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \IIvlI
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIvla
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"synth voice"
          \IIvoce
          \new Lyrics \lyricsto "sit" \IItesto
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"cello"
          \IIbc
        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

  \markup \huge "[3.] And[ant]e"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \IIIvl
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \IIIvlI
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"synth voice"
          \IIIvoce
          \new Lyrics \lyricsto "solis" \IIItesto
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"cello"
          \IIIbc
        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

  \markup \huge "[4.] Larghetto"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \IVvl
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \IVvlI
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IVvla
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"synth voice"
          \IVvoce
          \new Lyrics \lyricsto "super" \IVtesto
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"cello"
          \IVbc
        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

  \markup \huge "[5.] All[egr]o molto"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \Vvl
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \VvlI
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \Vvla
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"synth voice"
          \Vvoce
          \new Lyrics \lyricsto "suscitans" \Vtesto
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"cello"
          \Vbc
        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

  \markup \huge "[6.] All[egr]o"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \VIvl
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \VIvlI
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \VIvla
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"synth voice"
          \VIvoce
          \new Lyrics \lyricsto "ut" \VItesto
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"cello"
          \VIbc
        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

  \markup \huge "[7.] Larghetto"


  \score {

    {

      \new ChoirStaff <<

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol.staff-space = #(magstep +1)
        } <<
          \set Staff.instrumentName = \markup\center-column {"Flauto"\vspace #-0.2"Trav[ers]ier"}
          \set Staff.midiInstrument = #"flute"
          \VIIfl
        >>

          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          } <<
            \set Staff.instrumentName = \markup\center-column {"Violini [I]"\vspace #-0.2"Hautbois [I]"}
            \set Staff.midiInstrument = #"oboe"
            \VIIvl
          >>
          \new Staff\with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          }  <<
            \set Staff.instrumentName = \markup \center-column {"Violini [II]"\vspace #-0.2"Hautbois [II]"}
            \set Staff.midiInstrument = #"oboe"
            \VIIvlI
          >>
          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          } <<
            \set Staff.instrumentName = \markup  \center-column {"[Viola]"}
            \set Staff.midiInstrument = #"viola"
            \VIIvla
          >>
          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          } <<
            \set Staff.midiInstrument = #"synth voice"
            \VIIvoce
            \new Lyrics \lyricsto "gloria" \VIItesto
          >>

          \new Staff  \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          } <<
            \set Staff.instrumentName = \markup\center-column {"[Basso]"}
            \set Staff.midiInstrument = #"cello"
            \VIIbc
          >>
        >>

      }

      \layout {

        indent = 1.7\cm

        \context	{
          \Score
          \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
          %\override SpacingSpanner.uniform-stretching = ##t
          \override BarLine.hair-thickness = #1.2
          \override StaffGrouper.staff-staff-spacing.padding = #2
          \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

  \markup \huge "[8.] All[egr]o"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \VIIIvl
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \VIIIvlI
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \VIIIvla
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"synth voice"
          \VIIIvoce
          \new Lyrics \lyricsto "sicut" \VIIItesto
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"cello"
          \VIIIbc
        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

  %\pageBreak

  \markup \huge "[9.] All[egr]o"


  \score {

    {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \IXvl
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \IXvlI
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IXvla
        >>
        \new Staff <<
          \set Staff.midiInstrument = #"synth voice"
          \IXvoce
          \new Lyrics \lyricsto "amen" \IXtesto
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"cello"
          \IXbc
        >>
      >>

    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override StaffGrouper.staff-staff-spacing.padding = #1.5
        \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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
