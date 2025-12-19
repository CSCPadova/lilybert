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


Itbn = \relative do'' {

    r4
    r8 r16 fad fad4 r8 r16 fad fad4
    fad r fad r
    re r la' r

    %4
    mi r fad r
    re8 re16 re re8 re re re16 re re8 re\mbreak
    re4 r mi r

    %7
    mi r mi r
    mi r mi r
    la r la r

    %10
    la r mi r
    mi r mi r \mbreak
    mi r mi r

    %13
    fad r mi r
    mi r mi8 mi16 mi mi8 mi
    fad la16 la la8 la la8 la16 la la8 la

    %16
    la4 r r8 re, mi la,
    r8 la16 la la8 la la4 r\mbreak
    fad'4 r fad r

    %19
    fad r fad r
    fad r fad r
    re r re r

    %22
    fad la re, fad\mbreak
    re re mi fad
    la la la la

    %25
    mi r8 mi mi4 la,
    la r r2\fermata
    R2.*18

}


Ifln = \relative do'' {

    r4
    r8 r16 la' la4 r8 r16 re re4
    la4 r la r
    si r dod r

    %4
    dod r la r
    si la sol8 si la4\mbreak
    si8[la] mi la dod,4 r

    %7
    dod' r dod r
    dod r dod r
    dod r dod r

    %10
    dod r dod r
    dod r dod r\mbreak
    dod r dod r

    %13
    la r sold r
    sold r dod r
    la r la r

    %16
    la r si r
    dod dod la r\mbreak
    la r la r

    %19
    la r la r
    la r la r
    si r si r

    %22
    la mi sol la\mbreak
    re, re sol la
    dod dod dod dod

    %25
    dod r8 dod, dod4 dod
    dod r r2\fermata
    R2.

    %28
    r4 si'8 la si la
    si4 mi, r\mbreak
    r4 la8 sol la sol

    %31
    la4 re, r
    r la' la
    la la la

    %34
    la8 fad sol4 r8 r16 sol
    fad8 mi fad4 r8 r16 fad
    sold4 sold sold

    %37
    fad fad fad
    sold la la\mbreak
    la mi la

    %40
    la re, re
    mi fad re
    re8 mi fa4 r8 r16 re

    %43
    la'4 mi r
    R2.

}


IvlIn = \relative do'' {

    r8 r16 la'\tu
    la4 r8 r16 re re4 r8 r16 la
    la re dod re  la re dod re la re dod re la re dod re
    re, re' dod re re, si' la si mi, la sold la mi la sold la

    %4
    mi la sold la mi la sold la la,8 fad' re fad
    r16 re' dod re la re dod re si8 si, re[fad]\mbreak
    r16 re mi fad sol la fad sol mi [dod re mi fad sold la si]

    %7
    dod mi, fad sold la, si dod re mi dod si la sold fad mi re
    dod4 r mi' r
    mi,16[dod re mi fad sold la si] dod[mi, fad sold la si dod re]

    %10
    mi[dod re mi fad sold la si] dod4 r8 r16 mi,
    mi4 r8 r16 la la4 r8 r16 mi\mbreak
    mi la sold la mi la sold la mi la sold la mi la sold la

    %13
    la,la' sold la la, fad' mi fad si, mi red mi si mi red mi
    si mi red mi si mi red mi mi,8 dod' mi dod
    r16 la' sold la mi la sold la fad8 fad, la dod

    %16
    r16 la dod la re mi dod re si re mi fad sol la fad sol
    mi mi fad sol la si sol la fad[fad, sol la si dod re mi]\mbreak
    fad[re mi fad sol la si dod] re[fad, mi re dod si la sol]

    %19
    fad4 r la r8 r16 la'
    la re dod re la re dod re la re dod re la re dod re
    re,8 do re do re do re16 mi re mi

    %22
    fad la la la la, la' la la sol sol sol sol fad fad fad fad\mbreak
    re' re, re re re' re, re re dod dod dod dod la' la, la la
    la la la la dod dod dod dod mi mi mi mi la la la la

    %25
    dod8 la mi dod la4 mi
    mi r r2\fermata
    mi'4 fad r8 r16 fad,\p

    %28
    fad4 si, r
    si''\f si, r8 r16 si\p \mbreak
    mi,4 re r

    %31
    la''\f la, r8 r16 la\p
    sold4 la la
    fad fad fad

    %34
    mi8 red mi4 r8 r16 si'\f
    dod8 lad' si4 r8 r16 si,\p
    si8 si si si si si

    %37
    lad[lad] la la la la
    sold[sold] sol sol sol sol\mbreak
    fad fad sold[sold] la la

    %40
    la[la] sol! sol sol sol
    sol [sol] fad fad fad fad
    fa4 fa r8 r16 fa

    %43
    fa?4 mi mi
    mi r r

}

IvlIIn = \relative do'' {

    r4
    fad r fad r
    fad8 sol la sol fad sol la fad
    sol mi re mi dod re mi re

    %4
    dod re mi dod r16 re' dod re la re dod re
    si8 si, re[fad] r16 re' dod re la re dod re\mbreak
    si8 re dod re dod16[la, si dod re mi fad sold]

    %7
    la[dod, re mi fad sold la si]dod[mi, re dod si la sold fad]
    mi4 r dod' r
    dod,16[la si dod re mi fad sol] la[dod, re mi fad sold la si]

    %10
    dod[la si dod re mi fad sold] la4 r
    dod, r dod r\mbreak
    dod8 re mi re dod re mi dod

    %13
    fad[mi re dod16 re] sold,8 la si la
    sold la si sold dod16 la' sold la mi la sold la
    fad8 re la' dod, la16 re fad sol la si sol la

    %16
    fad8 la, sol la si dod16 re dod8 re
    dod16 mi re mi mi,8 mi' re16[re, mi fad sol la si dod]\mbreak
    re[fad, sol la si dod re mi] fad[re dod si la sol fad mi]

    %19
    re4 r fad r
    fad'8 sol la sol fad sol la fad
    r16 sol fad sol re sol fad sol re sol fad sol re sol fad sol

    %22
    la, fad' fad fad mi mi mi mi re re re re dod dod dod dod\mbreak
    si si si si la la la la sol sol sol sol fad fad fad fad
    mi mi mi mi la la la la dod dod dod dod mi mi mi mi

    %25
    la8 mi dod la mi4 dod
    dod r r2\fermata
    dod'4 dod r8 r16 dod,\p
    red4 mi r

    %29
    mi'\f mi r8 r16 mi,\p\mbreak
    dod4 la' r
    re\f re r8 r16 re\p

    %32
    re4 do do
    do do do
    do8 la sol4 r8 r16 mi'\f

    %35
    fad8 sol fad4 r8 r16 fad,\p
    mid8 mid mid mid mid mid
    fad fad fad fad fad fad

    %38
    mi? mi mi mi mi mi\mbreak
    re[re] mi mi mi mi
    re re re re re re

    %41
    dod[dod] re re re re
    re4 re r8 r16 re
    re4 dod dod

    %44
    dod r r

}

Ivlan = \relative do' {

    r4
    re r re r
    la'8 mi re mi la mi re re
    si' la fad[si] la re, r si'

    %4
    dod si la mi fad la la,[la']
    sol8. sol16 la8 fad re8. sol16 la8 fad\mbreak
    re la' sol la la8. sol16 fad8 re

    %7
    mi la fad mi16 re la'8 dod, re8. re16
    la'[dod, re mi fad sold la si] dod[la sold fad mi re dod si]
    dod4 r mi r

    %10
    mi r mi r
    la r la r\mbreak
    mi8 si' la si mi, si' la mi

    %13
    re si' la si si la sold la
    si la sold si dod, mi la[mi]
    re fad mi[mi] re re mi[mi]

    %16
    re mi re fad re la' sol la
    la4 mi fad r\mbreak
    la r la r

    %19
    r16 fad,[sol la si dod re mi] fad[re' dod si la sol fad mi]
    la8 mi re mi fad mi re la'
    si la sol la si la sol si

    %22
    la16 la la la dod dod, dod dod re re re re la' la, la la\mbreak
    si si si si fad' fad fad fad sol sol, sol sol re' re re re
    dod dod dod dod mi mi mi mi la la la la dod dod dod dod

    %25
    mi8 dod la mi dod4 la
    la r r2\fermata
    la'4 fad r8 r16 la,\p

    %28
    si4 si r
    mi\f sol r8 r16 sol,\p\mbreak
    la4 la r

    %31
    re\f fa r8 r16 re\p
    si4 mi mi
    red red red

    %34
    mi si r8 r16 si'\f
    lad8 dod, re4 r8 r16 si\p
    sold'8 sold sold dod, dod dod

    %37
    dod[dod] red red red red
    si[si] dod dod dod dod\mbreak
    la la si[si] dod dod

    %40
    re re re si si si
    mi[mi] la, la la la
    si4 si r8 r16 si

    %43
    la4 mi' la,
    la r r

}

Ivcn = \relative do {

    r4
    re r re r
    re8 mi fad  mi re mi fad re
    sol la si sol la si dod si

    %4
    la si dod la re re, fad [re]
    sol, sol' fad re sol, sol' fad re\mbreak
    sol fad mi re la'4 la,8. la'16

    %7
    la4 la,8. la'16 la8 la, la la'
    la16[la, si dod re mi fad sold] la[dod si la sold fad mi re]
    la'4 r la r

    %10
    la r la r
    la r la r\mbreak
    la8 si dod si la si dod la

    %13
    re, mi fad re mi fad sold fad
    mi fad sold mi la, la' dod la
    re, re' dod la re, re' dod la

    %16
    re dod si la sol fad mi re
    la la' dod la re4 r\mbreak
    re, r re r

    %19
    r16 re[mi fad sol la si dod] re[fad mi re dod si la sol]
    fad8 mi fad mi re mi fad re
    sol la si la sol la si sol

    %22
    re16 re' re re dod8 r16 dod si si si si la8 r16 la
    sol sol sol sol fad fad fad fad mi mi mi mi re re re re
    la la' la la la la, la la la' la, la la la' la la la

    %25
    la8 la, la la la4 la
    la r r2
    la'4 la r8 r16 la\p

    %28
    la4 sold r
    sol!\f sol r8 r16 sol\p \mbreak
    sol4 fad r

    %31
    fa\f fa r8 r16 fa\p
    mi4 mi mi
    mi mi mi

    %34
    mi mi r8 r16 mi\f
    mi4 re r8 r16 re\p
    dod8 dod dod dod dod dod

    %37
    fad[fad] si, si si si
    mi[mi] la, la la la\mbreak
    re re re[re] dod dod

    %40
    si[si] si si si si
    la[la] la la la la
    sold4 sold r8 r16 sold

    %43
    la4 la la
    la r r



}

Ibcn = \relative do {

    r4
    re r re r
    re8 mi fad  mi re mi fad re
    sol la si sol la si dod si

    %4
    la si dod la re re, fad re
    sol, sol' fad re sol, sol' fad re\mbreak
    sol fad mi re la'4 la,8. la'16

    %7
    la4 la,8. la'16 la8 la, la la'
    la4 r la r
    la r la r

    %10
    la r la r
    la r la r\mbreak
    la,8 si dod si la si dod la

    %13
    re mi fad re mi fad sold fad
    mi fad sold mi la, la' dod la
    re, re' dod la re, re' dod la

    %16
    re dod si la sol fad mi re
    la la' dod la re,4 r\mbreak
    re r re r

    %19
    re r re r
    re8 mi fad mi re mi fad re
    sol la si la sol la si sol

    %22
    re' r16 re dod8 r16 dod si si si si la8 r16 la
    sol8 r16 sol fad8 r16 fad mi8 r16 mi re8 r16 re
    la8. la'16 la8. la,16 la8. la'16 la la la la

    %25
    la8 la, la la la4 la
    la r r2
    la'4 la r8 r16 la\p

    %28
    la4 sold r
    sol!\f sol r8 r16 sol\p \mbreak
    sol4 fad r

    %31
    fa\f fa r8 r16 fa\p
    mi4 mi mi
    mi mi mi

    %34
    mi mi r8 r16 mi\f
    mi4 re r8 r16 re\p
    dod8 dod dod dod dod dod

    %37
    fad[fad] si, si si si
    mi[mi] la, la la la\mbreak
    re re re[re] dod dod

    %40
    si[si] si si si si
    la[la] la la la la
    sold4 sold r8 r16 sold

    %43
    la4 la la
    la r r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s1*2
    s4 <5>8 <6> s <6+> <6> <6+>
    s <6+> <6>4 s2
    s1s4 <6> s2
    s1*5
    s4 <6>8 <6+> s <6+> <6>4
    s8 <_+> <6> <6> <_+>2
    s1
    s
    s4 <6>8 <6> s s <6> <6>
    s1*4
    s8 <_- 6> <6>4 s8 <_- 6> <6>4
    s2 <6>4 <6>
    s <6> <6> s
    s1*3
    <5>4 <6> s8 s16 <6>
    <4+ 2>4 <6>2
    <6>2.
    <6 4>4 <6>2
    <6>2 s8 s16 <6>
    <_+ 7>4 <6- 4>2
    <7+ 6- 4 2>2.
    <6- 4>4 <_!>2
    <4+ 2>4 <6> s8 s16 <6>
    <_+ 7>2.
    <_+>4 <7! _+>2
    <_+>4 <7!>2
    s4 <4+ 2>2
    <7>4 <6!>2
    <7>4 <6 4>2
    <7- 5>2 s8 s16 <7- 5>
    <6- 4>4 <_+>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 55
    \partial 4 s4
    s1*26\break
    \once \override Score.RehearsalMark.extra-offset = #'(+7 . 0.0)
    \mark \markup\huge "[2.] Adagio"
    \time 3/4
    \tempo 4 = 60
    s2.*18
    \bar "||"

}

Ifl = {
    \notypeset
    <<\Ifln \forma>>

}

Itb = {
    <<\Itbn \forma>>

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}


Ivla = {
    \clef alto
    <<\Ivlan \forma>>

}
Ivc = {
    \clef bass
    <<\Ivcn \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}



IItbn = \relative do'' {

    R1*14
    re2 r4 re\mbreak
    mi2 r4 mi

    %17
    fad2 r4 fad
    sol8 fad mi fad sol fad sol la
    fad sol fad sol la2

    %20
    R1*11
    r4 fad fad mi
    re2. mi8 fad

    %33
    sol1
    fad4 sold la2~
    la sold

    %36
    la r\mbreak
    re,2 r4 re
    mi2 r4 mi

    %39
    fad2 r4 fad
    sol2 r4 sol
    fad2 r4 mi

    %42
    mi2 r
    R1*12
    mi2 r4 mi\mbreak

    %56
    fad2 r4 fad
    sold2 la~
    la sold
    la r

    %60
    re,2 r4 re
    mi2 r4 mi
    fad2 r

    %63
    R1*6
    re2 r4 re
    mi mi fad2

    %71
    r4 fad sold2
    la r
    R1*4

    %77
    r4 la, la la
    la la8 la la4 la
    la la8 la la4 la

    %80
    la2 r4 la
    re2 r4 re
    mi2 r4 mi

    %83
    mi mi8 mi mi4 mi\mbreak
    mi la, la la
    re2 r\fermata

    %86
    la'4. la8 la4. la8
    fad2 r4 re
    la2 la

    %89
    la r\fermata

}


IIfln = \relative do'' {

    R1*5
    r4 la' la sol
    fad8 mi fad sol fad4 mi

    %8
    re mi8 fad sol fad sol fad
    mi4 fad8 sol la sol la sol
    fad4 sold8 la si la si la

    %11
    sold4 mi8 fad sold la si dod
    re4 dod8 si dod4 si8 la
    la2 sold

    %14
    la r
    R1*9
    r4 la la sol

    %25
    fad8 mi fad sol fad4 mi\mbreak
    re4 re' re dod
    si8 la si dod si4 la

    %28
    sol8 fad sol la sol4 fad
    mi2. si'4
    lad si8 lad si2~

    %31
    si lad
    si r
    R1*12

    %45
    r4 dod dod si\mbreak
    la8 sold fad sold la2~
    la4 si8 la si4 la

    %48
    sol8 fad mi fad sol2~
    sol4 fad8 mi fad4 mi
    red mi8 red mi4 fad8 mi

    %51
    fad4 sol8 fad sol4 la8 sol
    la2. do4
    si8 la sol fad mi4 la

    %54
    sol2 fad
    mi r\mbreak
    R1*4

    %60
    r2 si'
    r4 si dod2
    r4 dod re2

    %63
    r4 re, mi2
    r4 sol la2\mbreak
    r4 la fad re

    %66
    r si' sol mi
    re8 mi fad sol la4 si
    mi,2 r

    %69
    R1*3
    r4 dod' la fad
    r re' si sol

    %74
    r mi dod la\mbreak
    la'1
    si

    %77
    dod2 r
    la1\tr~
    la~

    %80
    la~
    la~
    la~

    %83
    la\mbreak
    mi4 mi mi mi
    la2 r\fermata

    %86
    la4. la8 dod4. dod8
    la2 r4 sol
    fad2 dod

    %89
    la r\fermata

}


IIvlIn = \relative do'' {

    la2 r4 la
    si2 r4 si
    dod2 r4 dod

    %4
    re8 dod re mi fad mi fad sol\mbreak
    mi1
    la,2. si8 dod

    %7
    re4 la r2
    R1*6
    r4 mi' dod la

    %15
    re8 dod si la sol fad sol fad\mbreak
    mi4 dod' mi8 re dod si
    la2~la8 sol la si

    %18
    sol la sol fad mi2
    la8 si la sol fad mi fad sol
    mi2 la~

    %21
    la4 la' fad re
    mi fad8 sold la2~
    la sold
    la r

    %25
    R1*9
    la2 r4 la
    si2 r4 si

    %36
    dod8 si dod si la2~\mbreak
    la4 sol8 fad sol2~
    sol8 fad sol fad mi re dod si

    %39
    la4 la'~la8 sol la si
    sol fad  mi re mi4 sol,
    la fad' re si

    %42
    dod8 si dod re mi re mi fad
    re dod re dod si4 si'~
    si8 la si sold la4 fad

    %45
    fad2 mid4 sold\mbreak
    la4 dod, fad,2
    R1*8

    %55
    r2 la'\mbreak
    r4 la si2
    r4 si dod re8 dod

    %58
    re4 re, si re
    dod si mi dod
    la la' fad re

    %61
    si2 r
    r4 dod' la fad
    re2 r

    %64
    r4 sol mi dod\mbreak
    la2 r4 fad'
    sol2 r4 sol

    %67
    la fad re si
    dod8 si dod re mi re mi fad
    re4 sol re2~

    %70
    re4 dod8 si dod4 dod'
    re re, si mi,
    la mi' fad2

    %73
    r4 fad sol2
    r4 sol la2\mbreak
    r4 re, la'2~

    %76
    la sold
    la r4 mi
    fad8 la sol fad mi re mi fad

    %79
    re fad mi re dod si dod re
    fad, mi fad sol la4 la'
    sold2 sold

    %82
    la la,4 mi'
    dod8 re mi re dod4 mi\mbreak
    dod' dod dod dod

    %85
    re2 r\fermata
    re4. re8 dod4. dod8
    re2 r4 si,

    %88
    fad2 mi
    fad r\fermata

}

IIvlIIn = \relative do'' {

    r4 la fad re
    sol8 la si la sol fad sol fad
    mi4 la8 sol la si sol la

    %4
    fad4 re re'2~\mbreak
    re dod
    re fad,4 sol

    %7
    la2. si8 dod
    re2 r
    R1*7

    %16
    r4 mi dod la
    fad8 sol fad mi re4 re'
    re2 dod

    %19
    re r4 re
    mi2 r4 mi
    fad2 r4 sold

    %22
    la8 sold la si dod si dod re
    si1
    dod2 r

    %25
    R1*7
    re,2 r4 re
    mi2 r4 mi

    %34
    fad8 mi re mi fad sol mi fad
    re2 mi
    r4 mi dod la\mbreak

    %37
    re8 dod si la sol fad mi re
    la'4 mi' dod la
    fad fad'8 mi re2~

    %40
    re dod
    re4 re, r2
    r4 mi' dod la

    %43
    la2 sold
    mid4 dod'2 re4
    la2 sold4 mid'\mbreak

    %46
    fad2 r
    R1*8
    r2 r4 la\mbreak

    %56
    fad re r re
    mi mi, mi' mi,
    si'2 re4 si

    %59
    mi2 r4 mi
    fad2 r
    r4 si sol mi

    %62
    dod2 r
    r4 re' si sol
    mi2 r\mbreak

    %65
    r4 la si2
    r4 si dod2
    re si~

    %68
    si la~
    la sold
    la r

    %71
    R1*2
    re,2 r4 re
    mi2 r4 mi\mbreak

    %75
    fad8 sol la sol fad sol mi fad
    re1
    dod8 re mi re dod si dod si

    %78
    la4 re dod la
    fad'8 la sol fad mi re mi fad
    re dod re mi fad mi fad mi

    %81
    re2 re
    dod8 re mi re dod si dod si
    la4 dod mi dod\mbreak

    %84
    mi mi mi mi
    fad2 r\fermata
    fad4. fad8 mi4. mi8

    %87
    fad2 r4 re,
    re2 dod
    re r\fermata

}

IIvlan = \relative do' {

    R1*4\mbreak
    r4 la' la sol
    fad8 mi fad sol fad4 mi

    %7
    re re, re' dod
    si2 r4 si
    dod2 r4 dod

    %10
    re2 red
    mi r4 mi
    fad sold la fad

    %13
    mi2 mi,
    la r
    R1*2

    %17
    re2 r4 re
    mi2 r4 mi
    fad2 r4 fad

    %20
    sol8 la sol fad mi4 la
    re, fad re2
    dod8 re dod re mi4 mi

    %23
    fad2 mi
    mi dod
    re r\mbreak

    %26
    R1*6
    r2 re~
    re dod

    %34
    re1~
    re2 si
    la r\mbreak

    %37
    r4 re' si sol
    mi2 r
    r4 la fad re

    %40
    r sol mi dod
    r la' fad si
    mi,2. mi4

    %43
    si'2 si,4 re
    sold2 fad4 re
    dod2 dod\mbreak

    %46
    dod r
    R1*9\mbreak
    r4 fad re si

    %57
    si'2 la
    re,1
    la'4 sold mi2

    %60
    re r
    R1
    la'2 r4 la

    %63
    si2 r4 si
    dod2 r4 mi,\mbreak
    fad2 r4 re'

    %66
    si sol mi dod
    la2 r4 mi'
    mi1

    %69
    R
    la2 r4 la
    si2 r4 si

    %72
    dod2 r4 dod
    re si sol si
    la2 la4 dod\mbreak

    %75
    la4 fad la4. la8
    re,2 mi
    mi r4 la

    %78
    re,8 fad mi re la'4 dod
    fad,2 la
    la re,

    %81
    si' si
    la8 si dod si la4 la
    mi la la mi\mbreak

    %84
    la la la la
    la2 r\fermata
    la4. la8 la4.  la8

    %87
    la2 r4 si,
    la2 la
    la r\fermata

}

IIvcn = \relative do {

    R1*13
    la2 r4 la
    si2 r4 si\mbreak

    %16
    dod2 r4 dod
    re8 dod re mi fad mi fad sol
    mi1

    %19
    re2 re'~
    re dod
    re r4 si

    %22
    dod2 la4 la,
    re2 mi
    la, r

    %25
    r4 re'\solo re dod\mbreak
    si8 la si dod si4 la
    sol2 red
    mi4 mi' mi re
    dod8 si dod re dod4 si
    fad sol8 fad sol4 mi
    fad2 fad,
    si4 si' sol fad
    mi2 la

    %34
    re,2. dod4
    si2 mi
    la r4 la\mbreak

    %37
    si2 r4 si,
    dod2 r4 dod
    re8 dod re mi fad mi fad sol

    %40
    mi2 r4 mi
    fad2 r4 sold
    la8 sold la si dod si dod re

    %43
    si2 r4 si
    dod mid, fad si,
    dod2 dod,\mbreak

    %46
    r4 fad'\solo fad mi
    red8 dod si dod red2
    mi4 mi' mi re?
    dod2 re4 do
    si2 sol
    red4 mi8 red mi4 fad8 mi
    fad4 sol la sol8 fad
    sol4 si do la
    si2. la4
    sold mi dod!2\mbreak

    %56
    re re,4 re'
    re2 dod
    si si'

    %59
    la4 mi dod la
    re fad re si
    mi sol mi dod

    %62
    fad la fad re
    sol si sol mi
    dod mi dod la\mbreak

    %65
    re2 r4 re
    mi2 r4 mi
    fad2 r4 sold

    %68
    la8 sold la si dod si dod re
    si1
    R1*2
    la2 r4 la
    si2 r4 si
    dod2 r4 <<dod\\dod,>>
    re8 mi fad mi re dod re dod
    si2 mi

    %77
    la, la
    la la'
    la4 la, la' la,
    la' la, la' la,
    la2 la
    la'4 la, la' la,
    la' la, la' la,\mbreak
    la' la, la' la,
    fad2 r\fermata

    %86
    fad'4. fad8 la4. la8
    re,2 r4 sol,
    la2 la

    %89
    re, r\fermata

}

IIbcn = \relative do {

    R1*13
    la2 r4 la
    si2 r4 si\mbreak

    %16
    dod2 r4 dod
    re8 dod re mi fad mi fad sol
    mi1

    %19
    re2 re'~
    re dod
    re r4 si

    %22
    dod2 la4 la,
    re2 mi
    la, r

    %25
    R1*7
    r4 si' sol fad
    mi2 la

    %34
    re,2. dod4
    si2 mi
    la r4 la\mbreak

    %37
    si2 r4 si,
    dod2 r4 dod
    re8 dod re mi fad mi fad sol

    %40
    mi2 r4 mi
    fad2 r4 sold
    la8 sold la si dod si dod re

    %43
    si2 r4 si
    dod mid, fad si,
    dod2 dod,\mbreak

    %46
    fad r
    R1*8
    r2 dod'\mbreak

    %56
    re re,4 re'
    re2 dod
    si si'

    %59
    la4 mi dod la
    re fad re si
    mi sol mi dod

    %62
    fad la fad re
    sol si sol mi
    dod mi dod la\mbreak

    %65
    re2 r4 re
    mi2 r4 mi
    fad2 r4 sold

    %68
    la8 sold la si dod si dod re
    si1
    la2 r

    %71
    R1
    la,2 r4 la
    si2 r4 si

    %74
    dod2 r4 dod\mbreak
    re8 mi fad mi re dod re dod
    si2 mi

    %77
    la, la
    la la
    la la

    %80
    la la
    la la
    la la

    %83
    la la\mbreak
    sol4 sol sol sol
    fad2 r\fermata

    %86
    fad'4. fad8 la4. la8
    re,2 r4 sol,
    la2 la

    %89
    re, r\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*14
    <7>2 s4 <6>
    <6 5>1
    s
    <7>2 <6>
    s s
    <2> s
    s s4 <6+>
    <6>1
    <6 5>2 <_+>
    s1*9
    <7>2 <7>
    s1
    <7>2 <_+>
    s1
    <7>2 s4 <6>
    <6 5>1
    s
    <7>2 s4 <6>
    <6>1
    s
    <7>2 s4 <6+>
    <_+ 7>1
    <6 4>2 <3>
    s1*10
    <5>2 <6>
    <4+ 2>1
    <7>2 <6+>
    s4 <_+> <6>2
    s4 <6> <6>2
    s4 <6> <6>2
    <5>4 <6> <6>2
    s4 <6> <6>2
    <6>4 <6> <6>2
    s2 s4 <6>
    <5>2 s4 <6>
    <6>1
    <9>2 <6>
    <7> <6+>
    s1*2
    s2 s4 <6>
    <5>2 s4 <6>
    <6 5>1
    s
    <7>2 <_+ 7>
    s1
    <6 4>2 <3>
    <6 4> <3>
    <6 4> s
    <7+ 2>1
    <5 3>
    s
    <6 4>
    <6>
    <6>
    s
    <6 4>2 <3>

}


forma = {

    \time 2/2
    \key re\major
    \tempo 1 = 55
    s1*89
    \bar "||"

}

IIfl = {
    %\notypeset
    <<\IIfln \forma>>

}

IItb = {
    <<\IItbn \forma>>

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}


IIvla = {
    \clef alto
    <<\IIvlan \forma>>

}
IIvc = {
    \clef bass
    <<\IIvcn \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
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



IIIfln = \relative do'' {

    R2.*2
    dod'4 dod dod\mbreak
    fad,8. mi16 fad4 r

    %5
    si si si
    si la8. sold16 la4
    la la la

    %8
    la sol!8. fad16 sol4
    R2.
    la8.[si16 do8. si16 la8. do16]

    %11
    si4~si8. la16 si8. la16
    la8. do16 sol8. la16 fad4 \mbreak
    mi r r

    %14
    sol sol sol
    sol fad8. [sol16 fad8. mi16]
    re8. mi16 fad4 r

    %17
    fad si8.[la16 sol8. fad16]
    sol8.[fad16 sol8. la16] fad4~
    fad mi~mi8. fad16

    %20
    fad4~fad8. [sold16 lad8. fad16]
    si8. lad16 si4~si8. dod16
    lad2.

}


IIIvlIn = \relative do'' {

    fad4\solo fad fad
    sol8. [fad16 sol8. fad16] sol4
    sol fad8.[mi16 fad8. mi16]\mbreak

    %4
    re8. dod16 re8. dod16 re4
    fad sold8.[la16 sold8. fad16]
    sold4 sold fad

    %7
    dod fad dod
    si si si
    si'8.[la16 sol8. fad16 mi8. re16]

    %10
    do8. si16 la4 la'8. sol16
    fad8. fad16 mi4~mi8. mi16
    mi8. fad16 mi4 red\mbreak

    %13
    mi4 r r
    lad, lad si
    dod8. si16 dod4 r

    %16
    si8.[dod16 re8. dod16 re8. mi16]
    fad4~fad8. fad,16 fad8. fad'16
    fad4 mi dod8. re16

    %19
    si8. lad16 si2
    lad4 dod r8 r16 dod
    re4 re re

    %22
    dod2.

}

IIIvlIIn = \relative do'' {

    re4\solo re re
    mi8.[re16 mi8. re16] mi4
    mi dod dod~\mbreak

    %4
    dod si8. lad16 si4
    re re re
    re re dod

    %7
    la dod la
    fad fad mi
    sol'8.[fad16 mi8. re16 do8. si16]

    %10
    mi4~mi8. mi16 fad8. mi16
    red8. red16 mi4 si
    do si si\mbreak

    %13
    sol8.[la16 si8. la16 sol8. fad16]
    mi4 mi mi
    mi8. re16 dod4 r

    %16
    fad fad'8.[sol16 fad8. lad16]
    si4 si,8.[do16 si8. do16]
    si4~si8. dod!16 lad4

    %19
    si mi8.[re16 dod8. si16]
    dod4 lad r8 r16 lad
    sold4 sold sold

    %22
    lad2.

}

IIIvlan = \relative do' {

    si'4\solo si si
    si si si
    lad lad lad\mbreak

    %4
    si si, si
    si' si, si
    mid mid fad

    %7
    fad fad, fad
    red' red mi?
    mi mi sol

    %10
    la la, la'
    la sol8.[fad16 sol8. mi16]
    la,8. la16 si4 si\mbreak

    %13
    mi8.[fad16 sol8. fad16 mi8. re16]
    dod4 dod si
    lad lad r

    %16
    si si8.[lad16 si8. dod16]
    re4 red~red8. red16
    mi4 mi fad

    %19
    sol sol2
    fad4 fad, r8 r16 fad'
    mid4 mid mid

    %22
    fad2._\markup\italic\right-align"Siegue subb[it]o"

}


forma = {

    \time 3/4
    \key re\major
    \tempo 4 = 55
    s2.*22
    \bar "||"

}

IIIfl = {
    %\notypeset
    <<\IIIfln \forma>>

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}


IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>
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



IVfln = \relative do'' {

    R1*14
    r4 mi la mi
    fad8 mi fad mi fad4 fad

    %17
    sold8 fad sold fad sold4 sold
    la8 sold la sold la4 la
    si8 la si la si4 si

    %20
    dod8 si la sold la4 fad
    sold2. la4
    la2 r

    %23
    mi mi\mbreak
    la1\tr ~
    la2 r\fermata

    %26
    R1*6
    r2 r4 fad
    fad mi mi mi\mbreak

    %34
    mi red8 dod red4 si'
    si la la la
    la sold8 fad sold4 mi

    %37
    mi8 fad sold la si4 mi,
    re' re re dod8 si
    dod4 si la2

    %40
    R1*3
    r2 r4 re
    re do8 si do4 si8 la

    %45
    si la sol fad sol2\mbreak
    R1
    re8 mi fad sol? la4 re

    %48
    re do8 si do4 si8la
    si4 la8 sol do4 si8 la
    si4 la8 sol do4 si8 la

    %51
    si la sol fad sol2
    R1*2
    la2 sol

    %55
    fad1

}

IVtbn = \relative do'' {

    re2. la'4
    re, la' re, la'
    re,8 mi fad sol la4 re

    %4
    la re sol,8 fad sol la
    fad4 re8 mi fad4 re
    la'2 la

    %7
    la4 fad8 sol la4 fad
    si2 si
    si8 la sold fad mi4 mi

    %10
    sold2 la
    sold la
    sold la\mbreak

    %13
    sold mi
    mi fad4 sold
    la2 r

    %16
    R1*6
    r2 r4 la
    la2 mi\mbreak

    %24
    mi la,4 la
    la2 r\fermata
    la'2 r8 mi fad sold

    %27
    la4 mi la,8 mi' fad sold
    la4 mi la, la'
    sold2 fad

    %30
    mid fad~
    fad mid
    fad r

    %33
    R1*13
    r4 fad sol fad8 mi
    fad2 r

    %48
    R1*4
    r4 fad sol fad8 mi
    fad2 r4 re

    %54
    re2 la
    la1

}


IVvlIn = \relative do'' {

    re2. la'4
    re, la' re, la'
    re,8 mi fad sol la4 re

    %4
    la re sol,8 fad sol la
    fad4 re8 mi fad4 re
    la' la la la

    %7
    la fad8 sol la4 fad
    si si si si
    si8 la sold fad mi4 mi

    %10
    re' mi, dod' mi,
    si' mi, dod' mi,
    re' mi, dod' mi,\mbreak

    %13
    si'8 la sold fad mi4 re'
    dod si8 la si4 sold
    la2 r

    %16
    R1*6
    r8 mi fad sold la4 mi
    la,8 si dod re mi4 dod\mbreak

    %24
    la8 mi fad sold la4 mi
    la,2 r\fermata
    la''2 r8 mi fad sold

    %27
    la4 mi la,8 mi' fad sold
    la4 mi la, la'
    sold8 fad sold la fad mid fad sold

    %30
    mid dod' si dod fad,4 si
    la sold8 fad sold fad mid sold
    fad4 dod fad,2

    %33
    R1*6
    r2 r8 la' sol fad
    sol4 la, fad' la,

    %41
    la8 si dod re mi la sol fad
    sol4 la, sol' la,
    fad'8 mi re dod re mi fad sol

    %44
    la2 r
    r r8 si dod re\mbreak
    fad, sol la si mi,4 dod'

    %47
    re2 r
    R1*3
    r2 r8 si dod re

    %52
    fad, sol la si mi,4 dod'
    re la, re,8 si' dod re
    fad, sol la si mi,4 dod'

    %55
    re8 fad, sol la re,2

}

IVvlIIn = \relative do'' {

    re2. la'4
    re, la' re, la'
    re,8 mi fad sol la4 re

    %4
    la re sol,8 fad sol la
    fad4 re8 mi fad4 re
    la' la la la

    %7
    la fad8 sol la4 fad
    si si si si
    si8 la sold fad mi4 mi

    %10
    re' mi, dod' mi,
    si' mi, dod' mi,
    re' mi, dod' mi,\mbreak

    %13
    si'8 la sold fad mi4 re'
    dod si8 la si4 sold
    la2 r

    %16
    R1*6
    r8 dod, re mi dod4 dod
    mi, la8 si dod4 la\mbreak

    %24
    mi8 dod re mi dod4 dod
    dod2 r\fermata
    la''2 r8 mi fad sold

    %27
    la4 mi la,8 mi' fad sold
    la4 mi la, la'
    sold8 fad sold la fad mid fad sold

    %30
    mid dod' si dod fad,4 si
    la sold8 fad sold fad mid sold
    fad4 dod fad,2

    %33
    R1*6
    r2 r8 la' sol fad
    sol4 la, fad' la,

    %41
    la8 si dod re mi la sol fad
    sol4 la, sol' la,
    fad'8 mi re dod re mi fad sol

    %44
    la2 r
    r r8 si dod re\mbreak
    fad, sol la si mi,4 dod'

    %47
    re2 r
    R1*3
    r2 r8 si dod re

    %52
    fad, sol la si mi,4 dod'
    re la, re,8 si' dod re
    fad, sol la si mi,4 dod'

    %55
    re8 fad, sol la re,2

}

IVvlan = \relative do' {

    re2. la'4
    re, la' re, la'
    re,8 mi fad sol la4 re

    %4
    la re sol,8 fad sol la
    fad4 re8 mi fad4 re
    la' la la la

    %7
    la fad8 sol la4 fad
    si si si si
    si8 la sold fad mi4 mi

    %10
    re' mi, dod' mi,
    si' mi, dod' mi,
    re' mi, dod' mi,\mbreak

    %13
    si'8 la sold fad mi4 re'
    dod si8 la si4 sold
    la2 r

    %16
    R1*6
    r2 r4 la
    mi2 la4 mi\mbreak

    %24
    dod2 mi4 mi
    mi2 r\fermata
    la r8 mi fad sold

    %27
    la4 mi la,8 mi' fad sold
    la4 mi la, la'
    sold8 fad sold la fad mid fad sold

    %30
    mid dod' si dod fad,4 si
    la sold8 fad sold fad mid sold
    fad4 dod fad,2

    %33
    R1*6
    r2 r8 la' sol fad
    sol4 la, fad' la,

    %41
    la8 si dod re mi la sol fad
    sol4 la, sol' la,
    fad'8 mi re dod re mi fad sol

    %44
    la2 r
    r r8 si dod re\mbreak
    fad, sol la si mi,4 dod'

    %47
    re2 r
    R1*3
    r2 r8 si dod re

    %52
    fad, sol la si mi,4 dod'
    re la re,8 si dod re
    si2 re

    %55
    re1

}

IVvcn = \relative do {

    re2 r
    re fad
    si fad

    %4
    fad mi
    re r4 re
    dod2 la

    %7
    re r
    red si
    mi r

    %10
    mi mi
    mi mi
    mi mi\mbreak

    %13
    mi sold
    la re,4 mi
    la,2 r4 dod'

    %16
    re re, r re'
    mi mi, r mi'
    fad fad, r fad

    %19
    sold sold, r sold'
    la mi fad re
    mi2 mi,

    %22
    la r4 la'
    la2 la,4 la\mbreak

    %24
    la'2 la,4 la
    la2 r\fermata
    la' la,

    %27
    dod r4 si
    la2 dod4 la
    mi'2 re

    %30
    dod re4 si
    dod2 dod'4 dod,
    fad2 r4 fad

    %33
    sold2 lad\mbreak
    si4 fad si, si'
    dod2 red

    %36
    mi4 si mi, la
    sold mi sold la
    si2 sold

    %39
    la la,4 la'
    la2 la

    %41
    la la,4 fad'
    mi fad mi dod
    re2 si

    %44
    fad'  re4 fad
    sol2 sol,4 sol'\mbreak
    la2 la,

    %47
    re  r4 si
    fad'2 re4 fad
    sol2 re4 fad

    %50
    sol2 re4 fad
    sol2 sol, 4 sol'

    %52
    la2 la,
    re r4 sol
    la2 la,

    %55
    re1

}

IVbcn = \relative do {

    re2 r
    re fad
    si fad

    %4
    fad mi
    re r4 re
    dod2 la

    %7
    re r
    red si
    mi r

    %10
    mi mi
    mi mi
    mi mi\mbreak

    %13
    mi sold
    la re,4 mi
    la,2 r

    %16
    R1*6
    r2 r4 la'
    la2 la,4 la\mbreak

    %24
    la'2 la,4 la
    la2 r\fermata
    la' la,

    %27
    dod r4 si
    la2 dod4 la
    mi'2 re

    %30
    dod re4 si
    dod2 dod,
    fad r

    %33
    R1*6
    r2 r4 la'
    la2 la

    %41
    la la,4 fad'
    mi fad mi dod
    re2 si

    %44
    fad' r
    r r4 sol\mbreak
    la2 la,

    %47
    re r
    R1*3
    r2 r4 sol

    %52
    la2 la,
    re r4 sol
    la2 la,

    %55
    re1

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <6>
    s <6>
    <6> <6>
    s1*5
    <_+ 7>2 <6 4>
    <_+> <6 5>
    <_+ 7> <6 4>
    <_+>1
    s2 <6>4 <_+>
    s1*12
    s2 s4 <6+>
    s1
    <_+>2 <6>
    <_+> <6>
    <6 4> <3>
    s1*8
    <7>2 <6 4>
    <5> s4 <6>
    <6> <6> <6> s
    s2 <5>
    <6>1
    s
    <6 4>2 <3>
    s1*5
    <6 4>2 <3>
    s1
    <6 4>2 <3>

}


forma = {

    \time 2/2
    \key re\major
    \tempo 1 = 55
    s1*25
    \bar ":..:"\break
    s1*30
    \bar ":|."

}

IVfl = {
    %\notypeset
    <<\IVfln \forma>>

}

IVtb = {
    <<\IVtbn \forma>>

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}


IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}
IVvc = {
    \clef bass
    <<\IVvcn \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
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

}

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {


\paper {

    systems-per-page = #3

}

    \header {
        subtitle = \markup "Sinfonia Seconda con Flauto e Tromba [1715] "
        composer = \markup {"A. Scarlatti (1660-1725)"}
    }

    \markup \huge {[1.] Spiritoso}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"trumpet"
                    \set Staff.instrumentName = \markup \center-column{"Tr[om]ba"}
                    \Itb \global
                >>

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.instrumentName = \markup \center-column{"Fl[auto]"}
                    \Ifl \global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Primo]"}
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Secondo]"}
                    \IvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \Ivla\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                    \set Staff.midiInstrument = #"cello"
                    \Ivc\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.3"continuo]"}
                \set Staff.midiInstrument = #"harpsichord"
                \Ibc\global
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[3.] All[egr]o}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"trumpet"
                    \IItb \global
                >>

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \IIfl \global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIvc\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIbc\global
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[4.] Adagio}

    \score {

        \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.instrumentName = \markup \center-column{"Fl[auto]"}
                    \IIIfl \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Primo]"}
                    \IIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Secondo]"}
                    \IIIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \IIIvla\global
                >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[5.] Presto}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"trumpet"
                    \set Staff.instrumentName = \markup \center-column{"Tr[om]ba"}
                    \IVtb \global
                >>

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.instrumentName = \markup \center-column{"Fl[auto]"}
                    \IVfl \global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Primo]"}
                    \IVvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Secondo]"}
                    \IVvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \IVvla\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                    \set Staff.midiInstrument = #"cello"
                    \IVvc\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.3"continuo]"}
                \set Staff.midiInstrument = #"harpsichord"
                \IVbc\global
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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



