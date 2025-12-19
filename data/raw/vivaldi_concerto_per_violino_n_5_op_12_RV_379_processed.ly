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

Iglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \terzine\con
}

Ivln = \relative do'' {

    re16 mib fa
    sib,8 fa re' sib fa' fa, r16 re' mib fa
    sib,8 fa re' sib fa' fa, r16 sib' la sol
    fa8 re mib do \once \stemDown re sib, r16 fa'' sol lab\mbreak

    %4
    re,8 sib fa' re lab'4. sol16 fa
    sol8 \once\stemUp mib, r16 sol' la sib mi,8 do sol' mi
    sib'4. la16 sol la8 [fa,16 fa fa fa fa fa]

    %7
    mib'8 re4 do8 fa, [fa16 fa fa fa fa fa]
    sol'8 fa4 mib8 fa, [fa16 fa fa fa fa fa]\mbreak
    sib'8 la4 sol8 fa [mib16 re do8 sib16 la]

    %10
    sol8 fa4 mib16 re sol8 fa4 mib16 re
    fa'8 [mib16 re do8 sib16 la ]sol'8 fa4 mib16 re
    sol8 fa4 mib16 re sib'8 [fa mib16 re do mib]

    %13
    re8 [fa, mib16 re do mib] \once\stemUp re8 [ fa' mib16 re do mib]\mbreak
    re8 [fa, mib16 re do mib] <<{sib'8\solo [sib16 sib sib sib sib sib]}\\{fa8 [fa16 fa fa fa fa fa]}>>
    sib'8 la4 sol8 fa [mib16 re do8 sib16 la]

    %16
    <<{sib8 [sib16 sib sib sib sib sib]}\\{fa8 [fa16 fa fa fa fa fa]}>> re''8 do4 sib8
    la16 [sib do sib la sol fa mib] re (fa sib) do re8 do16 sib\mbreak
    fa'8 [mib16 (re) do(sib) la(sol)] fa2\tr

    %19
    r16 sib, re sib sib' sib, re sib fa'(re32 do sib16) re sib'(lab32 sol fa16) lab
    \once\stemDown sol mib, sol mib mib' mib, sol mib sib'(sol32 fa mib16) sol mib'(reb32 do sib16) reb\mbreak
    do^2 do mib do do' do, mib do sol'(mi32 re do16) mi do'(sib32 la sol16) sib

    %22
    \once\stemDown la fa, la fa fa' fa, la fa do'(la32 sol fa16) la fa'(mib32 re do16) mib
    re-2 re fa re re' re, fa re\mbreak la'(fad32 mi re16) fad re'(do32 sib la16) do
    sib-2 sib do sib mib sib do sib la-2 mib mib8\tr la16 mib mib8\tr

    %25
    re'16 la sib la re la sib la sol-2 re re8\tr sol16 re re8\tr
    do'16 sol la sol do sol la sol\mbreak fa-2 do do8\tr fa16 do do8\tr
    sib'16 fa sol fa sib fa sol fa <<{mi8 [mi16 mi mi mi mi mi]}\\{do8 [do16 do do do do do]}>>

    %28
    sib'8(la4) sol8 <<{mi, [mi16 mi mi mi mi mi]}\\{do8 [do16 do do do do do]}>>
    sib''8(la4) sol8 \tuplet 3/2 { sib16(la sol la[sol fa] sol fa mi fa[mi re)] }\mbreak
    do8 (mi sol) sib \tuplet 3/2 { la16(sol fa la[sol fa)] sol (fa mi sol[fa mi)] }

    %31
    fa(do sib la) fa'(do sib la )\tuplet 3/2 { la'(sol fa la[sol fa)] sol(fa mi sol[fa mi)] }
    \appoggiatura mi8 fa4 r16 la sib do fa,8 do la' fa
    do' do, r16 la' sib do fa,8 do la' fa

    %34
    do' do, r la' \once \stemDown sol  [do,,16 do do do do do]
    sib'8 la4 sol8 do, [do16 do do do do do]
    re'8 do4 sib8\mbreak do, [do16 do do do do do]

    %37
    fa'8 mi4 re8 do [do' sib16 la sol sib]
    la8 [do, sib16 la sol sib] \once\stemUp la8 [do'  sib16 la sol sib]
    la8 [do, sib16 la sol sib] la8 fa' fa8.\tr (mi32 fa)\mbreak

    %40
    sol8 do, sol'8.\tr(fa32 sol) la8 do, la'8.\tr(sol32 la)
    sib8 do, sib'8.\tr(la32 sib) do8 [fa mi16 re do sib]
    la sol fa8 r fa la,16(do fa) la sol8(fa16) mib

    %43
    mib(do re4) sol8\mbreak si,16(re sol) si la8(sol16) fa
    fa16(re mi4) la8 dod,16(mi la) dod_3 si8(la16) sol
    sol(mi fa4) sib8 re(sib4) la16_2 (sold)

    %46
    la(sold la4) la8 do(la4) sol?16_2(fad)
    sol(fad sol4) sol8\mbreak sib(sol4) fa?16 (mi)
    fa(mi fa4) fa8  \tuplet 3/2 { sib16(la sol la[sol fa] sol fa mi fa[mi re)] }

    %49
    dod la mi' dod la' mi dod la re la fad' re la' fad do? la
    sol re si' sol re' si fa re\mbreak do sol mi' do sol' mi sib sol
    la' fa do' la fa' do la' fa do'2_3~

    %52
    do8\noBeam \tuplet 3/2 { do16(sib la la[sol fa] mib! re mib) } re re fa re sib' fa re' sib
    lab2~lab8\noBeam \tuplet 3/2 { lab16^3(sol fa fa[mib re] re do si) }\mbreak
    do mib, sol mib do' sol mib' do fad2~

    %55
    fad8\noBeam \tuplet 3/2 { la16 (sol fad fad[mi re] do sib la) } re, (sib' sol') sib re,, (sib' sol') sib
    re,, (la' fad') la re,, (la' fad') la re,, (sib' sol') sib re,, (sib' sol') sib\mbreak
    <<{fad8 [re,16 re re re re re] }\\\stemUp \once \override Stem.transparent = ##t la'4\\\stemDown re,>>  do'8 sib4 la8

    %58
    re, [re16 re re re re re] mib'8 re4 do8
    re, [re16 re re re re re] sol'8 fad4 la8
    sib [re do16 sib la do] sib8 [re, do16 sib la do]\mbreak

    %61
    sib8 [re'  do16 sib la do] sib8 [re, do16 sib la do]
    sib (do32 re mib fa sol la) sib16 fa re sib  fa32(sol la sib do re mib16) fa mib re do
    sib (do32 re mib fa sol la sib16) fa re sib\mbreak do-2(re32 mib fa sol la sib do16) sol mib do

    %64
    re-2(mib32 fa sol la sib do re16) la fa re mib-2(fa32 sol la sib do re mib16) sib sol mib
    fa-2(sol32 la sib do re mib fa16) do la fa\mbreak re'8.(fa32 mib) mib4\tr
    re8 [(fa16 mib fa lab, sol fad)] sol8. (mib'32 _4 re) re4\tr

    %67
    do8[(mib16 re mib sol, fa mi)] fa8.(re'32_4 do) do4\tr
    si8[(re16 do re fa, mib? re)] mib-2(sol32 fa mib16) sol, mib'(sol32 fa mib16) sol,\mbreak
    la(do32 sib la16) fa do'(mib32 re do16) la re sib re fa sib re, mib fa

    %70
    sib,8 fa re' sib  fa' fa, r16 re' mib fa
    sib,8 fa re' sib fa' fa, r16 sib' la sol
    fa8 re mib do <<{s8 sib16 [sib sib sib sib sib]}\\{re8 [fa,16 fa fa fa fa fa]}>>\mbreak

    %73
    sib'8 la4 sol8 fa [mib16 re do8 sib16 la]
    <<{sib8 [sib16 sib sib sib sib sib]}\\{fa8 [fa16 fa fa fa fa fa]}>> re''8 do4 sib8
    la sol16 fa fa'8-4 mib16 re re4\tr do

    %76
    r2 fa16-4(re mib fa re lab sol fad)\mbreak
    sol(la sol fad sol la sol fad sol la sol fad sol4)
    mib'16(do re mib do sol fa mi) fa(sol fa mi fa sol fa mi

    %79
    fa sol fa mi fa4) re'16_4(sib do re sib fa mib? re)\mbreak
    mib(fa mib re mib fa mib re mib fa mib re mib4)
    do'16(sib do) re  sib(la sib) do la mib mib8\tr la16 mib mib8\tr

    %82
    do'16 mib, mib8\tr do'16 mib, mib8\tr re8 sib (re fa)\mbreak
    \tuplet 3/2 { sib16(la sol la[sol fa] sol fa mib fa[mib re)] mib(re do re[do sib] do sib la sib[la sol)] }
    fa8 (la do) do'  \tuplet 3/2 { re16(do sib re[do sib)] do(sib la do[sib la)] }

    %85
    sib fa mib re sib' fa mib re \tuplet 3/2 { re'(do sib re[do sib)] do(sib la do[sib la)] }
    sib [fa mib re do sib la sol] fa8 [fa16 fa fa fa fa fa]
    mib'8 re4 do8 fa, [fa16 fa fa fa fa fa]\mbreak

    %88
    sol'8 fa4 mib8 fa, [fa16 fa fa fa fa fa]
    sib'8 la4 sol8 fa [mib16 re do8 sib16 la]
    sol8 fa4 mib16 re sol8 fa4 mib16 re

    %91
    fa'8 [mib16 re do8 sib16 la] sol'8 fa4 mib16 re
    sol8 fa4 mib16 re sib'8 fa mib16 re do mib
    re8 fa, mib16 re do mib re8 \once\stemDown fa' mib16 re do mib\mbreak

    %94
    re8 fa, mib16 re do mib re2\fermata

}

IvlIn =  \relative do'' {

    re16 mib fa
    sib,8 fa re' sib fa' fa, r16 re' mib fa
    sib,8 fa re' sib fa' fa, r16 sib' la sol
    fa8 re mib do \once \stemDown re sib, r16 fa'' sol lab\mbreak

    %4
    re,8 sib fa' re lab'4. sol16 fa
    sol8 \once\stemUp mib, r16 sol' la sib mi,8 do sol' mi
    sib'4. la16 sol la8 [fa,16 fa fa fa fa fa]

    %7
    mib'8 re4 do8 fa, [fa16 fa fa fa fa fa]
    sol'8 fa4 mib8 fa, [fa16 fa fa fa fa fa]\mbreak
    sib'8 la4 sol8 fa [mib16 re do8 sib16 la]

    %10
    sol8 fa4 mib16 re sol8 fa4 mib16 re
    fa'8 [mib16 re do8 sib16 la ]sol'8 fa4 mib16 re
    sol8 fa4 mib16 re sib'8 [fa mib16 re do mib]

    %13
    re8 [fa, mib16 re do mib] \once\stemUp re8 [ fa' mib16 re do mib]\mbreak
    re8 [fa, mib16 re do mib] re4 r
    R1*3

    %18
    r2 do'8\p do do do
    fa, re re re re re re sib'
    sib sib sib sib sib sib sib sib

    %21
    do do do do sol sol sol sol\mbreak
    la la la la do do do do
    re re re re la la la la

    %24
    sol mib' mib mib mib mib mib mib
    re re re re re re re re
    do do do do do do do do\mbreak

    %27
    sib sib sib sib sib4 r
    sol'8\p sol sol sol r2
    sol8 sol sol sol r2

    %30
    sol8 sol sol sol r2
    fa8 fa fa fa r2\mbreak
    r4 r16 la\f sib do fa,8 do la' fa
    do' do, r16 la' sib do fa,8 do la' fa

    %34
    do' do, r la' \once \stemDown sol  [do,,16 do do do do do]
    sib'8 la4 sol8 do, [do16 do do do do do]
    re'8 do4 sib8\mbreak do, [do16 do do do do do]

    %37
    fa'8 mi4 re8 do [do' sib16 la sol sib]
    la8 [do, sib16 la sol sib] \once\stemUp la8 [do'  sib16 la sol sib]
    la8 [do, sib16 la sol sib] la4 r

    %40
    R1*9
    mi'4\p r fad r
    re r mi r

    %51
    do r do r
    do r re r
    re r fa r

    %54
    mib? r\mbreak do r
    do r sib r
    la r sib r

    %57
    la8\f[re,16 re re re re re] do'8 sib4 la8
    re, [re16 re re re re re] mib'8 re4 do8
    re, [re16 re re re re re] sol'8 fad4 la8
    sib [re do16 sib la do] sib8 [re, do16 sib la do]\mbreak

    %61
    sib8 [re'  do16 sib la do] sib8 [re, do16 sib la do]
    sib4 r r2
    R1*2

    %65
    r2 sib8\p sib do fa,
    sib sib sib sib mib, sol sib sol
    la la la la re, fa la fa

    %68
    sol sol sol sol do, do do do
    fa fa la,[la] sib4 r16 re' mib fa\mbreak

    %70
    sib,8 fa re' sib  fa' fa, r16 re' mib fa
    sib,8 fa re' sib fa' fa, r16 sib' la sol
    fa8 re mib do re4 r

    %73
    R1*3
    fa,16\p[fa fa fa fa fa fa fa] fa4 r\mbreak
    r2 mib8[mib16 mib mib mib mib mib]

    %78
    mib4 r r2
    re8[re16 re re re re re] re4 r
    r2 do8[do16 do do do do do]

    %81
    do4 r fa fa
    fa fa\mbreak sib,4 r
    R1

    %84
    do'8\p do do do re re do do
    re re re re re re do do
    sib16 \f [fa' mib re do sib la sol] fa8[fa16 fa fa fa fa fa]

    %87
    mib'8 re4 do8 fa, [fa16 fa fa fa fa fa]\mbreak
    sol'8 fa4 mib8 fa, [fa16 fa fa fa fa fa]
    sib'8 la4 sol8 fa [mib16 re do8 sib16 la]
    sol8 fa4 mib16 re sol8 fa4 mib16 re

    %91
    fa'8 [mib16 re do8 sib16 la] sol'8 fa4 mib16 re
    sol8 fa4 mib16 re sib'8 fa mib16 re do mib
    re8 fa, mib16 re do mib re8 \once\stemDown fa' mib16 re do mib\mbreak

    %94
    re8 fa, mib16 re do mib re2\fermata

}

IvlIIn = \relative do'' {

    r8 r16
    r4 r16 re mib fa sib,8 fa re' sib
    fa' fa, r16 re' mib fa sib,8 fa fa' mib
    re sib do la sib sib, r4

    %4
    r16 fa'' sol lab re,8 sib fa'[re fa mib16 re]
    mib8 mib, r4 r16 sol' la? sib mi,8 do
    sol'[mi sol fa16 mi] fa4 r

    %7
    fa,8[fa16 fa fa fa fa fa] mib'8 re4 do8\mbreak
    fa,8[fa16 fa fa fa fa fa] sol'8 fa4 mib8
    fa,8[fa16 fa fa fa fa fa] re'8[do16 sib la8 sol16 fa]

    %10
    mib8 re4 do16 sib mib8 re4 do16 sib
    re'8[do16 sib la8 sol16 fa] mib'8 re4 do16 sib
    mib8 re4 do16 sib fa'8 re do16 sib la do

    %13
    sib8[re, do16 sib la do] sib8[re' do16 sib la do]
    sib8[re, do16 sib la do] sib4 r
    R1*3

    %18
    r2 la'8\p la la la
    sib fa fa fa fa fa re re
    mib mib sol sol mib mib mib mib

    %21
    mib mib mib mib mi mi mi mi\mbreak
    do do do do fa fa fa fa
    fa fa fa fa fad fad fad fad

    %24
    re sib' sib sib do do do do
    la la la la sib sib sib sib
    sol sol sol sol la la la la\mbreak

    %27
    fa fa fa fa sol4 r
    mi'8\p mi mi mi r2
    mi8 mi mi mi r2

    %30
    mi?8 mi mi mi r2
    do8 do do do r2\mbreak
    r2 r4 r16 la'\f sib do

    %33
    fa,8 do la' fa do' do, r16 la' sib do
    fa,8 do la'[fa] mi4 r
    do,8[do16 do do do do do] sib'8 la4 sol8

    %36
    do,8[do16 do do do do do] re'8 do4 sib8
    do,8[do16 do do do do do] \once\stemUp do8[la'' sol16 fa mi sol]
    fa8[la, sol16 fa mi sol]\mbreak \once\stemUp fa8[la' sol16 fa mi sol]

    %39
    fa8[la, sol16 fa mi sol] fa4 r
    R1*9
    dod'4\p r\mbreak re r

    %50
    si r do r
    la r la r
    la r sib r

    %53
    sib r re r
    do r \mbreak la r
    la r sol r

    %56
    fad r sol r
    fad r re8\f[re16 re re re re re]
    do'8 sib4 la8 re,[re16 re re re re re]

    %59
    mib'8 re4 do8 re,[re16 re re re re re]\mbreak
    \once\stemUp re8[sib'' la16 sol fad la] sol8[sib, la16 sol fad la]
    sol8[sib' la16 sol fad la] sol8[sib, la16 sol fad la]

    %62
    sol4 r r2
    R1*2
    r2sib8\p sib do fa,

    %66
    sib sib sib sib mib, sol sib sol
    la la la la re, fa la fa
    sol sol sol sol do, do do do

    %69
    fa fa la,[la] sib4 r
    r r16 re' mib  fa sib,8 fa re'[sib]
    fa' fa, r16 re' mib fa sib,8 fa fa' mib

    %72
    re sib do la sib4 r
    R1*3
    fa16\p[fa fa fa fa fa fa fa] fa4 r\mbreak

    %77
    r2 mib8[mib16 mib mib mib mib mib]
    mib4 r r2
    re8[re16 re re re re re] re4 r
    r2 do8[do16 do do do do do]

    %81
    do4 r fa fa
    fa fa\mbreak sib,4 r
    R1

    %84
    la'8\p la la la sib sib la la
    sib sib sib sib sib sib la la
    sib16\f[fa' mib re do sib la sol] fa4 r

    %87
    fa8[fa16 fa fa fa fa fa] mib'8 re4 do8\mbreak
    fa,8[fa16 fa fa fa fa fa] sol'8 fa4 mib8
    fa,8[fa16 fa fa fa fa fa] re'8[do16 sib la8 sol16 fa]

    %90
    mib8 re4 do16 sib mib8 re4 do16 sib
    re'8[do16 sib la8 sol16 fa] mib'8 re4 do16 sib
    mib8 re4 do16 sib fa'8[re do16 sib la do]

    %93
    sib8 re, do16 sib la do sib8 re' do16 sib la do
    sib8 re, do16 sib la do sib2\fermata

}

Ivlan =  \relative do' {

    r8 r16
    r re mib fa fa8 re r16 re mib fa fa8 re
    r16 re mib fa fa8 re r16 re mib fa fa8 sol
    re fa sol fa fa16 re  mib fa fa8 re

    %4
    fa4 fa re16 re mib fa re8 re
    sib16 mib fa sol sol8 mib sol4 sol
    mi16 mi fa sol mi8 mi do4 fa8 fa

    %7
    do' sib4 la8 do sib4 la8\mbreak
    mib' re4 do8 mib re4 do8
    re do4 sib8 sib sib, sib sib

    %10
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib16 re mib fa sol8 la

    %13
    fa fa, sol la fa16 re' mib fa sol8 la
    fa fa, sol la fa4 r\mbreak
    R1*3

    %18
    r2 fa'8\p fa  mib mib
    re sib sib sib sib sib sib sib
    mib, mib mib mib sol sol sol sol

    %21
    lab lab lab lab do do do do\mbreak
    fa, fa fa fa la? la la la
    sib sib sib sib re re re re

    %24
    sol, sol' sol sol fad fad fad fad
    fa! fa fa fa mi mi mi mi
    mib! mib mib mib re re re re\mbreak

    %27
    re re re re do4 r
    do'8\p do do do r2
    do8 do do do r2

    %30
    do8 do do do r2
    la8 la la la r2\mbreak
    r r16 la\f sib do do8 la

    %33
    r16 la sib do do8 la r16 la sib do do8 la
    r16 la sib do do8 do do4 r
    sol8 fa4 mi8 sol8 fa4 mi8

    %36
    sib' la4 sol8 sib la4 sol8
    la sol4 fa8 fa16 la sib do re,8 mi
    do16 la sib do re8 mi\mbreak do16 la' sib do re,8 mi

    %39
    do16 la sib do re8 mi do4 r
    R1*9
    la'4\p r\mbreak la r

    %50
    sol r sol r
    fa r fa r
    fa r fa r

    %53
    fa r re r
    sol r\mbreak fad r
    fad? r re r

    %56
    re r re r
    re r la'8\f sol4 fad8
    la sol4 fad8 do' sib4 la8

    %59
    do sib4 la8 sib la4 fad8\mbreak
    re re r re re re r re
    re re r re re re r re

    %62
    re4 r r2
    R1*7
    r16 re mib fa fa8 re r16 re mib fa fa8 re

    %71
    r16 re mib fa fa8 re r16 re [mib fa fa8 sol]
    re fa sol fa fa4 r
    R1*3

    %76
    fa8\p fa fa fa fa4 r
    r2 mib8 mib mib mib
    mib4 r r2
    re8 re re re re4 r

    %80
    r2 do8 do do do
    do4 r fa fa
    fa fa\mbreak sib, r

    %83
    sib r r2
    fa'8 fa fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa

    %86
    sib,4 r fa'8\f fa fa fa
    do' sib4 la8 do sib4 la8\mbreak
    mib' re4 do8 mib re4 do8

    %89
    re do4 sib8 sib sib, sib sib
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib

    %92
    sib sib sib sib sib16 re mib fa sol8 la
    fa fa, sol la fa16 re' mib fa sol8 la
    fa fa, sol la fa2\fermata

}

Ibcn = \relative do {

    r8 r16
    r16 sib' do re sib8 sib, r16 sib' do re sib8 sib,
    r16 sib' do re sib8 sib, r16 sib' do re sib8 mib,
    sib' sib, mib fa sib,16 sib' do re sib8 sib,

    %4
    sib4 sib sib16 sib' do re sib8 sib,
    mib16 do' re mib do8 do, do4 do
    do16 do' re mi do8 do, fa fa fa fa

    %7
    fa fa fa fa fa fa fa fa\mbreak
    fa fa fa fa fa fa fa fa
    fa[fa fa16 fa sol la] sib8 sib, sib sib

    %10
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib16 sib' do re mib,8 fa

    %13
    sib,16 sib do re mib,8 fa sib16 sib' do re mib,8 fa
    sib,16 sib do re mib,8 fa sib sib sib sib
    sib[do16 re mib fa sol la] sib8 re, mib fa\mbreak

    %16
    sib, sib sib sib sib16[do re mib fa sol la sib]
    fa4~fa16 fa sol la sib4. la16 sol
    fa4 r r2

    %19
    R1*8
    r2 do8^\p do do do
    r2 do8 do do do

    %29
    r2 do8 do do do
    r2 fa8 fa do do
    fa,4 r fa'8 fa do do\mbreak

    %32
    fa,4 r r16 fa'\f sol la fa8 fa,
    r16 fa' sol la fa8 fa, r16 fa' sol la fa8 fa,
    r16 fa' sol la fa8 fa, do' do do do

    %35
    do do do do do do do do
    do do do do do do do do
    do do do do fa16 fa sol la sib,8 do

    %38
    fa,16 fa' sol la sib,8 do\mbreak fa,16 fa' sol la sib,8 do
    fa,16 fa' sol la sib,8 do fa sol la fa
    do re mib do fa sol la fa

    %41
    re do re sib fa'[la16 sib do8 do,]
    fa sol la sol fa4 la
    sib8 la sib sib, sol'4 si

    %44
    do8 si do do,\mbreak la'4 dod
    re8 dod re re, re'4 re
    dod dod, do'! do

    %47
    si si, sib' sib
    la la, sol' sol,
    la  r\mbreak  re r

    %50
    sol, r do r
    fa, r fa'8 sol la sol  %%%%% fin qui OK
    fa4 r sib, r

    %53
    sib8 do re do si4 r
    do r\mbreak re8 mi fad mi
    re4 r sol, r

    %56
    re' r sol, r
    re'8 re re re re re re re
    re re re re re re re re

    %59
    re re re re re re re re\mbreak
    sol,16 sol' la sib do,8 re sol,16 sol' la sib do,8 re
    sol,16 sol' la sib do,8 re sol,16 sol' la sib do,8 re

    %62
    sol4 r la r
    sol r la r
    sib r do r\mbreak

    %65
    re r r2
    R1*4\mbreak
    r16 sib do re sib8 sib, r16 sib' do re sib8 sib,

    %71
    r16 sib' do re sib8 sib, r16 sib' do re sib8 mib,
    sib' sib, mib fa sib, sib sib sib
    sib[do16 re mib fa sol la] sib8 re, mib fa

    %74
    sib, sib sib sib sib16[do re mib fa sol la sib]
    fa8sol la sib fa mib fa fa,
    fa'\p fa fa fa fa4 r\mbreak

    %77
    r2 mib8 mib mib mib
    mib4 r r2
    re8 re re re re4 r

    %80
    r2 do8 do do do
    do4 r fa fa
    fa fa\mbreak sib, r

    %83
    sib r r2
    sib4 r r2
    R1

    %86
    sib4 r fa'8 fa fa fa
    fa fa fa fa fa fa fa fa\mbreak
    fa fa fa fa fa fa fa fa

    %89
    fa[fa fa16 fa sol la] sib8 sib, sib sib
    sib sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib

    %92
    sib sib sib sib sib16 sib' do re mib,8 fa
    sib,16 sib do re mib,8 fa sib16 sib' do re mib,8 fa
    sib,16 sib do re mib,8 fa sib2_\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8.
    s1*2
    s2 s4 s8 <7->
    s1
    s2
    <7 _!>
    s1
    <7 5>8 <6 4> s <5 3> <7 5> <6 4> s <5 3>
    <9 7> <8 6> s <7 5> <9 7> <8 6> s <7 5>
    <6 4> <5 3> s4 s2
    <6 4>8 <5 3> s s <6 4> <5 4> s s
    s2 <6 4>8 <5 3> s s
    <6 4> <5 3> s4 s2
    s1*14
    s2 <_!>
    s1*7
    <7 5>8 <6 4> s <5 3!> <7 5>8 <6 4> s <5 3!>
    <9 7> <8 6> s <7 5> <9 7> <8 6> s <7 5>
    <6 4> <5 3!> s4 s2
    s1*3
    <6>1
    s2 s4 <7 5>
    <5 4> <3> <_!> <7 5>
    <5 4> <3!> <_+> <7>
    <5 4> <3> <6> <6 4+>
    s2 s4 <6 4+>
    s2 s4 <6 4>
    s1
    <_+>2 <_+>
    <_!> <_!>
    s1*2
    <7->2 <7->
    s <7 _+>
    s1
    <_+>
    <_+>2 <7 5>8 <6 4> s <5 3+>
    <7 5>8 <6 4> s <5 3+> <9 7> <8 6> s <7 5>
    <9 7> <8 6> s <7 5> <6 4> <5 3+> s <3+>
    s1*15
    s2 <6 4>4 <5 3>
    s1*11
    <7 5>8 <6 4> s <5 3> <7 5>8 <6 4> s <5 3>
    <9 7> <8 6> s <7 5> <9 7> <8 6> s <7 5>
    <6 4> <5 3> s4 s2
    <6 4>8 <5 3> s s <6 4> <5 3> s s
    s2 <6 4>8 <5 3> s s
    <6 4>8 <5 3>

}

forma = {

    \key sib\major
    \time 4/4
    \tempo 2 = 53
    \partial 8. s8.
    s1*94
    \bar"|."

}

Ivl = {
    \Iglobal
    \notypeset
    <<\Ivln \forma>>

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
    \typeset

}

IIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto
}

IIvln = \relative do'' {

    fa8. [re16 fa8. re16 fa8. re16]
    do8. fa,16  \tuplet 3/2 { do'8(sib la) do[(sib la)] }
    fa'8. [re16 fa8. re16 fa8. re16]

    %4
    do8. fa,16  \tuplet 3/2 { do'8(sib la) do[(sib la)] }
    fa'8.[sol16 sol8. lab16 lab8. sol16]
    sol4~sol8. [fa16 mib8. re16]

    %7
    do4~do8.[sib16 la8. sol16]
    fa4~fa8.[fa'16 sol8. la16]
    sib8. re,16 do4.\tr sib8\mbreak

    %10
    sib16 sib \appoggiatura do8 sib32[la sib16] fa' sib, \appoggiatura do8 sib32[la sib16]  fa' sib, \appoggiatura do8 sib32[la sib16]
    sib'4 la8.[sol16 fa8. mib16]
    re16 sib \appoggiatura do8 sib32[la sib16] fa' sib, \appoggiatura do8 sib32[la sib16]  fa' sib, \appoggiatura do8 sib32[la sib16]

    %13
    sol'8.[fa16 mib8. re16] do8(re16 mib)
    \appoggiatura sib8 la4. sol8 fa4
    fa'16 sib, \appoggiatura do8 sib32[la sib16] fa' sib, \appoggiatura do8 sib32[la sib16]  fa' sib, \appoggiatura do8 sib32[la sib16]

    %16
    lab'4(sol) fad\mbreak
    sol16 sib, \appoggiatura re8 do32[(sib do16)] sol'16 sib, \appoggiatura re8 do32[(sib do16)] sol'16 sib, \appoggiatura re8 do32[(sib do16)]
    sib'4(la) sold

    %19
    la16 re, \appoggiatura mib8 re32[(do re16)] la'16 re, \appoggiatura mib8 re32[(do re16)] la'16 re, \appoggiatura mib8 re32[(do re16)]
    do'4(sib) la
    sib16 la(sol) fa(mi) re(dod) si(la) sol(fad sol)

    %22
    \terzine sol4~\tuplet 3/2 {
        sol16(mi' re dod[si la)] sol'(sib la sol[fa mi)]
        fa(la sol fa[mi re)]
    } mi4.\tr re8\mbreak
    re8. fa16 la8.[fa16 la8. fa16]

    %25
    mi8. la,16 \terzinequarto \tuplet 3/2 { mi'8(re dod) mi[(re dod)] }
    sol'4~sol8.[fa16 mi8. re16]
    dod4~dod8.[si16 la8. sol16]

    %28
    fa8. re'16 dod4.\tr re8
    \terzine\senza \tuplet 3/2 {
        re16(dod si la[si dod] re mi fa sol[fa mi] la sol fa mi[fa re)]
        dod(mi re dod[si  la] sol la si dod[re mi] fa sol la sib [la sol)]

        %31
        fa (la sol fa[mi re] dod si la sol[fa mi] fa mi re fa[mi re)]
    }
    la'4 \tuplet 3/2 {
        r16 la (si dod[re mi] fa sol la sib[la sol)]
        fad(la sol fad[mi re] do? mib re do[sib la] fad' sol la do,[si la)]

        %34
        si (re do si[la sol] fa lab sol fa[mib re] si' do re fa,[mib re)]
        mib(fa sol la[si do] re mib fa sol[fa mib] mib re do mib[fa sol)]\mbreak
        la(sol fa mib[re do] sib la sol fa[sol la] sib do re mib[re do)]
    }

    %37
    re16 sib \appoggiatura do8 sib32[la sib16] fa' sib, \appoggiatura do8 sib32[la sib16]  fa' sib, \appoggiatura do8 sib32[la sib16]
    \tuplet 3/2 { la'(sol fa mib[re do] sib la sol fa[sol la] sib do re mib[re do)]}
    re16 sib \appoggiatura do8 sib32[la sib16] fa' sib, \appoggiatura do8 sib32[la sib16]  fa' sib, \appoggiatura do8 sib32[la sib16]

    %40
    sib'8. sib,16 <<{do4.\tr sib8}\\fa2>>\mbreak
    sib8.[sol'16 sol8. lab16 lab8. sol16]
    sol4~sol8. [fa16 mib8. re16]

    %43
    do4~do8.[sib16 la8. sol16]
    fa4~fa8.[fa'16 sol8. la16]
    sib8. re,16 do4.\tr sib8

    %46
    sib2.\fermata

}

IIvlIn =  \relative do'' {

    fa8. [re16 fa8. re16 fa8. re16]
    do8. fa,16  \tuplet 3/2 { do'8(sib la) do[(sib la)] }
    fa'8. [re16 fa8. re16 fa8. re16]

    %4
    do8. fa,16  \tuplet 3/2 { do'8(sib la) do[(sib la)] }
    fa'8.[sol16 sol8. lab16 lab8. sol16]
    sol4~sol8. [fa16 mib8. re16]

    %7
    do4~do8.[sib16 la8. sol16]
    fa4~fa8.[fa'16 sol8. la16]
    sib8. re,16 do4.\tr sib8\mbreak

    %10
    sib4 r r
    R2.*13
    la'8.[fa16] la8.[fa16 la8. fa16]

    %25
    mi8. la,16 \terzinequarto \tuplet 3/2 { mi'8(re dod) mi[(re dod)] }
    sol'4~sol8.[fa16 mi8. re16]
    dod4~dod8.[si16 la8. sol16]

    %28
    fa8. re'16 dod4.\tr re8
    re4 r r
    R2.*11

    %41
    fa8.[sol16 sol8. lab16 lab8. sol16]
    sol4~sol8. [fa16 mib8. re16]

    %43
    do4~do8.[sib16 la8. sol16]
    fa4~fa8.[fa'16 sol8. la16]
    sib8. re,16 do4.\tr sib8

    %46
    sib2.\fermata

}

IIvlIIn = \relative do'' {

    re8.[sib16 re8. sib16 re8. sib16]
    la8. la16 \tuplet 3/2 { la8(sol fa) la](sol fa)] }
    re'8.[sib16 re8. sib16 re8. sib16]

    %4
    la8. la16 \tuplet 3/2 { la8(sol fa) la](sol fa)] }
    re'8.[mib16 mib8. fa16 fa8. mib16]
    mib4~mib8.[re16 do8. sib16]

    %7
    la4~la8.[sol16 fa8.  mib16]
    re4~re8.[re'16 mib8. fa16]
    fa8. sib,16 la4.\tr sib8\mbreak

    %10
    sib4 r r
    R2.*13
    fa'8. [re16] fa8.[re16 fa8. re16]

    %25
    dod8. dod16 \tuplet 3/2 { dod8(si la) dod[(si la)] }
    mi'4~mi8.[re16 dod8. si16]
    la4~la8.[sol16 fa8. mi16]

    %28
    re8. fa16 mi4. re8
    re4 r r
    R2.*11

    %41
    re'8.[mib16 mib8. fa16 fa8. mib16]
    mib4~mib8.[re16 do8. sib16]
    la4~la8.[sol16 fa8. mib16]

    %44
    re4~re8.[re'16 mib8. fa16]
    fa8. sib,16 la4.\tr sib8
    sib2.\fermata

}

IIvlan =  \relative do' {

    re4 re8. do16 re4
    fa fa fa
    fa re8. do16 re4

    %4
    fa fa fa
    fa2 re4
    sib4~sib8.[sol'16 la8. sib16]

    %7
    fa4~fa8.[la,16 sib8. do16]
    re8.[re16] do8.[sib16 la8. sol16]
    \once\stemUp fa8. sol'16 do,4~do8 fa\mbreak

    %10
    re4 r r
    R2.*13
    la'4 la8. sol16 la4

    %25
    la la la
    dod, dod8.[re16 mi8. mi16]
    mi?4 mi8.[dod16 re8. mi!16]

    %28
    la,4  la la
    la r r
    R2.*11

    %41
    fa'2 re4
    sib4~sib8.[sol'16 la8. sib16]
    fa4~fa8.[la,16 sib8. do16]

    %44
    re8.[re16] do8.[sib16 la8. sol16]
    \once\stemUp fa8. sol'16 do,4. fa8
    re2.\fermata

}

IIbcn = \relative do {

    sib4 sib'8. la16 sib4
    fa, fa'8. mib16 fa4
    sib, sib'8. la16 sib4

    %4
    fa, fa'8. mib16 fa4
    sib,2.
    mib4 mib,8. [mib'16 fa8. sol16]

    %7
    la4 fa,8.[fa'16 sol8. la16]
    sib8.[sib16 la8. sol16 fa8. mib16]
    re8. mib16 fa4 fa,\mbreak

    %10
    sib8_\markup\italic "Violon[cel]lo Solo" re sib re sib re
    sib4 fa'2
    sib,8 re sib re sib re

    %13
    mib2 mib4
    fa8 la fa la fa la
    sib, re sib re sib re

    %16
    sib2 r4\mbreak
    mib8 mib do mib do mib
    do2 r4

    %19
    fa8 fa re fa re fa
    re2 r4
    sol2.

    %22
    la4 la, dod
    re la' la,\mbreak
    re, re'8.\tu do16 re4

    %25
    la la' la,
    la' la,8.[fa'16 sol8. sold16]
    la4 la,8.[la16 si8. dod16]

    %28
    re4 la' la,
    re8 la'_\markup\italic "Violon[cel]lo Solo" fa [mi fa sol]
    la la, dod la re dod\mbreak

    %31
    re, re' la dod re sol,
    la la' dod, la re[sol]
    re re' la fad re[fad]

    %34
    sol, sol' re si sol[si]
    do do' si sol do do,\mbreak
    fa la, sib re sib la

    %37
    sib re sib re sib re
    fa la, sib re sib la
    sib re sib re sib re

    %40
    sib4 fa' fa,\mbreak
    sib2.\tu
    mib4 mib,8.[mib'16 fa8. sol16]

    %43
    la4 fa,8.[fa'16 sol8. la16]
    sib8.[sib16 la8. sol16 fa8. mib16]
    re8. mib16 fa4 fa,

    %46
    sib2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*4
    <7->2.
    s2.*12
    <_!>2.
    s
    <_+>
    s2.*4
    <_+>2.
    <7>
    s2.*16
    s2 s8. <7>16

}

forma = {

    \key sib\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 4 =55
    s2.*46
    \bar"|."

}

IIvl = {
    \IIglobal
    \notypeset
    <<\IIvln \forma>>

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
    \typeset

}

IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

IIIvln = \relative do'' {

    r8 fa fa fa fa fa
    sib[la16 sol fa mib re do] sib8 la
    sib fa' fa fa fa fa

    %4
    sib[la16 sol fa mib re do] sib8 la
    sib fa' fa fa fa mi
    fa mi16 re do sib la sol fa8 mi

    %7
    fa do' do do do do
    fa mi16 re do sib la sol fa8 mi\mbreak
    fa fa' la fa la fa

    %10
    sib re,4 mib re16 do
    la'8 do,4 re do16 sib
    sol'8 sib,4 do sib16 la

    %13
    fa'8 la,4 sib la16 sol
    mib'8 mib mib mib mib mib
    la[sol16 fa mib re do sib] la8 sol

    %16
    fa mib' mib mib mib mib
    la[sol16 fa mib re do sib] la8 sol
    fa8[mib' mib mib mib re16 do]\mbreak

    %19
    re8 re16 do re8 fa,16 mib fa8 re16 do
    re8 re'16 do re8 fa,16 mib fa8 re16 do
    re8 sib' sib16\solo[(do re) mib fa sol la sib]

    %22
    fa8 re sib fa re sib
    re fa sib16[(do re) mib fa sol la sib]
    fa8 re sib fa re sib

    %25
    re fa sib16[(do re) mib fa sol la sib]
    la fa la fa do la do la fa4
    re'16-2(fa sib do re4) sib
    mib,16-2(sol do re mib4) do

    %29
    fa,16-2(la re mib fa4) re
    do16(re mib) re do re mib re do la sol la
    sib-2(do re) do sib do re do sib sol fa sol

    %32
    la-2(sib do) sib la sib do sib la fa mi fa
    sib-4 sol fa mi la fa mi re sol mi re do
    fa re do sib mi do sib la re sib la sol\mbreak

    %35
    do la sol fa sib sol fa mi la fa mi re
    do (re mi) mi mi(fa sol) sol sol(la sib) do
    do(re mi) mi mi(fa sol) sol sol(la sib) sib

    %38
    la8[(sol16 fa mi8 re do sib)]
    la16(sol' fa mi) sib(la' sol fa) do(sib' la sol)
    fa8[(mi16 re do8 sib la sol)]

    %41
    la16(sol' fa mi) sib(la' sol fa) do(sib' la sol)\mbreak
    fa8 do do do do do
    fa[mi16 re do sib la sol] fa8 mi

    %44
    fa do' do do do do
    fa[mi16 re do sib la sol] fa8 mi
    fa do'  re re do do

    %47
    sib re re re re re
    sol[fa16 mi re do sib la] sol8 fad
    sol re' re re re re\mbreak

    %50
    sol[fa16 mi re do sib la] sol8 fad
    sol sol' sib sol sib sol
    sib mib,4 do la'8~

    %53
    la re,4 sib sol'8~
    sol do,4 la fad'8
    sol sol16 fad sol8 sib,16 la sib8 sol16 fad

    %56
    sol8 sol'16 fad sol8 sib,16 la sib8 sol16 fad
    sib sol sol, sol' sib sol sol, sol' sib sol sol, sol'
    re' sib sol, sib' re sib sol, sib' re sib sol, sib'\mbreak

    %59
    sol'-4 sib, sol, sib' sol'  sib, sol, sib' sol' sib, sol, sib'
    mib-2 do sol, do' mib do sol, do' mib do sol, do'
    re-2 do sol, do' re do sol, do' re do sol, do'

    %62
    re-2 sib sol, sib' re sib sol, sib' re sib sol, sib'
    do-2 sol sol, sol' do sol sol, sol' do sol sol, sol'
    do fad, sol, fad' do' fad, sol, fad' do' fad, sol, fad'

    %65
    sib sol sol, sol' sib sol sol, sol' sib sol sol, sol'\mbreak
    dod sol la, sol' dod sol la, sol' dod sol la, sol'
    sol' dod, mi, dod' sol' dod, mi, dod' sol' dod, mi, dod'

    %68
    fa re re, re' fa re re, re' fa re re, re'
    la' fa re, fa' la fa re, fa' la fa re, fa'
    re' fa, re, fa' re' fa, re, fa' re' fa, re, fa'

    %71
    sib sol re, sol' sib sol re, sol' sib sol re, sol'
    la sol re, sol' la sol re, sol' la sol re, sol'\mbreak
    la fa re, fa' la fa re, fa' la fa re, fa'

    %74
    sol re re, re' sol re re, re' sol re re, re'
    sol dod, re, dod' sol' dod, re, dod' sol' dod, re, dod'
    fa re re, re' fa re re, re' fa re re, re'

    %77
    la8 la la la la la
    re[do16 sib la sol fa mi] re8 dod
    re la' la la la la

    %80
    re[do16 sib la sol fa mi] re8 dod
    re16 fa la re re, fa la re\mbreak re, fa la re
    la re fa la la, re fa la la, re fa la

    %83
    re, fa la re re, fa la re re, fa la re
    la, dod mi la la, dod mi la la, dod mi la
    la, dod mi sol la, dod mi sol la, dod mi sol

    %86
    \set Staff.ottavation = #"8va alta" re,-2 fad la re re, fad la re re, fad la re
    re, fad la do re, fad la do re, fad la do\mbreak
    sol,-2 si re sol sol, si re sol sol, si re sol

    %89
    sol, si re fa sol, si re fa sol, si re fa
    do-2 mi sol do do, mi sol do do, mi sol do
    do,-2 mi sol sib do, mi sol sib do, mi sol sib\unset Staff.ottavation

    %92
    fa-2 la do fa fa, la do fa fa, la do fa
    fa, la do mib! fa, la do mib\mbreak fa, la do mib
    sib-2 re fa sib sib, re fa sib sib, re fa sib

    %95
    sib, re fa lab sib, re fa lab sib, re fa lab
    sol8 sib, sib sib sib sib
    mib[re16 do sib lab sol fa] mib8 re

    %98
    mib sib' sib sib sib sib
    mib[re16 do sib lab sol fa] mib8 re
    mib8 mib' mib mib mib mib\mbreak

    %101
    re fa fa fa fa fa
    sib[la16 sol fa mib re do] sib8 la
    sib fa' fa fa fa fa

    %104
    sib[la16 sol fa mib re do] sib8 la
    sib sib sib16[(do re) mib fa sol la sib]
    fa8 re sib fa re sib

    %107
    re fa sib16[(do re) mib fa sol la sib]
    la fa la fa do la do la fa4
    fa'16 sib, la sib re, sib' la sib re, sib' la sib\mbreak

    %110
    fa' sib, la sib re, sib' la sib re, sib' la sib
    sib mib, re mib sol, mib' re mib sol, mib' re mib
    sib' mib, re mib sol, mib' re mib sol, mib' re mib

    %113
    sol' do, si do mi, do' si do mi, do' si do
    sol' do, si do mi, do' si do mi, do' si do
    do fa, mi fa la, fa' mi fa la, fa' mi fa

    %116
    do' fa, mi fa la, fa' mi fa la, fa' mi fa\mbreak
    la' re, dod re fad, re' dod re fad, re' dod re
    la' re, dod re fad, re' dod re fad, re' dod re

    %119
    re sol, fa? sol sib, sol' fa sol sib, sol' fa sol
    re' sol, fa sol sib, sol' fa sol sib, sol' fa sol
    sib' mib, re mib sol, mib' re mib sol, mib' re mib

    %122
    sib' mib, re mib sol, mib' re mib sol, mib' re mib
    do' mib, re mib la, mib' re mib la, mib' re mib\mbreak
    do' mib, re mib la, mib' re mib la, mib' re mib

    %125
    re4 r32 sib(do re mib fa sol la) sib8 fa
    sol16-2(fa sol) la la-2(sol la) sib sib-2(la sib) do
    do-3(sib do) re re-3(do re) mib mib-3(re mib) fa

    %128
    fa-3(mib fa) sol sol-3(fa sol) la la-3(sol la) sib
    sib4 r16 fa-2 fa fa sib-4 fa fa fa
    sib fa fa fa re fa fa fa sib fa fa fa

    %131
    sib-4 fa fa fa do-2 fa fa fa sib fa fa fa
    sib fa fa fa do fa fa fa sib fa fa fa\mbreak
    la-3 fa fa fa do-2 fa fa fa la-2 fa fa fa

    %134
    la-3 fa fa fa do-2 fa fa fa la-2 fa fa fa
    sib8-4 fa, fa fa fa fa
    sib[la16 sol fa mib re do] sib8 la

    %137
    sib fa' fa fa fa fa
    sib re,4 mib re16 do
    la'8 do,4 re do16 sib

    %140
    sol'8 sib,4 do sib16 la
    fa'8 la,4 sib la16 sol
    mib'8 mib mib mib mib mib

    %143
    la[sol16 fa mib re do sib] la8 sol
    fa [mib' mib mib mib re16 do]
    re8 re16 do re8 fa,16 mib fa8 re16 do

    %146
    re8 re'16 do re8 fa,16 mib fa8 re16 do
    re8 re'16 do re8 fa,16 mib fa8 re16 do
    sib2.\fermata

}

IIIvlIn =  \relative do'' {

    r8 fa fa fa fa fa
    sib[la16 sol fa mib re do] sib8 la
    sib fa' fa fa fa fa

    %4
    sib[la16 sol fa mib re do] sib8 la
    sib fa' fa fa fa mi
    fa mi16 re do sib la sol fa8 mi

    %7
    fa do' do do do do
    fa mi16 re do sib la sol fa8 mi\mbreak
    fa fa' la fa la fa

    %10
    sib re,4 mib re16 do
    la'8 do,4 re do16 sib
    sol'8 sib,4 do sib16 la

    %13
    fa'8 la,4 sib la16 sol
    mib'8 mib mib mib mib mib
    la[sol16 fa mib re do sib] la8 sol

    %16
    fa mib' mib mib mib mib
    la[sol16 fa mib re do sib] la8 sol
    fa8[mib' mib mib mib re16 do]\mbreak

    %19
    re8 re16 do re8 fa,16 mib fa8 re16 do
    re8 re'16 do re8 fa,16 mib fa8 re16 do
    re4 r r

    %22
    r8 sib'\solo sib16[(do re) mib fa sol la sib]
    fa8 re sib fa re sib
    re fa sib16[(do re) mib fa sol la sib]

    %25
    fa8 re sib fa re sib
    R2.*16
    r8 do' do do do do
    fa[mi16 re do sib la sol] fa8 mi

    %44
    fa do' do do do do
    fa[mi16 re do sib la sol] fa8 mi
    fa do'  re re do do

    %47
    sib re re re re re
    sol[fa16 mi re do sib la] sol8 fad
    sol re' re re re re\mbreak

    %50
    sol[fa16 mi re do sib la] sol8 fad
    sol sol' sib sol sib sol
    sib mib,4 do la'8~

    %53
    la re,4 sib sol'8~
    sol do,4 la fad'8
    sol sol16 fad sol8 sib,16 la sib8 sol16 fad

    %56
    sol8 sol'16 fad sol8 sib,16 la sib8 sol16 fad
    sol4 r r
    R2.*19

    %77
    la8 la la la la la
    re[do16 sib la sol fa mi] re8 dod
    re la' la la la la

    %80
    re[do16 sib la sol fa mi] re8 dod
    re4 r r\mbreak
    R2.*14

    %96
    r8 sib' sib sib sib sib
    mib[re16 do sib lab sol fa] mib8 re

    %98
    mib sib' sib sib sib sib
    mib[re16 do sib lab sol fa] mib8 re
    mib8 mib' mib mib mib mib\mbreak

    %101
    re fa fa fa fa fa
    sib[la16 sol fa mib re do] sib8 la
    sib fa' fa fa fa fa

    %104
    sib[la16 sol fa mib re do] sib8 la
    sib4 r r
    r8 sib sib16[(do re) mib fa sol la sib]

    %107
    fa8 re sib fa re sib
    R2.
    r8 re fa re fa re\mbreak

    %110
    r re fa re fa re
    r sol, sib sol sib sol
    r sol sib sol sib sol

    %113
    r mi' sol mi sol mi
    r mi sol mi sol mi
    r la, do la do la

    %116
    r la do la do la\mbreak
    r fad' la fad la fad
    r fad la fad la fad

    %119
    r sib, re sib re sib
    r sib re sib re sib
    r sol' sib sol sib sol

    %122
    r sol sib sol sib sol
    r la do la do la\mbreak
    r la do la do la

    %125
    sib4 r r
    R2.*9
    r8 fa' fa fa fa fa
    sib[la16 sol fa mib re do] sib8 la

    %137
    sib fa' fa fa fa fa
    sib re,4 mib re16 do
    la'8 do,4 re do16 sib

    %140
    sol'8 sib,4 do sib16 la
    fa'8 la,4 sib la16 sol
    mib'8 mib mib mib mib mib

    %143
    la[sol16 fa mib re do sib] la8 sol
    fa [mib' mib mib mib re16 do]
    re8 re16 do re8 fa,16 mib fa8 re16 do

    %146
    re8 re'16 do re8 fa,16 mib fa8 re16 do
    re8 re'16 do re8 fa,16 mib fa8 re16 do
    sib2.\fermata

}

IIIvlIIn = \relative do'' {

    R2.
    r8 fa fa fa fa fa
    sib[la16 sol fa mib re do] sib8 la

    %4
    sib fa' fa fa fa fa
    sib[la16 sol fa mib re do] sib8 do
    la do do do do do

    %7
    fa[mi16 re do sib la sol] fa8 mi
    fa do' do do do do\mbreak
    do do fa do fa do

    %10
    re sib'4 sib mib,8~
    mib la4 la re,8~
    re sol4 sol do,8~

    %13
    do fa4 fa sib,8
    la16[la' sol fa mib re do sib] la8 sol
    fa mib' mib mib mib mib

    %16
    la[sol16 fa mib re do sib] la8 sol
    fa mib' mib mib mib mib
    mib [do do do do sib16 la]

    %19
    sib8 sib16 la sib8 re,16 do re8 sib16 la
    sib8 sib'16 la sib8 re,16 do re8 sib16 la
    sib4 r r

    %22
    R2.*21
    r8 do' do do do do
    fa[mi16 re do sib la sol] fa8 mi

    %45
    fa do' do do do do
    do la' la la la la
    sol[fa16 mib! re do sib la] sol8 fad

    %48
    sol re' re re re re
    sol[fa16 mib re do sib la] sol8 fad\mbreak
    sol re' re re re re

    %51
    re re sol re sol re
    mib sol4 mib do8
    re fa4 re sib8

    %54
    do mib4 do la8
    sib8 sib16 la sib8 sol16 fad sol8 sib,16 la
    sib8 sib'16 la sib8 sol16 fad sol8 sib,16 la

    %57
    sib4 r r
    R2.*20
    la'8 la la la la la

    %79
    re[do16 sib la sol fa mi] re8 dod
    re la' la la la la
    la4 r r\mbreak

    %82
    R2.*14
    mib'8[re16 do sib lab sol fa] mib8 re
    mib sib' sib sib sib sib

    %98
    mib8[re16 do sib lab sol fa] mib8 re
    mib sib' sib sib sib sib
    sib sib do do do do\mbreak

    %101
    sib'[la16 sol fa mib re do] sib8 la
    sib8 fa' fa fa fa fa
    sib[la16 sol fa mib re do] sib8 la

    %104
    sib8 fa' fa fa fa fa
    fa4 r r
    R2.*29

    %135
    sib8[la16 sol fa mib re do] sib8 la
    sib fa' fa fa fa fa
    sib[la16 sol fa mib re do] sib8 la

    %138
    sib sib'4 sib mib,8~
    mib la4 la re,8~
    re sol4 sol do,8~

    %141
    do fa4 fa sib,8\mbreak
    la16[la' sol fa mib re do sib] la8 sol
    fa mib' mib mib mib mib

    %144
    la,16[la' sol fa mib re do sib do8 sib16 la]
    sib8 sib16 la sib8 re,16 do re8 sib16 la
    sib8 sib'16 la sib8 re,16 do re8 sib16 la

    %147
    sib8 sib'16 la sib8 re,16 do re8 sib16 la
    sib2.\fermata

}

IIIvlan =  \relative do' {

    re8 re sib' re,4 do8
    re re sib' re,4 do8
    re re sib' re,4 do8

    %4
    re re sib' re,4 do8
    re re sib' fa sol4
    do,8 la fa' la,4 sol8

    %7
    la la fa' la,4 sol8
    la la fa' la,4 sol8\mbreak
    la la' do la do fa,

    %10
    fa fa sib sol sol mib
    do fa la fa fa re
    sib mib sol mib mib do

    %13
    la re fa re re sib
    do do do do do do
    la do do do do do

    %16
    la do do do do do
    la do do do do do
    la fa' fa fa fa fa\mbreak

    %19
    fa sib,16 fa sib8 sib16 fa sib8 sib16 fa
    sib8 sib16 fa  sib8 sib16 fa  sib8 sib16 fa
    sib4 r r

    %22
    R2.*20
    la8 la fa' la,4 sol8
    la8 la fa' la,4 sol8

    %44
    la8 la fa' la,4 sol8
    la8 la fa' la,4 sol8
    la fa' re[re re re]

    %47
    re sib sol' sib,4 la8
    sib8 sib sol' sib,4 la8
    sib8 sib sol' sib,4 la8\mbreak

    %50
    sib8 sib sol' sib,4 la8
    sib sib' re sib re sib
    sol sol sol la la la

    %53
    fa fa fa sol sol sol
    mib! mib mib fad fad fad
    re8 re16 re re8 re16 re re8 re16 re

    %56
    re8 re16 re re8 re16 re re8 re16 re
    re4 r r
    R2.*19

    %77
    fa,8 fa re' fa4 mi8
    fa fa, re' fa4 mi8
    fa fa, re' fa4 mi8

    %80
    fa fa, re' fa4 mi8
    fa sol la sib\mbreak la sol
    fa sol la sib  la sol

    %83
    fa sol la sol la fa
    dod re mi fa mi re
    dod re mi re mi dod

    %86
    fad sol la sib la sol
    fad sol la sol la fad\mbreak
    si, do re mib? re do

    %89
    si do re do re si
    mi fa sol la sol fa
    mi fa sol fa sol mi

    %92
    la, sib do re do sib
    la sib do sib \mbreak do la
    re mib fa sol fa mib

    %95
    re mib fa mib fa re
    sib sol mib' sol4 fa8
    sol sol mib sol4 fa8

    %98
    sol sol mib sol4 fa8
    sol sol mib sol4 fa8
    sol sol fa fa fa fa\mbreak

    %101
    fa re sib' re,4 do8
    re re sib' re,4 do8
    re re sib' re,4 do8

    %104
    re re sib' re,4 do8
    re4 r r
    R2.*29

    %135
    re8 re sib' re,4 do8
    re8 re sib' re,4 do8
    re8 re sib' re,4 do8

    %138
    fa fa sib sol sol mib
    do fa la fa fa re
    sib mib sol mib mib do

    %141
    la re fa re re sib\mbreak
    do do do do do do
    la do do do do do

    %144
    la fa' fa fa fa fa
    fa sib,16 fa sib8 sib16 fa sib8 sib16 fa
    sib8 sib16 fa sib8 sib16 fa sib8 sib16 fa

    %147
    sib8 sib16 fa sib8 sib16 fa sib8 sib16 fa
    sib2.\fermata

}

IIIbcn = \relative do {

    sib'8 sib, re sib fa' fa,
    r sib re sib fa' fa,
    r sib re sib fa' fa,

    %4
    r sib re sib fa' fa,
    r sib' re sib sol do,
    r fa la fa do' do,

    %7
    r fa la fa do' do,
    r fa la fa do' do,\mbreak
    fa fa fa fa fa16 mib re do

    %10
    sib8 sib sib do do do
    fa fa fa sib sib sib
    mib, mib mib la la la

    %13
    re, re re sol sol sol
    fa la do la fa [do]
    r la' do la fa[do]

    %16
    r la' do la fa[do]
    r la' do la fa[do]
    r la' do la fa fa,\mbreak

    %19
    sib sib'16 fa sib8 sib16 fa sib8 sib16 fa
    sib,8 sib'16 fa sib8 sib16 fa sib8 sib16 fa
    sib,4  r r

    %22
    sib r r
    sib r r
    sib r r

    %25
    sib r r
    fa'4~fa8 mib re do\mbreak
    sib4. do8 re sib

    %28
    do4. re8 mib do
    re4. do8 re sib
    fa'4 fa4. fa8

    %31
    sol4 sol4. mi8
    fa4 fa4. fa8
    do2.\tasto~

    %34
    do~
    do~
    do~

    %37
    do
    fa4\tu sol do,
    fa sol do

    %40
    fa, mi do
    fa sol do\mbreak
    fa,8 fa, la fa do' do,

    %43
    r fa la fa do' do,
    r fa la fa do' do,
    r fa la fa do' do,

    %46
    fa fa' fad fad re re
    sol sol, sib sol re' re,
    r sol sib sol re' re,

    %49
    r sol sib sol re' re,\mbreak
    r sol sib sol re' re,
    sol sol' sol sol sol sol

    %52
    do, do do fa fa fa
    sib, sib sib mib mib mib
    la, la la re re re

    %55
    sol, sol'16 re sol8 sol16 re sol8 sol16 re
    sol8 sol16 re sol8 sol16 re sol8 sol16 re
    sol4 sol, sol

    %58
    sol sol sol\mbreak
    sol sol sol
    sol sol sol

    %61
    sol sol sol
    sol sol sol
    sol sol sol

    %64
    sol sol sol
    sol sol sol\mbreak
    la la la

    %67
    la la la
    re re re
    re re re

    %70
    re re re
    re re re
    re re re\mbreak

    %73
    re re re
    re re re
    re re re

    %76
    re re re
    re8 re fa re la' la,
    r re fa re  la' la,

    %79
    r re fa re  la' la,
    r re fa re  la' la,
    re mi fa sol\mbreak fa mi

    %82
    re mi fa sol fa mi
    re mi fa mi fa re
    la si dod re dod si

    %85
    la si dod si dod la
    re mi fad sol fad mi
    re mi? fad mi! fad re\mbreak

    %88
    sol, la si do si la
    sol la si la si sol
    do re mi fa mi re

    %91
    do re mi re mi do
    fa sol la sib la sol
    fa sol la sol\mbreak la fa

    %94
    sib, do re mib re do
    sib do re do re sib
    mib mib sol mib sib' sib,

    %97
    r mib sol mib sib' sib,
    r mib sol mib sib' sib,
    r mib sol mib sib' sib,

    %100
    mib mib la, la la la\mbreak
    sib sib re sib fa' fa,
    r sib re sib fa' fa,

    %103
    r sib re sib fa' fa,
    r sib re sib fa' fa,
    sib4 r r

    %106
    sib4 r r
    sib4 r r
    fa'~fa8 mib re do

    %109
    sib4 r r\mbreak
    re r r
    sol r r

    %112
    sol r r
    mi r r
    mi r r

    %115
    la r r
    la r r\mbreak
    fad r r

    %118
    fad r r
    sib, r r
    sib r r

    %121
    sol' r r
    sol r r
    la r r\mbreak

    %124
    la r r
    sib re, sib
    mib fa sol

    %127
    la sib do
    re mib fa
    fa,2.\tasto~

    %130
    fa~
    fa~
    fa~\mbreak

    %133
    fa~
    fa
    sib,8\tu sib re sib fa' fa,

    %136
    r sib re sib fa' fa,
    r sib re sib fa' fa,
    sib sib sib do do do

    %139
    fa fa fa sib sib sib
    mib, mib mib la la la
    re, re re sol sol sol\mbreak

    %142
    fa la do la fa do
    r la' do la fa do
    r la' do la fa fa,

    %145
    sib sib'16 fa sib8 sib16 fa sib8 sib16 fa
    sib8 sib16 fa sib8 sib16 fa sib8 sib16 fa
    sib8 sib16 fa sib8 sib16 fa sib8 sib16 fa

    %148
    sib,2.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s2 s8 <_!>
    s2 <6 4>8 <5 3!>
    s2 <6 4>8 <5 3!>
    s2 <6 4>8 <5 3!>
    s2.
    s4 s8 <7> s4
    <7>4. <7>
    <7> <7>
    <7> <7>
    <7> s
    s2.*16
    s2 s8 <6 5>
    s2.*6
    s4 <6!> <7>
    s2.
    s4 s <7>
    s2.
    s2 <6 4>8 <5 3!>
    s2 <6 4>8 <5 3!>
    s2 <6 4>8 <5 3!>
    s2 <6 4>8 <5 3!>
    s2 <7>4
    s2 <6 4>8 <5 3+>
    s2 <6 4>8 <5 3+>
    s2 <6 4>8 <5 3+>
    s2 <6 4>8 <5 3+>
    s2.
    <7>4. <7>
    <7> <7>
    <7> <7 _+>
    s2.*5
    <6 4>2.
    <5 4>
    <3>
    <4>
    <9+ 4>
    <8 3>
    <7 _+>
    s2.*4
    <6 4>2.
    <5 4>
    <5 3>
    <5 4>
    <9+ 4>
    <8 3>
    s2 <6 4>8 <5 3+>
    s2 <6 4>8 <5 3+>
    s2 <6 4>8 <5 3+>
    s2 <6 4>8 <5 3+>
    s2.*3
    <_+>2.
    <7>
    <_+>
    <7>
    <_!>
    <7>
    <_!>
    <7>
    s
    <7>
    s
    <7->
    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s4 <6 5>2
    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s2.*30
    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s2 <6 4>8 <5 3>
    s4. <7>
    <7> <7>
    <7> <7>
    <7> <7>

}

forma = {

    \key sib\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 65
    s2.*148
    \bar"|."

}

IIIvl = {
    \IIIglobal
    %\notypeset
    <<\IIIvln \forma>>

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
    \typeset

}
#(set-global-staff-size 15)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Principale"}
            \Ivl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.2"e Organo"}
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup\huge "[2.] Largo"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup\huge "[3.] All[egr]o"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
           % \override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

