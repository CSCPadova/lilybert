\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

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

fort = _\markup\italic"fort"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

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
        \musicglyph "scripts.prall"
    }
}


mbreak = { }



IvlIn = \relative do'' {

    mi2 fa4. fa8
    mi la, mi'2 re4
    do8 [la do re] mi4 mi,

    %4
    r si' do dod8 dod
    re4 red mi2~
    mi8[fa] re4. dod8 re4

    %7
    do?4. do8 si2
    R1
    r2 r4 la8 la

    %10
    fa'4. fa8 fa4 mi\mbreak
    re2(dod4) re~
    re do? si2

    %13
    la4 r8 mi si'4. do16 re
    do8 si la16 si do re mi do re si do la si fad
    sold8 mi r mi' fa16 re dod re fa re dod re\mbreak

    %16
    sib8(la) r mi' fa16 re dod re fa re dod re
    si?8(la) sold la_\upl re, re'4  do?16 si
    do la do mi dod la dod mi la8 re,4 do?16 si

    %19
    do la do mi dod la dod mi la(sol) sol(fa) fa(mi) mi(re)
    re(do?) do(si)si la la si sold8 la16 si si8. si16\mbreak
    la8 la' do, sold' la4 r8 mi,\p

    %22
    si'4\upl sold\tr la8(sold) r4
    r r8 mi' \f fa16 re dod re fa re dod re
    sib8(la) r mi'\p fa16 re dod re fa re dod re

    %25
    sib8 la sold la re, re'4\p mi16 re\mbreak
    do8 re mi2 red8 mi16 fad
    sol8 mi r4 r r8  sold,\p

    %28
    mi mi' r4 r r8 sold,
    mi mi' r4 r2
    R1\mbreak

    %31
    r4 r8  fad, sol16 mi sol si sold mi sold si
    mi8 la,4 sol16(fad) sol mi sol si sold mi sold si
    mi(re) re(do) do(si) si(la) la(sol) sol(fad) fad(mi) mi(fad)

    %34
    red8 mi16 fad fad8. mi16 mi8 mi' fad, red'
    mi4 r mi2\mbreak

    %36
    red4. red8 mi  sol fad4
    mi4. red16[mi] fad4 si,
    r2 mi

    %39
    red4 re8 re dod4 do~
    do si la(si)~\mbreak
    si la si2

    %42
    r2  mi16(re) re(do) do(si) si(la)
    la(sol) sol(fad) fad(mi) mi(fad) red8 si r4
    R1*3

    %47
    r8 mi'16 (re) re(do) do(si) si(la) la(sol) sol(fa?) fa(mi)
    re8[do16 re mi8 fad] la la, si re
    mi re mi mi la,4 r8 mi'

    %50
    si'4. do16(re) do8 si la16 si do re\mbreak
    mi do re si do la si fad sold8 mi r4
    R1

    %53
    r4 r8 fa\p si, si' r do,
    si4 r r2
    r4 r8 mi la, la' sib,4\mbreak

    %56
    la4 r r2
    R1
    r2 r4 r8 fa''\f

    %59
    sol16 (mi) red(mi) sol(mi) red(mi) do8(si) r4
    R1*3
    r2 re

    %64
    mi4. mi8 re sol, re'4~
    re do si8[sol si do]\mbreak
    re4 re, r la'
    sib si8 si do4 dod

    %68
    re2.(do4)~
    do8[do,] do'4 si4. si8
    la2 r

    %71
    R1*3
    fad?16 (mi) mi(re) re(do) do(re) si8 sol r4
    r r8 sol'\p la, la' r dod,\mbreak

    %76
    la la' r fad' la16(sol) sol(fad) fad(mi) mi(re)
    re(do) do(si) si(la) la(sol) sol(fad) fad(mi) mi(re) re(do)
    do8 la16 si do16(re ) do(re) mi8_\upl re_\upl r sol'

    %79
    mi do la fad' sol16\f (fa) fa(mi) mi(re) re(do)
    do(si) si(la) la(sol) sol(la) fad8 re r4\mbreak
    R1*4

    %85
    re'2 dod4. dod8\mbreak
    re fa mi4 re4. dod16[re]
    mi4 la, r2

    %88
    re dod4 do8 do
    si4 sib2 la4
    sol la2 sol4\mbreak

    %91
    la r r2
    r4 re8\p re mi8.[mi16 mi8.(dod16)]
    si8 fad red fad si,4 r8 mi

    %94
    la mi dod mi la,4 r
    R1\mbreak
    r4 r8 mi'' fa16 re dod re fa re dod re

    %97
    sib8(la) r mi'\p fa16 re dod re fa re dod re
    sib8 la sold la re, re'4\f do16 si
    do8 la' si, sold' <la do, mi, la,>4 r

    %100
    R1*9
    r4 r8 si,\f do16 la do mi dod la dod mi
    la8 re,4 do16(si) do16\p la do mi dod la dod mi\mbreak

    %111
    la16\f(sol) sol(fa) fa(mi) mi(re) re(do) do(si) si(la) la(si)
    sold8 mi mi'4 fa4. fa8
    mi la, mi'2 re4

    %114
    do8[la do re] mi4 mi,
    r si' do dod8 dod\mbreak
    re4 red mi2~
    mi8[fa] re?4. dod8 re4

    %118
    do?4. do8 si si mi mi,
    r mi'\p la la, sol'4. fa16 mi
    fa(sol) mi(sol) fa sol la fa sol8 mi la la,\mbreak

    %121
    re re, r4 r2
    R1*11
    la'16\f(sib) sib(do) do(re) re(mi) mi(fa) fa(sol) sol(la) la(sib)

    %134
    do,4~do16 sib' la sol la fa sol re mi8. fa16
    sib,4. la16 sol la8 fa' sol, mi'\mbreak
    fa4 r r2

}

IvlIIn = \relative do'' {

    mi2 fa4. fa8
    mi la, mi'2 re4
    do8 [la do re] mi4 mi,

    %4
    r si' do dod8 dod
    re4 red mi2~
    mi8[fa] re4. dod8 re4

    %7
    do?4. do8 si2
    R1
    r2 r4 la8 la

    %10
    fa'4. fa8 fa4 mi\mbreak
    re2(dod4) re~
    re do? si2

    %13
    la8 mi la4. sold16 fad sold8. sold16
    la8 sold16 fad  mi8 sold do16 la si sold la8 fad
    mi si' mi dod la la, r la'16 sol?

    %16
    fa8 mi mi' dod la4 r8 la16 sol
    fa8 mi re do si si' r sold
    mi mi' r mi re la si mi

    %19
    mi,4 r8 mi' re4 r8 la
    sold4 do~do8 si16 la sold8 la\mbreak
    re do fa si, do4 r

    %22
    r2 r4 r8 fa,\f
    mi si' mi dod la la, r la'
    fa(mi) mi' dod la la, r la'16\p sol

    %25
    fa8(mi) re(do? ) si si' r sold\mbreak
    la la, r4 r2
    R1*4

    %31
    r4 r8 red si si' r si
    la mi fad si si,4 r8 si'
    la4 r8 mi red4 sol~

    %34
    sol8 fad?16 mi red8. mi16 la8 sol do fad,
    sol mi r4 mi'2\mbreak

    %36
    red4. red8 mi  sol fad4
    mi4. red16[mi] fad4 si,
    r2 mi

    %39
    red4 re8 re dod4 do~
    do si la(si)~\mbreak
    si la si2

    %42
    r4 r8 si si, si' r mi,
    red si' r sol fad4 r
    R1*3

    %47
    r8 mi'16 (re) re(do) do(si) si(la) la(sol) sol(fa?) fa(mi)
    re8[do16 re mi8 fad] la la, si re
    mi re mi mi la, mi' la4~

    %50
    la8 sold16 fad sold8. sold16 la8 sold16 fad mi8 sold\mbreak
    do16 la si sold la8 fad si,4 r
    R1

    %53
    r4 r8 fa'\p si, si' r do,
    si4 r r2
    r4 r8 mi la, la' sib,4\mbreak

    %56
    la4 r r2
    R1
    r2 r4 r8 red'\f

    %59
    si si, r fad' sol \parenthesize (fad) r4
    R1*3
    r2 re'

    %64
    mi4. mi8 re sol, re'4~
    re do si8[sol si do]\mbreak
    re4 re, r la'
    sib si8 si do4 dod

    %68
    re2.(do4)~
    do8[do,] do'4 si4. si8
    la2 r

    %71
    R1*3
    fad?16 (mi) mi(re) re(do) do(re) si8 sol r4
    r r8 sol'\p la, la' r dod,\mbreak

    %76
    la la' r fad' la16(sol) sol(fad) fad(mi) mi(re)
    re(do) do(si) si(la) la(sol) sol(fad) fad(mi) mi(re) re(do)
    do8 la16 si do16(re ) do(re) mi8_\upl re_\upl r sol'

    %79
    mi do la fad' sol16\f (fa) fa(mi) mi(re) re(do)
    do(si) si(la) la(sol) sol(la) fad8 re r4\mbreak
    R1*4

    %85
    re'2 dod4. dod8\mbreak
    re fa mi4 re4. dod16[re]
    mi4 la, r2

    %88
    re dod4 do8 do
    si4 sib2 la4
    sol la2 sol4\mbreak

    %91
    la r r2
    r4 re8\p re mi8.[mi16 mi8.(dod16)]
    si8 fad red fad si,4 r8 mi

    %94
    la mi dod mi la,4 r
    R1\mbreak
    r4 r8 dod' la la, r la'16 sol

    %97
    fa8(mi) mi' dod la4 r8 la16\p sol
    fa8 mi re do? si si' r sold\f
    la do fa si, do4 r

    %100
    R1*9
    r4 r8 sold\f mi mi' r mi

    %110
    re la si mi mi,4 r8 mi'\mbreak
    re4 r8 fa si,4 r8 si
    si4 mi fa4. fa8

    %113
    mi la, mi'2 re4
    do8[la do re] mi4 mi,
    r si' do dod8 dod\mbreak

    %116
    re4 red mi2~
    mi8[fa] re?4. dod8 re4
    do?4. do8 si si mi mi,

    %119
    r4 r8 la\p si si dod4
    re8 la re re, do'?4. si16 la\mbreak
    si(do) la(do) si do re si do8 la re re,

    %122
    sol sol, r4 r2
    R1*10
    la'16\f(sib) sib(do) do(re) re(mi) mi(fa) fa(sol) sol(la) la(sib)

    %134
    do,4~do16 sib' la sol la fa sol re mi8. fa16
    sib,4. la16 sol la8 fa' sol, mi'\mbreak
    fa4 r r2

}

IobIn = \relative do'' {

    mi2 fa4. fa8
    mi la, mi'2 re4
    do8 [la do re] mi4 mi,

    %4
    r si' do dod8 dod
    re4 red mi2~
    mi8[fa] re4. dod8 re4

    %7
    do?4. do8 si2
    R1
    r2 r4 la8 la

    %10
    fa'4. fa8 fa4 mi\mbreak
    re2(dod4) re~
    re do? si2

    %13
    la4 r8 mi si'4. do16 re
    do8 si la16 si do re mi do re si do la si fad
    sold8 mi r mi' fa16 re dod re fa re dod re\mbreak

    %16
    sib8(la) r mi' fa16 re dod re fa re dod re
    si?8(la) sold la_\upl re, re'4  do?16 si
    do la do mi dod la dod mi la8 re,4 do?16 si

    %19
    do la do mi dod la dod mi la(sol) sol(fa) fa(mi) mi(re)
    re(do?) do(si)si la la si sold8 la16 si si8. si16\mbreak
    la8 la' do, sold' la4 r

    %22
    R1
    r4 r8 mi\f  fa16 re dod re fa re dod re
    sib8(la) r mi'\p fa16 re dod re fa re dod re

    %25
    sib8 la sold la re, re'4\p mi16 re\mbreak
    do8 re mi2 red8 mi16 fad
    sol8 mi r4 r2

    %28
    R1*3\mbreak
    r4 r8  fad, sol16 mi sol si sold mi sold si
    mi8 la,4 sol16(fad) sol mi sol si sold mi sold si

    %33
    mi(re) re(do) do(si) si(la) la(sol) sol(fad) fad(mi) mi(fad)
    red8 mi16 fad fad8. mi16 mi8 mi' fad, red'
    mi4 r mi2\mbreak

    %36
    red4. red8 mi  sol fad4
    mi4. red16[mi] fad4 si,
    r2 mi

    %39
    red4 re8 re dod4 do~
    do si la(si)~\mbreak
    si la si2

    %42
    R1*2
    r2 r8  si mi4~
    mi8 red16 dod red8 mi16 fad? sol4. sol8\mbreak

    %46
    fad4 r r2
    R1*2
    r2 r4 r8 mi,

    %50
    si'4. do16(re) do8 si la16 si do re\mbreak
    mi do re si do la si fad sold8 mi r4
    R1

    %53
    r2  mi'16(re) re(do) do(si) si(la)
    sold8 mi r4 r2
    r re'16(do) do(sib) sib(la) la(sol)\mbreak

    %56
    fad8 re r4 r2
    R1
    r2 r4 r8 fa'\f

    %59 OOKK
    sol16 (mi) red(mi) sol(mi) red(mi) do8(si) r4
    r8 si mi16(re) mi(re) re8(dod) r4\mbreak
    r8 la re16 (do) re(do) do8(si) r4

    %62
    R1
    r2 re
    mi4. mi8 re sol, re'4~

    %65
    re do si8[sol si do]\mbreak
    re4 re, r la'
    sib si8 si do4 dod

    %68
    re2.(do4)~
    do8[do,] do'4 si4. si8
    la2 r4 r8 re\mbreak

    %71
    mi16(fa) mi(fa) mi(re) do(si) do(re) do(re) do(si) la(sol)
    la8(si) do(re) fad,(sol) la(si)
    la[(si) do(si16 la)] la8.(sol16) sol8.(fad16)

    %74
    fad4 r r2
    R1*4
    r2 sol'16\f (fa) fa(mi) mi(re) re(do)

    %80
    do(si) si(la) la(sol) sol(la) fad8 re r4\mbreak
    R1
    r2 r4 r8 la'

    %83
    mi'4. fa16 sol fa8 mi re16 mi fa sol
    la(fa) sol(mi) fa(re) mi(do) dod8 la r4

    %85
    re2 dod4. dod8\mbreak
    re fa mi4 re4. dod16[re]
    mi4 la, r2

    %88
    re dod4 do8 do
    si4 sib2 la4
    sol la2 sol4\mbreak

    %91
    la r r2
    R1*4
    r4 r8 mi' fa16 re dod re fa re dod re

    %97
    sib8(la) r mi'\p fa16 re dod re fa re dod re
    sib8 la sold la re, re'4\f do16 si
    do8 la' si, sold' la,4 r

    %100
    R1
    fa'16(mib) mib(re) re(do) do(sib) sib(la) la(sol) sol(fa) fa(sol)
    mi8 do r4 r2

    %103
    R1*2
    r2 re'16(do) do(sib) sib(la) la(sol)\mbreak
    fad8 re r4 r2

    %107
    mi'16(re) re(do) do(si?) si(la) sold8 mi r4
    R1
    r4 r8 si'\f do16 la do mi dod la dod mi

    %110
    la8 re,4 do16(si) do16\p la do mi dod la dod mi\mbreak
    la16\f(sol) sol(fa) fa(mi) mi(re) re(do) do(si) si(la) la(si)
    sold8 mi mi'4 fa4. fa8

    %113
    mi la, mi'2 re4
    do8[la do re] mi4 mi,
    r si' do dod8 dod\mbreak

    %116
    re4 red mi2~
    mi8[fa] re?4. dod8 re4
    do?4. do8 si2

    %119
    R1*3
    r2 re16(do) do(si) si(la) la(sol)
    fad8 la re re, r2

    %124
    r sol'16(fa!) fa(mi) mi(re) re(do)
    do(si) si(la) la(sol) sol(fa) fa8 mi16 re mi8 do\mbreak
    r8 do' do4 r8 re re4

    %127
    r r8 sol do,4 r
    r r8 mi la,4 r
    r2 sol'16(fa) fa(mi) mi(re) re(do)

    %130
    si8 sol r4 r2\mbreak
    R1*2
    la16\f(sib) sib(do) do(re) re(mi) mi(fa) fa(sol) sol(la) la(sib)

    %134
    do,4~do16 sib' la sol la fa sol re mi8. fa16
    sib,4. la16 sol la8 fa' sol, mi'\mbreak
    fa4 r r2

}



IobIIn = \relative do'' {

    mi2 fa4. fa8
    mi la, mi'2 re4
    do8 [la do re] mi4 mi,

    %4
    r si' do dod8 dod
    re4 red mi2~
    mi8[fa] re4. dod8 re4

    %7
    do?4. do8 si2
    R1
    r2 r4 la8 la

    %10
    fa'4. fa8 fa4 mi\mbreak
    re2(dod4) re~
    re do? si2

    %13
    la8 mi la4. sold16 fad sold8. sold16
    la8 sold16 fad mi8 sold do16 la si sold la8 fad
    mi si' mi dod la la r la16 sol?\mbreak

    %16
    fa8 mi mi' dod la4 r8 la16 sol
    fa8 mi re do si' si r sold
    mi mi' r mi re la si mi

    %19
    mi,4 r8 mi' re4 r8 la
    sold4 do~do8 si16 la sold8 la\mbreak
    re do fa si, do4 r

    %22
    r2 r4 r8 fa,\f
    mi si' mi dod la la r la
    fa(mi) mi' dod la la r la16\p sol

    %25
    fa8(mi) re(do? ) si' si r sold\mbreak
    la la r4 r2
    R1*4

    %31
    r4 r8  fad sol16 mi sol si sold mi sold si
    mi8 la,4 sol16(fad) sol mi sol si sold mi sold si

    %33
    mi(re) re(do) do(si) si(la) la(sol) sol(fad) fad(mi) mi(fad)
    red8 mi16 fad fad8. mi16 mi8 mi' fad, red'
    mi4 r mi2\mbreak

    %36
    red4. red8 mi  sol fad4
    mi4. red16[mi] fad4 si,
    r2 mi

    %39
    red4 re8 re dod4 do~
    do si la(si)~\mbreak
    si la si2

    %42
    R1*2
    r2 r8  si mi4~
    mi8 red16 dod red8 mi16 fad? sol4. sol8\mbreak

    %46
    fad4 r r2
    R1*2
    r2 r8 mi, la4~

    %50
    la8 sold16 fad sold8. sold16 la8 sold16 fad mi8 sold\mbreak
    do16 la si sold la8 fad si4 r
    R1

    %53
    r2  mi16(re) re(do) do(si) si(la)
    sold8 mi r4 r2
    r re'16(do) do(sib) sib(la) la(sol)\mbreak

    %56
    fad8 re r4 r2
    R1
    r2 r4 r8 fa'\f

    %59
    sol16 (mi) red(mi) sol(mi) red(mi) do8(si) r4
    r8 si mi16(re) mi(re) re8(dod) r4\mbreak
    r8 la re16 (do) re(do) do8(si) r4

    %62
    R1
    r2 re
    mi4. mi8 re sol, re'4~

    %65
    re do si8[sol si do]\mbreak
    re4 re, r la'
    sib si8 si do4 dod

    %68
    re2.(do4)~
    do8[do,] do'4 si4. si8
    la2 r4 r8 re\mbreak

    %71
    mi16(fa) mi(fa) mi(re) do(si) do(re) do(re) do(si) la(sol)
    la8(si) do(re) fad,(sol) la(si)
    la[(si) do(si16 la)] la8.(sol16) sol8.(fad16)

    %74
    fad4 r r2
    R1*4
    r2 sol'16\f (fa) fa(mi) mi(re) re(do)

    %80
    do(si) si(la) la(sol) sol(la) fad8 re r4\mbreak
    R1
    r2 r8 la' re4~

    %83
    re8 dod16 si dod8. dod16 re8 dod16 si la8 dod
    fa16(re) mi(dod) re8 si! la4 r

    %85
    re2 dod4. dod8\mbreak
    re fa mi4 re4. dod16[re]
    mi4 la, r2

    %88
    re dod4 do8 do
    si4 sib2 la4
    sol la2 sol4\mbreak

    %91
    la r r2
    R1*4
    r4 r8 dod la la r la16 sol

    %97
    fa8(mi) mi' dod la4 r8 la16\p sol
    fa8 mi re do? si' si r sold\f
    la do fa si, do4 r

    %100
    R1
    fa16(mib) mib(re) re(do) do(sib) sib(la) la(sol) sol(fa) fa(sol)
    mi8 do r4 r2

    %103
    R1*2
    r2 re'16(do) do(sib) sib(la) la(sol)\mbreak
    fad8 re r4 r2

    %107
    mi'16(re) re(do) do(si?) si(la) sold8 mi r4
    R1
    r4 r8 sold mi\f mi' r mi

    %110
    re la si mi mi,4 r8 mi'\mbreak
    re4 r8 fa si,4 r8 si
    si4 mi fa4. fa8

    %113
    mi la, mi'2 re4
    do8[la do re] mi4 mi,
    r si' do dod8 dod\mbreak

    %116
    re4 red mi2~
    mi8[fa] re?4. dod8 re4
    do?4. do8 si2

    %119
    R1*3
    r2 re16(do) do(si) si(la) la(sol)
    fad8 la re re, r2

    %124
    r sol'16(fa!) fa(mi) mi(re) re(do)
    do(si) si(la) la(sol) sol(fa) fa8 mi16 re mi8 do\mbreak
    r8 do' do4 r8 re re4

    %127
    r r8 sol do,4 r
    r r8 mi la,4 r
    r2 sol'16(fa) fa(mi) mi(re) re(do)

    %130
    si8 sol r4 r2\mbreak
    R1*2
    la16\f(sib) sib(do) do(re) re(mi) mi(fa) fa(sol) sol(la) la(sib)

    %134
    do,4~do16 sib' la sol la fa sol re mi8. fa16
    sib,4. la16 sol la8 fa' sol, mi'\mbreak
    fa4 r r2

}

IvlaIn = \relative do' {

    r2 la'
    do4. do8 si sold si4
    la2~la8[mi] la4~

    %4
    la8 [sold16 la] si4. la8 mi4
    fa fad8 fad sol4 sold\mbreak
    la8 [fa] la4. sol?16[fa] mi4~

    %7
    mi mi mi mi8 mi
    do'4. do8 do4 la
    si do8 si4 la8 la4

    %10
    r sol8 sol do4. do8\mbreak
    do4 si la sib
    sold la2 sold4

    %13
    la8 do,16 re mi8 do fa re mi8. mi16
    mi4 r8 re do4 r8 fad
    si,4\upl dod\upl re8 mi re mi\mbreak

    %16
    re mi la,4 r8 mi' re mi
    re mi r mi fa mi si si'
    la4\upl la\upl re,\upl r

    %19
    la'\upl la\upl la\upl r8 fa
    mi4\upl mi\upl mi\upl r8 mi
    la4 r8 mi mi4 r

    %22
    R1
    r2 r8 mi re mi
    re mi la,4 r8 mi'\p re mi

    %25
    re mi r mi fa(mi) r4\mbreak
    R1*5
    r2 mi4\upl si'\upl

    %32
    mi, r mi\upl mi\upl
    mi la16(sol) sol(fad) fad4 r
    si, r8 si mi4 r8 si

    %35
    si4 si' do4. do8\mbreak
    si8[fad] si[la] sol8.[la16] si4~
    si la r fad

    %38
    sol sold8 sold la4 lad
    si fad sol4. fad8
    sold[la si si,] red[fad] sol?4~\mbreak

    %41
    sol4 mi fad r
    R1*7
    r2 mi8 do16 re mi8 do

    %50
    fa[re mi8. mi16] mi4. re8\mbreak
    do4 r8 fad mi4 r
    R1*12

    %64
    sol2 si4. si8
    la fad la4 sol2~\mbreak
    sol8[re] sol4. fad16[sol] la4~

    %67
    la8 sol re4 mib mi8 mi
    fa4 fad sol8[mib] sol4~
    sol8[fa16 mi!] re2 re4

    %70
    re4 r r2\mbreak
    R1*3
    re4 r8 la re4 r

    %75
    R1*4
    r2 si'8 la sol si
    mi,4. do8 la4 r\mbreak

    %81
    R1
    r2 fa'8 sol la fa
    sib sol la la la4. sol8

    %84
    fa4 r8 si? mi,4 la
    sib4. sib8 la mi la[sol]\mbreak
    fad8.[sol16] la2 sol4

    %87
    r mi fa fad8 fad
    sol4 sold la mi
    fa?4. mi8 fad[sol la la,]

    %90
    dod[mi] fa2 re4\mbreak
    mi4 r r2
    R1*4\mbreak

    %96
    r2 r8 mi re mi
    re mi la,4 r8 mi' re mi
    re mi r mi fa(mi) si si'

    %99
    la mi r mi mi4 r
    R1
    do4\pp r8 la do4 re

    %102
    sol,4 r r2
    R1*2
    r2 la'8\p la sol fad16 sol

    %106
    la8 la, r4 r2
    si'!8\p si la sold16 la si8 si, r4
    R1

    %109
    r2 la'4\upl\f la\upl
    re,\upl r la'\upl la\upl\mbreak
    la4 r8 la sold4 r8 do,

    %112
    mi4 r la2
    do4. do8 si sold si4
    la2~la8[mi] la4~
    la8 [sold16 la] si4. la8 mi4

    %116
    fa fad8 fad sol4 sold\mbreak
    la8 [fa] la4. sol?16[fa] mi4~
    mi mi mi r4

    %119
    R1*14
    do4 r8 sol' sol4 r8 do,
    la' sol16 fa sol8 mi do re do sol'

    %135
    fa re sol mi do4 re8 sol\mbreak
    la4 r r2

}

IvlaIIn = \relative do' {

    R1
    r2 mi2
    fa4. fa8 mi do mi4(

    %4
    re4.) mi8 mi2
    R1
    la,2 sib4 si~

    %7
    si la4. la8 sold4
    r la8 la fa'4. fa8
    fa4 mi mi8[do] mi4

    %10
    re2 do8[re mi fa]\mbreak
    sol8[sol,] sol'2 fa4
    mi8[(si)] do[(re)] mi2

    %13
    mi r
    mi4 r8 re do4 r8 fad
    si,4\upl dod\upl re8 mi re mi\mbreak

    %16
    re mi la,4 r8 mi' re mi
    re mi r mi fa mi si si'
    la4\upl la\upl re,\upl r

    %19
    la'\upl la\upl la\upl r8 fa
    mi4\upl mi\upl mi\upl r8 mi
    la4 r8 mi mi4 r

    %22
    R1
    r2 r8 mi re mi
    re mi la,4 r8 mi'\p re mi

    %25
    re mi r mi fa(mi) r4\mbreak
    R1*5
    r2 mi4\upl si'\upl

    %32
    mi, r mi\upl mi\upl
    mi la16(sol) sol(fad) fad4 r
    si, r8 si mi4 r8 si

    %35
    si4 r r2
    R1
    mi2 red4. red8

    %38
    mi4 re? do2
    si r4 do
    re red8 red red4 mi\mbreak

    %41
    mi4. mi8 mi4(red)
    R1*7
    r2 mi8 do16 re mi8 do

    %50
    fa[re mi8. mi16] mi4. re8\mbreak
    do4 r8 fad mi4 r
    R1*13

    %65
    re2 mi4. mi8\mbreak
    re si re4 si4. re8
    re2 r
    r sol,

    %69
    lab4 la2 sol4~
    sol8 sol fad4 r2\mbreak
    R1*3

    %74
    re'4 r8 la re4 r
    R1*4
    r2 si'8 la sol si

    %80
    mi,4. do8 la4 r\mbreak
    R1
    r2 fa'8 sol la fa

    %83
    sib sol la la la4. sol8
    fa4 r8 si? mi,4 r
    R1

    %86
    r2 re2
    dod4. dod8 re4 dod
    sib2 la

    %89
    r4 sib do dod8 dod
    dod?4 re re4. re8\mbreak
    dod4 r r2

    %92
    R1*4\mbreak
    r2 r8 mi re mi
    re mi la,4 r8 mi' re mi
    re mi r mi fa(mi) si si'

    %99
    la mi r mi mi4 r
    R1
    do4\pp r8 la do4 re

    %102
    sol,4 r r2
    R1*2
    r2 la'8\p la sol fad16 sol

    %106
    la8 la, r4 r2
    si'!8\p si la sold16 la si8 si, r4
    R1

    %109
    r2 la'4\upl\f la\upl
    re,\upl r la'\upl la\upl\mbreak
    la4 r8 la sold4 r8 do,

    %112
    mi4 r r2
    r2 mi2
    fa4. fa8 mi do mi4

    %115
    re4. mi8 mi2
    R1
    la,2 sib4 si~

    %118
    si la4. la8 sold4
    R1*14
    do4 r8 sol' sol4 r8 do,
    la' sol16 fa sol8 mi do re do sol'

    %135
    fa re sol mi do4 re8 sol\mbreak
    la4 r r2

}

Isopranon = \relative do'' {

    \autoBeamOff

    mi2 fa4. fa8
    mi la, mi'2 re4
    do8 [la do re] mi4 mi,

    %4
    r si' do dod8 dod
    re4 red mi2~
    mi8[fa] re4. dod8 re4

    %7
    do?4. do8 si2
    R1
    r2 r4 la8 la

    %10
    fa'4. fa8 fa4 mi\mbreak
    re2(dod4) re~
    re do? si2

    %13
    la r
    R1*21
    r2 mi'\tu \mbreak

    %36
    red4. red8 mi  sol fad4
    mi4. red16[mi] fad4 si,
    r2 mi

    %39
    red4 re8 re dod4 do~
    do si la(si)~\mbreak
    si la si2

    %42
    R1*21
    r2 re\tu %% p. 11
    mi4. mi8 re sol, re'4~

    %65
    re do si8[sol si do]\mbreak
    re4 re, r la'
    sib si8 si do4 dod

    %68
    re2.(do4)~
    do8[do,] do'4 si4. si8
    la2 r\mbreak

    %71
    R1*14
    re2 dod4. dod8\mbreak
    re fa mi4 re4. dod16[re]

    %87
    mi4 la, r2
    re dod4 do8 do
    si4 sib2 la4

    %90
    sol la2 sol4\mbreak
    la r r2
    R1*20

    %112
    mi'2\tu fa4. fa8
    mi la, mi'2 re4
    do8[la do re] mi4 mi,

    %115
    r si' do dod8 dod\mbreak
    re4 red mi2~
    mi8[fa] re?4. dod8 re4

    %118
    do?4. do8 si2
    R1*18

}

ItestoI = \lyricmode {

    Be -- a -- tus vir be -- a - - - tus qui ti -- met qui ti -- met Do - - - - mi -- num,

    in man -- da -- tis e -- jus vo - let ni -- mis.

    Be -- a -- tus vir be -- a - - - tus qui ti -- met qui ti - met Do -- mi -- num.

    Be -- a -- tus vir be -- a - - - tus qui ti -- met qui ti -- met Do - - mi -- num.

    Be -- a -- tus vir be -- a - - - tus qui ti -- met qui ti - met Do - mi -- num.

    Be -- a -- tus vir be -- a - - - tus qui ti -- met qui ti -- met Do - - - - mi -- num.

}

Ialton = \relative do' {

    \autoBeamOff

    r2 la'
    do4. do8 si sold si4
    la2~la8[mi] la4~

    %4
    la8 [sold16 la] si4. la8 mi4
    fa fad8 fad sol4 sold\mbreak
    la8 [fa] la4. sol?16[fa] mi4~

    %7
    mi mi mi mi8 mi
    do'4. do8 do4 la
    si do8 si4 la8 la4

    %10
    r sol8 sol do4. do8\mbreak
    do4 si la sib
    sold la2 sold4

    %13
    la2 r
    R1*7
    r2  r8 mi la4~

    %22
    la8 si16[do] si8 mi, do' si la si
    sold[fad] mi4 r2
    R1

    %25
    r2 si'4. do16[si]\mbreak
    do8. si16 la8 sol sol4 fad
    r8 la sold la mi16[re mi8]~mi16[re' do si]

    %28
    do[si la8] sold[la] mi16[re mi8]~mi16[re' do si]
    do4. si4 la8~la16[sol fad mi]
    red8[si']~si16[la sol fad] sol8[red mi la]\mbreak

    %31
    sol4 la8 [fad] mi2
    R1*3
    si'2\tu do4. do8\mbreak

    %36
    si8[fad] si[la] sol8.[la16] si4~
    si la r fad
    sol sold8 sold la4 lad

    %39
    si fad sol4. fad8
    sold[la si si,] red[fad] sol?4~\mbreak
    sol4 mi fad si4\solo~

    %42
    si8 la16 sol la8 fad sol8. fad16 mi4
    r2 r4 si'~
    si8 la16 do si8 la8 sol8. fad16 mi8 sol

    %45
    fad4. si,8 mi2\mbreak
    red4 si'8 si do do16 si la8 si
    sold8 mid la2.~

    %48
    la4 sold8 si do8. si16 la8[fad]
    sold4. la8 la2
    R1\mbreak

    %51
    r2 r8 mi la4~
    la8 si16 [do] si8 mi, do'4. si16 do
    la8[sold] la[si] sold[fa] mi4

    %54
    r8 mi sol la sib2~
    sib8 sib? la sol sol fad r4\mbreak
    r8 fad8 la si  do2~

    %57
    do8 do si la sol[la] si4~
    si8 do la4 si2
    r r8 fad si la

    %60
    la sold r4 r8 mi la sol?\mbreak
    sol fad r4 r8 re sol fa
    mi[fa16 sol la8 sol] fad4 sol8 do

    %63
    si4. sol16[si] la2
    sol\tu si4. si8
    la fad la4 sol2~\mbreak

    %66
    sol8[re] sol4. fad16[sol] la4~
    la8 sol re4 mib mi8 mi
    fa4 fad sol8[mib] sol4~

    %69
    sol8[fa16 mi!] re2 re4
    re r8 la'\solo si16[do si do] si[la sol fa!]\mbreak
    mi8 do r mi la16[si la si] la [sol fad mi]

    %72
    fad8[(sol)] la si la8[(si)] do[(re)]
    fad,8 sol la re, sib'4. sib8
    la4 r re,8 re sol fa?

    %75
    mi[re] do4 r8 mi la sol\mbreak
    fad16[sol fad sol] la[sol la sol] fad[mi mi re] re4~
    re1~

    %78
    re16[mi fad sol] la[si la si] do8[si16 la] si8 [sol]
    la4. la8 sol2
    r r4 la8 la\mbreak

    %81
    sib8. sib16 la8 re sib la sol4~
    sol16[fa mi fa] sol[sib] la [sol] fa8[(mi)] re4
    R1

    %84
    r2 la'
    sib4. sib8 la mi la[sol]\mbreak
    fad8.[sol16] la2 sol4

    %87
    r mi fa fad8 fad
    sol4 sold la mi
    fa?4. mi8 fad[sol la la,]

    %90
    dod[mi] fa2 re4\mbreak
    mi4 la8 la sib8. sib16 sib8 la
    sold4 sold r sold8. la16

    %93
    fad8[do' si(la)] sold[fa mi(re)]
    dod[sib' la(sol)] fad[mi16 re] mi8[fad]
    sol8[re] sol4. fa?16[mi] fa8[sib]\mbreak

    %96
    fa2 re
    R1*2
    r4 r8 si' do la16[(si)] do8 do

    %100
    do sib r la sib [sol16 la] sib8 sib\mbreak
    sib8. la16 sol4
    r do fa, sol fa do'16[la] sol[fa]

    %103
    sol[mi] fa8 r sib sib sib sib4~
    sib16 [sol la sib?] do,[sib' la sol] la[fad sol la] re,[do' sib la]
    sib?[(la) la(sol)] sol[fa sol la] fad8. mi16 re4\mbreak

    %106
    r8 la' sib la sib la16 la sib8 la
    sold[fa] mi4 r8 si'! do si
    do si16 si do8 si la2~

    %109
    la8 fad sold4 la2
    R1*2
    r2 la\tu

    %113
    do4. do8 si sold si4
    la2~la8[mi] la4~
    la8 [sold16 la] si4. la8 mi4

    %116
    fa fad8 fad sol4 sold\mbreak
    la8 [fa] la4. sol?16[fa] mi4~
    mi mi mi r8 sold\solo

    %119
    la la, r4 r2
    r4 r8 re mi mi fad4\mbreak
    sol8 re sol sol, fa'4. mi16[re]

    %122
    mi4 la8 sol fad8. mi16 re4
    r4 r8 la' si si16 la si8 fad
    sol1~

    %125
    sol2~sol4. do16[sib]\mbreak
    la[sol fa sol] la[la do la] si [la sol la] do[si re si]
    do8 do, sib'4. la16 sol la4~

    %128
    la8[sol16 fad] sol4. fa8 mi[do]
    re4. re8 do4 r
    r sol'8 do, do' sib16[la] sol8 do\mbreak

    %131
    do,16[(re) re(mi)] mi[(fa) fa(sol)] sol[(la) la(si?)] si4~
    si8 sol la fa sol4. sol8
    fa4 r r2

    %134
    R1*3

}

ItestoII = \lyricmode {

    Be -- a -- tus vir be -- a - - - tus qui ti -- met qui ti -- met Do - - - mi -- num,

    in man -- da -- tis e -- jus vo - let ni -- mis, in man -- da -- tis e -- jus vo -- let ni - - mis.

    Po -- tens in ter -- ra e -- rit se -- men e -- jus, ge -- ne -- ra -- tio _ re -- cto -- rum be -- ne -- di -- ce - - - - - - - - - - tur.

    Be -- a -- tus vir be -- a - tus qui ti -- met qui ti -- met ti -- met Do - - - - mi -- num.

    Glo -- ria _ et di -- vi -- tiae, _ Glo -- ria _ et di -- vi -- tiae _ in do -- mo e -- jus,

    et jus -- ti -- tia _ e -- jus ma -- net ma -- net in sae -- culum _ sae -- culi. _

    Ex -- or -- tum est in te -- nebris _ lu -- men rec -- tis, mi -- se -- ri -- cors et mi -- se -- ra -- tor,

    mi -- se -- ri -- cors et mi -- se -- ra -- tor et jus -- tus.

    Ju -- cundus _ ho -- mo, ju -- cundus _ ho -- mo, qui mi -- se -- re - tur et com -- mo -- dat.

    Be -- a -- tus vir be -- a - - - - tus qui ti -- met qui ti -- met Do - - mi -- num.

    Dis -- po  - - net, dis -- po  - - net ser -- mo -- nes su -- os in ju -- di -- ci -- o,

    qui -- a in ae -- ternum _ non com -- mo -- ve - - - - - - - bi -- tur.

    In me -- mo -- ria _ ae -- ter -- na e - rit jus -- tus.

    Be -- a -- tus vir be -- a - - tus qui ti -- met qui ti - - met Do - - - - mi -- num.

    Ab au -- di -- tio - ne ma -- la non ti -- me - - - - - - - - - bit.

    Pa -- ra -- tum - cor e -- jus spe -- ra -- re in Do -- mi -- no.

    Con -- fir -- ma -- tum est cor e -- jus; non com -- mo -- ve - - - - - - bi -- tur

    do -- nec des -- pi -- ciat _ i -- ni -- mi -- cos, do -- nec des -- pi -- ciat _ i -- ni -- mi -- cos su -- os.

    Be -- a -- tus vir be -- a - - - tus qui ti -- met qui ti -- met Do - - - mi -- num.

    Dis -- per -- sit, dis -- per -- sit, de -- dit pau -- pe -- ri -- bus, de - dit pau -- pe -- ri -- bus,

    jus -- ti -- tia _  ej -- us ma - - - - - - net, ma -- net  in sae - culum _ sae -- culi. _

    Cor -- nu e -- jus ex -- al -- ta - - -  bi -- tur in glo -- ri -- a.

}

Itenoren = \relative do' {

    \autoBeamOff

    R1
    r2 mi2
    fa4. fa8 mi do mi4(

    %4
    re4.) mi8 mi2
    R1
    la,2 sib4 si~

    %7
    si la4. la8 sold4
    r la8 la fa'4. fa8
    fa4 mi mi8[do] mi4

    %10
    re2 do8[re mi fa]\mbreak
    sol8[sol,] sol'2 fa4
    mi8[(si)] do[(re)] mi2

    %13
    mi r
    R1*23
    mi2 red4. red8

    %38
    mi4 re? do2
    si r4 do
    re red8 red red4 mi\mbreak

    %41
    mi4. mi8 mi4(red)
    R1*23
    re2\tu mi4. mi8\mbreak

    %66
    re si re4 si4. re8
    re2 r
    r sol,

    %69
    lab4 la2 sol4~
    sol8 sol fad4 r2\mbreak
    R1*15\mbreak

    %86
    r2 re'2
    dod4. dod8 re4 dod
    sib2 la

    %89
    r4 sib do dod8 dod
    dod?4 re re4. re8\mbreak
    dod4 r r2

    %92
    R1*21
    r2 mi2\tu
    fa4. fa8 mi do mi4\parenthesize (

    %115
    re4.) mi8 mi2
    R1
    la,2 sib4 si~

    %118
    si la4. la8 sold4
    R1*18

}

ItestoIII = \lyricmode {

    Be -- a -- tus vir be -- a -- tus vir qui ti -- met Do -- mi -- num,

    in man -- da -- tis e -- jus vo - let vo - - let vo -- let ni -- mis.

    Be -- a -- tus vir be -- a -- tus qui ti -- met qui ti -- met Do -- mi -- num.

    Be -- a -- tus vir be -- a - tus vir qui ti -- met Do -- mi -- num.

    Be -- a -- tus vir be -- a -- tus qui ti -- met qui ti -- met Do -- mi -- num.

    Be -- a -- tus vir be -- a -- tus vir qui ti -- met Do -- mi -- num.

}

Ibasson = \relative do {

    \autoBeamOff

    R1*2
    la'2 do4. do8
    si4 sold la la,

    %5
    r2 mi'\mbreak
    fa4 fad8 fad sol4 sold
    la4. la8 mi2

    %8
    R1
    r4 mi8 mi do'4. do8
    do4 si la8[si] do4\mbreak

    %11
    sol2 la4 re,
    mi1
    la,2 r

    %14
    R1*22
    r2 si'
    do4. do8 si2

    %38
    R1
    r4 si lad la8 la
    sold4 sol fad mi\mbreak

    %41
    do'4. do8 si2
    R1*23
    r2 sol\tu\mbreak

    %66
    si4. si8 la4 fad
    sol sol, r2
    re' mib4 mi8 mi

    %69
    fa4 fad sol4. sol8
    re2 r\mbreak
    R1*15\mbreak

    %86
    la'2 sib4. sib8
    la2 r
    r r4 la

    %89
    sold sol8 sol fad4 fa
    mi(re) sib'4. sib8\mbreak
    la4 r r2

    %92
    R1*22
    la2\tu do4. do8
    si4 sold la  la,\mbreak

    %116
    r2 mi'
    fa4 fad8 fad sol4 sold
    la4. la8 mi2

    %119
    R1*18

}

ItestoIV = \lyricmode {

    Be -- a -- tus vir be -- a -- tus qui ti -- met qui ti -- met Do -- mi -- num,

    in man -- da -- tis e -- jus vo - let vo -- let ni -- mis.

    Be -- a -- tus vir qui ti -- met qui ti - - met Do -- mi -- num.

    Be -- a -- tus vir be -- a -- tus qui ti -- met qui ti -- met Do -- mi -- num.

    Be -- a -- tus vir qui ti -- met qui ti - met Do -- mi -- num.

    Be -- a -- tus vir be -- a -- tus qui ti -- met qui ti -- met Do -- mi -- num.

}

Ibcn = \relative do {

    \clef violin <<
        {
            mi''2 fa4. fa8
            mi la, mi'4
        }\\{
            r2 la,
            do4. do8
        }
    >> \clef bass mi,2
    la, do4. do8

    %4
    si4 sold la \clef violin <<
        {
            dod'
            re red
        }\\{
            mi,
            fa fad
        }
    >> \clef bass mi,2
    fa4 fad8 fad sol4 sold

    %7
    la4. la8 mi2
    \clef alto <<
        {
            do''4. do8 do4 la
            si
        }\\{
            r la,8 la fa'4. fa8
            fa4
        }
    >> \clef bass mi,8 mi do'4. do8

    %10
    do4 si la8[si] do4\mbreak
    sol2 la4 re,
    mi1

    %13
    la8\solo si do la re si mi mi,
    la mi16 re do8 si la4 r8 red
    mi re dod la re la' re, la'\mbreak

    %16
    re dod16 si dod8 la re, la' re, la'
    re do? si la~la sold16 fad? sold8 mi
    la4 sol fa8 fad sol sold

    %19
    la4 sol? fa r8 re
    mi mi, mi' mi, mi' mi, mi' mi,\mbreak
    fa fa' re mi la si do la

    %22
    re4 r8 mi la, mi16 re do8 re
    mi re dod la re la' re, la'
    re dod16 si dod8 la re, la' re, la'

    %25
    re do? si la~la sold16 fad? sold8 mi\mbreak
    la4 r8 lad si lad si red
    mi do si la~la sold16 fad sold8 mi

    %28
    la do si la~la sold16 fad sold8 mi
    la la, red4 mi8 fad sol? la
    si do red do mi si do la\mbreak

    %31
    si4 r8 si,^\markup\italic  "R[ipieni]"mi4 re
    do8 dod re red mi4 re?
    do r8 la' si si, si' si,

    %34
    si' si, si' si, do do' la si
    mi,4 \clef violin <<
        {
            r4_\tu mi''2
            red4. red8
        }\\{
            si4 do4. do8
            si fad si la
        }
    >> \clef bass si,2

    %37
    do4. do8 si4 \clef alto <<
        {
            fad'
            sol sold
        }\\{
            red
            mi re?
        }
    >> do2
    \clef bass si lad4 la8 la

    %40
    sold4 sol fad mi\mbreak
    do'4. do8 si4 si,8\solo do
    red4 r8 red mi4 la

    %43
    si8 si, si' si, si' la sol mi
    red4 r8 red mi fad sol mi
    la  fad? si la sol mi16 fa? sol8 la\mbreak

    %46
    si la sold mi la sold fa re
    mi4 r r2
    R1

    %49  fin qui OOOKKK
    r2 la,8^\markup \italic "R[ipieni]"[la'16 si do8 la]
    re si mi mi, la mi16 re do8 si\mbreak
    la4\solo r8 red mi re? do la

    %52
    re si mi sold la la, la' sol
    fa mi fa re mi4 r8 la,
    mi'4 r sol16 fa fa mi mi re re dod

    %55
    dod?4 r8 dod re4 r8 sol,\mbreak
    re'4 r la'16 sol sol fad fad mi mi red
    red?4 r8 red mi4 re?

    %58
    do2 si8 do red si
    mi si' mi, si' mi red16 do red8 si
    mi mi, sold mi la la, dod la\mbreak

    %61
    re, re' fad re sol sol, si sol
    do si la do re re'16 do si8 la
    sol sol, dod dod re4 \clef violin re''\tu _\markup\italic "R[ipieni]"

    %64
    <<{mi4. mi8 re sol, re'4}\\{sol,2 si4. si8}>>
    \clef bass re,2  sol,\mbreak
    si4. si8 la4 fad

    %67
    sol sol, \clef soprano <<{do'' dod}\\{mib, mi}>>
    \clef bass re,2 mib4 mi8 mi
    fa4 fad sol4. sol8

    %70
    re mi fad re sol\solo fad sol sol,\mbreak
    do4 r8 do la4 r8 la'
    re,4 r re r

    %73
    re r8 fad sol  sol, sib do
    re4 r8 fad sol la si? sol
    do16 do, do(re) mi re re dod dod8 la16 si dod8 la\mbreak

    %76
    re re, re' re, re'4 r
    r8 fad sol sol, re'4 r8 re
    fad4 r r8 fad sol si,

    %79
    do la re re, sol'4 r8 sol,
    la si do la re mi fad re\mbreak
    sol sol, re' fad sol fa? mi re

    %82
    dod4 r8 dod re mi fa re
    sol mi la la, re' la16 sol fa8 mi
    re4 r8 sold la4 \clef violin la'\upl

    %85
    <<{re2 dod4. dod8}\\{sib4. sib8 la mi la sol}>>\mbreak
    \clef bass la,2 sib4. sib8
    la4 \clef tenor dod re dod

    %88
    sib2 \clef bass la
    sold4 sol8 sol fad4 fa
    mi re sib'4. sib8\mbreak

    %91
    la la, dod\solo la re4 dod
    sib2 la8 si dod la
    red4 r8 red re4 r8 sold

    %94
    sol!4 r8 dod, do4 r8 do
    sib[sib'16 la sol fa mi re ] dod8 la re sol\mbreak
    la sol la la, re^\markup\italic "R[ipieni]" la' re, la'

    %97
    re dod16 si dod8 la re, la' re, la'
    re do? si la~la sold16 fa sold8 mi
    la do, re mi la4 r8 fad^\markup\italic "Se[nza] R[ipieni]"

    %100
    sol, sol'16 fad sol8 re sol4 r8 mi\mbreak
    fa, fa' fa, fa' fa, fa' sib, si
    do16 sib sib la la4 sib8 la16 sol la4

    %103
    sib8 la sol sol'~sol16 fa fa mi mi re re do
    do4 r8 mi fad4 r8 re
    sol fa mib do re re' re, re'\mbreak

    %106
    re, fad sol fad sol re sol fad
    mi mi' mi, mi' mi, sold la sold
    la mi la sol? fad fa mi red

    %109
    re! red mi mi, ^\markup\italic "R[ipieni]" la4 sol'
    fa8 fad sol sold la4\p sol\mbreak
    fa\f r8 re mi mi' mi, mi'

    %112
    mi,4 \clef violin  <<
        {
            mi'' fa4. fa8
            mi la, mi'4
        }\\{
            s4 la,2
            do4. do8
        }
    >> \clef tenor mi,2
    \clef bass la,2 do4. do8

    %115
    si4 sold la la,\mbreak
    \clef violin <<{re'' red}\\{fa, fad}>> \clef bass mi,2
    fa4 fad8 fad sol4 sold

    %118
    la4. la8 mi2
    R1*2\mbreak
    r4 r8 sol^\markup {\italic "solo" \dynamic p} la8 la si4

    %122
    do r8 do re, re' re, re'
    re, mi fad mi16 fad sol8 sol, r re'
    mi mi16 re mi8 si do do, do' do,

    %125
    sol'4 r8 sol si4 do\mbreak
    fa8 fa, r fad' sol sol, r sol'
    mi fa?16 mi re8 mi fa4. mi16 re

    %128
    mi4. re16 do re8 si do mi
    fa re sol sol, do4 r8 fa
    sol sol, sol' fa mi fa do' sib\mbreak

    %131
    la si do re mi fa sol16(fa) fa(mi)
    mi8 re16 mi fa8 la, sib sol do do,
    fa, sol la sib do re mi fa~

    %134
    fa mi16 re mi8 do fa sib do do,
    re [sol16 fa mi8 do] fa la, sib do\mbreak
    fa,4 r r2

}

Ibfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s1
    s2 <8 _+>4 <7 _+>
    <6 3>4 s <6> s
    <7>8 <6\\> <6>4 <9>8 <8> s4
    s2 <5 3>4 <5 _+>
    <7> <6> <5 _-> 8 s <6 5 _!>4
    <9> <8> <4+>2
    s1
    s4
    <6 5 _+>8 s <6>2
    <4 2>4 <6>8 s <6> <6> <5>4\mbreak
    <4> <3> <_+> <6->8 <5>
    <7 _+>4 <6 4 2>8 s <5 4>4 <5 _+>
    s2 <6 4+>4 <_+>
    s8 <_+> <6>4 s2
    <_+>4 <6> s8 <_+> s <_+>\mbreak
    \bassFigureExtendersOff <6->8 <6> <6>8 <5 _+> s <_+> s <_+>
    <6->8 <6> <6\\> s <4 2>4 s8 <6 _+>
    <5 3>4 <6 4+> <6> <5>8 <6>
    s4 <4+> <6> s
    \bassFigureExtendersOn <7 _+>8 s <6 5> <6 4>16 s <6 _+>8 s <5 _+> s\mbreak
    <6> <5> <6> <_+> s2
    <6 5>4 s8 <_+> s <_+> <6>16 s <6>8
    \bassFigureExtendersOff <_+>4 <6> s8 <_+> s <_+>
    <6> <6> <6> <_+> s <_+> s <_+>
    <6> <6> <6\\> s <4 2>4 s8 <6 _+>\mbreak
    \bassFigureExtendersOn s4 s8 <7 _+> <6 4>8 <6 4> <2 _+>8 s
    <5>8 <6> <6\\> s <4 2>4 <6>8 <_+>
    s <6> <6\\> s <4 2>4 <6>
    s <7>8 <6> <5>8 <5> s4
    <_+>4 <6> s8 <_+> <5>16 s <5>8\mbreak
    <6>4 s8 <5+> <_->8 < _-> <6 4+ 2>8 s
    <6>8 s <5 _+> <5 _+> <_->4 <4+>
    <6>4 s8 <5> <7 _+>8 s <6 5+> s
    <6 _+>4 <5 _+> <6>8 <5> <6\\> <_+>
    s1\mbreak %% metà p 8 bar 35
    s2 <6 4>4 <5+ _+>
    <7> <6> <_+>2
    s <6 3>4 <6\\>
    <5 _+>4 s <7 _+>8 s <7 _-> <6 _->
    <5 4>4 <5+ 3> <6\\> <_->\mbreak
    <7>4 <6> <4> <_+>
    <6>2 s4 <5>
    <7 _+> s8 <6 4> <5+ _+>4 <6>8 s
    <6>2 s4 <6>
    <6\\ 5> <_+> <6> <6>\mbreak
    <_+>8 <_+> <6>4 <5 6>8 s <5> <6>
    s1*3
    <6 5>8 s <5 _+>4 s8 <_+> <6\\>16 s <6\\>8\mbreak
    s4 s8 <6> <_+> <6> s4
    <5>8 <6\\> <_+>4 <5> <5>
    <6>8 s <6>4 <_+> s
    <_+> s <_->8 <_-> <5-> <5->
    <7>4 s8 <6> <4> <_+> s8 <_->\mbreak
    <_+>2 <5>4 <5>
    <7> s8 <6> <5>4 <6>
    <7> <6> <_+> s
    s8 <_+> s <_+> <6 3>16 s <6 3>8 s <_+>
    <4+>4 s4 <4+>4 s8 <_+>\mbreak
    <4+>4 <6> <4>8 <3> <6> s
    <5>8 <5> s4 <_+>2
    s4 <7> <_+> s
    s1
    <8 _+>4 <7><6 3> s\mbreak
    <6>2 <7>8 <6\\> <6>4
    <9 _-> <8 _!> s2
    <_->4 <_+><7> <6\\>
    <7 _->8 <6 _!>16 s <6>4 <9 _!> <8>
    <4> <6> s2\mbreak
    s <5>
    <_+>4 s <_+> s
    <_+>4 s8 <6> <9> s <6>4
    <_+> s8 <6> <5 3>2
    s4 <6>8 s <6>2\mbreak
    <_+>4 <_+> s2
    s8 <6> <5> s <_+>2
    <6 5> s8 <6> s <6>16 s
    <6 5>4 <_+> s2
    <5> <_+>\mbreak
    <_->4 <_+> <_->8 s <5 _->4
    <7> s8 <6> <5 3>4 s
    <6 5>4 <_+> s8 <_+> s4
    s s8 <6> <_+>2
    s1\mbreak
    <6 4>4 <5 _+> <7> <6>
    <_+> <6> s <4+>
    <6> <6\\> s2
    <7>4 <6 _-> <5 4-> <5+ 3>
    <6\\>2 <7>4 <6>\mbreak
    s2 <6->4 <7>8 <6>
    <6\\>2 <_+>4 s8 <_+>16 s
    <6 _+>4 s8 <6 _+> <4+>4 s8 <6>16 s
    <6 4+>4 s <4+>4 s8 <4+>
    <6>4 <_->8 <_-> <6>4 <_->8 <5>16 s\mbreak
    <5 4>4 <5 _+> s8 <_+> s <_+>
    <6-> <6> s <_+> s <_+> s <_+>
    <6-> <6> <6\\>4 <4 2>8 <6> s <_+>
    s <6>16 s <6>8 <_+> s4 s8 <6>
    <_-> <_-> <_+>4 <_-> s8 <6 5->\mbreak
    <7->8 s <6> <5>8 <5 4->8 <3>  <6>4
    s <6>8 s <6>16 s <6>8 <6>8 s
    <6>16 s <6>8 <5 _->4 <5 _-> <5- 3>8 <5- 3>
    <7>4 s8 <6>16 s <6 5>4 s8 <_+>
    <5 _->8 <_-> <5> <6> <_+> s <6- 4> <5 _+>16 s\mbreak
    <_+>4 <_->8 s <_->8 <_+> <5 _-> <3>
    <5 _+> s <6 4> <5 _+>16 s
    <_+>2
    s8 <_+> s <6> <7 3> <6> 16 s <6 4> s <6> s
    <6 5>8 <6 5> <_+>4 s <4+>
    <6> <5>8 <5> s4 <4+>\mbreak
    s4 s8 <5> <_+>4 <6 4>8 <5 _+>16 s
    <_+>1
    s2 <8 _+>4 <7 _+>
    <6> s <6>2
    <7>8 <6\\> <6>4 <3> <_+>\mbreak
    s2 <5 3>4 <5 _+>
    <7> <6\\> <5 _->8 s <6 5>4
    <9> <8> <4+>2
    s1*2\mbreak
    s4 s8 <5> <6>4  <5>8 s
    <5>4 s8 <6 5+> <_+> s <6 4> <5 _+>16 s
    <_+>8 s <6\\>4 s s8 <_+>
    <5>4 s <5 3> <5 3>
    <6\\ 4>8 <5 3> s4 <6 5>8 s <5>8 s\mbreak
    <5>4 s <5>2
    <6>4 <6- 3>8 <6- 3> <5 4>4 <3> 8 <4 2>16 <4 2>32 s
    <4>4 <3>8 <4 2>16 <4 2>32 s <5 4>8 <6> s <6>16 s
    <6>4 <5 3> s s8 <5>16 s
    <5 _!>2 <6>8 <5>16 s <5>8 <7>
    <6>4 <5> <6> <5!>8 s
    <5!>8 s <5 3> <6>16 s <6>8 s <4> <3>
    s4 <5>8 s <5>4 <6>
    <5 3> <6>s8 <6> <5 3>4
    <6-> <6-> s8 <6>16 s <6>4\mbreak

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 2 = 55
    s1*136
    \bar "|."

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

IobI = {
    <<\IobIn \forma>>

}

IobII = {
    <<\IobIIn \forma>>

}

IvlaI = {
    \clef alto
    <<\IvlaIn \forma>>

}

IvlaII = {
    \clef tenor
    <<\IvlaIIn \forma>>

}

Isoprano = {
    \new Voice = "beatus1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "beatus2"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "beatus3"
    <<\Itenoren \forma>>
}

Ibasso = {
    \clef bass
    \new Voice = "beatus4"
    <<\Ibasson \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}



IIvlIn = \relative do'' {

    R1*3

    %4
    R1
    r2 r16 sol' fa mi re do si la
    sol sol la la si8 sol r16 do do do do4

    %7
    si2\fermata r
    R1\mbreak
    do8 do16 do do8 do mi16[do si do] mi[do si do]

    %10
    mi[re do si] do [la re do] si8 sol r4
    sol8 sol16 sol sol8 sol re'16[do si la] si[la sol si]
    do8 do sol' sol, r2

    %13
    r si8 si16 si si8 si\mbreak
    re16[si la si] re[si la si] re[do si la] si8[do16 re]
    mi8 mi, r4\fermata r2

    %16
    mi4.\p mi8 fa4 mi
    r mi\pp re2(
    red) mi4 mi'8\f mi\mbreak

    %19
    do4. do8 do2
    dod4 dod re2
    do?2. sib8[la]

    %22
    sold4 la4. fad8 la4~
    la sold8[fad] sold2\fermata

}

IIvlIIn = \relative do'' {

    R1*3

    %4
    R1
    r2 r16 sol' fa mi re do si la
    sol sol la la si8 sol r16 do do do do4

    %7
    si2\fermata r
    R1\mbreak
    do8 do16 do do8 do mi16[do si do] mi[do si do]

    %10
    mi[re do si] do [la re do] si8 sol r4
    sol8 sol16 sol sol8 sol re'16[do si la] si[la sol si]
    do8 do sol' sol, r2

    %13
    r si8 si16 si si8 si\mbreak
    re16[si la si] re[si la si] re[do si la] si8[do16 re]
    mi8 mi, r4\fermata r2

    %16
    mi4.\p mi8 fa4 mi
    r mi\pp re2(
    red) mi4 mi'8\f mi\mbreak

    %19
    do4. do8 do2
    dod4 dod re2
    do?2. sib8[la]

    %22
    sold4 la4. fad8 la4~
    la sold8[fad] sold2\fermata

}

IIvlaIn = \relative do' {

    R1*3

    %4
    R1
    r16 do mi fa sol sol la si do do si do sol8 sol
    r r16 la sol sol sol sol la8 la la4

    %7
    sol2\fermata sol8 sol16 sol sol8 sol
    si16[sol fad sol] si[sol fad sol] si[la sol fad] sol[fa mi re]\mbreak
    mi8 do r4 do8 do16 do do8 sol'

    %10
    do16[si la sol] la8 fad sol re re re16 re
    re8 re re16[si la si] sol8 sol r4
    mi'8 mi16 mi mi8 mi sol16[mi re mi] sol[mi re mi]

    %13
    do8 mi la4 sol sol8 sol16 sol\mbreak
    sol8 sol sol4. sol8 sol8. fa16
    mi8 dod r4\fermopz r2

    %16
    dod4.\p dod8 re4 re
    r dod\pp re8 [la] do?4~
    do8 [si] do2 si4\mbreak

    %19
    r la'8\f la la4. la8
    la2. sib4~
    sib lab8[sol] fad4 sol8[la?]

    %22
    si!4 la8. sol16 fad2
    mi1\fermata

}

IIobIn = \relative do'' {

    R1*3

    %4
    R1
    r2 r16 sol' fa mi re do si la
    sol sol la la si8 sol r16 do do do do4

    %7
    si2\fermata r
    R1\mbreak
    do8 do16 do do8 do mi16[do si do] mi[do si do]

    %10
    mi[re do si] do [la re do] si8 sol r4
    sol8 sol16 sol sol8 sol re'16[do si la] si[la sol si]
    do8 do sol' sol, r2

    %13
    r si8 si16 si si8 si\mbreak
    re16[si la si] re[si la si] re[do si la] si8[do16 re]
    mi8 mi, r4\fermata r2

    %16
    mi4.\p mi8 fa4 mi
    r mi\pp re2(
    red) mi4 mi'8\f mi\mbreak

    %19
    do4. do8 do2
    dod4 dod re2
    do?2. sib8[la]

    %22
    sold4 la4. fad8 la4~
    la sold8[fad] sold2\fermata

}

IIobIIn = \relative do'' {

    R1*3

    %4
    R1
    r2 r16 sol' fa mi re do si la
    sol sol la la si8 sol r16 do do do do4

    %7
    si2\fermata r
    R1\mbreak
    do8 do16 do do8 do mi16[do si do] mi[do si do]

    %10
    mi[re do si] do [la re do] si8 sol r4
    sol8 sol16 sol sol8 sol re'16[do si la] si[la sol si]
    do8 do sol' sol, r2

    %13
    r si8 si16 si si8 si\mbreak
    re16[si la si] re[si la si] re[do si la] si8[do16 re]
    mi8 mi, r4\fermata r2

    %16
    mi4.\p mi8 fa4 mi
    r mi\pp re2(
    red) mi4 mi'8\f mi\mbreak

    %19
    do4. do8 do2
    dod4 dod re2
    do?2. sib8[la]

    %22
    sold4 la4. fad8 la4~
    la sold8[fad] sold2\fermata

}

IIvlaIIn = \relative do' {

    R1*3

    %4
    r2 r16 sol' fa mi re do si la
    sol8 sol'4 fa8 mi16 mi re do re re re re
    mi8 mi r16 re re re mi mi mi mi re4

    %7
    re2\fermata r
    R1*4
    do8 do16 do do8 do mi16[do si do] mi[do si do]

    %13
    mi8 mi re re16 re re8 re re16[si la si]\mbreak
    sol8 re' re4. re8 re4
    la r \fermopz r2

    %16
    sol4.\p la8 si4 si
    r sib\pp la2~
    la la4 sold\f\mbreak

    %19
    r mi'8 mi fa4. fa8
    fa2. fa4~
    fa do re2~

    %22
    re4 do8 la do2~
    do4 si?8[la] si2\fermopz

}

IIsopranon = \relative do'' {

    \autoBeamOff

    r4 do do sib8 sib
    la4. fa8 la2
    sol1\fermata\mbreak

    %4
    R1
    r2 r16 sol' fa mi re do si la
    sol sol la la si8 sol r16 do do do do4

    %7
    si2\fermata r
    R1\mbreak
    do8 do16 do do8 do mi16[do si do] mi[do si do]

    %10
    mi[re do si] do [la re do] si8 sol r4
    sol8 sol16 sol sol8 sol re'16[do si la] si[la sol si]
    do8 do sol' sol, r2

    %13
    r si8 si16 si si8 si\mbreak
    re16[si la si] re[si la si] re[do si la] si8[do16 re]
    mi8 mi, r4\fermata r2

    %16
    mi4.\p mi8 fa4 mi
    r mi\pp re2(
    red) mi4 mi'8\f mi\mbreak

    %19
    do4. do8 do2
    dod4 dod re2
    do?2. sib8[la]

    %22
    sold4 la4. fad8 la4~
    la sold8[fad] sold2\fermata

}

IItestoI = \lyricmode {

    Pec -- ca -- tor vi -- de - - bit et i -- ra -- sce -- tur, i -- ra -- sce -- tur,  i -- ra -- sce -- tur, et i -- ra -- sce -- tur,

    den -- ti -- bus su -- is fre - - - - met; den -- ti -- bus su -- is fre - - - - met; den -- ti -- bus su -- is fre - - - - met;

    et ta -- be -- scet, ta -- be -- scet, de -- si -- de -- ri -- um pec -- ca -- to - - - rum pe -- ri - bit.

}

IIalton = \relative do' {

    \autoBeamOff

    sol'2 la4 sol8 sol
    sol4 fa4. do8 fa4~
    fa mi8 [re] mi2\fermopz \mbreak

    %4
    R1
    r16 do mi fa sol sol la si do do si do sol8 sol
    r r16 la sol sol sol sol la8 la la4

    %7
    sol2\fermata sol8 sol16 sol sol8 sol
    si16[sol fad sol] si[sol fad sol] si[la sol fad] sol[fa mi re]\mbreak
    mi8 do r4 do8 do16 do do8 sol'

    %10
    do16[si la sol] la8 fad sol re re re16 re
    re8 re re16[si la si] sol8 sol r4
    mi'8 mi16 mi mi8 mi sol16[mi re mi] sol[mi re mi]

    %13
    do8 [mi] la4 sol sol8 sol16 sol\mbreak
    sol8 sol sol4. sol8 sol8. [fa16]
    mi8 dod r4\fermopz r2

    %16
    dod4. \p dod8 re4 re
    r dod\pp re8 [la] do?4~
    do8 [si] do2 si4\mbreak

    %19
    r la'8\f  la la4. la8
    la2. sib4~
    sib lab8[sol] fad4 sol8[la?]

    %22
    si!4 la8. sol16 fad2
    mi1\fermata

}

IItestoII = \lyricmode {

    Pec -- ca -- tor vi -- de - - - - bit et i -- ra -- sce -- tur, i -- ra -- sce -- tur,  i -- ra -- sce -- tur, et i -- ra -- sce -- tur, i -- ra -- sce -- tur,

    den -- ti -- bus su -- is fre - - - - met; den -- ti -- bus su -- is fre - met, fre -- met; den -- ti -- bus su -- is fre - met;

    den -- ti -- bus su -- is fre - - - met; den -- ti -- bus su -- is fre -- met, fre - met;

    et ta -- be -- scet, ta -- be - - scet, de -- si -- de -- ri -- um pec -- ca -- to - - rum pe -- ri -- bit.

}

IItenoren = \relative do' {

    \autoBeamOff

    mi2 mi8(do4) do8~
    do do do2.
    do1\fermopz \mbreak

    %4
    r2 r16 sol' fa mi re do si la
    sol8 sol'4 fa8 mi16 mi re do re re re re
    mi8 mi r16 re re re mi mi mi mi re4

    %7
    re2\fermata r
    R1*4
    do8 do16 do do8 do mi16[do si do] mi[do si do]

    %13
    mi8 mi re re16 re re8 re re16[si la si]\mbreak
    sol8 re' re4. re8 re4
    la r \fermopz r2

    %16
    sol4.\p la8 si4 si
    r sib\pp la2~
    la la4 sold\mbreak

    %19
    r mi'8\f mi fa4. fa8
    fa2. fa4~
    fa do re2~

    %22
    re4 do8 la do2~
    do4 si?8[la] si2\fermopz

}

IItestoIII = \lyricmode {

    Pec -- ca -- tor vi -- de -- bit et i -- ra -- sce -- tur, i -- ra -- sce - - - tur,  i -- ra -- sce -- tur, i -- ra -- sce -- tur,  et i -- ra -- sce -- tur,

    i -- ra -- sce -- tur, den -- ti -- bus su -- is fre - - met; den -- ti -- bus su -- is fre  - met, fre -- met, fre -- met;

    et ta -- be -- scet,  ta -- be - scet, de -- si -- de -- ri -- um pec -- ca -- to -- rum pe -- ri - bit.

}

IIbasson = \relative do {

    \autoBeamOff

    do'2 la4 mi8 mi
    fa1
    do\fermata\mbreak

    %4
    r16 do mi fa sol sol la si do8 do, r16 fa fa fa
    mi8 do r16 mi mi re  do8 sol'16 do si la sol fa
    mi mi fad fad sol2 fad4

    %7
    sol2\fermata r
    R1*2
    r2 sol8 sol16 sol sol8 sol

    %11
    si16[sol fad sol] si[sol fad sol] si[la sol fad] sol[fa mi re]
    mi8 do r4 do8 do16 do do8 sol'
    do16[si la sol] fad8 re sol sol16 sol sol8 sol\mbreak

    %14
    si16[sol fad sol] si[sol fad sol] si[la sol fad] sol[fa mi re]
    dod8[la] r4\fermata sib\upl\p sib\upl~
    sib la sold2\fermata

    %17
    sol!\pp fad
    fa! mi\mbreak
    r4 la'8\f la fa4. fa8

    %20
    fa2 fa4 fa
    fa4. mib8 re4 sol8 [fa]
    mi4 la8 la red,2

    %23
    mi1\fermopz

}

IItestoIV = \lyricmode {

    Pec -- ca -- tor vi -- de -- bit et i -- ra -- sce -- tur, i -- ra -- sce -- tur,  et i -- ra -- sce -- tur,

    i -- ra -- sce -- tur,  i -- ra -- sce -- tur,  et i -- ra -- sce -- tur,

    i -- ra -- sce -- tur, den -- ti -- bus su -- is fre - - - - met; den -- ti -- bus su -- is fre  - met,

    den -- ti -- bus su -- is fre  - - - met;

    et ta -- be -- scet,  ta -- be - scet, de -- si -- de -- ri -- um pec -- ca -- to - - - - rum pe -- ri -- bit.

}

IIbcn = \relative do {

    do'2 la4 mi8 mi
    fa1
    do\fermata\mbreak

    %4
    r16 do\upl mi\upl fa\upl sol\upl sol\upl la\upl si\upl do8\upl do,\upl r16 fa fa fa
    mi8 do r16 mi mi re  do8 sol'16 do si la sol fa
    mi mi fad fad sol2 fad4

    %7
    sol2\fermata \clef violin sol'8 sol16 sol sol8 sol
    si16[sol fad sol] si[sol fad sol] si[la sol fad] sol[fa mi re]\mbreak
    <<
        {
            do'8 do16 do do8 do mi16[do si do] mi[do si do]

            %10
            mi[re do si] do [la re do]
        }\\{
            mi,8 do r4 do8 do16 do do8 sol'
            do16[si la sol] la8 fad
        }
    >>\clef bass sol,8 sol16 sol sol8 sol

    %11
    si16[sol fad sol] si[sol fad sol] si[la sol fad] sol[fa mi re]
    mi8 do r4 do8 do16 do do8 sol'
    do16[si la sol] fad8 re sol sol16 sol sol8 sol\mbreak

    %14
    si16[sol fad sol] si[sol fad sol] si[la sol fad] sol[fa mi re]
    dod8[la] r4\fermata sib\upl\p sib\upl~
    sib la sold2\fermata

    %17
    sol!\pp fad
    fa! mi\mbreak
    r4 la'8\f la fa4. fa8

    %20
    fa2 fa4 fa
    fa4. mib8 re4 sol8 [fa]
    mi4 la8 la red,2

    %23
    mi1\fermopz

}

IIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2 <6 5->
    <9 3>4 <8 3> s <5 3>8 s
    <5  4>4 <5 3>8 <5 2> <5 3>2
    s s4 s16 <5> s8
    <6>4 s16 <6> s8 s <5>32 s <5>16 <6>8 s
    <6> <6> <5>4 <4 2> <6>
    s1*3
    s2 <5>
    <6> s
    <6> s4 s8 <5 _!>
    s4 <6>8 <_+> <5 _ 3>4 <_>8 <_>\mbreak
    <6>8 s <6>8 s <6> <6>16 s s8<6>16 s
    <6>8 <_+> s4 s2
    <6 4 2+>4 <5 _+> <7> <6>8 s
    <6 4+ _->4 s <6> <5>8 s
    <6- 5>4 s <6 4> <5 _+>
    s <5 3>8 s <5>2
    <5+ 3>4 s <6 3>4<4->
    <5 4>4 <3->8 <3> <7 _+>4 <3->
    <7 _+> s <7 _+>2
    <6 4>4 <5 _+>8 <4 2\\> <5 _+>2

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 4 = 50\once \override Score.RehearsalMark.extra-offset = #'(0 . -3)
    \mark\markup\huge "Grave"
    s1*3\mbreak\once \override Score.RehearsalMark.extra-offset = #'(+4 . -3)
    \mark\markup\huge "Allegro"
    \tempo 2 = 50
    s1*3
    s2\once \override Score.RehearsalMark.extra-offset = #'(+6 . -3)\mark\markup\huge "Più allegro"  \tempo 2 = 53 s
    s1*7
    s2\once \override Score.RehearsalMark.extra-offset = #'(+3 . -2.5) \mark\markup\huge "Adagio" \tempo 4 = 50 s
    s1*8
    \bar "|."

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIobI = {
    <<\IIobIn \forma>>

}

IIobII = {
    <<\IIobIIn \forma>>

}

IIvlaI = {
    \clef alto
    <<\IIvlaIn \forma>>

}

IIvlaII = {
    \clef tenor
    <<\IIvlaIIn \forma>>

}

IIsoprano = {
    \new Voice = "peccator1"
    <<\IIsopranon \forma>>
}

IIalto = {
    \new Voice = "peccator2"
    <<\IIalton \forma>>
}

IItenore = {
    \new Voice = "peccator3"
    <<\IItenoren \forma>>
}

IIbasso = {
    \clef bass
    \new Voice = "peccator4"
    <<\IIbasson \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}



IIIvlIn = \relative do'' {

    r4 r8 mi, si'4. do16 re
    do8 si la16 si do re mi(do) re(si) do(la) si(sold)
    sold8 mi r do si'4_\upl sold_\upl

    %4
    la8(sold) r4 r r8 mi'
    fa16 re dod re fa re dod re sib8 la r mi'\p
    fa16 re dod re fa re dod re sib8 la sold la

    %7
    re, re'4 mi16 re do8 re mi4~
    mi red8 mi16 fa sol8 mi r4
    r r8 sold, mi mi' r4

    %10
    r r8 sold, mi mi' r4\mbreak
    R1
    r2 r4 r8 fad,

    %13
    sol16 mi sol si sold mi sold si mi8 la,4 sol?16 fa
    sol mi sol si sold mi sold si mi re re do do si si la
    la sol sol fad fad mi mi fad red8 si r4\mbreak

    %16
    r2 mi'16\pp re re do do si si la
    la sol sol fad fad mi mi fad red8 si r4
    R1*6

}

IIIvlIIn = \relative do'' {

    r8 mi, la4. sold16 fa sold8. sold16
    la8 sold16 fa mi8 sold do16(la) si(sold) la8 fad
    mi4 r r2

    %4
    r4 r8 fa? mi si' mi dod
    la la, r la'16 sol? fa8 mi mi' dod\mbreak
    la la, r la'16\p sol fa8 mi re do

    %7
    fa4 r8 sold la la, r4
    R1*4
    r2 r4 r8 red

    %13
    si si' r si la mi fad si
    si,4 r8 si' la4 r8 fad
    fad?4 r8 fad fad4 r\mbreak

    %16
    r4 r8 si si, si' r mi,
    red si' r fad fad4 r
    R1*6

}

IIIvlaIn = \relative do' {

    do8 re mi do fa [re mi8. mi16]
    mi4. re8 do4 r8 fad
    si,4 r r2

    %4
    R1
    r8 mi re mi re mi la,4\mbreak
    r8 mi'\p re mi re(mi) r mi

    %7
    si4 mi mi r
    R1*5
    mi4\upl si'\upl mi,\upl r

    %14
    mi\upl\mbreak mi\upl mi r8 mi
    red4 r8 red si4 r\mbreak
    R1*8

}

IIIobIn = \relative do'' {

    r4 r8 mi, si'4. do16 re
    do8 si la16 si do re mi(do) re(si) do(la) si(sold)
    sold8 mi r4 r2

    %4
    r r4 r8 mi'
    fa16 re dod re fa re dod re sib8 la r mi'\p
    fa16 re dod re fa re dod re sib8 la sold la

    %7
    re, re'4 mi16 re do8 re mi4~
    mi red8 mi16 fa sol8 mi r4
    R1*3
    r2 r4 r8 fad,

    %13
    sol16 mi sol si sold mi sold si mi8 la,4 sol?16 fa
    sol mi sol si sold mi sold si mi re re do do si si la
    la sol sol fad fad mi mi fad red8 si' r4\mbreak

    %16
    R1*2
    r2 r8 si\p mi4~
    mi8 red16 dod red8 mi16 fad?sol4.\tr sol8

    %20
    fad4 r r2\mbreak
    r8 mi16\p re re(do) do(si) si(la) la(sol) sol(fa) fa(mi)
    re8 do16 re mi8 sold la mi mi'4~

    %23
    mi re8. re16 mi2

}

IIIobIIn = \relative do'' {

    r8 mi, la4. sold16 fa sold8. sold16
    la8 sold16 fa mi8 sold do16(la) si(sold) la8 fad
    mi4 r r2

    %4
    r4 r8 fa? mi si' mi dod
    la la r la16 sol? fa8 mi mi' dod\mbreak
    la la r la16\p sol fa8 mi re do

    %7
    fa4 r8 sold la la r4
    R1*4
    r2 r4 r8 fad

    %13
    sol16 mi sol si sold mi sold si mi8 la,4 sol?16 fa
    sol mi sol si sold mi sold si mi re re do do si si la
    la sol sol fad fad mi mi fad red8 si' r4\mbreak

    %16
    R1*2
    r2 r8 si\p mi4~
    mi8 red16 dod red8 mi16 fad?sol4.\tr sol8

    %20
    fad4 r r2\mbreak
    r8 mi16\p re re(do) do(si) si(la) la(sol) sol(fa) fa(mi)
    re8 do16 re mi8 sold la mi mi'4~

    %23
    mi re8. re16 mi2

}

IIIalton = \relative do' {

    \autoBeamOff

    R1*2
    r8 mi la4. si16[do] si8 mi,16 mi
    do'8[si] la si sold8. fad16 mi4

    %5
    R1*2
    si'4. do16 si do8 si la sol16 sol
    sol4 fad r8 la[sold la]

    %9
    mi16[re mi8]\parenthesize ~ mi16[re' do si] do[si la8] sold[la]
    mi16[re mi8]~mi16[re' do si] do4. si8~\mbreak
    si[la]~la16[sol fad mi] red8[si']\parenthesize ~ si16[la sol fad]

    %12
    la8[red, mi la] sol4 la8 fad
    mi2 r
    R1

    %15
    r2 r4 si'~\mbreak
    si8 la16[sol] la8 fad sol8.[fad16] mi4
    r2 r4 si'8 sol

    %18
    la do si la sol 8. fad16 mi8 sol
    fad4. si,8 mi2
    red4 si'8 si do do16 si la8 si\mbreak

    %21
    sold8 [mi] la2.~
    la4 sold8[si] do4 si
    la2 sold

}

IIItestoII = \lyricmode {

    Glo - - - ria _ Pa -- tri et Fi -- lio, _ glo ria _ et Spi -- ri -- tui _ San -- cto,

    glo - - - - - - - - - - ri -- a.

    Si -- cut si -- cut e -- rat, si -- cut e -- rat in prin -- ci -- pio, _ et nunc et sem -- per

    et in sæ -- cu -- la sæ -- cu -- lo - - - - - rum.

}

IIIbcn = \relative do {

    la'8^\markup\italic "R[ipieni]" si do la re la mi' mi,
    la mi16 re do8 si la4 r8 red
    mi\p^\solo  re do la re4 r8 mi
    la mi'16 re do8 re mi\f re dod la^\markup\italic "R."

    %5
    re, la' re, la' re dod16 si dod8 la\mbreak
    re,\p la' re, la' re do? si la~
    la sold16 fad sold8 mi la4 r8 lad\solo

    %8
    si lad? si red mi do si la?~
    la sold16 fad sold8 mi la do si la
    la sold16 fad sold8 mi la la, red4\mbreak

    %11
    mi8 fad sol la si dod red si
    mi si do? la si la si si,^\markup\italic "R[ipieni]"
    mi4 re do8 dod re red

    %14
    mi4 re? do? r8 la'
    si si, si' si, si' la sol mi\mbreak
    red4 r8 red mi4 la

    %17
    si8 si, si' si, si' la sol mi
    red4 r8 red mi fad sol mi
    la fad si la sol mi16 fad sol8 la

    %20
    si la sold mi la sol? fa re?\mbreak
    mi4 r r2
    r la4 sol

    %23
    fa2 mi

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6 5>4 <_+>
    s8 <_+> s2 s8 <6>
    <_+>2 <6 5>4 s8 <_+> s <_+> s4 <_+> s8 <6>
    s <_+> s <_+><6-> <6> s4
    s8 <_+> s <_+> <6\\> <6> <6\\> s
    <4 2>4 <6>8 <_+> s4 s8 <7 _+>
    <6 4>4 <5 _+> <_!>8 <6> <6\\> s
    <4 2>4 <6> s8 <6> <6\\> s
    <4 2> <3> <6>4 s <7>8 <6>\mbreak
    s4 <6> <_+> <6>
    s8 <_+> <5>16 s <5>8 <6> <_+>16 s \bassFigureExtendersOn <5 _+>8 <5 _+>
    s4 <4+ 2> <6> <5 _+>8 <5 _+>
    s4 <4+ 2> <6> s8 <6\\ 5>
    <5+ _+>4 <5+ _+> <5+ _+>8 s <6>4\mbreak
    \bassFigureExtendersOff <6>2 s4 <5>
    <5+ _+>4 s <_+> <6>
    <5>2 s4 <6>
    <6\\> <_+> <6> s
    <_+> <6> s <6 5>\mbreak
    <5 _+>1
    s2 s4 <6>
    <7> <6>

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 2 = 52
    s1*21
    s2 \once \override Score.RehearsalMark.extra-offset = #'(+2 . -3) \mark\markup\huge "Adagio"  \tempo 4 = 55 s
    s1
    \bar "|."

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIobI = {
    <<\IIIobIn \forma>>

}

IIIobII = {
    <<\IIIobIIn \forma>>

}

IIIvlaI = {
    \clef alto
    <<\IIIvlaIn \forma>>

}

IIIalto = {
    \new Voice = "gloria2"
    <<\IIIalton \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}



IVvlIn = \relative do'' {

    mi2 fa
    mi8[la,] mi'2 re4
    do8[si do re] mi4 mi,

    %4
    r si' do dod
    re red mi2~\mbreak
    mi4 re4. dod8 re4

    %7
    do!2 r
    mi red
    mi8[fad] sol4. fad8 mi[red16 mi]

    %10
    fad2 si,\mbreak
    mi red4 re
    dod do2 si4

    %13
    la si si2
    r4 si do dod
    re red mi4. re?8\mbreak

    %16
    dod4 re2 dod4
    re2 mi~
    mi4  re2 dod4

    %19
    re2 r4 do?
    si sib la8[si] do4(\mbreak
    re2) do(

    %22
    si4) do2 si4
    do2 r
    R1

    %25
    si2 do4 dod\mbreak
    re red mi mi,
    r2 mi'~

    %28
    mi fa
    mi8[si mi re] do4. si16[la]
    si2 mi,\mbreak

    %31
    r2 r4 la
    do dod re red
    mi4. re?8 dod4 re~

    %34
    re do? si2
    la sold4 la~\mbreak
    la sold r2

    %37
    la2 do4 si8[mi,]
    mi'2 re8[do] si4~
    si do si2

    %40
    la4 sold la sold\mbreak
    la si do si
    do2 r

}

IVobIn = \relative do'' {

    mi2 fa
    mi8[la,] mi'2 re4
    do8[si do re] mi4 mi,

    %4
    r si' do dod
    re red mi2~\mbreak
    mi4 re4. dod8 re4

    %7
    do!2 r
    mi red
    mi8[fad] sol4. fad8 mi[red16 mi]

    %10
    fad2 si,\mbreak
    mi red4 re
    dod do2 si4

    %13
    la si si2
    r4 si do dod
    re red mi4. re?8\mbreak

    %16
    dod4 re2 dod4
    re2 mi~
    mi4  re2 dod4

    %19
    re2 r4 do?
    si sib la8[si] do4(\mbreak
    re2) do(

    %22
    si4) do2 si4
    do2 r
    R1

    %25
    si2 do4 dod\mbreak
    re red mi mi,
    r2 mi'~

    %28
    mi fa
    mi8[si mi re] do4. si16[la]
    si2 mi,\mbreak

    %31
    r2 r4 la
    do dod re red
    mi4. re?8 dod4 re~

    %34
    re do? si2
    la sold4 la~\mbreak
    la sold r2

    %37
    la2 do4 si8[mi,]
    mi'2 re8[do] si4~
    si do si2

    %40
    la4 sold la sold\mbreak
    la si do si
    do2 r

}

IVsopranon = \relative do'' {

    \autoBeamOff

    mi2 fa
    mi8[la,] mi'2 re4
    do8[si do re] mi4 mi,

    %4
    r si' do dod
    re red mi2~\mbreak
    mi4 re4. dod8 re4

    %7
    do!2 r
    mi red
    mi8[fad] sol4. fad8 mi[red16 mi]

    %10
    fad2 si,\mbreak
    mi red4 re
    dod do2 si4

    %13
    la si si2
    r4 si do dod
    re red mi4. re?8\mbreak

    %16
    dod4 re2 dod4
    re2 mi~
    mi4  re2 dod4

    %19
    re2 r4 do?
    si sib la8[si] do4(\mbreak
    re2) do(

    %22
    si4) do2 si4
    do2 r
    R1

    %25
    si2 do4 dod\mbreak
    re red mi mi,
    r2 mi'~

    %28
    mi fa
    mi8[si mi re] do4. si16[la]
    si2 mi,\mbreak

    %31
    r2 r4 la
    do dod re red
    mi4. re?8 dod4 re~

    %34
    re do? si2
    la sold4 la~\mbreak
    la sold r2

    %37
    la2 do4 si8[mi,]
    mi'2 re8[do] si4~
    si do si2

    %40
    la4 sold la sold\mbreak
    la si do si
    do2 r

}

IVtestoI = \lyricmode {

    A - - - - - - men a - - - - - - - -  men a - - - - - - men a - - - - - - - men a - - - - - - - -  men a - - - men a - - - - - - - men

    a - - - - - men a - - - - -  men a - - - - -  men a - - men a - - men a - - - - - men a -- men a - - men a - - men.

}

IValton = \relative do' {

    \autoBeamOff

    r2 la'
    do si4. sold8
    la1

    %4
    sold4 si la mi
    fa fad sol sold\mbreak
    la2 sol?4 mi

    %7
    re r si'2
    do si8[fad si la]
    sol4 red mi2

    %10
    si'4 fad? sol sold\mbreak
    la lad si fad
    sol4. fad8 sold[la] si[si,]

    %13
    red[fad?] sol?4 fad!2
    sol4 r mi2
    fa! mi8 [la,] sol'4~\mbreak

    %16
    sol fa sol2
    fa4 la si2
    la r4 sol

    %19
    fad fa mi mib
    re sol2 fad4\mbreak
    sol2. fa?4~

    %22
    fa mi re2
    r4 mi fa fad
    sol sold la8 [re,] la'4~

    %25
    la sold2 sol4\mbreak
    fad si2 lad4
    si2. mi,4

    %28
    r2 la2~
    la4 sold4 la2~
    la4 sold r la\mbreak

    %31
    sold sol fad fa
    mi2 r4 la
    sold sol2 fad4

    %34
    fa! mi mi2
    la, si4 mi\mbreak
    re2 mi

    %37
    r4 la sold2
    la4 mi fa fad
    sold la2 sold4

    %40
    la si do si\mbreak
    la sold la sold
    la2 r

}

IVtestoII = \lyricmode {

    A - - - - - - men a - - - - - - - men a - - - - - men a - - - - - men a - - - - - - men a - - - men a - - - men

    a - - - - - - - - - - men a - - - - - - - - - - - - men a - - men a - - - - men a - - - - - men a - - - men a - men a - - - - - men a - - men a - - men.

}

IVtenoren = \relative do' {

    \autoBeamOff

    R1
    r2 mi
    fa mi8[la,] mi'4

    %4
    re (mi) mi2
    R1
    la,2 sib4 si~

    %7
    si la2 sold4
    R1
    r2 mi'
    red mi4 re?\mbreak

    %11
    do2 si
    r4 do re red~
    red mi2 red4

    %14
    mi2 r
    R1*2
    la,2 sold4 sol~

    %18
    sol fa mi4. la8
    la2 r
    r do\mbreak

    %21
    si4 sib2 la4
    sol1
    sol2 r

    %24
    mi' fa
    mi r\mbreak
    r mi

    %27
    red4 re2 do4
    si dod re8[la re do?]
    si2 r

    %30
    si (do)\mbreak
    si la
    sold4 sol fad fa

    %33
    mi2.~mi8[fad]
    sold4 la r si
    do dod re do?\mbreak

    %36
    si2 do4 dod
    re red mi2
    la,4. mi8 la2

    %39
    sold4 mi mi'2~
    mi mi\mbreak
    mi1

    %42
    mi2 r

}

IVtestoIII = \lyricmode {

    A - - - - men a - - -  men a - - - - men a - - - - men a - - - - - men a - - - - men a - men

    a - - - - - - men a --  men a - - - - -  - men a - - - men a - - - - - - - - - men a -- men a -- men.

}

IVbasson = \relative do {

    \autoBeamOff

    R1*2
    la'2 do

    %4
    si4 sold la la,
    r2 mi'2\mbreak
    fa4 fad sol sold

    %7
    la2 mi2
    R1
    si'2 do

    %10
    si r\mbreak
    r si
    lad4 la sold sol

    %13
    fad mi si'2
    mi, r
    R1\mbreak

    %16
    r2 mi2
    fa mi8 [mi, mi' re]
    dod4 re la'2

    %19
    re, r
    sol la\mbreak
    sol8 [sol, sol' fa] mi4 fa

    %22
    sol do, sol2
    do r

    %24
    R1*2\mbreak
    si'2 do
    si8[si, si' la] sold4 la

    %28
    mi2 re
    mi1~
    mi\mbreak

    %31
    mi
    mi
    mi~

    %34
    mi4 la sold sol
    fad fa mi2\mbreak
    mi mi

    %37
    fa mi8 [mi,  mi' re]
    do4 dod re red
    mi1

    %40
    la,4 mi' la mi\mbreak
    la, mi' la mi
    la,2 r


}

IVtestoIV = \lyricmode {

    A - - - - men a - - - - - men a - men a - - - - - men a --  men a - - - - - men a - - - - - - - men

    a - - - - - men a --  men  a -- men  a - - - - men a - - - - - - - - men a - -  men a - -  men.

}

IVbcn = \relative do {

    <<
        {
            \clef violin mi''2 fa
            mi
        }\\{
            r la,
            do
        }
    >> \clef bass mi,2
    la, do

    %4
    si4 sold la la,
    <<{\clef violin re'' red}\\{fa, fad}>> \clef bass mi,2\mbreak
    fa4 fad sol sold

    %7
    la2 mi4 \clef violin si''
    <<{mi2 red}\\{do si8 fad si la}>>
    \clef bass si,2 do

    %10
    si mi4 re\mbreak
    do2 si
    lad4 la sold sol

    %13
    fad mi si'2
    mi,4 \clef violin si'' <<
        {
            do dod
            re red mi4. re?8

            %16
            dod4 re
        }\\{
            mi,2
            fa? mi8[la,] sol'4~
            sol fa
        }
    >> \clef bass mi,2
    fa mi8 [mi, mi' re]
    dod4 re la2

    %19
    re r
    sol la\mbreak
    sol8 [sol, sol' fa] mi4 fa

    %22
    sol do, sol2
    do r
    \clef tenor mi'2 fa

    %25
    mi r\mbreak
    \clef bass si do
    si8[si, si' la] sold4 la

    %28
    mi2 re
    mi mi8^\tasto[mi, mi' mi,]
    mi'[mi, mi' mi,] mi'[mi, mi' mi,]\mbreak

    %31
    mi'[mi, mi' mi,] mi'[mi, mi' mi,]
    mi'[mi, mi' mi,] mi'[mi, mi' mi,]
    mi'[mi, mi' mi,] mi'[mi, mi' mi,]

    %34
    mi'4 la sold sol
    fad fa mi2\mbreak
    mi mi

    %37
    fa mi8 [mi,  mi' re]
    do4 dod re red
    mi1

    %40
    la,4 mi' la mi\mbreak
    la, mi' la mi
    la,2 r

}

IVbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s1
    s2 <8 _+>4 <7 _+>
    <6 _ 3>2 <_>4 <6>
    <6\\>2 <3>4 <_+>
    s2 <3->4 <_+>
    <7> <6> <5 _-> <6 5!>
    <9> <8> <4> s
    s1
    <6 4>8 s <6 _+>4 <7> <6>
    <5+ _+>2 s4 <4+>
    <6> <6\\><5 _+> <5 _->
    <7 _+> <6 _-> <5 4> <5+ 3>
    <6\\>2 <4>4 <_+>
    s1*2
    s2 <7>4 <6\\>
    s2 <_+>4 <_->
    <6 5>2 <4>4 <_+>
    s1
    <5 3>8 s <5 _->4 <7> <6\\>
    <5!>2 <6 5->
    <7 _!>4 s <4> <3>
    s1
    <3>4 <_+> <7> <6>
    <5 4+>1
    <5+ 3>4 <_+> <7> <6\\>
    <_+> <_-> <6 5> s
    <5> <6\\> <5>4 s
    <5 4+>2 s
    s1*4
    s4 <5 3!> <6> <6>
    <5 3> <5+> <7 5> <6 4>8 s
    <4>4 <_+>8 s <6 _+>4 <6\\ _->
    <6> <6\\> <6 _+> <5 _+>8 s
    <5>4 <5>8 s <5>8 s <6 5 _+>8 s
    <7 _+>4 <6 4>8 s <5 4>4 <_+>
    s <_+> s <_+>
    s <_+> s <_+>

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 2 = 55
    s1*42
    \bar "|."

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVobI = {
    <<\IVobIn \forma>>

}

IVsoprano = {
    \new Voice = "amen1"
    <<\IVsopranon \forma>>
}

IValto = {
    \new Voice = "amen2"
    <<\IValton \forma>>
}

IVtenore = {
    \new Voice = "amen3"
    <<\IVtenoren \forma>>
}

IVbasso = {
    \clef bass
    \new Voice = "amen4"
    <<\IVbasson \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}
#(set-global-staff-size 15)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

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
        subtitle = \markup\larger "Beatus vir a 4 voci [ZWV 75] "
        composer = \markup {"J. D. Zelenka (1660-1725)"}
    }

    \markup \huge {[1.] Beatus vir. Vivace}

    \score {
        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Oboe 1."}
                    \set Staff.shortInstrumentName = "ob1"
                    \IobI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Oboe 2."}
                    \set Staff.shortInstrumentName = "ob2"
                    \IobII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Viola 1."}
                    \set Staff.shortInstrumentName = "vla1"
                    \IvlaI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Viola 2."}
                    \set Staff.shortInstrumentName = "vla2"
                    \IvlaII\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 mi''2 ^\markup\center-align "Soprano" fa''4. fa''8}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop"
                    \Isoprano \global
                    \new Lyrics \lyricsto "beatus1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r2 la'^\markup\center-align "Alto"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt"
                    \Ialto \global
                    \new Lyrics \lyricsto "beatus2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r1 r2 mi'^\markup\center-align"Tenore"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten"
                    \Itenore \global
                    \new Lyrics \lyricsto "beatus3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas"
                    \Ibasso \global
                    \new Lyrics \lyricsto "beatus4" \ItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/12)
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

    \markup \huge {[2.] Peccator videbit}

    \score {
        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Oboe 1."}
                    \set Staff.shortInstrumentName = "ob1"
                    \IIobI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Oboe 2."}
                    \set Staff.shortInstrumentName = "ob2"
                    \IIobII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Viola 1."}
                    \set Staff.shortInstrumentName = "vla1"
                    \IIvlaI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Viola 2."}
                    \set Staff.shortInstrumentName = "vla2"
                    \IIvlaII\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 r4 do'' ^\markup\center-align "Soprano" do''}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop"
                    \IIsoprano \global
                    \new Lyrics \lyricsto "peccator1" \IItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 sol'2^\markup\center-align "Alto" la'4}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt"
                    \IIalto \global
                    \new Lyrics \lyricsto "peccator2" \IItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 mi'2^\markup\center-align"Tenore" mi'8}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten"
                    \IItenore \global
                    \new Lyrics \lyricsto "peccator3" \IItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas"
                    \IIbasso \global
                    \new Lyrics \lyricsto "peccator4" \IItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/12)
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

    \markup \huge {[3.] Gloria Patri}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 2."}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Oboe 1."}
                \set Staff.shortInstrumentName = "ob1"
                \IIIobI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Oboe 2."}
                \set Staff.shortInstrumentName = "ob2"
                \IIIobII\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola 1. & 2."}
                \set Staff.shortInstrumentName = "vla"
                \IIIvlaI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 r1^\markup\center-align "Alto" r r8 mi' la'4.}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \set Staff.shortInstrumentName = "alt"
                \IIIalto \global
                \new Lyrics \lyricsto "gloria2" \IIItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 15)
            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/12)
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

    \markup \huge {[4.] Amen}

    \score {
        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 1. & 2."}
                    \set Staff.shortInstrumentName = "vl"
                    \IVvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Oboe 1. & 2."}
                    \set Staff.shortInstrumentName = "ob"
                    \IVobI\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 mi''2 ^\markup\center-align "Soprano" fa''}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop"
                    \IVsoprano \global
                    \new Lyrics \lyricsto "amen1" \IVtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r2 la'^\markup\center-align "Alto"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt"
                    \IValto \global
                    \new Lyrics \lyricsto "amen2" \IVtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r1 r2 mi'^\markup\center-align"Tenore"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten"
                    \IVtenore \global
                    \new Lyrics \lyricsto "amen3" \IVtestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas"
                    \IVbasso \global
                    \new Lyrics \lyricsto "amen4" \IVtestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/12)
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