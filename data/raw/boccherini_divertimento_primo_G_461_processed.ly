\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

dolce = _\markup \italic { dolce }

rinf = _\markup \italic { rinf }

tu = ^\markup \italic "tutti"

pf = _\markup { \italic poco \dynamic f}

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

upl =
#(let ((m (make-articulation 'stopped)))
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
        \musicglyph "scripts.turn"
        \musicglyph "scripts.prall"
    }
}

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override TrillSpanner.bound-details.left.text = #'()
    \terzine
}

Ifln =\relative do'' {

    R2.*8
    la'8._\markup\italic "Sotto voce"(si16) re,4(dod)
    re8\tr fad16.(mi32) mi2

    %11
    fad8(sol la si dod re)
    la4(sol fad)
    si~si16(dod re dod \grace mi8 re dod16 si)

    %14
    la4(sol fad)
    si8(la sol fad mi re)
    re2(dod4)\mbreak

    %17
    r fad2(
    sol8) r si16(sol la fad) sol(mi fad re!)
    dod4 mi2
    fad8 r la16(fad sol mi) fad fad(si la)

    %21
    \grace la8 sold4. fad16 mi re8 re
    re4. re16 dod si8 si
    si'16(la sold la sold fad mi fad mi re dod re)

    %24
    dod8 la'16.\tr si32 la8 la4 la8~\mbreak
    la8 la16.\tr si32 la8 la4 la8~
    la r r4 r

    %27
    r r re,\pf~
    re dod(red)
    mi2.~\p

    %30
    mi4 la2~
    la16 (fad mi re) dod(mi la, dod) \grace dod8 si la16 sold
    la8 la'16.\tr si32 la8 la4 la8~\mbreak

    %33
    la8 la16.\tr si32 la8 la4 la8~
    la r r4 r
    r r re,\rinf~

    %36
    re dod(red)
    mi2.~\dolce
    mi4 la2~

    %39
    la16 (fad mi re dod mi la, dod) \slashedGrace dod8 si la16 sold
    la4 r r\mbreak
    R2.

    %42
    la4\pp_\startTrillSpan la la\stopTrillSpan
    la2.
    la'

    %45
    sold
    sol!8 sol16.\tr la32 sol8 sol4 sol8
    fad(la sol fad mi re)

    %48
    dod(si la sol fad mi)
    fad(sol la si dod re)
    re16(dod si la sol4 fad)~\mbreak

    %51
    fad4\tr mi r
    R2.*20
    la'8.\dolce(si16) re,4(dod)

    %73
    re8\tr fad16.(mi32) mi2
    fad8(sol la si dod re)
    la4(sol fad)

    %76
    si~si16(dod re dod) \grace mi8 re (dod16 si)
    la(sol) sol(fad) fad(sol) sol(la) la(si) si(do)
    do?(si) la(si) la(sol) fad(sol) fad mi re do

    %79
    si\pf \upl si(re dod!) dod2\tr
    re16\upl re(fad mi) mi2\tr \mbreak
    fad8\pf  la16(sol!) sol2

    %82
    \slashedGrace sol8 fad\p mi16 re dod2
    re16\pf(fad la sol) sol2
    \slashedGrace sol8 fad mi16 re dod2

    %85
    re8 re16.\tr mi32 re8 re4 re8~
    re re16.\tr mi32 re8 re4 re8
    re r r4 r

    %88
    r r sol\mbreak
    sol\rinf(fad sold)
    la2.\p~

    %91
    la4 re,2~
    re16(si' la sol? fad la re, fad) \slashedGrace fad8 mi re16 dod
    re8 re16.\tr mi32 re8 re4 re8~

    %94
    re re16. \tr mi32 re8 re4 re8
    re r r4 r
    r r sol~\mbreak

    %97
    sol\rinf(fad sold)
    la2.\p~
    la4 re,2~

    %100
    re16(si' la sol?) fad (la re, fad \slashedGrace fad8 mi re16 dod)
    re4 r r
    R2.*3

}

IvlIn =\relative do'' {

    la8.\p(si16) re,4(dod)
    re8\tr fad16. (mi32) mi2
    fad8(sol la si dod re)

    %4
    la4 (sol fad)
    si4~si16 dod re dod\slashedGrace mi8 re dod16 si
    la4(sol fad)

    %7
    si8(la sol fad mi re)\mbreak
    re2 dod8 r
    la'8.(si16) re,4(dod)

    %10
    re8\tr fad16. (mi32) mi2
    fad8(sol la si dod re)
    la4 (sol fad)

    %13
    sol8 si~si16 dod re dod \slashedGrace mi8 re dod16 si
    la8 la sol sol fad fad
    R2.*3

    %18
    si'16(sol! la fad sol mi fad red) mi8 r
    R2.
    la16(fad sol mi fad re? mi dod) re(fad si la)

    %21
    \grace la8 sold4. fad16 mi re8 re
    re4. re16 dod si8 si
    si'16(la sold la sold fad mi fad mi re dod re)

    %24
    dod8 la'16.\tr si32 la8 r r4\mbreak
    r8 la16.\tr si32 la8 r r4
    r16 la, (sol la) si(dod re red mi mid fad dod)

    %27
    re? lad(si dod re red mi mid) fad\pf(sold la si)
    sold4 la2
    \slashedGrace la8 sold\p(fad16 mi) re!8 ^\startTrillSpan re re re \stopTrillSpan

    %30
    \slashedGrace re8 dod si16 la  sol!8 _\startTrillSpan sol sol sol \stopTrillSpan
    fad16 fad' mi re dod mi la, dod \slashedGrace dod8 si la16 sold
    la8 la'16.\tr si32 la8 r r4\mbreak

    %33
    r8 la16.\tr si32 la8 r r4
    r16 la, (sol la) si(dod re red mi mid fad dod)
    re lad(si dod re red mi mid) fad\pf(sold la si)

    %36
    sold4 la2~
    \slashedGrace la8 sold\p(fad16 mi) re!8 ^\startTrillSpan re re re \stopTrillSpan
    \slashedGrace re8 dod si16 la  sol!8 ^\startTrillSpan sol sol sol \stopTrillSpan

    %39
    fad16 (fad' mi re dod mi la, dod) \slashedGrace dod8 si la16 sold
    la(la') la(sold) sold(fad) fad(mi) mi(fad) fad(mi)\mbreak
    mi\pp(re) re(dod) dod(re) re(dod) dod(si) si(la)

    %42
    la(fad) fad(mi) mi(fad) fad(mi) mi(re) re(dod)
    dod2.
    la''8\p la16.\tr si32 la8 la,4 la8

    %45
    sold sold4 sold sold8
    sol! sol4 sol sol8
    fad fad'(mi re dod si)

    %48
    la(sol fad mi re dod)
    re8 r r4 r
    la''2.~\p\mbreak

    %51
    la4 la, r
    dod16. dod32 dod8\tr fad4 mi\pf~
    mi re8(dod si la)

    %54
    sold2 dod,4~
    dod r r
    R2.

    %57
    r4 r8 fad'\dolce\noBeam fad(sol!)
    sol(mi) r16 sol fad sol \slashedGrace la8 sol fad16 mi
    re8.\tr mi16 fad8 fad(mi re)

    %60
    dod4 re8 mid \slashedGrace sol8 fad mid16 re\mbreak
    dod8(mi? re fad mi re)
    dod4 re8 mid \slashedGrace sol8 fad mid16 re

    %63
    dod8 dod,4 dod8\noBeam dod r
    R2.*8
    fad2\pp(mi4)

    %73
    re8 la la la la la
    la r r4 r
    la2(la'4)

    %76
    si~si16 dod re dod \slashedGrace mi8 re dod16 si
    la(sol) sol(fad) fad(sol) sol(la) la(si) si(do)
    do?(si) la(si) la(sol) fad(sol) fad mi re do

    %79
    si4 la8 la'4 la8~
    la8 la4 la la8~\mbreak
    la8\pf la4 la la8~

    %82
    la8\p la4 la la8~
    la8\pf la4 la la8~
    la8\p la4 la la8~

    %85
    la8 re16.\tr mi32 re8 r r4
    r8 re16.\tr mi32 re8 r r4
    r16 re,(dod re mi fad sol sold) la(lad si fad)

    %88
    sol?(red mi fad sol sold la lad) si\rinf(dod re mi)\mbreak
    dod4 re2
    \slashedGrace re8 dod\p(si16 la) sol!8 sol sol sol

    %91
    \slashedGrace sol8 fad mi16 re do8 do do do
    si16(si' la sol fad la re, fad) \slashedGrace fad8 mi (re16 dod?)
    re8 re'16.\tr mi32 re8 r r4

    %94
    r8 re16.\tr mi32 re8 r r4
    r16 re,(dod re mi fad sol sold la lad si fad)
    sol?16 (red mi fad sol sold la lad) si\rinf(dod re mi)\mbreak

    %97
    dod4(re2)
    \slashedGrace re8 dod\p(si16 la) sol!8 _\startTrillSpan sol sol sol \stopTrillSpan
    \slashedGrace sol8 fad mi16 re do8 _\startTrillSpan do do do \stopTrillSpan

    %100
    si16 si'( la sol fad la re, fad) \slashedGrace fad8 mi re16 dod?
    re\pp(re') re(dod) dod(si) si(la) la(si) si(la)
    la(sol) sol(fad) fad(sol) sol(fad) fad(mi) mi(re)

    %103
    re(si) si(la) la(si) si(la) la(si) si(la)
    la8 _\startTrillSpan la la la \stopTrillSpan la4

}


IvlIIn =\relative do'' {

    la,8\p la4 la la8~
    la la _\startTrillSpan la la la la\stopTrillSpan
    la8 r r4 r
    la2.
    sol8 sol'~sol16 (la si la \slashedGrace do8 si la16 sol)
    fad4(mi re)~
    re si'8(la sol fad)\mbreak
    fad2 mi8 r
    fad2 mi4
    re8\noBeam la _\startTrillSpan la la la la\stopTrillSpan
    la r r4 r
    la2.
    si8 r r4 r
    r r r8 re'
    si(la sol fad mi re)
    re2 (dod4)\mbreak
    si8 si'4 \slashedGrace re8 do16. si32 si8 si
    si2.
    la4. \slashedGrace dod8 si16 la la8 la
    la2~la8 re
    \slashedGrace dod8 si4. la16(sold) \once\stemUp sold8 si'
    \grace la8 sold4. fad16 mi re8 re
    re16(dod si dod) re (la sold la) sold8 sold
    la4 r16 mi_\upl mi_\upl mi_\upl fad_\upl fad_\upl fad8_\tr\mbreak
    mi8 r r16 mi_\upl mi_\upl mi_\upl fad_\upl fad_\upl fad8_\tr
    mi8_\upl r r4 r
    r r re'\pf~
    re dod(red)
    \slashedGrace fad8 mi\p re!16 dod si8 si4 si8
    \slashedGrace si8 la sol!16 fad mi8 mi4 mi8
    re la'4 dod,16 mi \slashedGrace mi8 re(dod16 si)
    dod8 r r16  mi_\upl mi_\upl mi_\upl fad_\upl fad_\upl fad8_\tr\mbreak
    mi8 r r16 mi_\upl mi_\upl mi_\upl fad_\upl fad_\upl fad8_\tr
    mi r r4 r
    r r re'\pf ~
    re dod red
    mi8 \p red16 dod si8 si4 si8
    \slashedGrace si8 la sol!16 fad mi8 mi4 mi8
    re la'4 dod,16 mi \slashedGrace mi8 re(dod16 si)
    dod(fad) fad(mi) mi(re) re(dod) dod(re) re(dod)\mbreak
    dod\pp(si) si(la) la(fad') fad(mi) mi(re) re(dod)
    dod(re) re(dod) dod(re) re(dod) dod(si) si(la)
    la2.

    %44
    R2.
    si''8\p (si16. dod32) si8 si,4 re8
    dod2.
    re8(fad mi re dod si)
    la(sol fad mi re dod)
    re( mi fad sol mi fad)
    fad16(la sol fad) mi4 re  \mbreak
    re\tr dod r
    fad2.~
    fad4 r re'\pf~
    re dod8(si la sold)
    la8.\tr\dolce si16 dod8 dod(\slashedGrace si la \slashedGrace sol? fad)
    fad4 mid16 re'!(dod re) \slashedGrace dod8 si la16 sold
    sold?4(fad8) fad4 mi8~
    mi sol!4 mi dod8
    si8._\tr dod16 re8 re'(dod si)
    lad4 si8 (dod) re [fad,~]\mbreak
    fad fad4  re'8(dod si)
    lad4 si8 dod \slashedGrace mi re dod16(si)
    lad8 lad,4 lad8 lad\noBeam r
    fad''8.\dolce(sol!16) si,4(lad)
    si8\tr re16(dod) dod2
    re8[(mi fad sol!)] lad si16.(sol32)
    fad4(mi re)
    sol4~sol16 la si la \slashedGrace dod8 si la16 sol
    fad4(mi re)
    sol8(fad mi re dod si)\mbreak
    si2 lad4
    la!8.\pp(si16) re,4(dod)
    re8_\tr fad16. mi32 mi2
    fad8(sol la si dod re)
    la4(sol fad)
    sol~sol16 la si la \slashedGrace dod8 si la16 sol
    fad(mi) mi(re) re(mi) mi(fad) fad(sol) sol (la)
    la(sol fad sol) fad(mi re mi) re(do si la)
    sol(si re dod!) dod2
    re16_\upl re(fad mi) mi2\mbreak
    fad8\tr \rinf la16 sol! sol2
    \slashedGrace sol8 fad\p mi16 re dod2
    re16\rinf(fad la sol) sol2
    \slashedGrace sol8 fad\p mi16 re dod2
    re8 r r16 la'_\upl la_\upl la_\upl si\upl si\upl si8\tr
    la r r16 la_\upl la_\upl la_\upl si si si8\tr
    la8 r r4 r
    r r sol~\mbreak
    sol\rinf fad(sold)
    la8\p sol!16 fad mi8 mi4 mi8
    re do16 si la8 la4 la8
    sol re'4 fad16(la) \slashedGrace la8 sol(fad16 mi)
    fad8 r r16  la_\upl la_\upl la_\upl si \upl si\upl si8\tr
    la r r16 la_\upl la_\upl la_\upl si si si8\tr
    la r r4 r
    r r sol~\mbreak
    sol\rinf fad(sold)
    la8\p sol!16 fad mi8 mi4 mi8
    \slashedGrace mi8 re do16 si la8 la4 la8
    sol re'4 fad16(la) \slashedGrace la8 sol(fad16 mi)
    re4 r r
    R2.
    re8\pp re4 re re8~
    re_\startTrillSpan re re re\stopTrillSpan re4

}


Ivlan =\relative do' {

    re,4\pp(fad sol)
    fad dod2
    re8[(mi fad sol)] la( si16. sol32)

    %4
    fad4 mi re~
    re8 re' re re re re
    re re la la re, re

    %7
    sol4 sol sol\mbreak
    la8 la la la la\noBeam r
    la la4 la la8~

    %10
    la la sol\noBeam sol4 sol8
    <<{re'\upl [mi]}\\ fad,>> fad'[sol] la(si16. sol32)
    fad4 mi\tr re

    %13
    sol8 sol~sol16 (la si la \slashedGrace dod8 si la16 sol)
    fad8 fad mi mi re re
    sol(fad si la sol fad)

    %16
    fad2(mi4)\mbreak
    red8 red4 red red8
    mi r r4 r

    %19
    dod8 dod4 dod dod8
    re r r4 r
    r8 si si si si si

    %22
    si si si si sold' sold
    <<{s2 mi8 mi}\\{mi mi mi mi si si}>>
    <<mi4\\la,>> r16 dod\upl dod\upl dod\upl re\upl re\upl re8\tr \mbreak

    %25
    dod8 r r16 dod\upl dod\upl dod\upl re re re8\tr
    dod r r4 r
    r r re8\pf re

    %28
    si(si la la fad' fad)
    si,4 r8 sold(mi sold)
    la4 r8 dod(la dod)

    %31
    re fad mi mi mi mi
    mi r r16 dod\upl dod\upl dod\upl re\upl re\upl re8\tr\mbreak
    dod8 r r16 dod\upl dod\upl dod\upl re\upl re\upl re8\tr

    %34
    dod r r4 r
    r r re8\pf re
    si si la la fad' fad

    %37
    si,4\p r8 sold(mi sold)
    la4 r8 dod(la dod)
    re fad mi mi mi mi

    %40
    la,2.~\mbreak
    la~
    la4 la la

    %43
    la8 la la la la4
    dod8 dod dod dod dod dod
    re re re re re re

    %46
    mi mi mi mi mi mi
    fad(la sol fad mi re)
    dod(si la sol fad mi)

    %49
    re r r4 r
    R2.\mbreak
    r4 mi'8 mi(dod si)

    %52
    lad4 dod'2\pf ~
    dod4 si8 la! sold fad
    mid mid mid mid mid mid

    %55
    fad8.\tr\p sold16 la8[la, la la]
    si8 si si si si si
    dod dod dod dod dod dod

    %58
    dod dod dod dod dod fad
    fad4 si,8(re mi mid)
    fad4 fad, fad\mbreak

    %61
    dod'8(lad si re mi mid)
    fad4 fad, fad
    fad16 fad'(mid fad) fad,8 fad fad'16(mi re dod)

    %64
    si4 re(mi)
    re lad2
    si8[dod re mi] fad sol!16. mi32

    %67
    re8 re dod dod si si
    mi mi~mi16(fad sol fad) \slashedGrace la8 sol fad16 mi
    re4 dod si~

    %70
    si sol'8(fad mi re)\mbreak
    re2(dod4)
    la8\pp la4 la la8~

    %73
    la8[la] sol sol4 sol8
    <<{re'([ (mi fad sol)] la si16. sol32}\\fad,8>>
    fad' fad mi mi re re

    %76
    re,2.~
    re4 r r
    R2.

    %79
    r4 mi'8 mi4 mi8
    <<
        {
            fad fad sol sol sol sol\mbreak
            fad\pf fad mi mi mi mi

            %82
            fad\p fad sol sol sol sol
            fad\rinf fad mi mi mi mi
            fad\p fad sol sol sol sol

            %85
            sol8
        }\\{
            la, la la la la la
            la la la la la la
            la la la la la la
            la la la la la la
            la la la la la la
            la8
        }
    >> r r16 fad'\upl fad\upl fad\upl sol sol sol8\tr
    fad r r16 fad\upl fad\upl fad\upl sol sol sol8\tr
    fad r r4 r

    %88
    r r sol8 sol\mbreak
    mi8\rinf mi re re si' si
    mi,4\p r8 dod(la dod)

    %91
    re4 r8 fad,(re fad)
    sol si la la la la
    la r r16 fad'\upl fad\upl fad\upl sol sol sol8\tr

    %94
    fad r r16 fad\upl fad\upl fad\upl sol sol sol8\tr
    fad r r4 r
    r r sol\mbreak

    %97
    mi8\rinf mi  re re si' si
    mi,4\p r8 dod(la dod)
    re4 r8 fad,(re fad)

    %100
    sol si la la la la
    re16\pp(si') si(la) la(sol) sol(fad) fad(sol) sol(fad)
    fad(mi) mi(re) re(si) si(la) la(sol) sol(fad)

    %103
    fad(sol) sol(fad) fad(sol) sol(fad) fad(sol) sol(fad)
    fad8_\startTrillSpan fad fad fad\stopTrillSpan fad4

}


IvcIn =\relative do {

    R2.*8
    re4\p(fad sol)
    fad4 dod2

    %11
    re8 r r4 r
    r4 dod'(re)
    re,8 re re re re re

    %14
    <<{la'4 dod re}\\{re, mi fad}>>
    sol sol,2
    la8 la' la, la la la\mbreak

    %17
    la la' la la la la
    sol red mi si mi,\noBeam r
    sol sol' sol sol sol sol

    %20
    fad dod(re) la re, [re']
    mi8 mi mi mi mi mi
    mi8 mi mi mi mi mi

    %23
    mi8 mi mi mi mi mi
    la,4 r8 la _\startTrillSpan la la \stopTrillSpan\mbreak
    la4 r8 la la la

    %26
    la r r4 r
    r r re8\pf re
    mi mi fad fad fad, fad

    %29
    mi4 r8 mi'(sold mi)
    la4 r8 la,(dod la)
    re re mi mi mi mi

    %32
    la,4 r8 la la la\mbreak
    la4 r8 la la la
    la4 r r

    %35
    r r re8\pf re
    mi mi fad fad fad, fad
    mi4 r8 mi'\pp(sold mi)

    %38
    la4 r8 la,(dod la)
    re re mi mi mi mi
    la, la la la la la\mbreak

    %41
    la la la la la la
    la la la la la la
    la  _\startTrillSpan la la la \stopTrillSpan la4

    %44
    la8 la la la la la
    la la'4 la la8
    \clef tenor \key re\major la'8 la4 la8~la16 sol fad mi

    %47
    re8 la4 la la8
    la,2.
    re4 r r

    %50
    r dod'(re)\mbreak
    la la, r
    \clef bass \key re\major lad8 lad lad lad lad\pf lad

    %53
    si4 si si(
    dod) dod dod
    fad8\p fad fad fad fad fad

    %56
    sol sol sol sol sol sol
    la la la la la la
    lad, lad lad lad lad lad

    %59
    si si si(re mi mid)
    fad(mi! re dod si) si'\mbreak
    lad dod si(re, mi mid)

    %62
    fad mi! re dod si si'
    fad16\upl fad (mid fad) fad,8 fad fad\noBeam r

    %64
    \clef tenor \key re\major fad''2.~
    fad~
    fad8 r r4 r

    %67
    \clef bass \key re\major si, fad si,~
    si8 si si si si si
    si(re fad lad si) si,

    %70
    mi4 mi, mi\mbreak
    fad8 fad fad fad fad fad
    fad4\pp fad'(sol)

    %73
    fad dod2
    re8 r r4 r
    r dod'(re)

    %76
    re,8 re re re re re
    <<re2.\tenuto\\re>>
    <<{re4 re re}\\{re re re}>>

    %79
    sol,8 sol' sol sol sol sol
    fad4 dod2\mbreak
    re8\pf la la la la la

    %82
    la\p la la la la la
    la\rinf la la la la la
    la\p la la la la la

    %85
    re,4 r8 re' re re
    re4 r8 re re re
    re4 r r

    %88
    r r sol,8 sol\mbreak
    la\rinf  la si si si si
    la4 r8 la'\p(dod la)

    %91
    <<re4\\re,>> r8 re(fad re)
    sol sol, la la la la
    <<re4\\re>> r8 re re re

    %94
    <<re4\\re>> r8 re re re
    <<re4\\re>> r r
    r r sol,8 sol\mbreak

    %97
    la\rinf la si si si si
    la4 r8 la\p(dod la)
    re4 r8 re(fad re)

    %100
    sol sol, la[la la la]
    <<{re8\pp re re re re re}\\{re re re re re re}>>
    <<{re re re re re re}\\{re re re re re re}>>

    %103
    <<{re re re re re re}\\{re re re re re re}>>
    <<{re re re re re4}\\{re8 re re re re4}>>

}


IvcIIn =\relative do {

    R2.*8
    re4\p(fad sol)
    fad4 dod2

    %11
    re8 r r4 r
    re8 re la la re, re
    re re re re re re

    %14
    re re' la la re, re
    sol4 sol sol
    la2.\mbreak

    %17
    la8 la' la la la la
    sol red mi si mi,\noBeam r
    sol sol' sol sol sol sol

    %20
    fad dod(re) la re, [re']
    mi8 mi mi mi mi mi
    mi8 mi mi mi mi mi

    %23
    mi8 mi mi mi mi mi
    la,4 r8 la _\startTrillSpan la la \stopTrillSpan\mbreak
    la4 r8 la la la

    %26
    la r r4 r
    r r re\rinf
    mi(fad) fad,

    %29
    mi r8 mi'(sold mi)
    la4 r8 la,(dod la)
    re re mi mi mi mi

    %32
    la,4 r8 la la la\mbreak
    la4 r8 la la la
    la4 r r

    %35
    r r re\pf (
    mi fad) fad,
    mi4 r8 mi'\pp(sold mi)

    %38
    la4 r8 la,(dod la)
    re re mi mi mi mi
    la,4 r r\mbreak

    %41
    la r r
    la la la
    la8 _\startTrillSpan la la la\stopTrillSpan la4

    %44
    la8 la la la la la
    la8 la la la la la
    la8 la la la la la

    %47
    la4 la la
    la2.
    re,4 r r

    %50
    re' la re,\mbreak
    la'2 r4
    lad8 lad lad lad lad\pf lad

    %53
    si4 si si(
    dod) dod dod
    fad, r r

    %56
    R2.*2
    lad8\p lad lad lad lad lad
    si4 r r

    %60
    r r si\mbreak
    fad' si, r
    r r si

    %63
    fad'16\upl fad (mid fad) fad,8 fad fad\noBeam r
    R2.*8
    re4\pp fad'(sol)

    %73
    fad dod2
    re8 r r4 r
    re8 re la la re, re

    %76
    re re re re re re
    re2.\tenuto
    re4 re re

    %79
    sol8 sol' sol sol sol sol
    fad la, la la la la\mbreak
    \clef tenor \key re\major la'4\rinf dod2

    %82
    re4\p mi2
    re4\rinf dod2
    re4\p mi2

    %85
    re4 \clef bass \key re\major r r
    re,4 r r
    re r r

    %88
    r r sol,8 sol\mbreak
    la4\rinf si2
    la4 r8 la\p(dod la)

    %91
    re4 r8 re,(fad re)
    sol8 sol  la la la la
    re,4 r r

    %94
    re r r
    re r r
    r r sol\mbreak

    %97
    la\rinf si2
    la4 r8 la\p(dod la)
    re4 r8 re(fad re)

    %100
    sol, sol la la la la
    re,4\pp r r
    re r r

    %103
    re re re
    re2.

}

forma = {

    \time 3/4
    \key re\major
    \tempo 2 = 43
    s2.*104
    \bar "|."

}


Ifl = {
    \Iglobal
    <<\Ifln \forma>>
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


IvcI = {
    \Iglobal
    \clef bass
    <<\IvcIn \forma>>
}


IvcII = {
    \Iglobal
    \clef bass
    <<\IvcIIn \forma>>
}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto
}

IIfln =\relative do'' {

    \con r16 r4
    R1*4
    r2 sib'\p~
    sib la\f~

    %7
    la4 sib8. sol16 \slashedGrace sol8 fa8. mi16 \slashedGrace mi8 re8. dod16
    re8. re16 \slashedGrace re8 do!8. sib16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16\mbreak
    re4 r r2

    %10
    R1*3
    r2 sib''\p~
    sib la~

    %15
    la2. r4
    R1
    fa2\f sol

    %18
    la4.\tr sib8 do4 do\mbreak
    re re, \grace do'8 sib4 la8 sol
    \grace fa8 mi4. fa16 sol fa4 r

    %21
    R1*5
    sib4\dolce sib16(do sib la) sol8 sol sol sol
    sol1\mbreak

    %28
    sib4 sib16(do sib la) sol8 sol sol sol
    sol1~
    sol4 r sib4 sib16(do sib la)

    %31
    sol8.\f fa16 \slashedGrace fa8 mi8. re16 \slashedGrace re8 do8. sib16 \slashedGrace sib8 la8. sol16
    fa4 r \tuplet 3/2 { do''8(re do) } mi,8.[mi16]
    do'4(fa,) \tuplet 3/2 { do'8(re do) } sol8.[sol16]

    %34
    do4(la) \tuplet 3/2 { do8(re do) } mi,8.[mi16]
    do'4(fa,) \tuplet 3/2 { do'8(re do) } sol8.[sol16]\mbreak
    do4 la \sestine \tuplet 6/4 {
        do8(re sib la sib sol)

        %37
        la (sib sol fa sol mi) fa(sol mi re mi do)
    }
    si2 \tuplet 6/4 { sol'8(fa mi re do sib)}
    \terzinequarto \tuplet 3/2 { la fa' mi \slashedGrace mi8 re [do sib] } la4 sol\tr

    %40
    \senza fa r \tuplet 3/2 { do''8(re do) mi,\upl[mi\upl mi\upl] }
    \tuplet 3/2 { do'8(re do) fa,\upl[fa\upl fa\upl] } \tuplet 3/2 { do'8(re do) sol\upl[sol\upl sol\upl] }
    \tuplet 3/2 { do8(re do)} la\noBeam\upl r \tuplet 3/2 { do8(re do) mi,\upl[mi\upl mi\upl] }\mbreak

    %43
    \tuplet 3/2 { do'8(re do) fa,\upl[fa\upl fa\upl] } \tuplet 3/2 { do'8(re do) sol\upl[sol\upl sol\upl] }
    \tuplet 3/2 { do8(re do)} la\noBeam\upl r \sestine \con \tuplet 6/4 {
        do (re sib la sib sol)
        la (sib sol fa sol mi) fa(sol mi re mi do)
    }

    %46
    si2 \tuplet 6/4 { sol'8(fa mi re do sib) }
    \terzinequarto \tuplet 3/2 { la fa' mi \slashedGrace mi8 re [do sib] } la4 sol\tr\f
    fa4 r r2

    %49
    R1
    r2 r4 do'
    re2(mi)\mbreak

    %52
    fa4 r r2
    R1
    r2 r4 do\f

    %55
    re8.\f fa16 \slashedGrace fa8 mi8. re16 \slashedGrace re8 do8. sib16 \slashedGrace sib8 la8. sol16
    fa2 r fa2 r4 do''\p
    \appoggiatura sib8 la2. sib4

    %58
    \appoggiatura la8 sol2. la4
    \appoggiatura sol8 fa4 mi8 (fa sol re sol fa)
    \grace fa8 mi4. re8 do4 do'\mbreak

    %61
    \appoggiatura sib8 la2. sib4
    \appoggiatura la8 sol2. la4
    fa4 re'8(sib) sib(la) la[(sold)]
    la4 la8.\tr sold32 la la,4 r

    %65
    re2\f  mi
    fa4.\tr sol8 la4 la
    sib sib, \grace la'8 sol4 fa8 mi
    \grace re8 dod4. re16 mi re4 r\mbreak

    %69
    la1\p
    la'
    do8. sib16\slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mib16 \slashedGrace mib8 re8. do16

    %72
    sib4 r r2
    sol'2\f la
    \slashedGrace do8 sib4.\tr do8 re4 re

    %75
    mib mib, \grace sib'8 do4 sib8 la
    \slashedGrace sol8 fad4. sol16 la sol4 r\mbreak
    re1\p

    %78
    fa
    lab8.\f sol16 \slashedGrace sol8 fa8. mib16 \slashedGrace mib8 re8. do16 \slashedGrace do8 sib8. lab16
    sol4\p sol'2 sol4

    %81
    sol1 ~
    sol
    sold\mbreak

    %84
    la4 mi2 mi4
    fa1
    mi

    %87
    fa
    mi2 r
    R1*4

    %93
    r2 sib'~
    sib la
    la r

    %96
    r r4 la,\p
    la'4(sol fa mi)

    %98
    re1\rinf
    dod8 (re mi fa sol4 sold)
    la4 r r la,\mbreak

    %101
    la'4(sol fa mi)
    re1\pf
    dod8 (re mi fa sol4 sold)

    %104
    la r r2
    R1
    sol4\p sol16(la sol fa) mi8 mi mi mi

    %107
    mi1
    sol4 sol16(la sol fa) mi8 mi mi mi\mbreak
    mi1~

    %110
    mi4 r sol\< sol16(la sol fa)\!
    mi8.\f re16 \slashedGrace re8 dod8. sib16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16
    re4 r \terzinequarto\con  \tuplet 3/2 { la''8\dolce(sib la) } dod,8.[dod16]

    %113
    la'4(re,) \tuplet 3/2 { la'8(sib la) } mi8.[mi16]
    la4 (fa) \tuplet 3/2 { la8(sib la) }  dod,8.[dod16]
    la'4(re,) \tuplet 3/2 { la'8(sib la) } mi8.[mi16]\mbreak

    %116
    la4 (fa) \tuplet 3/2 { la8(sib sol)  fa[(sol mi)]}
    \sestine \tuplet 6/4 { fa(sol mi re mi dod) re(mi do sib do la) }
    sold2 \tuplet 6/4 {  mi'8 (re dod sib la sol) }

    %119
    \terzinequarto \tuplet 3/2 { fa(re' la) sib[(sol' mi)] } mi2\tr
    re4 r \tuplet 3/2 { la'8(sib la) \senza dod,\upl [dod\upl dod\upl] }\mbreak
    \tuplet 3/2 {
        la'(sib la) re,\upl[(re\upl re\upl)] la'(sib la) mi\upl[mi\upl mi\upl]

        %122
        la(sib la) fa\upl[(fa\upl fa\upl)]  la8(sib la) dod,\upl [dod\upl dod\upl]
    }
    \tuplet 3/2 {
        la'(sib la) re,\upl[(re\upl re\upl)] la'(sib la) mi\upl[mi\upl mi\upl]
        la(sib la) fa\upl[(fa\upl fa\upl)]
    } \sestine\con \tuplet 3/2 {
        la(sib sol fa sol mi)

        %125
        fa(sol mi re mi dod) re(mi do sib do la)
    }
    \grace la8 sold2 \tuplet 6/4 {  mi'8 (re dod si? la sol?) }\mbreak
    \terzinequarto \tuplet 3/2 { fa(re' la) sib[(sol' mi)] } mi2\tr

    %128
    re4 r  r2
    R1
    r2 r4 la

    %131
    sib2 dod
    re4 r r2\mbreak
    R1

    %134
    r2 r4 la
    sib8.\f sib'16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16 \slashedGrace mi8 re8. dod16
    re4 re8.\tr dod32 re re,4

}

IIvlIn =\relative do'' {

    la16 \dolce la8.\tr sold32 la
    fa'4(mi re) do\upl
    \grace do8 sib4(la) r sib
    \grace la8(sol2. la4)

    %4
    \appoggiatura sol8 (fa2.) fad4(
    sol la) sib2~
    sib la8\f[(dod mi8. sol16)]

    %7
    fa8. re16 sib'8. sol16 \slashedGrace sol8 fa8. mi16 \slashedGrace mi8 re8. dod16
    <re re,>2 r8 r16 la\dolce la8.\tr sol32 la\mbreak
    fa'4(mi re) do\upl

    %10
    \appoggiatura do8 sib4 la r sib
    \appoggiatura la8 sol2. la4
    \appoggiatura sol8 fa2. fad4

    %13
    sol la sib2~
    sib la8(dod mi sol)
    sol(fa la sol) \grace sol8 fa2\tr

    %16
    mi4 r r2
    fa2\f sol
    la4.\tr sib8 do4 do\mbreak

    %19
    re re, \grace do'8 sib4 la8 sol
    \grace fa8 mi4. fa16 sol fa4 r
    fa,2\p sol

    %22
    la4. sib8 do4 do
    re8 re,(mi fa sol la sib sol)
    \slashedGrace fa8 mi4. re8 do4 do(

    %25
    sib') sib16(do sib la) sol8 sol sol sol
    sol'4.(fa8) mi4 r
    sib sib16(do sib la) sol8 sol sol sol\mbreak

    %28
    sol'4.(fa8) mi4 r
    sib sib16(do sib la) sol8 sol sol sol
    sol'4\< sol16(la sol fa) mi8 mi mi mi\!

    %31
    sib'8.\f la16 \slashedGrace la8 sol8. fa16 \slashedGrace fa8 mi8. re16 \slashedGrace re8 do8. sib16
    \grace sib8 la4  do'\dolce r do
    r do r do

    %34
    r do r do
    r do r do\mbreak
    r do r2

    %37
    R1
    r2 do,~
    do4 \slashedGrace do8 \tuplet 3/2 { sib8 la sol } fa4 mi\tr

    %40
    fa do'' r do
    r do r do
    r do r do\mbreak

    %43
    r do r do
    r do r2
    R1

    %46
    r2 do,~
    do4 \slashedGrace do8 \tuplet 3/2 { sib8 la sol } fa4 mi\tr
    fa2 r8 r16 do'\p do8.\tr si32 do

    %49
    la'4(sol fa mi
    re do sib? la)
    re2 mi,\mbreak

    %52
    fa4 r r8 r16 do' do8.\tr si?32 do
    la'4(sol fa mi
    re do sib? la)

    %55
    re8.\f fa16 \slashedGrace fa8 mi8. re16 \slashedGrace re8 do8. sib16 \slashedGrace sib8 la8. sol16
    fa2 r8 r16 la16 \dolce la8.\tr sold32 la fa2 r4 do'\p
    \appoggiatura sib8 la2. sib4

    %58
    \appoggiatura la8 sol2. la4
    \appoggiatura sol8 fa4 mi8 (fa sol re sol fa)
    \grace fa8 mi4. re8 do4 do'\mbreak

    %61
    \appoggiatura sib8 la2. sib4
    \appoggiatura la8 sol2. la4
    <fa la,>4 re'8(sib) sib(la) la[(sold)]
    la4 la8.\tr sold32 la la,4 r

    %65
    <re' re,>2\f  mi
    fa4.\tr sol8 la4 la
    sib sib, \grace la'8 sol4 fa8 mi
    \grace re8 dod4. re16 mi re4 re,\p \mbreak

    %69
    mib mib16(fa mib re) do8 do do do
    do'4 do16(re do sib) la8 la la la
    mib'8.\f re16 \slashedGrace re8 do8. sib16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mib16

    %72
    re8 re4 mib8 do\slashedGrace re do16 re do8 [re]
    sib4 r r2
    R1*3\mbreak

    %77
    fa'2\p lab
    re fa~
    fa8.\f mib16  \slashedGrace mib8 re8. do16 \slashedGrace do8 sib8. lab16 \slashedGrace lab8 sol8. fa16

    %80
    mib?8\p \noBeam sol'16\tr (fa) sol8\upl [sib\upl] sol4 r
    r8 si,16 (la) si8\upl [re\upl] si4 r
    r8 do16\tr [(si)] do8\upl mib\upl do4 r

    %83
    r8 re16.\tr do32 re8\upl[fa\upl] re4 r\mbreak
    r8 mi?16\tr re mi8[la] mi4 r
    r8 fa16\tr(mi) fa8\upl[la\upl] fa4 r

    %86
    r8 mi16\tr (re) mi8\upl[la\upl] mi4 r
    r8 fa16\tr(mi) fa8\upl[la\upl] fa4 r
    r8 mi16\tr re mi8[la] la,\dolce [la] la8.\tr sold32 la

    %89
    fa'4(mi re do)
    \appoggiatura do8 sib4 la2 sib4
    \appoggiatura la8 sol2. la4\mbreak

    %92
    \appoggiatura sol8 fa2. fad4
    sol la sib2~
    sib la8(dod mi sol)

    %95
    sol(fa la sol) fa2\tr
    mi4 r r8 r16 la,16 \p la8.\tr sold32 la
    la'4(sol fa mi)

    %98
    re1\pf
    dod8 (re mi fa sol4 sold)
    la4 r r8 r16 la,16 \p la8.\tr sold32 la\mbreak

    %101
    la'4(sol fa mi)
    re1\pf
    dod8 (re mi fa sol4 sold)

    %104
    la8 mi(re dod) si(la sold la)
    sol!4\p sol16(la sol fa) mi8 mi mi mi
    mi'4.(re8) dod4 r

    %107
    sol4 sol16(la sol fa) mi8 mi mi mi
    mi'4. re8 dod4 r\mbreak
    sol4 sol16(la sol fa) mi8 mi mi mi

    %110
    mi'4\< mi16(fa mi re) dod8 dod dod dod\!
    sol'8.\f fa16 \slashedGrace fa8 mi8. re16 \slashedGrace re8 dod8. sib16 \slashedGrace sib8 la8. sol16
    \grace sol8 fa4 la'\p r la

    %113
    r la r la
    r la r la
    r la r la\mbreak

    %116
    r la r2
    R1
    r2 la,~

    %119
    la4 re,2 dod4
    re la'' r la\mbreak
    r la r la

    %122
    r la r la
    r la r la
    r la r2

    %125
    R1
    r2 la,~\mbreak
    la4 re,2 dod4

    %128
    re2 r8 r16 la'\noBeam la8.\tr\p sol32 la
    fa'4(mi re do!
    sib! la sol fa)

    %131
    sib2 dod,
    re4 r r8 r16 la'\noBeam la8.\tr\p sol32 la\mbreak
    fa'4(mi re do!)

    %134
    sib (la sol fa)
    sib8.\f sib'16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16 \slashedGrace mi8 re8. dod16
    re4 <<{re, re}\\{re re}>>

}


IIvlIIn =\relative do'' {

    la16 \dolce la8.\tr sold32 la
    fa'4(mi re) do\upl
    \grace do8 sib4(la) r sib
    \grace la8(sol2. la4)

    %4
    \appoggiatura sol8 (fa2.) fad4(
    sol la) sib2~
    sib la8\f[(dod mi8. sol16)]

    %7
    fa8. re16 sib'8. sol16 \slashedGrace sol8 fa8. mi16 \slashedGrace mi8 re8. dod16
    <re re,>2 r8 r16 la\dolce la8.\tr sol32 la\mbreak
    fa'4(mi re) do\upl

    %10
    \appoggiatura do8 sib4 la r sib
    \appoggiatura la8 sol2. la4
    \appoggiatura sol8 fa2. fad4

    %13
    sol la sib2~
    sib la8(dod mi sol)
    sol(fa la sol) \grace sol8 fa2\tr

    %16
    mi4 r r2
    fa2\f sol
    la4.\tr sib8 do4 do\mbreak

    %19
    re re, \grace do'8 sib4 la8 sol
    \grace fa8 mi4. fa16 sol fa4 r
    fa,2\p sol

    %22
    la4. sib8 do4 do
    re8 re,(mi fa sol la sib sol)
    \slashedGrace fa8 mi4. re8 do4 do(

    %25
    sol'4) sol16(la sol fa) mi8 mi mi mi
    mi mi mi mi mi mi mi mi
    sol4 sol16(la sol fa) mi8 mi mi mi

    %28
    mi mi mi mi mi mi mi mi
    sol4 sol16(la sol fa) mi8 mi mi mi
    mi(sol) sib16[(do sib la)] sol8 sol sol sol

    %31
    sol'8.\f fa16 \slashedGrace fa8 mi8. re16 \slashedGrace re8 do8. sib16 \slashedGrace sib8 la8. sol16
    fa8(la) do4\p r do
    r do r do

    %34
    r do r do
    r do r do\mbreak
    r do r2

    %37
    R1
    fa,2(sol)
    fa4 fa2 mi4\tr

    %40
    fa4 do' r do
    r do r do
    r do r do\mbreak

    %43
    r do r do
    r do r2
    R1

    %46
    fa,2 sol
    fa4 fa2 mi4
    fa2 r4 do\p

    %49
    la'(sol fa mi
    re do sib la)
    sib2 sol\mbreak

    %52
    la4 r r do
    la'(sol fa mi
    re do sib <fa' la,>\f)~

    %55
    fa8. re'16\slashedGrace re8 do8. sib16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16
    fa2 r8 r16 la16 \dolce la8.\tr sold32 la  fa2 r4 do'\p
    \appoggiatura sib8 la2. sib4

    %58
    \appoggiatura la8 sol2. la4
    \appoggiatura sol8 fa4 mi8 (fa sol re sol fa)
    \grace fa8 mi4. re8 do4 do'\mbreak

    %61
    \appoggiatura sib8 la2. sib4
    \appoggiatura la8 sol2. la4
    <fa la,>4 re'8(sib) sib(la) la[(sold)]
    la4 la8.\tr sold32 la la,4 r

    %65
    <re' re,>2\f  mi
    fa4.\tr sol8 la4 la
    sib sib, \grace la'8 sol4 fa8 mi
    \grace re8 dod4. re16 mi re4 re,\p \mbreak

    %69
    do2 mib
    la do~
    do8.\f sib16\slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mib16 \slashedGrace mib8 re8. do16

    %72
    sib4 r r2
    sol''2\f la
    sib4. do8 re4 re

    %75
    mib mib, \grace sib'8 do4 sib8 la
    fad4. (sol16 la) sol4 sol,\mbreak
    lab4\p lab16(sib lab sol) fa8 fa fa fa

    %78
    fa'4 fa16(sol fa mib) re8 re re re
    lab'8.\f sol16 \slashedGrace sol8 fa8. mib16 \slashedGrace mib8 re8. do16 \slashedGrace do8 sib8. lab16
    sol4 r r8 sol'16\p\tr[fa] sol8 lab

    %81
    sol(fa) fa4 r8 fa16\tr mi! fa8\upl[sol\upl]
    fa(mib) mib4 r8 mib16\tr re mib8[mib]
    mib?(re) re4 r8 re16\tr[dod] re8 re\mbreak

    %84
    re dod dod4 r8 dod16\tr sib dod8[dod]
    re\upl fa\upl re4 r8 re16\tr dod re8[re]
    dod\upl mi\upl dod4 r8 dod16\tr(sib) dod8[dod]

    %87
    re fa re4 r8 re16\tr dod? re8[re]
    dod mi dod4 r8 r16 la la8.\tr sold32 la

    %89
    fa'4(mi re do?)
    \appoggiatura do8 sib4 la2 sib4
    \appoggiatura la8 sol2. la4\mbreak

    %92
    \appoggiatura sol8 fa2. fad4
    sol la sib2~
    sib la8(dod mi sol)

    %95
    sol(fa la sol) fa2\tr
    mi8. la,16 la8.\p \tr sold32 la la'4(sol
    fa mi re do!)

    %98
    si2\pf sib
    la8(si dod re) mi mi(fa re)
    dod8.\tr\p [la16] la8.\tr sold?32 la la'4  (sol\mbreak

    %101
    fa mi re do)
    si2\rinf (sib)
    la8\p(si dod re) mi mi(fa re)

    %104
    dod4 r r2
    mi,4\p mi16(fa mi re) dod8 dod dod dod
    dod dod dod dod dod dod dod dod

    %107
    mi4 mi16(fa mi re) dod8 dod dod dod
    dod dod dod dod dod dod dod dod\mbreak
    mi4 mi16(fa mi re) dod8 dod dod dod

    %110
    dod?8\<[mi] sol16(la sol fa) mi8 mi mi mi\!
    mi'8.\f re16 \slashedGrace re8 dod8. sib16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16
    re8(fa) la4\p r la

    %113
    r la r la
    r la r la
    r la r la\mbreak

    %116
    r la r2
    R1
    re,2 mi

    %119
    re4 re2 dod4
    re la' r la\mbreak
    r la r la

    %122
    r la r la
    r la r la
    r la r2

    %125
    R1
    re,2 mi\mbreak
    re4 re2 dod4

    %128
    re2 r8 r16 la' la8.\tr\p sol32 la
    fa'4(mi re do!
    sib! la sol fa)

    %131
    sol2(mi)
    fa4 r r8 r16 la\noBeam la8.\tr\p sol32 la\mbreak
    fa'4(mi re do!)

    %134
    sib (la sol fa)
    <sol sol,>\f r8 r16 sib\noBeam \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16
    <<{re4 re re}\\{re re re}>>

}


IIvlan =\relative do' {

    r16 r4
    R1
    r4 la'\pp(sol fa)
    mi(dod la) la'4~

    %4
    la fa re8 re re re
    re re re re re re re re
    sol4 fa mi2\f

    %7
    re4 re8. sib'16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16
    re8. re16 do8. sib16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16\mbreak
    re4 r r2

    %10
    r4 la''\p(sol fa)
    mi(dod la) la'4~
    la fa re8 re re re

    %13
    re re re re re re re re
    sol4 fa mi la,~
    la la re2

    %16
    dod4 mi la, r
    la8\f(do) do do do do do do
    do fa fa fa fa fa fa fa\mbreak

    %19
    fa fa fa fa re re re re
    do do do do do(la' fa do)
    la8\p(do) do do do do do do

    %22
    do (fa) fa fa fa fa fa fa
    fa4 r re2
    sol, mi8(do mi sol)

    %25
    do do do do do do do do
    do do do do do do do do
    do do do do do do do do\mbreak

    %28
    do do do do do do do do
    do do do do do do do do
    do do do do do do do do

    %31
    <<{do4 do do do}\\{do,\f do do do}>>
    do'8(do' la\p fa) mi4(sol
    fa la sol sib)

    %34
    la(fa mi sol)
    fa(la sol sib)\mbreak
    la(fa) fa, r

    %37
    R1*3
    \con \tuplet 3/2 { r8 do'' sib la[sol fa] } mi4(sol
    fa la sol sib

    %42
    la fa mi sol)\mbreak
    fa (la sol sib)
    la fa fa, r

    %45
    R1*4
    r4 do'\p (la' sol
    fa mi re do)

    %51
    sib1\mbreak
    la4(sol fa) r
    r4 do' (la' sol

    %54
    fa mi re do)\f
    sib sib' do do,
    fa fa fa,8 r r4 fa'4 fa fa,8 r r4

    %57
    r la'\p fa2
    r4 sol mi2
    r4 re2 re4

    %60
    sol, sol'8(fa) mi(re) do4~\mbreak
    do la' fa re
    mi8 mi mi mi mi mi mi mi

    %63
    re4 re2 re4
    dod dod la'8(sol fa mi)
    fa\f la la la la la la la

    %66
    la fa re re re re re re
    re4 re sib'2
    la2. la,4\p\mbreak

    %69
    la2. do4
    mib2. do4
    <<{la\f la la la}\\{fa fa fa fa}>>

    %72
    sib r fad'2\p
    sol8 \f re re re re re re re
    re re sol sol sol sol sol sol

    %75
    sol sol sol sol mib2
    re2. re4\mbreak
    re2.\p fa4

    %78
    lab2. fa4
    <<{re\f re re re}\\{sib sib sib sib}>>
    mib2\p sol~

    %81
    sol sol
    sol1
    sold\pf \mbreak

    %84
    la2(sol!
    fa sold)
    la(sol!

    %87
    fa sold
    la) r
    R1

    %90
    r4 la(sol fa)
    mi(dod la) la'4~\mbreak
    la fa re8 re re re

    %93
    re re re re re re re re
    sol4(fa) mi la,~
    la la re2

    %96
    dod r
    la1~
    la4\pf la la la

    %99
    la la la la
    la\p r r2\mbreak
    la1~

    %102
    la4\pf la la la
    la la la la
    la r r2

    %105
    la8 \p la la  la la la la la
    la la la la la la la la
    la la la la la la la la

    %108
    la la la la la la la la\mbreak
    la la la la la la la la
    la la la la la la la la

    %111
    <<{la'4\f la la la}\\{dod, dod dod dod}>>
    <<
        la'8\\{re, \once\slurUp la'\p(fa re)}
    >> dod4(mi
    re fa mi sol

    %114
    fa re dod mi
    re fa mi sol)\mbreak
    fa(re) re, r

    %117
    R1*3
    r8 la''(fa re) dod4(mi)\mbreak
    re(fa mi sol)

    %122
    fa(re dod mi)
    re(fa mi sol)
    fa(re) re, r

    %125
    R1*4
    r4 la'\p (fa' mi)
    re(do sib la)

    %131
    sol1
    fa4(mi re) r\mbreak
    r la'(fa' mi)

    %134
    re(do sib la)
    sol\f sol' la la,
    re re, re

}


IIvcIn =\relative do {

    r16 r4
    re2\p sib'4(la
    sol fa \grace fa8 mi4 re)
    r mi dod2

    %4
    r4 re re' (do!
    sib la sol fa)
    mi re dod\f dod

    %7
    re sol la la,
    re8. re16 do!8. sib16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16\mbreak
    re4 re'\p(sib' la)

    %10
    sol(fa) \grace fa8 mi4 re
    r mi dod2
    r4 re (re' do!

    %13
    sib la sol fa)
    mi re dod dod
    re dod re sold,

    %16
    la la' la, r
    fa\f fa' mi re
    do? sib la la\mbreak

    %19
    sib2. sib'4(
    do sib) la8(fa do la)
    fa4 fa'\p(mi re)

    %22
    do (sib la) la
    sib2. sib4
    do do do, r

    %25
    r do'\pp(mi sol
    mi sol sib sol
    mi do mi sol)\mbreak

    %28
    mi(sol sib sol
    mi do mi sol
    mi sol sib sol)

    %31
    <<{mi\f mi mi mi}\\{do do do do}>>
    fa2\p sib(
    la) mi(

    %34
    fa) sib(
    la) mi(\mbreak
    fa2) r

    %37
    r r4 fa
    re re mi mi
    fa sib do do,

    %40
    fa2 sib
    la mi
    fa sib\mbreak

    %43
    la mi
    fa r
    r r4 fa

    %46
    re re mi mi
    fa sib do do,
    fa fa8.\tr mi32 fa fa,4 r

    %49
    r do'\p\tr(la' sol
    fa mi re do)
    sib2 do\mbreak

    %52
    do'4(sib la) r
    r do,(la' sol
    fa mi re do)

    %55
    sib sib'\f  do do,
    fa, fa' fa,8 r r4 fa4 fa' fa,8 r r4
    r fa'\p(re2)~

    %58
    re4 mi do2
    r4 re sib sib
    do do' do, r\mbreak

    %61
    r fa(re sib)
    do do\pf dod2
    re4 sib sib sib

    %64
    la la' la, r
    re\f re' do! sib
    la sol fa fa

    %67
    sol <<sol,2\\sol>> sol'4~
    sol \slashedGrace sol8 fa8. mi16 fa4 fa\p\mbreak
    fa, fa fa fa

    %70
    fa fa fa fa
    <<{la'\f la la la}\\{fa fa fa fa}>>
    sib,2\p la

    %73
    sol4 sol'\f  fa! mib
    re do sib sib'
    do do, do'2~

    %76
    do4 \slashedGrace do8 sib8. la16  sib4 sib\mbreak
    sib,\p sib sib sib
    sib sib sib sib

    %79
    <<{re\f re re re}\\{sib sib sib sib}>>
    <<
        {
            sib'1\p
            si

            %82
            do
        }\\{
            mib,
            re
            do
        }
    >>
    sib!\mbreak
    la4 la la la

    %85
    la la la la
    la la la la
    la la la la

    %88
    la la' la, r
    re2\dolce sib'4(la
    sol fa \slashedGrace fa8 mi4 re)

    %91
    r mi dod2\mbreak
    r4 re re' (do!
    sib la sol fa

    %94
    mi re) dod2
    re4 dod re sold,
    la1~

    %97
    la~
    la~\pf
    la~

    %100
    la~\p\mbreak
    la~
    la~\pf

    %103
    la
    la4 r r2
    r4 la\p(dod mi)

    %106
    dod( mi sol mi)
    dod(la dod mi)
    dod(mi sol mi)\mbreak

    %109
    dod(la dod mi)
    dod(mi sol mi)
    <<{dod\f dod dod dod}\\{la la la la}>>

    %112
    re2\p sol(
    fa dod)
    re(sol

    %115
    fa dod)\mbreak
    re2 r
    r r4 re

    %118
    si si dod dod
    re sol la la,
    re2 sol\mbreak

    %121
    fa dod
    re sol
    fa dod

    %124
    re r
    r r4 re
    si si dod dod\mbreak

    %127
    re sol la la,
    re re8.\tr dod?32 re re,4 r
    r la'\p fa' mi

    %130
    re(do? sib la)
    sol2(la)
    la'4(sol fa) r\mbreak

    %133
    r la, fa'(mi)
    re(do sib la)
    sol\f sol' la la,

    %136
    re re re

}


IIvcIIn =\relative do {

    r16 r4
    re2\p sib'4(la
    sol fa \grace fa8 mi4 re)
    r mi dod2

    %4
    r4 re re' (do!
    sib la sol fa)
    mi re dod\f dod

    %7
    re sol la la,
    re8. re16 do!8. sib16 \slashedGrace sib8 la8. sol16 \slashedGrace sol8 fa8. mi16\mbreak
    re4 re'\p(sib' la)

    %10
    sol(fa) \grace fa8 mi4 re
    r mi dod2
    r4 re (re' do!

    %13
    sib la sol fa)
    mi re dod dod
    re dod re sold,

    %16
    la la' la, r
    fa\f fa' mi re
    do? sib la la\mbreak

    %19
    sib2. sib'4(
    do sib) la8(fa do la)
    fa4 fa'\p(mi re)

    %22
    do (sib la) la
    sib2. sib4
    do do do, r

    %25
    r do'\pp(mi sol
    mi sol sib sol
    mi do mi sol)\mbreak

    %28
    mi(sol sib sol
    mi do mi sol
    mi sol sib sol)

    %31
    <<{do,4\f do do do}\\{do, do do do}>>
    fa'8\p\upl r r4 sib8\upl r r4
    la8\upl r r4 mi8\upl r r4

    %34
    fa8\upl r r4 sib8\upl r r4
    la8\upl r r4 mi8\upl r r4\mbreak
    fa8\upl r r4 r2

    %37
    r r4 fa
    re re mi mi
    fa sib do do,

    %40
    fa8 r r4 sib8 r r4
    la8 r r4 mi8 r r4
    fa8 r r4 sib8 r r4\mbreak

    %43
    la8 r r4 mi8 r r4
    fa8 r r4 r2
    r r4 fa

    %46
    re re mi mi
    fa sib do do,
    fa fa8.\tr mi32 fa fa,4 r

    %49
    r do'\p\tr(la' sol
    fa mi re do)
    sib2 do\mbreak

    %52
    fa,4 r r2
    r4 do'(la' sol
    fa mi re do)

    %55
    sib sib'\f do do,
    fa, fa' fa,8 r r4 fa4 fa' fa,8 r r4
    r fa'\p(re2)~

    %58
    re4 mi do2
    r4 re sib sib
    do do do'8(sib la sol)

    %61
    fa4 r r2
    r4 do \pf dod2
    re4 sib sib sib

    %64
    la la' la, r
    re\f re' do! sib
    la sol fa fa

    %67
    sol <<sol,2\\sol>> sol'4~
    sol \slashedGrace sol8 fa8. mi16 fa4 fa\p\mbreak
    fa, fa fa fa

    %70
    fa fa fa fa
    fa\f fa fa fa
    sib2\p la

    %73
    sol4 sol'\f  fa! mib
    re do sib sib
    do do do'2~

    %76
    do4 \slashedGrace do8 sib8. la16  sib4 sib\mbreak
    sib,\p sib sib sib
    sib sib sib sib

    %79
    <<{re\f re re re}\\{sib sib sib sib}>>
    mib,2\pp mib'
    re re,

    %82
    do do'
    sib! sib\mbreak
    la4 la la la

    %85
    la la la la
    la la la la
    la la la la

    %88
    la la' la, r
    re2\dolce sib'4(la
    sol fa \slashedGrace fa8 mi4 re)

    %91
    r mi dod2\mbreak
    r4 re re' (do!
    sib la sol fa

    %94
    mi re) dod2
    re4 dod re sold,
    la1~

    %97
    la~
    la4\pf la la la
    la2 la

    %100
    la1~\p \mbreak
    la~
    la4\pf la la la

    %103
    la2 la
    la4 r r2
    r4 la\p(dod mi)

    %106
    dod( mi sol mi)
    dod(la dod mi)
    dod(mi sol mi)\mbreak

    %109
    dod(la dod mi)
    dod(mi sol mi)
    la,\f la la la

    %112
    re8\p r r4 sol8 r r4
    fa8 r r4 dod8 r r4
    re8 r r4 sol8 r r4

    %115
    fa8 r r4 dod8 r r4\mbreak
    re8 r r4 r2
    r r4 re

    %118
    si si dod dod
    re sol la la,
    re8 r r4 sol8 r r4\mbreak

    %121
    fa8 r r4 dod8 r r4
    re8 r r4 sol8 r r4
    fa8 r r4 dod8 r r4

    %124
    re8 r r4 r2
    r r4 re
    si si dod dod\mbreak

    %127
    re sol la la,
    re re8.\tr dod?32 re re,4 r
    r la'\p fa' mi

    %130
    re(do? sib la)
    sol2(la)
    re,4 r r2\mbreak

    %133
    r4 la' fa'(mi)
    re(do sib la)
    sol\f sol' la la,

    %136
    re re re

}

forma = {

    \time 2/2
    \key fa\major
    \tempo 1 = 45
    \partial 16*5 s16 s4
    \repeat volta 2 {
        s1*55
    }
    \alternative {{ s1}{s2.}} \bar ".|:" \break s4
    \set Score.currentBarNumber = #57
    s1*79
    s2.
    \bar ":|."

}


IIfl = {
    \IIglobal
    <<\IIfln \forma>>
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


IIvcI = {
    \IIglobal
    \clef bass
    <<\IIvcIn \forma>>
}


IIvcII = {
    \IIglobal
    \clef bass
    <<\IIvcIIn \forma>>
}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

IIIfln =\relative do'' {

    la'2\f \grace la8 sol8. fad16
    fad2\f\slashedGrace fad8 mi8. re16
    re4 re8. [re16 \slashedGrace re8 dod8. si16]

    %4
    \slashedGrace si8 la4 sol(fad)
    dod'4.\f re16 (mi) re4
    mi4.\f  fad16 (sol) fad4

    %7
    fad8\dolce(mi sol fad mi re)
    \slashedGrace re8 dod4. si8 la4
    la'\f la, la\mbreak

    %10
    la'2.\p~
    la~
    la

    %13
    la4\f la, la
    la'2.\p
    la

    %16
    la
    la4\f la la
    la2.\p

    %19
    la4\f la la\mbreak
    la2.
    fad8.\f(sol32 la) re,8 re mi4\tr

    %22
    fad8.\f(sol32 la) re,8 re mi4\tr
    fad8. sol16 fad4 mi
    fad8 r r4 r

    %25
    fad8.\f(sol32 la) re,8 re mi4\tr
    fad8.(sol32 la)  re,8[fad la re]
    \grace dod8 si la16 sol fad4 mi

    %28
    re2 r4 re2 r4

}

IIIvlIn =\relative do'' {

    <la' la,>2\f \grace la8 sol8. fad16
    <fad la,>2\f\slashedGrace fad8 mi8. re16
    re4 re8. [re16 \slashedGrace re8 dod8. si16]

    %4
    \slashedGrace si8 la4 sol(fad)
    <dod' mi,>4.\f re16 mi re4
    <<mi4.\f\\la,>> fad'16 sol fad4

    %7
    fad8\dolce(mi sol fad mi re)
    \slashedGrace re8 dod4. si8 la4
    la'\f <<{la, la}\\{la la}>>\mbreak

    %10
    <<la2\\la>> fad4\p
    sol \slashedGrace la8 sol(fad sol la)
    \grace sol8 fad2(mi4)

    %13
    <<{<<la'\f\\la>>}\\{ << la,\\ la>>}>> <<{la la}\\{la la}>>
    <<la2\\la>> fad4\p
    sol \slashedGrace la8 sol(fad sol la)

    %16
    \grace sol8 fad2 mi4
    <re're,>2\f  fad8.(mi16)
    <<mi4\p\\la,>> r r

    %19
    <<mi'2\\la,\f>> sol'8. (fad16)\mbreak
    <<fad4\\ la,>> r r
    fad'8.\f(sol32 la) re,8 re <<mi4\\la,>>

    %22
    fad'8.\f(sol32 la) <re, re,>8[<re re,>] <<mi4\\ la,>>
    fad'8. sol16 fad4 mi
    fad8 la,\upl\p si\upl dod\upl re\upl mi\upl

    %25
    fad8.\f(sol32 la) <re, re,>8[<re re,>] <<mi4\\ la,>>
    fad'8.(sol32 la)  re,8[fad la re]
    \grace dod8 si la16 sol fad4 mi

    %28
    <re re,>2 r4 <re re,>2 r4

}


IIIvlIIn =\relative do'' {

    <fad la,re,>2\f \grace fad8 mi8. re16
    re4 <<{la8. [la16 \slashedGrace la8 sol8. fad16]}\\la8.>>
    fad4 fad(sol)

    %4
    <<{fad mi re}\\\stemUp la2.>>
    <mi' la,>4.\f fad16 sol fad4
    <dod' mi, la,>4.\f re16 mi re4~

    %7
    re si8\p(la sol fad)
    \slashedGrace fad8 mi4. re8 dod4
    la''\f <<{la, la}\\{la la}>>\mbreak

    %10
    <<la4\\la>> la,\p la
    la2.~
    la

    %13
    <<{<<la''4\f\\la>>}\\{ << la,\\ la>>}>> <<{la la}\\{la la}>>
    <<la4\\la>> la,\p la
    la2.~

    %16
    la
    <re' re,>2\f re8. dod16
    dod4 r r

    %19
    <dod mi, la,>2\f mi8. re16\mbreak
    <re re,>4 r r
    fad8.\f(sol32 la) re,8 re <<mi4\\la,>>

    %22
    fad'8.\f(sol32 la) <re, re,>8[<re re,>] <<mi4\\ la,>>
    fad'8. sol16 fad4 mi
    fad8 la,\upl\p si\upl dod\upl re\upl mi\upl

    %25
    fad8.\f(sol32 la) <re, re,>8[<re re,>] <<mi4\\ la,>>
    fad'8.(sol32 la)  re,8[fad la re]
    \grace dod8 si la16 sol fad4 mi

    %28
    <re re,>2 r4 <re re,>2 r4

}


IIIvlan =\relative do' {

    re4\f fad la
    re re, re
    <<
        {
            re2.~

            %4
            re4
        }\\re2.
    >> la4 re
    la2\f re4
    la2\f  re4

    %7
    R2.*2
    la'4\f la, la\mbreak
    la r r

    %11
    la' la,\p la
    la2.
    <<la'4\f\\la>> la, la

    %14
    la r r
    la'\p la, la
    la2.

    %17
    <<re2\\re\f>> fad8.( mi16)
    mi4 mi8\p(fad sol fad)
    <mi la,>2\f sol8.(fad16)\mbreak

    %20
    fad4 fad8\p(sol la sol)
    fad16\f(la) la la la la la la la la la la
    la la la la la la la la la la la la

    %23
    <<la8.\\{fad8. [mi16]}>> re4 dod
    re8\p \upl fad\upl sol\upl la\upl si\upl dod\upl
    re16\f(la) la la la la la la la la la la

    %26
    la la la la la8 la4 la8
    \slashedGrace la8 sol fad16 mi re4 dod
    <<re2\\re>> r4 <<re2\\re>> r4

}


IIIvcIn =\relative do {

    re4\f fad la
    re <<{re, re}\\{re re}>>
    <<re2.\\re>>

    %4
    re4 la re
    la la' re,
    la la' re,

    %7
    sol,\p sol sol
    la2 r4
    \clef tenor \key re\major la''\f la, fad'\mbreak

    %10
    sol8.(mi16) dod4 re\dolce
    mi \slashedGrace fad8 mi(re mi fad)
    \grace mi8 re2 dod4

    %13
    la'\f <<la,\\la>> fad'
    sol8.(mi16 dod4) re\p
    mi \slashedGrace fad8 mi(re mi fad)

    %16
    \grace mi8 re2 dod4
    <<{re2\f re8. dod16}\\{re,4 fad re}>>
    <<dod'\\la>> dod8\p(re mi re)

    %19
    <<{dod2\f mi8. re16}\\{la4 la la}>>\mbreak
    <<re\\re,>> re'8\p(mi fad mi)
    <<
        {
            re4\ff re dod

            %22
            re re dod
            re8
        }\\{
            re,4 fad la
            re, fad la
            re,8. sol16
        }
    >> la4 la,
    re r r
    <<
        {
            %25
            re'4\f re dod
            re re re
            re re dod

            %28
            re2
        }\\{
            re,4 fad la
            re, fad fad
            sol la la
            re,2
        }
    >> r4 <<re'2\\re,>> r4

}


IIIvcIIn =\relative do {

    <<re4\f\\re>> fad la
    <<
        {
            re re, re
            re re re
        }\\{
            re re re
            re re re
        }
    >>

    %4
    re la re
    la la' re,
    la la' re,

    %7
    sol,\p sol sol
    la2 r4
    <<la'\f\\la>> la, la\mbreak

    %10
    la r r
    R2.
    la'4\p la, la

    %13
    <<la'\f\\la>> la, la
    la2 r4
    R2.

    %16
    la'4\p la, la
    re,\f fad re
    la' r r

    %19
    la\f la' la,\mbreak
    <<re\\re>> r r
    re,\ff fad la

    %22
    re, fad la
    re,8. sol16 la4 la
    <<re\\re>> r r

    %25
    re,\f fad la
    re, re fad
    sol la la

    %28
    re8 fad mi re dod si re,4 re'8 do si la

}

forma = {

    \time 3/4
    \key re\major
    \tempo 2 = 72
    \repeat volta 2{s2.*8}
    \repeat volta 2{s2.*19}
    \alternative {{s2.}{s}}
    \bar "|."

}


IIIfl = {
    \IIIglobal
    <<\IIIfln \forma>>
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


IIIvcI = {
    \IIIglobal
    \clef bass
    <<\IIIvcIn \forma>>
}


IIIvcII = {
    \IIIglobal
    \clef bass
    <<\IIIvcIIn \forma>>
}


IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con
}

IVfln =\relative do'' {

    R2.*11
    r4 r8 si'\solo\noBeam  \slashedGrace la8 sol \slashedGrace sol mi
    dod4. la8(dod mi)

    %14
    \terzinequarto \grace mi8 re4~\tuplet 3/2 { re8 fad mi re[mi fad] }
    red mi4 fad,8[(mi' sol)]
    fad16 re mi fad sol la si dod re8 r

    %17
    la\upl  la4\tuplet 3/2 { si16(do re) } do8\upl[si\upl]
    la8\upl la4 \tuplet 3/2 { si16(do re) } do8\upl[si\upl]
    si[(la)] la (sol\slashedGrace sol8 fad8 mi)\mbreak

    %20
    \grace mi8 fad2.
    R2.*2
    la8.\f[si16 \slashedGrace si8 la8. sol16 \slashedGrace sol8 fad8. mi16]

    %24
    re2 r4
    R2.*8
    re'2\p \slashedGrace re8 do sib

    %34
    la4 la8\upl la(sib do)
    re2 \slashedGrace re8 do8. sib16
    la4 r r

    %37
    re2 \slashedGrace re8 do8. sib16
    la4 la8\upl la(sib do)
    re2 \slashedGrace re8 do8. sib16

    %40
    la4 r r
    R2.*4
    do,4\solo do do\mbreak

    %46
    do4. re16(mi fad sol la si)
    do4 do, do
    do4. re16 (mi fad sol la si)

    %49
    \tuplet 3/2 { do8(si la) sol[(fad mi)] re(mi do) }
    si16 re (do si do re mi fad sol la si do)
    re8\upl si\upl sol\upl re(do si)

    %52
    si4\tr la r
    R2.*6
    re'8.\f[do16 \slashedGrace do8 si8. la16 \slashedGrace la8 sol8. fad16]

    %60
    sol8 sol\tr re si sol4

}

IVvlIn =\relative do'' {

    R2.*12
    mi,2.\pp
    fad

    %15
    dod'
    re4 r r
    fad8\upl fad4 \tuplet 3/2 { sol16(la si) } la8\upl[sol\upl]

    %18
    fad8\upl fad4 \tuplet 3/2 { sol16(la si) } la8\upl[sol\upl]
    sol(fad) fad[(mi re do)]\mbreak
    \grace do8 re2.

    %21
    R2.*2
    la'8.\f [si16 \slashedGrace si8 la8. sol16 \slashedGrace sol8 fad8. mi16]
    <re re,>2 r4

    %25
    R2.*4
    do16(re) mi re \slashedGrace re8 do si16 do fad(do) la' sol
    \slashedGrace sol8 fad mi16 re \slashedGrace re8 do si16 do fad(do) la' sol

    %31
    fad(sol) la si do(si) la sol fad(mi) re do
    si sol re' si sol' re si' sol re'4
    re,2\pp \slashedGrace re8 do sib

    %34
    la4 la8_\upl la(sib do)
    re2 \slashedGrace re8 do8. sib16
    la4 r r

    %37
    re2 \slashedGrace re8 do8. sib16
    la4 la8_\upl la(sib do)
    re2 \slashedGrace re8 do8. sib16

    %40
    la4 r r
    R2.*4
    fad2(mi4)\mbreak

    %46
    re la' (sol)
    fad2 mi4
    re la' (sol)

    %49
    fad fad fad
    sol r r
    r8 re'\noBeam si_\upl si(la sol)

    %52
    sol4\tr fad r
    re'8\upl re4 \tuplet 3/2 { mi16(fad sol) } fad8\upl[[mi\upl]
    re8\upl re4 \tuplet 3/2 { mi16(fad sol) } fad8\upl[[mi\upl]

    %55
    mi(re) re(do si la)
    \grace la8 si2.
    R2.*2

    %59
    <<{re8.\f[mi16]}\\\stemUp\shiftOn re,4>> \slashedGrace mi'8 re8. [do16 \slashedGrace do8 si8. la16]
    sol8 sol\tr re si  sol4

}


IVvlIIn =\relative do'' {

    R2.*13
    la2.\pp
    sol

    %16
    <<fad4\\re>> r r
    R2.*4
    fad8_\upl\p fad4 \tuplet 3/2 { sol16(la si) } la8_\upl[sol_\upl]

    %22
    fad8_\upl fad4 \tuplet 3/2 { sol16(la si) } la8_\upl[sol_\upl]
    <la' re, fad,>8.\f [si16]\slashedGrace do8 la8. [sol16 \slashedGrace sol8 fad8. mi16]
    <re re,>2 r4

    %25
    re16(mi) fa mi \slashedGrace mi8 re dod16 re sold re si' la
    \slashedGrace la8 sold fa16 mi \slashedGrace mi8 re dod16 re sold re si' la
    sold(la) si do re(do) si la sold(fa) mi re

    %28
    do(la) mi' do la'(mi) do' la mi'4\mbreak
    R2.*4
    sib,2\p \slashedGrace sib8 la sol

    %34
    fad!4. fad8(sol la)
    sib2 \slashedGrace sib8 la8. sol16
    fad4 r r

    %37
    sib2 \slashedGrace sib8 la8. sol16
    fad4~fad8 fad (sol la)
    sib2 \slashedGrace sib8 la8. sol16

    %40
    fad4 r r
    R2.*4
    fad2(mi4)\mbreak

    %46
    re la' (sol)
    fad2 mi4
    re la' (sol)

    %49
    fad fad fad
    sol r r
    R2.*2

    %53
    si8\upl si4 \tuplet 3/2 { do16(re mi) } re8\upl do\upl
    si8\upl si4 \tuplet 3/2 { do16(re mi) } re8\upl do\upl
    do[(si)] si la sol fad

    %56
    \grace fad8 sol2.
    si,8_\upl si4 \tuplet 3/2 { do16(re mi) } re8_\upl do_\upl
    si8_\upl si4 \tuplet 3/2 { do16(re mi) } re8_\upl do_\upl

    %59
    <si' re, si>8.\f[do16] \slashedGrace do8 si8. [la16 \slashedGrace la8 sol8. fad16]
    sol8 sol\tr re si  sol4

}


IVvlan =\relative do' {

    sol2\solo\p la8.\tr sol32 la
    si4(sol8) sol(la si)
    do4. re8(mi re)

    %4
    \grace re8 do4 si16(re sol si) sol(re si sol)
    fad8 fad fad'-.(fad-. mi-. mi-.)
    re-.(re-. la'-. la-. sol-. sol-.)

    %7
    fad\upl fad\upl fad-.(fad-. mi-. mi-.)
    re-.(re-. la'-. la-. sol-. sol-.)
    fad\upl fad\upl fad-.(fad-. mi-. mi-.)

    %10
    re-.(re-. la'-. la-. sol-. sol-.)\mbreak
    fad2.
    sol4 sol sol

    %13
    sol2.\pp
    fad
    mi

    %16
    re4 r r
    re re re
    re re re

    %19
    re r r\mbreak
    R2.
    la'8\dolce\upl la4 \tuplet 3/2 { si16(do re) } do8\upl[si\upl]

    %22
    la8\upl la4 \tuplet 3/2 { si16(do re) } do8\upl[si\upl]
    <<la8.\f\\{la [sol16 \once\stemUp \slashedGrace sol8 fad8. mi16 \once\stemUp \slashedGrace mi8 re8. do16]}>>
    <<re2\\re>> r4

    %25
    <<
        {
            fa2.\p ~
            fa?
        }\\{
            re
            re
        }
    >>
    mi~

    %28
    mi4 r r\mbreak
    re2.~
    re~

    %31
    re~
    re4 r r
    re,\p re re

    %34
    re2.~
    re
    re'4 re, re

    %37
    re2.~
    re~
    re4 re re

    %40
    re r r
    sol2 la8.\tr sol32 la
    si4(sol8) sol(la si)

    %43
    do4. re8[mi8. (re16)]
    \grace re8 do4 si2
    la4 la' sol\mbreak

    %46
    fad4 fad(mi)
    re(la' sol)
    fad fad (mi)

    %49
    re re re
    <<{<<re\f\\re>>}\\{ << sol,\\ sol>>}>> r r
    R2.*6

    %57
    re'8\upl\p re4 \tuplet 3/2 { mi16(fad sol) } fad8\upl[mi\upl]
    re8\upl re4 \tuplet 3/2 { mi16(fad sol) } fad8\upl[mi\upl]
    re4\f re re,

    %60
    <<sol2.\\sol>>

}


IVvcIn =\relative do {

    \clef tenor  si'2\solo\dolce do8.\tr si32  do
    re4(si8) si(do re)
    mi4. fad8(sol fad)

    %4
    \grace fad8 mi4 re r
    \clef alto \key sol\major do do do
    do4. re16(mi fad sol la si)

    %7
    do4 do, do
    do4. re16(mi fad sol la si)
    do4 do, do

    %10
    do4. re16(mi fad sol la si)\mbreak
    \terzinequarto \tuplet 3/2 { do8 si la sol[fad mi] re mi do }
    \grace do8 si2.

    %13
    \clef bass \key sol\major la,8 la la la la la
    la la la la la la
    la la la la la la

    %16
    re,4 r r
    re2.
    re

    %19
    re4 la' la\mbreak
    re8 re' la re fad, la
    <<
        {
            re,4 re re

            %22
            re re re
            re
        }\\{
            re re re
            re re re
            re\f
        }
    >> la' \upl la,
    <<re2\\re>> r4

    %25
    si'2.\p~
    si~
    si

    %28
    do4 r do8(si)\mbreak
    la2.~
    la~

    %31
    la
    si4 r r
    re,8 re re re re re

    %34
    re re re re re re
    re re re re re re
    re re re re re re

    %37
    re re re re re re
    re re re re re re
    re re re re re re

    %40
    re4 r r
    \clef tenor\key sol\major si'2 do8.\tr si32 do
    re4(si8) si(do re)

    %43
    mi4. fad8[(sol8. fad16)]
    \grace fad8 mi4 re2
    R2.*8

    %53
    \clef bass \key sol\major sol,,4 sol' sol
    sol sol sol
    sol re re

    %56
    sol,8 sol' re sol si, re
    sol,4 sol sol
    sol sol sol

    %59
    <<sol\f\\sol>> <<re'\\re>> re,4
    <<sol2.\\sol>>

}


IVvcIIn =\relative do {

    sol8\p(sol') sol_\upl sol_\upl sol_\upl sol_\upl
    sol,8[(sol')] sol\upl sol\upl sol\upl sol\upl
    sol,8[(sol')] sol\upl sol\upl sol\upl sol\upl

    %4
    sol,8[(sol')] sol\upl sol\upl sol\upl sol\upl
    la4 la(sol)
    fad fad(mi)

    %7
    re la'(sol)
    fad fad(mi)
    re la'(sol)

    %10
    fad fad(mi)\mbreak
    re re re
    sol, sol' sol,

    %13
    la8 la la la la la
    la8 la la la la la
    la8 la la la la la

    %16
    re,4 r r
    re' r r
    re r r

    %19
    re, la' la\mbreak
    re8 re' la re fad, la
    <<
        {
            re,4 re re

            %22
            re re re
        }\\{
            re re re
            re re re
        }
    >>
    re,\f la' la
    re, re'8(do si la)

    %25
    sold4\p sold sold
    sold? sold sold
    sold? sold sold

    %28
    la r la'8 (sol!)
    fad4 fad fad
    fad fad fad

    %31
    fad, fad fad
    sol r r
    re'8 re re re re re

    %34
    re re re re re re
    re re re re re re
    re re re re re re

    %37
    re re re re re re
    re re re re re re
    re re re re re re

    %40
    re4 re8(do si la)
    sol8[(sol') ] sol\upl sol\upl sol\upl sol\upl
    sol,8[(sol')] sol\upl sol\upl sol\upl sol\upl

    %43
    sol,8[(sol')] sol\upl sol\upl sol\upl sol\upl
    sol,8[(sol')] sol\upl sol\upl sol\upl sol\upl
    la4 la(sol)\mbreak

    %46
    fad2 mi4
    re la'(sol)
    fad2 mi4

    %49
    re re re
    sol, r r
    r r sol

    %52
    re re'8(do si la)
    sol4 sol' sol
    sol sol sol

    %55
    sol re re
    sol,8 sol' re sol si, re
    sol,4 sol sol

    %58
    sol sol sol
    <<sol\f\\sol>> <<re'\\re>> re,4
    <<sol2.\\sol>>

}

forma = {

    \time 3/4
    \key sol\major
    \tempo 2 = 67
    \repeat volta 2{s2.*24}\break
    \repeat volta 2{s2.*36}
    \bar ":|."
    \mark\markup\smaller {
        DC M.\super "tto"
    }

}


IVfl = {
    \IVglobal
    <<\IVfln \forma>>
}


IVvlI = {
    \IVglobal
    <<\IVvlIn \forma>>
}


IVvlII = {
    \IVglobal
    <<\IVvlIIn \forma>>
}


IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>
}


IVvcI = {
    \IVglobal
    \clef bass
    <<\IVvcIn \forma>>
}


IVvcII = {
    \IVglobal
    \clef bass
    <<\IVvcIIn \forma>>
}


Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \senza
}

Vfln =\relative do'' {

    re'4 la
    re, r
    R2*2

    %5
    re'4 la
    re, r
    R2*15

    %22
    la'2\f
    si
    dod

    %25
    re4 la\p(
    sol fad
    mi fad

    %28
    mi re
    dod) la'(
    sol fa

    %31
    mi) fa(\mbreak
    mi re
    dod) r

    %34
    r mi
    la2~\f
    la~

    %37
    la
    sold
    mi

    %40
    mi'~
    mi4 dod
    la mi

    %43
    dod'2~\ff
    dod
    si~\mbreak

    %46
    si~
    si4 si
    si si

    %49
    si r
    R2*3
    r4 mi,\f

    %54
    re dod
    si dod
    si la

    %57
    sold r\mbreak
    R2*11
    r4 la'\f~\mbreak

    %70
    la \tuplet 3/2 {
        fad8 mi re
        dod si la sold fad mi
    }
    si'2\tr

    %73
    \tuplet 3/2 {
        dod8\ff re mi fad sold la
        sold fad mi re dod si
        dod re mi fad sold la
        sold fad mi re dod si

        %77
        dod re mi fad sold la
        sold fad mi re dod si
        dod mi la fad mi red
    }

    %80
    mi4 mi,
    \tuplet 3/2 {
        dod'8 re mi fad sold la
        sold fad mi re dod si\mbreak

        %83
        dod re mi fad sold la
        sold? fad mi re dod si
        dod re mi fad sold la

        %86
        sold? fad mi re dod si
        dod mi la fad mi red
    }
    mi4 mi,
    la dod
    dod r

    %91
    la'4\f la,16(si dod re)
    mi4 \tuplet 3/2 { mi,8(fad sold) }
    la4 la16(si dod re)
    mi4 r\mbreak

    %95
    R2*3
    r4 \tuplet 3/2 { mi8\f(fad sold)}
    la4 la,16(si dod re)
    mi4 \tuplet 3/2 { mi,8(fad sold) }

    %101
    la4 la16(si dod re)
    mi4 r\mbreak
    R2*19

    %122
    r4 dod'\f(
    si sold
    mid dod)\mbreak

    %125
    si2\p~
    si
    si'4\f(sold

    %128
    mid dod)
    si2\p~
    si

    %131
    si'4\f sold
    mid dod
    si' sold

    %134
    mid dod
    si'2~
    si

    %137
    la4 si8.\tr la32 si
    dod4 dod8(si)
    la4 si8.\tr la32 si\mbreak

    %140
    dod4 dod8(si)
    la4 si8.\tr la32 si
    dod8 la fad4~

    %143
    fad fad
    fad mid
    fad8 la si8.\tr la32 si

    %146
    dod4 dod8(si)
    la4 si8.\tr la32 si\mbreak
    dod4 dod8(si)

    %149
    la2~
    la~
    la~

    %152
    la\mbreak
    la4\f fad
    re r

    %155
    R2*2
    re'4 la
    re, r

    %159
    R2*15
    la'2\f
    si

    %176
    dod
    re4 la\p(
    sol fad

    %179
    mi fad
    mi re
    dod) la'(

    %182
    si fa
    mi fa
    mi re\mbreak

    %185
    dod4) r
    r4 la'\f
    re2

    %188
    re,~
    re
    dod

    %191
    la
    la'~
    la4 fad

    %194
    re la\mbreak
    fad'2
    fad

    %197
    mi
    mi
    mi4 mi

    %200
    mi mi
    mi r
    R2*3

    %205
    r4 la\mbreak
    sol fad
    mi fad

    %208
    mi re
    dod r
    R2*11

    %221
    r4 re'4\f
    re re
    re2

    %224
    dod\tr
    re4\p la~
    la la\mbreak

    %227
    la2~
    la~
    la4\f la

    %230
    la la
    \tuplet 3/2 { fad8 re dod si la sold }
    la4 la

    %233
    la'2\p~
    la~
    la~

    %236
    la\mbreak
    la4\f la
    la la

    %239
    \tuplet 3/2 { fad8 re dod si la sold }
    la4 la
    re fad

    %242
    fad r

}

VvlIn =\relative do'' {

    <re re,>4\f <<la\\la>>
    <<re,\\re>> \tuplet 3/2 {
        fad'8 \p sol la

        %3
        sol fad mi re dod si
        la si la sol fad mi
    }
    <re' re,>4\f <<la\\la>>

    %6
    <<re,\\re>> \tuplet 3/2 {
        fad'8 \p sol la
        sol fad mi re dod si
        la si la sol fad mi
    }

    %9
    <<re2\f\\re>>
    fad8\p r re r

    %11
    sol r mi r
    la[(sol fad mi)]
    fad\tr[(mi fad sol)]

    %14
    la2\mbreak
    si\<
    dod

    %17
    re
    fad8 r re r
    sol r mi r

    %20
    la[(sol fad mi)]\!
    fad\f\tr [mi fad sol]
    la2

    %23
    si
    dod
    re4 la,\p(

    %26
    sol fad
    mi fad
    mi re

    %29
    dod) la'(
    sol fa
    mi)  fa(\mbreak

    %32
    mi re)
    \tuplet 3/2 { dod8(mi la) dod_\upl la_\upl mi_\upl }
    la,4 <<mi''\f\\mi>>

    %35
    \tuplet 3/2 {
        la8 sol fad mi re dod
        la' sol fad mi re dod
        re fad mi re dod si

        %38
        re fad mi re dod si
        si' la sold fad mi re
        si' la sold? fad mi re

        %41
        dod mi re dod si la
        dod mi re dod si la
    }
    <<
        {
            \senza
            \override TupletBracket.bracket-visibility = ##f
            \tuplet 3/2 {
                la'8\ff la la la la la

                %44
                la la la la la la
                la la la la la la\mbreak
                la la la la la la

                %47
                la la la la la la
                la la la la la la
            }
            sol4
        }\\{
            \senza
            \override TupletBracket.bracket-visibility = ##f
            \tuplet 3/2 {
                dod,8 dod dod dod dod dod
                dod dod dod dod dod dod
                si si si si si si\mbreak
                si si si si si si
                si si si si si si
                si si si si si si
            }
            si4
        }
    >> r

    %50
    R2
    r4 mi(
    re dod)

    %53
    \tuplet 3/2 {
        si8 si si dod\f dod dod
        si si si la la la
        sol sol sol mi' mi mi

        %56
        re re re dod dod dod
    }
    si4 r\mbreak
    la8\p r mi r

    %59
    \grace {la16[si]} dod8 r la r
    \grace {si16[dod]} re8 r si r
    dod8[(re dod si)]

    %62
    la r mi r
    \grace {la16[si]} dod8 r la r
    \grace {si16[dod]} re8 r si r

    %65
    dod8[(re dod si)]
    la r mi r
    \grace {la16[si]} dod8 r la r

    %68
    \grace {si16[dod]} re8 r si r
    mi4\upl \tuplet 3/2 {
        dod8\f re mi\mbreak
        fad sold la fad mi re

        %71
        dod si la sold fad mi
    }
    si'2\tr
    \tuplet 3/2 {
        dod8\ff re mi fad sold la

        %74
        sold fad mi re dod si
        dod re mi fad sold la
        sold fad mi re dod si

        %77
        dod re mi fad sold la
        sold fad mi re dod si
        dod mi la fad mi red
    }

    %80
    mi4 mi,
    \tuplet 3/2 {
        dod'8 re mi fad sold la
        sold fad mi re dod si\mbreak

        %83
        dod re mi fad sold la
        sold? fad mi re dod si
        dod re mi fad sold la

        %86
        sold? fad mi re dod si
        dod mi la fad mi red
    }
    mi4 mi,

    %89
    la <la' la,>
    <la la,> r
    la4\f la,16(si dod re)

    %92
    mi4 \tuplet 3/2 { mi,8(fad sold) }
    la4 la,16(si dod re)
    mi4 r\mbreak

    %95
    dod'4\p \tuplet 3/2 { si8 (dod si) }
    la4 re(
    dod) \tuplet 3/2 { si8(dod si) }

    %98
    la4 \tuplet 3/2 { mi'8\f(fad sold)}
    la4 la,16(si dod re)
    mi4 \tuplet 3/2 { mi,8(fad sold) }

    %101
    la4 la,16(si dod re)
    mi4 r\mbreak
    do'4\p \tuplet 3/2 { si8 (do si) }

    %104
    la4 re(
    do) \tuplet 3/2 { si8(do si) }
    la4 mi'

    %107
    fa2~
    fa?8 [fa(mi fa)]\mbreak
    mi2~

    %110
    mi4 mi
    fa2~
    fa?8 [fa(mi fa)]\mbreak

    %113
    mi2~
    mi4 mi
    red2~

    %116
    red
    mi4(fad!
    sol! fad)

    %119
    mid2\rinf~
    mid
    fad4 sold8. fad32 sold

    %122
    la4 la\f
    sold8[(mid) dod\upl dod\upl]
    dod\upl[dod\upl dod\upl dod\upl]\mbreak

    %125
    \slashedGrace dod8 si4\p( lad8 si)
    \slashedGrace dod8 si4( lad8 si)
    sold'?\f[(mid) dod\upl dod\upl]

    %128
    dod[dod dod dod]
    \slashedGrace dod8 si4\p( lad8 si)
    \slashedGrace dod8 si4( lad8 si)

    %131
    sold'?\f[(mid) dod\upl dod\upl]
    dod[dod dod dod]
    sold'?[(mid) dod\upl dod\upl]

    %134
    dod[dod dod dod]
    sold'?\ff[(mid) dod\upl mid\upl]
    sold?[mid si' sold]

    %137
    la4 si8.\tr la32 si
    dod8\upl[dod\upl dod(si)]
    <la la,>4 si8.\tr la32 si\mbreak

    %140
    dod8\upl[dod\upl dod(si)]
    <la la,>4 si8.\tr la32 si
    dod4 dod,8.\tr si32 dod

    %143
    re8. si16 re8. si16
    la4 sold
    <la' la,>4 si8.\tr la32 si\mbreak

    %146
    dod8\upl[dod\upl dod(si)]
    <la la,>4 si8.\tr la32 si
    dod8\upl[dod\upl dod(si)]

    %149
    la4 la,\p~
    la la~
    la \slashedGrace la8 sol! fad

    %152
    sol4 sol\mbreak
    <re 're,>4\f <<la\\la>>
    <<re,\\re>> \tuplet 3/2 {
        fad'8 \p sol la

        %155
        sol fad mi re dod si
        la si la sol fad mi
    }
    <re' re,>4\f <<la\\la>>

    %158
    <<re,\\re>> \tuplet 3/2 {
        fad'8 \p sol la
        sol fad mi re dod si
        la si la sol fad mi
    }

    %161
    <<re2\f\\re>>
    fad8\p r re r
    sol r mi r

    %164
    la[(sol fad mi)]
    fad\tr[(mi fad sol)]
    la2\mbreak

    %167
    si
    dod
    re\<

    %170
    fad8 r re r
    sol r mi r
    la[(sol fad mi)]

    %173
    fad\tr [mi fad sol]\!
    la2\f
    si

    %176
    dod
    re4 la,\p
    (sol fad

    %179
    mi fad
    mi re
    dod) la'

    %182
    (sol fa
    mi  fa\mbreak
    mi re)

    %185
    \tuplet 3/2 { dod8(mi la) dod_\upl la_\upl mi_\upl }
    la,4 <<la'\f\\la>>
    \tuplet 3/2 {
        re8 dod si la sol fad

        %188
        re' dod si la sol fad
        sol si la sol fad mi
        sol si la sol fad mi

        %191
        mi' re dod si la sol
        mi' re dod si la sol
        fad la sol fad mi re

        %194
        fad la sol fad mi re\mbreak
    }

    <<
        {
            \senza
            \override TupletBracket.bracket-visibility = ##f
            \tuplet 3/2 {
                fad'8 fad fad fad fad fad
                fad fad fad fad fad fad

                %197
                mi mi mi mi mi mi
                mi mi mi mi mi mi
                mi mi mi mi mi mi

                %200
                mi mi mi mi mi mi
            }
            mi4
        }\\{
            \senza
            \override TupletBracket.bracket-visibility = ##f
            \tuplet 3/2 {
                re8 re re re re re
                re8 re re re re re
                re8 re re re re re
                re8 re re re re re
                re8 re re re re re
                re8 re re re re re
            }
            dod4
        }
    >> r
    R2*3

    %205
    r4 \tuplet 3/2 {
        la'8\f la la\mbreak
        sol sol sol fad fad fad
        mi mi mi fad fad fad

        %208
        mi mi mi re re re
    }
    dod4 r
    re8\p r la r

    %211
    \grace {re16[mi]} fad8 r re r
    \grace {mi16[fad]} sol8 r mi r
    fad[(sol fad mi)]

    %214
    re r la r
    \grace {re16[mi]} fad8 r re r
    \grace {mi16[fad]} sol8 r mi r

    %217
    fad[(sol fad mi)]
    re r la r
    \grace {re16[mi]} fad8 r re r

    %220
    \grace {mi16[fad]} sol8 r mi r
    la4 \tuplet 3/2 {
        fad8\f sol la
        si la sol fad mi re
    }

    %223
    la2
    mi'\tr
    \tuplet 3/2 {
        fad8\p sol la mi fad sol

        %226
        fad sol la mi fad sol\mbreak
        fad sol la mi fad sol
        fad sol la mi fad sol

        %229
        fad\f sol la mi fad sol
        fad sol la mi fad sol
        fad re dod si la sold
    }

    %232
    la4 la,
    \tuplet 3/2 {
        fad''8\p sol la mi fad sol
        fad sol la mi fad sol\mbreak

        %235
        fad sol la mi fad sol
        fad sol la mi fad sol
        fad\f sol la mi fad sol

        %238
        fad sol la mi fad sol
        fad re dod si la sold
    }
    la4 la,

    %241
    re <fad' la, re,>
    <fad la, re,> r

}


VvlIIn =\relative do'' {

    <re re,>4\f <<la\\la>>
    <<re,\\re>> \tuplet 3/2 {
        re'8\p mi fad
        mi re dod si la sol

        %4
        fad sol fad mi re dod
    }
    <re' re,>4\f <<la\\la>>
    <<re,\\re>> \tuplet 3/2 {
        re'8\p mi fad

        %7
        mi re dod si la sol
        fad sol fad mi re dod
    }
    <<re4\f\\re>>  r

    %10
    la2\p
    si
    dod

    %13
    re
    fad8 r re r\mbreak
    sol r mi r

    %16
    la[(sol fad mi)]
    fad\tr [mi fad sol]
    la2\<

    %19
    si
    dod
    <re re,>\!\f

    %22
    fad8 r re r
    sol r mi r
    la[(sol) fad mi]

    %25
    fad4 r
    R2
    r4 la,(

    %28
    sol fad
    mi) fa(
    mi re

    %31
    dod) la'(\mbreak
    sol fa
    mi) r

    %34
    r <<mi'\\mi\f>>
    \tuplet 3/2 {
        la8 sol fad mi re dod
        la' sol fad mi re dod
        re fad mi re dod si

        %38
        re fad mi re dod si
        si' la sold fad mi re
        si' la sold? fad mi re

        %41
        dod mi re dod si la
        dod mi re dod si la
    }
    <<
        {
            \senza
            \override TupletBracket.bracket-visibility = ##f
            \tuplet 3/2 {
                la'8\ff la la la la la

                %44
                la la la la la la
                la la la la la la\mbreak
                la la la la la la

                %47
                la la la la la la
                la la la la la la
            }
        }\\{
            \senza
            \override TupletBracket.bracket-visibility = ##f
            \tuplet 3/2 {
                dod,8 dod dod dod dod dod
                dod dod dod dod dod dod
                si si si si si si\mbreak
                si si si si si si
                si si si si si si
                si si si si si si
            }
        }
    >>
    sol'4 mi\p(

    %50
    re dod
    si dod
    si la)

    %53
    sold4 \tuplet 3/2 {
        mi'8\f mi mi
        re re re dod dod dod
        si si si dod dod dod

        %56
        si si si la la la
    }
    sold4 r\mbreak
    dod8\pp[(re dod si)]

    %59
    la2
    sold(
    la)

    %62
    dod8[(re dod si)]
    la2
    sold

    %65
    la
    dod8[(re dod si)]
    la2

    %68
    sold
    <sol! la,>\f\mbreak
    <<fad4\\re>> \tuplet 3/2 {
        fad'8 mi re

        %71
        dod si la sold fad mi
    }
    si'2\tr
    \tuplet 3/2 {
        la8\ff si dod re mi fad

        %74
        mi re dod si la sold
        la si dod re mi fad
        mi re dod si la sold

        %77
        la si dod re mi fad
        mi re dod si la sold
    }
    la4 \tuplet 3/2 { fad'8 mi red }

    %80
    mi4 mi,
    \tuplet 3/2 {
        la8 si dod re mi fad
        mi re dod si la sold

        %83
        la si dod re mi fad
        mi re dod si la sold
        la si dod re mi fad

        %86
        mi re dod si la sold
    }
    <<la4\\la>> \tuplet 3/2 { fad'8 mi red }
    mi4 mi,

    %89
    la <la' la,>
    <la la,> r
    la4\f la,16(si dod re)

    %92
    mi4 \tuplet 3/2 { mi,8(fad sold) }
    la4 la,16(si dod re)
    mi4 r\mbreak

    %95
    mi\p(re
    dod) fad(
    mi re

    %98
    dod) \tuplet 3/2 { mi'8\f(fad sold)}
    la4 la,16(si dod re)
    mi4 \tuplet 3/2 { mi,8(fad sold) }

    %101
    la4 la,16(si dod re)
    mi4 r
    mi\p(re

    %104
    do) fa(
    mi re
    do) r

    %107
    R2*15
    r4 fad\f
    mid8[(sold mid sold)]

    %124
    mid?[sold? mid sold]\mbreak
    mid[(sold? mid sold)]
    mid[(sold? mid sold)]

    %127
    mid\f[(sold? mid sold)]
    mid?[(sold? mid sold)]
    mid\p[(sold? mid sold)]

    %130
    mid[(sold mid sold)]
    mid?\f[(sold? mid sold)]
    mid?[(sold? mid sold)]

    %133
    mid?[(sold? mid sold)]
    mid?[(sold? mid sold)]
    sold'?\ff[(mid) dod\upl mid\upl]
    sold?[mid si' sold]

    %137
    la4 si8.\tr la32 si
    dod8\upl[dod\upl dod(si)]
    <la la,>4 si8.\tr la32 si\mbreak

    %140
    dod8\upl[dod\upl dod(si)]
    <la la,>4 si8.\tr la32 si
    dod4 dod,8.\tr si32 dod

    %143
    re8. si16 re8. si16
    la4 sold
    <la' la,>4 si8.\tr la32 si\mbreak

    %146
    dod8\upl[dod\upl dod(si)]
    <la la,>4 si8.\tr la32 si
    dod8\upl[dod\upl dod(si)]

    %149
    la4 r
    R2
    dod,2\p~

    %152
    dod\mbreak
    <re re,>4\f <<la\\la>>
    re,4 \tuplet 3/2 {
        re'8\p mi fad

        %155
        mi re dod si la sol
        fad sol fad mi re dod
    }
    <re' re,>4\f <<la\\la>>

    %158
    <<re,\\re>> \tuplet 3/2 {
        re'8\p mi fad
        mi re dod si la sol
        fad sol fad mi re dod
    }

    %161
    <<re2\f\\re>>
    la2\p
    si

    %164
    dod
    re\mbreak
    fad8 r re r

    %167
    sol r mi r
    la[(sol fad mi)]
    fad\tr[mi fad sol]

    %170
    <<
        {
            la2\<
            si
            dod

            %173
            re\!
        }\\{
            re,2~
            re
            re
            re
        }
    >>
    fad'8\f r re r
    sol r mi r

    %176
    la8[(sol) fad mi]
    fad4 r
    R2

    %179
    r4 la,\p(
    sol fad
    mi) fa(

    %182
    mi re
    dod) la'(
    sol fa\mbreak

    %185
    mi) r
    r <<la\f\\la>>
    \tuplet 3/2 {
        re8 dod si la sol fad

        %188
        re' dod si la sol fad
        sol si la sol fad mi
        sol si la sol fad mi

        %191
        mi' re dod si la sol
        mi' re dod si la sol
        fad la sol fad mi re

        %194
        fad la sol fad mi re\mbreak
    }

    <<
        {
            \senza
            \override TupletBracket.bracket-visibility = ##f
            \tuplet 3/2 {
                fad'8 fad fad fad fad fad
                fad fad fad fad fad fad

                %197
                mi mi mi mi mi mi
                mi mi mi mi mi mi
                mi mi mi mi mi mi

                %200
                mi mi mi mi mi mi
            }
            mi4
        }\\{
            \senza
            \override TupletBracket.bracket-visibility = ##f
            \tuplet 3/2 {
                re8 re re re re re
                re8 re re re re re
                re8 re re re re re
                re8 re re re re re
                re8 re re re re re
                re8 re re re re re
            }
            dod4
        }
    >> la\p(
    sol fad

    %203
    mi) fad(
    mi re
    dod) \tuplet 3/2 {
        fad'8\f fad fad\mbreak

        %206
        mi mi mi re re re
        dod dod dod la la la
        sol sol sol fad fad fad
    }

    %209
    mi4 r
    fad'8\p[(sol fad mi)]
    re2(

    %212
    dod
    re)
    fad8[(sol fad mi)]

    %215
    re2(\mbreak
    dod
    re)

    %218
    fad8[(sol fad mi)]
    re2
    dod

    %221
    <do re,>\f
    si4 re
    \tuplet 3/2 {
        re8 re re re re re

        %224
        dod dod dod dod dod dod
    }
    \tuplet 3/2 {
        re\p mi fad dod re mi
        re mi fad dod re mi\mbreak

        %227
        re mi fad dod re mi
        re mi fad dod re mi
        re\f mi fad dod re mi

        %230
        re mi fad dod re mi
        re re dod si la sold
    }
    la4 la,

    %233
    \tuplet 3/2 {
        re'8\p mi fad dod re mi
        re mi fad dod re mi
        re mi fad dod re mi

        %236
        re mi fad dod re mi\mbreak
        re\f mi fad dod re mi
        re mi fad dod re mi

        %239
        re re dod si la sold
    }
    la4 la,
    re <fad' la, re,>

    %242
    <fad la, re,> r

}


Vvlan =\relative do' {

    <re' re,>4\f <<la\\la>>
    <<re,\\re>> r
    la2\p

    %4
    la4 la
    <re' re,>\f  <<la\\la>>
    <<re,\\re>> r

    %7
    la2\p
    la4 la
    \tuplet 3/2 {
        re8\f re re re re re

        %10
        re\p re re re re re
        re re re re re re
        re re re re re re

        %13
        re re re re re re
        re re re re re re\mbreak
        re re re re re re

        %16
        re re re re re re
        re re re re re re
        re\< re re re re re

        %19
        re re re re re re
        re re re re re re\!
        <<re\f\\re>> <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>>

        %22
        <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>>
        <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>>
        <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>> <<re\\re>>
    }

    %25
    re4\upl\p fad(
    mi re
    dod) r

    %28
    R2*7
    dod4\f mi
    la2~

    %37
    la
    sold
    mi4 sold

    %40
    si2~
    si
    la

    %43
    la,4 dod
    mi la
    fad mi\mbreak

    %46
    re mi
    fad mi
    re fad

    %49
    mi dod'\p(
    si la
    sold la

    %52
    re, red)
    mi la,\f
    re red

    %55
    mi la,
    re red
    \tuplet 3/2 { mi8 fad mi re! dod si }

    %58
    la4 r
    mi'2\pp
    mi

    %61
    mi~
    mi
    mi

    %64
    mi
    mi~
    mi

    %67
    mi
    mi
    <<mi\f\\ dod>>\mbreak

    %70
    re4 re
    mi mi
    sold2\tr

    %73
    la4 r
    r mi
    la, r

    %76
    r mi'
    la, r
    r mi'

    %79
    la4 \tuplet 3/2 { fad8 (mi red) }
    mi4 mi,
    la r

    %82
    r mi'\mbreak
    la,2

    %84
    r4 mi'
    la,2
    r4 mi'

    %87
    <<la\\la>> \tuplet 3/2 { fad8 mi red }
    mi4 mi,
    la <la' mi la,>

    %90
    <la mi la,> r
    <<la\\la\f>> la16(si dod re)

    %92
    mi4 \tuplet 3/2 { mi,8(fad sold) }
    la4 la,16(si dod re)
    mi4 r\mbreak

    %95
    la,2\p
    la
    la

    %98
    la4 \tuplet 3/2 { mi'8\f (fad sold) }
    la4\upl la16(si dod re)
    mi4 \tuplet 3/2 { mi,8(fad sold) }

    %101
    la4 la,16(si dod re)
    mi4 r
    la,2\p

    %104
    la
    la
    la4 r

    %107
    r do(
    re2)~\mbreak
    re4 si

    %110
    do2~
    do4 do
    re2~

    %113
    re4 si
    do2
    si4(la

    %116
    si do
    si la
    sol) si'

    %119
    sold2~
    sold
    la4 si8.\tr la32 si

    %122
    dod4 dod,\f
    dod2
    dod\mbreak

    %125
    dod4\p(mid
    sold si)
    dod,2\f

    %128
    dod
    dod4\p(mid
    sold si)

    %131
    dod,2\ff
    dod
    dod4 dod

    %134
    dod dod
    dod8 [sold'? mid sold]
    dod,4 dod

    %137
    \tuplet 3/2 {
        dod8 dod dod dod dod dod
        dod dod dod dod dod dod
        dod dod dod dod dod dod\mbreak

        %140
        dod dod dod dod dod dod
        dod dod dod dod dod dod
    }
    dod4 fad~

    %143
    fad fad
    fad mid
    \tuplet 3/2 {
        fad8 dod dod dod dod dod

        %146
        dod dod dod dod dod dod
        dod dod dod dod dod dod
        dod dod dod dod dod dod
    }

    %149
    dod4 r
    R2
    la~\p

    %152
    la\mbreak
    <<re4\\re\f>> la4
    re, r

    %155
    la'2\p
    la4 la
    <<
        {
            re' la

            %158
            re,
        }\\{
            re la'
            re,
        }
    >> r
    la2\p
    la4 la

    %161
    \tuplet 3/2 {
        re8\f re re re re re
        re\p re re re re re
        re re re re re re

        %164
        re re re re re re
        re re re re re re\mbreak
        re re re re re re

        %167
        re re re re re re
        re re re re re re
        re re re re re re

        %170
        re re re re re re
        re re re re re re
        re re re re re re
    }
    <<
        {
            \tuplet 3/2 {
                \senza \override TupletBracket.bracket-visibility = ##f

                %173
                re re re re re re
                re\f re re re re re
                re re re re re re

                %176
                re re re re re re
            }
        }\\{
            \tuplet 3/2 {
                \senza \override TupletBracket.bracket-visibility = ##f
                re re re re re re
                re re re re re re
                re re re re re re
                re re re re re re
            }
        }
    >>
    re4\p(fad
    mi re

    %179
    dod) r
    R2*7
    fad4\p(la)

    %188
    re2~
    re
    dod

    %191
    la4 dod
    mi2~
    mi

    %194
    re\mbreak
    re,4(fad
    la re)

    %197
    si la
    sol la
    si la

    %200
    sol si
    la fad\p(
    mi re)

    %203
    dod(la'
    sol fad
    mi) re\f \mbreak

    %206
    sol, sold
    la re
    sol, sold

    %209
    <la' mi la,> \tuplet 3/2 { sol!8\p fad mi }
    re4 r
    la'2\p

    %212
    la
    la~
    la

    %215
    la\mbreak
    la
    la~

    %218
    la
    la
    la

    %221
    <<la\f\\fad>>
    sol4 sol,
    <<
        {
            \senza \override TupletBracket.bracket-visibility = ##f
            \tuplet 3/2 {
                fad'8 fad fad fad fad fad

                %224
                mi mi mi mi mi mi
            }
        }\\{
            \senza \override TupletBracket.bracket-visibility = ##f
            \tuplet 3/2 {
                la, la la la la la
                la la la la la la
            }
        }
    >>
    re4\p la
    re la\mbreak

    %227
    re la
    re la
    <<
        {
            la'4\f la

            %230
            la la
        }\\{
            la la
            la la
        }
    >>
    \tuplet 3/2 { re,8 re' dod si la sold }
    la4 la,

    %233
    re\p la
    re la
    re la

    %236
    re la\mbreak
    <<
        {
            la'4\f la
            la la
        }\\{
            la la
            la la
        }
    >>

    %239
    \tuplet 3/2 { re,8 re' dod si la sold }
    la4 la,
    <<
        {
            fad'4 fad

            %242
            fad
        }\\{
            la, la
            la
        }
    >> r

}


VvcIn =\relative do {

    <re' re,>4\f  <<la\\la>>
    <<re,\\re>> r
    R2*2

    %5
    <re' re,>4\f  <<la\\la>>
    <<re,\\re>> r
    R2*2

    %9
    re'4\f re,
    re,2
    re

    %12
    re
    re~
    re~\mbreak

    %15
    re~
    re~
    re

    %18
    <<re'\<\\re>>
    <<re\\re>>
    <<re\\re>>\mbreak

    %21
    <<re\!\f\\re>>
    <<re4\\re>> <<re\\re>>
    <<re\\re>> <<re\\re>>

    %24
    <<re\\re>> <<re\\re>>
    re4 re'\p
    sol,(sold

    %27
    la) re,
    sol, (sold
    la) re

    %30
    sol(sold
    la) re,\mbreak
    sol,(sold

    %33
    la) la'
    la, r
    la\f la'

    %36
    la, la'
    si, si'
    si, si'

    %39
    mi,, mi'
    mi, mi'
    la, la'

    %42
    la, la'
    la, dod
    mi la

    %45
    re, mi\mbreak
    fad(mi)
    re mi

    %48
    fad(red)
    \clef tenor\key re\major mi dod'\p(
    re red)

    %51
    mi la,(
    re, red)
    \clef bass\key re\major mi la,\f

    %54
    re red
    mi la,
    re red

    %57
    mi r\mbreak
    R2
    la,4\pp r

    %60
    la r
    la2~
    la

    %63
    la4 r
    la r
    la2~

    %66
    la
    la4 la
    la r

    %69
    la la\f\mbreak
    re re
    mi mi

    %72
    mi, mi
    la2
    r4 mi'

    %75
    la,2
    r4 mi'
    la,2

    %78
    r4 mi'
    la \tuplet 3/2 { fad8(mi red) }
    mi4 mi,

    %81
    la2
    r4 mi'\mbreak
    la,2

    %84
    r4 mi'
    la,2
    r4 mi'

    %87
    <<la\\la>> \tuplet 3/2 { fad8 mi red }
    mi4 mi,
    la <la' mi la,>

    %90
    <la mi la,> r
    \clef tenor\key re\major la'\f la,16(si dod re)
    mi4 \tuplet 3/2 { mi,8(fad sold) }

    %93
    la4 la,16(si dod re)
    mi4 r\mbreak
    R2*4

    %99
    la'4\f la,16(si dod re)
    mi4 \tuplet 3/2 { mi,8(fad sold) }
    \clef bass\key re\major la4 la,16(si dod re)

    %102
    mi4 r
    R2*4
    r4 la\p

    %108
    si2~\mbreak
    si4 sold
    la2~

    %111
    la4 la
    si2~
    si4 sold

    %114
    la2~
    la4 do(
    si la

    %117
    sol! fad
    mi re!)
    dod!(re

    %120
    dod si)
    la sold
    fad fad'\f

    %123
    dod(mid
    sold si)\mbreak
    dod,2\p

    %126
    dod
    dod4\f mid
    sold si

    %129
    dod,2\p
    dod
    dod4\ff(mid

    %132
    sold si)
    dod,(mid
    sold si)

    %135
    dod, dod
    <<
        {
            mid4 mid
            dod'2

            %138
            dod
            dod\mbreak
            dod

            %141
            dod
            dod4 mi
            re
        }\\{
            dod, dod
            fad sold
            la mid
            fad sold\mbreak
            la mid
            fad sold
            la lad
            si
        }
    >> si,

    %144
    do dod
    <<
        {
            dod'2
            dod

            %147
            dod
            dod
        }\\{
            fad,4 sold
            la mid
            fad sold
            la mid
        }
    >>
    fad2\p~

    %150
    fad
    <<
        {
            dod'2~
            dod
        }\\{
            mi,!~
            mi
        }
    >>\mbreak

    %153
    re'4\f <<la\\la>>
    <<re,\\re>> r
    R2*2

    %157
    re'4\f <<la\\la>>
    <<re,\\re>> r
    R2*2

    %161
    re'4\f re,
    re,2\p
    re

    %164
    re
    re~
    re~

    %167
    re~
    re~
    re

    %170
    <<re'\<\\re>>
    <<re\\re>>
    <<re\\re>>

    %173
    <<re\\re>>
    <<re4\!\f\\re>> <<re\\re>>
    <<re\\re>> <<re\\re>>

    %176
    <<re\\re>> <<re\\re>>
    re4 re'\p
    sol,(sold

    %179
    la) re,
    sol, (sold
    la) re

    %182
    sol(sold
    la) re,
    sol,(sold\mbreak

    %185
    la) la'
    la, r
    re,\f re'

    %188
    re, re'
    mi, mi'
    mi, mi'

    %191
    la, la'
    la, la'
    re,, re'

    %194
    re, re'\mbreak
    re,(fad
    la) re

    %197
    sol,(la
    si) la
    sol la

    %200
    si sold
    la fad'\p(
    sol sold)

    %203
    la re,
    sol, sold
    la re\f \mbreak

    %206
    sol, sold
    la re
    sol, sold

    %209
    la r
    R2
    re4\p r

    %212
    re r
    <<
        {
            re2~
            re
        }\\{re re}
    >>

    %215
    re4 r\mbreak
    re r
    <<
        {
            re2~

            %218
            re
        }\\{
            re
            re
        }
    >>
    re4 r
    re r

    %221
    <<
        {
            re\f re
        }\\{re re}
    >>
    sol, sol'
    la la

    %224
    la, la
    re r
    R2*3

    %229
    <<re4\f\\re>>  la
    <<re4\\re>>  la
    re \tuplet 3/2 { si'8 la sold }

    %232
    la4 la,
    <<re\\re>> r
    R2*3

    %237
    <<re4\f\\re>>  la
    <<re4\\re>>  la
    re \tuplet 3/2 { si'8 la sold }

    %240
    la4 la,
    re , <<re'\\re>>
    <<re\\re>> r

}


VvcIIn =\relative do {

    <re' re,>4\f  <<la\\la>>
    <<re,\\re>> r
    R2*2

    %5
    <re' re,>4\f  <<la\\la>>
    <<re,\\re>> r
    R2*2

    %9
    re'4\f re,
    re, r
    R2*7

    %18
    re2\p
    re
    re

    %21
    re\f
    <<re'4\\re>> <<re\\re>>
    <<re\\re>> <<re\\re>>

    %24
    <<re\\re>> <<re\\re>>
    re4 re'\p
    sol,(sold

    %27
    la) re,
    sol, (sold
    la) re

    %30
    sol(sold
    la) re,\mbreak
    sol,(sold

    %33
    la) la'
    la, r
    la2\ff

    %36
    la
    si
    si

    %39
    mi,
    sold
    la

    %42
    la'
    la,4 dod
    mi la

    %45
    re, mi\mbreak
    fad(mi)
    re mi

    %48
    fad(red)
    mi r
    R2*3

    %53
    r4 la,\f
    re red
    mi la,

    %56
    re red
    mi r\mbreak
    R2

    %59
    la,2\pp
    la
    la~

    %62
    la
    la
    la

    %65
    la~
    la
    la

    %68
    la
    la4 la\f \mbreak
    re re

    %71
    mi mi
    mi, mi
    la2
    r4 mi'

    %75
    la,2
    r4 mi'
    la,2

    %78
    r4 mi'
    la \tuplet 3/2 { fad8(mi red) }
    mi4 mi,

    %81
    la2
    r4 mi'\mbreak
    la,2

    %84
    r4 mi'
    la,2
    r4 mi'

    %87
    <<la\\la>> \tuplet 3/2 { fad8 mi red }
    mi4 mi,
    la <la' mi la,>

    %90
    <la mi la,> r
    <<la\\la>> la,
    mi' mi,

    %93
    la la16(si dod re)
    mi4 r\mbreak
    R2*4

    %99
    <<la4\\la>> la,
    mi' mi,
    la la16(si dod re)

    %102
    mi4 r
    R2*19
    r4 fad,\f

    %123
    dod'(mid
    sold si)\mbreak
    dod,2\p

    %126
    dod
    dod4\f mid
    sold si

    %129
    dod,2\p
    dod
    dod4\ff(mid

    %132
    sold si)
    dod,(mid
    sold si)

    %135
    dod, dod
    <<
        {
            mid4 mid
        }\\{dod dod}
    >>
    fad sold

    %138
    la mid
    fad sold\mbreak
    la mid

    %141
    fad sold
    la lad
    si si,

    %144
    do dod
    fad4 sold
    la mid

    %147
    fad sold
    la mid
    fad2\p~

    %150
    fad
    mi!~
    mi\mbreak

    %153
    re4\f la
    re, r
    R2*2

    %157
    <<re'4\\re>> la
    re, r
    R2*2

    %161
    re''4\f re,
    re, r
    R2*7

    %170
    re2\p
    re
    re

    %173
    re\f
    <<re'4\\re>> <<re\\re>>
    <<re\\re>> <<re\\re>>

    %176
    <<re\\re>> <<re\\re>>
    re4 re'\p
    sol,(sold

    %179
    la) re,
    sol, (sold
    la) re

    %182
    sol(sold
    la) re,\mbreak
    sol,(sold

    %185
    la) la'
    la, r
    re2\f

    %188
    re,
    mi
    mi'

    %191
    la,
    dod
    re

    %194
    re,\mbreak
    re4(fad
    la) re

    %197
    sol,(la
    si) la
    sol la

    %200
    si sold
    la r
    R2*3

    %205
    r4 re\f \mbreak
    sol, sold
    la re

    %208
    sol, sold
    la r
    R2

    %211
    re,2
    re
    re~

    %214
    re
    re\mbreak
    re

    %217
    re~
    re
    re

    %220
    re
    re4\f re'
    <sol sol,> <sol sol,>

    %223
    la, la
    la la
    re r

    %226
    R2*3
    <<re4\f\\re>>  la
    <<re4\\re>>  la
    re \tuplet 3/2 { si'8 la sold }

    %232
    la4 la,
    <<re\\re>> r
    R2*3

    %237
    <<re4\f\\re>>  la
    <<re4\\re>>  la
    re \tuplet 3/2 { si'8 la sold }

    %240
    la4 la,
    re, re
    re r

}

forma = {

    \time 2/4
    \key re\major
    \tempo 2 = 90
    \repeat volta 2 {s2*90}\break
    \bar ":..:"
    s2*152
    \bar ":|."

}


Vfl = {
    \Vglobal
    <<\Vfln \forma>>
}


VvlI = {
    \Vglobal
    <<\VvlIn \forma>>
}


VvlII = {
    \Vglobal
    <<\VvlIIn \forma>>
}


Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan \forma>>
}


VvcI = {
    \Vglobal
    \clef bass
    <<\VvcIn \forma>>
}


VvcII = {
    \Vglobal
    \clef bass
    <<\VvcIIn \forma>>
}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller{Divertimento I in Re maggiore}
        composer = \markup \center-column{"L. Boccherini (1743 -1805)"}
    }

    \markup\huge { [1.] Andantino grazioso}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \Ifl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

    \markup\huge { [2.] Allegro giusto}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IIvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IIvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

    \markup\huge { [3.] Minuetto}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIIfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IIIvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IIIvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

    \markup\huge { [4.] Trio}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IVfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IVvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IVvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IVvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

    \markup\huge { [5.] Prestissimo}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \Vfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \VvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \VvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \VvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \VvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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