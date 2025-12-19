\language "italiano"
	%********************************** VARIABILI

\version "2.17.97"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

ten = ^\markup \italic \center-align "ten"

piuf =_\markup\italic\bold "più f"

pof =_\markup\italic\bold "poco f"

pf  = #(make-dynamic-script "pf")

tr = \trill

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

ds = \markup \italic \small \center-column{"Da""Capo"}

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

fln = \relative do'' {

    r4 mi2~
    mi2.~
    mi4 re8 dod re4

    %4
    dod8 si la4 fad'~
    fad8 mi16(re) re8 dod16 si si8. la16
    sold8 fad mi4 r

    %7
    r la' sol8.\tr(fad16)
    fad4 si la8.\tr(sold?16)\mbreak
    sold4. fad8 fad[mi]

    %10
    red4 dod8 si mi[si']
    dod dod, red4. mi8
    mi4 r r

    %13
    mi8.(fad,16) dod'32(re mi8.) mi32(fad sol8.)~
    sol8 (fad) fad[dod fad mi]
    re dod re4 r

    %16
    re8. mi,16 si'32(dod re8.) re32(mi fad8.)\mbreak
    fad8(mi) mi si mi re
    dod si dod [re] mi4~

    %19
    mi re \once\tieDashed dod~
    dod8 si si4 r
    mi8 la, la16 si dod8~dod16 si si la

    %22
    fad'8 la, si16 dod re8~re16 dod dod si
    sold'8 si, dod16 re \once\tieDashed mi8~mi16 re re dod
    la'8 dod, re16 mi fad8~fad16 mi mi re\mbreak

    %25
    re8 sold16 la si8 fad mi [re]
    dod16 mi fad4 re16 dod si8 la
    sold!4. (mi8) la4~

    %28
    la8 (si) dod32(si la8.) si8. la16
    re2(red8.) mi16
    mi4. sold!8 la4~

    %31
    la8 re, si4. la8\mbreak
    la4 r r
    R2.*2

    %35
    r4 mi'2~
    \once\tieDashed mi2.~
    mi4 re8 dod re4

    %38
    dod8 si la4 r
    R2.
    r4 r si

    %41
    mi, r r
    la fad'8(mi) re[(dod)]
    si4. la8 si4

    %44
    mi,2 r4
    r r fad'
    si,2 r4

    %47
    r la' sol8.(fad16)\mbreak
    fad4 si la8.(sold?16)
    sold4 r r

    %50
    R2.*2
    r4 r mi
    mi, r mi'

    %54
    mi, r r
    R2.*2
    si'8 mi, mi16 fad \once\tieDashed sold8~sold16(fad) fad(mi)

    %58
    dod'8 mi, fad16 sold la8~la16 sold sold fad
    red'8 fad, sold16 la si8~si16 la la sold
    mi'8 sold, la16 si dod8~dod16 si si la

    %61
    red8(dod) red(mi) fad(red)
    \once\tieDashed mi2.~
    mi2 fad4~\mbreak

    %64
    fad2 sold4~
    sold2 la4~
    la4. sold8(fad) la

    %67
    sold4. fad8 mi mi'
    dod la fad4. mi8
    mi4 si'2~

    %70
    si2.~
    si4 la8 sold la4\mbreak
    sold4. fad8 mi4

    %73
    R2.
    r4 r si
    mi, r r

    %76
    r r fad'
    si, r r
    mi8.(fad,16) dod'32(re mi8.) ~ mi32(fad sol8.)~

    %79
    sol8 [fad fad dod fad8. (mi16)]\mbreak  %%%%%%% OK
    re8 dod re4 r
    R2.

    %82
    r4 r dod
    fad, r r
    r r fad'

    %85
    fad, r fad'~
    fad8 mi dod4. si8
    si2 r4

    %88
    re8.(mi,16) si'32(dod re8.)~re32(mi fad8.)~
    fad8[mi mi si mi8. re16]
    dod8. si16 dod8 re dod 4

    %91
    dod si la
    la8 sold sold4 r
    r r la'~

    %94
    la2 si4~
    si2 \once\tieDashed dod4~\mbreak
    dod2 re8(dod)

    %97
    \appoggiatura dod8 si4 r r
    R2.*3
    mi,8 la, la16 si dod8~dod16 si si la

    %102
    fad'8 la, si16 dod re8~re16 dod dod si
    sold'8 si, dod16 re mi8~mi16 re re dod\mbreak
    la'8 dod, re16 mi fad8~fad16  mi mi re

    %105
    sold8 fad sold la si sold
    la4. sold8 la4~
    la^\markup\italic"ad lib[itum]" sold4. la8

    %108
    la dod, re16 mi fad8~fad16  mi mi re
    re8 sold16 la si8 fad mi re
    dod16 mi fad4 re16 dod si8 la

    %111
    sold!4. mi8 la4~\mbreak
    la8 si dod32 si la8. si8. la16
    re2(red8.) mi16

    %114
    mi4.^\markup\italic"adag[io]"sold8 la4~
    la8 re, si4. la8
    la2 r4

}


vocen = \relative do'' {

    \autoBeamOff
    R2.*31
    r4 mi2~
    mi2.~

    %34
    mi4 re8 [dod] re4
    dod8 [si] la4  r
    R2.*2

    %38
    r4 mi'2~
    mi2.~\mbreak
    mi4 re8[dod] re4

    %41
    dod8[si] la4 \once\tieDashed fad'~
    fad8[(re)] re16[dod] si4(la8)
    sold4. fad8 sold4

    %44
    la16[si] dod4 mi8 la,[sol]
    fad[si16 dod] re8[fad si, la]
    sold8[fad] mi4 r\mbreak

    %47
    R2.*2
    r4 mi're
    dod \grace red8 fad4. mi8

    %51
    red[dod red mi fad red]
    mi4. re!16[dod] si8[re]
    dod[mi, red fad si mi,]

    %54
    dod'[mi, red fad si mi,]
    la4 sold4.^\markup\italic"ad lib[itum]" fad8\mbreak
    fad2 r4

    %57
    r r mi~
    mi2 fad4~
    fad2 sold4~

    %60
    sold2 la4~
    la4. sold8 [fad la]
    sold [mi] mi16[fad sold8]~sold16[fad fad mi]

    %63
    dod'8[mi,] fad16[sold \once\tieDashed la8]~la16[sold sold fad]\mbreak
    red'8[fad,] sold16[la si8]~si16[la la sold]
    mi'8[sold,] la16[si dod8]~dod16[si si la]

    %66
    red8[dod red mi fad red]
    mi4. red8 mi4~
    mi8[dod] red4. mi8

    %69
    mi2 r4
    R2.*2
    r4 mi2~

    %73
    mi2.~
    mi4 re8 [dod] re4
    dod8 [si] la4 fad'~

    %76
    fad8[(re)] re16[dod] \once\slurDashed si4(la8)
    sold[fad] mi4 r
    R2.*2

    %80
    r4 fad'2~
    fad2.~
    fad4 mi8[re] mi4

    %83
    re8[dod] si4 sol'~
    sol fad8[mi] re dod
    re4. dod8 \once\tieDashed si4~

    %86
    si8[dod] lad4. si8
    si2 r4\mbreak
    R2.*2

    %90
    r4 mi2~
    mi4 re dod
    dod8[(si)] si4 re

    %93
    mi8[la,] la16[si dod8]~dod16[si si la]
    fad'8[la,] si16[dod re8]~re16[dod dod si]
    sold'8[si,] dod16[re mi8]~mi16[re re dod]\mbreak

    %96
    la'8[dod,] re16[mi fad8]~fad16[mi mi re]
    re2.~
    re8[dod] re4\fermata r8 si

    %99
    dod4. si8 la[la']
    mi[la,] si4. la8
    la4 r la~

    %102
    la2 si4~
    si2 dod4~
    dod2 re4~

    %105
    re4. dod8[si re]
    dod4. si8 dod4~
    dod8^\markup\italic"ad lib[itum]" [re] si4. la8

    %108
    la4 r r
    R2.*8

}

testo = \lyricmode {

    Be -- ne - dic -- tus Be -- ne - dic -- tus
    qui ve - - nit qui ve - - - - - - nit
    Bene - dic -- tus qui ve - - - - - - - - nit  %%% bar 56
    in no - - - - - - - - - - - - - mine _ Do -- mini _
    Be -- ne - dic -- tus qui ve - - nit
    Be -- ne - dic -- tus qui ve -- nit
    in no -- mine _ Do -- mi -- ni
    Be - ne -- dic -- tus qui ve - - - - - - - - nit
    in no -- mine _ Do - - - - - - - - -  mi - - - ni.

}


bcn = \relative do {

    la'4 dod si
    la la, la'
    sold mi sold

    %4
    la dod re
    re, re red
    mi mi' re

    %7
    dod la dod
    re red la\mbreak
    mi' la, la

    %10
    la la sold
    la si si,
    mi mi'8 re dod si

    %13
    lad4 lad lad
    lad lad lad
    si, si' la?

    %16
    sold sold sold\mbreak
    sold sold sold
    la  la, dod

    %19
    re re red
    mi mi re?
    dod dod la

    %22
    re re si
    mi mi dod
    fad fad re\mbreak

    %25
    mi sold sold
    la re, re
    mi re dod

    %28
    re mi mi
    fad si la
    sold re dod

    %31
    re mi mi,\mbreak
    la' dod si
    la la, la'

    %34
    sold mi sold
    la dod si
    la la, la'

    %37
    sold mi sold
    la dod si
    la la, la'\mbreak

    %40
    sold mi sold
    la dod re
    re re re,

    %43
    mi mi re
    dod la dod
    re si red

    %46
    mi mi' re
    dod la dod\mbreak
    re red si

    %49
    mi sold, mi
    la lad fad
    si, si' la?

    %52
    sold mi sold
    la si sold
    la si sold

    %55
    fad mi_\markup\italic"ad lib[itum]" lad\mbreak
    si, si' la
    sold sold sold

    %58
    la la la
    si si si
    dod dod dod

    %61
    si si si
    mi, sold sold
    la la, la\mbreak

    %64
    si si si
    dod dod dod
    si si si

    %67
    mi la dod
    la si si,
    mi sold fad

    %70
    mi mi, mi'
    red si red\mbreak
    mi mi re

    %73
    dod la dod
    sold' mi sold
    la dod re

    %76
    re re red
    mi4. re?8 dod si
    lad4 lad lad

    %79
    lad lad lad
    si si, si'
    re dod si

    %82
    lad fad lad
    si sold mi
    lad, lad'? fad

    %85
    si dod re
    mi, fad fad,
    si si' la?\mbreak

    %88
    sold sold sold
    sold sold sold
    la la, la

    %91
    re re red
    mi  mi re?
    dod dod dod

    %94
    re re re
    mi mi mi\mbreak
    fad fad fad

    %97
    sold si8 la sold fad
    mi2\fermata sold4
    la mi fad

    %100
    dod re mi
    dod dod dod
    re re re

    %103
    mi mi mi\mbreak
    fad fad fad
    mi mi mi

    %106
    la mi la,
    re mi mi,
    la' fad fad

    %109
    sold sold sold
    la re, red
    red? re? dod\mbreak

    %112
    re mi mi
    fad si la
    sold re dod

    %115
    re mi mi,
    la2 r4

}

bfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key la\major
    \tempo 4 = 75
    s2.*116
    \bar"|."

}



fl = {
    \global
    %\notypeset
    <<\fln \forma>>

}


voce = {
    \new Voice = "benedictus"
    \global
    %\clef soprano
    <<\vocen \forma>>

}

bc = {
    \global
    \clef bass
    <<\bcn \forma \bfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.83  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

    systems-per-page = #5
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge {Larghetto}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup  \center-column{"[Flauto""traverso""o Violino]"}
            \fl
        >>

        \new Staff
        \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        }
        <<
            \set Staff.midiInstrument = #"voice oohs"
            \voce
            \new Lyrics \lyricsto "benedictus" \testo
        >>

        \new Staff
        \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        }
        <<
            \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
            \set Staff.midiInstrument = #"cello"
            \bc

        >>
    >>

    \layout {

        indent = 1.6\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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
