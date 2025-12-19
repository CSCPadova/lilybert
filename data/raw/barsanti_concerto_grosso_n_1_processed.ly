\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

tu = ^\markup \italic "tutti"

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
    \terzine
}

IvlIn = \relative do'' {

    <sol' si, re,>4 si,8. do16 do4 la8. do16
    si8[si'16 la sol8 \once\stemUp si,,] do si la fad'
    \once\stemUp sol[si'16 la sol8 \once\stemUp si,,] do si la fad'

    %4
    sol16(si re) sol sol sol sol sol\mbreak sol sol re re si si sol sol
    la(do fad) la la la la la la la fad fad re re la la
    si8\noBeam si'32 do re16 re8[re] re re re re

    %7
    re\noBeam si32\p do re16 re8[re] re re re re
    re do r si\f si la r sol\mbreak
    fad16 re re re re re re re <sol si, re,>4 r8 sol,

    %10
    la16 re re re re re re re <sol si, re,>4 r8 sol,
    fad16 re' re, re re re re re re4 r
    la''2\solo~la8 dod, re mi

    %13
    mi4\tr re r8 fad sol la
    la(sol) sol(fad) fad(mi) mi(red)\mbreak
    \grace red?8 mi2 r8 sol la si

    %16
    si(la) la(sol) sol(fad) fad(mi)
    fad8. la32 fad dod4\tr re8. fad32 re sold,4\tr
    la8. si32 la sol'2 fad4

    %19
    mi8(red mi) sol si sol (fad mi)
    re(dod re) fad la fad (mi re)
    mi sol(fad mi) re fad(mi re)\mbreak

    %22
    dod16\tu [la la'8 la la] la la la la
    sol, sol' sol sol sol sol sol sol
    fad16 la fad dod re la fad re fad' la fad dod re la fad re

    %25
    sol' si sol dod, re si sol re sol' si sol dod, re si sol re
    fad' la fad dod re la fad re\mbreak fad' la fad dod re la fad re
    si'4 si' r8 mi, fad sol

    %28
    fad16[mi re8 re re] sol16[mi dod8 dod dod]
    re4.\solo la'16 fad re8 la si do?
    \grace do si4. si'16 sol re8 si do re

    %31
    \grace re do4. la'16 fad re8 la si do
    si si'4 \f sol8 fad sol32[fad mi16] re8 dod\mbreak
    re la16 fad re4. fad8 sol la

    %34
    sol si16 sol re4. sol8 la si
    la la'16 fad re4. fad,8 sol la
    sol si'4\tu sol8 fad sol32 [fad mi16] re8 dod

    %37
    re16(fad la) re re re re re re,(sol si) re re re re re
    re,(fad la) re re re re re\mbreak si8 sol fad mi
    re16(fad la) re re re re re si8 sol fad mi

    %40
    re sol, fad mi re4 r
    <fad' la, re,> re, re re
    <sol' si, re,> re, re re

    %43
    fad'16 mi fad re sol fad sol mi la sol la fad si la si sol
    fad mi fad re sol fad sol mi la sol la fad si la si sol\mbreak
    fad8\solo re4 re re re8

    %46
    mib mib(re mib) r mib(re mib)
    r mib(do la) fad la do mib
    re re(dod re) r re(dod re)

    %49
    r re(sib sol) re sol sib re
    re\tr do? re,[do'] do\tr sib re,[sib']
    la re\tu do sib\mbreak la sol fad sol

    %52
    re'16(mi re ) do' do do do do re,(mi re) re' re re re re
    re,(mi re ) do' do do do do \once\stemDown si8 sol, fad mi
    si'16(do si) la' la la la la si,(do si) si' si si si si

    %55
    si,(do si) la' la la la la sol si mi,8\solo mi[mi]\mbreak
    mi fa r mi mi red r do
    do\tr si r la' sol16 si mi,4 red8

    %58
    \once\stemDown mi do, si lad \once\stemUp si fad''16 la sol8[fad]
    si mi,4\tu red8 mi do la si
    do mi la, si mi,4 r

    %61
    <sol' si, re,> si,8. do16 do4 la8. do16
    si8[si'16 la sol8 \once\stemUp si,,] do si la fad'
    \once\stemUp sol[si'16 la sol8 \once\stemUp si,,] do si la fad'

    %64
    sol16(si re) sol sol sol sol sol\mbreak sol sol re re si si sol sol
    la(do fad) la la la la la la la fad fad re re la la
    si8\noBeam si'32 do re16 re8[re] re re re re

    %67
    re\noBeam si32\p do re16 re8[re] re re re re
    re do r si\f si la r sol\mbreak
    fad16 re re re re re re re <sol si, re,>4 r8 sol,

    %70
    la16 re re re re re re re <sol si, re,>4 r8 sol,
    fad16 re' re, re re re re re re4 r
    do'32\solo si do8. r4 r8 sol' mi do\mbreak

    %73
    \grace do si lad \grace do si lad \grace lad si2
    la!32 sold la8. r4 r8 mi' do la
    \grace la sol fad \grace la sol fad sol4 si

    %76
    la mi'4. mi,8 fad sol
    fad sold4 la8 r sold4 la8
    r mi'4 sold,8 la mi(fad sol)

    %79
    fad la(sold la) do la(sol? fad)\mbreak
    sol si(lad si) re si(la? sol?)
    la do(si do) mi do(si la)

    %82
    si16\tu[(sol) sol'8 sol sol] sol sol sol sol
    do,16[(sol) sol'8 sol sol] sol sol sol sol
    re16[(sol,) sol'8 sol sol] sol sol sol sol

    %85
    mi16 sol mi do re do si do mi sol mi do re do si do\mbreak
    re,(fad la do) fad la la la re,,(fad la do) fad la la la
    re,,(sol si re) sol sol sol sol re,(sol si re) sol sol sol sol

    %88
    dod,,4 sol''16 fad si sol dod,,4 sol''16 fad si sol
    dod,,4 dod8. dod16  dod4 dod
    re2 fad'\tr

    %91
    sol16 si re,8 re4\tr\mbreak mi16 sol do,8 do4\tr
    si16(re sol) sol sol sol sol sol re,4 la'\tr
    si4.\solo re16 si sol8 re(mi fa)

    %94
    mi4. mi'16 do sol8 mi fa sol
    fa4. re'16 si sol8 re mi fa
    mi mi'4 \f do8 si do32 si la16 sol8[fad?]\mbreak

    %97
    sol re16 si sol4. si8 do re
    do mi16 do sol4. do8 re mi
    re re'16 si sol4. si,8 do re

    %10
    do mi'4 \f do8 si do32 si la16 sol8[la]
    sol16(si re) sol sol sol sol sol sol,(do mi) sol sol sol sol sol  \mbreak
    sol,(si re) sol sol sol sol sol mi8 do si la

    %103
    sol16(si re) sol sol sol sol sol mi8 do si la
    sol' do, si la sol2

}


IvlIIn = \relative do''{

    <sol' si, re,>4 r <fad la, re,> r
    sol8 [si16 la sol8\once\stemUp si,,] do si la fad'
    \once\stemUp sol[si'16 la sol8 \once\stemUp si,,] do si la fad'

    %4
    sol16(si re) sol sol sol sol sol\mbreak sol sol re re si si sol sol
    la(do fad) la la la la la la la fad fad re re la la
    si8\noBeam sol'32 la si16 si8[si] si si si si

    %7
    si\noBeam sol32\p la si16 si8[si] si si si si
    si la r sol\f sol fad r mi\mbreak
    fad fad, sol la si re do si

    %10
    la fad sol la si re do si
    la16 re re, re re re re re re4 r
    r8 mi\p mi mi mi mi mi mi

    %13
    fad fad fad fad fad re mi fad
    fad re re re re dod dod si\mbreak
    dod dod dod dod dod dod dod dod

    %16
    dod dod dod dod dod dod dod dod
    re re mi mi fad fad re re
    dod dod dod dod re re re re

    %19
    si si si si si si si si
    la la la la la la la la
    si si dod dod\mbreak re re re re

    %22
    \once\stemUp mi la'\f la la la la la la
    sol, sol' sol sol sol sol sol sol
    fad16 la fad dod re la fad re fad' la fad dod re la fad re

    %25
    sol'8 si, si si sol' si, si si
    fad'16 la fad dod re la fad re\mbreak fad' la fad dod re la fad re
    si'8 red mi red mi si si si

    %28
    la16 fad fad fad fad fad fad fad mi mi mi mi mi mi mi mi
    re8 la'16\p fad re4. fad8 sol la
    sol si16 sol re4. sol8 la si\mbreak

    %31
    la8 la'16 fad re4. fad,8 sol la
    sol si'4\f sol8 fad\noBeam si,32 la sol16 fad8[mi]
    re'4.\solo la'16 fad re8 la si do

    %34
    si4. si'16 sol re8 si do re
    do4. la'16 fad re8 la si do
    si si'4\f sol8 fad\noBeam si,32 la sol16 fad8[mi]

    %37
    re'16(fad la) re re re re re re,(sol si) re re re re re
    re,(fad la) re re re re re\mbreak si8 sol fad mi
    re16(fad la) re re re re re si8 sol fad mi

    %40
    re sol, fad mi re4 r
    <fad' la, re,> re, re re
    <sol' si, re,> re, re re

    %43
    fad'16 mi fad re sol fad sol mi la sol la fad si la si sol
    fad mi fad re sol fad sol mi la sol la fad si la si sol
    fad8 la,\p(sib la) r la(sib la)

    %46
    sib1
    la~
    la

    %49
    re,\mbreak
    mib4 r8 la la\tr sol r sol
    fad re'\f do sib\mbreak la sol fad sol

    %52
    re'16(mi re ) do' do do do do re,(mi re) re' re re re re
    re,(mi re ) do' do do do do \once\stemDown si8 sol, fad mi
    si'16(do si) la' la la la la si,(do si) si' si si si si

    %55
    si,(do si) la' la la la la sol4 r8 si,
    do4 si la sol
    fad red mi8 si' la sol16 fad

    %58
    mi8 do si lad si4 r
    r2 r8 do' la si
    do mi la, si mi,4 r\mbreak

    %61
    <sol' si, re,>4 r <fad la, re,> r
    sol8 [si16 la sol8\once\stemUp si,,] do si la fad'
    \once\stemUp sol[si'16 la sol8 \once\stemUp si,,] do si la fad'

    %64
    sol16(si re) sol sol sol sol sol sol sol re re si si sol sol
    la(do fad) la la la la la la la fad fad re re la la
    si8\noBeam sol'32 la si16 si8[si] si si si si

    %67
    si \noBeam sol32\p la si16 si8[si] si si si si
    si la r sol\f sol fad r mi
    fad fad, sol la si re do si

    %70
    la fad sol la si re do si
    la16 re re, re re re re re re4 r
    r8 sol\p sol sol sol4 r

    %73
    r2 r8 fad fad fad
    mi mi mi mi mi4 r
    r2 r8 sol sol sol

    %76
    mi mi mi mi mi mi mi mi
    la,4 r8 fad' fad4 r8 fad\mbreak
    la4 r r8 mi mi mi

    %79
    re4 r8 re re do si la
    si4 r8 re re re do si
    la4 r8 la la la' sol fad

    %82
    sol sol'\f sol sol sol sol sol sol
    do,16[(sol) sol'8 sol sol] sol sol sol sol
    re16[(sol,) sol'8 sol sol] sol sol sol sol

    %85
    mi16 sol mi do re do si do mi sol mi do re do si do\mbreak
    re,(fad la do) fad la la la re,,(fad la do) fad la la la
    re,,(sol si re) sol sol sol sol re,(sol si re) sol sol sol sol

    %88
    dod,,4 sol''16 fad si sol dod,,4 sol''16 fad si sol
    dod,,4 dod8. dod16  dod4 dod
    re2 fad'\tr

    %91
    sol16 si re,8 re4\tr\mbreak mi16 sol do,8 do4\tr
    si16(re sol) sol sol sol sol sol re,4 la'\tr
    sol8\p re16 si sol4. si8 do re

    %94
    do mi16 do sol4. do8 re mi\mbreak
    re re'16 si sol4. si,8 do re
    do mi'4\f do8 si do32 si la16 sol8[fad]

    %97
    sol4.\solo re'16 si sol8 re mi fa
    \grace fa? mi4. mi'16 do sol8 mi fa sol
    fa4. re'16 si sol8 re mi fa

    %100
    mi mi'4_\tu do8 si do32 si la16 sol8 fad\mbreak
    sol16(si re) sol sol sol sol sol sol,(do mi) sol sol sol sol sol  \mbreak
    sol,(si re) sol sol sol sol sol mi8 do si la

    %103
    sol16(si re) sol sol sol sol sol mi8 do si la
    sol' do, si la sol2

}


Ivlan = \relative do'{

    <<si'4\\re,>> sol8. si16 <<la4\\re,>> fad8. la16
    sol4 r8 si, do si la fad'
    sol4 r8 si, do si la fad'\mbreak

    %4
    sol si, si si' \once\stemDown re si, sol si
    re re re re fad la fad re
    re4 r8sol~sol\noBeam sol4 sol8~

    %7
    sol sol,4 sol' sol sol8~
    sol mi4 mi8~mi la ~la la,
    la4 r8 re re sol, sol16 la si do(\mbreak

    %10
    re4) r8 re re sol, sol16 la si do
    re re, re re re re re re re4 r
    r8 la'\p la la la la la la

    %13
    la la la la la la la la
    la la la la la la la la\mbreak
    la la la la la la la la

    %16
    la la la la la la la la
    re, re la' la si si si si
    la la la la re, re re re

    %19
    sol sol sol sol sol sol sol sol
    fad fad fad fad fad fad fad fad\mbreak
    sol sol la la si si si si

    %22
    la dod\f re mi fad red mi fad
    si, si dod re mi dod re mi
    la, re' fad, re' la re fad, re'

    %25
    si re sol, re' si re sol, re'
    la re fad, re' la re fad, re'\mbreak
    re,4 r r8 sol fad mi

    %28
    fad la la,4 r8 la la la
    la4 r r2
    R1*2

    %32
    r8 re re re la' si la sol
    \once\stemDown fad re,\p re re re re re re
    re re re re re re re re

    %35
    re re re re re re re re\mbreak
    re re' re4 r8 sol\f fad mi
    fad re la' fad sol re si' sol

    %38
    la re, la' la, mi' re re dod
    re4 r8 la mi' re re dod
    re re la' sol fad4 r

    %41
    <la fad la,> re, re re
    <si' re, sol,> re, re re
    re4 r8 re re re' re re,

    %44
    re4 r8 re re re' re re,
    re re\p re re re re re re
    re re re re re re re re

    %47
    do do do do do do do do
    do do do do do do do do\mbreak
    sib sib sib sib sib sib sib sib

    %50
    la la fad fad sol sol sol sol
    re' re'\f do sib la sol fad sol
    re sol la fad sol fad sol si

    %53
    la sol la fad sol, sol' fad mi
    fad mi fad red mi red mi sol\mbreak
    fad mi fad red mi4 r

    %56
    R1*2
    r8 do si lad si4 r
    r2 r8 do la si

    %60
    do mi la, si mi,4 r
    <<si''4\\re,>> sol8. si16 <<la4\\re,>> fad8. la16
    sol4 r8 si, do si la fad'

    %63
    sol4 r8 si, do si la fad'
    sol si sol si \once\stemDown re si, sol si
    re re re re fad la fad re

    %66
    re( re re) sol sol sol,4 sol'8~
    sol sol,4 sol' sol, sol'8~
    sol mi mi mi mi la la la,

    %69
    la4 r8 re re sol, sol16 la si do(
    re4) r8 re re sol, sol16 la si do
    re re, re re re re re re re4 r

    %72
    mi8\p mi mi mi mi mi mi mi
    re re re re re re re re
    do do do do do do' do do\mbreak

    %75
    si si si si si si si si
    do do, do do dod dod dod dod
    re re re re re re re re

    %78
    do do do do dod dod dod dod
    re re re re re re re re
    re re re re re re re re\mbreak

    %81
    re re re re re re re re
    \once\stemUp sol si'\f si si si do si la
    sol fa mi re do si do mi

    %84
    re mi re do si la sol sol'
    sol sol mi mi sol sol mi mi
    fad? re la' fad fad re la' fad\mbreak

    %87
    si, sol re' si si sol re' si
    dod dod dod dod dod dod dod dod
    dod?dod dod dod dod dod dod dod

    %90
    re fad la fad r la fad re
    re4 r8 re sol,4 r8 sol'
    sol re si sol' si sol re fad\mbreak

    %93
    sol sol,\p sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %96
    do do\f do do re mi re do
    si sol\p sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol\mbreak

    %99
    sol sol sol sol sol sol sol sol
    do sol\f sol mi' re mi re do
    si si' si sol do do, do do

    %102
    re4 r8 re sol, do re do
    si si re si sol sol' sol fad
    sol do, re re re2

}


Ivcn = \relative do {

    sol'4 r re r
    sol r8 si, do si la fad'
    sol4 r8 si, do si la fad'

    %4
    sol  sol sol sol si si si si
    fad fad fad fad\mbreak re re re re
    sol sol sol sol fad fad fad fad

    %7
    mi mi mi mi si si si si
    do do do do dod dod dod dod
    re re mi fad sol si la sol

    %10
    fad re mi fad\mbreak sol si la sol
    re re, re re re4 r
    R1*10

    %22
    la'8 la' fad mi red si dod red
    mi sol mi re? dod la si dod
    re re, re re re re re re\mbreak

    %25
    re re re re re re re re
    re re re re re re re re
    sol sol sol' sol sol sol sol sol

    %28
    la la la la la, la la la
    re4 r r2
    R1*2\mbreak

    %32
    r8  \once\stemUp sol, si' si la sol la la,
    re4 r r2
    R1*2

    %36
    r8  \once\stemUp sol, si' si la sol la la,
    re re re re si si si si
    fad' fad fad fad sol si la la,\mbreak

    %39
    re re fad fad sol si la la,
    si si' la[la,] re4 r
    re r r2

    %42
    re4 r r2
    re8 re mi mi fad fad sol sol
    re re mi mi fad fad sol sol

    %45
    re re\mp re re re re re re
    re re re re re re re re\mbreak
    do do do do do do do do

    %48
    do do do do do do do do
    sib sib sib sib sib sib sib sib
    la la' fad fad sol sol sol, sol

    %51
    re' re'\f do sib la sol fad sol
    re mi fad re si'! la si sol
    fad mi fad re sol, sol' fad mi

    %54
    red dod red si sol' fad sol mi
    red dod red si mi mi sol sol
    la la sol sol fad fad mi mi\mbreak

    %57
    red red si si mi sol la si
    do do, si lad si si si si
    sol' la si si, mi do la si

    %60
    do mi la, si mi,4 r
    sol' r re r

    %62
    sol r8 si, do si la fad'
    sol4 r8 si, do si la fad'\mbreak
    sol sol sol sol si si si si

    %65
    fad fad fad fad re re re re
    sol sol sol sol fad fad fad fad
    mi mi mi mi si si si si

    %68
    do do do do dod dod dod dod\mbreak
    re re mi fad sol si la sol
    fad re mi fad sol si la sol

    %71
    re re, re re re4 r
    R1*10
    sol'8 sol, si re sol la sol fa

    %83
    mi re do re mi re mi do\mbreak
    si do si la sol la si sol
    do do do do do do do do

    %86
    re re re re re re re re
    re re re re re re re re
    dod dod dod dod dod dod dod dod

    %89
    dod? dod dod dod\mbreak dod dod dod dod
    re re fad re r do la' do,
    si si si si do do mi mi

    %92
    re re re re re, re re re
    sol4 r r2
    R1*2

    %96
    r8 do\f mi mi re do re re,
    sol4 r r2\mbreak
    R1*2

    %100
    r8 do mi mi re do re re,
    sol sol' sol sol mi mi mi mi
    si si si si do mi re re,

    %103
    sol sol si si do mi re re,
    mi mi' re[re,] sol2

}


IvlIripn =\relative do'' {

    <sol' si, re,>4 r <fad la, re,> r
    sol8 [si16 la sol8\once\stemUp si,,] do si la fad'
    \once\stemUp sol[si'16 la sol8 \once\stemUp si,,] do si la fad'

    %4
    sol16(si re) sol sol sol sol sol\mbreak sol sol re re si si sol sol
    la(do fad) la la la la la la la fad fad re re la la
    si8\noBeam sol'32 la si16 si8[si] si si si si

    %7
    si\noBeam sol32\p la si16 si8[si] si si si si
    si la r sol\f sol fad r mi\mbreak
    fad fad, sol la si re do si

    %10
    la fad sol la si re do si
    la16 re re, re re re re re re4 r
    r8 dod\p dod dod dod la si dod

    %10
    re re re re re re re re
    re la la re\mbreak re la la la
    la mi' mi mi mi mi fad sol

    %13
    sol fad fad mi mi la, la la
    la la sol' sol fad fad si si
    mi, mi mi la, la la la la'

    %16
    sol sol sol sol sol sol, sol sol
    re' re re re re re re re\mbreak
    re si' la sol fad fad sold sold

    %19
    la la'\f la la la la la la
    sol, sol' sol sol sol sol sol sol
    fad16 la fad dod re la fad re fad' la fad dod re la fad re

    %25
    sol' si sol dod, re si sol re sol' si sol dod, re si sol re
    fad' la fad dod re la fad re\mbreak fad' la fad dod re la fad re
    si'4 si' r8 mi, fad sol

    %28
    fad16[(mi re8) re re] sol16[(mi dod8) dod dod]
    re re,\p re re re re re re
    re re re re\mbreak re re re re

    %31
    re re re re re re re re
    si' si'4 \f sol8 fad sol32[fad mi16] re8 dod
    \once\stemDown re la,\p la la la la la la

    %34
    si si si si si si si si
    la la la la la la re re
    re si''4\f sol8 fad sol32 [fad mi16] re8 dod

    %37
    re16(fad la) re re re re re re,(sol si) re re re re re
    re,(fad la) re re re re re\mbreak si8 sol fad mi
    re16(fad la) re re re re re si8 sol fad mi

    %40
    re sol, fad mi re4 r
    <fad' la, re,> re, re re
    <sol' si, re,> re, re re

    %43
    fad'16 mi fad re sol fad sol mi la sol la fad si la si sol
    fad mi fad re sol fad sol mi la sol la fad si la si sol
    fad8 fad,\p(sol fad) r fad(sol fad)

    %46
    r sol(fad sol) r sol(fad sol)
    mib mib mib mib\mbreak mib do' la sol
    fad fad fad fad fad fad fad fad

    %49
    sol sol sol sol sol sol sol sol
    la la la la re, re re re
    re re'\f do sib la sol fad sol

    %52
    re'16(mi re ) do' do do do do re,(mi re) re' re re re re
    re,(mi re ) do' do do do do \once\stemDown si8 sol, fad mi
    si'16(do si) la' la la la la si,(do si) si' si si si si

    %55
    si,(do si) la' la la la la sol8 mi r4
    R1*2
    r8 do, si lad si4 r

    %59
    r2 r8 do' la si
    do mi la, si mi,4 r

    %61
    <sol' si, re,> si,8. do16 do4 la8. do16
    si8[si'16 la sol8 \once\stemUp si,,] do si la fad'
    \once\stemUp sol[si'16 la sol8 \once\stemUp si,,] do si la fad'

    %64
    sol16(si re) sol sol sol sol sol\mbreak sol sol re re si si sol sol
    la(do fad) la la la la la la la fad fad re re la la
    si8\noBeam si'32 do re16 re8[re] re re re re

    %67
    re\noBeam si32\p do re16 re8[re] re re re re
    re do r si\f si la r sol\mbreak
    fad16 re re re re re re re <sol si, re,>4 r8 sol,

    %70
    la16 re re re re re re re <sol si, re,>4 r8 sol,
    fad16 re' re, re re re re re re4 r
    r8 do\p do do do4 r

    %73
    r2 r8 si si si\mbreak
    do la la la la4 r
    r2 r8 re re re

    %76
    do do do do la la la la
    re re re re re re re re
    mi mi mi mi la, la la la

    %79
    la4 r8 fad' fad4 r8 re
    re4 r8 sol, sol sol sol sol'
    fad4 r8 fad re re re re\mbreak

    %82
    si'16[(sol) sol'8\f sol sol] sol sol sol sol
    do,16[(sol) sol'8 sol sol] sol sol sol sol
    re16[(sol,) sol'8 sol sol] sol sol sol sol

    %85
    mi16 sol mi do re do si do mi sol mi do re do si do\mbreak
    re,(fad la do) fad la la la re,,(fad la do) fad la la la
    re,,(sol si re) sol sol sol sol re,(sol si re) sol sol sol sol

    %88
    dod,,4 sol''16 fad si sol dod,,4 sol''16 fad si sol
    dod,,4 dod8. dod16  dod4 dod
    re2 fad'\tr

    %91
    sol16 si re,8 re4\tr\mbreak mi16 sol do,8 do4\tr
    si16(re sol) sol sol sol sol sol re,4 la'\tr
    sol8\p sol, sol sol sol sol sol sol

    %94
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    do mi'4\f do8 si mi32 re do16 si8 la

    %97
    sol re\p re re re re re re\mbreak
    mi mi mi  mi mi mi mi mi
    re re re re re re sol, sol

    %100
    sol mi''4\f do8 si do32 si la16 sol8[la]
    sol16(si re) sol sol sol sol sol sol,(do mi) sol sol sol sol sol  \mbreak
    sol,(si re) sol sol sol sol sol mi8 do si la

    %103
    sol16(si re) sol sol sol sol sol mi8 do si la
    sol' do, si la sol2

}


IvlIIripn =\relative do'' {

    <sol' si, re,>4 r <fad la, re,> r
    sol8 [si16 la sol8\once\stemUp si,,] do si la fad'
    \once\stemUp sol[si'16 la sol8 \once\stemUp si,,] do si la fad'

    %4
    sol16(si re) sol sol sol sol sol\mbreak sol sol re re si si sol sol
    la(do fad) la la la la la la la fad fad re re la la
    si8\noBeam sol'32 la si16 si8[si] si si si si

    %7
    si\noBeam sol32\p la si16 si8[si] si si si si
    si la r sol\f sol fad r mi\mbreak
    fad fad, sol la si re do si

    %10
    la fad sol la si re do si
    la16 re re, re re re re re re4 r
    r8 dod\p dod dod mi mi mi mi

    %13
    fad fad fad fad re re re re
    re re re re re dod dod si\mbreak
    dod dod dod dod dod dod dod dod

    %16
    dod dod dod dod dod dod dod dod
    re re mi mi fad fad si, si
    dod dod dod mi mi mi re re

    %19
    sol sol sol sol sol sol sol sol,
    re' re re re fad fad fad fad
    sol sol sol sol fad fad sold sold\mbreak

    %22
    la la'\f la la la la la la
    sol, sol' sol sol sol sol sol sol
    fad16 la fad dod re la fad re fad' la fad dod re la fad re

    %25
    sol'8 si, si si sol' si, si si
    fad'16 la fad dod re la fad re fad' la fad dod re la fad re
    si'8 red mi red mi si si si

    %28
    la16 fad fad fad fad fad fad fad mi mi mi mi mi mi mi mi
    re8 fad\p fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol

    %31
    la la la la fad fad fad fad
    sol si'4\f sol8 fad\noBeam si,32 la sol16 fad8[mi]
    re re\p re re re re re re\mbreak

    %34
    re re re re re re re re
    re re re re re re re re
    sol si'4\f sol8 fad sol32 [fad mi16] re8 dod

    %37
    re16(fad la) re re re re re re,(sol si) re re re re re
    re,(fad la) re re re re re\mbreak si8 sol fad mi
    re16(fad la) re re re re re si8 sol fad mi

    %40
    re sol, fad mi re4 r
    <fad' la, re,> re, re re
    <sol' si, re,> re, re re

    %43
    fad'16 mi fad re sol fad sol mi la sol la fad si la si sol
    fad mi fad re sol fad sol mi la sol la fad si la si sol\mbreak
    fad8 fad,\p(sol fad) r fad(sol fad)

    %46
    r sol(fad sol) r sol(fad sol)
    mib mib mib mib\mbreak mib do' la sol
    fad fad fad fad fad fad fad fad

    %49
    sol sol sol sol sol sol sol sol
    la la la la re, re re re
    re re'\f do sib la sol fad sol

    %52
    re'16(mi re ) do' do do do do re,(mi re) re' re re re re
    re,(mi re ) do' do do do do \once\stemDown si8 sol, fad mi
    si'16(do si) la' la la la la si,(do si) si' si si si si

    %55
    si,(do si) la' la la la la sol8 mi r4
    R1*2
    r8 do, si lad si4 r

    %59
    r2 r8 do' la si
    do mi la, si mi,4 r
    <sol' si, re,>4 r <fad la, re,> r

    %62
    si,8[si'16 la sol8 \once\stemUp si,,] do si la fad'
    \once\stemUp sol[si'16 la sol8 \once\stemUp si,,] do si la fad'

    %64
    sol16(si re) sol sol sol sol sol\mbreak sol sol re re si si sol sol
    la(do fad) la la la la la la la fad fad re re la la
    si8\noBeam si'32 do re16 re8[re] re re re re

    %67
    re\noBeam si32\p do re16 re8[re] re re re re
    re do r si\f si la r sol
    re fad, sol la si re do si

    %70
    la fad sol la si re do si
    la16 re re, re re re re re re4 r
    r8 do\p do do do4 r

    %73
    r2 r8 si si si\mbreak
    do la la la la4 r
    r2 r8 re re re

    %76
    do do do do la la la la
    re re re re re re re re
    mi mi mi mi la, la la la

    %79
    la4 r8 fad' fad4 r8 re
    re4 r8 sol, sol sol sol sol'
    fad4 r8 fad fad fad re re\mbreak

    %82
    sol sol'\f sol sol sol sol sol sol
    do,16[(sol) sol'8 sol sol] sol sol sol sol
    re16[(sol,) sol'8 sol sol] sol sol sol sol

    %85
    mi16 sol mi do re do si do mi sol mi do re do si do\mbreak
    re,(fad la do) fad la la la re,,(fad la do) fad la la la
    re,,(sol si re) sol sol sol sol re,(sol si re) sol sol sol sol

    %88
    dod,,4 sol''16 fad si sol dod,,4 sol''16 fad si sol
    dod,,4 dod8. dod16  dod4 dod
    re2 fad'\tr

    %91
    sol16 si re,8 re4\tr\mbreak mi16 sol do,8 do4\tr
    si16(re sol) sol sol sol sol sol re,4 la'\tr
    sol8\p si, si si si si si si

    %94
    do do do do do do do do
    re re re re si si si si
    la mi''4\f do8 si mi32 re do16 si8 la

    %97
    sol sol,\p sol sol sol sol sol sol\mbreak
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %100
    do mi'4\f do8 si do32 si la16 sol8[la]
    sol16(si re) sol sol sol sol sol sol,(do mi) sol sol sol sol sol  \mbreak
    sol,(si re) sol sol sol sol sol mi8 do si la

    %103
    sol16(si re) sol sol sol sol sol mi8 do si la
    sol' do, si la sol2

}

Ibcn = \relative do{

    sol'4 r re r
    sol r8 si, do si la fad'
    sol4 r8 si, do si la fad'

    %4
    sol  sol sol sol si si si si
    fad fad fad fad\mbreak re re re re
    sol sol sol sol fad fad fad fad

    %7
    mi mi mi mi si si si si
    do do do do dod dod dod dod
    re re mi fad sol si la sol

    %10
    fad re mi fad\mbreak sol si la sol
    re re, re re re4 r
    R1*10

    %22
    la'8 la' fad mi red si dod red
    mi sol mi re? dod la si dod
    re re, re re re re re re\mbreak

    %25
    re re re re re re re re
    re re re re re re re re
    sol sol sol' sol sol sol sol sol

    %28
    la la la la la, la la la
    re4 r r2
    R1*2\mbreak

    %32
    r8 sol si si la sol la la,
    re4 r r2
    R1*2

    %36
    r8 sol si si la sol la la,
    re re re re si si si si
    fad' fad fad fad sol si la la,\mbreak

    %39
    re re fad fad sol si la la,
    si si' la[la,] re4 r
    re r r2

    %42
    re4 r r2
    re8 re mi mi fad fad sol sol
    re re mi mi fad fad sol sol

    %45
    re4 r r2
    R1*5\mbreak
    r8 re'\f do sib la sol fad sol

    %52
    re mi fad re si'! la si sol
    fad mi fad re sol, sol' fad mi
    red dod red si sol' fad sol mi

    %55
    red dod red si mi4 r\mbreak
    R1*2
    r8 do si lad si4 r

    %59
    r2 r8 do la si
    do mi la, si mi,4 r
    sol' r re r

    %62
    sol r8 si, do si la fad'
    sol4 r8 si, do si la fad'\mbreak
    sol sol sol sol si si si si

    %65
    fad fad fad fad re re re re
    sol sol sol sol fad fad fad fad
    mi mi mi mi si si si si

    %68
    do do do do dod dod dod dod\mbreak
    re re mi fad sol si la sol
    fad re mi fad sol si la sol

    %71
    re re, re re re4 r
    R1*10
    sol'8 sol, si re sol la sol fa

    %83
    mi re do re mi re mi do\mbreak
    si do si la sol la si sol
    do do do do do do do do

    %86
    re re re re re re re re
    re re re re re re re re
    dod dod dod dod dod dod dod dod

    %89
    dod? dod dod dod\mbreak dod dod dod dod
    re re fad re r do la' do,
    si si si si do do mi mi

    %92
    re re re re re, re re re
    sol4 r r2
    R1*2

    %96
    r8 do\f mi mi re do re re,
    sol4 r r2\mbreak
    R1*2

    %100
    r8 do mi mi re do re re,
    sol sol' sol sol mi mi mi mi
    si si si si do mi re re,

    %103
    sol sol si si do mi re re,
    mi mi' re[re,] sol2

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s4 s8 <6> s4 <6>
    s4 s8 <6> s4 <6>
    s2 <6>
    <6> s
    s <4 2>
    <5> <6>
    <9 8>8 <8 6> s4 <7>8 <6> s4
    s1
    <6>
    s1*11
    <_+>2 <5>
    s1
    s
    <6 4>
    <5 3>
    s2 <6>
    <6 4> <5 _+>
    s1*3
    s4 <6> <6 4> s8 <5 _+>
    s1*3
    s4 <6> <6 4> s8 <5 _+>
    s2 <6>
    <6> s4 <6 4>8 <5 _+>
    s4 <6> s8 <6> <6 4> <5 _+>
    <5> <6> <6 4> <5 _+> s2
    s1
    <6 4>
    <5 3>4 <7> <6> s
    s <7> <6>2
    s1*6
    s2 <6>
    s <6>
    <6> s8 <6> <6\\> s
    <6>2 <6>
    <6> s
    s1*3
    s2 s4 s8 <_+>
    s4 s8 <_+> s2
    s1
    s4 s8 <6> s4 <6>8 <6>
    s4 s8 <6> s4 <6>8 <6>
    s2 <6>
    <6> s
    s <4 2>
    <5> <6>
    <9 7>8 <8 6> s4 <7> <6>
    s1
    <6>
    s1*12
    <6>1
    <6>
    s
    s
    <6 4>
    <7 5>
    s
    s2 s8 <4 2> s4
    <6>2 s4 <6>
    <6 4>2 <5 3>
    s1*3
    s4 <6> <6 4> s8 <5 3>
    s1*3
    s4 <6> <6 4> s8 <5 3>
    s2 <6>
    <6> s8 <6> <6 4> <5 3>
    s4 <6> s <6 4>8 <5 3>
    <5> <6> <6 4> <5 3>

}

forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 60
    s1*104
    \bar "||"

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


Ivc = {
    \Iglobal
    \clef bass
    <<\Ivcn \forma>>
}


IvlIrip = {
    \Iglobal
    <<\IvlIripn \forma>>
}


IvlIIrip = {
    \Iglobal
    <<\IvlIIripn \forma>>
}


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}


%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con
}

IIvlIn =\relative do'' {

    re'16\p sib sol4 sib8
    la16 fad re8 r mib
    r16 dod re8 r16 fad la do

    %4
    sib32(la sol16) sol8\noBeam r mib
    r16 dod re8 r16 fad la do
    \grace do8 sib8.\tr  la32 sib re8 sib

    %7
    la16(sold) la(sold) \grace sold8 la4
    sol!8. la32 sib \grace re,8 dod4\tr \mbreak
    re8 re, r4

    %10
    sib''4. re8
    do16 (la) fa8 r sol
    r16 mi fa8 r16 do re mib

    %13
    \tuplet 3/2 { re do sib } sib8\noBeam r16 sib fa' lab
    lab(sol) sib, lab' lab(sol) sib, lab'
    sol8\noBeam sib32\f la! sol16 fa re do mib

    %16
    \grace mib8 re4 r16 sib\p fa' lab\mbreak
    lab(sol) sib, lab' lab(sol) sib, lab'
    sol8 la!4.

    %19
    sib8\noBeam sol16\f(fa32 mib) re8 do
    sib4~sib16\p fa' lab fa
    sol16 [sib, sib8.] sol'16 sib sol

    %22
    fa [sib, sib8.] fa'16 lab fa
    sol16. sib32\f do,16. mib32 re8 do
    sib8\noBeam mib32\p(do la do)  sib8\noBeam mib32(do la do)

    %25
    sib16 sol\f fa mib re do sib la
    sib4 r
    re''16\p sib sol4 sib8

    %28
    la16 fad re8 r mib
    r16 dod re8 r16 fad la do
    sib32(la sol16) sol8\noBeam r mib

    %31
    r16 dod re8 r16 fad la do
    \grace do8 sib8. \tr la32 sib re8 sib
    \grace sib8 la16(sold) la(sold) \grace sold8 la4

    %34
    sol!8. (la32 sib) \grace re,8 dod4\mbreak
    re8 re, r16 sol re' fa
    fa(mib) sol, fa' fa(mib) sol, fa'

    %37
    fa(mib) re mib r re(dod) re
    do!8. \f re32 mib re16 do sib la
    sib8_\tr la r16 re\p la' do\mbreak

    %40
    do(sib) re, do' do(sib) re, do'
    sib(la\f) do la sol8 fad
    sol16[sol, sol8.\p] re'16 fa re

    %43
    mib[sol, sol8.] mib'16 sol mib
    re[sol, sol8.] re'16 fa re
    mib do\f sib la sol8 fad

    %46
    sol4 r16 re\p la' do\mbreak
    do(sib) re, do' do(sib) re, do'
    sib(la\f) do la sol8 fad

    %49
    sol\noBeam do32\p (la fad) la sol8\noBeam do32 (la fad) la
    sol16 mib\f re do sib la' sol fad
    sol2

}


IIvlIIn =\relative do'' {

    re'16\p sib sol4 sib8
    la16 fad re8 r mib
    r16 dod re8 r16 fad la do

    %4
    sib32(la sol16) sol8\noBeam r mib
    r16 dod re8 r16 fad la do
    \grace do8 sib8.\tr  la32 sib re8 sib

    %7
    la16(sold) la(sold) \grace sold8 la4
    sol!8. la32 sib \grace re,8 dod4\tr \mbreak
    re8 re, r4

    %10
    sib''4. re8
    do16 (la) fa8 r sol
    r16 mi fa8 r16 do re mib

    %13
    \tuplet 3/2 { re do sib } sib8\noBeam r16 sib fa' lab
    lab(sol) sib, lab' lab(sol) sib, lab'
    sol8\noBeam sib32\f la! sol16 fa re do mib

    %16
    \grace mib8 re4 r16 sib\p fa' lab\mbreak
    lab(sol) sib, lab' lab(sol) sib, lab'
    sol8 la!4.

    %19
    sib8\noBeam sol16\f(fa32 mib) re8 do
    sib16 sib, re\p fa sib8 fa'
    mib16 mib, sol sib mib8 sol

    %22
    re16 sib, re fa sib8 fa'\mbreak
    mib8.[do16\f sib8 la]
    sib8\noBeam mib32\p(do la do)  sib8\noBeam mib32(do la do)

    %25
    sib16 sol\f fa mib re do sib la
    sib4 r
    re''16\p sib sol4 sib8

    %28
    la16 fad re8 r mib
    r16 dod re8 r16 fad la do
    sib32(la sol16) sol8\noBeam r mib

    %31
    r16 dod re8 r16 fad la do
    \grace do8 sib8.\tr  la32 sib re8 sib
    \grace sib8 la16(sold) la(sold) \grace sold8 la4

    %34
    sol!8. (la32 sib) \grace re,8 dod4\mbreak
    re8 re, r16 sol re' fa
    fa(mib) sol, fa' fa(mib) sol, fa'

    %37
    fa(mib) re mib r re(dod) re
    do!8.\f re32 mib re16 do sib la
    sib8_\tr la r16 re\p la' do\mbreak

    %40
    do(sib) re, do' do(sib) re, do'
    sib(la\f) do la sol8 fad
    \once\stemDown sol16 sol,,\p si re sol8 re'

    %43
    do16 do, mib sol do8 mib\mbreak
    si16 sol, si re sol8 re'
    do16 mib,\f re do sib8 la

    %46
    sol4 r16 re'\p la' do\mbreak
    do(sib) re, do' do(sib) re, do'
    sib(la\f) do la sol8 fad

    %49
    sol\noBeam do32\p (la fad) la sol8\noBeam do32 (la fad) la
    sol16 mib \f re do sib la' sol fad
    sol2

}


IIvlan =\relative do' {

    r8 sib\p[re sib]
    r fad' [la sib]
    la r la r

    %4
    r sib,[re sib]
    la r re r
    re4 r8 mib

    %7
    mib re r re
    re[do sol'8. la16]
    fad8[sib la do]

    %1o
    r re,[fa? sib]
    la4 r8 re,
    do r la' r

    %13
    sib[re, fa re]
    sib[fa' sib, fa']
    sib,[mib fa fa,]

    %16
    r re'[fa re]
    sib[fa' sib, fa']
    sib,[mib do fa]

    %19
    fa[sib, sib la]
    sib2~
    sib~

    %22
    sib~\mbreak
    sib8[sol' fa fa]
    fa r fa r

    %25
    re16 sib'\f la sol fa mib re do
    sib4 r
    r8 sib\p[re sib]

    %28
    r fad'[la sib]
    la r la r
    r8 sib,[re sib]

    %31
    la r re r
    re4 r8 mib
    mib re r re\mbreak

    %34
    re [do sol'8. la16]
    fad8 la re,4
    r8 re[sol, re']

    %37
    r sol[sol, sol']
    sol fad r fad
    sol[fad fad fad]

    %40
    r la[re, la']
    re, mib16 do sib8 la
    sol2~

    %43
    sol~\mbreak
    sol~
    sol8[mib' re do]

    %46
    sib [sib' la fad]
    r la re,4
    r8 mib16 do sib8 la

    %49
    sib r sib r
    r16 sol'\f fa mib re do sib la
    sol2

}


IIvcn =\relative do {

    r8 sol'\p[sib sol]
    r re[fad sol]
    fad r re r

    %4
    r sol[sib sol]
    fad r re r
    sol[sol sol sol]\mbreak

    %7
    fa[fa fa fa]
    mib[mib mib mib]
    re[sol fa la,]

    %10
    sib[sib re sib]
    r fa[la sib]
    la r fa r

    %13
    r sib[re sib]\mbreak
    mib[re mib re]
    mib4 r

    %16
    r8 sib[re sib]
    mib[re mib re]
    mib[do fa mib]

    %19
    re [mib\f fa fa,]
    sib[sib \p re re]\mbreak
    mib [mib mib mib]

    %22
    re[re re re]
    mib4 fa8\f  fa,
    sib r sib\p r

    %25
    sib[mib\f fa fa,]
    sib4 r
    r8 sol'\p[sib sol]\mbreak

    %28
    r re[fad sol]
    fad r re r
    r sol[sib sol]

    %31
    fad r re r
    sol[sol sol sol]\mbreak
    fa[fa fa fa]

    %34
    mib[mib mib mib]
    re[re si sol]
    do[si do si]

    %37
    do[do sib! sib]
    la\f[la' fad re]
    sol do, re4

    %40
    sol8\p[fad sol fad]
    sol [do,\f re re,]\mbreak
    sol[sol si\p si]

    %43
    do[do do do]
    si[si si si]
    do4 re8\f re,

    %46
    sol[sol'\p fad re]
    sol8[fad sol fad]
    sol [do,\f re re,]\mbreak

    %49
    sol r sol\p r
    sol[do\f re re,]
    sol2

}

IIvlIripn =\relative do'' {

    re'16\p sib sol4 sib8
    la16 fad re8 r mib
    r16 dod re8 r16 fad la do

    %4
    sib32(la sol16) sol8\noBeam r mib
    r16 dod re8 r16 fad la do
    \grace do8 sib8.\tr la32 sib re8 sib

    %7
    la16(sold) la(sold) \grace sold8 la4
    sol!8. la32 sib \grace re,8 dod4\tr \mbreak
    re8 re, r4

    %10
    sib''4. re8
    do16 (la) fa8 r sol
    r16 mi fa8 r16 do re mib

    %13
    \tuplet 3/2 { re do sib } sib8\noBeam r16 sib fa' lab
    lab(sol) sib, lab' lab(sol) sib, lab'
    sol8\noBeam sib32\f la! sol16 fa re do mib

    %16
    \grace mib8 re4 r16 sib\p fa' lab\mbreak
    lab(sol) sib, lab' lab(sol) sib, lab'
    sol8 la!4.

    %19
    sib8\noBeam sol16\f(fa32 mib) re8 do
    sib4~sib16\p fa' lab fa
    sol16 [sib, sib8.] sol'16 sib sol

    %22
    fa [sib, sib8.] fa'16 lab fa
    sol16. sib32\f do,16. mib32 re8 do
    sib8\noBeam mib32\p(do la do)  sib8\noBeam mib32(do la do)

    %25
    sib16 sol\f fa mib re do sib la
    sib4 r
    re''16\p sib sol4 sib8

    %28
    la16 fad re8 r mib
    r16 dod re8 r16 fad la do
    sib32(la sol16) sol8\noBeam r mib

    %31
    r16 dod re8 r16 fad la do
    \grace do8 sib8.\tr  la32 sib re8 sib
    \grace sib8 la16(sold) la(sold) \grace sold8 la4

    %34
    sol!8. (la32 sib) \grace re,8 dod4\mbreak
    re8 re, r16 sol re' fa
    fa(mib) sol, fa' fa(mib) sol, fa'

    %37
    fa(mib) re mib r re(dod) re
    do!8.\f re32 mib re16 do sib la
    sib8_\tr la r16 re\p la' do\mbreak

    %40
    do(sib) re, do' do(sib) re, do'
    sib(la\f) do la sol8 fad
    sol16[sol, sol8.\p] re'16 fa re

    %43
    mib[sol, sol8.] mib'16 sol mib
    re[sol, sol8.] re'16 fa re
    mib do\f sib la sol8 fad

    %46
    sol4 r16 re\p la' do\mbreak
    do(sib) re, do' do(sib) re, do'
    sib(la\f) do la sol8 fad

    %49
    sol\noBeam do32\p (la fad) la sol8\noBeam do32 (la fad) la
    sol16 mib\f re do sib la' sol fad
    sol2

}


IIvlIIripn =\relative do'' {

    re'16\p sib sol4 sib8
    la16 fad re8 r mib
    r16 dod re8 r16 fad la do

    %4
    sib32(la sol16) sol8\noBeam r mib
    r16 dod re8 r16 fad la do
    \grace do8 sib8. \tr la32 sib re8 sib

    %7
    la16(sold) la(sold) \grace sold8 la4
    sol!8. la32 sib \grace re,8 dod4\tr \mbreak
    re8 re, r4

    %10
    sib''4. re8
    do16 (la) fa8 r sol
    r16 mi fa8 r16 do re mib

    %13
    \tuplet 3/2 { re do sib } sib8\noBeam r16 sib fa' lab
    lab(sol) sib, lab' lab(sol) sib, lab'
    sol8\noBeam sib32\f la! sol16 fa re do mib

    %16
    \grace mib8 re4 r16 sib\p fa' lab\mbreak
    lab(sol) sib, lab' lab(sol) sib, lab'
    sol8 la!4.

    %19
    sib8\noBeam sol16\f(fa32 mib) re8 do
    sib16 sib, re\p fa sib8 fa'
    mib16 mib, sol sib mib8 sol

    %22
    re16 sib, re fa sib8 fa'\mbreak
    mib8.[do16\f sib8 la]
    sib8\noBeam mib32\p(do la do)  sib8\noBeam mib32(do la do)

    %25
    sib16 sol\f fa mib re do sib la
    sib4 r
    re''16\p sib sol4 sib8

    %28
    la16 fad re8 r mib
    r16 dod re8 r16 fad la do
    sib32(la sol16) sol8\noBeam r mib

    %31
    r16 dod re8 r16 fad la do
    \grace do8 sib8.\tr la32 sib re8 sib
    \grace sib8 la16(sold) la(sold) \grace sold8 la4

    %34
    sol!8. (la32 sib) \grace re,8 dod4\mbreak
    re8 re, r16 sol re' fa
    fa(mib) sol, fa' fa(mib) sol, fa'

    %37
    fa(mib) re mib r re(dod) re
    do!8.\f re32 mib re16 do sib la
    sib8_\tr la r16 re\p la' do\mbreak

    %40
    do(sib) re, do' do(sib) re, do'
    sib(la\f) do la sol8 fad
    \once\stemDown sol16 sol,,\p si re sol8 re'

    %43
    do16 do, mib sol do8 mib\mbreak
    si16 sol, si re sol8 re'
    do16 mib,\f re do sib8 la

    %46
    sol4 r16 re'\p la' do\mbreak
    do(sib) re, do' do(sib) re, do'
    sib(la\f) do la sol8 fad

    %49
    sol\noBeam do32\p (la fad) la sol8\noBeam do32 (la fad) la
    sol16 mib\f re do sib la' sol fad
    sol2

}

IIbcn =\relative do {

    r8^\markup\italic"Senza Cembalo" sol'\p[sib sol]
    r re[fad sol]
    fad r re r

    %4
    r sol[sib sol]
    fad r re r
    sol[sol sol sol]\mbreak

    %7
    fa[fa fa fa]
    mib[mib mib mib]
    re[sol fa la,]

    %10
    sib[sib re sib]
    r fa[la sib]
    la r fa r

    %13
    r sib[re sib]\mbreak
    mib[re mib re]
    mib4 r

    %16
    r8 sib[re sib]
    mib[re mib re]
    mib[do fa mib]

    %19
    re [mib\f fa fa,]
    sib[sib\p re re]\mbreak
    mib [mib mib mib]

    %22
    re[re re re]
    mib4 fa8\f  fa,
    sib r sib\p r

    %25
    sib[mib\f fa fa,]
    sib4 r
    r8 sol'\p[sib sol]\mbreak

    %28
    r re[fad sol]
    fad r re r
    r sol[sib sol]

    %31
    fad r re r
    sol[sol sol sol]\mbreak
    fa[fa fa fa]

    %34
    mib[mib mib mib]
    re[re si sol]
    do[si do si]

    %37
    do[do sib! sib]
    la\f[la' fad re]
    sol do, re4

    %40
    sol8\p[fad sol fad]
    sol [do,\f re re,]\mbreak
    sol[sol si\p si]

    %43
    do[do do do]
    si[si si si]
    do4 re8\f re,

    %46
    sol[sol'\p fad re]
    sol8[fad sol fad]
    sol [do,\f re re,]\mbreak

    %49
    sol r sol\p r
    sol[do\f re re,]
    sol2

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/4
    \key sol\minor
    \tempo 4 = 60
    s2*51
    \bar "||"

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


IIvc = {
    \IIglobal
    \clef bass
    <<\IIvcn \forma>>
}


IIvlIrip = {
    \IIglobal
    <<\IIvlIripn \forma>>
}


IIvlIIrip = {
    \IIglobal
    <<\IIvlIIripn \forma>>
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
    \terzinequarto\con
}

IIIvlIn =\relative do'' {

    sol'4. si8[si,8. re16]
    \grace re8 do2 si4
    sol'4. si8[si,8. re16]

    %4
    \grace re8 do2 si4
    re, do'8 la' si, sol'
    re,4 do'8 la' si, sol'

    %7
    \tuplet 3/2 { mi8 re do } si4 la
    sol sol, r\mbreak
    la''8 (mi) fad (dod) re (la)

    %10
    si (dod) si sol' si si,
    si4\tr la8 sol' si si,
    si4\tr la r

    %13
    sold'32(fad sold8.) r4 r
    sol!32(fad sol8.) r4 r
    dod2.

    %16
    re4 la sol
    \tuplet 3/2 { fad8 sol la } re,4 dod
    \grace dod8 re4. re,8 la' do\mbreak

    %19
    \grace do8 si4. sol'8 mi dod
    \grace dod8 re4. re,8\p la' do?
    \grace do si4. sol'8 mi dod

    %22
    \grace dod8 re4 si'\f si
    la16 fad mi re fad4 mi
    re la8 fad mi dod

    %25
    re4 la'8 fad mi dod
    re2.\mbreak
    la''2 si4

    %28
    la8(fad) re re re' si
    do(la) re, re si' sol
    la8(fad) re re re' si

    %31
    do(la) re, re si' sol
    fad8. mi16 re4 r
    \tuplet 3/2 { sol,8\solo la sol } sol'4 si,

    %34
    do8 si \grace si do2\mbreak
    \tuplet 3/2 { la8 si la } la'4 dod,
    re8 dod \grace dod re2

    %37
    do!8 la re, do' la' [do,]
    si sol re si' sol'[re]
    mi re do si la sol

    %40
    fad4 mi8. fad16 re4
    sol'4.\tu si8[si,8. re16]
    \grace re8 do2 si4

    %43
    sol'4. si8[si,8. re16]
    \grace re8 do2 si4
    re, do'8 la' si, sol'

    %46
    re,4 do'8 la' si, sol'
    \tuplet 3/2 { mi8 re do } si4 la
    sol4. sol,8 re' fa

    %49
    \grace fa8 mi4. do'8 la fad!
    sol4.\p sol,8 re' fa
    mi4. do'8 la fad!

    %52
    sol4 mi'\tu mi
    re16 si la sol si4 la
    sol re'8 si la fad

    %55
    sol4 re'8 si la fad
    sol2.

}


IIIvlIIn =\relative do'' {

    sol'4. si8[si,8. re16]
    \grace re8 do2 si4
    sol'4. si8[si,8. re16]

    %4
    \grace re8 do2 si4
    re, do'8 la' si, sol'
    re,4 do'8 la' si, sol'

    %7
    \tuplet 3/2 { mi8 re do } si4 la
    sol sol, r\mbreak
    la''8 (mi) fad (dod) re (la)

    %10
    si (dod) si sol' si si,
    si4\tr la8 sol' si si,
    si4\tr la r

    %13
    sold'32(fad sold8.) r4 r
    sol!32(fad sol8.) r4 r
    dod2.

    %16
    re4 la sol
    \tuplet 3/2 { fad8 sol la } re,4 dod
    \grace dod8 re4 fad, fad\mbreak

    %19
    sol sol sol
    fad\p fad fad
    sol sol sol

    %22
    fad si'\f si
    la16 fad mi re fad4 mi
    re la8 fad mi dod

    %25
    re4 la'8 fad mi dod
    re2.\mbreak
    la''2 si4

    %28
    la8(fad) re re re' si
    do(la) re, re si' sol
    la8(fad) re re re' si

    %31
    do(la) re, re si' sol
    fad8. mi16 re4 r
    r si,\p re

    %34
    sol, fa'(mi)
    r dod mi
    la, sol'(fad?)

    %37
    mi la, fad'
    sol2 re4
    sol, mi' mi\mbreak

    %40
    la,2 r4
    sol''4.\f si8[si,8. re16]
    \grace re8 do2 si4

    %43
    sol'4. si8[si,8. re16]
    \grace re8 do2 si4
    re, do'8 la' si, sol'

    %46
    re,4 do'8 la' si, sol'
    \tuplet 3/2 { mi8 re do } si4 la
    sol4 si, si\mbreak

    %49
    do do do
    si\p si si
    do do do

    %52
    si mi'\f mi
    re16 si la sol si4 la
    sol re'8 si la fad

    %55
    sol4 re'8 si la fad
    sol2.

}


IIIvlan =\relative do' {

    si4 re sol
    mi fad sol
    si, re sol

    %4
    mi fad sol
    la fad re
    la' fad re

    %7
    mi8 la sol4 fad
    sol re r
    fad la fad

    %10
    re2 sol4
    sol fad sol
    \grace la8 sol4 fad r\mbreak

    %13
    r re re
    r re re
    r mi mi

    %16
    la, mi' mi
    la, fad' mi
    fad la re,

    %19
    re2 mi4
    la,\p la' re,
    re2 mi4

    %22
    re2 re4~\f
    re re dod
    re4. la'8 sol la

    %25
    fad4. la,8 sol la
    fad2.\mbreak
    fad'4 re sol

    %28
    fad8 mi fad4 sol
    fad8 sol la4 sol
    fad8 mi fad4 sol

    %31
    fad8 sol la4 re,
    re2 r4
    R2.*7

    %40
    r4 re'8 do si la
    si do re4 sol,
    mi fad sol

    %43
    si,8 do re4 sol\mbreak
    mi fad sol
    la fad re

    %46
    la' fad re
    mi8 la sol4 fad
    sol re re

    %49
    re2.~
    re~\p~
    re~

    %52
    re4 do\f sol'
    sol sol fad
    sol4. re8 do re

    %55
    si4. re8 do re
    si2.

}


IIIvcn =\relative do {

    sol'4 si sol
    la re, sol
    sol, si sol

    %4
    la re sol,
    fad' re sol\mbreak
    fad re sol

    %7
    do, re re,
    sol si sol
    re'2.

    %10
    sol4 si sol
    re2 dod4
    re re, r

    %13
    r si'' si
    r sib sib\mbreak
    r la sol

    %16
    fad dod dod
    re la' la,
    re re re

    %19
    re re re
    re\p re re
    re re re

    %22
    re sol\f sol
    fad la la,\mbreak
    re fad la

    %25
    re, fad la
    re,2.
    re4 fad sol

    %28
    re2 si'4
    la fad sol
    re2 si'4

    %31
    la fad sol
    re re, r
    r sol' fa

    %34
    mi re do
    r la' sol
    fad! mi re

    %37
    la' fad re
    sol si, si
    do2 dod4

    %40
    re2 r4
    sol si sol
    la re, sol
    sol, si sol

    %44
    la re sol,
    fad' re sol
    fad re sol

    %47
    do, re re,
    sol sol sol
    sol sol sol\mbreak

    %50
    sol\p sol sol
    sol sol sol
    sol do\f do

    %53
    si re re,
    sol si re
    sol, si re

    %56
    sol,2.

}


IIIvlIripn =\relative do'' {

    sol'4. si8[si,8. re16]
    \grace re8 do2 si4
    sol'4. si8[si,8. re16]

    %4
    \grace re8 do2 si4
    re, do'8 la' si, sol'
    re,4 do'8 la' si, sol'

    %7
    \tuplet 3/2 { mi8 re do } si4 la
    sol sol, r\mbreak
    la''8 (mi) fad (dod) re (la)

    %10
    si (dod) si sol' si si,
    si4\tr la8 sol' si si,
    si4\tr la r

    %13
    sold'32(fad sold8.) r4 r
    sol!32(fad sol8.) r4 r
    dod2.

    %16
    re4 la sol
    \tuplet 3/2 { fad8 sol la } re,4 dod
    \grace dod8 re4. re,8 la' do\mbreak

    %19
    \grace do8 si4. sol'8 mi dod
    \grace dod8 re4. re,8\p la' do?
    \grace do si4. sol'8 mi dod

    %22
    \grace dod8 re4 si'\f si
    la16 fad mi re fad4 mi
    re la8 fad mi dod

    %25
    re4 la'8 fad mi dod
    re2.\mbreak
    la''2 si4

    %28
    la8(fad) re re re' si
    do(la) re, re si' sol
    la8(fad) re re re' si

    %31
    do(la) re, re si' sol
    fad8. mi16 re4 r
    R2.*8

    %41
    sol4.\f si8[si,8. re16]
    \grace re8 do2 si4

    %43
    sol'4. si8[si,8. re16]
    \grace re8 do2 si4
    re, do'8 la' si, sol'

    %46
    re,4 do'8 la' si, sol'
    \tuplet 3/2 { mi8 re do } si4 la
    sol4. sol,8 re' fa

    %49
    \grace fa8 mi4. do'8 la fad!
    sol4.\p sol,8 re' fa
    mi4. do'8 la fad!

    %52
    sol4 mi'\f mi
    re16 si la sol si4 la
    sol re'8 si la fad

    %55
    sol4 re'8 si la fad
    sol2.

}


IIIvlIIripn =\relative do'' {

    sol'4. si8[si,8. re16]
    \grace re8 do2 si4
    sol'4. si8[si,8. re16]

    %4
    \grace re8 do2 si4
    re, do'8 la' si, sol'
    re,4 do'8 la' si, sol'

    %7
    \tuplet 3/2 { mi8 re do } si4 la
    sol sol, r\mbreak
    la''8 (mi) fad (dod) re (la)

    %10
    si (dod) si sol' si si,
    si4\tr la8 sol' si si,
    si4\tr la r

    %13
    sold'32(fad sold8.) r4 r
    sol!32(fad sol8.) r4 r
    dod2.

    %16
    re4 la sol
    \tuplet 3/2 { fad8 sol la } re,4 dod
    \grace dod8 re4 fad, fad\mbreak

    %19
    sol sol sol
    fad\p fad fad
    sol sol sol

    %22
    fad si'\f si
    la16 fad mi re fad4 mi
    re la8 fad mi dod

    %25
    re4 la'8 fad mi dod
    re2.\mbreak
    la''2 si4

    %28
    la8(fad) re re re' si
    do(la) re, re si' sol
    la8(fad) re re re' si

    %31
    do(la) re, re si' sol
    fad8. mi16 re4 r
    R2.*8
    sol4.\f si8[si,8. re16]
    \grace re8 do2 si4

    %43
    sol'4. si8[si,8. re16]
    \grace re8 do2 si4
    re, do'8 la' si, sol'

    %46
    re,4 do'8 la' si, sol'
    \tuplet 3/2 { mi8 re do } si4 la
    sol4 si, si\mbreak

    %49
    do do do
    si\p si si
    do do do

    %52
    si mi'\f mi
    re16 si la sol si4 la
    sol re'8 si la fad

    %55
    sol4 re'8 si la fad
    sol2.

}

IIIbcn =\relative do {

    sol'4 si sol
    la re, sol
    sol, si sol

    %4
    la re sol,
    fad' re sol\mbreak
    fad re sol

    %7
    do, re re,
    sol si sol
    re'2.

    %10
    sol4 si sol
    re2 dod4
    re re, r

    %13
    r si'' si
    r sib sib\mbreak
    r la sol

    %16
    fad dod dod
    re la' la,
    re\tasto re re

    %19
    re re re
    re\p re re
    re re re

    %22
    re sol\f sol
    fad la la,\mbreak
    re fad la

    %25
    re, fad la
    re,2.
    re4 fad sol

    %28
    re2 si'4
    la fad sol
    re2 si'4

    %31
    la fad sol
    re re, r
    R2.*8\mbreak

    %41
    sol'4 si sol
    la re, sol
    sol, si sol

    %44
    la re sol,
    fad' re sol
    fad re sol

    %47
    do, re re,
    sol\tasto sol sol
    sol sol sol\mbreak

    %50
    sol\p sol sol
    sol sol sol
    sol do\f do

    %53
    si re re,
    sol si re
    sol, si re

    %56
    sol,2.

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6> s
    <7> <7> s
    s <6> s
    <7> <7> s
    <6> s s
    <6> s s
    <6> <6 4> <5 3>
    s <6> s
    s2.
    s4 <6> s
    <6 4> <5 3> <7 5>
    <6 4> <5 3> s
    s <6\\> s
    s <6!> s
    s <_+> s
    <6> <6> s
    s <6 4> <5 _+>
    s2.*5
    <6>4 <6 4> <5 _+>
    s <6> <_+>
    s <6> <_+>
    s2.
    s4 <6> s
    s2 <6>4
    s <6> s
    s2 <6>4
    s <6>2
    s2.*9
    s4 <6>2
    <7>4 <7> s
    s <6> s
    <7> <7> s
    <6>2.
    <6>
    <6>4 <6 4> <5 3>
    s2.*5
    <6>4 <6 4> <5 3>
    s <6> s
    s <6> s

}

forma = {

    \time 3/4
    \key sol\major
    \tempo 2 = 60
    s2.*26
    \bar ":..:"\break
    s2.*30
    \bar ":|."

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


IIIvc = {
    \IIIglobal
    \clef bass
    <<\IIIvcn \forma>>
}


IIIvlIrip = {
    \IIIglobal
    <<\IIIvlIripn \forma>>
}


IIIvlIIrip = {
    \IIIglobal
    <<\IIIvlIIripn \forma>>
}


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}
#(set-global-staff-size 15)


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
        title = \markup\smaller{Concerto grosso n. 1 in Sol maggiore}
        composer = \markup \center-column{"F. Barsanti (1690 -1770)"}
    }

    \markup\huge{ "[1.] Vivace"}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\smaller{"Violino"\vspace #-0.25"Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"del Concertino"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "vla"
                    \Ivla
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vc"
                    \Ivc
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Primo"\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIr"
                    \IvlIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIIr"
                    \IvlIIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Organo o Basso""Ripieno"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc"
                    \Ibc
                >>
            >>
        >>

        \layout {
            indent = 2\cm

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
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge{ "[2.] Andante"}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\smaller{"Violino"\vspace #-0.25"Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"del Concertino"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "vla"
                    \IIvla
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vc"
                    \IIvc
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Primo"\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIr"
                    \IIvlIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIIr"
                    \IIvlIIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Organo o Basso""Ripieno"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc"
                    \IIbc
                >>
            >>
        >>

        \layout {
            indent = 2\cm

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
                \remove Dynamic_performer
            }
        }

    }

    \pageBreak

    \markup\huge{ "[3.] Allegro  Minuet"}

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column\smaller{"Violino"\vspace #-0.25"Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"del Concertino"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.shortInstrumentName = "vla"
                    \IIIvla
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.shortInstrumentName = "vc"
                    \IIIvc
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Primo"\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIr"
                    \IIIvlIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup   \center-column\smaller{"Violino"\vspace #-0.25"Secondo "\vspace #-0.25"Ripieno"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlIIr"
                    \IIIvlIIrip
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Organo o Basso""Ripieno"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc"
                    \IIIbc
                >>
            >>
        >>

        \layout {
            indent = 2\cm

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
                \remove Dynamic_performer
            }
        }

    }

}