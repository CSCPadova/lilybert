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

su = \change Staff = up

giu = \change Staff = down

tasto = ^\markup\italic"tasto solo"

tr = \trill

ten = ^\markup \italic "ten"

dolce = _\markup\italic "dolce"

arco = _\markup \italic "Con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "Pizzicato"

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



mbreak = { }


global = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f

}

vlIn = \relative do'' {

    si'4 si si r16 do si do
    si4 r16 do si do si do si do si do si do
    si4\tr r16 si32 do re16 re si sol re sol si si32 do re16 re

    %4
    si sol re sol si si32 do re16 re si4\tr r16 si32 do re16 re
    mi, mi32 fad sol16 sol la la32 si do16 do re, re32 mi fad16 fad sol sol32 la si16 si
    do, do32 re mi16 mi fad fad32 sol la16 la si do si do si do si do

    %7
    si2\tr \mbreak r
    R1*6
    r2 r4 r16 si32 do re16 re

    %15
    si sol re sol si si32 do re16 re si sol re sol si si32 do re16 re
    si2\tr r
    R1

    %18
    r4 r16 si32 do re16 re\mbreak si sol re sol si si32 do re16 re
    si sol re sol si si32 do re16 re si2\tr
    R1*4

    %24
    la32 re la re la[re la re] la re la re la[re la re] la re la re la[re la re] la re la re la[re la re]
    si re si re si[re si re] si re si re si[re si re] la re la re la[re la re] la re la re la[re la re]
    si re si re si[re si re] si re si re si[re si re] la re la re la[re la re] la re la re la[re la re]\mbreak

    %27
    si re si re si[re si re] si re si re si[re si re] mi, sol mi sol mi[sol mi sol] mi sol mi sol mi[sol mi sol]
    la do la do la[do la do] la do la do la[do la do] re, fad re fad re[fad re fad] re fad re fad re[fad re fad]
    sol si sol si sol[si sol si] sol si sol si sol[si sol si] do, mi do mi do[mi do mi] do mi do mi do[mi do mi]

    %30
    fad la fad la fad[la fad la] fad la fad la fad[la fad la]\mbreak si4 r
    R1*5
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    R4.*3

    %40
    si8. do16 si8
    mi(re) do
    do4\tr si8

    %43
    R4.*6
    mi,8. fad16 mi8
    mi' re4

    %51
    do16 re mi do la8
    re,8. mi16 re8\mbreak
    re' do4

    %54
    si16 do re si sol8
    R4.*6
    si8 si16 dod red mi

    %62
    mi, fad sol la si8
    si si16 dod red mi
    mi, fad sol la si8

    %65
    si dod16 red mi8
    mi, sol(fad\tr)
    mi4 r8

    %68
    R4.*2

}

vlIIn = \relative do'' {

    sol'4 sol sol r16 la sol la
    sol4 r16 la sol la sol la sol la sol la sol la
    sol4\tr r16 sol32 la si16 si sol re si re sol sol32 la si16 si

    %4
    sol re si re sol sol32 la si16 si sol4\tr r16 sol32 la si16 si
    do, do32 re mi16 mi fad fad32 sol la16 la  si, si32 do re16 re mi mi32 fad sol16 sol
    la, la32 si do16 do re re32 mi fad16 fad sol la sol la sol la sol la

    %7
    sol2\tr \mbreak r
    R1*6
    r2 r4 r16 sol32 la si16 si

    %15
    sol re si re sol sol32 la si16 si sol re si re sol sol32 la si16 si
    sol2\tr r
    R1

    %18
    r4 r16 sol32 la si16 si\mbreak sol re si re sol sol32 la si16 si
    sol re si re sol sol32 la si16 si sol2\tr
    R1*4

    %24
    fad32 la fad la fad[la fad la] fad la fad la fad[la fad la] fad la fad la fad[la fad la] fad la fad la fad[la fad la]
    sol si sol si sol[si sol si] sol si sol si sol[si sol si] fad la fad la fad[la fad la] fad la fad la fad[la fad la]
    sol si sol si sol[si sol si] sol si sol si sol[si sol si] fad la fad la fad[la fad la] fad la fad la fad[la fad la]\mbreak

    %27
    sol si sol si sol[si sol si] sol si sol si sol[si sol si] do, mi do mi do [mi do mi] do mi do mi do [mi do mi]
    fad la fad la fad [la fad la] fad la fad la fad[la fad la] si, re si re si[re si re] si re si re si[re si re]
    mi sol mi sol mi[sol mi sol] mi sol mi sol mi[sol mi sol] la, do la do la[do la do] la do la do la[do la do]

    %30
    re fad re fad re[fad re fad] re fad re fad re[fad re fad]\mbreak sol4 r
    R1*5
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

    %37
    R4.*9
    si8. do16 si8
    mi(re) do

    %48
    do4\tr si8
    R4.*21

}

vlIIIn = \relative do'' {

    R1*9
    la'32 re la re la[re la re] la re la re la[re la re] si re si re si[re si re] si re si re si[re si re]
    la re la re la[re la re] la re la re la[re la re] si16 sol sol sol sol sol fad fad

    %12
    sol si, si si la la la la\mbreak si4 r
    R1*6
    r2 r4 re8 re

    %20
    mi mi mi mi mi re re re
    mi mi mi mi mi re mi[mi]
    mi mi re[re] mi la, la la

    %23
    la4 r8 dod\mbreak re4 r
    R1*10
    r2 si'32 re si re si[re si re] si re si re si[re si re]

    %35
    la re la re la[re la re] la re la re la[re la re] si16 sol sol sol sol sol fad fad\mbreak
    sol4\fermata r r2
    mi,4.

    %38
    mi16 fad sol8 la
    red,4 mi8
    R4.*3

    %43
    mi4.
    mi16 fad sol8 la
    red,4 mi8

    %46
    R4.*3
    sold4.
    sold?8 mi4

    %51
    la4 la,8
    fad'4.\mbreak
    fad8 re4

    %54
    sol sol,8
    R4.*6
    mi'4 r8

    %62
    mi4 r8
    mi4 r8
    mi4 r8

    %65
    mi4 sol,8
    la si4
    mi r8

    %68
    R4.*2

}

vlIVn = \relative do'' {

    R1*9
    fad32 la fad la fad[la fad la] fad la fad la fad[la fad la] sol si sol si sol[si sol si] sol si sol si sol[si sol si]
    fad la fad la fad[la fad la] fad la fad la fad[la fad la] sol16 si, si si la la la la

    %12
    si sol sol sol sol sol fad fad\mbreak sol4 r
    R1*6
    r2 r4 si8 si

    %20
    do do do do do si si si
    do do do do do si si[si]
    la la la[si]mi, mi mi mi

    %23
    fad4 r8 mi\mbreak fad4 r
    R1*10
    r2 sol'32 si sol si sol[si sol si] sol si sol si sol[si sol si]

    %35
    fad la fad la fad[la fad la] fad la fad la fad[la fad la] sol16 si, si si la la la la\mbreak
    si4\fermata r r2
    mi,4.

    %38
    mi16 fad sol8 la
    red,4 mi8
    R4.*3

    %43
    mi4.
    mi16 fad sol8 la
    red,4 mi8

    %46
    R4.*3
    sold4.
    sold?8 mi4

    %51
    la4 la,8
    fad'4.\mbreak
    fad8 re4

    %54
    sol sol,8
    R4.*6
    mi'4 r8

    %62
    mi4 r8
    mi4 r8
    mi4 r8

    %65
    mi4 sol,8
    la si4
    mi r8

    %68
    R4.*2

}

vlan = \relative do' {

    R1*9
    re'16 re re re re re re re re re re re re re re re
    re re re re re re re re re re, re re re re re re

    %12
    re re re re re re re re\mbreak re4 r
    R1*6
    r2 r4 sol8 sol

    %20
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol[sol]
    sol sol fad[sol] dod, dod dod dod

    %23
    re4 r8 la\mbreak re4 r
    R1*10
    r2 re'16 re re re re re re re

    %35
    re re re re re re re re re re, re re re re re re\mbreak
    re4\fermata r r2
    R4.*33

}

sopranon = \relative do'' {

    \autoBeamOff

    R1*11
    r2\mbreak r4 r8 sol16 la
    si8 la16 sol si8 do re8.[mi16 re mi re mi]

    %14
    re[mi re mi] re[do si la] sol[fad] sol4 r8
    R1
    r4 r8 sol16 la si8 la16 sol si8 do

    %17
    re8.[mi16 re mi re mi] re[mi re mi] re[do si la]
    sol[fad] sol4 r8\mbreak r2
    r r4 si8 la16[sol]

    %20
    do8 mi16 do do8 do do si si la16 sol
    do8 mi16 do do8 do do si r mi16 re
    dod[si] la8 re dod16 si la2~

    %23
    la16[re dod re]  fad,8[(mi\tr)]\mbreak re4 r
    r r8 la'16 re re8 fad,16 sol la[si] do[re]
    si[la] sol8 si16[do] re[si] la[sol] fad sol la[si] do[re]

    %26
    si[la] sol8 si16[do] re[si] la[sol] fad sol la[si] do[re]\mbreak
    si[sol si do] re[si do re] mi4~mi16[do si do]
    la[si sol la] fad[do' si do] re4~re16[si la si]

    %29
    sol[la fad sol] mi[si' la si] do4~do16[ la sol la]
    fad[sol mi fad] re[la' sol la]\mbreak si[do si do] si[do si do]
    si4\tr r sol16[la sol la] sol[la sol la]

    %32
    sol4 r sol16 [la si do] re8 sol,
    si4(la\tr) sol r
    R1*2

    %36
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    si8. do16 si8
    mi[re] do

    %39
    do4\tr si8
    R4.*3
    si8. do16 si8

    %44
    mi[re] do
    do4\tr si8
    R4.*3

    %49
    mi,8. fad16 mi8
    mi' re4
    do16[re mi do] la8

    %52
    re,8. mi16 re8\mbreak
    re'8 mi4
    si16[do re si] sol8

    %55
    si16 [do si do si do]
    si [do si do si do]
    si[la sol fad] mi8

    %58
    R4.*3
    si'8 si16 [dod] red [mi]
    mi, [fad sol la] si8

    %63
    si si16 [dod] red [mi]
    mi, [fad sol la] si8
    si dod16 [red mi8]

    %66
    mi, sol[(fad\tr)]
    mi4 r8
    R4.*2

}

testoI = \lyricmode {

    Zeffi - retti _ che sussur - ra - - - te ruscel - letti _ che mormo - ra - - - te

    conso - late_il _ mio _ desio _ _ dite _ al -- meno _ all' Idol _ mio _ la mia pena _ e la mia bra- - ma.

    Zeffi - retti _ che sussur - rate _ dite_al - meno _ all' Idol _ mio _ la mia pena _ e la mia bra- - - - - - - - - - - - - - - - ma

    e la mia bra -- ma.

    Ama _ ri -- sponde_il _ rio _ ama _ ri -- sponde_il _ vento _

    ama _ la Rondi - nel -- la ama _ la Pasto - rel -- la a - - ma la Pasto - rel -- la la Rondi - nel -- la la Pasto - rel -- la.

}

alton = \relative do' {

    \autoBeamOff

    R1*22
    r2 la'16 [re dod re] fad,8 [mi]
    re4 r r2

    %25
    R1*6
    si'16 [do si do] si [do si do] si4\tr r
    sol16 [la sol la] sol[la sol la] sol4\tr r

    %33
    r2 sol16[la si do] re8 sol,
    si4(la\tr) sol r
    R1

    %36
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    R4.*21
    si16[do si do si do]

    %59
    si[do si do si do]
    si[la sol fad] mi8
    R4.*6

    %67
    si'8 dod16[red mi8]
    mi, sol[(fad\tr)]
    mi4.

}

testoII = \lyricmode {

    a- - ma a - - - - ma a - ma a -- ma

    a - - ma la Pasto - rel -- la.

}

cembaloIn = \relative do {

    R1*6
    r2 \clef violin <<{si'''16 si si si si si  si do
          la la la la la la la si sol sol sol sol sol sol sol la

          %9
         fad la la si la la la si la la la si la la la si}\\{sol sol sol sol sol sol sol la
                                                             fad fad fad fad fad fad fad sol mi mi mi mi mi mi mi fad
                                                             re re re re re re re re re re re re re re re re}>>
          \clef tenor re,\tu re re re re re re re sol sol sol sol sol sol sol sol
          re re re re re re re re sol\clef bass sol, sol sol re re re re

          %12
          sol sol, sol sol re re re re\mbreak sol4 \clef violin r8  <<{si'''16^\markup\italic\right-align"Cembali Soli"[si]
                                                                          si si si si si si si si si si si si si si si si
                                                                          si si si si si si si si si si si si si4}\\{sol 16sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol
                                                                                                                     sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol4}>>

          %15
          R1
          r4 r8 <<{si16 si si si si si si si si si
                   si si si si si si si si si si si si si si si si

                   %18
                   si si si si si4}\\{sol16 sol sol sol sol sol sol sol sol sol
                                      sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol
                                      sol sol sol sol sol4}>> r2
          R1*5
          <<{la16 la la la la la la la la la la la la la la la

             %25
             si si si si si si si si la la la la la la la la
             si si si si si si si si la la la la la la la la\mbreak
             si si si si si si si si si si si si si si si si

             %28
             la la la la la la la la la la la la la la la la
             sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol
             fad fad fad fad fad fad fad fad \mbreak sol4}\\{fad16 fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad
                                                             sol sol sol sol sol sol sol sol fad fad fad fad fad fad fad fad
                                                             sol sol sol sol sol sol sol sol fad fad fad fad fad fad fad fad\mbreak
                                                             sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol
                                                             fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad
                                                             mi mi mi mi mi mi mi mi mi mi mi mi mi mi mi mi
                                                             re re re re re re re re\mbreak re4}>> r

          %31
          R1*3
          r2 mi16 mi mi mi mi mi mi mi
          si' si si si si si si si mi, mi mi mi si si si si\mbreak

          %36
          \clef bass sol,,4\fermata r r2
          R4.*33

}

cembaloIIn = \relative do {

    R1*6
    r2 \clef violin <<{si'''16 si si si si si  si do
          la la la la la la la si sol sol sol sol sol sol sol la

          %9
         fad fad fad sol fad fad fad sol fad fad fad sol fad fad fad sol}\\{sol sol sol sol sol sol sol la
                                                             fad fad fad fad fad fad fad sol mi mi mi mi mi mi mi fad
                                                             re re re re re re re re re re re re re re re re}>>
          \clef tenor re,\tu re re re re re re re sol sol sol sol sol sol sol sol
          re re re re re re re re sol\clef bass sol, sol sol re re re re

          %12
          sol sol, sol sol re re re re\mbreak sol4 \clef violin r8  <<{si'''16^\markup\italic\right-align"Cembali Soli"[si]
                                                                          si si si si si si si si si si si si si si si si
                                                                          si si si si si si si si si si si si si4}\\{sol 16sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol
                                                                                                                     sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol4}>>

          %15
          R1
          r4 r8 <<{si16 si si si si si si si si si
                   si si si si si si si si si si si si si si si si

                   %18
                   si si si si si4}\\{sol16 sol sol sol sol sol sol sol sol sol
                                      sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol
                                      sol sol sol sol sol4}>> r2
          R1*5
          <<{fad16 fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad

             %25
             sol sol sol sol sol sol sol sol fad fad fad fad fad fad fad fad
             sol sol sol sol sol sol sol sol fad fad fad fad fad fad fad fad\mbreak
             sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol sol

             %28
             fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad fad
             mi mi mi mi mi mi mi mi mi mi mi mi mi mi mi mi
             re re re re re re re re\mbreak re4}\\{re16 re re re re re re re re re re re re re re re
                                                   re re re re re re re re re re re re re re re re
                                                   re re re re re re re re re re re re re re re re\mbreak
                                                   re re re re re re re re mi mi mi mi mi mi mi mi
                                                   do do do do do do do do re re re re re re re re
                                                   si si si si si si si si do do do do do do do do
                                                   la la la la la la la la\mbreak si4}>> r

          %31
          R1*3
          r2 mi16 mi mi mi mi mi mi mi
          si' si si si si si si si mi, mi mi mi si si si si\mbreak

          %36
          \clef bass sol,,4\fermata r r2
          R4.*33

}

bcn = \relative do {

    R1*6
    r2 sol'8 sol sol sol
    re re re re mi mi la, la

    %9
    re re re re re re re re
    \clef tenor re'16\tu re re re re re re re sol sol sol sol sol sol sol sol
          re re re re re re re re sol\clef bass sol, sol sol re re re re

          %12
          sol sol, sol sol re re re re\mbreak sol4 r
          R1*11
          re'8 re re re re re re re

          %25
          sol, sol sol sol re' re re re
          sol, sol sol sol re' re re re\mbreak
          sol sol sol sol do, do do do

          %28
          fad fad fad fad si, si si si
          mi mi mi mi la, la la la
          re re re re\mbreak sol,4 r

          %31
          R1*5
          R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
          R4.*33

}

forma = {

    \time 4/4
    \key sol\major
    \tempo 4 = 60
    s1*36
    \bar "||"\break
    \time 3/8
    \tempo 4. = 60
    s4.*33
    \bar "||"

}

vlI = {
    \global
    <<\vlIn\forma>>
}

vlII = {
    \global
    <<\vlIIn\forma>>
}

vlIII = {
    \global
    <<\vlIIIn\forma>>
}

vlIV = {
    \global
    <<\vlIVn\forma>>
}

vla = {
    \global
    \clef alto
    <<\vlan\forma>>
}

soprano = {
    \new Voice = "zeffiretti"
    \global
    <<\sopranon\forma>>
}

alto = {
    \new Voice = "sussurrate"
    \global
    <<\alton\forma>>
}

cembaloI = {
    \global
    \clef bass
    <<\cembaloIn\forma>>

}

cembaloII = {
    \global
    \clef bass
    <<\cembaloIIn\forma>>

}

bc = {
    \global
    \clef bass
    <<\bcn\forma>>
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


Iglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

IvlIn = \relative do'' {

    si4. fad re'8 dod re si4.
    fad'4 re8 dod4 si8 lad sold lad fad4.
    si8 re dod re4 fad,8 sol4(fad8) sol4.

    %4
    dod8 mi re mi4 sol,8 sol4.\tr fad
    re' dod4 si8 la si dod re4 re,8
    fad4. \parentSlur (mi\tr) re2.

    %7
    re4. mi fad8 mi re fad4 sold8
    la4(sold8) la4. mi fad
    sol8 fad mi sold4 lad8 si4(dod8) si4.

    %10
    do4(mi8) do4(si8) lad4(dod?8) lad4(sold8)
    fad4(lad8) dod4(mi8) re fad mi re dod si
    si4. \parentSlur (lad^\markup {[\musicglyph #"scripts.trill"]}) si2.\fermata

}

IvlIIn = \relative do'' {

    si4. fad re'8 dod re si4.
    fad'4 re8 dod4 si8 lad sold lad fad4.
    si8 re dod re4 fad,8 sol4(fad8) sol4.

    %4
    dod8 mi re mi4 sol,8 sol4.\tr fad
    re' dod4 si8 la si dod re4 re,8
    fad4. \parentSlur (mi\tr) re2.

    %7
    re4. mi fad8 mi re fad4 sold8
    la4(sold8) la4. mi fad
    sol8 fad mi sold4 lad8 si4(dod8) si4.

    %10
    do4(mi8) do4(si8) lad4(dod?8) lad4(sold8)
    fad4(lad8) dod4(mi8) re fad mi re dod si
    si4. \parentSlur (lad^\markup {[\musicglyph #"scripts.trill"]}) si2.\fermata

}

Ivlan = \relative do' {

    si4. r si r
    re mi fad r
    re  r mi r

    %4
    mi dod re re,
    re' mi fad4 mi8 re4.
    la' la, re2.

    %7
    re4. r re~re4 re8
    dod4 si8 dod si la mi'4. r
    mi~mi4 mi8 re4 dod8 re dod si

    %10
    mi4. r fad r
    lad, r si r
    fad' fad, si2._\fermata

}

Isopranon = \relative do'' {

  \autoBeamOff

    si4. fad re'8 [dod re] si4.
    fad'4 (re8) dod4 si8 lad [sold lad] fad4.
    si8 [re dod] re4 fad,8 sol4(fad8) sol4.

    %3
    dod8 mi [(re] mi4) sol,8 sol4.\tr fad
    re' dod4 (si8) la si dod re4 re,8
    fad4. (mi\tr) re2.

    %6
    re4. mi fad8 [mi] re fad4 sold8
    la4(sold8) la4. mi fad
    sol8 [fad] mi sold4 lad8 si4(lad8) si4.

    %9
    do4(mi8) do4(si8) lad4(dod?8) lad4(sold8)
    fad4(lad8) dod4(mi8) re [fad mi] re [dod] si
    si4. (lad\tr) si2.\fermopz

}

Itesto = \lyricmode {

    Vieni _ vieni _ o mio dilet - to già il mio core _ tutto _ affet - to già t'aspet - ta, e ogn'or ti chia -- ma.

    Il mio core _ tutto_af - fetto _ il mio core _ tutto_af - fetto _ già t'aspet - ta_e già ti chiama _ ti chia -- ma.

}

Ibcn = \relative do {

    si4. r si r
    re mi fad r
    re  r mi r

    %4
    mi dod re re,
    re' mi fad4 mi8 re4.
    la' la, re2.

    %7
    re4. r re~re4 re8
    dod4 si8 dod si la mi'4. r
    mi~mi4 mi8 re4 dod8 re dod si

    %10
    mi4. r fad r
    lad, r si r
    fad' fad, si2._\fermata

}

forma = {

    \time12/8
    \key si\minor
    \tempo 2. = 70
    \set Score.currentBarNumber = #70
    s1.*6
    \bar ":..:"\break
    s1.*6
    \bar ":|."
    \mark\markup"[D.C.]"

}

IvlI = {
  \Iglobal
  <<\IvlIn\forma>>
}

IvlII = {
  \Iglobal
  <<\IvlIIn\forma>>
}

Ivla = {
  \Iglobal
  \clef alto
  <<\Ivlan\forma>>
}

Isoprano = {
  \new Voice = "vieni"
  \Iglobal
  <<\Isopranon\forma>>
}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn\forma>>

}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-default-paper-size "a4" 'landscape)

#(set-global-staff-size 18)


\pointAndClickOn


\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #1

    }

\markup\huge\bold\fill-line{"”Zeffiretti che sussurrate” [RV 749.21 / Rinaldi Op. 312/11]"}
 \markup \fill-line{"   ""                                                                                              A. Vivaldi (1678 -1741)"}

\markup \huge {[Andante]}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
    } <<

        \new PianoStaff\with {instrumentName = \markup\huge\center-column{"2 Violini"\vspace #-0.2"in Scena"}} <<

            \new Staff = "main" <<
                \set Staff.midiInstrument = #"violin"
                \vlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \vlII
            >>
        >>

        \new PianoStaff<<

            \new Staff <<
                \set Staff.instrumentName = \markup\huge\center-column{"Orchestra"}
                \set Staff.midiInstrument = #"violin"
                \vlIII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \vlIV
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \vla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major\time 4/4  r1^\markup \right-align"[Soprano]"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \soprano
                \new Lyrics \lyricsto "zeffiretti" \testoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key sol\major\time 4/4  r1^\markup \right-align"[Alto]"}
                \clef violin
                \alto
                \new Lyrics \lyricsto "sussurrate" \testoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Primo""Cembalo"}
                \set Staff.midiInstrument = #"harpsichord"
                \cembaloI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Secondo""Cembalo"}
                \set Staff.midiInstrument = #"harpsichord"
                \cembaloII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \bc
        >>
    >>

    \layout {

        indent = 2.5\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

    \paper {

        systems-per-page = #2

    }

\markup\huge "Orchestra"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
    } <<

            \new Staff = "main" <<
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"synth voice"
                \Isoprano
                \new Lyrics \lyricsto "vieni" \Itesto
            >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \Ibc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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





%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
