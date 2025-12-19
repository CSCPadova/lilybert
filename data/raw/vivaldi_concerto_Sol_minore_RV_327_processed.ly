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
    \senza
}

Ivln = \relative do'' {

    sol8\staccatissimo sib\staccatissimo re\staccatissimo sol\staccatissimo fad\staccatissimo la\staccatissimo do,\staccatissimo mib\staccatissimo
    la, do fad, do' sol, sol'\p sib re
    sol sib sol re mib do, mib sol

    %4
    do mib sol sib, la fa?\f la do
    fa la do mib, re4 r8 sib\p
    mib16(re do sib) sib8-.(sib-.) sol'\staccatissimo fa\staccatissimo r sib,

    %7
    mib16(re do sib) sib8-.(sib-.) sol'\staccatissimo r la\staccatissimo r\mbreak
    sib[la16 sol fa8 mib] re do16 sib do4\tr
    sib r16 fa\f sib fa re sib re fa sib re sib fa

    %10
    sol8 mib? r16 sol do sol mi! do mi sol do mi! do sol
    la8 fa r16 la re la fad re fad la do mib do la
    sib8 sol r8 mib'\p(dod8) dod(re) re(

    %13
    si) si(do) la'(fad) fad(sol) mib(
    dod) dod(re) la'(fad) fad(sol4)
    sol,16\f re sol re re' do sib la sol re sol re re' do sib la

    %16
    sol8 sol' la fad sol4 r8 re'
    \appoggiatura do8 sib32[(la sib16)]~sib16. do32 re8 fad, fad4(sol8) re'
    \appoggiatura do8 sib32[(la sib16)]~sib16. do32 re8 re, re4(mib16) sib' la sol

    %19
    fad do' sib la sol re' do sib sib4(la16) mib' re do\mbreak
    sib fad'? mib re do sol' fad mib mib4(re)
    \tuplet 3/2 {
        re,16 do sib re[do sib]  sib' la sol sib[la sol] la sol fad la[sol fad] do' sib la do[sib la]

        %22
        sib do re sib[do re] mib re do mib[re do] re mib fad re[mib fad] sol[fad mib] sol[fad mib]
    }
    re4 r \tuplet 3/2 {
        sol,16 mib' fa sol[(fad?) sol]  sol,(mib') fad  sol[(fad) sol]\mbreak
        do,,(la') sib do[(sib) do] do,(la') sib do[(sib) do] fa,re' mib fa [mib fa] fa, re' mib fa[mib fa]

        %25
        sib,, sol' la sib[la sib] sib, sol' la sib[la sib] mib, do' re mib[re mib] mib, do' re mib[re mib]
        la, re do sib[la sol] fad sib la sol[fad mi!] re fad mi fad[mi re] re, fad'mi fad[mi re]
    }
    re,4 r \mbreak <<si'2\\fa?>>

    %28
    re'32(do) si(la) sol(fa) mib?(re) do(si) la(sol) r8 <<si''2\\fa>>
    re'32(do) si(la) sol[(fa) mib(re)] do(si) la(sol) r8 do'(mib do sol)
    sol4(lab) sib8(re sib fad)

    %31
    fad?4(sol) lab8(do lab mi!)
    mi4(fa?) \tuplet 3/2 { fa16(sol lab) si,[(do re)] } \appoggiatura re8 fa,4\mbreak
    \tuplet 3/2 { fa16(sol lab) re,[(mib fa)] } \appoggiatura fa8 si,4 \con \tuplet 3/2 { mib'16(re do } do8\noBeam\tr) \tuplet 3/2 { mib16(re do } do8\noBeam\tr)

    %34
    \tuplet 3/2 { lab'16(sol fa } fa8\noBeam\tr) \tuplet 3/2 { si16(lab sol } sol8\noBeam\tr) do16 sol do, lab sol8 re'\tr
    do16 do, mib sol do mib do sol lab8 fa r16 fa lab do
    fad, re fad la? do fad do la si8 sol r16 sol si re

    %37
    si sol si re sol si sol re\mbreak mib do mib do sol' fa mib re
    mib do mib do sol' fa mib re mib8 do re si
    do16 sol do mib sol do sol mib re sol, si re fa si re fa,

    %40
    mib do mib sol do mib do fa, lab re, fa lab re fa re lab
    si sol si sol mib' sol, mib' sol, lab sol fa (sol) lab (si) do(re)\mbreak
    mib8 re16(mib) fa(mib) re(do) si la? sol8 r16 sol la32(sol) la(sol)

    %43
    fad16 do re32(do) re(do) si16 fa? sol32(fa) sol(fa) mi!4\tr r16 fa'? sol32(fa) sol(fa)
    mi!16 sib do32(sib) do(sib) la16 mib fa32(mib) fa(mib) re4\tr r16 mib' fa32(mib) fa(mib)
    re16 la sib32(la) sib(la) sol16 re mi?32(re) mi(re) dod4 r16 dod' re32(dod) re(dod)\mbreak

    %46
    re16 re mib32(re) mib(re) mib16 mi fa32(mi) fa(mi) fa16 fad sol32(fad) sol(fad) sol16 sold la32(sold) la(sold)
    la16 la sib32(la) sib(la) sib16 si do32(si) do(si) do16 dod re32(dod) re(dod) re16 la fa re
    mi(la,) \once\stemUp la \noBeam (\once\stemDown la) mi'(la,) \once\stemUp la \noBeam (\once\stemDown la) mi'(la,) \once\stemUp la \noBeam (\once\stemDown la) mi'(la,) \once\stemUp la \noBeam (\once\stemDown la)

    %49
    sol'(la,) \once\stemUp la \noBeam (\once\stemDown la) sol'(la,) \once\stemUp la \noBeam (\once\stemDown la)\mbreak sol2
    mi'16(dod) si(la) sol'(mi) re(dod) si'(sol) fa(mi) mi'(dod) si!(la)  %%%% OK battuta 50
    sol2 re'32(do) sib?(la) sol(fa) mi(re) mi4\tr

    %52
    re8 fa,\f la re dod mi sol ,sib
    mi, sol dod, sol' fa\p la re fa
    sib, re sol, sol' fad la do, mib

    %55
    la, do fad, do'\mbreak sol, sol' sib re
    sol sib sol re mib do, mib sol
    do mib sol sol, fad re r8 re'\solo

    %58
    do16 fad, re mib' mib8(re16) do sib sol sol,8 r sol''
    fa16 re si lab' lab8(sol16) fa mib do do,8 r la''?
    sol16 dod, la sib' sib8(la16) sol fad re re, la'' la8(sol16) fad\mbreak

    %61
    sol re sib sib' sib8(la16) sol sol8\tr fad r4
    sib'8. [la16-. (sol-. fa?-. mib-. re-.) ] re4 mib
    la8. [sol16-.(fa-. mib-. re-. dod-.)] dod4(re)

    %64
    sol8. [fa16-.(mib-. re-. do?-. si-.)] si4(do)
    do16-.( re-. mib-. do-. la-. sib?-. do-. la-. fad-. sol-. la-. fad-. do-. re-. mib-. do-.)
    \senza do8\tr sib r re\mbreak \tuplet 3/2 { mi?16(dod) re mi[(dod) re] mi(dod) re mi[(dod) re] }

    %67
    sol8\tr fad r re \tuplet 3/2 { mi?16(dod) re mi[(dod) re] mi(dod) re mi[(dod) re] }
    sib'8\tr la r16 sib(do re sib fad sol re mib) la(sib do
    la mib fa dod re) sol(la sib sol re mib si do?) sib'?(la sol

    %70
    fad mib re do) la'(do, sib la)\mbreak sib sol' si,! sol' do, sol' dod, sol'
    fad4~fad16 la32(sol) fad(mi) re(do) sib16 re32(do) sib(la) sol(fa) mib16 mib'32(re) do(sib) la(sol)
    fad4 r8 dod''(re) fad,(sol) re

    %73
    \appoggiatura {sol16[(la)]} la2\tr sol4~sol16 sib32(la) sol(fad?) mib(re)
    do(re) mib(re) do(sib) la(sol)  fad(sol) la(sol) fad(mi) re(do) sib8 sol r do''32(la16.)\mbreak
    sib32[(sol16.)] do32(la16.) la4\tr sol16 sol, sib re sol sib sol re

    %76
    mib do mib sol do sol mib do fad la, do fad la fad do la
    sol re sol re re' do sib la sol re sol re re' do sib la
    sol8 sol' la fad sol2\fermata

}

IvlIn =  \relative do'' {

    sol8\staccatissimo sib\staccatissimo re\staccatissimo sol\staccatissimo fad\staccatissimo la\staccatissimo do,\staccatissimo mib\staccatissimo
    la, do fad, do' sol, sol'\p sib re
    sol sib sol re mib do, mib sol

    %4
    do mib sol sib, la fa?\f la do
    fa la do mib, re4 r8 sib\p
    mib16(re do sib) sib8-.(sib-.) sol'\staccatissimo fa\staccatissimo r sib,

    %7
    mib16(re do sib) sib8-.(sib-.) sol'\staccatissimo r la\staccatissimo r\mbreak
    sib[la16 sol fa8 mib] re do16 sib do4\tr
    sib r16 fa\f sib fa re sib re fa sib re sib fa

    %10
    sol8 mib? r16 sol do sol mi! do mi sol do mi! do sol
    la8 fa r16 la re la fad re fad la do mib do la
    sib8 sol r8 mib'\p(dod8) dod(re) re(

    %13
    si) si(do) la'(fad) fad(sol) mib(
    dod) dod(re) la'(fad) fad(sol4)
    sol,16\f re sol re re' do sib la sol re sol re re' do sib la

    %16
    sol8 sol' la fad sol4 r
    sol,,8 sol' sib re re, re' sib fad
    sol, sol' sib re sol,, sol' do mib,

    %19
    re fad sol sol, re' mi? fad re\mbreak
    sol sib la do sib la sib fad
    sol fad sol sol, re'' dod re re,

    %22
    sol sol, r4 re''8 re, r4
    r8 la' sib re r sol, do mib\mbreak
    r mib do la r fa sib re

    %25
    r re sib sol r mib la do
    la la la la la la la la
    la16 fad la re fad re la fad\mbreak re8 do si do

    %28
    fa mib? re mib fa mib re mib
    fa mib? re mib r do' mib4
    r8 do fa4 r8 sib, re4

    %31
    r8 sib mib4 r8 lab, do4
    r8 lab? re4 fa,8 fa fa fa\mbreak
    fa fa fa fa sol sol sol do

    %34
    do do re re do do do si
    do16 do, mib sol do mib do sol lab8 fa r16 fa lab do
    fad, re fad la? do fad do la si8 sol r16 sol si re

    %37
    si sol si re sol si sol re\mbreak mib do mib do sol' fa mib re
    mib do mib do sol' fa mib re mib8 do re si
    do4 r r2

    %40
    R1*2
    r2 sol8 la si do
    re fad, sol si, do sol' la si

    %44
    do mi,! fa la, sib fa' sol la
    sib re, mi sol, la mi' la sol\mbreak
    fa sib, sol[do] la re si[mi]

    %47
    dod fa re[sol] mi la fa re
    la si dod la re mi fa re
    la si dod si\mbreak la si dod si

    %50
    la si dod la sol' dod,la dod
    mi dod la dod re sib' la la,
    re fa\f  la re dod mi sol ,sib

    %53
    mi, sol dod, sol' fa\p la re fa
    sib, re sol, sol' fad la do, mib
    la, do fad, do'\mbreak sol, sol' sib re

    %56
    sol sib sol re mib do, mib sol
    do mib sol sol, fad re r4
    re8 fad la fad sol sol, r4

    %59
    re'8 sol si sol do do, r4
    mi!8 la dod la re re, fad re\mbreak
    sol sol, sol' dod, re re' la fad

    %62
    sol, sol' la si do si do do,
    r fa sol la sib la sib sib,
    r mib fa sol la sol la la,

    %65
    la' sol fad mib? re fad la fad
    sol la sib sol\mbreak r2
    re'8 dod re re, r2

    %68
    re'8 dod re re, re' si do? do,
    do' la sib sib, sib' sol la la,
    re mi fad re\mbreak sol fad mi la

    %71
    re, mi fad re sol sol, do mib
    re re' la sol fad re sib' sol
    re' do re re, sol fad sol sol,

    %74
    do mib re la sol sol' fad re\mbreak
    sol mib re re sib'16 sol sib re sol sib sol re
    mib do mib sol do sol mib do fad la, do fad la fad do la

    %77
    sol re sol re re' do sib la sol re sol re re' do sib la
    sol8 sol' la fad sol2\fermata

}

IvlIIn = \relative do'' {

    re,8 sol sib re re fad la, do
    fad, la re, la' sol, re'\p sol sib
    re sol re sib do sol, do mib

    %4
    sol do mib sol, fa do\f fa la
    do fa la do, sib4 r8 sib\p
    mib16(re do sib) sib8-. (sib-.) mib re r sib

    %7
    mib16(re do sib) sib8-.(sib-.) mib r fa r\mbreak
    fa mib do la sib sib4 la8
    sib4 r16 sib\f re sib fa re fa sib re sib fa re

    %10
    mib?8 sib r16 do' mi! do sol mi! sol do  mi do sol mi
    fa8 do r16 re' fad re la fad la re fad re la fad
    sol8 re r sib'\p la la la la

    %13
    sol sol sol mib' re re re sib\mbreak
    la la la mib' re re re4
    sib16\f sol sib sol la8 la sib16 sol sib sol la8 la

    %16
    sib sib do la sib4 r
    sol,8 sol' sib re re, re' sib fad
    sol, sol' sib re sol,, sol' do mib,

    %19
    re fad sol sol, re' mi? fad re\mbreak
    sol sib la do sib la sib fad
    sol fad sol sol, re'' dod re re,

    %22
    sol sol, r4 re''8 re, r4
    r8 fad sol sib r do mib sol
    r do, la fa r sib re fa

    %25
    r sib, sol mib r la do mib
    fad, fad fad fad fad fad fad fad
    fad16 re fad la re la fad re\mbreak si8 do re do

    %28
    si do re do si do re do
    si do re si sol' sol sol do
    lab lab lab lab fa fa fa re'

    %31
    sol, sol sol sol mib mib mib do'
    fa, fa fa fa re re re re\mbreak
    re re re re mib mib mib mib

    %34
    lab lab sol sol sol lab sol sol
    mib16 sol, do mib sol do sol mib fa8 do r16 do fa do
    re la re fad la do la fad sol8 re r16 re sol re

    %37
    sol re sol si re sol re si\mbreak do sol do sol re'8 re
    do16 sol do sol re'8 re do mib fa re
    do4 r r2

    %40
    R1*2
    r2 sol8 la si do
    re fad, sol si, do sol' la si

    %44
    do mi,! fa la, sib fa' sol la
    sib re, mi sol, la mi' la sol\mbreak
    fa sib, sol[do] la re si[mi]

    %47
    dod fa re[sol] mi la fa re
    la si dod la re mi fa re
    la si dod si\mbreak la si dod si

    %50
    la si dod la sol' dod,la dod
    mi dod la dod re sib' la la,
    la re\f fa la la dod mi, sol

    %53
    dod, mi la, mi' re\p fa la re
    re sib re, re' re fad la, do
    fad, la re, la'\mbreak sol, re' sol sib

    %56
    re sol re sib do sol, do mib
    sol do mib mib, re la r4
    re8 fad la fad sol sol, r4

    %59
    re'8 sol si sol do do, r4
    mi!8 la dod la re re, fad re\mbreak
    sol sol, sol' dod, re re' la fad

    %62
    sol, sol' la si do si do do,
    r fa sol la sib la sib sib,
    r mib fa sol la sol la la,

    %65
    la' sol fad mib? re fad la fad
    sol la sib sol\mbreak r2
    re'8 dod re re, r2

    %68
    re'8 dod re re, re' si do? do,
    do' la sib sib, sib' sol la la,
    re mi fad re\mbreak sol fad mi la

    %71
    re, mi fad re sol sol, do mib
    re re' la sol fad re sib' sol
    re' do re re, sol fad sol sol,

    %74
    do mib re la sol sol' fad re\mbreak
    sol mib re re sol16 re sol sib  re sol re sib
    do sol do mib sol mib do mib la, fad la do fad do la fad

    %77
    sib sol sib sol la8 la sib16 sol sib sol la8 la
    sib sib do la sib2\fermata

}

Ivlan =  \relative do' {

    sib8 re sol sib la re fad, fad
    re re la fad' sol, sib\p re sol
    sib re sib sol sol mib, sol do

    %4
    mib sol do mib, do la\f do fa
    la do fa, la fa re\p do re
    r re do re r re do re

    %7
    r re do re sib r do r\mbreak
    re sib fa' fa fa fa fa fa
    re4 r16 sib\f sib sib sib4 r16 sib sib sib

    %10
    sib8 sol r16 do do do do4 r16 do do do
    do8 la r16 re re re re4 r16 re re re
    re8 sib r sol'\p sol sol fa fa

    %13
    fa fa mi do' do do sib sol\mbreak
    sol sol fad do' do do sib4
    re,8\f re re re re re re re

    %16
    re re mib re re4 r4
    sol,8 sol' sib re re, re' sib fad
    sol, sol' sib re sol,, sol' do mib,

    %19
    re fad sol sol, re' mi? fad re\mbreak
    sol sib la do sib la sib fad
    sol fad sol sol, re'' dod re re,

    %22
    sol sol, r4 re''8 re, r4
    re8 do sib sol mib' mib mib mib\mbreak
    fa fa fa fa re re re re

    %25
    mib mib mib mib do do do do
    re re re re re re re re
    re re re re\mbreak sol, la si la

    %28
    sol la si la sol la si la
    sol la si la mib' mib mib mib
    fa fa fa fa re re re re

    %31
    mib mib mib mib do do do do
    re re re re si si si si\mbreak
    sol sol sol sol do do do do

    %34
    fa fa fa fa mib fa sol sol,
    sol sol r16 sol sol do do8 lab r16 lab lab lab
    la!8 la r16 la la re re8 si r16 si si si

    %37
    re8 re r16 re re sol\mbreak  sol8 sol sol sol
    sol sol sol sol sol sol lab sol
    mib4 r r2

    %40
    R1*2
    r2 sol8 r si r
    re r sol, r do, r la' r

    %44
    do r fa, r sib, r sol' r
    sib r mi, r la, r la' r\mbreak
    re, r sol, r la r si r

    %47
    dod r re r mi r re r
    la r la r re r re r
    la r la r\mbreak la r la r

    %50
    la r la r la r la r
    la r la r re sib' la la,
    fa la\f re fa mi dod dod dod

    %53
    la la la la la\p re fa la
    sib sol sib, sol' la re fad, fad
    re re la fad'\mbreak sol, sib re sol

    %56
    sib re sib sol sol mib, sol do
    mib sol do do, la la r4
    re8 fad la fad sol sol, r4

    %59
    re'8 sol si sol do do, r4
    mi!8 la dod la re re, fad re\mbreak
    sol sol, sol' dod, re re' la fad

    %62
    sol, sol' la si do si do do,
    r fa sol la sib la sib sib,
    r mib fa sol la sol la la,

    %65
    la' sol fad mib? re fad la fad
    sol la sib sol\mbreak r2
    re'8 dod re re, r2

    %68
    re'8 dod re re, re' si do? do,
    do' la sib sib, sib' sol la la,
    re mi fad re\mbreak sol fad mi la

    %71
    re, mi fad re sol sol, do mib
    re re' la sol fad re sib' sol
    re' do re re, sol fad sol sol,

    %74
    do mib re la sol sol' fad re\mbreak
    sol mib re re re4 r16 re sib sib
    sol4 r16 sol' sol mib la,4 r16 fad' fad fad

    %77
    re8 re re re re re re re
    re re mib re re2\fermata

}

Ibcn = \relative do {

    sol8 sol' fad sol re, re' do re
    re, re' do re sol, sol'\p fad sol
    sol, sol' fad sol do,, do' si do

    %4
    do, do' si? do fa, fa'\f mib? fa
    fa, fa' mib fa sib, sib'\p la sib
    sib, sib' la sib sib, sib' la sib

    %7
    sib, sib' la sib mib,,? mib'? re mib\mbreak
    sib mib la, fa sib sib' fa fa,
    sib4 r16 re\f re re sib4 r16 sib sib sib

    %10
    mib?8 mib,? r16 mi' mi mi do4 r16 do do do
    fa8 fa, r16 fad' fad fad re4 r16 re re re
    sol8 sol, r4 r2

    %13
    R1*2
    sol'8\f sol fad fad sol sol fad fad
    sol sol, do re sol,4 r

    %17
    R1*10
    re'8 re re re\mbreak sol,4 r
    R1*7

    %35
    do8 do, r16 do' do do fa8 fa, r16 fa' fa fa
    re8 re, r16 re' re re sol8 sol, r16 sol' sol sol
    sol8 sol, r16 sol' sol sol\mbreak do,8 do si si

    %38
    do do si si do do' fa, sol
    do,4 r sol r
    do r fa r

    %41
    sol8 fa mib do fa4 r8 si,\mbreak
    do do' lab fad sol4 r
    R1*9

    %52
    re,8 re'\f dod re la la' sol la
    la, la' sol la re,,\p re' dod re
    sol, sol' fad sol re, re' do? re

    %55
    re, re' do re\mbreak sol, sol' fad sol
    sol, sol' fad sol do,, do' si do
    si,? do' si do re re, r4

    %58
    R1*17
    r2 sol4 r16 sol' sol sol
    do,4 r16 do do do re4 r16 re re re

    %77
    sol8 sol fad fad sol sol fad fad
    sol sol, do re sol,2\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key fa\major
    \time 4/4
    \tempo 2 = 47
    s1*78
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
}

IIvln = \relative do'' {

    do,8\f mib'\p do sol\f lab do\p lab mib\f
    fa lab\p fa re\f mib sol'\p(fa) mib\staccatissimo\f
    re\staccatissimo fa\p (mib) re\staccatissimo\f mib16.\staccatissimo mib,32\p fa16. mib32 re8 \once\stemDown fad'\f

    %4
    sol4 r  mib16\pp sol, (lab sol) mib' sol,(lab sol)
    fa fa (sol fa) fa fa (sol fa) re' fa, (sol fa) re' fa, (sol fa)
    mib mib (fa mib) mib mib (fa mib)\mbreak do' mib, (fa mib) do' mib, (fa mib)

    %7
    re re (mib re) re re  mib re mib8\staccatissimo do'\staccatissimo reb\staccatissimo si\staccatissimo
    do\staccatissimo mib,\staccatissimo fa\staccatissimo re?\staccatissimo mib4 r8 do'
    sol'16(mib) re(do) do8 sol' lab sol ~sol16 mib re do

    %10
    re'[(do si la sol fa mib re)] mib8 do r do
    sol'16 (mib) re (do) do'8 lab\mbreak fad sol sib[sol]
    \appoggiatura fa mi fa lab fa \appoggiatura mib? re mib r sib

    %13
    fa'16(re) do (sib) sib8 sib lab'16[(sol fa mib re do sib lab)]
    sol8 mib sol'4~sol8 fa16 mib re8.\tr mib16
    mib4 r8 mib sib'16(sol) fa (mib) sib8 sib

    %16
    do\tr sib r sib\mbreak lab'16(fa )mib (re) fa lab, (sol fa)
    sol8 mib sib''4~sib16 lab (sol fa mi re do) sib'
    lab sol fa8 do'4~do16 sib (la? sol fad  mi? re ) do'

    %19
    sib la  sol8 r re' mib,!4~mib16 do'(la fa)
    \appoggiatura mib8 re4~re16 sib'(sol mib) \appoggiatura re8 do4~do16 la'(fad do)\mbreak
    sib8 sol sib'4~sib8 la16(sol) \appoggiatura sib8 la sol16(fad)

    %22
    \appoggiatura fad?8 sol4 r8 do, sol'16(mib) re (do) do8 do
    lab' sol~sol16 mib (re do) re'[(do si lab sol fa mib re)]
    mib do8 (mib sol do16)~do[sib (lab sol fa mib re do)]

    %25
    re sib8 (re fa sib16)~sib[lab (sol fa mib re do sib)]
    do lab8 do mib lab16~\mbreak lab[sib (lab sol fa mib re do)]
    si8 sol do4~do8 si fa'4~

    %28
    fa8 mib lab4~lab8 sol si4
    do8 do,16. re32 re4\tr do8 sol'\p(fa) mib\f
    re fa\p(mib) re\f mib lab,\p(sol) fad\f

    %31
    sol mib' fa re do2\fermata

}

IIvlIn =  \relative do'' {

    do,8\f mib'\p do sol\f lab do\p lab mib\f
    fa lab\p fa re\f mib sol'\p(fa) mib\staccatissimo\f
    re\staccatissimo fa\p (mib) re\staccatissimo\f mib16.\staccatissimo mib,32\p fa16. mib32 re8 \once\stemDown fad'\f

    %4
    sol4 r  mib16\pp sol, (lab sol) mib' sol,(lab sol)
    fa fa (sol fa) fa fa (sol fa) re' fa, (sol fa) re' fa, (sol fa)
    mib mib (fa mib) mib mib (fa mib)\mbreak do' mib, (fa mib) do' mib, (fa mib)

    %7
    re re (mib re) re re mib re mib8\staccatissimo do'\staccatissimo reb\staccatissimo si\staccatissimo
    do\staccatissimo mib,\staccatissimo fa\staccatissimo re?\staccatissimo mib4 r
    r8 sol sol sol r sol sol sol

    %10
    r si si si r sol sol sol
    r sol lab lab\mbreak la sol sol sol
    sol fa fa fa fa mib mib r

    %13
    r fa fa fa r fa fa fa
    r sol sol sol mib' mib re re
    mib sib sib sib r sib sib sib

    %16
    r sib sib sib\mbreak r re re re
    r sib sib sib sol' mi mi mi
    do do do do la' fad fad fad

    %19
    re re sib'4~sib la~
    la sol2 fad4\mbreak
    sol8 re r sol sol sol fad fad

    %22
    sol re mib [do] r sol sol sol
    r sol sol sol r si si si
    sol sol sol sol fa fa fa fa

    %25
    fa fa fa fa mib mib mib mib
    mib mib mib mib\mbreak re re re re
    re4 r8 mib' re re r re

    %28
    re do r fa fa mib r re
    mib mib re re  \once\stemUp do,\f sol''\p(fa) mib\f
    re fa\p(mib) re\f mib lab,\p(sol) fad\f

    %31
    sol mib' fa re do2\fermata

}

IIvlIIn = \relative do'' {

    do,8\f sol''\p mib mib,\f fa lab\p fa do\f
    do fa\p re si\f do mib'\p(re) do\staccatissimo\f
    si\staccatissimo re\p(do) si\staccatissimo \f do16.\staccatissimo do,32\p re16. do32 si8 \once\stemDown do'\f

    %4
    si4 r do16\pp mib,(fa mib) do' mib,(fa mib)
    re re(mib re) re re(mib re) si' re,(mib re) si' re,(mib re)
    do do(re do) do(do re do)\mbreak \slurDashed sol' do,(re do) sol' do,(re do)

    %7
    si si(do si) si si do si  do8\staccatissimo  mib\staccatissimo fa\staccatissimo  re\staccatissimo
    mib\staccatissimo do\staccatissimo re\staccatissimo si\staccatissimo do4 r
    r8 mib mib mib r mib mib mib\slurSolid

    %10
    r re re re  r mib mib mib
    r mib mib mib\mbreak re re re re
    do do do do sib sib sib r

    %13
    r re re re r re re re
    r sib' sib sib do do fa, fa
    sol sol sol sol r sol sol sol

    %16
    r sol sol sol\mbreak r fa fa fa
    r sol sol fa mi sol sol sol
    lab lab lab sol fad la? la la

    %19
    sib sib r re sol(mib!) do(fa)
    fa(re) sib(mib) mib(do) la(re)\mbreak
    re sib r sib re sib la la

    %22
    sib si do sol r mib mib mib
    r mib mib mib r re re sol
    mib mib mib mib do do do fa

    %25
    re re re re sib sib sib mib
    do do do do\mbreak lab lab lab re
    si4 r8 sol' sol sol r si

    %28
    sol sol r do do do r si
    sol do do si do,\p mib'\p(re) do\f
    si re\p(do) si\f do fa,\p(mib) re\f

    %31
    re do' re si do2\fermata

}

IIvlan =  \relative do' {

    do4 r8 do do4 r8 do
    lab4 r8 re sol,4 r8 sol'
    sol4 r8 sol sol4 r8 lab

    %4
    re,4 r mib8\pp mib mib mib
    fa fa fa fa fa fa fa re
    mib  mib mib mib\mbreak mib mib mib do

    %7
    re re si si sol sol lab sol
    sol sol lab sol sol4 r
    r8 do do do r do do do

    %10
    r sol sol sol r do do do
    r do do do\mbreak do sib sib sib
    sib lab lab lab lab sol sol r

    %13
    r sib sib sib r sib sib sib
    r mib mib mib lab, lab sib sib
    mib, mib' mib mib r mib mib mib

    %16
    r mib mib mib \mbreak r sib sib sib
    r mib mib reb do do do do
    fa fa fa mib re re re re

    %19
    sol sol sib sib do do fa, fa
    sib sib mib,! mib la la re, re\mbreak
    sol sol, r sol re' re re re,

    %22
    sol sol' do do, r do do do
    r do do do r sol sol sol
    do do do do lab lab lab lab

    %25
    sib sib sib sib sol sol sol sol
    lab lab lab lab\mbreak fa fa fa fa
    sol4 r8 do sol' sol, r sol

    %28
    do do, r do' do do, r sol''
    mib do sol' sol, do4 r8 sol'
    sol4 r8 sol sol4 r8 lab,?

    %31
    si sol lab sol sol2\fermata

}

IIbcn = \relative do {

    do4 r8 do fa4 r8 do
    fa4 r8 sol, do4 r8 do
    sol'4 r8 sol, do4 r8 lab

    %4
    sol4 r do8\pp do do do
    re re re re sol, sol sol sol
    do do do do\mbreak do do do do

    %7
    sol' sol, sol sol do do, fa' sol
    do, do, fa' sol do,4 r
    R1*20

    %29
    r2 do4 r8 do
    sol'4 r8 sol, do4 r8 do
    si do fa[sol] do,2\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key sol\minor
  \time 4/4
  \tempo 4 = 40
  s1*31
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

    r16 sol fa mib re mib re do sib do sib la
    sol8 sib' re sib do la
    sib16 sol fa mib re mib re do sib do sib la

    %4
    sol8 sol'' sib sol la fad
    sol16 sol ,fa mib re mib re do sib do sib la
    sol re'' do sib la sib la sol fad sol fad mi

    %7
    re sol' fa  mib re mib re do sib do sib la
    sol4 r r
    sib'8\staccatissimo\p re,\staccatissimo re4(mib8) re\staccatissimo

    %10
    re\staccatissimo si\staccatissimo si4(do)
    la'8\staccatissimo do,\staccatissimo do4(re8) do\staccatissimo
    do\staccatissimo la\staccatissimo la4(sib)

    %13
    sol'8\staccatissimo sib,\staccatissimo sib4(do8) sib\staccatissimo
    sib sol sol4(la)
    mi'8 sol, sol4(la8) sol

    %16
    fad mib' mib4(re8) do
    sib sol' sol4(fa8) mib\mbreak  %% fine p 13 OK
    re sib' sib4(la8) sol

    %19
    fad mib mib4(re8) do
    sib16 sol fa mib re mib re do sib do sib la  %% ripresa
    sol sol' fa  mib re mib re do sib do sib la

    %22
    sol4 r8 re''\f  mib16(re) mib(do)
    re8 do sib sol' la16(sol) la(fad)
    sol4 r8 re\p[mib16(re) mib(do)]

    %25
    re8 do sib sol' la16(sol) la(fad)\mbreak
    sol4 r8 re'8 [do16(sib) la(sol)] %% fine ripresa
    sol4(fad8.) mib?32 re mib!4\tr

    %28
    re4. sol8[fad?16 mib re do]
    do4(sib8.) la32 sol mib'4\tr
    re4. sib'8(do re)

    %31
    re4(mib,8) la (sib do)
    do4(re,8) sol(la sib)
    sib16(la) sol(fa) sol(fa) mib(re) mib(re) do(sib)

    %34
    la8 sol fa4 r\mbreak
    re16(sib' fa') sol fa mib re do sib re do sib
    re,(sib' fa') sol fa mib re do sib re do sib

    %37
    mib,(sib' sol') la sol fa mib re do mib re do
    mi,!(do' sol') la sol fa mi! re do mi re do
    fa,(do' la') sib la sol fa mi re fa mi re

    %40
    fad,(re' la') sib la sol fad mi re fad mi re
    sol,(re' sib') do sib la sol fa mib sol fa mib\mbreak
    sol,(mib' sib') do sib la sol fa mib sol fa mib

    %43
    sol,(mib' do') re do re do sib la sol fa mib
    re(lab sol lab sol lab sol lab) re(lab sol lab)
    fa'( lab, sol lab sol lab sol lab) fa'(lab, sol lab)

    %46
    sol8(sib mib sol sib) mib
    la,16(mib re mib re mib re mib) la(mib re mib)\mbreak
    do'(mib, re mib re mib re mib) do'(mib, re mib)

    %49
    re fa mib re sib' re do sib fa'4
    r8 sib, \appoggiatura {sib16[do]} do2\tr
    sib16 sib, la sol fa sol fa mib re mib re do

    %52
    \once\stemUp sib8 re' fa re mib do
    re16 sib la sol fa sol fa mib re mib re do
    \once\stemUp sib8 sib'' re sib do la\mbreak

    %55
    sib\staccatissimo fa\staccatissimo fa4(sol8) fa\staccatissimo
    fa\staccatissimo re\staccatissimo re4(mib)
    do'8\staccatissimo mib,\staccatissimo  mib4(fa8) mib\staccatissimo

    %58
    mib?\staccatissimo dod\staccatissimo dod4(re)
    sib'8\staccatissimo re,\staccatissimo re4(mib8) re\staccatissimo
    re\staccatissimo si\staccatissimo si4(do)

    %61
    sol'8 sib, ?sib4(do8) sib
    la16 fa' mib re do re do sib la sib la sol
    fa sib la sol fa sol fa mib re mib re do
    sib4 r8 fa'' sol16(fa) sol(mib)

    %65
    fa8 mib re sib' do16(sib) do(la)
    sib8\staccatissimo re,\staccatissimo mib\staccatissimo sol,\staccatissimo la\staccatissimo fa\staccatissimo
    la' do, re fa, sol mib

    %68
    sol' sib, do mib, fa re
    fa'' la, sib re, mib do
    mib' sol, la do, re sib

    %71
    re' fa, sol sib, do la
    do' mib, fa la, sib sol %% fine primo sistema p 17
    sib'4\tr~sib16 la sol fa mib re do sib

    %74
    fa'4\tr~fa16 mib re do sib la sol fa
    sib4\tr~sib16 la sol fa mib re do sib
    fa'2\tr r4

    %77
    \con \terzinequarto \tuplet 3/2 { fa'8(sol lab) } lab8[(fa)] \appoggiatura mib re8.(do16)
    do4(si8) lab' sol16(fa) mib(re)
    mib(re do8)~do2\mbreak

    %80
    \tuplet 3/2 { sol'8(la sib) } sib[(sol)] \appoggiatura fa mi8. re16
    re4(dod8) sib' la16(sol) fa(mi)
    fa(mi re8)~re2

    %83
    la'4 sol4.(fad8)
    si4 la4.(sold8)
    do4 si4.(la8)

    %86
    re4 do4.(si8)
    mi4 re4.(dod8)
    dod?2~dod8(re)\mbreak

    %89
    sold,2~sold8(la)
    dod,2~dod8(re)
    sold,16(re' mi) fa\staccatissimo mi\staccatissimo re\staccatissimo sold,\staccatissimo re'\staccatissimo sold,(re' mi) re\staccatissimo

    %92
    sold,16(re' mi) fa\staccatissimo mi\staccatissimo re\staccatissimo sold,\staccatissimo re'\staccatissimo sold,(re' mi) re\staccatissimo
    sol,!(dod mi) sib' mi, dod sol dod sol(dod mi) dod
    sol(dod mi) sib' mi, dod sol dod sol(dod mi) dod\mbreak

    %95
    re,(do'? fad) la fad do re, do' re,(do' fad) do
    re,(do' fad) la fad do re, do' re,(do' fad) do
    re,(si' fa'?) la fa si, re, si' re,(si' fa') si,

    %98
    re,(si' fa') la fa si, re, si' re,(si' fa') si,
    sol(sib! mi) sol mi sib sol sib sol(sib mi) sib
    sol(sib mi) sol mi sib sol sib sol(sib mi) sib\mbreak

    %101
    do,(mib la) do la mib do mib do(mib la) mib
    do(mib la) mib' la, mib do mib do(mib la) mib
    sib(fa' sib) re sib fa sib, fa' sib,(fa' sib) fa

    %104
    sib,(fa' sib) re sib fa sib, fa' sib,(fa' sib) fa
    sol,(fa' si) re si fa sol, fa' sol,(fa' si) fa
    sol,(fa' si) re si fa sol, fa' sol,(fa' si) fa\mbreak

    %107
    sol,(mib' do') mib do mib, sol, mib' sol,(mib' do') mib
    sol,,(mib' do') mib do mib, sol, mib' sol,(mib' do') mib
    lab,,(fa' do') mib do fa, lab, fa' lab,(fa' do') mib

    %110
    lab,,(fa' do') mib do fa, lab, fa' lab,(fa' do') mib
    sol,,8(si re fa si re)
    fa(si re2)\mbreak

    %113
    fa16(mib) fa(mib) re(do) re(do) si(la) sol(fa)
    fa4\tr mib r
    \senza\tuplet 3/2 { sol8(mib do sol[do mib] do' mib, do)

    %116
    reb (do reb lab'[sol fa] mib reb do)
    si(la si sol'[fa mib] re? do si)
    do (si do do[si do] do si do)}

    %119
    do'16(si32 la sol fa mib re do si? lab sol fa mib re do) re'4\tr\mbreak
    do16 do sib lab sol lab sol fa mib fa mib re
    do sol' fa mib re mib re do si do si la

    %122
    sol4 r8 mib'' fa16(mib) fa(re)
    mib4 r8 do re16(do) re(si)
    do4 r8 mib\p  fa16(mib) fa(re)

    %125
    mib4 r8 do re16(do) re(si)
    do4 r8 sol' la16(sol) la(fad)
    sol8 mib re sib'? do16(sib) do(la)\mbreak

    %128
    sib8 do re mib re16(do) sib(la)
    sib8 do re mib re16(do) sib(la)
    sib8 la sol4 r

    %131
    \tuplet 3/2 { sol'8(fa mib re[mib fa] sol fa sol)
    mib(re mib} mib2\tr)
    \tuplet 3/2 { fa8(mib re do[re mib] fa mib fa)

    %134
    re(do re} re2\tr)\mbreak
    \tuplet 3/2 { mib8(re do sib[do re] mib re mib)
    do(sib do} do2\tr)

    %137
    \tuplet 3/2 { re8(do sib la[sib do] re do re)
    sib(sol re) sib'[(sol re)] sib'(do re)
    la(fad re) la'[(fad re)] la'(sib do)

    %140
    sib(sol re) sib'[(sol re)] sib'(do re)}
    sib2\tr(la4)
    sol16 sib sol re sib re sib sol re sol re sib\mbreak

    %143
    \appoggiatura sib8 do2.
    fa'16 la fa do la do la fa do fa do la
    \appoggiatura la8 sib2.

    %146
    mib'16 sol mib  sib sol sib sol mib sib mib sib sol
    \appoggiatura sol8 la2.
    fad''16 la fad do la do la fad re mib' do la

    %149
    sib re sib fad sol sib sol re mib sol mib si\mbreak
    do4 mib''2~
    mib4 re8(do) sib(lab)

    %152
    sol(fad) fad4(sol)
    re,16(sib' sol') sib sib4(la8.) sol16
    mib,(do' sol') sib sib4(la8.) sol16

    %155
    mib,(dod' sol') sib sib4(la8.) sol16
    re,(la' fad') do' do4(sib8.) la16
    sib re-.(do-. sib-. la-. sol-. fad-. mi-. re-. do-. sib-. la-.)\mbreak

    %158
    sol8 r16 sol' \appoggiatura {sol16[la]} la2\tr
    sol16 sol, fa mib re mib re do sib do sib la  %% ripresa
    sol sol' fa  mib re mib re do sib do sib la

    %161
    sol4 r8 re''\f  mib16(re) mib(do)
    re8 do sib sol' la16(sol) la(fad)
    sol4 r8 re\p[mib16(re) mib(do)]

    %164
    re8 do sib sol' la16(sol) la(fad)\mbreak
    sol4\fermata r r

}

IIIvlIn =  \relative do'' {

    r16 sol fa mib re mib re do sib do sib la
    sol8 sib' re sib do la
    sib16 sol fa mib re mib re do sib do sib la

    %4
    sol8 sol'' sib sol la fad
    sol16 sol ,fa mib re mib re do sib do sib la
    sol re'' do sib la sib la sol fad sol fad mi

    %7
    re sol' fa  mib re mib re do sib do sib la
    sol4 r r
    sib'8\staccatissimo\p re,\staccatissimo re4(mib8) re\staccatissimo

    %10
    re\staccatissimo si\staccatissimo si4(do)
    la'8\staccatissimo do,\staccatissimo do4(re8) do\staccatissimo
    do\staccatissimo la\staccatissimo la4(sib)

    %13
    sol'8\staccatissimo sib,\staccatissimo sib4(do8) sib\staccatissimo
    sib sol sol4(la)
    mi'8 sol, sol4(la8) sol

    %16
    fad mib' mib4(re8) do
    sib sol' sol4(fa8) mib\mbreak  %% fine p 13 OK
    re sib' sib4(la8) sol

    %19
    fad mib mib4(re8) do
    sib16 sol fa mib re mib re do sib do sib la  %% ripresa
    sol sol' fa  mib re mib re do sib do sib la

    %22
    sol4 r8 re''\f  mib16(re) mib(do)
    re8 do sib sol' la16(sol) la(fad)
    sol4 r8 re\p[mib16(re) mib(do)]

    %25
    re8 do sib sol' la16(sol) la(fad)\mbreak
    sol4 r r
    R2.*8

    %35
    fa,8 sib r4 r
    fa8 sib r4 r
    sib8 sol r4 r

    %38
    sol8 do r4 r
    do8 la r4 r
    la8 re r4 r

    %41
    re8 sib r4 r\mbreak
    sib8 mib r4 r
    do8 mib r4 r

    %44
    fa,2.~
    fa
    sol4 sol sol

    %47
    do2.~\mbreak
    do
    re4 re re

    %50
    re do do
    sib,16 sib' la sol fa sol fa mib re mib re do

    %52
    \once\stemUp sib8 re' fa re mib do
    re16 sib la sol fa sol fa mib re mib re do
    \once\stemUp sib8 sib'' re sib do la\mbreak

    %55
    sib\staccatissimo fa\staccatissimo fa4(sol8) fa\staccatissimo
    fa\staccatissimo re\staccatissimo re4(mib)
    do'8\staccatissimo mib,\staccatissimo  mib4(fa8) mib\staccatissimo

    %58
    mib?\staccatissimo dod\staccatissimo dod4(re)
    sib'8\staccatissimo re,\staccatissimo re4(mib8) re\staccatissimo
    re\staccatissimo si\staccatissimo si4(do)

    %61
    sol'8 sib, ?sib4(do8) sib
    la16 fa' mib re do re do sib la sib la sol
    fa sib la sol fa sol fa mib re mib re do
    sib4 r8 fa'' sol16(fa) sol(mib)

    %65
    fa8 mib re sib' do16(sib) do(la)
    sib4 r r
    R2.*10

    %77
    do,4 do do
    re2 si4
    sol sol sol\mbreak

    %80
    re' re re
    mi!2 dod4
    la la la

    %83
    la la la
    si si si
    do do do

    %86
    re re re
    mi mi mi
    mi8 mi mi mi mi fa\mbreak

    %89
    si, si si si si do
    mi, mi mi mi mi fa
    si,4 r8 sold' sold[sold]

    %92
    sold?4 r8 sold sold[sold]
    sol!4 r8 sol sol[sol]
    sol4 r8 sol sol[sol]\mbreak

    %95
    fad4 r8 fad fad[fad]
    fad?4 r8 fad fad[fad]
    fa!4 r8 fa fa[fa]

    %98
    fa4 r8 fa fa[fa]
    mi4 r8 mi mi[mi]
    mi4 r8 mi mi[mi]\mbreak

    %101
    mib4 r8 mib mib[mib]
    mib?4 r8 mib mib[mib]
    re4 r8 re re[re]

    %104
    re4 r8 re re[re]
    re4 r8 re re[re]
    re4 r8 re re[re]\mbreak

    %107
    mib4 r8 mib mib[mib]
    mib?4 r8 mib mib[mib]
    fa4 r8 fa fa[fa]

    %110
    fa4 r8 fa fa[fa]
    fa4 fa fa
    fa fa fa\mbreak

    %113
    fa fa si
    sol sol sol
    mib'2.

    %116
    reb
    re!
    mib

    %119
    mib?4 do si
    do16 do sib lab sol lab sol fa mib fa mib re
    do sol' fa mib re mib re do si do si la

    %122
    sol4 r8 mib'' fa16(mib) fa(re)
    mib4 r8 do re16(do) re(si)
    do4 r8 mib\p  fa16(mib) fa(re)

    %125
    mib4 r8 do re16(do) re(si)
    do4 r r
    R2.*4

    %131
    re,8 si' re, si' re, si'
    do2.
    do,8 la' do, la' do, la'

    %134
    sib2.\mbreak
    sib,8 sol' sib, sol' sib, sol'
    la2.

    %137
    la,8 fad' la, fad' la, fad'
    re'2.\tr~
    re~

    %140
    re~
    re
    sol16 sib sol re sib re sib sol re sol re sib\mbreak
    r8 do do do do sib

    %144
    la4 r r
    r8 sib sib sib sib la
    sol4 r r

    %147
    r8 la la la sib do
    re4 r r
    sol, r r\mbreak

    %150
    do do do
    do do do
    re4. do8 sib la

    %153
    sol4 re'' re
    do do do
    dod dod dod

    %156
    la la la
    sol fad fad\mbreak
    sol sol fad

    %159
    sib16 sol fa mib re mib re do sib do sib la  %% ripresa
    sol sol' fa  mib re mib re do sib do sib la
    sol4 r8 re''\f  mib16(re) mib(do)

    %162
    re8 do sib sol' la16(sol) la(fad)
    sol4 r8 re\p[mib16(re) mib(do)]
    re8 do sib sol' la16(sol) la(fad)\mbreak

    %165
    sol4\fermata r r

}

IIIvlIIn = \relative do'' {

    r16 sol fa mib re mib re do sib do sib la
    sol8 sol' sib sol la fad
    sol16 sol fa mib re mib re do sib do sib la

    %4
    sol8 sib' re sib do la
    sib16 sol fa mib re mib re do sib do sib la
    sol re'' do sib la sib la sol fad sol fad mi

    %7
    re sol' fa  mib re mib re do sib do sib la
    sol4 r r
    re'8\staccatissimo\p sib\staccatissimo sib4(do8) sib\staccatissimo

    %10
    sib\staccatissimo sol\staccatissimo \once\slurDashed fa4 (mib)
    do'8\staccatissimo la\staccatissimo la4(sib8) la\staccatissimo
    la\staccatissimo fa\staccatissimo \once\slurDashed mib4 (re)

    %13
    sib'8\staccatissimo sol \staccatissimo sol4(la8) sol\staccatissimo
    sol mib \once\slurDashed re4 (do)
    la'8 mi! mi4(fad8) mi

    %16
    re8 do' do4(sib8) la
    sol mib' mib4(re8) do\mbreak
    sib sol' sol4(fad8) mib

    %19
    re do do4(sib8) la
    sol16 sol fa mib re mib re do sib do sib la  %% ripresa
    sol sol' fa  mib re mib re do sib do sib la

    %22
    sol4 r8 sib'\f do16(sib) do(la)
    sib8 la sol sib do16(sib) do(la)
    sib4 r8 sib\p[do16(sib) do(la)]

    %25
    sib8 la sol sib do16(sib) do(la)\mbreak
    sib4 r r %%%% fine ripresa
    R2.*8

    %35
    re,8 fa r4 r
    re8 fa r4 r
    sol8 sib r4 r

    %38
    mi,!8 sol r4 r
    la8 do r4 r
    fad,8 la r4 r

    %41
    sib8 re r4 r\mbreak
    sol,8 sib r4 r
    sol8 do r4 r

    %44
    re,2.~
    re
    sib'4 sib sib

    %47
    la2.~\mbreak
    la
    fa4 fa fa

    %50
    sib sib la
    sib,16 sib'la sol fa sol fa mib re mib re do
    sib8 sib' re sib do la

    %53
    sib16 sib la sol fa sol fa mib re mib re do
    \once\stemUp sib8 re' fa re mib do\mbreak
    re8 re re4(mib8) re

    %56
    re sib \once\slurDashed la4 (sol)
    fa'8 do do4(re8) do
    do la \once\slurDashed sol4 (fa)

    %59
    mib'8 sib sib4(do8) sib
    sib sol \once\slurDashed fa4 (mib)
    mi'?8 sol, sol4(la8) sol

    %62
    fa16 fa' mib re do re do sib la sib la sol
    fa sib la sol fa sol fa mib re mib re do
    sib4 r8 re' mib16(re) mib(do)

    %65
    re8 do sib re mib16(re) mib(do)
    re4 r r
    R2.*10

    %77
    fa,4 fa fa
    sol si sol
    mib mib mib\mbreak

    %80
    sol sol sol
    la dod la
    fa fa fa

    %83
    fad fad fad
    re sold sold
    mi la la

    %86
    fad si si
    la la la
    dod8 dod dod dod la la\mbreak

    %89
    sold sold sold sold mi mi
    dod dod dod dod la la
    sold4 r8 si' si[si]

    %92
    si?4 r8 si si[si]
    mi,4 r8 dod dod[dod]
    dod?4 r8 dod dod[dod]\mbreak

    %95
    la'4 r8 la la[la]
    la4 r8 la la[la]
    re,4 r8 si si[si]

    %98
    si?4 r8 si si[si]
    sol'4 r8 sol sol[sol]
    sol4 r8 sol sol[sol]\mbreak

    %101
    do,4 r8 do do[do]
    do4 r8 la la[la]
    fa'4 r8 fa fa[fa]

    %104
    fa4 r8 fa fa[fa]
    si,4 r8 si si[si]
    si?4 r8 si si[si]\mbreak

    %107
    sol4 r8 sol' sol[sol]
    sol4 r8 sol sol[sol]
    do,4 r8 do do[do]

    %110
    do4 r8 do do[do]
    si4 si si
    si? si si\mbreak

    %113
    si? si si
    do do do
    sol'2.

    %116
    lab
    si
    sol

    %119
    mib4 mib re\mbreak
    do'16 do sib lab sol lab sol fa mib fa mib re
    do sol' fa mib re mib re do si do si la

    %122
    sol4 r8 do' re16(do) re(si)
    do4 r8 mib,? fa16(mib!) fa(re)
    mib4 r8 do'\p re16(do) re(si)

    %125
    do4 r8 mib,? fa16(mib) fa(re)
    mib4 r r
    R2.*4

    %131
    re8 si' re, si' re, si'
    sol2.
    do,8 la' do, la' do, la'

    %134
    fa2.\mbreak
    sib,8 sol' sib, sol' sib, sol'
    mib2.

    %137
    la,8 fad' la, fad' la, fad'
    sib4 sib re
    la la fad

    %140
    sib sib sol
    sol sol fad
    sol'16 sib sol re sib re sib sol re sol re sib\mbreak
    r8 do do do do sib

    %144
    la4 r r
    r8 sib sib sib sib la
    sol4 r r

    %147
    r8 la la la sib do
    re4 r r
    sol, r r\mbreak

    %150
    do do do
    do do do
    re4. do8 sib la

    %153
    sol4 sib' sib
    sol sol sol
    sol sol sol

    %156
    fad fad fad
    re re la'\mbreak
    sib la la

    %159
    sib16 sol fa mib re mib re do sib do sib la  %% ripresa
    sol sol' fa  mib re mib re do sib do sib la
    sol4 r8 sib'\f do16(sib) do(la)

    %162
    sib8 la sol sib do16(sib) do(la)
    sib4 r8 sib\p[do16(sib) do(la)]
    sib8 la sol sib do16(sib) do(la)\mbreak

    %165
    sib4\fermata r r

}

IIIvlan =  \relative do' {

    r16 sol' fa mib re mib re do sib do sib la
    sol8 re' sol re mib re
    re16 sol fa mib re mib re do sib do sib la

    %4
    sol8 re' sol re mib re
    re16 sol fa mib re mib re do sib do sib la
    \once\stemUp sol re'' do sib la sib la sol fad sol fad mi

    %7
    re sol' fa? mib re mib re do sib do sib la
    sol4 r r
    sol\p sol sol

    %10
    sol sol, do
    fa fa fa
    fa fa, sib

    %13
    mib mib mib
    mib? mib, la
    dod dod dod

    %16
    re re re
    re re re\mbreak
    re re re

    %19
    re re re
    sol16 sol fa mib re mib re do sib do sib la  % ripresa
    sol sol' fa mib re mib re do sib do sib la

    %22
    sol4 r8 sol'\f sol sol
    sol4 r8 sol fad[fad]
    re4 r8 sol\p sol sol

    %25
    sol4 r8 sol fad fad\mbreak
    re4 r r   %%%%%\fine ripresa
    R2.*8\mbreak

    %35
    sib8 re r4 r
    sib8 re r4 r
    mib8 mib, r4 r

    %38
    do'8 mi! r4 r
    fa8 fa, r4 r
    re'8 fad r4 r

    %41
    sol8 sol, r4 r\mbreak
    mib'8 sol r4 r
    mib8 la, r4 r

    %44
    sib2.~
    sib
    mib4 mib mib

    %47
    fa2.~\mbreak
    fa
    sib,4 sib sib

    %50
    sib fa' fa,
    sib16 sib' la sol fa sol fa mib re mib re do
    sib8 fa' fa fa sol[fa]

    %53
    fa16 sib sol sol fa sol fa mib re mib re do
    sib8 fa' fa fa sol fa\mbreak
    fa4 sib sib

    %56
    sib sib, mib
    la la la
    la sol, do

    %59
    sol' sol sol
    sol fa, do'
    mi! mi mi

    %62
    fa16 fa' mib re do re do sib la sib la sol
    fa sib la sol fa sol fa mib re mib re do\mbreak
    sib4 r8 sib' sib sib

    %65
    fa fa fa fa la la
    fa4 r r
    R2.*10

    %77
    lab,4 lab lab
    sol sol sol
    do do do\mbreak

    %80
    sib sib sib
    la la la
    re re re

    %83
    re re re
    sol, mi' mi
    la, fa' fa

    %86
    si, sold' sold
    dod, la' la
    la8 la la la sol fa\mbreak

    %89
    mi mi mi mi re dod
    la la la la sol fa
    mi4 r8 mi' mi mi

    %92
    mi4 r8 mi mi mi
    dod4 r8 la la la
    la4 r8 la la la\mbreak

    %95
    re4 r8 re re re
    re4 r8 re re re
    si4 r8 sol sol sol

    %98
    sol4 r8 sol sol sol
    do4 r8 do do do
    do4 r8 do do do\mbreak

    %101
    la4 r8 fa fa fa
    fa4 r8 fa fa fa
    sib4 r8 sib sib sib

    %104
    sib4 r8 sib sib sib
    sol4 r8 sol sol sol
    sol4 r8 sol sol sol\mbreak

    %107
    do,4 r8 do do do
    do4 r8 do do do
    lab'4 r8 lab lab lab

    %110
    lab?4 r8 lab lab lab
    sol4 sol sol
    sol sol sol\mbreak

    %113
    sol sol sol
    do do do
    do2.

    %116
    fa,
    sol
    do

    %119
    do4 sol sol\mbreak
    do16 do' sib lab sol lab sol fa mib fa mib re
    do sol' fa  mib re mib re do si do si la

    %122
    sol4 r8 sol' si si
    sol4 r8 sol, si si
    sol4 r8 sol'\p si si

    %125
    sol4 r8 sol, si si
    sol4 r r
    R2.*4

    %131
    si8 sol' si, sol' si, sol'
    do, sol' do, sol' do, sol'
    la, fa' la, fa' la, fa'

    %134
    sib, fa' sib, fa' sib, fa'\mbreak
    sol, mib' sol, mib' sol, mib'
    la, mib'? la, mib' la, mib'

    %137
    fad, re' fad, re' fad, re'
    sol,4 sol' sol
    fad fad fad

    %140
    sol sol sol
    re re re
    sol, r r\mbreak

    %143
    r8 do do do do sib
    la4 r r
    r8 sib sib sib sib la

    %146
    sol4 r r
    r8 la la la sib do
    re4 r r

    %149
    sol, r r\mbreak
    do do do
    do do do

    %152
    re4. do8 sib la
    sol4 sol sol
    mib' mib mib

    %155
    mib? mib mib
    re re re
    sol, re' re\mbreak

    %158
    sol, re' re
    sol, 16 sol' fa mib re mib re do sib do sib la  % ripresa
    sol sol' fa mib re mib re do sib do sib la

    %161
    sol4 r8 sol'\f sol sol
    sol4 r8 sol fad[fad]
    re4 r8 sol\p sol sol

    %164
    sol4 r8 sol fad fad\mbreak
    re4\fermata r r

}

IIIbcn = \relative do {

    r16 sol' fa mib re mib re do sib do sib la
    sol8 sol' sol, sol' do, re
    sol,16 sol' fa mib re mib re do sib do sib la

    %4
    sol8 sol' sol, sol' do, re
    sol,16 sol' fa mib re mib re do sib do sib la
    \once\stemUp sol re'' do sib la sib la sol fad sol fad mi

    %7
    re \clef tenor sol' fa? mib re mib re do sib do sib la
    \clef bass sol4 r r
    R2.*11

    %20
    r16 sol fa mib re mib re do sib do sib la  % ripresa
    sol sol' fa mib re mib re do sib do sib la
    sol4 r8 sol' \f do do,

    %23
    sol' re sol, sol' re' [re,]
    sol,r r8 sol'\p do do,
    sol' re sol, sol' re' [re,]\mbreak

    %26
    sol,4 r8 fad' sol sol,  % fine ripresa
    re''8 do re sib do fad,
    sol fad sol sol, la'[fad]

    %29
    sol fad sol sol, do'[fad,]
    sol fad sol sol, sib'4
    do do, la'

    %32
    sib sib, sol'
    re' sib sol
    fa8 mib fa sol la fa\mbreak

    %35
    sib,4 r r
    R2.*15
    sib16 sib' la sol fa sol fa mib re mib re do

    %52
    sib8 sib' sib, sib' mib, fa
    sib,16 sib' la sol fa sol fa mib re mib re do
    sib8 sib' sib, sib' mib, fa\mbreak

    %55
    sib,4 r r
    R2.*6
    r16 fa'' mib re do re do sib la sib la sol

    %63
    fa sib la sol fa sol fa mib re mib re do\mbreak
    sib4 r8 sib mib mib,
    sib'' fa sib, sib' fa[fa,]

    %66
    sib4 sol' fa
    fa' fa, mib
    mib' mib, re

    %69
    re' re, do
    do' do, sib
    sib' sib, la

    %72
    la' la, sol\mbreak
    re''8 sib sib,4 r
    re'8 sib sib,4 r

    %75
    re'8 sib sib,4 r
    fa8 fa' mib re do sib
    lab4 r r

    %78
    R2.*42
    do16 do' sib lab sol lab sol fa mib fa mib re
    do sol' fa  mib re mib re do si do si la

    %122
    sol sol' fa sol mib re mib do sol'8 sol,
    do16 mib fa sol mib re mib do sol'8 sol,
    do16 mib fa sol mib\p re mib do sol'8 sol,

    %125
    do16 mib fa sol mib re mib do sol'8 sol,
    do4 r8 sol' re' re,
    sol do, sib sol do re\mbreak

    %128
    sol, la sib do fad,[re]
    sol la sib do fad,[re]
    sol re' sol re sib sol

    %131
    R2.*11
    sol4 r r
    r8 do do do do sib

    %144
    la4 r r
    r8 sib sib sib sib la
    sol4 r r

    %147
    r8 la la la sib do
    re4 r r
    sol, r r\mbreak

    %150
    do do do
    do do do
    re4. do8 sib la

    %153
    sol4 r r
    R2.*5
    r16 sol' fa mib re mib re do sib do sib la  % ripresa

    %160
    sol sol' fa mib re mib re do sib do sib la
    sol4 r8 sol' \f do do,
    sol' re sol, sol' re' re,

    %163
    sol,r r8 sol'\p do do,
    sol' re sol, sol' re' [re,]\mbreak
    sol,4\fermata r r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 60
  s2.*165
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
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] All[egr]o mà non molto"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino""principale]"}
            \Ivl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.8
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
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
            \set Staff.midiInstrument = #"cello"
            \IIbc
        >>
    >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.8
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[3.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
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
            \set Staff.midiInstrument = #"cello"
            \IIIbc
        >>
    >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.8
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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






