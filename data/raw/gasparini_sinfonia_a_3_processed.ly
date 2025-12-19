\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}


IvlIn = \relative do'' {

    \footnote #' (-1 . 2) \markup\column\smaller {"Senza indicazioni di tempo" "  "} mi2 r\fermata
    mi2 r\fermata
    mi2. re8 do

    %4
    re4 do si2
    r\fermata r4 la'
    fa2\mbreak fa4 la~

    %7
    la sol8 fad sol2~
    sol4 fa? mi2
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

    %10
    r4 do fa2~
    fa8 mi re do si4 do
    si2 r4 re

    %13
    do2. re4~\mbreak
    re4 do si do
    si2 dod

    %16
    R1*2
    r2 mi8[mi16 mi mi8 mi]\mbreak
    do8 la do re mi[re16 do si do re si]

    %20
    do4 mi8 la fad sol la4
    sold2 la8[la16 la la8 la]
    sold mi fad sold la[sold16 fad mi fad sold mi]

    %23
    fa?8[mi16 re do8 re]\mbreak si mi re mi  %% inizio p. 6
    do16 mi re do si8. si16 la2
    mi'8[mi16 mi mi8 mi] red si dod red

    %26
    mi[red16 dod si8 dod] red4 mi
    dod8 red mi4 mi4. red8\mbreak
    mi[mi16 mi mi8 mi] do?4 r

    %29
    re?8 [re16 re re8 re] si4 do
    si4. si8 la2
    mi'8[mi16 mi mi8 mi] do4 r

    %32
    re8[re16 re re8 re] si si si si\mbreak
    do[do16 do do8 do] la si do4\parentSlur (
    do4.) si8 do[sol'16 sol sol8 sol]

    %35
    la4 r sol8[sol16 sol sol8 sol]
    sol4 r la8[la16 la la8 la]
    sol4 r sol8[sol16 sol sol8 do]\mbreak

    %38
    la la la la sold4 la\parentSlur (
    la) sold la8[la16 la la8 la]
    sold8.[mi16 fad8 sold] la sold16 fad mi fad sold mi

    %41
    fa!2. mi4~
    mi re\mbreak mi8 re16 do si do re si
    do4 mi2 re4~

    %44
    re do si2
    la r
    r mi'8[mi16 mi mi8 mi]\mbreak

    %47
    do la do re mi re16 do si do re si
    do8 do la si  sold4 r
    r la'2 sol?4~

    %50
    sol fa mi4. mi8
    fad2 la8[la16 la la8 la]\mbreak
    fad4 r si8[si16 si si8 si]

    %53
    do4 r fa,? r
    sol r sol8[sol16 sol sol8 sol]
    la[la16 la la8 la] sol[sol16 sol sol8 sol]

    %56
    sol4 r8 sol\mbreak la4 r8 la  %% inizio p. 13
    sol4 r8 sol fa mi re16 mi fa sol
    mi4 r mi8[mi16 mi mi8 mi]

    %59
    re4 r re8[re16 re re8 re]
    dod4 r8 fa mi4 r8 mi\mbreak
    re4 r8 la' sol fa mi16 fad sol la

    %62
    fad4 r re8[re16 re re8 re]
    dod la si dod re4 r8 si'
    mi,4 r8 mi fad4 r8 fad

    %65
    mi4 r\mbreak re8[re16 re re8 re]
    do la do re mi4 r8 mi
    si'[si16 si si8 si] sold mi fad sold

    %68
    la sold?16 fad? mi fad sold mi fa?8[mi16 re do8 re]
    si4 r8 mi mi4 r8 do\mbreak
    do4 r8 fa mi4 r8 la

    %71
    la[la la8. sold16] la4 r8 mi
    la4 r8 la sold4 r8 mi
    re[do si la16 si] dod4 r\fermata%\pageBreak

    %74 OOKK
    sol'2 fad
    r4 si sol2
    fad r\fermata

    %77
    r4 sold la mi
    fa mi mi la,
    la2 la

    %80
    r4 la' fa2
    mi r4 la~
    la sold\mbreak la la

    %83
    sol?2 fa4 do
    re mi mi mi~
    mi re mi mi~

    %86
    mi re2 do4
    si2 la  %%%% OK
    R2.*2

    %90
    la8 sol la si do la
    mi' re mi fa mi re
    do re do si la4

    %93
    sold la si
    la8 si do re do4\mbreak
    si mi8 re do si

    %96
    do4 do8 re mi4
    mi8 re mi fad sol mi
    si'4 sold8 fa mi4

    %99
    mi mi4. red8
    mi2.
    r4 mi2 re4 %%% 4/4

    %102
    mi mi,2 re4
    mi mi'2 re4~
    re do8 fa si,2   %%% OK

    %105
    la8 sol la si do la %% 3/4
    mi' fa mi re mi si
    do mi la, re do re\mbreak

    %108
    si re si re mi si
    do si do mi la, si
    sold fad sold la si sold

    %111
    la si do si do re
    mi re mi fad sold mi
    la4 r r\mbreak

    %114
    R2.
    la,8 sold? la si do la
    mi'2 fa  %%% 4/4
    mi re

    %118
    do si
    la si'
    la sol

    %121
    fad mi4 mi~
    mi re2 do4\mbreak
    re2 la4 mi

    %124
    fad2 sold4 la~
    la sold la2

}


IvlIIn = \relative do'' {

    do2 r\fermata
    si r\fermata
    do fa~

    %4
    fa mi
    r\fermata r4 mi~
    mi re8 dod\mbreak re4 dod

    %7
    re2. dod8 si
    dod4 re2 dod4
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

    %10
    r4 mi2 re8 do?
    re do si la sold4 la
    sold2 r4 si~

    %13
    si la8 sold la2\mbreak
    sold4 la mi' la,~
    la sold la2

    %16
    mi'8[mi16 mi mi8 mi] do la do re
    mi re16 do si do re si do4 r8 re
    si[re do8. si16] la4 sold\mbreak

    %19
    la4. si8 sold4 r
    R1
    mi'8[mi16 mi mi8 mi] do la do re

    %22
    mi re16 do si do re si do4. si16 do
    la8[la16 la la8 la]\mbreak sold mi fad sold
    la[la la8. sold16] la2

    %25  OOOKK
    r si'8[si16 si si8 si]
    sol8 mi sol la si[la16 sol fad8 sol]
    la4 sold fad2\mbreak

    %28
    sold4 r la8[la16 la la8 la]
    fad4 r8 fad sold4 la
    la sold la r

    %31
    r2 la8[la16 la la8 la]
    fa?4 r sol8[sol16 sol sol8 sol]\mbreak
    mi mi mi mi fa[fa16 fa fa8 mi]

    %34
    do4. re8 mi[mi16 mi mi8 mi]
    fa4 r re8[re16 re re8 re]
    mi4 r fa8[fa16 fa fa8 fa]

    %37
    re4 r mi8[mi16 mi mi8 mi]\mbreak
    fa  mi re do si4 do
    si4. si8 dod2

    %40
    mi8[mi16 mi mi8 mi] do8.[la16 si8 do]
    re[do16 si la si do la] si2
    la\mbreak sold4 r

    %43
    la'8[sol16 fa mi fa sol mi] fa2
    mi4 la2 sold4
    la8[la16 la la8 la] sold mi fad sold

    %46
    la[sold?16 fad? mi re mi fad] sold!4 r8 sold\mbreak
    la mi la si mi,[mi16 mi mi8 mi]
    do la do re mi[re16 do si do re si]

    %49
    do4 la si2
    dod4 re2 dod4
    re2 mi8[mi16 mi mi8 mi]\mbreak

    %52
    re4 r sol8[sol16 sol sol8 sol]
    sol4 r do, r
    re r mi8[mi16 mi mi8 mi]

    %55
    fa[fa16 fa fa8 fa] re[re16 re re8 re]
    mi4 r8 do\mbreak do4 r8 re
    si4 r8 do la do si4

    %58
    do r do8[do16 do do8 do]
    si4 r  la8[la16 la la8 la]
    la4 r8 la' sol4 r8 la\mbreak

    %61
    fa4 r8 fa re[re re8. dod16]
    re4 r fad r
    la8[la16 la la8 la] fad re fad sol

    %64
    la4 r8 dod, la4 r
    la8[la16 la la8 la]\mbreak fad re fad sol
    la4 r8 la si4 r8 sol'

    %67
    fad4 r mi8[mi16 mi mi8 mi]
    do la si do re [do16 si la si do la]
    sold4 r8 si la4 r8 mi'\mbreak

    %70
    la,4 r8 la sold4 r8 mi'
    re[do si la16 si] do4 r8 do
    do4 r8 fa mi4 r8 la

    %73
    la[la la8. sold16] la4 r\fermata
    mi2 red
    fad2. mi4~

    %76
    mi red r2\fermata
    r r4 dod
    re2 do!4 sol'~

    %79
    sol fa? mi2
    r r4 re~
    re dod re mi

    %82
    re2\mbreak do?4 la
    la2 la4 mi'
    re2 do4 si

    %85
    la2 sold4 mi
    fad2 sold4 la~
    la sold la2

    %88
    la8 sol la si do la
    mi' re mi fa mi re
    do re do si la4

    %91
    si sold mi
    la mi'8 re do4
    si do re8 si

    %94
    do4 la mi'\mbreak
    mi do8 re mi4
    mi8 fa mi re do4

    %97
    si sol'8 fad mi sol
    fad4 si8 la sol?4
    sol fad4. fad8

    %100
    mi fad mi re mi si\mbreak
    do4 mi fa?2
    mi4 la, fa2

    %103
    mi fad
    sold4 la2 sold4
    la2.

    %106
    mi8 re mi fad sold mi
    la si do si la si\mbreak
    sold la sold la si sold

    %109
    la si la si mi re
    si la si do re si
    do si la sold la si

    %112
    sold si sold re' mi si
    do si do re do re
    si la si do re si\mbreak

    %115
    do mi do mi do re
    si4 mi2 re4~
    re do2 si4~

    %118
    si la2 sold4
    la la'2 sol4~
    sol fad2 mi4~

    %121
    mi red mi mi,
    fad2 sold4 la~
    la sold la mi'~

    %124
    mi re2 do4
    si2 la

}

Ivlan = \relative do'' {

    la2 r\fermata
    sold r\fermata
    la1~

    %4
    la2. sold4
    r2\fermata r4 mi
    re4. la'8\mbreak fa4 mi

    %7
    re4. re8 re4 sol
    mi8 la, la4 la2
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

    %10
    r4 la' fa2
    la8 do, re la' mi2
    mi r4 mi

    %13
    mi2. re8 do\mbreak
    si4 mi sold mi
    mi2 mi

    %16
    R1
    r2 la8[la16 la la8 la]
    sold mi fad sold la sold16 fad mi fad sold mi\mbreak

    %19
    fa2 mi8[mi16 mi mi8 mi]
    do la do mi~mi re16 do re4
    mi2 r

    %22
    r mi8[mi16 mi mi8 mi]
    re do16 si la si do re\mbreak mi4 mi
    la8 mi mi4 mi2

    %25
    R1
    mi8[mi16 mi mi8 mi] red si la si
    dod4. mi8 si2\mbreak

    %28
    si8[sold'16 sold sold8 sold] mi4 r
    fad8[fad16 fad fad8 fad] re4 mi
    mi4. mi8 mi[la16 la la8 la]

    %31
    sold4 r r2
    fa8[fa16 fa fa8 fa] sol re re re\mbreak
    mi sol sol sol la sol fa do'

    %34
    sol4. sol8 sol[do16 do do8 do]
    do4 r si8[si16 si si8 si]
    do4 r do8[do16 do do8 do]

    %37
    si4 r do8[do16 do do8 mi]\mbreak
    re do si la mi4 la
    mi4. mi8 mi2

    %40
    R1
    la8[la16 la la8 la] sol mi fa sol]
    la2\mbreak si4 mi

    %43
    la, r r2
    r mi'8[mi16 mi mi8 mi]
    do la do re mi[re16 do si do re si]

    %46
    do8 mi la, si sold mi mi mi %%% fine p 10  OOKK
    mi4 r8 mi si' mi, fad sold
    la mi fa?4 mi2

    %49
    mi4 re re2
    la4 la' la4. la8
    fad[fad16 fad fad8 fad] mi4 r\mbreak

    %52
    fad8[fad16 fad fad8 fad] sol4 r
    sol8[sol16 sol sol8 sol] la[la16 la la8 la]
    si[si16 si si8 si] do4 r

    %55
    do r si r
    do r8 mi,\mbreak fa4 r8 re
    re4 r8 mi do sol' sol4

    %58
    sol r sol8[sol16 sol sol8 sol]
    sol4 r fa8[fa16 fa fa8 fa]
    mi4 r8 do do4 r8 dod\mbreak

    %61
    re4 r8 re sib8 la la4
    la r la' r8 la
    mi4 r re'8[re16 re re8 re]

    %64
    dod la si dod re4 r8 re,
    dod4 r8 mi\mbreak fad4 r
    la8[la16 la la8 la] sol8 mi sol la

    %67
    si4 r8 fad sold4 r
    la8[la16 la la8 la] fa? re mi fa
    mi4 r8 sold la4 r8 la\mbreak

    %70
    fa4 r8 re' si4 r8 do
    fa, mi mi4 mi r8 la
    fa4 r8 re' si4 r8 si

    %73
    fa mi mi4 mi r\fermata
    si'2 si~
    si4 si si2

    %76
    si r\fermata
    R1
    r4 sold la mi

    %79
    re2. dod4
    r mi2 re4
    la'4. sol8 fa4 mi

    %82
    mi2\mbreak r4 re'~
    re dod re do
    si2 la4 sold

    %85
    do re si do
    la si sold mi
    mi2 mi

    %88 OOKK
    R2.*6
    la8 sol la si do si\mbreak
    mi, re mi fa mi re

    %96
    do re do si la la'
    sol4 si si
    red red, mi

    %99
    si' si2
    si2.
    r4 si la2

    %102
    sold4 mi la la,
    sold2 la
    mi'4 do mi2

    %105
    mi2.
    R
    la,8 sold la si do la\mbreak

    %108
    mi' fa mi re si mi
    mi sol mi mi do fa
    mi fad? mi la fad sold

    %111
    mi sold mi sold mi la
    mi fad sold la si sold
    la4 r r

    %114
    sold8 fa sold la si sold\mbreak
    mi sold mi sold mi fad
    sold2 la

    %117
    fa?4. mi8 fad?4 re
    mi do fa? mi
    mi2 do4.  si8

    %120
    do4 la si sol?
    do si si si'
    la2 sold4 mi\mbreak

    %123
    mi2 mi4 si'
    la2 sold4 mi
    mi2 mi

}

IbcIn = \relative do {

    la2 r\fermata
    mi' r\fermata
    la,1

    %4
    la2 mi'
    r\fermata dod
    re\mbreak re4 la

    %7
    si4. la8 sol4. re'8
    la4 re la2
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

    %10
    la2 re
    re mi4 la,
    mi'2 sold,

    %13
    la la\mbreak
    mi'4 la, sold la
    mi2 la

    %16
    R1*3
    la'8 [la16 la la8 la] sold8  mi fad sold
    la sold?16 fad? mi fad sold mi fad2

    %21
    mi r
    mi8[mi16 mi mi8 mi] do la si do
    re mi fa?4\mbreak mi4. mi8

    %24
    fa re mi4 la8[la16 la la8 la]
    sol8 mi sol la si4. si,8
    mi2 si4. sold8

    %27
    dod4 sold8 la si2\mbreak
    mi4 r la,8 si do la
    re4. re8 si4 la

    %30
    mi'2 la,8 si do re
    mi2 la,8[do16 do do8 do]
    re4 r sol8 sol sol, sol\mbreak

    %33 fine p. 7
    do do do do fa8 sol la fa
    sol fa sol sol, do re mi do
    fa sol la fa sol la si sol

    %36
    do si la sol fa sol la fa
    sol fa mi re do re mi do\mbreak
    re mi fa re  mi re do re

    %39
    mi re mi mi, la si do la
    mi'4 r la8[la16 la la8 la]
    fa8 dod re4 sol2

    %42
    fa\mbreak mi4 sold
    la do, re2
    mi4 la, mi' mi,

    %45
    la2 \clef tenor mi''8 [mi16 mi mi8 mi]
    do8 la do re mi re16 do si do re si\mbreak
    do4 r8 \clef bass la sold mi r mi

    %48
    la4 la, mi' sold
    la fa sol?2
    la4 re, la' la,

    %51
    re8[re16 re re8 re] dod4 r\mbreak
    re8[re16 re re8 re] si4 r
    mi8[mi16 mi mi8 mi] fa[fa16 fa fa8 fa]

    %54
    re[re16 re re8 re] do4 r
    fa r sol r
    do, r8 do\mbreak fa4 r8 fa,

    %57
    sol4 r8 do fa do sol' sol,
    do4 r do8[do16 do do8 do]
    sol4 r re'8[re16 re re8 re]

    %60
    la'4 r8 fa do'4 r8 la\mbreak
    sib4 r8 fa sol re la' la,
    re4 r re r8 re

    %63
    la'4 r8 la, re4 r
    la'8[la16 la la8 la] fad re fad sold
    la4 r8 dod,\mbreak re4 r8 re

    %66
    la4 r mi'8[mi16 mi mi8 mi]
    red si dod red mi4 r8 si
    la4 r re8 [re16 re re8 re]

    %69
    mi[re16 do si do re si] do8 la r do\mbreak
    fa4 r8 re mi4 r8 do
    re la mi' mi, la4 r8 do

    %72
    fa4 r8 re mi4 r8 do
    re la mi' mi, la4 r\fermata

    mi'2 si

    %75
    red mi
    si r\fermata
    si la

    %78
    re4 si la do
    re2 la
    dod re

    %81
    mi re4 do?
    si2\mbreak la4 re
    mi2 r4 la~

    %84
    la sold la mi
    fa2 mi4 do
    re2 mi4 la,

    %87
    mi'2 la,
    R2.*4
    la8 sol la si do la

    %93
    mi' re mi fa mi re
    do re do si la4\mbreak
    sold mi2

    %96
    la8 sold la si do la
    mi' fad mi red mi4
    red si do

    %99
    la si2
    mi8 re mi fad sold mi
    la4 sol fa re~

    %102
    re do fa4. la8
    mi2 re
    re4 la mi'2

    %105
    la,2.
    R2.*2\mbreak
    mi'8 re mi fad sold mi

    %109
    la sol? la si do la
    mi4. re8 si mi
    la sold la si la fa

    %112
    mi4 r r
    la,8 sold la  si do la
    mi' fa mi re do si

    %115
    do si la sold la re
    mi2 re
    la fad'4 sol

    %118
    do, fa? re mi
    la,2 mi'
    do4 re sol, do

    %121
    la si mi do
    fad?2 mi4 la,\mbreak
    mi'2 la,4 do

    %124
    re2 mi4 la,
    mi'2 la,

}

IbcIIn = \relative do {

    la2 r\fermata
    mi' r\fermata
    la,1

    %4
    la2 mi'
    r\fermata dod
    re\mbreak re4 la

    %7
    si4. la8 sol4. sol8
    la4 re la2
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

    %10
    la2 re
    re mi4 la,
    mi'2 sold,

    %13
    la la\mbreak
    mi'4 la, sold la
    mi2 la

    %16
    R1*3
    la'2 sold8  mi fad sold
    la sold?16 fad? mi fad sold mi fad2

    %21
    mi r
    mi8[mi16 mi mi8 mi] do la si do
    re mi fa?4\mbreak mi4. mi8

    %24
    fa re mi4 la la
    sol8 mi sol la si4. si,8
    mi2 si4. sold8

    %27
    dod4 sold8 la si2\mbreak
    mi4 r la,8 si do la
    re4. re8 si4 la

    %30
    mi'2 la,8 si do re
    mi2 la,8[do16 do do8 do]
    re4 r sol sol,\mbreak

    %33 fine p. 7
    do2 fa8 sol la fa
    sol fa sol sol, do re mi do
    fa sol la fa sol la si sol

    %36
    do si la sol fa sol la fa
    sol fa mi re do re mi do\mbreak
    re mi fa re  mi re do re

    %39
    mi re mi mi, la si do la
    mi'4 r la2
    fa8 dod re4 sol2

    %42
    fa\mbreak mi4 sold
    la do, re2
    mi4 la, mi' mi,

    %45
    la2 \clef tenor mi''8 [mi16 mi mi8 mi]
    do8 la do re mi re16 do si do re si\mbreak
    do4 r8 \clef bass la sold mi r mi

    %48
    la4 la, mi' sold
    la fa sol?2
    la4 re, la' la,

    %51
    re2 dod4 r\mbreak
    re2 si4 r
    mi2 fa

    %54
    re do4 r
    fa r sol r
    do, r8 do\mbreak fa4 r8 fa,

    %57
    sol4 r8 do fa do sol' sol,
    do4 r do8[do16 do do8 do]
    sol4 r re'8[re16 re re8 re]

    %60
    la'4 r8 fa do'4 r8 la\mbreak
    sib4 r8 fa sol re la' la,
    re4 r re r8 re

    %63
    la'4 r8 la, re4 r
    la'8[la16 la la8 la] fad re fad sold
    la4 r8 dod,\mbreak re4 r8 re

    %66
    la4 r mi'8[mi16 mi mi8 mi]
    red si dod red mi4 r8 si
    la4 r re8 [re16 re re8 re]

    %69
    mi[re16 do si do re si] do8 la r do\mbreak
    fa4 r8 re mi4 r8 do
    re la mi' mi, la4 r8 do

    %72
    fa4 r8 re mi4 r8 do
    re la mi' mi, la4 r\fermata
    mi'2 si

    %75
    red mi
    si r\fermata
    si la

    %78
    re4 si la do
    re2 la
    dod re

    %81
    mi re4 do?
    si2\mbreak la4 re
    mi2 re4 la~

    %84
    la sold la mi'
    fa2 mi4 do
    re2 mi4 la,

    %87
    mi'2 la,
    R2.*4
    la8 sol la si do la

    %93
    mi' re mi fa mi re
    do re do si la4\mbreak
    sold mi2

    %96
    la8 sold la si do la
    mi' fad mi red mi4
    red si do

    %99
    la si2
    mi8 re mi fad sold mi
    la4 sol fa re~

    %102
    re do fa4. la8
    mi2 re
    re4 la mi'2

    %105
    la,2.
    R2.*2\mbreak
    mi'8 re mi fad sold mi

    %109
    la sol? la si do la
    mi2.
    la2 fa4

    %112
    mi2.
    la,8 sold la  si do la
    mi' fa mi re do si

    %115
    do si la sold la re
    mi2 re
    la fad'4 sol

    %118
    do, fa? re mi
    la,2 mi'
    do4 re sol, do

    %121
    la si mi do
    fad?2 mi4 la,\mbreak
    mi'2 la,4 do

    %124
    re2 mi4 la,
    mi'2 la,

}

IbfIn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    <5>2 <6 4>
    <6 4>4 <3-> <5 4> <3>
    s1
    <9>4 <8> s <_+>
    <7> <6>8 <6+> s2
    <7 _+>4 s <4> <3>
    s1
    <_->2 <9>4 <8>
    <6> <5> <_+>2
    <_+> <6 5>
    <9>4 <8> <5> <4>
    <7 _+>2 <6>
    <4>4 <3> s2
    s1*4
    s2 <7>4 <6>
    s1*2
    s4 <5>8 <6> <_+>2
    s4 <4>8 <3> s2
    <6> s
    s <_+>
    s <4>4 <3>
    s1
    <_+>2 <6+>
    <4>4 <3> <_->2
    s1
    <_->
    s1*8
    s4 <_-> <7> <6>
    <7> <6> <_+>2
    s <9>4 <8>
    <7 _+>1
    s1*3
    s2 <_+>
    s4 <6> <9> <8>
    <7 _+>1
    s
    <_+>2 <6>
    <6>1
    <6>
    s
    s2 s4 s8 <6>
    s1*3
    s2 s4 s8 <_+>
    s2 <_->
    s1*3
    <_+>2 <_+>
    <_+>1
    s2 s4 s8 <6+>
    s1*2
    s2 <_+>
    s <_->
    s1*2
    <_->2 <_+>
    <6>2 <9+>4 <8>
    <4> <3> s2
    <6+>1
    <_->4 <6+> s2
    <4>4 <3-> <4> <3+>
    s2 <9>4 <8>
    <7> <6> s2
    <7>4 <6> s2
    <7>4 <6> s2
    s1
    <7>4 <6> s2
    <9>4 <8> <7 _+>2
    <4>4 <3> s2
    s2.*10
    s4 <_+> <_->4
    <7 5>4 <4> <3>
    s2.
    s4 <6> s2
    <4+ 2>4 <6> <7> <6>8 <6>
    <_+>2 <9 _+>4 <8 _+>
    <4+ 2>4 <5>8 <6> <4>4 <3>
    s2.*6
    s2 <6>4
    s2.*4
    <_+>2 <9>4 <8>
    <6 4> <5 3> s2
    <7> <6 5>4 <_+>
    s2 <6 4>4 <5 3>
    <6 5> <_+> <7+> s
    <6 5>1
    <9>4 <8> <7> s
    <4> <3> s s
    <9> <8> <7 _+> s
    <4> <3>

}

IbfIIn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    <5>2 <6 4>
    <6 4>4 <3-> <5 4> <3>
    s1
    <9>4 <8> s <_+>
    <7> <6>8 <6+> s2
    <7 _+>4 s <4> <3>
    s1
    <_->2 <9>4 <8>
    <6> <5> <_+>2
    <_+> <6 5>
    <9>4 <8> <5> <4>
    <7 _+>2 <6>
    <4>4 <3> s2
    s1*4
    s2 <7>4 <6>
    s1*2
    s4 <5>8 <6> <_+>2
    s4 <4>8 <3> s2
    <6> s
    s <_+>
    s <4>4 <3>
    s1
    <_+>2 <6+>
    <4>4 <3> <_->2
    s1
    <_->
    s1*8
    s4 <_-> <7> <6>
    <7> <6> <_+>2
    s <9>4 <8>
    <7 _+>1
    s1*3
    s2 <_+>
    s4 <6> <9> <8>
    <7 _+>1
    s
    <_+>2 <6>
    <6>1
    <6>
    s
    s2 s4 s8 <6>
    s1*3
    s2 s4 s8 <_+>
    s2 <_->
    s1*3
    <_+>2 <_+>
    <_+>1
    s2 s4 s8 <6+>
    s1*2
    s2 <_+>
    s <_->
    s1*2
    <_->2 <_+>
    <6>2 <9+>4 <8>
    <4> <3> s2
    <6+>1
    <_->4 <6+> s2
    <4>4 <3-> <4> <3+>
    s2 <9>4 <8>
    <7> <6> s2
    <7>4 <6> s2
    <7>4 <6> s2
    s1
    <7>4 <6> s2
    <9>4 <8> <7 _+>2
    <4>4 <3> s2
    s2.*10
    s4 <_+> <_->4
    <7 5>4 <4> <3>
    s2.
    s4 <6> s2
    <4+ 2>4 <6> <7> <6>8 <6>
    <_+>2 <9 _+>4 <8 _+>
    <4+ 2>4 <5>8 <6> <4>4 <3>
    s2.*6
    s2 <6>4
    s2.*4
    <_+>2 <9>4 <8>
    <6 4> <5 3> s2
    <7> <6 5>4 <_+>
    s2 <6 4>4 <5 3>
    <6 5> <_+> <7+> s
    <6 5>1
    <9>4 <8> <7> s
    <4> <3> s s
    <9> <8> <7 _+> s
    <4> <3>

}

forma = {

    \time 4/4
    \tempo 2 = 40
    s1*15
    \bar ":..:"\break
    \tempo 2 = 60
    s1*58
    \bar":..:"\break
    \tempo 2 = 40
    s1*14
    \bar ":..:"\break
    \time 3/4
    \tempo 2. = 65
    s2.*13
    \bar ":..:"\break
    \time 4/4
    \tempo 2 = 40
    s1*4
    \bar ":..:"
    \time 3/4
    \tempo 2. = 65
    s2.*11
    \bar ":..:"\break
    \time 4/4
    \tempo 2 = 40
    s1*10
    \bar ":|."

}


IvlI = {
    \Iglobal
    %\notypeset
    <<\IvlIn \forma>>

}


IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}


Ivla = {
    \Iglobal
    <<\Ivlan \forma>>

}

IbcI = {
    \Iglobal
    \clef bass
    <<\IbcIn \forma\IbfIn>>

}

IbcII = {
    \Iglobal
    \clef bass
    <<\IbcIIn \forma \IbfIIn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##f
    first-page-number = #2

}

\header {
    title = \markup \smaller "Sinfonia a 3"
    composer = \markup \center-column{"F. Gasparini (1661-1727"}
}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new PianoStaff
        <<
            \new Staff
            <<
            \set Staff.instrumentName = \markup \center-column\smaller{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>
            \new Staff
            <<
            \set Staff.instrumentName = \markup \center-column\smaller{"[Violino  II]"}
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>
        >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major\time 4/4  la'2^\markup\right-align"[Viola]"}
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column\smaller{"[Basso I]"}
            \set Staff.midiInstrument = #"cello"
            \IbcI
        >>

        \new Staff
        <<
            \set Staff.instrumentName = \markup \center-column\smaller{"[Basso II]"}
            \set Staff.midiInstrument = #"contrabass"
            \IbcII
        >>
    >>

    \layout {

            indent = 1.5\cm
            incipit-width = 1.5\cm


        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }

        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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


