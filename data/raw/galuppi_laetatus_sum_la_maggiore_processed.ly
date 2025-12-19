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



IvlIn = \relative do'' {

    r8 la dod mi la4 sold8 si
    la la, dod mi la4 sold8 si
    la la, r mi' fad fad, fad [fad']

    %4
    mi mi, mi[mi'] re4 dod8. si16
    si4 r8 si dod dod16 re mi8 fad16 sold
    la8 mi16 dod la8 dod16 si\mbreak dod la dod la mi' dod mi dod

    %7
    la' mi la mi si' mi, si' mi, dod' si la sold la8 la,
    dod4 si8. la16 la8 la' mi dod
    la la mi dod \parenthesize la4 r

    %10
    r2 r8 la' dod mi
    la4 sold8 si la4 r
    r2 r8 mi la mi\mbreak

    %13
    mi4 mi mi8 mi la mi
    mi4 mi mi8 mi la mi
    fad4 la fad la

    %16
    r8 mi mi mi mi4 re
    re dod8 dod dod4 si
    si r r8 mi sold mi\mbreak

    %19
    mi4 mi8 mi mi4. red8
    mi mi, sold si mi4 red8 fad
    mi mi, sold si mi4 red8 fad

    %22
    mi sold la si la4 sold8 la
    si4 la sold8 si mi, sold
    la4 la\mbreak sold la8 la

    %25
    la4 sold la8 la, dod[mi]
    la4 sold8 si la8 la, r mi'
    la la, la la' mi mi, mi mi'

    %28
    re4 dod8. si16 si4 r8 si
    dod dod16 re mi8 fad16 sold la8 mi16 dod la8 dod16 si
    dod la dod la mi' dod mi dod\mbreak la' mi la mi si' mi, si' mi,

    %31
    dod' si la sold la8 la, dod4 si8. la16
    la8 la' mi dod la la mi dod
    la4 r r r8 la''

    %34
    re,16 mi fad sol? la sol la sol fad sol la sol fad8 r
    R1*2
    r2 r4 r8 mi

    %38
    fad16 fad re re sol sol mi mi la la fad fad si si dod dod
    re la fad la re,4 r2
    R1

    %41
    r2\mbreak dod16 si la sol fad mi re dod
    re4 r r2
    R1*3 %% fine p 11

    %46
    r4 r8 mi' fad16 re fad re la' fad la fad
    re' la fad la re,4 r2
    R1

    %49
    r8 re' la fad re re la fad
    re4 r8 fad' sol4 mi
    fad8 re' la fad re re la fad\mbreak

    %52
    re4 r8 fad' sol4 mi
    fad re8 re mi4 dod
    re dod8 re mi4 re

    %55
    dod8 fad, lad dod fad fad mi fad16 mi
    re4 fad fad fad
    r8 fad mi16 fad mi fad mi4 mi\mbreak

    %58 p. 14
    mi mi mi8 mi la[mi]
    la la si si16 si la4 si
    sold8[la la8. sold16] la8 la, dod mi

    %61
    la mi mi4 r8 mi la dod
    re la la4 r8 la[re la16 fad]\mbreak
    mi8 fad mi fad  mi4 fad8 fad

    %64
    re re sol sol sol sol fad fad
    fad4. mi8 fad re fad la
    re4 dod re8 la16 sol fad  mi re dod

    %67
    si re dod mi re la mi' la, fad' la, sol' la, la'8 sol16 fad
    mi4 fad fad mi8. re16
    re4 r r2\mbreak

    %70
    R1
    r2 r4 r8 re
    re,16 mi fad sol la si dod la re  mi fad sol la si dod la

    %73
    re8 dod16 si la8 sol fad4 mi8. re16
    re4 r r2\mbreak
    R1

    %76
    r2 r4 r8 la'
    re la fad4 r2
    r r4 r8 mi

    %79
    la mi dod4 r2
    r4 r8 mi\mbreak mi dod r4
    r8 la' si re, r sold la dod,

    %82
    r fad mi si' r2
    R1
    r2 r8 mi, mi8. fad32 mi

    %85
    mi8 la sold8. la32 sold la8 la, r4
    R1*2
    r2 r4 si8 si'

    %89
    lad dod si lad si4. lad8
    si si, re fad si4 lad
    si8 fad16 mi fad mi re fad\mbreak sol fad sol fad mi re mi re

    %92
    dod4 re re~re8. mi32(dod)
    si4 r r2
    r4 r8 fad' fad  mi16 re dod8 si

    %95
    la si dod4 r2
    R1
    r4 r8 fad dod' dod dod16 si dod si

    %98
    la8 sold la4 r2
    R1*4
    mi16 si' sold mi red mi fad red mi fad sold mi fad sold la fad

    %104
    sold la si sold mi4 r2
    R1*3
    r2 r8 mi sold si

    %109
    sold4 fad8 red mi16 si sold si mi, mi' mi red
    dod red red mi mi fad fad sold sold la la si si dod dod fad,\mbreak
    fad4 r8 sold la4 sold8. fad16

    %112
    fad4 sold sold fad8. mi16
    mi2 r8 mi, sold si
    mi si sold mi mi' mi, r4

    %115
    R1
    r8 la dod mi la mi dod la
    la' la, r4 r2\mbreak

    %118
    r2 r8 re fad la
    re si fad re re' re, r4
    r2 r4 re'8 re,

    %121
    r4 re8 re, r4 r8 fad'
    mi2 mi
    la8 la, r4 la8 la, r4

    %124
    r mi''4 mi4. mi8\mbreak
    re8 fad re fad re4 re
    dod8. dod16 dod4 r8 fad fad16 mi fad mi

    %127
    re4 r r8 mi mi16 re mi re
    dod4 r r8 re fad16 sol fad sol
    la8. sol16 fad8 fad mi4 mi8 mi\mbreak

    %130
    mi mi dod16 re dod re mi4 r
    la r la r
    r8 la mi dod la la mi dod

    %133
    la4 mi''8 fad mi4 mi8 mi
    fad re' la fad re re la fad
    re4 fad'8 fad mi4 mi8 mi\mbreak

    %136
    fad re fad la re4 fad,,
    mi4. mi8 fad2\fermata

}

IvlIIn = \relative do'' {

    dod4 r r8 dod si mi
    dod4 r r8 dod si mi
    dod4 r8 dod re8 re, re[re']

    %4
    dod dod, dod[dod'] si4 la8. sol16
    sold?4 r8 sold la la16 si dod8 re16 si
    dod8 dod16 mi dod8 la16 sold\mbreak la dod la dod dod mi dod mi

    %7
    mi la mi la mi si' mi, si' la8. re,16 mi re dod si
    la4 sold la2~
    la8 la mi dod la4 r

    %10
    r2 dod'4 r
    r8 dod si mi dod4 r
    r2 r8 dod dod dod\mbreak

    %13
    si4 si dod8 dod dod dod
    si4 si dod8 dod mi dod
    re4 mi re mi

    %16
    r8 dod si si la4 la
    si la8 la la4 sold
    sold? r r8 si si si\mbreak

    %19
    dod4 si8 si si4. si8
    si4 r r8 sold fad si
    si4 r r8 sold fad si

    %22
    si mi re si dod4 si8 dod
    re4 dod si r8 mi
    mi4 re\mbreak re dod8 dod

    %25
    si4. si8 dod4 r
    r8 dod si mi dod4 r8 dod
    re re, re re' dod dod, dod dod'

    %28
    si4 la8. sold16 sold4 r8 sold
    la8 la16 si dod8 re16 si dod8 dod16 mi dod8 la16 sold
    la dod la dod dod mi dod mi\mbreak mi la mi la mi si' mi, si'

    %31
    la8. re,16 mi re dod si la4. sold8
    la la' mi dod la la mi dod
    la4 r r r8 dod'

    %34
    si re mi mi re16 mi fad mi re8 r
    R1*2
    r2 r4 r8 dod

    %38
    re16 re si si mi mi dod dod fad fad re re sol sol mi mi
    fad4 fad r2
    R1

    %41
    r2 la,16 sol fad mi re dod si la
    si4 r r2
    R1*3

    %46
    r4 r8 dod' re16 fad re fad fad la fad la
    fad fad la fad fad4 r2
    R1

    %49
    r8 re' la fad re re la fad
    re4 r8 re' mi4 dod
    re8 re' la fad re re la fad\mbreak

    %52
    re4 r8 re' mi4 dod
    re si8 si dod4 lad
    si lad8 si dod4 si

    %55
    lad r r8 lad si dod
    si4 dod re dod
    r8 re si[si] dod4 si\mbreak

    %58
    dod si dod8 dod dod [dod]
    re re re re16 re dod4 re
    si8 dod si4 dod8 la dod mi

    %61
    la dod, si4 r8 dod mi la
    la re, mi4 r8 fad[la fad16 re]\mbreak
    dod8 re dod re dod4 re8 re

    %64
    si si mi mi mi mi re re
    re4. dod8 re re fad la
    fad4 mi fad8. mi16 re4

    %67
    re8 sol, la la la[la re mi16 re]
    dod4 re re4. dod8
    re4 r r2\mbreak

    %70
    R1
    r2 r4 r8 la
    fad4 mi8 la si re dod[mi]

    %73
    re4. re8 re4. dod8
    re4 r r2\mbreak
    R1

    %76
    r2 r4 r8 fad
    fad sol la4 r2
    r r4 r8 dod,

    %79
    dod dod mi4 r2
    r4 r8 si\mbreak dod la r4
    r r8 sold' mi mi, r fad'

    %82
    re si r mi mi dod r4
    R1
    r2 r8 dod si4

    %85
    dod8 mi mi4 mi r
    R1*2
    r2 r4 mi8 sol

    %89
    fad4 r8 fad fad4 fad
    re8 si re fad re4 dod
    re8 re16 dod re dod si re\mbreak mi re mi re dod si dod si

    %92
    lad4 si si4. lad8
    si4 r r2
    r4 r8 dod re dod16 si la8 sold

    %95
    fad sold la4 r2
    R1
    r4 r8 la' sold16 fad sold fad sold4

    %98
    fad8. mid16 fad4 r2
    R1*4
    si,8 si la[la]  si si si si

    %104
    si4 si r2
    R1*3
    r2 si4 r

    %109
    r8 mi red fad sold4 r8 si,
    la la si si si mi mi mi\mbreak
    red4 r8 mi fad4 mi8 red

    %112
    red?4 mi mi4. red!8
    mi2 r8 mi, sold si
    mi si sold mi mi' mi, r4

    %115
    R1
    r8 la dod mi la mi dod la
    la' la, r4 r2\mbreak

    %118
    r r8 re fad la
    re si fad re re' re, r4
    r2 r4 re'8 re,

    %121
    r4 re8 re, r4 r8 re'
    re2 dod
    la'8 la, r4 la8 la, r4

    %124
    r dod' dod4. dod8\mbreak
    si8 dod si dod si4 si
    lad8. lad16 lad4 r8 dod dod dod

    %127
    fad,4 r r8 si si si
    la?4 r r8 fad' re16 mi re mi
    fad8. mi16 re8 re re4 re8 re\mbreak

    %130
    dod8 dod la16 si la si dod4 r
    dod r dod r
    r8 la' mi dod la la mi dod

    %133
    la4 dod'8 re re4 dod8 dod
    re si' la fad re re la fad
    re4 re'8 re re4 dod8 dod\mbreak

    %136
    re re fad la re4 re,,
    re4. dod8 re2\fermata

}

Ivlan = \relative do' {

    mi4 r r8 mi mi sold
    mi4 r r8 mi mi sold
    mi4 r8 la la4 r8 la

    %4
    la4 r8 la fad4 fad
    sold8 sold16 la si8 sold mi4 la
    mi mi\mbreak mi mi

    %7
    dod mi mi8. si'16 la8 mi
    mi4 mi mi2~
    mi8 la mi dod la4 r

    %10
    r2 mi'4 r
    r8 mi mi sold mi4 r
    r2 r8 la mi la\mbreak

    %13
    si4 sold la8 la mi la
    si4 sold la8 la dod la
    la4 dod la dod

    %16
    r8 la mi mi mi4 mi
    si' mi,8 mi mi4 mi
    mi r r8 sold mi sold\mbreak

    %19
    la4 sold8 sold fad4. fad8
    sold4 r r8 si si fad
    sold4 r r8 si si fad

    %22
    sold si la mi mi4 mi8 mi
    fad4 mi mi r8 si'
    fad4 fad\mbreak mi mi8 mi

    %25
    mi4. mi8 mi4 r
    r8 mi mi sold mi4 r8 la
    la4 r8 la la4 r8 la

    %28
    fad4 fad sold8 sold16 la si8 sold
    mi4 la mi mi
    mi mi\mbreak dod mi

    %31
    mi8. si'16 la8 mi mi4 mi
    mi r r8 la mi dod
    la4 r r r8 mi'

    %34
    re8 si' la4 la r
    R1*2
    r2 r4 r8 la

    %38
    la si si[dod] dod re si[la]
    la4 la r2
    R1

    %41
    r2\mbreak mi4 fad
    fad r r2
    R1*3

    %46
    r4 r8 la la4 la
    la la r2
    R1

    %49
    r2 r8 re la fad
    re4 r8 la' si4 la
    la r r8 re la fad\mbreak

    %52
    re4 r8 la' si4 la
    la sol8 sol sol4 fad
    fad fad8 fad sol4 fad

    %55
    fad r r8 fad si, fad'
    fad4 fad si fad
    r8 fad sold mi la4 mi\mbreak

    %58
    la mi la8 la mi [la]
    la fad re[si'] mi,4 fad
    mi8 mi mi4 mi r

    %61
    r8 la mi4 r8 la dod mi,
    fad4 mi r8 re[fad re16 la']\mbreak
    la8 la la la la4 la8 la

    %64
    sol sol si si la la la la
    la2 la4 r
    r8 la la4 la la

    %67
    sol8 sol re la' fad mi re si'
    mi, la la4 la4. la8
    la4 r r2\mbreak

    %70
    R1
    r2 r4 r8 fad
    la4 la8 mi fad4 fad8 sol

    %73
    la4. si8 la4 la
    la r r2\mbreak
    R1

    %76
    r2 r4 r8 re,
    la' re, fad4 r2
    r r4 r8 la

    %79
    mi la la4 r2
    r4 r8 mi\mbreak la mi r4
    r8 mi fad sold r dod, mi la

    %82
    r re, si mi dod mi r4
    R1
    r2 r8 la mi4

    %85
    la8 dod si4 dod r
    R1*2
    r2 r4 mi,8 mi

    %89
    dod4 re8 fad re4. dod8
    re4 r r8 fad fad4
    fad r8 si\mbreak si4 sol8. si16

    %92
    fad4 fad fad4. fad8
    fad4 r r2
    r4 r8 la si8. fad16 fad8. mid16

    %95
    fad4 fad r2
    R1
    r4 r8 dod dod4 dod

    %98
    dod dod r2
    R1*4
    sold'8 sold fad fad mi mi si[fad']

    %104
    mi8. si'16 sold4 r2
    R1*3
    r2 sold4 r

    %109
    r8 si si si si4 r8 mi,
    mi fad mi[si] mi8. si16 mi8 la\mbreak
    fad4 r8 mi red4 mi

    %112
    si' si si4. si8
    sold2 r
    r r8 mi fad sold

    %115
    la mi dod la la' la, r4
    R1
    r8 la' si dod re la fad re\mbreak

    %118
    re' re, r4 r2
    r r8 re fad la
    re la fad re re' re, r4

    %121
    re'8 re, r4 re8 re, r la''
    si2 mi,
    r4 la8 la, r4 la'8 la,

    %124
    r4 la' mi4. fad8\mbreak
    fad lad fad lad fad4 sold
    lad8. fad16 fad4 r8 fad fad fad

    %127
    si4 r r8 sol sol sol
    mi4 r r8 la la16 sol la sol
    fad8. sol16 la8 la si4 si8 si\mbreak

    %130
    la la mi[mi] mi4 r
    mi r mi r
    r2 r8 la mi dod

    %133
    la4 la'8 la la4 la8 la
    la4 r r8 re la fad
    re4 la'8 la la4 la8 la\mbreak

    %136
    la4 r r la,
    la4. la8 la2\fermata

}

Isopranon = \relative do'' {

    \autoBeamOff
    R1*8
    r2 r8 dod la[si]
    dod4 re dod r

    %11
    r2 r8 dod la[si]
    dod4 re dod r8 dod\mbreak
    si4 si dod r8 dod

    %14
    si4 si dod r8 dod
    re4 dod re dod
    r8 dod si si la4 la

    %17
    si la8 la la4 sold
    r2 r8 si si si\mbreak
    dod4 si8 si si4. si8

    %20
    si2 r
    R1
    r8 sold la si la4 sold8 la

    %23
    si4 la sold r8 sold
    la4 la\mbreak sold la8 la
    la4 sold la2

    %26
    R1*24
    r4 r8 la si4 la
    la r r2\mbreak

    %52
    r4 r8 la si4 la
    la si8 si dod4 lad
    si lad8 si dod4 si

    %55
    lad2 r
    re4 dod8 dod si re dod dod16 dod
    si8 si r4 la si8 si\mbreak

    %58
    la dod si si16 si la8 la r dod
    la la si si16 si la4 si
    sold8 la la8.[sold16] la4 r

    %61
    r r8 si16 si dod8 la r4
    r r8 la16 la re8 la r re\mbreak
    dod re dod re dod4 re8 re

    %64
    si4 mi mi re
    re4.(dod8) re2
    R1*47

    %113
    r4 si mi2~
    mi~mi~
    mi mi

    %116
    R1*2\mbreak
    r4 la, re2~
    re~ re~

    %120
    re re
    r r4 r8 re
    re2 dod

    %123
    R1
    r4 dod dod4. dod8\mbreak
    si8 lad si lad si4 si

    %126
    lad8. lad16 lad4 r2
    r8 si si16[re] dod[re] mi8. mi16 mi4
    r8 dod la16[dod] si[dod] re8. re16 re4

    %129
    r re8 re re4 re8 re\mbreak
    dod4 r r8 dod la16[si] la[si]
    dod8. dod16 dod8 la16 si dod8. dod16 dod4

    %132
    R1
    r4 dod8 re re4 dod8 dod
    re4 r r2

    %135
    r4 la8 la la4 la8 la\mbreak
    la2 r
    R1

}

ItestoI = \lyricmode {

    Laeta - - tus sum laeta - - tus sum lae -- tatus _ sum lae -- tatus _ sum in his quae dic  -- ta

    in his quae dic  -- ta dic  -- ta sunt mi -- hi: in domum _ Do -- mini _  ibi - mus

    in domum _ Do -- mini _  ibi - mus in domum _ Do -- mini _  ibi - mus.

    Jeru - sa -- lem Jeru - sa -- lem

    quae_e _ -di -- fi -- catur _ ut civi - tas: cu -- jus parti - ci -- pa -- tio _ eius _

    cu -- jus par -- tici - pa -- tio _ eius _  par -- tici - pa -- tio _ eius _ in idip - sum

    in idip - sum in idip - sum cu -- jus par -- tici - pa -- tio _ eius _

    in i -- dip -- sum.

    Ro -- ga -- te Ro -- ga -- te Ro -- ga -- te Ro -- ga -- te

    quae ad pacem _ sunt Je -- rusa - lem: et abun - dan -- tia _ et abun - dan -- tia _

    dili - gen -- tibus _ te et abun - dan -- tia _ abun - dan -- tia _

    dili - gen -- tibus _ te dili - gen -- tibus _ te.

}

Ialton = \relative do' {

    \autoBeamOff
    R1*9
    r8 la' la la la4 r
    R1

    %12
    r8 la la la la4 r8 la\mbreak
    si4 sold la r8 la
    mi4 sold la r8 la

    %15
    la4 la la la
    r8 la mi mi la4 fad
    si mi,8 mi mi[fad] sold4

    %18
    r2 r8 sold sold sold\mbreak
    la4 sold8 sold fad4. fad8
    sold2 r

    %21
    R1
    r8 si la mi mi4 mi8 mi
    fad4 mi8[fad] sold4 r8 si

    %24
    la4 fad\mbreak mi mi8 mi
    mi4. mi8 mi2
    R1*7

    %33
    r4 la8. mi16 fad4 mi
    r2 r4 re8. mi16
    fad4 sol la8[sol16 la] si[la si la]

    %36
    sol8[fad16 sol] la[sol la sol]\mbreak fad4 mi
    fad16[sol fad sol] \parenthesize la4 sol16[fad] mi[re] mi4
    R1

    %39
    \parenthesize r4 la8 fad re4 si'8 sol
    mi4 la8 fad re4 sol8 mi
    fad4. mi16[re]\mbreak dod4 r8 la'

    %42
    re16[dod si la] sol[fad mi re] la'[sol la si] la[si la sol]
    fad[sol fad mi] re[la' sol la] si[la si la] sol[si la sol]
    la[sol la sol] fad[la sol fad] sol[fad sol fad] mi[sol fad mi]

    %45
    fad8[mi16 fad] sol[la] si[dod] re8[dod16 si] la8 sol\mbreak
    fad4 mi8.[re16] re4 r
    r r8 la' si4. la16 sol

    %48
    la4 re,8 sol fad4 mi8.[re16]
    re2 r
    r4 r8 fad sol4 mi

    %51
    fad r r2\mbreak
    r4 r8 fad sol4 mi
    fad re8 sol sol4 fad

    %54
    fad fad8 fad sol4 fad
    fad2 r
    fad4 fad8 fad fad fad fad fad16 fad

    %57
    fad8 fad r4 mi mi8 mi\mbreak
    mi mi mi mi16 mi mi8 mi r mi
    fad la re, si'16 si mi,4 fad

    %60
    mi8 mi mi4 mi r
    r r8 mi16 mi la8 mi r4
    r r8 mi16 la la8 fad r la\mbreak

    %63
    la la la la la4 la8 la
    si4 sol8[si] la4 la
    la2 la

    %66
    R1*49
    r2 r4 mi
    la2~\parenthesize la~

    %117
    la~la
    la r
    R1*2

    %121
    r2 r4 r8 la
    si2 mi,
    R1

    %124
    r4 la mi4. fad8\mbreak
    fad fad fad fad fad4 sold
    lad8. fad16 fad4 r2

    %127
    r8 fad si si si8. si16 si4
    r8 la mi la la8. la16 la4
    r la8 la si4 si8 si\mbreak

    %130
    la4 r r8 la mi mi
    la8. la16 la8 mi16 mi la8. la16 la4
    R1

    %133
    r4 la8 la la4 la8 la
    la4 r r2
    r4 fad8 fad mi4 mi8 mi\mbreak

    %136
    fad2 r
    R1

}

ItestoII = \lyricmode {

    Laeta - tus sum laeta - tus sum lae -- tatus _ sum lae -- tatus _ sum in his quae dic  -- ta

    in his quae dic  -- ta dic  -- ta sunt mi -- hi: in domum _ Do -- mini _  ibi - mus

    in domum _ Do -- mini _  ibi - mus in domum _ Do -- mini _  ibi - mus.

    Stantes _ erant _  stantes _ e -- rant pe - - - - des pe -  des nostri _

    pedes _ no -- stri in a -- trijs _ tuis, _

    Je -- ru -- sa -- lem, in a - - - - - - - - - - - - trijs _ tuis, _ Je -- ru -- salem _

    in a -- trijs _ tu -- is, Je -- ru -- sa -- lem Jeru - sa -- lem Jeru - sa -- lem

    quae_e _ -di -- fi -- catur _ ut civi - tas: cu -- jus parti - ci -- pa -- tio _ eius _

    cu -- jus par -- tici - pa -- tio _ eius _  par -- tici - pa -- tio _ eius _ in idip - sum

    in idip - sum in idip - sum cu -- jus par -- tici - pa -- tio _ eius _

    in i -- dip -- sum.

    Ro -- ga -- te Ro -- ga -- te Ro -- ga -- te

    quae ad pacem _ sunt Je -- rusa - lem: et abun - dan -- tia _ et abun - dan -- tia _

    dili - gen -- tibus _ te et abun - dan -- tia _ abun - dan -- tia _

    dili - gen -- tibus _ te dili - gen -- tibus _ te.

}

Itenoren = \relative do' {

    \autoBeamOff
    R1*8
    r2 r8 mi dod[re]
    mi4 fad mi r

    %11
    r2 r8 mi dod[re]
    mi4 fad mi r8 mi\mbreak
    mi4 mi mi r8 mi

    %14
    mi4 mi mi r8 mi
    fad4 mi fad mi
    r8 mi mi mi mi4 re

    %17
    re dod8 dod dod4 si
    r8 mi, sold si mi2~
    mi4 mi8 mi mi4. red8

    %20
    mi2 r
    R1
    r8 mi re mi dod4 si8 dod

    %23
    re4 dod si r8 mi
    mi4 re\mbreak re dod8 dod
    si4. si8 dod2

    %26
    R1*24
    r4 r8 re mi4 dod
    re r r2\mbreak

    %52
    r4 r8 re mi4 dod
    re re8 re mi4 dod
    re dod8 re mi4 re

    %55
    dod2 r
    si4 fad'8 mi re si fad' fad16 mi
    re8 re r4 dod mi8 re\mbreak

    %58
    dod la mi' mi16 re dod8 dod r mi
    re re re re16 re dod4 re
    si8 dod si4 dod r

    %61
    r r8 mi16 mi mi8 dod r4
    r r8 mi16 mi fad8 re r fad\mbreak
    mi fad mi fad mi4 fad8 fad

    %64
    re4 sol sol fad
    fad4.(mi8) re2
    R1*3

    %69
    re8. si16 re8 dod re4 mi\mbreak
    fad8.[mi16] re[dod si la] si8.[dod16] re[mi fad sol]
    dod,8.[re16] mi[fad sol la] fad8[mi] re4

    %72
    R1*2
    re8. la16 re8 dod re4 mi\mbreak
    fad8.[mi16] re[dod si la] si8.[dod16] re[mi fad sol]

    %76
    dod,8.[re16] mi[fad sol la] fad8[mi] re4
    r la8 la re4. mi8
    fad mi re mi16[re] dod8. si16 la4

    %79
    r la8 dod mi4  mi8 sold,
    la8. la16 si4\mbreak r8 dod la mi
    fad4 re'8.[dod32 re] mi,4 dod'8.[si32 dod]

    %82
    re,4 si' dod8.[si32 la] re8.[dod32 si]
    mi8.[re32 dod] fad8.[mi32 re] sold8.[fad32 mi] la8 la,
    dod4 si8.[la16] la4 r

    %85
    r2 r8 la dod mi
    fad4 re\mbreak si8.[dod32 si] dod8.[re32 dod]
    re8.[mi32 re] mi8.[fad32 mi] fad8.[mi32 re] dod8 [si]

    %88
    sold16[dod si re] dod[mi re fad] mi8[re] mi4~
    mi re8 dod re4. mi16[dod]
    si4 r r2

    %91
    R1*22
    r4 si mi2~
    mi~mi~

    %115
    mi mi
    R1*2\mbreak
    r4 la, re2~

    %119
    re~re~
    re re
    r2 r4 r8 fad

    %122
    mi2 mi
    R1
    r4 mi mi4. mi8\mbreak

    %125
    re8 dod re dod re4 re
    dod8. dod16 dod4 r2
    r8 re re16[fad] mi[fad] sol8. sol16 sol4

    %128
    r8 mi dod16[mi] re[mi] fad8. fad16 fad4
    r fad8 fad mi4 mi8 mi\mbreak
    mi4 r r8 mi dod16[re] dod[re]

    %131
    mi8. mi16 mi8 dod16 re mi8. mi16 mi4
    R1
    r4 mi8 fad mi4 mi8 mi

    %134
    fad4 r r2
    r4 re8 re re4 dod8 dod\mbreak
    re2 r

    %137
    R1

}

ItestoIII = \lyricmode {

    Laeta - - tus sum laeta - - tus sum lae -- tatus _ sum lae -- tatus _ sum in his quae dic  -- ta

    in his quae dic  -- ta dic  -- ta sunt mi -- hi: in domum _ Do -- mini _  ibi - mus

    in domum _ Do -- mini _  ibi - mus in domum _ Do -- mini _  ibi - mus.

    Jeru - sa -- lem Jeru - sa -- lem

    quae_e _ -di -- fi -- catur _ ut civi - tas: cu -- jus parti - ci -- pa -- tio _ eius _

    cu -- jus par -- tici - pa -- tio _ eius _  par -- tici - pa -- tio _ eius _ in idip - sum

    in idip - sum in idip - sum cu -- jus par -- tici - pa -- tio _ eius _

    in i -- dip -- sum.

    Illuc _ enim _ a -- scen -- de - - - - - - runt illuc _ enim _ a -- scen -- de - - - - - - runt

    ascen - derunt _ tribus, _ tribus _ Domi - ni: testi - mo -- nium _ Isra - el,

    ad confi - ten - - - - dum no - - - - mini _ Do -- mi -- ni

    ad confi - tendum _ no - - - - - - - - - mini _ Do -- mi -- ni.

    Ro -- ga -- te Ro -- ga -- te Ro -- ga -- te Ro -- ga -- te

    quae ad pacem _ sunt Je -- rusa - lem: et abun - dan -- tia _ et abun - dan -- tia _

    dili - gen -- tibus _ te et abun - dan -- tia _ abun - dan -- tia _

    dili - gen -- tibus _ te dili - gen -- tibus _ te.



}

Ibasson = \relative do {

    \autoBeamOff
    R1*9
    r8 la' fad re la'4 r
    R1

    %12
    r8 la fad re la'4 r8 la\mbreak
    sold4 mi la r8 la
    sold4 mi la r8 la

    %15
    re,4 la' re, la'
    r8 la sold sold fad4 fad
    sold la8 la mi4 mi

    %18
    r2 r8 mi mi mi\mbreak
    la4 mi8 mi si'4 si,
    mi2 r

    %21
    R1
    r8 mi fad sold la4 mi8 la
    re,4 la' mi r8 mi

    %24
    fad [mi] fad [si,]\mbreak mi4 la8 la,
    mi'4. mi8 la2
    R1*7

    %33
    r4 la8. dod16 re4 dod
    R1
    r2 r4 re,8. fad16

    %36
    mi4 mi\mbreak re16 [mi fad sol] la [si dod la]
    re4 fad,8[sol] la4 la,
    R1

    %39
    r2 re'8 si sol [mi]
    dod' la fad re si' [sol] mi dod
    re [mi] fad [sol]\mbreak la4 r

    %42
    r4 r8 re, mi8.[re16] dod8.[mi16]
    re[mi re mi] fad[fad mi fad]sol[fad sol fad] mi[sol fad mi]
    fad[mi fad mi] re[fad mi re] mi[re mi re] dod[mi re dod]

    %45
    re8[dod16 re] mi8 sol fad4 fad8 sol\mbreak
    la4. la,8 re4 r
    r r8 fad sol[fad] sol mi

    %48
    fad[sol16 la] si8 sol la4. la,8
    re2 r
    r4 r8 re sol4 la

    %51
    re, r r2\mbreak
    r4 r8 re sol4 la
    re, sol8 sol mi4 fad

    %54
    si, fad'8 si, mi4 si
    fad'2 r
    si4 lad8 lad si si lad lad16 lad

    %57
    si8 si r4 la sold8 sold\mbreak
    la la sold sold16 sold la8 la r la
    fad fad sold sold16 sold la4 re,

    %60
    mi8 la mi4 la, r
    r r8 sold'16 sold la8 la r4
    r r8 la16 mi re8 re r mi\mbreak

    %63
    la8 re, la' re, la'4 fad8 fad
    sol[fad] mi[re] dod4 re
    la'2 re,

    %66
    R1*27
    r4 fad8 fad si4 dod8 si
    la[sold] fad4 r2

    %95
    r4 fad8 fad si4 dod8 si
    la[sold] fad4\mbreak sold8 fad mid16[sold] fad[sold]
    la8. sold16 fad4 r2

    %98
    r4 fad8 la si fad si la
    sold16[la fad sold] mi[si' la si] dod[si dod si] la[si sold la]
    si[la si la] sold[la fad sold] la[sold la sold] fad[sold mi fad]\mbreak

    %101
    sold[la sold la] si[mi, fad mi] red[mi red mi] fad[sold la si]
    sold[la fad sold] mi4~mi8[fad] si,8.[red16]
    mi4 r r2

    %104
    r4 mi8 fad sold la si mi,
    red16[mi red mi] fad[sold fad sold]\mbreak mi[fad mi fad] sold[la sold la]
    fad[sold fad sold] la[si la si] sold[la fad sold] mi4~

    %107
    mi8[red16 mi] fad[sold la si] sold[fad sold fad] mi4~
    mi si8.[red16] mi2
    R1*6

    %115
    r2 r4 mi
    la2~la~
    la~la\mbreak

    %118
    la r
    R1*2
    r2 r4 r8 re,

    %122
    sol4(sold) la2
    R1
    r4 la lad4. lad8\mbreak

    %125
    si fad si fad si4 mid,
    fad8. fad16 fad4 r2
    r8 si fad fad mi8. mi16 mi4

    %128
    r8 mi la mi re8. re16 re4
    r re8 re sol4 sold8 sold\mbreak
    la4 r r8 la la la

    %131
    la8. mi16 mi8 la16 la la8. mi16 la4
    R1
    r4 la8 re, la'4 la8 la

    %134
    re,4 r r2
    r4 re8 re la'4 la,8 la\mbreak
    re2 r

    %137
    R1

}

ItestoIV = \lyricmode {

    Laeta - tus sum laeta - tus sum lae -- tatus _ sum lae -- tatus _ sum in his quae dic  -- ta

    in his quae dic  -- ta dic  -- ta sunt mi -- hi: in domum _ Do -- mini _  ibi - mus

    in domum _ Do -- mini _  ibi - mus in domum _ Do -- mini _  ibi - mus.

    Stantes _ erant _  stantes _ e -- rant pe - - des nostri _ pedes _ no -- stri in atrijs _ tuis, _

    Je -- ru -- sa -- lem, in a - - - - - - - - - - trijs _ tuis, _ Je -- ru -- salem _

    in a -- trijs _ tu -- is, Je -- ru -- sa -- lem Jeru - sa -- lem Jeru - sa -- lem

    quae_e _ -di -- fi -- catur _ ut civi - tas: cu -- jus parti - ci -- pa -- tio _ eius _

    cu -- jus par -- tici - pa -- tio _ eius _  par -- tici - pa -- tio _ eius _ in idip - sum

    in idip - sum in idip - sum cu -- jus par -- tici - pa -- tio _ eius _

    in i -- dip -- sum.

    Quia _ illic _ se -- derunt _ quia _ illic _ se -- derunt _  sedes _  in ju -- dici - o,

    sedes _ super _ domum _ Da - - - - - - - - - - - - - - vid sedes _ super _ domum _

    Da - - - - - - - - - - -  vid.

    Ro -- ga -- te Ro -- ga -- te Ro -- ga -- te

    quae ad pacem _ sunt Je -- rusa - lem: et abun - dan -- tia _ et abun - dan -- tia _

    dili - gen -- tibus _ te et abun - dan -- tia _ abun - dan -- tia _

    dili - gen -- tibus _ te dili - gen -- tibus _ te.

}

Ibcn = \relative do {

    la'4 r r8 la mi' mi,
    la4 r r8 la mi' mi,
    la [la16 si dod8 la] re,[re16 mi fad8 re]

    %4
    la8[la16 si dod8 la] re4 red
    mi8 mi16 fad sold8 mi la4 la,
    la la'8. mi16\mbreak la,4 la

    %7
    la sold la8. si16 dod8. re16
    mi4 mi, la2~
    la8 la' mi dod la4 r

    %10
    r8 la' fad re la'4 r
    r8 la mi' mi, la4 r
    r8 la fad re la'4 r8 la\mbreak

    %13
    sold4 mi la r8 la
    sold4 mi la r8 la
    re,4 la' re, la'

    %16
    r8 la sold sold fad4 fad
    sold la8 la, mi'2~
    mi r8 mi mi mi\mbreak

    %19
    la4 mi si' si,
    mi2 r8 mi si' si,
    mi4 r r8 mi si' si,

    %22
    mi4 fad8 sold la4 mi8 la
    re,4 la' mi r8 mi
    fad mi fad[si,]\mbreak mi4 la8 la,

    %25
    mi'2 la,
    r8 la' mi' mi, la la16 si dod8 la
    re, re16 mi fad8 re la la16 si dod8 la

    %28
    re4 red mi8 mi16 fad sold8 mi
    la4 la, la la'8. mi16
    la,4 la\mbreak la sold

    %31
    la8.[si16 dod8. re16] mi4 mi,
    la2 r8 la' mi dod
    la4\soli r8 la' re,4 la'

    %34
    si dod re r
    re8 re, mi'[mi,] fad mi re4
    mi8 re dod4\mbreak re16 mi fad sol la si dod la

    %37
    re4 fad,8 sol la4 r8 la
    fad sol mi la fad si sol la
    re,4 r re'8 si sol mi

    %40
    dod' la fad re si' sol mi dod
    re mi fad sol\mbreak la4 r
    si r dod dod,

    %43
    re8. mi16 fad4 sol8. fad16 mi4
    fad8. mi16 re4 mi8. re16 dod4
    re mi fad4. sol8\mbreak

    %46
    la re, la' la, re4 re
    re r8 fad sol fad sol mi
    fad sol16 la si8 sol la re, la' la,

    %49
    re2 r
    r4 r8 re\tu sol4 la
    re, r r2\mbreak

    %52
    r4 r8 re sol4 la
    re, sol mi fad
    si, fad'8 si, mi4 si'8 si,

    %55
    fad'2 r8 fad sold lad
    si8 si,  lad4 si lad
    si8 si' sold4 la8 la, sold4\mbreak

    %58
    la sold la r8 la'
    fad4 sold la re,
    mi8 la, mi'4 la, r

    %61
    r8 la' sold4 la r8 la16 sol?
    fad4 dod re r8 re\mbreak
    la' re, la' re, la'4 fad

    %64
    sol8 fad mi re dod la re[re,]
    la'' sol la la, re2
    r8 re la' la, re mi fad4

    %67
    sol8 mi fad dod re mi fad sol
    la sol fad re la' sol la la,
    re4\soli\p r8 la'16 sol fad8 si la16 sol fad mi\mbreak

    %70
    re8 mi fad4 sol8[la si8. sol16]
    la8.[si16 dod8. la16] re4 r8 re
    re4 dod si la8 sol

    %73
    fad4. sol8 la4 la,
    re r8 la'16 sol fad8 si la16 sol fad mi\mbreak
    re8 mi fad4 sol8[la si8. sol16]

    %76
    la8[si dod8. la16] re4 r8 re
    re4 r8 re16 dod si8 la si dod
    re la si sol la4 r8 la

    %79
    la4 r8 la sold8 fad sold mi
    fad fad, sold' sold,\mbreak la' [la,16 si dod8 dod']
    re dod si si, dod' si la la,

    %82
    si' la sold sold, la'4 si
    dod re mi dod8 re
    mi la, mi' mi, la4 sold

    %85
    la mi la, r8 la'
    re, mi fad re\mbreak sol4 r8 lad,
    si4 r8 dod re4 r8 mi

    %88
    fad4 r sol8 fad sol mi
    fad lad si fad si si, fad'[fad,] %% OOKK fine p. 19
    si4 r r8 si fad' fad,

    %91
    si4 r8 si'\mbreak mi,4 r8 mi
    fad8 fad, si'[si,] fad' mi fad fad,
    si4 si'8 la sold fad mid[sold]

    %94
    fad4 r8 fad si,4 dod
    fad, r8 si'16 la sold8 fad mid[sold]
    fad mi? re[dod]\mbreak si si' dod[dod,]

    %97
    fad4 r8 fad mid4 mid
    fad r8 fad16 mi? red4 r8 red
    mi[fad sold fad16 sold] la8 sold fad[mi16 fad]

    %100
    sold8[fad mi red16 mi] fad8 mi red dod16 red\mbreak
    mi8. fad16 sold8. la16 si4 r8 si,
    mi fad sold la si4 si,

    %103
    mi8 mi fad fad sold sold red red
    mi4 r mi8 fad sold la
    si si si, si\mbreak dod' dod dod, dod

    %106
    red' red red, red mi fad sold la
    si si si, si mi si' dod la
    si mi, si' si, mi4 r

    %109
    r8 mi si' si, mi4 r8 sold
    la fad sold red mi fad sold la\mbreak
    si si, si' si, si' si, si' si,

    %112
    si' si, mi[mi,] si'' la si si,
    mi4 r r2
    r r8 mi\tu fad sold

    %115
    la mi dod la la' la, r4
    R1
    r8 la' si dod re la fad re\mbreak

    %118
    re' re, r4 r2
    r r8 re fad la
    re la fad re re' re, r4

    %121
    re'8 re, r4 re8 re, r8 re'
    sol4 sold la2
    r4 la8 la, r4 la'8 la,

    %124
    r4 la' lad2\mbreak
    si8 fad si fad si4 mid,
    fad2 r8 lad, lad lad

    %127
    si si si si mi mi mi mi
    la la la la re, re re re
    re re re re sol4 sold\mbreak

    %130
    la8 la la la la la la la
    la[la la dod16 si] la8. la16 la4
    r2 r8 la mi dod

    %133
    la4 la'8 re, la'4 la,
    re r r8 re' la fad
    re4. re8 la'4 la,\mbreak

    %136
    re4 r r re
    la2 re\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 60
    s1*137
    \bar "||"

}

IvlI = {
    \notypeset
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Ivla = {
    \clef alto
    <<\Ivlan \forma>>

}

Isoprano = {
    \new Voice = "lætatus1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "lætatus2"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "lætatus3"
    <<\Itenoren \forma>>
}

Ibasso = {
    \clef bass
    \new Voice = "lætatus4"
    <<\Ibasson \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
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


IIsopranon = \relative do'' {

    \autoBeamOff

    r4 fad mi
    re2 r4
    R2.*2

    %5
    r4 fad mi
    re2 r4
    sol4 fad8 mi re dod\mbreak

    %8
    re2.~
    re8. [mi16] re2
    dod r4

    %11
    r re8 mi fad re
    sol4 fad2
    mi r4

    %14
    r fad mi
    fad2 r4
    R2.*2

    %18
    r4 fad mi
    fad2 r4
    mi dod8 si dod re

    %21
    mi4(fad2)
    mi4 r8 mi dod la
    mi'8. re16 mi4 r

    %24
    R2.\mbreak
    r4 r8 mi re mi
    fad8. [sol16] fad8 [mi] re8[mi16 fad]

    %27
    sol8.[fad16] mi8[sol] fad[sol16 mi]
    fad4. sol16[fad] mi8[re16 mi]
    fad4. sol16[fad] mi8[re16 mi]

    %30
    fad8. mi16 fad4 r8 sol
    mi4 fad sol
    fad(mi2)\mbreak

    %33
    re r4
    R2.*2
    r4 fad8[mi] fad[mi]

    %37
    re4 mi8[re mi fad]
    sol8.[fad16] mi8[fad mi re]
    dod4 re2

    %40
    dod r4
    r re8[mi] re[mi]\mbreak
    fad8.[mi16] fad8[re mi fad]

    %43
    sol4. fad8 mi re
    dod4 re mi
    re(dod2)

    %46
    si r4
    r r re
    fad4. mi8 re4

    %49
    dod4. re8 mi4
    re dod2\mbreak
    si r4

    %52
    R2.*9

}

IItestoI = \lyricmode {

    Fiat _ pax fiat _ pax pax in vir -- tute _ tu - a in vir -- tute _ tu - a

    fiat _ pax fiat _ pax pax in vir -- tute _ tu -- a

    et abun - danti - a et abun - dan - - - - - - - - - - - - tia _ in turri - bus tu -- is

    abun - dan - - - - ti -- a abun - dan - - tia _ in turri - bus tu -- is

    in turri - bus turri - bus tu - is.

}

IIsopranoIn = \relative do'' {

    \autoBeamOff
    r4 re dod
    si2 r4
    R2.*2

    %5
    r4 re dod
    si2 r4
    mi re8 dod si lad\mbreak

    %8
    si2.~
    si8. [dod16] si2
    lad r4

    %11
    r si8 dod re si
    mi4 re2
    dod r4

    %14
    r re dod
    re2 r4
    R2.*2

    %18
    r4 re dod
    re2 r4
    dod la8 sold la si

    %21
    dod4(re2)
    dod r4
    r r8 dod mi la,

    %24
    re8. dod16 re4 r\mbreak
    r4 r8 dod si dod
    re8.[mi16] re8[dod] si[dod16 re]

    %27
    mi8.[re16] dod8[mi] re[mi16 dod]
    re8. [la16] re4 dod8 [si16 dod]
    re8. [la16] re4 dod8 [si16 dod]

    %30
    re8.  dod16 re4 r8 mi
    dod4 re mi
    re2(dod4)\mbreak

    %33
    re2 r4
    R2.*2
    r4 re8[dod] re[dod]

    %37
    si4 dod8[si dod re]
    mi8.[re16] dod8[re dod si]
    lad4 si2

    %40
    lad r4
    r si8[dod] si[dod]\mbreak
    re8.[dod16] re8 [si dod re]

    %43
    mi4. re8 dod si
    lad4 si dod
    si2(\parenthesize lad4)

    %46
    si2 r4
    r r si
    re4. dod8 si4

    %49
    lad4. si8 dod4
    si2 lad4\mbreak
    si2 r4

    %52
    R2.*9

}

IItestoII = \lyricmode {

    Fiat _ pax fiat _ pax pax in vir -- tute _ tu - a in vir -- tute _ tu - a

    fiat _ pax fiat _ pax pax in vir -- tute _ tu -- a

    et abun - danti - a et abun - dan - - - - - - - - - - - - tia _ in turri - bus tu -- is

    abun - dan - - - - ti -- a abun - dan - - tia _ in turri - bus tu -- is

    in turri - bus turri - bus tu - is.

}

IIbcn = \relative do {

    si2 _\markup\italic "L'Istrumenti suonano il Basso" r4
    r si8 dod re mi
    fad sold lad si dod lad

    %4
    si sol? mi4 fad
    si,2 r4
    r si'8 la? sol fad

    %7
    mi4 r fad\mbreak
    si sol fad
    mid2.

    %10
    fad4 fad8 mi? re dod
    si4 si' r8 la
    sol2 sold4

    %13
    la la8 sol? fad mi
    re2 r4
    r re8 mi fad sol

    %16
    la si dod re mi dod\mbreak
    re si sol4 la
    re,2 r4

    %19
    r re8 mi fad sol
    la2 r4
    la fad re

    %22
    la'2 r4
    la,2 r4
    fad' r8 fad mi re\mbreak

    %25
    la'8. sol16 la4 r
    re,2 sol8. fad16
    mi4 la2

    %28
    re,8. dod16 fad8 re la' la,
    re8. mi16 fad8 re la' la,
    re4 r8 re' si sol

    %31
    la2 r4
    re, la'8 sol la la,\mbreak
    re4 re8 mi fad sol

    %34
    la si dod re mi dod
    re si sol4 la
    re,2 r4

    %37
    sol2 r8 fad
    mi2 r4
    fad8. mi16 re8 dod re si

    %40
    fad'4 fad8 mi re dod
    si4 r r\mbreak
    si' r r

    %43
    mi, r r
    fad si mi,
    fad2 r4

    %46
    si,8. si16 re8. re16 fad8. fad16
    si4 si, r
    r r si

    %49
    fad'2 r4
    si fad2\mbreak
    si, si'4

    %52
    si,8 lad si dod re mi
    fad sold lad si dod lad
    si si, r si' dod lad

    %55
    si si, r si' sol mi
    fad4. mi8 re4
    mi fad4. fad8

    %58
    si,4 r8 si' dod lad\mbreak
    si sol mi4 fad
    si,2.

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/4
    \key re\major
    \tempo 2 = 50
    s2.*60
    \bar "||"

}

IIsoprano = {
    \notypeset
    \new Voice = "fiat1"
    <<\IIsopranon \forma>>
}

IIsopranoI = {
    \new Voice = "fiat2"
    <<\IIsopranoIn \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}





IIIvlIn = \relative do'' {

    la'4 fad
    re r8 la
    si[dod re la]

    %4
    si[dod re la]
    si4 dod
    re mi

    %7
    fad r8 sol
    la la, r la'
    si sol mi dod'\mbreak

    %10
    re re, la' sol
    fad dod re sol,
    fad4 mi8. re16

    %13
    re mi32 fad sol la si dod re4~
    re8 re, fad mi
    re4 r

    %16
    re'4.\pp mi8
    fad8 sol \tuplet 3/2 { la sol fad }
    mi4 r8 fad\mbreak

    %19
    sol8 fad mi la
    fad4 mi8 \parenthesize dod
    re[mi fad sol]

    %22
    la4 sol8. fad16
    fad4 r8 la,\f
    si[dod re la]

    %25
    si[dod re la]
    si4 dod
    re mi

    %28
    fad r8 sol\mbreak
    la[fad re] la\pp
    si sol mi' re

    %31
    dod mi la4~
    la2~
    la4. mi8

    %34
    fad[sold la si]
    dod si la4~
    la8[si la sold]

    %37
    dod si la4~
    la sold8. la16
    la4 r8 la,\f

    %40
    si la4 sold16 si\mbreak
    dod8[re mi] la,\p
    si la4 sold16[si]

    %43
    dod8 si4 la16 dod
    re8 dod4 si16 la
    sold8 fad16 mi la4~

    %46
    la4 sold8. la16
    la4 r8 mi'\f
    fad re si sold'

    %49
    la la, mi' si
    dod sold' la re,
    dod4 si8. la16\mbreak

    %52
    la si32 dod re mi fad sold la4~
    la8 la, dod si
    la4 mi\pp

    %55
    la4. si8
    dod4. si16 dod
    re8 re, la'8. sol16

    %58
    fad4 r8 la
    si4. la16 sol
    la4. sol16 fad

    %61
    sol4. fad16 mi\mbreak
    fad8 mi16 fad sol la si dod
    re8[la fad re]

    %64
    si'4 la
    r8 si dod si16 dod
    re4 re,8 sol

    %67
    fad4 mi
    re\f r8 la''
    si16 sol la fad sol8 mi

    %70
    fad16 sol la sol fad sol la sol
    fad mi fad mi fad8 la\p\noBeam
    si la sol16 la fad sol\mbreak

    %73
    la8 sol4 fad16 la
    sol8 fad4 mi16 sol
    fad8 mi4 re16 fad

    %76
    mi re mi fad mi fad re mi
    fad8. mi32 re sol8. fad32 mi
    la8. sol32 fad <<{si8. la32 sol}

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
            \key re\major si32^\markup\italic"manoscritto"[la sol8.]}>>

    %79
    dod4 re8 re,
    fad4. mi8
    re2

    %82
    la'4 fad
    re r8 la
    si[dod re la]

    %85
    si[dod re la]
    si4 dod
    re mi

    %88
    fad r8 sol
    la la, r la'
    si sol mi dod'\mbreak

    %91
    re re, la' sol
    fad dod re sol,
    fad4 mi8. re16

    %94
    re mi32 fad sol la si dod re4~
    re8 re, fad mi
    re4\fermata r

}

IIIvlan = \relative do' {

    fad4 r
    fad8 mi re4
    re r8 re

    %4
    re4 r8 re
    re4 sol8 mi
    la fad la la

    %7
    la4 fad8 mi
    re4 re
    re re\mbreak

    %10
    si8 fad' mi la
    la sol la mi
    re4. dod8

    %13
    re[mi fad sol]
    la fad re dod
    re4 r %%ripresa

    %16
    R2*7
    r4 r8 fad\f
    re4 r8 re

    %25
    re4 r8 re
    re4 sol8 mi
    la fad la la

    %28
    la4 fad8 mi\mbreak
    re2
    R2*9

    %39
    r4 r8 mi
    re dod16 re mi4\mbreak
    mi la

    %42
    R2*5
    r4 r8 la
    la si sold4

    %49
    fad mi
    mi8 re mi si'
    la4. sold8\mbreak

    %52
    la[si dod si]
    la4. sold8
    la4 r

    %55
    R2*13
    r4 r8 fad
    sol16mi fad re mi8 dod

    %70
    re16 mi fad mi re mi fad mi
    re dod re dod re4
    sol8 fad mi4\mbreak

    %73
    fad8 mi re4
    mi8 re dod4
    re8 dod si4

    %76
    dod r8 si16 dod
    re4 mi
    fad sol

    %79
    la8 sol fad si
    la4 la,
    re2

    %82
    fad4 r
    fad8 mi re4
    re r8 re

    %85
    re4 r8 re
    re4 sol8 mi
    la fad la la

    %88
    la4 fad8 mi
    re4 re
    re re\mbreak

    %91
    si8 fad' mi la
    la sol la mi
    re4. dod8

    %94
    re[mi fad sol]
    la fad re dod
    re4\fermata r

}

IIIalton = \relative do' {

    \autoBeamOff
    R2*14
    la'4 fad
    re4. mi8

    %17
    fad sol la[sol16 fad]
    mi4 r8 fad\mbreak
    sol[fad] mi la

    %20
    fad4 mi8 dod
    re[mi] fad sol
    la4 sol8.[fad16]

    %23
    fad2
    R2*5
    r4 r8 la

    %30
    si[sol] mi[re]
    dod[mi] la4\parentSlur (
    la2)~

    %33
    la4. mi8
    fad[sold la si]
    dod[si] la4~

    %36
    la8[si la sold]
    dod[si] la4~
    la sold8. la16

    %39
    la2
    R
    r4 r8 la

    %42
    si la4 sold16[si]
    dod8 si4 la16[dod]
    re8 dod4 si16[la]

    %45
    sold8[fad16 mi] la4~
    la sold8. la16
    la2

    %48
    R2*6
    la4 mi
    la4. si8

    %56
    dod4. si16 dod
    re8 re, la'8.[sol16]
    fad4 r8 la

    %59
    si4. la16[sol]
    la4. sol16[fad]
    sol4. fad16[mi]\mbreak

    %62
    fad8[mi16 fad] sol[la si dod]
    re8[la fad re]
    si'4 la

    %65
    r8 si dod si16[dod]
    re4 re,8[sol]
    fad4 mi

    %68
    re2
    R2*2
    r4 r8 la'

    %72
    si la sol16 [la fad sol]\mbreak
    la8 sol4 fad16[la]
    sol8 fad4 mi16[sol]

    %75
    fad8 mi4 re16[fad]
    mi[re mi fad] mi[fad re mi]
    fad8.[mi32 re] sol8.[fad32 mi]

    %78
    la8. [sol32 fad] si8.[la32 sol]
    dod4 re8 [re,]
    fad4. mi8

    %81
    re2
    R2*15

}

IIItesto = \lyricmode {

    Propter _  fratres  _ fratres  _ me -- os et pro -- ximos _  meos, _  et pro -- ximos _  me - os.

    Lo -- que -- bar pa - - - - - - - cem de te lo -- que - bar pa - - - - - - - cem de te.

    Propter  _ domum _ Do -- mini _ Dei _ no -- stri quae -- si -- vi bo - - - - - - - na

    quae -- sivi _ bo -- na ti - bi quae -- sivi _ bo - - - - - - - - - - - - - - - - na ti - bi.

}

IIIbcn = \relative do {

    re4 r
    re8 mi fad4
    sol\f r8 fad

    %4
    sol4 r8 fad
    sol fad mi la
    fad re dod la

    %7
    re[dod re mi]
    fad[mi fad fad,]
    sol'4 la8 la,\mbreak

    %10
    si4 dod
    re8[mi fad sol]
    la4 la,

    %13
    re4. mi8
    fad sol la la,
    re4 r %%% ripresa

    %16
    re'8[dod si la]
    re,[mi fad sol]
    la[si dod re]

    %19
    \clef tenor mi re dod la
    re[fad, sol la]
    si2

    %22
    dod
    re8 la fad re
    \clef bass sol4 r8 fad

    %25
    sol4 r8 fad
    sol fad mi la
    fad re dod la

    %28
    re[dod re mi]\mbreak
    fad4 r8 fad
    sol4 sold

    %31
    la r8 dod,
    re[mi fad sold]
    la[si dod dod,]

    %34
    re[mi fad sold]
    la mi fad dod
    re4. mi8

    %37
    la,[si dod re]
    mi la, mi' mi,
    la si dod4

    %40
    re8 fad mi mi\mbreak
    la,8 si dod4
    re8 fad mi mi,

    %43
    la si dod4
    si8 dod re4
    mi dod8 re

    %46
    mi4 mi,
    la8 si dod4
    re mi

    %49
    fad sold
    la,8[si dod re]
    mi4 mi,\mbreak

    %52
    la4. si8
    dod re mi mi,
    la2

    %55
    la'8[sold fad mi]
    la la, la'4
    si dod

    %58
    re8[dod re fad,]
    sol fad mi4
    fad8 mi re4

    %61
    mi8 re dod4\mbreak
    re mi
    fad2

    %64
    sol8 fad16 mi fad8 fad,
    r sol' la4
    si8 la si dod

    %67
    re sol, la la,
    re2
    R2*2

    %71
    r4 r8 re
    sol fad mi4\mbreak
    fad8 mi re4

    %74
    mi8 re dod4
    re8 dod si4
    dod r8 si16 dod

    %77
    re4 mi
    fad sol
    la8 sol fad si

    %80
    la4 la,
    re2
    re4 r

    %83
    re8 mi fad4
    sol\f r8 fad
    sol4 r8 fad

    %86
    sol fad mi la
    fad re dod la
    re[dod re mi]

    %89
    fad[mi fad fad,]
    sol'4 la8 la,\mbreak
    si4 dod

    %92
    re8[mi fad sol]
    la4 la,
    re4. mi8

    %95
    fad sol la la,
    re4\fermata r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/4
    \key re\major
    \tempo 2 = 65
    s2*96
    \bar "||"

}

IIIvlI = {
    \notypeset
    <<\IIIvlIn \forma>>

}

IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>

}

IIIalto = {
    \new Voice = "fratres"
    <<\IIIalton \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}



IVvlIn = \relative do'' {

    mi4 la sold2
    r4 sold?2 mi8 mi
    mi2 mi4 sold

    %4
    la4. la8 sold2
    r4 sold?2 fad4
    fad2 r4 la8 la

    %7
    sold8. sold16 sold4 r si8 mi,
    mi2 fad4 la
    la4. sold8 la2\fermata

    %10
    r8 la, dod mi la4 sold8 si
    la la, dod mi la4 sold8 si
    la4 mi8 fad mi4 dod

    %13
    re mi mi8. re16 dod8 mi
    la la, dod mi la4 sold8 si
    la la, dod mi la4 sold8 si

    %16
    la4 mi8 fad mi4 dod\mbreak
    re mi mi8. re16 dod8 mi
    la mi dod la la' la sol mi

    %19
    fad4 mi8 mi la mi dod la
    la' la sol mi fad4 mi
    r mi8 fad fad4 mi8 mi

    %22
    mi8. mi16 re8 re dod2
    re8 si re fad\mbreak si4 lad8 si
    si si, re fad si4 lad8 dod

    %25
    si4 fad8 fad fad4 fad8 fad
    fad8. fad16 mi8 mi red2
    mi8 dod mi sold dod4 si8. la16

    %28
    sold4 r r8 si la fad\mbreak
    sold4 r r8 la si sold
    la4 r8 mi fad4. fad8

    %31
    mi4. mi8 re4. re8
    dod4. dod8 si4. si8
    la4 re2 dod4

    %34
    re8 mi fad sol la2
    la4. mi8 fad4 fad\mbreak
    mi mi re re

    %37
    dod mi dod2
    re8 si re fad si4 lad
    si8 si, re fad sol4. sol8

    %40
    fad4. fad8 mi4. mi8
    re4. re8 dod4 re\mbreak
    dod4 fad8 mi re4 fad

    %43
    mi8 fad mi re dod mi re dod
    si4 mi mi2
    mi mi

    %46
    mi8 re dod4~dod4. re8~
    re4 dod si2\mbreak
    dod8 la dod mi la4 sold

    %49
    la8 mi dod dod si la sold la16 si
    dod8 dod mi dod si dod re dod16 si
    dod8 mi la la, sold la si dod16 re

    %52
    dod8 mi mi dod si[dod re dod16 si]
    dod8[si dod re16 dod] si8 mi dod dod\mbreak
    si4 mi dod8 la dod mi

    %55
    la4 sold la mi8 la
    fad4 sold la2\fermopz

}

IVvlIIn = \relative do'' {

    dod4 mi mi2
    r4 mi2 si8 si
    dod2 si4 mi

    %4
    mi4. red8 mi2
    r4 mi2 dod4
    re2 r4 mi8 fad

    %7
    si,8. si16 mi4 r mi8 si
    dod2 re4 dod
    si2 dod\fermata

    %10
    dod4 r4 r8 dod si mi
    dod4 r r8 dod si mi
    dod4 dod8 re dod4 mi

    %13
    la, si dod8. re16 mi8 dod
    dod4 r r8 dod si mi
    dod4 r r8 dod si mi

    %16
    dod4 dod8 re dod4 mi\mbreak
    la, si dod8. re16 mi4
    la8 mi dod la la' dod, re la

    %19
    re4 dod8 mi la mi dod la
    la' dod, re la re4 dod
    r dod8 dod si4 si8 si

    %22
    lad8. lad16 si8 si si4 lad
    si r\mbreak r8 re dod sol'
    re4 r r8 re dod fad

    %25
    re4 re8 re dod4 dod8 dod
    sid8. sid16 dod8 dod dod4 sid
    dod r r8 mi fad fad

    %28
    mi4 r r8 sold fad red\mbreak
    mi4 r r8 dod re si
    dod4 r8 dod re la re4~

    %31
    re8. re16 dod4. dod8 sol4(
    si8) si la4. la8 sol4~
    sol8. sol16 fad4 mi2

    %34
    fad8 sol la sol fad re re'4
    dod8 re mi4. mi8 re4~\mbreak
    re dod2 si4

    %37
    lad si2 lad4
    si r r8 re dod fad
    re4 r8 re mi si mi4

    %40
    mi8 mi re4. re8 dod4~
    dod8 dod si4 lad si\mbreak
    si lad si re8 dod

    %43
    si2 la8 dod si la
    sold4. la8 si la si sold
    dod4. si16 la sold4 si

    %46
    dod4. si8 la4. si8
    si4 la2 sold4\mbreak
    la r r8 dod si mi

    %49
    dod4 r8 mi mi2
    r8 mi dod la sold la si la16 sold
    la4 r8 dod si dod re dod16 si

    %52
    la8 dod la la sold[la si la16 sold]
    la8[sold la si16 la] sold4 la~\mbreak
    la sold la r

    %55
    r8 dod si mi dod4 dod
    re si dod2\fermata

}

IVvlan = \relative do' {

    la'4 la si2
    r4 si2 si8 si
    la2 si4 si

    %4
    la4. fad8 si2
    r4 si2 lad4
    fad2 r4 mi8 re

    %7
    si8. mi16 si4 r mi8 si'
    la2 fad4 mi
    mi2 mi\fermata\mbreak

    %10
    mi4 r r8 mi mi sold
    mi4 r r8 mi mi sold
    mi4 la8 la la4 la

    %13
    la mi la8. mi16 la8 la
    mi4 r r8 mi mi sold
    mi4 r r8 mi mi sold

    %16
    mi4 la8 la la4 la\mbreak
    la mi la8. mi16 la4
    la r r8 mi re la'

    %19
    la4 la la r
    r8 mi re la' la4 la
    r la8 fad si4 mi,8 si'

    %22
    fad8.[fad16 fad8 fad] fad2
    fad4 r\mbreak r8 fad fad lad
    fad4 r r8 fad mi lad

    %25
    fad4 si8 si fad4 fad8 dod'
    sold8. sold16 sold8 sold sold2
    sold?4 r r8 sold[si8. si16]

    %28
    si4 r r8 si dod si\mbreak
    si4 r r8 mi, fad mi
    mi4 la la la

    %31
    la la fad fad
    fad fad re re
    re la' la2

    %34
    la4 re,8 mi fad sol la4
    la4. sol8 fad sol la si\mbreak
    mi,4 r8 fad fad4 mi

    %37
    fad2 fad
    fad4 r r8 fad fad4
    fad r r8 si mi, sol

    %40
    si4. re,8 mi fad sol mi
    fad4 fad fad2\mbreak
    fad fad4 si

    %43
    mi, mi2 fad4
    sold4. fad8 mi4. si'8
    la4 mi8 fad si,4 mi

    %46
    dod mi la fad
    sold mi mi2\mbreak
    mi4 r r8 mi mi mi

    %49
    mi4 mi mi2
    la mi
    mi mi

    %52
    mi mi
    mi mi4 mi\mbreak
    mi2 mi4 r

    %55
    r8 mi mi mi mi4 la8 mi
    fad4 mi mi2\fermata

}

IVsopranon = \relative do'' {

    \autoBeamOff
    dod4 sol sold2
    r4 si2 si8 si
    dod2 si4 sold

    %4
    la4. la8 sold2
    r4 si2 dod4
    si2 r4 la8 la

    %7
    sold8. sold16 sold4 r si8 si
    dod2 la4 la
    la4.(sold8) la2\fermata  %%OOKK

    %10
    R1*2
    r4 dod8 re dod4 mi
    la, si dod8. si16 la4

    %14
    R1*2
    r4 dod8 re dod4 mi\mbreak
    la,4 si dod8. si16 la4

    %18
    r2 r8 la la la
    re4 dod r2
    r8 la la la re4 dod

    %21
    r dod8 dod si4 si8 si
    lad8. lad16 si8 si si4(lad)
    si4 r \mbreak r2

    %24
    R1
    r4 re8 re dod4 dod8 dod
    sid8. sid16 dod8 dod dod4 sid

    %27
    dod r r2
    r8 sold [si la] si4 r\mbreak
    r8 si [la mi'] dod4 r

    %30
    r2 r8 la re4~
    re dod~dod si~
    si la2  sol4~

    %33
    sol fad mi2
    fad r4 la8 [si]
    dod [re] mi2 re4~\mbreak

    %36
    re dod2 si4
    lad si2 lad4
    si2 r

    %39
    r4 r8 re mi[si] mi4
    mi re2 dod4~
    dod si lad si~\mbreak

    %42
    si lad si2
    r4 si la8[dod si la]
    sold4. la8 si[la] si[sold]

    %45
    dod4. si16[la] sold8[la] si4
    dod4. si8 la4. si8
    sold4 la2 sold4\mbreak

    %48
    la2 r
    R1
    r8 mi'[dod la] si[dod] re[dod16 si]

    %51
    dod4 mi8[la,] sold[la] si[la16 sold]
    la8[mi'] dod4 si8[dod] re[dod16 si]
    la8[sold]la[si16 la] sold4 \parenthesize la~\mbreak

    %54
    la4 sold la2
    r r4 la
    si sold la2\fermata

}

IVtestoI = \lyricmode {

    Glori - a Glo -- ria _ Patri, _ et Filio _ _ Glori - a et Spi -- ritui, _ _  et Spi -- ritui _ _ San -- cto.

    Sicut _ erat  _ in principio _ _ _ sicut _ erat  _ in principio _ _ _

    et nunc et semper _ et nunc et semper _ et in saecula _ _ saeculorum _ _ _ a -- men

    et in saecula _ _ saeculorum _ _ _ a - men a -- men a -- men a - - - - - - - men

    a - - - - - - - - men a - - - - - - - - - men a - - - - - - - - - - - - - - - - men. A - - - - - - - - - - - - - - - men

    a - - men.

}

IValton = \relative do' {

    \autoBeamOff
    la'4 mi mi2
    r4 sold2 mi8 mi
    mi2 mi4 si'

    %4
    fad4. fad8 si2
    r4 sold2 lad4
    fad2 r4 mi8 fad

    %7
    sold8. si16 mi,4 r mi8 mi
    mi2 fad4 mi
    mi2 mi\fermata

    %10
    R1*2
    r4 la8 la la4 la
    la mi la8. mi16 mi4

    %14
    R1*2
    r4 la8 la la4 la\mbreak
    la mi la8. mi16 mi4

    %18
    r2 r8 mi re la'
    la4 la r2
    r8 mi re la' la4 la

    %21
    r la8 fad si4 mi,8 mi
    fad8. fad16 fad8 fad fad2
    fad4 r\mbreak r2

    %24
    R1
    r4 fad8 si fad4 fad8 fad
    red8. red16 mi8 sold sold2

    %27
    sold?4 r r2
    r8 sold[mi fad] sold4 r\mbreak
    r8 sold?[la si] mi,4 r

    %30
    r2 r4 la~
    la2 fad~
    fad re~

    %33
    re4 \parenthesize la'~la2
    la4 re,8[mi] fad[sol] la4~
    la4. sol8 fad[sol la si]\mbreak

    %36
    mi,4 fad~fad2
    fad1
    fad2 r

    %39
    r r8 si [mi, sol]
    si4. re,8 mi[fad sol mi]
    fad1~\mbreak

    %42
    fad2 fad
    si4 mi,2 fad4
    sold8[la] si4 mi,4. si'8

    %45
    la4 mi8[fad] sol[fad mi si']
    la4. mi8 la4 fad
    mi1\mbreak

    %48
    mi2 r
    r4 r8 mi16[fad] sold8[la] si[la16 sold]
    la4 mi~mi2~

    %51
    mi1~
    mi~
    mi~\mbreak

    %54
    mi2 mi
    r r4 mi
    fad mi mi2\fermata

}

IVtestoII = \lyricmode {

    Glori - a Glo -- ria _ Patri, _ et Filio _ _ Glori - a et Spi -- ritui, _ _  et Spi -- ritui _ _ San -- cto.

    Sicut _ erat  _ in principio _ _ _ sicut _ erat  _ in principio _ _ _

    et nunc et semper _ et nunc et semper _ et in saecula _ _ saeculorum _ _ _ a -- men

    et in saecula _ _ saeculorum _ _ _ a -- men a -- men a -- men a - - - men a - - - - - - - men

    a - - - - men a - - - - - - - - - - - - - - men. A - - - - men a - - men.

}

IVtenoren = \relative do' {

    \autoBeamOff

    mi4 dod si2
    r4 mi2 mi8 mi
    mi2 mi4 mi

    %4
    mi4. red8 mi2
    r4 mi2 mi4
    re2 r4 dod8 dod

    %7
    si8. si16 si4 r mi8 mi
    mi2 re4 dod
    si2 dod\fermata

    %10
    R1*2
    r4 mi8 fad mi4 dod
    re mi mi8. re16 dod4

    %14
    R1*2
    r4 mi8 fad mi4 dod\mbreak
    re mi mi8. re16 dod4

    %18
    r2 r8 dod re mi
    fad4 mi r2
    r8 dod re mi fad4 mi

    %21
    r4 mi8 fad fad4 mi8 mi
    mi8. mi16 re8 re dod2
    re4 r\mbreak r2

    %24
    R1
    r4 fad8 fad fad4 fad8 fad
    fad8. fad16 mi8 mi red2

    %27
    mi4 r r2
    r8 si[mi red] mi4 r\mbreak
    r8 mi[re si] dod4 r

    %30
    r8 la[dod mi] fad4. fad8
    mi4. mi8 re4. re8
    dod4. dod8 si4. si8

    %33
    la4 re2 dod4
    re2 r
    r4 la8[mi'] fad2\mbreak

    %36
    mi re
    dod4 re dod2
    re r

    %39
    r8 si[re fad] sol4. sol8
    fad4. fad8 mi4. mi8
    re4. re8 dod4 re\mbreak

    %42
    dod2 re4 r8 mi
    mi[fad mi re] dod[mi re dod]
    dod4 fad~fad2(

    %45
    mi1)~
    mi8[re] dod4 dod re~
    re dod si2\mbreak

    %48
    dod r
    r8 mi[dod la] si[dod] re[dod16 si]
    dod4 mi8[la,] sold[la] si[la16 sold]

    %51
    la8[mi'] dod4 dod8[dod] re[dod16 si]
    dod4 mi8[la,] sold[la] si[la]
    dod[si] dod[re16 dod] si4 dod\mbreak

    %54
    si2 dod
    r r4 dod
    re si dod2\fermata

}

IVtestoIII = \lyricmode {

    Glori - a Glo -- ria _ Patri, _ et Filio _ _ Glori - a et Spi -- ritui, _ _  et Spi -- ritui _ _ San -- cto.

    Sicut _ erat  _ in principio _ _ _ sicut _ erat  _ in principio _ _ _

    et nunc et semper _ et nunc et semper _ et in saecula _ _ saeculorum _ _ _ a -- men

    et in saecula _ _ saeculorum _ _ _ a -- men a -- men a -- men a - - - - - - - - - - - - - men

    a - - - - - - men a - - - - - - - - - - - men a - - - - - - - - - men. A - - - - - - - - - - - - - - - - - - - men

    a - -  men.

}

IVbasson = \relative do {

    \autoBeamOff
    la4 dod mi2
    r4 mi2 sold8 sold
    la2 sold4 mi

    %4
    fad4. fad8 mi2
    r4 mi2 dod4
    re2 r4 la'8 re,

    %7
    mi8. mi16 mi4 r4 sold8 sold
    la2 re,4 la'
    mi2 la\fermata

    %10
    R1*2
    r4 la8 re, la'4 la
    fad4 sold la8. la16 la4
    R1*2

    %16
    r4 la8 re, la'4 la\mbreak
    fad4 sold la8. la16 la4
    r2 r8 la, si dod

    %19
    re4 la r2
    r8 la si dod  re4 la
    r la'8 la sold4 sol8 sol

    %22
    fad8. fad16  si,8 si fad'2
    si,4 r\mbreak r2
    R1

    %25
    r4 si'8 si lad4 la8 la
    sold8. sold16 dod,8 dod sold'2
    dod,4 r r2

    %28
    r8 mi [sold fad] mi4 r\mbreak
    r8 mi [fad sold] la4 r
    r r8 la re, [mi fad re]

    %31
    la' [sol la la,] si [dod re si]
    fad' [sol la fad] sol [fad sol sol,]
    re' [mi fad re] la' [sol la la,]

    %34
    re4 r re8 [mi fad sol]
    la [si dod dod,] re [mi fad sol]\mbreak
    la4 lad si8 [si, re mi]

    %37
    fad4 si, fad'2
    si,2 r
    r4 r8 si' mi, [fad sol mi]

    %40
    si' [la si si,] dod [re mi dod]
    re [dod re mi] fad [mi re si]\mbreak
    fad' [mi] fad4 si, si'8 [la]

    %43
    sold2 la4 re,
    mi4. fad8 sold [fad sold mi]
    la [la, dod re] mi [fad sold mi]

    %46
    la4. sold8 fad [mi fad re]
    mi 4 la mi2\mbreak
    la r

    %49
    r4 la mi2~
    mi1~
    mi~

    %52
    mi2~ mi~
    mi~ mi4 la,\mbreak
    mi'2 la,

    %55
    r r4 la'
    re, mi la,2\fermata

}

IVtestoIV = \lyricmode {

    Glori - a Glo -- ria _ Patri, _ et Filio _ _ Glori - a et Spi -- ritui, _ _  et Spi -- ritui _ _ San -- cto.

    Sicut _ erat  _ in principio _ _ _ sicut _ erat  _ in principio _ _ _

    et nunc et semper _ et nunc et semper _ et in saecula _ _ saeculorum _ _ _ a -- men

    et in saecula _ _ saeculorum _ _ _ a -- men a -- men a -- men a - - - - - - - men

    a - - - - - - - - men a - - - - - - - men a - - - - - - - - - - - - - - men. A - men a -- men a - - men.

}

IVbcn = \relative do {

    la4 dod mi2
    r4 mi2 sold4
    la2 sold4 mi

    %4
    fad2 mi
    r4 mi2 lad,4
    si2 r4 dod8 re

    %7
    mi2 r4 sold,8 sold
    la2 re4 la
    mi'2 la,\fermata

    %10
    la'4 r r8 la mi' mi,
    la4 r r8 la mi' mi,
    la4 la8 re, la'4 la,8 la'

    %13
    fad4 sold la2
    la,4 r r8 la' mi' mi,
    la4 r r8 la mi' mi,

    %16
    la4 la8 re, la'4 la,8 la'\mbreak
    fad4 sold la2
    r r8 la, si dod

    %19
    re4 la r2
    r8 la si dod  re4 la
    r la'8 la sold4 sol

    %22
    fad si, fad'2
    si,4 r\mbreak r8 si fad' fad,
    si4 r r8 si fad' fad,

    %25
    si4 si' lad la
    sold dod, sold'2
    dod,4 r r8 dod red4

    %28
    mi sold8 fad mi4 la8 si\mbreak
    mi,4 fad8 sold la4 re,8 mi
    la,4 r8 la' re, mi fad re

    %31
    la' sol la la, si dod re si
    fad' sol la fad sol fad sol sol,
    re' mi fad re la' sol la la,

    %34
    re2 re8 mi fad sol
    la si dod dod, re mi fad sol\mbreak
    la4 lad si8 si, re mi

    %37
    fad4 si, fad'8 mi fad fad,
    si2 r8 si fad' fad,
    si4 r8 si' mi, fad sol mi

    %40
    si' la si si, dod re mi dod
    re dod re mi fad mi re si\mbreak
    fad' mi fad fad, si4 si'8 la

    %43
    sold2 la4 re,
    mi4. fad8 sold fad sold mi
    la la, dod re mi fad sold mi

    %46
    la4. sold8 fad mi fad re
    mi mi, la' [la,] mi'4 mi,\mbreak
    la r r8 la' mi' mi,

    %49
    la4 la, mi'2~
    mi~mi
    mi~mi

    %52
    mi mi
    mi mi4 la,\mbreak
    mi'2 la,

    %55
    r8 la mi' mi, la4 la'
    re, mi la,2\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 35
    s1*9\break
    \bar"||"\once \override Score.RehearsalMark.extra-offset = #'(+14 . +1.0)
    \mark\markup\huge "[5.] Sicut erat - Presto"
    \tempo 2 = 65
    s1*47
    \bar "|."

}

IVvlI = {
    %\notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}

IVsoprano = {
    \new Voice = "gloria1"
    <<\IVsopranon \forma>>
}

IValto = {
    \new Voice = "gloria2"
    <<\IValton \forma>>
}

IVtenore = {
    \new Voice = "gloria3"
    <<\IVtenoren \forma>>
}

IVbasso = {
    \clef bass
    \new Voice = "gloria4"
    <<\IVbasson \forma>>
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
#(set-global-staff-size 17.5)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza\terzinequarto

}

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

\paper {

    systems-per-page = #2

}

    \header {
        title = \markup\smaller "Lætatus sum a 4 concertato con Strumenti"
        composer = \markup {"B. Galuppi (1706-1785)"}
    }

    \markup \huge {[1.] All[egr]o}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"[Violini]"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Viole]"}
                    \set Staff.midiInstrument = #"viola"
                    \Ivla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "[Canti]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Isoprano \global
                    \new Lyrics \lyricsto "lætatus1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "[Alti]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Ialto \global
                    \new Lyrics \lyricsto "lætatus2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"[Tenori]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \Itenore \global
                    \new Lyrics \lyricsto "lætatus3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Bassi]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \Ibasso \global
                    \new Lyrics \lyricsto "lætatus4" \ItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Bassi]"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc\global
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortlætatus-duration = #(ly:make-moment 1/4)
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

\pageBreak

\bookpart {

\paper {

    systems-per-page = #5

}

    \markup \huge {[2.] A' due Canti Soli}

    \score {

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 3/4\numericTimeSignature r4^\markup\center-align "[Canto I]" fad'' mi''}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIsoprano \global
                    \new Lyrics \lyricsto "fiat1" \IItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 3/4\numericTimeSignature r4^\markup\center-align "[Canto II]" re'' dod''}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIsopranoI \global
                    \new Lyrics \lyricsto "fiat2" \IItestoII
                >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Bassi]"}
                \set Staff.midiInstrument = #"cello"
                \IIbc\global
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortlætatus-duration = #(ly:make-moment 1/4)
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

\pageBreak

\bookpart {

\paper {

    systems-per-page = #4

}

    \markup \huge {[3.] Propter fratres meos}

    \score {

            \new ChoirStaff <<

                    \new Staff = "main" <<
                    \set Staff.instrumentName = \markup \center-column{"Violini""Unis[oni]"}
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlI\global
                    >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viole"}
                    \set Staff.midiInstrument = #"viola"
                    \IIIvla\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 2/4\numericTimeSignature r2^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIIalto \global
                    \new Lyrics \lyricsto "fratres" \IIItesto
                >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Bassi]"}
                \set Staff.midiInstrument = #"cello"
                \IIIbc\global
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortlætatus-duration = #(ly:make-moment 1/4)
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

\pageBreak

\bookpart {

\paper {

    systems-per-page = #2

}

    \markup \huge {[4.] Gloria Patri}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"[Violini]"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Viole]"}
                    \set Staff.midiInstrument = #"viola"
                    \IVvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 dod''4^\markup\center-align "[Canti]" sol' sold'2}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVsoprano \global
                    \new Lyrics \lyricsto "gloria1" \IVtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 la'4^\markup\center-align "[Alti]" mi' mi'2}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IValto \global
                    \new Lyrics \lyricsto "gloria2" \IVtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 mi'4^\markup\center-align"[Tenori]"dod' si2}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVtenore \global
                    \new Lyrics \lyricsto "gloria3" \IVtestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Bassi]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVbasso \global
                    \new Lyrics \lyricsto "gloria4" \IVtestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Bassi]"}
                \set Staff.midiInstrument = #"contrabass"
                \IVbc\global
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortlætatus-duration = #(ly:make-moment 1/4)
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
