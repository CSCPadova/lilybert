\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

parentSlur =
 -\tweak stencil
 #(lambda (grob)
   (let* ((cp (ly:grob-property grob 'control-points))
          (lp (grob-interpret-markup grob (markup #:teeny "(")))
          (rp (grob-interpret-markup grob (markup #:teeny ")"))))
     (set! lp (ly:stencil-aligned-to lp Y CENTER))
     (set! lp (ly:stencil-aligned-to lp X 0.2))
     (set! lp (ly:stencil-translate lp (first cp)))
     (set! rp (ly:stencil-aligned-to rp Y CENTER))
     (set! rp (ly:stencil-aligned-to rp X -0.2))
     (set! rp (ly:stencil-translate rp (last cp)))
     (list-set! cp 0
       (cons (cdr (ly:stencil-extent lp X))
             (cdr (first cp))))
     (list-set! cp (1- (length cp))
       (cons (car (ly:stencil-extent rp X))
             (cdr (last cp))))
     (ly:grob-set-property! grob 'control-points cp)
     (apply ly:stencil-add (list lp rp
       (ly:slur::print grob)))))
 \etc


acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"doux"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = _\markup \italic { Soli }

solo = _\markup \italic { Solo }

tu = _\markup \italic "Tous"

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
  \senza
}

IobIn = \relative do'' {

    R1*4
    r8 la' la la la fad fad fad
    fad re re re re2

    %7
    R1*3
    r8 fad fad fad fad dod dod dod
    dod lad lad lad lad2

    %12
    R1*2
    r8 mi' mi mi mi si si si\mbreak
    si sold sold sold sold2

    %16
    R1
    r8 la' la la la mi mi mi
    mi dod dod dod dod2

    %19
    R1*7
    r2 r4 la'
    fad re8 mi fad mi fad re

    %26
    mi4 la, r re
    dod la la' fad\mbreak
    sol fad8 mi fad sol fad sol

    %29
    mi4 mi la2~
    la4 si8 la sol4 la8 fad
    sol4 mi sol2~

    %32
    sol4 la8 sol fad4 sol8 mi
    fad4 si si si
    mi, la la la

    %35
    re, sol sol sol
    fad sol8 mi mi4. ^\markup \center-align{\italic\bold [tr] } re8
    re4 re8 mi fad mi fad re

    %38
    mi4 dod la r
    r si8 dod re dod re si
    dod4 si8 dod re dod si la

    %41
    mi1~
    mi~
    mi~

    %44
    mi~
    mi~
    mi2 r

    %47
    R1*7
    r4 mi'8 re mi fad mi fad
    sol2 r

    %56
    r4 fad8 mi fad sol fad sol
    la2 r\mbreak
    r4 sol8 fad sol la sol la

    %59
    fad mi fad sol fad sol fad sol
    mi re mi fad mi sol fad mi
    re fad mi fad sol la sol la

    %62
    dod, mi re mi fad sol fad sol
    si, re dod re mi fad mi fad
    lad, dod si dod re fad mi fad

    %65
    sol4. fad8 mi4. mi8
    mi4. re16 dod re4. re8\mbreak
    re mi re dod dod4. si8

    %68
    si4 re re re
    re dod8 si dod4 re8 dod
    si4 mi mi mi

    %71
    mi re8 dod re4 mi8 re
    dod4 r r2
    R1*3

    %76
    r4 si' sol mi
    fad mi8 fad sol fad sol mi
    fad4 si, si' mi,

    %79
    fad si, si' mi,
    fad si, si'2~
    si4 do8 si la4 la8 sol

    %82
    la4 fad la2~
    la4 si8 la sol4 la8 fad
    sol4 do do do

    %85
    fad ,si si si
    mi, la la la
    sol la8 fad fad4. mi8

    %88
    mi2 r
    r4 re8 dod! re mi re mi
    dod2 r

    %91
    r4 mi8 re mi  fad mi fad\mbreak
    re2 r
    r4 dod8 si dod re dod re

    %94
    si la si dod si re dod si
    la dod si dod re2
    r8 re dod re mi2

    %97
    r8 mi re mi fad2
    r8 fad mi fad sol2
    r8  sol fad sol la2

    %100
    r4 la fad re
    mi re8 mi fad mi fad re
    mi4 la, la' re,\mbreak

    %103
    mi la, la' re,
    mi la, la'2~
    la4 si8 la sol4 la8 fad

    %106
    sol4 mi sol2~
    sol4 la8 sol fad4 sol8 mi
    fad4 si si si

    %109
    mi, la la la
    re, sol sol sol
    fad sol8 mi mi4. re8

    %112
    re4 la8 sol la si la si
    do2 r
    r4 si8 la si do si do

    %115
    re2 r
    r4 do8 si do re do re
    si la si do si do si do

    %118
    la sol la si la do si la
    sol la si dod! re fad mi re
    dod re mi fad sol si la sol

    %121
    fad la sol la si do si do
    mi, sol fad sol la si la si
    re, fad mi fad sol la sol la

    %124
    dod, mi re mi fad la sol la
    si4. la8 sol4. sol8
    sol4. fad16 mi fad4 fad

    %127
    fad2 r
    R1*2
    r8 si si si si fad fad fad

    %131
    fad red red red red2
    R1*2
    r8 la' la la la mi  mi mi\mbreak

    %135
    mi dod dod dod dod2
    R1
    r8 re' re re re la la la

    %138
    la fad fad fad fad2
    R1
    r8 mi  mi mi mi dod dod dod

    %141
    re4. mi8\mbreak dod4. re8
    re2 r
    r r4 la' re,1\fermopz

}

IobIIn = \relative do'' {

    R1*4
    r8 fad fad fad fad re re re
    re la la la la2

    %7
    R1*3
    r8 dod dod dod dod lad lad lad
    lad fad fad fad fad2

    %12
    R1*2
    r8 si si si si sold sold sold
    sold mi mi mi\mbreak mi2

    %16
    R1
    r8 mi' mi mi mi dod dod dod
    dod la la la la2

    %19
    R1*7 r4 mi' dod la
    re la\mbreak re8 dod re si
    dod4 re8 mi fad mi fad re

    %27
    mi4 la fad re
    mi re8 dod re mi re mi
    dod4 dod fad2~

    %30
    fad4 sol8 fad mi4 fad8 red
    mi4 si mi2~
    mi4 fad8 mi re4 mi8 dod

    %33
    re4 re8 mi fad mi fad re
    mi4 dod8 re mi re mi dod
    re4 si8 dod re4 re\mbreak

    %36
    re mi8 dod dod4.\tr la8
    la2 r
    r4 la8 si dod si dod la

    %39
    si4 sold8 la si la si sold
    la4 si8(dod) re(dod) si(la)
    mi1~

    %42
    mi~
    mi~
    mi~

    %45
    mi~
    mi2 r
    R1*7

    %54
    r4 dod'8 si dod re dod re\mbreak
    mi2 r
    r4 re8 dod re mi re mi

    %57
    fad2 r
    r4 mi8 re mi fad mi fad
    re dod re mi re mi re mi

    %60
    dod si dod re dod mi re dod
    si2 r4 mi
    la, dod r re

    %63
    sol, si r dod
    fad, lad r si\mbreak
    si2 si4. si8

    %66
    dod4. si16 lad si4. si8
    si4. si8 lad4. fad8
    fad4 si si si

    %69
    si la8 sold la4 si8 la
    sold4 si dod dod
    dod si8 la si4 dod8 si

    %72
    la4 r r2
    R1*3\mbreak
    r2 r4 mi'

    %77
    red si si si
    si red mi si
    red red si si

    %80
    red si sol'2~
    sol4 la8 sol fad4 sol8 mi
    fad4 dod fad2~

    %83
    fad4 sol8 fad mi4 fad8 red
    mi4 mi8 fad sol fad sol mi
    fad4 re8 mi\mbreak fad mi fad re

    %86
    mi4 do8 re mi re mi do
    mi4 mi red4. si8
    si2 r

    %89
    r4 si8 la si dod si dod
    la2 r
    r4 dod8 si dod re dod re

    %92
    si2 r
    r4 la8 sold la si la si
    sold fad sold la\mbreak sold si la sold

    %95
    fad4 fad la2
    r4 sol! si2
    r4 la dod2

    %98
    r4 si re2
    r4 dod mi2
    r r4 re

    %101
    dod la la la
    la dod re la
    dod dod la la

    %104
    dod la fad'2~
    fad4 sol8 fad mi4 fad8 red\mbreak
    mi4 si mi2~

    %107
    mi4 fad8 mi re4 mi8 dod
    re4 re8 mi fad mi fad re
    mi4 dod8 re mi re mi dod

    %110
    re4 si8 dod re dod re si
    re4 mi8 dod dod4. la8
    la4 fad8 mi fad sol fad sol

    %113
    la2 r
    r4 sol8 fad sol la sol la\mbreak
    si2 r

    %116
    r4 la8 sol la si la si
    sol fad sol la sol la sol la
    fad mi fad sol fad la sol fad

    %119
    mi4 sol la si
    la dod re mi
    re2 r4 mi

    %122
    dod mi r mi
    si re r re\mbreak
    la dod r re

    %125
    re4. dod8 re4. re8
    dod4. dod8 re4. re8
    re2 r

    %128
    R1*2
    r8 fad fad fad fad re re re
    red si si si si2

    %132
    R1*2
    r8 mi mi mi mi dod dod dod\mbreak
    dod la la la la2

    %136
    R1
    r8 la' la la la fad fad fad
    fad re re re re2

    %139
    R1
    r8 dod dod dod dod la la la
    la4. si8 la4. la8

    %142
    la1
    r4 mi' dod la la1\fermopz

}

IobIIIn = \relative do'' {

    R1*4
    r8 re re re re la la la
    la fad fad fad fad2

    %7
    R1*3
    r8 lad lad lad lad fad fad fad
    fad dod' dod dod dod2

    %12
    R1*2
    r8 sold sold sold\mbreak sold mi mi mi
    mi si' si si si2

    %16
    R1
    r8 dod dod dod dod la la la
    la mi mi mi mi2

    %19
    R1*7
    R1
    r4 la fad re

    %26
    la' si8 dod re dod re si
    la2 r4 re
    dod la fad re

    %29
    la' la dod dod
    red si2 si4
    si sol si si

    %32
    dod la2 la4
    la si si si
    si la la la

    %35
    la sol sol sol
    la si la4. la8
    fad4 la fad re

    %38
    la' mi' dod la
    mi2 sold4 mi
    mi mi2 red4

    %41
    mi1~
    mi~
    mi~

    %44
    mi~
    mi~
    mi2 r

    %47
    R1*7
    r4 la la la
    dod2 r

    %56
    r4 la la la
    re2 r
    r4 dod dod dod

    %59
    la la la la
    fad fad fad fad
    fad2 si4 sol

    %62
    mi r la fad
    re r sol mi
    fad r fad fad

    %65
    mi2 mi4. sol8\mbreak
    fad2 fad4. fad8
    mi4. sol8 fad4. fad8

    %68
    re4 fad fad fad
    mi mi mi mi
    mi mi sold sold

    %71
    fad la sold mi
    la r r2
    R1*4

    %77
    r4 si sol mi
    si' si si si
    si si\mbreak si si

    %80
    si si8 do re do re si
    mi4 do2 do4
    dod! dod8 si la si dod la

    %83
    red4 si2 si4
    si do do do
    do si si si

    %86
    si la  la la
    si do si4. si8\mbreak
    sold2 r

    %89
    r4 sold sold sold
    mi2 r
    r4 la la la

    %92
    sold2 r
    r4 mi mi mi
    sold sold sold sold

    %95
    la fad fad2
    r4 sol! sol2
    r4 la la2

    %98
    r4 si si2\mbreak
    r4 dod dod2
    R1

    %101
    r4 la fad re
    la' la la la
    la la la la

    %104
    la la8 si dod si dod la
    re4 si2 si4
    si si8 la sol la si sol

    %107
    do4 la2 la4
    la si si si
    si la la la\mbreak

    %110
    la sol sol sol
    la si la4. la8
    fad4 re re re

    %113
    fad2 r
    r4 re re re
    sol2 r

    %116
    r4 fad fad fad
    re re re re
    fad fad fad fad

    %119
    sol mi la mi
    mi la re, la'
    la2 sol4 si\mbreak

    %122
    la r fad la
    sol r mi sol
    fad r re fad

    %125
    sol4. mi8 re4. re8
    la'4. la8 la4. la8
    si2 r

    %128
    R1*2
    r8 re re re re si si si
    si fad fad fad fad2

    %132
    R1*2\mbreak
    r8 dod' dod dod dod la la la
    la mi mi mi  mi2

    %136
    R1
    r8 fad' fad fad fad re re re
    re la la la la2

    %139
    R1
    r8 la la la la mi mi mi\mbreak
    re4. sol8 sol4. fad8

    %142
    fad1
    R1 fad1\fermopz

}

IvlIn =  \relative do'' {

    re,2~re8 re mi fad
    mi2~mi8 sol fad mi
    re4. mi8 fad sol fad sol

    %4
    la4. si8 sol4. fad8
    fad1
    r2 fad4. sold8

   %7
   la4. la8 lad4. si8
   dod2 fad,4. fad8
   si4 sol\mbreak mi4. fad8

   %10
   fad2 dod'4. dod8
   dod2~dod8 lad si dod
   re4. dod8 dod4. si8

   %13
   si4. dod8 la si sold la
   sold4. la8 si4. si8
   mi,2 mi'4. sold,8

   %16
   la4 si8 dod si4. mi8
   dod4 la dod mi\mbreak
   sol,2~sol8 sol la si

   %19
   fad2 si4. dod8
   re4. dod8 si4. la8
   sold4 mi dod4. re8

   %22
   mi4. fad8 re4. dod8
   dod4~dod16 si la16 si si4. la8
   la1 re2~re8 re mi fad la,1~

   %25
   la~
   la~
   la~

   %28
   la~
   la2 r
   R1*11

   %41
   r2 r4 mi''
   dod la8 si dod si dod la
   si4 mi, r la

   %44
   sold mi mi' dod
   re dod8 si dod re dod re
   si4 si mi2~

   %47
   mi4 fad8 mi re4 mi8 dod
   re4 si re2~
   re4 mi8 re\mbreak dod4 re8 si

   %50
   dod4 fad fad fad
   si, mi mi mi
   la, re re re

   %53
   dod4 re8 si si4. la8
   la2 r
   r4 sol'8 fad sol la sol la

   %56
   fad2 r
   r4 la8 sol la si la si
   sol2 r

   %59
   r4 fad8 mi fad sol fad sol\mbreak
   mi re mi fad mi sol fad mi
   re fad mi fad sol la sol la

   %62
   dod, mi re mi fad sol fad sol
   si, re dod re mi fad mi fad
   lad, dod si dod re fad mi fad

   %65
   sol4. fad8 mi4. mi8
   mi4. re16 dod re4. re8
   re mi re dod dod4. si8

   %68
   si4 r r si,
   dod r r la
   mi' r r dod

   %71
   fad r r sold
   la la' la la
   la sol!8 fad sol4 la8 sol

   %74
   fad4 si si si
   si la8 sol fad sol la fad
   sol4 r r2\mbreak

   %77
   r r4 mi
   red si mi sol
   fad red mi8 fad sol mi

   %80
   fad4 si, si'2~
   si4 do?8 si la4 si8 sol
   la4 fad la2~

   %83
   la4 si8 la sol4 la8 fad
   sol4 do do do
   fad, si si si

   %86
   mi, la la la\mbreak
   sol4 la8 fad fad4. mi8
   mi4 si8 la si dod si dod

   %89
   re2 r
   r4 dod8 si dod re dod re
   mi2 r

   %92
   r4 re8 dod re mi re mi
   dod si dod re dod re dod re
   si la si dod si re dod si

   %95
   la2 r8 re dod re\mbreak
   si2 r8 mi re mi
   dod2 r8 fad mi fad

   %98
   re2 r8 sol fad sol
   mi2 r8 la sol la
   fad2 r

   %101
   r r4 re
   dod la re fad
   mi dod re8 mi fad re

   %104
   mi4 la, la'2~
   la4 si8 la sol4 la8 fad
   sol4 mi sol2~

   %107
   sol4 la8 sol fad4 sol8 mi
   fad4 si si si
   mi, la la la

   %110
   re, sol sol sol
   fad sol8 mi mi4. re8
   re2 r

   %113
   r4 do8 si do re do re
   si2 r
   r4 re8 do re  mi re mi

   %116
   do2 r
   r4 si8 la si do si do
   la sol la si\mbreak la do si la

   %119
   sol la si dod! re fad mi re
   dod re mi fad sol si la sol
   fad la sol la si do si do

   %122
   mi, sol fad sol la si la si
   re, fad mi fad sol la sol la
   dod, mi re mi fad la sol la

   %125
   si4. la8 sol4. sol8
   sol4. fad16 mi fad4. fad8
   fad4. si,8 dod4. re8

   %128
   lad2 si4. dod8
   re4. mi8 dod4. fad8
   re4 si fad'4. fad8

   %131
   fad2~fad8 red mi fad
   sol4. fad8 fad4. mi8
   mi4. fad8 re mi dod re

   %134
   dod4. re8 mi4. mi8
   la,2 la'4. dod,8
   re4 mi8 fad mi4. la8

   %137
   fad4 re fad la
   do,2~do8 do re mi
   si4. si8 dod!4. re8

   %140
   sol,2~sol8 sol la mi
   fad4. sol8 mi4. re8
   re4 la' fad re

   %143
   la1\laissezVibrer re\fermopz

}

IvlIIn =  \relative do'' {

    r2 la,
    si dod4 la
    si4. dod8 re4. re8

    %4
    re2 re4 dod
    re2 r
    r re4. mi8

    %7
    mi4. fad8 mi4. fad8
    fad2 re4. dod8
    re2 si4. dod8

    %10
    dod2 lad'4. lad8
    lad?2~lad8 fad sold lad!
    si4. dod8 lad4. si8

    %13
    si2 fad4. fad8
    mi2. mi4
    si2 sold'4. sold8

    %16
    mi4 la la sold
    la mi la dod
    mi,2 mi

    %19
    re re4. mi8
    fad4. la8 mi4. mi8\mbreak
    mi4 si la4. la8

    %22
    la4. si8 sold4. la8
    la2 sold4. la8
    la1 r2 la la1~

    %25
    la~
    la~
    la~

    %28
    la~
    la2 r
    R1*11

    %41
    r4 si' sold mi
    la mi la8 sold la fad\mbreak
    sold4 la8 si dod si dod la

    %44
    si4 mi dod la
    si la8 sold  la si la si
    sold4 sold dod2~

    %47
    dod4 re8 dod si4 dod8 lad
    si4 fad si2~
    si4 dod8 si la4 si8 sold

    %50
    la4 la8 si dod si dod la
    si4 sold8 la si la si sold\mbreak
    la4 fad8 sold la sold la fad

    %53
    la4 la sold4. mi8
    mi2 r
    r4 mi'8 re re fad mi fad

    %56
    re2 r
    r4 fad8 mi fad sol fad sol
    mi2 r

    %59
    r4 re8 dod re mi re mi
    dod si dod re dod mi re dod
    si2 r4 mi\mbreak

    %62
    la, dod r re
    sol, si r dod
    fad, lad r si

    %65
    si2 si4. si8
    dod4. si16 lad si4. si8
    si4. si8 lad4. fad8

    %68
    fad4 r r si,
    dod r r la
    mi' r r dod

    %71
    fad r r sold\mbreak
    la dod dod dod
    re re mi mi

    %74
    la, re red red
    mi mi fad fad
    mi r r2

    %77
    R1
    r4 si sol mi
    si' si si si

    %80
    si si sol'2~
    sol4 la8 sol fad4 sol8 mi
    fad4 dod fad2~\mbreak

    %83
    fad4 sol8 fad mi4 fad8 red
    mi4 mi8 fad sol fad sol mi
    fad4 re8 mi fad mi fad re

    %86
    mi4 do8 re  mi re mi do
    mi4 mi red4. si8
    si4 sold8 fad sold la sold la

    %89
    si2 r
    r4 la8 sold la si la si\mbreak
    dod2 r

    %92
    r4 si8 la si dod si dod
    la sold la si la si la si
    sold fad sold la sold si la sold

    %95
    fad2 r4 la
    sol!2 r4 si
    la2 r4 dod

    %98
    si2 r4 re\mbreak
    dod2 r4 mi4
    re2 r

    %101
    R1
    r4 la fad re
    la' la la la

    %104
    la la fad'2~
    fad4 sol8 fad mi4 fad8 red
    mi4 si mi2~

    %107
    mi4 fad8 mi re4 mi8 dod
    re4 re8 mi fad mi fad re
    mi4 dod8 re mi re mi dod\mbreak

    %110
    re4 si8 dod re dod re si
    re4 mi8 dod dod4. la8
    la2 r

    %113
    r4 la8 sol la si la si
    sol2 r
    r4 si8 la si do si do

    %116
    la2 r
    r4 sol8 fad sol la sol la
    fad mi fad sol fad la sol fad\mbreak

    %119
    mi4 sol la si
    la dod re mi
    re2 r4 re

    %122
    dod mi r mi
    si re r re
    la dod r re

    %125
    re4. dod8 re4. re8
    dod4. dod8 re4. re8
    re4. re,8 mi4. re16 mi

    %128
    fad2 fad4. lad8
    si4. si8\mbreak si4 lad
    si4 fad re'4. re8

    %131
    red2~red8 si dod red
    mi4. mi8 red4. mi8
    mi2 si4. si8

    %134
    la2. la4
    mi2 dod'4. dod8
    la4 re re dod

    %137
    re la re fad
    la,2 la
    sol4. sol8 sol4 la

    %140
    mi2\parentSlur (mi4.) mi8
    re4. re8 la4. la8
    la4 la' fad re

    %143
    la1\laissezVibrer  la\fermata

}

Ivlan = \relative do' {

    r2 fad,
    sol2. la4
    fad2 si4. si8

    %4
    la4 sol si la
    la1
    r2 la4. si8

    %7
    dod4. la8 dod4. re8
    dod2 si4. dod8
    si2 si4. lad8\mbreak

    %10
    lad2 fad'4. fad8
    fad2~fad8 dod re mi
    fad4 sol dod, fad

    %13
    fad2 red4. red8
    si2. si4
    sold2 si4. si8

    %16
    la4 mi' mi mi
    mi dod mi la
    dod,2 dod

    %19
    la si4. lad8
    si4. dod8 re4. dod8
    si4 sold la4. la8

    %22
    mi4. re8 re4. mi8
    mi2 mi
    mi1 r2 fad2 mi r  %% ok

    %25
    R1*17
    r4 mi' dod la
    mi' fad8 sold la sold la fad\mbreak

    %44
    mi2 r4 la
    sold mi dod la
    mi' mi sold sold

    %47
    lad fad2 fad4
    fad re fad fad

    %49
    sold mi2 mi4
    mi fad fad fad
    fad mi mi mi

    %52
    mi re re re
    mi fad mi4. mi8
    dod2 r\mbreak

    %55
    r4 dod' dod dod
    la2 r
    r4 re re re

    %58
    dod2 r
    r4 la la la
    fad fad fad fad

    %61
    fad2 si4 sol
    mi r la fad
    re r sol mi

    %64
    dod r fad fad\mbreak
    mi2 mi4. sol8
    fad2 fad4. fad8

    %67
    mi4. sol8 fad4. fad8
    re4 re si r
    r dod la r

    %70
    r mi' dod r
    r fad sold r
    r2 r4 la

    %73
    fad re dod la'\mbreak
    la fad si, fad'
    mi mi red si'

    %76
    si r r2
    R1
    r2 r4 mi,

    %79
    red si si' si
    si si8 do re do re si
    mi4 do2 do4

    %82
    dod! dod8 si la si dod la
    red4 si2 si4\mbreak
    si do do do

    %85
    do si si si
    si la la la
    si do si4. si8

    %88
    sold4 mi mi mi
    sold2 r
    r4 mi mi mi

    %91
    la2 r
    r4 sold sold sold
    mi mi\mbreak mi mi

    %94
    dod dod dod dod
    dod2 r4 fad
    re2 r4 sol

    %97
    mi2 r4 la
    fad2 r4 si
    mi,2 r4 dod'

    %100
    la2 r
    R1
    r2 r4 re,

    %103
    dod la la' la
    la la8 si dod si dod la\mbreak
    re4 si2 si4

    %106
    si si8 la sol la si sol
    dod4 la2 la4
    la si si si

    %109
    si la la la
    la sol sol sol
    la si la4. la8

    %112
    fad2 r
    r4 fad fad fad
    re2 r\mbreak

    %115
    r4 sol sol sol
    fad2 r
    r4 re re re

    %118
    si si si si
    si mi la mi
    mi la re, la'

    %121
    la2 sol4 si
    la r fad la
    sol r mi sol

    %124
    fad r re fad\mbreak
    sol4. mi8 re4. re8
    la'4. la8 la4. la8

    %127
    si2 sol4. sol8
    dod,2 re4. mi8
    fad4. sol8 fad4 fad

    %130
    fad re si'4. si8
    si2~si8 fad sol la
    si4 do\mbreak fad, si

    %133
    si2 sold4. sold8
    mi2. mi4
    dod2 mi4. mi8

    %136
    re4 la' la la
    la fad la re
    fad,2 fad

    %139
    re4. re8 mi4 fad\mbreak
    la,2 la4. la8
    la4. mi8 mi4. fad8

    %142
    fad2 r
    R1 fad\fermopz

}

Ibcn = \relative do {

    r2 re~
    re8 re dod si dod4 la
    si2~si8 si la sol

    %4
    fad4 sol mi la
    re,1
    r2 re'4. re8

    %7
    dod4. re8 dod4. si8
    lad2 si4. la8
    sol1\mbreak

    %10
    fad2 fad'4. fad8
    mi2~mi8 mi re dod
    si4 mi fad mi

    %13
    red2 si4. si8
    mi2. mi4
    re2~re8 re dod si

    %16
    dod4 la mi' mi,
    la1
    la'2 la,

    %19
    re4 re, re'4. dod8
    si4. la8 sold4. la8\mbreak
    mi'2 fad4 mi8 re

    %22
    dod4. re8 si4 la
    mi'2 mi,
    la4. sol8 fad sol fad mi re2 re'\laissezVibrer la r

    %25
    R1*4
    r4 la'8 sol fad sol la fad
    si4 si,2 si'4

    %31
    mi, sol8 fad mi fad sol mi
    la4 la,2 la'4\mbreak
    re, si8 dod re dod re si

    %34
    dod4 la8 si dod si dod la
    si4 sol8 la si la si sol
    re'4 sol la la,

    %37
    re2 r4 re
    dod la2 la'4
    sold mi2 mi4

    %40
    la,2 sold4 fad
    mi2 r
    R1*4

    %46
    r4 mi'8 re\mbreak dod re mi dod
    fad4 fad,2 fad'4
    si, re8 dod si dod re si

    %49
    mi4 mi,2 mi'4
    la fad8 sold la sold la fad
    sold4 mi8 fad sold fad sold mi

    %52
    fad4 re8 mi fad mi fad re
    la'4 re, mi mi,
    la1~

    %55
    la~
    la~
    la~

    %58
    la~
    la
    lad2 fad

    %61
    si4 si' sol mi
    r la fad re
    r sol mi dod

    %64
    r fad re si
    mi mi8 fad sol fad sol mi
    lad sold lad fad si fad re si

    %67
    mi sol fad mi\mbreak fad4 fad,
    si r r2
    R1*3

    %72
    r2 r4 la
    si r r dod
    re r r si

    %75
    dod r r red
    mi r r2
    R1*2

    %79
    r4 si' sol mi
    si' sol8 la si la si sol
    do4 do,2 do'4\mbreak

    %82
    fad, la8 sol fad sol la fad
    si4 si,2 si'4
    mi, do8 re mi re mi do

    %85
    si4 si8 do re do re si
    do4 la8 si do si do la
    mi'4 la si si,

    %88
    mi1~
    mi~
    mi~

    %91
    mi~
    mi~
    mi

    %94
    mid2 dod?
    fad4 la fad re
    sol si sol mi

    %97
    la dod la fad
    si re si sol
    dod mi dod la

    %100
    re re, r2
    R1*2
    r4 la' fad re

    %104
    la' fad8 sol la sol la fad
    si4 si,2 si'4
    mi, sol8 fad mi fad sol mi

    %107
    la4 la,2 la'4
    re, si8 dod re dod re si
    dod4 la8 si dod si dod la

    %110
    si4 sol8 la si la si sol
    re'4 sol la la,
    re,1~

    %113
    re~
    re~
    re~

    %116
    re~
    re
    red'2 si

    %119
    mi4 mi, fad sold
    la la si dod
    re re' si sol

    %122
    r dod la fad
    r si sol mi
    r la fad re

    %125
    sol8 fad sol la\mbreak si la si sol
    la si dod la re la fad re
    sol,2 sol'

    %128
    fad4. mi8 re4. dod8
    si4. mi8 fad4 fad,
    si2 si'4. si8

    %131
    la2~la8 la sol fad
    mi4 la si la\mbreak
    sold2 mi4. mi8

    %134
    la2. la4
    sol!2~sol8 sol fad mi
    fad4 re la' la,

    %137
    re1
    re,2 re'
    sol,4 sol'8. fad16 mi4 re

    %140
    dod2 la4. la8
    re4 sol, la2
    re, r

    %143
    R1 re1\fermopz

}

Ibfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\major
  \time 2/2
  \tempo 2 = 70
  s1
  \repeat volta 2{s1*22}
  \alternative {{s1 s}{\once \override Staff.TimeSignature.style = #'single-digit \tempo 1 = 60 \time 2/2 s}}
  \bar".|:"\break \set Score.currentBarNumber = #25
  \repeat volta 2{s1*102\break  \tempo 2 =70 \time 2/2 s1*15}
  \alternative {{\once\override Staff.TimeSignature.style = #'single-digit \time 2/2 \tempo 1 = 60 s1*2}{\time 4/4 s1}}
  \bar"|."


}

IobI = {
  \Iglobal
  \notypeset
  <<\IobIn \forma>>

}

IobII = {
  \Iglobal
  <<\IobIIn \forma>>

}

IobIII = {
  \Iglobal
  <<\IobIIIn \forma>>

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
  \senza
}

IIobIn = \relative do'' {

    r2 re
    dod fad~
    fad4 si, mi re

    %4
    dod si dod la
    re1
    mi

    %7
    la,2 fad'
    mi la
    sold4 fad sold2

    %10
    la la~
    la sol!\mbreak
    fad si~

    %13
    si lad
    si r
    r la?

    %16
    fad si~
    si4 mi,  la sol
    fad mi fad re

    %19
    la'1
    si
    mi,2 la~

    %22
    la4 sol  fad2
    mi1
    re2 r

    %25
    r la'~
    la sol\mbreak
    fad si~

    %28
    si la~
    la sol~
    sol fad

    %31
    mi4 re dod2
    si1
    la2 r

    %34
    R1*2
    r2 re
    dod fad~

    %38
    fad4 si, mi re
    dod re mi2~
    mi4 fad8 mi re4 mi8 re

    %41
    dod2. si4\mbreak
    la2 re~
    re dod~

    %44
    dod si~
    si4 mi, la2~
    la4 re, sol2~

    %47
    sol4 la8 sol fad4 sol8 fad
    mi4 re8 mi fad4 mi8 fad
    sol4 la8 sol fad4 sol8 fad

    %50
    mi4 dod' re2~
    re dod
    re1\fermata

}

IIobIIn = \relative do'' {

    R1*3
    r2 la
    fad si~

    %6
    si4 mi, la sol
    fad mi fad re
    la'1

    %9
    si
    mi,2 mi'4 fad
    si,2 mi~

    %12
    mi re
    dod fad~
    fad4 si, mi re\mbreak

    %15
    dod si dod la
    re1
    dod

    %18
    re4 dod si2
    la fad
    sold1

    %21
    la2 mi'
    re1
    dod2. si4

    %24
    la2 re~
    re dod
    si mi~

    %27
    mi re
    dod do
    si1\mbreak

    %30
    la2 re
    dod! fad~
    fad4 si, mi re

    %33
    dod si dod la
    re2. mi4
    dod si dod2

    %36
    re la~
    la4 la re dod
    si2 si

    %39
    la4 si dod si
    la2 re
    sol mi\mbreak

    %42
    la2. si4
    mi,1
    re

    %45
    mi2. dod4
    re2. mi4
    dod la re mi8 re

    %48
    dod4 si8 dod re4 dod8 re
    mi4 fad8 mi re4 mi8 re
    dod4 mi, fad2

    %51
    mi1
    re\fermata

}

IIobIIIn = \relative do'' {

    R1*17
    r2 re
    dod fad~

    %20
    fad4 si, mi re
    dod si dod la
    re2. re,4

    %23
    sol2 mi
    fad2. si4
    mi,1

    %26
    mi2 si'
    si fad\mbreak
    fad fad

    %29
    re re'
    re la
    la1

    %32
    re,2 sol
    mi la
    fad si~

    %35
    si4 mi, la sol
    fad mi fad re
    la'2 fad

    %38
    sol sold
    la1~
    la2 fad

    %41
    mi mi'~
    mi4 re8 dod\mbreak re4 si
    la2 la4 sol

    %44
    fad2. sol8 fad
    mi2. fad8 mi
    re2. sol4

    %47
    mi2 la
    la la
    dod re

    %50
    la si
    la1~
    la\fermata

}

IIvlIn =  \relative do'' {

    R1*14
    r2 la'
    fad si~

    %17
    si4 mi, la sol
    fad mi fad re
    la'1

    %20
    si
    mi,2 la~
    la4 sol fad2

    %23
    mi1
    re2 r
    r la'~

    %26
    la sol
    fad\mbreak si~
    si la~

    %29
    la sol~
    sol fad
    mi4 re dod2

    %32
    si1
    la2 r
    R1*2

    %36
    r2 re
    dod fad~
    fad4 si, mi re

    %39
    dod re mi2~
    mi4 fad8 mi re4 mi8 re
    dod2. si4\mbreak

    %42
    la2 re~
    re dod~
    dod si~

    %45
    si4 mi, la2~
    la4 re, sol2~
    sol4 la8 sol fad4 sol8 fad

    %48
    mi4 re8 mi fad4 mi8 fad
    sol4 la8 sol fad4 sol8 fad
    mi4 dod' re2~

    %51
    re dod
    re1\fermata

}

IIvlIIn =  \relative do'' {

    R1*11
    r2 re
    dod fad~
    fad4 si, mi re\mbreak

    %15
    dod si dod la
    re1
    dod

    %18
    re4 dod si2
    la fad
    sold1

    %21
    la2 mi'
    re1
    dod2. si4

    %24
    la2 re~
    re dod
    si mi~

    %27
    mi re
    dod do
    si1\mbreak

    %30
    la2 re
    dod! fad~
    fad4 si, mi re

    %33
    dod si dod la
    re2. mi4
    dod si dod2

    %36
    re la~
    la4 la re dod
    si2 si

    %39
    la4 si dod si
    la2 re
    sol mi\mbreak

    %42
    la2. si4
    mi,1
    re

    %45
    mi2. dod4
    re2. mi4
    dod la re mi8 re

    %48
    dod4 si8 dod re4 dod8 re
    mi4 fad8 mi re4 mi8 re
    dod4 mi, fad2

    %51
    mi1
    re\fermata



}

IIvlan = \relative do' {

    R1*20
    r2 mi
    fad4 mi re2

    %23
    sol mi
    fad2. si4
    mi,1

    %26
    mi2 si'
    si fad
    fad fad

    %29
    re re
    re la'
    la1\mbreak

    %32
    re,2 r
    r la'
    fad si~

    %35
    si4 mi, la sol
    fad mi fad re
    la'2 fad

    %38
    sol sold
    la1
    la2 fad

    %41
    mi mi
    fad2. mi4
    mi2 la,

    %44
    re4 re8 mi fad4 sol8 fad
    mi2. fad8 mi\mbreak
    re2. sol4

    %47
    mi2 la
    la la
    la la

    %50
    la si
    la1
    fad\fermata

}

IIbcn = \relative do {

    R1*6
    r2 re
    dod fad~

    %9
    fad4 si, mi re
    dod la dod red
    mi mi8 fad sol4 mi

    %12
    si' si,8 dod re4 si
    fad'2 fad,
    sol sold

    %15
    la1
    si2 sol?
    la1\mbreak

    %18
    re2 r
    R1*2
    r2 la'

    %22
    fad si~
    si4 mi, la sol
    fad re fad sold

    %25
    la la,8 si dod4 la
    mi' mi8 fad sol4 mi
    si' si,8 dod re4 si

    %28
    fad' fad8 sol la4 fad
    sol sol8 la si4 sol
    re' re,8 mi fad4 re

    %31
    la'1
    sol~\mbreak
    sol2 fad

    %34
    si sol
    la la,
    re1

    %37
    R1*2
    r2 la
    fad si~

    %41
    si4 mi, la sol
    fad re fad sold
    la la8 si dod4 la

    %44
    si si8 dod re4 si
    dod la8 si dod4 la
    si sol8 la si4 sol\mbreak

    %47
    fad1~
    fad~
    fad~

    %50
    fad2 sold
    la1
    re,\fermata

}

IIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\major
  \time 2/2
  \tempo 1 = 70
  s1*52
  \bar"|."


}

IIobI = {
  \IIglobal
  \notypeset
  <<\IIobIn \forma>>

}

IIobII = {
  \IIglobal
  <<\IIobIIn \forma>>

}

IIobIII = {
  \IIglobal
  <<\IIobIIIn \forma>>

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
    \senza
}

IIIobIn = \relative do'' {

    la8
    fad(re) la' fad(re) la'
    fad(re) la' la4 la8
    re(mi) fad mi(fad) sol

    %4
    fad(sol) la fad(re) la
    fad(re) la' fad(re) la'
    fad(re) la' la4 mi'8

    %7
    fad(mi) fad la, \parentSlur (re) fad\mbreak
    sold(fad) sold si,(mi) sold
    la(sold) la dod,\parentSlur (mi) la

    %10
    si(la) si sold(la) si
    re,4. r8 r re
    si'(la) si sold(la) si

    %13
    dod,4. r8 r dod
    la'(sold) la fad(sold) la
    si, fad'4 si,8 la'4

    %16
    sold8(fad) mi\mbreak re (dod) re
    dod(re) mi si4 la8
    la-. mi-. la-. dod-. la-. dod-.

    %19
    mi-.  mi-.  mi-. mi-.  mi-.  mi-.
    mi mi mi mi4 mi8
    mi-.  mi-.  mi-. mi-.  mi-.  mi-.

    %22
    mi mi mi mi4 mi8
    fad si,4 sold'8 dod,4\mbreak
    la'8 re,4 si'8(mi,) re

    %25
    dod(re) mi si4 la8
    la4.~la4 r8
    R2.

    %28
    r4 r8 r r fad'
    si,(dod) re dod(re) mi
    re(mi) fad re si r

    %31
    R2.\mbreak
    r4 r8 r r si'
    mi,(fad) sol fad(sol) la

    %34
    sol(la) si sol (mi) fad
    sol(fad) sol la, mi'4
    fad8(mi) fad sol, re'4

    %37
    mi8(re) mi fad,8 dod'4
    re8(dod) si mi(re) dod
    fad(mi) re dod4 si8\mbreak

    %40
    si4. r8 r re
    re(la) re re(si) re
    re(la) re re(si) mi

    %43
    mi(si) mi mi(dod) mi
    mi(si) mi mi dod r
    R2.

    %46
    r4 r8 r r la
    re(mi) fad mi(fad) sol\mbreak
    fad(sol) la fad re r

    %49
    R2.
    r4 r8 r r la
    si4. r8 r si

    %52
    dod4. r8 r dod
    re4. r8 r re
    mi(re) mi dod(re) mi

    %55
    sol,4. r8 r sol
    mi'(re) mi dod(re) mi\mbreak
    fad,4. r8 r fad

    %58
    re'(dod) re si(dod) re
    mi, si'4 mi,8 re'4
    dod8(si) la la'4 sol8

    %61
    fad(mi) re dod4 re8
    re4. r8 r re
    re(fad) la dod,(mi) la

    %64
    re,(fad) la\mbreak dod,(mi) la
    re,\p(fad) la dod,(mi) la
    re,(fad) la dod,(mi) la

    %67
    si, mi4 dod8 fad4
    re8 sol4 mi8 la4
    fad8(mi) re dod4 re8

    %70
    re4.~re4

}

IIIobIIn = \relative do'' {

    r8
    R2.
    r4 r8 r8 r la
    la4 la8 dod(re) mi

    %4
    re4 mi8 re(la) r
    R2.
    r4 r8 r r la

    %7
    re4. r8 r re
    si4. r8 r mi\mbreak
    dod4. r8 r fad

    %10
    mi4. r8 r mi
    si(la) sold si(la) sold
    sold4. r8 r sold

    %13
    la4 mi8 la4 mi8
    la4. r8 r la
    la4. la

    %16
    mi si'
    la4 la8 sold4 la8\mbreak
    la4 r8 la-. mi-. la-.

    %19
    dod4 dod8 si4 si8
    dod4 dod8 si4 si8
    dod4 r8 si4 r8

    %22
    dod4 r8 si4 la8
    la4 si8 si4 dod8
    dod4 re8 re4 si8

    %25
    la4 la8 sold4 la8
    la4.~la4 r8
    R2.

    %28
    r4 r8 r r dod
    si4 si8 dod4 dod8
    si4 dod8 si fad r

    %31
    R2.
    r4 r8 r r fad'
    mi4 mi8 fad4 fad8

    %34
    mi4 fad8 mi(si) si
    si4 r8 la4 r8
    la4 r8 mi4 r8

    %37
    sol4 r8 fad4 r8\mbreak
    si(la) sold dod(si) lad
    re(dod) si lad4 fad8

    %40
    fad4. r8 r si
    la!(fad) la si(sol) si
    la(fad) la si(sol) si

    %43
    si(sold) si dod(la) dod
    si(sold) si dod la r
    R2.

    %46
    r4 r8 r r la
    la4 la8 dod(re) mi\mbreak
    re4 mi8 re(la) r

    %49
    R2.
    r4 r8 r r la
    sol4. r8 r si

    %52
    la4. r8 r dod
    si4. r8 r re
    la4. r8 r la

    %55
    mi(fad) sol mi(fad) sol
    sol4. r8 r sol
    fad(mi) re\mbreak fad(mi) re

    %58
    re4. r8 r sol
    mi4. mi
    mi mi'4 mi8

    %61
    re4 si8 la4 la8
    la4. r8 r la
    la(re) fad la,(dod) mi

    %64
    la,(re) fad la,(dod) mi\mbreak
    la,\p(re) fad la,(dod) mi
    la,(re) fad la,(dod) la

    %67
    sol4 sol8 la4 la8
    si4 si8 la4 la8
    la4 si8 la4 la8

    %70
    la4.~la4

}

IIIobIIIn = \relative do'' {

   r8
   R2.
   r4 r8 r r fad,
   re4 la'8 la4 la8

   %4
   la4 dod8 la(fad) r
   R2.
   r4 r8 r r la

   %7
   la4. r8 r si
   si4. r8 r dod
   dod4. r8 r re\mbreak

   %10
   re4. r8 r re
   mi,4. mi
   mi r8 r mi

   %13
   mi4. mi
   fad r8 r fad
   fad4. fad

   %16
   mi mi
   mi4 mi8 mi4 mi8
   mi4. r8 r mi

   %19
   la4 la8 sold4 sold8
   la4 la8sold4 sold8\mbreak
   la4 r8 sold4 r8

   %22
   la4 r8 sold4 la8
   fad4 fad8 mi4 sold8
   fad4 fad8 mi4 mi8

   %25
   mi4 mi8 mi4 mi8
   mi4.~mi4 r8
   R2.

   %28
   r4 r8 r r fad
   fad4 fad8 fad4 lad8
   fad4 lad8 fad4 r8

   %31
   R2.\mbreak
   r4 r8 r r si
   si4 si8 si4 red8

   %34
   si4 red8 si(sol) fad
   mi4 r8 la4 r8
   la4 r8 sol4 r8

   %37
   mi4 r8 fad4 r8
   fad4 sold8 sold4 lad8
   fad4 si8 fad4 fad8

   %40
   re4. r8 r sol
   fad(re) fad sol(re) sol\mbreak
   fad(re) fad sol(re) sol

   %43
   sold(mi) sold la(mi) la
   sold(mi) sold la4 r8
   R2.

   %46
   r4 r8 r r fad
   re4 la'8 la4 dod8
   la4 dod8 la(fad) r

   %49
   R2.
   r4 r8 r r re
   re4. r8 r mi

   %52
   mi4. r8 r fad\mbreak
   fad4. r8 r sol
   sol4. r8 r sol

   %55
   sol(fad) mi sol(fad) mi
   mi4. r8 r la
   la(sol) fad la(sol) fad

   %58
   si4. r8 r si
   mi,4. mi
   mi la4 dod8

   %61
   la4 si8 mi,4 la8
   fad4. r8 r fad\mbreak
   fad(la) re mi,(la) dod

   %64
   fad,(la) re mi,(la) dod
   fad,\p(la) re mi,(la) dod
   fad,(la) re mi, \parentSlur (la) re,\f

   %67
   re4 mi8 mi4 fad8
   fad4 sol8 sol4 mi8
   fad4 sol8 mi4 la8

   %70
   fad4.~fad4

}

IIIvlIn =  \relative do'' {

    r8
    R2.
    r4 r8 r r la
    re(mi) fad mi(fad) sol

    %4
    fad(sol) la fad(re) r
    R2.
    r4 r8 r r mi

    %7
    fad4. r8 r fad
    sold4. r8 r sold
    la4. r8 r la

    %10
    si(la) si sold(la) si
    re,4. r8 r re
    si'(la) si sold(la) si

    %13
    dod,4. r8 r dod
    la'(sold) la fad(sold) la
    si, fad'4 si,8 la'4

    %16
    sold8(fad) mi re (dod) re
    dod(re) mi si4 la8
    la4. r8 r la

    %19
    la(dod) mi sold,(si) mi
    la,(dod) mi\mbreak sold,(si) mi
    la,\p(dod) mi sold,(si) mi

    %22
    la,(dod) mi sold,(si) mi
    fad\f si,4 sold'8 dod,4\mbreak
    la'8 re,4 si'8(mi,) re

    %25
    dod(re) mi si4 la8
    la4.~la4 mi'8
    dod(la) mi' dod(la) mi'

    %28
    dod(la) mi' mi4 fad8\mbreak
    si,(dod) re dod(re) mi
    re(mi) fad re (si) fad'

    %31
    re (si) fad' re (si) fad'
    re (si) fad' fad4 si8
    mi,(fad) sol fad(sol) la

    %34
    sol(la) si sol(mi) fad
    sol4 r8 la,8(dod) mi
    fad4 r8 sol,(si) re

    %37
    mi4 r8 fad,(lad) dod\mbreak
    re(dod) si mi(re) dod
    fad(mi) re dod4 si8

    %40
    si(fad) re si4 re'8\p
    re4 r8 re4 r8
    re4 r8 re4 mi8

    %43
    mi4 r8 mi4 r8
    mi4 r8 mi4 r8
    R2.

    %46
    r4 r8 r r la,
    re(mi) fad mi(fad) sol\mbreak
    fad(sol) la fad re r

    %49
    R2.
    r4 r8 r r la
    si(la) si re,(sol) si

    %52
    dod(si) dod mi,(la) dod
    re(dod) re fad,(si) re
    mi(re) mi dod(re) mi

    %55
    sol,4. r8 r sol
    mi'(re) mi dod(re) mi\mbreak
    fad,4. r8 r fad

    %58
    re'(dod) re si(dod) re
    mi, si'4 mi,8 re'4
    dod8(si) la la'4 sol8

    %61
    fad(mi) re dod4 re8
    re8-. la-. re-. fad-. re-. fad-.
    la la la la la la

    %64
    la la la la4 la8\p\mbreak
    la la la la la la
    la la la la4 la,8\f

    %67
    si mi4 dod8 fad4
    re8 sol4 mi8 la4
    fad8(mi) re dod4 re8

    %70
    re4.~re4

}

IIIvlIIn =  \relative do'' {

   r8
   R2.
   r4 r8 r r la
   la4 la8 dod(re) mi

    %4
    re4 mi8 re(la) r
    R2.
    r4 r8 r r la

    %7
    re4. r8 r re
    si4. r8 r mi\mbreak
    dod4. r8 r fad

    %10
    mi4. r8 r mi
    si(la) sold si(la) sold
    sold?4. r8 r sold

    %13
    la4 mi8 la4 mi8
    la4. r8 r la
    la4. la

    %16
    mi si'
    la4 la8 sold4 la8\mbreak
    la4. r8 r mi

    %19
    mi(la) dod mi,(sold) si
    mi,(la) dod mi,(sold) si
    mi,\p(la) dod mi,(sold) si

    %22
    mi,(la) dod mi,(sold) si
    la4\f si8 si4 dod8
    dod4 re8 re4 si8

    %25
    la4 la8 sold4 mi8
    mi4.~mi4 r8
    R2.

    %28
    r4 r8 r r dod'
    si4 si8 dod4 dod8
    si4 dod8 si fad r

    %31
    R2.
    r4 r8 r r fad'
    mi4 mi8 fad4 fad8

    %34
    mi4 fad8 mi(si) si
    si4 r8 la4 r8
    la4 r8 sol4 r8

    %37
    sol4 r8 fad4 r8\mbreak
    si(la) sold dod(si) lad
    re(dod) si lad4 fad8

    %40
    fad4. r8 r si_\markup {[\musicglyph #"p"]}
    dod4 r8 si4 r8
    la4 r8 si4 si8

    %43
    si4 r8 dod4 r8
    si4 r8 dod4 r8
    R2.

    %46
    r4 r8 r r la
    la4 la8 dod(re) mi\mbreak
    re4 mi8 re(la) r

    %49
    R2.
    r4 r8 r r la
    sol4. r8 r si

    %52
    la4. r8 r dod
    si4. r8 r re
    la4. r8 r la

    %55
    mi(fad) sol mi(fad) sol
    sol4. r8 r sol
    fad(mi) re\mbreak fad(mi) re

    %58
    re4. r8 r si'
    mi,4. mi
    mi mi'4 mi8

    %61
    re4 si8 la4 la8
    la4 r8 re la re
    fad4 fad8 mi4 mi8

    %64
    fad4 fad8 mi4 mi8_\markup {[\musicglyph #"p"]}
    fad4 r8 mi4 r8
    fad4 r8 mi4 la,8_\markup {[\musicglyph #"f"]}

    %67
    sol4 sol8 la4 la8
    si4 si8 la4 la8
    la4 si8 la4 la8

    %70
    la4.~la4

}

IIIvlan = \relative do' {

   r8
   R2.
   r4 r8 r r fad
   re4 la'8 la4 la8

   %4
   la4 dod8 la(fad) r
   R2.
   r4 r8 r r la

   %7
   la4. r8 r si
   si4. r8 r dod\mbreak
   dod4. r8 r re

   %10
   re4. r8 r re
   mi,4. mi
   mi r8 r mi

   %13
   mi4. mi
   fad r8 r fad
   fad4. fad

   %16
   mi mi
   mi4 mi8 mi4 mi8
   dod4. r8 r dod

   %19
   dod(mi) la\mbreak si,(mi) sold
   dod,(mi) la si,(mi) sold
   dod,\p(mi) la si,(mi) sold

   %22
   dod,(mi) la si,(mi) mi
   re4\f fad8 mi4 sold8
   fad4 fad8 mi4 mi8

   %25
   mi4 mi8 mi4 mi8
   dod4.~dod4 r8
   R2.\mbreak

   %28
   r4 r8 r r fad
   fad4 fad8 fad4 lad8
   fad4 lad8 fad(re) r

   %31
   R2.
   r4 r8 r r si'
   si4 si8 si4 red8

   %34
   si4 red8 si(sol) fad
   mi4 r8 mi4 r8
   re4 r8 re4 r8

   %37
   dod4 r8 dod4 r8\mbreak
   fad4 sold8 sold4 lad8
   fad4 si8 fad4 fad8

   %40
   re4. r8 r sol
   fad4 r8 sol4 r8
   fad4 r8 sol4 sol8

   %43
   sold4 r8 la4 r8
   sold4 r8 la4 r8
   R2.

   %46
   r4 r8 r r fad
   re4 la'8 la4 dod8
   la4 dod8\mbreak la(fad) r

   %49
   R2.
   r4 r8 r r re
   re4. r8 r mi

   %52
   mi4. r8 r fad
   fad4. r8 r sol
   sol4. r8 r sol

   %55
   sol(fad) mi sol(fad) mi
   mi4. r8 r la
   re,4. re\mbreak

   %58
   si4. r8 r si
   si4. si
   la4 mi'8 mi4 la8

   %61
   la4 si8 mi,4 la8
   fad4. r8 r re'
   re4 re8 dod4 dod8

   %64
   re4 re8 dod4 dod8
   re4 r8 dod4 r8
   re4 r8 dod4 re,8

   %67
   re4 mi8 mi4 fad8\mbreak
   fad4 sol8 sol4 mi8
   fad4 sol8 mi4 la8

   %70
   fad4.~fad4

}

IIIbcn = \relative do {

    r8
    re4. re
    re re4 re8
    fad4 re8 dod4 la8

    %4
    re4 la8 re,4 r8
    re'4 r8 re4 r8
    re4. re4 dod8

    %7
    re4. r8 r re
    mi4. r8 r mi\mbreak
    fad4. r8 r fad

    %10
    sold4. r8 r sold
    sold(la) si sold(la) si
    mi,4. r8 r mi

    %13
    la(si) dod la(si) dod
    re,4. r8 r re
    red4. red

    %16
    mi sold
    la4 dod,8 mi4 mi,8
    la4. r4 r8

    %19
    R2.*3\mbreak
    r4 r8 r r dod
    re4 re8 mi4 mi8

    %24
    fad4 fad8 sold4 sold8
    la4 dod,8 mi4 mi,8
    la4.~la4 r8

    %27
    la'4. la
    la la4 lad8
    si4 si8 lad4 fad8

    %30
    si4 fad8 si,4 r8
    si'4. si\mbreak
    si si4 red,8

    %33
    mi4 mi8 red4 si8
    mi4 si8 mi,4 red'8
    mi4 r8 dod4 r8

    %36
    re4 r8 si4 r8
    dod4 r8 lad4 r8
    si4 mi8 dod4 fad8

    %39
    re4 mi8 fad4 fad,8
    si4.~si4 r8
    R2.*3

    %44
    r4 r8 r r la'
    fad(re) la' fad(re) la'\mbreak
    fad(re) la' la4 sol8

    %47
    fad4 re8 dod4 la8
    re4 la8 re,4 la''8
    fad(re) la' fad(re) la'

    %50
    fad(re) la' la4 fad,8
    sol4. r8 r sol
    la4. r8 r la

    %53
    si4. r8 r si
    dod4. r8 r dod
    dod(re) mi dod(re) mi

    %56
    la,4. r8 r la
    re(mi) fad\mbreak re(mi) fad
    sol,4. r8 r sol

    %59
    sold4. sold
    la4. dod8(si) la
    re4 sol8 la4 la,8

    %62
    re4. r4 r8
    R2.*3
    r4 r8 r r fad

    %67
    sol(fad) mi la(sol) fad
    si(la) sol dod(si) la
    re4 sol,8 la4 la,8

    %70
    re,4.~re4

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key re\major
    \time 6/8
    \tempo 2. = 67
    \partial 8 s8
    s2.*25
    s4. s4
    \bar":..:"\break
    s8
    s2.*43
    s4. s4
    \bar":|."

}

IIIobI = {
    \IIIglobal
    \notypeset
    <<\IIIobIn \forma>>

}

IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>

}

IIIobIII = {
    \IIIglobal
    <<\IIIobIIIn \forma>>

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

IVglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \senza
}

IVobIn = \relative do'' {

   la4 la re
   dod re8(dod) si(la)
   re4 mi fad

   %4
   mi sol2
   fad4 sol8(fad) mi(re)
   fad4 mi2

   %7
   la,4 la re
   dod re8(dod) si(la)
   re4 mi fad

   %10
   mi sol2
   fad4 sol8(fad) mi(re)
   fad4 mi2

   %13
   la4 re, dod
   re2.
   fad4 fad sol

   %16
   mi2 fad4
   re mi dod
   re si8 dod re si

   %19
   mi4 mi dod
   fad2 sold4
   la la si

   %22
   sold la8(sold) fad(mi)
   mi,4 mi la
   sold la8(sold) fad(mi)

   %25
   la4 si dod
   si re2\mbreak
   dod4 re8(dod) si(la)

   %28
   dod4 si2
   mi4 la, sold
   la4. si8 dod re

   %31
   mi4 dod la
   sol' fad2
   la4 sol8(fad) mi(re)

   %34
   fad4 mi2
   la,4 la re
   dod re8(dod) si(la)

   %37
   re4 mi fad
   mi sol2
   fad4 sol8(fad) mi(re)

   %40
   fad4 mi2
   la4 re, dod
   re2.\fermata

}

IVobIIn = \relative do'' {

   fad,4 fad sold
   la2 la4
   la dod re

   %4
   dod mi2
   re re4
   re dod2

   %7
   la4 la la
   la2 la4
   la dod re

   %10
   dod mi2
   re re4
   re dod2

   %13
   la4 si la
   la2.\mbreak
   re4 re mi

   %16
   dod2 re4
   si dod lad
   si sold8 la si sold

   %19
   dod4 dod la
   re2 re4
   mi2 si4

   %22
   si2 sold4
   mi2 mi4
   mi2 mi4

   %25
   mi sold la
   fad si2
   la la4\mbreak

   %28
   la sold2
   la4 fad  mi
   mi2 la4

   %31
   dod la mi
   mi' re2
   fad4 re la

   %34
   re dod2
   la4 la la
   la2 la4

   %37
   la dod re
   dod mi2
   re re4

   %40
   re dod2
   la4 si la
   la2.\fermata

}

IVobIIIn = \relative do'' {

   re,4 re re
   mi2 mi4
   fad sol la

   %4
   la dod2
   la4 la sold
   la mi2

   %7
   re4 mi fad
   mi2 mi4
   fad sol la

   %10
   la dod2
   la4 la sold
   la mi2

   %13
   re4 sol mi
   fad2.\mbreak
   la4 la si

   %16
   la2 la4
   sol sol fad
   fad mi si'

   %19
   la2 la4
   la2 si4
   la2 fad4

   %22
   mi2 mi4
   mi2 r4
   mi2 r4

   %25
   mi re mi
   re mi2
   mi red4

   %28
   mi mi2
   mi4 la mi
   mi2 mi4

   %31
   la mi la
   dod la2
   re4 la fad

   %34
   la mi2\mbreak
   re4 mi fad
   mi2 mi4

   %37
   fad sol la
   la dod2
   la sold4

   %40
   la mi2
   re4 sol mi
   fad2.\fermata

}

IVvlIn =  \relative do'' {

   la4 la re
   dod re8(dod) si(la)
   re4 mi fad

   %4
   mi sol2
   fad4 sol8(fad) mi(re)
   fad4 mi2

   %7
   la,4 la re
   dod re8(dod) si(la)
   re4 mi fad

   %10
   mi sol2
   fad4 sol8(fad) mi(re)
   fad4 mi2

   %13
   la4 re, dod
   re2.
   fad4 fad sol

   %16
   mi2 fad4
   re mi dod
   re si8 dod re si

   %19
   mi4 mi dod
   fad2 sold4
   la la si

   %22
   sold la8(sold) fad(mi)
   mi,4 mi la
   sold la8(sold) fad(mi)

   %25
   la4 si dod
   si re2\mbreak
   dod4 re8(dod) si(la)

   %28
   dod4 si2
   mi4 la, sold
   la4. si8 dod re

   %31
   mi4 dod la
   sol' fad2
   la4 sol8(fad) mi(re)

   %34
   fad4 mi2
   la,4 la re
   dod re8(dod) si(la)

   %37
   re4 mi fad
   mi sol2
   fad4 sol8(fad) mi(re)

   %40
   fad4 mi2
   la4 re, dod
   re2.\fermata

}

IVvlIIn =  \relative do'' {

   fad,4 fad sold
   la2 la4
   la dod re

   %4
   dod mi2
   re re4
   re dod2

   %7
   la4 la la
   la2 la4
   la dod re

   %10
   dod mi2
   re re4
   re dod2

   %13
   la4 si la
   la2.\mbreak
   re4 re mi

   %16
   dod2 re4
   si dod lad
   si sold8 la si sold

   %19
   dod4 dod la
   re2 re4
   mi2 si4

   %22
   si2 sold4
   mi2 mi4
   mi2 mi4

   %25
   mi sold la
   fad si2
   la la4\mbreak

   %28
   la sold2
   la4 fad  mi
   mi2 la4

   %31
   dod la mi
   mi' re2
   fad4 re la

   %34
   re dod2
   la4 la la
   la2 la4

   %37
   la dod re
   dod mi2
   re re4

   %40
   re dod2
   la4 si la
   la2.\fermata

}

IVvlan = \relative do' {

   re4 re re
   mi2 mi4
   fad sol la

   %4
   la dod2
   la4 la sold
   la mi2

   %7
   re4 mi fad
   mi2 mi4
   fad sol la

   %10
   la dod2
   la4 la sold
   la mi2

   %13
   re4 sol mi
   fad2.\mbreak
   la4 la si

   %16
   la2 la4
   sol sol fad
   fad mi si'

   %19
   la2 la4
   la2 si4
   la2 fad4

   %22
   mi2 mi4
   la, si dod
   si2 si4

   %25
   dod re mi
   re mi2
   mi red4

   %28
   mi mi2
   mi4 fad si,
   dod2 mi4\mbreak

   %31
   la mi dod
   dod' la2
   re4 la fad

   %34
   la mi2
   re4 mi fad
   mi2 mi4

   %37
   fad sol la
   la dod2
   la sold4

   %40
   la mi2
   re4 sol mi
   fad2.\fermata

}

IVbcn = \relative do {

   re4 dod si
   la2 sol4
   fad mi re

   %4
   la'2 dod4
   re dod si
   la la' sol

   %7
   fad mi re
   la2 sol4
   fad mi re

   %10
   la'2 dod4
   re dod si
   la la' sol

   %13
   fad sol la
   re, la re,
   re'2 sol,4

   %16
   la sol fad
   sol mi fad
   si mi re

   %19
   dod2 fad4
   re dod si
   dod dod red

   %22
   mi2 re!4
   dod si la
   mi'2 re4

   %25
   dod si la~\mbreak
   la sold mi
   la sold fad

   %28
   mi mi' re
   dod re mi
   la,2.~

   %31
   la~
   la~
   la~

   %34
   la4 la' sol
   fad  mi re
   la2 sol4

   %37
   fad mi re
   la'2 dod4\mbreak
   re dod si

   %40
   la la' sol
   fad sol la
   re,2.\fermata

}

IVbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\major
  \time 3/4
  \tempo 2. = 60
  s2.*42
  \bar"|."


}

IVobI = {
  \IVglobal
  \notypeset
  <<\IVobIn \forma>>

}

IVobII = {
  \IVglobal
  <<\IVobIIn \forma>>

}

IVobIII = {
  \IVglobal
  <<\IVobIIIn \forma>>

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

IVbc = {
  \IVglobal
  \clef bass
  <<\IVbcn \forma \IVbfn>>
  \typeset

}

Vglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \senza
}

VobIn = \relative do'' {

    re4 la re
    fad la2
    fad4. mi16 fad sol4

    %4
    mi mi fad\mbreak
    sol2.~
    sol

    %7
    fad8 sold sold4. la8
    la2. la
    mi4 dod mi

    %10
    sol16(la) si8 sol2
    fad4 sol8 fad mi re
    dod4 dod re

    %13
    mi2.~
    mi
    re8 dod dod4. si8

    %16
    si2.
    re4 la' re,\mbreak
    re fad2

    %19
    mi4 si' mi,
    mi4. sol8 fad mi
    re4 la re

    %22
    fad la2
    fad8 mi re4 dod
    re2. re

}

VobIIn = \relative do'' {

    la4 fad la
    re fad2
    re4. dod16 re mi4

    %4
    dod dod red
    mi2.~
    mi

    %7
    re!4 mi4. mi8
    mi2. mi
    dod4 la dod

    %10
    mi mi2
    re4 mi8 re dod si\mbreak
    lad4 lad si

    %13
    dod2.~
    dod
    si4 lad2

    %16
    fad2.
    la4 re la
    la re2

    %19
    re4 re re
    dod2 dod4
    la fad la

    %22
    re fad2
    re4 la la
    la2. la

}

VobIIIn = \relative do'' {

    fad,4 re fad
    la re2
    la4 la si

    %4
    la2 la4\mbreak
    si2.
    la

    %7
    si4 si4. dod8
    dod2. dod
    la4 mi la

    %10
    la la2
    la4 sol si
    fad fad fad

    %13
    fad2.~
    fad
    fad4 fad2

    %16
    re2.
    re4 re re
    re fad2

    %19
    si4 si si
    la2 la4\mbreak
    fad re fad

    %22
    la re2
    la8 sol fad4 mi
    fad2. fad

}

VvlIn =  \relative do'' {

   <<{re8 la la re re fad
      fad re re fad fad la
      la fad fad sol sol mi

      %4
      mi dod dod mi mi fad
      sol2.
      sol

      %7
      fad8 si, si sold' sold la\mbreak
      la mi mi dod dod re la'2.}\\{fad,8 re re fad fad la
                                  la fad fad la la re
                                  re la la mi' mi dod
                                  dod la la dod dod red
                                  mi si \parentSlur (mi re dod si)
                                  dod si \parentSlur (la si dod la)
                                  re mi, mi si' si dod\mbreak
                                  dod la la mi mi fad dod'2.}>>
   <<{mi8 la la mi mi dod

      %10
      dod mi mi sol sol fad
      fad sol sol fad mi re
      dod fad fad dod dod re

      %13
      mi2.
      mi\mbreak
      si8 dod dod lad lad si

      %16
      si re re fad fad re
      re fad fad la la fad
      fad re re fad fad mi

      %19
      mi sol sol si si mi,
      mi dod dod la la dod
      re la la re re fad\mbreak

      %22
      fad la la fad fad re
      fad mi re dod dod re
      re fad fad re re mi re2.}\\{la8 dod dod la la mi
                                   mi la la dod dod re
                                   re si si re dod fad,
                                   fad dod' dod fad, fad fad
                                   lad si \parentSlur (dod si lad si)
                                   lad si \parentSlur (dod si dod lad)\mbreak
                                   re, mi mi dod dod re
                                   re fad fad si si fad
                                   fad la la re re la
                                   la fad fad la la sol
                                   sol si si mi mi dod
                                   dod la la mi mi la
                                   fad re re fad fad la\mbreak
                                   la re re la la fad
                                   la sol fad mi mi fad
                                   fad la la fad fad la fad2.}>>

}

VvlIIn =  \relative do'' {

    <<{fad,8 re' re la la fad
       fad fad' fad re re la
       la re re sol, sol dod

       %4
       dod mi mi dod dod la
       si2.
       la\mbreak

       %7
       re8 si si re re dod
       mi, dod' dod mi mi re mi,2.}\\{re8 fad fad re re la
                                      la la' la fad fad re
                                      re fad fad sol, sol la'
                                      la dod dod la la fad
                                      mi fad (sol fad mi sol)
                                      la si(dod si la dod)\mbreak
                                      re, sold sold mi mi la
                                      la, mi' mi sol sol fad la,2.}>>
    <<{dod'8 la la dod dod mi

       %10
       mi dod dod la la re
       re si si la si dod
       lad fad fad lad lad si\mbreak

       %13
       dod re(mi re dod re)
       dod re(mi re mi dod)
       re lad lad dod dod si

       %16
       si fad fad re re fad
       la fad fad re re fad
       fad fad' fad re re si

       %19
       si mi mi si si dod\mbreak
       dod mi mi la la mi
       re fad fad re re la

       %22
       la fad fad la la re
       re dod re la la la
       la fad fad la la dod la2.}\\{la8 mi mi la la dod
                                    dod la la mi mi fad
                                    fad mi mi fad sol mi
                                    fad lad, lad fad' fad re\mbreak
                                    fad2.
                                    fad
                                    fad8 dod dod mi mi re
                                    fad re re si si re
                                    fad re re la la re
                                    re la' la fad fad sol
                                    sol mi mi sol sol la\mbreak
                                    la dod dod mi mi dod
                                    la re re la la fad
                                    fad re re fad fad la
                                    re, mi fad sol sol fad
                                    re la la re re la' re,2.}>>

}

forma = {

  \key re\major
  \time 3/4
  \tempo 2. = 60
  \repeat volta 2{s2.*7}
  \alternative {{s2.}{s}}
  \bar".|:"\break \set Score.currentBarNumber = #9
  \repeat volta 2{s2.*15}
  \alternative {{s2.}{s}}
  \bar"|."

}

VobI = {
  \Vglobal
  \notypeset
  <<\VobIn \forma>>

}

VobII = {
  \Vglobal
  <<\VobIIn \forma>>

}

VobIII = {
  \Vglobal
  <<\VobIIIn \forma>>

}

VvlI = {
  \Vglobal
  <<\VvlIn \forma>>

}

VvlII = {
  \Vglobal
  <<\VvlIIn \forma>>
  \typeset

}

VIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \senza
}

VIobIn = \relative do'' {

    la4 re
    re mi fad8 sol fad4
    fad mi la,8 sol fad sol
    la sol fad sol la sol fad sol

    %4
    la4 re, la' re
    re mi fad8 sol fad4\mbreak
    fad4 mi la r

    %7
    fad r sol r
    mi r fad r
    re r mi r

    %10
    dod r  la'8 la, la la
    la'4 r la8 la, la la
    la'4 r la8 sold fad sold

    %13
    la sold fad sold la sold la fad
    si4 mi, la, la8 si
    dod4 dod8 re mi4 mi8 re

    %16
    dod4 la mi' mi8 re
    dod si dod la mi'4 mi8 re
    dod4 la mi' r

    %19
    fad r sold r
    la4 r re,8 (dod) si (la)
    mi' (dod) si (la) dod (si) la (sold)

    %22
    la2 do4\p~do
    do~do\mbreak do~do
    do~do do r

    %25
    do r do r
    si r re8\f do si la
    si la sol si mi(re) dod!(si)

    %28
    dod(si) la(dod) fad mi re dod
    re dod si re sol fad mi re
    mi re dod mi\mbreak la sol fad mi

    %31
    fad mi re fad si la sol fad
    sol fad mi fad sol2~
    sol1~

    %34
    sol2 la8(sol) fad(mi)
    si'(sol) fad(mi) sol \parentSlur (fad) mi \parentSlur (red)
    mi2 re!8(dod) si \parentSlur (dod)

    %37
    re(dod) si \parentSlur (dod) re(dod) si \parentSlur (dod)
    re2\mbreak si'8 re, dod re
    si' re, dod re si' re, dod re

    %40
    dod4 la la re
    re mi fad8 \parentSlur (sol) fad4
    fad mi la,8 la la la

    %43
    la la la la la la la la
    la2 la4 re
    re mi fad8 \parentSlur (sol) fad4\mbreak

    %46
    fad mi la r
    fad r fad r
    re r re r

    %49
    si r la r
    fad r re'8 re, re re
    re'4 r re8 re, re re

    %52
    re'4 r re8 dod si dod
    re dod si dod re dod re si\mbreak
    mi4 la, re, re8 mi

    %55
    fad4 fad8 sol la4 la8 sol
    fad4 re r2
    r la''4 la8 sol

    %58
    fad4 re la r
    si r dod r
    re r la r

    %61
    si r dod r
    re r sol8(fad) mi(re)
    la'(fad) mi(re) fad(mi) re(dod)

    %64
    re2\fermata

}

VIobIIn = \relative do'' {

    fad,4 la
    la dod re8 mi re4
    re dod fad,8 sol la sol
    fad sol la sol fad sol la sol

    %4
    fad2 fad4 la
    la dod re8 mi re4
    re dod mi r

    %7
    re r\mbreak re r
    dod r dod r
    si r si r

    %10
    la r la'8 la, la la
    la'4 r la8 la, la la
    fad'4 r fad8 mi red mi

    %13
    fad mi red mi fad mi fad red
    mi2 la,4 la8 si
    dod4 dod8 re mi4 mi8 re

    %16
    dod4 la si sold
    la mi mi' mi8 re\mbreak
    dod4 la la r

    %19
    re r re r
    dod r la r
    la r la mi

    %22
    mi2 fad4\p~fad
    fad~fad fad~fad
    fad~fad la r

    %25
    la r la r
    sol r la r
    sol r si r

    %28
    la r dod r\mbreak
    si r re r
    dod r mi r

    %31
    re r fad r
    mi si mi2~
    mi1~

    %34
    mi2 mi4 r
    mi r do si
    si2 si8 la sold la

    %37
    si la sold la si la sold la
    si2 si4~si
    si~si si~si

    %40
    la mi\mbreak fad la
    la dod re8 \parentSlur (mi) re4
    re dod fad,8 fad fad fad

    %43
    fad fad fad fad fad fad fad fad
    fad2 fad4 la
    la dod re8 \parentSlur (mi) re4

    %46
    re dod mi r
    re r dod r
    si r la r

    %49
    sol r la r
    re, r\mbreak re'8 re, re re
    re'4 r re8 re, re re

    %52
    si'4 r si8 la sold la
    si la sold la si la si sold
    la2 re,4 re8 mi

    %55
    fad4 fad8 sol la4 la8 sol
    fad4 re r2
    r2 la''4 la8 sol

    %58
    fad4 re re, r
    sol r sol r
    fad r re r\mbreak

    %61
    sol r sol r
    r fad re' r
    re r re la

    %64
    la2\fermopz

}

VIobIIIn = \relative do'' {

    r2
    R1
    r2 fad,8 mi re mi
    fad mi re mi fad mi re mi

    %4
    fad2 re4 fad
    fad la fad re
    la'2 la4 r

    %7
    la r sol r
    sol r fad r \mbreak
    fad r mi r

    %10
    mi r dod' si
    la sold? fad mi
    red r red'8 mi fad mi

    %13
    red mi fad mi red4 red
    si2 la4 la8 si
    dod4 dod8 re mi4 mi8 re

    %16
    dod4 la mi mi
    mi2\mbreak mi'4 mi8 re
    dod4 la la r

    %19
    la r mi r
    la r fad r
    mi r mi mi

    %22
    mi2  re4_\markup {[\musicglyph #"p"]}~re
    re~re re~re
    re \parentSlur (re) fad r

    %25
    re r\mbreak re r
    sol r re r
    re r mi r

    %28
    mi r fad r
    fad r sol r
    sol r la r

    %31
    la r si r
    si r si2~
    si1~

    %34
    si2 mi,4 r\mbreak
    mi r mi si'
    sold2 sold8 la si la

    %37
    sold la si la sold la si la
    sold2 sold4~sold
    sold~sold sold~sold

    %40
    mi~mi re~re
    re la'~la la\mbreak
    la mi re8 re re re

    %43
    re re re re re re re re
    re2 re4 re
    re la' la la

    %46
    la la la r
    la r fad r
    fad r re r

    %49
    re r mi r\mbreak
    re r fad mi
    re fad si si

    %52
    si r sold8 la si la
    sold la si la sold4 sold
    mi2 re4 re8 mi

    %55
    fad4 fad8 sol la4 la8 sol
    fad4 re r2\mbreak
    r la''4 la8 sol

    %58
    fad4 re la r
    sol r mi r
    si' r la r

    %61
    sol r mi r
    si' r si r
    la r si mi,

    %64
    fad2\fermopz

}

VIvlIn =  \relative do'' {

    re,4 fad
    fad la fad re
    la' la, re8 re re re
    re re re re re re re re

    %4
    re2 r
    R1
    r2 la''8 sol fad mi

    %7
    fad mi re fad sol fad mi re
    mi re dod mi fad mi re dod
    re dod si re\mbreak mi re dod si

    %10
    dod si la si dod4 r
    la'8 la, la la la'4 r
    la8 la, la la la' sold fad sold

    %13
    la sold fad sold la sold la fad
    si4 mi, la, la8 si
    dod4 dod8 re mi4 mi8 re

    %16
    dod4 la r2
    r mi4 mi8 re\mbreak
    dod4 la r mi''

    %19
    r fad r sold
    r la re,8 (dod) si (la)
    mi' (dod) si (la) dod (si) la (sold)

    %22
    la2 do8 si la si
    do si la si do si la si
    do2 la'8 (do,) si (do)

    %25
    la' (do,) si (do) la' do, si la\mbreak
    si4 sol re' r
    si r mi r

    %28
    dod r fad r
    re r sol r
    mi r la r

    %31
    fad r si r
    sol r r2
    sol1~

    %34
    sol2 la8(sol) fad(mi)
    si' (sol) fad(mi) sol(fad) mi(red)
    mi2 si4~si

    %37
    si~si si~si
    si~si si r
    si r si r

    %40
    dod r la re
    re mi fad8(sol) fad4
    fad mi la8 sol fad sol

    %43
    la sol fad sol la sol fad sol
    la4 re, la re
    re mi fad8(sol) fad4

    %46
    fad mi la8(sol) fad(mi)\mbreak
    fad(mi) re(mi) fad(mi) re(dod)
    re dod si dod re do si la

    %49
    si la sol si la sol fad mi
    fad mi re mi fad4 r
    re'8 re, re re re'4 r

    %52
    re8 re, re re re' dod si dod
    re dod si dod re dod re si\mbreak
    mi4 la, re, re8 mi

    %55
    fad4 fad8 sol la4 la8 sol
    fad4 re la' la8 sol
    fad(mi) fad(re) la'4 la8 sol

    %58
    fad4 re r la'
    r si r dod
    r re r la

    %61
    r si r dod
    r re sol8(fad) mi(re)
    la'(fad) mi(re) fad(mi) re(dod)

    %64
    re2\fermopz

}

VIvlIIn =  \relative do'' {

    r2
    R1
    r2 la,8 la la la
    la la la la la la la la

    %4
    la2 r
    R1
    r2 mi''4 r

    %7
    re r re r
    dod r dod r
    si r si r

    %10
    la mi la r\mbreak
    la'8 la, la la la'4 r
    la8 la, la la fad' mi red mi

    %13
    fad mi red mi fad mi fad red
    mi2 la,4 la8 si
    dod4 dod8 re mi4 mi8 re

    %16
    dod4 la r2
    r mi4 mi8 re
    dod4 la r la'

    %19
    r re\mbreak r re
    r dod la r
    la r la mi

    %22
    mi2 la8 sol fad sol
    la sol fad sol la sol fad sol
    la2 fad4~fad

    %25
    fad~fad fad~fad
    sol4 re la' r
    sol r si r

    %28
    la r dod r\mbreak
    si r re r
    dod r mi r

    %31
    re r fad r
    mi r r2
    mi1~

    %34
    mi2 mi4 r
    mi r do si
    si2 sold4~sold

    %37
    sold?~sold sold~sold
    sold?~sold sold r
    sold? r sold r

    %40
    la r fad la
    la re\mbreak re8 \parentSlur (mi) re4
    re dod fad8 sol la sol

    %43
    fad sol la sol fad sol la sol
    fad4 la, fad la
    la re re8 \parentSlur (mi) re4

    %46
    re dod mi r
    re r dod r
    si r la r

    %49
    sol r la r
    re, la re r\mbreak
    re'8 re, re re re'4 r

    %52
    re8 re, re re si' la sold la
    si la sold la si la si sold
    la2 re,4 re8 mi

    %55
    fad4 fad8 sol la4 la8 sol
    fad4 re mi dod
    re la la' la8 sol

    %58
    fad4 re r re
    r sol\mbreak r sol
    fad r re r

    %61
    sol r sol r
    r fad re' r
    re r re la

    %64
    la2\fermata

}

VIvlan = \relative do' {

    r2
    R1
    r2 fad,8 fad fad fad
    fad fad fad fad fad fad fad fad

    %4
    fad2 r
    R1
    r2 la'4 r

    %7
    la r sol r
    sol r fad r\mbreak
    fad r mi r

    %10
    mi r dod' si
    la sold fad mi
    red r la' sold

    %13
    fad fad fad fad
    sold2 la,4 la8 si
    dod4 dod8 re mi4 mi8 re

    %16
    dod4 la r2\mbreak
    r mi'4 mi8 re
    dod4 la r la'

    %19
    r la r mi
    r la fad r
    mi r mi mi

    %22
    dod2 fad8 sol la sol
    fad sol la sol fad sol la sol\mbreak
    fad2 re4~re

    %25
    re~re re~re
    re si re r
    re r mi r

    %28
    mi r fad r
    fad r sol r
    sol r la r

    %31
    la r si r\mbreak
    si r r2
    si1~

    %34
    si2 mi,4 r
    mi r mi si'
    sold2 mi4~mi

    %37
    mi~mi mi~mi
    mi~mi mi r
    mi r mi r

    %40
    mi r re re\mbreak
    re la' la la
    la mi re8 mi fad mi

    %43
    re mi fad mi re mi fad mi
    re4 fad re re
    re la' la la

    %46
    la la la r
    la r fad r
    fad r\mbreak re r

    %49
    re r la r
    la r fad' mi
    re dod si la

    %52
    sold r re' dod
    si si si si
    dod2 re4 re8 mi

    %55
    fad4 fad8 sol la4 la8 sol\mbreak
    fad4 re la la
    la la la' la8 sol

    %58
    fad4 re r la'
    r sol r mi
    r si' r la

    %61
    r sol r mi
    r si' si r
    la r si mi,

    %64
    fad2\fermopz

}

VIbcn = \relative do {

    r2
    R1
    r2 re8 mi fad mi
    re mi fad mi re mi fad mi

    %4
    re4 re, r2
    R1
    r2 dod''4 r

    %7
    re r si r
    dod r\mbreak la r
    si r sold r

    %10
    la r la sold
    fad mi red dod
    si r fad' mi

    %13
    red dod si la
    sold2 la'4 la8 si
    dod4 dod8 re mi4 mi8 re

    %16
    dod4 la\mbreak sold mi
    la r r2
    r dod,8 si dod la

    %19
    re dod re la mi' re mi la,
    fad' mi fad la, fad'4 r
    dod r  mi mi,

    %22
    la2 r
    R1*3\mbreak
    r2 fad4 r

    %27
    sol r sold r
    la r lad r
    si r si r

    %30
    dod r dod r
    re r red r
    mi r mi'8(re) do(si)

    %33
    do(si) la(sol)\mbreak do(si) la(sol)
    la(sol) fad(mi) do4 r
    sol r la si

    %36
    mi,2 r
    mi r
    mi r

    %39
    mi r
    la re4 fad
    fad la fad re\mbreak

    %42
    la' la, r2
    R1
    r2 re4 fad

    %45
    fad la fad re
    la' la, dod' r
    re r lad r

    %48
    si r fad r
    sol r dod, r\mbreak
    re r re' dod

    %51
    si la sold fad
    mi r si' la
    sold fad mi re

    %54
    dod2 re4 re8 mi
    fad4 fad8 sol la4 la8 sol
    fad4 re dod la\mbreak

    %57
    re r r2
    r fad8 mi fad re
    sol fad sol re la' sol la re,

    %60
    si' la si re, fad mi fad re
    sol fad sol re la' sol la re,
    si' la si re, si'4 r

    %63
    fad r sol la
    re,2\fermopz

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key re\major
    \time 2/2
    \tempo 1 = 57
    \partial 2 s2
    s1*21
    s2
    \bar":..:"\break
    s2
    s1*41
    s2
    \bar ":|."

}

VIobI = {
    \VIglobal
    \notypeset
    <<\VIobIn \forma>>

}

VIobII = {
    \VIglobal
    <<\VIobIIn \forma>>

}

VIobIII = {
    \VIglobal
    <<\VIobIIIn \forma>>

}

VIvlI = {
    \VIglobal
    <<\VIvlIn \forma>>

}

VIvlII = {
    \VIglobal
    <<\VIvlIIn \forma>>

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

VIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \senza
}

VIIobIn = \relative do'' {

    la4
    re4. dod8 re4
    mi la, la'
    fad4. mi8 fad4

    %4
    mi2 la,4
    re4. dod8 re4
    mi la, la'

    %7
    fad4. mi8 fad4
    mi2 la,4
    re8.[(mi16) re8.(mi16) re8.(mi16)]

    %10
    re8.[(dod16) si8.(dod16) re8.(si16)]
    mi8.[(fad16) mi8.(fad16) mi8.(fad16)]\mbreak
    mi8.[(re16) dod8.(re16) mi8.(fad16)]

    %13
    sol4. la8 fad4
    mi sol8\parentSlur (fad) mi\parentSlur (re)
    mi4 la, dod

    %16
    re8 dod re mi fad re
    sol4. la8 fad4
    mi sol8 fad mi re

    %19
    mi4 la, dod
    re2 fad4
    fad4. mi8 fad4

    %22
    re si fad'
    fad4. mi8 fad4
    re si sol'

    %25
    sol4. la8 fad4\mbreak
    si si, mi
    la4. fa8 do4

    %28
    la fa do'
    re re8 do re sib
    do4 la do

    %31
    fa fa8 mi fa do
    sol'2 sib4
    la sol8(fa) la4

    %34
    la4. la8 sol fad!
    sol4 fad8 mi red mi
    sold,2 mi'4

    %37
    si4. dod!8 re4
    dod la mi'\mbreak
    si4. dod8 re4

    %40
    dod la dod
    re8.[(mi16) re8.(mi16) re8.(mi16)]
    re4 r si

    %43
    mi8.[(fad16) mi8.(fad16) mi8.(fad16)]
    mi4. re8[mi8.\parentSlur (fad16)]
    sol4. la8 fad4

    %46
    mi sol8\parentSlur (fad) mi\parentSlur (re)
    mi4 la, dod
    re2 r4

    %49
    R2.*3
    r4 r

}

VIIobIIn = \relative do'' {

    fad,4
    la2 la4
    dod2 dod4
    re4. dod8 re4

    %4
    dod2 la4
    la2 la4\mbreak
    dod2 dod4

    %7
    re4. dod8 re4
    dod2 la4
    la fad la
    si r si

    %11
    si sold si
    dod r dod
    re2 dod4

    %14
    si2 la4
    si la la
    la2 re4

    %17
    re2 dod4
    si2 la4
    si la la

    %20
    la2 re4
    dod4. si8 dod4
    si fad re'

    %23
    dod lad dod\mbreak
    si fad r
    R2.*9

    %34
    si2 r4
    R2.
    mi,2 la4

    %37
    la la sold
    la mi la
    la la sold

    %40
    la mi  la
    la fad la
    si r si

    %43
    si sold si
    dod r dod
    re2 dod4

    %46
    si2 la4
    si la la
    la2 r4

    %49
    R2.*3
    r4 r

}

VIIobIIIn = \relative do'' {

    re,4
    re2 la'4
    la2 la4
    la2 la4

    %4
    la2 mi4
    re2 la'4
    la2 la4

    %7
    la2 la4
    la2 mi4\mbreak
    re2 re4

    %10
    sol r sol
    mi2 mi4
    la r la

    %13
    sol2 la4
    mi2 fad4
    mi fad sol

    %16
    fad2 la4
    sol2 la4
    mi2 fad4

    %19
    mi fad sol
    fad2\mbreak r4
    R2.

    %22
    r4 r fad
    fad2 fad4
    fad re r

    %25
    R2.*9
    fad2 r4
    R2.

    %36
    mi2 mi4
    fad mi mi
    mi2 mi4

    %39
    fad mi mi\mbreak
    mi2 mi4
    re2 re4

    %42
    sol r sol
    mi2 mi4
    la r la

    %45
    sol2 la4
    mi2 fad4
    mi fad sol

    %48
    fad2 r4
    R2.*3
    r4 r

}

VIIvlIn =  \relative do'' {

    la4
    re4. dod8 re4
    mi la, la'
    fad4. mi8 fad4

    %4
    mi2 r4
    R2.*3
    r4 r la,

    %9
    re8.[(mi16) re8.(mi16) re8.(mi16)]
    re4 r si
    mi8.[(fad16) mi8.(fad16) mi8.(fad16)]

    %12
    mi4. re8[mi8.(fad16)]
    sol4. la8 fad4
    mi sol8(fad) mi(re)\mbreak

    %15
    mi4 la, dod
    re2 r4
    R2.*3

    %20
    r4 r si
    lad fad lad
    si si, fad''

    %23
    fad4. mi8 fad4
    re si re
    dod dod dod

    %26
    si si si
    la la la
    do do do

    %29
    sib sib sib
    la la la
    do do do

    %32
    mi mi mi\mbreak
    do do do
    si2 si4

    %35
    si do si
    sold2 mi'4
    si4. dod!8 re4

    %38
    dod la r
    R2.
    r4 r dod

    %41
    re8.[(mi16) re8.(mi16) re8.(mi16)]
    re8.[(dod16) si8.(dod16) re8.(si16)]
    mi8.[(fad16) mi8.(fad16) mi8.(fad16)]\mbreak

    %44
    mi8.[(re16) dod8.(re16) mi8.(fad16)]
    sol4. la8 fad4
    mi sol8(fad) mi(re)

    %47
    mi4 la, dod
    re fad,8(mi) fad(re)
    sol4. la8 fad4

    %50
    mi sol8(fad) mi(re)
    mi4 la, dod
    re2\fermopz

}

VIIvlIIn =  \relative do'' {

    fad,4
    la2 la4
    dod2 dod4
    re4. dod8 re4

    %4
    dod2 r4
    R2.*3
    r4 r la

    %9
    la fad la
    si r si
    si sold si

    %12
    dod r dod
    re2 dod4
    si2 la4

    %15
    si la la\mbreak
    la2 r4
    R2.*3

    %20
    r4 r r
    R2.
    r4 r re

    %23
    dod lad dod
    si fad si
    la la la

    %26
    sol sol sol
    fa fa fa
    la la la

    %29
    fa fa fa\mbreak
    fa fa fa
    la la la

    %32
    sib sib sib
    la la la
    fad2 si?4

    %35
    sol la fad
    mi2 la4
    la la sold

    %38
    la mi r
    R2.
    r4 r la\mbreak

    %41
    la fad la
    si r si
    si sold si

    %44
    dod r dod
    re2 dod4
    si2 la4

    %47
    si la la
    la2 re,4
    re2 dod4

    %50
    si2 si4
    si la la
    la2\fermopz

}

VIIvlan = \relative do' {

    re4
    re2 la'4
    la2 la4
    la2 la4

    %4
    la2 r4
    R2.*3
    r4 r mi

    %9
    re2 re4
    sol r sol\mbreak
    mi2 mi4

    %12
    la r la
    sol2 la4
    mi2 fad4

    %15
    mi fad sol
    fad2 r4
    R2.*3

    %20
    r4 r r
    R2.
    r4 r fad

    %23
    fad2 fad4
    fad re si'\mbreak
    la la la

    %26
    sol sol sol
    fa r r
    fa fa fa

    %29
    fa r r
    fa r r
    fa fa fa

    %32
    fa fa fa
    fa fa fa
    red2 mi4\mbreak

    %35
    mi la, si
    mi2 mi4
    fad! mi mi

    %38
    mi dod r
    R2.
    r4 r mi

    %41
    re2 re4
    sol r sol
    mi2 mi4

    %44
    la r la\mbreak
    sol2 la4
    mi2 fad4

    %47
    mi fad sol
    fad2 la,4
    sol2 la4

    %50
    mi2 fad4
    mi fad sol
    fad2\fermopz

}

VIIbcn = \relative do {

    re4
    fad mi re
    la' dod la
    re fad, re

    %4
    la la' sol
    fad mi re
    la' dod la

    %7
    re fad, re\mbreak
    la' la, la'
    fad re fad

    %10
    sol r si
    sold mi sold
    la r la

    %13
    si2 la4
    sol2 fad4
    sol la la,

    %16
    re2 re4
    si2 la4
    sol2 fad4\mbreak

    %19
    sol la2
    re, r4
    R2.

    %22
    r4 r si''
    lad fad lad
    si2 r4

    %25
    R2.*9
    red,2 r4
    R2.

    %36
    re!2 dod4\mbreak
    re mi mi,
    la dod la

    %39
    re mi mi,
    la2 la'4
    fad re fad

    %42
    sol r si
    sold mi sold
    la r la

    %45
    si2 la4
    sol2 fad4\mbreak
    sol la la,

    %48
    re2 re4
    si2 la4
    sol2 fad4

    %51
    sol la2
    re,\fermata

}

VIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\major
  \time 3/4
  \tempo 2 = 40
  \partial 4 s4
  s2.*19
  s2
  \bar ":..:"\break
  s4
  s2.*31
  s2
  \bar ":|."

}

VIIobI = {
  \VIIglobal
  \notypeset
  <<\VIIobIn \forma>>

}

VIIobII = {
  \VIIglobal
  <<\VIIobIIn \forma>>

}

VIIobIII = {
  \VIIglobal
  <<\VIIobIIIn \forma>>

}

VIIvlI = {
  \VIIglobal
  <<\VIIvlIn \forma>>

}

VIIvlII = {
  \VIIglobal
  <<\VIIvlIIn \forma>>

}

VIIvla = {
  \VIIglobal
  \clef alto
  <<\VIIvlan \forma>>

}

VIIbc = {
  \VIIglobal
  \clef bass
  <<\VIIbcn \forma \VIIbfn>>
  \typeset

}

VIIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \senza
}

VIIIobIn = \relative do'' {

    fad8(sol) la(si)
    mi,4. sol8 fad(mi) re(dod)
    re4 la re8(fad) mi(fad)
    sol4.(la16 si) la8(sol) fad(mi)

    %4
    fad(mi) re(mi) fad(sol) la(si)
    mi,4. sol8 fad(mi) re(dod)
    re4 la re8(fad) mi(fad)\mbreak

    %7
    sol(mi) fad(sol) mi4. re8
    re2 re_\markup\italic "fin" re8(dod) re(si)
    dod(re) dod(si) lad(sold) lad(fad)

    %10
    si(dod) re(dod) si(la) sold(mi)
    la(sold) la(fad) sold(mi) fad(red)
    mi2 r

    %13
    R1*3
    la8(sol) fad(mi) re4 r
    la'8(si) dod(si) la4 r

    %18
    re la re8(fad) mi(fad)\mbreak
    sol4.(la16 si) la8(sol) fad(mi)
    fad(mi) re(mi) fad(sol) la(si)

    %21
    mi,4. sol8 fad(mi) re(dod)
    re4 la\mbreak re8(fad) mi(fad)
    sol(mi) fad(sol) mi4. re8

    %24
    re2 re4 re
    re4. mi8 do(re) si(do)
    si4. si8 mi(red) mi(fad)

    %27
    red4 mi8 fad fad4. mi8\mbreak
    mi2 sol4 sol
    sol8(fad) mi(fad) sol(la) fad(sol)

    %30
    fad(mi) re(mi) fad4 fad
    fad si8(la) sol(fad) mi(re)
    dod si la4

}

VIIIobIIn = \relative do'' {

    re4 re
    dod4. re8 dod4 dod
    si fad si si
    si4. si8 mi4 mi

    %4
    re la re re
    dod4. re8 dod4 dod
    si fad si si

    %7
    si8 (la) re4 dod4. la8\mbreak
    la2 la re8(dod) re(si)
    dod(re) dod(si) lad(sold) lad(fad)

    %10
    si(dod) re(dod) si(la) sold(mi)
    la(sold) la(fad) sold(mi) fad(red)
    mi2 r

    %13
    R1*3\mbreak
    r2 re8(mi) fad(sol)
    la4 r la8(sol) fad(la)

    %18
    si4 fad si si
    si4. si8 mi4 mi
    re la re re\mbreak

    %21
    dod4. re8 dod4 dod
    si fad si si
    si8(la) re4 dod4. la8

    %24
    la2\mbreak la4 la
    sol4. sol8 la4 la
    sol4. sol8 si4 si

    %27
    si mi red4. mi8
    mi2 mi4 mi
    mi8(re) dod(re) mi(fad) re(mi)

    %30
    re4 la re re
    re sol re si
    la2

}

VIIIobIIIn = \relative do'' {

    la4 la
    la4. si8 fad4 la
    fad re fad si
    sol4. sol8 mi4 la

    %4
    la fad la la
    la4. si8 fad4 la\mbreak
    fad re fad si

    %7
    sol8(la) la4 la4. la8
    fad2 fad re'4 re
    dod r lad lad

    %10
    si r si sold
    la r sold fad\mbreak
    mi2 r

    %13
    R1*5
    fad4 re fad si
    sol4. sol8 mi4 la

    %20
    la fad la la
    la4. si8 fad4 la
    fad re fad si

    %23
    sol8(la) la4 la4. la8\mbreak
    fad2 fad4 re
    mi r fad fad

    %26
    sol2 sol4 si
    si si si4. si8
    si2 si4 si

    %29
    dod8(re) mi(re) dod4. dod8
    la4 fad la la
    si re8(dod) si(la) sol(fad)

    %32
    mi2



}

VIIIvlIn =  \relative do'' {

    fad8(sol) la(si)
    mi,4. sol8 fad(mi) re(dod)
    re4 la re8(fad) mi(fad)
    sol4.(la16 si) la8(sol) fad(mi)

    %4
    fad(mi) re(mi) fad(sol) la(si)
    mi,4. sol8 fad(mi) re(dod)
    re4 la re8(fad) mi(fad)\mbreak

    %7
    sol(mi) fad(sol) mi4. re8
    re2 re fad8(mi) fad(sol)
    mi4. re8 mi(fad) fad(mi)

    %10
    re(dod) si(dod) re4. mi8
    dod4. re8 si(dod) la(si)
    sold(si) la(si) dod(re) mi(fad)

    %13
    si,4. re8 dod(si) la(sold)
    la4 mi\mbreak la8(dod) si(dod)
    re(si) dod(re) si4. la8

    %16
    la2 fad'8(sol) la(si)
    mi,4. sol8 fad(mi) re(dod)
    re4 la re8(fad) mi(fad)

    %19
    sol4.(la16 si) la8(sol) fad(mi)
    fad(mi) re(mi) fad(sol) la(si)
    mi,4. sol8 fad(mi) re(dod)

    %22
    re4 la\mbreak re8(fad) mi(fad)
    sol(mi) fad(sol) mi4. re8
    re(la) fad(la) re,(mi) fad(re)

    %25
    mi(fad) sol(mi) fad(mi) fad(re)
    sol(la) sol(fad) mi(fad) sol(la)
    si(la) sol(la) si(la) si(si,)

    %28
    mi2 r
    R1*3
    r2

}

VIIIvlIIn =  \relative do'' {

    re4 re
    dod4. re8 dod4 dod
    si fad si si
    si4. si8 mi4 mi

    %4
    re la re re
    dod4. re8 dod4 dod
    si fad si si

    %7
    si8 \parentSlur (la) re4 dod4. la8\mbreak
    la2 la r
    R1*3

    %12
    r2 la,8 si dod re
    mi4 r mi8(re) dod(mi)
    fad4 dod fad fad

    %15
    fad8 (mi) la4 sold4. mi8
    mi2 r
    R1

    %18
    si'4 fad si si
    si4. si8 mi4 mi
    re la re re\mbreak

    %21
    dod4. re8 dod4 dod
    si fad si si
    si8(la) re4 dod4. la8

    %24
    la2 re,8(mi) fad(re)
    mi(fad) sol(mi) fad(mi) fad(re)
    sol(la) sol8(fad) mi(fad) sol(la)

    %27
    si(la) sol(la) si(la) si(si,)
    mi2 r
    R1*3

    %32
    r2

}

VIIIvlan = \relative do' {

    la'4 la
    la4. si8 fad4 la
    fad re fad si
    sol4. sol8 mi4 la

    %4
    la fad la la
    la4. si8 fad4 la\mbreak
    fad re fad si

    %7
    sol8(la) la4 la4. la8
    fad2 fad r
    R1*3

    %12
    mi8(re) dod(si) la4 r
    mi'8(fad) sold(fad) mi4 r\mbreak
    dod la dod fad

    %15
    re8 \parentSlur (mi) mi4 mi4. mi8
    dod2 r
    R1

    %18
    fad4 re fad si
    sol4. sol8 mi4 la
    la fad la la

    %21
    la4. si8\mbreak fad4 la
    fad re fad si
    sol8(la) la4 la4. la8

    %24
    fad2 re4 re
    mi r fad fad
    sol r mi sol

    %27
    si sol8 la si4 si,
    mi2 r
    R1*3

    %32
    r2

}

VIIIbcn = \relative do {

    re8(mi) fad(sol)
    la(si) dod(si) la(sol) fad(la)
    si(dod) re(dod) si(la) sol(fad)
    mi(fad) mi(re) dod(si) dod(la)

    %4
    re4 re, re'8(mi) fad(sol)
    la(si) dod(si) la(sol) fad(la)
    si(dod) re(dod) si(la) sol(fad)

    %7
    mi(dod) re(sol) la(sol) la(la,)
    re, la' si dod re,2_\markup\italic "fin" r
    R1*5

    %14
    fad'8(sold) la(sold) fad(mi) re(dod)
    si(sold) la(re)\mbreak mi(re) mi(mi,)
    la2 r

    %17
    R1
    si'8(dod) re(dod) si(la) sol(fad)
    mi(fad) mi(re) dod(si) dod(la)

    %20
    re4 re, re'8(mi) fad(sol)
    la(si) dod(si) la(sol) fad(la)
    si(dod) re\parentSlur (dod) si(la) sol(fad)

    %23
    mi(dod) re(sol) la(sol) la(la,)
    re,2 r
    R1*3

    %28
    mi'8(fad) sol(fad) mi(re) dod(si)
    la2 r
    re8(mi) fad(mi) re(dod) si(la)\mbreak

    %31
    sol2 r
    la'8(sol) fad(mi)

}

VIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key re\major
    \time 2/2
    \tempo 1 = 43
    \repeat volta 2{
        \partial 2 s2
        s1*7
    }
    \alternative {{\set Score.measureLength = #(ly:make-moment 2 4) s2}{\set Score.measureLength = #(ly:make-moment 4 4) s\fermata}} \break
    \bar"||"
    s\set Score.currentBarNumber = #9
    s1*23
    s2
    \bar "||"
    \mark\markup\smaller "D.C."

}

VIIIobI = {
    \VIIIglobal
    \notypeset
    <<\VIIIobIn \forma>>

}

VIIIobII = {
    \VIIIglobal
    <<\VIIIobIIn \forma>>

}

VIIIobIII = {
    \VIIIglobal
    <<\VIIIobIIIn \forma>>

}

VIIIvlI = {
    \VIIIglobal
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    \VIIIglobal
    <<\VIIIvlIIn \forma>>

}

VIIIvla = {
    \VIIIglobal
    \clef alto
    <<\VIIIvlan \forma>>

}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
    \typeset

}

IXglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \con\terzinequarto
}

IXobIn = \relative do'' {

    re8 fad la la16 sol fad mi
    fad8 re r4 r
    r8 re [fad la] la8.\tr sol32 la
    si8 [si, mi sol] sol8.\tr fad32 sol

    %4
    la8 [la, re fad ]fad8.\tr mi32 fad
    sol8 si sol mi sol16 fad mi re\mbreak
    dod8 la r4 r

    %7
    r8 la dod mi mi16 re dod si
    dod8 la r4 r
    R2.*3

    %12
    r8 mi' mi mi mi mi
    mi re re re re re
    re dod dod dod dod dod

    %15
    dod si si si si si
    si8 si \tuplet 3/2 { dod(re si) dod[(re si)] }
    dod8 dod \tuplet 3/2 { re(mi dod) re[(mi dod)]}\mbreak

    %18
    re2.~
    re8 re \tuplet 3/2 { re(mi dod) re[(mi dod)] }
    re4. si8 mi16 re dod si

    %21
    dod8 la' la si mi, sold
    la la, dod mi sol16 fad sol mi
    fad8 re r4 r

    %24
    r8 la dod mi sol16 fad sol mi
    fad8 re fad la si16 la sol fad
    sol4 r8 mi mi re

    %27
    dod4 r8 re re do\mbreak
    si4 r8 do do si
    la4 r8 fad'16 sol la sol la fad

    %30
    si8 si, r mi16 fad sol fad sol mi
    la8 sol16 fad sol8 la fad4
    mi8 si re4 r8 mi,

    %33
    sold4 r8 fad' mi re
    dod4 r8 dod mi4
    r8 mi sol4 r

    %36
    r8 re fad la la16 sol fad mi
    fad8 re r4 r\mbreak
    r8 re [fad la] la8.\tr sol32 la

    %39
    si8 [si, mi sol] sol8.\tr fad32 sol
    la8 [la, re fad] fad8.\tr mi32 fad
    sol8 si8 sol mi sol16 fad mi re

    %42
    dod8 la' la la la la
    la sol sol sol sol sol
    sol fad fad fad fad fad\mbreak

    %45
    fad mi mi mi mi mi
    mi4 r r
    fad r r\mbreak

    %48
    r8 la, dod mi mi16 re dod si
    dod8 la r4 r
    r8 la dod mi la16 sol fad mi

    %51
    fad8 re re mi la, dod
    re

}

IXobIIn = \relative do'' {

    la8 re fad mi dod
    re la r4 r
    r8 la re fad fad4\tr
    sol8 sol, si mi  mi4\tr

    %4
    fad8 fad, la re re4\tr
    mi8 sol mi si mi si
    la4 r r\mbreak

    %7
    r8 mi la dod si sold
    la mi r4 r
    R2.*3

    %12
    r4 r8 sold la si
    dod4 r8 fad, sold la
    si4 r8 mi, fad sold

    %15
    la4 r8 re, mi fad
    sold sold \tuplet 3/2 { la(si sold) la[(si sold)] }\mbreak
    la8 la \tuplet 3/2 { si(dod la) si[(dod la)] }

    %18
    si2.~
    si8 si \tuplet 3/2 { si(dod la) si[(dod la)] }
    si4. sold8 si sold

    %21
    la dod dod re si si
    dod mi, la dod mi16 re mi dod
    re4 r r\mbreak  %%% OK

    %24
    r8 mi, la dod mi16 re mi dod
    re8 la re fad fad red
    mi4 r r

    %27
    R2.*2
    do4 r8 do do do
    si4 r8 si mi mi

    %31
    mi red mi mi fad red
    si4 r r
    R2.*3\mbreak

    %36
    r8 la re fad mi dod
    re la r4 r
    r8 la re fad fad4\tr

    %39
    sol8 sol, si mi  mi4\tr
    fad8 fad, la re re4\tr
    mi8 sol mi si mi si

    %42
    la4 r8 dod re mi
    fad4 r8 si, dod re\mbreak
    mi4 r8 la, si dod

    %45
    re4 r8 sol, la si
    dod4 r r
    re r r

    %48
    r8 la dod mi mi16 re dod si
    dod8 la r4 r
    r la8 dod mi dod

    %51
    re la la si la la
    la

}

IXobIIIn = \relative do'' {

    fad,8 la re la la
    la fad r4 r
    r8 fad la re re4\tr
    re8 re, sol do do4\tr \mbreak

    %4
    la8 re, fad si si4\tr
    si8 mi si sol si16 la sol fad
    mi4 r r

    %7
    r8 mi mi mi mi mi
    mi4 r r
    R2.*3

    %12
    r4 r8 dod' la sold
    fad4 r8 si sold fad\mbreak
    mi4 r8 la fad mi

    %15
    re4 r8 si' sold fad
    mi4 r r
    mi r r

    %18
    sold2.~
    sold4 r r
    sold4. mi8 sold mi

    %21
    mi4 r8 re mi mi\mbreak
    mi mi mi la la la
    la4 r r

    %24
    r8 mi mi la la la
    la fad la re si si
    si4 r r

    %27
    R2.*2
    la4 r8 fad fad fad\mbreak
    fad4 r8 mi mi si'

    %31
    la si si do si si
    sold4 r r
    R2.*3

    %36
    r8 fad la re la la
    la fad r4 r
    r8 fad la re re4\tr \mbreak

    %39
    re8 re, sol do do4\tr
    la8 re, fad si si4\tr
    si8 mi si sol si16 la sol fad

    %42
    mi4 r8 la fad mi
    mi4 r8 si' mi re
    dod4 r8 fad re dod\mbreak

    %45
    si4 r8 mi dod si
    la4 r r
    la r r

    %48
    r8 la dod mi mi16 re dod si
    dod8 la r4 r
    r r8 la dod la

    %51
    la4 r8 sol fad mi\mbreak
    fad

}

IXvlIn =  \relative do'' {

    r8 r4 r
    r8 re fad la la16 sol fad mi
    fad8 re r4 r
    R2.*3

    %6
    r8 la dod mi mi16 re dod si
    dod8 la r4 r
    r8 la [dod mi ]mi8.\tr re32 mi

    %9
    fad8 fad, si re re8.^\markup \center-align{\italic\bold [tr]} dod32 re
    mi8 mi, la[dod] dod8.^\markup \center-align{\italic\bold [tr]} si32 dod\mbreak
    re8 fad re si re16 dod si la

    %12
    sold8 mi' mi mi mi mi
    mi re re re re re
    re dod dod dod dod dod

    %15
    dod si si si si si
    si4 r r
    dod r r

    %18
    r8 mi, sold si si16 la sold fad
    sold8 mi r4 r\mbreak
    r8 mi sold si mi16 re dod si

    %21
    dod8 la' la si mi, sold
    la r r4 r
    r8 re,, fad la re16 dod re si

    %24
    dod4 r r
    R2.
    r8 si' si16 do si8 si16 do si8

    %27
    si mi, la16 si la8 la16 si la8
    la re, sol16 la sol8\mbreak sol16 la sol8
    sol fad16 mi fad sol fad sol la sol la fad

    %30
    si si, dod red mi fad mi fad sol fad sol mi
    la8 sol16 fad sol8 la fad4
    mi r8 sold, si4

    %33
    r8 si re4 r
    r8 mi sol!4 r8 la,
    dod4 r8 si' la sol

    %36
    fad4 r r\mbreak
    r8 re fad la la16 sol fad mi
    fad8 re r la' la8. ^\markup \center-align{\italic\bold [tr]}sol32 la

    %39
    si4 r8 sol sol8. ^\markup \center-align{\italic\bold [tr]} fad32 sol
    la4 r8 fad fad8.^\markup \center-align{\italic\bold [tr]} mi32 fad
    sol4 r8 mi sol16 fad mi re

    %42
    dod8 la' la la la la
    la sol sol sol sol sol
    sol fad fad fad fad fad\mbreak

    %45
    fad mi mi mi mi mi
    mi mi \tuplet 3/2 { fad8(sol mi) fad[(sol mi)] }
    fad fad \tuplet 3/2 { sol(la fad) sol[(la fad)] }

    %48
    sol2.~
    sol8 sol \tuplet 3/2 { sol(la fad) sol[(la fad)] }
    sol4. mi8 la16 sol fad mi

    %51
    fad8 re re mi la, dod
    re

}

IXvlIIn =  \relative do'' {

    r8 r4 r
    r8 la re fad mi dod
    re la r4 r
    R2.*3

    %6
    r8 mi la dod si sold
    la mi r4 r
    r8 mi la dod dod4\tr

    %9
    re8 re, fad si si4\tr \mbreak
    dod8 dod, mi la  la4\tr
    si8 re si fad si fad

    %12
    mi mi fad sold la si
    dod re, mi fad sold la
    si dod, re mi fad sold

    %15
    la si, dod re mi fad
    sold4 r r
    la r r

    %18
    r8 mi sold si si16 la sold fad\mbreak
    sold8 mi r4 r
    r mi8 sold si sold

    %21
    la dod dod re si si
    dod r r4 r
    r8 la, re fad la la

    %24
    la4 r r
    R2.
    r4 r8 sol' sol fad

    %27
    mi4 r8 fad fad mi\mbreak
    re4 r8 mi mi re
    do4 r8 do do do

    %30
    si4 r8 si mi mi
    mi red mi mi \parenthesize fad red
    si2.~

    %33
    si
    dod~
    dod

    %36
    la4 r r
    r8 la re fad mi dod\mbreak
    re4 r8 fad fad8.^\markup \center-align{\italic\bold [tr]} mi32 fad

    %39
    sol4 r8 mi mi8.^\markup \center-align{\italic\bold [tr]} re32 mi
    fad4 r8 re re8. ^\markup \center-align{\italic\bold [tr]}dod32 re
    mi4 r8 si mi si

    %42
    la la si dod re mi
    fad sol, la si dod re
    mi fad, sol la si dod\mbreak

    %45
    re mi, fad sol la si
    dod8 dod \tuplet 3/2 { re(mi dod) re[(mi dod)] }
    re8 re \tuplet 3/2 { mi(fad re) mi[(fad re)] }

    %48
    mi2.~
    mi8 mi \tuplet 3/2 { mi(fad re) mi[(fad re)] }
    mi4. dod8 mi dod\mbreak

    %51
    re la la la la la
    la

}

IXvlan = \relative do' {

    r8 r4 r
    r8 fad la re la la
    la fad r4 r
    R2.*3

    %6
    r8 dod mi la mi mi
    mi dod r4 r\mbreak
    r8 dod mi la la4^\markup \center-align{\italic\bold [tr]}
    la8 la, re sol sol4^\markup \center-align{\italic\bold [tr]}

    %10
    mi8 la, dod fad fad4^\markup \center-align{\italic\bold [tr]}
    fad8 si fad re fad16 mi re dod
    si4 r8 dod' la sold

    %13
    fad4 r8 si sold fad
    mi4 r8 la fad mi\mbreak
    re4 r8 si' sold fad

    %16
    mi4 r r
    mi r r
    r8 mi sold si si16 la sold fad

    %19
    sold8 mi r4 r
    r r8 mi sold mi
    mi4 r8 re mi mi

    %22
    mi\mbreak r r4 r
    r8 fad, la re fad4
    mi r r
    R2.

    %26
    r8 mi mi mi' mi re
    dod dod dod re re do
    si si si do do si

    %29
    la4 r8 fad fad fad\mbreak
    fad4 r8 mi mi si'
    la si si do si si

    %32
    sold2.~
    sold
    mi~

    %35
    mi
    re4 r r
    r8 fad la re la la

    %38
    la fad r re' re4\mbreak
    re r8 do do4
    la r8 si si4

    %41
    si r8 sol si16 la sol fad
    mi4 r8 la fad mi
    re4 r8 si' mi re

    %44
    dod4 r8 la re dod\mbreak
    si4 r8 mi dod si
    la4 r r

    %47
    la r r
    dod2.~
    dod4 r r

    %50
    dod r8 la dod la
    la4 r8 sol fad mi
    fad

}

IXbcn = \relative do {

    re'8 re, re' dod la
    re, re' re, re' dod la
    re,4 r8 re' re16 do si la
    sol4 r8 do do16 si la sol\mbreak

    %4
    fad4 r8 si si16 la sol fad
    mi4 r8 mi mi, mi'
    la, la' la, la' sold mi

    %7
    la, la' la, la' sold mi
    la,4 r8 la' la16 sol fad mi
    re4 r8 sol sol16 fad mi re

    %10
    dod!4 r8 fad fad16 mi re dod\mbreak
    si4 r8 si' si, si'
    mi, dod re mi fad sold

    %13
    la si, dod re mi fad
    sold la, si dod re mi
    fad sold, la si dod re

    %16
    mi4 r r
    mi r r
    mi r r

    %19
    mi r r\mbreak
    mi r r
    mi r r8 mi

    %22
    la, la' la, la' dod la
    re re, re, re' fad re
    la la' la, la' dod la

    %25
    re re, re, re' red si
    mi4 r r
    R2.*2\mbreak

    %29
    la4 r8 la la, la'
    sol4 r8 sol sol, sol'
    fad si mi la, si si,

    %32
    mi2.~
    mi
    la,~

    %35
    la
    re8 re' re, re' dod la
    re, re' re, re' dod la

    %38
    re,4 r8 re' re16 do si la
    sol4 r8 do do16 si la sol
    fad4 r8 si si16 la sol fad

    %41
    mi4 r8 mi mi, mi'
    la, fad' sol la si dod
    re mi, fad sol la si

    %44
    dod re, mi fad sol la\mbreak
    si dod, re mi fad sol
    la4 r r

    %47
    la r r
    la r r
    la r r

    %50
    la r r
    la r r8 la,
    re,

}

IXbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\major
  \time 3/4
  \tempo 2. = 55
  \partial 8*5 s4 s4.
  s2.*21
  s8
  \bar ":..:"\break
  s4 s4.
  s2.*29
  s8
  \bar":|."

}

IXobI = {
  \IXglobal
  %\notypeset
  <<\IXobIn \forma>>

}

IXobII = {
  \IXglobal
  <<\IXobIIn \forma>>

}

IXobIII = {
  \IXglobal
  <<\IXobIIIn \forma>>

}

IXvlI = {
  \IXglobal
  <<\IXvlIn \forma>>

}

IXvlII = {
  \IXglobal
  <<\IXvlIIn \forma>>

}

IXvla = {
  \IXglobal
  \clef alto
  <<\IXvlan \forma>>

}

IXbc = {
  \IXglobal
  \clef bass
  <<\IXbcn \forma \IXbfn>>
  \typeset

}
#(set-global-staff-size 15.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }


    \markup\huge\bold\fill-line {"Ouverture à 3 Hautbois [TWV 55:D15]"}
    \markup \left-align\column{"  ""                                                                                                                                                                          G. Ph. Telemann (1681-1767)"}

    \markup\huge "[1.] Ouverture"


    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName =  \markup \center-column{"Hautbois 1."}
                    \set Staff.midiInstrument = #"oboe"
                    \IobI
                >>

                \new Staff <<
                    \set Staff.instrumentName =  \markup \center-column{"Hautbois 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \IobII
                >>

                \new Staff <<
                    \set Staff.instrumentName =  \markup \center-column{"Hautbois 3."}
                    \set Staff.midiInstrument = #"oboe"
                    \IobIII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Premier""Dessus"}
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Second""Dessus"}
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Taille"}
                \Ivla
            >>
            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"Violone""[Basso]"}
                \Ibc

            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \markup\huge "[2.] Prelude - Tres vite"


    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIobII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIobIII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>
            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = #"contrabass"
                \IIbc

            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \markup\huge "[3.] Gigue"


    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobIII
                >>
            >>

            \new PianoStaff <<

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
            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc

            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \markup\huge "[4.] Menuet 1. alternativement"


    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IVobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IVobII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IVobIII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IVvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IVvla
            >>
            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = #"contrabass"
                \IVbc

            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

}


\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[5.] Menuet 2"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName =  \markup \center-column{"Hautbois 1."}
                    \set Staff.midiInstrument = #"oboe"
                    \VobI
                >>

                \new Staff <<
                    \set Staff.instrumentName =  \markup \center-column{"Hautbois 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \VobII
                >>

                \new Staff <<
                    \set Staff.instrumentName =  \markup \center-column{"Hautbois 3."}
                    \set Staff.midiInstrument = #"oboe"
                    \VobIII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Premier""Dessus"}
                    \VvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Second""Dessus"}
                    \VvlII
                >>
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge "[6.] Harlequinade"


    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \VIobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \VIobII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \VIobIII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \VIvla
            >>
            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = #"contrabass"
                \VIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \markup\huge "[7.] Loure"


    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \VIIobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \VIIobII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \VIIobIII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \VIIvla
            >>
            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = #"contrabass"
                \VIIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \markup\huge "[8.] Rondeau"


    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \VIIIobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \VIIIobII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \VIIIobIII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VIIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VIIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \VIIIvla
            >>
            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = #"contrabass"
                \VIIIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \markup\huge "[9.] Rejouissance"


    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        }<<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IXobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IXobII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IXobIII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IXvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IXvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IXvla
            >>
            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            } <<
                \set Staff.midiInstrument = #"contrabass"
                \IXbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

}
