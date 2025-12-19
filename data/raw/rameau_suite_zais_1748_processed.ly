\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down
tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"doux"

ten = _\markup \italic \center-align "ten"

pia = _\markup \italic "pia."

fort = _\markup \italic "fort"

leg = _\markup\italic"léger"

arco = _\markup \italic "arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "tous"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

cesura = \override BreathingSign.Text = #(make-musicglyph-markup "scripts.caesura")

quarto = \tupletSpan 4

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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \override Score.RehearsalMark.Y-offset = #-5
    \override Score.RehearsalMark.X-offset = #+6
    \senza
}

IflIn = \relative do'' {

    R1*13
    \key mi\minor R1*30
    R2.*11

    %55
    la'16_\markup\italic"2 Petites Flȗtes"^\markup\italic"Sallantine et Blavet" si dod si la si dod si la si dod si
    la si dod si la si dod la si dod re dod
    si dod re dod si la sold fad mi re dod si

    %58
    la2 r4
    R2.*2
    r8 la'16(sold) la[(sold)] la(sold) la[mi fad sol]\mbreak

    %62
    fad8 r r4 r
    r4 r r8 r32 la, si dod
    re4 r8 la32 si dod re mi16. la,32 si dod re mi

    %65
    fad8 r r4 r
    r mi'16 re dod re mi4
    R2.

    %68
    r4 re16 dod si dod re4
    R2.
    r4 dod16 si lad si dod4\mbreak

    %71
    R2.*2
    r4 r r8 fad,16 re
    si4 r r8 sol'16 mi

    %75
    si4 r r8 fad'16 re
    si4 r r8 sol'16 mi
    si4 r r8 fad'16 re

    %78
    si4 si'2
    dod,8. re16 dod4.-+ si8
    si2 r4

    %81
    fad'16(sol) fad[(sol)] la(sol) la[(sol)] la(sol) la[(sol)]
    fad(sol) fad[(sol)] la(sol) la[(sol)] la(sol) la[(sol)]
    fad4 r r

    %84
    r si re
    r la re
    r re dod-+

    %87
    re \tuplet 3/2 { la8(sol fad) fad[(mi re)] }
    re2-+ r4
    r \tuplet 3/2 { si'8(la sol) sol[(fad mi)] }

    %90
    mi2-+ r4
    r \tuplet 3/2 { dod'8(si la) la[(sol fad)] }
    fad2-+ r4

    %93
    r \tuplet 3/2 { re'8(dod si) si[(la sol)] }
    sol4 r r16 r32 mi fad sol la si
    dod4 r8 r32 la si dod re8.[\tuplet 3/2 { fad,32 mi re ]}

    %96
    la'4 r r16 r32 mi, fad sol la si
    dod4 r8 r32 la si dod re8.[\tuplet 3/2 { fad,32 mi re] }
    la'4 r r

    %99
    r8 si' sold mi r4
    r32 la sold fad mi re dod si la8 r r4
    r4 r r8 la'16 fad

    %102
    re2 r8 si'16 sol
    re2 r8 la'16 fad
    re4. mi16[fad sol la si dod]

    %105
    re4 r  la~
    la4. sol16 fad sol4
    sol~sol4.-+(fad16 sol)

    %108
    fad2-+ r4
    r r la\mbreak
    la2.-+~

    %111
    la~
    la2 r16 re, fad la
    re8 r r4 r

    %114
    R2. re8 r r4 r

}

IflIIn = \relative do'' {

    R1*13
    \key mi\minor R1*30
    R2.*11

    %55
    la'16 si dod si la si dod si la si dod si
    la si dod si la si dod la si dod re dod
    si dod re dod si la sold fad mi re dod si

    %58
    la2 r4
    R2.*2
    r8 la'16(sold) la[(sold)] la(sold) la[mi fad sol]\mbreak

    %62
    fad8 r r4 r
    r4 r r8 r32 la, si dod
    re4 r8 la32 si dod re mi16. la,32 si dod re mi

    %65
    fad8 r r4 r
    r dod'16 si la si dod4
    R2.
    r4 si16 la sold la si4
    R2.
    r4 lad16 sold fad sold lad4
    R2.*2
    r4 r r8 fad 16 re
    si4 r r8 sol'16 mi

    %75
    si4 r r8 fad'16 re
    si4 r r8 sol'16 mi
    si4 r r8 fad'16 re

    %78
    si4 si'2
    dod,8. re16 dod4.-+ si8
    si2 r4

    %81
    re16(mi) re[(mi)] fad(mi) fad[(mi)] fad(mi) fad[(mi)]
    re(mi) re[(mi)] fad(mi) fad[(mi)] fad(mi) fad[(mi)]
    re4 r r
    r sol si
    r fad la
    r mi mi-+
    re \tuplet 3/2 { fad8(mi re) fad[(mi re)] }
    si2-+ r4\mbreak
    r \tuplet 3/2 { sol'8(fad mi) mi[(re dod)] }
    dod2-+ r4
    r \tuplet 3/2 { la'8(sol fad) fad[(mi re)] }
    re2-+ r4
    r \tuplet 3/2 { si'8(la sol) sol[(fad mi)] }
    dod4 r r16 r32 mi fad sol la si
    dod4 r8 r32 la si dod re8.[\tuplet 3/2 { fad,32 mi re ]}

    %96
    la'4 r r16 r32 mi, fad sol la si
    dod4 r8 r32 la si dod re8.[\tuplet 3/2 { fad,32 mi re] }
    la'4 r r

    %99
    r8 si' sold mi r4
    r32 la sold fad mi re dod si la8 r r4
    r4 r r8 la'16 fad

    %102
    re2 r8 si'16 sol
    re2 r8 la'16 fad
    re4. mi16[fad sol la si dod]

    %105
    re4 r fad,~
    fad4. mi16 re mi4
    mi~mi2-+
    re2-+ r4
    r r fad
    fad2.-+~
    fad~
    fad2 r16 re fad la
    re8 r r4 r
    R2. re8 r r4 r

}

IvlIn = \relative do'' {

    \override BreathingSign.text =
    \markup { \musicglyph "scripts.caesura.curved" }

    R1
    r16 <la re,> <la re,>4. r2
    r r4 r8 r16 la,

    %4
    re8 r fad r r4 r8 r16 la,
    la8-. re-. fad-. la-. re4 r8 r16 re,
    dod8-. dod-. r4 r2

    %7
    r8 r16 sold' si4 r8 r16 sold la4\mbreak
    r2 r8 r16 fad mid8 sold
    R1

    %10
    r16 fa' mib reb do [sib lab sol]\mbreak lab lab lab lab do [do do do]
    do,4 r8 r16 do do4 r8 do16 do
    do4 r do r8 do16 do

    %13
    do8-. do-. r4 r2
    4 r16 si_\markup\italic"plus veste" mi si sol' mi si' sol mi'[si sol' mi]
    si'4 r r2

    %16
    r16 si la sol fad [mi red dod] si la sol fad mi [red dod si]
    la8. do!16 do8. red16 red8. fad16 fad8. la16
    la8. do16 do8. red16 red8. fad16 fad8. la16

    %19
    la8. do16 do2 r16 do, si la\mbreak
    sold8-. sold-. sold-. sold-. r4 r16 sold lad si
    lad4 r r8 r16 lad dod [dod mi mi]

    %22
    sol!2. r16 sol fad mi
    red si' la sol fad [mi red dod] si la sol fad mi [red dod si]
    R1*2

    %26
    r16 re re re sol [sol si si] si re, re re sol [sol si si]
    re sol, sol sol si [si re re] re sol, sol sol si [si re re]
    sol re re re sol [sol si si] si sol sol sol si [si re re]\mbreak

    %29
    re2. r8 r16 re
    dod re mi re dod [re mi re] dod re mi re dod [si la sol]
    fad re' dod si la [si la sol] fad re' dod si la [si la sol]
    fad re'  dod si la [sol fad mi] re la' sol fad mi [re dod si]

    %33
    la re dod si la [sol fad mi] re8 r r4
    R1
    r16 re fad re fad [re fad re] fad re fad re fad [re fad re]
    sol re sol re sol [re sol re] sold mi sold mi sold [mi sold mi]

    %37
    la mi la mi la [mi la mi]\mbreak lad fad lad fad lad [fad lad fad]
    si8 r r4 r16 re re si si [sold sold la]
    la do do la la [fad fad sol!] sol si si sol sol [mi mi dod!]

    %40
    dod8 la16 la si [si dod dod ]re re mi mi fad [fad sol sol]
    fad re' re re re [re re re] re re re re re [re re re]
    re4. \tuplet 3/4 { re32 dod si } dod4. \tuplet 3/4 { dod32 re mi }

    %43
    si2 si-+
    la8 r r4 r
    r16 re, mi fad sol la si dod re  mi fad re

    %46
    la fad sol la si dod re mi fad sol la fad
    mi8 la la la la re
    dod16 la sol fad mi re dod si la sol fad mi

    %49
    \once\stemUp re re'' dod si la sol fad mi re dod si la
    si dod re dod si la sol fad mi re dod si
    la si dod re mi fad sol mi la mi fad sol

    %52
    fad4 r r
     r16 re'' re re re re re re re re re re
    re4 r r

    %55
    r16 dod dod dod dod dod dod dod dod dod dod dod
    dod dod dod dod dod dod dod dod si si si si
    si si si si si si si si re re re re

    %58
    dod4 r r
    r r r8 r32 mi,,32 fad  sold
    la4 r8 mi32 fad sold la si16.[mi,32 fad sold la si]

    %61
    dod8 r r4 r8 r32 la si dod\mbreak
    re4 r8 la32 si dod re mi16. la,32 si dod re mi
    fad8 r r4 r

    %64
    R2.
    re'16 re re re re re re re re re re re
    re4 dod r

    %67
    dod16 dod dod dod dod dod dod dod dod dod dod dod
    dod4 si r
    si16 si si si si si si si si si si si

    %70
    si4 lad r\mbreak
    r4 r r32 fad mi re dod si lad sold
    fad8 r r4 r

    %73
    r16 fad' si re si fad si re si fad si re
    sol,8\dolce mi dod [si] lad dod\breathe
    si16\fort fad' si re si fad si re si fad si re

    %76
    sol,8\dolce mi dod si lad[dod]\breathe
    si16_\markup\italic "[fort]" fad' si re si fad si re si fad si re
    sol, la si la sol la sol fad mi fad mi re

    %79
    dod8. re16 dod4.-+ si8
    si16 si, dod re mi fad sold lad si dod re si\mbreak
    fad4 r r

    %82
    R2.
    r16 re'' dod si la sol fad mi re dod si la
    si sol re sol si sol re sol si si la sol

    %85
    la fad re fad la fad re fad la la sol fad
    sol mi la, mi' sol mi la, mi' sol sol fad_+ mi
    fad re mi fad sol la si dod re mi fad re

    %88
    si re, mi fad sol la si dod re mi fad re\breathe\mbreak
   \once\stemDown sol mi, fad sol la si dod re mi fad sol mi
    dod mi, fad sol la si dod re mi fad sol mi

    %91
    la fad, sol la si dod re mi fad sol la fad
    re fad, sol la si dod re mi fad sol la fad
    \once\stemDown si sol, la si dod re mi fad sol la si sol\mbreak

    %94
    mi4 r <la, la'>16_\markup\italic"à 2 cordes" <la la'> <la la'> <la la'>
    <la sol'> <la sol'> <la sol'> <la sol'> <la sol'> <la sol'> <la sol'> <la sol'> <la fad'> <la fad'> <la fad'> <la fad'>
    <la mi'>4 r4\breathe <la, la'>16\dolce <la la'> <la la'> <la la'>

    %97
    <la sol'> <la sol'> <la sol'> <la sol'> <la sol'> <la sol'> <la sol'> <la sol'> <la fad'> <la fad'> <la fad'> <la fad'>
    <la mi'>4 \breathe r16 r32 dod'\fort re mi fad sold la16. re,32 mi fad sold la
    si4 r16 r32 re, mi fad sold la si16. mi,32  fad sold la si

    %100
    dod8 r r4 r\mbreak
    re16\dolce ^\markup\italic"cresc."\repeat unfold 79 {re16} dod dod dod dod
    re la si sol la fad sol mi fad re mi dod

    %109
    re la si sol  la fad sol mi fad re mi dod\mbreak
    re la fad' re la' fad re' la fad' re la' fad
    re la, fad' re la' fad re' la  fad' re la' fad

    %112
    re la re fad re la fad' la fad re fad la
    re re, dod si la sol fad mi re re dod si
    la8 r r4 r re''8 r r4 r

}

IvlIIn = \relative do'' {

    \override BreathingSign.text =
    \markup { \musicglyph "scripts.caesura.curved" }

    R1
    r16 <fad, la,> <fad la,>4. r2
    r r4 r8 r16 la,

    %4
    re8 r fad r r4 r8 r16 la,
    la8-. re-. fad-. la-. re4 r8 r16 si,
    lad8-. lad-. r4 r2

    %7
    r8 r16 mid' sold4 r8 r16 mid fad4
    r2 r8 r16 la, sold8 mid'
    R1

    %10
    r16 fa' mib reb do [sib lab sol] lab lab lab lab do [do do do]
    do,4 r8 r16 do do4 r8 do16 do
    do4 r do r8 do16 do

    %13
    do8-. do-. r4 r2
    r4 r16 si mi si sol' mi si' sol mi'[si sol' mi]
    si'4 r r2

    %16
    r16 si la sol fad [mi red dod] si la sol fad mi [red dod si]
    la8. do!16 do8. red16 red8. fad16 fad8. la16
    la8. do16 do8. red16 red8. fad16 fad8. la16

    %19
    la8. do16 do2 r16 do, si la\mbreak
    sold8-. sold-. sold-. sold-. r4 r16 sold lad si
    lad4 r r8 r16 lad dod [dod mi mi]

    %22
    sol!2. r16 sol fad mi
    red si' la sol fad [mi red dod] si la sol fad mi [red dod si]
    R1*2

    %26
    r16 re re re sol [sol si si] si re, re re sol [sol si si]
    re sol, sol sol si [si re re] re sol, sol sol si [si re re]
    sol re re re sol [sol si si] si sol sol sol si [si re re]\mbreak

    %29
    re2. r8 r16 re
    dod re mi re dod [re mi re] dod re mi re dod [si la sol]
    fad re' dod si la [si la sol] fad re' dod si la [si la sol]
    fad re'  dod si la [sol fad mi] re la' sol fad mi [re dod si]

    %33
    la re dod si la [sol fad mi] re8 r r4
    R1
    r16 re fad re fad [re fad re] fad re fad re fad [re fad re]
    sol re sol re sol [re sol re] sold mi sold mi sold [mi sold mi]

    %37
    la mi la mi la [mi la mi]\mbreak lad fad lad fad lad [fad lad fad]
    si8 r r4 r16 re re si si [sold sold la]
    la do do la la [fad fad sol!] sol si si sol sol [mi mi dod!]

    %40
    dod8 la16 la si [si dod dod ]re re mi mi fad [fad sol sol]
    fad re' re re re [re re re] re re re re re [re re re]
    re4. \tuplet 3/4 { re32 dod si } dod4. \tuplet 3/4 { dod32 re mi }

    %43
    si2 si-+
    la16 la, si dod re mi fad sol la mi fad sol
    fad4 r r

    %46
    r16 la si dod re mi fad sol la si dod la
    la, fad sol la si dod re mi fad sol la fad
    mi la sol fad mi re dod si la sol fad mi

    %49
    re4 r la'
    la sol si
    mi, r la,

    %52
    la2 r4
    r16 fad'' fad fad fad fad fad fad fad fad fad fad
    sold4 r r

    %55
    r16 la la la la la la la la la la la
    la la la la  la la la la  la la la la
    la la la la  la la la la sold sold sold sold

    %58
    la4 r r
    r r r8 r32 mi,32 fad  sold
    la4 r8 mi32 fad sold la si16.[mi,32 fad sold la si]

    %61
    dod8 r r4 r8 r32 la si dod\mbreak
    re4 r8 la32 si dod re mi16. la,32 si dod re mi
    fad8 r r4 r

    %64
    R2.
    fad16 fad fad fad fad fad fad fad fad fad fad fad
    fad4 mi r

    %67
    mi16 mi mi mi mi mi mi mi mi mi mi mi
    mi4 re r
    re16 re re re re re re re re re re re

    %70
    re4 dod r
    r r r32 fad mi re dod si lad sold
    fad8 r r4 r

    %73
    R2.
    r16 dod' mi sol mi dod mi sol mi dod mi sol
    fad8 re si[fad] re fad

    %76
    dod16 dod' mi sol mi dod mi sol mi dod mi sol
    fad8 re si[fad] re \once\stemDown fad'~
    fad4 mi16 fad mi re dod re dod si

    %79
    lad8. si16 lad4.-+ si8
    si16 si, dod re mi fad sold lad si dod re si
    fad4 r r

    %82
    R2.
    r16 re'' dod si la sol fad mi re dod si la
    si sol re sol si sol re sol si si la sol

    %85
    la fad re fad la fad re fad la la sol fad
    sol mi la, mi' sol mi la, mi' sol sol fad_+ mi
    fad re mi fad sol la si dod re mi fad re

    %88
    si re, mi fad sol la si dod re mi fad re\breathe\mbreak
    \once\stemDown sol mi, fad sol la si dod re mi fad sol mi
    dod mi, fad sol la si dod re mi fad sol mi

    %91
    la fad, sol la si dod re mi fad sol la fad
    re fad, sol la si dod re mi fad sol la fad
    \once\stemDown si sol, la si dod re mi fad sol la si sol\mbreak

    %94
    mi4 r <fad la,>16 <fad la,> <fad la,> <fad la,>
    <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,>  <re la> <re la > <re la> <re la>
    <dod la>4  r <la la,>16 <la la,> <la la,> <la la,>

    %97
    <mi la,> <mi la,> <mi la,> <mi la,> <mi la,> <mi la,> <mi la,> <mi la,> <re la> <re la> <re la> <re la>
    <dod la>4 r r
    r r16 r32 si' dod re mi fad sold16. dod,32 re mi fad sold

    %100
    la8 r r4 r
    re,16 re re re re re re re re re re re
    mi mi mi mi mi mi mi mi mi mi mi mi

    %103
    fad fad fad fad fad fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol sol sol sol sol
    la la la la la la la la la la la la

    %106
    \repeat unfold 12 {si}
    mi, mi mi mi mi mi mi mi sol sol sol sol
    fad fad sol mi fad re mi dod re fad sol mi

    %109
    re la si sol  fad re mi dod re fad sol mi
    re la fad' re la' fad re' la fad' re la' fad
    re la, fad' re la' fad re' la fad' re la' fad

    %112
    re la re fad re la fad' la fad re fad la
    re re, dod si la sol fad mi re re dod si
    la la[si dod] re mi fad sol la mi fad sol  re''8 r r4 r

}

Ivlan = \relative do' {

    R1
    r16 re re4. r2
    r r4 r8 r16 la

    %4
    re8 r fad r r4 r8 r16 la,
    la8-. re-. fad-. la-. re4 r8 r16 si,
    lad8 lad r4 r2

    %7
    r8 r16 mid sold4 r8 r16 mid fad4
    r2 r8 r16 la sold8 mid'
    r4 r8 r16 mi mi2

    %10
    fa, r
    r8 r16 lab sol4 r8 sib16 sib lab4
    r8 lab16 lab sol4 r8 sol16 sol fa8[fa]

    %13
    mi-. mi-. r8 mi16 mi mi4 r
    mi4 r r2
    r8 r16 mi'  mi8-. [mi-.] r4 r8 mi16 mi

    %16
    fad4 r r2
    R1*2
    r4 r8 r16 fad fad4 r

    %20
    si,8-. si-. si-. si-. r2
    mi8-. mi-. mi-. mi-. r2
    mi8 mi mi mi mi mi mi mi

    %23
    si4 r r r8 r16 sol!
    sol4 r sol r8 sol16 sol
    sol8 sol r4 r r8 r16 sol

    %26
    sol2 r
    R1
    r2 r4 r8 r16 sol'

    %29
    sol8 sol r4 r r8 r16 sol
    sol4 r r r8 r16 mi
    fad4 r r2

    %32
    R1*3
    do?8 do do do do do do do
    si si si si re re re re

    %37
    dod? dod dod dod mi mi mi mi
    re r r4 r8 re re re
    do do do do si si si si

    %40
    la2 r4 r8 r16 la
    re16 si si si si [si si si] si si si si si[si si si]
    mi4. \tuplet 3/4 { mi32 mi mi } la4. \tuplet 3/4 { dod,32 dod dod }

    %43
    re2 mi
    la16 la, si dod re mi fad sol la mi fad sol
    fad4 r r

    %46
    R2.
    r16 re, mi fad sol la si dod re mi fad re
    la la' la la la la la la la la la la

    %49
    la4 r re,
    re r re
    re r dod-+

    %52
    \clef violin \key re\major re2 r4
    r16 la' la la la la la la la la la re
    si2-+ si4

    %55
    mi, r mi'
    mi2 re4
    re2 si4-+

    %58
    \clef alto \key re\major dod,16(re) dod[(re)] mi(re) mi[(re)] mi(re) mi[(re)]
    dod(re) dod[(re)] mi(re) mi[(re)] mi(re) mi[(re)]
    dod4 la fad

    %61
    dod'8 r r4 r
    r re la
    fad16(sol) fad[(sol)] la(sol) la[(sol)] la(sol) la[(sol)]

    %64
    fad(sol) fad[(sol)] la(sol) la[(sol)] la(sol) la[(sol)]
    fad re mi fad sol la si dod re mi fad re
    la4 la r

    %67
    r16 fad sold lad si dod re mi fad8 lad,-+
    si4 si r
    r16 si dod re mi fad sol la si dod re si

    %70
    fad4 fad r
    r r r32 fad mi re dod si lad sold
    fad8 r r4 r

    %73
    r8 fad si re fad4
    r8 sol, si mi sol4
    r8 fad, si re fad4

    %76
    r8 sol, si mi sol4
    r8 fad, si re \clef violin \key re\major fad' [re]~
    re4 dod4.-+ sol'8

    %79
    fad4 fad,2
    si16 si, dod re mi fad sold lad si dod re si
    fad4 r r

    %82
    R2.
    r4 r fad'
    sol sol, sol'

    %85
    fad fad, fad'
    mi la la,
    la16 la la la la la la la la la la la

    %88
    la4 sol r
    r r sol~
    sol~\tuplet 3/2 { sol8 la sol fad[(sol mi)] }

    %91
    fad2 la4
    la2 re4
    re2 mi4

    %94
    <<dod\\la>> \clef alto \key re\major r la,16 la la la
    la la la la la la la la la la la la
    la4 r la16 la la la

    %97
    la la la la la la la la la la la la
    la4 r r
    r r r8\clef violin \key re\major r16 mi''

    %100
    mi4 r r
    la,16 la la la la la la la la la la la
    si si si si si si si si si si si si

    %103
    la la la la la la la la fad fad fad fad
    mi mi mi mi mi mi mi mi mi mi mi mi
    fad fad fad fad la la la la re re re re

    %106
    re re re re re re re re si si si si
    la la la la la la la la la la la la
    la2 r4

    %109
    la2 r4
    \clef alto \key re\major la,2 r4
    la2 r4

    %112
    fad'16 fad fad fad fad fad fad fad fad fad fad fad
    fad4 r r
    r16 la, si dod re mi fad sol la mi fad sol fad8 r r4 r

}

IobIn = \relative do'' {

    \override BreathingSign.text =
    \markup { \musicglyph "scripts.caesura.curved" }

    R1*6
    r8 r16 sold si4 r8 r16 sold la4\mbreak
    r2 r8 r16 fad mid8 sold

    %9
    R1*5
    \key mi\minor  R1*12
    r16 re re re sol [sol si si] si re, re re sol [sol si si]

    %27
    re sol, sol sol si [si re re] re sol, sol sol si [si re re]
    sol re re re sol [sol si si] si sol sol sol si [si re re]\mbreak
    re2. r8 r16 re

    %30
    dod re mi re dod [re mi re] dod re mi re dod [si la sol]
    fad re' dod si la [si la sol] fad re' dod si la [si la sol]
    fad re'  dod si la [sol fad mi] re la' sol fad mi [re dod si]

    %33
    la re dod si la [sol fad mi] re8 r r4
    R1
    r16 re fad re fad [re fad re] fad re fad re fad [re fad re]

    %36
    sol re sol re sol [re sol re] sold mi sold mi sold [mi sold mi]
    la mi la mi la [mi la mi]\mbreak lad fad lad fad lad [fad lad fad]
    si8 r r4 r16 re re si si [sold sold la]

    %39
    la do do la la [fad fad sol !] sol si si sol sol [mi mi dod!]
    dod8 la16 la si [si dod dod] re re mi mi fad [fad sol sol]
    fad re' re re re [re re re] re re re re re [re re re]

    %42
    re4. \tuplet 3/4 { re32 dod si } dod4. \tuplet 3/4 { dod32 re mi }
    si2 si-+
    la8 r r4 r

    %45
    R2.*8
    r16 si' la sol fad mi re dod si la sold fad
    mi mi fad sold la si dod re mi fad sold mi

    %55
    dod la si dod re mi fad sold la si dod mi,
    fad sold la sold fad mi re dod si la sold fad
    mi2 mi4

    %58
    mi2 r4
    r r r8 r32 mi fad sold
    la4 r8 mi32 fad sold la si16.[mi,32 fad sold la si]

    %61
    dod8 r r4 r8 r32 la si dod\mbreak
    re4 r8 la32 si dod re mi16. la,32 si dod re mi
    fad8 r r4 r

    %64
    R2.*2
    r16 la, si dod re mi fad sol la si dod la
    fad4 r r

    %68
    r16 si, dod re mi fad sold lad si dod re si
    fad4 r r
    r4 r8 r32 fad mi re dod8. \tuplet 3/2 { fad32 mi re }

    %71
    dod8 r r4 r
    R2.
    r4 r r8 fad16 re

    %74
    si4 r r8 sol'16 mi
    si4 r r8 fad'16 re
    si4 r r8 sol'16 mi

    %77
    si4 r r8 fad'16 re
    si4 si'2
    dod,8. re16 dod4.-+ si8

    %80
    si2 r4
    fad'16(sol) fad[(sol)] la(sol) la[(sol)] la(sol) la[(sol)]
    fad(sol) fad[(sol)] la(sol) la[(sol)] la(sol) la[(sol)]

    %83
    fad4 r r
    r si re
    r la re

    %86
    r re dod-+
    re \tuplet 3/2 { la8(sol fad) fad[(mi re)] }
    re2-+ r4

    %89
    r \tuplet 3/2 { si'8(la sol) sol[(fad mi)] }
    mi2-+ r4
    r \tuplet 3/2 { dod'8(si la) la[(sol fad)] }

    %92
    fad2-+ r4
    r \tuplet 3/2 { re'8(dod si) si[(la sol)] }
    sol4 r r16 r32 mi fad sol la si

    %95
    dod4 r8 r32 la si dod re8.[\tuplet 3/2 { fad,32 mi re ]}
    la'4 r r16 r32 mi, fad sol la si
    dod4 r8 r32 la si dod re8.[\tuplet 3/2 { fad,32 mi re] }

    %98
    la'4 r r
    r8 si' sold mi r4
    r32 la sold fad mi re dod si la8 r r4

    %101
    r8 la re fad la re
    r sol,, si re sol si
    r la, re fad la re

    %104
    r sol,, si re sol si
    r re,, fad la re fad
    r sol, si re4 sol8

    %107
    r la, dod mi la la,
    fad'2-+ r4
    r r la\mbreak

    %110
    la2.-+~
    la~
    la2 r16 re, fad la

    %113
    re8 r r4 r
    R2. re8 r r4 r

}

IobIIn =  \relative do'' {

    R1*6
    r8 r16 mid, sold4 r8 r16 mid fad4
    r2 r4 dod4

    %9
    R1*5
    \key mi\minor  R1*12
    r16 re re re sol [sol si si] si re, re re sol [sol si si]

    %27
    re sol, sol sol si [si re re] re sol, sol sol si [si re re]
    sol re re re sol [sol si si] si sol sol sol si [si re re]\mbreak
    re2. r8 r16 re

    %30
    dod re mi re dod [re mi re] dod re mi re dod [si la sol]
    fad re' dod si la [si la sol] fad re' dod si la [si la sol]
    fad re'  dod si la [sol fad mi] re la' sol fad mi [re dod si]

    %33
    la re dod si la [sol fad mi] re8 r r4
    R1
    r16 re fad re fad [re fad re] fad re fad re fad [re fad re]

    %36
    sol re sol re sol [re sol re] sold mi sold mi sold [mi sold mi]
    la mi la mi la [mi la mi]\mbreak lad fad lad fad lad [fad lad fad]
    si8 r r4 r16 re re si si [sold sold la]

    %39
    la do do la la [fad fad sol !] sol si si sol sol [mi mi dod!]
    dod8 la16 la si [si dod dod] re re mi mi fad [fad sol sol]
    fad re' re re re [re re re] re re re re re [re re re]

    %42
    re4. \tuplet 3/4 { re32 dod si } dod4. \tuplet 3/4 { dod32 re mi }
    si2 si-+
    la8 r r4 r

    %45
    R2.*8
    r16 si' la sol fad mi re dod si la sold fad
    mi mi fad sold la si dod re mi fad sold mi

    %55
    dod la si dod re mi fad sold la si dod mi,
    fad sold la sold fad mi re dod si la sold fad
    mi2 mi4

    %58
    mi2 r4
    r r r8 r32 mi fad sold
    la4 r8 mi32 fad sold la si16.[mi,32 fad sold la si]

    %61
    dod8 r r4 r8 r32 la si dod\mbreak
    re4 r8 la32 si dod re mi16. la,32 si dod re mi
    fad8 r r4 r

    %64
    R2.*2
    r16 la, si dod re mi fad sol la si dod la
    fad4 r r

    %68
    r16 si, dod re mi fad sold lad si dod re si
    fad4 r r
    r4 r8 r32 fad mi re dod8. \tuplet 3/2 { fad32 mi re }

    %71
    dod8 r r4 r
    R2.
    r4 r r8 fad16 re

    %74
    si4 r r8 sol'16 mi
    si4 r r8 fad'16 re
    si4 r r8 sol'16 mi

    %77
    si4 r r8 fad'16 re
    si4 si'2
    dod,8. re16 dod4.-+ si8

    %80
    si2 r4
    re16(mi) re[(mi)] fad(mi) fad[(mi)] fad(mi) fad[(mi)]
    re(mi) re[(mi)] fad(mi) fad[(mi)] fad(mi) fad[(mi)]

    %83
    re4 r r
    r sol si
    r fad la

    %86
    r mi mi-+
    re \tuplet 3/2 { fad8(mi re) fad[(mi re)] }
    si2-+ r4\mbreak

    %89
    r \tuplet 3/2 { sol'8(fad mi) mi[(re dod)] }
    dod2-+ r4
    r \tuplet 3/2 { la'8(sol fad) fad[(mi re)] }

    %92
    re2-+ r4
    r \tuplet 3/2 { si'8(la sol) sol[(fad mi)] }
    dod4 r r16 r32 mi fad sol la si

    %95
    dod4 r8 r32 la si dod re8.[\tuplet 3/2 { fad,32 mi re ]}
    la'4 r r16 r32 mi, fad sol la si
    dod4 r8 r32 la si dod re8.[\tuplet 3/2 { fad,32 mi re] }

    %98
    la'4 r r
    r8 si' sold mi r4
    r32 la sold fad mi re dod si la8 r r4

    %101
    r8 la re fad la re
    r sol,, si re sol si
    r la, re fad la re

    %104
    r sol,, si re sol si
    r re,, fad la re fad
    r sol, si re4 sol8

    %107
    r la, dod mi la la,
    re2-+ r4
    r r fad

    %110
    fad2.-+~
    fad~
    fad2 r16 re fad la

    %113
    re8 r r4 r
    R2. re8 r r4 r

}

IfgIn = \relative do {

    R1
    r16 re re4. r2
    R1

    %4
    re8 r re r r2
    re8-. fad la-. re-. fad4 r8 r16 re,
    fad8-. fad,-. r4 r r8 r16 dod'

    %7
    dod4 r8 dod16 dod dod4 r
    r16 dod dod dod dod [dod dod dod] dod4 r
    R1*2

    %11
    r8 r16 lab' sol4 r8 sib16 sib lab4
    r8 lab16 lab sol4 r8 sol16 sol  fa8 [fa]
    mi-. mi-. r4 r2

    %14
    R1
    \clef tenor \key mi\minor r8 r16  sol' sol8-.[sol-.] r4 r8 sol16 sol
    fad4 r r2

    %17
    R1*2
    r4 r8 r16 fad fad4 r
    si,8-. si-. si-. si-. r2

    %21
    mi8-. mi-. mi-. mi-. r2
    mi8 mi mi mi mi mi mi mi
    \clef bass \key mi\minor si,4 r r2

    %24
    R1
    r2 r4 r8 r16 sol
    sol2 r

    %27
    R1
    r2 r4 r8 r16 sol'
    mi8-. mi-. r4 r r8 r16 mi

    %30
    la4 r r r8 r16 la,
    re4 r r2
    R1*2

    %34
    do8 do do do do do do do
    do? do do do do do do do
    si si si si re re re re

    %37
    dod? dod dod dod mi mi mi mi
    re r r4 r8 re re re
    do do do do si si si si

    %40
    la2 r4 r8 r16 la
    re16 si si si si [si si si] si si si si si[si si si]
    mi4. \tuplet 3/4 { mi32 mi mi } la4. \tuplet 3/4 { dod,32 dod dod }

    %43
    re2 mi
    la,8 r r4 r
    R2.*2

    %47
    r16 re mi fad sol la si dod re  mi fad re
    la la, si dod re  mi fad sol la si dod la
    fad4 r fad

    %50
    sol r sol
    la r la,
    re,16 re' mi fad sol la si dod re mi fad re\mbreak

    %53
    si4 r si
    mi mi, re
    dod r dod

    %56
    re2.
    mi
    \clef tenor \key re\major dod'16(re) dod[(re)] mi(re) mi[(re)] mi(re) mi[(re)]

    %59
    dod(re) dod[(re)] mi(re) mi[(re)] mi(re) mi[(re)]
    dod4 r mi
    la8 r r4 r

    %62
    R2.
    \clef bass\key re\major fad,16(sol) fad[(sol)] la(sol) la[(sol)] la(sol) la[(sol)]
    fad(sol) fad[(sol)] la(sol) la[(sol)] la(sol) la[(sol)]

    %65
    fad re mi fad sol la si dod re mi fad re
    la4 la r
    r16 fad sold lad si dod re mi fad8 lad,-+

    %68
    si4 si r
    r16 si, dod re mi fad sol la si dod re si
    fad'4 fad r

    %71
    r r r32 fad mi re dod si lad sold
    fad8 r r4 r
    \clef tenor \key re\major  r8 fad si re fad4

    %74
    r8 sol, si mi sol4
    r8 fad, si re fad4
    r8 sol, si mi sol4

    %77
    r8 fad, si re fad re~
    re4 dod4.-+ sol'8
    fad4 fad,2

    %80
    si16 si, dod re mi fad sold lad si dod re si
    \clef bass \key re\major fad,4 r r
    R2.

    %83
    r4 r fad'
    sol sol, sol'
    fad fad, fad'

    %86
    mi la la,
    re, fad' fad
    sol sol, fad

    %89
    mi mi' mi
    la la, sol
    fad fad' fad

    %92
    si si, la
    sol2 mi4
    la4 la la

    %95
    la la la
    la la la
    la la la

    %98
    la la la
    la8 r r4 r
    R2.

    %101
    fad16 fad fad fad fad fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol sol sol sol sol
    la la la la la la la la la la la la

    %104
    si si si si si si si si si si si si
    fad fad fad fad fad fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol sol sol sol sol

    %107
    la la la la la la la la la la la la
    re,2 r4
    re2 r4

    %110
    re2 r4
    re2 r4
    re16 re re re re re re re re re re re

    %113
    re2 re4
    la'2 r4  re,8 r r4 r

}

IfgIIn = \relative do {

    R1
    r16 re re4. r2
    R1

    %4
    re8 r re r r2
    re8-. fad la-. re-. fad4 r8 r16 re,
    fad8-. fad,-. r4 r r8 r16 dod'

    %7
    dod4 r8 dod16 dod dod4 r
    r16 dod dod dod dod [dod dod dod] dod4 r
    R1*2

    %11
    r8 r16 fa mi4 r8 mi16 mi fa4
    r8 fa16 fa mi4 r8 mi16 mi fa8  [fa,]
    do'-. do-.  r4 r2

    %14
    R1
    \clef tenor \key mi\minor r8 r16  sol'' sol8-.[sol-.] r4 r8 sol16 sol
    fad4 r r2

    %17
    R1*2
    r4 r8 r16 fad fad4 r
    si,8-. si-. si-. si-. r2

    %21
    mi8-. mi-. mi-. mi-. r2
    mi8 mi mi mi mi mi mi mi
    \clef bass \key mi\minor si,4 r r2

    %24
    R1
    r2 r4 r8 r16 sol
    sol2 r

    %27
    R1
    r2 r4 r8 r16 sol'
    mi8-. mi-. r4 r r8 r16 mi

    %30
    la4 r r r8 r16 la,
    re4 r r2
    R1*2

    %34
    do8 do do do do do do do
    do? do do do do do do do
    si si si si re re re re

    %37
    dod? dod dod dod mi mi mi mi
    re r r4 r8 re re re
    do do do do si si si si

    %40
    la2 r4 r8 r16 la
    re16 si si si si [si si si] si si si si si[si si si]
    mi4. \tuplet 3/4 { mi32 mi mi } la4. \tuplet 3/4 { dod,32 dod dod }

    %43
    re2 mi
    la,8 r r4 r
    R2.*2

    %47
    r16 re mi fad sol la si dod re  mi fad re
    la la, si dod re  mi fad sol la si dod la
    fad4 r fad

    %50
    sol r sol
    la r la,
    re,16 re' mi fad sol la si dod re mi fad re\mbreak

    %53
    si4 r si
    mi mi, re
    dod r dod

    %56
    re2.
    mi
    \clef tenor \key re\major la16(si) la[(si)] dod(si) dod[(si)] dod(si) dod[(si)]

    %59
    la(si) la[(si)] dod(si) dod[(si)] dod(si) dod[(si)]
    la4 r mi'
    la8 r r4 r

    %62
    R2.
    \clef bass\key re\major re,,16(mi) re[(mi)] fad(mi) fad[(mi)] fad(mi) fad[(mi)]
    re(mi) re[(mi)] fad(mi) fad[(mi)] fad(mi) fad[(mi)]

    %65
    fad re mi fad sol la si dod re mi fad re
    la4 la r
    r16 fad sold lad si dod re mi fad8 lad,-+

    %68
    si4 si r
    r16 si, dod re mi fad sol la si dod re si
    fad'4 fad r

    %71
    r r r32 fad mi re dod si lad sold
    fad8 r r4 r
    \clef tenor \key re\major  r8 fad si re fad4

    %74
    r8 sol, si mi sol4
    r8 fad, si re fad4
    r8 sol, si mi sol4

    %77
    r8 fad, si re fad re~
    re4 dod4.-+ sol'8
    fad4 fad,2

    %80
    si16 si, dod re mi fad sold lad si dod re si
    \clef bass \key re\major fad,4 r r
    R2.

    %83
    r4 r fad'
    sol sol, sol'
    fad fad, fad'

    %86
    mi la la,
    re, fad' fad
    sol sol, fad

    %89
    mi mi' mi
    la la, sol
    fad fad' fad

    %92
    si si, la
    sol2 mi4
    la4 la la

    %95
    la la la
    la la la
    la la la

    %98
    la la la
    la8 r r4 r
    R2.

    %101
    fad16 fad fad fad fad fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol sol sol sol sol
    la la la la la la la la la la la la

    %104
    si si si si si si si si si si si si
    fad fad fad fad fad fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol sol sol sol sol

    %107
    la la la la la la la la la la la la
    re,2 r4
    re2 r4

    %110
    re2 r4
    re2 r4
    re16 re re re re re re re re re re re

    %113
    re2 re4
    la'2 r4  re,8 r r4 r

}

Itmpn = \relative do {

    \key do\major do4 r do r8 r16 do
    do16 do do do do [do do do] do4 r
    r8 do16 do do4 r16 do do do do [do do do]

    %4
    do8 r do r r16 do do do do [do do do]
    do2. r4
    r2 r4 r8 r16 do
    do4 r8 do16 do do4 r
    r16 do do do do [do do do]  do4 r

    %10
    \key do\major  r4 r8 r16 do do2
    do4 r r2
    R1*2
    r4 r8 do16 do do4 r
    \key do\major do4 r r2

    %13
    R1
    \key do \major  R1*7
    r2 r4 r8 r16 do

    %24
    do4 r do r8 do16 do
    \key do\major  do8 do r4 r16 do do do do [do do do]
    do2 r

    %27
    R1*6
    \key do\major R1
    do8_\markup\italic"Le tambour roule jusq'à la Rep[rise]" do do do do do do do
    do do do do do do do do
    do do do do do do do do

    %37
    do do do do do do do do
    do r r4 r8 do do do
    do do do do do do do do

    %40
    do2 r4 r8 r16 do
    do16 do do do do [do do do] do do do do do[do do do]
    do4. \tuplet 3/4 { do32do do } do4. \tuplet 3/4 { do32 do do }

    %43
    do2 do
    do8 r r4 r
    R2.*71

}

Ibcn = \relative do {

    R1
    r16 re re4 r8 r4 r
    R1

    %4
    re8 r re r r2
    re2. r8 r16 re
    fad8 fad, r4 r  r8 r16 dod'

    %7
    dod4 r8 dod16 dod dod4 r
    r16 dod dod dod dod [dod dod dod] dod4 r
    R1*2

    %11
    r8 r16 fa mi4 r8 mi16 mi fa4
    r8 fa16 fa mi4 r8 mi16 mi fa8  [fa,]
    do'-. do-. r8 mi16 mi mi4 r

    %14
    mi, r r2
    r8 r16 mi'  mi8-. [mi-.] r4 r8 mi16 mi
    red4 r r2

    %17
    R1*2
    r4 r8 r16 red red4 r
    re!8-. re-. re-. re-. r2

    %21
    dod!8-. dod-. dod-. dod-. r2
    do!8 do do do do do do do
    si4 r r r8 r16 sol?

    %24
    sol4 r sol r8 sol16 sol
    sol8 sol r4 r r8 r16 sol
    sol2 r

    %27
    R1
    r2 r4 r8 r16 sol'
    mi8-. mi-. r4 r r8 r16 mi

    %30
    la4 r r r8 r16 la,
    re4 r r2
    R1*2

    %34
    do8 do do do do do do do
    do? do do do do do do do
    si si si si re re re re

    %37
    dod? dod dod dod mi mi mi mi
    re r r4 r8 re re re
    do do do do si si si si

    %40
    la2 r4 r8 r16 la
    re16 si si si si [si si si] si si si si si[si si si]
    mi4. \tuplet 3/4 { mi32 mi mi } la4. \tuplet 3/4 { dod,32 dod dod }

    %43
    re2 mi
    la,8 r r4 r
    R2.*2

    %47
    r16 re mi fad sol la si dod re  mi fad re
    la la, si dod re  mi fad sol la si dod la
    fad4 r fad

    %50
    sol r sol
    la r la,
    re,16 re' mi fad sol la si dod re mi fad re\mbreak

    %53
    si4 r si
    mi mi, re
    dod r dod

    %56
    re2.
    mi
    R2.*5
    re16(mi) re[(mi)] fad(mi) fad[(mi)] fad(mi) fad[(mi)]
    re(mi) re[(mi)] fad(mi) fad[(mi)] fad(mi) fad[(mi)]

    %65
    re re, re re re re re re re re re re
    la'4 la r
    r16 lad lad lad lad lad lad lad lad lad lad lad

    %68
    si4 si r
    r16 si si si si si si si si si si si
    fad4 fad r

    %71
    r r r32 fad'' mi re dod si lad sold
    fad8 r r4 r
    re2 r4

    %74
    mi2 r4
    re2 r4
    mi2 r4

    %77
    re2 r4
    mi2 r4
    fad8. si,16 fad'4 fad,

    %80
    si16 si dod re mi fad sold lad si dod re si
    fad,4 r r
    R2.

    %83
    r4 r fad'
    sol sol, sol'
    fad fad, fad'

    %86
    mi la la,
    re,16 fad' fad fad fad fad fad fad fad fad fad fad
    sol4 sol, fad

    %89
    mi16 mi' mi mi mi mi mi mi mi mi mi mi
    la4 la, sol
    fad16 fad' fad fad fad fad fad fad fad fad fad fad

    %92
    si4 si, la
    sol2 mi4
    \repeat unfold 72 {la16}

    %100
    la8 r r4 r
    fad16 fad fad fad fad fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol sol sol sol sol

    %103
    la la la la la la la la la la la la
    si si si si si si si si si si si si
    fad fad fad fad fad fad fad fad fad fad fad fad

    %106
    sol sol sol sol sol sol sol sol sol sol sol sol
    la la la la la la la la la la la la
    re,2 r4

    %109
    re2 r4
    re2 r4
    re2 r4

    %112
    re16 re re re re re re re re re re re
    re2 re4
    la'2 r4  re,8 r r4 r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key re\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    \tempo 4 = 53
    \mark\markup\italic\column{"un peu lent"}
    s1*8\break
    \key fa\minor
    \bar"||"
    s1*5
    \key mi\minor
    \tempo 2 = 50
    s1*6\break
    s1*11
    \key re\major
    s1*13
    \bar "||"\break
    \mark\markup\italic"Reprise vive."
    \time 3/4
    \tempo 2 = 55
    s2.
    \repeat volta 2 {s2.*68}
    \alternative {{s2. s}{s2.}}
    \bar"||" \revert Staff.TimeSignature.style
    \time 4/4


}

IvlI = {
    \Iglobal
    %\notypeset
    %\clef soprano
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    %\clef soprano
    <<\IvlIIn \forma>>

}

Ivla= {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

IflI = {
    \Iglobal
    %\clef french
    <<\IflIn \forma>>

}

IflII = {
    \Iglobal
    %\clef french
    <<\IflIIn \forma>>

}

IobI = {
    \Iglobal
    %\clef french
    <<\IobIn \forma>>

}

IobII = {
    \Iglobal
    %\clef french
    <<\IobIIn \forma>>

}

IfgI = {
    \Iglobal
    \clef bass
    <<\IfgIn \forma>>

}

IfgII = {
    \Iglobal
    \clef bass
    <<\IfgIIn \forma>>

}

Itmp = {
    \Iglobal
    \clef bass
    <<\Itmpn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #2
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge {"Ouverture [Prologue]"}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Petite"\vspace #-0.2"Flûte [I]"}
                \set Staff.midiInstrument = #"recorder"
                \IflI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Petite""Flûte [II]"}
                \set Staff.midiInstrument = #"recorder"
                \IflII
            >>
        >>

        \new PianoStaff <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[I]"\vspace #-0.2"Hautbois"}
                \set Staff.midiInstrument = #"oboe"
                \IobI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[II]"\vspace #-0.2"Hautbois"}
                \set Staff.midiInstrument = #"oboe"
                \IobII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[I]"\vspace #-0.2"Bassons"}
                \set Staff.midiInstrument = #"bassoon"
                \IfgI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[II]"\vspace #-0.2"Bassons"}
                \set Staff.midiInstrument = #"bassoon"
                \IfgII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"P.ers"\vspace #-0.2"Violons"}
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"2.ds"\vspace #-0.2"Violons"}
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Tailles"}
            \set Staff.midiInstrument = #"viola"
            \Ivla
        >>

        \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Tambour"\vspace #-0.2"Voilé"}
            \set Staff.midiInstrument = #"timpani"
            \Itmp
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basse"\vspace #-0.2"Continue"}
            \set Staff.midiInstrument = #"contrabass"
            \Ibc

        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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