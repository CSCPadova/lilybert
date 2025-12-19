\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

dolce = _\markup \italic \center-align"doux"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

trio = ^\markup \italic { trio }

tu = ^\markup \italic "Tutti"

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

trio = _\markup \italic "trio"

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
    \override TupletBracket #'bracket-visibility = ##f
    \senza
}



IflIn = \relative do'' {

    re4. la8 fad'4. re8
    si'4~si16 la sol fad sol8. sol16 fad8. [mi16]
    fad4. re8 la'2~

    %4
    la4. re,8 sol2~
    sol8. sol16 fad8. [mi16] fad8. sol16 la8. [si16]\mbreak
    mi,4. fad16 sold la4. la,8

    %7
    re8. re16 si'8. [re,16] si'8. re,16 dod8. [si16]
    dod4~dod32 la si dod re mi fad sol la8. fad16 sol8. [mi16]
    fad4~fad32 si, dod re mi fad sold la si8. sold16 la8. [fad16]

    %10
    sold8. mi16 fad8. [red16] mi8. dod16 re8. [si16]
    dod4. re8 re4.-+ dod16 re\mbreak
    mi4. fad8 fad4.-+ mi16 fad

    %13
    sold8. fad32 mi la8. si,16 si4. la8
    la1 la8 la' mi mi mi mi
    mi la16 mi dod8 dod dod dod

    %16
    dod mi16 dod la8 la la la
    la si dod re mi fad16 sol\mbreak
    fad4 la, re

    %19
    fad re fad
    la fad la
    do8 re, re[mi] fad sol16 la

    %22
    sol8 [fad] sol fad16 mi fad8[sol16 fad]
    mi8 dod16 re mi8 dod re si
    dod8 dod16 mi la8 mi la[mi]

    %25
    la la,16 dod mi8 dod mi[dod]\mbreak
    mi la, la'[la,] la' dod,
    re la fad' sol16 mi fad8 sol16 mi

    %28
    fad8 la, do re16 si do8 re16 si
    do8 la fad' sol16 mi fad8 sol16 mi
    fad8 mi re[mi] fad sol16 la

    %31
    sol8 si16 la sol8 fad16 mi fad8 sol16 fad
    mi8 r la r dod, r
    mi r la, r dod r

    %34
    mi8 r r4 r
    R2.
    r8 fad\solo sol la si dod

    %37
    re mi16 dod re8 mi16 dod re8 dod16 si
    mi8 mi,\tu la dod, la' dod,
    la'16 sol fad mi red mi fad sol la sol la fad\mbreak

    %40
    sol8 si, sol' si, sol' si,
    sol'16 fad mi re dod re mi fad sol fad sol mi
    fad8 la, fad' la, fad' la,

    %43
    fad'16 re dod si sol'8 si, sol' si,
    sol'16 mi re dod la'8 dod, la' dod,
    la'16 fad mi re si'8 re, si' re,

    %46
    si' la16 sol la8 sol16 fad mi8 fad16 mi
    fad mi re dod re8 si dod4-+\mbreak
    re4 r r

    %49
    R2.*3
    r8 la'\solo dod, re mi4~
    mi8 la dod, re mi4~

    %54
    mi8 la dod,[la'] dod, la'16 sol
    fad8 la re,[la'] fad8 si16 la\mbreak
    sold la si dod re dod re si dod si dod la

    %57
    si la si dod re dod re si dod si dod la
    si8 mi,\tu sold la16 fad sold8 la16 fad
    sold8 si, mi sold,16 si mi8 sold,16 si

    %60
    mi8 mi, si' mi,16 sold si8 mi,16 sold
    si8 mi, r4 r\mbreak
    r8 la' mi mi mi mi

    %63
    mi la16 mi dod8 dod dod dod
    dod mi16 dod la8 la la la
    la si dod re mi re16 dod

    %66
    re la si dod re mi fad sol la re, la' re,
    la' mi fad sol la mi fad sol la sol fad mi
    fad mi re dod re mi fad sold la sold la fad\mbreak

    %69
    sold4 r r
    R2.
    r8 dod [sold la] si dod16 la

    %72
    si8 dod sold[la] si dod16 la
    si8 si,\f\tu mi [mi] mi mi
    mi16 fad sol! fad mi re dod si lad mi' re dod\mbreak

    %75
    re8 fad, re'[re] re re
    re16 mi fad mi re dod si la sold re' dod si
    dod8 mi, dod'[dod] dod si16 dod

    %78
    re8 fad, re'[re] re dod16 re
    mi8 sold, mi'[mi] mi re16 mi
    fad8 la, fad' fad fad mi16 fad

    %81
    sold mi fad sold la mi fad sold la sold la fad\mbreak
    sold mi\p fad sold la mi fad sold la sold la fad
    sold si,\f dod re mi fad sold la si la si sold

    %84
    la8 sold16 fad mi8 la si,4-+
    la r r
    R2.

    %87
    r8 dod [re mi] fad mi16 re\mbreak
    mi 8 fad sol[la] fad mi16 re
    mi8 dod' dod[dod] dod dod

    %90
    si16(dod) re8 re re re re
    dod16(re) mi8 mi mi  mi mi
    re16 mi dod re si re dod re si dod la si

    %93
    sold8 sold sold sold si16(la) sold8\mbreak
    la mi la[la] dod16(si) la8
    si16 la sold la si la si dod re dod re dod

    %96
    si la sold la si la si dod re dod re si
    dod8 r la\tu r sold r
    la r la, r dod r\mbreak
    mi r dod r mi r

    %100
    la r r4 r
    r8 re la la la la
    la re16 la fad8 fad fad fad

    %103
    fad la16 fad re8 re re re
    re mi fad sol la si16 do!
    si8 la sol fad mi re\mbreak

    %106
    dod16 la si dod re la si dod re mi fad sol
    la la,\f si dod re mi fad sol fad mi re dod
    re re dod si mi si\p dod re mi fad sol la

    %109
    si si,\f dod red mi fad sol la sol fad mi re
    dod8 si16 la fad'8 fad fad fad\mbreak
    fad re16 si sol'8 sol sol sol

    %112
    sol mi16 dod la'8 la la la
    la fad16 re si'8 si si si
    si la16 sold la8 sol16 fad sol8 fad 16 mi

    %115
    fad mi re dod re8 si dod4-+
    re4 r r
    R2.

    %118
    r8 la' [si dod] re8 dod16 si
    dod8 si16 la si8[dod] re dod16 si
    dod8 dod,\tu la' dod, la' dod,
    la'16 si, red mi fad mi red mi fad sol la fad

    %122
    sol8 si, sol'[si,] sol' si,
    sol'16 la, dod re mi re dod re mi fad sol mi
    fad8 la, fad' la, fad' la,\mbreak

    %125
    fad'16 re dod  si sol'8 mi, sol'[si,]
    sol'16 mi re dod la'8 fad, la' [dod,]
    la'16 fad mi re si'8 sol, si' [re,]

    %128
    si' la16 sold   la8 sol16 fad sol8 fad16 mi
    fad mi re dod re8 si dod4-+
    re4. la8 fad'4. re8\mbreak

    %131
    sold4~sold16 fad mi32 fad sold la si8. si16 la8. [sold16]
    la4 la, r2
    dod4. la8 mi'2~

    %134
    mi8. mi16 re8. [dod16] re8. do16 si8. [do16]
    si4. si8 sol'2~
    sol8. sol16 fad8. [mi16] fad2~

    %137
    fad8. sol32 la si8. la16 sol8. fad16 mi8. re32 dod
    la'8. dod,16 re8. [si16] dod4. re8
    re la' mi mi mi mi re1\fermata

}

IflIIn = \relative do'' {

    re4. la8 fad'4. re8
    si'4~si16 la sol fad sol8. sol16 fad8. [mi16]
    fad4. re8 la'2~

    %4
    la4. re,8 sol2~
    sol8. sol16 fad8. [mi16] fad8. sol16 la8. [si16]\mbreak
    mi,4. fad16 sold la4. la,8

    %7
    re8. re16 si'8. [re,16] si'8. re,16 dod8. [si16]
    dod4~dod32 la si dod re mi fad sol la8. fad16 sol8. [mi16]
    fad4~fad32 si, dod re mi fad sold la si8. sold16 la8. [fad16]

    %10
    sold8. mi16 fad8. [red16] mi8. dod16 re8. [si16]
    dod4. re8 re4.-+ dod16 re\mbreak
    mi4. fad8 fad4.-+ mi16 fad

    %13
    sold8. fad32 mi la8. si,16 si4. la8
    la1 la8 la' mi mi mi mi
    mi la16 mi dod8 dod dod dod

    %16
    dod mi16 dod la8 la la la
    la si dod re mi fad16 sol\mbreak
    fad4 la, re

    %19
    fad re fad
    la fad la
    do8 re, re[mi] fad sol16 la

    %22
    sol8 [fad] sol fad16 mi fad8[sol16 fad]
    mi8 dod16 re mi8 dod re si
    dod8 dod16 mi la8 mi la[mi]

    %25
    la la,16 dod mi8 dod mi[dod]\mbreak
    mi la, la'[la,] la' dod,
    re la fad' sol16 mi fad8 sol16 mi

    %28
    fad8 la, do re16 si do8 re16 si
    do8 la fad' sol16 mi fad8 sol16 mi
    fad8 mi re[mi] fad sol16 la

    %31
    sol8 si16 la sol8 fad16 mi fad8 sol16 fad
    mi8 r la r dod, r
    mi r la, r dod r

    %34
    mi8 r r4 r
    R2.
    r8 re\solo mi fad sol fad16 mi

    %37
    fad8 sol16 mi fad8 sol16 mi fad8 mi16 re
    mi8 mi\tu la dod, la' dod,
    la'16 sol fad mi red mi fad sol la sol la fad\mbreak

    %40
    sol8 si, sol' si, sol' si,
    sol'16 fad mi re dod re mi fad sol fad sol mi
    fad8 la, fad' la, fad' la,

    %43
    fad'16 re dod si sol'8 si, sol' si,
    sol'16 mi re dod la'8 dod, la' dod,
    la'16 fad mi re si'8 re, si' re,

    %46
    si' la16 sol la8 sol16 fad mi8 fad16 mi
    fad mi re dod re8 si dod4-+\mbreak
    re4 r r

    %49
    R2.*3
    r8 dod\solo [la si] dod re16 si
    dod8 mi la,[si] dod re16 si

    %54
    dod8 mi la,[dod] la dod
    re fad fad,[fad'] re16(dod) red8\mbreak
    mi16 fad sold la si la si sold la sold la fad

    %57
    sold fad sold la si la si sold la sold la fad
    sold8 mi\tu sold la16 fad sold8 la16 fad
    sold8 si, mi sold,16 si mi8 sold,16 si

    %60
    mi8 mi, si' mi,16 sold si8 mi,16 sold
    si8 mi, r4 r\mbreak
    r8 la' mi mi mi mi

    %63
    mi la16 mi dod8 dod dod dod
    dod mi16 dod la8 la la la
    la si dod re mi re16 dod

    %66
    re la si dod re mi fad sol la re, la' re,
    la' mi fad sol la mi fad sol la sol fad mi
    fad mi re dod re mi fad sold la sold la fad\mbreak

    %69
    sold4 r r
    R2.
    r8 la [mi fad] sold la16 fad

    %72
    sold8 la mi[fad] sold la16 fad
    sold8 si,\tu mi[mi] mi mi
    mi16 fad sol! fad mi re dod si lad mi' re dod\mbreak

    %75
    re8 fad, re'[re] re re
    re16 mi fad mi re dod si la sold re' dod si
    dod8 mi, dod'[dod] dod si16 dod

    %78
    re8 fad, re'[re] re dod16 re
    mi8 sold, mi'[mi] mi re16 mi
    fad8 la, fad' fad fad mi16 fad

    %81
    sold mi fad sold la mi fad sold la sold la fad\mbreak
    sold mi\p fad sold la mi fad sold la sold la fad
    sold si,\f dod re mi fad sold la si la si sold

    %84
    la8 sold16 fad mi8 la si,4-+
    la r r
    R2.

    %87
    r8 la[si dod] re dod16 si\mbreak
    dod8 re mi[dod] re dod16 si
    dod8 la' la la la[la]

    %90
    sold16(la) si8 si si si si
    la16(si) dod8 dod dod dod dod
    fad, 16 sol mi fad re fad mi fad re mi dod re

    %93
    si8 si16(la) si8[si] sold'16(fad) sold8\mbreak
    mi dod16(si) dod8[dod] la'16(sold) la8
    sold16 fad mi fad sold fad sold la si la si la

    %96
    sold fad mi fad sold fad sold la si la si sold
    la8 r la\tu r sold r
    la r la, r dod r\mbreak
    mi r dod r mi r

    %100
    la r r4 r
    r8 re la la la la
    la re16 la fad8 fad fad fad

    %103
    fad la16 fad re8 re re re
    re mi fad sol la si16 do!
    si8 la sol fad mi re\mbreak

    %106
    dod16 la si dod re la si dod re mi fad sol
    la la,\f si dod re mi fad sol fad mi re dod
    re re dod si mi si\p dod re mi fad sol la

    %109
    si si,\f dod red mi fad sol la sol fad mi re
    dod8 si16 la fad'8 fad fad fad\mbreak
    fad re16 si sol'8 sol sol sol

    %112
    sol mi16 dod la'8 la la la
    la fad16 re si'8 si si si
    si la16 sold la8 sol16 fad sol8 fad 16 mi

    %115
    fad mi re dod re8 si dod4-+
    re4 r r
    R2.

    %118
    r8 dod re mi fad sold
    la dod, re mi fad sold
    la dod,\tu la' dod, la' dod,
    la'16 si, red mi fad mi red mi fad sol la fad

    %122
    sol8 si, sol'[si,] sol' si,
    sol'16 la, dod re mi re dod re mi fad sol mi
    fad8 la, fad' la, fad' la,\mbreak

    %125
    fad'16 re dod  si sol'8 mi, sol'[si,]
    sol'16 mi re dod la'8 fad, la' [dod,]
    la'16 fad mi re si'8 sol, si' [re,]

    %128
    si' la16 sold   la8 sol16 fad sol8 fad16 mi
    fad mi re dod re8 si dod4-+
    re4. la8 fad'4. re8\mbreak

    %131
    sold4~sold16 fad mi32 fad sold la si8. si16 la8. [sold16]
    la4 la, r2
    dod4. la8 mi'2~

    %134
    mi8. mi16 re8. [dod16] re8. do16 si8. [do16]
    si4. si8 sol'2~
    sol8. sol16 fad8. [mi16] fad2~

    %137
    fad8. sol32 la si8. la16 sol8. fad16 mi8. re32 dod
    la'8. dod,16 re8. [si16] dod4. re8
    re la' mi mi mi mi re1\fermata

}

IobIn = \relative do'' {

    re4. la8 fad'4. re8
    si'4~si16 la sol fad sol8. sol16 fad8. [mi16]
    fad4. re8 la'2~

    %4
    la4. re,8 sol2~
    sol8. sol16 fad8. [mi16] fad8. sol16 la8. [si16]\mbreak
    mi,4. fad16 sold la4. la,8

    %7
    re8. re16 si'8. [re,16] si'8. re,16 dod8. [si16]
    dod4~dod32 la si dod re mi fad sol la8. fad16 sol8. [mi16]
    fad4~fad32 si, dod re mi fad sold la si8. sold16 la8. [fad16]

    %10
    sold8. mi16 fad8. [red16] mi8. dod16 re8. [si16]
    dod4. re8 re4.-+ dod16 re\mbreak
    mi4. fad8 fad4.-+ mi16 fad

    %13
    sold8. fad32 mi la8. si,16 si4. la8
    la1 la8 la' mi mi mi mi
    mi la16 mi dod8 dod dod dod

    %16
    dod mi16 dod la8 la la la
    la si dod re mi fad16 sol\mbreak
    fad4 la, re

    %19
    fad re fad
    la fad la
    do8 re, re[mi] fad sol16 la

    %22
    sol8 [fad] sol fad16 mi fad8[sol16 fad]
    mi8 dod16 re mi8 dod re si
    dod8 dod16 mi la8 mi la[mi]

    %25
    la la,16 dod mi8 dod mi[dod]\mbreak
    mi la, la'[la,] la' dod,
    re la fad' sol16 mi fad8 sol16 mi

    %28
    fad8 la, do re16 si do8 re16 si
    do8 la fad' sol16 mi fad8 sol16 mi
    fad8 mi re[mi] fad sol16 la

    %31
    sol8 si16 la sol8 fad16 mi fad8 sol16 fad
    mi8  r mi r la, r\mbreak
    dod r mi, r la r

    %34
    dod fad\solo sol[la] si la16 sol
    fad8 mi fad[sol] la sol16 fad
    dod8 la\p la[la] la la

    %37
    la la la[la] la la
    la8 mi'\tu la dod, la' dod,
    la'16 sol fad mi red mi fad sol la sol la fad\mbreak

    %40
    sol8 si, sol' si, sol' si,
    sol'16 fad mi re dod re mi fad sol fad sol mi
    fad8 la, fad' la, fad' la,

    %43
    fad'16 re dod si sol'8 si, sol' si,
    sol'16 mi re dod la'8 dod, la' dod,
    la'16 fad mi re si'8 re, si' re,

    %46
    si' la16 sol la8 sol16 fad mi8 fad16 mi
    fad mi re dod re8 si dod4-+\mbreak
    re8 la'\solo fad[sol] la4~

    %49
    la8 si16 la sol8 fad sol4~
    sol8 la16 sol fad8 mi fad4~
    fad8 mi16 fad sol8 fad sol fad

    %52
    mi4 r8 la[la, si]
    dod la r la' la, si
    dod la r dod mi dod

    %55
    fad re r re fad red\mbreak
    sold mi r mi mi, mi'
    mi, mi' r4 r

    %58
    r8 mi\tu sold la16 fad sold8 la16 fad
    sold8 si, mi sold,16 si mi8 sold,16 si

    %60
    mi8 mi, si' mi,16 sold si8 mi,16 sold
    si8 mi, r4 r\mbreak
    r8 la' mi mi mi mi

    %63
    mi la16 mi dod8 dod dod dod
    dod mi16 dod la8 la la la
    la si dod re mi re16 dod

    %66
    re la si dod re mi fad sol la re, la' re,
    la' mi fad sol la mi fad sol la sol fad mi
    fad mi re dod re mi fad sold la sold la fad\mbreak

    %69
    sold8 la\solo mi[fad] sold la16 fad
    sold8 la mi[fad] sold la16 fad
    sold8 mi,\p  mi[mi]  mi mi

    %72
    mi mi\pp mi[mi] mi mi
    mi si'\f  mi[mi] mi mi
    mi16 fad sol! fad mi re dod si lad mi' re dod\mbreak

    %75
    re8 fad, re'[re] re re
    re16 mi fad mi re dod si la sold re' dod si
    dod8 mi, dod'[dod] dod si16 dod

    %78
    re8 fad, re'[re] re dod16 re
    mi8 sold, mi'[mi] mi re16 mi
    fad8 la, fad' fad fad mi16 fad

    %81
    sold mi fad sold la mi fad sold la sold la fad\mbreak
    sold mi\p fad sold la mi fad sold la sold la fad
    sold si,\f dod re mi fad sold la si la si sold

    %84
    la8 sold16 fad mi8 la si,4-+
    la8 dod\solo re[mi] fad  mi16 re
    mi8 fad sol la fad mi16 re

    %87
    mi8 la,~la2~\mbreak
    la2.~
    la4 r8 dod16 re mi8 mi16 fad

    %90
    sold8 si r si16 la sold8 si
    la mi r la la, la'
    fad la16 sol fad8 fad fad16 (mi) fad8

    %93
    si,16(dod) re8 re re re re\mbreak
    dod16(re) mi8 mi mi mi mi
    mi,2.~

    %96
    mi
    r4 la'8\tu r sold r
    la r la, r dod r\mbreak
    mi r dod r mi r

    %100
    la r r4 r
    r8 re la la la la
    la re16 la fad8 fad fad fad

    %103
    fad la16 fad re8 re re re
    re mi fad sol la si16 do!
    si8 la sol fad mi re\mbreak

    %106
    dod16 la si dod re la si dod re mi fad sol
    la la,\f si dod re mi fad sol fad mi re dod
    si re dod si mi si\p dod re mi fad sol la

    %109
    si si,\f dod red mi fad sol la sol fad mi re
    dod8 si16 la fad'8 fad fad fad\mbreak
    fad re16 si sol'8 sol sol sol

    %112
    sol mi16 dod la'8 la la la
    la fad16 re si'8 si si si
    si la16 sold la8 sol16 fad sol8 fad 16 mi

    %115
    fad mi re dod re8 si dod4-+
    re8 mi\solo fa mi16 fa sol8 fa
    mi re16\p mi fa8 mi16 fa sol8 fa\mbreak

    %118
    mi la,\p la[la] la la
    la la\pp la la la la
    la dod\f\tu la'[dod,] la' dod,
    la'16 si, red mi fad mi red mi fad sol la fad

    %122
    sol8 si, sol'[si,] sol' si,
    sol'16 la, dod re mi re dod re mi fad sol mi
    fad8 la, fad' la, fad' la,\mbreak

    %125
    fad'16 re dod  si sol'8 mi, sol'[si,]
    sol'16 mi re dod la'8 fad, la' [dod,]
    la'16 fad mi re si'8 sol, si' [re,]

    %128
    si' la16 sold   la8 sol16 fad sol8 fad16 mi
    fad mi re dod re8 si dod4-+
    re4. la8 fad'4. re8\mbreak

    %131
    sold4~sold16 fad mi32 fad sold la si8. si16 la8. [sold16]
    la4 la, r2
    dod4. la8 mi'2~

    %134
    mi8. mi16 re8. [dod16] re8. do16 si8. [do16]
    si4. si8 sol'2~
    sol8. sol16 fad8. [mi16] fad2~

    %137
    fad8. sol32 la si8. la16 sol8. fad16 mi8. re32 dod
    la'8. dod,16 re8. [si16] dod4. re8
    re la' mi mi mi mi re1\fermata

}

IobIIn = \relative do'' {

    la4. fad8 re'4. fad,8
    sol4. la8 si4 dod
    la4. fad8 re'2~

    %4
    re4.si8 la2~
    la4 la si si\mbreak
    si2 la4. dod8

    %7
    fad,4 fad si8.[si16] la8. sold16
    la4 mi r8 r16 la la8. la16
    la4 si r8 r16 si si8. si16

    %10
    si8. sold16 la8.[fad16] sold8. la16 si8.[sold16]
    la4. la8 sold4. si8\mbreak
    la2~la8. re16 re8.[dod16]

    %13
    si8. la32 sold la8. la16 sold4. la8
    la1 la4 r r
    R2.*3

    %18
    r8 re la la la la
    la re16 la fad8 fad fad fad
    fad la16 fad re8 re re re

    %21
    re mi fad sol la si16 do
    si8 la si dod! re mi16 re
    dod8 la16 si dod8 la si sold

    %24
    la la16 dod mi8 la, mi' la,
    mi' la, dod[la] dod la\mbreak
    dod mi la,[si] dod re16 mi

    %27
    re8 la re mi16 dod re8 mi16 dod
    re8 fad, la[la] la la
    la do do[do] do do

    %30
    do? do do[do] do si16 la
    re8 si16 do re8 mi re mi16 re
    dod!8 r dod r mi, r\mbreak

    %33
    la r mi r mi r
    la re\solo mi fad sol fad16 mi
    re8 dod re[mi] fad mi16 re

    %36
    dod8 la\p la[la] la la
    la la la[la] la la
    la dod\tu dod[dod] dod dod

    %39
    si si si si si si\mbreak
    si sol si[si] si si

    %41
    la la la[la] la la
    la la la[la] la la
    si si si[si] si si

    %44
    dod dod dod[dod] dod dod
    re re re[re] re re
    mi la, la[dod] dod dod

    %47
    re sol, la[si] mi,4-+\mbreak
    fad8 fad'\solo re[mi] fad4~
    fad8 sol16 fad mi8 re mi4~

    %50
    mi8 fad16 mi re8 dod re4~
    re8 dod16 re mi8 re mi re
    dod4 r8 la' la, sold

    %53
    la dod r la' la, sol
    la dod r mi, dod' la
    la fad r la re fad\mbreak

    %56
    si, sold r4 r
    r r8 mi' mi, mi'
    mi, si'\tu mi [red] mi red

    %59
    mi sold, si[si] si si
    si sold sold[sold] sold sold

    %61
    sold? la si[dod] sold! la16 si\mbreak
    la8 dod mi[dod] mi dod
    mi dod la[la] la la

    %64
    la dod16 la mi8 mi mi mi
    mi sold la [la] la la
    la la la la la la

    %67
    la la la la la la
    la la la la si si\mbreak
    si dod\solo sold[la] si dod16 la

    %70
    si8 dod sold[la] si dod16 la
    si8 mi,\p mi[mi] mi mi
    mi mi\pp mi[mi] mi mi

    %73
    mi sold\f\tu sold[sold] sold sold
    lad lad lad lad lad lad\mbreak

    %75
    si si fad fad fad fad
    sold sold sold sold sold sold
    la la la la la la

    %78
    fad si si si si si
    si si la la la la
    la la la la si si

    %81
    si16 sold la si dod sold la si dod si dod la\mbreak
    si sold\p la si dod sold la si dod si dod la
    si sold\f la fad sold la si dod sold8 sold16 si

    %84
    la8 re la[la] sold4
    la2.\solo~
    la~

    %87
    la~\mbreak
    la~
    la4 r8 la16 si dod8 dod16 re

    %90
    mi8 sold r sold16 fad mi8[sold]
    mi dod r mi la dod,
    fad la, re[si] re fad

    %93
    mi,2.~\mbreak
    mi~
    mi~

    %96
    mi
    r4 dod'8\tu r si r
    dod r mi, r la r\mbreak
    dod r mi, r dod' r

    %100
    dod re la si dod re16 mi
    re8 la re[la] re la
    re la re[re] re re

    %103
    re re la[la] la la
    la mi' re[dod] re re
    re re si[si] si sold\mbreak

    %106
    la la la4 r
    r8 la la la la la
    sol re' si4 r

    %109
    r8 si si si si si
    la la la la la la\mbreak
    si si si si si si

    %112
    dod dod dod dod dod dod
    re re re re re re
    mi dod16 si la8 dod mi[dod]

    %115
    re sol, la[si] mi,4-+
    fad8 dod'\solo re dod16 re mi8 re
    dod si16\p dod re8 dod16 re mi8 re\mbreak

    %118
    dod la\p la[la] la la
    la la\pp la la la la
    la la\f dod[dod] dod dod

    %121
    si si si[si] si si
    si si si[si] si si

    %123
    la la la[la] la la
    la la la[la] la la\mbreak
    si si si[si] si si

    %126
    dod dod dod[dod] dod dod
    re re re[re] re re
    mi la,16 si la8[la] dod dod

    %129
    re sol, la[si] mi,4-+
    fad2 re'
    si4. dod8 sold8. sold16 la8.[si16]

    %132
    la4. mi8 dod'4. mi8
    la,2. la4
    la2. fad4

    %135
    sol4. sol8 si4. si8\mbreak
    la4. la8 la8.[fad16] sol8. la16
    si2 r4 la

    %138
    la8. sol16 la8.[si16] mi,4. fad8
    fad4 r r fad1\fermata

}


IvlIn = \relative do'' {

    re4. la8 fad'4. re8
    si'4~si16 la sol fad sol8. sol16 fad8. [mi16]
    fad4. re8 la'2~

    %4
    la4. re,8 sol2~
    sol8. sol16 fad8. [mi16] fad8. sol16 la8. [si16]\mbreak
    mi,4. fad16 sold la4. la,8

    %7
    re8. re16 si'8. [re,16] si'8. re,16 dod8. [si16]
    dod4~dod32 la si dod re mi fad sol la8. fad16 sol8. [mi16]
    fad4~fad32 si, dod re mi fad sold la si8. sold16 la8. [fad16]

    %10
    sold8. mi16 fad8. [red16] mi8. dod16 re8. [si16]
    dod4. re8 re4.-+ dod16 re\mbreak
    mi4. fad8 fad4.-+ mi16 fad

    %13
    sold8. fad32 mi la8. si,16 si4. la8
    la1 la8 la' mi mi mi mi
    mi la16 mi dod8 dod dod dod

    %16
    dod mi16 dod la8 la la la
    la si dod re mi fad16 sol\mbreak
    fad4 la, re

    %19
    fad re fad
    la fad la
    do8 re, re[mi] fad sol16 la

    %22
    sol8 [fad] sol fad16 mi fad8[sol16 fad]
    mi8 dod16 re mi8 dod re si
    dod8 dod16 mi la8 mi la[mi]

    %25
    la la,16 dod mi8 dod mi[dod]\mbreak
    mi la, la'[la,] la' dod,
    re la fad' sol16 mi fad8 sol16 mi

    %28
    fad8 la, do re16 si do8 re16 si
    do8 la fad' sol16 mi fad8 sol16 mi
    fad8 mi re[mi] fad sol16 la

    %31
    sol8 si16 la sol8 fad16 mi fad8 sol16 fad
    mi8 la16 mi dod8 mi16 dod la8 dod16 la\mbreak
    mi8 la16 mi la8 dod16 la dod8 mi16 dod

    %34
    mi8 la,\p la [la] la la
    la la la[la] la la
    la4 r r

    %37
    R2.
    r8 mi'\tu la dod, la' dod,
    la'16 sol fad mi red mi fad sol la sol la fad\mbreak

    %40
    sol8 si, sol' si, sol' si,
    sol'16 fad mi re dod re mi fad sol fad sol mi
    fad8 la, fad' la, fad' la,

    %43
    fad'16 re dod si sol'8 si, sol' si,
    sol'16 mi re dod la'8 dod, la' dod,
    la'16 fad mi re si'8 re, si' re,

    %46
    si' la16 sol la8 sol16 fad mi8 fad16 mi
    fad mi re dod re8 si dod4-+\mbreak
    re4 r r

    %49
    R2.*9
    r8 mi\tu sold la16 fad sold8 la16 fad
    sold8 si, mi sold,16 si mi8 sold,16 si

    %60
    mi8 mi, si' mi,16 sold si8 mi,16 sold
    si8 mi, r4 r\mbreak
    r8 la' mi mi mi mi

    %63
    mi la16 mi dod8 dod dod dod
    dod mi16 dod la8 la la la
    la si dod re mi re16 dod

    %66
    re la si dod re mi fad sol la re, la' re,
    la' mi fad sol la mi fad sol la sol fad mi
    fad mi re dod re mi fad sold la sold la fad\mbreak

    %69
    sold8 mi,\p mi[mi] mi mi
    mi mi\pp mi[mi] mi mi
    mi4 r r

    %72
    R2.
    r8 si'\f\tu mi mi mi mi
    mi16 fad sol! fad mi re dod si lad mi' re dod\mbreak

    %75
    re8 fad, re'[re] re re
    re16 mi fad mi re dod si la sold re' dod si
    dod8 mi, dod'[dod] dod si16 dod

    %78
    re8 fad, re'[re] re dod16 re
    mi8 sold, mi'[mi] mi re16 mi
    fad8 la, fad' fad fad mi16 fad

    %81
    sold mi fad sold la mi fad sold la sold la fad\mbreak
    sold mi\p fad sold la mi fad sold la sold la fad
    sold si,\f dod re mi fad sold la si la si sold

    %84
    la8 sold16 fad mi8 la si,4-+
    la r r
    R2.*11

    %97
    r4 la'8\f r sold r
    la r la, r dod r\mbreak
    mi r dod r mi r

    %100
    la r r4 r
    r8 re la la la la
    la re16 la fad8 fad fad fad

    %103
    fad la16 fad re8 re re re
    re mi fad sol la si16 do!
    si8 la sol fad mi re\mbreak

    %106
    dod16 la si dod re la si dod re mi fad sol
    la la,\f si dod re mi fad sol fad mi re dod
    si re dod si mi si\p dod re mi fad sol la

    %109
    si si,\f dod red mi fad sol la sol fad mi re
    dod8 si16 la fad'8 fad fad fad\mbreak
    fad re16 si sol'8 sol sol sol

    %112
    sol mi16 dod la'8 la la la
    la fad16 re si'8 si si si
    si la16 sold la8 sol16 fad sol8 fad 16 mi

    %115
    fad mi re dod re8 si dod4-+
    re8 la\p la la la la
    la la\pp la la la la\mbreak

    %118
    R2.*2
    r8 dod\f la' dod, la' dod,
    la'16 si, red mi fad mi red mi fad sol la fad

    %122
    sol8 si, sol'[si,] sol' si,
    sol'16 la, dod re mi re dod re mi fad sol mi
    fad8 la, fad' la, fad' la,\mbreak

    %125
    fad'16 re dod  si sol'8 mi, sol'[si,]
    sol'16 mi re dod la'8 fad, la' [dod,]
    la'16 fad mi re si'8 sol, si' [re,]

    %128
    si' la16 sold   la8 sol16 fad sol8 fad16 mi
    fad mi re dod re8 si dod4-+
    re4. la8 fad'4. re8\mbreak

    %131
    sold4~sold16 fad mi32 fad sold la si8. si16 la8. [sold16]
    la4 la, r2
    dod4. la8 mi'2~

    %134
    mi8. mi16 re8. [dod16] re8. do16 si8. [do16]
    si4. si8 sol'2~
    sol8. sol16 fad8. [mi16] fad2~

    %137
    fad8. sol32 la si8. la16 sol8. fad16 mi8. re32 dod
    la'8. dod,16 re8. [si16] dod4. re8
    re la' mi mi mi mi re1\fermata

}

IvlIIn = \relative do'' {

    re4. la8 fad'4. re8
    si'4~si16 la sol fad sol8. sol16 fad8. [mi16]
    fad4. re8 la'2~

    %4
    la4. re,8 sol2~
    sol8. sol16 fad8. [mi16] fad8. sol16 la8. [si16]\mbreak
    mi,4. fad16 sold la4. la,8

    %7
    re8. re16 si'8. [re,16] si'8. re,16 dod8. [si16]
    dod4~dod32 la si dod re mi fad sol la8. fad16 sol8. [mi16]
    fad4~fad32 si, dod re mi fad sold la si8. sold16 la8. [fad16]

    %10
    sold8. mi16 fad8. [red16] mi8. dod16 re8. [si16]
    dod4. re8 re4.-+ dod16 re\mbreak
    mi4. fad8 fad4.-+ mi16 fad

    %13
    sold8. fad32 mi la8. si,16 si4. la8
    la1 la8 la' mi mi mi mi
    mi la16 mi dod8 dod dod dod

    %16
    dod mi16 dod la8 la la la
    la si dod re mi fad16 sol\mbreak
    fad4 la, re

    %19
    fad re fad
    la fad la
    do8 re, re[mi] fad sol16 la

    %22
    sol8 [fad] sol fad16 mi fad8[sol16 fad]
    mi8 dod16 re mi8 dod re si
    dod8 dod16 mi la8 mi la[mi]

    %25
    la la,16 dod mi8 dod mi[dod]\mbreak
    mi la, la'[la,] la' dod,
    re la fad' sol16 mi fad8 sol16 mi

    %28
    fad8 la, do re16 si do8 re16 si
    do8 la fad' sol16 mi fad8 sol16 mi
    fad8 mi re[mi] fad sol16 la

    %31
    sol8 si16 la sol8 fad16 mi fad8 sol16 fad
    mi8 la16 mi dod8 mi16 dod la8 dod16 la\mbreak
    mi8 la16 mi la8 dod16 la dod8 mi16 dod

    %34
    mi8 la,\p la [la] la la
    la la la[la] la la
    la4 r r

    %37
    R2.
    r8 mi'\tu la dod, la' dod,
    la'16 sol fad mi red mi fad sol la sol la fad\mbreak

    %40
    sol8 si, sol' si, sol' si,
    sol'16 fad mi re dod re mi fad sol fad sol mi
    fad8 la, fad' la, fad' la,

    %43
    fad'16 re dod si sol'8 si, sol' si,
    sol'16 mi re dod la'8 dod, la' dod,
    la'16 fad mi re si'8 re, si' re,

    %46
    si' la16 sol la8 sol16 fad mi8 fad16 mi
    fad mi re dod re8 si dod4-+\mbreak
    re4 r r

    %49
    R2.*9
    r8 mi\tu sold la16 fad sold8 la16 fad
    sold8 si, mi sold,16 si mi8 sold,16 si

    %60
    mi8 mi, si' mi,16 sold si8 mi,16 sold
    si8 mi, r4 r\mbreak
    r8 la' mi mi mi mi

    %63
    mi la16 mi dod8 dod dod dod
    dod mi16 dod la8 la la la
    la si dod re mi re16 dod

    %66
    re la si dod re mi fad sol la re, la' re,
    la' mi fad sol la mi fad sol la sol fad mi
    fad mi re dod re mi fad sold la sold la fad\mbreak

    %69
    sold8 mi,\p mi[mi] mi mi
    mi mi\pp mi[mi] mi mi
    mi4 r r

    %72
    R2.
    r8 si'\f\tu mi mi mi mi
    mi16 fad sol! fad mi re dod si lad mi' re dod\mbreak

    %75
    re8 fad, re'[re] re re
    re16 mi fad mi re dod si la sold re' dod si
    dod8 mi, dod'[dod] dod si16 dod

    %78
    re8 fad, re'[re] re dod16 re
    mi8 sold, mi'[mi] mi re16 mi
    fad8 la, fad' fad fad mi16 fad

    %81
    sold mi fad sold la mi fad sold la sold la fad\mbreak
    sold mi\p fad sold la mi fad sold la sold la fad
    sold si,\f dod re mi fad sold la si la si sold

    %84
    la8 sold16 fad mi8 la si,4-+
    la r r
    R2.*11

    %97
    r4 la'8\f r sold r
    la r la, r dod r\mbreak
    mi r dod r mi r

    %100
    la r r4 r
    r8 re la la la la
    la re16 la fad8 fad fad fad

    %103
    fad la16 fad re8 re re re
    re mi fad sol la si16 do!
    si8 la sol fad mi re\mbreak

    %106
    dod16 la si dod re4 r
    r16 la\f si dod re mi fad sol fad mi re dod
    si re dod si mi4 r

    %109
    r16 si\f dod red mi fad sol la sol fad mi re
    dod8 si16 la fad'8 fad fad fad\mbreak
    fad re16 si sol'8 sol sol sol

    %112
    sol mi16 dod la'8 la la la
    la fad16 re si'8 si si si
    si la16 sold la8 sol16 fad sol8 fad 16 mi

    %115
    fad mi re dod re8 si dod4-+
    re8 la\p la la la la
    la la\pp la la la la\mbreak

    %118
    R2.*2
    r8 dod\f la' dod, la' dod,
    la'16 si, red mi fad mi red mi fad sol la fad

    %122
    sol8 si, sol'[si,] sol' si,
    sol'16 la, dod re mi re dod re mi fad sol mi
    fad8 la, fad' la, fad' la,\mbreak

    %125
    fad'16 re dod  si sol'8 mi, sol'[si,]
    sol'16 mi re dod la'8 fad, la' [dod,]
    la'16 fad mi re si'8 sol, si' [re,]

    %128
    si' la16 sold   la8 sol16 fad sol8 fad16 mi
    fad mi re dod re8 si dod4-+
    re4. la8 fad'4. re8\mbreak

    %131
    sold4~sold16 fad mi32 fad sold la si8. si16 la8. [sold16]
    la4 la, r2
    dod4. la8 mi'2~

    %134
    mi8. mi16 re8. [dod16] re8. do16 si8. [do16]
    si4. si8 sol'2~
    sol8. sol16 fad8. [mi16] fad2~

    %137
    fad8. sol32 la si8. la16 sol8. fad16 mi8. re32 dod
    la'8. dod,16 re8. [si16] dod4. re8
    re la' mi mi mi mi re1\fermata

}

IvlaIn = \relative do'' {

    la4. fad8 re'4. fad,8
    sol4. la8 si4 dod
    la4. fad8 re'2~

    %4
    re4.si8 la2~
    la4 la si si\mbreak
    si2 la4. dod8

    %7
    fad,4 fad si8.[si16] la8. sold16
    la4 mi r8 r16 la la8. la16
    la4 si r8 r16 si si8. si16

    %10
    si8. sold16 la8.[fad16] sold8. la16 si8.[sold16]
    la4. la8 sold4. si8\mbreak
    la2~la8. re16 re8.[dod16]

    %13
    si8. la32 sold la8. la16 sold4 mi
    mi1 mi4 r r
    R2.*3

    %18
    r8 re' la la la la
    la re16 la fad8 fad fad fad
    fad la16 fad re8 re re re

    %21
    re mi fad sol la si16 do
    si8 la si dod! re mi16 re
    dod8 la16 si dod8 la si sold

    %24
    la la16 dod mi8 la, mi' la,
    mi' la, dod[la] dod la\mbreak
    dod mi la,[si] dod re16 mi

    %27
    re8 la re mi16 dod re8 mi16 dod
    re8 fad, la[la] la la
    la do do[do] do do

    %30
    do? do do[do] do si16 la
    re8 si16 do re8 mi re mi16 re
    dod!8 mi16 dod la8 dod16 la mi8 la16 mi\mbreak

    %33
    dod8 mi16 dod mi8 la16 mi la8 dod16 la
    dod4 r r
    R2.*3

    %38
    r8 dod dod dod dod dod
    si si si si si si\mbreak
    si sol si[si] si si

    %41
    la la la[la] la la
    la la la[la] la la
    si si si[si] si si

    %44
    dod dod dod[dod] dod dod
    re re re[re] re re
    mi la, la[dod] dod dod

    %47
    re sol, la[si] la4\mbreak
    la r r
    R2.*9

    %58
    r8 si mi  red mi red
    mi sold, si[si] si si
    si sold sold[sold] sold sold

    %61
    sold? la si[dod] sold! la16 si\mbreak
    la8 dod mi[dod] mi dod
    mi dod la[la] la la

    %64
    la dod16 la mi8 mi mi mi
    mi sold la [la] la la
    la la la la la la

    %67
    la la la la la la
    la la la la si si\mbreak
    si4 r r

    %70
    R2.*3
    r8 sold sold sold sold sold
    lad lad lad lad lad lad\mbreak

    %75
    si si fad fad fad fad
    sold sold sold sold sold sold
    la la la la la la

    %78
    fad si si si si si
    si si la la la la
    la la la la si si

    %81
    si16 sold la si dod sold la si dod si dod la\mbreak
    si sold la si dod sold la si dod si dod la
    si sold la fad sold la si dod sold8 sold16 si

    %84
    la8 re la[la] sold4
    la r r
    R2.*11

    %97
    r4 dod8 r si r
    dod r mi, r la r\mbreak
    dod r mi, r dod' r

    %100
    dod re la si dod re16 mi
    re8 la re[la] re la
    re la re[re] re re

    %103
    re re la[la] la la
    la mi' re[dod] re re
    re re si[si] si sold\mbreak

    %106
    la la la4 r
    r8 la la la la la
    sol re' si4 r

    %109
    r8 si si si si si
    la la la la la la\mbreak
    si si si si si si

    %112
    dod dod dod dod dod dod
    re re re re re re
    mi dod16 si la8 dod mi[dod]

    %115
    re sol, la[si] la4
    la r r
    R2.*3

    %120
    r8 la dod dod dod dod
    si si si[si] si si
    si si si[si] si si

    %123
    la la la[la] la la
    la la la[la] la la\mbreak
    si si si[si] si si

    %126
    dod dod dod[dod] dod dod
    re re re[re] re re
    mi la,16 si la8[la] dod dod

    %129
    re sol, la[si] la4
    la2 re\mbreak
    si4. dod8 sold8. sold16 la8.[si16]

    %132
    la4. mi8 dod'4. mi8
    la,2. la4
    la2. fad4

    %135
    sol4. sol8 si4. si8\mbreak
    la4. la8 la8.[fad16] sol8. la16
    si2 r4 la

    %138
    la8. sol16 la8.[si16] la4 la
    la r r la1\fermata

}

IvlaIIn = \relative do' {

    fad4. re8 la'4. la8
    re,1
    re4. la'8 la4. fad8

    %4
    re4. sol8 mi8.[mi16] re8. dod16
    re2. fad4\mbreak
    sold2 mi4. mi8

    %7
    re4 re mi mi
    mi dod r8 r16 re mi8. dod16
    re4 fad r8 r16 mi fad8. red16

    %10
    mi4 mi r8 r16 mi sold8. sold16
    mi4. mi8 re4. sold8\mbreak
    mi2 re8. fad16 fad8.[fad16]

    %13
    mi8. mi16 mi8.[fad16] mi4 mi
    dod1 dod4 r r
    R2.*8

    %23
    r8 la' mi mi mi mi
    mi la16 mi dod8 dod dod dod
    dod mi16 dod la8 la la la\mbreak

    %26
    la si dod[re] mi fad16 sol
    fad8 fad la[la] la la
    la fad re[re] re re

    %29
    re re la'[la] la la
    la sol la[re,] re re
    re re16 do sol'8 la la si

    %32
    la dod!16 la mi8 la16 mi dod8 mi16 dod\mbreak
    la8 dod16 la dod8 mi16 dod mi8 la16 mi
    la4 r r

    %35
    R2.*3
    r8 la la fad fad fad
    red red16 mi fad sol red mi fad mi fad red\mbreak

    %40
    mi8 mi mi[mi] mi mi
    dod dod16 re mi fad dod re mi re mi dod
    re8 re re[re] re re

    %43
    re re mi[mi] mi mi
    mi mi fad[fad] fad fad
    fad fad sol[sol] sol sol

    %46
    mi dod mi[la] la la
    la sol fad mi mi4\tr\mbreak
    fad4 r r

    %49
    R2.*9
    r8 sold si si si si
    si mi, mi[mi] mi mi

    %60
    mi si mi[mi] mi mi
    mi mi mi[mi] re mi16 fad\mbreak
    mi8 mi la[la] la la

    %63
    la la mi[mi] mi mi
    mi la16 mi dod8[dod] mi dod
    mi re mi[re] dod mi

    %66
    re re re re re re
    mi mi mi mi mi mi
    re16 mi fad sol fad mi re mi fad8 fad\mbreak

    %69
    mi4 r r
    R2.*3
    r8 mi mi mi mi mi

    %74
    dod dod dod fad dod fad\mbreak
    fad si, si si si si
    si si si mi si mi

    %77
    mi mi mi mi fad fad
    fad fad fad fad sold si
    mi, sold mi mi mi dod

    %80
    re re re re fad fad
    mi mi mi mi mi mi\mbreak
    mi mi\p mi[mi] mi mi

    %83
    mi mi\f mi[mi] mi mi
    mi re mi dod mi4
    dod r r

    %86
    R2.*11
    r4 mi8 r  mi r
    mi r mi r mi r\mbreak

    %99
    la r la r la r
    mi re mi fad sol la16 si
    la8 fad la[fad] la fad

    %102
    la fad la[la] la la
    la fad la[fad] la fad
    la la la[sol] re' fad,

    %105
    sol la si[si] mi, mi\mbreak
    mi16 dod re mi re4 r
    r16 dod re mi re8 re re re

    %108
    re sol mi4 r
    r16 red mi fad mi8 mi mi mi
    mi re!16 dod re8 re re re\mbreak

    %111
    si si mi mi mi mi
    dod dod fad fad fad fad
    re re sol sol sol sol

    %114
    mi mi16 re mi8[mi] la la
    la sol fad[mi] mi4-+
    fad r r

    %117
    R2.*3
    r8 mi fad fad fad fad
    fad fad fad[fad] fad red

    %122
    mi mi mi[mi] mi mi
    mi mi mi[mi] mi dod
    re re re[re] re re\mbreak

    %125
    re re mi[mi] mi mi
    mi mi fad[fad] fad fad
    fad fad sol[sol] sol sol

    %128
    mi dod16 re mi8[dod] mi la
    la sol fad[mi] mi4
    fad2 la\mbreak

    %131
    mi2. mi4
    mi4. dod8 la'4. la8
    mi4. dod8 dod8.[dod16] dod8. mi16

    %134
    la,2 re4 re
    re4. re8 mi4. mi8\mbreak
    mi8. dod16 re8.[mi16] re4. re8

    %137
    si4 mi r dod8. re32 mi
    re8. sol16 fad8.[mi16] mi4. fad8
    fad4 r r fad1\fermata

}

Ifgn = \relative do {

    re1~
    re
    re4.la8 fad'4. re8

    %4
    si'8. la16 sol [fad mi re] dod8. dod16 si8.[la16]
    re2 re'~\mbreak
    re8. re16 dod8.[si16] dod8. dod16 si8.[la16]

    %7
    si4. la8 sold4 mi
    la dod, r8 r16 la'[ la,8. la'16]
    re,4 re, r8 r16 si''[si,8. si'16]

    %10
    mi,4 mi, r8 r16 mi' mi,8. mi'16
    la,8. la'16 la,8.[la'16] si,8. sold'16 si,8.[sold'16]
    dod,8. la'16 dod,8.[la'16] re,8. si'16 re,8.[si'16]

    %13
    mi,8. re16 dod8. [re16] mi4 mi,
    la4. \senza \tuplet 3/2 { re'16 dod si } la8. sol16 fad8.[mi16] la,4 r r
    R2.*12

    %27
    r8 re' la la la la
    la re16 la fad8 fad fad fad
    fad la16 fad re8 re re re

    %30
    re mi fad[sol] la si16 do
    si8 sol16 la si8[dod!] re sol,
    la la, la'[la,] la' la,\mbreak

    %33
    la' la, la'[la,] la' la,
    la'4 r r
    R2.*3

    %38
    r8 la fad la fad la
    si, si' si, si' si, si'\mbreak
    mi, sol mi[sol] mi sol

    %41
    la, la' la,[la'] la, la'
    re, fad re[fad] re fad
    sol, sol' mi[sol] mi sol

    %44
    la, la' fad [la] fad la
    si, si' sol[si] sol si
    dod, mi dod[la'] la, la'

    %47
    re, mi fad[sol] la la,\mbreak
    re4 r8 re'\solo re, fad
    si, si' r si mi, sol

    %50
    la, la' r la re, fad
    sol, sol' r si mi, sol
    la, la' r4 r

    %53
    la,8 la' r4 r
    la,8 la' r la la, la'
    re, re' r re re, si'\mbreak

    %56
    mi, mi' r4 r
    R2.

    %58
    r8 mi\tu si si si si
    si mi16 si sold8 sold sold sold
    sold? si16 sold mi8 mi mi mi

    %61
    mi fad sold la si dod16 re\mbreak
    dod8 la, dod[la] dod la
    dod la  la'[mi] la mi

    %64
    la mi16 la dod8[la] dod la
    dod si la[si] la sol
    fad fad fad fad fad fad

    %67
    dod dod dod dod dod dod
    re re re re red red\mbreak
    mi4 r r

    %70
    R2.*3
    r8 mi dod mi dod mi
    fad, fad' fad,[fad'] fad, fad'\mbreak

    %75
    si, re si [re] si re
    mi, mi' mi, mi' mi, mi'
    la, dod16 si la8[la'] la, fad'

    %78
    si, re16 dod si8 [si'] si, sold'
    dod, mi16 re dod8[dod'] dod, la'
    re, fad16 mi re8[re'] re, si'

    %81
    mi, mi mi mi mi mi\mbreak
    mi mi\p mi mi  mi mi
    mi mi,\f mi[mi'] mi re

    %84
    dod si dod[la] mi' mi,
    la la'\solo si dod re dod16 si
    dod8 re mi dod re dod16 si

    %87
    dod8 la r4 r
    R2.
    r8 la la, la' la, la'

    %90
    mi mi' mi, mi' mi, mi'
    la, la la,  la' la, la'\mbreak
    re, re re, re' re, re'

    %93
    mi, mi' r4 r
    R2.*3

    %97
    r8 la\tu mi mi mi mi
    mi la16 mi dod8 dod dod dod\mbreak
    dod mi16 dod la8 la la la

    %100
    la si dod re mi fad16 sol
    fad8 re16 fad fad8 re fad re
    fad re re'[re,] re' re,

    %103
    re' re,16 mi fad8 re fad re
    fad dod re[mi] fad mi16 re
    sol8 fad mi[fad] sol mi\mbreak

    %106
    la la fad4 r
    r8 la fad re re' re,
    sol si sol4 r

    %109
    r8 si sol mi mi' sol,
    la la re,[fad] re fad\mbreak
    sol, sol' mi[sol] mi sol

    %112
    la, la' fad[la] fad la
    si, si' sol[si] sol si
    dod, mi dod[mi] dod la'

    %115
    re, mi fad[sol] la la,
    re4 r r
    R2.*3

    %120
    r8 la' fad la fad la
    red, si' red,[si'] red, si'
    mi, sol mi[sol] mi sol

    %123
    dod, la' dod,[la'] dod, la'
    re, fad re[fad] re fad\mbreak
    sol, sol' mi[sol] mi sol

    %126
    la, la' fad[la] fad la
    si, si' sol[si] sol si
    dod, mi dod[la'] la, la'

    %129
    re, mi fad[sol] la4
    re,1~\mbreak
    re

    %132
    dod4. la8 mi'4. dod8
    sol'2~sol8. sol16 fad8.[mi16]
    fad2. re4

    %135
    sol~sol16 la si32 la sol fad mi4 ~mi16 fad sol32 fad mi re\mbreak
    dod8. la16 si8.[dod16] re8. re16 mi8.[fad16]
    sol2. sol4

    %138
    fad8. mi16 fad8.[sol16] la4 la,
    re r r re1\fermata

}

Ibcn = \relative do {

    re1~
    re
    re4.la8 fad'4. re8

    %4
    si'8. la16 sol [fad mi re] dod8. dod16 si8.[la16]
    re2 re'~\mbreak
    re8. re16 dod8.[si16] dod8. dod16 si8.[la16]

    %7
    si4. la8 sold4 mi
    la dod, r8 r16 la'[ la,8. la'16]
    re,4 re, r8 r16 si''[si,8. si'16]

    %10
    mi,4 mi, r8 r16 mi' mi,8. mi'16
    la,8. la'16 la,8.[la'16] si,8. sold'16 si,8.[sold'16]
    dod,8. la'16 dod,8.[la'16] re,8. si'16 re,8.[si'16]

    %13
    mi,8. re16 dod8. [re16] mi4 mi,
    la4. \senza \tuplet 3/2 { re'16 dod si } la8. sol16 fad8.[mi16] la,4 r r
    R2.*12

    %27
    r8 re' la la la la
    la re16 la fad8 fad fad fad
    fad la16 fad re8 re re re

    %30
    re mi fad[sol] la si16 do
    si8 sol16 la si8[dod!] re sol,
    la la, la'[la,] la' la,\mbreak

    %33
    la' la, la'[la,] la' la,
    la'4 r r
    R2.*3

    %38
    r8 la fad la fad la
    si, si' si, si' si, si'\mbreak
    mi, sol mi[sol] mi sol

    %41
    la, la' la,[la'] la, la'
    re, fad re[fad] re fad
    sol, sol' mi[sol] mi sol

    %44
    la, la' fad [la] fad la
    si, si' sol[si] sol si
    dod, mi dod[la'] la, la'

    %47
    re, mi fad[sol] la la,\mbreak
    re4 r r
    R2.*9

    %58
    r8 mi'\tu si si si si
    si mi16 si sold8 sold sold sold
    sold? si16 sold mi8 mi mi mi

    %61
    mi fad sold la si dod16 re\mbreak
    dod8 la, dod[la] dod la
    dod la  la'[mi] la mi

    %64
    la mi16 la dod8[la] dod la
    dod si la[si] la sol
    fad fad fad fad fad fad

    %67
    dod dod dod dod dod dod
    re re re re red red\mbreak
    mi4 r r

    %70
    R2.*3
    r8 mi dod mi dod mi
    fad, fad' fad,[fad'] fad, fad'\mbreak

    %75
    si, re si [re] si re
    mi, mi' mi, mi' mi, mi'
    la, dod16 si la8[la'] la, fad'

    %78
    si, re16 dod si8 [si'] si, sold'
    dod, mi16 re dod8[dod'] dod, la'
    re, fad16 mi re8[re'] re, si'

    %81
    mi, mi mi mi mi mi\mbreak
    mi mi\p mi mi  mi mi
    mi mi,\f mi[mi'] mi re

    %84
    dod si dod[la] mi' mi,
    la4 r r
    R2.*11

    %97
    r8 la'\tu mi mi mi mi
    mi la16 mi dod8 dod dod dod\mbreak
    dod mi16 dod la8 la la la

    %100
    la si dod re mi fad16 sol
    fad8 re16 fad fad8 re fad re
    fad re re'[re,] re' re,

    %103
    re' re,16 mi fad8 re fad re
    fad dod re[mi] fad mi16 re
    sol8 fad mi[fad] sol mi\mbreak

    %106
    la la fad4 r
    r8 la fad re re' re,
    sol si sol4 r

    %109
    r8 si sol mi mi' sol,
    la la re,[fad] re fad\mbreak
    sol, sol' mi[sol] mi sol

    %112
    la, la' fad[la] fad la
    si, si' sol[si] sol si
    dod, mi dod[mi] dod la'

    %115
    re, mi fad[sol] la la,
    re4 r r
    R2.*3

    %120
    r8 la' fad la fad la
    red, si' red,[si'] red, si'
    mi, sol mi[sol] mi sol

    %123
    dod, la' dod,[la'] dod, la'
    re, fad re[fad] re fad\mbreak
    sol, sol' mi[sol] mi sol

    %126
    la, la' fad[la] fad la
    si, si' sol[si] sol si
    dod, mi dod[la'] la, la'

    %129
    re, mi fad[sol] la4
    re,1~\mbreak
    re

    %132
    dod4. la8 mi'4. dod8
    sol'2~sol8. sol16 fad8.[mi16]
    fad2. re4

    %135
    sol~sol16 la si32 la sol fad mi4 ~mi16 fad sol32 fad mi re\mbreak
    dod8. la16 si8.[dod16] re8. re16 mi8.[fad16]
    sol2. sol4

    %138
    fad8. mi16 fad8.[sol16] la4 la,
    re r r re1\fermata

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \key re\major
    \time 2/2
    \tempo 2 = 50
    \repeat volta 2 {s1*13}
    \alternative {{s1}{\time 3/4 \tempo 2. = 40 s2.}}\break
    \set Score.currentBarNumber = #15
    \repeat volta 2 {
        s2.*115\break
        \time 2/2
        \tempo 2 = 50
        s1*9
    }
    \alternative {{\time 3/4 \tempo 2. = 40 s2.}{\time 2/2 s1}}
    \bar"|."

}

IflI = {
    \Iglobal
    \notypeset
    <<\IflIn \forma>>

}

IflII = {
    \Iglobal
    <<\IflIIn \forma>>

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

IvlaI = {
    \Iglobal
    %\clef soprano
    <<\IvlaIn \forma>>

}

IvlaII = {
    \Iglobal
    \clef alto
    <<\IvlaIIn \forma>>

}

Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    << \Ibcn \forma \Ibfn >>
    \typeset

}

IIglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
			}



IIflIn = \relative do'' {

    re4 la'
    \grace sol8 fad2-+ mi4
    re16(fad) sol(la) si8 la sol fad
    mi fad16(sol) la8 sol fad mi

    %4
    re mi16(fad) sol8 fad mi re
    dod4 r r
    sol'8. (la16) sol8.(la16) sol8.(la16)

    %7
    fad4 r r\mbreak
    la8.(si16) la8.(si16) la8.(si16)
    sold8 si16(la) sold8 fad mi fad

    %10
    re si'16(la) sold8 fad mi re
    dod mi16(re) dod8 si la sol
    fad re' dod4 si

    %13
    la8 dod16\solo(mi) la2~
    la8 re,16(fad) si2~\mbreak
    si8 si,16(dod) re8 re re re

    %16
    sold si,16(re) sold8 sold si sold
    la mi dod4 si
    la la' mi

    %19
    \grace re8 dod2-+ si4
    la16(dod) si(la) sol'8 sol sol sol
    fad16(re) dod(si) si'8 si si si

    %22
    lad16(dod,) si(lad) mi'8 mi mi mi\mbreak
    re4 r r
    sol8. (la16) sol8.(la16) sol8.(la16)

    %25
    sol4 r r
    fad8.(sol16) fad8.(sol16) fad8.(sol16)
    fad8 sol16(fad) mi8 re dod si'

    %28
    lad sold fad mi re dod
    si si' re,4 dod\mbreak
    si8 re16\solo(fad) si2~

    %31
    si8 dod,16(mi) la2~
    la8 si,16(re) sol2~
    sol8 la,16(dod) sol'8 fad16 mi fad8 mi16 re

    %34
    mi4 re la'
    fad2 mi4

    %36
    re16(fad) sol(la) si8 la sol fad
    mi fad16(sol) la8 sol fad mi\mbreak
    re mi16(fad) sol8 fad mi re

    %39
    dod4 r r
    sol'8. (la16) sol8.(la16) sol8.(la16)
    fad4 r r

    %42
    do'8.(re16) do8. (re16) do8.(re16)
    si8 re16(do) si8 la sol fad
    sol si16(la) sol8 fad mi re\mbreak

    %45
    mi sol16(fad) mi8 re dod si
    la la' fad4 mi
    re8 fad16\solo(la) re2~

    %48
    re8 fad,16\p (la) re2~
    re8  re,16\f(fad) si8 la sol fad
    sol fad16(mi) la8 sol fad mi

    %51
    fad8 re' fad,4 mi
    re

}

IIflIIn = \relative do'' {

    re4 la'
    \grace sol8 fad2-+ mi4
    re16(fad) sol(la) si8 la sol fad
    mi fad16(sol) la8 sol fad mi

    %4
    re mi16(fad) sol8 fad mi re
    dod4 r r
    sol'8. (la16) sol8.(la16) sol8.(la16)

    %7
    fad4 r r\mbreak
    la8.(si16) la8.(si16) la8.(si16)
    sold8 si16(la) sold8 fad mi fad

    %10
    re si'16(la) sold8 fad mi re
    dod mi16(re) dod8 si la sol
    fad re' dod4 si

    %13
    la8 dod16\solo(mi) la2~
    la8 re,16(fad) si2~\mbreak
    si8 si,16(dod) re8 re re re

    %16
    sold si,16(re) sold8 sold si sold
    la mi dod4 si
    la la' mi

    %19
    \grace re8 dod2-+ si4
    la16(dod) si(la) sol'8 sol sol sol
    fad16(re) dod(si) si'8 si si si

    %22
    lad16(dod,) si(lad) mi'8 mi mi mi\mbreak
    re4 r r
    sol8. (la16) sol8.(la16) sol8.(la16)

    %25
    sol4 r r
    fad8.(sol16) fad8.(sol16) fad8.(sol16)
    fad8 sol16(fad) mi8 re dod si'

    %28
    lad sold fad mi re dod
    si si' re,4 dod\mbreak
    si8 re16\solo(fad) si2~

    %31
    si8 dod,16(mi) la2~
    la8 si,16(re) sol2~
    sol8 la,16(dod) sol'8 fad16 mi fad8 mi16 re

    %34
    mi4 re la'
    fad2 mi4

    %36
    re16(fad) sol(la) si8 la sol fad
    mi fad16(sol) la8 sol fad mi\mbreak
    re mi16(fad) sol8 fad mi re

    %39
    dod4 r r
    sol'8. (la16) sol8.(la16) sol8.(la16)
    fad4 r r

    %42
    do'8.(re16) do8. (re16) do8.(re16)
    si8 re16(do) si8 la sol fad
    sol si16(la) sol8 fad mi re\mbreak

    %45
    mi sol16(fad) mi8 re dod si
    la la' fad4 mi
    re8 fad16\solo(la) re2~

    %48
    re8 fad,16\p (la) re2~
    re8  re,16\f(fad) si8 la sol fad
    sol fad16(mi) la8 sol fad mi

    %51
    fad8 re' fad,4 mi
    re

}

IIobIn = \relative do'' {

    re4 la'
    \grace sol8 fad2-+ mi4
    re16(fad) sol(la) si8 la sol fad
    mi fad16(sol) la8 sol fad mi

    %4
    re mi16(fad) sol8 fad mi re
    dod4 r r
    sol'8. (la16) sol8.(la16) sol8.(la16)

    %7
    fad4 r r\mbreak
    la8.(si16) la8.(si16) la8.(si16)
    sold8 si16(la) sold8 fad mi fad

    %10
    re si'16(la) sold8 fad mi re
    dod mi16(re) dod8 si la sol
    fad re' dod4 si

    %13
    la4 r8 dod16 \solo re mi8 re16 mi
    fad4 r8 red16 mi fad8 mi16 fad\mbreak
    sold8 si,16(dod) re8 re re re

    %16
    sold si,16(re) sold8 sold si sold
    la mi dod4 si
    la la' mi

    %19
    \grace re8 dod2-+ si4
    la16(dod) si(la) sol'8 sol sol sol
    fad16(re) dod(si) si'8 si si si

    %22
    lad16(dod,) si(lad) mi'8 mi mi mi\mbreak
    re4 r r
    sol8. (la16) sol8.(la16) sol8.(la16)

    %25
    sol4 r r
    fad8.(sol16) fad8.(sol16) fad8.(sol16)
    fad8 sol16(fad) mi8 re dod si'

    %28
    lad sold fad mi re dod
    si si' re,4 dod\mbreak
    si r8 fad'16\solo (mi) fad8[re]

    %31
    mi la r mi16(re) mi8 dod
    re sol r re16(dod) re8 si
    dod mi r mi fad mi16 re

    %34
    mi4 re la'
    fad2 mi4

    %36
    re16(fad) sol(la) si8 la sol fad
    mi fad16(sol) la8 sol fad mi\mbreak
    re mi16(fad) sol8 fad mi re

    %39
    dod4 r r
    sol'8. (la16) sol8.(la16) sol8.(la16)
    fad4 r r

    %42
    do'8.(re16) do8. (re16) do8.(re16)
    si8 re16(do) si8 la sol fad
    sol si16(la) sol8 fad mi re\mbreak

    %45
    mi sol16(fad) mi8 re dod si
    la la' fad4 mi
    re4 r8 sol16\solo la si8 la16 sol

    %48
    la8 fad16\p sol la8 sol16 la si8 la16 sol
    la8 re,16\f fad si8 la sol fad
    sol fad16 (mi) la8 sol fad mi

    %51
    fad la fad4 mi
    re

}

IIobIIn = \relative do'' {

    r4 r
    r la la
    la8 re re[do] re4~
    re8 re re[re] re dod!

    %4
    re re si4 si8 si
    la4 r r
    dod8 dod dod dod dod dod

    %7
    re4 r r\mbreak
    red8 red red red red red
    mi4 r r

    %10
    si r r
    la r mi
    fad8 fad16(sold) la4 sold

    %13
    la r8 la16\solo si dod8 si16 dod
    re4 r8 si16 dod red8 dod16 red\mbreak
    mi8 sold,16(la) si8 si si si

    %16
    si8 sold16(la) si8 si sold si
    la la la4 sold
    la r r

    %19
    r la sold
    la dod dod
    re re re

    %22
    dod lad lad\mbreak
    si r r
    si8 si si si si si

    %25
    dod4 r r
    la8 la la la si si
    si4. si8 dod4

    %28
    dod8 si lad sold16 lad si8 lad
    si4 si lad\mbreak
    si r8 re16\solo(dod) re8 si

    %31
    dod mi r dod16(si) dod8 la
    si re r si16(la) si8 sol
    la dod r dod re dod16 si

    %34
    dod4 r r
    r la la
    la8 re re[do] re4~

    %37
    re8 re re[re] re dod!\mbreak
    re re re4 si8 si
    la4 r r

    %40
    dod8 dod dod dod dod dod
    re4 r r
    la8 la la la re re

    %43
    re4 r8 re16 do si8 do
    re4 r8 dod! si la\mbreak
    si4 r8 si la mi

    %46
    la fad la4 la
    fad r8 mi'16\solo fad sol8 fad16 mi
    fad8 re16\p mi fad8 mi16 fad sol8 fad16 mi

    %49
    fad4 si, si
    si la la
    la8 la la4 la

    %52
    fad

}


IIvlIn = \relative do'' {

    re4 la'
    \grace sol8 fad2-+ mi4
    re16(fad) sol(la) si8 la sol fad
    mi fad16(sol) la8 sol fad mi

    %4
    re mi16(fad) sol8 fad mi re
    dod la16\solo(dod) mi8 la,16(re) fad8 la,16(mi')
    sol8.\tu (la16) sol8.(la16) sol8.(la16)

    %7
    fad8 la,16\solo(re) fad8 si,16(red) fad8 red16(fad)\mbreak
    la8.\tu(si16) la8.(si16) la8.(si16)
    sold8 si16(la) sold8 fad mi fad

    %10
    re si'16(la) sold8 fad mi re
    dod mi16(re) dod8 si la sol
    fad re' dod4 si

    %13
    la r r
    R2.\mbreak
    r8 si16\tu(dod) re8 re re re

    %16
    sold si,16(re) sold8 sold si sold
    la mi dod4 si
    la la' mi

    %19
    \grace re8 dod2-+ si4
    la16(dod) si(la) sol'8 sol sol sol
    fad16(re) dod(si) si'8 si si si

    %22
    lad16(dod,) si(lad) mi'8 mi mi mi\mbreak
    re si16\solo(re) fad8 re16(fad) si8 si,16(fad')
    sol8.\tu (la16) sol8.(la16) sol8.(la16)

    %25
    sol8 la,16\solo(dod) mi8 dod16(mi) la8 la,16(mi')
    fad8.\tu(sol16) fad8.(sol16) fad8.(sol16)
    fad8 sol16(fad) mi8 re dod si'

    %28
    lad sold fad mi re dod
    si si' re,4 dod\mbreak
    si r r

    %31
    R2.*3
    r4 re\tu la'
    fad2 mi4

    %36
    re16(fad) sol(la) si8 la sol fad
    mi fad16(sol) la8 sol fad mi\mbreak
    re mi16(fad) sol8 fad mi re

    %39
    dod la16\solo(dod) mi8 la,16(re) fad8 la,16(mi')
    sol8.\tu (la16) sol8.(la16) sol8.(la16)
    fad8 re16\solo(fad) la8 re,16(sol) si8 re,16(la')

    %42
    do8.\tu(re16) do8. (re16) do8.(re16)
    si8 re16(do) si8 la sol fad
    sol si16(la) sol8 fad mi re\mbreak

    %45
    mi sol16(fad) mi8 re dod si
    la la' fad4 mi
    re r r

    %48
    R2.
    r8 re16\tu(fad) si8 la sol fad
    sol fad16(mi) la8 sol fad mi

    %51
    fad re' fad,4 mi
    re

}

IIvlIIn = \relative do'' {

    re4 la'
    \grace sol8 fad2-+ mi4
    re16(fad) sol(la) si8 la sol fad
    mi fad16(sol) la8 sol fad mi

    %4
    re mi16(fad) sol8 fad mi re
    dod4 r r
    sol'8.\tu (la16) sol8.(la16) sol8.(la16)

    %7
    fad4 r r\mbreak
    la8.\tu(si16) la8.(si16) la8.(si16)
    sold8 si16(la) sold8 fad mi fad

    %10
    re si'16(la) sold8 fad mi re
    dod mi16(re) dod8 si la sol
    fad re' dod4 si

    %13
    la r r
    R2.\mbreak
    r8 si16\tu(dod) re8 re re re

    %16
    sold si,16(re) sold8 sold si sold
    la mi dod4 si
    la la' mi

    %19
    \grace re8 dod2-+ si4
    la16(dod) si(la) sol'8 sol sol sol
    fad16(re) dod(si) si'8 si si si

    %22
    lad16(dod,) si(lad) mi'8 mi mi mi\mbreak
    re4 r r
    sol8.\tu (la16) sol8.(la16) sol8.(la16)

    %25
    sol4 r r
    fad8.\tu(sol16) fad8.(sol16) fad8.(sol16)
    fad8 sol16(fad) mi8 re dod si'

    %28
    lad sold fad mi re dod
    si si' re,4 dod\mbreak
    si r r

    %31
    R2.*3
    r4 re\tu la'
    fad2 mi4

    %36
    re16(fad) sol(la) si8 la sol fad
    mi fad16(sol) la8 sol fad mi\mbreak
    re mi16(fad) sol8 fad mi re

    %39
    dod4 r r
    sol'8.\tu (la16) sol8.(la16) sol8.(la16)
    fad4 r r

    %42
    do'8.\tu(re16) do8. (re16) do8.(re16)
    si8 re16(do) si8 la sol fad
    sol si16(la) sol8 fad mi re\mbreak

    %45
    mi sol16(fad) mi8 re dod si
    la la' fad4 mi
    re r r

    %48
    R2.
    r8 re16\tu(fad) si8 la sol fad
    sol fad16(mi) la8 sol fad mi

    %51
    fad re' fad,4 mi
    re

}

IIvlaIn = \relative do'' {

    r4 r
    r la la
    la8 re re[do] re4~
    re8 re re[re] re dod!

    %4
    re re si4 si8 si
    la4 r r
    dod8 dod dod dod dod dod

    %7
    re4 r r\mbreak
    red8 red red red red red
    mi4 r r

    %10
    si r r
    la r mi
    fad8 fad16(sold) la4 sold

    %13
    la r r
    R2.\mbreak
    r8 sold16(la) si8 si si si

    %16
    si sold16(la) si8 si sold si
    la la la4 sold
    mi r r

    %19
    r la sold
    la dod dod
    re re re

    %22
    dod lad lad\mbreak
    si r r
    si8 si si si si si

    %25
    dod4 r r
    la8 la la la si si
    si4. si8 dod4

    %28
    dod8 si lad sold16 lad si8 lad
    si4 si lad\mbreak
    fad r r

    %31
    R2.*4
    r4 la la
    la8 re re[do] re4~

    %37
    re8 re re[re] re dod!\mbreak
    re re re4 si8 si
    la4 r r

    %40
    dod8 dod dod dod dod dod
    re4 r r
    la8 la la la re re

    %43
    re4 r8 re16 do si8 do
    re4 r8 dod! si la\mbreak
    si4 r8 si la mi

    %46
    la fad la4 la
    la r r
    R2.

    %49
    r4 si si
    si la la
    la8 la la4 la

    %52
    la

}

IIvlaIIn = \relative do' {

    r4 r
    r re dod
    re8 la' sol[fad] sol la
    si si la[la] la la

    %4
    la la sol4 sol8 sold
    mi4 r r
    mi8 mi mi mi la la

    %7
    la4 r r\mbreak
    fad8 fad fad fad si si
    si4 r r

    %10
    mi, r r
    mi r la,
    la8 re mi4 mi

    %13
    dod r r
    R2.\mbreak
    r4 r8 sold' sold sold

    %16
    mi4 r8 mi mi mi
    mi4 mi  mi
    dod r r

    %19
    r  mi mi
    mi la la
    la fad fad

    %22
    fad dod fad\mbreak
    fad r r
    mi8 mi mi mi mi mi

    %25
    mi4 r r
    re8 re re re fad fad
    si,4 mi8 fad sol4

    %28
    fad r8 dod re16[(mi) fad8]
    fad re fad4 fad\mbreak
    re r r

    %31
    R2.*4
    r4 re dod
    re8 la' sol[fad] sol la

    %37
    si si la4 la8 la\mbreak
    la la sol4 sol8 sold
    mi4 r r

    %40
    mi8 mi mi mi la la
    la4 r r
    fad8 fad fad fad fad fad

    %43
    sol4 r8 la re, do
    sol'4 r8 la si re,\mbreak
    si4 r8 mi mi dod!

    %46
    re re re4 dod
    fad r r
    R2.

    %49
    r4 fad red
    mi8 fad16(sol) mi4 dod
    re8 re re4 dod

    %52
    fad

}

IIfgn = \relative do {

    r4 r
    r re la'
    fad sol8 la si la
    sol fad16(mi) fad8 sol la sol

    %4
    fad mi16(re) mi8 fad sol mi
    la4 r r
    la,8 la la la la la

    %7
    re4 r r\mbreak
    si8 si si si si si
    mi4 r r

    %10
    sold r r
    la r dod,
    re8 si mi4 mi,

    %13
    la r8 la'\solo la, la'
    re,4 r8 si' si, si'\mbreak
    mi,4 r8 mi\tu mi mi

    %16
    mi4 r8 mi, mi' re
    dod4 mi mi,
    la r r

    %19
    r la' mi
    dod la la'
    re, re' si

    %22
    fad fad, fad'\mbreak
    si, r r
    mi8 mi mi  mi mi mi

    %25
    la,4 r r
    re8 re re re re re
    sol4. fad8 mi dod

    %28
    fad4 r8 fad, fad' mi
    re si fad'4 fad,\mbreak
    si4 r r

    %31
    R2.*4
    r4 re la'
    fad sol8 la si[la]

    %37
    sol fad16(mi) fad8 sol la sol\mbreak
    fad mi16 re mi8 fad sol mi
    la4 r r

    %40
    la,8 la la la la la
    re4 r r
    re8 re re re re re

    %43
    sol4 r8 fad sol la
    si4 r8 la sol fad\mbreak
    sol4 r8 sold la sol

    %46
    fad re la'4 la,
    re r r
    R2.

    %49
    r4 re si
    mi dod la
    re8 fad la4 la,

    %52
    re

}

IIbcn = \relative do {

    r4 r
    r re la'
    fad sol8 la si la
    sol fad16(mi) fad8 sol la sol

    %4
    fad mi16(re) mi8 fad sol mi
    la4 r r
    la,8 la la la la la

    %7
    re4 r r\mbreak
    si8 si si si si si
    mi4 r r

    %10
    sold r r
    la r dod,
    re8 si mi4 mi,

    %13
    la r r
    R2.
    r4 r8 mi'\tu mi mi

    %16
    mi4 r8 mi, mi' re
    dod4 mi mi,
    la r r

    %19
    r la' mi
    dod la la'
    re, re' si

    %22
    fad fad, fad'\mbreak
    si, r r
    mi8 mi mi  mi mi mi

    %25
    la,4 r r
    re8 re re re re re
    sol4. fad8 mi dod

    %28
    fad4 r8 fad, fad' mi
    re si fad'4 fad,\mbreak
    si4 r r

    %31
    R2.*4
    r4 re la'
    fad sol8 la si[la]

    %37
    sol fad16(mi) fad8 sol la sol\mbreak
    fad mi16 re mi8 fad sol mi
    la4 r r

    %40
    la,8 la la la la la
    re4 r r
    re8 re re re re re

    %43
    sol4 r8 fad sol la
    si4 r8 la sol fad\mbreak
    sol4 r8 sold la sol

    %46
    fad re la'4 la,
    re r r
    R2.

    %49
    r4 re si
    mi dod la
    re8 fad la4 la,

    %52
    re

}

IIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}


forma = {

\key re\major
\time 3/4
\tempo 2. = 40
\partial 2 s2
s2.*17
s4
\bar":..:"\break
s2
s2.*33
s4
\bar":|."
\mark\markup {\musicglyph #"scripts.ufermata"}

}

IIflI = {
	\IIglobal
	\notypeset
	<<\IIflIn \forma>>

}

IIflII = {
	\IIglobal
	<<\IIflIIn \forma>>

}

IIobI = {
	\IIglobal
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


IIvlaI = {
	\IIglobal
	<<\IIvlaIn \forma>>

}


IIvlaII = {
	\IIglobal
	\clef alto
	<<\IIvlaIIn \forma>>

}


IIfg = {
	\IIglobal
	\clef bass
	<<\IIfgn \forma>>

}


IIbc = {
	\IIglobal
	\clef bass
	<< \IIbcn \forma \IIbfn >>
	\typeset

}

IIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}


IIIflIn = \relative do'' {

    re4
    fad8(sol) la4 la re,
    sol8(la) si4 si re,
    la'4 re dod8(si) la(sol)

    %4
    fad(sol) la(sol) fad(mi) re(mi)
    la,4 dod mi sol
    sol fad8(mi) fad(mi) re(dod)

    %7
    si4 red fad la\mbreak
    la sold8(fad) sold(fad) mi(re)
    dod(re) mi4 mi mi

    %10
    dod8(mi) la4 la la
    dod, mi8(re) dod(si) la(sold)
    la2. re4 la2. la4

    %13
    dod8(re) mi4 mi la,
    re8(mi) fad4 fad la,
    mi' la sold8(fad) mi(re)\mbreak

    %16
    dod(si) la(si) dod(re) mi(fad)
    sol!4 mi dod mi
    mi re8(dod) si(dod) re(mi)

    %19
    fad4 re si si'
    si lad8(sold) fad(mi) re(dod)
    re(mi) fad4 fad fad

    %22
    re8(fad) si4 si si
    re, fad8(mi) re(dod) si(lad)
    si2 r\mbreak

    %25
    R1*3
    r4 si8(dod) re(mi) fad4
    sol sol sol sol

    %30
    sol si8(la) sol(fad) sol(mi)
    fad(sol) mi(fad) sol(fad) mi(re)\mbreak
    dod(re) mi4 r re

    %33
    fad8(sol) la4 la re,
    sol8(la) si4 si re,
    la' re dod8(si) la[(sol)]

    %36
    fad(sol) la(sol) fad(mi) re(mi)
    do4 fad la do,
    do? si8(la) sol(la) si(dod!)\mbreak

    %39
    re4 sold si re,
    re dod8(si) la(si) dod(re)
    mi(fad) sol4 sol sol

    %42
    dod,8(mi) la4 la la
    fad la8(sol) fad(mi) re(dod)
    re2. la4 re2.

}

IIIflIIn = \relative do'' {

     re4
    fad8(sol) la4 la re,
    sol8(la) si4 si re,
    la'4 re dod8(si) la(sol)

    %4
    fad(sol) la(sol) fad(mi) re(mi)
    la,4 dod mi sol
    sol fad8(mi) fad(mi) re(dod)

    %7
    si4 red fad la\mbreak
    la sold8(fad) sold(fad) mi(re)
    dod(re) mi4 mi mi

    %10
    dod8(mi) la4 la la
    dod, mi8(re) dod(si) la(sold)
    la2. re4 la2. la4

    %13
    dod8(re) mi4 mi la,
    re8(mi) fad4 fad la,
    mi' la sold8(fad) mi(re)\mbreak

    %16
    dod(si) la(si) dod(re) mi(fad)
    sol!4 mi dod mi
    mi re8(dod) si(dod) re(mi)

    %19
    fad4 re si si'
    si lad8(sold) fad(mi) re(dod)
    re(mi) fad4 fad fad

    %22
    re8(fad) si4 si si
    re, fad8(mi) re(dod) si(lad)
    si2 r\mbreak

    %25
    R1*3
    r4 si8(lad) si(dod) re4
    mi mi mi mi

    %30
    mi sol8 (fad) mi(re) mi(dod)
    re(mi) dod(re) si4 si
    la8 (si) dod4 r re

    %33
    fad8(sol) la4 la re,
    sol8(la) si4 si re,
    la' re dod8(si) la[(sol)]

    %36
    fad(sol) la(sol) fad(mi) re(mi)
    do4 fad la do,
    do? si8(la) sol(la) si(dod!)\mbreak

    %39
    re4 sold si re,
    re dod8(si) la(si) dod(re)
    mi(fad) sol4 sol sol

    %42
    dod,8(mi) la4 la la
    fad la8(sol) fad(mi) re(dod)
    re2. la4 re2.

}

IIIobIn = \relative do'' {

    re4
    fad8(sol) la4 la re,
    sol8(la) si4 si re,
    la'4 re dod8(si) la(sol)

    %4
    fad(sol) la(sol) fad(mi) re(mi)
    la,4 dod mi sol
    sol fad8(mi) fad(mi) re(dod)

    %7
    si4 red fad la\mbreak
    la sold8(fad) sold(fad) mi(re)
    dod(re) mi4 mi mi

    %10
    dod8(mi) la4 la la
    dod, mi8(re) dod(si) la(sold)
    la2. re4 la2. la4

    %13
    dod8(re) mi4 mi la,
    re8(mi) fad4 fad la,
    mi' la sold8(fad) mi(re)\mbreak

    %16
    dod(si) la(si) dod(re) mi(fad)
    sol!4 mi dod mi
    mi re8(dod) si(dod) re(mi)

    %19
    fad4 re si si'
    si lad8(sold) fad(mi) re(dod)
    re(mi) fad4 fad fad

    %22
    re8(fad) si4 si si
    re, fad8(mi) re(dod) si(lad)
    si2 r4 si\mbreak

    %25
    fad'4 fad fad fad
    fad mi8(re) dod(mi) re(dod)
    re(fad) mi(re) dod(mi) re(dod)

    %28
    re (dod) si4 r2
    R1*3
    r2 r4 re

    %33
    fad8(sol) la4 la re,
    sol8(la) si4 si re,
    la' re dod8(si) la[(sol)]

    %36
    fad(sol) la(sol) fad(mi) re(mi)
    do4 fad la do,
    do? si8(la) sol(la) si(dod!)\mbreak

    %39
    re4 sold si re,
    re dod8(si) la(si) dod(re)
    mi(fad) sol4 sol sol

    %42
    dod,8(mi) la4 la la
    fad la8(sol) fad(mi) re(dod)
    re2. la4 re2.

}

IIIobIIn = \relative do'' {

    la4
    re2 re
    re re
    re4 re mi mi

    %4
    re re r la
    dod dod dod dod
    la la r2

    %7
    red4 red red red\mbreak
    si4 si r si
    la8(si) dod4 dod dod

    %10
    la8(si) dod4 dod dod
    fad, fad fad dod
    dod2. la'4 dod,2. la'4

    %13
    la8(si) dod4 dod la
    la la2 la4
    la dod si8(la) sold[(si)]\mbreak

    %16
    la4 mi r2
    dod'4 dod dod dod
    dod si8(lad) si(lad) si(dod)

    %19
    re4 re8(mi) re4 re
    re dod8(si) lad(dod) si(lad)
    si(dod) re4 re re

    %22
    si8(dod) re4 re re
    si si si fad
    fad2 r4 si\mbreak

    %25
    re re re re
    re dod8(si) lad(dod) si(lad)
    si(re) dod(si) lad(dod) si(lad)

    %28
    si(lad) si4 r2
    R1*3
    r2 r4 la
    re2 re

    %34
    re re
    re4 re mi mi
    re re r la

    %37
    la la la la
    la sol8(fad) sol(fad) sol4\mbreak
    si4 si si si

    %40
    si la8(sold) la(sold) la(si)
    dod4 dod dod dod
    dod dod dod dod

    %43
    re re re la
    la2.  la4 la2.

}


IIIvlIn = \relative do'' {

    re4
    fad8(sol) la4 la re,
    sol8(la) si4 si re,
    la'4 re dod8(si) la(sol)

    %4
    fad(sol) la(sol) fad(mi) re(mi)
    la,4 dod mi sol
    sol fad8(mi) fad(mi) re(dod)

    %7
    si4 red fad la\mbreak
    la sold8(fad) sold(fad) mi(re)
    dod(re) mi4 mi mi

    %10
    dod8(mi) la4 la la
    dod, mi8(re) dod(si) la(sold)
    la2. re4 la2. la4

    %13
    dod8(re) mi4 mi la,
    re8(mi) fad4 fad la,
    mi' la sold8(fad) mi(re)\mbreak

    %16
    dod(si) la(si) dod(re) mi(fad)
    sol!4 mi dod mi
    mi re8(dod) si(dod) re(mi)

    %19
    fad4 re si si'
    si lad8(sold) fad(mi) re(dod)
    re(mi) fad4 fad fad

    %22
    re8(fad) si4 si si
    re, fad8(mi) re(dod) si(lad)
    si2 r\mbreak

    %25
    R1*7
    r2 r4 re

    %33
    fad8(sol) la4 la re,
    sol8(la) si4 si re,
    la' re dod8(si) la[(sol)]

    %36
    fad(sol) la(sol) fad(mi) re(mi)
    do4 fad la do,
    do? si8(la) sol(la) si(dod!)\mbreak

    %39
    re4 sold si re,
    re dod8(si) la(si) dod(re)
    mi(fad) sol4 sol sol

    %42
    dod,8(mi) la4 la la
    fad la8(sol) fad(mi) re(dod)
    re2. la4 re2.

}

IIIvlIIn = \relative do'' {

    re4
    fad8(sol) la4 la re,
    sol8(la) si4 si re,
    la'4 re dod8(si) la(sol)

    %4
    fad(sol) la(sol) fad(mi) re(mi)
    la,4 dod mi sol
    sol fad8(mi) fad(mi) re(dod)

    %7
    si4 red fad la\mbreak
    la sold8(fad) sold(fad) mi(re)
    dod(re) mi4 mi mi

    %10
    dod8(mi) la4 la la
    dod, mi8(re) dod(si) la(sold)
    la2. re4 la2. la4

    %13
    dod8(re) mi4 mi la,
    re8(mi) fad4 fad la,
    mi' la sold8(fad) mi(re)\mbreak

    %16
    dod(si) la(si) dod(re) mi(fad)
    sol!4 mi dod mi
    mi re8(dod) si(dod) re(mi)

    %19
    fad4 re si si'
    si lad8(sold) fad(mi) re(dod)
    re(mi) fad4 fad fad

    %22
    re8(fad) si4 si si
    re, fad8(mi) re(dod) si(lad)
    si2 r\mbreak

    %25
    R1*7
    r2 r4 re

    %33
    fad8(sol) la4 la re,
    sol8(la) si4 si re,
    la' re dod8(si) la[(sol)]

    %36
    fad(sol) la(sol) fad(mi) re(mi)
    do4 fad la do,
    do? si8(la) sol(la) si(dod!)\mbreak

    %39
    re4 sold si re,
    re dod8(si) la(si) dod(re)
    mi(fad) sol4 sol sol

    %42
    dod,8(mi) la4 la la
    fad la8(sol) fad(mi) re(dod)
    re2. la4 re2.

}

IIIvlaIn = \relative do'' {

    la4
    re2 re
    re re
    re4 re mi mi

    %4
    re re r la
    dod dod dod dod
    la la r2

    %7
    red4 red red red\mbreak
    si4 si r si
    la8(si) dod4 dod dod

    %10
    la8(si) dod4 dod dod
    fad, fad fad dod
    dod2. la'4 dod,2. la'4

    %13
    la8(si) dod4 dod la
    la la2 la4
    la dod si8(la) sold[(si)]\mbreak

    %16
    la4 mi r2
    dod'4 dod dod dod
    dod si8(lad) si(lad) si(dod)

    %19
    re4 re8(mi) re4 re
    re dod8(si) lad(dod) si(lad)
    si(dod) re4 re re

    %22
    si8(dod) re4 re re
    si si si fad
    fad2 r\mbreak

    %25
    R1*7
    r2 r4 la
    re2 re

    %34
    re re
    re4 re mi mi
    re re r la

    %37
    la la la la
    la sol8(fad) sol(fad) sol4\mbreak
    si4 si si si

    %40
    si la8(sold) la(sold) la(si)
    dod4 dod dod dod
    dod dod dod dod

    %43
    re re re la
    la2.  la4 la2.

}

IIIvlaIIn = \relative do' {

    fad4
    la8(sol) fad4 fad fad
    si8(la) sol4  sol si
    la fad8(sol) la4 la

    %4
    la fad8(sol) la(sol) fad(sol)
    mi4 mi mi mi
    mi re8(dod) re4 fad

    %7
    fad fad fad fad\mbreak
    mi mi8(red) mi(fad) sold4
    mi la r la

    %10
    mi mi r mi
    mi mi mi8(re) dod(si)
    dod2. fad4 dod2. dod4

    %13
    mi la la dod,
    fad8(mi) re4 re fad
    mi mi  mi mi\mbreak

    %16
    mi8(re) dod(re) mi(fad)dod(re)
    mi4 la fad fad
    fad fad r2

    %19
    si4 si fad fad
    fad fad r fad
    fad si r si

    %22
    fad fad r fad
    fad fad fad8(mi) re(dod)
    re2 r\mbreak

    %25
    R1*7
    r2 r4 fad
    la8(sol) fad4 fad fad

    %34
    si8(la) sol4 sol si
    la fad8(sol) la4 la
    la fad8(sol) la(sol) fad4

    %37
    re re re re
    re re r re\mbreak
    mi  mi mi mi

    %40
    mi mi r mi
    la la r la
    mi mi r la

    %43
    la la la8(sol) fad(mi)
    fad2. dod4 fad2.

}

IIIfgn = \relative do {

    re'4
    re,2 re'
    re, re'
    fad,4 re la' dod,

    %4
    re re, r fad'
    la la la la
    re, re' r2

    %7
    si4 si si si\mbreak
    mi, mi' r mi,
    la la, r la'

    %10
    la la, r la'
    la dod, mi mi,
    la la'8(si) la(sol) fad(mi) la,4 la dod mi

    %13
    la2 la,
    la' la,
    dod4 la mi' mi,\mbreak

    %16
    la la' r2
    la,4 la lad fad
    si si' r2

    %19
    si,4 si re si
    fad fad' r fad
    si, si' r si

    %22
    si, si' r si
    si, re fad fad,
    si' fad si, r\mbreak

    %25
    r4 si'\solo re si
    fad fad' r fad
    si, re, fad fad,

    %28
    si\p si' r si
    mi, mi' sol, mi'
    dod la r la,

    %31
    re re' sol, sol,\mbreak
    la4 la'8\tu (si) la(sol) fad(mi)
    re2 re'

    %34
    re, re'
    fad,4 re la' dod,
    re re, r re''

    %37
    fad, re fad re
    sol sol, r sol'\mbreak
    sold mi sold mi

    %40
    la la, r la'
    la, la' r la
    la, la' r la,

    %43
    re fad la la,
    re la re, mi' re2.

}

IIIbcn = \relative do {

    re'4
    re,2 re'
    re, re'
    fad,4 re la' dod,

    %4
    re re, r fad'
    la la la la
    re, re' r2

    %7
    si4 si si si\mbreak
    mi, mi' r mi,
    la la, r la'

    %10
    la la, r la'
    la dod, mi mi,
    la la'8(si) la(sol) fad(mi) la,4 la dod mi

    %13
    la2 la,
    la' la,
    dod4 la mi' mi,\mbreak

    %16
    la la' r2
    la,4 la lad fad
    si si' r2

    %19
    si,4 si re si
    fad fad' r fad
    si, si' r si

    %22
    si, si' r si
    si, re fad fad,
    si' fad si, r\mbreak

    %25
    R1*7
    r4 la'8\tu (si) la(sol) fad(mi)
    re2 re'

    %34
    re, re'
    fad,4 re la' dod,
    re re, r re''

    %37
    fad, re fad re
    sol sol, r sol'\mbreak
    sold mi sold mi

    %40
    la la, r la'
    la, la' r la
    la, la' r la,

    %43
    re fad la la,
    re la re, mi' re2.

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \key re\major
    \time 2/2
    \tempo 1 = 55
    \partial 4 s4
    \repeat volta 2 {s1*11}
    \alternative {{s1}{s}}\break
    \set Score.currentBarNumber = #13
    \repeat volta 2 {s1*31}
    \alternative {{s1}{s2.}}
    \bar"|."

}

IIIflI = {
    \IIIglobal
    \notypeset
    <<\IIIflIn \forma>>

}

IIIflII = {
    \IIIglobal
    <<\IIIflIIn \forma>>

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


IIIvlaI = {
    \IIIglobal
    <<\IIIvlaIn \forma>>

}


IIIvlaII = {
    \IIIglobal
    \clef alto
    <<\IIIvlaIIn \forma>>

}


IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma>>

}


IIIbc = {
    \IIIglobal
    \clef bass
    << \IIIbcn \forma \IIIbfn >>
    \typeset

}

IVglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}



IVflIn = \relative do'' {

    r4
    R1
    r4 fad8 sol  la4 re,
    R1

    %4
    r4 fad8 sol la4 fad
    sol sol8 la si4 sol
    la si8 dod re4 re,\mbreak

    %7
    si'8(do) si[(la)] sol(fad) mi[(re')]
    dod!4 si8(dod) la(dod) si(la)
    sold4 sold8 la sold4 sold

    %10
    sold? sold8 la si4 sold!
    la4. fad8 sold2
    la2. mi4\mbreak

    %13
    sol! fad fad  mi8 re
    mi4 la, la mi'\p
    sol fad fad mi8 re

    %16
    mi2 r4 lad\f
    lad?(si) r si8 la
    sol4 dod r8 si lad si

    %19
    lad4 lad lad8(dod) si(lad)
    si(lad) si(sol!) lad fad sold lad
    si4. sol!8 lad4. si8

    %22
    si2 r
    R1
    r2 r4 sol~

    %25
    sol si2 sol4~
    sol fad8 mi fad4 r
    R1

    %28
    r4 fad8 sol la4 re,
    R1\mbreak
    r4 fad8 sol la4 re

    %31
    si sol8 la si4 mi
    dod si8 dod la4 sol
    fad sol8(la) sol(mi) fad(sol)

    %34
    fad4 sol8(la) si(la) si(dod)
    re4. si8 la2
    re2. re2.\fermata

}

IVflIIn = \relative do'' {

    r4
    R1
    r4 re8 mi fad4 re
    R1

    %4
    r4 re8 mi fad4 la
    r dod,8 mi sol4 si
    r re,8 mi fad4 la\mbreak

    %7
    re, si si sol'8 fad
    mi4 re8(mi) dod(mi) re(dod)
    si4 si8 dod si4 si

    %10
    si mi r mi
    mi4. fad8 si,2
    dod2. dod4\mbreak

    %13
    mi re re dod8 si
    dod4 la la dod\p
    mi re re dod8 si

    %16
    dod2 r4 fad\f
    fad8(sol) fad4 r re8 dod
    si4 sol' r dod,

    %19
    dod fad fad8(sol) fad4
    fad8(mi) re(mi) fad4 fad\mbreak
    fad sol fad4. dod8

    %22
    re2 r
    R1
    r2 r4 mi~

    %25
    mi sol2 mi4~
    mi re8 dod re4 r
    R1

    %28
    r4 re8 mi fad4 re
    R1\mbreak
    r4 re8 mi fad4 la

    %31
    la sol8 fad mi4 si'
    la mi2 mi4
    re dod dod8(mi) re(dod)

    %34
    re2 r4 re8 mi
    fad4 si8(sol) mi2
    fad2.   fad2.

}

IVobIn = \relative do'' {

    la4
    do si si la8 sol
    la4 re, re la'\p
    do si si la8 sol

    %4
    la2 r4 re\f
    re-+ (dod!) r mi
    mi-+(re) r fad\mbreak

    %7
    fad mi8(fad) sol(la) si4
    dod, la' r fad8(mi)
    re4 re8 dod re4 fad

    %10
    re si'8(la) sold(fad) mi(re)
    dod4. re8 si2
    la2. r4\mbreak

    %13
    R1
    r4 dod8 re mi4 la,\p
    R1

    %16
    r4 dod8 re mi4 mi\f
    mi re8 mi fad4 fad
    fad mi8 fad sol4 sol

    %19
    fad mi8 re dod(mi) re(dod)
    re(dod) re(si) dod4 fad\mbreak
    re4. dod8 dod4. si8

    %22
    si2 r4 re4~
    re fad2 re4~
    re dod8 si dod4 r

    %25
    R1
    r2 r4 la
    do si si la8 sol

    %28
    la4 re, re la'\p
    do si si la8 sol\mbreak
    la2 r4 fad'\f

    %31
    fad mi8 fad sol4 sol8 fad
    mi4 re8(mi) dod(mi) re(dod)
    re4 mi8(fad) mi(dod) re(mi)

    %34
    re4 mi8(fad) sol(si) la(sol)
    fad4. sol8 mi2
    re2. re2.\fermata

}

IVobIIn = \relative do'' {

    fad,4
    la sol sol fad8 mi
    fad4 re re fad\p
    la sol sol fad8 mi

    %4
    fad2 r4 la\f
    sol dod r dod
    la re r re\mbreak

    %7
    si mi si si
    la la r si
    si mi, mi re'

    %10
    re8(dod) si4 r si
    la si si mi,
    mi2. r4

    %13
    R1
    r4 la8 si dod4 la\p
    R1

    %16
    r4 la8 si dod4 dod\f
    dod si8 dod re4 re
    re dod8 re mi4 mi8 re

    %19
    dod4 dod8 re mi4 mi
    re8(mi) fad(sol) dod,4 dod\mbreak
    si dod dod fad,

    %22
    fad2 r4 si~
    si re2 si4~
    si la8 sol la4 r

    %25
    R1
    r2 r4 fad
    la sol sol fad8 mi

    %28
    fad4 re re fad\p
    la sol sol fad8 mi\mbreak
    fad2 r4 re'\f

    %31
    re si mi mi
    mi la,2 la4
    la la r la

    %34
    la re r fad8 sol
    re4 mi  mi la,
    la2. la\fermata

}

IVfgn = \relative do {

    re'4
    re,2 re'
    re, r4 re'\p
    re,2 re'

    %4
    re,  r4 re\f
    mi4 mi, r mi'
    fad fad, r fad'\mbreak

    %7
    sol4 sol8 fad mi4 sol
    la la, r re
    mi mi mi mi

    %10
    mi  mi, r mi'
    la re mi mi,
    la mi la, la'\mbreak

    %13
    la,2 la'
    la, r4 la'\p
    la,2 la'

    %16
    la,2 r4 fad\f
    si si' r si,
    mi mi' r mi,

    %19
    fad fad, fad fad'
    si, si' fad fad,\mbreak
    si mi fad fad,

    %22
    si' fad si, r
    si'2 sold4 mi
    la la, r2

    %25
    la' dod,4 la'
    re, re, r re''
    re,2 re'

    %28
    re,2 r4 re'\p
    re,2 re'\mbreak
    re, r4 re\f

    %31
    sol sol, r mi'
    la la, la la'
    re, la' r la,

    %34
    re re' r8 sol, fad mi
    re4 sol la la,
    re la re,  re'2.\fermata



}


forma = {

    \key re\major
    \time 2/2
    \tempo 1 = 55
    \partial 4 s4
    s1*11
    s2. \break \bar":..:"
    \repeat volta 2{s4
    s1*23}
    \alternative {{\set Score.measureLength = #(ly:make-moment 3 4) s2.}{s2.}}
    \bar"|."

}

IVflI = {
    \IVglobal
    \notypeset
    <<\IVflIn \forma>>

}

IVflII = {
    \IVglobal
    <<\IVflIIn \forma>>

}

IVobI = {
    \IVglobal
    <<\IVobIn \forma>>

}

IVobII = {
    \IVglobal
    <<\IVobIIn \forma>>

}


IVfg = {
    \IVglobal
    \clef bass
    <<\IVfgn \forma>>
    \typeset

}

Vglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}



VflIn = \relative do'' {

    fad8(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\p(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\f(sol16 la) sol8(fad) mi(re)

    %4
    dod(re) mi2
    la8 dod, red(dod16 si) la'8(sol16 fad)
    sol8(fad16 mi) r4 r

    %7
    sol8 si, dod(si16 la) sol'8(fad16 mi)\mbreak
    fad8 (mi16 re) r4 r
    fad8(mi16 re) fad8 fad la dod,

    %10
    re(dod16 si) mi8 mi sol[si,]
    dod(si16 la) re8(dod16 si) mi8(re16 dod)
    fad8 mi16 (re) dod4. re8

    %13
    re4 r r   %%%%%% fine ripresa
    R2.*3
    r8 la\tu mi'(fad16 sol) fad8(sol16 la)
    dod,8 (si16 la) r4 r

    %19
    r8 la mi'(fad16 sol) fad8(sol16 mi)
    fad8(mi16 re) sol8(fad16 mi) la8(sol16 fad)
    si8 mi dod4. re8

    %22
    re4 r r
    R2.
    r4 si8\soli(do16 re) re8 si

    %25
    sol la16(fad) sol4.-+ la8
    fad(sol16 la) la8(sol16 fad) fad8(mi16 re)
    sold2 sold8(la16 si)

    %28
    la2.~
    la8 sol fad mi16 fad sol8 fad\mbreak
    mi2.

    %31
    fad8(mi16 re) si'8 fad la[si,]
    sold'(fad16 mi) si'2~
    si8 la16 sold la8 dod si la

    %34
    sold mi si[mi] sold,(la16 si)
    mi,8 mi'16(sold) la8 si16(dod) si(dod) la8\mbreak
    sold16(la) fad8 mi16(fad) re8 dod16(re) si8

    %37
    dod8\tu(re16 mi) la,8(si16 dod) si8(dod16 re)
    dod8\p (re16 mi) la,8(si16 dod) si8(dod16 re)
    dod8\f(re16 mi) re8[dod] si la'

    %40
    sold fad mi2
    la8 mi mi(fad16 sol!) sol8(fad16 mi)\mbreak
    fad8(mi16 re) r4 r

    %43
    fad8(mi16 re) fad8(sol16 la) la8(sold16 fad)
    sold8(fad16 mi) r4 r
    sold8(fad16 mi) la8 mi dod'[mi,]

    %46
    fad8(mi16 re) sold8[re] si' re,
    mi(re16 dod) fad8 dod la'[dod,]\mbreak
    re8(dod16 si) mi8 si sold'[si,]

    %49
    dod(si16 la) si8 mi, re'(dod16 si)
    dod8(si16 la) sold'8(fad16 mi) si'8(la16 sold)
    la8 la, dod4 si

    %52
    la2 r4
    R2.*2\mbreak
    r8 mi'16 fad sold8[la] si la

    %56
    sold sold16 la si8[dod] re dod
    si16 la sold la si la sold la si dod la si
    dod8 la r8 la, la'16(si) la8

    %59
    la4. la,8 la'16(si) la8
    fad4. fad,8 fad'16(sol) fad8\mbreak
    mi mi, r4 r

    %62
    mi'16 re dod re mi re mi fad sol fad sol mi
    fad8 re r4 r
    si'16 do re do si do si la si re si la

    %65
    sol la si la sol la sol fad sol si sol fad
    mi8 la, la'16(si la8) la16(si la8)
    fad8(sol16 la) re,8(mi16 fad) mi8(fad16 sol)

    %68
    fad8\p(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\f(sol16 la) sol8(fad) mi(re)
    dod(re) mi2

    %71
    la8 dod, red(dod16 si) la'8(sol16 fad)
    sol8(fad16 mi) r4 r
    sol8 si, dod(si16 la) sol'8(fad16 mi)\mbreak

    %74
    fad8 (mi16 re) r4 r
    fad8(mi16 re) fad8 fad la dod,
    re(dod16 si) mi8 mi sol[si,]

    %77
    dod(si16 la) re8(dod16 si) mi8(re16 dod)
    fad8 mi16 (re) dod4. re8
    re4\fermata r r

}

VflIIn = \relative do'' {

    fad8(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\p(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\f(sol16 la) sol8(fad) mi(re)

    %4
    dod(re) mi2
    la8 dod, red(dod16 si) la'8(sol16 fad)
    sol8(fad16 mi) r4 r

    %7
    sol8 si, dod(si16 la) sol'8(fad16 mi)\mbreak
    fad8 (mi16 re) r4 r
    fad8(mi16 re) fad8 fad la dod,

    %10
    re(dod16 si) mi8 mi sol[si,]
    dod(si16 la) re8(dod16 si) mi8(re16 dod)
    fad8 mi16 (re) dod4. re8

    %13
    re4 r r   %%%%%% fine ripresa
    R2.*3
    r8 la mi'(fad16 sol) fad8(sol16 la)
    dod,8 (si16 la) r4 r

    %19
    r8 la mi'(fad16 sol) fad8(sol16 mi)
    fad8(mi16 re) sol8(fad16 mi) la8(sol16 fad)
    si8 mi dod4. re8

    %22
    re4 r r
    R2.*14

    %37
    dod,8(re16 mi) la,8(si16 dod) si8(dod16 re)
    dod8\p (re16 mi) la,8(si16 dod) si8(dod16 re)
    dod8\f(re16 mi) re8[dod] si la'

    %40
    sold fad mi2
    la8 mi mi(fad16 sol!) sol8(fad16 mi)\mbreak
    fad8(mi16 re) r4 r

    %43
    fad8(mi16 re) fad8(sol16 la) la8(sold16 fad)
    sold8(fad16 mi) r4 r
    sold8(fad16 mi) la8 mi dod'[mi,]

    %46
    fad8(mi16 re) sold8[re] si' re,
    mi(re16 dod) fad8 dod la'[dod,]\mbreak
    re8(dod16 si) mi8 si sold'[si,]

    %49
    dod(si16 la) si8 mi, re'(dod16 si)
    dod8(si16 la) sold'8(fad16 mi) si'8(la16 sold)
    la8 la, dod4 si

    %52
    la2 r4
    R2.*2\mbreak
    r8 sold16 la si8dod re dod

    %56
    si mi16 fad sold8[la] si la
    sold16 fad mi fad sold fad mi fad sold la fad sold
    la8 dod, r8 la la'16(si) la8

    %59
    la4. la,8 la'16(si) la8
    fad4. fad,8 fad'16(sol) fad8\mbreak
    mi mi, r4 r

    %62
    dod'16 si la si dod si dod re mi re mi dod
    re8 fad, r4 r
    sol'16 la si la sol la sol fad sol si sol fad

    %65
    mi fad sol fad mi fad mi re mi sol mi re
    dod8 la la'16(si la8) la16(si la8)
    fad8(sol16 la) re,8(mi16 fad) mi8(fad16 sol)

    %68
    fad8\p(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\f(sol16 la) sol8(fad) mi(re)
    dod(re) mi2

    %71
    la8 dod, red(dod16 si) la'8(sol16 fad)
    sol8(fad16 mi) r4 r
    sol8 si, dod(si16 la) sol'8(fad16 mi)\mbreak

    %74
    fad8 (mi16 re) r4 r
    fad8(mi16 re) fad8 fad la dod,
    re(dod16 si) mi8 mi sol[si,]

    %77
    dod(si16 la) re8(dod16 si) mi8(re16 dod)
    fad8 mi16 (re) dod4. re8
    re4\fermata r r

}

VobIn = \relative do'' {

    fad8(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\p(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\f(sol16 la) sol8(fad) mi(re)

    %4
    dod(re) mi2
    la8 dod, red(dod16 si) la'8(sol16 fad)
    sol8(fad16 mi) si'8\solo(la16 sol) la8(sol16 fad)

    %7
    sol8 si,\tu dod(si16 la) sol'8(fad16 mi)\mbreak
    fad8 (mi16 re) la'8\solo(sol16 fad) sol8(fad16 mi)
    fad8\tu(mi16 re) fad8 fad la dod,

    %10
    re(dod16 si) mi8 mi sol[si,]
    dod(si16 la) re8(dod16 si) mi8(re16 dod)
    fad8 mi16 (re) dod4. re8

    %13
    re4 r r   %%%%%% fine ripresa
    R2.*3
    r8 la mi'(fad16 sol) fad8(sol16 la)

    %18
    dod,8 (si16 la) mi'8\solo(fad16 sol) fad8(sol16 la)
    dod,8(si16 la) mi'8(fad16 sol) fad8(sol16 mi)
    fad8(mi16 re) sol8(fad16 mi) la8(sol16 fad)

    %21
    si8 sol mi4. re8
    re4 r r\mbreak
    r re8\solo(mi16 fad) fad8 re

    %24
    si do16(la) si4 la8. re16
    si4 la4. re8
    la(sol16 fad) fad8(mi16 re) re8(mi16 fad)

    %27
    si2 si4
    la8(si16 dod)mi8(re16 dod) sol'8(fad16 mi)
    fad8 mi re dod16 re mi8 re\mbreak

    %30
    dod dod mi[la] dod,(re16 mi)
    la,8(sol16 fad) fad'2~
    fad8 si, mi8(re16 dod) re8(dod16 si)

    %33
    dod8 la dod[mi] re dod
    si4 si'2~
    si8 mi,16(fad) mi8 mi re16(mi) dod8\mbreak

    %36
    si16(dod) la8 sold si la16(si) sold8
    dod8\tu(re16 mi) la,8(si16 dod) si8(dod16 re)
    dod8\p (re16 mi) la,8(si16 dod) si8(dod16 re)
    dod8\f(re16 mi) re8[dod] si la'

    %40
    sold fad mi2
    la8 mi mi(fad16 sol!) sol8(fad16 mi)\mbreak
    fad8(mi16 re) la'8\solo(sol16 fad) sol8(fad16 mi)

    %43
    fad8\tu(mi16 re) fad8(sol16 la) la8(sold16 fad)
    sold8(fad16 mi)  si'8\solo(la16 sold) la8(sold16 fad)
    sold8\tu(fad16 mi) la8 mi dod'[mi,]

    %46
    fad8(mi16 re) sold8[re] si' re,
    mi(re16 dod) fad8 dod la'[dod,]\mbreak
    re8(dod16 si) mi8 si sold'[si,]

    %49
    dod(si16 la) si8 mi, re'(dod16 si)
    dod8(si16 la) sold'8(fad16 mi) si'8(la16 sold)
    la8 la, dod4 si

    %52
    la8 dod16\solo re mi8 la mi[la]
    mi re16 dod re8 fad re[si']
    re, dod16 si dod8 mi dod[la']\mbreak

    %55
    dod,8(si) r mi, mi'16(fad) mi8
    mi mi, r4 r
    R2.

    %58
    mi'16 re dod re mi re dod re mi fad re mi
    fad la sol la fad la sol la fad sol mi fad
    re fad mi fad re fad mi fad re mi dod re\mbreak

    %61
    si la sold la si la si dod re dod re si
    dod8 la r4 r
    fad'16 mi re mi fad mi fad sol la sol la fad

    %64
    si8 \once\stemUp sol, r4 r
    sol'8 mi r4 r
    mi16 re dod re mi re mi fad sol fad sol mi

    %67
    fad8(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\p(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\f(sol16 la) sol8(fad) mi(re)

    %70
    dod(re) mi2
    la8 dod, red(dod16 si) la'8(sol16 fad)
    sol8(fad16 mi) si'8\solo(la16 sol) la8(sol16 fad)

    %73
    sol8 re\tu dod(si16 la) sol'8(fad16 mi)\mbreak
    fad8 (mi16 re) la'8\solo(sol16 fad) sol8(fad16 mi)
    fad8\tu(mi16 re) fad8 fad la dod,

    %76
    re(dod16 si) mi8 mi sol[si,]
    dod(si16 la) re8(dod16 si) mi8(re16 dod)
    fad8 mi16 (re) dod4. re8

    %79
    re4\fermata r r

}

VobIIn = \relative do'' {

    re4 re dod8(re16 mi)
    re4\p re dod8(re16 mi)
    re4\f re si

    %4
    la8(si) dod2
    dod4 si red
    mi sol8\solo(fad16 mi) fad8(mi16 red)

    %7
    mi8\tu si la4 dod\mbreak
    re fad8\solo(mi16 re) mi8(re16 dod)
    re8\tu la la4 la

    %10
    fad si si
    la la la
    la8 sol16(fad) mi4. fad8

    %13
    fad4 r r %% ripresa
    R2.*3
    r4 la la

    %18
    la r r
    r la la
    la2 re4

    %21
    re8 si dod4 la
    la r r\mbreak
    R2.*14

    %37
    la4 la sold8(la16 si)
    la4\p la sold8(la16 si)
    la4\f la si

    %40
    si8 la sold2
    la4 la la\mbreak
    la fad'8\solo(mi16 re) mi8(re16 dod)

    %43
    re4\tu si si
    si sold'8\solo(fad16 mi) fad8(mi16 red)
    mi4\tu mi mi

    %46
    re! re re
    dod dod dod\mbreak
    si si si

    %49
    la si sold
    la si8(la16 sold) sold8(la16 si)
    la4 la sold

    %52
    la8 la16\solo si dod8 dod dod dod
    dod si16 la si8 re si[re]
    si la16 sold la8 dod la[dod]\mbreak

    %55
    la(sold) r4 r
    r r8 mi mi'16(fad) mi8
    mi mi, r4 r

    %58
    dod'16 si la si dod si la si dod re si dod
    re fad mi fad re fad mi fad re mi dod re
    si re dod re si re dod re si dod la si\mbreak

    %61
    sold fad mi fad sold fad sold la si la si sold
    la8 mi r4 r
    re'16 mi fad  mi re dod re mi fad mi fad re

    %64
    sol8 sol, r4 r
    mi'8 si r4 r
    dod16 si la si dod si dod re mi re mi dod\mbreak

    %67
    re4 re dod8(re16 mi)
    re4\p re dod8(re16 mi)
    re4\f re si

    %70
    la8(si) dod2
    dod4 si red
    mi sol8\solo(fad16 mi) fad8(mi16 red)

    %73
    mi8\tu si la4 dod\mbreak
    re fad8\solo(mi16 re) mi8(re16 dod)
    re8\tu la la4 la

    %76
    fad si si
    la la la
    la8 sol16(fad) mi4. fad8

    %79
    fad4\fermata r r

}


VvlIn = \relative do'' {

    fad8(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\p(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\f(sol16 la) sol8(fad) mi(re)

    %4
    dod(re) mi2
    la8 dod, red(dod16 si) la'8(sol16 fad)
    sol8(fad16 mi) r4 r

    %7
    sol8 si, dod(si16 la) sol'8(fad16 mi)\mbreak
    fad8 (mi16 re) r4 r
    fad8(mi16 re) fad8 fad la dod,

    %10
    re(dod16 si) mi8 mi sol[si,]
    dod(si16 la) re8(dod16 si) mi8(re16 dod)
    fad8 mi16 (re) dod4. re8

    %13
    re4 fad\solo la   %%%%%% fine ripresa
    re  dod8(si) la(sol)
    fad(si) la[(sol)] fad(mi)\mbreak

    %16
    re si'16(la) sol8(fad) mi(re)
    dod la\tu mi'(fad16 sol) fad8(sol16 la)
    dod,8 (si16 la) r4 r

    %19
    r8 la mi'(fad16 sol) fad8(sol16 mi)
    fad8(mi16 re) sol8(fad16 mi) la8(sol16 fad)
    si8 sol mi4. re8

    %22
    re4 fad8\solo(sol16 la) la8 fad\mbreak
    re mi16(dod) re2~
    re2.~

    %25
    re8. si16 dod4. dod8
    re2 r4
    mi8(fad16 sold) si8(la16 sold) mi8(fad16 sold)

    %28
    la,2.~
    la2 si'4~\mbreak
    si8 mi, la(sol16 fad) sol8(fad16 mi)

    %31
    fad8 re, r4 r
    R2.
    r4 r fad'~

    %34
    fad8 mi16 (red) mi8 re16(dod) re8 dod16(si)
    dod8 re16(si) dod8[la] re, si\mbreak
    mi mi mi[mi] mi mi

    %37
    dod'8\tu(re16 mi) la,8(si16 dod) si8(dod16 re)
    dod8\p (re16 mi) la,8(si16 dod) si8(dod16 re)
    dod8\f(re16 mi) re8[dod] si la'

    %40
    sold fad mi2
    la8 mi mi(fad16 sol!) sol8(fad16 mi)\mbreak
    fad8(mi16 re) r4 r

    %43
    fad8(mi16 re) fad8(sol16 la) la8(sold16 fad)
    sold8(fad16 mi) r4 r
    sold8(fad16 mi) la8 mi dod'[mi,]

    %46
    fad8(mi16 re) sold8[re] si' re,
    mi(re16 dod) fad8 dod la'[dod,]\mbreak
    re8(dod16 si) mi8 si sold'[si,]

    %49
    dod(si16 la) si8 mi, re'(dod16 si)
    dod8(si16 la) sold'8(fad16 mi) si'8(la16 sold)
    la8 la, dod4 si

    %52
    la r  r
    R2.*14
    fad'8(sol16 la) re,8(mi16 fad) mi8(fad16 sol)

    %68
    fad8\p(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\f(sol16 la) sol8(fad) mi(re)
    dod(re) mi2

    %71
    la8 dod, red(dod16 si) la'8(sol16 fad)
    sol8(fad16 mi) r4 r
    sol8 si, dod(si16 la) sol'8(fad16 mi)\mbreak

    %74
    fad8 (mi16 re) r4 r
    fad8(mi16 re) fad8 fad la dod,
    re(dod16 si) mi8 mi sol[si,]

    %77
    dod(si16 la) re8(dod16 si) mi8(re16 dod)
    fad8 mi16 (re) dod4. re8
    re4\fermata r r

}

VvlIIn = \relative do'' {

    fad8(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\p(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\f(sol16 la) sol8(fad) mi(re)

    %4
    dod(re) mi2
    la8 dod, red(dod16 si) la'8(sol16 fad)
    sol8(fad16 mi) r4 r

    %7
    sol8 si, dod(si16 la) sol'8(fad16 mi)\mbreak
    fad8 (mi16 re) r4 r
    fad8(mi16 re) fad8 fad la dod,

    %10
    re(dod16 si) mi8 mi sol[si,]
    dod(si16 la) re8(dod16 si) mi8(re16 dod)
    fad8 mi16 (re) dod4. re8

    %13
    re4 fad\solo la   %%%%%% fine ripresa
    re  dod8(si) la(sol)
    fad(si) la[(sol)] fad(mi)\mbreak

    %16
    re si'16(la) sol8(fad) mi(re)
    dod la\tu mi'(fad16 sol) fad8(sol16 la)
    dod,8 (si16 la) r4 r

    %19
    r8 la mi'(fad16 sol) fad8(sol16 mi)
    fad8(mi16 re) sol8(fad16 mi) la8(sol16 fad)
    si8 sol mi4. re8

    %22
    re4 fad8\solo(sol16 la) la8 fad\mbreak
    re mi16(dod) re2~
    re2.~

    %25
    re8. si16 dod4. dod8
    re2 r4
    mi8(fad16 sold) si8(la16 sold) mi8(fad16 sold)

    %28
    la,2.~
    la2 si'4~\mbreak
    si8 mi, la(sol16 fad) sol8(fad16 mi)

    %31
    fad8 re, r4 r
    R2.
    r4 r fad'~

    %34
    fad8 mi16 (red) mi8 re16(dod) re8 dod16(si)
    dod8 re16(si) dod8[la] re, si\mbreak
    mi mi mi[mi] mi mi

    %37
    dod'8\tu(re16 mi) la,8(si16 dod) si8(dod16 re)
    dod8\p (re16 mi) la,8(si16 dod) si8(dod16 re)
    dod8\f(re16 mi) re8[dod] si la'

    %40
    sold fad mi2
    la8 mi mi(fad16 sol!) sol8(fad16 mi)\mbreak
    fad8(mi16 re) r4 r

    %43
    fad8(mi16 re) fad8(sol16 la) la8(sold16 fad)
    sold8(fad16 mi) r4 r
    sold8(fad16 mi) la8 mi dod'[mi,]

    %46
    fad8(mi16 re) sold8[re] si' re,
    mi(re16 dod) fad8 dod la'[dod,]\mbreak
    re8(dod16 si) mi8 si sold'[si,]

    %49
    dod(si16 la) si8 mi, re'(dod16 si)
    dod8(si16 la) sold'8(fad16 mi) si'8(la16 sold)
    la8 la, dod4 si

    %52
    la r  r
    R2.*14
    fad'8(sol16 la) re,8(mi16 fad) mi8(fad16 sol)

    %68
    fad8\p(sol16 la) re,8(mi16 fad) mi8(fad16 sol)
    fad8\f(sol16 la) sol8(fad) mi(re)
    dod(re) mi2

    %71
    la8 dod, red(dod16 si) la'8(sol16 fad)
    sol8(fad16 mi) r4 r
    sol8 si, dod(si16 la) sol'8(fad16 mi)\mbreak

    %74
    fad8 (mi16 re) r4 r
    fad8(mi16 re) fad8 fad la dod,
    re(dod16 si) mi8 mi sol[si,]

    %77
    dod(si16 la) re8(dod16 si) mi8(re16 dod)
    fad8 mi16 (re) dod4. re8
    re4\fermata r r

}

VvlaIn = \relative do'' {

    re4 re dod8(re16 mi)
    re4\p re dod8(re16 mi)
    re4\f re si

    %4
    la8(si) dod2
    dod4 si red
    mi sol, \p si

    %7
    si\f la dod
    re fad,\p la
    la\f la la

    %10
    fad si si
    la la la
    la la la

    %13
    la r r %%% fine ripresa
    R2.*3
    r4 la la

    %18
    la dod,\p re
    la la'\f la
    la2 re4

    %21
    re8 si dod4 la
    la r r\mbreak
    R2.*14

    %37
    la4\tu la sold8(la16 si)
    la4\p la sold8(la16 si)
    la4\f la si

    %40
    si si2
    la4 la la\mbreak
    la r r

    %43
    la si si
    si r r
    mi mi mi

    %46
    re re re
    dod dod dod\mbreak
    si si si

    %49
    la si sold
    la si8(la16 sold) sold8(la16 si)
    la4 la sold

    %52
    la r r
    R2.*14
    re4 re dod8(re16 mi)

    %68
    re4\p re dod8(re16 mi)
    re4\f re si
    la8(si) dod2

    %71
    dod4 si red
    mi sol, si
    si\f la dod

    %74
    re fad,\p la
    la\f la la
    fad si si

    %77
    la la la
    la la la
    la \fermata r r

}

VvlaIIn = \relative do' {

    la'4 la la
    la\p la la
    la\f re, sol8 fad

    %4
    mi4 la2
    la4 fad si
    si sol\p si

    %7
    mi,\f mi la\mbreak
    la fad\p la
    re,\f re mi

    %10
    re si mi
    mi re la'
    la8 sol16(fad) mi4. fad8

    %13
    fad4 r r % ripresa
    R2.*3
    r4 mi re

    %18
    mi dod\p re
    la mi'\f dod
    re2 la'4

    %21
    sol8 si la4 la
    fad r r\mbreak
    R2.*14

    %37
    mi4 mi mi
    mi\p mi mi
    mi8\f(re16 dod) re8 mi fad4

    %40
    mi8 fad sold2
    mi8 la dod,(re16 mi) mi8(re16 dod)\mbreak
    re8(mi16 fad) r4 r

    %43
    re8(mi16 fad) fad4 fad8(mi16 red)
    mi8(fad16 sold) r4 r
    si la la

    %46
    la sold sold
    sold? fad fad\mbreak
    fad mi mi

    %49
    mi mi mi
    mi mi mi
    mi mi mi

    %52
    dod r r
    R2.*14
    la'4 la la

    %68
    la\p la la
    la\f re, sol8 fad
    mi4 la2

    %71
    la4 fad si
    si sol\p si
    mi,\f mi la\mbreak

    %74
    la fad\p la
    re,\f re mi
    re si mi

    %77
    mi re la'
    la8 sol16(fad) mi4. fad8
    fad4\fermata r r

}

Vfgn = \relative do {

    re4 fad la
    re\p fad, la
    re,\f si' sol

    %4
    la la, sol'
    fad si si,
    mi r r

    %7
    mi la la,\mbreak
    re r r
    re re' dod

    %10
    si sol mi
    la si dod
    re la la,

    %13
    re r r  % fine ripresa
    R2.*3
    r4 dod\f re
    la r r

    %19
    r dod' la
    re, mi fad
    sol la la,

    %22
    re2 dod'8\solo fad,\mbreak
    si2 la4
    sol2 fad4

    %25
    mi la la,
    re2 r4
    re'2 re4

    %28
    dod2 la4
    re re, sol \mbreak
    la dod la

    %31
    re re, red
    mi sold mi
    la la, re

    %34
    mi sold, mi
    la2 r4
    R2.

    %37
    la4 dod mi
    la dod, mi
    la, fad' re

    %40
    mi mi, re'
    dod la' la,\mbreak
    re r r

    %43
    re red si
    mi r r
    mi' dod la

    %46
    re si sold
    dod la fad\mbreak
    si sold mi

    %49
    la sold mi
    la mi re
    dod mi mi,

    %52
    la2  la'4\soli
    si sold mi
    la la, la'\mbreak

    %55
    mi r r
    mi, r r
    mi' mi, mi'

    %58
    la, la' la,
    re r r
    re' r re,\mbreak

    %61
    mi mi, mi'
    la la, la'
    re, re, re'

    %64
    sol, r sol
    sol' r sol,
    la r r
    re4 fad la

    %68
    re\p fad, la
    re,\f si' sol
    la la, sol'

    %71
    fad si si,
    mi r r
    mi la la,\mbreak

    %74
    re r r
    re re' dod
    si sol mi

    %77
    la si dod
    re la la,
    re\fermata r r

}

Vbcn = \relative do {

    re4 fad la
    re\p fad, la
    re,\f si' sol

    %4
    la la, sol'
    fad si si,
    mi r r

    %7
    mi la la,\mbreak
    re r r
    re re' dod

    %10
    si sol mi
    la si dod
    re la la,

    %13
    re re' dod  % fine ripresa
    si2 dod4
    re2 la4\mbreak

    %16
    si2 sol4
    la dod,\f re
    la r r

    %19
    r dod' la
    re, mi fad
    sol la la,

    %22
    re2 dod'4_\markup\italic\center-align "cembalo et violoncelli"
    si2 la4
    sol2 fad4

    %25
    mi la la,
    re2 r4
    re'2 re4

    %28
    dod2 la4
    re re, sol \mbreak
    la dod la

    %31
    re re, red
    mi sold mi
    la la, re

    %34
    mi sold, mi
    la2 r4
    R2.

    %37
    la4\tu dod mi
    la dod, mi
    la, fad' re

    %40
    mi mi, re'
    dod la' la,\mbreak
    re r r

    %43
    re red si
    mi r r
    mi' dod la

    %46
    re si sold
    dod la fad\mbreak
    si sold mi

    %49
    la sold mi
    la mi re
    dod mi mi,

    %52
    la2 r4
    R2.*14
    re4 fad la

    %68
    re\p fad, la
    re,\f si' sol
    la la, sol'

    %71
    fad si si,
    mi r r
    mi la la,\mbreak

    %74
    re r r
    re re' dod
    si sol mi

    %77
    la si dod
    re la la,
    re\fermata r r

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \key re\major
    \time 3/4
    \tempo 2 = 50
    s2.*79
    \bar"|."

}

VflI = {
    \Vglobal
    \notypeset
    <<\VflIn \forma>>

}

VflII = {
    \Vglobal
    <<\VflIIn \forma>>

}

VobI = {
    \Vglobal
    <<\VobIn \forma>>

}

VobII = {
    \Vglobal
    <<\VobIIn \forma>>

}

VvlI = {
    \Vglobal
    <<\VvlIn \forma>>

}

VvlII = {
    \Vglobal
    <<\VvlIIn \forma>>

}


VvlaI = {
    \Vglobal
    <<\VvlaIn \forma>>

}


VvlaII = {
    \Vglobal
    \clef alto
    <<\VvlaIIn \forma>>

}


Vfg = {
    \Vglobal
    \clef bass
    <<\Vfgn \forma>>

}


Vbc = {
    \Vglobal
    \clef bass
    << \Vbcn \forma \Vbfn >>
    \typeset

}

VIglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
			}



VIflIn = \relative do'' {

    fad4 la
    re,8 mi fad[sol] la4 do,
    si2 sol'4 si
    mi,8 (fad) sol[(la)] si4 re,

    %4
    dod!2 la8(re) fad[(la)]
    la,(sol') fad[(mi)] fad(la) re,[(la')]
    dod,(mi) la,4~la8(sol') fad(mi)\mbreak

    %7
    fad(mi) re(dod) si(la') sold(fad)
    sold(fad) mi(re) dod(si') la(sold)
    la4 sold8 fad mi(re) dod(si)

    %10
    la2 la la4 mi'
    dod8(si) la(sold) la4 sol'!
    fad2 si,4 sol'

    %13
    fad8(mi) re[(dod)] si4 si'\mbreak
    lad2 si8(re,) dod(si)
    fad(mi') re(dod) si(fad') mi(re)

    %16
    dod(sol') fad(mi) re(fad) si4
    dod,8(mi) lad4 si,8 re sol!4
    fad,8 (dod') mi4 re8(dod) si[(lad)]

    %19
    si(dod) re[(mi)] fad(sol) la[(fad)]
    sol(fad) mi[(red)] mi(sol) fad[(mi)]\mbreak
    re(sol) fad(mi) re(dod) si(lad)

    %22
    si2 r
    R1
    r4 si8^\markup\italic"Flûtes"(dod) re(mi) fad(sol)

    %25
    la (re) dod(re) sol,(si) la[(sol)]
    fad(re) mi4 fad\tu la
    re,8(mi) fad[(sol)] la4 do,

    %28
    si2 sol'4 si\mbreak
    mi,8(fad) sol[(la)] si4 re,
    dod!2 la8(re) fad(la) la,[(sol')]

    %31
    fad(mi) fad[(la)] re,(la')
    dod,(mi) la,4~la8(sol') fad(mi)
    fad(mi) re(mi) fad(sol) la(si)

    %34
    mi,(re) mi(fad) sol(la) si(dod)
    re4 dod8 si la8(sol) fad(mi)
    re2

}

VIflIIn = \relative do'' {

    fad4 la
    re,8 mi fad[sol] la4 do,
    si2 sol'4 si
    mi,8 (fad) sol[(la)] si4 re,

    %4
    dod!2 la8(re) fad[(la)]
    la,(sol') fad[(mi)] fad(la) re,[(la')]
    dod,(mi) la,4~la8(sol') fad(mi)\mbreak

    %7
    fad(mi) re(dod) si(la') sold(fad)
    sold(fad) mi(re) dod(si') la(sold)
    la4 sold8 fad mi(re) dod(si)

    %10
    la2 la la4 mi'
    dod8(si) la(sold) la4 sol'!
    fad2 si,4 sol'

    %13
    fad8(mi) re[(dod)] si4 si'\mbreak
    lad2 si8(re,) dod(si)
    fad(mi') re(dod) si(fad') mi(re)

    %16
    dod(sol') fad(mi) re(fad) si4
    dod,8(mi) lad4 si,8 re sol!4
    fad,8 (dod') mi4 re8(dod) si[(lad)]

    %19
    si(dod) re[(mi)] fad(sol) la[(fad)]
    sol(fad) mi[(red)] mi(sol) fad[(mi)]\mbreak
    re(sol) fad(mi) re(dod) si(lad)

    %22
    si2 r
    R1
    r4 si8(lad) si(dod) re(mi)

    %25
    re(fad) mi(fad) mi(re) dod[(mi)]
    re(si) dod4 fad la
    re,8(mi) fad[(sol)] la4 do,

    %28
    si2 sol'4 si\mbreak
    mi,8(fad) sol[(la)] si4 re,
    dod!2 la8(re) fad(la) la,[(sol')]

    %31
    fad(mi) fad[(la)] re,(la')
    dod,(mi) la,4~la8(sol') fad(mi)
    fad(mi) re(mi) fad(sol) la(si)

    %34
    mi,(re) mi(fad) sol(la) si(dod)
    re4 dod8 si la8(sol) fad(mi)
    re2

}

VIobIn = \relative do'' {

    fad4 la
    re,8 mi fad[sol] la4 do,
    si2 sol'4 si
    mi,8 (fad) sol[(la)] si4 re,

    %4
    dod!2 la8(re) fad[(la)]
    la,(sol') fad[(mi)] fad(la) re,[(la')]
    dod,(mi) la,4~la8(sol') fad(mi)\mbreak

    %7
    fad(mi) re(dod) si(la') sold(fad)
    sold(fad) mi(re) dod(si') la(sold)
    la4 sold8 fad mi(re) dod(si)

    %10
    la2 la la4 mi'
    dod8(si) la(sold) la4 sol'!
    fad2 si,4 sol'

    %13
    fad8(mi) re[(dod)] si4 si'\mbreak
    lad2 si8(re,) dod(si)
    fad(mi') re(dod) si(fad') mi(re)

    %16
    dod(sol') fad(mi) re(fad) si4
    dod,8(mi) lad4 si,8 re sol!4
    fad,8 (dod') mi4 re8(dod) si[(lad)]

    %19
    si(dod) re[(mi)] fad(sol) la[(fad)]
    sol(fad) mi[(red)] mi(sol) fad[(mi)]\mbreak
    re(sol) fad(mi) re(dod) si(lad)

    %22
    si2 re4 re
    re fad8(re) fad[(re)] mi(dod)
    re(dod) si4 r2

    %25
    R1
    r2 fad'4 la
    re,8(mi) fad[(sol)] la4 do,

    %28
    si2 sol'4 si\mbreak
    mi,8(fad) sol[(la)] si4 re,
    dod!2 la8(re) fad(la) la,[(sol')]

    %31
    fad(mi) fad[(la)] re,(la')
    dod,(mi) la,4~la8(sol') fad(mi)
    fad(mi) re(mi) fad(sol) la(si)

    %34
    mi,(re) mi(fad) sol(la) si(dod)
    re4 dod8 si la8(sol) fad(mi)
    re2

}

VIobIIn = \relative do'' {

    re4 mi
    re la la fad
    sol2 si4 la
    si si si sold

    %4
    la2 la4 la
    la la la la
    la sold la la\mbreak

    %7
    la2 si4 si
    si2 dod4 dod
    dod mi8(re) dod[(si)]  la(sold)

    %10
    la2 la la4 si
    la sold la la
    la2 si4 si

    %13
    si si8(lad) si4 re\mbreak
    dod2 si4 sol
    lad8(dod) si(lad) si4 dod8(si)

    %16
    lad4 dod si si
    lad dod si si
    dod lad si mi,

    %19
    si' lad si red
    mi la, si dod\mbreak
    si si si fad

    %22
    fad2 si4^\markup\italic"Hautbois" si
    si re8(si) re[(si)] dod( lad)
    si(lad) si4 r2

    %25
    R1
    r2 re4\tu mi
    re la la fad

    %28
    sol2 si4 la\mbreak
    si si si sold
    la2 la4 la

    %31
    la la la la
    la sold la la
    la la la la

    %34
    la la r4 mi'
    re re re la
    la2

}

VIvlaIIn = \relative do' {

    la'4 la
    fad8(mi) re[(dod)] re4 re
    re2 mi4 red
    mi mi mi mi

    %4
    mi2 re4 re
    mi dod re re
    mi re mi dod\mbreak

    %7
    re2 fad4 red
    mi2 sold4 mi
    la la la mi

    %10
    dod2 dod mi4 mi
    mi re mi dod
    re2 mi4 mi

    %13
    fad fad fad fad\mbreak
    fad2 fad4 sol
    dod, fad fad sol

    %16
    fad fad fad fad
    fad fad fad re
    dod fad fad mi

    %19
    fad mi si' si
    si la sol dod\mbreak
    fad, sol fad8(mi) re[(dod)]

    %22
    re2 r
    R1*3
    r2 la'4 la

    %27
    fad8(mi) re[(dod)] re4 re
    re2 mi4 red\mbreak
    mi mi mi mi

    %30
    mi2 re4 re
    mi dod re re
    mi re mi dod

    %33
    re mi re re
    dod8(si) dod[(re)] mi(fad) sol[(mi)]
    la4 si fad8(sol) la[(sol)]

    %36
    fad2

}

VIfgn = \relative do {

    re'4 dod
    sol la8 sol fad4 re
    sol sol, mi' fad
    sol mi8 fad sol4 mi

    %4
    la sol fad re
    dod la re fad
    la si dod la\mbreak

    %7
    re, fad re si
    mi sold mi dod
    fad dod8 re mi4 mi,

    %10
    la'8(si) dod(la) la,4 la'8 si dod4 sold
    la si dod la
    re re, sol mi

    %13
    re fad8 mi re4 si\mbreak
    fad'4 mi re mi
    fad  mi re mi

    %16
    fad lad, si re
    fad mi re si
    lad fad si dod

    %19
    re dod red si
    mi fad sol lad\mbreak
    si mi, fad fad,

    %22
    si2 r4 si'
    re, si fad' fad,
    si2 si'4 si,
    fad' re mi la
    re, la' re dod

    %27
    si la8 sol fad4 re
    sol sol, mi' fad\mbreak
    sol mi8(fad) sol4 mi

    %30
    la sol fad re
    dod la re fad
    la si dod la

    %33
    re dod re fad,
    la la, r4 sol'
    fad sol la la,

    %36
    re re,

}

VIbcn = \relative do {

    re'4 dod
    sol la8 sol fad4 re
    sol sol, mi' fad
    sol mi8 fad sol4 mi

    %4
    la sol fad re
    dod la re fad
    la si dod la\mbreak

    %7
    re, fad re si
    mi sold mi dod
    fad dod8 re mi4 mi,

    %10
    la'8(si) dod(la) la,4 la'8 si dod4 sold
    la si dod la
    re re, sol mi

    %13
    re fad8 mi re4 si\mbreak
    fad'4 mi re mi
    fad  mi re mi

    %16
    fad lad, si re
    fad mi re si
    lad fad si dod

    %19
    re dod red si
    mi fad sol lad\mbreak
    si mi, fad fad,

    %22
    si2 r
    R1*3
    r2 re'4 dod

    %27
    si la8 sol fad4 re
    sol sol, mi' fad\mbreak
    sol mi8(fad) sol4 mi

    %30
    la sol fad re
    dod la re fad
    la si dod la

    %33
    re dod re fad,
    la la, r4 sol'
    fad sol la la,

    %36
    re re,

}

VIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}


forma = {

\key re\major
\time 2/2
\tempo 1 = 50
\repeat volta 2{\partial 2 s2
s1*9}
\alternative {{\set Score.measureLength = #(ly:make-moment 2 4) s2}{\set Score.measureLength = #(ly:make-moment 4 4) s2}}\break
\bar".|:"
s2
\set Score.currentBarNumber = #11
s1*25
\set Score.measureLength = #(ly:make-moment 2 4) s2
\bar":|."
\mark\markup {\musicglyph #"scripts.ufermata"}

}

VIflI = {
	\VIglobal
	\notypeset
	<<\VIflIn \forma>>

}

VIflII = {
	\VIglobal
	<<\VIflIIn \forma>>

}

VIobI = {
	\VIglobal
	<<\VIobIn \forma>>

}

VIobII = {
	\VIglobal
	<<\VIobIIn \forma>>

}


VIvlaII = {
	\VIglobal
	\clef alto
	<<\VIvlaIIn \forma>>

}


VIfg = {
	\VIglobal
	\clef bass
	<<\VIfgn \forma>>

}


VIbc = {
	\VIglobal
	\clef bass
	<< \VIbcn \forma \VIbfn >>
	\typeset

}

VIIglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
			}



VIIflIn = \relative do'' {

    re8(mi) fad(sol)
    la(re,) si'(sol) la(fad) si(re)
    la2 re,8(la') sol(fad)
    mi(re) dod(re) mi(sol) fad(mi)

    %4
    fad(mi)re4 fad8(la) sol[(fad)]
    mi(la) sold[(la)] dod(la) sold[(la)]\mbreak
    fad(si) la[(si)] re(si) la[(si)]

    %7
    sold(si) re[(si)] dod(la) si[(sold)]
    la2 mi8(fad) sol(mi)
    fad(la,) sol'(la,) fad'(la,) sol'(la,)

    %10
    fad'2 \once\stemUp si,8(re') dod(si)
    lad(si) dod(si) lad(sold) fad(mi)\mbreak
    re(mi) fad(mi) re(mi) re(dod)

    %13
    re(si') la(si) re,4 dod8(si)
    si2 fad'4 fad
    fad si8(la) sol(fad) mi(red)

    %16
    mi(si) dod(red) mi(fad) sol(la)
    sol(la) si(la) sol(fad) mi(re)\mbreak
    dod(re) mi4 re8(mi) fad(sol)

    %19
    la(re,) si'(sol) la(re,) si'(re)
    la2 la,8(sol') fad(mi)
    fad(la) re[(la)] fad4 mi8(re)

    %22
    re2

}

VIIflIIn = \relative do'' {

    re8(dod) re(mi)
    fad(re) sol(mi) fad(re) sol(re)
    fad2 re8(fad) mi[(re)]
    dod (si) la(si) dod( mi) re(dod)

    %4
    re(dod) re4 re8(fad) mi[(re)]
    dod(la) si[(dod)] mi(dod) si[(dod)]\mbreak
    re(fad) dod[(re)] fad(re) dod[(re)]

    %7
    mi(sold) si[(sold)] la(dod,) re[(si)]
    dod2 dod8(re) mi(dod)
    re(la) mi'(la,) re(la) mi' (la,)

    %10
    re2 si8(fad') mi(re)
    dod(re) mi(re) dod(si) lad(dod)\mbreak
    si(dod) re(dod) si(dod) si(lad)

    %13
    si4 si si lad
    si2 re4 dod
    si si si si8(la!)

    %16
    si4 si si8(red) mi(fad)
    mi(fad) sol(fad) mi4 si\mbreak
    la8(si) dod4 re8(dod) re[(mi)]

    %19
    fad(re) sol(mi) fad(re) sol(re)
    fad2 dod8(mi) re(dod)
    re4 re re dod8(re)

    %22
    re2

}

VIIfgn = \relative do {

    re4 re
    re' re, re' re,
    re' re,8 mi fad4 sol
    la la la, la'

    %4
    re, re, re'' sol,
    la la, r la'
    re, si r si'

    %7
    mi, mi, mi' mi,
    la8 si dod la la'4 la,
    re dod re dod

    %10
    re re, re' mi
    fad fad, r fad'\mbreak
    si si, si' fad

    %13
    si re, fad fad,
    si fad' si la
    sol sol8(fad) mi(fad) sol(fad)

    %16
    sol4 si8(la) sol(fad) mi(red)
    mi4 mi, mi' sol\mbreak
    la la8(sol) fad(mi) re4

    %19
    re' re, re' re,
    re' fad,8 sol la4 la,
    re fad la la,

    %22
    re re,

}


forma = {

\key re\major
\time 2/2
\tempo 1 = 50
\partial 2 s2
s1*7
s2 \bar":..:"\break s2
s1*13
\set Score.measureLength = #(ly:make-moment 2 4) s2
\bar":|."
\mark\markup {\musicglyph #"scripts.ufermata"}

}

VIIflI = {
	\VIIglobal
	\notypeset
	<<\VIIflIn \forma>>

}

VIIflII = {
	\VIIglobal
	<<\VIIflIIn \forma>>

}


VIIfg = {
	\VIIglobal
	\clef bass
	<<\VIIfgn \forma>>
	\typeset

}

VIIIglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
			}



VIIIflIn = \relative do'' {

    re4 re re
    re fad8(re) la'4
    re, re re

    %4
    re fad8(re) re'4
    la, dod8(la) mi'4
    la, dod8(la) sol'4

    %7
    fad mi re
    dod si8 dod la4\mbreak
    re re re

    %10
    si' si8(la)si[(sold)]
    la4 dod,8(si) la[(sold)]
    la2. la

    %13
    mi'4 mi mi
    mi dod8(la) mi'4
    la mi mi

    %16
    mi dod8(la) sol'4
    fad re8(si) si'4\mbreak
    dod, lad8(fad) mi'4

    %19
    re fad si
    lad sold8(lad) fad4
    mi mi mi

    %22
    dod' dod8(si) dod[(lad)]
    si4 re,8(dod) si(lad)
    si2.

    %25
    fad'4^\markup\italic"Flûtes" fad fad
    fad la8 sol fad4\mbreak
    sol si8(sol) la[(fad)]

    %28
    sol4 si8(sol) mi4
    fad la8(fad) sol(mi)
    fad4 la8(fad) la(dod,)

    %31
    re(si) sol'[(fad)] mi(re)
    dod4 si8 dod la4
    re\tu re re

    %34
    re fad8(re) la'4\mbreak
    re, re re
    re fad8(re) re'4

    %37
    la, dod8(la) mi'4
    la, dod8(la) sol'4
    fad la re

    %40
    dod si8 dod la4
    sol sol sol
    la, sol'8(fad) sol[(mi)]

    %43
    fad(la) fad[(mi)] re(dod)
    re2.\fermata

}

VIIIflIIn = \relative do'' {

    re4 re re
    re fad8(re) la'4
    re, re re

    %4
    re fad8(re) re'4
    la, dod8(la) mi'4
    la, dod8(la) sol'4

    %7
    fad mi re
    dod si8 dod la4\mbreak
    re re re

    %10
    si' si8(la)si[(sold)]
    la4 dod,8(si) la[(sold)]
    la2. la

    %13
    mi'4 mi mi
    mi dod8(la) mi'4
    la mi mi

    %16
    mi dod8(la) sol'4
    fad re8(si) si'4\mbreak
    dod, lad8(fad) mi'4

    %19
    re fad si
    lad sold8(lad) fad4
    mi mi mi

    %22
    dod' dod8(si) dod[(lad)]
    si4 re,8(dod) si(lad)
    si2.

    %25
    re4 re re
    red fad8 mi red4\mbreak
    mi sol8(mi) fad[(red)]

    %28
    mi4 sol8(mi) dod4
    re! fad8(re) mi[(dod)]
    re4 fad8(re) mi[(la)]

    %31
    fad,(re') si4 si
    la2 la4
    re\tu re re

    %34
    re fad8(re) la'4\mbreak
    re, re re
    re fad8(re) re'4

    %37
    la, dod8(la) mi'4
    la, dod8(la) sol'4
    fad la re

    %40
    dod si8 dod la4
    sol sol sol
    la, sol'8(fad) sol[(mi)]

    %43
    fad(la) fad[(mi)] re(dod)
    re2.\fermata

}

VIIIvlaIIn = \relative do' {

    fad4 fad sol
    la re, r
    la' fad sol

    %4
    la re, r
    mi mi r
    dod mi dod

    %7
    re mi sold
    mi2 mi4\mbreak
    fad fad fad

    %10
    mi sold mi
    mi mi8(re) dod[(si)]
    dod2. dod

    %13
    dod4 dod re
    mi mi r
    mi dod re

    %16
    mi mi dod
    re fad fad\mbreak
    la dod8(lad) fad4

    %19
    fad dod8(re) mi4
    dod si8(dod) lad4
    r sold' sold

    %22
    fad lad lad8(dod)
    fad,4 fad8(mi)re[(dod)]
    re2.

    %25
    R2.*8
    fad4 fad sol
    la re, r\mbreak

    %35
    la' fad sol
    la re, r
    mi mi r

    %38
    dod mi dod
    re mi sold
    mi dod re

    %41
    si dod si
    mi dod dod
    re re8(mi) fad[(sol)]

    %44
    fad2.\fermata

}

VIIIfgn = \relative do {

    re'4 re, mi
    fad re r
    re' re, mi

    %4
    fad re r
    dod la r
    la' la, la'

    %7
    re dod si
    la2 dod4\mbreak
    si si, la'

    %10
    sold mi re
    dod mi mi,
    la la'8 sol fad mi la,4 dod mi

    %13
    la la, si'
    dod la r
    dod, la si

    %16
    dod la la'
    re, re, si'
    fad 'fad, lad'

    %19
    si la! sol
    fad dod fad,
    r dod'' si

    %22
    lad fad mi
    re fad fad,
    si re\solo fad

    %25
    si si, si'
    si si, si'\mbreak
    mi, si' si,

    %28
    mi r la
    si, la' la,
    re r la'

    %31
    si mi, sol
    la4. si8 dod la
    re4\tu re, mi
    fad re r\mbreak

    %35
    re' re, mi
    fad re r
    dod la r

    %38
    la' la, la'
    re dod si
    la sol fad

    %41
    mi mi, re'
    dod la la'
    re la la,

    %44
    re\fermata la re,

}

VIIIbcn = \relative do {

    re'4 re, mi
    fad re r
    re' re, mi

    %4
    fad re r
    dod la r
    la' la, la'

    %7
    re dod si
    la2 dod4\mbreak
    si si, la'

    %10
    sold mi re
    dod mi mi,
    la la'8 sol fad mi la,4 dod mi

    %13
    la la, si'
    dod la r
    dod, la si

    %16
    dod la la'
    re, re, si'
    fad 'fad, lad'

    %19
    si la! sol
    fad dod fad,
    r dod'' si

    %22
    lad fad mi
    re fad fad,
    si r r

    %25
    R2.*8
    re'4 re, mi
    fad re r\mbreak

    %35
    re' re, mi
    fad re r
    dod la r

    %38
    la' la, la'
    re dod si
    la sol fad

    %41
    mi mi, re'
    dod la la'
    re la la,

    %44
    re\fermata la re,

}

VIIIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}


forma = {

\key re\major
\time 3/4
\tempo 2 = 70
\repeat volta 2{s2.*11}
\alternative {{s2.}{s}}\break
\set Score.currentBarNumber = #13
\bar ".|:"
s2.*32
\bar"|."

}

VIIIflI = {
	\VIIIglobal
	\notypeset
	<<\VIIIflIn \forma>>

}

VIIIflII = {
	\VIIIglobal
	<<\VIIIflIIn \forma>>

}


VIIIvlaII = {
	\VIIIglobal
	\clef alto
	<<\VIIIvlaIIn \forma>>

}


VIIIfg = {
	\VIIIglobal
	\clef bass
	<<\VIIIfgn \forma>>

}


VIIIbc = {
	\VIIIglobal
	\clef bass
	<< \VIIIbcn \forma \VIIIbfn >>
	\typeset

}

IXglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}



IXobIn = \relative do'' {

    fa!4 fa fa
    fa8(la) fa[(re)] la(fa')
    mi4 mi mi

    %4
    mi8 (la) mi[(dod)]  la(sol')
    fa(la) fa[(re)] la'4
    sol8(sib) sol[(re)] fa4

    %7
    mi8(sol) fa[(do)] fa(la)
    sol(fa) mi(re) do(sib)\mbreak
    la4 fa' fa

    %10
    fa mi8(re) do(sib)
    la(re) do(sib) la(sol)
    fa2. fa

    %13
    la4 la la
    la8(do) fa,[(la)] do(fa)
    mi4 mi mi

    %16
    mi8(sol) do,[(mi)] sol(sib)
    la4 la la
    fa8(la) fa[(re)] sol4\mbreak

    %19
    mi8(sol) fa[(mi)] re(do)
    si4 la8(si) sol4
    fa si re

    %22
    sol,8(si) re[(fa)] mi(re)
    sol4 do, si
    do2.

    %25
    mi4 mi mi
    mi8(fa) sol[(la)] sib(sol)
    la(sib) sol[(fa)] mi(re)

    %26
    dod4 si8(dod) la4\mbreak
    fa' fa fa
    fa8(la) fa[(re)] la(fa')

    %31
    mi4 mi mi
    mi8(la) mi[(dod)] la(sol')
    fa(mi) re[(mi)] fad(la)

    %34
    sol(fa!) mi[(re)] dod(si)\mbreak
    la(sol') fa[(mi)] re (dod)
    re2.

}

IXobIIn = \relative do'' {

    re4 re re
    re8(fa!) re[(la)] fa'(re)
    dod4 dod dod

    %4
    dod?8(fa) dod[(la)] mi'(dod)
    re(fa) re[(la)] fa'4
    re8(sol) re[(sib)] re4

    %7
    sol,8(mi') do[(fa)] la, (fa')
    mi(re) do(sib) la(sol)\mbreak
    fa4 la sib

    %10
    do fa, fa
    fa8(sib) la(sol) fa(mi)
    fa2. fa

    %13
    fa4 fa fa
    fa8(la) la[(do)] la(fa)
    sol4 sol sol

    %16
    sol8(sib) mi,[(sol)] mi(do)
    la'4 la mi'
    re8(fa) re[(la)] re4\mbreak

    %19
    sol, do la
    sol fad sol8 la
    si4 re fa,!

    %22
    si8(sol) si[(re)] do(si)
    do4 mi, re
    do2.

    %25
    do'4 do do
    do8(re) mi[(fa)] sol(mi)
    fa(mi) re4 sib

    %28
    la2 la4\mbreak
    re re re
    re8(fa) re[(la)] fa'(re)

    %31
    dod4 dod dod
    dod8(mi) dod[(la)] mi'(dod)
    re(mi) fa[(mi)] re(fad)

    %34
    re(do!) sib[(la)] sol(fa)\mbreak
    mi(la) la[(sol)] fa(mi)
    re2.

}

IXfgn = \relative do {

    re4 fa! la
    re2 r4
    la, dod mi

    %4
    la2 r4
    re, re' do
    sib sib, si'

    %7
    do la fa
    do do' do,\mbreak
    fa fa, sol'

    %10
    la la, sib'
    do do, do'
    fa,8(sib) la(sol) fa(mi) fa4 do la

    %13
    fa la do
    fa2 r4
    do mi sol

    %16
    do2 r4
    fa, fa, dod'
    re re' si\mbreak

    %19
    do la fa
    sol re si
    sol sol sol

    %22
    sol' sol fa
    mi fa sol
    do, mi sol

    %25
    do do, do'
    do do, do'
    fa, sib sol

    %28
    la4. sol8 fa mi\mbreak
    re4 fa la
    re2 r4

    %31
    la, dod mi
    la2 r4
    re, re' do

    %34
    sib8(la) sol[(fa)] mi(re)\mbreak
    dod4 re la
    re,8(re') do![(sib)] la(sol)

}


forma = {

    \key re\minor
    \time 3/4
    \tempo 2 = 70
    \repeat volta 2{s2.*11}
    \alternative {{s2.}{s}}
    \bar".|:"\break
    \set Score.currentBarNumber = #13
    s2.*24
    \bar":|."
    \mark\markup {\musicglyph #"scripts.ufermata"}

}

IXobI = {
    \IXglobal
    %\notypeset
    <<\IXobIn \forma>>

}

IXobII = {
    \IXglobal
    <<\IXobIIn \forma>>

}


IXfg = {
    \IXglobal
    \clef bass
    <<\IXfgn \forma>>
    \typeset

}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #2

    }

    \markup \huge {[1.] Ouverture}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flûte"\vspace #-0.2"trav. 1"}
                    \IflI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flûte"\vspace #-0.2"trav. 2"}
                    \IflII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Hautbois 1"}
                    \IobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Hautbois 2"}
                    \IobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 1"}
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 2"}
                    \IvlII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \new Voice   {
                        \set Staff.instrumentName = \markup \center-column{"Viola 1"}
                        \override Staff.InstrumentName.self-alignment-X = #RIGHT
                        \incipit { \clef soprano \key re\major}
                        \clef violin
                        \key re\major
                        \set Staff.midiInstrument = #"viola"
                        \IvlaI
                    }
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Viola 2"}
                    \IvlaII
                >>
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"}
                \Ifg
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"Cembalo"}
                \Ibc
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

    \pageBreak

    \markup \huge {[2.] Air allegro}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \IIflI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \IIflII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \new Voice   {
                        \set Staff.instrumentName = \markup \center-column{""}
                        \override Staff.InstrumentName.self-alignment-X = #RIGHT
                        \incipit { \clef soprano \key re\major}
                        \clef violin
                        \key re\major
                        \set Staff.midiInstrument = #"viola"
                        \IIvlaI
                    }
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvlaII
                >>
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"bassoon"
                \IIfg
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

        \layout {

            indent = 1\cm
            incipit-width = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

    \pageBreak

    \markup \huge {[3.] Bourrée 1. altern[ativement]}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIflI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIflII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \new Voice   {
                        \set Staff.instrumentName = \markup \center-column{""}
                        \override Staff.InstrumentName.self-alignment-X = #RIGHT
                        \incipit { \clef soprano \key re\major}
                        \clef violin
                        \key re\major
                        \set Staff.midiInstrument = #"viola"
                        \IIIvlaI
                    }
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \IIIvlaII
                >>
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"bassoon"
                \IIIfg
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1\cm
            incipit-width = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

        systems-per-page = #4

    }

    \markup \huge {[4.] Bourrée 2.}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flûte 1"}
                    \IVflI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flûte 2"}
                    \IVflII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Hautbois 1"}
                    \IVobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Hautbois 2"}
                    \IVobII
                >>
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"}
                \IVfg
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

    \markup \huge {[5.] Air}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \VflI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \VflII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \VobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \VobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \VvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \VvlII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \new Voice   {
                        \set Staff.instrumentName = \markup \center-column{""}
                        \override Staff.InstrumentName.self-alignment-X = #RIGHT
                        \incipit { \clef soprano \key re\major}
                        \clef violin
                        \key re\major
                        \set Staff.midiInstrument = #"viola"
                        \VvlaI
                    }
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \VvlaII
                >>
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"bassoon"
                \Vfg
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \Vbc
            >>
        >>

        \layout {

            indent = 1\cm
            incipit-width = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

        systems-per-page = #3

    }

    \markup \huge {[6.] Gavotte 1. altern[ativement]}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flûte 1"\vspace #-0.2"Violini [1 e 2]"}
                    \VIflI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flûte 2"}
                    \VIflII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Hautbois 1"}
                    \VIobI
                >>

                \new Staff
                <<
                    \new Voice   {
                        \set Staff.instrumentName = \markup \center-column{"Hautbois 2"\vspace #-0.2"Viola 1"}
                        \override Staff.InstrumentName.self-alignment-X = #RIGHT
                        \incipit { \clef soprano \key re\major}
                        \clef violin
                        \key re\major
                        \set Staff.midiInstrument = #"oboe"
                        \VIobII }
                >>
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Viola 2"}
                \VIvlaII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"}
                \VIfg
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"Cembalo"}
                \VIbc
            >>
        >>

        \layout {

            indent = 3\cm
            incipit-width = 3\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

        systems-per-page = #5

    }

    \markup \huge {[7.] Trio}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flûte trav. 1"}
                    \VIIflI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flûte trav. 2"}
                    \VIIflII
                >>
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"}
                \VIIfg
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override StaffGrouper.staffgroup-staff-spacing.padding = #4
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
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

        systems-per-page = #4

    }

    \markup \huge {[8.] Menuet altern[ativement] avec le Trio}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flûte 1"\vspace #-0.2"Violini [1 e 2]"\vspace #-0.2"Hautbois [1 e 2]"}
                    \VIIIflI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flûte 2"}
                    \VIIIflII
                >>
            >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Viola 1 e 2"}
                    \VIIIvlaII
                >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"}
                \VIIIfg
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"Cembalo"}
                \VIIIbc
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
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

        systems-per-page = #5

    }

    \markup \huge {[9.] Trio}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Hautbois 1"}
                    \IXobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Hautbois 2"}
                    \IXobII
                >>
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"}
                \IXfg
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override StaffGrouper.staffgroup-staff-spacing.padding = #4
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
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

