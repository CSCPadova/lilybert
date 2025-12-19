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


mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

Ifln =\relative do'' {

    r2
    R1*9
    r2 mi4 mi~
    mi8 fad16(mi red [mi fad sold] la [sold la sold] la fad mi red)

    %12
    \grace fad16 mi8 red?16 mi mi,4 r2
    R1\mbreak
    r2 mi'4 mi~

    %15
    mi8 fad16(mi red [mi fad sold] la [sold la sold] la fad mi red)
    \grace fad8 mi2 si'8[(la)] la(sold)
    sold4(fad) dod'8[(si)] si8(la)

    %18
    la4(sold) sold16(la si la\grace dod16 si8[la16 sold)]
    fad(mi sold fad la[sold fad mi)] red(dod mi red \grace fad16 mi8[red16 dod)]
    si8(la) la4 la'8\p(sold fad la)\mbreak

    %21
    sold\tr fad(sold la) si8.\tr la32 si dod8 si
    la(sold fad sold) la2
    sol lad

    %24
    si la!8(sold! fad la
    sold fad sold la) si8.\tr la32 si dod8(si
    la sold fad sold) la2

    %27
    sol lad\mbreak
    si4 r r2
    R1

    %30
    si~
    si~
    si~

    %33
    si~\mbreak
    si4 r r2
    R1*3

    %38
    r2 mi,4\dolce mi~
    mi8 fad16 sold la[sold la fad] mi4 mi~
    mi8 fad16 (sold la[sold la fad)] mi4 mi~\mbreak

    %41
    mi16(dod mi, la dod[mi la dod)] si[(sold la fad] sold mi fad red)
    mi\dolce(sold si sold mi[sold si sold] mi sold si sold mi[sold si sold)]
    mi4 r r2

    %44
    mi16\dolce(sold si sold mi[sold si sold] mi sold si sold mi[sold si sold)]
    mi4 r r2\mbreak
    R1*2

    %48
    r2 la\p~
    la sol
    fad la~

    %51
    la sol\mbreak
    fad4 r r2
    R1*7

    %60
    r2 fad4\dolce fad~
    fad8(si la sold!) fad4 fad~
    fad8(si la sold) fad4 fad~

    %63
    fad8 mid4 re dod sid8
    dod16(si! lad si \grace dod16 si8[lad16 si)] mid(si lad si) sold' [(si, lad si)]
    si'(si, lad si) dod [(si lad si)] mid(si lad si) sold' [(si, lad si)]\mbreak

    %66
    si'(si, lad si) dod [(si lad si)] mid(si lad si) sold' [(si, lad si)]
    si'(la sold la) sold[(fad mid fad)] mid(re! dod re) dod[(si lad si)]
    la!4 r r r8 r16 dod'

    %69
    la1\tr
    sold4 r  r r8 r16 dod
    la1\tr\mbreak

    %72
    sold2(la4.\dolce) la8
    la(fad) fad\noBeam r la4. la8
    la(mi) mi\noBeam r la4. la8

    %75
    la si16(la fad[la si dod)] re8(si sold re)
    dod16 mi re fad mi8\noBeam r la4. la8
    la16(fad mid fad \grace sold16 fad8[mid16 fad)] la4. la8

    %78
    la16(mi red mi fad[mi red mi)] la4. la8\mbreak
    la8 si16 (la sold[la si dod)] re(dod si la sold[fad mi re)]
    dod(mi la dod) mi4 r2

    %81
    R1
    r2 mi,4 mi~
    mi8\rinf fad16 mi red[(mi fad sold] la sold la sold la[fad mi red)]

    %84
    \grace fad16 mi8 red?16 mi mi,4 r2
    R1\mbreak
    r2 mi'4 mi~

    %87
    mi8\rinf fad16 mi red( [mi fad sold] la si dod si la[fad mi red)]
    \grace fad8 mi2 re!8\p(dod si re)
    dod\tr si(dod re mi8.\tr re32 mi fad8 mi)

    %90
    re(dod si dod) re2
    do_\markup\italic {poco \dynamic f}  red
    mi re!8\p(dod! si re)

    %93
    dod(si dod re mi8.\tr re32 mi fad8 mi)\mbreak
    re(dod si dod) re2
    do_\markup\italic {poco \dynamic f}  red

    %96
    mi4 r r2
    R1
    mi\p~

    %99
    mi~
    mi~
    mi~\mbreak

    %102
    mi4 r r2
    R1*3
    r2 la,4 la~

    %107
    la8 si16 dod re[(mi fad sold)] la4 la,~
    la8 si16 dod re[(mi fad sold)] la4 la,~
    la16 (fad re' la) fad'[(re la' fad)] mi[(dod re si)] dod(la si sold)\mbreak

    %110
    la(dod mi dod) la[(dod mi dod)] la(dod mi dod) la[(dod mi dod)]
    la4 r r2
    la16(dod mi dod) la[(dod mi dod)] la(dod mi dod) la[(dod mi dod)]

    %113
    la4 r r2
    R1*2
    r2

}

IvlIn =\relative do'' {

    la4_\markup\italic "Sottovoce" la~
    la8 re(dod si) la4-! la
    la8 re(dod si) la4-! la~
    la8 fad'(mi re dod si la sold)

    %4
    \grace sold la2 r4 mi
    fad2(mi4) mi
    fad2(mi4) mi\mbreak

    %7
    fad4. fad8 mi(re dod si)
    \grace si8 dod2 r
    R1

    %10
    r2 r4 si'(
    la) la2 la4
    sold r r2

    %13
    R1\mbreak
    r2 r4 si~
    si la2 la4

    %16
    \grace la8 sold2 sold'8[(fad)] fad(mi)
    mi4(red) la'8(sold) sold[(fad)]
    fad4(mi) r2

    %19
    r2 r4  la,\pp
    sold8 fad fad4 la8(sold fad la)\mbreak
    sold_\tr fad(sold la) si8.\tr la32 si dod8[si]

    %22
    la(sold fad sold) la la4 la8
    sol_\markup\italic {poco \dynamic f} sol4 sol8 sol' sol4 sol8
    fad red4 si8 la\p(sold! fad la)

    %25
    sold(fad sold la) si8.\tr la32 si dod8[(si)]
    la(sold fad sold) la la4 la8
    sol_\markup\italic {poco \dynamic f} sol4 sol8 sol' sol4 sol8\mbreak

    %28
    fad(mi red dod) si[si16 \tr lad]  si8 red
    red_\markup\italic {poco \dynamic f}(dod) dod dod mi(red) red red
    fad(mi) mi mi fad16(sold fad mi) fad8 [red]

    %31
    fad(mi) mi4 la16(si la sold) la8[ fad]
    la(sold) sold sold fad16(sold fad mi) fad8 [red]
    fad(mi) mi\noBeam r la16(si la sold) la8 [fad]\mbreak

    %34
    la(sold) sold\noBeam r mi4\p mi~
    mi8 la(sold fad) mi4 mi~
    mi8 la (sold fad) mi4 mi~

    %37
    mi8 dod'(si la sold fad mi red)
    \grace fad mi2 r4 si
    dod2 si8(sold la si)

    %40
    dod2 si8(sold la si)\mbreak
    dod4 r r2
    R1

    %43
    mi16\f(sold si sold) la[(fad) fad fad] sold(mi) mi mi fad[(red) red red]
    mi8 r r4 r2
    mi16\f(sold si sold) la[(fad) fad fad] sold(mi) mi mi fad[(red) red red]\mbreak

    %46
    mi8\pp dod-! si-! dod-! si-! dod-! si-! dod-!
    si-! dod-! re!-! dod-! re-! dod-! re-! dod-!
    re-! dod-! re-! si-! dod\dolce[dod] dod8.\tr si32 dod

    %49
    re8 re re8.\tr dod32 re mi8 mi mi8.\tr re32 mi
    fad16(sol fad sol) la8[la] dod, dod dod8.\tr si32 dod
    re8 re re8.\tr dod32 re mi8 mi mi8.\tr re32 mi\mbreak

    %52
    fad16(sol fad sol) la8[\grace sol16 fad8] re4 re~
    re8 sol(fad mi) re4 re~
    re8 sol(fad mi) re4 re~

    %55
    re8 (si' la sol fad  mi re dod)
    re16(mi re mi) fad8[\grace mi16 re8] \grace dod8 si4 si~
    si8(mi re dod) si4 si~

    %58
    si8 mi(re dod) si4 si
    si8 sol' fad mi re dod si lad\mbreak
    si8 dod16 si la!8[sold!] fad4 fad~

    %61
    fad8 r r4 fad fad~
    fad8 r r4 fad fad~
    fad8 r r4 r2

    %64
    r4 si2 si4
    si2. si4\mbreak
    si2. si4

    %67
    si2. sold4
    la8\rinf(dod si la) sold(fad mid fad)
    fad'\p fad4 fad fad fad8

    %70
    mid\f sold fad mid red dod sid dod
    fad\p fad,4 fad fad fad8\mbreak
    mid mid4 mid8 mi\pp mi mi mi

    %73
    fad fad fad fad fad fad fad fad
    mi mi mi mi mi mi mi mi
    fad4 r sold8 sold sold sold

    %76
    la-! la(dod,8. re16) mi8 mi mi mi
    fad fad fad fad fad fad fad fad
    mi mi mi mi mi mi mi mi\mbreak

    %79 OOKK
    fad4 r sold2
    la4 r r2
    R1

    %82
    r2 r4 si
    la la2 la4
    sold r r2

    %85
    R1\mbreak
    r2 r4 si
    la la2 la4

    %88
    sold8(mi') re! dod si\pp(la sold si)
    la(sold la si) dod8.\tr si32 dod re8 dod\mbreak
    si(la sold la) si si si si

    %91
    la_\markup\italic {poco \dynamic f} la la la la la la la
    sold4 r si8\p(la sold si)
    la(sold la si) dod8.\tr si32 dod re8 (dod)\mbreak

    %94
    si(la sold la) si si si si
    la_\markup\italic {poco \dynamic f} la la la la la la la
    sold\p si \grace la16 sold8 fad mi mi16\tr red mi8[sold]

    %97
    sold(fad) fad fad la(sold) sold sold
    si(la) la la si16(dod si la) si8[sold]
    si(la) la8\noBeam r re16(mi re dod) re8[si]

    %100
    re(dod) dod dod si16(dod si la) si8[sold]
    si(la) la-! r re16(mi re dod) re8[si]\mbreak
    re(dod) dod\noBeam r la4 la~

    %103
    la8 re(dod si) la4 la
    la8 re(dod si) la4 la~
    la8 fad'(mi re dod si) la-! sold-!

    %106
    \grace si8 la2 r4 mi
    fad2 mi8(dod re mi)
    fad2 mi8(dod re mi)

    %109
    fad4 r r2\mbreak
    R1
    la16\f(dod mi dod) re[(si) si si] dod(la) la la si[(sold) sold sold]

    %112
    <<la4\\la>> r r2
    la16\f(dod mi dod) re[(si) si si] dod(la) la la si[(sold) sold sold]
    la8\p fad-! mi-! fad-! mi-! fad-! mi-! fad-!

    %115
    mi-! fad-! mi-! fad-! mi4 mi
    mi2

}


IvlIIn =\relative do'' {

    r4 mi,_\markup\italic "Sottovoce"
    fad2(mi4) mi
    fad2(mi4) mi
    fad4. fad8 mi(re dod si)

    %4
    \grace si dod2 la'4 la~
    la8(re dod si) la4-! la~
    la8(re dod si) la4 la~\mbreak

    %7
    la8(fad' mi re dod si la sold)
    \grace sold la2 r
    R1

    %10
    r2 r4 sold(
    fad) fad2 fad4
    mi r r2

    %13
    R1\mbreak
    r2 r4 sold(
    fad) fad2 fad4

    %16
    mi r r2
    r4 la8.(fad16) red8\noBeam r r4
    R1*2

    %20
    r4 red\pp fad8(mi red fad)\mbreak
    mi(red mi fad) sold8._\tr fad32 sold la8 sold
    fad(mi red mi) fad fad fad fad

    %23
    mi_\markup\italic {poco \dynamic f} mi mi mi  mi mi mi mi
    red4 r fad8\p(mi red fad)
    mi(red? mi fad) sold8. _\tr fad32 sold la8 sold

    %26
    fad(mi red mi) fad fad fad fad
    mi_\markup\italic {poco \dynamic f} mi mi mi mi mi mi mi\mbreak
    red(sold fad mi) red2

    %29
    mi_\markup\italic {poco \dynamic f} (fad)
    sold(la
    sold fad

    %32
    mi la
    sold fad)\mbreak
    mi8(sold si mi) sold4\p r

    %35
    R1*3
    r2 r4 sold,
    la2 sold8(mi fad sold)

    %40
    la2 sold8(mi fad sold)\mbreak
    la4 r r2
    R1

    %43
    mi'16\f(sold si sold) la[(fad) fad fad] sold(mi) mi mi fad[(red) red red]
    mi8 r r4 r2
    mi16\f(sold si sold) la[(fad) fad fad] sold(mi) mi mi fad[(red) red red]\mbreak

    %46
    mi8\pp la,-! sold-! la-! sold-! la-! sold-! la-!
    sold-! la-! si-! la-! si-! la-! si-! la-!
    si-! la-! si-! sold! r8  la-! la'-! la-!

    %49
    la(la,) la\noBeam r la'(la,) la\noBeam r
    la'(la,) la\noBeam r r la la'-! la-!
    la(la,) la\noBeam r la'(la,) la\noBeam r\mbreak

    %52
    la' la, fad[(la)] re,4 re~
    re r re re~
    re r re re~

    %55
    re r r fad~
    fad8 fad(re fad) si,4 fad'
    sol2 fad8(re mi fad)

    %58
    sol2 fad8(re mi fad)
    sol4 r8 sol (fad mi re dod)\mbreak
    re4\rinf(mid fad) dod'\p

    %61
    re2 dod8(la si dod)
    re2 dod4 dod
    si(la) sold(fad)

    %64
    mid4 mid2 mid4~
    mid? mid2 mid4~\mbreak
    mid? mid2 mid4~

    %67
    mid? mid2 mid4
    fad8\rinf(dod' si la) sold(fad mid fad)
    fad'\p fad4 fad fad fad8

    %70
    mid\f sold fad mid red dod sid dod
    fad\p fad,4 fad fad fad8\mbreak
    mid mid4 mid8 mi\pp mi mi mi

    %73
    fad fad fad fad fad fad fad fad
    mi mi mi mi mi mi mi mi
    fad4 r sold8 sold sold sold

    %76
    la-! la(dod,8. re16) mi8 mi mi mi
    fad fad fad fad fad fad fad fad
    mi mi mi mi mi mi mi mi\mbreak

    %79 OOKK
    fad4 r sold2
    la4 r r2
    R1

    %82
    r2 r4 sold
    fad fad2 fad4
    mi r r2

    %85
    R1
    r2 r4 sold
    fad fad2 fad4

    %88
    mi4. mi8 re!(dod si re)
    dod(si dod re) mi8._\tr re32 mi fad8 mi
    re(dod si dod) re re4 re8

    %91
    do_\markup\italic {poco \dynamic f} do4 do8 do' do4 do8
    si sold4 mi8 re(si dod re)
    dod(si dod re) mi8._\tr re32 mi fad8 mi\mbreak

    %94
    re(dod si dod) re re4 re8
    do_\markup\italic {poco \dynamic f} do4 do8 do' do4 do8
    si \p sold mi r r2

    %97
    R1
    r4 mi2\p mi4~
    mi mi2 mi4~

    %100
    mi mi2 mi4~
    mi mi2 mi4\mbreak
    mi8 dod mi la dod4 r

    %103
    R1*3
    r2 r4 dod,
    re2 dod8(la si dod)

    %108
    re2 dod8(la si dod)
    re4 r r2\mbreak
    R1

    %111
    la'16\f(dod mi dod) re[(si) si si] dod(la) la la si[(sold) sold sold]
    <<la4\\la>> r r2
    la16\f(dod mi dod) re[(si) si si] dod(la) la la si[(sold) sold sold]

    %114
    la8\p re,-! dod-! re-! dod-! re-! dod-! re-!
    dod-! re-! dod-! re-! dod-! dod-! dod-! dod-!
    dod2

}


Ivlan =\relative do' {

    r4 dod_\markup\italic "Sottovoce"
    re2(dod4) dod
    re2(dod4) dod

    %3
    re4 r r2
    r r4 dod
    re2(dod4) dod

    %6
    re2(dod4) dod\mbreak
    re r r2
    r r4 dod(

    %9
    si dod re dod)
    dod(si) r2
    r4 si si si

    %12
    si r r dod(
    si dod re dod)\mbreak
    dod(si) r2

    %15
    R1*6
    si1~
    si2\p~si8 red fad red

    %23
    si8_\markup\italic {poco \dynamic f}  si si si dod dod dod dod
    red fad4 red8 si r r4
    si1\p~

    %26
    si2~si8 red fad red
    si8_\markup\italic {poco \dynamic f}  si si si dod dod dod dod\mbreak
    red r r4 r2

    %29
    R1
    r2 si8\pp(fad' la fad)
    si,(mi sold mi) si(red fad red)

    %32
    si(mi sold mi) si(fad' la fad)
    si,(mi sold mi) si(red fad red)\mbreak
    si(red? sold si) mi4\p si

    %35
    dod2 si8(sold la si)
    dod2 si8(sold la si)
    dod4 r8 dod si(la sold fad)

    %38
    sold(si sold fad) mi4 r
    R1*2\mbreak
    r2 r4 si

    %42
    sold\p(si mi sold)
    si8 \f si\tr dod16[(la) la la] si(sold) sold sold la[(fad) fad fad]
    sold,4\p(si mi sold)

    %45
    si8 \f si\tr dod16[(la) la la] si(sold) sold sold la[(fad) fad fad]\mbreak
    sold4 r r2
    R1

    %48
    r2 sol2_\markup\italic {poco \dynamic f} (
    fad mi)
    re(sol

    %51
    fad mi)\mbreak
    re4 r r la
    si2 la8(fad sol? la)

    %54
    si2 la8\parenthesize (fad sol? la)
    si4 r8 si' la(sol? fad mi)
    re4 r r re

    %57
    mi2 re8(si dod re)
    mi2 re8(si dod re)
    mi4 mi, fad fad'~\mbreak

    %60
    fad8 mi16 re dod8[si] la4 la'
    si2 la8(fad sold! la)
    si2 la4 la

    %63
    sold fad mid <<re!\\re>>
    dod sold'2 sold4
    sold2 sold4 sold\mbreak

    %66
    sold2 sold4 sold
    sold2 sold4 sold
    fad8(dod' si la sold fad mid fad)

    %69
    sid,4\p sid sid sid
    dod8\f(sold' fad mid?) red(dod sid dod)
    sid4\p sid sid sid\mbreak

    %72
    dod1
    re!
    dod

    %75
    re2 si
    la4 la8. si16 dod4 dod
    re1

    %78
    dod\mbreak
    re2 si
    la4 r r dod

    %81
    si(dod re dod)
    dod si r2
    R1

    %84
    r2 r4 dod
    si(dod re dod)\mbreak
    dod si r2

    %87
    R1*2
    mi1~
    mi2~mi8 sold si sold

    %91
    mi_\markup\italic {poco \dynamic f}  mi mi mi fad fad fad fad
    sold si4 sold8\p mi r r4
    mi1\mbreak

    %94
    mi2\parenthesize ~ mi8(sold si sold)
    mi_\markup\italic {poco \dynamic f}  mi mi mi fad fad fad fad
    sold4 \p si,8 la sold2

    %97
    la(si)
    dod\p(re)
    dod(si)

    %100
    la(re)
    dod(si)\mbreak
    la4 r r mi'

    %103
    fad2 mi8(dod re mi)
    fad2 mi8(dod re mi)
    fad4 r8 fad(mi re dod si)

    %106
    dod(mi dod si) la4 r
    R1*2
    r2 r4 mi'\mbreak

    %110
    dod(mi la dod)
    mi8\f[mi,] fad16(re) re re mi[(dod) dod dod] re(si) si si
    dod4\p(mi la dod)

    %113
    mi8\f[mi,] fad16(re) re re mi[(dod) dod dod] re(si) si si
    dod8\p r r4 la la
    la la la8 la la la

    %116
    la2

}


IvcIn =\relative do {

    r2
    R1*2
    r4 re\p(mi) mi,
    la r r2

    %5
    R1*2
    r4 re mi mi,
    la r \clef tenor \key la \major mi'' mi~

    %9
    mi mi2 mi4~
    mi mi mi, r
    r si' si, si

    %12
    mi r mi' mi~
    mi mi2 mi4~\mbreak
    mi mi mi, r

    %15
    R1
    \clef bass\key la \major mi4 mi, r mi'
    si' si, r red

    %18
    mi mi, r mi'
    r dod r la
    si\p si si si\mbreak

    %21
    si si si si
    si si si si
    si _\markup\italic {poco \dynamic f} si si si

    %24
    si si\p si si
    si si si si
    si si si si

    %27
    si si si si\mbreak
    si r \clef tenor \key la \major si''2
    lad_\markup\italic {poco \dynamic f} la

    %30
    sold4 si,2 si4~
    si si2 si4~
    si si2 si4~

    %33
    si si2 si4\parenthesize ~\mbreak
    si r r sold'\p
    la2 sold8(mi fad sold)

    %36
    la2 sold8(mi fad sold)
    la4 la, si si,
    mi8(sold si la) sold4 r

    %39
    \clef bass \key la \major mi mi mi,8 r r4
    mi'4 mi mi,8 r r4\mbreak
    la la' si si,

    %42
    \clef tenor\key la\major mi4\p (sold si mi)
    sold r si, \f si,
    mi4\p (sold si mi)

    %45
    sold r si,\f si,\mbreak
    mi\pp mi mi mi
    mi mi mi mi

    %48
    mi mi mi'2_\markup\italic {poco \dynamic f}
    fad4 la,2 la4~
    la8(la' fad re) mi2

    %51
    fad4 la,2 la4~\mbreak
    la r r \clef bass \key la \major fad
    sold2 fad8(re mi fad)

    %54
    sol?2 fad8(re mi fad)
    sol?4 sol,?(la lad)
    si si' si, r

    %57
    si' si si2
    si4 si si2
    mi,4 mi fad fad,\mbreak

    %60
    si(dod) mi, r
    fad' fad fad2
    fad4 fad fad, r

    %63
    R1
    r4 dod'' dod, dod
    dod dod' dod, dod\mbreak

    %66
    dod dod' dod, dod
    dod dod' dod, dod
    fad8\rinf(dod' si la) sold(fad mid fad)

    %69
    sid,4\p sid' sid sid
    dod8\f sold (fad mid? red dod sid dod)
    sid4\p sid' sid sid\mbreak

    %72
    dod2 r
    \clef tenor \key la\major la'4. la8 la(fad) fad4
    la4. la8 la(mi) mi[la,]

    %75
    si4 si  mi, mi
    la, r r2
    la''4. la8 la16[(fad mid fad)] \grace sold16 fad8 mid16 fad

    %78
    la4. la8 la16[mi  red mi] \grace fad16 mi8 red16 mi\mbreak
    re!4 si mi, mi
    la, r mi''4 mi~

    %81
    mi mi2 mi4~
    mi mi mi, r
    r si 'si, si

    %84
    mi r mi' mi~
    mi mi2 mi4~\mbreak
    mi mi mi, r

    %87
    \clef bass\key la\major r4 si' si, si
    mi, mi' mi, mi
    mi mi mi mi

    %90
    mi mi mi mi
    mi_\markup\italic {poco \dynamic f} mi mi mi
    mi mi\p mi mi

    %93
    mi mi mi mi\mbreak
    mi mi mi mi
    mi_\markup\italic {poco \dynamic f} mi mi mi

    %96
    mi r \clef tenor \key la\major mi''2(
    red) re
    dod mi,8(si' re si)

    %99
    mi,8(la dod la) mi8(sold si sold)
    mi(la dod la) mi(si' re si)
    mi,(la dod la) mi(sold si sold)\mbreak

    %102
    mi(la dod mi) la4 dod,
    re2 dod8(la si dod)
    re2 dod8(la si dod)

    %105
    re4 re, mi mi
    la8(dod mi re) dod4 r
    \clef bass la4 la la,2

    %108
    la'4 la la,2
    re,4 re' mi mi\mbreak
    la,(dod mi la)

    %111
    dod r mi,\f mi,
    la\p(dod mi la)
    dod r mi,\f mi,

    %114
    la1\p
    la4 la la la
    la2

}


IvcIIn =\relative do {

    r2
    R1*2
    r4 re\p(mi) mi,
    la r r2

    %5
    R1*2
    r4 re mi mi,
    la2 r4 la'(

    %9
    sold  la si la
    la sold) r2
    r4 si si, si

    %12
    mi,2 r4 la'(
    sold la si la)\mbreak
    la(sold) r2

    %15
    r4 si si, si
    mi mi, r mi'
    si' si, r red

    %18
    mi mi, r mi'
    r dod r la
    si\p si si si\mbreak

    %21
    si si si si
    si si si si
    si _\markup\italic {poco \dynamic f} si si si

    %24
    si si\p si si
    si si si si
    si si si si

    %27
    si si si si\mbreak
    si si si si
    si_\markup\italic {poco \dynamic f}  si si si

    %30
    si si si si
    si si si si
    si si si si

    %33
    si si si si\mbreak
    mi, r r2
    mi'4\p mi mi, r

    %36
    mi' mi mi, r
    la la' si si,
    mi r r2

    %39
    R1*2\mbreak
    la,4 la' si si,
    \clef tenor\key la\major mi1\p

    %43
    <<
        {
            r4 mi'2^\f red4
            mi^\p r r2
            r4 mi2^\f red4\mbreak

            %46
            mi
        }\\{
            si4\f la sold fad
            mi1\p
            si'4\f la sold fad
            mi\pp
        }
    >> \clef bass\key la\major mi4 mi mi
    mi mi mi mi
    mi mi la,\p la

    %49
    la la la la
    la la la la
    la la la la\mbreak

    %52
    re, re' re, r
    re' re re, r
    re' re re, r

    %55
    sol? sol(la lad)
    si2 r
    si4 si' si, r

    %58
    si si' si, r
    mi, mi' fad fad,\mbreak
    si(dod) fad, r

    %61
    fad fad' fad, r
    fad fad' fad, r
    R1

    %64
    r4 dod'' dod, dod
    dod dod' dod, dod\mbreak
    dod dod' dod, dod

    %67
    dod dod' dod, dod
    fad8\rinf(dod' si la) sold(fad mid fad)
    sid,4\p sid' sid sid

    %70
    dod8\f sold (fad mid? red dod sid dod)
    sid4\p sid' sid sid\mbreak
    dod dod, dod dod

    %73
    <<{re! re re re}\\{re re re re}>>
    dod dod dod dod
    si si mi, mi

    %76
    la la8. si16 dod4 dod
    re re re re
    dod dod dod dod\mbreak

    %79
    si si mi, mi
    la r r la'
    sold(la si la)

    %82
    la sold r2
    r4 si si, si
    mi,2 r4 la'

    %85
    sold(la si la)\mbreak
    la(sold) r2
    r4 si si, si

    %88
    mi, mi' mi, mi
    mi mi mi mi
    mi mi mi mi

    %91
    mi_\markup\italic {poco \dynamic f} mi mi mi
    mi mi\p mi mi
    mi mi mi mi\mbreak

    %94
    mi mi mi mi
    mi_\markup\italic {poco \dynamic f} mi mi mi
    mi mi\p mi mi

    %97
    mi mi mi mi
    mi mi mi mi
    mi mi mi mi

    %100
    mi mi mi mi
    mi mi mi mi\mbreak
    la2 r

    %103
    la'4 la la, r
    la' la la, r
    re, re' mi mi

    %106
    la, r r2
    la4 la la2
    la4 la la2

    %109
    re,4 re' mi mi\mbreak
    la,1~
    la4 re,\f mi mi

    %112
    la1\p~
    la4 re,\f mi mi
    la\p la la la

    %115
    la la la la
    la2

}

forma = {

    \time 2/2
    \key la\major
    \tempo 2 = 60
    \partial 2 s2
    s1*47
    s2
    \bar ":..:"\break
    s
    s1*67
    s2
    \bar ":|."

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
    \tupletSpan 2 \con
}

IIfln =\relative do'' {

    la'2\f mi
    la,4 r16 la(si dod) re(mi fad sold la si dod re)
    mi8 dod la mi dod la mi mi'

    %4
    mi4 re8.\tr dod32 re dod8 r r4
    la'2 mi
    la,4 r16 la(si dod) re(mi fad sold la si dod re)

    %7
    mi8-! dod-! la-! mi-! dod-! la-! mi dod'\mbreak
    dod4 si8.\tr la32 si la8-! dod (re mi)
    re16 si dod re mi fad sold la si la sold fad mi re dod si

    %10
    dod(la dod mi) la(mi la dod) mi dod la mi la mi dod la
    re si dod re mi fad sold la si la sold fad mi re dod si
    dod la dod mi la mi la si mi8 dod la \grace sold16 fad8

    %13
    \grace mi8 red4\dolce red~red8 fad (la fad)\mbreak
    \grace mi8 red4 red~red8 fad (la fad)
    \grace mi8 red4 red8 red si'(la sold fad)

    %16
    \grace sold16 fad8 mi mi4~\tuplet 6/4 { mi8 [sold fad mi fad sold ]}
    \grace sold8 fad4 fad~\tuplet 6/4 {fad8 [la sold fad sold la]}
    \afterGrace sold2\tr {fad16[sold]} \afterGrace la2\tr {sold16[la]}

    %19
    \afterGrace si2\tr {la16[si]} \senza \tuplet 3/2 { dod8 si la sold fad mi }
    red16\f si dod red mi fad sold la si8 r \grace si16 la8 sold16 fad\mbreak
    sold4 mi'2 mi4

    %22
    red16 si, dod red mi fad sold la \grace si la8 sold16 fad \grace si la8 sold16 fad
    sold4 mi'2 mi4
    red8 red,16(dod) si8 si si4 r

    %25
    R1*2
    r2 r4 si'\p\mbreak
    \grace la8 sold4(fad mi) fad8.\tr mi32 fad

    %29
    sold4 la8.\tr sold32 la si4 si,8.\tr la32 si
    dod4 red8.\tr dod32 red mi4 fad~
    fad mi(la sold)

    %32
    fad2(mi
    red dod)
    si4 r fad'8 fad fad8.\tr mi32 fad

    %35
    sold4 r red8 red red8.\tr dod32 red
    mi4 r fad8 fad fad8.\tr mi32 fad\mbreak
    sold4 r red8 red red8.\tr dod32 red

    %38
    mi4 r r2
    mi'2\f si
    mi,4 r r2

    %41
    R1*2
    mi'2\f si
    mi,4 r r2\mbreak

    %45
    R1
    r2 r4 si'\p
    la2 sold4 si\<

    %48
    la2 sold4 si
    la2\!\f sold4 fad
    sold la si dod

    %51
    sold2 fad\tr \mbreak
    mi\dolce sold4 si(
    si,1)~

    %54
    si(
    si')
    si~

    %57
    si~
    si~
    si~\mbreak

    %60
    si4\f sold la si
    dod red mi fad,
    sold r r2

    %63
    R1
    sold
    fad\tr

    %66
    mi4 sold la si
    dod red mi fad,\mbreak
    sold r r2

    %69
    R1
    sold
    fad

    %72
    mi4 si'2 si4~
    si si2 si4~
    si sold sold r\mbreak

    %75
    mi'2\f si
    mi,4 r r2
    R1*2

    %79
    si'2\f  sold4 mid
    dod r r2
    R1\mbreak\con

    %82
    \tuplet 6/4 {
        la8[(dod fad la fad dod)] la[(dod fad la fad dod)]
        la[(dod fad la fad dod)] la[(dod fad la fad dod)]
        si[(re fad si fad re)] si[(re fad si fad re)]

        %85
        si[(re fad si fad re)] si[(re fad si fad re)]
        la[(dod fad la fad dod)] la[(dod fad la fad dod)]
        la[(dod fad la fad dod)] la[(dod fad la fad dod)]

        %88
        la[(dod fad la fad dod)] la[(dod fad la fad dod)]\mbreak
        la[(dod mi sol mi dod)] la[(dod mi sol mi dod)]
    }
    re4 r r2

    %91
    \tuplet 6/4 {
        re8[(fa la re la fa)]  re[(fa la re la fa)]
        re[(sol sib re sib sol)] re[(sol sib re sib sol)]
        re[(sol sib re sib sol)] re[(sol sib  re sib sol)]

        %94
        re[(fa la re la fa)] re[(fa la re la fa)]
        re[(fa la re la fa)] re[(fa la re la fa)]
        re[(fad! la re la fad)] re[(fad la re la fad)]\mbreak

        %97
        red[(fad si? red si fad)] red[(fad si red si fad)]
    }
    sol8 r r4 r2
    \tuplet 6/4 {
        sol,8[(si mi sol mi si)]  sol[(si mi sol mi si)]

        %100
        la[(do mi la mi do)] la[(do mi la mi do)]
        la[(do mi la mi do)] la[(do mi la mi do)]
        sol[(si mi sol mi si)] sol[(si mi sol mi si)]

        %103
        sol[(si mi sol mi si)] sol[(si mi sol mi si)]\mbreak
        sol[(si mi sol mi si)] sol[(si mi sol mi si)]
        sol[(si re fa re si)] sol[(si re fa re si)]

        %106
        sol[(do mi sol mi do)] sol[(do mi sol mi do)]
        sold![(si re mi re si)] sold[(si re mi re si)]
        mi,[(la do mi do la)] mi[(la do mi do la)]

        %109
        do'[(la fad! red do la)] do'[(la fad red do la)]
        sold![(si mi sold mi si)] sold[(si mi sold mi si)]\mbreak
        sold[(si re mi re si)] sold[(si re mi re si)]

        %112
        mi,[(la do mi do la)] mi[(la do mi do la)]
        do'[(la fad! red do la)] do'[(la fad red do la)]
    }
    sold4 r r2

    %115
    R1*3\mbreak
    la'2\f mi
    la,4 r16 la\dolce(si dod) re(mi fad sold la si dod re)

    %120
    mi8 dod la mi dod la mi mi'
    mi4 re8.\tr dod32 re dod8 r r4
    sol'2\f mi4 dod

    %123
    la8 la16 si dod8 re mi fad sol mi
    dod la mi' dod sol'8.\tr fad32 sol la8 sol\mbreak
    fad4 r r2

    %126
    R1
    fad
    mi4 mi2 mi4\mbreak

    %129
    mi2~mi16 dod(re mi fad sold! la si)
    dod4 r r2
    R1

    %132
    la
    \once\stemDown sold8 mi,16 fad sold8 la si dod re si
    dod4 r r2

    %135
    R1
    la'
    sold8 sold,16 la si8 sold mi4 r

    %138
    R1*2
    r2 r4 mi'\dolce
    \grace re8 dod4(si la) si8.\tr la32 si

    %142
    dod4 re8.\tr dod32 re mi4 mi8.\tr re32 mi\mbreak
    fad4 sold8.\tr fad32 sold la4\p si~
    si(la re dod)

    %145
    si2 la
    sold fad
    mi4 r si'8 si si8.\tr la32 si

    %148
    dod4 r sold8 sold sold8.\tr fad32 sold\mbreak
    la4 r si8 si si8.\tr la32 si
    dod4 r sold8 sold sold8.\tr fad32 sold

    %151
    la4 r r2
    la2\f mi
    la,4 r r2

    %154
    R1*2
    la'2 mi
    la,4 r r2

    %158
    R1
    r2 r4 mi'\p
    re2 dod4 mi\<

    %161
    re2 dod4 mi\mbreak
    re2\!\f dod4 si
    dod re mi fad

    %164
    dod2 si\tr
    la dod4 mi
    mi,1~

    %167
    mi
    mi'~
    mi~

    %170
    mi~
    mi\parenthesize ~\mbreak
    mi~

    %173
    mi4\f dod re mi
    fad sold la si
    dod r r2

    %176
    R1
    dod
    si

    %179
    la4 dod, re mi
    fad sold la si\mbreak
    dod4 r r2

    %182
    R1
    dod
    si\tr

    %185
    la4 mi2 mi4~
    mi mi2 mi4~
    mi dod dod r

}

IIvlIn =\relative do'' {

    <<la2\f\\la>> mi
    la,4 r r2
    dod'1

    %4
    \p si2(la8) si16(dod re mi fad sold)
    <<{la2\f mi}\\{la, mi'}>>
    la,4 r r2

    %7
    mi1\p~ \mbreak
    mi4 sold la8-! la(si dod)
    <<
        {
            re1

            %10
            dod
            re
            dod2~dod4
        }\\{
            mi,1
            mi
            mi
            mi2~mi4
        }
    >> r

    %13
    r8 la la la la4 r\mbreak
    r8 la la la la4 r
    r8 la la la la8 r r4

    %16
    R1
    r4 si2 si4
    si2 la

    %19
    sold4 mi2 dod'4
    si8\f dod16 red mi fad sold la \grace si16 la8 sold16 fad \grace si16 la8 sold16 fad \mbreak
    \grace la16 sold8 fad16 sold \grace la16 sold8 fad16 sold \grace la16 sold8 fad16 sold \grace la16 sold8 fad16 sold

    %22
    fad si, dod red mi fad sold la \grace si16 la8 sold16 fad \grace si16 la8 sold16 fad
    \grace la16 sold8 fad16 sold \grace la16 sold8 fad16 sold \grace la16 sold8 fad16 sold \grace la16 sold8 fad16 sold
    fad mi red dod si8 si si,4 r

    %25
    r2 r4 mi'\p
    \grace red8 dod4 si la8(sold fad mi)
    red4 dod si2~\mbreak

    %28
    si r
    R1
    r2 r4 la''8(fad)

    %31
    red4 mi la sold
    fad8.\tr mi32 fad si8. si16 mi,4 la
    red,8. \parenthesize \tr dod32 red sold8. sold16 dod,4 fad

    %34
    si,8.\tr la32 si mi8. mi16 red2
    mi8(si sold' mi) fad2
    sold8(si sold mi) red2\mbreak

    %37
    mi8(si sold' mi) fad2
    \senza \tuplet 3/2 { sold8 si la sold fad mi red dod si la sold fad }
    <<mi'2\f\\mi,>> si'

    %40
    mi,4 r8 si''\p la-! sold-! fad-! mi-!
    red-! dod-! si-! la-! sold-! la-! si-! dod-!
    si r la r sold r r4

    %43
    <<mi'2\f\\mi>> si
    mi,4 r8 si''\p la-! sold-! fad-! mi-!
    red-! dod-! si-! la-! sold-! la-! si-! dod-!

    %46
    si r la r sold si re!16 re re re
    dod dod dod dod red red red red mi mi mi mi re re re re
    dod\< dod dod dod red red red red mi mi mi mi re re re re

    %49
    dod\f\! dod dod dod red red red red mi mi mi mi fad fad fad fad
    sold\ff sold sold sold la la la la si si si si dod dod dod dod
    si,,2 fad''\tr \mbreak

    %52
    mi4 r r2
    fad2\pp~fad8 la(sold fad)
    \grace fad mi4 red8 mi mi r r4

    %55
    fad2~fad8 la(sold fad)
    mi(si sold') mi-! fad2\tr
    sold8(si sold mi) red2\tr

    %58
    mi8 si sold' mi fad2\tr
    sold8 si sold mi red2\tr \mbreak
    mi16\ff mi mi mi mi mi mi mi red red red red re re re re

    %61
    dod dod dod dod si si si si lad lad lad lad la la la la
    sold8 \p sold4 sold sold sold8
    sol sol4 sol sol sol8

    %64
    <<
        {
            sold'!16\f sold sold sold sold sold sold sold sold sold sold sold sold sold sold sold
            fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad
        }\\{
            si, si si si si si si si si si si si si si si si
            si si si si si si si si si si si si si si si si
        }
    >>
    mi mi mi mi mi mi mi mi red red red red re re re re

    %67
    dod dod dod dod si si si si lad lad lad lad la la la la\mbreak
    sold8 \p sold4 sold sold sold8
    sol sol4 sol sol sol8


    %70
    <<
        {
            sold'!16\f sold sold sold sold sold sold sold sold sold sold sold sold sold sold sold
            fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad
        }\\{
            si, si si si si si si si si si si si si si si si
            si si si si si si si si si si si si si si si si
        }
    >>
    mi8 mi fad8.\tr mi32 fad sold8 sold \grace si16 la8 sold16 fad

    %73
    mi8 mi fad8.\tr mi32 fad sold8 sold \grace si16 la8 sold16 fad
    mi4 <<{<mi si> <mi si>}\\{sold, sold}>> r\mbreak
    <<mi'2\f\\mi>> si

    %76
    mi,4 r8  mi\p mi[(fad)] fad(sold)
    sold[(la)] la(si) si[(dod)] dod(re!)
    re4 re16(mi re dod) si8 r r4

    %79
    si'2\f sold4 mid
    dod r8 mid,\p mid[(fad)] fad(sold)
    sold[(la)] la(si)  si8.\tr la32 si dod8 si\mbreak

    %82
    la4(fad) r2
    dod'\p dod4 dod
    re \grace mi16 re8 dod16 re si4 r

    %85
    re2 si4(re)
    dod \grace re16 dod8 si16 dod la4 r
    dod2 fad4(la)

    %88
    dod,2 fad4(la)
    dod,2 mi4(sol)
    \tuplet 3/2 { fad8 la sol fad mi re dod si la sol fad mi }

    %91
    re4 r r2
    R1*7
    si'2\p si4 si

    %100
    do \grace re16 do8 si16 do la4 r
    do2 la4 do
    si \grace do?16 si8 la16 si sol4 r

    %103
    si2 (mi4 sol)\mbreak
    si,2 (mi4 sol?)
    si,2(re4 fa)

    %106
    mi2 do4 la
    sold!1
    la4 do2 do4

    %109
    do1\tr
    si4 r r2\mbreak
    sold'!1

    %112
    la4 do,2 do4
    do1\tr
    si4 si8(la) la(sold) sold[(fad)]

    %115
    fad[(mi)] re'(dod!) dod[(si)] si(la)
    la[(sold)] si'(la) la[(sold)] sold(fad)
    fad[(mi)] mi(re) re[(dod)] dod(si)\mbreak

    %118
    <<{la'2\f mi}\\{la, mi'}>>
    la,4 r r2
    dod1\p

    %121
    si2 la8 la16(si dod re mi fad)
    <<sol2\\mi\f>> mi4 dod
    la8 la,16 si dod8 re mi fad sol mi

    %124
    dod' la mi' dod sol'8.\tr fad32 sol la8 sol\mbreak
    fad4 fad16\dolce(mi fad sol?) fad8-! la-! fad-! mi-!
    \grace mi8 re4 re16(dod re mi) re8-! fad-! re-! dod-!

    %127
    \grace dod8 si4 si16\tr la si dod si8 re si la
    sold!16\< sold sold sold la la la la si si si si dod dod dod dod\mbreak
    re\f\! re re re re re re re dod la si dod re mi fad sold

    %130
    la8\p dod,4 dod dod dod8
    si mi4 re dod si8
    la'16\f \repeat unfold 15 {la}

    %133
    \once\stemDown sold8 mi,16 fad sold8 la si dod re si
    dod\p dod4 dod dod dod8
    si mi4 re dod si8\mbreak

    %136
    la'16\f \repeat unfold 15 {la}
    \once\stemDown sold8 sold,16 la si8 sold mi4 r
    r2 r4 la'\p

    %139
    \grace sold8 fad4 mi re8(dod si la)
    sold4 fad mi2~
    mi r

    %142
    R1\mbreak
    r2 r4 re'8.(si16)
    sold4 (la re dod)

    %145
    si8.\tr la32 si mi8-! mi-! la,4 re
    sold,8.\tr fad32 sold dod8 dod fad,4 si
    mi,8.\tr re32 mi la8 la sold2

    %148
    la8(mi dod' la) si2\mbreak
    dod8(mi dod la) sold2
    la8(mi dod' la) si2

    %151
    \tuplet 3/2 { dod8 mi  re dod si la sold fad mi re dod si }
    <la' la,>2\f mi
    la,4 r8 mi''\p re8-! dod-! si-! la-!

    %154
    sold-! fad-! mi-! re-! dod-! re-! mi-! fad-!
    mi r re r dod r r4\mbreak
    <la'' la,>2\f <<mi\\mi>>

    %157
    <<la,4\\la>> r8 mi'\p re8-! dod-! si-! la-!
    sold-! fad-! mi-! re-! dod-! re-! mi-! fad-!
    mi r re r dod mi sol16 sol sol sol

    %160
    fad fad fad fad sold! sold sold sold la la la la sol\< sol sol sol
    fad fad fad fad sold! sold sold sold la la la la sol sol sol sol\mbreak
    fad \f\! fad fad fad sold! sold sold sold la la la la si si si si

    %163
    dod\ff dod dod dod re re re re mi mi mi mi fad fad fad fad
    mi,2 si'\tr
    la4 r r2

    %166
    si2\pp~si8 re(dod si)
    \grace si8 la4 sold8(la) la r r4
    si2~si8 re(dod si)

    %169
    la8(mi dod' la) si2\tr
    dod8(mi dod la) sold2\tr
    la8(mi dod' la) si2\tr \mbreak

    %172
    dod8(mi dod la) sold2\tr
    la16\f la la la la' la la la sold! sold sold sold sol sol sol sol
    fad fad fad fad mi mi mi mi red red red red re re re re

    %175
    dod8\p dod4 dod dod dod8
    do do4 do do do8
    <<
        {
            la'16\f \repeat unfold 15{la}

            %178
            \repeat unfold 16 {sold}
            la, la la la
        }\\{
            dod! \repeat unfold 15{dod}
            \repeat unfold 16 {si}
            la la la la
        }
    >> la' la la la sold! sold sold sold sol sol sol sol
    fad fad fad fad mi mi mi mi red red red red re re re re\mbreak

    %181
    dod8\p dod4 dod dod dod8
    do do4 do do do8
    <<
        {
            la' 16\repeat unfold 15{la}

            %184
            \repeat unfold 16 {sold}
        }\\{
            dod,! \f \repeat unfold 15{dod}
            \repeat unfold 16 {si}
        }
    >>
    la'8 la, si8.\tr la32 si dod8 dod \grace mi16  re8 dod16 si
    la'8 la, si8.\tr la32 si dod8 dod \grace mi16  re8 dod16 si
    la4 <la' la,> <la la,> r

}


IIvlIIn =\relative do'' {

    <<la2\f\\la>> mi
    la,4 r r2
    mi'1\p

    %4
    sold2(la4) r
    <<la2\f\\la>> mi
    la,4 r r2

    %7
    dod2.\p mi4~\mbreak
    mi(re) dod r
    sold'1

    %10
    la
    sold
    la2~la4 r

    %13
    r8 fad fad fad fad4 r\mbreak
    r8 fad fad fad fad4 r
    r8 fad fad fad fad8 r r4

    %16
    r8 si,(mi sold) si4 si
    si,1~
    si4 r r2

    %19
    R1
    si'8\f lad16 si dod red mi fad \grace sold16 fad8 mi16 red \grace sold16 fad8 mi16 red \mbreak
    \grace fad16 mi8 red16 mi \grace fad16 mi8 red16 mi \grace fad16 mi8 red16 mi \grace fad16 mi8 red16 mi

    %22
    red(si) lad si dod red mi fad \grace sold16 fad8 mi16 red \grace sold16 fad8 mi16 red
    \grace fad16 mi8 red?16 mi \grace fad16 mi8 red16 mi \grace fad16 mi8 red16 mi \grace fad16 mi8 red16 mi
    red(si) fad mi red8 fad si,4 si'\p

    %25
    \grace la8 sold4(fad mi2)~
    mi4 red dod dod'8.\tr si32 dod
    red4 mi8.\tr red32 mi fad4 fad,\mbreak

    %28
    sold4 la8.\tr sold32 la si4 r
    r2 r4 mi
    \grace red?8 dod4(si) la2~

    %31
    la4 sold(fad mi)
    red2 dod
    si la

    %34
    sold4 sold' la2
    sold la
    sold la\mbreak

    %37
    sold(la)
    sold8 r r4 r2
    <mi' mi,>2\f si

    %40
    mi,4 r8 sold'-!\p fad-! mi-! red-! dod-!
    si-! la-! sold-! fad-! mi-! fad-! sold-! la-!
    sold r fad r mi r r4

    %43
    <<mi'2\f\\mi>> si
    mi,4 r8 sold'-!\p fad-! mi-! red-! dod-!\mbreak
    si-! la-! sold-! fad-! mi-! fad-! sold-! la-!

    %46
    sold r fad r mi sold si16 si si si
    la la la la la la la la sold sold sold sold si si si si
    la\< la la la la la la la sold sold sold sold si si si si

    %49
    la\f\! la la la la la la la sold sold sold sold fad fad fad fad
    mi\ff mi' mi mi mi mi mi mi mi mi mi mi mi mi mi mi
    \repeat unfold 8 {mi} \repeat unfold 8 {red}\mbreak

    %52
    mi4 r r sold,
    <<
        {
            la1\pp
            sold

            %55
            la
            sold2 la
            sold la

            %58
            sold la
            sold la\mbreak
            sold4
        }\\{
            si,1~
            si
            si~
            si~
            si~
            si~
            si~\mbreak
            si4
        }
    >> mi'16\f mi mi mi red red red red re re re re

    %61
    dod dod dod dod si si si si lad lad lad lad la la la la
    sold8 \p mi4 mi mi mi8~
    mi mi4 mi mi mi8

    %64
    mi'16\f \repeat unfold 15 {mi}
    \repeat unfold 16 {red}
    mi mi mi mi mi mi mi mi red red red red re re re re

    %67
    dod dod dod dod si si si si lad lad lad lad la la la la\mbreak
    sold8 \p mi4 mi mi mi8~
    mi mi4 mi mi mi8

    %70
    mi'16\f \repeat unfold 15 {mi}
    \repeat unfold 16 {red}
    mi8 mi red8.\tr dod32 red mi8 mi \grace sold16 fad8 mi16 red

    %73
    mi8 mi red8.\tr dod32 red mi8 mi \grace sold16 fad8 mi16 red
    mi4 <<{<mi si> <mi si>}\\{sold, sold}>> r\mbreak
    <<mi'2\f\\mi>> si

    %76
    mi,4 r r r8 mi\p
    mi[(fad)] fad(sold) sold[(la)] la(si)
    si4 si16(dod si la) sold8 la si dod

    %79
    si2\f sold4 mid
    dod r8 dod-!\p dod(red) red(mid)
    mid?[(fad)] fad(sold) sold8.\tr fad32 sold la8 sold\mbreak

    %82
    fad4 la,2 la4
    la r r2
    R1*7

    %91
    la''2\p la4 la
    sib \grace dod16 sib8 la16 sib sol4 r
    sib2 sol4 sib

    %94
    la \grace si?16 la8 sold?16 la fa4 r
    re2 fa4(la)
    re,2 fad!4(la)\mbreak

    %97
    red,2 fad4 la
    \terzinequarto \senza\tuplet 3/2 { sol8 si la sol fad mi red do si la sol fad }
    mi4\p sol,2 sol4

    %100
    la2(do4 mi)
    la(mi do la)
    sol2 si4 mi

    %103
    <sol sol,>1~\mbreak
    <sol sol,>
    <fa sol,?>

    %106
    <mi sol,?>2 r
    re1
    do

    %109
    la'
    sold!2(si,)\mbreak
    re1

    %112
    do
    la'
    sold4 sold8(fad) fad(mi) si'[(la)]

    %115
    la(sold) si[(la)] la(sold) re'[(dod!)]
    dod(si) re[(dod)] dod(si) si[(la)]
    la(sold) sold[(fad)] fad(mi) mi[(re)]\mbreak

    %118
    <la' dod,>2\f  mi
    la,4 r r2
    mi'1\p

    %121
    sold2(la4) r
    <<sol'2\\mi\f>> mi4 dod
    la8 la,16 si dod8 re mi fad sol mi

    %124
    dod' la mi' dod sol'8.\tr fad32 sol la8 sol\mbreak
    fad4 la,2\dolce lad4
    si si2 fad4~

    %127
    fad fad2 fad4
    mi16\< \repeat unfold 15 {mi}\mbreak
    mi\f\! mi mi mi mi mi mi mi mi8 mi4 mi8

    %130
    mi1\p~
    mi4 la (sold fad)
    mi16\f \repeat unfold 7 {mi16} \repeat unfold 8 {fad}

    %133
    mi8 mi16 (fad) sold8 la si dod re si
    dod\p (mi,4 mi mi mi8)
    mi4(la sold fad)\mbreak

    %136
    mi16\f \repeat unfold 7 {mi16} \repeat unfold 8 {fad}
    sold8 sold16 la si8 sold mi4 mi'\p
    \grace re8 dod4 si la2~

    %139
    la4(sold fad) fad8.\tr mi32 fad
    sold4 la8.\tr sold32 la si4 si,
    dod re8.\parenthesize \tr dod32 re mi4 r

    %142
    r2 r4 la'\mbreak
    \grace sold8 fad4 mi re2~
    re4 dod si la

    %145
    sold2 fad
    mi re
    dod4 dod(re2)

    %148
    dod re\mbreak
    dod re
    dod re

    %151
    dod4 r r2
    <la' la,>2\f mi
    la,4 r8 dod'\p si-! la-! sold-! fad-!

    %154
    mi-! re-! dod-! si-! la-! si-! dod-! re-!
    dod r si r la r r4\mbreak
    <<la'2\f\\la>> mi

    %157
    la,4 r8 dod'\p si-! la-! sold-! fad-!
    mi-! re-! dod-! si-! la-! si-! dod-! re-!
    dod r si r la  dod mi16 mi mi mi

    %160
    \repeat unfold 8 {re} dod dod dod dod mi\< mi mi mi
    \repeat unfold 8 {re} dod dod dod dod mi mi mi mi\mbreak
    re\f\! \repeat unfold 7 {re} dod dod dod dod si si si si

    %163
    la la'\ff la la <<\repeat unfold 12 {la}\\{s4 \repeat unfold 8 {la16} }>>
    <<\repeat unfold 8 {la} \\ \repeat unfold 8 {la} >> \repeat unfold 8 {sold}
    la4 r r <<mi\\dod\p>>

    %166
    <mi re>1
    <mi dod>
    <mi re>

    %169
    <<
        {
            mi1
            mi
            mi\mbreak

            %172
            mi
        }\\{
            dod2 re
            dod re
            dod re
            dod re
        }
    >>
    <mi dod>4 la'16\f la la la sold sold sold sold sol sol sol sol
    fad fad fad fad mi mi mi mi red red red red re re re re

    %175
    dod8\p la4 la la la8~
    la la4 la la la8
    <<
        {
            la'16\f \repeat unfold 15{la}

            %178
            \repeat unfold 16 {sold}
            la, la la la
        }\\{
            dod! \repeat unfold 15{dod}
            \repeat unfold 16 {si}
            la la la la
        }
    >> la' la la la sold! sold sold sold sol sol sol sol
    fad fad fad fad mi mi mi mi red red red red re re re re\mbreak

    %181
    dod8\p la4 la la la8~
    la la4 la la la8
    <<
        {
            la' 16\repeat unfold 15{la}

            %184
            \repeat unfold 16 {sold}
        }\\{
            dod,! \f \repeat unfold 15{dod}
            \repeat unfold 16 {si}
        }
    >>
    la'8 la, sold8.\tr fad32 sold la8 la \grace dod16 si8 la16 sold
    la8 la sold8.\tr fad32 sold la8 la \grace dod16 si8 la16 sold

    %187
    la4 <<{<mi'  dod>4 <mi dod>}\\{la, la}>> r

}


IIvlan =\relative do' {

    <<la'2\f\\la>> mi
    la,4 r r2
    la2.\p la'4

    %4
    mi mi, la r
    <<la'2\f\\la>> mi
    la,4 r r2

    %7
    la2.\p la4\mbreak
    mi mi' la, r
    si1

    %10
    la
    si
    la2. r4

    %13
    r2 r8 red-! fad-! red-!\mbreak
    fad4 r r8 red-! fad-! red-!
    fad4 si,2 si'4~

    %16
    si sold sold sold
    red red red red
    mi8 mi mi mi mi mi mi mi

    %19
    mi mi mi mi mi4 sold,!
    \clef bass \key la\major si,8 \ff si' si, si' si, si' si, si'\mbreak
    si, si' si, si' si, si' si, si'

    %22
    si, si' si, si' si, si' si, si'
    si, si' si, si' si, si' si, si'
    \clef alto \key la\major si si' si, si si4 r

    %25
    R1*3\mbreak
    r2 r4 si'\dolce
    \grace la8 sold4 fad mi2~

    %30
    mi4 red dod2
    si4 si si si
    si r r2

    %33
    R1*2
    si1~
    si\parenthesize ~\mbreak

    %37
    si~
    si4 r r2
    mi2\f si

    %40
    mi,4 r r2
    r mi2\p
    si'8-! r si-! r mi-! r r4

    %43
    mi2\f si
    mi,4 r r2\mbreak
    r mi2\p

    %46
    si'8 r si r mi mi mi mi
    mi la,(fad) fad' mi mi mi mi
    mi\< la,(fad) fad' mi mi mi mi

    %49
    mi\f\! la,(fad) fad' mi mi red red
    mi\ff mi fad fad sold sold la la
    si si si si si, si si si\mbreak

    %52
    mi4 r r2
    R1*3
    r2 red'8\p red red8.\tr si32 red

    %57
    mi4 r fad,8 fad fad8.\tr mi32 fad
    sold4 r  red'8 red red8.\tr si32 red
    mi4 r fad,8 fad fad8.\tr mi32 fad\mbreak

    %60
    sold16\f sold sold sold sold sold sold sold fad fad fad fad mi mi mi mi
    mi mi mi mi red red red red dod dod dod dod si si si si
    si8 r r4 r2

    %63
    R1
    si8\f \repeat unfold 7 {si}
    \repeat unfold 8 {si}

    %66
    sold16 sold sold sold sold' sold sold sold fad fad fad fad mi mi mi mi
    mi mi mi mi red red red red dod dod dod dod si si si si\mbreak
    si8 r r4 r2

    %69
    R1
    si8\f \repeat unfold 7 {si}
    \repeat unfold 8 {si}

    %72
    \repeat unfold 16 {si16}
    \repeat unfold 16 {si}
    si4 <sold' si,> <sold si,> r\mbreak

    %75
    mi2\f si
    mi8\p \repeat unfold 7 {mi}
    \repeat unfold 8 {mi}

    %78
    mi mi mi mi mi fad sold la
    si2\f sold4 mid
    dod8\p \repeat unfold 7 {dod}

    %81
    \repeat unfold 8 {dod}\mbreak
    dod4 dod2 dod4~
    dod la2 la4

    %84
    si2(re4 fad)
    si,2(re4 si)
    la2(dod4 fad)

    %87
    <fad la,>1~
    <fad la,>\mbreak
    <<sol2.\\la,>> la4~

    %90
    la r r2
    fa'1\p
    sol~

    %93
    sol2 sib4 sol?
    fa2 la4(re,)
    <fa la,>1

    %96
    <fad! la,>\mbreak
    <<la2.\\fad>> red4
    mi r r2

    %99
    R1*7
    mi1~
    mi~

    %108
    mi
    red4(la' fad! red)
    mi1~\mbreak

    %111
    mi~
    mi
    red4(la' fad! red)

    %114
    mi r r2
    mi,4 r r2
    mi4 r r2

    %117
    mi4 mi' mi mi\mbreak
    la2\f mi
    la,4 r r2

    %120
    la2.\p la'4
    mi mi, la r
    <sol' la,>2\ff mi4 dod

    %123 OOKK
    la8-! la16 (si) dod8 re mi fad sol mi
    <<
        {
            mi4 mi mi mi
            re
        }\\{
            dod dod dod dod
            re
        }
    >> r r2

    %126
    R1
    r2 r4 red
    mi16 mi mi mi fad fad fad fad sold sold sold sold la la la la\mbreak

    %129
    si\f si si si si si si si la4 la,
    dod\p (mi la2
    sold4 fad mi re)

    %132
    dod16\f \repeat unfold 7 {dod} \repeat unfold 8 {si}
    si8 si16 la sold8 la si dod re si
    dod4(mi la2

    %135
    sold4 fad mi re)\mbreak
    dod16\f \repeat unfold 7 {dod} \repeat unfold 8 {si}
    si8 sold'16 la si8 sold mi4 r

    %138
    R1*3
    r2 r4 mi'\p
    \grace re8 dod4 si la2~\mbreak

    %143
    la4 sold fad2
    mi4 mi mi mi
    mi r r2

    %146
    R1*2
    mi1~\mbreak
    mi~

    %150
    mi~
    mi4 r r2
    <<la\f\\la>> mi

    %153
    la,4 r r2
    r la\p
    mi8 r mi r la r r4\mbreak

    %156
    <<la'2\f\\la>> mi
    la,4 r r2
    r la\p

    %159
    mi8 r mi r la la' la la
    la re,(si) si' la la la\< la
    la re,(si) si' la la la la \mbreak

    %162
    la\f\! re, si si la la sold sold
    la\ff la si si dod dod re re
    mi mi mi mi mi, mi mi mi

    %165
    la4 r r2
    R1*3
    r2 sold'8\p sold sold8.\tr fad32 sold

    %170
    la4 r si8 si si8.\tr la32 si
    dod4 r sold8 sold sold8.\tr fad32 sold\mbreak
    la4 r si8 si si8.\tr la32 si

    %173
    dod16\f dod dod dod dod dod dod dod si si si si la la la la
    la la la la sold sold sold sold fad fad fad fad mi mi mi mi
    mi8 r r4 r2

    %176
    R1
    mi8\f \repeat unfold 7 {mi8}
    \repeat unfold 8 {mi8}

    %179
    dod16 dod dod dod dod' dod dod dod si si si si la la la la
    la la la la sold sold sold sold fad fad fad fad mi mi mi mi\mbreak
    mi8 r r4 r2

    %182
    R1
    mi8\ff \repeat unfold 7 {mi8}
    \repeat unfold 8 {mi8}

    %185
    \repeat unfold 16 {mi16}
    \repeat unfold 16 {mi16}
    mi4 <<{<la mi> <la mi>}\\{dod, dod}>> r

}


IIvcIn =\relative do {

    <<la'2\f\\la>>  mi
    la,4 r r2
    R1*2

    %5
    <<la'2\f\\la>>  mi
    la,4 r r2
    R1

    %8
    r2 r4 la\p
    mi' mi mi mi
    la, la la la

    %11
    mi' mi mi mi
    la, la la la
    la r r la'\mbreak

    %14
    la r r la
    la r r la
    sold sold sold sold

    %17
    red red red red
    mi mi fad fad
    sold_\markup\italic {poco \dynamic f} sold la(lad)

    %20
    si,8\ff si' si, si' si, si' si, si'\mbreak
    si, si' si, si' si, si' si, si'
    si, si' si, si' si, si' si, si'

    %23
    si, si' si, si' si, si' si, si'
    si, si' si, si si4 r
    mi\p(fad sold mi)

    %26
    la,(si dod) la
    si2. red4\mbreak
    mi(fad sold red)

    %29
    mi(fad sold mi)
    la,(si dod) la
    si si si si

    %32
    si1
    si
    si~

    %35
    si4 si si si
    si si si si\mbreak
    si si si si

    %38
    mi, r r2
    \clef tenor \key la\major mi''2\f si
    mi,4 r r2

    %41
    R1*2
    mi'2\f si
    mi,4 r r2\mbreak

    %45
    R1
    \clef bass \key la\major  r2 r4 sold,\p
    la(si dod) sold

    %48
    la\<(si dod) sold8 sold
    la\f\!  la si si dod dod red red
    mi\ff mi fad fad sold sold la la

    %51
    si si si si si, si si si \mbreak
    mi4\pp(sold si mi,)
    red(fad si red,)

    %54
    mi(sold si mi,)
    red(fad si red,)
    mi4 r r2

    %57
    mi4 r si r
    mi, r r2
    mi'4 r si r\mbreak

    %60
    mi,\f mi(fad sold)
    la si dod red
    mi\p(lad, dod mi)

    %63
    dod(lad dod mi)
    si8\f si si si si si si si
    si si si si si si si si

    %66
    mi4 mi, fad sold
    la si dod red\mbreak
    mi\p (lad, dod mi)

    %69
    dod(lad dod mi)
    si8\f si si si si si si si
    si si si si si si si si

    %72
    mi mi si' si mi, mi si si
    mi mi si' si mi, mi si si
    mi,4 mi mi r \mbreak

    %75
    \clef tenor \key la\major mi''2 si
    mi,4 r r2
    R1*2

    %79
    \clef bass \key la\major si'2\f sold4 mid
    dod4 r r2
    r r4 dod\p \mbreak

    %82
    fad, fad' fad fad
    fad, fad' fad fad
    fad, fad' fad fad

    %85
    fad, fad' fad fad
    fad, fad' fad fad
    fad, fad' fad fad

    %88
    fad, fad' fad fad\mbreak
    mi, mi' mi mi
    re, re' la la'

    %91
    re,, re' re re
    re, re' re re
    re, re' re re

    %64
    re, re' re re
    re, re' re re
    do, do' do do\mbreak

    %97
    si si si si
    mi mi, si' si
    mi, mi' mi mi

    %100
    mi, mi' mi mi
    mi, mi' mi mi
    mi, mi' mi mi

    %103
    mi, mi' mi mi\mbreak
    mi1
    re!2( re,

    %106
    do)  do'(
    si si')
    la, la'(

    %109
    red, red,)(
    mi sold)\mbreak
    si si'

    %112
    la, la'
    red, red,
    mi4 mi' mi mi

    %115
    mi, mi' mi mi
    mi, mi' mi mi
    mi, mi' mi mi\mbreak

    %118
    <<la2\\la\f>> mi
    la,4 r r2
    R1*2

    %122
    la2\ff dod4 mi
    sol2 mi4 dod
    la <<{la' la la}\\{la la la}>>\mbreak

    %125
    re,8\p re re re re re re re
    re re re re re re re re
    re re re re re re red red

    %128
    mi\< mi fad fad sold sold la la\mbreak
    si\f\! si sold! sold la la la la
    la,4\p(dod mi la)

    %131
    sold(fad mi re)
    dod8\f dod dod dod red red red red
    mi8 mi16 (fad) sold8 la si dod re si

    %134
    la,4\p(dod mi la)
    sold(fad mi re)\mbreak
    dod8\f dod dod dod red red red red

    %137
    mi sold16(la) si8 sold mi4 r
    la,\p(si dod) la
    re(mi fad re)

    %140
    mi2. sold4
    la(si dod sold)
    la (si dod la)

    %143
    re,(mi fad re)
    mi mi mi mi
    mi,1~

    %146
    mi
    mi
    mi4 mi' mi mi\mbreak

    %149
    mi mi mi mi
    mi mi mi mi
    la, r r2

    %152
    \clef tenor \key la\major la''2\f mi
    <<la,4\\la>> r r2
    R1*2\mbreak

    %156
    la'2\f mi
    <<la,4\\la>> r r2
    \clef bass \key la\major R1

    %159
    r2 r4 dod,\p
    re mi fad dod\<
    re mi fad dod8 dod\mbreak

    %162
    re\f\! re mi mi fad fad sold sold
    la\ff la, si si dod dod re re
    mi mi mi mi mi mi mi mi

    %165
    \clef tenor \key la\major la4\p(dod mi la,)
    sold(si mi sold,)
    la(dod mi la,)

    %168
    sold(si mi sold,)
    la4 r r2
    \clef bass \key la\major la 4 r mi r

    %171
    la, r r2\mbreak
    la'4 r mi r
    la,\f la (si dod)

    %174
    re mi fad sold
    la\p (red, fad la)
    fad(red fad la)

    %177
    mi8\f mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi
    la,4 la (si dod)

    %180
    re(mi fad sold)\mbreak
    la\p(red, fad la)
    fad(red fad la)

    %183
    mi8\ff mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi
    la, la mi' mi la, la mi mi

    %186
    la la mi' mi la, la mi mi
    la4 <la' mi la,> <la mi la,> r

}


IIvcIIn =\relative do {

    <<la'2\f\\la>>  mi
    la,4 r r2
    R1*2

    %5
    <<la'2\f\\la>>  mi
    la,4 r r2
    R1

    %8
    r2 r4 la\p
    mi' mi mi mi
    la, la la la

    %11
    mi' mi mi mi
    la, la la la
    la r r la'\mbreak

    %14
    la r r la
    la r r la
    sold sold sold sold

    %17
    red red red red
    mi mi fad fad
    sold_\markup\italic {poco \dynamic f} sold la(lad)

    %20
    si,8\ff si' si, si' si, si' si, si'\mbreak
    si, si' si, si' si, si' si, si'
    si, si' si, si' si, si' si, si'

    %23
    si, si' si, si' si, si' si, si'
    si, si' si, si si4 r
    R1

    %26
    r2 r4 la'\p
    \grace sold8 fad4(mi red2)\mbreak
    mi4(fad sold red)

    %29
    mi(fad sold mi)
    la,(si dod) la
    si si si si

    %32
    si1
    si
    si~

    %35
    si4 si si si
    si si si si\mbreak
    si si si si

    %38
    mi, r r2
    mi'2\f si
    mi,4 r r2

    %41
    R1*2
    mi'2\f si
    mi,4 r r2\mbreak

    %45
    R1
    r2 r4 sold\p
    la(si dod) sold

    %48
    la\<(si dod) sold8 sold
    la\f\!  la si si dod dod red red
    mi\ff mi fad fad sold sold la la

    %51
    si si si si si, si si si \mbreak
    mi4\pp(sold si mi,)
    red(fad si red,)

    %54
    mi(sold si mi,)
    red(fad si red,)
    mi4 r si r

    %57
    mi, r r2
    mi'4 r si r
    mi, r r2\mbreak

    %60
    mi4\f mi(fad sold)
    la si dod red
    mi\p(lad, dod mi)

    %63
    dod(lad dod mi)
    si8\f si si si si si si si
    si si si si si si si si

    %66
    mi4 mi, fad sold
    la si dod red\mbreak
    mi\p (lad, dod mi)

    %69
    dod(lad dod mi)
    si8\f si si si si si si si
    si si si si si si si si

    %72
    mi mi si' si mi, mi si si
    mi mi si' si mi, mi si si
    mi,4 mi mi r \mbreak

    %75
    mi'2\f si
    mi,4 r r2
    R1*2

    %79
    si''2\f sold4 mid
    dod4 r r2
    r r4 dod\p \mbreak

    %82
    fad, fad' fad fad
    fad, r r2
    fad4 r r2

    %85
    fad4 r r2
    fad4 r r2
    fad4 r r2

    %88
    fad1\mbreak
    mi
    re4 r r2

    %91
    re4 r r2
    re4 r r2
    re4 r r2

    %94
    re4 r r2
    re'1
    do\mbreak

    %97
    si
    mi,4 r r2
    mi4 r r2

    %100
    mi4 r r2
    mi4 r r2
    mi4 r r2

    %103
    mi4 r r2\mbreak
    mi2( mi'
    re! re,

    %106
    do) do'(
    si si')
    la, la'(

    %109
    red, red,)(
    mi sold)\mbreak
    si si'

    %112
    la, la'
    red, red,
    mi4 r r2

    %115
    mi4 r r2
    mi4 r r2
    mi4 mi' mi mi\mbreak

    %118
    <<la2\\la\f>> mi
    la,4 r r2
    R1*2

    %122
    la2\ff dod4 mi
    sol2 mi4 dod
    la la la la\mbreak

    %125
    re, r r2
    re4 r r2
    <<re'4\\re>> r r red

    %128
    mi8\< mi fad fad sold sold la la\mbreak
    si\f\! si sold! sold la la la la
    la,4\p(dod mi la)

    %131
    sold(fad mi re)
    dod8\f dod dod dod red red red red
    mi8 mi16 (fad) sold8 la si dod re si

    %134
    la,4\p(dod mi la)
    sold(fad mi re)\mbreak
    dod8\f dod dod dod red red red red

    %137
    mi sold16(la) si8 sold mi4 r
    R1
    r2 r4 re'\p(

    %140
    si la sold2)
    la4(si dod sold)
    la (si dod la)

    %143
    re,(mi fad re)
    mi mi mi mi
    mi,1~

    %146
    mi
    mi
    mi4 mi' mi mi\mbreak

    %149
    mi mi mi mi
    mi mi mi mi
    la, r r2

    %152
    <<la'2\f\\la>> mi
    la,4 r r2
    R1*2\mbreak

    %156
    <<la'2\f\\la>> mi
    la,4 r r2
    R1

    %159
    r2 r4 dod\p
    re mi fad dod\<
    re mi fad dod8 dod\mbreak

    %162
    re\f\! re mi mi fad fad sold sold
    la\ff la, si si dod dod re re
    mi mi mi mi mi, mi mi mi

    %165
    la4 r r2
    R1*3
    la'4\p r mi r

    %170
    la, r r2
    la'4 r mi r\mbreak
    la, r r2
    r4 la\f (si dod)

    %174
    re mi fad sold
    la\p (red, fad la)
    fad(red fad la)

    %177
    mi8\f mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi
    la,4 la (si dod)

    %180
    re(mi fad sold)\mbreak
    la\p(red, fad la)
    fad(red fad la)

    %183
    mi8\ff mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi
    la, la mi' mi la, la mi mi

    %186
    la la mi' mi la, la mi mi
    la4 <la' mi la,> <la mi la,> r








}

forma = {

    \time 4/4
    \key la\major
    \tempo 2 = 75
    s1*187
    \bar "|."

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
}

IIIfln =\relative do'' {

    la'4\p~
    la sold fad
    mi2 mi4
    \grace mi8 re4 dod si

    %4
    dod8. (re32 mi) la,4 la'~
    la sold fad
    mi2 mi4

    %7
    \grace mi8 re4 dod si
    la2 r4
    R2.*11

    %20
    r4 r la'\dolce~
    la(sold fad)
    mi2 mi4

    %23
    \grace mi8 re4 dod si
    dod8. (re32 mi) la,4 la'~
    la sold fad

    %26
    mi16 mi, fad sold la(si) dod-! re-! mi-! fad-! sold-! la-!
    \grace sold fad8 mi16 re dod4 si
    la2 do8.\tr re16\mbreak

    %29
    mi4 la,8(la' sol fa)
    mi4 r r
    mi4 la,8(la' sol fa)

    %32
    mi4 r r
    do2.
    si

    %35
    si'
    do4  do,16(re) mi fa sol(la) si do
    la(fa do' la) sol(mi do mi) sol(mi do' sol)

    %38
    la(fa do' la) sol(mi do mi) sol(mi do' sol)\mbreak
    la(do si la) \grace la sol8 fa16 mi \grace sol16 fa8 mi16 re
    mi8.\tr fa16 sol4 do,16(mi sol do)

    %41
    la(fa do' la) sol(mi do mi) sol(mi do' sol)
    la(fa do' la) sol mi do mi sol mi do' sol
    la8\noBeam la,(sol fa mi fa)

    %44
    fa4(mi) mi'8.\tr fa16
    sol4 do,8(do' si la)
    sol4 r r

    %47
    sol8. mi16 do8(do' si la)\mbreak
    sol4 r sol8.\tr la16
    sib16( sol mi sol sib sol mi sol sib sol mi sol)

    %50
    sib16( sol mi sol sib sol mi sol sib sol mi sol)
    la(sol mi sol la sol mi sol la sol mi sol)
    fa re mi fa sol la si! dod re8 r

    %53
    do16(la fad la do la fad la do la fad la)
    do16(la fad la do la fad la do la fad la)
    si!(la fad la si la fad la si la fad la)\mbreak

    %56
    sold(mi si sol) mi4 r
    R2.
    r4 r do'8.\tr re16

    %59
    mi4 la,8(la' sol fa)
    mi4 r do16(mi la mi)
    fa(re) la' fa mi(do) la do mi(do) la' mi

    %62
    fa(re) la' fa mi(do) la do mi(do) la' mi
    fa la sol fa \grace fa mi8 re16 do \grace mi re8 do16 si
    do8.\tr re16 mi4 la,16(do mi la)\mbreak

    %65
    fa(re la' fa) mi(do la do) mi(do la' mi)
    fa(re la' fa) mi(do la do) mi(do la' mi)
    fa8 re (do si la sold)

    %68
    \grace sold8 la2

}

IIIvlIn =\relative do'' {

    la4\p~
    la(sold fad)
    mi2 mi'4
    \grace mi8 re4 dod si

    %4
    dod8. (re32 mi) la,4 la~
    la sold fad
    mi2 mi'4

    %7
    \grace mi8 re4 dod si
    la2 dod8.\tr re16
    mi4 mi mi
    mi(mi,) mi'~\mbreak
    mi red dod
    si2 si'16_\markup\italic {poco \dynamic f}(sold) mi si
    dod4\tr si si'16(sold) mi si
    dod4\tr si si'16(sold) mi si
    dod8.\dolce(red32 mi) si4(la)
    \grace la8 sold2 si'16(sold) mi si
    dod-! dod(red mi) si mi(sold) mi si'(sold) mi si
    dod-! dod(red mi) si mi(sold) mi si'\f(sold mi) si
    dod-! dod(red mi) \grace mi red8 dod16 si \grace si la8 sold16 fad\mbreak

    %20
    mi2 la4\p~
    la(sold fad)
    mi2 mi'4

    %23
    \grace mi8 re4 dod (si)
    dod8. (re32 mi) la,4 la~
    la sold fad

    %26
    mi16 mi fad sold la(si) dod-! re-! mi-! fad-! sold-! la-!
    \grace sold fad8\f mi16 re dod4 si
    <<la2\\la>> la8.\tr si16\mbreak

    %29
    do4 do8(fa mi re)
    do4 r r
    do4 do8 \parenthesize (fa  mi re)

    %32
    do4 r la16(si do re)
    mi8 mi,4 mi mi8
    fa fa4 fa fa8

    %35
    fa'16\f(mi) re mi re(do) si do si(la) sol fa
    mi8\p mi mi mi mi mi
    fa fa mi mi mi mi

    %38
    fa fa mi mi mi mi\mbreak
    fa8. fa'16 \grace fa mi8 re16 do \grace mi re8 do16 si
    do8. re16 mi-! mi(do sol) mi8 mi

    %41
    fa fa mi mi mi mi
    fa fa mi mi mi mi
    fa\pp(la sol fa mi fa)

    %44
    fa4(mi) do'8.\tr re16
    mi4 mi,8 (mi' sol fa)
    mi4 r r

    %47
    mi8 (do16 sol) mi8 (mi' sol fa)\mbreak
    mi4 r mi,8.\tr fa16
    sol8\p mi'4 mi mi8~

    %50
    mi mi4 mi  mi8~
    mi la,4 la la8
    la4 r r

    %53
    r8 fad'4 fad fad8~
    fad fad?4 fad fad8~
    fad si,4 si si8\mbreak

    %56
    si2 do8.\tr\p re16
    mi4 la,8(la' sol fa)
    mi8 r r4 la,8. si16

    %59
    do4 do8(fa mi re)
    do16(la) mi do la8 la' la la
    la la la la la la

    %62
    la la la la la la
    la16 fa' mi re \grace re do8 si16 la \grace do si8 la16 sold
    la8.\tr si16 do8 la la la\mbreak

    %65
    la la la la la la
    la la la la la la
    la fa'(mi re do si)

    %68
    \grace si8 la2

}


IIIvlIIn =\relative do'' {

    r4
    r r si\dolce~
    si la dod
    \grace dod8 si4 la sold

    %4
    la r r
    r r si~
    si la dod

    %7
    \grace dod8 si4 la sold
    la2 la8.\tr (si16)
    dod4 dod, dod

    %10
    si2.\mbreak
    r4 r fad''~
    fad mi8_\markup\italic {poco \dynamic f} mi, mi mi

    %13
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    mi4 sold(fad)

    %16
    \grace fad8 mi2 mi4
    mi8 mi mi mi mi mi
    mi mi mi mi mi mi

    %19
    mi8.\f dod'16 \grace dod si8 la16 sold \grace sold fad8 mi16 red\mbreak
    mi4 r r
    r r si'\p~

    %22
    si la dod
    \grace dod8 si4 la (sold)
    la4 r r

    %25
    r r si~
    si la8.\f si16 dod(re) mi dod
    \grace mi re8 dod16 si la4 sold

    %28
    <<la2\\la>> r4\mbreak
    R2.
    <<la8\f\\{la sol16 fa}>> mi(fa) mi re do (re) do si

    %31
    la4 r r
    <<la'8\f\\{la sol16 fa}>> mi re do si la8 la
    la\p do4 do do'8

    %34
    si si4 si si8
    <<{si si4 si si8}\\{re, re4 re re8}>>
    do'\p do, do do do do

    %37
    do do do do do do
    do do do do do do\mbreak
    do4 r r

    %40
    r do8 do do do
    do do do do do do
    do do do do do do

    %43
    do\pp(fa mi re do re)
    re4(do) r
    R2.

    %46
    do'8\f si16 la sol(la) sol fa mi(fa) mi re
    do4 r r\mbreak
    do'8\f si16 la sol(fa) mi re do8 do

    %49
    mi\p sol4 sol sol8~
    sol sol4 sol sol8~
    sol sol4 sol sol8

    %52
    fa4 r r
    r8 la4 la la8~
    la la4 la la8~

    %55
    la la4 la la8\mbreak
    sold2 la8.\p si16
    do4 do8(fa mi re)

    %58
    <<do8\f\\{la sol16 fa}>> mi(re) do si la8 la
    la4 r r
    R2.

    %61
    la2.~\p
    la
    R2.*2\mbreak

    %65
    la2.~
    la~
    la8 re'(do si la sold)

    %68
    \grace sold? la2

}


IIIvlan =\relative do' {

    dod4
    re2.
    mi2 la,4
    fad'(mi) mi

    %4
    mi2 dod4
    re2.
    mi2 la,4

    %7
    re mi mi
    la,2 r4
    r la la

    %10
    sold sold sold\mbreak
    la2.
    si4(sold mi)

    %13
    mi2.~
    mi
    r4 r red'

    %16
    mi si sold
    mi2.
    mi

    %19
    la4\f si si\mbreak
    mi la,\p(dod)
    re2.

    %22
    mi2 la,4
    fad' mi mi
    mi2 dod4

    %25
    re2.
    mi2 la,4\f
    re mi mi

    %28 OOKK
    la,2 r4
    la\p la la
    <<la'8\f\\{la sol16 fa}>> mi(fa) mi re do (re) do si

    %31
    la4\p la la
    <<la'8\f\\{la sol16 fa}>> mi re do si la8 la
    la4\p r r

    %34
    re2.
    <<{re8\f re re re re re}\\{re re re re re re}>>
    do4\p do do

    %37
    do do do
    do do do\mbreak
    fa sol sol,

    %40
    do do do
    do do do
    do do do

    %43
    fa, sol sol
    do,2 r4
    do' do do

    %46
    do8\f si16 la sol(la) sol fa mi(fa) mi re
    do4 do'\p do\mbreak
    do'8\f si16 la sol(fa) mi re do8 do

    %49
    sib2.\p
    sib'
    la~

    %52
    la4 r r
    do,2.
    do'

    %55
    si!\mbreak
    si4 r r
    la, la la

    %58
    la'8\f sol16 fa mi re do si la8 la
    la4\p la la
    la2 r4

    %61
    R2.
    r4 r do
    re mi mi

    %64
    la, r r\mbreak
    R2.
    r4 r do

    %67
    re mi mi
    la,2

}


IIIvcIn =\relative do {

    la4\p
    si2(re4)
    dod2 la4
    re mi mi,

    %4
    la2 la4
    si2(re4)
    dod2 la4

    %7
    re mi mi,
    la2 r4
    R2.

    %10
    r4 r mi'\mbreak
    fad2 la4
    sold sold sold

    %13
    la(sold) sold
    la(sold) sold
    la si si,

    %16
    mi, mi' sold
    la(sold) sold
    la(sold) sold\f

    %19
    la si si,\mbreak
    mi dod\p(la)
    si2(re4)

    %22
    dod2 la4
    re mi mi,
    la2 la4

    %25
    si2(re4)
    dod2 la4\f
    re mi mi,

    %28
    la2 r4\mbreak
    R2.
    <<la'8\f\\{la sol16 fa}>> mi(fa) mi re do (re) do si

    %31
    la4 r r
    <<la'8\\{la sol16 fa}>> mi re do si la8 la
    la\p la la la la la

    %34
    sol sol sol sol sol sol
    <<{sol'\f sol sol sol sol sol}	\\{sol, sol sol sol sol sol}>>
    do4 \p r r

    %37
    do r r
    do r r\mbreak
    fa sol sol,

    %40
    do r r
    do r r
    do r r

    %43
    fa sol sol,
    do2 r4
    R2.

    %46
    do'8\f si16 la sol (la) sol fa mi(fa) mi re
    do4 r r\mbreak
    do'8\f si16 la sol(fa) mi re do8 do

    %49
    dod\p dod dod dod dod dod
    dod dod dod dod dod dod
    dod dod dod dod dod dod

    %52
    re4 re, fa'8(mi)
    red red red red red red
    red red red red red red

    %55
    red red red red red red\mbreak
    mi4 mi, r
    R2.

    %58
    la'8\f sol16 fa mi re do si la8 la
    la4 r r
    la\p la do'

    %61
    re(do) do
    re(do) do,
    re mi mi

    %64
    la la, do'\mbreak
    re(do) do
    re(do) do,

    %67
    re mi mi
    la,2

}


IIIvcIIn =\relative do {

    la4\p
    si2(re4)
    dod2 la4
    re mi mi,

    %4
    la2 la4
    si2(re4)
    dod2 la4

    %7
    re mi mi,
    la2 r4
    R2.

    %10
    r4 r mi'\mbreak
    fad2 la4
    sold sold sold

    %13
    la(sold) sold
    la(sold) sold
    la si si,

    %16
    mi, mi' sold
    la(sold) sold
    la(sold) sold\f

    %19
    la si si,\mbreak
    mi dod\p(la)
    si2(re4)

    %22
    dod2 la4
    re mi mi,
    la2 la4

    %25
    si2(re4)
    dod2 la4\f
    re mi mi,

    %28
    la2 r4\mbreak
    R2.
    <<la'8\f\\{la sol16 fa}>> mi(fa) mi re do (re) do si

    %31
    la4 r r
    <<la'8\\{la sol16 fa}>> mi re do si la8 la
    la\p la la la la la

    %34
    sol sol sol sol sol sol
    <<{sol'\f sol sol sol sol sol}	\\{sol, sol sol sol sol sol}>>
    do4 \p r r

    %37
    do r r
    do r r\mbreak
    fa sol sol,

    %40
    do r r
    do r r
    do r r

    %43
    fa sol sol,
    do2 r4
    R2.

    %46
    do'8\f si16 la sol (la) sol fa mi(fa) mi re
    do4 r r\mbreak
    do'8\f si16 la sol(fa) mi re do8 do

    %49
    dod\p dod dod dod dod dod
    dod dod dod dod dod dod
    dod dod dod dod dod dod

    %52
    re4 re, fa'8(mi)
    red red red red red red
    red red red red red red

    %55
    red red red red red red\mbreak
    mi4 mi, r
    R2.

    %58
    la'8\f sol16 fa mi re do si la8 la
    la4 r r
    la\p la do'

    %61
    re(do) do
    re(do) do,
    re mi mi

    %64
    la la, do'\mbreak
    re(do) do
    re(do) do,

    %67
    re mi mi
    la,2

}

forma = {

    \time 3/4
    \key la\major
    \tempo 2 = 57
    \partial 4 s4
    s2.*7
    s2
    \bar ":..:"
    s4
    s2.*19
    s2
    \bar ":..:"\break
    \key la\minor
    s4
    s2.*15
    s2
    \bar ":..:"
    s4
    s2.*23
    s2
    \bar ":|."
    \mark\markup\smaller\center-column {"D.C. il""Maggiore"}

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
        title = \markup\smaller{Divertimento III in La maggiore}
        composer = \markup \center-column{"L. Boccherini (1743 -1805)"}
    }

    \markup\huge { [1.] Allegretto moderato}

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
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

    \markup\huge { [2.] Allegro assai}

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
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

    \markup\huge { [3.] Amoroso}

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
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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