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



IflIn = \relative do'' {

    R1*17
    r4 r8 si16.\solo do32 re8 re4 mi8
    re16(sol) re4 mi8 re16(sol) re4 do8\tr

    %20
    \grace do8 si4 r r2
    R1
    r4 r8 si' la do4 si16(la)

    %23
    si(do re4) si8 la do4 si16(la)
    si8 la r4 r2
    R1

    %26
    r4 r8 fad16. sol32 la8 la4 si8
    \grace la4 sol4. la8 \grace sol8 fad4. sol8\mbreak
    mi8 la16(mi) sol(fad) mi(re) dod si la8 r4

    %29
    r8 la'16(mi) sol(fad) mi(re) si'8 si~si16 re dod si
    la8 la~la16 do! si la sol8 sol~sol16 si la sol
    fad(sol) sol(la) la(sol) sol(fad) fad(sol) sol(la) la(sol) sol(fad)

    %32
    fad(re') re4 fad,8 mi16 la la, la la4\tr
    la16 la' la, la la4\tr la16 la' la, la la4\tr \mbreak
    R1*2

    %36
    r4 re16\upl fad(sol la) re,\upl sol(la si) re,\upl la'(si do)
    \grace do8 si4 r r2
    r8 si(la) sol\tr fad\tuplet 3/2 { fad16(sol la) } sol8(fad\tr)

    %39
    mi si'(la) sol\tr fad \tuplet 3/2 { fad16 (sol la) } sol8 fad\tr \mbreak
    mi16(dod') dod(re) re(fad,) fad(mi) mi(dod') dod(re) re(fad,) fad(mi)
    mi(sol) fad(la) \grace la8 sol4 fad8\tuplet 3/2 { si16(la sol) }\grace fad8 mi4\tr

    %42
    re r r2
    R1*2
    r8 sol4 sol8~sol sol4 sol8~\mbreak

    %46
    sol16 fad mi re dod si la sol fad8 la' si16(sol) fad(mi)
    fad re sol mi \grace fad8 mi4\tr re r
    R1*11

    %59
    r4 r8 fad16.\solo sol32 la8 la4 si8
    la16(re) la4 si8 la16(re) la4 sol8\tr
    fad16(la) sol(si) la(do) si(re) do8 do~do16 do si la

    %62
    si8 si~si16 si la si do8 do~do16 do si la
    si8 la r4 r2
    R1*3

    %67
    r4 sol8 sol sol16(mi) re(do) sib'8 la16 sol
    \grace sol8 la4 la8 la la16(fad!) mi(re) do'8 si!16 la
    \grace la8 si4 si8 si si16(sold) fad(mi) re'8 do16 si

    %70
    do4~do16 la si do\mbreak si4~si16 si la sold
    la4~la16 la sol fad sol4~sol16 mi fa sol
    \grace sol8 fa8. [sol16 \grace fa8 mi8. fa16] re (si') si(do) do(mi,) mi(re)

    %73
    re(si') si(do) do(mi,) mi(re) re(sol) sol, sol sol4\tr
    sol16 sol' sol, sol sol4 \tr sol16 sol' sol, sol sol4 \tr
    r4 sol'16(fa) la(sol) \grace sol8 fa4 fa16(mi) sol(fa)\mbreak

    %76
    \grace fa8 mi4 sol8 la16. sib32 \grace sib8 la8. sol16 \grace sol8 fa8. mi16
    \grace mi8 re4 r r2
    R1

    %79
    r8 fa4 fa8 ~fa fa4 fa8~
    fa16 mi re mi fa sol la si do8 do4 do8~
    do16 la la(sol) sol(fa) fa(mi) mi8 do'4 do8~\mbreak

    %82
    do16 la la(sol) sol(fa) fa(mi) mi8 do'16(sol) \tuplet 3/2 {
        la(si do) do[(si la)]
        sol(la sib) sib[(la sol)] fa(sol la) la[(sol fa)] mi(fa sol) la[(sol fa)]
    } \grace mi8 re4\tr
    do r r2

    %85
    r8 mi4 mi8~mi do'4 mi,8~
    mi16 do' do mi, mi do' do mi, re16. re32 mi16. fa32 \grace mi8 re4\tr \mbreak
    do4 r r2

    %88
    R1*5
    r8 mi\solo mi4~mi8 re16. mi32 fa8 fa
    mi do'4 si8~si la16. si32 la8 sol

    %95
    fad! fad fad4~fad8 mi16. fad32 sol8 sol
    fad re'4 do8~do si16 do re8 do
    si4 r r2

    %98
    R1*3
    r2 r4 r8 si,16.\solo do32
    re8 re4 mi8 \grace re4 do4. re8

    %103
    \grace do4 si4. do8 la re16(la) do(si) la(sol)
    fad(mi) re8 r4 r8 re'16(la) do(si) la(sol)
    fad mi re8 r4 r2\mbreak

    %106
    R1*5
    r2 la''16 re, do' re, si' re, la' re,\mbreak
    si' re, re' re, do' re, si' re, la' re, do' re, si' re, la' re,

    %113
    si'8 la re,16\upl fad(sol la) re,\upl sol(la si) re,\upl la'(si do)
    \grace do8 si4 r r2
    R1*2

    %117
    r8 mi,(re) do si \tuplet 3/2 { si16(do re) } do8 si\mbreak
    la4 r r2
    R1*3

    %122
    r4 r8 si16.\solo do32 re8 re4 mi8
    re16(sol) re4 mi8 re16(sol) re4 do8\tr\mbreak
    si16 si' si(la) la(sol) sol(fad) fad(sol) sol(fad) fad(mi) mi(re)

    %125
    re(mi) mi(re) re(do) do(si) si8. do16 \grace si8 la4\tr
    sol8 re'~re\tuplet 3/2 { la16(si do) } si8 re~re\tuplet 3/2 { la16(si do) }
    si8 sol'32(fad mi re) do8 si si la r4

    %128
    R1
    r2 r8 do4 do8~
    do do4 do8~do16 si la si do re mi fad

    %131
    sol8 sol4 sol8~sol16 mi mi(re) re(do) do(si)
    si8 sol'4 sol8~sol16 mi mi(re) re(do) do(si)
    si8 sol'16(re) \tuplet 3/2 {
        mi(fad sol) sol[(fad mi)] re(mi fa) fa[(mi re)] do(re mi) mi[(re do)]\mbreak

        %134
        si(do re) mi[(re do)]
    } \grace si8 la4 sol r
    r2 r8 si'4 si8~
    si si4 si8~si16 si la sol fad mi re do

    %137
    \tuplet 3/2 { si la sol fad[mi re] } la'4\tr sol r
    R1*3

}

IflIIn = \relative do'' {

    R1*17
    r4 r8 sol16.\solo la32 si8 si4 do8
    si si4 do8 si si4 la8\tr

    %20
    \grace la sol4 r r2
    R1
    r4 r8 sol' fad la4 sol16(fad)

    %23
    sol(la) si4 sol8 fad la4 sol16 \parentSlur (fad)
    sol8 fad r4 r2
    R1

    %26
    r4 r8 re16. mi32 fad8 fad4 sol8
    \grace fad4 mi4. fad8 \grace mi8 re4. mi8\mbreak
    dod4 r r8 la'16(mi) sol(fad) mi(re)

    %29
    dod(si la8) r4 r16 re mi fad mi8 mi~
    mi16 dod re mi re8 re~re16 si dod re dod8 dod
    re16(mi) mi(fad) fad(mi) mi(re) re(mi) mi(fad) fad(mi) mi(re)

    %32
    re(fad) fad4 re8 dod4 la16 la' la, la
    la4\tr la16 la' la, la la4\tr la16 la' la, la\mbreak
    la4\tr la16\upl dod(re mi) la,\upl re(mi fad) la,\upl mi'(fad sol)

    %35
    \grace sol8 fad4 r r2
    R1*2
    r8 sol(fad) mi\tr re\tuplet 3/2 { re16(mi fad) } mi8 re\tr

    %39
    dod sol'(fad) mi\tr re\tuplet 3/2 { re16 (mi fad) } mi8 re\tr \mbreak
    dod16(mi) mi(fad) fad(re) re(dod) dod(mi) mi(fad) fad(re) re(dod)
    dod?(mi) re(fad) \grace fad8 mi4 re8 re4 dod8\tr

    %42
    re4 r r2
    R1*2
    r8 mi4 mi~mi mi8~\mbreak

    %46
    mi16 re dod si la sol fad mi re8 re'4 re8~
    re mi \grace re dod4\tr re r
    R1*11

    %59
    r4 r8 re16.\solo mi32 fad8 fad4 sol8
    fad fad4 sol8 fad fad4 mi8\tr
    re16(fad) mi(sol) fad(la) sol(si) la8 la~la16 la sol fad

    %62
    sol8 sol~sol16 sol fad sol la8 la~la16 la sol fad
    sol8 fad r4 r2
    R1*3

    %67
    r4 si,8 si do4 do8 do
    do16(la) sol(fa) fa'8 mi re4 re8 re
    re16(si) la(sol) sol'8 fa mi4 mi8 mi~

    %70
    mi16 mi fa sol fa4~\mbreak fa?16 re mi fa mi4~
    mi16 mi re dod re4~re16 si do re do do re mi
    \grace mi8 re8. mi16 \grace re8 do8. re16 si(re) re(mi) mi(do) do(si)

    %73
    si(re) re(mi) mi(do) do(si) si4 sol16 sol' sol, sol
    sol4\tr sol16 sol' sol, sol sol4\tr sol16 sol' sol, sol
    sol4\tr mi'16(re) fa(mi) \grace mi8 re4 re16(do) mi(re)\mbreak

    %76
    \grace re8 do4 mi8 fa16. sol32 \grace sol8 fa8. mi16 \grace mi8 re8. do16
    \grace do8 si4 r r2
    R1

    %79
    r8 re4 re8~re re4 re8~
    re16 do si do re mi fa re do fa fa(mi) mi(re) re(do)
    do8 do4 do8~do16 fa fa(mi) mi(re) re(do)\mbreak

    %82
    do8 do4 do8 do mi16(do) \tuplet 3/2 { fa(sol la) la[(sol fa)]
    mi(fa sol) sol[(fa mi)] re(mi fa) fa[(mi re)]} do8. re16 \grace do8 si4\tr
    do r r2

    %85
    r8 do4 do8~do mi4 do8~
    do16 mi mi do do mi mi do si16. si32 do16. re32 \grace do8 si4\tr \mbreak
    do r r2

    %88
    R1*5
    r8 do\solo do4~ do8 si16. do32 re8 re
    do mi4 re8~re do16. re32 do8 si

    %95
    la re re4~re8 dod16. re32 mi8 mi
    re fad4 la8~la sol16. la32 si8 la
    sol4 r r2

    %98
    R1*3
    r2 r4 r8 sol,16.\solo la32
    si8 si4 do8 \grace si4 la4. si8

    %103
    \grace la4 sol4. la8 fad4 r
    r8 re'16(la) do(si) la(sol) fad mi re8 r4
    R1*6

    %111
    r2 fad'16 re la' re, sol re fad re\mbreak
    sol re si' re, la' re, sol re fad re la' re, sol re fad re
    sol8 fad r4 r2

    %114
    R1
    r4 sol,16\upl si(do re) sol,\upl do(re mi) sol,\upl re'(mi fa)
    \grace fa?8 mi4 r r2

    %117
    r8 do(si) la sol\tuplet 3/2 { sol16(la si) } la8 sol\mbreak
    fad4 r r2
    R1*3

    %122
    r4 r8 sol16.\solo la32 si8 si4 do8
    si si4 do8 si si4 la8\tr \mbreak
    sol16 sol' sol(fad) fad(mi) mi(re) re(mi) mi(re) re(do) do(si)

    %125
    si(do) do(si) si(la) la(sol) sol8. la16 \grace sol8 fad4\tr
    sol8 sol~sol\tuplet 3/2 { fad16 \parentSlur (sol la) } sol8 sol~sol8\tuplet 3/2 { fad16 (sol la) }
    sol8 si la sol sol fad r4

    %128
    R1
    r2 r8 la4 la8~\mbreak
    la la4 la8~la16 sol fad sol la si do la

    %131
    sol do do(si) si(la) la(sol) sol8 sol4 sol8~
    sol16 do do(si) si(la) la(sol) sol8 sol4 sol8
    sol si16 sol \tuplet 3/2 { do(re mi) mi[(re do)] si(do re) re[(do si)] la\parentSlur (si do) do[\parentSlur (si la)] }\mbreak

    %134
    sol8 sol4 fad8\tr sol4 r
    r2 r8 sol'4 sol8~
    sol sol4 sol8~sol16 sol fad mi re do si la

    %137
    sol8 sol4 fad8\tr sol4 r\mbreak
    R1*3

}


IvlIn = \relative do'' {

    sol,8 \tuplet 3/2 { si16 la sol } re'8 re re \tuplet 3/2 { fad16 mi re } sol8 si
    la16 do fad, la re,8 do si16 la sol8 r8 si'16. do32
    re8 re4 mi8 re16(sol) re4 mi8

    %4
    re16(sol) re4 do8\tr si\tuplet 3/2 { si,16 la sol } re'8 re
    re\tuplet 3/2 { fad16 mi re } \once\stemUp sol8 si' la16 re, do' re, si' re, la' re,
    si'16(do re4) si8 la16 re, do' re, si' re, la' re,

    %7
    si'8 la r si,\p \mbreak la16 re, do' re, si' re, la' re,
    si'16(do re4) si8 la16 re, do' re, si' re, la' re,
    si'8 la r4 re,8\f \tuplet 3/2 { fad16 mi re } la'8 la

    %10
    la\tuplet 3/2 { dod16 si la } re8 fad mi16(sol) fad(la) \grace la8 sol4
    fad16(re') re4 fad,8 mi16(sol) fad(la) \grace la8 sol4
    \grace sol8 fad4 la16(fad) mi(re) \grace re8 do8. re16 \grace do8 si8. do16

    %13
    \grace si8 la4 la'16\p fad mi re \grace re8 do8. re16 \grace do8 si8. do16
    la\f(fad') fad(sol) sol(si,) si(la)\mbreak la\f(fad') fad(sol) sol(si,) si(re)
    \grace do si8 la r4 sol,8\tuplet 3/2 { si16 la sol } re'8 re

    %16
    re\tuplet 3/2 { fad16 mi re } sol8 si la16 do fad, la re,8 do
    si sol'16 si, do8 sol'16 dod, re8 sol16 si, do?8 re
    sol,4 r sol'\p sol

    %19
    sol sol sol re
    sol,8 si16 re sol8 r r2
    R1

    %22
    r2 re'4\p re
    r8 sol,16 la si8 si16 do re4 re
    sol,8 re' r4 r2

    %25
    R1
    r2 r8 re16.\p dod32 re8 si
    r8 dod16. si32 dod8 la r si16. la32 si8 sol\mbreak

    %28
    la8 dod, re[fad] la dod, re[fad]
    la dod, re[fad] sol sol sol sol
    fad fad fad fad mi mi mi mi

    %31
    re4 r8 la re4 r8 la
    re4 sold la r
    R1\mbreak

    %34 OOKK
    r4 r8 sol fad re dod[la]
    re4 r r2
    r4 r8 do'!8 si sol fad[re]

    %37
    sol4 r r2
    r4 r8 \tuplet 3/2 { la16(si dod) } re4  r8 re,32(mi fad sol)
    la4 r8 \tuplet 3/2 { la16(si dod) } re4  r8 re,32(mi fad sol)\mbreak

    %40
    la8 la la la la la la la
    la4 r8\tuplet 3/2 { la,16(si dod) }re8 sol la la,
    re4 r r2

    %43
    R1*2
    dod'8 r dod r dod r dod r\mbreak
    dod?4 r8 la, re fad sol sold

    %47
    la sol! la la, re4 r
    r2 re8\tu \f\tuplet 3/2 { fad16 mi re } la'8 la
    la\tuplet 3/2 { dod16 si la } re8 fad mi16 sol dod, mi la,8 sol

    %50
    fad16 mi re8 r fad'16. sol32 la8 la4 si8
    la16(re) la4 si8\noBeam la16(re) la4 sol8\tr
    fad\tuplet 3/2 { fad,16 mi re } la'8 la\mbreak la \tuplet 3/2 { dod16 si la } re8 la'

    %53
    la16(fad) mi(re) la'(do,!) si(la) si si'(la sol fad mi red mi)
    si'(sold) fad(mi) si'(re,) dod(si) dod16.\tr si32 la8 mi'16(dod) si(la)
    \grace la8 sol8. la16 \grace sol8 fad8. sol16 \grace fad8 mi4 mi'16\p dod si la

    %56
    \grace la8 sol8. la16 \grace sol8 fad8. sol16 mi dod'\f dod(re) re(fad,) fad(mi)
    mi(dod') dod(re) re(fad,) fad(mi) mi mi' mi re dod si la sol\mbreak
    fad re' re dod si la sol fad \tuplet 3/2 { sol fad mi fad[mi re] } la'8 la,

    %59
    re4 r re'\p re
    re re re la
    re, r r16 re fad la re4

    %62
    r16 re, sol si re4 r16 re, fad la re8 re
    sol, re r4 r2
    R1*3

    %67
    r4 sol8 fa mi mi mi mi
    fa fa fa fa fad fad fad fad
    sol sol sol sol sold sold sold sold

    %70
    la la re, re\mbreak sol sol do, do
    fa fa si, si mi mi la, la
    re sol, do fa sol sol sol sol

    %73
    sol sol sol sol sol4 r
    R1
    r2 sol8 sol, r4\mbreak

    %76
    do'8 do, r4 fa fa
    sol8 sol, r4 r2
    R1

    %79
    si'8 r si r si r si r
    si r r sol, la la' sol fa
    mi fa mi re do la' sol fa\mbreak

    %82
    mi fa mi re do r do r
    do r si r do fa sol[sol,]
    do4 r r2

    %85
    do8 do' do, si la la' la, sol
    fad'! fad fad fad sol do, sol' sol,\mbreak
    do\tu\f \tuplet 3/2 { mi16 re do } sol'8 sol sol \tuplet 3/2 { si16 la sol } do8 mi

    %88
    re16 fa si, re sol,8 fa mi16 re do8 sol''16(mi) re(do)
    \grace do8 si8. do16 \tuplet 3/2 { re mi fa } mi8 \grace mi re4 sol16\p(mi) re(do)
    \grace do8 si8. do16 \tuplet 3/2 { re16 (mi fa) } mi8 re16\f(si') si(do) do(mi,) mi(re)

    %91
    re(si') si(do) do(mi,) mi(re)  re[fa32 mi re16 do] si la sol fa
    mi8 do'16 mi, fa8 do'16 fad, sol8 do16 mi, fa8 sol
    do,4 r8 do32\p(re mi fa) sol4 sol,

    %94
    do do do do
    re r8 re32(mi fad! sol) la4 la,
    re re re re

    %97
    sol, r r2
    R1*2
    sol8\tu\f  \tuplet 3/2 { si16 la sol } re'8 re re \tuplet 3/2 { fad16 mi re } sol8 si

    %101
    la16 re, do' re, si' re, la' re, si'8 la r4
    r8 sol16.\p fad32 sol8[mi] r fad16. mi32 fad8[re]
    r mi16. re32 mi8[do] re fad sol sol,

    %104
    re' fad sol sol, re' fad sol sol,
    re'4 r r2\mbreak
    R1*7

    %113
    r4 r8 do' si sol fad re
    sol sol, r4 r2
    r4 r8 fa' mi do si sol

    %116
    do do' r4 r2
    r4 r8 \tuplet 3/2 { re,16(mi fad!) } sol4 r8 sol,32(la si do)\mbreak
    re4 r r2

    %119
    R1
    r8 re'32\tu\f(mi fad sol) la8 sol32(fad mi re) \grace re8 do8. re16 \grace do8 si8. do16
    \grace si8 la4 la'16\p(fad) mi(re) \grace re8 do8. re16 \grace do8 si8. do16

    %122
    \grace si8 la4 r r8 sol\p sol,4
    r8 sol' sol,4 r8 sol si re\mbreak
    sol4 r r2

    %125
    r4 r8 re mi do re re
    sol,\tuplet 3/2 { si16 la sol } re'8 r sol, \tuplet 3/2 { si16 la sol } re'8 r
    sol,4 do8 dod re8. mi16 re do? si la

    %128
    sol4 r r2
    r la'8 r la r\mbreak
    la r la r la r r re,

    %131
    mi mi re do si do si la
    sol mi' re do si do si la
    sol r sol r sol' r fad r\mbreak

    %134
    sol do, re re sol,4 r
    r2 si'8 r si r
    si r si r si r r4

    %137
    r2 sol,8\f\tu \tuplet 3/2 { si16 la sol } re'8 re \mbreak
    re \tuplet 3/2 { fad16 mi re } sol8 si  la16 do fad, la re,8 do
    si si'16 si, do8 sol'16 dod, re8 sol16 si, do?8 re

    %140
    sol,4 r r2

}

IvlIIn = \relative do'' {

    sol,8 \tuplet 3/2 { si16 la sol } re'8 re re \tuplet 3/2 { fad16 mi re } sol8 si
    la16 do fad, la re,8 do si16 la sol8 r8  sol'16. la32
    si8 si4 do8 si si4 do8

    %4
    si si4 la8 sol\tuplet 3/2 { si,16 la sol } re'8 re
    re\tuplet 3/2 { fad16 mi re } sol8 sol' fad16 re la' re, sol re fad re
    sol(la si4) sol8 fad16 re la' re, sol re fad re

    %7
    sol8 fad r sol,\p\mbreak fad16 re la' re, sol re fad re
    sol(la si4) sol8 fad16 re la' re, sol re fad re
    sol8 fad r4 re8\f \tuplet 3/2 { fad16 mi re } la'8 la

    %10
    la \tuplet 3/2 { dod16 si la } re8 re dod16 (mi) re(fad) \grace fad8 mi4
    re16(fad) fad4 re8 dod16(mi) re(fad) \grace fad8 mi4
    \grace mi8 re4 la'16(fad) mi(re) \grace re8 do8. re16 \grace do8 si8. do16

    %13
    \grace si8 la4 la'16\p fad mi re \grace re8 do8. re16 \grace do8 si8. do16
    la\f~la la(si) si(sol) sol(fad)\mbreak fad(la) la(si) si(sol) sol(si)
    \grace la16 sol8 fad r4 sol,8\tuplet 3/2 { si16 la sol } re'8 re

    %16
    re\tuplet 3/2 { fad16 mi re } sol8 si la16 do fad, la re,8 do
    si sol'16 si, do8 sol'16 dod, re8 sol16 si, do?8 re
    sol,4 r sol'\p sol

    %19
    sol sol sol re
    sol,8 si16 re sol8 r r2
    R1

    %22
    r2 re'4\p re
    r8 sol,16 la si8 si16 do re4 re
    sol,8 re' r4 r2

    %25
    R1
    r2 r8 re16.\p dod32 re8 si
    r8 dod16. si32 dod8 la r si16. la32 si8 sol\mbreak

    %28
    la8 dod, re[fad] la dod, re[fad]
    la dod, re[fad] sol sol sol sol
    fad fad fad fad mi mi mi mi

    %31
    re4 r8 la re4 r8 la
    re4 sold la r
    R1\mbreak

    %34 OOKK
    r4 r8 sol fad re dod[la]
    re4 r r2
    r4 r8 do'!8 si sol fad[re]

    %37
    sol4 r r2
    r4 r8 \tuplet 3/2 { la16(si dod) } re4  r8 re,32(mi fad sol)
    la4 r8 \tuplet 3/2 { la16(si dod) } re4  r8 re,32(mi fad sol)\mbreak

    %40
    la8 la la la la la la la
    la4 r8\tuplet 3/2 { la,16(si dod) }re8 sol la la,
    re4 r r2

    %43
    R1*2
    mi8 r mi r mi r mi r\mbreak
    mi4 r 8 la, re fad sol sold

    %47
    la sol! la la, re4 r
    r2 re8\tu \f\tuplet 3/2 { fad16 mi re } la'8 la
    la\tuplet 3/2 { dod16 si la } re8 fad mi16 sol dod, mi la,8 sol

    %50
    fad16 mi re8 r re'16. mi32 fad8 fad4 sol8
    fad fad4 sol8 fad fad4 mi8\tr
    re \tuplet 3/2 { fad,16 mi re } la'8 la\mbreak la \tuplet 3/2 { dod16 si la } re8 la'

    %53
    la16(fad) mi(re) la'(do,!) si(la) si si'(la sol fad mi red mi)
    si'(sold) fad(mi) si'(re,) dod(si) dod16.\tr si32 la8 mi'16(dod) si(la)
    \grace la8 sol8. la16 \grace sol8 fad8. sol16 \grace fad8 mi4 mi'16\p dod si la

    %56
    \grace la8 sol8. la16 \grace sol8 fad8. sol16 mi\f mi mi(fad) fad(re) re(dod)
    dod(mi) mi(fad) fad(re) re(dod) dod dod' dod si la sol fad mi\mbreak
    re re' re dod si la sol fad \tuplet 3/2 { sol fad mi fad[mi re] } la'8 la,


    %59
    re4 r re'\p re
    re re re la
    re, r r16 re fad la re4

    %62
    r16 re, sol si re4 r16 re, fad la re8 re
    sol, re r4 r2
    R1*3

    %67
    r4 sol8 fa mi mi mi mi
    fa fa fa fa fad fad fad fad
    sol sol sol sol sold sold sold sold

    %70
    la la re, re\mbreak sol sol do, do
    fa fa si, si mi mi la, la
    re sol, do fa sol sol sol sol

    %73
    sol sol sol sol sol4 r
    R1
    r2 sol8 sol, r4\mbreak

    %76
    do'8 do, r4 fa fa
    sol8 sol, r4 r2
    R1

    %79
    re'8 r re r re r re r
    re r r sol, la la' sol fa
    mi fa mi re do la' sol fa\mbreak

    %82
    mi fa mi re do r do r
    do r si r do fa sol[sol,]
    do4 r r2

    %85
    do8 do' do, si la la' la, sol
    fad'! fad fad fad sol do, sol' sol,\mbreak
    do\tu\f \tuplet 3/2 { mi16 re do } sol'8 sol sol \tuplet 3/2 { si16 la sol } do8 mi

    %88
    re16 fa si, re sol,8 fa mi16 re do8 sol''16(mi) re(do)
    \grace do8 si8. do16 \tuplet 3/2 { re mi fa } mi8 \grace mi re4 sol16\p(mi) re(do)
    \grace do8 si8. do16 \tuplet 3/2 { re16 (mi fa) } mi8 si16\f (re) re(mi) mi(do) do(si)

    %91
    si(re) re(mi) mi(do) do(si) si re32 do si16 la sol fa mi re
    do8 do'16 mi, fa8 do'16 fad, sol8 do16 mi, fa8 sol
    do,4 r8 do32\p(re mi fa) sol4 sol,

    %94
    do do do do
    re r8 re32(mi fad! sol) la4 la,
    re re re re

    %97
    sol, r r2
    R1*2
    sol8\tu\f  \tuplet 3/2 { si16 la sol } re'8 re re \tuplet 3/2 { fad16 mi re } sol8 sol

    %101 metà p 8
    fad16 re la' re, sol re fad re sol8 fad r4
    r8 sol16.\p fad32 sol8[mi] r fad16. mi32 fad8[re]
    r mi16. re32 mi8[do] re fad sol sol,

    %104
    re' fad sol sol, re' fad sol sol,
    re'4 r r2\mbreak
    R1*7

    %113
    r4 r8 do' si sol fad re
    sol sol, r4 r2
    r4 r8 fa' mi do si sol

    %116
    do do' r4 r2
    r4 r8 \tuplet 3/2 { re,16(mi fad!) } sol4 r8 sol,32(la si do)\mbreak
    re4 r r2

    %119
    R1
    r8 re'32\tu\f(mi fad sol) la8 sol32(fad mi re) \grace re8 do8. re16 \grace do8 si8. do16
    \grace si8 la4 la'16\p(fad) mi(re) \grace re8 do8. re16 \grace do8 si8. do16

    %122
    \grace si8 la4 r r8 sol\p sol,4
    r8 sol' sol,4 r8 sol si re\mbreak
    sol4 r r2

    %125
    r4 r8 re mi do re re
    sol,\tuplet 3/2 { si16 la sol } re'8 r sol, \tuplet 3/2 { si16 la sol } re'8 r
    sol,4 do8 dod re8. mi16 re do? si la

    %128
    sol4 r r2
    r fad'8 r fad r\mbreak
    fad r fad r fad r r re

    %131
    mi mi re do si do si la
    sol mi' re do si do si la
    sol r sol r sol' r fad r\mbreak

    %134
    sol do, re re sol,4 r
    r2 sol'8 r sol r
    sol r sol r sol r r4

    %137
    r2 sol,8\f\tu \tuplet 3/2 { si16 la sol } re'8 re \mbreak
    re \tuplet 3/2 { fad16 mi re } sol8 si  la16 do fad, la re,8 do
    si si'16 si, do8 sol'16 dod, re8 sol16 si, do?8 re

    %140
    sol,4 r r2

}

Ivlan = \relative do' {

    sol8\tuplet 3/2 { si16 la sol } re'8 re re \tuplet 3/2 { fad16 mi re } sol8 si
    la16 do fad, la re,8 do si16 la sol8 r4
    sol' sol sol sol

    %4
    sol re sol,8\tuplet 3/2 { si16 la sol } re'8 re
    re \tuplet 3/2 { fad16 mi re } sol8 sol re'4 re
    r8 sol,16 la si8 si16 do re4 re

    %7
    sol,8 re' r4\mbreak re,\p re
    r8 sol,16 la si8 si16 do re4 re
    sol,8 re r4 re'8\f \tuplet 3/2 { fad16 mi re } la'8 la

    %10
    la \tuplet 3/2 { dod16 si la } re8 re, la'4 la
    re,8 re16 mi fad8 fad16 sol la4 la
    re, r r8  la' re, sol
    \grace sol fad4 r r8 mi\p fad fad,
    do'\f do do do\mbreak re re re re
    re8. mi16 re do si la sol8 \tuplet 3/2 { si16 la sol } re'8 re

    %15
    re\tuplet 3/2 { fad16 mi re } sol8 si la16 do fad, la re,8 do
    si si do dod re sol16 si, do?8 re
    sol,4 r  sol'\p sol
    sol sol sol re
    sol,8 si16 re sol8\noBeam r r2
    R1
    r2 re'4\p re
    r8 sol,16 la si8 si16 do re4 re
    sol,8 re' r4 r2

    %25
    R1
    r2 r8 re16.\p dod32 re8 si
    r8 dod16. si32 dod8 la r si16. la32 si8 sol\mbreak

    %28
    la8 dod, re[fad] la dod, re[fad]
    la dod, re[fad] sol sol sol sol
    fad fad fad fad mi mi mi mi

    %31
    re4 r8 la re4 r8 la
    re4 sold la r
    R1\mbreak

    %34 OOKK
    r4 r8 sol fad re dod[la]
    re4 r r2
    r4 r8 do'!8 si sol fad[re]

    %37
    sol4 r r2
    r4 r8 \tuplet 3/2 { la16(si dod) } re4  r8 re,32(mi fad sol)
    la4 r8 \tuplet 3/2 { la16(si dod) } re4  r8 re,32(mi fad sol)\mbreak

    %40
    la8 la la la la la la la
    la4 r8\tuplet 3/2 { la,16(si dod) }re8 sol la la,
    re4 r r2

    %43
    R1*2
    la8 r la r la r la r\mbreak
    la4 r8 la re fad sol sold

    %47
    la sol! la la, re4 r
    r2 re8 \f\tuplet 3/2 { fad16 mi re } la'8 la
    la\tuplet 3/2 { dod16 si la } re8 fad mi16 sol dod, mi la,8 sol
    fad16 mi re8 r4 re' re
    re re re la

    %52
    re,8 \tuplet 3/2 { fad16 mi re } la'8 la\mbreak la \tuplet 3/2 { dod16 si la } re8 fad,16. mi32
    re8 re re re re si' si si
    mi, mi mi mi mi4 r
    r8 mi la, re \grace re dod4 r
    r8 mi\p la, re dod\f la la la
    la la la la la4 r8 la\mbreak
    la16 re' re dod si la sol fad \tuplet 3/2 { sol fad mi fad[mi re] } la'8 la,
    re4 r re'\p re
    re re re la
    re, r r16 re fad la re4
    r16 re, sol si re4 r16 re, fad la re8 re
    sol, re r4 r2
    R1*3

    %67
    r4 sol8 fa mi mi mi mi
    fa fa fa fa fad fad fad fad
    sol sol sol sol sold sold sold sold

    %70
    la la re, re\mbreak sol sol do, do
    fa fa si, si mi mi la, la
    re sol, do fa sol sol sol sol

    %73
    sol sol sol sol sol4 r
    R1
    r2 sol8 sol, r4\mbreak  %% inizio p. 7
    do'8 do, r4 fa fa
    sol8 sol, r4 r2
    R1
    sol8 r sol r sol r sol r
    sol r r sol la la' sol fa
    mi fa mi re do la' sol fa\mbreak
    mi fa mi re do r do r
    do r si r do fa sol sol,
    do4 r r2
    do8 do' do, si la la' la, sol
    fad! fad fad fad sol do sol'[sol,]\mbreak

    %87
    do\f \tuplet 3/2 { mi16 re do } sol'8 sol sol \tuplet 3/2 { si16 (la sol) } do8 mi
    re16 fa si, re sol,8 fa? mi16 re do8 r sol'
    fa mi re do \grace do si4 r8 sol'\p
    fa mi re do sol'\f sol sol sol
    sol sol sol sol sol4 r8sol,
    do do'16 mi, fa8 do'16 fad, sol8 do16 mi, fa8 sol
    do,4 r8 do32\p(re mi fa) sol4 sol,

    %94
    do do do do
    re r8 re32(mi fad! sol) la4 la,
    re re re re

    %97
    sol, r r2
    R1*2
    sol8\tu\f  \tuplet 3/2 { si16 la sol } re'8 re re \tuplet 3/2 { fad16 mi re } sol8 sol,
    re'4 re sol8 re r4
    r8 sol16.\p fad32 sol8[mi] r fad16. mi32 fad8[re]
    r mi16. re32 mi8[do] re fad sol sol,

    %104
    re' fad sol sol, re' fad sol sol,
    re'4 r r2\mbreak
    R1*7

    %113
    r4 r8 do' si sol fad re
    sol sol, r4 r2
    r4 r8 fa' mi do si sol

    %116
    do do' r4 r2
    r4 r8 \tuplet 3/2 { re,16(mi fad!) } sol4 r8 sol,32(la si do)\mbreak
    re4 r r2

    %119
    R1
    re4\f r r8 la' re, sol
    \grace sol fad4 r r8 la\p re, sol
    \grace sol fad4 r r8 sol sol,4
    r8 sol' sol,4 r8 sol si re\mbreak
    sol4 r r2


    %125
    r4 r8 re mi do re re
    sol,\tuplet 3/2 { si16 la sol } re'8 r sol, \tuplet 3/2 { si16 la sol } re'8 r
    sol,4 do8 dod re8. mi16 re do? si la

    %128
    sol4 r r2
    r re'8 r re r\mbreak
    re r re r re r r re

    %131
    mi mi re do si do si la
    sol mi' re do si do si la
    sol r sol r sol' r fad r\mbreak

    %134
    sol do, re re, sol4 r
    r2 re'8 r re r
    re r re r re r r4

    %137
    r2 sol,8\f \tuplet 3/2 { si16 la sol } re'8 re \mbreak
    re \tuplet 3/2 { fad16 mi re } sol8 si  la16 do fad, la re,8 do
    si si'16 si, do8 sol'16 dod, re8 sol16 si, do?8 re

    %140
    sol,4 r r2




}

Ivdgn = \relative do' {

    R1*19
    r4 r8 si16.\solo do32 re8 re4 mi8
    re16(sol) re4 mi8 re16(sol) re4 do8\tr

    %22
    \grace do8 si4 r r2
    R1
    r4 r8 si la16 re, do' re, si' re, la' re,

    %25
    si' do re4 si8 la16 re, do' re, si' re, la' re,
    si'8 la r4 r2
    R1*5

    %32
    r2 mi'16 la, sol' la, fad' la, mi' la,
    fad' la, la' la, sol' la, fad' la, mi' la, sol' la, fad' la, mi' la,\mbreak
    fad'8 mi r4 r2

    %35
    r4 la,16\upl dod (re mi) la,\upl re(mi fad) la,\upl mi'(fad sol)
    \grace sol8 fad4 r r2
    R1*5

    %42
    r8 si,\solo(la) sol\tr fad \tuplet 3/2 { fad16 sol la } sol8 fad\tr
    mi si'(la) sol\tr fad \tuplet 3/2 { fad16 sol la } sol8 fad\tr
    mi16(dod') dod(re) re(fad,) fad(mi) mi(dod') dod(re) re(fad,) fad(mi)

    %45
    mi la dod mi la dod mi dod la la, dod mi la dod mi dod\mbreak
    la4 r r2
    r r8 la, si16 sol' fad mi

    %48
    re dod re sol, \grace fad8 mi4 re r
    R1*14
    r4 r8 si'16.\solo do32 re8 re4 mi8

    %64
    re16(sol) re4 mi8 re16(sol) re4 do8\tr
    si16(re) do(mi) re(fa) mi(sol) fa8 fa~fa16 fa mi re
    mi8 mi~mi16 mi re mi fa8 fa~fa16 fa mi re

    %67
    mi8 re r4 r2
    R1*5
    r2 re16\solo sol, fa' sol, mi' sol, re' sol,

    %74
    mi' sol, sol' sol, fa' sol, mi' sol, re' sol, fa' sol, mi' sol, re' sol,
    mi'8 re r4 r2\mbreak
    R1

    %77
    r4 sol16(fa) la(sol) \grace sol8 fa4 fa16(mi) sol(fa)
    \grace fa?8 mi4 sol8 la16. sib32 \grace sib8 la8.[sol16 \grace sol8 fa8. mi16]
    re sol, si re sol si re si sol sol, si re sol si re si

    %80
    sol4 r r2
    R1*3  %% terzine p. 7
    r8 do,16(sol) \tuplet 3/2 { la si do do[si la] sol la sib sib[la sol] fa sol la la[sol fa] }

    %85
    mi16 [mi'] \tuplet 3/2 { mi [fa mi] mi[fa mi] mi fa mi } mi [mi] \tuplet 3/2 { mi fa mi mi[fa mi] mi fa mi }
    mi8 mi4 mi8 re16. re32 mi16. fa?32 \grace mi8 re4\tr\mbreak
    do4 r r2

    %88
    R1*9
    r8 si\solo si4~si8 la16. si32 do8 do
    si mi4 re8~re do16. re32 do8 si

    %99
    la la'4 sol8~sol fad16. sol32 la8 do,\mbreak
    si4 r r2
    R1*4
    r4 r8 si16.\soli do32 re8 re4 mi8\mbreak
    \grace re4 do4. re8 \grace do4 si4. do8

    %107
    la re16(la) do(si) la(sol) fad mi re8 r4
    r8 re'16(la) do(si) la(sol) mi'8 mi~mi16 sol fad mi
    re8 re~re16 fa mi re do8 do~do16 mi re do

    %110
    si(do) do(re) re(do) do(si) si(do) do(re) re(do) do(si)
    si sol' sol4 si,8 la16 re re, re re4\mbreak
    re16 re' re, re re4\tr re16 re' re, re re4\tr

    %113
    R1*3
    r4 sol16_\upl si(do re) sol,_\upl do(re mi) sol,_\upl re'(mi fa)
    \grace fa?8 mi4 r r2\mbreak

    %118
    r8 mi8(re do) si \tuplet 3/2 { si16 do re } do8 si
    la16 (fad') fad(sol) sol(si,) si(la) la (fad') fad(sol) sol(si,) si(re)
    si8 la r4 r2

    %121 p. 9
    R1*7
    si8 re~re \tuplet 3/2 { la16 si do } si8 re~re\tuplet 3/2 { la16 si do }
    si8 sol'32(fad mi re) do8 si la16 re, fad la re fad la fad\mbreak

    %130
    re re, fad la re fad la fad re4 r
    R1*3\mbreak
    r2 r8 sol16(re) \tuplet 3/2 {
        mi[fad sol] sol fad mi

        %135
        re mi fa fa[mi re] do re mi mi[re do]
    } si sol si re sol si re si
    sol sol, si re sol si re si sol8 la si do
    re4 re, sol,4 r

    %138
    R1*3

}

Ivcn = \relative do {

    R1*19
    r4 r8 sol'16.\solo la32 si8 si4 do8
    si si4 do8\mbreak si si4 la8\tr

    %22
    \grace la sol4 r r2
    R1
    r4 r8 sol fad16 re la' re, sol re fad re

    %25
    sol(la si4) sol8 fad16 re la' re, sol re fad re
    sol8 fad r4 r2
    R1*5

    %32
    r2 dod'16 la mi' la, re la dod la
    re la fad' la, mi' la, re la dod la mi' la, re la dod la\mbreak
    re8 dod r4 r2

    %35
    R1*2
    r4 re,16\upl fad(sol la) re,\upl sol(la si) re,\upl la'(si do?)
    \grace do8 si4 r r2

    %39
    R1*3
    r8 sol\solo(fad) mi\tr re \tuplet 3/2 { re16(mi fad) } mi8 re\tr
    dod sol'(fad) mi\tr re \tuplet 3/2 { re16(mi fad) } mi8 re\tr

    %44
    dod16(mi) mi (fad) fad(re) re(dod) dod(mi) mi(fad) fad(re) re(dod)
    dod la dod mi la dod mi dod la la, dod mi la dod mi dod\mbreak
    la4 r r2

    %47
    r r8 fad sol16 si la sol
    fad(mi re) mi \grace re8 dod4 re r
    R1*14

    %63
    r4 r8 sol16.\solo la32 si8 si4 do8
    si si4 do8\mbreak si si4 la8\tr
    sol16(si) la(do) si(re) do(mi) re8 re~re16 re do si

    %66
    do8 do~do16 do si do re8 re~re16 re do si
    do8 si r4 r2
    R1*5

    %73
    r2 si16\solo sol re' sol, do sol si sol
    do sol mi'sol, re' sol, do sol si sol re' sol, do sol si sol
    do8 si r4 r2\mbreak

    %76
    R1
    r4 mi16(re) fa(mi) \grace mi8 re4 re16(do) mi(re)
    \grace re8 do4 mi8 fa16. sol32 \grace sol8 fa8. mi16 \grace mi8 re8. do16

    %79
    \once\stemDown si sol, si re sol si re si sol sol, si re sol si re si
    sol4 r r2
    R1*3

    %84
    r8 mi \tuplet 3/2 { fa16[(sol la)] la(sol fa) mi[(fa sol)] sol(fa mi) re[(mi fa)] fa(mi re) }
    do [do'] \tuplet 3/2 { do16(re do) do[(re do)]  do(re do)} do [do] \tuplet 3/2 { do(re do) do[(re do)] do[(re do)] }
    do8 do4 do8 si16. si32 do16. re32 \grace do8 si4\tr

    %87
    do4 r r2
    R1*9
    r8 sol\solo sol4~sol8 fad16. sol32 la8 la

    %98
    sol do4 si8~si la16. si32 la8 sol
    fad do'4 si8~si la16. si32 do8 la\mbreak
    sol4 r r2

    %101
    R1*4
    r4 r8 sol16.\soli la32 si8 si4 do8\mbreak
    \grace si4 la4. si8 \grace la4 sol4. la8

    %107
    fad4 r r8 re'16(la) do(si) la(sol)
    fad mi re8 r4 r16 sol la si la8 la~
    la16 fad sol la sol8 sol~sol16 mi fad sol fad8 fad

    %110
    sol16(la) la(si) si(la) la(sol) sol(la) la(si) si(la) la(sol)
    sol(si) si4 sol8 fad4 re16 re' re, re\mbreak
    re4\tr re16 re' re, re re4\tr re16 re' re, re

    %113
    re4\tr r r2
    r4 re16\upl fad(sol la) re,\upl sol(la si) re,\upl la'(si do)
    \grace do8 si4 r r2

    %116
    R1*2
    r8 do(si) la sol\tuplet 3/2 { sol16 (la si) } la8 sol
    fad16(la) la(si) si(sol) sol(fad) fad(la) la(si) si(sol) sol(si)

    %120
    sol8 fad r4 r2
    R1*7
    sol8 sol~sol \tuplet 3/2 { fad16 sol la } sol8 sol~sol\tuplet 3/2 { fad16 sol la }

    %129
    sol8 si la sol \once\stemDown fad16 re, fad la re fad la fad
    re re, fad la re fad la fad re4 r
    R1*3

    %134
    r2 r8 si'\noBeam \tuplet 3/2 {
        do16 re mi mi[re do]
        si do re re[do si] la si do do[si la]
    } sol sol, si re sol si re si
    sol sol, si re sol si re si sol8 la si do

    %137
    re4 re, sol, r
    R1*3

}

Ibcn = \relative do {

    sol8\tuplet 3/2 { si16 la sol } re'8 re re \tuplet 3/2 { fad16 mi re } sol8 si
    la16 do fad, la re,8 do si16 la sol8 r4
    sol' sol sol sol

    %4
    sol re sol,8\tuplet 3/2 { si16 la sol } re'8 re
    re \tuplet 3/2 { fad16 mi re } sol8 sol re'4 re
    r8 sol,16 la si8 si16 do re4 re

    %7
    sol,8 re' r4\mbreak re,\p re
    r8 sol,16 la si8 si16 do re4 re
    sol,8 re r4 re'8\f \tuplet 3/2 { fad16 mi re } la'8 la

    %10
    la \tuplet 3/2 { dod16 si la } re8 re, la'4 la
    re,8 re16 mi fad8 fad16 sol la4 la
    re, r r8 fad sol sol,

    %13
    re'4 r r8 fad\p sol sol,
    re'\f re re re\mbreak re re re re
    re8. mi16 re do si la sol8 \tuplet 3/2 { si16 la sol } re'8 re

    %15
    re\tuplet 3/2 { fad16 mi re } sol8 si la16 do fad, la re,8 do
    si si do dod re sol16 si, do?8 re
    sol,4 r r2

    %19
    R1
    r2 sol'4\p sol
    sol sol\mbreak sol re

    %22
    sol,8 si16 re sol8 r r2
    R1
    r2 re4 re

    %25
    r8 sol,16 la si8 si16 do re4 re
    sol,8 re' r4 r2
    R1*5

    %32
    r2 la4 r8 la
    la4 r8 la la4 r8 la\mbreak
    re, la' r4 r2

    %35
    r4 r8 sol' fad re dod la
    re4 r r2
    r4 r8 do! si sol fad re

    %38
    sol4 r  r2
    R1*3
    re'4\p r8 \tuplet 3/2 { la16 (si dod) } re4 r8 re,32(mi fad sol)

    %43
    la4 r8 \tuplet 3/2 { la16 (si dod) } re4 r8 re,32(mi fad sol)
    la8 la la la la la la la
    la4 la la la\mbreak

    %46
    la r r2
    r r8 re sol sol,
    la si16 sol la8 la re\f \tuplet 3/2 { fad16 mi re } la'8 la

    %49
    la \tuplet 3/2 { dod16 si la } re8 fad mi16 sol dod, mi la,8 sol
    fad16 mi re8 r4 re' re
    re re re la

    %52
    re,8 \tuplet 3/2 { fad16 mi re } la'8 la\mbreak la \tuplet 3/2 { dod16 si la } re8 re,16. mi32
    fad8 fad fad fad sol sol sol sol
    sold sold sold sold la4 r

    %55
    r8 dod, re re, la'4 r
    r8 dod\p re re, la'\f la la la
    la la la la la4 r8 dod\mbreak

    %58
    re16 re' re dod si la sol fad mi8 re la' la,
    re4 r r2
    R1*3

    %63
    r2 sol4\p sol
    sol sol\mbreak sol re
    sol, r r16 sol si re sol4

    %66
    r16 sol, do mi sol4 r16 sol, si re sol8 sol
    do, sol r4 r2
    R1*5

    %73
    r2 sol4\p r8 sol
    sol4 r8 sol sol4 r8 sol
    do, sol' r4 r2\mbreak

    %76
    R1
    r2 sol'8 sol, r4
    do8 do, r4 fa fa

    %79
    sol sol sol sol
    sol r r2
    R1*3

    %84
    do8\p r do r do r si r
    do do' do, si la la' la, sol
    fad! fad fad fad sol do sol'[sol,]\mbreak

    %87
    do\f \tuplet 3/2 { mi16 re do } sol'8 sol sol \tuplet 3/2 { si16 (la sol) } do8 mi
    re16 fa si, re sol,8 fa? mi16 re do8 r mi
    re do si do sol' sol, r mi'\p

    %90
    re do si do sol'\f sol sol sol
    sol sol sol sol sol4 r8 si
    do mi, fa fad sol do16 mi, fa8 sol\mbreak

    %93
    do,4 r r2
    R1*3
    r4 r8 sol32\p(la si do) re4 re,

    %98
    sol sol do do
    re re re re\mbreak
    sol,8\f \tuplet 3/2 { si16(la sol) } re'8 re re \tuplet 3/2 { fad16 mi re } sol8 sol

    %102
    re'4  re sol,8 re r4
    R1*3
    re8.\p mi16 re do si la sol8 sol'16. fad32 sol8 mi\mbreak

    %107
    r fad16. mi32 fad8 re r mi16. re32 mi8 do
    re fad sol sol, re' fad sol sol,
    re' fad sol si, do do do do

    %110
    si si si si la la la la
    sol4 r8 re' sol4 r8 re
    sol,4 dod re r8 re\mbreak

    %113
    re4 r8 re re4 r8 re
    sol, re' r4 r2
    r4 r8 do si sol fad re

    %116
    sol sol' r4 r2
    r4 r8 fa mi do si sol
    do4 r r2\mbreak

    %119
    r4 r8 \tuplet 3/2 { re16(mi fad) } sol4 r8 sol,32(la si do)
    re8 re re re re re re re
    re4 \f r r8 fad sol sol,

    %122
    re'4 r r8 fad\p sol sol,
    re'8. mi16 re do si la sol4 r
    R1*5

    %129
    sol8 \tuplet 3/2 { si16 la sol } re'8 r sol,\tuplet 3/2 { si16 la sol } re'8 r
    sol,4 do8 dod re4 re\mbreak
    re re re r

    %132
    R1*3
    r2 sol,8\p r sol r
    sol r fad r sol r sol r

    %137
    sol r sol r sol la si do
    re4 re, sol8\f \tuplet 3/2 { si16 la sol } re'8 re\mbreak
    re\tuplet 3/2 { fad16 mi re } sol8 si la16 do fad, la re,8 do

    %139
    si si do dod re sol16 si, do?8 re
    sol,4 r r2

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key sol\major
    \tempo 4 = 75
    s1*140
    \bar "|."

}

IflI = {
    \notypeset
    <<\IflIn \forma>>

}

IflII = {
    <<\IflIIn \forma>>

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

Ivdg = {
    \clef alto
    <<\Ivdgn \forma>>

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



IIflIn = \relative do'' {

    R2.*16
    fad4\solo fad8(sol) sol(la)
    \grace la4 sol2 fad4

    %19
    si8.(dod16 re4) \grace dod8 si4
    si\tr la r\mbreak
    sol8 dod16(re mi8) sol,(fad mi)

    %22
    fad re'4 la sol16(fad)
    sol8 dod16(re mi8) sol,(fad mi)
    fad4\tr mi r

    %25
    R2.*8
    mi8 la,4 sol'8 sol16(fad) fad(mid)
    fad2.~

    %35
    fad8 fad16(sold la8) sold16(la si8) la
    sold2.
    la,8 la'4 sold fad8~

    %38
    fad mi4 re dod8~
    dod la'16(fad) re4 dod\tr
    si r r\mbreak

    %41
    r16 sold'(la si) si8 re, \grace re dod4
    si r r
    R2.*4

    %47
    r8 dod16(re mi8) dod \grace dod re4
    dod r r
    r8 la'16(si dod8) si16(dod re8) dod~\mbreak

    %50
    dod8 sold16(la si8) la16 (si dod8) si
    la fad16(re) dod4 si\tr
    la2 r4

    %53
    R2.*18
    r8 sol'\solo sol16(fad) fad(mi) mi(re) re(do)
    si8 [si'(la si)] la16.(si64 do) si8

    %73
    la4 r r
    R2.
    r8 fad (sol la si do)

    %76
    re\noBeam  si16.(do64 re) do8\noBeam la16.(si64 do) si8[sol]
    \grace fad16 mi8 re16 do si4 la\tr \mbreak
    sol r r

    %79
    R2.*6
    fad'4 \solo fad8(sol) sol(la)
    \grace la4 sol2 fad4

    %87
    si8. (dod16 re4) \grace dod8 si4\mbreak
    si\tr la r
    sol8 dod16(re mi8) sol,(fad mi)

    %90
    fad re'4 la sol16(fad)
    sol8 dod16\parentSlur (re mi8) sol,(fad mi)
    fad4\tr mi r

    %93
    la8 re,4 do'8 do16(si) si(lad)
    si2.~
    si8 si16 \parentSlur (dod re8) dod16 \parentSlur  (re mi8) re\mbreak

    %96
    dod2.
    re,8 re'4 dod si8~
    si la4 sol fad8~

    %99
    fad re'16(si) sol4(fad\tr)
    mi r r
    r8 \tuplet 3/2 { mi16(fad sol) }  sol4(fad\tr)

    %102
    mi r r
    R2.*3
    r8 fad16(sol la8) fad \grace fad sol4

    %107
    fad r r
    r8 fad fad16(mi) sol(fad) fad(mi) sol(fad)
    fad4 r r

    %110
    r8 fad fad16(mi) sol(fad) fad(mi) sol(fad)
    fad2.~
    fad16. si32 la16. sol32 fad4 mi\tr\mbreak

    %113
    re4 r r
    R2.*3

}

IIflIIn = \relative do'' {

    R2.*16
    re4\solo re8(mi) mi(fad)
    \grace fad4 mi2 re4

    %19
    sol8.(la16 si4) \grace la8 sol4
    sol\tr fad r\mbreak
    mi8 mi16(fad sol8) mi(re dod)

    %22
    re8 fad4 fad mi16(re)
    mi8 mi16(fad sol8) mi(re dod)
    re4\tr dod r

    %25
    R2.*9
    la8 re,4 do'8 do16(si) si(lad)
    si2.~

    %36
    si8 si16(dod re8) dod16\parentSlur (re mi8) re
    dod dod4 mi re8~
    re dod4 si la8~
    la fad'16(re) si4 la\tr

    %40
    sold r r\mbreak
    r16 si (dod re) re8 si \grace si la4
    sold r r

    %43
    R2.*4
    r8 la16(si dod8) la \grace la si4
    la r r

    %49
    r8 dod16(re mi8) re16(mi fad8) mi\mbreak
    mi8 si16 (dod re8) dod16(re mi8) re
    dod re16 (si) la4 sold\tr

    %52
    la2 r4
    R2.*18
    r8 mi'\solo mi16(re) re(do) do(si) si(la)

    %72
    sol8[sol'(fad sol)] fad16.(sol64 la) sol8
    fad4 r r
    R2.

    %75
    r8 re(mi fad sol la)
    si\noBeam sol16.(la64 si) la8\noBeam fad16.(sol64 la) sol8[re]
    \grace re16 do8 si16 la sol4 fad\tr \mbreak

    %78
    sol r r
    R2.*6
    re'4\solo re8(mi) mi(fad)

    %86
    \grace fad4 mi2 re4
    sol8.(la16 si4) \grace la8 sol4
    sol\tr fad r\mbreak

    %89
    mi8 mi16(fad sol8) mi(re dod)
    re8 fad4 fad mi16(re)
    mi8 mi16(fad sol8) mi(re dod)

    %92
    re4\tr dod r
    R2.
    re8 sol,4 fa'8 fa16(mi) mi(red)

    %95
    mi2.~\mbreak
    mi8 mi16(fad? sol8) fad16(sol la8) sol
    fad fad4 la sol8~

    %98
    sol fad4 mi re8~
    re si'16(sol) mi4(re\tr)
    dod r r

    %101
    r8 \tuplet 3/2 { dod16 (re mi) } mi4(re\tr)
    dod r r
    R2.*3

    %106
    r8 re16(mi fad8) re \grace re mi4
    re r r
    r8 re re16(dod) mi(re) re(dod) mi(re)

    %109
    re4 r r
    r8 re re16(dod) mi(re) re(dod) mi(re)
    re2.~

    %112
    re16. sol32 fad16. mi32 re4 dod\tr\mbreak
    re4 r r
    R2.*3

}


IIvlIn = \relative do'' {

    fad,4 fad8(sol) sol(la)
    \grace la4 sol2 fad4
    si8.(dod16) re4 \grace dod8 si4

    %4
    si\tr la r
    sol8 dod16(re mi8) sol,(fad mi)
    fad re'4 la sol16(fad)

    %7
    sol8 dod16(re mi8) sol,(fad mi)
    fad4\tr sol r
    la8 re,4 do'8 do16(si) si(lad)

    %10
    si2.~\mbreak
    si8 si16(dod! re8) dod16(re mi8) re
    dod2.

    %13
    re,8 re'4 do si8~
    si la4 sol fad8~
    fad16 si(la sol) fad4 mi\tr

    %16
    re2 r4
    re2\p re4
    la' la si

    %19
    sol sol sol
    re8 re'16 dod re8 la fad re\mbreak
    la'4 la la

    %22
    la la la
    la la la
    re,8 la'16 sold la8 mi dod la

    %25
    R2.*8
    dod4 dod dod
    re re re

    %35
    red red red
    mi mi mi
    fad dod re

    %38
    sold mi fad
    re2 red4
    mi r r\mbreak

    %41
    mi r8 sold la la,
    mi'4 r r
    R2.*4

    %47
    la2 mi4
    la, r r
    la la la\mbreak

    %50
    mi' mi mi
    fad8 re mi re mi mi
    la,4 r r

    %53
    R2.*2
    dod'4\tu dod8(re) re( mi)
    \grace mi4 re2 dod4

    %57
    fad8.(sold16 la4) \grace sold8 fad4
    fad\tr mi r
    re8 sold16(la si8) re,(dod si)\mbreak

    %60
    dod la'4 mi re16 dod
    re8 sold16(la si8) re,(dod si)
    dod8.\tr si16 la4 r

    %63
    R2.*8
    mi2\p fad4
    sol r8 sol do, dod

    %73
    re4 r r
    R2.
    re4 r8 do'(si la)

    %76
    sol4 re sol,8 si
    do4 re8 do re re\mbreak
    sol,4 r r

    %79
    R2.*2
    sol8\f sol'16. fad32 sol8 re si sol
    dod! sol'16. fad32 sol8 mi dod la

    %83
    re re'16. dod32 re8 si sold si16(re,)
    dod8.\tr si16 la4 r
    re2\p re4

    %86
    la' la si
    sol sol sol\mbreak
    re8 re'16. dod32 re8 la fad re

    %89
    la2.~
    la~
    la~

    %92
    la8 la'16. sold32 la8 mi dod la
    fad'4 fad fad
    sol sol sol

    %95
    sold sold sold\mbreak
    la la la
    si fad sol

    %98
    dod, la re
    sol2 sold4
    la r r

    %101
    la r8 dod re re,
    la'4 r r
    R2.*3

    %106
    re2 la4
    re, r r
    re2.

    %109
    si
    la
    sold

    %112
    la\mbreak
    re8\f re'16. dod32 re8 la fad re
    si si'16. lad32 si8 fad re si

    %115
    sold16. re''32 re16. fad,32 fad4(mi\tr)
    re2 r4

}

IIvlIIn = \relative do'' {

    re,4 re8(mi) mi(fad)
    \grace fad4 mi2 re4
    sol8. la16 si4 \grace la8 sol4

    %4
    sol\tr fad r
    mi8 mi16(fad sol8) mi(re dod)
    re fad4 fad mi16\parentSlur (re)

    %7
    mi8 mi16(fad sol8) mi(re dod)
    re4\tr dod r
    R2.

    %10
    re8 sol,4 fa'8 fa16(mi) mi(red)\mbreak
    mi2.~
    mi8 mi16(fad sol8) fad16 (sol la8) sol

    %13
    fad fad4 la sol8~
    sol fad4 mi re8~
    re16 sol(fad mi) re4 dod\tr

    %16
    re2 r4
    re2\p re4
    la' la si

    %19
    sol sol sol
    re8 re'16 dod re8 la fad re\mbreak
    la'4 la la

    %22
    la la la
    la la la
    re,8 la'16 sold la8 mi dod la

    %25
    R2.*8
    dod4 dod dod
    re re re

    %35
    red red red
    mi mi mi
    fad dod re

    %38
    sold mi fad
    re2 red4
    mi r r\mbreak

    %41
    mi r8 sold la la,
    mi'4 r r
    R2.*4

    %47
    la2 mi4
    la, r r
    la la la\mbreak

    %50
    mi' mi mi
    fad8 re mi re mi mi
    la,4 r r

    %53
    R2.*2
    la'4\f la8(si) si(dod)
    \grace dod4 si2 la4

    %57
    re8.(mi16 fad4) \grace mi8 re4
    re\tr dod r
    si8 si16(dod re8) si(la sold)\mbreak

    %60
    la dod4 dod si16(la)
    si8 si16(dod re8) si(la sold)
    la la16. sold32 la8 sol fad mi

    %63
    re4 r r
    R2.*7
    mi2\p fad4
    sol r8 sol do, dod

    %73
    re4 r r
    R2.
    re4 r8 do'(si la)

    %76
    sol4 re sol,8 si
    do4 re8 do re re\mbreak
    sol,4 r r

    %79
    R2.*2
    sol8\f sol'16. fad32 sol8 re si sol
    dod! sol'16. fad32 sol8 mi dod la

    %83
    re re'16. dod32 re8 si sold si16(re,)
    dod8.\tr si16 la4 r
    re2\p re4

    %86
    la' la si
    sol sol sol\mbreak
    re8 re'16. dod32 re8 la fad re

    %89
    la2.~
    la~
    la~

    %92
    la8 la'16. sold32 la8 mi dod la
    fad'4 fad fad
    sol sol sol

    %95
    sold sold sold\mbreak
    la la la
    si fad sol

    %98
    dod, la re
    sol2 sold4
    la r r

    %101
    la r8 dod re re,
    la'4 r r
    R2.*3

    %106
    re2 la4
    re, r r
    re2.

    %109
    si
    la
    sold

    %112
    la\mbreak
    re8\f re'16. dod32 re8 la fad re
    si si'16. lad32 si8 fad re si

    %115
    sold16. re''32 re16. fad,32 fad4(mi\tr)
    re2 r4

}

IIvlan = \relative do' {

    re2 re4
    \grace re dod2 re4
    re sol, sol

    %4
    re8 re'16. dod32 re8 la fad re
    la'4 la la
    la la la

    %7
    la la la
    la la8 mi' dod la
    fad4 la re

    %10
    sol, re' sol,\mbreak
    sold si si
    la mi' la,

    %13
    si fad sol?
    dod! la si
    sol la la

    %16
    re,8 re'16. dod32 re8 la fad la
    re,2\p re'4
    la' la si

    %19
    sol sol sol
    re8 re'16 dod re8 la fad re\mbreak
    la'4 la la

    %22
    la la la
    la la la
    re,8 la'16 sold la8 mi dod la

    %25
    R2.*8
    dod4 dod dod
    re re re

    %35
    red red red
    mi mi mi
    fad dod re

    %38
    sold mi fad
    re2 red4
    mi r r \mbreak

    %41
    mi r8 sold la la,
    mi'4 r r
    R2.*4

    %47
    la2 mi4
    la, r r
    la la la\mbreak

    %50
    mi' mi mi
    fad8 re mi re mi mi
    la,4 r r

    %53
    R2.*2
    la'2\f la4
    \grace la sold2 la4

    %57
    la re, re
    la8 la'16. sold32 la8 mi dod la
    mi'4 sold, mi'\mbreak

    %60
    mi mi mi
    mi sold, mi'
    mi8 la16. sold32 la8 sol fad mi

    %63
    re4 r r
    R2.*7
    mi2\parenthesize \p fad4

    %72
    sol r8 sol do, dod
    re4 r r
    R2.

    %75
    re4 r8 do'(si la)
    sol4 re sol,8 si
    do4 re8 do re re\mbreak

    %78
    sol,4 r r
    R2.*2
    sol8\parenthesize \f sol'16. fad32 sol8 re si sol

    %82
    dod! sol'16. fad32 sol8 \parenthesize mi \parenthesize dod \parenthesize la
    re, re'16. dod32 re8 si sold mi
    la' la, la' sol? fad mi

    %85
    re2\p re4
    la' la si
    sol sol sol\mbreak

    %88
    re8 re'16. dod32 re8 la fad re
    la2.~
    la~

    %91
    la~
    la8 la'16. sold32 la8 mi dod la
    fad'4 fad fad

    %94
    sol sol sol
    sold sold sold\mbreak
    la la la

    %97
    si fad sol
    dod, la re
    sol2 sold4

    %100
    la r r
    la r8 dod re re,
    la'4 r r

    %103
    R2.*3
    re2 la4
    re, r r

    %108
    re2.
    si
    la

    %111
    sold
    la\mbreak
    re8\f re'16. dod32 re8 la fad re

    %114
    si si'16. lad32 si8 fad re si
    sold16. fad'32 fad16. re32 re4(dod\tr)
    re2 r4

}

IIvdgn = \relative do' {

    R2.*24
    dod4\solo dod8(re) re (mi)
    \grace mi4 re2 dod4

    %27
    fad8. sold16 la4 \grace sold8 fad4
    fad\tr mi r
    re8 sold16(la si8) re,(dod si)

    %30
    dod8 la'4 mi re16 dod
    re8 sold16 \parentSlur (la si8) re,(dod si)\mbreak
    dod4\tr si r

    %33
    R2.*7
    r8 si16\solo(dod re8) dod16(re mi8) dod\mbreak
    si4 r r

    %42
    r8 si16(dod re8) dod16\parentSlur (re mi8)  re
    dod dod16(re mi8) re16(mi fad8) mi
    re si'4 la sol!8~

    %45
    sol fad4 mi re8
    dod fad16(re) dod4 si\tr
    la r r

    %48
    r8 dod16(re mi8) dod \grace dod re4
    dod r r\mbreak
    R2.*2

    %52
    r8 dod16(re mi8) re16(mi fad8) mi
    re si16(dod re8) dod16\parentSlur (re mi8) re
    dod16(la') fad(re) dod4 si\tr

    %55
    la2 r4
    R2.*7
    fad'4\soli fad8(sol) sol(la)

    %64
    \grace la4 sol2 fad4
    la8(sol fad mi re do)
    \grace do? si4\tr la r

    %67
    re8 sol,4 fa'8 fa16(mi) mi (red)
    mi2.~
    mi8 mi16(fad sol8) fad16(sol la8) sol\mbreak  %% fine 1mo sistema p 13

    %70
    fad8 fad16(sol la8) sol16(la si8) la
    sol4 r r
    R2.

    %73
    r8 mi mi16(re) re(do) do(si) si(la)
    si8 [si(la si)] la16.(si64 do) si8\noBeam
    la4 r r

    %76
    R2.*2\mbreak
    r8 si(do re mi fa)
    mi\noBeam do16.(re64 mi) re8\noBeam si16.(do64 re) do8\noBeam la16.(si64 do)

    %80
    si16 (sol') mi(do) si4 la\tr
    sol4 r r
    R2.*7

    %89
    r8 la'-.(la-. la-. la-. la-.)
    la,4 r r
    r8 la'-.(la-. la-. la-. la-.)

    %92
    la,4 r r
    R2.*7
    r8 mi'16(fad sol8) fad16(sol la8) fad

    %101
    mi4 r r
    r8 mi16(fad sol8) fad16(sol la8) sol
    fad fad16(sol la8) sol16(la si8) la

    %104
    sol si4 la sol8\mbreak
    fad si16(sol) fad4 mi\tr
    re r r

    %107
    r8 fad16(sol la8) fad \grace fad sol4
    fad r r
    r8 fad fad16(mi) sol(fad) fad(mi) sol(fad)

    %110
    fad4 r r
    re'16 (fad) si,(re) sold,(si) re,(fad) si,(re) sold,(si)
    la2.\mbreak

    %113
    re4 r r
    R2.*3

}

IIvcn = \relative do {

    R2.*24
    la'4\solo la8(si) si(dod)
    \grace dod4 si2 la4

    %27
    re8.(mi16 fad4) \grace mi8 re4
    re\tr dod r
    si8 si16(dod re8) si(la sold)

    %30
    la dod4 dod si16 la
    si8 si16(dod re8) si(la sold)\mbreak
    la4\tr sold r

    %33
    R2.*7
    r8 sold16\solo(la si8) la16(si dod8) la\mbreak
    sold4 r r

    %42
    r8 sold16(la si8) la16(si dod8) si
    la la16(si dod8) si16(dod re8) dod
    si re4 dod mi8~

    %45
    mi re4 dod si8
    la re16(si) la4(sold\tr)
    la r r

    %48
    r8 la16(si dod8) la \grace la si4
    la r r\mbreak
    R2.*2

    %52
    r8 la16(si dod8) si16(dod re8) dod
    si sold16(la si8) la16(si dod8) si
    la16(dod) re(si) la4 sold\tr

    %55
    la2 r4
    R2.*7
    re4\solo re8(mi) mi(fad)

    %64
    \grace fad4 mi2 re4
    do8(si la sol fad la)
    sol4\tr fad r

    %67
    R2.
    sol8 do,4 sib'8 sib16 la la sold
    la2.~\mbreak

    %70
    la8 la16(si do8) si16(do re8) do
    si4 r r
    R2.

    %73
    r8 do do16(si) si(la) la(sol) sol(fad)
    sol8 sol[(fad sol)] fad16.(sol64 la) sol8\noBeam
    fad4 r r

    %76
    R2.*2
    r8 sol(la si do re)
    do\noBeam la16.(si64 do) si8\noBeam sol16.(la64 si) la8\noBeam fad16.(sol64 la)

    %80
    sol8. la16 sol4 fad\tr
    sol r r
    R2.*8

    %90
    r8 la-.(la-. la-. la-. la-.)
    la,4 r r
    R2.*8

    %100
    r8 dod'16(re mi8) re16(mi fad8) re
    dod4 r r
    r8 dod16(re mi8) re16(mi fad8) mi

    %103
    re re16(mi fad8) mi16(fad sol8) fad
    mi sol4 fad mi8\mbreak
    re8. mi16 re4 dod\tr

    %106
    re r r
    r8 re16(mi fad8) re \grace re mi4
    re r r

    %109
    r8 re re16(dod) mi(re) re(dod) mi(re)
    re4 r r
    re16(fad) si,(re) sold,(si) re,(fad) si,(re) sold,(si)

    %112
    la2.\mbreak
    re4 r r
    R2.*3

}

IIbcn = \relative do {

    re2 re4
    la la si
    sol sol sol

    %4
    re'8 re'16. dod32 re8 la fad re
    la4 la la
    la la la

    %7
    la la la
    re8 la'16. sold32 la8 mi dod la
    fad4 fad fad

    %10
    sol sol sol\mbreak
    sold sold sold
    la la la

    %13
    si fad sol?
    dod! la si
    sol la la

    %16
    re,8 re'16. dod32 re8 la fad la
    re,4 r r
    R2.*7

    %25
    la'2\p la4
    mi' mi fad
    re re re

    %28
    la8 la'16. sold32 la8 mi dod la
    mi'4 mi mi
    mi mi mi

    %31
    mi mi mi\mbreak
    la,8 mi'16. red32 mi8 si sold mi
    R2.*7

    %40
    mi'4 mi mi\mbreak
    mi r r
    mi mi mi

    %43
    mi mi mi
    mi fad dod
    re sold mi

    %46
    fad8 re mi4 mi,
    la r r
    la'2 mi4

    %49
    la, r r\mbreak
    R2.*2
    la4\p la la

    %53
    mi' mi mi
    fad8 re mi re mi mi,
    la2 la'4

    %56
    mi mi fad
    re re re
    la8 la'16. sold32 la8 mi dod la

    %59
    mi'4 mi mi\mbreak
    mi mi mi
    mi mi mi

    %62
    la,8 la'16. sold32 la8 sol fad mi
    re2 re4
    la la re,

    %65
    re'2.
    sol,8 re'16. dod!32 re8 do si la
    si4 si si

    %68
    do do do
    dod! dod dod\mbreak
    re re re

    %71
    mi r r
    R2.
    re2 re4

    %74
    sol, r8 sol' do, dod
    re4 r r
    R2.*2\mbreak

    %78
    sol,4 r8 fa' mi si
    do4 sol' re
    sol,8 do re do re re,

    %81
    sol\f sol'16. fad32 sol8 re si sol
    dod! sol'16. fad32 sol8 mi dod la
    re re'16. dod32 re8 si sold mi

    %84
    la la, la' sol! fad mi
    re4 r r
    R2.*3

    %89
    la4 la la
    la la la
    la la la

    %92
    re8 la'16. sold32 la8 mi dod la
    R2.*7
    la4\p la la

    %101
    la r r
    la la la
    re re re

    %104
    mi dod la\mbreak
    re8 sol la sol la la,
    re4 r r

    %107
    re2 la4
    re,2 r4
    si'2.

    %110
    la
    sold
    la\mbreak

    %113
    re8\f re'16. dod32 re8 la fad re
    si si'16. lad32 si8 fad re si
    sold4 la la

    %116
    re,2 r4

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/4
    \key re\major
    \tempo 4 = 65
    s2.*116
    \bar "|."

}

IIflI = {
    \notypeset
    <<\IIflIn \forma>>

}

IIflII = {
    <<\IIflIIn \forma>>

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

IIvdg = {
    \clef alto
    <<\IIvdgn \forma>>

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



IIIflIn = \relative do'' {

    R4.*36
    re4.\solo
    do

    %39
    si8 do16 re mi fad
    sol8(fad mi)
    re4.

    %42
    do
    si8 la r
    re re16(do) mi(re)

    %45
    \grace re8 do4 r8
    do do16(si) re (do)\mbreak
    \grace do8 si4 r8

    %48
    re(si') la
    \grace la sol4 fad8~
    \tuplet 3/2 { fad16 (sol la) } sol8[fad]

    %51
    fad\tr mi r
    fad(re') fad,
    \grace sol16 fad8 mi r

    %54
    fad si16 la sol fad
    sol4.~
    sol16 mi la sol fad mi

    %57
    fad4.~
    fad8 mi re
    \grace re dod4 re8

    %60
    mi re16 (dod re mi)\mbreak
    \grace re8 dod4 r8
    R4.*29
    fad8\solo mi8.[(fad32 sol)]
    fad8\noBeam mi8.(fad32 sol)

    %93
    la8\noBeam la16(sol) sol(fad)
    \grace fad4 sol4.
    sol8 sol16(fad) fad(mi)

    %96
    \grace mi4 fad4.
    re8(sol) fad
    re(si') la

    %99
    re,\noBeam \tuplet 3/2 { mi16(fad sol) } fad8\noBeam
    re\noBeam \tuplet 3/2 { sol16(la si) } la8\noBeam
    dod(re) fad,

    %102
    fad mi r\mbreak
    R4.*11
    r16 la, si dod re mi

    %115
    \tuplet 3/2 { fad(mi re) }  dod8.[(re32 mi)]
    \tuplet 3/2 { re16(dod si) } la4\mbreak
    \tuplet 3/2 { fad'16(mi re) }  dod8.[(re32 mi)]

    %118
    \tuplet 3/2 { re16(dod si) } la4
    \tuplet 3/2 { sol'16(la si) } si8.[(la32 sol)]
    \tuplet 3/2 { fad16(sol la) } la8.[(sol32 fad)]

    %121
    \tuplet 3/2 { mi16(fad sol) } sol8.[(fad32 mi)]
    \tuplet 3/2 {
        fad16(sol la) sol[(la si)] la(si do)
        si(la sol)
    } \grace fad8 mi4\tr

    %124
    re4.~
    re8\grace re dod4
    re r8

    %127
    R4.*17
    la'4.\solo
    sol

    %146
    fad8 fad16 sol la si
    do!8(si la)
    si8. la16 si8\noBeam

    %149
    \tuplet 3/2 { la16(si do) } si8[la]
    si la r
    R4.*7

    %158
    \tuplet 3/2 { mi16(re do) } si8.[(do32 re)]
    \tuplet 3/2 { do16(si la) } sol4
    \tuplet 3/2 { mi'16(re do) } si8.[(do32 re)]

    %161
    \tuplet 3/2 { do16(si la) } sol4
    \tuplet 3/2 { fa'16(sol la) } la8.[(sol32 fa)]
    \tuplet 3/2 { mi16(fa sol) } sol8.[(fa32 mi)]

    %164
    fa8 \grace fa8 mi4
    re8 r r
    R4.*16

    %182
    sol16\soli(sib) sib(la) la(sol)
    la4.
    la16(do) do(si!) si(la)

    %185
    si4.
    si16(re) re(do) do(si)
    do8\noBeam re8. do16

    %188
    si8\noBeam do8. si16
    la8\noBeam si8. la16
    sold8\noBeam si,8.(do32 re)

    %191
    do8\noBeam do8.(re32 mi)
    si8 r r\mbreak
    R4.*3

    %196
    r16 sold la si do re
    do mi re do si la
    sold8\noBeam fa'8.(mi32 re)

    %199
    \tuplet 3/2 { do16(re mi) } mi8.[(re32 do)]
    \tuplet 3/2 { si16(do re) } re8.[(do32 si)]
    do16 la' sold la mi sol

    %202
    \tuplet 3/2 { fa mi re } \grace do8 si4\tr
    la4 r8
    R4.*3

    %207
    do8\soli do16(si) re\parentSlur (do)
    \grace do8 si4 r8
    si8 si16(la) do(si)

    %210
    la8\noBeam fad'16(la) la,(do)
    si(re) do(si) la(sol)
    fad(re) fad'(la) la,(do)

    %213
    si(re) do(si) la(sol)
    fad(mi) re8 r
    R4.*15

    %230
    si'8\solo(mi) re
    do la'4
    \tuplet 3/2 { si,16(do re) } do8[si]

    %233
    la8 r r
    R4.*2
    re16\solo (fa) fa(mi) mi(re)

    %237
    mi4.
    mi16(sol) sol(fad!) fad(mi)
    fad4.

    %240
    fad16(la) la(sol) sol(fad)
    sol8\noBeam la8. sol16\mbreak
    fad8\noBeam sol8. fad16

    %243
    mi8 do16(la) la'(sol)
    \grace sol8 fad4 sol8
    \tuplet 3/2 { mi16\parentSlur (re do) } si8[(la\tr)]

    %246
    sol8 r r
    R4.*12
    la'8\noBeam\soli la8.(si32 do)

    %260
    si8\noBeam si8.(do32 re)
    la8 r r
    R4.

    %1263
    r16 re, mi fad sol la
    \tuplet 3/2 { si(la sol) } fad8.[(sol32 la)]\mbreak
    \tuplet 3/2 { sol16(fad mi) } re4

    %266
    \tuplet 3/2 { si'16(la sol) } fad8.[(sol32 la)]
    \tuplet 3/2 { sol16(fad mi) } re8.[(mi32 fa)]
    \tuplet 3/2 { mi16(re do) } si8[la]

    %269
    \grace la4 si4.
    R4.*5
    si'4.~\mbreak

    %276
    si~
    si~
    si16 la32 sol fad16[mi re do]

    %279
    si16. do32 \grace si8 la4\tr
    sol4 r8
    R4.*17

}

IIIflIIn = \relative do'' {

    R4.*36
    si4.\solo
    la

    %39
    sol8 la16 si do re
    mi8(re) do
    si4.

    %42
    la
    sol8 fad r
    si si16(la) do(si)

    %45
    \grace si8 la4 r8
    la la16(sol) si(la)\mbreak
    \grace la8 sol4.

    %48
    si8(dod re)
    re(dod) re~
    \tuplet 3/2 { re16[(mi fad)] } mi8 re

    %51
    re\tr dod r
    re(fad) re
    \grace mi16 re8 dod r

    %54
    re4.~
    re16 si mi re dod si
    dod4.~

    %57
    dod16 la re dod si la
    si8 sol fad
    \grace fad mi4 re8

    %60
    sol fad16(mi fad sol)\mbreak
    \grace fad8 mi4 r8
    R4.*29

    %91
    re'8\solo\noBeam dod8.(re32 mi)
    re8\noBeam dod8.(re32 mi)
    fad8\noBeam fad16(mi) mi(red)

    %94
    \grace re4 mi4.
    mi8 mi16(re) re(dod)
    \grace dod4 re4.~

    %97
    re~
    re~
    re~

    %100
    re
    sol8(fad) re
    re dod r

    %103
    R4.*13
    \tuplet 3/2 { fad16(mi re) } dod8.[(re32 mi)]\mbreak
    \tuplet 3/2 { re16(dod si) } la4

    %118
    \tuplet 3/2 { fad'16(mi re) } dod8.[(re32 mi)]
    re16[(sol)] sol8.(fad32 mi)
    \tuplet 3/2 { re16[(mi fad)] } fad8.(mi32 re)

    %121
    \tuplet 3/2 { dod16[(re mi)] } mi8.(re32 dod)
    re4.~
    re8 \grace re dod4\tr

    %124
    \tuplet 3/2 { fad16 sol la sol[la si] la si do
    si(la sol)} \grace fad8 mi4
    re4 r8

    %127
    R4.*17
    fad4.\solo
    mi

    %146
    re8 re16 mi fad sol
    la8(sol) fad
    sol fad sol\noBeam

    %149
    \tuplet 3/2 { fad16(sol la) } sol8[fad]
    sol fad r
    R4.*8

    %159
    \tuplet 3/2 { mi16(re do) } si8.[(do32 re)]
    \tuplet 3/2 { do16(si la) } sol4
    \tuplet 3/2 { mi'16(re do) } si8.[(do32 re)]

    %162
    do16[(fa)] fa8.(mi32 re)
    \tuplet 3/2 { do16[(re mi)] } mi8.(re32 do)
    re8 \grace re do4

    %165
    si8 r r
    R4.*17
    do16\soli(mib) mib(re) re(do)

    %184
    re4.
    re16\parentSlur (fa) fa\parentSlur (mi!) mi\parentSlur (re)
    mi4.

    %187
    mi8 fa8.[mi16]
    re8\noBeam mi8. re16
    do8\noBeam re8. do16

    %190
    si8\noBeam sold8.(la32 si)
    la8\noBeam la8.(si32 do)
    sold8 r r\mbreak

    %193
    R4.*3
    r16 mi fad sold la si
    la do si la sold fad

    %198
    mi8\noBeam re'8.(do32 si)
    \tuplet 3/2 { la16(si do) } do8.[(si32 la)]
    \tuplet 3/2 { sold16\parentSlur (la si) } si8.[(la32 sold)]

    %201
    la4.~
    la8 \grace la sold4
    la r8

    %204
    R4.*3
    la8\soli la16(sol) sol(fad!)
    \grace fad8 sol4 r8

    %209
    sol sol16(fad) la(sol)
    fad8\noBeam la16(do) fad,(la)
    sol(si) la(sol) fad(mi)

    %212
    re8\noBeam la'16(do) fad,(la)
    sol(si) la(sol) fad(mi)
    re4 r8

    %215
    R4.*15
    sol8\solo(do) si
    la\noBeam do8.(si32 la)

    %232
    \tuplet 3/2 { sol16 [(la si)] } la8 sol
    fad8 r r
    R4.*3

    %237
    sol16\solo(sib) sib(la) la(sol)
    la4.
    la16(do) do(si!) si(la)

    %240
    si4.
    si8 \noBeam do8. si16\mbreak
    la8\noBeam si8. la16

    %243
    sol8 mi'16(do) do(si)
    \grace si8 la4 sol8
    \tuplet 3/2 { do16(si la) } sol8[(fad\tr)]

    %246
    sol8 r r
    R4.*12
    fad'8\noBeam\soli fad8.(sol32 la)

    %260
    sol8\noBeam sol8.(la32 si)
    fad8 r r
    R4.*3\mbreak

    %265
    \tuplet 3/2 { si16(la sol) } fad8.[(sol32 la)]
    \tuplet 3/2 { sol16(fad mi) } re4
    re8\noBeam si8.(do32 re)

    %268
    \tuplet 3/2 { do16(si la) } sol8[fad]
    \grace fad4 sol4.
    R4.*5

    %275
    sol'4.~\mbreak
    sol~
    sol~

    %278
    sol16[fad32 mi] re16 do si la
    sol16. la32 \grace sol8 fad4
    sol8 r r

    %291
    R4.*17

}


IIIvlIn = \relative do'' {

    re4.
    do
    si8 do16 re mi fad

    %4
    sol8(fad) mi
    re4.
    do

    %7
    si8 la r
    re re16(do) mi(re)
    \grace re8 do4 r8

    %10
    do do16(si) re(do)
    \grace do8 si4 r8
    si(mi) re

    %13
    do8 la'4
    \tuplet 3/2 { si,16(do re) } do8[si]
    \grace do16 si8 la r

    %16
    si\p(mi) re\mbreak
    do la'4
    \tuplet 3/2 { si,16(do re) } do8[si]

    %19
    la fad'16\f la la, do
    si re do si la sol
    fad re fad' la la, do

    %22
    si re do si la sol
    fad mi re8 r
    \tuplet 3/2 { si''16(la sol) } fad8.[(sol32 la)]

    %25
    \tuplet 3/2 { sol16(fad mi) } re8. [(mi32 fa)]
    \tuplet 3/2 { mi16(re do) } si8 [la]
    \grace la4 si4.

    %28
    \tuplet 3/2 { si'16\p(la sol) } fad8.[(sol32 la)]
    \tuplet 3/2 { sol16(fad mi) } re8. [(mi32 fa)]
    \tuplet 3/2 { mi16(re do) } si8 [la]

    %31
    si'16\f sol fad sol re fa\mbreak
    \tuplet 3/2 { mi16(re do) }\grace si8 la4\tr
    sol16 sol fad sol mi sol

    %34
    re sol do, sol' si, sol'
    do,16.\tr si64 do re8[re]
    sol,4 r8

    %37
    sol'8\p sol,16 la si do
    re8 re16 mi fad re
    sol8 r r

    %40
    R4.
    sol8 sol,16 la si do
    re8 re16 mi fad re

    %43
    sol8 re do
    si mi mi
    la,16 la' sold la mi do

    %46
    la8 re re\mbreak
    sol,16 sol' fad sol re si
    sol8 sol' fad

    %49
    mi la re,
    sol4 sold8
    la16 la, la' sol fad mi

    %52
    re8 r r
    la'16 la, la' sol fad mi
    re8 re re

    %55
    mi mi mi
    la, la la
    re re re

    %58
    sol,4.
    la4 si8
    dod re sold,\mbreak

    %61
    la la'16 sol fad mi
    re8 r r
    R4.*23

    %86
    r8 dod'16\f mi mi, sol
    fad la sol fad mi re
    dod la dod' mi mi, sol\mbreak

    %89
    fad la sol fad mi re
    dod si la8 r
    re\p la' la,

    %92
    re la' sol
    fad si si,
    mi16 sol si sol mi re

    %95
    dod8 la' la,
    re16 fad la fad re dod
    si8 si' la

    %98
    r sol fad
    r si la
    r sol fad

    %101
    mi re sold
    la16 la, la' sol fad mi\mbreak
    re8 r r

    %104
    R4.*10
    la8\p la la
    la la la

    %116
    la la la\mbreak
    la la la
    la la la

    %119
    si dod dod
    re re re
    la' la la

    %122
    re, mi fad
    sol la la,
    re mi fad

    %125
    sol la la,
    la''4.\f\tu
    sol

    %128
    fad8 sol16 la si dod
    re8 \parentSlur (dod) si\mbreak
    la4.

    %131
    sol
    fad8 mi r
    \tuplet 3/2 { fad16(mi re) } dod8.[(re32 mi)]

    %134
    \tuplet 3/2 { re16(dod si) } la8.[(si32 do)]
    \tuplet 3/2 { si16(la sol) } fad8[mi]
    \grace mi4 fad4.

    %137
    \tuplet 3/2 { fad'16\p(mi re) } dod8.[(re32 mi)]
    \tuplet 3/2 { re16(dod si) } la8.[la'16\f]
    \tuplet 3/2 { si16 la sol }\grace fad8 mi4\tr

    %140
    re16 re dod re si re
    la re sol, re' fad, re'\mbreak
    sol,16.\tr fad64 sol la8[la,]

    %143
    re4 r8
    re'\p re,16 mi fad sol
    la8 la16 si dod la

    %146
    re8 r r
    r r re
    sol, re r

    %149
    r r re'
    sol, re r
    R4.*7

    %158
    sol,8 sol sol
    sol sol sol
    sol sol sol

    %161
    sol sol sol
    la si si
    do do do

    %164
    fa!4 fad8
    sol\noBeam si16\f re re, fa
    mi sol fa mi re do\mbreak

    %167
    si sol si' re re, fa
    mi sol fa mi re do
    si la sol8 r

    %170
    R4.*9
    r8 si'16\f\tu re re, fa\mbreak
    mi sol fa mi re do

    %181
    si la sol8 r
    mi'\p mi mi
    fa fa fa

    %184
    fad! fad fad
    sol sol sol
    sold sold sold

    %187
    la16(sol!) fa(la) re,(fa)
    sol fa mi sol do, mi
    fa mi re fa si, re

    %190
    mi8 r r
    mi r r
    mi r r\mbreak

    %193
    mi r r
    mi r r
    R4.

    %196
    mi8 r r
    mi r r
    mi sold, sold

    %199
    la la la
    mi' mi mi
    la, si do

    %202
    re mi mi
    la,16\tu la' sold la fa la\mbreak
    mi la re, la' do, la'

    %205
    re,8 mi4\tr
    la,8 do\p mi
    la re, re

    %208
    sol,16 sol' fad? sol re si
    sol8 do do
    re re re

    %211
    re re re
    re re re
    re re re

    %214
    re re16 do si la
    sol8 r r
    R4.*14\mbreak

    %230
    sol'4.\p~
    sol8 fad16 la re, fad
    sol8 do, dod

    %233
    re\noBeam fad'16\f la la, do?
    si re do si la sol
    fad mi re8 r

    %236
    si\p si si
    do do do
    dod dod dod

    %239
    re re re
    red red red
    mi16 re? do mi la, do\mbreak

    %242
    re do si re sol, si
    do8 do do
    re do si

    %245
    do re re
    sol,\noBeam si'16\f re sol, si
    mi,8\noBeam la16 do fad, la

    %248
    re,8\noBeam si'16 re sol, si
    mi, sol dod, mi la, dod
    re8 r r

    %251
    R4.*8
    \stemUp <fad' la, re,>8\p r r
    <sol si, re,> r r

    %261
    <fad la, re,> r r
    <sol si, re,> r r
    <fad la, re,> re,[re]\stemNeutral

    %264
    re re re\mbreak
    re re re
    re re do

    %267
    si sol' sol,
    do re re
    sol re sol,

    %270
    R4.*5
    sol'8\f\noBeam si' \p si\mbreak
    mi,,\f\noBeam si''\p si

    %277
    dod,,\f \noBeam si''\p si
    re,, r r
    R4.

    %280
    sol,16\tu(si) si(re) re(sol)
    sol si la sol fad mi
    re8\noBeam fad'16 la la, do

    %283
    si re do si la sol
    fad re fad' la la, do
    si re do si la sol\mbreak

    %286
    fad mi re8 r
    \tuplet 3/2 { si''16(la sol) } fad8.[(sol32 la)]
    \tuplet 3/2 { sol16(fad mi) } re8. [(mi32 fa)]

    %289
    \tuplet 3/2 { mi16(re do) } si8 [la]
    \grace la4 si4.
    \tuplet 3/2 { si'16\p(la sol) } fad8.[(sol32 la)]

    %292
    \tuplet 3/2 { sol16(fad mi) } re8. [sol,16\f]
    \tuplet 3/2 { mi'16(re do) } \grace si la4
    sol16 sol fad sol mi sol

    %295
    re sol do, sol' si, sol'
    do,16.\tr si64 do re8[re]
    sol,4 r8

}

IIIvlIIn = \relative do'' {

    si4.
    la
    sol8 la16 si do re

    %4
    mi8(re) do
    si4.
    la

    %7
    sol8 fad r
    si8 si16(la) do(si)
    \grace si8 la4 r8

    %10
    la la16(sol) si(la)
    \grace la8 sol4 r8
    sol(do) si

    %13
    la do4
    \tuplet 3/2 { sol16(la si) } la8[sol]
    \grace la sol fad r

    %16
    sol\p(do) si\mbreak
    la do4
    \tuplet 3/2 { sol16[(la si)] } la8 sol

    %19
    fad fad'16\f la la, do
    si re do si la sol
    fad re fad' la la, do

    %22
    si re do si la sol
    fad mi re8 r
    \tuplet 3/2 { si''16(la sol) } fad8.[(sol32 la)]

    %25
    \tuplet 3/2 { sol16(fad mi) } re8. [(mi32 fa)]
    \tuplet 3/2 { mi16(re do) } si8 [la]
    \grace la4 si4.

    %28
    \tuplet 3/2 { si'16\p(la sol) } fad8.[(sol32 la)]
    \tuplet 3/2 { sol16(fad mi) } re8. [(mi32 fa)]
    \tuplet 3/2 { mi16(re do) } si8 [la]

    %31
    si'16\f sol fad sol re fa\mbreak
    \tuplet 3/2 { mi16(re do) }\grace si8 la4\tr
    sol16 sol fad sol mi sol

    %34
    re sol do, sol' si, sol'
    do,16.\tr si64 do re8[re]
    sol,4 r8

    %37
    sol'8\p sol,16 la si do
    re8 re16 mi fad re
    sol8 r r

    %40
    R4.
    sol8 sol,16 la si do
    re8 re16 mi fad re

    %43
    sol8 re do
    si mi mi
    la,16 la' sold la mi do

    %46
    la8 re re\mbreak
    sol,16 sol' fad sol re si
    sol8 sol' fad

    %49
    mi la re,
    sol4 sold8
    la16 la, la' sol fad mi

    %52
    re8 r r
    la'16 la, la' sol fad mi
    re8 re re

    %55
    mi mi mi
    la, la la
    re re re

    %58
    sol,4.
    la4 si8
    dod re sold,\mbreak

    %61
    la la'16 sol fad mi
    re8 r r
    R4.*23

    %86
    r8 dod'16\f mi mi, sol
    fad la sol fad mi re
    dod la dod' mi mi, sol\mbreak

    %89
    fad la sol fad mi re
    dod si la8 r
    re\p la' la,

    %92
    re la' sol
    fad si si,
    mi16 sol si sol mi re

    %95
    dod8 la' la,
    re16 fad la fad re dod
    si8 si' la

    %98
    r sol fad
    r si la
    r sol fad

    %101
    mi re sold
    la16 la, la' sol fad mi\mbreak
    re8 r r

    %104
    R4.*10
    la8\p la la
    la la la

    %116
    la la la\mbreak
    la la la
    la la la

    %119
    si dod dod
    re re re
    la' la la

    %122
    re, mi fad
    sol la la,
    re mi fad

    %125
    sol la la,
    fad''4.\f
    mi

    %128
    re8 mi16 fad sol la
    si8(la) sol\mbreak
    fad4.

    %131
    mi
    re8 dod r
    \tuplet 3/2 { fad16(mi re) } dod8.[(re32 mi)]

    %134
    \tuplet 3/2 { re16(dod si) } la8.[(si32 do)]
    \tuplet 3/2 { si16(la sol) } fad8[mi]
    \grace mi4 fad4.

    %137
    \tuplet 3/2 { fad'16\p(mi re) } dod8.[(re32 mi)]
    \tuplet 3/2 { re16(dod si) } la8.[la'16\f]
    \tuplet 3/2 { si16 la sol }\grace fad8 mi4\tr

    %140
    re16 re dod re si re
    la re sol, re' fad, re'\mbreak
    sol,16.\tr fad64 sol la8[la,]

    %143
    re4 r8
    re'\p re,16 mi fad sol
    la8 la16 si dod la

    %146
    re8 r r
    r r re
    sol, re r

    %149
    r r re'
    sol, re r
    R4.*7

    %158
    sol,8 sol sol
    sol sol sol
    sol sol sol

    %161
    sol sol sol
    la si si
    do do do

    %164
    fa!4 fad8
    sol\noBeam si16\f re re, fa
    mi sol fa mi re do\mbreak

    %167
    si sol si' re re, fa
    mi sol fa mi re do
    si la sol8 r

    %170
    R4.*9
    r8 si'16\f\tu re re, fa\mbreak
    mi sol fa mi re do

    %181
    si la sol8 r
    mi'\p mi mi
    fa fa fa

    %184
    fad! fad fad
    sol sol sol
    sold sold sold

    %187
    la16(sol!) fa(la) re,(fa)
    sol fa mi sol do, mi
    fa mi re fa si, re

    %190
    mi8 r r
    mi r r
    mi r r\mbreak

    %193
    mi r r
    mi r r
    R4.

    %196
    mi8 r r
    mi r r
    mi sold, sold

    %199
    la la la
    mi' mi mi
    la, si do

    %202
    re mi mi
    la,16\f la' sold la fa la\mbreak
    mi la re, la' do, la'

    %205
    re,8 mi4\tr
    la,8 do\p mi
    la re, re

    %208
    sol,16 sol' fad? sol re si
    sol8 do do
    re re re

    %211
    re re re
    re re re
    re re re

    %214
    re re16 do si la
    sol8 r r
    R4.*14\mbreak

    %230
    sol'4.\p~
    sol8 fad16 la re, fad
    sol8 do, dod

    %233
    re\noBeam fad'16\f la la, do?
    si re do si la sol
    fad mi re8 r

    %236
    si\p si si
    do do do
    dod dod dod

    %239
    re re re
    red red red
    mi16 re? do mi la, do\mbreak

    %242
    re do si re sol, si
    do8 do do
    re do si

    %245
    do re re
    sol,\noBeam si'16\f re sol, si
    mi,8\noBeam la16 do fad, la

    %248
    re,8\noBeam si'16 re sol, si
    mi, sol dod, mi la, dod
    re8 r r

    %251
    R4.*8
    \stemUp <fad' la, re,>8\p r r
    <sol si, re,> r r

    %261
    <fad la, re,> r r
    <sol si, re,> r r
    <fad la, re,> re,[re]\stemNeutral

    %264
    re re re\mbreak
    re re re
    re re do

    %267
    si sol' sol,
    do re re
    sol re sol,

    %270
    R4.*5
    sol'8\f\noBeam sol' \p sol\mbreak
    mi,\f\noBeam sol'\p sol

    %277
    dod,,\f \noBeam sol''\p sol
    re, r r
    R4.

    %280
    sol,16\f(si) si(re) re(sol)
    sol si la sol fad mi
    re8\noBeam fad'16 la la, do

    %283
    si re do si la sol
    fad re fad' la la, do
    si re do si la sol\mbreak

    %286
    fad mi re8 r
    \tuplet 3/2 { si''16(la sol) } fad8.[(sol32 la)]
    \tuplet 3/2 { sol16(fad mi) } re8. [(mi32 fa)]

    %289
    \tuplet 3/2 { mi16(re do) } si8 [la]
    \grace la4 si4.
    \tuplet 3/2 { si'16\p(la sol) } fad8.[(sol32 la)]

    %292
    \tuplet 3/2 { sol16(fad mi) } re8. [sol,16\f]
    \tuplet 3/2 { mi'16(re do) } \grace si la4
    sol16 sol fad sol mi sol

    %295
    re sol do, sol' si, sol'
    do,16.\tr si64 do re8[re]
    sol,4 r8

}

IIIvlan = \relative do' {

    sol'8 sol,16 la si do
    re8 re16 mi fad re
    sol8 r r

    %4
    R4.
    sol8 sol,16 la si do
    re8 re16 mi fad re

    %7
    sol8 re do
    si sold sold
    la16 la' sold la mi do

    %10
    la8 fad fad
    sol16 sol' fad sol re si
    sol8 r sol'

    %13
    mi re4
    re8 mi mi
    re re16 do si la

    %16
    sol4.\p\mbreak
    mi'8 re4
    re8 mi mi

    %19
    fad\noBeam la16\f do fad, la
    sol si la sol fad mi
    re8\noBeam la'16 do fad, la

    %22
    sol si la sol fad mi
    re8 re16 do si la
    sol8 do do

    %25
    re sol sol
    sol sol[fad]
    \grace fad4 sol4.

    %28
    re8\p do do
    re sol sol
    sol sol[fad]

    %31
    sol\f do, sol'~
    sol \grace sol fad4\tr
    sol16 sol fad sol mi sol

    %34
    re sol do, sol' si, sol'
    do,8\tr\noBeam re re
    sol,4 r8

    %37
    sol'\p sol,16 la si do
    re8 re16 mi fad re
    sol8 r r

    %40
    R4.
    sol8 sol,16 la si do
    re8 re16 mi fad re

    %43
    sol8 re do
    si mi mi
    la,16 la' sold la mi do

    %46
    la8 re re\mbreak
    sol,16 sol' fad sol re si
    sol8 sol' fad

    %49
    mi la re,
    sol4 sold8
    la16 la, la' sol fad mi

    %52
    re8 r r
    la'16 la, la' sol fad mi
    re8 re re

    %55
    mi mi mi
    la, la la
    re re re

    %58
    sol,4.
    la4 si8
    dod re sold,\mbreak

    %61
    la la'16 sol fad mi
    re8 r r
    R4.*23

    %86
    r8 mi16\f sol dod, mi
    re fad mi re dod si
    la8\noBeam mi'16 sol dod, mi\mbreak

    %89
    re fad mi re dod si
    la4 r8
    re\p la' la,

    %92
    re la' sol
    fad si si,
    mi16 sol si sol mi re

    %95
    dod8 la' la,
    re16 fad la fad re dod
    si8 si' la

    %98
    r sol fad
    r si la
    r sol fad

    %101
    mi re sold
    la16 la, la' sol fad mi\mbreak
    re8 r r

    %104
    R4.*10
    la8\p la la
    la la la

    %116
    la la la\mbreak
    la la la
    la la la

    %119
    si dod dod
    re re re
    la' la la

    %122
    re, mi fad
    sol la la,
    re mi fad

    %125
    sol la la,

    %126
    re'8 \f re,16 mi fad sol
    la8 la16 si dod la
    re8 r r

    %129
    R4.\mbreak
    re8 re,16 mi fad sol
    la8 la16 si dod la

    %132
    re8 la16 sol fad mi
    re8 sol, sol
    la re re

    %135
    re\noBeam re dod
    \grace dod?4 re4.
    la8\p sol sol

    %138
    la re re\f
    re\noBeam \grace re dod4
    re16 re' dod re si re

    %141
    la re sol, re' fad, re'\mbreak
    sol,16.\tr(fad64 sol) la8[la,]
    re4 r8

    %144 fondo p. 18
    re'\p re,16 mi fad sol
    la8 la16 si dod la

    %146
    re8 r r
    r r re
    sol, re r

    %149
    r r re'
    sol, re r
    R4.*7

    %158
    sol,8 sol sol
    sol sol sol
    sol sol sol

    %161
    sol sol sol
    la si si
    do do do

    %164
    fa!4 fad8
    sol\noBeam re16\f fa si, re
    do mi re do si la\mbreak

    %167
    sol8\noBeam re'16 fa si, re
    do mi re do si la
    sol8 r r

    %170
    R4.*9
    r8 do16\f fa si, re\mbreak
    do mi re do si la

    %181
    sol8 r r
    mi'\p mi mi
    fa fa fa

    %184
    fad! fad fad
    sol sol sol
    sold sold sold

    %187
    la16(sol!) fa(la) re,(fa)
    sol fa mi sol do, mi
    fa mi re fa si, re

    %190
    mi8 r r
    mi r r
    mi r r\mbreak

    %193
    mi r r
    mi r r
    R4.

    %196
    mi8 r r
    mi r r
    mi sold, sold

    %199
    la la la
    mi' mi mi
    la, si do

    %202
    re mi mi
    la,16\f la' sold la fa la\mbreak
    mi la re, la' do, la'

    %205
    re,8 mi4\tr
    la,8 do\p mi
    la re, re

    %208
    sol,16 sol' fad? sol re si
    sol8 do do
    re re re

    %211
    re re re
    re re re
    re re re

    %214
    re re16 do si la
    sol8 r r
    R4.*14\mbreak

    %230
    sol'4.\p~
    sol8 fad16 la re, fad
    sol8 do, dod

    %233
    re\noBeam la'16\f do fad, la
    sol si la sol fad mi
    re4 r8

    %236
    si\p si si
    do do do
    dod dod dod

    %239
    re re re
    red red red
    mi16 re! do mi la, do\mbreak

    %242
    re do si re sol, si
    do8 do do
    re do si

    %245
    do re re
    sol,\noBeam si'16\f re sol, si
    mi,8\noBeam la16 do fad, la

    %248
    re,8\noBeam si'16 re sol, si
    mi, sol dod, mi la, dod
    re8 r r

    %251
    R4.*8
    re8\p r r
    re r r

    %261
    re r r
    re r r
    re re re

    %264
    re re re\mbreak
    re re re
    re re do

    %267
    si sol' sol,
    do re re
    sol re sol,

    %270
    R4.*5
    sol'8\f r r\mbreak
    mi\f r r

    %277
    dod\f r r
    re r r
    R4.

    %280
    sol,16\f(si) si(re) re(sol)
    sol si la sol fad mi
    re8\noBeam la'16 do fad, la

    %283
    sol si la sol fad mi
    re8\noBeam la'16 do fad, la
    sol si la sol fad mi\mbreak

    %286
    re4 r8
    re do do
    re sol sol

    %289
    sol\noBeam sol fad
    \grace fad4 sol4.
    re8\p do do

    %292
    re sol\f sol
    sol \grace sol fad4
    sol16 sol fad sol mi sol

    %295
    re sol do, sol' si, sol'
    do,16.\tr si64 do re8[re]
    sol,4 r8

}

IIIvdgn = \relative do' {

    R4.*61
    la4.\solo
    sol

    %64
    fad8 sol16 la si dod
    re8 dod si
    la4.

    %67
    sol
    fad8 mi r
    la' la16(sol) si(la)

    %70
    \grace la8 sol4 r8
    sol sol16(fad) la (sol)
    \grace sol8 fad4 r8

    %73
    fad si la
    \grace la sol4.
    \tuplet 3/2 { fad16[sol la] } sol8 fad\mbreak

    %76
    fad\tr mi dod'\noBeam~
    dod8 \parentSlur (re) fad,
    \grace sol16 fad8 mi r

    %79
    fad si la
    sol4.~
    sol16 mi la sol! fad mi

    %82
    fad4.~
    fad8 mi re
    \grace re dod4 re8

    %85
    mi re16(dod re mi)
    \grace re8 dod4 r8
    R4.*16

    %103
    fad8\noBeam mi8.(fad32 sol)
    fad8\noBeam mi8.(fad32 sol)
    la8\noBeam la16(sol) sol(fad)

    %106
    \grace fad4 sol4.
    sol8 sol16(fad) fad(mi)
    \grace mi4 fad4.

    %109
    re8(sol) fad
    re(si') la
    re,\noBeam \tuplet 3/2 { mi16[fad sol] } fad8

    %112
    re \tuplet 3/2 { sol16[(la si)] } la8
    dod \parentSlur (re) fad,
    fad mi r

    %115
    R4.*36
    re4.\solo
    do

    %153
    si8 si16 do re mi
    fa8(mi) re
    mi re mi\noBeam\mbreak

    %156
    \tuplet 3/2 { re16(mi fa) } mi8[re]
    mi re r
    R4.*12

    %170
    sol8\soli sol16(fa) fa(mi)
    \grace mi8 fa4 r8
    fa? fa16(mi) mi(re)

    %173
    \grace re8 mi4.
    do8 (fa) mi
    do(la') sol

    %176
    do, \tuplet 3/2 { re16[(mi fa)] } mi8
    do \tuplet 3/2 { fa16[(sol la)] } sol8
    si do mi,

    %179
    re sol, sol\mbreak
    R4.*10
    mi'16 mi' red mi mi, mi'

    %191
    mi, mi' red mi mi, mi'
    mi,8 \noBeam si'8.(do32 re)\mbreak
    do8\noBeam do8.(re32 mi)

    %194
    si16 sold la si do re
    do mi re do si la
    sold8 r r

    %197
    R4.*13
    r8 re'-. \parenthesize _\solo \parentSlur (re-.)
    re, r r

    %212
    r re'\parenthesize -. \parentSlur (re\parenthesize -.)
    re, r r
    R4.

    %215
    re
    do\mbreak
    si8 do16 re mi fad

    %218
    sol8(fad) mi\parenthesize \upl
    re4.
    do

    %221
    si8 la r
    re re16(do) mi(re)
    \grace re8 do4 r8

    %224
    do do16(si) re(do)
    \grace do8 si4 r8
    si(mi) re

    %227
    do la'4
    \tuplet 3/2 { si,16 \parentSlur (do re) } do8[si]
    si la r\mbreak

    %230
    R4.*21
    re16\solo(fa) fa(mi) mi(re)
    mi4.

    %253
    mi16(sol) sol(fad!) fad(mi)\mbreak
    fad4.
    fad16(la) la(sol) sol(fad)

    %256
    sol8\noBeam la8. sol16
    fad8\noBeam sol8. fad16
    mi re do si la sol

    %259
    re' re' dod re re, re'
    re, re' dod re re, re'
    re,8\noBeam la'8.(si32 do)

    %262
    si8\noBeam si8.(do32 re)
    la8 r r
    R4.*6

    %270
    \tuplet 3/2 { si,16\solo la sol } fad8.[(sol32 la)]
    \tuplet 3/2 { sol16 fad mi } re4
    \tuplet 3/2 { si'16\parentSlur (la sol) }  fad8.[(sol32 la)]

    %273
    \tuplet 3/2 { sol16\parentSlur (fad mi) } re8.[re'16]
    \tuplet 3/2 { mi(re do) } si8[la\tr ]
    sol'16 si re si sol fad\mbreak

    %276
    mi sol si sol mi re
    dod mi sol mi re dod
    re4 fad8

    %279
    sol re re,
    sol4 r8
    R4.*17

}

IIIvcn = \relative do {

    R4.*61
    fad4.\solo
    mi

    %64
    re8 mi16 fad sol la
    si8(la) sol
    fad4.

    %67
    mi
    re8 dod r
    fad' fad16(mi) sol(fad)

    %70
    \grace fad8 mi4 r8
    mi mi16(re) fad(mi)
    \grace mi8 re4 r8

    %73
    re sol fad
    \grace fad8 mi4.
    \tuplet 3/2 { re16 (mi fad) } mi8[re]\mbreak

    %76
    re\tr dod mi\noBeam~
    mi(fad) re
    \grace mi re dod r

    %79
    re4.~
    re16 si mi re dod si
    dod4.~

    %82
    dod16 la re dod si la
    si8 sol fad
    \grace fad mi4 re8

    %85
    sol fad16(mi fad sol)
    \grace fad8 mi4 r8
    R4.*16

    %103
    re'8\noBeam dod8.(re32 mi)
    re8\noBeam dod8.\parentSlur ( re32 mi)
    fad8 fad16(mi) mi(red)

    %106
    \grace red?4 mi4.
    mi8 mi16(re?) re(dod)
    \grace dod?4 re4.~

    %109
    re~
    re~
    re~

    %112
    re
    mi8(fad) re
    re dod r

    %115
    R4.*36
    si4.\solo
    la

    %153
    sol8 sol16 la si do
    re8(do) si
    do si do\noBeam

    %156
    \tuplet 3/2 {si16[(do re)] } do8 si
    do si r
    R4.*12

    %170
    mi8 mi16(re) re(dod)
    \grace dod?8 re4 r8
    re re16(do?) do(si)

    %173
    \grace si8 do4 r8
    do4.~
    do~

    %176
    do~
    do
    fa8(mi) do

    %179
    si r r\mbreak
    R4.*10
    mi,16 mi' red mi mi, mi'

    %191
    mi, mi' red mi mi, mi'
    mi,8 sold8.[(la32 si)]\mbreak
    la8\noBeam la8.(si32 do)

    %194
    sold16 mi fad sold la si
    la do si la sold fad
    mi8 r r

    %197
    R4.*14
    r8 re-.\solo(re-.)
    re, r r

    %213
    r re'-.(re-.)
    re, r r
    si''4.

    %216
    la\mbreak
    sol8 la16 si do re
    mi8(re) do\upl

    %219
    si4.
    la
    sol8 fad r

    %222
    si8 si16(la) do(si)
    \grace si8 la4 r8
    la la16(sol) si(la)

    %225
    \grace la8 sol4 r8
    sol(do) si
    la\noBeam do8.(si32 la)

    %228
    \tuplet 3/2 { sol16( la si) } la8[sol]
    sol fad r\mbreak
    R4.*22

    %252
    sol16\solo(sib) sib(la) la(sol)
    la4.\mbreak
    la16(do) do(si!) si(la)

    %255
    si4.
    si8\noBeam do8. si16
    la8\noBeam si8. la16

    %258
    sol si la sol fad mi
    re re' dod re re, re'
    re, re' dod re re, re'

    %261
    re,8\noBeam fad8.(sol32 la)
    sol8\noBeam sol8.(la32 si)
    fad8 r r

    %264
    R4.*7
    \tuplet 3/2 { si16 la sol } fad8.[(sol32 la)]
    \tuplet 3/2 { sol16(fad mi) } re4

    %273
    \tuplet 3/2 { si'16(la sol) } fad8[sol]
    sol\noBeam sol fad\tr
    sol16 si re si sol fad\mbreak

    %276
    mi sol si sol mi re
    dod mi sol mi re dod
    re4 fad8

    %279
    sol re re,
    sol4 r8
    R4.*17

}

IIIbcn = \relative do {

    sol'8 sol,16 la si do
    re8 re16 mi fad re
    sol8 r r

    %4
    R4.
    sol8 sol,16 la si do
    re8 re16 mi fad re

    %7
    sol8 re do
    si mi mi
    la,16 la' sold la mi do

    %10
    la8 re re
    sol,16 sol' fad sol re si
    sol8 r sol'

    %13
    la fad16 la re, fad
    sol8 do, dod
    re re'16 do si la

    %16
    sol4.\p~\mbreak
    sol8 fad16 la re, fad
    sol8 do, dod

    %19
    re re\f re
    re re re
    re re re

    %22
    re re re
    re re'16 do si la
    sol8 la la

    %25
    si si si
    do re re,
    sol re sol,

    %28
    sol'\p la la
    si si si
    do re re,

    %31
    sol,\f la si\mbreak
    do re re,
    sol16 sol' fad sol mi sol

    %34
    re sol do, sol' si, sol'
    do,8 re re,
    sol4 r8

    %37
    R4.*25
    re'8 re,16 mi fad sol
    la8 la16 si dod la

    %64
    re8 r r
    R4.
    re8\p re,16 mi fad sol

    %67
    la8 la16 si dod la
    re8 la sol
    fad si si

    %70
    mi,16 mi' red mi si sol
    mi8 la la
    re,16 re' dod re la fad

    %73
    re8 r re'
    mi dod16 mi la, dod
    re8 sol, sold\mbreak

    %76
    la4 r8
    la4 r8
    la la'16 sol fad mi

    %79
    re8 re re
    mi mi mi
    la, la la

    %82
    re re re
    sol,4.
    la4 si8

    %85
    dod re re,
    la' la\f la
    la la la

    %88
    la la la\mbreak
    la la la
    la la'16\p sol fad mi

    %91
    re8 r r
    R4.*11
    re8\p la' la,

    %104
    re la' sol
    fad si si,
    mi16 sol si sol mi re

    %107
    dod8 la' la,
    re16 fad la fad re dod
    si8 si' la

    %110
    r sol fad
    r si la
    r sol fad

    %113
    mi re sold
    la la, r
    R4.*11

    %126
    re'8 \f re,16 mi fad sol
    la8 la16 si dod la
    re8 r r

    %129
    R4.\mbreak
    re8 re,16 mi fad sol
    la8 la16 si dod la

    %132
    re8 la16 sol fad mi
    re8 mi mi
    fad fad fad

    %135
    sol la la,
    re la re,
    re'\p mi mi

    %138
    fad fad fad\f
    sol la la,
    re16 re' dod re si re

    %141
    la re sol, re' fad, re'\mbreak
    sol,16.\tr(fad64 sol) la8[la,]
    re4 r8

    %144
    R4.*7
    sol8\p sol,16 la si do
    re8 re16 mi fad re

    %153
    sol8 r r
    r r sol
    do, sol r\mbreak

    %156
    r r sol'
    do, sol r
    R4.*7

    %165
    r8 sol\f sol
    sol sol sol\mbreak
    sol sol sol

    %168
    sol sol sol
    sol sol'\p fa
    mi la la,

    %171
    re16 fa la fa re do
    si8 sol' sol,
    do16 mi sol mi do si

    %174
    la8 la' sol
    r fa mi
    r la sol

    %177
    r fa mi
    re do fad!
    sol sol,\f sol\mbreak

    %180
    sol sol sol
    sol4 r8
    R4.*8

    %190
    mi'8 r r
    mi r r
    mi,16 mi' red mi mi, mi'\mbreak

    %193
    mi, mi' red mi mi, mi'
    mi,8 r r
    mi r r

    %196
    mi r r
    R4.*6
    la16 la' sold la fa la\mbreak

    %204
    mi la re, la' do, la'
    re,8 mi mi,
    la r r

    %207
    R4.*3
    re8 r r
    re r r

    %212
    re, r r
    re r r
    \once\stemUp re re''16 do si la

    %215
    sol8 sol,16 la si do
    re8 re16 mi fad re\mbreak
    sol8 r r

    %218
    R4.
    sol8 sol,16 la si do
    re8 re16 mi fad re

    %221
    sol8 re do
    si mi mi,
    la16 la' sold la mi do

    %224
    la8 re re
    sol,16 sol' fad sol re si
    sol4.~

    %227
    sol8 fad16 la re, fad
    sol8 do dod
    re re, r\mbreak

    %230
    R4.*3
    r8 re'\f re
    re re re

    %235
    re4 r8
    R4.*10
    r8 si'16\f re sol, si

    %247
    mi,8\noBeam la16 do fad, la
    re,8\noBeam si'16 re sol, si
    mi, sol dod, mi la, dod

    %250
    re8 re, r
    si'\p si si
    do do do

    %253
    dod dod dod\mbreak
    re re re
    red red red

    %256
    mi16 re? do mi la, do
    re do si re sol, si
    do4.

    %259
    re8\p r r
    re r r
    re,16 re' dod re re, re'

    %262
    re, re' dod  re re, re'
    re,8 r r
    R4.*5

    %269
    sol8\p sol16 la si do
    re8 re re
    re re re

    %272
    re re re
    re re si
    do re re,

    %275
    sol'\f r r\mbreak
    mi r r
    dod r r

    %278
    re4\p fad8
    sol re re,
    sol16(si) si(re) re(sol)

    %281
    sol si la sol fad mi
    re8 re re
    re re re

    %284
    re re re
    re re re\mbreak
    re re'16 do si la

    %287
    sol8 la la
    si si si
    do re re,

    %290
    sol re sol,
    sol'\p la la
    si si si,\f

    %293
    do re re,
    sol16 sol' fad sol mi sol
    re sol do, sol' si, sol'

    %296
    do,16.\tr si64 do re8[re,]
    sol4 r8

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/8
    \key sol\major
    \tempo 4. = 63
    s4.*297

    \bar "|."

}

IIIflI = {
    %\notypeset
    <<\IIIflIn \forma>>

}

IIIflII = {
    <<\IIIflIIn \forma>>

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

}

IIIvdg = {
    \clef alto
    <<\IIIvdgn \forma>>

}

IIIvc = {
    \clef bass
    <<\IIIvcn \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
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
#(set-global-staff-size 14.5)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con

}

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

    \header {
        subtitle = \markup\larger "C. H. Graun - Concerto grosso [GraunWV Bv:XIII:55]"
        composer = \markup {"C. H. Graun (1703-1759)"}
    }

    \markup \huge {[1.] Allegro non troppo}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flauto [I]"\vspace #-0.3"Concertato"}
                    \IflI \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup \center-column{"Flauto [II]"\vspace #-0.3"[o] Violino"\vspace #-0.3"Concertato"}
                    \IflII \global
                >>
            >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Viol[a] di gamba"\vspace #-0.3"Concertato"}
                    \Ivdg\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.3"Concertato"}
                    \Ivc\global
                >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.3"P[ri]mo"}
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 2.do"}
                    \IvlII\global
                >>
            >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \Ivla\global
                >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc\global
            >>
        >>

        \layout {

            indent = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #0.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
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

    \pageBreak

    \markup \huge {[2.] Arioso e poco Largo con Sordini}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"flute"
                    \IIflI \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IIflII \global
                >>
            >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvdg\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIvc\global
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
            >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvla\global
                >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IIbc\global
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #0.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
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

    \pageBreak

    \markup \huge {[3.] Allegro non troppo}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIflI \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIflII \global
                >>
            >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIIvdg\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIIvc\global
                >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII\global
                >>
            >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIIvla\global
                >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc\global
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #0.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
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



