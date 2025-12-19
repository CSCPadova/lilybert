\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

dolce = _\markup \italic { dolce }

rinf = _\markup \italic { rinf }

tu = ^\markup \italic "tutti"

pf = _\markup { \italic poco \dynamic f}

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

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

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con
}

Ifln =\relative do'' {

    sol8\solo_\markup\italic "Con espressione"
    do32(re do si do16 re) mi(do mi fa mi4 re8) sol,
    re'32(mi re do re16 mi fa re fa sol fa4 mi8) sol16(mi)
    re(do) do do do8\tr mi16(do) \slashedGrace  si8 la la4 do'16(la)

    %4
    la(sol) sol(fa) fa(mi) mi(re) mi8.\tr fa16 sol8 \slashedGrace la8 sol16 \slashedGrace fa8 mi16
    \slashedGrace re8 do do~do32 re mi re \slashedGrace fa8 mi16 [re32 do] \slashedGrace si8 la la4 do'16 (la)
    \slashedGrace si8 la16 sol \slashedGrace la8 sol16 fa \slashedGrace sol8 fa16 mi \slashedGrace fa8 mi16 re \grace {re32[mi fa]} mi8.[re16 do8 sol]\mbreak

    %7
    do32(re do si do16 re) mi(do mi fad) la(sol) sol8~sol16 sol(fad mi)
    re32(do si do re mi fad sol fad sol la si do16)[do,] do8\tr si r  \tuplet 3/2 {
        re16(si) sol'\upl
        mi(do) sol'\upl re[(si) sol'\upl]  mi(do) sol'\upl re[(si) sol'\upl]
    } \slashedGrace fad8 mi re do4

    %10
    si16(re) re sol \slashedGrace la8 sol16[fad32 mi] \slashedGrace mi8 re16 do32 si si8\tr la r \tuplet 3/2 {
        re16(si) sol'\upl
        mi(do) sol'\upl re[(si) sol'\upl]  mi(do) sol'\upl re[(si) sol'\upl]
    } \slashedGrace fad8 mi re do4
    si32(re do si do re mi fad sol la si do re16) si,  \slashedGrace do8 si4\tr la\mbreak

    %13
    la'2\f~la8 r r4
    la2~la8 r r4
    re,2\p~re8 r r4

    %16
    re2~re8 r r4
    R1*3
    r8 si'4\f dod8 re re4 dod8

    %21
    re re4 dod8 re[r16 la] la16. fad32 fad16. re32
    re4 r r sol16\dolce(fad mi re)
    re2. sol16(fad mi re)

    %24
    re2. sol16(fad mi re)
    sol(fad? mi re) sol(fad mi re)\pf si'(la sol fad mi re do si)\mbreak
    la la'\tr do la \slashedGrace la8 sol fad \slashedGrace la8 sol4 sol16\dolce(fad mi re)

    %27
    re2. sol16(fad? mi re)
    re2. sol16(fad mi re)
    sol(fad mi re) sol(fad mi re)\pf si'(la sol fad mi re do si)\mbreak

    %30
    la la'\tr do la \slashedGrace la8 sol fad \slashedGrace la8 sol si,32[(sol si re] do la do mi re\rinf[si re fa)]
    mi(do mi sol fad[re fad la] sol mi sol si la[fad la do] ) si8 r r4
    r2\mbreak  r8 si,32[(sol si re] do la do mi re\rinf[si re fa)]

    %33
    mi(do mi sol fad[re fad la] sol mi sol si la[fad la do)] si8 r r4
    r2 r8 r16 re\f re8[r16  si]
    si8[r16 sol] sol16. re32 re16. si32 sol8 [sol' sol] re8\solo

    %36
    sol32(la sol fad) sol16 la si(sol si do) si4 la8 re,
    la'32(si la sold) la16 si do(la do re)\mbreak do4 si8\tr re16(si)
    la(sol) sol sol sol8\tr si16 sol \slashedGrace fad8 mi mi16 mi sol(mi sol mi)

    %39
    mi(re) re(do) do(si) si(la) si8.\tr do16 re8 re'16(si)
    \slashedGrace la8 sol sol~sol32(la si la \slashedGrace do8 si16[la32 sol)] \slashedGrace fad8 mi mi16 mi sol(mi sol mi)
    mi(re) re(do) do(si) si(la) \grace {la32[si do]} si8.\tr la16 sol8 r

    %42
    R1*12
    sol'1\dolce\mbreak
    si2(do)

    %56
    sol1
    si2 do4~do8 \tuplet 3/2 {
        sol16\solo[(mi) do'\upl]
        la(fa) do'\upl sol[(mi) do'\upl] la(fa) do'\upl sol[(mi) do'\upl]
    } \slashedGrace si8 la(sol fa4)\mbreak

    %59
    mi16(sol) sol(do) \slashedGrace re8 do16[si32 la] \slashedGrace la8 sol16 fa32 mi mi8\tr re r \tuplet 3/2 {
        sol16[(mi) do'\upl]
        la(fa) do'\upl sol[(mi) do'\upl] la(fa) do'\upl sol[(mi) do'\upl]
    } \slashedGrace si8 la(sol fa4)
    mi32(sol fa mi fa sol la si do re mi fa sol16)[mi,] mi4\tr re

    %62
    sol2\f~sol8 r r4
    sol2~sol8 r r4\mbreak
    sol,2\dolce~sol8 r r4

    %65
    sol2~sol8 r r4
    R1*3
    r8 mi'4 fad8\tr sol sol4 fad8\tr

    %70
    sol sol4 fad8\tr sol[r16 re] re16. si32 si16. sol32
    sol4 r r do'16\solo\dolce (si la sol)
    sol2. do16 (si la sol)

    %73
    sol2. do16 (si la sol)
    do (si la sol) do (si la sol\pf) mi'(re do si la sol fa mi)\mbreak
    re re\tr fa re \slashedGrace re8 do si \slashedGrace re8 do4 do'16\dolce (si la sol)

    %76
    sol2. do16 (si la sol)
    sol2. do16 (si la sol)
    do (si la sol) do (si la sol)\pf mi'(re do si la sol fa mi)

    %79
    re re\tr fa re \slashedGrace re8 do\upl si \upl  do8\noBeam sol32(mi sol sib) la\rinf[(fa la do)] si(sol si re)
    do(la do mi) re[(si re fa)] mi(do mi sol) fa[(re fa la)]\mbreak sol8 r r4
    r2 r8 sol,32(mi sol sib) la\rinf[(fa la do)] si(sol si re)

    %82
    do(la do mi) re[(si re fa)] mi(do mi sol) fa[(re fa la)] sol8 r r4
    r2 r8 r16 sol\f sol8[r16 mi]\mbreak
    mi8[r16 do'] do16. sol32 sol16. mi32 do8[mi mi]

}

IvlIn =\relative do'' {

    r8
    r mi,\p sol sol r sol sol sol
    r sol sol sol r sol sol sol
    r sol sol do r do do la'16(fa)

    %4
    fa(mi) mi(re) re(do) do(si) do8.\tr re16 mi8 r
    r sol, sol do r do do la'16(fa)
    \slashedGrace sol8 fa16 mi \slashedGrace fa8 mi16 re \slashedGrace mi8 re16 do \slashedGrace re8 do16 si do8 sol16(fa) mi8 r

    %7
    r mi sol sol r re re sol~
    sol sol r fad sol re16.(mi32) re8 si'
    do(si do si) \slashedGrace re do si la4

    %10
    sol8 si4 \slashedGrace do8 si16 la32 sol sol8(fad) sol[si]
    do(si do si) do si la4
    sol8 r r sol sol4\tr fad8 r\mbreak

    %13
    <fad' la,re,>\f r <<<mi dod>\\la,>> r re16\p\upl dod\upl re\upl mi\upl re\upl mi\upl fad\upl sol\upl
    <fad la,re,>8\f r <<<mi dod>\\la,>> r <re re,> r r4
    re16\upl\p re8 si32 sol do!16_\upl do8 la32 fad sol16_\upl la_\upl si_\upl do_\upl si\upl do\upl re\upl mi\upl

    %16
    re16\upl re8 si32 sol do!16_\upl do8 la32 fad sol16 la32(si do re mi fad) sol16\mf sol\tr si sol
    mi8 r r16 do\tr mi do la8 r r16 la'\tr do la
    fad8 r r16 re\tr fad re si8 r r16 si'\tr re si\mbreak

    %19
    sol8 r r16 mi\tr sol mi do8 r r16 la(re do)
    si\f(re) re(sol) sol32\tr(fad sol la) sol16 sol, fad(fad' ) fad(sol) sol32\tr(fad sol la) sol16 sol,
    fad(fad' ) fad(sol) sol32\tr(fad sol la) sol16 sol, fad16. re'32 re16. la32  la16. fad32 fad16. re32

    %22
    <<re4\upl\p\\re>> re8_\upl re_\upl re r sol16 (fad mi re)
    re2. sol16(fad mi re)
    re2. sol16(fad mi re)

    %25
    sol(fad? mi re) sol(fad mi re)\pf si'(la sol fad mi re do si)\mbreak
    la la'(do la) sol8 fad \slashedGrace la sol4 sol16\p(fad mi re)
    re2.  sol16(fad mi re)

    %28
    re2.  sol16(fad mi re)
    sol(fad mi re) sol(fad mi re)\pf si'(la sol fad mi re do si)\mbreak
    la la'(do la) sol8 fad \slashedGrace la sol r r4

    %31
    r2 si32\p do re si do[re mi do] si do re si do[re mi do]
    si do re si la[si do la] sol la si sol fad[sol la fad]\mbreak  sol8 r r4
    r2 si32 do re si do[re mi do] si do re si do[re mi do]

    %34
    si do re si la[si do la] sol la si sol fad[sol la fad]<sol sol,>8 \f[r16 re'] re8[r16 si]
    si8[r16 si] si16. re,32 re16. si32 sol8 <sol'' si, re, sol,>[<sol si, re, sol,>] r
    r si,,\p re re r re re re

    %37
    r re re re\mbreak r re re re
    r re re sol r sol mi'16(do mi do)
    do(si) si(la) la(sol) sol(fad) sol8._\tr la16 si8 r

    %40
    r re, re sol r sol mi'16(do mi do)
    do(si) si(la) la(sol) sol(fad) sol8 re16(do) si8 re
    sol\dolce \slashedGrace la sol32 fad sol la sol16_\upl sol(si la) do(si) \slashedGrace do8 si32\<[la si do] si16\upl si(re do)\mbreak

    %43
    mi(re) \slashedGrace mi8 re32[(do re mi)] re16 re(fa mi) sol\f fa8 fa fa fa16
    fa4 mi8\p(re do re si do)
    si4. re8 \slashedGrace mi re(do16) do\upl\rinf si do(re mi)

    %46
    fa4\f mi8\p(re do re si do)
    \tuplet 3/2 { si16 re mi\slashedGrace sol8 fa16 [mi re] } do8 si\tr la16 do\f(mib re do sib la sol!)
    fad8 \slashedGrace sol fad32\p[(mi fad sol)] fad16_\upl fad(la sol) sib(la) \slashedGrace sib8 la32[(sol la sib)] la16_\upl  la(do sib)\mbreak

    %49
    re\< do \slashedGrace re8 do32[(sib do re)] do16 do (mib re) fa mib8 mib mib mib16
    mib4 \f\! re8\p (do sib do la sib)
    la4. do8 \slashedGrace re do sib16 sib la(sib do re)

    %52
    mib4\f re8\p(do sib do la sib)
    \tuplet 3/2 { la16 do re \slashedGrace fa8 mib16[re do] } sib8 la sol16\pp(sol, sol' sol, sol' sol, sol' sol,)
    fa'!(sol, fa' sol, fa' sol, fa' sol,) mi'(sol, mi' sol, mi' sol, mi' sol,)\mbreak

    %55
    si(sol si sol si sol si sol) do(sol do sol do sol do sol)
    fa'(sol, fa' sol, fa' sol, fa' sol,) mi'(sol, mi' sol, mi' sol, mi' sol,)
    si(sol si sol si sol si sol) do(sol do re) mi8 mi

    %58
    fa mi fa mi \slashedGrace sol fa(mi) re4\mbreak
    do8 mi'4 \slashedGrace fa8 mi16 re32 do do8 si\tr do mi,
    fa mi fa mi fa(mi) re4

    %61
    do8 r r do' do4\tr si8 r
    <mi sol, sol,>4\f <re sol, sol,> do16\upl\p si\upl do\upl re\upl do\upl re\upl mi\upl fa\upl
    <mi sol, sol,>4\f <re sol, sol,> <do mi,>8 r r4\mbreak

    %64
    sol16\p sol8 mi32(do) fa16 fa8 re32(si) do16_\upl re_\upl mi_\upl fa_\upl mi_\upl fa_\upl sol_\upl la_\upl
    sol16 sol8 mi32 do fa16 fa8 re32 si do16 re32(mi fa sol la si) do16\mf do\tr mi\upl do\upl
    la8 r r16 fa_\tr la_\upl fa_\upl re8 r r16 re'\tr fa\upl re\upl

    %67
    si8 r r16 sol_\tr si_\upl sol_\upl mi8 r r16 mi'\tr sol\upl mi\upl
    do8 r r16 la_\tr do_\upl la_\upl fa8 r r16 re'\rinf(sol fa)\mbreak
    mi(sol) sol(do) do32\f\tr[si do re] do16 do,(si) si'\upl si(do) do32\tr[si do re] do16 do,(

    %70
    si) si'\upl si(do) do32\tr[si do re] do16 do,(si16.) sol'32 sol16. re32 re16. si32 si16. sol32
    <sol sol,>4 sol8\p_\upl sol_\upl sol_\upl r do16(si la sol)
    sol2.  do16(si la sol)

    %73
    sol2.  do16(si la sol)
    do16(si la sol)  do16(si la sol)\pf mi'(re do si la sol fa mi)\mbreak
    re re' (fa re) \slashedGrace re8 do si \slashedGrace re8 do4 do16\p (si la sol)

    %76
    sol2. do16 (si la sol)
    sol2. do16 (si la sol)
    do (si la sol) do (si la sol)\pf mi'(re do si la sol fa mi)

    %79
    re re'(fa re) do8 si \tr do8 r r4
    r2\mbreak mi32\p fa sol mi fa[sol la fa] mi fa sol mi fa[sol la fa]
    mi fa sol mi re[mi fa re] do re mi do si[do re si] do8 r r4

    %82
    r2 mi32\p fa sol mi fa[sol la fa] mi fa sol mi fa[sol la fa]
    mi fa sol mi re[mi fa re] do re mi do si[do re si] do8\f[r16 sol'] sol8[r16 mi]\mbreak
    <<mi8\\{mi[r16 do]}>> do16. sol32 sol16. mi32 <<{do8[ <mi' do sol> <mi do sol>]}\\{s8 sol,[sol]}>>

}


IvlIIn =\relative do'' {

    r8
    r do,\p do do r si si si
    r si si si r do do do
    r mi mi mi r fa fa fa

    %4
    sol sol, sol sol r do do do
    r mi  mi mi r fa fa fa
    sol sol, sol sol do do do do\mbreak

    %7
    r do do do r si si si
    la la re re sol, si16.(do32) si8 sol'
    sol,4 sol sol8 sol'4 <<fad8\\re>>

    %10
    sol sol, sol sol re' re16. do32 si8 sol'
    sol,4 sol sol8 sol'4 <<fad8\\re>>
    sol sol,  r sol re' re re16(fad) la fad\mbreak

    %13
    la'16\upl\f la8 fad32 re sol16\upl  sol8 mi32 dod re16\p\upl mi\upl fad\upl sol\upl fad\upl sol\upl la\upl si\upl
    la16\upl\f la8 fad32 re sol16\upl sol8 mi32 dod re16 mi32 fad sol la si dod re8 r
    <<{si,4 la}\\re,2>> sol16_\upl fad_\upl sol_\upl la_\upl sol_\upl la_\upl si_\upl do_\upl

    %16
    <<{si4 la}\\re,2>> sol8 r r4
    r16 mi'\mf\tr sol mi do8 r r16 la_\tr do la fad8 r
    r16 fad'\tr la fad re8 r r16 si\tr re si sol8 r\mbreak

    %19
    r16 sol'\tr si sol mi r r8 r16 do\tr mi do la8 la
    si\f si4 dod8\tr re re4 dod8\tr
    re re4 dod8\tr re16. re32 re16. la32 la16. fad32 fad16. re32

    %22
    <<re4\upl\p\\re>> re8_\upl re_\upl re r  r4
    r8 re(do si la sol) r4
    r8 re'(do si la sol)  mi'16 (re do si)

    %25
    mi(re do si) mi(re do si)\pf sol'(fad mi re do si la sol)\mbreak
    sol8 mi'16(do) si8 la \slashedGrace do8 si4 r
    r8 re\p(do si la sol) r4

    %28
    r8 re' (do si la sol) mi'16 (re do si)
    mi(re do si) mi(re do si)\pf sol'(fad mi re do si la sol)\mbreak
    sol8 mi'16(do) si8 la si\dolce sol la si

    %31
    do re mi fad sol32\p la si sol la[si do la] sol la si sol la[si do la]
    sol la si sol mi16 [do] si32 do re si la[si do la]\mbreak si8 sol la si
    do re mi fad sol32 la si sol la[si do la] sol la si sol la[si do la]

    %34
    sol la si sol mi16 [do] si32 do re si la[si do la] si8\f[r16 re'] re8[r16 si]
    si8[r16 si] si16. re,32 re16. si32 sol8 <sol'' si, re, sol,>[<sol si, re, sol,>] r
    R1*6

    %42
    r4 r8 re,\dolce sol \slashedGrace la8 sol32 fad sol la sol16_\upl sol(si la)\mbreak
    do\<(si) si32\tr[la si do] si16 si(re do) mi\!\f re8 re re re16
    re4 do8\p(si la si sold la)

    %45
    la4 sold8 si~si la16 la\rinf sold(la si do)
    re4\f do8\p(si la si sold la)
    la16 la la la la la sold sold la16 do\f (mib re do sib la sol!)

    %48
    fad8 r r4 re8\dolce fad32_\tr mi fad sol  fad16 fad(la sol)\mbreak
    sib(la) la32_\tr[sol(la sib)] la16_\upl la\rinf(do sib) la(sol fad sol) la la sib sib
    do4\f sib8\p(la sol la fad sol)

    %51
    sol4 fad8 la~la sol16 sol fad\rinf sol la si
    do4\f sib8\p (la sol la fad sol)
    sol16 sol sol sol sol sol fad fad sol16\pp(sol, sol' sol, sol' sol, sol' sol,)

    %54
    fa'!(sol, fa' sol, fa' sol, fa' sol,) mi'(sol, mi' sol, mi' sol, mi' sol,)\mbreak
    si(sol si sol si sol si sol) do(sol do sol do sol do sol)
    fa'(sol, fa' sol, fa' sol, fa' sol,) mi'(sol, mi' sol, mi' sol, mi' sol,)

    %57
    si(sol si sol si sol si sol) do(sol do re) mi8 r
    R1*4
    sol'16\f sol8 mi32 do fa16 fa8 re32 si do16\p\upl re\upl mi\upl fa\upl mi\upl fa\upl sol\upl la\upl\mbreak

    %63
    sol16\f sol8 mi32 do fa16 fa8 re32 si do16 re32(mi fa sol la si) do8 r\mbreak
    <<{mi,,4 re}\\{sol,2}>> do16 si_\upl do_\upl re_\upl do_\upl re_\upl mi_\upl fa_\upl
    <<{mi4 re}\\{sol,2}>> do8 r r4

    %66
    r16 la'_\tr ^\markup\italic "stacc." do la fa8 r r16 re_\tr fa re si8 r
    r16 si'\tr re si sol8 r r16 mi_\tr sol mi do8 r
    r16 do'\tr mi do la8 r r16 fa_\tr la fa re8 re\mbreak

    %69
    mi mi'4\f fad8\tr sol sol4 fad8\tr
    sol sol4 fad8\tr  sol16. sol32 sol16. re32 re16. si32 si16. sol32
    <sol sol,>4 sol8\p_\upl sol_\upl sol_\upl r  r4

    %72
    r8 sol(fa mi re do) r4
    r8 sol'(fa mi re do) la'16(sol fa mi)
    la(sol fa mi) la(sol fa mi)\pf do'(si la sol fa mi re do)\mbreak

    %75
    do8 la'16 (fa) mi8 re \grace fa8 mi4 r
    r8 sol\p(fa mi re do) r4
    r8 sol'(fa mi re do) la'16(sol fa mi)

    %78
    la(sol fa mi) la(sol fa mi)\pf do'(si la sol fa mi re do)\mbreak
    do8 la'16 (fa) mi8 re mi8 r r4
    r2\mbreak do'32\p(re mi do) re[mi fa re]do re mi do re[mi fa re]

    %81
    do re  mi do la16[fa] mi32 fa sol mi re[mi fa re] mi8 r r4
    r2 do'32\p(re mi do) re[mi fa re]do re mi do re[mi fa re]
    do re  mi do la16[fa] mi32 fa sol mi re[mi fa re] mi8\f[r16 sol'] sol8[r16 mi]\mbreak

    %84
    <<mi8\\{mi[r16 do]}>> do16. sol32 sol16. mi32 <<{do8[ <mi' do sol> <mi do sol>]}\\{s8 sol,[sol]}>>

}


Ivlan =\relative do' {

    r8
    R1*12
    r16 <<{fad fad fad r mi mi mi re8}\\{re16 re re r la la la re8}>> r r4
    r16 <<{fad fad fad r mi mi mi re8}\\{re16 re re r la la la re8}>> r r4

    %15
    r16 re\upl\p re\upl re\upl r fad\upl fad(re) sol8 r r4
    r16 re\upl\p re\upl re\upl r fad\upl fad(re) sol8 r r re\pp(
    mi) mi r do r la r fad

    %18
    r fad' r re r si r sol\mbreak
    r sol' r mi r do r re~
    re\f sol, mi'4 re8 re mi4

    %21
    re8 re mi4 re16. re32 re16. la32 la16. fad32 fad16. re32
    re8 r re_\upl\p re_\upl re_\upl r  r re'
    fad,(sol la si) do (si) r8 re

    %24
    fad,(sol la si) do  (si) r4
    r2 r4 r8 re\pf\mbreak
    mi do re re re4 r8 re\p

    %27
    fad,(sol la si) do(si) r re
    fad,(sol la si) do(si) r4
    r2 r4 r8 re

    %30
    mi do re re sol, sol la si
    do re mi fad sol sol, sol sol
    sol r r4\mbreak r8 sol la si

    %33
    do re mi fad sol sol, sol sol
    sol r r4 r8 r16 si'\f si8[r16 re,]re8[r16 sol]
    sol16. re32 re16. si32 <<{sol8[re' re]}\\{s8 si[si]}>> r

    %36
    r8 sol\p sol sol r fad fad fad
    r fad? fad fad\mbreak r sol sol sol
    r si si si r do do do

    %39
    re re re re, r sol sol sol
    r si si si r do do do
    re re re re, sol sol sol sol

    %42
    r si si r r re\< re sol,\mbreak
    r sol sol sol r si\f\! si si
    si4 do8\p sold(la) fa' !mi mi(

    %45
    fa) re mi mi, la la' r la,\f
    sold si \p(do sold) la fa' mi mi
    fa re mi mi, la16 do\f (mib re) do(sib la sol)

    %48
    fad8 la\p la la r re re re\mbreak
    r re\<  re re re\f\! do16. sib32 la8 [sol](
    fad) la\p(sib fad) sol mib' re re

    %51
    mib do re re, sol sol' r sol,\f(
    fad) la\p (sib fad) sol mib' re re
    mib do re re, sol4 r

    %54
    si'!4._\markup {\italic solo \dynamic p} \slashedGrace si8 la16 sol do8 do~do16 do(re mi)\mbreak
    \grace mi8 re re~re16 re(mi fa) mi8.(fa32 sol fa16 mi re do)
    \grace do8 si si4 \slashedGrace si8 la16 sol do8 do~\sestine \tuplet 6/4 { do16(mi re do re mi) }

    %57
    mi(re) re8~\tuplet 6/4 { re16(fa mi re mi fa)} mi8.\tr fa16 sol8 r
    R1*4
    r16 <<{mi,\f mi mi r re re re}\\{do do do r sol sol sol}>> do8 r r4

    %63
    r16 <<{mi mi mi r re re re}\\{do do do r sol sol sol}>> do8 r r4\mbreak
    r16 sol\p sol sol r si si (sol) do8 r r4
    r16 sol sol sol r si si (sol) do8 r r sol

    %66
    la la' r fa r re r si
    r si' r sol r mi r do
    r do' r la r fa r sol~

    %69
    sol do,\f <<la'4\\la>> sol8 sol <<la4\\la>>
    sol8 sol <<la4\\la>> sol16. sol32 sol16. re32 re16. si32 si16. sol32
    <<sol4\\sol>> sol8_\upl\p sol_\upl sol_\upl r r sol'

    %72
    si,(do re mi fa mi) r sol
    si,(do re mi fa mi) r4
    r2 r4 r8 sol,\pf\mbreak

    %75
    la fa sol sol sol r r sol'\p
    si,(do re mi fa mi) r sol
    si,(do re mi fa mi) r4

    %78
    r2 r4 r8 sol,\pf
    la fa sol sol do do'4\p fa,8
    mi sol sol r\mbreak do, do do do

    %81
    la fa sol sol do do'4 fa,8
    mi sol sol r do, do do do
    do fa sol sol, do\f[r16 mi] mi8[r16 sol]\mbreak

    %84
    sol8[r16 do,] mi16. sol32 sol16. mi32 <<{s8 mi[mi]}\\{do [sol sol]}>>

}


IvcIn =\relative do {

    r8
    R1*12
    <re' fad, la, re,>4\f <dod mi, la,> <re fad, la, re,>8 r r4
    <re fad, la, re,>4\f <dod mi, la,> <re fad, la, re,>8 r re16(do si la)

    %15
    <sol sol,>4\p <<re\\re>> <<sol,8\\sol>> r r4
    <sol' sol,>4 <<re\\re>> <<sol,8\\sol>> r r si\pp
    do do' r la r fad r re

    %18
    r re' r si r sol r mi\mbreak
    r mi' r do r la r fad
    sol\f sol mi mi, re re' mi mi,

    %21
    re re' mi mi, <<{re re' re re}\\{s re[re re]}>>
    <<{re4 re8\p[re] re}\\{re4 re8[re] re}>> r r re'(
    do si la sol fad mi) r re'(

    %24
    do si la sol fad sol) sol,\noBeam r
    sol r sol r sol4.\pf si8\mbreak
    do do re re sol,4 r8 re''\p

    %27
    do(si la sol) fad (sol) r re'
    do(si la sol) fad(sol) sol, r
    sol r sol r sol4. <sol' sol,>8

    %30
    do, do re re sol, r r4
    r2 sol~
    sol8 do re re,\mbreak sol r r4

    %33
    r2 sol~
    sol8 do re re, sol8[r16 <sol' sol,>] <sol sol,>8[r16 <sol sol,>]
    <sol sol,>8 [r16 sol] sol16. re32 re16. si32 sol8[ <sol' sol,> <sol sol,>] r

    %36
    R1*6
    r8 sol, \dolce sol sol r sol sol sol\mbreak
    r sol sol sol sol\rinf sol sol sol

    %44
    sold4\f la8\p(mi' fa re mi do)
    re fa mi mi, la la' r la\f (
    sold) sold,\p(la mi') fa!(re mi do)

    %47
    re re mi mi, la16 do'\f(mib re do sib la sol)
    fad8 re\p  re re r re re re\mbreak
    r re\< re re\! <<{re\f [do16. sib32]}\\re8>> la8 sol

    %50
    fad4(sol8\p) re'(mib do re sib)
    do mib re re, sol sol' r sol\f
    fad fad,\p(sol re') mib do re sib

    %53
    do do re re, sol sol sol sol
    \clef tenor <<re''2\\<re sol,>_\markup {\italic ten \dynamic pp} >> <mi sol,>\mbreak
    <<fa\\sol,>> r8 sol sol sol

    %56
    <<
        {
            re'2 mi
            fa
        }\\{
            sol, sol
            sol
        }
    >> \clef bass r8 do, do do
    do do do do do do'4 <<si8\\sol>>\mbreak

    %59
    do do, do do sol' sol16. fa32 mi8 do'
    do, do do do do do'4 <<si8\\sol>>
    do4 r8 do sol sol, sol'16 fa mi re

    %62
    <do' mi, sol, do,>4\f <si re, sol,> <do mi, sol, do,> r
    <do mi, sol, do,>4 <si re, sol,> <do mi, sol, do,> r
    do,\p sol do, r

    %65
    do' sol do, r8 mi'
    fa[\clef tenor fa'] r re r si r sol
    r sol' r mi r do r la

    %68
    r la' r fa r re r si
    \clef bass do do\f la  la, sol sol la la
    sol sol la la la16. sol'32 sol16. re32 re16. si32 si16. sol32

    %71
    <<sol4\\sol>> sol8\p_\upl sol_\upl sol_\upl r r sol'
    fa(mi re do si do) r sol'
    fa(mi re do si do)  do' r

    %74
    do r do r do,4.\pf do8\mbreak
    fa, fa' sol sol, do4 r8 sol'\p
    fa (mi re do si do) r sol'

    %77
    fa(mi re do) si do do' r
    do r do r do,4.\pf do8
    fa, fa' sol sol, do mi\p fa sol

    %80
    la si do re\mbreak mi do, do do
    do fa sol sol, do mi fa sol
    la si do re mi do, do do

    %83
    do fa sol sol, <do do,>\f[r16 <do do,>] <do do,>8[r16 <do do,>]\mbreak
    <do do,>8[r16 do'] do16. sol32 sol16. mi32 <do do,>8[<do do,> <do do,>]

}


IvcIIn =\relative do {

    r8
    R1*12
    <<{re8\f re la la}\\{re [re]}>> re r r4
    <<{re8\f re la la}\\{re [re]}>> re r r4

    %15
    sol,8\p sol' re re, sol r r4
    sol8 sol' re re, sol r r si\pp
    do r la r fad r re r

    %18
    re' r si r sol r mi r\mbreak
    mi' r do r la r fad r
    sol\f sol' mi mi, re re' mi mi,

    %21
    re re' mi mi, re re re re
    re4 r r2
    r4 r8 sol\p re sol r4

    %24
    r4 r8 sol re sol sol'\noBeam r
    sol r sol r sol,4.\pf si8\mbreak
    do do re re sol,4 r

    %27
    r4 r8 sol\p re sol r4
    r4 r8 sol re sol sol'\noBeam r
    sol r sol r sol,4. sol'8

    %30
    do, do re re sol, r r4
    r2 sol~
    sol8 do re re,\mbreak sol r r4

    %33
    r2 sol~
    sol8 do re re, sol8[r16 <sol' sol,>] <sol sol,>8[r16 <sol sol,>]
    <sol sol,>8 [r16 sol] sol16. re32 re16. si32 sol8[ <sol' sol,> <sol sol,>] r

    %36
    R1*6
    r8 sol, \dolce sol sol r sol sol sol\mbreak
    r sol sol sol sol\rinf sol sol sol

    %44
    sold4\f la8\p(mi' fa re mi do)
    re fa mi mi, la la' r la\f (
    sold) sold,\p(la mi') fa!(re mi do)

    %47
    re re mi mi, la16 do'\f (mib re do sib la sol)
    fad8\p re re re r re re re\mbreak
    r re\< re re\! <<{re\f [do16. sib32]}\\re8>> la8 sol

    %50
    fad4(sol8\p) re'(mib do re sib)
    do mib re re, sol sol' r sol\f
    fad fad,\p(sol re') mib do re sib

    %53
    do do re re, sol sol sol sol
    sol\pp sol sol sol sol sol sol sol\mbreak
    sol sol sol sol sol sol sol sol

    %56
    sol sol sol sol sol sol sol sol
    sol sol sol sol do do do,\noBeam r
    R1*4

    %62
    <<{<do' do,>8\f <do do,> sol sol}\\{s4 sol8[sol]}>> <do do,> r r4
    <<{<do do,>8 <do do,> sol sol}\\{s4 sol8[sol]}>> <do do,> r r4\mbreak
    do8\p do' sol, sol' do,4 r

    %65
    do8 do' sol, sol' do,4 r8 mi
    fa r re r si r sol r
    sol' r mi r do r la r

    %68
    la' r fa r re r si r\mbreak
    do do'\f la  la, sol sol la la
    sol sol la la la16. sol'32 sol16. re32 re16. si32 si16. sol32

    %71
    sol4 r r2
    r4 r8 do\p sol do, r4
    r4 r8 do' sol do, do' \noBeam r

    %74
    do r do r do4.\pf do8\mbreak
    fa fa, sol sol do4 r
    r4 r8 do\p sol do, r4

    %77
    r4 r8 do' sol do, do' \noBeam r
    do r do r do4.\pf do8
    fa fa, sol sol do, r r4

    %80
    r2\mbreak do'4.\p do8
    do fa sol sol, do4 r
    r2 do4. do8

    %83
    do fa sol sol, <do do,>\f[r16 <do do,>] <do do,>8[r16 <do do,>]\mbreak
    <do do,>8[r16 do'] do16. sol32 sol16. mi32 <do do,>8[<do do,> <do do,>]

}

forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 70
    \partial 8 s8
    s1*34
    s2. s8
    \bar ":..:"\break
    s
    s1*48
    s2. s8
    \bar ":|."

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


IvcI = {
    \Iglobal
    \clef bass
    <<\IvcIn \forma>>
}


IvcII = {
    \Iglobal
    \clef bass
    <<\IvcIIn \forma>>
}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override TrillSpanner.bound-details.left.text = #'()
    \terzine\con
}

IIfln =\relative do'' {

    do8 sol r4 r r8 sol'\p~
    sol8 \slashedGrace sol fa16. mi32 fa8 fa \slashedGrace sol16 fa8 mib re4~
    re8\tuplet 3/2 { re16(mib fa) } mib8 re\tr do4 r

    %4
    R1*2\mbreak
    r2 r4 sib'\dolce~
    sib8 \slashedGrace sib lab16. sol32 lab8 lab4\slashedGrace lab8 sol16. fa32 sol8 sol16(lab)

    %8
    mi(fa lab mi fa do fa mib) mib4(re8) mib16. [(sib32)]
    sib2~sib4. fa'16.(sib,32)
    sib2.~sib8 r \mbreak

    %11
    R1
    r2 r8 sol'32\p(fa lab sol) fa16\f  sib, sib\tr do32. re64
    mib8 sol32\p(fa lab sol) fa16\f  sib, sib\tr do32. re64 mib16 sol,\p sol sol sol8 r

    %14
    do8\f sol r4  r r8 sol'\dolce~
    sol8 \slashedGrace sol fa16. mi32 fa8 fa \slashedGrace sol16 fa8 mib re4~
    re8\tuplet 3/2 { re16(mib fa) } mib8 re\tr do4 r

    %17
    R1*2\mbreak
    r2 r4 sib'\dolce~
    sib8 \slashedGrace sib lab16. sol32 lab8 lab4\slashedGrace lab8 sol16. fa32 sol8 sol16(lab)

    %21
    mi_\markup\italic "dolcis."(fa lab mi) fa (do fa mib) mib4(re)
    dod8 dod dod dod\p(re) r r4
    si2\mbreak do?8 r r4

    %24
    R1
    r2 r4 r8 do'16.\p sol32
    sol2~sol4. re'16.(sol,32)

    %27
    sol2~sol4. do16\dolce(sib)
    lab16(sol fa lab sol fa mib re) mib(mi fa fad sol la si do)\mbreak
    do,4 si\tr do8\f sol r4

    %30
    R1*2

}

IIvlIn =\relative do'' {

    do8\f <sol sol,> r mib' \p\slashedGrace re do16. si32 do8 sol'4~
    sol8 \slashedGrace sol fa16. mi32 fa8 fa \slashedGrace sol16 fa8 mib re4~
    re8\tuplet 3/2 { re16(mib fa) } mib8 re\tr do lab16\p(fa) sol(mib fa re)

    %4
    mib16.\f mib32 sol16. mib32 do8 r r2
    R1
    r2 r4 sib''\dolce~

    %7
    sib8 \slashedGrace sib lab16. sol32 lab8 lab4\slashedGrace lab8 sol16. fa32 sol8_\markup\italic "dolciss." sol16(lab)
    mi(fa lab mi fa do fa mib) mib4(re8) mib16.\pf [(sib32)]
    sib2~sib4. fa'16.(sib,32)

    %10
    sib2~sib4. sol'16\p(fa)\mbreak
    mib(re mib re do si do sib lab sol lab sol) fa mib \slashedGrace mib8 re16 do32 sib
    mib(mib' sib reb) \slashedGrace reb8 do16[sib32 lab] sol8 fa_\tr mib8 mib'32(re? fa mib) re16\f sib32 sib sib16\tr[do32. re64]

    %13
    mib8\p mib32(re fa mib) re16\f sib32 sib sib16\tr[do32. re64] mib16  mib,\p mib mib mib8 r
    do'8\f <sol sol,> r mib' \p\slashedGrace re do16. si32 do8 sol'4~
    sol8 \slashedGrace sol fa16. mi32 fa8 fa \slashedGrace sol16 fa8 mib re4~

    %16
    re8\tuplet 3/2 { re16(mib fa) } mib8 re\tr do lab16(fa) sol(mib fa re)
    mib16.\f mib32 sol16. mib32 do8 r r2
    R1

    %19
    r2 r4 sib''\dolce~
    sib8 \slashedGrace sib lab16. sol32 lab8 lab4\slashedGrace lab8 sol16. fa32 sol8_\markup\italic "dolciss." sol16(lab)
    mi(fa lab mi fa do fa mib) mib4(re)

    %22
    dod16\rinf dod8 dod dod sib'16\p sib32(la) la\upl la\upl la[(sol) sol\upl sol\upl] sol(fa) fa\upl fa\upl fa[(mib! re do?)]
    si16\rinf si8 si si lab'!16\mbreak lab32(sol) sol\upl sol\upl sol[(fa) fa\upl fa\upl] fa(mib) mib\upl mib\upl sol[(mib re do)]
    reb16\p reb8 reb16 si si8 si16 do do8 do16 sib sib8 sib16

    %25
    \slashedGrace sib8 lab16(sol32 fa) \slashedGrace sib8 lab16[(sol32 fa)] mib8 re_\tr do4 r8 do'16.\dolce sol32
    sol2~sol4. re'16.(sol,32)
    sol2~sol4. do16\dolce(sib)

    %28
    lab16(sol fa lab sol fa mib re) mib(mi fa fad sol la si do)\mbreak
    do,4 si\tr do\f r8 mib'\p
    \slashedGrace re8 do16. si32 do8 r mib \slashedGrace re8 do16. \pp si32 do8 r mib

    %31
    do16(sol) sol sol sol8 sol sol2

}


IIvlIIn =\relative do'' {

    do8\f <sol sol,> r sol\p \slashedGrace fa8 mib16. re32 mib8 r4
    r2 do~
    do8 do'4 si8 do16(mib, fa re mib do re si)

    %4
    do8 r r4 r2
    r do\parenthesize ~\mbreak
    do4(sib8 lab) sol4 r8 sib'\dolce

    %7
    do2 sib
    do8 do4 do8 fa,16_\startTrillSpan fa fa fa \stopTrillSpan fa8 r
    r sib\p(lab sol) fa32 fa fa16_\tr  sol32[sol sol16_\tr] lab8 r

    %10
    r lab sol lab sol32 sol sol16_\tr lab32[lab lab16_\tr] sol8 mib'16\p[(re)]\mbreak
    do16(si do sib) lab(sol lab sol) fa(mi fa mib) re(do sib lab)
    sol sol'32 sib \slashedGrace sib8 lab16[sol32 fa] mib8 re_\tr  mib r r16 sib32\f[sib]sib16_\tr do32. re64

    %13
    mib8 r r16 sib32\f[sib]sib16_\tr do32. re64 mib16  sol,\p sol sol sol8 r
    do'8\f <sol sol,> r sol\p \slashedGrace fa8 mib16. re32 mib8 r4
    r2 do~

    %16
    do8 do'4 si8 do16(mib, fa re mib do re si)
    do8 r r4 r2
    r do~\mbreak

    %19
    do4 sib8 lab sol4 r8 sib'\dolce
    do2 sib
    do8 do4 do8 fa,16_\startTrillSpan fa fa fa \stopTrillSpan fa8 fa

    %22
    mi16\rinf mi8 mi mi mi16\p fa8 dod' (re) do,!\rinf
    re16 re8 re re re16\mbreak mib8\p si'(do) sol
    lab2 sol

    %25
    fa8\noBeam \slashedGrace sol fa16[(mib32 re)] do8 si_\tr do4 r
    r8 sol'8(fa mib) re32[re re16_\tr] mib32 mib mib16_\tr fa8 r
    r8 fa\p(mib fa) mib32[mib mib16_\tr] fa32 fa fa16_\tr mib8 r

    %28
    r2 r4 r8 r16 mib\mbreak
    mib4 re\tr do8\f sol r sol'\p
    \slashedGrace fa8 mib16. re32 mib8 r sol \slashedGrace fa8 mib16.\pp re32 mib8 r sol

    %31
    mib16 mib mib mib mib8 mib mib2

}

IIvlan =\relative do' {

    do8\f sol r4 r r16 mib'\p do'16. sol32
    lab4 si do8 sol(lab sol)
    fa lab sol sol mib r r4
    do'8\f <sol sol,> r mib'\p \slashedGrace re8 do16. sib32 do8 r sol
    lab4 si do8 sol(lab sol)\mbreak
    fa4. re8 sib(sol) r sol'\dolce
    lab4 fa2 mib4
    lab,8 lab lab la sib sib sib r
    r sol'\p(fa mib) re32 re re16\tr mib32[mib mib16\tr] fa8 r
    r fa(mib fa) mib32 mib mib16\tr fa32[fa fa16\tr] mib8 r\mbreak
    R1
    mib8 lab, sib sib mib mib sib16 sib32\f sib sib16.\tr[do64 re]
    mib8\p mib sib16 sib32\f sib sib16.\tr[do64 re] mib16  sib\p sib sib sib8 r
    do\f sol r4 r r16 mib'\p do'16. sol32
    lab4 (si do8 sol lab sol)
    fa lab sol sol do, r r4
    do'8\f <sol sol,> r mib'\p \slashedGrace re8 do16. si32 do8 r sol
    lab4 (si) do8 sol(lab sol)\mbreak
    fa4. re8 sib sol r sol'\dolce
    lab4 fa2 mib4
    lab,8 lab lab la sib sib sib sib

    %22
    sol4\rinf la8 sib16 dod re8 r r4
    sol8\rinf(lab! sol fa) \mbreak mib16(sol re sol do, sol' do, mib)
    fa fa fa fa fa fa fa fa mib(do) do do do do do do

    %25
    do8 r r4 r16  mib\f sol16. mib32 do8 r
    r8 mib(re do) si32 si si16\tr do32[do do16\tr] re8 r
    r re\p(do re)do32[do do16\tr] re32 re re16\tr do8\noBeam r

    %28
    r2 r4 r8 r 16 fad,\mbreak
    sol sol sol sol sol sol sol sol do'8\f <sol sol,> r4
    r16 mib\p sol16. mib32 do8 r r16  mib\pp sol16. mib32 do8 r

    %31
    r16 <mib sol,> <mib sol,> <mib sol,> <mib sol,>8 <mib sol,> <mib sol,>2

}


IIvcIn =\relative do {

    r16 r32 mib\f sol16 . mib32 <do do,>8 r r16 mib\p sol16. mib32 do8 mib
    fa4 sol do, fa8 sol
    lab fa sol sol, do r r4

    %4
    r16 r32 mib sol16 . mib32 do8 \clef tenor \key do\minor sol''\p \slashedGrace fa8 mib16. re32 mib8 sol4~
    sol8\slashedGrace sol8 fa16. mi32 fa8 fa \slashedGrace sol8 fa mib re4~\mbreak
    re~re8 mib16.\tr fa32 sol8 mib r \clef bass \key do\minor sol,\dolce

    %7
    lab lab fa fa re re mib mib
    lab, lab lab la sib sib sib r
    R1

    %10
    \clef tenor \key do\minor r8 re'\p( mib re) mib(re mib) r\mbreak
    \clef bass \key do\minor R1
    mib,,8\p lab sib sib mib, r r16 sib'32\f[sib] sib16_\tr do32. re64

    %13
    mib8 r r16 sib32\f[sib] sib16_\tr do32. re64 mib16 mib,\p mib mib mib8 r
    r16 r32 mib'\f sol16 . mib32 <do do,>8 r r16 mib\p sol16. mib32 do8 mib
    fa4 (sol) do, fa8 (sol

    %16
    lab fa sol) sol, do r r4
    r16 r32 mib\f sol16 . mib32 do8 \clef tenor \key do\minor sol''\p \slashedGrace fa8 mib16. re32 mib8 sol4~
    sol8\slashedGrace sol8 fa16. mi32 fa8 fa \slashedGrace sol8 fa mib re4~\mbreak

    %19
    re~re8 mib16.\tr fa32 sol8 mib r \clef bass \key do\minor sol,
    lab lab fa fa re re mib mib
    lab, lab lab la sib sib sib sib

    %22
    sib\rinf sib' (la sol\p) <<{la [la la]}\\{fa mi re lab!\rinf}>>
    sol(lab sol fa)\mbreak mib!\p re do mib'
    fa fa re re mib mib mi mi

    %25
    fa fa, sol sol do16.\f mib?32 sol16. mib32 do8 r
    R1
    \clef tenor \key do\minor r8 si'\p (do si) do si do16\upl do(mi sol)

    %28
    fa(mib! re fa mib re do si) do(sib la lab sol fad fa mib!)\mbreak
    \clef bass \key do\minor sol, sol sol sol sol sol sol sol do16.\f mib32 sol16. mib32 do8 r
    r16 mib\p sol16. mib32 do8 r r16 mib\pp sol16. mib32 do8 do

    %31
    do16 do do do do8 do do2

}


IIvcIIn =\relative do {

    r16 r32 mib\f sol16 . mib32 <do do,>8 r r16 mib\p sol16. mib32 do8 mib
    fa4 sol do, fa8 sol
    lab fa sol sol, do r r4

    %4
    r16 r32 mib sol16 . mib32 <do do,>8 r r16 mib\p sol16. mib32 do8 mib
    fa fa sol sol do, do(fa sol)\mbreak
    lab fa sib! sib, mib,4 r8 sol'\dolce

    %7
    lab lab fa fa re re mib mib
    lab, lab lab la sib sib sib r
    r4 r8 mib sib' sib, sib sib

    %10
    sib4 r r2\mbreak
    R1
    mib,8\p lab sib sib mib, r r16 sib'32\f[sib] sib16_\tr do32. re64

    %13
    mib8 r r16 sib32\f[sib] sib16_\tr do32. re64 mib16 mib,\p mib mib mib8 r
    r16 r32 mib'\f sol16. mib32 <do do,>8 r r16 mib\p sol16. mib32 do8 mib
    fa4 (sol) do, fa8 (sol

    %16
    lab fa sol) sol, do r r4
    r16 r32 mib\f sol16. mib32 <do do,>8\p r r16 mib\p sol16. mib32 do8 mib
    fa fa sol sol do, do(fa sol)

    %19
    lab fa sib! sib, mib,4 r8 sol'
    lab lab fa fa re re mib mib
    lab, lab lab la sib sib sib sib

    %22
    sib\rinf sib' (la sol\p) <<{la [la la]}\\{fa mi re lab!\rinf}>>
    sol(lab sol fa)\mbreak mib!\p re do mib'
    fa fa re re mib mib mi mi

    %25
    fa fa, sol sol do16.\f mib?32 sol16. mib32 do8 r
    r4 r8 do\p sol' sol, sol sol
    sol4 r r2

    %28
    r r4 r8 r16 fad\mbreak
    sol sol sol sol sol sol sol sol do16.\f mib32 sol16. mib32 do8\p do

    do r r <do do,> <do do,>4 r8 <do do,>
    <do do,>4 do,8 do do2

}

forma = {

    \time 4/4
    \key do\minor
    \tempo 4 = 50
    s1*31
    \bar "|."

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


IIvcI = {
    \IIglobal
    \clef bass
    <<\IIvcIn \forma>>
}


IIvcII = {
    \IIglobal
    \clef bass
    <<\IIvcIIn \forma>>
}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

IIIfln =\relative do'' {

    do'2.\p
    do
    do4 do do

    %4
    do2.~
    do8 do\upl do\upl do\upl \slashedGrace do si\upl la\upl
    re2 do8\upl si\upl

    %7
    si(la) la[(sol)] sol(fad)
    \slashedGrace fad?8 sol4 sol, r
    do' do do

    %10
    do2.
    sib\mbreak
    la

    %13
    sol
    fa
    mi

    %16
    re8 re' (do si la sol)
    do2.
    do\mbreak

    %19
    do4 do do
    do2.~
    do8(sol) sol\upl sol\upl \slashedGrace sol fa mi

    %22
    re2\f mi8. fa16
    \slashedGrace la8 sol8. fa16 mi4 re
    do2 r4

}

IIIvlIn =\relative do'' {

    do2.\p
    do
    do4 do do

    %4
    do2.~
    do8 do\upl do\upl do\upl \slashedGrace do si(la)
    re2 do8\upl si\upl

    %7
    si(la) la[(sol)] sol(fad)
    \slashedGrace fad?8 sol4 sol, r
    do' do do

    %10
    do2.
    sib\mbreak
    la

    %13
    sol
    fa
    mi

    %16
    re8 re' (do si la sol)
    do2.
    do\mbreak

    %19
    do4 do do
    do2.~
    do8(sol) sol_\upl sol_\upl \slashedGrace sol fa mi

    %22
    <re sol,>4.\f  re'8[mi8. fa16]
    \slashedGrace la8 sol8. fa16 mi4 re
    do2 r4

}


IIIvlIIn =\relative do'' {

    do,2.\pp
    do
    do4 do do

    %4
    do2.~
    do8 do'_\upl do_\upl do_\upl \slashedGrace do si(la)
    re2 do8\upl si\upl

    %7
    si(la) la[(sol)] sol(fad)
    \slashedGrace la8 sol4 sol, r
    do do do

    %10
    do2.
    sib\mbreak
    la

    %13
    la'~
    la4 r r
    R2.

    %16
    r8 fa! mi re do si
    do2.
    do\mbreak

    %19
    do4 do do
    do2.~
    do8[(sol') sol_\upl sol_\upl ]\slashedGrace sol fa8. mi16

    %22

    <re sol,>4.\f  re'8[mi8. fa16]
    \slashedGrace la8 sol8. fa16 mi4 re
    do2 r4

}


IIIvlan =\relative do' {

    mi8\p\upl fa\upl sol\upl la\upl fa\upl sol\upl
    mi8\upl fa\upl sol\upl la\upl fa\upl sol\upl
    mi8\upl fa\upl sol\upl la\upl fa\upl sol\upl

    %4
    mi8\upl fa\upl sol\upl la\upl sol\upl fa\upl
    mi2 mi8(fad)
    sol2.~

    %7
    sol8 do\upl do(si) si(la)
    sol4 sol8(fa! mi re)
    mi8\upl fa\upl sol\upl la\upl fa\upl sol\upl

    %10
    mi8\upl fa\upl sol\upl la\upl fa\upl sol\upl
    mi\upl fa\upl sol\upl mi\upl fa\upl sol\upl \mbreak
    do,_\upl sib_\upl la_\upl dod_\upl re_\upl fa_\upl

    %13
    dod mi dod mi dod mi
    fa sol la la, re si
    do? do4 do do8

    %16
    si4 sol r
    mi'8\upl fa\upl sol\upl la\upl fa\upl sol\upl
    mi\upl fa\upl sol\upl la\upl fa\upl sol\upl\mbreak

    %19
    mi\upl fa\upl sol\upl la\upl fa\upl sol\upl
    mi\upl fa\upl sol\upl la\upl  sol\upl fa\upl
    mi[(mi') mi\upl mi\upl] \slashedGrace mi8 re do

    %22
    <<si4.\f\\sol>> si8[do8. re16]
    mi8. re16 do4 si
    do2 r4

}


IIIvcIn =\relative do {

    \clef tenor do'8\upl_\markup\italic "stac." re\upl mi\upl fa\upl re\upl mi\upl
    do8\upl re\upl mi\upl fa\upl re\upl mi\upl
    do8\upl re\upl mi\upl fa\upl re\upl mi\upl

    %4
    do8\upl re\upl mi\upl fa\upl mi\upl re\upl
    do2\clef bass do,4
    si8 si' si si \slashedGrace si la sol

    %7
    do, r re r re, r
    sol4 r r
    \clef tenor do'8\upl re\upl mi\upl fa\upl re\upl mi\upl

    %10
    \clef bass do,\upl re\upl mi\upl fa\upl re\upl mi\upl
    do\upl re\upl mi\upl do\upl re\upl mi\upl \mbreak
    fa\upl sol\upl fa\upl mi\upl fa\upl re\upl

    %13
    mi dod la dod mi dod
    re mi fa re si sol
    do? re mi do mi fad

    %16
    sol4 sol sol,
    \clef tenor do'8\upl re\upl mi\upl fa\upl re\upl mi\upl
    do8\upl re\upl mi\upl fa\upl re\upl mi\upl\mbreak

    %19
    do8\upl re\upl mi\upl fa\upl re\upl mi\upl
    do8\upl re\upl mi\upl fa\upl mi\upl re\upl
    do4 \clef bass do, do

    %22
    fa,8 [fa'\f fa fa] \slashedGrace fa mi8. re16
    do8. fa16 sol4 sol,
    do2 r4

}


IIIvcIIn =\relative do {

    <do do,>2.\pp
    <do do,>
    <do do,>4 <do do,> <do do,>

    %4
    <do do,>2.
    do2 do'4
    si8 [si si si] \slashedGrace si la sol

    %7
    do, r re r re, r
    sol4 sol'8 fa mi re
    R2.

    %10
    do8\upl re\upl mi\upl fa\upl re\upl mi\upl
    do\upl re\upl mi\upl do\upl re\upl mi\upl
    fa\upl sol\upl fa\upl mi\upl fa\upl re\upl

    %13
    mi dod la dod mi dod
    re mi fa re si sol
    do?re mi do mi fad

    %16
    sol4 sol sol,
    do,2.\p
    do

    %19
    do4 do do
    do2.~
    do4 do' do

    %22
    fa,8 [fa'\f fa fa] \slashedGrace fa mi8. re16
    do8. fa16 sol4 sol,
    do2 r4

}

forma = {

    \time 3/4
    \key do\major
    \tempo 2 = 60
    s2.*8
    \bar ":..:"\break
    s2.*16
    \bar ":|."

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


IIIvcI = {
    \IIIglobal
    \clef bass
    <<\IIIvcIn \forma>>
}


IIIvcII = {
    \IIIglobal
    \clef bass
    <<\IIIvcIIn \forma>>
}


IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \senza
}

IVfln =\relative do'' {

    fa2.\tr
    fa\tr
    fa\tr

    %4
    fa\tr
    mi
    fa8 r r4 r\mbreak

    %7
    mi2.
    fa4 r r
    R2.*12

    %21
    \tuplet 3/2 {
        do'8(la fa) do(fa la) do do do
        do(sol mi) do(mi sol) do do do
        do(la fa) do(fa la) do do do

        %24
        do(sol mi) do(mi sol) do do do
        do(la fa) do(fa la) do do do
        do(sol mi) do(mi sol) do do do

        %27
        do(la fa) do(fa la) do do do
        do(sol mi) do(mi sol) do do do
    }\mbreak
    do8 r r4 r

    %30
    R2.*3
    do,2.\p
    do

    %35
    R2.*6
    do2.~
    do

    %43
    R2.*2

}

IVvlIn =\relative do'' {

    \tuplet 3/2 {
        la'8\solo fa mi \slashedGrace sol fa mi fa re\upl mi(fa)
        do\upl mi(fa) sib,\upl mi(fa) la,\upl mi'(fa)
    }
    fa,4 r r

    %4
    R2.
    \tuplet 3/2 {
        sib8 re do \slashedGrace do sib la sib sol' mi sib
        la la' sol fa mi re do sib la
    }\mbreak

    %7
    sol4 r r
    R2.
    \tuplet 3/2 {
        la'8 (do) sib \slashedGrace do sib la sib sol la sib

        %10
        la do sib \slashedGrace do sib la sib sol la sib
        la fa do la' fa do \slashedGrace re do sib la
    }
    la2\parenthesize ( sol4)

    %13 OOKK
    \tuplet 3/2 {
        fa8_\upl la_\upl sol_\upl sib(la) re\upl do\upl mib\upl re\upl
        fa(mib) sol\upl fa\upl sib\upl la\upl do(sib) re\upl
    }
    \grace re8 do4~\tuplet 3/2 { do8 sib\upl la\upl sol\upl fa\upl  mib\upl }

    %16
    mib?2 re4\mbreak
    R2.*4
    fa,2.\p

    %22
    sol
    la
    sib!

    %25
    la
    sol
    la

    %28
    sib\mbreak
    \tuplet 3/2 { la'8\dolce sib do la sib do la sib do }
    re r r4 r

    %31
    \tuplet 3/2 { sol,8 la sib sol la sib sol la sib }
    la r r4 r
    \tuplet 3/2 {
        fa8 la sol \slashedGrace la sol fa sol sib sol mi

        %34
        fa la sol \slashedGrace la sol fa sol sib sol mi
        fa do la re sib sol sib sol mi
        fa la sol sib(la) re\upl
    } do r

    %37
    R2.
    \tuplet 3/2 { re8 mi fa re mi fa re mi fa }\mbreak
    sol r r4 r

    %40
    \tuplet 3/2 { la,8 sib do la sib do la sib do }
    do,2.
    do~

    %43
    do4 r sib
    la8 la16 sol la8 do <fa la,>4

}


IVvlIIn =\relative do'' {

    R2.*2
    \tuplet 3/2 {
        la'8\solo fa mi \slashedGrace sol fa mi fa re\upl mi(fa)
        do\upl mi(fa) sib,\upl mi(fa) la,\upl mi'(fa)
    }

    %5
    do,4 r r
    R2.
    \tuplet 3/2 {
        sib'8 re do \slashedGrace do sib la sib sol' mi sib

        %8
        la la' sol fa mi re do sib la
        fa' la sol \slashedGrace la sol fa sol mi fa sol
        fa la sol \slashedGrace la sol fa sol mi fa sol

        %11
        fa do la fa' do la \slashedGrace sib8 la sol fa
    }
    fa2(mi4)
    R2.*4

    %17
    \tuplet 3/2 {
        sol8_\upl si_\upl la_\upl do(si) mi\upl re\upl fa\upl mi?\upl
        sol(fa) la  sol\upl si\upl la\upl do(si) mi\upl
    }
    re4~\tuplet 3/2 { re8 do si? la sol fa }

    %20
    fa2 mi4
    la,2.\p
    sib!

    %23
    la
    sol
    la

    %26
    sib
    la
    sol\mbreak

    %29
    R
    \tuplet 3/2 { re'8\dolce mi fa re mi fa re mi fa }
    sol r r4 r

    %32
    \tuplet 3/2 { la,8 sib do la sib do la sib do }
    do,2.
    do~

    %35
    do4 r r
    R2.
    \tuplet 3/2 { la''8\dolce sib do la sib do la sib do }

    %38
    re r  r4 r\mbreak
    \tuplet 3/2 { sol,8 la sib sol la sib sol la sib}
    la r r4 r

    %41
    \tuplet 3/2 {
        fa8 la sol \slashedGrace la sol fa sol sib sol mi
        fa la sol \slashedGrace la sol fa sol sib sol mi
        fa do la re sib sol sib sol mi
    }

    %44
    fa \slashedGrace sol fa16 mi fa8 do <fa la,>4


}


IVvlan =\relative do' {

    fa,2 sib'4(
    la sol fa)
    fa,2 sib'4(

    %4
    la sol fa)
    sol2.
    fa4 \tuplet 3/2 { la8 do sib la sol fa }\mbreak

    %7
    sol2.
    fa4 \tuplet 3/2 { la8 do sib la sol fa }
    do4 do do

    %10
    do2.~
    do4 r r
    R2.

    %13
    la4 do la
    la la la
    la la fa'

    %16
    fa2.\mbreak
    si,4 re si
    si si si

    %19
    si? si sol'
    sol2.
    fa

    %22
    mi
    fa
    mi

    %25
    fa
    mi
    fa

    %28
    mi\mbreak
    \tuplet 3/2 {
        fa8\dolce sol la fa sol la fa sol la
        sib do re sib do re sib do re

        %31
        mi, fa sol mi fa sol mi fa sol
        fa sol la fa sol la fa sol la
    }
    fa4(mi) sol

    %34
    fa(mi) sol
    fa r r
    R2.

    %37
    \tuplet 3/2 {
        fa8\dolce sol la fa sol la fa sol la
        sib do re sib do re sib do re
        mi, fa sol mi fa sol mi fa sol

        %40
        fa sol la fa sol la fa sol la
    }
    fa4(mi sol)
    fa(mi sol)

    %43
    fa sib, do
    do r r

}


IVvcIn =\relative do {

    fa,2\p sib4(
    la sol fa)
    fa2(sib4)

    %4
    la(sol fa)
    do' do' do,
    fa fa fa,\mbreak

    %7
    do' do' do,
    fa fa fa,
    fa' do' do,

    %10
    fa do' do,
    fa fa fa,
    do' do do

    %13
    fa, fa' fa
    fa2.
    fa4 fa fa

    %16
    sib, sib' sib,\mbreak
    sol sol' sol
    sol2.

    %19
    sol4 sol sol
    do, do do
    do\p do do

    %22
    do do do
    do do do
    do do do

    %25
    do do do
    do do do
    do do do

    %28
    do do do\mbreak
    fa, fa' fa,
    sib sib' sib,

    %31
    do do' do,
    fa, fa' fa,
    <<
        {
            la' sib2

            %34
            la4 sib2
            la4
        }\\{
            fa2.
            fa
            fa4
        }
    >> sib, do
    fa, r r

    %37
    fa fa' fa,
    sib sib' sib,\mbreak
    do do' do,

    %40
    fa, fa' fa,
    <<
        {
            la' sib2
            la4 sib2

            %43
            la4
        }\\{
            fa2.
            fa
            fa4
        }
    >> sib, do
    fa,  fa fa

}


IVvcIIn =\relative do {

    fa,2\p sib4(
    la sol fa)
    fa2(sib4)

    %4
    la(sol fa)
    do' do' do,
    fa fa fa,\mbreak

    %7
    do' do' do,
    fa fa fa,
    fa' do' do,

    %10
    fa do' do,
    fa fa fa,
    do' do do

    %13
    fa, fa' fa
    fa2.
    fa4 fa fa

    %16
    sib, sib' sib,\mbreak
    sol sol' sol
    sol2.

    %19
    sol4 sol sol
    do, do do
    do, r r

    %22
    do r r
    do r r
    do r r

    %25
    do r r
    do r r
    do r r

    %28
    do r r\mbreak
    fa r r
    sib r r

    %31
    do r r
    fa, r r
    fa fa fa

    %34
    fa fa fa
    fa sib do
    fa, r r

    %37
    fa' r r
    sib,  r r\mbreak
    do r r

    %40
    fa, r r
    fa fa fa
    fa fa fa

    %43
    fa sib do
    fa fa, fa

}

forma = {

    \time 3/4
    \key fa\major
    \tempo 2 = 60
    s2.*12
    \bar ":..:"\break
    s2.*32
    \bar ":|."
    \mark\markup\smaller {DC M.\super tto}

}


IVfl = {
    \IVglobal
    <<\IVfln \forma>>
}


IVvlI = {
    \IVglobal
    <<\IVvlIn \forma>>
}


IVvlII = {
    \IVglobal
    <<\IVvlIIn \forma>>
}


IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>
}


IVvcI = {
    \IVglobal
    \clef bass
    <<\IVvcIn \forma>>
}


IVvcII = {
    \IVglobal
    \clef bass
    <<\IVvcIIn \forma>>
}


Vglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
   \terzine
}

Vfln =\relative do'' {

   R4.*4
   do16\f(si) do re mi fa
   sol(fa) mi re do re

   %7
   mi fa sol8 sol,
   do4 r8
   R4.*4

   %13
   do16\f(si) do re mi fa
   sol(fa) mi re do re
   mi fa sol8 sol,

   %16
   do4 r8\mbreak
   R4.*2
   re16\f(mi) fad sol la si

   %20
   do (la) fad re sol8\noBeam
   R4.*2
   re16(mi) fad sol la si

   %24
   do (la) fad re sol8\noBeam
   re'16(do) si la sol fad
   mi(fad) mi mi' mi, mi'

   %27
   do(si) la sol fad mi
   re(mi) re re' re, re'
   si(la) sol fad mi re

   %30
   do(re) do do' do, do'\mbreak
   la(sol) fad mi re do
   si(sol re) sol si re

   %33
   sol4.
   la\<
   sib

   %36
   si!\!\f
   do
   dod\ff

   %39
   dod?
   re
   R4.*8

   %49
   sol,4.\p(
   fad
   mi
   re)

   %53
   re8 re re
   re4.
   re8 re re

   %56
   re(mi fad)
   sol4.(
   fad

   %59
   mi
   re)
   re8 re re

   %62
   re4.
   re8 re re
   re(mi fad)

   %65
   sol4.\f \mbreak
   la
   sib

   %68
   si!
   do
   si

   %71
   la
   sol8 r r
   R4.*3
   r8 r re\f

   %77
   sol16(fad) sol la si do
   re(do) si la sol la
   si (do) re8 re,

   %80
   sol r r\mbreak
   R4.*3
   r8 r re
   sol16(fad) sol la si do

   %86
   re(do) si la sol la
   si (do) re8 re,
   sol4 r8

   %89
   R4.*8
   do4.\f\mbreak
   sib8 r r

   %99
   do4.
   sib8 r r
   do4.

   %102
   sib8 r r
   R4.*2
   sol8\p(la si!)

   %106
   do4.
   re
   mi8(re do)

   %109
   \slashedGrace do si la sol
   do4.
   re

   %112
   mi8 r r
   R4.*2
   sol,,16\f(la) si do re mi

   %116
   fa4 mi8
   R4.*2
   sol,16(la) si do re mi

   %120
   fa4 mi16 fa
   sol\solo(fa) mi re do si
   la(si la) la' la, la'

   %123
   fa(mi) re do si la
   sol la sol sol' sol, sol'
   mi(re) do si la sol

   %126
   fa(mi fa) fa' fa, fa'
   re(do) si la sol fa
   mi(sol) do mi sol mi\mbreak

   %129
   do4.\p
   do
   do\<

   %132
   do
   do'\f\!
   do

   %135
   do\ff
   si4 r8
   R4.*24

   %161
   do8 \f do do
   do4.
   do

   %164
   do
   do8 do do
   do4.

   %167
   si
   do8 r r
   R4.*3

   %172
   r8 r sol,\f
   do16(si) do re mi fa
   sol(fa) mi re do re

   %175
   mi fa sol8 sol,\mbreak
   do4 r8
   R4.*3

   %180
   r8 r sol
   do16(si) do re mi fa
   sol(fa) mi re do re

   %183
   mi fa sol8 sol,\mbreak
   do4 r

}

VvlIn =\relative do'' {

   mi16\p fa sol mi la sol
   fa re sol fa mi re
   \slashedGrace re8 do\noBeam si16 do re la

   %4
   \slashedGrace do8 si\noBeam la16 sol la si
   do\f(si) do re mi fa
   sol(fa) mi re do re

   %7
   mi fa sol8 sol,
   do4 r8
   do4\p dod8

   %10
   re si sol
   mi4 fad8
   sol fa!16(mi fa re)

   %13
   do'\f(si) do re mi fa
   sol(fa) mi re do re
   mi fa sol8 sol,

   %16
   do4 r8\mbreak
   mi16\p sol re sol do, sol'
   re sol do, sol' si, sol'

   %19
   re,\f(mi) fad sol la si
   do (la) fad re <sol sol,>8\noBeam
   R4.*2

   %23
   re16(mi) fad sol la si
   do (la) fad re <sol sol,>8\noBeam
   sol\pp sol sol

   %26
   sol4.
   fad8 fad fad
   fad?4.

   %29
   mi8 mi mi
   mi4.\mbreak
   re8 re re

   %32
   re4.
   sol'16 sol sol sol sol sol
   sol sol sol sol sol sol\<

   %35
   sol sol sol sol sol sol
   sol sol sol sol sol sol
   sol\f\! sol sol sol sol sol

   %38
   sol\ff sol sol sol sol sol
   sol sol sol sol sol sol
   fad4 r8

   %41
   si,\p(do) la\upl
   sol4 sol8
   \slashedGrace si la sol la

   %44
   la(si) sol_\upl
   si(do) la\noBeam\upl
   sol4 sol8

   %47
   \slashedGrace si la sol la
   la(si) sol_\upl\noBeam
   sol'4.\pp(

   %50
   fad
   mi
   re)

   %53
   re8 re re
   re4.
   re8 re re

   %56
   re(mi fad)
   sol4.(
   fad

   %59
   mi
   re)
   re8 re re

   %62
   re4.
   re8 re re
   re(mi fad)

   %65
   sol16\f sol sol sol sol sol\mbreak
   sol sol sol sol sol sol
   sol sol sol sol sol sol

   %68
   sol sol sol sol sol sol
   sol sol sol sol sol sol
   sol sol sol sol sol sol

   %71
   fad fad fad fad fad fad
   sol8 r  re,\p
   \slashedGrace fad mi_\upl re_\upl mi_\upl

   %74
   re_\upl mi_\upl re_\upl
   \slashedGrace fad? mi_\upl re_\upl mi_\upl
   re_\upl r <<re\f\\re>>

   %77
   sol16(fad) sol la si do
   re(do) si la sol la
   si (do) re8 re,

   %80
   <sol sol,> r re\p \mbreak
   \slashedGrace fad mi_\upl re_\upl mi_\upl
   re_\upl mi_\upl re_\upl

   %83
   \slashedGrace fad? mi_\upl re_\upl mi_\upl
   re_\upl r <<re\f\\re>>
   sol16(fad) sol la si do

   %86
   re(do) si la sol la
   si (do) re8 re,
   <sol sol,>4 r8

   %89
   sib4\p la8
   sol(la sib?)
   la\noBeam la(sol)

   %92
   \grace sol8 fad4.
   sol4 fa!8
   mib (re do)

   %95
   do do do
   do16(re mib re) do8\noBeam
   <mib' fad,>4.\f\mbreak

   %98
   re16(sib') la sol fad sol
   <mib fad,>4.\f
   re16(sib') la sol fad sol

   %101
   <mib fad,>4.
   re16(sib') la sol fad sol
   mib do sib sol' la, fad'

   %104
   <sol, sol,>4 r8
   sol\pp(la si!)
   do4.

   %107
   re
   \slashedGrace fa8 mi re do
   \slashedGrace do si la sol

   %110
   do4.
   re
   mi16(fa sol) mi do si

   %113
   la do sol do fa, do'\mbreak
   sol do fa, do' mi, do'
   <sol sol,>\f la si do re mi

   %116
   fa(re) si sol do8\noBeam
   R4.*2
   <sol sol,>16\f la si do re mi

   %120
   fa(re) si sol do8\noBeam
   do\p do do
   do4.

   %123
   si8 si si
   si4.
   la8 la la

   %126
   la4.
   sol8 sol sol
   sol4.\mbreak

   %129
   do'16\p do do do do do
   do do do do do do\<
   do do do do do do

   %132
   do do do do do do
   do\f\! do do do do do
   do do do do do do

   %135
   do\ff do do do do do
   si4 r8
   mi,8\p(fa) re\upl

   %138
   do4 do8
   \slashedGrace mi re do\upl re\upl
   re(mi) do\noBeam

   %141
   mi(fa) re\upl
   do4 do8
   \slashedGrace mi re do\upl re\upl\mbreak

   %144
   re(mi) do
   do'4.(
   si

   %147
   la
   sol)
   sol8 sol sol

   %150
   sol4.
   sol8 sol sol
   sol(la si)

   %153
   do4.(
   si
   la

   %156
   sol)
   sol8 sol sol
   sol4.

   %159
   sol8 sol sol\mbreak
   sol(la si)
   do16\f do do do do do

   %162
   do do do do do do
   do do do do do do
   do do do do do do

   %165
   do do do do do do
   do do do do do do
   si si si si si si

   %168
   do8 r sol,_\upl\p
   \slashedGrace si la_\upl sol_\upl la_\upl
   sol_\upl la_\upl  sol_\upl

   %171
   \slashedGrace si la_\upl sol_\upl la_\upl
   sol_\upl r sol\f
   do16(si) do re mi fa

   %174
   sol(fa) mi re do re
   mi fa sol8 sol,\mbreak
   <do mi,>8 r sol\p

   %177
   \slashedGrace si la_\upl sol_\upl la_\upl
   sol_\upl la_\upl  sol_\upl
   \slashedGrace si la_\upl sol_\upl la_\upl

   %180
   sol_\upl r <sol sol,>\f
   do16(si) do re mi fa
   sol(fa) mi re do re

   %183
   mi fa sol8 <sol, sol,>
   <do mi, sol,>4 r8

}


VvlIIn =\relative do'' {

   do4\p dod8
   re si sol
   mi4 fad8

   %7
   sol fa!16(mi fa re)
   <do' mi,>\f (si) do re mi fa
   sol(fa) mi re do re

   %7
   mi fa sol8 sol,
   do4 r8
   mi16 \solo\p fa sol mi la sol

   %10
   fa re sol fa mi re
   \slashedGrace re8 do\noBeam si16 do re la
   \slashedGrace do8 si\noBeam la16 sol la si

   %13
   do\tu\f  (si) do re mi fa
   sol(fa) mi re do re
   mi fa sol8 sol,

   %16
   do4 r8\mbreak
   R4.*2
   re,16\f(mi) fad sol la si

   %20
   do (la) fad re <sol sol,>8\noBeam
   mi'16\solo\p sol re sol la, sol'
   re sol do, sol' si, sol'

   %23
   re,\f\tu(mi) fad sol la si
   do (la) fad re <sol sol,>8\noBeam
   sol\pp sol sol

   %26
   sol4.
   fad8 fad fad
   fad?4.

   %29
   mi8 mi mi
   mi4.\mbreak
   re8 re re

   %32
   re4.
   sol16 sol sol sol sol sol
   la la la la la la\<

   %35
   sib sib sib sib sib sib
   si! si si si si si
   do\f\! do do do do do

   %38
   dod\ff dod dod dod dod dod
   do do do do do do
   <re re,>4 r8

   %41
   re,\p(mi) do_\upl
   si4 si8
   \slashedGrace re do si do

   %44
   do(re) si\noBeam
   re(mi) do\noBeam
   si4 si8

   %47
   \slashedGrace re do si do_\upl\mbreak
   do(re) si
   sol'4.\pp(

   %50
   fad
   mi
   re)

   %53
   do8 do do
   si4.
   do8 do do

   %56
   si8 r r
   sol'4.\parenthesize (
   fad

   %59
   mi
   re)
   do8 do do

   %62
   si4.
   do8 do do
   si r r

   %65
   sol'16\f sol sol sol sol sol\mbreak
   la la la la la la
   sib sib sib sib sib sib

   %68
   si! si si si si si
   do do do do do do
   si si si si si si

   %71
   la la la la la la
   sol8 r si,\p
   \slashedGrace re do_\upl si_\upl do_\upl

   %74
   si_\upl do_\upl si_\upl
   \slashedGrace re do_\upl si_\upl do_\upl
   si r <<re\f\\re>>

   %77
   sol16(fad) sol la si do
   re(do) si la sol la
   si (do) re8 re,

   %80
   <sol sol,> r re\p \mbreak
   \slashedGrace re do_\upl si_\upl do_\upl
   si_\upl do_\upl si_\upl

   %83
   \slashedGrace re do_\upl si_\upl do\upl
   si r <<re\f\\re>>
   sol16(fad) sol la si do

   %86
   re(do) si la sol la
   si (do) re8 re,
   <sol sol,>4 r8

   %89
   sib4\p la8
   sol(la sib?)
   la\noBeam la(sol)

   %92
   \grace sol8 fad4.
   sol4 fa!8
   mib (re do)

   %95
   do do do
   do16(re mib re) do8\noBeam
   <<do'4.\f\\la>>\mbreak

   %98
   sib16(re) do sib la sib
   <<do4.\f\\la>>
   sib16(re) do sib la sib

   %101
   <<do4.\f\\la>>
   sib16(re) do sib la sib
   do(la) sol sib fad la

   %104
   <sol sol,>4 r8
   sol\pp( la si)
   do4.

   %107
   re
   \slashedGrace fa8 mi re do
   \slashedGrace do si la sol

   %110
   do4.
   re
   mi8 r r

   %113
   R4.*2
   <sol, sol,>16\f la si do re mi
   fa(re) si sol do8\noBeam

   %117
   la16\p do sol do fa, do'
   sol do fa, do' mi, do'
   <sol sol,>16\f la si do re mi

   %120
   fa(re) si sol do8\noBeam
   do\p do do
   do4.

   %123
   si8 si si
   si4.
   la8 la la

   %126
   la4.
   sol8 sol sol
   sol4.\mbreak

   %129
   do16\p do do do do do
   re re re re re re\<
   mib mib mib mib mib mib

   %132
   mi! mi mi mi mi mi
   fa\f\! fa fa fa fa fa
   fad fad fad fad fad fad

   %135
   fad\ff fad fad fad fad fad
   sol4 r8
   sol,\p(la) fa_\upl

   %138
   mi4 mi8
   \slashedGrace sol fa_\upl mi_\upl fa_\upl
   fa(sol) mi\noBeam

   %141
   sol(la) fa\noBeam
   mi4 mi8
   \slashedGrace sol fa mi_\upl fa_\upl

   %144
   fa(sol) mi
   do'4.(
   si

   %147
   la
   sol)
   fa8 fa fa

   %150
   mi4.
   fa8 fa fa
   mi r r

   %153
   do'4.(
   si
   la

   %156
   sol)
   fa8 fa fa
   mi4.

   %159
   fa8 fa fa\mbreak
   mi r r
   do'16\f do do do do do

   %162
   re re re re re re
   mib mib mib mib mib mib
   mi! mi mi mi mi mi

   %165
   fa fa fa fa fa fa
   mi mi mi mi mi mi
   re re re re re re

   %168
   do8 r mi,\p
   \slashedGrace sol fa_\upl mi_\upl fa_\upl
   mi_\upl fa_\upl mi_\upl

   %171
   \slashedGrace sol fa_\upl mi_\upl fa_\upl
   mi8 r <sol sol,>\f
   do16(si) do re mi fa

   %174
   sol(fa) mi re do re
   mi fa sol8 sol,\mbreak
   <do mi,>8 r mi,\p

   %177
   \slashedGrace sol fa_\upl mi_\upl fa_\upl
   mi_\upl fa_\upl mi_\upl
   \slashedGrace sol fa_\upl mi_\upl fa_\upl

   %180
   mi8 r <sol sol,>\f
   do16(si) do re mi fa
   sol(fa) mi re do re

   %183
   mi fa sol8 <sol, sol,>
   <do mi, sol,>4 r8

}


Vvlan =\relative do' {

   R4.*4
   do16\f(si) do re mi fa
   sol(fa) mi re do re

   %7
   mi fa sol8 sol,
   do\noBeam sol'16\dolce(fa mi re)
   do8 r r

   %10
   R4.*3
   do16\f(si) do re mi fa
   sol(fa) mi re do re

   %15
   mi fa sol8 sol,
   do16(la') sol fa mi re\mbreak
   do8\p si la

   %18
   si la sol
   re'16\f(mi) fad sol la si
   do(la) fad re sol  si,

   %21
   do8\p(la) fa
   si la sol
   re'16\f(mi) fad sol la si

   %24
   do(la) fad re  sol8\noBeam
   si,\p si si
   do do do

   %27
   la la la
   si si si
   sol sol sol

   %30
   la la la\mbreak
   fad fad fad
   sol sol sol

   %33
   sol' sol sol
   sol4.
   sol \<

   %36
   sol
   sol8\f\! sol sol
   mi\ff mi mi

   %39
   mib mib mib
   re re'16\pp (do si la)
   sol sol sol sol sol  sol

   %42
   sol sol sol sol sol  sol
   sol sol sol sol sol  sol
   sol sol sol sol sol  sol

   %45
   sol sol sol sol sol  sol
   sol sol sol sol sol  sol
   sol sol sol sol sol  sol\mbreak

   %48
   sol sol sol sol sol  sol
   si,4.\pp
   la8 r r

   %51
   do4.(
   si
   la

   %54
   sol)
   la
   sol4 la8

   %57
   si4.
   la8 r r
   do4.(

   %60
   si
   la
   sol)

   %63
   la
   sol8 r r
   sol'\f sol sol\mbreak

   %66
   sol4.
   sol
   sol

   %69
   mi8 mi mi
   <<
      {
         la re, re
         re re re
      }\\{
         re re re
         re re re
      }
   >>

   %72
   sol16\p sol sol sol sol sol
   sol sol sol sol sol  sol
   sol sol sol sol sol  sol

   %75
   sol sol sol sol sol  sol
   sol8 si, re\f
   sol16(fad) sol la si do

   %78
   re(do) si la sol la
   si (do) re8 re,
   sol16\p sol sol sol sol sol\mbreak

   %81
   sol sol sol sol sol sol
   sol sol sol sol sol sol
   sol sol sol sol sol sol

   %84
   sol8 si, re\f
   sol16(fad) sol la si do
   re(do) si la sol la

   %87
   si (do) re8 re,
   <sol sol,>4 r8
   R4.

   %90
   mib4\p re8
   do(re mib)
   re\noBeam re(do)

   %93
   si!4.
   do4 sib8
   la(sol) fad

   %96
   fad fad fad
   fad16\f(sol la sol ) fad8\noBeam\mbreak
   sol8 r r

   %99
   fad\f fad fad
   sol r r
   fad\f fad fad

   %102
   sol r sol
   do re re
   sol fa!16\p (mi re do)

   %105
   si!8(la sol)
   sol16 sol sol sol sol sol
   sol sol sol sol sol sol
   
   %108
   sol sol sol sol sol sol
   sol' sol sol sol sol sol
   sol sol sol sol sol sol
   
   %111
   sol sol sol sol sol sol
   sol8 r r
   fa\upl mi\upl re\upl\mbreak
   
   %114
   mi re do
   sol16\f(la) si do re mi
   fa(re) si sol do mi
   
   %117
   fa8\p\upl mi\upl re\upl
   mi\upl re\upl do\upl
   sol16\f(la) si do re mi
   
   %120
   fa(re) si sol do re
   mi8\p mi mi
   fa8 fa fa 
   
   %123
   re re re 
   mi mi mi 
   do do do 
   
   %126
   re re re 
   si si si 
   do do do \mbreak
   
   %129
   do'8\p do do
   do4.
   do\<
   
   %132
   do
   do8\f\! do do
   la\ff la la
   
   %135
   lab lab lab
   sol\noBeam  sol16(fa mi re)
   do\p do do do do do
   
   %138
   do do do do do do
   do do do do do do
   do do do do do do
   
   %141
   do do do do do do
   do do do do do do
   do do do do do do\mbreak
   
   %144
   do do do do do do
   mi4.
   re8 r r
   
   %147
   fa4.(
   mi
   re
   
   %150
   do)
   re
   do4 re8
   
   %153
   mi4.
   re8 r r
   fa4.(
   
   %156
   mi
   re
   do)
   
   %159
   re\mbreak
   do8 r r
   do\f do do
   
   %162
   do4.
   do
   do
   
   %165
   la8 la la
   sol sol sol
   sol sol sol
   
   %168
   do16\p do do do do do
   do do do do do do
   do do do do do do
   
   %171
   do do do do do do
   do8 mi sol\f
   do,16(si) do re mi fa

   %174
   sol(fa) mi re do re
   mi fa sol8 sol,\mbreak
   do16\p do do do do do
   
   %177
   do do do do do do
   do do do do do do
   do do do do do do
   
   %180
   do8 mi sol\f
   do,16(si) do re mi fa
   sol(fa) mi re do re
   
   %183
   mi fa sol8 sol,
   <do do,>4 r8

}


VvcIn =\relative do {

   R4.*4
   <do do,>8\f <do do,> <do do,>
   <do do,>4 do16 re

   %7
   mi fa sol8 sol,
   <do do,>4 r8
   R4.*4

   %13
   <do do,>8\f <do do,> <do do,>
   <do do,>4 do16 re
   mi fa sol8 sol,

   %16
   <do do,>4 r8\mbreak
   R4.*2
   re16\f(mi) fad sol la si

   %20
   do (la) fad? re <sol sol,>8\noBeam
   R4.*2
   re16(mi) fad sol la si

   %24
   do (la) fad re <sol sol,>8\noBeam
   si,8\p r r
   do r r

   %27
   la r r
   si r r
   sol r r

   %30
   la r r\mbreak
   fad r r
   sol r r

   %33
   si si si
   do do do\<
   dod dod dod

   %36
   re re re
   mi \f\! mi mi
   mi\ff mi mi

   %39
   mib mib mib
   re\noBeam re'16(do) si! la
   sol8 r r

   %42
   sol,4.\p
   sol
   sol8 r r

   %45
   R4.
   sol
   sol\mbreak

   %48
   sol8 r r
   sol'\upl\noBeam\pp si(dod)
   re(la si)

   %51
   do(mi, fad)
   sol si sol
   fad(re fad)

   %54
   sol si sol
   fad(re fad)
   sol4 fad8

   %57
   mi(re dod)
   re_\upl la(si)
   do? mi,(fad)

   %60
   sol si sol
   fad(re fad)
   sol si sol

   %63
   fad(re fad)
   sol4 la8
   si\f si si\mbreak  %fine p.36

   %66
   do do do
   dod dod dod
   re re re

   %69
   mi mi mi
   re re re
   re, re re

   %72
   sol r r
   R4.*4
   <sol' sol,>8\f <sol sol,> <sol sol,>

   %78
   <sol sol,>4 sol,16 la
   si do re8[re,]
   sol4 r8

   %81
   R4.*4
   <sol' sol,>8\f <sol sol,> <sol sol,>
   <sol sol,>4 sol,16 la

   %87
   si do re8[re,]
   sol4 r8
   R4.

   %90
   \clef tenor mib''4\p re8
   do(re mib)
   re\noBeam re(do)

   %93
   si!4.
   do4 sib8
   la(sol) fad

   %96
   fad fad fad
   fad16\f(sol la sol ) fad8\noBeam\mbreak
   \clef bass sol,4 r8

   %99
   fad\f fad fad
   sol4 r8
   fad\f fad fad

   %102
   sol r sol
   do re re,
   sol4 r8

   %105
   R4.
   \clef tenor do'8\pp(re mi)
   fa4.

   %108
   mi8(fa sol)
   sol, la si
   do re mi

   %111
   fa4.
   mi4 r8
   \clef bass R4.*2

   %115
   sol,,16\f(la) si do re mi
   fa(re) si sol do8\noBeam
   R4.*2

   %119
   sol16(la) si do re mi
   fa(re) si sol  do[re]
   mi8\p r r

   %122
   fa r r
   re r r
   mi r r

   %125
   do r r
   re r r
   si r r

   %128
   do r r\mbreak
   mi8 mi mi
   fa fa fa\<

   %131
   fad fad fad
   sol\f\! sol sol
   la la la

   %134
   la, la la
   lab\ff lab lab
   sol r r

   %137
   R4.
   do\p
   do

   %140
   do8 r r
   R4.
   do

   %143
   do\mbreak
   do8 r r
   do\pp(mi fad)

   %146
   sol re mi
   fa!  la, si
   do mi do

   %149
   si(sol si)
   do mi do
   si(sol si)

   %152
   do do' si
   la(sol fad)
   sol re mi

   %155
   fa! la, si
   do mi do
   si(sol si)

   %158
   do mi do
   si(sol si)\mbreak
   do4 re8

   %161
   mi\f mi mi
   fa fa fa
   fad fad fad

   %164
   sol sol sol
   la la la
   sol sol sol

   %167
   sol, sol sol
   do r r
   R4.*4

   %173
   <do do,>8\f <do do,> <do do,>
   <do do,>4 do16 re
   mi fa sol8 sol,

   %176
   <do do,>4 r8\mbreak
   R4.*4
   <do do,>8\f <do do,> <do do,>

   %182
   <do do,>4 do16 re
   mi fa sol8 sol,
   <do do,>4 r8

}


VvcIIn =\relative do {

   R4.*4
   <do do,>8\f <do do,> <do do,>
   <do do,>4 do16 re

   %7
   mi fa sol8 sol,
   <do do,>4 r8
   R4.*4

   %13
   <do do,>8\f <do do,> <do do,>
   <do do,>4 do16 re
   mi fa sol8 sol,

   %16
   <do do,>4 r8\mbreak
   R4.*2
   re16\f(mi) fad sol la si

   %20
   do (la) fad? re <sol sol,>8\noBeam
   R4.*2
   re16(mi) fad sol la si

   %24
   do (la) fad re <sol sol,>8\noBeam
   si,8\p r r
   do r r

   %27
   la r r
   si r r
   sol r r

   %30
   la r r\mbreak
   fad r r
   sol r r

   %33
   si si si
   do do do\<
   dod dod dod

   %36
   re re re
   mi \f\! mi mi
   mi\ff mi mi

   %39
   mib,4.
   re8 r r
   R4.*8

   %49
   sol'8\upl\noBeam\pp si(dod)
   re(la si)

   %51
   do(mi, fad)
   sol si sol
   fad(re fad)

   %54
   sol si sol
   fad(re fad)
   sol4 fad8

   %57
   mi(re dod)
   re_\upl la(si)
   do? mi,(fad)

   %60
   sol si sol
   fad(re fad)
   sol si sol

   %63
   fad(re fad)
   sol4 la8
   si\f si si\mbreak  %fine p.36

   %66
   do do do
   dod dod dod
   re re re

   %69
   mi mi mi
   re re re
   re, re re

   %72
   sol r r
   R4.*4
   <sol' sol,>8\f <sol sol,> <sol sol,>

   %78
   <sol sol,>4 sol,16 la
   si do re8[re,]
   sol4 r8

   %81
   R4.*4
   <sol' sol,>8\f <sol sol,> <sol sol,>
   <sol sol,>4 sol,16 la

   %87
   si do re8[re,]
   sol4 r8
   R4.*8

   %97
   fad8\f fad fad\mbreak
   sol4 r8
   fad\f fad fad

   %100
   sol4 r8
   fad\f fad fad
   sol8 r sol

   %103
   do re re,
   sol4 r8
   sol'4\pp(fa!8)

   %106
   mi re do
   si sol si
   do(re mi)

   %109
   fa4.
   mi8 re do
   si sol si

   %112
   do4 r8
   R4.*2
   sol16\f (la) si do re mi

   %116
   fa(re) si sol do8\noBeam
   R4.*2
   sol16(la) si do re mi
   fa(re) si sol  do8\noBeam

   %121
   R4.*8\mbreak
   mi8 mi mi
   fa fa fa\<

   %131
   fad fad fad
   sol\f\! sol sol
   la la la

   %134
   la, la la
   lab\ff lab lab
   sol r r

   %137
   R4.*8
   do8\pp(mi fad)

   %146
   sol re mi
   fa!  la, si
   do mi do

   %149
   si(sol si)
   do mi do
   si(sol si)

   %152
   do do' si
   la(sol fad)
   sol re mi

   %155
   fa! la, si
   do mi do
   si(sol si)

   %158
   do mi do
   si(sol si)\mbreak
   do4 re8

   %161
   mi\f mi mi
   fa fa fa
   fad fad fad

   %164
   sol sol sol
   la la la
   sol sol sol

   %167
   sol, sol sol
   do r r
   R4.*4

   %173
   <do do,>8\f <do do,> <do do,>
   <do do,>4 do16 re
   mi fa sol8 sol,

   %176
   <do do,>4 r8\mbreak
   R4.*4
   <do do,>8\f <do do,> <do do,>

   %182
   <do do,>4 do16 re
   mi fa sol8 sol,
   <do do,>4 r8

}

forma = {

   \time 3/8
   \key do\major
   \tempo 2. = 40
   s4.*88
   \bar ":..:"\break
   s4.*96
   \bar ":|."

}


Vfl = {
   \Vglobal
   <<\Vfln \forma>>
}


VvlI = {
   \Vglobal
   <<\VvlIn \forma>>
}


VvlII = {
   \Vglobal
   <<\VvlIIn \forma>>
}


Vvla = {
   \Vglobal
   \clef alto
   <<\Vvlan \forma>>
}


VvcI = {
   \Vglobal
   \clef bass
   <<\VvcIn \forma>>
}


VvcII = {
   \Vglobal
   \clef bass
   <<\VvcIIn \forma>>
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
        title = \markup\smaller{Divertimento VI in Do maggiore}
        composer = \markup \center-column{"L. Boccherini (1743 -1805)"}
    }

    \markup\huge { [1.] Allegro moderato}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \Ifl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/1)
                \override SpacingSpanner.uniform-stretching = ##t
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [2.] Largo}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IIvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IIvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/1)
                \override SpacingSpanner.uniform-stretching = ##t
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [3.] Minuetto}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIIfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IIIvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IIIvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/1)
                \override SpacingSpanner.uniform-stretching = ##t
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [4.] Trio}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IVfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IVvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \IVvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \IVvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/1)
                \override SpacingSpanner.uniform-stretching = ##t
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge { [5.] Prestissimo}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Flauto"}
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \Vfl
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup \center-column\smaller{"Violini"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \VvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \VvlII
                >>

            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new PianoStaff <<

                \set PianoStaff.instrumentName = \markup  \center-column{"Violoncelli"}

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcI"
                    \VvcI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vcII"
                    \VvcII
                >>
            >>
        >>

        \layout {
            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/1)
                \override SpacingSpanner.uniform-stretching = ##t
                skipBars = ##t
            }

        }

        \midi {
            \context {
                \Voice
                \remove Dynamic_performer
            }
        }

    }

}