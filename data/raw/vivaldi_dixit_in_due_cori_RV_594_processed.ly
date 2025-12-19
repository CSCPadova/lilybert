\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

s1^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza I]"}\bar "|"

\cadenzaOff

}

MyCadenzabis = \relative do'' {

\cadenzaOn

s2.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza III]"}\bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

saltabis = #(skip-of-length MyCadenzabis)

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



ItpIn = \relative do'' {

   R1*4
   la'8 la, la'4 r8 la sol fad
   sol la, sol'4 r8 sol fad mi

   %7
   fad8 la, fad'4 r8 fad sol fad
   mi16^\markup\italic"Tromba sola" fad mi fad \parenthesize sol \parenthesize fad \parenthesize sol \parenthesize fad mi fad mi fad sol fad sol fad
   mi16^\markup\italic"Hautbois solo" fad mi fad  sol  fad  sol  fad mi fad mi fad sol fad sol fad

   %10
   mi4 r la8^\markup\italic"Hautbois" re r 16do si la
   si4 r sol8 dod? r16 si la sol
   la4 r fad8 si r16 la sol fad

   %13
   sol4 r mi8 la r16 sol fad mi\mbreak
   fad8 la4 sol16 fad sol8 sol4 fad16 mi
   fad4 r r2

   %16
   r8 fad4 fad8~fad[mi16 fad sol8 mi]
   fad4 r r2
   R1

   %19
   r8 mi\p fad mi r2
   r8 mi, fad mi r2
   re'8 r re r re r re re

   %22
   sold,2 la8[sol16 fad mi re dod si]
   la8[mi''16 fad sol fad sol mi] fad8[re mi dod]
   re[mi,16 fad sol fad sol mi] fad8 re' mi dod

   %25
   re4 r r2
   R1
   r2 r8 fad16[sol la sol la sol]

   %28
   fad8 re la'4 r8 la fad re\mbreak
   la'8 re, la'4 r8 la fad re
   mi16 fad mi fad sol fad sol fad mi8 la, la'4

   %31
   r8 la sol fad sol8 la, sol'4
   r8 sol fad mi fad la, fad'4
   r8 fad sol fad mi[mi,16 fad sol fad sol fad]

   %34
   mi8 mi' fad mi r2
   r8 mi,\p fad mi r2
   re'8\f r re r re r re re

   %37
   sold,2 la4 r8 mi'
   dod re si4 dod8 la mi'4
   r8 mi re dod re mi, re'4

   %40
   r8 re dod si dod8 mi, dod'4
   r8 dod si la  si16 dod si dod re dod re si
   sold' la sold la si la si sold\mbreak la8 dod, re si

   %43
   dod4 r r2
   R1
   mi8 la, la'4 r8 la sol fad

   %46
   sol la, sol'4 r8 sol fad mi
   fad8 la, fad'4 r8 fad sol fad
   mi[mi,16 fad sol fad sol mi] r2

   %49
   la'8 re r16 do si la si8 si r4
   sol8 dod? r16 si la sol la8 la r4
   fad8 si r16 la sol fad sol8 sol r4

   %52
   mi8 la r16 sol fad mi fad sol fad sol la sol la sol\mbreak
   mi8 fad mi4 re8[fad16 sol la sol la fad]
   mi8 mi fad mi r2

   %55
   r8 fad sol fad r2
   r8 mi la mi r mi sol mi
   fad[fad16 sol la sol la fad] mi8 fad mi4

   %58
   re8[fad16 sol la sol la sol] fad8[fad,16 sol la sol la sol]
   fad8[fad'16 sol la sol la fad] sol8[sol16 la si la si sol]
   dod,8 re re dod re [mi16 fad sol fad sol mi]

   %61
   fad8 re mi dod re[mi,16 fad sol fad sol mi]
   fad8 fad' sol mi re2\fermata

}

ItpIIn = \relative do'' {

   R1*4
   mi8 la, fad'4 r8 fad mi re
   mi8 la, mi'4 r8 mi re dod

   %7
   re la re4 r8 re mi re
   la16^\markup\italic"Tromba sola" re la re \parenthesize mi\parenthesize re\parenthesize mi\parenthesize re  la re la re mi re mi re
   dod^\markup\italic"Hautbois solo" re dod re mi re mi re dod re dod re mi re mi re

   %10
   dod4 r fad8^\markup\italic"Hautbois" la r16 la sol fad
   sol4 r mi8 sol r16 sol fad mi
   fad4 r re8 fad r16 fad mi re

   %13
   mi4 r dod8 mi r16 mi re dod\mbreak
   re8 fad4 mi16 re mi8 mi4 re16 dod
   re4 r r2

   %16
   r8 re4 re8~re[dod16 re mi8 dod]
   re4 r r2
   R1

   %19
   r8 dod\p re dod r2
   r8 dod, re dod r2
   re'8 r re r re r re re

   %22
   sold,2 la8[sol16 fad mi re dod si]
   la8[dod'16 re mi re mi dod] re8 fad sol mi
   re[dod,16 re mi re mi dod] re8 fad sol mi

   %25
   re4 r r2
   R1
   r2 r8 re'16[mi fad mi fad mi]

   %28
   re8 la fad'4 r8 fad re la\mbreak
   fad' la, fad'4 r8 fad re la
   dod16 re dod re mi re mi re dod8 la fad'4

   %31
   r8 fad mi re mi la, mi'4
   r8 mi re dod re la re4
   r8 re mi re dod[dod,16 re mi re mi re]

   %34
   dod8 dod' re dod r2
   r8 dod,\p re dod r2
   re'8\f r re r re r re re

   %37
   sold,2 la4 r8 si
   la si sold4 la8 mi dod'4
   r8 dod si la si mi, si'4

   %40
   r8 si la sold la mi la4
   r8 la sold la sold16 la sold la si la si sold
   mi' fad mi fad sold fad sold mi\mbreak mi8 la, si sold

   %43
   la4 r r2
   R1
   dod8 la fad'4 r8 fad mi re

   %46
   mi la, mi'4 r8 mi re dod
   re la re4 r8 re mi re
   dod[dod,16 re mi re mi dod] r2

   %49
   fad'8 la r16 la sol fad sol8 sol r4
   mi8 sol r16 sol fad mi fad8 fad r4
   re8 fad r16 fad mi re mi8 mi r4

   %52
   dod8 mi r16 mi re dod re16 mi re mi fad mi fad mi\mbreak
   dod8 re4 dod8 re[re16 mi fad mi fad re]
   dod8 dod re dod r2

   %55
   r8 re mi re r2
   r8 dod mi dod r dod mi dod
   re[re16 mi fad mi fad re] dod8 re re dod

   %58
   re[re16 mi fad mi fad mi ]re8[re,16 mi fad mi fad mi]
   re8[re'16 mi fad mi fad re] si8[si16 dod re dod re si]
   mi8 fad mi mi fad[dod16 re mi re mi dod]

   %61
   re8 fad, sol mi fad[dod16 re mi re mi dod]
   re8 re' mi dod re2\fermata

}

IvlIn = \relative do'' {

   R1*4
   la'8 la, la'4 r8 la sol fad
   sol la, sol'4 r8 sol fad mi

   %7
   fad8 la, fad'4 r8 fad sol fad
   mi4 r mi r
   mi r mi r

   %10
   mi4 r la8 re r16 do si la
   si4 r sol8 dod? r16 si la sol
   la4 r fad8 si r16 la sol fad

   %13
   sol4 r mi8 la r16 sol fad mi\mbreak
   fad8 la4 sol16 fad sol8 sol4 fad16 mi
   fad4 r r2

   %16
   r8 fad4 fad8~fad[mi16 fad sol8 mi]
   fad4 r r2
   R1

   %19
   r8 mi\p fad mi r2
   r8 mi, fad mi r2
   re'8 r re r re r re re

   %22
   sold,2 la8[sol16 fad mi re dod si]
   la8[mi''16 fad sol fad sol mi] fad8[re mi dod]
   re[mi,16 fad sol fad sol mi] fad8 re' mi dod

   %25
   re4 r r2
   R1
   r2 r8 fad16[sol la sol la sol]

   %28
   fad8 re la'4 r8 la fad re\mbreak
   la'8 re, la'4 r8 la fad re
   mi16 fad mi fad sol fad sol fad mi8 la, la'4

   %31
   r8 la sol fad sol8 la, sol'4
   r8 sol fad mi fad la, fad'4
   r8 fad sol fad mi[mi,16 fad sol fad sol fad]

   %34
   mi8 mi' fad mi r2
   r8 mi,\p fad mi r2
   re'8\f r re r re r re re

   %37
   sold,2 la4 r8 mi'
   dod re si4 dod8 la mi'4
   r8 mi re dod re mi, re'4

   %40
   r8 re dod si dod8 mi, dod'4
   r8 dod si la  si16 dod si dod re dod re si
   sold' la sold la si la si sold\mbreak la8 dod, re si

   %43
   dod4 r r2
   R1
   mi8 la, la'4 r8 la sol fad

   %46
   sol la, sol'4 r8 sol fad mi
   fad8 la, fad'4 r8 fad sol fad
   mi[mi,16 fad sol fad sol mi] r2

   %49
   la'8 re r16 do si la si8 si r4
   sol8 dod? r16 si la sol la8 la r4
   fad8 si r16 la sol fad sol8 sol r4

   %52
   mi8 la r16 sol fad mi fad sol fad sol la sol la sol\mbreak
   mi8 fad mi4 re8[fad16 sol la sol la fad]
   mi8 mi fad mi r2

   %55
   r8 fad sol fad r2
   r8 mi la mi r mi sol mi
   fad[fad16 sol la sol la fad] mi8 fad mi4

   %58
   re8[fad16 sol la sol la sol] fad8[fad,16 sol la sol la sol]
   fad8[fad'16 sol la sol la fad] sol8[sol16 la si la si sol]
   dod,8 re re dod re [mi16 fad sol fad sol mi]

   %61
   fad8 re mi dod re[mi,16 fad sol fad sol mi]
   fad8 fad' sol mi re2\fermata

}

IvlIIn = \relative do'' {

   R1*4
   mi8 la, fad'4 r8 fad mi re
   mi8 la, mi'4 r8 mi re dod

   %7
   re la re4 r8 re mi re
   dod4 r dod r
   dod r dod r

   %10
   dod r fad8 la r16 la sol fad
   sol4 r mi8 sol r16 sol fad mi
   fad4 r re8 fad r16 fad mi re

   %13
   mi4 r dod8 mi r16 mi re dod\mbreak
   re8 fad4 mi16 re mi8 mi4 re16 dod
   re4 r r2

   %16
   r8 re4 re8~re[dod16 re mi8 dod]
   re4 r r2
   R1

   %19
   r8 dod\p re dod r2
   r8 dod, re dod r2
   re'8 r re r re r re re

   %22
   sold,2 la8[sol16 fad mi re dod si]
   la8[dod'16 re mi re mi dod] re8 fad sol mi
   re[dod,16 re mi re mi dod] re8 fad sol mi

   %25
   re4 r r2
   R1
   r2 r8 re'16[mi fad mi fad mi]

   %28
   re8 la fad'4 r8 fad re la\mbreak
   fad' la, fad'4 r8 fad re la
   dod16 re dod re mi re mi re dod8 la fad'4

   %31
   r8 fad mi re mi la, mi'4
   r8 mi re dod re la re4
   r8 re mi re dod[dod,16 re mi re mi re]

   %34
   dod8 dod' re dod r2
   r8 dod,\p re dod r2
   re'8\f r re r re r re re

   %37
   sold,2 la4 r8 si
   la si sold4 la8 mi dod'4
   r8 dod si la si mi, si'4

   %40
   r8 si la sold la mi la4
   r8 la sold la sold16 la sold la si la si sold
   mi' fad mi fad sold fad sold mi\mbreak mi8 la, si sold

   %43
   la4 r r2
   R1
   dod8 la fad'4 r8 fad mi re

   %46
   mi la, mi'4 r8 mi re dod
   re la re4 r8 re mi re
   dod[dod,16 re mi re mi dod] r2

   %49
   fad'8 la r16 la sol fad sol8 sol r4
   mi8 sol r16 sol fad mi fad8 fad r4
   re8 fad r16 fad mi re mi8 mi r4

   %52
   dod8 mi r16 mi re dod re16 mi re mi fad mi fad mi\mbreak
   dod8 re4 dod8 re[re16 mi fad mi fad re]
   dod8 dod re dod r2

   %55
   r8 re mi re r2
   r8 dod mi dod r dod mi dod
   re[re16 mi fad mi fad re] dod8 re re dod

   %58
   re[re16 mi fad mi fad mi ]re8[re,16 mi fad mi fad mi]
   re8[re'16 mi fad mi fad re] si8[si16 dod re dod re si]
   mi8 fad mi mi fad[dod16 re mi re mi dod]

   %61
   re8 fad, sol mi fad[dod16 re mi re mi dod]
   re8 re' mi dod re2\fermata

}

IvlaIn = \relative do' {

   R1*4
   la'8 la la4 r8 la la la
   dod dod dod4 r8 dod la la

   %7
   la la la4 r8 la la la
   la4 r la r
   la r la r

   %10
   la r fad8 fad fad fad
   re4 r mi8 mi mi mi
   dod4 r re8 re re re

   %13
   si4 r dod8 dod dod dod\mbreak
   la'4 la si dod
   la r r2

   %16
   la4 la la8 la si la
   la4 r r2
   R1

   %19
   r8 la re, la' r2
   r8 la, re, la' r2
   re'8 r re r re r re re

   %22
   sold,2 la8[sol16 fad mi re dod si]
   la8 la' la dod la la si la
   fad la, la dod la la si la

   %25
   la4 r r2
   R1
   r2 r8 la' la la

   %28
   la fad re'4 r8 re la fad\mbreak
   la fad re'4 r8 re la fad
   la la la dod la la la4

   %31
   r8 la la la dod dod dod4
   r8 dod dod dod la la la4
   r8 la la la la dod, dod dod

   %34
   dod la' re, la' r2
   r8 la, re, la' r2
   re'8\f r re r re r re re

   %37
   sold,2 la4 r8 sold
   mi fad mi4 mi8 mi mi4
   r8 mi mi mi sold sold sold4

   %40
   r8 \once\set suggestAccidentals = ##t  sold? sold sold mi mi mi4
   r8 mi mi mi mi mi mi mi
   si' si si si\mbreak dod mi, fad mi

   %43
   mi4 r r2
   R1
   la8 la la4 r8 la la la

   %46
   dod dod dod4 r8 dod dod dod
   la la la4 r8 la la la
   la dod, dod dod r2

   %49
   fad8 fad fad fad re re r4
   mi8 mi mi mi dod dod r4
   re8 re re re si si r4

   %52
   dod8 dod dod dod la la la la\mbreak
   la'4 la la8 la la la
   la la re, la' r2

   %55
   r8 re, la re r2
   r8 la' la la r la la la
   la la la la la la la la

   %58
   la la la la r la, la la
   r la' la la r re, re si'
   la la la la la la la dod

   %61
   la la, si la la la la dod
   la la' si la fad2\fermata

}

IsopranoIn = \relative do'' {

    \autoBeamOff
    R1*24
    la2 la
    la la

    %27
    fad4. mi8 re2
    re' re\mbreak
    re re

    %30
    dod4. la8 la4 r
    re2 mi
    dod re~

    %33
    re dod
    R1*2
    re4 re re re8 re

    %37
    sold,2 la4 r8 mi'
    dod re si4 dod r
    R1*6

    %45
    r2 re
    mi dod
    re1

    %48
    dod2 r
    la4 la8 la si si r4
    sol4 sol8 sol la la r4

    %51
    fad4 fad8 fad sol sol r4
    mi4 mi8 mi fad fad r la\mbreak
    dod re re[dod] re4 r

    %54
    R1*2
    la1
    la4 r8 la la la la4

    %58
    la r do2~
    do si4 r8 re
    dod? re re[dod] re4 r8 mi

    %61
    fad re mi[dod] re4 r
    R1

}

ItestoI = \lyricmode {

  Di -- xit di -- xit Do -- minus _ di -- xit di -- xit Do -- minus _ Do -- mi -- no me -- o:

  se -- de se -- de a dex -- tris a dex -- tris me -- is.

  Do -- mi -- no me -- o: se -- de a dex -- tris a dex -- tris me -- is se -- de a dex -- tris a dex -- tris me -- is

  a dex -- tris me -- is. Se -- de a dex -- tris me -- is  se -- de a dex -- tris me -- is a dex -- tris me -- is.

}

IaltoIn = \relative do' {

    \autoBeamOff
    R1*27
    fad2 fad\mbreak
    fad fad

    %30
    mi4. mi8 mi4 r
    fad2 sol
    la fad~

    %33
    fad mi
    R1*2
    re'4 re re re8 re

    %37
    sold,2 la4 r8 sold
    la si sold4 la r
    R1*4

    %43
    mi2 mi
    mi mi
    mi8. re16 dod4 fad2

    %46
    sol la
    fad1
    mi2 r

    %49
    fad4 fad8 fad sol sol r4
    mi4 mi8 mi fad fad r4
    re4 re8 re mi mi r4

    %52
    dod4 dod8 dod re re r fad \mbreak
    mi fad mi4 fad r
    R1*2

    %56
    la2 sol
    fad4 r8 fad mi fad mi4
    fad r la2~

    %59
    la sol4 r8 si
    la la la4 la r8 la
    la la si[la] la4 r

    %62
    R1

}

ItestoII = \lyricmode {

   Di -- xit di -- xit Do -- minus _ Do -- mi -- no me -- o:

  se -- de se -- de a dex -- tris a dex -- tris me -- is.

  Di -- xit di -- xit Do -- minus _ Do -- mi -- no me -- o: se -- de a dex -- tris a dex -- tris me -- is se -- de a dex -- tris a dex -- tris me -- is

  a dex -- tris me -- is. Se - de a dex -- tris me -- is  se -- de a dex -- tris me -- is a dex -- tris me -- is.

}

ItenoreIn = \relative do' {

    \autoBeamOff
    R1*27
    la2 la\mbreak
    la la

    %30
    la4. la8 la4 r
    la2 dod
    dod la~

    %33
    la dod
    R1*2
    re4 re re re8 re

    %37
    sold,2 la4 r8 mi'
    mi fad mi4 mi r
    R1*6

    %45
    r2 la,
    dod dod
    la1

    %48
    dod2 r
    re4 re8 re re re r4
    dod4 dod8 dod dod dod r4

    %51
    si4 si8 si si si r4
    la4 la8 la la la r re\mbreak
    la8 la la4 la r

    %54
    R1
    re4 re, r2
    mi'2 dod

    %57
    la4 r8 re dod re re[dod]
    re4 r fad2~
    fad re4 r8 si

    %60
    mi fad mi4 fad r8 dod
    re fad mi4 fad r
    R1

}

ItestoIII = \lyricmode {

   Di -- xit di -- xit Do -- minus _ Do -- mi -- no me -- o:

  se -- de se -- de a dex -- tris a dex -- tris me -- is.

  Do -- mi -- no me -- o: se -- de a dex -- tris a dex -- tris me -- is se -- de a dex -- tris a dex -- tris me -- is

  a dex -- tris me -- is. Se -- de se - de a dex -- tris me -- is  se -- de a dex -- tris me -- is a dex -- tris me -- is.

}

IbassoIn = \relative do {

    \autoBeamOff
    R1*27
    re2 re\mbreak
    re re

    %30
    la'4. la,8 la4 r
    re2 la'
    la, re~

    %33
    re la
    la'4 la, r2
    la'4 la, r2

    %36
    re'4 re re re8 re
    sold,2 la4 r8 mi
    la re, mi4 la, r

    %39
    R1*6
    r2 re
    la' la,

    %47
    re1
    la2 r
    re4 re8 re sol sol r4

    %50
    dod, dod8 dod fad fad r4
    si, si8 si mi mi r4
    la, la8 la re re r8 re\mbreak

    %53
    la' re, la'[la,] re4 r
    la' la, r2
    R1

    %56
    la
    re4 r8 re la' re, la'[la,]
    re4 r re2~

    %59
    re sol4 r8 sol
    la re, la'[la,] re4 r8 la'
    re re, sol[la] re,4 r

    %62
    R1

}

ItestoIV = \lyricmode {

  Di -- xit di -- xit Do -- minus _ Do -- mi -- no me -- o:

  se -- de se -- de se -- de se -- de a dex -- tris a dex -- tris me -- is.

  Do -- mi -- no me -- o: se -- de a dex -- tris a dex -- tris me -- is se -- de a dex -- tris a dex -- tris me -- is

  a dex -- tris me -- is. Se -- de se -- de a dex -- tris me -- is  se -- de a dex -- tris me -- is a dex -- tris me -- is.

}

IbcIn = \relative do {

   re'8^\f_\markup\italic "Org.ni Soli" re, re'4 r8 re dod la
   re re, re'4 r8 re dod la
   re4 r8 dod si la sol fad

   %4
   mi4 r8 fad mi re dod si
   la4\tu r16 la' la, la' la,4 r16 la' la, la'
   la,4 r16 la' la, la' la,4 r16 la' la, la'

   %7
   la,4 r16 la' la, la' la,4 r16 la' la, la'
   la,4 r la r
   la r la r

   %10
   la r re16[re' re, re' re, re' re, re']
   sol,4 r dod,16[dod' dod, dod' dod, dod' dod, dod']
   fad,4 r si,16[si' si, si' si, si' si, si']

   %13
   mi,4 r la,16[la' la, la' la, la' la, la']\mbreak
   re,4 re sol, la
   re, \p r r2

   %16
   re'4 re re8 re, sol la
   re,4 r r2
   re''8\f dod si la sol fad mi re

   %19
   la4 r r2
   la4\p r r2
   re'8\f r re r re r re re

   %22
   sold,2 la8[sol16 fad mi re dod si]
   la8 la' la la, re, re' sol, la
   re la' la la, re, re' sol, la

   %25
   re'\f re, re'4 r8 re dod la
   re re, re'4 r8 re dod la
   re re, re'4 r8 re re, re'

   %28
   re,4 r16 re' re, re' re,4 r16 re' re, re'\mbreak
   re,4 r16 re' re, re' re,4 r16 re' re, re'
   la,8 la la la la4 r16 la' la, la'

   %31
   la,4 r16 la' la, la' la,4 r16 la' la, la'
   la,4 r16 la' la, la' la,4 r16 la' la, la'
   la,4 r16 la' la, la' la,8 la la la

   %34
   la4 r r2
   la4\p r r2
   re'8\f r re r re r re re

   %37
   sold,2 la4 r8 mi
   la re, mi mi, la4 r16 mi' mi, mi'
   mi,4 r16 mi' mi, mi' mi,4 r16 mi' mi, mi'

   %40
   mi,4 r16 mi' mi, mi' mi,4 r16 mi' mi, mi'
   mi,4 r16 mi' mi, mi' mi,8 mi' mi mi
   mi mi re re\mbreak dod la' re, mi

   %43
   la\f la, la'4 r8 la sold mi
   la la, la'4 r8 la sold mi
   la4 r16 la la, la' la,4 r16 la' la, la'

   %46
   la,4 r16 la' la, la' la,4 r16 la' la, la'
   la,4 r16 la' la, la' la,4 r16 la' la, la'
   la,8 la la la la4 r

   %49
   re16 re' re, re' re, re' re, re' sol,8 sol, r4
   dod16 dod' dod, dod' dod, dod' dod, dod' fad,8 fad, r4
   si16 si' si, si' si, si' si, si' mi,4 r

   %52
   la,16 la' la, la' la, la' la, la' re,8 re re re\mbreak
   la' re, la' la, re re re re
   la4 r r2

   %55
   re4 r r2
   la4 r la r
   re8 re re re la' re, la' la,

   %58
   re, re' re, re' r re re, re'
   r re re, re' sol sol, sol' sol,
   la' re, la' la, re la' la, la'

   %61
   re re, sol la re, la' la, la'
   re,, re' sol, la re,2\fermata

}

IbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s1*4
    s4 s16 <6 4> s8 s2
    <7 5>1
    <6 4>
    <5 3>
    s1*5
    s2 <6>4 <7>
    s1*9
    s4 <7> s2
    s1*5
    s2 s4 s16 <6 4> s8
    s2 <7 5>
    s <6 4>
    s <5 3>
    s1*3
    <6 5>1
    s2 s4 s16 <6 4> s8
    s2 <7 5>
    s <6 4>
    s <3+>
    s1*3
    s4 s16 <6 4> s8 s2
    <7 5>1
    <6 4>
    <5 3>
    s1*7
    s2 <7>
    s s4 <5 4>8 <3>
    s2 s8 <7-> s4

}


IvlIIIn = \relative do'' {

   R1*4
   la'8 la, la'4 r8 la sol fad
   sol la, sol'4 r8 sol fad mi

   %7
   fad8 la, fad'4 r8 fad sol fad
   mi4 r mi r
   mi r mi r

   %10
   mi8 la r16 sol fad mi fad4 r
   re8 sol r16 fad mi re mi4 r
   dod8 fad r16 mi re dod re4 r

   %13
   si8 mi r16 re dod si dod4 r\mbreak
   R1
   fad8\p la4 sol16 fad sol8 sol4 fad16 mi
   fad4 r r2
   r8 fad4\p fad8~fad[mi16 fad sol8 mi]
   fad4 r r2

   %19
   r2 r8 mi\p fad mi
   r2 r8 mi,\p fad mi
   re'8 r re r re r re re

   %22
   sold,2 la8[sol16 fad mi re dod si]
   la8[mi''16 fad sol fad sol mi] fad8[re mi dod]
   re[mi,16 fad sol fad sol mi] fad8 re' mi dod

   %25
   re4 r r2
   R1
   r2 r8 fad16[sol la sol la sol]

   %28
   fad8 re la'4 r8 la fad re\mbreak
   la'8 re, la'4 r8 la fad re
   mi16 fad mi fad sol fad sol fad mi8 la, la'4

   %31
   r8 la sol fad sol8 la, sol'4
   r8 sol fad mi fad la, fad'4
   r8 fad sol fad mi[mi,16 fad sol fad sol fad]

   %34
   mi4 r r8 mi'\p fad mi
   r2 r8 mi,\p fad mi
   re'8\f r re r re r re re

   %37
   sold,2 la4 r8 mi'
   dod re si4 dod8 la mi'4
   r8 mi re dod re mi, re'4

   %40
   r8 re dod si dod8 mi, dod'4
   r8 dod si la  si16 dod si dod re dod re si
   sold' la sold la si la si sold\mbreak la8 dod, re si

   %43
   dod4 r r2
   R1
   mi8 la, la'4 r8 la sol fad

   %46
   sol la, sol'4 r8 sol fad mi
   fad8 la, fad'4 r8 fad sol fad
   mi[mi,16 fad sol fad sol mi] mi'8 la r16 sol fad mi

   %49
   fad8 fad r4 re8 sol r16 fad mi re
   mi8 mi r4 dod8 fad r16 mi re dod
   re8 re r4 si8 mi r16 re dod si

   %52
   dod8 dod r4 fad16 sol fad sol la sol la sol\mbreak
   mi8 fad mi4 re8[fad16 sol la sol la fad]
   mi4 r r8 mi fad mi

   %55
   r2 r8 fad sol fad
   r8 mi la mi r mi sol mi
   fad[fad16 sol la sol la fad] mi8 fad mi4

   %58
   re8[fad16 sol la sol la sol] fad8[fad,16 sol la sol la sol]
   fad8[fad'16 sol la sol la fad] sol8[sol16 la si la si sol]
   dod,8 re re dod re [mi16 fad sol fad sol mi]

   %61
   fad8 re mi dod re[mi,16 fad sol fad sol mi]
   fad8 fad' sol mi re2\fermata

}

IvlIVn = \relative do'' {

   R1*4
   mi8 la, fad'4 r8 fad mi re
   mi8 la, mi'4 r8 mi re dod

   %7
   re la re4 r8 re mi re
   dod4 r dod r
   dod r dod r

   %10
   dod8 mi r16 mi re dod re4 r
   si8 re r16 re dod si dod4 r
   la8 dod r16 dod si la si4 r

   %13
   sol8 si r16 si la sol la4 r\mbreak
   R1
   re8\p fad4 mi16 re mi8 mi4 re16 dod
   re4 r r2
   r8 re4\p re8~re[dod16 re mi8 dod]
   re4 r r2

   %19
   r2 r8 dod\p re dod
   r2 r8 dod,\p re dod
   re'8 r re r re r re re

   %22
   sold,2 la8[sol16 fad mi re dod si]
   la8[dod'16 re mi re mi dod] re8 fad sol mi
   re[dod,16 re mi re mi dod] re8 fad sol mi

   %25
   fad4 r r2
   R1
   r2 r8 re'16[mi fad mi fad mi]

   %28
   re8 la fad'4 r8 fad re la\mbreak
   fad' la, fad'4 r8 fad re la
   dod16 re dod re mi re mi re dod8 la fad'4

   %31
   r8 fad mi re mi la, mi'4
   r8 mi re dod re la re4
   r8 re mi re dod[dod,16 re mi re mi re]

   %34
   dod4 r r8 dod'\p re dod
   r2 r8 dod,\p re dod
   re'8\f r re r re r re re

   %37
   sold,2 la4 r8 si
   la si sold4 la8 mi dod'4
   r8 dod si la si mi, si'4

   %40
   r8 si la sold la mi la4
   r8 la sold la sold16 la sold la si la si sold
   mi' fad mi fad sold fad sold mi\mbreak mi8 la, si sold

   %43
   la4 r r2
   R1
   dod8 la fad'4 r8 fad mi re

   %46
   mi la, mi'4 r8 mi re dod
   re la re4 r8 re mi re
   dod[dod,16 re mi re mi dod] dod'8 mi r16 mi re dod

   %49
   re8 re r4 si8 re r16 re dod si
   dod8 dod r4 la8 dod r16 dod si la
   si8 si r4 sol8 si r16 si la sol

   %52
   la8 la r4 re16 mi re mi fad mi fad mi\mbreak
   dod8 re4 dod8 re[re16 mi fad mi fad re]
   dod4 r r8 dod re dod

   %55
   r2 r8 re mi re
   r8 dod mi dod r dod mi dod
   re[re16 mi fad mi fad re] dod8 re re dod

   %58
   re[re16 mi fad mi fad mi ]re8[re,16 mi fad mi fad mi]
   re8[re'16 mi fad mi fad re] si8[si16 dod re dod re si]
   mi8 fad mi mi fad[dod16 re mi re mi dod]

   %61
   re8 fad, sol mi fad[dod16 re mi re mi dod]
   re8 re' mi dod re2\fermata

}

IvlaIIn = \relative do' {

    R1*4
   la'8 la la4 r8 la la la
   dod dod dod4 r8 dod la la

   %7
   la la la4 r8 la dod la
   la4 r la r
   la r la r

   %10
   dod8 dod dod dod la4 r
   si8 si si si sol4 r
   la8 la la la fad4 r

   %13
   sol8 sol sol sol mi4 r\mbreak
   R1
   la4\p la si dod

   %16
   la r r2
   la4\p la la8 la si la
   la4 r r2

   %19
   r2 r8 la\p re, la'
   r2 r8 la,\p re, la'
   re'8 r re r re r re re

   %22
   sold,2 la8[sol16 fad mi re dod si]
   la8 la' la dod la la si la
   fad la, la dod la la si la

   %25
   la4 r r2
   R1
   r2 r8 la' la la

   %28
   la fad re'4 r8 re la fad\mbreak
   la fad re'4 r8 re la fad
   la la la dod la la la4

   %31
   r8 la la la dod dod dod4
   r8 dod dod dod la la la4
   r8 la la la la dod, dod dod

   %34
   dod4 r r8 la'\p re, la'
   r2 r8 la, \p re, la'
   re'8\f r re r re r re re

   %37
   sold,2 la4 r8 sold
   mi fad mi4 mi8 mi mi4
   r8 mi mi mi sold sold sold4

   %40
   r8 \once\set suggestAccidentals = ##t  sold? sold sold mi mi mi4
   r8 mi mi mi mi mi mi mi
   si' si si si\mbreak dod mi, fad mi

   %43
   mi4 r r2
   R1
   la8 la la4 r8 la la la

   %46
   dod dod dod4 r8 dod dod dod
   la la la4 r8 la la la
   la dod, dod dod dod' dod dod dod

   %49
   la la r4 si8 si si si
   sol8 sol r4 la8 la la la
   fad8 fad r4 sol8 sol sol sol

   %52
   mi8 mi r4 re8 la la' la\mbreak
   la8 la la la fad la la la
   la4 r r8 la re, la'

   %55
   r2 r8 re, la re
   r8 la' la la r la la la
   la la la la la la la la

   %58
   la la la la r la, la la
   r la' la la r re, re si'
   la la la la la la la dod

   %61
   la la, si la la la la dod
   la la' si la fad2\fermata

}

IsopranoIIn = \relative do'' {

    \autoBeamOff
    R1*24
    la2 la
    la la

    %27
    fad4. mi8 re2
    re' re\mbreak
    re re

    %30
    dod4. la8 la4 r
    re2 mi
    dod re~

    %33
    re dod
    R1*2
    re4 re re re8 re

    %37
    sold,2 la4 r8 mi'
    dod re si4 dod r
    R1*6

    %45
    r2 re
    mi dod
    re1

    %48
    dod2 mi4 mi8 mi
    fad fad r4 re re8 re
    mi mi r4 dod4 dod8 dod

    %51
    re re r4 si4 si8 si
    dod dod r4 r r8 la\mbreak
    dod re re[dod] re4 r

    %54
    R1*2
    la1
    la4 r8 la la la la4

    %58
    la r do2~
    do si4 r8 re
    dod? re re[dod] re4 r8 mi

    %61
    fad re mi[dod] re4 r
    R1

}

ItestoV= \lyricmode {

  Di -- xit di -- xit Do -- minus _ di -- xit di -- xit Do -- minus _ Do -- mi -- no me -- o:

  se -- de se -- de a dex -- tris a dex -- tris me -- is.

  Do -- mi -- no me -- o: se -- de a dex -- tris a dex -- tris me -- is se -- de a dex -- tris a dex -- tris me -- is

  a dex -- tris me -- is. Se -- de a dex -- tris me -- is  se -- de a dex -- tris me -- is a dex -- tris me -- is.

}

IaltoIIn = \relative do' {

    \autoBeamOff
    R1*27
    fad2 fad\mbreak
    fad fad

    %30
    mi4. mi8 mi4 r
    fad2 sol
    la fad~

    %33
    fad mi
    R1*2
    re'4 re re re8 re

    %37
    sold,2 la4 r8 sold
    la si sold4 la r
    R1*4

    %43
    mi2 mi
    mi mi
    mi8. re16 dod4 fad2

    %46
    sol la
    fad1
    mi2 la4 la8 la

    %49
    la la r4 sol sol8 sol
    sol sol r4 fad fad8 fad
    fad fad r4 mi mi8 mi

    %52
    mi mi r4 r r8 fad\mbreak
    mi fad mi4 fad r
    R1*2

    %56
    la2 sol
    fad4 r8 fad mi fad mi4
    fad r la2~

    %59
    la sol4 r8 si
    la la la4 la r8 la
    la la si[la] la4 r

    %62
    R1

}

ItestoVI = \lyricmode {

  Di -- xit di -- xit Do -- minus _ Do -- mi -- no me -- o:

  se -- de se -- de a dex -- tris a dex -- tris me -- is.

  Di -- xit di -- xit Do -- minus _ Do -- mi -- no me -- o: se -- de a dex -- tris a dex -- tris me -- is se -- de a dex -- tris a dex -- tris me -- is

  a dex -- tris me -- is. Se - de a dex -- tris me -- is  se -- de a dex -- tris me -- is a dex -- tris me -- is.

}

ItenoreIIn = \relative do' {

    \autoBeamOff
    R1*27
    la2 la\mbreak
    la la

    %30
    dod4. dod8 dod4 r
    la2 dod
    dod la~

    %33
    la dod
    R1*2
    re4 re re re8 re

    %37
    sold,2 la4 r8 mi'
    mi fad mi4 mi r
    R1*6

    %45
    r2 la,
    dod dod
    la1

    %48
    dod2 dod4 dod8 dod
    re re r4 si4 si8 si
    dod dod r4 la4 la8 la

    %51
    si8 si r4 sol4 sol8 sol
    la8 la r4 r r8 re\mbreak
    la8 la la4 fad r

    %54
    R1
    r2 re'4 re,
    mi'2 dod

    %57
    la4 r8 re dod re re[dod]
    re4 r fad2~
    fad re4 r8 si

    %60
    mi fad mi4 fad r8 dod
    re fad mi4 fad r
    R1

}

ItestoVII = \lyricmode {

   Di -- xit di -- xit Do -- minus _ Do -- mi -- no me -- o:

  se -- de se -- de a dex -- tris a dex -- tris me -- is.

  Do -- mi -- no me -- o: se -- de a dex -- tris a dex -- tris me -- is se -- de a dex -- tris a dex -- tris me -- is

  a dex -- tris me -- is. Se -- de se - de a dex -- tris me -- is  se -- de a dex -- tris me -- is a dex -- tris me -- is.

}

IbassoIIn = \relative do {

    \autoBeamOff
    R1*27
    re2 re\mbreak
    re re

    %30
    la'4. la,8 la4 r
    re2 la'
    la, re~

    %33
    re la
    r2 la'4 la,
    r2 la'4 la,

    %36
    re'4 re re re8 re
    sold,2 la4 r8 mi
    la re, mi4 la, r

    %39
    R1*6
    r2 re
    la' la,

    %47
    re1
    la2 la'4 la8 la
    re re, r4 sol sol8 sol

    %50
    dod dod, r4 fad fad8 fad
    si si, r4 mi mi8 mi
    la la, r4 r r8 re\mbreak

    %53
    la' re, la'[la,] re4 r
    r2 la'4 la,
    R1

    %56
    la
    re4 r8 re la' re, la'[la,]
    re4 r re2~

    %59
    re sol4 r8 sol
    la re, la'[la,] re4 r8 la'
    re re, sol[la] re,4 r

    %62
    R1

}

ItestoVIII = \lyricmode {

   Di -- xit di -- xit Do -- minus _ Do -- mi -- no me -- o:

  se -- de se -- de se -- de se -- de a dex -- tris a dex -- tris me -- is.

  Do -- mi -- no me -- o: se -- de a dex -- tris a dex -- tris me -- is se -- de a dex -- tris a dex -- tris me -- is

  a dex -- tris me -- is. Se -- de se -- de a dex -- tris me -- is  se -- de a dex -- tris me -- is a dex -- tris me -- is.

}

IbcIIn = \relative do {

   re'8^\f_\markup\italic "Org.ni Soli" re, re'4 r8 re dod la
   re re, re'4 r8 re dod la
   re4 r8 dod si la sol fad

   %4
   mi4 r8 fad mi re dod si
   la4\tu r16 la' la, la' la,4 r16 la' la, la'
   la,4 r16 la' la, la' la,4 r16 la' la, la'

   %7
   la,4 r16 la' la, la' la,4 r16 la' la, la'
   la,4 r la r
   la r la r

   %10
   la16[la' la, la' la, la' la, la'] re,4 r
   sol,16[sol' sol, sol' sol, sol' sol, sol'] dod,4 r
   fad,16 [fad' fad, fad' fad, fad' fad, fad'] si,4 r
   mi,16[mi' mi, mi' mi, mi' mi, mi'] la,4 r \mbreak
   R1
   re4\p re sol, la
   re, r r2
   re'4\p re re8 re, sol la
   re'8\f dod si la sol fad mi re

   %19
   la4 r la\p r
   r2 la4\p r
   re'8\f r re r re r re re

   %22
   sold,2 la8[sol16 fad mi re dod si]
   la8 la' la la, re, re' sol, la
   re, la'' la la, re, re' sol, la

   %25
   re'\f re, re'4 r8 re dod la
   re re, re'4 r8 re dod la
   re re, re'4 r8 re re, re'

   %28
   re,4 r16 re' re, re' re,4 r16 re' re, re'\mbreak
   re,4 r16 re' re, re' re,4 r16 re' re, re'
   la,8 la la la la4 r16 la' la, la'

   %31
   la,4 r16 la' la, la' la,4 r16 la' la, la'
   la,4 r16 la' la, la' la,4 r16 la' la, la'
   la,4 r16 la' la, la' la,8 la la la

   %34
   la4 r la\p r
  r2 la4\p r
   re'8\f r re r re r re re

   %37
   sold,2 la4 r8 mi
   la re, mi mi, la4 r16 mi' mi, mi'
   mi,4 r16 mi' mi, mi' mi,4 r16 mi' mi, mi'

   %40
   mi,4 r16 mi' mi, mi' mi,4 r16 mi' mi, mi'
   mi,4 r16 mi' mi, mi' mi,8 mi' mi mi
   mi mi re re\mbreak dod la' re, mi

   %43
   la\f la, la'4 r8 la sold mi
   la la, la'4 r8 la sold mi
   la4 r16 la la, la' la,4 r16 la' la, la'

   %46
   la,4 r16 la' la, la' la,4 r16 la' la, la'
   la,4 r16 la' la, la' la,4 r16 la' la, la'
   la,8 la la la la16 la' la, la' la, la' la, la'

   %49
   re8 re, r4 sol,16 sol' sol, sol' sol, sol' sol, sol'
   dod8 dod, r4 fad,16 fad' fad, fad' fad, fad' fad, fad'
   si8 si, r4 mi,16 mi' mi, mi' mi, mi' mi, mi'


   %52
   la8 la, r4 re8 re re re\mbreak
   la' re, la' la, re re re re
   la4 r la r

   %55
   r2 re4 r
   la4 r la r
   re8 re re re la' re, la' la,

   %58
   re, re' re, re' r re re, re'
   r re re, re' sol sol, sol' sol,
   la' re, la' la, re la' la, la'

   %61
   re re, sol la re, la' la, la'
   re,, re' sol, la re,2\fermata

}

IbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s1*4
    s4 s16 <6 4> s8 s2
    <7 5>1
    <6 4>
    <5 3>
    s1*6
    s2 <6>4 <7>
    s1*8
    s4 <7> s2
    s1*5
    s2 s4 s16 <6 4> s8
    s2 <7 5>
    s <6 4>
    s <5 3>
    s1*3
    <6 5>1
    s2 s4 s16 <6 4> s8
    s2 <7 5>
    s <6 4>
    s <3+>
    s1*3
    s4 s16 <6 4> s8 s2
    <7 5>1
    <6 4>
    <5 3>
    s1*7
    s2 <[7]>
    s s4 <5 4>8 <3>
    s2 s8 <7-> s4

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 60
    s1*62
    \bar "|."

}

ItpI = {
    \notypeset
    <<\ItpIn \forma>>

}

ItpII = {
    <<\ItpIIn \forma>>

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

IvlaI = {
    \clef alto
    <<\IvlaIn \forma>>

}

IsopranoI = {
    \new Voice = "dixit1"
    <<\IsopranoIn \forma>>
}

IaltoI = {
    \new Voice = "dixit2"
    <<\IaltoIn \forma>>
}

ItenoreI = {
    \new Voice = "dixit3"
    <<\ItenoreIn \forma>>
}

IbassoI = {
   \clef bass
    \new Voice = "dixit4"
    <<\IbassoIn \forma>>
}



IbcI = {
    \clef bass
    <<\IbcIn \forma \IbfIn>>
    \typeset
}

IvlIII = {
    <<\IvlIIIn \forma>>

}

IvlIV = {
    <<\IvlIVn \forma>>

}

IvlaII = {
    \clef alto
    <<\IvlaIIn \forma>>

}

IsopranoII= {
    \new Voice = "dixit5"
    <<\IsopranoIIn \forma>>
}

IaltoII= {
    \new Voice = "dixit6"
    <<\IaltoIIn \forma>>
}

ItenoreII = {
    \new Voice = "dixit7"
    <<\ItenoreIIn \forma>>
}

IbassoII = {
   \clef bass
    \new Voice = "dixit8"
    <<\IbassoIIn \forma>>
}



IbcII = {
    \clef bass
    <<\IbcIIn \forma \IbfIIn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IIvlIn = \relative do'' {

    R1*2
    si'8.[si,16 si8. si16] si8.[dod16 re8. mi16]
    fad2 r8. fad16\p[fad8. sol16]

    %5
    mi8.[mi16 mi8. fad16] re8.[fad,16\pp fad8. sol16]
    mi8.[mi16 mi8. fad16] re2\fermata
    si''2\f la

    %8
    sol4 r r2
    la2 sol
    fad4 r r2

    %11
    sol2 fad
    mid4 r r2
    r8. fad16\p[fad8. sol16] mi8.[mi16 mi8. fad16]

    %14
    re4 r r2
    r8. fad,16\pp[fad8. sol16] mi8.[mi16 mi8. fad16]
    re4 r r2\mbreak

    %17
    r4 fad\f fad fad
    re'8_\upl [dod_\upl si_\upl la_\upl sol_\upl fad_\upl mi_\upl re_\upl]
    mi'_\upl[re_\upl dod_\upl si_\upl lad_\upl sold_\upl fad_\upl mi_\upl]

    %20
    re4 r8 fad' si re, fad, lad'
    si8. [re,16 re8. re16] red8. [red16 red8. red16]
    mi8. [mi16 mi8. mi16] fad8. [fad16 fad8. fad16]

    %23
    fad8. [fad16 fad8. sol16] lad,8. [lad16 lad8. lad16]
    \once\set suggestAccidentals = ##t lad?8. [lad16 lad8. lad16] si8. [si16 si8. si16]
    dod8. [dod16 dod8. dod16] mi8. [mi16 mi8. mi16]

    %26
    re8. [re16 re8. re16] red8. [red16 red8. red16]
    mi8. [mi16 mi8. mi16] fad8. [fad16 fad8. fad16]
    fad8. [fad16 fad8. sol16]  lad,8. [lad16 lad8. lad16]

    %29
    \once\set suggestAccidentals = ##t lad?8. [lad16 lad8. lad16] si8. [si16 si8. si16]
    dod8. [dod16 dod8. dod16] mi8. [mi16 mi8. mi16]
    re8. [re,16 re8. re16] re4 fad\mbreak

    %32
    fad fad re'8\upl dod\upl si\upl la\upl
    sol_\upl fad_\upl mi_\upl re_\upl mi' re dod si
    lad sold fad mi re4 re'

    %35
    mid, dod' la?8 fad la dod
    fad dod la fad dod'4 dod,
    fad8. fad16 fad4 r8. fad16 [fad8. fad16]

    %38
    si'8. [si,16 si8. si16] si8. [si16 dod8. red16]
    mi2 re
    dod r8. mi16[mi8. mi16]

    %41
    fad8. [fad16 fad8. fad16] mi8.[mi16 mi8. mi16]
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] fad8. [fad16 fad8. fad16]

    %44
    re8.[re16 re8. re16] dod8.[dod16 dod8. dod16]
    dod8.[dod16 dod8. dod16] re8.[re16 re8. re16]
    mi8.[mi16 mi8. mi16] \mbreak mi8.[mi16 mi8. mi16]

    %47
    fad8. [fad16 fad8. fad16]  fad8. [fad16 fad8. fad16]
    si,8.[si16 si8. si16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]

    %50
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    mi8.[mi16 mi8. mi16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] si8.[si16 si8. si16]

    %53
    si8.[si16 si8. si16] dod8.[dod16 dod8. dod16]
    dod8.[dod16 dod8. dod16] mi8.[mi16 mi8. mi16]
    re8.[re16 re8. si16] fad'2~

    %56
    fad mi~
    mi re~
    re\mbreak dod~

    %59
    dod si~
    si1
    lad8.[lad16 lad8. lad16] si4 fad'8. fad16  %% crome

    %62
    fad8. [fad16 fad8. fad16] mi8.[mi16 mi8. mi16]
    mi8.[mi16 mi8. mi16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] dod8.[dod16 dod8. dod16]

    %65
    dod8.[dod16 dod8. dod16] si8.[si16 si8. si16]
    si8.[si16 si8. si16] si4 lad
    si fad fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si si,

    %71
    fad' fad\mbreak si,8.[si'16 si8. re16]
    re8.[fad16 fad8. si16] si8.[fad16\p fad8. sol16]
    mi8.[mi16 mi8. fad16] re4 r

    %74
    r2 r8 si'8\f dod, lad'
    si4\fermata r r2

}

IIvlIIn = \relative do'' {

    R1
    fad8.[fad,16 fad8. fad16] fad8.[fad16 sold8. lad16]
    si1

    %4
    lad2 r8. re16\p[re8. re16]
    dod8.[dod16 dod8. re16] si8.[re,16\pp re8. mi16]
    dod8.[dod16 dod8. re16] si2\fermata

    %7
    fad''1\f
    mi4 r r2
    mi1

    %10
    re4 r r2
    re1
    dod4 r r2

    %13
    r8. dod16\p[re8. mi16] dod8. [dod16 dod8. re16]
    si4 r r2
    r8. re,16\pp[re8. mi16] dod8.[dod16 dod8. re16]
    si4 r r2\mbreak

    %17
    r4 fad'\f fad fad
    re'8_\upl [dod_\upl si_\upl la_\upl sol_\upl fad_\upl mi_\upl re_\upl]
    mi'_\upl[re_\upl dod_\upl si_\upl lad_\upl sold_\upl fad_\upl mi_\upl]

    %20
    re4 r8 re' fad[re lad dod]
    re8.[fad,16 fad8. fad16] fad8.[fad16 fad8. fad16]
    sol8.[sol16 sol8. sol16] si8.[si16 si8. si16]

    %23
    re8.[re16 re8. mi16] dod8. [dod16 dod8. dod16]
    dod8. [dod16 dod8. dod16] re8.[re16 re8. re16]
    fad8.[fad16 fad8. fad16] dod8. [dod16 dod8. dod16]

    %26
    fad,8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    sol8.[sol16 sol8. sol16] si8.[si16 si8. si16]
    re8.[re16 re8. mi16] dod8. [dod16 dod8. dod16]

    %29
    dod8. [dod16 dod8. dod16] re8.[re16 re8. re16]
    fad8.[fad16 fad8. fad16] dod8. [dod16 dod8. dod16]
    si8.[si,16 si8. si16] si4 fad'\mbreak

    %32
    fad fad re'8\upl dod\upl si\upl la\upl
    sol_\upl fad_\upl mi_\upl re_\upl mi' re dod si
    lad sold fad mi re4 re'

    %35
    mid, dod' la?8 fad la dod
    fad dod la fad dod'4 dod,
    fad'8.[fad,16 fad8. fad16] fad8.[fad16 sold8. lad16]

    %38
    si2 la?
    sol? sold'
    mi r8. dod16[dod8. dod16]

    %41
    la8.[re16 re8. re16] re8.[re16 dod8. dod16]
    re8.[la16 la8. la16] la8.[la16 la8. la16]
    si8.[si16 si8. si16] re8.[re16 re8. re16]

    %44
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    dod8. [dod16 dod8. dod16] ]\mbreak la8.[la16 la8. la16]

    %47
    la8.[la16 la8. la16]  la8.[la16 la8. la16]
    sol8.[sol16 sol8. sol16] fad8.[fad16 fad8. fad16]
    fad8.[fad16 fad8. fad16] dod'8. [dod16 dod8. dod16]

    %50
    mi,8.[mi16 mi8. mi16] fad8.[fad16 fad8. fad16]
    sol8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]

    %53
    sol8.[sol16 sol8. sol16] sold8.[sold16 sold8. sold16]
    la8.[la16 la8. la16] lad8.[lad16 lad8. lad16]
    si8.[si16 si8. si16] si4 r8 si

    %56
    si1
    la
    sol

    %59
    fad
    dod'
    dod8. [dod16 dod8. dod16] re4 si8. si16

    %62
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    sol8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]

    %65
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    sold8.[sold16 sold8. sold16] fad8.[fad16 fad8. fad16]
    fad4 fad fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si si,

    %71
    fad' fad\mbreak si,8.[fad'16 fad8. si16]
    si8.[re16 re8. fad16] fad8.[re16\p re8. mi16]
    dod8.[dod16 dod8. re16] si4 r

    %74
    r2 r8 si'8\f dod, lad'
    si4\fermata r r2

}

IIvlaIn = \relative do' {

    si'8.[si,16 si8. si16] si8.[dod16 re8. mi16]
    fad2 mi
    re dod8.[si16 la8. sol16]

    %4
    fad1~
    fad~
    fad\fermata

    %7
    re''2\f red
    si4 r r2
    dod1

    %10
    la4 r r2
    si1
    sold4 r r2

    %13
    r8. lad16\p[si8. si16] dod8. [lad16 lad8. fad16]
    fad4 r r2
    r8. si,16\pp[si8. si16] dod8.[lad16 lad8. fad16]

    %16
    fad4 r r2\mbreak
    r4 fad\f fad fad
    re'8_\upl [dod_\upl si_\upl la_\upl sol_\upl fad_\upl mi_\upl re_\upl]

    %19
    mi'_\upl[re_\upl dod_\upl si_\upl lad_\upl sold_\upl fad_\upl mi_\upl]
    re4 r8 si'' re si dod, fad
    fad8.[fad16 fad8. fad 16] fad8.[fad16 fad8. fad 16]

    %22
    mi8.[mi16 mi8. mi16] re8.[re16 re8. re16]
    re8.[re16 dod8. si16] lad8.[fad'16 fad8. fad16]
    fad8.[fad16 fad8. fad 16] si8.[si16 si8. si16]

    %25
    lad8.[lad16 lad8. lad16] lad8.[lad16 lad8. lad16]
    fad8.[fad16 fad8. fad 16] fad8.[fad16 fad8. fad 16]
    mi8.[mi16 mi8. mi16] re8.[re16 re8. re16]

    %28
    re8.[re16 dod8. si16] lad8.[fad'16 fad8. fad16]
    fad8.[fad16 fad8. fad 16] si8.[si16 si8. si16]
    lad8.[lad16 lad8. lad16] lad8.[lad16 lad8. lad16]
    fad8.[fad,16  fad8. fad16] fad4 fad

    %32
    fad fad re'8\upl dod\upl si\upl la\upl
    sol_\upl fad_\upl mi_\upl re_\upl mi' re dod si
    lad sold fad mi re4 re'

    %35
    mid, dod' la?8 fad la dod
    fad dod la fad dod'4 dod,
    fad8.[fad16] fad4 r8. dod'16[dod8. dod16]

    %38
    re8. re16 re4 r8. fad16[fad8. fad16]
    mi'8.[mi,16 mi8. mi16] mi8.[mi16 fad8. sold16]
    la2 sol!

    %41
    fad8.[la16 la8. la16] la8.[la16 la8. la16]
    fad8.[fad16  fad8. fad16] fad8.[fad16  fad8. fad16]
    sol8.[sol16 sol8. sol16] fad8.[fad16  fad8. fad16]

    %44
    fad8.[fad16 mi8. re16] mi8.[mi16 mi8. mi16]
    mi8.[mi16 mi8. mi16] re8.[re16 re8. re16]
    dod8.[dod16 dod8. dod16]\mbreak re8.[re16 re8. re16]

    %47
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] mi8.[mi16 mi8. mi16]

    %50
    dod8.[dod16 dod8. dod16] re8.[re16 re8. re16]
    dod8.[dod16 dod8. dod16]  dod8.[dod16 dod8. dod16]
    la8.[la16 la8. la16] fad'8.[fad16 mi8. re16]

    %53
    mi8.[mi16 mi8. mi16] sold8.[sold16 sold8. sold16]
    fad8.[fad16  fad8. fad16] fad8.[fad16  fad8. fad16]
    fad8.[fad16  fad8. fad16] fad4 r8 re

    %56
    re2 mi
    dod re
    si\mbreak dod

    %59
    la si
    sold1
    fad8.[fad'16 fad8. fad16] fad4 re8. re16

    %62
    re8.[re16 re8. re16] mi8.[mi16 mi8. mi16]
    dod8.[dod16 dod8. dod16] re8.[re16 re8. re16]
    si8.[si16 si8. si16] dod8.[dod16 dod8. dod16]

    %65
    la8.[la16 la8. la16] si4. re8
    dod8.[dod16 dod8. dod16] dod8.[dod16 dod8. dod16]
    re4 fad fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si si,

    %71
    fad' fad,\mbreak si8.[re16 re8. fad16]
    fad8.[si16 si8. re16] re8.[si16\p si8. si16]
    lad8.[lad16 lad8. fad16] fad4 r

    %74
    r2 r8 re\f fad fad
    re4\fermata r r2

}

IIsopranoIn = \relative do'' {

    \autoBeamOff
    R1*27
    r2 fad
    mi re

    %30
    dod fad,8. fad16 sol8. la16
    si4 si r fad\mbreak
    fad fad re'8 [dod si la]

    %33
    sol [fad mi re_] mi' [re dod si]
    lad [sold fad mi] re4 re'

    %35
    \parenthesize mid, dod' la?8 [fad la dod]
    fad [dod] la fad dod'4 dod,
    fad r r2

    %38
    R1*9
    re'2 do
    si la

    %49
    re,8. mi16 fad8. sol16 la4 la
    la2 la
    la la4 la8 sol

    %52
    fad4 fad si si8 la
    sol4 sol dod4 dod8 si
    la4 la8 fad mi'2

    %55
    re4 r8 si fad'2~
    fad mi~
    mi re~

    %58
    re\mbreak dod~
    dod si~
    si si

    %61
    lad r4 fad'8. fad16
    fad4 si, mi8. mi16 mi8. mi16
    mi4 la, re8. re16 re8. re16

    %64
    re4 sol, r8 dod dod8. dod16
    dod4 fad, r8 si si8. si16
    si4 si8 si si4(lad)

    %67
    si fad fad fad
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]

    %70
    re4 fad si re
    dod2\mbreak re
    R1*4

}

IItestoI = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bellum _ pe - - - - - - - - - dum tu -- o - rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pe -- dum tu -- orum _

    sca -- bel -- lum pe -- dum sca -- bel -- lum pe -- dum tu -- o -- rum

    sca -- bel - - - lum pe -- dum.

    Do -- nec po -- nam ini - mi -- cos tu -- os ini - mi -- cos tu -- os

    sca -- bellum _ pe -- dum sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bellum _ pe - - - dum tu -- o -- rum.

}

IIaltoIn = \relative do' {

    \autoBeamOff
    R1*25
    si'2 la
    sol fad

    %28
    si,8. dod16 re8. mi16 fad4 fad
    fad1
    fad4 fad fad fad8. fad16

    %31
    fad4 fad r fad\mbreak
    fad fad re'8 [dod si la]

    %33
    sol [fad mi re] mi' [re dod si]
    lad [sold fad mi] re4 re'

    %35
    mid, dod' la?8 [fad la dod]
    fad, [dod'] la fad dod'4 dod,
    fad r r2

    %38
    R1*6
    r2 la
    sol fad

    %46
    mi\mbreak la,8. la16 si8. dod16
    re4 re re2
    re re

    %49
    fad4 mi8 re dod4 dod
    r2 r4 la
    dod mi la la,

    %52
    r2 fad'4 fad8 fad
    mi4 mi sold sold8 sold
    fad4 fad8 fad lad2

    %55
    fad4 r r r8 si
    si1
    la

    %58
    sol
    fad
    dod2 dod

    %61
    dod r4 si'8. si16
    si4 sol si8. si16 si8. si16
    la4 fad la8.  la16 la8. la16

    %64
    sol4 mi r8 sol sol8. sol16
    fad4 re r8 fad fad8. fad16
    sold4 sold8 sold fad2

    %67
    fad4 fad fad fad
    re'8 [dod si la sol fad mi re]
    mi[re' dod si lad sold fad mi]

    %70
    re4 fad si si
    si(lad)\mbreak si2
    R1*4

}

IItestoII = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel -- lum pe - - - - - - - - - dum tu -- o - rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pe -- dum  tu -- o -- rum

    sca -- bel -- lum pe -- dum sca -- bel -- lum pe -- dum sca -- bel -- lum pe -- dum

    tu -- o -- rum sca -- bel - - - lum pe -- dum.

    Do -- nec po -- nam ini - mi -- cos tu -- os ini - mi -- cos tu -- os

    sca -- bellum _ pe -- dum sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bellum _ pe - - - dum tu -- o -- rum.

}

IItenoreIn = \relative do' {

    \autoBeamOff

    R1*22
    r2 fad
    mi re

    %25
    dod fad,8. fad16 sol8. la16
    si4 si si2~
    si si4 si

    %28
    re dod8. si16 lad4 lad
    r2 r4 fad
    lad dod fad fad,

    %31
    r2 r4 fad\mbreak
    fad fad re'8 [dod si la]

    %33
    sol [fad mi re] mi' [re dod si]
    lad [sold fad mi] re4 re'

    %35
    mid, dod' la?8 [fad la dod]
    fad[dod] la fad dod'4 dod,
    fad r r2

    %38
    R1*4
    re'2 do
    si la

    %44
    re,8. mi16 fad8. sol16 la4 la
    la2 la
    la\mbreak la4 fad8 mi

    %47
    re4 re r2
    r4 re fad la
    re re, r la'

    %50
    dod mi fad re
    R1
    r2 si4 si8 si

    %53
    si4 si dod dod8 dod
    dod4 dod8 dod dod2
    si4 r r r8 re

    %56
    re2 mi
    dod re
    si\mbreak dod

    %59
    la si
    sold sold
    lad r4 re8. re16

    %62
    re4 re mi8. mi16 mi8. mi16
    dod4 dod re8. re16 re8. re16
    si4 si\mbreak r8 dod dod8. dod16

    %65
    la4 la r8 si si8. re16
    dod4 dod8 dod dod2
    re4 fad, fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si fad'

    %71
    fad2\mbreak fad
    R1*4

}

IItestoIII = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel -- lum pe -- dum sca -- bel -- lum pe - - - - - - - - -  dum  u -- o - rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pe -- dum  tu -- o -- rum

    sca -- bel -- lum pe -- dum sca -- bel -- lum pe -- dum sca -- bel -- lum pe -- dum

    sca -- bel -- lum pe -- dum tu -- o -- rum

    sca -- bel - - - - - - - lum pe -- dum.

    Do -- nec po -- nam ini - mi -- cos tu -- os ini - mi -- cos tu -- os

    sca -- bellum _ pe -- dum sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel -- lum pe - - - dum tu -- o -- rum.

}

IIbassoIn = \relative do {

    \autoBeamOff
    R1*20
    si'2 la
    sol fad

    %23
    si,8. dod16 re8. mi16 fad4 fad
    fad2 ~ fad
    fad4 fad fad8.[mi16] re8. dod16

    %26
    si4 si r2
    r4 si re fad
    si si, r2

    %29
    R1*2
    r2 r4 fad'\mbreak

    %32
    fad fad re'8 [dod si la]
    sol [fad mi re] mi' [re dod si]
    lad [sold fad mi] re4 re'

    %35
    mid, dod' la?8 [fad la dod]
    fad [dod] la fad dod'4 dod,
    fad r r2

    %38
    R1*4
    r2 re
    re re

    %44
    re4 dod8 si la4 la
    r2 r4 la
    dod mi\mbreak la la,

    %47
    r re fad la
    re re, r2
    r la'

    %50
    sol fad
    mi la,8. la16 si8. dod16
    re4 re red red8 red

    %53
    mi4 mi mid mid8 mid
    fad4 fad8 fad fad2
    si,4 r r r8 si

    %56
    sol'1
    fad
    mi

    %59
    re
    dod2 dod
    fad r4 si,8. si16

    %62
    sol'4 sol sol8. sol16 sol8. sol16
    fad4 fad fad8. fad16 fad8. fad16
    mi4 mi r8 mi mi8. mi16

    %65
    re4 re r8 re re8. re16
    mid4 mid8 mid fad2
    si,4 fad' fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si si,

    %71
    fad'2\mbreak si,2
    R1*4

}

IItestoIV = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel -- lum pe -- dum sca -- bel -- lum pe - - - - - - - - -  dum  tu -- o - rum

    sca -- bel -- lum pe -- dum tu -- o -- rum sca -- bel -- lum pe -- dum

    sca -- bel -- lum pe -- dum.

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pe -- dum

    sca -- bel -- lum pe -- dum tu -- o -- rum sca -- bel - - - lum pe -- dum.

    Do -- nec po -- nam ini - mi -- cos tu -- os ini - mi -- cos tu -- os

    sca -- bellum _ pe -- dum sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel -- lum pe - - - dum tu -- o -- rum.

}

IIbcIn = \relative do {

    R1*6
    si'8.\f[si,16 si8. si16] si8. [si16 dod8. red16]
    mi4 r r2

    %9
    la8.[la,16 la8. la16] la8. [la16 si8. dod16]
    re4 r r2
    sol8.[sol,16 sol8. sol16] sol8. [sol16 la8. si16]

    %12
    dod4 r r2
    fad,1\p^\tasto~
    fad~

    %15
    fad~
    fad~\mbreak
    fad4 fad'\f fad fad

    %18
    re'8\upl [dod\upl si\upl la\upl sol\upl fad\upl mi\upl re\upl]
    mi'\upl[re\upl dod\upl si\upl lad\upl sold\upl fad\upl mi\upl]
    re4 r8 si' si si, fad' fad,

    %21
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    si8.[si16 la8. sol16] fad8.[fad'16 fad8. fad16]

    %24
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    fad8.[fad16 fad8. fad16] fad8.[mi16 re8. dod16]
    si8.[si16 si8. si16] si8.[si16 si8. si16]

    %27
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    si8.[si16 la8. sol16] fad8.[fad'16 fad8. fad16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]

    %30
    fad8.[fad16 fad8. fad16] fad8.[mi16 re8. dod16]
    si8.[si16 si8. si16] si4 fad'\mbreak

    %32
    fad fad re'8\upl dod\upl si\upl la\upl
    sol\upl fad\upl mi\upl re\upl mi' re dod si
    lad sold fad mi re4 re'

    %35
    mid, dod' la?8 fad la dod
    fad dod la fad dod'4 dod,
    fad8. fad16 fad4 r8. fad16 [fad8. fad16]

    %38
    si,8. si16 si4 r8. si'16[si8. si16]
    mi,8.[mi16] mi4 r8. mi'16[mi8. mi16]
    la,8.[la,16 la8. la16] la8. [la16 si8. dod16]

    %41
    re8.[re16 re8. re16] la'8.[la16 la,8. la16]
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] re8.[re16 re8. re16]

    %44
    re8.[re16 dod8. si16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    la8.[la16 la8. la16]\mbreak la'8.[sol16 fad8. mi16]

    %47
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 dod8. si16] la8.[la16 la8. la16]

    %50
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] la8. [la16 si8. dod16]
    re8.[re16 re8. re16] red8.[red16 red8. red16]

    %53
    mi8.[mi16 mi8. mi16] mid8.[mid16 mid8. mid16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    si,8.[si16 si8. si16] si8.[si16 si8. si16]

    %56
    sol'8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    mi8.[mi16 mi8. mi16]\mbreak mi8.[mi16 mi8. mi16]

    %59
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    dod8.[dod16 dod8. dod16] dod8.[dod16 dod8. dod16]
    fad8.[fad16 fad8. fad16] si,8.[si16 si8. si16]

    %62
    sol'8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    mi8.[mi16 mi8. mi16] mi8.[mi16 mi8. mi16]

    %65
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    mid8.[mid16 mid8. mid16] fad8.[fad16 fad,8. fad16]
    si4 fad' fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si si,

    %71
    fad' fad,\mbreak si8.[si16 si8. si16]
    si8.[si16 si8. si16] si8.\p[si16 si8. si16]
    fad'8.[fad16 fad8. fad16] si,4 r

    %74
    r2 r8 si8\f fad' fad,
    si4\fermata r2

}

IIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*6
    s2 <7 _+>
    s1
    s2 <7>
    s1
    s2 <7>
    <_+>1
    s1*7
    s2  s4 <_+>
    s2 <7 3+>
    <6 4> <5 3>
    s <_+>
    <7 5> <6 4>
    <5 3+>s
    s <7 _+>
    <6 4> <5 3>
    s <_+>
    < 7 5> <6 4>
    <5 3+> s
    s1*4
    <7>1 s
    s2 s8. <_+>16 s4
    s2 s8. <7 _+>16 s4
    s2 s8. <7 _+>16 s4
    s2 <7!>
    s <5 4>4 <3>
    s2 <7->
    <6 4> <5 3>
    s1
    <7 5>2 <6 4>
    <5 3> s
    s <7->
    <6 4> <5 3>
    s1
    <7>2 <6 4>
    <5 3> s
    s <6>4 <6 5>
    s2 s4 <6 5>
    s2 <7 _+>
    s1
    <7>2 <6>
    <7> <6>
    <7> <6>
    <7> <6>
    <7 _+> s
    <_+> s
    <7>2 <6>
    <7> <6>
    <7> <6>
    <7> <6>
    <6 5> <5 4>4 <3+>
    s1*6
    <7 _+>1

}


IIvlIIIn = \relative do'' {

    R1*2
    si'8.[si,16 si8. si16] si8.[dod16 re8. mi16]
    fad2 r8. fad16\p[fad8. sol16]

    %5
    mi8.[mi16 mi8. fad16] re8.[fad,16\pp fad8. sol16]
    mi8.[mi16 mi8. fad16] re2\fermata
    si''2\f la

    %8
    mi re
    R1
    re2 do

    %11
    si4 r r2
    dod?2 si
    lad4 r r2

    %14
    r8. fad'16\p[fad8. sol16] mi8.[mi16 mi8. fad16]
    re4 r r2
    r8. fad,16\pp[fad8. sol16] mi8.[mi16 mi8. fad16]\mbreak

    %17
    re4 fad\f fad fad
    re'8_\upl [dod_\upl si_\upl la_\upl sol_\upl fad_\upl mi_\upl re_\upl]
    mi'_\upl[re_\upl dod_\upl si_\upl lad_\upl sold_\upl fad_\upl mi_\upl]

    %20
    re4 r8 fad' si re, fad, lad'
    si8. [re,16 re8. re16] red8. [red16 red8. red16]
    mi8. [mi16 mi8. mi16] fad8. [fad16 fad8. fad16]

    %23
    fad8. [fad16 fad8. sol16] lad,8. [lad16 lad8. lad16]
    \once\set suggestAccidentals = ##t lad?8. [lad16 lad8. lad16] si8. [si16 si8. si16]
    dod8. [dod16 dod8. dod16] mi8. [mi16 mi8. mi16]

    %26
    re8. [re16 re8. re16] red8. [red16 red8. red16]
    mi8. [mi16 mi8. mi16] fad8. [fad16 fad8. fad16]
    fad8. [fad16 fad8. sol16]  lad,8. [lad16 lad8. lad16]

    %29
    \once\set suggestAccidentals = ##t lad?8. [lad16 lad8. lad16] si8. [si16 si8. si16]
    dod8. [dod16 dod8. dod16] mi8. [mi16 mi8. mi16]
    re8. [re,16 re8. re16] re4 fad\mbreak

    %32
    fad fad re'8\upl dod\upl si\upl la\upl
    sol_\upl fad_\upl mi_\upl re_\upl mi' re dod si
    lad sold fad mi re4 re'

    %35
    mid, dod' la?8 fad la dod
    fad dod la fad dod'4 dod,
    fad8. fad16 fad4 r8. fad16 [fad8. fad16]

    %38
    si'8. [si,16 si8. si16] si8. [si16 dod8. red16]
    mi2 re
    dod r8. mi16[mi8. mi16]

    %41
    fad8. [fad16 fad8. fad16] mi8.[mi16 mi8. mi16]
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] fad8. [fad16 fad8. fad16]

    %44
    re8.[re16 re8. re16] dod8.[dod16 dod8. dod16]
    dod8.[dod16 dod8. dod16] re8.[re16 re8. re16]
    mi8.[mi16 mi8. mi16] \mbreak mi8.[mi16 mi8. mi16]

    %47
    fad8. [fad16 fad8. fad16]  fad8. [fad16 fad8. fad16]
    si,8.[si16 si8. si16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]

    %50
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    mi8.[mi16 mi8. mi16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] si8.[si16 si8. si16]

    %53
    si8.[si16 si8. si16] dod8.[dod16 dod8. dod16]
    dod8.[dod16 dod8. dod16] mi8.[mi16 mi8. mi16]
    re8.[re16 re8. si16] r4 fad'8. fad16

    %56
    fad8. [fad16 fad8. fad16] mi8.[mi16 mi8. mi16]
    mi8.[mi16 mi8. mi16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] \mbreak dod8.[dod16 dod8. dod16]

    %59
    dod8.[dod16 dod8. dod16] si8.[si16 si8. si16]
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    lad8.[lad16 lad8. lad16] fad'2 ~%% come sta

    %62
    fad mi~
    mi re~
    re dod~

    %65
    dod si~
    si si4 lad
    si fad fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si si,

    %71
    fad' fad\mbreak si8.[si16 si8. re16]
    re8.[fad16 fad8. si16] si4 r
    r2 r8. fad16\pp[fad8. sol16]

    %74
    mi8.[mi16 mi8. fad16] re8 si'\f dod, lad'
    si4\fermata r r2

}

IIvlIVn = \relative do'' {

    R1
    fad8.[fad,16 fad8. fad16] fad8.[fad16 sold8. lad16]
    si1

    %4
    lad2 r8. re16\p[re8. re16]
    dod8.[dod16 dod8. re16] si8.[re,16\pp re8. mi16]
    dod8.[dod16 dod8. re16] si2\fermata

    %7
    fad''1\f
    si,
    R

    %10
    la
    sol4 r r2
    sold1

    %13
    fad4 r r2
    r8. re'16\p[re8. mi16] dod8. [dod16 dod8. re16]
    si4 r r2
    r8. re,16\pp[re8. mi16] dod8.[dod16 dod8. re16]\mbreak

    %17
    si4 fad'\f fad fad
    re'8_\upl [dod_\upl si_\upl la_\upl sol_\upl fad_\upl mi_\upl re_\upl]
    mi'_\upl[re_\upl dod_\upl si_\upl lad_\upl sold_\upl fad_\upl mi_\upl]

    %20
    re4 r8 re' fad[re lad dod]
    re8.[fad,16 fad8. fad16] fad8.[fad16 fad8. fad16]
    sol8.[sol16 sol8. sol16] si8.[si16 si8. si16]

    %23
    re8.[re16 re8. mi16] dod8. [dod16 dod8. dod16]
    dod8. [dod16 dod8. dod16] re8.[re16 re8. re16]
    fad8.[fad16 fad8. fad16] dod8. [dod16 dod8. dod16]

    %26
    fad,8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    sol8.[sol16 sol8. sol16] si8.[si16 si8. si16]
    re8.[re16 re8. mi16] dod8. [dod16 dod8. dod16]

    %29
    dod8. [dod16 dod8. dod16] re8.[re16 re8. re16]
    fad8.[fad16 fad8. fad16] dod8. [dod16 dod8. dod16]
    si8.[si,16 si8. si16] si4 fad'\mbreak

    %32
    fad fad re'8\upl dod\upl si\upl la\upl
    sol_\upl fad_\upl mi_\upl re_\upl mi' re dod si
    lad sold fad mi re4 re'

    %35
    mid, dod' la?8 fad la dod
    fad dod la fad dod'4 dod,
    fad'8.[fad,16 fad8. fad16] fad8.[fad16 sold8. lad16]

    %38
    si2 la?
    sol? sold'
    mi r8. dod16[dod8. dod16]

    %41
    la8.[re16 re8. re16] re8.[re16 dod8. dod16]
    re8.[la16 la8. la16] la8.[la16 la8. la16]
    si8.[si16 si8. si16] re8.[re16 re8. re16]

    %44
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    dod8. [dod16 dod8. dod16] ]\mbreak la8.[la16 la8. la16]

    %47
    la8.[la16 la8. la16]  la8.[la16 la8. la16]
    sol8.[sol16 sol8. sol16] fad8.[fad16 fad8. fad16]
    fad8.[fad16 fad8. fad16] dod'8. [dod16 dod8. dod16]

    %50
    mi,8.[mi16 mi8. mi16] fad8.[fad16 fad8. fad16]
    sol8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]

    %53
    sol8.[sol16 sol8. sol16] sold8.[sold16 sold8. sold16]
    la8.[la16 la8. la16] lad8.[lad16 lad8. lad16]
    si8.[si16 si8. fad16] r4 si8. si16

    %56
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    sol8.[sol16 sol8. sol16]\mbreak sol8.[sol16 sol8. sol16]

    %59
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    dod'8. [dod16 dod8. dod16] dod8. [dod16 dod8. dod16]
    dod8. [dod16 dod8. dod16] r4 r8 si

    %62
    si1
    la
    sol

    %65
    fad
    sold2 fad
    fad4 fad fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si si,

    %71
    fad' fad\mbreak si,8.[fad'16 fad8. si16]
    si8.[re16 re8. fad16] fad4 r
    r2 r8. re16\pp[re8. mi16]

    %74
    dod8.[dod16 dod8. re16] si8 si'\f dod, lad'
    si4\fermata r r2

}

IIvlaIIn = \relative do' {

    si'8.[si,16 si8. si16] si8.[dod16 re8. mi16]
    fad2 mi
    re dod8.[si16 la8. sol16]

    %4
    fad1~
    fad~
    fad\fermata

    %7
    re''2\f red
    sol,2 sold
    R1
    fad1 re4 r r2
    mid1
    dod4 r r2
    r8. si'16\p [si8. si16] dod8.[lad16 lad8. fad16]
    fad4 r r2
    r8. si,16\pp [si8. si16] dod8.[lad16 lad8. fad16]\mbreak
    fad4 fad\f fad fad
    re'8_\upl [dod_\upl si_\upl la_\upl sol_\upl fad_\upl mi_\upl re_\upl]

    %19
    mi'_\upl[re_\upl dod_\upl si_\upl lad_\upl sold_\upl fad_\upl mi_\upl]
    re4 r8 si'' re si dod, fad
    fad8.[fad16 fad8. fad 16] fad8.[fad16 fad8. fad 16]

    %22
    mi8.[mi16 mi8. mi16] re8.[re16 re8. re16]
    re8.[re16 dod8. si16] lad8.[fad'16 fad8. fad16]
    fad8.[fad16 fad8. fad 16] si8.[si16 si8. si16]

    %25
    lad8.[lad16 lad8. lad16] lad8.[lad16 lad8. lad16]
    fad8.[fad16 fad8. fad 16] fad8.[fad16 fad8. fad 16]
    mi8.[mi16 mi8. mi16] re8.[re16 re8. re16]

    %28
    re8.[re16 dod8. si16] lad8.[fad'16 fad8. fad16]
    fad8.[fad16 fad8. fad 16] si8.[si16 si8. si16]
    lad8.[lad16 lad8. lad16] lad8.[lad16 lad8. lad16]
    fad8.[fad,16  fad8. fad16] fad4 fad

    %32
    fad fad re'8\upl dod\upl si\upl la\upl
    sol_\upl fad_\upl mi_\upl re_\upl mi' re dod si
    lad sold fad mi re4 re'

    %35
    mid, dod' la?8 fad la dod
    fad dod la fad dod'4 dod,
    fad8.[fad16] fad4 r8. dod'16[dod8. dod16]

    %38
    re8. re16 re4 r8. fad16[fad8. fad16]
    mi'8.[mi,16 mi8. mi16] mi8.[mi16 fad8. sold16]
    la2 sol!

    %41
    fad8.[la16 la8. la16] la8.[la16 la8. la16]
    fad8.[fad16  fad8. fad16] fad8.[fad16  fad8. fad16]
    sol8.[sol16 sol8. sol16] fad8.[fad16  fad8. fad16]

    %44
    fad8.[fad16 mi8. re16] mi8.[mi16 mi8. mi16]
    mi8.[mi16 mi8. mi16] re8.[re16 re8. re16]
    dod8.[dod16 dod8. dod16]\mbreak re8.[re16 re8. re16]

    %47
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] mi8.[mi16 mi8. mi16]

    %50
    dod8.[dod16 dod8. dod16] re8.[re16 re8. re16]
    dod8.[dod16 dod8. dod16]  dod8.[dod16 dod8. dod16]
    la8.[la16 la8. la16] fad'8.[fad16 mi8. re16]

    %53
    mi8.[mi16 mi8. mi16] sold8.[sold16 sold8. sold16]
    fad8.[fad16  fad8. fad16] fad8.[fad16  fad8. fad16]
    fad8.[fad16  fad8. re16] r4 re8. re16

    %56 OOKK
    re8.[re16 re8. re16] mi8.[mi16 mi8. mi16]
    dod8.[dod16 dod8. dod16] re8.[re16 re8. re16]
    si8.[si16 si8. si16] \mbreak dod8.[dod16 dod8. dod16]

    %59
    la8.[la16 la8. la16] si8.[si16 si8. si16]
    sold8.[sold16 sold8. sold16] sold8.[sold16 sold8. sold16]
    fad8.[fad16  fad8. fad16] r4 r8 re'
    re2 mi
    dod re
    si dod
    la si4. re8
    dod1
    re4 fad fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si si,

    %71
    fad' fad,\mbreak si8.[re16 re8. fad16]
    fad8.[si16 si8. re16] re4 r
    r2 r8. si16\pp[si8. si16]

    %74
    lad8.[lad16 lad8. fad16] fad8 re\f fad fad
    fad4\fermopz r r2

}

IIsopranoIIn = \relative do'' {

    \autoBeamOff
    R1*27
    r2 fad
    mi re

    %30
    dod fad,8. fad16 sol8. la16
    si4 si r fad\mbreak
    fad fad re'8\upl [dod\upl si\upl la\upl]

    %33
    sol_\upl [fad_\upl mi_\upl re_\upl] mi' [re dod si]
    lad [sold fad mi] re4 re'

    %35
    \parenthesize mid, dod' la?8 [fad la dod]
    fad [dod] la fad dod'4 dod,
    fad r r2

    %38
    R1*9
    re'2 do
    si la

    %49
    re,8. mi16 fad8. sol16 la4 la
    la2 la
    la la4 la8 sol

    %52
    fad4 fad si si8 la
    sol4 sol dod4 dod8 si
    la4 la8 fad mi'2

    %55
    re4 r r fad8. fad16
    fad4 si, mi8. mi16 mi8. mi16
    mi4 la, re8. re16 re8. re16

    %58
    re4 sol,\mbreak r8 dod dod8. dod16
    dod4 fad, r8 si si8. si16
    si4 si8 si si2

    %61
    lad4 r8 fad fad'2~
    fad mi~
    mi re~

    %64
    re dod~
    dod si4 si
    si si8 si si4(lad)

    %67
    si fad fad fad
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]

    %70
    re4 fad si re
    dod2\mbreak re
    R1*4

}

IItestoV= \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bellum _ pe - - - - - - - - - dum tu -- o - rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pe -- dum tu -- orum _

    sca -- bel -- lum pe -- dum sca -- bel -- lum pe -- dum tu -- o -- rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os ini - mi -- cos tu -- os

    sca -- bellum _ pe -- dum sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel - - - - lum pe -- dum tu -- o -- rum

    sca -- bellum _ pe - - - dum tu -- o -- rum.

}

IIaltoIIn = \relative do' {

    \autoBeamOff
    R1*25
    si'2 la
    sol fad

    %28
    si,8. dod16 re8. mi16 fad4 fad
    fad1
    fad4 fad fad fad8. fad16

    %31
    fad4 fad r fad\mbreak
    fad fad re'8 [dod si la]

    %33
    sol [fad mi re] mi' [re dod si]
    lad [sold fad mi] re4 re'

    %35
    mid, dod' la?8 [fad la dod]
    fad, [dod'] la fad dod'4 dod,
    fad r r2

    %38
    R1*6
    r2 la
    sol fad

    %46
    mi\mbreak la,8. la16 si8. dod16
    re4 re re2
    re re

    %49
    fad4 mi8 re dod4 dod
    r2 r4 la
    dod mi la la,

    %52
    r2 fad'4 fad8 fad
    mi4 mi sold sold8 sold
    fad4 fad8 fad lad2

    %55
    fad4 r r si8. si16
    si4 sol si8. si16 si8. si16
    la4 fad la8. la16 la8. la16

    %58
    sol4 mi\mbreak r8 sol sol8. sol16
    fad4 re r8 fad fad8. fad16
    dod4 dod8 dod dod2

    %61
    dod r4 r8 si'
    si1
    la

    %64
    sol
    fad2. fad4
    sold sold8 sold fad2

    %67
    fad4 fad fad fad
    re'8 [dod si la sol fad mi re]
    mi[re' dod si lad sold fad mi]

    %70
    re4 fad si si
    si(lad)\mbreak si2
    R1*4

}

IItestoVI = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel -- lum pe - - - - - - - - - dum tu -- o - rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pe -- dum  tu -- o -- rum

    sca -- bel -- lum pe -- dum sca -- bel -- lum pe -- dum sca -- bel -- lum pe -- dum

    tu -- o -- rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os ini - mi -- cos tu -- os

    sca -- bellum _ pe -- dum sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel - - - lum pe -- dum tu -- o -- rum

    sca -- bellum _ pe - - - dum tu -- o -- rum.

}

IItenoreIIn = \relative do' {

    \autoBeamOff
    R1*22
    r2 fad
    mi re

    %25
    dod fad,8. fad16 sol8. la16
    si4 si si2~
    si si4 si

    %28
    re dod8. si16 lad4 lad
    r2 r4 fad
    lad dod fad fad,

    %31
    r2 r4 fad\mbreak
    fad fad re'8 [dod si la]

    %33
    sol [fad mi re] mi' [re dod si]
    lad [sold fad mi] re4 re'

    %35
    mid, dod' la?8 [fad la dod]
    fad[dod] la fad dod'4 dod,
    fad r r2

    %38
    R1*4
    re'2 do
    si la

    %44
    re,8. mi16 fad8. sol16 la4 la
    la2 la
    la\mbreak la4 fad8 mi

    %47
    re4 re r2
    r4 re fad la
    re re, r la'

    %50
    dod mi fad re
    R1
    r2 si4 si8 si

    %53
    si4 si dod dod8 dod
    dod4 dod8 dod dod2
    si4 r r re8. re16

    %56
    re4 re mi8. mi16 mi8. mi16
    dod4 dod re8. re16 re8. re16
    si4 si\mbreak r8 dod dod8. dod16

    %59
    la4 la r8 si si8. si16
    sold4 sold8 sold sold2
    lad r4 r8 re

    %62
    re2 mi
    dod re
    si dod

    %65
    la si4 re
    dod dod8 dod dod2
    re4 fad, fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si fad'

    %71
    fad2\mbreak fad
    R1*4

}

IItestoVII = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel -- lum pe -- dum sca -- bel -- lum pe - - - - - - - - -  dum  tu -- o - rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pe -- dum  tu -- o -- rum

    sca -- bel -- lum pe -- dum sca -- bel -- lum pe -- dum sca -- bel -- lum pe -- dum

    sca -- bel -- lum pe -- dum tu -- o -- rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os ini - mi -- cos tu -- os

    sca -- bellum _ pe -- dum sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel - - - - - - - lum pe -- dum tu -- o -- rum

    sca -- bellum _ pe - - - dum tu -- o -- rum.

}

IIbassoIIn = \relative do {

    \autoBeamOff
    R1*20
    si'2 la
    sol fad

    %23
    si,8. dod16 re8. mi16 fad4 fad
    fad2 ~ fad
    fad4 fad fad8.[mi16] re8. dod16

    %26
    si4 si r2
    r4 si re fad
    si si, r2

    %29
    R1*2
    r2 r4 fad'\mbreak

    %32
    fad fad re'8 [dod si la]
    sol [fad mi re] mi' [re dod si]
    lad [sold fad mi] re4 re'

    %35
    mid, dod' la?8 [fad la dod]
    fad [dod] la fad dod'4 dod,
    fad r r2

    %38
    R1*4
    r2 re
    re re

    %44
    re4 dod8 si la4 la
    r2 r4 la
    dod mi\mbreak la la,

    %47
    r re fad la
    re re, r2
    r la'

    %50
    sol fad
    mi la,8. la16 si8. dod16
    re4 re red red8 red

    %53
    mi4 mi mid mid8 mid
    fad4 fad8 fad fad2
    si,4 r r si8. si16

    %56
    sol'4 sol sol8. sol16 sol8. sol16
    fad4 fad fad8. fad16 fad8. fad16
    mi4 mi\mbreak r8 mi mi8. mi16

    %59
    re4 re r8 re re8. re16
    mid4 mid8 mid mid2
    fad r4 r8 si,

    %62
    sol'1
    fad
    mi

    %65
    re2. re4
    mid mid8 mid fad2
    si,4 fad' fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si si,

    %71
    fad'2\mbreak si,2
    R1*4

}

IItestoVIII = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel -- lum pe -- dum sca -- bel -- lum pe - - - - - - - - -  dum  tu -- o - rum

    sca -- bel -- lum pe -- dum tu -- o -- rum sca -- bel -- lum pe -- dum

    sca -- bel -- lum pe -- dum.

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pe -- dum

    sca -- bel -- lum pe -- dum tu -- o -- rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os ini - mi -- cos tu -- os

    sca -- bellum _ pe -- dum sca -- bellum _ pe -- dum tu -- o -- rum

    sca -- bel - - - lum pe -- dum tu -- o -- rum

    sca -- bellum _ pe - - - dum tu -- o -- rum.

}

IIbcIIn = \relative do {

    R1*7
    mi8.\f[mi,16 mi8. mi16] mi8. [mi16 fad8. sol16]
    la4 r r2

    %10
    re8.[re,16 re8. re16] re8. [re16 mi8. fad16]
    sol4 r r2
    dod8.[dod,16 dod8. dod16] dod8. [dod16 red8. mid16]

    %13
    fad1\p^\tasto~
    fad~

    %15
    fad~
    fad~\mbreak
    fad4 fad'\f fad fad

    %18
    re'8\upl [dod\upl si\upl la\upl sol\upl fad\upl mi\upl re\upl]
    mi'\upl[re\upl dod\upl si\upl lad\upl sold\upl fad\upl mi\upl]
    re4 r8 si' si si, fad' fad,

    %21
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    si8.[si16 la8. sol16] fad8.[fad'16 fad8. fad16]

    %24
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    fad8.[fad16 fad8. fad16] fad8.[mi16 re8. dod16]
    si8.[si16 si8. si16] si8.[si16 si8. si16]

    %27
    si8.[si16 si8. si16] si8.[si16 si8. si16]
    si8.[si16 la8. sol16] fad8.[fad'16 fad8. fad16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]

    %30
    fad8.[fad16 fad8. fad16] fad8.[mi16 re8. dod16]
    si8.[si16 si8. si16] si4 fad'\mbreak

    %32
    fad fad re'8\upl dod\upl si\upl la\upl
    sol\upl fad\upl mi\upl re\upl mi' re dod si
    lad sold fad mi re4 re'

    %35
    mid, dod' la?8 fad la dod
    fad dod la fad dod'4 dod,
    fad8. fad16 fad4 r8. fad16 [fad8. fad16]

    %38
    si,8. si16 si4 r8. si'16[si8. si16]
    mi,8.[mi16] mi4 r8. mi'16[mi8. mi16]
    la,8.[la,16 la8. la16] la8. [la16 si8. dod16]

    %41
    re8.[re16 re8. re16] la'8.[la16 la,8. la16]
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] re8.[re16 re8. re16]

    %44
    re8.[re16 dod8. si16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    la8.[la16 la8. la16]\mbreak la'8.[sol16 fad8. mi16]

    %47
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re8.[re16 dod8. si16] la8.[la16 la8. la16]

    %50
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] la8. [la16 si8. dod16]
    re8.[re16 re8. re16] red8.[red16 red8. red16]

    %53
    mi8.[mi16 mi8. mi16] mid8.[mid16 mid8. mid16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    si,8.[si16 si8. si16] si8.[si16 si8. si16]

    %56
    sol'8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    mi8.[mi16 mi8. mi16]\mbreak mi8.[mi16 mi8. mi16]

    %59
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    mid8.[mid16 mid8. mid16] mid8.[mid16 mid8. mid16]
    fad8.[fad16 fad8. fad16] si,8.[si16 si8. si16]

    %62
    sol'8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]
    fad8.[fad16 fad8. fad16] fad8.[fad16 fad8. fad16]
    mi8.[mi16 mi8. mi16] mi8.[mi16 mi8. mi16]

    %65
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    mid8.[mid16 mid8. mid16] fad8.[fad16 fad,8. fad16]
    si4 fad' fad fad

    %68
    re'8 [dod si la sol fad mi re]
    mi'[re dod si lad sold fad mi]
    re4 fad si si,

    %71
    fad' fad,\mbreak si8.[si16 si8. si16]
    si8.[si16 si8. si16] si4 r
    r2 r8. si16\parenthesize \pp[si8. si16]

    %74
    fad'8.[fad16 fad8. fad16] si,8. si16\parenthesize \f  fad'8 fad,
    si4\fermopz r r2

}

IIbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*7
    s2 <7 _+>
    s1
    s2 <7->
    s1
    <_+>2 <7>
    s1*8
    s2  <7 _+>
    <6 4> <5 3>
    s <_+>
    <7 5> <6 4>
    <5 3+>s
    s <7 _+>
    <6 4> <5 3>
    s <_+>
    < 7 5> <6 4>
    <5 3+> s
    s1*4
    <7>1 s
    s2 s8. <_+>16 s4
    s2 s8. <7 _+>16 s4
    s2 s8. <7 _+>16 s4
    s2 <7!>
    s <5 4>4 <3>
    s2 <7- 5>
    <6 4> <5 3>
    s1
    <7 5>2 <6 4>
    <5 3> s
    s <7->
    <6 4> <5 3>
    s1
    <7>2 <6 4>
    <5 3> s
    s <6>4 <6 5>
    s2 s4 <6 5>
    s2 <7 _+>
    s1
    <7>2 <6>
    <7> <6>
    <7> <6>
    <7> <6>
    <6 5> s
    <_+> s
    <7>2 <6>
    <7> <6>
    <7> <6>
    <7> <6>
    <6 5> <5 4>4 <3+>
    s1*7
    <7 _+>1

}


forma = {

    \time 4/4
    \key si\minor
    \tempo 4 = 80
    s1*75
    \bar "|."

}

IIvlI = {
    \notypeset
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIvlaI = {
    \clef alto
    <<\IIvlaIn \forma>>

}

IIsopranoI = {
    \new Voice = "donec1"
    <<\IIsopranoIn \forma>>
}

IIaltoI = {
    \new Voice = "donec2"
    <<\IIaltoIn \forma>>
}

IItenoreI = {
    \new Voice = "donec3"
    <<\IItenoreIn \forma>>
}

IIbassoI = {
    \clef bass
    \new Voice = "donec4"
    <<\IIbassoIn \forma>>
}



IIbcI = {
    \clef bass
    <<\IIbcIn \forma \IIbfIn>>
}

IIvlIII = {
    <<\IIvlIIIn \forma>>

}

IIvlIV = {
    <<\IIvlIVn \forma>>

}

IIvlaII = {
    \clef alto
    <<\IIvlaIIn \forma>>

}

IIsopranoII= {
    \new Voice = "donec5"
    <<\IIsopranoIIn \forma>>
}

IIaltoII= {
    \new Voice = "donec6"
    <<\IIaltoIIn \forma>>
}

IItenoreII = {
    \new Voice = "donec7"
    <<\IItenoreIIn \forma>>
}

IIbassoII = {
    \clef bass
    \new Voice = "donec8"
    <<\IIbassoIIn \forma>>
}



IIbcII = {
    \clef bass
    <<\IIbcIIn \forma \IIbfIIn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IIIvlIn = \relative do'' {

   la'8
   \tuplet 3/2 { sol16(la si)} la8\noBeam r4 r r8 fad
   \tuplet 3/2 { mi16 (fad sol) } fad8\noBeam r4 r r8 la,
   re16 la fad' re la'8 [fad] fad\tr[mi] r4

   %4
   r2 r4 r8 la16(fad)
   red8 mi r4 r2
   re16\f re re re re dod si la sol8 r fad r

   %7
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r\mbreak re4 r8 la''
   \tuplet 3/2 { sol16(la si) } la8\noBeam r4 r r16 fad sol fad

   %10
   fad fad sol fad fad fad sol fad fad4 r
   r2 r4 r8 sol\f
   fad[mi16 re mi8 dod] re sol,\p fad mi

   %13
   re fad mi re mi re mi la,
   re4 r r2
   r r8 re\p fad re

   %16
   la si dod la si si' sold mi
   la,4 r  r2
   r la'16\f la la la la sol fad mi

   %19
   re4 r\mbreak sol16 sol sol sol sol fad mi re
   dod4 r fad16[fad fad fad fad mi re dod]
   si4 r mi16 mi mi mi mi re dod si

   %22
   la8 \once\stemDown dod '\p\tuplet 3/2 { si16(dod re) } dod8\noBeam  r2
   r8 dod \tuplet 3/2 { si16(dod re) } dod4 r8 r4
   R1*2

   %26
   la16\f la la la la sold fad mi fad fad fad fad fad mi re dod
   re re re re re dod si la mi'8 la mi' mi,
   la,8\p si dod si la dod si la

   %29
   si si' sold mi la,4 r\mbreak
   la8 dod si la si si' sold mi
   r8 sold\p la la, r2

   %32
   r8 sold' la la, re si sold' mi
   la la, dod la r la dod la
   re'16\f  re re re re dod si la sol8 r fad r

   %35
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r re4 r
   si'16 si si si si la sol fad mi8 r re r

   %38
   la\p r la r la r la r
   la r la r la r la la''\p
   \tuplet 3/2 { sol16(la si) } la8\noBeam r4 r4 r8 fad\p

   %41
   \tuplet 3/2 { mi16 fad sol } fad8\noBeam r4\mbreak r4 r8 la,\p
   re16 la fad' re la'8[fad] fad\tr mi r4
   r2 r4 r8 la,,\p

   %44
   re re re re la' la, la la
   si sold' sold sold la la, la la
   mi' dod dod dod re4 r

   %47
   fad'16 fad sol fad fad fad sol fad fad4 r
   fad,16 fad sol fad fad fad sol fad fad4 r
   R1

   %50
   r2 re8 mi fad mi
   re4 re re re\mbreak
   re r8 re la' sol la la,

   %53
   re'16\f re re re re dod si la sol sol sol sol sol fad mi re
   \once\stemUp la 8[la''\p] \tuplet 3/2 { sol16(la si) } la8\noBeam r2
   la8\f[sol16 fad sol8 mi] re2\fermata

}

IIIvlIIn = \relative do'' {

   fad8
   \tuplet 3/2 { mi16(fad sol)} fad8\noBeam r4 r r8 re
   \tuplet 3/2 { dod16(re mi) } re8\noBeam r4 r r8 fad,
   la16 fad re' la fad'8[re] re\parenthesize \tr dod r4

   %4
   r2 r4 r8 fad
   si, si r4 r2
   re16\f re re re re dod si la sol8 r fad r

   %7
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r\mbreak re4 r8 fad'
   \tuplet 3/2 { mi16(fad sol)} fad8\noBeam r4 r r16 re mi re

   %10
   re re mi re re re mi re re4 r
   r2 r4 r8 mi\f
   re fad, sol mi fad8 sol\p fad mi

   %13
   re fad mi re mi re mi la,
   re4 r r2
   r r8 re\p fad re

   %16
   la si dod la si si' sold mi
   la,4 r  r2
   r la'16\f la la la la sol fad mi

   %19
   re4 r\mbreak sol16 sol sol sol sol fad mi re
   dod4 r fad16[fad fad fad fad mi re dod]
   si4 r mi16 mi mi mi mi re dod si

   %22
   la8 la'\p \tuplet 3/2{sold16(la si)}  la8\noBeam r2
   r8 la\noBeam \tuplet 3/2 { sold16 (la si) } la4 r8 r4
   R1*2

   %26
   la16\f la la la la sold fad mi fad fad fad fad fad mi re dod
   re re re re re dod si la mi'8 la mi' mi,
   la,8\p si dod si la dod si la

   %29
   si si' sold mi la,4 r\mbreak
   la8 dod si la si si' sold mi
   r8 sold\p la la, r2

   %32
   r8 sold' la la, re si sold' mi
   la la, dod la r la dod la
   re'16\f  re re re re dod si la sol8 r fad r

   %35
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r re4 r
   si'16 si si si si la sol fad mi8 r re r

   %38
   la\p r la r la r la r
   la r la r la r la \once\stemDown fad''\p
   \tuplet 3/2 { mi16(fad sol)} fad8\noBeam r4 r r8 re\p

   %41
   \tuplet 3/2 { dod16 re mi } re8\noBeam r4 r r8 fad,\p
   la16 fad re' la fad'8[re] re\tr dod r4
   r2 r4 r8 la,\p

   %44
   re re re re la' la, la la
   si sold' sold sold la la, la la
   mi' dod dod dod re4 r

   %47
   re'16 re mi re re re mi re re4 r
   re,16 re mi re re re mi re re4 r
   R1

   %50
   r2 re8 mi fad mi
   re4 re re re\mbreak
   re r8 re la' sol la la,

   %53
   re'16\f re re re re dod si la sol sol sol sol sol fad mi re
   \once\stemUp la8 \once\stemDown fad''\p \tuplet 3/2 { mi16(fad sol) } fad8\noBeam r2
   fad8\f[mi16 re mi8 dod] re2\fermata

}

IIIvlaIn = \relative do' {

    la'8
    dod la r4 r r8 la
    la la r4 r r8 re,
    fad fad fad la la la r4

    %4
    r2 r4 r8 la
    fad sol r4 r2
    re'16\f re re re re dod si la sol8 r fad r

   %7
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r\mbreak re4 r8 la'
   dod la r4 r r8 la

   %10
   la la la la la4 r
   r2 r4 r8 dod
   la la, si la la8 sol'\p fad mi

   %13
   re fad mi re mi re mi la,
   re4 r r2
   r r8 re\p fad re

   %16
   la si dod la si si' sold mi
   la,4 r  r2
   r la'16\f la la la la sol fad mi

   %19
   re4 r\mbreak sol16 sol sol sol sol fad mi re
   dod4 r fad16[fad fad fad fad mi re dod]
   si4 r mi16 mi mi mi mi re dod si

   %22
   la8 mi'\p mi mi r2
   r8 mi mi mi r2
   R1*2

   %26
   la16\f la la la la sold fad mi fad fad fad fad fad mi re dod
   re re re re re dod si la mi'8 la mi' mi,
   la,8\p si dod si la dod si la

   %29
   si si' sold mi la,4 r\mbreak
   la8 dod si la si si' sold mi
   r8 sold\p la la, r2

   %32
   r8 sold' la la, re si sold' mi
   la la, dod la r la dod la
   re'16\f  re re re re dod si la sol8 r fad r

   %35
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r re4 r
   si'16 si si si si la sol fad mi8 r re r

   %38
   la\p r la r la r la r
   la r la r la r la la'
   dod la r4 r r8 la\p

   %41
   la la r4\mbreak r r8 re,\p
   fad fad fad la la la r4
   r2 r4 r8 la,\p

   %44
   re re re re la' la, la la
   si sold' sold sold la la, la la
   mi' dod dod dod re4 r

   %47
   la'8 la la la la4 r
   la,8 la la la la4 r
   R1

   %50
   r2 re8 mi fad mi
   re4 re re re\mbreak
   re r8 re la' sol la la,

   %53
   re'16\f re re re re dod si la sol sol sol sol sol fad mi re
   la8 la'\p dod la r2
   la8\f la si la la2\fermata

}

IIIsopranoIn = \relative do'' {

   \autoBeamOff

   r8
   R1*11
   r2 re4 la
   r8 re dod re sol,2\tr

   %14
   fad4 r r2
   r2 r8 la re fad
   mi dod la dod re2

   %17
   dod4 r r2
   R1
   fad4~fad16[mi] re[dod]\mbreak si8 si r4

   %20
   mi4~mi16[re] dod[si] la8 la r4
   re~re16[dod] si[la] sold8 sold r mi'
   mi8. mi,16 mi8 mi mi4 mi

   %23
   mi' mi, r8 mi'16[re] dod8 si
   dod16[re dod re] mi[re mi re] dod[re dod re] mi[re mi re]
   dod8[fad] mi re dod[si16 la] si4\tr

   %26
   la r r2
   R1
   mi'4 la, r8 la sold la

   %29
   re2 dod4 r\mbreak
   R1
   r8 mi dod la mi'8. mi,16 mi4

   %32
   r r8 dod' re2\tr
   dod4 r8 la sol2\tr
   fad4 r re' fad

   %35
   sol16[fad sol fad] sol[fad mi re] dod4 r
   dod mi fad16[mi fad mi] fad[mi re dod]
   si4 r si re

   %38
   mi16[re dod si] la8 sol sol8. fad16 fad4
   r2 r4 r8 la
   la4 la la~la16[si la si]

   %41
   dod8 la r4\mbreak r r8 la
   re[la] fad'[re] re dod r4
   r2 r4 r8 mi

   %44
   fad16[sol fad sol fad sol fad sol] mi[fad mi fad mi fad mi fad]
   re[mi re mi re mi re mi] dod[re dod re dod re dod re]
   si[dod si dod si dod si dod] la4 la

   %47
   re8. la16 la4 r8 re, fad la
   re la r4 r r8 la
   la8.[si16] la8.[si16] la8[re] fad re

   %50
   mi2\tr re4 r8 la
   la8.[si16] la8.[si16] la[si la si] la[si la si]\mbreak
   la8[re] fad re mi2\parenthesize \tr

   %53
   re r
   R1*2

}

IIItestoI = \lyricmode {

   Vir -- gam vir -- tutis _ tu -- ae e -- mittet _ Do -- minus _ ex Si -- on:

   do -- mi -- nare _ do -- mi -- nare _ do -- mi -- nare _ in me -- dio _ i -- ni -- mi -- co -- rum

   i -- nimi - co - - - - rum tu -- o - rum!

   Vir -- gam vir -- tutis _ tu -- ae e -- mittet _ Do -- minus _ ex Si -- on ex Si -- on:

   do -- mi -- na - re do -- mi -- na - re do -- mi -- na -- re in me -- dio _ i -- ni -- mi -- co - rum

   i -- ni -- mi -- co -- rum tu -- o - - - - rum in me -- dio _ i -- ni -- mi -- co -- rum

   i -- ni -- mi -- co -- rum tu -- o -- rum i -- ni -- mi -- co - - rum tu -- o -- rum!

}

IIIbcIn = \relative do {

   re8^\markup\italic "Senza Org[a]ni"
   la' re, re, r r4 r8 re'
   la' re, re, r r4 r8 re'
   re dod re re, la'' la, la r

   %4
   r2 r4 r8 la'
   la sol sol, r r2
   re''16^\f _\markup\italic "Org[a]ni: tutti" re re re re dod si la sol8 r fad r

   %7
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r\mbreak re4 r8 re\parenthesize ^\p^\markup\italic "[Senza Organi]"
   la' re, re, r r4 r8 re''

   %10
   re re re re re re, \once\stemUp re, r
   r2 r4 r8 la''^\f _\tu
   re re, sol, la re,4 r

   %13
   R1*5
   r2 la''16^\f_\markup\italic "Organi tutti" la la la la sol fad mi
   re4 r\mbreak sol16 sol sol sol sol fad mi re

   %20
   dod4 r fad16[fad fad fad fad mi re dod]
   si4 r mi16 mi mi mi mi re dod si
   la8 la'^\p _\markup\italic "[Organo Solo]"  mi la, mi r r4

   %23
   r8 la' mi la, mi4 r8 mi'
   la,4 r la r
   la r8 mi' la la, mi'[mi,]

   %26
   la'16^\f_\markup\italic "Organi tutti" la la la la sold fad mi fad fad fad fad fad mi re dod
   re re re re re dod si la mi'8 la mi' mi,
   la,4 r r2

   %29
   R1*5
   re'16\f  re re re re dod si la sol8 r fad r

   %35
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r re4 r
   si'16 si si si si la sol fad mi8 r re r

   %38
   la\p r la r la r la r
   la r la r la r la re\parenthesize \p
   la' re, re, r r4 r8 re'

   %41
   la' re, re, r r4 r8 re'\p
   re dod re re, la'' la, la r
   R1*3

   %46
   r2 re'16 re re re re fad, mi re
   re,4 r r2
   re4 r r2

   %49
   re'4 re re r8 re
   la' sol la la, re4 r
   R1*2

   %53
   re'16^\f_\markup\italic "Organi tutti" re re re re dod si la sol sol sol sol sol fad mi re
   la8 re\p\solo la'[re,] re,4 r
   re'8^\f_\markup\italic "Organi tutti"re, sol la re,2\fermata

}

IIIbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s8
   <7>1
   s
   s2 <6 4>8 <5 3> s4
   s2 s4 s8 <6>
   s1
   s
   <7>
   s
   <7>
   s1*30
   <7>1
   s
   s2 <6 4>8 <5 3> s4
   s1*11
   s4 <7>

}


IIIvlIIIn = \relative do'' {

   r8
   r4 r8 la'8\p \tuplet 3/2 { sol16(la si)} la8\noBeam r4
   r r8 fad\p\tuplet 3/2 { mi16 (fad sol) } fad8\noBeam r4
   r2 r4 r8 la, \p

   %4
   re16 la fad' re la'8 [fad] fad\tr[mi] r4
   r4 r8 sol16\p(mi) dod8 re r4
   re16\f re re re re dod si la sol8 r fad r

   %7
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r\mbreak re4 r
   r4 r8 la''\p\tuplet 3/2 { sol16(la si) } la8\noBeam r4

   %10
   r2 r4 r16 fad\p sol fad
   fad fad sol fad fad fad sol fad fad4 r8 sol\f
   fad[mi16 re mi8 dod] re4 r

   %13
   R1
   re,8\p sol fad mi re fad mi re
   mi8 re mi la, re4 r

   %16
   R1
   r8 la'\p fad re la si dod la
   si si' sold mi la16\f la la la la \once\set suggestAccidentals = ##t sol? fad mi

   %19
   re4 r\mbreak sol16 sol sol sol sol fad mi re
   dod4 r fad16[fad fad fad fad mi re dod]
   si4 r mi16 mi mi mi mi re dod si

   %22
   la4 r r8 dod'\p\tuplet 3/2 { si16(dod re) } dod8\noBeam
   r4 r8 dod \tuplet 3/2 { si16(dod re) } dod8\noBeam r4
   R1*2

   %26
   la16\f la la la la sold fad mi fad fad fad fad fad mi re dod
   re re re re re dod si la mi'8 la mi' mi,
   la,4 r r2

   %29
   r la8\p si dod si\mbreak
   la dod si la si si' sold mi
   la,4 r r8 sold'\p la la,

   %32
   r8 sold' la la, re si sold' mi
   la,4 r8 la dod la r4
   re'16\f  re re re re dod si la sol8 r fad r

   %35
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r re4 r
   si'16 si si si si la sol fad mi8 r re r

   %38
   la\p r la r la r la r
   la r la r la r la4
   r r8 la''\p \tuplet 3/2 { sol16(la si) } la8\noBeam r4

   %41
   r4 r8 fad\p\mbreak \tuplet 3/2 { mi16 (fad sol) } fad8\noBeam r4
   r2 r4 r8 la,\p
   re16 la fad' re la'8[fad] fad\tr mi r8 la,,\p

   %44
   re re re re la' la, la la
   si sold' sold sold la la, la la
   mi' dod dod dod re4 r

   %47
   r2 fad'16 fad sol fad fad fad sol fad
   fad4 r fad,16 fad sol fad fad fad sol fad
   fad4 r r2

   %50
   r2 re8 mi fad mi
   re4 re re re\mbreak
   re r8 re la' sol la la,

   %53
   re'16\f re re re re dod si la sol sol sol sol sol fad mi re
   la4 r r8 la''\p\tuplet 3/2 { sol16(la si) } la8\noBeam
   la8\f[sol16 fad sol8 mi] re2\fermata

}

IIIvlIVn = \relative do'' {

   r8
   r4 r8 fad\p  \tuplet 3/2 { mi16(fad sol)} fad8\noBeam r4
   r r8 re\p \tuplet 3/2 { dod16(re mi) } re8\noBeam r4
   r2 r4 r8 fad,\p

   %4
   la16 fad re' la fad'8[re] re\tr dod r4
   r4 r8 mi\p la, la r4
   re16\f re re re re dod si la sol8 r fad r

   %7
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r\mbreak re4 r
   r4 r8 fad'\p \tuplet 3/2 { mi16(fad sol)} fad8\noBeam r4

   %10
   r2 r4 r16 re\p mi re
   re re mi re re re mi re re4 r8 mi\f
   re fad, sol mi fad4 r

   %13
   R1
   re8\p sol fad mi re fad mi re
   mi re mi la, re4 r

   %16
   R1
   r8 la'\p fad re la si dod la
   si si' sold mi la16\f la la la la \once\set suggestAccidentals = ##t sol? fad mi

   %19
   re4 r\mbreak sol16 sol sol sol sol fad mi re
   dod4 r fad16[fad fad fad fad mi re dod]
   si4 r mi16 mi mi mi mi re dod si

   %22
   la4 r r8 la'\p \tuplet 3/2{sold16(la si)}  la8\noBeam
   r4 r8 la\noBeam \tuplet 3/2 { sold16 (la si) } la8\noBeam r4
   R1*2

   %26
   la16\f la la la la sold fad mi fad fad fad fad fad mi re dod
   re re re re re dod si la mi'8 la mi' mi,
   la,4 r r2

   %29
   r la8\p si dod si
   la dod si la si si' sold mi
   la,4 r r8 sold'\p la la,

   %32
   r8 sold' la la, re si sold' mi
   la,4 r8 la dod la r4
   re'16\f  re re re re dod si la sol8 r fad r

   %35
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r re4 r
   si'16 si si si si la sol fad mi8 r re r

   %38
   la\p r la r la r la r
   la r la r la r la4
   r4 r8 fad''\p \tuplet 3/2 { mi16(fad sol)} fad8\noBeam r4

   %41
   r4 r8 re\p \tuplet 3/2 { dod16 \parentSlur (re mi) } re8\noBeam r4  % <--- qui
   r2 r4 r8 fad,\p
   la16 fad re' la fad'8[re] re\tr dod r8 la,\p

   %44
   re re re re la' la, la la
   si sold' sold sold la la, la la
   mi' dod dod dod re4 r

   %47
   r2 re'16 re mi re re re mi re
   re4 r re,16 re mi re re re mi re
   re4 r r2

   %50
   r2 re8 mi fad mi
   re4 re re re\mbreak
   re r8 re la' sol la la,

   %53
   re'16\f re re re re dod si la sol sol sol sol sol fad mi re
   la4 r r8 fad''\p \tuplet 3/2 { mi16(fad sol) } fad8\noBeam
   fad8\f[mi16 re mi8 dod] re2\fermata

}

IIIvlaIIn = \relative do' {

    r8
    r4 r8 la'\p dod la
    r4 r r8 la\p la la r4
    r2 r4 r8 re,\p

    %4
    fad fad fad la la la r4
    r r8 sol\p mi fad r4
    re'16\f re re re re dod si la sol8 r fad r

   %7
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r\mbreak re4 r
   r r8 la' \p dod la r4

   %10
   r2 r4 r8 la\p
   la la la la la4 r8 dod\f
   la la, si la la4 r

   %13
   R1
   re8\p sol fad mi re fad mi re
   mi re mi la, re4 r

   %16
   R1
   r8 la'\p fad re la si dod la
   si si' sold mi la16\f la la la la \once\set suggestAccidentals = ##t sol? fad mi

   %19
   re4 r\mbreak sol16 sol sol sol sol fad mi re
   dod4 r fad16[fad fad fad fad mi re dod]
   si4 r mi16 mi mi mi mi re dod si

   %22
   la4 r r8 mi'\p mi mi
   r4 r8 mi mi mi r4
   R1*2

   %26
   la16\f la la la la sold fad mi fad fad fad fad fad mi re dod
   re re re re re dod si la mi'8 la mi' mi,
   la,4 r r2

   %29
   r la8\p si dod si
   la dod si la si si' sold mi
   la,4 r\mbreak r8 sold'\p la la,

   %32
   r8 sold' la la, re si sold' mi
   la,4 r8 la dod la r4
   re'16\f  re re re re dod si la sol8 r fad r

   %35
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r re4 r
   si'16 si si si si la sol fad mi8 r re r

   %38
   la\p r la r la r la r
   la r la r la r la4
   r4 r8 la'\p  dod la r4

   %41
   r r8 la\p la la r4
   r2 r4 r8 re,\p
   fad fad fad la la la r8 la,

   %44
   re re re re la' la, la la
   si sold' sold sold la la, la la
   mi' dod dod dod re4 r

   %47
   r2 la'8 la la la
   la4 r la,8 la la la
   la4 r r2

   %50
   r2 re8 mi fad mi
   re4 re re re\mbreak
   re r8 re la' sol la la,

   %53
   re'16\f re re re re dod si la sol sol sol sol sol fad mi re
   la4 r r8 la'\p dod la
   la8\f la si la fad2\fermata

}

IIIsopranoIIn = \relative do'' {

   \autoBeamOff

   r8
   R1*13
   re4 la r8 re dod re
   sol,2\tr fad4 r

   %16
   R1
   r8 la re fad mi dod la dod
   re2\tr dod4 r
   re4~re16[dod] si[la]\mbreak sol8 sol r4

   %20
   dod4~dod16[si] la[sol] fad8 fad r4
   si~si16[la] sold[fad] mi8 mi r4
   r r8 mi' mi8. mi,16 mi8 mi

   %23
   mi4 mi mi'8 mi,16 mi mi8 sold
   la16[si la si] dod[si dod si] la[si la si] dod[si dod si]
   la8[re] dod si la4(sold\tr)

   %26
   la r r2
   R1*2
   r2 mi'4 la, \mbreak

   %30
   r8 la sold la re2\tr \mbreak
   dod4 r r8 mi dod la

   %32
   mi'8. mi,16 mi8 la si2\tr
   la4 r8 mi' dod2\tr
   re4 r si re

   %35
   mi16[re mi re] mi[re dod si] la4 r
   la dod re16[dod re dod] re[dod si la]
   sol4 r  r2

   %38
   r2 la4 re
   mi16[re dod si] la8 sol sol8. fad16 fad4
   r4 r8 la la4 la

   %41
   la~la16[si la si]\mbreak dod8 la r4
   r2 r4 r8 la
   re[la] fad'[re] re dod r dod

   %44
   re16[mi re mi re mi re mi] dod[re dod re dod re dod re]
   si[dod si dod si dod si dod] la[si la si la si la si]
   sol[la sol la sol la sol la] fad4 r

   %47
   r4 r8 la re8. la16 la4
   r8 re, fad la re re, r fad
   fad8.[sol16] fad8.[sol16] fad8[la] re si

   %50
   dod2\parenthesize \tr re4 r8 fad,
   fad8.[sol16] fad8.[sol16] fad[sol fad sol] fad[sol fad sol]\mbreak
   fad8[la] re si dod2\tr

   %53
   re r
   R1*2

}

IIItestoV= \lyricmode {

   Vir -- gam vir -- tutis _ tu -- ae e -- mittet _ Do -- minus _ ex Si -- on:

   do -- mi -- nare _ do -- mi -- nare _ do -- mi -- nare _ in me -- dio _ i -- ni -- mi -- co -- rum

   i -- nimi - co - - - - rum tu -- o -- rum!

   Vir -- gam vir -- tutis _ tu -- ae e -- mittet _ Do -- minus _ ex Si -- on ex Si -- on:

   do -- mi -- na - re do -- mi -- na - re do -- mi -- na -- re in me -- dio _ i -- ni -- mi -- co - rum

   i -- ni -- mi -- co -- rum tu -- o - - - - rum in me -- dio _ i -- ni -- mi -- co -- rum

   i -- ni -- mi -- co -- rum tu -- o -- rum i -- ni -- mi -- co - - rum tu -- o -- rum!

}

IIIbcIIn = \relative do {

   r8
   r4 r8 re^\markup\italic "Senza Org[a]ni" la' re, re, r
   r4 r8 re'\p la' re, re, r
   r2 r4 r8 re'\p

   %4
   re dod re re, la'' la, la r
   r4 r8 sol' sol fad fad, r
   re''16^\f _\markup\italic "Org[a]ni: tutti" re re re re dod si la sol8 r fad r

   %7
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r\mbreak re4 r
   r4 r8 re^\p_\markup\italic "Senza Org[ani]" la' re, re, r

   %10
   r2 r4 r8 re''\p
   re re re re re re, \once\stemUp re, la''^\f _\tu
   re re, sol, la re,4 r

   %13
   R1*5
   r2 la''16^\f_\markup\italic "Organi tutti" la la la la sol fad mi
   re4 r\mbreak sol16 sol sol sol sol fad mi re

   %20
   dod4 r fad16[fad fad fad fad mi re dod]
   si4 r mi16 mi mi mi mi re dod si
   la4 r r8 la'^\p _\markup\italic "Org[an]o Solo" mi la,

   %23
   mi r r la' mi la, r8 mi'
   la,4 r la r
   la r8 mi' la la, mi'[mi,]

   %26
   la'16^\f_\markup\italic "Organi tutti" la la la la sold fad mi fad fad fad fad fad mi re dod
   re re re re re dod si la mi'8 la mi' mi,
   la,4 r r2

   %29
   R1*5
   re'16\f  re re re re dod si la sol8 r fad r

   %35
   mi4 r dod'16 dod dod dod dod si la sol
   fad8 r mi r re4 r
   si'16 si si si si la sol fad mi8 r re r

   %38
   la\p r la r la r la r
   la r la r la r la4
   r r8 re\p la' re, re, r

   %41
   r4 r8 re'\p\mbreak la' re, re, r
   r2 r4 r8 re'\p
   re dod re re, la'' la, la r
   R1*2

   %46
   r2 re'16 re re re re fad, mi re
   re,4 r re r
   r2 re4 r

   %49
   re'4 re re r8 re
   la' sol la la, re4 r
   R1*2

   %53
   re'16^\f_\markup\italic "Organi tutti" re re re re dod si la sol sol sol sol sol fad mi re
   la4 r r8 re\p\solo la' re,
   re,^\f_\markup\italic "Organi tutti" re' sol, la re,2\fermata

}

IIIbfIIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s8
   s2 <7>
   s1*5
   <7>1
   s1*32
   s2 <7>
   s1*2
   s2 <6 4>8 <5 3> s4
   s1*10
   s2 s4 <7>

}


forma = {

   \time 4/4
   \key re\major
   \tempo 2 = 50
   \partial 8 s8
   s1*55
   \bar "|."

}

IIIvlI = {
   \notypeset
   <<\IIIvlIn \forma>>

}

IIIvlII = {
   <<\IIIvlIIn \forma>>

}

IIIvlaI = {
   \clef alto
   <<\IIIvlaIn \forma>>

}

IIIsopranoI = {
   \new Voice = "virgam1"
   <<\IIIsopranoIn \forma>>
}


IIIbcI = {
   \clef bass
   <<\IIIbcIn \forma \IIIbfIn>>
   \typeset
}

IIIvlIII = {
   <<\IIIvlIIIn \forma>>

}

IIIvlIV = {
   <<\IIIvlIVn \forma>>

}

IIIvlaII = {
   \clef alto
   <<\IIIvlaIIn \forma>>

}

IIIsopranoII= {
   \new Voice = "virgam5"
   <<\IIIsopranoIIn \forma>>
}

IIIbcII = {
   \clef bass
   <<\IIIbcIIn \forma \IIIbfIIn>>
   \typeset
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IVvlIn = \relative do'' {

    mi8\p sol r si r sol
    fad si, r la' r fad
    sol mi r si' r sol

    %4
    fad si, si2\tr
    sol'32(la si8.) sol32(la si8.) sol32(la si8.)
    mi,8 la r do r mi, \mbreak

    %7
    fad32(sol la8.) fad32(sol la8.) fad32(sol la8.)
    re,8 sol r si r re,
    mi32(fad sol8.) mi32(fad sol8.) mi32(fad sol8.)

    %10
    do,8 fad r la r mi
    red32(mi fad8.) red32(mi fad8.) red32(mi fad8.)
    sol8 sol, sol32(la si8.) sol32(la si8.)

    %13
    sol8-.(sol-. sol-. sol-. sol-. sol-.)\mbreak
    si-.(si-. si-. si-. si-. si-.)
    mi sol r si r fad

    %16
    sol si r sol, la fad
    mi4 r r
    R2.*3

    %21
    sol'32(la si8.) sol32(la si8.) sol32(la si8.)
    mi,8 la r do r mi, \mbreak
    fad32(sol la8.) fad32(sol la8.) fad32(sol la8.)

    %24
    re,8 sol r si r re,
    mi32(fad sol8.) mi32(fad sol8.) mi32(fad sol8.)
    do,8 fad r la r dod,

    %27
    red32(mi fad8.) red32(mi fad8.) red32(mi fad8.)
    sol8 sol, sol32(la si8.) sol32(la si8.)
    mi,8-. (mi-. mi-. mi-. mi-. mi-.)

    %30
    sol8-.(sol-. sol-. sol-. sol-. sol-.)
    si-.(si-. si-. si-. si-. si-.)
    si si r si r do

    %33
    r si r si r do
    r si r si r dod\mbreak
    r re r re r re

    %36
    R2.
    re8 fad r si r re,
    dod mi r lad r mi

    %39
    re si' r re, mi dod
    re si' r re, mi dod
    si4 r r

    %42
    R2.*6
    mi,8-. \p(mi-. mi-. mi-. mi-. mi-.)
    sol8-.(sol-. sol-. sol-. sol-. sol-.)\mbreak

    %50
    si-.(si-. si-. si-. si-. si-.)
    R2.
    do32(re mi8.) do32(re mi8.) do32(re mi8.)

    %53
    do4 r r
    fad32(sol la8.) fad32(sol la8.) fad32(sol la8.)
    sol32(la si8.) sol32(la si8.) sol32(la si8.)

    %56
    fad32(sol la8.) fad32(sol la8.) fad32(sol la8.)
    mi32(fad sol8.) mi32(fad sol8.) mi32(fad sol8.)
    red32(mi fad8.) red32(mi fad8.) red32(mi fad8.)

    %59
    sol4 r r
    si,,8-.(si-. si-. si-. si-. si-.)
    mi -.(mi-. mi-. mi-. mi-. mi-.)

    %62
    sol8-.(sol-. sol-. sol-. sol-. sol-.)
    si-.(si-. si-. si-. si-. si-.)
    R2.*4

    %68
    mi8 sol r si r sol
    fad si, r la' r fad
    sol si r sol la fad

    %71
    sol si r sol, la fad
    mi2.\fermata

}

IVvlIIn = \relative do'' {

    si8\p mi r sol r mi
    red fad, r fad' r red
    mi si r sol' r mi

    %4
    red si si2\tr
    R2.
    do32(re mi8.) do32(re mi8.) do32(re mi8.)\mbreak

    %7
    la,8 re r fad r re
    si32(do re8.) si32(do re8.) si32(do re8.)
    sol,8 do r mi r do

    %10
    la32(si do8.) la32(si do8.) la32(si do8.)
    fad,8 si r red r si
    si mi, mi32(fad sol8.) mi32(fad sol8.)

    %13
    mi8-.(mi-. mi-. mi-. mi-. mi-.)\mbreak
    sol-.(sol-. sol-. sol-. sol-. sol-.)
    si8 mi r fad r red

    %16
    mi sol r mi, fad red
    mi4 r r
    R2.*4

    %22
    do'32(re mi8.) do32(re mi8.)  do32(re mi8.)
    la,8 re r fad r la,
    si32(do re8.) si32(do re8.) si32(do re8.)

    %25
    sol,8 do r mi r sol,
    la32(si do8.) la32(si do8.) la32(si dod8.)
    fad,8 si r red r  fad,

    %28
    mi mi mi32(fad sol8.) mi32(fad sol8.)
    si,8-.(si-. si-. si-. si-. si-.)
    mi-.(mi-. mi-. mi-. mi-. mi-.)

    %31
    sol-.(sol-. sol-. sol-. sol-. sol-.)
    sol sol r sol r la
    r sol r sol r la

    %34
    r sol r sol r lad\mbreak
    r si r si r si
    R2.

    %37
    si8 re r fad r si,
    lad dod r mi r dod
    si fad' r si, dod lad

    %40
    si fad' r si, dod lad
    si4 r r
    R2.*6

    %48
    si,8-.\p(si-. si-. si-. si-. si-.)
    mi-.(mi-. mi-. mi-. mi-. mi-.)\mbreak
    sol-.(sol-. sol-. sol-. sol-. sol-.)

    %51
    R2.
    la32(si do8.) la32(si do8.) la32(si do8.)
    la4 r r

    %54
    red32(mi fad8.) red32(mi fad8.) red32(mi fad8.)
    mi32(fad sol8.) mi32(fad sol8.) mi32(fad sol8.)
    red32(mi fad8.) red32(mi fad8.) red32(mi fad8.)

    %57
    do32(re mi8.) do32(re mi8.)  do32(re mi8.)
    si32(dod red8.) si32(dod red8.) si32(dod red8.)
    si4 r r

    %60
    sol,8-.(sol-. sol-. sol-. sol-. sol-.)
    si8-.(si-. si-. si-. si-. si-.)
    mi-.(mi-. mi-. mi-. mi-. mi-.)

    %63
    sol-.(sol-. sol-. sol-. sol-. sol-.)
    R2.*4
    si8 mi r sol r mi

    %69
    red fad, r fad' r red
    mi sol r mi fad red
    mi sol r mi, fad red

    %72
    mi2.\fermata

}

IVvlaIn = \relative do' {

    sol'8\p r sol r sol r
    red r red r red r
    si r si r si r

    %4
    red fad red fad red fad
    si,[mi] si mi si mi
    mi do' mi,[la] mi la\mbreak

    %7
    fad [re] la re la re
    re si' re, sol re sol
    mi[do] sol do sol do

    %10
    do[la'] do, fad do fad
    red[si] fad si fad si
    sol si si si si si

    %13
    si si si si si si\mbreak
    mi mi mi mi mi mi
    sol si r red r si

    %16
    si [mi,] r si do si
    sol4 r r
    R2.*3\mbreak

    %21
    si8 mi si mi si mi
    mi do' mi, la mi la
    fad[re] la re la re

    %24
    re si' re, sol re sol
    mi[do] sol do sol do
    do[la'] do, fad do fad

    %27
    re[si] fad si fad si
    si si si si si si
    sol sol sol sol sol sol

    %30
    si si si si si si
    mi mi mi mi mi mi
    mi mi r sol r fad

    %33
    r sol r sol r fad
    r sol r sol r fad\mbreak
    r fad r fad r fad

    %36
    R2.
    fad8 si r re r fad,
    fad fad r dod' r fad,

    %39
    fad[re'] r fad, sol fad
    fad[re'] r fad, sol fad
    re4 r r

    %42
    R2.*6
    sol,8-.\p(sol-. sol-. sol-. sol-. sol-.)
    si-.(si-. si-. si-. si-. si-.)\mbreak

    %50
    mi-.(mi-. mi-. mi-. mi-. mi-.)
    R2.
    mi8 r mi r mi r

    %53
    R2.
    la,8 r la r la r
    la r la r la r

    %56
    la r la r la r
    la r la r la r
    la r la r la r

    %59
    R2.
    mi8 mi mi mi mi mi
    sol sol sol sol sol sol

    %62
    si si si si si si
    mi mi mi mi mi mi
    R2.*4

    %68
    sol8 si r si r si
    r red, r red r si
    si si r si' do si

    %71
    si si r si, do si
    si2.\fermata

}

IValtoIn = \relative do' {

    \autoBeamOff

    R2.*16
    mi4 si sol'
    fad8. si,16 si4 r8 si

    %19
    la'4 la8. la16 sol8. fad16
    sol[fad] mi8 r4 mi8 sol\mbreak
    si4. la16[sol] \appoggiatura fad8 mi si'

    %22
    do8.[si16 la8. sol16 fad8. mi16]
    fad4. mi16[re] fad8[la]
    si8.[la16 sol8. fad16 mi8. re16]

    %25
    mi4. re16[do] mi8[sol]
    la8.[sol16 fad8. mi16 red8. dod16]
    red8 [si red fad la fad]

    %28
    sol8.[fad16] mi4 r8 si'
    si,4. do8 si4
    si' sol mi

    %31
    si4. do8 si4
    sol'16[mi red mi] sol[mi red mi] la[fad mi fad]
    sol[mi red mi] sol[mi red mi] la[fad mi fad]

    %34
    sol[mi red mi] sol[mi red mi] lad[fad mi fad]\mbreak
    si4. la16 [sol] fad4
    si8[si,] dod4.\tr si8

    %37
    si2 r4
    R2.*3
    fad'4 si, si'

    %42
    lad8. sold16 \parenthesize fad4 r8 fad
    mi4 dod8 sol' fad mi
    mi4 re fad8 si

    %45
    red,4. red8 mi fad
    sol4. si8[\appoggiatura la sol fad16 mi]
    mi4 red r8 si'

    %48
    sol4. fad8 mi4
    si' sol mi\mbreak
    si4. do8 si4

    %51
    mi16[fad sol la] si[la sol fad] mi[re do si]
    do4 mi la
    do16[si la sol] la[sol fad mi] la[sol fad mi]

    %54
    red4 fad la
    sol8[si] r sol r fad16[mi]
    fad8[la] r fad r \parenthesize mi16 [\parenthesize re]

    %57
    mi8[sol] r mi r re16[do]
    si8[red fad la si fad]
    sol[fad16 mi] fad4. mi8

    %60
    mi2 si'4
    si,4. do8 si4
    mi sol si

    %63
    si4. si,8 si4
    sol'16[mi red mi] sol[mi red mi] la[fad mi fad]
    sol[mi red mi] la[fad mi fad] si[sol fad sol]

    %66
    do[la si sol] la[fad sol mi] fad[red mi dod]
    si8[la'] sol4(fad8\tr) mi
    mi2 r4

    %69
    R2.*4

}

IVtestoII = \lyricmode {

     Te -- cum prin -- ci -- pium _ in di -- e vir -- tutis _ tuæ _ in splen -- do -- ribus _

     San -- cto - - - - - - - - - - rum ex u -- tero _ ante _ lu -- ci -- ferum _

     ge - - - - - - - - - nui _  ge -- nu -- i te.

     Te -- cum prin -- ci -- pium _ in di -- e vir -- tutis _ tuæ _ in splen -- do -- ribus _

     San -- cto - - rum ex u -- tero _ ante _ lu -- ci -- ferum _

     ge - - - - - - - - - - - - - - - - - - - - - - nui _ te ex u -- tero _ ante _ lu -- ci -- ferum _

     ge - - - - - - - - - nu -- i te.

}

IVbcIn = \relative do {

    mi,8 mi' mi, mi' mi, mi'
    si si' si, si' si, si'
    mi,, mi' mi, mi' mi, mi'

    %4
    si red si red si red
    mi sol mi sol mi sol
    la do la do la do\mbreak

    %7
    re, fad re fad re fad
    sol si sol si sol si
    do, mi do mi do mi

    %10
    fad la fad la fad la
    si, red si red si red
    mi mi mi mi mi mi

    %13
    mi mi mi mi mi mi\mbreak
    mi mi mi mi mi mi
    mi, mi' si si' si, si'

    %16
    mi,, [mi'] si mi la, si
    mi,4 r r
    si'8 red si red si red

    %19
    si \once\set suggestAccidentals = ##t red? si red si red
    mi sol mi sol mi mi,\mbreak
    mi' sol mi sol mi sol

    %22
    la do la do la do
    re, fad re fad re fad
    sol si sol si sol si

    %25
    do, mi do mi do mi
    fad la fad la fad la
    si, red si red si red

    %28
    mi mi mi mi mi mi
    mi sol mi sol mi sol
    mi sol mi sol mi sol

    %31
    mi sol mi sol mi sol
    mi r mi r red r
    mi r mi r red r

    %34
    mi r mi r mi r\mbreak
    re r re r re r
    si4 fad' fad,

    %37
    si8 si' si, si' si, si'
    fad, fad' fad, fad' fad, fad'
    si,[si'] fad si, mi fad

    %40
    si, [si'] fad si, mi fad
    si, re si re si re
    fad, lad \parenthesize  fad \parenthesize lad fad[fad']

    %43
    fad, fad' fad, fad' fad, fad'
    si, si' si, si' si, si'
    si, si' si, si' si, si'

    %46
    mi,, mi' mi, mi' mi, lad
    si si' si, si' si, si'
    mi, sol mi sol mi sol

    %49
    mi sol mi sol mi sol\mbreak
    mi sol mi sol mi sol
    mi r mi r mi r

    %52
    la, r la r la r
    la r la r la r
    si r si r si r

    %55
    si r si r si r
    si r si r si r
    si r si r si r

    %58
    si r si r si r
    mi4 si' si,
    mi8 sol mi sol mi sol

    %61
    mi8 sol mi sol mi sol
    mi8 sol mi sol mi sol
    mi8 sol mi sol mi sol

    %64
    mi r mi r red r\mbreak
    mi r fad r sol r
    la,4 r r

    %67
    si2.\fermata
    mi,8 mi' mi, mi' mi, mi'
    si si' si, si' si, si'

    %70
    mi,,[mi'] si mi la, si
    mi, mi' si mi la, si
    mi,2.\fermata

}

IVbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <_+>4 <7>2
    s2.*16
    <7>2.
    s2.*14
    s2 <6 4+>4
    s2.*3
    <_+>8 <7> s2
    s2.*3
    <_+>2.
    <7>
    <5 4>4 <3>2
    <_+>2.
    s
    <5 4>4 <3+> s
    s2.*6
    <_+>2.
    <6 4>
    <5 3+>
    <4 2>
    <3+>
    s2.*10
    <_+>4 <7> s

}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key mi\minor
    \tempo 2 = 48
    s2.*72
    \bar "|."

}

IVvlI = {
    \notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVvlaI = {
    \clef alto
    <<\IVvlaIn \forma>>

}

IValtoI = {
    \new Voice = "tecum2"
    <<\IValtoIn \forma>>
}


IVbcI = {
    \clef bass
    <<\IVbcIn \forma \IVbfIn>>
    \typeset
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



VvlIn = \relative do'' {

   do,2 mi
   sol do4. do8
   do2 r

   %4
   R1
   mi4 do sol mi
   mi2 mi

   %7
   mi'4 do sol mi\mbreak
   fa1~
   fa4 fa fa2

   %10
   mi1\fermata
   mi'4 mi mi mi
   mi1

   %13
   re4 re re re
   re1
   do4 do do do

   %16
   do1~
   do4 do do2
   si1\fermata

   %19
   R1*3
   r8 do sol' sol\mbreak fa fa fa fa
   fa4 mi r8 la la la

   %24
   fad8 fad sol sol sol4 fad
   sol r8 do, re4 mi
   fa?8 fa fa fa fa fa r fa

   %27
   fa fa mi mi fa fa sol sol
   do,4 r8 si' do4 re
   sol,8 sol sol sol mi mi r mi

   %30
   re re re re mi mi la la
   si4 sol sol4. sol8\mbreak
   fa re r4 r2

   %33
   fa4. fa8 mi do r4
   r2 mi4. mi8
   re re r4 r2
   r8 \parenthesize la re re do do do do

   %37
   si si r4 r2
   r4 fa' fa mi8[re]
   do re mi do si4. si8

   %40
   do mi, do la mi''2~
   mi mi~
   mi mi

   %43
   mi4 la,8 fa si sol si, sol\mbreak
   sol'1
   sol

   %46
   sol2 sol8 fa' fa fa
   mi mi mi mi re4. re8
   mi sol, mi do sol' re' sol re

   %49
   r mi sol mi r re sol re
   R1
   sol,,8 sol'' sol sol sol sol sol sol

   %52
   sol4 sol sol8 sol mi do
   sol'4 sol sol2\fermata

}

VvlIIn = \relative do'' {

   sol,2 do
   mi sol4. sol8
   sol2 r

   %4
   R1
   sol4 sol mi do
   do2 do

   %7
   sol'4 sol mi do\mbreak
   re1~
   re4 re re2

   %10
   do1\fermata
   sol'4 sol sol sol
   la1

   %13
   fa4 fa fa fa
   sol1
   mi4 mi mi mi

   %16
   fad1~
   fad4 fad fad2
   sol1\fermopz

   %19
   r8 sol do do sib sib sib sib
   \once\set suggestAccidentals = ##t sib?4 la r8 re re re
   si? si do do do4 si

   %22
   do r8 si\mbreak do4 re
   sol,8 sol sol sol mi mi r mi'
   re re re re mi mi la, la

   %25
   si4 r8 mi fa4 sol
   do,8 do do do la la r la
   sol sol sol sol la la re re

   %28
   mi4 r r2
   do2. do4
   re sol, r2

   %31
   r  dod4. dod8\mbreak
   re la r4 r2
   si4. si8 do sol r4

   %34
   r2 do4. do8
   si si r4 r2
   r8 fa la la la la la la

   %38
   sol sol r4 r2
   r4 r8 la si4 si

   %39
   mi,8 mi mi mi mi4. mi8
   mi mi do la r8 sold 'si sold
   mi mi r4 r8 sold si sold

   %42
   mi16 mi mi8 r4 r8 sold si sold
   mi4 la8 fa si sol si, sol\mbreak
   do mi sol mi re re r4

   %45
   r8 mi sol mi re16 re re8 r4
   r8 mi sol mi re sol sol sol
   sol sol sol sol sol4. sol8

   %48
   sol sol mi do sol'  si re si
   r do mi do r si re si
   R1

   %51
   sol,8 re'' re re mi mi mi mi
   re4. re8 mi mi do sol
   do4 si do2\fermata

}

VvlaIn = \relative do' {

   mi,2 sol
   do mi4. mi8
   mi2 r

   %4
   R1
   mi4 mi do sol
   sol2 sol

   %7
   mi'4 mi do sol\mbreak
   si1~
   si4 si si2

   %10
   sol1\fermata
   do4 do do do
   do1

   %12
   si4 si si si
   si1
   la4 la la la

   %16
   la1~
   la4 la la2
   sol1\fermata

   %19
   r4 r8 mi' fa4 sol
   do,8 do do do la la r la
   sol sol sol sol la la re re

   %22
   mi4 r \mbreak r2
   do2. do4
   re sol, r2

   %25
   r8 sol do do sib sib sib sib
   \once\set suggestAccidentals = ##t sib?4 la r8 re re re
   si? si do do do4 si

   %28
   do r8 sol la4 si
   do8 do do do do do r do
   do do si si do do re re

   %31
   sol,4 r mi'4. dod'8\mbreak
   la fa r4 r2
   re4. si'8 sol mi r4

   %34
   r2 la4. la8
   re, re r4 r2
   r8 re fad fad fad fad fad fad

   %37
   re re r4 r2
   r4 r8 re re4 do8[si]
   la si do la la4 sold

   %40
   la8 mi' do la r8 si mi si
   do do r4 r8 si mi si
   do16 do do8 r4 r8 si mi si

   %43
   la' do la fa si sol si, sol\mbreak
   do sol do sol si si r4
   r8 sol do sol si16 si si8 r4

   %46
   r8 sol do sol si si si si
   do do do do do4 si
   do8 sol' mi do sol' sol sol sol

   %49
   r sol sol sol r sol sol sol
   R1
   sol,8 si si si do do do do

   %52
   do4 si do8 do' sol mi
   re4 re mi2\fermata

}

VsopranoIn = \relative do'' {

   \autoBeamOff

   do,2 mi
   sol do4. do8
   do2 r

   %4
   R1
   mi4 do sol mi
   mi2 mi

   %7
   mi'4 do sol mi\mbreak
   fa1~
   fa4 fa fa2

   %10
   mi1\fermata
   mi'4 mi mi mi
   mi1

   %13
   re4 re re re
   re1
   do4 do do do

   %16
   do1~
   do4 do do2
   si1\fermata

   %19 Allegro
   r8 sol do do sib sib sib sib
   \once\set suggestAccidentals = ##t sib?4 la r8 re re re
   si? si do do do4 si

   %22
   do r8 si\mbreak do4 re
   sol,8 sol sol sol mi mi r mi'
   re re re re mi mi la, la

   %25
   si4 r8 mi fa4 sol
   do,8 do do do la la r la
   sol sol sol sol la la re re

   %28
   mi4 r r2
   do2. do4
   re sol, r2

   %31
   r  dod4. dod8\mbreak
   re la r4 r2
   si4. si8 do sol r4

   %34
   r2 do4. do8
   si si r4 r2
   r8 la re re do do do do

   %37
   si si r4 r2
   r4 fa' fa mi8[re]
   do re mi do si4. si8

   %40
   do4 r mi2~
   mi mi~
   mi mi

   %43
   mi r\mbreak
   sol,1
   sol

   %46
   sol2 sol8 re' re re
   mi mi mi mi re4. re8
   do4 r r8 si si si

   %49
   do do do do si4 si
   R1
   r8 re re re mi mi mi mi

   %52
   re4. re8 mi4 r8 do
   do4 si do2\fermata

}

VtestoI = \lyricmode {

   Ju -- ra -- vit Do -- mi -- nus et non pæ -- ni -- te -- bit et non pæ -- ni -- te -- bit e -- um,

   et non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit e -- um:

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech.

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech, in æ -- ter -- num

   in æ -- ter -- num in æ -- ter -- num in æ -- ter -- num, tu es sa -- cerdos _  in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech, in æ -- ter -- num in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos  _  in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech Mel -- chi -- se -- dech.

}

ValtoIn = \relative do' {

   \autoBeamOff

   sol2 do
   mi sol4. sol8
   sol2 r

   %4
   R1
   sol4 sol mi do
   do2 do

   %7
   sol'4 sol mi do\mbreak
   re1~
   re4 re re2

   %10
   do1\fermata
   sol'4 sol sol sol
   la1

   %13
   fa4 fa fa fa
   sol1
   mi4 mi mi mi

   %16
   fad1~
   fad4 fad fad2
   sol1\fermopz

   %19
   R1*3
   r8 do, sol' sol\mbreak fa fa fa fa
   fa4 mi r8 la la la

   %24
   fad8 fad sol sol sol4 fad
   sol r8 do, re4 mi
   fa?8 fa fa fa fa fa r fa

   %27
   fa fa mi mi fa fa sol sol
   do,4 r8 si' do4 re
   sol,8 sol sol sol mi mi r mi

   %30
   re re re re mi mi la la
   si4 sol2 sol4\mbreak
   fa8 fa r4 r fa~

   %33
   fa fa mi8 mi r4
   r mi2 mi4
   re8 re r4 r2

   %36
   r8 fa la la la la la la
   sol sol r4 r2
   r4 r8 la si4 si

   %39
   mi,8 mi mi mi mi4. mi8
   mi4 r r8 sold si sold
   mi mi r4 r8 sold si sold

   %42
   mi16 mi mi8 r4 r8 sold si sold
   mi4 r r2\mbreak
   r8 mi sol mi re re r4

   %45
   r8 mi sol mi re16 re re8 r4
   r8 mi sol mi re sol sol sol
   sol sol sol sol sol4. sol8

   %48
   sol4 r sol2
   sol sol4 sol
   R1

   %51
   r8 sol sol sol sol sol sol sol
   sol4 sol sol r8 sol
   sol4 sol sol2\fermata

}

VtestoII = \lyricmode {

   Ju -- ra -- vit Do -- mi -- nus et non pæ -- ni -- te -- bit et non pæ -- ni -- te -- bit e -- um,

   et non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit e -- um:

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech.

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech, in æ -- ter -- num

   in æ -- ter -- num in æ -- ter -- num tu es sa -- cerdos _  in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos  _ se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es  sa -- cerdos  _ se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech

   in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech, Mel -- chi -- se -- dech.

}

VtenoreIn = \relative do' {

   \autoBeamOff

   mi,2 sol
   do mi4. mi8
   mi2 r

   %4
   R1
   mi4 mi do sol
   sol2 sol

   %7
   mi'4 mi do sol\mbreak
   si1~
   si4 si si2

   %10
   sol1\fermata
   do4 do do do
   do1

   %12
   si4 si si si
   si1
   la4 la la la

   %16
   la1~
   la4 la la2
   sol1\fermata

   %19
   r4 r8 mi' fa4 sol
   do,8 do do do la la r la
   sol sol sol sol la la re re

   %22
   mi4 r \mbreak r2
   do2. do4
   re sol, r2

   %25
   r8 sol do do sib sib sib sib
   \once\set suggestAccidentals = ##t sib?4 la r8 re re re
   si? si do do do4 si

   %28
   do r8 sol la4 si
   do8 do do do do do r do
   do do si si do do re re

   %31
   sol,4 r mi'4. dod8\mbreak
   la re r4 r2
   re4. si8 sol do r4

   %34
   r2 la4. la8
   re re r4 r2
   r8 re fad fad fad fad fad fad

   %37
   re re r4 r2
   r4 r8 re re4 do8[si]
   la si do la la4 sold

   %40
   la r r8 si mi si
   do do r4 r8 si mi si
   do16 do do8 r4 r8 si mi si

   %43
   do4 r r2\mbreak
   r8 sol do sol si si r4
   r8 sol do sol si16 si si8 r4

   %46
   r8 sol do sol si si si si
   do do do do do4 si
   do4 r r8 re re re

   %49
   mi mi mi mi re4 re
   R1
   r8 si si si do do do do

   %52
   do4 si do r8 mi
   re4. re8 mi2\fermata

}

VtestoIII = \lyricmode {

   Ju -- ra -- vit Do -- mi -- nus et non pæ -- ni -- te -- bit et non pæ -- ni -- te -- bit e -- um,

   et non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit e -- um:

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   in æ -- ter -- num tu es sa -- cerdos _  in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech, in æ -- ter -- num

   in æ -- ter -- num in æ -- ter -- num tu es sa -- cerdos _  in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos  _ se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es  sa -- cerdos  _ se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech

   tu es  sa -- cerdos  _ in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech, Mel -- chi -- se -- dech.

}

VbassoIn = \relative do {

   \autoBeamOff

   do2 do
   do do4. do8
   do2 r

   %4
   R1
   do'4 do do do,
   do2 do

   %7
   do'4 do do do,\mbreak
   sol1~
   sol4 sol sol2

   %10
   do1\fermata
   do'4 do do do
   fa,1

   %13
   si4 si si si
   mi,1
   la4 la la la

   %16
   re,1~
   re4 re re2
   sol1\fermata

   %19
   r4 r8 do, re4 mi
   fa8 fa fa fa fa fa r fa
   fa fa mi mi re re sol sol

   %22
   do,4 r8 sol'\mbreak la4 si
   do8 do do do do do r do
   do do si si do do re re

   %25
   sol,4 r r2
   fa2. fa4
   sol do, r2

   %28
   r8 do sol' sol fa fa fa fa
   fa4 mi r8 la la la
   fad fad sol sol sol4 fad

   %31
   sol r la4. la8\mbreak
   re,8 re r4 r2
   sol4. sol8 do, do r4

   %34
   r2 fad4. fad8
   sol sol, r4 r2
   r8 re' re re re re re re

   %37
   sol sol r4 r2
   r4 r8 re' sold,4 sold
   la8 mi la la, mi'4. mi8

   %40
   la,4 r r8 mi' sold mi
   la la, r4 r8 mi' sold mi
   la16 la, la8 r4 r8 mi' sold mi

   %43
   la4 r r2\mbreak
   r8 do, mi do sol' sol r4
   r8 do, mi do sol'16 sol sol8 r4

   %46
   r8 do, mi do sol' sol sol sol
   do, do do do sol'4 sol,
   do r r8 sol' sol sol

   %49
   do, do do do sol'4 sol
   R1
   r8 sol sol sol do, do do do

   %52
   sol'4 sol, do r8 do
   sol'4 sol, do2\fermata

}

VtestoIV = \lyricmode {

   Ju -- ra -- vit Do -- mi -- nus et non pæ -- ni -- te -- bit et non pæ -- ni -- te -- bit e -- um,

   et non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit e -- um:

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech.

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   in æ -- ter -- num tu es sa -- cerdos _ in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   in æ -- ter -- num in æ -- ter -- num in æ -- ter -- num

   tu es sa -- cerdos _ in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos _   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos  _ se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech

   tu es  sa -- cerdos  _ in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech, Mel -- chi -- se -- dech.

}

VbcIn = \relative do {

   do8 \f do do do do do do do
   do do do do do do do do
   do2 r

   %4
   R1
   do8 do do do do do do do
   do2 do

   %7
   do8 do do do do do do do\mbreak
   sol1~
   sol8 sol sol sol sol sol sol sol

   %10
   do1\fermata
   do8 do do do do do do do
   fa1

   %13
   si8 si si si si si si si
   mi,1
   la8 la la la la la la la

   %16
   re,1~
   re8 re re re re re re re
   sol,1\fermata

   %19
   do4 r8 do re4 mi
   fa8 fa fa fa fa fa r fa
   fa fa mi mi fa fa sol sol

   %22
   do,4 r8 sol'\mbreak la4 si
   do8 do do do do do r do
   do do si si do do re re

   %25
   sol, \clef tenor sol do do sib sib sib sib
   <<{si4 la}\\fa2>> \clef bass fa4 fa
   sol do,8\clef tenor do' do4 si

   %28
   do8\clef bass do, sol' sol fa fa fa fa
   fa4 mi r8 la la la
   fad fad sol sol sol4 fad

   %31
   sol r la8 la la la\mbreak
   re, re, r4 r2
   sol'8 sol sol sol do, do, r4

   %34
   r2 fad'8 fad fad fad
   sol sol, r4 r2
   r8 fa'? re re re re re re

   %37
   sol sol, r4 r2
   r4 r8 re'' sold,4 sold
   la8 mi la la, mi' re mi mi,

   %40
   la mi' do la r mi' sold mi
   la la, r4 r8 mi' sold mi
   la la, r4 r8 mi' sold mi

   %43
   la do la fa si sol si, sol\mbreak
   do do mi do sol' sol, r4
   r8 do mi do sol' sol, r4

   %46
   r8 do mi do sol' sol, si sol
   do, do' mi do sol' fa sol sol,
   do sol' mi do sol' sol, si sol

   %49
   r do mi do r sol si sol
   R1
   sol8 sol' sol sol do, do do do

   %52
   sol' fa sol sol, do do' do, do
   sol' fa sol sol, do2\fermata

}

VbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1*7
   <7>1
   s1*3
   <7>1
   <7>1
   <7>1
   <7>1
   <7_+ >1
   s1*2
   s2 <6->4 <6 5->
   <5 4-> <3> <6>2
   <6 4>4 <6> <6 5>2
   s <6>4 <6 5>
   <5 4> <3> <6> s
   <6 4+> <6> <6 5> <_+>
   s1*2
   <7>1
   s2 <5 3>4 <6 4>
   s4 <6> s2
   <6 5>2 <6 4 2>
   s <7 _+>
   s1
   <7>
   s2 <7>
   s1
   s4 <_+> <7> s
   s1
   s2 <7>4 <6>8 <5>
   s2 <5 4>4 <3+>
   s2 s8 <_+> s4
   s2 s8 <_+> s4
   s2 s8 <_+> s4
   s1*4
   s2 <5 4>4 <3>
   s1*4
   <5 4>4 <3> s2
   <5 4>4 <3>

}


VvlIIIn = \relative do'' {

   R1*2
   do,2 mi
   sol do4. do8

   %5
   do2 r
   mi4 do sol mi
   mi2 mi\mbreak

   %8
   fa'4 re si sol
   fa4 fa fa2
   mi1\fermata

   %11
   R1
   la4 la la la
   la1

   %14
   sol4 sol sol sol
   sol1
   la4 la la la

   %17
   la la la2
   si1\fermata

   %19 Allegro
   R1*3
   r8 do sol' sol\mbreak fa fa fa fa
   fa4 mi r8 la la la

   %24
   fad8 fad sol sol sol4 fad
   sol r8 do, re4 mi
   fa?8 fa fa fa fa fa r fa

   %27
   fa fa mi mi fa fa sol sol
   do,4 r8 si' do4 re
   sol,8 sol sol sol mi mi r mi

   %30
   re re re re mi mi la la
   si4 sol sol4. sol8\mbreak
   r8 fa fa fa fa4 si,
   r2 r8 mi mi mi

   %34
   mi4 la, r2
   r8 sol do do sib sib sib sib
   la la r4 r2

   %37
   r8 si mi mi re re re re
   do do fa2 mi8[re]
   do re mi do si4. si8

   %40
   do mi, do la mi''2~
   mi mi~
   mi mi

   %43
   mi4 la,8 fa si sol si, sol\mbreak
   sol'1
   sol

   %46
   sol2 sol8 fa' fa fa
   mi mi mi mi re4. re8
   mi sol, mi do sol'4 r

   %49
   r2 r8 re' sol re
   r mi sol mi r re sol re
   sol,, sol'' sol sol sol sol sol sol

   %52
   sol4 sol sol8 sol mi do
   sol'4 sol sol2\fermata

}

VvlIVn = \relative do'' {

   R1*2
   sol,2 do
   mi sol4. sol8

   %5
   sol2 r
   sol4 sol mi do
   do2 do\mbreak

   %8
   si'4 si fa re
   re re re2
   do1\fermata

   %11
   R1
   fa4 fa fa fa
   fa1

   %14
   mi4 mi mi mi
   mi1
   fad4 fad fad fad

   %17
   \once\set suggestAccidentals = ##t fad? fad fad2
   re1\fermata

   %19
   r8 sol do do sib sib sib sib
   \once\set suggestAccidentals = ##t sib?4 la r8 re re re
   si? si do do do4 si

   %22
   do r8 si\mbreak do4 re
   sol,8 sol sol sol mi mi r mi'
   re re re re mi mi la, la

   %25
   si4 r8 mi fa4 sol
   do,8 do do do la la r la
   sol sol sol sol la la re re

   %28
   mi4 r r2
   do2. do4
   re sol, r2

   %31
   r  dod4. dod8\mbreak
   r8 la la la si4 sol

   %33
   r2 r8 sol sol sol
   la4 fa r2
   r8 mi sol sol sol sol sol sol

   %36
   fa fa r4 r2
   r8 sol sol sol sold sold sold sold
   mi mi r la si4 si

   %39
   mi,8 mi mi mi mi4. mi8
   mi mi do la r2
   r8 mi' la mi sold sold r4

   %42
   r8 mi la mi sold16 sold sold8 r4
   la,8 do' la fa si sol si, sol\mbreak
   do4 r4 r8 re sol re

   %45
   mi mi r4 r8 re sol re
   mi16 mi mi8 r4 re8 sol sol sol  %%%% !!!!!
   sol sol sol sol sol4. sol8

   %48
   sol sol mi do sol'4 r
   r2 r8 si re si
   r do mi do r si re si

   %51
   sol, re'' re re mi mi mi mi
   re4. re8 mi mi do sol
   do4 si do2\fermata

}

VvlaIIn = \relative do' {

   R1*2
   mi,2 sol
   do mi4. mi8

   %5
   mi2 r
   mi4 mi do sol
   sol2 sol\mbreak

   %8
   re'4 fa si, si
   si si si2
   sol1\fermata

   %11
   R1
   do4 do do do
   re1

   %14
   si4 si si si
   do1
   la4 la la la

   %17
   do do do2
   si1\fermopz

   %19 Allegro
   r4 r8 mi fa4 sol
   do,8 do do do la la r la
   sol sol sol sol la la re re

   %22
   mi4 r \mbreak r2
   do2. do4
   re sol, r2

   %25
   r8 sol do do sib sib sib sib
   \once\set suggestAccidentals = ##t sib?4 la r8 re re re
   si? si do do do4 si

   %28
   do r8 sol la4 si
   do8 do do do do do r do
   do do si si do do re re

   %31
   re4 r r2\mbreak
   r8 re re re re4 re
   r2 r8 do do do

   %34
   do4 do r2
   r8 do mi mi mi mi mi mi
   do do r4 r2

   %37
   r8 si si si si si si si
   la la r re re4 do8[si]
   la si do la la4 sold

   %40
   do8 mi do la  r2
   r8 do mi do si si r4
   r8 do mi do si16 si si8 r4

   %43
   la8 do' la fa si sol si, sol\mbreak
   si4 r r8 si re si
   do do r4 r8 si re si

   %46
   sol16 sol sol8 r4 si8 si si si
   do do do do do4 si
   do8 sol'  mi do sol'4 r

   %49
   r2 r8 sol sol sol
   r sol sol sol r sol sol sol
   sol,8 si si si do do do do

   %52
   do4 si do8 do' sol mi
   re4 re mi2\fermata

}

VsopranoIIn = \relative do'' {

   \autoBeamOff
   R1*2
   do,2 mi
   sol do4. do8

   %5
   do2 r
   mi4 do sol mi
   mi2 mi\mbreak

   %8
   fa'4 re si sol
   fa4 fa fa2
   mi1\fermata

   %11
   R1
   la4 la la la
   la1

   %14
   sol4 sol sol sol
   sol1
   la4 la la la

   %17
   la la la2
   si1\fermata

   %19 Allegro
   r8 sol do do sib sib sib sib
   \once\set suggestAccidentals = ##t sib?4 la r8 re re re
   si? si do do do4 si

   %22
   do r8 si\mbreak do4 re
   sol,8 sol sol sol mi mi r mi'
   re re re re mi mi la, la

   %25
   si4 r8 mi fa4 sol
   do,8 do do do la la r la
   sol sol sol sol la la re re

   %28
   mi4 r r2
   do2. do4
   re sol, r2

   %31
   R1\mbreak
   r8 fa' fa fa fa4 si,
   r2 r8 mi mi mi

   %34
   mi4 la, r2
   r8 sol do do sib sib sib sib
   la la r4 r2

   %37
   r8 si mi mi re re re re
   do do fa4 fa mi8[re]
   do re mi do si4. si8

   %40
   do4 r mi2~
   mi mi~
   mi mi

   %43
   mi r\mbreak
   sol,1
   sol

   %46
   sol2 sol8 re' re re
   mi mi mi mi re4. re8
   do4 r r2

   %49
   r2 r8 si si si
   do do do do si4 si
   r8 re re re mi mi mi mi

   %52
   re4. re8 mi4 r8 do
   do4 si do2\fermata

}

VtestoV= \lyricmode {

   Ju -- ra -- vit Do -- mi -- nus et non pæ -- ni -- te -- bit et non pæ -- ni -- te -- bit e -- um,

   et non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit e -- um:

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech.

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech, in æ -- ter -- num tu es sa -- cerdos _ tu es sa -- cerdos _ tu es sa -- cerdos _

   in æ -- ter -- num  tu es sa -- cerdos _ in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech, in æ -- ter -- num in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos  _  in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech Mel -- chi -- se -- dech.

}

ValtoIIn = \relative do' {

   \autoBeamOff
   R1*2
   sol2 do
   mi sol4. sol8

   %5
   sol2 r
   sol4 sol mi do
   do2 do\mbreak

   %8
   si'4 si fa re
   re re re2
   do1\fermata

   %11
   R1
   fa4 fa fa fa
   fa1

   %14
   mi4 mi mi mi
   mi1
   fad4 fad fad fad

   %17
   \once\set suggestAccidentals = ##t fad? fad fad2
   re1\fermata

   %19
   R1*3
   r8 do sol' sol\mbreak fa fa fa fa
   fa4 mi r8 la la la

   %24
   fad8 fad sol sol sol4 fad
   sol r8 do, re4 mi
   fa?8 fa fa fa fa fa r fa

   %27
   fa fa mi mi fa fa sol sol
   do,4 r8 si' do4 re
   sol,8 sol sol sol mi mi r mi

   %30
   re re re re mi mi la la
   si4 r r2\mbreak
   r8 la la la si4 sol

   %33
   r2 r8 sol sol sol
   la4 fa r2
   r8 mi sol sol sol sol sol sol

   %36
   fa fa r4 r2
   r8 sol sol sol sold sold sold sold
   mi mi r la si4 si

   %39
   mi,8 mi mi mi mi4. mi8
   mi4 r r2
   r8 mi la mi sold sold r4

   %42
   r8 mi la mi sold16 sold sold8 r4
   R1\mbreak
   r2 r8 re sol re

   %45
   mi mi r4 r8 re sol re
   mi16 mi mi8 r4 r8 sol sol sol
   sol sol sol sol sol4. sol8

   %48
   sol4 r r2
   r2 sol
   sol sol4 sol

   %51
   r8 sol sol sol sol sol sol sol
   sol4 sol sol r8 sol
   sol4 sol sol2\fermata

}

VtestoVI = \lyricmode {

   Ju -- ra -- vit Do -- mi -- nus et non pæ -- ni -- te -- bit et non pæ -- ni -- te -- bit e -- um,

   et non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit e -- um:

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech.

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech, tu es sa -- cerdos _ tu es sa -- cerdos _ tu es sa -- cerdos _

   in æ -- ter -- num  tu es sa -- cerdos _ in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos  _  se -- cundum _ or -- dinem _

   tu es sa -- cerdos  _  tu es sa -- cer - dos  se -- cundum _ or -- dinem _  Mel -- chi -- se -- dech,

   in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech Mel -- chi -- se -- dech.

}

VtenoreIIn = \relative do' {

   \autoBeamOff

   R1*2
   mi,2 sol
   do mi4. mi8

   %5
   mi2 r
   mi4 mi do sol
   sol2 sol\mbreak

   %8
   re'4 fa si, si
   si si si2
   sol1\fermata

   %11
   R1
   do4 do do do
   re1

   %14
   si4 si si si
   do1
   la4 la la la

   %17
   do do do2
   si1\fermopz

   %19 Allegro
   r4 r8 mi fa4 sol
   do,8 do do do la la r la
   sol sol sol sol la la re re

   %22
   mi4 r \mbreak r2
   do2. do4
   re sol, r2

   %25
   r8 sol do do sib sib sib sib
   \once\set suggestAccidentals = ##t sib?4 la r8 re re re
   si? si do do do4 si

   %28
   do r8 sol la4 si
   do8 do do do do do r do
   do do si si do do re re

   %31
   sol,4 r r2\mbreak
   r8 re' re re re4 re
   r2 r8 do do do

   %34
   do4 do r2
   r8 do mi mi mi mi mi mi
   do do r4 r2

   %37
   r8 si si si si si si si
   la la r \parenthesize re re4 do8[si]
   la si do la la4 sold

   %40
   la4 r r2
   r8 do mi do si si r4
   r8 do mi do si16 si si8 r4

   %43
   R1\mbreak
   r2 r8 si re si
   do do r4 r8 si re si

   %46
   sol16 sol sol8 r4 r8 si si si
   do do do do do4 si
   do4 r r2

   %49
   r2 r8 re re re
   mi mi mi mi re4 re
   r8 si si si do do do do

   %52
   do4 si do r8 mi
   re4. re8 mi2\fermata

}

VtestoVII = \lyricmode {

   Ju -- ra -- vit Do -- mi -- nus et non pæ -- ni -- te -- bit et non pæ -- ni -- te -- bit e -- um,

   et non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit e -- um:

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   in æ -- ter -- num  tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech,

   tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech, tu es sa -- cerdos _ tu es sa -- cerdos _ tu es sa -- cerdos _

   in æ -- ter -- num  tu es sa -- cerdos _ in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos  _  se -- cundum _ or -- dinem _

   tu es sa -- cerdos  _  tu es sa -- cer - dos  se -- cundum _ or -- dinem _  Mel -- chi -- se -- dech,

   tu es sa -- cer -- dos in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech Mel -- chi -- se -- dech.

}

VbassoIIn = \relative do {

   \autoBeamOff
   R1*2
   do2 do
   do do4. do8

   %5
   do2 r
   do'4 do do do,
   do2 do\mbreak

   %8
   sol'4 sol sol sol
   sol sol sol2
   do,1\fermata

   %11
   R
   fa4 fa fa fa
   si,1

   %14
   mi4 mi  mi mi
   la,1
   re4 re re re

   %17
   re4 re re2
   sol,1\fermata

   %19
   r4 r8 do re4 mi
   fa8 fa fa fa fa fa r fa
   fa fa mi mi re re sol sol

   %22
   do,4 r8 sol'\mbreak la4 si
   do8 do do do do do r do
   do do si si do do re re

   %25
   sol,4 r r2
   fa2. fa4
   sol do, r2

   %28
   r8 do sol' sol fa fa fa fa
   fa4 mi r8 la la la
   fad fad sol sol sol4 fad

   %31
   sol r r2
   r8 re re re sol4 sol
   r2 r8 do, do do

   %34
   fa4 fa r2
   r8 do do do do do do do
   fa fa r4 r2

   %37
   r8 mi mi mi mi mi mi mi
   la la r re, sold4 sold
   la8 mi la la, mi'4. mi8

   %40
   la,4 r r2
   r8 la do la mi' mi r4
   r8 la, do la mi'16 mi mi8 r4

   %43
   R1\mbreak
   r2 r8 sol si sol
   do do, r4 r8 sol' si sol

   %46
   do16 do, do8 r4 r8 sol' sol sol
   do, do do do sol'4 sol,
   do r r2

   %49
   r r8 sol' sol sol
   do, do do do sol'4 sol,
   r8 sol' sol sol do, do do do

   %52
   sol'4 sol, do r8 do
   sol'4 sol, do2\fermata

}

VtestoVIII = \lyricmode {

   Ju -- ra -- vit Do -- mi -- nus et non pæ -- ni -- te -- bit et non pæ -- ni -- te -- bit e -- um,

   et non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit non pæ -- ni -- te -- bit e -- um:

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech.

   Tu es sa -- cerdos _  in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   in æ -- ter -- num tu es sa -- cerdos _ in æ -- ter -- num

   se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos _ tu es sa -- cerdos _ tu es sa -- cerdos _ in æ -- ter -- num

   tu es sa -- cerdos _ in æ -- ter -- num se -- cundum _ or -- dinem _ Mel -- chi -- se -- dech,

   tu es sa -- cerdos  _  se -- cundum _ or -- dinem _

   tu es sa -- cer -- dos tu es sa -- cer - dos se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech, tu es sa -- cer -- dos in æ -- ter -- num se -- cundum _ or -- dinem _

   Mel -- chi -- se -- dech  Mel -- chi -- se -- dech.

}

VbcIIn = \relative do {

   R1*2
   do8 \f do do do do do do do
   do do do do do do do do

   %5
   do2 r
   do8 do do do do do do do
   do2 do\mbreak

   %8
   sol8 sol sol sol sol sol sol sol
   sol8 sol sol sol sol sol sol sol

   %10
   do1\fermata
   R1
   fa8 fa fa fa fa fa fa fa

   %13
   si,1
   mi8 mi mi mi mi mi mi mi
   la,1

   %16
   re8 re re re re re re re
   re8 re re re re re re re
   sol,1\fermata

   %19
   do4 r8 do re4 mi
   fa8 fa fa fa fa fa r fa
   fa fa mi mi fa fa sol sol

   %22
   do,4 r8 sol'\mbreak la4 si
   do8 do do do do do r do
   do do si si do do re re

   %25
   sol, \clef tenor sol do do sib sib sib sib
   \clef bass fa2 fa4 fa
   sol do,8\clef tenor do' do4 si

   %28
   do8\clef bass do, sol' sol fa fa fa fa
   fa4 mi r8 la la la
   fad fad sol sol sol4 fad

   %31
   sol r r2\mbreak
   r8 re re re sol4 sol,
   r2 r8 do do do

   %34
   fa4 fa, r2
   r8 do' do do do do do do
   fa fa, r4 r2

   %37
   r8 sol' mi mi mi mi mi mi
   la la, r re sold4 sold
   la8 mi la la, mi' re mi mi,

   %40
   la mi' do la r2
   r8 la do la mi' mi, r4
   r8 la do la mi' mi, r4

   %43
   la8 do' la fa si sol si, sol\mbreak
   do4 r r8 sol' si sol
   do do, r4 r8 sol' si sol

   %46
   do do, r4 r8 sol si sol
   do, do' mi do sol' fa sol sol,
   do sol' mi do sol'4 r

   %49
   r2 r8 sol ,si sol
   r do mi do r sol si sol
   sol sol' sol sol do, do do do

   %52
   sol' fa sol sol, do do' do, do
   sol' fa sol sol, do2\fermata

}

VbfIIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1*7
   <7>1
   s1*3
   <7>1
   <7>1
   <7>1
   <7>1
   <7_+ >1
   s1*2
   s2 <6->4 <6 5->
   <5 4-> <3> <6>2
   <6 4>4 <6> <6 5>2
   s <6>4 <6 5>
   <5 4> <3> <6> s
   <6 4+> <6> <6 5> <_+>
   s1*2
   <7>1
   s2 <5 3>4 <6 4>
   s4 <6> s2
   <6 5>2 <6 4 2>
   s1
   s2 <7>
   s1
   <7>
   s2 <7->
   s1
   s4 <_+> <7>2
   s2 <7>4 <6>8 <5>
   s2 <5 4>4 <3+>
   s1
   s2 <_+>
   s2 <_+>
   s1*4
   s2 <5 4>4 <3>
   s1*4
   <5 4>4 <3> s2
   <5 4>4 <3>

}


forma = {

   \time 4/4
   \key do\major
   \tempo 2 = 53
   s1*18
   \bar "||"\break
   \once \override Score.RehearsalMark.extra-offset = #'(10 . 0)
   \mark\markup\huge "[6.] Tu es sacerdos - All[egr]o"
   \tempo 2 = 58
   s1*35
   \bar "|."

}

VvlI = {
   \notypeset
   <<\VvlIn \forma>>

}

VvlII = {
   <<\VvlIIn \forma>>

}

VvlaI = {
   \clef alto
   <<\VvlaIn \forma>>

}

VsopranoI = {
   \new Voice = "juravit1"
   <<\VsopranoIn \forma>>
}

ValtoI = {
   \new Voice = "juravit2"
   <<\ValtoIn \forma>>
}

VtenoreI = {
   \new Voice = "juravit3"
   <<\VtenoreIn \forma>>
}

VbassoI = {
   \clef bass
   \new Voice = "juravit4"
   <<\VbassoIn \forma>>
}



VbcI = {
   \clef bass
   <<\VbcIn \forma \VbfIn>>
   \typeset
}

VvlIII = {
   <<\VvlIIIn \forma>>

}

VvlIV = {
   <<\VvlIVn \forma>>

}

VvlaII = {
   \clef alto
   <<\VvlaIIn \forma>>

}

VsopranoII= {
   \new Voice = "juravit5"
   <<\VsopranoIIn \forma>>
}

ValtoII= {
   \new Voice = "juravit6"
   <<\ValtoIIn \forma>>
}

VtenoreII = {
   \new Voice = "juravit7"
   <<\VtenoreIIn \forma>>
}

VbassoII = {
   \clef bass
   \new Voice = "juravit8"
   <<\VbassoIIn \forma>>
}



VbcII = {
   \clef bass
   <<\VbcIIn \forma \VbfIIn>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



VIvlIn = \relative do'' {

   mi8.[fa16 sol8 mi] re mi fa4\tr
   mi r8 mi mi16 fa mi do mi fa  mi do
   sol' la sol mi sol la sol mi  re8 sol, r re'

   %4
   mi16 fa  mi do mi fa  mi do sol' la sol mi sol la sol mi
   re4 r8 sol sol16[la sol fa mi re do \parenthesize sib]
   la8 do r la'~la16 sol fa  mi re do si la

   %7
   sol8 si r sol'~sol16 [fa mi re do si la sol]
   fa8 la r fa' mi16 sol fa mi re4\tr
   do r r2

   %10
   R1*3
   r2 re16 mi re si re mi re si
   sol4 r r2

   %15
   R1*6
   r2 mi'16 fa mi do mi fa mi do
   re mi re si re mi re si do re do la do re do la

   %23
   la'8 do, si sold'\mbreak la4 r
   R1*12
   mi16 fa mi do mi fa mi do\mbreak sol'8 r sol r

   %37
   mi16 fa mi do mi fa mi do sol'4 r
   R1*3
   mi16 fa mi do mi fa mi do sol'4 r

   %42
   R1*2
   r2 sol16[la sol fa mi re do sib]
   la8 do r la' r16 sol [fa  mi re do si la]

   %46
   sol8 si r sol' r16 fa [mi re do si la sol]
   fa8 la r fa' mi16 sol fa mi re4\tr
   do1\fermata

}

VIvlIIn = \relative do'' {

    do8.[re16 mi8 do] si do re4\tr
    do r8 do do16 re do sol do re do sol
    mi' fa mi do mi fa mi do si8 si r si

    %4
    do16 re do sol do re do sol mi' fa mi do mi fa mi do
    si4 r r r8 do
    do16 re do si la sol fa mi re8 fa r re'~

    %7
    re16 do si la sol fa mi re do8 mi r do'~
    do16 si la sol fa mi re si' do mi re do si4\tr
    do r r2

    %10
    R1*3
    r2 si16 do si sol si do si sol
    mi4 r r2

    %15
    R1*6
    r2 do'16 re do la do re do la
    si do si sold si do si sold la si la mi la si la mi

    %23
    do'8 la sold mi' do4 r
    R1*12
    do16 re do sol do re do sol\mbreak mi'8 r mi r

    %37
    do16 re do sol do re do sol mi'4 r
    R1*3
    do16 re do sol do re do sol mi'4 r

    %42
    R1*3
    do16 re do si la sol fa  mi\mbreak re8 fa r re'
    r16 do[si la sol fa mi re] do8 mi r do'

    %47
    r16 si[la sol fa mi re si'] do mi re do si4\tr
    do1\fermata

}

VIvlaIn = \relative do' {

    sol'4 r8 sol sol sol re si
    sol'4 sol sol sol
    sol sol sol sol
    sol sol sol sol
    sol sol mi8 r mi r
    do r do r re r fa r
    sol r si, r do r mi r
     fa r re si sol la' re, sol
     mi4 r r2
     R1*3
     r2 sol,8 r sol r
     sol4 r r2
     R1*6
     r2 mi'8 mi mi mi
     sold sold sold sold mi mi mi mi
     mi mi mi mi mi4 r
     R1*12
     sol8 r sol r\mbreak sol r sol r
     sol r sol r sol4 r
     R1*3
     sol8 r sol r sol4 r
     R1*2
     r2 mi8 r mi r
     do r do r\mbreak re r fa r
     sol r si, r do r mi r
     fa r re si sol la' re, sol
     mi1\fermata

}

VItenoreIn = \relative do' {

    \autoBeamOff

    R1*8
    do8. do,16 do8 do' mi do do4
    si r\mbreak r r8 si

    %11
    do sol r do mi do r sol
    do sol mi' do sol4. do8
    do2\tr si4 r8 si

    %14
    do16[re do sol] do[re do sol] la8 [do] r la
    re16[mi re la] re[mi re la] si8[re] r si
    mi16[re do si] mi[re do si] do8[la] do mi

    %17
    re16[do] si[la] re[do] si[la] la8 sold r mi'
    re mi, r re' do mi, r do'\mbreak
    si16[mi, fad sold la si do re] mi[re do si] mi[re do si]

    %20
    do8 la r la do la do16[si] do[re]
    mi8 la, si4\tr la r
    R1

    %23
    r2 la16[si] do[re] mi8 la,
    mi' la, la4\tr sold r
    r r8 mi' mi16[re do si] la[sol fa mi]

    %26
    fa8 [la] r re r16 do[si la] sol[fa mi re]
    mi8 [sol] r do~do16[re mi re do si la sol]\mbreak
    la8 la4 re8~re16[mi fa mi] re[do si la]

    %29
    si[do re do] si[sol la si] do8 do, r mi'
    re do16[si] do8 do do si r si
    si la16[sol] la8 la la sol r sol

    %32
    sol16[la sol mi] sol[la sol mi] la[si la fa] la[si la fa]
    si[do si sol] si [do si sol] do[re do la] do[re do la]
    re[mi re si] re[mi re si] mi8 do r sol

    %35
    mi fa16[sol] la[si] do[re] mi8 do si4\tr
    do r8 mi,\mbreak sol mi do' sol
    mi' do r mi mi16[do do do] mi[do do do]

    %38
    fa,8[la re] r re16[si si si] re[si si si]
    mi,8[sol do] r si16[do si sol] si[do si sol]
    do[re do sol] do[re do sol] re'[mi re sol,] re'[mi re sol,]

    %41
    mi'8 do r sol mi fa16[sol] la[si] do[re]
    mi8 do si4 do8 mi re sol,
    r mi' do sol mi fa16[sol] la[si] do[re]

    %44
    mi8 do si4\tr do r
    R1*4

}

VItestoI = \lyricmode {

    Do -- minus _ a dex -- tris tu -- is: con  -- fregit _ con  -- fregit _ in di -- e i -- ræ su -- æ re -- ges,

    con  -- fre - - - - - - - - - - git in di -- e i -- ræ su -- æ con  -- fregit _ con  -- fregit _ con  --

    fre - - - git  in di -- e i -- ræ su -- æ re -- ges.

    Do -- minus _ a dex -- tris tu -- is: con  -- fre - - - - - - - - - - - - - -  git in di -- e i -- ræ su -- æ

    in di -- e i -- ræ su -- æ con  -- fre - - - - - - - - - - git in di -- e i -- ræ su -- æ re -- ges

    in di -- e i -- ræ su -- æ con  -- fre - - - - - - - - - - - - git in di -- e i -- ræ su -- æ re -- ges

    con  -- fregit _ con  -- fregit _ con  -- fre - - - git re -- ges.

}

VIbassoIn = \relative do {

    \autoBeamOff

    R1*9
    sol'8. sol,16 sol8 sol'\mbreak si sol fa4
    mi8 do mi do r mi sol mi

    %12
    r do sol' mi do' sol mi do
    fad2 sol4 r
    r r8 do, fa16 [sol fa do] fa[sol fa do]

    %15
    re8[fa] r re sol16[la sol re] sol[la sol re]
    mi8[sol] r mi la16[sol fa mi] la[sol] fa[mi]
    fa8 re fa re mi mi r4

    %18
    r8 mi sold mi r la, do la\mbreak
    r2 r4 r8 mi'
    la16[la, si do re mi fa sol] la[sol fa mi] la[sol fa mi]

    %21
    la8 la, mi'4 la, r
    R1*2
    r2 mi'16[fad] sold[la] si8 mi,

    %25
    si' mi, re4\tr do r8 la'
    la16[sol fa mi] re[do si la] si8[re] r sol
    r16 fa[mi re do s la sol] la8[do] r fa~\mbreak

    %28
    fa16[sol la sol fa mi re do] re8 re4 sol8~
    sol16[la si la] sol[fa mi re] mi8 do r do'
    si la16[sol] la8 la la sol r sol

    %31
    sol fa16[mi] fa8 fa fa mi r4
    r2 r4 r8 fa
    sol16[la sol mi] sol[la sol mi] la[si la fa] la[si la fa]

    %34
    si[do si sol] si [do si sol] do8 do, r mi
    do re16[mi] fa[sol] la[si] do8 do, sol'4
    do, r8 do\mbreak mi do sol' mi

    %37
    do' do, r4 r r8 sol'
    la16 [fa fa fa] la [fa fa fa] si,8[ re sol] r
    sol16[mi mi mi] sol[mi mi mi] sol8 sol, r sol'

    %40
    sol sol, sol'8. sol16 sol8 sol, sol'8. sol16
    sol8 sol, r mi' do re16[mi] fa[sol] la[si]
    do8 do, sol'4 do, r8 sol'

    %43
    mi do r mi do [re16 mi fa sol la si]
    do8 do, sol'4 do, r
    R1*4

}



VItestoII = \lyricmode {

    Do -- minus _ a dex -- tris tu -- is: con  -- fregit _ con  -- fregit _ in di -- e i -- ræ su -- æ re -- ges,

    con  -- fre - - - - - - - - git in di -- e i -- ræ su -- æ con  -- fregit _ con  -- fregit _ con  --

    fre - - - git  re -- ges.

    Do -- minus _ a dex -- tris tu -- is: con  -- fre - - - - - - - - - - - git in di -- e i -- ræ su -- æ

    in di -- e i -- ræ su -- æ con  -- fre - - - - - - git in di -- e i -- ræ su -- æ re -- ges

    in di -- e i -- ræ su -- æ con  -- fre - - - - - git in di -- e i -- ræ su -- æ i -- ræ su -- æ


    in di -- e i -- ræ su -- æ re -- ges

    con  -- fregit _ con  -- fre - git re -- ges.

}

VIbcIn = \relative do {

    do4 r8 do sol' do, si sol
    do'16 re do sol do re do sol do,4 do
    do do sol'16 la sol sol, sol' la sol sol,

    %4
    do4 do do do
    sol'16 la sol sol, sol' la sol sol, do8 r do' r
    fa, r fa, r si r si' r

    %7
    mi, r mi, r la r la' r
    re, r re,8 sol do fa sol sol,
    do re mi re do re mi fad

    %10
    sol, la si la\mbreak sol la si sol
    do, do' mi do do, do' mi do
    do, do' do do, do do' mi do

    %13
    fad mi fad re sol, sol' sol sol,
    do r do r fa? r fa r
    fa, r fad' r sol r sol, r

    %16
    sol r sold' r la r la, r
    re r re r mi, mi' sold mi
    mi, mi' sold mi la la, do la\mbreak

    %19
    mi' r mi, r mi' r mi, r
    la' r la, r la' r la, r
    la' la, mi' mi, la r la r

    %22
    mi' r mi r la, r la r
    la la mi' mi, la si do si
    la si do re mi fad sold mi

    %25
    mi, fad sold mi la' r la, r
    re r fa, r sol r si r
    do r mi, r fa r fa r\mbreak

    %28
    fa r fa r fa r fad r
    sol r sol r do, do' mi do
    r2 r8 sol si sol

    %31
    r2 r8 do mi do
    r do mi do fa re fa re
    sol mi sol mi la fa la fa

    %34
    si sol si sol do do, mi do
    do4 r8 sol' do do, sol' sol,
    do r do r\mbreak do r do r

    %37
    do r do r do r do r
    fa r fa r si, r si r
    mi r mi do sol r sol r

    %40
    sol r sol r sol r sol r
    do r do r do4 r8 sol'
    do do, sol'[sol,] do r sol' r

    %43
    do, r do r do4 r8 sol'
    do do, sol' sol, do r do' r
    fa, r fa, r\mbreak si r si' r

    %46
    mi, r mi, r la r la' r
    re, r re, sol do fa sol[sol,]
    do,1\fermata

}

VIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*12
    <6 5>1
    s
    <6>
    <6>
    s2 <5 4>8 <3+> s4
    <7>1
    s1*3
    <7 _+>1
    s4 <_+> s2
    s <_+>
    s4 s8 <7> s2
    s1*12
    <7>2 <7>
    <7>1
    <6 4>2 <5 3>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*48
    \bar "|."

}

VIvlI = {
    \notypeset
    <<\VIvlIn \forma>>

}

VIvlII = {
    <<\VIvlIIn \forma>>

}

VIvlaI = {
    \clef alto
    <<\VIvlaIn \forma>>

}

VItenoreI = {
    \new Voice = "dextris1"
    <<\VItenoreIn \forma>>
}

VIbassoI = {
    \new Voice = "dextris2"
   \clef bass
    <<\VIbassoIn \forma>>
}



VIbcI = {
    \clef bass
    <<\VIbcIn \forma \VIbfIn>>
    \typeset
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



VIIobIn = \relative do'' {

    \set Staff.midiInstrument = #"trumpet"  re4^\markup\italic"Tromba sola" la fad
    re r r
    la'8. la16 re8.[re16] fad8. fad16

    %4
    la4 r r
    re,~re16 mi32 fad sol la si dod re4
    re, la fad

    %7
    re r r
    R2.*10
    \set Staff.midiInstrument = #"oboe" la'2.^\markup\italic "Haut[bois] Solo"

    %19
    si
    do\mbreak
    si4 r r

    %22
    si2.
    dod?
    re

    %25
    dod4 r r
    la'8.\f\tu[la16 fad8. fad16 re8. re16]
    la8.[la16 fad8. fad16 re8. re16]

    %28
    la'4 la2\tr
    re,4 r r
    re8.[re16 re8. re16 re8. re16]

    %31
    re4 r r
    la'8.[la16 la8. la16 la8. la16]
    re,4 r r

    %34
    re8.[re16 re8. re16 re8. re16]
    \set Staff.midiInstrument = #"trumpet"  re'4^\markup\italic"Tromba sola" la fad
    re r r

    %37
    r8 fad' la fad la fad
    r fad, la fad la fad
    r8 fad' la fad la fad

    %40
    r mi la mi la mi\mbreak
    R2.*7
    fa4 fa fa

    %49
    mi4. mi8 mi4\fermata

}

VIIobIIn = \relative do'' {

    R2.*17
    fad,2.
    sol

    %20
    la\mbreak
    sol4 r r
    sold2.

    %23
    la
    si
    la4 r r

    %26
    fad'8.\f[fad16 re8. re16 la8. la16]
    fad8.[fad16 re8. re16 si8. si16]
    la'4 la2\tr

    %29
    re,4 r r
    re8.[re16 re8. re16 re8. re16]

    %31
    re4 r r
    la'8.[la16 la8. la16 la8. la16]
    re,4 r r

    %34
    re8.[re16 re8. re16 re8. re16]
    re4 r r
    R2.

    %37
    r8 re' fad re fad re
    r re, fad re fad re
    r re' fad re fad re

    %40
    r dod mi dod mi dod\mbreak
    R2.*7
    re4 re re

    %49
    dod4. dod8 dod4\fermata

}


VIIvlIn = \relative do'' {

    R2.*13
    r8 mi\p la mi la mi
    R2.

    %16
    r8 mi,\pp la mi la mi
    R2.*9
    la'8.\f[la16 fad8. fad16 re8. re16]

    %27
    la8.[la16 fad8. fad16 re8. re16]
    la'4 la,2\tr
    re4 r r
    re8.[re16 re8. re16 re8. re16]

    %31
    re4 r r
    la8.[la16 la8. la16 la8. la16]
    re4 r r

    %34
    re8.[re16 re8. re16 re8. re16]
    re4 r r
    R2.

    %37
    r8 fad' la fad la fad
    r fad, la fad la fad
    r8 fad' la fad la fad

    %40
    r mi la mi la mi\mbreak
    R2.*7
    fa4 fa fa

    %49
    mi4. mi8 mi4\fermata

}

VIIvlIIn = \relative do'' {

    R2.*13
    r8 dod\p mi dod mi dod
    R2.

    %16
    r8 dod,\pp mi dod mi dod
    R2.*9

    %26
    fad'8.\f[fad16 re8. re16 la8. la16]
    fad8.[fad16 re8. re16 si8. si16]
    la'4 la,2\tr

    %29
    re4 r r
    re8.[re16 re8. re16 re8. re16]

    %31
    re4 r r
    la8.[la16 la8. la16 la8. la16]
    re4 r r

    %34
    re8.[re16 re8. re16 re8. re16]
    re4 r r
    R2.

    %37
    r8 re' fad re fad re
    r re, fad re fad re
    r re' fad re fad re

    %40
    r dod mi dod mi dod\mbreak
    R2.*7
    re4 re re

    %49
    dod4. dod8 dod4\fermata

}

VIIvlaIn = \relative do' {

    R2.*13
    la4\p la la
    R2.

    %16
    la4\pp la la
    R2.
    re8 re re re re re

    %19
    re re re re re re
    re re re re re re\mbreak
    re4 r r

    %22
    mi8 mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %25
    mi4 r r
    re'8.\f[re16 la8. la16 fad8. fad16]
    re8.[re16 la8. la16 fad8. fad16]

    %28
    la'4 la,2 \tr
    re4 r r
    re8.[re16 re8. re16 re8. re16]

    %31
    re4 r r
    la8.[la16 la8. la16 la8. la16]
    re4 r r

    %34
    re8.[re16 re8. re16 re8. re16]
    re4 r r
    R2.
    r8 la' re la re la

    %38
    r la, re la re la
    r la' re la re la
    r la dod la dod la\mbreak

    %41
    R2.*7
    si4 si si
    mi,4. mi8 mi4\fermata

}

VIIsopranoIn = \relative do'' {

    \autoBeamOff
    R2.*28
    la2 fad4
    re2 re4

    %31
    re fad re
    la'4. la8 la4
    re la fad

    %34
    re4. re8 re4
    R2.*2
    fad'2 fad4

    %38
    fad2 fad4
    fad fad fad
    mi4. mi8 mi4\mbreak

    %41
    R2.*7
    fa4 fa fa
    mi4. mi8 mi4\fermata

}

VIItestoI = \lyricmode {

    Ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus, _

    ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus. _

}

VIIaltoIn = \relative do' {

    \autoBeamOff

    R2.*28
    la'2 fad4
    re2 re4

    %31
    re fad re
    sol4. sol8 sol4
    re' la fad

    %34
    re4. re8 re4
    R2.*2
    la'2 la4

    %38
    la2 la4
    la la la
    la4. la8 la4\mbreak

    %41
    R2.*7
    si4 si si
    mi,4. mi8 mi4\fermata

}

VIItestoII = \lyricmode {

     Ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus, _

    ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus. _

}

VIItenoreIn = \relative do' {

    \autoBeamOff

    R2.*28
    la2 fad4
    re2 re4

    %31
    re fad re
    la'4. la8 la4
    re la fad

    %34
    re4. re8 re4
    R2.*2
    re'2 re4

    %38
    re2 re4
    re re re
    dod4. dod8 dod4\mbreak

    %41
    R2.*7
    re4 re re
    dod4. dod8 dod4\fermata

}

VIItestoIII = \lyricmode {

    Ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus, _

    ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus. _

}

VIIbassoIn = \relative do {

    \autoBeamOff

    R2.*28
    la'2 fad4
    re2 re4

    %31
    re fad re
    la'4. la8 la4
    re la fad

    %34
    re4. re8 re4
    R2.*2
    re2 re4

    %38
    re2 re4
    re re re
    la4. la8 la4\mbreak

    %41
    R2.*4
    re'4 la fad
    re4. re8 re4

    %47
    R2.
    sold4 sold sold
    la4. la8 la4\fermata

}

VIItestoIV = \lyricmode {

    Ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus, _

    ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus. _

}

VIIbcIn = \relative do {

    R2.*7
    re'8.\f^\markup\italic "Organi soli" [re16 re8. re16 re8. re16]
    mi,4 r r

    %10
    dod'8.[dod16 dod8. dod16 dod8. dod16]
    re,4 r r
    si'8.[si16 si8. si16 si8. si16]

    %13
    sold,2.
    la4 r r
    R2.*6

    %21
    r8 sol'\f ^\markup\italic "Organi soli" sol re si sol
    R2.*3
    r8 la'\f la mi dod la

    %26
    re8. [re16 re8. re16 re8. re16]
    re8. [re16 re8. re16 re8. re16]
    la'4 la,2\tr

    %29
    re4 r r
    re8. [re16 re8. re16 re8. re16]
    re4 r r

    %32
    la8.[la16 la8. la16 la8. la16]
    re4 r r
    re8. [re16 re8. re16 re8. re16]

    %35
    re4 r r
    R2.
    r8 re re re re re

    %38
    r8 re re re re re
    r8 re re re re re
    r la la la la la\mbreak

    %41
    R2.*7
    sold'4^\f sold sold
    la4. la8 la,4_\fermata

}

VIIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*47
    <7->2.

}


VIItpn = \relative do'' {

    R2.
    \set Staff.midiInstrument = #"trumpet"  re4^\markup\italic"Tromba sola" la fad
    re r r

    %4
    la'8. la16 re8.[re16] fad8. fad16
    la4 r r
    re,~re16 mi32 fad sol la si dod re4

    %7
    re, la fad
    re r r
    R2.*17

    %26
    la''8.\f\tu[la16 fad8. fad16 re8. re16]
    la8.[la16 fad8. fad16 re8. re16]

    %28
    la'4 la2\tr
    re,4 r r
    re8.[re16 re8. re16 re8. re16]

    %31
    re4 r r
    la'8.[la16 la8. la16 la8. la16]
    re,4 r r

    %34
    re8.[re16 re8. re16 re8. re16]
    re4 r r
    re'4 ^\markup\italic"Tromba sola" la fad

    %37
    re r r
    R2.*10
    fa'4\f fa fa

    %49
    mi4. mi8 mi4\fermata

}


VIIvlIIIn = \relative do'' {

    R2.*14
    r8 fad\p la fad la fad
    R2.

    %17
    r8 fad,\pp la fad la fad
    R2.*8
    la'8.\f[la16 fad8. fad16 re8. re16]

    %27
    la8.[la16 fad8. fad16 re8. re16]
    la'4 la,2\tr
    re4 r r
    re8.[re16 re8. re16 re8. re16]

    %31
    re4 r r
    la8.[la16 la8. la16 la8. la16]
    re4 r r

    %34
    re8.[re16 re8. re16 re8. re16]
    re4 r r
    R2.*5\mbreak

    %41
    r8 fad\pp la fad la fad
    r re fad re fad re
    r fad la fad la fad

    %44
    r mi la mi la mi
    R2.*3
    fa'4\f fa fa

    %49
    mi4. mi8 mi4\fermata

}

VIIvlIVn = \relative do'' {

    R2.*14
    r8 re\p fad re fad re
    R2.

    %17
    r8 re,\pp fad re fad re
    R2.*8

    %26
    fad'8.\f[fad16 re8. re16 la8. la16]
    fad8.[fad16 re8. re16 si8. si16]
    la'4 la,2\tr

    %29
    re4 r r
    re8.[re16 re8. re16 re8. re16]

    %31
    re4 r r
    la8.[la16 la8. la16 la8. la16]
    re4 r r

    %34
    re8.[re16 re8. re16 re8. re16]
    re4 r r
    R2.*5

    %41
    r8 re\pp fad re fad re
    r la re la re la
    r re fad re fad re

    %44
    r dod mi dod mi dod\mbreak
    R2.*3
    re'4\f re re

    %49
    dod4. dod8 dod4\fermata

}

VIIvlaIIn = \relative do' {

    R2.*14
    la4\p la la
    R2.

    %17
    la4\pp la la
    R2.*8
    re'8.\f[re16 la8. la16 fad8. fad16]

    %27
    re8.[re16 la8. la16 fad8. fad16]
    la'4 la,2 \tr
    re4 r r
    re8.[re16 re8. re16 re8. re16]

    %31
    re4 r r
    la8.[la16 la8. la16 la8. la16]
    re4 r r

    %34
    re8.[re16 re8. re16 re8. re16]
    re4 r r
    R2.*5\mbreak

    %41
    r8 la\pp re la re la
    r fad la fad la fad
    r la re la re la

    %44
    r la dod la dod la
    R2.*3
    si'4\f si si

    %49
    mi,4. mi8 mi4\fermata

}

VIIsopranoIIn = \relative do'' {

    \autoBeamOff
    R2.*28
    la2 fad4
    re2 re4

    %31
    re fad re
    la'4. la8 la4
    re la fad

    %34
    re4. re8 re4
    R2.*2
    fad'2 fad4

    %38
    fad2 fad4
    fad fad fad
    mi4. mi8 mi4\mbreak

    %41
    fad,2^\pp fad4
    fad2 fad4
    fad fad fad

    %44
    mi4. mi8 mi4
    R2.*3
    fa'4^\f fa fa

    %49
    mi4. mi8 mi4\fermata

}

VIItestoV= \lyricmode {

    Ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus, _

    ju -- di -- ca -- bit in na -- ti -- o -- nibus _ ju -- di -- ca -- bit in na -- ti -- o -- nibus _

    in na -- ti -- o -- nibus. _

}

VIIaltoIIn = \relative do' {

    \autoBeamOff
    R2.*28
    la'2 fad4
    re2 re4

    %31
    re fad re
    sol4. sol8 sol4
    re' la fad

    %34
    re4. re8 re4
    R2.*2
    la'2 la4

    %38
    la2 la4
    la la la
    la4. la8 la4\mbreak

    %41
    re,2^\pp re4
    re2 re4
    re re re

    %44
    dod4. dod8 dod4
    R2.*3
    si'4^\f si si

    %49
    mi,4. mi8 mi4\fermata

}

VIItestoVI = \lyricmode {

    Ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus, _

    ju -- di -- ca -- bit in na -- ti -- o -- nibus _ ju -- di -- ca -- bit in na -- ti -- o -- nibus _

    in na -- ti -- o -- nibus. _

}

VIItenoreIIn = \relative do' {

    \autoBeamOff
    R2.*28
    la2 fad4
    re2 re4

    %31
    re fad re
    la'4. la8 la4
    re la fad

    %34
    re4. re8 re4
    R2.*2
    re'2 re4

    %38
    re2 re4
    re re re
    dod4. dod8 dod4\mbreak

    %41
    la2^\pp la4
    la2 la4
    la la la

    %44
    la4. la8 la4
    R2.*3
    re4^\f  re re

    %49
    dod4. dod8 dod4\fermata

}

VIItestoVII = \lyricmode {

    Ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus, _

    ju -- di -- ca -- bit in na -- ti -- o -- nibus _ ju -- di -- ca -- bit in na -- ti -- o -- nibus _

    in na -- ti -- o -- nibus. _

}

VIIbassoIIn = \relative do {

    \autoBeamOff
    R2.*28
    la'2 fad4
    re2 re4

    %31
    re fad re
    la'4. la8 la4
    re la fad

    %34
    re4. re8 re4
    R2.*2
    re2 re4

    %38
    re2 re4
    re re re
    la4. la8 la4\mbreak

    %41
    re2^\pp re4
    re2 re4
    re re re

    %44
    la4. la8 la4
    R2.
    re'4^\f la fad

    %47
    re4. re8 re4
    sold4 sold sold
    la4. la8 la4\fermata

}

VIItestoVIII = \lyricmode {

    Ju -- di -- ca -- bit in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus, _

    ju -- di -- ca -- bit in na -- ti -- o -- nibus _ ju -- di -- ca -- bit in na -- ti -- o -- nibus _

    in na -- ti -- o -- nibus _ in na -- ti -- o -- nibus. _

}

VIIbcIIn = \relative do {

    R2.*7
    re'8.\f^\markup\italic "Organi soli" [re16 re8. re16 re8. re16]
    mi,4 r r

    %10
    dod'8.[dod16 dod8. dod16 dod8. dod16]
    re,4 r r
    si'8.[si16 si8. si16 si8. si16]

    %13
    sold,2.
    la4 r r
    R2.*6

    %21
    r8 sol'\f ^\markup\italic "Organi soli" sol re si sol
    R2.*3
    r8 la'\f la mi dod la

    %26
    re8. [re16 re8. re16 re8. re16]
    re8. [re16 re8. re16 re8. re16]
    la'4 la,2\tr

    %29
    re4 r r
    re8. [re16 re8. re16 re8. re16]
    re4 r r

    %32
    la8.[la16 la8. la16 la8. la16]
    re4 r r
    re8. [re16 re8. re16 re8. re16]

    %35
    re4 r r
    R2.*5
    r8 re\pp re re re re

    %42
    r8 re re re re re
    r8 re re re re re
    r la la la la la

    %45
    R2.*3
    sold'4^\f sold sold
    la4. la,8 la4\fermata

}

VIIbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s2.*47
    <7->2.

}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key re\major
    \tempo 2 = 42
    s2.*49
    \bar "|."

}

VIIobI = {
    \notypeset
    <<\VIIobIn \forma>>

}

VIIobII = {
    <<\VIIobIIn \forma>>

}

VIIvlI = {
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    <<\VIIvlIIn \forma>>

}

VIIvlaI = {
    \clef alto
    <<\VIIvlaIn \forma>>

}

VIIsopranoI = {
    \new Voice = "judicabit1"
    <<\VIIsopranoIn \forma>>
}

VIIaltoI = {
    \new Voice = "judicabit2"
    <<\VIIaltoIn \forma>>
}

VIItenoreI = {
    \new Voice = "judicabit3"
    <<\VIItenoreIn \forma>>
}

VIIbassoI = {
    \new Voice = "judicabit4"
    \clef bass
    <<\VIIbassoIn \forma>>
}



VIIbcI = {
    \clef bass
    <<\VIIbcIn \forma \VIIbfIn>>
    \typeset
}

VIItp = {
    <<\VIItpn \forma>>

}

VIIvlIII = {
    <<\VIIvlIIIn \forma>>

}

VIIvlIV = {
    <<\VIIvlIVn \forma>>

}

VIIvlaII = {
    \clef alto
    <<\VIIvlaIIn \forma>>

}

VIIsopranoII= {
    \new Voice = "judicabit5"
    <<\VIIsopranoIIn \forma>>
}

VIIaltoII= {
    \new Voice = "judicabit6"
    <<\VIIaltoIIn \forma>>
}

VIItenoreII = {
    \new Voice = "judicabit7"
    <<\VIItenoreIIn \forma>>
}

VIIbassoII = {
    \new Voice = "judicabit8"
    \clef bass
    <<\VIIbassoIIn \forma>>
}



VIIbcII = {
    \clef bass
    <<\VIIbcIIn \forma \VIIbfIIn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



VIIIvlIn = \relative do'' {

    mi16 mi
    sold sold mi mi r8 sold16 sold la la mi mi r8 mi16 mi
    lad lad fad fad r8 lad16 lad si si fad fad r8 fad16 fad
    sid sid sold sold r8 sid16 sid dod8 sold16 sold sold8 mi16 mi

    %4
    mi8 dod16 dod dod8 sold sold mi16 mi mi8 r\mbreak
    mi
    la32 la la la la [la la la] la la la la
    sold sold sold sold sold[sold sold sold] sold sold sold sold

    %7
    fad fad fad fad fad[fad fad fad] fad fad fad fad
    mi mi mi mi mi[mi mi mi] mi mi mi mi
    mi' mi mi mi mi[mi mi mi] mi mi mi mi

    %10
    re re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si si mi, mi mi[mi mi mi] mi[mi mi mi]

    %13
    la la la la la [la la la] la la la la
    la la la la la8\noBeam r
    si32 si si si si[si si si] si si si si

    %16
    si si si si si[si si si] r8
    dod32 dod dod dod dod[dod dod dod] dod dod dod dod
    dod[dod dod dod] dod dod dod dod la[la la la]

    %19
    re re re re re[re re re] re re re re\mbreak
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si32 si si si si[si si si] si si si si

    %22
    la la la la la [la la la] la la la la
    sold sold sold sold mid[mid mid mid] fad fad fad fad
    si, si si si dod[dod dod dod] dod dod dod dod

    %25
    fad fad fad fad fad[fad fad fad] r8
    lad'32[lad lad lad] lad lad lad lad lad[lad lad lad]
    fad fad fad fad fad[fad fad fad] fad fad fad fad

    %28
    sold sold sold sold sold[sold sold sold] sold sold sold sold
    mi mi mi mi mi[mi mi mi] mi, mi mi mi
    la la la la la [la la la] la la la la

    %31
    sold sold sold sold sold[sold sold sold] sold sold sold sold
    fad fad fad fad  mi[mi  mi mi] re re re re
    dod dod dod dod si[si si si] la la la la

    %34
    re re re re mi[mi mi mi] mi mi mi mi
    la la la la la [la la la] la la la la
    la la la la la [la la la] la la la la

    %37
    la la la la la [la la la] la la la la
    re re re re mi[mi mi mi] mi, mi mi mi
    la4.\fermata

}

VIIIvlIIn = \relative do'' {

    la16 la
    si si sold sold r8 mi'16 mi dod dod la la r8 dod16 dod
    dod dod lad lad r8 fad'16 fad re re si si r8 re16 re
    red red sid sid r8 sold'16 sold mi8 dod16 dod dod8 sold16 sold

    %4
    \once\set suggestAccidentals = ##t sold?8[mi16 mi mi8 dod] dod dod16 dod dod8 r\mbreak
    mi
    la32 la la la la [la la la] la la la la
    sold sold sold sold sold[sold sold sold] sold sold sold sold

    %7
    fad fad fad fad fad[fad fad fad] fad fad fad fad
    mi mi mi mi mi[mi mi mi] mi mi mi mi
    mi' mi mi mi mi[mi mi mi] mi mi mi mi

    %10
    re re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si si mi, mi mi[mi mi mi] mi[mi mi mi]

    %13
    mi[mi mi mi] mi[mi mi mi] mi mi mi mi
    fad fad fad fad fad8\noBeam r
    fad32 fad fad fad fad[fad fad fad] fad fad fad fad

    %16
    sol sol sol sol sol[sol sol sol] r8
    sol32 sol sol sol sol[sol sol sol]  sol sol sol sol
    la la la la la[la la la] la la la la

    %19
    re re re re re[re re re] re re re re\mbreak
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si32 si si si si[si si si] si si si si

    %22
    la la la la la [la la la] la la la la
    sold sold sold sold mid[mid mid mid] fad fad fad fad
    si, si si si dod[dod dod dod] dod dod dod dod

    %25
    fad fad fad fad fad[fad fad fad] r8
    mi'32[mi mi mi] mi[mi mi mi] mi mi mi mi
    re re re re re[re re re] re re re re

    %28
    re re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] mi, mi mi mi
    la la la la la [la la la] la la la la

    %31
    sold sold sold sold sold[sold sold sold] sold sold sold sold
    fad fad fad fad  mi[mi  mi mi] re re re re
    dod dod dod dod si[si si si] la la la la

    %34
    re re re re mi[mi mi mi] mi mi mi mi
    la la la la la [la la la] la la la la
    la la la la la [la la la] la la la la

    %37
    la la la la la [la la la] la la la la
    re re re re mi[mi mi mi] mi, mi mi mi
    la4.\fermata

}

VIIIvlaIn = \relative do' {

    la16 la
    si si si si r8 mi16 mi mi mi dod dod r8 la16 la
    dod dod dod dod r8 fad16 fad fad fad re re r8 si16 si
    red red red red r8 sid'16 sid sold8 mi16 mi mi8 dod16 dod

    %4
    dod8[sold16 sold sold8 mi] mi8 sold16 sold sold8 r\mbreak
    mi
    la32 la la la la [la la la] la la la la
    sold sold sold sold sold[sold sold sold] sold sold sold sold

    %7
    fad fad fad fad fad[fad fad fad] fad fad fad fad
    mi mi mi mi mi[mi mi mi] mi mi mi mi
    mi' mi mi mi mi[mi mi mi] mi mi mi mi

    %10
    re re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si si mi, mi mi[mi mi mi] mi[mi mi mi]

    %13
    dod'32 dod dod dod dod[dod dod dod] mi mi mi mi
    re re re re re8\noBeam r
    red32 red red red red[red red red] fad fad fad fad

    %16
    mi mi mi mi mi[mi mi mi] r8
    mid32 mid mid mid mid[mid mid mid] sold sold sold sold
    fad fad fad fad fad[fad fad fad] la la la la

    %19
    re re re re re[re re re] re re re re\mbreak
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si32 si si si si[si si si] si si si si

    %22
    la la la la la [la la la] la la la la
    sold sold sold sold mid[mid mid mid] fad fad fad fad
    si, si si si dod[dod dod dod] dod dod dod dod

    %25
    fad fad fad fad fad[fad fad fad] r8
    dod32[dod dod dod] dod dod dod dod dod[dod dod dod]
    si si si si si[si si si] si si si si

    %28
    si si si si si[si si si] si si si si
    la la la la la[la la la] mi mi mi mi
    la la la la la [la la la] la la la la

    %31
    sold sold sold sold sold[sold sold sold] sold sold sold sold
    fad fad fad fad  mi[mi  mi mi] re re re re
    dod' dod dod dod si[si si si] la la la la

    %34
    re, re re re mi[mi mi mi] mi mi mi mi
    la la la la la [la la la] la la la la
    la la la la la [la la la] la la la la

    %37
    la la la la la [la la la] la la la la
    re re re re mi[mi mi mi] mi, mi mi mi
    la4.\fermata

}

VIIIsopranoIn = \relative do'' {

    \autoBeamOff
    dod8
    si sold r mi' dod la r dod
    dod lad r fad' re si r re
    red sid r sold' mi dod16 dod dod8 sold16 sold

    %4
    \once\set suggestAccidentals = ##t sold?8 mi16 mi mi8 dod r2\mbreak
    mi8
    la la la
    sold sold sold

    %7
    fad fad fad
    mi mi mi
    mi' mi mi

    %10
    re re re
    dod dod dod
    si mi, r

    %13
    la8. la16 la la
    fad fad fad8 r
    si8. si16 si si

    %16
    sold sold sold8 r
    dod8. dod16 dod dod
    la la la8 la

    %19
    re4.\mbreak
    dod
    si

    %22
    la
    sold8[mid] fad
    si dod4

    %25
    fad, r8
    mi'8. mi16 mi mi
    re re re8 r

    %28
    re8. re16 re re
    dod dod dod8 mi,
    la4.

    %31
    sold
    fad8[mi] re
    dod[si] la

    %34
    re mi4
    la la8
    dod la dod

    %37
    mi[dod] la
    re, mi4
    la4.\fermopz

}

VIIItestoI = \lyricmode {

     Im -- plebit _ ru -- inas _ im -- plebit _ ru -- inas _ im -- plebit _

     ru -- inas _   ru -- inas _   ru -- inas _   ru -- inas. _

     Im -- ple -- bit ru -- i -- nas im -- ple -- bit ru -- i -- nas

     im -- ple -- bit  ru -- i -- nas im -- ple -- bit ru -- i -- nas

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _

     con -- quassabit  _ _ ca -- pita _  in ter - - - -  ra mul -- to -- rum,

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _ in

     ter - - - - ra mul -- to -- rum, in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIIaltoIn = \relative do' {

    \autoBeamOff
    mi8
    sold mi  r sold la mi r mi
    lad fad r lad si fad r fad
    sid sold r sid dod sold16 sold sold8 mi16 mi

    %4
    mi8 dod16 dod dod8 sold r2\mbreak
    mi'8
    la la la
    sold sold sold

    %7
    fad fad fad
    mi mi mi
    mi mi mi

    %10
    re re re'
    dod dod dod
    si mi, r

    %13
    mi8. mi16 mi mi
    re re re8 r
    fad8. fad16 fad fad

    %16
    mi mi mi8 r
    sold8. sold16 sold sold
    fad fad fad8 la

    %19
    re4.\mbreak
    dod
    si

    %22
    la
    sold8[mid] fad
    si, dod4

    %25
    fad r8
    lad8. lad16 lad lad
    fad fad fad8 r

    %28
    sold8. sold16 sold sold
    mi mi mi8 mi
    la4.

    %31
    sold
    fad8[mi re]
    dod[si] la

    %34
    re mi4
    la, mi'8
    la mi la

    %37
    dod[la] mi
    re mi4
    la,4.\fermata

}

VIIItestoII = \lyricmode {

    Im -- plebit _ ru -- inas _ im -- plebit _ ru -- inas _ im -- plebit _

     ru -- inas _   ru -- inas _   ru -- inas _   ru -- inas. _

     Im -- ple -- bit ru -- i -- nas im -- ple -- bit ru -- i -- nas

     im -- ple -- bit  ru -- i -- nas im -- ple -- bit ru -- i -- nas

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _

     con -- quassabit  _ _ ca -- pita _  in ter - - - -  ra mul -- to -- rum,

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _ in

     ter - - - ra mul -- to -- rum, in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIItenoreIn = \relative do' {

    \autoBeamOff
    la8
    si si r mi mi dod r la
    dod dod r fad fad re r si
    red red r sold sold mi16 mi mi8 dod16 dod

    %4
    dod8 sold16 sold sold8 mi r2\mbreak
    mi8
    la la la
    sold sold sold

    %7
    fad fad fad
    mi mi mi
    mi' mi mi

    %10
    re re re
    dod dod dod
    si mi, r

    %13
    la8. la16 la la
    la la la8 r
    si8. si16 si si

    %16
    si si si8 r
    dod8. dod16 dod dod
    dod dod dod8 la

    %19
    re4.\mbreak
    dod
    si

    %22
    la
    sold8[mid] fad
    si dod4

    %25
    fad, r8
    dod'8. dod16 dod dod
    si si si8 r

    %28
    si8. si16 si si
    la la la8 mi
    la4.

    %31
    sold
    fad8 [mi re]
    dod'[si] la

    %34
    re, mi4
    la dod8
    mi dod mi

    %37
    la,4 dod8
    re, mi4
    la4.\fermata

}

VIIItestoIII = \lyricmode {

    Im -- plebit _ ru -- inas _ im -- plebit _ ru -- inas _ im -- plebit _

     ru -- inas _   ru -- inas _   ru -- inas _   ru -- inas. _

     Im -- ple -- bit ru -- i -- nas im -- ple -- bit ru -- i -- nas

     im -- ple -- bit  ru -- i -- nas im -- ple -- bit ru -- i -- nas

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _

     con -- quassabit  _ _ ca -- pita _  in ter - - - -  ra mul -- to -- rum,

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _ in

     ter - - - ra mul -- to -- rum, in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIIbassoIn = \relative do {

    \autoBeamOff
    la'8
    mi mi r mi la la, r la'
    fad fad r fad si si, r si'
    sold sold r sold dod dod,16 dod dod8 dod16 dod

    %4
    dod8 dod16 dod dod8 dod r2
    mi8
    la la la
    sold sold sold

    %7
    fad fad fad
    mi mi mi
    mi' mi mi

    %10
    re re re
    dod dod dod
    si mi, r

    %13
    dod8. dod16 dod dod
    re re re8 r
    red8. red16 red red

    %16
    mi mi mi8 r
    mid8. mid16 mid mid
    fad fad fad8 la

    %19
    re4.\mbreak
    dod
    si

    %22
    la
    sold8[mid] fad
    si, dod4

    %25
    fad r8
    fad8. fad16 fad fad
    si, si si8 r

    %28
    mi8. mi16 mi mi
    la, la la8 mi'
    la4.

    %31
    sold
    fad8[mi re]
    dod[si] la

    %34
    re mi4
    la, la'8
    la la, la'

    %37
    la4 la,8
    re mi4
    la,4.\fermata

}

VIIItestoIV = \lyricmode {

    Im -- plebit _ ru -- inas _ im -- plebit _ ru -- inas _ im -- plebit _

     ru -- inas _   ru -- inas _   ru -- inas _   ru -- inas. _

     Im -- ple -- bit ru -- i -- nas im -- ple -- bit ru -- i -- nas

     im -- ple -- bit  ru -- i -- nas im -- ple -- bit ru -- i -- nas

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _

     con -- quassabit  _ _ ca -- pita _  in ter - - - -  ra mul -- to -- rum,

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _ in

     ter - - - ra mul -- to -- rum, in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIIbcIn = \relative do {

    la'16 la
    mi mi mi, mi r8 mi'16 mi  la la la, la r8 la'16 la
    fad fad fad, fad r8 fad'16 fad si si si, si r8 si'16 si
    sold sold sold, sold r8 sold'16 sold dod8 dod,16 dod dod8 dod16 dod

    %4
    dod8[dod16 dod dod8 dod] dod dod16 dod dod8 r
    mi\f
    la16 la la la la la
    sold sold sold sold sold sold

    %7
    fad fad fad fad fad fad
    mi mi mi mi mi mi
    mi' mi mi mi mi mi

    %10
    re re re re re re
    dod dod dod dod dod dod
    si mi, mi mi mi mi

    %13
    dod dod dod dod dod dod
    re re re8 r
    red16 red red red red red

    %16
    mi mi mi8 r
    mid16 mid mid mid mid mid
    fad fad fad fad la la

    %19
    re re re re re re\mbreak
    dod dod dod dod dod dod
    si si si si si si

    %22
    la la la la la la
    sold sold mid mid fad fad
    si, si dod dod dod, dod

    %25
    fad4 r8
    fad'16 fad fad fad fad fad
    si, si si si si si

    %28
    mi mi mi mi mi mi
    la, la la la mi' mi
    la la la la la la

    %31
    sold sold sold sold sold sold
    fad fad mi mi re re
    dod dod si si la la

    %34
    re re mi mi mi, mi
    la la la la la la
    la la la la la la

    %37
    la la la la la la
    re re mi mi mi, mi
    la4.\fermata

}

VIIIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    <_+>1
    <_+>
    <_+>
    s
    s8
    s4.*11
    <_+>4.
    s4.*9
    <7 _+>4.
    s
    <7 _+>

}


VIIIvlIIIn = \relative do'' {

    r8
    r sold'16 [sold si si sold sold] r8 mi16 [mi la la mi mi]
    r8 lad16 [lad dod dod lad lad] r8 fad16 [fad si si fad fad]
    r8 sold16 [sold sold sold sold sold] r8 mi16 [mi mi8 sold,16 sold]

    %4
    \once\set suggestAccidentals = ##t sold?8[mi16 mi mi8 dod] dod mi16 mi mi8 r
    mi
    la32 la la la la [la la la] la la la la
    sold sold sold sold sold[sold sold sold] sold sold sold sold

    %7
    fad fad fad fad fad[fad fad fad] fad fad fad fad
    mi mi mi mi mi[mi mi mi] mi mi mi mi
    mi' mi mi mi mi[mi mi mi] mi mi mi mi

    %10
    re re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si si mi, mi mi[mi mi mi] mi[mi mi mi]

    %13
    la la la la la [la la la] la la la la
    la la la la la [la la la] la la la la
    si si si si si8\noBeam r

    %16
    si32 si si si si[si si si] si si si si
    dod dod dod dod dod[dod dod dod] r8
    r r la

    %19
    re32 re re re re[re re re] re re re re\mbreak
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si32 si si si si[si si si] si si si si

    %22
    la la la la la [la la la] la la la la
    sold sold sold sold mid[mid mid mid] fad fad fad fad
    si, si si si dod[dod dod dod] dod dod dod dod

    %25
    fad fad fad fad fad[fad fad fad] r8
    lad'32[lad lad lad] lad lad lad lad lad[lad lad lad]
    fad fad fad fad fad[fad fad fad] fad fad fad fad

    %28
    sold sold sold sold sold[sold sold sold] sold sold sold sold
    mi mi mi mi mi[mi mi mi] mi, mi mi mi
    la la la la la [la la la] la la la la

    %31
    sold sold sold sold sold[sold sold sold] sold sold sold sold
    fad fad fad fad  mi[mi  mi mi] re re re re
    dod dod dod dod si[si si si] la la la la

    %34
    re re re re mi[mi mi mi] mi mi mi mi
    la la la la la [la la la] la la la la
    la la la la la [la la la] la la la la

    %37
    la la la la la [la la la] la la la la
    re re re re mi[mi mi mi] mi, mi mi mi
    la4.\fermata

}

VIIIvlIVn = \relative do'' {

    r8
    r si16[si mi mi si si] r8 dod16[dod mi mi dod dod]
    r8 dod16[dod fad fad dod dod] r8 re16[re fad fad re re]
    r8 red16 [red sold sold red red] r8 dod16[dod dod8 mi,16 mi]

    %4
    mi8[dod16 dod dod8 sold] sold dod16 dod dod8\noBeam r\mbreak
    mi
    la32 la la la la [la la la] la la la la
    sold sold sold sold sold[sold sold sold] sold sold sold sold

    %7
    fad fad fad fad fad[fad fad fad] fad fad fad fad
    mi mi mi mi mi[mi mi mi] mi mi mi mi
    mi' mi mi mi mi[mi mi mi] mi mi mi mi

    %10
    re re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si si mi, mi mi[mi mi mi] mi[mi mi mi]

    %13
    mi[mi mi mi] mi[mi mi mi] mi mi mi mi
    fad fad fad fad fad[fad fad fad] fad fad fad fad
    fad fad fad fad fad8\noBeam r

    %16
    sold32 sold sold sold sold[sold sold sold] sold sold sold sold
    \once\set suggestAccidentals = ##t sold?32[sold sold sold] sold sold sold sold r8
    r r la

    %19
    re32 re re re re[re re re] re re re re\mbreak
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si32 si si si si[si si si] si si si si

    %22
    la la la la la [la la la] la la la la
    sold sold sold sold mid[mid mid mid] fad fad fad fad
    si, si si si dod[dod dod dod] dod dod dod dod

    %25
    fad fad fad fad fad[fad fad fad] r8
    lad'32[lad lad lad] lad lad lad lad lad[lad lad lad]
    fad fad fad fad fad[fad fad fad] fad fad fad fad

    %28
    sold sold sold sold sold[sold sold sold] sold sold sold sold
    mi mi mi mi mi[mi mi mi] mi, mi mi mi
    la la la la la [la la la] la la la la

    %31
    sold sold sold sold sold[sold sold sold] sold sold sold sold
    fad fad fad fad  mi[mi  mi mi] re re re re
    dod dod dod dod si[si si si] la la la la

    %34
    re re re re mi[mi mi mi] mi mi mi mi
    la la la la la [la la la] la la la la
    la la la la la [la la la] la la la la

    %37
    la la la la la [la la la] la la la la
    re re re re mi[mi mi mi] mi, mi mi mi
    la4.\fermata

}

VIIIvlaIIn = \relative do' {

    r8
    r mi16[mi mi mi mi  mi] r8 mi16[mi mi mi mi mi]
    r8 fad16[fad fad fad fad fad] r8 fad16[fad fad fad fad fad]
    r8 sid16[sid red red sid sid] r8 sold16[sold sold8 dod,16 dod]

    %4
    dod8[sold16 sold sold8 mi] mi sold16 sold sold8 r
    mi
    la32 la la la la [la la la] la la la la
    sold sold sold sold sold[sold sold sold] sold sold sold sold

    %7
    fad fad fad fad fad[fad fad fad] fad fad fad fad
    mi mi mi mi mi[mi mi mi] mi mi mi mi
    mi' mi mi mi mi[mi mi mi] mi mi mi mi

    %10
    re re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si si mi, mi mi[mi mi mi] mi[mi mi mi]

    %13
    dod'32 dod dod dod dod[dod dod dod] mi mi mi mi
    fad fad fad fad fad[fad fad fad] fad fad fad fad
    red red red red red8\noBeam r

    %16
    sold32 sold sold sold sold[sold sold sold] sold sold sold sold
    mid mid mid mid mid[mid mid mid] r8
    r r la

    %19
    re32 re re re re[re re re] re re re re\mbreak
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    si32 si si si si[si si si] si si si si

    %22
    la la la la la [la la la] la la la la
    sold sold sold sold mid[mid mid mid] fad fad fad fad
    si, si si si dod[dod dod dod] dod dod dod dod

    %25
    fad fad fad fad fad[fad fad fad] r8
    dod32[dod dod dod] dod dod dod dod dod[dod dod dod]
    si si si si si[si si si] si si si si

    %28
    si si si si si[si si si] si si si si
    la la la la la[la la la] mi mi mi mi
    la la la la la [la la la] la la la la

    %31
    sold sold sold sold sold[sold sold sold] sold sold sold sold
    fad fad fad fad  mi[mi  mi mi] re re re re
    dod' dod dod dod si[si si si] la la la la

    %34
    re, re re re mi[mi mi mi] mi mi mi mi
    la la la la la [la la la] la la la la
    la la la la la [la la la] la la la la

    %37
    la la la la la [la la la] la la la la
    re re re re mi[mi mi mi] mi, mi mi mi
    la4.\fermata

}

VIIIsopranoIIn = \relative do'' {

    \autoBeamOff
    r8
    r si mi si r dod mi dod
    r dod fad dod r re fad re
    r red sol red r dod dod sold16 sold

    %4
    \once\set suggestAccidentals = ##t sold?8 mi16 mi mi8 dod r2
    mi8
    la la la
    sold sold sold

    %7
    fad fad fad
    mi mi mi
    mi' mi mi

    %10
    re re re
    dod dod dod
    si mi, r

    %13
    la8. la16 la la
    la8. la16 la la
    si si si8 r

    %16
    si8. si16 si si
    dod dod dod8 r
    r r la

    %19
    re4.\mbreak
    dod
    si

    %22
    la
    sold8[mid] fad
    si dod4

    %25
    fad, r8
    mi'8. mi16 mi mi
    re re re8 r

    %28
    re8. re16 re re
    dod dod dod8 mi,
    la4.

    %31
    sold
    fad8[mi] re
    dod[si] la

    %34
    re mi4
    la la8
    dod la dod

    %37
    mi[dod] la
    re, mi4
    la4.\fermopz

}

VIIItestoV= \lyricmode {

    Im -- plebit _ ru -- inas _ im -- plebit _ ru -- inas _ im -- plebit _

     ru -- i -- nas   im -- plebit _ ru -- inas _   ru -- inas _   ru -- inas. _

     Im -- plebit _ ru -- i -- nas im -- ple -- bit ru -- i -- nas

     im -- ple -- bit ru -- i -- nas

     con -- quassabit  _ _ con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _

     in ter - - - -  ra mul -- to -- rum,

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _ in

     ter - - - - ra mul -- to -- rum, in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIIaltoIIn = \relative do' {

    \autoBeamOff

    r8
    r sold' si sold r mi la mi
    r lad dod lad r fad si fad
    r sold sold sold r sold sold mi16 mi

    %4
    mi8 dod16 dod dod8 sold r2
    mi'8
    la la la
    sold sold sold

    %7
    fad fad fad
    mi mi mi
    mi mi mi

    %10
    re re re'
    dod dod dod
    si mi, r

    %13
    mi8. mi16 mi mi
    fad8. fad16 fad fad
    fad fad fad8 r

    %16
    sold8. sold16 sold sold
    \once\set suggestAccidentals = ##t sold? sold sold8 r
    r r la

    %19
    re4.\mbreak
    dod
    si

    %22
    la
    sold8[mid] fad
    si, dod4

    %25
    fad r8
    lad8. lad16 lad lad
    fad fad fad8 r

    %28
    sold8. sold16 sold sold
    mi mi mi8 mi
    la4.

    %31
    sold
    fad8[mi re]
    dod[si] la

    %34
    re mi4
    la, mi'8
    la mi la

    %37
    dod[la] mi
    re mi4
    la,4.\fermata

}

VIIItestoVI = \lyricmode {

    Im -- plebit _ ru -- inas _ im -- plebit _ ru -- inas _ im -- plebit _

     ru -- i -- nas   im -- plebit _ ru -- inas _   ru -- inas _   ru -- inas. _

     Im -- plebit _ ru -- i -- nas im -- ple -- bit ru -- i -- nas

     im -- ple -- bit ru -- i -- nas

     con -- quassabit  _ _ con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _

     in ter - - - -  ra mul -- to -- rum,

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _ in

     ter - - - ra mul -- to -- rum, in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIItenoreIIn = \relative do' {

    \autoBeamOff

    r8
    r si si si r la la la
    r dod dod dod r si si si
    r sid red sid r mi mi dod16 dod

    %4
    dod8 sold16 sold sold8 mi r2
    mi8
    la la la
    sold sold sold

    %7
    fad fad fad
    mi mi mi
    mi' mi mi

    %10
    re re re
    dod dod dod
    si mi, r

    %13
    la8. la16 la la
    la8. la16 la la
    fad fad fad8 r

    %16
    si8. si16 si si
    sold sold sold8 r
    r r la

    %19
    re4.\mbreak
    dod
    si

    %22
    la
    sold8[mid] fad
    si dod4

    %25
    fad, r8
    dod'8. dod16 dod dod
    si si si8 r

    %28
    si8. si16 si si
    la la la8 mi
    la4.

    %31
    sold
    fad8 [mi re]
    dod'[si] la

    %34
    re, mi4
    la dod8
    mi dod mi

    %37
    la,4 dod8
    re, mi4
    la4.\fermata

}

VIIItestoVII = \lyricmode {

    Im -- plebit _ ru -- inas _ im -- plebit _ ru -- inas _ im -- plebit _

     ru -- i -- nas   im -- plebit _ ru -- inas _   ru -- inas _   ru -- inas. _

     Im -- plebit _ ru -- i -- nas im -- ple -- bit ru -- i -- nas

     im -- ple -- bit ru -- i -- nas

     con -- quassabit  _ _ con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _

     in ter - - - -  ra mul -- to -- rum,

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _ in

     ter - - - ra mul -- to -- rum, in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIIbassoIIn = \relative do {

    \autoBeamOff

    r8
    r mi sold mi r la, dod la
    r fad' lad fad r si, re si
    r sold' sid sold r dod, dod dod16 dod

    %4
    dod8 dod16 dod dod8 dod r2
    mi8
    la la la
    sold sold sold

    %7
    fad fad fad
    mi mi mi
    mi' mi mi

    %10
    re re re
    dod dod dod
    si mi, r

    %13
    dod8. dod16 dod dod
    re8. re16 re re
    red red red8 r

    %16
    mi8. mi16 mi mi
    mid mid mid8 r
    r r la

    %19
    re4.\mbreak
    dod
    si

    %22
    la
    sold8[mid] fad
    si, dod4

    %25
    fad r8
    fad8. fad16 fad fad
    si, si si8 r

    %28
    mi8. mi16 mi mi
    la, la la8 mi'
    la4.

    %31
    sold
    fad8[mi re]
    dod[si] la

    %34
    re mi4
    la, la'8
    la la, la'

    %37
    la4 la,8
    re mi4
    la,4.\fermata

}

VIIItestoVIII = \lyricmode {

    Im -- plebit _ ru -- inas _ im -- plebit _ ru -- inas _ im -- plebit _

     ru -- i -- nas   im -- plebit _ ru -- inas _   ru -- inas _   ru -- inas. _

     Im -- plebit _ ru -- i -- nas im -- ple -- bit ru -- i -- nas

     im -- ple -- bit ru -- i -- nas

     con -- quassabit  _ _ con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _

     in ter - - - -  ra mul -- to -- rum,

     con -- quassabit  _ _ ca -- pita _ con -- quassabit  _ _ ca -- pita _ in

     ter - - - ra mul -- to -- rum, in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIIbcIIn = \relative do {

    r8
    r mi16 [mi sold sold mi mi] r8 la,16[la dod dod la la]
    r8 fad'16[fad lad lad fad fad] r8 si,16 [si re re si si]
    r8 sold'16 [sold si si  sold sold] r8 dod,16 [dod dod8 dod16 dod]

    %4
    dod8[dod16 dod dod8 dod] dod dod16 dod dod8 r\mbreak
    mi\f
    la16 la la la la la
    sold sold sold sold sold sold

    %7
    fad fad fad fad fad fad
    mi mi mi mi mi mi
    mi' mi mi mi mi mi

    %10
    re re re re re re
    dod dod dod dod dod dod
    si mi, mi mi mi mi

    %13
    R4.
    re16 re re re re re
    red red red8 r

    %16
    mi16 mi mi mi mi mi
    mid mid mid8 r
    r r la

    %19
    re16 re re re re re\mbreak
    dod dod dod dod dod dod
    si si si si si si

    %22
    la la la la la la
    sold sold mid mid fad fad
    si, si dod dod dod, dod

    %25
    fad4 r8
    fad'16 fad fad fad fad fad
    si, si si si si si

    %28
    mi mi mi mi mi mi
    la, la la la mi' mi
    la la la la la la

    %31
    sold sold sold sold sold sold
    fad fad mi mi re re
    dod dod si si la la

    %34
    re re mi mi mi, mi
    la la la la la la
    la la la la la la

    %37
    la la la la la la
    re re mi mi mi, mi
    la4.\fermata

}

VIIIbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s <_+> s4 s2
    s8 <_+> s4 s2
    s8 <_+> s4 s2
    s1
    s8
    s4.*11
    <_+>4.
    s4.*9
    <7 _+>4.
    s
    <7 _+>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 60
    \partial 8 s8
    s1*4\break
    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 4. = 65
    \partial 8 s8
    \set Score.currentBarNumber = #5
    s4.*35
    \bar "|."

}

VIIIvlI = {
    \notypeset
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    <<\VIIIvlIIn \forma>>

}

VIIIvlaI = {
    \clef alto
    <<\VIIIvlaIn \forma>>

}

VIIIsopranoI = {
    \new Voice = "implebit1"
    <<\VIIIsopranoIn \forma>>
}

VIIIaltoI = {
    \new Voice = "implebit2"
    <<\VIIIaltoIn \forma>>
}

VIIItenoreI = {
    \new Voice = "implebit3"
    <<\VIIItenoreIn \forma>>
}

VIIIbassoI = {
    \clef bass
    \new Voice = "implebit4"
    <<\VIIIbassoIn \forma>>
}



VIIIbcI = {
    \clef bass
    <<\VIIIbcIn \forma \VIIIbfIn>>
}

VIIIvlIII = {
    <<\VIIIvlIIIn \forma>>

}

VIIIvlIV = {
    <<\VIIIvlIVn \forma>>

}

VIIIvlaII = {
    \clef alto
    <<\VIIIvlaIIn \forma>>

}

VIIIsopranoII= {
    \new Voice = "implebit5"
    <<\VIIIsopranoIIn \forma>>
}

VIIIaltoII= {
    \new Voice = "implebit6"
    <<\VIIIaltoIIn \forma>>
}

VIIItenoreII = {
    \new Voice = "implebit7"
    <<\VIIItenoreIIn \forma>>
}

VIIIbassoII = {
    \clef bass
    \new Voice = "implebit8"
    <<\VIIIbassoIIn \forma>>
}



VIIIbcII = {
    \clef bass
    <<\VIIIbcIIn \forma \VIIIbfIIn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IXvlIn = \relative do'' {

    sol16\p( si mi sol) si(sol mi si) sol( si mi sol) si(sol mi si)
    fad( si red fad) si(fad red si) fad( si red fad) si(fad red si)
    \senza \tuplet 3/2 { si(la si) si[(la si)] si(la si) do[(si la)] } si(mi, sol si) mi(sol si mi,)

    %4
    \tuplet 3/2 { do'(si do) do[(si do)] do(si do) do[(si do)] la(sol la) la[(sol la)] la(sol la) la[(sol la)]
    si(la si) si[(la si)] si(la si) si[(la si) ] sol(fad sol) sol[(fad sol)] sol(fad sol) sol[(fad sol)]
    la(sol la) la[(sol la)] la(sol la) la[(sol la)] fad(mi fad) fad[(mi fad)] fad(mi fad) fad[(mi fad)]}

    %7
    sol si(la sol) r si,(la sol) r si'(la sol) r si,(la sol)\mbreak
    r sol-. sol-. si-. si-. mi-. mi-. sol-. sol sol la sol fad8.\tr mi16
    mi4 r r8 si si4

    %10
    r8 si si4 r8 si si4
    si8 r si r \tuplet 3/2 { sol'16(fad sol) sol[(fad sol)] sol(fad sol) sol[(fad sol)] }
    sol4 r \tuplet 3/2 { sol16(fad sol) sol[(fad sol)] sol(fad sol) sol[(fad sol)] }

    %13
    mi4 r \tuplet 3/2 { sol16 (fad sol) sol[(fad sol)] sol (fad sol) sol[( fad sol)] }
    sol4 r r2
    fad1\mbreak

    %16
    mi
    \tuplet 3/2 { fad16(mi fad) fad[(mi fad)] fad(mi fad) fad[(mi fad)] sol[(fad sol)] sol(fad sol) sol [(fad sol)] sol[(fad sol)]
    sold(fad sold) sold[(fad sold)] sold(fad sold) sold[(fad sold)] la(sold la) la[(sold la)] la(sold la) la[(sold la)]

    %19
    lad(sold lad) lad[(sold lad)] lad(sold lad) lad[(sold lad)]} \once\stemDown si8 \once\stemUp fad, fad4
    r8 fad fad4 r2
    si16(re fad si) si(fad re si) lad(dod fad lad) lad(fad dod lad)

    %22
    si(re fad si) dod,4 si r
    r8 fad fad4\mbreak r8 fad fad4
    r8 fad fad4 r8 fad fad4

    %25
    \tuplet 3/2 {  fad'16(mi fad) fad[(mi fad)] fad(mi fad) fad[(mi fad)]  } fad4 r
    \tuplet 3/2 { mi16(re mi) mi[(re mi)] mi(re mi) mi[(re mi)]} mi4 r
    r2 sol4. mi8

    %28
    fad4. re8 mi4. la8
    la4. fad8 \tuplet 3/2 { sol16 fad sol sol[fad sol] sol fad sol sol[ fad sol]
    do(si do) do[(si do)] do(si do) do[(si do)]} do8 do do do

    %31
    \tuplet 3/2 { si16(la si) si[(la si)] si(la si) si[(la si)] }\mbreak si8 si si si
    \tuplet 3/2 { la16(sol la) la[(sol la)] la(sol la) la[(sol la)]  } la8 la la fad
    sol4 r \tuplet 3/2 { sol16(fad sol) sol[(fad sol)] sol(fad sol) sol[(fad sol)]  }

    %34
    sol4 fad2 mi4~
    mi red \tuplet 3/2 { mi16(fad sol) sol[(fad sol)] sol(fad sol) sol[(fad sol)]
    mi(re mi) mi[(re mi)] mi(re mi) mi[(re mi)] mi(re mi) mi[(re mi)] mi(re mi) mi[(re mi)]

    %37
    fad(mi fad) fad[(mi fad)] fad(mi fad) fad[(mi fad)] fad(mi fad) fad[(mi fad)] fad(mi fad) fad[(mi fad)] }
    sol8 r si, r si4 r
    r16 si'(la sol) r si,(la sol) r si'(la sol) r si,(la sol)\mbreak

    %40
    r sol-. sol-. si-. si-. mi-. mi-. sol-. sol si la sol fad8.\tr mi16
    mi1\fermata

}

IXvlIIn = \relative do'' {

    mi,16\p(sol si mi) sol(mi si sol) mi(sol si mi) sol(mi si sol)
    si(fad si red) fad(red si fad) red? (fad si red) fad(red si fad)
    \senza \tuplet 3/2 { sol (fad sol) la[(sol fad)] sol (fad sol) la[(sol fad)]} sol(si, mi sol) si(mi sol si,)

    %4
    \tuplet 3/2 { la'(sol la) la[(sol la)] la(sol la) la[(sol la)] fad(mi fad) fad[(mi fad)] fad(mi fad) fad[(mi fad)]
    sol(fad sol) sol[(fad sol)] sol(fad sol) sol[(fad sol)] mi(red mi) mi[(red mi)] mi(red mi) mi[(red mi)]
    fad(mi fad) fad[(mi fad)] fad(mi fad) fad[(mi fad)] red(do red) red[(do red)] red(do red) red[(do red)]}

    %7
    mi sol(fad mi) r sol,(fad mi) r sol'(fad mi) r sol,(fad mi) \mbreak
    r mi-. mi-. sol-. sol-. si-. si-. mi-. mi mi fad mi red8.\tr mi16
    mi4 r r8 sol, sol4

    %10
    r8 sol sol4 r8 sol sol4
    sol8 r sol r \tuplet 3/2 { mi'16(red mi) mi[(red mi)] mi(red mi) mi[(red mi)] }
    mi4 r \tuplet 3/2 { mi16(red mi) mi[(red mi)] mi(red mi) mi[(red mi)] }

    %13
    do4 r \tuplet 3/2 { mi16(red mi) mi[(red mi)] mi(red mi) mi[(red mi)] }
    mi4 r do2~
    do si~

    %16
    si la
    \tuplet 3/2 { red16(dod red) red[(dod red)] red(dod red) red[(dod red)] si(la si) si[(la si)] si(la si) si[(la si)]
    si(la si) si[(la si)] si(la si) si[(la si)] dod(si dod) dod[(si dod)] dod(si dod) dod[(si dod)]

    %19
    \once\set suggestAccidentals = ##t dod?[(si dod)] dod(si dod) dod[(si dod)] dod(si dod)} re8 re, re4
    r8 re re4 r2
    fad16(si re fad) fad(re si fad) fad(lad dod fad) fad(dod lad fad)

    %22
    fad(si re si) si8 lad si4 r
    r8 re, re4\mbreak r8 re re4
    r8 dod dod4 r8 dod dod4

    %25
    \tuplet 3/2 { re'16(dod re) re[(dod re)] re(dod re) re[(dod re)]} dod4 r
    \tuplet 3/2 { \once\set suggestAccidentals = ##t dod?16[(si dod)] dod(si dod) dod[(si dod)] dod(si dod) } dod4 r
    r2 r4 \once\set suggestAccidentals = ##t do?~

    %28
    do si2 la4
    fad'4. red8 \tuplet 3/2 { mi16 (red mi) mi[(red mi)] mi16 (red mi) si'[(la si)]
    la(sol la) la[(sol la)] la(sol la) la[(sol la)]} la8 la la la

    %31
    \tuplet 3/2 { sol16(fad sol) sol[(fad sol)] sol(fad sol) sol[(fad sol)]  } sol8 sol sol sol
    \tuplet 3/2 { fad16(mi fad) fad[(mi fad)] fad(mi fad) fad[(mi fad)]  } fad8 fad fad red
    mi4 r \tuplet 3/2 { mi16(red mi) mi[(red mi)] mi(red mi) mi[(red mi)] }

    %34
    mi4 do si2
    la sol16 [mi'] \tuplet 3/2 { mi(red mi) mi[(red mi)] mi(red mi)
    do(si do) do[(si do)] do(si do) do[(si do)] dod(si dod) dod[(si dod)] dod(si dod) dod[(si dod)]

    %37
    la(sol la) la[(sol la)]  la(sol la) la[(sol la)]  la(sol la) la[(sol la)]  la(sol la) la[(sol la)]}\mbreak
    si8 r sol r sol4 r
    r16 sol'(fad mi) r sol,(fad mi) r sol'(fad mi) r sol,(fad mi)

    %40
    r16 mi-. mi-. sol-. sol-. si-. si-. mi-. mi sol fad mi red8.\tr mi16
    mi1\fermata

}

IXvlaIn = \relative do' {

    si8\p si si si si si si si
    si si si si si si si si
    mi red mi red si si si mi

    %4
    mi mi mi do do do do fad
    re re re si si si si mi
    do do do la la la la la

    %7
    si si si si si si si si\mbreak
    si si si si si si' si si
    sol4 r r8 mi mi4

    %10
    r8 mi mi4 r8 mi mi4
    mi8 r mi r si si si si
    si4 r si8 si si si

    %13
    la4 r si8 si si si
    si4 r mi8 mi mi do
    la la la fad' re re re si\mbreak

    %16
    sol sol sol sol la la mi' mi
    si si si si si mi mi mi
    mi mi mi mi mi mi mi mi

    %19
    fad fad fad[fad] fad4 si,
    r8 si si4 r8 sol' fad fad,
    re' re re re dod dod dod dod

    %22
    re re fad fad re4 r
    r8 si si4 r8 si si4
    r8 lad lad4 r8 lad lad4

    %25
    fad'8 fad fad fad lad4 r
    \once\set suggestAccidentals = ##t lad?8 lad lad lad lad4 r
    r2 mi8 mi mi mi

    %28
    re re re re do do do do
    si si si si si si si mi
    mi mi mi mi fad fad fad fad

    %31
    re re re re\mbreak mi mi mi mi
    do do do do red red red red
    si4 r si8 si si si

    %34
    do do la'[la] re, re sol[sol]
    do, fad fad red si si si si
    la la la la la la la la

    %37
    la la fad' fad red red red red\mbreak
    mi r mi r mi4 r
    si8 si si si si si si si

    %40
    si si si si si si si si
    sol1\fermata

}

IXsopranoIn = \relative do'' {

    \autoBeamOff

    R1*8
    mi,4 sol si~si16[mi si sol]
    mi4~mi16[mi' si sol] mi[fad mi fad] sol[la sol la]

    %11
    \senza \tuplet 3/2 {  si [la si] do[si la] si [la si] do[si la]} si8 mi, r mi'
    si do la4\tr sol r8 si
    do la red,4\tr  mi r8 mi

    %14
    si' la16 sol fad8 mi \tuplet 3/2 { do'16[re mi] mi[re do] do[si la] la[sol fad]
    fad  [sol la] la[si do] do[si la] la[sol fad] si[do re] re[do si] si[la sol] fad[mi re]
    mi[fad sol] sol [la si] si[la sol] sol[fad mi] la[si do] do[si la] la[sol fad] sol[fad mi]}

    %17
    si'8  si r fad16 fad sol2
    sold la
    lad si4~\tuplet 3/2 { si16[dod re] mi[re dod] }

    %20
    re4~\tuplet 3/2 { re16[dod re] mi[re dod] re[dod si] mi[re dod] } dod4\tr
    si r r2
    r si4 fad

    %23
    si~si16[re dod re]\mbreak si[fad mid fad] si[re  dod si]
    dod4~dod16[mi re mi] dod[lad sold fad] dod'[mi re dod]
    re8 si r re dod lad si4\tr

    %26
    lad r8 fad dod' fad,16 fad fad8 mi
    red[do'] si16[la] sol[fad] \tuplet 3/2 { sol16[mi fad] sol[la si] mi[re do] si[la sol]
    fad [re mi] fad[sol la] re[do si] la[sol fad] mi[do re] mi[fad sol] do[si la] sol[fad mi]

    %29
    red[mi fad] fad[sol la] la[si do] do[si la]} sol8 mi r si'16 si
    \tuplet 3/2 { do[si do] do[si do] do[si do] do[si do] fad,[sol la] la[si do] do[si la] la[sol fad]
    si[la si] si[la si] si[la si] si[la si]mi,[fad sol] sol[la si] si[la sol] sol[fad mi]

    %32
    la[sol la] la[sol la] la[sol la] la[sol la] red,[mi fad] fad[sol la] la[si do] do[si la]
    sol[si la] sol[fad] mi} fad4\tr mi r8 si'16 si
    \tuplet 3/2 { do[mi re] do[si la] do[mi re] do[si la] si[re do] si[la sol] si[re do] si[la sol]

    %35
    la[do si] la[sol fad] la[do si] la[sol fad]} sol8 mi r si'16 si
    do2 dod
    re red

    %38
    \tuplet 3/2 { mi16[si la] sol[fad mi] mi'[si la] sol[fad mi]  mi'[si la] sol[fad] mi} fad4\tr
    mi r r2
    R1*2

}

IXtestoI = \lyricmode {

    De tor -- ren - - - - - - - - te in via _  bi -- bet, in via _  bi -- bet, prop -- te -- rea _

    ex -- al -- ta - - - - - - - - - - - - - - - - - - - - bit

    ex -- al -- ta - - - - - - - - bit ca -- put.

    De tor -- ren - - - - - - te in via _  bi -- bet, prop -- te -- rea _

    ex -- al -- ta - bit ca - - - - - - - - - - - - - - - - put

    ex -- al -- ta - - - - - - - - - - - - - - - - - - - - - - - - - bit ca -- put

    ex -- al -- ta - - - - - - - - - - - - bit ex -- al -- ta - - - - - - - - - bit ca -- put.

}

IXbcIn = \relative do {

    mi8\p mi mi mi mi mi mi mi
    red red red red red red red red
    mi si mi si mi mi mi mi

    %4
    la la la la re, re re re
    sol sol sol sol do, do do do
    fad fad fad fad si, si si si

    %7
    mi mi mi mi mi mi mi mi\mbreak
    mi mi mi mi mi mi si' si,
    mi4 r r8 mi mi4

    %10
    r8 mi mi4 r8 mi mi4
    mi8 r mi r mi mi mi mi
    mi la red, si mi mi mi mi

    %13
    la fad si si, mi mi mi mi
    mi mi mi mi la la la la
    re, re re re sol sol sol sol\mbreak

    %16
    do, do do do do do do do
    si si si si mi mi mi mi
    re re re re dod dod dod dod

    %19
    fad fad mi mi re si si4
    r8 si si4 r8 sol' fad fad,
    si si si si fad' fad fad fad

    %22
    si, si fad'[fad,] si4 r
    r8 si si4\mbreak r8 si si4
    r8 lad lad4 r8 lad lad4

    %25
    si8 si si si fad' mi re si
    fad' fad fad fad fad fad lad, lad
    si si si si mi mi mi mi

    %28
    re re re re do do do do
    si si si si mi mi mi mi
    la la la la re, re re re

    %31
    sol sol sol sol\mbreak do, do do do
    fad fad fad fad si, si si si
    mi mi si' si, mi mi mi mi

    %34
    la la la la sol sol sol[sol]
    fad fad si,[si] mi mi mi mi
    la la la la sol sol sol sol

    %37
    fad fad fad fad si si la la\mbreak
    sol mi mi mi mi mi si[si]
    mi mi mi mi mi mi mi mi

    %40
    mi mi mi mi si' si si, si
    mi,1\fermata

}

IXbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s2 <7>
    <7> <7>
    <7> <7>
    s1*6
    s4 <_+> s2
    s1
    <7>2 <7>
    <7> <6>
    <_+> s
    <6 4+> <6>
    <_+>4 <6 4+> s2
    s1
    s2 <_+>
    s4 <5+ 4>8 <3+> s2
    s1*2
    s2 <_+>
    <_+>2 s4 <6 5>
    <_+>1
    <7>4 <6> <7> <6>
    <7 _+>1
    s2 <7>
    <7> <7>
    <7> <7 _+>
    s1
    <7>4 <6> <7> <6>
    <7> <_+> s2
    s <6 4+>
    <6> <_+>4 <6 4+>
    <6>1
    s
    s2 <6 4>4 <5 3+>

}


forma = {

    \time 4/4
    \key mi\minor
    \tempo 4 = 50
    s1*41
    \bar "|."

}

IXvlI = {
    \notypeset
    <<\IXvlIn \forma>>

}

IXvlII = {
    <<\IXvlIIn \forma>>

}

IXvlaI = {
    \clef alto
    <<\IXvlaIn \forma>>

}

IXsopranoI = {
    \new Voice = "torrente"
    <<\IXsopranoIn \forma>>
}

IXbcI = {
    \clef bass
    <<\IXbcIn \forma \IXbfIn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



XtpIn = \relative do'' {

    R1*4
    la'8 la, la'4 r8 la sol fad
    sol la, sol'4 r8 sol fad mi

    %7
    fad8 la, fad'4 r8 fad sol fad
    mi16^\markup\italic"Tromba sola" fad mi fad  sol fad  sol  fad mi fad mi fad sol fad sol fad
    mi16^\markup\italic"Hautbois solo" fad mi fad  sol  fad  sol  fad mi fad mi fad sol fad sol mi

    %10
    fad4 sol8\tu mi re4 r
    R1*2
    r2 r8 fad16[sol la sol la fad]\mbreak

    %14
    fad8 re la'4 r8 la fad re
    la' re, la'4 r8 la fad re
    mi16 fad mi fad sol fad sol fad mi8 la, la'4

    %17
    r8 la sol fad sol la, sol'4
    r8 sol fad mi fad8 la, fad'4
    r8 fad sol \parenthesize fad mi[mi,16 fad sol fad sol mi]

    %20
    re'8 r re r re r re r
    sold,2 la4 r8 mi'
    dod la' dod, dod si sold' si, si

    %23
    dod la mi'4 r8 mi re dod
    re mi, re'4 r8 re dod si\mbreak
    dod mi, dod'4 r8 dod si la

    %26
    si16 dod si dod re dod re si sold' la sold la si la si sold
    la8 dod, re si la4 r
    la'8 re r16 do si la si8 si r4

    %29
    sol8 \once\set suggestAccidentals = ##t dod? r16 si la sol la8 la r4
    fad8 \parenthesize si r16 la sol fad sol8 sol r4
    mi8 la r16 sol fad mi fad sol fad sol la sol la sol

    %32
    fad sol fad sol la sol la sol fad8 fad mi mi
    re[fad16 sol la sol la sol] fad8[fad,16 sol la sol la sol]
    la8[fad'16 sol la sol la sol]\mbreak fad8[fad,16 sol la sol la fad]

    %35
    sol8[sol'16 la si la si sol] mi8 mi fad fad
    mi mi mi mi re[fad16 sol la sol la sol]
    fad8 re mi dod re[fad,16 sol la sol la sol]

    %38
    fad8 fad' sol mi fad2\fermata

}

XtpIIn = \relative do'' {

    R1*4
    mi8 la, fad'4 r8 fad mi re
    mi8 la, mi'4 r8 mi re dod

    %7
    re la re4 r8 re mi re
    la16^\markup\italic"Tromba sola" re la re  mi re mi re  la re la re mi re mi re
    dod^\markup\italic"Hautbois solo" re dod re mi re mi re dod re dod re mi re mi dod

    %10
    fad4 mi8\tu dod re4 r
    R1*2
    r2 r8 re16[mi fad mi fad re]\mbreak

    %14
    re8 la fad'4 r8 fad re la
    fad' la, fad'4 r8 fad re la
    dod16 re dod re mi re mi re dod8 la fad'4

    %17
    r8 fad mi re mi la, mi'4
    r8 mi re dod re la re4
    r8 re mi \parenthesize re dod[dod,16 re  mi re mi dod]

    %20
    re'8 r re r re r re r
    sold,2 la4 r8 si
    la mi' la, la sold si sold sold

    %23
    la mi dod'4 r8 dod si la
    si mi, si'4 r8 si la sold\mbreak
    la mi la4 r8 la sold la

    %26
    sold16 la sold la si la si sold mi' fad mi fad sold fad sold mi
    dod8 la si sold la4 r
    fad'8 la r16  la sol? fad sol8 sol r4

    %29
    mi8 sol r16 sol fad mi fad8 fad r4
    re8 fad r16 fad mi re mi8 mi r4
    dod8 mi r16 mi re dod re mi re mi fad mi fad mi

    %32
    re mi re mi fad mi fad mi re8 re dod dod
    re[re16 mi fad mi fad mi] re8[re,16 mi fad mi fad mi]
    re8[re'16 mi fad mi fad re]\mbreak re8[re,16 mi fad mi fad re]

    %35
    re8[si'16 dod re dod re si] dod8 dod re re
    re re dod dod re[re16 mi fad mi fad mi]
    re8 fad, sol mi fad [re16 mi fad mi fad mi]

    %38
    re8 re' mi dod re2\fermata

}

XvlIn = \relative do'' {

    R1*4
    la'8 la, la'4 r8 la sol fad
    sol la, sol'4 r8 sol fad mi

    %7
    fad8 la, fad'4 r8 fad sol fad
    mi4 r mi r
    mi r mi r

    %10
    re8 fad\tu sol mi re4 r
    R1*2
    r2 r8 fad16[sol la sol la fad]\mbreak

    %14
    fad8 re la'4 r8 la fad re
    la' re, la'4 r8 la fad re
    mi16 fad mi fad sol fad sol fad mi8 la, la'4

    %17
    r8 la sol fad sol la, sol'4
    r8 sol fad mi fad8 la, fad'4
    r8 fad sol \parenthesize fad mi[mi,16 fad sol fad sol mi]

    %20
    re'8 r re r re r re r
    sold,2 la4 r8 mi'
    dod la' dod, dod si sold' si, si

    %23
    dod la mi'4 r8 mi re dod
    re mi, re'4 r8 re dod si\mbreak
    dod mi, dod'4 r8 dod si la

    %26
    si16 dod si dod re dod re si sold' la sold la si la si sold
    la8 dod, re si la4 r
    la'8 re r16 do si la si8 si r4

    %29
    sol8 \once\set suggestAccidentals = ##t dod? r16 si la sol la8 la r4
    fad8 \parenthesize si r16 la sol fad sol8 sol r4
    mi8 la r16 sol fad mi fad sol fad sol la sol la sol

    %32
    fad sol fad sol la sol la sol fad8 fad mi mi
    re[fad16 sol la sol la sol] fad8[fad,16 sol la sol la sol]
    la8[fad'16 sol la sol la sol]\mbreak fad8[fad,16 sol la sol la fad]

    %35
    sol8[sol'16 la si la si sol] mi8 mi fad fad
    mi mi mi mi re[fad16 sol la sol la sol]
    fad8 re mi dod re[fad,16 sol la sol la sol]

    %38
    fad8 fad' sol mi fad2\fermata

}

XvlIIn = \relative do'' {

    R1*4
    mi8 la, fad'4 r8 fad mi re
    mi8 la, mi'4 r8 mi re dod

    %7
    re la re4 r8 re mi re
    dod4 r dod r
    dod r dod r

    %10
    la8 re\tu mi dod re4 r
    R1*2
    r2 r8 re16[mi fad mi fad re]\mbreak

    %14
    re8 la fad'4 r8 fad re la
    fad' la, fad'4 r8 fad re la
    dod16 re dod re mi re mi re dod8 la fad'4

    %17
    r8 fad mi re mi la, mi'4
    r8 mi re dod re la re4
    r8 re mi \parenthesize re dod[dod,16 re  mi re mi dod]

    %20
    re'8 r re r re r re r
    sold,2 la4 r8 si
    la mi' la, la sold si sold sold

    %23
    la mi dod'4 r8 dod si la
    si mi, si'4 r8 si la sold\mbreak
    la mi la4 r8 la sold la

    %26
    sold16 la sold la si la si sold mi' fad mi fad sold fad sold mi
    dod8 la si sold la4 r
    fad'8 la r16  la sol? fad sol8 sol r4

    %29
    mi8 sol r16 sol fad mi fad8 fad r4
    re8 fad r16 fad mi re mi8 mi r4
    dod8 mi r16 mi re dod re mi re mi fad mi fad mi

    %32
    re mi re mi fad mi fad mi re8 re dod dod
    re[re16 mi fad mi fad mi] re8[re,16 mi fad mi fad mi]
    re8[re'16 mi fad mi fad re]\mbreak re8[re,16 mi fad mi fad re]

    %35
    re8[si'16 dod re dod re si] dod8 dod re re
    re re dod dod re[re16 mi fad mi fad mi]
    re8 fad, sol mi fad [re16 mi fad mi fad mi]

    %38
    re8 re' mi dod re2\fermata

}

XvlaIn = \relative do' {

    R1*4
    la'8 la la4 r8 la la la
    dod dod dod4 r8 dod la la

    %7
    la la la4 r8 la la la
    la4 r la r
    la r la r

    %10
    la8 la si la fad4 r
    R1*2
    r2 r8 la la la\mbreak

    %14
    la fad re'4 r8 re la fad
    re' fad, re'4 r8 re la fad
    R1*4

    %20
    re'8 r re r re r re r
    sold,2 la4 r8 sold
    mi4 mi mi mi

    %23
    mi8 mi mi4 r8 mi mi mi
    sold sold sold4 r8 sold sold sold\mbreak
    mi mi mi4 r8 mi mi mi

    %26
    mi mi mi mi si' si si sold
    mi mi fad mi dod4 r
    fad8 fad fad fad re re r4

    %29
    mi8 mi mi mi dod dod r4
    re8 re re re si si r4
    dod8 dod dod dod la la' la la

    %32
    la la la la la la la la
    la la la la la la, la la
    la la' la la\mbreak la la, la la

    %35
    si re re si' la la la la
    la la la la la la la la
    la la, si la la la la la

    %38
    la la' si la fad2\fermata

}

XsopranoIn = \relative do'' {

    \autoBeamOff
    R1*10
    la2 la4 la
    la2 la4 la

    %13
    fad4. mi8 re2\mbreak
    re'2 re4 re
    re2 re4 re

    %16
    dod2 la4 r
    re4. re8 mi2
    dod re4 re

    %19
    re4. re8 dod2
    re4 re re re8 re
    sold,2 la4 r8 mi'

    %22
    dod4 dod8 dod si2
    dod r
    R1*4

    %28
    la4 la8 la si si r4
    sol8 sol sol sol la16 la la8 r4
    fad8 fad fad fad16 fad sol8 sol r4

    %31
    mi8 mi16 mi mi8 mi16 mi fad fad fad8 r4
    re'8 re re re16 re re4 dod
    re r do do

    %34
    \once\set suggestAccidentals = ##t do? do8 do\mbreak do2
    si4 re8 re \once\set suggestAccidentals = ##t dod?4 re8 re
    re4(dod) re r

    %37
    R1*2

}

XtestoI = \lyricmode {

    Glo -- ria _ glo -- ria _ Pa - tri glo -- ria _ glo -- ria _ Pa -- tri

    glo -- ria _ glo -- ria _   Fili - o et Spi -- ri -- tui _ San -- cto Spi -- ri -- tui _ San -- cto.

     Glo -- ria _ Pa -- tri glo -- ria _ et Fili - o et Spi -- ri -- tui _ San -- cto

     Glo -- ria _ Pa -- tri et Fili - o et Spi -- ri -- tui _ San - cto et Spi -- ri -- tui _ San -- cto

     et Spi -- ri -- tui _ San -- cto.

}

XaltoIn = \relative do' {

    \autoBeamOff
    R1*13
    fad2 fad4 fad
    fad2 fad4 fad

    %16
    mi2 mi4 r
    fad4. fad8 sol2
    la fad4 fad

    %19
    fad4. fad8 mi2
    re'4 re re re8 re
    sold,2 la4 r8 sold

    %22
    la4 la8 la la4(sold)
    la2 r
    R1*4

    %28
    fad4 fad8 fad sol sol r4
    mi8 mi mi mi fad16 fad fad8 r4
    re8 re re re16 re mi8 mi r4

    %31
    dod8 dod16 dod dod8 dod16 dod re re re8 r4
    la'8 la la la16 la la2
    la4 r la la

    %34
    la la8 la\mbreak la2
    sol4 sol8 sol sol4 fad8 fad
    mi2 fad4 r

    %37
    R1*2

}

XtestoII = \lyricmode {

    Glo -- ria _ glo -- ria _ Pa -- tri

    glo -- ria _ glo -- ria _   Fili - o et Spi -- ri -- tui _ San -- cto Spi -- ri -- tui _ San -- cto.

     Glo -- ria _ Pa -- tri glo -- ria _ et Fili - o et Spi -- ri -- tui _ San -- cto

     Glo -- ria _ Pa -- tri et Fili - o et Spi -- ri -- tui _ San -- cto et Spi -- ri -- tui _ San -- cto

     et Spi -- ri -- tui _ San -- cto.

}

XtenoreIn = \relative do' {

    \autoBeamOff
    R1*13
    la2 la4 la
    la2 la4 la

    %16
    la2 la4 r
    la4. la8 dod2
    dod la4 la

    %19
    la4. la8 dod2
    re4 re re re8 re
    sold,2 la4 r8 mi'

    %22
    mi4 mi8 mi mi2
    mi r
    R1*4

    %28
    re4 re8 re re re r4
    dod8 dod dod dod dod16 dod dod8 r4
    si8 si si si16 si si8 si r4

    %31
    la8 la16 la la8 la16 la la la la8 r4
    fad'8 fad fad fad16 fad fad4 mi
    fad r fad fad

    %34
    fad fad8 fad\mbreak fad2
    re4 si8 si la4 la8 la
    la2 la4 r

    %37
    R1*2

}

XtestoIII = \lyricmode {

    Glo -- ria _ glo -- ria _ Pa -- tri

    glo -- ria _ glo -- ria _   Fili - o et Spi -- ri -- tui _ San -- cto Spi -- ri -- tui _ San -- cto.

     Glo -- ria _ Pa -- tri glo -- ria _ et Fili - o et Spi -- ri -- tui _ San -- cto

     Glo -- ria _ Pa -- tri et Fili - o et Spi -- ri -- tui _ San - cto et Spi -- ri -- tui _ San -- cto

     et Spi -- ri -- tui _ San -- cto.

}

XbassoIn = \relative do {

    \autoBeamOff
    R1*13
    re2 re4 re
    re2 re4 re

    %16
    la'2 la,4 r
    re4. re8 la'2
    la, re4 re

    %19
    re4. re8 la2
    re'4 re re re8 re
    sold,2 la4 r8 mi

    %22
    la4 la,8 la mi'2
    la, r
    R1*4

    %28
    re4 re8 re sol sol r4
    dod,8 dod dod dod fad16 fad fad8 r4
    si,8 si si si16 si mi8 mi r4

    %31
    la,8 la16 la la8 la16 la re re re8 r4
    re8 re re re16 re la'4 la,
    re r re re

    %34
    re re8 re\mbreak re2
    sol4 sol8 sol la4 re,8 re
    la'4(la,) re r

    %37
    R1*2

}

XtestoIV = \lyricmode {

    Glo -- ria _ glo -- ria _ Pa -- tri

    glo -- ria _ glo -- ria _   Fili - o et Spi -- ri -- tui _ San -- cto Spi -- ri -- tui _ San -- cto.

     Glo -- ria _ Pa -- tri glo -- ria _ et Fili - o et Spi -- ri -- tui _ San -- cto

     Glo -- ria _ Pa -- tri et Fili - o et Spi -- ri -- tui _ San - cto et Spi -- ri -- tui _ San -- cto

     et Spi -- ri -- tui _ San -- cto.

}

XbcIn = \relative do {

    re'8 re, re'4 r8 re dod la
    re re, re'4 r8 re dod la
    re4 r8 dod si la sol fad

    %4
    mi4 r8 fad mi re dod si
    la4\tu r16 la' la, la' la,4 r16 la' la, la'
    la,4 r16 la' la, la' la,4 r16 la' la, la'

    %7
    la,4 r16 la' la, la' la,4 r16 la' la, la'
    la,4 r la r
    la r la r

    %10
    re8 re sol, la re4 r
    re'8 re, re'4 r8 re dod la
    re8 re, re'4 r8 re dod la

    %13
    re re, re'4 r8 re re, re'\mbreak
    re,4 r16 re' re, re' re,4 r16 re' re, re'
    re,4 r16 re' re, re' re,4 r16 re' re, re'

    %16
    la,8 la la la la4 r16 la' la, la'
    la,4 r16 la' la, la' la,4 r16 la' la, la'
    la,4 r16 la' la, la' la,4 r16 la' la, la'

    %19
    la,4 r16 la' la, la' la, la' la, la' la, la' la, la'
    re8 r re r re r re r
    sold,2 la4 r8 mi

    %22
    la la, la la mi' mi, mi mi
    la4 r16 mi' mi,  mi'  mi,4 r16 mi' mi,  mi'
    mi,4 r16 mi' mi,  mi' mi,4 r16 mi' mi,  mi' \mbreak

    %25
    mi,4 r16 mi' mi,  mi' mi,4 r16 mi' mi,  mi'
    mi,8 mi' mi mi mi mi mi mi
    la la, re mi la,4 r

    %28
    re16 re' re, re' re, re' re, re' sol,8 sol, r4
    dod16 dod' dod, dod' dod, dod' dod, dod' fad,8 fad, r4
    si16 si' si, si' si, si' si, si' mi,8 mi, r4

    %31
    la16 la' la, la' la, la' la, la' re,8 re, r4
    re16 re' re, re' re, re' re, re' la'8 sol la la,
    re8 re re, re' r re re, re'

    %34
    r re re, re'\mbreak  r re re, re'
    sol sol, sol' sol, la' la, re[re,]
    la'' sol la la, re, re' re re,

    %37
    re re' sol, la re, re' re re,
    re re' sol, la re,2\fermata

}

XbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*4
    s4 s16 <6 4> s8 s2
    <7 5>1
    <6 4>
    <3>
    s1*7
    s2 s4 s16 <6 4> s8
    s2 <7 5>
    s <6 4>
    s <5 3>
    s1
    <6 5>
    s2 <5 4>4 <3+>
    s4 s16 <6 4> s8 <7 5>2
    s <6 4>
    <6 4>1
    <3+>
    s1*5
    s2 <5 4>4 <3>
    s2 s8 <7-> s4
    s1
    s2 <7>
    <5 4>4 <3> s2

}


XvlIIIn = \relative do'' {

    R1*4
    la'8 la, la'4 r8 la sol fad
    sol la, sol'4 r8 sol fad mi

    %7
    fad8 la, fad'4 r8 fad sol fad
    mi4 r mi r
    mi r mi r

    %10
    re8 fad\tu sol mi re4 r
    R1*2
    r2 r8 fad16[sol la sol la fad]\mbreak

    %14
    fad8 re la'4 r8 la fad re
    la' re, la'4 r8 la fad re
    mi16 fad mi fad sol fad sol fad mi8 la, la'4

    %17
    r8 la sol fad sol la, sol'4
    r8 sol fad mi fad8 la, fad'4
    r8 fad sol \parenthesize fad mi[mi,16 fad sol fad sol mi]

    %20
    re'8 r re r re r re r
    sold,2 la4 r8 mi'
    dod la' dod, dod si sold' si, si

    %23
    dod la mi'4 r8 mi re dod
    re mi, re'4 r8 re dod si\mbreak
    dod mi, dod'4 r8 dod si la

    %26
    si16 dod si dod re dod re si sold' la sold la si la si sold
    la8 dod, re si la la' r16 sol fad mi
    fad8 fad r4 re8 sol r16 fad mi re

    %29
    mi8 mi r4 dod8 fad r16 mi re dod
    re8 \parenthesize re r4  si8 mi r16 re dod si
    dod8 dod r4 fad16 sol fad sol la sol la sol

    %32
    fad sol fad sol la sol la sol fad8 fad mi mi
    re[fad16 sol la sol la sol] fad8[fad,16 sol la sol la sol]
    la8[fad'16 sol la sol la sol]\mbreak fad8[fad,16 sol la sol la fad]

    %35
    sol8[sol'16 la si la si sol] mi8 mi fad fad
    mi mi mi mi re[fad16 sol la sol la sol]
    fad8 re mi dod re[fad,16 sol la sol la sol]

    %38
    fad8 fad' sol mi fad2\fermata

}

XvlIVn = \relative do'' {

    R1*4
    mi8 la, fad'4 r8 fad mi re
    mi8 la, mi'4 r8 mi re dod

    %7
    re la re4 r8 re mi re
    dod4 r dod r
    dod r dod r

    %10
    la8 re\tu mi dod re4 r
    R1*2
    r2 r8 re16[mi fad mi fad re]\mbreak

    %14
    re8 la fad'4 r8 fad re la
    fad' la, fad'4 r8 fad re la
    dod16 re dod re mi re mi re dod8 la fad'4

    %17
    r8 fad mi re mi la, mi'4
    r8 mi re dod re la re4
    r8 re mi \parenthesize re dod[dod,16 re  mi re mi dod]

    %20
    re'8 r re r re r re r
    sold,2 la4 r8 si
    la mi' la, la sold si sold sold

    %23
    la mi dod'4 r8 dod si la
    si mi, si'4 r8 si la sold\mbreak
    la mi la4 r8 la sold la

    %26
    sold16 la sold la si la si sold mi' fad mi fad sold fad sold mi
    dod8 la si sold la mi' r16 mi re dod
    re8 re r4 si8 re r16 re dod si

    %29
    dod8 dod r4 la8 dod r16 dod si la
    si8 si r4 sol8 si r16 si la sol
    la8 la r4 re16 mi re mi fad mi fad mi

    %32
    re mi re mi fad mi fad mi re8 re dod dod
    re[re16 mi fad mi fad mi] re8[re,16 mi fad mi fad mi]
    re8[re'16 mi fad mi fad re]\mbreak re8[re,16 mi fad mi fad re]

    %35
    re8[si'16 dod re dod re si] dod8 dod re re
    re re dod dod re[re16 mi fad mi fad mi]
    re8 fad, sol mi fad [re16 mi fad mi fad mi]

    %38
    re8 re' mi dod re2\fermata

}

XvlaIIn = \relative do' {

    R1*4
    la'8 la la4 r8 la la la
    dod dod dod4 r8 dod la la

    %7
    la la la4 r8 la dod la
    la4 r la r
    la r la r

    %10
    la8 la si la fad4 r
    R1*2
    r2 r8 la la la\mbreak

    %14
    la fad re'4 r8 re la fad
    re' fad, re'4 r8 re la fad
    R1*4

    %20
    re'8 r re r re r re r
    sold,2 la4 r8 sold
    mi4 mi mi mi

    %23
    mi8 mi mi4 r8 mi mi mi
    sold sold sold4 r8 sold sold sold\mbreak
    mi mi mi4 r8 mi mi mi

    %26
    mi mi mi mi si' si si sold
    mi mi fad mi dod' dod dod dod
    la la r4 si8 si si si

    %29
    sol sol r4 la8 la la la
    fad8 fad r4 sol8 sol sol sol
    mi8 mi r4 la,8 la' la la

    %32
    la la la la la la la la
    la la la la la la, la la
    la la' la la\mbreak la la, la la

    %35
    si re re si' la la la la
    la la la la la la la la
    la la, si la la la la la

    %38
    la la' si la fad2\fermata

}

XsopranoIIn = \relative do'' {

    \autoBeamOff
    R1*10
    la2 la4 la
    la2 la4 la

    %13
    fad4. mi8 re2\mbreak
    re'2 re4 re
    re2 re4 re

    %16
    dod2 la4 r
    re4. re8 mi2
    dod re4 re

    %19
    re4. re8 dod2
    re4 re re re8 re
    sold,2 la4 r8 mi'

    %22
    dod4 dod8 dod si2
    dod r
    R1*3

    %27
    r2 mi4 mi8 mi
    fad fad r4 re8 re re re
    mi16 mi mi8 r4 dod8 dod dod dod16 dod

    %30
    re8 re r4 si8 si16 si si8 si16 si
    dod dod dod8 r4 re8 re re re16 re
    re8 re re re16 re re4 dod

    %33
    re r do do
    \once\set suggestAccidentals = ##t do? do8 do\mbreak do2
    si4 re8 re \once\set suggestAccidentals = ##t dod?4 re8 re
    re4(dod) re r

    %37
    R1*2

}

XtestoV= \lyricmode {

    Glo -- ria _ glo -- ria _ Pa - tri glo -- ria _ glo -- ria _ Pa -- tri

    glo -- ria _ glo -- ria _   Fili - o et Spi -- ri -- tui _ San -- cto Spi -- ri -- tui _ San -- cto.

     Glo -- ria _ Pa -- tri glo -- ria _ et Fili - o et Spi -- ri -- tui _ San -- cto

     Glo -- ria _ Pa -- tri et Fili - o et Spi -- ri -- tui _ et Spi -- ri -- tui _ San - cto et Spi -- ri -- tui _ San -- cto

     et Spi -- ri -- tui _ San -- cto.

}

XaltoIIn = \relative do' {

    \autoBeamOff
    R1*13
    fad2 fad4 fad
    fad2 fad4 fad

    %16
    mi2 mi4 r
    fad4. fad8 sol2
    la fad4 fad

    %19
    fad4. fad8 mi2
    re'4 re re re8 re
    sold,2 la4 r8 sold

    %22
    la4 la8 la la4(sold)
    la2 r
    R1*3

    %27
    r2 la4 la8 la
    la la r4 sol8 sol sol sol
    sol16 sol sol8 r4 fad8 fad fad fad16 fad

    %30
    fad8 fad r4 mi8 mi16 mi mi8 mi16 mi
    mi mi mi8 r4 fad8 fad fad fad16 fad
    la8 la la la16 la la2
    la4 r la la

    %34
    la la8 la\mbreak la2
    sol4 sol8 sol sol4 fad8 fad
    mi2 fad4 r

    %37
    R1*2

}

XtestoVI = \lyricmode {

    Glo -- ria _ glo -- ria _ Pa -- tri

    glo -- ria _ glo -- ria _   Fili - o et Spi -- ri -- tui _ San -- cto Spi -- ri -- tui _ San -- cto.

     Glo -- ria _ Pa -- tri glo -- ria _ et Fili - o et Spi -- ri -- tui _ San -- cto

     Glo -- ria _ Pa -- tri et Fili - o et Spi -- ri -- tui _ et Spi -- ri -- tui _ San -- cto et Spi -- ri -- tui _ San -- cto

     et Spi -- ri -- tui _ San -- cto.

}

XtenoreIIn = \relative do' {

    \autoBeamOff
    R1*13
    la2 la4 la
    la2 la4 la

    %16
    la2 la4 r
    la4. la8 dod2
    dod la4 la

    %19
    la4. la8 dod2
    re4 re re re8 re
    sold,2 la4 r8 mi'

    %22
    mi4 mi8 mi mi2
    mi r
    R1*3

    %27
    r2 dod4 dod8 dod
    re re r4 si8 si si si
    dod16 dod dod8 r4 la8 la la la16 la

    %30
    si8 si r4 sol8 sol16 sol sol8 sol16 sol
    la la la8 r4 la8 la la la16 la
    fad'8 fad fad fad16 fad fad4 mi

    %33
    fad r fad fad
    fad fad8 fad\mbreak fad2
    re4 si8 si la4 la8 la
    la2 la4 r

    %37
    R1*2

}

XtestoVII = \lyricmode {

    Glo -- ria _ glo -- ria _ Pa -- tri

    glo -- ria _ glo -- ria _   Fili - o et Spi -- ri -- tui _ San -- cto Spi -- ri -- tui _ San -- cto.

     Glo -- ria _ Pa -- tri glo -- ria _ et Fili - o et Spi -- ri -- tui _ San -- cto

     Glo -- ria _ Pa -- tri et Fili - o et Spi -- ri -- tui _ et Spi -- ri -- tui _ San - cto et Spi -- ri -- tui _ San -- cto

     et Spi -- ri -- tui _ San -- cto.



}

XbassoIIn = \relative do {

    \autoBeamOff
    R1*13
    re2 re4 re
    re2 re4 re

    %16
    la'2 la,4 r
    re4. re8 la'2
    la, re4 re

    %19
    re4. re8 la2
    re'4 re re re8 re
    sold,2 la4 r8 mi

    %22
    la4 la,8 la mi'2
    la, r
    R1*3

    %27
    r2 la'4 la8 la
    re re, r4 sol8 sol sol sol
    dod16 dod, dod8 r4 fad8 fad fad fad16 fad

    %30
    si8 si r4 mi,8 mi16 mi mi8 mi16 mi
    la la, la8 r4 re8 re re re16 re
    re8 re re re16 re la'4 la,

    %33
    re r re re
    re re8 re\mbreak re2
    sol4 sol8 sol la4 re,8 re

    %36
    la'4(la,) re r
    R1*2

}

XtestoVIII = \lyricmode {

    Glo -- ria _ glo -- ria _ Pa -- tri

    glo -- ria _ glo -- ria _   Fili - o et Spi -- ri -- tui _ San -- cto Spi -- ri -- tui _ San -- cto.

     Glo -- ria _ Pa -- tri glo -- ria _ et Fili - o et Spi -- ri -- tui _ San -- cto

     Glo -- ria _ Pa -- tri et Fili - o et Spi -- ri -- tui _ et Spi -- ri -- tui _ San - cto et Spi -- ri -- tui _ San -- cto

     et Spi -- ri -- tui _ San -- cto.

}

XbcIIn = \relative do {

    re'8 re, re'4 r8 re dod la
    re re, re'4 r8 re dod la
    re4 r8 dod si la sol fad

    %4
    mi4 r8 fad mi re dod si
    la4\tu r16 la' la, la' la,4 r16 la' la, la'
    la,4 r16 la' la, la' la,4 r16 la' la, la'

    %7
    la,4 r16 la' la, la' la,4 r16 la' la, la'
    la,4 r la r
    la r la r

    %10
    re8 re sol, la re,4 r
    re''8 re, re'4 r8 re dod la
    re8 re, re'4 r8 re dod la

    %13
    re re, re'4 r8 re re, re'\mbreak
    re,4 r16 re' re, re' re,4 r16 re' re, re'
    re,4 r16 re' re, re' re,4 r16 re' re, re'

    %16
    la,8 la la la la4 r16 la' la, la'
    la,4 r16 la' la, la' la,4 r16 la' la, la'
    la,4 r16 la' la, la' la,4 r16 la' la, la'

    %19
    la,4 r16 la' la, la' la, la' la, la' la, la' la, la'
    re8 r re r re r re r
    sold,2 la4 r8 mi

    %22
    la la, la la mi' mi, mi mi
    la4 r16 mi' mi,  mi'  mi,4 r16 mi' mi,  mi'
    mi,4 r16 mi' mi,  mi' mi,4 r16 mi' mi,  mi' \mbreak

    %25
    mi,4 r16 mi' mi,  mi' mi,4 r16 mi' mi,  mi'
    mi,8 mi' mi mi mi mi mi mi
    la la, re mi la,16 la' la, la' la, la' la, la'

    %29
    re8 re, r4 sol,16 sol' sol, sol' sol, sol' sol, sol'
    dod8 dod, r4fad,16 fad' fad, fad' fad, fad' fad, fad'
    si8 si, r4 mi,16 mi' mi, mi' mi, mi' mi, mi'

    %31
    la8 la, r4 re,16 re' re, re' re, re' re, re'
    re, re' re, re' re, re' re, re' la'8 sol la la,
    re8 re re, re' r re re, re'

    %34
    r re re, re'\mbreak  r re re, re'
    sol sol, sol' sol, la' la, re[re,]
    la'' sol la la, re, re' re re,

    %37
    re re' sol, la re, re' re re,
    re re' sol, la re,2\fermata

}

XbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*4
    s4 s16 <6 4> s8 s2
    <7 5>1
    <6 4>
    <3>
    s1*7
    s2 s4 s16 <6 4> s8
    s2 <7 5>
    s <6 4>
    s <5 3>
    s1
    <6 5>
    s2 <5 4>4 <3+>
    s4 s16 <6 4> s8 <7 5>2
    s <6 4>
    <6 4>1
    <3+>
    s1*5
    s2 <5 4>4 <3>
    s2 s8 <7-> s4
    s1
    s2 <7>
    <5 4>4 <3> s2

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 60
    s1*38
    \bar "|."

}

XtpI = {
    \notypeset
    <<\XtpIn \forma>>

}

XtpII = {
    <<\XtpIIn \forma>>

}

XvlI = {
    <<\XvlIn \forma>>

}

XvlII = {
    <<\XvlIIn \forma>>

}

XvlaI = {
    \clef alto
    <<\XvlaIn \forma>>

}

XsopranoI = {
    \new Voice = "gloria1"
    <<\XsopranoIn \forma>>
}

XaltoI = {
    \new Voice = "gloria2"
    <<\XaltoIn \forma>>
}

XtenoreI = {
    \new Voice = "gloria3"
    <<\XtenoreIn \forma>>
}

XbassoI = {
    \clef bass
    \new Voice = "gloria4"
    <<\XbassoIn \forma>>
}



XbcI = {
    \clef bass
    <<\XbcIn \forma \XbfIn>>
    \typeset
}

XvlIII = {
    <<\XvlIIIn \forma>>

}

XvlIV = {
    <<\XvlIVn \forma>>

}

XvlaII = {
    \clef alto
    <<\XvlaIIn \forma>>

}

XsopranoII= {
    \new Voice = "gloria5"
    <<\XsopranoIIn \forma>>
}

XaltoII= {
    \new Voice = "gloria6"
    <<\XaltoIIn \forma>>
}

XtenoreII = {
    \new Voice = "gloria7"
    <<\XtenoreIIn \forma>>
}

XbassoII = {
    \clef bass
    \new Voice = "gloria8"
    <<\XbassoIIn \forma>>
}



XbcII = {
    \clef bass
    <<\XbcIIn \forma \XbfIIn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



XIvlIn = \relative do'' {

   R1*7
   la8 re fad la fad re la' r
   la, dod mi la mi dod la' r

   %10
   sol, si re sol re si sol' r
   la, dod mi la mi dod la' r
   la, re fad la  fad re la' r

   %13
   si, re sol si sol mi si' r
   dod, mi fad la fad re mi r
   fad re fad la sold la la sold\mbreak

   %16
   la dod, mi la mi dod la' r
   si, mi sold si mi, si si' r
   la, re fad la fad re la' r

   %19
   sold, si mi sold mi si sold' r
   dod, mi la dod la mi dod' r
   fad,, la re fad re la fad' r

   %22
   sold, si dod mi dod la si r
   la dod mi la mi dod la' r
   si, mi sold si mi, si si' r

   %25
   la, re fad la\mbreak fad re la' r
   sold, si mi sold mi si sold' r
   la, dod mi la mi dod la' r

   %28
   fad, la re fad re la fad' r
   sold, si dod mi  dod la si r
   la'1

   %31
   sold
   fad
   mi\mbreak

   %34
   dod
   re~
   re4 dod si mi~

   %37
   mi re dod2
   re4 si8 si re re re re
   fad8.[fad16 fad8 fad] si, si si si

   %40
   si si r si si si si si
   si2 lad4 fad'8 fad
   fad si,16 si si8 si si si fad' fad

   %43
   sol si,16 si si8 si si2~
   si8 si si si si si lad4
   si re2 dod8 si

   %46
   la2 sold
   fad'1
   mi

   %49
   re
   dod
   la

   %52
   si\mbreak
   dod2. dod4
   dod8 la' la la  la la la la

   %55
   sol sol16 sol sol8 sol sol sol sol sol
   sol sol16 sol fad8 fad mi mi mi4
   fad4 re8 re mi mi la la

   %58
   la8. [re,16 re8 sol] sol dod, dod mi
   fad fad la la si si16 si si8 sold
   mi mi mi4 mi r\mbreak

   %61
   sold sold r2
   \once\set suggestAccidentals = ##t sold?4 sold r2
   re4 re re8 re dod4

   %64
   re8 re fad la si re, si' r
   dod, mi sol si la dod, la' r
   si, re fad la sol si, sol' r

   %67
   la, dod mi la la2
   sol fad
   mi r4 la8 la

   %70
   sol[sol16 sol sol8 sol]\mbreak  mi16 re mi fad mi fad sol mi
   fad mi fad sol fad mi re dod re8 la' la la
   fad16 mi fad sol fad sol la sol fad8 fad mi mi

   %73
   fad16 mi fad sol fad sol la sol fad8 fad re re
   re re16 re re8 re fad fad mi4
   fad16 mi fad sol fad sol la fad mi8 fad fad mi

   %76
   fad1\fermata

}

XIvlIIn = \relative do'' {

   R1*7
   fad,8 la re fad re la fad' r
   mi, la dod mi dod la mi' r

   %10
   re, sol si re si sol re' r
   mi, la dod fad dod la mi' r
   fad, la re fad re la fad' r

   %13
   sol, si re sol mi si sol' r
   la, dod re fad re la dod r
   re la re re si dod mi si\mbreak

   %16
   la la dod mi dod la mi' r
   sold, si mi sold sold mi sold r
   fad, la re fad re la fad' r

   %19
   mi, sold si mi si sold mi' r
   la, dod mi la mi dod mi r
   re, fad la re la fad re' r

   %22
   mi, sold la dod la mi sold r
   mi la dod mi dod la mi' r
   sold, si mi sold si, sold sold' r

   %25
   fad, la re fad\mbreak re la fad' r
   mi, sold si mi si sold mi' r
   mi, la dod mi dod la mi' r

   %28
   re, fad la re la fad re' r
   mi, sold la dod la mi sold r
   mi'16 re mi fad mi re dod si la8.[la16 la8] r8

   %31
   si16 la si dod si la sold fad mi4 r8 si'
   la la la la la dod dod16 re mi fad
   sold,4 r sold'16 fad sold la sold mi fad sold\mbreak

   %34
   la4 dod,8 dod mi[mi16 re dod si la sol]
   fad8 fad fad fad fad'[fad16 mi re dod si la]
   sold4 la2 sol4

   %37
   fad4. si8 si4 lad
   si r r2
   si'4 si, r2

   %40
   mi4 mi, r2
   fad'4 fad, r2
   si'4 si, r2

   %43
   r4 si'8 si sol[sol16 sol sol8 sol]\mbreak
   fad fad fad fad fad fad fad4
   fad r sold2

   %46
   fad2. mid4
   fad fad,8 fad la la la la
   dod8.[dod16 dod8 dod] fad, fad fad fad

   %49
   fad fad r fad fad fad fad fad
   fad2 mid4 dod'8 dod
   dod fad,16 fad fad8 fad fad fad dod' dod

   %52
   re fad,16 fad fad8 fad fad2~\mbreak
   fad8 fad fad fad fad fad mid4
   fad8 dod' dod dod re re re re

   %55
   si si16 si si8 si mi mi mi mi
   dod dod16 dod re8 re re re dod4
   re la8 la dod dod mi dod

   %58
   fad8.[fad16 fad8 si,] mi mi mi dod
   la la re re re re16 re re8 re
   dod dod si4 dod r\mbreak

   %61
   mi si r2
   re4 si r2
   fad'4 fad mi8 mi mi4

   %64
   fad8 la, re fad sol re sol r
   \parenthesize sol, dod mi sol fad la, fad' r
   fad, si re fad mi sol, mi' r

   %67
   mi, la dod mi fad2
   mi re
   dod la

   %70
   si\mbreak dod
   re la8 re re re
   re16 dod re mi re mi fad mi re8 re dod4

   %73
   re re la fad'8 fad
   fad fad16 fad fad8 re re re dod4
   re re8 re dod re re8 dod

   %76
   re1\fermata

}

XIvlaIn = \relative do' {

   R1*7
   fad8 fad fad fad fad fad fad fad
   mi mi mi mi mi mi mi mi

   %10
   re re re re re re re re
   dod dod dod dod dod dod dod dod
   la la la la la la la la

   %13
   si si si si si si si si
   la la la la la la la la
   la la la la mi' mi mi mi\mbreak

   %16
   mi la la la la la la la
   sold sold sold sold sold sold sold sold
   fad fad fad fad fad fad fad fad

   %19
   mi mi mi mi mi mi mi mi
   dod dod dod dod dod dod dod dod
   re re re re re re re re

   %22
   mi mi mi mi mi mi mi mi
   mi dod' dod dod dod dod dod dod
   si si si si si si si si

   %25
   la la la la\mbreak la la la la
   sold sold sold sold sold sold sold sold
   mi mi mi mi mi mi mi mi

   %28
   fad fad fad fad fad fad fad fad
   mi mi mi mi mi mi mi mi
   mi4 dod8 dod mi mi mi mi

   %31
   sold8.[sold16 sold8 si,] si re re mi
   fad fad fad fad fad4 r
   si16 la si dod si la sold fad mi4. mi8\mbreak

   %34
   mi2 r4 mi8 mi
   la[la16 sold fad mi re dod] si8 si si si
   si mi4 mi8 fad4 si,

   %37
   dod re8 fad fad4. fad8
   fad4 r r2
   r red16 dod red mi red mi fad red

   %40
   mi4 r mi16 re? mi fad mi fad sol mi
   fad4 r lad16 sol lad si lad si dod lad
   si4 r re,16 dod re mi re mi fad re

   %43
   si4 mi8 mi mi[mi16 mi dod8 dod]\mbreak
   dod dod dod dod dod dod dod4
   si r si'8 si la sold

   %46
   dod, dod dod dod dod dod dod4
   dod la8 la dod dod dod dod
   fad fad fad fad lad, lad lad lad

   %49
   si si si si fad' fad fad fad
   dod dod dod dod dod dod dod dod
   dod dod dod dod dod dod fad[fad]

   %52
   re re re re re re re re \mbreak
   dod dod dod dod dod dod dod dod
   dod fad, fad fad re' re re re

   %55
   re re16 re re8 re si si si si
   mi mi16 dod la8 la la la r4
   re'2 dod

   %58
   si la
   fad sold
   la4 sold la r\mbreak

   %61
   si, mi r2
   si4 si r2
   la4 la la8 la la4

   %64
   la8 fad' fad fad re re re re
   mi mi mi mi dod dod dod dod
   re re re re si si si si

   %67
   dod dod dod dod la la' la la
   dod dod dod dod la la la la
   dod dod dod dod fad,2

   %70
   sol\mbreak la
   la fad8 fad la [la]
   si si16 si si8 si la la la la

   %73
   la la la4 la la8 la
   si si16 si si8 si la la la4
   la la8 la la la la4

  %76
  la1\fermata

}

XIsopranoIn = \relative do'' {

   \autoBeamOff
   R1*10
   mi16[ re mi fad] mi [re \parenthesize dod \parenthesize si] la4 r
   la la la la8 la

   %13
   sol4 sol sol2~
   sol4 fad la16 [si dod re] mi[re dod si]
   la4 la8 re si dod mi4\mbreak

   %16
   dod r r2
   r mi16[re mi fad] mi[re dod si]
   la4 r re16[dod re mi] re[dod si la]

   %19
   sold4 r r2
   r4 la8 la mi' mi16 re dod16[si] la[sol]
   fad8 fad fad fad fad' fad16 mi re[dod] si[la]

   %22
   sold4 la la (sold)
   la la8 la dod dod dod dod
   mi8. mi16 mi8 mi mi si si mi

   %25
   re re r re\mbreak re la la16[si] dod[re]
   mi4 mi mi16[re mi fad] mi[re dod si]
   la4 r dod2

   %28
   fad, re'
   sold,4 dod8 dod mi4(si)
   dod r r2

   %31
   R1*7
   r4 si8 si re re re re
   fad8. fad16 fad8 fad si,  si si si

   %40
   si si r si si si si si
   si2 lad4 fad'8 fad
   fad si,16 si si8 si si si fad' fad

   %43
   sol si,16 si si8 si si2~\mbreak
   si8 si si si si si lad4
   si re2 dod8[si]

   %46
   la2 sold
   fad'1
   mi

   %49
   re
   dod
   la

   %52
   si\mbreak
   dod2. dod4
   dod8 dod dod dod re re re re

   %55
   si si16 si si8 si mi mi mi mi
   dod dod16 dod re8 re re re dod4
   re la8 la dod dod mi dod

   %58
   fad8. fad16 fad8 si, mi mi mi dod
   la la re re re re16 re re8 re
   dod dod si4 dod r\mbreak

   %61
   mi si r2
   re4 si r2
   fad'4 fad mi8 mi mi4

   %64
   re16[mi fad mi re dod si la] si8 si r4
   \parenthesize dod16[ re mi re dod si la sol] la8 la r4
   si16[dod re dod si la sol fad] sol8 sol r4

   %67
   r mi' fad la,8 la
   dod dod16 dod dod8 dod re re re re
   mi mi mi dod la la re re

   %70
   re re16 re re8 re\mbreak dod16[si dod re] dod[re mi dod]
   la8 la la la re re re re
   re16[dod re mi] re[mi fad mi] re8 re dod4

   %73
   re re la fad'8 fad
   fad fad16 fad fad8 re re re dod4
   re re8 re dod re re[dod]

   %76
   re1\fermata

}

XItestoI = \lyricmode {

    A - men et in sæ -- cula _ sæ -- cu -- lo -- rum

    a - men a -- men a -- men a -- men a - men a - men et in sæ -- cula _

    sæ -- cu -- lo -- rum  et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men.

    Si -- cut e -- rat in prin -- ci -- pio, _ et nunc et nunc et sem -- per et nunc et nunc et sem -- per

    a - men a -- men a -- men a -- men a -- men.

    Si -- cut e -- rat in prin -- ci -- pio, _ et nunc et nunc et sem -- per et nunc et nunc et sem -- per

    et in sæ -- cula _ sæ -- cu -- lo -- rum  et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum

    a -- men a - - men. Si -- cut e -- rat in prin -- ci -- pi -- o,

    et nunc et sem -- per et in sæ -- cula _  nunc et sem -- per et in sæ -- cula _ sæ -- cu -- lo -- rum

    a -- men. Si -- cut e -- rat in prin -- ci -- pio, _ %% inizio 58

    et nunc et nunc et sem -- per

    et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men a -- men a -- men a -- men a -- men

    a - - men a - men a - men a -- men et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum

    a -- men a -- men et in

    sæ -- cula _ sæ -- cu -- lo - - rum a -- men a -- men sæ -- cu -- lo - - rum a -- men a -- men et in

    sæ -- cula _ sæ -- cu -- lo -- rum a -- men sæ -- cu -- lo -- rum a -- men.

}

XIaltoIn = \relative do' {

   \autoBeamOff

   R1*7
   r4 re8 re fad fad fad fad
   la8. la16 la8 la la mi mi fad

   %10
   sol sol r sol sol re re16[mi] fad[sol]
   la4 la la16[sol la si] la[sol fad mi]
   re4 r re re

   %13
   re re8 re mi4 mi
   mi re r2
   re16[mi fad sol] la[fad mi re ] sold8 la la[sold]\mbreak

   %16
   la4 r r2
   si16[la si dod] si [la sold fad] mi4 r
   la16 [sold la si] la[sold fad mi] re4 r

   %19
   mi mi mi mi8 mi
   mi mi dod dod r4 mi8 mi
   la la16 sol fad16[mi] re[dod] si8 si si si

   %22
   mi mi16 mi mi8 mi mi mi mi4
   mi r r2
   si'4 si si si8 mi,

   %25
   la4 la\mbreak la2
   sold sold
   mi la

   %28
   re, si'
   mi,4 la mi2
   dod4 r r2

   %31
   R1*8
   si'4 si, fad'16[mi fad sol] fad[sol la fad]
   sol4 r mi16[re mi fad] mi[fad sol mi]

   %41
   fad4 r r2
   si4 si, re16[dod re mi] re[mi fad re]
   si4 si'8 si sol sol16 sol sol8 sol\mbreak

   %44
   fad fad fad fad fad fad lad4
   fad r sold2
   fad~fad4 mid

   %47
   fad fad8 fad la la la la
   dod8. dod16 dod8 dod fad ,fad fad fad
   fad fad r fad fad fad fad fad

   %50
   fad2 mid4 dod'8 dod
   dod fad,16 fad fad8 fad fad fad dod' dod
   re fad,16 fad fad8 fad fad2~\mbreak

   %53
   fad8 fad fad fad fad fad mid4
   fad8 la la la la la la la
   sol sol16 sol sol8 sol sol sol sol sol

   %56
   sol sol16 sol fad8 fad mi mi mi4
   fad re8 re mi mi la la
   la8. re,16 re8 sol sol dod, dod mi

   %59
   fad fad la la si si16 si si8 sold
   mi mi mi4 mi r4\mbreak
   sold sold r2

   %62
   \once\set suggestAccidentals = ##t sold?4 sold r2
   re4 re re8 re dod4
   re8[re'16 dod si la sol fad] sol8 sol r4

   %65
   \parenthesize la16[si dod si la sol fad mi] re8 re r4
   sol16[la si la sol fad mi re] mi8 mi r4
   r2 la

   %68
   fad fad
   mi r4 la8 la
   sol sol16 sol sol8 sol\mbreak mi16[re mi fad] mi[fad sol mi]

   %71
   re8 re fad fad la la la la
   fad16[mi fad sol] fad[sol la sol] fad8 fad mi mi
   fad16[mi fad sol] fad[sol la sol] fad8 fad re re

   %74
   re re16 re re8 re fad fad mi4
   fad16[mi fad sol] fad[sol la fad] mi8 fad fad[mi]
   fad1\fermata

}

XItestoII = \lyricmode {

   Si -- cut e -- rat in prin -- ci -- pio, _  et nunc et nunc et sem -- per

   et nunc et nunc et sem -- per a - men

   et in sæ -- cula _ sæ -- cu -- lo -- rum a - - men a -- men a - men  a - men

   et in sæ -- cula _ sæ -- cu -- lo -- rum et in sæ -- cula _ sæ -- cu -- lo -- rum

   et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men et in sæ -- cula _ sæ -- cu -- lo -- rum

   a -- men  a -- men  a -- men a - men

    a -- men  a - men  a - men  a -- men  a - men et in sæ -- cula _ sæ -- cu -- lo -- rum

    sæ -- cu -- lo -- rum a -- men a - - men.

    Si -- cut e -- rat in prin -- ci -- pio, _  et nunc et nunc et sem -- per

    et nunc et nunc et sem -- per et in sæ -- cula _ sæ -- cu -- lo -- rum

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men

    et nunc et sem -- per et in sæ -- cula _  nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum a -- men.

    Si -- cut e -- rat in prin -- ci -- pio, _  et nunc et nunc et sem -- per

    et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men a -- men a -- men a -- men a -- men

    a - - men a - men a - men a - - men et in sæ -- cula _ sæ -- cu -- lo - - rum

    a -- men a -- men sæ -- cu -- lo - - rum a -- men a - - men et in

    sæ -- cula _ sæ -- cu -- lo -- rum a - - - men a -- men.

}

XItenoreIn = \relative do' {

   \autoBeamOff

   R1*7
   re1
   dod

   %10
   si
   \parenthesize la
   fad

   %13
   sol
   la2. la4
   re, re'~re8 dod si4\mbreak

   %16
   la dod8 dod mi mi mi mi
   mi si si si sold sold sold sold
   la la r4 r2

   %19
   si16[la si dod] si[la sold fad] mi4 r
   dod'4 dod dod dod8 dod
   la la la la r4 re

   %22
   si la mi si'
   la dod8 dod mi mi mi mi
   mi si si si sold sold sold sold

   %25
   la4 la r2\mbreak
   si16[la si dod] si[la sold fad] mi4 r
   mi' mi mi mi8 mi

   %28
   re4 re re2~
   re4 dod si2
   la4 r r2

   %31
   R1*8
   r2 red16[dod red mi] red[mi fad red]
   mi4 mi, r2

   %41
   fad'4 fad, lad16[sold lad si] lad[si dod lad]
   si4 r si16[la? si dod] si[dod re si]
   sol4 mi'8 mi mi mi16 mi dod8 dod\mbreak

   %44
   dod dod dod dod dod dod dod4
   si r si8 si la sold
   dod dod dod dod dod dod dod4

   %47
   la r r2
   fad'4 fad, lad16[sold lad si] lad [fad sold lad]
   si4 r fad' fad,

   %50
   r2 dod'4 dod,
   dod' dod dod fad8 fad
   re4 re re8 re re re\mbreak

   %53
   dod dod dod dod dod dod dod4
   dod8 fad, fad fad re' re re re
   re re16 re re8 re si si si si

   %56
   mi mi16 dod la8 la la la r4
   re2 dod
   si la

   %59
   fad sold
   la4 sold la r\mbreak
   si mi r2

   %62
   si4 si r2
   la4 la la8 la la4
   la r si16[dod re dod si la sol fad]

   %65
   mi8 mi r4 la16[si dod si la sol fad mi]
   re8 re r4 sol16[la si la sol fad mi re]
   dod4 la' la la8 la

   %68
   la la16 la la8 la la la la la
   dod dod r4 la2
   si\mbreak dod

   %71
   re r4 la8 la
   si si16 si si8 si la la la la
   la la la4 la la8 la

   %74
   si si16 si si8 si la la la4
   la la8 la la la la4
   la1\fermata

}

XItestoIII = \lyricmode {

    Si -- cut e -- rat in prin -- ci -- pi -- o, a -- men a -- men si -- cut e -- rat in prin -- ci -- pi -- o,

    et nunc et nunc et sem -- per a - men

    et in sæ -- cula _ sæ -- cu -- lo -- rum  a - - - - men. %% 23

    Si -- cut e -- rat in prin -- ci -- pi -- o, et nunc et nunc et sem -- per a - men

    et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men a - - men a -- men a - men a - men

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men

    sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men a -- men a -- men a - men a -- men a -- men

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men

    et nunc et sem -- per et in sæ -- cula _  nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum. Si -- cut e -- rat in prin -- ci -- pi -- o,

    a -- men a -- men a -- men a -- men a -- men a - men a - men a -- men a -- men

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum

    a - - men  et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum

    a -- men  et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men sæ -- cu -- lo -- rum a -- men.

}

XIbassoIn = \relative do {

   \autoBeamOff

   R1*8
   la'4 la, r2
   si'4 si, r2

   %11
   dod'4 dod, r2
   re'4 re, r fad8 fad
   sol sol16 sol sol8 sol sol sol r4

   %14
   r2 la
   re,4 re8 fad mi la, mi'4\mbreak
   la,4 r r2

   %17
   mi'4 mi, r2
   fad'4 fad, r2
   sold'4 sold, r2

   %20
   la'4 la, r2
   r4 re8 re re' re16 dod si[la] sold[fad]
   mi4 la, mi' mi

   %23
   la1
   sold
   fad

   %26
   mi
   dod
   re

   %29
   mi2. mi4
   la, r r2
   R1*7

   %38
   si'1
   la
   sol

   %41
   fad
   re
   mi\mbreak

   %44
   fad2. fad4
   si, r mid8 mid re dod
   fad fad fad fad dod dod dod4

   %47
   fad4 r fad16 [mid fad sold] fad [sold la sold]
   fad4 r fad16 [mi? fad \once\set suggestAccidentals = ##t sold?] fad [mi re dod]

   %49
   si4 r si16[ lad si dod] si [dod re si]
   dod4 r dod16 [si dod re] dod [red mid dod]
   fad4 r fad16 [mi? fad sold] fad [mi re dod]

   %52
   si4 r r2\mbreak
   dod8 dod dod dod dod dod dod4
   fad8 fad fad fad fad fad fad fad

   %55
   sol sol16 sol sol8 sol sol sol sol sol
   la la16 la re,8 re la' la la [la,]
   re4 re8 re la' la la la

   %58
   si8. si16 si8 si, dod dod dod la
   re re fad fad mi mi16 mi mi8 mi
   la la, mi'4 la, r\mbreak

   %61
   mi' mi r2
   mi4 mi r2
   re4 re la'8 la la,4

   %64
   re4 r sol16[la si la sol fad mi re]
   dod8 dod r4 fad16[sol la sol fad mi re dod]
   si8 si r4 mi16[fad sol fad mi re dod si]

   %67
   la4 la re r
   la'16[sol la si] la[si dod la] re,4 r
   la'16[sol la si] la[sol fad mi] re[dod re mi] si[dod re si]

   %70
   sol'4 sol8 sol\mbreak sol sol16 sol sol8 sol
   fad fad r4 fad2
   sol la

   %73
   re, fad
   sol la
   re,16[dod re mi] re[mi fad re] la'8 re, la'[la,]

   %76
   re2\fermata

}

XItestoIV = \lyricmode {

    A -- men  a -- men a -- men a -- men et in sæ -- cula _ sæ -- cu -- lo -- rum

    a -- men a -- men a -- men a -- men  a -- men a -- men a -- men a -- men

    et in sæ -- cula _ sæ -- cu -- lo -- rum  a -- men.

    Si -- cut e -- rat in prin -- ci -- pi -- o si -- cut e -- rat in prin -- ci -- pi -- o

    sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum

    a -- men a -- men a - men a - men a - men a - men a - men

    sæ -- cu -- lo -- rum  a -- men a -- men

    et nunc et sem -- per et in sæ -- cula _  nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum a -- men.

    Si -- cut e -- rat in prin -- ci -- pio, _ et nunc et nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum a -- men

    a -- men a -- men a -- men a -- men a -- men a - men a - men a -- men a -- men a - men a - - - men

    et in sæ -- cula _  sæ -- cu -- lo -- rum a - - men a - - - - - men a -- men.

}

XIbcIn = \relative do {

   R1*7
   re8 re' re re r re re re
   r dod dod dod r dod dod dod

   %10
   r si si si r si si si
   r la la la r la la la
   r fad fad fad r fad fad fad

   %13
   r sol sol sol r sol sol sol
   r la la la r la, la la
   re re re  fad mi la, mi'[mi,]\mbreak

   %16
   la la la la r la la la
   r mi' mi mi r mi mi mi
   r fad fad fad r fad fad fad

   %19
   r sold sold sold r sold sold sold
   r la la la r la, la la
   r re re re r re re re

   %22
   r mi la, la mi' mi mi, mi
   la la' la la r la la la
   r sold sold sold r sold sold sold

   %25
   r fad fad fad\mbreak r fad fad fad
   r mi mi mi r mi mi mi
   r dod dod dod r dod dod dod

   %28
   r re re re r re re re
   r mi mi mi r mi, mi mi
   la4 la8 la dod dod dod dod

   %31
   mi8. [mi16 mi8 mi] mi si si dod
   re re r re re[la la16 si dod re]
   mi4 r mi16 re mi fad mi re dod si\mbreak

   %34
   la4 la'8 la dod[dod16 si la sol fad mi]
   re8 re re re re'[re16 dod si la sold fad]
   mi8 mi, la'[la,] re re, mi'[mi,]

   %37
   lad lad' si si, fad' mi fad fad,
   si si' si si r si si si
   r la la la r la la la

   %40
   r sol sol sol r sol sol sol
   r fad fad fad r fad fad fad
   r re re re r re re re

   %43
   r mi mi mi r mi mi mi\mbreak
   r fad fad fad r fad fad fad
   si,4 r mid8 mid mid mid

   %46
   fad fad fad fad dod dod dod, dod
   fad'4 r fad16 mid fad sold fad sold la sold
   fad4 r fad16 mi? fad \once\set suggestAccidentals = ##t sold? fad mi re dod

   %49
   si4 r si16 lad si dod si dod re si
   dod4 r dod16 si dod re dod red mid dod
   fad4 r fad16 mi? fad sold fad mi re dod

   %52
   si4 r r2
   dod8 dod dod dod dod dod dod, dod
   fad fad' fad fad fad fad fad fad

   %55
   sol sol sol sol sol sol sol sol
   la la re, re la' la la, la
   re4 re8 re la' la la la

   %58
   si8.[si16 si8 si,] dod dod dod la
   re re fad fad mi mi mi mi
   la8 la, mi'[mi,] la4 r\mbreak

   %61
   mi' mi, r2
   mi'4 mi, r2
   re'4 re, la''8 la la, la

   %64
   re4 r sol16[la si la sol fad mi re]
   dod8 dod r4 fad16[sol la sol fad mi re dod]
   si8 si r4 mi16[fad sol fad mi re dod si]

   %67
   la8 la la la la2\tasto ~
   la1~
   la~

   %70
   la~
   la~
   la~

   %73
   la~
   la
   re16 dod re mi re mi fad re la'8 re, la' la,

   %76
   re,1\fermata

}

XIbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1*12
   s2 s4 <6>
   s <6 4> s <5 3>
   s2 <7 _+>4 <5 4>8 <3+>
   s1
   s8 <_+> s4 s2
   s8 <6> s4 s2
   s8 <6> s4 s2
   s1*2
   s8 <_+> s4 <5 4> <3+>
   s1*3
   s8 <_+> s4 s2
   s1*2
   s8 <7 _+> s4 s8 <5 4> <3+>4
   s1
   <_+>
   s
   <_+>
   s1*2
   <7 _+>2 <6 5>4 <3!>
   <6 5>2 <5 4>4 <3+>
   s1
   <6 4+>4 s4 s2
   s4 <6> s2
   s8 <5 4> s4 s8 <3+> s4
   s1
   s8 <5> s4 s8 <6 5> s4
   s8 <5 4> s4 s4 <3+>
   s2 <7>
   s <5 4>4 <3+>
   s1
   <7 _+>
   s
   <5 4>2 <3+>
   s1*2
   <5 4>2 s4 <3+>
   s2 <6>
   s <6>
   <7> <5 4>4 <3>
   s1
   <7>4 s8 <6> <6 5>2
   s <7 _+>
   s4 <_+> s2  %%% fine p. 44
   <_+>1
   <7>
   s2 <5 4>4 <3>
   s1
   <7>
   <7>
   <7>
   s1*7
   s2 s4 <6 4>8 <5 3>

}


XIvlIIIn = \relative do'' {

   la8 re fad la fad la, la' r
   la, dod mi la mi la, la' r
   si, re fad la re, sol, sol' r

   %4
   la, dod mi sol mi la, sol' r
   la, re fad la fad la, la' r\mbreak
   si, re sol si sol si, si' r

   %7
   la, dod fad la fad re la' r
   fad4 r la,8 re fad la
   mi dod la' r la, dod mi la

   %10
   re, si sol' r sol, si re sol
   mi dod la' r la, dod mi la
   re, la la' r la, re fad la

   %13
   re, si sol' r si, mi sol si
   mi, dod la' r re, fad la dod,
   re re fad la sold la la sold\mbreak

   %16
   la4 r la,8 dod mi la
   si, sold si' r si, mi sold si
   fad re la' r la, re fad la

   %19
   mi si sold' r sold, si mi sold
   mi dod dod' r dod, mi la dod
   fad, re la' r fad, la re fad

   %22
   si, sold dod r la dod mi sold
   la4 r la,8 dod mi la
   mi si si' r si, mi sold si

   %25
   re, la la' r\mbreak la,8 re fad la
   mi si sold' r sold, si mi sold
   mi dod la' r la, dod mi la

   %28
   fad re la' r la, re fad la
   mi si la' r la, dod mi sold
   la1

   %31
   sold
   fad
   mi\mbreak

   %34
   dod
   re~
   re4 dod si mi~

   %37
   mi re dod2
   re4 r r si8 si
   red red red red fad8. [fad16 fad8 fad]

   %40
   si, si si si si si r si
   dod dod dod dod dod4 dod
   r fad8 fad fad si,16 si si8 si

   %43
   si si sol' sol dod, dod16 dod dod8 dod\mbreak
   dod8 dod dod dod dod dod dod4
   re4 re2 dod8 si

   %46
   la2 sold
   fad'1
   mi

   %49
   re
   dod
   la

   %52
   si\mbreak
   dod2. dod4
   dod8 la' la la  la la la la

   %55
   sol sol16 sol sol8 sol sol sol sol sol
   sol sol16 sol fad8 fad mi mi mi4
   fad r la mi

   %58
   r2 sol4 mi
   r2 si'4 sold
   mi8 mi r4 la2\mbreak

   %61
   sold2 fad
   mi dod
   re re4 dod

   %64
   re r si8 re sol si
   si mi, si' r la, dod fad la
   la re, la' r sol, si mi sol

   %67
   sol dod, sol' r la2
   sol fad
   mi r4 fad8 fad

   %70
   re16 dod re mi re mi fad sol\mbreak dod, si dod re dod re mi dod
   re8[la'16 si la sol fad mi] fad4 re8 re
   re re16 re re8 re fad fad mi mi

   %73
   re16 dod re mi re mi fad mi re8 re la' la
   fad16 mi fad sol fad sol la sol fad8 fad mi4
   fad16 mi fad sol fad sol la fad mi8 fad fad mi

   %76
   fad1\fermata

}

XIvlIVn = \relative do'' {

   r2 la8 re fad la
   mi la, la' r la, dod mi la
   fad si, la' r sol, si re sol

   %4
   mi la, sol' r la, dod mi sol
   fad la, la' r la, re fad la\mbreak
   sol si, si' r si, re sol si

   %7
   mi, dod re fad re fad mi dod
   re4 r fad,8 la re fad
   dod la mi' r mi, la dod mi

   %10
   si sol re' r re, sol si re
   dod la mi' r mi, la dod mi
   re la fad' r fad, la re fad

   %13
   si, sol re' r sol, si mi sol
   dod, la fad' r la, re mi mi
   fad la, re re si dod mi si\mbreak

   %16
   dod4 r mi,8 la dod mi
   mi si sold' r sold, si mi sold
   re la fad' r fad, la re fad

   %19
   si, sold mi' r mi, sold si mi
   dod la la' r la, dod mi la
   la la, fad' r re, fad la re

   %22
   sold, mi mi' r mi, la si si
   dod4 r mi,8 la dod mi
   si sold sold' r sold, si mi sold

   %25
   la, fad fad' r\mbreak fad, la re fad
   si, sold mi' r mi, sold si mi
   dod la mi' r mi, la dod mi

   %28
   re la fad' r fad, la re fad
   si, sold dod r mi, la si mi
   dod16 re mi fad mi re dod si la8.[la16 la8] r8

   %31
   si16 la si dod si la sold fad mi4 r8 si'
   la la la la la dod dod16 re mi fad
   sold,4 r sold'16 fad sold la sold mi fad sold\mbreak

   %34
   la4 dod,8 dod mi[mi16 re dod si la sol]
   fad8 fad fad fad fad'[fad16 mi re dod si la]
   sold4 la2 sol4

   %37
   fad4. si8 si4 lad
   si r r2
   r si'4 si,

   %40
   r2 mi4 mi,
   r2 fad'4 fad,
   r2 si'4 si,

   %43
   r sol'8 sol mi[mi16 mi mi8 mi]\mbreak
   dod dod dod dod fad fad fad4
   fad r sold2

   %46
   fad2. mid4
   fad r r fad,8 fad
   lad lad lad lad dod8.[dod16 dod8 dod]

   %49
   fad,8 fad fad fad fad fad r si
   sold sold sold sold sold4 sold
   r4 dod8 dod dod fad,16 fad fad8 fad

   %52
   fad fad re' re sold, sold16 sold sold8 sold\mbreak
   \once\set suggestAccidentals = ##t sold? sold sold sold sold sold sold4
   fad8 dod' dod dod re re re re

   %55
   si si16 si si8 si mi mi mi mi
   dod dod16 dod re8 re re re dod4
   re4 r mi dod

   %58
   r2 mi4 dod
   r2 re4 re
   dod8 dod si4 dod la8 la\mbreak

   %61
   re re mi mi mi8.[la,16 la8 re]
   re sold, sold si dod dod mi mi
   fad fad16 fad fad8 fad mi mi mi4

   %64
   re4 r sol,8 si re sol
   \parenthesize sol dod, sol' r fad, la dod fad
   fad si, fad' r mi, sol si mi

   %67
   mi la, mi' r fad2
   mi re
   dod la

   %70
   si\mbreak  dod
   re la8 fad fad'[fad]
   fad fad16 fad fad8 re re re dod4

   %73
   re la fad re'8 re
   re16 dod re mi re mi fad mi re8 re dod4
   re re8 re re re re dod

   %76
   re1\fermata

}

XIvlaIIn = \relative do' {

   fad8 fad fad fad fad fad fad fad
   mi mi mi mi mi mi mi mi
   re re re re re re re re

   %4
   dod dod dod dod dod dod dod dod
   la la la la la la la la\mbreak
   si si si si si si si si

   %7
   dod dod la la re re la la
   la fad' fad fad fad fad fad fad
   mi mi mi mi mi mi mi mi

   %10
   re re re re re re re re
   dod dod dod dod dod dod dod dod
   la la la la la la la la

   %13
   si si si si si si si si
   la la la la la la la la
   la la la la mi' mi mi mi\mbreak

   %16
   mi la la la la la la la
   sold sold sold sold sold sold sold sold
   fad fad fad fad fad fad fad fad

   %19
   mi mi mi mi mi mi mi mi
   dod dod dod dod dod dod dod dod
   re re re re re re re re

   %22
   mi mi mi mi mi mi mi mi
   mi dod' dod dod dod dod dod dod
   si si si si si si si si

   %25
   la la la la\mbreak la la la la
   sold sold sold sold sold sold sold sold
   mi mi mi mi mi mi mi mi

   %28
   fad fad fad fad fad fad fad fad
   mi mi mi mi mi mi mi mi
   mi4 dod8 dod mi mi mi mi

   %31
   sold8.[sold16 sold8 si,] si re re mi
   fad fad fad fad fad4 r
   si16 la si dod si la sold fad mi4. mi8\mbreak

   %34
   mi2 r4 mi8 mi
   la[la16 sold fad mi re dod] si8 si si si
   si mi4 mi8 fad4 si,

   %37
   dod re8 fad fad4. fad8
   fad4 r r2
   R1

   %40
   mi16 red mi fad mi fad sol fad mi4 r
   la,16 sol la si la si dod la re4 r
   re16 dod re mi re mi fad re si4 r

   %43
   r si8 si si[si16 si si8 si]\mbreak
   fad fad si si si si dod4
   si r si'8 si la sold

   %46
   dod, dod dod dod dod dod dod4
   la r r la8 la
   dod dod dod dod lad lad lad lad

   %49
   si si si si fad' fad fad fad
   dod dod dod dod dod dod dod dod
   dod dod dod dod dod dod fad[fad]

   %52
   re re re re re re re re \mbreak
   dod sold sold sold sold sold sold sold
   la fad fad fad re' re re re

   %55
   re re16 re re8 re si si si si
   mi mi16 dod la8 la la la la4
   la r dod la

   %58
   r2 dod4 dod
   r2 sold4 si
   la8 la sold4 la mi'8 mi\mbreak

   %61
   sold, sold si sold dod8. [dod16 dod8 fad,]
   si si si sold la la la la
   la la16 la la8 la la la la4

   %64
   la8 fad' fad fad re re re re
   mi mi mi mi dod dod dod dod
   re re re re si si si si

   %67
   dod dod dod dod la la' la la
   dod dod dod dod la la la la
   dod dod dod dod fad,2

   %70
   sol\mbreak la
   la fad8 re la'[la]
   si si16 si si8 si la la la la

   %73
   la la la4 la la8 la
   si si16 si si8 si la la la4
   la la8 la la la la4

   %76
   la1\fermata

}

XIsopranoIIn = \relative do'' {

   \autoBeamOff

   R1*11
   r2 r4 la8 la
   re re16 dod si[la] sol[fad] mi8 mi mi mi

   %14
   mi' mi16 mi fad8 fad mi mi mi4
   fad re8 re mi mi mi4\mbreak
   mi la,8 la dod dod dod dod

   %17
   mi8. mi16 mi8 mi mi si si dod
   re re r re re la la16[si] dod[re]
   mi4 mi r2

   %20
   mi4 mi mi mi8 mi
   re4 re re2~
   re4 dod si2

   %23
   dod4 r r2
   mi4 mi, r2
   fad'4 fad,\mbreak r2

   %26
   sold'4 sold, r2
   la'4 la, la la
   la la8 la si4 si

   %29
   si la si2
   dod4 r r2
   R1*7

   %38
   r2 r4 si8 si
   red red red red fad8. fad16 fad8 fad
   si, si si si si si r si

   %41
   dod dod dod dod dod4 dod
   r fad8 fad fad si,16 si si8 si
   si si sol' sol dod, dod16 dod dod8 dod\mbreak

   %44
   dod dod dod dod dod dod dod4
   re re2 dod8[si]
   la2 sold

   %47
   fad'1
   mi
   re

   %50
   dod
   la
   si\mbreak

   %53
   dod2. dod4
   dod8 dod dod dod re re re re

   %55
   si si16 si si8 si mi mi mi mi
   dod dod16 dod re8 re re re dod4
   re r mi dod

   %58
   r2 mi4 dod
   r2 re4 re
   dod8 dod si4 dod la8 la\mbreak

   %61
   si si mi mi mi8. la,16 la8 re
   re sold, sold si dod dod mi mi
   fad fad16 fad fad8 fad mi mi mi4

   %64
   re re8 re re re16 re re8 re
   dod dod dod dod dod dod16 dod dod8 dod
   si si si si si si16 si si8 si

   %67
   la la dod4 re re8 re
   mi mi16 mi mi8 mi fad fad fad fad
   sol sol sol sol fad fad re re

   %70
   si16[la si dod] si[dod re si]\mbreak la8 la la la
   la16[sol la si] la[sol fad mi] fad8 fad fad' fad
   fad fad16 fad fad8 re re re dod4

   %73
   re la fad re'8 re
   re16[dod re mi] re[mi fad mi] re8 re dod4
   re re8 re re re re[dod]

   %76
   re1\fermata

}

XItestoV = \lyricmode {

    Et in sæ -- cula _ sæ -- cu -- lo -- rum et in sæ -- cula _ sæ -- cu -- lo -- rum

   a -- men a -- men  a --  men a -- men, si -- cut e -- rat in prin -- ci -- pi -- o,

   et nunc et nunc et sem -- per et nunc et nunc et sem -- per

   et in sæ -- cu -- la sæ -- cu -- lo -- rum a -- men

   a -- men a -- men a -- men a -- men

   et in sæ -- cula _ sæ -- cu -- lo -- rum  a -- men.

    Si -- cut e -- rat in prin -- ci -- pi -- o,  et nunc et nunc et sem -- per et nunc et nunc et sem -- per

    et in sæ -- cula _ sæ -- cu -- lo -- rum et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum

    a -- men a - - men.  Si -- cut e -- rat in prin -- ci -- pi -- o,

     et nunc et sem -- per et in sæ -- cula _ nunc et sem -- per et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men,

     a -- men a -- men a -- men a -- men a -- men.

     Si -- cut e -- rat in prin -- ci -- pio, _ et nunc et nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum a -- men et in sæ -- cula _ sæ -- cu -- lo -- rum

    et in sæ -- cula _ sæ -- cu -- lo -- rum et in sæ -- cu -- la sæ -- cu -- lo -- rum

    a -- men et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men a -- men

    sæ -- cu -- lo - - rum sæ -- cu -- lo - - rum et in sæ -- cula _  sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum

    sæ -- cu -- lo - - rum a - - - - men a -- men.



}

XIaltoIIn = \relative do' {

   \autoBeamOff

   R1*11
   r4 re8 re la' la16 sol fad[mi] re[dod]
   si8 si si si si' si16 la sol[fad] mi[re]

   %14
   dod4 re re(dod)
   re r r2\mbreak
   la'1

   %17
   sold
   fad
   mi

   %20
   dod
   re
   mi2. mi4

   %23
   mi r r2
   si'16[la si dod] si[la sold fad] mi4 r
   la16[sold la si] la[sold fad mi]\mbreak re4 r

   %26
   r sold8 sold si si si si
   dod8. la16 la4 r mi8 mi
   la la16 sol fad[mi] re[dod] si8 si si si

   %29
   mi8 mi16 mi mi8 mi mi mi mi4
   mi r r2
   R1*8

   %39
   r2 si'4 si,
   sol'16[fad sol la] sol[la si la] sol4 r
   dod,16[si dod re] dod[re mi dod] fad4 r

   %42
   r2 si4 si,
   r sol'8 sol mi mi16 mi mi8 mi\mbreak
   dod dod dod fad fad fad fad4

   %45
   fad r sold2
   fad~fad4 mid
   fad r r fad8 fad

   %48
   lad lad lad lad dod8. dod16 dod8 dod
   fad, fad fad fad fad fad r si
   sold sold sold sold sold4 sold

   %51
   r dod8 dod dod fad,16 fad fad8 fad
   fad fad re' re sold,8 sold16 sold sold8 sold\mbreak
   \once\set suggestAccidentals = ##t sold? sold sold sold sold sold sold4

   %54
   fad8 la la la la la la la
   sol sol16 sol sol8 sol sol sol sol sol
   sol sol16 sol fad8 fad mi mi mi4

   %57
   fad r la mi
   r2 sol4 mi
   r2 si'4 sold

   %60
   mi8 mi r4 la2\mbreak
   sold fad
   mi dod

   %63
   re re4 dod
   re dod'8 dod si si16 si si8 si
   la la la la la la16 la la8 la

   %66
   sol sol sol sol sol sol16 sol sol8 sol
   fad fad r4 fad2
   mi re

   %69
   dod r4 fad8 fad
   re16[dod re mi] re[mi fad sol]\mbreak mi8 mi mi mi
   fad16[mi fad sol] fad[mi re dod]  re8 re re re

   %72
   re  re16 re re8 re fad fad mi mi
   re16[dod re mi] re[mi fad mi] re8 re la' la
   fad16[mi fad sol] fad[sol la sol] fad8 fad mi4

   %75
   fad16[mi fad sol] fad[sol la fad]  mi8 fad fad[mi]
   fad1\fermata

}

XItestoVI = \lyricmode {

   Et in sæ -- cula _ sæ -- cu -- lo -- rum et in sæ -- cula _ sæ -- cu -- lo -- rum

   a -- men,  si -- cut e -- rat in prin -- ci -- pi -- o,  a - men a - men,

   si -- cut e -- rat in prin -- ci -- pio, _

   et in sæ -- cula _ sæ -- cu -- lo -- rum et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men

   a -- men a - men a - men a -- men

   et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men a - - men,

    si -- cut e -- rat in prin -- ci -- pio, _  et nunc et nunc et sem -- per

    et nunc et nunc et sem -- per et in sæ -- cula _ sæ -- cu -- lo -- rum

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men

    et nunc et sem -- per et in sæ -- cula _  nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum a -- men a -- men a -- men a -- men a -- men.

    Si -- cut e -- rat in prin -- ci -- pi -- o,

    et in sæ -- cula _ sæ -- cu -- lo -- rum et in sæ -- cula _ sæ -- cu -- lo -- rum

    et in sæ -- cula _ sæ -- cu -- lo -- rum a - - men  sæ -- cu -- lo - - rum

    sæ -- cu -- lo - - rum et in sæ -- cula _  sæ -- cu -- lo -- rum sæ -- cu -- lo - - rum

    sæ -- cu -- lo - - rum a - - - men a -- men.

}

XItenoreIIn = \relative do' {

   \autoBeamOff
   re1
   dod
   si

   %4
   la
   fad\mbreak
   sol

   %7
   la2. la4
   re,2 r
   mi'4 mi mi mi8 mi

   %10
   re4 re re2
   dod1
   R1*2

   %14
   la8 la la la16 la la8 la la la
   la la re4~re8 dod si4\mbreak
   dod r r2

   %17
   si4 si si si8 mi,
   la4 la la2
   sold mi'16[re mi fad] mi[re dod si]

   %20
   la4 r la la
   la la8 la si4 si
   si dod mi2

   %23
   dod4 r r2
   r mi16[re mi fad] mi[re dod si]
   la4 r\mbreak re16[dod re mi] re[dod si la]

   %26
   sold4 r r2
   r4 la8 la mi' mi16 re dod[si] la[sol]
   fad8 fad fad fad fad' fad16 mi re[dod] si[la]

   %29
   sold4 la la (sold)
   la r r2
   R1*9

   %40
   r2 mi'4 mi,
   r2 fad'4 fad,
   re'16[dod re mi] re[mi fad re] si4 r

   %43
   r si8 si si si16 si si8 si\mbreak  %% fine p. 42
   fad8 fad fad fad fad fad  fad4
   fad r si8 si la sold

   %46
   dod dod dod dod dod dod dod4
   dod r fad fad,
   lad16[sold lad si] lad[si dod si] lad4 r

   %49
   fad' fad, r2
   dod'4 dod, r2
   dod'4 dod dod fad8 fad

   %52
   re4 re re8 re re re\mbreak
   dod sold sold sold sold sold sold4
   la8 fad fad fad re' re re re

   %55
   re re16 re re8 re si si si si
   mi mi16 dod la8 la la la la4
   fad r dod' la

   %58
   r2 dod4 dod
   r2 sold4 si
   la8 la sold4 la mi'8 mi\mbreak

   %61
   sold, sold si sold dod8. dod16 dod8 fad,
   si si si sold la la la la
   la la16 la la8 la la la la4

   %64
   la r r si8 si
   mi  mi16 mi mi8 mi mi mi la, la
   re re16 re re8 re re re re re

   %67
   dod dod la4 la la8 la
   la la16 la la8 la la la la la
   dod dod r4 fad,2

   %70
   sol\mbreak la
   la r4 la8 la
   si si16 si si8 si la la la la

   %73
   la la la4 la la8 la
   si si16 si si8 si la la la4
   la la8 la la la la4

   %76
   la1\fermata

}

XItestoVII = \lyricmode {

    Si -- cut e -- rat in prin -- ci -- pi -- o,

    et in sæ -- cula _ sæ -- cu -- lo -- rum

    et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men

    a -- men  a -- men et in sæ -- cula _ sæ -- cu -- lo -- rum a - men

    et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men a - men  a - men

    et in sæ -- cula _ sæ -- cu -- lo -- rum

    et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men a -- men a -- men a - men

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men

    sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men a -- men a -- men a - men a -- men a -- men

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men

    et nunc et sem -- per et in sæ -- cula _  nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum a -- men a -- men a -- men a -- men a -- men a -- men.

    Si -- cut e -- rat in prin -- ci -- pio, _ et nunc et nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum a -- men et in sæ -- cula _ sæ -- cu -- lo -- rum

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum  a -  - men

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum  a -- men

    et in sæ -- cula _ sæ -- cu -- lo -- rum a -- men sæ -- cu -- lo -- rum  a -- men.

}

XIbassoIIn = \relative do {

   \autoBeamOff

   R1*8
   r2 la'4 la,
   r2 si'4 si,

   %11
   r2 dod'4 dod,
   r2 re'4 re,
   r4 sol8 sol sol sol16 sol sol8 sol

   %14
   la4 re, la' la,
   re4 re8 fad mi la mi4\mbreak
   la,4 r r2

   %17
   r4 mi'8 mi mi mi mi mi
   fad fad16 fad fad8 fad fad fad fad fad
   sold8. sold16 sold8 sold sold sold sold sold

   %20
   la la la la dod dod16 si la[sol?] fad[mi]
   fad8 re re re re' re16 dod si[la] sold[fad]
   mi4 la, mi' mi

   %23
   la1
   sold
   fad

   %26
   mi
   dod
   re

   %29
   mi2. mi4
   la, r r2
   R1*7

   %38
   si'1
   la
   sol

   %41
   fad
   re
   mi\mbreak

   %44
   fad2. fad4
   si, r mid8 mid mid mid
   fad fad fad fad dod dod dod4

   %47
   fad r r2
   fad16 [\once\set suggestAccidentals = ##t mid fad sold] fad[ sold lad sold] fad4 r

   %49
   si,16 [lad si dod] si [dod re dod] si4 r
   dod16 [si dod re] dod [red mid red] dod4 r
   fad16 [mid fad sold] fad [sold la sold] fad4 r

   %52
   si,16[ la si dod] si [dod re dod] si4 r\mbreak
   dod8 dod dod dod dod dod dod4
   fad8 fad fad fad fad fad fad fad

   %55
   sol sol16 sol sol8 sol sol sol sol sol
   la la16 la re,8 re la' la la[la,]
   re4  r la' la,

   %58
   r2 la'4 la,
   r2 mi'4 mi
   la,8 la mi'4 la, la8 la\mbreak

   %61
   mi'8 mi mi mi fad8. fad16 fad8 fad
   sold sold sold mi la la la la
   re, re16 re re8 re la' la la [la,]

   %64
   re4 r r sol8 sol
   dod,8 dod16 dod dod8 dod fad fad fad fad
   si, si16 si si8 si mi mi mi mi

   %67
   la, la  la la re16[dod re mi] re[mi fad re]
   la'4 r re,16[dod re mi] re[mi fad re]
   la'[sol la si] la[sol fad mi] re[dod re mi] re[mi fad re]

   %70
   sol4 sol8 sol\mbreak sol sol16 sol sol8 sol
   fad fad r4 fad2
   sol la

   %73
   re, fad
   sol  la
   re,16[dod re mi] re[mi fad re] la'8 re, la'[la,]

   %76
   re1\fermata

}

XItestoVIII = \lyricmode {

    A -- men  a -- men a -- men a -- men et in sæ -- cula _ sæ -- cu -- lo -- rum

    a - men a -- men a -- men a -- men.

    Si -- cut e -- rat in prin -- ci -- pio, _ si -- cut e -- rat in prin -- ci -- pio, _

    et nunc et nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum  et in sæ -- cula _ sæ -- cu -- lo -- rum

    a -- men. Si -- cut e -- rat in prin -- ci -- pi -- o.  Si -- cut e -- rat in prin -- ci -- pi -- o,

     sæ -- cu -- lo -- rum  sæ -- cu -- lo -- rum a -- men  a -- men a - men  a - men  a - men  a - men  a - men

    sæ -- cu -- lo -- rum a -- men a -- men

    et nunc et sem -- per et in sæ -- cula _  nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum a -- men a -- men a -- men a -- men a -- men a -- men.

    Si -- cut e -- rat in prin -- ci -- pio, _ et nunc et nunc et sem -- per et in sæ -- cula _

    sæ -- cu -- lo -- rum a -- men et in sæ -- cula _ sæ -- cu -- lo -- rum

    et in sæ -- cula _ sæ -- cu -- lo -- rum sæ -- cu -- lo -- rum a -- men

    a - men a - - - - - men et in sæ -- cula _ sæ -- cu -- lo -- rum a - - men a - - - - - men  a -- men.

}

XIbcIIn = \relative do {

   re8 re' re re r re re re
   r dod dod dod r dod dod dod
   r si si si r si si si

   %4
   r la la la r la la la
   r fad fad fad r fad fad fad\mbreak
   r sol sol sol r sol sol sol

   %7
   r la la la r la la la
   re, re' re re r re re re
   r dod dod dod r dod dod dod

   %10
   r si si si r si si si
   r la la la r la la la
   r fad fad fad r fad fad fad

   %13
   r sol sol sol r sol sol sol
   r la re, re la' la, la la
   re re re  fad mi la, mi'[mi,]\mbreak

   %16
   la la la la r la la la
   r mi' mi mi r mi mi mi
   r fad fad fad r fad fad fad

   %19
   r sold sold sold r sold sold sold
   r la la la r la, la la
   r re re re r re re re

   %22
   r mi la, la mi' mi mi, mi
   la la' la la r la la la
   r sold sold sold r sold sold sold

   %25
   r fad fad fad\mbreak r fad fad fad
   r mi mi mi r mi mi mi
   r dod dod dod r dod dod dod

   %28
   r re re re r re re re
   r mi mi mi r mi, mi mi
   la4 la8 la dod dod dod dod

   %31
   mi8. [mi16 mi8 mi] mi si si dod
   re re r re re[la la16 si dod re]
   mi4 r mi16 re mi fad mi re dod si\mbreak

   %34
   la4 la'8 la dod[dod16 si la sol fad mi]
   re8 re re re re'[re16 dod si la sold fad]
   mi8 mi, la'[la,] re re, mi'[sol]

   %37
   lad, lad' si si, fad' mi fad fad,
   si si' si si r si si si
   r la la la r la la la

   %40
   r sol sol sol r sol sol sol
   r fad fad fad r fad fad fad
   r re re re r re re re

   %43
   r mi mi mi r mi mi mi\mbreak
   r fad fad fad r fad fad fad
   si,4 r mid8 mid mid mid

   %46
   fad fad fad fad dod dod dod, dod
   fad4 r r2
   fad'16 \once\set suggestAccidentals = ##t mid?fad sold fad sold lad sold fad4 r

   %49
   si,16 lad si dod si dod re dod si4 r
   dod16 si dod re dod red mid red dod4 r
   fad16 mid fad sold fad sold la sold fad4 r

   %52
   si,16 la si dod si dod re dod si4 r\mbreak
   dod8 dod dod dod dod dod dod, dod
   fad fad' fad fad fad fad fad fad

   %55
   sol sol sol sol sol sol sol sol
   la la re, re la' la la, la
   re4 r la' la,

   %58
   r2 la'4 la,
   r2 mi'4 mi,
   la8 la' mi[mi,] la4 la8 la\mbreak

   %61
   mi'8 mi mi mi fad8.[fad16 fad8 fad]
   sold sold sold mi la la la la,
   re re re re la' la la la,

   %64
   re re re re sol sol sol sol
   dod, dod dod dod fad fad fad fad
   si, si si si mi mi mi mi

   %67
   la, la la la la2\tasto ~
   la1~
   la~

   %70
   la~
   la~
   la~

   %73
   la~
   la
   re16 dod re mi re mi fad re la'8 re, la' la,

   %76
   re,1\fermata

}

XIbfIIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1*2
   s8 <7> s4 s8 <6> s4
   s8 <7> s4 s2
   s1*2
   s4 <6 4> s <5 3>
   s1*5
   s2 s4 <6>
   s2 <6 4>4 <5 3>
   s2 <7 _+>4 <5 4>8 <3+>
   s1
   s8 <_+> s4 s2
   s8 <6> s4 s2
   s8 <6> s4 s2
   s1*2
   s8 <_+> s4 <5 4> <3+>
   s1*3
   s8 <_+> s4 s2
   s1*2
   s8 <7 _+> s4 s8 <5 4> <3+>4
   s1
   <_+>
   s
   <_+>
   s1*2
   <7 _+>2 <6 5>4 <3!>
   <6 5>2 <5 4>4 <3+>
   s1
   <6 4+>4 s4 s2
   s4 <6> s2
   s8 <5 4> s4 s2
   s1
   s8 <5> s4 s8 <6 5> s4
   s8 <5 4> s4 s4 <3+>
   s2 <7>
   s <5 4>4 <3+>
   s1
   <7 _+>
   s
   <5 4>2 <3+>
   s1
   s2 <6 4+>
   <5 4>2 s4 <3+>
   s2 <6>
   s <6>
   <7> <5 4>4 <3>
   s1
   s2 <7>
   s <7 _+>
   s4 <_+> s2
   s2 <7>4 s8 <6>
   <6 5>1
   s2 <5 4>4 <3>
   s1
   <7>
   <7>
   <7>
   s1*7
   s2 s4 <6 4>8 <5 3>

}


forma = {

   \time 4/4
   \key re\major
   \tempo 2 = 57
   s1*76
   \bar "|."

}

XIvlI = {
   %\notypeset
   <<\XIvlIn \forma>>

}

XIvlII = {
   <<\XIvlIIn \forma>>

}

XIvlaI = {
   \clef alto
   <<\XIvlaIn \forma>>

}

XIsopranoI = {
   \new Voice = "sicut1"
   <<\XIsopranoIn \forma>>
}

XIaltoI = {
   \new Voice = "sicut2"
   <<\XIaltoIn \forma>>
}

XItenoreI = {
   \new Voice = "sicut3"
   <<\XItenoreIn \forma>>
}

XIbassoI = {
   \clef bass
   \new Voice = "sicut4"
   <<\XIbassoIn \forma>>
}



XIbcI = {
   \clef bass
   <<\XIbcIn \forma \XIbfIn>>
   \typeset
}

XIvlIII = {
   <<\XIvlIIIn \forma>>

}

XIvlIV = {
   <<\XIvlIVn \forma>>

}

XIvlaII = {
   \clef alto
   <<\XIvlaIIn \forma>>

}

XIsopranoII= {
   \new Voice = "sicut5"
   <<\XIsopranoIIn \forma>>
}

XIaltoII= {
   \new Voice = "sicut6"
   <<\XIaltoIIn \forma>>
}

XItenoreII = {
   \new Voice = "sicut7"
   <<\XItenoreIIn \forma>>
}

XIbassoII = {
   \clef bass
   \new Voice = "sicut8"
   <<\XIbassoIIn \forma>>
}



XIbcII = {
   \clef bass
   <<\XIbcIIn \forma \XIbfIIn>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 16)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \con

}

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #1

    }

    \header {
        title = \markup "Dixit in due Cori [RV 594]"
        composer = \markup {"A. Vivaldi (1678-1741)"}
    }

    \markup \huge {[1.] Dixit Dominus - All[egr]o}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Tromba [I]"\vspace #-0.3"Hautbois  [I]"}
                    \set Staff.shortInstrumentName = "tp/hb1"
                    \ItpI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Tromba [II]"\vspace #-0.3"Hautbois  [II]"}
                    \set Staff.shortInstrumentName = "tp/hb2"
                    \ItpII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{Violino [I]}
                    \set Staff.shortInstrumentName = "vlI"
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                    \set Staff.shortInstrumentName = "vlII"
                    \IvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                    \set Staff.shortInstrumentName = "vlaI"
                    \IvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \IsopranoI \global
                    \new Lyrics \lyricsto "dixit1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt1"
                    \IaltoI \global
                    \new Lyrics \lyricsto "dixit2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                    \clef  "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten1"
                    \ItenoreI \global
                    \new Lyrics \lyricsto "dixit3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \IbassoI \global
                    \new Lyrics \lyricsto "dixit4" \ItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "bc1"
                    \IbcI \global
                >>
             >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "2.do Coro"} "[Violino III]"}
                    \set Staff.shortInstrumentName = "vlIII"
                    \IvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino IV]"}
                    \set Staff.shortInstrumentName = "vlIV"
                    \IvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola II]"}
                    \set Staff.shortInstrumentName = "vlaII"
                    \IvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \IsopranoII \global
                    \new Lyrics \lyricsto "dixit5" \ItestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt2"
                    \IaltoII \global
                    \new Lyrics \lyricsto "dixit6" \ItestoVI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten2"
                    \ItenoreII \global
                    \new Lyrics \lyricsto "dixit7" \ItestoVII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \IbassoII \global
                    \new Lyrics \lyricsto "dixit8" \ItestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \IbcII \global
                >>
            >>
        >>

        \layout {

            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[2.] Donec ponam - Largo}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Violino [I]"}
                    \set Staff.shortInstrumentName = "vlI"
                    \IIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                    \set Staff.shortInstrumentName = "vlII"
                    \IIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                    \set Staff.shortInstrumentName = "vlaI"
                    \IIvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \IIsopranoI \global
                    \new Lyrics \lyricsto "donec1" \IItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt1"
                    \IIaltoI \global
                    \new Lyrics \lyricsto "donec2" \IItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten1"
                    \IItenoreI \global
                    \new Lyrics \lyricsto "donec3" \IItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \IIbassoI \global
                    \new Lyrics \lyricsto "donec4" \IItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "bc1"
                    \IIbcI \global
                >>
            >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "2.do Coro"} "[Violino III]"}
                    \set Staff.shortInstrumentName = "vlIII"
                    \IIvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino IV]"}
                    \set Staff.shortInstrumentName = "vlIV"
                    \IIvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola II]"}
                    \set Staff.shortInstrumentName = "vlaII"
                    \IIvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \IIsopranoII \global
                    \new Lyrics \lyricsto "donec5" \IItestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt2"
                    \IIaltoII \global
                    \new Lyrics \lyricsto "donec6" \IItestoVI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten2"
                    \IItenoreII \global
                    \new Lyrics \lyricsto "donec7" \IItestoVII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \IIbassoII \global
                    \new Lyrics \lyricsto "donec8" \IItestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \IIbcII \global
                >>
            >>

        >>

        \layout {
            #(layout-set-staff-size 16.5)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] Virgam virtutis - All[egr]o}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Violino [I]" }
                    \set Staff.shortInstrumentName = "vlI"
                    \IIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                    \set Staff.shortInstrumentName = "vlII"
                    \IIIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                    \set Staff.shortInstrumentName = "vlaI"
                    \IIIvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r8^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \IIIsopranoI \global
                    \new Lyrics \lyricsto "virgam1" \IIItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "bc1"
                    \IIIbcI \global
                >>
            >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "2.do Coro"} "[Violino III]"}
                    \set Staff.shortInstrumentName = "vlIII"
                    \IIIvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino IV]"}
                    \set Staff.shortInstrumentName = "vlIV"
                    \IIIvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola II]"}
                    \set Staff.shortInstrumentName = "vlaII"
                    \IIIvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r8^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \IIIsopranoII \global
                    \new Lyrics \lyricsto "virgam5" \IIItestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \IIIbcII \global
                >>
            >>
        >>

        \layout {

            #(layout-set-staff-size 15.5)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #4

    }

    \markup \huge {[4.] Tecum principium - And[ant]e}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Violino [I]"}
                \set Staff.shortInstrumentName = "vlI"
                \IVvlI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                \set Staff.shortInstrumentName = "vlII"
                \IVvlII\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                \set Staff.shortInstrumentName = "vlaI"
                \IVvlaI\global
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key mi\minor \once\override Staff.TimeSignature.transparent = ##t  \time 3/4 r2.^\markup\center-align "[Alto]"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "alt1"
                \IValtoI \global
                \new Lyrics \lyricsto "tecum2" \IVtestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc1"
                \IVbcI \global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #1

    }

    \markup \huge {[5.] Juravit Dominus - Ad[agi]o}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Violino [I]"}
                    \set Staff.shortInstrumentName = "vlI"
                    \VvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                    \set Staff.shortInstrumentName = "vlII"
                    \VvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                    \set Staff.shortInstrumentName = "vlaI"
                    \VvlaI\global
                >>

            \new Staff  <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef soprano \key do\major \time 4/4 do'2^\markup\center-align "[Canto]"}
               \clef violin
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "sop1"
               \VsopranoI \global
               \new Lyrics \lyricsto "juravit1" \VtestoI
            >>

            \new Staff <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef alto \key do\major \time 4/4 sol2^\markup\center-align "[Alto]"}
               \clef violin
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "alt1"
               \ValtoI \global
               \new Lyrics \lyricsto "juravit2" \VtestoII
            >>

            \new Staff <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef tenor \key do\major \time 4/4 mi2^\markup\center-align"[Tenore]"}
               \clef  "treble_8"
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "ten1"
               \VtenoreI \global
               \new Lyrics \lyricsto "juravit3" \VtestoIII
            >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \VbassoI \global
                \new Lyrics \lyricsto "juravit4" \VtestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "bc1"
                    \VbcI \global
                >>
            >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "2.do Coro"} "[Violino III]"}
                    \set Staff.shortInstrumentName = "vlIII"
                    \VvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino IV]"}
                    \set Staff.shortInstrumentName = "vlIV"
                    \VvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola II]"}
                    \set Staff.shortInstrumentName = "vlaII"
                    \VvlaII\global
                >>

            \new Staff  <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef soprano \key do\major \time 4/4 r1^\markup\center-align "[Canto]"}
               \clef violin
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "sop2"
               \VsopranoII \global
               \new Lyrics \lyricsto "juravit5" \VtestoV
            >>

            \new Staff <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef alto \key do\major \time 4/4 r1^\markup\center-align "[Alto]"}
               \clef violin
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "alt2"
               \ValtoII \global
               \new Lyrics \lyricsto "juravit6" \VtestoVI
            >>

            \new Staff <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef tenor \key do\major \time 4/4 r1^\markup\center-align"[Tenore]"}
               \clef "treble_8"
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "ten2"
               \VtenoreII \global
               \new Lyrics \lyricsto "juravit7" \VtestoVII
            >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \VbassoII \global
                    \new Lyrics \lyricsto "juravit8" \VtestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \VbcII \global
                >>
            >>
        >>

        \layout {
            #(layout-set-staff-size 16.5)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #3

    }

    \markup \huge {[7.] Dominus a dextris tuis - All[egr]o}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Violino [I]"}
                \set Staff.shortInstrumentName = "vlI"
                \VIvlI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                \set Staff.shortInstrumentName = "vlII"
                \VIvlII\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                \set Staff.shortInstrumentName = "vlaI"
                \VIvlaI\global
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major  \time 4/4 r1^\markup\center-align "[Tenore]"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "ten1"
                \VItenoreI \global
                \new Lyrics \lyricsto "dextris1" \VItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "bas1"
                \VIbassoI \global
                \new Lyrics \lyricsto "dextris2" \VItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc1"
                \VIbcI \global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.6
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #1

    }

    \markup \huge {[8.] Judicabit in nationibus - Largo}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Tromba [I]"\vspace #-0.3"Hautbois  [I]"}
                    \set Staff.shortInstrumentName = "tp1/hb1"
                    \VIIobI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Hautbois  [II]"}
                    \set Staff.shortInstrumentName = "hb2"
                    \VIIobII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{Violino [I]}
                    \set Staff.shortInstrumentName = "vlI"
                    \VIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                    \set Staff.shortInstrumentName = "vlII"
                    \VIIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                    \set Staff.shortInstrumentName = "vlaI"
                    \VIIvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \once\override Staff.TimeSignature.transparent = ##t  \time 3/4 r2.^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \VIIsopranoI \global
                    \new Lyrics \lyricsto "judicabit1" \VIItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \once\override Staff.TimeSignature.transparent = ##t  \time 3/4 r2.^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt1"
                    \VIIaltoI \global
                    \new Lyrics \lyricsto "judicabit2" \VIItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \once\override Staff.TimeSignature.transparent = ##t  \time 3/4 r2.^\markup\center-align"[Tenore]"}
                    \clef  "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten1"
                    \VIItenoreI \global
                    \new Lyrics \lyricsto "judicabit3" \VIItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \VIIbassoI \global
                    \new Lyrics \lyricsto "judicabit4" \VIItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "bc1"
                    \VIIbcI \global
                >>
             >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "2.do Coro"} "Tromba [II]"}
                    \set Staff.shortInstrumentName = "tp2"
                    \VIItp\global
                >>

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino III]"}
                    \set Staff.shortInstrumentName = "vlIII"
                    \VIIvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino IV]"}
                    \set Staff.shortInstrumentName = "vlIV"
                    \VIIvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola II]"}
                    \set Staff.shortInstrumentName = "vlaII"
                    \VIIvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \once\override Staff.TimeSignature.transparent = ##t  \time 3/4 r2.^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \VIIsopranoII \global
                    \new Lyrics \lyricsto "judicabit5" \VIItestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \once\override Staff.TimeSignature.transparent = ##t  \time 3/4 r2.^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt2"
                    \VIIaltoII \global
                    \new Lyrics \lyricsto "judicabit6" \VIItestoVI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \once\override Staff.TimeSignature.transparent = ##t  \time 3/4 r2.^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten2"
                    \VIItenoreII \global
                    \new Lyrics \lyricsto "judicabit7" \VIItestoVII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \VIIbassoII \global
                    \new Lyrics \lyricsto "judicabit8" \VIItestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \VIIbcII \global
                >>
            >>
        >>

        \layout {
            #(layout-set-staff-size 16)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[9.] Implebit ruinas - All[egr]o molto}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Violino [I]"}
                    \set Staff.shortInstrumentName = "vlI"
                    \VIIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                    \set Staff.shortInstrumentName = "vlII"
                    \VIIIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                    \set Staff.shortInstrumentName = "vlaI"
                    \VIIIvlaI\global
                >>

            \new Staff  <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef soprano \key re\major \time 4/4 dod''8^\markup\center-align "[Canto]" }
               \clef violin
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "sop1"
               \VIIIsopranoI \global
               \new Lyrics \lyricsto "implebit1" \VIIItestoI
            >>

            \new Staff <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef alto \key re\major \time 4/4 mi'8^\markup\center-align "[Alto]"}
               \clef violin
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "alt1"
               \VIIIaltoI \global
               \new Lyrics \lyricsto "implebit2" \VIIItestoII
            >>

            \new Staff <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef tenor \key re\major \time 4/4 la8^\markup\center-align"[Tenore]"}
               \clef  "treble_8"
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "ten1"
               \VIIItenoreI \global
               \new Lyrics \lyricsto "implebit3" \VIIItestoIII
            >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \VIIIbassoI \global
                \new Lyrics \lyricsto "implebit4" \VIIItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "bc1"
                    \VIIIbcI \global
                >>
            >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "2.do Coro"} "[Violino III]"}
                    \set Staff.shortInstrumentName = "vlIII"
                    \VIIIvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino IV]"}
                    \set Staff.shortInstrumentName = "vlIV"
                    \VIIIvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola II]"}
                    \set Staff.shortInstrumentName = "vlaII"
                    \VIIIvlaII\global
                >>

            \new Staff  <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef soprano \key re\major \time 4/4 r8^\markup\center-align "[Canto]"}
               \clef violin
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "sop2"
               \VIIIsopranoII \global
               \new Lyrics \lyricsto "implebit5" \VIIItestoV
            >>

            \new Staff <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef alto \key re\major \time 4/4 r8^\markup\center-align "[Alto]"}
               \clef violin
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "alt2"
               \VIIIaltoII \global
               \new Lyrics \lyricsto "implebit6" \VIIItestoVI
            >>

            \new Staff <<
               \set Staff.instrumentName = \markup \center-column{""}
               \incipit { \clef tenor \key re\major \time 4/4 r8^\markup\center-align"[Tenore]"}
               \clef "treble_8"
               \set Staff.midiInstrument = #"synth voice"
               \set Staff.shortInstrumentName = "ten2"
               \VIIItenoreII \global
               \new Lyrics \lyricsto "implebit7" \VIIItestoVII
            >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \VIIIbassoII \global
                    \new Lyrics \lyricsto "implebit8" \VIIItestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \VIIIbcII \global
                >>
            >>
        >>

        \layout {
            #(layout-set-staff-size 16.5)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #4

    }

    \markup \huge {[10.] De torrente - And[ant]e}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Violino [I]"}
                \set Staff.shortInstrumentName = "vlI"
                \IXvlI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                \set Staff.shortInstrumentName = "vlII"
                \IXvlII\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                \set Staff.shortInstrumentName = "vlaI"
                \IXvlaI\global
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key mi\minor \time 4/4 r1^\markup\center-align "[Canto]"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "sop1"
                \IXsopranoI \global
                \new Lyrics \lyricsto "torrente" \IXtestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc1"
                \IXbcI \global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #1

    }

    \markup \huge {[11.] Gloria Patri - All[egr]o}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Tromba [I]"\vspace #-0.3"Hautbois  [I]"}
                    \set Staff.shortInstrumentName = "tp/hb1"
                    \XtpI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Tromba [II]"\vspace #-0.3"Hautbois  [II]"}
                    \set Staff.shortInstrumentName = "tp/hb2"
                    \XtpII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{Violino [I]}
                    \set Staff.shortInstrumentName = "vlI"
                    \XvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                    \set Staff.shortInstrumentName = "vlII"
                    \XvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                    \set Staff.shortInstrumentName = "vlaI"
                    \XvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \XsopranoI \global
                    \new Lyrics \lyricsto "gloria1" \XtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt1"
                    \XaltoI \global
                    \new Lyrics \lyricsto "gloria2" \XtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                    \clef  "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten1"
                    \XtenoreI \global
                    \new Lyrics \lyricsto "gloria3" \XtestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \XbassoI \global
                    \new Lyrics \lyricsto "gloria4" \XtestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "bc1"
                    \XbcI \global
                >>
             >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "2.do Coro"} "[Violino III]"}
                    \set Staff.shortInstrumentName = "vlIII"
                    \XvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino IV]"}
                    \set Staff.shortInstrumentName = "vlIV"
                    \XvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola II]"}
                    \set Staff.shortInstrumentName = "vlaII"
                    \XvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \XsopranoII \global
                    \new Lyrics \lyricsto "gloria5" \XtestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt2"
                    \XaltoII \global
                    \new Lyrics \lyricsto "gloria6" \XtestoVI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten2"
                    \XtenoreII \global
                    \new Lyrics \lyricsto "gloria7" \XtestoVII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \XbassoII \global
                    \new Lyrics \lyricsto "gloria8" \XtestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \XbcII \global
                >>
            >>
        >>

        \layout {

            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[12.] Sicut erat in principio - All[egr]o}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "P.mo Coro"} "Violino [I]"}
                    \set Staff.shortInstrumentName = "vlI"
                    \XIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino  [II]"}
                    \set Staff.shortInstrumentName = "vlII"
                    \XIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                    \set Staff.shortInstrumentName = "vlaI"
                    \XIvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \XIsopranoI \global
                    \new Lyrics \lyricsto "sicut1" \XItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt1"
                    \XIaltoI \global
                    \new Lyrics \lyricsto "sicut2" \XItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten1"
                    \XItenoreI \global
                    \new Lyrics \lyricsto "sicut3" \XItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \XIbassoI \global
                    \new Lyrics \lyricsto "sicut4" \XItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Organi""[Basso]"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "bc1"
                    \XIbcI \global
                >>
            >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{{\bold\huge "2.do Coro"} "[Violino III]"}
                    \set Staff.shortInstrumentName = "vlIII"
                    \XIvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino IV]"}
                    \set Staff.shortInstrumentName = "vlIV"
                    \XIvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola II]"}
                    \set Staff.shortInstrumentName = "vlaII"
                    \XIvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \XIsopranoII \global
                    \new Lyrics \lyricsto "sicut5" \XItestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt2"
                    \XIaltoII \global
                    \new Lyrics \lyricsto "sicut6" \XItestoVI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten2"
                    \XItenoreII \global
                    \new Lyrics \lyricsto "sicut7" \XItestoVII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \XIbassoII \global
                    \new Lyrics \lyricsto "sicut8" \XItestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \XIbcII \global
                >>
            >>

        >>

        \layout {
            #(layout-set-staff-size 16.5)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

