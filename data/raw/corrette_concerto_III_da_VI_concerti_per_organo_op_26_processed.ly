\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tr = \trill

ten = ^\markup\italic"tenute"

pizz = ^\markup\italic"Pizzicati"

arco = ^\markup\italic"coll'arco"

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

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

pratubeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

pratubem = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.flat"
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

turnshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-4
    \center-column {\musicglyph #"scripts.turn"}}

beqturnshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-4
    \center-column {\musicglyph #"scripts.turn"}}


pradies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.sharp"
      \musicglyph #"scripts.prall"}}

turnbeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
      \musicglyph #"scripts.turn"}}

mordbeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
      \musicglyph #"scripts.mordent"}}

turndies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {\musicglyph #"scripts.turn"
	  \musicglyph #"accidentals.sharp"
      }}

turnbeqdies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1.5
    \center-column {
	 "♮♯"
      \musicglyph #"scripts.turn"}}

turnbem = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.flat"
      \musicglyph #"scripts.turn"}}

turnbemshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-2
    \center-column {
	  \musicglyph #"accidentals.flat"
      \musicglyph #"scripts.turn"}}

turnshift = ^\markup  {\halign #-2.5 \musicglyph #"scripts.turn"}

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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


Ifln = \relative do'' {

    re8[fad la re]
    la,[dod mi la]
    re,,4 r

    %4
    si'8[re fad si]
    fad,[la dod fad]
    si,4 r16 re mi fad

    %7
    sol8 sol4 sol8~
    sol sol4 sol8
    sol4. fad16(mi)\mbreak

    %10
    sol(fad) mi(re) fad(mi) re(dod)
    re4 r16 re, mi fad
    sol8 sol4 sol8~

    %13
    sol sol4 sol8
    sol4. fad16(mi)
    sol(fad) mi (re) fad8 mi

    %16
    re4 re'
    re re
    re re

    %19
    r8 mi la mi
    fad4 r\mbreak
    R2*7

    %28
    r4 r16 la, si dod
    re(dod) si(la) sol(fad) mi(re)
    si''(la) sol(fad) mi(re) dod(si)

    %31
    la4 sol'
    sol16(fad) mi(re) fad(mi) re(dod)
    re8 r fad, r

    %34
    mi r mi r
    re4 r
    R2*8

    %44
    mi'4 r
    fad r\mbreak
    mi r

    %47
    fad r
    fad r
    sold r

    %50
    fad r
    sold r
    si, r

    %53
    dod r
    si r
    dod r

    %56
    R2*8
    la8[dod mi la]
    mi,[sold si mi]

    %66
    la,4 r
    fad8[la dod fad]
    r mi,[sold dod]

    %69
    fad,4 r16 la'16 si dod\mbreak
    re8 re4 re8~
    re re4 re8

    %72
    re4. dod16 si
    re(dod) si(la) dod(si) la(sold)
    la4 r16 la, si dod

    %75
    re8 re4 re8~
    re re4 re8
    re4. dod16(si)

    %78
    re(dod) si(la) dod(si) la(sold)
    la8 mi' mi16(re) dod(si)
    dod4 r\mbreak

    %81
    R2*2
    si8[si si si]
    dod4 r

    %85
    R2
    re4 r
    R2

    %88
    re4 r
    R2
    sol4 r

    %91
    R2
    sol4 r
    R2

    %94
    la8 r sold r
    la4 r
    fad r

    %97
    sol?8 r fad r
    sol4 r
    sol8 r mi r

    %100
    fad4 r\mbreak
    si8 r lad r
    si r fad r

    %103
    mi r fad r
    re4 r
    R2*2

    %107
    sol,16 si re sol sol, si re sol
    fad (mi) fad (sol) la8 re,
    re,16 fad la do re, fad la do

    %110
    si (la) sol (fad) sol4
    R2*4
    sol4 r

    %116
    sol r
    sol r\mbreak
    sol r

    %119
    mi r
    la r
    la r

    %122
    la r
    r si8 r
    mi r mi r

    %125
    la r re, r
    mi r mi r
    mi4 r

    %128
    R2
    re8[fad la re]
    la,[dod mi la]

    %131
    re,,4 r
    si'8[re fad si]
    fad,[la dod fad]\mbreak

    %134
    si,4 r16 re mi fad
    sol8 sol4 sol8~
    sol sol4 sol8

    %137
    sol4. fad16(mi)
    sol(fad) mi(re) fad(mi) re(dod)
    re4 r

    %140
    R2*4
    re,4 re'
    re re

    %146
    re re
    r8 mi la mi
    fad4 r

    %149
    R2
    r4 r8 re,\mbreak
    fad[la re dod\tr]

    %152
    re re, r4
    R2*8
    r4 r16 la' si dod

    %162
    re(dod) si(la) sol(fad) mi(re)
    si''(la) sol(fad) mi(re) dod(si)
    la4 sol'

    %165
    sol16(fad) mi(re) fad(mi) re(dod)
    re8 r fad, r
    mi r la r

    %168
    fad4 r

}


IvlIn = \relative do'' {

    re16 re fad fad la la re re
    la, la dod dod mi mi la la
    re,,4 r

    %4
    si'16 si re re fad fad si si
    fad, fad la la dod dod fad fad
    re,4 r16 re' mi fad

    %7
    sol8 sol4 sol8~
    sol sol4 sol8
    sol4. fad16 (mi)

    %10
    sol(fad) mi(re) fad(mi) re(dod)
    re4 r16 re, mi fad
    sol8 sol4 sol8~

    %13
    sol sol4 sol8
    sol4. fad16 (mi)
    sol(fad) mi(re) fad(mi) re(dod)

    %16
    re la' fad la re, la' fad la
    re, si' sol si re, si' sol si\mbreak %%%%fine 2da riga
    re, la' fad la re, la' fad la

    %19
    <<
        {
            <la mi>8 [<la mi> <la mi> <la mi>]
            <la fad>4
        }\\{
            dod,8 [dod dod dod]
            re4
        }
    >> r8 sol'\solo
    fad mi16 fad sol8 fad

    %22
    fad\tr mi r4
    R2
    r4 r8 sol\p

    %25
    fad mi16 fad sol8 fad
    fad\tr mi r4
    R2

    %28
    r4 r16 la, si dod\mbreak
    re (dod) si (la) sol (fad) mi (re)
    si'(la) sol(fad) mi(re) dod(si)

    %31
    la4 sol''
    sol16(fad) mi(re) fad(mi) re(dod)
    re4 fad,16 fad fad fad

    %34
    mi mi mi mi mi mi mi mi
    re4 r
    R2*8

    %44
    r8 mi'\solo dod si16 dod
    re8 re, r4\mbreak
    r8 mi' dod\tr si16 dod

    %47
    re8 re, r4
    r8 fad' red\tr dod16 red
    mi8 mi, r4

    %50
    r8 fad' red\tr dod16 red
    mi8 mi, r4
    r8 si'' sold\tr fad16 sold

    %53
    la8 la, r4
    r8 si' sold\tr fad16 sold
    la8 la, mi' mi\mbreak

    %56
    mi[mi, mi' mi]
    mi4 dod,
    re mi

    %59
    la, r8 la''
    fad16 mi re dod si re mi re
    dod la' si dod si re dod si

    %62
    dod8[la la, la']
    la4 sold\tr
    la,16\tu la dod dod mi mi la la

    %65
    mi, mi sold sold si si mi mi\mbreak
    la,,4 r
    fad'16 fad la la dod dod  fad fad

    %68
    dod, dod mi mi sold sold dod dod
    fad,4 r16 la' si dod
    re8 re4 re8~

    %71
    re re4 re8
    re4. dod16 si
    re(dod) si(la) dod(si) la(sold)

    %74
    la4 r16 la, si dod
    re8 re4 re8~
    re re4 re8

    %77
    re4. dod16(si)
    re(dod) si(la) dod(si) la(sold)
    la8 mi' mi16(re) dod(si)

    %80
    dod8 la'\solo la4
    r8 la la4
    r8 la la4

    %83
    r16 si, dod re mi re dod si
    la8 la, r4
    R2

    %86
    fad''4 r
    R2
    fad4 r

    %89
    R2
    mi4 r
    R2

    %92
    mi4 r
    R2
    la8\pizz r sold r

    %95
    la4 r
    <fad la, re,> r
    sol?8 r fad r

    %98
    <sol si, re, sol,>4 r
    sol8 r mi r
    fad4 r\mbreak

    %101
    fad4\pizz fad
    fad8 r re' r
    dod r lad r

    %104
    si4 r
    R2*2
    sol,16\f si re sol sol, si re sol

    %108
    fad(mi) fad(sol) la8 re,
    re,16 fad la do re, fad la do
    si(la) sol(fad) sol4

    %111
    R2*4
    sol'4\pizz r8 sol\mbreak
    sol4 r8 sol

    %117
    sol4 r8 sol
    <<<sol do,>4\\mi,>> r
    la' r8 la

    %120
    la r la r
    la r la r
    <la la, re,>4 r

    %123
    r si,8 r
    mi8 r mi r
    la r re, r

    %126
    mi r mi r
    mi4 r
    R2\mbreak

    %129
    re16\f re fad fad la la re re
    la, la dod dod mi mi la la
    re,,4 r

    %132
    si'16 si re re fad fad si si
    fad, fad la la dod dod fad fad
    si,,4 r16 re' mi fad

    %135
    sol8 sol4 sol8~
    sol sol4 sol8
    sol4. fad16 (mi)

    %138
    sol(fad) mi(re) fad(mi) re(dod)
    re4 r
    R2*4

    %144
    re,16 la' fad la re, la' fad la
    re, si' sol si re, si' sol si\mbreak %%%%fine 2da riga
    re, la' fad la re, la' fad la

    %147
    <<
        {
            <la mi>8 [<la mi> <la mi> <la mi>]
            <la fad>4
        }\\{
            dod,8 [dod dod dod]
            re4
        }
    >> r8 sol'\solo
    fad mi16 fad sol8 fad

    %150
    fad\tr mi r8 re,
    fad[la re dod\tr]
    re re, r sol'\p

    %153
    fad mi16 fad sol8 fad
    fad\tr mi r4
    R2*6

    %161
    r4 r16 la,\f si dod
    re(dod) si(la) sol(fad) mi(re)
    si'(la) sol(fad) mi(re) dod(si)

    %164
    la4 sol''
    sol16(fad) mi(re) fad(mi) re(dod)
    re4 fad,16 fad fad fad

    %167
    mi mi mi mi mi mi mi mi
    re4 r

}


IvlIIn = \relative do'' {

    fad2
    mi
    si16 si re re fad fad si si

    %4
    fad,4 r
    dod' r
    sol16 sol si si re re sol sol

    %7
    re,8 mi'4 mi8~
    mi mi4 mi8
    mi4. re16 (dod)\mbreak

    %10
    re8 la' la16(sol) fad(mi)
    fad4 r
    mi,8 mi4 mi8~
    mi mi4 mi8

    %14
    mi4. re16 (dod)
    re8 la' la16 (sol) fad (mi)
    fad re' re re fad re re re

    %17
    re, re' re re sol re re re
    re, re' re re fad re re re
    mi re dod si la sol fad mi\mbreak

    %20
    fad4 r8 mi'
    re dod16 re mi8 re
    re\tr dod r4

    %23
    R2
    r4 r8 mi\p
    re dod16 re mi8 re

    %26
    re\tr dod r4
    R2
    r4 r16 la si dod

    %29
    re (dod) si (la) sol (fad) mi (re)
    si'(la) sol(fad) mi(re) dod(si)
    la8[dod' mi dod]\mbreak

    %32
    la la' la16 (sol) fad (mi)
    re4 re,16 re re re
    re re re re dod dod dod dod

    %35
    re4 r
    R2*8
    la'4\pizz r

    %45
    la r
    la r
    la r

    %48
    si r
    si r
    si r

    %51
    si r
    mi r
    mi r

    %54
    mi r
    mi r\mbreak
    R2*8

    %64
    dod2\f
    si
    fad16 fad la la dod dod fad fad

    %67
    dod,4 r
    sold' r
    re16 re fad fad la la re re

    %70
    re,8 si''4 si8~
    si si4 si8
    si4. la16 sold

    %73
    la8 mi re dod16 si
    dod4 r\mbreak
    fad,8 si4 si8~

    %76
    si si4 si8
    si4. la16 (sold)
    la8 mi' mi16 (re) dod (si)

    %79
    dod8 dod dod16 (si) la (sold)
    la4 r
    R2*2

    %83
    sold8 [sold sold sold]
    mi4 r
    r lad

    %86
    si r
    r lad
    si r\mbreak

    %89
    r red
    mi r
    r red

    %92
    mi r
    R2
    mi8\pizz r <<mi\\re>> r

    %95
    <<mi4\\do>> r
    <re re,> r
    re8 r do r

    %98
    <si re, sol,>4 r
    si8 r sol' r
    dod,!4 r

    %101
    re8\pizz r mi r
    re r fad r
    fad r fad r

    %104
    fad4 r\mbreak
    R2*2
    si,16\f sol sol si si sol sol si

    %108
    la (sol) la (si) fad re fad la
    re8[re, re' re]
    re re, r4

    %111
    R2*4
    re'8\pizz r si r
    mi r mi r

    %117
    re r re r
    mi4 r
    mi8 r mi r

    %120
    fad r fad r
    mi r mi r
    <fad la, re,>4 r\mbreak

    %123
    r fa,8 r
    mi r dod' r
    re r fad r

    %126
    si, r si r
    la4 r
    R2

    %129
    fad'2\f
    mi
    si16 si re re fad fad si si

    %132
    fad,4 r
    dod' r
    sol16 sol si si re re sol sol

    %135
    re,8 mi'4 mi8~
    mi mi4 mi8
    mi4. re16 (dod)\mbreak

    %138
    re8 la' la16(sol) fad(mi)
    fad4 r
    R2*4

    %144
    fad,16 re' re re  fad re re re
    re, re' re re sol re re re
    re, re' re re fad re re re

    %147
    mi re dod si la sol fad mi
    fad4 r8 mi'
    re8 dod16 re mi8 re

    %150
    re\tr dod r re,
    fad[la re dod\tr]\mbreak
    re re, r mi'\p

    %153
    re dod16 re mi8 re
    re\tr dod r4
    R2*6

    %161
    r4 r16 la\f si dod
    re (dod) si (la) sol (fad) mi (re)
    si'(la) sol(fad) mi(re) dod(si)

    %164
    la8[dod' mi dod]
    la la' la16 (sol) fad (mi)
    re4 re,16 re re re

    %167
    re re re re dod dod dod dod
    re4 r

}


IvlIIIn = \relative do'' {

    re16 re fad fad la la re re
    la, la dod dod mi mi la la
    re,,4 r

    %4
    si'16 si re re fad fad si si
    fad, fad la la dod dod fad fad
    re,4 r16 re' mi fad

    %7
    sol8 sol4 sol8~
    sol sol4 sol8
    sol4. fad16 (mi)

    %10
    sol(fad) mi(re) fad(mi) re(dod)
    re4 r16 re, mi fad
    sol8 sol4 sol8~

    %13
    sol sol4 sol8
    sol4. fad16 (mi)
    sol(fad) mi(re) fad(mi) re(dod)

    %16
    re la' fad la re, la' fad la
    re, si' sol si re, si' sol si\mbreak %%%%fine 2da riga
    re, la' fad la re, la' fad la

    %19
    <<
        {
            <la mi>8 [<la mi> <la mi> <la mi>]
            <la fad>4
        }\\{
            dod,8 [dod dod dod]
            re4
        }
    >> r
    R2*7

    %28
    r4 r16 la' si dod\mbreak
    re (dod) si (la) sol (fad) mi (re)
    si'(la) sol(fad) mi(re) dod(si)

    %31
    la4 sol''
    sol16(fad) mi(re) fad(mi) re(dod)
    re4 fad,16 fad fad fad

    %34
    mi mi mi mi mi mi mi mi
    re4 r
    R2*8

    %44
    mi'4\pizz r
    <<<fad la,>\\ re,>> r
    mi' r

    %47
    <<<fad la,>\\ re,>> r
    fad' r
    <<<sold si,>\\ mi,>> r

    %50
    fad' r
    <<<sold si,>\\ mi,>> r
    si' r

    %53
    <dod mi, la,> r
    si r
    <dod mi, la,> r

    %56
    R2*8
    la16\f la dod dod mi mi la la

    %65
    mi, mi sold sold si si mi mi\mbreak
    la,,4 r
    fad'16 fad la la dod dod  fad fad

    %68
    dod, dod mi mi sold sold dod dod
    fad,4 r16 la' si dod
    re8 re4 re8~

    %71
    re re4 re8
    re4. dod16 si
    re(dod) si(la) dod(si) la(sold)

    %74
    la4 r16 la, si dod
    re8 re4 re8~
    re re4 re8

    %77
    re4. dod16(si)
    re(dod) si(la) dod(si) la(sold)
    la8 mi' mi16(re) dod(si)

    %80
    dod4 r\mbreak
    R2*2
    si8[si si si]

    %84
    dod4 r
    R2
    re4 r
    R2

    %88
    re4 r
    R2
    sol4 r

    %91
    R2
    sol4 r
    R2

    %94
    la8 \pizz r sold r
    la4 r
    <fad la, re,> r
    sol?8 r fad r

    %98
    <sol si, re,>4 r
    sol8 r mi r
    fad4 r\mbreak
    si8\pizz r lad r
    si r fad r

    %103
    mi r fad r
    re4 r
    R2*2

    %107
    sol,16\f si re sol sol, si re sol
    fad (mi) fad (sol) la8 re,
    re,16 fad la do re, fad la do

    %110
    si (la) sol (fad) sol4
    R2*4
    sol8\pizz r sol r

    %116
    sol r sol r
    sol r sol r
    sol4 r

    %119
    mi4 r8 la
    la r la r
    la r la r

    %122
    la4 r
    r si8 r
    mi r mi r

    %125
    la r re, r
    mi r mi r
    mi4 r
    R2\mbreak

    %129
    re16\f re fad fad la la re re
    la, la dod dod mi mi la la
    re,,4 r

    %132
    si'16 si re re fad fad si si
    fad, fad la la dod dod fad fad
    si,,4 r16 re' mi fad

    %135
    sol8 sol4 sol8~
    sol sol4 sol8
    sol4. fad16 (mi)

    %138
    sol(fad) mi(re) fad(mi) re(dod)
    re4 r
    R2*4

    %144
    re,16 la' fad la re, la' fad la
    re, si' sol si re, si' sol si\mbreak %%%%fine 2da riga
    re, la' fad la re, la' fad la

    %147
    <<
        {
            <la mi>8 [<la mi> <la mi> <la mi>]
            <la fad>4
        }\\{
            dod,8 [dod dod dod]
            re4
        }
    >> r
    R2

    %150
    r4 r8 re
    fad[la re dod\tr]
    re re, r4
    R2*8

    %161
    r4 r16 la'\f si dod
    re(dod) si(la) sol(fad) mi(re)
    si'(la) sol(fad) mi(re) dod(si)

    %164
    la4 sol''
    sol16(fad) mi(re) fad(mi) re(dod)
    re4 fad,16 fad fad fad

    %167
    mi mi mi mi mi mi mi mi
    re4 r

}


Ivlan = \relative do' {

    la'8[la la la]
    la[la la mi]
    fad[fad fad fad]

    %4
    re[re re re]
    fad[fad fad fad]
    sol,4 r

    %7
    si'8 r la r
    sol r fad r
    mi r la r

    %10
    la4 la
    la r
    si8 r la r

    %13
    sol r fad r
    mi r la r
    la4 la

    %16
    la8[re, re re]
    r re[re re]
    r re[re re]

    %19
    r dod[mi la]
    la4 r
    R2*8

    %29
    la4 r8 la
    re,4 r8 mi
    dod[la' la la]

    %32
    la4 la
    fad8 r la r
    si r la r\mbreak

    %35
    <<la4\\fad>> r
    R2*8
    dod4\pizz r

    %45
    la r
    dod r
    la r

    %48
    red r
    si r
    red r

    %51
    si r
    sold' r
    mi r

    %54
    sold r
    mi r
    R2*8

    %64
    mi8[mi mi mi]
    mi[mi mi si]
    dod[dod dod dod]

    %67
    la[la la la]\mbreak
    dod[dod dod dod]
    re4 r

    %70
    fad8 r mi r
    re' r dod r
    si r mi, r

    %73
    mi4 mi
    mi r
    fad8 r mi r

    %76
    re' r dod r
    si r mi, r
    mi4 mi

    %79
    mi mi
    mi r
    R2*2

    %83
    mi8[mi mi mi]
    mi4 r\mbreak
    R2

    %86
    re4 r
    R2
    si'4 r

    %89
    R2
    si4 r
    R2*2

    %93
    mi,8\pizz r mi r
    mi r mi r
    mi4 r

    %96
    re8 r re r
    re r re r
    re4 r

    %99
    si'8 r si r
    lad r fad r
    si r mi, r

    %102
    re r si' r
    fad r fad r\mbreak
    fad4 r

    %105
    R2*2
    re8\f[re re re]
    r8 re fad re

    %109
    r re fad re
    re4 r
    R2*4

    %115
    si'4\pizz r
    do r
    si r

    %118
    do r
    dod! r
    re r

    %121
    dod r
    re r
    si, r

    %124
    dod r
    re r
    re r\mbreak

    %127
    re r
    R2
    la'8\f[la la la]

    %130
    la[la la mi]
    fad[fad fad fad]
    re[re re re]

    %133
    fad[fad fad fad]
    sol,4 r
    si'8 r la r

    %136
    sol r fad r
    mi r la r
    la4 la

    %139
    la r
    R2*4
    r8 re, re re

    %145
    r re re re\mbreak
    r re re re
    r dod mi la

    %148
    la4 r
    R2
    r4 r8 re,

    %151
    fad[la re dod\tr]
    re re, r4
    R2*9

    %162
    la'4 r8 la
    re,4 r8 mi
    dod[la' la la]

    %165
    la4 la
    fad8 r la r
    si4 la

    %168
    <<la\\fad>> r

}


Ivcn = \relative do {

    re8[re re re]
    dod[dod dod dod]
    si[si si si]

    %4
    si'[si si si]
    la[la la la]
    sol4 r

    %7
    sol16 sol sol sol fad fad fad fad
    mi mi mi mi re re re re\mbreak
    dod dod dod dod la la la la

    %10
    re4 la
    re r
    sol16 sol sol sol fad fad fad fad

    %13
    mi mi mi mi re re re re
    dod dod dod dod la la la la
    re4 la

    %16
    re16 re' re re re re re re
    re, re' re re re re re re\mbreak
    re, re' re re re re re re

    %19
    la8[la la la,]
    re4 r
    R2

    %22
    r4 r8 re
    fad[la re dod\tr]
    re re, r4

    %25
    R2
    r4 r8 re
    fad[la re dod\tr]

    %28
    re re, r4
    fad,4 r8 fad
    sol4 r8 sol\mbreak

    %31
    la[la' dod la]
    re4 la
    si fad16 fad fad fad

    %34
    sol sol sol sol la la la la
    re,4 r
    R2*8

    %44
    dod4\pizz r
    re r
    dod r

    %47
    re r
    red r
    mi r

    %50
    red r
    mi r\mbreak
    sold r

    %53
    la r
    sold r
    la r

    %56
    R2*8
    la8[la la la]
    sold[sold sold sold]

    %66
    fad[fad fad fad]
    fad[fad fad fad]
    mi[mi  mi mi]

    %69
    re4 r
    re'16 re re re dod dod dod dod
    si si si si la la la la\mbreak

    %72
    sold sold sold sold mi mi mi mi
    la4 mi
    la r

    %75
    re,16 re re re dod dod dod dod
    si si si si la la la la
    sold sold sold sold mi mi mi mi

    %78
    la4 mi'
    la mi
    la, r

    %81
    R2*2
    mi'8 [mi mi mi,]\mbreak
    la4 r

    %85
    R2
    si4 r
    R2

    %88
    si4 r
    R2
    mi4 r

    %91
    R2
    mi4 r
    R2

    %94
    do'8\pizz r si r
    la4 r
    re8 r do r

    %97
    si r la r
    sol4 r
    mi'8 r mi r

    %100
    mi4 r\mbreak
    re8 r dod r
    re r si r

    %103
    lad r fad r
    si,4 r
    R2*2

    %107
    sol'8\f [sol sol sol]
    re[re re re]
    re[re re re]

    %110
    sol,[sol sol sol]
    R2*4
    sol4\pizz r

    %116
    do r
    sol r
    do r

    %119
    la r\mbreak
    re r
    la r

    %122
    re r
    sold r
    sol! r

    %125
    fad r
    sol r
    la r

    %128
    R2
    re,8\f[re re re]
    dod[dod dod dod]

    %131
    si[si si si]
    si'[si si si]
    la[la la la]

    %134
    sol4 r\mbreak
    sol16 sol sol sol fad fad fad fad
    mi mi mi mi re re re re

    %137
    dod dod dod dod la la la la
    re4 la
    re r

    %140
    R2*4
    re16 re' re re re re re re
    re, re' re re re re re re\mbreak

    %146
    re, re' re re re re re re
    la8[la la la,]
    re4 r

    %149
    R2
    r4 r8 re
    fad[la re dod\tr]

    %152
    re re, r4
    R2*9
    fad,4 r8 fad

    %163
    sol4 r8 sol
    la[la' dod la]
    re4 la

    %166
    si fad16 fad fad fad
    sol sol sol sol la la la la
    re,4 r

}

Imdn = \relative do'' {

    s2*34
    s4 r8 la
    <<
        {
            re[fad mi sol]

            %37
            fad16\tr mi re8 r la
            re16 dod re fad mi re mi la
            fad re mi re fad re mi re

            %40
            mi re mi la mi re mi la
            re, dod re mi re dod re mi
            dod si dod mi re dod re mi

            %43
            dod4\tr r8 mi,\tu
        }\\{
            fad r dod r
            re4 r
            fad8 r dod r
            re r re r
            dod r dod r
            si r sold r\mbreak
            s2
            la'4
        }
    >>
    la16 mi la mi sol mi sol mi
    fad re mi re fad re mi re

    %46
    la' mi la mi sol mi sol mi
    fad re mi re fad re mi re
    si' fad si fad la fad la fad

    %49
    sold mi fad mi sold mi fad mi
    si' fad si fad la fad la fad
    sold mi fad mi sold mi fad mi\mbreak

    %52
    mi' si mi si re si re si
    dod la si la dod la si la
    mi' si mi si re si re si

    %55
    dod si dod mi si la si re
    dod si dod mi si la si re
    dod8\tr si16 la la'8 mi

    %58
    fad16(mi) re(dod) si8.\tr la16
    la4 <<
        {
            r16 mi\solo la mi
            r fad si fad r sold dod sold

            %61
            r la re la r si mi si
            r dod mi dod r mi la mi
            fad mi re dod si8.\tr la16

            %64
            la4 s4
        }\\{
            dod,8 r
            re r mi r\mbreak
            fad r sold r
            la r dod, r
            re r mi r
            la,[\giu la la la]
        }
    >>
    s2*18
    mi'8[mi mi mi]

    %84
    mi4 r
    \once  \override Rest.staff-position = #+4 r16 \stemUp mi' \solo fad sol fad mi re dod
    re si dod si re si dod si

    %87
    r16 mi fad sol fad mi re dod
    re si dod si re si dod si
    r la' si do si la sol fad
    re si dod si re si dod si

    %91
    r16 la' si do si la sol fad
    \stemDown sol mi fad mi sol mi fad mi
    sold mi fad mi sold mi fad mi

    %94
    la mi la mi si' mi, si' mi,\mbreak
    do' mi, do' mi, la mi la mi
    fad re mi re fad re mi re

    %97
    sol re sol re la' re, la' re,
    si' re, si' re, sol re sol re
    \stemUp sol si, do si sol' si, do si

    %100
    dod! lad si  lad dod lad si lad
    \stemDown \override Rest.staff-position = #+4 si'8 -. r lad-. r
    si-. r fad-. \revert Rest.staff-position  r

    %103
    mi-. r fad-. r\mbreak
    re16 dod si8\giu\stemUp r16 si, re si
    r si dod si r lad dod lad

    %106
    s2*5\stemUp
    \su sol'16 si re sol sol, si re sol
    \stemDown fad mi fad sol la8 re,

    %113
    \stemUp re,16 fad la do re, fad la do
    si la sol fad sol4\prallmordent
    re16 sol re sol re sol re sol

    %116
    mi sol mi sol mi sol mi sol
    re sol re sol re sol re sol
    mi sol mi sol mi sol mi sol

    %119
    mi la mi la mi la mi la
    fad la fad la fad la fad la
    mi la mi la mi la mi la

    %122
    fad la fad la fad la fad la
    fa re fa re fa re fa re
    mi la mi la mi la mi la

    %125
    fad? la fad la fad la fad la
    mi si' mi, si' mi, si' mi, si'
    mi, la mi la mi la mi la

    %128
    mi sol mi sol mi sol mi sol
    <<fad4\\re>> r
    s2*5

    %135
    R2*5
    r16  si'\solo re si r la re la
    sol sol' sol, sol' sol, sol' sol, sol'

    %142
    \stemNeutral la, sol' la, sol' la, sol' la, sol'
    sol fad  mi re fad mi re dod
    re4\prallmordent r

    %145
    R2*5
    s2*3
    R2

    %154
    r4 r8 la\solo
    re16 dod si la sol fad mi re
    re' re, re' re, re' re, re' re,\mbreak

    %157
    re' dod si la sol fad mi re
    re' re, re' re, re' re, re' re,
    la'' re, la' re, la' re, la' re,

    %160
    si' re, si' re, dod' re, dod' re,
    re' re, re' re, re'4
    s2*7

}

Imsn = \relative do {

    re8[re re re]
    dod[dod dod dod]
    si[si si si]

    %4
    si'[si si si]
    la[la la la]
    sol4 r

    %7
    sol fad
    mi re
    dod la

    %10
    re la
    re r
    sol fad

    %13
    mi re
    dod la\mbreak
    re la

    %16
    re r
    re r
    re r

    %19
    la'8[la la la,]
    re4 r
    R2

    %22
    r4 r8 re
    fad[la re dod]
    re re, r4

    %25
    R2
    r4 r8 re
    fad[la re dod]

    %28
    re re, r4
    fad,4 r8 fad
    sol4 r8 sol\mbreak

    %31
    la[la' dod la]
    re4 la
    si8 r fad r

    %34
    sol r la r
    re,4 s
    s2*6

    %42
    \stemUp la'8 [\su\stemDown  la' sold mi]
    s2
    \giu\stemNeutral dod,4 la

    %45
    <<re\\\shiftOn \stemUp re,>> r
    dod' la
    <<re\\\shiftOn \stemUp re,>> r

    %48
    red' si
    <<mi\\\shiftOn \stemUp mi,>> r
    red' si

    %51
    <<mi\\\shiftOn \stemUp mi,>> r\mbreak
    sold' mi
    <<la\\\shiftOn \stemUp la,>> r

    %54
    sold' mi
    la,8[la' sold mi]
    la,[la' sold mi]

    %57
    <<la4\\\shiftOn \stemUp la,>> <<
        {
            la'
            la sold
        }\\{
            dod,
            re mi
        }
    >>
    <<la\\\shiftOn \stemUp la,>> s

    %60
    s2*5
    \giu\stemNeutral sold'8[sold sold sold]
    fad[fad fad fad]

    %67
    fad[fad fad fad]
    mi[mi  mi mi]
    re4 r

    %70
    re' dod
    si la
    sold mi

    %73
    la mi\mbreak
    la r
    re, dod

    %76
    si la
    sold mi
    la mi'

    %79
    la mi
    <<{la16\su mi' dod mi \giu la, \su mi' dod mi}\\\shiftOn \stemUp la,,4>>
    <<{la'16\su fad' re fad \giu la, \su fad' re fad}\\{\shiftOn \stemUp la,,8[la la la]}>>

    %82
    <<{la'16\su mi' dod mi \giu la, \su mi' dod mi}\\{\shiftOn \stemUp la,,8[la la la]}>>
    <<
        {
            \autoBeamOff \crossStaff {
                \stemUp <re' si sold>8 <re si sold> <re si sold> <re si sold>
                <dod la la,>4
            } r\autoBeamOn\stemNeutral
        }\\{mi,4 \stemUp \shiftOn mi,}
    >>

    %85
    \su \stemDown lad''8 r fad r
    \giu si,4 r\mbreak
    \su lad'8 r fad r

    %88
    \giu si,4 r
    \su red'8 r si r
    mi,4 r

    %91
    red'8 r si r
    mi,4 r
    mi8 r re r

    %94
    do r \giu si r\mbreak
    la4 r
    re8 r do r

    %97
    si r la r
    sol4 r
    \su mi' mi

    %100
    mi2
    re16 fad re fad dod mi dod mi
    re fad re fad \giu si, re si re

    %103
    lad dod lad dod fad, lad fad lad\mbreak
    \stemUp si,4 \stemDown re
    mi fad

    %106
    <<<si fad re>4\\si,>> r
    sol'8\tu [sol sol sol]
    re[re re re]

    %109
    re[re re re]
    \stemNeutral sol,[sol sol sol]
    <<
        {
            <re'' si>[<re si> <re si> <re si>]

            %112
            <re la fad>[<re la fad> <re la fad> <re la fad>]
            <la fad>[<la fad> <la fad> <la fad>]
            sol4
        }\\{
            sol8[sol sol sol]
            re[re re re]
            re[re re re]
            sol,4
        }
    >> r\mbreak

    %115
    si'16 sol si sol si sol si sol
    do sol do sol do sol do sol
    si sol si sol si sol si sol

    %118
    do sol do sol do sol do sol
    dod! la dod la dod la dod la
    re la  re la re la re la

    %121
    dod la dod la dod la dod la
    re la  re la re la re la
    re sold, re' sold, re' sold, re' sold,

    %124
    dod sol! dod sol dod sol dod sol
    re' fad, re' fad, re' fad, re' fad,
    re' sol, re' sol, re' sol, re' sol,

    %127
    re' la  re la re la re la
    dod la dod la dod la dod la
    re,8[re re re]

    %130
    dod[dod dod dod]
    si[si si si]
    si'[si si si]

    %133
    la[la la la]\mbreak
    sol4 r
    R2*5

    %140
    \su\stemDown sol'8 r fad r
    mi r re r
    \giu dod r la r

    %143
    \stemNeutral <<
        {
            \once\shiftOn \stemDown re4 \stemUp la
            <la fad>
        }\\{
            \stemDown re, \stemUp \shiftOn  la
            \stemDown re
        }
    >> r
    R2*5

    %150
    r4 r8 re
    fad[la re dod]
    re re, r4

    %153
    R2*2
    <<fad4\\\shiftOn \stemUp fad,>> r
    <<sol'4\\\shiftOn \stemUp sol,>> r

    %157
    <<la'4\\\shiftOn \stemUp la,>> r
    <<si'4\\\shiftOn \stemUp si,>> r
    <<fad'4\\\shiftOn \stemUp fad,>> r

    %160
    <<sol'4\\\shiftOn \stemUp sol,>>  <<la'4\\\shiftOn \stemUp la,>>
    <<re4\\\shiftOn \stemUp re,>> r
    fad4 r8 fad

    %163
    sol4 r8 sol
    la[la' dod la]
    re4 la

    %166
    si8 r fad r
    sol r la r
    re,4 r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    <6>
    <5>
    s
    <6>
    s2*3
    <5/>2
    s2*4
    <5/>2
    s2*2
    <6 4>2
    <5 3>
    s2*4
    <6>4. <5/>8
    s2*3
    <6>4. <5/>8
    s2
    <6>
    <6 5>
    s4 <5/>
    s <7>
    <5> <6>
    <6 5>2
    s2*30
    <6>2
    <5>
    s
    <6>
    s2*3
    <5/>2
    s4 <_+>
    s2*3
    <5/>2
    s4 <_+>
    s <_+>
    s2*29
    <7>2
    s2*20
    <6>2
    <5>
    s
    <6>
    s2*17
    <6>4. <5/>8
    s2*10
    <6>2
    <6 5>
    s4 <5/>
    s <7>
    <5> <6>
    <6 5>

}


forma = {

    \time 2/4
    \tempo 2 = 55
    \key re\major
    s2*168
    \bar "|."

}

Ifl = {
    \Iglobal
    \notypeset
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

IvlIII = {
    \Iglobal
    <<\IvlIIIn \forma>>

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

Imd = {
    \Iglobal
    \context Staff = up
    <<\Imdn \forma>>

}

Ims = {
    \Iglobal
    \clef bass
    \context Staff = down
    <<\Imsn \forma \Ibfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IIglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.4
  \override TupletBracket.bracket-visibility = ##f
  \terzine \senza
}


IIfln = \relative do'' {

    re4 re8 re
    re4\tr dod sol'8(fad) mi(sol)
    fad4\tr mi8 fad sol4 fad
    mi re dod\tr re

    %4
    \appoggiatura re8 mi2 r
    R1*3
    r2 mi4 la~

    %9
    la sold8(fad) mi(re) dod(si)
    dod4\tr la fad'8(mi) re(fad)
    mi4 la,8 si dod4 si\tr

    %12
    la4 la'8 la la4 mi
    la la,8 la la4 mi\mbreak
    la2 mi'8(re) mi(fad)

    %15
    \appoggiatura fad sol2 si,8(la) si(dod)
    \appoggiatura dod re2 fad8(mi) fad(sol)
    la4 la la sol8 fad

    %18
    mi2\tr r
    la1~
    la2 la8(sol) la(fad)

    %21
    sol(fad) sol(mi) fad(mi) fad(sol)
    mi2\tr \appoggiatura {mi16[fad]} sol2
    fad4 mi re dod

    %24
    re fad fad2~
    fad r
    r r4 fad

    %27
    sol2 r4 re8\tr dod\mbreak
    si2 r4 fad'
    sol2 r4 re8\tr dod

    %30
    si4 si'8\f si si4 fad
    si si,8 si si4 fad
    si2 si'4 r

    %33
    la r sol r
    fad r r2
    fad4(la) fad(la)

    %36
    mi(sol) mi(sol)
    fad(la) fad(la)
    la re,8\f re re4 la

    %39
    re2 r
    r4 re'8 re re4 la
    re re,8 re re4 la

    %42
    re2

}


IIvlIn = \relative do'' {

    re4 re8 re
    re4\tr dod sol'8(fad) mi(sol)
    fad4\tr mi8 fad sol4 fad
    mi re dod\tr re

    %4
    \appoggiatura re8 mi2 r4 la,,
    re2 r4 la
    re2 r

    %7
    R1
    r2 mi'4 la~
    la sold8(fad) mi(re) dod(si)

    %10
    dod4\tr la r2\mbreak
    R1
    r4 la'8 la la4 mi

    %13
    la la,8 la la4 mi\mbreak
    la2 dod8(si) dod(re)
    \appoggiatura re mi2 sol,8(fad) sol(la)

    %16
    fad2\tr fad'8(mi) fad(sol)
    la4 la la sol8 fad
    mi2\tr r4 re,

    %19
    la' la, r re
    la' la, la''8(sol) la(fad)\mbreak
    sol(fad) sol(mi) fad(mi) fad(sol)

    %22
    mi2\tr \appoggiatura {mi16[fad]} sol2
    fad4 mi re dod
    re\tr dod r2

    %25
    R1
    r2 si'4 r
    si8 dod, re mi re(dod) si(lad)

    %28
    si4 si, r2
    R1
    r4 si''8\f si si4 fad

    %31
    si si,8 si si4 fad
    si2 r\mbreak
    R1*2

    %35
    la'1~
    la\tr~
    la\tr ~

    %38
    la4 re,8\f re re4 la
    re2 r
    r4 re8 re re4 la

    %41
    re re,8 re re4 la
    re2

}


IIvlIIn = \relative do'' {

    fad,4 fad8 fad
    fad4\tr mi mi'8(re) dod(mi)
    re4\tr dod re8(mi) dod(re)
    si(dod) la(si) sol(la) fad(re')

    %4
    dod2\tr r
    R1*3
    r2 la8 dod mi la,

    %9
    fad' si, si la' la4 sold\tr
    la2 r
    R1

    %12
    r4 la8 la la4 mi\mbreak
    la4 la,8 la la4 mi
    la2 r

    %15
    R1
    r2 re8(dod) re(mi)
    fad4 fad fad mi8 re

    %18
    dod2\tr r
    R1
    r2 fad8(mi) fad(re)

    %21
    mi(re) mi(dod) re(dod) re(mi)
    dod2\tr \appoggiatura {dod16[re]} mi2
    dod fad4 fad8 fad

    %24
    fad2 r
    R1\mbreak
    r4 si r si

    %27
    sol, sol' fad8 mi re dod
    si4 r si, r
    R1

    %30
    r4 si''8\f si si4 fad
    si si,8 si si4 fad
    si2 r

    %33
    R1*2
    la4\p (re) la(re)
    la(dod) la(dod)

    %37
    la(re) la(re)
    dod4\tr re8\f re re4 la\mbreak
    re4 r r2

    %40
    r4 re8 re re4 la
    re re,8 re re4 la
    re2

}


IIvlIIIn = \relative do'' {

    re4 re8 re
    re4\tr dod sol'8(fad) mi(sol)
    fad4\tr mi8 fad sol4 fad
    mi re dod\tr re

    %4
    mi2\tr r
    R1*3
    r2 mi4 la~

    %9
    la sold8(fad) mi(re) dod(si)
    dod4\tr la fad'8(mi) re(fad)
    mi4 la,8 si dod4 si\tr

    %12
    la4 la'8 la la4 mi
    la la,8 la la4 mi\mbreak
    la2 r

    %15
    R1
    r2 fad'8(mi) fad(sol)
    la4 la la sol8 fad

    %18
    mi2\tr r
    R1
    r2 la8(sol) la(fad)\mbreak
    sol(fad) sol(mi) fad(mi) fad(sol)

    %22
    mi2\tr \appoggiatura {mi16[fad]} sol2
    fad4 mi re dod
    re\tr dod r2

    %25
    R1
    r2 re,\p
    mi fad

    %28
    sol re
    mi fad
    si,4 si''8\f si si4 fad

    %31
    si4 si,8 si si4 fad
    si2 r
    R1*2

    %35
    re,2\p r
    dod r
    re r

    %38
    la4 re'8\f re re4 la\mbreak
    re2 r
    r4 re8 re re4 la

    %41
    re re,8 re re4 la
    re2

}


IIvlan = \relative do' {

    la'4 la8 la
    la4 la, r la'
    la2 r
    mi4 fad la la
    la2 r
    R1*3
    r2 la,4 dod~
    dod si2 mi4
    mi2 r
    R1
    r4 la8 la la4 mi
    la la8 la la4 mi
    la2 r\mbreak
    R1
    r2 si4 si
    re,2 re
    la'\tr r
    R1
    r2 dod4 si~
    si la2 la4
    la,4. la'8 mi re dod si
    fad'4 fad fad lad
    si lad\tr si fad
    fad2 r
    R1*2
    r2 fad
    sol r4 fad
    re si'8\f si si4 fad
    si si8 si si4 fad
    si,2 r
    R1*2
    r4 la' la2
    r4 la la2
    r4 la la2
    r4 re8\f re re4 la
    re r r2
    r4 re8 re re4 la
    re re,8 re re4 la
    re2

}


IIvcn = \relative do {

    re8 mi fad re
    la'4 la, la' la,
    re2 si'4 la
    sol fad mi re

    %4
    la' la, r2
    R1*3
    r2 dod

    %9
    re mi
    la, r
    R1

    %12
    r4 la'8 la la4 mi
    la la8 la la4 mi\mbreak
    la,2 la'

    %15
    mi r
    r si'4 si,
    fad'2 sol

    %18
    la\tr r
    R1
    r2 fad4 si

    %21
    mi, la re, mi,
    la2 r
    lad'2. fad4

    %24
    si fad si lad\tr
    si si, r2
    r re\mbreak

    %27
    mi fad
    sol r
    R1

    %30
    r4 si8\f si si4 fad
    si si8 si si4 fad
    si,2 r

    %33
    R1*2
    re2 r
    la r

    %37
    re r
    la4 re'8\f re re4 la
    re2 r

    %40
    r4 re8 re re4 la
    re re,8 re re4 la
    re2

}

IImdn = \relative do'' {

    re4 re8 re
    re4\tr dod sol'8 fad mi sol
    fad4\tr mi8 fad\mbreak sol4 fad
    mi re dod\tr re

    %4
    \appoggiatura re mi2\prallmordent  \stemUp sol8 fad mi sol
    fad mi re fad sol fad mi sol
    fad4\tr re \stemNeutral fad8 la, si la

    %7
    sold4\tr la re dod
    si2\tr mi4 la~
    la sold8 fad mi re dod si

    %10
    dod4\tr la fad'8 mi re fad
    mi la la, si \stemUp dod4 si\tr
    la la'8 la la4 mi

    %13
    \stemDown\shiftOn  la \stemNeutral la,8 la la4 mi
    la2 mi'8 re mi fad\mbreak
    \appoggiatura fad sol2\prallmordent si,8 la si dod

    %16
    \appoggiatura dod re2\prallmordent fad8(mi) fad(sol)
    la4 la la sol8 fad
    mi2\tr \stemUp la8 sol la fad

    %19
    sol fad sol mi fad mi fad sol
    mi2\tr r\stemNeutral
    s1

    %22
    s2 \appoggiatura {mi16[fad]} sol2
    fad4 mi re\tr dod
    re8(mi)  dod(mi) re(mi) dod(mi)

    %25
    re(dod) si(dod) re4 dod\tr
    si si'-. r si-.
    r8 dod, re mi re dod si lad

    %28
    si4 si'-. r si-.
    r8 dod, re mi re dod si lad
    re4 \stemUp re'8 re re4 fad,

    %31
    \stemNeutral si si,8 si si4 fad
    si2\prallmordent <<si'4\\sol>> r
    <<la\\fad>> r <<sol\\mi>>  \override Rest.staff-position = #+4 r

    %34
    <<fad\\re>> r \stemUp  la'8 la, sol' la,
    fad' la, la' la, fad' la, la' la,
    mi' la, sol' la, mi' la, sol' la,

    %37
    fad' la, la' la, fad' la, la' la,
    mi'4\tr re8 re re4 la
    re la' sol8 fad sol mi

    %40
    fad4 re8 re re4 la
    re\prallmordent re,8 re re4\giu\stemUp la
    \su re2\prallmordent

}

IImsn = \relative do {

    <<{<la' fad>4 <la fad>
       la2 la4 la
       <la fad>2}\\{re,4 re
                    \stemUp \shiftOn la2 la4 la
                    \stemDown re2}>>si'4 la
    sol fad mi re

    %4
    <<la'2\\\stemUp \shiftOn fad,>> \su \stemDown dod''4 la'
    re, la' dod, la'
    re,2\giu\stemNeutral re,4 re

    %7
    re dod si la
    mi'2 dod
    re\prallmordent  mi

    %10
    la, re'8 dod si re
    dod la dod re \su\stemDown mi4\giu\stemNeutral mi,
    la\su\stemDown la'8 la la4 mi

    %13
    la\giu\stemNeutral la,8 la la4 mi
    <<la2\\la,>> la'
    \stemUp mi8 sol si \su mi \giu\stemUp mi,2

    %16
    \stemNeutral si8 re fad si si,2
    fad sol
    la\glissando\su\stemDown fad'''8 mi fad re

    %19
    mi re mi dod re4 \stemUp re,
    \stemDown la'2 \giu\stemNeutral fad,4 si
    mi, la re, re,

    %22
    la'2 r
    <<<fad' dod>2.\\lad,>> fad4
    si fad 'si lad\tr

    %25
    si re,8 mi fad4 fad,
    si2 re\prallmordent
    mi\prallmordent fad\prallmordent\mbreak

    %28
    sol\prallmordent re\prallmordent
    mi\prallmordent fad\prallmordent
    si,4\su\stemDown si''8 si si4 fad

    %31
    si\giu\stemNeutral si,8 si si4 fad
    si,2 sol8 si re sol
    re fad la re \stemDown la dod\su mi la

    %34
    re, fad la re fad,4 mi
    re fad re fad
    dod mi dod mi

    %37
    re fad re fad
    \giu \stemDown la, \su re8 re re4 \giu la
    \su re fad' mi8 re mi dod

    %40
    re4 re,8 re re4 \giu la
    \su re\giu \stemNeutral re,8 re re4 \shiftOnn la
    <<re2\\\stemUp \shiftOn re,>>

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2
  s1*19
  s2 <6>4 <7>
  <7> <7> s2

}


forma = {

  \time 2/2
  \tempo 2 = 50
  \key re\major
  \partial 2 s2
  s1*13
  s2
  \bar ":..:"\break
  s
  s1*27
  s2
  \bar ":|."

}

IIfl = {
  \IIglobal
  \notypeset
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

IIvlIII = {
  \IIglobal
  <<\IIvlIIIn \forma>>

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

IImd = {
  \IIglobal
  \context Staff = up
  <<\IImdn \forma>>

}

IIms = {
  \IIglobal
  \clef bass
  \context Staff = down
  <<\IImsn \forma \IIbfn>>
  \typeset

}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


IIIfln = \relative do'' {

    la4 la la
    re2 r4\fermata
    la mi sol

    %4
    fad2 r4\fermata
    la' la si
    si2 la4

    %7
    si si si
    la2 r4
    la la la

    %10
    la2 r4
    sol sol sol
    sol2 r4

    %13
    fad fa fa
    si,2 r4\fermata
    mi mi mi

    %16
    la,2.\fermata

}


IIIvlIn = \relative do'' {

    la4 la la
    re2 r4\fermata
    re, re dod

    %4
    re8 la' re fad la re,
    re'4 re re\mbreak
    re2 dod4

    %7
    si si si
    la8 la, mi dod la sol''
    fad4 fad la

    %10
    la8.[(sol16) la8.(sol16)] la8(sol16 fad)
    sol4 sol sol
    sol8.[(fad16) sol8.(fad16)] sol8(fad16 mi)

    %13
    fad4 fa fa
    fa?2 r4\fermata
    mi mi mi

    %16
    dod,2.\fermata

}


IIIvlIIn = \relative do'' {

    fad,4 fad mi
    fad2 r4\fermata
    fad mi mi

    %4
    fad2 r4\fermata
    fad' fad si
    sold2 la4

    %7
    la la sold
    la2 r4
    la, la fad'

    %10
    fad8.[(mi16) fad8.(mi16)]\mbreak fad8(mi16 re)
    mi4 mi mi
    mi8.[(re16) mi8. (re16)] mi8(re16 dod)

    %13
    re4 la la
    si2 r4\fermata
    dod dod dod

    %16
    dod,2.\fermata

}


IIIvlIIIn = \relative do'' {

    la4 la la
    re2 r4\fermata
    re, re dod

    %4
    re2 r4\fermata
    la'' la si
    si2 la4

    %7
    si si si
    la2 r4
    la la la

    %10
    la2 r4\mbreak
    sol sol sol
    sol2 r4

    %13
    fad fa fa
    fa2 r4\fermata
    mi mi mi

    %16
    mi,2.\fermata

}


IIIvlan = \relative do' {

    re4 la' la,
    si2 r4\fermata
    la' si la

    %4
    la2 r4\fermata
    la fad re'
    si2 fad4

    %7
    fad mi re
    dod2 r4
    R2.

    %10
    si'4 si si
    si2 r4
    la la la

    %13
    la re re
    re2 r4\fermata
    dod la la

    %16
    la,2.\fermata

}


IIIvcn = \relative do {

    re4 re dod
    si2 r4\fermata
    fad4 sol la

    %4
    re,2 r4\fermata
    re' re si
    mi2 fad4

    %7
    re mi mi,
    la2 r4
    re re fad

    %10
    si,2 r4
    mi mi sol
    la,2 r4

    %13
    re re re
    sold,2 r4\fermata
    la la la

    %16
    la2.\fermata

}

IIImdn = \relative do'' {



}

IIImsn = \relative do {

    re4 re dod
    si2 r4\fermata
    fad4 sol la

    %4
    re,2 r4\fermata
    re' re si
    mi2 fad4

    %7
    re mi mi,
    la2 r4
    re re fad

    %10
    si,2 r4
    mi mi sol
    la,2 r4

    %13
    re re re
    sold,2 r4\fermata
    la la la

    %16
    la2.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>4
    s2.
    <6>4 <6 5> s
    s2.
    s
    <7 _+>2 <5>4
    <6 5> <4 > <_+>
    s2.
    s2 <6>4
    <7>2.
    s2 <6>4
    <7>2.
    s4 <_!> s
    <7/>2.

}


forma = {

    \time 3/4
    \tempo 4 = 55
    \key re\major
    s2.*16
    \bar "|."

}

IIIfl = {
    \IIIglobal
    \notypeset
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

IIIvlIII = {
    \IIIglobal
    <<\IIIvlIIIn \forma>>

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

IIImd = {
    \IIIglobal
    \context Staff = up
    <<\IIImdn \forma>>

}

IIIms = {
    \IIIglobal
    \clef bass
    \context Staff = down
    <<\IIImsn \forma \IIIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con
}


IVfln = \relative do'' {

    R4.*4
    re8 dod16 si la sol
    fad la mi la re,8

    %7
    re' dod16 si la sol
    fad la mi la re,8
    re' mi, dod'\tr

    %10
    re4 r8
    re, re' re
    re re' re

    %13
    sol, sol4
    fad r8
    re, re re

    %16
    R4.
    re8 re re
    R4.\mbreak

    %19
    re8 fad fad
    mi mi mi
    fad4 r8

    %22
    R4.*3
    re'8 dod16 si la sol
    fad la mi la re,8

    %27
    si' sol la
    re,4 r8
    R4.*6

    %35
    r8 mi' mi
    \once\tieDashed mi4.~
    mi4 r8

    %38
    R4.
    r8 la la
    \tieDashed la4.~

    %41
    la~
    la4 la8
    R4.*2\mbreak

    %45
    si,4 r8
    do4 r8
    si4 r8

    %48
    do4 r8
    si4 r8
    R4.

    %51
    fad'8 mi si
    dod4.
    la'8 sold16 fad mi re

    %54
    dod mi si mi la,8
    la' sold16 fad mi re
    dod mi si mi la,8

    %57
    R4.*4
    re8 dod16 si la sol
    fad la mi la re,8\mbreak

    %63
    re' dod16 si la sol
    fad la mi la re,8
    fad'8 fad fad

    %66
    fad fad fad
    mi mi mi
    mi mi mi

    %69
    re re re
    si' si si
    si si, si'

    %72
    si dod, si'
    lad dod, lad'
    si si, r

    %75
    R4.*2
    fad'4 r8
    sol4 r8\mbreak

    %79
    R4.*2
    mi4 r8
    fad4 r8

    %83
    fad4 r8
    fad4 r8
    mi si' fad

    %86
    sol4 r8
    si,4 r8
    si4 r8

    %89
    la mi' si
    do4 r8
    la'4 r8

    %92
    la4 r8
    la re la
    si4 r8

    %95
    r re, re
    sol4 r8
    r mi mi\mbreak

    %98
    la4 r8
    r fad fad
    si4 r8

    %101
    r r la
    la4 r8
    r la la

    %104
    la4 r8
    r fad fad
    fad4 r8

    %107
    sol16 fad sol8 sol
    sol\tr fad r
    sol4 fad8

    %110
    mi4\tr re8
    mi4 re8
    dod4\tr re8

    %113
    r r la'
    la4 r8\mbreak
    r r la
    la4 r8

    %117
    r re, dod
    re4 r8
    R4.*4

    %123
    r8 r la'
    la4 r8
    r r la

    %126
    la4 r8
    r re, dod
    re4 r8

    %129
    R4.
    r16 fad fad fad fad fad
    mi8 la la

    %132
    la4 fad,8
    mi mi mi
    fad16 la re re re dod\mbreak

    %135
    re la' la la sol la
    fad[la32 sol] la16 sol fad mi
    fad[la32 sol] la16 sol fad mi

    %138
    fad4.

}


IVvlIn = \relative do'' {

    \tuplet 3/2 { re,16\solo re re fad[fad fad] la la la
    re(mi fad) mi[(fad sol)]} fad8
    \tuplet 3/2 { fad,16 fad fad la[la la] re re re

    %4
    fad(sol la) sol[(la si)]} la8
    re,\tu dod16 si la sol
    fad la mi la re,8

    %7
    re' dod16 si la sol
    fad la mi la re,8
    re'16 re mi, mi dod' dod\mbreak

    %10
    re, re' re re re re
    re, re' re re re re
    re, re' re re re re

    %13
    sol8 sol4 \senza
    \tuplet 3/2 { fad16 re, mi fad[sol la] si dod re}
    re,8 re re

    %16
    \tuplet 3/2 { re'16 re, mi fad[sol la] si dod re }
    re,8 re re
    \tuplet 3/2 { re'16 re, mi fad[sol la] si dod re }

    %19
    re,8 fad16 fad fad fad\mbreak
    mi mi mi mi mi mi
    fad4 r8

    %22
    \con\tuplet 3/2 { la'16\solo(si la) } re8[la]
    \tuplet 3/2 { si16(la si) } re8[si]
    si\tr la r

    %25
    re,\tu dod16 si la sol
    fad la mi la re,8
    si' sol la

    %28
    re,4 r8
    R4.
    r8 sol sol,

    %31
    r re'' re,
    r sol sol,
    R4.\mbreak

    %34
    r16 la' fad' mi re dod
    si8 mi, mi'
    mi4.~

    %37
    mi
    R
    r8 la la

    %40
    la4.~
    la~
    la4 la8

    %43
    R4.*2
    si,4 r8
    do4 r8

    %47
    si4 r8
    do4 r8
    si4 r8

    %50
    mi4 r8
    r r sold
    la4.\mbreak

    %53
    la,8 sold16 fad mi re
    dod mi si mi la,8
    la' sold16 fad mi re

    %56
    dod mi si mi la,8
    \tuplet 3/2 { re16\solo re re fad[fad fad] la la la
    re(mi fad) mi[(fad sol)]} fad8

    %59
    \tuplet 3/2 { fad,16 fad fad la[la la] re re re
    fad(sol la) sol[(la si)]} la8
    re,\tu dod16 si la sol

    %62
    fad la mi la re,8\mbreak
    re' dod16 si la sol
    fad la mi la re,8

    %65
    fad'32 la, la la fad' [la, la la] fad' la, la la
    fad' si, si si fad'[si, si si] fad' si, si si
    mi si si si mi[si si si] mi si si si

    %68
    mi lad, lad lad mi'[lad, lad lad] mi' lad, lad lad
    re si si si re[si si si]\mbreak re si si si
    si' re, re re si'[re, re re] si' re, re re

    %71
    si' re, re re si'[re, re re] si' re, re re
    si' re, re re si'[re, re re] si' re, re re
    lad' dod, dod dod lad'[dod, dod dod] lad' dod, dod dod

    %74
    si'8 si, r
    R4.*2
    fad'4\pizz r8

    %78
    sol4 r8
    R4.*2
    mi4 r8

    %82
    fad4 r8
    fad4 r8
    fad4 r8

    %85
    mi si' fad\mbreak
    <sol si, mi,>4 r8
    si,4 r8

    %88
    si4 r8
    la mi' si
    <do mi, la,>4 r8

    %91
    la'4 r8
    la4 r8
    la re la

    %94
    <si re, sol, sol,>4 r8
    re, re re
    sol4 r8

    %97
    mi8 mi mi
    la4 r8
    fad fad fad

    %100
    si4 r8
    r r la
    la4 r8

    %103
    R4.*6
    sol8\pizz r fad
    mi r re

    %111
    mi r re
    dod4 r8\mbreak
    r r la'

    %114
    la4 r8
    r r la
    la4 r8

    %117
    R4.*2
    sol8 r fad
    mi r re

    %121
    mi r re
    dod4 r8
    r r la'

    %124
    la4 r8
    r r la
    la4 r8

    %127
    R4.*3
    r16 fad\f fad fad fad fad
    mi mi mi mi mi mi

    %132
    fad fad, fad fad fad fad
    mi mi mi mi mi mi
    fad8 re' dod

    %135
    <<{re <la fad> <la mi>
       <la fad> <la fad> <la mi>
       <la fad> <la fad> <la mi>

       %138
       <la fad>4.}\\{s8 re, dod
                     re re dod
                     re re dod
                     re4.}>>

}


IVvlIIn = \relative do'' {

    R4.*2
    \tuplet 3/2 { re,16\solo re re fad[fad fad] la la la
    re(mi fad) mi[(fad sol)]} fad8

    %5
    re\tu dod16 si la sol
    fad la mi la re,8
    re' dod16 si la sol

    %8
    fad la mi la re,8
    la'16 la si si mi, mi
    fad8 la' la

    %11
    si sol, si'
    la fad, la'
    dod,16 dod mi mi dod dod

    %14
    re4 r8
    re, re re
    R4.

    %17
    re8 re re
    R4.
    fad16 re re re re re

    %20
    re re re re dod dod\mbreak
    re4 r8
    \tuplet 3/2 { fad'16(sol fad) } re8[fad]

    %23
    \tuplet 3/2 { sol16(fad sol) } si8[sol]
    sol\tr fad r
    re\tu dod16 si la sol

    %26
    fad la mi la re,8
    si' sol la
    re,4 r8

    %29
    re4 r8
    sol,4 r8
    re'4 r8

    %32
    sol4 r8
    R4.*12
    sold4 r8

    %46
    la4 r8
    sold4 r8
    la4 r8\mbreak

    %49
    sold4 r8
    la4 r8
    r r mi'

    %52
    dod4.
    la8 sold16 fad mi re
    dod mi si mi la,8

    %55
    la' sold16 fad mi re
    dod mi si mi la,8
    R4.*2

    %59
    \tuplet 3/2 { re16\solo re re fad[fad fad] la la la
    re(mi fad) mi[(fad sol)]} fad8
    re\tu dod16 si la sol

    %62
    fad la mi la re,8\mbreak
    re' dod16 si la sol
    fad la mi la re,8

    %65
    re'16 re re re re re
    re re re re re re
    dod dod dod dod dod dod

    %68
    dod dod dod dod dod dod
    si si si si si si
    re re re re re re

    %71
    sold sold sold sold sold sold
    fad fad fad fad fad fad\mbreak
    mi mi mi mi mi mi

    %74
    re4 r8
    R4.*2
    si4\pizz r8

    %78
    si4 r8
    R4.*2
    la4 r8

    %82
    la4 r8
    red4 r8
    red4 r8

    %85
    si mi si
    <<<mi si>4\\mi,>> r8
    sold4 r8

    %88
    sold4 r8
    mi la mi
    <<<la mi>4\\la,>> r8

    %91
    fad''4 r8
    fad4 r8
    re la' re,

    %94
    <sol si, re,>4 r8\mbreak
    R4.
    si,8 si si

    %97
    dod4 r8
    dod dod dod
    re4 r8
    re re re

    %101
    la'4 r8
    la4 r8
    R4.*6

    %109
    si,8\pizz r la
    sol r fad
    sol r fad

    %112
    mi r re
    <<<la' mi>4\\dod,>> r8
    r r la'

    %115
    la4 r8
    r r la
    la4 r8

    %118
    R4.\mbreak
    si8 r la
    sol r fad

    %121
    sol r fad
    mi r re
    <<<la' mi>4\\dod,>> r8

    %124
    r r la'
    la4 r8
    r r la

    %127
    la4 r8
    R4.*2
    r16 re \f re re re re

    %131
    re re re re dod dod
    re re, re re re re
    re re re re dod dod

    %134
    re fad' fad fad mi mi\mbreak
    re re mi, mi mi mi
    <<{fad8 <la fad> <la mi>

       %137
       <la fad> <la fad> <la mi>
       <la fad>4.}\\{s8 re, dod
                     re re dod
                     re4.}>>

}


IVvlIIIn = \relative do'' {

    R4.*4
    re8 dod16 si la sol
    fad la mi la re,8

    %7
    re' dod16 si la sol
    fad la mi la re,8
    re'16 re mi, mi dod' dod

    %10
    re re, fad re fad re
    sol, sol' si sol si sol
    fad re fad re fad re

    %13
    mi mi dod dod la la
    re4 r8
    re re re

    %16
    R4.
    re8 re re
    R4.

    %19
    re16 fad fad fad fad fad
    mi mi mi mi mi mi
    fad4 r8\mbreak

    %22
    R4.*3
    re'8 dod16 si la sol
    fad la mi la re,8

    %27
    si' sol la
    re,4 r8
    re4 r8

    %30
    sol,4 r8
    re'4 r8
    sol4 r8

    %33
    R4.*12
    si4 r8
    do4 r8

    %47
    si4 r8
    do4 r8
    si4 r8

    %50
    mi4 r8
    r r sold
    la4.\mbreak

    %53
    la,8 sold16 fad mi re
    dod mi si mi la,8
    la' sold16 fad mi re

    %56
    dod mi si mi la,8
    R4.*4
    re'8 dod16 si la sol

    %62
    fad la mi la re,8
    re'8 dod16 si la sol
    fad la mi la re,8

    %65
    fad'16 fad fad fad fad fad
    fad fad fad fad fad fad
    mi mi mi mi mi mi

    %68
    mi mi mi mi mi mi
    re re re re re re
    si' si si si si si

    %71
    si si si si si si
    si si si si si si
    lad lad lad lad lad lad\mbreak

    %74
    si4 r8
    R4.*2
    red,4\pizz r8

    %78
    mi4 r8
    R4.*2
    dod4 r8

    %82
    re4 r8
    fad4 r8
    fad4 r8

    %85
    mi si fad'
    sol4 r8
    si,4 r8

    %88
    si4 r8
    la mi si'
    do4 r8

    %91
    la'4 r8
    la4 r8\mbreak
    la re, la'

    %94
    si4 r8
    R4.
    sol8 sol sol

    %97
    mi4 r8
    la la la
    fad4 r8

    %100
    si si si
    re r la
    la,4 r8

    %103
    R4.*6
    sol'8 r fad
    mi r re

    %111
    mi r re
    dod4 r8\mbreak
    r r la'

    %114
    la4 r8
    r r la
    la4 r8

    %117
    R4.*2
    sol8 r fad
    mi r re

    %121
    mi r re
    dod4 r8
    r r la'

    %124
    la4 r8
    r r la
    la4 r8

    %127
    R4.*3
    r16 fad\f fad fad fad fad\mbreak
    mi mi mi mi mi mi

    %132
    fad fad, fad fad fad fad
    mi mi mi mi mi mi
    fad re' re re re dod

    %135
    re re, re re dod dod
    <<{re8 <la' fad> <la mi>
       <la fad> <la fad> <la mi>

       %138
       <la fad>4.}\\{s8 re, dod
                     re re dod
                     re4.}>>

}


IVvlan = \relative do' {

    R4.*4
    re'8 dod16 si la sol
    fad la mi la re,8

    %7
    re'8 dod16 si la sol
    fad la mi la re,8
    re re la

    %10
    la re re
    r re re
    r re re

    %13
    r la' la
    la4 r8
    la, la la

    %16
    R4.
    si8 si si
    R4.

    %19
    la8 la la\mbreak
    si si la
    la4 r8

    %22
    R4.*3
    re'8 dod16 si la sol
    fad la mi la re,8

    %27
    si' sol la
    re,4 r8
    R4.*16

    %45
    mi4 r8
    fad4 r8
    mi4 r8

    %48
    fad4 r8
    mi4 r8
    la4 r8

    %51
    r r mi
    mi4.
    la8 sold16 fad mi re

    %54
    dod mi si mi la,8
    la' sold16 fad mi re
    dod mi si mi la,8

    %57
    R4.*4
    re'8 dod16 si la sol
    fad la mi la re,8\mbreak

    %63
    re' dod16 si la sol
    fad la mi la re,8
    la' la la

    %66
    si si si
    si si si
    lad lad lad

    %69
    fad fad fad
    sol sol sol
    sold sold sold

    %72
    dod, dod dod
    fad fad fad\mbreak
    fad4 r8

    %75
    R4.*2
    si,4\pizz r8
    mi4 r8

    %79
    R4.*2
    la,4 r8
    re4 r8

    %83
    si'4 r8
    si4 r8
    si r si

    %86
    si4 r8
    mi,4 r8
    mi4 r8

    %89
    mi r mi
    mi4 r8
    re4 r8

    %92
    re4 r8
    re r re
    re4 r8

    %95
    R4.
    mi8 mi mi
    mi4 r8\mbreak

    %98
    fad fad fad
    fad4 r8
    sol sol sol

    %101
    re r fad
    mi4 r8
    R4.*6

    %109
    si'8\pizz r la
    sol r fad
    sol r fad

    %112
    mi r re
    la'4 r8
    r r la

    %115
    fad4 r8
    r r la
    fad4 r8

    %118
    R4.
    si8 r la
    sol r fad

    %121
    sol r fad\mbreak
    mi r re
    la'4 r8

    %124
    r r la
    fad4 r8
    r r la

    %127
    la4 r8
    R4.*2
    r8 la la

    %131
    si la la
    la la, la'
    si, la la

    %134
    la la' la
    re, si' la
    la la la

    %137
    la la la
    <<la4.\\re,>>

}


IVvcn = \relative do {

    R4.*4
    re'8 dod16 si la sol
    fad la mi la re,8

    %7
    re'8 dod16 si la sol
    fad la mi la re,8
    fad, sol la

    %10
    re,16 re' fad re fad re
    sol, sol' si sol si sol
    fad re fad re fad re

    %13
    mi mi dod dod la la
    re4.
    fad8 fad fad

    %16
    R4.
    sol8 sol sol
    R4.

    %19
    fad8 fad fad
    sol sol la
    re,4 r8

    %22
    R4.*3
    re'8 dod16 si la sol
    fad la mi la re,8

    %27
    si' sol la
    re,4 r8
    R4.*16

    %45
    mi4 r8
    red4 r8
    mi4 r8

    %48
    red4 r8
    re!4 r8
    dod si la

    %51
    re mi mi,\mbreak
    la4.
    la'8 sold16 fad mi re\mbreak

    %54
    \stemDown dod mi si mi la,8\stemNeutral
    la'8 sold16 fad mi re
    \stemDown dod mi si mi la,8\stemNeutral

    %57
    R4.*4
    re'8 dod16 si la sol
    fad la mi la re,8

    %63
    re'8 dod16 si la sol
    fad la mi la re,8
    re'8 re re

    %66
    sold, sold sold
    dod dod dod\mbreak
    fad, fad fad

    %69
    si si si
    sol? sol sol
    mid mid mid

    %72
    fad fad fad
    fad, fad fad
    si4 r8

    %75
    R4.*2
    si'4\pizz r8
    mi4 r8

    %79
    R4.*2
    la,4 r8
    re4 r8

    %83
    si4 r8
    la4 r8
    sol4 red8

    %86
    mi4 r8
    mi'4 r8
    re4 r8

    %89
    do4 sold8\mbreak
    la4 r8
    re4 r8

    %92
    do4 r8
    si4 fad8
    sol4 r8

    %95
    R4.
    mi8 mi mi
    la4 r8

    %98
    fad fad fad
    si4 r8
    sol sol sol

    %101
    re'8 r re,
    la'4 r8
    R4.*10

    %113
    la4\pizz r8
    r r la
    re, r r\mbreak

    %116
    r r la'
    re,4 r8
    R4.

    %119
    si'8 r la
    sol r fad
    sol r fad

    %122
    mi r re
    la'4 r8
    r r la

    %125
    re, r r
    r r la'
    re,4 r8

    %128
    R4.
    re8\f re re
    re re' re

    %131
    sol,8 la la
    re,4 re8
    sol, la la\mbreak

    %134
    \once\stemUp re, re'' la
    si sol la
    re,16 re re re la la

    %137
    re re re re la la
    re4.

}

IVmdn = \relative do'' { \override TupletBracket.bracket-visibility = ##f

    s4.*28
    \stemUp la'8 la8.\tr(sol32 la)
    si16 sol re sol si sol

    %31
    la8 la8.\tr(sol32 la)\mbreak
    \stemNeutral si16(la) sol(fad) mi(re)
    dod la re la mi' la,

    %34
    fad'(mi) re(dod) si(la)
    sold mi la mi si' mi,
    dod'8 si mi

    %37
    dod\tr si mi
    \tuplet 3/2 { dod16(si la) re[(dod si)] mi(re dod) }
    fad8 mi la\mbreak

    %40
    fad\tr mi la\staccatissimo
    fad\tr mi la\staccatissimo
    fad4\tr mi8\staccatissimo

    %43
    re4\tr dod8\staccatissimo
    si4.\tr
    \tuplet 3/2 { mi,16 sold si mi,[sold si] mi, sold si\senza

    %46
    fad la do fad,[la do] fad, la do
    mi, sold si mi,[sold si] mi ,sold si
    fad la do fad,[la do] fad, la do

    %49
    mi, sold si mi,[sold si] mi, sold si
    mi fad mi re[mi re] dod re mi
    fad sold la mi[re' dod] si la sold}

    %52
    la4.\prallmordent
    la,8\tu sold16 fad mi re\mbreak
    \stemUp dod mi si mi\giu la,8\stemNeutral

    %55
    \su la' sold16 fad mi re
    \stemUp dod mi si mi\giu la,8\stemNeutral
    \su R4.*4

    %61
    re'8 dod16 si la sol
    fad la mi la re,8
    re'8 dod16 si la sol

    %64
    fad la mi la re,8
    s4.*10
    \stemUp fad'16\solo si, si' si, fad' si,

    %76
    sol' si, si' si, sol' si,
    fad' si, si' si, fad' si,
    sol' si, si' si, sol' si,

    %79
    mi la, la' la, mi' la,\mbreak
    fad' la, la' la, fad' la,
    mi' la, la' la, mi' la,

    %82
    fad'32(re mi fad sol la si dod \stemDown re8\noBeam)\stemNeutral
    r16 si, red si red si
    fad' si, red si fad' si,

    %85
    mi si si' si, fad' si,
    sol' si sol mi si8
    r16 mi, sold mi sold mi

    %88
    si' mi, sold mi si' mi,\mbreak
    la mi mi' mi, si' mi,
    do'32(la si do re mi fad sold la8\noBeam)

    %91
    r16 re,, fad re fad re
    la' re, fad re la' re,
    sol re re' re, la' la,

    %94
    si'32(sol la si do re mi fad sol8\noBeam)
    \con \tuplet 3/2 { re16\tu(do si) } re[si re si]
    \tuplet 3/2 { sol'16(fad mi) } sol [mi sol mi]\mbreak

    %97
    \tuplet 3/2 { mi(re dod?) } mi[dod mi dod]
    \tuplet 3/2 { la'(sol fad) } la[fad la fad]
    \tuplet 3/2 { fad(mi re)} fad[re fad re]

    %100
    \tuplet 3/2 { si'(la sol) } si[sol si sol]
    la sol la8 re
    dod4\tr <<{la8\solo

              %103
              sol sol sol}\\{fad
                             fad mi mi}>>
    fad16 mi re mi fad8
    <<{mi mi mi}\\{re dod dod}>>

    %106
    re16 dod si dod re8\mbreak
    si'16 la si8 si
    si\tr la r

    %109
    sol16(fad) sol(la) fad(sol)
    mi4\tr re8
    mi16(re) mi(fad) re(mi)

    %112
    dod4\tr re8
    \tuplet 3/2 { sol16 fad mi sol[fad mi] sol fad mi
    \senza fad mi re fad[mi re] sol fad mi

    %115
    fad mi re fad[mi re] sol fad mi
    fad mi re fad[mi re] sol fad mi
    fad mi re} \stemUp fad8 [mi\tr]

    %118
    <<<re la>4.\\fad,>>
    sol16\tu(fad) sol(la) fad(sol)
    mi4\tr re8

    %121
    mi16(re) mi(fad) re(mi)
    dod4\tr re8
    <<{s4 dod'8

       %124
       re r s
       s s dod8
       re r s}\\{\override TupletBracket.bracket-visibility = ##f \senza \tuplet 3/2 { sol,16 fad mi sol[fad mi] sol fad mi
                 fad mi re fad[mi re] sol fad mi\mbreak
                 fad  mi re fad[mi re] sol fad mi
                 fad mi re fad[mi re] sol fad mi}}>>

    %127
    \tuplet 3/2 { fad mi re } fad8[mi\tr]
    \stemNeutral re16 la' re\solo dod re dod
    re la' re dod re dod

    %130
    re4 r8
    s4.*8

}

IVmsn = \relative do {

    R4.*4
    re'8 dod16 si la sol
    fad la mi la re,8

    %7
    re'8 dod16 si la sol
    fad la mi la re,8
    fad, sol la

    %10
    re, re' re
    sol sol sol
    fad fad fad

    %13
    mi16 mi dod dod la la
    re4 r8
    fad fad fad

    %16
    R4.\mbreak
    sol8 sol sol
    R4.

    %19
    fad8 fad fad
    sol sol la
    re,4 r8

    %22
    R4.*3
    re'8 dod16 si la sol
    fad la mi la re,8

    %27
    si' sol la
    re,4 r8\su
    \stemDown re' fad re

    %30
    sol\giu\stemUp sol, r\su
    \stemDown re' fad re
    sol\giu\stemUp sol, r

    %33
    \stemNeutral la si dod
    re re, r
    mi fad sold

    %36
    la,16 mi' sold, mi' mi, mi'
    la, mi' sold, mi' mi, mi'
    la,8 si dod

    %39
    re16 la' dod, la' la, la'\mbreak
    re, la' dod, la' la, la'
    re, la' dod, la' la, la'

    %42
    re, la' re, la' dod, la'
    <<{r8 sold la
       sold4.

       %45
       <si sold>8 <si sold> <si sold>
       fad fad fad
       <si sold> <si sold> <si sold>\mbreak

       %48
       red, red red
       re! re re}\\{si4 la8
                   mi'4.
                   mi8 mi mi
                   red red red
                   mi mi mi
                   red, red red
                   re! re re}>>
    dod' si la

    %51
    re mi  mi,
    la4.
    la'8 sold16 fad mi re\mbreak

    %54
    \stemDown dod mi si mi la,8\stemNeutral
    la'8 sold16 fad mi re
    \stemDown dod mi si mi la,8\stemNeutral

    %57
    R4.*4
    re'8 dod16 si la sol
    fad la mi la re,8

    %63
    re'8 dod16 si la sol
    fad la mi la re,8
    re'8 re re

    %66
    sold, sold sold
    dod dod dod\mbreak
    fad, fad fad

    %69
    si si si
    sol? sol sol
    mid mid mid

    %72
    fad fad fad
    fad, fad fad
    si4.

    %75
    \su\stemDown red'8 fad red
    mi sol mi
    red fad red

    %78
    mi sol mi
    dod mi dod\mbreak
    re fad re

    %81
    dod mi dod
    re4 r8
    \giu\stemNeutral si si si

    %84
    la la la
    sol sol red
    <<mi4\\\stemUp \shiftOn  mi,>> r8

    %87
    mi' mi mi
    re re re\mbreak
    do do sold

    %90
    la4 r8
    re re re
    do do do

    %93
    si si fad
    sol4 r8
    sol' sol sol

    %96
    mi mi mi\mbreak
    la la la
    fad fad fad

    %99
    si si si
    sol sol sol
    re'4 re,8

    %102
    la'4 re8
    si dod16 si dod la
    re4 re8

    %105
    sold, lad16 sold lad fad
    si4 si8\mbreak
    sol16 re' sol, re' sol, re'

    %108
    re,4 r8
    \clef violin\key re\major <<{re''4 dod8
                                 si4 la8

                                 %111
                                 si4 la8
                                 sol4 fad8
                                 la4}\\{si4 la8
                                        sol4 fad8
                                        sol4 fad8
                                        mi4 re8
                                        \stemUp\shiftOn dod4}>> dod''8

    %114
    re r dod,,
    re r dod''\mbreak
    re4\clef bass \key re\major dod,,8

    %117
    \stemDown re\su la'\giu\stemUp la,\stemNeutral
    <<{\once\stemDown \shiftOn re4.
       re4 dod8

       %120
       si4 la8
       si4 la8
       sol4 fad8

       %123
       \stemDown \shiftOn la4}\\{re,4.
              si'4 la8
              sol4 fad8
              sol4 fad8
              mi4 re8
              dod4}>> r8
    s4 dod8\mbreak
    re4 r8

    %126
    s4 dod8
    re la' la,
    <<{re4 r8

       %129
       re re re
       re re' re}\\{re,,4 r8
                             re re re
                             re4}>>
    sol'8 la la

    %132
    re,4 re8
    sol, la la\mbreak
    \once\stemUp re, re'' la

    %135
    si sol la
    re, re la
    re re la

    %138
    re4.

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*8
    <6>8 <6 5> s
    s4.
    s
    <6>
    <6>
    s <6>
    s
    s
    s
    <6>
    <6 5>
    s4.*45
    <7>4.
    <7>
    <7 _+>
    s
    s
    <7/>
    <4>
    <7 _+>
    s4.*57
    <6 5>4.
    s
    <6 5>
    s4 <7>8
    <5> <6 5>



}


forma = {

    \time 3/8
    \tempo 2 = 45
    \key re\major
    s4.*52
    \bar":..:"\break
    s4.*86
    \bar ":|."

}

IVfl = {
    \IVglobal
    %\notypeset
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

IVvlIII = {
    \IVglobal
    <<\IVvlIIIn \forma>>

}

IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>

}

IVvc = {
    \IVglobal
    \clef bass
    <<\IVvcn \forma>>

}

IVmd = {
    \IVglobal
    \context Staff = up
    <<\IVmdn \forma>>

}

IVms = {
    \IVglobal
    \clef bass
    \context Staff = down
    <<\IVmsn \forma \IVbfn>>
    \typeset

}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

    systems-per-page = #2
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge {[1.] Allegro}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"Flauto""ad libitum"}
            \Ifl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
            \IvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
            \IvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Terzo"}
            \IvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Alto""Viola"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \Ivc
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"harpsichord"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Cimbalo""o Organo"}
                \Imd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \Ims
            >>
        >>
    >>

    \layout {

        indent = 2\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
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

\markup \huge {[2.] Aria Andante}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IIfl
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
            \set Staff.midiInstrument = #"violin"
            \IIvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvc
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"harpsichord"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IImd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IIms
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
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

\markup \huge {[3.] Adagio}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IIIfl
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
            \set Staff.midiInstrument = #"violin"
            \IIIvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvc
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"harpsichord"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IIImd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IIIms
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
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

\markup \huge {[4.] Allegro}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IVfl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IVvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IVvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IVvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IVvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IVvc
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"harpsichord"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IVmd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IVms
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}
