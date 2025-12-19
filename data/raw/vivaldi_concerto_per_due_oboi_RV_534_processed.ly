\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

gambd = \set stemRightBeamCount = #1

gambs = \set stemLeftBeamCount = #1

gambss = \set stemLeftBeamCount = #2

gambdd = \set stemRightBeamCount = #2

"|" = \bar "||"

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

pia = _\markup \italic "pia."

fort = _\markup \italic "fort"

piano = _\markup \italic "piano"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

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
}

IobIn = \relative do'' {

    do16\soli
    mi4 fa sol r8 sol
    la fa4 la8 sol mi4 sol8
    la fa4 la8 sol mi4 sol8

    %4
    fa16 mi fa8 mi16 re mi8 re4 r16 re mi fa
    sol8 sol sol16 fa mi re do4~do16 do re mi
    fa8 fa fa16 mi re do si4~si16 si do re

    %7
    mi8 mi~mi16 re mi fa\mbreak mi8 mi~mi16 re mi fa
    mi re mi8 fa16 mi fa8 sol16 fa sol8 fa16 mi fa8
    mi16 re mi8 fa16 mi fa8 sol4 r8 fa

    %10
    mi16 re mi8 re16 do re8 mi4 r8 fa
    mi16 re mi8 re16 do re8 do4 r
    R1*5

    %17
    sol'2\tr~sol~
    sol mi16\soli do mi sol re si re sol
    mi do mi sol re si re sol\mbreak mi do mi sol mi do mi fa

    %20
    sol4 r mi16 do mi sol mi do mi sol
    re4 r r2
    R1

    %23
    r8 re16[mi fa8 mi] re4 r
    r8 re16[mi fa8 mi] re4 r
    r8 re16[mi fa8 re] mi4 r

    %26
    r8 re16\p[mi fa8 re] mi4 r8 r16 fa\f
    mi4 fa sol r8 sol
    la fa4 la8 sol mi4 sol8

    %29
    la fa4 la8 sol mi4 sol8
    fa16 mi fa8 mi16 re mi8 re sol, ^\tu si re~
    re sol~sol16 fa mi re mi8 la, do mi~

    %32
    mi la~la16 sol fad mi fad8 si, re fad~
    fad si~si16 la sol fad? sol mi sol si sol mi sol si
    fad red fad si fad red fad si\mbreak sol8\soli sol16 la si8 sol

    %35
    fad4 r r8 sol16\p[la si8 sol]
    fad4 r r8 sol16\f[la si8 la]
    sol4 r r8 sol16\p[la si8 la]

    %38
    sol4 r r2
    R1*7
    r2 r4 fad16 re fad la,

    %47
    si4\soli do re r8 re
    mi do4 mi8 re si4 re8
    mi do4 mi8\mbreak re si4 re8

    %50
    do16 si do8 si16 la si8 la4 r16 la si do
    re8 re re16 do si la sol4~sol16 sol la si
    do8 do do16 si la sol fad4 r8 do'

    %53
    si16\soli la si8 do16 si do8 re16 do re8 do16 si do8
    si16 la si8 do16 si do8 re16 do re8 do16 si do8
    si4~si16 la si do\mbreak re8 sol la fad

    %56
    sol si,~si16 la si do re8 sol la fad
    sol4 r r2
    R1*3

    %61
    sol2\tr~sol~
    sol mi16\soli  do mi sol re si re sol
    mi do mi sol re si re sol\mbreak mi do mi sol mi do mi fa

    %64
    sol4 r mi16 do mi sol mi do mi sol
    re4 r r2
    R1

    %67
    r8 re16[mi fa8 mi] re4 r
    r8 re16[mi fa8 re]mi4 r
    mi8 mi~mi16\soli re mi fa mi8 mi~mi16 re mi fa

    %70
    mi re mi8 fa16 mi fa8 sol16 fa sol8 fa16 mi fa8
    mi16 re mi8 fa16 mi fa8 sol4 r8 fa
    mi16 re mi8 re16 do re8 do4 r\mbreak

    %73
    R1
    r8 re16[mi fa8 mi] re4 r
    r8 re16\p[mi fa8 mi] re4 r

    %76
    r8 re16\f[mi fa8 re] mi4 r
    r8 re16[mi fa8 re] mi do' re si
    do4\fermata r r2

}

IobIIn =  \relative do'' {

    do16\soli
    do4 re mi r8 mi
    fa do4 fa8 mi do4 mi8
    fa do4 fa8 mi do4 mi8

    %4
    re16 do re8 do16 si do8 si4 r16 si do re
    mi8 mi mi16 re do si la4~la16 la si do
    re8 re re16 do si la sol4~sol16 sol la si\mbreak

    %7
    do8 do~do16 si do re do8 do~do16 si do re
    do si do8 re16 do re8 mi16 re mi8 re16 do re8
    do16 si do8 re16 do re8 mi4 r8 re

    %10
    do16 si do8 si16 la si8 do4 r8 re
    do16 si do8 si16 la si8 do4 r
    R1*5

    %17
    sol'2\tr~sol~
    sol do,16\soli sol do mi si sol si re
    do sol do mi si sol si re do sol do mi do sol do re

    %20
    si4 r do16 sol do mi do sol do mi
    si4 r r2
    R1

    %23
    r8 si16[do re8 do] si4 r
    r8 si16[do re8 do] si4 r
    r8 si16[do re8 si] do4 r\mbreak

    %26
    r8 si16\p [do re8 si] do4 r8. re16\soli
    do4 re mi r8 mi
    fa do4 fa8 mi do4 mi8

    %29
    fa do4 fa8 mi do4 mi8
    re16 do re8 do16 si do8 si8 sol si re~
    re8 sol~sol16 fa mi re mi8 la, do mi~

    %32
    mi8 la~la16 sol fad mi fad8 si, re fad~\mbreak
    fad8 si~si16 la sol fad sol mi sol si sol mi sol si
    fad red fad si fad red fad si sol8\soli mi16 fad sol8 mi

    %35
    red4 r r8 mi16\p[fad sol8 mi]
    red4 r r8 mi16\f[fad sol8 fad]
    mi4 r r8 mi16\p[fad sol8 fad]

    %38
    mi4 r r2\mbreak
    R1*7
    r2 r4 la,16 fad la fad

    %47
    sol4\soli la si r8 si
    do sol4 do8 si sol4 si8
    do sol4 do8 si sol4 si8

    %50
    la16 sol la8 sol16 fad sol8 fad4 r16 fad sol la
    si8 si si16 la sol fad mi4~mi16 mi fad sol\mbreak
    la8 la la16 sol fad mi re4 r8 la'

    %53
    sol16\soli fad? sol8 la16 sol la8 si16 la si8 la16 sol la8
    sol16 fad? sol8 la16 sol la8 si16 la si8 la16 sol la8
    sol4~sol16 fad? sol la si8 si do la

    %56
    si sol~sol16 fad sol la si8 si do la
    si4 r r2
    R1*3\mbreak

    %61
    sol'2\tr~sol~
    sol do,16\soli sol do mi si sol si re
    do sol do mi si sol si re do sol do mi do sol do re

    %64
    si4 r do16 sol do mi do sol do mi
    si4 r r2
    R1

    %67
    r8 si16[do re8 do] si4 r
    r8 si16[do re8 si] do4 r
    do8 do~do16 si do re do8 do~do16 si do re

    %70
    do si do8 re16 do re8 mi16 re mi8 re16 do re8
    do16 si do8 re16 do re8 mi4 r8 re
    do16 si do8 si16 la si8 do4 r

    %73
    R1
    r8 si16[do re8 do] si4 r
    r8 si16\p[do re8 do] si4 r

    %76
    r8 si16\f[(do re8) si] do4 r\mbreak
    r 8 si16[do re8 si] do8 mi fa re
    mi4\fermata r r2

}

IvlIn = \relative do'' {

    r16
    R1*10
    r2 r16 do mi sol mi do  mi sol
    re8 sol, re'4 r16 do mi sol mi do mi sol

    %13
    re8 sol, re'4 r16 do mi sol mi do mi sol
    la8 do, la'4\mbreak r16 si, re fa re si re fa
    sol8 si, sol'4 r16 la, do mi do la do mi

    %16
    fa8 la, fa'4 r16 sol, si re si sol si re
    mi do mi sol re si re sol mi do mi sol re si re sol
    mi do mi sol mi do mi fa\mbreak sol2~^\markup \center-align{\italic\bold [tr]}

    %19
    sol1~
    sol16 si, re sol re si re sol mi4 r
    re16 si re sol re si re sol mi8 do mi, do

    %22
    re si' re, si do la' do, la
    sol4 r r8 sol' si, la
    sol4 r r8 sol' si, la

    %25
    sol4 r r8 do'' re si
    do4 r r8 do\p re si
    do4 r r2

    %28
    R1*2
    r2 r8 sol, si re~
    re sol~sol16 fa mi re mi8 la, do mi~

    %32
    mi8 la~la16 sol fad mi fad8 si, re fad~\mbreak
    fad si~si16 la sol fad sol mi sol si sol mi sol si
    fad red fad si fad red fad si sol4 r

    %35
    r8 si, red, si mi4 r
    r8 si'\p red, si mi4 r
    r8 sol'\f la fad mi4 r\mbreak

    %38
    r8 sol\p la fad mi8\f sol4 fad16 mi
    si'8 si, do la mi' sol4 fad16 mi
    fad red fad si fad red fad si si8 si, si'4

    %41
    si8 si, si'4 \parenthesize si8_\markup\italic\smaller "[Malipiero source]" \parenthesize si, \parenthesize si'4
    sol16 mi sol si sol mi sol si si8 dod, si'4
    mi,16 dod mi la mi dod  mi la\mbreak la8 si, la'4

    %44
    re,16 si re sol re si re sol  sol8 la, sol'4
    fad16 re fad la fad re fad la sol si, re sol re si re sol
    re la re sol re si re sol fad re fad la fad re fad la

    %47
    sol4 r \parenthesize r2
    R1*9\mbreak
    r8 sol, si re~ re fa?~fa8 mi 16 re

    %58
    mi8 do, mi sol~ sol sib~sib la16 sol
    la8 re, fa la~ la8 do~do[si?16 la]
    si8 sol si re~ re8 fa~fa mi16 re

    %61
    mi do mi sol re si re sol\mbreak mi do mi sol re si re sol
    mi do mi sol mi do mi fa sol2\tr~
    sol~ sol

    %64
    sol16 si, re sol re si re sol mi4  r
    re16 si re sol re si re sol mi8 do mi, do
    re si' re, si  do la' do, la

    %67
    sol4 r r8 sol' si, la
    sol4 r  r8 do'' re si
    do4 r r2

    %70
    R1*2
    r2 do,,8 do' mi, do
    re si' re, si  do la' do, la

    %74
    sol4 r  r8 sol' si, la
    sol4 r r8 sol'\p si, la
    sol4 r  r8 do'' \f re si

    %77
    do4 r r8 do re si
    do4\fermata r r2

}

IvlIIn = \relative do'' {

    r16
    R1*11
    r16 sol si re si sol si re mi8 sol, mi'4
    r16 sol, si re si sol si re mi8 sol, mi'4

    %14
    r16 fa, la do la fa la do re8 fa, re'4
    r16 mi, sol si  sol mi sol si do8 mi, do'4
    r16 re, fa la fa re fa la si8 re, si'4\mbreak

    %17
    do16 sol do mi si sol si re do sol do mi si sol si re
    do sol do mi do sol mi' fa sol2\tr~
    sol1

    %20
    re16 sol, si re si sol si re do4 r
    si16 sol si re si sol si re do8 do mi, do
    re si' re, si  do la' do, la

    %23
    sol4 r r8 sol' si, la
    sol4 r r8 sol' si, la
    sol4 r r8 mi'' fa re\mbreak

    %26
    mi4 r r8 mi\p fa re
    mi4 r r2
    R1*2

    %30
    r2 r8 sol, si re~
    re sol~sol16 fa mi re mi8 la, do mi~
    mi8 la~la16 sol fad mi fad8 si, re fad~\mbreak

    %33
    fad si~si16 la sol fad sol mi sol si sol mi sol si
    fad red fad si fad red fad si sol4 r
    r8 si, red, si mi4 r

    %36
    r8 si'\p red, si mi4 r
    r8 mi'\f fad red  mi4 r
    r8 mi\p fad red mi\f sol4 fad16 mi

    %39
    si'8 si, do la mi' sol4 fad16 mi
    si'8 si, si'4 \parenthesize fad16 _\markup\italic\smaller "[Malipiero source]" \parenthesize red \parenthesize fad \parenthesize si \parenthesize fad \parenthesize red \parenthesize fad \parenthesize si
    sol16 mi sol si sol mi sol si fad red fad si fad red fad si

    %42
    si8 si, si'4 mi,16 dod mi si' mi, dod mi si'
    la8 dod, la'4 re,!16 si re la' re, si re la'
    sol8 si, sol'4 dod,16 la dod mi dod la dod mi\mbreak

    %45
    re la re fad re la re fad re sol, si re si sol si re
    la sol la re la sol la re la fad la re la fad la re
    si4 r \parenthesize r2

    %48
    R1*9
    r8 sol si re~ re fa?~fa8 mi 16 re

    %58
    mi8 do, mi sol~ sol sib~sib la16 sol
    la8 re, fa la~ la8 do~do[si?16 la]
    si8 sol si re~ re8 fa~fa mi16 re

    %61
    do16 sol do  mi si sol si re do sol do mi si sol si re
    do sol do mi do sol mi' fa sol2\tr~
    sol1

    %64
    re16 sol, si re si sol si re do4 r
    si16 sol si re si sol si re do8 do mi, do
    re si' re, si  do la' do, la

    %67
    sol4 r r8 sol' si, la
    sol4 r  r8 mi'' fa re
    mi4 r r2

    %70
    R1*2
    r2 do,8 do' mi, do
    re si' re, si  do la' do, la

    %74
    sol4 r  r8 sol' si, la
    sol4 r r8 sol'\p si, la

    %77
    sol4 r  r8 mi''\f fa re
    mi4 r r8 mi fa re
    mi4\fermata r r2

}

Ivlan = \relative do' {

    r16
    R1*10
    r2 r8 sol' sol do,
    r re re sol, r sol' sol do,

    %13
    r re re sol, r4 mi'~
    mi la2 re,4~
    re sol2 do,4~

    %16
    do fa2 si,4\mbreak
    sol8 sol' sol sol sol sol sol sol
    sol sol sol sol sol, sol sol sol

    %19
    sol sol sol sol sol sol sol sol
    sol1~
    sol2~sol8 do' mi, do

    %22
    re si' re, si do la' do, la\mbreak
    sol4 r r8 sol' si, la
    sol4 r r8 sol' si, la

    %25
    sol4 r \mbreak r8 sol' la sol
    sol4 r r8 sol\p la sol
    sol4 r r2

    %28
    R1*2
    r2 r8 re re re
    sol sol sol sol sol la la la

    %32
    la la la la la si si si
    si si si si si si si si
    si si si si si4 r

    %35
    r8 si red, si mi4 r
    r8 si'\p red, si mi4 r
    r8 si'\f do si si4 r

    %38
    r8 si\p do si sol\f sol sol sol
    fad fad fad fad mi mi mi mi
    fad fad fad fad \parenthesize fad_\markup\italic\smaller "[Malipiero source]" \parenthesize fad \parenthesize fad \parenthesize fad

    %41
    si, si si si si si si si\mbreak
    \parenthesize si_\markup\italic\smaller "[Malipiero source]" \parenthesize si \parenthesize si \parenthesize si sol' sol sol sol
    la la la la fad fad fad fad

    %44
    sol sol sol sol mi mi mi la
    la la la fad re re re re
    re re re re re re re re

    %47
    re4 r \parenthesize r2
    R1*9
    si8 si si si sol sol sol sol

    %58
    sol sol sol sol  mi' mi mi mi
    do la la la re re re re
    re re re re  si si si si

    %61
    sol sol' sol sol sol sol sol sol
    sol sol sol sol sol, sol sol sol
    sol sol sol sol sol sol sol sol

    %64
    sol1~
    sol2~sol8 do' mi, do
    re si' re, si do la' do, la

    %67
    sol4 r r8 sol' si, la
    sol4 r r8 sol' la sol
    sol4 r r2

    %70
    R1*2
    r2 do,8 do' mi, do
    re si' re, si  do la' do, la

    %74
    sol4 r  r8 sol' si, la
    sol4 r  r8 sol'\p si, la
    sol4 r r8 sol'\f la mi

    %77
    sol4 r r8 sol la mi
    sol4\fermata r r2

}

Ibcn = \relative do {

    r16
    do4 fa, do8[do'16 re mi8 do]
    r fa16 [sol  la8 fa] r do16 [re mi8 do]
    r8 fa16[sol la8 fa] r do16[re mi8 do]

    %4
    fa4 fad sol8[sol,16 la si8 sol]
    r2 r8 la'16[sol la8 la,]\mbreak
    r2 r8 sol'16[fa sol8 sol,]

    %7
    r do'16[si do8 sol] do, [do'16 si do8 sol]
    do,4 fa do fa
    do fa do8[do'16 si do8 fa,]

    %10
    do'[fa, sol sol,] do[do'16 si do8 fa,]
    do' fa, sol sol,\mbreak do do' do do,
    r sol' sol sol, r do' do do,

    %13
    r sol' sol sol, r do' do do,
    r fa fa fa,r si' si si,
    r mi mi mi, r la' la la,

    %16
    r re re re,r sol' sol sol,\mbreak
    do do sol'[sol] do, do sol'[sol]
    do, do do do do[do] sol' sol

    %19
    do,[do] sol' sol do,4 r
    sol2~sol~
    sol do8 do' mi, do

    %22
    re si' re, si do la' do, la\mbreak
    sol4 r r8 sol' si, la
    sol4 r r8 sol' si, la

    %25
    sol4 r r8 do fa, sol
    do4 r r8 do\p fa, sol
    do4 fa\f do8[do16 re mi8 do]

    %28
    r fa16[sol la8 fa] r do16[re mi8 do]\mbreak
    r fa16[sol la8 fa] r do16[re mi8 do]
    fa4 fad sol8 sol sol sol

    %31
    si, si si si do do do do
    dod dod dod dod re re re re
    red red red red mi mi mi mi\mbreak

    %34
    red red red red mi4 r
    r8 si' red, si mi4 r
    r8 si'\p red, si mi4 r

    %37
    r8 mi\f la, si mi,4 r
    r8 mi'\p la, si mi\f mi mi mi
    re? re re re do do do do\mbreak

    %40
    si si si si si si si si
    mi mi mi mi red red red red
    mi mi mi mi dod dod dod dod

    %43
    dod? dod dod dod si si si si
    si si si si la la la la\mbreak
    re re re re sol sol sol sol

    %46
    re' re re re re, re re re
    sol4 do, sol8[sol'16 la si8 sol]
    r do,16[re mi8 do] r sol'16[la si8 sol]

    %49
    r do,16[re mi8 do] r sol'16[la si8 sol]\mbreak
    do,4 dod re8[re'16 do? re8 re,]
    r2 r8 mi'16 [re mi8 mi,]

    %52
    r2 r8 re'16[do re8 re,]
    sol4 do, sol do
    sol' do, sol do\mbreak

    %55
    sol'8[sol16 fad sol8 sol,] r sol' do, re
    sol,[sol'16 fad sol8 sol,] r sol' do, re
    sol, sol sol sol si si si si

    %58
    do do do do do do do do
    fa fa fa fa\mbreak fad fad fad fad
    sol sol sol sol sol sol sol sol

    %61
    do ,do sol'[ sol] do, do sol' [sol]
    do, do do do do do sol' sol
    do, do sol' sol do, do sol' sol\mbreak

    %64
    sol,2~sol~
    sol do8 do' mi, do
    re si' re, si do la' do, la

    %67
    sol4 r r8 sol' si, la
    sol4 r r8 do fa, sol
    do[do'16 si do8 sol]\mbreak do, [do'16 si do8 sol]

    %70
    do,4 fa do fa
    do fa do8[do'16 si do8 fa,]
    do'[fa, sol sol,] do do' mi ,do

    %73
    re si' re, si do la' do, la
    sol4 r\mbreak r8 sol' si, la
    sol4 r r8 sol'\p si, la

    %76
    sol4 r r8 do\f  fa, sol
    do4 r r8 do fa, sol
    do,4\fermata r r2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s16
    s1*7
    s4 <6> s <6>
    s <6> s2
    s1*4
    s2 s8 <7> s4
    s8 <7> s4 s8 <7> s4
    s8 <7> s4 s8 <7> s4
    s1*3
    s2 <6 4>
    <5 3> s2
    s1*9
    s2 s8 <6> s4
    s2 <6 _+>
    s1*7
    s2 <_+>
    s1
    s2 <7>
    <6> <7>
    <6> <7 _+>
    s1
    <5 4>2 <3+>
    s1*3
    s2 <_+>
    s1
    s2 s8 <_+> s4
    s4 <6> s <6>
    s4 <6> s <6>
    s2 s4 s8 <_+>
    s2 s4 s8 <_+>
    s2 <6 5>
    s <7->
    s8 <6>  s4 <6 5>2
    s2 <7>
    s1*3
    s2 <6 4>
    <5 3> s
    s1*4
    s4 <6> s <6>
    s4 <6> s2

}

forma = {

    \key do\major
    \time 4/4
    \tempo 2 = 60
    \partial 16 s16
    s1*78
    \bar"|."

}

IobI = {
    \Iglobal
    \notypeset
    <<\IobIn \forma>>

}

IobII = {
    \Iglobal
    <<\IobIIn \forma>>

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

IIobIn = \relative do'' {

    mib8 mib(sol) mib(re) re(fa) re(
    mib) mib(sol) mib mib4\tr re
    mib8 mib(sol) mib(lab) lab(fa) mib(

    %4
    re) re(fa) re(sol) sol(mib) re(
    do) do(mib) do(fa) \once\slurDashed lab (fa mib)
    mib\tr re r sol sol\tr fa r sol

    %7
    sol fa r lab(sol) sol(lab) fa(
    sol) sol(lab) fa(\mbreak mib2)
    sol8 sol(sib) sol(fa) fa(lab) fa(

    %10
    sol) sol(sib) sol sol4\tr fa8 lab
    lab sol(fa) mib(re) lab'(sol fa)
    mib16 re mib8 r mib mib\tr re r mib

    %13
    mib\tr re r re re(mi) mi(fa)
    fa4. sol8(mib?) mib(fa) re(
    mib) mib(fa) re(mib) mib fa re

    %16
    do1\fermopz

}

IIobIIn =  \relative do'' {


    do8 do(mib) \once\slurDashed do (si) si(re) si(
    do) do(mib) do do4\tr si
    do8 do(mib) do do4. do8

    %4
    sib?8 sib(re) sib sib4. sib8
    lab lab(do) lab(do) fa(do do)
    fa,4 r8 mib' mib\tr mib r mib

    %7
    mib\tr re r fa(\mbreak mib) mib(fa) re(
    mib) mib(fa)  re(mib2)
    mib8 mib(sol) mib(re) re(fa) re(

    %10
    mib) mib(sol) mib mib4\tr re8 fa
    fa mib(re) do(si) \once\slurDashed fa' (mib re)
    do16 si do8 r do do\tr si r do

    %13
    do\tr si r si si sib sib lab\mbreak
    sol4. si8(do) do(re) si(
    do) do(re) si(do) do (re) si(

    %16
    do1)\fermata

}

IIvlIn = \relative do'' {

    do8 do, do do' sol sol, sol sol'
    do do, do do' sol sol, sol sol'
    do do, do do' fa, sol lab fa

    %4
    sib sib, sib sib' mib, fa sol mib\mbreak
    lab lab, lab lab'  lab lab, lab lab'
    sib sib, sib mib sib' sib, sib mib

    %7
    sib' sib, sib sib' mib, mib lab, sib
    mib mib lab, sib mib2
    mib'8 mib, mib mib' sib sib, sib sib'\mbreak

    %10
    mib mib, mib mib' sib sib, sib sib'
    fa4. fa8 sol sol, sol sol'
    do do, do do' sol sol, sol do

    %13
    sol' sol, sol sol' sol do, do fa
    si, sol sol sol' do, do fa sol,
    do do fa sol, do do fa sol,

    %16
    do do' sol mib do2\fermata

}

IIvlan = \relative do' {

    do' 8 do, do do' sol sol, sol sol'
    do do, do do' sol sol, sol sol'
    do do, do do'  fa, sol lab fa

    %4
    sib sib, sib sib' mib, fa sol mib
    lab lab, lab lab' lab lab, lab lab'
    sib sib, sib mib sib' sib, sib mib

    %7
    sib' sib, sib sib' mib, mib lab, sib\mbreak
    mib mib lab, sib mib2
    mib'8 mib, mib mib' sib sib, sib sib'

    %10
    mib8 mib, mib mib' sib sib, sib sib'
    fa4. fa8 sol sol, sol sol'
    do do, do do' sol sol, sol do

    %13
    sol' sol, sol sol' sol do, do fa
    si, sol sol sol' do, do fa, sol\mbreak
    do do fa, sol do do fa, sol

    %16
    do do' sol mib do2\fermata

}

IIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentUp



}

forma = {

\key do\minor
\time 4/4
\tempo 4 = 50
s1*8
\bar":..:"
s1*8
\bar":|."

}

IIobI = {
	\IIglobal
	\notypeset
	<<\IIobIn \forma>>

}

IIobII = {
	\IIglobal
	<<\IIobIIn \forma>>

}

IIvlI = {
	\IIglobal
	<<\IIvlIn \forma>>

}

IIvla = {
	\IIglobal
	\clef alto
	<<\IIvlan \forma>>
	\typeset

}

IIIglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}

IIIobIn = \relative do'' {

    R2*11
    r4 r8 sol'\soli
    mi[do(re) si](

    %14
    do)[ la'(sol) fa](
    mi)[do(re) si](
    do)[la'(sol) fa](

    %17
    mi4\tr) re
    R2*4
    r8 \once\slurDashed fa\soli[(mi re)]

    %23
    mi[fa(mi re)]
    mi[fa (mi re)]
    mi[do' re, fa]

    %26
    mi[do' re, fa]\mbreak
    mi[do' re, fa]
    mi[mi fa re]

    %29
    mi[do re si]
    do[mi fa re]
    mi[do re si]

    %32
    do4 r
    R2*6
    sol'8\soli[\once\slurDashed re (mi) do](

    %40
    re)[si(do) la](
    si)[re(mi) do](
    re)[si (do) la](

    %43
    si2)
    R2*3
    r8 la'[(sib) sol](

    %48
    la)[fa(sol) mi](\mbreak
    fa)[la(sib) sol](
    la)[fa(sol) mi](

    %51
    fa) re16 dod re mi fa sol
    la8[la la la,]
    re re16 dod re mi fa sol

    %54
    la8[la la la,]
    sib'8.[la16 sol fa mi re]
    dod8[re \parenthesize la dod]

    %57
    re4 r
    mi8\soli[mi(sol) mi](
    re)[re(sol) re](

    %60
    mi)[mi(sol) mi]
    mi4\tr re\mbreak
    R2*8

    %70
    r8 fa\soli[(mi) re](
    mi)[fa(mi) re](
    mi)[fa(mi) re](

    %73
    mi) do16 si do re  mi fa
    sol8[sol sol si,]
    do do16 si do re  mi fa

    %76
    sol8[sol sol si,]
    do do16 re mi fa sol mi
    la8[la, sol si]]

    %79
    do\p do16 si do re mi fa
    sol8[sol sol si,]\mbreak
    do do16 si do re mi fa

    %82
    sol8[sol sol si,]
    do\f do16 re mi fa sol mi
    la8[la, sol si]

    %85
    do2\fermata

}


IIIobIIn =  \relative do'' {

    R2*11
    r4 r8 re\soli
    do[mi(fa) re](

    %14
    mi)[fa(mi) re](
    do)[mi(fa) re](
    mi) [fa(mi) \once\slurDashed re]

    %17
    (do4)\tr si
    R2*4
    r8 re\soli[(do si)]

    %23
    do[re(do si)]
    do[re(do si)]
    do[do' re, \parenthesize fa]\mbreak

    %26
    mi[do' re, fa]
    mi[do' re, fa]
    do[do re si]

    %29
    do[mi fa re]
    mi[do re si]
    do[mi fa re]

    %32
    do4 r
    R2*6
    sol'8\soli[si,(do) la](

    %40
    si)[sol(la) fad](
    sol)[si(do) la](
    si)[\once\slurDashed sol(la) fad](

    %43
    sol2)
    R2*3
    r8 fa'\soli[(sol) mi](

    %48
    fa)[re(mi) dod](
    re)[fa(sol) mi](
    fa)[re(mi) dod](

    %51
    re) re16 dod re mi fa sol
    la8[la la la,]
    re re16 dod re mi fa sol

    %54
    la8[la la la,]
    sib'8.[la16 sol fa mi re]
    dod8[re \parenthesize la dod]

    %57
    re4 r\mbreak
    do?8\soli[do(mi) do](
    si)[si(re) si](

    %60
    do)[do(mi) do]
    do4\tr si
    R2*8

    %70
    r8 re[(do) si](
    do) [re(do) si](
    do)[re(do) si](

    %73
    do)do16 si do re  mi fa
    sol8[sol sol si,]
    do do16 si do re  mi fa

    %76
    sol8[sol sol si,]
    do do16 re mi fa sol mi
    la8[la, sol si]]

    %79
    do\p do16 si do re mi fa
    sol8[sol sol si,]\mbreak
    do do16 si do re mi fa

    %82
    sol8[sol sol si,]
    do\f do16 re mi fa sol mi
    la8[la, sol si]

    %85
    do2\fermata

}

IIIvlIn = \relative do'' {

    mi8[mi(sol) mi](
    re)[re(sol) re](
    mi)[mi(sol) mi]

    %4
    mi4\tr re
    mi8\p[mi(sol) mi](
    re)[re(sol) re](

    %7
    mi)[mi(sol) mi]
    re4 r8 sol\f
    sol[sol, sol fa]

    %10
    fa[mi mi sol']
    sol[sol, sol fa]
    fa mi mi4

    %13
    R2*4
    r4 r8 sol\mbreak
    fa'[fa fa fa]

    %19
    \once\stemUp sol,,[fa'' mi mi]
    \once\stemUp sol,,[mi'' re re]
    \once\stemUp sol,,[re'' do do]

    %22
    sol,4 r
    R2*2
    r8 do''[re, fa]

    %26
    mi[do' re, fa]
    mi[do' re, fa]
    mi[mi fa re]

    %29
    mi [do re si]
    do[mi fa re]
    mi[do re si]

    %32
    do[do16 si do re mi fa]
    sol8[sol sol si,]\mbreak
    do[do16 si do re mi fa]

    %35
    sol8 [sol sol si,]
    do[do16 re mi fa sol mi]
    la8[fad re do]

    %38
    si sol' re, fad'
    sol4 r
    R2

    %41
    sol4 r
    R2
    sol

    %44
    sol8[sol(sib) sol](
    mi)[mi(sol) mi](
    dod)[mi(sol) mi](

    %47
    fa4) r
    R2
    fa4 r

    %50
    R2
    fa8[re16 dod re mi fa sol]
    la8[la la la,]

    %53
    re8[re16 dod re mi fa sol]
    la8[la la la,]
    sib'8.[la16 sol fa mi re]

    %56
    dod8[re la, dod']
    re4 r
    R2*4

    %62
    mi8[mi(sol) mi](
    re)[re(sol) re](
    mi)[mi(sol) mi]

    %65
    mi4\tr re8 sol,
    fa'[fa fa fa]
    \once\stemUp sol,,[fa'' mi mi]

    %68
    \once\stemUp sol,,[mi'' re re]
    \once\stemUp sol,,[re'' do do]
    sol,4 r

    %71
    R2*2
    do'8 [do16 si do re mi fa]\mbreak
    sol8[sol sol si,]

    %75
    do [do16 si do re mi fa]
    sol8[sol sol si,]
    do [do16 re  mi fa sol mi]

    %78
    la8[la, sol si]
    do\p [do16 si do re mi fa]
    sol8[sol sol si,]

    %81
    do [do16 si do re mi fa]
    sol8[sol sol si,]
    do\f [do16 re mi fa sol mi]

    %84
    la8[la, sol si]
    do2\fermata

}

IIIvlIIn = \relative do'' {

    do8[do(mi) do](
    si)[si(re) si](
    do)[do(mi)  do]

    %4
    do4\tr si
    do8\p[do(mi) do](
    si)[si(re) si](

    %7
    do)[do(mi)  do]
    si4 r8 re\f
    mi[mi, mi re]

    %10
    re[do do mi']
    mi[mi, mi re]
    re do do4\mbreak

    %13
    R2*4
    r4 r8 sol'\mbreak
    fa'[fa fa fa]

    %19
    \once\stemUp sol,,[fa'' mi mi]
    \once\stemUp sol,,[mi'' re re]
    \once\stemUp sol,,[re'' do do]

    %22
    sol,4 r
    R2*2
    r8 do''[re, fa]

    %26
    mi[do' re, fa]
    mi[do' re, fa]
    do [do re si]

    %29
    do[mi fa re]
    mi[do re si]
    do[mi fa re]\mbreak

    %32
    do[do16 si do re mi fa]
    sol8[sol sol si,]\mbreak
    do[do16 si do re mi fa]

    %35
    sol8 [sol sol si,]
    do[do16 re mi fa sol mi]
    la8[fad re do]

    %38
    si sol' re, fad'
    sol4 r
    R2

    %41
    si,4 r
    R2
    si

    %44
    mi8[mi(sol) mi](\mbreak
    dod)[dod(mi) dod](
    la)[dod(mi) dod](

    %47
    re4) r
    R2
    re4 r

    %50
    R2
    re8[re16 dod re mi fa sol]
    la8[la la la,]

    %53
    re8[re16 dod re mi fa sol]
    la8[la la la,]
    sib'8.[la16 sol fa mi re]

    %56
    dod8[re la, dod']
    re4 r
    R2*4

    %62
    do8[do(mi) do](
    si)[si(re) si](
    do)[do(mi) do]

    %65
    do4\tr si8 sol
    fa'[fa fa fa]
    \once\stemUp sol,,[fa'' mi mi]

    %68
    \once\stemUp sol,,[mi'' re re]
    \once\stemUp sol,,[re'' do do]
    sol,4 r

    %71
    R2*2
    do'8 [do16 si do re mi fa]\mbreak
    sol8[sol sol si,]

    %75
    do [do16 si do re mi fa]
    sol8[sol sol si,]
    do [do16 re  mi fa sol mi]

    %78
    la8[la, sol si]
    do\p [do16 si do re mi fa]
    sol8[sol sol si,]

    %81
    do [do16 si do re mi fa]
    sol8[sol sol si,]
    do\f [do16 re mi fa sol mi]

    %84
    la8[la, sol si]
    do2\fermata

}

IIIvlan = \relative do' {

    sol'4 sol
    sol sol
    sol sol

    %4
    sol sol
    sol\p sol
    sol sol

    %7
    sol sol
    sol sol
    sol,\f sol

    %10
    sol sol
    sol sol
    sol sol

    %13
    R2*6
    sol4 r
    sol r\mbreak

    %21
    sol r
    sol r
    R2*2

    %25
    r8 sol'[la re,]
    sol,[sol' la re,]
    sol,[sol' la re,]

    %28
    sol,[sol' la sol]
    sol[sol la sol]
    sol[sol la sol]

    %31
    sol[sol la sol]
    sol[mi mi mi]
    re[re re re]

    %34
    do[do do do]
    si[si si si]
    sol'[sol sol sol]

    %37
    re[re re re]\mbreak
    re re16 mi la,8 re
    si4 r

    %40
    R2
    re4 r
    R2

    %43
    re2
    sib'8[sib, sib sib']
    la4 la

    %46
    la la
    la r
    R2

    %49
    la4 r
    R2
    fa8[fa fa fa]

    %52
    mi[mi mi mi]
    re[re re re]
    dod[dod dod dod]\mbreak

    %55
    re[re re sib']
    mi,[fa la, la']
    fa4 r

    %58
    R2*4
    sol4 sol
    sol sol

    %64
    sol sol
    sol sol
    R2

    %67
    sol,4 r
    sol r
    sol r

    %70
    sol r
    R2*2
    mi'8[mi mi mi]

    %74
    re[re re re]
    do[do do do]\mbreak
    si[si si si]

    %77
    sol'[sol sol sol]
    do,[do si re]
    mi\p[mi mi mi]

    %80
    re[re re re]
    do[do do do]
    si[si si si]

    %83
    sol'\f[sol sol sol]
    do,[do si re]
    mi2\fermata

}

IIIbcn = \relative do {

    do'8[do, do do']
    sol[sol, sol sol']
    do[do, do do']

    %4
    sol[sol, sol sol']
    do\p[do, do do']
    sol[sol, sol sol']

    %7
    do[do, do do']
    sol[sol, sol sol']\f
    sol[sol, sol sol']\mbreak

    %10
    sol[sol, sol sol']
    sol[sol, sol sol']
    do[do, do sol']

    %13
    do,[do' fa, sol]
    do,[fa do fa]
    do[do' fa, sol]

    %16
    do,[fa do fa]
    sol4 sol,
    R2

    %19
    sol4 r
    sol r
    sol r\mbreak

    %22
    sol r8 sol
    do4 r8 sol
    do4 r8 sol

    %25
    do[mi fa si,]
    do[mi fa si,]
    do[mi fa si,]

    %28
    do[do fa, sol]
    do,[do' fa, sol]
    do,[do' fa, sol]

    %31
    do,[do' fa, sol]
    do'[do do do]\mbreak
    si[si si si]

    %34
    la[la la la]
    sol[sol sol sol]
    mi[mi mi mi]

    %37
    fad[fad fad fad]
    sol si,16 do re8 re,
    sol4 r

    %40
    R2
    sol4 r
    R2

    %43
    sol\mbreak
    sol'8[sol, sol sol']
    la[la, la la']

    %46
    la[la, la la']
    re,4 r
    R2

    %49
    re4 r
    R2
    re8[re re re]

    %52
    do[do do do]
    sib[sib sib sib]
    la[la la la]

    %55
    sol[sol sol sol]\mbreak
    la re la' la,
    re4 r

    %58
    do'8[do, do do']
    sol[sol, sol sol']
    do[do, do do']

    %61
    sol[sol, sol sol']
    do_\markup {[\musicglyph #"f"]}[do, do do']
    sol[sol, sol sol']

    %64
    do[do, do do']
    sol sol, sol4
    R2

    %67
    sol4 r
    sol4 r
    sol4 r

    %70
    sol4 r
    do r8 sol'
    do,4 r8 sol'

    %73
    do,8[do' do do]
    si[si si si]
    la[la la la]

    %76
    sol[sol sol sol]
    mi[mi mi mi]
    fa[fa sol sol,]

    %79
    do\p[do' do do]
    si[si si si]
    la[la la la]

    %82
    sol[sol sol sol]
    mi\f[mi mi mi]
    fa[fa sol sol,]

    %85
    do2\fermata

}

IIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s2*8
	<6>4 s8 <7 5>
	s8 <6 4> s4
	s s8 <7 5>
	s <4> <3> s
	s2*4
	<6 4>4 <5 3>
	s2
	<7>
	<6>
	<5>
	s2*3
	s4 s8 <6 5>
	s4 s8 <6 5>
	s4 s8 <6 5>
	s2*16
	<6 3->2
	<7 _+>
	s2*8
	<_+>2
	<_->
	<_+>
	s2*4
	<6 4>4 <5 3>
	s2*3
	<6 4>4 <5 3>
	s2
	 <7 5>
	 <6 4>
	 <5 3>

}

forma = {

\key do\major
\time 2/4
\tempo 2 = 65
s2*43
\bar":..:"\break
s2*42
\bar":|."

}

IIIobI = {
	\IIIglobal
	%\notypeset
	<<\IIIobIn \forma>>

}

IIIobII = {
	\IIIglobal
	<<\IIIobIIn \forma>>

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
#(set-global-staff-size 17)


\pointAndClickOff

    \paper  {

        print-first-page-number = ##t
        first-page-number = #2

    }

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge "[1.] Allegro"

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.instrumentName = \markup \center-column{"Oboè""Primo"}
                        \IobI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.instrumentName = \markup \center-column{"Oboè""Secondo"}
                        \IobII
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                        \IvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                        \IvlII
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.instrumentName = \markup \center-column{"Alto""Violetta"}
                        \Ivla
                    >>
                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol #'staff-space = #(magstep +1)
                    }<<
                        \set Staff.midiInstrument = #"cello"
                        \set Staff.instrumentName = \markup \center-column{"Cembalo"}
                        \Ibc
                    >>
                >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[2.] Largo"

    \score {

                \new ChoirStaff <<

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol #'staff-space = #(magstep +1)
                    } <<
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.instrumentName = \markup \center-column{"Oboè""Primo"}
                        \IIobI
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol #'staff-space = #(magstep +1)
                    } <<
                        \set Staff.midiInstrument = #"oboe"
                        \set Staff.instrumentName = \markup \center-column{"Oboè""Secondo"}
                        \IIobII
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol #'staff-space = #(magstep +1)
                    } <<
                        \set Staff.midiInstrument = #"violin"
                        \set Staff.instrumentName = \markup \center-column{"Violino""Primo &""Secondo"}
                        \IIvlI
                    >>

                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol #'staff-space = #(magstep +1)
                    } <<
                        \set Staff.midiInstrument = #"viola"
                        \set Staff.instrumentName = \markup \center-column{"Alto""Violetta"}
                        \IIvla
                    >>
                >>

        \layout {

            indent = 1.6\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge "[3.] Allegro"

    \score {

                \new ChoirStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \IIIobI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \IIIobII
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlII
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"viola"
                        \IIIvla
                    >>
                    \new Staff \with {
                        fontSize = #+1
                        \override StaffSymbol #'staff-space = #(magstep +1)
                    }<<
                        \set Staff.midiInstrument = #"cello"
                        \IIIbc
                    >>
                >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

}
