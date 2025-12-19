\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = ^\markup\italic"tasto solo"

tr = \trill

ten = ^\markup \italic "ten"

dolce = _\markup\italic "dolce"

arco = _\markup \italic "coll'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "tutti"

pad = \once \override TextScript.padding = #1.5

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

stacc = \staccatissimo

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

mbreak = { }


Ifln = \relative do'' {

  la4. la16 si do4\tr~do8.(si32 la)
  mi'4. si16 do re4.\tr(do16 si)
  do4\upl la'\upl fa\upl re\upl

  %4
  do8(si) r sold'16 (la) si re, mi fa mi re do si
  do4\upl la'\upl\mbreak fa\upl re\upl
  do32(re mi8.)~mi4 si32(do re8.)~re4

  %7
  do32(si la8.)~la4~la8 si16 do re mi fad sold
  la4\upl mi\upl dod\tr~dod8.(si32 la)
  re4 re, r8 r16 la'[re8. fa16]

  %10
  mi4 la,, r8 dod'16 re mi fa sol mi
  fa4 fa,\mbreak r8 la'16 sol fa mi re do
  si la sol fad sol la si do re fa, sol la sol fa mi re

  %13
  mi8 r do4 mi sol
  do,4. r16 sol'' mi4\tr~mi8.(re32 do)
  re8 r sol,,8. sol16 si8. si16 re8. re16

  %16
  si''4. r16 re,\mbreak re4\tr~re8.(do32 si)
  do8\upl r r4 r2
  si8\upl r si'16 si si si si si si si si si si si

  %19
  si8\upl r re16 re re re re re re re re re re re
  do(si la4.) si2\tr
  la4\upl r r2

  %22
  si8\p\upl r si,16 si si si\mbreak si si si si si si si si
  si8\f\upl r re16 re re re re re re re re re re re
  do mi la mi fa re do si si2\tr

  %25
  la4. la,16 si do4\tr~do8.(si32 la)
  fa'8. la16 re,8. fa16 si,4_\upl mi_\upl\mbreak
  la,2 r

  %28
  la'4.\solo la16 si do4\tr~do8.(si32 la)
  mi'4. si16 do re4.\tr(do16 si)
  do4 la'-.(la-. la-.) %%%%5 inizio primo solo

  %31
  \grace si8 la4 sold8. si16 mi,4 mi
  mi do'(si la)
  la(sold8.) fa16 fa4(mi8.) re16

  %34
  do8.\tr si16 la4 r16 la(si do re mi fad sold)
  la4 mi dod\tr~dod8.(si32 la)
  re4 re, r8 re'16 mi fa8.\tr mi32 re\mbreak

  %37
  mi4 la, r8 mi'16 fa sol8.\tr fa32 mi
  fa16(re8.) la'16(sol8.) fa16(mi8.) re16(do8.)
  si4\upl sol'(re8) si16 do \grace mi8 re do16 si

  %40
  do4\upl sol'(mi8) do16 re \grace fa8 mi re16 do
  re4\upl re'(si8) re,16 mi \grace sol8 fa mi16 re
  mi4\upl do' \grace si8 la4 re\mbreak

  %43
  \grace do8 si4 do16(sol8.) sib16(la8.) re16(do8.)\grace do4
  si!2 r
  fad4~fad8.(sol32 la) fad4 fad

  %46
  sol16 fad mi re do si la sol sol' fad  mi re do si la sol
  fad'4~fad8.(sol32 la) fad4 fad
  sol16(re8.) \grace fa16 mi16(re8.)\mbreak do16\tr(si8.) la16\tr(sol8.)

  %49
  si'4~si8.(do32 re) si4 si
  do16 si la sol fa mi re do do' si la sol fa mi re do
  si'4~si8.(do32 re) si4 si

  %52
  do16(sol8.) \grace si8 la16(sol8.) fa16\tr(mi8.) re16\tr (do8.)
  re'2~re8 re,16 mi fa8 fa\mbreak
  mi8.\tr fa16 sol4 r2

  %55
  re'2~re8 re,16 mi fa8 fa
  mi8.\tr fa16 sol4 r r8 r16 sol
  la la, si do re fa mi re sol sol, la si do mi re do

  %58
  la' la, si do re fa mi re sol sol, la si do mi re do
  fa(mi fa) re' fa,(mi fa) re\mbreak mi(re mi) do' mi,(re mi) do
  re dod re la' re, dod re la do si do la' do, si do la

  %61
  si4 r r2
  si16(la si) re re(do re) sol sol fad sol re re do re si
  do4 r r2

  %64
  do16 si do mi mi re mi sol\mbreak sol fa sol mi mi re mi do
  re4 r r2
  re16 do re fa fa mi fa la la sol la fa fa mi fa re

  %67
  mi sol mi do fa la fa re mi sol mi do fa la fa re
  mi do mi sol sib2.
  la16 sold la sold la2 sol16 fa mi re\mbreak

  %70
  do4.\tr re8 re2\tr
  mi16 do mi sol sib2.
  la16 sold la sold la fa mi re sol fad sol fad sol mi re do

  %73
  la' sold la sold la fa mi re sol fad sol fad sol mi re do
  fa! sol la sol fa mi re do si do re do si la sol fa\mbreak
  mi4 sol'\tr la do,

  %76
  sol4. do16 re re2\tr
  mi16(re mi) do' la(sol la) do fa, mi fa la re, do re la'
  sol,4.(la32 si do re) re2\tr

  %79
  do4.\tu do16 re mi4\tr~mi8.(re32 do)
  sol'4. re16 mi fa4\tr~fa8.(mi32 re)  %% fine prima pagina OOO KKKKKKK
  mi4\upl do'\upl la\upl fa\upl

  %82
  mi8(re) r si'16(do) re8 re,16 mi \grace sol fa8 mi16 re
  mi4\upl do'\upl la\upl fa\upl
  mi32(fa sol8.)~sol4 re32(mi fa8.)~fa4\mbreak

  %85
  mi32(re do8.)~do4 r16 do\solo (re mi fa sol la si)
  do4\upl sol\upl mi\tr~mi8.(re32 do)
  fa4 fa, r8 r16 do'[fa8. la16]

  %88
  sol4 do, r8 mi16 fa sol la sib sol
  la4 fa, r8 fa'16 sol la sib do la\mbreak
  re re, mi fad sol sib la sol do do, re mi fa la sol fa

  %91
  re' re, mi fad sol sib la sol do do, re mi fa la sol fa
  sib do sib la sol fa mi re mi la sol fa mi re do sib\mbreak
  la8\tu sol16 la sib do re mi fa8 fa fa fa

  %94
  fa fa, fa' fa fa la, sol fa
  do do'16 si! do8 do do[do,] r r16 do''\solo
  do4\tr~do8.(sib32 do) re4\upl do\upl

  %97
  \grace do sib2\mbreak r4 r8 r16 sol
  la4\tr~la8.(sol32 la) sib4\upl la\upl
  \grace la4 sol2 r4 do,

  %100
  fa16(do8.) la'16(do,8.) sol'16(do,8.) sib'16(sol8.)
  la8.\tr sib?16 do4 r do,
  \terzinequarto \tuplet 3/2 {
    fa8 do fa la[sol fa] sol do, sol' sib[la sol]\mbreak

    %103
    la\tr sol fa
  } fa4 r2
  r r4 la,
  re16(la8.) fa'16(la,8.) mi'16(la,8.) sol'16(mi8.)

  %106
  fa8.\tr sol16 la4 r la,
  \tuplet 3/2 {
    re8 la re fa[mi re] mi la, mi' sol[fa mi]
    fa\tr mi re
  }  re4 r2\mbreak

  %109
  re8 mi16 fa sol la si dod re8 re re do
  \grace do sib2. la4
  sol8 sib16 la sol8-. sol-. sol-. sol-. sol-. sol-.

  %112
  sol sib16 la sol8 sol sol sol sol sol
  dod4\tr re r4 r8 r16 sol,
  fa32(mi re8.) dod32(si la8.) mi'2\tr

  %115
  re4 re,\tu_\upl fa_\upl la_\upl
  re,4. r16 la'' fa4\tr~fa8.(mi32 re)
  mi8 r la,,8. la16 dod8. dod16 mi8. mi16

  %118
  mi'4. r16 sol, sol4\tr~sol8.(fa32 mi)
  fa8 r r4 r2\mbreak
  mi8_\upl r mi'16 mi mi mi mi mi mi mi mi mi mi mi

  %121
  mi8\upl r sol16 sol sol sol sol sol sol sol sol sol sol sol
  fa(mi re4.) mi2\tr
  re4\upl r r2

  %124
  mi8\p\upl r mi,16 mi mi mi mi mi mi mi mi mi mi mi\mbreak
  mi8\f r sol16 sol sol sol sol sol sol sol sol sol sol sol
  fa la re la sib sol fa mi mi2\tr

  %127
  re'4.\solo re16 mi fa4\tr~fa8.(mi32 re)
  la'4. mi16 fa sol4\tr~sol8.(fa32 mi)
  fa4\upl re'\upl sib\upl sol\upl\mbreak

  %130
  fa8(mi) r dod'16 re mi sol, la sib la sol fa mi
  fa4\upl re'\upl sib\upl sol\upl
  fa32(sol la8.)~la4 mi32(fa sol8.)~sol4

  %133
  fa32(mi re8.)~re4 r2
  fa16 re la' sol fa re la' sol\mbreak fa re la' sol fa mi re do
  si! sol si re sol re sol si re do si la sol fa mi re

  %136
  mi do sol' fa mi do sol' fa mi do sol' fa mi re do si
  la fa la do fa do fa la\mbreak do si la sol fa mi re do
  re si fa' mi re si fa' mi re si fa' mi re do si la

  %139
  sold mi sold si mi si mi sold si la sold fa mi re do si
  do4.\tu la16 si do4\tr~do8.(si32 la)\mbreak %%%Fine prima riga p. 3
  mi'4. si16 do re4\tr~re8.(do32 si)

  %142
  la'4.\solo la16 si do4\tr~do8.(si32 la)
  mi'4. si16 do re4\tr~re8.(do32 si)
  do4 la-.(la-. la-.)

  %145
  \grace si8 la4 sold8. si16 mi,4 mi
  mi do'(si la)\mbreak
  la(sold8.) fa16 fa4(mi8.) re16

  %148
  do4 r r2
  dod16 si dod mi mi re mi la la sold la mi mi re mi dod
  re4 r r2

  %151
  re16 dod re fa fa mi fa la la sol la fa fa mi fa re
  mi4 r r2
  mi16 re mi sol sol fa sol sib sib la sib sol sol fa sol mi

  %154
  fa re la' sol fa re la' sol fa re la' sol fa mi re do
  si la si re re do re sol sol si re do si la sol fa\mbreak
  mi do sol' fa mi do sol' fa mi do sol' fa mi re do si

  %157
  la sol la do do si do fa fa la do si la sol fa mi
  re si fa' mi re si fa' mi re si fa' mi re do si la
  sold fad sold si si la si mi\mbreak mi sold si la sold fa mi re

  %160
  do8\tu si16 do re mi fad sold la8 la la la
  la la, la' la la do, si la
  mi mi'16 red mi8 mi mi mi, r r16 do''\solo

  %163
  do4\tr~do8.(si32 do)\mbreak re4\upl do\upl
  \grace do4 si2 r4 r8 r16 sold
  la4\tr~la8.(sold32 la) si4\upl la\upl

  %166
  \grace la4 sold2 r4 mi
  la16(mi8.) do'16(mi,8.) si'16(mi,8.) re'16(si8.)
  do16 si do re mi4 r mi,\mbreak

  %169
  \tuplet 3/2 {
    la8 mi la do[si la] si mi, si' re[do si]
    do si la
  } la4 r2
  la,8 si16 do re mi fa sol la8 la la sol

  %172
  \grace sol4 fa2. mi4
  re8 fa16 mi re8-. re-. re-. re-. re-. re-.
  re8 fa16 mi re8 re re re re re

  %175
  sold4\tr la r r8 r16 re
  do32(si la8.) sold32(fa mi8.) si'2\tr
  la4 r r2

  %178
  si2~si8 si,16 do re8 re\mbreak
  do8.\tr re16 mi4 r2
  si'2~si8 si,16 do re8 re

  %181
  do8.\tr re16 mi4 r r8 r16 mi
  fa la fa mi fa la fa mi fa re re' do si la sol fa
  mi sol mi re mi sol mi re\mbreak mi do do' si la sol fa mi

  %184
  re fa re dod re fa re dod re si si' la sold fa mi re
  do mi do la re fa re si do mi do la re fa re si
  do mi do la la' do la mi\mbreak fa la fa re re' do si la

  %187
  sold4\tr la r re,
  do2 si\tr
  la4\tu_\upl mi'\upl dod\tr~dod8.(si32 la)

  %190
  re4 re, r8 r16 la'[re8. fa16]
  mi4 la,, r8 dod'16 re mi fa sol mi
  fa4 re,\mbreak r8 la''16 sol fa mi re do

  %193
  si la sol fad sol la si do re fa, sol la sol fa mi re
  mi8 r do4 mi sol
  do,4. r16 sol'' mi4\tr~mi8.(re32 do)

  %196
  re8 r sol,,8. sol16 si8. si16 re8. re16
  si''4. r16 re,\mbreak re4\tr~re8.(do32 si)
  do8 r r4 r2

  %199
  si8\upl r si'16 si si si si si si si si si si si
  si8\upl r re16 re re re re re re re re re re re
  do(si la4.) si2\tr

  %202
  la4 r r2
  si8\p\upl r si,16 si si si\mbreak si si si si si si si si
  si8\f\upl r re16 re re re re re re re re re re re

  %205
  do mi la mi fa re do si si2\tr
  la4. la,16 si do4\tr~do8.(si32 la)
  fa'8. la16 re,8. fa16 si,4_\upl mi_\upl\mbreak

  %208
  la,2\fermata r

}

IvlIn = \relative do'' {

  la4. la16 si do4\tr~do8.(si32 la)
  mi'4. si16 do re4.\tr(do16 si)
  do4\upl la'\upl fa\upl re\upl

  %4
  do8(si) r sold'16 (la) si re, mi fa mi re do si
  do4\upl la'\upl\mbreak fa\upl re\upl
  do32(re mi8.)~mi4 si32(do re8.)~re4

  %7
  do32(si la8.)~la4~la8 si16 do re mi fad sold
  la4\upl mi\upl dod\tr~dod8.(si32 la)
  re4 re, r8 r16 la'[re8. fa16]

  %10
  mi4 la,, r8 dod'16 re mi fa sol mi
  fa4 fa,\mbreak r8 la'16 sol fa mi re do
  si la sol fad sol la si do re fa, sol la sol fa mi re

  %13
  mi8 r do4 mi sol
  do,4. r16 sol'' mi4\tr~mi8.(re32 do)
  re8 r sol,,8. sol16 si8. si16 re8. re16

  %16
  si''4. r16 re,\mbreak re4\tr~re8.(do32 si)
  do8\upl r r4 r2
  si8\upl r si'16 si si si si si si si si si si si

  %19
  si8\upl r re16 re re re re re re re re re re re
  do(si la4.) si2\tr
  la4\upl r r2

  %22
  si8\p\upl r si,16 si si si\mbreak si si si si si si si si
  si8\f\upl r re16 re re re re re re re re re re re
  do mi la mi fa re do si si2\tr

  %25
  la4. la,16 si do4\tr~do8.(si32 la)
  fa'8. la16 re,8. fa16 si,4_\upl mi_\upl\mbreak
  la,2 r

  %28
  R1*2
  la4.\p la16 si do4\tr~do8.(si32 la)
  mi'4. si16 do re4\tr~re8.(do32 si)

  %32
  do4 la r2
  R1
  r8 mi''\p mi mi mi mi mi mi

  %35
  mi mi mi mi mi mi mi mi
  fa fa fa fa\mbreak fa fa fa fa
  sol sol sol sol sol sol sol sol

  %38
  fa fa fa fa fa fa fa fa
  re r si4(re sol)
  r do,(mi sol)

  %41
  r fa\upl re'\upl fa,\upl
  mi\upl r r2
  R1

  %44
  sol,,4.\f sol16 la si4\tr~si8.(la32 sol)
  re''8\p re re re re re re re
  re re re re re re re re\mbreak

  %47
  re re re re re re re re
  re4\upl r r2
  sol8 sol sol sol sol sol sol sol

  %50
  sol sol sol sol sol sol sol sol
  sol sol sol sol sol sol sol sol
  sol4\upl r r2

  %53
  R1
  do,4.\f do16 re mi4\tr~mi8.(re32 do)
  sol'4 sol,\p r2

  %56
  do4\upl\mf sol_\upl mi\tr~mi8.(re32 do)
  fa4\p_\upl fa'\upl mi,_\upl mi'\upl\mbreak
  R1*3

  %61
  sol,,8\f la16 si do re  mi fad sol8 sol sol sol
  r re'\p re re re re re re
  sol,,\f la16 si do re mi fad sol8 sol sol sol

  %64
  r mi'\p mi mi mi mi mi mi
  sol,,\f la16 si do re mi fad sol8 sol sol sol
  r fa'!\p fa fa fa fa fa fa

  %67
  r mi fa re'\mbreak mi, do' fa, re'
  mi, do r mi \grace sol fa mi16 fa sol8 do,
  r fa do la fa fa' r4

  %70
  r2 r4 r8 fa
  mi do r mi \grace sol fa mi16 fa sol8 do,
  fa,4_\upl fa'\upl mi,_\upl mi'\upl

  %73
  R1*3
  r4 do2\p si4
  R1*2

  %79
  do4.\f do16 re mi4\tr~mi8.(re32 do)
  sol'4. re16 mi fa4\tr~fa8.(mi32 re)  %% fine prima pagina OOO KKKKKKK
  mi4\upl do'\upl la\upl fa\upl

  %82
  mi8(re) r si'16(do) re8 re,16 mi \grace sol fa8 mi16 re
  mi4\upl do'\upl la\upl fa\upl
  mi32(fa sol8.)~sol4 re32(mi fa8.)~fa4\mbreak

  %85
  mi32(re do8.)~do4 r2
  r8 sol'\p sol sol sol sol sol sol
  la la la la la la la la\mbreak

  %88
  sib sib sib sib sib sib sib sib
  la la la la la la la la
  sib,4\upl sib'\upl la,_\upl la'\upl

  %91
  R1*2
  fa,8\f sol16 la sib do re mi fa8 fa fa fa
  fa fa, fa' fa fa la, sol fa
  do do'16 si! do8 do do[do,] r r16 la''\p

  %96
  la4\tr~la8.(sol32 la) sib4\upl la\upl \mbreak
  \grace la8 sol2 r4 r8 r16 mi
  fa4\tr~fa8.(mi32 re) sol4\upl fa\upl

  %99
  \grace fa8 mi2 r
  r r4 do\p
  fa16(do8.) la'16(do,8.) sol'16(do,8.) sib'16(sol8.)

  %102
  la8.\tr sib16 do4 r do,\f
  \terzinequarto \tuplet 3/2 {
    fa8 do fa la[sol fa] sol do, sol' sib[la sol]
    la\tr sol fa
  } fa4 r2\mbreak

  %105
  r r4 la,,\p
  re16(la8.) fa'16(la,8.) mi'16(la,8.) sol'16(mi8.)
  fa8.\tr sol16 la4 r la,\f

  %108
  \tuplet 3/2 {
    re8 la re fa[mi re] mi la, mi' sol[fa mi]
    fa mi re
  } r4 r2
  sol,8\p la16 sib do re mi fad sol8 sol sol  fa

  %111
  mi4_\upl mi'\upl r2\mbreak
  mi,4 mi' r2
  R1*2

  %115
  r4 re,_\upl\f fa_\upl la_\upl
  re,4. r16 la'' fa4\tr~fa8.(mi32 re)
  mi8 r la,,8. la16 dod8. dod16 mi8. mi16

  %118
  mi'4. r16 sol, sol4\tr~sol8.(fa32 mi)
  fa8 r r4 r2\mbreak
  mi8_\upl r mi'16 mi mi mi mi mi mi mi mi mi mi mi

  %121
  mi8\upl r sol16 sol sol sol sol sol sol sol sol sol sol sol
  fa(mi re4.) mi2\tr
  re4\upl r r2

  %124
  mi8\p\upl r mi,16 mi mi mi mi mi mi mi mi mi mi mi\mbreak
  mi8\f r sol16 sol sol sol sol sol sol sol sol sol sol sol
  fa la re la sib sol fa mi mi2\tr

  %127 %%%%%5 fine prima pagina
  re8\p fa fa fa la la la la
  mi mi mi mi mi' mi mi mi
  re re re re re re re re

  %130
  re dod dod mi la, dod mi dod
  re re re re re re re re
  re32(mi fa8.)~fa4 dod32(re mi8.)~mi4

  %133
  re,8\f mi16 fa sol la si dod re8 re re re\mbreak
  re re,\p r4 r2
  sol4 sol8 sol sol re si sol

  %136
  do4 do' r2
  R1*3
  la4.\f la16 si do4\tr~do8.(si32 la)

  %141
  mi'4. si16 do re4\tr~re8.(do32 si)
  do8\p r la'4-.(la-. la-.)
  \grace si8 la4 sold8. si16 mi,4 mi

  %144
  la,,4. la16 si do4\tr~do8.(si32 la)\mbreak
  mi'4. si16 do re4\tr~re8.(la32 si)
  do4 la r2

  %147
  R1
  la8\f si16 do re mi fad sold la8 la la la
  r mi'\p mi mi mi mi mi mi

  %150
  la,,\f si16 do re mi fad sold la8 la la la
  r fa'\p fa fa fa fa fa fa
  la,,\f si16 do re  mi fad sold\mbreak la8 la la la

  %153
  r sol'\p sol sol sol sol sol sol
  fa1~
  fa

  %156
  mi~
  mi
  re~

  %159
  re
  la8\f si16 do re mi fad sold la8 la la la
  la la, la' la la do, si la

  %162
  mi mi'16 red mi8 mi mi mi, r r16 mi'\p\mbreak
  mi4\tr~mi8.(re32 mi) fa4\upl mi\upl
  \grace mi8 re2 r4 r8 r16 si

  %165
  do4\tr~do8.(si32 do) re4\upl do\upl
  \grace do8 si2 r
  r r4 mi,\p

  %168
  la16(mi8.) do'16(mi,8.) si'16(mi,8.) re'16(si8.)
  do8.\tr re16 mi4 r mi,\f
  \tuplet 3/2 {
    la8 mi la do[si la] si mi, si' re[do si]\mbreak

    %171
    do si la
  } r4 r2
  re,8\p mi16 fa sol la si do re8 re re do
  si4 si, r2

  %174
  si'4 si, r2
  R1*2
  la'4.\tr\f la16 si do4\tr~do8.(si32 la)

  %178
  mi'4 mi,\p r2
  la,4. la16 si do4\tr~do8.(si32 la)
  mi'8 mi' si[sold] mi4 r\mbreak

  %181
  la\upl\f mi_\upl do\tr~do8.(si32 la)
  re4\p fa'\upl r fa\upl
  r mi r mi

  %184
  r re r re
  r8 do re si' do, la' re, si'
  do, r r4 r2

  %187
  R1*2
  la'4\upl\f mi\upl dod\tr~dod8.(si32 la)

  %190
  re4 re, r8 r16 la'[re8. fa16]
  mi4 la,, r8 dod'16 re mi fa sol mi
  fa4 re,\mbreak r8 la''16 sol fa mi re do

  %193
  si la sol fad sol la si do re fa, sol la sol fa mi re
  mi8 r do4 mi sol
  do,4. r16 sol'' mi4\tr~mi8.(re32 do)

  %196
  re8 r sol,,8. sol16 si8. si16 re8. re16
  si''4. r16 re,\mbreak re4\tr~re8.(do32 si)
  do8 r r4 r2

  %199
  si8\upl r si'16 si si si si si si si si si si si
  si8\upl r re16 re re re re re re re re re re re
  do(si la4.) si2\tr

  %202
  la4 r r2
  si8\p\upl r si,16 si si si\mbreak si si si si si si si si
  si8\f\upl r re16 re re re re re re re re re re re

  %205
  do mi la mi fa re do si si2\tr
  la4. la,16 si do4\tr~do8.(si32 la)
  fa'8. la16 re,8. fa16 si,4_\upl mi_\upl\mbreak

  %208
  la,2\fermata r

}

IvlIIn = \relative do'' {

  la4. la16 si do4\tr~do8.(si32 la)
  mi'4. si16 do re4.\tr(do16 si)
  do4\upl la'\upl fa\upl re\upl

  %4
  do8(si) r sold'16 (la) si re, mi fa mi re do si
  do4\upl la'\upl\mbreak fa\upl re\upl
  do32(re mi8.)~mi4 si32(do re8.)~re4

  %7
  do32(si la8.)~la4~la8 si16 do re mi fad sold
  la4\upl mi\upl dod\tr~dod8.(si32 la)
  re4 re, r8 r16 la'[re8. fa16]

  %10
  mi4 la,, r8 dod'16 re mi fa sol mi
  fa4 fa,\mbreak r8 la'16 sol fa mi re do
  si la sol fad sol la si do re fa, sol la sol fa mi re

  %13
  mi8 r do4 mi sol
  do,4. r16 mi' do4\tr~do8.(si32 la)
  si8 r  sol,8. sol16 si8. si16 re8. re16

  %16
  re'4. r16 si si4\tr~si8.(la32 sold)
  la8_\upl r la'16 la la la la la la la la la la la
  la8\upl r la16 la la la la la la la la la la la

  %19
  sold8\upl r si16 si si si si si si si si si si si
  la4\upl la2(sold4\tr) %%%%%%%% fin qui quarta riga
  la8\upl r la,16\p la la la la la la la la la la la

  %22
  la8_\upl r la16 la la la la la la la la la la la
  sold8_\upl\f r si16 si si si si si si si si si si si
  la4_\upl la2(sold4\tr)

  %25
  la4. la,16 si do4\tr~do8.(si32 la)
  fa'8. la16 re,8. fa16 si,4_\upl mi_\upl\mbreak
  la,2 r

  %28
  R1*2
  la4.\p la16 si do4\tr~do8.(si32 la)
  mi'4. si16 do re4\tr~re8.(do32 si)

  %32
  do4 la r2
  R1
  r8 do'\p do do do do do do

  %35
  do do do do la la la la
  la la la la la la la la
  la la la la dod dod dod dod

  %38
  re la la la la la la la
  sol sol sol sol fa fa fa fa
  mi mi mi mi do do do do

  %41
  si si si si sol si si si\mbreak
  do4_\upl r r2
  R1

  %44
  sol4.\f sol16 la si4\tr~si8.(la32 sol)
  la'8\p la la la la la la la
  sol sol sol sol sol sol sol sol

  %47
  do do do do do do do do
  si4\upl r r2
  re8 re re re re re re re

  %50
  do do do do do do do do
  fa fa fa fa fa fa fa fa\mbreak
  mi4\upl r r2

  %53
  R1
  do4.\f do16 re mi4\tr~mi8.(re32 do)
  sol'4 sol,\p r2

  %56
  do4\upl\mf sol_\upl mi\tr~mi8.(re32 do)
  fa4\p_\upl fa'\upl mi,_\upl mi'\upl\mbreak
  R1*3

  %61
  sol,,8\f la16 si do re  mi fad sol8 sol sol sol
  r8 si\p si si si si si si\mbreak
  sol,\f la16 si do re mi fad sol8 sol sol sol

  %64
  r do\p do do do do do do
  sol,\f la16 si do re mi fad sol8 sol sol sol
  r8 re'\p re re re re re re

  %67
  r do re fa do mi re fa
  mi do r mi \grace sol fa mi16 fa sol8 do,
  r fa do la fa fa' r4 %%%OOK fine riga 9

  %70
  r2 r4 r8 si,
  do sol r mi' 	\grace sol fa mi16 fa sol8 do,
  fa,4_\upl fa'\upl mi,_\upl mi'\upl

  %73
  R1*3
  r8 mi, mi mi la la sol sol
  R1*2

  %79
  do4.\f do16 re mi4\tr~mi8.(re32 do)
  sol'4. re16 mi fa4\tr~fa8.(mi32 re)  %% fine prima pagina OOO KKKKKKK
  mi4\upl do'\upl la\upl fa\upl

  %82
  mi8(re) r si'16(do) re8 re,16 mi \grace sol fa8 mi16 re
  mi4\upl do'\upl la\upl fa\upl
  mi32(fa sol8.)~sol4 re32(mi fa8.)~fa4\mbreak

  %85
  mi32(re do8.)~do4 r2
  r8 mi\p mi mi do do do do
  do do do do do do do do

  %88
  do do do do mi mi mi mi
  fa do do do do do do do
  sib4\upl sib'\upl la,_\upl la'\upl

  %91
  R1*2
  fa,8\f sol16 la sib do re mi fa8 fa fa fa
  fa fa, fa' fa fa la, sol fa

  %95
  do do'16 si! do8 do do[do,] r4
  R1
  r8 do'16\p si do8 do do do, r4

  %98
  R1
  r8 do'16\f si do8 do do do, r4
  r2 r4 do'\p

  %101
  fa16(do8.) la'16(do,8.) sol'16(do,8.) sib'16(sol8.)

  %102
  la8.\tr sib16 do4 r do,\f
  \terzinequarto \tuplet 3/2 {
    fa8 do fa la[sol fa] sol do, sol' sib[la sol]
    la\tr sol fa
  } fa4 r2\mbreak

  %105
  r r4 la,,\p
  re16(la8.) fa'16(la,8.) mi'16(la,8.) sol'16(mi8.)
  fa8.\tr sol16 la4 r la,\f

  %108
  \tuplet 3/2 {
    re8 la re fa[mi re] mi la, mi' sol[fa mi]
    fa mi re
  } r4 r2
  sol,8\p la16 sib do re mi fad sol8 sol sol  fa

  %111
  mi4_\upl mi'\upl r2\mbreak
  mi,4 mi' r2
  R1*2

  %115
  r4 re,_\upl\f fa_\upl la_\upl
  re,4. r16 fa' re4\tr~re8.(dod32 si)
  dod8 r la,8. la16 dod8. dod16 mi8. mi16

  %118
  sol4. r16 mi mi4\tr~mi8.(re32 dod)\mbreak
  re8_\upl r8 re'16 re re re re re re re re re re re
  re8\upl r re16 re re re re re re re re re re re

  %121
  dod8\upl r mi16 mi mi mi mi mi mi mi mi mi mi mi
  re4\upl re2(dod4\tr)
  re8\upl r re,16\p re re re re re re re re re re re

  %124
  re8_\upl r re16 re re re \mbreak re re re re re re re re
  dod8\f_\upl r mi16 mi mi mi mi mi mi mi mi mi mi mi
  re4_\upl re2(dod4\tr)

  %127
  re8\p re re re re re re re
  dod dod dod dod dod dod dod dod
  re mi fa re sol la sib sol

  %130
  la la, la sib? dod mi dod la\mbreak
  re mi fa re sol la sib sol
  la la la la la la la la

  %133
  re,\f mi16 fa sol la si dod re8 re re re
  re re,\p r4 r2
  sol4 sol8 sol sol re si sol

  %136
  do4 do' r2
  R1*3
  la4.\f la16 si do4\tr~do8.(si32 la)

  %141
  mi'4. si16 do re4\tr~re8.(do32 si)
  do4\upl\p r8 do la la la la
  si si si si si si si si

  %144
  la,4. la16 si do4\tr~do8.(si32 la)\mbreak
  mi'4. si16 do re4\tr~re8.(la32 si)
  do4 la r2

  %147
  R1
  la8\f si16 do re mi fad sold la8 la la la
  r dod\p dod dod dod dod dod dod\mbreak

  %150
  la,\f si16 do re mi fad sold la8 la la la
  r re\p re re re re re re
  la,\f si16 do re  mi fad sold la8 la la la

  %153
  r mi'\p mi mi mi mi mi mi
  re1~
  re

  %156
  do~
  do
  si~

  %159
  si
  la8\f si16 do re mi fad sold la8 la la la
  la la, la' la la do, si la

  %162
  mi mi'16 red mi8 mi mi mi, r4
  R1
  r8 mi'16\p red mi8 mi mi mi, r4

  %165
  R1
  r8 mi'16\f red mi8 mi mi mi, r4
  r2 r4 mi\p

  %168
  la16(mi8.) do'16(mi,8.) si'16(mi,8.) re'16(si8.)
  do8.\tr re16 mi4 r mi,\f
  \tuplet 3/2 {
    la8 mi la do[si la] si mi, si' re[do si]\mbreak

    %171
    do si la
  } r4 r2
  re,8\p mi16 fa sol la si do re8 re re do
  si4 si, r2

  %174
  si'4 si, r2
  R1*2
  la'4.\tr\f la16 si do4\tr~do8.(si32 la)

  %178
  mi'4 mi,\p r2
  la,4. la16 si do4\tr~do8.(si32 la)
  mi'8 mi' si[sold] mi4 r\mbreak

  %181
  la\upl\f mi_\upl do\tr~do8.(si32 la)
  re4\p la'_\upl r re\upl
  r sol, r do

  %184
  r si r si
  r8 la si re do mi si re
  do r r4 r2

  %187
  R1*2
  la'4\upl\f mi\upl dod\tr~dod8.(si32 la)

  %190
  re4 re, r8 r16 la'[re8. fa16]
  mi4 la,, r8 dod'16 re mi fa sol mi
  fa4 re,\mbreak r8 la''16 sol fa mi re do

  %193
  si la sol fad sol la si do re fa, sol la sol fa mi re
  mi8 r do4 mi sol
  do,4. r16 mi' do4\tr~do8.(si32 la)

  %196
  si8 r sol,8. sol16 si8. si16 re8. re16
  re'4. r16 si si4\tr~si8.(la32 sold)
  la8_\upl r la'16 la la la la la la la la la la la

  %199
  la8\upl r la16 la la la la la la la la la la la
  sold8\upl r si16 si si si si si si si si si si si\mbreak
  la4\upl la2(sold4\tr)

  %202
  la8\upl r la,16\p la la la la la la la la la la la
  la8_\upl r la16 la la la la la la la la la la la
  sold8_\upl\f r si16 si si si si si si si si si si si

  %205
  la4_\upl la2(sold4\tr)\mbreak
  la4. la,16 si do4\tr~do8.(si32 la)
  fa'8. la16 re,8. fa16 si,4_\upl mi_\upl\mbreak

  %208
  la,2\fermata r

}


Ivlan = \relative do' {

   do8 do do do mi mi mi mi
   si si si si si' si si si
   la la la la la la la la

   %4
   la sold sold si mi,sold si sold
   la la la la la la la la\mbreak
   la32(si do8.)~do4 sold32(la si8.)~si4

   %7
   la8 mi16 fa mi8 re do16 la si do re mi fad sold
   la8 la la la la la la la
   la sol fa sol la la la la

   %10
   la, si dod si la la la la
   la fa'16 sol la8 sol\mbreak fa re la' la
   re, re re re re re re re

   %13
   do4 r r2
   r8 mi mi mi sol sol sol sol
   sol sol sol sol sol sol sol sol

   %16
   sold sold sold sold sold sold sold sold
   mi la16 si do8 do16 re mi8 mi, mi mi
   fa re16 mi fa8 fa\mbreak fa fa fa fa

   %19
   mi8 mi16 fad sold8 sold16 la si8 mi, mi mi
   mi mi la sol fa re si mi
   do\p re mi fa mi re mi do

   %22
   fa mi re mi fa  mi fa re
   mi\upl\f si'16 la sold8 fad mi sold si sold\mbreak
   la4 la8. fa?16 mi8 mi16 fa mi8 re

   %25
   do4. la16 si do4\tr ~do8.(la32 sol)
   fa'4\upl re\upl si_\upl mi\upl
   la,2 r

   %28
   R1*2
   r8 do\p do do la la la la
   si si si si si si si si

   %32
   la la mi' mi\mbreak fa fa fa fa
   si, si si si si si si si
   la la la la la la la la

   %35
   la la la la sol' sol sol sol
   fa fa fa fa re re re re
   dod dod dod dod la la la la

   %38
   re re re re re re re re
   sol, sol sol sol sol sol sol sol\mbreak
   sol sol sol sol sol sol sol sol

   %41
   sol sol sol sol sol sol sol sol
   do4\upl r r2
   R1

   %44
   sol4.\f sol16 la si4\tr~si8.(la32 sol)
   do4 do,\p r2
   R1*3

   %49
   fa'8\p fa fa fa fa fa fa fa
   mi mi mi mi mi mi mi mi\mbreak
   re re re re re re re re

   %52
   do4\upl r r2
   r8 sol' sol sol sol sol sol sol
   sol\f sol sol sol sol sol sol sol

   %55
   sol\p sol sol sol sol sol sol sol
   sol sol sol sol sol sol sol sol
   R1*4

   %61
   sol,8\f la16 si do re mi fad sol8 sol sol sol\mbreak
   sol\p sol sol sol sol sol sol sol
   sol,8\f la16 si do re mi fad sol8 sol sol sol

   %64
   sol\p sol sol sol sol sol sol sol
   sol,8\f la16 si do re mi fad sol8 sol sol sol
   sol\p sol sol sol sol sol sol sol

   %67
   R1*12\mbreak
   mi8\f mi mi mi sol sol sol sol
   re re re re re' re re re

   %81
   do do do do do do do do
   do si si re sol, si re si
   do do do do do do do do

   %84
   do,32(re  mi8.)~mi4 si32(do re8.)~re4
   do8 sol'16 la sol8 fa mi4 r\mbreak
   r8 do\p do do sib' sib sib sib

   %87
   la la la la fa fa fa fa
   mi mi mi mi do do do do
   fa fa fa fa fa, fa fa fa

   %90
   R1*3
   fa8\f sol16 la sib do re mi fa8 fa fa fa
   fa fa, fa' fa fa la sol fa\mbreak

   %95
   do do'16 si! do8 do do do, r4
   R1
   r8 do'16\p si do8 do do do, r4

   %98
   R1
   r8 do'16\f si do8 do do do, r4
   R1

   %101
   r4 do2\p(mi4)
   r4 do2(mi4)
   r4 do2\f(mi4)\mbreak

   %104
   fa2 r
   R1
   r4 la,2\p(dod4)

   %107
   r4 la2(dod4)
   r4 la2\f(dod4)
   re r r2

   %110
   R1*5
   re4 r r2
   r8 fa fa fa la la la la

   %117
   la la, la la la la la la\mbreak
   dod dod dod dod dod dod dod dod
   la re16 mi fa8 fa16 sol la8 la la la

   %120
   sib sol16 la sib8 sib sib sib sib sib
   la la16 si? dod8 dod16 re mi8 la, la la
   la la re do sib sol mi la\mbreak

   %123
   fa, \p sol la sib la sol la fa
   sib la sol la sib la sib sol
   la\f mi'16 re dod8 si la dod mi dod

   %126
   re4 re8. sib16 la8 la16 sib la8 sol
   fa4 r r2
   R1*5

   %133
   re'8\f mi16 fa sol la si dod\mbreak re8 re re re
   re re,\p r4 r2
   R1*5

   %140
   do8\f do do do mi mi mi mi
   si si si si si si si si
   la la r4 r2

   %143
   R1
   r4 r8 do\p la la la la
   si si si si\mbreak si si si si

   %146
   la la r4 r2
   R1
   la8\f si16 do re mi fad sold la8 la la la

   %149
   la\p la la la la la la la
   la,8\f si16 do re mi fad sold la8 la la la
   la\p la la la la la la la\mbreak

   %152
   la,8\f si16 do re mi fad sold la8 la la la
   la\p la la la la la la la
   la1

   %155
   si~
   si
   la~

   %158
   la
   sold
   la,8\f si16 do re mi fad sold la8 la la la

   %161
   la la, la' la la do, si la
   mi' mi'16  red mi8 mi mi mi, r4
   R1

   %164
   r8 mi'16\p red mi8 mi mi mi, r4
   R1
   r8 mi'16\f  red mi8 mi mi mi, r4\mbreak

   %167
   R1
   r4 mi2\p(sold4)
   r mi2(sold4)

   %170
   r mi2\f(sold4)
   la\upl r r2
   R1*7

   %179
   la,4. la16 si do4\tr~do8.(si32 la)
   mi'4 mi, r2
   la'4\f\upl mi\upl do\tr~do8.(si32 la)\mbreak

   %182
   re4\p r r2
   R1*6
   r8 la'\f la la la la la la

   %190
   la sol fa sol la la la la
   la, si dod si la la la la
   la fa'16 sol la8 sol fa re la' la

   %193
   re, re re re re re re re
   do4 r r2\mbreak
   r8 mi mi mi sol sol sol sol

   %196
   sol sol sol sol sol sol sol sol
   sold sold sold sold sold sold sold sold
   mi la16 si do8 do16 re mi8 mi, mi mi

   %199
   fa re16 mi fa8 fa fa fa fa fa
   mi mi16 fad sold8 sold16 la\mbreak si8 mi, mi mi
   mi mi la sol fa re si mi

   %202
   do\p re mi fa mi re mi do
   fa mi re mi fa mi fa re
   mi\upl\f si'16 la sold8 fad mi sold si sold

   %205
   la4 la8. fa16 mi8 mi16 fa mi8 re\mbreak
   do4. la16 si do4\tr~do8.(si32 la)
   fa'4\upl re\upl si_\upl mi\upl

   %208
   la,2\fermata r

}


Ivcn = \relative do {

  la'8 la la la la la la la
  sold sold sold sold sold sold sold sold
  la la, do la re mi fa re

  %4
  mi mi, mi' fad sold si sold mi
  la la, do la re mi fa re\mbreak
  mi mi mi mi mi mi mi mi

  %7
  la, si do si la si16 do re mi fad sold
  la8 la la la sol! sol sol sol
  fa sol la sol fa mi fa re

  %10
  dod re  mi re dod mi dod la
  re mi fa mi re fa re fa
  sol2 si,\mbreak

  %13
  do4 r r2
  r8 do do do do do do do
  sol' sol sol sol sol sol fa fa

  %16
  mi mi mi mi mi mi mi mi
  la4. la16 si do4\tr~do8.(si32 la)
  re4. si16 do re4\tr~re8.(do32 si)

  %19
  mi4. mi,16 fad sold4\tr~sold8.(fad32 mi)
  la8 sol! fa mi re si mi[mi,]\mbreak
  la\p si do re do si do la

  %22
  re mi fa mi re do re si
  mi\f mi, mi' fad sold si sold mi
  la4 re, mi mi,

  %25
  la4. la16 si do4\tr~do8.(si32 la)
  fa'4\upl re\upl si_\upl mi\upl
  la,2 r

  %28
  R1*16
  sol4.\f sol16 la si4\tr~si8.(la32 sol)
  do4\p r r2

  %46
  R1*15
  sol8\f la16 si do re mi fad sol8 sol sol sol
  sol sol,\p r4 r2\mbreak
  sol8\f la16 si do re mi fad sol8 sol sol sol

  %64
  sol sol,\p r4 r2
  sol8\f la16 si do re mi fad sol8 sol sol sol
  sol sol,\p r4 r sol

  %67
  R1*12
  do8\f do do do do do do do
  si si si si si si si si
  do re mi do fa sol la fa

  %82
  sol sol, sol' la si re si sol
  do do, mi do fa sol la fa
  sol sol sol sol sol sol sol sol

  %85
  do, re mi re do4 r
  R1*7
  fa8\f sol16 la sib do re mi fa8 fa fa fa
  fa fa, fa' fa fa la, sol fa

  %95
  do do'16 si! do8 do do do, r4
  R1
  r8 do'16\p si do8 do do do, r4\mbreak

  %98
  R1
  r8 do'16\f si do8 do do do, r4
  R1*3

  %103
  r4 fa\f mi do
  fa2 r\mbreak
  R1*3

  %108
  r4 re dod la
  re r r2
  R1*5

  %115
  re4\f r r2
  r8 re re re re re re re
  la' la la la la la la la
  la, la la la la la la la

  %119
  re4. re16 mi fa4\tr~fa8.(mi32 re)
  sol4. mi16 fa sol4\tr~sol8.(fa32 mi)
  la4. la16 si dod4\tr~dod8.(si32 la)

  %122
  re8 do sib la\mbreak sol mi la la,
  re,\p mi fa sol fa mi fa re
  sol la sib la sol fa sol mi

  %125
  la\f la la si dod mi dod la
  re4 sol la la,
  re r r2

  %128
  R1*5
  re8\f mi16 fa sol la si dod\mbreak re8 re re re
  re re,\p r4 r2

  %135
  R1*5
  la'8 la la la la la la la\mbreak
  sold sold sold sold sold sold sold sold

  %142
  la8 r r4 r2
  R1*5
  la,8\f si16 do re mi fad sold la8 la la la
  la la,\p r4 r2

  %150
  la8\f si16 do re mi fad sold la8 la la la
  la la,\p r4 r2
  la8\f si16 do re mi fad sold la8 la la la

  %153
  la la,\p r4 r2
  R1*6
  la8\f si16 do re mi fad sold la8 la la la
  la la, la' la la do, si la

  %162
  mi' mi'16 red mi8 mi mi mi, r4
  R1\mbreak
  r8 mi'16\p red mi8 mi mi mi, r4

  %165
  R1
  r8 mi'16\f red mi8 mi mi mi, r4
  R1*3

  %170
  r4 la sold mi
  la r r2\mbreak
  R1*17

  %189
  la,8\f la la la sol' sol sol sol
  fa sol la sol fa mi fa re
  dod re mi re dod mi dod la

  %192
  re mi fa mi re fa re fa
  sol2 sol,
  do4 r r2

  %195
  r8 do do do do do do do
  sol' sol sol sol sol sol fa fa

  %197
  mi mi mi mi mi mi mi mi
  la4. la16 si do4\tr~do8.(si32 la)
  re4. si16 do re4\tr~re8.(do32 si)

  %200
  mi4. mi,16 fad sold4\tr~sold8.(fad32 mi)
  la8 sol! fa mi re si mi mi,
  la\p si do re\mbreak do si do la

  %203
  re mi fa mi re do re si
  mi\f mi, mi' fad sold si sold mi
  la4 re, mi mi,

  %206
  la4. la16 si do4\tr~do8.(si32 la)
  fa'4\upl re\upl si_\upl mi\upl
  la,2\fermata r

}


Ibcn = \relative do {

  la'8 la la la la la la la
  sold sold sold sold sold sold sold sold
  la la, do la re mi fa re

  %4
  mi mi, mi' fad sold si sold mi
  la la, do la re mi fa re\mbreak
  mi mi mi mi mi mi mi mi

  %7
  la, si do si la si16 do re mi fad sold
  la8 la la la sol! sol sol sol
  fa sol la sol fa mi fa re

  %10
  dod re  mi re dod mi dod la
  re mi fa mi re fa re fa
  sol2 si,\mbreak

  %13
  do4 r r2
  r8 do do do do do do do
  sol' sol sol sol sol sol fa fa

  %16
  mi mi mi mi mi mi mi mi
  la4. la16 si do4\tr~do8.(si32 la)
  re4. si16 do re4\tr~re8.(do32 si)

  %19
  mi4. mi,16 fad sold4\tr~sold8.(fad32 mi)
  la8 sol! fa mi re si mi[mi,]\mbreak
  la\p si do re do si do la

  %22
  re mi fa mi re do re si
  mi\f mi, mi' fad sold si sold mi
  la4 re, mi mi,

  %25
  la4. la16 si do4\tr~do8.(si32 la)
  fa'4\upl re\upl si_\upl mi\upl
  la,2 r

  %28
  la'8\p la la la la la la la
  sold sold sold sold sold sold sold sold
  la la la la fa fa fa fa

  %31
  mi mi mi mi sold sold sold sold
  la la la la re, re re re
  mi mi mi mi sold, sold sold sold

  %34
  la la' mi do la4 r
  R1*7  %% quinta riga
  r8 do\p mi do fa mi fa re\mbreak

  %43
  sol fa mi do fa la fa re
  sol,4.\f sol16 la si4\tr~si8.(la32 sol)
  do'8\p do do do do do do do

  %46
  si si si si si si si si
  la la la la la la la la
  sol4\upl r r2

  %49
  R1*4
  si8\p si si si si si si si
  do\f do do do\mbreak do do do do

  %55
  si\p si si si si si si si
  do do do do do do do do
  R1

  %58
  fa,4\upl fa'\upl mi,\upl mi'\upl
  re si do do,
  fa2 fad

  %61
  sol,8\f la16 si do re mi fad sol8 sol sol sol
  sol sol,\p r4 r2\mbreak
  sol8\f la16 si do re mi fad sol8 sol sol sol

  %64
  sol sol,\p r4 r2
  sol8\f la16 si do re mi fad sol8 sol sol sol
  sol sol,\p r4 r sol

  %67
  do si do si
  do8 do do do re re mi mi
  fa fa fa fa fa fa fa fa

  %70
  sol sol sol sol\mbreak sol sol sol sol
  do, do do do re re mi mi
  R1

  %73
  fa4 fa' mi, mi'
  re r sol, r
  r8 do mi, mi fa fa fad fad

  %76
  sol sol sol sol sol sol sol sol
  do4 fa,r fad
  sol2 sol,\mbreak

  %79
  do8\f do do do do do do do
  si si si si si si si si
  do re mi do fa sol la fa

  %82
  sol sol, sol' la si re si sol
  do do, mi do fa sol la fa
  sol sol sol sol sol sol sol sol

  %85
  do, re mi re do4 r
  R1*5\mbreak
  sib4\p sib' la, la'

  %92
  sol r do r
  fa,8\f sol16 la sib do re mi fa8 fa fa fa
  fa fa, fa' fa fa la, sol fa

  %95
  do do'16 si! do8 do do do, r4
  R1
  r8 do'16\p si do8 do do do, r4\mbreak

  %98
  R1
  r8 do'16\f si do8 do do do, r4
  r fa\p mi do

  %101
  r fa mi do
  r fa mi do
  r fa\f mi do

  %104
  fa2 r
  r4 re\p dod la
  r re dod la

  %107
  r re dod la\mbreak
  r re\f dod la
  re r r2

  %110
  sol,8\p la16 sib do re mi fad sol8 sol sol fa
  mi4 mi mi re
  dod dod dod si

  %113
  la8 la' sib sol fa mi fa sol
  la la la la la la la la
  re,4\f r r2

  %116
  r8 re re re re re re re
  la' la la la la la la la
  la, la la la la la la la

  %119
  re4. re16 mi fa4\tr~fa8.(mi32 re)
  sol4. mi16 fa sol4\tr~sol8.(fa32 mi)
  la4. la16 si dod4\tr~dod8.(si32 la)

  %122
  re8 do sib la\mbreak sol mi la la,
  re,\p mi fa sol fa mi fa re
  sol la sib la sol fa sol mi

  %125
  la\f la la si dod mi dod la
  re4 sol la la,
  re r r2

  %128
  R1*5
  re8\f mi16 fa sol la si dod\mbreak re8 re re re
  re re,\p r4 r2

  %135
  sol4 sol8 sol sol re si[sol]
  do4 do' r2
  fa,4 r r8 fa fa fa

  %138
  si,4 r r2
  mi4 mi8 mi mi si sold[mi]
  la' la la la la la la la\mbreak

  %141
  sold sold sold sold sold sold sold sold
  la\p la la la fa fa fa fa
  mi mi mi mi sold sold sold sold

  %144
  la la la la fa fa fa fa
  mi mi mi mi sold, sold sold sold
  la la la la re re re re

  %147
  mi mi mi mi\mbreak sold sold sold sold
  la,\f si16 do re mi fad sold la8 la la la
  la la,\p r4 r2

  %150
  la8\f si16 do re mi fad sold la8 la la la
  la la,\p r4 r2
  la8\f si16 do re mi fad sold la8 la la la\mbreak

  %153
  la la,\p la la la la la la
  re1
  sol

  %156
  do,
  fa
  si,

  %159
  mi
  la,8\f si16 do re mi fad sold la8 la la la
  la la, la' la la do, si la

  %162
  mi' mi'16 red mi8 mi mi mi, r4
  R1\mbreak
  r8 mi'16\p red mi8 mi mi mi, r4

  %165
  R1
  r8 mi'16\f red mi8 mi mi mi, r4
  r la\f sold mi

  %168
  r la sold mi
  r la sold mi
  r la\f sold mi

  %171
  la r r2\mbreak
  re,8\f mi16 fa sol la si do re8 re re do
  si4\upl\p si16 do re do si4 la

  %174
  sold\upl sold16 la si la sold4 fad
  mi8 mi' fa! re do si do re

  %176
  mi mi mi mi mi mi mi mi
  la,\f la la la la la la la\mbreak
  sold\p sold sold sold sold sold sold sold

  %179
  la la, la la la la la la
  sold sold sold sold sold sold sold sold
  la\f la la la la la la la

  %182
  re\p re re re si si si si
  do do do do la la la la
  si si si si sold sold sold sold\mbreak

  %185
  la4 sold la sold
  la do re si
  mi fa do re

  %188
  mi2 mi,
  la8\f la la la sol' sol sol sol
  fa sol la sol fa mi fa re

  %191
  dod re mi re dod mi dod la
  re mi fa mi re fa re fa
  sol2 si,

  %194
  do4 r r2\mbreak
  r8 do do do do do do do
  sol' sol sol sol sol sol fa fa

  %197
  mi mi mi mi mi mi mi mi
  la4. la16 si do4\tr~do8.(si32 la)
  re4. si16 do re4\tr~re8.(do32 si)

  %200
  mi4. mi,16 fad sold4\tr~sold8.(fad32 mi)
  la8 sol! fa mi re si mi mi,
  la\p si do re\mbreak do si do la

  %203
  re mi fa mi re do re si
  mi\f mi, mi' fad sold si sold mi
  la4 re, mi mi,

  %206
  la4. la16 si do4\tr~do8.(si32 la)
  fa'4\upl re\upl si_\upl mi\upl
  la,2\fermata r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1
  <6>2 <6 5>
  s1
  <_+>
  s
  <6 4>2 <7 _+>
  s1
  s2 <4\+ 2>
  <6>1
  <6>
  s
  s2 <6 5>
  s1
  s
  s2 s4 <4 2>
  <7 _+>1
  s
  <6 5>
  <_+>2 <6 5>
  s <6 5>4 <_+>
  s1
  <6 5>
  <_+>2 <6 5>
  s4 <6 5> <4> <_+>
  s1*4
  <6>2 <6 5>
  s1
  <4>4 <_+> <6 5> s
  s2 <6 5>
  <4>4 <_+><5>2
  s1*8
  s2 s4 <6>
  s <6> s <6>
  s1
  <4\+ 2>
  <6>
  <6\\ 4 3>
  s1*5
  <6>1
  s
  <6>
  s
  s
  s4 <6> <7> <6>
  s <6 5> s2
  <6> <6 5>
  s1*2
  <6 4>1
  s
  <7 5>
  s
  s4 <6 5> s <6 5>
  s2 <6->4 <6 5->
  s1
  <6 4>2 <5 3>
  s2 <6->4 <6 5->
  s1
  s4 <6> <7> <6>
  s2 <7>
  s s4 <7>
  <6 4>2 <5 4>4 <3>
  s2 s4 <6 5>
  <6 4>2 <5 4>4 <3>
  s1
  <6>2 <6 5>
  s1*3
  <6 4>2 <7 5>
  s1*6
  s4 <6> <7> <6>
  <7 _->2 <7->
  s1*7
  s4 <6> s2
  s1*4
  s2 <6>
  s1*5
  <5->2 s4 <4 2>
  <5>2 s4 <6>
  <7 _+>2 <6>
  <6 4> <5 4>4 <_+>
  s1
  s
  <_+>
  <7>
  s1
  <6 5 _->
  <_+>2 <6 5>
  s <6 5>4 <_+>
  s1
  <6 5 _->
  <_+>2 <6 5>
  s4 <6 5 _-> <4> <_+>
  s1*12  %55555 fine prima pagina
  <_+>1
  s
  <6>2 <6 5>
  s1
  <4>4 <_+> <6 5> s
  s1
  <4>4 <_+> <6 5> s
  s2 <6 5>
  <4>4 <_+> <5>2
  s1
  <_+>
  <6 4>
  s
  <5 _+>
  <7>
  s
  <7 _!>
  <7>
  <7>
  <7>
  <7 _+>
  s1*2
  <_+>1
  s1*4
  s2 <6>
  s1*5
  <5>2 s4 <6 4>
  <5>2 s4 <6>
  <7 _+>2 <6>
  <6 4> <5 4>4 <_+>
  s1
  <6>
  s
  <6>
  s
  s2 <6 5>
  s <6 5>
  s <6 5>
  s4 <6 5> s <6 5>
  s1
  <7 _+>2 <6>
  <6 4> <5 _+>
  s2 <4\+ 2>
  <6> s
  <6>1
  s
  s2 <6 5>
  s1*2
  s2 s4 <4 2>
  <7 _+>1
  s
  <6 5>
  <_+>2 <6 5>
  s <6 5>4 <_+>
  s1
  <6 5>
  <_+>2 <6 5>
  s4 <6 5> <4> <_+>

}

forma = {

  \key la\minor
  \time 4/4
  \tempo 2 = 70
  s1*208
  \bar "|."

}

Ifl = {
  \notypeset
  <<\Ifln \forma>>
}


IvlI = {
  <<\IvlIn \forma>>
}


IvlII = {
  <<\IvlIIn \forma>>
}


Ivla = {
  \clef alto
  <<\Ivlan \forma>>

}

Ivc = {
  \clef bass
  <<\Ivcn \forma>>

}


Ibc = {
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset
}



IIfln = \relative do'' {

  fa,4. la32(fa16.) re'8 re
  \grace mi re do4 \grace sib8 la16 sol32(fa) sib8 sib
  \grace do sib la4 do8 [do, fa]

  %4
  \appoggiatura fa mi8.\tr fa16 \appoggiatura fa8 sol8. la16 sib8 sib
  \grace do8 sib la4 do8\p\tr[re fa,]
  \appoggiatura sol16 fa mi r sol sol(sib,) r re \appoggiatura mi re do \appoggiatura re do sib\mbreak

  %7
  la8 do'_\upl \f r do32(la16.) do8 do
  do32[(sol16.) do8_\upl] r  mi16.\tr fa32 \tuplet 3/2 { sol16[(fa mi)] re(do sib) }
  la8 fa'\upl\p r fa32(re16.) fa8 fa

  %10
  fa32(do16.) fa8\upl r la16.\tr sib32 \tuplet 3/2 { do16[(sib la)] sol (fa mib) }
  re8 re'4\f sib \grace la8 sol
  fa(mi) \tuplet 3/2 { r16 sol(la sib[la sol)] la\upl do,(re mib[re do)] }\mbreak

  %13 OOOOO KKKKKKK
  re8. (do64 sib la sol) fa4\tr sol\tr
  fa8 mib'\p\upl r mib32(do16.)re32(sib16.) fa'32(re16.)
  do8 mib,\f_\upl r mib32(do16.) re8 sib'

  %16
  re,4\tr do r
  fa'4.\solo la32(fa16.) re'8 re\mbreak
  \grace mi8 re do4 \grace sib16 la sol32(fa) sib8 sib

  %19
  \grace do16 sib8 la4 do8 do, fa
  \grace fa mi8. fa16 \grace fa8 sol8. la16 sib8 sib
  \grace do8 sib la4 do8  re fa,

  %22
  \grace sol16 fa(mi) r sol\p sol(sib,) r re \grace mi re(do) \grace re do(sib)
  la8.\tr sol16 fa4 r\mbreak
  fa'4.\f la32(fa16.) re'8 do

  %25
  \grace do si4. re8 re, fa
  \grace fa mi re16 do sol'8. fa32 (sol la8) do,
  \grace do si4 r8 \grace la'16 sol32(fad sol la) fad8 fa

  %28
  mi\tr re r \grace la'16 sol32\p(fad sol la) fad8 fa
  mi\tr re r sol,\f(si re)\mbreak
  sol4. \grace re16 do32(si do re) do8 do

  %31
  do4.\tr fa,8(la do)
  la'4. la,16. si32 do8 do
  si4. la'8(sol fa)

  %34
  \tuplet 3/2 { mi16(re mi) la[(fa re)] } do4 (re\tr)
  mi32(do16.) sol'32(mi16.) do'32(sol16.) mi'32(re16.) do32(si16.) la32(sol16.)\mbreak
  fad8.\tr re'16 re4. r16 fa,

  %37
  \tuplet 3/2 { mi do'(si) la\tr[(sol fa)] mi\tr(re do) si\tr[(la sol)] } re'4\tr
  do4.\tu mi,32(do16.) la'8 la
  \grace sib8 la sol4 \grace fa16 mi16 re32(do) fa8 fa

  %40
  \grace sol fa mi4 do16. re32 mi16. fa32 sol16. la32
  sib4\tr sib\tr \tuplet 3/2 { sol'16(fa mi) re[(do sib)]}\mbreak
  fa'4.\solo la32(fa16.) re'8 re\mbreak

  %43
  \grace mi8 re do4 \grace sib16 la sol32(fa) sib8 sib
  \grace do8 sib8 la4 fa,16. sol32 la16. sib32 do16. re32
  mib4\tr mib\tr \tuplet 3/2 { do'16(sib la) sol[(fa mib)] }

  %46
  mib8\tr re4 fa32(re16.) sib'8[re,]
  \grace re do8. re16 \grace re8  mib8. fa16 sol8 sib,\mbreak
  la16.\tr sol32 fa8 r fa'32(do16.) re8 re

  %49
  re\tr do4 do'32 (mib,16.) re8 sib'32(re,16.)
  re8\tr do r fa4 lab,8
  sol sol'4 mib do8

  %52
  la la'4 fa re8
  sib4 mib8.\tr [fa16 sol8.\tr la16]
  sib8 fa r re'32(sib16.) do8 mib,\mbreak

  %55
  \grace mib16 re8 do16 sib sol'4\tr la\tr
  sib8 fa r re'32 (sib16.) do8 mib,
  \grace mib re4 sol~\tuplet 3/2 { sol16(fa mib) re[(do sib)] }

  %58
  \grace sib8 la4. do16 (re) mib8 re16(do)
  \tuplet 3/2 { re(sib' fa) sol[(mib do)] } sib4\tr do \tr
  sib8 fa'\upl\tu r fa32(re16.) fa8 fa\mbreak

  %61
  fa32(do16.) fa8 r la16.\tr sib32 \tuplet 3/2 { do16[(sib la)] sol(fa mib) }
  re8 sib\upl\p r sib32(sol16.) sib8 sib
  sib32(fa16.) sib8 r re16.\tr mib32 \tuplet 3/2 { fa16(mib re) do[(sib lab)] }

  %64
  sol8 sol'4\f mib \grace re8 do
  sib(la) \tuplet 3/2 {r16 do(re mib[re do)] re_\upl fa,(sol lab[sol fa)]}  %fine riga 3 p. 2
  sol8.(fa64 mib re do) sib4\tr do\tr

  %67
  sib'4.\solo re32(sib16.) sol'8 sol
  \grace la sol  fa4 \grace mib16 re do32(sib) sib'8 sib
  \grace do sib la4 do8 do, mib

  %70
  \grace fa mib? re4 sib16.\tr  la32 sib16. do32 re16. mi32
  fa4._\markup {[\musicglyph #"f"]} la32(fa16.) re'8 re\mbreak
  \grace mi re do4 \grace sib8 la16 sol32 fa sib8 sib

  %73
  \grace do sib la4 do8 do, fa
  \grace fa mi8. fa16 \grace fa8 sol8. la16 sib8 sib\mbreak
  \grace do8 sib la4 do8 re fa,

  %76
  \grace sol16 fa16(mi) r sol\p sol(sib,) r re \grace mi16 re16(do) \grace re16 do16(sib)
  la8 do\upl\f r do32(la16.) do8 do
  do32(sol16.) do8 r mi16.\tr fa32 \tuplet 3/2 { sol16[(fa mi)] re(do sib) }

  %79
  la8 fa'\upl\p r fa32(re16.) fa8 fa
  fa32(do16.) fa8\upl r la16.\tr sib32 \tuplet 3/2 { do16[(sib la)] sol (fa mib) }
  re8 re'4\f sib \grace la8 sol

  %82
  \grace fa mi4 r8\grace re'16 do32(si do re) si8 sib
  la\tr sol r \grace re'16 do32\p(si do re) si8 sib
  la\tr sol r do,\f(mi sol)

  %85
  do4. \grace sol16 fa32(mi fa sol) fa8 fa
  fa4.\tr sib,8(re fa)
  re'4. re,16 [mi fa8 fa]

  %88
  \grace fa mi4. do16 [mi sol8 sib]\mbreak
  \tuplet 3/2 { la16(sol la) re[(sib sol)] } fa4\tr sol\tr
  fa r8 \grace sol16 fa32(mi fa sol) mi8 mib

  %91
  re\tr do r \grace sol'16 fa32\p(mi! fa sol) mi8 mib
  re\tr do r do\tr\f re fa,
  \grace fa mi4. re'8(do sib)

  %94
  la16 fa' re sib la4(sol\tr)
  fa r r
  R2.*9

}

IIvlIn = \relative do'' {

  fa,4. la32(fa16.) re'8 re
  \grace mi re do4 \grace sib8 la16 sol32(fa) sib8 sib
  \grace do sib la4 do8 [do, fa]

  %4
  \appoggiatura fa mi8.\tr fa16 \appoggiatura fa8 sol8. la16 sib8 sib
  \grace do8 sib la4 do8\tr\p[re fa,]
  \appoggiatura sol16 fa mi r sol sol(sib,) r re \appoggiatura mi re do \appoggiatura re do sib\mbreak

  %7
  la8 do'_\upl \f r do32(la16.) do8 do
  do32[(sol16.) do8_\upl] r  mi16.\tr fa32 \tuplet 3/2 { sol16[(fa mi)] re(do sib) }
  la8 fa'\upl\p r fa32(re16.) fa8 fa

  %10
  fa32(do16.) fa8\upl r la16.\tr sib32 \tuplet 3/2 { do16[(sib la)] sol (fa mib) }
  re8 re'4\f sib \grace la8 sol
  fa(mi) \tuplet 3/2 { r16 sol(la sib[la sol)] la\upl do,(re mib[re do)] }\mbreak

  %13 OOOOO KKKKKKK
  re8. (do64 sib la sol) fa4\tr sol\tr
  fa8 mib'\p\upl r mib32(do16.)re32(sib16.) fa'32(re16.)
  do8 mib,\f_\upl r mib32(do16.) re8 sib'

  %16
  re,4\tr do r
  la'8\p la la la sib sib
  sib la la do re[re]

  %19
  re do do la la la
  sol do do do sol'[sol]\mbreak
  sol fa fa la,(sib la)

  %22
  sol sol mi mi mi mi
  fa fa fa fa'\f\upl do\upl la\upl
  fa do'\p do do fa mi

  %25
  re re re re re re
  do do mi mi fa mi
  re re re si(do re)

  %28
  do\tr si r si\pp(do re)
  do\tr si r4 r\mbreak
  r8 sol\p(do mi) sol[sib,!]

  %31
  la(do fa) la r4
  r8 la,(re fad) la re,
  r re re re re re

  %34
  do do do do si si
  do4 r r
  R2.*2

  %38
  do,4.\f mi32(do16.) la'8 la
  \grace sib8 la sol4 \grace fa16 mi16 re32(do) fa8 fa
  \grace sol fa mi4 do16. re32 mi16. fa32 sol16. la32

  %41
  sib4\tr sib\tr \tuplet 3/2 { sol'16(fa mi) re[(do sib)]}
  sib8 la\p la la sib sib
  sib la la do re[re]

  %44
  re do do do do do
  sib sib do do do do
  do sib sib sib re, fa\mbreak

  %47
  sol sol do do do do
  do la la la sib sib
  sib la la la sib sib

  %50
  sib la la la sib sib
  sib sib do do do do
  do do re re re re

  %53
  re re sib sib sib mib
  re re re fa fa, do'
  sib sib mib mib do do

  %56
  re re re fa fa, fa
  fa fa r4 r
  R2.*2

  %60
  r8 fa'\upl\f r fa32(re16.) fa8 fa\mbreak
  fa32(do16.) fa8 r la16.\tr sib32 \tuplet 3/2 { do16[(sib la)] sol(fa mib) }
  re8 sib\upl\p r sib32(sol16.) sib8 sib

  %63
  sib32(fa16.) sib8 r re16.\tr mib32 \tuplet 3/2 { fa16(mib re) do[(sib lab)] }
  sol8 sol'4\f mib \grace re8 do
  sib(la) \tuplet 3/2 {r16 do(re mib[re do)] re_\upl fa,(sol lab[sol fa)]}  %fine riga 3 p. 2

  %66
  sol8.(fa64 mib re do) sib4\tr do\tr
  sib8 re\p re re mib mib
  mib? re re sib re' re

  %69
  do do do do do do
  do sib16. do32 re8[re sib sib]
  la4 r r

  %72
  R2.*5
  r8 la32\p (fa16.) la8[la la la]
  sol sol32(mi16.) sol8[sol sol sol]

  %79
  fa do'32(la16.) re8 re re re\mbreak
  do do32(la16.) do8 do do do
  re fa sol sol sol sol

  %82
  sol sol r mi(fa sol)
  fa\tr mi r mi\pp(fa sol)
  fa\tr mi r4 r

  %85
  r8 do\p(fa la) do mib,
  re(fa sib) re r4
  r8 re,(sol si) re sol,

  %88
  sol do, do,4 r
  R2.\mbreak
  r4 r8 la'\p(sib do)

  %91
  sib\tr la r la\pp(sib do)
  sib\tr la r4 r
  R2.*2

  %95
  r8 do\upl \f r do32(la16.) do8 do
  do32[(sol16.) do8_\upl] r  mi16.\tr fa32 \tuplet 3/2 { sol16[(fa mi)] re(do sib) }
  la8 fa'\upl\p r fa32(re16.) fa8 fa

  %98
  fa32(do16.) fa8\upl r la16.\tr sib32 \tuplet 3/2 { do16[(sib la)] sol (fa mib) }
  re8 re'4\f sib \grace la8 sol
  fa(mi) \tuplet 3/2 { r16 sol(la sib[la sol)] la\upl do,(re mib[re do)] }\mbreak

  %101
  re8. (do64 sib la sol) fa4\tr sol\tr
  fa8 mib'\p\upl r mib32(do16.)re32(sib16.) fa'32(re16.)
  do8 mib,\f_\upl r mib32(do16.) re8 sib'

  %104
  re,4\tr do r\fermata

}

IIvlIIn = \relative do'' {

  fa,4. la32(fa16.) re'8 re
  \grace mi re do4 \grace sib8 la16 sol32(fa) sib8 sib
  \grace do sib la4 do8 [do, fa]

  %4
  \appoggiatura fa mi8.\tr fa16 \appoggiatura fa8 sol8. la16 sib8 sib
  \grace do8 sib la4 do8\p\tr[re fa,]
  \appoggiatura sol16 fa mi r sol sol(sib,) r re \appoggiatura mi re do \appoggiatura re do sib\mbreak

  %7
  la8 do'_\upl \f r do32(la16.) do8 do
  do32[(sol16.) do8_\upl] r  mi16.\tr fa32 \tuplet 3/2 { sol16[(fa mi)] re(do sib) }
  la8 fa'\upl\p r fa32(re16.) fa8 fa

  %10
  fa32(do16.) fa8\upl r la16.\tr sib32 \tuplet 3/2 { do16[(sib la)] sol (fa mib) }
  re8 re'4\f sib \grace la8 sol
  fa(mi) \tuplet 3/2 { r16 sol(la sib[la sol)] la\upl do,(re mib[re do)] }\mbreak

  %13 OOOOO KKKKKKK
  re8. (do64 sib la sol) fa4\tr mi\tr
  fa8 do'_\upl\p   r do32(la16.) sib32(fa16.) re'32(sib16.)
  la8 do,_\upl \f r do32(la16.) sib8 re\mbreak

  %16
  sib4\tr la r
  fa'8\p fa fa fa fa fa
  fa fa fa fa fa fa

  %19
  fa fa fa fa fa fa
  do do do do do do
  fa fa fa fa sib, si

  %22
  do do do do do do
  fa fa fa fa'\upl\f do\upl la\upl
  fa la\p la la la la

  %25
  r re, sol si si si
  sol sol do do do do\mbreak
  r sol sol, sol'(la si)

  %28
  do sol r sol,\pp(la si)
  do sol r4 r
  r r8 sol'\p sol sol

  %31
  r fa(la do) fa[(la)]
  r4 r8 re,, la' la
  r si si si si si

  %34
  sol fa mi mi fa fa
  mi4 r r
  R2.*2\mbreak

  %38
  do4.\f mi32(do16.) la'8 la
  \grace sib8 la sol4 \grace fa16 mi16 re32(do) fa8 fa
  \grace sol fa mi4 do16. re32 mi16. fa32 sol16. la32

  %41
  sib4\tr sib\tr \tuplet 3/2 { sib16(la sol) sib[(la sol)]}
  fa8 fa\p fa fa fa fa
  fa fa fa fa fa fa

  %44
  fa fa fa fa fa fa
  sol sol la la fa fa
  sib, sib sib sib sib sib\mbreak

  %47
  mib mib mib mib mib mi
  fa fa fa fa fa fa
  fa fa fa fa fa fa

  %50
  fa fa fa fa re re
  mib mib mib mib mib mib
  fa fa fa fa fa fa

  %53
  sol sol sol sol mib do
  sib sib sib sib la la
  sib sib sib sib sib sib

  %56
  sib sib sib sib la la
  sib sib r4 r\mbreak
  R2.*2

  %60
  r8 fa''\upl\f r fa32(re16.) fa8 fa\mbreak
  fa32(do16.) fa8 r la16.\tr sib32 \tuplet 3/2 { do16[(sib la)] sol(fa mib) }
  re8 sib\upl\p r sib32(sol16.) sib8 sib

  %63
  sib32(fa16.) sib8 r re16.\tr mib32 \tuplet 3/2 { fa16(mib re) do[(sib lab)] }
  sol8 sol'4\f mib \grace re8 do
  sib(la) \tuplet 3/2 {r16 do(re mib[re do)] re_\upl fa,(sol lab[sol fa)]}  %fine riga 3 p. 2

  %66
  sol8.(fa64 mib re do) sib4\tr la\tr
  sib8 sib\p sib sib sib sib
  sib sib sib sib sib sib

  %69
  fa' fa fa fa fa fa
  sib, sib sib sib sol' sol
  fa4 r r

  %72
  R2.*5
  r8 fa\p fa fa fa fa\mbreak
  mi mi mi mi mi mi

  %79
  fa fa sib, sib sib sib
  la la la la la la
  sib sib' sib sib re re

  %82
  do do r do(re mi)
  fa do r do,\pp(re mi)
  fa do r4 r

  %85
  r r8 do' do do
  r sib( re fa) sib re
  r4 r8 sol,, sol re'\mbreak

  %88
  do do do,4 r
  R2.
  r4 r8 fa\p(sol la)

  %91
  sib fa r fa\pp(sol la)
  sib fa r4 r
  R2.*2

  %95
  r8 do'\upl \f r do32(la16.) do8 do
  do32[(sol16.) do8_\upl] r  mi16.\tr fa32 \tuplet 3/2 { sol16[(fa mi)] re(do sib) }
  la8 fa'\upl\p r fa32(re16.) fa8 fa

  %98
  fa32(do16.) fa8\upl r la16.\tr sib32 \tuplet 3/2 { do16[(sib la)] sol (fa mib) }
  re8 re'4\f sib \grace la8 sol
  fa(mi) \tuplet 3/2 { r16 sol(la sib[la sol)] la\upl do,(re mib[re do)] }\mbreak

  %101
  re8. (do64 sib la sol) fa4\tr mi\tr
  fa8 do'_\upl\p   r do32(la16.) sib32(fa16.) re'32(sib16.)
  la8 do,_\upl \f r do32(la16.) sib8 re\mbreak

  %104
  sib4\tr la r\fermata

}


IIvlan = \relative do' {

  la4. do32(la16.) sib8 sib
  \grace do sib la4 \grace re8 do16 sib32(la) re8 re
  \grace mi re do4 la8 la la

  %4
  sol do do do sol'[sol]
  \grace la sol fa4 la,8\tr\p sib la
  \grace sib la16(sol) r sib sib(sol) r sib \appoggiatura do8 sib16 la \appoggiatura sib8 la16 sol\mbreak

  %7
  fa8 la'32\f(fa16.) la8 la la la
  sol sol32(mi16.) sol8 sol do,[do]
  do do'32\p(la16.) re8 re re re

  %10
  do do32(la16.) do8 do fa, fa
  fa fa4\f re' \grace do8 sib
  la(sol) \tuplet 3/2 { r16 mi(fa sol[fa mi)] fa\upl la(sib do[sib la)]}

  %13
  sib8 sib, la la sib sib
  la la32\p(fa16.) do'8 fa, fa fa
  fa la32\f(fa16.) do'8 fa, fa fa

  %16
  fa4 fa r
  R2.*6
  r4 r8 fa'\upl\f do\upl la\upl

  %24
  fa4 r r
  R2.*13\mbreak
  mi4.\f sol32(mi16.) fa8 fa

  %39
  \grace sol fa mi4 \grace la8 sol16 fa32(mi) la8 la
  \grace si la sol4 sol8(do mi)
  fa fa sol sol mi mi

  %42
  fa4 r r
  R2.*17\mbreak
  r8 re'32\f(sib16.) re8 re re re

  %61
  do do32(la16.) do8 do fa, fa
  fa fa32\p(re16.) sol8 sol sol sol
  fa fa32(re16.) fa8 fa sib, sib

  %64
  sib sib4\f sol' \grace fa8 mib
  re(do) \tuplet 3/2 { r16 la(sib do[sib la)] sib\upl re(mib fa[mib re)] }
  mib8 mib, re re mib mib

  %67
  re4 r r
  R2.*27
  r8 la''32\f(fa16.) la8 la la la

  %96
  sol sol32(mi16.) sol8 sol do,[do]
  do do'32\p(la16.) re8 re re re
  do do32(la16.) do8 do fa, fa

  %99
  fa fa4\f re' \grace do8 sib
  la(sol) \tuplet 3/2 { r16 mi(fa sol[fa mi)] fa\upl la(sib do[sib la)]}
  sib8 sib, la la sib sib

  %102
  la la32\p(fa16.) do'8 fa, fa fa
  fa la32\f(fa16.) do'8 fa, fa fa
  fa4 fa r\fermata

}


IIvcn = \relative do {

  fa8 fa fa fa fa fa
  fa fa fa fa fa fa
  fa fa fa fa fa fa

  %4
  do do do do do do
  fa fa fa fa sib,[si]
  do do\p do do do do\mbreak

  %7
  fa fa\f  fa fa fa fa
  mi mi mi mi mi mi
  fa fa\p sib sib sib sib

  %10
  la la la la la la
  sib4 sib,\f sib
  do do' fa,

  %13
  r8 sib, do do do do
  fa fa\p fa fa fa fa
  fa fa\f fa fa fa fa\mbreak

  %16
  fa4 fa, r
  R2.*6
  r4 r8 fa''\upl\f do\upl la\upl
  fa4 r r

  %25
  R2.*13
  do8\f do do do do do
  do do do do do do

  %40
  do do do do do do
  re re mi mi do do
  fa4 r r

  %43
  R2.*17
  sib,8 sib\f sib sib sib sib

  %61
  la la la la la la
  sib [sib\p] mib mib mib mib\mbreak
  re re re re re re

  %64
  mib4 mib,\f mib
  fa fa' sib,
  r8 mib, fa fa fa fa

  %67
  sib4 r r
  R2.*27
  fa'8\f fa fa fa fa fa
  mi mi mi mi mi mi

  %97
  fa fa sib\p sib sib sib
  la la la la la la
  sib4 sib,\f sib\mbreak

  %100
  do do' fa,
  r8 sib, do do do do
  fa fa\p fa fa fa fa

  %103
  fa fa\f fa fa fa fa
  fa4 fa, r\fermata

}


IIbcn = \relative do {

  fa8 fa fa fa fa fa
  fa fa fa fa fa fa
  fa fa fa fa fa fa

  %4
  do do do do do do
  fa fa fa fa sib,[si]
  do do\p do do do do\mbreak

  %7
  fa fa\f  fa fa fa fa
  mi mi mi mi mi mi
  fa fa\p sib sib sib sib

  %10
  la la la la la la
  sib4 sib,\f sib
  do do' fa,

  %13
  r8 sib, do do do do
  fa fa\p fa fa fa fa
  fa fa\f fa fa fa fa\mbreak

  %16
  fa4 fa, r
  fa'8\solo fa fa fa fa fa
  fa fa fa fa fa fa

  %19
  fa fa fa fa fa fa
  do do do do do do
  fa fa fa fa sib, si

  %22
  do do do do do do
  fa fa fa fa'\upl\f do\upl la\upl
  fa fa\p fa fa fa fad

  %25
  sol sol sol sol sol sol
  do, do do do fa[fad]
  sol sol sol sol sol sol

  %28
  sol sol sol sol sol sol
  sol sol sol sol fa fa\mbreak
  mi mi mi mi mi mi

  %31
  fa fa fa fa fa fa
  fad fad fad fad fad fad
  sol sol sol sol sol sol

  %34
  do fa, sol sol sol sol
  do do do do do do
  do do si si si si

  %37
  do fa, sol4 sol,\mbreak
  do8\f do do do do do
  do do do do do do

  %40
  do do do do do do
  re re mi mi do do
  fa8 fa\solo fa fa fa fa

  %43
  fa fa fa fa fa fa
  fa fa fa fa fa fa
  sol sol la la fa fa

  %46
  sib, sib sib sib sib sib
  mib mib mib mib mib mi\mbreak
  fa fa fa fa fa fa

  %49
  fa fa fa fa fa fa
  fa fa fa fa re re
  mib mib mib mib mib mib

  %52
  fa fa fa fa fa fa
  sol sol sol sol mib do
  sib sib sib sib la la

  %55
  sib sib sib sib sib sib\mbreak
  sib sib sib sib la[fa'\p]
  sib [sib] mib, mib mib mib

  %58
  fa fa fa fa(sol la)
  sib mib, fa fa fa fa
  sib, sib\f sib sib sib sib

  %61
  la la la la la la
  sib [sib\p] mib mib mib mib\mbreak
  re re re re re re

  %64
  mib4 mib,\f mib
  fa fa' sib,
  r8 mib, fa fa fa fa

  %67
  sib8\solo sib sib sib sib sib\mbreak
  sib sib sib sib sib sib
  fa' fa fa fa fa fa

  %70
  sib, sib sib sib sol'[sol]
  fa8\p fa fa fa fa fa
  fa fa fa fa fa fa

  %73
  fa fa fa fa fa fa\mbreak
  do' do do do do do
  fa, fa fa la, sib si

  %76
  do do do do do do
  fa,8\solo fa' fa fa fa fa
  mi mi mi mi mi  mi

  %79
  fa fa sib, sib sib sib
  la la la la la la\mbreak
  sib8 sib sib sib sib si

  %82
  do do do do do do
  do do do do do do\mbreak
  do do do do sib sib

  %85
  la la la la la la
  sib sib sib sib sib sib
  si si si si si si

  %88
  do do do do do do
  fa sib do do do do
  fa, fa fa fa fa fa

  %91
  fa fa fa fa fa fa\mbreak
  fa fa fa la, sib si
  do do do do do do

  %94
  fa sib do4 do,
  fa8\f fa fa fa fa fa
  mi mi mi mi mi mi

  %97
  fa fa sib\p sib sib sib
  la la la la la la
  sib4 sib,\f sib\mbreak

  %100
  do do' fa,
  r8 sib, do do do do
  fa fa\p fa fa fa fa

  %103
  fa fa\f fa fa fa fa
  fa4 fa, r\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2 <6 4>4
  s8 <5 3> s4 <6 4>
  s8 <5 3> s2
  s <7>4
  <9 4>8 <8 3> s4 s8 <7>
  s2.*2
  <6>2.
  s
  <6>
  s2 <6>4
  s2.
  s4 <6 4> <5 3>
  s8 <7-> s4 <6 4>
  <5 3>8 <7-> s4 <6 4>
  s <5 3> s
  s2.*7
  s2 <6>8 <7>
  <_!>2.
  s2 s8 <7>
  <_!>2 <7\\ 4 2>8 <7! _!>
  <6 4> <5 _!> s4 <7\\ 4 2>8 <7! -_!>
  <6 4> <5 _!> s4 <4! 2>
  <6>2 <6 5->4
  s2.
  <6>2 <6 5>4
  <_!>2.
  s4 <6 4> <5 _!>
  s2 <6>4
  <4\+ 2> <6 5!> s
  s <6 4> <5 _!>
  s2 <6 4>4
  s8 <5 3> s4 <6 4>
  s8 <5 3> s2
  <6>4 <6 5> <7>
  s2.*14
  s2 s8 <7->
  s4 <6 5> s
  s s <6->8 <6 5->
  s4 <6 4> <5 3>
  s2.
  <6>
  s
  <6>
  s2 <6>4
  s2.
  s4 <6 4> <5 3>
  s2.*4
  s2 <6 4>4
  s8 <5 3> s4 <6 4>
  s8 <5 3> s2
  s <7>4
  <9 4>8 <8 3> s4 s8 <7>
  s2.*5
  s2 <6>4
  s2 <7! 4 2>8 <7- 3>
  <6 4> <5 3> s s <7! 4 2> <7- 3>
  <6 4> <5 3> s4 <2>
  <6> s <6 5->
  s2.
  <6>2 <6 5>4
  s2 <7>4
  s <6 4> <5 3>
  s2 <7 4 2>8 <7- 3>
  <6 4> <5 3> s s <7 4 2> <7- 3>
  <6 4> <5 3> s4 s8 <7>
  s2.
  s4 <6 4> <5 3>
  s2.
  <6>
  s
  <6>
  s4 s <6>
  s2.
  s4 <6 4> <5 3>
  s8 <7-> s4 <6 4>
  <6 3>8 <7-> s4 <6 4>
  s <5 3>

}

forma = {

  \key fa\major
  \time 3/4
  \tempo 4 = 58
  s2.*104
  \bar "|."

}

IIfl = {
  \notypeset
  <<\IIfln \forma>>
}


IIvlI = {
  <<\IIvlIn \forma>>
}


IIvlII = {
  <<\IIvlIIn \forma>>
}


IIvla = {
  \clef alto
  <<\IIvlan \forma>>

}

IIvc = {
  \clef bass
  <<\IIvcn \forma>>

}


IIbc = {
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset
}



IIIfln = \relative do'' {

  la'8 \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }

  %4
  mi,8_\upl si''8.[(do32 re)]
  do4 \grace fad,8 mi32(red mi fad)
  mi8\upl la\upl do\upl

  %7
  si4 \grace fad8 mi32(red mi fad)\mbreak
  mi8\upl si'\upl re,\upl
  do\upl\f \tuplet 3/2 { la'16[ sol fa] mi re do }  %% OK

  %10
  si8\upl \tuplet 3/2 { sol'16[fa mi] re do si }
  la8_\upl \tuplet 3/2 { fa'16[mi re] do si la }
  \grace la8 sold4 r8

  %13
  la'\p \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }

  %16
  mi,8_\upl si'8.[(do32 re)]
  do4.(
  la'\f)~

  %19
  la8 do,\p do
  do\tr si r
  la32\f(sol la si) dod[(si dod re)] mi (sol, fa mi)

  %22
  fa(re mi fa sol la si dod) re8\upl\noBeam
  sol,32(fad sol la) si[(la si do)] re (fa, mi re)\mbreak
  mi(do re mi fa sol la si) do8\upl\noBeam

  %25
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}
  do8\upl sold'(la)
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}

  %28
  do8\upl sold'(la)
  mi,32\f fad sold la si[do re mi] fa! re do si
  do si do re mi8\upl\noBeam r16 la\mbreak

  %31
  sol32 fa mi re do8[(si\tr)]
  la4 r8
  \tuplet 3/2 { sold'16\upl\p si(la sold[fa mi)] } re8

  %34
  \tuplet 3/2 { do16\upl mi(re do[si la)] } la'8
  sold32\f(fad sold la) si[(la sold fad)] mi (re do si)
  do(si do re) mi[(re do si)] la(sol fa mi)

  %37
  fa'16. mi32 re16. do32 si16.\tr la32\mbreak
  sold16.\tr fad32 mi16.\tr re32 do16.\tr si32
  do16. la'32 re,8 [mi]

  %40
  la,4 r8
  la''8\solo \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]

  %43
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }
  mi,8_\upl si''8.[(do32 re)]
  do4 \grace fad,8 mi32(red mi fad)

  %46
  mi8\upl la\upl do\upl\mbreak
  si4 \grace fad8 mi32(red mi fad)
  mi8\upl si'\upl re\upl

  %49
  do8. si32 do re16.[do32]
  \grace do8 si8. la32 si do16.[si32]
  \grace si8 la8. sold32 la si16.[la32]

  %52
  \grace la8 sold4 r8
  la8 \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]\mbreak

  %55
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }
  mi,8_\upl si''8.[(do32 re)]
  \grace re8 do4 si8

  %58
  \grace si la4 sol8
  fad do' mi,
  \grace mi red4 r8

  %61
  si\p(dod red)
  mi(fad sol\f)
  la4 sol8

  %64
  \grace la sol fad r\mbreak
  si\p si, mi
  \grace mi red4 mi8

  %67
  la,16.(si32) la8 sol
  \grace sol fad4 fad'8\f
  sol32 si sol mi sol[si sol mi] si' la sol fad

  %70
  sol si sol mi sol[si sol mi] si' do si la
  sol la si la sol[fad mi re] mi re do si\mbreak
  do la si do re[mi fad sol] la si la sol

  %73
  fad sol la sol fad[mi re do] re do si la
  si sol la si do[re mi fad] sol la sol fad
  mi fad sol fad mi[re do si] do si la sol

  %76
  la fad sol la si[do re mi] fad sol fad mi\mbreak
  red mi fad mi red [do si la] si la sol fad
  \once\stemUp sol8_\upl si'\upl si\upl

  %79
  si\tr mi\upl si\upl
  si\tr do\upl r16 la
  sol32(fad mi16) fad4\tr

  %82
  mi8\upl si\upl si\upl
  si\tr mi\upl si\upl
  si\tr do r16 la\mbreak

  %85
  sol32(si mi16) sol,8[(fad\tr)]
  mi \tuplet 3/2 { r16 si'\tu(la sol[la si)] }
  mi,8_\upl mi'8.[(fad32 sol)]

  %88
  fad8 \tuplet 3/2 { r16 fad,(mi red[mi fad)] }
  si,8 fad''8.[(sol32 la)]
  sol4 \grace do,8 si32(la si do)

  %91
  si8\upl mi\upl sol\upl\mbreak
  fad4 \grace do8 si32\p(la si do)
  si8\upl fad'\upl la,\upl

  %94
  sol_\upl\f \tuplet 3/2 { mi'16[re do] si la sol }
  fad8_\upl \tuplet 3/2 { re'16[do si] la sol fad }
  mi8_\upl \tuplet 3/2 { do'16[si la] sol fad mi }

  %97
  \grace mi8 red4 r8
  mi'\p \tuplet 3/2 { r16 si(la sol[la si)] }\mbreak %% fine pagina
  mi,8_\upl mi'8.[(fad32 sol)]

  %100
  fad8 \tuplet 3/2 { r16 fad,(mi red[mi fad)] }
  si,8 fad''8.[(sol32 la)]
  sol16\f\upl mi32(red mi[fad sol la)] si(re, do si)

  %103
  do(la si do re mi fad sold) la8\noBeam\upl
  re,32(dod re mi) fad[(mi fad sol)] la(do, si la)\mbreak
  si(sol la si do re mi fad) sol8\noBeam\upl

  %106
  si,,\f~\tuplet 3/2 { si16 fad'\p(sol la[sol fad)] }
  sol8\upl red'(mi)
  si,\f~\tuplet 3/2 { si16 fad'\p(sol la[sol fad)] }

  %109
  sol8\upl red'(mi)
  si,32\f dod red mi fad[sol la si] do! la sol fad
  sol fad sol la si8\noBeam\upl r16 mi\mbreak

  %112
  re32 do si la sol8[(fad\tr)]
  mi16._\upl si32 mi8_\upl r
  mi'\solo \tuplet 3/2 { r16 si(la sol[la si)] }\mbreak

  %115
  mi,8_\upl mi'8.[(fad32 sol)]
  fad8 \tuplet 3/2 { r16 fad(mi red[mi fad)] }
  si,8 fad'8.[(sol32 la)]

  %118
  sol4.
  mi'~
  mi8 sol, sol

  %121
  sol\tr fad r\mbreak
  si16.\upl re,32 \tuplet 3/2 { fa!16[mi re] fa mi re }
  si'16.\upl re,32 \tuplet 3/2 { fa16[mi re] fa mi re }

  %124
  si'16. la32 sold16. fa32 mi16. re32
  do16.\tr si32 la8 r
  la'16.\upl do,32 \tuplet 3/2 { mib16[re do] mib re do }

  %127
  la'16.\upl do,32 \tuplet 3/2 { mib16[re do] mib re do }\mbreak
  la'16. sol32 fad16. mib32 re16. do32
  \tuplet 3/2 { sib16 la sol re'[sol fa] mib fa re

  %130
  mib re do la'[sib do] mi, fad sol
  fad mi re sol[sib re] sib la sol
  fad mi re sol[sib re] sib la sol

  %133
  fad mi re sol[sib re] sib sol fa
  mi re do fa[la do] la fa mi
  re do sib mi[sol sib] sol mi re

  %136
  dod si la re[fa la] fa mi re
  dod sib la re[fa la] fa mi re
  sib' la sib sib[la sib] sib la sol}\mbreak

  %139
  la16.\upl dod32 re8 r16 la
  \tuplet 3/2 { sib la sol } fa8[(mi\tr)]
  re32\tu(dod re mi) fad[(mi fad sol)] la(do, sib la)

  %142
  sib(sol la sib do re mi fa?) sol8\upl\noBeam
  do,32(si! do re) mi[(re mi fa)] sol(sib, la sol)
  la(fa sol la sib do re mi) fa8\upl\noBeam\mbreak

  %145
  do,8\f~\tuplet 3/2 { do16 sol'\p(la sib[la sol)] }
  la8\upl mi'(fa)
  do,8\f~\tuplet 3/2 { do16 sol'\p(la sib[la sol)] }

  %148
  la8\upl mi'(fa)
  do,32\f re mi fa sol[la sib do] re sib la sol
  la do re mi fa[do la' sol] fa mi re do

  %151
  sib16.\tr(la64 sib) do8[do,]\mbreak
  fa'8\solo \tuplet 3/2 { r16 do(sib la [sib do)]}
  fa,8 fa'16. sol32 la16. si!32

  %154
  do8 \tuplet 3/2 { r16 sol(fa mi[fa sol)]}
  do,4.\tr
  fa,16. sol32 la16. sib32 do16. re32

  %157
  mib(re mib) la mib[(re mib) la] mib(re mib) la\mbreak
  mib8(re do)
  do\tr si! r

  %160
  sol32 fad sol la si[la si do] re do re mi!
  fa(mi fa) si fa[(mi fa) si] fa(mi fa) si
  fa8(mi re)

  %163
  re\tr dod r
  la32 si dod re mi[fa sol la] sib sol fa mi\mbreak
  fa la fa re fa[la fa re] fa la fa re

  %166
  la si dod re mi[fa sol la] sib sol fa mi
  fa la fa re fa[la fa re] fa la fa re
  sol, la si! do re[mi fa sol] la fa mi re

  %169
  mi sol mi do mi[sol mi do] mi sol mi do\mbreak
  sol la si do re[mi fa sol] la fa mi re
  mi sol mi do mi[sol mi do] fa mi re do

  %172
  re fa re si re[fa re si] mi re do si
  do mi do la do[mi do la] fa' mi re do
  re fa re si re[fa re si] mi re do si\mbreak

  %175
  do8 \tuplet 3/2 { r16 mi\tu(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }

  %178
  mi,8_\upl si''8.[(do32 re)]
  do4 \grace fad,8 mi32(red mi fad)
  mi8\upl la\upl do\upl

  %181
  si4 \grace fad8 mi32\p(red mi fad)
  mi8\upl si'\upl re,!\upl
  do\upl\f \tuplet 3/2 { la'16[ sol fa] mi re do } \mbreak

  %184
  si8\upl \tuplet 3/2 { sol'16[fa mi] re do si }
  la8_\upl \tuplet 3/2 { fa'16[mi re] do si la }
  \grace la8 sold4 r8

  %187
  la'\solo \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }

  %190
  mi,8_\upl si''8.[(do32 re)]
  do8. si32 (do re16.)[do32]
  \grace do8 si8. la32 (si do16.)[si32]

  %193
  \grace si8 la8. sold32 (la si16.)[la32]
  \grace la8 sold4 r8
  mi\p(fad sold)

  %196
  la(si do\f)
  re4 do8
  do\tr si r

  %199
  mi\p mi, la\mbreak
  \grace la sold4 la8
  re,16.(mi32) re8 do

  %202
  \grace do8 si4 si8\f
  do32 mi do la do[mi do la] mi' re do si
  do mi do la do[mi do la] la' sol fa mi

  %205
  fa sol la sol fa[mi re do] si la' sol fa\mbreak
  mi fa sol fa mi[re do si] la sol' fa mi
  re  mi fa mi re[do si la] sold fa' mi re

  %208
  do8\upl mi\upl mi\upl
  mi\tr la\upl mi\upl
  mi\upl fa r16 re

  %211
  do32(si la16) si4\tr
  la4 r8
  mi\f~\tuplet 3/2 { mi16 si'\p(do re [do si)] }

  %214
  do8\upl sold'(la)
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re [do si)] }
  do8\upl sold'(la)

  %217
  fa32\f re fa la re[do si la] sol fa mi re
  mi do mi sol do[si la sol] fa mi re do
  re32 si re fa si[la sold fa] mi re do si

  %220
  do8\upl mi\upl mi\upl
  mi\tr la\upl mi\upl
  mi\tr fa\upl r16 re

  %223
  do32(si la16) si4\tr
  la8\p\upl mi'\upl mi\upl
  mi\tr la\upl mi\upl

  %226
  mi\tr fa\upl r16 re\f\mbreak
  do32(mi la16) do,8[si\tr]
  la32\tu(sol la si) dod[(si dod re)] mi (sol, fa mi)

  %229
  fa(re mi fa sol la si dod) re8\upl\noBeam
  sol,32(fad sol la)si[(la si do)] re (fa, mi re)
  mi(do re mi fa sol la si) do8\upl\noBeam

  %232
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}
  do8\upl sold'(la)
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}

  %235
  do8\upl sold'(la)
  mi,32\f fad sold la si[do re mi] fa! re do si
  do si do re mi8\upl\noBeam r16 la

  %238
  sol32 fa mi re do8[(si\tr)]
  la4 r8
  \tuplet 3/2 { sold'16\upl\p si(la sold[fa mi)] } re8

  %241
  \tuplet 3/2 { do16\upl mi(re do[si la)] } la'8
  sold32\f(fad sold la) si[(la sold fad)] mi (re do si)
  do(si do re) mi[(re do si)] la(sol fa mi)

  %244
  fa'16. mi32 re16. do32 si16.\tr la32\mbreak
  sold16.\tr fad32 mi16.\tr re32 do16.\tr si32
  do16. la'32 re,8 [mi]

  %247
  la,4\fermata r8

}

IIIvlIn = \relative do'' {

  la'8 \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }

  %4
  mi,8_\upl si''8.[(do32 re)]
  do4 \grace fad,8 mi32(red mi fad)
  mi8\upl la\upl do\upl

  %7
  si4 \grace fad8 mi32(red mi fad)\mbreak
  mi8\upl si'\upl re,\upl
  do\upl\f \tuplet 3/2 { la'16[ sol fa] mi re do }  %% OK

  %10
  si8\upl \tuplet 3/2 { sol'16[fa mi] re do si }
  la8_\upl \tuplet 3/2 { fa'16[mi re] do si la }
  \grace la8 sold4 r8

  %13
  la'\p \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }

  %16
  mi,8_\upl si'8.[(do32 re)]
  do4.(
  la'\f)~

  %19
  la8 do,\p do
  do\tr si r
  la32\f(sol la si) dod[(si dod re)] mi (sol, fa mi)

  %22
  fa(re mi fa sol la si dod) re8\upl\noBeam
  sol,32(fad sol la) si[(la si do)] re (fa, mi re)\mbreak
  mi(do re mi fa sol la si) do8\upl\noBeam

  %25
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}
  do8\upl sold'(la)
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}

  %28
  do8\upl sold'(la)
  mi,32\f fad sold la si[do re mi] fa! re do si
  do si do re mi8\upl\noBeam r16 la\mbreak

  %31
  sol32 fa mi re do8[(si\tr)]
  la4 r8
  \tuplet 3/2 { sold'16\upl\p si(la sold[fa mi)] } re8

  %34
  \tuplet 3/2 { do16\upl mi(re do[si la)] } la'8
  sold32\f(fad sold la) si[(la sold fad)] mi (re do si)
  do(si do re) mi[(re do si)] la(sol fa mi)

  %37
  <<{fa'16. mi32 re16. do32 si16.\tr la32\mbreak}\\\stemUp\shiftOn la8\\\stemUp\shiftOnn re,>>
  sold16.\tr fad32 mi16.\tr re32 do16.\tr si32
  do16. la'32 re,8 [mi]

  %40
  la,4 r8
  R4.*11
  r8 mi'16.\p re32 do16. si32

  %53
  la8 do do
  do mi la
  sold sold sold

  %56
  sold? mi' mi
  mi mi mi
  mi mi re

  %59
  do do do
  fad, fad r
  r r si

  %62
  si,4 mi'8\mf\mbreak
  fad4 mi8
  \grace fad?8 mi8 red r

  %65
  r r sol,\p
  fad fad sol
  fad fad mi

  %68
  \grace mi red4 r8
  R4.*9
  r8 mi16._\upl\mf red32 mi16._\upl fad32

  %71
  sol8_\upl mi16. red32 mi16. fad32
  sol8\tr la_\upl r
  R4.

  %74
  r8 mi16._\upl\p red32 mi16._\upl fad32
  sol8_\upl mi16. red32 mi16. fad32
  sol8\tr la_\upl r

  %77
  R4.
  mi'8\f \tuplet 3/2 { r16 si(la sol[la si)] }
  mi,8_\upl mi'8.[(fad32 sol)]

  %88
  fad8 \tuplet 3/2 { r16 fad,(mi red[mi fad)] }
  si,8 fad''8.[(sol32 la)]
  sol4 \grace do,8 si32(la si do)

  %91
  si8\upl mi\upl sol\upl\mbreak
  fad4 \grace do8 si32\p(la si do)
  si8\upl fad'\upl la,\upl

  %94
  sol_\upl\f \tuplet 3/2 { mi'16[re do] si la sol }
  fad8_\upl \tuplet 3/2 { re'16[do si] la sol fad }
  mi8_\upl \tuplet 3/2 { do'16[si la] sol fad mi }

  %97
  \grace mi8 red4 r8
  mi'\p \tuplet 3/2 { r16 si(la sol[la si)] }\mbreak %% fine pagina
  mi,8_\upl mi'8.[(fad32 sol)]

  %100
  fad8 \tuplet 3/2 { r16 fad,(mi red[mi fad)] }
  si,8 fad''8.[(sol32 la)]
  sol16\f\upl mi32(red mi[fad sol la)] si(re, do si)

  %103
  do(la si do re mi fad sold) la8\noBeam\upl
  re,32(dod re mi) fad[(mi fad sol)] la(do, si la)\mbreak
  si(sol la si do re mi fad) sol8\noBeam\upl

  %106
  si,,\f~\tuplet 3/2 { si16 fad'\p(sol la[sol fad)] }
  sol8\upl red'(mi)
  si,\f~\tuplet 3/2 { si16 fad'\p(sol la[sol fad)] }

  %109
  sol8\upl red'(mi)
  si,32\f dod red mi fad[sol la si] do! la sol fad
  sol fad sol la si8\noBeam\upl r16 mi\mbreak

  %112
  re32 do si la sol8[(fad\tr)]
  mi16._\upl si32 mi8_\upl r
  R4.*5

  %119
  sol'4.\p~
  sol8 mi mi
  mi\tr red r

  %122
  r re! re
  r re re
  r re re

  %125
  r do do
  r do do
  r do do

  %128
  r do do
  R4.*2
  la'8\pizz sib re

  %132
  la sib re
  la sib re\mbreak
  sol, la do

  %135
  fa, sol sib
  mi, fa la
  mi fa la

  %138
  R4.*3
  re,32\f^\arco(dod re mi) fad[(mi fad sol)] la(do, sib la)

  %142
  sib(sol la sib do re mi fa?) sol8\upl\noBeam
  do,32(si! do re) mi[(re mi fa)] sol(sib, la sol)
  la(fa sol la sib do re mi) fa8\upl\noBeam\mbreak

  %145
  do,8\f~\tuplet 3/2 { do16 sol'\p(la sib[la sol)] }
  la8\upl mi'(fa)
  do,8\f~\tuplet 3/2 { do16 sol'\p(la sib[la sol)] }

  %148
  la8\upl mi'(fa)
  do,32\f re mi fa sol[la sib do] re sib la sol
  la do re mi fa[do la' sol] fa mi re do

  %151
  sib16.\tr(la64 sib) do8[do,]\mbreak
  fa4 r8
  R4.*4

  %157
  do'8\p do do
  do la la
  la\tr sol r

  %160
  R4.
  re'8 re re
  re si si

  %163
  la la r
  sol'4.\mf(
  fa4\upl\p) r8

  %166
  sol sol sol
  fa fa fa
  fa4\mf fa8

  %169
  mi4 r8\mbreak
  fa\upl fa16 fa fa fa
  mi4\upl r8

  %172
  R4.*3
  la8\f \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }

  %178
  mi,8_\upl si''8.[(do32 re)]
  do4 \grace fad,8 mi32(red mi fad)
  mi8\upl la\upl do\upl

  %181
  si4 \grace fad8 mi32\p(red mi fad)
  mi8\upl si'\upl re,!\upl
  do\upl\f \tuplet 3/2 { la'16[ sol fa] mi re do } \mbreak

  %184
  si8\upl \tuplet 3/2 { sol'16[fa mi] re do si }
  la8_\upl \tuplet 3/2 { fa'16[mi re] do si la }
  \grace la8 sold4 r8

  %187
  do,8\p do do
  do mi la
  sold sold sold

  %190
  sold? mi' mi
  mi\upl mi(fa)
  re\upl re(mi)\mbreak

  %193
  do\upl do(re)
  si si r
  r r si

  %196
  do(re mi\mf)
  mi4 mi8
  mi mi r

  %199
  r r mi,\p
  mi mi mi
  mi mi mi

  %202
  mi mi r
  R4.
  r8 r mi'

  %205
  fa4 fa8
  mi4 mi8
  re4 re8\mbreak

  %208
  do la16._\upl sold32 la16._\upl si32
  do8 la16._\upl sold32 la16._\upl si32
  do8\tr re r

  %211
  R4.
  r16 sold\f(la) do,(si la)
  R4.*7

  %220
  r8 la,16.\mf_\upl sold32 la16._\upl si32
  do8 la16. sold32 la16. si32
  do8\tr re_\upl r

  %223
  R4.*5
  la'32\f(sol la si) dod[(si dod re)] mi (sol, fa mi)

  %229
  fa(re mi fa sol la si dod) re8\upl\noBeam
  sol,32(fad sol la)si[(la si do)] re (fa, mi re)
  mi(do re mi fa sol la si) do8\upl\noBeam

  %232
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}
  do8\upl sold'(la)
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}

  %235
  do8\upl sold'(la)
  mi,32\f fad sold la si[do re mi] fa! re do si
  do si do re mi8\upl\noBeam r16 la

  %238
  sol32 fa mi re do8[(si\tr)]
  la4 r8
  \tuplet 3/2 { sold'16\upl\p si(la sold[fa mi)] } re8

  %241
  \tuplet 3/2 { do16\upl mi(re do[si la)] } la'8
  sold32\f(fad sold la) si[(la sold fad)] mi (re do si)
  do(si do re) mi[(re do si)] la(sol fa mi)

  %244
  <<{fa'16. mi32 re16. do32 si16.\tr la32\mbreak}\\\stemUp\shiftOn la8\\\stemUp\shiftOnn re,>>
  sold16.\tr fad32 mi16.\tr re32 do16.\tr si32
  do16. la'32 re,8 [mi]

  %247
  la,4\fermata r8

}

IIIvlIIn = \relative do'' {

  la'8 \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }

  %4
  mi,8_\upl si''8.[(do32 re)]
  do4 \grace fad,8 mi32(red mi fad)
  mi8\upl la\upl do\upl

  %7
  si4 \grace fad8 mi32(red mi fad)\mbreak
  mi8\upl si'\upl re,\upl
  do\upl\f \tuplet 3/2 { la'16[ sol fa] mi re do }  %% OK

  %10
  si8\upl \tuplet 3/2 { sol'16[fa mi] re do si }
  la8_\upl \tuplet 3/2 { fa'16[mi re] do si la }
  \grace la8 sold4 r8

  %13
  la'\p \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }

  %16
  mi,8_\upl si'8.[(do32 re)]
  do4.~
  do\f~

  %19
  do8 la\p la
  la\tr sold r
  la32\f(sol la si) dod[(si dod re)] mi (sol, fa mi)

  %22
  fa(re mi fa sol la si dod) re8\upl\noBeam
  sol,32(fad sol la) si[(la si do)] re (fa, mi re)\mbreak
  mi(do re mi fa sol la si) do8\upl\noBeam

  %25
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}
  do8\upl sold'(la)
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}

  %28
  do8\upl sold'(la)
  mi,32\f fad sold la si[do re mi] fa! re do si
  do si do re mi8\upl\noBeam r16 la\mbreak

  %31
  sol32 fa mi re do8[(si\tr)]
  la4 r8
  \tuplet 3/2 { sold'16\upl\p si(la sold[fa mi)] } re8

  %34
  \tuplet 3/2 { do16\upl mi(re do[si la)] } la'8
  sold32\f(fad sold la) si[(la sold fad)] mi (re do si)
  do(si do re) mi[(re do si)] la(sol fa mi)

  %37
  <<{fa'16. mi32 re16. do32 si16.\tr la32\mbreak}\\\stemUp\shiftOn la8\\\stemUp\shiftOnn re,>>
  sold16.\tr fad32 mi16.\tr re32 do16.\tr si32
  do16. la'32 re,8 [mi]

  %40
  la,4 r8
  R4.*11
  r8 mi'16.\p re32 do16. si32

  %53
  la8 la la
  la do la
  mi' mi mi

  %56
  mi sold mi
  la,_\upl la'(sol!)
  do,_\upl do'(si)

  %59
  la la, la
  si si si
  r r fad'

  %62
  sol(la si\mf)
  si4 si8
  si si r

  %65
  r r si,\p
  si si si
  si si si

  %68
  si si r
  R4.*9
  r8 mi16._\upl\mf red32 mi16._\upl fad32

  %71
  sol8_\upl mi16. red32 mi16. fad32
  sol8\tr la_\upl r
  R4.

  %74
  r8 mi16._\upl\p red32 mi16._\upl fad32
  sol8_\upl mi16. red32 mi16. fad32
  sol8\tr la_\upl r

  %77
  R4.
  mi'8\f \tuplet 3/2 { r16 si(la sol[la si)] }
  mi,8_\upl mi'8.[(fad32 sol)]

  %88
  fad8 \tuplet 3/2 { r16 fad,(mi red[mi fad)] }
  si,8 fad''8.[(sol32 la)]
  sol4 \grace do,8 si32(la si do)

  %91
  si8\upl mi\upl sol\upl\mbreak
  fad4 \grace do8 si32\p(la si do)
  si8\upl fad'\upl la,\upl

  %94
  sol_\upl\f \tuplet 3/2 { mi'16[re do] si la sol }
  fad8_\upl \tuplet 3/2 { re'16[do si] la sol fad }
  mi8_\upl \tuplet 3/2 { do'16[si la] sol fad mi }

  %97
  \grace mi8 red4 r8
  mi'\p \tuplet 3/2 { r16 si(la sol[la si)] }\mbreak %% fine pagina
  mi,8_\upl mi'8.[(fad32 sol)]

  %100
  fad8 \tuplet 3/2 { r16 fad,(mi red[mi fad)] }
  si,8 fad''8.[(sol32 la)]
  sol16\f\upl mi32(red mi[fad sol la)] si(re, do si)

  %103
  do(la si do re mi fad sold) la8\noBeam\upl
  re,32(dod re mi) fad[(mi fad sol)] la(do, si la)\mbreak
  si(sol la si do re mi fad) sol8\noBeam\upl

  %106
  si,,\f~\tuplet 3/2 { si16 fad'\p(sol la[sol fad)] }
  sol8\upl red'(mi)
  si,\f~\tuplet 3/2 { si16 fad'\p(sol la[sol fad)] }

  %109
  sol8\upl red'(mi)
  si,32\f dod red mi fad[sol la si] do! la sol fad
  sol fad sol la si8\noBeam\upl r16 mi\mbreak

  %112
  re32 do si la sol8[(fad\tr)]
  mi16._\upl si32 mi8_\upl r
  R4.*5

  %119
  do'4.\p
  dod8 dod dod
  si si r

  %122
  r si si
  r si si
  r si si

  %125
  r la la
  r la la
  r la la

  %128
  r la la
  R4.*2
  fad'8\pizz sol sib

  %132
  fad sol sib
  fad sol sib
  mi, fa! la

  %135
  re, mi sol
  dod, re fa
  dod re fa

  %138
  R4.*3
  re32\f^\arco(dod re mi) fad[(mi fad sol)] la(do, sib la)

  %142
  sib(sol la sib do re mi fa?) sol8\upl\noBeam
  do,32(si! do re) mi[(re mi fa)] sol(sib, la sol)
  la(fa sol la sib do re mi) fa8\upl\noBeam\mbreak

  %145
  do,8\f~\tuplet 3/2 { do16 sol'\p(la sib[la sol)] }
  la8\upl mi'(fa)
  do,8\f~\tuplet 3/2 { do16 sol'\p(la sib[la sol)] }

  %148
  la8\upl mi'(fa)
  do,32\f re mi fa sol[la sib do] re sib la sol
  la do re mi fa[do la' sol] fa mi re do

  %151
  sib16.\tr(la64 sib) do8[do,]\mbreak
  fa4 r8
  R4.*4

  %157
  la8\p la la
  la re, re
  re re r

  %160
  R4.
  si'8 si si
  si mi, mi

  %163
  mi mi r
  mi'4.\mf(
  re4\upl\p) r8

  %166
  mi mi mi
  re re re
  re4\mf re8

  %169
  do4 r8\mbreak
  re\upl re16 re re re
  do4\upl r8

  %172
  R4.*3
  la'8\f \tuplet 3/2 { r16 mi(re do[re mi)] }
  la,8_\upl la'8.[(si32 do)]
  si8 \tuplet 3/2 { r16 si,(la sold[la si)] }

  %178
  mi,8_\upl si''8.[(do32 re)]
  do4 \grace fad,8 mi32(red mi fad)
  mi8\upl la\upl do\upl

  %181
  si4 \grace fad8 mi32\p(red mi fad)
  mi8\upl si'\upl re,!\upl
  do\upl\f \tuplet 3/2 { la'16[ sol fa] mi re do } \mbreak

  %184
  si8\upl \tuplet 3/2 { sol'16[fa mi] re do si }
  la8_\upl \tuplet 3/2 { fa'16[mi re] do si la }
  \grace la8 sold4 r8

  %187
  la,8\p la la
  la do la
  mi' mi mi

  %190
  mi sold mi
  la la fa
  sol sol mi

  %193
  fa fa re
  mi mi r
  r r mi

  %196
  mi4 la8\mf
  si4 la8
  la\tr sold r

  %199
  r r do\p
  si si do
  si si la

  %202
  \grace la sold4 r8
  R4.
  r8 r la

  %205
  la4 si8
  si4 la8
  la4 sold8

  %208
  la la16._\upl sold32 la16._\upl si32
  do8 la16._\upl sold32 la16._\upl si32
  do8\tr re r

  %211
  R4.
  r16 sold\f(la) do,(si la)
  R4.*7

  %220
  r8 la,16.\mf_\upl sold32 la16._\upl si32
  do8 la16. sold32 la16. si32
  do8\tr re_\upl r

  %223
  R4.*5
  la'32\f(sol la si) dod[(si dod re)] mi (sol, fa mi)

  %229
  fa(re mi fa sol la si dod) re8\upl\noBeam
  sol,32(fad sol la)si[(la si do)] re (fa, mi re)
  mi(do re mi fa sol la si) do8\upl\noBeam

  %232
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}
  do8\upl sold'(la)
  mi,8\f~\tuplet 3/2 { mi16 si'\p(do re[do si)]}

  %235
  do8\upl sold'(la)
  mi,32\f fad sold la si[do re mi] fa! re do si
  do si do re mi8\upl\noBeam r16 la

  %238
  sol32 fa mi re do8[(si\tr)]
  la4 r8
  \tuplet 3/2 { sold'16\upl\p si(la sold[fa mi)] } re8

  %241
  \tuplet 3/2 { do16\upl mi(re do[si la)] } la'8
  sold32\f(fad sold la) si[(la sold fad)] mi (re do si)
  do(si do re) mi[(re do si)] la(sol fa mi)

  %244
  <<{fa'16. mi32 re16. do32 si16.\tr la32\mbreak}\\\stemUp\shiftOn la8\\\stemUp\shiftOnn re,>>
  sold16.\tr fad32 mi16.\tr re32 do16.\tr si32
  do16. la'32 re,8 [mi]

  %247
  la,4\fermata r8

}


IIIvlan = \relative do' {

  do8 do do
  do mi la
  sold sold sold

  %4
  sold mi sold
  la la do
  do\upl do\upl la\upl

  %7
  mi mi si'\mbreak
  si\upl mi,\upl mi\upl
  mi\upl fa\upl r

  %10
  re mi r
  do re re
  si si mi16.[re32]

  %13
  do8\p do do
  do mi la
  sold sold sold

  %16
  sold mi sold
  la mi mi
  fa4.\f\mbreak

  %19
  fad8 fad\p fad
  mi mi mi
  mi\f mi la,

  %22
  la4 r8
  re re sol,
  do4 r8

  %25
  si si' sold\p
  mi\upl re(mi)
  si\f si' sold\p

  %28
  mi\upl re(mi)
  <<si'4.\\\stemUp\shiftOn sold8\f\\\stemUp\shiftOnn si,>>
  la' la\upl r16 la\mbreak

  %31
  la8\upl la(sold\tr)
  la do16. re32 mi8
  si\p si si

  %34
  la mi mi16.[fa32]
  si,8\f sold'16. la32 si8
  mi, do16. re32 mi16. do32

  %37
  la8 la' fa
  si,8. r32 sold la16. si32
  la16. do32 re8[mi]\mbreak

  %40
  la,4 r8
  R4.*37
  r8 mi'16.\mf\upl red32 mi16.\upl fad32

  %79
  sol8\upl mi16. red32 mi16. fad32
  sol8\tr la r
  R4.*5

  %86
  sol,8\f sol sol
  sol si mi
  red red red

  %89
  red si red
  mi mi sol
  sol\upl sol\upl mi\upl

  %92
  si si fad'
  fad?\upl si,\upl si\upl
  si_\upl do_\upl r

  %95
  la si r
  sol la la
  fad fad si16.[la32]

  %98
  sol8\p sol sol
  sol si mi\mbreak
  red red red

  %101
  red si red
  mi\f mi mi
  mi4 r8

  %104
  la la re,
  sol4 r8
  fad fad red\p

  %107
  si_\upl la(si)
  fad'\f fad red\p
  si_\upl la(si)

  %110
  fad'4.\f\mbreak
  mi8 mi\upl r16 mi
  mi8\upl mi(red\tr)

  %113
  mi4 r8
  R4.*7
  r8 si\p la

  %122
  sold sold sold
  sold? sold sold
  sold? sold sold

  %125
  la la sol!
  fad fad fad
  fad? fad fad\mbreak

  %128
  fad fad fad
  sol sib si
  do do dod

  %131
  re4 r8
  R4.*9
  fad8\f la re,

  %142
  re4 r8
  sol sol do,
  do4 r8

  %145
  sol sol' mi\p
  do_\upl sib(do)\mbreak
  sol\f sol' mi\p

  %148
  do_\upl sib(do)
  sol4.\f
  fa8 do''4

  %151
  sib16.\tr(la64 sib) do8[do,]
  fa4 r8
  R4.*4

  %157
  fad,8\p fad fad
  fad? fad fad
  sol sol sol

  %160
  R4.\mbreak
  sold8 sold sold
  sold? sold sold

  %163
  la la r
  R4.*11
  la8\f do do

  %176
  do mi la
  sold sold sold
  sold? mi sold

  %179
  la la do
  do\upl do\upl la\upl\mbreak
  mi mi si'

  %182
  si\upl mi,\upl mi\upl
  mi\upl fa\upl r
  re mi r

  %185
  do re re
  si si r
  R4.*33

  %220
  r8 la16.\mf_\upl sold32 la16._\upl si32
  do8 la16.\mf sold32 la16. si32\mbreak
  do8\tr re\upl r

  %223
  R4.*5
  dod8\f mi la,
  la4 r8

  %230
  re re sol,
  do4 r8
  si si' sold\p

  %233
  mi\upl re(mi)
  si\f si' sold\p
  mi\upl re(mi)

  %236
  <<si'4.\\\stemUp\shiftOn sold8\f\\\stemUp\shiftOnn si,>>
  la' la\upl r16 la\mbreak
  la8\upl la(sold\tr)

  %239
  la do16. re32 mi8
  si\p si si
  la mi mi16.[fa32]

  %242
  si,8\f sold'16. la32 si8
  mi, do16. re32 mi16. do32
  la8 la' fa

  %245
  si,8. r32 sold la16. si32
  la16. do32 re8[mi]\mbreak
  la,4\fermata r8

}


IIIvcn = \relative do {

  la8 la la
  la do la
  mi' mi mi

  %4
  mi sold mi
  la la la
  la la la

  %7
  sold sold sold
  sold sold sold\mbreak
  la\upl fa\upl r

  %10
  sol! mi r
  fa re re
  mi mi16. re32 do16. si32

  %13
  la8\p la la
  la do la
  mi' mi mi

  %16
  mi sold mi
  la,\upl la'(sol!)
  fa\upl\f fa(mi)

  %19
  red red\p red
  mi mi, re'!\mbreak
  dod\f la dod

  %22
  re4 r8
  si sol si
  do!4 r8

  %25
  sold' sold mi\p
  la\upl si(do)
  sold\f sold mi\p

  %28
  la\upl si(do))
  sold4.\f
  la32 sold la si do8\upl\noBeam r16 do

  %31
  re8 mi mi,\mbreak
  la la16. si32 do16. re32
  mi8\p mi, sold

  %34
  la la,16. si32 do16. re32
  mi8\f mi, sold
  la r16 la32 si do16. la32

  %37
  re16. mi32 fa8 re
  mi8. r32 mi fad16. sold32
  la16. do,32 re8 mi

  %40
  la,4 r8
  R4.*45
  mi8\f mi mi
  mi sol mi
  si' si si

  %89
  si red si
  mi mi mi
  mi mi mi

  %92
  red red red\mbreak % fine pagina OK
  red red red
  mi\upl do\upl r

  %95
  re! si r
  do la la
  si si16. la32 sol16. fad32

  %98
  mi8\p mi mi\mbreak
  mi sol mi
  si' si si

  %101
  si red si
  mi\f mi sold
  la4 r8

  %104
  fad re fad
  sol4 r8
  red red si\p

  %107
  mi\upl fad(sol)
  red\f red si\p
  mi\upl fad(sol)

  %110
  red4.\f\mbreak
  mi32 red mi fad sol8\upl\noBeam r16 sol
  la8 si si,

  %113
  mi4 r8
  R4.*17
  re'8\pizz sib sol
  re' sib sol

  %133
  re' sib sol
  do la fa
  sib sol mi

  %136
  la fa re
  la' fa re
  R4.*3

  %141
  re8\f^\arco re fad
  sol4 r8
  mi do mi
  fa!4 r8

  %145
  mi mi do\p
  fa\upl sol(la)
  mi\f mi do\p

  %148
  fa\upl sol(la)
  mi4.\f
  fa8 la4

  %151
  sib16.\tr(la64 sib) do8[do,]
  fa4 r8
  R4.*22

  %175
  la,8\f la la
  la do la
  mi' mi mi

  %178
  mi sold mi
  la la la
  la la la

  %181
  sold sold sold
  sold sold sold\mbreak
  la\upl fa\upl r

  %184
  sol! mi r
  fa re re
  mi mi16. re32 do16. si32

  %187
  la4 r8
  R4.*40
  la'8\f la, dod

  %229
  re4 r8
  si sol si
  do!4 r8\mbreak

  %232
  sold' sold mi\p
  la\upl si(do)
  sold\f sold mi\p

  %235
  la\upl si(do))
  sold4.\f
  la32 sold la si do8\upl\noBeam r16 do

  %238
  re8 mi mi,\mbreak
  la la16. si32 do16. re32
  mi8\p mi, sold

  %241
  la la,16. si32 do16. re32
  mi8\f mi, sold
  la r16 la32 si do16. la32

  %244
  re16. mi32 fa8 re
  mi8. r32 mi fad16. sold32
  la16. do,32 re8 mi

  %247
  la,4\fermata r8



}


IIIbcn = \relative do {

  la8 la la
  la do la
  mi' mi mi

  %4
  mi sold mi
  la la la
  la la la

  %7
  sold sold sold
  sold sold sold\mbreak
  la\upl fa\upl r

  %10
  sol! mi r
  fa re re
  mi mi16. re32 do16. si32

  %13
  la8\p la la
  la do la
  mi' mi mi

  %16
  mi sold mi
  la,\upl la'(sol!)
  fa\upl\f fa(mi)

  %19
  red red\p red
  mi mi, re'!\mbreak
  dod\f la dod

  %22
  re4 r8
  si sol si
  do!4 r8

  %25
  sold' sold mi\p
  la\upl si(do)
  sold\f sold mi\p

  %28
  la\upl si(do))
  sold4.\f
  la32 sold la si do8\upl\noBeam r16 do

  %31
  re8 mi mi,\mbreak
  la la16. si32 do16. re32
  mi8\p mi, sold

  %34
  la la,16. si32 do16. re32
  mi8\f mi, sold
  la r16 la32 si do16. la32

  %37
  re16. mi32 fa8 re
  mi8. r32 mi fad16. sold32
  la16. do,32 re8 mi

  %40
  la,4 r8\mbreak
  la\p la la
  la do la

  %43
  mi' mi mi
  mi sold mi
  la la la

  %46
  la la la
  sold sold sold
  sold? sold sold

  %49
  la la fa
  sol! sol mi
  fa fa re

  %52
  mi mi, r
  R4.*8\mbreak
  r8 r la'\pp

  %62
  sol(fad mi)
  red4\f mi8\p
  si' si, la'

  %65
  sol mi16. fad32 sol16. la32
  si8 si16. la32 sol16. mi32
  red8 red mi

  %68
  si' si, red'
  mi mi, red'
  mi mi, red'\mbreak

  %71
  mi mi, sol
  la4 r8
  re re, fad

  %74
  sol4 r8
  do4 r8
  fad,4 r8

  %77
  si si, red'
  mi mi,16.\upl\mf red32 mi16.\upl fad32
  sol8\upl mi16. red32 mi16. fad32

  %80
  sol8\tr la\upl r16 fad\p\mbreak
  mi8 si' si,
  mi4 r8

  %83
  R4.
  r8 r r16 red
  mi8 si' si,

  %86
  mi,\f mi mi
  mi sol mi
  si' si si

  %89
  si red si
  mi mi mi
  mi mi mi

  %92
  red red red\mbreak % fine pagina OK
  red red red
  mi\upl do\upl r

  %95
  re! si r
  do la la
  si si16. la32 sol16. fad32

  %98
  mi8\p mi mi\mbreak
  mi sol mi
  si' si si

  %101
  si red si
  mi\f mi sold
  la4 r8

  %104
  fad re fad
  sol4 r8
  red red si\p

  %107
  mi\upl fad(sol)
  red\f red si\p
  mi\upl fad(sol)

  %110
  red4.\f\mbreak
  mi32 red mi fad sol8\upl\noBeam r16 sol
  la8 si si,

  %113
  mi4 r8
  mi\p mi mi
  mi sol mi

  %116
  si' si si
  si red si
  mi,\upl mi'(re!)

  %119
  do\upl do(si)
  lad lad lad
  si si, r\mbreak

  %122
  R4.*9 %%%%%%%%%% OOOOOOOOOKKKKKKKKK
  re'8\pizz sib sol
  re' sib sol

  %133
  re' sib sol
  do la fa
  sib sol mi

  %136
  la fa re
  la' fa re
  r8 sol16.\arco sol,32 sol'16.[sol32]

  %139
  sol16. sol32 fa8 r16 fa
  sol8 la la,\mbreak
  re\f re fad

  %142
  sol4 r8
  mi do mi
  fa!4 r8

  %145
  mi mi do\p
  fa\upl sol(la)
  mi\f mi do\p

  %148
  fa\upl sol(la)
  mi4.\f
  fa8 la4

  %151
  sib16.\tr(la64 sib) do8[do,]
  fa\p fa fa\mbreak
  fa fa fa

  %154
  mi mi mi
  mi mi mi
  R4.*7

  %163
  r8 la,16.\p sold32 la16. si32
  dod4.\mf(
  re4\p\upl) r8

  %166
  dod dod dod
  re re re
  si4\mf si8

  %169
  do4 r8
  si_\upl si16 si si si\mbreak
  do4 la8

  %172
  si4 sold8
  la4 la8
  si4 sold8

  %175
  la\f la la
  la do la
  mi' mi mi

  %178
  mi sold mi
  la la la
  la la la

  %181
  sold sold sold
  sold sold sold\mbreak
  la\upl fa\upl r

  %184
  sol! mi r
  fa re re
  mi mi16. re32 do16. si32

  %187
  la4 r8
  R4.*7
  r8 r re'\pp

  %196
  do si la
  sold4\f la8\p
  mi' mi, re'

  %199
  do la16. si32 do16. re32\mbreak
  mi8 mi16. re32 do16. la32
  sold8 sold la

  %202
  mi' mi, sold
  la la, sold'
  la la, do

  %205
  re4 sol8
  do,4 fa8
  si,4 mi8

  %208
  la,4 r8
  R4.
  r8 r r16 si'\mf\mbreak

  %211
  la8 mi' mi,
  la4 r8
  sold\p sold mi

  %214
  la\upl si(do)
  sold sold mi
  la\upl si(do)

  %217
  re si r
  do la r
  si sold r

  %220
  la la,16.\mf sold32 la16. si32
  do8 la16._\upl sold32 la16._\upl si32\mbreak
  do8\tr re_\upl r16 si\p

  %223
  la8 mi' mi,
  la la'16.\pp sold32 la16. si32
  do8 la16. sold32 la16. si32

  %226
  do8\tr re\upl r16 sold,
  la8 mi' mi,
  la\f la, dod

  %229
  re4 r8
  si sol si
  do!4 r8\mbreak

  %232
  sold' sold mi\p
  la\upl si(do)
  sold\f sold mi\p

  %235
  la\upl si(do))
  sold4.\f
  la32 sold la si do8\upl\noBeam r16 do

  %238
  re8 mi mi,\mbreak
  la la16. si32 do16. re32
  mi8\p mi, sold

  %241
  la la,16. si32 do16. re32
  mi8\f mi, sold
  la r16 la32 si do16. la32

  %244
  re16. mi32 fa8 re
  mi8. r32 mi fad16. sold32
  la16. do,32 re8 mi

  %247
  la,4\fermata r8

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4.
  s
  <_+>
  s
  s
  s
  <6>
  s4 <6 5>8
  s <6 5> s
  s <6 5> s
  s <6 5> s
  <4> <_+> s
  s4.
  s
  <_+>
  s
  s
  s
  <7>
  <6 4>8 <5 _+> <2>
  <6>4.
  s
  <6>
  s
  <6>8 s <7>
  s <6\\> <6>
  <6> s <7>
  s <6\\> <6>
  <6 5>4.
  s
  s8 <6 4> <5 _+>
  s4.
  <_+>4 <6 5>8
  s4.
  <_+>
  s
  s4 <6 5>8
  <_+>4 <7>8
  s8 s8 <_+>
  s4.*3
  <_+>4.
  s4.*3
  <6>4.
  s4 <6 5>8
  s4 <6>8
  s4 <6>8
  s4 <6>8
  <4> <_+> s
  s4.*8
  s4 <4\+ 2>8
  <6> <6\\> s
  <6 5>4.
  <6 4>8 <5\\ _+> <2>
  <6>4.
  <_+>4 <6>8
  <6 5>4.
  <6 4>8 <5\\ _+> <6>
  s s <6>
  s s <6>
  s4.*2
  <_+>4.
  s
  s
  s
  <_+>4.
  s
  <6>
  s4 s16 <6\\>
  s8 <4> <_+>
  s4.*2
  s4 s16 <6 5>
  s8 <6 4> <5 _+>
  s4.
  s
  <_+>
  s
  s
  s
  <6>
  s8 s <6 5>
  s <6 5> s
  <_+> <6 5\\> s
  s <6 5> s
  <4> <_+> s
  s4.*2
  <_+>4.
  s
  s4 <6 5>8
  s4.
  <6>
  s
  <6>8 s <7>
  s <6\\> <6>
  <6> s <7>
  s <6\\> <6>
  <6 5>4.
  s
  s8 <6 4> <5 _+>
  s4.*3
  <_+>4.
  <_+>
  s
  s
  <7>
  <6 4>8 <5 _+> s
  s4.*9
  <_+>8 <6> s
  <_+> <6> s
  <_+> <6> s
  s <6> s
  s <6> s
  <_+> <6> s
  <_+> <6> s
  s <_-> s
  <4\+ 2> <6> s
  <_-> <6 4> <5 _+>
  <_+> s <6 5>
  <_->4.
  <6>4 <6 5->8
  s4.
  <6>8 s <7->
  s <6 _-> <6>
  <6> s <7->
  s <6 _-> <6>
  <6 5->4.
  s8 <6>4
  s4.*3
  <6>4.
  s4.*8
  s8 <_+>s
  <6 5>4.
  s
  <6 5>
  s
  <6 5>
  s
  <6 5>
  s4 <6>8
  s4 <6>8
  s4 <6>8
  s4 <6>8
  s4.
  s
  <_+>
  s
  s
  s
  <6>
  s4 <6 5>8
  s <6 5> s
  s <6 5> s
  s <6 5> s
  <4> <_+> s
  s4.*8
  s4 <4\+ 2>8
  <6> <6\\> s
  <6 5>4.
  <6 4>8 <5 _+> <2>
  <6>4.
  <_+>4 <6>8
  <6 5>4.
  <6 4>8 <5 _+> s
  s4 <6>8
  s4 <6>8
  s4 <7>8
  <7>4 <7>8
  <7>4 <7 _+>8
  s4.*2
  s4 s16 <6>
  s8 <4> <_+>
  s4.
  <6>4 <7>8
  s <6\\> <6>
  <6> s <7>
  s <6\\> <6>
  s <6 5> s
  s <6 5> s
  s <6 5> s
  s4.
  <6>
  s4 s16 <6\\>
  s8 <4> <_+>
  s4.
  <6>
  s4 s16 <6 5>
  s8 <6 4> <5 _+>
  <_+>4.
  s
  <6>
  s
  <6>4 <7>8
  s <6\\> <6>
  <6> s <7>
  <6\\>8 s <6>
  <6 5>4.
  s
  s8 <6 4> <5 _+>
  s4.
  <_+>4 <6 5>8
  s4.
  <_+>
  s
  s4 <6 5>8
  <_+>4 <7>8
  s4 <_+>8

}

forma = {

  \key la\minor
  \time 3/8
  \tempo 4 = 65
  s4.*247
  \bar "|."

}

IIIfl = {
  %\notypeset
  <<\IIIfln \forma>>
}


IIIvlI = {
  <<\IIIvlIn \forma>>
}


IIIvlII = {
  <<\IIIvlIIn \forma>>
}


IIIvla = {
  \clef alto
  <<\IIIvlan \forma>>

}

IIIvc = {
  \clef bass
  <<\IIIvcn \forma>>

}


IIIbc = {
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset
}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper {

  systems-per-page = #3
  print-first-page-number = ##t
  first-page-number = #2

}

global = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletNumber.transparent = ##t
  \override TupletBracket.bracket-visibility = ##f
  \senza

}

\markup \huge {[1.] Allegro di molto, mà con Spirito}

\score {

  \new ChoirStaff <<

    \new Staff <<
      \set Staff.instrumentName = \markup \center-column{"Flauto"\vspace #-0.2"Traversiero"}
      \set Staff.midiInstrument = #"flute"
      \Ifl\global
    >>

    \new PianoStaff <<

      \new Staff <<
        \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
        \set Staff.midiInstrument = #"violin"
        \IvlI\global
      >>

      \new Staff <<
        \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
        \set Staff.midiInstrument = #"violin"
        \IvlII\global
      >>
    >>

    \new Staff <<
      \set Staff.instrumentName = \markup \center-column{"Viola"}
      \set Staff.midiInstrument = #"viola"
      \Ivla \global
    >>

    \new Staff <<
      \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Ripieno"}
      \set Staff.midiInstrument = #"contrabass"
      \Ivc \global
    >>

    \new Staff <<
      \set Staff.instrumentName = \markup \center-column{"Basso"}
      \set Staff.midiInstrument = #"harpsichord"
      \Ibc \global
    >>
  >>

  \layout {

    indent = 1.6\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
      \override StaffGrouper.staffgroup-staff-spacing.padding = #2
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
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

\pageBreak

\markup \huge {[2.] Andantino}

\score {

  \new ChoirStaff <<

    \new Staff <<
      \set Staff.midiInstrument = #"flute"
      \IIfl\global
    >>

    \new PianoStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIvlI\global
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIvlII\global
      >>
    >>

    \new Staff <<
      \set Staff.midiInstrument = #"viola"
      \IIvla \global
    >>

    \new Staff <<
      \set Staff.midiInstrument = #"contrabass"
      \IIvc \global
    >>

    \new Staff <<
      \set Staff.midiInstrument = #"harpsichord"
      \IIbc \global
    >>
  >>

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
      \override StaffGrouper.staffgroup-staff-spacing.padding = #1
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
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

\pageBreak

\markup \huge {[3.] Più tosto Moderato, mà Gustoso}

\score {

  \new ChoirStaff <<

    \new Staff <<
      \set Staff.midiInstrument = #"flute"
      \IIIfl\global
    >>

    \new PianoStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIIvlI\global
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIIvlII\global
      >>
    >>

    \new Staff <<
      \set Staff.midiInstrument = #"viola"
      \IIIvla \global
    >>

    \new Staff <<
      \set Staff.midiInstrument = #"contrabass"
      \IIIvc \global
    >>

    \new Staff <<
      \set Staff.midiInstrument = #"harpsichord"
      \IIIbc \global
    >>
  >>

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
      \override StaffGrouper.staffgroup-staff-spacing.padding = #1
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
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