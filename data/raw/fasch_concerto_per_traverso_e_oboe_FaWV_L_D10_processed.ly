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

Iglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \senza
}

Ifln = \relative do'' {

    re4 fad,
    sol8[la si dod]
    re4 fad,

    %4
    sol8[la si dod]
    re[la si la]
    si la r la

    %7
    si[la do si]
    la sol do4~
    do si\mbreak

    %10
    dod! re~
    re dod
    red mi~

    %13
    mi re!~
    re dod
    si2

    %16
    la4 fad'
    mi8[re dod si]
    la4 fad'

    %19
    mi8[re dod si]
    la4 la'~\mbreak
    la sol~

    %22
    sol fad~
    fad mi~
    mi re~

    %25
    re dod
    re fad,
    sol8[la si dod]

    %28
    re4 fad,
    sol8[la si dod]
    re[re re re]\mbreak

    %31
    re[re re re]
    fad16 mi fad sol la8 dod,
    re[fad mi sol]

    %34
    fad mi r mi16 fad
    sol8[fad mi re]
    sol fad si4

    %37
    si8[la la sold]~
    sold la si4~
    si8[la la sold]~

    %40
    sold(la) fad4~
    fad8 mi mi4
    mi8 la re,4~

    %43
    re8 dod dod4~
    dod8 si16 dod re dod re si
    mi8[la, si sold]

    %46
    la'4 dod,
    re8[mi fad sold]\mbreak
    la4 dod,

    %49
    re8[mi fad sold]
    la[mi fad mi]
    fad mi r la

    %52
    sold[la si la]
    sold la re4\parentSlur (
    re) dod~

    %55
    dod si~
    si la~
    la sol~

    %58
    sol fad\mbreak
    sold la~
    la sold

    %61
    la fad
    mi8[re dod si]
    la4 fad'

    %64
    mi8[re dod si]
    la[la la la]
    la'[la la la]

    %67
    dod,16 si dod re mi8 sold,\mbreak
    la4 r
    R2

    %70
    r8 la'16 sol fad mi re dod
    re la' dod, la' re, la' do, la'
    si,4 r

    %73
    mi16 si' red, si' mi, si' re, si'
    dod,?4 r
    fad16 la mi la re, la' dod, la'\mbreak

    %76
    si, la si do si do la si
    dod? si dod re dod re si dod
    re mi fad sol la si la si

    %79
    la2~
    la~
    la

    %82
    dod,16 re dod re mi fad mi fad
    sol la sol la si dod si dod\mbreak
    fad, sol fad sol la si la si

    %85
    mi,8[sol fad mi]
    re dod re4~
    re dod(

    %88
    re) sol~
    sol fad~
    fad mi~

    %91
    mi re~
    re do~
    do si~

    %94
    si la8 sol
    fad4 r
    sol' si,

    %97
    do8[re mi fad]
    sol4 si,
    do8[re mi fad]

    %100
    sol [re mi re]
    mi re r re\mbreak
    mi re fa mi

    %103
    re do fa4~
    fa mi
    fad? sol~

    %106
    sol fad~
    fad mi~
    mi re~

    %109
    re dod?
    re' fad,
    sol8[la si dod]

    %112
    re4 fad,
    sol8[la si dod]
    re [la si la]

    %115
    si la r la,
    si[la si la]
    si la re4~\mbreak

    %118
    re dod(
    red) mi~
    mi re!~

    %121
    re dod
    si2
    la'4 dod,

    %124
    re8[mi fad sold]
    la4 dod,\mbreak
    re8[mi fad sold]

    %127
    la4 r
    R2
    re,4 fad,

    %130
    sol8[la si dod]
    re4 fad,
    sol8[la si dod]

    %133
    re[la si la]\mbreak
    si la r la
    si la do si

    %136
    la sol do4~
    do si\parentSlur (
    dod?) re~

    %139
    re dod
    si2\mbreak
    sol'8 r fad r

    %142
    mi r mi r
    re4 si'
    la8[sol fad mi]

    %145
    re4 si'
    la8[sol fad mi]\mbreak
    re[re re re]

    %148
    re[re re re]
    fad16 mi fad sol la8 dod,
    re4\fermata r

}

Iobn = \relative do'' {

    re4 fad,
    sol8[la si dod]
    re4 fad,

    %4
    sol8[la si dod]
    re[fad, sol fad]
    sol fad r fad

    %7
    sol[fad sol fad]\mbreak
    mi re do'4~
    do si\mbreak

    %10
    dod! re~
    re dod
    red mi~

    %13
    mi re!~
    re dod
    si2

    %16
    la4 re
    dod8[si la sold]
    la4 re

    %19
    dod8[si la sold]
    la4 la'~
    la sol~

    %22
    sol fad~
    fad mi~
    mi re~

    %25
    re dod
    re fad,
    sol8[la si dod]

    %28
    re4 fad,
    sol8[la si dod]
    re[re re re]\mbreak

    %31
    re[re re re]
    fad16 mi fad sol la8 dod,
    re[re dod mi]

    %34
    re dod r dod
    re[dod si la]
    dod re fad r

    %37
    mi r re r
    do r fad\p r
    mi r re r

    %40
    dod4 r
    si\f r
    la r

    %43
    sold r
    fad r8 sold
    la[fad sold? mi]

    %46
    la'4 dod,
    re8[mi fad sold]
    la4 dod,\mbreak

    %49
    re8[mi fad sold]
    la[dod, re dod]
    re dod r dod

    %52
    re[dod si dod]
    re dod re'4~
    re dod~

    %55
    dod si~
    si la~
    la sol~

    %58
    sol fad\mbreak
    sold la~
    la sold

    %61
    la fad
    mi8[re dod si]
    la4 fad'

    %64
    mi8[re dod si]
    la[la la la]
    la'[la la la]

    %67
    dod,16 si dod re mi8 sold,\mbreak
    la mi'16 re dod si la sold
    la mi' sold, mi' la, mi' sol, mi'

    %70
    fad,4 r
    R2\mbreak
    si16 re la re sol, re' fad, re'

    %73
    mi,4 r
    dod'16 mi si mi la, mi' sol, mi'
    fad,4 r

    %76
    sol'16 fad sol la sol la fad sol
    mi8 la16 si la si sol la\mbreak
    fad mi re mi fad sol fad sol

    %79
    fad2~
    fad\tr~
    fad

    %82
    dod16 re dod re mi fad mi fad
    sol la sol la si dod si dod
    fad, sol fad sol\mbreak la si la si

    %85
    mi,8[sol fad mi]
    re dod re4~
    re dod\parentSlur (

    %88
    re) sol~
    sol fad~
    fad mi~

    %91
    mi re~
    re do\parentSlur (
    do) si~

    %94
    si la8 sol
    fad4 r
    sol' si,

    %97
    do8[re mi fad]
    sol4 si,
    do8[re mi fad]

    %100
    sol [si, do si]\mbreak
    do si r si
    do[si do si]

    %103
    la sol fa'?4~
    fa mi
    fad! sol~

    %106
    sol fad~
    fad mi~\mbreak
    mi re~

    %109
    re dod~
    dod re
    mi8[fad sol mi]

    %112
    fad4 re
    mi8[fad sol mi]
    fad[mi fad mi]

    %115
    fad mi r mi,\mbreak
    fad[mi fad mi]
    fad mi re'4~

    %118
    re dod\parentSlur (
    red) mi~
    mi re!~

    %121
    re dod
    si2
    la'4 dod,

    %124
    re8[mi fad sold]
    la4 dod,\mbreak
    re8[mi fad sold]

    %127
    la4 r
    R2
    re,4 fad,

    %130
    sol8[la si dod]
    re4 fad,
    sol8[la si dod]

    %133
    re[fad, sol fad]
    sol fad r fad
    sol[fad sol fad]

    %136
    mi re do'4~
    do si\parentSlur (
    dod?) re~

    %139
    re dod
    si2\mbreak
    sol'8 r fad r

    %142
    mi r mi r
    re4 si'
    la8[sol fad mi]

    %145
    re4 si'
    la8[sol fad mi]\mbreak
    re[re re re]

    %148
    re[re re re]
    fad16 mi fad sol la8 dod,
    re4\fermata r

}

IvlIn =  \relative do'' {

    re4 fad,
    sol8[la si dod]
    re4 fad,

    %4
    sol8[la si dod]
    re4 r8 re,
    sol, re' r4\mbreak

    %7
    r8 re mi re
    do si do'4~
    do si

    %10
    dod! re~
    re dod
    red mi~

    %13
    mi re!\parentSlur (\mbreak
    re) dod
    si2

    %16
    la4 r
    R2
    la4 r

    %19
    R2
    la4 la'~
    la sol~

    %22
    sol fad~\mbreak
    fad mi~
    mi re~

    %25
    re dod
    re fad,
    sol8 [la si dod]

    %28
    re4 fad,
    sol8[la si dod]
    re[re re re]\mbreak

    %31
    re[re re re]
    fad16 mi fad sol la8 dod,
    re re, la' dod,

    %34
    re la' r la
    si[la sol fad]
    mi re re' r

    %37
    dod r si r
    la r re\p r
    dod r si r

    %40
    la4 r
    sold\f r
    fad r

    %43
    mi r\mbreak
    re4 r8 re
    dod[fad re  mi]

    %46
    la'4 dod,
    re8[mi fad sold]
    la4 dod,

    %49
    re8[mi fad sold]
    la4 r8 la,
    re, la' r la\mbreak

    %52
    si8[la sold la]
    si la? re'4~
    re dod~

    %55
    dod si~
    si la~
    la sol~

    %58
    sol fad
    sold la~
    la sold\mbreak

    %61
    la fad
    mi8[re dod si]
    la4 fad'

    %64
    mi8[re dod si]
    la[la la la]
    la'[la la la]

    %67
    dod,16 si dod re mi8 sold,\mbreak
    la4 r
    R2*10

    %79
    r16 re dod si la sol fad mi
    re re' dod si la sol fad mi
    re mi re mi\mbreak fad sol fad sol

    %82
    la8 dod16 re mi fad mi fad
    sol la sol la si dod si dod
    fad, sol fad sol \parenthesize  la \parenthesize  si \parenthesize  la \parenthesize  si

    %85
    mi,8[sol fad mi]\mbreak
    re dod re4~
    re dod\parentSlur (

    %88
    re) sol~
    sol fad~
    fad mi~

    %91
    mi re~
    re do~
    do si~

    %94
    si la8 sol
    fad4 r
    sol' si,

    %97
    do8[re mi fad]
    sol4 si,
    do8[re mi fad]

    %100
    sol4 r8 sol,
    do, sol' r4
    r8 sol la sol

    %103
    fa mi re'4~
    re do?~
    do si\mbreak

    %106
    sol' fad~
    fad mi~
    mi re~

    %109
    re dod
    re' fad,
    sol8[la si dod]

    %112
    re4 fad,\mbreak
    sol8[la si dod]
    re[dod, re dod]

    %115
    re dod r dod,
    re[dod re dod]
    re dod re'4~

    %118
    re dod\parentSlur (\mbreak
    red) mi~
    mi re!~

    %121
    re dod
    si2
    la'4 dod,

    %124
    re8[mi fad sold]
    la4 dod,\mbreak
    re8[mi fad sold]

    %127
    la[la, si sol]
    la[fad la fad]
    re'4 fad,

    %130
    sol8[la si dod]\mbreak
    re4 fad,
    sol8[la si dod]

    %133
    re4 r8 fad,
    sol, re' r4
    r8 re mi re\mbreak

    %136
    do si do'4~
    do si(
    dod?) re~

    %139
    re dod
    si2
    sol'8 r fad r\mbreak

    %142
    mi r mi r
    re4 si'
    la8[sol fad mi]

    %145
    re4 si'
    la8[sol fad mi]
    re[re re re]

    %148
    re[re re re]
    fad16 mi fad sol la8 dod,
    re4\fermata r

}

IvlIIn =  \relative do'' {

    fad,4 re
    mi8[fad sol mi]
    fad4 re

    %4
    mi8[fad sol mi]
    fad4 r8 re
    sol, re' r4\mbreak

    %7
    r8 re mi re
    do si la'4~
    la sol~

    %10
    sol fad
    si la~
    la sold

    %13
    dod si~\mbreak
    si la~
    la sold

    %16
    mi r
    R2
    mi4 r

    %19
    R2
    mi4 mi'
    re re8 mi\mbreak

    %22
    re2
    dod
    si

    %25
    si4 la
    la re,
    mi8[fad sol mi]

    %28
    fad4 re
    mi8[fad sol mi]\mbreak
    fad re' re re

    %31
    si si si la
    la4 la8 la
    la[re, la' dod,]

    %34
    re la' r la\mbreak
    si8[la sol fad]
    mi re re' r

    %37
    dod r si r
    la r re\p r
    dod r si r

    %40
    la4 r
    sold\f r
    fad r

    %43
    mi r
    re r8 re
    dod [fad re mi]

    %46
    dod'4 la\mbreak
    si8 [dod re si]
    dod4 la

    %49
    si8[dod re si]
    dod4 r8 la
    re, la' r la

    %52
    si [la sold la]\mbreak
    si la fad'4
    mi2(

    %55
    fad)(
    sol)(
    fad4) mi~

    %58
    mi re~
    re dod\mbreak
    fad mi

    %61
    mi re
    dod8[si la sold]
    la4 re

    %64
    dod8[si la sold]
    la[la la la]\mbreak
    la[la la la]

    %67
    la4 r8 mi
    mi4 r
    R2*10

    %79
    r16 re' dod si la sol fad mi
    re re' dod si la sol fad mi
    re mi re mi\mbreak fad sol fad sol

    %82
    la8[la la la]
    sol sol mi' si
    si4 la8 la\mbreak  %%% fine pagina

    %85
    la4 r8 fad
    fad4 r8 la
    si4 la

    %88
    fad si
    mi re
    si2~

    %91
    si
    sol~\mbreak
    sol

    %94
    sol4 mi
    fad re'8 do
    si4 sol

    %97
    la8[si do la]
    si4 sol
    la8[si do la]\mbreak

    %100
    si4 r8 sol
    do, sol' r4
    r8 sol la sol

    %103
    fa? mi re'4~
    re do~
    do si\mbreak

    %106
    mi re
    si2
    la

    %109
    sol
    fad4 re'
    mi8[fad sol mi]

    %112
    fad4 re
    mi8[fad sol mi]
    fad[dod re \parenthesize dod]

    %115
    re dod r dod,
    re[dod re dod]
    re dod si'4~

    %118
    si la~
    la sold
    dod si~\mbreak

    %121
    si la~
    la sold
    dod la

    %124
    si8[dod re si]
    dod4 la
    si8[dod re si]

    %127
    dod [fad, sol mi]\mbreak
    fad[re mi dod]
    fad4 re

    %130
    mi8[fad sol mi]
    fad4 re
    mi8[fad sol mi]

    %133
    fad4 r8 re
    sol, re' r4\mbreak
    r8 re mi re

    %136
    do si la'4~
    la sol~
    sol fad

    %139
    si la
    la sold
    la8 r\mbreak la r

    %142
    si r la r
    la4 sol'
    fad8[mi re dod]

    %145
    re4 sol
    fad8[mi re dod]\mbreak
    re[re re re]

    %148
    si[si si si]
    la4 la8 la
    la4\fermata r

}

Ivlan = \relative do' {

    la4 r
    R2
    la4 r

    %4
    R2
    la4 r8 re
    sol, re' r4

    %7
    r8 re mi re\mbreak
    do si mi4
    re2

    %10
    mi4 re
    mi2
    fad4 mi

    %13
    fad2
    mi\mbreak
    fad4 mi

    %16
    dod r4
    R2
    dod4 r

    %19
    R2
    dod4 dod'
    si si8 la\mbreak

    %22
    la2
    sol
    fad

    %25
    mi4 mi
    fad r
    R2

    %28
    la,4 r
    R2
    fad'8 [fad\mbreak fad fad]

    %31
    fad fad sol re
    re4 dod8 mi
    fad re la' dod,

    %34
    re la' r la\mbreak
    \parenthesize si[\parenthesize la \parenthesize sol \parenthesize fad]
    \parenthesize mi \parenthesize re re' r

    %37
    dod r si r
    la r re\p r
    dod r si r

    %40
    la4 r
    sold\f r
    fad r

    %43
    mi r
    re r8 re
    dod[fad re mi]\mbreak

    %46
    mi4 r
    R2
    mi4 r

    %49
    R2
    mi4 r8 la
    re, la' r la

    %52
    si [la sold la]\mbreak
    si la si4~
    si la

    %55
    re2
    dod
    si

    %58
    la4 la
    si la
    si si\mbreak

    %61
    dod r
    R2
    dod,4 r

    %64
    R2
    dod8 [dod dod dod]
    dod dod fad mi

    %67
    mi4 r8 si\mbreak
    dod4 r
    R2*10
    r16 re' dod si la sol fad mi

    %80
    re re' dod si la sol fad mi
    re mi re mi\mbreak fad sol fad sol
    mi8[mi mi mi]

    %83
    mi[mi  mi mi]
    re4 re8 re
    dod4 r8 dod

    %86
    re4 r8 fad\mbreak
    mi4 mi
    re sol

    %89
    la2
    sol
    fad

    %92
    mi
    re
    mi4 mi

    %95
    re re8 fad\mbreak
    re4 r
    R2

    %98
    re4 r
    R2
    re4 r8 sol

    %101
    do, sol' r4
    r8 sol la sol\mbreak
    fa mi la4

    %104
    sol2
    la4 sol
    la2

    %107
    sol
    fad
    mi

    %110
    re4 r
    R2\mbreak
    la'4 r

    %113
    R2
    la8[dod re dod]
    re dod r dod,

    %116
    re[dod re dod]
    re dod fad4
    mi2\mbreak

    %119
    fad4 mi
    fad2
    sold4 la8 mi

    %122
    fad4 mi
    mi r
    R2

    %125
    mi4 r
    R2\mbreak
    mi8 r r4

    %128
    R2
    la,4 r
    R2

    %131
    la4 r
    R2
    la4 r8 re\mbreak

    %134
    la re r4
    r8 re mi re
    do si mi4

    %137
    re2
    mi4 re
    mi2\mbreak

    %140
    fad4 sold8 fad
    mi r re r
    re r dod r

    %143
    fad4 r
    R2
    fad4 r\mbreak

    %146
    R2
    fad8[fad fad fad]
    fad[fad sol mi]

    %149
    re4 dod8 mi
    fad4\fermata r

}

Ibcn = \relative do {

    re4 r
    R2
    re,4 r

    %4
    R2
    re'4 r
    R2*2

    %8
    r4 la'8 sol
    fad[re sol sol,]
    la[la' si la]

    %11
    sold[mi la la,]
    si[si' dod si]
    lad[fad si la]\mbreak

    %14
    sol[mi la la,]
    re[si mi mi,]
    la4 r

    %17
    R2
    la'4 r
    R2

    %20
    la,8[si dod la]
    si[la si dod]
    re[mi fad re]

    %23
    sol[fad sol la]
    si[fad si la]
    sol[mi la la,]\mbreak

    %26
    re4 r
    R2
    re,4 r

    %29
    R2
    re''8[dod si la]
    si[la sol fad]

    %32
    la4 r8 la,
    re,4 r
    R2*12

    %46
    la'4 r
    R2
    la'4 r

    %49
    R2
    la,4 r\mbreak
    R2*2

    %53
    r4 si'8 sol
    sold[mi la la,]
    re[dod re mi]

    %56
    fad[fad, fad' mi]
    re[si mi re]
    dod[la re re,]

    %59
    mi[mi' fad dod]
    re[si mi mi,]
    la4 r

    %62
    R2
    la4 r\mbreak
    R2

    %65
    la'8[sold fad mi]
    fad[mi re dod]
    mi4 r8 mi

    %68
    la,4 r8 si
    dod[si dod la]
    re4 r8 mi

    %71
    fad[mi fad re]
    sol[la si sol]
    sol[fad sol lad]

    %74
    la?[si dod la]\mbreak
    re,[mi fad re]
    sol4 r8 mi

    %77
    la,4 r8 la
    re4 r
    R2*3

    %82
    la'16 si la si dod re dod re
    mi, fad mi fad sol la sol la
    si4 fad16 sol fad sol

    %85
    la4 r8 la
    si4 r8 fad\mbreak
    sol[mi la la,]

    %88
    si[si' mi, re]
    dod[la re re,]
    sol[fad sol la]

    %91
    si[dod re si]
    do[re mi fad]
    sol[la si sol]

    %94
    do[re mi re]
    re[do si la]
    sol4 r

    %97
    R2
    sol,4 r
    R2\mbreak

    %100
    sol'4 r
    R2*2
    r4 re'8 do

    %104
    si[sol do do,]
    si[re' mi re]
    dod![la re re,]

    %107
    sol[fad sol mi]
    fad[la si fad]
    sol[mi la la,]

    %110
    re4 r
    R2
    re,4 r

    %113
    R2*4\mbreak
    r4 si''8 la
    sold[mi la la,]

    %119
    si[si' dod si]
    lad[fad si si,]
    mi,[mi' fad dod]

    %122
    re[si mi mi,]
    la4 r
    R2

    %125
    la'4 r
    R2
    la,4 r

    %128
    R2
    re,4 r\mbreak
    R2

    %131
    re'4 r
    R2
    re,4 r

    %134
    R2*2
    r4 la''8 sol
    fad[re sol sol,]

    %138
    la[la' si la]
    sold[mi la la,]
    re[si re' dod]

    %141
    dod[la re fad,]
    sol[mi la la,]
    re4 r

    %144
    R2\mbreak
    re,4 r
    R2

    %147
    re''8[dod si la]
    si[la sol fad]
    la4 r8 la,

    %150
    re,4\fermata r

}

Ibfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\major
  \time 2/4
  \tempo 2 = 65
  s2*150
  \bar"|."


}

Ifl = {
  \Iglobal
  %\notypeset
  <<\Ifln \forma>>

}

Iob = {
  \Iglobal
  <<\Iobn \forma>>

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

IIfln = \relative do'' {

    R1*2
    r2 la'4. \parenthesize fad8
    re8. dod16 re8 [mi] dod8. re32(mi) la,8. mi'16

    %5
    fad16. mi32 fad16. sol32 fad4\tr\mbreak mi8[sol fad mi]
    re2~re4. dod8~
    dod si16 dod re [mi fad si,] sol'4. sol8

    %8
    fad mi16 re mi8. [fad16]\mbreak re8 si r4
    r mi4~mi8 re16 dod re [dod si lad]
    si'4. sol8 mi8.[red16 mi8 fad]

    %11
    red si r4\mbreak r8 sol'16 fad mi [red dod si]
    mid4. fad8 fad2\fermopz

}

IIobn = \relative do'' {

    fad4. re8 si lad si dod
    lad8. si32(dod) fad,8. dod'16 re16.[dod32 re16. mi32] re4\tr
    dod2 r

    %4
    R1*2
    r8 si' la[sol] fad8. mi16 mi8.[re16]
    re2~re8 dod16 re mi[re dod si]

    %8
    lad4 r fad'4. re8
    si8.[lad16] si8. dod16\mbreak lad8 fad r4
    r2 r4 la'

    %11
    la8 sol16 fad sol[fad mi red?] mi8 mi, r4
    si'16 lad si dod si4\tr lad2\fermopz

}

IIbcn = \relative do {

    si8 dod re si sol' fad sol mi
    fad4 r8 r16 lad si16. lad32 si16. lad32 si8 mi,
    fad sol fad mi re mi fad re

    %4
    si' la si sol la4 r8 r16 dod\mbreak
    re16. dod32 re16. dod32 re8 sol, la si la sol
    fad sol fad mi re sol la lad,

    %7
    si4 r8 re mi4 r8 mi
    fad si dod fad, si, dod re si
    sol' fad sol mi fad4. mi8

    %10
    red dod red dod  do si do si
    si4 si'8 [la sol fad] r4
    sold2 fad\fermata

}

IIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\major
  \time 2/2
  \tempo 4 = 45
  s1*12
  \bar"|."

}

IIfl = {
  \IIglobal
  %\notypeset
  <<\IIfln \forma>>

}

IIob = {
  \IIglobal
  <<\IIobn \forma>>

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

IIIfln = \relative do'' {

    re8
    re re, r re'
    re re, r fad'16 sol
    la8[fad sol mi]

    %4
    fad re r fad16 sol
    la8[fad sol mi]
    fad16 fad fad fad fad fad fad fad \mbreak

    %7
    mi mi mi mi mi mi mi mi
    la la la la la la la la
    re, re re re re re re re

    %10
    dod dod dod dod si si si si \mbreak
    dod re mi fad dod re mi fad
    dod re mi fad dod re mi fad

    %13
    si, dod re mi si dod re mi
    si dod re mi si dod re mi\mbreak
    dod si la si mi,8 sold

    %16
    la[mi' fad mi]
    fad mi r dod
    re[mi fad sol]

    %19
    fad mi la4\mbreak
    r8 red,16 mi fad8[si,]
    sol' mi sol4

    %22
    r8 dod,16 re mi8[la,]
    fad' mi r la
    la sol r si\mbreak

    %25
    si la r dod
    dod si r re
    re dod r mi

    %28
    re16 la la la la la la la
    la la la la la la la la\mbreak
    la la la la la la la la

    %31
    la8 r r la
    la la, r la'
    la la, r dod16 re

    %34
    mi8[dod re si]\mbreak
    dod la r dod16 re
    mi8[dod re si]

    %37
    dod16 dod dod dod dod dod dod dod
    si si si si la' la la la
    sold sold sold sold la la la la\mbreak

    %40
    re, re re re re re re re
    dod dod dod dod dod dod dod dod
    si si si si si si si si

    %43
    dod re mi fad sol fad sol fad\mbreak
    mi re mi fad sol fad sol fad
    mi8 r r4

    %46
    R2
    r8 si'[fad sol]
    fad r r4

    %49
    r8 si[fad sol]
    fad  sol16 fad mi[re dod si]
    lad4 r

    %52
    si'16 fad lad fad si fad lad fad
    si fad lad fad si fad lad fad
    si fad lad fad si fad lad fad

    %55
    sol8 sol sol fad16 mi %%% fine pagina
    fad8 fad fad mi16 re
    mi8 mi mi re16 dod

    %58
    re dod re mi re mi fad sol
    fad si fad sol fad mi re mi
    dod4 r8 si'

    %61
    si si, r si'
    si si, r re16 mi\mbreak
    fad8[re mi dod]

    %64
    re si r re16 mi
    fad8[re mi dod]
    re16 re re re red red red red

    %67
    mi mi mi mi mid mid mid mid
    fad fad fad fad lad lad lad lad
    si si si si\mbreak dod dod dod dod

    %70
    lad lad lad lad si si si si
    si si si si lad lad lad lad
    si4 r

    %73
    r8 fad[sol mi]
    fad re mi dod\mbreak
    re si lad'4\tr

    %76
    si8[fad sol mi]
    red8.\tr dod32(red) mi8.\tr red32(mi)
    fad4 r8 sol

    %79
    fad16 mi fad re mi re mi dod
    re dod re si dod si dod lad\mbreak
    si8 r re'16 dod si re

    %82
    dod lad fad dod' re dod si re
    lad si dod lad re dod si re
    dod lad fad dod' re dod si dod

    %85
    lad si dod lad re dod si re\mbreak
    re re re re dod si la? dod
    dod dod dod dod si la sol la

    %88
    si si si si la la la la,
    la la la sol' fad fad fad fad
    mi mi mi mi mi mi mi mi\mbreak

    %91
    re4 r8 re
    re re, r re'
    re re, r fad'16 sol

    %94
    la8[fad sol mi]
    fad re r fad16 sol
    la8[fad sol mi]

    %97
    fad16 fad fad fad\mbreak re re re re
    mi mi mi mi dod dod dod dod
    re re re re do' do do do

    %100
    si si si si re re re re
    dod! dod dod dod re re re re\mbreak
    sol, sol sol sol sol sol sol sol

    %103
    fad fad fad fad fad fad fad fad
    mi mi mi mi mi mi mi mi
    re re re re la' la la la\mbreak

    %106
    fad mi re mi la,8 dod
    re4\fermata r

}

IIIobn = \relative do'' {

    re8
    re re, r re'
    re re, r fad'16 sol
    la8[fad sol mi]

    %4
    fad re r fad16 sol
    la8[fad sol mi]
    fad16 fad fad fad fad fad fad fad \mbreak

    %7
    mi mi mi mi mi mi mi mi
    la la la la la la la la
    re, re re re re re re re

    %10
    dod dod dod dod si si si si \mbreak
    dod re mi fad dod re mi fad
    dod re mi fad dod re mi fad

    %13
    si, dod re mi si dod re mi
    si dod re mi si dod re mi\mbreak
    dod si la si mi,8 sold

    %16
    fad dod' re dod
    re dod r la\mbreak
    si[dod re mi]

    %19
    re dod dod4
    si8 si16 dod red8 si
    si sol r si

    %22
    la la16 si dod8 la\mbreak
    la fad re'16 la fad do'
    si16 do re si mi si sold re'

    %25
    dod! re mi dod fad dod lad mi'
    re mi fad re sol re si fad'\mbreak
    mi fad sol mi la mi dod sol'

    %28
    fad8[mi fad sol]
    fad[mi fad sol]
    fad[dod re fad]

    %31
    dod4 r8 la'
    la la, r la'\mbreak
    la la, r dod16 re

    %34
    mi8[dod re si]\mbreak
    dod la r dod16 re
    mi8[dod re si]

    %37
    dod16 dod dod dod dod dod dod dod
    si si si si la' la la la
    sold sold sold sold la la la la\mbreak

    %40
    re, re re re re re re re
    dod dod dod dod dod dod dod dod
    si si si si si si si si

    %43
    dod re mi fad sol fad sol fad\mbreak
    mi re mi fad sol fad sol fad
    mi8[dod fad dod]

    %46
    re dod16 si fad'8 sol
    fad r r4
    r8 re16 mi fad8 sol\mbreak

    %49
    fad r r4
    r8 si, si' si
    fad dod16 re mi re mi dod

    %52
    re8[mi fad mi]
    re[mi fad mi]
    re[mi fad mi]

    %55
    fad mi16 red mi8 mi\mbreak
    mi re!16 dod re8 re
    re dod16 si dod8 dod

    %58
    dod si16 lad si dod re mi
    re mi re mi re dod si dod
    lad4 r8 si'

    %61
    si si, r si'
    si si, r re16 mi\mbreak
    fad8[re mi dod]

    %64
    re si r re16 mi
    fad8[re mi dod]
    re16 re re re red red red red

    %67
    mi mi mi mi mid mid mid mid
    fad fad fad fad lad lad lad lad
    si si si si\mbreak dod dod dod dod

    %70
    lad lad lad lad si si si si
    si si si si lad lad lad lad
    si8[fad sol mi]

    %73
    fad[re mi dod]
    re si lad'4\tr
    si8[fad sol mi]

    %76
    red8.\tr dod32(red) mi8.\tr red32(mi)
    fad4 r8 sol
    fad16 mi fad re mi re mi dod

    %79
    re dod re si dod si dod lad
    fad' mi fad re mi re mi dod
    re8 si r fad'

    %82
    fad16 sol fad8 fad16 sol fad8
    fad fad, r fad'
    fad16 sol fad8 fad16 sol fad8

    %85
    fad fad, fad'16 fad fad fad
    mi fad sol fad\mbreak mi mi mi mi
    re mi fad mi re re re re

    %88
    dod re mi re mi fad sol fad
    dod re mi dod re re re re
    re re re re dod dod dod dod

    %91
    re4 r8 re
    re re, r re'
    re re, r fad'16 sol

    %94
    la8[fad sol mi]
    fad re r fad16 sol
    la8[fad sol mi]

    %97
    fad16 fad fad fad\mbreak re re re re
    mi mi mi mi dod dod dod dod
    re re re re do' do do do

    %100
    si si si si re re re re
    dod! dod dod dod re re re re\mbreak
    sol, sol sol sol sol sol sol sol

    %103
    fad fad fad fad fad fad fad fad
    mi mi mi mi mi mi mi mi
    re re re re la' la la la\mbreak

    %106
    fad mi re mi la,8 dod
    re4\fermata r

}

IIIvlIn =  \relative do'' {

    re8
    re re, r re'
    re re, r fad'16 sol
    la8[fad sol mi]

    %4
    fad re r fad16 sol
    la8[fad sol mi]
    fad16 fad fad fad fad fad fad fad \mbreak

    %7
    mi mi mi mi mi mi mi mi
    la la la la la la la la
    re, re re re re re re re

    %10
    dod dod dod dod si si si si \mbreak
    dod re mi fad dod re mi fad
    dod re mi fad dod re mi fad

    %13
    si, dod re mi si dod re mi
    si dod re mi si dod re mi\mbreak
    dod si la si mi,8 sold

    %16
    la4 r8 la
    la, la' r4\mbreak
    r8 la la la,

    %19
    dod la' fad16 sol la fad
    red mi fad red si dod red si
    mi sol si mi mi, fad sol mi\mbreak

    %22
    dod re mi dod la si dod la
    re fad la re fad, sol la fad
    sol, la si sol sold' la si sold

    %25
    la, si dod la lad' si dod lad\mbreak
    si, dod re si si' dod re si
    dod, re mi dod dod' re mi dod

    %28
    re la dod la re la dod la
    re la dod la re la dod la\mbreak
    re la dod la re la fad re

    %31
    la'4 r8 la'
    la la, r la'
    la la, r dod16 re

    %34
    mi8[dod re si]\mbreak
    dod la r dod16 re
    mi8[dod re si]

    %37
    dod16 dod dod dod dod dod dod dod
    si si si si la' la la la
    sold sold sold sold la la la la\mbreak

    %40
    re, re re re re re re re
    dod dod dod dod dod dod dod dod
    si si si si si si si si

    %43
    dod re mi fad sol fad sol fad\mbreak
    mi re mi fad sol fad sol fad
    mi8 r r4

    %46
    R2*14
    r4 r8 si'
    si si, r si'

    %62
    si si, r re16 mi\mbreak
    fad8[re mi dod]

    %64
    re si r re16 mi
    fad8[re mi dod]
    re16 re re re red red red red

    %67
    mi mi mi mi mid mid mid mid
    fad fad fad fad lad lad lad lad
    si si si si\mbreak dod dod dod dod

    %70
    lad lad lad lad si si si si
    si si si si lad lad lad lad
    si4 r

    %73
    R2*8
    r4 si,16 dod re si
    lad si dod lad si dod re si

    %83
    lad si dod lad si dod re si\mbreak
    fad sold lad fad si dod re si
    lad si dod lad si dod re si

    %86
    sol la? si sol la si dod la
    fad sol la fad sol la si sol\mbreak
    mi fad sol mi dod re mi dod

    %89
    la si dod la re mi fad re
    sol la si sol la sol la la,
    re4 r8 re'

    %92
    re re, r re'
    re re, r fad'16 sol

    %94
    la8[fad sol mi]
    fad re r fad16 sol
    la8[fad sol mi]

    %97
    fad16 fad fad fad\mbreak re re re re
    mi mi mi mi dod dod dod dod
    re re re re do' do do do

    %100
    si si si si re re re re
    dod! dod dod dod re re re re\mbreak
    sol, sol sol sol sol sol sol sol

    %103
    fad fad fad fad fad fad fad fad
    mi mi mi mi mi mi mi mi
    re re re re la' la la la\mbreak

    %106
    fad mi re mi la,8 dod
    re4\fermata r

}

IIIvlIIn =  \relative do'' {

    r8 r fad,16 sol la8 fad
    r fad16 sol la8 re16 mi
    fad8[re mi dod]

    %4
    re fad,16 sol la8 re16 mi\mbreak
    fad8[re mi dod]
    re16 re re re re re re re

    %7
    re re re re re re re re
    dod dod dod dod dod dod dod dod
    si si si si si si si si

    %10
    la la la la sold sold sold sold
    la si dod re la si dod re
    la si dod re la si dod re\mbreak

    %13
    sold, la si dod sold la si dod
    sold la si dod sold la si sold
    la8[mi mi mi]

    %16
    mi4 r8 la
    dod, la' r4\mbreak
    r8 la la la,

    %19
    la la' fad16 sol la fad
    red mi fad red si dod red si
    mi sol si mi mi, fad sol mi\mbreak

    %22
    dod re mi dod la si dod la
    re fad la re fad, sol la fad
    sol, la si sol sold' la si sold

    %25
    la, si dod la lad' si dod lad\mbreak
    si, dod re si si' dod re si
    dod, re mi dod dod' re mi dod

    %28
    re la dod la re la dod la
    re la dod la re la dod la\mbreak
    re la dod la re la fad re

    %31
    la'4 r8 dod16 re
    mi8 la, r re16 mi
    mi8 la, r la16 si

    %34
    mi8 [dod\mbreak si sold]
    la mi r la16 si
    dod8 [la si sold]

    %37
    la16 la la la la la la la
    si si si si\mbreak red red red red
    mi mi mi mi  mi mi mi mi

    %40
    si si si si si si si si
    la la la la la la la la
    la la la la\mbreak sold sold sold sold

    %43
    la si dod re mi re mi re
    dod si dod re mi re mi re
    dod8 r r4

    %46
    R2*15
    r8 re16 mi fad8 si,
    r re16 mi fad8 si,16 dod

    %63
    re8[si dod lad]
    si re16 mi fad8 si,16 dod
    fad8[re mi lad,]\mbreak

    %66
    si16 si si si la  la la la
    si si si si si si si si
    dod dod dod dod fad fad fad fad

    %69
    fad fad fad fad sol sol sol sol\mbreak
    fad fad fad fad fad fad fad fad
    sol sol sol sol fad fad fad fad

    %72
    fad8 r r4
    R2*8
    r4 si,16 dod re si\mbreak

    %82
    lad si dod lad si dod re si
    fad sold lad fad si dod re si
    lad si dod lad si dod re si

    %85
    fad sold lad fad\mbreak  si dod re si
    sol? la? si sol la si dod la
    fad sol la fad sol la si sol

    %88
    mi fad sol mi dod re mi dod
    la si dod la\mbreak re mi fad re
    sol la si sol la sol la dod,

    %91
    re4 r8 fad16 sol
    la8 fad r fad16 sol
    la8 fad r re'16 mi\mbreak

    %94
    fad8[re mi dod]
    re la r re16 mi
    fad8[re mi dod]

    %97
    re16 re re re si si si si\mbreak
    si si si si la la la la
    la la la la fad' fad fad fad

    %100
    sol sol sol sol sold sold sold sold
    la la la la\mbreak la la la la
    mi mi mi mi mi mi mi mi

    %103
    re re re re re re re re
    mi mi mi mi dod dod dod dod\mbreak
    re re re re la' la la la

    %106
    fad re re re dod8 la
    la4\fermata r

}

IIIvlan = \relative do' {

    r8 r re16 mi fad8 re
    r re16 mi fad8 re
    R2

    %4
    r8 re16 mi fad8 re\mbreak
    r4 r8 la'
    la16 la la la si si si si

    %7
    si si si si sol sol sol sol
    mi mi mi mi fad fad fad fad
    fad fad fad fad\mbreak sold sold sold sold

    %10
    mi mi mi mi mi mi  mi mi
    mi mi mi mi mi mi  mi mi
    mi mi mi mi mi mi  mi mi

    %13
    mi mi mi mi mi mi  mi mi
    mi mi mi mi mi mi  mi mi
    mi re dod re si8 si

    %16
    dod4 r8 la'\mbreak
    la, la' r4
    r8 la la la,

    %19
    la la' fad16 sol la fad
    red mi fad red si dod red si
    mi sol si mi\mbreak mi, fad sol mi

    %22
    dod re mi dod la si dod la
    re fad la re fad, sol la fad
    sol, la si sol sold' la si sold\mbreak

    %25
    la, si dod la lad' si dod lad
    si, dod re si si' dod re si
    dod, re mi dod dod' re mi si

    %28
    re la dod la\mbreak re la dod la
    re la dod la re la dod la
    re la dod la re la fad re

    %31
    la'4 r8 la16 si
    dod8 la r la16 si\mbreak
    dod8 la r4

    %34
    r r8 mi
    mi dod r4
    r r8 mi

    %37
    mi16 mi mi mi fad fad fad fad
    fad fad fad fad\mbreak si si si si
    si si si si la la la la

    %40
    fad fad fad fad sold sold sold sold
    mi mi mi mi fad fad fad fad
    fad fad fad fad mi mi mi mi

    %43
    mi mi la la la la la la
    la la la la la la la la
    la8 r r4

    %46
    R2*15
    r8 si16 dod re8 si
    r si16 dod re8 si

    %63
    R2
    r8 si16 dod re8 si
    r4 r8 fad

    %66
    fad16 fad fad fad\mbreak fad fad fad fad
    mi mi mi mi sold sold sold sold
    fad fad fad fad mi' mi mi mi

    %69
    re re re re dod dod dod dod\mbreak
    dod dod dod dod re re re re
    dod dod dod dod dod dod dod dod

    %72
    re8 r r4
    R2*17
    sol,16 la si sol\mbreak la sol la la,

    %91
    re4 r8 re16 mi
    fad8 re r re16 mi
    fad8 re r4

    %94
    r r8 la'\mbreak
    la fad r4
    r r8 la

    %97
    la16 la la la fad fad fad fad
    mi mi mi mi mi mi mi mi\mbreak
    re re re re re' re re re

    %100
    re re re re mi mi mi mi
    mi mi mi mi re re re re
    si si si si dod dod dod dod\mbreak

    %103
    la la la la si si si si
    si si si si la la la la
    la la la la la la la la

    %106
    si si si si la8 la\mbreak
    fad4\fermata r

}

IIIbcn = \relative do {

    r8
    r re' re re,
    r re' re re,
    R2

    %4
    r8 re' re re,
    r4 r8 la'
    re,16 mi fad re si' dod re si

    %7
    sold la si sold mi fad sold mi
    dod' re mi dod\mbreak fad, sold la fad
    si, dod re si mi, fad sold mi

    %10
    la si dod re mi fad sold mi
    la la la la la la la la
    la la la la la la la la

    %13
    mi mi mi mi mi mi mi mi\mbreak
    mi mi mi mi mi mi mi mi
    la8 dod, mi mi

    %16
    la,4 r
    R2*14
    r8 la' la la,

    %32
    r la' la la,
    r la' la la,
    R2

    %35
    r8 la' la la,\mbreak
    r4 r8 mi'
    la,16 si dod la fad' sold la fad

    %38
    red mi fad red si dod red si
    mi fad sold mi dod re? mi dod
    si dod re si mi fad sold mi

    %41
    la, si dod la\mbreak fad' sold la fad
    re mi fad re mi re mi mi,
    la la la la la la la la

    %44
    la la la la la la la la
    la8 r lad r
    si si16 dod re8 mi\mbreak

    %47
    re si16 dod re8 mi
    re si16 dod re8 mi
    re si16 dod re8 mi

    %50
    re r mi r
    fad r lad, r\mbreak
    si[dod re dod]

    %53
    si[dod re dod]
    si[dod re red]
    mi mi dod la

    %56
    re[re si sol]
    dod [dod lad fad]
    si4 r

    %59
    si'8[si re, mi]\mbreak
    fad fad16 mi re fad mi re
    si8[si' si si,]
    r si'[si si,]

    %63
    R2
    r8 si'[si si,]
    r4 r8 fad'

    %66
    si,16 dod re si fad' sol la fad\mbreak
    sol la si sol sold la si sold
    lad si dod lad dod, re mi dod

    %69
    re mi fad re mi fad sol mi
    fad sold lad fad re mi fad re\mbreak
    mi fad sol mi fad mi fad fad,

    %72
    si2~
    si2~
    si2~

    %75
    si2~
    si2~
    si2~

    %78
    si2~
    si2~
    si2~

    %81
    si4 r
    R2*9\mbreak
    r8 re' re re,

    %92
    r re' re re,
    r re' re re,
    R2

    %95
    r8 re' re re,
    r4 r8 la'
    re,16 mi fad re si' dod re si\mbreak

    %98
    sol la si sol la si dod la
    fad sol la fad re mi fad re
    sol, la si sol mi fad sold mi

    %101
    la si dod la fad' sol la fad
    mi fad sol mi la si dod la\mbreak
    re, mi fad re si dod re si

    %104
    sol la si sol la si dod la
    fad sol la fad fad' sol la fad
    sol la si sold la8 la,

    %107
    re,4_\fermata r

}

IIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key re\major
  \time 2/4
  \tempo 2 = 55
  \partial 8 s8
  s2*107
  \bar"|."

}

IIIfl = {
  \IIIglobal
  %\notypeset
  <<\IIIfln \forma>>

}

IIIob = {
  \IIIglobal
  <<\IIIobn \forma>>

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
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

    \header {
        subtitle = \markup {Concerto per Flauto traverso e Oboe [FaWV L:D10]}
        composer = \markup\center-column {"J. F. Fasch (1688 -1758)"}
    }

    \paper  {

  systems-per-page = #3

}

  \markup\huge "[1.] Vivace"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.instrumentName =  \markup \center-column{"Flauto""Traverso"}
            \set Staff.midiInstrument = #"flute"
            \Ifl
          >>

          \new Staff <<
            \set Staff.instrumentName =  \markup \center-column{"Hautbois"}
            \set Staff.midiInstrument = #"oboe"
            \Iob
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup {"Violino 1"\super "mo"}
            \IvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup {"Violino 2"\super "do"}
            \IvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"Viola"}
          \Ivla
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"Violone grosso et""Basso Continuo"}
          \Ibc
        >>
      >>

    }

    \layout {

      indent = 3\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

\bookpart { \paper  {

  systems-per-page = #5

}

  \markup\huge "[2.] Largo"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

          \new Staff <<
            \set Staff.instrumentName =  \markup \center-column{"Flauto""Traverso"}
            \set Staff.midiInstrument = #"flute"
            \IIfl
          >>

          \new Staff <<
            \set Staff.instrumentName =  \markup \center-column{"Hautbois"}
            \set Staff.midiInstrument = #"oboe"
            \IIob
          >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.instrumentName = \markup \center-column{"Violone grosso et""Basso Continuo"}
          \set Staff.midiInstrument = #"cello"
          \IIbc
        >>
      >>

    }

    \layout {

      indent = 3\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

  systems-per-page = #3

}

  \markup\huge "[3.] Allegro"

  \score {
    {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.instrumentName =  \markup \center-column{"Flauto""Traverso"}
            \set Staff.midiInstrument = #"flute"
            \IIIfl
          >>

          \new Staff <<
            \set Staff.instrumentName =  \markup \center-column{"Hautbois"}
            \set Staff.midiInstrument = #"oboe"
            \IIIob
          >>
        >>

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup {"Violino 1"\super "mo"}
            \IIIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup {"Violino 2"\super "do"}
            \IIIvlII
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"Viola"}
          \IIIvla
        >>

        \new Staff \with {
          fontSize = #+1
          \override StaffSymbol #'staff-space = #(magstep +1)
        } <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"Violone grosso et""Basso Continuo"}
          \IIIbc
        >>
      >>

    }

    \layout {

      indent = 3\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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