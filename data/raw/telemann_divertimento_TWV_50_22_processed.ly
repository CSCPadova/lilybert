\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

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


Iglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
}

IvlIn = \relative do'' {

    <<
        {
            mi2
            mi mi
            mi
        }\\{
            mi
            mi mi
            mi
        }
    >> dod4 la
    fad' re, re' si

    %4
    dod la, \stemUp <la'' la,>2
    <la la,> <la la,>
    <la la,> \stemNeutral sold4 mi

    %7
    dod' la, la' fad\mbreak
    sold mi, sold'8 si, sold'si,
    fad' si, fad' si, la' si, la' si,

    %10
    sold' si, sold' si, si' si, si' si,
    la' si, la' si, sold' si, sold' si,
    sold'4 fad r mi~

    %13
    mi red2 fad4~
    fad mi2 sold4~\mbreak
    sold4 fad2 mi4~

    %16
    mi red si'8 si, si si
    si' si, si si si' si, si si
    si' si, si si si' (sold mi4)

    %19
    sold8(mi si4) fad'8(red si4)
    si8 (sold mi4) do'8 mi, do' mi,\mbreak
    si' mi, si' mi, re' mi, re' mi,

    %22
    do' mi, do' mi,mi' mi, mi' mi,
    re' mi, re' mi, do' mi, do' mi,
    do'?4 si r la~

    %25
    la sold2 si4~
    si la2 do4~\mbreak
    do si2 la4~

    %28
    la sold! si'8\f si, si si
    si'8 si, si si si' si, si si
    si' si, si si si'(sold mi4)

    %31
    sold8(mi si4) fad'8(red si4)
    <<<mi si>2\\sold,>> mi8 mi fad fad
    sold sold mi mi sold sold lad lad\mbreak

    %34
    si4 si, fad'8 fad sold sold
    la? la fad fad la la si si
    dod4 dod, r2

    %37
    r sold''4.(la16 si)
    la4 sold r2
    r sold,4.(la16 si)

    %40
    la4 sold dod fad
    re si sold mid'\mbreak
    fad fad, fad' si

    %43
    sol mi dod lad'
    si si, re sol
    mi do la fad'

    %46
    sol sol, \stemUp <re' re,>2
    <re re,> <re re,>
    <re re,>\stemNeutral re,8 re mi mi

    %49
    fad fad re re fad fad sold sold\mbreak
    la4 la, la'8 la si si
    dod dod la la dod dod red red

    %52
    mi4 mi, r2
    r si'4.(dod16 re)
    dod4 si r2

    %55
    r si,4. (re8)
    dod4 si <<mi'2\\mi>>
    <<
        {
            mi mi
            re
        }\\{
            mi mi
            re
        }
    >> mi8 la, mi' la,

    %59
    fad' la, fad' la, fad' si, fad' si,
    sold' si, sold' si, sold' dod ,sold' dod,\mbreak
    la' dod, la' dod, sold' dod, sold' dod,

    %62
    la'4 fad, r la~\p
    la re2 si4~
    si mi2 dod4~

    %65
    dod fad2 mid4
    fad2 la8\f la, la la
    la' la, la la la' la, la la\mbreak

    %68
    la' la, la la mi'(dod la4)
    dod8(la mi4) si'8(sold mi4)
    mi8(dod la4) dod'8 mi, dod' mi,

    %71
    si' mi, si' mi, re' mi, re' mi,
    dod' mi, dod' mi, mi' mi, mi' mi,
    re' mi, re' mi, dod' mi, dod' mi,\mbreak

    %74
    dod'4 si r la~\p
    la sold2 si4~
    si la2 dod4~

    %77
    dod si2 la4~
    la sold la'8\ff la, la la
    la' la, la la la' la, la la\mbreak

    %80
    la' la, la la mi'8(dod la4)
    dod8(la mi4) si'8(sold mi4)
    <la mi dod>2

}

IvlIIn = \relative do'' {

    la4 dod
    si fad la dod
    si fad dod' la
    la' la, re si

    %4
    dod la, re' fad
    mi dod re fad
    mi dod sold' mi

    %7
    dod' la, la' fad\mbreak
    sold mi, r mi'~
    mi red2 fad4~

    %10
    fad mi2 sold4~
    sold fad2 mi4~
    mi red sold8 si, sold' si,

    %13
    fad' si, fad' si, la' si, la' si,
    sold' si, sold' si, si' si, si' si,\mbreak
    la' si, la' si, sold' si, sold' si,

    %16
    sold'4 fad si8 si, si si
    si' si, si si si' si, si si
    si' si, si si si' (sold mi4)

    %19
    sold8(mi si4) fad'8(red si4)
    si8 (sold mi4) r4 la\p~\mbreak
    la sold2 si4~

    %22
    si la2 do4~
    do si2 la4~
    la sold do8 mi, do' mi,

    %25
    si' mi, si' mi, re' mi, re' mi,
    do' mi, do' mi, mi' mi, mi' mi,\mbreak
    re' mi, re' mi, do' mi, do' mi,

    %28
    do'?4 si si'8\f si, si si
    si'8 si, si si si' si, si si
    si' si, si si si'(sold mi4)

    %31
    sold8(mi si4) fad'8(red si4)
    <<<mi si>2\\sold,>> mi8 mi fad fad
    sold sold mi mi sold sold lad lad\mbreak

    %34
    si4 si, fad'8 fad sold sold
    la? la fad fad la la si si
    dod4 dod, r2

    %37
    r mid'4.(fad16 sold)
    fad4 mid r2
    r mid,4.(fad16 sold)

    %40
    fad4 mid dod' fad
    re si sold mid'
    fad fad, fad' si

    %43
    sol mi dod lad'
    si si, re sol
    mi do la fad'

    %46
    sol sol, la fad
    sol si la fad
    sol si re,8 re mi mi

    %49
    fad fad re re fad fad sold sold\mbreak
    la4 la, la'8 la si si
    dod dod la la dod dod red red

    %52
    mi4 mi, r2
    r sold4.(la16 si)
    la4 sold r2
    r \slurDashed sold,4. (si8)\slurSolid

    %56
    la4 sold la 'dod
    si sold la dod
    si sold r la~

    %59
    la re2 si4~
    si mi2 dod4~\mbreak
    dod fad2 mid4

    %62
    fad2 mi!8 la, mi' la,
    fad' la, fad' la, fad' si, fad' si,
    sold' si, sold' si, sold' dod, sold' dod,

    %65
    la' dod, la' dod, sold' dod, sold' dod,
    la'4 la, la'8\f la, la la
    la' la, la la la' la, la la\mbreak

    %68
    la' la, la la mi'(dod la4)
    dod8(la mi4) si'8(sold mi4)
    mi8(dod la4) r la'~

    %71
    la la2 si4~
    si la2 do4~
    do la2 la4~\mbreak

    %74
    la sold dod8\p mi, dod' mi,
    si' mi, si' mi, re' mi, re' mi,
    dod' mi, dod' mi, mi' mi, mi' mi,

    %77
    re' mi, re' mi, dod' mi, dod' mi,
    dod'4 si la'8\ff la, la la
    la' la, la la la' la, la la\mbreak

    %80
    la' la, la la mi'8(dod la4)
    dod8(la mi4) si'8(sold mi4)
    <la mi dod>2


}

Ivlan = \relative do' {

    la4 dod
    sold mi dod' la
    sold mi mi' dod
    re2 sold,4 mi'

    %4
    mi dod fad re
    dod la fad' re
    dod la si sold'

    %7
    mi dod red si'\mbreak
    si2 si4 si
    si r si si

    %10
    si r si mi
    la, si si si
    si2 si4 si

    %13
    si r si si
    si r si mi\mbreak
    la, si si si

    %16
    si2 fad4 la8(fad)
    sold4 si8(sold) red4 fad8(red)
    mi4. mi8 sold4. sold8

    %19
    si,4. mi8 red4. sold,8
    sold'2 mi4 mi\mbreak
    mi r mi mi

    %22
    mi r mi la
    re, mi mi mi
    mi2 mi4 mi

    %25
    mi r mi mi
    mi r mi la\mbreak
    re, mi mi mi

    %28
    mi2 fad4 la8(fad)
    sold4 si8(sold) red4 fad8(red)
    mi2 sold4. sold8

    %31
    dod,4. mi8 red4. red8
    si2 mi8 mi fad fad
    sold sold mi mi sold sold lad lad\mbreak

    %34
    si4 si, fad'8 fad sold sold
    la la fad fad fad fad fad fad
    mi2 dod

    %37
    dod dod
    dod dod,
    dod dod

    %40
    dod fad'4 la
    fad fad mid sold\mbreak
    la lad si re

    %43
    si si lad dod
    re2 sol,4 si8 fad
    sol4 sol fad la

    %46
    si2 fad4 re
    si sol fad' re
    si sol re'8 re mi mi

    %49
    fad fad re re fad fad sold sold\mbreak
    la4 la, la'8 la si si
    dod dod la la dod dod red red

    %52
    la la la la mi2
    mi mi
    mi mi,

    %55
    mi mi
    mi dod'4 la
    sold mi dod' 4 la

    %58
    si' la r2
    re,4 r fad r
    mi r sold r\mbreak

    %61
    dod,2 dod
    dod4 la mi' r
    re r fad r

    %64
    mi r sold r
    dod,2 dod
    dod4 dod' mi, dod8(mi)

    %67
    fad4 re8(fad) re4 fad8(re)\mbreak
    mi4 dod8(mi) dod4 mi8 (dod)
    dod4. mi8 re4. re8

    %70
    dod2 mi4 mi
    mi r mi mi
    mi r mi la

    %73
    re, mi mi mi
    mi2 mi4\p mi
    mi2 mi4 mi

    %76
    mi2 mi4 la
    re, mi mi mi
    mi2 mi4 dod8(mi)

    %79
    fad4 re8(fad) re4 fad8(re)\mbreak
    mi4 dod8 (mi) dod4. mi8
    mi4. mi8 mi4. mi8

    %82
    mi2

}

Ibcn = \relative do {

    dod'4 la
    sold mi dod' la
    sold mi la2
    re, mi

    %4
    la, fad'4 re
    dod la fad' re
    dod la mi'2

    %7
    la, si\mbreak
    mi, mi''4 mi,
    si r si' red,

    %10
    mi r  sold mi
    fad red mi mi,
    si'2 mi'4 mi,

    %13
    si r si' red,
    mi r sold mi\mbreak
    fad red mi mi,

    %16
    si'2 red4 fad8(red)
    mi4 sold8(mi) fad4 la8(fad)
    sold4. sold8 mi4. mi8

    %19
    si'4. si8 si,4. si8
    mi2 la4 la,\mbreak
    mi r mi' sold,

    %22
    la r do la
    si sold' la la,
    mi'2 la4 la,

    %25
    mi r mi'  sold,
    la r do la\mbreak
    si sold' la la,

    %28
    mi'2 red4 fad8(red)
    mi4 sold8(mi) fad4 la8(fad)
    sold2 mi4. mi8

    %31
    si'4. si8  si,4. si8
    mi,2 mi'4 fad
    sold mi sold lad\mbreak

    %34
    si si, fad' sold
    la? fad la si
    dod dod, dod'2

    %37
    dod dod
    dod dod,
    dod dod

    %40
    dod la'4 fad
    si sold dod dod,\mbreak
    fad \parenthesize fad,  re' si

    %43
    mi dod fad fad,
    si2 si'4 sol
    do la re re,

    %46
    sol2 fad4 re
    si sol fad' re
    si sol re' mi

    %49
    fad re fad sold!\mbreak
    la la, la' si
    dod la dod red

    %52
    mi mi, mi2
    mi mi
    mi mi,
    mi mi

    %56
    mi dod''4 la
    sold mi  dod' la
    sold mi dod r

    %59
    re r si red
    mi r dod mid\mbreak
    fad2 dod4 r

    %62
    fad,2 dod'4 r
    re r si red
    mi r dod mid

    %65
    fad2 dod
    fad, dod'4 mi8(dod)
    re4 fad8(re) si4 re8(si)\mbreak

    %68
    dod4 mi8(dod) la4. la8
    mi'4. mi8 mi,4. mi8
    la2 la'4 la,

    %71
    mi' r mi sold,
    la fad r la
    si sold' la la,\mbreak

    %74
    mi'2 la4\p la,
    mi r mi' sold,
    la r dod la

    %77
    si sold' la la,
    re2 dod4 mi8(dod)
    re4 fad8(re) si4 re8(si)\mbreak

    %80
    dod4 mi8(dod) la4. la8
    mi'4. mi8 mi,4. mi8
    la2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key la\major
    \time 2/2
    \tempo 1 = 57
    \partial 2 s2
    s1*81
    s2
    \bar "|."

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

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}



IIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    mi8
    re16(dod)si(la) dod(si)
    re16 fad fad8 [mi]
    re16(dod) si(la) dod(si)

    %4
    mi,16 dod' dod8 [si]
    mi16 mi mi fad32 sold la16 [sold32 fad]
    mi16 mi mi fad32 sold la16 [sold32 fad]\mbreak

    %7
    mi16 re dod mi si mi
    la, dod mi la sol8\noBeam\p
    sol?(fad) mi

    %10
    mi(re) si
    si(la) sol
    sol?(fad) la

    %13
    do16(si) re(dod) mi re
    re, re'\f re8[mi]
    re16\p(dod) mi(re) fad(mi)

    %16
    la,16 fad'\f fad8[mi]
    la16 la la si32 dod re16[dod32 si]
    la16 la la si32 dod re16[dod32 si]

    %19
    la16 sol fad la mi la
    re, la re fad mi8\noBeam \mbreak
    re16(dod) si(la) dod(si)

    %22
    re fad fad8[mi]
    re16(dod) si(la) dod(si)
    mi,16 dod' dod8 [si]

    %25
    mi16 mi mi fad32 sold la16 [sold32 fad]
    mi16 mi mi fad32 sold la16 [sold32 fad]\mbreak
    mi16 re dod mi si mi

    %28
    la, mi dod la dod'8\noBeam\p
    \grace re16 dod(si32 dod) fad8[dod]
    \grace re16 dod(si32 dod) sold'8[dod,]

    %31
    dod16 la' la(sold) sold(fad)
    fad la\f la8[sold]
    dod,16 mi\p mi4

    %34
    red16 dod dod8[si]\mbreak
    mi16(red) fad(mi) sold(fad)
    dod sold'\f sold8[fad]

    %37
    si16 si si dod32 red mi16 [red32 dod]
    si16 si si dod32 red mi16 [red32 dod]
    si16 la sold si fad si

    %40
    mi,, sold si red mi8\noBeam\mbreak
    re!16(dod) si(la) dod(si)
    re fad fad8[mi]

    %43
    re16(dod) si(la) dod(si)
    mi, dod' dod8[si]
    mi16 mi mi fad32 sold la16[ sold32 fad]

    %46
    mi16 mi mi fad32 sold la16[ sold32 fad]\mbreak
    mi16 re dod mi si mi
    la, mi la dod mi8\noBeam

    %49
    re16(dod)si(la) dod(si)
    re16 fad fad8 [mi]
    re16(dod) si(la) dod(si)

    %52
    mi,16 dod' dod8 [si]
    mi16 mi mi fad32 sold la16 [sold32 fad]
    mi16 mi mi fad32 sold la16 [sold32 fad]\mbreak

    %55
    mi16 re dod mi si mi
    la,4.

}

IIvlIIn = \relative do'' {

    mi8
    re16(dod)si(la) dod(si)
    re16 fad fad8 [mi]
    re16(dod) si(la) dod(si)

    %4
    mi,16 dod' dod8 [si]
    mi16 mi mi fad32 sold la16 [sold32 fad]
    mi16 mi mi fad32 sold la16 [sold32 fad]\mbreak

    %7
    mi16 re dod mi si mi
    la,4 dod8\p
    dod(re) sol,

    %10
    sol?(fad) sol!
    sol?(fad) mi
    mi(re) fad

    %13
    la16(sol) fad[(mi)] sol(fad)
    re16 la'\f la8[dod]\mbreak
    si16\p(la) dod(si) re(dod)

    %16
    la re\f re8[dod]
    la'16 la la si32 dod re16[dod32 si]
    la16 la la si32 dod re16[dod32 si]

    %19
    la16 sol fad la mi la
    re,4 mi8\mbreak
    re16(dod) si(la) dod(si)

    %22
    re fad fad8[mi]
    re16(dod) si(la) dod(si)
    mi,16 dod' dod8 [si]

    %25
    mi16 mi mi fad32 sold la16 [sold32 fad]
    mi16 mi mi fad32 sold la16 [sold32 fad]\mbreak
    mi16 re dod mi si mi

    %28
    la, 4 sold8\p
    la16 la la la la la
    la sold sold sold sold sold

    %31
    la dod dod[(si) si(la)]
    la fad'\f fad8[mid]
    fad,16 \parenthesize dod'\p dod[dod dod dod]

    %34
    fad, mi mi8[red]\mbreak
    sold16(fad) la[(sold)] mi'(red)
    dod mi\f mi8[red]

    %37
    si16 si si dod32 red mi16[red32 dod]
    si16 si si dod32 red mi16[red32 dod]
    si16 la sold si fad si

    %40
    mi,4 mi'8\mbreak
    re!16(dod) si(la) dod(si)
    re fad fad8[mi]

    %43
    re16(dod) si(la) dod(si)
    mi, dod' dod8[si]
    mi16 mi mi fad32 sold la16[ sold32 fad]

    %46
    mi16 mi mi fad32 sold la16[ sold32 fad]\mbreak
    mi16 re dod mi si mi
    la,4 mi'8

    %49
    re16(dod)si(la) dod(si)
    re16 fad fad8 [mi]
    re16(dod) si(la) dod(si)

    %52
    mi,16 dod' dod8 [si]
    mi16 mi mi fad32 sold la16 [sold32 fad]
    mi16 mi mi fad32 sold la16 [sold32 fad]\mbreak

    %55
    mi16 re dod mi si mi
    la,4.

}

IIvlan = \relative do' {

    si'8
    mi, mi mi
    la,16 la' la8 [si]
    mi, mi la,

    %4
    la16 la' la8[sold]
    la,16 si dod la mi'[fad32 sold]
    la16 si dod la mi[fad32 sold]

    %7
    la16[la] la8(sold16) re
    dod16 mi la dod r8
    r r dod,\p

    %10
    si4 r8
    r r la
    la4 r8

    %13
    R4.
    r16 la\f la8[la']
    R4.

    %16
    r16 la la8[la]
    re,16 mi fad re la'[si32 dod]
    re16 sol, fad re la'[si32 dod]

    %19
    re16 re re8[(dod16) sol]
    fad8 la si\mbreak
    mi, mi mi

    %22
    la,16 la' la8[si]
    fad mi la,
    la16 la' la8[sold]

    %25
    la,16 si dod la mi'[fad32 sold]
    la16 si dod la mi[fad32 sold]\mbreak
    la16 la la8[(sold16) re]

    %28
    dod8 fad mid\p\noBeam
    fad16 fad fad fad fad fad
    mi mi mi mi mi  mi

    %31
    fad8 fad mid
    fad16 dod' dod8 [dod]
    sold,16 sold sold sold sold sold

    %34
    si si si si si si\mbreak
    si8 si si
    sold'16 si si8[si]

    %37
    mi,16 fad sold mi si'[dod32 red]
    mi16 si sold mi si'[dod32 red]
    mi16 mi, mi8[(red16) mi]

    %40
    sold,8 sold'16 la si8\mbreak
    mi, mi mi
    la,16 la' la8[si]

    %43
    mi, mi la,
    la16 la' la8[sold]
    la,16 si dod la mi'[fad32 sold]

    %46
    la16 si dod la mi[fad32 sold]\mbreak
    la16 la la8[(sold16) re]
    dod4 si'8\mbreak

    %49
    mi, mi mi
    la,16 la' la8[si]
    fad mi la,

    %52
    la16 la' la8[sold]
    la,16 si dod la mi'[fad32 sold]
    la16 si dod la mi[fad32 sold]\mbreak

    %55
    la16 la la8[(sold16) re]
    dod4.

}

IIbcn = \relative do {

    sold'8
    la la, la'
    fad16 re re8[sold]
    la la, la'

    %4
    dod,16 la la8[mi']
    dod16 si la re dod si
    dod si la re dod si\mbreak

    %7
    dod re  mi8[mi,]
    la4 r8
    r r la

    %10
    si4 r8
    r r dod
    re4 r8

    %13
    R4.
    r16 fad\f fad8 [la]
    R4.

    %16
    r16 re re8[la]
    fad16 mi re sol fad mi
    fad mi re sol fad mi

    %19
    fad sol la8[la,]
    re fad sold!\mbreak
    la la, la'

    %22
    fad16 re re8[sold]
    la la, la'
    dod,16 la la8[mi']

    %25
    dod16 si la re dod si
    dod si la re dod si\mbreak
    dod re mi8[mi,]

    %28
    la4 r8
    R4.*3
    r16 fad' fad8[dod']

    %33
    R4.*3
    r16 mi, mi8[si']
    sold16 fad mi la sold fad

    %38
    sold fad mi la sold fad
    sold la si8[si,]
    mi8[mi16 fad sold8]\mbreak

    %41
    la la, la'
    fad16 re re8[sold]
    la la, la'

    %44
    dod,16 la la8[mi']
    dod16 si la re dod si
    dod si la re dod si\mbreak

    %47
    dod re mi8 mi,
    la4 sold'8\mbreak
    la la, la'

    %50
    fad16 re re8[sold]
    la la, la'
    dod,16 la la8[mi']

    %53
    dod16 si la re dod si
    dod si la re dod si\mbreak
    dod re mi8[mi,]

    %56
    la4.

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key la\major
    \time 3/8
    \tempo 4. = 50
    \partial 8 s8
    s4.*56
    \bar "|."

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

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}



IIIglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
   		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletNumber #'transparent = ##t
		\override TupletBracket #'bracket-visibility = ##f

			}

IIIvlIn = \relative do'' {

    la4. dod8 si4 la
    re si si2-+
    mi4. la8 mi4 re

    %4
    dod4 la la2-+
    mi'8\staccatissimo la(sold la) mi\staccatissimo la(sold la)
    mi\staccatissimo sold(la si) mi, \staccatissimo sold(la si)\mbreak

    %7
    dod,4. la'8 sold4 fad-+
    mi,4 \appoggiatura mi'8 re(mi) mi,4~mi16 mi fad sold  mi4~mi16 fad sold la
    si4. re8 dod4 si

    %10
    mi sol sol2
    dod,4. mi8 re4 dod\mbreak
    fad si, si2-+

    %13
    la8 dod(si la) mi' dod(si la)
    si re(dod si) fad'\staccatissimo re(dod si)
    la'4. re,8 dod4 si

    %16
    la sold'8(la) la,4~la16  dod si la la2\fermata

}

IIIvlan = \relative do' {

    mi4. la8 sold4 fad
    fad8(la) sold4 sold2
    la4. la8 la4 sold

    %4
    la dod, dod4-+~dod16 re dod si
    la4 r la' r
    si r si r\mbreak

    %7
    mi,4. mi8 mi4(red8) la
    sold4 fad'8(sold) sold,2 sold
    mi'4. la8 sol4 fad

    %10
    sol mi mi4. si'8
    lad4. dod8 si4 lad\mbreak
    si,4 re re4~re16 fad mi re

    %13
    mi4 r la, r
    fad' r si, r
    mi4. la8 la4(sold8) re

    %16
    dod4 si'8 dod dod,2 dod\fermata

}

IIIbcn = \relative do {

    dod4. la8 mi'4 fad
    si,4 mi mi re
    dod4. dod8 dod4. mi8

    %4
    la,4 la4. si8 dod re
    dod4 r dod r
    sold r sold r\mbreak

    %7
    la4. dod'8 si4 si,
    mi2 mi mi
    sol4. (fad8) mi4 dod

    %10
    dod dod' dod,4. re16 mi
    fad4. fad8 fad4 mi
    re fad8(si) si,4~si16 re dod si

    %13
    dod4 r dod r
    re r re r
    dod4. fad8 mi4 mi,

    %16
    la2 la la\fermata

}

IIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\key la\major
\time 2/2
\tempo 2 = 60
\repeat volta 2
{s1*7
s2}
\alternative {{s2\break}{\set Score.measureLength = #(ly:make-moment 2 4) s2}}
\set Score.currentBarNumber = #9
\set Score.measureLength = #(ly:make-moment 4 4)
\repeat volta 2
{s2 s1*7}
\alternative {{s2}{s}}
\bar "|."

}


IIIvlI = {
	\IIIglobal
	%\notypeset
	<<\IIIvlIn \forma>>
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



IVglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
   		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletNumber #'transparent = ##t
		\override TupletBracket #'bracket-visibility = ##f

			}

IVvlIn = \relative do'' {

    la8. dod16 si4 la
    re8 si si2-+
    mi8. la16 mi4 re

    %4
    dod8 la la2
    mi'8 sold16(la) mi8 sold16(la) mi8 sold16(la)
    mi8 sold16(si) mi,8 sold16(si) mi,8 sold16(si)\mbreak

    %7
    dod,8. la'16 sold4 fad-+
    mi8 red16(mi) mi,4. fad16 sold mi4~mi16 fad sold la
    si8. re16 dod4 si

    %10
    mi8 sol sol2
    dod,8. mi16 re4 dod
    fad8 si, si2-+\mbreak

    %13
    la8 dod16(la) mi'8 dod16(la) mi'8 dod16(la)
    si8 re16(si) fad'8 re16(si) fad'8 re16(si)
    la'8. re,16 dod4 si

    %16
    la8 sold'16(la) la,4~la16 dod si la la2

}

IVvlan = \relative do' {

    mi8. la16 sold4 fad
    fad8 la sold4 sold
    la8. la16 la4 sold

    %4
    la8 dod, dod4-+~dod16 re dod si
    la8 r la' r la r
    si r si r si r

    %7
    mi,8. mi16 mi4(red8) la
    sold8 fad'16(sold) sold,4 ~sold sold~ sold
    mi'8. la16 sol4 fad

    %10
    sol8 mi mi4. si'8
    lad8. dod16 si4 lad
    si,8 re re4~re16 fad mi re

    %13
    mi8 r la r la r
    fad r fad r fad r
    mi8. la16 la4(sold8) re

    %16
    dod8 si'16 (dod) dod,4~dod dod2

}

IVbcn = \relative do {

    dod8. la16 mi'4 fad
    si,8 mi mi4 re
    dod8. dod16 dod4 mi

    %4
    la8 la, la4~la16 si dod re
    dod8 r dod r dod r
    sold r sold r sold r\mbreak

    %7
    \once\stemUp la8. dod'16 si4 si,
    mi4 mi2 mi
    sol8. fad16 mi4 re

    %10
    dod8 dod' dod,4. re16 mi
    fad8. fad16 fad4 mi
    re8 fad16(si) si,4~si16 re dod si\mbreak

    %13
    dod8 r dod r dod r
    re r re r re r
    dod8. fad16 mi4 mi,

    %16
    la la2 la

}

IVbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\key la\major
\time 3/4
\tempo 2 = 65
\repeat volta 2
{s2.*7
s4}
\alternative {{s2}{ s2}}
\set Score.currentBarNumber = #9
\repeat volta 2
{s4 s2.*7}
\alternative {{s2}{s}}
\bar "|."

}


IVvlI = {
	\IVglobal
	%\notypeset
	<<\IVvlIn \forma>>
}

IVvla = {
	\IVglobal
	\clef alto
	<<\IVvlan \forma>>
}

IVbc = {
	\IVglobal
	\clef bass
	<<\IVbcn \forma \IVbfn>>
	\typeset
}



Vglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
   		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletNumber #'transparent = ##t
		\override TupletBracket #'bracket-visibility = ##f

			}

VvlIn = \relative do'' {

    la16 dod si la si re dod si la dod si la
    re dod si dod si la sold la si re dod si
    mi fad sold la mi re dod  mi re dod si re

    %4
    dod si la si la mi fad sold la si dod re\mbreak
    mi la la la la la la la sold(la) sold (la)
    mi si' si si si si si si sold(si) sold(si)

    %7
    dod, mi la fad sold si sold mi fad la fad red
    mi mi red dod si la sold fad mi4\mbreak
    si'16 re! dod si dod mi re dod si re dod si

    %10
    mi fad sol la sol fad mi fad sol mi fad sol
    dod, mi re dod re fad mi re dod  mi re dod
    fad mi re dod si dod si lad si re dod si\mbreak

    %13
    la! la la la  mi 'dod si la sold(la) sold(la)
    si si si si fad'  re dod si lad(si) lad(si)
    la' fad mi re dod mi dod la si re si sold

    %16
    la la' sold fad mi re dod si la4 mi'16 re dod si la4

}

Vvlan = \relative do' {

    mi8 dod fad[re] mi[dod]
    fad32 (la) sold8. sold8 mi re sold
    la, mi' la\noBeam  la,4 sold8

    %4
    la dod dod[mi dod mi]\mbreak
    la, mi' mi[la,] mi' la,
    si mi mi[si] mi si

    %7
    la mi' mi[si'] red, la'
    sold si sold[si,] sold mi
    mi' mi sol[mi] fad re

    %10
    sol mi mi[sol] mi dod
    lad' fad si[fad] lad mi
    si si' re,[fad] re fad\mbreak

    %13
    mi mi la,[mi'] mi re
    fad fad si, [fad'] fad fad
    fad la la[la,] sold re'

    %16
    dod [mi] dod[mi] dod [la] dod[mi] dod4

}

Vbcn = \relative do {

    dod4 re dod
    si8 mi mi4 re
    dod dod si

    %4
    la la~la
    dod dod r
    sold sold r

    %7
    la8 la16 la' si4 si,
    mi mi,~mi
    sol' mi re

    %10
    dod8 dod' dod4 dod,
    fad8. fad16 fad4 mi
    re8(fad) si4 si,

    %13
    dod dod r
    re re r
    fad mi mi,

    %16
    la la~la la2

}

Vbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\key la\major
\time 3/4
\tempo 2 = 60
s2.*8
\bar":..:"
\repeat volta 2
{s2.*7 s4}
\alternative {{s2}{s}}
\bar "|."

}


VvlI = {
	\Vglobal
	%\notypeset
	<<\VvlIn \forma>>
}

Vvla = {
	\Vglobal
	\clef alto
	<<\Vvlan \forma>>
}

Vbc = {
	\Vglobal
	\clef bass
	<<\Vbcn \forma \Vbfn>>
	\typeset
}



VIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
}

VIvlIn = \relative do'' {

    mi,8
    mi4 la8 la4 dod8
    dod8. re16 mi8 <<mi4\\la,>> fad8
    sol4. la

    %4
    re,8. re16 re8 re4 la'8
    la4 re8 re4 fad8\mbreak
    fad8. sold!16 la8 <<la4\\\stemUp \shiftOn la,>> dod,8

    %7
    re4. mi
    la,8. la16 la8 la4 dod'32(si la16)
    si4 dod32(si la16) si4 dod32(si la16)

    %10
    si8. sold16 si8 <<si4\\mi,>> mi'8\mbreak
    fad8. red16 mi8 la8. fad16 sold8
    sold8. mi16 fad8 <<fad4\\si,>> red32(dod si16)

    %13
    mi4 red32(dod si16) mi4 red32(dod si16)
    la8. sold16 la8 <<fad'4\\la,>> sold8
    la4. si\mbreak

    %16
    mi,8. mi'16 mi8 mi4 mi,8
    mi4 la8 la4 dod8
    dod8. re16 mi8 <<mi4\\la,>> fad8

    %19
    sol4. la
    re,8. re16 re8 re4 la'8
    la4 re8 re4 fad8\mbreak

    %22
    fad8. sold!16 la8 la4 dod,,8
    re4. mi
    la,8. la16 la8 la4 dod'8

    %25
    re si fad fad si re
    dod lad fad fad lad dod
    re fad4 dod8 fad4\mbreak

    %28
    \grace mi16 re8. dod16 si8 <<si4\\\stemUp\shiftOn re,>> red'8
    mi dod sold sold dod mi
    red sid sold sold sid red

    %31
    mi sold4 red8 sold4
    \grace fad16 mi8. red16 dod 8 <<dod4\\\stemUp\shiftOn mi,>>  sold'16(dod,)\mbreak
    r8 r la'16(fad) r8 r red16(sid)

    %34
    dod8. sold16 dod8 dod4 mi,8
    mi4 la8 la4 dod8
    dod8. re!16 mi8 <<mi4\\la,>> fad8

    %37
    sol4. la
    re,8. re16 re8 re4 la'8
    la4 re8 re4 fad8\mbreak

    %40
    fad8. sold!16 la8 <<la4\\\stemUp \shiftOn la,>> dod,8
    re4. mi
    la,4.\fermata r8 r

}

VIvlan = \relative do' {

    dod8
    dod4 mi8 mi4 re8
    la si dod dod4 re8
    sol,8. fad16 sol8 la8. sol16 la8

    %4
    fad4 fad8 fad4 fad'8
    fad4 la8 la4 la8\mbreak
    re,8. si16 dod8 dod4 dod8

    %7
    re8. dod16 re8 mi8. re16 mi8
    dod4 dod8 dod4 mi8
    mi4 mi8 mi4 mi8

    %10
    sold8. mi16 sold8 sold4 si8\mbreak
    dod4 si8 red,4 mi8
    mi4 red8 red4 si8

    %13
    si4 si8 si4 si8
    mi4 mi8 mi4 sold,8
    la8. sold16 la8 si8. la16 si8\mbreak

    %16
    sold4 sold'8 sold4 dod,8
    dod4 mi8 mi4 mi8
    la,8. si16 dod8 dod4 re8

    %19
    sol,8. fad16 sol8 la8. sol16 la8
    fad4 fad8 fad4 fad'8
    fad4 la8 la4 la8\mbreak

    %22
    re,8. si16 dod8 dod4 dod8
    re8. dod16 re8 mi8. re16 mi8
    dod4 dod8 dod4 fad8

    %25
    fad4 re8 re4 fad8
    fad4 lad,8 lad4 fad'8
    fad si, re fad lad, dod\mbreak

    %28
    si4 re8 fad4 sold!8
    sold4 mi8 mi4 sold8
    sold4 sid,8 sid4 sold'8

    %31
    sold dod, mi sold sid, red
    dod4 mi8 sold mi dod\mbreak
    la' dod dod, sid red fad

    %34
    mi4 mi8 mi4 dod8
    dod4 mi8 mi4 mi8
    la,8. si16 dod8 dod4 re8

    %37
    sol,8. fad16 sol8 la8. sol16 la8
    fad4 fad8 fad4 fad'8\mbreak
    fad4 la8 la4 la8

    %40
    re,8. si16 dod8 dod4 dod8
    re8. dod16 re8 mi8. re16 mi8
    dod4._\fermata r8 r

}

VIbcn = \relative do {

    la8
    mi4 dod'8 dod4 la8
    la'8. si16 dod8 dod4 re8
    sol,8. fad16 sol8 la8. sol16 la8

    %4
    re,4 re,8 re4 re'8
    re4 fad8 fad4 re8\mbreak
    re'8. si16 dod8 dod4 dod,8

    %7
    re8. dod16 re8 mi8. re16 mi8
    la,4 la8 la4 la'8
    sold8. mi16 la8 sold8. la,16 la'8

    %10
    mi4 mi8 mi4 sold8\mbreak
    la4 sold8 fad4 mi8
    si'4 si,8 si4 si'8

    %13
    sold8. mi16 si'8 sold8. mi16 si'8
    dod,4 dod8 red4 mi8
    la8. sold16 la8 si8. la16 si8\mbreak

    %16
    mi,4 mi,8 mi4 la8
    la4 dod8 dod4 la8
    la'8. si16 dod8 dod4 re8

    %19
    sol,8. fad16 sol8 la8. sol16 la8
    re,4 re,8 re4 re'8
    re4 fad8 fad4 re8\mbreak

    %22
    re'8. si16 dod8 dod4 dod,8
    re8. dod16 re8 mi8. re16 mi8
    la,4 la8 la4 lad8

    %25
    si re fad fad re si
    lad dod fad fad dod lad
    si re si lad fad lad\mbreak

    %28
    si4 si8 si4 lad8
    dod mi sold sold mi dod
    sid red sold sold red sid

    %31
    dod mi dod sid sold sid
    dod4 dod8 dod4 mi8\mbreak
    fad4 fad8 sold4 sold,8

    %34
    dod4 dod8 dod4 la8
    la4 dod8 dod4 la8
    la'8. si16 dod8 dod4 re8

    %37
    sol,8. fad16 sol8 la8. sol16 la8
    re,4 re,8 re4 re'8
    re4 fad8 fad4 re8

    %40
    dod'8. si16 dod8 dod4 dod,8
    re8. dod16 re8 mi8. re16 mi8
    la,4._\fermata r8 r

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key la\major
    \time 6/8
    \tempo 2 = 57
    \partial 8 s8
    s2.*42
    \bar "|."

}


VIvlI = {
    \VIglobal
    %\notypeset
    <<\VIvlIn \forma>>
}


VIvla = {
    \VIglobal
    \clef alto
    <<\VIvlan \forma>>
}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset
}



VIIglobal = 	{
		\override Score.MetronomeMark #'transparent = ##t
   		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletNumber #'transparent = ##t
		\override TupletBracket #'bracket-visibility = ##f

			}

VIIvlIn = \relative do'' {

    la4\p
    la2(sold4) la
    la2 (mi4) fad
    fad4.(sold16 la) mi4 re

    %4
    re2(dod4) si\mbreak
    dod(mi) si(re)
    dod(mi) si(re)

    %7
    dod\staccatissimo mi\staccatissimo re\staccatissimo dod\staccatissimo
    dod2 (si4) red
    red?2(mi4) la,

    %10
    la2(sold4) mid'\mbreak
    mid?2(fad4) si,
    si(sold la) dod

    %13
    re(dod) fad(mid)
    la(sold) si \staccatissimo la\staccatissimo
    sold\staccatissimo fad\staccatissimo fad mid

    %16
    fad sold8 mid fad4 sol
    sol?(mi?) mid!(fad)\mbreak
    dod2(re4) la'

    %19
    la(fad) fadd(sold)
    red2(mi?4) si
    dod(mi) si(re)

    %22
    dod(mi) si(re)
    dod\staccatissimo fad\staccatissimo re\staccatissimo si\staccatissimo
    sold2(la4) sold2(la4)

}

VIIvlIIn = \relative do''{

    dod,4\p
    dod2(si4) dod
    dod2~dod4 re
    re4.(mi16 fad) dod4 si

    %4
    si2(la4) sold\mbreak
    la(dod) sold(si)
    la(dod) sold(si)

    %7
    la\staccatissimo dod\staccatissimo si\staccatissimo la\staccatissimo
    la2(sold4) la
    la2(sold4) red'

    %10
    red?2(mi4) si\mbreak
    si(sold la) mid'
    mid?2(fad4) r

    %13
    r dod re(dod)
    fad(mid) fad2
    re4 dod8 si la4 sold

    %16
    la (dod) dod mi
    mi(dod) dod re\mbreak
    sol2(fad4) fad

    %19
    fad(red) redd?(mi)
    la2(sold4) sold,
    la(dod) sold(si)

    %22
    la(dod) sold(fad')
    mi\staccatissimo re\staccatissimo dod\staccatissimo si\staccatissimo
    si2(la4) si2(la4)

}

VIIbcn = \relative do {

    la4
    la1~
    la~
    la2. sold4

    %4
    la4(la la) mi'\mbreak
    la,2 mi'
    la, mi'

    %7
    la, sold4 la
    mi(mi mi) fad'
    fad2(mi4) fad,

    %10
    fad2(mi4) sold'\mbreak
    sold2(fad4) sold,
    sold2(fad4) r

    %13
    R1
    r4 dod' re dod
    si2 dod

    %16
    fad,2. dod'4
    re1~\mbreak
    re2.(red4)

    %19
    mi1~
    mi2. mi4
    la,2 mi'

    %22
    la, mi'4 re
    mi2 mi,
    la4(la la) la2.
    _\markup\center-align\italic"Ripresa Scherzo 5."

}

VIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\key la\major
\time 2/2
\tempo 2. = 57
\partial 4 s4
s1*7
s2.
\bar":..:"
\repeat volta 2
{s4 s1*15}
\alternative {{s2.}{s}}
\bar "|."

}


VIIvlI = {
	\VIIglobal
	%\notypeset
	<<\VIIvlIn \forma>>
}

VIIvlII = {
	\VIIglobal
	<<\VIIvlIIn \forma>>
}

VIIbc = {
	\VIIglobal
	\clef bass
	<<\VIIbcn \forma \VIIbfn>>
	\typeset
}
#(set-global-staff-size 18)


\pointAndClickOff

\paper {

        print-first-page-number = ##t
        first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #4

    }

    \markup \huge {[1.] Presto}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"[Violino 1]"}
                        \set Staff.midiInstrument = #"violin"
                        \IvlI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"[Violino 2]"}
                        \set Staff.midiInstrument = #"violin"
                        \IvlII
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                        \set Staff.midiInstrument = #"viola"
                        \Ivla
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol.staff-space = #(magstep +1)
                    } <<
                        \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                        \set Staff.midiInstrument = #"cello"
                        \Ibc
                    >>
                >>

        \layout {

            indent = 1.4\cm

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
                \remove "Dynamic_performer"
            }
        }

    }

    \pageBreak

    \markup \huge {[2.] Scherzo 1. - Gagliardemente}

    \score {

                \new ChoirStaff <<

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
                        \override StaffSymbol.staff-space = #(magstep +1)
                    } <<
                        \set Staff.midiInstrument = #"cello"
                        \IIbc
                    >>
                >>

        \layout {

            indent = 0.8\cm

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
                \remove "Dynamic_performer"
            }
        }

    }

}

\bookpart {

    \paper {
      systems-per-page = #5
    }

    \markup \huge {[3.] Scherzo 2. - poco grave}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"viola"
                        \IIIvla
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol.staff-space = #(magstep +1)
                    } <<
                        \set Staff.midiInstrument = #"cello"
                        \IIIbc
                    >>
                >>

        \layout {

            indent = 0.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[4.] Scherz[o] 3. - poco vivace}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"viola"
                        \IVvla
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol.staff-space = #(magstep +1)
                    } <<
                        \set Staff.midiInstrument = #"cello"
                        \IVbc
                    >>
                >>

        \layout {

            indent = 0.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge\fill-line {"    ""Quelle trè spezie delle danze Poloniche alternativamente se finiscendo per la prima" "   "}

    %\pageBreak

    \markup \huge {[5.] Scherzo 4. - Allegro di molto - Pol. (?) detto}

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"viola"
                        \Vvla
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol.staff-space = #(magstep +1)
                    } <<
                        \set Staff.midiInstrument = #"cello"
                        \Vbc
                    >>
                >>

        \layout {

            indent = 0.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[6.] Scherzo 5. - Lieto }

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"viola"
                        \VIvla
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol.staff-space = #(magstep +1)
                    } <<
                        \set Staff.midiInstrument = #"cello"
                        \VIbc
                    >>
                >>

        \layout {

            indent = 0.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[7.] Scherzo 6.  Senza Viola - Tempo precedente }

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIIvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIIvlII
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol.staff-space = #(magstep +1)
                    } <<
                        \set Staff.midiInstrument = #"cello"
                        \VIIbc
                    >>
                >>

        \layout {

            indent = 0.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

