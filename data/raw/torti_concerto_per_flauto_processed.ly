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
    \terzine\senza
}

Ifln = \relative do'' {

    sol'8 sol, \tuplet 3/2 { r16 sol(la) si[(la sol)] }
    R2
    sol'8.\prall fad32 mi re8 re

    %4
    \tuplet 3/2 { mi16 red(mi) sol[fad \parenthesize (sol)] } do8 r
    \tuplet 3/2 { mi,16\p red(mi) sol[fad sol] } do8 r
    \tuplet 3/2 { re,?16\f dod(re) sol[fad(sol)] } si8 r

    %7
    \tuplet 3/2 { re,16\p dod(re) sol[fad\parenthesize (sol)] } si8 r
    \tuplet 3/2 { do,16\f si(do) fad[mi(fad)] la sol(fad) mi[re(do)]}\mbreak
    si16. sol'32 si,16. sol'32 si,16. sol'32 si,16. sol'32

    %10
    do,16. sol'32 do,16. sol'32 do,16. sol'32 do,16. sol'32
    re16. sol32 re16. sol32 re16. sol32 re16. sol32
    mi4~\tuplet 3/2 { mi16 re(do) si[la(sol)] }

    %13
    fad8 re16. re32 re16. re32 re16. re32
    fad'8 re\solo[re re]
    re dod4 mi8\parenthesize ~

    %16
    mi re4 fad8~
    fad mi4 sol8~
    sol fad4 la8\mbreak

    %19
    \tuplet 3/2 { si16 la(si) sol[fad\parenthesize (sol)] } \once\stemUp sol,8 si'
    \tuplet 3/2 { la16 sol(la) fad[mi(fad)] } \once\stemUp fad,8 la'
    \tuplet 3/2 { sol16 fad(sol) mi[re(mi)] } la,8 sol'

    %22
    fad16 sol la sol la fad mi re
    do2~
    \tuplet 3/2 {
        do16 si(do) fad[mi(fad)] la sol(fad) mi[re(do)]

        %25
        si la(si) re[do(re)] sol fad(mi) re[do(si)]
    }
    si8_\prall la do4\mbreak
    sol'8\tu sol, \tuplet 3/2 { r16 sol(la) si[(la sol)] }

    %28
    re'8 re re8.\prall mi32  fad
    sol8.\prall fad32 mi re8 re
    mi16. do'32 mi,16. do'32 mi,16. do'32 mi,16. do'32

    %31
    re,16. si'32 re,16. si'32 re,16. si'32 re,16. si'32
    do,16. la'32 do,16. la'32 do,16. la'32 do,16. la'32
    sol8 sol4 sol8~

    %34
    sol8 \tuplet 3/2 { si16 [la(sol)] si[la(sol)] si la(sol) }
    sol8 \tuplet 3/2 {
        si16 [la(sol)] si[la(sol)] si la(sol)\mbreak
        sol si(la) sol[fad(mi)]
    } re8 do

    %37
    si16 do8 re mi fad16
    sol8.\prall fad32 mi re8 do
    \tuplet 3/2 { si16 do(re) mi[fad(sol)] } si,8 la

    %40
    \tuplet 3/2 { sol'16 fad(sol) mi[re(mi)] } do8 re
    sol,[sol' sol, re']
    \tuplet 3/2 { sol16\solo si (la) } sol4.

    %43
    \tuplet 3/2 { sol16 si (la) } sol4.
    \tuplet 3/2 { sol16 si (la) } sol4.
    sol8. fad32 sol la16 fad re do\mbreak

    %46
    si(do) do(re) re(mi) fad(sol)
    sol8. fad32(sol) la16 fad \grace mi8 re16 do
    \tuplet 3/2 { si(la sol) } sol8\noBeam \tuplet 3/2 { r16 sol(la) si[(la sol)] }

    %49
    re'8[re re re]
    dod16 re mi re la' fad mi re
    dod re mi re la' fad mi re

    %52
    si'2~
    \tuplet 3/2 { si16 la(si) sol[fad(sol)]} \once\stemUp sol,8 si'
    la2~\mbreak

    %55
    \tuplet 3/2 { la16 sol(la) fad[mi(fad)] } \once\stemUp fad,8 la'
    sol2\prall~
    \tuplet 3/2 { sol16 fad(sol) mi[re(mi)] } la,8 sol'

    %58
    \tuplet 3/2 { fad16 mi(fad) re[dod(re)] } la8 la'
    \tuplet 3/2 { sol16 fad(sol) mi[re(mi)] } la,8 sol'
    fad8 fad4 fad8

    %61
    \slashedGrace sol8 fad8.\prall mi32 re fa8.\prall mi32 re
    \slashedGrace sol8 fa?8.\upl mi32 re \slashedGrace sold?8 fa8.\prall mi32 re
    \tuplet 3/2 { dod16 mi(dod) } la8\mbreak \tuplet 3/2 {
        r16 mi'(fad?) sol[fad(mi)]

        %64
        re fad(re)
    } la8 \tuplet 3/2 { r16 fad'(sol) la[sol(fad)] }
    \tuplet 3/2 { mi sol(mi) } la,8 \tuplet 3/2 {
        r16 sol'(la) si[ la(sol)]
        fad mi(fad) sol[fad(mi)]
    } \grace {do16[re]} mi4\prall

    %67
    re8\tu re, \tuplet 3/2 { r16 re' (mi) fad[mi(re)] }
    la'8 la la si16 dod
    re8. dod32 si la8 la

    %70
    \tuplet 3/2 {
        sol16 fad(sol) mi[re(mi)]\mbreak la, dod(mi) sol[fad(mi)]
        fad mi(fad) re[dod(re)]
    } re,8 la'16. si32
    do!8[do do do]

    %73
    \tuplet 3/2 { do16 (la') la\upl } la8\upl\noBeam \tuplet 3/2 {
        r16 la,(si) do[si(la)]
        si (sol') sol\upl
    } sol8\upl\noBeam \tuplet 3/2 {
        r16 sol,(la) si[la(sol)]
        la (fad') fad\upl
    } fad8\noBeam\upl \tuplet 3/2 { r16 la,(si) do[si(la)]  }

    %76
    sol8 mi'4 mi8~
    mi mi4 mi8\mbreak
    mi, mi'4 mi8~

    %79
    mi mi4 mi8
    mi16. si'32 mi,16. si'32 mi,16. si'32 mi,16. si'32
    mi,16. do'32 mi,16. do'32 mi,16. do'32 mi,16. do'32

    %82
    mi,16. si'32 mi,16. si'32 mi,16. si'32 mi,16. si'32
    do4~\tuplet 3/2 { do16 si(la) sol[fad(mi)] }
    red8 red,16. red32 red8 red

    %85
    red?4 r8 si'\solo
    \tuplet 3/2 { mi16 sol(fad) } mi4.
    do8\prall si mi4\mbreak %% fine pagina

    %88
    mi8 red16 mi fad red si la
    sol32 (fad sol la si8) mi4~
    mi8 red16 mi fad red si la

    %91
    sol sol' fad mi red(mi) red(mi)
    r16 sol fad mi red(mi) red(mi)
    r16 sol fad mi red(mi) red(mi)

    %94
    do'4~\tuplet 3/2 { do16 si(la) sol[fad(mi)] }\mbreak
    mi8\prall red r re
    \tuplet 3/2 { sol16 si(la) } sol4.

    %97
    mi8\prall re sol4~
    sol8 fad16 sol la fad re do
    si32(la si do re8) sol4\parenthesize ~

    %100
    sol8 fad16 sol la fad re do
    si8 si4 si8
    si8.\prall dod32 re dod8 si

    %103
    si\prall lad r fad'\mbreak
    sol2~
    \tuplet 3/2 { sol16 fad(sol) mi[re(mi)] } dod8 sol'

    %106
    fad2~
    \tuplet 3/2 { fad16 mi(fad) re[dod?(re)] } si8 fad'
    mi2~

    %109
    \tuplet 3/2 { mi16 re(mi) dod[si(dod)] } lad8 mi'
    \tuplet 3/2 {
        re16 dod(re) mi[re(mi)] fad mi(fad) sol[fad(mi)]
        re dod(re) mi[re(mi)] fad mi(fad) sol[fad(mi)]
    }\mbreak

    %112
    fad8.\prall mi32 fad mi8 re
    re\prall dod? r4
    re'8\tu re, \tuplet 3/2 { r16 re(mi) fad[mi(re)] }

    %115
    la'8 la la si16. dod32
    re8. dod32 si la8 la
    \tuplet 3/2 {
        sol16 fad (sol) mi[re(mi)] la, dod(mi) sol[fad(mi)]

        %118
        fad mi(fad) re[dod re]
    } re,8 r
    sol'8\solo sol,\mbreak \tuplet 3/2 { r16 sol(la) si[(la sol)] }
    re'8 re re8.\prall mi32 fad

    %121
    sol8.\prall fad32 mi re8 re
    \tuplet 3/2 { do16 si(do) la[sol(la)] } re,8 do'
    \tuplet 3/2 { si16 la(si) sol[fad(sol)] } re8 re'

    %124
    \tuplet 3/2 { do16 si(do) la[sol(la)]  re,fad(la) do[si(la)]}
    si8.\prall do32 re do8 si
    si_\prall la\mbreak  r re

    %127
    sol2~
    sol16 fa mi re sol fa mi re
    \slashedGrace re8 mi4 r8 re

    %130
    la'2\parenthesize ~
    la16 sol fad? mi la sol fad mi
    \slashedGrace mi8 fad4 r8 re,

    %133
    do'[do do do]
    \tuplet 3/2 {
        do16 si(do) fad[mi(fad)] la sol(fad) mi[re(do)]
        si la(si) re[do(re)]\mbreak sol fad(mi) re [do(si)]

        %136
        la sold(la) do[si(do)] mi re(do) si[la(sol?))]
    }
    sol8 fad r re'
    re\prall dod r do

    %139
    do\prall si r re
    re\prall dod r do
    do si4 la16 sol

    %142
    sol2~
    sol
    sol4\fermata la\mbreak

    %145
    sol'8\tu sol, \tuplet 3/2 { r16 sol(la) si[(la sol)] }
    re'8 re re mi16. fad32
    sol8. \prall fad32 mi re8 re

    %148
    mi16. do'32 mi,16. do'32 mi,16. do'32 mi,16. do'32
    re,16. si'32 re,16. si'32 re,16. si'32 re,16. si'32
    do,16. la'32 do,16. la'32 do,16. la'32 do,16. la'32

    %151
    sol8 sol4 sol8~
    sol8 \tuplet 3/2 { si16 [la(sol)] si[la(sol)] si la(sol) }
    sol8 \tuplet 3/2 {
        si16 [la(sol)] si[la(sol)] si la(sol)\mbreak

        %154
        sol si(la) sol[fad(mi)]
    } re8 do
    si16 do8 re mi fad16
    sol8.\prall fad32 mi re8 do

    %157
    \tuplet 3/2 { si16 do(re) mi[fad(sol)] } si8 la
    \tuplet 3/2 { sol16 fad(sol) mi[re(mi)] } do8 re
    sol,8 sol' sol, r\fermopz

}

IvlIn =  \relative do'' {

    sol'8 sol, \tuplet 3/2 { r16 sol(la) si[(la sol)] }
    re'8 re re8. mi32 fad
    sol8.\prall fad32 mi re8 re

    %4
    \tuplet 3/2 { mi16 red(mi) sol[fad \parenthesize (sol)] } do8 r
    \tuplet 3/2 { mi,16\p red(mi) sol[fad sol] } do8 r
    \tuplet 3/2 { re,?16\f dod(re) sol[fad(sol)] } si8 r

    %7
    \tuplet 3/2 { re,16\p dod(re) sol[fad\parenthesize (sol)] } si8 r
    \tuplet 3/2 { do,16\f si(do) fad[mi(fad)] la sol(fad) mi[re(do)]}\mbreak
    si16. sol'32 si,16. sol'32 si,16. sol'32 si,16. sol'32

    %10
    do,16. sol'32 do,16. sol'32 do,16. sol'32 do,16. sol'32
    re16. sol32 re16. sol32 re16. sol32 re16. sol32
    mi4~\tuplet 3/2 { mi16 re(do) si[la(sol)] }

    %13
    fad8 re16. re32 re16. re32 re16. re32
    <fad' la, re,>8 re,[fad re]\mbreak
    la4 la

    %16
    la la
    la la
    re re

    %19
    sol8[si si si]
    fad[fad fad fad]
    dod[dod dod dod]

    %22
    re4 r
    r8 do'16. si32 la8 sol
    fad[fad fad fad]

    %25
    sol[sol sol sol]
    sol fad r4
    sol'8 sol, \tuplet 3/2 { r16 sol(la) si[(la sol)] }

    %28
    re'8 re re8.\prall mi32  fad
    sol8.\prall fad32 mi re8 re
    mi16. do'32 mi,16. do'32 mi,16. do'32 mi,16. do'32

    %31
    re,16. si'32 re,16. si'32 re,16. si'32 re,16. si'32
    do,16. la'32 do,16. la'32 do,16. la'32 do,16. la'32
    <sol si, re, sol,>8 sol4 sol8~

    %34
    sol \tuplet 3/2 {si16 [la(sol)] si[la(sol)] si la(sol)}
    <sol si, re, sol,>8 \tuplet 3/2 {
        si16 [la(sol)] si[la(sol)] si la(sol)
        sol si(la) sol[fad(mi)]
    } re8 do

    %37
    si16 do8 re mi fad16
    sol8.\prall fad32 mi re8 do
    \tuplet 3/2 { si16 do(re) mi[fad(sol)] } si,8 la

    %40
    \tuplet 3/2 { sol16 fad(sol) mi[re(mi)] } do8 re
    sol, sol' sol, r
    R2*7

    %49
    r8 fad'[la fad]
    mi fad r fad\mbreak
    mi fad r fad

    %52
    si[la sol fad]
    mi4 mi
    la8[sol fad mi]

    %55
    re4 re
    sol8[fad mi re]
    dod[mi mi mi]

    %58
    fad[fad fad fad]
    mi[mi mi mi]
    fad4 r
    R2*6

    %67
    re'8\tu re, \tuplet 3/2 { r16 re' (mi) fad[mi(re)] }
    la'8 la la si16 dod
    re8. dod32 si la8 la

    %70
    \tuplet 3/2 {
        sol16 fad(sol) mi[re(mi)]\mbreak la, dod(mi) sol[fad(mi)]
        fad mi(fad) re[dod(re)]
    } re,8 la'16. si32
    do!8[do do do]

    %73
    \tuplet 3/2 { do16 (la') la\upl } la8\upl\noBeam \tuplet 3/2 {
        r16 la,(si) do[si(la)]
        si (sol') sol\upl
    } sol8\upl\noBeam \tuplet 3/2 {
        r16 sol,(la) si[la(sol)]
        la (fad') fad\upl
    } fad8\noBeam\upl \tuplet 3/2 { r16 la,(si) do[si(la)]  }

    %76
    sol8 mi'4 mi8~
    mi mi4 mi8\mbreak
    mi, mi'4 mi8~

    %79
    mi mi4 mi8
    mi16. si'32 mi,16. si'32 mi,16. si'32 mi,16. si'32
    mi,16. do'32 mi,16. do'32 mi,16. do'32 mi,16. do'32

    %82
    mi,16. si'32 mi,16. si'32 mi,16. si'32 mi,16. si'32
    do4~\tuplet 3/2 { do16 si(la) sol[fad(mi)] }
    red8 red,16. red32 red8 red

    %85
    red?4 r
    R2*5

    %91
    sol16 sol' fad mi red(mi) red(mi)
    r16 sol fad mi red(mi) red(mi)
    r16 sol fad mi red(mi) red(mi)

    %94
    do'4~\tuplet 3/2 { do16 si(la) sol[fad(mi)] }\mbreak
    mi8\prall red r4
    r8 si,[re si]

    %97
    do si r si'\mbreak
    do[do fad, fad]
    r si[re si]

    %100
    do[do fad, fad]
    sol[si si la]
    sol4. sold8

    %103
    fad lad16. si32 dod8 lad
    r sol'16. fad32 mi8 dod?
    dod[dod dod dod]

    %106
    fad[mi re dod]
    si[si si si]
    mi[re dod si]

    %109
    lad[lad lad lad]
    si4 r
    R2*3\mbreak
    re'8 re, \tuplet 3/2 { r16 re(mi) fad[mi(re)] }

    %115
    la'8 la la si16. dod32
    re8. dod32 si la8 la
    \tuplet 3/2 {
        sol16 fad (sol) mi[re(mi)] la, dod(mi) sol[fad(mi)]

        %118
        fad mi(fad) re[dod re]
    } re,8 r
    r8 si' [si si]
    la[la la la]

    %121
    sol[sol re si]
    fad'[fad fad fad]
    sol[sol sol sol]\mbreak

    %124
    re[fad fad fad]
    si,[si' sol sol]
    re4 r

    %127
    R2
    re4 re
    mi16 mi' do sol mi8 r

    %130
    R2
    mi4 mi
    fad16 fad' re la fad8 r

    %133
    R2
    la4 la
    si si

    %136
    do mi,
    re r
    R2*7

    %145
    sol'8 sol, \tuplet 3/2 { r16 sol(la) si[(la sol)] }
    re'8 re re mi16. fad32
    sol8. \prall fad32 mi re8 re

    %148
    mi16. do'32 mi,16. do'32 mi,16. do'32 mi,16. do'32
    re,16. si'32 re,16. si'32 re,16. si'32 re,16. si'32
    do,16. la'32 do,16. la'32 do,16. la'32 do,16. la'32

    %151
    <sol si, re, sol,>8 sol4 sol8~
    sol8 \tuplet 3/2 { si16 [la(sol)] si[la(sol)] si la(sol) }
    <sol si, re, sol,>8 \tuplet 3/2 {
        si16 [la(sol)] si[la(sol)] si la(sol)\mbreak

        %154
        sol si(la) sol[fad(mi)]
    } re8 do
    si16 do8 re mi fad16
    sol8.\prall fad32 mi re8 do

    %157
    \tuplet 3/2 { si16 do(re) mi[fad(sol)] } si,8 la
    \tuplet 3/2 { sol16 fad(sol) mi[re(mi)] } do8 re
    sol,8 sol' sol, r\fermopz

}

IvlIIn = \relative do'' {

    sol'8 sol, \tuplet 3/2 { r16 sol(la) si[(la sol)] }
    la8 re4 re8~
    re re4 si8

    %4
    do16 mi mi mi mi mi mi mi
    do\p mi mi mi mi  mi mi mi
    si \f re re re re re re re

    %7
    si\p re re re re re re re\mbreak
    la8 do4 la8
    sol16. si32 sol16. si32 sol16. si32 sol16. si32

    %10
    la16. do32 la16. do32 la16. do32 la16. do32
    si16. re32 si16. re32 si16. re32 si16. re32
    do8[mi, mi mi]

    %13
    fad8 [re16. re32] re16. re32 re16. re32
    <fad' la, re,>8 fad,[fad fad]
    fad mi4 sol8~

    %16
    sol fad4 re'8~
    re dod4 mi8\parenthesize ~\mbreak
    mi re4 fad8

    %19
    sol[sol, sol sol]
    re[re re re]
    la[la la la]

    %22
    re4 r
    r8 la'16. sol32 fad8 mi
    re[re re re]

    %25
    re[re re re]
    re4 r
    sol'8 sol, \tuplet 3/2 { r16 sol(la) si[(la sol)] }

    %28
    la8 re4 re8~
    re re4 si8
    do16. mi32 do16. mi32\mbreak do16. mi32 do16. mi32

    %31
    si16. re32 si16. re32 si16. re32 si16. re32
    la16. do32 la16. do32 la16. do32 la16. do32
    <sol' si, re, sol,>8 sol4 sol8~

    %34
    sol \tuplet 3/2 {si16 [la(sol)] si[la(sol)] si la(sol)}
    <sol si, re, sol,>8 \tuplet 3/2 {
        si16 [la(sol)] si[la(sol)] si la(sol)
        sol si(la) sol[fad(mi)]
    } re8 do

    %37
    si16 do8 re mi fad16
    sol8.\prall fad32 mi re8 do
    \tuplet 3/2 { si16 do(re) mi[fad(sol)] } si,8 la

    %40
    \tuplet 3/2 { sol16 fad(sol) mi[re(mi)] } do8 re
    sol, sol' sol, r
    R2*7

    %49
    r8 re'[fad re]
    la re r re
    la re r re

    %52
    sol[fad mi re]
    dod4 dod
    fad8[mi re dod]

    %55
    si4 si\mbreak
    mi8[re dod si]
    la[dod dod dod]

    %58
    re[re re re]
    dod[dod dod dod]
    re4 r

    %61
    R2*6
    re'8 r \tuplet 3/2 { r16 re(mi) fad[mi(re)] }
    mi8 la4 la8~

    %69
    la la4 fad8
    \tuplet 3/2 {
        sol16 fad(sol) mi[re(mi)]\mbreak la, dod(mi) sol[fad(mi)]
        fad mi(fad) re[dod(re)]
    } re,8 la'16. si32

    %72
    la8[la' la, la']
    la,[la' la, la']
    sol, [sol' sol, sol']

    %75
    fad,[fad' fad, fad']
    sol, mi'4 mi8\parenthesize ~
    mi mi4 mi8

    %78
    mi, mi'4 mi8~
    mi mi4 mi8
    mi si16. mi32 si16. mi32 si16. mi32

    %81
    do16. mi32 do16. mi32 do16. mi32 do16. mi32
    si16. mi32 si16. mi32 si16. mi32 si16. mi32\mbreak
    do8[mi mi mi]

    %84
    red8 si,16. si32 si8 si
    si4 r
    R2*5

    %91
    r8 sol[sol sol]
    la[la la la]
    si[si si si]

    %94
    do4 r8 dod
    si4 r
    r8 sol[si sol]

    %97
    do sol r sol'
    la[la re, re]
    r sol[si sol]

    %100
    la[la re, re]\mbreak
    sol,[sol' sol fad]
    mi4. mid8

    %103
    fad fad16. sold32 lad8 fad
    r8 mi'16. re32 dod8 si
    la![la la la]

    %106
    re[dod si la]
    sold[sold sold sold]
    dod[si lad sold]

    %109
    fad[fad fad fad]
    si,4 r
    R2*3

    %114
    re''8 re, \tuplet 3/2 { r16 re(mi) fad[mi(re)] }\mbreak
    mi8 la4 la8~
    la la4 fad8
    \tuplet 3/2 {
        sol16 fad (sol) mi[re(mi)] la, dod(mi) sol[fad(mi)]

        %118
        fad mi(fad) re[dod re]
    } re,8 r
    r sol[sol sol]
    fad[fad fad fad]

    %121
    mi[mi si sol]
    re'[re re re]
    re[re re re]

    %124
    re[re re re]
    sol,[sol' do, dod]\mbreak
    re4 r

    %127
    R2
    si4 si
    do16[do' sol mi] do8 r

    %130
    R2
    dod4 dod
    re16 re' la fad re8 r

    %133
    R2
    fad4 fad
    sol sol

    %136
    sol sol
    re r
    R2*7

    %145
    sol'8 sol, \tuplet 3/2 { r16 sol(la) si[(la sol)] }
    la8 re4 re8~
    re re4 si8\mbreak

    %148
    do16. mi32 do16. mi32\mbreak do16. mi32 do16. mi32
    si16. re32 si16. re32 si16. re32 si16. re32
    la16. do32 la16. do32 la16. do32 la16. do32

    %151
    <sol' si, re, sol,>8 sol4 sol8~
    sol \tuplet 3/2 {si16 [la(sol)] si[la(sol)] si la(sol)}
    <sol si, re, sol,>8 \tuplet 3/2 {
        si16 [la(sol)] si[la(sol)] si la(sol)

        %154
        sol si(la) sol[fad(mi)]
    } re8 do
    si16 do8 re mi fad16
    sol8.\prall fad32 mi re8 do

    %157
    \tuplet 3/2 { si16 do(re) mi[fad(sol)] } si,8 la
    \tuplet 3/2 { sol16 fad(sol) mi[re(mi)] } do8 re
    sol, sol' sol, r\fermopz

}

Ivlan =  \relative do' {

    si8[si si si]
    la[la la la]
    sol[sol' sol sol]

    %4
    mi[mi mi mi]
    mi\p[do do do]
    re\f[re  re re]

    %7
    re\p[si sol' sol]
    sol\f[sol fad fad]
    sol[re re re]\mbreak

    %10
    do[do do do]
    re[re re re]
    do4 r8 mi

    %13
    re[fad, fad fad]
    re'4 r
    R2*12

    %27
    si8[si si si]
    la[la la la]
    sol[sol' sol sol]

    %30
    sol[sol sol sol]
    fad[fad fad fad]\mbreak
    mi[mi mi mi]

    %33
    re[mi re do]
    si[si la la]
    sol[sol' fad mi]

    %36
    re[sol sol la]
    si4 r8 la
    sol[sol sol la]

    %39
    si[sol sol fad]
    sol[mi do re]
    sol,4 r

    %42
    R2*25\mbreak
    fad'8[fad fad fad]
    mi[mi mi mi]

    %69
    re[re re re]
    mi[dod dod dod]
    re[fad fad] r

    %72
    r do'!16. si32 la8 sol
    fad[fad fad fad]
    sol[sol dod, dod]

    %75
    fad[fad si, si]
    mi[sol fad mi]\mbreak
    re[mi re do?]

    %78
    si[mi re do]
    si[do si la]
    sol[si si si]

    %81
    do[do do do]
    si[si si si]
    la[dod dod dod]

    %84
    red[red red red]
    red?4 r
    R2*28\mbreak

    %114
    fad8[fad fad fad]
    mi[mi mi mi]
    re[re re fad]

    %117
    dod[dod dod dod]
    re re re16 do? si la
    sol4 r

    %120
    R2*25
    si8[si si si]
    la[la la la]\mbreak

    %147
    sol[sol' sol sol]
    sol[sol sol sol]
    fad[fad fad fad]

    %150
    mi[mi mi mi]
    re[mi re do]
    si[si la la]

    %153
    sol[sol' fad mi]
    re[sol sol la]
    si4 r8 la\mbreak

    %156
    sol[sol sol la]
    si[sol sol fad]
    sol[mi do re]

    %159
    sol, si si r\fermata

}

Ibcn = \relative do {

    sol'8[sol sol sol]
    fad[fad fad fad]
    mi[mi si sol]

    %4
    do[do' do do]
    la[la la la]
    si,[si' si si]

    %7
    sol[sol sol sol]
    la[la re, re]
    sol,[sol' sol sol]

    %10
    la,[la' la la]
    si,[si' si si]\mbreak
    do[do, do dod]

    %13
    re[re' la fad]
    re4 r
    R2*11

    %26
    r4 re'16 do si la
    sol8[sol sol sol]
    fad[fad fad fad]

    %29
    mi[mi si sol]
    do [do' la la]
    si,[si' sol sol]

    %32
    la,[la' fad fad]
    sol[do si si]\mbreak
    sol[sol fad fad]

    %35
    mi [mi re do]
    si[do si la]
    sol[la si do]

    %38
    si[do si la]
    sol[do re re,]
    sol[mi' do re]

    %41
    sol,4 r
    sol8 [sol'\solo sol sol]
    fad[fad fad fad]

    %44
    mi[mi mi mi]
    si[si do re]\mbreak
    sol,[la si do]

    %47
    si[si' fad fad,]
    sol[sol' sol,] r
    R2*8

    %57
    r8 la'[la, la]
    la4 la
    la la

    %60
    re8[re' la fad]
    re[re' do re]
    sib[sib sold sold]

    %63
    la[la sol! sol]
    fad[fad re re]\mbreak
    dod8[dod dod dod]

    %66
    re[sol la la,]
    re[re' re re]
    dod[dod dod dod]

    %69
    si[si fad re]
    la'[la, la la]
    re[re' re,] r

    %72
    r la'16. sol32 fad8 mi
    re[re re re]
    sol[sol mi mi]

    %75
    fad[fad red red]\mbreak
    mi[mi' re! do]
    si[do si la]

    %78
    sol[do si la]
    sol[la sol fad]
    mi[sol sol sol]

    %81
    la[la la la]
    sol[sol sol sol]
    la[la, la la]

    %84
    si[si' fad red]
    si4 r
    r8 mi\solo[sol mi]

    %87
    la mi\mbreak r sol
    fad4 si,
    mi8[sol fad mi]

    %90
    fad4 si,
    mi8[mi mi mi]
    fad[fad fad fad]

    %93
    sol[sol sol sol]
    la[la, la lad]
    si si' si, r

    %96
    R2*14
    si8[dod re mi]
    si[dod? re mi]

    %112
    re4 mi8\tu mid\mbreak
    fad fad16. sol32 fad8 mi
    re[re' re re]

    %115
    dod[dod dod dod]
    si[si fad re]
    la' [la, la la]

    %118
    re re re16 do! si la
    sol4 r
    R2*6

    %126
    r8re'16.\solo mi32 re8 do
    si [do si la]
    sol4 sol

    %129
    do r\mbreak
    r8 dod16 re dod8 si
    la4 la

    %132
    re r
    r8 la'16 sol fad8 mi
    re4 re

    %135
    sol, sol'
    do,4. dod8
    re[re' re,] r

    %138
    mi4 fad
    sol re
    mi fad

    %141
    sol re
    mi8 mi16 fad\mbreak sol fad mi re
    dod8[dod dod dod]

    %144
    re2\fermata
    sol,8[sol' sol sol]
    fad[fad fad fad]

    %147
    mi[mi si sol]
    do[do' la la]
    si,[si' sol sol]

    %150
    la,[la' fad fad]
    sol[do si la]
    sol[sol fad fad]

    %153
    mi[mi re do]\mbreak
    si[do si la]
    sol[la si do]

    %156
    si[do si la]
    sol[do re re,]
    sol[mi' do re]

    %159
    sol,[sol' sol,] r\fermopz

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sol\major
    \time 2/4
    \tempo 2 = 47
    s2*159
    \bar"|."


}

Ifl = {
    \Iglobal
    <<\Ifln \forma>>

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

}



IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine\senza
}

IIfln = \relative do'' {

    do'8.\prall si32 la sol4 do,
    \grace {fa16[sol]} la4 sol mi\parenthesize ~
    mi16 re re(fa) fa(mi) mi(sol) sol(fa) fa(mi)

    %4
    mi16(re) re(fa) fa(mi) mi(sol) sol(fa) fa(mi)
    la2.
    r8 la sol fa mi re

    %7
    sol2.\mbreak
    r8 sol fa mi re do
    fa2.~

    %10
    fa8 la sol fa mi re
    mi4\prall re sol
    fad16 sol la sol fa?8 fa fa fa

    %13
    fa do'\parenthesize ~ do16 si si la la sol sol fa
    sol8 la sol fa mi re\mbreak
    do2.~

    %16
    do16(mi) mi\upl sol\upl do,(mi) mi\upl sol\upl do,(mi) mi\upl sol\upl
    la fa mi re \grace {do16[re]} re2\prall
    do8 sol'4\solo  sol sol8~

    %19
    sol2.~
    sol
    sol4~sol8 fa16 sol\tuplet 3/2 { la sol(fa) mi[re(do)] }

    %22
    \grace do8 si4\prall do8 mi fa sol\mbreak
    la4\parenthesize ~ la16 sol sol fa fa mi mi re
    sol4~sol16 fa fa mi mi re re do

    %25
    fad?4~\tuplet 3/2 { fad16 la sol fad[sol la] } re,8 la'
    \grace la8 sol4~\tuplet 3/2 { sol16 si la sol [la si] } re,8 si'
    \grace si8 la4 ~la16 sol fad? mi re do si do\mbreak

    %28
    si8 sol' sol sol sol sol
    sol2.~
    sol~

    %31
    sol16 sol la si la sol fad? mi re8 do
    si16 do do re re red red mi mi do si la
    si8 la16 sol la2_\prall

    %34
    sol8. si'32 la sol8 sol sol16 fad mi re\mbreak  %% fine prima pagina
    mi8\prall \tu re fa!2~
    fa8 la sol fa mi re

    %37
    mi8.\prall fad32 sol fad4 mi
    red16 si si'8~si red, mi fad
    mi16 si si'8~si mi, fad sol

    %40
    fad16 si, si'8~si fad sol la
    sol do si la sol fad
    \tuplet 3/2 { sol16 fad? mi do[si la] } sol4 fad

    %43
    si'2.\solo
    si
    si

    %46
    do8 si la sol fad? mi
    red8 si'4 red,8 mi fad
    mi16 sol si4 mi,8 fad sol

    %49
    fad si4 fad8 sol la
    sol8.\prall fad?32 sol la4 fad
    sol fad si~

    %52
    si8 la sold fa! mi re\mbreak
    do mi la2~
    la16 sol fad sol fad mi re mi re do si do

    %55
    si8 sol si re \tuplet 3/2 { fa!16 mi(re) } r8
    r sol, do mi \tuplet 3/2 { sol16 fa(mi) } r8
    r sol, re' fa \tuplet 3/2 { la16 sol(fa) } r8

    %58
    mi fa4 sol sold8
    la4~la16 sol! fa mi re do si do\mbreak
    do4\prall si sol'

    %61
    fad2.
    fa!
    \parenthesize mi

    %64
    mi8 la sol fa mi re
    sol2.\fermata
    do8.\tu si32 la sol4 do,

    %67
    \grace {fa16[sol]} la4 sol mi
    mi16(re) re(fa) fa(mi) mi(sol) sol(fa) fa(mi)
    mi16(re) re(fa) fa(mi) mi(sol) sol(fa) fa(mi)

    %70
    la2.
    r8 la sol fa mi re
    sol2.

    %73
    r8 sol fa mi re do
    fa2.~
    fa8 la sol fa mi re

    %76
    do2.\parenthesize ~
    do16(mi) mi(sol) do,(mi) mi(sol) do,(mi) mi(sol)
    la fa mi re  \grace {si16[do]} re2\prall

    %79
    do8 la' sol fa mi re\mbreak
    do8 do do do do do
    do2 r4\fermopz

}

IIvlIn =  \relative do'' {

    do'8.\prall si32 la sol4 do,
    \grace {fa16[sol]} la4 sol mi ~
    mi16 re re(fa) fa(mi) mi(sol) sol(fa) fa(mi)

    %4
    mi16(re) re(fa) fa(mi) mi(sol) sol(fa) fa(mi)
    la2.
    r8 la sol fa mi re

    %7
    sol2.\mbreak
    r8 sol fa mi re do
    fa2.\parenthesize ~

    %10
    fa8 la sol fa mi re
    mi4\prall re sol
    fad16 sol la sol fa?8 fa fa fa

    %13
    fa do' ~ do16 si si la la sol sol fa
    sol8 la sol fa mi re\mbreak
    do2.\parenthesize ~

    %16
    do16(mi) mi\upl sol\upl do,(mi) mi\upl sol\upl do,(mi) mi\upl sol\upl
    la fa mi re \grace {do16[re]} re2\prall
    do8 mi, fa fa sol sol

    %19
    re re mi mi fa fa\mbreak
    mi mi fa fa sol sol
    re re mi mi la la

    %22
    sol4 sol mi
    la8 la la la la la
    r sol sol sol sol sol

    %25
    r fad fad fad fad fad
    r sol sol sol sol sol
    r fad fad fad fad fad

    %28
    sol2 r4
    si,8 si' la sol fad mi
    re sol fad mi re do

    %31
    si2 fad'4\mbreak
    sol2 mi4
    re2 re4

    %34
    sol'8.\prall si32 la sol8 sol sol16 fad mi re\mbreak  %% fine prima pagina
    mi8\prall \tu re fa!2~
    fa8 la sol fa mi re

    %37
    mi8.\prall fad32 sol fad4 mi
    red16 si si'8~si red, mi fad
    mi16 si si'8~si mi, fad sol

    %40
    fad16 si, si'8~si fad sol la
    sol do si la sol fad
    \tuplet 3/2 { sol16 fad? mi do[si la] } sol4 fad

    %43
    mi8 sol la la si si
    fad fad sol sol la la
    sol sol la la si si

    %46
    la2 dod4
    si8 si si si si si
    si si si si si si

    %49
    fad fad fad fad fad fad
    sol4 do, dod
    si2 r4

    %52
    R2.*12
    do8 do' la la la la
    sol2.\fermata

    %66
    do'8. si32 la sol4 do,
    \grace {fa16[sol]} la4 sol mi
    mi16(re) re(fa) fa(mi) mi(sol) sol(fa) fa(mi)
    mi16(re) re(fa) fa(mi) mi(sol) sol(fa) fa(mi)

    %70
    la2.
    r8 la sol fa mi re
    sol2.

    %73
    r8 sol fa mi re do
    fa2.~
    fa8 la sol fa mi re

    %76
    do2.\parenthesize ~
    do16(mi) mi(sol) do,(mi) mi(sol) do,(mi) mi(sol)
    la fa mi re  \grace {si16[do]} re2\prall

    %79
    do8 la sol fa mi re\mbreak
    do8 do' do, do' do, do'
    do,2 r4\fermopz

}

IIvlIIn = \relative do'' {

    do8 mi mi mi mi mi
    \grace {re16[mi]} fa4 mi do~
    do16 si si(do) re(do) do(mi) mi(re) re(do)

    %4
    do(si) si(re) re(do) do(mi) mi(re) re(do)
    do4 fa2~
    fa2.

    %7
    mi~
    mi
    re~

    %10
    re
    do4 si si
    do2.~

    %13
    do8 do do do do do
    si fa' mi re do si
    do2.\parenthesize ~

    %16
    do16(mi) mi\upl sol\upl do,(mi) mi\upl sol\upl do,(mi) mi\upl sol\upl
    do,4 do si\mbreak
    do8 do, re re mi mi

    %19
    si si do do re re
    do do re re mi mi
    si si do do fa fa

    %22
    fa4 mi do
    r8 fa fa fa fa fa
    r mi mi mi mi mi

    %25
    r re re re re re
    r re re re re re
    re re re re re re

    %28
    sol,2.
    sol8 sol' fad mi re do
    si mi re do si la

    %31
    sol2 re'4
    sol,2 do4
    re2 re4

    %34
    si'8. re32 do si4 si
    do8 si si si si do
    re2.

    %37
    do2 dod4
    red8 red4 red red8
    mi mi4 mi mi8

    %40
    fad fad4 fad fad8
    mi2 red4
    mi8 mi, mi4 red\mbreak

    %43
    mi8 mi fad fad sol sol
    red red mi mi fad fad
    mi mi fad fad sol sol

    %46
    la2 lad4
    si8 si si si la! la
    sol sol sol sol sol sol

    %49
    red red red red red red
    mi4 la, lad
    si2 r4

    %52
    R2.*12
    do8 do' fa, fa fad fad
    sol2.\fermata\mbreak

    %66
    do8 mi mi mi mi mi
    \grace {re16[mi]} fa4 mi do~
    do16 si si(do) re(do) do(mi) mi(re) re(do)

    %69
    do(si) si(re) re(do) do(mi) mi(re) re(do)
    do4 fa2~
    fa2.

    %72
    mi~
    mi
    re~

    %75
    re
    do\parenthesize ~
    do16(mi) mi(sol) do,(mi) mi(sol) do,(mi) mi(sol)
    la8. do,16 do4 si

    %79
    do8 fa, mi re do si
    do8 do' do, do' do, do'
    do,2 r4\fermopz

}

IIvlan =  \relative do' {

    mi4 sol mi
    fa do do'
    sol sol, do

    %4
    sol sol' sol
    la8 si la sol fa mi
    re4 re re

    %7
    re8 la' sol fa mi re
    do4 do do\mbreak
    do8 sol' fa mi re do

    %10
    si4 si si
    do sol sol'
    la la la

    %13
    lab2 lab4
    sol2 sol4
    do,8 mi mi mi re re

    %16
    do do do do sol sol\mbreak
    la4 sol sol
    sol r r

    %19
    R2.*15
    sol'4 si la
    do8 sol sol, sol' sol, la

    %36
    si4 si si
    do la lad
    si8 si' si si la? la\mbreak

    %39
    sol sol sol sol sol sol
    red red red red red red
    mi2 si4

    %42
    mi8 la si4 si,
    mi r r
    R2.*22

    %66
    mi4 sol mi
    fa do do'\mbreak
    sol2 do4

    %69
    sol, sol' sol
    la8 si la sol fa mi
    re4 re re

    %72
    re8 la' sol fa mi re
    do4 do do
    do8 sol' fa mi re do

    %75
    si4 si si\mbreak
    do8 mi mi mi re re
    do do do do sol sol

    %78
    la4 sol sol
    sol2 r4
    do8 mi sol do sol mi

    %81
    do2 r4\fermata

}

IIbcn = \relative do {

    do4 mi do
    fa do do'
    sol sol, do

    %4
    sol2 do4
    fa8 sol fa mi re do
    si4 si si

    %7
    mi8 fa mi re do si
    la4 la la\mbreak
    re8 mi re do si la

    %10
    sol4 sol sol
    do sol sol'
    la la la

    %13
    lab2 lab4
    sol2 sol4
    do,8 do' do do do do

    %16
    la? la la la mi mi
    fa4 sol sol,\mbreak
    do4 r r

    %19
    R2.*15
    sol'4 si sol
    do8 sol sol, sol' sol, la

    %36
    si4 si si
    do la lad
    si8 si' si si la! la

    %39
    sol sol sol sol sol sol
    red red red red red red\mbreak
    mi2 si4

    %42
    mi8 la si4 si,
    mi r r
    R2.*7

    %51
    r4 si'8\solo do si la
    sold2 sold4
    la,8 la'  la si la sol!

    %54
    fad?4 fad fad
    sol sol sol
    sol sol sol\mbreak

    %57
    si, si si
    do re mi
    fa fa fad

    %60
    sol sol, r
    r8 la la la la la
    r si si si si si

    %63
    la2 sol'4
    do8 mi, fa fa fad  fad
    sol2.\fermata

    %66
    do,4\tu mi do
    fa do do'
    sol2 do4

    %69
    sol2 do4
    fa,8 sol fa mi re do
    si4 si si

    %72
    mi8 fa mi re do si
    la4 la la
    re8 mi re do si la\mbreak

    %75
    sol4 sol sol
    do8 do' do do si si
    la la la la mi mi

    %78
    fa4 sol sol,
    do2 r4
    do8 mi sol do sol mi

    %81
    do2 r4\fermopz

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 3/4
    \tempo 4 = 60
    s2.*81
    \bar"|."


}

IIfl = {
    \IIglobal
    <<\IIfln \forma>>

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
    \terzinequarto\senza
}

IIIfln = \relative do'' {

    sol'2 sol
    sol si8 la sol fad
    sol2 sol8 fad mi re

    %4
    mi4 re sol2
    do,4 si sol'2
    mi4 re sol2

    %7
    do,4 si sol'2
    \tuplet 3/2 { fad8 sol(la) } re,4 re re
    re re re re

    %10
    \tuplet 3/2 { sol8 la(si) } re,4 re re\mbreak
    re re re re
    \tuplet 3/2 { fad8 sol(la) } re,4 re re

    %13
    re re re re
    dod?8(re mi) mi\upl mi mi mi mi
    sol4 fad2 mi4

    %16
    re8(mi fad) fad fad fad fad fad
    la4 sol2 fad4
    mi8(fad sol) sol\upl sol sol sol sol

    %19
    si4 la2 sol4
    fad2 fad\mbreak
    fad fad8 mi re dod

    %22
    fad2 re8 dod si la
    si la sol fad sol fad mi re
    dod4 re sol la

    %25
    fad'2 re\solo
    re\prall dod
    r do!

    %28
    do\prall si
    r  re
    re\prall dod

    %31
    r do!
    do\prall si~
    si la

    %34
    si8 sol si' la\mbreak sol fad mi re
    do la la' sol fad mi re do
    si sol sol' fad mi re do si

    %37
    si1
    si\fermata
    la2 r
    sol'2\tu sol

    %41
    sol si8 la sol fad
    sol2 sol8 fad mi re
    mi4 re sol2

    %44
    do,4 si sol'2
    mi4 re sol2\mbreak
    fad8 (sol la) re,\upl re\upl re\upl re\upl re\upl

    %47
    sol(la si) re,\upl re\upl re\upl re\upl re\upl
    la'(si do) re,\upl re\upl re\upl re\upl re\upl
    do4 si2 la4

    %50
    sol8 la si do re mi fad sol
    sol, la si do re mi fad sol
    sol, la si do re mi fad sol

    %53
    sol, la si do re mi fad sol
    mi4 re2 do4\mbreak
    si8 si' la sol fad mi re do

    %56
    si2 la
    sol4 mi do re
    sol2 r

    %59
    sol'\solo si8 la sol fad
    sol2 sol8 fad mi re
    mi4 re sol2

    %62
    mi4 re sol2
    sol4 fad2 mi4~
    mi re2 do4~

    %65
    do si2 la4
    si8 sol mi' re do si la sol\mbreak
    re4 la'' la2\parenthesize ~

    %68
    la4 la,8 si do4 si8 la
    re,4 sol' sol2~
    sol4 si,8 do re4 do8 si

    %71
    re,4 la'' la2~
    la4 la,8 si do4 si8 la
    si2.\prall do8 re

    %74
    do2 si\prall
    si la
    r re

    %77
    la' la~
    la4 sol fad mi
    re dod re2\mbreak

    %80
    r la
    si4 si' si2~
    si4 sol,8 la si4 la8 sol

    %83
    la4 la' la2\parenthesize ~
    la4 fad,8 sol la4 sol8 fad
    sol4 sol' sol2~

    %86
    sol4 mi,8 fad sol4 fad8 mi
    fad4 re si'' la
    sol fad mi re

    %89
    re dod la'2
    fad4 mi la2
    re,4 dod la'2

    %92
    fa4 mi la2\mbreak
    re, dod
    r la

    %95
    sol' sol
    sol sol
    sol8(fad sol) si\upl la sol fad mi

    %98
    fad(mi fad) la\upl sol fad mi re
    mi(re mi) sol\upl fad mi re dod?
    re(dod re) fad\upl mi re dod si

    %101
    la1
    sol
    fad8 re mi fad sol la si dod\mbreak

    %104
    re la si dod re mi fad sol
    la2. \parenthesize sol8 la
    si2 sol

    %107
    \slashedGrace sol8 fad4 mi8 fad sol4 fad8 mi
    \grace {do16[re]} mi2 mi\prall
    fad\tu fad

    %110
    fad fad8 mi re dod
    fad2 re8 dod si la
    si4 la re2

    %113
    si4 la re2
    mi8 re dod si la sol fad sol
    fad mi re4 la''2\mbreak %fine pagina

    %116
    la8 sol la do si la sol fad
    sol mi(red mi) sol mi(red mi)
    sol (fad sol) si la sol fad mi

    %119
    fad re(dod re) fad re(dod re)
    fad (mi fad) la sol fad mi re
    mi dod(si dod) mi dod(si dod)

    %122
    mi (re mi) sol fad mi re dod?
    re2 fad
    \slashedGrace la8 sol2. fad8 mi\mbreak

    %125
    fad2 re
    \slashedGrace re8 mi2. re8 dod
    re2 fad

    %128
    sol2.\prall fad8 mi
    fad2 re
    mi2. re8 dod

    %131
    re (dod re) mi fad re dod si
    mi,2 fad
    si fad'\solo

    %134
    si2. la8 sol
    fad2 sol~
    sol fad

    %137
    r si
    sol fad
    r fad\mbreak

    %140
    sol8 mi si' la sol fad mi re
    dod4 (mi fad sol)
    fad8 re la' sol fad  mi re dod

    %143
    si4(re mi fad)
    mi8 dod sol' fad mi re dod si
    la4(dod re mi)

    %146
    re2.\prall dod8 re
    mi2 re
    re\prall dod

    %149
    R1
    r2 re
    la'2. sol8 la

    %152
    \tupletSpan 2 \con \tuplet 3/2 {
        si4 la (sol) fad mi (re)\mbreak
        re dod (mi) mi re(fad)
        fad mi(sol) sol fad(mi)

        %155
        mi red(fad) fad mi(sol)
        sol fad(la) la sol(fad)
    }
    sol2.\prall fad8 sol

    %158
    la2 sol
    fad2.\prall mi8 fad
    sol2 fad

    %161
    mi2.\prall re8 mi
    fad2 mi
    re2. dod8 re

    %164
    mi2 re
    do!2. si8 do
    re2 do

    %167
    si2.\prall la8 si\mbreak
    do2 si
    si4 la r2

    %170
    sol'2\tu sol
    sol si8 la sol fad
    sol2 sol8 fad mi re

    %173
    mi4 re sol2
    mi4 re sol2
    la8(sol fad mi) re do si do

    %176
    si la sol4 fa'2
    fa?8 mi fa la sol fa mi re
    mi2.\prall sol8 fad!

    %179
    mi2 mi
    mi2.\prall sol8 fad
    mi2 mi

    %182
    red4. si8\mbreak fad'4. red8
    si2\solo mi
    si' si8 la sol fad

    %185
    mi2 mi
    \grace re8 do2 si
    mi1~

    %188
    mi4 red2 fad4~
    fad mi2 sol4~
    sol fad2 la4~

    %191
    la sol2 fad4
    sol2.\prall fad8 sol
    la2 sol

    %194
    sol\prall fad
    R1
    r2 re

    %197
    sol1~
    \tuplet 3/2 {
        sol4 si(la) sol fad(sol)
        sol si(la)\mbreak sol fad sol
    }

    %200
    mi re sol2
    do,4 si sol'2
    la1~

    %203
    la4 sol fad mi
    re do si do
    si2 sol'~

    %206
    sol si,\parenthesize ~
    si la
    r re

    %209
    sol1~
    sol8 fa mi re sol fa mi re
    mi do sol' mi do2\prall

    %212
    r mi
    la1~
    la8 sol fad? mi la sol fad mi

    %215
    fad re la' fad re2\prall
    r re\mbreak
    mi4 sol do2~

    %218
    do8 si la sol fad mi re do
    re4 sol si2~
    si8 la sol fad mi re do si

    %221
    do4 fad la2\parenthesize ~
    la8 sol fad mi re do si la
    si re sol fad mi re do si

    %224
    la do  mi re do si la sol
    re2 la''~
    la4 la,8 si \grace re8 do4 si8 la

    %227
    re,2 sol'~
    sol4 si,8 do re4 do8 si
    re,2 la''\parenthesize ~\mbreak

    %230
    la4 la,8 si do4 si8 la
    si4 do2 re4~
    re mi2 fad4

    %233
    sol2.\prall fad8 mi
    re4 sol do, la
    fad1

    %236
    la\prallprall
    sol2 r
    sol'8 fad mi re do si la sol

    %239
    dod dod dod dod dod dod dod dod
    re4 re, r2
    sol1~

    %242
    sol2 la\fermata
    sol'2\tu sol
    sol si8 la sol fad

    %245
    sol2 sol8 fad mi re
    mi4 re sol2
    do,4 si sol'2

    %248
    mi4 re sol2
    fad8 (sol la) re,\upl re\upl re\upl re\upl re\upl

    %250
    sol(la si) re,\upl re\upl re\upl re\upl re\upl
    la'(si do) re,\upl re\upl re\upl re\upl re\upl
    do4 si2 la4

    %253
    sol8 la si do re mi fad sol
    sol, la si do re mi fad sol
    sol, la si do re mi fad sol

    %256
    sol, la si do re mi fad sol
    mi4 re2 do4\mbreak
    si8 si' la sol fad mi re do

    %259
    si2 la\prall
    sol4 mi' do re
    sol,2 r

}

IIIvlIn =  \relative do'' {

    <sol' si, re, sol,>2 <sol si, re, sol,>
    <sol si, re, sol,> si8 la sol fad
    <sol si, re, sol,>2 sol8 fad mi re

    %4
    mi4 re sol2
    do,4 si sol'2
    mi4 re sol2

    %7
    do,4 si sol'2
    \tuplet 3/2 { fad8 sol(la) } re,4 re re
    re re re re

    %10
    \tuplet 3/2 { sol8 la(si) } re,4 re re\mbreak
    re re re re
    \tuplet 3/2 { fad8 sol(la) } re,4 re re
    re re re re
    dod8(re mi) mi\upl mi mi mi mi
    sol4 fad2 mi4

    %16
    re8(mi fad) fad fad fad fad fad
    la4 sol2 fad4
    mi8(fad sol) sol\upl sol sol sol sol

    %19
    si4 la2 sol4
    <fad la, re,>2 <fad la, re,>
    <fad la, re,> fad8 mi re dod\mbreak

    %22
    <fad la, re,>2 re8 dod si la
    si la sol fad sol fad mi re
    dod4 re  sol, la

    %25
    <fad'' la, re,>2 fad,\solo
    sol1
    la~

    %28
    la2 sol
    fad1
    sol

    %31
    la~
    la2 sol~
    sol fad

    %34
    sol si
    la la
    si r

    %37
    R1*3\mbreak
    <sol' si, re, sol,>2\tu <sol si, re, sol,>
    <sol si, re, sol,> si8 la sol fad

    %%42
    <sol si, re, sol,>2 sol8 fad mi re
    mi4 re sol2
    do,4 si sol'2

    %45
    mi4 re sol2
    fad8 (sol la) re,\upl re\upl re\upl re\upl re\upl
    sol(la si) re,\upl re\upl re\upl re\upl re\upl

    %48
    la'(si do) re,\upl re\upl re\upl re\upl re\upl
    do4 si2 la4

    %50
    sol8 la si do re mi fad sol
    sol, la si do re mi fad sol
    sol, la si do re mi fad sol

    %53
    sol, la si do re mi fad sol
    mi4 re2 do4\mbreak
    si8 si' la sol fad mi re do

    %56
    si2 la
    sol4 mi do re
    sol,2 r

    %59
    si'2\solo re8 do si la
    sol2 sol
    do4 si re si

    %62
    do si re si~
    si la2 do4~
    do si2 la4~

    %65
    la sol2 fad4
    sol2 mi
    fad la

    %68
    la la
    si si
    si si

    %71
    la la
    la la\mbreak
    sol r

    %74
    R1*7
    r2 si
    si si

    %83
    la la
    la la
    sol sol

    %86
    sol sol
    fad r
    R1*21

    %109
    <fad' la, re,>2\tu <fad la, re,>
    <fad la, re,> fad8 mi re dod\mbreak
    <fad la, re,>2 re8 dod si la
    si4 la re2

    %113
    si4 la re2
    mi8 re dod si la sol fad sol
    fad mi re4 la''2\mbreak %fine pagina

    %116
    la8 sol la do si la sol fad
    sol mi(red mi) sol mi(red mi)
    sol (fad sol) si la sol fad mi

    %119
    fad re(dod re) fad re(dod re)
    fad (mi fad) la sol fad mi re
    mi dod(si dod) mi dod(si dod)

    %122
    mi (re mi) sol fad mi re dod?
    re2 fad
    \slashedGrace la8 sol2. fad8 mi\mbreak

    %125
    fad2 re
    \slashedGrace re8 mi2. re8 dod
    re2 fad

    %128
    sol2.\prall fad8 mi
    fad2 re
    mi2. re8 dod

    %131
    re (dod re) mi fad re dod si
    mi,2 fad
    si, r

    %134
    r fad''2\solo~
    fad mi
    mi4 re fad re

    %137
    mi re fad re
    mi2 re4. mi8
    fad2 re

    %140
    sol1~
    sol
    fad~

    %143
    fad
    mi~
    mi
    re2 fad,

    %147
    sol sold\mbreak
    fad lad
    la!4 si la sol

    %150
    fad2 r
    r fad
    sol si

    %153
    la la,
    la la
    si si

    %156
    si si
    sol' sol'~
    sol mi

    %159
    fad1~
    fad2 re
    mi1\parenthesize ~\mbreak

    %162
    mi2 mi
    re1~
    re2 si

    %165
    do1\parenthesize ~
    do2 la
    si1~

    %168
    si2 sol
    sol4 fad r2
    <sol' si, re, sol,>2\tu <sol si, re, sol,>

    %171
    <sol si, re, sol,> si8 la sol fad
    <sol si, re, sol,>2 sol8 fad mi re
    mi4 re sol2

    %174
    mi4 re sol2
    la8 (sol fad mi) re do si do

    %176
    si la sol4 fa'2
    fa?8 mi fa la sol fa mi re
    mi2.\prall sol8 fad!

    %179
    mi2 mi
    mi2.\prall sol8 fad
    mi2 mi

    %182
    red4. si8\mbreak fad4. red8
    si2 r
    r red\solo

    %185
    mi sol\mbreak
    la sol4. la8
    si2 sol~

    %188
    sol4 fad2 la4~
    la sol2 mi'4\parenthesize ~
    mi red2 fad4~

    %191
    fad mi2 red4
    mi2.\prall red8 mi
    fad2 mi~

    %194
    mi red
    r4 mi, re! do
    si2 r

    %197
    r si4. do8\mbreak
    re2 si
    si si4 si'

    %200
    do si re si
    la si la sol
    la si la sol

    %203
    fad2 fad
    fad fad
    sol si

    %206
    mi, mi
    re r
    re re

    %209
    re re
    re re\mbreak
    r2 mi'8 do sol mi

    %212
    do2 r
    r mi
    mi mi

    %215
    r fad'8 re la fad
    re2 r
    r mi'

    %218
    mi mi
    re re
    re re

    %221
    do do
    do do
    si sol

    %224
    sol sol
    fad la
    la la

    %227
    si si
    si si
    la la

    %230
    la la
    sol r
    R1*5

    %237
    si8 sol la si do re mi fad
    sol8 fad mi re do si la sol
    dod, dod dod dod dod dod dod dod\mbreak

    %240
    re2 r
    R1*2
    <sol' si, re, sol,>2\tu <sol si, re, sol,>

    %244
    <sol si, re, sol,> si8 la sol fad
    <sol si, re, sol,>2 sol8 fad mi re
    mi4 re sol2

    %247
    do,4 si sol'2
    mi4 re sol2
    fad8 (sol la) re,\upl re\upl re\upl re\upl re\upl

    %250
    sol(la si) re,\upl re\upl re\upl re\upl re\upl
    la'(si do) re,\upl re\upl re\upl re\upl re\upl
    do4 si2 la4

    %253
    sol8 la si do re mi fad sol
    sol, la si do re mi fad sol
    sol, la si do re mi fad sol

    %256
    sol, la si do re mi fad sol
    mi4 re2 do4\mbreak
    si8 si' la sol fad mi re do

    %259
    si2 la\prall
    sol4 mi do re
    sol,2 r

}

IIIvlIIn = \relative do'' {

    <sol' si, re, sol,>2 <sol si, re, sol,>
    <sol si, re, sol,> si8 la sol fad
    <sol si, re, sol,>2 si,

    %4
    do4 si re si
    la sol re' si
    do si re si

    %7
    la sol re' si
    la fad' la, fad'
    \tuplet 3/2 { fad8 sol(la) } re,4 re re

    %10
    re sol si, sol'
    \tuplet 3/2 { sol8 la(si) } re,4 re re\mbreak
    re la' re, la'

    %13
    \tuplet 3/2 { fad8 sol(la) } re,2 si4
    la8(si dod) dod\upl dod dod dod dod
    mi4 re2 dod4

    %16
    fad,8 re' re re re re re re
    fad4 mi2 re4
    dod8(re mi) mi\upl mi mi mi mi

    %19
    sol4 fad2 mi4
    <fad la, re,>2 <fad la, re,>
    <fad la, re,> fad8 mi re dod\mbreak

    %22
    <fad la, re,>2 re8 dod si la
    si la sol fad sol fad mi re
    dod4 re sol, la

    %25
    <fad'' la, re,>2 fad,\solo
    sol1
    la~

    %28
    la2 sol
    fad1
    sol

    %31
    la~
    la2 sol~
    sol fad

    %34
    sol sol
    la2. fad4
    sol2 r

    %37
    R1*3\mbreak
    <sol' si, re, sol,>2\tu <sol si, re, sol,>
    <sol si, re, sol,> si8 la sol fad

    %42
    <sol si, re, sol,>2 si,
    do4 si re si
    la sol re' si

    %45
    do si re si
    la fad'2 fad4
    re sol2 sol4

    %48
    re fad2 fad4
    la sol2 fad4\mbreak
    sol,8 la si do re mi fad sol

    %51
    sol, la si do re mi fad sol
    sol, la si do re mi fad sol
    sol, la si do re mi fad sol

    %54
    do,4 si2 la4
    sol8 sol' fad mi re do si la
    sol2 fad

    %57
    sol4 mi do re
    sol,2 r
    sol'\solo re\mbreak

    %60
    mi si
    do4 sol sol2
    sol sol

    %63
    re' re
    re re
    re re

    %66
    sol do,4 dod
    re2 fad
    fad fad

    %69
    sol sol
    sol sol
    fad fad

    %72
    fad fad
    sol r
    R1*7\mbreak

    %81
    r2 sol
    sol sol
    fad fad

    %84
    fad fad
    mi mi
    mi mi

    %87
    re r
    R1*21
    <fad' la, re,>2\tu <fad la, re,>

    %110
    <fad la, re,> fad8 mi re dod\mbreak
    <fad la, re,>2 fad,
    sol4 fad la fad

    %113
    sol fad la fad
    mi2 mi\mbreak
    re4 fad'2 fad4~

    %116
    fad fad2 fad4
    mi mi2 mi4~
    mi mi2 mi4

    %119
    re re2 re4~
    re re2 re4
    dod dod2 dod4~

    %122
    dod dod?2 dod4
    si si re re
    mi mi mi mi

    %125
    re re\mbreak si si
    dod dod dod dod
    si si re re

    %128
    mi mi mi mi
    re re si si
    dod dod dod dod

    %131
    si2 si
    mi, fad
    si, r

    %134
    R1*5
    r2 re'
    mi1~

    %141
    mi
    re\parenthesize ~\mbreak
    re

    %144
    dod~
    dod
    si2. lad8 si

    %147
    dod2 si
    si lad
    fad4 sol fad mi

    %150
    re2 r
    r re
    sol sold

    %153
    si la,
    la la
    si si\mbreak

    %156
    si si
    mi mi'~
    mi1

    %159
    re~
    re
    dod~

    %162
    dod
    si~
    si

    %165
    la~
    la
    sol~

    %168
    sol
    re2 r
    <sol' si, re, sol,>2\tu <sol si, re, sol,>

    %171
    sol2 si8 la sol fad\mbreak
    <sol si, re, sol,>2 si,
    do4 si re si

    %174
    do4 si re si
    la la la la
    sol2 si4. do8

    %177
    re2 re
    mi2.\prall sol8 fad
    mi2 mi

    %180
    mi2.\prall sol8 fad
    mi2 mi
    red4. si8\mbreak fad4. red8

    %183
    si2 r
    R1*13
    r2 sol4. la8

    %198
    si2 sol
    sol sol
    sol sol

    %201
    sol sol
    fad'4 sol fad mi
    re2 re

    %204
    re re
    sol, sol'
    do, dod

    %207
    re re4. dod8
    si2 si
    si si

    %210
    si si
    do mi'8 do sol mi
    do2 r

    %213
    r dod
    dod? dod
    re fad'8 re la fad

    %216
    re2 si'
    do? do
    do do

    %219
    si si
    si si\mbreak
    la la

    %222
    la la
    sol sol
    mi mi

    %225
    fad fad
    fad fad
    sol sol

    %228
    sol sol
    fad fad
    fad fad

    %231
    sol r
    R1*5
    si8 sol la si\mbreak do re mi fad

    %238
    sol8 fad mi re do si la sol
    dod, dod dod dod dod dod dod dod\mbreak
    re2 r

    %241
    R1*2
    <sol' si, re, sol,>2\tu <sol si, re, sol,>
    <sol si, re, sol,> si8 la sol fad

    %245
    <sol si, re, sol,>2 si,
    do4 si re si
    la sol re' si

    %248
    do si re si
    la fad'2 fad4
    re sol2 sol4

    %251
    re fad2 fad4
    la sol2 fad4\mbreak
    sol,8 la si do re mi fad sol

    %254
    sol, la si do re mi fad sol
    sol, la si do re mi fad sol
    sol, la si do re mi fad sol

    %257
    do,4 si2 la4
    sol8 sol' fad mi re do si la
    sol2 fad

    %260
    sol4 mi do re
    sol,2 r

}

IIIvlan =  \relative do' {

    si2 si
    si re
    re re

    %4
    re re
    sol, sol'
    sol re

    %7
    sol, re'
    re4 la' la la\mbreak
    re,  la' la la

    %10
    sol sol sol sol
    sol sol sol sol
    la la la la

    %13
    la la, si si
    la la' la, la'
    la, la' la, la'\mbreak

    %16
    la, fad' fad fad
    fad dod2 re4
    dod dod dod dod

    %19
    dod? re2 mi4
    fad2 fad
    fad la

    %22
    la re8 dod si la\mbreak
    si la sol fad sol fad mi re
    dod4 re sol, la

    %25
    re,2 r
    R1*14
    si'2 si

    %41
    si re
    re re
    sol, sol'

    %44
    sol, sol'\mbreak
    sol re
    re re

    %47
    re re
    re re
    re re

    %50
    si4 si' si si
    la la la la
    sol sol sol sol

    %53
    re re re re
    mi2 fad\mbreak
    sol r4 mi

    %56
    re2 re
    re4 mi do re
    re2 r

    %59
    R1*50
    fad2 fad
    fad la

    %111
    la la
    re, re
    re re\mbreak

    %114
    mi dod
    fad la
    la la

    %117
    sol sol
    sol sol
    fad fad

    %120
    fad fad
    mi mi
    mi mi

    %123
    re4 si si si
    si si si si
    si si si si\mbreak

    %126
    si si si si
    si si si si
    si si si si

    %129
    si si si si
    si si si si
    si2 si'

    %132
    mi, fad
    si, r
    R1*36

    %170
    si2 si\mbreak
    si re
    re re

    %173
    sol, sol'
    sol, sol'
    fad fad

    %176
    sol sol
    sol sol
    sol sol

    %179
    sol sol
    do, do\mbreak
    do dod

    %182
    dod dod,
    \parenthesize si r
    R1*59

    %243
    si'2 si
    si re
    re re

    %246
    sol, sol'\mbreak
    sol, sol'
    sol, re'

    %249
    re re
    re re
    re re

    %252
    re re
    si4 si' si si
    la la la la

    %255
    sol sol sol sol\mbreak
    re re re re
    mi2 fad

    %258
    sol r4 mi
    re2 re
    re4 mi do re

    %261
    sol,2 r

}

IIIbcn = \relative do {

    sol4 sol' re si
    sol2 re'
    sol, sol'

    %4
    sol, sol'
    sol, sol'
    sol, sol'

    %7
    sol, sol'
    re4 re re re
    do do do do

    %10
    si si' si si
    si si si si\mbreak
    fad fad fad fad

    %13
    fad fad sol sold
    la, la' la, la'
    la, la la la

    %16
    la la la la
    la la la la
    la la' la, la'

    %19
    la, la' la, la'
    re, re' la fad
    re2 la'

    %22
    re,\mbreak re'8 dod si la
    si la sol fad sol fad mi re
    dod4 re sol, la

    %25
    re2 re8 mi fad re
    mi1
    fad

    %28
    sol2 sol,8 la si do?
    re1\solo
    mi

    %31
    fad
    sol2 sol,
    re' re\mbreak

    %34
    sol r
    re r
    sol r

    %37
    sol,4 sol'8 fad mi4 re
    dod1\fermata
    re2 re8\tu do? si la

    %40
    sol4 sol' re si
    sol2 sol'
    sol, sol'

    %43
    sol, sol'
    sol, sol'
    sol, sol'\mbreak

    %46
    re4 re' do do
    si si si si
    fad fad re re

    %49
    re re re re
    sol, sol' sol sol
    fad fad fad fad

    %52
    mi mi mi mi
    si si si si
    do2 re

    %55
    sol,4 la si do\mbreak
    re2 re,
    sol4 mi' do re

    %58
    sol,2 r
    R1*8
    re''2 re,

    %68
    re re
    re re
    re re

    %71
    re re
    re re
    sol, sol'

    %74
    do, dod\mbreak
    re4. re'8 la4. fad8
    re2 r

    %77
    r re'
    dod2 la
    si2. la8 sol

    %80
    fad2 re
    sol, sol'
    mi mi

    %83
    fad, fad'
    re re
    mi, mi'

    %86
    dod dod\mbreak
    re re
    sol sold

    %89
    la la,
    la la
    la la
    la la

    %93
    la la'
    la, r

    %95
    r mi''4. re8
    dod2 si
    dod2 r4 la
    re2 si\mbreak

    %99
    dod la
    si sold
    la1

    %102
    sol?
    re2 r
    fad r

    %105
    fad fad
    sol sol
    re sol

    %108
    la la,\tu
    re4 re' la fad
    re2 la

    %111
    re re\mbreak %% fine pagina
    re re
    re re

    %114
    dod dod
    re fad4. mi8
    red2 red

    %117
    mi re!
    dod dod
    re dod

    %120
    si si
    dod si
    lad lad

    %123
    si r\mbreak
    R1
    si2 r

    %126
    R1
    si2 r
    R1

    %129
    si2 r
    R1
    si2 re

    %132
    mi fad
    si, r
    r si4.\solo dod8

    %135
    re2 mi
    si si
    si si

    %138
    si2 si4. dod8\mbreak
    re2 si4 si'
    mi2 mi

    %141
    la, la
    re re
    sol, sol

    %144
    dod dod
    fad, fad
    si, si'

    %147
    mi, mid
    fad fad,
    R1*8

    %157
    r4 mi'' mi re
    dod2 dod\mbreak
    re,4 re'8 mi re4 dod

    %160
    si2 si
    dod,4 dod'8 re dod4 si
    la2 la

    %163
    si,4 si'8 dod si4 la
    sold2 sold
    la,4 la'8 si la4 sol!

    %166
    fad2 fad
    sol,4 sol'8 la si4 sol
    la fad sol dod,

    %169
    re4. mi8 re do? si la\mbreak
    sol4\tu sol' re si
    sol2 re'

    %172
    sol, sol'
    sol, sol'
    sol, sol'

    %175
    re re
    sol, sol4. la8
    si2 si

    %178
    do do'
    do si
    la, la'

    %181
    la, lad
    si si'
    si, r\mbreak

    %184
    r si'\solo
    sol mi
    la mi4. fad8

    %187
    sol2 mi
    la,1~
    la

    %190
    si~
    si
    mi2 mi'

    %193
    la, lad
    si si,
    si4 do si la

    %196
    sol2 r
    R1*12
    r2 sol'

    %210
    sol, sol
    do r\mbreak
    R1

    %213
    r2 la'
    la, la
    re r

    %216
    R1
    r2 do'4. si8
    la2 la

    %219
    si, si'4. la8
    sol2 sol
    la, la'4. sol8

    %222
    fad2 fad
    sol, sol'
    do, dod

    %225
    re re
    re re
    re re\mbreak

    %228
    re re
    re re
    re re

    %231
    sol, la
    si do
    si do

    %234
    si do
    re re
    re, re

    %237
    sol r
    R1*3
    r4 sol' si, dod

    %242
    re1\fermata
    sol,4\tu sol' re si
    sol2 re'

    %245
    sol, sol'\mbreak
    sol, sol'
    sol, sol'

    %248
    sol, sol'
    re4 re' do do

    %250
    si si si si
    fad fad re re
    re re re re

    %253
    sol, sol' sol sol
    fad fad fad fad
    mi mi mi mi

    %256
    si si si si
    do2 re\mbreak
    sol,4 la si do

    %259
    re re re re,
    sol mi' do re
    sol,2 r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key sol\major
    \time 2/2
    \tempo 1 = 60
    s1*261
    \bar"|."


}

IIIfl = {
    \IIIglobal
    <<\IIIfln \forma>>

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

}
#(set-global-staff-size 16)


\pointAndClickOff

\header {
    title = \markup \smaller{"Concerto per Flauto in Sol maggiore [GroF 826]"}
    composer = \markup \center-column{"G. Torti (1700ca -1780ca)"}
}

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] Vivace"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"Flauto"\vspace #-0.2 "traversiere"}
            \set Staff.shortInstrumentName = "fl"
            \Ifl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \set Staff.shortInstrumentName = "bs"
            \Ibc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
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

\markup\huge "[2.] Adagio"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"Flauto"\vspace #-0.2 "traversiere"}
            \set Staff.shortInstrumentName = "fl"
            \IIfl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \set Staff.shortInstrumentName = "bs"
            \IIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
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

\markup\huge "[3.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"Flauto"\vspace #-0.2 "traversiere"}
            \set Staff.shortInstrumentName = "fl"
            \IIIfl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \set Staff.shortInstrumentName = "bs"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
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
