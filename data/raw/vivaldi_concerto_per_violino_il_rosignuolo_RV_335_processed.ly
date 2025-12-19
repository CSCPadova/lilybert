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
}

Ivln = \relative do'' {

    la'16[la, la la la la la la]  la'[la, la la la la la la]
    la'16[la, la la la la la la] la'16[la, la la la si dod re]
    mi4\fermata r r2

    %4
    mi16 [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi mi mi mi]
    mi' [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi fad sold mi]
    la4 \fermata r r2

    %7
    la16 [la, la la la la la la] la' [la, la la la la la la]
    la' [la, la la la la la la] la' [la, la la la si dod re]
    mi4 r mi'16 [mi, mi mi mi mi mi mi]

    %10
    re' [mi, mi mi mi mi mi mi] dod' [mi, mi mi mi mi mi mi]
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi

    %13
    si'4 r8 mi16 re dod8[si16 la] sold8 la
    si4 r8 mi16 re\mbreak dod8[si16 la] sold8 la
    mi4 r8 mi' mi, re' mi, dod'

    %16
    mi, fad16 sold la8[la,] re dod16 re mi8[mi]
    \ottava # -0  \set Staff.ottavation = #"8.va alta " mi'4_\solo~ mi8. la16 mi4~\tr mi8. la16
    mi4~mi8. \tr fad16 mi (fad) mi8~mi16 la mi fad

    %19
    mi16(fad) mi8~mi16 la mi fad mi fad mi la mi fad mi fad
    mi fad mi la mi fad mi fad mi fad mi la mi fad  mi fad
    la,4\tr~la8. la'16 mi4\tr~mi8. la16

    %22
    la,8. la'16 mi8. la16\mbreak la,8.  la'16 la la la la
    la,2\tr~la16 la' mi dod la la' mi dod
    la la' mi dod la la' mi dod la la' mi dod la la' mi dod

    %25
    la la' mi dod la la' mi dod lab4\tr_\markup\italic "A flat is in Roman's version"~lab8. lab'16
    lab,4~lab8. lab'16 lab,2\tr \unset Staff.ottavation
    la'16 \tu_\markup\italic"a suo luogo" [la, la la la la la la] la' [la, la la la si dod re]

    %28
    mi [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi fad sold mi]
    la [la, la la la la la la] la' [la, la la la si dod re]
    mi4 r mi'16 [mi, mi mi mi mi mi mi]

    %31
    re' [mi, mi mi mi mi mi mi] dod' [mi, mi mi mi fad sold mi]
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi\mbreak
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi

    %34
    si'4 r8 mi16 re dod8[si16 la] sold8 la
    mi4 r8 mi'16 re dod8[si16 la] sold8 la
    mi4 r8 mi' mi, re' mi, dod'

    %37
    mi, fad16 sold la8[dod,] re dod16 re mi8[mi]
    la'16 mi mi mi la mi mi mi si' mi, mi mi si' mi, mi mi
    dod' mi, mi mi dod' mi, mi mi re' mi, mi mi dod' mi, mi mi\mbreak

    %40
    si' mi, mi mi dod' mi, mi mi re' mi, mi mi dod' mi, mi mi
    si' mi, mi mi dod' mi, mi mi re' mi, mi mi dod' mi, mi mi
    si'8 mi, r4 \ottava # -0  \set Staff.ottavation = #"l'ottava più alta " mi16 la mi la mi la mi la

    %43
    fad la fad la fad la fad la mi la mi la mi la mi la
    fad la fad la fad la fad la mi la mi la mi la mi la
    fad la fad la fad la fad la  dod, la' dod, la' dod, la' dod, la'

    %46
    si, la' si, la' si, la' si, la' si, sold' si, sold' si, sold' si, sold'
    la, sold' la, sold' la, sold' la, sold' la, fad' la, fad' la, fad' la, fad'
    sold, fad' sold, fad' sold, fad' sold, fad' sold, mi' sold, mi' sold, mi' sold, mi'

    %49
    fad, mi' fad, mi' fad, mi' fad, mi' fad, red' fad, red' fad, red' fad, red' \unset Staff.ottavation
    mi'\tu [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi mi mi mi]
    mi' [mi, mi mi mi mi mi mi]\mbreak mi' [mi, mi mi mi fad sold la]

    %52
    si[si, si si si si si si] si'[si, si si si si si si]
    si'[si, si si si si si si] si'[si, si si si dod red si]
    mi [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi mi mi mi]

    %55
    mi' [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi fad sold la]
    si\solo si' fad si red, si' dod, si' si, si' fad si red, si' dod, si'
    si, si' fad si red, si' dod, si' si, si' fad si red, si' dod, si'

    %58
    si,8\tu la' la la sold16 mi re mi sold, mi' fad, mi'
    mi, mi' si mi sold, mi' fad, mi' mi, mi' si mi sold, mi' fad, mi'\mbreak  %% fine prima pagina
    mi, mi' si mi sold, mi' fad, mi' mi,8 \tu re' re re

    %61
    dod16\solo la' mi la dod, la' si, la' la, la' mi la dod, la' si, la'
    la, la' mi la dod, la' si, la' la, la' mi la dod, la' si, la'
    la,8\tu sol' sol sol fad16 fad re fad la,\solo fad' re fad

    %64
    la, fad' re fad la, fad' re fad la, fa' re fa la, fa' re fa
    la, fa' re fa la, fa' re fa la, mi' re mi la, mi' re mi
    la, mi' re mi la, mi' re mi la, mi' do mi la, mi' do mi

    %67
    la, mi' do mi la, mi' do mi la, la' do, la' la, la' do, la'
    la, la' do, la' la, la' do, la' si, la' red, la' si, la' red, la'
    si, la' red, la' si, la' red, la' si, sol' mi sol si, sol' mi sol

    %70
    si, sol' mi sol si, sol' mi sol si, sold' mi sold si, sold' mi sold\mbreak
    si, sold' mi sold si, sold' mi sold si, sold' re sold si, sold' re sold
    si, sold' mi sold si, sold' re sold si, sold' mi sold si, sold' re sold

    %73
    si, sold' mi sold si, sold' re sold si, sold' mi sold si, sold' re sold
    dod,\tu [la la la la la la la] la'[la, la la la si dod re]
    mi[mi, mi mi mi mi mi mi] mi'[mi, mi mi mi  fad sold  mi]

    %76
    la[la, la la la la la la]\mbreak la'[la, la la la si dod re]
    mi\solo mi' mi mi la mi mi mi fad mi mi mi la mi mi mi
    fad mi mi mi la mi mi mi fad fad fad fad si fad fad fad

    %79
    sold fad fad fad si fad fad fad sold fad fad fad si fad fad fad
    sold sold sold sold dod sold sold sold la sold sold sold dod sold sold sold
    la sold sold sold dod sold sold sold la la la la si la la la

    %82
    si la la la re la la la si la la la re la la la
    si si si si mi si si si dod si si si mi si si si
    dod si si si mi si si si dod(si) mi(si) dod(si) mi(si)

    %85
    dod(si) mi(si) dod(si) mi(si) dod si mi si dod si mi si
    dod la la la re(la) si(la) re(la) si(la) re(la) si(la)
    si sold sold sold dod sold la sold dod sold la sold dod sold la sold

    %88
    la fad fad fad si fad sold fad si fad sold fad si fad sold fad
    la mi mi mi la mi mi mi si' mi, mi mi dod' mi, mi mi
    re' mi, mi mi mi' mi, mi mi fad' mi, mi mi sold' mi, mi mi

    %91
    la' [mi, mi mi mi mi mi mi] la[mi mi mi mi mi mi mi]
    la[la la la la la la la] la, la' la la  si, la' la la
    dod, la' la la si, la' la la <<
        {
            la, la' la la si, la' la la

            %94
            dod, la' la la si, la'  la la la, la' la la si, la' la la
            dod, la' la la si, la' la la la, la' si, la' dod, la' si, la'
            la, la' si, la' dod, la' si, la' la, la' si, la' dod, la' la, la'

            %97
            si, la' la, la' si, la' sold, la' la, la' si, la' dod, la' la, la'
            si, la' la, la' si, la' sold, la' la, la' sold, la' la, la' si, la'
            dod, la'  si, la' dod, la' la,  \ottava # -0  \set Staff.ottavation = #"8.va  alta " si'  dod mi, si' mi, dod' mi,  la mi

            %100
            si' mi, la mi si' mi, sold mi la mi sold mi la mi si' mi,
            dod' mi, si' mi, dod' mi, la mi  si' mi, la mi si' mi, sold mi
            la mi sold mi la mi fad mi sold mi fad mi sold mi mi mi

            %103
            fad mi mi mi fad mi re mi mi mi re mi mi mi dod mi
            re mi dod mi re mi si mi do mi si mi do mi la, mi'
            re mi do mi re  mi si mi do mi si mi do mi la, mi'

            %106
            sib mi la, mi' sib mi dod! mi re mi dod mi re mi mi mi
            re mi do mi sib mi la, mi' sold, sib mi sib sold sib mi sib
            la dod? mi dod la dod mi dod la si? mi si la si mi si

            %109
            sold si mi si sold si mi si \unset Staff.ottavation
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"violin"

            %93bis parte
            \key la\major <<
                {
                    la'2^\markup\italic\tiny"Ancona manuscript"~
                    la~la~
                    la~la~
                    la~la~
                    la~la~
                    la~la~
                    la4. si8 dod si dod la
                    si la si sold la sold la si
                    dod si dod la si la si sold
                    la sold la fad
                    sold fad sold mi
                    fad mi  fad re mi re mi dod
                    re dod re si do si do la
                    re do re si do si do la
                    sib la sib dod re dod re  mi
                    re do sib la
                }\\{
                    la8 la si si
                    dod dod si si la la si si
                    dod dod si si la si dod si
                    la si dod si la si dod la
                    si la si sold la si dod la
                    si la si sold la sold la si
                    dod si dod la mi'2~
                    mi~mi~
                    mi~mi~
                    mi~mi~
                    mi~mi~
                    mi~mi~
                    mi~mi~
                    mi~mi~
                    mi2
                }
            >> <<
                {
                    mi8 mi mi mi
                    mi mi mi mi mi mi mi mi
                    mi mi mi mi
                }\\{
                    \stemUp \override Stem #'transparent = ##t sib sib sib sib
                    dod dod dod dod si? si si si
                    si si si si
                }\\{
                    \stemDown sold sold sold sold
                    la la la la la la la la
                    sold! sold sold sold
                }
            >>
        }
    >>  la' 16[la, la la la la la la]

    %110
    la'[la, la la la si dod re] mi[mi, mi mi mi mi mi mi]
    mi' [mi, mi mi mi fad sold mi] la[la, la la la la la la]
    la'[la, la la la si dod re] mi4 r

    %113
    mi'16 [mi, mi mi mi mi mi mi] re' mi, mi mi re' mi, mi mi
    dod' [mi, mi mi mi mi mi mi] si' mi, mi mi dod' mi, mi mi
    re' mi, mi mi dod' mi, mi mi si' mi, mi mi dod' mi, mi mi

    %116
    re' mi, mi mi dod' mi, mi mi si'4 r8 mi16 re
    dod8 si16 la sold8[la] mi4 r8 mi'16 re
    dod8 si16 la sold8[la] mi4 r8 mi'

    %119
    mi, re' mi, dod' mi, fad16 sold la8[dod,]
    re dod16 re mi8[mi] la,2\fermata

}

IvlIn =  \relative do'' {

    la'16[la, la la la la la la]  la'[la, la la la la la la]
    la'16[la, la la la la la la] la'16[la, la la la si dod re]
    mi4\fermata r r2

    %4
    mi16 [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi mi mi mi]
    mi' [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi fad sold mi]
    la4 \fermata r r2

    %7
    la16 [la, la la la la la la] la' [la, la la la la la la]
    la' [la, la la la la la la] la' [la, la la la si dod re]
    mi4 r mi'16 [mi, mi mi mi mi mi mi]

    %10
    re' [mi, mi mi mi mi mi mi] dod' [mi, mi mi mi mi mi mi]
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi

    %13
    si'4 r8 mi16 re dod8[si16 la] sold8 la
    si4 r8 mi16 re\mbreak dod8[si16 la] sold8 la
    mi4 r8 mi' mi, re' mi, dod'

    %16
    mi, fad16 sold la8[la,] re dod16 re mi8[mi]
    la,4\fermata r r2
    R1*9
    la''16[la, la la la la la la] la' [la, la la la si dod re]

    %28
    mi [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi fad sold mi]
    la [la, la la la la la la] la' [la, la la la si dod re]
    mi4 r mi'16 [mi, mi mi mi mi mi mi]

    %31
    re' [mi, mi mi mi mi mi mi] dod' [mi, mi mi mi fad sold mi]
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi\mbreak
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi

    %34
    si'4 r8 mi16 re dod8[si16 la] sold8 la
    mi4 r8 mi'16 re dod8[si16 la] sold8 la
    mi4 r8 mi' mi, re' mi, dod'

    %37
    mi, fad16 sold la8[dod,] re dod16 re mi8[mi]
    la,4 r r2
    R1*3

    %42
    r2 dod''8\p dod dod dod
    re re re re dod dod dod dod
    re re re re dod dod dod dod

    %45
    re re re re dod dod dod dod
    si si si si si si si si
    la la la la la la la la

    %48
    sold sold sold sold sold sold sold sold
    fad fad fad fad fad fad fad fad
    mi16 mi mi mi mi mi mi mi] mi' [mi, mi mi mi mi mi mi]

    %51
    mi' [mi, mi mi mi mi mi mi]\mbreak mi' [mi, mi mi mi fad sold la]
    si[si, si si si si si si] si'[si, si si si si si si]
    si'[si, si si si si si si] si'[si, si si si dod red si]

    %54
    mi [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi mi mi mi]
    mi' [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi fad sold la]
    si4 r r2

    %57
    R1
    la'8\p la la la sold4 r
    R1

    %60
    r2 re8 re re re
    dod4 r r2
    R1

    %63
    sol'8 sol sol sol fad4 r
    R1*10
    la16 [la, la la la la la la] la'[la, la la la si dod re]

    %75
    mi[mi, mi mi mi mi mi mi] mi'[mi, mi mi mi  fad sold  mi]
    la[la, la la la la la la]\mbreak la'[la, la la la si dod re]
    mi4 r r2

    %78
    R1*31
    r2 la' 16[la, la la la la la la]

    %110
    la'[la, la la la si dod re] mi[mi, mi mi mi mi mi mi]
    mi' [mi, mi mi mi fad sold mi] la[la, la la la la la la]
    la'[la, la la la si dod re] mi4 r

    %113
    mi'16 [mi, mi mi mi mi mi mi] re' [mi, mi mi mi mi mi mi]
    dod' [mi, mi mi mi mi mi mi] si' mi, mi mi dod' mi, mi mi
    re' mi, mi mi dod' mi, mi mi si' mi, mi mi dod' mi, mi mi

    %116
    re' mi, mi mi dod' mi, mi mi si'4 r8 mi16 re
    dod8 si16 la sold8[la] mi4 r8 mi'16 re
    dod8 si16 la sold8[la] mi4 r8 mi'

    %119
    mi, re' mi, dod' mi, fad16 sold la8[dod,]
    re dod16 re mi8[mi] la,2\fermata

}

IvlIIn = \relative do'' {

    la'16[la, la la la la la la]  la'[la, la la la la la la]
    la'16[la, la la la la la la] la'16[la, la la la si dod re]
    mi4\fermata r r2

    %4
    mi16 [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi mi mi mi]
    mi' [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi fad sold mi]
    la4 \fermata r r2

    %7
    la16 [la, la la la la la la] la' [la, la la la la la la]
    la' [la, la la la la la la] la' [la, la la la si dod re]
    mi4 r mi'16 [mi, mi mi mi mi mi mi]

    %10
    re' [mi, mi mi mi mi mi mi] dod' [mi, mi mi mi mi mi mi]
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi

    %13
    si'4 r8 mi16 re dod8[si16 la] sold8 la
    si4 r8 mi16 re\mbreak dod8[si16 la] sold8 la
    mi4 r8 mi' mi, re' mi, dod'

    %16
    mi, fad16 sold la8[la,] re dod16 re mi8[mi]
    la,4\fermata r r2
    R1*9
    la''16[la, la la la la la la] la' [la, la la la si dod re]

    %28
    mi [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi fad sold mi]
    la [la, la la la la la la] la' [la, la la la si dod re]
    mi4 r mi'16 [mi, mi mi mi mi mi mi]

    %31
    re' [mi, mi mi mi mi mi mi] dod' [mi, mi mi mi fad sold mi]
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi\mbreak
    si' mi,  mi mi dod' mi,  mi mi re' mi, mi mi dod' mi, mi mi

    %34
    si'4 r8 mi16 re dod8[si16 la] sold8 la
    mi4 r8 mi'16 re dod8[si16 la] sold8 la
    mi4 r8 mi' mi, re' mi, dod'

    %37
    mi, fad16 sold la8[dod,] re dod16 re mi8[mi]
    la,4 r r2
    R1*3

    %42
    r2 dod''8\p dod dod dod
    re re re re dod dod dod dod
    re re re re dod dod dod dod

    %45
    re re re re dod dod dod dod
    si si si si si si si si
    la la la la la la la la

    %48
    sold sold sold sold sold sold sold sold
    fad fad fad fad fad fad fad fad
    mi16 mi mi mi mi mi mi mi] mi' [mi, mi mi mi mi mi mi]

    %51
    mi' [mi, mi mi mi mi mi mi]\mbreak mi' [mi, mi mi mi fad sold la]
    si[si, si si si si si si] si'[si, si si si si si si]
    si'[si, si si si si si si] si'[si, si si si dod red si]

    %54
    mi [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi mi mi mi]
    mi' [mi, mi mi mi mi mi mi] mi' [mi, mi mi mi fad sold la]
    si4 r r2

    %57
    R1
    la'8\p la la la sold4 r
    R1

    %60
    r2 re8 re re re
    dod4 r r2
    R1

    %63
    sol'8 sol sol sol fad4 r
    R1*10
    la16 [la, la la la la la la] la'[la, la la la si dod re]

    %75
    mi[mi, mi mi mi mi mi mi] mi'[mi, mi mi mi  fad sold  mi]
    la[la, la la la la la la]\mbreak la'[la, la la la si dod re]
    mi4 r r2

    %78
    R1*31
    r2 la' 16[la, la la la la la la]

    %110
    la'[la, la la la si dod re] mi[mi, mi mi mi mi mi mi]
    mi' [mi, mi mi mi fad sold mi] la[la, la la la la la la]
    la'[la, la la la si dod re] mi4 r

    %113
    mi'16 [mi, mi mi mi mi mi mi] re' [mi, mi mi mi mi mi mi]
    dod' [mi, mi mi mi mi mi mi] si' mi, mi mi dod' mi, mi mi
    re' mi, mi mi dod' mi, mi mi si' mi, mi mi dod' mi, mi mi

    %116
    re' mi, mi mi dod' mi, mi mi si'4 r8 mi16 re
    dod8 si16 la sold8[la] mi4 r8 mi'16 re
    dod8 si16 la sold8[la] mi4 r8 mi'

    %119
    mi, re' mi, dod' mi, fad16 sold la8[dod,]
    re dod16 re mi8[mi] la,2\fermata

}

Ivlan =  \relative do' {

    dod8 dod dod dod dod dod dod  dod
    dod dod dod  dod dod dod dod  dod
    si4\fermopz r r2

    %4
    si8 si si si si si si si
    si si si si si si si si
    la4 r r2

    %7
    la8 la la la la la la la
    la la la la la la la la
    sold4 r si8 si si si

    %10
    si si si si la la la la
    sold sold la la si si sold la
    sold sold la la si si la la

    %13
    sold4 r8 mi''16 re dod8 si16 la sold8 la
    mi4 r8 mi'16 re dod8 si16 la sold8 la
    mi4 r8 mi' mi, re' mi, dod'

    %16
    mi, fad16 sold la8 dod, re dod16 re mi8 mi
    la,4\fermata r r2
    R1*9

    %27
    dod8 dod dod dod dod dod dod dod
    si si si si si si si si
    la la la la la la la la

    %30
    sold4 r si8 si si si
    si si si si la la la la
    sold sold la la si si la la

    %33
    sold sold la la si si la la
    sold4 r8 mi''16 re dod8 si16 la sold8 la
    mi4 r8 mi'16 re dod8 si16 la sold8 la

    %36
    mi4 r8 mi' mi, re' mi, dod'
    mi, fad16 sold la8 dod, re dod16 re mi8 mi
    la,4 r r2

    %39
    R1*11
    sold'8 sold sold sold sold sold sold sold
    sold sold sold sold sold sold sold sold

    %52
    fad fad fad fad fad fad fad fad
    fad fad fad fad fad fad fad fad
    fad fad mi mi mi mi mi mi

    %55
    mi mi mi mi mi mi mi mi
    red4 r r2
    R1

    %58
    fad8 fad fad fad mi4 r
    R1
    r2 si8 si si si

    %61
    la4 r r2
    R1
    mi'8 mi mi mi re4 r

    %64
    R1*10
    dod8 dod dod dod dod dod dod dod
    si si si si si si si si

    %76
    la la la la la la la la
    sold4 r r2
    R1*31

    %109
    r2 dod8 dod dod dod
    dod dod dod dod si si si si
    si si si si la la la la

    %112
    la la la la sold4 r
    dod8 dod dod dod si si si si
    la la la la sold sold la la

    %115
    si si la la sold sold la la
    si si la la sold4 r8 mi''16 re
    dod8 si16 la sold8 la mi4 r8 mi'16 re

    %118
    dod8 si16 la sold8 la mi4 r8 mi'
    mi, re' mi, dod' mi, fad16 sold la8 dod,
    re dod16 re  mi8 mi la,2\fermata

}

Ibcn = \relative do {

    la'8 la,  la la' la la, la la'
    la la, la la' la la, la la'
    sold4\fermata r r2

    %4
    sold8 sold, sold sold' sold sold, sold sold'
    sold sold, sold sold' sold sold, sold sold'
    fad4\fermata r r2

    %7
    fad8 fad, fad fad' fad fad, fad fad'
    fad fad, fad fad' fad fad, fad fad'
    mi4 r mi8 mi, mi mi'

    %10
    mi mi, mi mi' mi mi, mi mi'
    mi mi, mi mi' mi mi, mi mi'
    mi mi, mi mi' mi mi, mi mi'

    %13
    mi4 r8 mi'16 re dod8 si16 la sold8[la]
    mi4 r8 mi'16 re dod8 si16 la sold8[la]
    mi4 r8 mi' mi, re' mi, dod'

    %16
    mi, fad16 sold la8[dod,] re dod16 re mi8 mi
    la,4\fermopz r r2
    R1*9

    %27
    la'8 la,  la la' la la, la la'
    sold sold, sold sold' sold sold, sold sold'
    fad fad, fad fad' fad fad, fad fad'

    %30
    mi4 r\mbreak mi8 mi, mi mi'
    mi mi, mi mi' mi mi, mi mi'
    mi mi, mi mi' mi mi, mi mi'

    %33
    mi mi, mi mi' mi mi, mi mi'
    mi4 r8 mi'16 re dod8 si16 la sold8[la]
    mi4 r8 mi'16 re dod8 si16 la sold8[la]

    %36
    mi4 r8 mi' mi, re' mi, dod'
    mi, fad16 sold la8[dod,] re dod16 re mi8 mi
    la,8\p la' la la mi mi mi mi

    %39
    la la la la mi mi la la
    mi mi la la\mbreak mi mi la la
    mi mi la la mi mi la la

    %42
    mi4 r r2
    R1*7
    mi'8\tu  mi, mi mi' mi mi, mi mi '

    %51
    mi mi, mi mi ' mi mi, mi mi '
    red red, red red'  red red, red red'
    red? red, red red'  red red, red red'

    %54
    dod dod, dod dod' dod dod, dod dod'
    dod dod, dod dod' dod dod, dod dod'
    si4 r si, \p r

    %57
    si r si r
    si8\tu si si si mi4 r \mbreak
    mi \p r mi r

    %60
    mi r mi8\tu mi mi mi
    la4 r la,\p r
    la r la r

    %63
    la8\tu la la la re\pp re re re
    re re re re re re re re
    re re re re la la la la

    %66
    la la la la la la la la
    la la la la la la la la
    la la la la si si si si

    %69
    si si si si mi mi mi mi\mbreak
    mi mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi

    %72
    mi mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi
    la\tu la,  la la' la la, la la'

    %75
    sold sold, sold sold' sold sold, sold sold'
    fad fad, fad fad' fad fad, fad fad'
    mi4 r8 dod re dod r dod

    %78
    re dod r dod re4 r8 red
    mi red r red mi red r red\mbreak
    mi4 r8 mid fad mid r mid

    %81
    fad mid? r mid fad4 r8 fad
    sold fad r fad sold fad r fad
    sold4 r8 sold la sold r sold

    %84
    la sold r sold la sold la sold
    la sold la sold la sold la sold
    la4 fad8 fad fad fad fad fad

    %87
    sold4 mi8 mi mi mi mi mi
    fad4 re8 re re re re re
    mi4 r r2

    %90
    R1*19
    r2 la8 la, la la'
    la la, la la' sold sold, sold sold'

    %111
    sold sold, sold sold' fad fad, fad fad'
    fad fad, fad fad' mi4 r
    mi8 mi, mi mi' mi mi, mi mi'

    %114
    mi mi, mi mi' mi mi, mi mi'
    mi mi, mi mi' mi mi, mi mi'
    mi mi, mi mi' mi4 r8 mi'16 re

    %117
    dod8 si16 la sold8 la mi4 r8 mi'16 re
    dod8 si16 la sold8 la mi4 r8  mi'
    mi, re' mi, dod' mi,8 fad16 sold la8 dod,

    %120
    re dod16 re mi8 mi la,2\fermopz

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*9
    s2 <6 4>
    <5 3>4 s8 <6 4> <7 5> s s <6 4>
    <5 3> s s <6 4> <7 5> s s <6 4>
    <5 3>1
    s1*4
    s1*9
    s1*12
    s2 <7>
    <7> <7>
    <7> <7>
    s1*14
    <_+>1
    s1*3
    <7>1
    s
    s
    <7!>
    s2 <_!>
    s2 <5 3>
    s <3!>
    s1
    s2 <7 _+>
    s <_!>
    <_!> <_+>
    s <7>
    <7> <7>
    <7>1
    s1*16
    s1*19
    s1*4
    s2 <7>
    <6>1
    <7>4 s8 <6> <5> s s <6>
    <7> s s <6> <5>2

}

forma = {

    \key la\major
    \time 4/4
    \tempo 2 = 60
    s1*120
    \bar"|."


}

Ivl = {
    \Iglobal
    \notypeset
    <<\Ivln \forma>>

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
}

IIvln = \relative do'' {

    dod8 dod dod dod dod4 r
    sold8 sold sold sold sold4 r8 dod\solo
    re si16 dod re8 re re dod r fad16 re

    %4
    si8 sold16 la si8 si si la r sold16 dod
    red8 sid16 red fad8 fad fad  mi r16 dod(mi sold)
    la(fad) sold(la) red,(si) red(fad) sold(mi) fad(sold) dod,(la) dod(mi)

    %7
    fad red mi fad sid, sold sid red\mbreak mi4 r8 sold
    la16 sid, dod red red8. dod16 dod4 r
    fad,8\tu fad fad fad fad4\fermata r

    %10
    mi8 mi mi mi mi4 r16 la\solo dod mi
    la8 la, sold' sold sold fad r16 si, red fad
    si8 si, la'[la la sold] r16 dod,(mid sold)

    %13
    dod8 dod, si'[si] si la r16 fad la dod
    re si dod re sold,(mi sold) si\mbreak dod(la si) dod fad,(re fad) la
    si sold  la si mid, dod mid sold la4 r8 la

    %16
    sol fad sol fad mid4 r8 dod
    \senza \tuplet 3/2 { fad16(sold! la) sold[(la si)] la(sold fad)  si[(la sold)] la (si sold)  la[(si fad)] } sold8. fad16
    fad1\fermata

    %19
    dod8\tu dod dod dod dod4 r
    si8 si si si si4 r

}

IIvlIn =  \relative do'' {

    dod8 dod dod dod dod4 r
    sold8 sold sold sold sold4 r
    R1*6

    %9
    fad8 fad fad fad fad4\fermata r
    mi8 mi mi mi mi4 r
    R1*8

    %19
    dod'8 dod dod dod dod4 r
    si8 si si si si4 r

}

IIvlIIn = \relative do'' {

    sold8 sold sold sold sold4 r
    fad8 fad fad fad mid4 r
    R1*6

    %9
    dod8 dod dod dod re4\fermata r
    re8 re re re dod4 r
    R1*8

    %19
    sold'8 sold sold sold fad4 r
    fad8 fad fad fad mid4 r

}

IIbcn = \relative do {

    mi8\staccatissimo mi\staccatissimo mi\staccatissimo mi\staccatissimo fad4 r
    si,8 si si si dod4 r8 la'
    si4 sold la fad

    %4
    sold mi fad la
    sid, sold dod dod'
    fad, si mi, la

    %7
    red, sold dod, mi
    fad8 mi16 fad sold8 sold, dod4 r
    lad 8lad lad lad si4\fermopz r

    %10
    sold8 sold sold sold la4 r
    dod la re r
    red si mi r

    %13
    mid dod fad fad'
    si, mi la, re
    sold, dod fad,8 sold la fad

    %16
    si4 r8 si dod si dod si
    la4 r8 sold fad si dod dod,
    fad1

    %19
    mi8 mi mi mi re4 r
    re8 re re re dod4 r

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1
  <6 5+>

}

forma = {

  \key si\minor
  \time 4/4
  \tempo 4 = 43
  s1*20
  \bar"|."


}

IIvl = {
  \IIglobal
  \notypeset
  <<\IIvln \forma>>

}

IIvlI = {
  \IIglobal
  <<\IIvlIn \forma>>

}

IIvlII = {
  \IIglobal
  <<\IIvlIIn \forma>>

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

IIIvln = \relative do'' {

   la'8 la la la la la
   sold fad mi re dod si
   la' la la la la la

   %4
   sold fad mi re dod si
   la16 mi' dod mi dod mi dod mi dod mi dod mi
   si mi si mi si mi si mi si mi si mi

   %7
   dod mi dod mi dod mi dod mi dod mi dod mi
   si mi si mi si mi si mi si mi si mi
   dod8 la la la la la

   %10
   sold fad mi re dod si\mbreak
   la' la la la la la
   sold fad mi re dod si

   %13
   la4 la la
   sold sold' sold
   fad fad fad

   %16
   mi mi mi
   re re re
   mi mi mi

   %19
   la16\tu dod' dod dod dod dod dod dod dod dod dod dod
   si si si si si si si si si si si si
   la la la la la la la la la la la la

   %22
   sold sold sold sold sold sold sold sold sold sold sold sold\mbreak
   fad fad fad fad fad fad fad fad fad fad fad fad
   sold4 r r

   %25
   la16 la la la la la la la la la la la
   la la la la la la la la la la la la
   sold sold sold sold sold sold sold sold sold sold sold sold

   %28
   \con\terzinequarto \tuplet 3/2 { la8(si dod) } si4.(la8)
   \tuplet 3/2 { si8(dod re) } dod4.(si8)
   \tuplet 3/2 { dod(re mi) } re4. (dod?8)

   %31
   \tuplet 3/2 { re8(mi fad) } mi4.(re8)
   mi16 re dod si la4\tr r
   dod16 fad mi fad dod fad mi fad dod fad mi fad

   %34
   si,4\tr r8 si16 dod re dod re dod
   si mi re mi si mi re mi si mi re mi
   la,4\tr r8 la16 si dod si dod si

   %37
   la re dod re la re dod re la re dod re
   sold,4\tr r8 sold16 la si la si la
   sold dod si dod sold dod si dod  sold dod si dod \mbreak

   %40
   fad, si la si fad si la si fad si la si
   mi, sold fad mi la (fad) sold(mi) fad(red) mi(dod)
   si8 si' la sold fad mi

   %43
   red sold fad mi red dod
   si si' la sold fad mi
   red sold fad mi red dod

   %46
   si4. la'8[sold8. mi16]
   dod'8. mi,16 red4. mi8
   mi16\tu si' sold si sold si sold si sold si sold si

   %49
   fad si fad si fad si fad si fad si fad si
   sold si sold si sold si sold si sold si sold si\mbreak
   fad si fad si fad si fad si fad si fad si

   %52
   sold8 mi mi mi mi mi
   red dod si la sold fad
   mi' mi mi mi mi mi

   %55
   red dod si la sold fad
   \once\stemUp mi16 si'' sold si sold si sold si sold si sold si
   mid, sold mid sold mid sold mid sold mid sold mid sold

   %58
   fad la fad la fad la fad la fad la fad la
   red, fad red fad red fad red fad red fad red fad
   mi sold mi sold mi sold mi sold mi sold mi sold\mbreak

   %61
   dod, mi dod mi dod mi dod mi dod mi dod mi
   red fad red fad red fad red fad red fad red fad
   fad8\soli fad16 sold la(sold) la(sold) la(sold) la(sold)

   %64
   fad8 fad16 sold la(sold) la(sold) la(sold) la(sold)
   fad8 fad16 sold la(sold) la(sold) la(sold) la(sold)
   fad4 r mi16\tu mi mi mi

   %67
   mi mi mi mi red red red red red red red red
   <<
      {
         dod\solo sold' red sold mi sold red sold mi sold dod, sold'
         sid, sold' dod, sold' red sold dod, sold' red sold sid, sold'\mbreak

         %70
         dod, sold' red sold mi sold red sold mi sold dod, sold'
         sid, sold' dod, sold' red sold dod, sold' red sold sid, sold'
         dod, sold' red sold mi sold red sold mi sold dod, sold'

         %73
         la dod, si' dod, la' dod, si' dod, la' dod, sold' dod,
         red fad mi fad red fad mi fad red fad dod fad
         sold sid, la' sid, sold' sid, la' sid, sold' sid, fad' sid,

         %76
         dod mi red mi dod mi red mi dod mi si mi
         fad la, sold' la, fad' la, sold' la, fad' la, mi' la,
         re fad dod fad re fad dod fad re fad si fad

         %79
         la si, sold' si, la' si, sold' si, la' si, sold' si,
         red fad dod fad red fad dod fad red fad si, fad'
         la si, sold' si, la' si, sold' si, la' si, fad' si,
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \set Staff.midiInstrument = #"violin"

         %68bis parte
         \key la\major <<
            {
               sold'2.^\markup\italic\tiny"manoscritto"~
               sold~
               sold~
               sold~
               sold
               la8 si la si la sold
               fad2.
               sold8 la sold la sold fad
               mi2.
               fad8 sold fad sold fad mi
               fad2.
               la8 sold la sold la fad
               fad2.
               la8 sold la sold la fad\mbreak
            }\\{
               dod8 red  mi red mi dod
               sid dod red dod red sid
               dod red  mi red mi dod
               sid dod red dod red sid
               dod red  mi red mi dod
               dod2.
               red8 mi red mi red dod
               sid2.
               dod8 red dod red dod si
               la2.
               re8 dod re dod re si
               si2.
               red8 dod red dod red  si
               si2.
            }
         >>
      }
   >>

   %82
   <<sold'4\\\stemUp \override Stem #'transparent = ##t si,\\\stemDown mi,>> r r
   R2.*3
   si''16 mi si mi si mi si  mi si mi si mi

   %87
   dod mi dod mi dod mi dod mi dod mi dod mi
   si mi si mi si mi si  mi si mi si mi
   dod mi dod mi dod mi dod mi dod mi dod mi
   <<
      {
         %90
         mi, mi' fad, mi' sold, mi' fad, mi' sold, mi' fad, mi'
         mi, mi' fad, mi' sold, mi' fad, mi' sold, mi' fad, mi'
         mi, mi' fad, mi' sol, mi' fad, mi' sol, mi' fad, mi'

         %93
         mi, mi' fad, mi' sol, mi' fad, mi' sol, mi' fad, mi'\mbreak
         mi, mi' fad, mi' sold, !mi' fad, mi' sold, mi' fad, mi'
         fad , mi' fad, mi' fad , mi' fad, mi' fad , mi' fad, mi'

         %96
         fad , mi' fad, mi' fad , mi' fad, mi' fad , mi' fad, mi'
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \set Staff.midiInstrument = #"violin"

         %90bis parte
         \key la\major <<
            {
               mi2.~
               mi~
               mi~
               mi~
               mi~
               mi~
               mi
            }\\{
               mi,8 fad sold fad sold fad(
               mi) fad sold fad sold fad
               mi fad sol fad sol fad
               mi fad sol fad sol fad
               mi fad sold! fad sold fad
               fad2.~
               fad
            }
         >>
      }
   >>

   %97
   mi'16\tu si sold si sold si sold si sold si sold si
   fad si fad si fad si fad si fad si fad si
   sold8 mi mi mi mi mi

   %100
   red dod si la sold fad
   mi16 mi' si mi si mi si mi si mi si mi
   dod mi dod mi dod mi dod mi dod mi dod mi

   %103
   si mi si mi si mi si mi si mi si mi\mbreak
   dod8 la' la la la la
   sold fad  mi re dod si

   %106
   la16 la' mi la mi la mi la mi la mi la
   fad4 r r
   r16 si fad si fad si fad si fad si fad si

   %109
   sold4 r r
   r16 dod sold dod sold dod sold dod sold dod sold dod
   la4 r r

   %112
   r16 re la re la re la re la re la re
   sold, sold sold sold sold sold sold sold la la la la\mbreak
   la la la la sold sold sold sold sold sold sold sold

   %115
   la4\fermata r r
   <<
      {
         dod,16\solo la' si, la' la, la' si, la' dod, la' si, la'
         dod, la' si, la' la, la' si, la' dod, la' si, la'
         dod, la' si, la' la, la' si, la' dod, la' la, la'
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \set Staff.midiInstrument = #"violin"

         %116bis parte
         \key la\major <<
            {
               la2.~
               la~
               la
            }\\{
               dod,8 si la si dod si
               dod si la si dod si
               dod si la si dod la
            }
         >>
      }
   >>

   %119
   re16 fad la fad la fad la fad la fad la fad
   <<
      {
         red si' dod, si' si, si' dod, si' red, si' dod, si'
         red, si' dod, si' si, si' dod, si' red, si' dod, si'
         red ,si' dod, si' si, si' dod, si' red, si' si, si'
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \set Staff.midiInstrument = #"violin"

         %120bis parte
         \key la\major <<
            {
               si2.~
               si~
               si
            }\\{
               red,8 dod si dod red dod
               red dod si dod red dod
               red dod si dod red si
            }
         >>
      }
   >>

   %123
   mi16 sold si sold si sold si sold si sold si sold
   <<
      {
         mid dod' red, dod' dod, dod' red, dod' mid, dod' red, dod'\mbreak
         mid, dod' red, dod' dod, dod' red, dod' mid, dod' red, dod'
         mid, dod' red, dod' dod, dod' red, dod' mid, dod' dod, dod'
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \set Staff.midiInstrument = #"violin"

         %124bis parte
         \key la\major <<
            {
               dod2.~
               dod~
               dod
            }\\{
               mid,8 red dod red mid red
               mid red dod red mid red
               mid red dod red mid dod
            }
         >>
      }
   >>

   %127
   fad16 la dod la dod la dod la dod la dod la
   <<
      {
         fad re' mi, re' re, re' mi, re' fad, re' mi, re'
         fad, re' mi, re' re, re' mi, re' fad, re' mi, re'
         fad, re' mi, re' re, re' mi, re' fad, re' re, re'
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \set Staff.midiInstrument = #"violin"

         %128bis parte
         \key la\major <<
            {
               re2.~
               re~
               re
            }\\{
               fad,8 mi re mi fad mi
               fad mi re mi fad mi
               fad mi re mi fad re
            }
         >>
      }
   >>

   %131
   sold16 si re si re si re si re si re si
   <<
      {
         sold mi' fad, mi' mi, mi' fad, mi' sold, mi' fad, mi'
         sold, mi' fad, mi' mi, mi' fad, mi' sold, mi' fad, mi'
         sold, mi' fad, mi' mi, mi' fad, mi' sold, mi' mi, mi'
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \set Staff.midiInstrument = #"violin"

         %132bis parte
         \key la\major <<
            {
               mi2.~
               mi~
               mi
            }\\{
               sold,8 fad mi fad sold fad
               sold fad mi fad sold fad
               sold fad mi fad sold mi
            }
         >>
      }
   >>

   %135
   \stemDown dod'16 \stemUp la, la \stemDown dod'  dod \stemUp la, la \stemDown re' re \stemUp la,  la \stemDown mi''
   mi \stemUp la,, la \stemDown fad'' fad \stemUp la,, la \stemDown sold'' sold \stemUp la,, la \stemDown la''
   la \stemUp la,, la \stemDown la'' la \stemUp la,, la \stemDown la'' la \stemUp la,, la \stemDown la''

   %138
   \stemNeutral <<
      {
         dod, la' si, la' la, la' si, la' dod, la' si, la'
         dod, la' si, la' la, la' si, la' dod, la' si, la'
         dod, la' si, la' la, la' si, la' dod, la' si, la'

         %141
         la, mi si' mi, dod' mi, si' mi, dod' mi, si' mi,
         la mi mi la, fad' la, mi' la, fad' la, mi' la,
         re la la' mi si' mi, la mi si' mi, la mi

         %144
         sold mi re la mi' la, re la mi' la, re la
         dod la sold' mi la mi sold mi la mi sold mi
         fad mi dod la re la dod la re la dod la\mbreak

         %147
         si la fad' mi sold mi fad mi sold mi fad mi
         mi mi si la dod la si la dod la si la
         la la mi' mi fad mi mi mi fad mi mi mi

         %150
         re mi la, la si la la la si la la la
         sold la re mi mi mi re mi mi mi re mi
         dod mi mi  mi fad mi mi mi fad mi mi mi

         %153
         re mi fad mi sold mi fad mi sold mi fad mi
         mi mi sold mi la mi sold mi la mi sold mi
         fad mi la mi si' mi, la mi si' mi, la mi

         %156
         sold mi si' mi, dod' mi, si' mi, dod' mi, si' mi,
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol #'staff-space = #(magstep -3)
         \override StaffSymbol #'thickness = #(magstep -3)
      }
      {
         \set Staff.midiInstrument = #"violin"

         %138bis parte
         \key la\major <<
            {
               la'2.~
               la~
               la
               la,8 si dod si dod si
               la mi fad mi fad mi
               re la' si la si la
               sold re mi re mi re
               dod sold' la sold la sold
               fad dod re dod re dod
               si fad' sold fad sold fad
               mi si dod si dod si
               la mi' fad mi fad mi
               re la si la si la
               sold re' mi re mi re
               dod mi fad mi fad mi
               re fad sold fad sold fad
               mi sold la sold la sold
               fad la si la si la
               sold si dod si dod si
            }\\{
               dod8 si la si dod si
               dod si la si dod si
               dod si la si dod si
               mi,2.
               mi8 la, la2
               la8 mi' mi2
               mi8 la, la2
               la8 mi' mi2
               mi8 la, la2
               la8 mi' mi2
               mi8 la, la2
               la8 mi' mi2
               mi8 la, la2
               la8 mi' mi2~
               mi2.~
               mi~
               mi~
               mi~
               mi
            }
         >>
      }
   >>

   %157
   <<la8\\{mi16 la' la la}>>  la la la la la, la' la la
   si, la' la la dod, la' la la si,  la' la la
   la, la' la la si, la' la la dod, la' la la

   %160
   si, la' la la dod, la' la la si,  la' la la
   dod, la' la la dod, la' la la dod, la' la la
   si, la' la la si, la' la la si, la' la la

   %163
   si, sold' sold sold si, sold' sold sold si, sold' sold sold
   la8 la,\tu la la la la
   la la la la la la

   %166
   sold sold sold sold sold sold
   la2.\fermopz

}

IIIvlIn = \relative do'' {

   la'8 la la la la la
   sold fad mi re dod si
   la' la la la la la

   %4
   sold fad mi re dod si
   la16 mi' dod mi dod mi dod mi dod mi dod mi
   si mi si mi si mi si mi si mi si mi

   %7
   dod mi dod mi dod mi dod mi dod mi dod mi
   si mi si mi si mi si mi si mi si mi
   dod8 la la la la la

   %10
   sold fad mi re dod si\mbreak
   la' la la la la la
   sold fad mi re dod si

   %13
   la4 la la
   sold sold' sold
   fad fad fad

   %16
   mi mi mi
   re re re
   mi mi mi

   %19
   la16\f dod' dod dod dod dod dod dod dod dod dod dod
   si si si si si si si si si si si si
   la la la la la la la la la la la la

   %22
   sold sold sold sold sold sold sold sold sold sold sold sold\mbreak
   fad fad fad fad fad fad fad fad fad fad fad fad
   sold4 r r

   %25
   la16 la la la la la la la la la la la
   la la la la la la la la la la la la
   sold sold sold sold sold sold sold sold sold sold sold sold

   %28
   la4 r r
   R2.*4
   dod4\p  dod dod

   %34
   si si si
   si si si
   la la la

   %37
   la la la
   sold sold sold
   sold sold sold\mbreak

   %40
   fad fad fad
   mi r r
   la r r

   %43
   la r r
   la r r
   la r r

   %46
   la r sold
   sold fad2
   mi16\f si' sold si sold si sold si sold si sold si

   %49
   fad si fad si fad si fad si fad si fad si
   sold si sold si sold si sold si sold si sold si\mbreak
   fad si fad si fad si fad si fad si fad si

   %52
   sold8 mi mi mi mi mi
   red dod si la sold fad
   mi' mi mi mi mi mi

   %55
   red dod si la sold fad
   \once\stemUp mi16 si'' sold si sold si sold si sold si sold si
   mid, sold mid sold mid sold mid sold mid sold mid sold

   %58
   fad la fad la fad la fad la fad la fad la
   red, fad red fad red fad red fad red fad red fad
   mi sold mi sold mi sold mi sold mi sold mi sold\mbreak

   %61
   dod, mi dod mi dod mi dod mi dod mi dod mi
   red fad red fad red fad red fad red fad red fad
   fad4 r r

   %64
   fad r r
   fad r r
   fad r mi16 mi mi mi

   %67
   mi mi mi mi red red red red red red red red
   mi4 r r
   R2.*17

   %86
   sold8\p sold sold sold sold sold
   la la la la la la
   sold sold sold sold sold sold

   %89
   la la la la la la
   sold la si la si la
   sold la si la si la

   %92
   sol la si la si la
   sol la si la si la
   sold! la si la si la

   %95
   fad fad fad fad fad fad
   fad fad fad fad fad fad\mbreak
   sold16\f si sold si sold si sold si sold si sold si

   %98
   fad si fad si fad si fad si fad si fad si
   sold8 mi mi mi mi mi
   red dod si la sold fad

   %101
   mi16 mi' si mi si mi si mi si mi si mi
   dod mi dod mi dod mi dod mi dod mi dod mi
   si mi si mi si mi si mi si mi si mi\mbreak

   %104
   dod8 la' la la la la
   sold fad  mi re dod si
   la4 r r

   %107
   fad' r r
   fad r r
   sold r r

   %110
   sold r r
   la r r
   la r r

   %113
   sold16 sold sold sold sold sold sold sold la la la la
   la la la la sold sold sold sold sold sold sold sold
   la4\fermata r r

   %116
   R2.*48
   la8 la la la la la
   la la la la la la

   %166
   sold sold sold sold sold sold
   la2.\fermopz

}

IIIvlIIn = \relative do'' {

   la'8 la la la la la
   sold fad mi re dod si
   la' la la la la la

   %4
   sold fad mi re dod si
   la16 mi' dod mi dod mi dod mi dod mi dod mi
   si mi si mi si mi si mi si mi si mi

   %7
   dod mi dod mi dod mi dod mi dod mi dod mi
   si mi si mi si mi si mi si mi si mi
   dod8 la la la la la

   %10
   sold fad mi re dod si\mbreak
   la' la la la la la
   sold fad mi re dod si

   %13
   la16\solo mi'' re mi dod mi re mi dod mi re mi
   si mi re mi si mi re mi si mi re mi
   la, re dod re la re dod re la re dod re

   %16
   sold, dod si dod sold dod si dod sold dod si dod
   fad, si la si fad si la si fad si la si
   sold mi fad sold la si dod re mi si dod re

   %19
   dod\f dod' dod dod dod dod dod dod dod dod dod dod
   si si si si si si si si si si si si
   la la la la la la la la la la la la

   %22
   sold sold sold sold sold sold sold sold sold sold sold sold
   fad fad fad fad fad fad fad fad fad fad fad fad
   sold4 r r

   %25
   la16 la la la la la la la la la la la
   la la la la la la la la la la la la
   sold sold sold sold sold sold sold sold sold sold sold sold

   %28
   sold4 r r
   R2.*4
   dod4\p dod dod

   %34
   si si si
   si si si
   la la la

   %37
   la la la
   sold sold sold
   sold sold sold\mbreak

   %40
   fad fad fad
   mi r r
   la r r

   %43
   la r r
   la r r
   la r r

   %46
   la r sold
   sold fad2
   mi16\f si' sold si sold si sold si sold si sold si

   %49
   fad si fad si fad si fad si fad si fad si
   sold si sold si sold si sold si sold si sold si\mbreak
   fad si fad si fad si fad si fad si fad si

   %52
   sold8 mi mi mi mi mi
   red dod si la sold fad
   mi' mi mi mi mi mi

   %55
   red dod si la sold fad
   \once\stemUp mi16 si'' sold si sold si sold si sold si sold si
   mid, sold mid sold mid sold mid sold mid sold mid sold

   %58
   fad la fad la fad la fad la fad la fad la
   red, fad red fad red fad red fad red fad red fad
   mi sold mi sold mi sold mi sold mi sold mi sold\mbreak

   %61
   dod, mi dod mi dod mi dod mi dod mi dod mi
   red fad red fad red fad red fad red fad red fad
   red8 red16 mi fad mi fad mi fad mi fad mi

   %64
   red8 red16 mi fad mi fad mi fad mi fad mi
   red8 red16 mi fad mi fad mi fad mi fad mi
   red?4 r  mi16 mi mi mi

   %67
   mi mi mi mi red red red red red red red red
   mi4 r r
   R2.*13

   %82
   r16 mi\solo si mi si mi si mi si mi si mi
   dod mi dod mi dod mi dod mi dod mi dod mi
   si mi si mi si mi si mi si mi si mi

   %85
   dod mi dod mi dod mi dod mi dod mi dod mi
   sold8\p sold sold sold sold sold
   la la la la la la
   sold sold sold sold sold sold

   %89
   la la la la la la
   sold la si la si la
   sold la si la si la

   %92
   sol la si la si la
   sol la si la si la
   sold! la si la si la

   %95
   fad fad fad fad fad fad
   fad fad fad fad fad fad\mbreak
   sold16\f si sold si sold si sold si sold si sold si

   %98
   fad si fad si fad si fad si fad si fad si
   sold8 mi mi mi mi mi
   red dod si la sold fad

   %101
   mi16 mi' si mi si mi si mi si mi si mi
   dod mi dod mi dod mi dod mi dod mi dod mi
   si mi si mi si mi si mi si mi si mi\mbreak

   %104
   dod8 la' la la la la
   sold fad  mi re dod si
   la4 r r

   %107
   r16 re la re la re la re la re la re
   si4 r r
   r16 mi si mi si mi si mi si mi si mi

   %110
   dod4 r r
   r16 fad dod fad dod fad dod fad dod fad dod fad
   re4 r r

   %113
   sold16 sold sold sold sold sold sold sold la la la la
   la la la la sold sold sold sold sold sold sold sold
   la4\fermata r r

   %116
   R2.*48
   la8 la la la la la
   la la la la la la

   %166
   sold sold sold sold sold sold
   la2.\fermopz

}

IIIvlan =  \relative do' {

   mi4 r8 la mi mi
   mi4 r8 si' mi, mi
   mi4 r8 la mi mi

   %4
   mi4 r8 si' mi, mi
   mi4 r8 la mi mi
   mi4 r8 si' mi, mi

   %7
   mi4 r8 la mi mi
   mi4 r8 si' mi, mi
   mi la la la la la

   %10
   sold fad mi re dod  si\mbreak
   la' la la la la la
   sold fad mi re dod  si

   %13
   la4 r r
   R2.*5
   mi'16 mi mi mi mi mi mi mi mi mi mi mi

   %20
   fad fad fad fad mi mi mi mi mi mi mi mi
   mi mi mi mi re re re re re re re re
   re re re re dod dod dod dod dod  dod dod dod

   %23
   dod dod dod' dod si si si si si si si si\mbreak
   si4 r r
   mi,16 mi mi mi mi mi mi mi mi mi mi mi

   %26
   fad fad fad fad fad fad fad fad fad fad fad fad
   mi mi mi mi mi mi mi mi mi mi mi mi
   mi4 r r

   %29
   R2.*4
   la4\p la la
   re re re

   %35
   mi mi mi
   dod dod dod
   re re re

   %38
   si si si
   dod dod dod\mbreak
   la si si,

   %41
   mi r r
   si r r
   si r r

   %44
   si r r
   si r r
   si r mi

   %47
   la si si,
   mi4 r8 mi si si
   si4 r8 fad' si, si

   %50
   si4 r8 mi si si
   si4 r8 fad' si, si\mbreak
   mi4 r8 mi si si

   %53
   si4 r8 fad' si, si
   si4 r8 mi si si
   si4 r8 fad' si, si

   %56
   si sold' sold sold sold sold
   sold 4 r r
   dod8 dod dod dod dod dod

   %59
   fad,4 r r
   si8 si si si sold[sold]
   mi4 r r

   %62
   la8 la la la la la
   red,4 r r\mbreak
   red? r r

   %65
   red? r r
   red? r sold16 sold sold sold
   la la la la sold sold sold sold sold sold sold sold

   %68
   mi4 r r
   R2.*28
   si4 r8 mi si si

   %98
   si4 r8 fad' si, si
   si4 r8 mi si si
   si4 r8 fad' si, si

   %101
   si4 r8 mi sold mi\mbreak
   mi4 r8 la mi mi
   mi4 r8 si' mi, mi

   %104
   mi4 r8 la mi mi
   mi4 r8 si' mi, mi
   mi4 r r

   %107
   re r r
   fad r r
   si, r r

   %110
   sold' r r
   dod, r r
   la' r r

   %113
   si16 si si si si si si si mi, mi mi mi\mbreak
   fad fad fad fad mi mi mi mi mi mi mi mi
   mi4\fermata r r

   %116
   R2.*48
   mi8 mi mi mi mi mi
   fad fad fad fad fad fad

   %166
   mi mi mi mi mi mi
   mi2.\fermopz

}

IIIbcn = \relative do {

   la4 dod la
   mi' sold mi
   la, dod la

   %4
   mi' sold mi
   la, dod la
   mi' sold mi

   %7
   la, dod la
   mi' sold mi
   la8 la la la la la

   %10
   sold fad mi re dod si
   la' la la la la la
   sold fad mi re dod si

   %13
   la4 la la
   sold sold' sold
   fad fad fad

   %16
   mi mi mi\mbreak
   re re re
   mi mi mi

   %19
   la16 la la la la la la la la la la la
   \clef tenor re re re re mi mi mi mi  mi mi mi mi
   dod dod dod dod re re re re re re re re

   %22
   si si si si dod dod dod dod dod dod dod dod
   la la la la si si si si si si si si
   \clef bass mi,4 r r

   %25
   la16 la la la\mbreak la la la la la la la la
   re, re re re re re re re re re re re
   mi mi mi mi mi mi mi mi mi mi mi  mi

   %28
   la,4 la la
   sold sold sold
   la la la'

   %31
   si sold mi
   la8 sold fad mi re dod
   la4 r r

   %34
   R2.*14
   mi'4 sold mi
   si' red si

   %50
   mi, sold mi
   si' red si\mbreak
   mi, sold mi

   %53
   si' red si
   mi, sold mi
   si' red si

   %56
   mi,8 mi mi mi mi mi
   dod'4 r r
   fad,8 fad fad fad fad fad

   %59
   red'4 r r
   mi,8 mi mi mi mi mi
   la4 r r

   %62
   fad8 fad fad fad fad fad
   fad4 r r
   <red si> r r

   %65
   <red si> r r
   <red si> r la16 la la la
   fad' fad fad fad\mbreak sold sold sold sold sold, sold sold sold

   %68
   dod4 r r
   sold' r r
   dod, r r

   %71
   sold' r r
   dod, r r
   fad r r

   %74
   si, r r
   sold r r
   dod r r

   %77
   fad r r
   si, r r
   si r r

   %80
   si r r
   si r r
   mi r r\mbreak

   %83
   R2.*14
   mi4 sold mi
   si' red si

   %99
   mi, sold mi
   si' red si
   mi, sold mi

   %102
   la, dod la
   mi' sold mi
   la, dod la

   %105
   mi' sold mi
   la r r
   re,  r r

   %108
   fad r r
   si, r r
   mi r r

   %111
   la, r r\mbreak
   la r r
   mi'16 mi mi mi mi mi mi mi la la la la

   %114
   re, re re re mi mi mi mi mi, mi mi mi
   la4\fermata r r
   la\p r r

   %117
   la r r
   la r r
   <fad' re> r r

   %120
   si, r r
   si r r
   si r r

   %123
   <mi si> r r
   dod r r\mbreak
   dod r r

   %126
   dod r r
   fad r r
   re r r

   %129
   re r r
   re r r
   mi r r

   %132
   mi r r
   fad r r
   mi r r

   %135
   la,\fermata r r
   R2.*28
   la8 la la la la la

   %165
   re re re re re re\mbreak
   mi mi mi mi mi mi
   la,2.\fermata

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s2.*19
   <6 5>2.
   <6 5>
   <6 5>
   s
   <7>
   s2.*37
   <6+>2.
   s2.*4
   <7 5>4 <6 4> <3>
   s2.
   <_+>
   s
   <_+>
   s
   s
   <_+>
   <7>
   s
   s
   <_+>
   s2.*41
   <_+>2.

}

forma = {

   \key la\major
   \time 3/4
   \tempo 2 = 60
   s2.*167
   \bar"|."


}

IIIvl = {
   \IIIglobal
   %\notypeset
   <<\IIIvln \forma>>

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
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] All[egr]o"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""principale"}
            \Ivl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"\vspace #-0.2"di Ripieno"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"2.do"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.2"Cembalo"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup\huge "[2.] Grave"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new Staff  = "main" \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"violin"
            \IIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"cello"
            \IIbc
        >>
    >>

    \layout {

        indent = 0.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

\markup\huge "[3.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIIbc
        >>
    >>

    \layout {

        indent = 0.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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






