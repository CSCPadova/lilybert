\language "italiano"
	%********************************** VARIABILI


\version "2.18.0"

su = \change Staff = up

giu = \change Staff = down

ten = _\markup \italic "ten"

cres = _\markup \italic "cres"

dolce = _\markup \italic "Dolce"

arco = _\markup \italic "arco"

pizz = _\markup \italic "pizzic"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.8

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

ds = _\markup \italic \right-align {"Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

tr = \trill

tu = _\markup \italic {"tutti"}

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

   si4
   si dod8 red mi4 fad
   sol2 r4 sol~
   sol \slurDashed fad8 (mi) sol (fad) mi (red)\slurSolid

   %4
   mi[sol,16(la si la sol fad)] mi4 sol'~
   sol8 la, do mi fad2~
   fad8 sol, si red mi2~\mbreak

   %7
   mi8[la16(si do si la sol)] fad8[fad16(sol la sol fad mi)]
   red4 si re2~
   re8[mi16(fa mi re do si)] do2~

   %10
   do8[re16(mi re do si la)] si2~
   si8[do16(re do si la sol)] la8[si16(do si la sol fad)]
   sol8[la16(si la sol fad mi)] fad8[sol16(la sol fad mi red)]

   %13
   mi4 mi' \slurDashed sol8 (fad) mi (red)\slurSolid \mbreak
   mi4 la,~la8[sol16(la si la sol fad)]
   sol4. la8 fad4.^\markup {[\musicglyph #"scripts.trill"]} mi8

   %16
   mi2~mi8 fad sol\p la
   si4 mi red mi
   fad la,2 sol8 fad

   %19
   sol4 sol8 la si4 red
   mi r r8 mi16[(fad sol fad mi re)]\mbreak
   do8 (si la sol) \once\slurDashed si (la sol fad)

   %22
   mi4 r r2
   r8 do'16[(re mi re do si)] la4 r
   R1*2

   %26
   r8 mi'16[(fad sol fad mi red)] mi4 si
   do mi8 (re) re (do) si (la)\mbreak
   re4 mi8 re do si la sol

   %29
   la si16 do si8 la la4.^\markup {[\musicglyph #"scripts.trill"]} sol8
   sol2 r
   si'2._\markup {[\musicglyph #"f"]} mi,4

   %32
   la2~ la8[sol16 (la si la sol fad)]
   mi1~
   mi2~mi8[re16(do si la  sol fad)]\mbreak

   %35
   sol8_\markup {[\musicglyph #"p"]} (fad mi fad) sol4 la
   si2 r4 si
   si la8 sol si la sol fad

   %38
   sol8 [sol16 (la si la sol fad)] mi4 r
   R1
   r8 sol16[(la si la sol fad)] mi4 r

   %41
   r2 sol'~\mbreak
   sol8[fad16(sol la sol fad mi)] fad2~
   fad8[sol16(la sol fad mi re)] mi8[fad16(sol fad mi re dod)]

   %44
   re8[mi16(fad mi re dod si)] dod8[re16(mi re dod si lad)]
   si1~
   si4 lad8 si dod2~

   %47
   dod8[si16 lad si8 dod?] lad4.^\markup {[\musicglyph #"scripts.trill"]} si8
   si2 r4 re_\markup {[\musicglyph #"f"]}\mbreak
   re si8 dod re4 mi

   %50
   fad2 r4 fad~
   fad \slurDashed mi8 (re) fad (mi) re (dod)\slurSolid
   re4 r r8 re16[(mi fad mi re dod)]

   %53
   si8[sol'16(la si la sol fad)] mi8 la, la'4
   r8 fad16[(sol la sol fad mi)]re8 sol, sol'4
   r8 sol16[(la si la sol fad)] mi8[mi16(fad sol fad mi re)]\mbreak

   %56
   dod(si lad dod) dod [(si lad sold)] fad4 r
   fad'2~fad4 si,
   mi2~mi8 re16 (mi fad mi re dod)]

   %59
   si1~
   si2~si4 sol'
   fad \slurDashed mi8  (re) fad (mi) re (dod)\slurSolid\mbreak

   %62
   si[dod16(re mi re dod si)] lad8[si16(dod re dod si lad)]
   si4. dod?8 lad4.^\markup {[\musicglyph #"scripts.trill"]} si8
   si2 r8 re16\p[mi (fad mi re dod?)]

   %65
   si4 r r2
   r8 re16[(mi fad mi re dod)] re8 fa si, re
   mi4 si2 la8 sold\mbreak

   %68
   la4 r r2
   r8 re16[(mi fa mi re do?)] sib8 re fa, sib
   mi,1~

   %71
   mi4 r r2
   r r4 mi'^\markup {[\musicglyph #"f"]}
   mi fad8 sold la4 si

   %74
   do2 r4 do4~\mbreak
   do \slurDashed si8 (la) do (si) la (sold)\slurSolid
   la2 r8 do,16[(re  mi re do si)]

   %77
   la8 re fa la si2~
   si8 do, mi sold la2~
   la8[re,16(mi fa mi re do)] si8 [si16(do re do si la)]

   %80
   sold2 r
   r4 la\p re2~\mbreak
   re8[mi16(fad? sol fad mi re)] do2~

   %83
   do4 fad, fad'2~
   fad8[sol16 (la si la sol fad)] mi8[re16(do si la sol fad)]
   si2~si8[sol'16(la si la sol fad)]

   %86
   mi8[mi16(fad sol fad mi re)] do8[do16(re mi re do si)]
   la2 r8 la16[(si do si la sol)]\mbreak
   fad2 r

   %89
   R1
   r4 si re2~
   re8[mi16(fa mi re do si)] do2~

   %92
   do8[re16(mi re do si la)] si2~
   si8[do16(re do si la sol)] la8[si16(do si la sol fad)]\mbreak
   sol8[la16(si la sol fad mi)] fad8[sol16(la sol fad mi red)]

   %95
   mi4 mi'sol8(fad) mi (red)
   mi fad \once\slurDashed sol (fad) sol2
   r8 dod,16[(re mi re dod si)] la4 fad'~

   %98
   fad mi4. re16[(do si la sol fad)]
   mi4 r r2
   R1

   %101
   r8 si'16[(do re do si la)] sol4 r
   R1
   r8 sol'16[(la si la sol fad)] mi4. sol8

   %104
   si, mi sol,4 r2
   r r4 si
   si dod8 red mi4 fad

   %107
   sol2 r4 sol~
   sol \slurDashed fad8 (mi) sol (fad) mi (red)\slurSolid
   mi[sol,16(la si la sol fad)] mi4 sol'~

   %110
   sol8 la, do mi fad2~
   fad8 sol, si red mi2~\mbreak
   mi8[la16(si do si la sol)] fad8[fad16(sol la sol fad mi)]

   %113
   red4 si re2~
   re8[mi16(fa mi re do si)] do2~
   do8[re16(mi re do si la)] si2~

   %116
   si8[do16(re do si la sol)] la8[si16(do si la sol fad)]
   sol8[la16(si la sol fad mi)] fad8[sol16(la sol fad mi red)]
   mi4 mi' \slurDashed sol8 (fad) mi (red)\slurSolid \mbreak

   %119
   mi4 la,~la8[sol16(la si la sol fad)]
   sol4. la8 fad4.^\markup {[\musicglyph #"scripts.trill"]} mi8
   mi2.\fermata

}


Ivln = \relative do'' {

   sol4
   sol mi8 fad sol4 la
   si2 r4 si~
   si la8(sol) si(la) sol(fad)

   %4
   sol4 r r8 sol16[(la si la sol fad)]
   mi8[do'16(re mi re do si)] la8 re, re'4
   r8 si16[(do re do si la)] sol8 do, do'4

   %7
   r8 do16[(re mi re do si)] la8-.[la16(si do si la sol)]\mbreak
   fad8-.[red'16(mi fad mi red dod?)] si4 r
   si2~si4 mi,

   %10
   la2~la8[sol16 (la si la sol fad)]
   mi1~
   mi2. do'4

   %13
   si la8(sol) si(la) sol(fad)\mbreak
   mi[fad16(sol la sol fad mi)] red8[mi16 (fad sol fad  mi red)]
   mi4. fad8 red4.\tr mi8

   %16
   mi2~mi8 red mi\p fad %%%%%% fine ripresa
   sol4 si la sol
   red red2 mi8 red

   %19
   mi4 mi8 fad sol4 la
   si8 sol16 (la si la sol fad) mi2~\mbreak
   mi4 mi2 si4

   %22
   si r r2
   R1
   r8 si'16\p[(do re do si la)] sol4 r

   %25
   R1
   r8 sol16\p[(la si la sol fad)] si4 sol
   mi la2 sol8(fad)\mbreak

   %28
   sol8[mi16(fad sol fad mi re)] mi8[la16(si do si la sol)]
   fad4 sol8 la fad4.\tr sol8
   sol[la16\f(si do si la sol)] re'2~

   %31
   re8 mi16(fa  mi re do si)] do2~
   do8[re16(mi re do si la)] si2~
   si8[do16(re do si la sol)] la8[si16(do si la sol fad)]

   %34
   sol8[la16(si la sol fad mi)] fad8[sol16(la sol fad mi red)]\mbreak
   mi2\p si~
   si8[sol'16(la si la sol fad)] mi2~

   %37
   mi r
   R1
   r8 la16[(si do si la sol)] fad4 r

   %40
   R1
   fad'2~fad4 si,\mbreak
   mi2~mi8[re16(mi fad mi re dod)]

   %43
   si2. sol4
   fad2 sol4 sol'
   fad mi8 re dod4 re

   %46
   mi8[fad16(sol fad mi re dod)] fad8 mi re dod
   re4. mi8 dod4.\tr si8
   si2 r4 fad\f\mbreak

   %49
   fad sold8 lad si4 dod
   re2 r4 re~
   re \once\slurDashed dod8 (si) re(dod) si(lad)

   %52
   si [re,16(mi fad mi re dod)] si4  re'~
   re8 mi, sol si dod2~
   dod8 re, fad lad si2~

   %55
   si8[mi16(fad sol fad mi re)] dod8[dod16(re mi re dod si)]\mbreak
   lad4. fad8 la2~
   la8[si16(do si la sol fad)] sol2~

   %58
   sol8[la16(si la sol fad mi)] fad2~
   fad8[sol16(la sol fad mi re)] mi8[fad16(sol fad mi re dod)]
   re8[mi16(fad mi re dod si)] dod8[re16(mi re dod si lad)]

   %61
   si4 si' re8(dod) si(lad)\mbreak
   si4 mi,~mi8[\once\slurDashed re16 (mi fad mi re dod)]
   re4. mi8 dod4.\tr si8

   %64
   si[re16(mi fad mi re dod)] si4 r
   r2 r8 fad''16\p[(sol la sol fad mi)]
   fad8 la re, fad si,[re16(mi fa mi re do?)]

   %67
   si8 re sold, si mi,2~
   mi8 [do16(re mi re do si)] la4 r
   r2 r8 re'16[(mi fa mi re do)]

   %70
   si8 re sold, si mi,2~
   mi4 r r2
   r r4 do'\f

   %73
   do la8 si do4 re
   mi2 r4 mi~\mbreak
   mi re8(do) \slurDashed mi (re) do (si)\slurSolid

   %76
   do[do,16(re mi re do si)] la4 do'~
   do8[fa16(sol la sol fa mi)] re8 sol, sol'4
   r8 mi16(fa sol fa mi re) do8 fa, fa'4

   %79
   r8 fa,16[(sol la sol fa mi)] re8[re16(mi fa mi re do)]
   si4 mi^\markup {[\musicglyph #"p"]} si'2~
   si4 la8 sol la4 fad'!\mbreak

   %82
   sol si,~si8[do16(re mi re do si)]
   la2~la8(sol) sol(fad)
   sol4 red mi red'

   %85
   mi8[sol,16(la si la sol fad)]mi4 red
   mi2 r8 mi16[(fa sol fa  mi re?)]
   do2 r8 do16[(re mi re do si)]\mbreak

   %88
   la4 r r2
   R1
   r2 r4 mi'

   %91
   si'2. mi,4
   la2~la8[sol16(la si la sol fad)]
   mi1~\mbreak

   %94
   mi2. do'4
   si la8(sol) si(la) sol(fad)
   mi red' mi (red) mi2

   %97
   r4 dod, fad8[sol16(la si la sol fad)]
   sol4 r r2
   R1

   %100
   r8 do!16[(re mi re do si)] la4 r\mbreak
   R1*2
   r8 mi'16[(fad sol fad mi red)] mi8 sol si, mi

   %104
   sol, si mi,4 r2
   r r4 sol
   sol mi8 fad sol4 la

   %107
   si2 r4 si~
   si la8(sol) si(la) sol(fad)
   sol4 r r8 sol16[(la si la sol fad)]

   %110
   mi8[do'16(re mi re do si)] la8 re, re'4
   r8 si16[(do re do si la)] sol8 do, do'4
   r8 do16[(re mi re do si)] la8[la16(si do si la sol)]\mbreak

   %113
   fad8[red'16(mi fad mi red dod?)] si4 r
   si2~si4 mi,
   la2~la8[sol16 (la si la sol fad)]

   %116
   mi1~
   mi2. do'4
   si la8(sol) si(la) sol(fad)\mbreak

   %119
   mi[fad16(sol la sol fad mi)] red8[mi16 (fad sol fad  mi red)]
   mi4. fad8 red4.\tr mi8
   mi2.\fermata

}

Ivocen = \relative do'' {

    \autoBeamOff

    r4
    R1*15
    r2 r4 si %%fine ripresa
    si4. do16[la] si4. do16[la]

    %18
    si2~si4. do16[la]
    si4 dod8[red] mi4 fad
    sol2 r4 sol\mbreak

    %21
    sol \once\slurDashed fad8[(mi)] sol[(fad)] mi[(red)]
    mi4. re!16[do] si4. do16[re]
    do4.\tr si16[do]re8[do16 re] la8[si16 do]

    %24
    si4.\tr la16[si] do8[si16 do] sol8[la16 si]
    la4.\tr sol16[la] si8[la16 si] fad8[sol16 la]
    sol4 fad8 [(sol] mi4) si'

    %27
    do \once \slurDashed mi8[(re)] re[(do)] si[(la)]\mbreak
    re4 mi8[re] do[si] la[sol]
    do4 si8[la] la4.\tr  sol8

    %30
    sol2 r
    R1*3
    r2 r4 si\mbreak

    %35
    si4 dod8[red] mi4 fad
    sol2 r4 sol\mbreak
    sol fad8[mi] fad4 mi8[red]

    %38
    mi2 si4 si
    mi8[re! do si] la[si16 la si8 do]
    re[do si la] sol[la16 sol fad8 sol]

    %41
    la4 si sol8[si] mi[fad]\mbreak
    sol2 r4 fad
    re! dod8[si] mi4 dod

    %44
    lad si2 sol'4
    fad mi8[re] dod4 re
    mi fad8[sol] fad[mi] re[dod]

    %47
    re4. mi8 dod4.\tr (si8)
    si2 r\mbreak
    R1*15

    %64
    r2 r4 si
    mi8[fad16 sol] fad8[(mi)] re4 mi8([(dod)]
    re2 r4 si4

    %67
    sold mi' mi8[(re)] do[(si)]\mbreak
    do2 r4 la
    sib fa' re sib8[(la)]

    %70
    sold2 re'
    do4 si8[(la)] do[(si)] la[(sold)]
    la2 r

    %73
    R1*7
    r2 r4 mi'
    do re8[mi] re[do] do[si]\mbreak

    %82
    si2 r4 mi,
    la8[(si] do4. si8) si[la]
    sol2 r4 si

    %85
    si4 dod8[red] mi4 fad
    sol2 r4 sol
    fa do si8[la] sold[la]\mbreak

    %88
    red2 fad!4.(sol16[la)]
    sol4 mi sol8[fad] mi[red]
    mi2 r

    %91
    r4 mi do la
    re!4.\turn do8 si2
    r4 mi, la do\mbreak

    %94
    si4. sol'8 fad2
    r r4 si,
    si lad lad lad

    %97
    sol'2 do,!
    si4 mi sol8[fad] mi[red]
    mi4. re!16[do] si4. do16[re]

    %100
    do4.\tr si16[do] re8[do16 re] la8[si16 do]\mbreak
    si4.\tr la16[si] do8[si16 do] sol8[la16 si]
    la4.\tr sol16[la] si8 [la16 si] fad8[sol16 la]

    %103
    sol4 mi si'2~
    si4 mi mi8[(fad16 sol)] fad8[mi]
    mi2. r4

    %106
    R1*15
    r2 r4\fermata

}

Itesto = \lyricmode {

   Ge -- lo  - - - - - - bet sei der Herr,
   mein Gott, mein Trost, mein Le - - - - - - - - - - - - - - - - ben,
   des Va -- ters wer -- ter Geist,
   den mir der Sohn ge -- ge - ben,

   Ge -- lo -- bet sei der Herr,
   mein Gott, mein Trost, mein Le -- ben,
   gelo - - - - - bet sei der Herr,
   mein Gott, mein Trost, mein Le -- ben,
   des Vaters _ werter _ Geist,
   den mir der Sohn ge -- ge -- ben,

    der mir mein Herz er -- quickt,
    der mir gibt neu -- e Kraft,
    der mir in al -- ler Not
    Rat, Trost und Hül -- fe schafft;

    der mir mein Herz er -- quickt,
    mein Herz er -- quickt,
    der mir gibt neu -- e Kraft,
    der mir in al -- ler Not
    Rat, Trost und Hül -- fe schafft,

    der mir mein Herz er -- quickt,
    der mir gibt neu -- e Kraft,
    der mir in al -- ler Not
    Rat, Trost und Hül -- fe schafft - - - - - - - - - - - - - - - -,
    Rat, Trost und Hül -- fe schafft.

}

Ibcn = \relative do {

   mi,4
   mi'8 sol16(la si la sol fad) mi4 r
   r8 mi16(fad sol fad mi re) do8 do16(re mi re do si)

   %3
   la4 do si si'
   mi,2 r4 mi
   do la r8 re16(mi fad mi re do)

   %6
   si4 sol r8 do16(re mi re do si)
   la4 la'8 si do4 la
   si2 r8 si16(do re do si la)

   %9
   sold8-. si-. mi,-. sold-. la, la'16(si do si la sol?)
   fad8-. la-. re,-. fad-. sol,4 sol'
   do la fad la

   %12
   si  mi, la la,
   sol do\mbreak la si
   do fad, si si'

   %15
   mi la, si si,
   mi si mi, si'^\p  %% fine ripresa
   mi sol fad mi

   %18
   si'8 red,16(mi fad mi red dod) si4 r
   r8 sol'16(la si la sol fad) mi4 r
   r8 mi16(fad sol fad mi re)do8 do16(re mi re do si)\mbreak

   %21
   la4 do si si'
   mi,8 red mi fad sol si mi, sol
   la si la sol fad la re, fad

   %24
   sol la sol fad mi sol do, mi
   fad, fad'16 (sol la sol fad mi) red8 fad si, red
   mi4 si sol mi

   %27
   la8 la'16(si do si la sol) fad8 la re, fad\mbreak
   si,4 r r mi
   la, sol re' re,

   %30
   sol2 r8 si'16\f(do re do si la)
   sol8 si mi, sol la,la'16(si do si la sol)
   fad8 la re, fad sol,4 sol'

   %33
   do la fad la
   si mi, la la,^\p\mbreak  %%fine prima pagina
   sol la sol fad

   %36
   mi8 mi'16(fad sol fad mi re) do8 do16(re mi re do si)
   la4 do si si'
   mi,2 r8 mi16(fad sol fad mi re)

   %39
   do8 mi la, do re, re'16(mi fad mi re do)
   si8 re sol, si \once\stemUp do,8 fad'16(sol la sol fad mi)
   red8 fad si, red mi, mi'16 (fad sol fad mi re?)\mbreak

   %42
   dod8 mi la, dod re,4 re'
   sol mi dod mi
   fad si mi mi,

   %45
   re si' mi, fad
   sol dod, lad fad
   si mi fad fad,

   %48
   \once\stemUp si8 re'16\f(mi fad mi re dod) si4 r\mbreak
   r8 re,16(mi fad mi re dod) si4 r
   r8 si'16(dod re dod si la) sol8 sol16(la si la sol fad)

   %51
   mi4 sol fad fad,
   si dod re si
   sol mi r8 la16(si dod si la sol)

   %54
   fad4 re r8 sol16(la si la sol fad)
   mi4 mi'8 fad sol4 mi\mbreak
   fad2 r8 fad16(sol la sol fad mi)

   %57
   red8 fad si, red mi,8 mi'16(fad sol fad mi re?)
   dod8 mi la, dod re,4 re'
   sol mi dod mi

   %60
   fad si, mi mi,
   re sol mi fad\mbreak
   sol sol' dod, fad

   %63
   si, mi fad fad,
   si dod re si
   sol8 la16(si la sol fad mi) la4 la'

   %66
   re, la re, r
   r8 si''16(do re do si la) sold8 si mi, sold\mbreak
   sol,4 si do dod

   %69
   re re, re re
   re8 si'16(do re do si la) sold8 si mi, sold
   la4 fa re mi

   %72
   \once\stemUp la8 do'16\f(re mi re do si) la4  r
   r8 do,16(re mi re do si) la4 r
   r8 la'16(si do si la sol) fa8 fa16(sol la sol fa mi)\mbreak

   %75
   re4 fa mi mi,
   la2 r4 la'
   fa re r8 sol16(la si la sol fa)

   %78
   mi4 do r8 fa16(sol la sol fa mi)
   re4 re,8 mi fa4 re
   \once\stemUp mi8 si''16\p(do re do si la) sold8 si mi, sold

   %81
   la,8 la'16(si do si la sol) fad8 la re, fad\mbreak
   sol,8 sol'16(la si la sol fad) mi8 sol do, mi
   fad, fad'16(sol la sol fad mi) red8 fad si, red

   %84
   mi,4 fad sol la
   sol2 r4 si
   \once\slurDashed mi,8 sol'16(la si la sol fad) mi8 sol do, mi

   %87
   la,4 la la do~\mbreak
   do8 fad16(sol la sol fad mi) red8 fad si, red
   mi4 do' la si

   %90
   mi,2 r8 si'16(do re do si la)
   sold8 si mi, sold la, la'16(si do si la sol?)
   fad8 la re, fad sol,4 sol'

   %93
   do la fad si\mbreak
   mi, do la fad
   sol do la si\set Staff.ottavation = #"8va alta [autograph organ part]"

   %96
   dod,4 dod4 dod8 dod'16(re mi re dod si)
   lad8 dod fad, lad red,\unset Staff.ottavation mi'16(fad sol fad mi red)\break
   mi8 sol do,? mi la,4 si

   %99
   mi8 red mi fad sol si mi, sol
   la si la sol fad la re, fad\mbreak
   sol la sol fad mi sol do, mi

   %102
   fad, fad'16(sol  la sol fad mi) red8 fad si, red
   mi,4 r r8 mi'16(fad sol fad mi red)
   mi8 fad sol la si4 si,

   %105
   mi re8 do si la sol fad
   \once\stemUp mi sol'16(la si la sol fad) mi4 r
   r8 mi16(fad sol fad mi re) do8 do16(re mi re do si)

   %108
   la4 do si si'
   mi,2 r4 mi
   do la r8 re16(mi fad mi re do)

   %111
   si4 sol r8 do16(re mi re do si)
   la4 la'8 si do4 la
   si2 r8 si16(do re do si la)

   %114
   sold8-. si-. mi,-. sold-. la, la'16(si do si la sol?)
   fad8-. la-. re,-. fad-. sol,4 sol'
   do la fad la

   %117
   si  mi, la la,
   sol do\mbreak la si
   do fad, si si'

   %120
   mi la, si si,
   mi si mi,\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    \set figuredBassAlterationDirection = #RIGHT
    \set figuredBassPlusDirection = #RIGHT

    s4
    s <_+> s2
    s4 <6> <5> <5>
    <7> <6 4 3> <6 4> <5 _+>
    s1
    <6 5>4 <7> s2
    <6 5>4 <7> s2
    <7> <6 4 3>4 <6 5>
    <_+>2 s8 <_!> s4
    <6 5> <7 _+> <9>2
    <6 5>4 <7> <9> <8>
    <7> s <7> <6 5>
    <6 4> s <6 5> <4\+ 2>
    <6> s <7 5> <5 _+>
    <7> <7> <7 _+> s
    s <7 5> <_+> s
    s2 s4 <_+>
    s <6> <6\\> s
    <_+> <6\\ 4 3> <7 _+> s
    s8 <6> <_+>4 s2
    s2 <5 3>
    <7 5>4 <6 4 3> <6 4> <5 _+>
    s2 <6>
    s <6>
    s <6>
    <5> <6>
    s4 <_+> <6> s
    s2 <6>4 <7>
    <6> s s <5>
    <6>1
    s
    s4 <7> <9> <6>
    <6 5> <7> <9> <8>
    <7> <8> <7 5> <6 5>
    <6 4> s <6 5> <4\+ 2>
    <6> <2 4\+> <6> <6\\>
    s <6> s2
    <7 5>4 <6 4 3> <6 4> <5 _+>
    s1
    <6 5>4 <7> s2
    <6 5>4 <7> <7> <6 5>
    <6 5> <7 _+> <9> <6>
    <6 5> <7 _+> <9> <8>
    <7> <6\\ 5> <7> <6\\ 5>
    <7 _+> s <6\\ 5> <6\\ 4\+ 3>
    <6> s <6\\ 5> <6 4>
    <6> <6\\ 5!> <6> <7 _+>
    s <7 5> <_+> s
    s1
    s8 <6> <_+>4 s2
    s4 <6> <7 5>2
    <9 7>4 <6 4\+ 3> <6 4> <5 _+>
    s <6\\> <6> s
    <6 5> <7> s8 <_+> s4
    <6 5\\> <7/> s4 <6>
    \bassFigureExtendersOn <6\\ 5>4 <_>8 <_>16 s \bassFigureExtendersOff <6 4\+ 3>4 <6\\ 5>

    %56 OK fin qui
    <_+>2 s8 <_!> <6>8 s
    \bassFigureExtendersOn <6 5>4 <_>16 <_> <_> s \bassFigureExtendersOff  <9>4 <6>8 s
    \bassFigureExtendersOn <6 5>8 s <_>8 <_> \bassFigureExtendersOff <9>4 <8>
    <7> s \bassFigureExtendersOn <7 5>4 <_>16 <_> s8
    <6 4>4 <_>16 <_> s8  \bassFigureExtendersOff <6\\ 5>4 <4\+ 2>
    <6> s <6\\ 5> <_+>
    <7> <6> <6\\ 5!> <7 _+>
    s <7 5> <_+> s
    \bassFigureExtendersOn s <_>16 <_>s8  <6>4 s \bassFigureExtendersOff
    <6 5>2 <6 4>4 <5 _+>
    s1
    s8 <6\\ 5!> s4 <6> <7 _+>
    s <6\\> <6> <6>
    <6- _!>4 \bassFigureExtendersOn <_> <_> <_>16 s s8
    <4\+ 2>8 <_> <_> <_>16 <_> <6 5>2\bassFigureExtendersOff
    s <6 5 _!>4 <_+>
    s1
    s8 <6> <_+>4 s2
    s <7 5>
    <9 7>4 <6 4 3> <6 4> <5 _+>
    s1
    <6 5>4 <7 _!> s <6>8 s
    \bassFigureExtendersOn <6 5>4 <_>16 <_> s8 s2
    <7 5 _!>4 <_>8 <_>16 s <6 4 3>4 <7 5>\bassFigureExtendersOff
    <_+>2 <6>4 <7>
    <9> <6> <6> <7>
    s2 \bassFigureExtendersOn <6 5>4 <_>8 <_>16 s\bassFigureExtendersOff
    <5>2 <6 5>4 <7 _+>
    s <6\\> <6> <4\+ 2>
    <6>2 s4 <_+>
    s2 s4 <7 5>
    <6!>2 s4 <6>
     <6 4 2\\>2 <6 5>
     s2 <6 5>4 <_+>
     s2 s8 <5 3> s4
     <6 5>2 <9>4 <6>
     <6 5>2 <9>4 <8>8 <7>
     <7>4 s <7> <6 5>8 s
     \bassFigureExtendersOn <5 3>4 <_>16 <_> s8 \bassFigureExtendersOff <6 5>4 <6\\>
     <6> s <6 5>  <_+>
     <7> <6\\> <6\\>8 \bassFigureExtendersOn <_>8 <_> <_>16 <_>\bassFigureExtendersOff
     <7 5>2 <7! 5>4 \bassFigureExtendersOn <_>8 <_>16 <_>\bassFigureExtendersOff
     s2 <6 5>4 <5 _+>
     s2 <6>4 <7>
     s2 <6>4 <7>
     s2 <6>4 <7>
     <7> <4\+ 2> <6> <7>
     s2 s4 <6>
     s <6> <6 4> <5 _+>
     s2 \bassFigureExtendersOn <_>4 <_>8 <_>16 s\bassFigureExtendersOff
     s4 <_+> s2
     s4 <6> <5> <5>
    <7> <6 4 3> <6 4> <5 _+>
    s1
    <6 5>4 <7> s2
    <6 5>4 <7> s2
    <7> <6 4 3>4 <6 5>
    <_+>2 s8 <_!> s4
    <6 5> <7 _+> <9>2
    <6 5>4 <7> <9> <8>
    <7> s <7> <6 5>
    <6 4> s <6 5> <4\+ 2>
    <6> s <7 5> <5 _+>
    <7> <7> <7 _+> s
    s <7 5> <_+> s

}


forma = {

    \time 2/2
    \key sol\major
    \tempo 2 = 65
    \partial 4 s4
    s1*121
    \bar "|."

}

Ivl = {
    %\notypeset
    <<\Ivln \forma>>

}

Ifl = {
    <<\Ifln \forma>>

}

Ivoce = {
    \new Voice = "gelobet"
    <<\Ivocen \forma>>
}



Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}
#(set-global-staff-size 17)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \con \terzine

}

\paper {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

    \markup \huge {"Aria - Versus 3"}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Traversiere                "}
                \set Staff.midiInstrument = #"flute"
                \Ifl \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violino (solo)               "}
                \set Staff.midiInstrument = #"violin"
                \Ivl \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Soprano"}
                \incipit { \clef soprano \key sol\major\time 2/2 r4}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce \global
                \new Lyrics \lyricsto "gelobet" \Itesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup \center-column{"Continuo"\vspace #-0.3"Organo"\vspace #-0.3 \smaller"(transp.)"}
                \incipit { \clef bass \key fa\major\time 2/2 re,4}
                \clef bass
                \set Staff.midiInstrument = #"cello"
                \Ibc \global
            >>
        >>

        \layout {

            indent = 3\cm
            incipit-width = 1.2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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
