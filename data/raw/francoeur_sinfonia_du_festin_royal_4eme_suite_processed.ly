\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"


acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

dolce = _\markup \italic { doux }

fort = _\markup \italic { fort }

cresc = _\markup\italic "cresc."

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tous"

acc = ^\markup\italic"acc."

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

rinf = ^\markup\italic "rinf"

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##t

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


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

IvlIn = \relative do'' {

    re,8(re) re(re) re(re) re(re)
    re16(fad) mi(sol) fad[(la) sol(si)] la(dod) si(dod) re[(mi) re(mi)]
    fad4 r r8 fad fad8.-+(mi32 re)
    %4
    mi8(dod,) dod(dod) dod(dod) dod(dod)
    dod16(mi) re(fad) mi[(sol) fad(sol)] la(si) la(si) dod[(re) dod(re)]
    mi4 r r8 mi mi8.-+(re32 dod)

    %7
    re8(si,) si(si) si(si) si(si)\mbreak
    si16(re) dod( mi) re[(fad) mi(sol)] fad(la) sold(la) si[(dod) si(dod)]
    re4 r r8 re re8.(dod32 si)

    %10
    la8(re) fad(re) re la la8.-+(sol32 fad)
    sol8 sol'4 mi re dod8~
    dod mi4 dod la sol8

    %13
    fad re (dod re) mi re (dod re)
    mi re (dod re) mi16 re (dod re) mi [re (dod re)]\mbreak
    si2 re'~

    %16
    re8 si'4 sold mi dod8~
    dod16 la (sold la) si[la (sold la)]  si[la (sold la)]  si[la (sold la)]
    la'1~

    %19
    la16 (fad) sol(mi) fad[(re) mi(dod)] re(si) dod(la) si[(sold) la(fad)]
    mi4 r8 la16(si) si4.-+(la16 si)
    la1\mbreak

    %22
    r16 la, si dod re mi fad sol la mi fad sol
    fad re mi fad sol la si dod re mi fad re
    la fad sol la si dod re mi fad sol la fad

    %25
    mi8 la la la la re
    dod16 la sol fad mi re dod si la sol fad mi\mbreak
    \once\stemUp re re'' dod si la sol fad mi re dod si la

    %28
    si dod re dod si la sol fad mi re dod si
    la si dod re mi fad sol mi la mi fad sol
    fad4 r r

    %31
    r16 re'' re re re re re re re re re re
    re4  r r
    r16 dod dod dod dod dod dod dod dod dod dod dod

    %34
    \repeat unfold 12 {dod}
    \repeat unfold 8 {dod} re re re re
    dod4 r r

    %37
    r r r8 r32 mi,, fad sold
    la4. mi32 fad sold la si16. mi,32 fad sold la si
    dod8 r r4 r8 r32 la si dod

    %40
    re4 r8 la32 si dod re mi16. la,32 si dod re mi
    fad8 r r4 r
    R2.

    %43
    re'16  \repeat unfold 11 {re}
    re4 dod r
    \repeat unfold 12 {dod16}

    %46
    dod4 si r
    \repeat unfold 12 {si16}
    si4 lad r\mbreak

    %49
    r4 r r32 fad mi re dod si lad sold
    fad8 r r4 r
    r16 fad' si re si fad si re si fad si re

    %52
    sol,8 mi dod[si lad dod]
    si16 fad' si re si fad si re si fad si re
    sol,8 mi dod[si lad dod]\mbreak

    %55
    si16 fad' si re si fad si re si fad si re
    sol, la si la sol la sol fad mi fad mi re
    dod8. re16 dod4.-+ si8

    %58
    si16 si, dod re mi fad sold lad si dod re si
    fad4 r r
    R2.\mbreak

    %61
    r16 re'' dod si la sol fad mi re dod si la
    si sol re sol si sol re sol si si la sol
    la fad re fad la fad re fad la la sol fad

    %64
    sol mi la, mi' sol mi la, mi' sol sol fad-+ mi
    fad re mi fad sol la si dod re mi fad re
    si re, mi fad sol la si dod re mi fad re\mbreak

    %67
    \once\stemDown  sol mi, fad sol la si dod re mi fad sol mi
    dod mi, fad sol la si dod re mi fad sol mi
    \once\stemDown la fad, sol la si dod re mi fad sol la fad

    %70
    re fad, sol la si dod re mi fad sol la fad
    si sol, la si dod re mi fad sol la si sol
    mi4 r <la la,>16  <la la,>  <la la,>  <la la,>\mbreak

    %73
    <sol la,> <sol la,> <sol la,> <sol la,> <sol la,> <sol la,> <sol la,> <sol la,> <fad la,> <fad la,> <fad la,> <fad la,>
    <mi la,>4 r <la, la,>16 <la la,> <la la,> <la la,>
    <sol la,> <sol la,> <sol la,> <sol la,> <sol la,> <sol la,> <sol la,> <sol la,> <fad la,> <fad la,> <fad la,> <fad la,>

    %76
    <mi la,>4 r16 r32 dod' re mi fad sold la16. re,32 mi fad sold la
    si4 r16 r32 re, mi fad sold? la si16. mi,32 fad sold la si
    dod8 r r4 r\mbreak

    %79
    re16_\markup\italic "cresc." \repeat unfold 71 {re} %%% sono 6 battute
    re re re re re re re re dod dod dod dod
    re la si sol la fad sol mi fad re mi dod\mbreak

    %87
    re la si sol la fad sol mi fad re mi dod
    re la fad' re la' fad re' la fad' re la' fad
    re la, fad' re la' fad re' la fad' re la' fad

    %90
    re la re fad re la fad' la fad re fad la
    re re, dod si la sol fad mi re re dod si
    la la si dod re mi fad sol la mi fad sol re''8 r r4 r

}

IvlIIn = \relative do'' {

    re,8(re) re(re) re(re) re(re)
    re16(fad) mi(sol) fad[(la) sol(si)] la(dod) si(dod) re[(mi) re(mi)]
    fad4 r r8 fad fad8.-+(mi32 re)
    %4
    mi8(dod,) dod(dod) dod(dod) dod(dod)
    dod16(mi) re(fad) mi[(sol) fad(sol)] la(si) la(si) dod[(re) dod(re)]
    mi4 r r8 mi mi8.-+(re32 dod)

    %7
    re8(si,) si(si) si(si) si(si)\mbreak
    si16(re) dod( mi) re[(fad) mi(sol)] fad(la) sold(la) si[(dod) si(dod)]
    re4 r r8 re re8.(dod32 si)

    %10
    la8(re) fad(re) re la la8.-+(sol32 fad)
    sol8 sol'4 mi re dod8~
    dod mi4 dod la sol8

    %13
    fad re (dod re) mi re (dod re)
    mi re (dod re) mi16 re (dod re) mi [re (dod re)]\mbreak
    si2 re'~

    %16
    re8 si'4 sold mi dod8~
    dod16 la (sold la) si[la (sold la)]  si[la (sold la)]  si[la (sold la)]
    la'1~

    %19
    la16 (fad) sol(mi) fad[(re) mi(dod)] re(si) dod(la) si[(sold) la(fad)]
    mi4 r8 la16(si) si4.-+(la16 si)
    la1\mbreak

    %22
    r16 la, si dod re mi fad sol la mi fad sol
    fad re mi fad sol la si dod re mi fad re
    la re, mi fad sol la si dod re mi fad re

    %25
    la fad sol la si dod re mi fad sol la fad
    mi la sol fad mi re dod si la sol fad mi\mbreak
    re4 r la'

    %28
    la sol si
    mi, r la,
    la2 r4

    %31
    r16 fad'' fad fad fad fad fad fad fad fad fad fad
    sold4 r r
    r16 \repeat unfold 23 {la}  %%% 2 BATTUTE

    %35
    la la la la la la la la sold sold sold sold
    la4 r r

    %37
    r r r8 r32 mi, fad sold
    la4. mi32 fad sold la si16. mi,32 fad sold la si
    dod8 r r4 r8 r32 la si dod

    %40
    re4 r8 la32 si dod re mi16. la,32 si dod re mi
    fad8 r r4 r
    R2.

    %43
    fad16 fad fad fad fad fad fad fad fad fad fad fad
    fad4 mi r
    mi16 mi mi mi mi mi mi mi mi mi mi mi

    %46
    mi4 re r
    re16 re re re re re re re re re re re
    re4 dod r\mbreak

    %49
    r4 r r32 fad mi re dod si lad sold
    fad8 r r4 r
    R2.

    %52
    r16 dod' mi sol mi dod mi sol mi dod mi sol
    fad8 re si[fad re fad]
    dod16 dod' mi sol mi dod mi sol mi dod mi sol\mbreak

    %55
    fad8 re si[fad re fad']~
    fad4 mi16 fad mi re dod re dod si
    lad8. si16 lad4.-+ si8

    %58
    si16 si, dod re mi fad sold lad si dod re si
    fad4 r r
    R2.\mbreak

    %61
    r16 re'' dod si la sol fad mi re dod si la
    si sol re sol si sol re sol si si la sol
    la fad re fad la fad re fad la la sol fad

    %64
    sol mi la, mi' sol mi la, mi' sol sol fad-+ mi
    fad re mi fad sol la si dod re mi fad re
    si re, mi fad sol la si dod re mi fad re\mbreak

    %67
    \once\stemDown  sol mi, fad sol la si dod re mi fad sol mi
    dod mi, fad sol la si dod re mi fad sol mi
    \once\stemDown la fad, sol la si dod re mi fad sol la fad

    %70
    re fad, sol la si dod re mi fad sol la fad
    si sol, la si dod re mi fad sol la si sol
    mi4 r <fad la,>16 <fad la,> <fad la,> <fad la,>\mbreak

    %73
    <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,> <<{re re re re}\\{re re re re}>>
    dod4 r <fad, la,>16 <fad la,>  <fad la,>  <fad la,>
    <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,>  <mi la,> <re la> <re la> <re la> <re la>

    %76
    dod4 r r
    r r16 r32 si' dod re mi fad sold16. dod,32 re mi fad sold
    la8 r r4 r\mbreak

    %79
    re,16_\markup\italic "cresc."  re re re re re re re re re re re
    mi mi mi mi mi mi mi mi mi mi mi mi
    \repeat unfold 12 {fad}

    %82
    \repeat unfold 12 {sol}
    \repeat unfold 12 {la}
    \repeat unfold 12 {si}

    %85
    mi, mi mi mi mi mi mi mi sol sol sol sol
    fad fad sol mi fad re mi dod re fad sol mi\mbreak
    fad fad, sol mi fad re mi dod re fad sol mi

    %88
    re la fad' re la' fad re' la fad' re la' fad
    re la, fad' re la' fad re' la fad' re la' fad
    re la re fad re la fad' la fad re fad la

    %91
    re re, dod si la sol fad mi re re dod si
    la la si dod re mi fad sol la mi fad sol re''8 r r4 r

}

IflIn = \relative do'' {

    R1*21
    R2.*9
    r16 si' la sol fad mi re dod si la sold fad

    %32
    mi mi fad sold la si dod re mi fad sold mi
    la si dod si la si dod si la si dod si
    la si dod si la si dod la si dod re dod

    %35
    si dod re dod si la sold fad mi re dod si
    la2 r4
    R2.*2

    %39
    r8 la'16(sold) la(sold) la(sold) la8. \tuplet 3/2 { mi32 fad sol }
    fad8 r r4 r
    r r r8 r32 la, si dod

    %42
    re4 r8 la32 si dod re mi16. la,32 si dod re mi\mbreak
    fad8 r r4 r
    r mi'16 re dod re mi4

    %45
    R2.
    r4 re16 dod si dod re4
    R2.

    %48
    r4 dod16 si lad? si dod4\mbreak
    R2.*2
    r4 r r8 fad,16 re

    %52
    si4 r r8 sol'16 mi
    si4 r r8 fad'16 re
    si4 r r8 sol'16 mi\mbreak

    %55
    si4 r r8 fad'16 re
    si4 si'2
    dod,8. re16 dod4.-+ si8

    %58
    si2 r4
    fad'16(sol) la[(sol)] la[(sol)] la[(sol)] la[(sol)] la[(sol)]
    fad(sol) fad[(sol)] la[(sol)] la[(sol)] la[(sol)] la[(sol)]

    %61
    fad4 r r
    r si re
    r la re

    %64
    r re dod-+
    re \tuplet 3/2 { la8 sol fad fad[mi re] }
    re2-+ r4\mbreak

    %67
    r \tuplet 3/2 { si'8(la sol) sol[(fad mi)] }
    mi2-+ r4
    r \tuplet 3/2 { dod'8(si la) la[(sol fad)] }

    %70
    fad2-+ r4
    r \tuplet 3/2 { re'8(dod si) si[(la sol)] }
    sol4-+ r4 r16 r32 mi fad sol la si

    %73
    dod4 r8 r32 la si dod re8. \tuplet 3/2 { fad,32 mi re }
    la'4 r r16 r32 mi, fad sol la si
    dod4 r8 r32 la si dod re8. \tuplet 3/2 { fad,32 mi re }

    %76
    la'4 r r
    r8 si' sold mi r4
    r32 la sold fad mi re dod si la8 r r4\mbreak

    %79
    r4 r r8 la'16 fad
    re2 r8 si'16 sol
    re2 r8 la'16 fad

    %82
    re4. mi16 fad sol la si dod
    re4 r la~
    la4. sol16(fad) sol4

    %85
    sol~sol4. fad16(sol)
    fad2-+ r4\mbreak
    r r la

    %88
    la2.-+~
    la~
    la2 r16 re, fad la

    %91
    re8 r r4 r
    R2. re8 r r4 r

}

IflIIn = \relative do'' {

    R1*21
    R2.*9
    r16 si' la sol fad mi re dod si la sold fad

    %32
    mi mi fad sold la si dod re mi fad sold mi
    la si dod si la si dod si la si dod si
    la si dod si la si dod la si dod re dod

    %35
    si dod re dod si la sold fad mi re dod si
    la2 r4
    R2.*2

    %39
    r8 la'16(sold) la(sold) la(sold) la8. \tuplet 3/2 { mi32 fad sol }
    fad8 r r4 r
    r r r8 r32 la, si dod

    %42
    re4 r8 la32 si dod re mi16. la,32 si dod re mi\mbreak
    fad8 r r4 r
    r dod'16 si la si dod4

    %45
    R2.
    r4 si16 la sold la si4
    R2.

    %48
    r4 lad?16 sold fad sold lad4\mbreak
    R2.*2
    r4 r r8 fad16 re

    %52
    si4 r r8 sol'16 mi
    si4 r r8 fad'16 re
    si4 r r8 sol'16 mi\mbreak

    %55
    si4 r r8 fad'16 re
    si4 si'2
    dod,8. re16 dod4.-+ si8

    %58
    si2 r4
    re16(mi) re[(mi)] fad[(mi)] fad[(mi)] fad[(mi)] fad[(mi)]
    re16(mi) re[(mi)] fad[(mi)] fad[(mi)] fad[(mi)] fad[(mi)]

    %61
    re4 r r
    r sol si
    r fad la

    %64
    r sol sol-+
    re \tuplet 3/2 { fad8 mi re re[dod si] }
    si2-+ r4\mbreak

    %67
    r \tuplet 3/2 { sol'8(fad mi) mi[(re dod)] }
    dod2-+ r4
    r \tuplet 3/2 { la'8(sol fad) fad[(mi re)] }

    %70
    re2-+ r4
    r \tuplet 3/2 { si'8(la sol) sol[(fad mi)] }
    dod4-+ r4 r16 r32 mi fad sol la si

    %73
    dod4 r8 r32 la si dod re8. \tuplet 3/2 { fad,32 mi re }
    la'4 r r16 r32 mi, fad sol la si
    dod4 r8 r32 la si dod re8. \tuplet 3/2 { fad,32 mi re }

    %76
    la'4 r r
    r8 si' sold mi r4
    r32 la sold fad mi re dod si la8 r r4\mbreak

    %79
    r4 r r8 la'16 fad
    re2 r8 si'16 sol
    re2 r8 la'16 fad

    %82
    re4. mi16 fad sol la si dod
    re4 r fad,~
    fad4. mi16(re) mi4

    %85
    mi mi2-+
    re2-+ r4\mbreak
    r r fad

    %88
    fad2.-+~
    fad~
    fad2 r16 re fad la

    %91
    re8 r r4 r
    R2. re8 r r4 r

}

IhbIn = \relative do'' {

    re,8(re) re(re) re(re) re(re)
    re16(fad) mi(sol) fad[(la) sol(si)] la(dod) si(dod) re[(mi) re(mi)]
    fad4 r r8 fad fad8.-+(mi32 re)

    %4
    mi8(dod,) dod(dod) dod(dod) dod(dod)
    dod16(mi) re(fad) mi[(sol) fad(sol)] la(si) la(si) dod[(re) dod(re)]
    mi4 r r8 mi mi8.-+(re32 dod)

    %7
    re8 r r4 r2\mbreak
    r16 re, dod(mi) re[(fad) mi(sol)] fad(la) sold(la) si[(dod) si(dod)]
    re4 r r8 re re8.(dod32 si)

    %10
    la8(re) fad(re) re la la8.-+(sol32 fad)
    sol8 sol'4 mi re dod8~
    dod mi4 dod la sol8

    %13
    fad re (dod re) mi re (dod re)
    mi re (dod re) mi16 re (dod re) mi [re (dod re)]\mbreak
    si'2 re~

    %16
    re8 si'4 sold mi dod8~
    dod16 la (sold la) si[la (sold la)] si[la (sold la)]  si[la (sold la)]
    la'1~

    %19
    la16 (fad) sol(mi) fad[(re) mi(dod)] re(si) dod(la) si[(sold) la(fad)]
    mi4 r8 la16(si) si4.-+(la16 si)
    la1\mbreak

    %22
    R2.
    r16 re, mi fad sol la si dod re mi fad re
    <<{la fad sol la si dod re mi fad sol la fad

    %25
    mi8 la la la la re
    dod16 la sol fad}\\{ la, re, mi fad sol la si dod re mi fad re
                         la fad sol la si dod re mi fad sol la fad
                         mi la sol fad}>> mi re dod si la sol fad mi\mbreak
    \once\stemUp re re'' dod si la sol fad mi re dod si la

    %28
    R2.*3
    r16 si' la sol fad mi re dod si la sold fad\mbreak
    mi mi fad sold la si dod re mi fad sold mi

    %33
    dod la si dod re  mi fad sold la si dod mi,
    fad sold la sold fad mi re dod si la sold fad
    mi2 mi4

    %36
    mi2 r4
    r r r8 r32 mi fad sold
    la4. mi32 fad sold la si16. mi,32 fad sold la si

    %39
    dod8 r r4 r8 r32 la si dod
    re4 r8 la32 si dod re mi16. la,32 si dod re mi
    fad8 r r4 r

    %42
    R2.*2
    r16 la, si dod re mi fad sol la si dod la
    fad4 r r

    %46
    r16 si, dod re mi fad sold lad si dod re si
    fad4 r r
    r4 r8 r32 fad mi re dod8. \tuplet 3/2 { fad32 mi re }\mbreak

    %49
    dod8 r r4 r32 fad mi re dod si lad sold
    fad8 r r4 r
    r16 fad' si re si fad si re si fad si re

    %52
    sol,8 mi dod[si lad dod]
    si16 fad' si re si fad si re si fad si re
    sol,8 mi dod[si lad dod]\mbreak

    %55
    si16 fad' si re si fad si re si fad si re
    sol, la si la sol la sol fad mi fad mi re
    dod8. re16 dod4.-+ si8

    %58
    si16 si dod, re mi fad sold lad si dod re si
    fad4 r r
    R2.\mbreak

    %61
    r16 re'' dod si la sol fad mi re dod si la
    si sol re sol si sol re sol si si la sol
    la fad re fad la fad re fad la la sol fad

    %64
    sol mi la mi sol mi la mi sol sol fad-+ mi
    fad re mi fad sol la si dod re mi fad re
    si re, mi fad sol la si dod re mi fad re\mbreak

    %67
    \once\stemDown  sol mi, fad sol la si dod re mi fad sol mi
    dod mi, fad sol la si dod re mi fad sol mi
    \once\stemDown la fad, sol la si dod re mi fad sol la fad

    %70
    re fad, sol la si dod re mi fad sol la fad
    si sol, la si dod re mi fad sol la si sol
    mi4 r r16 r32 mi fad sol la si\mbreak

    %73
    dod4 r8 r32 la si dod re8. \tuplet 3/2 { fad,32 mi re }
    la'4 r r16 r32 mi, fad sol la si
    dod4 r8 r32 la si dod re8. \tuplet 3/2 { fad,32 mi re }

    %76
    la'4 r r
    r8 si' sold mi r4
    r32 la sold fad mi re dod si la8 r r4\mbreak

    %79
    r8 la re fad la re
    r sol,, si re sol si
    r8 la, re fad la re

    %82
    r sol,, si re sol si
    r re,, fad la re fad
    r sol, si re4 sol8

    %85
    r la, dod mi la la,
    re'16 la si sol la fad sol mi fad re mi dod\mbreak

    %87
    re la si sol la fad sol mi fad re mi dod
    re la' fad re la' fad re' la fad' re la' fad
    re la fad re la' fad re' la fad' re la' fad

    %90
    re la re fad re la fad' la fad re fad la
    re8 r r4 r
    R2. re8 r r4 r

}

IcrIn = % \transpose do re,
\relative do'' {\key do\major

    do1
    do~
    do

    %4
    sol~
    sol~
    sol

    %7
    do,~\mbreak
    do~
    do

    %10
    do'4 mi r8 sol8-. mi-. sol-.
    fa4 re r2
    sol,4 re' r8 fa re fa

    %13
    mi4 r r2
    R1*3
    sol1~

    %18
    sol~
    sol2~sol4. (la16 sol)
    fad4 r8 sol fad4.-+ sol8

    %21
    sol1\mbreak
    R2.*3
    r8 do,, mi sol do[mi]

    %26
    re4 r sol,\mbreak
    mi mi' sol~
    sol do, fa~

    %29
    fa mi \grace mi8 re4-+
    do r r
    R2.*2

    %33
    sol'2.~
    sol
    re

    %36
    sol,4 r r
    R2.*35
    r4 r sol'\mbreak

    %73
    fa\prall fa mi
    re8 r r4 r
    sol,2.~

    %76
    sol~
    sol
    R

    %79
    do_\markup\italic {cresc.}~
    do~
    do8 sol do mi sol mi

    %82
    do2.~
    do8 sol do mi sol mi
    do2~do8. re16

    %85
    re2.-+
    do4. fa8 mi re\mbreak
    do4. re8 do sol

    %88
    mi do sol' mi do'[sol]
    mi'[sol,] do sol mi' do
    sol'16 do sol mi do sol' mi do sol mi do sol

    %91
    la'8 r r4 r
    R2. la8 r r4 r

}

IcrIIn = %\transpose do re,
\relative do'' {\key do\major

    do1
    do~
    do

    %4
    sol~
    sol~
    sol

    %7
    do,~\mbreak
    do~
    do

    %10
    sol'4 do r8 mi-. do-. mi-.
    re4 sol, r2
    sol4 sol, r8 re'' sol, re'

    %13
    do4 r r2
    R1*3
    sol1

    %18
    re'
    mi2~mi4.(fad16 mi)
    re4 r8 mi re2

    %21
    sol,1\mbreak
    R2.*3
    r8 do, mi sol mi do

    %26
    sol'4 r sol\mbreak
    mi do' mi~
    mi do re~

    %29
    re do sol
    mi r r
    R2.*2

    %33
    re'2.
    mi
    re

    %36
    sol,4 r r
    R2.*35
    r4 r mi'\mbreak

    %73
    re re do
    sol8 r r4 r
    sol,2.~

    %76
    sol~
    sol
    R

    %79
    do_\markup\italic {cresc.}~
    do~
    do8 mi sol do mi do

    %82
    do,2.~
    do8 mi sol do mi do
    do,2 do'4

    %85
    sol2.
    do4. re8 do sol\mbreak
    mi4. sol8 mi sol
    do, sol mi' do sol' mi
    do' do, sol' mi do' sol
    mi do fa,4 sol


    %91
    la'8 r r4 r
    R2. la8 r r4 r

}

IvlaIn = \relative do'' {

    re,8(re) re(re) re(re) re(re)
    re[(re)] re16(fad) mi(sol) fad(la) sol(mi) fad[(sol) fad(sol)]
    la8(re,) la(re) la(re) la(re)

    %4
    la(dod) dod(dod) dod(dod) dod(dod)
    dod16(mi) re(fad) mi8[(mi)] mi(mi) la16[(si) la(si)]
    dod8(mi,) la(mi) la(mi) la(la,)

    %7
    fad'(si,) si(si) si(si) si(si)\mbreak
    si[(si)] si16(re) dod(mi) re8[(re)] re16(mi) re(mi)
    fad8(si) fad(si) fad(si) fad(si,)

    %10
    re(la') re,(la') fad(fad) re(fad)
    si,2 si'
    mi,8 sol4 mi dod la8

    %13
    la re (dod re) mi re(dod re)
    mi re(dod re) mi16[re(dod re)] mi16[re(dod re)]
    mi8 re'4 si fad fad8

    %16
    si,16[mi(re mi)] fad mi(re mi) si4 r
    r16 dod(si dod) re [dod(si dod)]  re dod(si dod)  re [dod(si dod)]
    mi la(sold la) si[la(sold la)] si[la(sold la)] si[la(sold la)]

    %19
    si2~si4. la8
    sold4 r8 r16 la la4. sold8
    la1

    %22
    r16 la, si dod re mi fad sol la mi fad sol
    fad4 r r
    R2.

    %25
    r16 re, mi fad sol la si dod re mi fad re
    la la' la la la la la la la la la la\mbreak
    la4 r re,

    %28
    re r re
    re r dod-+
    re16 re mi fad sol la si dod re mi fad re

    %31
    si la la la la la la la la la la re\mbreak
    si2-+ si4
    mi, r mi'

    %34
    mi2 re4
    re2 si4-+
    dod,16(re) dod[(re)] mi(re) mi[(re)] mi(re) mi[(re)]

    %37
    dod(re) dod[(re)] mi(re) mi[(re)] mi(re) mi[(re)]\mbreak
    dod4 la mi
    la r r

    %40
    r re la
    fad16 sol fad[sol] la sol la[sol] la sol la[sol]
    fad sol fad[sol] la sol la[fad] sol fad sol[mi]\mbreak

    %43
    fad re mi fad sol la si dod re mi fad la
    la4 la r
    r16 fad, sold lad si dod re mi fad sold lad dod

    %46
    fad,4 fad r
    r16 si, dod re mi fad sol la si dod re si

    %48
    fad4 fad r\mbreak
    r r r32 fad mi re32 dod si lad sold
    fad8 r r4 r

    %51
    r8 fad si re fad4
    r8 sol, si mi sol4
    r8 fad, si re fad4

    %54
    r8 sol, si mi sol4\mbreak
    r8 fad, si re fad[si]~
    si2 sol8. mi'16

    %57
    mi8. re16 fad,4 mi
    re16 si dod re mi fad sold lad si dod re si
    fad4 r r
    R2.\mbreak  %Fine prima riga p. 8

    %61
    la2 re,4
    re2 re4
    re2 la'4

    %64
    la la la
    la16 la la la la la la la la la la la
    la4 sol r\mbreak

    %67
    r r sol
    sol~\tuplet 3/2 { sol8(la sol) fad[(sol mi)] }
    fad2 la4

    %70
    la2 re4
    re2 mi4
    dod-+ r la,16 la la la\mbreak

    %73
    \repeat unfold 12 {la16}
    la4 r la16 la la la
    \repeat unfold 12 {la16}

    %76
    la4 r r
    r r r8 r16 <<{mi''
                  mi4}\\{mi,16
                 mi4}>> r r

    %79
    la16_\markup\italic {cresc.} \repeat unfold 11 {la16}
    \repeat unfold 12 {si16}
    la la la la la la la la fad fad fad fad

    %82
    \repeat unfold 12 {mi16}
    fad fad fad fad la la la la re re re re
    re re re re re re re re si si si si

    %85
    \repeat unfold 12 {la16}
    la2 r4\mbreak
    la2 r4

    %88
    la,2 r4
    la2 r4
    fad'16 \repeat unfold 11 {fad16}

    %91
    fad2 r4
    r16 la, si dod re mi fad sol la mi fad sol fad8 r r4 r

}

IfgIn = \relative do {

    re8(re) re(re) re(re) re(re)
    re(re) re(re) re(re) re(re)
    re re' (la) re(la) re(la) re(

    %4
    la) dod, dod(dod) dod(dod) dod(dod)
    dod(dod) dod(dod) dod(dod) dod(dod)
    dod(mi) la(mi) la mi (la) dod(

    %7
    \once\stemDown fad) si,, si(si) si(si) si(si)\mbreak
    si(si) si(si) si(si) si(si)
    si si'(fad) si(fad) si(fad) si(

    %10
    re) fad,(la) re(fad) re(fad) re~
    re2 si
    mi,8 sol'4 mi dod la8~

    %13
    la8 re, (dod re) mi re (dod re)
    mi re (dod re) mi16 re (dod re) mi [re (dod re)]\mbreak
    re'8 fad4 re si sold8~

    %16
    sold16 mi'(re mi) fad [mi(re mi)] sold,4 mi
    r16 dod'(si dod) re [dod(si dod)]  re dod(si dod)  re [dod(si dod)]
    mi la,(sold la) si[la(sold la)] si[la(sold la)] si[la(sold la)]

    %19
    fad'1
    si,4 r8 dod16 la mi2
    la,1

    %22
    \clef bass \key re\major R2.*3
    r16 re mi fad sol la si dod re mi fad re
    la la, si dod re mi fad sol la si dod la\mbreak

    %27
    fad4 r fad
    sol r sol
    la r la,

    %30
    re,16 re' mi fad sol la si dod re mi fad re
    si4 r si\mbreak
    mi mi, re

    %33
    dod r dod
    re2.
    mi

    %36
    \clef tenor \key re\major dod'16(re) dod[(re)] mi(re) mi[(re)] mi(re) mi[(re)]
    dod(re) dod[(re)] mi(re) mi[(re)] mi(re) mi[(re)]\mbreak
    \clef bass \key re\major dod4 r mi

    %39
    la r r
    R2.
    fad,16 sol fad[sol] la sol la[sol] la sol la[sol]

    %42
    fad sol fad[sol] la sol la[fad] sol fad sol[mi]\mbreak
    fad re mi fad sol la si dod re mi fad re
    la4 la r

    %45
    r16 fad sold lad si dod re mi fad8 lad,-+
    si4 si r
    r16 si, dod re mi fad sol la si dod re si

    %48
    fad'4 fad r\mbreak
    r r r32 fad mi re32 dod si lad sold
    fad8 r r4 r

    %51
    r8 fad si re fad4
    r8 sol, si mi sol4
    r8 fad, si re fad4

    %54
    r8 sol, si mi sol4\mbreak
    r8 fad, si re fad[re]~
    re4 dod4.-+ sol'8

    %57
    fad4 fad,2
    si16 si, dod re mi fad sold lad si dod re si
    fad,4 r r

    %60
    R2.
    r4 r fad'
    sol sol, sol'

    %63
    fad fad, fad'
    mi la la,
    \once\stemUp re,16 fad' fad fad fad fad fad fad fad fad fad fad

    %66
    sol4 sol, fad\mbreak
    mi16 mi' mi mi mi mi mi mi mi mi mi mi
    la4 la, sol

    %69
    fad16 fad' fad fad fad fad fad fad fad fad fad fad
    si4 si, la
    sol2 mi4

    %72
    la16 la la la la la la la la la la la\mbreak
    \repeat unfold 60 {la16}   %%<------------- 5 BATTUTE
    la8 r r4 r\mbreak

    %79
    fad16_\markup\italic {cresc.} fad fad fad fad fad fad fad fad fad fad fad
    \repeat unfold 12 {sol}
    \repeat unfold 12 {la}

    %82
    \repeat unfold 12 {si}
    \repeat unfold 12 {fad}
    \repeat unfold 12 {sol}

    %85
    \repeat unfold 12 {la}
    re,2 r4\mbreak
    re2 r4

    %88
    re2 r4
    re2 r4
    \repeat unfold 12 {re16}

    %91
    re2 re4
    la'2 r4 re,8 r r4 r

}

Ibcn = \relative do {

    re8(re) re(re) re(re) re(re)
    re(re) re(re) re(re) re(re)
    re(re) re(re) re(re) re(re)

    %4
    dod(dod) dod(dod) dod(dod) dod(dod)
    dod(dod) dod(dod) dod(dod) dod(dod)
    dod(dod) dod(dod) dod(dod) dod(dod)

    %7
    si(si) si(si) si(si) si(si)\mbreak
    si(si) si(si) si(si) si(si)
    si(si) si(si) si(si) si(si)

    %10
    fad(fad) fad(fad) fad(fad) fad(fad)
    mi(mi) mi(mi) mi(mi) mi(mi)
    la2 la

    %13
    r8 re(dod re) mi re (dod re)
    mi re (dod re) mi16 re (dod re) mi [re (dod re)]\mbreak
    si2 si

    %16
    mi mi
    fad1
    dod

    %19
    re~
    re4 r8 dod16 re mi2
    la,1

    %22
    R2.*3
    r16 re mi fad sol la si dod re mi fad re
    la la, si dod re mi fad sol la si dod la\mbreak

    %27
    fad4 r fad
    sol r sol
    la r la,

    %30
    re,16 re' mi fad sol la si dod re mi fad re
    si4 r si\mbreak
    mi mi, re

    %33
    dod r dod
    re2.
    mi

    %36
    \clef tenor \key re\major la16[(si)] la(si) dod[(si)] dod(si) dod[(si)] dod[(si)]
    la(si) la[(si)] dod(si) dod[(la)]  si(la) si[(sol)]\mbreak
    \clef bass \key re\major  la4 r mi'

    %39
    la r r
    R2.
    re,,16 mi re[mi] fad mi fad[mi] fad mi fad[mi]

    %42
    re mi re[mi] fad mi fad[re] mi[re] mi[dod]
    re16 re, re re re re re re re re re re
    la'4 la r

    %45
    r16 lad lad lad lad lad lad lad lad lad lad lad
    si4 si r
    r16 si si si si si si si si si si si

    %48
    fad4 fad r\mbreak
    r r r32 fad'' mi re32 dod si lad sold
    fad8 r r4 r

    %51
    re2.
    mi2 r4
    re2 r4

    %54
    mi2 r4\mbreak
    re2 r4
    mi2 r4

    %57
    fad8. si,16 fad'4 fad,
    si16 si dod re mi fad sold lad si dod re si
    fad,4 r r

    %60
    R2.
    r4 r fad'
    sol sol, sol'

    %63
    fad fad, fad'
    mi la la,
    \once\stemUp re,16 fad' fad fad fad fad fad fad fad fad fad fad

    %66
    sol4 sol, fad\mbreak
    mi16 mi' mi mi mi mi mi mi mi mi mi mi
    la4 la, sol

    %69
    fad16 fad' fad fad fad fad fad fad fad fad fad fad
    si4 si, la
    sol2 mi4

    %72
    la16 la la la la la la la la la la la\mbreak
    \repeat unfold 60 {la16}   %%<------------- 5 BATTUTE
    la8 r r4 r\mbreak

    %79
    fad16_\markup\italic {cresc.} fad fad fad fad fad fad fad fad fad fad fad
    \repeat unfold 12 {sol}
    \repeat unfold 12 {la}

    %82
    \repeat unfold 12 {si}
    \repeat unfold 12 {fad}
    \repeat unfold 12 {sol}

    %85
    \repeat unfold 12 {la}
    re,2 r4\mbreak
    re2 r4

    %88
    re2 r4
    re2 r4
    \repeat unfold 12 {re16}

    %91
    re2 re4
    la'2 r4 re,8 r r4 r

}

Ibfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 47
    s1*21
    \bar ":|."\break
    \time 3/4
    \once \override Score.RehearsalMark.extra-offset = #'(-3 . -2.0)
    \mark\markup \huge {Reprise vite}
    \tempo 2. = 40
    s2.
    \repeat volta 2{s2.*68}
    \alternative {{s2.*2}{s2.}}
    \bar "|."

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>
}


IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>
}

IflI = {
    \Iglobal
    <<\IflIn \forma>>
}


IflII = {
    \Iglobal
    <<\IflIIn \forma>>
}


IhbI = {
    \Iglobal
    <<\IhbIn \forma>>
}


IvlaI = {
    \Iglobal
    <<\IvlaIn \forma>>
}


IcrI = {
    \Iglobal
    <<\IcrIn \forma>>
}



IcrII = {
    \Iglobal
    <<\IcrIIn \forma>>
}


IfgI = {
    \Iglobal
    \clef tenor
    <<\IfgIn \forma>>
}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

IIvlIn = \relative do'' {

    la4 fad-+ mi
    fad-+ mi8 fad re4
    \tuplet 3/2 { fad8(mi fad) fad[(mi fad)] fad(mi fad)

    %4
    mi(re mi) mi[(re mi)] mi(re mi)
    fad8(mi fad) fad[(mi fad)] fad(mi re)}
    mi2.-+

    %7
    mi4 mi \tuplet 3/2 { mi8(fad sol) }
    fad4 fad \tuplet 3/2 { fad8(sol la) }
    mi4 mi \tuplet 3/2 { mi8 fad sol }

    %10
    fad-+ mi fad2\mbreak
    la4 fad-+ mi
    fad-+ mi8 fad re4

    %13
    fad fad fad
    mi mi mi
    fad fad fad

    %16
    mi2.-+
    sol4 fad \tuplet 3/2 { mi8-+(re mi) }
    re4 mi la,

    %19
    sol' fad \tuplet 3/2 { mi8-+\parentSlur (re mi) }
    re2.
    fad8(sol) la(si) la4

    %22
    r8 la\noBeam si(la) si[(la)]
    re4 dod-+ si
    dod-+ si8 dod la4

    %25
    \tuplet 3/2 { re8(dod re) re[(dod re)] re(dod si)}
    dod4-+ si8 dod la4
    \tuplet 3/2 { mi'8(fad mi) mi[(fad mi)] mi(fad mi)

    %28
    re(mi re) re[(mi re)] re(mi re)
    dod(re dod) dod(re dod)] dod(re dod)}\mbreak
    si2-+ mi,4

    %31
    la' sold-+ fad
    mi(re-+) dod
    \tuplet 3/2 { r8 re[(dod)] si(dod la)  mi[(la sold)]}

    %34
    la2.

}

IIhbIn = \relative do'' {

    la'4 fad-+ mi
    fad-+ mi8 fad re4
    \tuplet 3/2 { fad8(mi fad) fad[(mi fad)] fad(mi fad)

    %4
    mi(re mi) mi[(re mi)] mi(re mi)
    fad8(mi fad) fad[(mi fad)] fad(mi re)}
    mi2.-+

    %7
    mi4 mi \tuplet 3/2 { mi8(fad sol) }
    fad4 fad \tuplet 3/2 { fad8(sol la) }
    mi4 mi \tuplet 3/2 { mi8 fad sol }

    %10
    fad-+ mi fad2\mbreak
    la,4 fad-+ mi
    fad-+ mi8 fad re4

    %13
    \tuplet 3/2 { fad'8(mi fad) fad[(mi fad)] fad(mi fad)
    mi(re mi) mi[(re mi)] mi(re mi)
    fad(mi fad) fad[(mi fad)] fad(mi fad)}

    %16
    mi2.-+
    sol4 fad \tuplet 3/2 { mi8-+(re mi) }
    re4 mi la,

    %19
    sol' fad \tuplet 3/2 { mi8-+(re mi) }
    re2.
    R2.*14

}

IIhbIIn = \relative do'' {

    fad4 re la
    re la8 re fad,4
    \tuplet 3/2 { re'8(dod re) re[(dod re)] re(dod re))

    %4
    dod(si dod) dod[(si dod)] dod(si dod)
    re(dod re) re[(dod re)] re(dod si)}
    la2.

    %7
    dod4 dod \tuplet 3/2 { dod8(re mi) }
    re4 re \tuplet 3/2 { re8(mi fad) }
    dod4 dod \tuplet 3/2 { dod8(re mi) }

    %10
    re-+ dod re2\mbreak
    la4 fad-+ mi
    fad4-+ mi8 fad re4

    %13
    \tuplet 3/2 { re'8(dod re) re[(dod re)] re(dod re))
    dod(si dod) dod[(si dod)] dod(si dod)
    re(dod re) re[(dod re)] re(dod re)}

    %16
    la2.
    mi'4 re la
    re la r

    %19
    mi' re la
    fad2.
    R2.*14

}

IIcrIn = %\transpose do re,
\relative do'' {\key do\major

    sol'4 mi-+ re
    mi-+ re8 mi do4
    \tuplet 3/2 { mi8 re mi mi[re mi] mi re mi

    %4
    re do re re[do re] re do re
    mi re mi mi[re mi] mi re do}
    re2.-+

    %7
    re4 re \tuplet 3/2 { re8 mi fa }
    mi4 mi \tuplet 3/2 { mi8 fa sol }
    re4 re \tuplet 3/2 { re8 mi fa }

    %10
    mi-+ re mi2\mbreak
    sol4 mi-+ re
    mi-+ re8 mi do4

    %13
    \tuplet 3/2 { mi8 re mi mi[re mi] mi re mi
    re do re re[do re] re do re
    mi re mi mi[re mi] mi re mi}

    %16
    re2.-+
    fa4 mi \tuplet 3/2 { re8-+ do re }
    do4 re sol,

    %19
    fa' mi \tuplet 3/2 { re8-+ do re }
    do2.
    R2.*14

}

IIcrIIn = %\transpose do re,
\relative do'' {\key do\major

    mi4 do sol
    do sol mi
    \tuplet 3/2 { do'8 sol do do[sol do] do sol do

    %4
    sol mi sol sol[mi sol] sol mi sol
    do sol do do[sol do] do sol mi}
    sol2.

    %7
    sol4 sol \tuplet 3/2 { sol8 do re }
    do4 do \tuplet 3/2 { do8 re mi }
    sol,4 sol \tuplet 3/2 { sol8 do re }

    %10
    do sol do2\mbreak
    do,4 mi sol
    do sol mi

    %13
    \tuplet 3/2 { do'8 sol do do[sol do] do sol do
    sol mi sol sol[mi sol] sol mi sol
    do sol do do[sol do] do si do}

    %16
    sol2.
    re'4 do sol
    mi sol r

    %19
    re' do sol
    mi2.
    R2.*14

}

IIvlaIn = \relative do'' {

    r4 r la
    la2 fad4
    r r la

    %4
    la2 r4
    r r la
    la2.

    %7
    r4 r la
    la2 r4
    r r la,

    %10
    la2-+ r4\mbreak
    R2.*2
    r4 r la'

    %14
    la2 r4
    r r la,
    la2 r4

    %17
    r r la
    re4 la2
    r4 si la

    %20
    fad2.
    fad'
    mi2 r8 la

    %23
    la2 sold4-+
    la2 mi4
    si'2 sold4

    %26
    la2 r4
    la2.
    sold

    %29
    \tuplet 3/2 { la8(si la) la[(si la)] la(si la) }
    sold2 si4
    mi re dod

    %32
    si2 la4
    r si, re
    dod2.

}

IIfgIn = \relative do' {

    la'4 fad-+ mi
    fad-+ mi8 fad re4
    la'2 r4

    %4
    la2 r4
    la2 r4
    la2.

    %7
    mi4 mi \tuplet 3/2 { mi8(fad sol) }
    fad4 fad \tuplet 3/2 { fad8(sol la) }
    mi4 mi \tuplet 3/2 { mi8 fad sol }

    %10
    fad mi fad2\mbreak
    \clef bass \key re\major la,4 fad-+ mi
    fad-+ mi8 fad re4

    %13
    \clef tenor \key re\major la''2 r4
    la2 r4
    la2 r4

    %16
    la2 r4
    sol fad \tuplet 3/2 { mi8-+ re (mi) }
    re4 mi la,

    %19
    sol' fad \tuplet 3/2 { mi8-+ re mi}
    re2.
    \clef bass \key re\major re,2.

    %22
    dod
    si4 mi mi,
    la2 la'4

    %25
    sold2 mi4
    la2 la,4
    \tuplet 3/2 { dod'8(re dod) dod[(re dod)] dod(re dod)

    %28
    si(dod si) si[(dod si)] si(dod si)
    la(si la)} la4 la,\mbreak
    mi' \tuplet 3/2 { mi'8(fad mi) re[(mi re)] }

    %31
    dod4 si-+ la
    sold2 la4
    r re, mi

    %34
    la, la'8 sol fad-+ mi

}

IIfgIIn = \relative do' {

    fad4 re la
    re si fad
    re'2 r4

    %4
    la2 r4
    re2 r4
    la2.

    %7
    dod4 dod \tuplet 3/2 { dod8(re mi) }
    re4 re \tuplet 3/2 { re8(mi fad) }
    dod4 dod \tuplet 3/2 { dod8-+ re mi }

    %10
    re-+ dod re2\mbreak
    \clef bass \key re\major fad,4 re la
    re la fad

    %13
    \clef tenor \key re\major re'' fad, re
    la'2.
    re4 fad, re

    %16
    la'2.
    mi'4 re la
    fad la r

    %19
    mi' re la
    re,2.
     \clef bass \key re\major re2.

    %22
    dod
    si4 mi mi,
    la2 la'4

    %25
    sold2 mi4
    la2 la,4
    \tuplet 3/2 { dod'8(re dod) dod[(re dod)] dod(re dod)

    %28
    si(dod si) si[(dod si)] si(dod si)
    la(si la)} la4 la,\mbreak
    mi' \tuplet 3/2 { mi'8(fad mi) re[(mi re)] }

    %31
    dod4 si-+ la
    sold2 la4
    r re, mi

    %34
    la, la'8 sol fad-+ mi

}

IIbcn = \relative do {

    re2 la4
    re la re,
    r r re'

    %4
    la2 la4
    re2 re,4
    la'2.

    %7
    la'4 la la
    re, re re
    la la la

    %10
    re,2 r4\mbreak
    R2.*2
    r4 r re'

    %14
    la2 la4
    re2 re,4
    la'2 r4

    %17
    r r la
    si dod re
    r sol, la

    %20
    re,2.\mbreak
    re'2.
    dod

    %23
    si4 mi mi,
    la2 la'4
    sold2 mi4

    %26
    la2 la,4
    \tuplet 3/2 { dod'8(re dod) dod[(re dod)] dod(re dod)
    si(dod si) si[(dod si)] si(dod si)

    %29
    la(si la)} la4 la,\mbreak
    mi' \tuplet 3/2 { mi'8(fad mi) re[(mi re)] }
    dod4 si-+ la

    %32
    sold2 la4
    r re, mi
    la, la'8 sol fad-+ mi

}

IIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 65
    s2.*6
    \bar ":|."%\break
    s2.*14
    \bar "||"%\break
    s2.*14
    \bar "||"
    \mark\markup\smaller\center-column {"Da""Capo"}

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>
}

IIhbI = {
    \IIglobal
    <<\IIhbIn \forma>>
}

IIhbII = {
    \IIglobal
    <<\IIhbIIn \forma>>
}


IIvlaI = {
    \IIglobal
    <<\IIvlaIn \forma>>
}


IIcrI = {
    \IIglobal
    <<\IIcrIn \forma>>
}



IIcrII = {
    \IIglobal
    <<\IIcrIIn \forma>>
}


IIfgI = {
    \IIglobal
    \clef tenor
    <<\IIfgIn \forma>>
}


IIfgII = {
    \IIglobal
    \clef tenor
    <<\IIfgIIn \forma>>
}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

IIIvlIn = \relative do'' {

    fad4 la,8 la
    la4-+ sol mi' sol,8 sol
    sol4-+ fad  re' re,8 re
    re re' re, mi fad mi fad sol

    %4
    mi2-+ fad'4 la,8 la
    la4-+ sol mi' sol,8 sol
    sol4-+ fad re' re,8 re\mbreak

    %7
    re re' re, mi fad sol mi fad
    re2 re'4_\markup\italic"1.er couplet" fad,8 fad
    fad4-+ mi dod' mi,8 mi

    %10
    mi4-+ re si' si,8 si
    si si' si, dod re dod re mi
    fad2 fad'4 fad,8 fad

    %13
    dod' si dod re dod8.(red16) red8.-+(dod32 red)
    mi8.(fad16) fad8.-+(mi32 fad) sol8 si si, si\mbreak
    si si' si, dod re mi dod re

    %16
    si2-+ mi4 mi,8 re'
    dod mi la, la la mi' sol, sol
    sol4-+ fad si re,8 re

    %19
    la'4 re,8 re si'4 re,8 re
    la'4 re,8 re si' dod re mi
    dod4-+ \appoggiatura si8 la4 fad' la,8 la

    %22
    re,2_\markup\italic"2.e couplet" la''4 re,8 re\mbreak
    mi4 dod-+ la'4 mi8 mi
    fad4-+ \grace mi8 re4 la'4 re,8 re

    %25
    re4-+ dod la' mi8 mi
    fad4-+ \grace mi8 re4 la' re,8 re
    mi mi dod dod re re si mi

    %28
    dod8.\prall re16 re8.-+(dod32 re) mi8 la la, la
    la la' la, si dod si dod re
    si2-+ mi4 mi,8 mi\mbreak

    %31
    fad fad sold sold la la si si
    dod8. (re16) re8.-+(dod32 re) mi8 la la, la
    la la' la, si dod si dod re

    %34
    la2 fad'4 la,8 la

}

IIIvlaIn = \relative do'' {

    la4 la8 re
    si4 mi la, la8 la
    la4 la8 sol fad mi re mi
    fad sol la sol fad mi re si'

    %4
    la2 la4 la8 re
    si re dod mi la,4 la8 la
    la4 la8 sol fad mi re mi\mbreak

    %7
    fad sol la sol fad re mi dod
    re2 la'4 la8 si
    la4 la8 re dod si lad dod

    %10
    fad,4 fad fad si8 sol
    fad4. fad8 fad4 fad8 si,
    dod[dod'] fad, lad si4 si8 si

    %13
    si4. si8 si4 la
    sol si si4. la8\mbreak
    sol4. sol8 fad sol mi fad

    %16
    re4 re'8 dod si la si sold
    la4 mi la la8 la
    la4 re8 fad, sol4 re8 sol

    %19
    fad re la' fad sol4 re8 sol
    fad re la' fad sol4 sol8 si
    la mi la sol fad4 la8 re

    %22
    re,2 re4 la'8 la\mbreak
    la4 mi'8 la, mi' re dod mi
    re4 fad8 mi re4 re8 re

    %25
    la4 mi'8 la, mi' re dod mi
    re4 fad8 mi re4 la8 la
    dod4 mi8 la, si si re sold,

    %28
    la4 sold la mi'8 re
    dod si dod sold la mi mi la
    sold4 si8 sold la4 la8 mi\mbreak

    %31
    re fad mi sold fad la sold si
    la4 sold la8 si dod re
    dod si la sold la la si sold

    %34
    la4 la, la' la8 re

}

IIIvlaIIn = \relative do'' {

    re,4 re8 fad
    mi4 la,8 si dod re mi dod
    re4 fad8 mi re mi fad mi
    re mi fad mi la,4 la8 re

    %4
    dod re mi dod re4 re8 fad
    mi4 la,8 si dod re mi dod
    re4 fad8 mi re mi fad mi\mbreak

    %7
    re mi fad sol la, si si la
    fad2 fad'4 re8 re
    re4-+ dod mi mi8 mi

    %10
    mi4-+ re re re8 si
    re4. lad8 si re dod si
    lad4. dod8 re dod si fad'

    %13
    sol fad sol la sol4 fad-+
    mi4. red8 mi4. red8\mbreak
    mi4. si'8 si dod fad,[lad]

    %16
    si2 si4 mi,8 mi
    mi4 mi8 re dod si la mi'
    re4 re re re8 re

    %19
    re4 re re re8 re
    re4 re re re8 sol
    mi re dod mi re4 re8 fad

    %22
    la,2 fad'4 fad8 fad\mbreak
    mi4 mi8 la sol fad mi[la]
    la4 la8 sol fad4 fad8 fad

    %25
    mi4 mi8 la sol fad mi la
    la4 la8 sol fad4 la8 fad
    mi4 mi8 mi mi4 mi8 mi

    %28
    mi4 re8 si dod4. re8
    mi4. mi8 mi si' la fad
    mi4 mi8 si dod4 la8 la\mbreak

    %31
    la si si dod dod re re mi
    mi4 re dod8 fad mi re
    mi4. mi8 mi fad fad mi

    %34
    dod4 la'8 sol fad mi re fad

}

IIIbcn = \relative do {

    re'8 mi fad re
    mi fad mi re dod si dod la
    re la re,[mi] fad sol la sol
    fad sol fad mi re dod re sol,

    %4
    la mi' la sol fad mi fad re
    mi fad mi re dod si dod la
    re dod re mi fad sol la sol\mbreak

    %7
    fad sol fad mi re si sol la
    <<{re, la' si dod}\\re,2_\fermopz>> re'8 mi fad sol
    la si dod si lad sold lad fad

    %10
    si lad si dod re si fad[sol?]
    re4. dod8 si4 lad?8 sol
    fad dod' fad mi re mi fad re

    %13
    mi re mi fad mi8. fad16 fad8.-+(mi32 fad)
    sol8 la16 sol fad8 [si] mi,4. fad8\mbreak
    sol fad sol mi si' mi, fad[fad,]

    %16
    si fad' si la sold fad sold mi
    la sold? la si dod re mi dod
    re re, fad re sol, sol' si sol

    %19
    fad la re, fad sol, sol' si sol
    fad la re, fad sol la si sol
    la si dod la re mi fad re

    %22
    re,, la' si dod re mi fad sol\mbreak
    la sol la si dod re mi dod
    re la re,[mi] fad mi fad sol

    %25
    la sol la si dod re mi dod
    re dod re mi fad mi fad re
    dod si la dod si la sold mi

    %28
    la dod si re dod re dod si
    dod re dod si la sold la re,
    mi fad mi re dod si dod la\mbreak

    %31
    re re mi mi fad fad sold sold
    la8. si16 si8.-+(la32 si) dod8 re dod si
    dod re dod si la fad re mi

    %34
    la, la' si dod re mi fad re

}

IIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 55
    \partial 2 s2
    \mark\markup\smaller\center-align {\musicglyph #"scripts.segno"}
    s1*7
    s2
    \bar "|."%\break
    \mark\markup\huge "Fin"
    s
    s1*13
    \bar "||"
    \mark\markup\smaller\center-column {"Al""segno"}
    s1\break
    s1*12
    \bar "||"
    \mark\markup\smaller\center-column {"Al""segno"}

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
    <<\IIIvlaIIn \forma>>
}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}



IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

IVvlIn = \relative do'' {

    fad,4.\p mi8 fad4
    sol sol(fad\prall)
    fad(mi\prall) re

    %4
    mi2-+ mi8 r
    fad4. mi8 fad4
    sol sol4.(fad16\prall mi)

    %7
    fad4 (mi4.-+) re8
    re2.
    fad'4.\f mi8 fad4

    %10
    sol sol(fad\prall)
    fad(mi\prall) re
    mi2-+ la,8 r

    %13
    fad'4. mi8 fad4
    sol sol4.(fad16\prall mi)
    fad4 (mi4.-+) re8

    %16
    re2.
    la4\dolce \appoggiatura sol8 fad4 si
    la \appoggiatura sol8 fad4 si

    %19
    la la(sol\prall)
    fad2-+ \appoggiatura mi8 re4
    la' \appoggiatura sol8 fad4 si

    %22
    la2 re4
    dod8(re) re4.-+(dod16 re)
    mi2.~\mbreak

    %25
    mi2 mi4
    fad \appoggiatura mi8 re4 fad
    mi-+ la, mi'

    %28
    fad mi-+ re
    la'2.~
    la2 r4

    %31
    fad,4. mi8 fad4

}

IVhbIn = \relative do'' {

    R2.*16
    la4\p \appoggiatura sol8 fad4 si
    la \appoggiatura sol8 fad4 si

    %19
    la la(sol\prall)
    fad2-+ \appoggiatura mi8 re4
    la' \appoggiatura sol8 fad4 si

    %22
    la2 re4
    dod8(re) re4.-+(dod16 re)
    mi2.~\mbreak

    %25
    mi2 mi4
    fad \appoggiatura mi8 re4 fad
    mi-+ la, mi'

    %28
    fad mi-+ re
    la'2.~
    la2 r4

    %31
    fad,4. mi8 fad4

}

IVvlaIn = \relative do'' {

    re,2\p la4
    si re2
    re4(dod\prall) si

    %4
    dod2-+ dod8 r
    re2 la4
    si re2

    %7
    re4(dod4.-+) re8
    re2.
    re'2\f la4

    %10
    si re2
    re4(dod\prall) si\mbreak
    dod2-+ dod8 r

    %13
    re2 la4
    si re2
    re4 dod4.-+(re8)

    %16
    re2.
    R2.*15

}

IVvlaIIn = \relative do'' {

    la,2.\p
    re4 si2
    la sold4-+

    %4
    la2 la8 r
    la2.
    sol?4 si2

    %7
    la2.
    fad-+
    la'\f

    %10
    re,4 si'2
    la sold4-+\mbreak
    la2.

    %13
    la
    sol?4 si2
    la2.

    %16
    fad-+
    R2.*15

}

IVfgIn = \relative do {

    fad4.\p mi8 fad4
    sol sol(fad\prall)
    fad(mi\prall) re

    %4
    mi2-+ mi8 r
    fad4. mi8 fad4
    sol sol4.(fad16\prall mi)

    %7
    fad4 (mi4.-+) re8
    re2.
    re'4.\f dod8 re4

    %10
    si4 sol2
    la si4\mbreak
    la2 la,8 r

    %13
    re'4. dod8 re4
    si sol2
    la la,4

    %16
    re2.
    fad4 \appoggiatura mi8 re4 sol
    fad4 \appoggiatura mi8 re4 sol

    %19
    fad4 mi-+ la
    re,2 re8 mi
    fad4 \appoggiatura mi8 re4 sol

    %22
    fad2 re4
    la' re,2
    la2.~\mbreak

    %25
    la2 la'4
    re2 re,4
    la'2 la4

    %28
    re dod-+ si
    la2.~
    la2 r4

    %31
    fad4. mi8 fad4

}

IVbcn = \relative do {

    re4.\p dod8 re4
    si sol2
    la si4

    %4
    la2 la8 r
    re4. dod8 re4
    si sol2

    %7
    la2.
    re,
    re''4.\f dod8 re4

    %10
    si4 sol2
    la si4\mbreak
    la2 la,8 r

    %13
    re'4. dod8 re4
    si sol2
    la la,4

    %16
    re2.
    R2.*15

}

IVbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 45
    s2.
    \mark\markup\smaller\center-align {\musicglyph #"scripts.segno"}
    s2.*15
    \bar "|."%\break
    \mark\markup\huge {"Fin"}
    s2.*15
    \bar "||"
    \mark\markup\smaller\center-column {"Al""segno"}

}

IVvlI = {
    \IVglobal
    <<\IVvlIn \forma>>
}


IVhbI = {
    \IVglobal
    <<\IVhbIn \forma>>
}


IVvlaI = {
    \IVglobal
    <<\IVvlaIn \forma>>
}


IVvlaII = {
    \IVglobal
    <<\IVvlaIIn \forma>>
}


IVfgI = {
    \IVglobal
    \clef bass
    <<\IVfgIn \forma>>
}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}



Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

VvlIn = \relative do'' {

    la4
    re fad8 sol la4 la la2
    fad2.-+ mi4 la sol
    fad-+ mi re la2 la4

    %4
    la2.~la2 la4
    re fad8 sol la4 la la2
    fad2. mi4 la sol

    %7
    fad-+ mi re la2 re4\mbreak
    re2.~re2 la4_\markup\italic "1.er couplet"
    re mi fad sol fad-+ mi

    %10
    \appoggiatura mi8 fad2. \grace mi8 re2 la'4
    sol4.\prall la8 \grace sol fad4 la sol-+ fad
    mi2.~mi2 mi,4

    %13
    la dod8 re mi4 mi mi2
    dod4-+ la mi' la2 mi4
    dod-+ dod8 re mi4 dod4.-+ si8 la4\mbreak

    %16
    la2.~la2 la4 re_\markup\italic "2.e couplet"
    la' la8 si do si la sol la si do la
    \grace la8 si2 \grace la8 sol4 si la8 sol fad mi

    %19
    red4\prall \grace dod8 si4 sol' fad4.\prall sol8 \grace fad mi4
    fad2.-+~fad2 si,4
    mi sol8 la si4 si si2\mbreak

    %22
    sol4 mi' si sol mi si
    mi sol8 la si4 sol4.-+ fad8 mi4
    mi2.~mi4 si8 dod si dod

    %25
    re dod si la sold fad mi4 si' mi
    dod-+ la mi' la2 re,4
    dod-+ la re mi2 fad4

    %28
    mi2.-+~mi2 la,4

}

VvlaIn = \relative do'' {

    la4
    re2. fad4 mi dod
    re2. dod4 re mi
    la,2. la2 mi4

    %4
    fad8 mi fad sol la sol fad sol la sol fad mi
    re4 re'8 mi fad4 mi re dod
    re2. dod4 re mi

    %7
    la,2. la4 mi sol\mbreak
    fad2.~fad2 la4
    si2 la4 si2 la4

    %10
    la2. fad2 fad'4
    mi4. fad8 re4 re la re
    dod2.-+ r

    %13
    la dod4 si sold
    la2. la
    la4 mi la la2 sold4-+\mbreak

    %16
    la2.~la2 la4 r
    re2. re
    re re4 do2

    %19
    si si4 si2 sol4
    red2.~red2 si'8 la
    sol4 mi mi' sol fad red\mbreak

    %22
    mi2 mi4 si sol mi
    si'2 mi4 mi4. si8 red4-+
    mi si8 la sol fad mi2 r4

    %25
    r mi8 fad sold la si2 sold4
    la2 la4 la2 la4
    la2 si4 dod2 re4

    %28
    la2.~la2 mi4

}

VvlaIIn = \relative do'' {

    r4
    fad,2 fad8 mi re4 la' la
    la2. la4 fad mi
    re la' re, dod2-+ la4

    %4
    re2.~re2 re8 mi
    fad4 fad8 mi re4 mi2 la4
    la2. la4 fad mi

    %7
    re la re dod2-+ re4\mbreak
    re2.~re2 fad4
    fad mi re re2 dod4

    %10
    re2. re2 re4
    la'2. la2 la4
    la2. r4 r la

    %13
    mi dod8 si la4 la mi' mi
    mi2. dod2 la4
    mi'2. mi4 si re\mbreak

    %16
    dod2.-+ la2 re4 la'8 sol
    fad4 fad8 sol la sol fad mi fad sol la fad
    sol2 re4 sol do la

    %19
    fad sol8 la si4 si,2 si4
    si2.~si4. red8 mi fad
    si,4 mi8 fad sol4 mi si' si\mbreak

    %22
    si2 si4 mi si sol
    mi2. mi4 si' fad
    sol2. r4 mi8 fad sold la

    %25
    si4 sold mi2 mi
    mi4 dod8 re mi fad sol2 fad4
    mi2 fad8 re la'4 la2

    %28
    la2.~la2 mi4

}

Vbcn = \relative do {

    r4
    re2. re'4 dod la
    re re,8 mi fad sol la4 si dod
    re dod si la2 la8 sol

    %4
    fad sol la sol fad mi re2.~
    re2 re'4 dod si la
    re re,8 mi fad sol la4 si dod

    %7
    re fad, sol la2 la,4\mbreak
    re2. r4 r re'
    si dod re mi,2 la4

    %10
    re, la8 sol fad mi re2 re''4
    dod2 re4 fad, mi re
    la'2. r

    %13
    la, la'4 sold-+ mi
    la2. la,
    la'4 la,8 si dod re mi2 mi,4\mbreak

    %16
    la2 la'8 sol fad sol la sol fad mi r4
    re'2. re,
    sol2 sol,4 sol' la2

    %19
    si8 la sol fad mi4 red2 mi4
    si2. si'8 do si la sol fad
    mi2. mi4 red si\mbreak

    %22
    mi mi mi mi2 mi8 fad
    sol4 mi8 fad sol la si2 si,4
    mi si8 la sol fad mi2 r4

    %25
    mi'' re8 dod si la sold fad mi fad sold mi
    la sol? fad mi re4 dod2 re4
    la' sol fad mi2 re4

    %28
    la' mi8 re dod si la2

}

Vbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 6/4
    \tempo 1. = 40
    \partial 4 s4 \once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    \mark\markup\smaller\center-align {\musicglyph #"scripts.segno"}
    s1.*7
    s2. s2
    \bar "|."%\break
    \mark\markup\huge "Fin"
    s4
    s1.*8
    \bar "||"
    \mark\markup\smaller\center-column {"Al""segno"}
    \partial 4 s4
    \set Score.currentBarNumber = #17
    s1.*12
    \bar "||"
    \mark\markup\smaller\center-column {"Al""segno"}

}

VvlI = {
    \Vglobal
    <<\VvlIn \forma>>
}

VvlaI = {
    \Vglobal
    <<\VvlaIn \forma>>
}

VvlaII = {
    \Vglobal
    <<\VvlaIIn \forma>>
}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}



VIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

VIvlIn = \relative do'' {

    fad,4_\markup\italic"a demi" fad8 sol
    \appoggiatura sol fad4 mi8 re la'4 la
    la2~la8(si la) sol-!
    \appoggiatura sol fad4 mi8 re mi fad sol mi

    %4
    sol(fad) mi(re) r2
    r re4\p re8 mi
    re4 r re r

    %7
    r re la' la,
    re2\fermata r
    re4 r re r

    %10
    re r la''\f la
    \grace si8 la4 sol8 fad mi(fad) sol(mi)
    sol[(fad)] mi(re) r2

    %13
    re,4\p r re r
    re r re'\f re8 mi
    re-! dod-! si-! la-! sol-! fad-! mi-! re-!

    %16
    la1\p~
    la2 mi'8^\cresc mi \grace fad mi[re16 mi]\mbreak
    fad8-! fad-! \grace sol fad[mi16 (fad)] sold8-![sold-!] \grace la sold[fad16(sold)]

    %19
    la1~
    la~
    la~

    %22
    la2 la'8\f sold fad mi
    re dod si la dod4 \afterGrace si-+({la16[si)]}
    la2 fad4_\markup\italic"a demi" fad8 sol

}

VIvlIIn = \relative do'' {

    re,4_\markup\italic"a demi" re8 mi
    re4 la fad' fad8 sol
    fad2~fad8(sol fad) mi-!
    re4 re2 dod4

    %4
    re la r2
    r re4\p re8 mi
    re4-! r re-! r

    %7
    r re la' la,
    re2\fermata r
    re4 r re r

    %10
    re r fad'\f fad
    \grace sol8 fad4 mi8 re dod(re) mi(dod)
    re4 la r2

    %13
    re,4\p r re r
    re r re'\f re8 mi
    re-! dod-! si-! la-! sol-! fad-! mi-! re-!

    %16
    la1\p~
    la2 dod\p\mbreak
    re si

    %19
    dod mi8^\cresc mi \grace fad mi[re16 mi]\mbreak
    fad8-! fad-! \grace sol fad[mi16 (fad)] sold8-![sold-!] \grace la sold[fad16(sold)]
    la1~

    %22
    la2 la8\f sold fad mi
    re dod si la dod4 \afterGrace si-+({la16[si)]}
    la2 re4_\markup\italic"a demi" re8 mi

}

VIhbIn = \relative do'' {

    re4 re8 mi
    re4 la fad' fad8 sol
    fad2~fad8(sol fad) mi-!
    re4 re2 dod4-+

    %4
    re la r2
    R1*3
    r2\fermata r

    %9
    R1
    r2 fad'\f
    fad mi

    %12
    fad r
    R1*2
    fad2 fad

    %16
    \grace sol8 fad(mi) mi-![fad-!] \grace sol fad8(mi) mi-![fad-!]
    \grace sol fad4 mi r2\mbreak
    R1

    %19
    r2 mi(
    fad sold)
    la1~

    %22
    la2 r
    r4 la,2 sold4
    la2 re4 re8 mi

}

VIhbIIn = \relative do'' {

    re4 re8 mi
    re4 la fad' fad8 sol
    fad2~fad8(sol fad) mi-!
    re4 re2 dod4-+

    %4
    re la r2
    R1*3
    r2\fermata r

    %9
    R1
    r2 re\f
    re dod

    %12
    re r
    R1*2
    la2 re

    %16
    \grace mi8 re(dod) dod-![re-!] \grace mi8 re(dod) dod-![re-!]
    \grace mi re4 dod r2\mbreak
    R1

    %19
    r2 dod(
    re si)
    dod1~

    %22
    dod2 r
    r4 la2 sold4
    la2 re4 re8 mi

}

VIcrIn = %\transpose do re,
\relative do'' {
    \key do\major

    r2
    R1*3
    r2 mi4 mi8 fa
    \grace fa mi4 \grace re8 do4 sol' sol

    %6
    sol2 sol4 sol8 fa
    mi4 re8 do mi4 re
    do2\fermata do4 do8 re

    %9
    do4 sol mi' mi8 fa
    mi2 r
    R1

    %12
    r2 do4 do8 re
    do4 sol mi' mi8 fa
    mi2 r

    %15
    R1*3\mbreak
    sol,1~
    sol~

    %20
    sol~
    sol~
    sol2 r

    %23
    R1*2

}

VIcrIIn = %\transpose do re,
\relative do'' {
    \key do\major

    r2
    R1*3
    r2 do4 do8 re
    do4 sol mi' mi8 fa

    %6
    mi2 mi4 mi8 re
    do2 sol
    mi2\fermata r

    %9
    r do'4 do8 re
    do2 r
    R1

    %12
    r2 mi,4 r
    mi r do' do8 re
    do2 r

    %15
    R1*3\mbreak
    sol,1~
    sol~

    %20
    sol~
    sol~
    sol2 r

    %23
    R1*2

}

VIvlaIn = \relative do'' {

    re,4 re8 mi
    re4 la fad' fad8 sol
    fad2 fad8(la fad) mi-!
    re2 la

    %4
    re r
    r re4 re8 mi
    re4-! r re-! r

    %7
    r re-! la' la,-!
    re2\fermata r
    re4 r re r

    %10
    re r re'2
    si4 sol la la,
    re2 r

    %13
    re4 r re r
    re r re' re8 mi
    re2 re,

    %16
    la1~
    la~\mbreak
    la~

    %19
    la~
    la~
    la~

    %22
    la2 la'
    fad mi4 re
    dod2 re4 re8 mi

}

VIfgIn = \relative do {

    fad4 fad8 sol
    \grace sol8 fad4 mi8 re la'4 la
    la2 la8(si la) sol-!
    \grace sol fad4 mi8 re mi(fad) sol(mi)

    %4
    sol(fad) mi(re) fad'4 fad8 sol
    \grace sol fad4 \grace mi re4 la' la
    la2 la4 la8 sol

    %7
    \grace sol fad4 mi8 re fad4 mi-+
    re2\fermata re4 re8 mi
    re4 la fad' fad8 sol

    %10
    fad2 re
    si4 sol la la,
    re2 re'4 re8 mi

    %13
    re4 la fad' fad8 sol
    fad2 re4 re8 mi
    re2 re,

    %16
    la'1~
    la~\mbreak
    la

    %19
    r2 dod(
    re si)
    dod1~

    %22
    dod2 mi
    la,4 la2 sold4
    la2 fad4 fad8 sol

}

VIfgIIn = \relative do {

    fad4 fad8 sol
    \grace sol8 fad4 mi8 re la'4 la
    la2 la8(si la) sol-!
    \grace sol fad4 mi8 re mi(fad) sol(mi)

    %4
    sol(fad) mi(re) re'4 re8 mi
    re4 la fad' fad8 sol
    fad2 fad4 fad8 mi

    %7
    re4 re2 dod4-+
    re2\fermata r
    r re4 re8 mi

    %10
    re2 re
    si4 sol la la,
    re2 fad4 fad8 sol

    %13
    fad2 re'4  re8 mi
    re2 re4 re8 mi
    re2 re,

    %16
    la'1~
    la~\mbreak
    la

    %19
    r2 dod(
    re si)
    dod1~

    %22
    dod2 mi
    la,4 la2 sold4
    la2 fad4 fad8 sol

}

VIbcn = \relative do {

    r2
    r re4 re8 mi
    re2 re
    re la

    %4
    re r
    r re4 re8 mi
    re4 r re r

    %7
    r re la' la,
    re2\fermata r\mbreak
    re4 r re r

    %10
    re r fad,2
    sol la
    re r

    %13
    re4 r re r
    re r re' re8 mi
    re2 re,

    %16
    la1~
    la~\mbreak
    la~

    %19
    la~
    la~
    la~

    %22
    la2 dod
    re mi
    la, r

}

VIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \tempo 2 = 60
    \partial 2 s2 \once \override Score.RehearsalMark.extra-offset = #'(0 . 0)
    \mark\markup\smaller\center-align {\musicglyph #"scripts.segno"}
    s1*7
    s2
    \bar "|."%\break
    \mark\markup \huge {Fin}
    s
    s1*16
    \bar "||"
    \mark\markup \huge\center-column {"Al""segno"}

}

VIvlI = {
    \VIglobal
    <<\VIvlIn \forma>>
}


VIvlII = {
    \VIglobal
    <<\VIvlIIn \forma>>
}


VIhbI = {
    \VIglobal
    <<\VIhbIn \forma>>
}


VIhbII = {
    \VIglobal
    <<\VIhbIIn \forma>>
}


VIvlaI = {
    \VIglobal
    <<\VIvlaIn \forma>>
}


VIcrI = {
    \VIglobal
    <<\VIcrIn \forma>>
}


VIcrII = {
    \VIglobal
    <<\VIcrIIn \forma>>
}


VIfgI = {
    \VIglobal
    \clef tenor
    <<\VIfgIn \forma>>
}


VIfgII = {
    \VIglobal
    \clef tenor
    <<\VIfgIIn \forma>>
}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>
}



VIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

VIIvlIn = \relative do'' {

    la8
    la4 re8 re4 fad8
    mi <mi dod> <mi dod> <mi dod>4 la,8
    la4 mi'8 mi4 sol8

    %4
    fad <fad re> <fad re> <fad re>4.
    si8 si si la la la
    sol4.-+ fad4 la8

    %7
    la sol fad la sol fad
    mi4.-+~mi4 la,8
    la4 re8 re4 fad8\mbreak

    %10
    mi <mi dod> <mi dod> <mi dod>4 la,8
    la4 mi'8 mi4 sol8
    fad <fad re> <fad re> <fad re>4.

    %13
    si,8 si si sol' mi si
    dod si la re4 sol8
    fad mi re mi4.-+

    %16
    re8 re, re re4 la'8_\markup\italic "1.er couplet"
    la la la la re fad
    si, si si si re sol

    %19
    la, fad' la, sol mi' sol,\mbreak
    fad fad fad fad4 fad'8
    fad re si mi dod la

    %22
    re si sold la4 mi'8
    fad mi re dod si la
    sold mi mi mi4.

    %25
    dod'16_\markup\italic "a demi" (re mi fad) mi8\parenthesize -! re re re
    dod4.-+ si
    dod16(re mi fad) mi8\parenthesize -! re re re

    %28
    dod4.-+ si4 mi8\f
    fad la fad sold si sold\mbreak
    la4. re,-+

    %31
    dod8 si la si4.-+
    la2 r8 la fad'_\markup\italic "2.e couplet"
    fad mi re sol fad mi

    %34
    fad mi re sol fad mi
    fad fad mi re dod si
    fad' fad, fad fad4 fad'8^\markup\italic "Hautbois"\p

    %37
    fad(re) mi-! mi(dod) re-!
    re4.(dod8) r fad\mbreak
    fad(re) mi-! mi(dod) re-!

    %40
    re4.(dod8) r fad^\tu\f
    si,8 si si si mi sol
    fad mi re mi re dod

    %43
    re4. dod-+
    si8 si, si si4 si'8
    si4 mi8 mi4 re8

    %46
    dod la si dod re mi
    fad mi re sold4.-+
    la2.

    %49
    fad,16_\markup\italic "a demi"(sol la si) la8 \parenthesize -! sol sol sol
    fad4.-+ mi
    fad16(sol la si) la8-! sol sol sol

    %52
    fad4.-+ mi4 la8\f

}

VIIvlIIn = \relative do'' {

    r8
    r4 la8 la4 re8
    \once\stemDown dod la, la la4 r8
    r4 dod'8 dod4 mi8

    %4
    re re, re re4.
    sol'8 sol sol fad fad fad
    mi4.-+ re4 fad8

    %7
    fad mi re fad mi re
    dod4.-+~dod4 r8
    r4 la8 la4 re8\mbreak

    %10
    \once\stemDown dod la, la la4 r8
    r4 dod'8 dod4 mi8
    re re, re re4.

    %13
    si'8 si si sol' mi si
    dod si la re4 mi8
    re4. dod-+

    %16
    re8 re, re re4 fad8
    fad fad fad fad fad fad
    sol sol sol sol sol sol

    %19
    fad fad fad mi mi mi\mbreak
    re re re re4 la'8
    la4. la

    %22
    sold4 mi8 dod4 mi'8
    fad mi re dod si la
    sold-+ mi mi mi4.

    %25
    la16_\markup\italic "a demi"\parentSlur (si dod re) dod8\parenthesize -! si si si
    la4.-+ sold
    la16 (si dod re) dod8-! si si si

    %28
    la4.-+ (sold4) sold8\f
    la la la si si si\mbreak
    dod4. sold

    %31
    la4 la8 sold4.-+
    la2 r4 re8
    re dod si mi re dod

    %34
    re dod si mi re dod
    re fad mi re dod si
    fad' fad, fad fad4 re'8^\markup\italic "Hautbois"\p

    %37
    re \parentSlur (si) dod\parenthesize -! dod \parentSlur (lad) si\parenthesize -!
    si4.(lad8) r re\mbreak
    re(si) dod-! dod(lad) si-!

    %40
    si4.(lad8) r fad'^\tu \f
    si, si si si mi sol
    fad mi re mi re dod

    %43
    si4. lad
    si8 si, si si4 si'8
    si4 mi8 mi4 re8

    %46
    dod la si dod re mi
    fad mi re sold4.-+
    la2.

    %49
    re,,16_\markup\italic "a demi"(mi fad sol) fad8\parenthesize -! mi mi mi
    re4.-+ dod
    re16(mi fad sol) fad8 -! mi mi mi

    %52
    re4.-+ dod4 la'8\f

}

VIIcrIn = %\transpose do re,
\relative do'' {
    \key do\major

    r8
    R2.
    r8 re re re4 r8
    R2.

    %4
    r8 mi, mi mi4.
    R2.
    r4 r8 r4 sol'8

    %7
    sol fa mi sol fa mi
    re re re re4.
    R2.*3

    %12
    r8 do do do4.
    r4 r8 fa fa fa
    fa4. mi4 fa8

    %15
    mi re do re4.-+
    do8 mi, mi mi4 do'8
    do2.~

    %18
    do~
    do4. re-+\mbreak
    do8 mi, mi mi4.

    %21
    R2.*3
    r8 re' re re re re
    re4. r4 r8

    %26
    r re re re re re
    re4. r4 r8
    r re re re re re

    %29
    re2.~\mbreak
    re~
    re~

    %32
    re8 re re re4 r8 r
    R2.*3
    r8 mi, mi mi4.

    %37
    R2.
    r8 mi mi mi4.\mbreak
    R2.

    %40
    r8 mi mi mi4.
    R2.*7\mbreak
    r8 sol sol sol sol sol

    %49
    sol4. r4 r8
    r sol sol sol sol sol
    sol4. r4 r8

    %52
    r sol sol sol4.

}

VIIcrIIn = %\transpose do re,
\relative do'' {
    \key do\major

    r8
    R2.
    r8 sol sol sol4 r8
    R2.

    %4
    r8 do, do do4.
    R2.
    r4 r8 r4 mi'8

    %7
    mi re do  mi re do
    sol sol sol sol4.
    R2.*3

    %12
    r8 mi mi mi4.
    r4 r8 re' re re
    re4. do4 sol8

    %15
   do,4. sol'
   mi8 do do do4 do8
    do2.~

    %18
    do~
    do4. sol'\mbreak
    mi8 do do do4.

    %21
    R2.*3
    r8 re' re re re re
    re4. r4 r8

    %26
    r re re re re re
    re4. r4 r8
    r re re re re re

    %29
    re2.~\mbreak
    re~
    re~

    %32
    re8 re re re4 r8 r
    R2.*3
    r8 mi, mi mi4.

    %37
    R2.
    r8 mi mi mi4.\mbreak
    R2.

    %40
    r8 mi mi mi4.
    R2.*7\mbreak
    r8 sol sol sol sol sol

    %49
    sol4. r4 r8
    r sol sol sol sol sol
    sol4. r4 r8

    %52
    r sol sol sol4.

}

VIIvlaIn = \relative do'' {

    r8
    r4 re,8 re4 re8
    dod dod dod dod4.
    r4 la'8 la4 dod,8

    %4
    re re re re4.
    re8 re re re re re
    dod4.-+ re4 re8

    %7
    re4. re
    mi8 mi mi mi4.
    r4 re8 re4 re8\mbreak

    %10
    dod dod dod dod4.
    r4 la'8 la4 dod,8
    re re re re4.

    %13
    r4 r8 si' si si
    la4. la4 la8
    la4. la4 sol8

    %16
    fad fad fad fad4 re8
    re4. re
    re re

    %19
    re dod\mbreak
    re8 re re re4.
    R2.

    %22
    r4 r8 r4 dod'8
    re dod si la sold fad
    mi mi mi mi mi mi

    %25
    mi4. r4 r8
    r  mi mi mi mi mi
    mi4. r4 r8

    %28
    r mi mi mi mi mi
    dod4. si\mbreak
    la mi'

    %31
    mi4 mi8 mi4 re8
    dod dod dod dod4 r8 si'
    si2.~

    %34
    si~
    si8 fad mi re dod si
    fad' fad fad fad4.

    %37
    R2.
    r8 fad fad fad4.\mbreak
    R2.

    %40
    r8 fad fad fad4 lad8
    si4. si
    si lad

    %43
    si4 fad8 fad4 mi8
    re re re re4.
    r4 si'8 si4 sold8

    %46
    la4.~la4 la8
    la4. re,\mbreak
    dod8 la' la la la la

    %49
    la,4. r4 r8
    r la la la la la
    la4. r4 r8

    %52
    r8 la la la4 r8

}

VIIbcn = \relative do {

    r8
    r4 fad8 fad4 re8
    la' la, la la4.
    r4 la'8 la4 la,8

    %4
    re re, re re4.
    sol' re
    la8 la la re4.

    %7
    re' re,
    la'8 la, la la4.
    r4 fad'8 fad4 re8\mbreak

    %10
    la' la, la la4.
    r4 la'8 la4 la,8
    re re, re re4.

    %13
    sol'8 sol sol  mi mi mi
    la4. re,4 la8
    re4 re'8 la4 la,8

    %16
    re re, re re4 re'8
    re4. re
    re re

    %19
    re re\mbreak
    re8 re, re re4 re''8
    re4. dod

    %22
    si la4 dod8
    re dod si la sold fad
    mi mi, mi mi mi mi

    %25
    mi4. r4 r8
    r8 mi' mi mi mi mi
    mi4. r4 r8

    %28
    r8 mi' mi mi mi mi
    mi4. re\mbreak
    dod si

    %31
    la4 la,8 mi'4 mi,8
    la la la la4 r8 si'
    si4. fad

    %34
    si fad
    si8 fad mi re dod si
    fad' fad, fad fad4.

    %37
    R2.
    r8 fad' fad fad4.\mbreak
    R2.

    %40
    r8 fad fad fad4 mi8
    re4. mi
    re dod

    %43
    si4 si'8 fad4 fad,8
    si si si si4 si'8
    sold4. mi

    %46
    la~la4 la,8
    re4. si-+\mbreak
    la8 la' la la la la

    %49
    la,4. r4 r8
    r la' la la la la
    la4. r4 r8

    %52
    r la, la la4 r8

}

VIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 6/8
    \tempo 2. = 55
    \partial 8 s8\once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    \mark\markup\smaller\center-align {\musicglyph #"scripts.segno"}
    s2.*15
    s4. s4\bar "|."%\break
    \mark\markup \huge {Fin}
    s8
    s2.*16
    \bar "||"%\break
    \mark\markup \huge\center-column {"Al""segno"}
    \partial 8 s8
    \set Score.currentBarNumber = #33
    s2.*20
    \bar "||"
    \mark\markup \huge\center-column {"Al""segno"}

}

VIIvlI = {
    \VIIglobal
    <<\VIIvlIn \forma>>
}


VIIvlII = {
    \VIIglobal
    <<\VIIvlIIn \forma>>
}


VIIvlaI = {
    \VIIglobal
    <<\VIIvlaIn \forma>>
}


VIIcrI = {
    \VIIglobal
    <<\VIIcrIn \forma>>
}



VIIcrII = {
    \VIIglobal
    <<\VIIcrIIn \forma>>
}

VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
}



VIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

VIIIvlIn = \relative do'' {

    r4 fa,4.  mi8
    re4 fa' re-+
    mi la, re

    %4
    do sib4.\prall(la8)
    la4 \appoggiatura sol8 fa4 sib
    la sol2\prall

    %7
    fa8 mi re mi fa sol
    la4 re4. mi8
    dod4 la'4. sol8

    %10
    fa mi16 re do?4.\prall sib16 la
    sib4 sol'4. fa8\mbreak
    mi re16 do sib4. la16 sol

    %13
    \appoggiatura sol8 la4. fa'8 sol[la]
    do,(si?) fa[(mi)] si'(dod)
    \grace dod?8 re4. sol8 fa4\prall~

    %16
    fa8 mi mi4.-+ re8
    re4 la'4. sol8
    fa mi16 re do4.\prall sib16 la

    %19
    sib4 sol'4. fa8\mbreak
    mi re16 do sib4.\prall la16 sol
    \grace sol8 la4. fa'8 sol[la]

    %22
    do,(si?) fa[(mi)] si'(dod)
    \grace dod?8 re4. sol8 fa4\prall~
    fa8 mi mi4.-+ re8

    %25
    re4\fermata fa,8 [sol la sib]
    do4 fa, mi-+
    re re'4. do8

    %28
    sib do sib la sol fa\mbreak
    mi4-+ do'8 do re mi
    fa4 fa re-+

    %31
    mi do4. do16(re)
    sold,4.-+ mi'8 mi fa16(mi)
    la4 la, si-+

    %34
    do4. mi8 mi fa16 mi
    la4 la, si-+
    do2~ \tuplet 11/8 { do32(re do si la si do re mi fad sold) }\mbreak

    %37
    sold4.-+(la16 si) mi,4
    re8\prall do si4 mi
    dod-+ fa,4. mi8

}

VIIIvlaIn = \relative do'' {

    R2.
    r4la si
    do do, fa~

    %4
    fa fa mi
    fa la re,
    re dod2

    %7
    re4 la'4. sol16 fa
    mi8 la sol4.-+(fa16 sol)
    la2 r4

    %10
    r la fad-+
    sol2 r4\mbreak
    r sol mi-+

    %13
    fa2 la4
    la2 sol8 mi
    la4 sol la~

    %16
    la8 re dod4.-+ re8
    re2 r4
    r la fad-+

    %19
    sol2 r4\mbreak
    r4 sol mi-+
    fa2 la4

    %22
    la2 sol8 mi
    la4 sol la
    la8 re dod4.-+ red8

    %25
    re4\fermata ~ re r
    r fa,2
    fa r4

    %28
    r re sol \mbreak
    sol sol8 sol la do
    do4 do si

    %31
    do la fa
    mi2 r4
    r mi sold

    %34
    la2 r4
    r mi sold-+
    la2  r4\mbreak

    %37
    si2 do4
    si8\prall la sold4.-+ la8
    la4 r r

}

VIIIvlaIIn = \relative do'' {

    R2.
    r4 re, fa
    la la, sib

    %4
    do re do
    do la sol
    la sib la

    %7
    la2 la8 si?
    do mi re2
    mi r4

    %10
    r re re
    re2 r4\mbreak
    r do do

    %13
    do2 fa4
    fa2 mi8 sol
    fa4 mi re

    %16
    sib' la4. mi8
    fa2 r4
    r re re

    %19
    re2 r4\mbreak
    r do do
    do2 fa4

    %22
    fa2 mi8 sol
    fa4 mi re
    sib' la4. mi8

    %25
    fa4\fermata~fa r
    r do2
    sib r4

    %28
    r sib re\mbreak
    do mi8 mi fa sol
    la4 la sol

    %31
    sol8 mi fa4 re
    si2 r4
    r do mi

    %34
    mi2 r4
    r do mi
    mi2 r4\mbreak

    %37
    mi2 la8 mi
    fa4 mi4. mi8
    mi4 r r

}

VIIIbcn = \relative do {

    r4 re4.\tu mi8
    fa4 re re'
    do2 sib4

    %4
    la sol do
    fa,2 sol4
    fa mi la

    %7
    re,2 re4
    do sib2
    la r4

    %10
    r fad' re
    sol2 r4\mbreak
    r mi do

    %13
    fa2 re4
    sol2 mi4
    fa sib la

    %16
    sol la la,
    re2 r4
    r fad re

    %19
    sol2 r4\mbreak
    r mi do
    fa2 re4

    %22
    sol2\fermata mi4
    fa sib la
    sol la la,

    %25
    re4\fermata~re8 re do[sib]
    la2 fa4
    sib sib8 do sib la

    %28
    sol4 sol' sib\mbreak
    do, do8 do fa mi
    re4 re sol

    %31
    do, re2
    mi r4
    r la mi

    %34
    la,2 r4
    r la' mi
    la,2 la'4\mbreak

    %37
    re,2 do4
    re mi mi,
    la re4. mi8

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 40
    s2. \once \override Score.RehearsalMark.extra-offset = #'(0 . 0)
    \mark\markup\smaller\center-align {\musicglyph #"scripts.segno"}
    s2.*23
    s4
    \bar "|."
    \mark\markup\huge "Fin"
    s2
    s2.*14
    \bar "||"
    \mark\markup\smaller\center-column {"Al""segno"}

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
    <<\VIIIvlaIIn \forma>>
}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
}



IXglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

IXvlIn = \relative do'' {

    la8 la la la
    la4 re fad
    mi-+ la,8 la la la
    si4 fad4.-+ sold8

    %4
    la4. dod8 si[re]
    dod-+[si] la si fad sold
    la si dod re mi[fad]

    %7
    re dod si4.-+ la8
    la4 la8 la la la
    mi'4 sol fad

    %10
    mi-+ la,8 la' mi fad\mbreak
    fad4-+ mi8 la mi fad
    fad2-+ mi4

    %13
    r la,8 la la la
    re4 fad la
    fad-+ re8 la mi' la

    %16
    fad4-+ re8 la mi' la
    fad-+ sol la si sol4\prall~
    sol8 fad mi4.-+ re8

    %19
    re4 la8 la la la
    mi'4 sol fad
    mi-+ la,8 la' mi fad

    %22
    fad4-+ mi8 la mi fad
    fad2-+ mi4\mbreak
    r la,8 la la la

    %25
    re4 fad la
    fad-+ re8 la mi' la
    fad4-+ re8 la mi' la

    %28
    fad-+ sol la si sol4\prall~
    sol8 fad mi4.-+ re8
    re4\fermata fad,8 fad fad fad

    %31
    sol2 fad4
    mi-+ fad8-+ mi fad sol
    mi4-+ fad8 mi fad sol

    %34
    mi sol fad mi fad re\mbreak
    la' re dod4.-+ re8
    mi4 la,8 mi' fad sol

    %37
    mi4-+ la,8 mi' fad sol
    mi4-+ si re
    dod(si-+) la

    %40
    re dod-+ si
    mi4. fad8 re4\prall~
    re8 dod si4.-+ la8

    %43
    la4 la8 la la la

}

IXhbIn = \relative do'' {

    r2
    R2.*23
    r4 la8 la la la

    %25
    re4 fad la
    fad-+ re8 la mi' la
    fad4-+ re8 la mi' la

    %28
    fad-+ sol la si sol4\prall~
    sol8 fad mi4.-+ re8
    re4\fermata r r

    %31
    la2.~
    la~
    la~

    %34
    la~
    la8 re dod4.-+ re8
    mi4 la,8 mi' fad sol

    %37
    mi4-+ la,8 mi' fad sol
    mi4-+ si re
    dod(si-+) la

    %40
    re dod-+ si
    mi4. fad8 re4\prall~
    re8 dod si4.-+ la8

    %43
    la4 la8 la la la

}

IXvlaIn = \relative do'' {

    r4 r
    r fad,8 fad la la
    dod,2 mi4
    fad2 mi4

    %4
    mi2 mi4
    mi2 r4
    r la8 sold la4

    %7
    la sold4.-+ la8
    la2 la8 si
    dod4 mi re

    %10
    dod mi dod-+\mbreak
    re mi dod-+
    re2 dod4-+

    %13
    r fad,8 fad fad fad
    re4 la' la
    la la8 re dod dod

    %16
    re4 la8 re dod dod
    re2 re4~
    re dod4. re8

    %19
    re2 r4
    la dod, re
    la'2 la,4

    %22
    re dod la
    re2 la4\mbreak
    r dod8 dod fad fad

    %25
    la4 dod dod
    dod la8 la dod dod
    dod4 la8 la dod dod

    %28
    dod2 re4
    re dod4. si8
    la4\fermata~la r

    %31
    dod,2.~
    dod~
    dod~

    %34
    dod4 dod4. mi8\mbreak
    fad4 sol la
    la2 la4

    %37
    la2 la4
    la si sold
    la mi la

    %40
    sold la si
    dod4. re8 si4-+ ~
    si8 la sold4.-+ la8

    %43
    la2 r4

}

IXvlaIIn = \relative do'' {

    r4 r
    r la,8 la la la
    la2 la8 dod
    si4 re si-+

    %4
    dod2 si4
    la2 la8 si
    dod re dod si la4

    %7
    fad' mi4. re8
    dod4-+ dod8 dod dod mi
    la,4 la' la

    %10
    la2 la4\mbreak
    la2 la4
    la2 la4

    %13
    r re,8 re re re
    la4 re dod
    re fad8 fad mi mi

    %16
    re4 fad8 fad mi mi
    re sol fad4 si~
    si la4. sol8

    %19
    fad2-+ r4
    la dod, re
    la'2 la,4

    %22
    re dod la
    re2 la4\mbreak
    r la8 la re re

    %25
    fad4 la la
    la fad8 fad la la
    la4 fad8 fad la la

    %28
    la2 si4
    si la4. sol8
    fad4\fermata ~ fad r

    %31
    la,2.~
    la~
    la~

    %34
    la4 la4. dod8\mbreak
    re4 mi fad
    dod mi8 dod re4

    %37
    dod mi8 dod re4
    dod mi mi
    mi mi fad

    %40
    si, mi sold
    la2 fad4~
    fad mi4. re8

    %43
    dod2-+ r4

}

IXtpn = \relative do'' {

    la8 la la la
    la4 re fad
    mi-+ la, r
    R2.*5

    %8
    r4 la8 la la la
    mi'4 sol fad
    mi-+ la,8 la' sol fad\mbreak

    %11
    fad4-+ mi8 la mi fad
    fad2-+ mi4
    r la,8 la la la

    %14
    re4 fad la
    fad-+ re8 la mi' la
    fad4-+ re8 la mi' la

    %17
    fad-+ sol la si sol4\prall~
    sol8 fad mi4.-+ re8
    re2 r4

    %20
    R2.*4
    r4 la8 la la la
    re4 fad la

    %26
    fad-+ re8 la mi' la
    fad4-+ re8 la mi' la
    fad-+ sol la si sol4\prall~

    %29
    sol8 fad mi4.-+ re8
    re4\fermata~re r
    R2.*12

    %43
    r4 la8 la la la

}

IXtmpn = \relative do {

    r4 r
    r re8 re re re
    la4 r r
    R2.*5

    %8
    r4 la8 la la la
    la4 la la
    la la8 la la la\mbreak

    %11
    re4 la8 la la la
    re2 la4
    r re8 re re re

    %14
    re4 re la
    re re8 re la la
    re4 re8 re la la

    %17
    re2 re4~
    re \parenthesize la4. re8
    re2 r4

    %20
    R2.*4
    r4 re8 re re re
    re4 re la

    %26
    re re8 re la la
    re4 re8 re la la
    re2 re4~

    %29
    re la4. re8
    re4\fermata~re r4
    R2.*13

}

IXfgIn = \relative do {

    r4 r
    r re8 re re re
    la2 r4
    re2 mi8 re

    %4
    dod2 sold4
    la2 re4
    dod8 si la si dod4

    %7
    re mi mi,
    la2.
    la'4 dod, re

    %10
    la'2 la,4\mbreak
    re' dod la
    re2 la4

    %13
    r re8 re re re
    fad,4 re la
    re re8 re la la

    %16
    re4 re8 re la la
    re mi fad4 sol~
    sol la la,

    %19
    re2 r4
    R2.*4
    r4 re8 re re re

    %25
    re4 re la
    re re8 re la la
    re4 re8 re la la

    %28
    re mi fad4 sol~
    sol la la,
    re\fermata re8 re re re

    %31
    la'2 re4
    dod-+ re8 dod re mi
    dod4-+ re8 dod re mi

    %34
    dod4-+ re re,8 mi
    fad4 mi re
    la'2 re,4

    %37
    la2 re4
    la' sold mi
    la sold fad

    %40
    mi2 re4
    dod2 re4~
    re mi mi,

    %43
    la2 r4

}

IXbcn = \relative do {

    r4 r
    r re8 re re re
    la2 r4
    re2 mi8 re

    %4
    dod2 sold4
    la2 re4
    dod8 si la si dod4

    %7
    re mi mi,
    la2.
    la'4 dod, re

    %10
    la'2 la,4\mbreak
    re' dod la
    re2 la4

    %13
    r re8 re re re
    fad,4 re la
    re re8 re la la

    %16
    re4 re8 re la la
    re mi fad4 sol~
    sol la la,

    %19
    re2 r4
    \clef alto \key re\major la''4 dod, re
    la'2 la,4

    %22
    re dod la
    re2 la4\mbreak
   \clef bass \key re\major r re,8 re re re

    %25
    re4 re la
    re re8 re la la
    re4 re8 re la la

    %28
    re mi fad4 sol~
    sol la la,
    re\fermata re8 re re re

    %31
    dod2 re4
    la re2
    la4 re2

    %34
    la4 re4. mi8\mbreak
    fad4 mi re
    la'2 re,4

    %37
    la2 re4
    la' sold mi
    la sold fad

    %40
    mi2 re4
    dod2 re4~
    re mi mi,

    %43
    la2\footnote #' (-1 . 2) \markup\column\smaller {"  ""On reprend le Rondeau mineur jusq'au mot ”Fin”""  "} r4

}

IXbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 50
    \partial 2 s2
    \once \override Score.RehearsalMark.extra-offset = #'(0 . 0)
    \mark\markup\smaller\center-align {\musicglyph #"scripts.segno"}
    s2.*29
    s4
    \bar "|."
    \mark\markup\huge "Fin"
    s2
    s2.*13
    \bar "||"
    \mark\markup\smaller\center-column {"Al""segno"}

}

IXvlI = {
    \IXglobal
    <<\IXvlIn \forma>>
}


IXhbI = {
    \IXglobal
    <<\IXhbIn \forma>>
}

IXvlaI = {
    \IXglobal
    <<\IXvlaIn \forma>>
}


IXvlaII = {
    \IXglobal
    <<\IXvlaIIn \forma>>
}


IXtp = {
    \IXglobal
    <<\IXtpn \forma>>
}


IXtmp = {
    \IXglobal
    \clef bass
    <<\IXtmpn \forma>>
}


IXfgI = {
    \IXglobal
    \clef bass
    <<\IXfgIn \forma>>
}

IXbc = {
    \IXglobal
    \clef bass
    <<\IXbcn \forma \IXbfn>>
}



Xglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

XvlIn = \relative do'' {

    la8
    re4 re8 re4 re8
    re(dod re) re (dod re)
    mi4 mi8 la4.

    %4
    fad-+ mi4 mi8
    fad4 fad8 fad mi re
    mi4 mi8 mi la sol

    %7
    fad sol fad mi4-+ re8
    la'4 la,8 la4 la'8
    si4 si8 si la sol\mbreak

    %10
    la sol la re,4 la'8
    sol la sol fad sol fad
    mi4.-+ la,8 re dod

    %13
    si dod re la re dod
    si dod re la la' sol
    fad mi re dod-+ si dod

    %16
    re la fad re re' dod
    si dod re la re dod
    si dod re la la' sol

    %19
    fad mi re dod-+ si dod
    re4 la'8 re4 la8\mbreak
    fad-+ mi re la re dod

    %22
    re4. r4 la8^\markup\italic "1.r Viol. et Hb."
    mi'4 mi8 mi4 mi8
    mi4.-+~mi8 dod re

    %25
    mi dod la mi si' mi
    dod4.-+ si4 dod8
    re dod si la sold fad

    %28
    mi4. r8 la\tu sold
    fad sold la mi la sold
    fad sold la mi mi' re

    %31
    dod si la sold fad sold\mbreak
    la4 mi'8 la4 mi8
    dod si la mi la sold

    %34
    la4. r4 la8
    re4 re8 re4 re8
    re(dod re) re(dod re)

    %37
    mi4 mi8 la4.
    fad-+ mi4 mi8
    fad4 fad8 fad mi re

    %40
    mi4 mi8 mi la sol
    fad sol fad mi4-+ re8
    la'4 la,8 la4 la'8

    %43
    si4 si8 si la sol\mbreak
    la sol la re,4 la'8
    sol la sol fad sol fad

    %46
    mi4.-+ r8 re dod
    si dod re la re dod
    si dod re la la' sol

    %49
    fad mi re dod-+ si dod
    re4 la'8 re4 la8
    fad mi re la re dod

    %52
    re4. r4 si8^\markup\italic "1.r Viol. et Hb."
    fad'4 fad8 fad4 fad8
    fad4.-+~fad8 re mi\mbreak

    %55
    fad re si fad dod' fad
    re4.-+ \grace dod8 si4 re8\tu
    sol4 sol8 sol4 si8

    %58
    la4.~la8 sol fad
    mi la dod, re4 mi8
    dod4-+ si8 la4 mi'8

    %61
    mi dod re mi, si' mi
    dod4-+ si8 la4 la8
    re4 re8 re4 re8

}

XcrIn = %\transpose do re,
\relative do'' {
    \key do\major

    sol8
    do4 do8 do4 do8
    do4 mi8 sol fa mi
    re4 re8 sol4.

    %4
    mi-+ re4 re8
    mi4 mi8 mi re do
    re4 re8 re sol fa

    %7
    mi fa mi re4-+ do8
    sol'4. r4 r8
    r r do, do4.\mbreak

    %10
    r8 r do do4 sol'8
    fa sol fa mi fa mi
    re4.-+ sol,4 r8

    %13
    r4 r8 do4.
    r4 r8 do4.
    r4 r8 sol'4 fa8

    %16
    mi sol mi do4.
    r4 r8 do4.
    r4 r8 sol4.

    %19
    r4 r8 sol'4 fa8
    mi sol fa mi4-+ re8\mbreak
    mi fa mi re-+ do re

    %22
    do4. r4 r8
    R2.*11
    r4 r8 r r sol

    %35
    do4 do8 do4 do8
    do4 mi8 sol fa mi
    re4 re8 sol4.

    %38
    mi-+ re4 re8
    mi4 mi8  mi re do
    re4 re8 re sol fa

    %41
    mi fa mi re4-+ do8
    sol'4. r4 r8
    r r do, do4.\mbreak

    %44
    r8 r do do4 sol'8
    fa sol fa mi fa mi
    re4. sol,4 r8

    %47
    r4 r8 do4.
    r4 r8 sol4.
    r8 r do sol'4 fa8

    %50
    mi sol fa mi4-+ re8
    mi fa mi re-+ do re
    do4. r4 r8

    %53
    R2.*9
    r4 r8 r r sol
    do4 do8 do4 do8

}

XcrIIn = %\transpose do re,
\relative do'' {
    \key do\major

    sol8
    do4 do8 do4 do8
    do4 r8 do,4.
    r4 r8 sol'4.

    %4
    do, sol'4 sol8
    do4 do8 do4 do,8
    sol'4 sol8 sol4 r8

    %7
    do,4. r8 r do'
    sol4. r4 r8
    r r do do4.\mbreak

    %10
    r8 r do do4 mi8
    re mi re do re do
    sol4. r4 r8

    %13
    r4 r8 do4.
    r4 r8 do4.
    r4 r8 sol4.

    %16
    do, do'
    r4 r8 do4.
    r4 r8 sol4.

    %19
    r4 r8 r r sol
    do4. r4 r8\mbreak
    r r do, sol'4 sol8

    %22
    mi4. r4 r8
    R2.*11
    r4 r8 r r sol

    %35
    do4 do8 do4 do8
    do4 r8  do,4.
    r4 r8 sol'4.

    %38
    do, sol'4 sol8
    do4 do8 do4 do,8
    sol'4 sol8 sol4.

    %41
    do, r8 r do'
    sol4. r4 r8
    r r do do4.\mbreak

    %44
    r8 r do do4 mi8
    re mi re do re do
    sol4. r4 r8

    %47
    r4 r8 do4.
    r4 r8 sol4.
    r4 r8 r r sol

    %50
    do4. r4 r8
    r r do sol4 sol8
    mi4. r4 r8

    %53
    R2.*9
    r4 r8 r r sol
    do4 do8 do4 do8

}

XvlaIn = \relative do'' {

    r8
    re4. la
    si re
    re dod-+

    %4
    re dod4 dod8
    re4 re8 re la si
    dod re dod dod re mi

    %7
    la,4 la8 la4 re8
    dod4.-+ r4 r8
    r r re re4.\mbreak

    %10
    r8 r re, re4 la'8
    dod4. re
    dod-+ re

    %13
    r4 r8 re,4.
    r4 r8 re4.
    r8 r re la'4 sol8

    %16
    fad4. re'
    r4 r8 re,4.
    r8 r re' mi4.

    %19
    la,4 si8 la4 dod8
    si4.~si4 mi8\mbreak
    la,4 si8 la4 sol8

    %22
    fad4. r4 r8
    R2.*5
    r4 r8 mi4.

    %29
    re mi
    re mi
    r8 r fad mi4 sold8\mbreak

    %32
    fad4.~fad4 si8
    mi,4 fad8 mi4 re8
    dod4. r4 r8

    %35
    re'4. la
    si re
    re dod-+

    %38
    re dod4 dod8
    re4 re8 re la si
    dod re dod dod re mi

    %41
    la,4 la8 la4 re8
    dod4.-+ r4 r8
    r r re re4.\mbreak

    %44
    r8 r re, re4 la'8
    dod4. re
    dod-+ re

    %47
    r4 r8 re,4.
    r8 r re' mi4.
    la,4 si8 la4 dod8

    %50
    si4.~si4 mi8
    la,4 si8 la4 sol8
    fad4. r4 r8

    %53
    R2.*4
    r4 re'8 re4 re8
    re4. re8 la si

    %59
    dod4 la8 si4 sold8
    la4. r4 r8
    la4. mi

    %62
    mi8 mi' re dod re mi
    la,4. re4 la8

}

XvlaIIn = \relative do'' {

    r8
    fad,4. mi
    re la4 la'8
    si4 si8 la4.

    %4
    la la4 r8
    r4 la8 la4.
    r4 la8 la4.

    %7
    r4 la8 la4 re,8
    mi4. r4 fad8
    sol4 si8 re4 sol,8\mbreak

    %10
    fad4. r4 re8
    la'4. la
    la la

    %13
    sol la
    sol la
    si la

    %16
    la  la
    sol la
    sol mi

    %19
    re4 re8 la'4 sol8
    fad4.-+~fad4 mi8\mbreak
    re sol fad mi-+ re mi

    %22
    re4. r4 r8
    R2.*5
    r4 r8 la'4.

    %29
    r4 r8 la,4.
    r4 r8 si4.
    la4 la8 mi'4 re8\mbreak

    %32
    dod fad mi re dod si
    la4 la8 mi'4 mi8
    mi4. r4 r8

    %35
    fad4. mi
    re la4 la'8
    si4 si8 la4.

    %38
    la la4 r8
    r4 la8 la4.
    r4 la8 la4.

    %41
    r4 la8 la4 re,8
    mi4. r4 fad8
    sol4 si8 re4 sol,8\mbreak

    %44
    fad4. r4 re8
    la'4. la
    la la

    %47
    sol la
    sol mi
    re4 re8 la'4 sol8

    %50
    fad la sol fad4-+ mi8
    fad sol fad mi-+ re mi
    re4. r4 r8

    %53
    R2.*4
    r4 re8 re4 sol8
    fad4. re4 fad8

    %59
    la4. mi
    mi r4 r8
    mi4. si

    %62
    la mi'8 la sol
    fad4. la

}

Xbcn = \relative do {

    r8
    re'4. dod
    si fad
    sol la

    %4
    re, la4 la'8
    re4 re8 re dod si
    la si la la si dod

    %7
    re mi re dod4-+ si8
    la4.~la4 re,8
    sol4 sol8 sol fad mi\mbreak

    %10
    fad4. r8 r fad'
    mi fad mi re mi re
    la4. fad

    %13
    sol fad
    sol fad
    sol la

    %16
    re fad,
    sol fad
    sol dod,

    %19
    re4 sol8 la4.
    si~si4 dod8\mbreak
    re4 sol,8 la4 la,8

    %22
    re4. r4 r8
    r4 r8 r r mi_\markup\italic"B[as]son"
    la dod mi dod la si

    %25
    dod4 re8 mi4 mi,8
    la4 la,8 mi'4 mi'8
    fad, mi re la' sold fad

    %28
    mi4. dod\tu
    re dod
    re sold,

    %31
    la4 re8 mi4.\mbreak
    fad~fad4 sold8
    la4 re,8 mi4 mi,8

    %34
    la4. r4 r8
    re'4. dod
    si fad

    %37
    sol la
    re, la4 la'8
    re4 re8 re dod si

    %40
    la si la la si dod
    re mi re dod4-+ si8
    la4.~la4 fad8

    %43
    sol si re sol, fad mi\mbreak
    fad4 la8 re4 fad8
    mi fad mi re mi re

    %46
    la4. fad
    sol fad
    sol dod,

    %49
    re4 sol8 la4.(
    si)~si4 dod8
    re4 sol,8 la4 la,8

    %52
    re4. r4 r8
    r4 r8 r r fad_\markup\italic"B[as]son"
    si re fad re si dod\mbreak

    %55
    re4 mi8 fad4 fad,8
    si4. si,4 r8
    r r sol'\tu si4 sol8

    %58
    re'4. fad8 mi re
    dod4. si4 mi,8
    la4. r4 r8

    %61
    la,4. sold
    la la'
    re dod

}

Xbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 6/8
    \tempo 2. = 60
    \partial 8 s8
    s2.
    \once \override Score.RehearsalMark.extra-offset = #'(0 . 0)
    \mark\markup\smaller\center-align {\musicglyph #"scripts.segno"}
    s2.*20
    s4.
    \bar "|."
    \mark\markup\huge "Fin"
    s
    s2.*41
    \bar "||"
    \mark\markup\smaller\center-column {"Al""segno"}

}

XvlI = {
    \Xglobal
    <<\XvlIn \forma>>
}

XvlaI = {
    \Xglobal
    <<\XvlaIn \forma>>
}

XvlaII = {
    \Xglobal
    <<\XvlaIIn \forma>>
}

XcrI = {
    \Xglobal
    <<\XcrIn \forma>>
}

XcrII = {
    \Xglobal
    <<\XcrIIn \forma>>
}

Xbc = {
    \Xglobal
    \clef bass
    <<\Xbcn \forma \Xbfn>>
}



XIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

XIhbIn = \relative do'' {

    fad4 mi-+
    si4. dod16(la) re4 mi
    \grace sol8 fad4-+ mi fad mi-+
    si4. dod16(la) re4 mi-+

    %4
    re2 la4 re
    mi mi8.(fad32 sol) sol4(fad8\prall) mi
    fad4 \grace mi8 re4 re fad

    %7
    mi sol fad sold-+
    la2 fad4 mi-+\mbreak
    si4. dod16(la) re4 mi

    %10
    \grace sol8 fad4-+ mi fad mi-+
    si4. dod16(la) re4 mi-+
    re2 fa4 la

    %13
    mi sol fa8(mi) re-+(dod)
    re4 mi-+ fa la
    mi sol fa8(mi) re-+(dod8)

    %16
    re2 do?4 fa
    la \grace sol8 fa4 do fa\mbreak
    mi-+ \grace re8 do4 sol' sib

    %19
    la-+ \grace sol8 fa4 sol mi-+
    fa2 fa4 la
    mi sol fa8(mi) re-+(dod)

    %22
    re4 mi-+ fa la
    mi sol fa8 mi re-+ dod
    re2

}

XIvlIn = \relative do'' {

    r2
    r la4\p dod-+
    re dod la la'
    re,4. mi16(dod) la4 dod-+

    %4
    re2 re~
    re dod-+
    re la4 re

    %7
    dod mi la, re
    dod2-+ la4 la'\mbreak
    re,4. mi16(dod) la4 dod-+

    %10
    re dod la la'
    re,4. mi16(dod) la4 dod-+
    re2 la4 fa

    %13
    sib2 la8(sol) fa-+(mi)
    fa4 sol-+ la fa
    sib2 la8(sol) fa-+(mi)

    %16
    fa2 <fa la,>4 <la do,>
    <do fa,>2 fa,4 la\mbreak
    sol \appoggiatura fa8 mi4 do'2

    %19
    do4 la mi sib'
    la2-+ la4 fa
    sib2 la8(sol) fa-+(mi)

    %22
    fa4 sol-+ la fa
    sib2 la8(sol) fa-+(mi)
    fa2

}

XIvlIIn = \relative do'' {

    re,4\p dod
    sol'2 fad4 la
    re, la re dod
    sol'2 fad4 la

    %4
    re,2 fad4 re
    la'2 la,
    re fad4 re

    %7
    la' dod, re mi
    <mi la,>2 re4 dod\mbreak
    sol'2 fad4 la

    %10
    re, la re dod
    sol'2 fad4 la
    la2 la4 fa

    %13
    sib2 la8(sol) fa(mi-+)
    fa4 sol-+ la fa
    sib2 la8(sol) fa-+(mi)

    %16
    fa2 <fa la,>4 <la do,>
    <do fa,>2 fa,4 la\mbreak
    sol \appoggiatura fa8 mi4 do'2

    %19
    do4 la mi sib'
    la2-+ la4 fa
    sib2 la8(sol) fa-+(mi)

    %22
    fa4 sol-+ la fa
    sib2 la8(sol) fa-+(mi)
    fa2

}
XIfgIn = \relative do {

    re2
    re1
    re
    re

    %4
    re2 r
    re1
    re

    %7
    re2 re4 si
    la2 re\mbreak
    re1

    %10
    re
    re
    re2  re'

    %13
    sol, la
    re, re'
    sol, la

    %16
    re,2 r
    r la'4 fa\mbreak
    do'2 mi4 do

    %19
    fa fa, do' do,
    fa2 re'
    sol, la

    %22
    re, re'
    sol, la
    re,2

}

XIbcn = \relative do {

    re2
    re1
    re
    re

    %4
    re2 r
    re1
    re

    %7
    re2 re4 si
    la2 re\mbreak
    re1

    %10
    re
    re
    re2  re

    %13
    re1
    re
    re

    %16
    re2 fa
    fa1\mbreak
    do1

    %19
    do
    fa,2 re'
    re1

    %22
    re
    re
    re2

}

XIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \key re\major
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 45
    \partial 2 s2
    s1*3
    s2
    \bar "|."
    \mark\markup\huge "Fin"
    s
    s1*7
    s2
    \key re\minor
    \mark\markup\huge "Mineur"
    s
    s1*11
    \set Score.measureLength = #(ly:make-moment 2 4) s2 \key re\major
    \bar "||"
    \mark\markup\smaller\center-column {"Da""Capo"}

}

XIvlI = {
    \XIglobal
    <<\XIvlIn \forma>>
}


XIvlII = {
    \XIglobal
    <<\XIvlIIn \forma>>
}

XIhbI = {
    \XIglobal
    <<\XIhbIn \forma>>
}

XIfgI = {
    \XIglobal
    \clef bass
    <<\XIfgIn \forma>>
}

XIbc = {
    \XIglobal
    \clef bass
    <<\XIbcn \forma \XIbfn>>
}



XIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

XIIhbIn = \relative do'' {

    la'4
    la2(sol4-+) fad
    \grace fad8 mi2.-+ fad4
    sol2 mi-+

    %4
    fad4-+ mi8 fad re4 la'
    la2 r4 la
    la2 r4 la

    %7
    sol2 fad\prall
    mi-+ r4 la\mbreak
    la2(sol4-+) fad

    %10
    \grace fad8 mi2.-+ fad4
    sol2 mi\prall
    fad4 mi8 fad re4 la'

    %13
    la2 r4 la
    la2 r4 la
    sol2 mi-+

    %16
    re fad4_\markup\italic "1.er couplet" (la)
    sol(si) mi,(sol)\mbreak
    fad-+ \grace mi8 re4 r2

    %19
    R1
    r2 fad4(la)
    sol(si) mi,(sol)

    %22
    fad-+ \grace mi8 re4 r2
    R1
    r2 sol

    %25
    sol4-+(fad) la2\mbreak
    la4-+(sold) si2
    la4 dod si la

    %28
    sold2.-+ mi'4
    mi2 r4 mi
    mi2 r4 dod8 la

    %31
    si2 sold-+
    la r4 la\mbreak r4_\markup\italic "2.e couplet" si
    r lad r si

    %34
    r fad r sol
    r fad r mi
    fad2 fad8(sold) lad(si)

    %37
    dod2.(si8-+) lad
    si2 fad8(sold) lad(si)
    dod2.(si8-+) lad

    %40
    si2 si\mbreak
    si lad-+
    si r

    %43
    r r4 sold
    la(si) la r
    r2 r4 fad

    %46
    sol?(la) sol re
    dod-+ re sol fad
    mi2.-+ la4

}

XIIvlIn = \relative do'' {

    la4\p
    la2(sol4-+) fad
    \appoggiatura fad8 mi2.-+ fad4
    sol2 mi-+

    %4
    fad4-+ mi8 fad re4 la'
    fad-+ mi8(re) dod(mi) la,(sol')
    fad4-+ mi8(re) dod(mi) re(fad)

    %7
    <sol la,>2 <fad la,>\prall
    <mi la,>-+ r4 la\mbreak
    la2(sol4-+) fad

    %10
    \appoggiatura fad8 mi2.-+ fad4
    sol2 mi-+
    fad4-+ mi8 fad re4 la'

    %13
    fad-+ mi8(re) dod(mi) la,(sol')
    fad4-+ mi8(re) dod(mi) re(fad)
    sol2 mi-+

    %16
    re la'8(re,) fad(re)
    si'(re,) sol(re) dod'(re,) la'(re,)\mbreak
    re'(re,) fad(re) la''(sol fad) la,

    %19
    sol'(fad mi) la, fad'(mi) re(fad)
    mi4-+ la, la8(re,) fad(re)
    si'(re,) sol(re) dod'(re,) la'(re,)\mbreak

    %22
    re'(re,) fad(re) fad'(sol la) la,
    mi' fad sol la, fad'4 la8(sold)
    la2 la,8(dod mi la)

    %25
    la(la,) re(re,) si' re fad si\mbreak
    si(si,) mi(mi,) sold(si) re(mi,)
    dod'(mi,) mi'(mi,) re'(mi,) dod'(mi,)

    %28
    si'2.-+ mi4
    dod-+ si8(la) sold(si) mi,(re')
    dod4-+ si8(la) sold(si) la(dod)

    %31
    re2 si-+
    la r4 la fad' sol8(fad)
    fad(mi) fad,(mi') mi(re) fad,(re')

    %34
    re(dod) fad,(dod') re4 mi8(re)
    re(dod) la'(dod,) dod(si) sol'(si,)
    lad2-+ lad8(si) dod(re)

    %37
    mi4 sol fad8 mi re-+ dod
    fad4 fad,8(sold) lad(si) dod(re)
    mi4 sol? fad8(mi) re-+ dod

    %40
    fad2 si,8(fad) re(re')\mbreak
    dod8(sol) mi(mi') dod2-+
    si r4 si

    %43
    re8(dod) si(la?) sold(si) mi,(re')
    \grace re dod2.-+ la4
    do8(si) la(sol?) fad(la) re,(do')

    %46
    \appoggiatura do?8 si2.-+ la4
    sol8(la) fad(sol) mi(fad) re(mi)
    dod?(re) si(dod) la4 la'

}

XIIfgIn = \relative do {

    fad'4
    fad2 mi4-+ re
    \appoggiatura re8 dod2.-+ re4
    mi2 dod-+

    %4
    re r
    r4 la la2
    r4 la la fad'8(re)

    %7
    mi2 re\prall
    dod-+ r4 fad\mbreak
    fad2 mi4-+ re

    %10
    \appoggiatura re8 dod2.-+ re4
    mi2 dod-+
    re r

    %13
    r4 la la2
    r4 la la fad'8 re
    mi2 dod-+

    %16
    re r
    R1\mbreak
    r2 fad8 mi re4

    %19
    mi8 re dod4 re re,
    la'2 r
    R1

    %22
    r2 re8 mi fad4
    dod8 re mi4 re dod8 si
    la2 mi'

    %25
    mi4-+(re) fad2\mbreak
    fad4-+(mi) re sold,
    la2 mi'4 la,

    %28
    mi mi' mi2
    r4 mi mi2
    r4 mi mi2

    %31
    fad mi
    dod-+ r4 fad\mbreak r2
    R1*3

    %36
    r4 fad mi8(re) dod(si)
    lad2.-+ si8 dod
    re4 fad mi8(re) dod(si)

    %39
    lad2.-+ si8 dod
    re2 fad\mbreak
    sol fad

    %42
    re r
    r r4 mi
    mi2 r

    %45
    r r4re
    re2. re,4
    la'2 la

    %48
    la r4 la'

}

XIIbcn = \relative do {

    re4
    re2 dod4 re
    la'2. re,4
    sol,2 la

    %4
    re, r
    re'4 dod8 si la4 dod
    re dod8 si la4 re

    %7
    dod2 re
    la' r4 re,\mbreak
    re2 dod4 re

    %10
    sol,2. fad4
    mi2 la
    re, r

    %13
    re'4 dod8 si la4 dod
    re dod8 si la4 re
    sol,2 la

    %16
    re, r
    R1*7
    r2 r4 la'

    %25
    re2 r4 si\mbreak
    mi2 r4 mi
    la2 sold4 la

    %28
    mi2 r
    la4 sold8 fad mi4 sold
    la sold8 fad mi4 la

    %31
    re,2 mi
    la, r4 re\mbreak re' r
    dod r si r

    %34
    lad r si r
    la! r sol r
    fad2. mi8(fad)

    %37
    sol2. fad8 mi
    re2. mi8 fad
    sol2. fad8 mi

    %40
    re2 re,\mbreak
    mi fad
    si r

    %43
    r r4 mi
    la(sold) la r
    r2 r4 re,

    %46
    sol(fad) sol(fad)
    mi-+(re) dod(re)
    la'2 r4 re,

}

XIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {


    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \key re\major
    \tempo 1 = 50
    \partial 4 s4\once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    \mark\markup\smaller\center-align {\musicglyph #"scripts.segno"}
    s1*15
    s2\bar "|."%\break
    \mark\markup \huge {Fin}
    s
    s1*16
    \bar "||"%\break
    \mark\markup \smaller\center-column {"Le""Rondeau"}
    \partial 2 s2
    \set Score.currentBarNumber = #33
    s1*16
    \bar "||"
    \mark\markup \smaller\center-column {"Le""Rondeau"}

}

XIIvlI = {
    \XIIglobal
    <<\XIIvlIn \forma>>
}


XIIhbI = {
    \XIIglobal
    <<\XIIhbIn \forma>>
}


XIIfgI = {
    \XIIglobal
    \clef tenor
    <<\XIIfgIn \forma>>
}

XIIbc = {
    \XIIglobal
    \clef bass
    <<\XIIbcn \forma \XIIbfn>>
}



XIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

XIIIvlIn = \relative do'' {

    fad4 fad,8 fad fad fad
    fad4-+ mi8 re mi fad
    sol4 sol'8 sol sol sol

    %4
    sol4-+ fad8 mi fad sol
    la4 la,8 la la la
    si dod re si mi fad

    %7
    dod re re4.-+(dod16 re)
    mi8 re dod si la4
    si mi, sold

    %10
    la8 dod si re dod re\mbreak
    mi4 mi, sold-+
    la2. la

    %13
    la'4 dod,8 dod dod dod
    dod4-+ si8 la si dod
    si4 sol'8 sol sol sol

    %16
    sol4 fad8-+ mi fad4
    si re2
    fad,8-+ mi re mi fad sol

    %19
    la4 sol\prall fad\mbreak
    mi4-+ la,8\p la la la
    si4 si8 si si si

    %22
    dod4 re8 dod si la
    re4 sol2\f
    fad8 sol fad mi re4

    %25
    mi la, dod-+
    re8 fad mi sol fad sol
    la4 la, dod-+

    %28
    re2. re

}

XIIIvlaIn = \relative do'' {

    re4 re,8 re re re
    re4 dod8 si dod re
    mi4 mi'8 mi mi mi

    %4
    mi4-+ re8 dod re mi
    fad4 fad,8 fad fad fad
    fad4 re sol

    %7
    sol mi la
    la2 mi4
    fad mi re

    %10
    dod mi2\mbreak
    la4 sold8 fad mi[re]
    dod4 la la' dod,2.

    %13
    mi4 la8 la la la
    la4 sol8 fad sol la
    sol4 si8 si si si

    %16
    si2 si8 dod
    re4 si2
    la re8 dod

    %19
    re4 dod re\mbreak
    dod-+ mi,8\p mi mi mi
    mi4 sold8 sold sold sold

    %22
    la4 la2
    la4 mi8\f mi mi mi
    fad4. sol8 la4

    %25
    si la sol
    fad la2
    re4 dod8 si la sol

    %28
    fad2. fad

}

XIIIvlaIIn = \relative do'' {

    la,4 la8 la la la
    la2 r4
    r dod8 dod dod dod

    %4
    re4 r r
    r re8 re re re
    re dod si4 mi

    %7
    mi fad2
    dod4 mi, la
    la sold si

    %10
    la8 dod si re dod re\mbreak
    mi4 si8 re dod si
    la2. la

    %13
    dod4 mi8 mi mi mi
    mi4 r r
    r mi8 mi mi mi

    %16
    mi4 re8 dod re4
    re2 sol4
    fad2 la4

    %19
    la, la' la\mbreak
    la2 dod,4\p
    si mi8 mi mi mi

    %22
    mi4 mi2
    fad4 la8\f la la la
    la,2 re4

    %25
    re  dod mi
    re la2
    la'4 mi8 sol fad mi

    %28
    re2. re

}

XIIIcrIn = %\transpose do re,
\relative do'' {
    \key do\major

    mi4 mi8 mi mi mi
    mi4-+ si8 la si do
    fa4 fa8 fa fa fa

    %4
    fa4 mi8 re mi fa
    sol4 sol8 sol sol sol
    sol4 r r

    %7
    r sol2
    sol4 r r
    r re2

    %10
    sol, r4\mbreak
    r re'2
    mi,2. mi

    %13
    R2.*4
    do'4 do8 do do do
    do2 mi8 fa

    %19
    sol4 fa mi\mbreak
    re4-+ sol, r
    R2.

    %22
    r4 re'8 re re re
    sol,4 r r
    r do2

    %25
    do4 sol2
    mi4 do r
    r sol'2

    %28
    mi2. mi

}

XIIIcrIIn = %\transpose do re,
\relative do'' {
    \key do\major

    do4 do8 do do do
    do4 sol r
    r sol8 sol sol sol

    %4
    do,4 r r
    r do'8 do do do
    do4 r r

    %7
    r do2
    sol4  r r
    r re'2

    %10
    sol, r4\mbreak
    r re'2
    sol,2. sol

    %13
    R2.*4
    do4 do8 do do do
    do4 do, r

    %19
    do' sol do,\mbreak
    sol' r r
    R2.

    %22
    r4 re'8 re re re
    sol,4 r r
    r do2

    %25
    do4 sol2
    mi4 do r
    r sol'2

    %28
    do,2. do

}

XIIItpn = \relative do'' {

    fad4 fad8 fad fad fad
    fad4-+ mi r
    r sol8 sol sol sol

    %4
    sol4-+ fad8 mi fad sol
    la4 re,8 re re re
    re4 r r

    %7
    mi fad2
    mi-+ r4
    R2.*3

    %12
    R2. R
    R2.*5
    la,4 re fad

    %19
    la sol fad\mbreak
    mi4-+ la, r
    R2.*2

    %23
    la'4 sol2
    fad8 sol fad mi re4
    mi la2

    %26
    fad4.-+ mi8 re4
    r mi la,
    re2.-+ re

}

XIIItmpn = \relative do {

    re4 re8 re re re
    re4 la r
    r la8 la la la

    %4
    re4 r r
    r re8 re re re
    re4 r r

    %7
    r re2
    la4 r r
    R2.*3

    %12
    R2. R
    R2.*4
    re4 re8 re re re

    %18
    re4 r r
    re la re\mbreak
    la r r

    %21
    R2.
    r4 la8 la la la
    re4 r r

    %24
    R2.*3
    r4 la la
    re2. re

}

XIIIbcn = \relative do {

    re4 re,8 re re re
    la'4 r r
    r la8 la la la

    %4
    re4 r r
    r fad8 fad fad fad
    sol2 mi4

    %7
    la re,2
    la4. si8 dod4
    re mi2

    %10
    fad4 sold la8 si\mbreak
    dod re mi4 mi,
    la8 si la sol fad mi la4 mi8 re dod si

    %13
    la4 la8 la la la
    mi'4 r r
    r mi,8 mi mi mi

    %16
    si'2.
    sol8 fad sol la si dod
    re2 r4

    %19
    fad mi re\mbreak
    la' dod,\p la
    sold mi8 mi mi mi

    %22
    sol!4 sol'2
    fad4 dod8\f si dod la
    re4. mi8  fad4

    %25
    sol la la,
    si dod re8 mi
    fad sol la4 la,

    %28
    re re,8 mi fad sol re'2.

}

XIIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 50
    \repeat volta 2{s2.*11}
    \alternative {{s2.}{s}}
    \set Score.currentBarNumber = #13
    \repeat volta 2{s2.*15}
    \alternative {{s2.}{s}}
    \bar "|."

}

XIIIvlI = {
    \XIIIglobal
    <<\XIIIvlIn \forma>>
}


XIIIvlaI = {
    \XIIIglobal
    <<\XIIIvlaIn \forma>>
}

XIIIvlaII = {
    \XIIIglobal
    <<\XIIIvlaIIn \forma>>
}

XIIIcrI = {
    \XIIIglobal
    <<\XIIIcrIn \forma>>
}

XIIIcrII = {
    \XIIIglobal
    <<\XIIIcrIIn \forma>>
}

XIIItp = {
    \XIIIglobal
    <<\XIIItpn \forma>>
}

XIIItmp = {
    \XIIIglobal
    \clef bass
    <<\XIIItmpn \forma>>
}

XIIIbc = {
    \XIIIglobal
    \clef bass
    <<\XIIIbcn \forma \XIIIbfn>>
}



XIVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

XIVvlIn = \relative do'' {

    fad,4_\markup\italic {\dynamic p 1.er Viol[on] } fad8 fad fad fad
    sol4 sol8 sol sol sol
    fad4-+ fad \appoggiatura mi8 re4

    %4
    mi2-+ mi4
    fad fad8 fad fad fad
    sol4 sol8 sol sol sol

    %7
    fad4-+ fad \appoggiatura mi8 re4
    mi2.-+
    fad'4\f\tu fad8 fad fad fad

    %10
    sol4 sol8 sol sol sol
    fad4-+ fad \grace mi8 re4\mbreak
    mi2-+ mi4

    %13
    fad fad8 fad fad fad
    sol4 sol8 sol sol sol
    fad4-+ fad \grace mi8 re4

    %16
    mi2.-+
    mi4 mi8 mi mi mi
    dod4-+ \appoggiatura si8 la4 mi'8 mi

    %19
    dod4-+ la mi'8 mi
    mi2.-+
    la8 la mi mi dod dod

    %22
    la la mi mi mi'4
    dod-+ re8 dod si dod
    la2.\mbreak

    %25
    mi4\p mi8 mi mi fad
    mi4 mi8 mi mi fad
    sol4 sol fad

    %28
    mi2-+ mi4
    re8\f re fad fad la la
    re re fad fad la la

    %31
    la,4 re dod-+
    \footnote #' (-1 . 3) \markup\column\smaller {""  "On reprend le Premier""  "}re2.

}

XIVhbIn = \relative do'' {

    la2.\p~
    la~
    la~

    %4
    la~
    la~
    la~

    %7
    la~
    la
    fad'4\f fad8 fad fad fad

    %10
    sol4 sol8 sol sol sol
    fad4-+ fad \grace mi8 re4\mbreak
    mi2-+ mi4

    %13
    fad fad8 fad fad fad
    sol4 sol8 sol sol sol
    fad4-+ fad \grace mi8 re4

    %16
    mi2.-+
    mi4 mi8 mi mi mi
    dod4-+ \appoggiatura si8 la4 mi'8 mi

    %19
    dod4-+ la mi'8 mi
    mi2.-+
    la8 la mi mi dod dod

    %22
    la la mi mi mi'4
    dod-+ re8 dod si dod
    la2.\mbreak

    %25
    la\p~
    la~
    la~

    %28
    la
    re,8\f re fad fad la la
    re re fad fad la la

    %31
    la,4 re dod-+
    re2.

}

XIVvlaIn = \relative do'' {

    re,4\p re8 re re re
    mi4 mi8 mi mi mi
    la,4 la re

    %4
    dod2-+ dod4
    re re8 re re re
    mi4 mi8 mi mi mi

    %7
    la,4 la re
    dod2.-+
    re'4\f re8 re re re

    %10
    mi4 mi8 mi mi mi
    la,4 la re\mbreak
    dod2-+ dod4

    %13
    re re8 re re re
    mi4 mi8 mi mi mi
    la,4 la re

    %16
    dod2.-+
    dod4 dod8 dod si si
    la2 si4

    %19
    la2 sold4
    la8 la mi mi dod dod
    la2 r4

    %22
    r si' sold
    la la sold-+
    la2.\mbreak

    %25
    dod,4\p dod8 dod dod re
    dod4 dod8 dod dod re
    mi4 mi re

    %28
    dod la'8\f la mi mi
    la,4 re8 re fad fad
    la2 r4

    %31
    r la sol
    fad2.-+

}

XIVvlaIIn = \relative do'' {

    re,4\p re8 re re re
    la2 la4
    la la la

    %4
    la2 la'8 sol
    fad4 re8 re re re
    la2 la4

    %7
    la la la
    la2.-+
    re'4 re8 re re re

    %10
    la4 la8 la la la
    la4 la la\mbreak
    la8 mi la si la sol

    %13
    fad4 re8 re re re
    la'4 la8 la la la
    la4 la la

    %16
    la2.
    la4 mi8 mi mi mi
    mi2 mi8 mi

    %19
    mi4 mi re
    dod la8 la dod dod
    mi2 mi4

    %22
    mi re8 dod si4
    la si re
    dod2.-+\mbreak

    %25
    dod4\p dod8 dod dod re
    dod4 dod8 dod dod re
    mi4 mi re

    %28
    dod2 dod4
    re\f la8 la re re
    fad2 r4

    %31
    r fad mi-+
    re2.

}

XIVtpn = \relative do'' {

    R2.*8
    fad4 fad8 fad fad fad
    sol4 sol8 sol sol sol

    %11
    fad4 fad re-+\mbreak
    mi2-+ la,4
    fad' fad8 fad fad fad

    %14
    sol4 sol8 sol sol sol
    fad4 fad re-+
    mi2.-+
    R2.*3

    %20
    r4 la mi
    la2 r4
    R2.*3\mbreak

    %25
    la2.~
    la~
    la

    %28
    r4 la mi
    fad la fad
    re la r

    %31
    r  fad' mi-+
    re2.

}

XIVtmpn = \relative do {

    R2.*8
    re4 re8 re re re
    la4 la8 la la la

    %11
    re4 re re\mbreak
    la2 la4
    re re8 re re re

    %14
    la4 la8 la la la
    re4 re re
    la2.

    %17
    R2.*3
    r4 la la
    la2 r4

    %22
    R2.*2
    r4 la8 la la la\mbreak
    la4 r r

    %26
    la r r
    la r r
    r la8 la la la

    %29
    re re re re re re
    re4 re8 re re re
    re4 re la

    %32
    re2.

}

XIVfgIn = \relative do {

    R2.*8
    re'4 re8 re re re

    %10
    dod4 dod8 dod dod dod
    re4 re re,\mbreak
    la'2 la,4

    %13
    re re8 re re re
    dod4 dod8 dod dod dod
    re4 re re,

    %16
    la'2.
    la4 dod8 dod mi mi
    la2 sold4

    %19
    la2 mi4
    la8 la dod dod mi mi
    dod dod la la mi mi

    %22
    fad4 sold mi
    la re, mi
    la,2.\mbreak

    %25
    dod'4\p dod8 dod dod re
    dod4 dod8 dod dod re
    mi4 mi re

    %28
    dod8 si la\f si la sol
    fad fad re re la la
    fad fad re re' fad sol

    %31
    fad sol la4 la,
    re2.

}

XIVbcn = \relative do {

    re4 re8 re re re
    dod4 dod8 dod dod dod
    re4 re re

    %4
    la2 la4
    re re8 re re re
    dod4 dod8 dod dod dod

    %7
    re4 re re
    la2.
    re'4 re8 re re re

    %10
    dod4 dod8 dod dod dod
    re4 re re,\mbreak
    la'2 la,4

    %13
    re re8 re re re
    dod4 dod8 dod dod dod
    re4 re re,

    %16
    la'2.
    la4 dod8 dod mi mi
    la2 sold4

    %19
    la2 mi4
    la8 la dod dod mi mi
    dod dod la la mi mi

    %22
    fad4 sold mi
    la re, mi
    la,2.\mbreak

    %25
    la'4\p la8 la la re,
    la'4 la8 la la re,
    dod4 dod re

    %28
    la la'8\f si la sol
    fad fad re re la la
    fad fad re re' fad sol

    %31
    fad sol la4 la,
    re2.

}

XIVbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 50
    \repeat volta 2{s2.*16}
    \repeat volta 2{s2.*16}

}

XIVvlI = {
    \XIVglobal
    <<\XIVvlIn \forma>>
}

XIVhbI = {
    \XIVglobal
    <<\XIVhbIn \forma>>
}


XIVvlaI = {
    \XIVglobal
    <<\XIVvlaIn \forma>>
}

XIVvlaII = {
    \XIVglobal
    <<\XIVvlaIIn \forma>>
}

XIVtp = {
    \XIVglobal
    <<\XIVtpn \forma>>
}

XIVtmp = {
    \XIVglobal
    \clef bass
    <<\XIVtmpn \forma>>
}

XIVfgI = {
    \XIVglobal
    \clef bass
    <<\XIVfgIn \forma>>
}

XIVbc = {
    \XIVglobal
    \clef bass
    <<\XIVbcn \forma \XIVbfn>>
}



XVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

XVvlIn = \relative do'' {

    r4 re4. re8
    la'4 la la
    la sol8-+ fad sol4

    %4
    sol \grace fad8 mi4 la
    fad-+ re4. re8
    la'4 la la

    %7
    la sol8-+ fad sol4
    sol \grace fad8 mi4 la
    fad-+ fad8 sol la4

    %10
    re, sol fad
    mi\prall dod-+ re~\mbreak
    re8(mi) mi4.-+(re16 mi)

    %13
    fad8 mi fad sol la4
    re, sol fad
    mi\prall dod-+ re4~

    %16
    re8 mi mi4.-+ re8
    re4 fad,8 sol la si
    mi,4.-+ la8 si dod

    %19
    re dod re mi fad-+ sol
    la2 la4
    r la,8 sol la si

    %22
    mi,4.-+ la8 si dod
    re dod re mi fad-+ sol\mbreak
    la2 la4

    %25
    r la,4. la8
    si4 la8 sol fad-+ sol
    la4 sol8 fad mi fad

    %28
    sol4 mi4.\prall la8
    fad4-+ la4. la8
    si4 la8 sol fad-+ sol

    %31
    la4  mi-+ fad~
    fad8 sol mi4.-+ re8
    re4 la' re

    %34
    dod-+ re mi
    fad sol la
    sol fad2\prall\mbreak

    %37
    mi4-+ la, re
    dod-+ re mi
    fad sol la

    %40
    sol fad2\prall
    mi4.-+ mi8 la4
    fad-+ re la

    %43
    si8 dod dod4.-+(si16 dod)
    re4. dod8 re4
    mi fad re-+

    %46
    mi4. mi8 la4
    fad-+ re la
    si8 dod dod4.-+(si16 dod)

    %49
    re4. mi8 fad4~\mbreak
    fad8 sol mi4.-+ re8
    re4 la8 la si dod

    %52
    re4 si8 si dod re
    mi4 \grace re8 dod4 fad
    \grace mi8 re4 si4.\prall mi8

    %55
    dod2-+ \appoggiatura si8 la4
    r fad'\p fad
    fad mi8-+ re mi fad

    %58
    sol4 fad8-+ mi fad sol
    la4 re, sol
    fad8\prall mi mi4.-+ re8

    %61
    re4 la8\f la si dod\mbreak
    re4 si8 si dod re
    mi4 \grace re8 dod4 fad

    %64
    \grace mi8 re4 si4.\prall mi8
    dod2-+ \appoggiatura si8 la4
    r fad'\p fad

    %67
    fad mi8-+ re mi fad
    sol4 fad8-+ mi fad sol
    la4 re, sol

    %70
    fad8\prall mi mi4.-+ re8
    re\f la re la re16 mi fad sol
    la8 sol16 fad mi8 la mi fad-+\mbreak

    %73
    sol8 fad16 mi re8 mi fad \afterGrace sol-+({fad16[sol)]}
    la8 sol16 fad mi8 re mi dod-+
    re la re la re16 mi fad sol

    %76
    la8 sol16 fad mi8 la mi fad-+
    sol8 fad16 mi re8 mi fad \afterGrace sol-+({fad16[sol)]}
    la8 sol16 fad mi8 re mi dod-+

    %79
    re4. fad8\p mi sol
    fad(sol-+) la re, re dod
    si re-! re-! re-! mi-! fad-!-+\mbreak

    %82
    sol(la) si(mi,) mi(re)
    dod4-+ la' la
    la2.~

    %85
    la8(sol-+) la mi fad dod
    re sol fad4.-+ mi8
    fad4 re8(fad) mi(sol)

    %88
    fad(sol-+) la-! re,-! re(dod-+)
    si re-! re-! re-! mi-! fad-!-+
    sol(la-+) si-! mi,-! mi(re-+)

    %91
    dod4 la' la
    la2.~
    la8 [sol la mi fad8. re16]

    %94
    sol8 fad16\prall mi mi4.-+ re8\mbreak
    re4 re4.\f re8
    mi4 mi4.-+(re16 mi)

    %97
    fad4 re8 mi fad sol
    la4. si8 la[si]
    la4 re,4. re8

    %100
    mi4 mi4.-+(re16 mi)
    fad4 re8 mi fad sol
    la4. si8 la[si]

    %103
    la4 fad8 sol la4
    re, la re-+
    mi la, la'

    %106
    fad8-+ mi16 fad sol8 fad mi re\mbreak
    mi2 la,4
    r fad'8 sol la4

    %109
    re, la re-+
    mi la, la'
    fad8-+ mi16 fad sol8 fad mi re

    %112
    mi2-+ mi4
    r la la
    mi sol2

    %115
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %118
    mi mi4.-+ re8\mbreak
    re4 la' la
    mi sol2

    %121
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %124
    mi mi4.-+ re8
    re4 \clef violin fa!2\p~
    fa4 mi8 re do sib

    %127
    la4 la'2~
    la4 sol8 fa mi re
    dod re mi fa sol mi\mbreak

    %130
    fa mi re do? sib la
    sol4 sol'2~
    sol4 fa8 mi re do

    %133
    sib4 sib'8 la sol fa
    mi re dod4.-+ re8
    re4. r16 la\f [fa8. re16]

    %136
    sib'4 sib8. la16 sib4
    <mi, do>4. r16 sol [mi8. do16]
    la'4 la8. sol16 la4

    %139
    <re, sib>4. r16 fa[re8. sib16]
    sol'4 sol sol\mbreak
    sol la8 sol fa-+ mi

    %142
    fa4 la\p si?
    \grace si8 do2 la4-+
    \appoggiatura la8 sib2.

    %145
    la4 re \grace do8 si?4
    mi dod-+ re~
    re8 mi dod4.-+ re8

    %148
    re4. r16 la\f[fa8. re16]
    sib'4 sib8. la16 sib4
    <mi, do>4. r16 sol [mi8. do16]

    %151
    la'4 la8. sol16 la4
    <re, sib>4. r16 fa[re8. sib16]
    sol'4 sol sol\mbreak

    %154
    sol la8 sol fa-+ mi
    fa4 la\p si?
    \grace si8 do2 la4-+

    %157
    \appoggiatura la8 sib2.
    la4 re \grace do8 si?4
    mi dod-+ re~

    %160
    re8 mi mi4. re8
    re4 la' sib
    la sol-+ fad

    %163
    \grace fad? sol2.~
    sol4 fa?-+ mi\mbreak
    fa2.

    %166
    mi4 re-+ dod
    re mi fa
    mi4.\prall fa8 \grace mi re4

    %169
    dod-+ la' sib
    la sol-+ fad
    sol2.~

    %172
    sol4 fa?-+ mi
    fa2.
    mi4 re-+ dod

    %175
    re mi fa
    mi4.\mordent fa8 \grace mi re4
    dod-+ la si~\mbreak

    %178
    si dod re~
    re mi fa
    sol fa-+ mi

    %181
    fa la, si~
    si dod re~
    re mi fa

    %184
    sol8 la mi4.-+ re8
    re4fa8.\f re16 la8. fa16
    do'4 sol4. sib8

    %187
    la4-+ sol8. sib?16 la8. sol16
    fa8.-+ mi16 \appoggiatura mi8 fa4. sol8
    mi4-+ do'8.[re16 mi8. fa16]\mbreak

    %190
    sol4 la fa-+
    sol do, re8. do16
    sib8.\prall la16 sol4.-+ fa8

    %193
    fa4 do'\p fa~
    fa mi8-+ re mi fa
    re4-+ re sol~

    %196
    sol fa8-+ mi fa sol
    mi4-+ mi la
    sold8(la) la4.-+(sold16 la)

    %199
    si4 mi,2~
    mi4 re8 do re si\mbreak
    do4 mi la~

    %202
    la8 si sold4.-+ la8
    la4 la sol?-+
    fa8 la sol fa mi re

    %205
    dod(re16 dod) dod4.-+(si16 dod)
    re8(do?) sib(la) sol(fa)
    mi2-+ r4

    %208
    r4 la\p la
    \appoggiatura la8 sib2.
    la4 sol2-+

    %211
    \appoggiatura sol8 la2.
    r4 fa fa\mbreak
    \appoggiatura fa8 sol2.

    %214
    fa4 mi4.-+(re16 mi)
    fa4 mi-+ re
    la'8 sib? dod re mi fa

    %217
    sol2.~
    sol4. la8 fa4\prall~
    fa8 mi mi4.-+ re8

    %220
    re4 la la-+
    \appoggiatura la8 sib2.
    la4 sol2-+

    %223
    \appoggiatura sol8 la2.\mbreak
    r4 fa fa
    \appoggiatura fa8 sol2.

    %226
    fa4 mi4.-+(re16 mi)
    fa4 mi-+ re
    la'8 si? dod re mi fa

    %229
    sol2.~
    sol4. la8 fa4\prall~
    fa8 mi mi4.-+ re8

    %232
    re4 la4.\f la8
    re4 re4. re8
    re4 dod-+ re8 mi

    %235
    fa4 fa mi8-+ re\mbreak
    sol4 sol4. sol8
    sol4 fa8-+ mi la4~

    %238
    la sol8\prall fa mi re
    dod4.-+ si8 la4
    r la4. la8

    %241
    re4 re4. re8
    re4 dod-+ re8 mi
    fa4 fa mi8-+ re

    %244
    sol4 sol4. sol8
    sol4 fa8-+ mi la4~
    la sol8 fa mi re

    %247
    dod4.-+ si8 la4
    r4 re4. re8  %% OOKK Maieur
    mi4 mi4.-+(re16 mi)

    %250
    fad4 re8 mi fad sol
    la4. si8 la[si]
    la4 re,4. re8

    %253
    mi4 mi4.-+(re16 mi)
    fad4 re8 mi fad sol
    la4. si8 la[si]

    %256
    la4 fad8 sol la4
    re, la re-+
    mi la, la'

    %259
    fad8-+ mi16 fad sol8 fad mi re\mbreak %%% Fine p. 35
    mi2-+ la,4
    r fad'8 sol la4

    %262
    re, la re-+
    mi la, la'
    fad8-+ mi16 fad sol8 fad mi re

    %265
    mi2-+ la,4
    r la' la
    mi sol2

    %268
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %271
    mi mi4.-+ re8\mbreak
    re4 la' la
    mi sol2

    %274
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %277
    mi mi4.-+ re8
    re4 <fad, la,>16 <fad la,> <fad la,> <fad la,>  <fad la,> <fad la,>  <fad la,> <fad la,>
    <fad la,> <fad la,>  <fad la,> <fad la,>  <fad la,> <fad la,>  <fad la,> <fad la,>  <fad la,> sol fad mi

    %280
    \repeat unfold 12 {re16}
    la' la la la la la la la la si la sol\mbreak
    fad16  <fad la,> <fad la,>  <fad la,>  <fad la,>  <fad la,> <fad la,>  <fad la,>  <fad la,>  <fad la,> <fad la,>  <fad la,>

    %283
    \repeat unfold 9 {<mi la,>16} sol fad mi
    \repeat unfold 12 {re16}
    la' la la la la la la la la si la sol

    %286
    fad8 re'16 dod re8 la fad [re]
    si'8. si16 si4.-+(la8)
    la re16 dod re8 fad re la

    %289
    re8. mi16 mi4.-+(re16 mi)\mbreak
    fad8 re16 dod re8 la fad [re]
    si' si si4.-+(la8)

    %292
    la8 re16 re fad8 la re,4~
    re8 mi mi4.-+ re8
    re4 la\p si

    %295
    mi2 la,4
    sold-+ la si
    re dod4.\prall re8

    %298
    si4-+ fad' mi
    re2-+ dod4\mbreak
    re si-+ dod~

    %301
    dod8 re si4.-+ la8
    la4 la'\f la
    mi sol2

    %304
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %307
    mi mi4.-+ re8
    re4 la' la
    mi sol2

    %310
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %313
    mi mi4.-+ re8
    re re16 re fad8 la re,[la]
    re8 dod16 si la si la sol fad sol fad mi

    %316
    re8 re'16 re fad8 la re,[la]
    re8 dod16 si la si la sol fad sol fad mi
    re8 re16 re re8 re re re

    %319
    re2.-+

}

XVvlIIn = \relative do'' {

    r4^\markup\italic "1.er Viol[on]" re4. re8
    la'4 la la
    la sol8-+ fad sol4

    %4
    sol \grace fad8 mi4 la
    fad-+ re4. re8
    la'4 la la

    %7
    la sol8-+ fad sol4
    sol \grace fad8 mi4 la
    fad-+ fad8 sol la4

    %10
    re, sol fad
    mi\prall dod-+ re~\mbreak
    re8(mi) mi4.-+(re16 mi)

    %13
    fad8 mi fad sol la4
    re, sol fad
    mi\prall dod-+ re4~

    %16
    re8 mi mi4.-+ re8
    re4 fad,8 sol la si
    mi,4.-+ la8 si dod

    %19
    re dod re mi fad-+ sol
    la2 la4
    r la,8 sol la si

    %22
    mi,4.-+ la8 si dod
    re dod re mi fad-+ sol\mbreak
    la2 la4

    %25
    r la,4. la8
    si4 la8 sol fad-+ sol
    la4 sol8 fad mi fad

    %28
    sol4 mi4.\prall la8
    fad4-+ la4. la8
    si4 la8 sol fad-+ sol

    %31
    la4  mi-+ fad~
    fad8 sol mi4.-+ re8
    re4 fad re

    %34
    la' si dod-+
    re mi fad
    dod-+ re re,\mbreak

    %37
    la' la re
    dod-+ re mi
    fad sol la

    %40
    sol fad2\prall
    mi4.-+ mi8 la4
    fad-+ re la

    %43
    si8 dod dod4.-+(si16 dod)
    re4. dod8 re4
    mi fad re-+

    %46
    mi4. mi8 la4
    fad-+ re la
    si8 dod dod4.-+(si16 dod)

    %49
    re4. mi8 fad4~\mbreak
    fad8 sol mi4.-+ re8
    re4 la8 la si dod

    %52
    re4 si8 si dod re
    mi4 \grace re8 dod4 fad
    \grace mi8 re4 si4.\prall mi8

    %55
    dod2-+ \appoggiatura si8 la4
    r re\p re
    re dod8-+ si dod re

    %58
    mi4 re8 dod re mi
    fad4 si, dod
    re dod4.-+ re8

    %61
    re4 la8\f la si dod\mbreak
    re4 si8 si dod re
    mi4 \grace re8 dod4 fad

    %64
    \grace mi8 re4 si4.\prall mi8
    dod2-+ \appoggiatura si8 la4
    r re\p re

    %67
    re dod8-+ si dod re
    mi4 re8 dod re mi
    fad4 si, dod

    %70
    re dod4.-+ re8
    re\f la re la re16 mi fad sol
    la8 sol16 fad mi8 la mi fad-+\mbreak

    %73
    sol8 fad16 mi re8 mi fad \afterGrace sol-+({fad16[sol)]}
    la8 sol16 fad mi8 re mi dod-+
    re la re la re16 mi fad sol

    %76
    la8 sol16 fad mi8 la mi fad-+
    sol8 fad16 mi re8 mi fad \afterGrace sol-+({fad16[sol)]}
    la8 sol16 fad mi8 re mi dod-+

    %79
    re4. re8\p dod mi
    re(mi-+) fad-! fad,-! fad(mi)-+
    re si'-! si-! si-! dod-! re-!\mbreak

    %82
    mi(fad) sol(sol,) sol(fad)
    mi-+ dod'-! dod-! re-! mi-! fad-!-+
    sol fad sol fad mi re

    %85
    dod-+ si la mi' fad sol
    fad8. mi16 re4.-+ dod8
    re4 re,8-! re'-! dod(mi)

    %88
    re(mi-+) fad-! fad,-! fad(mi-+)
    re  si'-! si-! si-! dod-! re-!\mbreak
    mi(fad)-+ sol-! sol,-! sol(fad-+)

    %91
    mi dod' dod re mi fad
    sol fad sol fad mi re
    dod4.-+ dod8 re4~

    %94
    re8 mi dod4.-+ re8\mbreak
    re4 re4.\f re8
    mi4 mi4.-+(re16 mi)

    %97
    fad4 re8 mi fad sol
    la4. si8 la[si]
    la4 re,4. re8

    %100
    mi4 mi4.-+(re16 mi)
    fad4 re8 mi fad sol
    la4. si8 la[si]

    %103
    la4 fad8 sol la4
    re, la re-+
    mi la, la'

    %106
    fad8-+ mi16 fad sol8 fad mi re\mbreak
    mi2 la,4
    r fad'8 sol la4

    %109
    re, la re-+
    mi la, la'
    fad8-+ mi16 fad sol8 fad mi re

    %112
    mi2-+ mi4
    r la la
    mi sol2

    %115
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %118
    mi mi4.-+ re8\mbreak
    re4 la' la
    mi sol2

    %121
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %124
    mi mi4.-+ re8
    re4 \clef violin r4 r
    r sol2\p~

    %127
    sol4 fa8 mi re do
    sib4 sib'8 la sol fa
    mi re dod re mi dod\mbreak

    %130
    re4 fa2~
    fa4 mi8 re do sib
    la4 la'2~

    %133
    la4 sol8 fa mi re
    sol la mi4.-+ re8
    re4. r16 la\f [fa8. re16]

    %136
    sib'4 sib8. la16 sib4
    <mi, do>4. r16 sol [mi8. do16]
    la'4 la8. sol16 la4

    %139
    <re, sib>4. r16 fa[re8. sib16]
    sol'4 sol sol\mbreak
    sol la8 sol fa-+ mi

    %142
    fa4 fa\p fa
    mi4.(fad8) fad8.-+(mi32 fad)
    sol4 re' mi-+

    %145
    \appoggiatura mi8 fa2 \appoggiatura mi8 re4
    sol mi-+ fa~
    fa8 sol mi4.-+ re8

    %148
    re4. r16 la\f[fa8. re16]
    sib'4 sib8. la16 sib4
    <mi, do>4. r16 sol [mi8. do16]

    %151
    la'4 la8. sol16 la4
    <re, sib>4. r16 fa[re8. sib16]
    sol'4 sol sol\mbreak

    %154
    sol la8 sol fa-+ mi
    fa4 fa\p fa
    mi4.(fad8) fad8.-+(mi32 fad)

    %157
    sol4 re' mi-+
    \appoggiatura mi8 fa2 \appoggiatura mi8 re4
    sol mi-+ fa~

    %160
    fa8 (mi16-+ re) dod4.-+ re8
    re2 r4
    R2.

    %163
    r4 re mi
    dod2.-+\mbreak
    re4 re, la'

    %166
    sib la-+ sol
    la2.~
    la4 la sol-+

    %169
    la2 r4
    R2.
    r4 re mi

    %172
    dod2-+ r4
    re re, la'
    sib la-+ sol

    %175
    la2.~
    la4. la8 sol4-+
    la r fa\mbreak

    %178
    sol2 la4
    sib la re
    mi re-+ dod

    %181
    re r fa,
    sol2 la4
    sib2 la4

    %184
    mi'8 fa dod4.-+ re8
    re4 fa8.\f re16 la8. fa16
    do'4 sol4. sib8

    %187
    la4-+ sol8. sib?16 la8. sol16
    fa8.-+ mi16 \appoggiatura mi8 fa4. sol8
    mi4-+ do'8.[re16 mi8. fa16]\mbreak

    %190
    sol4 la fa-+
    sol do, re8. do16
    sib8.\prall la16 sol4.-+ fa8

    %193
    fa mi fa\p sol la sib
    sol4-+ sol do~
    do sib8-+ la sib do

    %196
    la4 la re~
    re do8-+ si? do re
    si mi re do si la

    %199
    sold4.-+ fad8 sol[la]
    fad4-+ si2\mbreak
    mi,4 do'8 re mi4

    %202
    fa si,4.-+ la8
    la2 r4
    R2.

    %205
    r4 la' sol-+
    fa8(la) sol(fa) mi(re)
    dod2-+ r4

    %208
    r4 la\p la
    \appoggiatura la8 sib2.
    la4 sol2-+

    %211
    \appoggiatura sol8 la2.
    r4 fa fa\mbreak
    \appoggiatura fa8 sol2.

    %214
    fa4 mi4.-+(re16 mi)
    fa4 mi-+ re
    la'8 si? dod re mi fa

    %217
    sol2.~
    sol4. la8 fa4\prall~
    fa8 mi mi4.-+ re8

    %220
    re4 la la-+
    \appoggiatura la8 sib2.
    la4 sol2-+

    %223
    \appoggiatura sol8 la2.\mbreak
    r4 fa fa
    \appoggiatura fa8 sol2.

    %226
    fa4 mi4.-+(re16 mi)
    fa4 mi-+ re
    la'8 si? dod re mi fa

    %229
    sol2.~
    sol4. la8 fa4\prall~
    fa8 mi mi4.-+ re8

    %232
    re4 la4.\f la8
    re4 re4. re8
    re4 dod-+ re8 mi

    %235
    fa4 fa mi8-+ re\mbreak
    sol4 sol4. sol8
    sol4 fa8-+ mi la4~

    %238
    la sol8\prall fa mi re
    dod4.-+ si8 la4
    r la4. la8

    %241
    re4 re4. re8
    re4 dod-+ re8 mi
    fa4 fa mi8-+ re

    %244
    sol4 sol4. sol8
    sol4 fa8-+ mi la4~
    la sol8 fa mi re

    %247
    dod4.-+ si8 la4
    r4 re4. re8  %% OOKK Maieur
    mi4 mi4.-+(re16 mi)

    %250
    fad4 re8 mi fad sol
    la4. si8 la[si]
    la4 re,4. re8

    %253
    mi4 mi4.-+(re16 mi)
    fad4 re8 mi fad sol
    la4. si8 la[si]

    %256
    la4 fad8 sol la4
    re, la re-+
    mi la, la'

    %259
    fad8-+ mi16 fad sol8 fad mi re\mbreak %%% Fine p. 35
    mi2-+ la,4
    r fad'8 sol la4

    %262
    re, la re-+
    mi la, la'
    fad8-+ mi16 fad sol8 fad mi re

    %265
    mi2-+ la,4
    r la' la
    mi sol2

    %268
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %271
    mi mi4.-+ re8\mbreak
    re4 la' la
    mi sol2

    %274
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %277
    mi mi4.-+ re8
    re4 <fad, la,>16 <fad la,> <fad la,> <fad la,>  <fad la,> <fad la,>  <fad la,> <fad la,>
    <fad la,> <fad la,>  <fad la,> <fad la,>  <fad la,> <fad la,>  <fad la,> <fad la,>  <fad la,> sol fad mi

    %280
    \repeat unfold 12 {re16}
    la' la la la la la la la la si la sol\mbreak
    fad16  <fad la,> <fad la,>  <fad la,>  <fad la,>  <fad la,> <fad la,>  <fad la,>  <fad la,>  <fad la,> <fad la,>  <fad la,>

    %283
    \repeat unfold 9 {<mi la,>16} sol fad mi
    \repeat unfold 12 {re16}
    la' la la la la la la la la si la sol

    %286
    fad8 re'16 dod re8 la fad [re]
    si'8. si16 si4.-+(la8)
    la re16 dod re8 fad re la

    %289
    re8. mi16 mi4.-+(re16 mi)\mbreak
    fad8 re16 dod re8 la fad [re]
    si' si si4.-+(la8)

    %292
    la8 re16 re fad8 la re,4~
    re8 mi mi4.-+ re8
    re4 la\p si

    %295
    mi2 la,4
    sold-+ la si
    re dod4.\prall re8

    %298
    si4-+ fad' mi
    re2-+ dod4\mbreak
    re si-+ dod~

    %301
    dod8 re si4.-+ la8
    la4 la'\f la
    mi sol2

    %304
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %307
    mi mi4.-+ re8
    re4 la' la
    mi sol2

    %310
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %313
    mi mi4.-+ re8
    re re16 re fad8 la re,[la]
    re8 dod16 si la si la sol fad sol fad mi

    %316
    re8 re'16 re fad8 la re,[la]
    re8 dod16 si la si la sol fad sol fad mi
    re8 re16 re re8 re re re

    %319
    re2.

}

XVvlaIn = \relative do'' {

    r4 re4. re8
    mi4 mi fad8 mi
    re2 re4
    mi mi dod-+
    re re4. re8
    mi4 mi fad8 mi
    re2 re4
    mi mi dod-+
    re2 re8 dod
    si4 dod re
    dod mi la,\mbreak
    re dod4.-+(si16 dod)
    re4 la re8 dod
    si4 dod re
    dod-+ la la
    si la4. sol8
    fad2-+ re4
    la'2 la4~
    la re2
    dod8-+ si dod re mi dod
    re4 re, fad
    la2 la4~
    la re2\mbreak
    dod8-+ si dod re mi dod
    re4 fad,4. fad8
    sol4 fad8 mi re mi
    fad4 mi8 re dod re
    re4 re4. dod8
    re4 fad4. fad8
    sol4 fad8 mi re mi
    fad4 dod re~
    re dod4.-+ re8
    re4 r r
    R2.*3
    r4 la' la
    la si dod
    re dod re
    mi la,2
    la la4
    la2 fad4-+
    sol sol2
    fad4 si si
    la la la
    la8 si dod re mi dod
    re4 la fad-+
    sol2 sol4
    fad si8 la la4\mbreak
    si la4. sol8
    fad4-+ fad8 fad sold lad
    si4 sold8 sold la? si
    dod4 la la
    la sold4.-+(fad16 sold)
    la2 la4
    r r re,\p
    la'2 sol8 fad
    mi4 si' la8 sol
    fad4 sol8 fad mi4
    re la' la,
    re fad8\f fad sold lad\mbreak
    si4 sold8 sold la? si
    dod4 la la
    la sold4.-+(fad16 sold)
    la2 la4
    r r re,\p
    la'2 sol8 fad
    mi4 si' la8 sol
    fad4 sol8 fad mi4
    re la' la,
    re\f fad la
    la2 la4\mbreak
    si8 la16 sol fad8-! sol-! la-! mi-!
    fad-! si-! la4 la
    la la la
    la la la
    si8 la16 sol fad8 sol la mi
    fad si la4 la
    la r r
    R2.*15
    r4 la4.\f re8
    re2 dod4-+
    re fad, re
    mi2 la8 sol
    fad4-+ la4. re8
    re2 dod4-+
    re fad, re
    mi2 la8 sol
    fad2.-+
    re4 fad la
    la la la
    la2 la4\mbreak
    la2 la4
    R2.
    re,4 fad la
    la8 si dod re mi dod
    re4 la re
    dod4.-+ si8 la4
    r r la8 si
    dod si dod re mi dod
    re dod re mi fad4
    dod8 si dod re mi dod
    re2 re4
    re dod4.-+ re8\mbreak
    re2 la8 sol
    dod si dod re mi dod
    re dod re mi fad4
    dod8 si dod re mi dod
    re2 re4
    re dod4.-+ re8
    re4 r re,\p
    mi2.
    fa2 fa4
    sol2.
    la2 la,4\mbreak
    re2 r4
    R2.*5
    r4 re\f re
    do2 r4
    r do do
    sib2 r4
    r re mi\mbreak
    dod2-+ dod4
    re2 r4
    R2.*6
    r4 sol\f sol
    sol2 r4
    r fa fa
    fa2 r4\mbreak
    r mi mi
    dod2-+ dod4
    re2 r4
    R2.*21
    r4 r re\mbreak
    mi2 fa4
    sol2 la4
    sib la la,
    re2 r4
    R2.*3
    r4 r la'\f
    sol2 mi4-+
    fa do do~
    do si4.-+ do8
    do2 do'8 re\mbreak
    mi4 do do
    do2 fa,4~
    fa mi4.-+ fa8
    fa2 r4
    R2.*14
    r4 re\p re
    re2 r4
    r do do
    do2 r4
    r si si\mbreak
    si2 r4
    r la la
    la2 re4
    mi2.
    mi2 sol4
    dod,2 re4
    sib' la mi
    fa re re
    re2 r4
    r do do
    do2 r4\mbreak
    r sib sib
    sib?2 r4
    r la la
    la2 re4
    mi2 r8 la
    sib la sol fa mi4
    la,2 re4
    sib' la4. sol8
    fa2 r4
    r re4.\f re8
    la'4 la la
    la fa sol8 la\mbreak
    sib4 sib sib
    la2 la4
    sib2 sib4
    la2 la4
    R2.
    r4 re,4. re8
    la'4 la la
    la fa sol8 la
    sib4 sib sib
    la2 la4
    sib2 sib4
    la2 r4\mbreak
    r la4. re8
    re2 dod4-+
    re2 re8 dod
    re4 la la8 sol
    fad4 la4. re8
    re2 dod4-+
    re2 la8 si
    dod re dod re mi dod
    re2.
    re,4 fad la
    la2 la4
    la la la\mbreak
    la2 la4
    R2.
    re,4 fad la
    la8 si dod re mi dod
    re4 la re
    dod4.-+ si8 la4
    R2.
    la8 si dod re mi dod
    re4 la re
    dod8-+ re dod re mi dod
    re2 la4
    si la4.-+ sol8\mbreak
    fad2-+ r4
    la, mi' la
    la2 r4
    la, mi' la
    la2 la4
    si la4. sol8
    fad4-+ \repeat unfold 8 {re16}
    \repeat unfold 12 {dod}
    \repeat unfold 12 {re}
    \repeat unfold 8 {re16} dod dod dod dod\mbreak
    re re re re la la la la re re re re
    \repeat unfold 12 {dod}
    \repeat unfold 12 {re}
    \repeat unfold 8 {re16} dod 4
    re fad re
    re sol2
    fad4 la la
    la8 re dod4.-+(si16 dod)\mbreak
    re4 la fad-+
    sol re4. mi8
    fad fad16 sol la8 la la4~
    la8 re dod4.-+ re8
    re4 fad,\p sold
    sold?(la) mi'4
    re dod si~
    si mi, la
    sold la la
    sold2 la4\mbreak
    mi2 mi4~
    mi8 la sold4.-+ la8
    la2 la8\f si
    dod re dod re mi dod
    re4 la re
    dod8 re dod re mi dod
    re2 la4
    si la4. sol8
    fad2-+ r4
    r mi la
    la2 r4
    r la la\mbreak
    la2 la4
    si la4. sol8
    fad2.-+

    re'8 dod16 si la si la sol fad sol fad mi

    %316
    re8 re16 re re8 re re re
    re16 re' dod si la si la sol fad sol fad mi
    re8 re16 re re8 re re re

    %319
    re2.-+

}

XVtpn = \relative do'' {

    R2.*94
    r4 re4.\f re8
    mi4 mi4.-+(re16 mi)

    %97
    fad4 re8 mi fad sol
    la4. si8 la[si]
    la4 re,4. re8

    %100
    mi4 mi4.-+(re16 mi)
    fad4 re8 mi fad sol
    la4. si8 la[si]

    %103
    la4 fad8 sol la4
    re, la re-+
    mi la, la'

    %106
    fad8-+ mi16 fad sol8 fad mi re\mbreak
    mi2 la,4
    r fad'8 sol la4

    %109
    re, la re-+
    mi la, la'
    fad8-+ mi16 fad sol8 fad mi re

    %112
    mi2-+ mi4
    r la la
    mi sol2

    %115
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %118
    mi mi4.-+ re8\mbreak
    re4 la' la
    mi sol2

    %121
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %124
    mi mi4.-+ re8
    re4 \clef violin r r
    R2.*122

    %248
    r4 re4. re8  %% OOKK Maieur
    mi4 mi4.-+(re16 mi)

    %250
    fad4 re8 mi fad sol
    la4. si8 la[si]
    la4 re,4. re8

    %253
    mi4 mi4.-+(re16 mi)
    fad4 re8 mi fad sol
    la4. si8 la[si]

    %256
    la4 fad8 sol la4
    re, la re-+
    mi la, la'

    %259
    fad8-+ mi16 fad sol8 fad mi re\mbreak %%% Fine p. 35
    mi2-+ la,4
    r fad'8 sol la4

    %262
    re, la re-+
    mi la, la'
    fad8-+ mi16 fad sol8 fad mi re

    %265
    mi2-+ la,4
    r la' la
    mi sol2

    %268
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %271
    mi mi4.-+ re8\mbreak
    re4 la' la
    mi sol2

    %274
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %277
    mi mi4.-+ re8
    re4 re4. re8
    mi4 mi la

    %280
    fad-+ re4. re8
    la2 la4\mbreak
    la re4. re8

    %283
    mi4 mi la
    fad-+ re4. re8
    la2 la4

    %296
    la re re
    re2.~
    re4 re re

    %289
    re mi2-+\mbreak
    fad4 re re
    re2.

    %292
    r8 re16 re fad8[la] re,4~
    re8 mi mi4.-+ re8
    re4 r r

    %295
    R2.*7
    r4 la' la
    mi sol2

    %304
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %307
    mi mi4.-+ re8
    re4 la' la
    mi sol2

    %310
    fad8 sol fad sol la4
    mi sol2
    fad8 sol fad mi re4

    %313
    mi mi4.-+ re8
    re re16 re fad8 la re,[la]
    re4 r r

    %316
    r8 re16 re fad8 la re,[la]
    re4 r r
    re8 re16 re la8 la fad fad

    %319
    re2.-+

}

XVtmpn = \relative do {

    R2.*94
    re4 re4. re8
    la4 la la

    %97
    re re re
    la8 la16 la la8 la la la
    re4 re4. re8

    %100
    la4 la la
    re re re
    la8 la16 la la8 la la la

    %103
    re2 r4
    r re4. re8
    la4 la la

    %106
    re la re\mbreak
    la8 la16 la la8 la la la
    re2 r4

    %109
    r re4. re8
    la4 la la
    re la re

    %112
    la2 la4
    la8 la16 la la8 la la la
    la8 la16 la la8 la la la

    %115
    re4 re4. re8
    la8 la16 la la8 la la la
    re2 re4

    %118
    la la4. la8\mbreak
    re2 r4
    la8 la16 la la8 la la la

    %121
    re4 re4. re8
    la la16 la la8 la la la
    re2 re4

    %124
    re la4. re8
    re2 r4
    R2.*122

    %248
    r4 \clef bass re4. re8
    la4 la la
    re re re

    %251
    la8 la16 la la8 la la la
    re4 re4. re8
    la4 la la

    %254
    re re re
    la8 la16 la la8 la la la
    re2 r4

    %257
    r re4. re8
    la4 la la
    re la re\mbreak

    %260
    la8 la16 la la8 la la la
    re2 r4
    r re4. re8

    %263
    la4 la la
    re la re
    la2 la4

    %266
    la8 la16 la la8 la la la
    la4 la la
    re8 re16 re re8 re re re

    %269
    la8 la16 la la8 la la la
    re2 re4
    re la4. re8\mbreak

    %272
    re4 r r
    r8 la16 la la8 la la la
    re4 re re

    %275
    la8 la16 la la8 la la la
    re2 re4
    re la4. re8

    %278
    re4 r r
    R2.*9
    r8 re16 re re8 re re re

    %289
    re4 la4. re8\mbreak
    re4 r r
    R2.

    %292
    r8 re16 re re8 re re re
    re4 la4. re8
    re4 r r

    %295
    R2.*8
    la8 la16 la la8 la la la
    re4 re re

    %305
    la8 la16 la la8 la la la
    re2 re4
    re la4. re8

    %308
    re4 r r
    la8 la16 la la8 la la la
    re4 re re

    %311
    la8 la16 la la8 la la la\mbreak
    re2 re4
    re la4. re8

    %314
    re re16 re re8 re re re
    re2 r4
    re8 re16 re re8 re re re

    %317
    re2 r4
    re8 re16 re re8 re re re
    re2.

}

XVfgIn = \relative do {

    \clef bass r4 re'4. re8
    dod4 do4. do8
    si2 si4

    %4
    dod?2 la4
    re re4. re8
    dod4 do do

    %7
    si2 si4
    dod?2 la4
    re4 re fad,

    %10
    sol8 fad mi4 re
    la' sol fad\mbreak
    sol la la,

    %13
    re8 dod re mi fad re
    sol fad mi4 re
    sol2 fad4

    %16
    sol la la,
    re2.
    dod

    %19
    si
    la8 sol la si dod la
    re2.

    %22
    dod
    si\mbreak
    la8 sol la si dod la

    %25
    re4 re'4. re8
    sol,4 la si
    fad2 la4

    %28
    mi la la,
    re re4. re8
    sol,4 la si

    %31
    fad la re
    sol, la2
    re,4 r r

    %34
    R2.*3\mbreak
    r4 fad' re
    la' si dod

    %39
    re mi fad
    dod re re,
    la'8 sol la si dod la

    %42
    re4 fad, re
    sol mi2
    si'4. la8 si4

    %45
    dod re re,
    la'8 sol la si dod la
    re4 fad, re

    %48
    sol mi2
    si'4. dod8 re4\mbreak
    sol, la la,

    %51
    re re8 re re dod
    si4 mi8 mi mi re
    dod4 fad re

    %54
    si mi mi,
    la8 sol la si dod la
    re2 r4

    %57
    R2.*4
    r4 re8\f re re dod\mbreak
    si4 mi8 mi mi re

    %63
    dod4 fad re~
    re mi mi,
    la8 sol la si dod la

    %66
    re2 r4
    R2.*4
    r2 re'4\f

    %72
    dod2 do4
    si4. si8 la[sol]
    fad4 sol la

    %75
    re,2 re4
    dod2 do4
    si4. si8 la[sol]

    %78
    fad4 sol la
    re, re''\p la
    re4. re,8 mi fad

    %81
    sol sol'-! sol-! sol-! sol-! fad-!\mbreak
    mi4. mi,8 fad sol
    la-! la-! la-! si-! dod-! re-!

    %84
    mi re mi re dod si
    la2.
    si8. sol16 la4 la,

    %87
    re re' la
    re4. re,8 mi fad
    sol sol'-! sol-! sol-! sol-! fad-!

    %90
    mi4. mi,8 fad sol
    la la la si dod re
    mi re mi re dod si

    %93
    la2 re4
    si8 sol la4 la,\mbreak
    re re4.\f re8

    %96
    la4 la la
    re2 re'4
    dod8-+ si la4 la,

    %99
    re re4. re8
    la4 la la
    re2 re'4

    %102
    dod8-+ si la4 la,
    re2 re8 mi
    fad2 re4

    %105
    la' dod la
    re dod si\mbreak
    la8 si la sol fad mi

    %108
    re2 re8 mi
    fad2 re4
    la' dod la

    %111
    re dod si
    la2 la4
    la,8 la16 la la8 la la la

    %114
    la la16 la la8 la la la
    re dod re mi fad sol
    la la,16 la la8 la la la

    %117
    re2 fad,4
    sol la2\mbreak
    re8 dod re mi fad sol

    %120
    la la,16 la la8 la la la
    re dod re mi fad sol
    la la,16 la la8 la la la

    %123
    re2 fad,4
    sol la2
    re2 \clef bass r4

    %126
    R2.*4
    r2 re4
    mi2.

    %132
    fa2 fa4
    sol2 r8 la
    sib sol la4 la,

    %135
    re2 r4
    r sol,\f sol
    do2 r4

    %138
    r fa, fa
    sib2 r4
    r sol mi\mbreak

    %141
    la2  la4
    re, re''\p re
    la2 re4

    %144
    sol, sib sol
    re' re, sol
    mi la fa

    %147
    sol la la,
    re2 r4
    r sol,\f sol

    %150
    do do8. re16 mi4
    fa,2 fa4
    sib sib8. do16 re4\mbreak

    %153
    mi, sol mi
    la2 la4
    re, re''\p re

    %156
    la2 re4
    sol, sib sol
    re' re, sol

    %159
    mi la fa
    sol la la,
    re re'2

    %162
    do4 sib-+ la
    sib la-+ sol
    la2.~\mbreak

    %165
    la4 sol fa
    sol fa-+ mi
    fa mi re

    %168
    do2 sib4
    la2 re'4
    do sib la

    %171
    sib la-+ sol
    la2.~
    la4 sol fa

    %174
    sol fa-+ mi
    fa mi re
    do4. re8 sib4

    %177
    la2 r4
    R2.*3
    r2 re4
    mi2 fa4

    %183
    sol2 la4
    sib8 sol la4 la,
    re2 re4\f

    %186
    mi2 do4
    fa mi8. do16 fa8. mi16
    re4 sol sol,

    %189
    do2 r4\mbreak
    do' fa,2
    do4 la sib~

    %192
    sib do do,
    fa la' fa
    do'2 do,4

    %195
    sol sib' sol
    re'2 re,4
    la do' la

    %198
    mi' la,2
    mi mi4
    si'?8 la sold fad sold mi\mbreak

    %201
    la4 la,8 si do4
    re mi mi,
    la2.~

    %204
    la~
    la4 r r
    R2.

    %207
    r4 la'8-!\f sol-! fa-! mi-!
    \clef tenor r4 fad'4 fad-+
    \appoggiatura fad?8 sol2.

    %210
    fa?4 mi2-+
    \appoggiatura mi8 fa2.
    r4 re re\mbreak

    %213
    \appoggiatura re8 mi2.
    re4 dod4.-+(si16 dod)
    re4 mi sol

    %216
    dod,8 si? la4 sol8 la
    sib4. la8 sib dod?
    \appoggiatura sib8 la2 re4~

    %219
    re8 mi dod4.-+ re8
    re4 fad fad-+
    \appoggiatura fad?8 sol2.

    %222
    fa?4 mi2-+
    \appoggiatura mi8 fa2.
    r4 re re

    %225
    \appoggiatura re8 mi2.
    re4 dod4.-+(si16 dod)
    re4 mi sol

    %228
    dod,8 si la si dod re
    mi2.
    dod4.-+(si16 dod) re4~

    %231
    re8 mi dod4.-+ re8
    re4 r r
    r re4.\f re8

    %234
    la'4 \clef bass  la,,4. la8
    re4 re re\mbreak
    re dod re8 mi

    %237
    fa2 fa4
    sol4. la8 sib sol
    la sib la sol fa mi

    %240
    re4  r r
    \clef tenor r4 re'4. re8
    la'4 \clef bass la,,4. la8

    %243
    re4 re re
    re dod re8 mi
    fa2 fa4

    %246
    sol4. la8 sib sol
    la sol la si? dod la\mbreak
    re4 re4. re8

    %249
    la4 la la
    re2 re,8 mi
    fad sol la4 la,

    %252
    re re'4. re8
    la4 la la
    re2 re,4

    %255
    dod8 si la2
    re2 re8 mi
    fad2 re4

    %258
    la' dod la
    re dod si\mbreak
    la8 si la sol fad mi

    %261
    re2 re8 mi
    fad2 re4
    la' dod la

    %264
    re dod si
    la2 la4
    la,8 la16 la la8 la la la

    %267
    dod si la si dod la
    re dod re mi fad sol
    la la,16 si dod8 si dod la

    %270
    re2 fad,4
    sol la2\mbreak
    re,4 re'8 mi fad sol

    %273
    la la,16 la la8 la la la
    re dod re mi fad sol
    la la,16 si dod8 si dod la

    %276
    re2 fad,4
    sol la2
    re4 re'16 re re re re re re re

    %279
    \repeat unfold 12 {la}
    \repeat unfold 12 {si}
    fad fad fad fad fad fad fad fad la la la la\mbreak

    %282
    re,  \repeat unfold 11 {re}
    \repeat unfold 12 {la}
    \repeat unfold 12 {si}

    %285
    fad fad fad fad fad fad fad fad la la la la
    re,8 re'16 dod re mi re mi fad mi fad re
    sol8 sol,16 la si dod si la sol la si sol

    %288
    re' dod re mi fad sol fad mi re mi fad re
    fad8. sol16 la4 la,\mbreak
    re8 re16 dod re mi re mi fad mi fad re

    %291
    sol8 sol,16 la si dod si la sol la si sol
    re' mi fad mi re dod re mi fad mi fad re
    sol4 la la,

    %294
    re2.\p
    dod
    si4 la sold~

    %297
    sold la2
    mi'4 re dod
    si2-+ la4

    %300
    sold2 la4
    re mi mi,
    la2 r4

    %303
    la8\f la16 la la8 la la la
    re dod re mi fad sol
    la la,16 la la8 la la la

    %306
    re2 fad,4
    sol la2
    re,4 re'8 mi fad sol

    %309
    la la,16 si dod8 si dod la
    re dod re mi fad sol
    la la,16 si dod8 si dod la\mbreak

    %312
    re4 re,8 mi fad4
    sol la2
    re, r4

    %315
    re'8 re16 re fad8 fad la[la]
    re, re16 re re8 re re re
    re8 re16 re fad8 fad la[la]

    %318
    re, re16 re re8 re re re
    re2.

}

XVbcn = \relative do {

    \clef bass r4 re'4. re8
    dod4 do4. do8
    si2 si4

    %4
    dod?2 la4
    re re4. re8
    dod4 do do

    %7
    si2 si4
    dod?2 la4
    re4 re fad,

    %10
    sol8 fad mi4 re
    la' sol fad\mbreak
    sol la la,

    %13
    re8 dod re mi fad re
    sol fad mi4 re
    sol2 fad4

    %16
    sol la la,
    re2.
    dod

    %19
    si
    la8 sol la si dod la
    re2.

    %22
    dod
    si\mbreak
    la8 sol la si dod la

    %25
    re4 re'4. re8
    sol,4 la si
    fad2 la4

    %28
    mi la la,
    re re4. re8
    sol,4 la si

    %31
    fad la re
    sol, la2
    re,4 r r

    %34
    R2.*3\mbreak
    r4 fad' re
    la' si dod

    %39
    re mi fad
    dod re re,
    la'8 sol la si dod la

    %42
    re4 fad, re
    sol mi2
    si'4. la8 si4

    %45
    dod re re,
    la'8 sol la si dod la
    re4 fad, re

    %48
    sol mi2
    si'4. dod8 re4\mbreak
    sol, la la,

    %51
    re re8 re re dod
    si4 mi8 mi mi re
    dod4 fad re

    %54
    si mi mi,
    la8 sol la si dod la
    re2 \clef alto \key re\major re'4\p

    %57
    la'2 sol8 fad
    mi4 si' la8 sol
    fad4 sol8 fad mi4

    %60
    re la' la,
    re\clef bass \key re\major re,8\f re re dod\mbreak
    si4 mi8 mi mi re

    %63
    dod4 fad re~
    re mi mi,
    la8 sol la si dod la

    %66
    re2 \clef alto \key re\major re'4\p
    la'2 sol8 fad
    mi4 si' la8 sol

    %69
    fad4 sol8 fad mi4
    re la' la,
    re2\clef bass \key re\major re4\f

    %72
    dod2 do4\mbreak  %%% fine p 31
    si4. si8 la[sol]
    fad4 sol la

    %75
    re,2 re4
    dod2 do4
    si4. si8 la[sol]

    %78
    fad4 sol la
    re, re''\p la
    re4. re,8 mi fad

    %81
    sol sol'-! sol-! sol-! sol-! fad-!\mbreak
    mi4. mi,8 fad sol
    la-! la-! la-! si-! dod-! re-!

    %84
    mi re mi re dod si
    la2.
    si8. sol16 la4 la,

    %87
    re re' la
    re4. re,8 mi fad
    sol sol'-! sol-! sol-! sol-! fad-!

    %90
    mi4. mi,8 fad sol
    la la la si dod re
    mi re mi re dod si

    %93
    la2 re4
    si8 sol la4 la,\mbreak
    re re4.\f re8

    %96
    la4 la la
    re2 re'4
    dod8-+ si la4 la,

    %99
    re re4. re8
    la4 la la
    re2 re'4

    %102
    dod8-+ si la4 la,
    re2 re8 mi
    fad2 re4

    %105
    la' dod la
    re dod si\mbreak
    la8 si la sol fad mi

    %108
    re2 re8 mi
    fad2 re4
    la' dod la

    %111
    re dod si
    la2 la4
    la,8 la16 la la8 la la la

    %114
    la la16 la la8 la la la
    re dod re mi fad sol
    la la,16 la la8 la la la

    %117
    re2 fad,4
    sol la2\mbreak
    re8 dod re mi fad sol

    %120
    la la,16 la la8 la la la
    re dod re mi fad sol
    la la,16 la la8 la la la

    %123
    re2 fad,4
    sol la2
    re2\clef alto re'4\p

    %126
    mi2.
    fa2 fa4
    sol2.

    %129
    la2 la,4\mbreak
    re2\clef bass re,4
    mi2.

    %132
    fa2 fa4
    sol2 r8 la
    sib sol la4 la,

    %135
    re2 r4
    r sol,\f sol
    do2 r4

    %138
    r fa, fa
    sib2 r4
    r sol mi\mbreak

    %141
    la2  la4
    re, re''\p re
    la2 re4

    %144
    sol, sib sol
    re' re, sol
    mi la fa

    %147
    sol la la,
    re2 r4
    r sol,\f sol

    %150
    do do8. re16 mi4
    fa,2 fa4
    sib sib8. do16 re4\mbreak

    %153
    mi, sol mi
    la2 la4
    re, re''\p re

    %156
    la2 re4
    sol, sib sol
    re' re, sol

    %159
    mi la fa
    sol la la,
    re re'2

    %162
    do4 sib-+ la
    sib la-+ sol
    la2.~\mbreak

    %165
    la4 sol fa
    sol fa-+ mi
    fa mi re

    %168
    do2 sib4
    la2 re'4
    do sib la

    %171
    sib la-+ sol
    la2.~
    la4 sol fa

    %174
    sol fa-+ mi
    fa mi re
    do4. re8 sib4

    %177
    la2 \clef alto re'4\mbreak
    mi2 fa4
    sol2 la4

    %180
    sib la la,
    re2 \clef bass re,4
    mi2 fa4

    %183
    sol2 la4
    sib8 sol la4 la,
    re2 re4\f

    %186
    mi2 do4
    fa mi8. do16 fa8. mi16
    re4 sol sol,

    %189
    do2 r4\mbreak
    do' fa,2
    do4 la sib~

    %192
    sib do do,
    fa la' fa
    do'2 do,4

    %195
    sol sib' sol
    re'2 re,4
    la do' la

    %198
    mi' la,2
    mi mi4
    si'?8 la sold fad sold mi\mbreak

    %201
    la4 la,8 si do4
    re mi mi,
    la2.~

    %204
    la~
    la4 r r
    R2.

    %207
    r4 la'8-!\f sol-! fa-! mi-!
    re dod re mi fad re
    sol, fad? sol la sib sol

    %210
    do sib? do re mi do
    fa,? mi fa sol la fa
    sib la sib do re sib\mbreak

    %213
    mi, re mi fa sol mi
    la sol la si dod la
    re4 do? sib

    %216
    la2.
    sol8 \p la sib dod re mi
    fa2.

    %219
    sol4 la la,
    re8\f dod re mi fad re
    sol, fad? sol la sib sol

    %222
    do sib? do re mi do
    fa, mi fa sol la fa\mbreak
    sib la sib do re sib

    %225
    mi, re mi fa sol mi
    la sol la si? dod la
    re4 do? sib

    %228
    la2 r4
    sol8 la sib? dod re mi
    fa2.

    %231
    sol4 la la,
    re2 r4
    R2.

    %234
    r4 la4. la8
    re4 re re\mbreak
    re dod re8 mi

    %237
    fa2 fa4
    sol4. la8 sib sol
    la sib la sol fa mi

    %240
    re4 r r
    R2.
    r4 la4. la8

    %243
    re4 re re
    re dod re8 mi
    fa2 fa4

    %246
    sol4. la8 sib sol
    la sol la si? dod la\mbreak
    re4 re4. re8

    %249
    la4 la la
    re2 re,8 mi
    fad sol la4 la,

    %252
    re re'4. re8
    la4 la la
    re2 re,4

    %255
    dod8 si la2
    re2 re8 mi
    fad2 re4

    %258
    la' dod la
    re dod si\mbreak
    la8 si la sol fad mi

    %261
    re2 re8 mi
    fad2 re4
    la' dod la

    %264
    re dod si
    la2 la4
    la,8 la16 la la8 la la la

    %267
    dod si la si dod la
    re dod re mi fad sol
    la la,16 si dod8 si dod la

    %270
    re2 fad,4
    sol la2\mbreak
    re,4 re'8 mi fad sol

    %273
    la la,16 la la8 la la la
    re dod re mi fad sol
    la la,16 si dod8 si dod la

    %276
    re2 fad,4
    sol la2
    re4 re'16 re re re re re re re

    %279
    \repeat unfold 12 {la}
    \repeat unfold 12 {si}
    fad fad fad fad fad fad fad fad la la la la\mbreak

    %282
    re,  \repeat unfold 11 {re}
    \repeat unfold 12 {la}
    \repeat unfold 12 {si}

    %285
    fad fad fad fad fad fad fad fad la la la la
    re,8 re'16 dod re mi re mi fad mi fad re
    sol8 sol,16 la si dod si la sol la si sol

    %288
    re' dod re mi fad sol fad mi re mi fad re
    fad8. sol16 la4 la,\mbreak
    re8 re16 dod re mi re mi fad mi fad re

    %291
    sol8 sol,16 la si dod si la sol la si sol
    re' mi fad mi re dod re mi fad mi fad re
    sol4 la la,

    %294
    re2.\p
    dod
    si4 la sold~

    %297
    sold la2
    mi'4 re dod
    si2-+ la4

    %300
    sold2 la4
    re mi mi,
    la2 r4

    %303
    la8\f la16 la la8 la la la
    re dod re mi fad sol
    la la,16 la la8 la la la

    %306
    re2 fad,4
    sol la2
    re,4 re'8 mi fad sol

    %309
    la la,16 si dod8 si dod la
    re dod re mi fad sol
    la la,16 si dod8 si dod la\mbreak

    %312
    re4 re,8 mi fad4
    sol la2
    re, r4

    %315
    re'8 re16 re fad8 fad la[la]
    re, re16 re re8 re re re
    re8 re16 re fad8 fad la[la]

    %318
    re, re16 re re8 re re re
    re2.

}

XVbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 40
    s2.*124
    s4 \break \mark\markup\huge "Mineur"
    \key do\major s2
    s2.*122
    s4 \break \mark\markup\huge "Majeur"
    \key re\major
    s2
    s2.*71
    \bar "|."

}

XVvlI = {
    \XVglobal
    <<\XVvlIn \forma>>
}


XVvlII = {
    \XVglobal
    <<\XVvlIIn \forma>>
}

XVvlaI = {
    \XVglobal
    <<\XVvlaIn \forma>>
}

XVtp = {
    \XVglobal
    <<\XVtpn \forma>>
}

XVtmp= {
    \XVglobal
    \clef bass
    <<\XVtmpn \forma>>
}

XVfgI = {
    \XVglobal
    \clef bass
    <<\XVfgIn \forma>>
}

XVbc = {
    \XVglobal
    %\clef bass
    <<\XVbcn \forma \XVbfn>>
}



XVIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

XVIvlIn = \relative do'' {

    re4 re
    re8 re' re, mi
    fad sol mi-+ fad

    %4
    re4-+ re
    si'16 la sol la si8 re
    sol,8 sol sol4

    %7
    si16 la sol la si8 re
    fad, fad fad la
    mi mi mi4

    %10
    fad16 mi re mi fad mi re mi\mbreak
    fad mi re mi fad mi re mi
    fad mi re mi fad mi fad sold

    %13
    la8 la la4
    la, la
    la8 la' la, si

    %16
    dod re si-+ dod
    la4 la
    mi'16 re dod re mi8 fad

    %19
    \grace fad sol4 sol
    re16 dod si dod re8 mi
    \grace mi fad4 fad\mbreak

    %22
    la16 sol fad sol la sol fad sol
    la sol fad sol la sol fad sol
    la sol fad sol la sol fad sol

    %25
    la8 re re, mi
    fad sol fad-+ mi
    fad re' re, mi

    %28
    fad sol mi-+ fad
    re4 re
    re' re %%% tambourin 2

    %31
    re16 la sib sol la fa sol mi
    fa8 la, re fa
    la re, fa la

    %34
    re la4 sol16 fa
    mi re dod si la sol fa mi
    re''4 re

    %37
    re16 la sib sol la fa sol mi
    fa8 la, re fa
    la re, fa la

    %40
    re do16 sib la sol fa mi
    re2
    fa4 fa

    %43
    fa16 do re sib do la sib sol
    la8 do, fa la
    do fa, la do

    %46
    fa do4 sib16 la
    sol fa mi re do4
    r16 fa' (mi fa) sol fa (mi fa)

    %49
    fa mib (re mib) mib re (dod re)\mbreak
    re sol(fad sol) la sol (fad sol)
    sol fa! (mi fa) fa mi (red mi)

    %52
    mi8 do16 re mi fa sol la
    sib la sol la sib la sol la
    sib la sol la sib la sol la

    %55
    sib-+(la sib) re do-! sib-! la-! sol-!
    la-+(sol la) do-! sib-! la-! sol-! fa-!
    sib4 sol-+

    %58
    fa8 do fa,4\mbreak
    la'4 r8 la-+
    sol4 r8 sol-+

    %61
    fa4 r8 fa-+
    mi16 la, fa' la, sol' la, fa' la,
    mi' la, la' la, sol' la, fa' la,

    %64
    mi' la, fa' la, sol' la, fa' la,
    mi' la, fa' la, mi' la, re la
    la'2-+~

    %67
    la~\mbreak
    la8 sol16 fa mi fa mi re
    dod re mi re dod re dod sib

    %70
    la re do! sib la sib la sol
    fa sib la sol fa sol fa mi
    \clef violin \key re\major \footnote #'  (-1 . 2) \markup\column\smaller { "  ""On reprend le Majeur""  "} re'4 re

}

XVIvlIIn = \relative do'' {

    re4 re
    re8 re' re, mi
    fad sol mi-+ fad

    %4
    re4-+ re
    si'16 la sol la si8 re
    sol,8 sol sol4

    %7
    si16 la sol la si8 re
    fad, fad fad la
    mi mi mi4

    %10
    la,16 sol fad sol la sol fad sol\mbreak
    la sol fad sol la sol fad sol
    la sol fad sol la sold la si

    %13
    dod8 dod dod4
    la la
    la8 la' la, si

    %16
    dod re si-+ dod
    la4 la
    mi'16 re dod re mi8 fad

    %19
    \grace fad sol4 sol
    re16 dod si dod re8 mi
    \grace mi fad4 fad\mbreak

    %22
    fad16 mi re mi fad mi re mi
    fad mi re mi fad mi re mi
    fad mi re mi fad mi re mi

    %25
    fad8 re' fad, sol
    fad sol fad-+ mi
    fad re' re, mi

    %28
    fad sol mi-+ fad
    re4 re
    re' re %%% tambourin 2

    %31
    re16 la sib sol la fa sol mi
    fa8 la, re fa
    la re, fa la

    %34
    re la4 sol16 fa
    mi re dod si la sol fa mi
    re''4 re

    %37
    re16 la sib sol la fa sol mi
    fa8 la, re fa
    la re, fa la

    %40
    re do16 sib la sol fa mi
    re2
    fa4 fa

    %43
    fa16 do re sib do la sib sol
    la8 do, fa la
    do fa, la do

    %46
    fa do4 sib16 la
    sol fa mi re do4
    r16 fa' (mi fa) sol fa (mi fa)

    %49
    fa mib (re mib) mib re (dod re)\mbreak
    re sol(fad sol) la sol (fad sol)
    sol fa! (mi fa) fa mi (red mi)

    %52
    mi8 do16 si do re mi fa
    sol fa mi fa sol fa mi fa
    sol fa mi fa sol fa mi fa

    %55
    sol-+(fad sol) sib la sol fad mi
    fa?-+(mi fa) la-! sol-! fa-! mi-! fa-!
    sol4 mi-+

    %58
    fa8 do fa,4\mbreak
    fa' r8 fa-+
    mi4 r8 mi-+

    %61
    re4 r8 re
    dod16 la re la mi' la, re la
    dod la fa' la, mi' la, re la

    %64
    dod(la) re(la) mi'(la,) re(la)
    dod la re la dod la re la
    la'2-+~

    %67
    la~\mbreak
    la8 sol16 fa mi fa mi re
    dod re mi re dod re dod sib

    %70
    la re do! sib la sib la sol
    fa sib la sol fa sol fa mi
    \clef violin \key re\major re'4 re

}

XVIvlaIn = \relative do'' {

    R2*2
    la4 la
    la2

    %5
    R
    re8 re re4
    re16 do si do re8 re

    %8
    re re re4
    la8 la la4
    R2*2

    %12
    la16 sol fad sol la sold la si
    dod8 dod dod4
    R2*2

    %16
    mi,4 mi
    mi2
    R2*8

    %26
    r8 la [la la]
    re, la' si dod
    re re re dod-+

    %29
    re4 re
    R2*2  %%% tambourin 2
    re4 re

    %33
    re16 la sib sol la fa sol mi
    la,8 re'4 dod16 re
    dod4-+ r

    %36
    R2*2
    re4 re
    re16 la sib sol la fa sol mi\mbreak

    %40
    la,8 la'4 sol8
    fa2
    R2*2

    %44
    do4 do
    do do
    do fa

    %47
    mi2-+
    do'4 la
    sib do\mbreak

    %50
    fa, sib
    do re
    sol, r

    %53
    sol,8 sol' fa fa,
    mi mi' re re,
    do4 r8 do'

    %56
    fa4 r8 re'
    sib4 do
    r16 fa, mi re do sib la sol\mbreak

    %59
    fa mi fa sol la sol la sib
    do sib do re mi re mi dod
    re dod re mi fa mi fa sol

    %62
    la8 re dod re
    la2~
    la8 re dod re

    %65
    la2~
    la16 la sol fa mi fa mi re
    dod re mi re dod re dod sib\mbreak

    %68
    la2~
    la~
    la16 re do sib la sib la sol

    %71
    fa sib la sol la sol fa mi
    \clef alto \key re\major re4 r

}

XVIbcn = \relative do {

    R2*2
    re4 re
    re2

    %5
    R
    sol,8 sol sol4
    R2

    %8
    re'8 re re re,
    la'8 la la4
    R2*2

    %12
    re8 dod si mi
    la, la la4
    R2*2

    %16
    la4 la
    la2
    la'4 la

    %19
    mi2
    sol4 sol
    re2\mbreak

    %22
    R2*4
    r8 re' re, mi
    fad re' fad,-+ mi

    %28
    la si sol la
    re,4 re,
    R2*2

    %32
    re'4 re
    re2
    re4 re,

    %35
    la'2
    R2*2
    re4 re

    %39
    re2\mbreak
    re4 la
    re,2

    %42
    R2*2
    fa'4 fa
    fa2

    %46
    la,4 fa
    do' do,
    do' fa

    %49
    sol la\mbreak
    sib, sol'
    la si

    %52
    do, r
    sol8 sol' fa fa,
    mi mi' re re,

    %55
    do4 r8 do'
    fa4 r8 re'
    sib4 do

    %58
    fa16 fa, mi re do sib la sol\mbreak
    fa mi fa sol la sol la sib
    do sib do re mi re mi dod

    %61
    re dod re mi fa mi fa sol
    <<{la8^\markup\italic"B[as]sons" re dod re
       la2~

       %64
       la8 re dod re
       la2}\\{la
              la,~
              la~
              la}>>
    la16\tu la' sol fa mi fa mi re

    %67
    dod re mi re dod re dod sib\mbreak
    la2~
    la~

    %70
    la16 re do sib la sib la sol
    fa sib la sol fa sol fa mi
    \clef bass \key re\major re4 r

}

XVIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/4
    \tempo 2 = 60
    \key re\major
    \repeat volta 2 {s2
    \once \override Score.RehearsalMark.extra-offset = #'(0 . 0)
    \mark\markup\smaller\center-align {\musicglyph #"scripts.segno"}
                     s2*12}
    \repeat volta 2 {s2*16}\break
    \mark\markup\huge\center-column {"2.e Tambourin"}
    \key re\minor
     \repeat volta 2 {s2*12}
    s2*30
    \bar"|."
    s2
    \mark\markup\smaller\center-column {"Dal""Segno"}

}

XVIvlI = {
    \XVIglobal
    <<\XVIvlIn \forma>>
}

XVIvlII = {
    \XVIglobal
    <<\XVIvlIIn \forma>>
}

XVIvlaI = {
    \XVIglobal
    <<\XVIvlaIn \forma>>
}

XVIbc = {
    \XVIglobal
    \clef bass
    <<\XVIbcn \forma \XVIbfn>>
}

\pointAndClickOff

\paper {

   print-first-page-number = ##t
   first-page-number = #2

}

\bookpart {

   \paper {

      systems-per-page = #2

   }

   \header {
      subtitle = \markup{Simphonie du Festin Royal - Quatrième Suite}
      composer = \markup \center-column{"Francœur arr. (1698-1787)"}
   }

   \markup \huge {[1.] Ouverture [de M. Francœur]}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[1.ers]"\vspace #-0.2"Violons"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \IvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[2.es]"\vspace #-0.2"Violons"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \IvlII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Petite"\vspace #-0.2"Flûte [I]"}
            \set Staff.midiInstrument = #"recorder"
            \set Staff.shortInstrumentName = "fl1"
            \IflI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Petite"\vspace #-0.2"Flûte [II]"}
            \set Staff.midiInstrument = #"recorder"
            \set Staff.shortInstrumentName = "fl2"
            \IflII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Hautb[ois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \IhbI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"I.er Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \IcrI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \IcrII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 2/2 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit re'8^\markup\center-align {"Alto"} [re']}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \IvlaI
            \key re\major
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \IfgI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \Ibc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 16)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

   \markup \huge {[2.] Menuet gracieux de M. Rameau}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \IIvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"I.er Hautb[ois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob1"
            \IIhbI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e Hautb[ois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob2"
            \IIhbII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"I.er Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \IIcrI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \IIcrII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit r4^\markup\center-align {"Alto"} r  la'}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \IIvlaI
            \key re\major
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons [I]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg1"
            \IIfgI
            \key re\major
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons [II]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg2"
            \IIfgII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \IIbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 17.5)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}

\bookpart {

   \paper {

      systems-per-page = #4

   }

   \markup \huge {[3.] Rondeau de M. Rameau}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Viol[ons] et"\vspace #-0.2"Hautb[ois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "vl"
            \IIIvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 2/2 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit la'4^\markup\center-align {"1.er Alto"} la'8[re'']}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla1"
            \IIIvlaI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 2/2 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit re'4^\markup\center-align {"2.e Alto"} re'8[fad']}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla2"
            \IIIvlaII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Tous"\vspace #-0.2"[Basses]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bc"
            \IIIbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}

\bookpart {

   \paper {

      systems-per-page = #3

   }

   \markup \huge {[4.] Air tendre de M. Francœur}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \IVvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Hautb[ois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \IVhbI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit re'2^\markup\center-align {"1.er Alto"} }
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla1"
            \IVvlaI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit la2^\markup\center-align {"2.e Alto"} }
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla2"
            \IVvlaII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \IVfgI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"B.C."}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \IVbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}

\bookpart {

   \paper {

      systems-per-page = #4

   }

   \markup \huge {[5.] Air Rondeau de M. Francœur}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \VvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 6/4 \override MensuralStaff.TimeSignature.style = #'numbered la'4^\markup\center-align {"1.er Alto"} }
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla1"
            \VvlaI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 6/4 \override MensuralStaff.TimeSignature.style = #'numbered  r4^\markup\center-align {"2.e Alto"} fad'2}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla2"
            \VvlaII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Tous"\vspace #-0.2"[Basses]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bc"
            \Vbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}

\bookpart {

   \paper {

      systems-per-page = #2

   }

   \markup \huge {[6.] Air gracieux de M. Granier}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[1.ers]"\vspace #-0.2"Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \VIvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[2.e]"\vspace #-0.2"Viol[ons"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \VIvlII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Hautb[ois I]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob1"
            \VIhbI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Hautb[ois II]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob2"
            \VIhbII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"I.er Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \VIcrI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \VIcrII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 2/2  re'4^\markup\center-align {"Parties"} re'8[mi']}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \VIvlaI
            \key re\major
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons [I]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg1"
            \VIfgI
            \key re\major
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Bassons [II]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg2"
            \VIfgII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basses"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \VIbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 16)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

   \markup \huge {[7.] Entrée de chasseurs de M. Dauvergne}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.ers Viol[ons]""et Hautb[ois]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \VIIvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.es Viol[ons"\vspace #-0.2"et Haut[bois]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \VIIvlII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"I.er Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \VIIcrI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \VIIcrII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 6/8\override MensuralStaff.TimeSignature.style = #'numbered  r8^\markup\center-align {"[Alto]"} r4 re'8 re'4}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \VIIvlaI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \VIIbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}

\bookpart {

   \paper {

      systems-per-page = #4

   }

   \markup \huge {[8.] Premier Rondeau de M. Francœur}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Violons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \VIIIvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit r2.^\markup\center-align {"1.er Alto"} r4 la'}
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla1"
            \VIIIvlaI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit r2.^\markup\center-align {"2.e Alto"} r4 re'}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla2"
            \VIIIvlaII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Tous"\vspace #-0.2"[Basses]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bc"
            \VIIIbc
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}

\bookpart {

   \paper {

      systems-per-page = #2

   }

   \markup \huge {[9.] 2.e Rondeau Majeur [de M. Francœur]}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \IXvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Hautb[ois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \IXhbI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit r2^\markup\center-align {"1.er Alto"} r4 fad'8 }
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla1"
            \IXvlaI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit r2^\markup\center-align {"2.e Alto"} r4 la8 }
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla2"
            \IXvlaII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Trompette"}
            \set Staff.midiInstrument = #"trumpet"
            \set Staff.shortInstrumentName = "tp"
            \IXtp
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Timbales"}
            \set Staff.midiInstrument = #"timpani"
            \set Staff.shortInstrumentName = "tmp"
            \IXtmp
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Bassons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \IXfgI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"B.C."}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \IXbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18.5)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

   \paper {

      systems-per-page = #3

   }

   \markup \huge {[10.] Rondeau gay de M. Francœur}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Viol[ons]"\vspace #-0.2"et Hautb[ois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "vl"
            \XvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 6/8 \override MensuralStaff.TimeSignature.style = #'numbered r8^\markup\center-align {"1.er Alto"} re''4. }
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla1"
            \XvlaI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 6/8 \override MensuralStaff.TimeSignature.style = #'numbered  r8^\markup\center-align {"2.e Alto"} fad'4. }
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla2"
            \XvlaII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"I.er Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \XcrI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \XcrII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Bassons"\vspace #-0.2"[et Basses]"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bc"
            \Xbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}

\bookpart {

   \paper {

      systems-per-page = #4

   }

   \markup \huge {[11.] Musette de M. Mondonville - Lent}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Hautb[ois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \XIhbI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.ers Violons"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \XIvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 2/2 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit re'4^\markup\center-align {"2.es Violons"} dod'4. }
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \XIvlII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Bassons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \XIfgI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \XIbc
         >>
      >>

      \layout {

         #(layout-set-staff-size 16.5)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
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

   \markup \huge {[12.] Rondeau de M. Mondonville}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Hautbois"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \XIIhbI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \XIIvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Bassons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \XIIfgI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basses"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \XIIbc
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

   \paper {

      systems-per-page = #2

   }

   \markup \huge {[13.] 1.er Menuet de M. Rebel}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Viol[ons]"\vspace #-0.2"et Hautb[ois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "vl"
            \XIIIvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit re''4^\markup\center-align {"1.er Alto"} re'8[re'] }
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla1"
            \XIIIvlaI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit la4^\markup\center-align {"2.e Alto"} la8[la] }
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla2"
            \XIIIvlaII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"I.er Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \XIIIcrI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \XIIIcrII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Trompette"}
            \set Staff.midiInstrument = #"trumpet"
            \set Staff.shortInstrumentName = "tp"
            \XIIItp
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Timbale"}
            \set Staff.midiInstrument = #"timpani"
            \set Staff.shortInstrumentName = "tmp"
            \XIIItmp
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"B.C."}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \XIIIbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18.5)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

   \markup \huge {[14.] 2.e Menuet de M. Francœur}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \XIVvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Haut[bois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob"
            \XIVhbI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit re'4^\markup\center-align {"1.er Alto"} re'8[re'] }
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla1"
            \XIVvlaI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit re'4^\markup\center-align {"2.e Alto"} re'8[re'] }
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla2"
            \XIVvlaII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Trompette"}
            \set Staff.midiInstrument = #"trumpet"
            \set Staff.shortInstrumentName = "tp"
            \XIVtp
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Timbale"}
            \set Staff.midiInstrument = #"timpani"
            \set Staff.shortInstrumentName = "tmp"
            \XIVtmp
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \XIVfgI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"B.C."}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \XIVbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18.5)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

   \markup \huge {[15.] Chaconne de M. Royer}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.ers Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \XVvlI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.es Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \XVvlII
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit r4^\markup\center-align {"1.er Alto"} re''4. re''8 }
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \XVvlaI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Trompette"}
            \set Staff.midiInstrument = #"trumpet"
            \set Staff.shortInstrumentName = "tp"
            \XVtp
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Timbales"}
            \set Staff.midiInstrument = #"timpani"
            \set Staff.shortInstrumentName = "tmp"
            \XVtmp
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \XVfgI
            \key re\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basses"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \XVbc
            \key re\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18.5)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\pageBreak

\bookpart {

   \paper {

      systems-per-page = #4

   }

   \markup \huge {[16.] 1.er Tambourin de M. Rameau}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.ers Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \XVIvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.es Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \XVIvlII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered r2^\markup\center-align {"1.er Alto"} r la'4}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \XVIvlaI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Tous"\vspace #-0.2"[Basses]"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \XVIbc
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 1.8\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

}