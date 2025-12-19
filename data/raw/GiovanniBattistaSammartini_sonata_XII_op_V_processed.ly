\language "italiano"
%********************************** VARIABILI

\version "2.24.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}


tr = \trill

ten = _\markup \italic "ten"

cres = _\markup \italic "cres"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.6

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

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


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
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
    \override TupletNumber.transparent = ##f
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

Ifln = \relative do'' {

    sol'4
    re si8.(re16) do4 la8.(do16)
    do8(si) sol'4 r r8 sol,
    re'[(do) si-. fad'-.] fad[(la) sol-. mi-.]

    %4
    re[(do) si-. fad'-.] fad[(la) sol-. mi-.]
    re(do) si-. re-. re4 do\prall
    si8.(re16) si8.[(sol16)] re8.(sol16) si8.[(re16)]

    %7
    re8(si) do2.\mbreak
    fad8 fad\prall  sol sol\prall la4 r
    R1*4

    %13
    re,,8.[mi16 re8. mi16] \once\stemUp re8. la''16 \tuplet 3/2 { si8[(fad sol)] }
    re,8.[mi16 re8. mi16] \once\stemUp re8. la''16 \tuplet 3/2 { si8[(fad sol)] }
    re,4 r r2

    %16
    r r4 re'\prall\mbreak
    \con la'2~\tuplet 6/4 { la8 re, mi fad sol la }\senza
    \tuplet 3/2 { si(sol re')} re2 si4

    %19
    \con la2~\tuplet 6/4 { la8 re, mi fad sol la }\senza
    \tuplet 3/2 { si(sol re')} re2 si4\prall
    la4 re,8(sol) fad(si) la(do)

    %22
    do4(si2) la4
    r4 \tuplet 3/2 { fad8(sol la) do[(si la)] do(si la) }
    \grace la8 sol2 \con\tuplet 6/4 { si8 la sol fad mi red }\senza

    %25
    red?4(mi) r2\mbreak
    r4 dod8(fad) mi(la) sol(si)
    si4(la2) sol4
    r \tuplet 3/2 { mi8(fad sol) si[(la sol)] si(la sol) }

    %29
    fad4 la16(sol fad mi) re?4 red
    mi r r2
    r4 la16(sol fad mi) re4 red

    %32
    mi r r2\mbreak
    re4 \grace si'8 la sol16 fad mi8 sol fad dod
    re4 \grace si'8 la sol16 fad mi8 sol fad dod

    %35
    re4 r8 r16 fad, sol8.[la16 si8. dod16]
    dod4(re8.) fad,16  sol8.[la16 si8. dod16]
    re4 re, r re'

    %38
    la'2 \grace mi8 fad4 \grace mi8 re4
    dod8.(re32 mi) re2.
    do!8 do\prall fad fad\prall la4 r8 r16 do,\mbreak

    %41
    do4.\prall (si16 do) do4.\prall (si16 do)
    sib8.[sib16 sol'8. sol16] sib?4 r8 r16 sol
    sol4.\prall (fad16 sol) \grace dod,?8 sib4.(la16 sib)

    %44
    la4 \tuplet 3/2 { re8(fad la) } re,,4 r
    re'2~\con\tuplet 6/4 { re8 mi fad sol la si? }
    re,2~\tuplet 6/4 { re8 mi fa? sold la si }

    %47
    si sold fa4\prall mi\prall re\prall
    do4 mi~\tuplet 6/4 { mi8 fad? sold lad si dod }\mbreak
    mi,2~\tuplet 6/4 { mi8 fad sold lad si dod }

    %50
    dod lad sol?4\prall fad\prall mi\prall
    r sol32[(la si la sol8)] fad4 mi
    r fad32(sol la sol fad8) mi4 re

    %53
    r mi32(fad sol fad mi8) re4 dod
    \senza \tuplet 3/2 { re8(fad si) sol[(mi sol)] fad(re si) lad[(dod mi)] }
    re4 r\mbreak r2

    %56
    r4 \tuplet 3/2 { sol8(fad mi) lad,[ (dod mi)] \grace lad? sol(fad mi)}
    re4 r r2
    r4 \tuplet 3/2 { sol8(fad mi) lad,[ (dod mi)] \grace la sol(fad mi)}

    %59
    \grace mi re8.(do?16) si4 r sol'
    re si8.(re16) do4 la8.(do16)
    do8(si) sol'4 r sol,

    %62
    re'8(do) si-. fad'-. fad(la) sol-. mi-.\mbreak
    re(do) si-. fad'-. fad(la) sol-. mi-.
    re(do) si-. re-. re4 do\prall

    %65
    si16[(re8.) si16(sol8.)] re16[(sol8.) si16(re8.)]
    re8(si) do2.
    R1*5\mbreak

    %72
    r2 r4 re
    \con la'2~\tuplet 6/4 { la8 fad sol la si do }\senza
    \tuplet 3/2 { si (sol re') } re2 si4\prall

    %75
    \con la2~\tuplet 6/4 { la8 fad sol la si do }\senza
    \tuplet 3/2 { si (sol re') } re2 si4\prall
    la re, re'2

    %78
    re do
    do si4 re,
    \tuplet 3/2 { mi8(fad sol) } sol4 \con \tuplet 6/4 { la8 [do si la  si do] }\senza

    %81
    \tuplet 3/2 { re,(mi fad) } fad4\prall \con \tuplet 6/4 {sol8 si la sol la si }\mbreak
    do,4 \grace do8 si la16 sol la8 do si fad
    sol4 \grace sol'8 si la16 sol la8 do si fad

    %84
    fad4(sol) r2
    r4 fa32(sol la sol fa8) mi4 re
    r mi32(fad? sol fad mi8) re4 do

    %87
    r \grace fad8 mi re16 do si4 la\prall
    sol r8 r16 si do8.[re16 mi8. fad16]
    fad4(\once\stemDown sol8.) si,,16 do8.[re16 mi8. fad16]

    %90
    sol4 r r re' sol,4 r r2

}


IvlIn = \relative do'' {

    sol'4
    re si8.(re16) do4 la8.(do16)
    do8(si) sol'4 r r8 sol,
    re'[(do) si-. fad'-.] fad[(la) sol-. mi-.]

    %4
    re[(do) si-. fad'-.] fad[(la) sol-. mi-.]
    re(do) si-. re-. re4 do\prall
    si8.(re16) si8.[(sol16)] re8.(sol16) si8.[(re16)]

    %7
    re8(si) do2.\mbreak
    fad8 fad\prall  sol sol\prall la4 r8 r16 re,
    re8 si do2.

    %10
    fad8 fad\prall  sol sol\prall la4 r8 r16 do,
    si8 do re re, mi mi' mi, re
    do do' si si, la la' sol sol,

    %13
    re'8.[mi16 re8. mi16] \once\stemUp re8. la''16 \tuplet 3/2 { si8[(fad sol)] }
    re,8.[mi16 re8. mi16] \once\stemUp re8. la''16 \tuplet 3/2 { si8[(fad sol)] }
    re,8. re'16 si8. si16 sol8. sol16 dod,8. dod16

    %16
    re4 r r re'\prall\mbreak
    \con fad2~\tuplet 6/4 { fad8 re dod re mi fad }\senza
    \tuplet 3/2 { sol(re si') } si2 sol4\prall

    %19
    \con fad2~\tuplet 6/4 { fad8 re dod re mi fad }\senza
    \tuplet 3/2 { sol(re si') } si2 sol4\prall
    fad r re8 \parenthesize (sol) fad  \parenthesize (la)

    %22
    la4(sol2) fad4
    r \tuplet 3/2 { red8(mi fad) la[(sol fad)] la(sol fad) }
    mi4 mi, r2

    %25
    sol' \tuplet 3/2 {
        si8 la sol fad[mi re]
        dod si la
    } la,4 dod'8(fad) mi(sol)
    sol4(fad2) mi4

    %28
    r \tuplet 3/2 { dod8(re mi) sol[(fad mi)] sol(fad mi) }
    re4 re, r2
    r4 si''16(sol) mi8 dod16[(la) sol8] mi16(dod?) la8

    %31
    re4 re' r2
    r4 si'16(sol) mi8 dod16[(la) sol8] mi16(dod?) la8
    re4 \grace sol'8 fad mi16 re si4 la8. sol16

    %34
    fad4 \grace sol'8 fad mi16 re si4 la8. sol16
    fad4 r8 r16 fad sol8. la16 si8. dod16
    dod4(re8.) fad,16 sol8. la16 si8. dod16

    %37
    re4 re, r2
    la''2 \grace mi8 fad4 \grace mi8 re4
    dod8.(re32 mi) re2.

    %40
    do!8 do\prall fad fad\prall la4 r8 r16 do,\mbreak
    do4.\prall (si16 do) do4.\prall (si16 do)
    sib8.[sib16 sol'8. sol16] sib?4 r8 r16 sol

    %43
    sol4.\prall (fad16 sol) \grace dod,?8 sib4.(la16 sib)
    la4 \tuplet 3/2 { re8(fad la) } re,,4 r
    r2 re'~

    %46
    \con\tuplet 6/4 { re8 mi fad sol la si? } re,2~
    re4 re\prall do\prall si\prall
    la r do mi~\mbreak

    %49
    \tuplet 6/4 { mi8 fad sold lad si dod } mi,2~
    mi4 mi\prall re\prall dod\prall
    r mi32(fad sol fad mi8) re4 dod

    %52
    r re32(mi fad mi re8) dod4 si
    r dod32(re mi re dod8) si4 lad
    si si si dod

    %55
    r4 fad16(mi re dod?) \mbreak si4 sid
    dod r r2
    r4 fad16(mi re dod) \mbreak si4 sid

    %58
    dod r r2
    r r4 sol'
    re si8.(re16) do?4 la8.(do16)

    %61
    do8(si) sol'4 r sol,
    re'8(do) si-. fad'-. fad(la) sol-. mi-.\mbreak
    re(do) si-. fad'-. fad(la) sol-. mi-.

    %64
    re(do) si-. re-. re4 do\prall
    si16[(re8.) si16(sol8.)] re16[(sol8.) si16(re8.)]
    re8(si) do2.

    %67
    fad8 fad\prall sol sol\prall la4 r8 r16 re,
    re8(si) do2.
    fad8 fad\prall sol sol\prall la4 r8 r16 do,

    %70
    si8 re sol \stemUp si,, do \stemDown sol'' la\stemUp dod,,\stemNeutral
    re4 re'8. (la16) si8. \parenthesize (fad16) sol8.\parenthesize (dod,16)\mbreak
    re4 re' r re

    %73
    fad2~\tuplet 6/4 { fad8 re mi fad sol la } \senza
    \tuplet 3/2 { sol(re si')} si2 sol4\prall \con
    fad2~\tuplet 6/4 { fad8 re mi fad sol la } \senza

    %76
    \tuplet 3/2 { sol(re si')} si2 sol4\prall
    fad8. mi16 re4 r re
    \tuplet 3/2 { mi8(fad sol) } sol4\prall \con \tuplet 6/4 { la8 la, si do re mi } \senza

    %79
    \tuplet 3/2 { re(mi fad)} fad4\prall sol si,
    do4 mi mi mi
    re re re re\mbreak

    %82
    fad, sol mi re8. do16
    si4 \grace si'8 re do16 si mi8 mi,re do
    si4 si'8. re16 sol4 r

    %85
    r re32(mi fa mi re8) do4 si
    r do32(re mi re do8) si4 la
    r \grace re8 do si16 la sol4 fad\prall

    %88
    sol r8 r16 si do8.[re16 mi8. fad16]
    fad4(\once\stemDown sol8.) si,,16 do8.[re16 mi8. fad16]
    sol4 r r re' sol,4 r r2

}


IvlIIn = \relative do'' {

    sol'4
    si, sol8.(si16) la4 fad8.(la16)
    la8(sol) si4 r sol
    si8(la) sol-. re'-. re(fad) mi-. do-.

    %4
    si(la) sol-. re'-. re(fad) mi-. do-.\mbreak
    si(la) sol-. si-. si4 la\prall
    sol16(si8.) sol16 (re8.) si16(re8.) sol16(si8.)

    %7
    si16(sol8.) la16(do8.) fad16(sol8. la16 la,8.)
    la4 si do re,16(si'8.)
    si16(sol8.) la16(do8.) fad16(sol8. la16 la,8.)\mbreak

    %10
    la4 si do re,8. la'16
    si8 do re re, mi mi' mi, re
    do do' si si, la la' sol sol,

    %13
    re'4 si la \tuplet 3/2 { sol'8(la si) }
    la4 sol la \tuplet 3/2 { sol8(la si) }\mbreak
    la8. re16 si8. si16 sol8. sol16 dod,8. dod16

    %16
    re4 r r2
    re4 re re re
    re re re re

    %19
    re re re re
    re re re re
    re r r2

    %22
    red4 red red red8. fad16
    si,4 si si si\mbreak
    r si' sol la

    %25
    r si si si
    mi, r r la,
    la la la la

    %28
    la la la la
    re fad8. sol16 la4 la
    si si mi, dod'

    %31
    re fad,8. sol16 la4 la\mbreak
    si si mi, dod'
    r fad, sol la

    %34
    re, re' sol, la
    re, r8 r16 fad sol8.[la16 si8. dod16]
    dod4(re8.) fad,16  sol8.[la16 si8. dod16]

    %37
    re4 re, r re'
    fad, fad fad fad\mbreak
    sol fad fad fad

    %40
    fad fad fad fad
    fad fad fad fad
    sol sol sol \tuplet 3/2 { sol8(la sib) }

    %43
    sib4 sib sol sol
    fad fad8. fad16 fad4 r
    r si si, r

    %46
    r si' la la\mbreak
    sold r mi r
    la, la'8. do16 do,4 r

    %49
    dod' dod si si
    lad r r2
    fad4 fad fad fad

    %52
    fad fad fad fad
    fad fad fad fad
    si, mi re dod

    %55
    si re\mbreak fad fad
    sol sol fad lad
    si si fad fad

    %58
    sol sol fad lad
    si si, r sol''
    si, sol8.(si16) la4 fad8.(la16)\mbreak

    %61
    la8(sol) si4 r sol
    si8(la) sol-. re'-. re(fad) mi-. do-.
    si(la) sol-. re'-. re(fad) mi-. do-.\mbreak

    %64
    si(la) sol-. si-. si4 la
    sol16(si8.) sol16 (re8.) si16(re8.) sol16(si8.)
    si16(sol8.) la16(do8.) fad16(sol8.) la16 (la,8.)

    %67
    la4 si do re,8.(si'16)
    si16(sol8.) la16(do8.) fad16(sol8.) la16 (la,8.)\mbreak
    la4 si do re,8. la'16

    %70
    si8 re sol \stemUp si,, do \stemDown mi' la\stemUp dod,,\stemNeutral
    re4 re'8. (la16) si8. (fad16) sol8. (dod,16)\mbreak
    re4 re' r2

    %73
    re,4 re re re
    re re re re\mbreak
    re re re re

    %76
    re re re re
    re re fad fad
    si si la la

    %79
    la la sol sol
    sol do do do
    do do si si

    %82
    la sol sol fad8. la16
    sol4 r r2
    re'4 re8. re16 re4 r

    %85
    sol, sol sol sol
    sol sol sol fad
    r mi re do

    %88
    si r8 r16 si' do8.[re16 mi8. fad16]
    fad4(\once\stemDown sol8.) si,,16 do8.[re16 mi8. fad16]
    sol4 r r re' sol,4 r r2

}


Ibcn = \relative do {

    r4
    sol' r re r
    sol r sol, r
    sol' sol, sol sol

    %4
    sol' sol, sol sol
    sol' sol, re' re,
    sol' sol, sol sol

    %7
    re' re, re re
    re' re, re re\mbreak
    re' re, re re

    %10
    re' re, re re
    sol re''8 re, mi mi, mi' re
    do do' si si, la la' sol sol,

    %13
    re'4 sol fad sol
    fad si fad sol
    re'8. re16 si8. si16 sol8. sol16 dod,8. dod16

    %16
    re4 r r2\mbreak
    R1*4
    re4 r r2

    %22
    red4 r r2
    si4 r r2
    r4 mi mi, fad

    %25
    r sol sol sold
    la r r2
    R1

    %28
    la4 r r2
    re4 re fad fad
    sol sol, la la

    %31
    si si fad fad\mbreak
    sol sol la la
    si r r2

    %34
    R1
    re4 r8 r16 fad sol8. la16 si8. dod16
    dod4 re8. fad,16 sol8. la16 si8. dod16

    %37
    re4 r r2
    re,4 re, re re
    re re re re

    %40
    re re re re\mbreak
    re re re re
    re re re re'

    %43
    dod dod dod dod
    re re, re r
    r sol' sol, r

    %46
    r sol' fa fa
    mi r r2
    r4 la la, r

    %49
    la la sol sol
    fad r r2
    R1*4

    %55
    si4 si re re\mbreak
    mi mi fad fad
    sol sol re re

    %58
    mi mi fad fad
    si si, r2
    sol4 r re' r

    %61
    sol sol, r2
    sol'4 sol, sol sol
    sol' sol, sol sol

    %64
    sol' sol, re' re,
    sol' sol, sol sol
    re' re, re re\mbreak

    %67
    re re re re
    re' re, re re
    re re re re

    %70
    sol si do dod
    re re'8. la16 si4 sol8. dod,16
    re4 re, r2

    %73
    R1*4
    re'4 re, re re
    re re re re

    %79
    re re re re
    re re re re
    re re re re

    %82
    re sol do re
    mi r r2
    sol4 sol,8. sol16 sol4 r

    %85
    R1*2
    sol'4 do, re re,
    sol r8 r16 si do8. re16 mi8. fad16

    %89
    fad4 sol8. si,16 do8. re16 mi8. fad16
    sol4 r r2 sol4 r r2

}

Ibfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown
    s4
    s2 <7>
    s1
    s2 <6 4>
    <3> <6 4>
    s <6 4>4 <7>
    s1
    <6 4>4 <7 _ 3> <_> <_>
    <7>4 <6 4> <7> <6 4>8 s\mbreak
    <6 4>4 <7> s2
    <7>4 <6 4> <7> s
    s2 <7>4 <7>
    \bassFigureExtendersOff <6 5>4 <6> <6> s
    s <6> <6> <6>
    <6> <6> <6> <6>
    s <6> <6 5> <5/>
    s1*6
    <7 5/>1 <7 _+>
    s2 s4 <6\+>
    s <6> s <5/>
    <_+>1
    s
    <_+>
    s2 <6>4 <6\+>
    <6>2 <_+>
    s2 <6>4 <6\+>\mbreak
    <6>2 <_+>
    s1*2
    \bassFigureExtendersOn s2 <6 _ 5/>4 <_>8. <5/>16
    s2 <6 _ 5/>4 <_>8. <5/>16
    s1*2
    <7+>4 <3> s2
    <7!>1
    <7>
    <6- 4>
    <7- 5/>
    <_+>
    s
    s2 <6>
    <7 _+>1
    s
    s2 <6>
    <7 _+>1
    s1*4
    s2 <6>4 <6\+>\mbreak
    \bassFigureExtendersOff <6\+>2 <7 _+>
    s <6>4 <6\+>
    <6\+>2 <7 _+>
    s1
    s2 <7>
    s1*3
    s2 <7>
    s1
    <6 4>4 <7> s2\mbreak
    <7>4 <6 4> <7> <6 4>
    <6 4> <7> s2
    <7>4 <6 4> <7> s
    \bassFigureExtendersOn <_>2 <_>8 <_> <5/>4
    s2 <6>
    s1*6\bassFigureExtendersOff
    <6 4>2 <7>
    <7> <6 4>
    <7 2>1
    <7>2 <6 4>
    <7> <6 5>4 <7>
    s1*4
    s4 <6 5> <6 4> <7>
    s2 <6 5>4 s8. <5/>16
    s2 <6 5>4 s8. <5/>16

}


forma = {

    \time 2/2
    \key sol\major
    \tempo 2 = 70
    \partial 4 s4
    \bar ".|:"
    s1*37
    \bar ":..:"\break
    \repeat volta 2 {s1*52}
    \alternative {{s1}{s}}
    \bar "|."

}


Ifl = {
    \Iglobal
    \notypeset
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


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t   		\override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##f
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IIfln = \relative do'' {

    sol'4 si, do\prall
    re8(si) sol'2
    la,8 do fad la do fad,

    %4
    sol4 re2
    \grace re8 do4. mi8 la, do
    si(mi) re(si') fad(sol)

    %7
    \tuplet 3/2 { la,(si do) } si4 re8. fad,16
    sol4 r r
    R2.*4\mbreak

    %13
    dod8(mi) re2
    mi8.[(sol16) fad8.(si16)] la4
    \tuplet 3/2 { dod,8(re mi) } re2

    %16
    mi8.[(sol16) fad8.(si16)] la4
    si, la8.[sol16 fad8. mi16]
    re8 do'? do4\prall fad8 la

    %19
    la2.
    re,,8 si' si4\prall re8 sol
    sol2.

    %22
    re,8 do' do4\prall fad8 la
    la2.
    si,4 dod(re)

    %25
    mi fad(sol)
    \tuplet 3/2 { la8(sol fad) } la4 dod,-+
    re dod8(si) re(dod)\mbreak

    %28
    mi(re) fad(mi) sol(fad)
    \tuplet 3/2 { la(sol fad) } la4 dod,-+
    re r r

    %31
    la'2 \tuplet 3/2 { re8(do si) }
    si(la) do2
    \tuplet 3/2 { si8(la sol) } fad4 mi

    %34
    \grace sol8 fad mi re4 r
    la2 \tuplet 3/2 { re8(do si) }
    \grace do8 si sol do2

    %37
    si8 si' la sol \grace sol fad mi
    re fa mi re si' la
    \grace la sold2 fa4

    %40
    \grace sold8 fa? mi si' re, \grace re do si
    do4 r r
    R2.*31

    %73
    mi4 re8. [do16 \grace do8 si8. la16]
    sol4 r r

}


IIvlIn = \relative do'' {

    sol'4 si, do\prall
    re8(si) sol'2
    la,8 do fad la do fad,

    %4
    sol4 re2
    \grace re8 do4. mi8 la, do
    si(mi) re(si') fad(sol)

    %7
    \tuplet 3/2 { la,(si do) } si4 re8. fad,16
    sol4 re si
    si''2 la16(sol fad mi)

    %10
    \tuplet 3/2 { red8(mi fad) } mi2
    \tuplet 3/2 { sol8(fad mi) si'[(sol fad)] mi(fad re) }
    \grace re8 dod(si) la4 r\mbreak

    %13
    dod8(mi) re2
    mi8.[(sol16) fad8.(si16)] la4
    \tuplet 3/2 { dod,8(re mi) } re2

    %16
    mi8.[(sol16) fad8.(si16)] la4
    si, la8.[sol16 fad8. mi16]
    re8 do'? do4\prall fad8 la

    %19
    la2.
    re,,8 si' si4\prall re8 sol
    sol2.

    %22
    re,8 do' do4\prall fad8 la
    la2.
    si,4 dod(re)

    %25
    mi fad(sol)
    \tuplet 3/2 { la8(sol fad) } la4 dod,-+
    re dod8(si) re(dod)\mbreak

    %28
    mi(re) fad(mi) sol(fad)
    \tuplet 3/2 { la(sol fad) } la4 dod,-+
    re r r

    %31
    fad2 \tuplet 3/2 { si8(la sol) }
    sol fad la2
    \tuplet 3/2 { sol8(fad mi) } re4 dod

    %34
    \grace dod8 re4 re, r
    la'2 \tuplet 3/2 { re8(do? si) }
    \grace do si sol do2

    %37
    si8 si' la sol \grace sol fad mi
    re4 re re
    re re re

    %40
    do sold sold
    la8 mi' re do la' sol\mbreak
    \grace sol fad2 mib4

    %43
    mib?8 re la' do, \grace do si la
    \tuplet 3/2 {
        si(re do) si[(la sol)] fa(mi fa)
        sol,(si re) fa[la sol] fa mi re

        %46
        mi mi' re do[si la] sol fad sol
        fad fad' sol la[sol fad] mi re do
    }
    si sol' sol2\prall

    %49
    si,4~\tuplet 3/2 { si8 (re do) si[(do re)] }
    do sol' sol2\prall\mbreak
    dod,4~\tuplet 3/2 { dod8 (mi re) dod[(re mi)] }

    %52
    re, do' ?do4\prall fad8 la
    la2.
    re,,8 sib' sib4\prall re8 sol

    %55
    sol2.
    fa
    \tuplet 3/2 { mib8(re do) } sib2\prall

    %58
    \tuplet 3/2 { la8(re do) } sib2\prall
    \tuplet 3/2 { la8(re do) } sib2\prall
    la4 r r

    %61
    sol' si, do\prall
    re8(si) sol'2
    la,8(do) fad(la) do(fad,)\mbreak

    %64
    \grace fad sol4 re2
    \grace re8 do4.\prall mi8 la, do
    si(mi) re(si') fad(sol)

    %67
    la, do si4\prall re8. fad,16
    sol4 si(re)
    si re(fa)

    %70
    \tuplet 3/2 { mi8(fa? mi)  } re4 fad,?
    sol si(re)
    si re(fa)

    %73
    mi4 re8. [do16 \grace do8 si8. la16]
    sol4 r r

}


IIvlIIn = \relative do'' {

    si4 sol la
    si \tuplet 3/2 { si8(re do) si[(la sol)] }
    fad4 la la

    %4
    re,~re8 si' re si
    \grace si la4. do8  fad, la
    sol4 si si

    %7
    la sol fad\mbreak
    sol re si
    r si' si

    %10
    si si si
    si si si
    mi, mi8.[fad16 mi8. re16]

    %13
    mi8. la16 la4 la
    la la \grace mi'8 re dod16 si
    la4 la la\mbreak

    %16
    la la \grace mi'8 re8. la16
    sol4 fad8.[mi16 re8. dod16]
    fad4 fad fad

    %19
    re8 do'! do4\prall la8 fad
    sol4 sol sol
    re8 si' si4\prall re8 sol,

    %22
    fad4 fad fad\mbreak
    re8 do' do4\prall la8 fad
    sol4 r r

    %25
    dod re\parenthesize  (mi)
    \tuplet 3/2 { fad8(mi re) } fad,4 mi_+
    fad r r

    %28
    dod'8\parenthesize (si) re\parenthesize (dod) mi\parenthesize (re)
    \tuplet 3/2 { fad(mi re) } fad,4 mi_+
    re r r

    %31
    re re re
    re re re
    sol la la,

    %34
    re la'8.[si16 la8. sol16]
    fad4 fad sol
    fad \con\tuplet 6/4 { sol8[ la si do si la] }

    %37
    sol4\tuplet 6/4 {sol'8 [sol fad mi re dod]}\senza\mbreak
    re4 re, fa
    mi mi mi

    %40
    mi mi mi
    la, r do'
    do do do

    %43
    si fad? fad
    sol re re
    re re re

    %46
    sol, mi' mi
    la, fad' la\mbreak
    re, si'8. re16 sol,4

    %49
    sol sol sol
    sol sol sol
    la la la

    %52
    la r r
    fad fad fad
    sol sol sol

    %55
    sib sib sib
    si! si si\mbreak
    \tuplet 3/2 { do8(sib la) } \grace la sol2_+

    %58
    fad4 sol sol
    fad sol sol
    fad r r

    %61
    si8 re sol,4 la
    \con si \tuplet 6/4 { si8 [re do si la sol] }\senza
    fad4 la la

    %64
    re,~re8 si' re si
    \grace si la4. do8 fad, la
    sol4 si(re)

    %67
    \tuplet 3/2 { la8(si la) } sol4 fad_+
    sol r r
    sol si(re)

    %70
    \tuplet 3/2 { do8(re do) } si4 la\prall \mbreak
    sol4 r r
    sol si(re)

    %73
    do si8.[la16 sol8. fad16]
    sol4 r r

}


IIbcn = \relative do {

    sol4 r r
    sol si sol
    re're, do'

    %4
    si si8 re si sol
    re'4 re, re
    sol sol' sol,

    %7
    do re re,
    sol r r
    r sol' sol

    %10
    sol, sol sol
    sol sol sold\mbreak
    la dod8. [re16 dod8. si16]

    %13
    la8 la' fad4 re
    dod re8 mi fad sol
    la4 fad re

    %16
    dod re8 mi fad re
    sol4 la la,
    re re, re

    %19
    re re re
    re re re
    re re re

    %22
    re re re
    re re re
    sol r r

    %25
    R2.
    r4 la' la,
    re, r r

    %28
    R2.
    r4 la'' la,
    re, r r

    %31
    R2.*3
    re'8 mi fad sol fad mi
    re4 re re

    %36
    re, re re
    sol la la\mbreak
    re r r

    %39
    R2.*2
    la4 la la
    re re re

    %43
    re, re re
    sol sol sol
    si si si

    %46
    do r dod
    re re, re'
    sol sol sol

    %49
    fa fa fa
    mi mi mi
    sol sol sol\mbreak

    %52
    fad? r r
    re re re
    re, re re

    %55
    re re re
    re' re re
    do dod dod

    %58
    re sol dod,
    re sol,(dod)
    re r r

    %61
    sol, r r
    sol si sol
    re re' do?\mbreak

    %64
    si si8 re si sol
    re'4 re, re
    sol sol' sol

    %67
    do, re re,
    sol r r
    R2.

    %70
    do4 re re,
    sol r r
    R2.

    %73
    do4 re re,
    sol r r

}

IIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2.
    <_>2 <_>4
    s <_> <_>
    <6> <6> <6>
    <7>2.
    s
    <6 5>8 s <6 4>4 <7>
    s2.*2
    <6>4 s2
    <6> <5/>4
    <_+>4 <_+> <_+>8 s
    <_+>4 <6>2
    <5/>4 <5/> <5/>
    <7 _+> <6> s
    <5/>4 <5/> <5/>
    <6 5>8 s <6 4>4 <7 _+>
    s4 <7> s
    <7>2.
    <6 4>2 s4
    <6 4>2.
    <7>2 s4
    <7>2.
    s2.*2
    s4 <6 4> <7 _+>
    s2.*2
    s4 <6 4> <7 _+>
    s2.*4
    <_>2 <_>4
    s2.
    <7>
    s4 <7 _+> s
    s2.*4
    <7>2.
    <6 4>4 <7 3> s
    s2.
    <5/>
    s2 <5/>4
    s2 <7>4
    s2.
    <4\+>
    <6>
    <4\+>
    <6>
    <7>
    <6- 4>4 s s <6- 4>2.
    <6\+ _!>
    <_->4 <7- 5/> s
    s <_-> <7- 5/>
    s2 <7- 5/>4
    s2.*2
    <_>2 <_>4
    s <_> <_>
    <6> <6> <6>
    <7>2.
    s
    <6 5>8 s <6 4>4 <7>
    s2.*2
    <6 5>8 s <6 4>4 <7>
    s2.*2
    <6 5>8 s <6 4>4 <7>

}


forma = {

    \time 3/4
    \key sol\major
    \tempo 2. = 55
    s2.*30
    \bar ":..:"\break
    s2.*44
    \bar ":|."

}


IIfl = {
    \IIglobal
    \notypeset
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



IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}
#(set-global-staff-size 18)


\pointAndClickOff

\paper {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{"Sonata XII - Opera Quinta"}
    composer = \markup{"G. B. Sammartini (1700 - 1775)"}
}

\markup \huge  {"[1.] Con Spirito"}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
    } <<

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"Flauto"}
            \set Staff.midiInstrument = #"flute"
            \set Staff.shortInstrumentName = "fl"
            \Ifl
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \IvlI
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \IvlII
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.instrumentName = \markup  \center-column{"Basso"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8.0
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge  {"[2.] Minuetto"}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
    } <<

        \new Staff <<
            \set Staff.instrumentName = \markup  \center-column{"Flauto"}
            \set Staff.midiInstrument = #"flute"
            \set Staff.shortInstrumentName = "fl"
            \IIfl
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \IIvlI
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \IIvlII
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.instrumentName = \markup  \center-column{"Basso"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \IIbc
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8.0
            \override SpacingSpanner.uniform-stretching = ##t
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
