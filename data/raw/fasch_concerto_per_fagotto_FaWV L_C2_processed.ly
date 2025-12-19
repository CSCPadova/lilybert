\language "italiano"
	%********************************** VARIABILI
\version "2.24.0"

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
      \musicglyph "scripts.prall"}}

mbreak = { }


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IvlIn =  \relative do'' {

    la'8
    mi16(re) do8 r sol
    do16(si) do8 r sol'
    re16(do) re8 re16(do) re8

    %4
    mi16(re) do8 r mi16 fad
    sol sol sol sol fad fad sol sol
    re re re re re re re re

    %7
    re re re re re re re re
    re si do re mi re mi fad
    sol8[la re, fad]

    %10
    si,16(do re4) mi8
    si16(do re4) sol8
    si,16(do re4) mi8

    %13
    si16(do re4) sol8\mbreak
    mi16 mi mi mi mi mi mi mi
    fa fa fa fa mi mi mi mi

    %16
    re re re re do do do do
    si8 sol fa'4~
    fa8 sol, fa'4~

    %19
    fa8 sol, fa'4~
    fa8[la sol fa]
    mi re16 do re8 do16 si

    %22
    do32(mi sol16) do,32[(mi sol16)] si,32(re sol16) si,32[(re sol16)]
    do,32[(mi sol16)] do,32[(mi sol16)] sol,32(si fa'16) sol,32[(si fa'16)]
    mi8 re16 do re8 do16 si

    %25
    do8 do, r4
    R2*21
    r4 r8 re'\parenthesize \f

    %48
    si16(la) sol8 r re
    sol16(fad) sol8 r re'
    la16(sol) la8 la16(sol) la8

    %51
    si16(la) sol8 r si16 do
    re re re re dod dod re re
    la la la la la la la la

    %54
    la la la la la la la la
    la fad sol la si la si dod
    re8[mi la, dod]

    %57
    re16(mi fad4) sol8
    fad16(mi re4) dod8
    re16(mi fad4) sol8

    %60
    fad16(mi re4) do!8
    si32(re sol16) si,32[(re sol16)] do,32(mi sol16) do,32[(mi sol16)]
    si,32(re sol16) si,32[(re sol16)] la,32(do fad16) la,32[(do fad16)]

    %63
    sol,8[la re, fad]
    sol sol, r4
    R2*16

    %81
    r4 r8 sol''\parenthesize \f
    mi16(re) do8 r sol
    do16(si) do8 r sol'

    %84
    re16(do) re8  re16(do) re8
    mi16(re) do8 r mi
    la16 la la la la la la la

    %87
    sold sold la la mi mi la la
    sold sold la la mi mi la la
    sold mi fad sold la sol fa? mi

    %90
    fa mi re mi do8 si16 la
    la8 la, r4
    la''8\p r sold r

    %93
    la r r4
    fa8 r fa r
    mi r r4

    %96
    do8 r do r
    mi r mi r
    fa r fa r
    fad r fad r

    %100
    mi r sold r
    la r sold r
    mi r sold r\mbreak

    %103
    la [do, si sold]
    la' [do, si sold]
    do la r4

    %106
    R2
    r4 r8 sol'\f
    mi16(re) do8 r sol

    %109
    do16(si) do8 r sol'
    re16(do) re8  re16(do) re8
    mi16(re) do8 r la'

    %112
    sol16 sol sol sol fad fad fad fad
    sol sol la la sol sol fad fad
    sol sol la la sol sol fad fad

    %115
    si,16(do re4) mi8
    si16(do re4) sol8
    si,16(do re4) mi8

    %118
    si16(do re4) sol8
    mi16 mi mi mi mi mi mi mi\mbreak
    fa fa fa fa mi mi mi mi

    %121
    la la sol sol fa fa mi mi
    re8 sol, r4
    R2*8

    %131
    si,16\p si do do re re si si
    do do re re mi mi do do
    re re mi mi fa fa re re

    %134
    mi mi fa fa sol sol mi mi\mbreak
    fa2~
    fa~

    %137
    fa4 r8 fa
    mi4 r
    R2*3

    %142
    r8 sol fa'4\f~
    fa8 sol, fa'4~
    fa8 sol, fa'4~

    %145
    fa8[la sol fa]
    mi re16 do re8 do16 si
    do8 do, r4

}

IvlIIn = \relative do'' {

    do8
    do r sol r
    la r do r
    do r si r

    %4
    do sol r do
    re16 re re re re re re re
    re re si si do do si si

    %7
    la la si si do do si si
    sol4 r8 re'
    re[mi la, la]

    %10
    sol16(la si4) do8
    sol16(la si4) si8
    sol16(la si4) do8

    %13
    sol16(la si4) si8\mbreak
    do16 do do do do do do do
    do do do do si si si si

    %16
    la la la la la la la la
    sol8 re r si'16 do
    re8 si r si16 do

    %19
    re8 si r si16 do
    re8 si r re
    do[do la sol]

    %22
    sol r sol r
    sol r sol re'
    do[do la sol]

    %25
    sol mi r4
    R2*21
    r4 r8 fad\parenthesize \f

    %48
    sol r re r
    mi r sol r
    sol r fad r

    %51
    sol re r sol
    la16 la la la sol sol la la
    la la fad fad sol sol fad fad

    %54
    mi mi fad fad sol sol fad fad
    re4 r8 sol
    la[si la la]

    %57
    fad16(sol la4) si8
    la16(sol fad4) mi8
    fad16(sol la4) si8

    %60
    la16(sol fad4) la8
    sol r sol r\mbreak
    sol r la r

    %63
    sol[mi re re]
    re si r4
    R2*16

    %81
    r4 r8 re'\parenthesize \f
    do r sol r
    la r do r

    %84
    do r si r
    do sol r do
    do16 do do do do do si si

    %87
    si si do do sold sold do do
    si si do do sold sold do do
    si8 r la r\mbreak

    %90
    la4 la8 sold
    mi do r4
    mi'8\p r mi r

    %93
    mi r r4
    re8 r re r
    si r r4

    %96
    la8 r la r
    dod r dod r
    re r re r

    %99
    red r red r
    si r si r
    mi  r mi r

    %102
    do r mi r\mbreak
    mi[la, sold mi]
    r la[sold mi]

    %105
    la do, r4
    R2
    r4 r8 re'\f

    %108
    do r sol r
    la r do r
    do r si r

    %111
    do sol r mi'
    re16 re re re re re re re
    re re mi mi re re do do

    %114
    re re mi mi re re do do
    sol16(la si4) do8
    sol16(la si4) si8

    %117
    sol16(la si4) do8
    sol16(la si4) si8
    do16 do do do do do do do\mbreak

    %120
    do do do do do do do do
    do do do do si si do do
    si8 sol r4

    %123
    R2*8
    sol,16\p sol la la si si sol sol
    la la si si do do la la

    %133
    si si do do re re si si
    do do re re mi mi do do\mbreak
    re2~

    %136
    re~
    re4 r8 re
    do4 r

    %139
    R2*3
    r4 r8 si'16\f do
    re8 si r si16 do

    %144
    re8 si r si16 do
    re8 si r si
    do[do la sol]

    %147
    sol mi r4

}

Ivlan =  \relative do' {

    mi8
    sol16(fa) mi8 r sol
    mi16(re) mi8 r sol
    la r sol sol

    %4
    sol16(fa) mi8 r sol
    sol16 sol sol sol do do si si
    la la sol sol fad fad sol sol

    %7
    re re sol sol\mbreak fad fad sol sol
    sol4 r8 la
    si[la fad re]

    %10
    re sol r sol
    re sol r sol
    re sol r sol

    %13
    re sol r sol
    sol16 sol sol sol sol sol sol sol
    fa fa fa fa sol sol sol sol\mbreak

    %16
    re re re re re re re re
    re8 si r sol'
    sol re r sol

    %19
    sol re r sol
    sol re r sol
    sol fa16 mi fa8 mi16 re

    %22
    mi8 r fa r
    mi r re sol
    sol fa16 mi fa8 mi16 re\mbreak

    %25
    mi8 do r4
    R2*21
    r4 r8 re\parenthesize \f

    %48
    re16(do) si8 r re
    si16(la) si8 r re
    mi r re re

    %51
    re16(do) si8 r re
    re16 re re re sol sol fad fad\mbreak
    mi mi re re dod dod re re

    %54
    la la re re dod dod re re
    re4 r8 re16 mi
    fad8[mi dod mi]

    %57
    re2~
    re~
    re~

    %60
    re4. re8
    re r mi r
    si r\mbreak do r

    %63
    re[mi fad, la]
    si sol r4
    R2*16

    %81
    r4 r8 si'\parenthesize \f
    sol16(fa) mi8 r sol
    mi16(re) mi8 r sol

    %84
    la r sol sol
    sol16(fa) mi8 r sold
    mi16 mi re re\mbreak mi mi fa fa

    %87
    mi mi mi mi mi mi  mi mi
    mi mi mi mi mi mi  mi mi
    mi8 r mi r

    %90
    re[fa mi mi]
    do la r4
    do'8 \p r re r

    %93
    do r r4
    si8 r si r\mbreak
    si sold r4

    %96
    mi8 r mi r
    la r la r
    la r la r

    %99
    si r si r
    mi, r mi r
    do' r si r

    %102
    la r si r
    la mi r4
    R2*3\mbreak

    %107
    r4 r8 sol\f
    sol16(fa) mi8 r sol
    mi16(re) mi8 r sol

    %110
    la r sol sol
    sol16(fa) mi8 r la
    si16 si si si do do do do

    %113
    si si do do sol sol la la
    si si do do\mbreak sol sol la la
    si8 sol r sol

    %116
    re sol r sol
    re sol r sol
    re sol r sol

    %119
    sol16 sol sol sol sol sol sol sol
    fa fa fa fa sol sol sol sol
    la la mi mi fa fa sol sol\mbreak

    %122
    sol8 re r4
    R2*19
    r4 r8 sol\parenthesize \f

    %143
    sol re r sol
    sol re r sol
    sol re r sol

    %146
    sol fa16 mi fa8 mi16 re
    mi8 do r4

}

Ifgn = \relative do {

    do8
    do' r si r
    la r mi r
    fa r sol r

    %4
    do,4 r8 do'
    si16 si si si la la sol sol
    fad fad sol sol re re sol sol

    %7
    fad fad sol sol re re sol sol
    mi4 r8 do
    si[do re re,]

    %10
    sol2~
    sol~
    sol~

    %13
    sol4. sol'8
    do16 do do do si si si si
    la la la la sol sol sol sol

    %16
    fa fa fa fa fad fad fad fad
    sol4 r8 re'16 do
    si8 sol r re'16 do

    %19
    si8 sol r re'16 do
    si8[sol la si]
    do[ la fa sol]

    %22
    mi r re r
    mi r si r
    do[la' fa sol]

    %25
    do,4 r8 sol'\solo
    do16 (si) do8 r re
    mi16 (re) mi8 r fa

    %28
    sol16 fa mi8 re do
    si sol r do\mbreak
    la[do, fa, la']

    %31
    si16(la sol la) si8 re
    do[mi, la, do']
    re16(do si do) re8 fa

    %34
    mi16 do mi do la do la do
    re si re si sol si sol si
    do la do la fad la fad la

    %37
    si8 sol r la
    si re, \once\stemUp sol,16 si' la si
    do do, re mi \once\stemUp la,8 do'

    %40
    re sol, \once\stemUp si,16 re' do re
    mi mi, fa sol \once\stemUp do,8 mi'16 re
    do re do si la si la sol

    %43
    fad sol fad mi re mi re do
    si8[re' la, do']
    sol, [si' la, do']

    %46
    \once\stemUp si,16 re' mi re do si la sol\mbreak
    fad8 re r re\tu
    sol, r fad' r

    %49
    mi r si r
    do r re r
    sol, r sol' r

    %52
    fad16 fad fad fad mi mi re re
    dod dod re re la la re re
    dod dod re re la la re re

    %55
    si4 r8 sol'
    fad[sol la la,]
    re2~

    %58
    re~
    re~
    re4. fad8

    %61
    sol r mi r\mbreak
    re r do r
    si[do re re,]

    %64
    sol4 r8 re''\solo
    mi8. re16 do(si) la(sol)
    fad(la) re8 r do

    %67
    si mi16(re) do(si) la(sol)
    fad8 re r la'
    si[sol, la dod']

    %70
    re16(dod) re8~re16 la re dod
    re \parenthesize (dod) re8~re16 la re dod
    re fad re la fad la re la

    %73
    si re si sol si, sol' si re
    mi, re' do si do fad, la do
    re, do' si la si sol la si

    %76
    do, si' la sol\mbreak la fad sol la  %% inizio p 2
    si,16(do32 re) do16[(re32 mi)] re16(mi 32 fad) mi16[(fad32 sol)]
    fad16(sol32 la) sol16[(la32 si)] la16(si32 do) si16[(do32 re)]

    %79
    do16 (si) do8~do16 re, fad do'
    si la sol la re,8 fad
    sol sol, r sol'\tu

    %82
    do r si r
    la r mi r

    %84
    fa r sol r
    do, mi16 re do8 si
    la[si do re]

    %87
    mi16 mi mi mi mi mi  mi mi
    mi mi mi mi mi mi mi mi
    mi8 r do r\mbreak

    %90
    re4 mi8 mi,
    la4 r8 mi''\solo
    do16 mi mi mi si mi mi mi

    %93
    do mi mi mi la, do do do
    si re re re re, si' si si
    sold8 mi r si'

    %96
    do16 la la la mi la la la
    dod la la la mi la la la
    re la la la fad la la la

    %99
    red la la la fad la la la
    mi'8 \tuplet 6/4 { mi,32(fad sold la si do) } re8 \tuplet 5/4 { mi,32(fad sold la si) }
    do8 mi,32(fad sold la) si8 \tuplet 5/4 { mi,32 (fad sold la si) }

    %102
    do8 \tuplet 6/4 { mi,32(fad sold la si do) } re8 \tuplet 7/4 { mi,32(fad sold la si do re) }
    mi8.[fa16 mi8. fa16]
    mi8.[fa16 mi8. fa16]

    %105
    mi8.[re16 do(si) la(sold)]
    la8[si mi, sold]
    la la, r si'\parenthesize \tu

    %108
    do r si r
    la r mi r
    fa r sol r

    %111
    do, r do' r
    si16 si si si la la la la
    sol sol do do si si la la

    %114
    sol sol do, do si si la la
    sol2~
    sol~

    %117
    sol~
    sol4. sol'8
    do16 do do do si si si si\mbreak

    %120
    la la la la sol sol sol sol
    fa fa mi mi re re do do
    sol'8 sol, r8 re''\parenthesize \solo

    %123
    mib16 do si do sol do si do
    mib do si do sol do si do
    mib do si do la do si do

    %126
    mib do si do la do si do
    re si la si sol si la si
    re si la si sol si la si

    %129
    do sol fa sol mi sol fa sol
    do sol fa sol mi sol fa sol
    sol,2~

    %132
    sol~
    sol~
    sol~\mbreak

    %135
    sol16 sol' fa mi re do si la
    sol sol' fa mi re do si la
    \once\stemUp sol8 re'' si la16 sol

    %138
    do sol mi sol do, mi' re do
    si sol si re si re si sol
    mi do mi sol do4~

    %141
    do8[re sol, si]
    do do, r8 re16\parenthesize \tu do
    si8 sol r re'16 do

    %144
    si8 sol r re'16 do
    si8 sol r sol'
    do,[la' fa sol]

    %147
    do,4 r

}

Ibcn = \relative do {

    do8
    do' r si r
    la r mi r
    fa r sol r

    %4
    do,4 r8 do'
    si16 si si si la la sol sol
    fad fad sol sol re re sol sol

    %7
    fad fad sol sol re re sol sol
    mi4 r8 do
    si[do re re,]

    %10
    sol2~
    sol~
    sol~

    %13
    sol4. sol'8
    do16 do do do si si si si
    la la la la sol sol sol sol

    %16
    fa fa fa fa fad fad fad fad
    sol4 r8 re'16 do
    si8 sol r re'16 do

    %19
    si8 sol r re'16 do
    si8[sol la si]
    do[ la fa sol]

    %22
    mi r re r
    mi r si r
    do[la' fa sol]

    %25
    do, do, r sol''\p
    mi r si r
    do r re r

    %28
    mi r fa r
    sol sol16 fa mi8 do\mbreak
    fa r fa, r

    %31
    sol r sol r
    la r la r
    si r sol r

    %34
    do4 r8 la
    si r mi r
    la,4 r8 re

    %37
    sol,[sol' fad re]
    sol,4 r8 sol
    la4 r8 la

    %40
    si4 r8 si
    do4 r8 do16 re
    mi8[re do la]

    %43
    re,[mi fad re]
    sol4 la8 re
    sol, r la r

    %46
    si r do r\mbreak
    re re16\f mi re do si la
    sol8 r fad' r

    %49
    mi r si r
    do r re r
    sol, r r sol'

    %52
    fad16 fad fad fad mi mi re re
    dod dod re re la la re re
    dod dod re re la la re re

    %55
    si4 r8 sol'
    fad[sol la la,]
    re2~

    %58
    re~
    re~
    re4. fad8

    %61
    sol r mi r\mbreak
    re r do r
    si[do re re,]

    %64
    sol sol16 la si8\p sol
    do[re mi do]
    re[mi fad re]

    %67
    sol[do, la do]
    re [mi fad re]

    %69
    sol, r la r
    fad fad'16 sol la8 mi
    fad, fad'16 sol la8 mi

    %72
    fad r re r
    sol r sol, r
    do r la r

    %75
    si r sol r
    la r\mbreak fad r
    sol[la si do]

    %78
    re[mi fad sol]
    la,[la' fad re]
    sol si,16 do re8 re,

    %81
    sol sol'16 la si8 sol
    do\f r si r
    la r mi r

    %84
    fa r sol r
    do, mi16 re do8 si
    la[si do re]

    %87
    mi16 mi mi mi mi mi  mi mi
    mi mi mi mi mi mi mi mi
    mi8 r do r\mbreak

    %90
    re4 mi8 mi,
    la4 r
    la'8\p r mi r

    %93
    la, r r4
    re8 r re r
    mi r mi, r

    %96
    la r la' r
    sol r sol r
    fad r re r

    %99
    si' r la r
    sold r mi r
    mi r mi r

    %102
    mi r mi r\mbreak
    do la r4
    R2

    %105
    do4 r8 mi
    fa[re mi mi,]
    la la16 sol la8\f si

    %108
    do r si' r
    la r mi r
    fa r sol r

    %111
    do, r do' r
    si16 si si si la la la la
    sol sol do do si si la la

    %114
    sol sol do, do si si la la
    sol2~
    sol~

    %117
    sol~
    sol4. sol'8
    do16 do do do si si si si\mbreak

    %120
    la la la la sol sol sol sol
    fa fa mi mi re re do do
    sol'8 sol, r4

    %123
    sol'8\p r sol r
    sol r sol r
    fad r fad r

    %126
    fad r fad r
    fa! r fa r
    fa r fa r

    %129
    mi r mi r
    mi r do r
    sol2~

    %132
    sol~
    sol~
    sol~\mbreak

    %135
    sol4 r
    sol r
    sol sol'8 sol,

    %138
    do4 r8 fa
    sol4 r8 sol,
    do4 r8 la'

    %141
    fa[re sol sol,]
    do4 r8 re16 do
    si8 sol r re'16 do

    %144
    si8 sol r re'16 do
    si8 sol r sol'
    do,[la' fa sol]

    %147
    do,4_\fermata r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 2/4
    \tempo 2 = 50
    \partial 8 s8
    s2*147
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

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}



IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn =  \relative do'' {

    mi8 mi mi mi fa fa fa fa
    red red red red mi mi dod dod
    re re re re re2\fermata

    %4
    r8 do\p do do do si r4
    r8 si si si r do do do
    la4 r8 re, mi4 r

    %7
    R1
    la4\p r8 la la8 sold r4\mbreak
    la'8 la la la fa\f fa fa fa

    %10
    fa fa fa fa mi4 r8 mi\p
    fa4 r fad r8 fad
    sol4 r fad,8 fad fad fad

    %13
    sol sol sol sol do do do do
    si si si si re4\fermata r
    R1

    %16
    fad4\fermata r8 fad sol sol, r4
    R1\mbreak
    r8 sib sib sib r sib sib sib

    %19
    r sib sib sib r la la la
    sol2 r

}

IIvlIIn = \relative do'' {

    do8 do do do do do do do
    si si si si si si la la
    la la la la sold2\fermata

    %4
    r8 la\parenthesize \p la la\mbreak la sold r4
    r8 si si si r la la la
    la4 r8 re, si4 r

    %7
    R1
    fad'4\parenthesize \p r8 fad mi4 r
    mi'8 mi mi mi re\f re re re

    %10
    re re re re do4 r8 do\p \mbreak
    do4 r re r8 re
    re4 r do,8 do do do

    %13
    re re re re la' la la la
    sol sol sol sol sol4\fermata r
    R1

    %16
    la4 \fermata r8 la sol4 r
    R1
    r8 sol sol sol r sol sol sol

    %19
    r sol sol sol r fad fad fad
    re2 r

}

IIvlan =  \relative do' {

    la'8 la la la la la la la
    fad fad fad fad mi mi mi mi
    re re re re si2\fermata

    %4
    r8 fad'\parenthesize \p fad fad mi mi r4
    r8 mi mi mi r mi mi mi
    mi re r la\mbreak sold4 r

    %7
    R1
    do4\parenthesize \p r8 do do si r4
    la'8 la la la la\parenthesize \f la la la

    %10
    si si si si sol4 r8 sol\p
    la4 r la r8 la
    si 4 r la,8 la la la

    %13
    si si si si\mbreak fad' fad fad fad
    re re re re re4\fermata r
    R1

    %16
    re4\fermata r8 re re4 r
    R1
    r8 re re re r mi mi mi

    %19
    r re re re r re re re
    si2 r

}

IIfgn = \relative do {

    R1*3
    r2 r4 mi'~
    mi1~

    %6
    mi8 fa16 mi re(do) si(la) sold(mi) sold(si) re(si) sold(mi)
    do'(mi,) la(do) mi(do) la(mi) re'(mi,) si'(re) fa(re) si(sold)\mbreak
    do8. do16 do8 do do si r4

    %9
    R1
    r2 r8 sib sib16(la) sib8
    la16(fa) mi(fa) la(do) mi(fa) r8 do do16(si!) do8

    %12
    si16(sol) fad(sol) si(re) fad(sol) r16 mib mib(do) si(do) la(do)
    r re re si si(sol) sol(sol,)  r do' do(la) la(fad) fad(re)
    r sol sol(re) re(si) si(sol) fa'4\fermata r8 sol16 re

    %15
    mi8. fa16 re8. do16\mbreak do(mi) sol(do) mi(do) la(mi)
    re'4\fermata r r16 re si(sol) fad(sol) si,(sol')
    la,(do') la(fad) do(fad) la,(do') si8. la16 la8. sol16

    %18
    sol1~
    sol4. mi8\mbreak fad4. sol8
    sol2 r

}

IIbcn = \relative do {

    la'8 la la la la la la la
    la la la la sold sold sol sol
    fad fad fa fa mi2\fermata

    %4
    r8 red red red mi mi, r4
    sold r la r
    fa r8 fa mi4 r

    %7
    mi r mi r
    red' r8 red mi4 r\mbreak
    do8 do do do re? re re re

    %10
    sol, sol sol sol do4 r8 do
    fa,4 r re' r8 re
    sol,4 r sol r

    %13
    sol r sol r
    sol r si\fermata r8 si
    do fa sol sol, do4 r

    %16
    do\fermata r8 do si4 r8 si
    la4 r8 la sol do re re,\mbreak
    r8 sol' sol sol  r dod, dod dod

    %19
    r re re re r re, re re
    sol2 r

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 4/4
    \tempo 4 = 50
    s1*20
    \bar"|."


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

IIfg = {
    \IIglobal
    \clef bass
    <<\IIfgn \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}



IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn =  \relative do'' {

    do8.-+ si32(do) do8.-+ si32(do) do8.-+ si32(do)
    re8 sol, la si do do,
    do' [do, do' do, do' si16 la]

    %4
    sol8 fa mi re do4
    mi'8 sol, mi' sol, mi' sol,
    re' sol, re' sol, re' sol,

    %7
    do16 re mi re do re do si la si la sol\mbreak
    fad sol la sol fad sol fad mi re mi re do
    si8 \once\stemDown sol'' sol8.-+ fad32(sol) sol8.-+ fad32(sol)

    %10
    la8 re, mi re mi fad
    sol sol, sol'8.-+ fad32(sol) sol8.-+ fad32(sol)
    la8 re, mi re mi fad

    %13
    sol4 sol, r
    R2.*4\mbreak  %%% fine seconda riga
    sol4\p la la

    %19
    la sol sol
    mi mi mi
    fad sol sol

    %22
    la fad fad
    sol re re
    dod re re

    %25
    sol r la
    sol r sol
    sol sol fad

    %28
    sol'8.\f-+ fad32(sol) sol8.-+ fad32(sol) sol8.-+ fad32(sol) \mbreak
    la8 re, mi fad sol sol,
    sol'[sol, sol' sol, sol' fad16 mi]

    %31
    re8 do si la sol4
    si'8 re, si' re, si' re,
    la' re, la' re, la' re,

    %34
    sol16 la si la sol la sol fad mi fad mi re
    dod re mi re dod re dod si la si la sol\mbreak
    fad8 re' re8.-+ dod32 (re) re8.-+ dod32 (re)

    %37
    mi8 la, si la si dod
    re re, re'8.-+ dod32 (re) re8.-+ dod32 (re)
    mi8 la, si la si dod

    %40
    re4 re, r
    R2.*22
    do'8.-+ si32(do) do8.-+ si32(do)\mbreak do8.-+ si32(do)

    %64
    re8 sol, la si do do,
    do' [do, do' do, do' si16 la]
    sol8 fa mi re do4

    %67
    mi'8.-+ red32(mi) mi8.-+ red32(mi) mi8.-+ red32(mi)
    red8 si lad si si, si'
    sol16(si dod red) mi8 sol, fad[mi]\mbreak

    %70
    red si' fad'2
    sold8.-+ fad32(sold) sold8.-+ fad32(sold) sold8.-+ fad32(sold)
    si8 mi, red mi sold, mi'

    %73
    sold8.-+ fad32(sold) sold8.-+ fad32(sold) sold8.-+ fad32(sold)
    si8 mi, red mi sold, mi'
    sol8(red) mi2\mbreak

    %76
    red8(fad) la,2
    sol8 si mi[sol,] fad red'
    mi4 mi, r

    %79
    R2.*8
    do4\p do do
    re re re

    %89
    mi mi mi
    fa fa fa
    mi mi mi

    %92
    re re re
    mi8(sol) sol(fa) fa(mi)\mbreak
    mi(fa) fa(mi) mi(re)

    %95
    re(mi) mi(re) re(do)
    do(re) re(do) do(si)
    si4 sol r

    %98
    do'8.-+\f si32(do) do8.-+ si32(do) do8.-+ si32(do)
    re8 sol, la si do do,
    do' [do, do' do, do' si16 la]\mbreak

    %101
    sol8 fa mi re do4
    sib'8._+ la32(sib) sib8._+ la32(sib) sib8._+ la32(sib)
    la8 fa mi fa la fa

    %104
    do'8.-+ si!32(do) do8.-+ si32(do) do8.-+ si32(do)
    si8 sol fad sol si sol
    fa'4 r8 sol, si fa'

    %107
    mi4 r8 \mbreak sol, do mi
    re4 r8 sol, si re
    do4 r8 fad, la do

    %110
    si16 do re do si do si la sol la sol fa
    mi fa sol fa mi fa mi re do8 r
    r re' sol,4 si\mbreak

    %113
    do8 mi, mi8._+ re32(mi) mi8._+ re32(mi)
    sol8 mi mi8._+ re32(mi) mi8._+ re32(mi)
    do'8 mi, mi8._+ re32(mi) mi8._+ re32(mi)

    %116
    sol8 mi mi8._+ re32(mi) mi8._+ re32(mi)
    do'8 sol'16 fa mi fa mi re do re do si
    la do fa mi re mi re do si do si la\mbreak

    %119
    sol si mi re do re do si la si la sol
    fa la re do si do si la sol la sol fa
    mi do re mi fa re mi fa sol mi fa sol

    %122
    la fa sol la si sol la si do8 r\mbreak
    r8 re sol,4 si
    do do,\fermata r

}

IIIvlIIn = \relative do'' {

    sol4 r la
    la8 sol sol sol sol mi16 fa
    sol8 mi16 fa sol8 mi16 fa sol8 la

    %4
    re, do do si sol4
    do'8 mi, do' mi, do' mi,
    sol re sol re sol re

    %7
    la' la la sold mi mi
    re re re dod la la\mbreak
    \once\stemUp sol8 si' si8._+ la32(si) si8._+ la32(si)

    %10
    do8 fad, sol fad sol la
    si sol si8._+ la32(si) si8._+ la32(si)
    do8 fad, sol fad sol la

    %13
    si4 sol r
    R2.*4
    mi4\p mi mi

    %19
    re re re\mbreak
    do do la
    la re re

    %22
    re re re
    re si si
    la la la

    %25
    mi' r re
    re r re
    mi re re

    %28
    si'8.\f_+ la32(si) si8._+ la32(si) si8._+ la32(si)
    do8 [fad, sol la] si8 si16 do\mbreak
    re8 si16 do re8 si16 do re8 do

    %31
    sol sol sol fad sol4
    sol'8 si, sol' si, sol' si,
    re la re la re la

    %34
    si si si la si sold
    la la la sol mi mi
    re fad fad8._+mi32 (fad) fad8._+mi32 (fad)\mbreak

    %37
    sol8 dod, re dod re mi
    fad8 la fad8._+mi32 (fad) fad8._+mi32 (fad)
    sol8 dod, re dod re mi

    %40
    fad4 re r
    R2.*22
    sol4 r la

    %64
    la8[sol sol sol] sol [mi16 fa]
    sol8 mi16 fa\mbreak sol8 mi16 fa sol8 la
    re, do do si sol4

    %67
    la' la la
    fad r r
    mi r r

    %70
    si si'2
    si4 si si
    sold sold sold

    %73
    si4 si si
    sold sold sold
    dod dod dod\mbreak

    %76
    si fad2
    mi4 mi fad
    sol mi r

    %79
    R2.*8
    sol,4\p sol sol
    la la la

    %89
    si si si
    do do do
    do do do

    %92
    la la la
    do8(sol') sol(fa) fa(mi)\mbreak
    mi(fa) fa(mi) mi(re)

    %95
    re(mi) mi(re) re(do)
    do(re) re(do) do(si)
    si4 sol r

    %98
    sol'4\f r la
    la8[sol sol sol] sol mi16 fa
    sol8 mi16 fa sol8 mi16 fa sol8 la\mbreak

    %101
    re, do do si sol4
    sol' sol sol
    fa r r

    %104
    la la la
    sol r r
    re' r8 re sol, re'

    %107
    do4 r8 mi, sol mi
    sol4 r8 si sol si
    fad4 r8 la fad la\mbreak

    %110
    sol4 r re
    do4. si8 sol\noBeam r
    r fa' si,4 re

    %113
    mi8 do do8._+ si32(do)  do8._+ si32(do)
    mi8 do do8._+ si32(do)  do8._+ si32(do)
    mi8 do do8._+ si32(do)  do8._+ si32(do)

    %116
    mi8 do do8._+ si32(do)  do8._+ si32(do)
    mi8 do' do do sol sol
    fa fa fa fa fa fa

    %119
    sol mi mi mi mi mi
    re re re re re re
    do8.[do16 si8. re16 do8. do16]

    %122
    do8.[do16 fa8. fa16] mi8 r
    r fa si,4 re\mbreak
    mi do\fermata r

}

IIIvlan =  \relative do' {

    mi8.-+ re32(mi) mi8.-+ re32(mi) mi8.-+ re32(mi)
    fa8 si, do re mi mi,
    mi' [mi, mi' mi, mi' re16 do]

    %4
    si8 do sol fa mi4
    sol'8 do, sol' do, sol' do,
    sol' si, sol' si, sol' si,

    %7
    mi mi mi re do dod\mbreak
    la fad sol sol fad fad
    re4 r mi'

    %10
    mi r re
    re re mi
    mi r re

    %13
    re si r
    R2.*4
    do4\p do do

    %19
    si si si
    la la do,
    re re re\mbreak

    %22
    re re re
    re re re
    re re re

    %25
    mi r fad
    sol r si
    do re re,

    %28
    re'\f r mi
    mi8 la, re re re re
    re re re re re mi

    %31
    sol mi re do si4
    re'8 sol, re' sol, re' sol,\mbreak
    re' fad, re' fad, re' fad,

    %34
    si mi, mi red mi mi
    mi dod16 re mi8 re dod dod
    la4 r si

    %37
    si8 mi re mi re la
    la4 r si
    si8 mi re mi re la

    %40
    la4 fad r\mbreak
    R2.*22
    mi'8.-+ re32(mi) mi8.-+ re32(mi) mi8.-+ re32(mi)

    %64
    fa8 si, do re mi mi,
    mi'[mi, mi' mi, mi' re16 do]
    si8 do sol fa mi4

    %67
    mi' mi do
    si r r
    si r r

    %70
    fad red'2\mbreak
    mi8.-+ red32(mi) mi8.-+ red32(mi) mi8.-+ red32(mi)
    mi4 si si

    %73
    mi8.-+ red32(mi) mi8.-+ red32(mi) mi8.-+ red32(mi)
    si4 si si
    mi fad fad

    %76
    fad? red2
    si4 si si
    si sol r

    %79
    R2.*8\mbreak
    mi4\p mi mi
    fa fa fa

    %89
    sol sol sol
    la la la
    sol sol sol

    %92
    fa fa fa
    sol8(sol') sol(fa) fa(mi)
    mi(fa) fa(mi) mi(re)

    %95
    re(mi) mi(re) re(do)
    do(re) re(do) do(si)
    si4 sol r

    %98
    mi'8.-+\f re32(mi) mi8.-+ re32(mi) mi8.-+ re32(mi)
    fa8 si, do re mi mi,
    mi'[mi, mi' mi, mi' re16 do]

    %101
    si8 do sol fa mi4
    do'4 do do
    do r r

    %104
    re re re\mbreak
    re r r
    si8._+ la32(si) si8._+ la32(si) si8._+ la32(si)

    %107
    do8 do do8._+ si32(do) do8._+ si32(do)
    si8 si si8._+ la32(si) si8._+ la32(si)
    la8 la la la re re

    %110
    re4 r sol,\mbreak
    sol4. fa8 mi\noBeam r
    r la sol4 sol

    %113
    sol r r
    do r r
    sol r r

    %116
    do r r
    sol8 sol' sol sol do, do
    si si si si si si\mbreak

    %119
    do do do do do do
    la sol sol sol sol sol
    sol8.[sol16 fa8. si16 sol8. do16]

    %122
    do8. [la16 sol8. re'16 ]do8 r
    r la sol4 sol
    sol mi \fermopz r

}

IIIfgn = \relative do {

    do4 r la'
    fa sol8 fa mi do16 re
    mi8 do16 re mi8 do16 re mi8 fa

    %4
    sol la sol[sol,] do do,
    do'8._+ si32(do) do8._+ si32(do) do8._+ si32(do)
    si8._+ la32(si) si8._+ la32(si) si8._+ la32(si)

    %7
    la8 do la si do la
    re re, re'[mi fad re]
    sol4 r mi

    %10
    do r re
    si sol mi'
    do r re

    %13
    sol, r r
    do'8.-+ si32(do) do8.-+ si32(do) do8.-+ si32(do)\mbreak
    re8 sol, la si do do,

    %16
    do' [do, do' do, do' si16 la]
    sol8 fa mi re do4
    mi'16 fa mi re do re do si la si do la

    %19
    re mi re do si do si la sol la si sol
    do re mi re do re do si la si la sol\mbreak
    fad8 re' si8.-+ la32(si) si8.-+ la32(si)

    %22
    re,8 do' la8.-+(sol32 la) la8.-+(sol32 la)
    re,8 si' sol8.-+ fad32(sol) sol8.-+ fad32(sol)
    dod,8 la' fad8.-+ mi32(fad)  fad8.-+ mi32(fad)

    %25
    do'!16(si la si) do(si la si) do(mi) re(do)\mbreak
    si re, mi fad sol la si do re8 r
    r mi si4 la8(sol)

    %28
    sol4 r mi
    do re8 do si sol16 la
    si8 sol16 la si8 sol16 la si8 do

    %31
    si do re re, sol4\mbreak
    sol'8.-+ fad32(sol) sol8.-+ fad32(sol) sol8.-+ fad32(sol)
    fad8.-+ mi32(fad)  fad8.-+ mi32(fad) fad8.-+ mi32(fad)

    %34
    mi8 sol mi fad sol mi
    la la, la' si dod la
    re4 r si

    %37
    sol r la
    fad re si'\mbreak
    sol r la

    %40
    re, r r
    re'16(do! si la) sol8 fa' si,, fa''
    mi sol, mi do mi'4

    %43
    re16(do si do) re8 sol, fad sol
    la, do' fad, do do'4
    si16(la sol la) si8 re, \once\stemUp sol,[si']\mbreak

    %46
    do16(si la si) do8 fad, \once\stemUp la,[do']
    re16(do si do) re8 sol, \once\stemUp si,[re']
    mi16(re do re) mi8 sol, \once\stemUp do,[mi']

    %49
    sib8.-+ la32(sib) sib8.-+ la32(sib) sib8.-+ la32(sib)
    la8 fa mi fa fa, fa'\mbreak
    do'8.-+ si!32(do) do8.-+ si32(do) do8.-+ si32(do)

    %52
    si8 sol fad sol sol, sol'
    re'16(do si la) sol8 re' fa, re'
    mi,16(sol la si) do8 mi, re si'

    %55
    do,16(mi fad sol) la8 do, si sol'
    la,16(do re mi) \mbreak fa!8 la, sol mi'
    la fa' sol, mi' fa, re'

    %58
    mi, do' re, si' do, la'
    si, re fa4. mi16(re)
    mi8 sol do4. si16 la

    %61
    si8 re fa4. mi16 re
    mi8 do sol4 si
    do, r la'\mbreak

    %64
    fa sol8 fa mi do16 re
    mi8 do16 re mi8 do16 re mi8 fa
    sol fa sol sol, do4

    %67
    do do' la
    si r r
    si, r r

    %70
    si2.~
    si~
    si~

    %73
    si~
    si\mbreak
    lad4 lad lad

    %76
    si si si
    mi sol, si
    mi, r r

    %79
    si''8.-+ la32(si) si8.-+ la32(si) si8.-+ la32(si)
    do8 mi, la, do' si la
    si8.-+ la32(si) si8.-+ la32(si) si8.-+ la32(si)

    %82
    do8 mi, \once\stemUp la,16 do' si do\mbreak re do si la
    si la sol la si sol la si do si la sol
    la sol fa sol la fa sol la si la sol fa

    %85
    sol fa mi fa sol mi fa sol la sol fa mi
    fa mi re mi fa re mi fa sol fa mi re\mbreak
    mi8 do' do8.-+ si32(do) do8.-+ si32(do)

    %88
    fa,8 do' do8.-+ si32(do) do8.-+ si32(do)
    sol8 do do8.-+ si32(do) do8.-+ si32(do)
    la8 do do8.-+ si32(do) do8.-+ si32(do)

    %91
    sol8 do do8.-+ si32(do) do8.-+ si32(do)
    fa,8 do' do8.-+ si32(do) do8.-+ si32(do)\mbreak
    mi,8(mi') mi(re) re(do)

    %94
    do(re) re (do) do(si)
    si(do) do(si) si(la)
    la(si) si(la) la(sol)

    %97
    sol4 sol, r
    do r la'
    fa sol8 fa mi do16 re\mbreak

    %100
    mi8 do16 re mi8 do16 re mi8 fa
    sol fa sol sol, do re
    mi4 mi mi

    %103
    fa r r
    fad fad fad
    sol r r

    %106
    sol8.-+ fad32(sol) sol8.-+ fad32(sol) sol8.-+ fad32(sol)\mbreak
    sol,8 sol' sol8.-+ fad32(sol) sol8.-+ fad32(sol)
    sol,8 sol' sol8.-+ fad32(sol) sol8.-+ fad32(sol)

    %109
    sol,8 sol' sol8.-+ fad?32(sol) sol8.-+ fad32(sol)
    sol,4 r si
    do4. re8 mi\noBeam r

    %112
    r fa sol4 sol,\mbreak
    do r r
    do r r

    %115
    do r r
    do r r
    do8 mi mi mi mi mi

    %118
    fa re re re re re
    mi do do do do do
    re si si si si si

    %121
    do8.[do16 re8. re16\mbreak mi8. mi16]
    fa8. [fa16 sol8. sol16] mi8 r
    r fa sol4 sol,

    %124
    do2_\fermata r4

}

IIIbcn = \relative do {

    do4 r la'
    fa sol8 fa mi do16 re
    mi8 do16 re mi8 do16 re mi8 fa

    %4
    sol la sol[sol,] do do,
    do'8._+ si32(do) do8._+ si32(do) do8._+ si32(do)
    si8._+ la32(si) si8._+ la32(si) si8._+ la32(si)

    %7
    la8 do la si do la
    re re, re'[mi fad re]
    sol4 r mi

    %10
    do r re
    si sol mi'
    do r re

    %13
    sol,8 la' sol fa mi re
    do4 \p r la'
    fa sol8 fa mi do16 re

    %16
    mi8 do16 re mi8 do16 re mi8 fa
    mi fa sol sol, do4
    R2.*10

    %28
    sol4\f r mi'
    do re8 do si sol16 la
    si8 sol16 la si8 sol16 la si8 do

    %31
    si do re re, sol4\mbreak
    sol'8.-+ fad32(sol) sol8.-+ fad32(sol) sol8.-+ fad32(sol)
    fad8.-+ mi32(fad)  fad8.-+ mi32(fad) fad8.-+ mi32(fad)

    %34
    mi8 sol mi fad sol mi
    la la, la' si dod la
    re4 r si

    %37
    sol r la
    fad re si'\mbreak
    sol r la

    %40
    re, r do
    si r sol
    do r la

    %43
    si r mi
    la, r re
    sol, r sol

    %46
    la r la
    si r si
    do r do

    %49
    mi mi mi
    fa r r
    fad fad fad

    %52
    sol r r
    sol,2.~
    sol~

    %55
    sol~
    sol~\mbreak
    sol~

    %58
    sol~
    sol2 si4
    do2 mi4

    %61
    sol2 si4
    do8 mi, sol4 sol,
    do r la'

    %64
    fa sol8 fa mi do16 re
    mi8 do16 re mi8 do16 re mi8 fa
    sol fa sol sol, do4

    %67
    do do' la
    si r r
    si, r r

    %70
    si2.~
    si~
    si~

    %73
    si~
    si\mbreak
    lad4 lad lad

    %76
    si si si
    mi sol, si
    mi, mi'\p fad

    %79
    sol sold mi
    la, r la'
    sold sold mi

    %82
    la, r8 la' fa re
    sol4 r8 sol mi do
    fa4 r8 fa re si

    %85
    mi4 r8 mi do la
    re4 r8 re si sol
    do4 r r

    %88
    R2.*5
    sol2.~
    sol~\mbreak

    %95
    sol~
    sol
    sol'8 la sol fa mi re

    %98
    do4\f r la'
    fa sol8 fa mi do16 re\mbreak

    %100
    mi8 do16 re mi8 do16 re mi8 fa
    sol fa sol sol, do re
    mi4 mi mi

    %103
    fa r r
    fad fad fad
    sol r r

    %106
    sol8.-+ fad32(sol) sol8.-+ fad32(sol) sol8.-+ fad32(sol)\mbreak
    sol,8 sol' sol8.-+ fad32(sol) sol8.-+ fad32(sol)
    sol,8 sol' sol8.-+ fad32(sol) sol8.-+ fad32(sol)

    %109
    sol,8 sol' sol8.-+ fad?32(sol) sol8.-+ fad32(sol)
    sol,4 r si
    do4. re8 mi\noBeam r

    %112
    r fa sol4 sol,\mbreak
    do r r
    do r r

    %115
    do r r
    do r r
    do8 mi mi mi mi mi

    %118
    fa re re re re re
    mi do do do do do
    re si si si si si

    %121
    do8.[do16 re8. re16\mbreak mi8. mi16]
    fa8. [fa16 sol8. sol16] mi8 r
    r fa sol4 sol,

    %124
    do2_\fermata r4

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 3/4
    \tempo 2 = 60
    s2.*124
    \bar"|."


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

IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}
#(set-global-staff-size 16)


\pointAndClickOff

\header {
    title = \markup \smaller{"Concerto per Fagotto in Do maggiore [FaWV L:C2]"}
    composer = \markup \center-column{"J. F. Fasch (1688-1758)"}
}

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Basson"\vspace #-0.2 "conc.[ertante]"}
            \Ifg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup\huge "[2.] Largo e staccato"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Basson"\vspace #-0.2 "conc.[ertante]"}
            \IIfg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \IIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

%\pageBreak

\markup\huge "[3.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Basson"\vspace #-0.2 "conc.[ertante]"}
            \IIIfg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Cembalo"}
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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
