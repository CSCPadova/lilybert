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

Iobn = \relative do'' {

  do1~
  do2~do4~do16 si32 la sol fa mi re
  do4 r r2

  %4
  sol''1~
  sol2~sol4~sol16 fad32mi re do si la
  sol4 r do2

  %7
  sib1
  sol'2 la16 sol fa?8 r4\mbreak
  re2 do~

  %10
  do la'
  si16 la sol8 r4 \tuplet 3/2 {
    sol16(mi sol) sol[(mi sol)] sol(mi sol) sol[(mi sol)]
    fa re fa fa[re fa] fa re fa fa[re fa] mi do mi mi[do mi] mi do mi mi[do mi]
  }

  %13
  re4 r fa16 sol la re, si do re si
  fa sol la  fa re mi fa re sol,4 r\mbreak
  mib''2\p~mib8[re16\f do re8 si]

  %16
  do4 r mib2\p~
  mib8[re16\f do re8 si] do4 r  %fine ripresa?
  do2\solo~do4~do32 mi sol mi do[mi sol mi]

  %19
  do4\tr r re2~
  re4~re32 fa la fa re[fa la fa] re4 r\mbreak
  mi4~\tuplet 3/2 { mi16 sol fa mi[re do] } re4~\tuplet 3/2 { re16 re do si[la sol] }

  %22
  mi'4~\tuplet 3/2 { mi16 sol fa mi[re do] } re2\tr~
  re\fermata \tuplet 3/2 {
    do16 sol mi' mi[fa sol] do, sol mi' mi[fa sol]
    sib, la sib sib[la sib] sib la sib sib[la sib] la fa la do[la do]
  } fa8 r  %%inizio p. 4

  %25 OK
  \tuplet 3/2 {
    re16 la fad' fad[sol la] re, la fad' fad[sol la] do, si do do[si do] do si do do[si do]
    si sol si re[si re] sol re sol re[si re]
  } sol,4 r8 re'\mbreak
  sol16(fa?) sol(fa) mi(re) do(si) la(sold) la(sold)la(si) do(la)

  %28
  la'[(sol?) la(sol) fad(mi) re(do)] si (lad) si(lad) si(do) re(si)
  si'(la) si(la) sold(fa!) mi(re) do(si) do(si) do(re) mi(do)\mbreak
  la'(fad) \appoggiatura mi8 re4 do8 si sol sol sol

  %31
  sol\tr[fad16 sol la8 la] la8[sol16 la si8 si]
  si[la16 si do8 do] do\tr si r sol'
  sol2\tr~sol16[fad32 mi re16 do] si8(la\tr)

  %34
  <<
    {
      \stemDown sol'1\f~\mbreak
      sol2~sol4~sol16[fad32 mi re do si la]
    }\\\shiftOn \stemUp sol4
  >>
  sol4 r do2

  %37
  sib1
  sol'2 la16 sol fa8 r4
  re2 do~

  %40
  do la'
  si16 la sol8 r4 fad16 sol la fad do re mi do\mbreak
  la si do la fad sol la fad re4 sib''\p~

  %43
  sib8[la16\f sol la8 fad] sol4 sib\p~
  sib8[la16\f sol la8 fad] sol4 r8 re\solo
  fad,16 la8. sol16 si?8. la16 do8. si16 re8.

  %46
  do16 fad8. la16 do,8.\p si16 la sol8 r re'\mbreak
  \tuplet 3/2 { re16 si re re[si re] re si re re[si re] } do4 r8 la'
  \tuplet 3/2 { do,16 la do do[la do] do la do do[la do] } si4 r8 sold'?

  %49
  \tuplet 3/2 { re16 si re re[si re] si sold si mi[re mi] } do4 r8 mi\mbreak
  mi8. fa?32 mi la8 fa re8. mi32 re sol8 re^ms
  do8. re32 do fa8 do^ms si8. do32 si mi8 si

  %52
  do4 r32 la si do re mi fad sold la4 r32 la, si do re mi fad sold
  la8 mi mi8. re32 mi\mbreak fa16 fa32 mi re16 do si re32 do si16 la
  sold si32 la sold16 fad mi re' do si do la' fa? re si4\tr

  %55
  \tuplet 3/2 {
    la16\tu do mi mi[(do mi)] mi(do mi) mi[(do mi)] fa re fa fa[re fa] fa re fa fa[re fa]\mbreak
    fa re fa fa[re fa] fa re fa fa[re fa] mi do mi mi[do mi] mi do mi mi[do mi]
  }
  do2~do~

  %58
  do~do4~do16 si32 la sol fa mi re
  do4 r sol''2~\mbreak
  sol1~

  %61
  sol4~sol16 fad32 mi re do si la sol4 r
  do2\solo sib~
  \tuplet 3/2 { sib16 do re mi[fa sol] } sol8 sib,! \tuplet 3/2 { sib16 do re mi[fa sol] } sol8 sib,\mbreak

  %64
  la8 fa r4 re'2
  do~\tuplet 3/2 { do16 re mi fad[sol la] } la8 do,
  \tuplet 3/2 {  do16 re mi fad[sol la] } la8 do, si sol r4

  %67
  do16 mi sol8~sol16 fa(mi) re32(do) sib4 do32 re mi fa sol16[sib,]\mbreak
  la fa fa8\tr do'16 la la8\tr re16 fad la8~la16 sol(fad) mi32(re)
  do4 re32 mi fad sol la16[do,] si? sol sol8  re'16 si si8\tr

  %70
  mi16 do sol' mi \tuplet 3/2 { la sol fa mi[re do] } re si fa' re \tuplet 3/2 { sol fa mi re[do si] }\mbreak
  do la mi' do \tuplet 3/2 { fa mi re do[si la] } si sol re' si \tuplet 3/2 { la' sol fa fa[mi re] }
  mi8 do r4 mib16(re) re(do) do(sib) sib(lab)

  %73
  lab?(do) do(fa) fa(lab) lab(do,) re(do) do(sib?) sib(lab) lab(sol)\mbreak
  sol(sib) sib(mib) mib(sol) sol(do,) do(sib) sib(lab) lab(sol) sol(fad)
  fad?(mib') mib(re) re(do) do(si?) si la? sol8 r re'

  %76
  \tuplet 3/2 { mi16 do mi sol[mi sol] do sol fa mi[re do]  } sol8 do16. re32 \parenthesize re4\tr
  do1~
  do2~do4~do16 si32 la sol fa mi re

  %79
  do4 r r2
  sol''1~
  sol2~sol4~sol16 fad32mi re do si la

  %82
  sol4 r do2
  sib1
  sol'2 la16 sol fa?8 r4\mbreak

  %85
  re2 do~
  do la'
  si16 la sol8 r4 \tuplet 3/2 {
    sol16(mi sol) sol[(mi sol)] sol(mi sol) sol[(mi sol)]

    %88
    fa re fa fa[re fa] fa re fa fa[re fa] mi do mi mi[do mi] mi do mi mi[do mi]
  }
  re4 r fa16 sol la re, si do re si
  fa sol la  fa re mi fa re sol,4 r\mbreak

  %91
  mib''2\p~mib8[re16\f do re8 si]
  do4 r mib2\p~
  mib8[re16\f do re8 si] do4\fermata r

}

IvlIn =  \relative do'' {

  do1~
  do2~do4~do16 si32 la sol fa mi re
  do4 r r2

  %4
  sol''1~
  sol2~sol4~sol16 fad32mi re do si la
  sol4 r do2

  %7
  sib1
  sol'2 la16 sol fa?8 r4\mbreak
  re2 do~

  %10
  do la'
  si16 la sol8 r4 \tuplet 3/2 {
    sol16(mi sol) sol[(mi sol)] sol(mi sol) sol[(mi sol)]
    fa re fa fa[re fa] fa re fa fa[re fa] mi do mi mi[do mi] mi do mi mi[do mi]
  }

  %13
  re4 r fa16 sol la re, si do re si
  fa sol la  fa re mi fa re sol,4 r\mbreak
  mib''2\p~mib8[re16\f do re8 si]

  %16
  do4 r mib2\p~
  mib8[re16\f do re8 si] do4 r  %fine ripresa?
  r8 mi,\p mi mi mi sol sol sol

  %19
  sol mi' mi mi r si si si
  si re re re re fa fa fa\mbreak
  r sol, sol sol r si si si

  %22
  r sol sol sol r si, si si
  si2\fermata mi'~
  mi\mbreak fa

  %25
  fad1
  sol2 re16 mi fa? re si do re si\mbreak
  r8 do do do r do do do

  %28
  r re re re r re re re
  r mi mi mi r mi mi mi\mbreak
  R1*4

  %34
  sol1\f~\mbreak
  sol2~sol4~sol16[fad32 mi re do si la]
  sol4 r do2

  %37
  sib1
  sol'2 la16 sol fa8 r4
  re2 do~

  %40
  do la'
  si16 la sol8 r4 fad16 sol la fad do re mi do\mbreak
  la si do la fad sol la fad re4 sib''\p~

  %43
  sib8[la16\f sol la8 fad] sol4 sib\p~
  sib8[la16\f sol la8 fad] sol4 r
  R1

  %46
  r2 \tuplet 3/2 { re16\p si re re[si re] re si re re[si re] }\mbreak
  re4 r \tuplet 3/2 { do16 la do do[la do] do la do do[la do]}
  re4 r \tuplet 3/2 { re16 si re re[si re] re si re re[si re] }

  %49
  re4 r \tuplet 3/2 { do16 la do do[la do] do la do do[la do]}\mbreak
  la'2 sol?
  fa mi

  %52
  r8 la,\p la la la do do do
  do mi mi mi\mbreak r2
  R1

  %55
  \tuplet 3/2 {
    la,16 do mi mi[(do mi)] mi(do mi) mi[(do mi)] fa re fa fa[re fa] fa re fa fa[re fa]\mbreak
    fa re fa fa[re fa] fa re fa fa[re fa] mi do mi mi[do mi] mi do mi mi[do mi]
  }
  do2~do~

  %58
  do~do4~do16 si32 la sol fa mi re
  do4 r sol''2~\mbreak
  sol1~

  %61
  sol4~sol16 fad32 mi re do si la sol4 r
  r8 mi'\p mi, fa? sol mi' sol, la
  sib mi mi, fa sol mi' mi,[sol]\mbreak

  %64
  la4 r r8 fad' fad, sol
  la fad' la, si do fad fad, sol
  la fad' fad, la si4 r

  %67
  do16 sol' sib8 r4 sol2\mbreak
  fa?4 r  fad16 la do8 r4
  la2 sol4 r

  %70
  R1*2
  mi16 fa? sol mi do re mi do r2
  R1*4

  %77
  do1~
  do2~do4~do16 si32 la sol fa mi re
  do4 r r2

  %80
  sol''1~
  sol2~sol4~sol16 fad32mi re do si la
  sol4 r do2

  %83
  sib1
  sol'2 la16 sol fa?8 r4\mbreak
  re2 do~

  %86
  do la'
  si16 la sol8 r4 \tuplet 3/2 {
    sol16(mi sol) sol[(mi sol)] sol(mi sol) sol[(mi sol)]
    fa re fa fa[re fa] fa re fa fa[re fa] mi do mi mi[do mi] mi do mi mi[do mi]
  }

  %89
  re4 r fa16 sol la re, si do re si
  fa sol la  fa re mi fa re sol,4 r\mbreak
  mib''2\p~mib8[re16\f do re8 si]

  %92
  do4 r mib2\p~
  mib8[re16\f do re8 si] do4\fermata r

}

IvlIIn = \relative do'' {

  do1~
  do2~do4~do16 si32 la sol fa mi re
  do4 r r2

  %4
  sol''1~
  sol2~sol4~sol16 fad32 mi re do si la
  sol4 r  sol2~

  %7
  sol1
  mi'2 fa8 do r4\mbreak
  la1~

  %10
  la2 fad'
  sol8 re r4  \tuplet 3/2 {mi16 (do mi) mi[(do mi)] mi (do mi) mi[(do mi)]
  re si re re[si re] re si re re[si re] do sol do do[sol do] do sol do do[sol do]}

  %13
  si4 r re16 mi fa si, sol la si sol
  re mi fa re si do re si sol4 r\mbreak
  do'2\p~do8 mib\f si re

  %16
  do4 r do2\p~
  do8 mib\f si re do4 r   %%5ripresa
  r8do,\p do do do mi mi mi

  %19
  mi sol sol sol r sol sol sol
  sol si si si si  re re re\mbreak
  r mi, mi mi r re re re

  %22
  r mi mi mi r re re re
  re2\fermata do'~
  do1

  %25
  re~
  re2 si16 do re si sol la si sol\mbreak
  r8 sol sol sol r la la la

  %28
  r la la la r si si si
  r si si si r do do do\mbreak
  R1*4

  %34
  sol'1\f~\mbreak
  sol2~sol4~sol16[fad32 mi re do si la]
  sol4 r sol2~

  %37
  sol1
  mi'2 fa8 do r4
  la1~

  %40
  la2 fad'
  sol8 re r4 re16 mi fad re la si do la\mbreak
  fad sol la fad re mi fad re re4 sol'\p~

  %43
  sol8 sib\f fad la sol4 sol\p~
  sol8 sib\f fad la sol4 r
  R1

  %46
  r2 \tuplet 3/2 { si,16\p sol si si[sol si] si sol si si[sol si]\mbreak }
  si4 r \tuplet 3/2 { la16 mi la la[mi la] la mi la la[mi la] }
  la4 r \tuplet 3/2 { si16 sold si si[sold si] si sold si si[sold si] }

  %49
  si4 r \tuplet 3/2 { la16 mi la la[mi la] la mi la la[mi la]\mbreak }
  R1*2
  r8 mi\p mi mi mi la la la

  %53
  la do do do\mbreak r2
  R1
  \tuplet 3/2 { do16\f (la do) do[(la do)] do la do do[la do] re la re re[la re] re la re re[la re]\mbreak

  %56
  re si re re[si re] re si re re [si re] do sol do do[sol do] do sol do do[sol do]}
  do2~do~

  %58
  do~do4~do16 si32 la sol fa mi re
  do4 r sol''2~\mbreak
  sol1~

  %61
  sol4~sol16 fad32 mi re do si la sol4 r
  r8 do\p do, re mi do' mi, fa
  sol do do,[re] mi do' do,[mi]\mbreak

  %64
  fa4 r r8 re' re, mi
  fad re' fad, sol la re re, mi
  fad re' re,[fad] sol4 r

  %67
  do16 mi sol8 r4 mi2\mbreak
  do4 r re16 fad la8 r4
  fad2 re4 r

  %70
  R1*2
  do16 re mi do mi, fa sol mi r2
  R1*4

  %77
  do'1~
  do2~do4~do16 si32 la sol fa mi re
  do4 r r2

  %80
  sol''1~
  sol2~sol4~sol16 fad32 mi re do si la
  sol4 r  sol2~

  %83
  sol1
  mi'2 fa8 do r4\mbreak
  la1~

  %86
  la2 fad'
  sol8 re r4  \tuplet 3/2 {mi16 (do mi) mi[(do mi)] mi (do mi) mi[(do mi)]
  re si re re[si re] re si re re[si re] do sol do do[sol do] do sol do do[sol do]}

  %89
  si4 r re16 mi fa si, sol la si sol
  re mi fa re si do re si sol4 r\mbreak
  do'2\p~do8 mib\f si re

  %92
  do4 r do2\p~
  do8 mib\f si re do4\fermata r

}

Ivlan =  \relative do' {

  r8 do' do, do' si la la, la'
  sol fa fa, fa' mi re re, re'
  do4 r r2

  %4
  r8 sol' mi, sol' fad mi mi, mi'
  re do do, do' si la' la, la'
  sol4 r mi2~

  %7
  mi1
  do2 do8 la r4\mbreak
  fad'1~

  %10
  fad2 re
  re8 si r4 sol'2
  si sol

  %13
  sol4 r si,8 r si r
  si r si r sol4 r\mbreak
  r8 la'\p la la sol sol\f sol sol

  %16
  mi!4 r r8 la\p la la
  sol sol\f sol sol mi?4 r %%% ripresa
  r8 do\p do do do do do do

  %19
  do do do do r sol' sol sol
  sol sol sol sol sol sol sol sol\mbreak
  r do, do do r sol sol sol

  %22
  r do do do r sol sol sol
  sol2\fermata sol'~
  sol la~

  %25
  la1
  si2 sol8 r re r\mbreak

  %27
  r mi mi mi r fa fa fa
  r fad fad fad r sol sol sol
  r sold sold sold r la la la\mbreak

  %30
  R1*4
  r8 sol\f sol, sol' fad mi mi, mi'\mbreak
  re do do, do' si la' la, la'

  %36
  sol4 r mi2~
  mi1
  do2 do8 la r4

  %39
  fad'1~
  fad2 re
  re8 si r4 fad'8 r fad r\mbreak

  %42
  fad? r fad r re4 r8 mi\p
  re re\f re re re4 r8 mi\p
  re re\f re re re4 r

  %45
  R1
  r2 sol8\p sol sol sol\mbreak
  sold4 r la,8 la la la

  %48
  re4 r sold8 sold sold[sold]
  sold?4 r mi8 mi mi[mi]\mbreak
  R1*2

  %52
  r8 la,\p la la la la la la
  la la la la\mbreak r2
  R1

  %55
  la'\f\mbreak
  si2 sol
  r8 do do, do' si la la, la'

  %58
  sol fa fa, fa' mi re re, re'
  do4 r r8 sol' sol, sol'\mbreak
  fad mi mi, mi' re do do, do'

  %61
  si la' la, la' sol4 r
  R1*5
  sol8 sol r4 sol4. mi8\mbreak

  %68
  la4 r la8 la r4
  la4. fad8 si4 r
  R1*7

  %77
  r8 do do, do' si la la, la'
  sol fa fa, fa' mi re re, re'
  do4 r r2

  %80
  r8 sol' mi, sol' fad mi mi, mi'
  re do do, do' si la' la, la'
  sol4 r mi2~

  %83
  mi1
  do2 do8 la r4\mbreak
  fad'1~

  %86
  fad2 re
  re8 si r4 sol'2
  si sol

  %89
  sol4 r si,8 r si r
  si r si r sol4 r\mbreak
  r8 la'\p la la sol sol\f sol sol

  %92
  mi!4 r r8 la\p la la
  sol sol\f sol sol mi?4\fermata r

}

Ibcn = \relative do {

  r8 do' do, do' si la la, la'
  sol fa fa, fa' mi re re, re'
  do4 r r2

  %4
  \clef tenor r8 sol'' mi, sol' fad mi mi, mi'
  re do do, do' si la la, la'
  sol4 r \clef bass r8 do do, re

  %7
  mi do' mi, fa sol do sol la
  sib sib, sib do la4 r\mbreak
  r8 re' re, mi fad re' fad, sol

  %10
  la re la si do do, do re
  si4 r sol2~
  sol1

  %13
  sol4 r sol8 r sol r
  sol r sol r sol4 r\mbreak
  r8 fad'\p fad fad sol sol,\f sol sol

  %16
  do4 r r8 fad\p fad fad
  sol sol,\f sol sol do4 r %% ripresa
  R1*5

  %23
  r2 do8 do do do
  do do do[do]\mbreak fa, fa fa fa
  re' re re re re re re re

  %26
  sol, sol sol[sol] sol r sol r\mbreak
  R1*3
  re'16 mi fad re fad sol la fad sol4 r8 sol

  %31
  re4. re8 re4. re8
  re4 r8 re re sol fad mi
  re do si la sol do re re,

  %34
  sol \clef tenor sol'' sol, sol' fad mi mi, mi'\mbreak
  re do do, do' si la la, la'
  sol4 r \clef bass r8 do do, re

  %38
  mi do' mi, fa sol do sol la
  sib sib, sib do la4 r
  r8 re' re, mi fad re' fad, sol

  %41
  la re la si do do, do re
  si4 r re8 r re r\mbreak
  re r re r re4 r8 dod'\p

  %44
  re re,\f re re sol,4 r8 dod'\p
  re re,\f re re sol,4 r
  re' mi fad sol

  %47
  la fad sol8 sol, r4\mbreak
  mi8 mi mi mi la4 r
  re,8 re re re mi4 r

  %50
  mi8 mi mi mi la4 r\mbreak
  do8 do re re si si do do
  la la si si sold sold la la

  %53
  R1
  r2\mbreak re'8 r si r
  sold r mi r do re mi mi,

  %56
  la2 re\mbreak
  sol, do
  r8 do' do, do' si la la, la'

  %59
  sol fa fa, fa' mi re re, re'
  do4 r \clef tenor r8 sol'' sol, sol'\mbreak
  fad mi mi, mi' re do do, do'

  %62
  si la la, la' sol4 \clef bass r
  R1*2
  fa16 sol la fa fa, sol la fa r2

  %66
  R1
  r2 sol'16 la si sol sol, la si sol
  do4 r do2\mbreak

  %69
  fa,8 fa fa fa re'4 r
  re2 sol,8 sol sol sol
  do4 r si r\mbreak

  %72
  la4 r sol r
  do8 r do r do2
  fa sib,\mbreak

  %75
  mib~mib
  re sol,8 la si sol
  do4 r do,8 mi'16 fa sol8 sol,

  %78
  do do' do, do' si la la, la'
  sol fa fa, fa' mi re re, re'
  do4 r r2

  %81
  \clef tenor r8 sol'' mi, sol' fad mi mi, mi'
  re do do, do' si la la, la'
  sol4 r \clef bass r8 do do, re

  %84
  mi do' mi, fa sol do sol la
  sib sib, sib do la4 r\mbreak
  r8 re' re, mi fad re' fad, sol

  %87
  la re la si do do, do re
  si4 r sol2~sol1
  sol4 r sol8 r sol r

  %90
  sol r sol r sol4 r\mbreak
  r8 fad'\p fad fad sol sol,\f sol sol
  do4 r r8 fad\p fad fad

  %93
  sol sol,\f sol sol do4\fermata r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 4/4
  \tempo 2 = 47
  s1*93
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

IIobn = \relative do'' {

  sol'4 r8 sol fad4 r8 fad
  mi4 r8 mi red4 r
  sol,4\p r8 sol fad4 r8 fad

  %4
  mi4 r8 mi red4 r
  sol'2\f lad4 si~
  si lad la2

  %7
  sol4 r8 sol fad4 r8 fad
  mi4 r8 sol,\p fad4 r8 fad\mbreak
  sol4 r8 mi'\solo sol8. fad32 mi si'8 si,

  %10
  do\tr si r mi la [\appoggiatura sol fad \appoggiatura mi red mi16 fad]
  sol fad mi8 r si' do,16 do si do la'4
  \appoggiatura sol8 \tuplet 3/2 { fad16  mi re do[si la] } la'(fad re do) si si la si sol'4\mbreak

  %13
  \appoggiatura fad8 \tuplet 3/2 { mi16 re do si[la sol] } sol' mi do si la la si la fad' fad sol fad
  sol sol fad sol re re do si do32[si do fad] fad mi fad la la[sol la fad] fad mi fad re
  do si do fad fad[mi fad la] la sol fad mi re[do si la]\mbreak si16 re sol la la4\tr

  %16
  sol r8 re re4~re32 mi fa mi re[si do re]
  mi,4~\tuplet 3/2 { mi16 mi fad! sold[sold la] si si do re [re mi] } fa4~
  fa16 re do si mi re do si do32 si la8. sol'?32 fa mi8.\mbreak

  %19
  fa32 mi re8. fa32 mi re8. fa,8(si re) fa
  mi16 re do8 r do sib fa' \appoggiatura do  sib la16 sold
  la8 mi' \appoggiatura re do sib16 la sib8 fa' sib, la16 sold\mbreak

  %22
  la32 si? do re mi fa sol la si, do re mi fad sold la si do,16 mi la la, si4\tr
  la r r2
  r4 r8 mi'16 fad sol8 fad16 mi si'8 mi,

  %25
  mi\tr red r fad16 sol la8[\appoggiatura sol fad \appoggiatura mi red mi16 fad]\mbreak
  sol fad mi8 r si' \tuplet 3/2 { si16 la si sol[fad sol] mi re? mi do[si do] }
  la4\tr r8 la' \tuplet 3/2 { la16 sol la fad[mi fad] re do re si[la si] }

  %28
  sol4\tr r8 sol' \tuplet 3/2 { sol16 fad sol mi[re mi] do si do la[sol fad] }\mbreak
  si4 r8 fad' \appoggiatura mi red4 mi8 fad
  la(red,) mi(si) do8. re?64 mi fad sol la8 fad

  %31
  sol16 fad mi8 r si \tuplet 3/2 { sol'16 la si sol[fad mi] } mi8 mi
  \tuplet 3/2 { sol16 la si sol[fad mi] } mi8 mi \appoggiatura re do16 mi la mi \appoggiatura {mi16[fad]} fad4\tr
  mi1\fermopz

}

IIvlIn =  \relative do'' {

  sol'4 r8 sol fad4 r8 fad
  mi4 r8 mi red4 r
  sol,4\p r8 sol fad4 r8 fad

  %4
  mi4 r8 mi red4 r
  sol'2\f lad4 si~
  si lad la2

  %7
  sol4 r8 sol fad4 r8 fad
  mi4 r8 sol,\p fad4 r8 fad\mbreak
  sol4 r r8 sol\p si mi

  %10
  r2 r8 red fad la
  R1
  fad4 r sol r\mbreak

  %13
  mi r fad r
  re r do r
  do r\mbreak si r

  %16
  r2 r8 re re re
  re re re re re re re re
  re re re re do4 r\mbreak

  %19
  R1*4
  r8 do16[re mi8 do] si[la16 si do8 la]
  sol4 r r2

  %25
  R1*2
  r8 la16[si do8 la] r2
  r8 sol16[la si8 sol] r2\mbreak

  %29
  r8 fad16[sol la8 fad] r2
  R1
  r8 sol16[la si8 sol] r2

  %32
  r la8[sol16. la32 si8 si,]
  mi1\fermata

}

IIvlIIn = \relative do'' {

  mi4 r8 mi red4 r8 re
  dod4 r8 do si4 r
  mi,4\p r8 mi red4 r8 re

  %4
  dod4 r8 do si4 fad''\f~
  fad mi~mi re?
  dod2 red

  %7
  mi4 r8 mi mi4 r8 red
  mi4 r8 mi,\p mi4 r8 red\mbreak
  mi4 r r8 mi\p sol si

  %10
  r2 r8 la red fad
  R1
  re?4 r si r\mbreak

  %13
  do r la r
  si r la r
  la r\mbreak sol r

  %16
  r2 r8 si si si
  si si si si si si si si
  si si si si la4 r\mbreak

  %19
  R1*4
  r8 la16[si do8 la] sol?[fad16 sol la8 fad]
  sol4 r r2

  %25
  R1*2
  r8 fad16[sol la8 fad] r2
  r8 mi16[fad sol8 mi] r2\mbreak

  %29
  r8 red16[mi fad8 red] r2
  R1
  r8 mi16[fad sol8 mi] r2

  %32
  r la8[sol16. la32 si8 si,]
  mi1\fermata

}

IIvlan =  \relative do' {

  si'4 r8 s8 si4 r8 si
  mi,4 r8 la fad4 r
  si,4\p r8 si si4 r8 si

  %4
  mi,4 r8 la fad4 r
  si'4. sol8 dod[lad] fad4
  sol fad fad4. red8

  %7
  si4 r8 si' si4 r8 si
  sol4 r8 si,\p si4 r8 si\mbreak
  si4 r r2

  %10
  R1*2
  fad'4 r re r\mbreak
  mi r do r

  %14
  re r fad r
  fad r\mbreak re r
  r2 r8 sold sold sold

  %17
  sold? sold sold sold sold sold sold sold
  sold? sold sold sold mi4 r\mbreak
  R1*4

  %23
  r8 mi mi mi sol? red red red
  si4 r r2
  R1*7

  %32
  r2 la'8[sol16. la32 si8 si,]
  mi,1\fermata

}

IIbcn = \relative do {

  mi4 r8 mi si'4 r8 sold
  la4 r8 la, si4 r
  mi,\p r8 mi si'4 r8 sold

  %4
  la4 r8 la si4 r
  mi2\f fad4 si,
  mi fad si,2

  %7
  mi,4 r8 mi' si'4 r8 si,
  mi4 r8 mi,\p si'4 r8 si\mbreak
  mi8[mi16 fad sol8 mi] r2

  %10
  r8 mi16[fad sol8 mi] r2
  r8 mi16[fad sol8 mi] la la fad fad
  re4 r sol8 sol mi mi\mbreak

  %13
  do4 r fad8 fad re re
  si4 r la r
  re r\mbreak sol,8 si16. do32 re8 re,

  %16
  sol[sol'16 la si8 sol] r sold, sold sold
  sold? sold sold sold sold sold sold sold
  sold? sold sold sold la4 dod\mbreak

  %19
  re8  mi fa? re sol,?4 si
  do8 re mi do re2
  do re\mbreak

  %22
  la8 la sold sold la la mi'[mi,]
  la la la la mi' si si si
  mi,[mi'16 fad sol8 mi] r mi16[fad sol8 mi]

  %25
  si'[si,16 dod red8 si] r si16[dod red8 si]\mbreak
  r mi16[fad sol8 mi] sol mi do la
  fad4 r8 la' fad re si sol

  %28
  mi4 r8 sol' mi do la fad\mbreak
  red4 r8 si'' la fad sol red
  mi si do sold la  la' red, si

  %31
  mi4 r8 mi mi mi mi mi
  mi mi mi mi la[sol16. la32 si8 si,]
  mi,1\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key mi\minor
  \time 4/4
  \tempo 4 = 50
  s1*33
  \bar"|."

}

IIob = {
  \IIglobal
  \notypeset
  <<\IIobn \forma>>

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


IIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIIobn = \relative do'' {

  do4 si
  r8 sol[fa mi]
  la4 sol

  %4
  r8 mi[re do]
  fa4 mi
  r8 do[si la]

  %7
  re4 do
  si8 re'4 re8~
  re fa4 fa8~

  %10
  fa re4 mi16 fa
  mi8[do si\tr la16 sol]
  do8 sol' fa4\tr

  %13
  mi8[do si\tr la16 sol]\mbreak
  do8 sol fa4\tr
  mi8[do' si\tr la16 sol]

  %16
  la8[re do\tr si16 la]
  si8[mi re\tr do16 si]
  do4 fad,

  %19
  sol2
  do16 re mi fa? sol8 sib,
  la[si? do] r

  %22
  r8 fa[mi16 re do si]
  do re mi fa sol8 sib,
  la[si? do] r

  %25
  r mi, [re\tr do16 si]\mbreak
  do8[mi re\tr do16 si]
  do4 r %%%%%%%% ripresa

  %28
  do'8\solo[sol' mi\tr re16 do]
  re8[fa re\tr do16 si]
  fa'8[la fa\tr mi16 re]

  %31
  mi8 do si\tr la16 sol
  la8\tr sol16 fa sol8\tr fa16 mi
  fa8\tr mi16 re mi8\tr re16 do

  %34
  sol'4 r8 si
  do16 mi sol4 sib,8
  la\tr sol16 fa la8\tr sol16 fa\mbreak

  %37
  re' fad la4 do,8
  si?\tr la16 sol si8\tr la16 sol
  mi' mi re do re re do si

  %40
  do do si la si si la sol
  la8\tr sol16 fad do'8\tr si16 la
  fad'8\tr mi16 re la'8 do,

  %43
  si16 do re do si8 r
  do16 mi re4 do8
  si16 fa' mi4 re8\mbreak

  %46
  mi4 fad
  sol8[fad16 mi re do si la]
  si mi re mi la,4\tr

  %49
  sol4 fad'
  r8 re[do si]
  mi4 re

  %52
  r8 si[la sol]
  do4 si
  la8 la'4 la8~

  %55
  la do4 do8~
  do la4 si16 do\mbreak
  si8[sol, fad\tr mi16 re]

  %58
  sol8 re' do4\tr
  si8[sol fad\tr mi16 re]
  sol8 si' la4\tr

  %61
  sol16 la si do re8 fa,!
  mi[fad sol] r
  r la[si16 la sol fad]

  %64
  sol la si do re8 fa,!
  mi[fad sol] r\mbreak
  r8 do[si16 la sol fad]

  %67
  sol, si re si sol si re sol,
  fad la re la fad la re la
  sol si re si sol si re sol,

  %70
  fad8 re r4
  la'16 do mi do la do mi la,
  sold si mi si sold si mi si

  %73
  la do mi do la do mi la,
  sold8 mi r4\mbreak
  mi'16 la mi do mi la mi do

  %76
  fa la fa re fa la fa re
  re sol re si re sol re si
  mi sol mi do  mi sol mi do

  %79
  do fa do la do fa do la
  re fa re si re fa re si
  si mi si sold si mi si sold

  %82
  do8 la r4
  la~la16 mi' do la\mbreak
  si4~si16 fa' re si

  %85
  do4~do16 mi do la
  fa'2~
  fa8 sold la4

  %88
  sib,2~
  sib8 dod re4
  sold,8 fa' mi16 re do si

  %91
  do8 la' si,4\tr
  do8 la r4
  r8 la'[fa\tr mi16 re]\mbreak

  %94
  si'2~
  si8[sol mi\tr re16 do]
  la'2~

  %97
  la8[fa re\tr do16 si]
  sold'2
  la8[fa mi16 re do si]

  %100
  la4 r8 sol?\solo
  do16 mi re fa mi8 do
  do\tr[si do\tr si]\mbreak

  %103
  re16 fa mi sol fa8 re
  re\tr[do re\tr do]
  do16 mi re mi do re si do

  %106
  la la' sol la fa sol mi fa
  re mi do re si do la si
  sol4 r

  %109
  sol'2
  sib,4. do32 re mi fa\mbreak
  sol16 fa  mi re do8 sib\tr

  %112
  la16 sol fa8 r4
  la'2
  do,4. re32 mi fad sol

  %115
  la16 sol fad mi re8 do\tr
  si16 la sol8 r4
  sol8\solo si4 do8~

  %118
  do mib4 sol,8
  lab fad'4 sol8~\mbreak
  sol sib,4 reb8~

  %121
  reb mi,!4 fa8~
  fa lab4 do8~
  do fa4 re?8~

  %124
  re16 do re mib fa8 re
  mib16 re do8 r do
  reb16 do reb lab' lab sol lab do,

  %127
  si!8 do r do\mbreak
  reb16 do reb reb reb do reb reb
  fa sol lab4.

  %130
  si,16 do re? do re si la? sol
  mib' re do8 r sol'
  si,16 do re mi? si do re mi

  %133
  fa2\tr~
  fa~
  fa

  %136
  do32 re  mi fa sol16[do,] re4\tr
  do si
  r8 sol[fa mi]

  %139
  la4 sol
  r8 mi[re do]
  fa4 mi

  %142
  r8 do[si la]
  re4 do
  si8 re'4 re8~

  %145
  re fa4 fa8~
  fa re4 mi16 fa
  mi8[do si\tr la16 sol]

  %148
  do8 sol' fa4\tr
  mi8[do si\tr la16 sol]\mbreak
  do8 sol fa4\tr

  %151
  mi8[do' si\tr la16 sol]
  la8[re do\tr si16 la]
  si8[mi re\tr do16 si]

  %154
  do4 fad,
  sol2
  do16 re mi fa? sol8 sib,

  %157
  la[si? do] r
  r8 fa[mi16 re do si]
  do re mi fa sol8 sib,

  %160
  la[si? do] r
  r mi, [re\tr do16 si]\mbreak
  do8[mi re\tr do16 si]

  %163
  do4\fermata r

}

IIIvlIn =  \relative do'' {

  do4 si
  r8 sol[fa mi]
  la4 sol

  %4
  r8 mi[re do]
  fa4 mi
  r8 do[si la]

  %7
  re4 do
  si8 re'4 re8~
  re fa4 fa8~

  %10
  fa re4 mi16 fa
  mi8[do si\tr la16 sol]
  do8 sol' fa4\tr

  %13
  mi8[do si\tr la16 sol]\mbreak
  do8 sol fa4\tr
  mi8[do' si\tr la16 sol]

  %16
  la8[re do\tr si16 la]
  si8[mi re\tr do16 si]
  do4 fad,

  %19
  sol2
  do16 re mi fa? sol8 sib,
  la[si? do] r

  %22
  r8 fa[mi16 re do si]
  do re mi fa sol8 sib,
  la[si? do] r

  %25
  r mi, [re\tr do16 si]\mbreak
  do8[mi re\tr do16 si]
  do4 r %%%%%%%% ripresa

  %28
  R2*21
  sol'4 fad'
  r8 re[do si]
  mi4 re

  %52
  r8 si[la sol]
  do4 si
  la8 la'4 la8~

  %55
  la do4 do8~
  do la4 si16 do\mbreak
  si8[sol, fad\tr mi16 re]

  %58
  sol8 re' do4\tr
  si8[sol fad\tr mi16 re]
  sol8 si' la4\tr

  %61
  sol16 la si do re8 fa,!
  mi[fad sol] r
  r la[si16 la sol fad]

  %64
  sol la si do re8 fa,!
  mi[fad sol] r\mbreak
  r8 do[si16 la sol fad]

  %67
  sol\p re si re sol re si sol'
  la fad re fad la fad re fad
  sol re si re sol re si sol'

  %70
  la4 r
  la16 mi do mi la mi do la'
  si sold mi sold si sold mi sold

  %73
  la mi do mi la  mi do la'
  si4 r\mbreak
  mi,16 do la8 mi'16 do la8

  %76
  fa'2
  re16 si sol8 re'16 si sol8
  mi'2

  %79
  do16 la fa8 do'16 la fa8
  re'2
  si16 sold mi8 si'16 sold mi8

  %82
  do'16 mi la mi do mi la mi
  do4 r\mbreak
  R2*8

  %92
  do8 la r4
  r8 la'[fa\tr mi16 re]\mbreak
  si'2~

  %95
  si8[sol mi\tr re16 do]
  la'2~
  la8[fa re\tr do16 si]

  %98
  sold'2
  la8[fa mi16 re do si]
  la4 r

  %101
  R2*7
  si16\p re  sol re si re sol re
  mi8 mi mi4

  %110
  r8 mi mi4\mbreak
  r8 mi mi4
  fa16 la do la fa la do la

  %113
  r8 fad fad4
  r8 fad? fad4
  r8 fad? fad4

  %116
  sol16 si re si sol si re si
  R2*20
  do,4 si

  %138
  r8 sol[fa mi]
  la4 sol
  r8 mi[re do]

  %141
  fa4 mi
  r8 do[si la]
  re4 do

  %144
  si8 re'4 re8~
  re fa4 fa8~
  fa re4 mi16 fa

  %147
  mi8[do si\tr la16 sol]
  do8 sol' fa4\tr
  mi8[do si\tr la16 sol]\mbreak

  %150
  do8 sol fa4\tr
  mi8[do' si\tr la16 sol]
  la8[re do\tr si16 la]

  %153
  si8[mi re\tr do16 si]
  do4 fad,
  sol2

  %156
  do16 re mi fa? sol8 sib,
  la[si? do] r
  r8 fa[mi16 re do si]

  %159
  do re mi fa sol8 sib,
  la[si? do] r
  r mi, [re\tr do16 si]\mbreak

  %162
  do8[mi re\tr do16 si]
  do4\fermata r

}

IIIvlIIn = \relative do'' {

  R2*2
  do4 si
  r8 sol[fa mi]

  %5
  la4 sol
  r8 mi[re do]
  fa4 mi

  %8
  re8 si'4 si8~
  si re4 re8~
  re si4 do16 re

  %11
  do8[do si\tr la16 sol]
  do8 mi re4\tr
  do8[do si\tr la16 sol]\mbreak

  %14
  do8 mi, re4\tr
  do8[do' si\tr la16 sol]
  la8[re do\tr si16 la]

  %17
  si8[mi re\tr do16 si]
  do4 fad,
  sol2
  mi'8[sol, do sol]

  %21
  fa r sol' r
  r la[sol16 fa mi re]
  sol8[sol, do sol]

  %24
  fa r fa' r
  r sol,[fa\tr mi16 re]\mbreak
  mi8[sol fa\tr mi16 re]

  %27
  mi4 r %%%% ripresa
  R2*23
  sol'4 fad

  %52
  r8 re[do si]
  mi4 re
  fad,8 fad'4 fad8~

  %55
  fad la4 la8~
  la fad4 sol16 la\mbreak
  sol8[sol, fad\tr mi16 re]

  %58
  sol8 si la4\tr
  sol8[sol fad\tr mi16 re]
  sol8 sol' fad4\tr

  %61
  sol8[re sol re]
  do r do' r
  r mi,[re16 do si la]

  %64
  si8[re sol re]
  do r do' r\mbreak
  r8 mi,[re16 do si la]

  %67
  si16\p si sol si re si sol re'
  fad re la re fad re la re
  re si sol si re si sol re'

  %70
  fad4 r
  mi16 do la do mi do la do
  sold' mi si mi sold mi \parenthesize si mi

  %73
  mi do la do mi do la mi'
  sold4 r\mbreak
  do,16 la mi8 do'16 la mi8

  %76
  la'2
  si,16 sol mi8 si'16 sol mi8
  sol'2

  %78
  la,16 fa do8 la'16 fa do8
  fa'2
  sold,16 mi si8 sold'16 mi si8

  %82
  la'16 do mi do la do mi do
  la4 r\mbreak
  R2*8

  %92
  do8[mi do\tr si16 la]
  fa'2~\mbreak
  fa8[re si\tr la16 sol]

  %95
  mi'2~
  mi8[do la\tr sol16 fa]
  re'2~

  %98
  re8[si sold\tr fad16 mi]
  do'8[re do16 si la sold]
  la4 r

  %101
  R2*7
  sol16\p si re si sol si re si
  do8 do do4

  %110
  r8 do do4\mbreak
  r8 do do4
  do16 fa la fa do fa la fa

  %113
  r8 la, re4
  r8 re re4
  r8 re re4

  %116
  re16 sol si sol re sol si sol
  R2*22
  do,4 si

  %140
  r8 sol[fa mi]
  la4 sol
  r8 mi[re do]

  %143
  fa4 mi
  re8 si'4 si8~
  si re4 re8~

  %146
  re si4 do16 re
  do8[do si\tr la16 sol]
  do8 mi re4\tr

  %149
  do8[do si\tr la16 sol]\mbreak
  do8 mi, re4\tr
  do8[do' si\tr la16 sol]

  %152
  la8[re do\tr si16 la]
  si8[mi re\tr do16 si]
  do4 fad,

  %155
  sol2
  mi'8[sol, do sol]
  fa r sol' r
  r la[sol16 fa mi re]

  %159
  sol8[sol, do sol]
  fa r fa' r
  r sol,[fa\tr mi16 re]\mbreak

  %162
  mi8[sol fa\tr mi16 re]
  mi4\fermata r

}

IIIvlan =  \relative do' {

  mi4 re
  R2
  mi4 re

  %4
  R2
  do4 do
  R2

  %7
  si4 sol
  sol8[re' do si]
  r re[do si]

  %10
  r re[do si]
  sol[do' si\tr la16 sol]
  do8 do, sol'4

  %13
  do,8[do' si\tr la16 sol]\mbreak
  do8 do, sol4\tr
  do8[do' si\tr la16 sol]

  %16
  la8[re do\tr si16 la]
  si8[mi re\tr do16 si]
  do4 fad,

  %19
  sol2
  sol4. mi8
  do r la r

  %22
  r la' [re, sol]
  sol4. mi8
  do r la r

  %25
  r sol [sol sol]\mbreak
  sol[sol sol sol]
  sol4 r % ripresa

  %28
  R2*21
  si'4 la
  R2

  %51
  si4 la
  R2
  sol4 sol

  %54
  r8 la[sol fad]
  r la[sol fad]
  r la[sol fad]\mbreak

  %57
  re[sol fad\tr mi16 re]
  sol8 sol, re'4\tr
  sol,8[sol' fad\tr mi16 re]

  %60
  sol8 sol, re'4
  re8 re'4 si8
  sol r mi r

  %63
  r mi'[la, re]
  re4. si8
  sol r mi r\mbreak

  %66
  r mi'[la, re,]
  re2\p~
  re~

  %69
  re
  re4 r
  mi2~

  %72
  mi~
  mi
  mi4 r\mbreak

  %75
  R2*7
  mi4 mi
  mi r\mbreak

  %84
  R2*8
  do8 la r la'
  la fa r re\mbreak

  %94
  re si r sol'
  sol mi r do
  do la r fa'

  %97
  fa re r si
  si sold r mi'
  mi[fa si, mi]

  %100
  do4 r
  R2*7
  sol'4\p sol8 sol

  %109
  sol sol sol4
  r8 sol sol4\mbreak
  r8 sol sol4

  %112
  la la
  r8 la la4
  r8 la  la4

  %115
  r8 la la4
  si si
  R2*20

  %137
  mi,4 re
  R2
  mi4 re

  %140
  R2
  do4 do
  R2

  %143
  si4 sol
  sol8[re' do si]
  r re[do si]

  %146
  r re[do si]
  sol[do' si\tr la16 sol]
  do8 do, sol'4

  %149
  do,8[do' si\tr la16 sol]\mbreak
  do8 do, sol4\tr
  do8[do' si\tr la16 sol]

  %152
  la8[re do\tr si16 la]
  si8[mi re\tr do16 si]
  do4 fad,

  %155
  sol2
  sol4. mi8
  do r la r

  %158
  r la' [re, sol]
  sol4. mi8
  do r la r

  %161
  r sol [sol sol]\mbreak
  sol[sol sol sol]
  sol4\fermata r

}

IIIbcn = \relative do {

  do4 sol
  R2
  do4 sol

  %4
  R2
  fa'4 do
  R2

  %7
  sol'4 do,
  sol8 [si la sol]
  sol'[si, la sol]

  %10
  sol'[si, la sol]
  do[do' si\tr la16 sol]
  do4 r

  %13
  r8 do[si\tr la16 sol]\mbreak
  do4 r
  r8 do[si\tr la16 sol]

  %16
  la8[re do\tr si16 la]
  si8[mi re\tr do16 si]
  do4 fad,

  %19
  sol2
  do,8 [re mi do]
  fa[sol la16 sol fa mi]

  %22
  re8[mi16 fa sol8 sol,]
  do8 [re mi do]
  fa[sol la16 sol fa mi]

  %25
  re8[mi16 fa sol8 sol,]\mbreak
  do[do sol' sol,]
  do4 r

  %28
  do2
  sol
  si

  %31
  do4 sol'8 r
  fa r mi r
  re r do r

  %34
  sol[la si sol]
  do4 do,
  fa fa\mbreak

  %37
  re' re,
  sol sol
  do' r

  %40
  la r
  fad r
  re r

  %43
  sol,8 r sol r
  do2
  sol\mbreak

  %46
  do
  si4 r
  sol8[do re re,]

  %49
  sol4 re'
  R2
  sol4 re

  %52
  R2
  do4 sol
  re'8[fad mi re]

  %55
  re'[fad, mi re]
  re'[fad, mi re]\mbreak
  sol,[sol' fad\tr mi16 re]

  %58
  sol4 r
  r8 sol[fad\tr mi16 re]
  sol4 r

  %61
  sol8[la si sol]
  do[re mi16 re do si]
  la8[si16 do re8 re,]

  %64
  sol8[la si sol]
  do[re mi16 re do si]\mbreak
  la8[si16 do re8 re,]

  %67
  sol4\p sol
  fad fad
  sol sol

  %70
  re16 fad? la fad re fad la re,
  la4 la'
  sold sold

  %73
  la la
  mi16 sold si sold mi sold si mi,\mbreak
  \parenthesize la,4 do

  %76
  re re
  si si
  do do

  %79
  la la
  si si
  sold sold

  %82
  la la
  la8 la la4\mbreak
  r8 sold sold4

  %85
  r8 la la4
  r8 re[re re]
  re4 r

  %88
  r8 re[re re]
  re4 r
  mi8 r mi r

  %91
  do[la mi' mi,]
  do' la r la'
  re re, r re'\mbreak

  %94
  sol, sol, r sol'
  do do, r do'
  fa, fa, r fa'

  %97
  si si, r si'
  mi, mi, r mi'
  la [re, mi mi,]

  %100
  la4 r
  do8[si do do,]
  do'[sol do sol]\mbreak

  %103
  si[do re si]
  sol[do, sol' do,]
  do''[si la sol]

  %106
  fa[mi re do]
  si[la sol fad]
  sol4 sol

  %109
  do8 do, do4
  r8 do do4\mbreak
  r8 do do4

  %112
  fa fa
  r8 re re4
  r8 re re4

  %115
  r8 re re4
  sol sol
  sol'8 r fa r

  %118
  mib r do r
  do r re r\mbreak
  sib r sol r

  %121
  sib? r do r
  lab r fa' r
  lab r lab r

  %124
  si,? r sol r
  do[re mib do]
  fa4 fa

  %127
  fa8[mib re do]\mbreak
  fa4 fa
  lab8[fa re si!]

  %130
  sol2
  do8[re mib do]
  sol r sol r

  %133
  sol[la si do]
  re[mi fa sol]
  la[si do re]

  %136
  mi[do fa, sol]
  do,4 sol
  R2

  %139
  do4 sol
  R2
  fa'4 do

  %142
  R2
  sol'4 do,
  sol8 [si la sol]

  %145
  sol'[si, la sol]
  sol'[si, la sol]
  do[do' si\tr la16 sol]

  %148
  do4 r
  r8 do[si\tr la16 sol]\mbreak
  do4 r

  %151
  r8 do[si\tr la16 sol]
  la8[re do\tr si16 la]
  si8[mi re\tr do16 si]

  %154
  do4 fad,
  sol2
  do,8 [re mi do]

  %157
  fa[sol la16 sol fa mi]
  re8[mi16 fa sol8 sol,]
  do8 [re mi do]

  %160
  fa[sol la16 sol fa mi]
  re8[mi16 fa sol8 sol,]\mbreak
  do[do sol' sol,]

  %163
  do4\fermata r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 2/4
  \tempo 2 = 60
  s2*163
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

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 15.7)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] [Allegro non molto]"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<


      \new Staff  = "main" <<
        \set Staff.midiInstrument = #"oboe"
        \set Staff.instrumentName = \markup \center-column{"Hautbois"}
        \Iob
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
        \IvlI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
        \IvlII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.instrumentName = \markup \center-column{"[Viola]"}
        \Ivla
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      }<<
        \set Staff.midiInstrument = #"cello"
        \set Staff.instrumentName = \markup \center-column{"[Basso]"}
        \Ibc

      >>
    >>

  }

  \layout {

    indent = 1.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

\pageBreak

\markup\huge "[2.] Larghetto"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<


      \new Staff  = "main" <<
        \set Staff.midiInstrument = #"oboe"
        \IIob
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIvlI
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IIvlII
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \IIvla
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      }<<
        \set Staff.midiInstrument = #"cello"
        \IIbc

      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

\pageBreak

\markup\huge "[3.] All[egr]o"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<


      \new Staff  = "main" <<
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

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol #'staff-space = #(magstep +1)
      }<<
        \set Staff.midiInstrument = #"cello"
        \IIIbc

      >>
    >>

  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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



