\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = "up"

giu = \change Staff = "down"

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

trio = ^\markup\italic "trio"

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

IvlaIn = \relative do' {

    si'2 r
    si2 la4 fad
    sol2~sol8. sol16 sol8.[fad16]

    %4
    sol4. sol8 sol4 fad
    sol2 si
    la\mbreak la4 la

    %7
    la4. re8 si2
    si4. si8 la4 la
    fad8. re'16 dod8.[si16] la4 re\mbreak

    %10
    re dod la8. si32 la sol8.[fad16]
    mi4. sol8 la4 la
    la8. sol32 fad sol8. fad16 mi4. fad8

    %13
    fad1 fad4 r r
    r8 sol si re si sol\mbreak
    re'4 la la

    %16
    la sol sol
    fad fad la~
    la sol si~

    %19
    si la dod~
    dod si re~
    re la mi'~

    %22
    mi8 re16 dod re8 re re re\mbreak
    re dod16 re mi8 mi mi mi
    mi re16\p dod re8 re re re

    %25
    re dod16 re mi8 mi mi mi
    mi8 re\f la[la] fad fad
    sol4 r r

    %28
    la8 la la la la la
    sol4 r r
    sol8 sol fad[fad] fad fad\mbreak

    %31
    sol sol sol[sol] sol sol
    sol sol la[la] la la
    la4 r r

    %34
    si r r
    fad r8 do' si la
    sol la la4. si8

    %37
    si4 r r
    R2.*3
    r4 la2~

    %42
    la4 sol re'
    do do re~
    re re mi

    %45
    re r r
    R2.*3
    r4 mi2~

    %50
    mi4 re2~
    re4 dod2
    la4 la2

    %53
    la4 la dod~
    dod si re~\mbreak
    re dod mi~

    %56
    mi re re
    dod r r
    R2.*4

    %62
    r8 la dod mi dod la
    re4 la8 dod re4
    dod dod dod

    %65
    re r r
    R2.*4
    r8 re, fad la fad re

    %71
    sol4 sol si
    la la la
    sol8 si re[si] re si

    %74
    do mi mi[do] mi do
    la la la[fad] la fad\mbreak
    sol4 sol sol

    %77
    mi la la
    sol re' re
    do do8 do si[la]

    %80
    la4 r r
    la r r\mbreak
    si r r

    %83
    fad r r
    sol r r
    fad r r

    %86
    r sol sol
    sol sol2~
    sol8 si do4 la\mbreak

    %89
    la la2~
    la8 dod re4 si
    si si2~

    %92
    si4 si2~
    si4 si2~
    si4 si si

    %95
    si si si8 dod
    re4 re re\mbreak
    re re re

    %98
    mi8 mi mi mi mi mi
    re re re re re re
    do do do do do do

    %101
    si si si si si si
    la la la la la la
    sol sol sol sol sol do

    %104
    la4 la la
    si sol sol
    la fad fad

    %107
    sol mi mi
    fad8 la, re[re16 mi] fad8 sol
    la la la[la] re la\mbreak

    %110
    sol sol sol4 fad
    re2 r
    la'2 la4 fad

    %113
    sol2~sol8. sol16 sol8.[la16]
    si8.[sol16] si8. sol16 la4 la\mbreak
    la2 r

    %116
    si la~
    la4. la8 sol4 sol
    sol fa sol4. sol8

    %119
    la4 sol fad re
    re r r re1\fermata

}

IvlaIIn = \relative do' {

    re2 r
    mi re4 re
    si2 sol8. do16 re8.[re16]

    %4
    re4 si8. mi16 mi4 re
    re2 mi
    mi4. mi8 fad4 mi

    %7
    re2 fad
    sol4. sol8 mi4 dod8. fad16
    fad4. re8 re4 fad\mbreak

    %10
    mi mi re si
    dod4. mi8 la,4 mi'
    re si la la

    %13
    la1 la4 r r
    R2.\mbreak
    r8 re fad la fad re

    %16
    sol4 re re
    re re re~
    re re mi~

    %19
    mi mi fad~
    fad fad sol~
    sol la la~

    %22
    la8 la la la la la\mbreak
    la la la dod dod dod
    la la\p la la la la

    %25
    la la la dod dod dod
    la la\f fad[fad] si, si
    si4 r r

    %28
    re8 re re re re re
    re4 r r
    do8 do do do do do\mbreak

    %31
    sol' re re[re] re re
    do mi mi[mi] mi mi
    re4 r r

    %34
    re r r
    la r8 re re re
    re mi re4 re

    %37
    re r r
    R2.*3  %% inizio p 5
    r4 re fad

    %42
    re re sol
    la la fad
    si si la

    %45
    la r r
    R2.*3
    r4 la2~

    %50
    la4 la2~
    la4 la2
    fad4 fad2

    %53
    mi4 mi fad
    fad fad re\mbreak
    la' la la

    %56
    la la la
    la r r
    R2.*5

    %63
    r8 re, fad la fad re
    la'4 la la
    la r r

    %66
    R2.*5
    r8 sol, si re si sol
    re'4 re re

    %73
    re8 re sol[re] sol sol
    sol la la[mi] la la
    la fad re[re] re re\mbreak

    %76
    re4 re re8 si
    mi4 mi mi8 do
    sol'4 sol sol

    %79
    sol do, sol'8 mi
    re4 r r
    re r r\mbreak

    %82
    re r r
    re r r
    mi r r

    %85
    la, r r
    r re re
    do do8 re mi fa

    %88
    mi re do4 mi\mbreak
    re re8 mi fad![sol]
    fad mi re4 fad

    %91
    mi mi2~
    mi4 red2
    sol4 sol2

    %94
    fad4 fad8 sol red4
    sol sol8 fad mi4
    la la8 si fad4\mbreak

    %97
    si si8 fad sol4
    sol8 sol mi mi la la
    si si si si sol sol

    %100
    mi mi do do fad fad
    sol sol sol sol mi mi
    dod dod la la re re

    %103
    mi mi mi mi do! do\mbreak
    re4 re re
    re re re

    %106
    re re re
    dod dod dod
    la8 fad16 sol la8[la] re re16 mi

    %109
    fad8 fad16 mi re8[re16 mi] fad8 re\mbreak
    re si re4 re
    si2 r

    %112
    mi re4 re
    si2 sol8.[sol16] sol8. re'16]
    re4. re8 mi4 dod\mbreak

    %115
    re2 r
    mi mi8.[fad32 sol] la8. sol16
    fad4. do8 re4 si

    %118
    do fa, do'8. sol'16 fad!8.[mi16]
    re4 re8. si16 re4 re
    si r r si1\fermata

}

IobIn = \relative do'' {

    r4 r8 mi \grace re8 do4. si8
    do4. si16 do re8. do16 si8.[la16]
    sol4. la16 si do8. do16 si8.[la16]

    %4
    re8. mi32 fad sol8.[mi16] \grace re8 do4. si8\mbreak
    si4. sol'8 mi4. re8
    dod4. si!16 dod re8.[dod32 re] mi8. re32 mi

    %7
    fad4. sol16 la si8.[fad16] sol8.fad16
    mi4. \tuplet 3/2 { mi16 fad sol } la8.[mi16] fad8. dod16
    re4~re16 dod re32 mi fad sol la8.[sol32 la] si8. la16\mbreak

    %10
    sol8.[sol16] fad8. mi16 fad8.[sol32 fad] mi8. re16
    la4. \tuplet 3/2 { la16 si dod }re8. dod32 re mi8.[re32 mi]
    fad8. mi32 re mi8.[si16] dod4. re8

    %13
    re1 re8 re fad la fad re
    sol4 sol sol\mbreak
    sol8 fad16 mi re8 mi re do

    %16
    si4 si si
    la re, do'~
    do si re~

    %19
    re dod mi~
    mi re fad~
    fad mi sol~

    %22
    sol8 fad16 mi fad8 fad fad fad\mbreak
    fad8 mi16 fad sol8 sol sol sol
    sol8 fad16\p mi fad8 fad fad fad

    %25
    fad8 mi16 fad sol8 sol sol sol
    sol fad16\f mi re8 do si la
    sol sol' si,[sol'] mi sol

    %28
    la, la'16 sol fad8 mi re do
    si si' re,[si'] sol si
    do,16(si la si do8) la' do, la'\mbreak

    %31
    re,16(do si do re8) sol re sol
    mi16(re do re mi8) la mi la
    fad mi^\markup\italic"[trio]" (re do si la)

    %34
    si re(do si la sol)
    fad mi'(re do) sol' fad
    sol8 mi fad4. sol8

    %37
    sol re16^\markup\italic "trio" do si8 re do si
    la si do si do4~\mbreak
    do8 si16 la si8 do re4~

    %40
    re8 do16 re mi8 re do si
    la4 do2\tu~

    %42
    do4 si sol'~
    sol fad la~
    la8 sol16 fad sol8 si la sol

    %45
    fad8 la16^\markup\italic "trio" sol fad8 la sol fad
    mi fad sol fad sol4~\mbreak
    sol8 fad16 mi fad8 sol la4~
    la8 sol16 la si8 la sol fad
    mi4 sol2\tu~

    %50
    sol4 fad2~
    fad4 mi2~
    mi4 re2~

    %53
    re8 dod16 si dod8 re mi fad
    re si16 dod re8 mi fad sol\mbreak
    mi dod16 re mi8 fad sol la

    %56
    fad re16 mi fad8 sol la si
    mi, sol^\markup\italic "trio"~ sol fad~fad mi16 re
    dod8 re mi[fad] sol4~
    sol8 mi16 fad sol8 la16 fad sol4~
    sol8 si16 la sol8 sol sol sol

    %61
    fad re\tu fad la fad re\mbreak
    la'4 la la  %% inizio p. 6
    fad8 mi re mi fad4

    %64
    mi8 la mi[dod16 si] la8 sol'
    fad do!^\markup\italic "trio"~do si~si la16 sol
    fad8 sol la si do4~
    do8 la16 si do8 re16 si do4~
    do8 mi16 re do8 do do do\mbreak

    %69
    si8 sol\tu si re si sol
    re'4 re re
    si sol'2~

    %72
    sol8 fad16 mi re8 mi re do
    si si'16 la sol8 la sol fad
    mi do'16 si la8 si la sol

    %75
    fad la16 sol fad8 mi re do\mbreak
    si la si[do] re mi16 re
    do8 si do[re] mi fa16 mi

    %78
    re8 do re[mi] fa sol16 fa
    mi8 re mi[fad!] sol la16 sol
    fad8 mi16^\markup\italic "[trio]"  re do8 si la si

    %81
    do8 mi16 re do8 do re do\mbreak
    si8 re16 do si8 si do si
    la8 do16 si la8 la si la

    %84
    sol8 si16 la sol8 sol la sol
    fad4 re'\tu re
    re re8 mi fa4~

    %87
    fa8 sol16 fa mi8 re do si
    do re mi fad! sol4~\mbreak
    sol8 la16 sol fad8 mi re dod

    %90
    re mi fad sol la4~
    la sol2~
    sol4 fad2~

    %93
    fad4 mi2~
    mi8 red16 dod red8 mi fad4~
    fad8 mi16 red mi8[fad] sol4~

    %96
    sol8 fad16 mi fad8 sol la4~\mbreak
    la8 sol16 fad sol8 la si4~
    si8 do16 si la8 la la la

    %99
    la re, sol sol16 fad sol8 sol
    sol la16 sol fad8 fad fad fad
    fad si, mi mi16 re mi8 mi

    %102
    mi fad16 mi re8 re re re
    re sol, do do16 si do8 sol'\mbreak
    fad\p fad fad fad fad fad

    %105
    sol sol sol sol sol sol
    fad fad fad fad fad fad
    mi mi mi mi mi mi

    %108
    re8 re,16 mi fad8 [fad16 sol] la8 si16 dod
    re8 re16 mi fad8 fad16 sol la8 sol16 fad\mbreak
    sol8 re si4 la8 sol

    %111
    sol4. mi'8 do4.-+ si8
    do4. si16 do re8. do16 si8.[la16]
    sol4. la16 si do8.[re16] mi8. fad16

    %114
    sol8. re16 sol8. [si16] mi,8. mi16 fad8.[sol16]\mbreak
    fad4. si8 sol4.-+ fad8
    sol4. fad16 sol la8. sol16 fad8. mi16

    %117
    re4. mi16 fad sol8. fa16 mi8. [re16]
    mi8. re16 do8. [si16] do2~
    do8. la16 si8. [sol16] la4. sol8

    %120
    sol re' fad? la fad re sol,1\fermata

}

IobIIn = \relative do'' {

    si2 r
    la2 la4 fad
    sol2~sol8. sol16 sol8.[fad16]

    %4
    sol4. sol8 sol4 fad
    sol2 si
    la\mbreak la4 la

    %7
    la4. re8 si2
    si4. si8 la4 la
    fad8. re'16 dod8.[si16] la4 re\mbreak

    %10
    re dod la8. si32 la sol8.[fad16]
    mi4. sol8 la4 la
    la8. sol32 fad sol8. fad16 mi4. fad8

    %13
    fad1 fad4 r r
    r8 sol si re si sol\mbreak
    re'4 la la

    %16
    la sol sol
    fad fad la~
    la sol si~

    %19
    si la dod~
    dod si re~
    re la mi'~

    %22
    mi8 re16 dod re8 re re re\mbreak
    re dod16 re mi8 mi mi mi
    mi re16\p dod re8 re re re

    %25
    re dod16 re mi8 mi mi mi
    mi8 re\f la[la] fad fad
    sol4 r r

    %28
    la8 la la la la la
    sol4 r r
    sol8 sol fad[fad] fad fad\mbreak

    %31
    sol sol sol[sol] sol sol
    sol sol la[la] la la
    la do^\markup\italic"[trio]"(si la sol fad)
    sol si(la sol fad mi)
    re re'(do si) si do
    re mi16 do la4. si8
    si si16^\markup\italic "trio" la sol8 si la sol
    fad sol la sol la4~\mbreak
    la8 sol16 fad sol8 la si4~
    si8 la16 si do8 si la sol
    fad4 la2\tu~

    %42
    la4 sol re'
    do do re~
    re re mi

    %45
    re8 fad16^\markup\italic "trio" mi re8 fad mi re
    dod re mi re mi4~\mbreak
    mi8 re16 dod re8 mi fad4~
    fad8 mi16 fad sol8 fad mi re
    dod4 mi2\tu~

    %50
    mi4 re2~
    re4 dod2
    la4 la2

    %53
    la4 la dod~
    dod si re~\mbreak
    re dod mi~

    %56
    mi re re
    dod8 mi^\markup\italic "trio"~mi [re~] re dod16 si
    la8 si dod re mi4~
    mi8 dod16 re mi8[fad16 re] mi4~
    mi8 sol16 fad mi8 mi mi mi
    re4 r r\mbreak

    %62
    r8 la\tu dod mi dod la
    re4 la8 dod re4
    dod dod dod

    %65
    re8 la~^\markup\italic "trio" la[sol]~sol fad16 mi
    re8 mi fad sol la4~
    la8 fad16 sol la8[si16 sol] la4~
    la8 do16 si la8 la la la\mbreak
    sol4 r r
    r8 re\tu fad la fad re

    %71
    sol4 sol si
    la la la
    sol8 si re[si] re si

    %74
    do mi mi[do] mi do
    la la la[fad] la fad\mbreak
    sol4 sol sol

    %77
    mi la la
    sol re' re
    do do8 do si[la]

    %80
    la8 do16^\markup\italic "[trio]" si la8 sol fad sol
    la do16 si la8 la si la\mbreak
    sol si16 la sol8 sol la sol
    fad la16 sol fad8 fad sol fad
    mi8 sol16 fad mi8 mi fad mi
    re4 r r

    %86
    r sol\tu sol
    sol sol2~
    sol8 si do4 la\mbreak

    %89
    la la2~
    la8 dod re4 si
    si si2~

    %92
    si4 si2~
    si4 si2~
    si4 si si

    %95
    si si si8 dod
    re4 re re\mbreak
    re re re

    %98
    mi8 mi mi mi mi mi
    re re re re re re
    do do do do do do

    %101
    si si si si si si
    la la la la la la
    sol[sol] sol sol do[do]\mbreak
    do\p do do do do do
    si si si si si si
    la la la la la la
    sol sol sol sol sol sol
    fad re re[re16 mi] fad8 sol
    la la la[la] re la\mbreak

    %110
    sol sol sol4 fad
    re2 r
    la'2 la4 fad

    %113
    sol2~sol8. sol16 sol8.[la16]
    si8.[sol16] si8. sol16 la4 la\mbreak
    la2 r

    %116
    si la~
    la4. la8 sol4 sol
    sol fa sol4. sol8

    %119
    la4 sol fad4. sol8
    sol4 r r sol1\fermata

}

IvlIn =  \relative do'' {

    r4 r8 mi \grace re8 do4. si8
    do4. si16 do re8. do16 si8.[la16]
    sol4. la16 si do8. do16 si8.[la16]

    %4
    re8. mi32 fad sol8.[mi16] \grace re8 do4. si8\mbreak
    si4. sol'8 mi4. re8
    dod4. si!16 dod re8.[dod32 re] mi8. re32 mi

    %7
    fad4. sol16 la si8.[fad16] sol8.fad16
    mi4. \tuplet 3/2 { mi16 fad sol } la8.[mi16] fad8. dod16
    re4~re16 dod re32 mi fad sol la8.[sol32 la] si8. la16\mbreak

    %10
    sol8.[sol16] fad8. mi16 fad8.[sol32 fad] mi8. re16
    la4. \tuplet 3/2 { la16 si dod }re8. dod32 re mi8.[re32 mi]
    fad8. mi32 re mi8.[si16] dod4. re8

    %13
    re1 re8 re fad la fad re
    sol4 sol sol\mbreak
    sol8 fad16 mi re8 mi re do

    %16
    si4 si si
    la re, do'~
    do si re~

    %19
    re dod mi~
    mi re fad~
    fad mi sol~

    %22
    sol8 fad16 mi fad8 fad fad fad\mbreak
    fad8 mi16 fad sol8 sol sol sol
    sol8 fad16\p mi fad8 fad fad fad

    %25
    fad8 mi16 fad sol8 sol sol sol
    sol fad16\f mi re8 do si la
    sol sol' si,[sol'] mi sol

    %28
    la, la'16 sol fad8 mi re do
    si si' re,[si'] sol si
    do,16(si la si do8) la' do, la'\mbreak

    %31
    re,16(do si do re8) sol re sol
    mi16(re do re mi8) la mi la
    fad4 r r

    %34
    sol r r
    do, r8 la' sol fad
    sol mi fad4. sol8

    %37
    sol4 r r
    R2.*3
    r4 do,2~

    %42
    do4 si sol'~
    sol fad la~
    la8 sol16 fad sol8 si la sol

    %45
    fad4 r r
    R2.*3
    r4 sol2~

    %50
    sol4 fad2~
    fad4 mi2~
    mi4 re2~

    %53
    re8 dod16 si dod8 re mi fad
    re si16 dod re8 mi fad sol\mbreak
    mi dod16 re mi8 fad sol la

    %56
    fad re16 mi fad8 sol la si
    mi,4 r r
    R2.*3

    %61
    r8 re fad la fad re\mbreak
    la'4 la la  %% inizio p. 6
    fad8 mi re mi fad4

    %64
    mi8 la mi[dod16 si] la8 sol'
    fad4 r r
    R2.*3\mbreak

    %69
    r8 sol, si re si sol
    re'4 re re
    si sol'2~

    %72
    sol8 fad16 mi re8 mi re do
    si si'16 la sol8 la sol fad
    mi do'16 si la8 si la sol

    %75
    fad la16 sol fad8 mi re do\mbreak
    si la si[do] re mi16 re
    do8 si do[re] mi fa16 mi

    %78
    re8 do re[mi] fa sol16 fa
    mi8 re mi[fad!] sol la16 sol
    fad4 r r

    %81
    fad r r\mbreak
    sol r r
    do, r r

    %84
    dod r r
    r re re
    re re8 mi fa4~


    %87
    fa8 sol16 fa mi8 re do si
    do re mi fad! sol4~\mbreak
    sol8 la16 sol fad8 mi re dod

    %90
    re mi fad sol la4~
    la sol2~
    sol4 fad2~

    %93
    fad4 mi2~
    mi8 red16 dod red8 mi fad4~
    fad8 mi16 red mi8[fad] sol4~

    %96
    sol8 fad16 mi fad8 sol la4~\mbreak
    la8 sol16 fad sol8 la si4~
    si8 do16 si la8 la la la

    %99
    la re, sol sol16 fad sol8 sol
    sol la16 sol fad8 fad fad fad
    fad si, mi mi16 re mi8 mi

    %102
    mi fad16 mi re8 re re re
    re sol, do do16 si do8 do\mbreak
    do4\(~do16 si do re mi fad sol la\)

    %105
    si,4\(~si16 la si do re mi fad sol\)
    la,4\(~la16 sol la si dod re mi fad\)
    sol,4\(~sol16 fad sol la si dod re mi\)

    %108
    fad,8 re16 mi fad8 [fad16 sol] la8 si16 dod
    re8 re16 mi fad8 fad16 sol la8 sol16 fad\mbreak
    sol8 re si4 la8 sol

    %111
    sol4. mi'8 do4.-+ si8
    do4. si16 do re8. do16 si8.[la16]
    sol4. la16 si do8.[re16] mi8. fad16

    %114
    sol8. re16 sol8. [si16] mi,8. mi16 fad8.[sol16]\mbreak
    fad4. si8 sol4.-+ fad8
    sol4. fad16 sol la8. sol16 fad8. mi16

    %117
    re4. mi16 fad sol8. fa16 mi8. [re16]
    mi8. re16 do8. [si16] do2~
    do8. la16 si8. [sol16] la4. sol8

    %120
    sol re' fad? la fad re sol,1\fermata

}

Ifgn = \relative do {

    sol2 r
    sol' fad4 re
    mi2~mi8. mi16 re8. [do16]

    %4
    si4. sol8 la4 re\mbreak
    sol,2 sol'~
    sol4. sol8 fad4 dod

    %7
    re2 re'~
    re8. re16 dod8.[si16] dod4 la
    si8. si16 la8.[sol16] fad4 re\mbreak

    %10
    mi la, re sol~
    sol8. sol16 fad8.[mi16] fad4 dod
    re sol, la2

    %13
    re,4. \tuplet 3/2 { sol'16 fad mi } re8.[do?16] si8. la16 re,4 r r
    R2.*2
    r8 sol' si re si sol

    %17
    re' re, fad la fad re
    sol sol, sol' si sold mi
    la la, la' dod lad fad

    %20
    si si, si' re si sol?
    dod dod, dod' mi dod la
    re re, re re re re\mbreak

    %23
    la' la la la la la
    re re,\p re re re re
    la' la la la la la

    %26
    re re,\f re re re re
    mi4 r r
    fad8 fad fad fad fad fad

    %29
    sol4 r r
    la8 la la la la la\mbreak
    si si si si si si

    %32
    do do do do do do
    re4 r r
    re, r r

    %35
    re, r8 re' re, re'
    si do re4 re,
    sol sol' do,

    %38
    re re' re\mbreak
    sol, sol, sol
    do do' do

    %41
    re8 re,\tu fad re la' re,
    sol re sol re si' re,
    la' re, la' re, do' re,

    %44
    si' re, si' re, dod' re,
    re'4 re, sol
    la la la,\mbreak

    %47
    re re' re
    sol, sol, sol
    la8 la'\tu dod mi dod la

    %50
    re re, fad la fad re
    la' la, dod mi dod la
    re re, fad la fad re

    %53
    la'4 la la
    si si si\mbreak
    dod dod dod
    re re,8 mi fad sol

    %57
    la4 la' la
    la la, la
    la la' la
    la la, la
    re r r\mbreak
    R2.*2
    r8 la' \tu dod mi dod la

    %65
    re4 re, re
    re re' re
    re re, re

    %68
    re re' re\mbreak
    sol, r r
    R2.*2
    r8 re\tu fad la fad re

    %73
    sol sol, si re si sol
    do la do mi do la
    re re, fad la fad re\mbreak

    %76
    sol fad sol la si sol
    la sol la si do la
    si la si do re si

    %79
    do si do re mi dod
    re4 r r
    re r r

    %82 %% fine p. 6 OOKK
    re r r
    re r r
    re r r

    %85
    re r r
    r8 sol si re si sol
    do4 do, r

    %88
    r8 sol' do mi dod la\mbreak
    re4 re, r
    r8 la' re fad red si

    %91
    mi mi, sol si sol mi
    si' si, red fad red si
    mi mi, sol si sol mi

    %94
    si'4 si si
    mi mi mi
    re re re\mbreak

    %97
    sol sol sol
    do8 do do do do do
    si si si si si si

    %100
    la la la la la la
    sol sol sol sol sol sol
    fad fad fad fad fad fad

    %103
    mi mi mi mi mi mi\mbreak
    re4 re re
    re re re

    %106
    re re re
    re re re
    re8 re re re re re

    %109
    do' do do do do do\mbreak
    si sol re'4 re,
    sol,2 r

    %112
    sol' fad4 re
    mi2~mi8. mi16 re8. [do16]
    si4. si8 dod4 la\mbreak

    %115
    re2 r
    re' do!~
    do8. [do16] si8. la16 si4 sol

    %118
    do, re mi8. mi16 re8.[do16]
    fad4 sol re re,
    sol r r sol1\fermata

}

Ibcn = \relative do {

    sol2 r
    sol' fad4 re
    mi2~mi8. mi16 re8. [do16]

    %4
    si4. sol8 la4 re\mbreak
    sol,2 sol'~
    sol4. sol8 fad4 dod

    %7
    re2 re'~
    re8. re16 dod8.[si16] dod4 la
    si8. si16 la8.[sol16] fad4 re\mbreak

    %10
    mi la, re sol~
    sol8. sol16 fad8.[mi16] fad4 dod
    re sol, la2

    %13
    re,4. \tuplet 3/2 { sol'16 fad mi } re8.[do?16] si8. la16 re,4 r r
    R2.*2
    r8 sol' si re si sol

    %17
    re' re, fad la fad re
    sol sol, sol' si sold mi
    la la, la' dod lad fad

    %20
    si si, si' re si sol?
    dod dod, dod' mi dod la
    re re, re re re re\mbreak

    %23
    la' la la la la la
    re re,\p re re re re
    la' la la la la la

    %26
    re re,\f re re re re
    mi4 r r
    fad8 fad fad fad fad fad

    %29
    sol4 r r
    la8 la la la la la\mbreak
    si si si si si si

    %32
    do do do do do do
    re4 r r
    re, r r

    %35
    re, r8 re' re, re'
    si do re4 re,
    sol r r

    %38
    R2.*3
    r8 re'\tu fad re la' re,
    sol re sol re si' re,

    %43
    la' re, la' re, do' re,
    si' re, si' re, dod' re,
    re'4 r r

    %46
    R2.*3
    r8 la\tu dod mi dod la
    re re, fad la fad re

    %51
    la' la, dod mi dod la
    re re, fad la fad re
    la'4 la la

    %54
    si si si\mbreak
    dod dod dod
    re re,8 mi fad sol

    %57
    la4 r r
    R2.*6
    r8 la' \tu dod mi dod la

    %65
    re4 r r
    R2.*6
    r8 re,\tu fad la fad re

    %73
    sol sol, si re si sol
    do la do mi do la
    re re, fad la fad re\mbreak

    %76
    sol fad sol la si sol
    la sol la si do la
    si la si do re si

    %79
    do si do re mi dod
    re4 r r
    re r r

    %82 %% fine p. 6 OOKK
    re r r
    re r r
    re r r

    %85
    re r r
    r8 sol si re si sol
    do4 do, r

    %88
    r8 sol' do mi dod la\mbreak
    re4 re, r
    r8 la' re fad red si

    %91
    mi mi, sol si sol mi
    si' si, red fad red si
    mi mi, sol si sol mi

    %94
    si'4 si si
    mi mi mi
    re re re\mbreak

    %97
    sol sol sol
    do8 do do do do do
    si si si si si si

    %100
    la la la la la la
    sol sol sol sol sol sol
    fad fad fad fad fad fad

    %103
    mi mi mi mi mi mi\mbreak
    re4 re re
    re re re

    %106
    re re re
    re re re
    re8 re re re re re

    %109
    do' do do do do do\mbreak
    si sol re'4 re,
    sol,2 r

    %112
    sol' fad4 re
    mi2~mi8. mi16 re8. [do16]
    si4. si8 dod4 la\mbreak

    %115
    re2 r
    re' do!~
    do8. [do16] si8. la16 si4 sol

    %118
    do, re mi8. mi16 re8.[do16]
    fad4 sol re re,
    sol r r sol1\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \key sol\major
    \tempo 2 = 47
    \repeat volta 2 {s1*12}
    \alternative {{s1}{\time 3/4 \tempo 2. = 55 s2.}}\break
    \set Score.currentBarNumber = #14
    \repeat volta 2 {s2.*97 \time 2/2 \tempo 2 = 47 s1*9}
    \alternative {{\time 3/4\tempo 2. = 55  s2.}{\time 4/4 s1}}
    \bar "|."

}

IobI = {
    \Iglobal
    %\notypeset
    <<\IobIn \forma>>

}

IobII = {
    \Iglobal
    <<\IobIIn \forma>>

}

IvlaI = {
    \Iglobal
    <<\IvlaIn \forma>>

}

IvlaII = {
    \Iglobal
    \clef alto
    <<\IvlaIIn \forma>>

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

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
    \typeset

}


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIflIn = \relative do'' {

    r4\footnote #' (-1 . 3) \markup\column\smaller {"  ""The time signature is not in the autograph, only in the separate parts.""  "} si la8(sol)
    re'4 re mi8(fa16 sol)
    re4 r r

    %4
    R2.
    r4 mi mi
    la sol4. fad8

    %7
    sol8(fad) mi(sol) fad(mi)\mbreak
    fad(sol) fad(mi) re(do)
    si4 r r

    %10
    R2.
    r4 fad'8(sol) la[(fad)]
    si(la) sol[(la)] sol(fad)

    %13
    mi4 la2~
    la2.~
    la4 mi8\f(fad16 sol) fad8(mi)\mbreak

    %16
    fad(sol) la[(si)] sol(fad)
    si(la) sol[(fad)] mi(re)
    dod(mi) la[(sol)] fad(mi)

    %19
    re sol mi4. re8
    re2.~
    re4 la8(si16 do!) si8 (do16 re)

    %22
    la4 r r
    R2. la4 r r R2.
    r4 fad' mi8(re)

    %25
    la'4 la si8(do16 re)
    la4 fad\trio mi8(re)
    la'4 la si8(do16 re)

    %28
    la4 do do
    si sol4.-+(fad16 sol)
    la8(sol) fad[(sol)] mi(fad)\mbreak

    %31
    sol(fad) sol[(la)] si(do)
    fad,4 r r
    r8 si\trio la(sol) fad(mi)

    %34
    red fad\tu mi(red) dod(si)
    mi(red) mi(fad) sol(la)
    fad(do') si(la) sol4~

    %37
    sol8 fad fad4. mi8\mbreak
    mi4 r r
    r re8(mi) fad[(sol)]

    %40
    la(fad) re'4 r
    r do,8(re) mi[(fa)]
    sol(mi) do'2~

    %43
    do4 do do
    si la4. sol8
    fad2 r4\mbreak

    %46
    r si,\tu la8-+(sol)
    re'4 re mi8(fa16 sol)
    re4 r r

    %49
    R2.
    r4 si' si
    si la4. sol8

    %52
    fad(sol) fad(mi) re (do)
    si(re) do(si) la(sol)
    fad4 r r\mbreak

    %55
    R2.
    r4 re''8\trio(do) si[(do)]
    re(do16 si) la8(sol) la(si)

    %58
    do2.~
    do~
    do4 fad,!8(sol16 la) sol8(fad)

    %61
    sol(la) si[(la)] sol(fad) \mbreak
    mi(re) do[(re)] mi(fad)
    sol mi fad4. sol8

    %64
    sol2.~
    sol~
    sol4 re8(mi16 fa) mi8(re)

    %67
    mi(re) do[(mi)] la(sol)
    fad!(mi) re[(do)] si(la)\mbreak
    sol do la4. sol8

    %70
    sol4 r r
    R2. sol2.\fermata

}

IIflIIn = \relative do'' {

    r4 si la8(sol)
    re'4 re mi8(fa16 sol)
    re4 r r

    %4
    R2.
    r4 mi mi
    la sol4. fad8

    %7
    sol8(fad) mi(sol) fad(mi)\mbreak
    fad(sol) fad(mi) re(do)
    si4 r r

    %10
    R2.
    r4 re8(mi) fad[(re)]
    sol(fad) mi[(fad)] mi(re)

    %13
    dod4 la'2~
    la2.~
    la4 mi8\f(fad16 sol) fad8(mi)\mbreak

    %16
    fad(sol) la[(si)] sol(fad)
    si(la) sol[(fad)] mi(re)
    dod(mi) la[(sol)] fad(mi)

    %19
    re sol mi4. re8
    re2.~
    re4 la8(si16 do!) si8 (do16 re)

    %22
    la4 r r
    R2. la4 r r R2.
    r4 fad' mi8(re)

    %25
    la'4 la si8(do16 re)
    la4 fad\trio sol
    la4 fad sol8(la16 si)

    %28
    fad4 do' do
    si sol4.-+(fad16 sol)
    la8(sol) fad[(sol)] mi(fad)\mbreak

    %31
    sol(fad) sol[(la)] si(do)
    fad,4 r r
    r8 sol\trio fad(mi) re(dod)

    %34
    si fad'\tu mi(red) dod(si)
    mi(red) mi(fad) sol(la)
    fad(do') si(la) sol4~

    %37
    sol8 fad fad4. mi8\mbreak
    mi4 r r
    r re8(dod) re(mi)]
    fad(re) fad4 r
    r do8(si) do[(re)]
    mi4 mi mi
    re fad8(sol) fad4
    re8 si' la4. sol8
    fad2 r4\mbreak

    %46
    r si,\tu la8-+(sol)
    re'4 re mi8(fa16 sol)
    re4 r r

    %49
    R2.
    r4 si' si
    si la4. sol8

    %52
    fad(sol) fad(mi) re (do)
    si(re) do(si) la(sol)
    fad4 r r\mbreak

    %55
    R2.
    r4 fa'8\trio(mi) re[(mi)]
    fa(mi16 re) do8(si) do[(re)]

    %58
    mi4 do'2~
    do2.~
    do4 fad,!8(sol16 la) sol8(fad)

    %61
    sol(la) si[(la)] sol(fad) \mbreak
    mi(re) do[(re)] mi(fad)
    sol mi fad4. sol8

    %64
    sol2.~
    sol~
    sol4 re8(mi16 fa) mi8(re)

    %67
    mi(re) do[(mi)] la(sol)
    fad!(mi) re[(do)] si(la)\mbreak
    sol do la4. sol8

    %70
    sol4 r r
    R2. sol2.\fermata

}

IIobIn = \relative do'' {

    r4 si la8(sol)
    re'4 re mi8(fa16 sol)
    re4 si\trio la8(sol)

    %4
    re'4 re mi8(fa16 sol)
    re4 mi\tu mi
    la sol4. fad8

    %7
    sol8(fad) mi(sol) fad(mi)\mbreak
    fad(sol) fad(mi) re(do)
    si4 si'8\trio(la) sol[(fad)]

    %10
    mi(fad16 sol) la8[(si)] la(sol)
    fad4 r r
    R2.

    %13
    r4 dod8(re16 mi) re8 dod
    re(dod) re(mi16 fad) mi8(re)
    mi(re) mi\f(fad16 sol) fad8(mi)\mbreak

    %16
    fad(sol) la[(si)] sol(fad)
    si(la) sol[(fad)] mi(re)
    dod(mi) la[(sol)] fad(mi)

    %19
    re sol mi4. re8
    re4 la8(si16 do!) si8(la16 sol)
    fad8(sol) la(si16 do) si8 (do16 re)

    %22
    la4 r r
    R2. la4 r r R2.
    r4 fad' mi8(re)

    %25
    la'4 la si8(do16 re)
    la4 r r
    R2.

    %28
    r4 do\f do
    si sol4.-+(fad16 sol)
    la8(sol) fad[(sol)] mi(fad)\mbreak

    %31
    sol(fad) sol[(la)] si(do)
    fad, si\trio la[(sol)] fad(mi)
    red4 r r

    %34
    r8 fad\tu mi(red) dod(si)
    mi(red) mi(fad) sol(la)
    fad(do') si(la) sol4~

    %37
    sol8 fad fad4. mi8\mbreak
    mi4 sol8\trio(si) la[(sol)]
    fad(mi) re4 r

    %40
    r fad8(la) sol[(fad)]
    mi(re) do4 r
    r mi8(sol) fad[(mi)]

    %43
    fad(mi) re[(mi)] fad(sol16 la)
    sol8(fad) mi4. mi8
    fad(mi) re[(do)] si(la)\mbreak

    %46
    si4 si\tu la8-+(sol)
    re'4 re mi8(fa16 sol)
    re4 si\trio la8(sol) %%% fin qui

    %49
    re'4 re mi8(fa16 sol)
    re4 si' si
    si la4. sol8

    %52
    fad(sol) fad(mi) re (do)
    si(re) do(si) la(sol)
    fad4 la'8\trio (sol) fad[(sol)]\mbreak

    %55
    la(sol16 fad) mi8(re) mi(fad)
    sol4 r r
    R2.

    %58
    r4 mi8(fa16 sol) mi8(re)
    do(re) mi[(re)] do(si)
    la4 fad'!8\tu(sol16 la) sol8(fad)

    %61
    sol(la) si[(la)] sol(fad) \mbreak
    mi(re) do[(re)] mi(fad)
    sol mi fad4. sol8

    %64
    sol4 si,8(do16 re) do8(si)
    do(si) do(re16 mi) re8(do)
    re(do) re\tu(mi16 fa) mi8(re)

    %67
    mi(re) do[(mi)] la(sol)
    fad!(mi) re[(do)] si(la)\mbreak
    sol do la4. sol8

    %70
    sol4 r r
    R2. sol2.\fermata

}

IIobIIn = \relative do'' {

    si2 do4
    re si do
    si2 do4\trio

    %4
    re si do
    si4 do\tu mi
    mi re re

    %7
    re dod8(mi) re(dod)\mbreak
    re4 la fad
    sol re'8\trio(do) si[(la)]

    %10
    sol(la16 si) do8[(re)] do(si)
    la4 r r
    R2.

    %13
    r4 la8(si16 dod) si8(la)
    si(la) si(dod16 re) dod8(si)
    dod(si) dod8\f(re16 mi) re8(dod)\mbreak

    %16
    re4 re re
    re mi si
    la la la

    %19
    fad8 si dod4. re8
    re4 fad,8(sol16 la) sol8(fad16 mi)
    re8(mi) fad8(sol16 la) sol8(la16 si)

    %22
    fad4 r r
    R2. fad4 r r R2.
    r4 la la

    %25
    re re re
    re r r
    R2.

    %28
    r4 la\f re
    re do do
    do si si\mbreak

    %31
    si si si
    si8 sol'\trio fad[(mi)] red(dod)
    si4 r r

    %34
    r si\f si
    si la si
    si si si

    %37
    do si si\mbreak
    sol si8(re) do[(si)]
    la(sol) fad4 r

    %40
    r la8(do) si[(la)]
    sol(fa) mi4 r
    r do' do

    %43
    la8(sol) fad[(sol)] la4
    si do4. si8
    la4 la fad\mbreak

    %46
    sol4 si\tu do
    re si do
    si si\trio do

    %49
    re si do
    si4 re re
    re do4. si8

    %52
    la(si) la[(sol)] la4
    sol sol mi
    fad do'8\trio(si) la[(sol)]\mbreak

    %55
    do(si16 la) sol8(fad) sol(la)
    si4 r r
    R2.

    %58
    r4 do8(re16 mi) do8[(si)]
    la(si) do[(si)] la(sol)
    fad4 la la

    %61
    sol sol sol\mbreak
    sol sol la
    sol8 la la4. si8

    %64
    si4 sol8(la16 si) la8(sol)
    la(sol) la(si16 do) si8(la)
    si(la) si8\tu(do16 re) do8(si)

    %67
    do4 do do8(si)
    la(sol) fad[(la)] sol(fad)\mbreak
    sol la fad4. sol8

    %70
    sol 4r r
    R2. sol\fermata

}

IIvlIn = \relative do'' {

    r4 si la8(sol)
    re'4 re mi8(fa16 sol)
    re4 r r

    %4
    R2.
    r4 mi mi
    la sol4. fad8

    %7
    sol8(fad) mi(sol) fad(mi)\mbreak
    fad(sol) fad(mi) re(do)
    si4 r r

    %10
    R2.
    r4 re,\p re'
    sol, sol, sol'

    %13
    la r r
    R2.
    r4 mi'8\f(fad16 sol) fad8(mi)\mbreak

    %16
    fad(sol) la[(si)] sol(fad)
    si(la) sol[(fad)] mi(re)
    dod(mi) la[(sol)] fad(mi)

    %19
    re sol mi4. re8
    re4 r r
    r la8(si16 do!) si8 (do16 re)

    %22
    la4 r r
    R2. la4 r r R2.
    r4 fad' mi8(re)

    %25
    la'4 la si8(do16 re)
    la4 re,,\p mi
    fad re sol

    %28
    re' do'\f do
    si sol4.-+(fad16 sol)
    la8(sol) fad[(sol)] mi(fad)\mbreak

    %31
    sol(fad) sol[(la)] si(do)
    fad,4 si,\p si
    si si, si

    %34
    \once\stemUp si8 fad''\f mi(red) dod(si)
    mi(red) mi(fad) sol(la)
    fad(do') si(la) sol4~

    %37
    sol8 fad fad4. mi8\mbreak
    mi4 r r
    R2.*7\mbreak

    %46
    r4 si la8(sol)
    re'4 re mi8(fa16 sol)
    re4 r r

    %49
    R2.
    r4 si' si
    si la4. sol8

    %52
    fad(sol) fad(mi) re (do)
    si(re) do(si) la(sol)
    fad4 r r\mbreak

    %55
    R2.
    r4 sol\p sol
    sol sol, sol

    %58
    do r r
    R2.
    r4 fad'8(sol16 la) sol8(fad)

    %61
    sol(la) si[(la)] sol(fad) \mbreak
    mi(re) do[(re)] mi(fad)
    sol mi fad4. sol8

    %64
    sol4 r r
    R2.
    r4 re8(mi16 fa) mi8(re)

    %67
    mi(re) do[(mi)] la(sol)
    fad!(mi) re[(do)] si(la)\mbreak
    sol do la4. sol8

    %70
    sol4 r r
    R2. sol2.\fermata

}

IIvlaIn = \relative do' {

    si'2 do4
    re si do
    si r r

    %4
    R2.
    r4 do mi
    mi re re

    %7
    re dod8(mi) re(dod)\mbreak
    re4 la fad
    sol r r

    %10
    R2.
    r4 re4\p re'
    sol, sol, sol'

    %13
    la r r
    R2.
    r4 dod8\f(re16 mi) re8(dod)\mbreak

    %16
    re4 re re
    re mi si
    la la la

    %19
    fad8 si la4 la
    la r r
    r fad8(sol16 la) sol8(la16 si)

    %22
    fad4 r r
    R2. fad4 r r R2.
    r4 la la

    %25
    re re re
    re re,\p mi
    fad re sol

    %28
    re' la\f re
    re do do
    do si si\mbreak

    %31
    si si si
    si si\p si
    si si, si

    %34
    si si'\f si
    si la si
    si si si

    %37
    do si si\mbreak
    si r r
    R2.*7\mbreak

    %46
    r4 si do
    re si do
    si r r

    %49
    R2.
    r4 re re
    re do4. si8

    %52
    la(si) la[(sol)] la4
    sol sol mi
    re r r\mbreak

    %55
    R2.
    r4 sol\p sol
    sol sol, sol

    %58
    do r r
    R2.
    r4 la' la

    %61
    sol sol sol\mbreak
    sol sol la
    sol8 la la4. si8

    %64
    si4 r r
    R2.
    r4 si8(do16 re) do8(si)

    %67
    do4 do do8(si)
    la(sol) fad[(la)] sol(fad)\mbreak
    sol la fad4 re

    %70
    re r r
    R2. re\fermata

}

IIvlaIIn = \relative do' {

    re2 do4
    sol' sol sol
    sol r r

    %4
    R2.
    r4 sol do8(si)
    la4 si si

    %7
    si la la\mbreak
    la re, re
    re r r

    %10
    R2.
    r4 re\p re'
    sol, sol, sol'

    %13
    la r r
    R2.
    r4 la\f la\mbreak

    %16
    la8(sol) fad4 la
    sol8(la) si[(la)] sol(fad)
    mi4 mi dod

    %19
    re8 mi dod4 la'
    fad r r
    r re re

    %22
    re r r
    R2. re4 r r R2.
    r4 re sol

    %25
    fad fad sol
    fad re\p mi
    fad re sol

    %28
    re' fad,8\f(sol) la[(fad)]
    sol4 mi4.-+(red16 mi)
    fad8(mi) red[(mi)] si(red)\mbreak

    %31
    mi(red) mi4 mi
    red si'\p si
    si si, si

    %34
    si8 red\f sol[(fad)] mi(red)
    mi4 red mi
    fad4 red mi4~

    %37
    mi8 mi red4. mi8\mbreak
    mi4 r r
    R2.*7\mbreak

    %46
    r4 re do
    sol' sol sol
    sol r r

    %49
    R2.
    r4 sol sol
    mi mi mi

    %52
    re re re
    re sol, do8(si)
    la4 r r\mbreak

    %55
    R2.
    r4 sol'\p sol
    sol sol, sol

    %58
    do r r
    R2.
    r4 re re

    %61
    re re re\mbreak
    do8(re) mi[(re)] do4
    re8 mi re4 re

    %64
    re r r
    R2.
    r4 sol sol

    %67
    sol mi mi
    re re re
    si8 mi re4 re

    %70
    si r r
    R2. si\fermata

}

IIfgn = \relative do {

    sol2 la4
    si sol do
    sol sol'\trio la

    %4
    si sol do
    sol4 do8(si) la[(sol)]
    fad4 si si,

    %7
    mi la, la'\mbreak
    re, re, fad
    sol sol'\trio si

    %10
    do do, la
    re r r
    R2.*3

    %15
    r4 la' la,\mbreak
    re re' re,

    %17
    sol sol, sol'
    la dod, la
    si8 sol la4 la

    %20
    re, r r
    r re' sol,
    re'8 re' do(si) la(sol)

    %23
    fad(mi) re(do) si(la) re4 mi8(fad) sol(la) si(la) sol(la) si(dod)
    re4 re, mi
    fad re sol

    %26
    re' r r
    R2.
    r4 re,8(mi) fad[(re)]

    %29
    sol(la16 si) do8(si) la(sol)
    fad4 si si,\mbreak   %%% fine p. 10
    mi mi,8(fad) sol[(la)]

    %32
    si4 r r
    R2.
    r4 si' la

    %35
    sol fad mi
    red si mi
    la si si,\mbreak

    %38
    mi mi'\trio do
    re re, r
    r re' si

    %41
    do do, r
    r do' la
    re re, re'

    %44
    sol, do, do,
    re re' re,\mbreak
    sol4 sol la

    %47
    si sol do
    sol sol'\trio la
    si sol do

    %50
    sol4 sol,8\tu(la) si[(sol)]
    do4 do' do,
    re re, fad

    %53
    sol mi' do
    re re'\trio re\mbreak
    re re, re

    %56
    sol, r r
    R2.*3

    %60
    r4 re'' do
    si  sol si\mbreak
    do do, la'

    %63
    si8 do re4 re,
    sol r r
    R2.

    %66
    r4 sol sol,
    do la' do,
    re re, re'\mbreak

    %69
    mi8 do re4 re,
    sol la8(si) do[(re)]
    mi(fad) sol[(la)] si (dod) sol,2.\fermata

}

IIbcn = \relative do {

    sol2 la4
    si sol do
    sol r r

    %4
    R2.
    r4 do'8(si) la[(sol)]
    fad4 si si,

    %7
    mi la, la'\mbreak
    re, re, fad
    sol r r

    %10
    R2.*5
    r4 la' la,\mbreak
    re re' re,

    %17
    sol sol, sol'
    la dod, la
    si8 sol la4 la

    %20
    re, r r
    r re' sol,
    re'8 re' do(si) la(sol)

    %23
    fad(mi) re(do) si(la) re4 mi8(fad) sol(la) si(la) sol(la) si(dod)
    re4 re, mi
    fad re sol

    %26
    re' r r
    R2.
    r4 re,8(mi) fad[(re)]

    %29
    sol(la16 si) do8(si) la(sol)
    fad4 si si,\mbreak   %%% fine p. 10
    mi mi,8(fad) sol[(la)]

    %32
    si4 r r
    R2.
    r4 si' la

    %35
    sol fad mi
    red si mi
    la si si,\mbreak

    %38
    mi r r
    R2.*7\mbreak
    r4 sol, la

    %47
    si sol do
    sol r r
    R2.

    %50
    r4 sol8(la) si[(sol)]
    do4 do' do,
    re re, fad

    %53
    sol mi' do
    re r r\mbreak
    R2.*5

    %60
    r4 re' do
    si  sol si\mbreak
    do do, la'

    %63
    si8 do re4 re,
    sol r r
    R2.

    %66
    r4 sol sol,
    do la' do,
    re re, re'\mbreak

    %69
    mi8 do re4 re,
    sol la8(si) do[(re)]
    mi(fad) sol[(la)] si (dod) sol,2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sol\major
    \time 3/4
    \tempo 2 = 45
    \repeat volta 2 {s2.*21}
    \alternative {{s2.*2}{s2.*2}}\break
    \set Score.currentBarNumber = #24
    \repeat volta 2 {s2.*46}
    \alternative {{ s2.*2}{s2.}}
    \bar "|."

}

IIflI = {
    \IIglobal
    %\notypeset
    <<\IIflIn \forma>>

}

IIflII = {
    \IIglobal
    <<\IIflIIn \forma>>

}

IIobI = {
    \IIglobal
    <<\IIobIn \forma>>

}

IIobII = {
    \IIglobal
    <<\IIobIIn \forma>>

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlaI = {
    \IIglobal
    <<\IIvlaIn \forma>>

}

IIvlaII = {
    \IIglobal
    \clef alto
    <<\IIvlaIIn \forma>>

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
    \typeset

}


IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIflIn = \relative do'' {

    si8 (re) sol4
    sol sol sol sol
    \grace fa8 mi2-+ do8(mi) la4

    %3
    la la la la
    \grace sol8 fad!2 re8(sol) si4
    re,8(fad) la4 re,8\p(sol) si4

    %6
    re,8(fad) la4 do,8\f(fad) la4\mbreak
    si,8(re) sol4 la, re
    si8(la) sol(la) si[(re)] sol4

    %9
    sol sol sol sol
    \grace fa8 mi2-+ do8(mi) la4
    la la la la

    %12
    \grace sol8 fad!2 re8(sol) si4
    re,8(fad) la4 re,8\p(sol) si4
    re,8(fad) la4 fad8(\f(la) re4\mbreak

    %15
    si la8 sol la4 sol8 fad
    sol2\fermata sol,8(si) re4
    re re re re

    %18
    si2 mi4 fad
    sol la si re,
    dod si8(dod) si[(dod)] mi4

    %21
    la,8(re) fad4 la,8\p (dod) mi4
    la,8(re) fad4 la,8\f(mi') sol4\mbreak
    fad4. sol8 mi4 la

    %24
    fad mi8(fad) re(fad) la4
    la la la la
    si,2 dod8(mi) sol4

    %27
    sol sol sol sol
    la,2 si8(sol) re'4
    fad,8(la) re4 sol,8\p(si) re4

    %30
    fad,8(la) re4  la8\f(mi') sol4\mbreak
    fad mi8 re mi4 re8 dod
    re2 r

    %33
    R1
    r2 re8(sol) si4
    si do8 si la4 sol

    %36
    fad8(mi) re(do)

}

IIIflIIn = \relative do'' {

    si8 (re) sol4
    sol sol sol sol
    \grace fa8 mi2-+ do8(mi) la4

    %3
    la la la la
    \grace sol8 fad!2 re8(sol) si4
    re,8(fad) la4 re,8\p(sol) si4

    %6
    re,8(fad) la4 do,8\f(fad) la4\mbreak
    si,8(re) sol4 la, re
    si8(la) sol(la) si[(re)] sol4

    %9
    sol sol sol sol
    \grace fa8 mi2-+ do8(mi) la4
    la la la la

    %12
    \grace sol8 fad!2 re8(sol) si4
    re,8(fad) la4 re,8\p(sol) si4
    re,8(fad) la4 fad8(\f(la) re4\mbreak

    %15
    si la8 sol la4 sol8 fad
    sol2\fermata sol,8(si) re4
    re re re re

    %18
    si2 mi4 fad
    sol la si re,
    dod si8(dod) si[(dod)] mi4

    %21
    la,8(re) fad4 la,8\p (dod) mi4
    la,8(re) fad4 la,8\f(mi') sol4\mbreak
    fad4. sol8 mi4 la

    %24
    fad mi8(fad) re(fad) la4
    la la la la
    si,2 dod8(mi) sol4

    %27
    sol sol sol sol
    la,2 si8(sol) re'4
    fad,8(la) re4 sol,8\p(si) re4

    %30
    fad,8(la) re4  la8\f(mi') sol4\mbreak
    fad mi8 re mi4 re8 dod
    re2 r

    %33
    R1
    r2 si8(do) re4
    re mi8(re) do4 si

    %36
    la8(sol) fad(la)

}

IIIobIn = \relative do'' {

    si8 (re) sol4
    sol sol sol sol
    \grace fa8 mi2-+ do8(mi) la4

    %3
    la la la la
    \grace sol8 fad!2 re8(sol) si4
    re,8(fad) la4 re,8\p(sol) si4

    %6
    re,8(fad) la4 do,8\f(fad) la4\mbreak
    si,8(re) sol4 la, re
    si8(la) sol(la) si[(re)] sol4

    %9
    sol sol sol sol
    \grace fa8 mi2-+ do8(mi) la4
    la la la la

    %12
    \grace sol8 fad!2 re8(sol) si4
    re,8(fad) la4 re,8\p(sol) si4
    re,8(fad) la4 fad8(\f(la) re4\mbreak

    %15
    si la8 sol la4 sol8 fad
    sol2\fermata sol,8(si) re4
    re re re re

    %18
    si2 mi4 fad
    sol la si re,
    dod si8(dod) si[(dod)] mi4

    %21
    la,8(re) fad4 la,8\p (dod) mi4
    la,8(re) fad4 la,8\f(mi') sol4\mbreak
    fad4. sol8 mi4 la

    %24
    fad mi8(fad) re(fad) la4
    la la la la
    si,2 dod8(mi) sol4

    %27
    sol sol sol sol
    la,2 si8(sol) re'4
    fad,8(la) re4 sol,8\p(si) re4

    %30
    fad,8(la) re4  la8\f(mi') sol4\mbreak
    fad mi8 re mi4 re8 dod
    re2 la8(si) do4

    %33
    do do mi do
    si2 r
    R1

    %36
    r2

}

IIIobIIn = \relative do'' {

    si8 (re) sol4
    sol sol sol sol
    \grace fa8 mi2-+ do8(mi) la4

    %3
    la la la la
    \grace sol8 fad!2 re8(sol) si4
    re,8(fad) la4 re,8\p(sol) si4

    %6
    re,8(fad) la4 do,8\f(fad) la4\mbreak
    si,8(re) sol4 la, re
    si8(la) sol(la) si[(re)] sol4

    %9
    sol sol sol sol
    \grace fa8 mi2-+ do8(mi) la4
    la la la la

    %12
    \grace sol8 fad!2 re8(sol) si4
    re,8(fad) la4 re,8\p(sol) si4
    re,8(fad) la4 fad8(\f(la) re4\mbreak

    %15
    si la8 sol la4 sol8 fad
    sol2\fermata sol,8(si) re4
    re re re re

    %18
    si2 mi4 fad
    sol la si re,
    dod si8(dod) si[(dod)] mi4

    %21
    la,8(re) fad4 la,8\p (dod) mi4
    la,8(re) fad4 la,8\f(mi') sol4\mbreak
    fad4. sol8 mi4 la

    %24
    fad mi8(fad) re(fad) la4
    la la la la
    si,2 dod8(mi) sol4

    %27
    sol sol sol sol
    la,2 si8(sol) re'4
    fad,8(la) re4 sol,8\p(si) re4

    %30
    fad,8(la) re4  la8\f(mi') sol4\mbreak
    fad mi8 re mi4 re8 dod
    fad,2 fad8(sol) la4

    %33
    la la do la
    sol2 r
    R1

    %36
    r2

}

IIIvlIn = \relative do'' {

    si8 (re) sol4
    sol sol sol sol
    \grace fa8 mi2-+ do8(mi) la4

    %3
    la la la la
    \grace sol8 fad!2 re8(sol) si4
    re,8(fad) la4 re,8\p(sol) si4

    %6
    re,8(fad) la4 do,8\f(fad) la4\mbreak
    si,8(re) sol4 la, re
    si8(la) sol(la) si[(re)] sol4

    %9
    sol sol sol sol
    \grace fa8 mi2-+ do8(mi) la4
    la la la la

    %12
    \grace sol8 fad!2 re8(sol) si4
    re,8(fad) la4 re,8\p(sol) si4
    re,8(fad) la4 fad8(\f(la) re4\mbreak

    %15
    si la8 sol la4 sol8 fad
    sol2\fermata sol,8(si) re4
    re re re re

    %18
    si2 mi4 fad
    sol la si re,
    dod si8(dod) si[(dod)] mi4

    %21
    la,8(re) fad4 la,8\p (dod) mi4
    la,8(re) fad4 la,8\f(mi') sol4\mbreak
    fad4. sol8 mi4 la

    %24
    fad mi8(fad) re(fad) la4
    la la la la
    si,2 dod8(mi) sol4

    %27
    sol sol sol sol
    la,2 si8(sol) re'4
    fad,8(la) re4 sol,8\p(si) re4

    %30
    fad,8(la) re4  la8\f(mi') sol4\mbreak
    fad mi8 re mi4 re8 dod
    re2 r

    %33
    R1*3
    r2

}

IIIvlaIn = \relative do' {

    si'4 do
    re do re si
    do2 do4 re
    mi re mi dod

    %4
    re2 si4 si
    la la si\p si
    la  la la\f fad\mbreak

    %7
    sol sol fad fad
    sol re si' do
    re do re si

    %10
    do2 do4 re
    mi re mi dod
    re2 si4 si

    %13
    la la si\p si
    la la re\f re\mbreak
    re sol, do si8 la

    %16
    si2\fermata re,4 si'
    la sol la fad
    sol2 si4 la

    %19
    si si si si
    la2 la4 la
    fad la la\p la

    %22
    fad la la\f la\mbreak
    la si la la
    la2 la4 dod

    %25
    re dod re do
    si2 dod4 re
    la la la la

    %28 OOKK
    la2 sol4 sol
    fad la\p sol sol
    fad la\f la la\mbreak

    %31
    la re, sol fad8 mi
    fad2 r
    R1*3

    %36
    r2

}

IIIvlaIIn = \relative do' {

    re4 do
    sol' sol sol sol
    sol do,8 re mi4 re
    la' la la la

    %4
    la2 sol4 sol
    fad fad sol\p sol
    fad fad fad\f re\mbreak

    %7
    re re re re
    re8(do) si(do) re4 do
    sol' sol sol sol

    %10
    sol do,8 re mi4 re
    la' la la la
    la2 sol4 sol

    %13
    fad fad sol\p sol
    fad fad la\f la\mbreak
    sol sol mi re

    %16
    re2\fermata si4 sol'
    re re re re
    re2 mi4 red

    %19
    mi mi mi mi
    mi re8(mi) dod4 dod
    re re dod\p dod

    %22
    re re mi\f dod\mbreak
    re4. mi8 dod4 dod
    re mi fad sol

    %25
    la sol la re,
    re2 sol4 fad
    mi re mi dod

    %28
    re2 re4 re
    re fad\p re re
    re fad\f mi dod\mbreak

    %31
    re re si la
    la2 r
    R1*3

    %36
    r2

}

IIIfgn =  \relative do {

    sol'4 la
    si la si sol
    do do, la' si
    do si do la

    %4
    re re, re re
    re re re\p re
    re re re\f re\mbreak

    %7
    re si8 do re4 re,
    sol2 sol'4 la
    si la si sol

    %10
    do do, la' si
    do si do la
    re re, re re

    %13
    re re re\p  re
    re re re'\f re,\mbreak
    sol mi do re

    %16
    sol,2 sol4 sol'
    fad mi fad re
    sol sol, sol' fad

    %19
    mi fad sol sold
    la2 la,4 la
    la la la\p la

    %22
    la la dod\f la\mbreak
    re sol la la,
    re2 re4 mi

    %25
    fad mi fad re
    sol fad  mi re
    dod si dod la

    %28
    fad' re sol si
    re re,\p si sol
    re re'\f dod la\mbreak

    %31
    re si' sol la
    re, re' re, re'
    re, re' re, re'

    %34
    re, re' re,\p re'
    do, do' do, do'

    %36
    re,2

}

IIIbcn = \relative do {

    sol'4 la
    si la si sol
    do do, la' si
    do si do la

    %4
    re re, re re
    re re re\p re
    re re re\f re\mbreak

    %7
    re si8 do re4 re,
    sol2 sol'4 la
    si la si sol

    %10
    do do, la' si
    do si do la
    re re, re re

    %13
    re re re\p  re
    re re re'\f re,\mbreak
    sol mi do re

    %16
    sol,2 sol4 sol'
    fad mi fad re
    sol sol, sol' fad

    %19
    mi fad sol sold
    la2 la,4 la
    la la la\p la

    %22
    la la dod\f la\mbreak
    re sol la la,
    re2 re4 mi

    %25
    fad mi fad re
    sol fad  mi re
    dod si dod la

    %28
    fad' re sol si
    re re,\p si sol
    re re'\f dod la\mbreak

    %31
    re si' sol la
    re, r r2
    R1*3

    %36
    r2

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sol\major
    \time 2/2
    \tempo 1 = 50
    \partial 2 s2
    s1*15
    s2 \bar ":..:"\break s
    s1*19
    s2 \bar ":|."
    \mark\markup\center-column\smaller {"Da""Capo"}

}

IIIflI = {
    \IIIglobal
    %\notypeset
    <<\IIIflIn \forma>>

}

IIIflII = {
    \IIIglobal
    <<\IIIflIIn \forma>>

}

IIIobI = {
    \IIIglobal
    %\notypeset
    <<\IIIobIn \forma>>

}

IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlaI = {
    \IIIglobal
    <<\IIIvlaIn \forma>>

}

IIIvlaII = {
    \IIIglobal
    \clef alto
    <<\IIIvlaIIn \forma>>

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
    \typeset

}


IVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVflIn = \relative do'' {

    r2
    R1
    r2 si'8(la) sol (la)
    si4 si si la8(sol)

    %4
    fad(mi) re4 la'2~
    la sol~
    sol fad~\mbreak

    %7
    fad4 sol8 (fad) mi(fad) mi(re)
    dod(re) mi(fad) sol(la) si(dod)
    re4. sol,8 mi4. re8

    %10
    re2 r  re la'8(sol ) fad(sol)
    la4 re la si8(la)

    %12
    sol4 fad r2\mbreak
    R1
    r2 si8(re) do(si)

    %15
    do(si) do(re) do(mi) re(do)
    si(la) si(do) si(re) do(si)
    la(sol) la(si) la (do) si(la)

    %18
    sol8(fad) mi(fad) sol(la) si(do)\mbreak
    si4 si si si
    si8(la) sol[(la)] fad(sol) la[(fad)]

    %21
    sol4. la8 fad2-+
    mi2 r
    R1

    %24
    r4 re8(mi) fad(sol) la[(si)]
    do4 si la8(si) sol4\mbreak
    fad8(sol) la4 r2

    %27
    R1
    r2 si8(la) sol(la)
    si4 si si la8(sol)

    %30
    fad(mi) re4 sol2~
    sol la~\mbreak
    la si~

    %33
    si do~
    do re4 re
    re re do8(si) la[(sol)]

    %36
    fad(sol) la[(si)] do(la) re4\mbreak
    si4. la8 la4. sol8
    sol2

}

IVflIIn = \relative do'' {

    r2
    R1
    r2 re8(do) si(do)
    re4 re re do8(si)

    %4
    la(sol) fad4 fad'2~
    fad mi~
    mi re4. dod8\mbreak

    %7
    si4 sol'8 (fad) mi(fad) mi(re)
    dod(re) mi(fad) sol(la) si(dod)
    re4. sol,8 mi4. re8

    %10
    re2 r re2 fad8(mi) re(mi)
    fad4 fad fad sol8(fad)
    mi4 re r2\mbreak

    %13
    R1
    r2 mi4 mi
    mi mi fad fad8(mi)

    %16
    re4 re mi mi8(re)
    do4 do red si~
    si8(la) sol(la) si4 si'\mbreak

    %19
    si si si si
    si8(la) sol[(la)] fad(sol) la[(fad)]

    %21
    sol4. la8 fad2-+
    mi2 r
    R1

    %24
    r4 re8(dod) re(mi) fad[(sol)]
    la4 sol8(fad) mi4 mi\mbreak
    re8(mi) fad4 r2

    %27
    R1
    r2 re8(do) si(do)
    re4 re re do8(si)

    %30
    la(sol) fad4 re'2~
    re8 si do(re) mi2~\mbreak
    mi8 dod re(mi) fad2~

    %33
    fad8 red mi(fad) sol2~
    sol8 mi fad(sol) la(fad) sol(la)
    si (do) re4 do8(si) la[(sol)]

    %36
    fad(sol) la[(si)] do(la) re4\mbreak
    si4. la8 la4. sol8
    sol2

}

IVobIn = \relative do'' {

    re8(do) si(do)
    re4 sol re mi8(re)
    do4 si r2

    %3
    R1
    r2 re8(mi) fad(re)
    si(dod) re(si) dod(re) mi(dod)

    %6
    la(si) dod(la) si(dod) re(dod)\mbreak
    si(la) sol[(la)] si(la) si[(sold)]
    la(si) dod[(re)] mi(fad) sol[(mi)]

    %9
    re4. mi8 dod4. re8
    re2 re8(do) si(do) re2 r
    R1

    %12
    r2 sol8(la) si(la)\mbreak
    sol(fad) mi(red) mi(sol) fad(mi)
    red(dod) si4 si'2~

    %15
    si la~
    la sol~
    sol fad~

    %18
    fad mi8(fad) sol4\mbreak
    fad4 mi fad sol8(la)
    sol(fad) mi(fad) red(mi) fad(red)

    %21
    mi4. fad8 red2-+
    mi sol4 sol
    sol fad8(sol) mi4 la

    %24
    \appoggiatura sol8 fad4 \appoggiatura mi8 re4 r2
    R1\mbreak
    r2 re8(do) si(do)

    %27
    re4 sol re mi8(re)
    do4 si r2
    R1

    %30
    r2 re8(fa) mi(re)
    mi(re) do(re) mi(sol) fad!(mi)\mbreak
    fad(mi) re(mi) fad(la) sol(fad)

    %33
    sol(fad) mi(fad) sol(si) la(sol)
    la(sol) fad(sol) la(si) sol(la)
    si(la) sol(fad) mi4 mi

    %36
    re8(mi) fad(sol) la(fad) mi(fad)\mbreak
    sol4. la8 fad4. sol8
    sol2

}

IVobIIn = \relative do'' {

    si8(la) sol(la)
    si4 si si do8(si)
    la4 sol r2
    R1

    %4
    r2 la4 la
    si si sol sol
    la la fad fad\mbreak

    %7
    sol si mi, mi
    mi la r la
    la si la la

    %10
    fad2 si8(la) sol(la) fad2 r
    R1
    r2 re'4 re\mbreak

    %13
    sol, la si do
    fad,8(mi) red4 sol'2~
    sol fad~

    %16
    fad mi~
    mi red
    mi4 si si sol8 (la)\mbreak

    %19
    si4 si si red
    mi  do!4 si si
    si4. do8 si2

    %22
    sol si4 si
    mi re8(mi) dod4 dod
    re fad, r2

    %25
    R1
    r2 si8(la) sol(la)
    si4 si si do8(si)

    %28
    la4 sol r2
    R1
    r2 sol4 si

    %31
    do sol r do\mbreak
    re la r re
    mi si r mi

    %34
    la, re r fad
    sol re sol, la
    la re r re\mbreak

    %37
    re mi re re
    si2

}

IVfgn =  \relative do {

    sol4 sol'
    sol, sol' sol, sol'
    fad sol sol,\p sol'
    sol, sol' do, do'

    %4
    re, re' fad,\f re'
    sol,, sol' mi dod'
    fad,, fad' re si'8(la)

    %7
    sol(fad) mi[(fad)] sol(fad) sol[(mi)]
    la4 la, r sol'
    fad sol la la,

    %10
    re8(do) si(la) sol4 sol' re8(do) si(la) re4 re,
    re' re' re, re'
    dod re si sol8(fad)\mbreak

    %13
    mi4 fad sol la
    si la sol mi'
    la, do re, re'

    %16
    sol, si do, do'
    fad, la si, si'
    mi, mi' mi, mi'\mbreak

    %19
    red dod red si
    mi sol, si si,
    mi la, si si

    %22
    mi,2 mi''4 re
    dod re la la,
    re re' re, re'

    %25
    fad, sol do, do'\mbreak
    re re, sol, sol'
    sol, sol' sol, sol'

    %28
    fad sol sol, sol'
    sol, sol' do, do'
    re, re' si sol

    %31
    do, mi do la\mbreak
    re fad re si
    mi sol mi do

    %34
    fad la fad re
    sol, si do do'
    re re, r re'\mbreak

    %37
    sol ,do re re,
    sol2

}

forma = {

    \key sol\major
    \time 2/2
    \tempo 1 = 50
    \partial 2 s2
    \repeat volta 2 {
    s1*9}
    \alternative {{s1}{ s2\bar ".|:"}} s2
    \set Score.currentBarNumber = #11
    s1*27
    s2 \bar ":|."

}

IVflI = {
    \IVglobal
    %\notypeset
    <<\IVflIn \forma>>

}

IVflII = {
    \IVglobal
    <<\IVflIIn \forma>>

}

IVobI = {
    \IVglobal
    %\notypeset
    <<\IVobIn \forma>>

}

IVobII = {
    \IVglobal
    <<\IVobIIn \forma>>

}

IVfg = {
    \IVglobal
    \clef bass
    <<\IVfgn \forma>>
    \typeset

}


Vglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VflIn = \relative do'' {

    re4
    sol2.~
    sol
    sol4 la sol

    %4
    sol(fad) fad
    sol,8(la16 si) si8(do16 re) re8(mi16 fa)
    mi4 sol2\mbreak

    %7
    la,8(si16 dod) dod8(re16 mi) mi8(fad?16 sol)
    fad4 la2
    si8(la) sol[(fa)] mi(re)

    %10
    mi(re) do[(si)] la(sol)
    fad'8(sol16 la) sol8(fad?) sol(mi)
    fad(sol16 la) sol8(fad) sol(la)

    %13
    si2.~\mbreak
    si4 la8(sol) la4
    do,4. fad8 sol4~

    %16
    sol8 mi fad4. sol8
    sol4 si8(la16 sol) la8(sol16 fad)
    sol8(la16 si) si8(la16 sol) la8(sol16 fad)

    %19
    sol8 mi fad4. sol8\mbreak  %% fine p. 18
    sol sol, re'(do16 si) do8(si16 la)
    si4 r r

    %22
    R2.*2
    r8 sol' fad(sol16 la) re,8(mi16 fad)
    sol8(re) si[(sol)] r sol'

    %26
    mi(re) do[(si)] do4\mbreak
    la'8(mi) dod[(la)] r la'
    la8(sol) fad[(mi)] re(do!)

    %29
    si4 si'4.(dod16 re)
    dod4. la8 re4~
    re8 si dod4. re8

    %32
    re2 r4
    R2.\mbreak
    re,~

    %35
    re~
    re4 la'2~
    la8 sol mi4. re8

    %38
    re re' la(sol16 fad) sol8(fad16 mi)
    fad8 dod' re[(dod)] re(dod)
    re(dod?) re[(dod)] re(dod)\mbreak

    %41
    re(dod?) mi(re) mi(re)
    re(si) dod4 r
    re,8(mi16 fad) fad8[(sol16 la)] la8 (si16 do!)

    %44
    si4 re2
    mi,8(fad16 sold) sold8(la16 si) si8(dod16 re)
    dod,8(re16 mi) mi8(fad16 sol?) fad8 (mi)\mbreak

    %47
    la2.~
    la4 sol8(fad) sol4
    sol4. la8 fad4~

    %50
    fad8 sol mi4. re8
    re2 r4
    sol,4 sol'2~

    %53
    sol8 fa mi[(re)] do(si)\mbreak
    la(sol') fad![(mi)] re(do)
    si4 sol'2

    %56
    la4. fad8 sol4~
    sol8 mi fad4. sol8
    sol sol, re'(mi16 fa) mi8(re16 do)

    %59
    re8 sol re(mi16 fa) mi8(re16 do)\mbreak
    re4 sol2~
    sol2.

    %62
    la~
    la
    si4 re,2~\mbreak

    %65
    re4 mi8(re) do[(si)]
    fad'(sol16 la) sol8(fad?) sol[(mi)]
    fad(sol16 la) sol8(fad) sol(la)

    %68
    si2.~
    si4 la8(sol) la4
    do,4. fad8 sol4~

    %71
    sol8 mi fad4. sol8
    sol2.\fermata

}

VflIIn = \relative do'' {

    re4
    si2.~
    si
    si4 do si
    si(la) la
    sol'2.~
    sol\mbreak
    la~
    la
    si~
    si4 mi, mi8(fad16 sol)
    re2.~
    re
    sol,4 si' sol\mbreak
    mi2 mi4
    fad4. re8 sol4~
    sol8 mi fad4. sol8
    sol4 re8(do16 si) do8(si16 la)
    si8(do16 re) re8(do16  si) do8(si16 la)
    si8 la la4. sol8\mbreak
    sol sol si (la16 sol) la8(sol16 fad)
    sol4 r r
    R2.*12
    re'2.~
    re~
    re4 la'2~
    la8 sol mi4. re8
    re re fad(mi16 re) mi8(re16 dod)
    re4 r r
    R2.*18
    r8 sol, si8(do16 re) do8(si16 la)
    si8 (la16 sol) si8(do16 re) do8(si16 la)\mbreak
    si4 sol' sol
    sol8(fa) mi[(re)] do(si)
    la4 la' la
    la8(sol) fad?[(mi) ]re(do)
    si4 sol'2~\mbreak
    sol4 mi4.(fad16 sol)
    re2.~
    re
    sol,4 si' sol
    mi2 mi4
    fad4. re8 sol4~
    sol8 mi fad4. sol8
    sol2.\fermata

}

VobIn = \relative do'' {

    r4
    R2.*19
    r4 r re
    sol(si,) si

    %22
    sol'(si,) si
    mi8(re) do4 si
    si(la) r

    %25
    sol sol' sol
    sol8(fa) mi[(re)] do(si)\mbreak
    la4 la'2

    %28
    \grace sol8 fad!4 r r
    si, mi sol
    sol4. la8 fad4~

    %31
    fad8 sol mi4. re8
    re(mi16 fad) mi8(re) mi(dod)
    re(mi16 fad) mi8(re) mi(dod)\mbreak

    %34
    re2.~
    re~
    re4 r r

    %37
    R2.
    r4 r la
    re(fad,) fad

    %40
    re'(fad,) fad\mbreak
    si8(la) sol4 fad
    fad(mi) r

    %43
    re re' re
    re8(do) si[(la)] sol(fad)
    mi4 mi'2

    %46
    dod4 r r\mbreak
    re la do!
    si2 mi4

    %49
    dod4. la8 re4~
    re8 si dod4. re8
    re2 r4

    %52
    sol,8(la16 si) si8[(do?16 re)] re8(mi16 fa)
    mi2 \afterGrace mi4 ({fad!16[sol)]}\mbreak
    fad8(mi) re[(do)] si(la)

    %55
    sol4 r do
    do4. re8 si4~
    si8 do la4. sol8

    %58
    sol2 r4
    R2.*14

}

VvlIn = \relative do'' {

    re4_\markup\italic"Sordini"
    sol(si,) si
    sol'(si,) si
    mi8(re) do4 si

    %4
    si(la) r
    r sol' sol
    sol8(fa) mi[(re)] do(si)\mbreak

    %7
    la4 la' la
    la8(sol) fad![(mi)] re(do)
    si4 re2~

    %10
    re4 mi8[(re)] do(si)
    la(si16 do) si8(la) si(sol)
    la(si16 do) si8(la) si(do)

    %13
    re2.~\mbreak
    re4 do8(si) do4
    do4. re8 si4~

    %16
    si8 do la4. sol8
    sol4 r r
    r r r8 fad'

    %19
    sol mi fad4. sol8\mbreak
    sol2 r4
    r8 fad_\markup\italic"Violino I Solo"sol(fad) sol(fad)

    %22
    sol(fad) sol(fad) sol(fad)
    sol(fad) la(sol) la(sol)
    sol(mi) fad4 r

    %25
    sol,8(la16 si) si8(do16 re) re8(mi16 fa)
    mi4 sol2\mbreak
    la,8(si16 dod) dod8(re16 mi) mi8(fad?16 sol)

    %28
    fad4 la2
    si8(la) sol[(fad)] mi(re)
    R2.*2

    %32
    fad8\tu (sol16 la) sol8(fad) sol(mi)
    fad (sol16 la) sol8(fad) sol(mi)\mbreak
    fad(sol) la[(fad)] sol(mi)

    %35
    fad(sol) la[(fad)] sol(mi)
    fad(sol) fad[(mi)] re(do!)
    si mi dod4. re8

    %38
    re4 r r
    R2.*3
    r8 re\solo dod(re16 mi) la,8(si16 dod)

    %43
    re8(la) fad[(re)] r re'
    si8(la) sol[(fad)] sol4
    mi'8(si) sold[(mi)] r mi'

    %46
    mi(dod) dod[(la)] la(si16 dod)\mbreak
    re,4 fad'2~
    fad4 mi8(re) mi4

    %49
    mi4. dod8 re4~
    re8 mi dod4. re8
    re(mi16 fad) fad8(sol16 la) la8(si16 do!)

    %52
    si4 re2~
    re4 do8(si) la[(sol)]\mbreak
    fad2 r4

    %55
    sol8(fad) mi[(re)] do(si)
    la4. re8 si4~
    si8 do la4. sol8

    %58
    sol2 r4
    R2.
    sol8\tu(la16 si) si8(do16 re) re8(mi16 fa)

    %61
    mi4 sol2
    la,8(si16 dod) dod8(re16 mi) mi8(fad?16 sol)
    fad4 la2

    %64
    si8(la) sol[(fa)] mi(re)\mbreak
    mi(re) do[(si)] la(sol)
    la(si16 do) si8(la) si(sol)

    %67
    la(si16 do) si8(la) si(do)
    re2.~
    re4 do8(si) do4

    %70
    do4. re8 si4~
    si8 do la4. sol8
    sol2.\fermata

}

VvlaIn = \relative do' {

    r4
    re2_\markup\italic"Sordini" re4
    sol2 fad4
    mi2 mi4

    %4
    re2 re4
    r re sol
    sol r r\mbreak

    %7
    r mi la
    la r r
    re, sol2

    %10
    sol4 la, la'
    la re, re
    re re mi

    %13
    sol2.~\mbreak
    sol4 mi do'
    fad, la sol

    %16
    la la re,
    re r r
    r r r8 re

    %19
    re mi re4 re\mbreak
    si2 r4
    R2.*11

    %32
    la'2.~
    la\mbreak
    la8(si) do![(la)] si(sol)

    %35
    la(si) do[(la)] si(sol)
    la4 re, re
    re8 si' la4 la

    %38
    fad r r
    R2.*21
    sol4 re sol

    %61
    sol do, r
    la' mi la
    la re, r

    %64
    re sol2~\mbreak
    sol4 la, la'
    la re, re

    %67
    re re mi
    sol2.~
    sol4 mi do'

    %70
    fad, la sol
    la, la4. si8
    si2.\fermata

}

Vbcn = \relative do {

    r4
    sol'2\p fad4
    mi2 re4
    do la do

    %4
    re2 do4
    si sol si
    do2 mi4\mbreak

    %7
    dod la dod
    re2 fad4
    sol si, sol

    %10
    do2 do4
    re re re
    re re do

    %13
    si sol si\mbreak
    do2 la4
    re, re' mi

    %16
    do re re,
    sol r re'^\markup\italic "Bassone"
    sol r re\tu

    %19
    si8 do re4 re,\mbreak
    sol2 r4
    sol'2 fad4

    %22
    mi2 re4
    do2 la4
    re2 do4

    %25
    si sol si
    do2 mi4\mbreak
    dod la dod

    %28
    re2 fad4
    sol2 sol,4
    la la' si

    %31
    sol la la,
    re r  la'
    re r la\mbreak

    %34
    re, r r
    R2.
    r4 re fad

    %37
    sol8 mi la4 la,
    re r r
    re'2 dod4

    %40
    si2 la4\mbreak
    sol2 sol,4
    la2 sol'4

    %43
    fad re fad
    sol2 si4
    sold mi sold

    %46
    la la, sol'!\mbreak
    fad2 re4
    sol2 mi4

    %49
    la la, si
    sol' la la,
    re re' fad,

    %52
    sol2 si,4
    do2 do4\mbreak
    re2 re4

    %55
    mi2 mi4
    fad re sol
    do, re re,

    %58
    sol r sol
    sol r sol\mbreak
    sol2 si4

    %61
    do2 mi4
    dod la dod
    re2 fad4

    %64
    sol si, sol\mbreak
    do2 do4
    re re re

    %67
    re re do
    si sol si
    do2 la4

    %70
    re, re' mi
    do re re,
    sol2.\fermata

}

forma = {

    \key sol\major
    \time 3/4
    \tempo 2 = 45
    \partial 4 s4
    s2.*72
    \bar "|."

}

VflI = {
    \Vglobal
    %\notypeset
    <<\VflIn \forma>>

}

VflII = {
    \Vglobal
    <<\VflIIn \forma>>

}

VobI = {
    \Vglobal
    %\notypeset
    <<\VobIn \forma>>

}

VvlI = {
    \Vglobal
    <<\VvlIn \forma>>

}

VvlaI = {
    \Vglobal
    \clef alto
    <<\VvlaIn \forma>>

}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma >>
    \typeset

}


VIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIflIn = \relative do'' {

    sol'4
    si,2 mi
    re4 mi8 fad sol4 fad8 mi
    re4 do8 si do4 si8 la

    %4
    si4 la8 si sol4 si'
    la2 fad
    sol4 si8 la sol4 fad

    %7
    mi re8 dod re4 mi
    dod la8(si) dod(re) mi(fad)\mbreak
    sol4.(la16 si) mi,4.(fad16 sol)

    %10
    fad4.(sol16 la) dod,4.(re16 mi)
    re4 mi la, dod
    re2. sol4 re2. re'4

    %13
    la2 si
    fad4 sol8 la si4 la8 sol
    la4 sol8 fad sol4 fad8 mi

    %16
    fad4 mi8 fad re4 fad
    sol2 red\mbreak
    mi4 red8(dod) si(dod) red(mi)

    %19
    fad4 sol la sol8 fad
    sol4 si8(la) sol(fad) mi(re)
    do!4.(re16 mi) red4.(mi16  fad)

    %22
    mi4.(fad16 sol) fad4.(sol16 la)
    sol4.(la16 si) si,4 red
    mi2 r

    %25
    R1*3
    r2 r4 la8 si
    do4 do do do

    %30
    si4.(do16 re) la4.(si16 do)
    si4.(do16 re) do8(si) la(sol)
    fad4 fad8 sol la4 sol
    si,2 mi\mbreak

    %34
    re4 mi8 fad sol4 fad8 mi
    re4 do8 si do4 si8 la
    si4 la8 si sol4 sol'

    %37
    fa2 sol
    mi4 re8 mi do4 re
    mi fad! sol la

    %40
    fad la8(sol) fad(mi) re(do)
    si4.(do16 re) do4.(re16 mi)
    re4.(mi16 fa) mi4.(fad16 sol)

    %43
    fad4 sol la, fad'
    sol2. re'4 sol,1\fermata

}

VIflIIn = \relative do'' {

    sol'4
    si,2 mi
    re4 mi8 fad sol4 fad8 mi
    re4 do8 si do4 si8 la

    %4
    si4 la8 si sol4 si'
    la2 fad
    sol4 si8 la sol4 fad

    %7
    mi re8 dod re4 mi
    dod la8(si) dod(re) mi(fad)\mbreak
    sol4.(la16 si) mi,4.(fad16 sol)

    %10
    fad4.(sol16 la) dod,4.(re16 mi)
    re4 mi la, dod
    re2. sol4 re2. re'4

    %13
    la2 si
    fad4 sol8 la si4 la8 sol
    la4 sol8 fad sol4 fad8 mi

    %16
    fad4 mi8 fad re4 fad
    sol2 red\mbreak
    mi4 red8(dod) si(dod) red(mi)

    %19
    fad4 sol la sol8 fad
    sol4 si8(la) sol(fad) mi(re)
    do!4.(re16 mi) red4.(mi16  fad)

    %22
    mi4.(fad16 sol) fad4.(sol16 la)
    sol4.(la16 si) si,4 red
    mi2 r

    %25
    R1*3
    r2 r4 fad8 sol
    la4 la la la

    %30
    sol sol fad4.(sol16 la)
    sol4.(la16 si) sol4 mi
    re4 re8 mi fad4 sol
    si,2 mi\mbreak

    %34
    re4 mi8 fad sol4 fad8 mi
    re4 do8 si do4 si8 la
    si4 la8 si sol4 sol'

    %37
    fa2 sol
    mi4 re8 mi do4 re
    mi fad! sol la

    %40
    fad la8(sol) fad(mi) re(do)
    si4.(do16 re) do4.(re16 mi)
    re4.(mi16 fa) mi4.(fad16 sol)

    %43
    fad4 sol la, fad'
    sol2. re'4 sol,1\fermata

}

VIobIn = \relative do'' {

    sol'4
    si,2 mi
    re4 mi8 fad sol4 fad8 mi
    re4 do8 si do4 si8 la

    %4
    si4 la8 si sol4 si'
    la2 fad
    sol4 si8 la sol4 fad

    %7
    mi re8 dod re4 mi
    dod la8(si) dod(re) mi(fad)\mbreak
    sol4.(la16 si) mi,4.(fad16 sol)

    %10
    fad4.(sol16 la) dod,4.(re16 mi)
    re4 mi la, dod
    re2. sol4 re2. re'4

    %13
    la2 si
    fad4 sol8 la si4 la8 sol
    la4 sol8 fad sol4 fad8 mi

    %16
    fad4 mi8 fad re4 fad
    sol2 red\mbreak
    mi4 red8(dod) si(dod) red(mi)

    %19
    fad4 sol la sol8 fad
    sol4 si8(la) sol(fad) mi(re)
    do!4.(re16 mi) red4.(mi16  fad)

    %22
    mi4.(fad16 sol) fad4.(sol16 la)
    sol4.(la16 si) si,4 red
    mi2. mi8 fad
    sol4 sol sol sol\mbreak
    fad4.(sol16 la) mi4.(fad16 sol)
    fad4.(sol16 la) mi4.(fad16 sol)
    fad4 mi8 fad re4 r
    R1*3
    r2 r4 sol
    si,2 mi

    %34
    re4 mi8 fad sol4 fad8 mi
    re4 do8 si do4 si8 la
    si4 la8 si sol4 sol'

    %37
    fa2 sol
    mi4 re8 mi do4 re
    mi fad! sol la

    %40
    fad la8(sol) fad(mi) re(do)
    si4.(do16 re) do4.(re16 mi)
    re4.(mi16 fa) mi4.(fad16 sol)

    %43
    fad4 sol la, fad'
    sol2. re'4 sol,1\fermata

}

VIobIIn = \relative do'' {

    si4
    sol2 sol
    sol2. do4
    sol sol sol fad

    %4
    sol2. sol4
    la2 si
    si2. si4

    %7
    si la la si
    la2 r4 dod8(re)\mbreak
    dod4 dod mi dod

    %10
    re re dod dod
    la si la la
    fad2. si4 fad2. re'4

    %13
    re2 re
    re2. re4
    re re re dod

    %16
    re2. si4
    si2 si\mbreak
    si4 la8(sol) fad4 si

    %19
    si si la si
    si2. si4
    la la la si

    %22
    si si si si
    si si si si
    si2. sol8 la

    %25
    si4 si mi dod\mbreak
    re re dod4.(re16 mi)
    re4 re dod4.(re16 mi)

    %28
    re4 dod re r
    R1*3
    r2 r4 si
    sol2 sol\mbreak

    %34
    sol2. do4
    sol sol sol fad
    sol2. si4

    %37
    do2 sol
    sol4 fa8 sol mi4  sol
    sol4 do si la

    %40
    la fad?8(sol) la(sol) fad(la)
    sol4 sol sol sol
    sol re' do do

    %43
    do si la la
    si2.  re4 si1\fermata

}

VIvlIn = \relative do'' {

    sol'4
    si,2 mi
    re4 mi8 fad sol4 fad8 mi
    re4 do8 si do4 si8 la

    %4
    si4 la8 si sol4 si'
    la2 fad
    sol4 si8 la sol4 fad

    %7
    mi re8 dod re4 mi
    dod la8(si) dod(re) mi(fad)\mbreak
    sol4.(la16 si) mi,4.(fad16 sol)

    %10
    fad4.(sol16 la) dod,4.(re16 mi)
    re4 mi la, dod
    re2. sol4 re2. re'4

    %13
    la2 si
    fad4 sol8 la si4 la8 sol
    la4 sol8 fad sol4 fad8 mi

    %16
    fad4 mi8 fad re4 fad
    sol2 red\mbreak
    mi4 red8(dod) si(dod) red(mi)

    %19
    fad4 sol la sol8 fad
    sol4 si8(la) sol(fad) mi(re)
    do!4.(re16 mi) red4.(mi16  fad)

    %22
    mi4.(fad16 sol) fad4.(sol16 la)
    sol4.(la16 si) si,4 red
    mi2 r

    %25
    R1*7
    r2 r4 sol
    si,2 mi\mbreak

    %34
    re4 mi8 fad sol4 fad8 mi
    re4 do8 si do4 si8 la
    si4 la8 si sol4 sol'

    %37
    fa2 sol
    mi4 re8 mi do4 re
    mi fad! sol la

    %40
    fad la8(sol) fad(mi) re(do)
    si4.(do16 re) do4.(re16 mi)
    re4.(mi16 fa) mi4.(fad16 sol)

    %43
    fad4 sol la, fad'
    sol2. re'4 sol,1\fermata

}

VIvlaIn = \relative do' {

    si'4
    sol2 sol
    sol2. do4
    sol sol sol fad

    %4
    sol2. sol4
    la2 si
    si2. si4

    %7
    si la la si
    la2 r4 dod8(re)\mbreak
    dod4 dod mi dod

    %10
    re re dod dod
    la si la la
    la2. si4 la2. re4

    %13
    re2 re
    re2. re4
    re re re dod

    %16
    re2. si4
    si2 si\mbreak
    si4 la8(sol) fad4 si

    %19
    si si la si
    si2. si4
    la la la si

    %22
    si si si si
    si si si si
    si2 r

    %25
    R1*7
    r2 r4 sol
    mi2 mi\mbreak

    %34
    sol2. do4
    sol sol sol fad
    sol2. si4

    %37
    do2 sol
    sol4 fa8 sol mi4  sol
    sol4 do si la

    %40
    la fad?8(sol) la(sol) fad(la)
    sol4 sol sol sol
    sol re' do do

    %43
    do si la la
    si2.  re4 si1\fermata

}

VIvlaIIn = \relative do' {

    re4
    re2 do
    sol'2. do,4
    re mi mi re

    %4
    re do8 re si4 re
    re2 re
    mi2. red4

    %7
    mi mi fad mi
    mi dod8(re) mi(fad) sol(fad)\mbreak
    mi4 mi la la

    %10
    la la sol sol
    fad mi dod mi
    fad2. re4 fad2. fad4

    %13
    fad2 sol
    la4 sol8 fad sol4 la8 si
    la4 si si la

    %16
    la sol8 la fad4 fad
    mi2 fad\mbreak
    mi4 fad8(sol) si,4 fad'

    %19
    fad mi mi red
    mi2. mi4
    mi do fad fad

    %22
    sol sol si red,
    mi mi red fad
    sol2 r

    %25
    R1*7
    r2 r4 re
    re2 do\mbreak

    %34
    sol'2. do,4
    re mi mi re
    re do8 re si4 re

    %37
    do2 re
    do2. si4
    do do re mi

    %40
    re2. re4
    re re mi mi
    sol si sol la

    %43
    la sol mi re
    re2. fad4 re1\fermata

}

VIbcn = \relative do {

    sol4
    sol'2 do,
    si2. la4
    si mi la, re

    %4
    sol,2. sol'4
    fad2 si
    mi,2. si'8 la

    %7
    sol4 la fad sol
    la2 r4 la,\mbreak
    la' la dod, la

    %10
    re re mi mi
    fad sol la la,
    re4 re8(do) si[(la)] sol4 re'4 la re, re'

    %13
    re'2 sol,
    re2. sol4
    fad si mi, la

    %16
    re,2. red4
    mi2 si'\mbreak
    sol4 fad8(mi) red(dod) si(dod)

    %19
    red4 mi fad si
    mi,2. sold,4
    la la' fad si

    %22
    sol mi red si
    mi sol si si,
    mi si mi, r

    %25
    r mi''^\markup\italic "Bassone" dod la\mbreak
    re fad, la la,
    re fad la la,

    %28
    re la re, r
    r re'' fad, re
    sol si re re,

    %31
    sol, sol' mi do
    re la re, sol\tu
    sol'2 do,\mbreak

    %34
    si2. la4
    si mi la, re
    sol,2. sol'4

    %37
    la2 si
    do2. sol4
    do la si do

    %40
    re2. re,4
    sol sol mi mi
    si sol do la

    %43
    re mi do re
    sol re sol, re' sol,1\fermata

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sol\major
    \time 2/2
    \tempo 1 = 55
    \partial 4 s4
    \repeat volta 2 {s1*11}
    \alternative {{s1}{s}}\break
    \set Score.currentBarNumber = #13
    \repeat volta 2 {s1*31}
    \alternative {{s1}{s}}
    \bar"|."

}

VIflI = {
    \VIglobal
    %\notypeset
    <<\VIflIn \forma>>

}

VIflII = {
    \VIglobal
    <<\VIflIIn \forma>>

}

VIobI = {
    \VIglobal
    %\notypeset
    <<\VIobIn \forma>>

}

VIobII = {
    \VIglobal
    <<\VIobIIn \forma>>

}

VIvlI = {
    \VIglobal
    <<\VIvlIn \forma>>

}

VIvlaI = {
    \VIglobal
    <<\VIvlaIn \forma>>

}

VIvlaII = {
    \VIglobal
    \clef alto
    <<\VIvlaIIn \forma>>

}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset

}


VIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIIflIn = \relative do'' {

    r4
    R1
    r2 r4 si'
    la do8 si la4 sol

    %4
    fad mi8 fad re4 re'
    si2. si4
    la fad8 sol la4 re\p

    %7
    si2. si4
    la fad8 sol la4 do\f
    si si8 la sol4 fa

    %10
    mi fad!8 sol la4 sol
    fad4. sol8 sol4.-+(fad16 sol)
    la8 si la sol fad mi re do

    %13
    si4 sol r2
    r r4 si'
    la do8 si la4 sol

    %16
    fad mi8 fad re4 re'
    si2. si4
    la fad8 sol la4 re\p\mbreak

    %19
    si2. si4
    la fad8 sol la4 do\f
    si si8 la sol4 sol8 fa

    %22
    mi4 fad!8 sol la4 sol
    fad re' re, fad
    sol2. r4 sol2.\fermata si4

    %25
    sol sol sol sol
    sol fad8 mi fad4 r
    R1

    %28
    r2 r4 mi\mbreak
    do' mi, sold mi
    la4.(si16 do) si4.(do16 re)

    %31
    do4\parenthesize \p mi, sold mi
    la4.(si16 do) si4.(do16 re)
    do4\f la8 sol fad4 sol8 la

    %34
    si4 la8 sol fad4 mi
    red mi si red
    mi2 r

    %37
    R1\mbreak
    r2 r4 re
    do' si8 do re4 do

    %40
    si la8 sol la4 si

}

VIIflIIn = \relative do'' {

    r4
    R1
    r2 r4 re
    mi mi8 re mi 4 dod

    %4
    re dod re fad
    sol2. sol4
    fad re8 mi fad4 fad\p

    %7
    sol2. sol4
    fad re8 mi fad4 fad\f\mbreak
    sol4 sol8 fad sol4 re

    %10
    mi2. mi4
    re re8 mi re4 re
    re fad8 mi re do si la

    %13
    sol4 sol r2
    r r4 re'
    mi mi8 re mi4 dod

    %16
    re dod re fad
    sol2. sol4
    fad re8 mi fad4 fad\p \mbreak

    %19
    sol2. sol4
    fad re8 mi fad4 fad\f
    sol sol8 fad sol4 re

    %22
    mi2. mi4
    re re8 mi la,4 re
    si2. r4 si2.\fermata sol'4

    %25
    mi mi mi mi
    mi red8 dod red4 r
    R1

    %28
    r2 r4 mi\mbreak
    mi do? re si
    mi la sold4.(la16 si)

    %31
    mi,4\p do re si
    mi la sold4.(la16 si)
    mi,4\f  mi re re

    %34
    re sol, do do
    si si8(la) sol(la) fad4
    sol2 r

    %37
    R1\mbreak
    r2 r4 fad'
    sol sol la fad

    %40
    sol fad8 mi fad4 sol

}

VIIobIn = \relative do'' {

    re4
    re si8 do re4 sol
    re si8 do re4 r

    %3
    R1
    r2 r4 fad
    si, do re mi

    %6
    fad2. fad4\p
    si, do re mi
    fad2. fad4\f

    %9
    sol si8 la sol4 fa
    mi fad!8 sol la4 sol
    fad4. sol8 sol4.-+(fad16 sol)

    %12
    la4 re, r re
    re si8 do re4 sol
    re si8 do re4 r

    %15
    R1
    r2 r4 fad
    si, do re mi

    %18
    fad2. fad4\p\mbreak
    si, do re mi
    fad2. fad4\f

    %21
    sol si8 la sol4 fa
    mi fad!8 sol la4 sol
    fad sol re fad

    %24
    sol2. re4 sol2. r4
    R1
    r2 r4 si,

    %27
    la' la la la
    la sol8 fad sol4 mi\mbreak
    mi1~

    %30
    mi~
    mi~\p
    mi2. mi4\f

    %33
    do' la8 sol fad4 sol8 la
    si4 la8 sol fad4 mi
    red mi si red

    %36
    mi2. si4
    sol' sol sol si\mbreak
    sol fad8 mi fad4 r

    %39
    R1*2

}

VIIobIIn = \relative do'' {

    si4
    si sol8 la si4 si
    si sol8 la si4 r
    R1

    %4
     r2 r4 la
     sol la si do
     re2. la4\p

     %7
     sol la si do
     re2. re4\f \mbreak
     re si8 do re4 si

     %10
     sol la8 si do4 si
     la4. si8 si4.-+(la16 si)
     fad4 fad r la

     %13
     si sol8 la si4 re
     si sol8 la si4 r
     R1

     %16
     r2 r4 la
     sol la si do
     re2. la4\p \mbreak

     %19
     sol la si do
     re2. re4\f
     re si8 do re4 si

     %22
     sol la8 si do4 si
     la si fad la
     si2. si4 si2.\fermata r4

     %25
     R1
     r2 r4 red
     fad fad fad fad

     %28
     fad mi8 red mi4 mi\mbreak
     mi1~
     mi~

     %31
     mi\p~
     mi2. mi4\f
     mi do8 si la4 sol8 fad

     %34
     sol4 la8 si do4 la
     fad mi8 (fad) sol(la)fad4
     sol2. sol4

     %37
     si si dod si\mbreak
     la8(mi') re(dod) re4 r
     R1*2

}

VIIfgn =  \relative do {

    sol'4
    sol,2. sol'4
    sol,2. sol'4
    do la8 si do4 la

    %4
    re la re, re'
    re, re' r re
    re, re' r re\p

    %7
    re, re' r re
    re, re' r re\f\mbreak
    sol, sol,8 la si4 sol

    %10
    do do, r do'
    re re' si sol
    re re' r fad,

    %13
    sol2. sol,4
    sol'2. sol4
    do la8 si do4 la

    %16
    re la re, re'
    re, re' r re
    re, re' r re\p \mbreak

    %19
    re, re' r re
    re, re' r re\f
    sol, sol,8 la si4 sol

    %22
    do do, r do'
    re si8 do re4 re,
    sol' re sol, sol' sol,2.\fermata r4

    %25
    r mi' sol mi
    si' si, r2
    r4 si' red si

    %28
    mi mi, r sold\mbreak
    la4.(si16 do) si4.(do16 re)
    do4 la mi' mi,\p

    %31
    la4.(si16 do) si4.(do16 re)
    do4 la mi' mi,\f
    la4 do re re,

    %34
    sol mi la fad
    si sol8 la si4 si,
    mi si mi, r

    %37
    r mi' mi' re\mbreak
    dod la re re,
    mi mi' fad, re

    %40
    sol sol, re' r

}

forma = {

    \key sol\major
    \time 2/2
    \tempo 1 = 55
    \partial 4 s4
    \repeat volta 2 {
        s1*23
    }
    \alternative {{s1}{s}}\bar ".|:"
    \set Score.currentBarNumber = #25
    s1*16
    \bar ":|."
    \mark\markup\smaller\center-column {"Da""Capo"}

}

VIIflI = {
    \VIIglobal
    %\notypeset
    <<\VIIflIn \forma>>

}

VIIflII = {
    \VIIglobal
    <<\VIIflIIn \forma>>

}

VIIobI = {
    \VIIglobal
    %\notypeset
    <<\VIIobIn \forma>>

}

VIIobII = {
    \VIIglobal
    <<\VIIobIIn \forma>>

}

VIIfg = {
    \VIIglobal
    \clef bass
    <<\VIIfgn \forma>>
    \typeset

}


VIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIIIflIn = \relative do'' {



    si4.(do16 re) si4
    sol la8(si) do(re)
    mi4\upl re\upl do\upl

    %4
    si do8(re) mi(fad)
    sol4 fad mi
    re do si

    %7
    la do \grace si8 la4
    \grace sol8 fad4 mi8 fad re4
    si'4.(do16 re) si4

    %10
    sol la8(si) do(re)
    mi4 re do
    si do8(re) mi(fad)

    %13
    sol4 fad mi
    re do si
    la sol fad

    %16
    sol2. sol\fermata
    sol'4.(la16 si) mi,4
    dod re8(mi) fad[(sol)]

    %19
    la4 sol fad
    mi dod8(re) mi[(fad)]\mbreak
    sol4 fad mi

    %22
    la sol fad
    mi sol \grace fad8 mi4
    \grace re8 dod4 si8 dod la4

    %25
    sol4.(la16 si) sol4
    fad la re
    sol,4.\p(la16 si) sol4

    %28
    fad la re
    dod\f mi la
    fad mi8 fad re4

    %31
    mi, re' dod
    re2.\mbreak
    do4.(re16 mi) do4

    %34
    la'8(sol) fad[(mi)] re(do)
    si(re) do[(si)] la(sol)
    fad(la) sol[(fad)] mi(re)

}

VIIIobIn = \relative do'' {



    si4.(do16 re) si4
    sol la8(si) do(re)
    mi4\upl re\upl do\upl

    %4
    si do8(re) mi(fad)
    sol4 fad mi
    re do si

    %7
    la do \grace si8 la4
    \grace sol8 fad4 mi8 fad re4
    si'4.(do16 re) si4

    %10
    sol la8(si) do(re)
    mi4 re do
    si do8(re) mi(fad)

    %13
    sol4 fad mi
    re do si
    la sol fad

    %16
    sol2. sol\fermata
    sol'4.(la16 si) mi,4
    dod re8(mi) fad[(sol)]

    %19
    la4 sol fad
    mi dod8(re) mi[(fad)]\mbreak
    sol4 fad mi

    %22
    la sol fad
    mi sol \grace fad8 mi4
    \grace re8 dod4 si8 dod la4

    %25
    sol4.(la16 si) sol4
    fad la re
    sol,4.\p(la16 si) sol4

    %28
    fad la re
    dod\f mi la
    fad mi8 fad re4

    %31
    mi, re' dod
    re2.\mbreak
    do4.(re16 mi) do4

    %34
    la'8(sol) fad[(mi)] re(do)
    si(re) do[(si)] la(sol)
    fad(la) sol[(fad)] mi(re)

}

VIIIobIIn = \relative do'' {

    sol2 fad4
    mi2 mi8(fa)
    sol4 sol fad?

    %4
    sol2 r4
    si2 do4
    sol fad sol

    %7
    mi la mi
    re2 re4
    re2 fad4

    %10
    mi2 mi8(fa)\mbreak
    sol4 sol fad!
    sol2 r4

    %13
    si2 do4
    sol fad sol
    mi2 re4

    %16
    re2. re\fermata
    sol2 si4
    la2 la4

    %19
    la la la
    la2 la4\mbreak
    sol la la

    %22
    la dod4 re
    si mi si
    la sold la

    %25
    mi2 mi4
    fad fad la
    mi2\p mi4

    %28
    fad fad la
    la\f dod mi
    re dod re

    %31
    si2 la4
    la2.\mbreak
    fad4 fad fad

    %34
    fad la8(sol) fad4
    sol la8(sol) fad[(mi)]
    re[(fad)] mi(re) r4



}

VIIIvlIn = \relative do'' {

    si4.(do16 re) si4
    sol la8(si) do(re)
    mi4\upl re\upl do\upl

    %4
    si do8(re) mi(fad)
    sol4 fad mi
    re do si

    %7
    la do \grace si8 la4
    \grace sol8 fad4 mi8 fad re4
    si'4.(do16 re) si4

    %10
    sol la8(si) do(re)
    mi4 re do
    si do8(re) mi(fad)

    %13
    sol4 fad mi
    re do si
    la sol fad

    %16
    sol2. sol\fermata
    sol'4.(la16 si) mi,4
    dod re8(mi) fad[(sol)]

    %19
    la4 sol fad
    mi dod8(re) mi[(fad)]\mbreak
    sol4 fad mi

    %22
    la sol fad
    mi sol \grace fad8 mi4
    \grace re8 dod4 si8 dod la4

    %25
    sol4.(la16 si) sol4
    fad la re
    sol,4.\p(la16 si) sol4

    %28
    fad la re
    dod\f mi la
    fad mi8 fad re4

    %31
    mi, re' dod
    re2.\mbreak
    do4.(re16 mi) do4

    %34
    la'8(sol) fad[(mi)] re(do)
    si(re) do[(si)] la(sol)
    fad(la) sol[(fad)] mi(re)

}

VIIIvlaIn = \relative do' {

    sol'2 fad4
    mi2 mi8(fa)
    sol4 sol fad?

    %4
    sol2 r4
    si2 do4
    sol fad sol

    %7
    mi la mi
    re2 re4
    re2 fad4

    %10
    mi2 mi8(fa)\mbreak
    sol4 sol fad!
    sol2 r4

    %13
    si2 do4
    sol fad sol
    mi2 re4

    %16
    re2. re\fermata
    sol2 si4
    la2 la4

    %19
    la la la
    la2 la4\mbreak
    sol la la

    %22
    la dod4 re
    si mi si
    la sold la

    %25
    mi2 mi4
    fad fad la
    mi2\p mi4

    %28
    fad fad la
    la\f dod mi
    re dod re

    %31
    si2 la4
    la2.\mbreak
    fad4 fad fad

    %34
    fad la8(sol) fad4
    sol la8(sol) fad[(mi)]
    re[(fad)] mi(re) r4

}

VIIIvlaIIn = \relative do' {

    re2 re4
    si2 si4
    do re fad

    %4
    re2 r4
    sol2 sol4
    re fad re

    %7
    mi mi do
    la sol8 la fad4
    sol2 re'4

    %10
    si2 si4\mbreak
    do re fad
    re2 r4

    %13
    sol2 sol4
    re fad re
    do si la

    %16
    si2. si\fermata
    re2 mi4
    mi fad8(mi) re[(dod)]

    %19
    re4 dod re
    dod mi dod\mbreak
    re re dod

    %22
    re sol la
    sol si\grace la8 sol4
    \grace fad8 mi4 re8 mi dod4

    %25
    dod?2 dod4
    re re fad
    dod2\p dod4

    %28
    re re fad
    mi\f la la
    la sol la

    %31
    mi2 mi4
    fad2.\mbreak
    re4 re re

    %34
    re re re
    re re re
    re re r

}

VIIIbcn = \relative do {

    sol'2 re4
    mi2 re4
    do si la

    %4
    sol2 r4
    mi'' re do
    si la sol

    %7
    do, la do
    re la re,
    sol'2 re4

    %10
    mi2 re4\mbreak
    do si la
    sol2 r4

    %13
    mi'' re do
    si la sol
    do,2 do4

    %16
    sol si re sol, re' do
     si sol sol'
     la2 sol4

     %19
     fad mi re
     la'2 la,4\mbreak
     si' la sol

     %22
     fad mi re
     sol mi sol
     la mi la,

     %25
     r la' la,
     r la' la,
     r la'\p la,

     %28
     r la' la,
     r la'\f dod,
     re mi fad

     %31
     sol mi la
     re, fad, la\mbreak
     re, re' r

     %34
     re re' r
     re, re' r
     re, re' r

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sol\major
    \time 3/4
    \tempo 2. = 65
   \repeat volta 2 {
        s2.*15
    }
    \alternative {{s2.}{s}}\bar ".|:"
    \set Score.currentBarNumber = #17
    s2.*20
    \bar ":|."
    \mark\markup\smaller\center-column {"Da""Capo"}

}

VIIIflI = {
    \VIIIglobal
    %\notypeset
    <<\VIIIflIn \forma>>

}

VIIIobI = {
    \VIIIglobal
    %\notypeset
    <<\VIIIobIn \forma>>

}

VIIIobII = {
    \VIIIglobal
    <<\VIIIobIIn \forma>>

}

VIIIvlI = {
    \VIIIglobal
    <<\VIIIvlIn \forma>>

}

VIIIvlaI = {
    \VIIIglobal
    <<\VIIIvlaIn \forma>>

}

VIIIvlaII = {
    \VIIIglobal
    \clef alto
    <<\VIIIvlaIIn \forma>>

}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
    \typeset

}


IXglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IXflIn = \relative do'' {

    R2.
    r4 sol'8(fad) sol[(fad)]
    sol4 sol, r

    %4
    r sol'8\p(fad) sol[(fad)]
    sol4\f mi4.(fad16 sol)
    fad4 fad8(sol16 la) fad4

    %7
    sol la si
    la8(sol) fad[(mi)] re(do)
    si4 sol r

    %10
    r4 sol'8(fad) sol[(fad)] \mbreak
    sol4 sol, r
    r sol'8\p(fad) sol[(fad)]

    %13
    sol4 mi do'8(si)
    la(sol) fad[(mi)] re(do)
    si4 la' fad

    %16
    sol2. sol\fermata
    si4.(do16 re) si4
    la2 r4

    %19
    la4.(si16 do) la4
    sol2 r4\mbreak
    sol4.(la16 si) sol4

    %22
    sol4.(la16 si) sol4
    sol fad8(sol) la[(fad)]
    red(si) dod[(red)] mi(fad)

    %25
    sol4 fad mi
    do'4 si8(la) sol[(fad)]
    sol4 mi red

    %28
    mi2.
    sol8(la16 si) re,!2
    do8(re16 mi) do2\mbreak

    %31
    \once\stemUp si8 (re') do[(si)] la sol
    fad4 re r

}

IXflIIn = \relative do'' {

    R2.
    r4 si8(la) si[(la)]
    si4 sol r

    %4
    r si8\p(la) si[(la)]
    si4\f dod4.(re16 mi)
    re4 re re

    %7
    re fad sol
    fad8(mi) re[(do)] si(la)
    sol4 sol r

    %10
    r si8(la) si[(la)]\mbreak
    si4 sol r
    r si8(la) si[(la)]

    %13
    sol4 mi' mi
    mi re la
    si la la

    %16
    si2. si\fermata
    sol'4.(la16 si) sol4
    fad2 r4

    %19
    fad4.(sol16 la) fad4
    mi2 r4\mbreak
    si2 si4

    %22
    mi4.(fad16 sol) re4
    do do8(si) la[(sol)]
    fad4. si8 dod(red)

    %25
    mi4 red mi
    mi fad2
    mi4 si si

    %28
    si2.
    re2 re4
    do8(re16 mi) do2\mbreak

    %31
    si4 sol' mi
    re fad r

}

IXobIn = \relative do'' {

    re4.(mi16 fa) mi4
    re2 r4
    re4.\p  (mi16 fa) mi4

    %4
    re2 r4
    sol\f mi4. (fad?16 sol)
    fad4 fad8(sol16 la) fad4

    %7
    sol la si
    la re, r
    re4.  (mi16 fa) mi4

    %10
    re2 r4\mbreak
    re4.(mi16 fa) mi4
    re2 r4

    %13
    sol mi do'8(si)
    la(sol) fad[(mi)] re(do)
    si4 re la

    %16
    sol2. sol\fermata
    R2.
    r4 fad'8(mi) fad[(mi)]

    %19
    fad4 la r
    r mi8(red) mi[(red)]\mbreak
    mi2.~

    %22
    mi2 sol4
    sol fad8(sol) la[(fad)]
    red(si) dod[(red)] mi(fad)

    %25
    sol4 fad mi
    do'4 si8(la) sol[(fad)]
    sol4 mi red

    %28
    mi2.
    sol8(la16 si) re,!2
    do8(re16 mi) do2\mbreak

    %31
    si4 do8(si') la[(sol)]
    fad(si) la[(sol)] fad(mi)

}

IXobIIn = \relative do'' {

    si4.(do16 re) do4
    si2 r4
    si4.\p(do16 re) do4

    %4
    si2 r4
    si\f dod4.(re16 mi)
    la,4 la8(sol16 fad) la4

    %7
    si do re
    re la r
    si4.(do16 re) do4

    %10
    si2 r4\mbreak
    si4.(do16 re) do4
    si2 r4

    %13
    re sol, do
    do8(si) la[(sol)] la4
    sol mi re

    %16
    re2. re\fermata
    R
    r4 la'8(sol) la[(sol)]

    %19
    la4 fad' r
    r sol,8(fad) sol[(fad)]\mbreak
    sol2 do4

    %22
    mi2 re4
    do do8(si) la[(sol)]
    fad4. si8 dod(red)

    %25
    mi4 red mi
    mi fad2
    si,4 sol fad

    %28
    sol2.
    sol2 sol4
    la2 fad4\mbreak

    %31
    sol4 sol do8(si)
    la(sol) fad([si)] la(do)

}

IXfgn =  \relative do {

    sol'4 sol, do
    sol' sol, r
    sol'\p sol, do

    %4
    sol' sol, r
    mi'\f la la,
    re re' do

    %7
    si la sol
    re' re, r
    sol sol, do

    %10
    sol' sol, r\mbreak
    sol' sol, do
    sol' sol, r

    %13
    si' do la
    do re re,
    sol do, re

    %16
    sol,si re sol,2.\fermata
    sol'4 sol, sol'
    re' re, r

    %19
    re' re, red
    mi mi, r\mbreak
    mi'' re, re'

    %22
    do do, si'
    la la, fad'
    si si, si'

    %25
    mi, fad sol
    la red,2
    mi4 sol si

    %28
    mi, re! do
    si2 si'4
    fad2 re4

    %31
    sol mi do
    re2 r4

}

forma = {

    \key sol\major
    \time 3/4
    \tempo 2. = 65
   \repeat volta 2 {
        s2.*15
    }
    \alternative {{s2.}{s }}
    \set Score.currentBarNumber = #17
    \repeat volta 2 {s2.*16}
    \mark\markup\smaller\center-column {"Da""Capo"}

}

IXflI = {
    \IXglobal
    %\notypeset
    <<\IXflIn \forma>>

}

IXflII = {
    \IXglobal
    <<\IXflIIn \forma>>

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

IXfg = {
    \IXglobal
    \clef bass
    <<\IXfgn \forma>>
    \typeset

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller{Ouverture & Suite [FaWV K:G11] }
        composer = \markup \center-column{"J. F. Fasch (1688 - 1758)"}

    }

    \markup\huge "[1.] Ouverture"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois 1."}
                \set Staff.shortInstrumentName = "ob1"
                \IobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois 2."}
                \set Staff.shortInstrumentName = "ob2"
                \IobII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violini"}
                \set Staff.shortInstrumentName = "vl"
                \IvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major\time 2/2 si'2^\markup \center-align"Viola 1."}
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \IvlaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola 2."}
                \set Staff.shortInstrumentName = "vla2"
                \IvlaII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassoni"}
                \set Staff.shortInstrumentName = "fg"
                \Ifg
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"Violone"\vspace #0.2"Violoncelli"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #2

    }

    \markup\huge "[2.] Air and[ante]"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte""Trav[ersiere] 1."}
                \set Staff.shortInstrumentName = "fl1"
                \IIflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte""Trav[ersiere] 2."}
                \set Staff.shortInstrumentName = "fl2"
                \IIflII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois 1."}
                \set Staff.shortInstrumentName = "ob1"
                \IIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois 2."}
                \set Staff.shortInstrumentName = "ob2"
                \IIobII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violini"}
                \set Staff.shortInstrumentName = "vl"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major\time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered  si'2^\markup \center-align"Viola 1."}
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \IIvlaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola 2."}
                \set Staff.shortInstrumentName = "vla2"
                \IIvlaII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"}
                \set Staff.shortInstrumentName = "fg"
                \IIfg
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"harpsichord"
                \set Staff.instrumentName = \markup \center-column{"Cembalo"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.6\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

    \markup\huge "[3.] Gavotte 1. altern[ativement]"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte""Trav[ersiere] 1."}
                \set Staff.shortInstrumentName = "fl1"
                \IIIflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte""Trav[ersiere] 2."}
                \set Staff.shortInstrumentName = "fl2"
                \IIIflII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois 1."}
                \set Staff.shortInstrumentName = "ob1"
                \IIIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois 2."}
                \set Staff.shortInstrumentName = "ob2"
                \IIIobII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violini"}
                \set Staff.shortInstrumentName = "vl"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major\time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered  si'4^\markup \center-align"Viola 1." do'' }
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \IIIvlaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola 2."}
                \set Staff.shortInstrumentName = "vla2"
                \IIIvlaII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"}
                \set Staff.shortInstrumentName = "fg"
                \IIIfg
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"harpsichord"
                \set Staff.instrumentName = \markup \center-column{"Cembalo"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.6\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[4.] Gavotte 2."

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte 1."}
                \set Staff.shortInstrumentName = "fl1"
                \IVflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte 2."}
                \set Staff.shortInstrumentName = "fl2"
                \IVflII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois 1."}
                \set Staff.shortInstrumentName = "ob1"
                \IVobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois 2."}
                \set Staff.shortInstrumentName = "ob2"
                \IVobII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"}
                \set Staff.shortInstrumentName = "fg"
                \IVfg
            >>
        >>

        \layout {

            indent = 1.6\cm
            #(layout-set-staff-size 16.5)

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge "[5.] Air andante"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte 1."}
                \set Staff.shortInstrumentName = "fl1"
                \VflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte 2."}
                \set Staff.shortInstrumentName = "fl2"
                \VflII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois"\vspace #-0.2"solo"}
                \set Staff.shortInstrumentName = "ob1"
                \VobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violini"}
                \set Staff.shortInstrumentName = "vl"
                \VvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola 1. & 2."}
                \set Staff.shortInstrumentName = "vla"
                \VvlaI
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"\vspace #-0.2"& Cembalo"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.6\cm
            #(layout-set-staff-size 17)

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

    \markup\huge "[6.] Bourée 1. altern[ativement]"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte 1."}
                \set Staff.shortInstrumentName = "fl1"
                \VIflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte 2."}
                \set Staff.shortInstrumentName = "fl2"
                \VIflII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois 1."}
                \set Staff.shortInstrumentName = "ob1"
                \VIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois 2."}
                \set Staff.shortInstrumentName = "ob2"
                \VIobII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violini"}
                \set Staff.shortInstrumentName = "vl"
                \VIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major\time 2/2  si'4^\markup \center-align"Viola 1." }
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \VIvlaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola 2."}
                \set Staff.shortInstrumentName = "vla2"
                \VIvlaII
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassoni"\vspace #-0.2"& Cembalo"}
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            indent = 1.6\cm
            #(layout-set-staff-size 15)

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[7.] Bourée 2."

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte"\vspace #-0.2"Trav[ersiere] 1."}
                \set Staff.shortInstrumentName = "fl1"
                \VIIflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte"\vspace #-0.2"Trav[ersiere] 2."}
                \set Staff.shortInstrumentName = "fl2"
                \VIIflII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautb[ois] 1."}
                \set Staff.shortInstrumentName = "ob1"
                \VIIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautb[ois] 2."}
                \set Staff.shortInstrumentName = "ob2"
                \VIIobII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassone"}
                \set Staff.shortInstrumentName = "fg"
                \VIIfg
            >>
        >>

        \layout {

            indent = 1.6\cm
            #(layout-set-staff-size 16.5)

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge "[8.] Menuet 1. altern[ativement]"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"[Flûte 1. % 2.]"}
                \set Staff.shortInstrumentName = "fl"
                \VIIIflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"[Hautbois 1.]"}
                \set Staff.shortInstrumentName = "ob1"
                \VIIIobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"[Hautbois 2.]"}
                \set Staff.shortInstrumentName = "ob2"
                \VIIIobII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violini]"}
                \set Staff.shortInstrumentName = "vl"
                \VIIIvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major\time 3/4\override MensuralStaff.TimeSignature.style = #'numbered  sol'2^\markup \center-align"[Viola 1.]" }
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla1"
                \VIIIvlaI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola 2.]"}
                \set Staff.shortInstrumentName = "vla2"
                \VIIIvlaII
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"[Bassoni"\vspace #-0.2"& Cembalo]"}
                \set Staff.shortInstrumentName = "bc"
                \VIIIbc
            >>
        >>

        \layout {

            indent = 1.6\cm
            #(layout-set-staff-size 16)

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[9.] Menuet 2."

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte 1."}
                \set Staff.shortInstrumentName = "fl1"
                \IXflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup \center-column{"Flûte 2."}
                \set Staff.shortInstrumentName = "fl2"
                \IXflII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautb[ois] 1."}
                \set Staff.shortInstrumentName = "ob1"
                \IXobI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautb[ois] 2."}
                \set Staff.shortInstrumentName = "ob2"
                \IXobII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Bassoni"}
                \set Staff.shortInstrumentName = "fg"
                \IXfg
            >>
        >>

        \layout {

            indent = 1.6\cm
            #(layout-set-staff-size 16.5)

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

}


