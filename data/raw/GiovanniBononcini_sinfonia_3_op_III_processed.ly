\language "italiano"
\version "2.24.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

ten = _\markup \italic \center-align "ten"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

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
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}


IvlIn = \relative do'' {

    la'2 r
    la la4 sol
    fad mi re la'

    %4
    la sold la r
    R1
    la4 sol? fad la

    %7
    si2 la
    sol8 fad mi8. mi16 fad4 mi
    mi la mi fad

    %10
    dod mi2 re4
    mi sol2 fad4
    mi fad mi4. mi8

    %13
    fad1

    %% Allegro
    r8 re fad re la'16 sol la si la sol fad mi
    fad mi fad sol fad la sol fad mi4 fad

    %16
    fad8 fad fad fad la4 la~
    la r8 la fad la la8. sold16
    la8 la, dod la re16 dod re mi re mi fad re

    %19
    dod si dod re dod re mi dod re4 si'~
    si la2 sold4
    la r r8 re, fad re

    %22
    la'16 sol la si la sol fad mi fad sol fad mi fad la sol fad
    mi4 r\mbreak r8 re fad re
    mi16 re mi fad mi sol fad mi fad4 r

    %25
    r2 r4 re~
    re dod re8 la'16 sol fad mi re dod
    si8 si'16 la sol fad mi re dod4 r

    %28
    sol' r mi r
    re r mi8 la16 sol fad8 sol16 fad
    mi8 fad mi8. mi16 fad8. la16 sol8. fad16

    %31
    mi8 la sol8. fad16 mi8 fad mi8. re16
    dod4 r r2
    mi4 r\mbreak r si'8 la16. sol32

    %34
    fad4 r8 fad si2
    la~la4 sol~
    sol la8 fad mi fad mi8. mi16

    %37
    fad4 r r8 la, dod dod
    re4 r r2
    r4 r8 dod re re  re mi

    %40
    dod4 fad mi4. mi8
    fad re fad re la'16 sol la si la sol fad mi
    fad mi fad sol fad la sol fad mi4 r8 mi

    %43
    fad8 fad fad fad la4 la~
    la r8 la fad la la8. sold16
    la8 dod, dod la\mbreak re16 dod re mi re mi fad re

    %46
    dod si dod re dod re mi dod re8 fad si4~
    si la2 sol4~
    sol fad mi4. mi8

    %49
    fad1

    %% Adagio
    fad4 fad si, r
    si' si lad si~

    %52
    si lad si lad
    sold fad mi fad
    mi4. mi8 fad4 si

    %55
    lad si8 fad sold4 mi
    fad4. mi8 re4 sol?~
    sol fad2 mi4

    %58
    fad1

    %% Vivace
    fad4 r r
    la r r

    %61
    fad r r
    mi r r
    re r r

    %64
    fad r r
    la r r
    fad r r

    %67
    mi r r
    sold r r
    la r r

    %70
    la la sold
    la r r
    fad r r

    %73
    mi r r
    re r r
    fad r r

    %76
    fad r r\mbreak
    si si lad
    si r r

    %79
    lad r r
    fad r r
    la? r r

    %82
    fad r r
    mi r r
    fad r r

    %85
    mi r r
    sold r r
    la la sold

    %88
    la r r
    fad r r
    la r r

    %91
    fad r r
    mi r r
    re r r

    %94
    fad r r
    la la mi
    fad fad mi

    %97
    fad r r

}


IvlIIn = \relative do'' {

    fad2 r
    mi r
    la4 sol fad mi

    %4
    re2 dod4 r
    R1
    r2 la'4 la~

    %7
    la sol2 fad4
    mi8 re mi8. mi16 re4 mi\mbreak
    dod r r la'

    %10
    mi dod mi r
    mi re dod re
    mi re2 dod4

    %13 OOKK
    re1

    %% Allegro
    r2 r8 la dod la
    re16 dod re mi re8. re16\mbreak dod4 r8 dod

    %16
    re re re re mi4 r8 mi
    fad8 mi mi mi re dod si8. si16
    dod4 r r8 re, fad re

    %19
    la'16 sol la si la sol fad mi\mbreak fad8 la' sol fad
    mi4 fad mi8 dod si8. si16
    dod4 r r2

    %22
    r r8 re fad re
    la'16 sol la si la sol fad mi fad2
    r r8 la, dod la\mbreak

    %25
    si16 la si dod si re dod si dod8 la re fad
    mi4. mi8 re4 r
    re r la8 la'16 sol fad mi re dod

    %28
    si8 si'16 la sol fad mi re dod4 r\mbreak
    re r la8 dod re mi16 re
    dod8 re re8. dod16 re8. fad16 mi8. re16

    %31
    dod4 r r8 la' sol8. fad16
    mi4 r r2
    la,8 dod si8. la16\mbreak sol8 re'16 mi fad4~

    %34
    fad8 sol la4 la sol~
    sol fad re r8 mi
    dod mi re2 dod4

    %37
    re r r2
    R1
    r8 la dod la\mbreak si16 la si dod si re dod si

    %40
    dod4 re2 dod4
    re r \mbreak r8 la dod la
    re16 dod re mi re8 re dod4 r8 dod

    %43
    re re re re mi4 r8 mi
    fad re dod mi re dod si8. si16
    dod4 r\mbreak r8 re, fad re

    %46
    la'16 sol la si la sol fad mi fad8 fad' sol fad
    mi4 re si2
    dod4 re2 dod4

    %49
    re1

    %% Adagio
    re4 dod re r
    re re\mbreak dod re

    %52
    dod4. dod8 re4 r
    mi re dod re~
    re dod re re

    %55
    dod re si dod
    re4. mi8 fad4 sol,
    la2 si

    %58
    dod1

    % Vivace
    fad4 r r\mbreak
    mi r r

    %61
    re r r
    dod r r
    re r r

    %64
    re r r
    fad r r
    la r r

    %67
    dod, r r
    re r r\mbreak
    mi r r

    %70
    mi si si
    dod r r
    la r r

    %73
    dod r r
    re r r
    re r r

    %76
    dod r r
    re dod dod
    re r r\mbreak

    %79
    dod r r
    re r r
    re r r

    %82
    re r r
    dod r r
    la r r

    %85
    dod r r
    mi r r\mbreak
    fad si, si

    %88
    dod r r
    fad r r
    mi r r

    %91
    re r r
    dod r r
    re r r

    %94
    re r r\mbreak
    fad fad dod
    re re dod

    %97
    re r r

}


IvlIIIn = \relative do'' {

    re2 r
    dod r
    r re4 r8 mi

    %4
    si4. si8 dod4 r
    mi re dod si
    la r la re~

    %7
    re r8 mi la,4 re~\mbreak
    re dod re si
    dod r r2

    %10
    r r4 la'
    mi r mi re
    dod re mi4. mi8

    %13
    re1

    %% Allegro
    R1
    r8 re, fad re la'16 sol la si la sol fad mi\mbreak

    %16
    fad mi' fad sol fad la sol fad mi4. mi8
    re4 r r8 la si8. si16
    la4 r fad'16 mi fad sol fad sol la fad

    %19
    mi4 dod8. mi16 re4 r8 re
    dod2\mbreak si8 la si8. si16
    la8 la dod la re16 dod re mi re mi fad sol

    %22
    mi4 dod re re
    r8 dod mi dod fad4 r8 fad,
    sol sol sol la fad4 r\mbreak

    %25
    r2 r8 dod' fad re
    mi16 re mi fad mi sol fad mi fad4 r
    sol r mi8 fad16 mi re8 fad,

    %28
    sol sol'16 fad mi re dod si la4 r
    si r\mbreak la8 mi' re si
    mi re mi8. mi16 re4 r

    %31
    la r r2
    r8 la' sol8. fad16 mi8 fad mi8. re16
    dod4 r8 re mi4 la~

    %34
    la re,2 r8 mi\mbreak
    la,4 re8 la' si2
    mi,4 fad8 la mi re mi8. mi16

    %37
    re4 r r2
    r8 re fad re mi16 re mi fad mi sol fad mi
    fad4 r r2

    %40
    mi4 la\mbreak mi4. mi8
    re4 r r2
    r8 re, fad re la'16 sol la si la sol fad mi\mbreak

    %43
    fad mi' fad sol fad la sol fad mi4. mi8
    re4 r r8 la si8. si16
    la4 r fad'16 mi fad sol fad sol la fad

    %46
    mi4 dod8. mi16 re4 r8 re
    dod4 re2 mi4
    dod la8 re mi4. mi8

    %49
    re1

    %% Adagio
    re4 fad re r
    re si dod si

    %52
    dod4. dod8 si sol' fad4
    mi r mi r
    mi4. mi8 re4 re

    %55
    fad re2 dod4
    re si8 dod re4 mi\mbreak
    dod re si2

    %58
    lad1

    %% Vivace
    r4 re r
    r dod r

    %61
    r re r
    r la r
    r la r

    %64
    r re r
    r re r
    r re r\mbreak

    %67
    r dod r
    r sold r
    r dod r

    %70
    la si si
    la la r
    r la r

    %73
    r la r
    r fad r
    r la r\mbreak

    %76
    r la r
    si dod dod
    si si r

    %79
    r dod r
    r si r
    r la r

    %82
    r la r
    r mi' r
    r re r

    %85
    r dod r\mbreak
    r si r
    si si si

    %88
    la la r
    r la r
    r dod r

    %91
    r re r
    r la r
    r la r

    %94
    r re r
    re mi mi\mbreak
    re la mi'

    %97
    re r r

}


IvlIVn = \relative do'' {

    la2 r
    la r
    r la4 r8 la

    %4
    re4 r8 mi mi4 re
    dod si la r
    re mi fad r8 fad\mbreak

    %7
    si, dod re la la2
    si8 la la8. la16 la4 si
    la r r2

    %10
    r4 dod sold la~
    la si dod la
    la la la4. la8

    %13
    la1

    %% Allegro
    R1
    r2 r8 la dod la

    %16
    re16 dod re mi re8. re16 dod si dod re dod re dod si
    la8. si16 dod8 la fad la mi8. mi16
    mi4 r8 mi\mbreak fad fad la fad

    %19
    dod'4 mi8. la,16 la4 si
    dod2 mi,4. mi8
    mi4 r r2

    %22
    r8 la dod la re16 mi re dod re fad mi re
    dod4 r8 dod\mbreak la4 r
    r2 r4 la~

    %25
    la sold la r8 la
    la4. la8 la4 r
    si r dod r

    %28
    si r dod8 dod16 si la sol fad mi\mbreak
    re8 re'16 dod si la sol fad mi4 fad8 mi
    la la la8. la16 la4 r

    %31
    dod r r2
    r r8 la' sol8. fad16
    mi4 r8 fad sol si,16 dod re4~\mbreak

    %34
    re re si2
    r4 re re r8 si
    dod4 r8 re si la la8. la16

    %37
    la4. la8 la4 r
    r r8 fad sol sol sol la\mbreak
    fad4 r r2

    %40
    la4 r8 re si4 la
    la r r2\mbreak
    r2 r8 la dod la

    %43
    re16 dod re mi re8. re16 dod si dod re dod re dod si
    la8 si dod8. la16 fad8 mi mi8. mi16
    mi4 r8 mi\mbreak fad fad la fad

    %46
    dod'4 mi8 la, la re si4
    dod la si2
    mi,8 la la la la4. la8

    %49
    la1

    %% Adagio
    si4 dod si r
    si fad lad fad

    %52
    fad4. fad8\mbreak fad4 r
    sol r la la
    la2 la4 fad

    %55
    lad fad8 si sold4 la!
    la r fad mi
    la re, r si'

    %58
    fad1

    %% Vivace
    r4 la r
    r la r

    %61
    r la r
    r dod r
    r la r

    %64
    r la r
    r la r
    r re r

    %67
    r mi r
    r mi r
    r mi, r\mbreak

    %70
    mi fad mi
    mi mi r
    r fad r

    %73
    r dod' r
    r la r
    r fad r

    %76
    r fad r
    fad fad fad
    fad fad r

    %79
    r fad r\mbreak
    r re' r
    r re r

    %82
    r la r
    r la r
    r la r

    %85
    r la r
    r mi r
    fad fad mi

    %88
    mi mi r\mbreak
    r mi r
    r la r

    %91
    r la r
    r dod r
    r la r

    %94
    r la r
    la la la\mbreak
    la la la

    %97
    la r r

}


IvlaIn = \relative do' {

    re2 r
    mi r
    r re4 r8 la

    %4
    si2 la4 r
    dod r r2
    re4 r re re~

    %7
    re si'\mbreak r re,
    si8 re r la' fad4 sol
    mi r r2

    %10
    r mi4 la~
    la re, mi fad
    dod8 la4 la'8 la2

    %13
    fad1

    %% Allegro
    R1*2
    r2 r8 la, dod dod

    %17
    re4 r8 mi fad mi mi8. mi16
    dod8 dod mi la16 sol fad2
    r8 la mi la fad mi re si

    %20
    mi4 la,\mbreak si8 dod mi8. mi16
    dod8 dod mi la16 sol fad8 fad re4
    dod8 dod mi dod la4 r8 si

    %23
    dod mi mi mi re fad la fad
    mi4 r8 la fad4 r8 la16 sol\mbreak
    fad8 fad si mi, mi4 fad8 la

    %26
    la4 r8 la fad4 r
    re r8 sol mi4 r8 la
    re,4 r la' r

    %29
    r2 r8 la la4~
    la8 la la8. la16\mbreak fad4 r
    la r r2

    %32
    R1
    mi4 r mi r
    fad4. fad8 re4 sol8 mi

    %35
    re4 r re r8 sol
    mi4 r8 fad sol la la4
    fad8 fad la fad\mbreak dod'16 si dod re dod re dod si

    %38
    la8 fad la fad mi4. mi8
    re4 mi8 la fad4 si,
    la la si dod

    %41
    la r r2
    R1
    r2 r8 la dod dod\mbreak

    %44
    re4 r re8 mi mi4
    dod8 dod mi la16 sol fad4 r
    r8 dod dod dod fad fad re re

    %47
    mi4 la sol mi~
    mi fad la4. la8
    fad1

    %50 Adagio
    fad4 fad\mbreak fad r
    fad fad fad fad
    fad2 fad4 r

    %53
    r2 la4 fad
    la4. la8 fad4 fad
    fad fad mi mi

    %56
    re r r8 fad sol si
    la2 sol4 si,\mbreak
    fad'1

    %59 Vivace
    fad4 r r
    la r r

    %61
    la r r
    la r r
    la r r

    %64
    la r r
    la r r
    la r r

    %67
    la r r\mbreak
    sold r r
    mi r r

    %70
    mi r mi
    dod r r
    la' r r

    %73
    la r r
    la r r
    la r r

    %76
    la r r\mbreak
    fad fad fad
    re r r

    %79
    fad r r
    fad r r
    fad r r

    %82
    fad r r
    la r r
    la r r

    %85
    la r r
    sold r r
    fad fad sold

    %88
    mi mi r
    fad r r
    dod r r

    %91
    fad r r
    la r r
    la r r

    %94
    la r r
    la la la
    fad la la

    %97
    fad r r

}

Ivcn = \relative do {

    re2 r
    la r
    re4 r re dod

    %4
    si mi la, r
    la r la' sol
    fad mi re8 mi fad re\mbreak

    %7
    sol la si dod re dod re fad,
    sol re la' la, re4 sol,
    la r r2

    %10
    r4 la' mi fad
    dod si la re
    la1

    %13
    re

    %% Allegro
    R1*2

    %16
    r8 re fad re la'16 sol la si la si la sol
    fad8 sol la dod,\mbreak re la mi' mi,
    la4 la'16 sol fad mi re2

    %19
    r8 la' dod la re dod si sol
    la2 mi8 la mi mi,
    la4 la'16 sol fad mi\mbreak re4 r8 sol,

    %22
    la4 la'8. sol16 fad4 r8 sol
    la la dod la re4 re~
    re dod4 re8 dod16 si la sol fad mi

    %25
    re8 re mi mi,\mbreak la4 r8 re
    la' re, la' la, re4 r
    sol, r la r

    %28
    sol r la8 la'16 sol fad mi re dod
    si8 si'16 la sol fad mi re\mbreak dod8 la re sol
    la re, la' la, re4 r8 sol,

    %31
    la4 r r2
    R1
    r8  la' sol8. fad16 mi8 sol fad8. mi16

    %34
    re8 mi fad re sol la si dod\mbreak
    re dod re fad, sol la si sol
    la sol fad re sol re la' la,

    %37
    re re fad re la'16 sol la si la si la sol
    fad8 re   re'2 dod4\mbreak
    re la2 sold4

    %40
    la fad sol? la
    re,4 r r2
    R1

    %43
    r8 re fad re la'16 sol la si la si la sol
    fad8 sol la dod,\mbreak re la mi' mi,
    la4 la'16 sol fad mi re4 r

    %46
    r8 la' dod la\mbreak re re, sol re
    la'4 fad sol2
    la4 re, la2

    %49 OOKK
    re1

    %% Adagio
    si'4 lad si r
    si, si fad' si,

    %52
    fad' fad, si r
    mi fad8 sol la4 re,
    la2 re4 si

    %55
    fad' si, mi la,
    re r si mi
    fad2 sol

    %58
    fad1

    %%Vivace
    re8 dod re mi fad sol
    la sol la si dod la\mbreak

    %61
    re dod re re, fad sol
    la si la sol fad mi
    fad sol fad mi re dod

    %64
    re re' dod si la sol
    fad si la sol fad mi
    re mi fad re fad sold\mbreak

    %67
    la sold la si dod re
    mi fad mi re dod si
    dod re dod si la sold

    %70
    la dod re si mi mi,
    la si dod la si dod
    \clef tenor \key re\major re mi fad re fad sol

    %73
    la si la sol fad mi
    fad sol fad sol fad mi
    re la si dod re mi

    %76
    fad mi re dod si lad
    \clef bass \key re\major si si, fad' si fad fad,\mbreak
    si lad si dod re mi

    %79
    fad sold lad fad sold lad
    si si la sol fad mi
    fad sol fad mi re dod

    %82
    re mi fad re fad sol\mbreak
    la re dod la si dod
    re dod re re, fad sol

    %85
    la sold la si dod re
    mi re dod si dod la
    re dod si re mi mi,

    %88
    la si la sol fad mi\mbreak
    re dod re mi fad sol
    la sol la si dod la

    %91
    re dod re re, fad sol
    la si la sol fad mi
    fad sol fad mi re dod

    %94
    re re' dod si la sol\mbreak
    fad re fad sol la la,
    re mi fad sol la la,

    %97
    re4 r r

}

Ibcn = \relative do {

    re2 r
    la r
    re4 r re dod

    %4
    si mi la, r
    la r la' sol
    fad mi re8 mi fad re\mbreak

    %7
    sol la si dod re dod re fad,
    sol re la' la, re4 sol,
    la r r2

    %10
    r4 la' mi fad
    dod si la re
    la1

    %13
    re

    %% Allegro
    \clef violin \key re\major r8 re'' fad re la' la, dod la
    re re, fad re la' la dod la

    %16
    re \clef bass \key re\major re,, fad re la'16 sol la si la si la sol
    fad8 sol la dod,\mbreak re la mi' mi,
    la4 la'16 sol fad mi re2

    %19
    r8 la' dod la re dod si sol
    la2 mi8 la mi mi,
    la4 la'16 sol fad mi\mbreak re4 r8 sol,

    %22
    la4 la'8. sol16 fad4 r8 sol
    la la dod la re4 re~
    re dod4 re8 dod16 si la sol fad mi

    %25
    re8 re mi mi\mbreak la,4 r8 re
    la' re, la' la, re4 r
    sol, r la r

    %28
    sol r la8 la'16 sol fad mi re dod
    si8 si'16 la sol fad mi re\mbreak dod8 la re sol
    la re, la' la, re4 r8 sol,

    %31
    la1~
    la
    la8  la' sol8. fad16 mi8 sol fad8. mi16

    %34
    re8 mi fad re sol, la si dod\mbreak
    re dod re fad sol la si sol
    la sol fad re sol re la' la,

    %37
    re re fad re la'16 sol la si la si la sol
    fad8 re  \clef tenor \key re\major re'2 dod4\mbreak
    re \clef bass \key re\major la2 sold4

    %40
    la fad sol? la
    re,8 \clef violin \key re\major re'' fad re la' la, dod la
    re re, fad re la' la dod la

    %43
    re \clef bass \key re\major re,, fad re la'16 sol la si la si la sol
    fad8 sol la dod,\mbreak re la mi' mi,
    la4 la'16 sol fad mi re4 r

    %46
    r8 la' dod la\mbreak re re, sol re
    la'4 fad sol2
    la4 re, la2

    %49 OOKK
    re1

    %% Adagio
    si'4 lad si r
    si, si fad' si,

    %52
    fad' fad, si r
    mi fad8 sol la4 re,
    la2 re4 si

    %55
    fad' si, mi la,
    re r si mi
    fad2 sol

    %58
    fad1

    %%Vivace
    re4 r r
    la r r

    %61
    re r r
    la' r r
    fad r r

    %64
    re r r
    fad4. sol8 fad mi
    re4 r r

    %67
    la r r\mbreak
    mi' r r
    dod r r

    %70
    la re mi
    la, r r
    re r r

    %73
    la' r r
    re, r r
    re r r

    %76
    fad r r\mbreak
    si, fad' fad,
    si r r

    %79
    fad'4. fad8 sold lad
    si4 r r
    fad r r

    %82
    re r r
    la r r
    re4. re8 fad sol\mbreak

    %85
    la4 r r
    mi r dod
    re2 mi4

    %88
    la, r r
    re r r
    la' r r

    %91
    re,4. re8 fad sol\mbreak
    la si la sol fad mi
    fad4 r r

    %94
    re r r
    fad r la
    re, r la

    %97
    re r r

}

Ibfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    s2 s4 <6>
    <7> <7 _+> s2
    s1
    <6>4 <6> s <6>
    <9 8> <6> s <6>
    <6>4 s s <6>
    s1
    s2 <_+>4 <6>
    <6> <6> <7> s
    <5 3> <6 4> <5 4> <3>
    s1

%%% Allegro
    s1*2
    s4 <6>  s2
    <6>4 s8 <6> <6 5>4 <4>8 <3+>
    s1
    s4 <6> s8 <6> <6> s
    <9 5>4 <8 6> <_+>2
    s2 s4 s8 <5>
    s4 s8. <6>16 <6>2
    s4 <6> s2
    s4 <5->8 <6> s2
    <5>4 <_+> s2
    <4>4 <3> s2
    s1
    s
    <6>2 <6>4 s8 <6>
    s4 <4>8 <3> s2
    s1*2
    s2 s4 <6>
    s <6> <9 8> s
    <4> <3>8 <6> <9 8>4 <6>8 <6>
    <7> <6> <6> s <6 5>4 <4>8 <3>
    s4 <6> s2
    <6>4 <2>2 <5->8 <6>
    s4 <2>2 <5->8 <6>
    s4 <6> <6 5> s
    s1*2
    s4 <6> s2
    <6>4 s8 <6> <6 5>4 <4>8 <3+>
    s1
    s4 <6> s2
    <9>4 <6> <9 5> <8 6>
    <7>2 <4>4 <3>
    s1

    %% Adagio
    s1
    <_->4 s <_+> <_->
    <4> <3+> <_->2
    <_->4 <6> s2
    <4>4 <3> s <_->
    <_+> <_-> <7 _-> s
    s2 <_->4 <_->
    <9 5> <8 6> <7> <6>
    <_+>1

    %% Vivace
    s2.*4
    <6>2.
    s
    <6>
    s2.*2
    <_+>2.
    <6>
    s4 <6 5> <_+>
    s2.*5
    <5>2.
    <_->4  <4> <3+>
    <_->2.
    <_+>
    <_->
    <6>
    s2.*4
    <_+>4 s <6>
    <6 5>2 <_+>4
    s2.*5
    <6>2.
    s
    <6>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 4 = 50
    \once \override Score.RehearsalMark.extra-offset = #'(-2 . -1)
    \mark\markup\huge "1. Adagio"
    s1*13
    \bar "||"\break
    \override Score.RehearsalMark.extra-offset = #'(-2 . -1)
    \mark\markup\huge "2. Allegro"
    \time 4/4
    \tempo 2 = 60
    s1*36
    \bar "||"\break
    \override Score.RehearsalMark.extra-offset = #'(-2 . -1)
    \mark\markup\huge "3. Adagio"
    \time 4/4
    \tempo 4 = 50
    s1*9
    \bar "||"\break
    \override Score.RehearsalMark.extra-offset = #'(-2 . -1)
    \mark\markup\huge "4. Vivace, e spic[c]ato"
    \time 3/4
    \tempo 2. = 65
    s2.*39
    \bar "|."

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


IvlaI = {
    \Iglobal
    \clef alto
    <<\IvlaIn \forma>>

}


Ivc = {
    \Iglobal
    \clef bass
    <<\Ivcn \forma>>

}


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}

\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller\center-column {"Sinfonia Terza - Op. III"\smaller "A 5. quattro Violini, e Violoncello, con l'Alto se piace"}
    composer = \markup \center-column{"  ""G. Bononcini (1670 - 1747)"}
}

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino Primo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino Secondo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino Terzo"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl3"
                \IvlIII
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violino Quarto"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl4"
                \IvlIV
            >>
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Alto Viola"}
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "alt"
            \IvlaI
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "vc"
            \Ivc
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column{"Violone, Tiorba"\vspace #-0.3"Organo"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \Ibc
        >>
    >>

    \layout {
        #(layout-set-staff-size 15.5)
        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
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


