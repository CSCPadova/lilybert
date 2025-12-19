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

Iglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine \senza
}

Ivln = \relative do'' {

    re16 re la la re re fad fad la la fad fad si si sol sol
    la la fad fad si si sol sol la la fad fad sol sol mi mi
    fad sol fad mi re fad mi sol fad sol fad mi re fad mi sol

    %4
    fad(mi fad) la sold(fad sold) si la8 la, r4
    la16 la mi mi la la dod dod\mbreak mi mi dod dod fad fad re re
    mi mi dod dod fad fad re re mi mi dod dod re re si si

    %7
    dod re dod si la dod si re dod re dod si la dod si re
    dod(si dod) mi red(dod red) fad mi8 mi, r4
    mi'4. sol8 fad la16 sol fad8 mi

    %10
    re4. la'8 sold si16 la sold?8 fad
    mi4. re8 dod4 si
    la8 la' la la\mbreak la16 sol fad mi re8 fad

    %13
    fad16 mi re dod si8 si' si16 la sol fad mi8 sol
    sol16 fad mi re dod8 mi la, re4 dod8
    re16 dod si la sol8 si si16 la sol fad mi8 sol

    %16
    sol16 fad mi re dod8 mi la, re4 dod8
    re16 mi fad sol la8 la, re16 mi fad sol la8 la,
    re16 mi fad sol la si dod la re8 fad, sol la

    %19
    re,4 r\mbreak r2
    R1*11

    %31 OK
    la'16 la mi mi la la dod dod\mbreak mi mi dod dod fad fad re re
    mi mi dod dod fad fad re re mi mi dod dod re re si si
    dod re dod si la dod si re dod re dod si la dod si re

    %34
    dod re dod si la dod si dod re re la la re re fad fad
    la la fad fad si si sol sol la la fad fad si si sol sol
    la la fad fad sol sol mi mi fad sol fad mi re fad mi sol

    %37
    fad sol fad mi re fad mi sol fad sol fad mi re4
    R1
    r2 r4 r8 re,

    %40
    re16 do si la sol4 r2
    R1*2
    r2 r4 r8 fad'

    %44
    fad16 mi re dod si4 r2
    r fad''4. la8\mbreak
    sol si16 la sol8 fad mi4. si'8

    %47
    lad dod16 si lad8 sold fad4. mi8
    re4 dod si16 la sol fad mi8 mi'
    mi16 re dod si lad8 dod fad, si4 lad8

    %50
    si16 dod re mi fad8 fad, si16 dod re mi fad8 fad,
    si16 la sol fad mi re dod si si'8 re, mi[fad]
    si,4 r r2\mbreak

    %53
    R1*4
    r4 r8 la''16 la, sol' la, fad' la, mi' la, re la
    dod re dod si la4 r2

    %59
    R1*7
    mi'16 mi si si mi mi sol sol si si sol sol do do la la
    si si sol sol do do la la si si sol sol la la fad fad

    %68
    sol la sol fad mi sol fad la sol la sol fad mi sol fad la
    sol la sol fad mi4 r2
    mi4. sol8 fad la16 sol fad8 mi

    %71
    re4. la'8 sold si16 la sold8 fad
    mi4. re8 dod4 si\mbreak
    la4 r r2

    %74
    r8 la' la la la16 sol fad mi re8 fad
    fad16 mi re dod si8 si' si16 la sol fad mi8 sol
    sol16 fad mi re dod8 mi la, re4 dod8

    %77
    re4 r r2
    r4 r8 la si4 r
    la8 r r4 si8 r r4\mbreak

    %80
    si8 r r4 dod8 r r4
    si8 r r4 dod8 r r4
    re16 re la la re re fad fad la la fad fad si si sol sol

    %83
    la la fad fad si si sol sol la la fad fad sol sol mi mi
    fad sol fad mi re fad mi sol fad sol fad mi re fad mi sol
    fad8 r r4 la8 r r4

    %86
    sold8 r r4 la8 r r4
    la,8 r r4 la'8 r r4
    sold8 r r4 r8 la la la

    %89
    la16 sol fad mi re8 fad fad16 mi re dod si8 si'
    si16 la sol fad mi8 sol sol16 fad mi re dod8 mi
    la, re4 dod8 re16 dod si la sol8 si

    %92
    si16 la sol fad mi8 sol sol16 fad mi re dod8 mi
    la, re4 dod8 re16 mi fad sol la8 la,
    re16 mi fad sol la8 la, re16 mi fad sol la si dod la\mbreak

    %95
    re8 fad, sol la re,4 r
    r8 re' mi dod re4 r
    r8 re mi dod re,16 mi fad sol la si dod la

    %98
    re8 fad, sol la re,4\fermata r

}

IobaIn = \transpose do la,

\relative do'' {
    \key fa\major

    fa,8 la do[fa] la fa4 sol8
    la fa4 sol8 la fa sol[mi]
    fa do4 mi8 fa do4 mi8

    %4
    fa do fa mi16 re mi4 r
    sol,8 mi sol[do] \mbreak mi do4 re8
    mi do4 re8 mi do re[si]

    %7
    do sol4 si8 do sol4 si8
    do sol do si16(la) si4 r
    r8 sol' sol sol sol16 fa mi re do8 mi

    %10
    mi16 re do si la8 la' la16 sol fa mi re8 fa
    fa16 mi re do si8 re sol, do4 si8
    do4. mib8\mbreak re8 fa16 mib re8 do

    %13
    sib4. fa'8 mi sol16 fa mi8 re
    do4. sib8 la4 sol
    fa4. fa'8 mi sol16 fa mi8 re

    %16
    do4. sib8 la4 sol
    fa16 sol la sib do8 do, fa16 sol la sib do8 do,
    fa16 sol la sib do re mi do fa8 la, sib do

    %19
    fa,4 r\mbreak r8 re'\p do sib
    la fa r4 r2
    r8 sib la re do4 r

    %22
    R1*9
    sol8 mi sol[do] mi do4 re8
    mi do4 re8\mbreak mi do re[si]

    %33
    do sol4 si8 do sol4 si8
    do4 r do8 la do[fa]
    la fa4 sol8 la fa4 sol8

    %36
    la fa sol[mi] fa do4 mi8
    fa do4 mi8 fa4 r8 do
    re re16 mib fa4. mib16 re mib8 do\mbreak

    %39
    re re16 mib fa4. mib16 re mib8 do
    re4 r8 re sol16 la sol fad sol fad mi re
    mi4 r8 mi la16 sib la sol la sol fa mi

    %42
    fa8 fa16 sol la4. sol16 fa sol8 mi
    fa8 fa16 sol la4. sol16 fa sol8 mi
    fa16 mi fa sol fa re mi fa mi re mi fa mi sol fa mi

    %45
    re dod re  mi re fa mi re dod8 la' la la\mbreak
    la16 sol fa mi re8 fa fa16 mi re do sib8 sib'
    sib16 la sol fa mi8 sol sol16 fa mi re dod8 mi

    %48
    la, re4 dod8 re4 r8 sib'
    la4. sol8 fa4 mi
    re16 mi fa sol la8 la, re16 mi fa sol la8 la,

    %51
    re16 do sib la sol fa mi re re'8 fa, sol[la]
    re4 r r2\mbreak
    R1*4

    %57
    r4 r8 do sib' la sol[fa]
    mi16 fa mi re do4 r2
    R1*7

    %66
    re8 sib re[sol] sib sol4 la8
    sib sol4 la8 sib sol la[fad]
    sol re4 fad8 sol re4 fad8

    %69
    sol re~re16 mib do re sib do re mib re mib do re
    sib8 sol' sol sol sol16 fa mi re do8 mi
    mi16 re do si la8 la' la16 sol fa mi re8 fa

    %72
    fa16 mi re do si8 re sol, do4 si8\mbreak
    do sol'16 la sol la fa sol mi fa sol la sol la fa sol
    mi8 do4 mib8 re fa16 mib re8 do

    %75
    sib4. fa'8 mi! sol16 fa mi8 re
    do4. sib8 la4 sol
    fa8 do'16 re do re sib do la sib do re do re sib do

    %78
    la4 r8 la sib4 r
    la8 r r4 sib8 r r4\mbreak
    si8 r r4 do8 r r4

    %81
    si8 r r4 do8 r r4
    do8 la do[fa] la fa4 sol8
    la fa4 sol8 la fa sol[mi]

    %84
    fa do4 mi8 fa do4 mi8\mbreak
    fa16 sol la sib la sib la sib sol fa mi fa sol la sol la
    fa mi re mi fa sol fa sol mi re mi fa sol la fa sol

    %87
    la sol la sib la sib la sib sol fa  mi fa sol la sol la
    fa mi re mi fa sol fa sol mi8 do4 mib8
    re fa16 mib? re8 do sib4. fa'8\mbreak

    %90
    mi sol16 fa mi8 re do4. sib8
    la4 sol fa4. fa'8
    mi sol16 fa mi8 re do4. sib8

    %93
    la4 sol fa16 sol la sib do8 do,
    fa16 sol la sib do8 do, fa16 sol la sib do re mi do\mbreak
    fa8 la, sib do fa, do'16 re do re sib do

    %96
    la8 fa' sol mi fa do16 re do re sib do
    la8 fa' sol mi fa,16 sol la sib do re mi do
    fa8 la, sib do fa,4\fermata r

}

IobaIIn = \transpose do la,

\relative do'' {
    \key fa\major

    fa,8 la do[fa] la fa4 sol8
    la fa4 sol8 la fa sol[mi]
    fa do4 mi8 fa do4 mi8

    %4
    fa do fa mi16 re mi4 r
    sol,8 mi sol[do] \mbreak mi do4 re8
    mi do4 re8 mi do re[si]

    %7
    do sol4 si8 do sol4 si8
    do sol do si16(la) si4 r
    r8 sol' sol sol sol16 fa mi re do8 mi

    %10
    mi16 re do si la8 la' la16 sol fa mi re8 fa
    fa16 mi re do si8 re sol, do4 si8
    do4. mib8\mbreak re8 fa16 mib re8 do

    %13
    sib4. fa'8 mi sol16 fa mi8 re
    do4. sib8 la4 sol
    fa4. fa'8 mi sol16 fa mi8 re

    %16
    do4. sib8 la4 sol
    fa16 sol la sib do8 do, fa16 sol la sib do8 do,
    fa16 sol la sib do re mi do fa8 la, sib do

    %19
    fa,4 r\mbreak r2
    r8 re'-\parenthesize \p  do sib la fa r4
    r2 r8 sib la re

    %22
    do4 r r2
    R1*8
    sol8 mi sol[do] mi do4 re8
    mi do4 re8\mbreak mi do re[si]

    %33
    do sol4 si8 do sol4 si8
    do4 r do8 la do[fa]
    la fa4 sol8 la fa4 sol8

    %36
    la fa sol[mi] fa do4 mi8
    fa do4 mi8 fa4 r8 la,
    sib sib16 do re4. do16 sib do8 la\mbreak

    %39
    sib8 sib16 do re4. do16 sib do8 la
    sib16 do sib la sib la sol fad sol4 r8 sol
    do16 re do si do si la sol la4 r8 la

    %42
    re re16 mi fa4. mi16 re mi8 dod
    re re16 mi fa4. mi16 re mi8 dod
    re8 la sib4~sib8 sol la4~

    %45
    la sol la8 la' la la\mbreak
    la16 sol fa mi re8 fa fa16 mi re do sib8 sib'
    sib16 la sol fa mi8 sol sol16 fa mi re dod8 mi

    %48
    la, re4 dod8 re4 r8 sib'
    la4. sol8 fa4 mi
    re16 mi fa sol la8 la, re16 mi fa sol la8 la,

    %51
    re16 do sib la sol fa mi re re'8 fa, sol[la]
    re4 r r2\mbreak
    R1*4

    %57
    r4 r8 do sib' la sol[fa]
    mi16 fa mi re do4 r2
    R1*7

    %66
    re8 sib re[sol] sib sol4 la8
    sib sol4 la8 sib sol la[fad]
    sol re4 fad8 sol re4 fad8

    %69
    sol re~re16 do la sib sol la sib do sib do la sib
    sol8 sol' sol sol   sol16 fa mi re do8 mi
    mi16 re do si la8 la' la16 sol fa mi re8 fa

    %72
    fa16 mi re do si8 re sol, do4 si8\mbreak
    do mi16 fa mi fa re mi do re mi fa mi fa re mi
    do4. mib8 re fa16 mib re8 do

    %75
    sib4. fa'8 mi! sol16 fa mi8 re
    do4. sib8 la4 sol
    fa8 la16 sib la sib sol la fa sol la sib la sib sol la

    %78
    fa4 r8 la sib4 r
    la8 r r4 sib8 r r4\mbreak
    si8 r r4 do8 r r4

    %81
    si8 r r4 do8 r r4
    do8 la do[fa] la fa4 sol8
    la fa4 sol8 la fa sol[mi]

    %84
    fa do4 mi8 fa do4 mi8\mbreak
    fa16 mi fa sol fa sol fa sol mi re do re mi fa mi fa
    re do si do re mi re mi do si do re mi fa re mi

    %87
    fa mi fa sol fa sol fa sol mi re do re mi fa mi fa
    re do si do re mi re mi do4. mib8
    re fa16 mib? re8 do sib4. fa'8\mbreak

    %90
    mi sol16 fa mi8 re do4. sib8
    la4 sol fa4. fa'8
    mi sol16 fa mi8 re do4. sib8

    %93
    la4 sol fa16 sol la sib do8 do,
    fa16 sol la sib do8 do, fa16 sol la sib do re mi do\mbreak
    fa8 la, sib do fa, la16 sib la sib sol la

    %96
    fa8 fa' sol mi fa la,16 sib la sib sol la
    la8 fa' sol mi fa,16 sol la sib do re mi do
    fa8 la, sib do fa,4\fermata r

}


Ivlan = \relative do' {

    fad8 re fad[la] re la sol[si]
    la la sol[si] la la si[la]
    la4 re,8 la' la4 re,8 la'

    %4
    la4 si8 sold mi la si,[sold']
    dod, la dod[mi]\mbreak la mi re[fad]
    mi mi re [fad] mi mi fad[mi]

    %7
    mi4 la,8 mi' mi4 la,8 mi'
    mi4 fad8 red si4 sold'8 si
    la4 la8 la la4 la8 sol

    %10
    la4 la8 si si4 si8 la
    si4 si8 mi, mi mi fad mi
    mi4 re8 re\mbreak re4 re8 do

    %13
    re4 re8 mi mi4 mi8 re
    mi4 mi8 la, la la si la
    fad fad' sol mi mi4 mi8 re

    %16
    mi4 mi8 la, la la si la
    re16 mi fad sol la8 la, re16 mi fad sol la8 la,
    re16 mi fad sol la si dod la re8 fad, sol la

    %19
    re,4 r\mbreak r2
    R1*11
    dod8 la dod[mi] la mi re[fad]

    %32
    mi mi re [fad]\mbreak mi mi fad[mi]
    mi4 la,8 mi' mi4 la,8 mi'
    mi4 dod8 mi re re fad[la]

    %35
    re la sol[si] la la sol[si]
    la la si[la] la4 r8 re,
    la'4 re,8 la' la4 r

    %38
    R1*7
    r2 dod,4 si8 si\mbreak
    si4 si8 la si4 si8 mi

    %47
    dod4 re8 si dod4 dod8 fad
    fad fad sol fad re4 mi8 dod
    dod4 dod8 fad fad fad sol fad

    %50
    si,16 dod re mi fad8 fad, si'16 dod re mi fad8 fad,
    si16 la sol fad mi re dod si si'8 re, mi[fad]
    si,4 r r2\mbreak

    %53
    R1
    fad'4 r dod r
    re r dod r

    %56
    re r8 re mi re dod[re]
    la4 r8 re dod la' sol[fad]
    mi4 r8 fad mi re dod[re]

    %59
    dod4 r\mbreak r2
    R1*6\mbreak
    sol'8 mi sol[si] mi si la[do]

    %67
    si si la [do] si si do[si]
    si4 mi,8 si' si4 mi,8 si'
    si4 r8 red, mi4 r8 si

    %70
    mi,4 si''8 la  la4 la8 sol
    la4 la8 si si4 si8 la
    si4 si8 mi, mi  mi fad mi\mbreak

    %73
    mi4 r8 sold la4 r8 mi
    la,4 mi'8 re re4 re8 do
    re4 re8 mi mi4 mi8 re

    %76
    mi4 mi8 la, la la si[la]
    la4 r8 dod re4 r8 la
    re,4 r8 re' re4 r

    %79
    re8 r r4 re8 r r4\mbreak
    mi8 r r4 mi8 r r4
    mi8 r r4 mi8 r r4

    %82
    re8 re fad[la] re la sol[si]
    la la sol[si] la la si[la]
    la4 re,8 la' la4 re,8 la'\mbreak

    %85
    la8 r r4 la8 r r4
    si8 r r4 dod8 r r4
    la8 r r4 la8 r r4

    %88
    si8 r r4 dod4 re,8 fad
    re4 re8 do re4 re8 mi\mbreak
    mi4 mi8 re mi4 mi8 la,

    %91
    la la si la fad fad' sol mi
    mi4 mi8 re mi4 mi8[la,]
    la la si[la] re16 mi fad sol la8 la,

    %94
    re16 mi fad sol la8 la, re16 mi fad sol la si dod la\mbreak
    re8 re, fad la re,4 r
    r8 la si la la4 r

    %97
    r8 la si la re16 mi fad sol la  si dod la
    re8 fad, sol la re,4\fermopz r

}


Ivcn = \relative do {

    re'8 re, re[re'] re re, sol[sol,]
    re'' re, sol[sol,] re' re' sol,[la]
    re, re fad[la] re re, fad[la]

    %4
    re dod si[mi] la, dod, re[mi]
    la la, la[la']\mbreak la la, re[re,]
    la'' la, re[re,] la' la' re,[mi]

    %7
    la, la dod[mi] la la, dod[mi]
    la sold fad[si] mi,4 mi'8 re
    dod si dod la re4 re,8 mi

    %10
    fad mi fad red mi4 mi8 fad
    sold mi mi sold la dod, re mi
    la, la' fad re\mbreak sol4 sol8 la

    %13
    si la si[sold] la4 la,8 si
    dod la la[dod] re fad sol la
    si,4 si8 sold la4 la8 si

    %16
    dod la la [dod] re re, sol[la]
    re16 mi fad sol la8 la, re16 mi fad sol la8 la,
    re16 mi fad sol la si dod la re8 fad, sol la

    %19
    re,16 la' sol la fad la mi la\mbreak re, la' sol la fad la mi la
    re, la' sol la fad la mi la re, re' dod re la re sol, re'
    fad, re' dod re la re sol, re' re, re' dod re la re sol, re'

    %22
    fad, re mi fad sol la si dod re\clef tenor \key re\major la si dod re mi fad sold
    la8 la, r sol fad16 la re la re, la' re la
    fad la re la do si do la si do si la sol8 la

    %25
    sold16 si mi si mi, si' mi si sold si mi si re dod re si\mbreak %%% fine pagina OOKK
    dod re dod si la8 mi' fad16 la, mi' la, fad' la, re la
    sol' la, fad' la, sol' la, mi' la, fad' la,  mi' la, fad' la, re la

    %28
    sol' la, fad' la, sol' la, mi' la, fad' la, mi' la, fad' la, re la
    sold' la, fad' la, sold' la, mi' la, la' dod, dod dod si sold' sold sold
    la dod, dod dod si sold' sold sold la8 la, mi[sold]

    %31
    \clef bass\key re\major la la, la[la'] la la, re[re,]
    la'' la, re[re,]\mbreak la' la' re,[mi]
    la, la dod[mi] la la, dod[mi]

    %34
    la4 la8 sol fad re re[re']
    re re, sol[sol,] re'' re, sol[sol,]
    re' re' sol,[la] re, re fad[la]

    %37
    re re, fad [la] re,4 r8 re'
    re16 do si do sol si la si do,4 \once\stemUp la8 re'\mbreak
    re16 do si la sol si la si do,4 la8 re

    %40
    sol,4 r8 si' si16 la sold fad mi8 mi'
    mi16 re dod si la8 dod dod16 si lad sold fad8 fad'
    fad16 mi re dod si re dod re mi,4 \once\stemUp dod8 fad'

    %63
    fad16 mi re dod si re dod re mi,4 dod8 fad
    si,4 r8 si' la16 sol la si la fad sol la
    sol fad sol la sol mi fad sol fad4 red8 si\mbreak

    %46
    mi4 mi8 fad sol fad sol mi
    fad4 fad8 sold lad fad fad lad
    si re, mi fad sol,4 sol'8 mi

    %49
    lad fad fad lad si re, mi fad
    si16 dod re mi fad8 fad, si16 dod re mi fad8 fad,
    si16 la sol fad mi re dod si si'8 re, mi[fad]

    %52
    si16 dod re dod si dod si la sold mi sold si sold si sold mi\mbreak
    la si dod si la si la sol fad re fad la fad re fad la
    \clef tenor \key re\major re16 la re fad re la re fad mi la, mi' sol mi la, mi' sol

    %55
    fad la, re fad re la re fad mi la, mi' sol mi la, mi' sol
    fad la, fad' la fad la, fad' la sol la, fad' la, mi' la, re la
    dod re dod si la4 r2

    %58
    r4 r8 la'16 la, sol' la, fad' la, mi' la,  re la
    dod re dod si la8 fad\clef bass\key re\major \once\stemUp sol,16 si' si si \once\stemUp la, dod' dod dod
    \once\stemUp si, re' re re \once\stemUp dod, mi' mi mi  \clef tenor \key re\major \once\stemUp re,16 fad' mi re la sol' fad mi

    %61
    \once\stemUp  re, fad' mi re la sol' fad mi fad sol fad mi re8 fad,
    \clef bass\key re\major \once\stemUp sol,16 si' si si \once\stemUp la, dod' dod dod \once\stemUp si, re' re re \once\stemUp dod, mi' mi mi
    \clef tenor \key re\major \once\stemUp re,16 fad' mi re la sol' fad mi \once\stemUp re, fad' mi re la sol' fad mi

    %64
    fad sol fad mi re8 mi la, re mi,[dod']
    re red mi fad si, mi fad,[red']
     \clef bass\key re\major mi, mi mi,[mi']  mi mi, la'[la,]

    %67
    mi' mi, la'[la,] mi' mi la,[si]
    mi, mi' sol[si] mi mi, sol[si]

    %69
    mi,4 r r r8 si'
    si16 la sol fad mi8 dod re4 re8 mi
    fad mi fad red mi4 mi8 fad

    %72
    sold mi mi sold la dod, re mi\mbreak
    la,4 r r r8\clef tenor \key re\major mi''
    mi16 re dod si la8 fad \clef bass \key re\major sol4 sol8 la

    %75
    si la si[sold] la4 la,8 si
    dod si dod[la] re fad sol[la]
    re,4 r r r8 la'

    %78
    la16 sol fad mi re8 re' sol,16 si re si re si re si
    re, la' do la do la do la sol, sol' fad sol si sol fad sol\mbreak
    mi sold fad sold si sold fad sold la dod mi dod mi dod mi dod

    %81
    mi, si' re si re si re si la, la' sold la dod la sold la
    fad8 re re [re'] re re, sol[sol,]
    re'' re, sol[sol,] re' re' sol,[la]

    %84
    re, re fad[la] re re, fad[la]\mbreak
    re, re re' re, r la la' la,
    r mi' mi' mi, r la, la' la,

    %87
    r re re' re, r la la' la,
    r mi' mi' mi, r la fad re
    sol4 sol8 la si la si sold\mbreak

    %90
    la4 la,8 si dod la la[dod]
    re fad sol la si,4 si8 sold
    la4 la8 si dod la la[dod]

    %93
    re fad, sol[la] re16 mi fad sol la8 la,
    re16 mi fad sol la8 la, re16 mi fad sol la si dod la
    re8 fad, sol la re,4 r8 dod'

    %96
    re fad, sol la re,4 r8 dod'
    re fad, sol la re,16 mi fad sol la si dod la
    re8 fad, sol la re,4\fermata r

}

Ibcn = \relative do {

    re'8 re, re[re'] re re, sol[sol,]
    re'' re, sol[sol,] re' re' sol,[la]
    re, re fad[la] re re, fad[la]

    %4
    re dod si[mi] la, dod, re[mi]
    la la, la[la']\mbreak la la, re[re,]
    la'' la, re[re,] la' la' re,[mi]

    %7
    la, la dod[mi] la la, dod[mi]
    la sold fad[si] mi,4 mi'8 re
    dod si dod la re4 re,8 mi

    %10
    fad mi fad red mi4 mi8 fad
    sold mi mi sold la dod, re mi
    la, la' fad re\mbreak sol4 sol8 la

    %13
    si la si[sold] la4 la,8 si
    dod la la[dod] re fad sol la
    si,4 si8 sold la4 la8 si

    %16
    dod la la [dod] re re, sol[la]
    re16 mi fad sol la8 la, re16 mi fad sol la8 la,
    re16 mi fad sol la si dod la re8 fad, sol la

    %19
    re,4 r\mbreak r2
    r re4 r
    R1

    %22
    re4 mi fad si
    la dod,8 la re4 r
    re fad, sol sol'8 fad

    %25
    mi4 r mi sold,\mbreak %%% fine prima pagina OK
    la dod8 la re4 r
    mi8 re mi[la,] re4 r

    %28
    mi8 re mi[la,] re4 r
    mi8 re mi[dod] fad4 re8 mi
    fad4 re8 mi dod re mi mi,

    %31
    la' la, la [la'] la la, re[re,]
    la'' la, re[re,]\mbreak la' la' re,[mi]
    la, la dod[mi] la la, dod[mi]

    %34
    la4 la8 sol fad re re[re']
    re re, sol[sol,] re'' re, sol[sol,]
    re' re' sol,[la] re, re fad[la]

    %37
    re re, fad [la] re,4 r8 re
    sol,4 r8 sol do4 la8 re\mbreak
    sol,4 r8 sol do4 la8 re

    %40
    sol,4 r sold r
    la r lad r
    si r8 si mi4 dod8 fad

    %43
    si,4 r8 si mi4 dod8 fad
    si,4 r8 si' la4 r
    sol r fad red8 si\mbreak

    %46
    mi4 mi8 fad sol fad sol mi
    fad4 fad8 sold lad fad fad lad
    si re, mi fad sol,4 sol'8 mi

    %49
    lad fad fad lad si re, mi fad
    si16 dod re mi fad8 fad, si16 dod re mi fad8 fad,
    si16 la sol fad mi re dod si si'8 re, mi[fad]

    %52
    si,4 r mi r\mbreak
    dod r re r
    R1*3

    %57
    r4 r8 fad mi re dod[re]
    la4 r r2
    r4 r8 re\mbreak sol,4 la

    %60
    si dod re dod
    re dod re r8 re
    sol,4 la si dod

    %63
    re dod re dod
    re r8 sol, fad si sol[la]
    fad si sol[la]~la sol la[si]\mbreak

    %66
    mi mi, mi[mi'] mi mi, la'[la,]
    mi' mi, la'[la,] mi' mi la,[si]
    mi, mi' sol[si] mi mi, sol[si]

    %69
    mi,4 r r2
    r4 mi8 dod re4 re8 mi
    fad mi fad red mi4 mi8 fad

    %72
    sold mi mi sold la dod, re mi\mbreak
    la,4 r r2
    r4 la'8 fad sol4 sol8 la

    %75
    si la si[sold] la4 la,8 si
    dod si dod[la] re fad sol[la]
    re,4 r r2

    %78
    r4 r8 re sol4 r
    re8 r r4 sol,8 r r4\mbreak
    mi'8 r r4 la8 r r4

    %81
    mi8 r r4 la, r
    fad'8 re re[re'] re re, sol[sol,]
    re'' re, sol[sol,] re' re' sol,[la]

    %84
    re, re fad[la] re re, fad[la]\mbreak
    re, r r4 la8 r r4
    mi'8 r r4 la,8 r r4

    %87
    re8 r r4 la'8 r r4
    mi8 r r4 la, fad'8 re
    sol4 sol8 la si la si sold\mbreak

    %90
    la4 la,8 si dod la la[dod]
    re fad sol la si,4 si8 sold
    la4 la8 si dod la la[dod]

    %93
    re fad, sol[la] re16 mi fad sol la8 la,
    re16 mi fad sol la8 la, re16 mi fad sol la si dod la
    re8 fad, sol la re,4 r

    %96
    r8 fad sol la re,4 r
    r8 fad sol la re,16 mi fad sol la si dod la
    re8 fad, sol la re,4\fermata r

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}

forma = {

    \time 4/4
    \tempo 2 = 55
    s1*98
    \bar"|."

}


Ivl = {
    \Iglobal
    \notypeset
    <<\Ivln \forma>>
}


IobaI = {
    \Iglobal
    <<\IobaIn \forma>>
}


IobaII = {
    \Iglobal
    <<\IobaIIn \forma>>
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


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}

IIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine \senza
}

IIvln = \relative do'' {

    r8
    R4.*7
    r8 r la\p
    la(si) la

    %10
    sol4_+ fad8
    sol mi4
    re16(mi) fad(sol) la8

    %13
    la(si) la
    sol4 fad8
    sol mi4
    re r8\mbreak

    %17
    r8 r dod'
    dod(si) r
    r r re

    %20
    re(dod) r
    R4.*7
    r8 r la

    %29
    la(si) la
    sol4 fad8
    R4.

    %32
    r8 r la
    la(si) la
    sol4_+ fad8\mbreak

    %35
    sol mi4
    re la'8
    si16(la) si4

    %38
    sol16(fad) sol4
    la8 fad sol
    la re la

    %41
    si16(la) si4
    sol16(fad) sol4
    la8 fad sol

    %44
    la4 r8
    r r si
    si(lad) r

    %47
    r r dod
    dod(re) si
    fad4 r8

    %50
    si,4 r8\mbreak
    fad'4 r8
    si,4 fad''8

    %53
    fad(sol) fad
    mi4 re8
    mi dod4

    %56
    si r8
    R4.
    r8 r fad

    %59
    sol mi4
    re r8
    R4.

    %62
    r8 r fad
    sol mi4_+
    re4_\fermata r8

}

IIobaIn = \transpose do la,

\relative do'' {
    \key fa\major

    do8
    do(re) do
    sib4 la8
    sib sol4

    %4
    fa16 sol la sib do8
    do(re) do
    sib4 la8
    sib sol4

    %8
    fa do'8\p
    do(re) do
    sib4_+ la8

    %11
    sib sol4
    fa16(sol) la(sib) do8
    do(re) do

    %14
    sib4 la8
    sib sol4
    fa4 do'8\mbreak

    %17
    re16(mi) fa8 r
    r r re
    mi16 fa sol8 r

    %20
    r r sol
    mi4 mi8
    fa mi16 fa sol8

    %23
    re4 mi8
    fa mi16 fa sol8
    sol(la) sol

    %26
    fa4 mi8
    fa re4
    do do8

    %29
    do(re) do
    sib4 la8
    sib sol4

    %32
    fa16(sol) la(sib) do8
    do(re) do
    sib4_+ la8\mbreak

    %35
    sib sol4
    fa r8
    R4.*7

    %44
    r8 r fa'
    fa(mi) r
    r r sol

    %47
    sol(fa) r
    r r la
    la4.~

    %50
    la~\mbreak
    la
    la4 la8

    %53
    la(sib) la
    sol4 fa8
    sol mi4

    %56
    re do8
    do(re) do
    sib4 la8

    %59
    sib sol4
    fa16(sol) la(sib) do8
    do(re) do

    %62
    sib4 la8
    sib sol4_+
    fa4_\fermata r8

}

IIobaIIn = \transpose do la,

\relative do'' {\key fa\major

    la8
    la(sib) la
    sol4 fa8
    sol mi4

    %4
    fa16 mi fa sol la8
    la(sib) la
    sol4 fa8

    %7
    sol mi4
    fa la8-\parenthesize \p
    la(sib) la

    %10
    sol4_+ fa8
    sol mi4
    fa16 \parentSlur (mi) fa \parentSlur (sol) la8

    %13
    la(sib) la
    sol4 fa8
    sol mi4

    %16
    fa la8\mbreak
    si16(do) re8 r
    r r si

    %19
    do16 re mi8 r
    r r do
    do4.~

    %22
    do~
    do~
    do4 mi8

    %25
    mi(fa) mi
    re4 do8
    re si4

    %28
    do la8
    la(sib) la
    sol4 fa8

    %31
    sol mi4
    fa16(mi) fa(sol) la8
    la(sib) la

    %34
    sol4_+ fa8\mbreak
    sol mi4
    fa r8

    %37
    R4.*7
    r8 r la
    la(sol) r

    %46
    r r mi'
    mi(re) r
    r r fa

    %49
    mi sol16 fa mi sol
    fa8 re16 mi fa8\mbreak
    mi8 sol16 fa mi sol

    %52
    fa8 re16 mi fa8
    fa(sol) fa
    mi4 re8

    %55
    mi dod4
    re la8
    la(sib) la

    %58
    sol4 fa8
    sol mi4
    fa16(mi) fa(sol) la8

    %61
    la(sib) la
    sol4 fa8
    sol mi4_+

    %64
    fa4_\fermata r8

}


IIvlan = \relative do' {

    r8
    R4.*7
    r8 r fad
    fad\parentSlur (sol) fad

    %10
    mi4 re8
    mi dod4
    re16 \parentSlur(dod) re \parentSlur(mi) fad8

    %13
    fad \parentSlur(sol) fad
    mi4 re8
    mi dod4

    %16
    re r8\mbreak
    r r la'
    la(sold) r

    %19
    r r si
    si(la) r
    R4.*7

    %28
    r8 r fad
    fad(sol) fad
    mi4 re8

    %31
    R4.
    r8 r fad
    fad\parentSlur ( sol) fad

    %34
    mi4-+ re8\mbreak
    mi dod4
    re fad8

    %37
    sol16 (fad) sol4
    mi16 (re) mi4
    fad8 re mi

    %40
    fad4 fad8
    sol16 (fad) sol4
    mi16 (re) mi4

    %43
    fad8 re mi
    fad4 r8
    r r re

    %46
    re(dod) r
    r r lad'
    lad?(si) si

    %49
    fad4 r8
    si,4 r8\mbreak
    fad'4 r8

    %52
    si,4 re'8
    re \parentSlur (mi) re
    dod4 si8

    %55
    dod lad4
    si r8
    R4.

    %58
    r8 r re,
    mi dod4
    re r8

    %61
    R4.
    r8 r re
    mi dod4

    %64
    re\fermata r8

}


IIvcn = \relative do {

    re8
    sol,4 re'8
    dod4 re8
    sol la la,

    %4
    re4 re8
    sol,4 re'8
    dod4 re8

    %7
    sol la la,
    re4 la'8
    la \parentSlur (si) la

    %10
    sol4-+ fad8
    sol mi4
    re16(mi) fad(sol) la8

    %13
    la(si) la
    sol4 fad8
    sol mi4

    %16
    re re8\mbreak
    si sold la
    mi'4 re8

    %19
    dod dod16 re mi8
    la,4 dod8
    re4 mi8

    %22
    fad mi16 re dod8
    re4 mi8
    fad4 mi8

    %25
    re4 la'8
    sold4 la8
    re, mi mi,

    %28
    la4 la'8
    la(si) la
    sol4 fad8

    %31
    sol la la,
    re4 la'8
    la(si) la

    %34
    sol4 fad8\mbreak
    sol mi4
    re re8

    %37
    re16 re' dod re re, re'
    re, re' dod re re, re'
    re, re' dod re re, re'

    %40
    re, re' dod re re, re'
    re, re' dod re re, re'
    re, re' dod re re, re'

    %43
    re, re' dod re re, re'
    re,4 si8
    fad'4 mid8

    %46
    fad4 mi!8
    fad4 fad8
    si,4 si'8

    %49
    lad dod16 si lad dod
    si8 re16 dod si8\mbreak
    lad dod16 si lad dod

    %52
    si4\clef tenor \key re\major fad'8
    fad(sol) fad
    mi4 re8

    %55
    mi dod4
    si \clef bass\key re\major re,8
    sol,4 re'8

    %58
    dod4 fad8
    sol mi4
    re4 re8

    %61
    sol,4 re'8
    dod4 fad8
    sol mi4

    %64
    re_\fermata r8

}

IIbcn = \relative do {

    r8
    R4.*7
    r8 r re
    sol,4 re'8

    %10
    dod4 re8
    sol la la,
    re4 re8

    %13
    sol,4 re'8
    dod4 re8
    sol la la,

    %16
    re4 r8\mbreak
    r8 r la
    mi' mi, r

    %19
    r r mi'
    la la, r
    R4.*7

    %28
    r8 r re
    sol,4 re'8
    dod4 re8

    %31
    R4.
    r8 r re
    sol,4 re'8

    %34
    dod4 re8\mbreak
    sol la la,
    re4 re,8

    %37
    re8(re re)
    re8(re re)
    re8(re re)

    %40
    re8(re re)
    re8(re re)
    re8(re re)

    %43
    re8(re re)
    re4 r8
    r8 r mid'

    %46
    fad fad, r
    r r fad'
    si si, r

    %49
    R4.*3
    r8 r si'
    mi,4 si'8

    %54
    lad4 si8
    mi, fad fad,
    si4 r8

    %57
    R4.
    r8 r re
    sol la la,

    %60
    re4 r8
    R4.
    r8 r re

    %63
    sol la la,
    re,4_\fermata r8

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}

forma = {

    \time 3/8
    \tempo 4 = 60
    \partial 8 s8
    s4.*64
    \bar"|."

}


IIvl = {
    \IIglobal
    \notypeset
    <<\IIvln \forma>>
}


IIobaI = {
    \IIglobal
    <<\IIobaIn \forma>>
}


IIobaII = {
    \IIglobal
    <<\IIobaIIn \forma>>
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


IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}

IIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzine \senza
}

IIIvln = \relative do'' {

    la'8
    re la re re la re
    re4. re,8. mi16 fad sol
    la8 fad la sol mi sol

    %4
    fad sol16 fad  mi re mi8 la  la,
    re fad4 mi8 sol4
    fad8 sol16 fad mi re mi8 la, mi'\mbreak

    %7
    fad sol16 fad  mi fad sold8 la16 sold fad sold
    la8 si16 la sold la si8 sold mi
    mi, mi'4 mi,8 mi'4

    %10
    mi,8 mi'4 mi,8 mi'4
    mi,8 mi'4 mi,8 mi'4
    mi,8 mi'4 mi,8 mi'4

    %13
    dod8 mi la si, la' sold\mbreak
    la mi16 re dod si dod8 mi si
    dod mi16 re dod si dod8 mi si

    %16
    dod mi la si, la' sold
    la sold16 fad mi re dod8 mi16 re dod si
    la8 mi dod la4 mi''8\mbreak

    %19
    la mi la la mi la
    la4. la,8. dod16 re mi
    fad8 re fad mi dod mi

    %22
    re fad16 mi re dod re8 si re
    sol4. la,8. dod16 re mi
    fad4. sol,8. si16 dod re

    %25
    mi4. fad,8. lad16 si dod\mbreak
    re4. si4 dod8
    re fad16 mi fad8 si fad16 mi fad8

    %28
    dod fad16 mi fad8 lad fad16 mi fad8
    re fad16 mi fad8 si fad16 mi fad8
    dod fad16 mi fad8 lad fad16 mi fad8

    %31
    si fad sol re  mi dod
    si fad16 mi re dod si4 fad'8
    sol si4 la8 do4\mbreak

    %34
    si8 do16 si la si dod8 re16 dod si dod
    re8 fad4 mi8 sol4
    fad8 sol16 fad mi re mi8 dod16 re mi8

    %37
    la,8 la'4 la,8 la'4
    la,8 la'4 la,8 la'4
    la,8 la'4 la,8 la'4

    %40
    la,8 la'4 la,8 la'4\mbreak
    fad8 la re fad, sol mi
    re la'16 sol fad mi fad8 la mi

    %43
    fad la16 sol fad mi fad8 la mi
    fad la re fad, sol mi
    re dod16 si la sol fad8 la16 sol fad mi

    %46
    re8 re' re, re4 re r8 r4.

}

IIIobaIn = \transpose do la,

\relative do'' {
    \key fa\major

    do8
    la4. sib_+
    do8 la fa fa'4.~
    fa mi

    %4
    fa8 sol16 fa mi re mi8 do mi
    fa do fa mi do mi
    fa sol16 fa mi re mi8 do mi\mbreak

    %7
    fa4.~fa4 fa8
    fa4.~fa8 sol16 fa mi re
    mi8 mi16(fa) sol8~sol fa  mi

    %10
    re re16 mi fa8~fa mi re
    mi mi16 fa sol8~sol fa mi
    re re16 mi fa8~fa mi re

    %13
    mi re sol fa mi re\mbreak
    do4. r8 r si
    do4. r8 r si

    %16
    do mi sol fa mi re
    mi do mi sol mi sol
    sol4. r8 r sol\mbreak

    %19
    mi4. fa\tr
    sol8 mi16 fa sol8 do,4.~
    do dod

    %22
    re r8 r la'
    sib la sib sol fa sol
    la sol la fa mi fa

    %25
    sol fa sol mi re mi\mbreak
    fa mi fa re4 mi8
    fa4 r8 r4.

    %28
    mi4 r8 r4.
    fa4 r8 r4.
    mi4. r8 r mi

    %31
    fa4 re8 re mi dod
    re4. r8 r fa,
    fa fa fa fa fa fa\mbreak

    %34
    fa fa fa do' do do
    do do do do do do
    fa sol16 fa mi re mi4 sol8

    %37
    fa fa16 sol la8~la sol fa
    mi mi16 fa sol8~sol fa mi
    fa fa16 sol la8~la sol fa

    %40
    mi mi16 fa sol8~sol fa mi\mbreak
    fa4. r8 r mi
    fa4. r8 r mi

    %43
    fa fa, fa' fa sol mi
    fa fa, fa' \parenthesize fa \parenthesize sol mi
    fa fa, la do la do

    %46
    do4. r8 r do4 r8 r4.

}


IIIobaIIn = \transpose do la,

\relative do'' {\key fa\major

    do8
    la4. sib_+
    do8 la fa fa'4.~
    fa mi

    %4
    fa8 sol16 fa mi re mi8 do mi
    fa do fa mi do mi
    fa sol16 fa mi re mi8 do mi\mbreak

    %7
    fa4.~fa4 fa8
    fa4.~fa8 sol16 fa mi re
    do8 do16 re mi8~ mi re do

    %10
    si si16 do re8~re do si
    do do16 re mi8~ mi re do
    si si16 do re8~re do si

    %13
    do4 sol'8 fa mi re\mbreak
    do4. r8 r si
    do4. r8 r si

    %16
    do mi sol fa mi re
    do sol do  mi do mi
    mi4. r8 r sol\mbreak

    %19
    mi4. fa\tr
    sol8 mi16 fa sol8 do,4.~
    do dod

    %22
    re r8 r fa
    sol fa sol mi re mi
    fa mi fa re dod re

    %25
    mi re mi dod si dod\mbreak
    re dod re fa, la dod
    re4 r8 r4.

    %28
    dod4 r8 r4.
    re4 r8 r4.
    dod4. r8 r dod

    %31
    re4 re8 re mi dod
    re4. r8 r fa,
    fa fa fa fa fa fa\mbreak

    %34
    fa fa fa do' do do
    do do do do do do
    fa sol16 fa mi re mi4 do8

    %37
    la la16 sib do8~do sib la
    sol sol16 la sib8~sib la sol
    la la16 sib do8~do sib la

    %40
    sol sol16 la sib8~sib la sol\mbreak
    fa'4. r8 r mi
    fa4. r8 r mi

    %43
    fa4. r8 r mi
    fa fa, fa' fa sol mi
    fa4 fa,8 la fa la

    %46
    la4. r8 r la4 r8 r4.

}


IIIvlan = \relative do' {

    r8
    re4. re
    re fad
    fad sol
    la la
    la la
    la la\mbreak
    la sold
    fad mi
    mi r
    mi r
    mi r
    mi r
    mi4 mi8 fad4 sold8\mbreak
    mi4. r8 r mi
    mi4. r8 r mi
    mi4 mi8 fad4 sold8
    mi4 mi8 la,4 la8
    la4. r8 r  r\mbreak
    la4. la
    la dod
    re mi
    fad r8 r si,
    si4. dod
    la si
    sol fad\mbreak
    fad r8 r lad'
    si4 r8 r4.
    lad4 r8 r4.
    si4 r8 r4.
    lad4. r8 r lad
    si4 si,8 fad' sol fad
    re4. r8 r la
    sol4. re'\mbreak
    si mi
    re la'
    la la4 la,8
    la4. r
    la r
    la r
    la r8 r la'\mbreak
    la4 sol8 la si la
    fad4. r8 r la
    la4. r8 r la
    la4 sol8 la4 la8
    fad4la,8 la4 la8
    fad4. r8 r fad4 r8 r4.

}


IIIvcn = \relative do {

    la'8
    re la re re la re
    re4. re,8. mi16 fad sol
    la8 fad la sol mi sol

    %4
    fad sol16 fad mi re mi8 la la,
    re fad4 mi8 sol4
    fad8 sol16 fad mi re mi8 la, mi'\mbreak

    %7
    fad sol16 fad mi fad sold8 la16 sold fad sold
    la8 si16 la sold la si8 dod16 si la sold
    la8 la, la' la la, la'

    %10
    mi' mi, mi' mi mi, mi'
    la, la, la' la la, la'
    mi' mi, mi' mi mi, mi'

    %13
    la,4 dod,8 re4 mi8\mbreak
    la, dod'16 si la sold la8 dod mi,
    la, dod'16 si la sold la8 dod mi,

    %16
    la,4 dod8 re4 mi8
    la4 la,8 la4 la'8
    la4. r8 r \clef tenor \key re\major  la'\mbreak

    %19
    la mi la la mi la
    la4. la,8. dod16 re mi
    fad8 re fad mi dod mi

    %22
    re fad16 mi re dod re8 si re
    \clef bass \key re\major mi, mi' mi la,, la' la
    re, re' re sol,, sol' sol

    %25
    dod, dod' dod fad,, fad' fad\mbreak
    si,4. r8 r fad'
    si re16 dod re8 re, re'16 dod re8

    %28
    fad, lad16 sold lad8 dod lad16 sold lad8
    si re16 dod re8 re, re'16 dod re8
    fad, lad16 sold lad8 dod lad16 sold fad8

    %31
    re4 mi8 fad  mi fad
    si,4. r8 r fad'
    sol si4 la8 do4\mbreak

    %34
    \clef tenor \key re\major si8 do16 si la si dod8 re16 dod si dod
    re8 fad4 mi8 sol4
    fad8 sol16 fad mi re mi8 dod la

    %37
    \clef bass \key re\major  re re, re' re re, re'
    la la, la' la la, la'
    re re, re' re re, re'

    %40
    la la, la' la la, la'\mbreak
    re,4 si'8 la sol la
    re,8\clef tenor \key re\major fad'16 mi re dod re8 fad la,

    %43
    re, fad'16 mi re dod re8 fad la,
    re,4 si'8 la sol la
    \clef bass \key re\major re,4 re,8 re4 re'8

    %46
    re4. r8 r re4 r8 r4.

}

IIIbcn = \relative do {

    r8
    re4. mi
    fad si
    fad mi

    %4
    re la'
    fad la
    re la\mbreak

    %7
    re, mi
    fad sold
    la r

    %10
    mi r
    la, r
    mi' r

    %13
    la4 dod,8 re4 mi8\mbreak
    la,4. r8 r mi'
    la,4. r8 r mi'

    %16
    la,4 dod8 re4 mi8
    la4 la,8 la4 la'8
    la4. r8 r r

    %19
    la,4. si
    dod fad
    re dod

    %22
    si r8 r si'
    mi,4. la
    re, sol

    %25
    dod, fad\mbreak
    si, r8 r fad
    si4. r

    %28
    fad' r
    si, r
    fad' r8 r fad

    %31
    re4 mi8 fad mi fad
    si,4. r8 r re
    si4. fad\mbreak

    %34
    sol la
    fad' dod
    re la'4 dod,8

    %37
    re4. r
    la' r
    re, r

    %40
    la' r8 r la\mbreak
    re,4 si'8 la sol la
    re,4. r8 r la'

    %43
    re,4. r8 r la'
    re,4 si'8 la sol la
    re,4 re,8 re4 re'8

    %46
    re4. r8 r re4 r8 r4.

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown


}

forma = {

    \time 6/8
    \tempo 4. = 80
    \partial 8 s8
    s2.*17
    s4. s4 \bar ":..:"\break
    \repeat volta 2 {s8
    s2.*27}
    \alternative {{s4. s4}{s4 s8 s4.}}
    \bar"|."

}


IIIvl = {
    \IIIglobal
    %\notypeset
    <<\IIIvln \forma>>
}


IIIobaI = {
    \IIIglobal
    <<\IIIobaIn \forma>>
}


IIIobaII = {
    \IIIglobal
    <<\IIIobaIIn \forma>>
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


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}
#(set-global-staff-size 17.5)


\pointAndClickOff

\header {
    title = \markup\smaller"Concerto [TWV 53:D3]"
    %subsubtitle = #(string-append " ")
    composer = \markup \center-column{"G. P. Telemann (1681-1767)"}
		}

\paper  {

    systems-per-page = 3
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge{ "[1.] [Allegro]"}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
    } <<

        \new Staff <<
            \set Staff.instrumentName = \markup\center-column\tiny {"Violini"\vspace #-0.4"unis[oni]"}
            \set Staff.midiInstrument = #"violin"
            \Ivl
            \key re\major
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major\time 4/4  fa'8[la']^\markup \right-align\column\tiny{"    Oboe"\vspace #-0.4"d'Amore 1."}}
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \IobaI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major\time 4/4  fa'8[la']^\markup \column\right-align\tiny{"Oboe    "\vspace #-0.4"d'Amore 2."}}
                \set Staff.midiInstrument = #"oboe"
                \clef violin
                \IobaII
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"Viola"}
            \set Staff.midiInstrument = #"viola"
            \Ivla
            \key re\major
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \Ivc
            \key re\major
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }<<
            \set Staff.instrumentName = \markup  \center-column{"Cembalo"}
            \set Staff.midiInstrument = #"contrabass"
            \Ibc
            \key re\major
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 2\cm


        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge{ "[2.] Dolce"}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvl
            \key re\major
        >>

        \new PianoStaff <<

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \IIobaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \clef violin
                \IIobaII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
            \key re\major
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIvc
            \key re\major
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }<<
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
            \key re\major
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge{ "[3.] Allegro"}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvl
            \key re\major
        >>

        \new PianoStaff <<

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \IIIobaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \clef violin
                \IIIobaII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
            \key re\major
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIIvc
            \key re\major
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }<<
            \set Staff.midiInstrument = #"contrabass"
            \IIIbc
            \key re\major
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
