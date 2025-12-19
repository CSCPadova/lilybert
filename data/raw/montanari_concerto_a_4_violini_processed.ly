\language "italiano"
\version "2.24.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph "scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

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
}

IvlIn = \relative do'' {

    dod16^\tu
    dod8. [re16 re8. re16] re4 r8 r16 dod
    dod8.[dod16 dod8. dod16] dod4 r8 r16 si
    si8.[si16 si8. si16] si8.[dod16 la8. si16]

    %4
    la4 sold fad8 dod' fad4~
    fad8[mi mi re16 dod] re2~
    re8 dod fad4. mid8 la sold

    %7
    fad4 la,8 si mi,4 r8 dod'
    sold'4 dod8 si la sold fad4~
    fad sold8 [fad mi dod] mi4~

    %10
    mi8 sol! fad mi re si re4~
    re8 fad mi re dod la fad'4
    sold la sold r8 fad\p

    %13
    sold4 la sold r8 r16 dod,\f
    re8.[re16 re8. dod16] sid4 r8 r16 sid
    dod8.[dod16 dod8. si?16] lad4 r8 r16 lad

    %16
    si8.[si16 dod8. re16] dod8.[sold16 la?8. fad16]\mbreak
    fad4 mid fad r8 r16 si
    si4 r8 r16 sid\p sid4 r8 r16 dod

    %19
    dod2 r\fermata
    fad8 dod la fad dod la r4
    la''8 fad dod la fad dod r4

    %22
    dod''8 la fad dod la fad r la'16 si
    dod re dod re dod re dod re dod re dod re dod re dod re
    si dod si dod la si la si sold4 r

    %25
    la16\p fad dod fad la fad dod fad sold[mid dod mid sold mid dod mid]
    fad4 dod si mid
    fad16 dod la dod fad  mi re dod re4 re,

    %28
    mi'?16 si sold si mi re dod si\mbreak <<
        {
            \stemUp la'mi la mi la mi la mi
            sold mi sold mi sold mi sold mi la mi la mi la mi la mi
            sold mi sold mi sold mi sold mi la mi la mi la mi la mi

            %31
            sold mi sold mi sold mi sold mi la mi la mi la mi la mi
            sold mi sold mi sold mi sold mi la mi la mi la mi la mi
            fad4\f la la sold

            %34
            la
        }\\{
            dod,16\solo la dod la dod la dod la
            si la si la si la si la dod la dod la dod la dod la
            si la si la si la si la dod la dod la dod la dod la
            si la si la si la si la dod la dod la dod la dod la
            si la si la si la si la dod la dod la dod la dod la
            re4 dod si si
            dod
        }
    >> r4 <<
        {
            mi,16\p mi mi mi mi mi mi mi
            fad4 la la sold

            %36
            la
        }\\{
            dod,16 la dod la dod la dod la
            re4 dod si si
            la
        }
    >> r4 r2
    la''8^\tu mi dod la mi dod r4
    dod''8 la mi dod la mi r4

    %39
    mi''8 dod la mi dod la r8 dod'16 re\mbreak
    mi\solo fad mi fad  mi fad mi fad  mi fad mi fad  mi fad mi fad
    re mi re mi dod re dod re si4 r

    %42
    la16 mi dod mi la mi dod mi sold mi si mi sold mi si mi
    dod4 la si sold'
    la16[mi dod mi la sold fad mi] fad4 fad,

    %45
    sold'16[re si re sold fad mi re] mi4 mi,
    fad'16[dod la dod fad mi re dod] re4 re,
    mi'16 si sold si mi re dod si dod4 r8 r16 fad

    %48
    sold4 la sold r8 r16 fad\p
    sold4 la sold r
    fad'16 [dod la dod fad mi re dod] re mi fad mi re mi dod re

    %51
    mi[si sold si mi re dod si] dod re mi re dod re si dod\mbreak
    re la fad la re dod si la si dod re dod si dod la si
    dod sold mid sold dod si la sold <<
        {
            la[la la la la la la la]

            %54
            sold [sold sold sold sold sold sold sold] la[la la la la la la la]
            sold [sold sold sold sold sold sold sold] la[la la la la la la la]
            sold [sold sold sold sold sold sold sold] la[la la la la la la la]

            %57
            sold [sold sold sold sold sold sold sold] la[la la la la la la la]
            si4 la sold sold
            la
        }\\{
            fad16[dod fad dod fad dod fad dod]
            mid[dod mid dod mid dod mid dod] fad[dod fad dod fad dod fad dod]
            mid[dod mid dod mid dod mid dod] fad[dod fad dod fad dod fad dod]
            mid[dod mid dod mid dod mid dod] fad[dod fad dod fad dod fad dod]
            mid[dod mid dod mid dod mid dod] fad[dod fad dod fad dod fad dod]
            mid4 fad fad mid
            fad
        }
    >> r <<
        {
            dod16\p[dod dod dod dod dod dod dod]

            %60
            si4 la fad mid
            fad
        }\\{
            la16[fad la fad la fad la fad]
            mid4 fad dod dod
            dod
        }
    >> r4 r2
    si'4 r sid4. dod8

    %63
    dod1\fermata

}

IvlIIn = \relative do'' {

    dod16
    dod8. [re16 re8. re16] re4 r8 r16 dod
    dod8.[dod16 dod8. dod16] dod4 r8 r16 si
    si8.[si16 si8. si16] si8.[dod16 la8. si16]

    %4
    la4 sold fad8 dod' fad4~
    fad8[mi mi re16 dod] re2~
    re8 dod fad4. mid8 la sold

    %7
    fad4 la,8 si mi,4 r8 dod'
    sold'4 dod8 si la sold fad4~
    fad sold8 [fad mi dod] mi4~

    %10
    mi8 sol! fad mi re si re4~
    re8 fad mi re dod la fad'4
    sold la sold r8 fad\p

    %13
    sold4 la sold r8 r16 dod,\f
    re8.[re16 re8. dod16] sid4 r8 r16 sid
    dod8.[dod16 dod8. si?16] lad4 r8 r16 lad

    %16
    si8.[si16 dod8. re16] dod8.[sold16 la?8. fad16]\mbreak
    fad4 mid fad r8 r16 si
    si4 r8 r16 sid\p sid4 r8 r16 dod

    %19
    dod2 r\fermata
    fad8 dod la fad dod la r4
    la''8 fad dod la fad dod r4

    %22
    dod''8 la fad dod la fad r la'16 si
    dod re dod re dod re dod re dod re dod re dod re dod re
    si dod si dod la si la si sold4 r

    %25
    la16\p fad dod fad la fad dod fad sold[mid dod mid sold mid dod mid]
    fad4 dod si mid
    fad16 dod la dod fad  mi re dod re4 re,

    %28
    mi'?16 si sold si mi re dod si\mbreak mi\solo mi, mi' mi, mi' mi, mi' mi,
    mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi,
    mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi,

    %31
    mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi,
    mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi, mi' mi,
    la4\f fad' si, re

    %34
    dod r mi,16\p dod mi dod mi dod mi dod
    fad4 mi re re
    dod4 r r2

    %37
    r la''8^\tu mi dod la
    mi dod r4 dod''8 la mi dod
    la mi mi' dod la' dod, r la'16 si\mbreak

    %40
    dod\solo re dod re dod re dod re  dod re dod re  dod re dod re
    si dod si dod la si la si sold4 r
    dod, la' si, sold'

    %43
    la16 mi dod mi la mi dod mi sold mi si mi sold mi si mi
    dod4 mi, re'16 la fad la re dod si la
    si4 si, dod'16 sold mi sold dod si la sold

    %46
    la4 la, si'16 fad re fad si la sold fad
    sold4 si mi, r8 r16 dod'
    dod4 fad mid r8 r16 dod\p

    %49
    dod4 fad mid r
    la, dod re re,
    sold si dod dod,\mbreak

    %52
    fad la si si,
    mid sold dod'16 [dod, dod' dod, dod' dod, dod' dod,]
    dod' [dod, dod' dod, dod' dod, dod' dod,] dod' [dod, dod' dod, dod' dod, dod' dod,]

    %55
    dod' [dod, dod' dod, dod' dod, dod' dod,] dod' [dod, dod' dod, dod' dod, dod' dod,]
    dod' [dod, dod' dod, dod' dod, dod' dod,] dod' [dod, dod' dod, dod' dod, dod' dod,]
    dod' [dod, dod' dod, dod' dod, dod' dod,] dod' [dod, dod' dod, dod' dod, dod' dod,]

    %58
    sold'4 fad sold, si
    la r <<{fad16\p[fad fad fad fad fad fad fad]}\\{dod[ la dod la dod la dod la]}>>
    sold'4 fad re dod

    %61
    la r r2
    fad'4 r fad4. fad8
    mid1\fermata

}

IvlIIIn = \relative do'' {

    la16
    la8.[la16 la8. la16] sold4 r8 r16 sold
    sold?8.[sold16 sold8. sold16] fad4 r8 r16 fad
    fad8.[fad16 fad8. fad16] mid8. [mid16 fad8. sold16]

    %4
    fad4 mid fad r8 r16 fad
    dod'2~dod8 si fad sold
    la4. sold16 fad sold8 dod, dod'4

    %7
    re4. re8 re dod fad4~
    fad mid fad la8 sold
    fad mi? red4 sold,4. re'8

    %10
    dod4. dod8 fad,4. dod'8
    si4. si8 mi,4 r8 dod'
    dod4 fad mid r8 dod\p

    %13
    dod4 fad mid r8 r16 sold,\f
    la8.[la16 la8. la16] sold4 r8 r16 sold
    sold?8.[sold16 sold8. sold16] fad4 r8 r16 fad

    %16
    fad8.[re'16 dod8. si16] la8.[dod16 fad,8. sold16]\mbreak
    la4 sold fad r8 r16 fad
    fad4 r8 r16 fad\p fad4 r8 r16 mid

    %19
    mid?2 r\fermata
    r2 fad'8 dod la fad
    dod la r4 la''8 fad dod la

    %22
    fad dod dod'' [la fad la, ] r8 fad'16 sold
    la si la si la si la si la si la si la si la si
    sold la sold la fad sold fad sold mid4 r

    %25
    dod\p fad si, mid
    la16 fad dod fad la fad dod fad sold mid dod mid sold mid dod mid
    fad4 la, si16 fad re fad si la sold fad

    %28 OOKK
    sold4 r\mbreak dod dod,
    mi' mi, r2
    mi'4 mi, r2

    %31
    mi'4 mi, r2
    mi'4 mi, r2
    fad'4\f la la sold

    %34
    la r mi,\p la
    fad la la sold
    la r r2

    %37
    R1*2
    r2 dod8 la r4\mbreak
    dod8 re mi re dod re mi dod

    %41
    fad4 la sold r
    la16 mi dod mi la mi dod mi sold mi si mi sold mi si mi
    dod4 la si sold'

    %44
    la16[mi dod mi la sold fad mi] fad4 fad,
    sold'16[re si re sold fad mi re] mi4 mi,
    fad'16[dod la dod fad mi re dod] re4 re,

    %47
    mi'16 si sold si mi re dod si dod4 r8 r16 fad
    sold4 la sold r8 r16 fad\p
    sold4 la sold r

    %50
    dod, _\markup\italic {\dynamic p assai} la fad si,
    si' sold mi la,\mbreak
    la' fad red sold,

    %53
    sold' mid dod r
    dod'4 dod, r2
    dod'4 dod, r2

    %56
    dod'4 dod, r2
    dod'4 dod, r2
    mid'4 fad fad mid

    %59
    fad r fad,\p la
    mid fad fad mid
    fad r r2

    %62
    si4 r sid4. dod8
    dod1\fermata

}

IvlIVn = \relative do'' {

    la16
    la8.[la16 la8. la16] sold4 r8 r16 sold
    sold?8.[sold16 sold8. sold16] fad4 r8 r16 fad
    fad8.[fad16 fad8. fad16] mid8. [mid16 fad8. sold16]

    %4
    fad4 mid fad r8 r16 fad
    dod'2~dod8 si fad sold
    la4. sold16 fad sold8 dod, dod'4

    %7
    re4. re8 re dod fad4~
    fad mid fad la8 sold
    fad mi? red4 sold,4. re'8

    %10
    dod4. dod8 fad,4. dod'8
    si4. si8 mi,4 r8 dod'
    dod4 fad mid r8 dod\p

    %13
    dod4 fad mid r8 r16 sold,\f
    la8.[la16 la8. la16] sold4 r8 r16 sold
    sold?8.[sold16 sold8. sold16] fad4 r8 r16 fad

    %16
    fad8.[re'16 dod8. si16] la8.[dod16 fad,8. sold16]\mbreak
    la4 sold fad r8 r16 fad
    fad4 r8 r16 fad\p fad4 r8 r16 mid

    %19
    mid?2 r\fermata
    r2 fad'8 dod la fad
    dod la r4 la''8 fad dod la

    %22
    fad dod dod'' [la fad la, ] r8 fad'16 sold
    la si la si la si la si la si la si la si la si
    sold la sold la fad sold fad sold mid4 r

    %25
    dod\p fad si, mid
    la16 fad dod fad la fad dod fad sold mid dod mid sold mid dod mid
    fad4 la, si16 fad re fad si la sold fad

    %28 OOKK
    sold4 r\mbreak mi' mi,
    mi' mi, r2
    mi'4 mi, r2

    %31
    mi'4 mi, r2
    mi'4 mi, r2
    la4\f fad' si, re

    %34
    dod r la\p mi
    fad mi re re
    dod r r2
    R1*3

    %40
    dod''16 re dod re dod re dod re  dod re dod re  dod re dod re
    si dod si dod la si la si sold4 r
    dod, la' si, sold'

    %43
    la16 mi dod mi la mi dod mi sold mi si mi sold mi si mi
    dod4 mi, re'16 la fad la re dod si la
    si4 si, dod'16 sold mi sold dod si la sold

    %46
    la4 la, si'16 fad re fad si la sold fad
    sold4 si mi, r8 r16 dod'
    dod4 fad mid r8 r16 dod\p

    %49
    dod4 fad mid r
    la,_\markup\italic {\dynamic p assai} dod re re,
    sold si dod dod,\mbreak

    %52
    fad la si si,
    mid sold dod dod,
    dod'4 dod, r2

    %55
    dod'4 dod, r2
    dod'4 dod, r2
    dod'4 dod, r2

    %58
    sold''4 fad sold, si
    la r fad\p dod
    sold' fad re dod

    %61
    la r r2
    fad'4 r fad4. fad8
    mid1\fermata

}

Ibcn = \relative do {

    r16
    fad4 fad mid r
    mi! mi red r
    re! re dod fad,

    %4
    dod' dod, fad r
    R1
    r4 r8 fad' dod'2~

    %7
    dod8 si fad sold la4. si8
    dod4 dod, fad, fad'8 mi
    red dod sid4 dod4. si8

    %10
    lad4. lad8 si4. lad8
    sold4. sold8 la4 r8 la'
    mid4 fad dod r8 la'\p

    %13
    mid4 fad dod r
    fad\f fad fad r
    mi? mi mi r

    %16
    re re la si\mbreak
    dod4 dod, fad r8 r16 re'
    re4 r8 r16 red\p red4 r8 r16 dod

    %19
    dod2 r\fermata
    fad4 r fad r
    fad r fad r

    %22
    fad r fad r
    fad8 sold la sold fad sold la fad
    si4 fad dod r

    %25
    fad fad, dod'' dod,
    fad fad, dod'' dod,
    fad fad, si' si,

    %28
    mi mi,\mbreak la' la,
    mi' r la la,
    mi' r la\p la,

    %31
    mi' r la la,
    mi' r la\f  la,
    re la mi' mi,

    %34
    la r dod\p la
    re la mi' mi,
    la r r2

    %37
    la'4 r la r
    la r la r
    la r la r\mbreak

    %40 OOKK
    <<
        {
            la8 si dod si la si dod la
            re4 la mi
        }\\{
            la,8 si dod si la si dod la
            re4 la mi'
        }
    >> r
    la la, mi' mi,

    %43
    la' la, mi' mi,
    la' la, re re,
    sold' sold, dod dod,

    %46
    fad' fad, si' si,
    mi mi, la r8 r16 la'
    mid4 fad dod r8 r16 la'\p

    %49
    mid4 fad dod r
    fad\p la si si,
    mi sold la la,\mbreak

    %52
    re fad sold sold,
    dod mid fad fad,
    dod' r fad fad,

    %55
    dod' r fad fad,
    dod' r fad fad,
    dod' r fad fad,

    %58
    si fad dod' dod,
    fad r la\p fad
    si fad dod' dod,

    %61
    fad r \parenthesize r2
    re'4 r red2
    dod1\fermata

}

Ibfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {
    \key si\minor
    \time 4/4
    \tempo 4 = 60
    \partial 16 s16
    s1*19\bar "||"\once \override Score.RehearsalMark.extra-offset = #'(+5 . 0)
    \mark\markup "All[egr]o"
    \tempo 2 = 60
    \repeat volta 2{
        s1*17
    }
    \tempo 2 = 60
    \repeat volta 2 {
        s1*25
    }
    \bar ":|."\override Score.RehearsalMark.extra-offset = #'(+5 . -1)
    \mark\markup "Ad[agi]o"
    \tempo 4 = 60
    s1*2
    \bar"|."

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


IvlIV = {
    \Iglobal
    <<\IvlIVn \forma>>

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
}

IIvlIn = \relative do'' {

    dod4\tu fad mid
    fad dod re
    si sold dod

    %4
    la fad fad'~
    fad mi dod
    re si sold'~

    %7
    sold fad red
    mid dod dod'~
    dod si sold

    %10
    la mid fad~
    fad4. sold8 sold4
    fad dod sold

    %13
    la dod sold
    la mi' si
    dod mi si

    %16
    dod fad mi
    r re dod
    r si la

    %19
    re2-! dod-! si-!
    la4 fad' mi
    r re dod

    %23
    r si la
    re2-! dod-! si-!
    la2.

    %27
    mi'4 la sold
    la mi fad
    re si mi

    %30
    dod la la'~
    la sol? mi
    fad re si'~

    %33
    si\p la fad
    sold mi mi'~
    mi re si

    %36
    dod sold la~
    la4. si8 si4
    la mi si

    %39
    dod mi si
    dod fad dod
    re fad dod

    %42
    re fad2~
    fad4 re si
    sol! mi'2~

    %45
    mi4 dod la
    fad re'2~
    re4 si sol

    %48
    mi dod' mi
    lad, fad\solo(dod')\mbreak
    re re re,

    %51
    dod fad(dod')
    re re re,
    dod fad(dod')

    %54
    re re re,
    si mi(si')
    dod dod dod,

    %57
    si mi(si')
    dod dod la
    sold dod(sold')

    %60
    la dod, la
    sold dod(sold'?)
    fad, dod'(la')

    %63
    mi, dod'(sold')
    re, si'( fad')
    mid r r

    %66
    fad r r
    sold r r
    la r r

    %69
    mid r r
    dod\parenthesize \tu fad mid
    fad dod re\mbreak

    %72
    si sold dod
    la fad fad'~
    fad mi dod

    %75
    re si sold'~
    sold fad red
    mid dod dod'~

    %78
    dod si sold
    la mid fad~
    fad4. sold?8 sold4

    %81
    fad re dod
    r si la
    r sold fad

    %84
    si2-! la-! sold-!
    la4 re-!\p dod-!
    r si la

    %88
    r sold fad
    si2-! la-! sold-!
    la2.

}

IIvlIIn = \relative do'' {

    dod4 fad mid
    fad dod re
    si sold dod

    %4
    la fad fad'~
    fad mi dod
    re si sold'~

    %7
    sold fad red
    mid dod dod'~
    dod si sold

    %10
    la mid fad~
    fad4. sold8 sold4
    fad dod sold

    %13
    la dod sold
    la mi' si
    dod mi si

    %16
    dod fad mi
    r re dod
    r si la

    %19
    re2-! dod-! si-!
    la4 fad' mi
    r re dod

    %23
    r si la
    re2-! dod-! si-!
    la2.

    %27
    mi'4 la sold
    la mi fad
    re si mi

    %30
    dod la la'~
    la sol? mi
    fad re si'~

    %33
    si\p la fad
    sold mi mi'~
    mi re si

    %36
    dod sold la~
    la4. si8 si4
    la mi si

    %39
    dod mi si
    dod fad dod
    re fad dod

    %42
    re fad2~
    fad4 re si
    sol! mi'2~

    %45
    mi4 dod la
    fad re'2~
    re4 si sol

    %48
    mi dod' mi
    lad, r r\mbreak
    r fad'4 fad,

    %51
    fad r r
    r fad' fad,
    fad r r

    %54
    r fad' fad,
    mi r r
    r mi' mi,

    %57
    mi r r
    r dod' dod,
    dod r r

    %60
    r dod' dod,
    dod r r
    la' r r

    %63
    sold r r
    fad r r
    sold r r

    %66
    dod r r
    dod r r
    dod r r

    %69
    dod r r
    la dod si
    dod si la\mbreak

    %72
    si sold dod
    la fad fad'~
    fad mi dod

    %75
    re si sold'~
    sold fad red
    mid dod dod'~

    %78
    dod si sold
    la mid fad~
    fad4. sold?8 sold4

    %81
    fad re dod
    r si la
    r sold fad

    %84
    si2-! la-! sold-!
    la4 re-!\p dod-!
    r si la

    %88
    r sold fad
    si2-! la-! sold-!
    la2.

}

IIvlIIIn = \relative do'' {

    la4 dod si
    dod si la
    sold la sold

    %4
    dod, la' si
    dod2 lad4
    fad si dod

    %7
    red2 sid4
    sold mid' fad
    sold2 mid4

    %10
    dod si la
    sold la si
    la la dod~

    %13
    dod la dod~
    dod dod mi~
    mi dod mi~

    %16
    mi dod si
    r la sold
    r fad mi

    %19
    sold2-! la-! sold-!
    la4 dod si
    r la sold

    %23
    r fad mi
    sold2-! la-! sold-!
    la2.

    %27
    dod4 mi re
    mi re dod
    si la si

    %30
    mi, dod' re
    mi2 dod4
    la re mi

    %33
    fad2\p red4
    si sold' la
    si2 sold4

    %36
    mi re dod
    si dod re
    dod dod mi~

    %39
    mi dod mi~
    mi re fad~
    fad re fad~

    %42
    fad r r
    r re2~
    re4 si sol

    %45
    la, dod'2~
    dod4 la fad
    sol, si'2~

    %48 OOKK
    si4 sol mi
    dod r r\mbreak
    r re' re,

    %51
    dod r r
    r re' re,
    dod r r

    %54
    r re' re,
    si r r
    r dod' dod,

    %57
    si r r
    r dod' la
    sold r r

    %60
    r dod la
    sold r r
    fad r r

    %63
    mi r r
    re r r
    mid' r r

    %66
    fad r r
    sold r r
    la r r

    %69
    mid r r
    dod fad mid
    fad dod re\mbreak

    %72
    sold,4 la sold
    dod, la' si
    dod2 lad4

    %75
    fad si dod
    red2 sid4
    sold mid' fad

    %78
    sold2 mid4
    dod si la
    sold la si

    %81
    la la sold
    r fad mi
    r re dod

    %84
    mid2-! fad-! mid-!
    fad4 la\p sold
    r  fad mi

    %88
    r re dod
    mid2-! la-! mid-!
    fad2.

}

IIvlIVn = \relative do'' {

    la4 dod si
    dod si la
    sold la sold

    %4
    dod, la' si
    dod2 lad4
    fad si dod

    %7
    red2 sid4
    sold mid' fad
    sold2 mid4

    %10
    dod si la
    sold la si
    la la dod~

    %13
    dod la dod~
    dod dod mi~
    mi dod mi~

    %16
    mi dod si
    r la sold
    r fad mi

    %19
    sold2-! la-! sold-!
    la4 dod si
    r la sold

    %23
    r fad mi
    sold2-! la-! sold-!
    la2.

    %27
    dod4 mi re
    mi re dod
    si la si

    %30
    mi, dod' re
    mi2 dod4
    la re mi

    %33
    fad2\p red4
    si sold' la
    si2 sold4

    %36
    mi re dod
    si dod re
    dod dod mi~

    %39
    mi dod mi~
    mi re fad~
    fad re fad~

    %42
    fad r r
    r re2~
    re4 si sol

    %45
    la, dod'2~
    dod4 la fad
    sol, si'2~

    %48 OOKK
    si4 sol mi
    dod r r\mbreak
    r fad' fad,

    %51
    fad r r
    r fad' fad,
    fad r r

    %54
    r fad' fad,
    mi r r
    r mi' mi,

    %57
    mi r r
    r dod' dod,
    dod r r

    %60
    r dod' dod,
    dod r r
    la' r r

    %63
    sold r r
    fad r r
    sold r r

    %66
    dod r r
    dod r r
    dod r r

    %69
    dod r r
    la dod si
    dod si la\mbreak

    %72
    sold4 la sold
    dod, la' si
    dod2 lad4

    %75
    fad si dod
    red2 sid4
    sold mid' fad

    %78
    sold2 mid4
    dod si la
    sold la si

    %81
    la la sold
    r fad mi
    r re dod

    %84
    mid2-! fad-! mid-!
    fad4 la\p sold
    r  fad mi

    %88
    r re dod
    mid2-! la-! mid-!
    fad2.

}

IIbcn = \relative do {

    fad,4 fad' sold
    la fad2~
    fad4 mid2

    %4
    fad,4 fad' sold
    lad2 fad4
    si sold lad

    %7
    sid2 sold4
    dod dod, red
    mid2 dod4

    %10
    fad dod re
    si dod dod,
    fad fad' mid

    %13
    fad, fad' mid
    fad, la' sold
    la, la' sold

    %16
    la, la' sold
    fad, fad' mi?
    re, re' dod

    %19
    si2-! la-! mi-!
    la4 la' sold
    fad, fad' mi

    %23
    re, re' dod
    si2-! la-! mi-!
    la2.\mbreak

    %27
    la4 la' si
    dod la2~
    la4 sold2

    %30
    la,4 la' si
    dod2 la4
    re, si' dod

    %33
    red2 si4
    mi mi, fad
    sold2 mi4

    %36
    la mi fad
    re mi mi,
    la la' sold

    %39
    la, la' sold
    la, si' lad
    si, si' lad

    %42
    si, r r
    si fad' si~
    si sol! mi

    %45
    dod mi la~
    la fad re
    si re sol~

    %48
    sol mi dod
    fad, r r
    r si' si, %%% OOKK

    %51
    lad r r
    r si' si,
    lad r r

    %54
    r si' si,
    sold r r
    r la' la,

    %57
    sold r r
    r la' fad
    mid r r

    %60
    r fad, fad'
    mid r r
    fad r r

    %63
    mi? r r
    re r r
    dod r r

    %66
    la' r r
    mid r r
    fad r r

    %69
    dod r r
    fad, fad' sold
    la fad2~\mbreak

    %72
    fad4 mid2
    fad,4 fad' sold
    lad2 fad4

    %75
    si sold lad
    sid2 sold4
    dod dod, red

    %78
    mid2 dod4
    fad dod re?
    si dod dod,

    %81
    fad fad' mi?
    re, re' dod
    si si' la

    %84
    sold2-! fad-! dod-!
    fad,4 fad'\p-! mi-!
    re, re' dod

    %88
    si si' la
    sold2-! fad-! dod-!
    fad,2.

}

IIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {
    \key si\minor
    \time 3/4
    \tempo 2. = 67
    s2.*26
    \bar ":..:"
    s2.*65
    \bar ":|."

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


IIvlIV = {
    \IIglobal
    <<\IIvlIVn \forma>>

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
}

IIIvlIn = \relative do'' {

    fad8(sold) fad4 la,
    fad dod fad
    la dod la'

    %4
    sold2 fad4
    fad8(sold) fad4 la,
    fad dod fad

    %7
    la dod sid'
    dod2.
    dod8 re dod4 mi

    %10
    lad,2 \tr si4
    si8 dod si4 re
    sold,2 la4

    %13
    sol! mid fad
    re sid dod
    sol! mid fad

    %16
    re sid dod\mbreak
    fad sold mid
    fad2.

}

IIIvlIIn = \relative do'' {

    fad8(sold) fad4 la,
    fad dod fad
    la dod la'

    %4
    sold2 fad4
    fad8(sold) fad4 la,
    fad dod fad

    %7
    la dod sid'
    dod2.
    dod8 re dod4 mi

    %10
    lad,2 \tr si4
    si8 dod si4 re
    sold,2 la4

    %13
    sol! mid fad
    re sid dod
    sol! mid fad

    %16
    re sid dod\mbreak
    fad sold mid
    fad2.

}

IIIvlIIIn = \relative do'' {

    fad8(sold) fad4 dod
    la la, la'
    dod fad dod

    %4
    mid2 fad4
    fad8(sold) fad4 la,
    fad la, fad'

    %7
    la dod sid'
    dod2.
    dod8 re dod4 mi

    %10
    lad,2 \tr si4
    si8 dod si4 re
    sold,2 la4

    %13
    sol! mid fad
    re sid dod
    sol! mid fad

    %16
    re sid dod\mbreak
    fad sold mid
    fad2.

}

IIIvlIVn = \relative do'' {

    fad8(sold) fad4 dod
    la la, la'
    dod fad dod

    %4
    mid2 fad4
    fad8(sold) fad4 la,
    fad la, fad'

    %7
    la dod sid'
    dod2.
    dod8 re dod4 mi

    %10
    lad,2 \tr si4
    si8 dod si4 re
    sold,2 la4

    %13
    sol! mid fad
    re sid dod
    sol! mid fad

    %16
    re sid dod\mbreak
    fad sold mid
    fad2.

}

IIIbcn = \relative do {

    fad4 r r
    fad, r r
    fad' la, fad

    %4
    dod'2 fad,4
    fad' r r
    fad, r r

    %7
    fad' re2
    dod2.
    R

    %10
    fad2 si,4
    R2.
    mi2 la,4

    %13
    R2.*4
    la4 si dod
    fad,2.

}

IIIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {

    \key si\minor
    \time 3/4
    \tempo 2. = 60
    s2.*8
    \bar ":..:"
    s2.*10
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


IIIvlIII = {
    \IIIglobal
    <<\IIIvlIIIn \forma>>

}


IIIvlIV = {
    \IIIglobal
    <<\IIIvlIVn \forma>>

}



IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller {"Concerto a 4 Violini in Fa# minore"}
    composer = \markup \center-column {"A. Montanari (1676-1727)"}

}

\markup\huge "[1.] Ad[agi]o"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new PianoStaff
        <<
            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"[Violini""I e II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.shortInstrumentName = "vlII"
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>
        >>

        \new PianoStaff <<

            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"[Violini""III e IV]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vlIII"
                \IvlIII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vlIV"
                \IvlIV
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column\smaller{"[Basso]"}
            \set Staff.midiInstrument = #"contrabass"
            \Ibc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

\markup\huge "[2.] All[egr]o"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new PianoStaff
        <<
            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"[Violini""I e II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.shortInstrumentName = "vlII"
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new PianoStaff <<

            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"[Violini""III e IV]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vlIII"
                \IIvlIII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vlIV"
                \IIvlIV
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column\smaller{"[Basso]"}
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

%\pageBreak

\markup\huge "[3.] Minuetto"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new PianoStaff
        <<
            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"[Violini""I e II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.shortInstrumentName = "vlII"
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>
        >>

        \new PianoStaff <<

            \new Staff
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"[Violini""III e IV]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vlIII"
                \IIIvlIII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vlIV"
                \IIIvlIV
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column\smaller{"[Basso]"}
            \set Staff.midiInstrument = #"contrabass"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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
