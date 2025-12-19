\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

soli = ^\markup \italic { soli }

solo = ^\markup \italic { solo }

tu = ^\markup \italic "tutti"

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
    \terzinequarto\con
}

IvlIn =\relative do'' {

    la1
    dod2 mi8 dod (si la)
    sold[(si mi8.) mi16] mi8[(sold si8. )si16]

    %4
    si1
    re,\mbreak
    dod8(si la) mi' re (dod si) la

    %7
    fad'4 fad8. sold16 la4 sold8. fad16
    \grace fad8 mi4. re8 \grace re8 dod4. si8
    la1\soli

    %10
    dod2 mi8 dod (si la)
    sold[(si mi8.) mi16] mi8[(sold si8.) si16]
    re,1

    %13
    dod2.\tr si8 la\mbreak
    sold si mi sold si sold mi si
    dod(la) mi'(dod)  la(fad) red(fad)

    %16
    mi si' mi sold si sold mi si
    dod(la) mi'(dod)  la(fad) red(fad)
    mi2 r

    %19
    si'' \grace la8 sold4 \grace fad8 mi4
    \tuplet 3/2 { red8(mi fad) } mi4 r2\mbreak
    si'2 \grace la8 sold4 \grace fad8 mi4

    %22
    \tuplet 3/2 { red8 mi fad } mi4 r2
    fad1
    sold8(mi) si'(sold) fad(mi) red(mi)

    %25
    fad1
    sold8(mi) si'(sold) fad(mi) red(mi)
    si'2 si,

    %28
    \tuplet 3/2 { dod8 mi (red) } dod8.[si16]\tuplet 3/2 { la8 dod (si) } la8.[sold16]\mbreak
    fad4 la dod mi
    \tuplet 3/2 { red8 fad (mi) } red8.[dod16] \tuplet 3/2 { si8 red (dod) } si8. [la16]

    %31
    sold4 si red fad
    \tuplet 3/2 { mi8(sold fad) } mi8.[red16] \tuplet 3/2 { dod8(mi red) } dod8.[si16]
    lad4 sold' \grace sold8 fad4 \grace fad8 mi4

    %34
    red8 dod si dod red mi fad sold\mbreak
    la16 fad8. si16 si,8. si2\tr
    sold'16 mi8. si'16 si,8. si2\tr

    %37
    la'16 fad8. si16 si,8. si2\tr
    sold'16 mi8. si'16 si,8. si2\tr
    la'8 sold \grace sold fad mi \grace mi red dod \grace dod si la

    %40
    sold4 si\tu\f mi sold
    si1
    dod, \mbreak

    %43
    \afterGrace si {dod16[ red mi fad]}
    fad1\tr
    sold8\soli(la si) la si(sold fad mi)

    %46
    sold la si la si(sold fad mi)
    sold(la si) la si(sold fad mi)
    la4 fad r si8. fad16

    %49
    sold4 mi r si'8. sold16
    la4 fad r si8. fad16
    sold4 mi r2

    %52
    re1\tu\f \mbreak
    dod
    \afterGrace si {dod16[ red mi fad]}

    %55
    fad1
    mi8 si'(sold mi) red( si la fad)
    mi(sold si mi) red(fad la) fad

    %58
    mi si'(sold mi)  red( si la fad)
    mi(sold si mi) red(fad la) fad
    <mi si mi,>1

    %61 OOKK
    si'1\soli
    dod
    si4 si8 re dod4 si8 la

    %64
    sold fad mi red mi fad sold la
    si4 si8. re16 dod4 r
    si si8. re16 dod4 r

    %67
    si4 si8. re16 dod4 si8. la16
    sold8 fad mi4 r2\mbreak
    sol1

    %70
    fad2 lad
    si8 fad fad4\tr sol8(mi) dod(mi)
    re(fad) si(fad) mi(dod) lad(dod)

    %73
    si8 fad' fad4\tr sol8 mi dod mi
    re(fad) si(fad) mi(dod) lad(dod)
    si dod re mi fad sold? lad si\mbreak

    %76
    si4(la?) sold! fa
    mi dod8 mi re4 fa,
    mi(sold) si re

    %79
    dod dod8. mi16 re4 r
    dod dod8. mi16 re4 r
    dod8 si la si dod re mi fad

    %82
    sol1
    fad2\tr sold!\tr
    la\mbreak dod,4 la'8. dod,16

    %85
    \grace re8 dod4\tr si r2
    la1\tu\f
    dod2 mi8 dod (si la)

    %88
    sold[(si mi8.) mi16] mi8[(sold si8.) si16]
    si1
    re,

    %91
    dod8(si la) mi' re (dod si la)
    fad'4 fad8. sold16 la4 sold8. fad16\mbreak
    \grace fad8 mi4. re8 \grace re dod4. si8

    %94
    la1\soli
    dod2 mi8 dod (si la)
    sold[(si mi8.) mi16] mi8[(sold si8.) si16]

    %97
    re,1
    dod4. la8 la'4. mi8
    \tuplet 3/2 { fad la (sold) } fad8.\tr [mi16] \tuplet 3/2 { re8 fad (mi) } re8.\tr [dod16]\mbreak

    %100
    si4 re fad la
    \tuplet 3/2 { sold8 si (la) } sold8.\tr[fad16] \tuplet 3/2 { mi8  sold (fad) } mi8.\tr[re16]
    dod4 mi sold si

    %103
    la8(si dod) si la(sold fad) mi
    red(mi fad) sold la dod(si la)
    sold fad mi4 r2

    %106
    si'1\soli\mbreak
    dod4 dod8. mi16 mi2
    mi4 re8 dod si4 dod

    %109
    dod\tr si r mi8 dod
    re4 si r re8 si
    dod4 si r mi8 dod

    %112
    re4 si r re8 si
    dod4 la r2
    fad \grace mi8 re4  \grace dod8 si4\mbreak

    %115
    \tuplet 3/2 { lad8 si dod } si4 r2
    mi2 \grace re8 dod4 \grace si8 la4
    \tuplet 3/2 { sold8 la si } la4 r2

    %118
    si1
    dod8 la mi' dod si la sold la
    si1

    %121
    dod16 la8. mi'16 mi,8. mi2\tr
    re'16 si8. mi16 mi,8. mi2\tr\mbreak
    dod'16 la8. mi'16 mi,8. mi2\tr

    %124
    re'16 si8. mi16 mi,8. mi2\tr
    dod'8\f mi re dod si la sold fad
    mi1

    %127
    fa2 sold(
    la) red(
    mi) sold(

    %130
    la4) si re,2
    \grace re8 dod4 si8 dod \grace mi8 re4 dod8 si\mbreak
    la sold fad mi fad sold la si

    %133
    si1\tr
    dod8\tu re mi re mi dod (si la)
    dod re mi re mi dod si la

    %136
    dod re mi re mi dod (si la)
    fad'1
    fad,

    %139
    mi
    si'\tr\mbreak
    la8(mi') dod(la) sold(mi) re(si)

    %142
    la(dod) mi(la) sold(si) re(si)
    la8(mi') dod(la) sold(mi) re(si)
    la(dod) mi(la) sold(si) re(si)

    %145
    <la mi la,>1

}


IvlIIn =\relative do'' {

    R1*2
    mi1
    sold2 si8 sold (fad mi)

    %5
    si(mi sold8.) sold16 si,8(mi sold8.) sold16
    la4. sol8 fad(mi) re(dod)\mbreak
    \grace mi8 re4 re8. mi16 \grace sold8 fad4 mi8. re16

    %8
    dod4 re8.(si16) la4 si8. sold16
    dod,8(mi la8.) la16 dod,8(mi la8.) dod16
    mi4 mi, mi r

    %11
    mi1\soli
    sold2 si8 sold(fad mi)
    mi8(la dod8.) dod16\mbreak si8(la sold fad)

    %14
    mi4 mi sold\p sold
    la la fad fad
    sold sold sold sold

    %17
    la la fad fad
    sold8\f si dod si sold si red fad
    mi4 si si\p si

    %20
    fad si red,(mi)
    r si' si si\mbreak
    fad si red,(mi)

    %23
    r8 fad'\f red fad si, fad red fad
    si,4\p si si si
    \once\stemUp si8 fad''\f red fad si, fad red fad

    %26
    si,4\p si si si
    si2 mi'\soli\f~
    mi mi,

    %29
    \tuplet 3/2 { dod'8 mi (red) } dod8.[si16]\tuplet 3/2 { la8 dod (si) } la8.[sold16]
    fad2 red'~
    \tuplet 3/2 { red8 fad (mi) } red8.[dod16] \tuplet 3/2 { si8 red (dod) } si8. [la16]

    %32
    sold2 mi'~
    mi4 lad, lad lad
    si2 r

    %35
    red, red16(si8.) fad'16(red8.)
    mi2 mi16(si8.) sold'16(mi8.)
    red2 red16(si8.) fad'16(red8.)\mbreak

    %38
    mi2 mi16(si8.) sold'16(mi8.)
    red4 red fad red
    mi2 r

    %41
    r4 si'\tu\f mi sold
    dod dod, fad8 sold mi fad
    red fad, mi red mi4 mi'

    %44
    mi2 red
    mi4\p mi, mi mi \mbreak
    mi mi mi mi

    %47
    mi mi mi mi
    red  si'8\soli\mp fad si,4 r
    r sold'8 mi si4 r

    %50
    r la'8 fad si,4 r
    mi8\f fad sold la si dod red mi\mbreak
    mi, sold fad mi si'2~

    %53
    si8 sold fad mi la2~
    la8 dod si la sold sold' fad mi
    red4 mi \grace fad8 mi4 red

    %56
    r sold,(fad) si,
    r sold'(fad) si,\mbreak
    r sold' (fad) si,

    %59
    r sold'(la) fad
    <mi' si mi,>1
    sold1\soli

    %62
    la
    sold4 sold8 si la4 sold8 fad
    mi1~

    %65
    mi~
    mi~
    mi2. fad4

    %68
    mi8 mi, fad sold\mbreak la si dod red
    mi4 si\p si si
    lad lad dod dod

    %71
    fad,\tu re'(dod) dod,
    r si'(lad) fad
    r re'(dod) dod,

    %74
    r si'(lad) fad
    fad r r2\mbreak
    sold4 sold sold sold

    %77
    sold sold sold sold
    sold mi mi mi
    mi1~

    %80
    mi~
    mi2 mi'\f~
    mi8 re dod si la sol fad mi

    %83
    re4 la'\p si si
    dod dod la la
    \grace si8 la4 sold?\f sold8 fad mi re\mbreak

    %86
    dod4\f dod dod dod
    mi mi dod2
    mi'1

    %89
    sold2 si8 sold fad8. mi16
    si8(mi sold8.) sold16 si,8(mi sold8.) sold16
    la4 dod, fad8 (mi re dod)

    %92
    re4 re8. mi16 fad4 mi8. re16
    dod4 re8. si16 la4 si8. sold16
    dod,2 la'\soli~

    %95
    la dod
    si1~
    si8 sold fad8. mi16 si'8(mi sold8.) sold16

    %98
    la4 dod,8 re mi4 mi
    \grace fad8 mi4 re8 mi fad2~
    \tuplet 3/2 { fad8 la (sold) } fad8. [mi16] \tuplet 3/2 { re8 fad (mi) } re8. [dod16]

    %101
    si4 mi, sold sold'~
    \tuplet 3/2 { sold8 si (la) } sold8.[fad16] \tuplet 3/2 { mi8  sold (fad) } mi8.[re16]
    dod4 dod dod la

    %104
    la sold fad red'
    mi8 sold fad mi red dod si la
    sold2 sold'\mbreak

    %107
    la4 la8. dod16 dod2
    dod4 si8 la sold4 la
    la sold8 si mi,4 r

    %110
    r re'8 si mi,2
    r4 dod'8 la mi2
    r4 re'8 si mi,2

    %113
    r4 dod'8 la mi2
    R1
    fad,2 \grace mi8 re4 \grace dod8 si4\mbreak

    %116
    si la r2
    mi'2 \grace re8 dod4 \grace si8 la4
    mi'8 si' sold si mi si sold si

    %119
    mi,4 mi mi mi
    mi8 si' sold si mi si sold si
    mi,2. la,4

    %122
    sold2. si'4\mbreak
    mi,2 r4 la,
    sold2 r4 si'\tu\f

    %125
    dod8 mi re dod si la sold fad
    mi1\soli\p ~
    mi2 re

    %128
    do1
    si4 si' si si
    dod re r sold,

    %131
    la la fad fad\mbreak
    mi la la la
    la\tu\f la sold sold

    %134
    la la la la
    la la la la
    la la la sol

    %137
    fad8 sol la sol la fad mi re
    fad sol la sol la fad mi re\mbreak
    dod4 sold'! la la

    %140
    la2 sold
    la4 dod, re r
    r dod re r

    %143
    r dod re r
    r dod re si
    <la' mi dod>1

}


Ivlan =\relative do' {

    dod4 dod dod dod
    mi mi dod dod
    si si si si

    %4
    mi mi mi mi\mbreak
    sold si sold mi
    mi mi la, la

    %7
    la la la si
    dod2 mi~
    mi la~

    %10
    la dod
    si4 sold sold sold,
    si si sold sold\mbreak

    %13
    la2 fad'
    si, r
    R1*12

    %27
    r2 r4 mi\p
    mi2 r
    r r4 fad

    %30
    fad,2 r
    r r4 sold'
    sold,2 r

    %33
    r r4 fad'
    fad2 r\mbreak
    r4 red fad red

    %36
    r sold, si sold
    r red' fad red
    r sold, si sold

    %39
    si2 r
    r4 sold'\f sold si
    mi,8 mi' red dod si la sold fad

    %42 OOKK
    mi4  la la la
    la sold8 fad sold4 la8 sold
    fad2 si,

    %45
    si1\p~
    si~
    si

    %48
    fad'4 fad fad si,
    si1~
    si~

    %51
    si~
    si2 r4 mi\mbreak
    mi mi fad mi

    %54
    red fad mi sold
    fad si, fad' si
    sold2 r4 si,

    %57
    si2 r4 si
    si2 r4 si
    si2 r4 si

    %60
    si1\mbreak
    r4 si\p mi mi,
    r dod' mi mi,

    %63
    r mi' mi, mi
    mi2 r
    R1*6

    %71
    r2 r4 fad'
    fad r r fad
    fad r r fad

    %74
    fad r r fad
    fad r r2\mbreak
    R1*10

    %86
    mi,2\f la'~
    la dod
    si4 sold sold mi

    %89
    mi sold sold si
    la mi r mi
    mi dod la la

    %92
    la2. si4
    dod2 mi~
    mi4 mi dod la\mbreak

    %95
    mi' mi, r mi'~
    mi sold si mi,
    sold si sold mi

    %98
    mi2. la,4
    la2. la'4
    fad re si2

    %101
    r r4 si'
    sold mi dod2\mbreak
    r4 fad fad fad

    %104
    fad mi red si
    si mi si sold
    mi2 r

    %107
    r4 mi'\p dod la
    r la si la
    mi'2 mi,

    %110
    r4 mi' sold mi\mbreak
    r la, dod la
    r mi' sold mi

    %113
    la mi dod la
    la2 r
    R1*6

    %121
    r4 mi' mi r
    r mi, mi r
    r mi' mi r

    %124
    r mi, mi r\mbreak
    r mi' fad fad
    si,2  sold\p

    %127
    la si
    mi, fad
    sold r

    %130
    R1*3
    r4 mi'\f mi mi
    mi1~

    %135
    mi~
    mi~
    mi2 re4 dod

    %138
    si2 la~\mbreak
    la4 si dod re8 dod
    si4 mi mi re

    %141
    dod la si mi,
    r la si mi,
    r la si mi,

    %144
    r la si mi,
    mi1

}


Ivcn =\relative do {

    la4 la la la
    la la la la
    mi' mi mi mi

    %4
    mi mi mi mi
    mi mi mi mi
    la, la la la

    %7
    re re re re\mbreak
    mi mi mi mi
    la la la la

    %10
    la, la la la
    mi' mi mi mi
    mi mi mi mi

    %13
    la, la red red
    mi mi mi mi
    mi mi mi mi

    %16
    mi mi mi mi\mbreak
    mi mi mi mi
    mi2 mi4 fad

    %19
    sold sold sold sold
    la sold fad mi
    sold sold sold sold

    %22
    la sold fad mi
    red red red red
    mi mi mi mi

    %25
    red red red red
    mi mi mi mi
    sold, sold sold sold\mbreak
    la la la la

    %29
    la la la la
    si si si si
    si si si si

    %32
    dod dod dod dod
    fad fad fad fad
    si,2 r

    %35
    si4 si si si
    si si si si
    si si si si

    %38
    si si si si\mbreak
    si si si si
    mi2 r

    %41
    sold,4 sold sold sold
    la la la la
    si si si si

    %44
    si si si si
    mi mi mi mi
    dod dod dod dod
    sold sold sold' sold

    %48
    fad si, si si
    si si si si\mbreak
    si si si si

    %51
    mi mi mi mi
    sold, \f sold sold sold
    la la la la

    %54
    si si si si
    si si si si
    mi4 r si r

    %57
    mi r si r
    mi, r si' r
    mi r si  r

    %60
    mi si mi,2
    mi'4\p mi mi mi
    mi mi mi mi

    %63
    mi mi mi mi
    mi mi mi mi
    sold mi la mi

    %66
    sold mi la mi
    sold mi la red,
    mi mi mi mi

    %69
    mi mi mi mi
    mi mi mi mi
    re? re lad lad

    %72
    si si fad' fad\mbreak
    re re lad lad
    si si fad' fad

    %75
    re si r2
    mi4 mi mi mi
    mi mi mi mi

    %78
    mi mi mi mi
    la mi sold mi
    la mi sold mi

    %81
    la la la, la
    dod dod dod dod
    re re re re

    %84
    red red red red\mbreak
    mi mi mi8 re dod si
    la4\f la la la

    %87
    la la la la
    mi' mi mi mi
    mi mi mi mi

    %90
    mi mi mi mi
    la, la la la
    re re re re

    %93
    mi mi mi mi
    la, la la\p la\mbreak
    la la la la

    %96
    mi' mi mi mi
    mi mi mi mi
    la, la dod dod

    %99
    re re re re
    re re re re
    mi mi mi mi

    %102
    mi mi mi mi
    fad fad fad fad\mbreak
    si, si si si

    %105
    mi mi' si sold
    mi\p mi mi mi
    mi mi mi mi

    %108
    mi mi mi mi
    mi mi mi mi\mbreak
    mi mi mi mi

    %111
    mi mi mi mi
    mi mi mi mi
    la, la dod dod

    %114
    re re re re
    re re re re
    dod dod dod dod

    %117
    dod dod dod dod
    sold sold sold sold
    la la dod dod

    %120
    sold sold sold sold
    la la dod dod\mbreak
    si si sold sold

    %123
    la la dod dod
    si si sold sold
    la\f la red red

    %126
    mi mi mi mi
    mi mi mi mi
    mi mi mi mi

    %129
    mi mi mi mi
    mi mi mi mi
    la, la re re

    %132
    mi mi mi mi
    mi, mi\f mi mi
    la la' la la

    %135
    fad fad fad fad
    dod dod dod dod
    re re re re

    %138
    re re re re
    mi mi mi mi
    mi, mi mi mi

    %141
    la r mi' r
    la, r mi r
    la r mi' r

    %144
    la, r mi r
    la1

}


IvlIripn =\relative do'' {

    la1
    dod2 mi8 dod (si la)
    sold[(si mi8.) mi16] mi8[(sold si8. )si16]

    %4
    si1
    re,\mbreak
    dod8(si la) mi' re (dod si) la

    %7
    fad'4 fad8. sold16 la4 sold8. fad16
    \grace fad8 mi4. re8 \grace re8 dod4. si8
    dod2 r

    %10
    R1*8
    sold8\f si dod si sold si red fad
    mi4 mi, r2

    %20
    R1*7
    r2 r4 si''\p
    si la r2

    %29
    r r4 dod
    dod si r2\mbreak
    r r4 red

    %32
    red dod r2
    r r4 dod,
    red2 r

    %35
    R1
    r4 mi sold, mi'
    fad,2 r

    %38
    r4 mi' sold, mi'
    fad,2 r
    r4 si\f mi sold

    %41
    si1
    dod, \mbreak
    \afterGrace si {dod16[ red mi fad]}

    %44
    fad1\tr
    sold\p~
    sold~

    %47
    sold\mbreak
    la2 red,
    mi1

    %50
    red
    mi
    re!\f

    %53
    dod
    \afterGrace si {dod16[ red mi fad]}
    fad1\tr

    %56
    mi4 r r red\p
    mi2 r4 red
    mi2 r4 red

    %59
    mi2 \f r4 red,
    mi1
    r4 sold\p si sold

    %62
    r dod mi dod\mbreak
    r si dod dod,
    sold'2 r

    %65
    R1*6
    r4 fad'\p(mi) mi,
    r re'(dod) dod,

    %73
    r fad'(mi) mi,
    r re'(dod) dod,
    R1*11

    %86
    la'1\f
    dod2 mi8 dod (si la)

    %88
    sold[(si mi8.) mi16] mi8[(sold si8.) si16]
    si1
    re,

    %91
    dod8(si la) mi' re (dod si la)
    fad'4 fad8. sold16 la4 sold8. fad16\mbreak
    \grace fad8 mi4. re8 \grace re dod4. si8

    %94
    la2 r
    R1*4
    r4 la\p la r\mbreak

    %100
    r fad fad r
    r si si r
    r sold sold r

    %103
    r dod, dod r
    r si si fad'
    sold2 r

    %106
    r4 si re si
    dod1~
    dod2 r

    %109
    r4 mi dod la\mbreak
    sold1
    la

    %112
    sold
    la2 la,
    R1*7

    %121
    r4 la la r
    r si si r
    r dod dod r

    %124
    r si si r
    dod'8\f mi re dod si la sold fad\mbreak
    mi2 r

    %127
    R1*6
    r4 si'\f si si
    dod8 re mi re mi dod (si la)

    %135
    dod re mi re mi dod si la
    dod re mi re mi dod (si la)
    r4 fad' fad, r\mbreak

    %138
    r fad' fad, r
    r mi' mi, r
    r si' si si

    %141
    la r r sold,
    la r r si
    dod r r sold

    %144
    la r r si
    <la' mi dod>1

}


IvlIIripn =\relative do'' {

    R1*2
    mi1
    sold2 si8 sold (fad mi)

    %5
    si(mi sold8.) sold16 si,8(mi sold8.) sold16
    la4. sol8 fad(mi) re(dod)\mbreak
    \grace mi8 re4 re8. mi16 \grace sold8 fad4 mi8. re16

    %8
    dod4 re8.(si16) la4 si8. sold16
    la4 la, r2
    R1*8

    %18
    sold'8\f si dod si sold si red fad
    mi4 mi, r2

    %20
    R1*7
    r2 r4 si'\p
    dod2 r

    %29
    r r4 dod\mbreak
    red2 r
    r r4 red

    %32
    mi2 r
    r r4 lad,
    si2 r

    %35
    r4 fad red fad
    sold r r2
    r4 fad red fad

    %38
    sold2 r4 sold
    la2 r
    R1

    %41
    r4 si\f mi sold\mbreak
    dod dod, fad8 sold mi fad
    red fad, mi red mi4 mi'

    %44
    mi2 red
    mi1\p~
    mi~

    %47
    mi
    fad2 la,
    sold1

    %50
    la
    sold8\f fad sold la si dod red mi
    mi, sold fad mi si'2~\mbreak

    %53
    si8 sold fad mi la2~
    la8 dod si la sold sold' fad mi
    red4 mi \grace fad8 mi4 red

    %56
    mi2 r4 si\p
    sold mi r si'
    sold mi r si'

    %59
    sold\f mi fad si
    sold1
    r4 mi\p sold mi

    %62
    r la dod la
    r sold la la,
    si2 r

    %65
    R1*6
    r4 re'\p(dod) fad,
    r si(lad) fad

    %73
    r4 re'(dod) fad,
    r si(lad) fad
    R1*10\mbreak

    %85
    r4 sold\f sold8 fad mi re
    dod4 dod dod dod
    mi mi dod2

    %88
    mi'1
    sold2 si8 sold fad8. mi16
    si8(mi sold8.) sold16 si,8(mi sold8.) sold16
    la4 dod, fad8 (mi re dod)

    %92
    re4 re8. mi16 fad4 mi8. re16
    dod4 re8. si16 la4 si8. sold16
    dod,2 r

    %95
    R1*4
    r4 fad\p fad r
    r si, si r

    %101
    r sold' sold r
    r dod, dod r
    r la' la r

    %104
    r sold fad red'
    mi2 r
    r4 sold, si sold\mbreak

    %107
    la1~
    la2 r
    r4 mi' dod la

    %110
    si,1
    dod
    si

    %113
    dod
    R1*7
    r4 dod dod r

    %122
    r sold sold r
    r la la r
    r mi' mi r

    %125
    dod'8\f mi re dod si la sold fad\mbreak
    mi2 r
    R1*6

    %133
    r4 sold\f sold sold
    la la,2 la'4~
    la la,2 la'4~

    %136
    la la,2 la'4
    fad8 sol la sol la fad mi re
    fad sol la sol la fad mi re\mbreak
    dod4 sold'! la la

    %140
    la2 sold
    la4 r r si,
    dod r r sold

    %143
    la r r si
    dod r r sold
    la1

}

Ibcn =\relative do {

    la4 la la la
    la la la la
    mi' mi mi mi

    %4
    mi mi mi mi
    mi mi mi mi
    la, la la la

    %7
    re re re re\mbreak
    mi mi mi mi
    la,2 r

    %10
    R1*17
    sold4 sold sold sold
    la la la la

    %29
    la la la la
    si si si si
    si si si si

    %32
    dod dod dod dod
    fad fad fad fad
    si,2 r

    %35
    R1*6\mbreak
    sold4 sold sold sold
    la la la la

    %43
    si si si si
    si si si si
    mi1

    %46
    dod
    sold
    fad2 r

    %49
    R1*3
    sold4 \f sold sold sold
    la la la la

    %54
    si si si si
    si si si si
    mi4 r si r

    %57
    mi, r si' r
    mi r si' r
    mi, r si r

    %60
    mi,1
    mi'2 r
    mi r

    %63
    mi r
    R1*22\mbreak
    la,4\f la la la

    %87
    la la la la
    mi' mi mi mi
    mi mi mi mi

    %90
    mi mi mi mi
    la, la la la
    re re re re

    %93
    mi mi mi mi
    la, la la\p la\mbreak
    la la la la

    %96
    mi' mi mi mi
    mi mi mi mi
    la, la dod dod

    %99
    re re re re
    re re re re
    mi mi mi mi

    %102
    mi mi mi mi
    fad fad fad fad\mbreak
    si, si si si

    %105
    mi mi' si sold
    mi2\p r
    mi1~

    %108
    mi2 r
    R1
    mi~

    %111
    mi~
    mi
    la,2 r

    %114
    R1*19
    r4 mi'\f mi mi,\mbreak
    la1

    %135
    fad'
    dod
    re4 re re re

    %138
    re re re re
    mi mi mi mi
    mi, mi mi mi

    %141
    la r mi' r
    la r mi r\mbreak
    la, r mi r

    %144
    la r mi' r
    la,1

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*4
    <7>1
    s
    s<6 4>2 <5 3>
    s1*18
    <6>1
    s
    <6>
    <_+>
    <6>
    s
    <7 _+>
    <_+>
    s1*6
    <6>1
    s2 <6>
    <_+> <6 4>
    <5 4> <_+>
    s1
    <7>
    <6>
    <6\\>
    s1*3
    <6 5!>1
    <9>2 <8>
    <7 _+> <6 4>
    <5 4> s4 <_+>
    s2 <_+>
    s <_+>
    s <_+>
    s <_+>
    s1
    s
    <6 4>
    <5 3>
    s1*26
    <7>1
    s
    <9>2 <8>
    <6 4> <5 3>
    s1*3
    <7>1
    s2 <6>
    <9> <8>
    <6>1
    s
    <6>
    s
    <7 _+>4 <6 4> <5 4> <_+>
    s1
    s
    <6 4>
    s
    s
    <7 5>
    <6 4>
    <7 5 3>
    s1*22
    <7>1
    <6>
    <6 5>
    s
    <6 4>
    <5 3>

}

forma = {

    \time 2/2
    \key la\major
    \tempo 2 = 67
    s1*60
    \bar ":..:"\break
    s1*85
    \bar ":|."

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


IvlIrip = {
    \Iglobal
    <<\IvlIripn \forma>>
}


IvlIIrip = {
    \Iglobal
    <<\IvlIIripn \forma>>
}


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \con
}

IIvlIn =\relative do'' {

    fad8(re) la'4. si8
    red,(fad) mi4 r
    mi8 la, sol'4. la8

    %4
    \tuplet 3/2 { dod, re mi } re2
    re,2.
    mi4 sol dod

    %7
    re8 fad la la la si
    \grace re, dod8. si16 la4 r8 re'
    re4 fad, sold

    %10
    \tuplet 3/2 { la8 dod si la dod si } la4
    re,2.
    dod

    %13
    \tuplet 3/2 {
        fad8 la fad sold si sold la mi dod
        si re si dod mi dod la si dod
        si dod re
    } la4 sold

    %16
    la8\soli mi'(re do si la)
    mi'4 r r
    r8 mi(re do si la)

    %19
    la'4 r r
    r8 sold la sold la red,\mbreak
    \tuplet 3/2 { mi si' sold }  mi4 re

    %22
    dod r mi\tu
    \tuplet 3/2 {
        fad8 la fad sold si sold la mi dod
        si re si dod mi dod la si dod
        si dod re
    } la4 sold

    %26
    la2.
    dod8\soli si la dod re mi
    mi re dod mi fad sol

    %29
    sol fad la4. fad8\mbreak
    mi la sold si la4~
    la \tuplet 3/2 { dod,8 re mi } \grace mi re8. dod16

    %32
    re8 la' sold si la4~
    la \tuplet 3/2 { re,8 mi fad } \grace fad mi8. re16
    mi8 la sold si la4~

    %35
    la \tuplet 3/2 { mi8 fad sol } \grace sol fad8.\tr mi16
    fad2 r4
    sol sol16 la si8 si si

    %38
    \grace si la4 fad16 sol la8 la la\mbreak
    \grace la sol4 sol16 fad mi8 mi mi
    \grace mi re4 si16 dod re8 re re

    %41
    \grace re dod4 dod16 re mi8 mi mi
    \grace fad mi4 sol16 fad mi8 mi mi
    \grace mi re4 fad16 mi re8 re re

    %44
    dod4 mi16 fad sol8 \grace la sol4
    fad\tu la4. si8
    red,(fad) mi4 r\mbreak

    %47
    mi8 la, sol'4. la8
    dod, (mi) re4 r
    mi,2.

    %50
    fad8[(la re fad la8.) la16]
    \tuplet 3/2 { si8 sol mi } re4 dod
    re8\soli la(sol fa mi re)

    %53
    la'4 r r
    r8 la(sol fa mi re)
    fa4 r r\mbreak

    %56
    r8 dod'(re dod re) sold,
    \tuplet 3/2 { la mi'dod } la4 sol
    fad r la\tu

    %59
    \tuplet 3/2 {
        si8 re si dod mi dod re la fad
        mi sol mi fad la fad \once\stemUp re la'' fad
        mi sol mi
    } re4 dod

    %62
    re2.

}


IIvlIIn =\relative do'' {

    la8.[re16 fad8. la16] la,4
    la la la
    la8.[dod16 mi8. sol16] la,4

    %4
    r re8 dod re si
    la4 sol fad
    dod mi sol

    %7
    fad8 la re4 si
    mi, dod'8.[si16 la8. sol'16]
    fad2 si,4\mbreak

    %10
    \tuplet 3/2 { dod8 mi re dod mi re } dod4
    r fad, sold
    \tuplet 3/2 { la8 dod si la dod si } la4

    %13
    r re mi
    r mi, mi
    \tuplet 3/2 { re8 mi fad } dod4 si\tr

    %16
    la r r
    r8 mi''\soli(re do si la)
    fa'4 r r\mbreak

    %19
    r8 mi(re do si la)
    red4 r r
    mi si sold

    %22
    \tuplet 3/2 { la8 mi' dod } la4 sol!
    r re'\tu mi
    r mi, mi

    %25
    \tuplet 3/2 { re8 mi fad } dod4 si
    la8 fad' mi re dod si
    la4 r r\mbreak

    %28
    dod'8\soli si la dod re mi
    mi re fad4. re8
    dod4 dod,\tu\p dod

    %31
    dod dod dod
    si\fp  re re
    re re re

    %34
    dod\fp mi mi
    mi mi mi
    \tuplet 3/2 { re8\soli\f do' si }\grace re do2\tr

    %37
    \tuplet 3/2 { re,8 si' la } si2\tr\mbreak
    \tuplet 3/2 { fad8 fad' mi } fad2
    \tuplet 3/2 { si,8 sol' fad } \grace la4 sol2

    %40
    \tuplet 3/2 { mi,8 si' la } si2\tr
    \tuplet 3/2 { mi,8 dod' si } dod2
    \tuplet 3/2 { la8 sol' fad }\grace la4 sol2

    %43
    \tuplet 3/2 { la,8 fad' mi } fad2
    \tuplet 3/2 { la,8 mi' re } mi4 dod
    la8.\tu[re16 fad8. la16] la,4\mbreak

    %46
    la la la
    la8.[dod16 mi8. sol16] la,4
    r re,8.[dod16 re8. si16]

    %49
    la4 la la
    la r fad''
    \tuplet 3/2 { sol8 si, sol } fad4 mi

    %52
    re r r
    r8 la'\soli(sol fa mi re)\mbreak
    sib'4 r r

    %55
    r8 la(sol fa mi re)
    sold4 r r
    la mi dod

    %58
    \tuplet 3/2 {\once\stemUp re8 la'' fad } re4 do\f
    si sol la
    r la la

    %61
    si8 sol fad4 mi
    re2.

}


IIvlan =\relative do' {

    re2 fad,4
    la2 r4
    r la dod

    %4
    fad fad sol
    r mi la,
    la2 mi'4

    %7
    re2.
    dod8. re16 mi4 r\mbreak
    r la si

    %10
    mi,2 mi4
    r re mi
    mi2 dod4

    %13
    la si la
    mi'2 r4
    r mi mi

    %16
    mi2 r4\mbreak
    do\p do do
    re re re

    %19
    mi mi mi
    fa fa fa
    mi2 mi4

    %22
    mi2 dod?4\f
    la si la\mbreak
    mi'2 r4

    %25
    r mi mi
    mi8 fad mi re dod si
    la4 r r

    %28
    la r r
    r la la\mbreak
    la r r

    %31
    R2.
    si4 r r
    R2.

    %34
    dod4 r r
    R2.
    r4 fad\p fad

    %37
    sol sol sol
    si, si si\mbreak
    si si si

    %40
    si mi mi
    mi mi mi
    mi la, la

    %43
    la la fad'
    mi mi mi
    re2\f fad,4

    %46
    la2 r4\mbreak
    r la dod
    fad,2 sol4

    %49
    r mi' la,
    la2 re4
    r la la

    %52
    la2 r4
    fa\p fa fa
    sol sol sol

    %55
    la la la\mbreak
    sib sib sib
    la2 la4

    %58
    la2 re4\f
    re mi re
    la2 r4

    %61
    r la la
    la2.

}


IIvcn =\relative do {

    re4 re, re'
    dod dod8.[re16 dod8. re16]
    dod4 dod,  dod'

    %4
    si si'8.[la16 si8. sol16]\mbreak
    fad4 mi re
    la r la'

    %7
    si fad sol
    la la,8.[sol'16 fad8. mi16]
    re'4 re, re

    %10
    dod dod dod
    r si mi
    la, dod la

    %13
    re si dod\mbreak
    sold la dod
    re mi mi,

    %16
    la la' la
    do,\p do do
    re re re

    %19
    mi mi mi\mbreak
    fa fa fa
    mi sold mi
    la, dod la\f

    %23
    re si dod
    sold la dod
    re mi mi,

    %26
    la8 fad' mi re dod si
    la4 r r
    R2.*2
    la4 r r

    %31
    R2.\mbreak
    si4 r r
    R2.

    %34
    dod4 r r
    R2.
    re4 re\p re

    %37
    sol, sol sol
    red' red red
    mi mi mi

    %40
    sold, sold sold
    la la la
    dod dod dod

    %43
    re2 r4
    la2 r4\mbreak
    re4\f re, re'
    dod dod8.[re16 dod8. re16]

    %47
    dod4 dod' dod,
    si si' si,
    r dod la\mbreak

    %50
    re fad re
    sol la la,
    re2 r4

    %53
    fa,\p fa fa
    sol sol sol
    la la la\mbreak

    %56
    sib sib sib
    la dod la
    re fad re\f
    sol mi fad

    %60
    dod re fad
    sol la la,
    re2.

}


IIvlIripn =\relative do'' {

    fad8(re) la'4. si8
    red,(fad) mi4 r
    mi8 la, sol'4. la8

    %4
    \tuplet 3/2 { dod, re mi } re2
    re,2.
    mi4 sol dod

    %7
    re8 fad la la la si
    \grace re, dod8. si16 la4 r8 re'
    re4 fad, sold

    %10
    \tuplet 3/2 { la8 dod si la dod si } la4
    re,2.
    dod

    %13
    \tuplet 3/2 {
        fad8 la fad sold si sold la mi dod
        si re si dod mi dod la si dod
        si dod re
    } la4 sold

    %16
    la'2.\p~
    la~
    la~\mbreak

    %19
    la~
    la2 r4
    R2.

    %22
    r4 r mi\f
    fad sold \tuplet 3/2 {
        la8 mi dod
        si re si dod mi dod la si dod

        %25
        si dod re
    } la4 sold
    la8 fad mi re dod si\mbreak
    la4 r r

    %28
    la r r
    r la'\p la
    la la, la

    %31
    la la la
    si\fp si si
    si si si

    %34
    dod\fp dod dod\mbreak
    dod dod dod
    re r r

    %37
    R2.*8
    fad'4\f la4. si8
    red,(fad) mi4 r\mbreak

    %47
    mi sol4. la8
    dod, (mi) re4 r
    mi,2.

    %50
    fad8[(la re fad la8.) la16]
    \tuplet 3/2 { si8 sol mi } re4 dod
    re'2.\p~

    %53
    re~
    re~
    re~

    %56
    re2 r4
    R2.
    r4 r la,\f\mbreak

    %59
    \tuplet 3/2 {
        si8 re si dod mi dod re la fad
        mi sol mi fad la fad \once\stemUp re la'' fad
        mi sol mi
    } re4 dod

    %62
    re2.

}


IIvlIIripn =\relative do'' {

    la8.[re16 fad8. la16] la,4
    la la la
    la8.[dod16 mi8. sol16] la,4

    %4
    r re8 dod re si
    la4 sol fad
    dod mi sol

    %7
    fad8 la re4 si
    mi, dod'8.[si16 la8. sol'16]
    fad2 si,4\mbreak

    %10
    \tuplet 3/2 { dod8 mi re dod mi re } dod4
    r fad, sold
    \tuplet 3/2 { la8 dod si la dod si } la4

    %13
    r re mi
    r mi, mi
    \tuplet 3/2 { re8 mi fad } dod4 si\tr

    %16
    la'2.\p~
    la~
    la~\mbreak

    %19
    la~
    la2 r4
    R2.

    %22
    r4 r dod\f
    re re mi
    r mi, mi

    %25
    \tuplet 3/2 { re8 mi fad } dod4 si
    la8 fad' mi re dod si
    la4 r r

    %28
    la r  r
    r la'\p la
    la la, la\mbreak

    %31
    la la la
    si\fp si si
    si si si

    %34
    dod\fp dod dod\mbreak
    dod dod dod
    re r r

    %37
    R2.*8
    la'8.\f[re16 fad8. la16] la,4

    %46
    la la la
    la8.[dod16 mi8. sol16] la,4
    r re,8.[dod16 re8. si16]\mbreak

    %49
    la4 la la
    la r fad''
    sol8. sol,16 fad4 mi

    %52
    re'2.\p~
    re~
    re~

    %55
    re~
    re2 r4
    R2.

    %58
    r4 r fad,\f
    sol sol la
    r la la

    %61
    si8 sol fad4 mi
    re2.

}

IIbcn =\relative do {

    re4 re, re'
    dod dod8.[re16 dod8. re16]
    dod4 dod,  dod'

    %4
    si si'8.[la16 si8. sol16]\mbreak
    fad4 mi re
    la r la'

    %7
    si fad sol
    la la,8.[sol'16 fad8. mi16]
    re'4 re, re

    %10
    dod dod dod
    r si mi
    la, dod la

    %13
    re si dod\mbreak
    sold la dod
    re mi mi,

    %16
    la r r
    R2.*5
    r4 r la

    %23
    re si dod
    sold la dod
    re mi mi,

    %26
    la2 r4
    R2.*3
    la4 r r

    %31
    R2.\mbreak
    si4 r r
    R2.

    %34
    dod4 r r
    R2.
    re4 r r

    %37
    R2.*8
    re4 re, re'
    dod dod8.[re16 dod8. re16]

    %47
    dod4 dod,  dod'
    si si' si,
    r dod la\mbreak

    %50
    re fad re
    sol la la,
    re r r

    %53
    R2.*5
    r4 r re
    sol mi fad

    %60
    dod re fad
    sol la la,
    re2.

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6>
    s
    <7>4 <6>2
    <6>2.
    s
    s4 <6>2
    s2.
    s2 <4\+ 2>4
    <6>2.
    s4 <7> <7 _+>
    s <6> s
    s <6\\> <6>
    <6> s <6>
    <6> <6 4> <5 _+>
    s2.*7
    s4 <6\\> <6>
    <6> s <6>
    <6> <6 4> <5 _+>
    s2.*6
    <7>2.
    s
    <6>
    s2.*11
    <6>2.
    s
    <7>4 s <6>
    s <6> s
    s <6> s
    <6> <6 4> <5 3>
    s2.*7
    s4 <6> <6>
    <6> s <6>
    <6> <6 4> <5 3>

}

forma = {

    \time 3/4
    \key re\major
    \tempo 2 = 40
    s2.*62
    \bar "|."

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


IIvc = {
    \IIglobal
    \clef bass
    <<\IIvcn \forma>>
}


IIvlIrip = {
    \IIglobal
    <<\IIvlIripn \forma>>
}


IIvlIIrip = {
    \IIglobal
    <<\IIvlIIripn \forma>>
}


IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto\con
}

IIIvlIn =\relative do'' {

    la'2 mi4
    dod8 la sold si re sold
    \grace sold4 la2 mi4

    %4
    dod8 la sold si re sold
    \grace sold4 la2 mi4
    re8(fad) si,4 r8 re

    %7
    dod(mi) la,4 r8 si
    \tuplet 3/2 { dod re mi } \grace mi re4. dod8
    \tuplet 3/2 {
        si dod re dod mi dod la si dod
        si dod re dod mi dod la si dod
    }\mbreak

    %11
    \grace re8 dod4\tr si r
    si'2\soli dod8. la16
    si4 mi2

    %14
    si dod8. la16
    si4 mi2
    si16 dod re8 re re re re

    %17
    re(dod) dod(si) si(la)
    \tuplet 3/2 { sold la si } mi,4 red
    mi r \tuplet 3/2 {
        si'8 sold mi

        %20
        la fad red
    } si4 \tuplet 3/2 {
        la'8 sold fad\mbreak
        si sold mi
    } si4 \tuplet 3/2 {
        si'8 sold mi
        la fad red
    } si4 \tuplet 3/2 { la'8 sold fad }

    %23
    sold2 si8.\tu red,16
    red?4(mi) \tuplet 3/2 {
        si8 dod re!
        dod si la sold fad mi
    } fad8. red'16

    %26
    red?4 mi \tuplet 3/2 {
        si8 dod re!
        dod si la sold fad mi
    } fad8. red'16
    <mi si mi,>2.

    %29
    mi4\soli fad red
    sold la fad
    si8 sold (fad mi red) fad

    %32
    mi2 r8 mi
    re fad si,4. re8
    dod mi la,4. la'8

    %35
    la16 sold fad mi re4 dod
    si8(mi red fad) mi sol
    lad, sol'(fad mi re dod)

    %38
    re dod si dod re4~
    re8 si' sold? re dod si\mbreak
    dod si la4 mi'

    %41
    \tuplet 3/2 { fad8 la sold fad mi re dod si la }
    sold fad mi4 r
    la'2\tu mi4-!

    %44
    dod8 la sold si re sold
    \grace sold4 la2 mi4
    dod8 la sold si re sold

    %47
    la2.
    sol
    \tuplet 3/2 { fad8 mi re} dod4 si

    %50
    la2 \tuplet 3/2 {
        mi'8\soli dod la
        re si sold
    } mi4 \tuplet 3/2 {
        re'8 dod si\mbreak
        mi dod la
    } mi4 \tuplet 3/2 {
        mi'8 dod la

        %53
        re si sold
    } mi4 \tuplet 3/2 { re'8 dod si }
    \grace si4 dod2  mi8.\tu sol16
    \tuplet 3/2 { fad8 mi re dod si la } si8. sold'!16

    %56
    \grace sold8 la2 mi8. sol!16
    \tuplet 3/2 { fad8 mi re dod si la } si8. sold16
    <la mi la,>2.

}


IIIvlIIn =\relative do'' {

    dod4 mi sold,
    la si8 sold si mi
    mi fad mi4 sold,

    %4
    la  si8 sold si mi
    mi fad mi4 dod
    si sold sold

    %7
    la dod,8 mi sold si
    \tuplet 3/2 { la si dod } \grace dod si4. la8\mbreak
    sold4 la fad

    %10
    sold la fad8 la
    \grace si8 la4 sold8 dod si la
    sold\soli si sold si la dod

    %13
    sold si sold si mi si
    sold si sold si la dod
    sold si sold si mi sold,\mbreak

    %16
    sold'16 la si8 si si si si
    si (la) la (sold) sold (fad)
    \tuplet 3/2 { mi fad sold } sold,4 fad

    %19
    sold8 la si4 sold\p
    red fad red
    mi sold mi

    %22
    red fad red
    mi8. si'16 sold4 la\tu\f
    si8 la si4 sold

    %25
    \tuplet 3/2 { la8 sold fad mi red dod } si8. la'16
    la4 sold si
    \tuplet 3/2 { la8 sold fad mi red dod } si8. la16

    %28
    sold2.
    R
    mi''4\soli fad red

    %31
    sold la fad
    sold sold, la
    si si si\mbreak

    %34
    mi, dod' mi
    fad16 mi re dod si4 la
    sold r dod\p

    %37
    dod lad lad
    si fad fad
    sold sold sold

    %40
    \tuplet 3/2 { la8\f mi' re dod si la sol fad mi }
    re4 si'\p si
    si8 la sold! fad mi re\mbreak

    %43
    dod4 mi'\tu\f si
    la si8 sold si mi
    mi fad mi4 sold,

    %46
    la si8 sold si mi
    mi fad mi dod si la
    mi' fad mi dod si dod

    %49
    \tuplet 3/2 { re dod si } la4 sold
    la2 dod4\p
    si sold si

    %52
    dod la dod\mbreak
    si sold si
    la mi dod'8.\f mi16

    %55
    \tuplet 3/2 { re8 dod si } la4 sold8. si16
    mi4~mi8.[la,16 dod8. mi16]
    \tuplet 3/2 { re8 dod si la sold fad  } mi8. re16

    %58
    dod2.

}


IIIvlan =\relative do' {

    mi8 re dod4 si
    \grace re8 dod4 si r
    mi8 re dod4 si

    %4
    \grace re8 dod4 si r
    r la la'
    sold mi r

    %7
    r mi mi\mbreak
    mi fad r
    r mi mi

    %10
    mi mi2
    mi r4
    R2.*7

    %19
    r4 si\p si
    si si si
    si si si

    %22
    si si si\mbreak
    si2 r4
    r mi\f mi

    %25
    fad si, si
    mi, si'' si,
    fad' si, si

    %28
    si2.
    R2.*14
    mi8 re dod4 si

    %44
    \grace re8 dod4 si r
    la8 re mi4 si
    dod si r

    %47
    r la la'
    la la, la
    si dod8 re mi4\mbreak

    %50
    mi2 mi4\p
    mi mi mi
    mi mi mi

    %53
    mi mi mi
    mi mi la\f
    la mi mi,

    %56
    r la la'
    la8 fad mi4 mi
    mi2.

}


IIIvcn =\relative do {

    la4 dod mi
    la, mi' re
    dod8 re dod4 mi

    %4
    la, mi' re
    dod8 re dod4 la
    mi' mi mi

    %7
    la, la' mi
    la, re red
    mi la la,\mbreak

    %10
    mi' la la,
    mi' mi8 la sold fad
    mi4 mi mi

    %13
    mi mi mi
    mi mi mi
    mi mi mi

    %16
    mi r r
    la, r r
    si si si

    %19
    mi8 fad sold4 mi\mbreak
    si si si
    si si si

    %22
    si si si
    mi, mi' fad
    sold8 fad sold4 mi

    %25
    la si si,
    r mi sold,
    la si si

    %28
    mi,2.-!
    mi'4\p la, si
    mi r r

    %31
    mi la, si
    mi mi mi
    sold, sold sold

    %34
    la la' dod,
    re r red
    mi mi mi

    %37
    fad fad fad\mbreak
    si, si si
    mi mi mi

    %40
    la, la' dod,
    re r red
    mi mi8 re dod si

    %43
    la4\f dod mi
    la mi re
    dod8 re dod4 mi

    %46
    la, mi' re
    dod dod dod
    la la la

    %49
    re mi mi,
    la8 si dod4 la
    mi' mi mi

    %52
    mi mi mi
    mi mi mi
    la,4 dod la

    %55
    re mi re
    dod8 si dod4 la
    re mi mi,

    %58
    la2.

}


IIIvlIripn =\relative do'' {

    la'2 mi4
    dod8 la sold si re sold
    \grace sold4 la2 mi4

    %4
    dod8 la sold si re sold
    \grace sold4 la2 mi4
    re8(fad) si,4 r8 re

    %7
    dod(mi) la,4 r8 si
    \tuplet 3/2 { dod re mi } \grace mi re4. dod8
    \tuplet 3/2 {
        si dod re dod mi dod la si dod
        si dod re dod mi dod la si dod
    }\mbreak

    %11
    \grace re8 dod4\tr si r
    R2.*7
    r4 sold\p mi

    %20
    fad red si
    r sold' mi\mbreak
    fad red si

    %23
    mi2 si''8.\f red,16
    red?4(mi) \tuplet 3/2 {
        si8 dod re!
        dod si la sold fad mi
    } fad8. red'16

    %26
    red?4 mi \tuplet 3/2 {
        si8 dod re!
        dod si la sold fad mi
    } fad8. red'16
    <mi si mi,>2.

    %29
    R2.*14
    la2\f mi4

    %44
    dod8 la sold si re sold
    \grace sold4 la2 mi4
    dod8 la sold si re sold

    %47
    la2.
    sol
    \tuplet 3/2 { fad8 mi re} dod4 si

    %50
    la4 dod,\p la\mbreak
    si sold mi'
    r dod la

    %53
    si sold mi'
    la,2 mi''8.\f sol16
    \tuplet 3/2 { fad8 mi re dod si la } si8. sold'!16

    %56
    \grace sold8 la2 mi8. sol!16
    \tuplet 3/2 { fad8 mi re dod si la } si8. sold16
    <la mi la,>2.

}


IIIvlIIripn =\relative do'' {

    dod4 mi sold,
    la si8 sold si mi
    mi fad mi4 sold,

    %4
    la  si8 sold si mi
    mi fad mi4 dod
    si sold sold

    %7
    la dod,8 mi sold si
    \tuplet 3/2 { la si dod } \grace dod si4. la8\mbreak
    sold4 la fad

    %10
    sold la fad8 la
    \grace si la4 sold r
    R2.*7

    %19
    r4 sold\p mi
    fad red si
    r sold' mi

    %22
    fad red si
    mi8. si'16 sold4 la\f
    si8 la si4 sold

    %25
    \tuplet 3/2 { la8 sold fad} mi4 red8. la'16
    la4 sold si
    \tuplet 3/2 { la8 sold fad mi red dod } si8. la16

    %28
    sold2.
    R2.*14

    %43
    dod4 mi'\f si
    la si8 sold si mi
    mi fad mi4 sold,

    %46
    la si8 sold si mi
    mi fad mi dod si la
    mi' fad mi dod si dod

    %49
    \tuplet 3/2 { re dod si } la4 sold
    la4 dod,\p la
    sold mi' r

    %52
    r dod la
    sold mi' r
    la mi dod'8.\f mi16

    %55
    \tuplet 3/2 { re8 dod si } la4 sold8. si16
    mi4~mi8.[la,16 dod8. mi16]
    \tuplet 3/2 { re8 dod si la sold fad  } mi8. re16

    %58
    dod2.

}

IIIbcn =\relative do {

    la4 dod mi
    la, mi' re
    dod8 re dod4 mi

    %4
    la, mi' re
    dod8 re dod4 la
    mi' mi mi

    %7
    la, la' mi
    la, re red
    mi la la,\mbreak

    %10
    mi' la la,
    mi'2 r4
    R2.*11

    %23
    r4 mi fad
    sold8 fad sold4 mi
    la si si,

    %26
    r mi sold,
    la si si
    mi,2.

    %29
    R2.*14
    la4 dod mi
    la mi re

    %45
    dod8 re dod4 mi
    la, mi' re
    dod dod dod

    %48
    la la la
    re mi mi,
    la2 r4

    %51
    R2.*3\mbreak
    r4 dod la
    re mi re

    %56
    dod8 si dod4 la
    re mi mi,
    la2.

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> s
    s s <4 2>
    <6>2.
    s4 s <4 2>
    <6>2.
    <7>
    s2.*4
    <6 4>4 <5 3> s
    s2.*11
    s4 s \bassFigureExtendersOn <_>8 <_>\bassFigureExtendersOff
    <6>4 s <7>
    s <6 4> <5 _+>
    s s <6>
    s <6 4> <5 _+>
    s2.*15
    s4 <6> s
    s s <4 2>
    <6>2.
    s4 s <4 2>
    <6>2.
    <7!>
    <6 5>4 <6 4> <5 3>
    s2.*4
    s4 <6> s
    s <6 4> <4 2>
    <6> s <7!>
    s <6 4> <5 3>

}

forma = {

    \time 3/4
    \key la\major
    \tempo 2. = 45
    s2.*28
    \bar ":..:"\break
    s2.*30
    \bar ":|."

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


IIIvlIrip = {
    \IIIglobal
    <<\IIIvlIripn \forma>>
}


IIIvlIIrip = {
    \IIIglobal
    <<\IIIvlIIripn \forma>>
}


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}
#(set-global-staff-size 15)


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
        title = \markup\smaller{Concerto grosso n. 2 in La maggiore}
        composer = \markup \center-column{"F. Barsanti (1690 -1770)"}
    }

    \markup\huge{ "[1.] Allegro moderato"}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\smaller{"Violino"\vspace #-0.25"Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"del Concertino"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "vla"
                    \Ivla
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vc"
                    \Ivc
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Primo"\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIr"
                    \IvlIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIIr"
                    \IvlIIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Organo o Basso""Ripieno"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc"
                    \Ibc
                >>
            >>
        >>

        \layout {
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

    \pageBreak

    \markup\huge{ "[2.] Largo"}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\smaller{"Violino"\vspace #-0.25"Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"del Concertino"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "vla"
                    \IIvla
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vc"
                    \IIvc
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Primo"\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIr"
                    \IIvlIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIIr"
                    \IIvlIIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Organo o Basso""Ripieno"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc"
                    \IIbc
                >>
            >>
        >>

        \layout {
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

    \pageBreak

    \markup\huge{ "[3.] Minuet"}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\smaller{"Violino"\vspace #-0.25"Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"del Concertino"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "vla"
                    \IIIvla
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vc"
                    \IIIvc
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Primo"\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIr"
                    \IIIvlIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIIr"
                    \IIIvlIIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Organo o Basso""Ripieno"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc"
                    \IIIbc
                >>
            >>
        >>

        \layout {
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}