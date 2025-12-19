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

dolce = _\markup\italic"doux"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { seul }

tu = ^\markup \italic "tous"

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
        \musicglyph "scripts.prall"
    }
}


mbreak = { }


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IobIn = \relative do'' {

    sol'4 sol,4. sol'8
    si, la16 sol si8 la16 sol re'8. re16
    re4. sol8 fad-+ mi16 re

    %4
    mi4. la8 sol-+ fad16 mi
    fad4. re8 sol si,
    do4. la'16 sol fad mi re do

    %7
    do4-+ si r32 sol la si do re mi fad
    sol4. mi8 si re\mbreak
    re4-+ dod r32 la si dod re mi fad sol

    %10
    la4 la,4. la'8
    dod, si16 la dod8 si16 la sol'8. sol16
    sol4. fad16 mi fad8 mi16 re

    %13
    la'4. sol16 fad si8 la16 sol
    dod4. si16 la re8. re,16
    re8. sol16 mi4.-+ re8\mbreak

    %16
    re2 r4 re2
    la'4~la16 sol fad mi
    re mi fad sol la8 re,

    %19
    si'4. si8
    sol [mi la do]
    fad, re4 la8

    %22
    fad re re'8. re16
    re2~\mbreak
    re8 do16 si do8. do16

    %25
    do2~
    do4 si8. si16
    mi do mi sol do, sol do mi

    %28
    la, fad la re fad, re fad la
    sol8 sol16 (la32 si) la8._+ sol16
    fad mi re mi fad sol la si\mbreak

    %31
    do si la si do re mi fad
    sol fad mi fad sol la si sol
    la si do si la sol fad mi

    %34
    red si dod red mi fad sol la
    si4~si16 la sol fad
    mi fad sol la si8 mi,

    %37
    do'8. fad,16 fad8.-+ mi16\mbreak
    mi8 si' si16 mi, si' mi,
    \once\stemDown do'8 la,16 si do si la sol

    %40
    fad8 \once\stemDown la' la16 re, la' re,
    \once\stemDown si'8 sol,16 la si la sol fad
    mi8 \once\stemDown sol' sol16 do, sol' do,

    %43
    \once\stemDown la'8 fad,16 sol la sol fad mi
    red8 \once\stemDown fad' fad16 si, fad' si,\mbreak
    sol'8 sol16 fad mi re dod si

    %46
    lad si dod re mi sol fad mi
    re dod si dod re8. re16
    re8. dod16 dod8.-+ si16

    %49
    si8[si si si]
    sold8. mi16 sold8. sold16
    la8. si16 si8.-+ la32 si\mbreak

    %52
    do8[la la la]
    fad re fad8. fad16
    sol8. la16 la8._+ sol32 la

    %55
    si8 sol re'4~
    re8 si'16 re, do4~
    do8 la'16 do, si4~

    %58
    si8 sol'16 si, la8._+ la16\mbreak
    la2
    re4~re16 do si la

    %61
    sol la si do re8 sol,
    mi'4~mi16 re do si
    la si do re mi8 la,

    %64
    fad' re sol8. sol16
    sol8 la16 mi fad8.-+ mi32 fad\mbreak
    sol16 re re si si re sol, re'

    %67
    mi4 r16 do mi do
    re si si sol sol si re, si'
    do4 r16 la do la

    %70
    si re mi la, la8._+ sol16
    sol2 re'4^\markup\italic "flûte" re4. mi8 fa4
    fa mi8-+ re mi4 la8[si do si la sol]\mbreak
    fad8-+ mi re4 re\tu re4.  mi8 fa4

    %74
    fa mi8-+ re mi4 fad!8.(sol32 la) do,8.(si32 la) si8. (la32 sol)
    la2_+  la'4^\markup\italic "flûte" si8. (la32 sol) sol4  si\tu
    mi,8-+ re mi4 do^\markup\italic "flûte" do8.(si32 la) la4 re\tu

    %78
    si8._+ (la32 sol) sol4 re'^\markup\italic "flûte" mi8.(fa32 re) mi4 la\tu
    fad8.-+(mi32 re) re8. sol16 do,8._+(si32 la) si8. do16 la4._+ sol8
    sol2

}

IobIIn = \relative do'' {

    sol'4 sol,4. sol'8
    si, la16 sol si8 la16 sol re'8. re16
    re4. sol8 fad-+ mi16 re

    %4
    mi4. la8 sol-+ fad16 mi
    fad4. re8 sol si,
    do4. la'16 sol fad mi re do

    %7
    do4-+ si r32 sol la si do re mi fad
    sol4. mi8 si re\mbreak
    re4-+ dod r32 la si dod re mi fad sol

    %10
    la4 la,4. la'8
    dod, si16 la dod8 si16 la sol'8. sol16
    sol4. fad16 mi fad8 mi16 re

    %13
    la'4. sol16 fad si8 la16 sol
    dod4. si16 la re8. re,16
    re8. sol16 mi4.-+ re8\mbreak

    %16
    re2 r4 re2
    la'4~la16 sol fad mi
    re mi fad sol la8 re,

    %19
    si'4. si8
    sol [mi la do]
    fad, re4 la8

    %22
    fad re re'8. re16
    re2~\mbreak
    re8 do16 si do8. do16

    %25
    do2~
    do4 si8. si16
    mi do mi sol do, sol do mi

    %28
    la, fad la re fad, re fad la
    sol8 sol16 (la32 si) la8._+ sol16
    fad mi re mi fad sol la si\mbreak

    %31
    do si la si do re mi fad
    sol fad mi fad sol la si sol
    la si do si la sol fad mi

    %34
    red si dod red mi fad sol la
    si4~si16 la sol fad
    mi fad sol la si8 mi,

    %37
    do'8. fad,16 fad8.-+ mi16\mbreak
    mi8 [sold sold sold]
    la8 la,16 si do si la sol

    %40
    fad8 [fad' fad fad]
    sol8 sol,16 la si la sol fad
    mi8 [mi' mi mi]

    %43
    fad8 fad,16 sol la sol fad mi
    red8 [red' red red]\mbreak
    mi8 sol16 fad mi re dod si

    %46
    lad si dod re mi sol fad mi
    re dod si dod re8. re16
    re8. dod16 dod8.-+ si16

    %49
    si8[si si si]
    sold8. mi16 sold8. sold16
    la8. si16 si8.-+ la32 si\mbreak

    %52
    do8[la la la]
    fad re fad8. fad16
    sol8. la16 la8._+ sol32 la

    %55
    si8 sol re'4~
    re8 si'16 re, do4~
    do8 la'16 do, si4~

    %58
    si8 sol'16 si, la8._+ la16\mbreak
    la2
    re4~re16 do si la

    %61
    sol la si do re8 sol,
    mi'4~mi16 re do si
    la si do re mi8 la,

    %64
    fad' re sol8. sol16
    sol8 la16 mi fad8.-+ mi32 fad\mbreak
    sol16 re re si si re sol, re'

    %67
    mi4 r16 do mi do
    re si si sol sol si re, si'
    do4 r16 la do la

    %70
    si re mi la, la8._+ sol16
    sol2 si4^\markup\italic "flûte" si4. do8 re4
    sol,2.  do8[re mi re do si]\mbreak
    la8-+ sol fad4 re'\tu re4.  mi8 fa4

    %74
    fa mi8-+ re mi4 fad!8.(sol32 la) do,8.(si32 la) si8. (la32 sol)
    la2_+  fad'4^\markup\italic "flûte" sol re  si'\tu
    mi,8-+ re mi4 mi,8^\markup\italic "flûte" la la8.(sol32 fad) fad4  re'\tu

    %78
    si8._+ (la32 sol) sol4 si^\markup\italic "flûte" do8.(re32 si) do4 la'\tu
    fad8.-+(mi32 re) re8. sol16 do,8._+(si32 la) si8. do16 la4._+ sol8
    sol2

}

Idsn =  \relative do'' {

    sol'4 sol,4. sol'8
    si, la16 sol si8 la16 sol re'8. re16
    re4. sol8 fad-+ mi16 re

    %4
    mi4. la8 sol-+ fad16 mi
    fad4. re8 sol si,
    do4. la'16 sol fad mi re do

    %7
    do4-+ si r32 sol la si do re mi fad
    sol4. mi8 si re\mbreak
    re4-+ dod r32 la si dod re mi fad sol

    %10
    la4 la,4. la'8
    dod, si16 la dod8 si16 la sol'8. sol16
    sol4. fad16 mi fad8 mi16 re

    %13
    la'4. sol16 fad si8 la16 sol
    dod4. si16 la re8. re,16
    re8. sol16 mi4.-+ re8\mbreak

    %16
    re2 r4 re2
    la'4~la16 sol fad mi
    re mi fad sol la8 re,

    %19
    si'4. si8
    sol [mi la do]
    fad, re4 la8

    %22
    fad re re'8. re16
    re2~\mbreak
    re8 do16 si do8. do16

    %25
    do2~
    do4 si8. si16
    mi do mi sol do, sol do mi

    %28
    la, fad la re fad, re fad la
    sol8 sol16 (la32 si) la8._+ sol16
    fad mi re mi fad sol la si\mbreak

    %31
    do si la si do re mi fad
    sol fad mi fad sol la si sol
    la si do si la sol fad mi

    %34
    red si dod red mi fad sol la
    si4~si16 la sol fad
    mi fad sol la si8 mi,

    %37
    do'8. fad,16 fad8.-+ mi16\mbreak
    mi8 r r4
    r8 la,16 si do si la sol

    %40
    fad8 r r4
    r8 sol16 la si la sol fad
    mi8 r r4

    %43
    r8 fad16 sol la sol fad mi
    red8 r r4\mbreak
    r8 sol'16 fad mi re dod si

    %46
    lad si dod re mi sol fad mi
    re dod si dod re8. re16
    re8. dod16 dod8.-+ si16

    %49
    si8[si si si]
    sold8. mi16 sold8. sold16
    la8. si16 si8.-+ la32 si\mbreak

    %52
    do8[la la la]
    fad re fad8. fad16
    sol8. la16 la8._+ sol32 la

    %55
    si8 sol re'4~
    re8 si'16 re, do4~
    do8 la'16 do, si4~

    %58
    si8 sol'16 si, la8._+ la16\mbreak
    la2
    re4~re16 do si la

    %61
    sol la si do re8 sol,
    mi'4~mi16 re do si
    la si do re mi8 la,

    %64
    fad' re sol8. sol16
    sol8 la16 mi fad8.-+ mi32 fad\mbreak
    sol16 re re si si re sol, re'

    %67
    mi4 r16 do mi do
    re si si sol sol si re, si'
    do4 r16 la do la

    %70
    si re mi la, la8._+ sol16
    sol2 r1
    r1.
    r2 re'4 re4.  mi8 fa4

    %74
    fa mi8-+ re mi4 fad!8.(sol32 la) do,8.(si32 la) si8. (la32 sol)
    la2_+ r2 r4 si'
    mi,8-+ re mi4 r2 r4 re

    %77
    si8._+ (la32 sol) sol4 r2 r4 la'
    fad8.-+(mi32 re) re8. sol16 do,8._+(si32 la) si8. do16 la4._+ sol8
    sol2

}

Ihcn = \relative do'' {

    re,4 re4. re8
    sol4 sol4. sol8
    sol la16 si sol8 la16 si la8-+ sol16 fad

    %4
    sol4. do8 si la16 sol
    la8 la re fad, sol4
    sol fad4._+ fad8

    %7
    sol2 r16 r32 re mi fad sol la
    si4. si8 si sold\mbreak
    la4 la4. mi8

    %10
    fad4 fad8 mi fad la
    sol4. dod8 dod re16 mi
    la,4 re4. re8

    %13
    re4. re8 re do?16 si
    mi4. re16 dod la8. dod16
    si8 mi dod4.-+ re8\mbreak

    %16
    re2 r4 re2
    R2*4
    la4~la16 sol fad mi

    %22
    re mi fad sol la8 re,
    si'4. si8\mbreak
    si[sol sol sol]

    %25
    la16 sol la si la8 la
    la sol16 fad sol8. sol16
    do sol do mi la, mi la do

    %28
    fad, re fad la re,8 re
    re4 mi8 mi
    re16 la si dod re mi fad sol\mbreak

    %31
    la mi fad sol la si do la
    si la sol la si dod re si
    mi8 mi16 re do?8 do

    %34
    si4. si8
    mi[si si si]
    sol[do si si]

    %37
    la [do si la]\mbreak
    sold r r4
    r8 la16 si do si la sol

    %40
    fad8 r r4
    r8 sol16 la si la sol fad
    mi8 r r4

    %43
    r8 fad16 sol la sol fad mi
    red8 r r4\mbreak
    r8 si'[si sol]

    %46
    fad16 sold lad si dod lad si dod
    fad,4. si8
    si4 lad8. si16

    %49
    si8 fad16 mi red fad mi red
    mi4. mi8
    mi la sold8._+ fad32 sold\mbreak

    %52
    la8 mi16 re dod mi re dod
    re4. re8
    re sol fad8._+ mi32 fad

    %55
    sol8 si la16 sol fad la
    sol fad mi fad sol si la sol
    fad mi re mi fad la sol fad

    %58
    mi fad sol4 fad16_+ mi\mbreak
    fad8 la16 sol la si do la
    si8 si la fad

    %61
    sol8. la16 si8 re
    re do16 si do8 sol
    sol4. do16 si

    %64
    la4 si
    do8 si la si16 do\mbreak
    si8 sol r16 sol sol sol

    %67
    sol4 r16 la la la
    la8 re, r16 sol sol sol
    fad4 r16 fad fad la

    %70
    sol8 sol fad8._+ sol16
    sol2 sol4 sol2 si,4
    do2. la4 la la\mbreak

    %73
    re2 si'4 si4. do8 re4
    re do8-+ si do4 do8 si la4 sol
    fad2 re'4 sol, si re

    %76
    do2 la,4 re2 la'4
    sol re sol do,2 do'4
    la si fad sol fad4._+ sol8

    %79
    sol2

}

Itln =  \relative do' {

    si4 si4. si8
    re do16 si re8 do16 si si8 la16 sol
    re'4 re4. re8

    %4
    si4 mi4. mi8
    re4. la8 si re
    mi4 re4. re8

    %7
    re2 r4
    sol sol mi\mbreak
    mi4. mi8 re dod

    %10
    re4 re4. fad8
    mi re16 dod mi8 re16 dod mi8 re16 dod
    re4 la'4. la8

    %13
    la sol16 fad la4 sol8 la16 si
    la4. mi8 [fad8. la16]
    sol8 si la4 sol\mbreak

    %16
    fad2 r4 fad2
    R2
    re4~re16 do si la

    %19
    sol la si do re8 sol,
    mi'4 do8 la
    re4. re8

    %22
    do16 si la sol fad8 sol16 fad
    sol8[sol sol sol]\mbreak
    sol8. si16 mi8 mi

    %25
    mi4 re
    re4. sol,8
    sol sol'16 fad mi8 mi

    %28
    re re la la
    si [sol la la]
    la [fad fad re]\mbreak

    %31
    mi4 mi'8 mi
    mi4 mi8 si
    do4 mi8 la

    %34
    fad8. si,16 dod red mi fad
    sol8 fad16 mi red8 mi~
    mi16 red mi fad sol8 sol

    %37
    sol fad16 mi mi8 red\mbreak
    mi r r4
    r8 la16 si do si la sol

    %40
    fad8 r r4
    r8 sol16 la si la sol fad
    mi8 r r4

    %43
    r8 fad16 sol la sol fad mi
    red8 r r4\mbreak
    r8 mi[mi mi]

    %46
    dod4~dod16 dod si lad
    si4. fad'8
    sol sol fad mi

    %49
    red4 si
    si4. si8
    do[fa mi mi]~\mbreak

    %52
    mi4. la,8
    la4. la8
    si mi re8. re16

    %55
    re8 re16 mi fad8 fad
    si,4 mi
    la, re

    %58
    sol, mi'\mbreak
    re8 fad16 mi fad sol la fad
    sol4 re

    %61
    si8. la16 sol8 sol'
    sol4 mi
    mi4. mi8

    %64
    re4 re8 re
    mi4 re8 re\mbreak
    re4 r16 si re si

    %67
    do4 r16 mi mi fad
    sol4 r16 re re re
    re4 r16 re re re

    %70
    re8 do do do
    si2 sol'4 sol2 si,4
    do2. la4 la la\mbreak

    %73
    re2 sol4 sol2 sol4
    sol2. la4 re, re
    re2 re'4 sol, si sol

    %76
    sol2 la,4 re2 fad4
    re si sol' do,2 mi4
    re sol la re, re4. re8

    %79
    re2

}


Ifgn = \relative do {

    sol2 r4
    sol' sol,4. sol'8
    si, la16 sol si8 la16 sol re'8. re16

    %4
    re8 do16 si do4. do8
    do2 si4
    la re re,

    %7
    sol8 re' sol la sol fad
    mi re mi fad sold mi\mbreak
    la sold la si la sol

    %10
    fad re fad la fad re
    la'4 la, r
    re' re,4. re'8

    %13
    fad, mi16 re fad8 mi16 re sol8. sol16
    sol2 fad4
    sol la la,\mbreak

    %16
    re16 re' do si la sol fad mi re do si la re2
    R2*5
    re4~re16 do si la

    %23
    sol la si do re8 sol,\mbreak
    mi'16 re mi fad mi sol do mi,
    fad mi fad sol fad la re fad,

    %26
    sol fad sol la sol fa mi re
    do8[do do do]
    do[do do do]

    %29
    si[si do dod]
    re[re re re]\mbreak
    la[la la la]

    %32
    mi'[mi mi re]
    do[do do la]
    si'4~si16 la sol fad

    %35
    mi fad sol la si8 mi,
    do'4 sol8 sol
    la[la si si,]\mbreak

    %38
    mi[mi mi mi]
    la,8 la'16 si do si la sol
    fad8[re re re]

    %41
    sol,8 sol'16 la si la sol fad
    mi8[do do do]
    fad,8 fad'16 sol la sol fad mi

    %44
    red8[si si si]\mbreak
    mi,8 mi'16 fad sol8 mi
    fad4~fad16 mi re dod

    %47
    si dod re mi fad8 si,
    sol'[mi fad fad,]
    si'4~si16 la sold fad

    %50
    mi fad sold la si8 mi,
    do' re mi mi,\mbreak
    la4~la16 sol fad mi

    %53
    re mi fad sol la8 re,
    si' do re re,
    sol4 fad8 re'16 fad,

    %56
    mi4. do'16 mi,
    re4. sol16 si,
    do4 dod\mbreak

    %59
    re8 re'16 mi re8 do
    si [sol fad re]
    mi4 si

    %62
    do8 do' do4~
    do8 la16 si do4~
    do8 do si sol

    %65
    do[la re re,]\mbreak
    sol4 r16 sol si sol
    do sol sol mi mi la do, la'

    %68
    si4 r16 sol si sol
    la fad fad re re fad la, fad'
    sol8 do, re re,

    %71
    sol2 r1
    R1.
    r2 sol'4 si4. la8 sol4

    %74
    do2. la4 fad sol
    re2 r2 r4 sol
    do2 r2 r4 re,

    %77
    sol2 r2 r4 do,4
    do si la sol re' re,
    sol2

}


Ibcn = \relative do {

    sol2 r4
    sol' sol,4. sol'8
    si, la16 sol si8 la16 sol re'8. re16

    %4
    re8 do16 si do4. do8
    do2 si4
    la re re,

    %7
    sol8 re' sol la sol fad
    mi re mi fad sold mi\mbreak
    la sold la si la sol

    %10
    fad re fad la fad re
    la'4 la, r
    re' re,4. re'8

    %13
    fad, mi16 re fad8 mi16 re sol8. sol16
    sol2 fad4
    sol la la,\mbreak

    %16
    re16 re' do si la sol fad mi re do si la re2
    R2*5
    re4~re16 do si la

    %23
    sol la si do re8 sol,\mbreak
    mi'16 re mi fad mi sol do mi,
    fad mi fad sol fad la re fad,

    %26
    sol fad sol la sol fa mi re
    do8[do do do]
    do[do do do]

    %29
    si[si do dod]
    re[re re re]\mbreak
    la[la la la]

    %32
    mi'[mi mi re]
    do[do do la]
    si'4~si16 la sol fad

    %35
    mi fad sol la si8 mi,
    do'4 sol8 sol
    la[la si si,]\mbreak

    %38
    mi r r4
    r8 la16 si do si la sol
    fad8 r r4

    %41
    r8 sol16 la si la sol fad
    mi8 r r4
    r8 fad16 sol la sol fad mi

    %44
    red8 r r4\mbreak
    r8 mi16 fad sol8 mi
    fad4~fad16 mi re dod

    %47
    si dod re mi fad8 si,
    sol'[mi fad fad,]
    si'4~si16 la sold fad

    %50
    mi fad sold la si8 mi,
    do' re mi mi,\mbreak
    la4~la16 sol fad mi

    %53
    re mi fad sol la8 re,
    si' do re re,
    sol4 fad8 re'16 fad,

    %56
    mi4. do'16 mi,
    re4. sol16 si,
    do4 dod\mbreak

    %59
    re8 re'16 mi re8 do
    si [sol fad re]
    mi4 si

    %62
    do8 do' do4~
    do8 la16 si do4~
    do8 do si sol

    %65
    do[la re re,]\mbreak
    sol4 r16 sol si sol
    do sol sol mi mi la do, la'

    %68
    si4 r16 sol si sol
    la fad fad re re fad la, fad'
    sol8 do, re re,

    %71
    sol2 r1
    R1.
    r2 sol'4 si4. la8 sol4

    %74
    do2. la4 fad sol
    re2 r2 r4 sol
    do2 r2 r4 re,

    %77
    sol2 r2 r4 do,4
    do si la sol re' re,
    sol2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    s
    <6>
    <2>4 <6 5>2
    <4\+> <6>4
    <7> <7> s
    <4> <3> s
    s2 <5/>4
    <4> <_+>2
    <6>2.
    <_+>2 <7>4
    <4> s <3>
    <6> s <6 5>
    <4\+>2 <6>4
    <6 5> <_+> <7 _+>
    s2. s2
    s2*6
    \bassFigureExtendersOn <_>4 <_>8 s\bassFigureExtendersOff
    <7>4 <6>
    <7> <6 5/>
    <4 9> <3>
    <6 5>2
    <4\+>
    \bassFigureExtendersOff <6>4 <6 5>
    s2*3
    <6\\>2
    <_+>
    \bassFigureExtendersOn <_>4 <_>8 s\bassFigureExtendersOff
    s4 <6>
    <7 5>8 <6> <4> <7 _+>
    <_+>2
    s2
    <5/>
    s
    <6 5>
    <7>
    <5/>
    s4 <6\\>
    <_+>2
    \bassFigureExtendersOn <_>4 <_>8 s\bassFigureExtendersOff
    s8 <6\+ 5> <_+>4
    <_+>4 s
    \bassFigureExtendersOn <_+>4 <_+>8 s\bassFigureExtendersOff
    <6>8 <6 5 _-> <_+> s
    s2
    \bassFigureExtendersOn <_>4 <_>8 s\bassFigureExtendersOff
    <6>8 <6 5> s4
    s <6>
    <7> <6\\>
    <7> <6 4>
    <7> <5/>
    s2
    <6>4 <6>
    s <6>
    s2
    <6 5>
    <4\+>4 <6>
    <6 5>2
    s
    <6 5>
    <6>
    <6\\>
    s8 <6 5> <4> <7>
    s1.*2
    s2 s4 <5/>2.
    <4>2 <3>4 <6\\> <5/>2
    s1.*2
    s1 s4 <6 5>
    <4\+> <6> <6\\>

}

forma = {

    \key sol\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 55
    \repeat volta 2 {s2.*15}
    \alternative {{s2.}{\time 2/4 \tempo 2 = 55 s2}}\break
    \set Score.currentBarNumber = #17
    \once \override Score.RehearsalMark.extra-offset = #'(0 . +1) \mark\markup\italic "Vivement"
    \repeat volta 2{
        s2*54\break
        \time 6/4
        \tempo 2 = 50
        s1.*8
        \time 2/2
        \set Score.measureLength = #(ly:make-moment 2 4)
        s2
    }
    \bar":|."

}

IobI = {
    \Iglobal
    <<\IobIn \forma>>

}

IobII = {
    \Iglobal
    <<\IobIIn \forma>>

}

Ids = {
    \Iglobal
    <<\Idsn \forma>>

}

Ihc = {
    \Iglobal
    <<\Ihcn \forma>>

}

Itl = {
    \Iglobal
    \clef alto
    <<\Itln \forma>>

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

}\version "2.24.0"


IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \senza
}

IIdsn =  \relative do'' {

    sol'8.(la32 si) re,4 mi
    mi-+ re2
    la8 do si la sol_+ fad

    %4
    sol_+ (fad) sol2
    la8 do si la sol_+ fad
    sol la si do re4

    %7
    sol \appoggiatura fad8 mi4 la
    \appoggiatura sol8 fad4 \appoggiatura mi8 re4 la'
    si \appoggiatura la8 sol4 \appoggiatura fad8 mi4\mbreak

    %10
    la dod,-+ re
    \tuplet 3/2 { mi8 la, mi' fad[la, fad'] sol la fad }
    mi4-+ \appoggiatura re8 dod4 re

    %13
    \tuplet 3/2 { mi8 la, mi' fad[la, fad'] sol la fad }
    mi4-+ \appoggiatura re8 dod4 re~
    re8 si' mi,4.-+ re8

    %16
    re4. re8 fad,16 mi re8\mbreak
    mi4. mi'8 sol,16 fad mi8
    fad4. re'8 fad,16 mi re8

    %19
    sol16 la si8 mi,4._+ re8
    re2.
    re'8 do si la sol fa']

    %22
    mi re do si do4\mbreak
    mi8 fa do4 si-+
    la2 r4

    %25
    la'8 sol fad? mi re do
    si4-+ \appoggiatura la8 sol4 sol'~
    sol8 mi la sol fad mi

    %28
    red4-+ \appoggiatura do8 si si' sol do,
    do4-+ si8 fad' la fad
    sol mi fad red mi4~\mbreak

    %31
    mi8 fad fad4.-+ mi8
    mi re16 do si la sol fad mi8 mi'
    re do16 si la sol fad mi re8 do'

    %34
    do4-+ si8 re sol si,
    si4-+ la8 do mi sol,
    sol4_+ fad re'

    %37
    re16(mi re8) mi,8 do' mi, do'
    do16 re do8 re, si' re, si'\mbreak
    si16(do si8) do, la' do, la'

    %40
    la16 sol fad8 sol16 la si8 la16 si do8
    si16 la sol8 re'16 do si8 mi16 re do8
    fad16 mi re8 sol4 r8 r16 re

    %43
    mi8. sol,16 la4 fad_+
    sol2.

}

IIhcn = \relative do'' {

    si4. la8 sol do
    do4-+ si sol
    sol fad re

    %4
    si2 sol'4
    sol fad re
    re2 r8 re'

    %7
    re4 re dod-+
    re la re
    re4. mi8 dod4\mbreak

    %10
    re sol, la
    la la \tuplet 3/2 { si8 dod re }
    dod4 la la

    %13
    la la \tuplet 3/2 { si8 dod re }
    dod4 la4. re8
    re4 dod4. re8

    %16
    re dod16 si la sol fad mi re4\mbreak
    la'8 sol16 fad mi re dod si la4
    re'8 dod16 si la sol fad mi re4

    %19
    re dod4. re8
    re2.
    si'8 la sol la si4

    %22
    si la8 sold la4\mbreak
    la la sold
    la2 r4

    %25
    la la la
    sol re si'~
    si la4. la8

    %28
    la4 sol8 fad sol4
    fad2 si4
    si2 si4\mbreak

    %31
    do8 la si4 fad
    sol4. si8 si si
    la4. la8 la la

    %34
    sol4. sol8 sol sol
    sol4 mi mi
    re2 si'4

    %37
    si sol sol
    la fad fad\mbreak
    sol mi mi

    %40
    fad re re
    re8. sol16 sol4. la8
    la4_+ sol r8 r16 si

    %43
    sol8. si,16 re4 re
    re2.

}

IItln =  \relative do' {

    re4 sol sol
    sol2 re4
    mi re8 do si la

    %4
    sol4. la8 si4
    mi re8 do si la
    si do re mi fad4

    %7
    si, la la
    la re fad
    sol si la\mbreak

    %10
    la8 re, mi4 fad
    dod re si
    la mi' fad

    %13
    sol fad re
    la' mi fad
    si la sol

    %16
    fad16 re' dod si la sol fad mi re4\mbreak
    la'8 sol16 fad mi re dod si la4
    re'8 dod16 si la sol fad mi re8 la

    %19
    si4 la la
    la2.
    sol'4 re re

    %22
    mi2 mi8 do\mbreak
    do8 si re4 re
    do2 r4

    %25
    re re re
    re2 mi4
    mi mi do

    %28
    si4. red8 mi4
    la2 red,4
    mi8 sol red fad si, mi\mbreak

    %31
    mi4 red4.-+ mi8
    mi4. sol,8 sol sol
    re'4. re8 re re

    %34
    re4. re8 re re
    mi4 do la
    la2 sol4

    %37
    sol do mi
    fad, si si\mbreak
    mi, la do

    %40
    re si do16 si la8
    sol8. si16 si8 re do4
    do-+ si r8 r16 sol

    %43
    sol8. sol16 fad4 do'
    si2.

}

IIbcn = \relative do {

    sol'4 si, do
    sol8 sol' si re si sol
    do4 re re,

    %4
    mi2 si4
    do re re,
    sol sol' fad

    %7
    mi la la,
    re8 re fad la fad re
    sol2 sol4\mbreak

    %10
    fad mi re
    la' re sol,
    la sol fad

    %13
    dod re sol
    sol2 fad4
    sol la la,

    %16
    re8 dod16 si la sol fad mi re4\mbreak
    la''8 sol16 fad mi re dod si la4
    re'8 dod16 si la sol fad mi re4

    %19
    si'8 sol la4 la,
    re8 dod16 si la sol fad mi re4
    sol'2 sol4

    %22
    sold mi la\mbreak
    do,8 re mi4 mi,
    la8 la' do si la sol

    %25
    fad4 re fad
    sol2 mi4
    la do la

    %28
    si2 mi,4
    red2 si4
    mi8 si' la si sol si\mbreak

    %31
    la do si4 si,
    mi4. mi8 sol mi
    fad4. re8 fad re

    %34
    sol4. sol,8 si sol
    do2 dod4
    re2 si4

    %37
    mi2 mi4
    re2 re4\mbreak
    do2 do4

    %40
    si2 fad4
    sol si do
    re mi r8 r16 si

    %43
    do8 mi re4 re,
    sol2.

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6 4>4 <6>2
    <6 5>4 <6 4> <7>
    s2 <6>4
    <6 5> <6 4> <7>
    s2 <6>4
    <7> <4> <7 _+>
    s2.
    <6 5>2 <4+ 6>4
    <6> <6\\+> s
    <_+> s <6 5>
    <_+> s <6>
    <5/> s <5>
    <4\+>2 <6>4
    <6 5> <_+> <7 _+>
    s2.
    <_+>
    s
    <6\\>4 <_+> s
    s2.
    s
    <5/>
    <6>8 <6 5 _-> <6 4>4 <7 _+>
    s2.
    <5/>
    s
    <9>4 <6\\> s
    <_+>2 <6>4
    <7> <6 5/> s
    s <_+> <6>
    <6 5> <_+> s
    s2.
    <5/>
    <4>4 <3> s
    <7> <6 5> s
    <4> <3> <6>
    <7> <6\\> s
    <7> <6\\> s
    <7> <6\\> s
    <7> <6> <5/>
    s <6> <6 5>
    s s s8. <6>16
    <6 5>4 s <7>

}

forma = {

    \key sol\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 50
    s2.*20
    \bar ":..:"
    s2.*24
    \bar":|."


}

IIds = {
    \IIglobal
    <<\IIdsn \forma>>

}

IIhc = {
    \IIglobal
    <<\IIhcn \forma>>

}

IItl = {
    \IIglobal
    \clef alto
    <<\IItln \forma>>

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

IIIdsn =  \relative do'' {

    re4
    sol sol,2 sol'4
    fad8 mi re2 mi4
    do do do do

    %4
    si8 la sol4. la8 si do
    re4 re re re
    sol8 fad mi re dod si' la sol

    %7
    fad mi re4 mi dod
    re re,2 la'4
    si8 la sol4 do8 si la4

    %10
    si8 la sol4 re'8 do si4
    mi mi8(fad16 sol) fad4-+ mi
    red-+ \appoggiatura do8 si4 mi8 fad sol4

    %13
    la,8 si do4 sol la_+
    si2 mi4 sol,
    la8 si do4 sol fad_+\mbreak

    %16
    mi mi'2 do'8 mi,
    mi4-+ re2 la'8 do,
    do4-+ si2 re4

    %19
    do8 re si do la si sol la
    fad sol mi fad re4 re'
    sol re8 do si la sol4

    %22
    mi' do8 si la sol fad4
    re' si8 sol la4 fad_+
    sol2.

}

IIIhcn = \relative do'' {

    si4
    si8 la si2 la4
    la8-+ sol la4 si sol
    sol2 fad_+

    %4
    sol4 re sol sol
    la8_+ sol la4. do8 si la
    si la sol fad mi4 re8 dod

    %7
    re4 sol sol sol
    fad2.\mbreak fad4
    sol2 la8 sol fad4

    %10
    re sol sol sol
    sol sol8 (la16 si) la4_+ sol
    fad fad sol8 la si4

    %13
    fad8 sol la4 mi fad
    red mi8 fad sol4. fad8
    mi4 mi mi red\mbreak

    %16
    mi si'2 la8 sol
    la4 la2 fad4_+
    sol sol2 la4

    %19
    sol fad mi mi
    re la la la'
    si si8 la sol2~

    %22
    sol4 la8 sol fad mi re4
    sol re mi re
    re2.

}

IIItln =  \relative do' {

    sol'8 re
    mi4 mi re mi
    re8 mi fad4 sol do,8 re
    mi4 mi la, re

    %4
    re2. re4
    re2. re4
    re si la la

    %7
    la si si la
    la2. \mbreak re4
    re2 re4 re

    %10
    re8 do si4 si re
    do do do do
    si red mi si

    %13
    do fad,4 sol do
    fad,_+ si si si
    do do si si\mbreak

    %16
    si sol'2 do,4
    do do2 re4
    re re2 re4

    %19
    mi si do la
    la sol fad fad'
    re sol sol, re'

    %22
    do do re la
    si si do la
    si2.

}

IIIbcn = \relative do {

    sol'8 fad
    mi4 mi si do
    re re, si' do8 si
    la4 si8 do re4 re,

    %4
    sol sol' si sol
    fad2. fad4
    mi fad8 sol la4 la,

    %7
    re si sol la
    re,2. re'4
    sol2 fad

    %10
    sol4 sol, si sol
    do2 la
    si4 si'8 la sol4 mi

    %13
    red2 mi4 do-+
    si si'8 la sol fad mi re
    do si la4 si si\mbreak

    %16
    mi,8 mi' sol si sol4 mi
    fad8 re fad la fad4 re
    sol8 re sol si sol4 fad

    %19
    mi re do dod
    re2~re8 mi do re
    si2 r4 si

    %22
    do do do do
    si sol' do, re
    sol,2.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2 <6>4 <6 5>
    s2 <6>
    <7> <7>
    s1
    <6>
    <7>2 <7 _+>
    s <6 5>4 <_+>
    s1
    s2 <5/>
    s1
    <7>2 <6 5>
    <_+> <6>
    <7> s4 <6\\>
    <_+>2 <6>
    <6\\> <6 4>4 <7 _+>
    \bassFigureExtendersOn <_>4 <_>8 <_>\bassFigureExtendersOff s4 <6>
    <7> <6 5/> s2
    <4>4 <3> s2
    <6>4 <6 4> <6> <5/>
    s1
    <6>
    <6 5>2 <4+>
    <6>2 <6 5>

}

forma = {

    \key sol\major
    \time 2/2
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 60
    \partial 4 s4
    s1*7
    s2.
    \bar ":..:"
    s4
    s1*15
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2.
    \bar":|."

}

IIIds = {
    \IIIglobal
    <<\IIIdsn \forma>>

}

IIIhc = {
    \IIIglobal
    <<\IIIhcn \forma>>

}

IIItl = {
    \IIIglobal
    \clef alto
    <<\IIItln \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}



IVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVobIn =  \relative do'' {

    re4
    do mib re8 mib do re
    sib4-+ la8 sib sol4 re'
    mib8 re do4 fad8 sol la do,

    %4
    sib4-+ la2 re4
    do mib re8 mib do re
    sib4-+ la8 sib sol4 mib'

    %7
    mib8 re la' la, do4.-+(sib16 do)
    re2.\mbreak fa4
    fa, fa fa fa'

    %10
    fa, fa fa fa'
    fa, re' do sib
    la8_+ sol fa2 la4

    %13
    sib fa' r sib,
    do fa r do
    re8 fa mib re do4.-+ sib8

    %16
    sib2. re4\mbreak
    do8 re mib2 re8 do
    sib8 la sol2 la4

    %19
    sib8 la sol la sib do re sol
    fad4.-+ mi8 re4 sib
    la8 sib do sib la4 sib

    %22
    la8_+ sol la2 re4
    do8 re sib do la4._+ sol8
    sol2.

}

IVfgn = \relative do {

    sib'4
    la do sib8 sol la fad
    sol4 re sib sib'~
    sib la4. sol8 fad la

    %4
    sol4 fad2 sib4
    la do sib8 sol la fad
    sol4 re sib sib'

    %7
    la re, sol8 sib la sol
    fad4 la, re,\mbreak re''
    re8 do re mib re fa, re' fa,

    %10
    do' sib do re do fa, do' fa,
    re'4 fa mib re
    do8 sib la sib do4 fa,

    %13
    r sib re fa
    r do la fa
    r8 re' do sib fa4 la-+

    %16
    sib fa sib, sib'\mbreak
    la8 sib do sib la4 la
    re, sib'8 la sib4 re,

    %19
    re sib' re, sib'
    la8 sib la sol fad4 sol
    fad8 sol la sol fad4 sol

    %22
    fad8 mi fad2 sib4
    la8 sib sol la re,4 fad
    sol re sol,

}

IVbcn = \relative do {

    sol'4
    mib do re re,
    sol2. sol'4
    do,2 re

    %4
    sol,4 re re' sib
    mib do re re,
    sol2. sol'4

    %7
    fad fa mi mib
    re2.\mbreak sib4
    sib2. sib'4

    %10
    la2. la4
    sib sib, mib sib
    fa'2 mib

    %13
    re2 r4 re
    la2 r4 la
    sib mib fa fa,

    %16
    sib do re sib\mbreak
    fa2 fad
    sol2. fad4

    %19
    sol2. sol4
    re'2. re4
    mib2. re4

    %22
    do2. sib4
    do2 re
    sol,2.

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    <6\\> s <6 4> <7 _+>
    s1
    <9 _->4 <8> <7 _+>2
    s4 <_+> s <6>
    <6\\>2 <6 4>4 <7 _+>
    s2 s4 <6->
    <7> <6\\> <7> <6>
    <_+>1
    s
    <5/>
    s2 <6 5>
    \bassFigureExtendersOn <_>2 <_>4 <_>\bassFigureExtendersOff
    <6>1
    <5/>
    s4 <6 5> <4> <7>
    \bassFigureExtendersOn <_>2 <_>4 <_>\bassFigureExtendersOff
    s2 <7>4 <6 5/>
    s2 s4 <5/>
    s1
    <_+>2. <6 4>4
    <2\+>2 s4 <6 4>
    <4\+>2. <6>4
    <6 5 _->2 <4>4 <7 _+>

}

forma = {

    \key fa\major
    \time 2/2
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 60
    \partial 4 s4
    s1*7
    s2.
    \bar ":..:"
    s4
    s1*15
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2.
    \bar":|."
    \once \override Score.RehearsalMark.extra-offset = #'(-5 . 0)
    \mark\markup\smaller\italic "au premier"

}

IVobI = {
    \IVglobal
    <<\IVobIn \forma>>

}

IVfg = {
    \IVglobal
    \clef bass
    <<\IVfgn \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}



Vglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VobIn = \relative do'' {

    sol'8
    re4 re8 re mi re
    sol,4. la_+
    si4 si8 si la si

    %4
    la4 re,8 re'4 re,8
    re' do si mi4 mi,8
    mi' re dod la'4 la,8

    %7
    la' sol fad mi fad re
    dod si la sib la sol\mbreak
    fad mi re sib' la sol

    %10
    fad mi re la''4 re,8
    sol la fad mi4.-+
    re~re4 la'8

    %13
    fad mi re la'4 do,8
    si la sol r4 si'8
    sol fad mi do'4 mi,8

    %16
    red dod si si'4.\mbreak
    si,8 do si si do si
    fad'4. la

    %19
    si,8 do si si do si
    sol'4. si
    si,8 do si si do si

    %22
    red4. mi
    do8 si la fad4._+
    mi8 mi' mi, mi4._+

    %25
    fad8 re' fad, fad4._+\mbreak
    sol8 re' sol, sol4._+
    la8 re la la4._+

    %28
    si8 la sol sol'4 sol8
    sol fad mi sol re sol
    mi re do la'4 la8

    %31
    la sol fad la mi la
    fad mi re re'4 re8
    re do si mi,, fad sol

    %34
    la4 la8 do'4 do8
    do si la re,, mi fad
    sol4 sol8 si'4 si8

    %37
    si la sol la8 si la
    re, mi fad sol4 sol,8
    do re si la4._+

    %40
    sol8 sol' sol, sol sol' sol,
    mi' sol sol, sol sol' sol,
    fad' mi re sol4 sol,8

    %43
    do re si la4._+
    sol~sol4

}

VobIIn = \relative do'' {

    sol'8
    re4 re8 re mi re
    sol,4. la_+
    si4 si8 si la si

    %4
    la4 re,8 re'4 re,8
    re' do si mi4 mi,8
    mi' re dod la'4 la,8

    %7
    la' sol fad mi fad re
    dod si la sib la sol\mbreak
    fad mi re sib' la sol

    %10
    fad mi re la''4 re,8
    sol la fad mi4.-+
    re~re4 la'8

    %13
    fad mi re la'4 do,8
    si la sol r4 si'8
    sol fad mi do'4 mi,8

    %16
    red dod si si'4.\mbreak
    si,8 do si si do si
    fad'4. la

    %19
    si,8 do si si do si
    sol'4. si
    si,8 do si si do si

    %22
    red4. mi
    do8 si la fad4._+
    mi8 mi' mi, mi4._+

    %25
    fad8 re' fad, fad4._+\mbreak
    sol8 re' sol, sol4._+
    la8 re la la4._+

    %28
    si8 la sol re'8 do si
    mi re do sol' re sol
    mi re do mi re dod

    %31
    fad mi re la' mi la
    fad mi re si'4 si8
    si la sol mi, fad sol

    %34
    la4 la8 la'4 la8
    la sol fad re, mi fad
    sol4 sol8 sol'4 sol8

    %37
    sol fad mi la8 si la
    re, mi fad sol4 sol,8
    do re si la4._+

    %40
    sol8 sol' sol, sol sol' sol,
    mi' sol sol, sol sol' sol,
    fad' mi re sol4 sol,8

    %43
    do re si la4._+
    sol~sol4

}

Vdsn =  \relative do'' {

    sol'8
    re4 re8 re mi re
    sol,4. la_+
    si4 si8 si la si

    %4
    la4 re,8 re'4 re,8
    re' do si mi4 mi,8
    mi' re dod la'4 la,8

    %7
    la' sol fad mi fad re
    dod si la sib la sol\mbreak
    fad mi re sib' la sol

    %10
    fad mi re la''4 re,8
    sol la fad mi4.-+
    re~re4 la'8

    %13
    fad mi re la'4 do,8
    si la sol r4 si'8
    sol fad mi do'4 mi,8

    %16
    red dod si si'4.\mbreak
    si,8 do si si do si
    fad'4. la

    %19
    si,8 do si si do si
    sol'4. si
    si,8 do si si do si

    %22
    red4. mi
    do8 si la fad4._+
    mi8 mi' mi, mi4._+

    %25
    fad8 re' fad, fad4._+\mbreak
    sol8 re' sol, sol4._+
    la8 re la la4._+

    %28
    si8 la sol r4 r8
    r4 r8 sol' re sol
    mi re do r4 r8

    %31
    r4 r8 la' mi la
    fad mi re r4 r8
    r4 r8 mi, fad sol

    %34
    la4 la,8 r4 r8
    r4 r8 re mi fad
    sol4 sol,8 r4 r8

    %37
    r4 r8 la''8 si la
    re, mi fad sol4 sol,8
    do re si la4._+

    %40
    sol8 sol' sol, sol sol' sol,
    mi' sol sol, sol sol' sol,
    fad' mi re sol4 sol,8

    %43
    do re si la4._+
    sol~sol4

}

Vhcn = \relative do'' {

    r8
    R2.
    r4 r8 r4 fad,8
    sol4 sol8 sol4 sol8

    %4
    fad4. la
    sol si
    la re4 re8

    %7
    si4. si
    la8 mi fad sol fad mi\mbreak
    re mi fad sol fad mi

    %10
    re4. re8 mi fad
    dod4 re8 re4 dod8
    re4.~re4 r8

    %13
    re'4 la8 re,4 fad8
    sol4. r4 si8
    si la sol la4 la8

    %16
    la4.~la8 sol fad\mbreak
    sol la sol sol la sol
    la4. fad4 fad8

    %19
    fad4. fad
    mi sol
    sol8 la sol sol la sol

    %22
    fad4. sol
    mi4 mi8 mi4 red8
    mi4. r8 do do

    %25
    re4. r8 re re\mbreak
    re4. r8 re sol
    sol4. fad4 fad8

    %28
    sol4 re8 r4 r8
    r4 r8 si'4.
    sol r4 r8

    %31
    r4 r8 mi'8 dod mi
    re4 la8 r4 r8
    r4 r8 mi fad sol

    %34
    la4 la,8 r4 r8\mbreak
    r4 r8 re4 re8
    re4 sol,8 r4 r8

    %37
    r4 r8 sol'4.
    fad8 sol la si4 si8
    fad4 sol8 sol4 fad8

    %40
    sol4. fa
    mi mi
    re re4 mi8

    %43
    fad4 sol8 sol4 fad8
    sol4.~sol4

}

Vtln =  \relative do' {

    r8
    R2.
    r4 sol'8 re4 re8
    re mi re re4 re8

    %4
    re4 la8 do4.
    si4 re8 re4.
    dod8 re mi fad4 fad8

    %7
    fad mi re mi4 mi8
    mi4. mi4 la,8\mbreak
    la4 re8 mi4 la,8

    %10
    la4. la4 la8
    la4 la8 la4 sol8
    fad4.~fad4 r8

    %13
    la'4 fad8 fad4 la8
    re,4. r4 re8
    mi4. mi4 do8

    %16
    si4 fad'8 red4 red8\mbreak
    mi4. mi4 mi8
    red4. red

    %19
    red? red4 fad8
    si,4. mi
    mi mi4 si8

    %22
    si4. si4 si8
    la4 do8 si4 si8
    sol4. r8 do sol

    %25
    la4. r8 la la\mbreak
    si4. r8 si re8
    re4. r8 re re

    %28
    re4 si8 r4 r8
    r4 r8 re4.
    do r4 r8

    %31
    r4 r8 mi la4
    la fad8 r4 r8
    r4 r8 mi fad sol

    %34
    la4 la,8 r4 r8\mbreak
    r4 r8 la4 la8
    sol4 sol8 r4 r8

    %37
    r4 r8 re'4.
    re re
    re4 re8 re4 do8

    %40
    si4. re4 si8
    si4. la
    la8 sol fad si re4

    %43
    re re8 re4 do8
    si4.~si4

}


Vfgn = \relative do {

    r8
    R2.
    r4 r8 r4 re'8
    sol,4 sol8 sol la sol

    %4
    re4. fad
    sol sold
    la fad

    %7
    sol sold
    la dod,\mbreak
    re dod

    %10
    re fad8 sol fad
    mi4 re8 la'4 la,8
    re4 la8 re,4 r8

    %13
    re''4 re,8 fad4 re8
    sol4 sol,8 si4 sol8
    do4. la

    %16
    sol2.~\mbreak
    sol~
    sol~

    %19
    sol~
    sol~
    sol

    %22
    la4. sol
    la si
    mi, r8 do'' mi,

    %25
    re4. r8 la'8 do,\mbreak
    si4. r8 si' sol
    re'4. r8 fad, re

    %28
    sol4 sol,8 si'8 la sol
    do4. si4.
    do dod8 si la

    %31
    re4. dod4.
    re si8 do? re
    mi4. mi,8 fad sol

    %34
    la4 la,8 la' si do\mbreak
    re4.  re,8 mi fad
    sol4 sol,8 sol' la si

    %37
    do4. do
    do si la4 sol8 re'4 re,8
    mi4. si

    %40
    do do
    do si8 do si
    la4 sol8 re'4 re,8

    %43
    sol4.~sol4

}


Vbcn = \relative do {

    r8
    R2.
    r4 r8 r4 re'8
    sol,4 sol8 sol la sol

    %4
    re4. fad
    sol sold
    la fad

    %7
    sol sold
    la dod,\mbreak
    re dod

    %10
    re fad8 sol fad
    mi4 re8 la'4 la,8
    re4 la8 re,4 r8

    %13
    re''4 re,8 fad4 re8
    sol4 sol,8 si4 sol8
    do4. la

    %16
    sol2.~\mbreak
    sol~
    sol~

    %19
    sol~
    sol~
    sol

    %22
    la4. sol
    la si
    mi, r8 do'' mi,

    %25
    re4. r8 la'8 do,\mbreak
    si4. r8 si' sol
    re'4. r8 fad, re

    %28
    sol4 sol,8 r4 r8
    r4 r8 si'4.
    do r4 r8

    %31
    r4 r8 dod4.
    re r4 r8
    r4 r8 mi, fad sol

    %34
    la4 la,8 r4 r8\mbreak
    r4 r8  re mi fad
    sol4 sol,8 r4 r8

    %37
    r4 r8 do'4.
    do si la4 sol8 re'4 re,8
    mi4. si

    %40
    do do
    do si8 do si
    la4 sol8 re'4 re,8

    %43
    sol4.~sol4

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2.*3
    s4. <5/>
    s <5/>
    <_+> <6>
    <7> <5/>
    <_+> <7->
    s <7->
    s <6>
    <6\\\+> <4>4<7 _+>8
    s2.*3
    <7>4. <6 5>
    <_+>2.
    <_+>
    <7 _+>
    <7 _+>
    <6 4>
    <6 4>
    <4\+>4. <6>
    <6 5> <4>4 <7 _+>8
    s2.
    s4. s8 <6\\>4
    <6>4. s
    <4>4 <3>8 s <5/>4
    s2.
    s4. <5/>
    s <5/>
    s <5/>
    s2.
    <7>
    <7>
    <7>
    s
    <7>4. <6 5>
    <4\+> <6>
    <6\\> <4>4 <7>8
    s4. <6>
    <6 5> s
    <4\+> <6>
    <6\\> <4>4 <7>8

}

forma = {

    \key sol\major
    \time 6/8
    \tempo 2. = 55
    \partial 8 s8
    s2.*11
    s2 s8\bar ":..:" s
    s2.*31
    s2 s8
    \bar":|."

}

VobI = {
    \Vglobal
    <<\VobIn \forma>>

}

VobII = {
    \Vglobal
    <<\VobIIn \forma>>

}

Vds = {
    \Vglobal
    <<\Vdsn \forma>>

}

Vhc = {
    \Vglobal
    <<\Vhcn \forma>>

}

Vtl = {
    \Vglobal
    \clef alto
    <<\Vtln \forma>>

}

Vfg = {
    \Vglobal
    \clef bass
    <<\Vfgn \forma>>

}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}\version "2.24.0"


VIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIdsn =  \relative do'' {

    sib8 do re4 re
    re8 do sib la sib sol
    mib'4 mib mib

    %4
    mib? re8 do re4
    sol8 fad sol2
    la8 sol la2

    %7
    sib4 la sol
    fad4.-+ mi8 re4 fad4.-+ mi8 re4\mbreak
    re8 mib fa fa fa fa

    %10
    do4 mib2
    sib8 do re re re re
    la4 do2

    %13
    sol8 la sib sib sib sib
    la4 re2
    do8 sib la sol la fad

    %16
    sol2.

}

VIhcn = \relative do'' {

    sol4 la fad_+
    sol2.
    sib4 do2

    %4
    sib4. la8 sib do
    re2 re4
    re2 re4

    %7
    re4. mib8 do4-+
    re2. re\mbreak
    sib2 sib4

    %10
    la do2
    sol8 la sib sib sib sib
    fa4 la2

    %13
    mi8 fad sol sol sol sol
    fad4 sol4. fad8
    mib4 re re

    %16
    re2.

}

VItln =  \relative do' {

    re4 do2
    sib8 la sol2
    sol'4 fad2

    %4
    sol2.
    sib,
    do

    %7
    sib8 do re4 mib
    la,2. la
    fa'2 fa4

    %10
    fa mib2
    mib4 re2
    re4 do2

    %13
    do4 re2
    re4. do8 sib4
    do4. sib8 do la

    %16
    sib2.

}

VIbcn = \relative do {

    sol'4 fad re
    sol sol,2
    sol'4 la2

    %4
    sib sib,4
    sib'8 do sib la sib sol
    fad sol fad mi fad re

    %7
    sol4 fa? mib
    re8 do re mi fad re re4  re,2\mbreak
    sib''4 re,4. mib8

    %10
    fa4 do8 sib do re
    mib4 sib4. do8
    re4 la8 sol la sib

    %13
    do4 sol2
    re'4 sib sol
    do re re,

    %16
    sol2.

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <5/>2
    s2.
    <6->4 <5/>2
    <4> <3>4
    <6>2.
    <5/>
    s4 <6> <6\\>
    <_+>2. s
    s
    s4 <_->2
    s2.*3
    <_+>4 <6>2
    <6 5 _->4 <4> <7 _+>

}

forma = {

    \key fa\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 65
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}} \set Score.currentBarNumber = #9
    \bar ":..:"
    s2.*8
    \bar":|."

}

VIds = {
    \VIglobal
    <<\VIdsn \forma>>

}

VIhc = {
    \VIglobal
    <<\VIhcn \forma>>

}

VItl = {
    \VIglobal
    \clef alto
    <<\VItln \forma>>

}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>

}



VIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIIobIn =  \relative do'' {

    si'8 sol la fad sol4
    re mi2
    la,8 do si la sol fad

    %4
    sol fad sol la si do
    re do re mi fad re
    sol4 mi fad

    %7
    sol mi2-+
    re2.
    la8 si do la si sol\mbreak

    %10
    la si do la si sol
    la mi' re4 do
    si-+ la2

    %13
    si8 do re si mi do
    re mi fad re sol mi
    la4 fad2-+

    %16
    sol2.

}

VIIfgn = \relative do {

    re'8 si do la si4
    si do2
    mi4 re8 do si la

    %4
    si do si la sol4
    si8 la si do re si
    mi4 dod re

    %7
    mi dod2-+
    re4 fad,8 la re,4
    fad8 sol la fad sol mi\mbreak

    %10
    fad sol la fad sol mi
    fad sol la4 fad
    sol fad2

    %13
    sol8 la si sol do la
    si4 la si
    do la2-+

    %16
    sol4 si,8 re sol,4

}

VIIbcn = \relative do {

    sol'4 re sol,
    sol' do,2
    do8 la re4 re,

    %4
    sol2.
    sol'4 sol fad
    mi la re,

    %7
    sol, la2
    re,2.
    re'2 sol,4\mbreak

    %10
    re'2 sol,4
    re'8 mi fad4 re
    sol re2

    %13
    sol4 sol do,
    sol' fad mi
    do re re,

    %16
    sol2.

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s4 <7> s
    s2.
    <6 5>4 <6> <7>
    s2.
    s
    <7>4 <7 _+> s
    <6 5> <_+>2
    s2.
    s
    s2 <6 5>4
    s2.
    s
    s4 s <6 5>
    s <6> <5>
    <6 5>

}

forma = {

    \key sol\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 65
    s2.*8
    \bar ":..:"
    s2.*8
    \bar":|."
    \once \override Score.RehearsalMark.extra-offset = #'(-5 . 0)
    \mark\markup\smaller\italic "au premier"

}

VIIobI = {
    \VIIglobal
    <<\VIIobIn \forma>>

}

VIIfg = {
    \VIIglobal
    \clef bass
    <<\VIIfgn \forma>>

}

VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>

}



VIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \senza
}

VIIIflIn =  \relative do'' {

    sol4
    si8 do la si sol4 sol
    re'2 r4 sol
    fad8 sol mi fad re4 la8(si16 do)

    %4
    si2 r4 sol'
    \tuplet 3/2 { sol8(fad mi) } do[mi] la si sol la
    fad2-+ r4 re

    %7
    \tuplet 3/2 { re8(do si) } sol[re'] re4.-+(do16 re)\mbreak
    \tuplet 3/2 { mi8 (re do) } sol[mi'] mi4.-+(re16 mi)
    \tuplet 3/2 { fad8(mi re) } la[fad'] fad4.-+(mi16 fad)

    %10
    sol2~sol8 si la do
    si sol la mi fad4.-+ sol8
    sol2 r4 re

    %13
    mi4. mi8 fad4 sol
    fad sol8 la re,2~
    re4 mi8 fad sol4 la8 si\mbreak

    %16
    mi,2~mi8 la si do
    fad,4-+ \appoggiatura mi8 re4 re' re,
    mi re r8 fad sol si,

    %19
    do re si do la4._+ sol8
    sol2 r

}

VIIIvlIn = \relative do'' {

    r4
    r2 r4 sol
    si8 do la si sol4 sol
    re'2 r4 re

    %4
    re8 sol,(fad sol) re' sol, re' sol,
    mi'2 r4 la,
    la8 re,\parenthesize (dod re) la' re, la' re,

    %7
    si'2 r4 sol\mbreak
    sol2 r4 la
    la2 r4 si

    %10
    si2 r4 re
    re do8 si la4.-+ sol8
    sol2 r

    %13
    r r4 sol
    la4. la8 si4 do
    si do8 re sol,2~\mbreak

    %16
    sol4 la8 si do4 re8 mi
    la,2 r
    sol'4 sol, la sol

    %19
    r8 fad sol la fad4._+ sol8
    sol2 r

}

VIIIbcn = \relative do {

    r4
    sol2 r
    sol'4 fad mi2
    re r4 fad

    %4
    sol2 si,
    do dod
    re r4 fad,

    %7
    sol2 r4 si\mbreak
    do2 r4 dod
    re2 r4 re

    %10
    mi2 r4 fad
    sol do, re re,
    sol sol' si sol

    %13
    do si la sol
    re' do si fad
    sol fad mi si\mbreak

    %16
    do2. do4
    do2 si4 sol
    do si do si

    %19
    la sol re' re,
    sol2 r

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s1
    s4 <6> <7> <6\\\+>
    s2 s4 <5/>
    s1
    <7>2 <5/>
    s s4 <5/>
    s1
    s2 s4 <5/>
    s2 s4 <6>
    <7>2 s4 <5/>
    s <6 5> s2
    s1
    <9>2 <6>
    s <6>4 <5/>
    s2 s4 <6>
    <9>2 <8>
    <4\+> <6>
    s4 <6> <4\+> <6>
    <6\\>1

}

forma = {

    \key sol\major
    \time 2/2
    \tempo 2 = 60
    \partial 4 s4
    s1*20
    \bar"|."

}

VIIIflI = {
    \VIIIglobal
    <<\VIIIflIn \forma>>

}

VIIIvlI = {
    \VIIIglobal
    <<\VIIIvlIn \forma>>

}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>

}



IXglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IXobIn =  \relative do'' {

    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4
    do2 lab'4
    sol do2

    %4
    si4.-+ la8 sol4
    lab \appoggiatura fa8 mi4 fa
    fa \appoggiatura mi?8 re4 sol

    %7
    sol fa8 mib? re\prall do
    re4 sol,2
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4

    %10
    do2 lab'4
    sol do2
    si4.-+ la8 sol4

    %13
    mib8 fa sol4 sol,
    lab fa'4. sol8
    \once \override Slur.outside-staff-priority = #500 mib(re16\prall do) re4.-+ do8

    %16
    do2.
    mib8 re mib re mib re
    mib4 sol r

    %19
    fa8 mib fa mib fa mib\mbreak
    fa4 lab r
    sol8 fa sol fa sol fa

    %22
    sol4 do r
    fa,8 sol mib4.-+(re16 mib)
    re2-+ r4

    %25
    mib8 re do sib la4
    re8 (do) re2
    mib8\dolce re do sib la4

    %28
    re8 (do) re2
    mi8\f sol fad la sol sib\mbreak
    do,8 re16 mib re4 do

    %31
    sib8 la la4._+ sol8
    sol2.
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4

    %34
    do2 lab'4
    sol do2
    si4.-+ la8 sol4

    %37
    lab \appoggiatura fa8 mi4 fa
    fa \appoggiatura mi?8 re4 sol
    sol fa8 mib? re\prall do

    %40
    re4 sol,2
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4
    do2 lab'4

    %43
    sol do2
    si4.-+ la8 sol4
    mib8 fa sol4 sol,

    %46
    lab fa'4. sol8
    mib(re16\prall do) re4.-+ do8
    do2.

    %49
    mib8(fa16 sol) fa8 lab sol\prall fa
    sol4 \appoggiatura fa8 mib4 fa\mbreak
    sol lab sol

    %52
    fa8\prall mib fa2
    sib4 lab8 sol fa mib
    re do sib lab sol4\mbreak

    %55
    mib'8 fa fa4.-+ mib8
    mib2 sol4
    fa8\prall mib fa lab sol fa

    %58
    mib\prall re do4 sol'
    lab8 sol fa mib re do
    si la sol4 re'

    %61
    mib re re8(mib16 fa)
    mib4-+ re sol8 re
    mib fa fa4.-+(mib16 fa)
    sol2.

    %65
    do,4 \appoggiatura mib8 re4 \appoggiatura do8 si4
    do2 lab'4
    sol do2

    %68
    si4.-+ la8 sol4
    lab \appoggiatura fa8 mi4 fa
    fa \appoggiatura mi?8 re4 sol

    %71
    sol fa8 mib? re\prall do
    re4 sol,2
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4

    %74
    do2 lab'4
    sol do2
    si4.-+ la8 sol4

    %77
    mib8 fa sol4 sol,
    lab fa'4. sol8
    \once \override Slur.outside-staff-priority = #500 mib(re16\prall do) re4.-+ do8

    %80
    do2.

}

IXobIIn =  \relative do'' {

    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4
    do2 lab'4
    sol do2

    %4
    si4.-+ la8 sol4
    lab \appoggiatura fa8 mi4 fa
    fa \appoggiatura mi?8 re4 sol

    %7
    sol fa8 mib? re\prall do
    re4 sol,2
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4

    %10
    do2 lab'4
    sol do2
    si4.-+ la8 sol4

    %13
    mib8 fa sol4 sol,
    lab fa'4. sol8
    \once \override Slur.outside-staff-priority = #500 mib(re16\prall do) re4.-+ do8

    %16
    do2.
    do8 si do si do si
    do4 mib r

    %19
    re8 do re do re do\mbreak
    re4 fa r
    mib8 re mib re mib re

    %22
    mib4 sol r
    si,8 do sol4 do
    do-+ si r

    %25
    do8 sib? la sol fad4
    sib8 (la) sib2
    do8\dolce sib la sol fad4

    %28
    sib8 (la) sib2
    sol4\f la sib\mbreak
    fad8. sol16 la4 fad

    %31
    sol8 la fad4._+ sol8
    sol2.
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4

    %34
    do2 lab'4
    sol do2
    si4.-+ la8 sol4

    %37
    lab \appoggiatura fa8 mi4 fa
    fa \appoggiatura mi?8 re4 sol
    sol fa8 mib? re\prall do

    %40
    re4 sol,2
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4
    do2 lab'4

    %43
    sol do2
    si4.-+ la8 sol4
    mib8 fa sol4 sol,

    %46
    lab fa'4. sol8
    mib(re16\prall do) re4.-+ do8
    do2.

    %49
    sib8 mib re fa mib\prall re
    mib4 sib8 mib re fa\mbreak
    mib8 sol fa4 mib

    %52
    re8\prall(do) re2
    sib'4 lab8 sol fa mib
    re do sib lab sol4\mbreak

    %55
    mib'8 fa fa4.-+ mib8
    mib2 mib4
    re8\prall do re mib re4

    %58
    sol,2 sol'4
    lab8 sol fa mib re do
    si la sol4 si

    %61
    do si re8(mib16 fa)
    mib4-+ re si
    do8 re re4.-+ do8
    si2.

    %65
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4
    do2 lab'4
    sol do2

    %68
    si4.-+ la8 sol4
    lab \appoggiatura fa8 mi4 fa
    fa \appoggiatura mi?8 re4 sol

    %71
    sol fa8 mib? re\prall do
    re4 sol,2
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4

    %74
    do2 lab'4
    sol do2
    si4.-+ la8 sol4

    %77
    mib8 fa sol4 sol,
    lab fa'4. sol8
    \once \override Slur.outside-staff-priority = #500 mib(re16\prall do) re4.-+ do8

    %80
    do2.

}

IXdsn =  \relative do'' {

    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4
    do2 lab'4
    sol do2

    %4
    si4.-+ la8 sol4
    lab \appoggiatura fa8 mi4 fa
    fa \appoggiatura mi?8 re4 sol

    %7
    sol fa8 mib? re\prall do
    re4 sol,2
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4

    %10
    do2 lab'4
    sol do2
    si4.-+ la8 sol4

    %13
    mib8 fa sol4 sol,
    lab fa'4. sol8
    \once \override Slur.outside-staff-priority = #500 mib(re16\prall do) re4.-+ do8

    %16
    do2.
    R2.*16
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4

    %34
    do2 lab'4
    sol do2
    si4.-+ la8 sol4

    %37
    lab \appoggiatura fa8 mi4 fa
    fa \appoggiatura mi?8 re4 sol
    sol fa8 mib? re\prall do

    %40
    re4 sol,2
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4
    do2 lab'4

    %43
    sol do2
    si4.-+ la8 sol4
    mib8 fa sol4 sol,

    %46
    lab fa'4. sol8
    mib(re16\prall do) re4.-+ do8
    do2.

    %49
    R2.*4
    sib'4 lab8 sol fa mib
    re do sib lab sol4\mbreak

    %55
    mib'8 fa fa4.-+ mib8
    mib2 r4
    R2.

    %58
    r2 sol4
    lab8 sol fa mib re do
    si la sol4 r

    %61
    r2 re'8(mib16 fa)
    mib4-+ re r
    R2.*2

    %65
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4
    do2 lab'4
    sol do2

    %68
    si4.-+ la8 sol4
    lab \appoggiatura fa8 mi4 fa
    fa \appoggiatura mi?8 re4 sol

    %71
    sol fa8 mib? re\prall do
    re4 sol,2
    do4 \appoggiatura mib8 re4 \appoggiatura do8 si4

    %74
    do2 lab'4
    sol do2
    si4.-+ la8 sol4

    %77
    mib8 fa sol4 sol,
    lab fa'4. sol8
    \once \override Slur.outside-staff-priority = #500 mib(re16\prall do) re4.-+ do8

    %80
    do2.

}

IXhcn = \relative do'' {

    sol4 fa \appoggiatura mib8 re4
    mib2 fa4
    sol sol4. mib'8

    %4
    re2-+ do4
    do2 do4
    do si do

    %7
    lad4. si8 do4
    si2-+ r4
    sol fa re

    %10
    mib mib fa\mbreak
    sol sol4. mib'8
    re4.-+ do8 si4

    %13
    do mib,4. mib8
    fa4 la si
    do si4.-+ do8

    %16
    do2.
    R2.*16
    sol4 fa \appoggiatura mib8 re4

    %34
    mib2 fa4
    sol sol4. mib'8
    re2-+ do4

    %37
    do2 do4
    do si do
    lad4. si8 do4

    %40
    si2-+ r4
    sol fa re
    mib mib fa\mbreak

    %43
    sol sol4. mib'8
    re4.-+ do8 si4
    do mib,4. mib8

    %46
    fa4 la si
    do si4.-+ do8
    do2.

    %49
    R2.*4
    sol2 do4
    sib re, mib8 fa

    %55
    sol fa16 mib mib4 re-+
    mib2_+ r4
    R2.

    %58
    r2 mib'8 re
    do4 do, fa\mbreak
    re2_+ r4

    %61
    r2 si'4
    do si r
    R2.*2

    %65
    sol4 fa \appoggiatura mib8 re4
    mib2 fa4
    sol sol4. mib'8

    %68
    re2-+ do4
    do2 do4
    do si do

    %71
    lad4. si8 do4
    si2-+ r4
    sol fa re

    %74
    mib mib fa\mbreak
    sol sol4. mib'8
    re4.-+ do8 si4

    %77
    do mib,4. mib8
    fa4 la si
    do si4.-+ do8

    %80
    do2.

}

IXtln =  \relative do' {

    sol4 lab sol
    sol4. do8 si4
    do2 sol'4

    %4
    sol2 sol4
    fa sib lab
    lab sol2

    %7
    do, do4
    sol'8 fa mib re do4
    sol lab sol

    %10
    sol4. do8 si4\mbreak
    do2 sol'4
    sol2 sol4

    %13
    sol4. fa8 mib re
    do4 re re
    do8 sol' sol4 fa

    %16
    mib2.
    R2.*16
    sol,4 lab sol

    %34
    sol4. do8 si4
    do2 sol'4
    sol2 sol4

    %37
    fa sib lab
    lab sol2
    do, do4

    %40
    sol'8 fa mib re do4
    sol lab sol
    sol4. do8 si4\mbreak

    %43
    do2 sol'4
    sol2 sol4
    sol4. fa8 mib re

    %46
    do4 re re
    do8 sol' sol4 fa
    mib2.

    %49
    R2.*4
    mib2 fa4
    fa2 sib,4

    %55
    sib do sib
    sib2 r4
    R2.

    %58
    r4 r do
    lab2 lab4\mbreak
    sol2 r4

    %61
    r r sol'
    sol sol r
    R2.*2

    %65
    sol,4 lab sol
    sol4. do8 si4
    do2 sol'4

    %68
    sol2 sol4
    fa sib lab
    lab sol2

    %71
    do, do4
    sol'8 fa mib re do4
    sol lab sol

    %74
    sol4. do8 si4\mbreak
    do2 sol'4
    sol2 sol4

    %77
    sol4. fa8 mib re
    do4 re re
    do8 sol' sol4 fa

    %80
    mib2.

}

IXfgn = \relative do {

    mib4 fa sol
    mib do re
    mib8 fa mib re mib do

    %4
    sol4 sol'8 fa mi4
    fa sol lab
    re, sol8 fa mib?4

    %7
    fa4. sol8 lab4
    sol4. fa8 mib re
    mib4 fa sol\mbreak

    %10
    mib do re
    mib8 fa mib re mib do
    sol4 sol'8 la si sol

    %13
    do4 do,8 re mib do
    fa4 re sol
    do, sol' sol,

    %16
    do sol do,
    R2.
    r4 do'' do,

    %19
    R2.\mbreak
    r4 fa' fa,
    R2.

    %22
    r4 mib' mib,
    re8 si' do4 do,
    sol' sol8 fa mib re

    %25
    do2 do4
    sib8 do sib la sol4
    do2 do4

    %28
    sib8 do sib la sol4
    do2 sib4\mbreak
    la8 sol fad4 re'

    %31
    sol, re' re,
    sol4 sol'8 fa mib re

    %33
    mib4 fa sol
    mib do re
    mib8 fa mib re mib do

    %36
    sol4 sol'8 fa mi4
    fa sol lab
    re, sol8 fa mib?4

    %39
    fa4. sol8 lab4
    sol4. fa8 mib re
    mib4 fa sol\mbreak

    %42
    mib do re
    mib8 fa mib re mib do
    sol4 sol'8 la si sol

    %45
    do4 do,8 re mib do
    fa4 re sol
    do, sol' sol,

    %48
    do sol do,
    sol''8 mib sib'4 sib,
    mib2 sib4

    %51
    mib re mib
    sib sib' lab
    sol2 lab4

    %54
    sib sib, mib\mbreak
    do lab sib
    mib,8 mib' sol4 mib

    %57
    sib'2 si4
    do do,8 re mib8 do
    fa4 lab fa

    %60
    sol8 la? si4 sol
    do sol sol,4
    do sol sol'

    %63
    do8 sib lab2
    sol8 lab sol fa mib re
    mib4 fa sol
    mib do re

    %67
    mib8 fa mib re mib do
    sol4 sol'8 fa mi4
    fa sol lab

    %70
    re, sol8 fa mib?4
    fa4. sol8 lab4
    sol4. fa8 mib re

    %73
    mib4 fa sol\mbreak
    mib do re
    mib8 fa mib re mib do

    %76
    sol4 sol'8 la si sol
    do4 do,8 re mib do
    fa4 re sol

    %79
    do, sol' sol,
    do2.

}

IXbcn = \relative do {

    mib4 fa sol
    mib do re
    mib8 fa mib re mib do

    %4
    sol4 sol'8 fa mi4
    fa sol lab
    re, sol8 fa mib?4

    %7
    fa4. sol8 lab4
    sol4. fa8 mib re
    mib4 fa sol\mbreak

    %10
    mib do re
    mib8 fa mib re mib do
    sol4 sol'8 la si sol

    %13
    do4 do,8 re mib do
    fa4 re sol
    do, sol' sol,

    %16
    do sol do,
    R2.*15
    r4 sol''8 fa mib re

    %33
    mib4 fa sol
    mib do re
    mib8 fa mib re mib do

    %36
    sol4 sol'8 fa mi4
    fa sol lab
    re, sol8 fa mib?4

    %39
    fa4. sol8 lab4
    sol4. fa8 mib re
    mib4 fa sol\mbreak

    %42
    mib do re
    mib8 fa mib re mib do
    sol4 sol'8 la si sol

    %45
    do4 do,8 re mib do
    fa4 re sol
    do, sol' sol,

    %48
    do sol do,
    R2.*4
    sol''2 lab4

    %54
    sib sib, mib\mbreak
    do lab sib
    mib,8 mib' sol4 r

    %57
    R2.
    r4 do,8 re mib8 do
    fa4 lab fa

    %60
    sol8 la? si4 r
    r2 sol,4
    do sol r

    %63
    R2.*2
    mib'4 fa sol
    mib do re

    %67
    mib8 fa mib re mib do
    sol4 sol'8 fa mi4
    fa sol lab

    %70
    re, sol8 fa mib?4
    fa4. sol8 lab4
    sol4. fa8 mib re

    %73
    mib4 fa sol\mbreak
    mib do re
    mib8 fa mib re mib do

    %76
    sol4 sol'8 la si sol
    do4 do,8 re mib do
    fa4 re sol

    %79
    do, sol' sol,
    do2.

}

IXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <6>4 <6 5 _-> <_!>
    <6> s <6\\\+ 5/>
    <6>2.
    <_!>4 s <6>
    <_-> <6\\+> <6>
    <7> <_!> <6>
    <9 _-> <8> s
    <_!>2.
    <6>4 <6 5 _-> <_!>
    <6> s <6\+ 5/>
    <6>2.
    <_!>
    s
    <9 _->4 <7> <7 _!>
    s <4> <7 _+>
    \bassFigureExtendersOn <_>4 <_> <_>\bassFigureExtendersOff
    s2.*3
    s4 <_-> s
    s2.
    s4 <6> s
    <6\\\+>2.
    <4>4 <_!> s
    s2 <4\+>4
    <6>2.
    <6 5>2 <_+>4
    <6>2.
    <6 5 _!>4 <4\+> <6>
    <6\\\+>2.
    s4 <_+> s
    <_!>2.
    <6>4 <6 5 _-> <_!>
    <6> s <6\\\+ 5/>
    <6>2.
    <_!>4 s <6>
    <_-> <6\\+> <6>
    <7> <_!> <6>
    <9 _-> <8> s
    <_!>2.
    <6>4 <6 5 _-> <_!>
    <6> s <6\+ 5/>
    <6>2.
    <_!>
    s
    <9 _->4 <7> <7 _!>
    s <4> <7 _+>
    \bassFigureExtendersOn <_>4 <_> <_>\bassFigureExtendersOff
    <6>2.
    s
    s4 <5/> s
    s2.
    <6>4 s <6 5>
    s2.
    s4 <6 5> s
    s2.
    s2 <5/>4
    s2.
    <9 _->4 <6\\> s
    s2.
    s4 <_!> s
    s <_!> s
    s <6\\>2
    <_!>2.
    <6>4 <6 5 _-> <_!>
    <6> s <6\\\+ 5/>
    <6>2.
    <_!>4 s <6>
    <_-> <6\\+> <6>
    <7> <_!> <6>
    <9 _-> <8> s
    <_!>2.
    <6>4 <6 5 _-> <_!>
    <6> s <6\+ 5/>
    <6>2.
    <_!>
    s
    <9 _->4 <7> <7 _!>
    s <4> <7 _+>

}

forma = {

    \key sib\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 67
    s2.*16
    \bar"||"\break
    s2.*16\break
    \mark\markup "[Reprise]"
    s2.*16
    \bar "||"\break
    s2.*16
    \bar "||"\break
    \mark\markup "[Reprise]"
    s2.*16
    \bar "|."

}

IXobI = {
    \IXglobal
    <<\IXobIn \forma>>

}

IXobII = {
    \IXglobal
    <<\IXobIIn \forma>>

}

IXds = {
    \IXglobal
    <<\IXdsn \forma>>

}

IXhc = {
    \IXglobal
    <<\IXhcn \forma>>

}

IXtl = {
    \IXglobal
    \clef alto
    <<\IXtln \forma>>

}

IXfg= {
    \IXglobal
    \clef bass
    <<\IXfgn \forma>>

}

IXbc = {
    \IXglobal
    \clef bass
    <<\IXbcn \forma \IXbfn>>

}



Xglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Xdsn =  \relative do'' {

    mi8. fa16 sol8
    do,8. re16 mi8 sol,4 sol8
    sol4._+ la8. si16 la8
    sol8. la16 si8 do8. re16 do8

    %4
    si8._+ la16 sol8 re'8. mi16 re8
    sol4 sol,8 si8. la16 sol8
    sol'4 sol,8 si8. la16 sol8

    %7
    re'8. do16 si8 la4_+ sol8\mbreak
    sol4. re'8. mi16 re8
    si8. la16 sol8 mi'4 mi8

    %10
    mi4. do8. si16 la8
    fa'8. mi16 re8 do8. si16 la8
    sold8. fad16 mi8 mi'8. fa?16 mi8

    %13
    la4 la,8 do8. si16 la8
    la'4 la,8 do8. si16 la8
    mi'8. re16 do8 si4-+ la8\mbreak

    %16
    la4. do8. re16 do8
    sol'4. do,8. re16 do8
    la'4. do,8. re16 do8

    %19
    sol'8. fa16 mi8 re8. mi16 do8
    si8. la16 sol8 sol'4 sol,8
    la si do sol la si

    %22
    do re mi fa sol la
    re,  mi do re4.-+
    do

}

Xhcn = \relative do'' {

    r4 r8
    r4 r8 mi,8. mi16  re8
    mi8. fa16 sol8 fa4 fa8
    re4. mi4 re8

    %4
    re4. r4 r8
    r4 sol8 si8. la16 sol8
    r4 sol8 si8. la16 sol8

    %7
    sol8. fad16 sol8 fad4 sol8\mbreak
    sol4. la4 r8
    sol4 r8 si4 r8

    %10
    la4 r8 la4.
    fa mi
    mi r4 r8

    %13
    r4 la8 do8. si16 la8
    r4 la8 do8. si16 la8
    la8. sold16 la8 la4 sold8\mbreak

    %16
    la4. r4 la8
    sol4. r4 sol8
    fa4. r4 la8

    %19
    sol4. fa
    re8. do16 re8 mi4 mi8
    fa4. re

    %22
    mi do4 do'8
    si4 do8 do4 si8
    do4.

}

Xtln =  \relative do' {

    r4 r8
    r4 r8 do8. do16 si8
    do4 do8 do4 do8
    si4 sol8 sol4 la8

    %4
    sol4. r4 r8
    r4sol'8 si8. la16 sol8
    r4 sol8 si8. la16 sol8

    %7
    sol8. la16 re,8 re4 do8\mbreak
    si4. re4 r8
    re4 r8 re4 r8

    %10
    do4. mi
    la, do
    si r4 r8

    %13
    r4 la'8 do8. si16 la8
    r4 la8 do8. si16 la8
    la8. si16 mi,8 mi4 re8\mbreak

    %16
    do4. r4 mi8
    mi4. r4 mi8
    do4. r4 do8

    %19
    do4. la
    sol8. la16 si8 do4 do8
    do4. si8 la sol

    %22
    sol4 sol'8 la4.
    sol4 mi8 la4 sol8
    mi4.-+

}

Xbcn = \relative do {

    r4 r8
    r4 r8 mi8. fa16 sol8
    do,8. re16 mi8 fa,4 fa8
    fa4. mi4 fa8

    %4
    sol4. r4 r8
    r4 sol'8 si8. la16 sol8
    r4 sol8 si8. la16 sol8

    %7
    si8. la16 sol8 re'4 re,8
    sol4.\mbreak fad4 r8
    sol4 r8 sold4 r8

    %10
    la4. la,
    re la
    mi' r4 r8
    r4 la8 do8. si16 la8

    %14
    r4 la8 do8. si16 la8
    do8. si16 la8 mi'4 mi,8\mbreak
    la,4. r4 la'8

    %17
    mi4. r4 mi8
    fa4. r4 fa8
    mi4. fa

    %20
    sol mi8. re16 do8
    fa4 fa8 fa8. sol16 fa8
    mi re do la' sol fa

    %23
    sol4 la8 fa4 sol8
    do,4.

}

Xbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    s <6>
    s <6 5>
    <4\+> <6>4 <6 5>8
    s2.
    s4. <6>
    s <6>
    <6> <4>4 <7 _+>8
    s4. <5/>
    s <5> s2.
    <6 5>
    <_+>
    s4. <6>
    s <6>
    <6> <4>4 <7 _+>8
    s2.
    <6>
    s
    <6>4. <6 5>
    s <6>
    <6 5> <4\+>
    <6> <6>
    <7> <6 5>

}

forma = {

    \key do\major
    \time 6/8
    \tempo 2. = 60
    \partial 4. s4.
    s2.*7
    s4.
    \bar ":..:"
    s
    s2.*15
    s4.
    \bar":|."

}

Xds = {
    \Xglobal
    <<\Xdsn \forma>>

}

Xhc = {
    \Xglobal
    <<\Xhcn \forma>>

}

Xtl = {
    \Xglobal
    \clef alto
    <<\Xtln \forma>>

}

Xbc = {
    \Xglobal
    \clef bass
    <<\Xbcn \forma \Xbfn>>

}



XIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIobIn =  \relative do'' {

    mib8. fa16 mib8
    re8. mib16 fa8 sol4 fa8
    mib4-+ re8 mib4 fa8
    sol4 sol8 sol8. lab16 fa8

    %4
    sol4. re8. mib16 re8
    fa4 fa8 do8. re16 do8
    mib4 mib8  sib8. do16 sib8

    %7
    re8. do16 sib8 la4 re8
    si8. la16 sol8\mbreak mib'8. fa16 mib8
    sol4 sol8 sol8. lab16 sol8

    %10
    sol4-+ fa8 fa8. sol16 fa8
    lab4 lab8 lab8. sib!16 lab8
    lab?4-+ sol8 sib4.

    %13
    mib,8. fa16 sol8 lab8. sol16 fa8
    sol8. fa16 mib8 lab8. sol16 fa8
    sib8. lab16 sol8 fa4-+ mib8\mbreak

    %16
    mib4. sol8. lab16 sol8
    fa8. sol16 lab8 sol8. fa16 mib8
    re4.-+ mib4 re8

    %19
    do8. re16 mib8 re4-+ do8
    si8. la16 sol8 sol'4 sol,8
    sol8. lab16 sol8 sol8. lab16 sol8

    %22
    fa'4.~fa8. mib16 re8
    mib8. re16 do8 si4_+ do8
    do4.

}

XIobIIn = \relative do'' {

    do8. re16 do8
    si8. do16 re8 mib4 re8
    do4-+ si8 do4 re8
    mib4 re8 do4 re8

    %4
    si4 sol8 sib8. do16 sib8
    re4 re8 la8. sib16 la8
    do4 do8 sol8. la16 sol8

    %7
    sib8. la16 sol8 fad8. mi16 fad8
    sol4. r4 r8
    r4 mib'8 mib8. fa16 mib8

    %10
    mib4-+ re8 r4 r8
    r4 fa8 fa8. sol16 fa8
    fa4-+ mib8 sol4.

    %13
    do,8. re16 mib8 fa8. mib16 re8
    mib8. re16 do8 fa8. mib16 re8
    sol8. fa16 mib8 re4-+ mib8\mbreak

    %16
    mib4 mib,8 mib'8. fa16 mib8
    re4 re8 re4 do8
    si4. sol4 sol8

    %19
    sol8. lab16 sol8 fa8._+ mib16 fa8
    sol4. re4 re8
    mib8. fa16 mib8 mib8. fa16 mib8

    %22
    re4. re'
    sol,8. fa16 mib8 re4_+ do8
    do4.

}

XIfgn =  \relative do {

    do'4 do,8
    sol'4 fa8 mib4 si8
    do4 sol8 do mib re
    do4 sib?8 lab4.

    %4
    sol sol'
    re8. mib16 re8 fa4 fa8
    do8. re16 do8 mib4 mib8

    %7
    sib4 do8 re4 re,8
    sol4. r4 r8
    r4 mib''8 mib4 mib,8

    %10
    sib'4 sib,8 r4 r8
    r4 fa'8 fa4 fa8
    do'4 do,8 r4 sol'8

    %13
    lab4 sol8 fa4 sib8
    mib,4 lab8 fa4 sib8
    sol4 lab8 sib4 sib,8\mbreak

    %16
    mib4 mib8 mib4 mib8
    sib'4 sib8 si4 do8
    sol4 sol,8 do4 sib8

    %19
    lab4.~lab
    sol4 la?8 si4 sol8
    do4. r4 do8

    %22
    si4 re8 sol4 si,8
    do4 fa,8 sol4.
    do,

}

XIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    <_!> <6>4 <5/>8
    s4 <_+>8 s4 <6\\!>8
    s4 <6>8 <7>4 <6\\>8
    <_!>4. <_->
    s2.*2
    <6>4. <_+>
    s4. s
    s2.
    <6 4>4 <3 >8 s4.
    s4 <_->8 s4.
    <6 4>4 <3>8 s4 <6>8
    <9>4. <7>4 <7>8
    s2.
    <6>
    s
    s4. <5/>
    <_!> s4 <6>8
    <7>4. <6\\>
    <_!> s
    s2.
    \bassFigureExtendersOn <5/>4 <5/>8 <5/>4 s8\bassFigureExtendersOff
    s4. <_!>

}

forma = {

    \key sib\major
    \time 6/8
    \tempo 2. = 60
    \partial 4. s4.
    s2.*7
    s4.
    \bar ":..:"
    s
    s2.*15
    s4.
    \bar":|."

}

XIobI = {
    \XIglobal
    <<\XIobIn \forma>>

}

XIobII = {
    \XIglobal
    <<\XIobIIn \forma>>

}

XIfg = {
    \XIglobal
    \clef bass
    <<\XIfgn \forma\XIbfn>>

}



XIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIIdsn =  \relative do'' {

    sol'16 fa mi re do8 mi
    mi[re re fa]
    fa[mi mi la]

    %4
    sol4 do,
    sol'16 fa mi re do8 mi
    re[si do re]

    %7
    mi16 re do si la8 fa
    si4-+ sol
    sol'8 do,16 si la8_+ sol

    %10
    sol'8 do,16 si la8_+ sol
    do[re mi fa]
    sol4 la8 re,

    %13
    re4 sol8 do,
    do4 fa8 mi
    re-+[do re mi]

    %16
    do4 do

}

XIIhcn = \relative do'' {

    do4 do
    do8[si si re]
    re do do4

    %4
    do2
    do4 do
    si8[sol sol sol]

    %7
    sol4 fad
    sol sol
    r8 do, [re mi]

    %10
    r do[re mi]
    r si'[do si]
    do4 do

    %13
    si si8 sol
    la4 re8 do
    si4 si

    %16
    do do

}

XIItln =  \relative do' {

    mi4. sol8
    sol4 sol
    sol sol8 fa

    %4
    fa2
    mi4. sol8
    sol[re mi si]

    %7
    do[mi re re]
    re4 re
    r8 sol,[fa sol]

    %10
    r sol[fa sol]
    r sol' [sol fa]
    mi4 la

    %13
    sol sol
    mi8[la sol sol]
    sol4 fa

    %16
    mi mi

}

XIIbcn = \relative do {

    do'4 do, sol'8[sol si sol]
    do4 do
    do,2

    %4
    do'4 do,
    sol'8[fa mi re]
    do[la re re,]

    %7
    sol4 sol
    r8 mi'[fa mi]
    r mi[fa mi]

    %10
    r sol[do, re]
    mi4 fa
    sol mi

    %13
    la si8 do
    sol4 sol,
    do do

}

XIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    <6 4>4 <5/>
    <4> <3>
    s2
    s
    s4 <6>8 <6\\>
    s4 <4>8 <7 _+>
    s2
    s8 <6> <6 5> <6>
    s <6> <6 5> <6>
    s4 s8 <6\\>
    <6>4 <6 5>
    s <6>
    <7> <5/>
    <4> <7>

}

forma = {

    \key do\major
    \time 2/4
    \tempo 2 = 60
    s2*8
    \bar ":..:"
    s2*8
    \bar":|."

}

XIIds = {
    \XIIglobal
    <<\XIIdsn \forma>>

}

XIIhc = {
    \XIIglobal
    <<\XIIhcn \forma>>

}

XIItl = {
    \XIIglobal
    \clef alto
    <<\XIItln \forma>>

}

XIIbc = {
    \XIIglobal
    \clef bass
    <<\XIIbcn \forma \XIIbfn>>

}



XIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIIIobIn =  \relative do'' {

    sol4 la
    sol8[do si la]
    sol4 la

    %4
    sol8[do si la]
    sol4 la
    sol8[do si do]

    %7
    re[sol fa mi]
    re4-+ re
    sol sol

    %10
    sol8 mi16 re mi8 sol
    fa4 fa
    fa8 re16 do re8 fa

    %13
    mi4 mi
    mi16 re mi fa sol8 la
    re,[fa mi re]

    %16
    do4 do

}

XIIIobIIn = \relative do'' {

    mi,4 fa
    mi8[mi re fa]
    mi4 fa

    %4
    mi8[mi re fa]
    mi4 fa
    \once\stemUp mi8[sol' fa mi]

    %10
    si[mi re do]
    si4-+ si
    mi mi

    %13
    mi8 do16 si do8 mi
    re4 re
    re8 si16 la si8 re

    %16
    do4 do
    do16 si do re mi8 re16 do
    si8[re do si]

    %19
    do4 do

}

XIIIhcn =  \relative do'' {

    mi,8 [mi do la]
    mi'4 si
    mi8[mi do la]

    %4
    mi'4 si
    mi8[mi do la]
    mi'[mi fa si,]

    %7
    si4 si
    si si
    re re

    %10
    do do
    do do
    si si

    %13
    si' si
    si sol8 do
    si4 si

    %16
    sol sol

}

XIIIfgn = \relative do {

    do4 do
    do r
    do do

    %4
    do r
    do do
    do8[mi re do]

    %7
    sol'[mi si do]
    sol4 sol
    mi'8[fa sol mi]

    %10
    la4 la
    re,8[mi fa re]
    sol4 sol

    %13
    do,8[fa mi do]
    do'4. fa,8
    sol4 sol,

    %16
    do do

}

XIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6 4>
    <3>2
    s4 <6 4>
    <3>2
    s4 <6 4>
    <3> <6\\>
    s8 <6> <5/> s
    s2
    s
    <7>
    <7>
    <7>
    s
    s4. <6 5>8
    s4 <6 4>8 <7>

}

forma = {

    \key do\major
    \time 2/4
    \tempo 2 = 60
    s2*8
    \bar ":..:"
    s2*8
    \bar":|."

}

XIIIobI = {
    \XIIIglobal
    <<\XIIIobIn \forma>>

}

XIIIobII = {
    \XIIIglobal
    <<\XIIIobIIn \forma>>

}

XIIIhc = {
    \XIIIglobal
    <<\XIIIhcn \forma>>

}

XIIIfg = {
    \XIIIglobal
    \clef bass
    <<\XIIIfgn \forma\XIIIbfn >>

}



XIVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIVdsn =  \relative do'' {

    do8 sol'16 fa mi8 re do sol
    la4 sol2
    la8 si16 do fa,8 re'16 do si8 fa

    %4
    fa4_+ mi2
    sol8 do16 si do8 sol mi [do']
    do[sib la sol] fa4

    %7
    la8 re16 do re8[la] fad re'
    re do si? la sol4
    do8 [mi re fa] mi sol16 do,

    %10
    si4-+ do2\mbreak
    re8 mi16 fa mi4 re-+
    do2.\fermata

    %13
    sol'8 do,16 si do8 mi mi re16 do
    re4 sol, do
    \appoggiatura si8 la4 si do

    %16
    si4.-+ la8 sol4
    re'16 si do re mi do re mi fad re mi fad
    sol4 sol,2

    %19
    mi'8 re do si la sol
    fad re' do la si sol\mbreak
    la fad sol do si sol

    %22
    la fad sol re' do16 si la8
    si16 la sol8 la4._+ sol8
    sol2.

    %25
    mi'8 fa mi mi mi mi
    sold4-+ la r
    fa8 mi16 re do4 si-+

    %28
    la8 mi'16 re do8[la fa' do]
    re fa16 mi re8[si sol' re]
    mi sol16 fa mi8[do do' sol]\mbreak

    %31
    la sol fa mi re do
    si8.-+ la16 sol4 do
    re8 fa sol, fa' re fa

    %34
    mi sol sol, sol' mi sol
    la do, si4-+ do
    re2.

}

XIVhcn = \relative do'' {

    mi,4. fa8 sol4
    fa do mi
    fa8 do re4. si8

    %4
    do2 do4
    mi2 mi4
    fa2 fa4

    %7
    fad2 fad4
    sol2 sol4
    sol2 sol4\mbreak

    %10
    sol mi do'
    do do si-+
    do2.\fermopz

    %13
    do2 do4
    si4. la8 sol4
    sol fa mi

    %16
    re2_+ re4
    re do do
    si2 re4

    %19
    do2 mi4\mbreak
    re2 re4
    re do re

    %22
    re4. sol8 fad4
    sol fad4. sol8
    sol2.

    %25
    do4 do do
    re do r
    la la sold

    %28
    la2 la4
    la2 sol4\mbreak
    sol2 do4

    %31
    do2 la4
    sol2 sol4
    sol2 sol4

    %34
    sol2 sol4
    la fa mi8 do'
    si2.-+

}

XIVtln =  \relative do' {

    do2 do4
    do2 do4
    la la sol

    %4
    sol2 sol4
    sol2 sol4
    la2 la4

    %7
    la2 la4
    si2 si4
    do re do\mbreak

    %10
    re do mi
    la sol fa
    mi2.\fermata

    %13
    mi4 sol sol
    sol4. re8 mi4
    do re sol,

    %16
    sol2 sol4
    sol8 si la4 la
    sol4. la8 si4

    %19
    la2 la4\mbreak
    la2 sol8 si
    la4 sol sol8 si

    %22
    la4 sol la
    re re do
    si2.

    %25
    la'2 la4
    si la r
    re, re re

    %28
    do mi la
    fa fa si\mbreak
    mi,2 mi4

    %31
    fa2 fa4
    re2-+ mi4
    re2 re4

    %34
    do2 do4
    do re sol,
    sol2.

}

XIVbcn = \relative do {

    do'2 mi,4
    fa mi do
    fa8 mi re4 sol,

    %4
    do2 do,4
    do' mi do
    fa2 fa,4

    %7
    re' fad re
    sol2 fa?4
    mi si do

    %10
    sol'4 la2\mbreak
    fa4 sol sol,
    do2.\fermata

    %13
    do4 mi do
    sol' fa mi
    fa8 mi re4 do

    %16
    sol' sol, sol'
    si, do re
    mi re8 do si4

    %19
    do mi do
    re2 sol4\mbreak
    fad mi re

    %22
    do si la
    sol re' re,
    sol2.

    %25
    la'4 do la
    si, do r
    re mi mi,

    %28
    la2 la'4
    si2 si4
    do2 mi,4\mbreak

    %31
    fa la fa
    sol2 mi4
    si2 si4

    %34
    do mi do
    fa8 mi re4 do
    sol' si sol

}

XIVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6 5>4 <6> s
    <9> <7> <7>
    <4> <3> s
    s2.
    s
    <_+>
    s
    <6>4 <5/> s
    s2.
    <6 5>4 <6 4> <7>
    s2.*2
    s4 s  <6>
    <9> <6\\> s
    s2.
    <6>4 <6 5> <_+>
    s2 <6>4
    <6 5>2.
    <_+>
    <6>4 <6> <6 4>
    <4\+> <6> <6\\\+>
    s <4> <7 _+>
    s2.*2
    <6\\\+>4 <6> s
    <6 5> <6 4> <7 _+>
    s2 <6>4
    <7> s <6 5/>
    s2.
    <6 5>
    s2 <6>4
    <5/>2.
    s2.
    <9>4 <6\\>

}

forma = {

    \key do\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 55
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -1)
    \mark\markup \segno
    s2.*11
    \once \override Score.RehearsalMark.extra-offset = #'(+3 . +1) \mark\markup "Fin"
    s2.
    \bar":|."\break
    s2.*12
    \bar "||"\break
    s2.*12
    \bar "|."
    \mark\markup\segno

}

XIVds = {
    \XIVglobal
    <<\XIVdsn \forma>>

}

XIVhc = {
    \XIVglobal
    <<\XIVhcn \forma>>

}

XIVtl = {
    \XIVglobal
    \clef alto
    <<\XIVtln \forma>>

}

XIVbc = {
    \XIVglobal
    \clef bass
    <<\XIVbcn \forma \XIVbfn>>

}



XVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XVdsn =  \relative do'' {

    sol8
    do do do
    re-+ do fa
    mi8 re4-+

    %4
    do16 si do re mi fa
    sol8 re mi
    do la si\mbreak

    %7
    do la4_+
    sol sol'8
    sol re16 mi fa8

    %10
    mi mi16 fa sol8
    do, si do
    re8 sol, do4 re

    %13
    mi8. re16 do8
    fa re4-+
    do

}

XVhcn = \relative do'' {

    r8
    r r sol
    sol mi sol
    sol sol4

    %4
    sol do8
    re si sol
    sol fad sol

    %7
    sol fad4
    sol si8
    si4 si8

    %10
    do do,16 re mi fa
    sol4 sol8
    sol4 sol sol

    %13
    sol do8
    do si4-+
    do

}

XVtln =  \relative do' {

    r8
    r r do
    si do re
    do si4

    %4
    do8 sol' sol
    fa4 mi8
    mi re re

    %7
    mi re4
    si re8
    re sol sol

    %10
    sol4 do,8
    do re mi
    si4 mi re

    %13
    do8. re16 mi8
    la sol fa
    mi4

}

XVbcn = \relative do {

    r8
    r4 do8
    sol' la si
    do sol sol,

    %4
    do mi do
    si sol do
    la re sol\mbreak

    %7
    do, re re,
    sol4 sol8
    si4 sol8

    %10
    do4 do'8
    mi,8 re do
    sol'4 mi si

    %13
    do8 do'16 si la8
    fa sol sol,
    do4

}

XVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s4.
    s8 <6> <5/>
    s <4> <7>
    s4.
    <6>
    <7>8 <7 _+> s
    <6 5> <4> <7 _+>
    s4.
    <5/>
    s
    <6>8 <6\\> s
    s4 <6> <5/>
    s4.
    <6 5>8 <4> <7>

}

forma = {

    \key do\major
    \time 3/8
    \tempo 4.  = 75
    \partial 8 s8
    s4.*7
    s4 \bar ":..:" s8
    s4.*7
    s4
    \bar ":|."

}

XVds = {
    \XVglobal
    <<\XVdsn \forma>>

}

XVhc = {
    \XVglobal
    <<\XVhcn \forma>>

}

XVtl = {
    \XVglobal
    \clef alto
    <<\XVtln \forma>>

}

XVbc = {
    \XVglobal
    \clef bass
    <<\XVbcn \forma \XVbfn>>

}



XVIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XVIobIn =  \relative do'' {

    do8
    mib fa re
    mib do mib
    re16 mib fa8 sol

    %4
    mib4-+ re8\mbreak
    sol sol sol
    sol mib fa

    %7
    sol lab16 sol fa mib
    re4-+ re8
    mib re16 mib fa re

    %10
    mib8 do lab'
    sol fa4-+
    sol mib8. [fa16] re4

    %13
    sol8. fa16 mib8
    lab re,4-+
    do

}

XVIobIIn = \relative do'' {

    sol8
    do re si
    do sol do
    si16 do re8 re

    %4
    sol,8. do16 si8\mbreak
    mib do re
    mib do sol

    %7
    do8. mib16 re do
    si4-+ si!8
    do si16 do re si

    %10
    do8 sol mib'
    re do4-+
    si do8. [re16] si4

    %13
    mib8. re16 do mib
    re do si4-+
    do

}

XVIfgn =  \relative do {

    do'8
    do fa, sol
    do, mib do
    sol'4 si,8

    %4
    do4 sol'8\mbreak
    mib4 si8
    do4 re8

    %7
    mib fa4
    sol sol8
    do, sol' sol,

    %10
    do4 do'8
    sib lab4
    sol do, sol'

    %13
    mib lab8
    fa sol sol,
    do4

}

XVIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s <6 5 _-> <_!>
    s4.
    <_!>
    s4 <_!>8
    <6>4 <5/>8
    s4 <6\\>8
    <6> <6 5 _->4
    <_!> <_!>8
    s <_!> s
    s4 <6->8
    <6> <6\\>4
    <_!>4 s <_!>
    <6>4.
    <6 5 _->8 <_!>

}

forma = {

    \key sib\major
    \time 3/8
    \tempo 4.  = 80
    \partial 8 s8
    s4.*7
    s4 \bar ":..:" s8
    s4.*7
    s4
    \bar ":|."

}

XVIobI = {
    \XVIglobal
    <<\XVIobIn \forma>>

}

XVIobII = {
    \XVIglobal
    <<\XVIobIIn \forma>>

}

XVIfg = {
    \XVIglobal
    \clef bass
    <<\XVIfgn \forma\XVIbfn>>

}



XVIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XVIIdsn =  \relative do'' {

    re,32 mi fa mi re [mi fa mi] re mi fa mi
    re8 re' r
    sib32 do re do sib[do sib la] sol la sol fa

    %4
    mi8 do' r
    la32 sib do sib la[sib la sol] fa sol fa mi
    re8 sib' r\mbreak

    %7
    sol32 la sib la sol[la sol fa] mi fa mi re
    dod8 la' r
    fa32 re fa la fa[re fa la] fa re fa la

    %10
    fa re fa sib fa [re fa sib] fa re fa sib
    sol mi sol sib sol[mi sol sib] sol mi sol sib
    sol mi sol do sol [mi sol do] sol mi sol do\mbreak

    %13
    la fa la do la[fa la do] la fa la do
    mi,4. mi8 mi4 r32 do re mi fa sol la sib
    do4 r32 fa, sol la sib do re mi fa4. fa,8

    %16
    sib4 la sol4._+ fa8
    fa32 sol la sib do [re do sib] la sol fa mi\mbreak
    re8 re' r

    %19
    si32 do re do si[do si la] sol la sol fa
    mi8 mi' r
    do32 re mi re do[re do si] la sol fa mi

    %22
    fa16. re'32 si4-+
    la32 mi fad sold la[si do re] mi la, sib do\mbreak
    re mi fad sol la[sol fad mi] re do sib la

    %25
    sib re, mi fad sol[la sib do] re sol, la sib
    do re mi fa sol[fa mi re] do sib la sol
    la do, re mi fa[sol la sib] do fa, sol la

    %28
    sib do re mi fa[sol fa mi] re do sib la
    sol16 sib32 la sol16[sib32 la] sol16 sib32 la\mbreak
    sol16 sol sol sol sol sol

    %31
    sol fa32 mi fa16.[la32] re16. la32
    sib16 la32 sol la16.[dod32] mi16. sol,32
    fa16 mi32 re mi4_+

    %34
    re32 mi fa mi re [mi fa mi] re mi fa mi
    re8 re' r
    sib16 la32 sol la8[la,]

    %37
    re4.

}

XVIIfgn = \relative do {

    re8 re, r
    re'32 mi fa mi re [mi fa mi] re do sib la
    sol8 sol' r

    %4
    do32 re mi re do[re do si] la sib la sol
    fa8 fa' r
    sib,32 do re do sib[do sib la] sol la sol fa\mbreak

    %7
    mi8 mi' r
    la,32 si dod si la[sib la sol] fa sol fa mi
    re8 re' r

    %10
    \clef tenor re,16 re' re, re' re, re'
    mi, mi' mi, mi' mi, mi'
    mi, mi' mi, mi' mi, mi'\mbreak

    %13
    fa, fa' fa, fa' fa, fa'
    \clef bass sib,,4. sib8 sib4. sib8
    la4. la8 la4. la8

    %16
    sol4 fa do' do,
    fa16 fa' fa, fa' fa, fa'\mbreak
    fad32 sol la sol fad[sol fad mi] re do si la

    %19
    sol8 sol' r
    sold32 la si la sold[la sold fad] mi re do si
    la8 la' r16 do,

    %22
    re8 mi mi,
    la16 la' la, la' la, la'\mbreak
    fad re' fad, re' fad, re'

    %25
    sol,, sol' sol, sol' sol, sol'
    mi do' mi, do' mi, do'
    fa,, fa' fa, fa' fa, fa'

    %28
    re sib' re, sib' re, sib'
    mi,, mi' mi, mi' mi, mi'\mbreak
    dod32 re mi re dod[re dod si] la si dod la

    %31
    re16 re re re re re
    dod4 dod8
    re la' la,

    %34
    re32 mi fa mi re[mi fa mi] re mi fa mi
    re8 re' r
    sib16[la32 sol] la8 la,

    %37
    re4.

}

XVIIbcn = \relative do {

    re8 re, r
    re'16 re re re re re
    sol, sol sol sol sol sol

    %4
    do do do do do do
    fa, fa fa fa fa fa
    sib sib sib sib sib sib\mbreak

    %7
    mi, mi mi mi mi mi
    la la la la la la
    re,4 r8

    %10
    re' re re
    mi4 r8
    mi mi mi\mbreak

    %13
    fa fa fa,
    sib4. sib8 sib4. sib8
    la4. la8 la4. la8

    %16
    sol4 fa do' do,
    fa8 fa fa\mbreak
    fad fad fad

    %19
    sol sol sol
    sold sold sold
    la la' do,

    %22
    re mi mi,
    la la la\mbreak
    fad fad fad

    %25
    sol sol sol
    mi mi mi
    fa fa' fa

    %28
    re re, re'
    mi mi mi\mbreak
    dod dod la

    %31
    re re re
    dod4 dod8
    re la' la,

    %34
    re32 mi fa mi re[mi fa mi] re mi fa mi
    re8 re' r
    sib16[la32 sol] la8 la,

    %37
    re4.

}

XVIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*2
    <_->4.
    <7>
    s
    <7>
    <7>
    <_+>
    s
    <6->
    <7>
    <5/>
    s
    <4\+>1
    <6>
    <6\\>2 <4>4 <7>
    s4.
    <5/>
    s
    <5/>
    s
    <6 5>8 <4> <7 _+>
    s4.
    <5/>
    <_->
    <5/>
    s
    <6->
    <7>
    <5/>
    s
    <7>8 <6 5/> s
    s <4> <7 _+>
    s4.
    s
    <6\\>8 <4> <7 -+>

}

forma = {

    \key do\major
    \time 3/8
    \tempo 4 = 55
    s4.*13
    \time 2/2
    \tempo 2 = 60
    s1*3
    \time 3/8
    \tempo 4 = 55
    s4.*21
    \bar"|."

}

XVIIds = {
    \XVIIglobal
    <<\XVIIdsn \forma>>

}

XVIIfg = {
    \XVIIglobal
    \clef bass
    <<\XVIIfgn \forma>>

}

XVIIbc = {
    \XVIIglobal
    \clef bass
    <<\XVIIbcn \forma \XVIIbfn>>

}



XVIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \senza

}

XVIIIobIn =  \relative do'' {

    la8 sol16 fad re4 re'
    mi8 dod re2
    mi8 fad sol(la16 si) la8 sol

    %4
    fad-+ (mi) re4 fad
    mi16 la sol fad mi re dod si la8 la
    fad4_+ \appoggiatura mi8 re4 re'

    %7
    dod8 re sol4 fad
    mi8-+ re mi4 la,
    si8 sol'16 fad mi8 sol si,16 la sol8

    %10
    la fad'16 mi re8 fad la, sol16 fad\mbreak
    sol8 mi'16 re dod8 mi sol,16 fad mi8
    fad la re la fad re

    %13
    si'16(dod re8) si16(dod re8) si16(dod re8)
    si4-+ la2
    si16\dolce(dod re8) si16(dod re8) si16(dod re8)

    %16
    si4-+ la2
    si8\f dod re mi fad sol
    la sol16 fad mi8[dod la mi']

    %19
    fad mi re dod si la
    sold'16 mi sold si mi,8 sold mi sold\mbreak
    la16 mi la dod mi,8 la mi la

    %22
    si16 mi, sold si mi,8 si' mi, si'
    dod16(si la8) si4 sold-+
    la8 mi16 re dod8 mi la,4

    %25
    la'8^\markup\italic "Flûte [I]" fad16 sol la8 fad16 sol la8 fad16 sol
    la8 fad,16\tu mi fad8 mi fad re
    si''8^\markup\italic "Flûte [I]" sol16 la si8 sol16 la si8 sol16 la

    %28
    si8 sol,16\tu  fad sol8 fad sol mi\mbreak
    dod''8^\markup\italic "Flûte [I]" la16 si dod8 la16 si dod8 la16 si
    dod8 la re4 re
    re dod2-+
    re8 fad,\tu fad fad fad fad

    %33
    fad16 mi re dod si dod re mi fad8 si
    lad16 fad sold lad si8 fad re fad
    sol? dod, re4 dod-+

    %36
    si16 fad si re si re mi fad sol fad mi re
    mi dod mi sol la, mi' fad sol la sol fad mi\mbreak
    fad re fad la re, dod re mi fad mi re dod

    %39
    si re mi fad sol la si la sol fad mi re
    dod4-+ \appoggiatura si8 la la' re fad,
    sol si mi, sol dod mi,

    %42
    fa re mib sib' dod,!16 si! la8
    \tuplet 3/2 {
        fad'! (sol la) mi(fad sol) fad(mi re)
        sol(la si)
    } mi,4.-+ re8\mbreak

    %45
    re4 re re
    re8 re, re' re, re' re,
    re'4. la8 si la

    %48
    sol fad mi4._+ re8
    re2.~re4. re'8 la4
    re,2 mi4 fad4. sol8 la4

    %51
    la mi sol fad4. sol8 la4\mbreak
    la4 mi sol fad mi re
    la'2. mi'8 re dod si la sol

    %54
    sol4_+ fad2 fad'8 mi re dod si la
    la4_+ sold2  mi'4. fad8 mi4
    fad,fad fad re'4. mi8 re4

    %57
    mi,2. dod'8 re mi fad sold la
    si,4 si si dod4. re8 si4-+\mbreak
    la4. la8

    %60
    fad16 sol fad mi re mi fad sol
    la si dod re mi sol fad mi
    fad sol fad mi re fad mi re

    %63
    mi fad mi re dod si la sol
    fad sol fad mi re mi fad sol
    la si dod re mi sol fad mi

    %66
    fad sol fad mi re fad mi re
    mi4.-+ la8\mbreak
    dod,16 re mi4 la8

    %69
    mi16 fad sol4 mi8
    fad16 sol la4 re,8
    re-+ dod4 la8^\markup\italic "Haubois [I]"

    %72
    si16 la sol8 si16 dod re8
    la16 si la sol fad8 la
    si16 la sol8 si16 dod re8
    la4. la8\tu
    si16 dod re mi fad sol la re,

    %77
    dod re mi fad sol si la sol\mbreak
    fad mi re8 mi dod
    sol'4 sol

    %80
    sol~sol16 si la sol
    fad mi re8 mi dod
    re fad,16 mi re8 re

    %83
    re2 fa'4
    mi dod re
    sol, sol sol

    %86
    sol8 sib la sol fa_+ mi
    fa4\appoggiatura mi8 re4 la'
    sib8 la16 sol dod4. si16 la\mbreak

    %89
    re8 sib' la sol fa-+ mi
    fa mi16 re dod4.-+ re8
    re16 re, re re re re re re re re re re

    %92
    do do do do do do do do do do do do
    fa la sol la fa la sol la fa sib la sib
    sol sib la sib sol sib la sib sol do sib do

    %95
    la do re mi fa8 r r4
    R2.*4
    do16\f \repeat unfold 11 {do16}

    %101
    \repeat unfold 12 {re}
    \repeat unfold 12 {mi}
    R2.*4

    %107
    r4 la,\f\tu sib
    la r2
    r4 la\f\tu sib

    %110
    la8 r r2
    r2 fa'4\tu\f
    mi dod re

    %113
    sol, sol sol
    sol8 sib la sol fa_+ mi
    fa4 \appoggiatura mi8 re4 la'\mbreak

    %116
    sib8 la16 sol dod4. si16 la re8
    sib' la sol fa mi
    fa mi16 re dod4.-+ re8

    %119
    re2 re8 dod si la
    re dod si la re4 re,
    re2_+ si'8 la sol si

    %122
    la4 re si mi
    dod la re8 dod si la
    re dod si la re4 re,\mbreak

    %125
    re2_+ si'8 la sol si
    la4 re si dod
    re2 fad8 mi fad sol

    %128
    la4 re, si2_+
    la re8 fad mi sol
    fad8 re dod re la' re, dod re

    %131
    mi2-+ re8 dod si la
    re dod si la re4 re,
    re2_+ si'8 la sol si

    %134
    la4 re si mi
    dod la re8 dod si la\mbreak
    re dod si la re4 re,

    %137
    re2_+ si'8 la sol si
    la4 re si dod
    re2 fad,8^\markup\italic "Haubois [I]"(sol) mi(fad)

    %140
    re4 re' re dod8 si
    la2 fad'4(mi8\prall) re
    fad4(mi8\prall) re la'4 sol8 fad
    mi4-+ la, fad8(sol) mi(fad)
    re4 re' re dod8 si\mbreak
    la2 fad'8 sol la re,
    mi dod re sol mi4.-+ re8
    re4.~re4 la8\tu
    sib la sol la4 la8

    %149
    re,4. fa8 mi re
    re'4 re8 re8. mi16 re8
    dod8. si16 la8 mi'4 fa8

    %152
    sol4 sol8 sol8. la16 sol8
    sol4-+ fa8 la4 la,8\mbreak
    la'4 la,8 la' sol fa

    %155
    mi4 la,8 mi'4 fa8
    sol4 sol8 sol la sol
    sol4-+ fa8 la4.

    %158
    fa8 mi re dod4.-+
    re sib
    la8 sol fa sol4 la8

    %161
    fa4 re8 sib'4.
    la8 sol fa mi4_+ re8
    re2.

}

XVIIIobIIn =  \relative do'' {

    la8 sol16 fad re4 re'
    mi8 dod re2
    mi8 fad sol(la16 si) la8 sol

    %4
    fad-+ (mi) re4 fad
    mi16 la sol fad mi re dod si la8 la
    fad4_+ \appoggiatura mi8 re4 re'

    %7
    dod8 re sol4 fad
    mi8-+ re mi4 la,
    si8 sol'16 fad mi8 sol si,16 la sol8

    %10
    la fad'16 mi re8 fad la, sol16 fad\mbreak
    sol8 mi'16 re dod8 mi sol,16 fad mi8
    fad la re la fad re

    %13
    si'16(dod re8) si16(dod re8) si16(dod re8)
    si4-+ la2
    si16\dolce(dod re8) si16(dod re8) si16(dod re8)

    %16
    si4-+ la2
    si8\f dod re mi fad sol
    la sol16 fad mi8[dod la mi']

    %19
    fad mi re dod si la
    sold'16 mi sold si mi,8 sold mi sold\mbreak
    la16 mi la dod mi,8 la mi la

    %22
    si16 mi, sold si mi,8 si' mi, si'
    dod16(si la8) si4 sold-+
    la8 mi16 re dod8 mi la,4

    %25
    fad'8^\markup\italic "Flûte [II]"  re16 mi fad8 re16 mi fad8 re16 mi
    fad8 fad,16\tu mi fad8 mi fad re
    sol'8^\markup\italic "Flûte [II]"  mi16 fad sol8 mi16 fad sol8 mi16 fad

    %28
    sol8 sol,16\tu  fad sol8 fad sol mi\mbreak
    la'8^\markup\italic "Flûte [II]" fad16 sol la8 fad16 sol la8 fad16 sol
    la8 sol fad re fad la
    mi4 mi2-+
    re8 fad\tu fad fad fad fad

    %33
    fad16 mi re dod si dod re mi fad8 si
    lad16 fad sold lad si8 fad re fad
    sol? dod, re4 dod-+

    %36
    si16 fad si re si re mi fad sol fad mi re
    mi dod mi sol la, mi' fad sol la sol fad mi\mbreak
    fad re fad la re, dod re mi fad mi re dod

    %39
    si re mi fad sol la si la sol fad mi re
    dod4-+ \appoggiatura si8 la la' re fad,
    sol si mi, sol dod mi,

    %42
    fa re mib sib' dod,!16 si! la8
    \tuplet 3/2 {
        fad'! (sol la) mi(fad sol) fad(mi re)
        sol(la si)
    } mi,4.-+ re8\mbreak

    %45
    re4 re re
    re8 re, re' re, re' re,
    re'4. la8 si la

    %48
    sol fad mi4._+ re8
    re2.~re4. re'8 la4
    re,2 mi4 fad4. sol8 la4

    %51
    la mi sol fad4. sol8 la4\mbreak
    la4 mi sol fad mi re
    la'2. mi'8 re dod si la sol

    %54
    sol4_+ fad2 fad'8 mi re dod si la
    la4_+ sold2  mi'4. fad8 mi4
    fad,fad fad re'4. mi8 re4

    %57
    mi,2. dod'8 re mi fad sold la
    si,4 si si dod4. re8 si4-+\mbreak
    la4. la8

    %60
    fad16 sol fad mi re mi fad sol
    la si dod re mi sol fad mi
    fad sol fad mi re fad mi re

    %63
    mi fad mi re dod si la sol
    fad sol fad mi re mi fad sol
    la si dod re mi sol fad mi

    %66
    fad sol fad mi re fad mi re
    mi4.-+ la8\mbreak
    dod,16 re mi4 la8

    %69
    mi16 fad sol4 mi8
    fad16 sol la4 re,8
    re-+ dod4 fad,8^\markup\italic "Haubois [II]"
    sol16 fad mi8 sol16 la si8
    fad16 sol fad mi re8 fad
    sol16 fad mi8 sol16 la si8
    fad4. la8\tu
    si16 dod re mi fad sol la re,

    %77
    dod re mi fad sol si la sol\mbreak
    fad mi re8 mi dod
    sol'4 sol

    %80
    sol~sol16 si la sol
    fad mi re8 mi dod
    re fad,16 mi re8 re

    %83
    re2 fa'4
    mi dod re
    sol, sol sol

    %86
    sol8 sib la sol fa_+ mi
    fa4\appoggiatura mi8 re4 la'
    sib8 la16 sol dod4. si16 la\mbreak

    %89
    re8 sib' la sol fa-+ mi
    fa mi16 re dod4.-+ re8
    re16 re, re re re re re re re re re re

    %92
    do do do do do do do do do do do do
    fa la sol la fa la sol la fa sib la sib
    sol sib la sib sol sib la sib sol do sib do

    %95
    la do re mi fa8 r r4
    R2.*4
    do16\f \repeat unfold 11 {do16}

    %101
    \repeat unfold 12 {re}
    \repeat unfold 12 {mi}
    R2.*4

    %107
    r4 la,\f\tu sib
    la r2
    r4 la\f\tu sib

    %110
    la8 r r2
    r2 fa'4\tu\f
    mi dod re

    %113
    sol, sol sol
    sol8 sib la sol fa_+ mi
    fa4 \appoggiatura mi8 re4 la'\mbreak

    %116
    sib8 la16 sol dod4. si16 la re8
    sib' la sol fa mi
    fa mi16 re dod4.-+ re8

    %119
    re2 re8 dod si la
    re dod si la re4 re,
    re2_+ si'8 la sol si

    %122
    la4 re si mi
    dod la re8 dod si la
    re dod si la re4 re,\mbreak

    %125
    re2_+ si'8 la sol si
    la4 re si dod
    re2 fad8 mi fad sol

    %128
    la4 re, si2_+
    la re8 fad mi sol
    fad8 re dod re la' re, dod re

    %131
    mi2-+ re8 dod si la
    re dod si la re4 re,
    re2_+ si'8 la sol si

    %134
    la4 re si mi
    dod la re8 dod si la\mbreak
    re dod si la re4 re,

    %137
    re2_+ si'8 la sol si
    la4 re si dod
    re2 fad,8^\markup\italic "Haubois [II]"(sol) mi(fad)

    %140
    re4 re' re dod8 si
    la2 fad'4(mi8\prall) re
    fad4(mi8\prall) re la'4 sol8 fad
    mi4-+ la, fad8(sol) mi(fad)
    re4 re' re dod8 si\mbreak
    la2 fad'8 sol la re,
    mi dod re sol mi4.-+ re8
    re4.~re4 la8\tu
    sib la sol la4 la8

    %149
    re,4. fa8 mi re
    re'4 re8 re8. mi16 re8
    dod8. si16 la8 mi'4 fa8

    %152
    sol4 sol8 sol8. la16 sol8
    sol4-+ fa8 la4 la,8\mbreak
    la'4 la,8 la' sol fa

    %155
    mi4 la,8 mi'4 fa8
    sol4 sol8 sol la sol
    sol4-+ fa8 la4.

    %158
    fa8 mi re dod4.-+
    re sib
    la8 sol fa sol4 la8

    %161
    fa4 re8 sib'4.
    la8 sol fa mi4_+ re8
    re2.

}

XVIIIdsn =  \relative do'' {

    la8 sol16 fad re4 re'
    mi8 dod re2
    mi8 fad sol(la16 si) la8 sol

    %4
    fad-+ (mi) re4 fad
    mi16 la sol fad mi re dod si la8 la
    fad4_+ \appoggiatura mi8 re4 re'

    %7
    dod8 re sol4 fad
    mi8-+ re mi4 la,
    si8 sol'16 fad mi8 sol si,16 la sol8

    %10
    la fad'16 mi re8 fad la, sol16 fad\mbreak
    sol8 mi'16 re dod8 mi sol,16 fad mi8
    fad la re la fad re

    %13
    si'16(dod re8) si16(dod re8) si16(dod re8)
    si4-+ la2
    si16\dolce(dod re8) si16(dod re8) si16(dod re8)

    %16
    si4-+ la2
    si8\f dod re mi fad sol
    la sol16 fad mi8[dod la mi']

    %19
    fad mi re dod si la
    sold'16 mi sold si mi,8 sold mi sold\mbreak
    la16 mi la dod mi,8 la mi la

    %22
    si16 mi, sold si mi,8 si' mi, si'
    dod16(si la8) si4 sold-+
    la8 mi16 re dod8 mi la,4

    %25
    R2.
    r8 fad16 mi fad8 mi fad re
    R2.

    %28
    r8 sol16  fad sol8 fad sol mi\mbreak
    R2.*3
    r8 fad' fad fad fad fad

    %33
    fad16 mi re dod si dod re mi fad8 si
    lad16 fad sold lad si8 fad re fad
    sol? dod, re4 dod-+

    %36
    si16 fad si re si re mi fad sol fad mi re
    mi dod mi sol la, mi' fad sol la sol fad mi\mbreak
    fad re fad la re, dod re mi fad mi re dod

    %39
    si re mi fad sol la si la sol fad mi re
    dod4-+ \appoggiatura si8 la la' re fad,
    sol si mi, sol dod mi,

    %42
    fa re mib sib' dod,!16 si! la8
    \tuplet 3/2 {
        fad'! (sol la) mi(fad sol) fad(mi re)
        sol(la si)
    } mi,4.-+ re8\mbreak

    %45
    re4 re re
    re8 re, re' re, re' re,
    re'4. la8 si la

    %48
    sol fad mi4._+ re8
    re2.~re4. re'8 la4
    re,2 mi4 fad4. sol8 la4

    %51
    la mi sol fad4. sol8 la4\mbreak
    la4 mi sol fad mi re
    la'2. mi'8 re dod si la sol

    %54
    sol4_+ fad2 fad'8 mi re dod si la
    la4_+ sold2  mi'4. fad8 mi4
    fad,fad fad re'4. mi8 re4

    %57
    mi,2. dod'8 re mi fad sold la
    si,4 si si dod4. re8 si4-+\mbreak
    la4. la8

    %60
    fad16 sol fad mi re mi fad sol
    la si dod re mi sol fad mi
    fad sol fad mi re fad mi re

    %63
    mi fad mi re dod si la sol
    fad sol fad mi re mi fad sol
    la si dod re mi sol fad mi

    %66
    fad sol fad mi re fad mi re
    mi4.-+ la8\mbreak
    dod,16 re mi4 la8

    %69
    mi16 fad sol4 mi8
    fad16 sol la4 re,8
    re-+ dod4 r8

    %72
    R2*3
    r4. la8
    si16 dod re mi fad sol la re,

    %77
    dod re mi fad sol si la sol\mbreak
    fad mi re8 mi dod
    sol'4 sol

    %80
    sol~sol16 si la sol
    fad mi re8 mi dod
    re fad,16 mi re8 re

    %83
    re2 fa'4
    mi dod re
    sol, sol sol

    %86
    sol8 sib la sol fa_+ mi
    fa4\appoggiatura mi8 re4 la'
    sib8 la16 sol dod4. si16 la\mbreak

    %89
    re8 sib' la sol fa-+ mi
    fa mi16 re dod4.-+ re8
    re16 re, re re re re re re re re re re

    %92
    do do do do do do do do do do do do
    fa la sol la fa la sol la fa sib la sib
    sol sib la sib sol sib la sib sol do sib do

    %95
    la do re mi fa8\dolce fa,^\markup\italic "Violons sans parties" fa fa
    fa16 re' mi fa sol8 sol, sol sol\mbreak
    sol mi16 fa sol8 la sib la

    %98
    sol^\markup\italic "tres doux" mi16 fa sol8 la sib la
    sol_+ fa sol2
    do16\f \repeat unfold 11 {do16}

    %101
    \repeat unfold 12 {re}
    \repeat unfold 12 {mi}
    fa\dolce^\markup\italic "Violons sans parties" do sib do la fa la do fa, do fa la

    %104
    re,8 re' re re re re\mbreak
    mi,4 fa r8 sib
    sib? la sol4._+ fa8

    %107
    fa4 la sib
    la re\dolce dod
    re la sib

    %110
    la8 re\dolce sol,4._+ la8
    la2 fa'4\f
    mi dod re

    %113
    sol, sol sol
    sol8 sib la sol fa_+ mi
    fa4 \appoggiatura mi8 re4 la'\mbreak

    %116
    sib8 la16 sol dod4. si16 la re8
    sib' la sol fa mi
    fa mi16 re dod4.-+ re8

    %119
    re2 re8 dod si la
    re dod si la re4 re,
    re2_+ si'8 la sol si

    %122
    la4 re si mi
    dod la re8 dod si la
    re dod si la re4 re,\mbreak

    %125
    re2_+ si'8 la sol si
    la4 re si dod
    re2 fad8 mi fad sol

    %128
    la4 re, si2_+
    la re8 fad mi sol
    fad8 re dod re la' re, dod re

    %131
    mi2-+ re8 dod si la
    re dod si la re4 re,
    re2_+ si'8 la sol si

    %134
    la4 re si mi
    dod la re8 dod si la\mbreak
    re dod si la re4 re,

    %137
    re2_+ si'8 la sol si
    la4 re si dod
    re2 r

    %140
    R1*7
    r4. r4 la8
    sib la sol la4 la8

    %149
    re,4. fa8 mi re
    re'4 re8 re8. mi16 re8
    dod8. si16 la8 mi'4 fa8

    %152
    sol4 sol8 sol8. la16 sol8
    sol4-+ fa8 la4 la,8\mbreak
    la'4 la,8 la' sol fa

    %155
    mi4 la,8 mi'4 fa8
    sol4 sol8 sol la sol
    sol4-+ fa8 la4.

    %158
    fa8 mi re dod4.-+
    re sib
    la8 sol fa sol4 la8

    %161
    fa4 re8 sib'4.
    la8 sol fa mi4_+ re8
    re2.

}

XVIIIhcn = \relative do'' {

    fad,4. fad8 fad4
    sol8 mi fad4 re'
    dod8 re mi4 dod-+

    %4
    re la re
    dod4. dod,8 dod dod
    re2 re4
    sol8 fad mi4 re

    %8
    dod4._+ dod8 re re
    re4. re8 re mi
    dod4. dod8 re re\mbreak

    %11
    si4. si8 si dod
    la4. fad'8 fad fad
    sol la sol  la sol la

    %14
    sol4_+ fad2
    sol8 la sol  la sol la
    sol4_+ fad2

    %17
    sol4 la2
    la la4
    la fad fad

    %20
    mi8 mi sold si sold si\mbreak
    la mi la dod la dod
    re si re re re re

    %23
    dod mi re4 si
    dod2 r4
    R2.

    %26
    r8 fad,16 mi fad8[mi fad re]
    R2.
    r8 sol16 fad sol8[fad sol mi]\mbreak

    %29
    R2.
    r4 si'8 si si fad
    sol4 la la,

    %32
    re re' mi
    re8 si si si si re
    dod4 re re

    %35
    si si lad
    si8 si si si si si
    la la la la la la\mbreak

    %38
    la4 la la
    sol si si
    la la la

    %41
    si2 la4
    la sib la
    la la la

    %44
    si8 re dod4.-+ re8\mbreak
    re4 la la
    si si si

    %47
    la4. fad8 mi fad
    dod re dod4._+ re8
    re2.~re4 r r

    %50
    r4 r8 fad dod4 re2 re4
    mi2 dod4 re2 re4\mbreak
    mi2 dod4 re la si

    %53
    dod2 dod4 dod2 mi4
    re2 re4 re2 fad4
    mi2 mi4 mi dod mi

    %56
    mi2 mi4 re2 re4
    re2 re4 dod2 dod4
    fad2 fad4 mi2 mi4\mbreak

    %59
    dod8[re mi dod]
    re[re re re]
    mi[mi mi mi]

    %62
    re[re re re]
    dod4. dod8
    re[re re re]

    %65
    mi[mi mi mi]
    re[re re re]
    dod4.  mi8\mbreak

    %68
    mi16 fad sol4 dod8
    dod16 re mi4 dod8
    re mi,4 fad8

    %71
    mi-+ re4 r8
    R2*3
    r8 fad [fad fad]

    %76
    sol[sol fad fad]
    mi4 mi_+\mbreak
    re8[la' sol mi]

    %79
    re re'16 dod re8 re
    mi[re mi dod]
    re[la sol mi]

    %82
    fad[re la la]
    la2 la'4
    la mi fa

    %85
    dod4. re8[dod re]
    mi2 dod4
    re la4. la'8

    %88
    sol4 sol2\mbreak
    fa4 mi re
    sib'  mi,4._+ re8

    %91
    re4 la la
    sib la2
    la16 re re re re re re re re re re re

    %94
    \repeat unfold 12 {do}
    do4 r r
    R2.*4

    %100
    la'4 la la
    \repeat unfold 12 {la16}
    \repeat unfold 12 {sol}

    %103
    la4 r r
    R2.*3
    r4 re, sol

    %108
    fa r r
    r re sol
    fa8 r r4 r

    %111
    r r la
    la mi fa
    dod4. re8[dod re]

    %114
    mi4. re8 dod4
    re la4. la'8\mbreak
    sol4 sol2

    %117
    fa4 mi re
    sib' mi,4._+ re8
    re2 r

    %120
    r la
    la r4 re
    re2 re4 sol

    %123
    mi2_+ r
    r la,\mbreak
    la r4 re

    %126
    fad fad mi sol
    fad2 la4 la
    la la la sold

    %129
    la2 la
    la la
    la r

    %132
    r la,
    la r4 re
    re2 re4 sol

    %135
    mi2_+ r
    r la,
    la r4 re

    %138
    re fad mi \parenthesize sol
    \parenthesize r2 la,~
    la1~

    %141
    la~
    la~
    la~

    %144
    la~
    la~
    la~

    %147
    la4.~la4 r8
    R2.
    r4 r8 r4 fa'8

    %150
    si,4 si8 si4._+
    la dod'4 dod8
    re4 re8 re4 dod8

    %153
    re4. la8 sol fa
    sol4 sol8 fa4 la8
    la4. dod4 dod8\mbreak

    %156
    re4 re8 re4 dod8
    re4. mi8 re dod
    re4 sib8 la4 sol8

    %159
    fa4. sol
    fa8 mi re mi re dod
    re4. dod8 re mi

    %162
    re dod re dod4 re8
    re2.

}

XVIIItln =  \relative do' {

    re4. re8 re4
    si8 la la4 la'
    la si8 sol mi4-+

    %4
    re re la
    la4. la8 la la
    la2 la4

    %7
    la2 la4
    la4. la8 la fad
    sol4. sol8 sol si

    %10
    la4. la8 la la\mbreak
    sol4. sol8 sol sol
    fad4.re'8 re re

    %13
    re re re re re re
    re4 re2
    re8 re re re re re

    %16
    re4 re2
    re re4
    mi dod mi

    %19
    re re re
    si r mi\mbreak
    mi mi mi

    %22
    mi mi mi
    mi fad mi
    mi2 r4

    %25
    R2.
    r8 fad16 mi fad8[mi fad re]
    R2.

    %28
    r8 sol16 fad sol8[fad sol mi]\mbreak
    R2.
    r4 si'8 si si  fad

    %31
    sol4 la la,
    re fad sol
    fad8 fad re re re fad

    %34
    fad4 fad fad
    mi8 sol fad4 mi
    re8 re sol sol sol sol

    %37
    sol sol sol sol mi dod\mbreak
    re4 re re
    re mi mi

    %40
    mi mi re
    re2 dod4
    re8 fa sol4 mi-+

    %43
    re mi re
    re8 sol sol4 sol\mbreak
    fad fad fad

    %46
    re sol re
    fad4. re8 re re
    mi la, la4 la

    %49
    fad2.~fad4 r r
    r r8 re la'4 la4. sol8 fad4
    la2 la4 la4. sol8 fad4\mbreak

    %52 OOKK
    la2 la4 la la sold
    la2 la4 la2 la4
    la2 la4 la2 re4

    %55
    si2_+ si4 dod2 dod4
    la2 la4si2 si4
    si sold si la2 la4

    %58
    la2 la4 la2 sold4\mbreak
    la4. la8
    la[la fad la]

    %61
    la[la la la]
    la[la fad la]
    la4. la8

    %64
    la[la fad la]
    la[la la la]
    la[la fad la]

    %67
    la4. dod8\mbreak
    mi16 re dod4 mi8
    mi16 re dod4 la'8

    %70
    la[re, la la]
    la8 la4 r8
    R2*3

    %75
    r8 re[re re]
    re [si la la]
    la4 la\mbreak

    %78
    la8[do si la]
    sol4. si8
    la4 la

    %81
    la8[la si la]
    la la16 sol fad8 fad
    fad2 re'4

    %84 OOKK
    dod la la
    sib2 sib4
    la2 la4

    %87
    la2 fa'4
    mi mi2-+\mbreak
    re4 mi la,

    %90
    la8 sol sol2
    fa4 fa fa
    sol sol2

    %93
    \repeat unfold 12 {fa16}
    \repeat unfold 12 {sol16}
    fa4 r r

    %96
    R2.*4
    fa'4 fa fa
    \repeat unfold 12 {fa16}

    %102
    \repeat unfold 12 {do16}
    do4 r r
    R2.*3

    %107
    r4  fa mi
    re r r
    r fa mi

    %110
    re8 r r4 r
    r r re
    dod la la

    %113
    sib2 sib4
    la2 la4
    la2 fa'4\mbreak

    %116
    mi mi2-+
    re4 mi la,
    la8 sol sol2

    %119 OOKK
    fad r
    r fad
    fad sol

    %122
    fad sol4 si
    la2 r
    r fad\mbreak

    %125
    fad sol
    fad4 la si la
    la2 re4 re

    %128
    re fad fad mi
    dod2 re4 mi
    re sol fad8 la sol fad

    %131
    dod2-+ r
    r fad,
    fad sol

    %134
    fad sol4 si
    la2 r
    r fad

    %137
    fad sol
    fad4 la si \parenthesize la
    r2 re,2~

    %140
    re1~
    re~
    re~

    %143
    re~
    re~
    re~

    %146
    re~
    re4.~re4 r8
    R2.

    %149
    r4 r8 r4 la'8
    la4. sold_+
    la4.~la4 la'8

    %152
    mi4 mi8 mi4.-+
    re re8 dod re
    mi4. re

    %155
    dod r4 la'8\mbreak
    mi4 mi8 mi4.-+
    re4 la8 la4 la'8

    %158
    la sol fa mi4.-+
    re re
    re4 la8 la4 la8

    %161
    la sol fa mi fa sol
    fa sol la la4 la8
    fa2.

}

XVIIIfgn = \relative do {

    re4. re'8 si4
    sol8 la re, fad16 mi re8 fad
    sol fad mi4 la,

    %4
    re fad re
    la'4. la,8 dod la
    re4. mi8 fad4

    %7
    mi8 re dod4 re
    la4. la'8 fad re
    sol,4. si'8 sol re\mbreak

    %10
    fad,4. la'8 fad re
    mi,4. sol'8 mi dod
    re,4. re'8 re, re'

    %13
    sol fad sol fad sol fad
    sol4 re8 re' fad, re
    sol fad sol fad sol fad

    %16
    sol4 re8 re' fad, re
    sol4 fad re
    dod la dod

    %19
    re fad re
    mi mi' re\mbreak
    dod4 dod dod

    %22
    sold2 sold4
    la8 dod, re4 mi
    la,2 r4

    %25
    R2.
    r8 fad'16 mi fad8[mi fad re]
    R2.

    %28
    r8 sol16 fad sol8[fad sol mi]\mbreak
    R2.
    \clef alto\key re\major r4 si''8 si si fad

    %31
    sol4 la la,
    re \clef bass\key re\major si4 lad
    si8 si, re fad re si

    %34
    fad'4 re si
    mi fad fad,
    si8 si si si si si

    %37
    dod dod dod dod dod la\mbreak
    re4 fad re
    sol mi sol

    %40
    la sol fad
    mi2 la4
    re sol, la

    %43
    re, dod re
    si'8 sol la4 la,\mbreak
    re16 fad mi fad re fad mi fad re fad mi fad

    %46
    sol si la si sol si la si sol si la si
    fad re' dod re fad, re' dod re sol,8 fad
    mi re la'4 la,

    %49
    re2.~re4. r4 r8
    r4 r8 re' la4 re,4. mi4 fad8
    dod2 la4 re4. mi8 fad4\mbreak

    %52
    dod2 la4 re dod si
    la dod mi dod la dod
    re4. la8 re,4 re' fad re

    %55
    mi4. fad8 mi re dod4 la' dod,
    re4. mi8 re dod si la si dod si la
    sold4 mi' sold, la dod la

    %58
    re4. fad8 re4 mi2 mi,4\mbreak
    la8 [si dod la]
    re8[re re re]

    %61
    dod[la' dod, la]
    re[re re re,]
    la'4. la8

    %64
    re[re re re]
    dod[la' dod, la]
    re[re re re,]

    %67
    la'4 la
    la la
    la la

    %70
    re16 mi fad mi re mi fad sol
    la8 la,4 re8
    sol4 r8 sol,
    re'4 r8 re
    sol4 r8 sol,

    %75
    re'8 [re fad re]
    sol4 re
    la' dod,\mbreak

    %78
    re8[fad, sol la]
    si[la si sol]
    dod[si dod la]

    %81
    re[fad, sol la]
    re,4 re
    re2 re'4

    %84 OOKK
    la' sol fa
    mi8 fa sol fa mi re
    dod2 la4

    %87
    re fa re
    sol4 la la,\mbreak
    sib' dod, re

    %90
    sol, la2
    re,4 re' re
    re dod2

    %93
    \repeat unfold 12{re16}
    \repeat unfold 12{mi16}
    \clef tenor fa do' sib do la fa la do fa, do fa la

    %96
    re, re' do re sib sol sib re sol, re sol sib\mbreak
    mi,8 do'16 re mi8[fa sol fa]
    mi8 do16 re mi8[fa sol fa]

    %99
    mi fa mi re do sib
    la4 fa la
    \clef bass \repeat unfold 24{sib16}

    %103
    la4 do8 fa, do'[do]
    do16 fa, sol la sib fa sol la sib8 sib\mbreak
    sib4 la8 re re[do]

    %106
    do fa mi4.-+ fa8
    fa4 fa, dod
    re fa mi

    %109
    fa fa dod
    re sib2
    la re4

    %112
    la' sol fa
    mi8 fa sol fa mi re
    dod2 la4

    %115
    re fa re\mbreak
    sol la la,
    sib' dod, re

    %118
    sol, la2
    re, r
    r re'8 dod si la

    %121
    re dod si la re4 re,
    re8 re' fad re sol4 mi
    la la, r2

    %124
    r re8 dod si la\mbreak
    re8 dod si la re4 re,
    re fad' sol la

    %127
    re,2 re'4 re
    fad, fad re mi
    la, la'8 sol fad4 dod

    %130
    re mi fad mi8 re
    la2 r
    r re8 dod si la\mbreak

    %133
    re8 dod si la re4 re,
    re8 re' fad re sol4 mi
    la la, r2\mbreak

    %136
    r re8 dod si la\mbreak
    re8 dod si la re4 re,
    re fad' sol la

    %139
    re,2 la'8 si sol la
    fad4 fad' fad mi8 re
    dod4 la re la

    %142
    re la fad' mi8 re
    la2 la8 si sol la
    fad4 fad' fad mi8 re\mbreak

    %145
    dod4 la re8 mi fad4
    la,8 sol' fad si, dod4.-+ re8
    re4. re4 r8

    %148
    R2.
    r4 r8 r4 re,8
    fa mi re mi4 mi8

    %151
    la,4.~la4 la'8
    sib la sol la4 la8
    re,4. fa8 mi re\mbreak

    %154
    dod4. re
    la~la4 la'8
    sib la sol la4 la8

    %157
    re,4. dod8 si la
    re4 sol8 la4 la,8
    re fa re sol, sib sol\mbreak

    %160
    re'4. dod8 si? la
    re mi fa sol fa mi
    fa mi re la'4 la,8

    %163
    re2.

}

XVIIIbcn = \relative do {

    re4. re'8 si4
    sol8 la re, fad16 mi re8 fad
    sol fad mi4 la,

    %4
    re fad re
    la'4. la,8 dod la
    re4. mi8 fad4

    %7
    mi8 re dod4 re
    la4. la'8 fad re
    sol,4. si'8 sol re\mbreak

    %10
    fad,4. la'8 fad re
    mi,4. sol'8 mi dod
    re,4. re'8 re, re'

    %13
    sol fad sol fad sol fad
    sol4 re8 re' fad, re
    sol fad sol fad sol fad

    %16
    sol4 re8 re' fad, re
    sol4 fad re
    dod la dod

    %19
    re fad re
    mi mi' re\mbreak
    dod4 dod dod

    %22
    sold2 sold4
    la8 dod, re4 mi
    la,2 r4

    %25
    R2.
    r8 fad'16 mi fad8[mi fad re]
    R2.

    %28
    r8 sol16 fad sol8[fad sol mi]\mbreak
    R2.
    \clef alto\key re\major r4 si''8 si si fad

    %31
    sol4 la la,
    re \clef bass\key re\major si4 lad
    si8 si, re fad re si

    %34
    fad'4 re si
    mi fad fad,
    si8 si si si si si

    %37
    dod dod dod dod dod la\mbreak
    re4 fad re
    sol mi sol

    %40
    la sol fad
    mi2 la4
    re sol, la

    %43
    re, dod re
    si'8 sol la4 la,\mbreak
    re16 fad mi fad re fad mi fad re fad mi fad

    %46
    sol si la si sol si la si sol si la si
    fad re' dod re fad, re' dod re sol,8 fad
    mi re la'4 la,

    %49
    re2.~re4. r4 r8
    r4 r8 re' la4 re,4. mi4 fad8
    dod2 la4 re4. mi8 fad4\mbreak

    %52
    dod2 la4 re dod si
    la dod mi dod la dod
    re4. la8 re,4 re' fad re

    %55
    mi4. fad8 mi re dod4 la' dod,
    re4. mi8 re dod si la si dod si la
    sold4 mi' sold, la dod la

    %58
    re4. fad8 re4 mi2 mi,4\mbreak
    la8 [si dod la]
    re8[re re re]

    %61
    dod[la' dod, la]
    re[re re re,]
    la'4. la8

    %64
    re[re re re]
    dod[la' dod, la]
    re[re re re,]

    %67
    la'4 la
    la la
    la la

    %70
    re16 mi fad mi re mi fad sol
    la8 la,4 r8
    R2*3

    %75
    r8 re [fad re]
    sol4 re
    la' dod,\mbreak

    %78
    re8[fad, sol la]
    si[la si sol]
    dod[si dod la]

    %81
    re[fad, sol la]
    re,4 re
    re2 re'4

    %84 OOKK
    la' sol fa
    mi8 fa sol fa mi re
    dod2 la4

    %87
    re fa re
    sol4 la la,\mbreak
    sib' dod, re

    %90
    sol, la2
    re,4 re' re
    re dod2

    %93
    \repeat unfold 12{re16}
    \repeat unfold 12{mi16}
    fa4 fa la,

    %96
    sib sol sib
    do2.~
    do~

    %99
    do2 do'8 sib
    la4 fa la
    \repeat unfold 24{sib16}

    %103
    la4 fa la,
    sib2 sol4\mbreak
    do re r8 mi

    %106
    fa4 do do,
    fa fa' dod
    re fa mi

    %109
    fa fa dod
    re sib2
    la re4

    %112
    la' sol fa
    mi8 fa sol fa mi re
    dod2 la4

    %115
    re fa re\mbreak
    sol la la,
    sib' dod, re

    %118
    sol, la2
    re, r
    r re'8 dod si la

    %121
    re dod si la re4 re,
    re8 re' fad re sol4 mi
    la la, r2

    %124
    r re8 dod si la\mbreak
    re8 dod si la re4 re,
    re fad' sol la

    %127
    re,2 re'4 re
    fad, fad re mi
    la, la'8 sol fad4 dod

    %130
    re mi fad mi8 re
    la2 r
    r re8 dod si la\mbreak

    %133
    re8 dod si la re4 re,
    re8 re' fad re sol4 mi
    la la, r2\mbreak

    %136
    r re8 dod si la\mbreak
    re8 dod si la re4 re,
    re fad' sol la

    %139
    re,2 re,~
    re1~
    re~

    %142
    re~
    re~
    re~

    %145
    re~
    re~
    re4.~re4 r8

    %148
    R2.
    r4 r8 r4 re'8
    fa mi re mi4 mi8

    %151
    la,4.~la4 la'8
    sib la sol la4 la8
    re,4. fa8 mi re\mbreak

    %154
    dod4. re
    la~la4 la'8
    sib la sol la4 la8

    %157
    re,4. dod8 si la
    re4 sol8 la4 la,8
    re fa re sol, sib sol\mbreak

    %160
    re'4. dod8 si? la
    re mi fa sol fa mi
    fa mi re la'4 la,8

    %163
    re2.

}

XVIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6 5>
    <6 5>8 <6> <7>4 <7>
    s2.*3
    <6\\>4 <5/> s
    <4> <3> <6>
    <7> <6\\> s
    <7> <6\\> s
    <7> <6\\> s
    s2.
    <6 5>
    <6 5>
    <6 5>
    <6 5>
    <6 5>4 <6> s
    <6>2.
    <6 5>
    <_+>
    <6>
    <5/>
    s4 <6 5> <_+>
    s2.
    s
    s8 <6> s2
    s2.
    s8 <6 5> s2
    s2.
    s
    <6 5>
    s2 <5/>4
    s2.
    <_+>4 <6> s
    <6 5> <6 4> <7 _+>
    s s <6>
    <7> <6 5/> s
    s s s
    <9> <7> s
    s s <6>
    <7>2 <7>4
    <_-> <6-> <_+>
    <_+> <5/> s
    <6\\> <4> <7>
    s2.
    <6 5>
    <6>4 s <6 5>
    <6\\> <4> <7>
    s1.
    s
    <5/>
    <5/>1 <6>4 <6\\\+>
    \bassFigureExtendersOn <_>2 <_>4 <_> s2\bassFigureExtendersOff
    <4>4 <3> s <6 5> s s
    <4> <_+> s <6> s s
    <9>2. <7>
    <5/> s
    <6 5> <6 4>2 <7 _+>4
    s2*2
    <5/>2
    s2*3
    <5/>2
    s2*3
    <7>2
    s
    <4>8 <3>4 s8
    <6 5>2
    s
    <6 5>
    s
    <6 5> s4 <5/>
    s <6 5>
    <6>2
    <5/>
    s4 <6 5>
    s2
    s2.
    <_+>2 <6>4
    <7 5/>2.
    <5/>
    s
    <6 5 _->4 <_+> s
    s <5/> s
    <7 _->4 <_+>2
    s2.
    <2>4 <5/>2
    s <6->4
    <7 > <6 5/> s
    s2.
    <6 5>
    s2.*3
    <6>2.
    <9>4 <3> s
    <4\+>2.
    <6>
    <9>4 <8> s
    <7> <5> s8 <5/>
    <4> <3> s2
    s <5/>4
    s2 <6\+ 5/>4
    <6> s <7->
    s4 <6>2
    <_+>2.
    <_+>2 <6>4
    <7 5/>2.
    <5/>
    s
    <6 5 _->4 <_+> s
    s <5/>2
    <7 _->4 <_+>2
    s1
    s2 \bassFigureExtendersOn <_>4 <_>8  <_>16 s\bassFigureExtendersOff
    \bassFigureExtendersOn <_>4 <_>8  <_>16 s\bassFigureExtendersOff <6 4>2
    <3> <6 5>2
    s1
    s2 \bassFigureExtendersOn <_>4 <_>8  <_>16 s\bassFigureExtendersOff
    \bassFigureExtendersOn <_>4 <_>8  <_>16 s\bassFigureExtendersOff <6 4>2
    <3>4 <6 5> <6 5>2
    s1
    <6>2 <6 5>4 <_+>
    s2 <6>4 <5/>
    \bassFigureExtendersOn <_>4 <_>8  <_>16 s\bassFigureExtendersOff s2
    s1
    s2 \bassFigureExtendersOn <_>4 <_>8  <_>16 s\bassFigureExtendersOff
    \bassFigureExtendersOn <_>4 <_>8  <_>16 s\bassFigureExtendersOff <6 4>2
    <3> <6 5>
    s1
    s2 \bassFigureExtendersOn <_>4 <_>8  <_>16 s\bassFigureExtendersOff
    \bassFigureExtendersOn <_>4 <_>8  <_>16 s\bassFigureExtendersOff <6 4>2
    <3> <6 5>
    s1*8
    s2.*3
    <6>4. <7 5/>
    <_+> s4 <6 4>8
    <6\\>4. <7 _+>
    <4>4 <3>8 <6>4.
    <5/> s
    <4> <_+>4 <6 4>8
    <6\\>4. <7 _+>
    <4>4 <3>8 <5/>4.
    s4 <6 5 _->8 <_+>4.
    s <_->
    s <5/>
    s <4\+ 3->
    <6> <4>4 <7 _+>8

}

forma = {

    \key re\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 60
    s2.*48\break
    \time 6/4
    \tempo 2. = 50
    s1.*10
    \time 2/4
    \tempo 2 = 65
    s2*24
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 65
    s2\break
    \once\override Score.RehearsalMark.extra-offset = #'(0 . +1)
    \mark\markup\italic "Mineur"
    \key do\major
    s4
    s2.*35
    \time 2/2
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 50
    s2\break
    \mark\markup\italic "Maieur"
    \key re\major
    s
    s1*19
    \time 2/2
    \tempo 1 = 50
    s1*8
    \time 6/8
    \tempo 2. = 50
    s4. s4\break
    \mark\markup\italic "Mineur"
    \key do\major
    s8
    s2.*16
    \bar"|."

}

XVIIIobI = {
    \XVIIIglobal
    <<\XVIIIobIn \forma>>

}

XVIIIobII = {
    \XVIIIglobal
    <<\XVIIIobIIn \forma>>

}

XVIIIds = {
    \XVIIIglobal
    <<\XVIIIdsn \forma>>

}

XVIIIhc = {
    \XVIIIglobal
    <<\XVIIIhcn \forma>>

}

XVIIItl = {
    \XVIIIglobal
    \clef alto
    <<\XVIIItln \forma>>

}

XVIIIfg = {
    \XVIIIglobal
    \clef bass
    <<\XVIIIfgn \forma>>

}

XVIIIbc = {
    \XVIIIglobal
    \clef bass
    <<\XVIIIbcn \forma \XVIIIbfn>>

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper {
    print-first-page-number = ##t
    first-page-number = #2
}

\bookpart {

    \header {
        title = \markup\column\smaller { "Les Voyages de l'Amour - Suite - Parte I"}
        composer = \markup \center-column{"J, B. Boismortier (1689-1755)"}
    }

    \paper {
        systems-per-page = #3
    }

    \markup \huge  {"[1.] Ouverture"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 sol''4^\markup \center-align\tiny\center-column {"Haubois & Flûte [I]"}  sol'4. sol''8}
                    \set Staff.shortInstrumentName = "ob1"
                    \clef violin
                    \set Staff.midiInstrument = #"oboe"
                    \IobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key sol\major \once\override Staff.TimeSignature.style = #'single-digit  \time 3/4 sol''4^\markup \center-align\tiny\center-column {"Haubois & Flûte [II]"}  sol'4. sol''8}
                    \set Staff.shortInstrumentName = "ob2"
                    \clef violin
                    \set Staff.midiInstrument = #"oboe"
                    \IobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 sol''4^\markup \center-align\smaller\center-column {"[Dessus]"}  sol'4. sol''8}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Ids
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 re'4^\markup \center-align\column\smaller{"[Haute-contre]"} re'4. re'8}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Ihc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 si4^\markup \center-align\column\smaller{"[Taille]"} si4.  si8}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Itl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \Ifg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[2.] Air"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 sol''8.^\markup \center-align\smaller\center-column {"[Dessus]"}  [(la''32 si'')]}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 si'4.^\markup \center-align\column\smaller{"[Haute-contre]"} la'8}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 re'4^\markup \center-align\column\smaller{"[Taille]"} sol'}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[3.] Rigaudon"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 2/2 re''4 ^\markup \center-align\smaller\center-column {"[Dessus]"} sol''}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 2/2 si'4^\markup \center-align\column\smaller{"[Haute-contre]"}si'8[la']}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 2/2 sol'8^\markup \center-align\column\smaller{"[Taille]"} [re'] mi'4}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #5
    }

    \markup \huge  {"[4.] 2." \super e "Rigaudon"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.style = #'single-digit \time 2/2 re''4 ^\markup \center-align\smaller\center-column {"Haubois"} do''}
                \set Staff.shortInstrumentName = "ob"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \IVobI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \IVfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IVbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 18)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[5.] Gigue"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key sol\major \time 6/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sol''8^\markup \center-align {"Haubois [I]"}  re''4}
                    \set Staff.shortInstrumentName = "ob1"
                    \clef violin
                    \set Staff.midiInstrument = #"oboe"
                    \VobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key sol\major \numericTimeSignature\override Staff.TimeSignature.style = #'single-digi \time 6/8 sol''8^\markup \center-align {"Haubois [II]"}  re''4}
                    \set Staff.shortInstrumentName = "ob2"
                    \clef violin
                    \set Staff.midiInstrument = #"oboe"
                    \VobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key sol\major \time 6/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sol''8^\markup \center-align {"[Dessus]"}  re''4}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Vds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \time 6/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r8 r2. r4 r8 r4^\markup \center-align{"[Haute-contre]"} fad'8}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Vhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sol\major \time 6/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r8 r2. r4^\markup \center-align{"[Taille]"} sol'8}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Vtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \Vfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Vbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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


    \markup \huge  {"[6.] Menuet"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 sib'8 ^\markup \center-align\smaller\center-column {"[Dessus]"} [do'']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 sol'4^\markup \center-align\column\smaller{"[Haute-contre]"} la'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 re'4^\markup \center-align\column\smaller{"[Taille]"} do'2}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \VItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #5
    }

    \markup \huge  {"[7.] 2." \super e "Menuet"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sol\major \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 si''8 ^\markup \center-align\smaller\center-column {"Haubois"} [sol'']
                }
                \set Staff.shortInstrumentName = "ob"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \VIIobI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \VIIfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 18)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[8.] Ritournelle"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sol\major \time 2/2 sol'4 ^\markup \center-align\smaller\center-column {"Flûte seule"}
                }
                \set Staff.shortInstrumentName = "fl"
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \VIIIflI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sol\major \time 2/2 r4^\markup \center-align\smaller\center-column {"Violons"} r2 r4  sol'
                }
                \set Staff.shortInstrumentName = "vl"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIIvlI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 18)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[9.] Rondeau - Gracieusement"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key sib\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do''4^\markup \center-align {"Haubois [I]"}  re''}
                    \set Staff.shortInstrumentName = "ob1"
                    \clef violin
                    \set Staff.midiInstrument = #"oboe"
                    \IXobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key sib\major \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit \time 3/4 do''4^\markup \center-align {"Haubois [II]"}  re''4}
                    \set Staff.shortInstrumentName = "ob2"
                    \clef violin
                    \set Staff.midiInstrument = #"oboe"
                    \IXobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key sib\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do''4^\markup \center-align {"[Dessus]"}  re''4}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IXds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'4^\markup \center-align{"[Haute-contre]"} fa'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IXhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sib\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol4^\markup \center-align{"[Taille]"} lab}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IXtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \IXfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IXbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[10.] Canaries"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 6/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi mi''8. [fa''16 ^\markup \center-align\smaller\center-column {"[Dessus]"} sol''8]}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Xds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 6/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r4 r8^\markup \center-align\column\smaller{"[Haute-contre]"} r4 r8 mi'8.[mi'16 re'8]}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Xhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major  \time 6/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r4 r8^\markup \center-align\column\smaller{"[Taille]"} r4 r8 do'8.[do'16 si8]}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Xtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Xbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #5
    }

    \markup \huge  {"[11.] 2."\super e "Canaries"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sib\major \time 6/8\numericTimeSignature\once\override Staff.TimeSignature.style = #'single-digi mib''8. ^\markup \center-align\smaller\center-column {"Haubois [I]"} [fa''16 mib''8]]
                }
                \set Staff.shortInstrumentName = "ob1"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XIobI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sib\major \time 6/8\numericTimeSignature\once\override Staff.TimeSignature.style = #'single-digi do''8. ^\markup \center-align\smaller\center-column {"Haubois [II]"} [re''16 do''8]
                }
                \set Staff.shortInstrumentName = "ob2"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XIobII
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XIfg
            >>
        >>

        \layout {
            #(layout-set-staff-size 18)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[12.] Tambourin"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sol''16 [fa''^\markup \center-align\smaller\center-column {"[Dessus]"} mi'' re'']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi do''4^\markup \center-align\column\smaller{"[Haute-contre]"} do''}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major  \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi mi'4.^\markup \center-align\column\smaller{"[Taille]"} sol'8}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[13.] 2" \super e "Tambourin"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sol'4^\markup \center-align\smaller\center-column {"Haubois [I]"} la'}
                \set Staff.shortInstrumentName = "ob1"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XIIIobI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi mi'4^\markup \center-align\column\smaller{"Haubois [II]"} fa'}
                \set Staff.shortInstrumentName = "ob2"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XIIIobII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major  \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi mi'8[^\markup \center-align\column\smaller{"[Haute-contre]"} mi' do' la]}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIIhc
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XIIIfg
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[14.] Air en rondeau"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do''8 ^\markup \center-align\smaller\center-column {"[Dessus]"} [sol''16 fa'']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIVds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi'4.^\markup \center-align\column\smaller{"[Haute-contre]"} fa'8}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIVhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major  \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do'2.^\markup \center-align\column\smaller{"[Taille]"} do'4}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XIVtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XIVbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[15.] Passepied"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sol'8 ^\markup \center-align\smaller\center-column {"[Dessus]"} do''}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r8 r^\markup \center-align\column\smaller{"[Haute-contre]"} r sol'8}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major  \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r8 r^\markup \center-align\column\smaller{"[Taille]"} r do'}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XVtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XVbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #5
    }

    \markup \huge  {"[16.] 2."\super e "Passepied"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sib\major \time 3/8\numericTimeSignature\once\override Staff.TimeSignature.style = #'single-digi do''8^\markup \center-align\smaller\center-column {"Haubois [I]"}  mib''
                }
                \set Staff.shortInstrumentName = "ob1"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XVIobI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key sib\major \time 3/8\numericTimeSignature\once\override Staff.TimeSignature.style = #'single-digi sol'8 ^\markup \center-align\smaller\center-column {"Haubois [II]"} do''
                }
                \set Staff.shortInstrumentName = "ob2"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XVIobII
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XVIfg
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[17.] Simphonie"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef french \key do\major \time 3/8\numericTimeSignature\once\override Staff.TimeSignature.style = #'single-digi re'32[^\markup \center-align\smaller\center-column {"[Dessus]"}  mi' fa' mi']
                }
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVIIds
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XVIIfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"cello"
                \XVIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[18.] Caprice"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key re\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'8^\markup \smaller\center-align {"Haubois & Flûte [I]"}  [sol'16 fad']}
                    \set Staff.shortInstrumentName = "ob1"
                    \clef violin
                    \set Staff.midiInstrument = #"oboe"
                    \XVIIIobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key re\major \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit \time 3/4 la'8^\markup \tiny\center-align {"Haubois & Flûte [II]"}  [sol'16 fad']}
                    \set Staff.shortInstrumentName = "ob2"
                    \clef violin
                    \set Staff.midiInstrument = #"oboe"
                    \XVIIIobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'8^\markup \smaller\center-align {"[Dessus]"}  [sol'16 fad']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVIIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'4^\markup\smaller \center-align{"[Haute-contre]"} fa'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVIIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sib\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol4^\markup\smaller \center-align{"[Taille]"} lab}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XVIIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XVIIIfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XVIIIbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
