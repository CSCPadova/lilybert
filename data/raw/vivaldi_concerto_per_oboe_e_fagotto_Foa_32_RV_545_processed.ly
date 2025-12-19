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

Iobn = \relative do'' {

  sol4 sol'
  fad16 la re,4 do8
  si16 re fad,8~fad16 la sol8~

  %4
  sol16 si la8~la16 do si8~
  si16 fad' la4 do,8
  si16 la sol8 r si16 dod

  %7
  re la re8~re16 fad mi sol
  fad re fad8~fad16 la sol si
  la dod, re8~re16 sol la si

  %10
  la dod, re8~re16 sol la si\mbreak
  la dod, re sold, la mi fad dod
  re8 la \senza \tuplet 3/2 { r16 sol''(fad mi[re dod)] }

  %13
  re8 la \tuplet 3/2 { r16 sol fad mi[re dod] }
  re8 la \tuplet 3/2 { r16 fad'' sol la[si dod] }
  re8 re, mi4\tr

  %16
  re r8 do
  \appoggiatura re8 do16(si do8) \appoggiatura re8 do16(si do8)
  \tuplet 3/2 { do16(re mi fad[sol la)] } la8 r

  %19
  \appoggiatura do,8 si16(la si8) \appoggiatura do8 si16(la si8)
  \tuplet 3/2 { si16(do re mi[fad sol)] } sol8 r\mbreak
  \tuplet 3/2 { la,16(si do } do8)\noBeam \tuplet 3/2 { la16(si do } do8)\noBeam

  %22
  \tuplet 3/2 { la16(si do } do8)\noBeam \tuplet 3/2 { fad16(sol la } la8)\noBeam
  si16 sol si, sol' la, sol' re, fad'
  sol8 sol, re'4 ~ %%% fine ripresa

  %25
  re8[sol16 la si8 sol]
  fad re do4~
  do8[fad16 sol la8 fad]

  %28
  sol re r si
  do\tr si r sol'\mbreak
  do,\tr si r sol'

  %31
  do,4 si\tr
  la r8 re
  dod16 re mi4 dod8

  %34
  re16 mi fad4 re8
  mi16 fad sol4 mi8
  fad la4 fad8

  %37
  mi la4 mi8
  re la'4 re,8\mbreak
  dod16 si la8 r sol'

  %40
  fad mi16 re mi4\tr
  re re
  dod16 mi la,4 sol8

  %43
  fad16 la re,8 \tuplet 3/2 { r16 la''(sol fad[mi re)] }
  mi8 la, \tuplet 3/2 { r16 la' sol fad[mi re] }
  mi8 la, r sol'

  %46
  \appoggiatura la8 sol16(fad sol8) \appoggiatura la sol16(fad sol8)
  \tuplet 3/2 { sol,16(la si dod[re mi)] } mi8 r %%fine prima riga pg 4  OOOO KKKKKK
  \appoggiatura sol,8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8)

  %49
  \tuplet 3/2 { fad16(sol la si [dod re)] } re8 r
  \tuplet 3/2 { mi16 (fad sol } sol8)\noBeam \tuplet 3/2 { mi16 (fad sol } sol8)\noBeam
  fad16 re' fad, re' mi, re' mi, dod'

  %52
  re4 re,~
  re16 dod si! la la' sol fad mi
  fad8 dod re4~

  %55
  re16 dod si la la' sol fad mi\mbreak
  fad8 mib4 re8~
  re do4 sib16 la

  %58
  sib16 la sol8 r sol'~
  sol fa4 mi8~
  mi re4 do16 si!

  %61
  do16 si la8 r la'~
  la sol4 fa8~
  fa mi4 fad8

  %64
  red16 do si8 r si
  do16[(si) do(si) mi8 si]\mbreak %%%%%% fine prima riga p. 5
  do\tr si r si

  %67
  do16(si) do(si) la'8 fad
  sol16 fad mi8~mi16 sol fad mi
  fad sol la8~la16 fad mi red

  %70
  mi8[red?16 do si8 la']
  sol fad16 mi fad8 mi16 red
  mi si mi8~mi16 sol fad la

  %73
  sol mi sol8~sol16 si la do
  si la sol4 si8\mbreak
  la16 sol fad4 la8

  %76
  sol16[mi sol mi sol mi sol mi]
  fad[red fad red fad red fad red]
  mi8 [si mi mi]

  %79
  mi red16 dod red4
  r8 si[fad' fad]
  fad  mi16 red mi4

  %82
  r8 si[sol' sol]
  sol fad16 mi fad4
  r8 si,[la' la]

  %85
  la sol16 fad sol8 fad16 mi\mbreak
  fad4~fad16 sol la si
  mi,4~mi16 fad sol la

  %88
  re,4~re16 mi fad sol
  si,8[la16 sol si8 dod]
  re2

  %91
  do8[si16 la dod8 red]
  mi2
  red8[dod16 si red8 fad]

  %94
  sol2
  fad16[sol la sol fad mi re do]\mbreak
  si8 sol r la'

  %97
  sol16 fad sol8 r re
  do16 si do8 r sol'
  fad16 mi fad8 r do

  %100
  si16 re fad,8~fad16 la sol8~
  sol16 si la8~la16 do si8~
  si16 mi la4 do,8

  %103
  \appoggiatura re8 do16(si do8) \appoggiatura re8 do16(si do8)
  \tuplet 3/2 { do16(re mi fad[sol la)] } la8 r
  \appoggiatura do,8 si16(la si8) \appoggiatura do8 si16(la si8)

  %106
  \tuplet 3/2 { si16(do re mi[fad sol)] } sol8 r
  \tuplet 3/2 { la,16(si do } do8)\noBeam \tuplet 3/2 { la16(si do } do8)\noBeam
  \tuplet 3/2 { la16(si do } do8)\noBeam \tuplet 3/2 { fad16(sol la } la8)\noBeam

  %109
  si sol r re
  re4. sol16 si
  re,4. sol16 si

  %112
  do,4. fad16 la
  do,4. fad16 la\mbreak
  si,16 la sol8 r fa'

  %115
  fa?4~fa16 re do si
  fa'4~fa16 re do si
  mi re do8 r sol'

  %118
  la4~la16 mi re dod
  sol'4~sol16 mi re dod
  fad16 mi re8 r re

  %121
  do16 fad la4 do,8
  si16 re sol4 si,8\mbreak
  la16 re fad4 la,8

  %124
  sol16 dod mi4 sol,8
  fad16[mi re mi fad sol la si]
  do[si la si do re mi re]

  %127
  si8 la16 sol mi'4\tr
  re\tr do\tr
  si16  sol' fad sol la,4 \tr

  %130
  sol sol'
  fad16 la re,4 do8
  si16 re fad,8~fad16 la sol8~

  %133
  sol16 si la8~la16 do si8~
  si16 fad' la4 do,8
  si16 la sol8 r si16 dod

  %136
  re la re8~re16 fad mi sol
  fad re fad8~fad16 la sol si
  la dod, re8~re16 sol la si

  %139
  la dod, re8~re16 sol la si\mbreak
  la dod, re sold, la mi fad dod
  re8 la \senza \tuplet 3/2 { r16 sol''(fad mi[re dod)] }

  %142
  re8 la \tuplet 3/2 { r16 sol fad mi[re dod] }
  re8 la \tuplet 3/2 { r16 fad'' sol la[si dod] }
  re8 re, mi4\tr

  %145
  re r8 do
  \appoggiatura re8 do16(si do8) \appoggiatura re8 do16(si do8)
  \tuplet 3/2 { do16(re mi fad[sol la)] } la8 r

  %148
  \appoggiatura do,8 si16(la si8) \appoggiatura do8 si16(la si8)
  \tuplet 3/2 { si16(do re mi[fad sol)] } sol8 r\mbreak
  \tuplet 3/2 { la,16(si do } do8)\noBeam \tuplet 3/2 { la16(si do } do8)\noBeam

  %151
  \tuplet 3/2 { la16(si do } do8)\noBeam \tuplet 3/2 { fad16(sol la } la8)\noBeam
  si16 sol si, sol' la, sol' re, fad'
  sol,4\fermata r

}

IvlIn =  \relative do'' {

  sol4 sol'
  fad16 la re,4 do8
  si16 re fad,8~fad16 la sol8~

  %4
  sol16 si la8~la16 do si8~
  si16 fad' la4 do,8
  si16 la sol8 r si16 dod

  %7
  re la re8~re16 fad mi sol
  fad re fad8~fad16 la sol si
  la dod, re8~re16 sol la si

  %10
  la dod, re8~re16 sol la si\mbreak
  la dod, re sold, la mi fad dod
  re8 la \senza \tuplet 3/2 { r16 sol''(fad mi[re dod)] }

  %13
  re8 la \tuplet 3/2 { r16 sol fad mi[re dod] }
  re8 la \tuplet 3/2 { r16 fad'' sol la[si dod] }
  re8 re, mi4\tr

  %16
  re r8 do
  \appoggiatura re8 do16(si do8) \appoggiatura re8 do16(si do8)
  \tuplet 3/2 { do16(re mi fad[sol la)] } la8 r

  %19
  \appoggiatura do,8 si16(la si8) \appoggiatura do8 si16(la si8)
  \tuplet 3/2 { si16(do re mi[fad sol)] } sol8 r\mbreak
  \tuplet 3/2 { la,16(si do } do8)\noBeam \tuplet 3/2 { la16(si do } do8)\noBeam

  %22
  \tuplet 3/2 { la16(si do } do8)\noBeam \tuplet 3/2 { fad16(sol la } la8)\noBeam
  si16 sol si, sol' la, sol' re, fad'
  sol4 r %% fine ripresa

  %25
  R2*16
  re,4 re'
  dod16 mi la,4 sol8

  %43
  fad16 la re,8 \tuplet 3/2 { r16 la''(sol fad[mi re)] }
  mi8 la, \tuplet 3/2 { r16 la' sol fad[mi re] }
  mi8 la, r sol'

  %46
  \appoggiatura la8 sol16(fad sol8) \appoggiatura la sol16(fad sol8)
  \tuplet 3/2 { sol,16(la si dod[re mi)] } mi8 r %%fine prima riga pg 4  OOOO KKKKKK
  \appoggiatura sol,8 fad16(mi fad8) \appoggiatura sol8 fad16(mi fad8)

  %49
  \tuplet 3/2 { fad16(sol la si [dod re)] } re8 r
  \tuplet 3/2 { mi16 (fad sol } sol8)\noBeam \tuplet 3/2 { mi16 (fad sol } sol8)\noBeam
  fad16 re' fad, re' mi, re' mi, dod'

  %52
  re4 r
  R2*19
  mi,16 si mi8~mi16 sol fad la

  %73
  sol mi sol8~sol16 si la do
  si la sol4 si8\mbreak
  la16 sol fad4 la8

  %76
  sol16[mi sol mi sol mi sol mi]
  fad[red fad red fad red fad red]
  mi4 r

  %79
  R2*21
  si16 re fad,8~fad16 la sol8~
  sol16 si la8~la16 do si8~
  si16 mi la4 do,8

  %103
  \appoggiatura re8 do16(si do8) \appoggiatura re8 do16(si do8)
  \tuplet 3/2 { do16(re mi fad[sol la)] } la8 r
  \appoggiatura do,8 si16(la si8) \appoggiatura do8 si16(la si8)

  %106
  \tuplet 3/2 { si16(do re mi[fad sol)] } sol8 r
  \tuplet 3/2 { la,16(si do } do8)\noBeam \tuplet 3/2 { la16(si do } do8)\noBeam
  \tuplet 3/2 { la16(si do } do8)\noBeam \tuplet 3/2 { fad16(sol la } la8)\noBeam

  %109
  si sol r4
  R2*20
  sol,4 sol'
  fad16 la re,4 do8
  si16 re fad,8~fad16 la sol8~

  %133
  sol16 si la8~la16 do si8~
  si16 fad' la4 do,8
  si16 la sol8 r si16 dod

  %136
  re la re8~re16 fad mi sol
  fad re fad8~fad16 la sol si
  la dod, re8~re16 sol la si

  %139
  la dod, re8~re16 sol la si\mbreak
  la dod, re sold, la mi fad dod
  re8 la \senza \tuplet 3/2 { r16 sol''(fad mi[re dod)] }

  %142
  re8 la \tuplet 3/2 { r16 sol fad mi[re dod] }
  re8 la \tuplet 3/2 { r16 fad'' sol la[si dod] }
  re8 re, mi4\tr

  %145
  re r8 do
  \appoggiatura re8 do16(si do8) \appoggiatura re8 do16(si do8)
  \tuplet 3/2 { do16(re mi fad[sol la)] } la8 r

  %148
  \appoggiatura do,8 si16(la si8) \appoggiatura do8 si16(la si8)
  \tuplet 3/2 { si16(do re mi[fad sol)] } sol8 r\mbreak
  \tuplet 3/2 { la,16(si do } do8)\noBeam \tuplet 3/2 { la16(si do } do8)\noBeam

  %151
  \tuplet 3/2 { la16(si do } do8)\noBeam \tuplet 3/2 { fad16(sol la } la8)\noBeam
  si16 sol si, sol' la, sol' re, fad'
  sol,4\fermata r

}

IvlIIn = \relative do'' {

  sol4 sol'
  fad16 la re,4 do8
  si16 re fad,8~fad16 la sol8~

  %4
  sol16 si la8~la16 do si8~
  si16 fad' la4 do,8
  si16 la sol8 r4

  %7
  r r8 dod16 mi
  re la re8~re16 fad mi sol
  fad  mi fad sol la8 r

  %10
  fad16 mi fad sol la8 r\mbreak
  la16 dod, re sold, la mi fad dod
  re8 la \senza \tuplet 3/2 { r16 sol''(fad mi[re dod)] }

  %13
  re8 la \tuplet 3/2 { r16 sol fad mi[re dod] }
  re8 la \tuplet 3/2 { r16 fad'' sol la[si dod] }
  re8 re, mi4\tr

  %16
  re8[la16 fad la fad la fad]
  la[fad la fad la fad la fad]
  la fad la fad la fad la fad

  %19
  si[sol si sol si sol si sol]
  si[sol si sol si sol si sol]\mbreak
  \tuplet 3/2 { fad(sol la } la8)\noBeam \tuplet 3/2 { fad16(sol la } la8)\noBeam

  %22
  \tuplet 3/2 { fad16(sol la } la8)\noBeam \tuplet 3/2 { re16(mi fad } fad8)\noBeam
  sol16 sol si, sol' la, sol' re, fad'
  sol4 r %%%% fine ripresa

  %25
  R2*16
  re,4 re'
  dod16 mi la,4 sol8

  %43
  fad16 la re,8 \tuplet 3/2 { r16 la''(sol fad[mi re)] }
  mi8 la, \tuplet 3/2 { r16 la' sol fad[mi re] }
  mi dod mi dod mi dod mi dod

  %46
  mi dod mi dod mi dod mi dod
  mi [dod? mi dod mi dod mi dod]\mbreak
  fad[re fad re fad re fad re]

  %49
  fad[re fad re fad re fad re]
  \tuplet 3/2 { dod(re mi } mi8)\noBeam \tuplet 3/2 { dod16(re mi } mi8)\noBeam
  re16 la' re, la' re, la' dod, la'

  %52
  fad4 r
  R2*20
  mi16 si mi8~mi16 sol fad la

  %74
  sol fad mi4 sol8\mbreak
  fad16 mi red4 fad8
  mi16[si mi si mi si mi si]

  %77
  red[si red si red si red si]
  sol4 r
  R2*21

  %100
  si16 re fad,8~fad16 la sol8~
  sol16 si la8~la16 do si8~
  si16 mi la4 la,8

  %103
  la16 fad la fad la fad la fad
  la fad la fad la fad la fad\mbreak
  si sol si sol si sol si sol

  %106
  si sol si sol si sol si sol
  \tuplet 3/2 { fad(sol la } la8)\noBeam \tuplet 3/2 { fad16(sol la } la8)\noBeam
  \tuplet 3/2 { fad16(sol la } la8)\noBeam \tuplet 3/2 { re16(mi fad } fad8)\noBeam

  %109
  sol re r4
  R2*20
  sol,4 sol'

  %131
  fad16 la re,4 do8
  si16 re fad,8~fad16 la sol8~
  sol16 si la8~la16 do si8~

  %134
  si16 fad' la4 do,8
  si16 la sol8 r4
  r r8 dod16 mi

  %137
  re la re8~re16 fad mi sol
  fad  mi fad sol la8 r
  fad16 mi fad sol la8 r\mbreak

  %140
  la16 dod, re sold, la mi fad dod
  re8 la \senza \tuplet 3/2 { r16 sol''(fad mi[re dod)] }
  re8 la \tuplet 3/2 { r16 sol fad mi[re dod] }

  %143
  re8 la \tuplet 3/2 { r16 fad'' sol la[si dod] }
  re8 re, mi4\tr
  re8[la16 fad la fad la fad]

  %146
  la[fad la fad la fad la fad]
  la fad la fad la fad la fad
  si[sol si sol si sol si sol]

  %149
  si[sol si sol si sol si sol]\mbreak
  \tuplet 3/2 { fad16(sol la } la8)\noBeam \tuplet 3/2 { fad16(sol la } la8)\noBeam
  \tuplet 3/2 { fad16(sol la } la8)\noBeam \tuplet 3/2 { re16(mi fad } fad8)\noBeam

  %152
  sol16 sol si, sol' la, sol' re, fad'
  sol4\fermata r

}

Ivlan =  \relative do' {

  r16 sol' re si sol4
  r16 re'' la fad re4
  re8 re~re16 fad mi8~

  %4
  mi16 sol fad8~fad16 la sol8~
  sol16 la fad8~fad16 fad la fad
  re4 r8 re

  %7
  fad[fad fad sol]
  la[la la la]
  la4 fad16 mi fad sol

  %10
  re8[la' fad sol]\mbreak
  mi4. dod8
  la4 dod

  %13
  la dod
  la la'8 sol
  fad re4 dod8

  %16
  re[fad16 re fad re fad re]
  fad[re fad re fad re fad re]
  fad[re fad re fad re fad re]

  %19
  re[si re si re si re si]
  re[si re si re si re si]\mbreak
  re[re, re' re, re' re, re' re,]

  %22
  re'[re, re' re, re' re, re' re,]
  re'8[re re re]
  si4 r %% fine ripresa

  %25
  R2*16
  r16 re' la fad re4
  r16 la' mi dod la4

  %43
  la8[la la la]
  dod[dod dod la]
  la dod'16 la dod la dod la

  %46
  dod? la dod la dod la dod la
  dod? la dod la dod la dod la\mbreak
  la[fad la fad la fad la fad]

  %49
  la[fad la fad la fad la fad]
  la8[la la la]
  la[la la la]

  %52
  la4 r
  R2*19
  si8[si si si]

  %73
  si8[si si si]
  si8[si si si]\mbreak
  fad[fad fad red]

  %76
  si[si si si]
  si[si si si]
  si4 r

  %79
  R2*21
  re8 re~re16 fad mi8~
  mi16 sol fad8~fad16 la sol8~

  %102
  sol16 la fad8~fad16 fad la fad
  fad re fad re fad re fad re
  fad re fad re fad re fad re\mbreak

  %105
  re si re si re si re si
  re si re si re si re si
  re re, re' re, re' re, re' re,

  %108
  re' re, re' re, re' re, re' re,
  re'8 si r4
  R2*20

  %130
  r16 sol' re si sol4
  r16 re'' la fad re4
  re8 re~re16 fad mi8~

  %133
  mi16 sol fad8~fad16 la sol8~
  sol16 la fad8~fad16 fad la fad
  re4 r8 re

  %136
  fad[fad fad sol]
  la[la la la]
  la4 fad16 mi fad sol

  %139
  re8[la' fad sol]\mbreak
  mi4. dod8
  la4 dod

  %142
  la dod
  la la'8 sol
  fad re4 dod8

  %145
  re[fad16 re fad re fad re]
  fad[re fad re fad re fad re]
  fad[re fad re fad re fad re]

  %148
  re[si re si re si re si]
  re[si re si re si re si]\mbreak
  re[re, re' re, re' re, re' re,]

  %151
  re'[re, re' re, re' re, re' re,]
  re'8[re re re]
  si4\fermata r

}

Ifgn = \relative do {

  sol4 r16 sol' si, sol
  re'4 r16 re' fad, re
  sol8[re re re]

  %4
  re[re re re]
  re[re re re]
  sol,16 sol' si, la sol8 sol'

  %7
  re[re re la]
  re[re re re]
  re16 la' fad mi re4

  %10
  r16 la' fad mi re8 sol\mbreak
  la8[si dod la]
  re,[fad mi la,]

  %13
  re[fad mi la,]
  re[mi fad mi]
  re[si' la la,]

  %16
  re[re re re]
  re[re re re]
  re[re re re]

  %19
  sol[sol sol sol]
  sol[sol sol sol]\mbreak
  re16 re, re' re, re' re, re' re,

  %22
  re' re, re' re, re' re, re' re,
  sol'8[sol, re' re,]
  sol4 \con \terzine \tuplet 3/2 { r16 re'' do si[la sol] }

  %25
  \senza fad8 re \tuplet 3/2 { r16 sol la si[la sol] }
  re'8 re, \tuplet 3/2 { r16 la' sol fad[mi re] }
  re'8 re, \tuplet 3/2 { r16 re mi fad[mi re] }

  %28
  sol fad sol sol, sol' fad sol sol,
  sol' fad sol sol, sol' fad sol sol,\mbreak
  sol' fad sol sol, sol' fad sol sol,

  %31
  la' sol la fad sol fad sol dod,
  re re' la fad re8 r
  r la'16[sol la sol la la,]

  %34
  r8 re'16[dod re dod re re,]
  r8 la'16[sol la sol la la,]
  r8 re'16[dod re dod re re,]

  %37
  r8 dod'16[si dod si dod dod,?]
  r8 si'16[la si la si si,]\mbreak
  r8 la'16[sol la sol la la,]

  %40
  re8[re' la la,]
  re4 r16 re' fad, re
  la'4 r16 la dod, la

  %43
  re8[re re re]
  la[la la re]
  la[la la la]

  %46
  la[la la la]
  la[la la la]\mbreak
  re[re re re]

  %49
  re[re re re]
  la[la la la]
  re[re la' la,] %%%% fin qui OK

  %52
  re16 la' sol la fad sol mi fad
  re4 r
  re16 la' sol la fad sol mi fad

  %55
  re4 r\mbreak
  re\tr fad
  fad fad

  %58
  sol16 la si do re do si la
  sol4 sold
  sold? sold

  %61
  la16 si do re mi re do si
  la4 la
  la la

  %64
  si16 la si do si la sol fad
  mi4 mi\mbreak
  mi16 fad sol la si la sol fad

  %67
  mi4 red
  mi mi
  red si

  %70
  mi8[la red, si]
  mi[sol la si]
  mi,8 [mi mi si]

  %73
  mi[mi mi si]
  mi[mi mi mi]\mbreak
  fad[si, si si]

  %76
  mi[mi mi mi]
  si'[si, si si]
  mi16 sol fad sol mi sol fad mi

  %79
  si'8 si, r si'
  si,16 red dod red si red dod si
  mi8 mi, r mi''

  %82
  mi,16 sol fad sol mi sol fad mi
  si'8 si, r si'
  si,16 red dod red si red dod si

  %85
  mi8 mi, mi''4~\mbreak
  mi16 mi re do re4~
  re16 re do si do4~

  %88
  do16 do si la si4
  sol4. sol8
  fad[mi16 re fad8 sold]

  %91
  la2
  sol?8[fad16 mi sol8 la]
  si4~si16 la sol fad

  %94
  mi8[fad16 sol fad8 mi]
  la4 re,\mbreak
  sol16 re' si re sol, re' fad, re'

  %97
  mi, sol fad sol do, sol' si, sol'
  la, do' la do fad, do' mi, do'
  re, fad re fad si, fad' la, fad'

  %100
  sol,8 [re' re re]
  re[re re re]
  re[re re re]

  %103
  re[re re re]
  re[re re re]\mbreak
  sol[sol sol sol]

  %106
  sol[sol sol sol]
  re16 re, re' re, re' re, re' re,
  re' re, re' re, re' re, re' re,

  %109
  sol'8 sol, r8 sol'
  sol16 la si do re do si la
  sol la si do re si la sol

  %112
  fad sol la si do si la sol
  fad sol la si do la sol fad\mbreak
  sol la si do re do si la

  %115
  sol la si do re si la sol
  sol, sol' si do re si la sol
  do, re mi fa sol mi re do

  %118
  la' si dod re mi dod si la
  la, la' dod re mi dod si la
  re, la' sol la re, la' sol la

  %121
  re, la' sol la re, la' sol la
  sol, sol' fad sol sol, sol' fad sol\mbreak
  re la' sol la re, la' sol la

  %124
  mi la sol la dod, mi re dod
  re4 r
  re r

  %127
  sol,16 sol' fad sol sol, sol' fad sol
  sol, sol' fad sol sol, sol' fad sol
  sol,8 sol' re re,

  %130
  sol4 r16 sol' si, sol
  re'4 r16 re' fad, re
  sol8[re re re]

  %133
  re[re re re]
  re[re re re]
  sol,16 sol' si, la sol8 sol'

  %136
  re[re re la]
  re[re re re]
  re16 la' fad mi re4

  %139
  r16 la' fad mi re8 sol\mbreak
  la8[si dod la]
  re,[fad mi la,]

  %142
  re[fad mi la,]
  re[mi fad mi]
  re[si' la la,]

  %145
  re[re re re]
  re[re re re]
  re[re re re]

  %148
  sol[sol sol sol]
  sol[sol sol sol]\mbreak
  re16 re, re' re, re' re, re' re,

  %151
  re' re, re' re, re' re, re' re,
  sol'8[sol, re' re,]
  sol4\fermata r

}

Ibcn = \relative do {

  sol4 r16 sol' si, sol
  re'4 r16 re' fad, re
  sol8[re re re]

  %4
  re[re re re]
  re[re re re]
  sol,16 sol' si, la sol8 sol'

  %7
  re[re re la]
  re[re re re]
  re16 la' fad mi re4

  %10
  r16 la' fad mi re8 sol\mbreak
  la8[si dod la]
  re,[fad mi la,]

  %13
  re[fad mi la,]
  re[mi fad mi]
  re[si' la la,]

  %16
  re[re re re]
  re[re re re]
  re[re re re]

  %19
  sol[sol sol sol]
  sol[sol sol sol]\mbreak
  re16 re, re' re, re' re, re' re,

  %22
  re' re, re' re, re' re, re' re,
  sol'8[sol, re' re,]
  sol4 r

  %25
  R2*16
  re'4 r16 re' fad, re
  la'4 r16 la dod, la

  %43
  re8[re re re]
  la[la la re]
  la[la la la]

  %46
  la[la la la]
  la[la la la]\mbreak
  re[re re re]

  %49
  re[re re re]
  la[la la la]
  re[re la' la,]

  %52
  re4 r
  R2*19
  mi8\tu [mi mi si]

  %73
  mi[mi mi si]
  mi[mi mi mi]\mbreak
  fad[si, si si]

  %76
  mi[mi mi mi]
  si'[si, si si]
  mi4 r

  %79
  R2*21
  sol,8\tu [re' re re]
  re[re re re]

  %102
  re[re re re]
  re[re re re]
  re[re re re]\mbreak

  %105
  sol[sol sol sol]
  sol[sol sol sol]
  re16 re, re' re, re' re, re' re,

  %108
  re' re, re' re, re' re, re' re,
  sol'8 sol, r4
  R2*20

  %130
  sol4 r16 sol' si, sol
  re'4 r16 re' fad, re
  sol8[re re re]

  %133
  re[re re re]
  re[re re re]
  sol,16 sol' si, la sol8 sol'

  %136
  re[re re la]
  re[re re re]
  re16 la' fad mi re4

  %139
  r16 la' fad mi re8 sol\mbreak
  la8[si dod la]
  re,[fad mi la,]

  %142
  re[fad mi la,]
  re[mi fad mi]
  re[si' la la,]

  %145
  re[re re re]
  re[re re re]
  re[re re re]

  %148
  sol[sol sol sol]
  sol[sol sol sol]\mbreak
  re16 re, re' re, re' re, re' re,

  %151
  re' re, re' re, re' re, re' re,
  sol'8[sol, re' re,]
  sol4\fermata r

}

Ibfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\key sol\major
\time 2/4
\tempo 2 = 47
s2*153
\bar"|."

}

Iob = {
	\Iglobal
	\notypeset
	<<\Iobn \forma>>

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

IIobn = \relative do'' {

  r4 sol mi'
  mi re2
  re16(mi fad sol la sol fad mi re do si la)

  %4
  si4(fad') la
  dod,16 re mi fad sol fad mi re dod si la sol
  fad4(dod') mi

  %7
  fad8 re mi4. re8
  re2.
  re,4 re' re

  %10
  re dod2
  dod?16 re mi fad sol fad mi re dod! si la sol
  sol4 fad fad'

  %13
  si, mi sol
  lad,4. fad8 si4~
  si8 mi re4~re8(dod?16\tr) si

  %16
  si4 sol mi'
  mi4 re2\mbreak
  si8. la16 sol4 sol'

  %19
  mi8. re16 do4 si'
  fad8. mi16 re4 fad
  sol8. sol,16 \appoggiatura si8 la4.\tr sol8

  %22
  sol2.\fermata

}

IIfgn = \relative do {

  R2.
  r4 sol sol'
  sol fad2

  %4
  sol16 la si do re do si la sol fa mi re
  la4 la' la,
  re16 mi fad sol la sol fad mi re dod si la

  %7
  re mi fad re la'4 la,
  re2.\mbreak
  R2.

  %10
  la4 la' la
  la2 la,4
  re16 mi fad sol la sol fad mi re mi fad re

  %13
  mi fad sol la si la sol fad mi fad sol mi
  fad mi fad sol fad mi re dod re dod re si
  sol' fad sol mi fad4 fad,

  %16
  si r r
  r sol sol'\mbreak
  sol16 la si do re [do si la sol fad mi re]

  %19
  do re mi fad sol fad mi re do re mi do
  re mi fad sol la[sol fad mi re do si la]
  sol la si sol re'4 re,

  %22
  sol2.\fermata

}

IIbcn = \relative do {



  R2.
  r4 sol sol'
  sol fad2

  %4
  sol4 re2
  la4 la' la,
  re la2

  %7
  re4 la' la,
  re2.\mbreak
  R2.

  %10
  la4 la' la
  la2 la,4
  re2.

  %13
  mi
  fad2 re4
  sol fad fad,

  %16
  si r r
  r sol sol'\mbreak
  sol,2 si4

  %19
  do2.
  re
  sol,4 re' re,

  %22
  sol2.\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 50
  s2.*8
  \bar":..:"\break
  s2.*14
  \bar ":|."

}

IIob = {
  \IIglobal
  \notypeset
  <<\IIobn \forma>>

}

IIfg = {
  \IIglobal
  \clef bass
  <<\IIfgn \forma>>

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

IIIobn = \relative do'' {

   sol'8 sol, sol sol' sol, sol sol4. mi'
   re8 sol, sol sol' sol, sol sol4. mi'
   re8 sol si re, sol si do, fad la do, fad la

   %4
   si, re sol si, re sol la,4. r8 r re'
   re re, re re' re, re re4. re'
   do8 re, re do' re, re\mbreak re4. do'

   %7
   si8 re, re si' re, re re4. si'
   la16(sol fad8) la do,16(si la8) do la'16(sol fad8) la do,16(si la8) do
   si si'4~si8 la sol re sol4~sol8 fad mi

   %10
   re mi4~mi8 re do si do4~do8 si la
   si16(la sol8) do si16(la sol8) do si16(la sol8) sol' si, do la\mbreak
   sol4. r8 r re' sol fad sol sol fad sol %%% fine ripresa

   %13
   sol4.~sol4 si8 la sol fad mi re do
   do4\tr si8 r r mi re4. do\tr
   si16 la sol8 r r r mi' re4. do\tr

   %16
   si16 la sol8 r r r sol' mi4. re\tr
   dod16 si la8 r r r mi'\mbreak fad sol la la sol fad
   mi fad sol sol fad mi re mi fad fad mi re

   %19
   dod re mi mi re dod fad4.\tr sol\tr
   la\tr sol\tr fad8 mi re mi re dod
   re4. r fad\tr sol\tr

   %22
   la\tr sol\tr fad8 mi re mi re dod
   re re re re' re, re\mbreak re4. re'
   do8 re, re do' re, re re4. do'

   %25
   si8 re, re si' re, re re4. si'
   la16(sol fad8) la do,16(si la8) do la'16(sol fad8) la do,16(si la8) do
   si16(la sol8) re' si'16(la sol8) si  dod,16(si la8) mi' sol16(fad mi8) sol

   %28
   fad16 mi re8 la' fad sol mi fad16 mi re8 la' fad sol mi \mbreak
   re4. la'~la8 sol fad sol fad mi
   red dod si sol'4. fad8 mi red la'4.

   %31
   sol8 fad mi si'4.~si8 la sol fad mi re
   do4. la' ~la8 sol fad mi re do
   si4. sol'~sol8 fad mi re do si

   %34
   la4. fad'~\mbreak fad8 mi red do si la
   sol4. r8 r red' mi(red) mi r r si
   sol' fad sol r r mi si' la si r r mi,

   %37
   fad4. red mi8 si la sol fad mi
   mi' si la sol fad mi sol'4. fad\tr
   mi8 mi, mi mi' mi, mi mi4. do'

   %40
   si8 mi, mi mi' mi, mi\mbreak mi4. do'
   si8 mi sol si, mi sol la, red fad la, red fad
   sol, si mi sol, si mi fad,4. r8 r si'

   %43
   si si, si si' si, si si4. si'
   la8 si, si la' si, si si4. la'
   sol8 si, si sol' si, si si4. sol'

   %46
   sol16(fad mi8) sol fad16(mi red8) fad\mbreak sol16(fad mi8) sol fad16(mi red8) fad
   mi16 fad sol fad mi8 fad16 sol la sol fad8 sol16 la si la sol8 fad16 sol la sol fad8
   sol16 fad mi8 r r r sol la4. sol

   %49
   fad sol la sol
   fad r r8 mi re do si la
   fad'2.~\mbreak fad8 re do si la sol

   %52
   mi'2.~mi8 do si la sol fad
   sol fad mi mi'4. mi8 sol fad mi4.
   mi8 sol fad mi4. re8 fad si dod,4.

   %55
   si8 si'4~si8 la sol fad sol4~sol8 fad mi\mbreak
   re si'4~si8 la sol fad sol4~sol8 fad mi
   re16(dod si8) mi re16(dod si8) mi re16(dod si8) si' re,8 mi dod

   %58
   si4. r8 r re sol fad sol sol fad sol
   sol4.~sol4 si8 la sol fad mi re do\mbreak
   do4\tr si8 r r mi re4. do\tr

   %61
   si16 la sol8 r r r mi' re4. do
   si16 la sol8 r r r re' sol fad sol fa mi fa
   mi do re mi fad sol la sol la sol fad sol

   %64
   fad re mi fad sol la si la si la sol la\mbreak
   sol mi fad sol la si do,2.~
   do8 re mi fad sol la si,2.~

   %67
   si8 do re mi fad sol la,4. r8 r re
   do4. si la r8 r re
   do4. si la r8 r re

   %70
   mi2.~\mbreak mi8 sol fad mi re do
   fad2.~fad8 la sol fad mi re
   si' sol fad sol4 do,8 si4. la

   %73
   sol r8 r sol' fad mi fad mi re mi
   re4. r8 r mi re do re do si do
   si4. r8 r re\mbreak mi2.~

   %76
   mi8 sol fad mi re do fad2.~
   fad8 la sol fad mi re si' sol fad sol4 r8
   r do, si do4 r8 r fad mi fad4 r8

   %79
   r la sol la4. r8 do, si do si la
   si' la sol fad4 sol8 sol2.\fermopz
   sol8 sol, sol sol' sol, sol sol4. mi'

   %82
   re8 sol, sol sol' sol, sol sol4. mi'
   re8 sol si re, sol si do, fad la do, fad la
   si, re sol si, re sol la,4. r8 r re'

   %85
   re re, re re' re, re re4. re'
   do8 re, re do' re, re\mbreak re4. do'
   si8 re, re si' re, re re4. si'

   %88
   la16(sol fad8) la do,16(si la8) do la'16(sol fad8) la do,16(si la8) do
   si si'4~si8 la sol re sol4~sol8 fad mi
   re mi4~mi8 re do si do4~do8 si la

   %91
   si16(la sol8) do si16(la sol8) do si16(la sol8) sol' si, do la\mbreak
   sol4.\fermata r r2.

}

IIIvlIn =  \relative do'' {

   sol'8 sol, sol sol' sol, sol sol4. mi'
   re8 sol, sol sol' sol, sol sol4. mi'
   re8 sol si re, sol si do, fad la do, fad la

   %4
   si, re sol si, re sol la,4. r8 r re'
   re re, re re' re, re re4. re'
   do8 re, re do' re, re\mbreak re4. do'

   %7
   si8 re, re si' re, re re4. si'
   la16(sol fad8) la do,16(si la8) do la'16(sol fad8) la do,16(si la8) do
   si si'4~si8 la sol re sol4~sol8 fad mi

   %10
   re mi4~mi8 re do si do4~do8 si la
   si16(la sol8) do si16(la sol8) do si16(la sol8) sol' si, do la\mbreak
   sol4. r r2.

   %13
   R1.*10
   re''8 re, re re' re, re\mbreak re4. re'
   do8 re, re do' re, re re4. do'

   %25
   si8 re, re si' re, re re4. si'
   la16(sol fad8) la do,16(si la8) do la'16(sol fad8) la do,16(si la8) do
   si16(la sol8) re' si'16(la sol8) si  dod,16(si la8) mi' sol16(fad mi8) sol

   %28
   fad16 mi re8 la' fad sol mi fad16 mi re8 la' fad sol mi \mbreak
   re4. r r2.
   R1.*9
   mi8 mi, mi mi' mi, mi mi4. do'

   %40
   si8 mi, mi mi' mi, mi\mbreak mi4. do'
   si8 mi sol si, mi sol la, red fad la, red fad
   sol, si mi sol, si mi fad,4. r8 r si'

   %43
   si si, si si' si, si si4. si'
   la8 si, si la' si, si si4. la'
   sol8 si, si sol' si, si si4. sol'

   %46
   sol16(fad mi8) sol fad16(mi red8) fad\mbreak sol16(fad mi8) sol fad16(mi red8) fad
   mi4. r r2.
   R1.*7

   %55
   si8 si'4~si8 la sol fad sol4~sol8 fad mi\mbreak
   re si'4~si8 la sol fad sol4~sol8 fad mi
   re16(dod si8) mi re16(dod si8) mi re16(dod si8) si' re,8 mi dod

   %58
   si4. r r2.
   R1.*22
   sol'8 sol, sol sol' sol, sol sol4. mi'

   %82
   re8 sol, sol sol' sol, sol sol4. mi'
   re8 sol si re, sol si do, fad la do, fad la
   si, re sol si, re sol la,4. r8 r re'

   %85
   re re, re re' re, re re4. re'
   do8 re, re do' re, re\mbreak re4. do'
   si8 re, re si' re, re re4. si'

   %88
   la16(sol fad8) la do,16(si la8) do la'16(sol fad8) la do,16(si la8) do
   si si'4~si8 la sol re sol4~sol8 fad mi
   re mi4~mi8 re do si do4~do8 si la

   %91
   si16(la sol8) do si16(la sol8) do si16(la sol8) sol' si, do la\mbreak
   sol4.\fermata r r2.

}

IIIvlIIn = \relative do'' {

  sol'8 sol, sol sol' sol, sol sol4. do
  si8 sol sol sol' sol, sol sol4. do
  si8 re sol si, re sol la, do fad la, do fad

  %4
  sol, si re sol, si re fad,4. r
  r r8 r re'' re re, re re' re, re
  re4. do'\mbreak do8 re, re do' re, re

  %7
  re4. si' si8 re, re si' re, re
  fad16(mi re8) fad la,16(sol fad8) la fad'16(mi re8) fad la,16(sol fad8) la
  sol8 sol'4~sol8 fad mi si mi4~mi8 re do

  %10
  si do4~do8 si la sol la4~la8 sol fad
  sol16(la si8) la sol16(la si8) la sol16(la si8) sol sol la fad\mbreak
  sol4. r r2. %%%% ripresa

  %13
  R1.*10
  r2. re''8 re, re re' re, re
  re4. do' do8 re, re do' re, re

  %25
  re4. si' si8 re, re si' re, re
  fad16(mi re8) fad la,16(sol fad8) la fad'16(mi re8) fad la,16(sol fad8) la
  sol16(la si8) si sol'16(la si8) sol mi16(re dod8) dod mi16(re dod8) mi

  %28
  re16(mi fad8) fad re mi dod re16(mi fad8) fad re mi dod\mbreak
  re4. r r2.
  R1.*9

  %39
  mi8 mi, mi mi' mi, mi mi4. la
  sol8 mi mi mi' mi, mi\mbreak mi4. la
  sol8 si mi sol, si mi fad, la red fad, la red

  %42
  mi, sol si mi, sol si dod,4. r
  r r8 r si'' si si, si si' si, si
  si4. la' la8 si, si la' si, si

  %45
  si4. sol' sol8 si, si sol' si, si
  mi16(fad sol8) mi red16 mi fad8 red\mbreak mi16(fad sol8) mi red16 mi fad8 red
  mi4. r r2.

  %48
  R1.*7
  si8 sol'4~sol8 fad mi re mi4~mi8 re dod\mbreak
  si sol'4~sol8 fad mi re mi4~mi8 re dod

  %57
  si16 dod re8 dod si16 dod re8 dod si16 dod re8 dod si dod la
  si4. r r2.
  R1.*22

  %81
  sol'8 sol, sol sol' sol, sol sol4. do
  si8 sol sol sol' sol, sol sol4. do
  si8 re sol si, re sol la, do fad la, do fad

  %84
  sol, si re sol, si re fad,4. r
  r r8 r re'' re re, re re' re, re
  re4. do'\mbreak do8 re, re do' re, re

  %87
  re4. si' si8 re, re si' re, re
  fad16(mi re8) fad la,16(sol fad8) la fad'16(mi re8) fad la,16(sol fad8) la
  sol8 sol'4~sol8 fad mi si mi4~mi8 re do

  %90
  si do4~do8 si la sol la4~la8 sol fad
  sol16(la si8) la sol16(la si8) la sol16(la si8) sol sol la fad\mbreak
  sol4.\fermata r r2.

}

IIIvlan =  \relative do' {

   r2. sol'8 sol, sol sol' sol, sol
   sol4. sol sol'8 sol, sol sol' sol, sol
   sol sol' sol, sol4 r8 re' re' re, re4 r8

   %4
   sol, sol' sol, sol4 r8 re'' re, re re' re, re
   fad16 sol la8 fad r4. fad16 sol la8 fad r4.
   fad16 sol la8 fad r4.\mbreak   fad16 sol la8 fad r4.

   %7
   si16 do re8 si r4. si16 do re8 si r4.
   re,8 re' re, re4 r8 re re' re, re4 r8
   sol sol, sol sol4 r8 sol' sol, sol sol4 r8

   %10
   sol' sol, sol sol4 r8 sol' re re re4 r8
   re4. re re re8 mi re \mbreak
   si4. r r2. %%%% ripresa

   %13
   R1.*10
   fad'16 sol la8 fad r4.\mbreak fad16 sol la8 fad r4.
   fad16 sol la8 fad r4. fad16 sol la8 fad r4.

   %25
   si16 do re8 si r4.  si16 do re8 si r4.
   re,8 re' re, re4 r8 re re' re, re4 r8
   re4 r8 re4 r8 mi4 r8 dod4 r8

  %28
   la4 la'8 la si la  la,4 la'8 la si la\mbreak
   fad4. r r2.
   R1.*9

   %39
   r2. mi8 mi, mi mi' mi, mi
   mi'4. mi\mbreak mi8 mi, mi mi' mi, mi
   mi mi' mi, mi4 r8 si' si' si, si4 r8

   %42
   mi, mi' mi, mi4 r8 si'' si, si si' si, si
   red8 fad red r4. red8 fad red r4.
   red8 fad red r4. red8 fad red r4.

   %45
   sol8 si sol r4. sol8 si sol r4.
   si si\mbreak si si
   sol r r2.

   %48
   R1.*7
   si,8 si' si, si si' si, si si' si, si si' si,\mbreak
   si si' si, si si' si, si si' si, si si' si,

   %57
   fad'4. fad fad fad8 sol fad
   fad4. r r2.
   R1.*22

   %81
   sol8 sol, sol sol' sol, sol sol4. mi'
   re8 sol, sol sol' sol, sol sol4. mi'
   re8 sol si re, sol si do, fad la do, fad la

   %84
   si, re sol si, re sol la,4. r8 r re'
   re re, re re' re, re re4. re'
   do8 re, re do' re, re\mbreak re4. do'

   %87
   si8 re, re si' re, re re4. si'
   la16(sol fad8) la do,16(si la8) do la'16(sol fad8) la do,16(si la8) do
   si si'4~si8 la sol re sol4~sol8 fad mi

   %90
   re mi4~mi8 re do si do4~do8 si la
   si16(la sol8) do si16(la sol8) do si16(la sol8) sol' si, do la\mbreak
   sol4.\fermata r r2.

}

IIIfgn = \relative do {

   r2. sol'8 sol, sol sol' sol, sol
   sol4. sol sol'8 sol, sol sol' sol, sol
   sol sol' sol, sol4 r8 re' re' re, re4 r8

   %4
   sol, sol' sol, sol4 r8 re'' re, re re' re, re
   re16 mi fad8 re r4. re16 mi fad8 re r4.
   re16 mi fad8 re r4. \mbreak re16 mi fad8 re r4.

   %7
   sol16 la si8 sol r4. sol16 la si8 sol r4.
   re4 r8 re4 r8 re4 r8 re4 r8
   sol sol, sol sol4 r8 sol' sol, sol sol4 r8

   %10
   sol' sol, sol sol4 r8 sol' re re re4 r8
   sol, sol' fad sol, sol' fad sol, sol' sol, sol do re\mbreak
   sol,4. r r r8 r sol

   %13
   sol' fad sol sol fad sol re4. fad
   sol8 sol, sol' do sol, do' si sol, si' la sol, la'
   sol sol, sol' do sol, do' si sol, si' la sol, la'

   %16
   sol sol, sol' si sol, si' sol sol, sol' sold mi sold
   la la, la' dod la, dod'\mbreak re4 r8 re,4 r8
   dod'4 r8 dod,4 r8 si'4 r8 si,4 r8

   %19
   la'4 r8 la,4 r8 re re, re' mi mi, mi'
   fad fad, fad' mi mi, mi' re re, re' la' la, la'
   re, si' la sol fad mi re re, re' mi mi, mi'

   %22
   fad fad, fad' mi mi, mi' re re, re' la' la, la'
   re,16 mi fad8 re r4.\mbreak re16 mi fad8 re r4.
   re16 mi fad8 re r4. re16 mi fad8 re r4.

   %25
   sol16 la si8 sol r4. sol16 la si8 sol r4.
   re4 r8 re4 r8 re4 r8 re4 r8
   sol,4 r8 sol4 r8 la4 r8 la4 r8

   %28
   re8 re' re, re sol, la re8 re' re, re sol, la\mbreak
   re4. r red mi
   si'8 si, si' si si, si' si si, si' si si, si'

   %31
   mi, mi, mi' mi mi, mi' mi mi, mi' mi mi, mi'
   la la, la' la la, la' fad fad, fad' fad fad, fad'
   sol sol, sol' sol sol, sol' mi mi, mi' mi mi, mi'

   %34
   fad fad, fad' fad fad, fad'\mbreak red red, red' red red, red'
   mi4. r8 r si' mi si la sol fad mi
   mi' si la sol fad mi mi' si la sol fad mi

   %37
   la,4. si mi r
   mi r mi si

   %39
   mi4.  r mi8 mi, mi mi' mi, mi
   mi'4. mi\mbreak mi8 mi, mi mi' mi, mi
   mi mi' mi, mi4 r8 si' si' si, si4 r8

   %42
   mi, mi' mi, mi4 r8 si'' si, si si' si, si
   si'16 dod red8 si r4. si16 dod red8 si r4.
   si16 dod red8 si r4. si16 dod red8 si r4.

   %45
   mi,16 fad sol8 mi r4. mi16 fad sol8 mi r4.
   mi,8 mi' mi, si' si' si,\mbreak mi, mi' mi, si' si' si,
   mi4. red mi red

   %48
   mi16 fad sol fad mi8 mi16 fad sol fad mi8 red16 mi fad mi red8 mi16 fad sol fad mi8
   si16 dod red dod si8 mi16 fad sol fad mi8 red16 mi fad mi red8 mi16 fad sol fad mi8
   si si' la sol fad mi do'2.

   %51
   r8 la sol fad mi re\mbreak si'2.
   r8 sol fad mi re do la' la sol fad mi red
   mi4. r8 r sol fad fad, fad' lad si dod
   fad, fad, fad' lad si dod si si, si' fad fad, fad'

   %55
   si, si' si, si si' si, si si' si, si si' si,\mbreak
   si si' si, si si' si, si si' si, si si' si,
   si si' lad si, si' lad si, si' si, si mi fad

   %58
   si,4. r r r8 r sol
   sol' fad sol sol fad sol re4. fad\mbreak
   sol8 sol, sol' sol sol, do' si sol, si' la sol, la'

   %61
   sol sol, sol' sol sol, do' si sol, si' la sol, la'
   sol sol, sol' sol sol, sol' si4. sol
   do4 r8 do,4 r8 dod'4. la

   %64
   re4 r8 re,4 r8 red'4. si\mbreak
   mi4 r8 mi,4 r8 la do si la fad mi
   re4. r sol8 si la sol mi re

   %67
   do4. dod re8 la fad re4 si''8
   la sol la sol fad sol re la fad re4 si''8
   la sol la sol fad sol re la fad re4 si''8

   %70
   do si do do si do\mbreak do,4. r
   re'8 do re re do re re,4. r
   sol r8 r fad sol sol, sol' re re, re'

   %73
   sol,4. r8 r mi''re do re do si do
   si4. r8 r do si la si la sol la
   sol4. r8 r si\mbreak do si do do si do

   %76
   do,4. r re'8 do re re do re
   re,4. r sol,8 sol' sol, sol sol' sol,
   re' re' re, re re' re, re re' re, re re' re,

   %79
   re re' re, re re' re, re re' re, re re' re,
   sol, sol' sol, re re' re, sol2.\fermata
   r2. sol'8 sol, sol sol' sol, sol

   %82
   sol4. sol sol'8 sol, sol sol' sol, sol
   sol sol' sol, sol4 r8 re' re' re, re4 r8
   sol, sol' sol, sol4 r8 re'' re, re re' re, re

   %85
   re16 mi fad8 re r4. re16 mi fad8 re r4.
   re16 mi fad8 re r4. \mbreak re16 mi fad8 re r4.
   sol16 la si8 sol r4. sol16 la si8 sol r4.

   %88
   re4 r8 re4 r8 re4 r8 re4 r8
   sol sol, sol sol4 r8 sol' sol, sol sol4 r8
   sol' sol, sol sol4 r8 sol' re re re4 r8

   %91
   sol, sol' fad sol, sol' fad sol, sol' sol, sol do re\mbreak
   sol,4.\fermata r r2.

}

IIIbcn = \relative do {

   r2. sol'8 sol, sol sol' sol, sol
   sol4. sol sol'8 sol, sol sol' sol, sol
   sol sol' sol, sol4 r8 re' re' re, re4 r8

   %4
   sol, sol' sol, sol4 r8 re'' re, re re' re, re
   re16 mi fad8 re r4. re16 mi fad8 re r4.
   re16 mi fad8 re r4. \mbreak re16 mi fad8 re r4.

   %7
   sol16 la si8 sol r4. sol16 la si8 sol r4.
   re4 r8 re4 r8 re4 r8 re4 r8
   sol sol, sol sol4 r8 sol' sol, sol sol4 r8

   %10
   sol' sol, sol sol4 r8 sol' re re re4 r8
   sol, sol' fad sol, sol' fad sol, sol' sol, sol do re\mbreak
   sol,4. r r2.

   %13
   R1.*10
   re'16\tu mi fad8 re r4.\mbreak re16 mi fad8 re r4.
   re16 mi fad8 re r4. re16 mi fad8 re r4.

   %25
   sol16 la si8 sol r4. sol16 la si8 sol r4.
   re4 r8 re4 r8 re4 r8 re4 r8
   sol,4 r8 sol4 r8 la4 r8 la4 r8

   %28
   re8 re' re, re sol, la re8 re' re, re sol, la\mbreak
   re4. r r2.
   R1.*9

   %39
   mi4.\tu  r mi8 mi, mi mi' mi, mi
   mi'4. mi\mbreak mi8 mi, mi mi' mi, mi
   mi mi' mi, mi4 r8 si' si' si, si4 r8

   %42
   mi, mi' mi, mi4 r8 si'' si, si si' si, si
   si'16 dod red8 si r4. si16 dod red8 si r4.
   si16 dod red8 si r4. si16 dod red8 si r4.

   %45
   mi,16 fad sol8 mi r4. mi16 fad sol8 mi r4.
   mi,8 mi' mi, si' si' si,\mbreak mi, mi' mi, si' si' si,
   mi4. r r2.
   R1.*7

   %55
   si8\tu si' si, si si' si, si si' si, si si' si,\mbreak
   si si' si, si si' si, si si' si, si si' si,
   si si' lad si, si' lad si, si' si, si mi fad

   %58
   si,4. r r2.
   R1.*22
   r2. sol'8 sol, sol sol' sol, sol

   %82
   sol4. sol sol'8 sol, sol sol' sol, sol
   sol sol' sol, sol4 r8 re' re' re, re4 r8
   sol, sol' sol, sol4 r8 re'' re, re re' re, re

   %85
   re16 mi fad8 re r4. re16 mi fad8 re r4.
   re16 mi fad8 re r4. \mbreak re16 mi fad8 re r4.
   sol16 la si8 sol r4. sol16 la si8 sol r4.

   %88
   re4 r8 re4 r8 re4 r8 re4 r8
   sol sol, sol sol4 r8 sol' sol, sol sol4 r8
   sol' sol, sol sol4 r8 sol' re re re4 r8

   %91
   sol, sol' fad sol, sol' fad sol, sol' sol, sol do re\mbreak
   sol,4.\fermata r r2.

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key sol\major
   \time 12/8
   \tempo 2. = 55
   s1.*92
   \bar"|."


}

IIIob = {
   \IIIglobal
   %\notypeset
   <<\IIIobn \forma>>

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

  \markup\huge "[1.] And[an]te molto "

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
      } <<


        \new Staff  <<
          \set Staff.midiInstrument = #"oboe"
          \set Staff.instrumentName = \markup \center-column{"[Oboe]"}
          \Iob
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
          \IvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
          \IvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"[Viola]"}
          \Ivla
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"bassoon"
          \set Staff.instrumentName = \markup \center-column{"Fagotto"}
          \Ifg
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

      indent = 1.4\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
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

  \markup\huge "[2.] Largo "

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<


        \new Staff  <<
          \set Staff.midiInstrument = #"oboe"
          \set Staff.instrumentName = \markup \center-column{"[Oboe]"}
          \IIob
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"bassoon"
          \set Staff.instrumentName = \markup \center-column{"Fagotto"}
          \IIfg
        >>
        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        }<<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"[Basso]"}
          \IIbc

        >>
      >>

    }

    \layout {

      indent = 1.4\cm

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

  \markup\huge "[3.] All[egr]o molto"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
      } <<


        \new Staff  <<
          \set Staff.midiInstrument = #"oboe"
          \IIIob
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
          \set Staff.midiInstrument = #"bassoon"
          \IIIfg
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
        \override StaffGrouper.staff-staff-spacing.padding = #2
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



