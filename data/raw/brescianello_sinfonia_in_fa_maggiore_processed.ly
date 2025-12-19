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

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IcrIn = %\transpose do fa,

\relative do'' {
    \key do\major

    mi4 r r
    mi sol fa
    mi r r

    %4
    la sol fa
    mi r r\mbreak
    la sol fa

    %7
    mi r8 mi mi mi
    re sol4 re8 mi fa
    mi sol4 do,8 re mi

    %10
    re4 sol r\mbreak
    la\upl sol\upl fad\upl
    sol r r

    %13
    sol r r
    r8 sol\noBeam sol (fa) fa (mi)
    mi (sol) sol (fa) fa (mi)

    %16
    mi4 r r
    mi sol fa\mbreak
    mi r r

    %19
    la sol fa
    mi r r
    la sol fa

    %22
    mi mi8 mi mi mi\mbreak
    re sol4 mi8 fa sol
    mi sol4 do,8 re mi

    %25
    re4 sol r
    la sol fad
    sol2 r4

    %28
    R2.\mbreak
    fa4 fa8 fa fa fa
    re4 re8 re re re

    %31
    fa4 fa8 fa fa fa
    re4 re8 re re re
    mi4 sol8 fa sol fa\mbreak

    %34
    mi4 r r
    R2.*9
    sol,4 r r

    %45
    sol  r r
    sol r r
    mi' re do\mbreak

    %48
    re r r
    fa mi re
    mi r r

    %51
    mi,8 mi mi mi mi mi\mbreak
    mi4 r r
    mi r r

    %54
    mi r r
    R2.
    mi'4\upl fa\upl r

    %57
    R2.
    re4\upl mi\upl r\mbreak
    R2.*6

    %65
    mi,4 mi8 mi mi mi
    mi2.
    R2.*6\mbreak

    %73
    fa'8 fa fa fa fa fa
    sol4 r r
    sol8 sol sol sol sol sol

    %76
    la4 r r
    re,8 re re re re re
    mi4 r r\mbreak

    %79
    re8 re re re re re
    mi4 r r
    mi r r

    %82
    mi r r
    mi8 mi mi mi mi mi\mbreak
    la4 r r

    %85
    la r r
    la r r
    la8 la la la la la

    %88
    sol4 r r\mbreak
    R2.*7
    sol,4 r r

    %97
    sol r r
    sol r r
    sol r r

    %100
    R2.*3
    re'4\upl mi\upl r\mbreak
    R2.*3

    %107
    mi4 r r
    mi r r\mbreak
    mi8 do re2\tr

}

IcrIIn = %\transpose do fa,

\relative do'' {
    \key do\major

    do4 r r
    do mi re
    do r r
    fa mi re
    do r r\mbreak
    fa mi re
    do r8 do do do
    sol r4 sol8 do re
    do4 r8 mi, sol mi
    sol4 re' r\mbreak
    mi\upl re\upl re\upl
    re r r
    re r r
    r8 mi\noBeam mi(re) re(do)
    do (mi) mi (re) re (do)
    do4 r r
    do mi re\mbreak
    do r r
    fa mi re
    do r r
    fa mi re
    do do8 do do do\mbreak
    sol re'4 sol,8 do re
    do mi4 mi,8 sol do
    sol4 re' r
    mi re  re
    sol,2 r4
    R2.\mbreak
    re'4 re8 re re re
    sol,4 sol8 sol sol sol
    do4 do8 do do do
    sol4 sol8 sol sol sol
    do4 mi8 re mi re\mbreak
    do4 r r
    R2.*9
    sol4 r r
    sol r r
    sol r r
    do sol do\mbreak
    sol r r
    re' do re
    do r r
    mi,8 mi mi mi mi mi\mbreak
    mi4 r r
    mi r r
    mi r r
    R2.
    re'4\upl  re\upl r
    R2.
    sol,4_\upl do\upl r\mbreak
    R2.*6
    mi,4 mi8 mi mi mi
    mi2.
    R2.*6\mbreak
    re'8 re re re re re
    re4 r r
    mi8 mi mi mi mi mi
    fa4 r r
    sol,8 sol sol sol sol sol
    do4 r r\mbreak
    sol8 sol sol sol sol sol
    do4 r r
    do r r
    do r r
    do8 do do do do do\mbreak
    fa4 r r
    fa r r
    re r r
    re8 re re re re re
    sol,4 r r\mbreak
    R2.*7
    sol4 r r
    sol r r
    sol r r
    sol r r
    R2.*3
    sol4_\upl do\upl r\mbreak
    R2.*3
    do4 r r
    do r r\mbreak
    do sol sol8 sol

}

IvlIn = \relative do'' {

    fa,8 fa fa fa fa fa
    fa16 la sol fa la do sib la do mi re do
    fa8 fa, fa fa fa fa

    %4
    re'16 (do re) sib do (sib do) la sib (la sib) sol
    la8 fa fa fa fa fa\mbreak
    re'16 do re sib do sib do la sib la sib sol

    %7
    la sol fa mi fa sol la sib do re mi fa
    sol8 do,4 sol8 la sib
    la do4 fa,8 sol la

    %10
    sol do4 mi,8 fa sol\mbreak
    fa4_\upl mi_\upl re_\upl
    do8 mi sol do sol mi

    %13
    do mi sol do sol mi
    do4 r r
    R2.

    %16
    fa8\p fa fa fa fa fa
    fa16 la sol fa la do sib la do mi re do
    fa8 fa, fa fa fa fa

    %19
    re'16 do re sib do sib do la sib la sib sol
    la8 fa fa fa fa fa\mbreak
    re'16 do re sib do sib do la sib la sib sol

    %22
    la sol fa mi fa sol la sib do re mi fa
    sol8 do,4 sol8 la sib
    la do4 fa,8 sol la

    %25
    sol do4 mi,8 fa sol\mbreak
    fa4_\upl mi_\upl re_\upl
    do2 r4

    %28
    sol''16\f(la) sol(la) sol(la) sol(la) sol(la) sol(la) \mbreak
    sib8 sib, sib' sib, sib' sib,
    sol'16 (fa mi re) mi (re do sib) do (sib la sol)

    %31
    la8 fa la fa la fa
    sol'16\p  (fa mi re) mi(re do sib) do (sib la sol)
    la8 fa la fa la fa\mbreak

    %34
    r4 r16 la'\f sol la fa la sol fa
    sol8 sol, r16 sol' fa sol mi sol fa mi
    fa8 fa, r16 fa' mi fa re fa mi re

    %37
    mi8 mi, r16 mi' re mi do mi re do\mbreak
    re4 r8 re16 mi fa8[fa]
    fa mi16 (re) do (re) mi (fa) sol8 sol

    %40
    sol fa r re16 mi fa8[fa]
    fa mi16 (re) do (re) mi (fa) sol8 sol
    sol fa r re16 mi fa8 mi16 re\mbreak

    %43
    mi8 fa re2\tr
    do,8 do do do do do
    do16 mi re do mi sol fa mi sol si la sol

    %46
    do8 do, do do do do
    la''16\f sol la fa sol fa sol mi fa mi  fa re\mbreak  %% fine p. 5

    %48
    \once\stemDown mi8 do, do do do do
    sib''16 la sib sol la sol la fa sol fa sol mi
    \once\stemDown fa8 re, re re re16 mi fa sol

    %51
    la8 sol16 fa mi fa mi re dod re dod sib\mbreak
    la8 dod mi la mi dod
    la dod mi la mi dod

    %54
    la4 r r
    sib''\upl la\upl sol\upl
    fad\upl sol\upl r

    %57
    la\upl sol\upl fa!\upl
    mi\upl fa\upl r\mbreak
    mi(re) do

    %60
    si8 mi, do' mi, re' mi,
    mi' mi, re' mi, do' mi,
    si' mi, do' mi, re' mi,

    %63
    mi' mi, re' mi, do' mi,
    si'16 mi re do si la sold fad mi8 si'\mbreak
    do re si2\tr

    %66
    la2.
    re4(do) sib!
    la8 re, sib' re, do' re,

    %69
    re' re, do' re, sib' re,
    la' re, sib' re, do' re,
    re' re, do' re, sib' re,

    %72
    la'4 re, r\mbreak
    sol'8 re sol sib16 la sol fa mib re
    mib8 do mib do mib do

    %75
    fa do fa la16 sol fa mib re do
    re8 sib re sib re sib
    do sol do mi16 re do sib la sol

    %78
    la8 fa la fa la fa\mbreak
    do' sol do mi16 re do sib la sol
    la4 r8 fa la do

    %81
    fa do la fa la do
    fa4 r8 fa,16 sol la (sib) do (re)
    mib(fa) mib(fa) mib(fa) mib(fa) mib(fa) mib(fa)\mbreak

    %84
    re4 r8 sol, sib re
    fa re sib sol sib re
    sol4 r8 sol,16 la si do re mi

    %87
    fa(sol) fa(sol) fa(sol) fa(sol) fa(sol) fa(sol)
    mi4 r8 sol, do mi\mbreak
    sol mi do sol do mi

    %90
    la4 r8 la,16 si dod re mi fa
    sol(la) sol (la) sol(la) sol (la) sol(la) sol (la)
    fa sol fa sol fa sol fa sol mib fa mib fa\mbreak

    %93
    re mib re mib re mib re mib do re do re
    sib do sib do sib do sib do la sib la sib
    sol la sol la sol la sol la fa sol fa sol

    %96
    mi do' sib la sol la sol fa mi fa mi re\mbreak
    do8 mi sol do sol mi
    do mi sol do sol mi

    %99
    do4 r r
    mib' do (re)
    la_\upl sib_\upl r

    %102
    re' sib (do)
    sol\upl la\upl r\mbreak
    fa,8-.(fa-. fa-. fa-. fa-. fa-.)

    %105
    fa-.(fa-. fa-. fa-. fa-. fa-.)
    mi-.(mi-. mi-. mi-. mi-. mi-.)
    fa sol16 la sib do re mi fa8 do

    %108
    la16 fa sol la sib do re mi fa8 do\mbreak
    la8 fa sol2

}

IvlIIn = \relative do'' {

    do,4 r r
    do8 do fa fa sol sol
    la4 r r

    %4
    fa8 fa la la mi mi
    fa4 r r\mbreak
    fa8 fa la la mi mi

    %7
    fa do la fa' sol fa
    mi mi4 mi8 fa sol
    fa la4 la8 sol fa

    %10
    mi sol4 sol8 fa mi\mbreak
    re4_\upl do_\upl si_\upl
    do8 mi sol do sol mi

    %13
    do mi sol do sol mi
    do4 r r
    R2.

    %16
    do4\p r r
    do8 do fa fa sol sol\mbreak
    la4 r r

    %19
    fa8 fa la la mi mi
    fa4 r r
    fa8 fa la la mi mi

    %22
    fa do la fa' sol fa\mbreak
    mi mi4 mi8 fa sol
    fa la4 la8 sol fa

    %25
    mi sol4 sol8 fa mi
    re4_\upl do_\upl si_\upl
    do2 r4

    %28
    mi'16\f(fa) mi(fa) mi(fa) mi(fa) mi(fa) mi(fa) \mbreak
    sol8 sol, sol' sol, sol' sol,
    mi'16 (re do sib) do (sib la sol) la (sol fa mi)

    %31
    fa8 do fa do fa do
    mi'16\p (re do sib) do (sib la sol) la (sol fa mi)
    fa8 do fa do fa do\mbreak

    %34
    r8 do'\f la do re re
    re do16 si do8 do do do
    do si16 la si8 si si si

    %37
    do sol sol sol sol sol\mbreak
    si4 r8 si16 do re8 re
    re do16 (si) do (si) do (re) mi8 mi

    %40
    mi re r si16 do re8 re
    re do16 (si) do (si) do (re) mi8 mi
    mi re r si16 do re8 do16 si\mbreak

    %43
    do8 re si2
    sol,4 r r
    sol do8 do re re

    %46
    mi4 r r
    mi'8\f mi, do' do si si\mbreak
    do4 r r

    %49
    re8 re fa fa dod dod
    re re, re re re re
    mi8 sol16 fa mi fa mi re dod re dod sib\mbreak

    %52
    la8 dod mi la mi dod
    la dod mi la mi dod
    la4 r r

    %55
    re'\upl do\upl sib\upl
    la_\upl sib\upl r
    do\upl sib\upl la_\upl

    %58
    sol_\upl la_\upl r\mbreak
    do(si) la
    sold la si

    %61
    do si la
    sold la si
    do si la

    %64
    si4. sold16 la si8 sold\mbreak
    la si sold2\tr
    la2.

    %67
    sib4(la) sol
    fad sol la
    sib la sol

    %70
    fad sol la
    sib la sol
    fad fad r

    %73
    re'8 re re re re re
    do16 sol mib sol do sol mib sol do sol mib sol
    do8 do do do do do

    %76
    sib16 fa re fa sib fa re fa sib fa re fa
    sol8 sol sol sol sol sol
    fa16 do la do fa do la do fa do la do\mbreak

    %79
    sol'8 sol sol sol sol sol
    fa do do do do do
    la' do, do do do do

    %82
    do' do, do do do do
    do'16 (re) do (re) do(re) do (re) do (re) do (re)\mbreak
    sib8 fa fa fa fa fa

    %85
    re' fa, fa fa fa fa
    re' sol, sol sol sol sol
    re'16 (mi) re (mi) re (mi) re (mi) re (mi) re (mi)

    %88
    do8 sol sol sol sol sol\mbreak
    mi' sol, sol sol sol sol
    mi' la, la la la la

    %91
    mi'16(fa) mi(fa) mi(fa) mi(fa) mi(fa) mi(fa)
    re8 re re re do do\mbreak
    sib sib sib sib la la

    %94
    sol sol sol sol fa fa
    re re re re re re
    do16 do' sib la sol la sol fa mi fa mi re\mbreak

    %97
    do8 mi sol do sol mi
    do mi sol do sol mi
    do4 r r

    %100
    do' la (sib)
    fad_\upl sol_\upl r
    sib' sol (la)

    %103
    mi\upl fa\upl r\mbreak
    re,8-.(re-. re-. re-. re-. re-.)
    re-.(re-. re-. re-. re-. re-.)

    %106
    do-.(do-. do-. do-. do-. do-.)
    do4 r r
    fa r r\mbreak

    %109
    fa fa mi

}

Ivlan = \relative do' {

    la4 r r
    la8 la do do mi mi
    fa4 r r

    %4
    re8 re fa fa sib, sib
    do4 r r\mbreak
    re8 re fa fa sib, sib

    %7
    do la do la do la
    do4 sol' fa8 mi
    fa4 fa mi8 mi

    %10
    mi4 mi re8 do\mbreak
    la4_\upl sol_\upl sol_\upl
    mi8 mi' sol do sol mi

    %13
    do mi sol do sol mi
    do4 r r
    R2.

    %16
    la4\p r r
    la8 la do do mi mi\mbreak %% fine p.3
    fa4 r r

    %19
    re8 re fa fa sib, sib
    do4 r r
    re8 re fa fa sib, sib

    %22
    do la do do do si\mbreak
    do4 sol' fa8 mi
    fa4 fa mi8 re

    %25
    mi4 mi re8 do
    la4_\upl sol_\upl sol_\upl
    sol2 r4

    %28
    do'8\f do do do do do\mbreak
    mi,16 (fa) mi (fa) mi (fa) mi (fa) mi (fa) mi (fa)
    sol8 sol sol sol mi mi

    %31
    do la do la do la
    do\p sol' sol sol mi mi
    do la do la do la\mbreak

    %34
    fa'\f fa fa fa fa fa
    mi mi mi mi mi mi
    re re re re re re

    %37
    do do do do do do\mbreak
    sol' sol, sol sol sol sol
    sol sol sol sol sol sol

    %40
    sol sol sol sol sol sol
    sol sol sol sol sol sol
    sol sol sol sol sol sol\mbreak

    %43
    do fa sol4 sol,
    mi r r
    mi8 mi sol sol si si

    %46
    do4 r r
    do8\f do mi do fa fa\mbreak
    sol4 r r

    %49
    sol8 sol re re sol sol
    la re, re re re re
    dod la la la la la\mbreak

    %52
    la dod mi la  mi dod
    la dod mi la  mi dod
    dod4 r r

    %55
    R2.
    re4\upl re\upl r
    R2.

    %58
    do4\upl do\upl r\mbreak
    R2.
    mi4 r r

    %61
    R2.
    mi4 r r
    R2.

    %64
    sold,4 mi'4. mi8\mbreak
    mi fa mi4 re
    do2.

    %67
    R
    re4 r r
    R2.

    %70
    re4 r r
    R2.
    re4 re r\mbreak

    %73
    sol8 sol sol sol sol sol
    sol sol sol sol sol sol
    fa fa fa fa fa fa

    %76
    fa fa fa fa fa fa
    do do do do do do
    do do do do do do\mbreak

    %79
    do do do do do do
    do la la la la la
    do la la la la la

    %82
    fa fa fa fa fa fa
    fa fa' fa fa fa fa\mbreak
    fa re re re re re

    %85
    sib re re re re re
    sol, re' re re re re
    sol, sol' sol sol sol sol

    %88
    sol mi mi mi mi mi\mbreak
    do mi mi mi mi  mi
    la, mi' mi mi mi mi

    %91
    la, la' la la la la
    la la la la fa fa\mbreak
    fa fa fa fa fa fa

    %94
    re re do do do do
    re sol, sol sol sol sol
    sol4 r r\mbreak

    %97
    do8 mi sol do sol mi
    do mi sol do sol mi
    do4 r r

    %100
    R2.
    re4 sol, r
    R2.

    %103
    do4 fa, r\mbreak
    la8-.(la-. la-. la-. la-. la-.)
    la-.(la-. la-. la-. la-. la-.)

    %106
    sol-.(sol-. sol-. sol-. sol-. sol-.)
    la4 r r
    do r r\mbreak

    %109
    do do4. sib8

}


Ibcn = \relative do {

    fa4 r r
    fa8 fa fa fa mi mi
    re4 r r

    %4
    sib'8 sib la la sol sol
    re4 r r\mbreak
    sib'8 sib la la sol sol

    %7
    fa fa fa fa mi re
    do do do do do do
    do do do do do do

    %10
    do do do do do do\mbreak
    fa4\upl sol\upl sol,_\upl
    do8 mi sol do sol mi

    %13
    do8 mi sol do sol mi
    do4 r r
    r8 do'16 re do8[sib la sol]

    %16
    fa4 r r
    fa8 fa fa fa mi mi\mbreak
    re4 r r

    %19
    sib'8 sib la la sol sol
    fa4 r r
    sib8 sib la la sol sol

    %22
    fa fa fa fa mi re\mbreak
    do do do do do do
    do do do do do do

    %25
    do do do do do do
    fa4 sol sol,
    do2 r4

    %28
    R2.\mbreak
    do8 do do do do do
    do do do do do do

    %31
    fa fa fa fa fa fa
    do do do do do do
    fa fa fa fa fa fa\mbreak

    %34
    R2.*10
    do4 r r
    do8 do do do si si

    %46
    la4 r r
    fa'8 fa mi mi re re\mbreak
    do4 r r

    %49
    sol'8 sol fa fa mi mi
    re re re re do sib
    la la la la la la\mbreak

    %52
    la8 dod mi la mi dod
    la dod mi la mi dod
    la4 r r

    %55
    R2.
    re'4 sol, r
    R2.

    %58
    do4 fa, r\mbreak
    R2.
    mi4 r r

    %61
    R2.
    mi4 r r
    R2.

    %64
    mi4 r8 mi16 fad sold8[mi]\mbreak %% fine p. 6
    la8 re, mi4 mi,
    la2.

    %67
    R
    re4 r r
    R2.

    %70
    re4 r r
    R2.
    re8 re'16 mi re8 do sib la\mbreak

    %73
    sib8 sib sib sib sib sib
    do do do do do do
    la la la la la la

    %76
    sib sib sib sib sib sib
    mi, mi mi mi mi mi
    fa fa fa fa fa fa\mbreak

    %79
    mi mi mi mi mi mi
    fa fa fa fa fa fa
    fa fa fa fa fa fa

    %82
    la, la la la la la
    la la la la la la\mbreak
    sib sib sib sib sib sib

    %85
    sib sib sib sib sib sib
    si si si si si si
    si? si si si si si

    %88
    do do do do do do\mbreak
    do do do do do do
    dod dod dod dod dod dod

    %91
    dod? dod dod dod dod dod
    re re re re la la\mbreak
    sib sib sib sib fa'[fa]

    %94
    sol sol mi  mi fa fa
    sib, sib sib sib si si
    do do do do do do\mbreak

    %97
    do mi sol do sol mi
    do mi sol do sol mi
    do4 r r

    %100
    R2.*4
    re8-.(re-. re-. re-. re-. re-.)
    sib-.(sib-. sib-. sib-. sib-. sib-.)

    %106
    do-.(do-. do-. do-. do-. do-.)
    fa,4 r r
    fa r r\mbreak

    %109
    fa' do' do,

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \tempo 2 = 60
    s2.*109

}

IcrI = {
    \global
    <<\IcrIn \forma>>

}

IcrII = {
    \global
    <<\IcrIIn \forma>>

}


IvlI = {
    \global
    <<\IvlIn \forma>>

}

IvlII = {
    \global
    <<\IvlIIn \forma>>

}


Ivla = {
    \global
    \clef alto
    <<\Ivlan \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}



global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIcrIn = %\transpose do fa,

\relative do'' {
    \key do\major

    do4.\fermata r4. r2.
    R1.*11

}

IIcrIIn = %\transpose do fa,

\relative do'' {
    \key do\major

    mi4.\fermata r r2.
    R1.*11

}

IIvlIn = \relative do'' {

    fa,4.\fermata r8 r do' re8. mib16 re8 re4 re8
    sol sol16(fa) mi!(re) do4 sib8 la8. (sib16) do8 sib4 la8
    la4 sol8 r r sol'\mbreak la4. la8 sol16(fa) mi (re)

    %4
    sol4. sol8 fa16(mi) re (do) fa8. sol16 fa8 fa4 mi8
    mi4\tr re8 r r fa fa4\tr mi8 r r sol
    sol4\tr fa8 r r sol\mbreak mi4 fa8 re4.

    %7
    do4 sol8 do4 sol8 do2.
    sol8. la16 sol8 sol4 la8 sib4 sol'8 sol16(fa) mi(re) do(sib)
    la8. sib16 do8 do4 re8\mbreak mib4  do'8 do16(sib) la(sol) fa(mib)

    %10
    re8. mib16 do8 sib4 la8 la4 sol8 r r sol'
    sib4\tr la8 r r do, do4\tr sib8 r r do'
    la4 sib8 sol4. fa r4 r8 la4 sib8 sol4. fa\fermata r4 r8

}

IIvlIIn = \relative do'' {

    fa,4.\fermata r8 r la sib8. do16 sib8 sib4 sib8
    sib4 sib8 sol4 sol8 fa8. (sol16) la8 sol4 fa8
    fa4 mi8 r r re'\mbreak fa4 do8 re4 re8

    %4
    re8.(do16) si8 do4 do8 do8. (si16) la8 si4 do8
    do4\tr si8 r r re re4\tr do8 r r mi
    mi4\tr re8 r r si\mbreak do4 re8 si4.

    %7
    do4 sol8 do4 sol8 do2.
    mi,8. fa16 mi8 mi4 fa8 sol4 sol8 sol4 sol8
    fa8. sol16 la8 la4 sib8\mbreak do4 do8 do4 do8

    %10
    sib8. do16 la8 sol4 fa8 fa4 mi8 r r sol'
    sol4\tr fa8 r r la, la4\tr sol8 r r mi'
    fa4 sol8 mi4. fa r4 r8 fa4 sol8 mi4. fa\fermata r4 r8

}

IIvlan = \relative do' {

    la4.\fermata r8 r fa' sib,4 sib8 sib4 sib8
    do4 do8 do4 do8 re4 do8 re4 do8
    do4 do8 do4 do8\mbreak fa4 fa8 fa4 fa8

    %4
    mi4 mi8 mi4 mi8 re4 re8 re4 do8
    sol'4 sol8 sol4 sol8 sol4 sol8 sol4 sol8
    sol4 sol8 sol4 sol8\mbreak do,4 fa8 sol4 sol,8

    %7
    do4. r4 r8 do,4. r4 r8
    do'4 do8 do4 fa8 mi4 mi8 mi4 mi8
    do4 do8 fa4 sib8\mbreak la4 la8 la4 la8

    %10
    fa4 fa8 re4 re8 do4 do8 do4 do8
    do4 do8 do4 do8 do4 do8 do4 do8
    do4 re8 do4 sib8 la4. r4 r8 do4 re8 do4 sib8 la4.\fermata r4 r8

}


IIbcn = \relative do {


    fa4\fermata fa8 fa4 fa8 fa4 fa8 fa4 fa8
    mi4 mi8 mi4 mi8 fa4 fa8 sib,4 fa8
    do'4 do8 do4.\mbreak r2.

    %4
    R1.*4
    do4 do8 do4 do8 do4 do8 do4 do8
    fa4 fa8 fa4 fa8\mbreak fa4 fa8 fa4 fa8

    %10
    sib,4 sib8 sib4 sib8 do4 do8 do4.
    r2. r4 r8 r4 do8
    fa4 sib,8 do4 do,8 fa4 fa'8 fa8. mi16 re8  fa4 sib,8 do4 do,8 fa4.\fermata r4 r8

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 12/8
    \tempo 4 = 60
    \bar ".|:"
    s1.*7
    \bar":..:"
    \repeat volta 2 {s1.*4}
    \alternative {{s1.}{s}}
    \bar "|."

}

IIcrI = {
    \global
    <<\IIcrIn \forma>>

}

IIcrII = {
    \global
    <<\IIcrIIn \forma>>

}


IIvlI = {
    \global
    <<\IIvlIn \forma>>

}

IIvlII = {
    \global
    <<\IIvlIIn \forma>>

}


IIvla = {
    \global
    \clef alto
    <<\IIvlan \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}



global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIcrIn = %\transpose do fa,

\relative do'' {
    \key do\major

    sol'4 r8
    la sol4\tr
    la8 sol4

    %4
    la8 sol4
    fa8 sol16 mi fa re
    mi8 re8.\tr mi32 fa

    %7
    mi8 re8.\tr mi32 fa
    mi8 re4\mbreak
    R4.

    %10
    la'8 la16 la la la
    R4.
    sol8 sol16 sol sol sol

    %13
    R4.\mbreak
    fa8 fa16 fa fa fa
    mi sol do4

    %16
    re,16 mi fa8 fa
    mi16 sol do4
    re,16 mi fa8 fa

    %19
    mi4 r8\mbreak
    R4.*5
    re8 sol4\mbreak

    %26
    R4.
    re8 sol4
    R4.

    %29
    re8 sol4
    re8 re16 re re re
    re8 re re

    %32
    R4.*4
    mi4 r8
    re4 r8

    %38
    la' fad4\tr
    sol4.
    R4.*4

    %44
    mi4 r8
    re4 r8
    la' fad4\tr

    %47
    sol4. sol
    R4.*2
    sol,8 sol sol

    %51
    do  do,4
    R4.*10\mbreak
    r8 r mi

    %63
    mi mi mi
    mi4.
    R4.*6

    %71
    sol'8 fa mi
    mi re r
    R4.*2

    %75
    mi4 r8
    mi4 r8
    mi mi mi

    %78
    fa4 r8\mbreak
    fad4 r8
    fad4 r8

    %81
    fad fad fad
    sol4.
    R4.*4

    %87
    la8 sol16 fa mi re
    do4 re8
    mi16 re re4\tr

    %90
    do4.
    R4.*4
    la'8 sol16 fa mi re\mbreak

    %96
    do4 re8
    mi16 re re4\tr
    do4.

}

IIIcrIIn = %\transpose do fa,

\relative do'' {
    \key do\major

    mi4 r8
    fa mi4\tr
    fa8 mi4

    %4
    fa8 mi4
    re8 mi re
    do sol sol

    %7
    do sol sol
    do sol4
    R4.\mbreak

    %10
    fa'8 fa16 fa fa fa
    R4.
    mi8 mi16 mi mi mi

    %13
    R4.
    re8 re16 re re re
    do8 mi mi

    %16
    sol, re' re
    do mi mi
    sol, re' re

    %19
    do4 r8\mbreak
    R4.*5
    sol8 re'4

    %26
    R4.
    sol,8 re'4
    R4.

    %29
    sol,8 re'4
    re8 re16 re re re
    re8 re re

    %32
    R4.*4
    do4 r8
    sol4 r8

    %38
    mi' re4\tr \mbreak
    sol,4.
    R4.*4

    %44
    do4 r8
    sol4 r8
    mi' re4\tr

    %47
    sol,4. sol
    R4.*2
    sol8 sol sol

    %51
    do do,4
    R4.*10
    r8 r mi\mbreak

    %63
    mi mi mi
    mi4.
    R4.*6

    %71
    mi'8 re do
    do sol r
    R4.*2

    %75
    do4 r8
    do4 r8
    do do do

    %78
    do4 r8
    re4 r8
    re4 r8\mbreak

    %81
    re re re
    sol,4.
    R4.*4

    %87
    fa'4 sol,8
    mi4 sol8
    do sol sol

    %90
    mi4.
    R4.*4
    fa'4 sol,8

    %96
    mi4 sol8
    do sol sol
    mi4.

}

IIIvlIn = \relative do'' {

    do8 sib16(la) sol(fa)
    re'8 do8. \tr sib32(la)
    re8 do8.\tr sib32(la)

    %4
    re8 do4
    sib8 do16(la) sib(sol)
    la8 sol8.\tr la32(sib)

    %7
    la8 sol8.\tr la32(sib)
    la8 sol4\mbreak
    \senza \tuplet 3/2 { re'16(do sib) re[(do sib)] re(do sib) }

    %10
    sib'8 re,4
    \tuplet 3/2 { do16(sib la) do[(sib la)] do(sib la) }
    la'8 do,4

    %13
    \tuplet 3/2 { sib16(la sol) sib[(la sol)] sib(la sol) }\mbreak
    sol'8 sib,4
    la16 (do) fa4

    %16
    sol,16 (la) sib8 sib
    la16 (do) fa4
    sol,16 (la) sib8 sib

    %19
    la16(fa) mi(fa) mi(fa)\mbreak
    la (do) re (si) do (la)
    si(sol) fa(sol) fa(sol)

    %22
    si(re) mi(do) re(si)
    do(si do) fa mi fa
    re(do re) sol fa sol

    %25
    mi (sol) do4\mbreak
    re,16 (mi) fa8 fa
    mi16 (sol) do4

    %28
    re,,16 (mi) fa8 fa
    mi16 sol do4
    do16 si la sol fa mi

    %31
    re8 sol,4
    re''8\p (mi) re
    fa mi4\mbreak

    %34
    re,8 (mi) re
    fa mi4
    la'16\f(sol la) fa mi re

    %37
    sol(fa sol) mi re do
    re la si4\tr
    do4.

    %40
    re8\p (mi) re
    fa mi4\mbreak
    re,8 (mi) re

    %43
    fa mi4
    la'16\f(sol la) fa mi re
    sol(fa sol) mi re do

    %46
    re la si4\tr
    do4. do
    sol8 (la) sib!\mbreak

    %49
    sib(la) sol
    sol'16(fa) mi(re) do(sib)
    sib8 la4

    %52
    la8(si) do
    do(si) la
    la'16(sol) fad(mi) re(do)

    %55
    do8 si4
    si8(do) re
    re(do) si\mbreak

    %58
    si'16 la sold fa mi re
    do(si do) la fa'8
    si,16(la si) sol mi'8

    %61
    la,16(sold) la(si) do(re)
    mi,4 la8
    si sold4\tr

    %64
    la4.
    mib'8(re) do\mbreak
    re(la) sib?

    %67
    mib,_\upl do_\upl re_\upl
    sol,4 r8
    reb''(do) sib

    %70
    do (sol) la
    do (sib) la
    la sol r

    %73
    do'\p (sib) la
    la sol r
    \tuplet 3/2 { la16\f (sib do)} mib,4

    %76
    \tuplet 3/2 { la16 (sib do)} mib,4\mbreak
    \tuplet 3/2 { la16 (sib do)} mib,4
    re16 sib fa re sib8

    %79
    \tuplet 3/2 { si''16 (do re) } fa,4
    \tuplet 3/2 { si16 (do re) } fa,4
    \tuplet 3/2 { si16 (do re) } fa,4

    %82
    mi16 do sol mi do8
    sol''8\p (la) sol
    sib la4\mbreak

    %85
    sol,8 (la) sol
    sib la4
    re8\f do16 sib la sol

    %88
    fa'8 mi16 re do sib
    la fa sol4\tr
    fa4.

    %91
    sol'8\p(la) sol
    sib la4
    sol,8 (la) sol\mbreak

    %94
    sib la4
    re8\f do16 sib la sol
    fa'8 mi16 re do sib

    %97
    la fa sol4\tr
    fa4.

}

IIIvlIIn = \relative do'' {

    do8 sib16(la) sol(fa)
    re'8 do8. \tr sib32(la)
    re8 do8.\tr sib32(la)

    %4
    re8 do4
    sib8 do16(la) sib(sol)
    la8 sol8.\tr la32(sib)

    %7
    la8 sol8.\tr la32(sib)
    la8 sol4\mbreak
    R4.

    %10
    \senza\tuplet 3/2 { re'16(do sib) re[(do sib)] re(do sib) }
    do8 mi, fa
    \tuplet 3/2 { do'16(sib la) do[(sib la)] do(sib la) }

    %13
    sib8 re, mi\mbreak
    \tuplet 3/2 { sib'16(la sol) sib[(la sol)] sib(la sol) }
    fa16(sol) la8 la

    %16
    mi16(fa) sol8 sol
    fa16(sol) la8 la
    mi16(fa) sol8 sol

    %19
    fa4 r8\mbreak
    fa8 r r
    sol r r

    %22
    sol r r
    la4 r8
    sol4 r8

    %25
    do16 (re) mi8 mi\mbreak
    si16 (do) re8 re
    do16 (re) mi8 mi

    %28
    si,16 (do) re8 re
    do16 (re) mi8 mi
    do'16 si la sol fa mi

    %31
    re8 sol,4
    si'8\p(do) si
    re do4

    %34
    si,8 (do) si
    re do4
    do'8\f fa r

    %37
    sol, do r
    fa, re sol
    mi4.

    %40
    si'8\p(do) si
    re do4
    si,8 (do) si

    %43
    re do4
    do'8\f fa r

    %37
    sol, do r
    fa, re sol
    mi4. mi
    mi8(fa) sol\mbreak

    %49
    sol(fa) mi
    mi'16(re) do(sib) la(sol)
    fa mi fa4

    %52
    fad8(sol) la
    la(sol) fad
    fad'16(mi) re(do) si(la)

    %55
    sol fad sol4
    sold8(la) si
    si(la) sold\mbreak

    %58
    sold'16 fa? mi re do si
    la4 la8
    sol4 sol8

    %61
    fa4 fa8
    si, mi16 re do8
    re si mi

    %64
    do4.
    do'8(sib?) la\mbreak
    sib(fad) sol

    %67
    mib_\upl do_\upl re_\upl
    sol,4 r8
    sib'(la) sol

    %70
    la (mi) fa
    la (sol) fa
    fa mi r

    %73
    la'\p (sol) fa
    fa mi r
    do\f do do

    %76
    do do do\mbreak
    do do do
    re16 sib fa re sib8

    %79
    re' re re
    re re re
    re re re

    %82
    mi16 do sol mi do8
    mi' \p(fa) mi
    sol fa4\mbreak

    %85
    mi,8 (fa) mi
    sol fa4
    sib8\f la16 sol fa mi

    %88
    fa4 sol8
    fa4 mi8
    fa4.

    %91
    sib'8\p sib sib
    sib sib sib
    sib, sib sib\mbreak

    %94
    sol fa4
    sib8\f la16 sol fa mi
    fa4 sol8

    %97
    fa mi4\tr
    fa4.

}

IIIvlan = \relative do' {

    fa4.
    fa8 fa fa
    fa fa fa

    %4
    fa fa la
    sol la sol
    do, do do

    %7
    do do do
    do do do\mbreak
    sib16 re sib re sib re

    %10
    fa8 sol4
    la,16 do la do la do
    mi8 fa4

    %13
    sol,16 sib sol sib sol sib\mbreak
    mi8 mi mi
    do do do

    %16
    do do do
    do do do
    do do do

    %19
    do4 r8\mbreak
    re4 r8
    re4 r8

    %22
    mi4 r8
    do fa r
    re sol r

    %25
    sol sol sol\mbreak
    sol sol sol
    sol, sol sol

    %28
    sol sol sol
    sol sol sol
    sol la do

    %31
    si si si
    sol'\p sol sol
    sol sol sol\mbreak  %% ripeti da qua

    %34
    sol, sol sol
    sol sol do,
    r do'\f fa

    %37
    r sol, mi'
    sol, sol8. sol16
    sol4.

    %40
    sol'8\p sol sol
    sol sol sol
    sol, sol sol

    %43
    sol sol do,
    r do'\f fa
    r sol, mi'

    %46
    sol, sol8. sol16
    sol4. sol
    do16 do do do do do\mbreak

    %49
    do do do do do do
    do do do do do do
    do do do do do do

    %52
    re re re re re re
    re re re re re re
    re re re re re re

    %55
    re re re re re re
    mi mi mi mi mi mi
    mi mi mi mi mi mi\mbreak

    %58
    mi mi mi mi mi mi
    mi4 do8
    re4 do8

    %61
    do4 re8
    sold,4 la8
    mi' mi8. mi16

    %64
    mi4.
    R4.*2
    mib8(do) re\noBeam \upl

    %68
    sol,4 r8
    R4.*2
    fa'8 re re

    %72
    do do r
    r sib'\p fa
    do' do, r

    %75
    la'\f la la
    la la la\mbreak
    la la la

    %78
    fa fa fa
    sol si si
    si? si si

    %81
    si si si
    sol sol sol
    do\p do do

    %84
    do do do\mbreak
    do, do do
    do do do

    %87
    fa,\f re' do
    la4 do8
    re do8. do16

    %90
    la4.
    do'8\p do do
    do do do

    %93
    do, do do\mbreak
    do do fa,
    fa\f re' do

    %96
    do4.
    do8 do do
    la4.

}


IIIbcn = \relative do {

    fa8 sol la
    sib la fa
    sib la fa

    %4
    sib la fa
    sol fa mi
    fa mi do

    %7
    fa mi do
    fa mi do\mbreak
    R4.

    %10
    sol'16 sib sol sib sol sib
    R4.
    fa16 la fa la fa la

    %13
    R4.
    do,16 mi do mi do mi
    fa8 fa fa

    %16
    do do do\mbreak
    fa fa fa
    do do do

    %19
    fa4 r8
    re4 r8
    sol4 r8

    %22
    mi4 r8
    fa4 r8
    si4 r8

    %25
    do do do
    sol sol sol\mbreak
    do, do do

    %28
    sol sol sol
    do do do
    mi fa do

    %31
    sol' sol sol
    R4.*4
    fa4 r8

    %37
    mi4 r8
    fa sol sol,\mbreak
    do4 r8

    %40
    R4.*4
    fa4 r8
    mi4 r8

    %46
    fa sol sol,
    do do'16 sib la sol do,4 r8
    R4.*2

    %50
    do8 do do\mbreak
    fa fa fa
    R4.*2

    %54
    re8 re re
    sol sol sol
    R4.*2

    %58
    mi8 mi mi
    la4 fa8
    sol4 do,8\mbreak

    %61
    fa4 re8
    mi4 fa8
    re mi mi,

    %64
    la4.
    R4.*2
    mib'8 do re

    %68
    sol,4 r8
    R4.*2
    la'8 sib fa\mbreak

    %72
    do' do, r
    R4.*2
    fa16 la fa la fa la

    %76
    fa la fa la fa la
    fa la fa la fa la
    sib8 sib, sib\mbreak

    %79
    sol'16 si sol si sol si
    sol si sol si sol si
    sol si sol si sol si

    %82
    do8 do, do
    R4.*4
    sib4 do8

    %88
    re4 mi8\mbreak
    fa do' do,
    fa4.

    %91
    R4.*4
    sib,4 do8
    la4.

    %97
    fa'8 do' do,
    fa,4.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/8
    \tempo 4. = 80
    \repeat volta 2 {s4.*46}
    \alternative {{s4.}{s}}\break
    \set Score.currentBarNumber = #48
    \bar ".|:"
    s4.*51
    \bar ":|."

}

IIIcrI = {
    \global
    <<\IIIcrIn \forma>>

}

IIIcrII = {
    \global
    <<\IIIcrIIn \forma>>

}

IIIvlI = {
    \global
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \global
    <<\IIIvlIIn \forma>>

}


IIIvla = {
    \global
    \clef alto
    <<\IIIvlan \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Sinfonia in Fa maggiore}
    composer = \markup \center-column{"G. A. Brescianello (1690c -1758)"}

}

\markup\huge "[1.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #3
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"french horn"
                \set Staff.instrumentName = \markup\center-column  {"Corno 1."}
                \set Staff.shortInstrumentName = "cr1"
                \IcrI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"french horn"
                \set Staff.instrumentName = \markup\center-column  {"Corno 2."}
                \set Staff.shortInstrumentName = "cr2"
                \IcrII
            >>
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #3
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \key fa\major
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \key fa\major
                \IvlII
            >>
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \key fa\major
            \Ivla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.shortInstrumentName = "bc"
            \key fa\major
            \Ibc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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

\markup\huge "[2.] Adagio"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #3
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"french horn"
                %\set Staff.instrumentName = \markup\center-column  {"Corno 1."}
                \set Staff.shortInstrumentName = "cr1"
                \IIcrI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"french horn"
                %\set Staff.instrumentName = \markup\center-column  {"Corno 2."}
                \set Staff.shortInstrumentName = "cr2"
                \IIcrII
            >>
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #3
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                %\set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \key fa\major
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                %\set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \key fa\major
                \IIvlII
            >>
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            %\set Staff.instrumentName = \markup  {"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \key fa\major
            \IIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            %\set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.shortInstrumentName = "bc"
            \key fa\major
            \IIbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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

\markup\huge "[3.] Presto"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #3
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"french horn"
                \set Staff.instrumentName = \markup\center-column  {"Corno 1."}
                \set Staff.shortInstrumentName = "cr1"
                \IIIcrI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"french horn"
                \set Staff.instrumentName = \markup\center-column  {"Corno 2."}
                \set Staff.shortInstrumentName = "cr2"
                \IIIcrII
            >>
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #3
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \key fa\major
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \key fa\major
                \IIIvlII
            >>
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \key fa\major
            \IIIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.shortInstrumentName = "bc"
            \key fa\major
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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