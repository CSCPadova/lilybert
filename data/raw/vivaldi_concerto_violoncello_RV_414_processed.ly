\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

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

st = \staccatissimo

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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IvlIn =  \relative do'' {

    sol'8
    si, do la re si do re sol
    si, sol re' si la re, r sol'\p
    si, do la re si do re sol

    %4
    si, sol re' si la4 r8 re\f
    do fad la4 r8 do, si la
    si re sol4 r8 si, la sol\mbreak

    %7
    do\p fad la4 r8 do, si la
    si re sol4 r8 si, la sol
    la4 r8 dod\f dod4(re8) sol,

    %10
    fad mi re dod' dod4(re8) sol,
    fad mi re fad'\p fad4(sol8) do,
    si la sol fad' fad4(sol8) do,

    %13
    si do la re\mbreak si do la re
    si do la re si do la re
    si sol' la fad sol4 r8 re\p

    %16
    si do la re si do la re
    si do la re si sol'\f la fad
    sol4 r r2%% fine ripresa

    %19
    R1*14
    r2 re4. dod8
    re4. dod8 re4. dod8

    %35
    re fad sol mi fad sol mi la
    fad sol la re fad, re la' fad
    mi la, r la'\p fad sol mi la\mbreak % fine p. 4

    %38
    fad sol la re fad, re la' fad
    mi4 r8 sold\f sold4(la8) re,
    dod si la sold' sold4(la8) re,

    %41
    dod si la dod'\p dod4(re8) sol,?
    fad mi re dod' dod4(re8) sol,
    fad mi re la'\f  fad  sol mi la

    %44
    fad sol mi la fad re mi dod
    re4 r8 la\p \mbreak fad sol mi la
    fad sol mi la fad re'\f mi dod

    %47
    re4 r r2
    R1
    re,4 r la'8 sol fad mi

    %50
    red si dod red mi fad sol fad
    mi4 r \mbreak si'8 la sold fad!
    mid dod red mid fad sold la fad

    %53
    fad'8 fad fad fad fad fad fad fad
    sold sold sold sold sold sold sold sold
    la la la la la la la la

    %56
    R1*10
    sol8 la fad si sol la fad si
    sol la fad si sol mi r4

    %68
    fad8 sol mi la fad sol mi la
    fad sol mi la fad re r4
    si8 do? la re si do la re

    %71
    si do la re si do re sol
    si, sol re' si la4 r8 la'\mbreak
    la,4 r8 la' si4 r8 si

    %74
    si,4 r8 si' la4 r8 la
    la,4 r8 la' si4 r8 si
    si,4 r8 si' la4 r

    %77
    re, r8 re re,4 r8 re'
    mi4 r8 mi mi,4 r8 mi'\mbreak
    re4 r8 re re,4 r8 re'

    %80
    mi4 r8 mi mi,4 r8 mi'
    re4 r mi\p r8 mi
    mi,4 r8 mi' fad4 r8 fad

    %83
    fad,4 r8 fad' mi4 r8 mi
    mi,4 r8 mi'\mbreak fad4 r8 fad
    fad,4 r8 fad' mi4 r

    %86
    R1*4 %%%%5 metà p.9
    \senza \tuplet 3/2 { sol,8 re do si[la sol] } r2
    \tuplet 3/2 { do'8 sol fad mi[re do] } r2

    %92
    \tuplet 3/2 { sol'8 re do si[la sol] } r2
    R1*4
    r4 r8 fad' sol4. fad8

    %98
    sol4. fad8 sol4. fad8
    sol re si sol re' r re r
    si' do la re si do re sol

    %101
    si, sol re' si la re, r sol'\p
    si, do la re si do re sol
    si, sol re' si la4 r8 re\f

    %104
    do fad la4 r8 do, si la
    si re sol4 r8 si, la sol\mbreak
    do\p fad la4 r8 do, si la

    %107
    si re sol4 r8 si, la sol
    la4 r8 dod\f dod4(re8) sol,
    fad mi re dod' dod4(re8) sol,

    %110
    fad mi re fad'\p fad4(sol8) do,
    si la sol fad' fad4(sol8) do,
    si do la re\mbreak si do la re

    %113
    si do la re si do la re
    si sol' la fad sol4 r8 re\p
    si do la re si do la re

    %116
    si do la re si sol'\f la fad
    sol4 \fermata r r2

}

IvlIIn = \relative do'' {

    si8
    sol4. fad8 sol4. re'8
    sol, re si' sol fad4 r8 re'\p
    sol,4. fad8 sol4. re'8

    %4
    sol, re si' sol fad4 r8 fad'\f
    la2 fad
    sol re4. si'8\mbreak

    %7
    la2\p fad
    sol re4. sol8
    fad4 r la\f la

    %10
    la8 la,4. la'4 la
    la8 la,4. re'4\p re
    re8 re,4. re'4 re

    %13
    re8 re,4.\mbreak sol4. fad8
    sol4. fad8 sol4. fad8
    sol si, do la si4 r

    %16
    sol4.\p fad8 sol4. fad8
    sol4. fad8 sol si\f do la
    si4 r r2% fine rip.

    %19
    R1*14
    r2 fad8 si mi,4
    fad8 si mi,4 fad8 si mi,4

    %35
    fad8 la si dod re4. dod8
    re4. la'8 re, la fad' re
    dod4 r8 fad\p re4. dod8\mbreak

    %38
    re4. la'8 re, la fad' re
    dod4 r mi\f mi
    mi8 mi,4. mi'4 mi

    %41
    mi8 mi,4. la'4 la
    la8 la,4. la'4 la
    la8 la,4 dod8\f re4. dod8

    %44
    re4. dod8 re fad sol mi
    fad4 r8 mi,\p \mbreak re4. dod8
   re4. dod8 re fad'\f sol mi

    %47
    re4 r r2
    R1
    re,4 r la'8 sol fad mi

    %50
    red si dod red mi fad sol fad
    mi4 r \mbreak si'8 la sold fad!
    mid dod red mid fad sold la fad

    %53
    dod'8 dod dod fad re re re re
    red red red sold mid mid mid mid
    mid? mid mid la fad fad fad fad

    %56
    R1*10
    mi4. red8 mi4. red8
    mi4. red8 mi si r4

    %68
    re?4. dod8 re4. dod8
    re4. dod8 re la r4
    sol4. fad8 sol4. fad8

    %71
    sol4. fad8 sol4. re'8
    sol, re si' sol fad4 r8 fad'\mbreak
    fad,4 r8 fad' sol4 r8 sol

    %74
    sol,4 r8 sol' fad4 r8 fad
    fad,4 r8 fad' sol4 r8 sol
    sol,4 r8 sol' fad4 r

    %77
    si,4 r8 si si,4 r8 si'
    do4 r8 do do,4 r8 do'\mbreak
    si4 r8 si si,4 r8 si'

    %80
    do4 r8 do do,4 r8 do'
    si4 r dod4\p r8 dod
    dod,4 r8 dod' re4 r8 re

    %83
    re,4 r8 re' dod4 r8 dod
    dod,4 r8 dod'\mbreak re4 r8 re
    re,4 r8 re' dod4 r

    %86
    R1*4
    \senza \tuplet 3/2 { sol8 re do si[la sol] } r2
    \tuplet 3/2 { do'8 sol fad mi[re do] } r2

    %92
    \tuplet 3/2 { sol'8 re do si[la sol] } r2
    R1*4
    r4 r8 la' si mi, la4

    %98
    si8 mi, la4 si8 mi, la4
    si8 re, si sol re' r re r
    sol4. fad8 sol4. re'8

    %101
    sol, re si' sol fad4 r8 re'\p
    sol,4. fad8 sol4. re'8
    sol, re si' sol fad4 r8 fad'\f

    %104
    la2 fad
    sol re4. si'8\mbreak
    la2\p fad

    %107
    sol re4. sol8
    fad4 r la\f la
    la8 la,4. la'4 la

    %110
    la8 la,4. re'4\p re
    re8 re,4. re'4 re
    re8 re,4.\mbreak sol4. fad8

    %113
    sol4. fad8 sol4. fad8
    sol si, do la si4 r
    sol4.\p fad8 sol4. fad8

    %116
    sol4. fad8 sol si\f do la
    si4\fermata r r2

}

Ivlan = \relative do'{

    re8
    re mi re4 re si
    re8 si sol' re re4 r8 re\p
    re mi re4 re si

    %4
    re8 si sol' re re4 r8 la'\f
    fad sol la fad r la sol fad
    re do re si r re do si\mbreak

    %7
    fad'\p sol la fad r la sol fad
    re do re si r re do si
    la4 r8 mi'\f mi4 fad8 sol

    %10
    la,4 r8 mi' mi4 fad8 sol
    la,4 r8 la'\p la4 si8 do
    re,4 r8 la' la4 si8 do

    %13
    re,4 r8 si'\mbreak re, mi re fad
    re mi re fad re mi re fad
    re re mi re re4 r8 fad\p

    %16
    re mi re fad re mi re fad
    re mi re fad re re\f mi re
    re4 r r2 %% fine rep.

    %19
    R1*14
    r2 re8 sol, la la
    re sol, la la re sol, la la

    %35
    re re sol, la la' si la4
    la fad la8 fad re' la
    la4 r8 la \p la si la4\mbreak

    %38
    la fad la8 fad re' la
    la4 r8 si\f si4 dod8 re
    mi,4 r8 si' si4 dod8 re

    %41
    mi,4 r8 mi\p mi4 fad8 sol
    la,4 r8 mi' mi4 fad8 sol
    la,4 r8 la'\f la si la dod

    %44
    la si la dod la la si la
    la4 r8 la,\mbreak la si la dod
    la si la dod la la'\f si la

    %47
    fad4 r r2
    R1
    re4 r la'8 sol fad mi

    %50
    red si dod red mi fad sol fad
    mi4 r \mbreak si'8 la sold fad!
    mid dod red mid fad sold la fad

    %53
    lad8 lad lad lad si si si si
    sid sid sid sid dod dod dod dod
    dod? dod dod dod re re re re

    %56
    R1*10
    si8 do si red si do si red
    si do si red si sol r4

    %68
    la8 si la dod la si la dod
    la si la dod la fad r4
    re8 mi re fad re mi re fad

    %71
    re mi re fad re4 si
    re8 si sol' re re4 r8 re\mbreak
    re4 r8 re sol,4 r8 sol

    %74
    sol4 r8 sol re'4 r8 re
    re4 r8 re sol,4 r8 sol
    sol4 r8 sol re'4 r

    %77
    sol,4 r8 sol sol4 r8 sol
    do4 r8 do do4 r8 do\mbreak
    sol4 r8 sol sol4 r8 sol

    %80
    do4 r8 do do4 r8 do
    sol4 r la\p r8 la
    la4 r8 la re4 r8 re

    %83
    re4 r8 re la4 r8 la
    la4 r8 la\mbreak re4 r8 re
    re4 r8 re la4 r

    %86
    R1*4
    \senza \tuplet 3/2 { sol'8 re do si[la sol] } r2
    \tuplet 3/2 { do'8 sol fad mi[re do] } r2

    %92
    \tuplet 3/2 { sol'8 re do si[la sol] } r2
    R1*4
    r4 r8 re' sol, do re re,

    %98
    sol do re re, sol do re re,
    sol re' si sol re' r re, r
    re' mi re4 re si

    %101
    re8 si sol' re re4 r8 re\p
    re mi re4 re si
    re8 si sol' re re4 r8 la'\f

    %104
    fad sol la fad r la sol fad
    re do re si r re do si\mbreak
    fad'\p sol la fad r la sol fad

    %107
    re do re si r re do si
    la4 r8 mi'\f mi4 fad8 sol
    la,4 r8 mi' mi4 fad8 sol

    %110
    la,4 r8 la'\p la4 si8 do
    re,4 r8 la' la4 si8 do
    re,4 r8 si'\mbreak re, mi re fad

    %113
    re mi re fad re mi re fad
    re re mi re re4 r8 fad\p
    re mi re fad re mi re fad

    %116
    re mi re fad re re\f mi re
    re4\fermata r r2

}

Ivcn = \relative do{

    sol'8
    sol do, re re, sol' la si la
    sol sol, sol' sol, re' re, r sol'\p
    sol do, re re, sol' la si la

    %4
    sol sol, sol' sol, re'4 r8 re\f
    re mi fad re re' re, re re'
    sol,, la si sol sol' sol, sol sol'

    %7
    re\p mi fad re re' re, re re'
    sol,, la si sol sol' sol, sol sol'
    re mi fad sol\f la sol fad mi

    %10
    re mi fad sol la sol fad mi
    re mi fad re re' do si la
    sol la si do re do si la

    %13
    sol la si sol\mbreak sol, do re re,
    sol do re re, sol do re re,
    sol sol' do, re sol fad sol re\p

    %16
    sol, do re re, sol do re re,
    sol do re re, sol sol'\f do, re
    sol,4 r8 \clef tenor re'' si re sol, re'

    %19
    mi sol sol, mi' re sol sol, re'
    mi sol sol, mi'\mbreak re si sol si
    do la \clef bass re,, do'' si sol sol, si'

    %22
    do la re,, do'' si sol, r\clef tenor sol'16 la
    si8[si16 do re8 si] si\tr la r la16 si
    do8[do16 re mi8 do] do\tr si r sol'16 la

    %25
    si4~si16 la sol fad mi re do si la sol fad mi\mbreak %%% fine p.3
    fad8 re r fad'16 sol la4~la16 sol fad mi
    re do si la sol fad mi re mi8 do r mi'16 fad

    %28
    sol4~sol16 la sol fad mi re dod si la sol fad mi
    fad8 re r la'16 re do?4(si8) si16 mi
    re4(dod8) dod16 fad mi4(re8)\clef bass la

    %31
    fad16 sol fad sol mi8 la\mbreak fad16 sol fad sol mi8 la
    fad16 sol fad sol mi8 la fad mi16 re la'8 la,
    re4 r8 \clef tenor la' fad'16 sol fad sol mi8 la

    %34
    fad16 sol fad sol mi8 la fad16 sol fad sol mi8 la
    fad[mi16 re mi8 dod] re8\clef bass sol, la la,
    re mi fad mi re re, re' re,

    %37
    la'4 r8 re\p re sol la la,\mbreak
    re mi fad mi re re, re' re,
    la' si dod re\f mi re dod si

    %40
    la si dod re mi re dod si
    la si dod la\p la' sol fad mi
    re mi fad sol la sol fad mi

    %43
    re mi fad mi\f re sol la la,
    re sol la la, re re' sol, la
    re, mi fad dod\p\mbreak re sol la la,

    %46
    re sol la la, re re'\f sol, la
    re,16[mi fad sol la si dod re] la,[si dod re mi fad sol la]
    re,[mi fad sol la si dod re] dod8 la r4

    %49
    \clef tenor  re,16 [mi fad sol la si do! re] do8-.(do-. do-. do-.)
    <<{do4. si16 la}\\red,2>> sol16 fad mi8 r4
    mi16[fad sol la si dod re mi]\mbreak re8 re re re

    %52
    <<{re4. dod16 si}\\mid,2>> la16 sold fad8 r4
    fad'16 mi mi8~mi16 re re dod re(dod) re(dod) re8 r
    sold16 fad fad8~fad16 mid mid red mid(red) mid(red) mid8 r

    %55
    la16 sold sold8~sold16 fad fad mid fad mid fad mid fad8 r
    dod16 fad sold la la, fad' sold la si, mi fad sold sold, mi' fad sold\mbreak
    la, re mi fad fad, re' mi fad sold, dod re mi mi, dod' re mi

    %58
    fad, si dod re re, si' dod re mi, la si dod mi, la si dod
    sol? dod re mi sol,4~ sol16 dod re mi dod si la sol
    fad fad sol la \clef bass do,!4~do16 fad sol la fad mi re do

    %61
    si re sol si re4~\mbreak re16[do si la sol fad mi re]
    do mi la \clef tenor do mi4~mi16 re do si la sol fad mi
    red? fad la red? fad4~fad16[mi red! dod si la sol fad]

    %64
    sol8 mi r16 mi fad! mi si' mi, fad mi do'? mi, fad mi
    red'4(mi8) re!16 do si8[la16 sol la8 si]\clef bass \mbreak
    mi, la si si, mi la si si,

    %67
    mi la si si, mi re dod la
    re sol la la, re sol la la,
    re sol la la, re mi fad re

    %70
    sol, do? re re, sol do re re,
    sol do re re, sol' la si la
    sol sol, sol' sol,\senza \tuplet 3/2 { re'(fad) la re[(la )fad] } %% fine p. 7

    %73
    \tuplet 3/2 { re(fad) la re[(la) fad] re(sol) si re[(si) sol]
    re(sol) si re[(si) sol] re (fad) la re[(la) fad]
    re[(fad) la] re(la) fad re(sol) si re[(si) sol]

    %76
    re(sol) si re[(si) sol]} re4 r
    \clef tenor \tuplet 3/2 { sol8 si re sol[re si] sol si re sol [re si]
    sol do mi sol [mi do] sol do mi sol[mi do]\mbreak

    %79
    sol si re sol[re si] sol si re sol [re si]
    sol do mi sol[mi do] sol do mi sol[mi do]}
    re sol, r4 \tuplet 3/2 { la8\p dod mi la[mi dod]

    %82
    la dod mi la[mi dod] la re fad la[fad re]
    la re fad la[fad re] la dod mi la[mi dod]
    la dod mi la[mi dod]\mbreak  la re fad la[fad re]

    %85
    la re fad la[fad re]} mi la, r4
    \tuplet 3/2 { fad'8\f\staccatissimo la\staccatissimo sol\staccatissimo fad\staccatissimo]sol\staccatissimo la\staccatissimo] red,\staccatissimo fad\staccatissimo mi\staccatissimo red\staccatissimo[ mi\staccatissimo fad\staccatissimo]
    mi sol fad mi[fad sol] dod, mi re dod[re mi]

    %88
    re fad mi re[mi fad] si, re do? si[do re]
    do mi re do[re mi]\mbreak do la sol fad[mi re] }
    \clef bass <<si'4\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,>> r \tuplet 3/2 { si'8 re do si[la sol] }

    %91
    <<do4\\\stemUp \once \override Stem #'transparent = ##t mi,\\\stemDown sol,>> r \tuplet 3/2 { do'8 la sol fad[mi re]}
    <<si'4\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,>> r si'16 do si do re8 fa,
    mi16 fa mi fa sol8 do,, do''16 re do re mi8 sol,

    %94
    fad?16 sol fad sol la8 re,, si''16 do si do la8 re
    si16 do si do la8 re\mbreak si16 do si do la8 re
    si16\clef  tenor re mi fad sol si, la sol \clef bass re 8\clef tenor sol' re, fad'

    %97
    \clef bass sol,,4 r8 \clef tenor re'' si16 do si do la si do re
    si do si do la si do re si do si do la si do re
    si re mi fad sol si, la sol re\clef bass sol fad sol la,8 fad'

    %100
    sol,8 do re re, sol' la si la
    sol sol, sol' sol, re' re, r sol'\p
    sol do, re re, sol' la si la

    %103
    sol sol, sol' sol, re'4 r8 re\f
    re mi fad re re' re, re re'
    sol,, la si sol sol' sol, sol sol'

    %106
    re\p mi fad re re' re, re re'
    sol,, la si sol sol' sol, sol sol'
    re mi fad sol\f la sol fad mi

    %109
    re mi fad sol la sol fad mi
    re mi fad re re' do si la
    sol la si do re do si la

    %112
    sol la si sol\mbreak sol, do re re,
    sol do re re, sol do re re,
    sol sol' do, re sol fad sol re\p

    %115
    sol, do re re, sol do re re,
    sol do re re, sol sol'\f do, re
    sol,4\fermata r8 r2

}

Ibcn = \relative do {

    sol'8
    sol do, re re, sol' la si la
    sol sol, sol' sol, re' re, r sol'\p
    sol do, re re, sol' la si la

    %4
    sol sol, sol' sol, re'4 r8 re\f
    re mi fad re re' re, re re'
    sol,, la si sol sol' sol, sol sol'

    %7
    re\p mi fad re re' re, re re'
    sol,, la si sol sol' sol, sol sol'
    re mi fad sol\f la sol fad mi

    %10
    re mi fad sol la sol fad mi
    re mi fad re re' do si la
    sol la si do re do si la

    %13
    sol la si sol\mbreak sol, do re re,
    sol do re re, sol do re re,
    sol sol' do, re sol fad sol re\p

    %16
    sol, do re re, sol do re re,
    sol do re re, sol sol'\f do, re
    sol,4 r sol' si,

    %19
    do do' si si,
    do do'\mbreak si sol
    la re,, sol' sol,

    %22
    la' re,, sol' sol,
    sol' sol, re' re,
    re' re, sol' sol,

    %25
    sol' sol, do' do,\mbreak
    re re, fad' fad,
    si' si, do do,

    %28
    mi' mi, la' la,
    re re, sol' sol,
    la' la, si' si,8 la

    %31
    re sol, la la\mbreak re, sol la la
    re, sol la la re, re' la' la,
    re mi fad re r2

    %34
    R1
    r2 re8 sol la la,
    re mi fad mi re re, re' re,

    %37
    la'4 r8 re\p re sol la la,\mbreak
    re mi fad mi re re, re' re,
    la' si dod re\f mi re dod si

    %40
    la si dod re mi re dod si
    la si dod la\p la' sol fad mi
    re mi fad sol la sol fad mi

    %43
    re mi fad mi\f re sol la la,
    re sol la la, re re' sol, la
    re, mi fad dod\p\mbreak re sol la la,

    %46
    re sol la la, re re'\f sol, la
    re,4 r la r
    re r la8 si dod la

    %49
    R1*7
    la'8 r fad r sold r mi r\mbreak
    fad r re r mi r dod r

    %58
    re r si r dod r la r
    mi' r la, r mi' r la, r
    re r re, r fad r re r

    %61
    sol la si la\mbreak sol4 r
    la8 si do  si la4 r
    si8 dod red dod si4 r

    %64
    mi8 fad! sol fad mi sol la la,
    si si' sol la red, mi la si\mbreak
    mi, la si si, mi la si si,

    %67
    mi la si si, mi re dod la
    re sol la la, re sol la la,
    re sol la la, re mi fad re

    %70
    sol, do? re re, sol do re re,
    sol do re re, sol' la si la
    sol sol, sol' sol, re'4 re\mbreak

    %73
    re re re re
    re re re re
    re re re re

    %76
    re re re8 mi fad re
    sol4 sol sol sol
    sol sol sol sol\mbreak

    %79
    sol sol sol sol
    sol sol sol sol
    la8 re, dod si la4\p la

    %82
    la la la la
    la la la la
    la la\mbreak la la

    %85
    la la la8 si dod la
    la'1\f
    sol

    %88
    fad
    mi2 re4 r
    sol, r sol r

    %91
    do r do r
    sol r sol8 la si sol
    do re mi do, la' si dod la

    %94
    re mi fad re, sol do? re re,
    sol do re re,\mbreak sol do re re,
    sol re' si sol re'4 re,

    %97
    sol8 sol' sol, r r2
    R1
    sol'8 re si sol re' r re, r

    %100
    sol8 do re re, sol' la si la
    sol sol, sol' sol, re' re, r sol'\p
    sol do, re re, sol' la si la

    %103
    sol sol, sol' sol, re'4 r8 re\f
    re mi fad re re' re, re re'
    sol,, la si sol sol' sol, sol sol'

    %106
    re\p mi fad re re' re, re re'
    sol,, la si sol sol' sol, sol sol'
    re mi fad sol\f la sol fad mi

    %109
    re mi fad sol la sol fad mi
    re mi fad re re' do si la
    sol la si do re do si la

    %112
    sol la si sol\mbreak sol, do re re,
    sol do re re, sol do re re,
    sol sol' do, re sol fad sol re\p

    %115
    sol, do re re, sol do re re,
    sol do re re, sol sol'\f do, re
    sol,4\fermata r8 r2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp




}

forma = {

    \key sol\major
    \time 4/4
    \tempo 2 = 63
    \partial 8 s8
    s1*117
    \bar"|."


}

IvlI = {
    \Iglobal
    \notypeset
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

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIvlIn =  \relative do'' {

   mi,2~mi8. fad16
   sol2~sol8. la16
   si4 si, red

   %4
   sol2~sol8. la16
   si2~si8. dod16
   re?2.

   %7
   la2~la8. si16\mbreak
   do2~do8. red16
   mi2.~

   %10
   mi4(red) fad~
   fad mi sol
   fad8. mi16 mi4 red

   %13
   mi4 r r%%fine ripresa
   fad r r\mbreak
   sol r r

   %16
   mi r r
   re r r
   mi r r

   %19
   re r r\mbreak
   do r r
   mi r r

   %22
   re r r
   mi r r
   mi r r\mbreak

   %25
   fad r r
   mi r r
   mi r r

   %28
   mi r r
   fad! r r\mbreak
   sol r r

   %31
   la r r
   la r r
   sol r r

   %34
   fad r r\mbreak
   mi,2~mi8. fad16
   sol2~sol8. la16

   %37
   si4 si, red
   sol2~sol8. la16
   si2~si8. dod16

   %40
   re?2.
   la2~la8. si16\mbreak
   do2~do8. red16

   %43
   mi2.~
   mi4(red) fad~
   fad mi sol

   %46
   fad8. mi16 mi4 red
   mi4\fermata r r

}

IIvlIIn = \relative do'' {

   R2.*3
   mi,2~mi8. fad16
   sol2~sol8. la16

   %6
   la2.
   do?2~do8. re16\mbreak
   mi2~mi8. fad16

   %9
   sol2.~
   sol4 (fad) la~
   la sol si

   %12
   la8. sol16 fad2\tr
   sol4 r r %%fine ripresa
   red r r\mbreak

   %15
   mi r r
   do r r
   si r r

   %18
   do r r
   si r r\mbreak
   mi r r

   %21
   do r r
   si r r
   si r r

   %24
   do r r\mbreak
   re r r
   si r r

   %27
   do r r
   do r r
   si r r\mbreak

   %30
   si r r
   dod r r
   red r r

   %33
   si r r
   si r r
   R2.*3

   %38
   mi,2~mi8. fad16
   sol2~sol8. la16
   la2.

   %41
   do2~do8. re16\mbreak
   mi2~mi8. fad16
   sol2.~

   %44
   sol4 (fad) la~
   la sol si
   la8. sol16 fad2\tr

   %47
   sol4\fermata r r

}

IIvlan = \relative do'{

    sol'8.[mi16 re8. do16 si8. la16]
    sol8.[si'16 la8. sol16 fad8. mi16]
    red8. mi16 red4. red8

    %4
    si2~si8. la16
    sol2.
    fad

    %7
    mi'2~mi8. re16\mbreak
    do2.
    si2 si'4

    %10
    do red,2
    si~si8. si'16
    do4 fad, si

    %13
    si r r %%%% fine rip.
    si r r\mbreak
    si r r

    %16
    la r r
    sol r r
    sol r r

    %19
    sol r r\mbreak
    sol r r
    sol r r

    %22
    sol r r
    si r r
    la r r\mbreak

    %25
    la r r
    sold r r
    la r r

    %28
    la r r
    red, r r\mbreak
    mi r r

    %31
    mi r r
    fad r r
    mi r r

    %34
    red r r
    sol8.[mi16 re8. do16 si8. la16]
    sol8.[si'16 la8. sol16 fad8. mi16]

    %37
    red8. mi16 red4. red8
    si2~si8. la16
    sol2.

    %40
    fad
    mi'2~mi8. re16\mbreak
    do2.

    %43
    si2 si'4
    do red,2
    si~si8. si'16

    %46
    do4 fad, si
    si\fermata r r

}

IIvcn = \relative do{

    mi8. [do'16 si8. la16 sol8. fad16]
    mi8.[sol16 fad8. mi16 red8. dod16]
    si8. do'?16 si8. [la16 si8. si,16]

    %4
    mi8.[do'16 si8. la16 sol8. fad16]
    mi8.[si'16 la8. sol16 fad8. mi16]
    re?8.[dod16 re8. mi16] fad8. sold16

    %7
    la8.[fa16 mi8. re16 do?8. si16]\mbreak
    la8.[mi''16 re8. do16 si8. la16]
    sol8.[fad?16 mi8. fad16 sol8. mi16]

    %10
    la,8. la'16 si8.[la16 si8. si,16]
    mi8.[red16 mi8. sol16 fad8. mi16]
    la4 si si,

    %13
    mi16 mi' mi (re do) do do (si  la) sol\staccatissimo fad\staccatissimo mi\staccatissimo%%% fine ripresa
    si\clef tenor fad'' fad(mi red) red red(do! si) la\staccatissimo sol\staccatissimo fad\staccatissimo\mbreak
    sol mi' mi(fad sol) sol sol(fad mi) re?\staccatissimo do\staccatissimo si\staccatissimo

    %16
    do\staccatissimo mi\staccatissimo la,\staccatissimo do\staccatissimo \clef bass mi,\staccatissimo la\staccatissimo  do,\st mi\st la,\st do'\st re,\st do'\st
    si si si(do re) sol, sol(la si) fa\st mi\st re\st
    mi do' do(re mi) re\st do\st si\st la\st sol\st fad\st mi\st

    %19
    re\st fad\st sol\st si,\st do\st sol'\st la\st dod,\st re\st la'\st si\st re,\st \mbreak
    \senza mi8 do'~\tuplet 3/2 { do16 si(la si[la sol)] re'(do si si[la sol)] }
    mi'\p[(re do si la sol fad mi)] re,8 \once\stemDown fad'\f

    %22
    sol,4 r16 si'(do re) re(do si) la
    la4(sold16) re'(mi fa) fa(re do) si
    si4(do32) mi re do si[la sold fad!] mi re do si la16[la']\mbreak

    %25
    re,16 si'8. mi,16 do'8. fa,16 re'8.
    sold,4~\tuplet 3/2 { sold16 (mi sold si[mi si)] sold(fad! mi re' [do si)]
    do(si la) re[(do si)]} si4.\tr la8

    %28
    la16 mi' mi(re do) do do(si la) sol fad mi
    si\clef tenor fad'' fad(mi red) red red(do! si) la sol fad\mbreak
    sol si si16.\tr [(la64 si)] mi16 si si16.\tr[(la64 si)] mi16 si si16.\tr[(la64 si)]

    %31
    dod16 dod dod16.\tr[(si64 dod)] fad16 dod dod16.\tr[(si64 dod)] fad16 dod dod16.\tr[(si64 dod)]
    red16 red(dod si) fad' fad(mi red) la' la(sol fad)
    sol4~sol16 fad\st mi\st re?\st  do?\st si\st la\st sol\st

    %34
    \clef bass fad! mi red dod si mi sol, mi' la, mi' si red
     mi8. [do'16 si8. la16 sol8. fad16]
    mi8.[sol16 fad8. mi16 red8. dod16]

    %37
    si8. do'?16 si8. [la16 si8. si,16]
    mi8.[do'16 si8. la16 sol8. fad16]
    mi8.[si'16 la8. sol16 fad8. mi16]

    %40
    re?8.[dod16 re8. mi16] fad8. sold16
    la8.[fa16 mi8. re16 do?8. si16]\mbreak
    la8.[mi''16 re8. do16 si8. la16]

    %43
    sol8.[fad?16 mi8. fad16 sol8. mi16]
    la,8. la'16 si8.[la16 si8. si,16]
    mi8.[red16 mi8. sol16 fad8. mi16]

    %46
    la4 si si,
    mi4\fermata r r

}

IIbcn = \relative do {

   mi8. [do'16 si8. la16 sol8. fad16]
    mi8.[sol16 fad8. mi16 red8. dod16]
    si8. do'?16 si8. [la16 si8. si,16]

    %4
    mi8.[do'16 si8. la16 sol8. fad16]
    mi8.[si'16 la8. sol16 fad8. mi16]
    re?8.[dod16 re8. mi16] fad8. sold16

    %7
    la8.[fa16 mi8. re16 do?8. si16]\mbreak
    la8.[mi''16 re8. do16 si8. la16]
    sol8.[fad?16 mi8. fad16 sol8. mi16]

    %10
    la,8. la'16 si8.[la16 si8. si,16]
    mi8.[red16 mi8. sol16 fad8. mi16]
    la4 si si,

    %13
    mi4 la la, %%%%%%5 fine ripresa
    si si' red,\mbreak
    mi mi' sol,

    %16
    la do, la8 re
    sol4 si, sol
    do la' re,

    %19
    re8 si do[dod] re re\mbreak
    mi8 mi fad sol si,[sol]
    do4 do, re

    %22
    sol sol' fad
    mi mi, sold'
    la la, do\mbreak

    %25
    si8 re do mi re fa
    mi re mi sold mi sold
    la fa mi[re mi mi,]

    %28
    la4 la' do,
    si si' red,\mbreak
    mi sol mi

    %31
    la la, la'
    si, si' red,
    mi re'? la

    %34
    si, r8 sol la si
    mi8. [do'16 si8. la16 sol8. fad16]
    mi8.[sol16 fad8. mi16 red8. dod16]

    %37
    si8. do'?16 si8. [la16 si8. si,16]
    mi8.[do'16 si8. la16 sol8. fad16]
    mi8.[si'16 la8. sol16 fad8. mi16]

    %40
    re?8.[dod16 re8. mi16] fad8. sold16
    la8.[fa16 mi8. re16 do?8. si16]\mbreak
    la8.[mi''16 re8. do16 si8. la16]

    %43
    sol8.[fad?16 mi8. fad16 sol8. mi16]
    la,8. la'16 si8.[la16 si8. si,16]
    mi8.[red16 mi8. sol16 fad8. mi16]

    %46
    la4 si si,
    mi\fermata r r

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key sol\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 53
  s2.*47
  \bar"|."

}

IIvlI = {
  \IIglobal
  \notypeset
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

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}


IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IIIvlIn =  \relative do'' {

    re8 si sol2
    la8 fad re2
    la''8 fad do2

    %4
    si8 la sol2
    si'8 sol re2
    mi8 dod la2\mbreak

    %7
    la'8 mi dod2
    fad8 mi re2
    fad,16(re fad ) la fad(re fad) la fad(re fad) la

    %10
    re8 fad la fad re la
    fad16(re fad) la fad(re fad) la fad(re fad) la
    re8 fad la fad re la

    %13
    si do16 re fad,8[re' la, dod']
    re4 r8 re re mi\mbreak
    do?(si la) do do re

    %16
    si (la sol) si re sol %%5 inizio rep.
    fad8 la do,2
    si16 do re do si8 sol la re,

    %19
    fad' la do,2
    si16 do re do si8 sol la fad
    sol4 r r %% fine rip.

    %22
    R2.*5
    sol'8 re si2
    sol'8 sol, r4 r

    %29
    R2.*20
    la'8 fad re2
    mi8 dod la2

    %51
    mi'8 dod sol2
    fad8 mi re2\mbreak
    dod'16(la dod) mi dod(la dod) mi dod(la dod) mi

    %54
    fad8 re la fad re re'
    dod16( la dod) mi dod(la dod) mi dod(la dod) mi
    fad sol la sol fad8 re mi la,

    %57
    fad' mi re2
    fad16 sol la sol fad8 re mi dod
    re4 r r\mbreak

    %60
    R2.*6
    fad16 re fad la fad re fad la fad re fad la
    fad4 r r

    %68
    sol,8 la sol fad mi re\mbreak
    dod mi dod mi dod mi
    fad4 fad fad

    %71
    si,8 re si re si re
    mi la mi la mi la
    lad dod lad dod lad dod

    %74
    fad,4 r r\mbreak
    R2.*10
    fad'8 re si2

    %86
    dod8 lad fad2
    mi'8 dod lad2
    re8 dod si2\mbreak

    %89
    la'8 fad re2
    mi8 dod la2
    sol'8 mi dod2

    %92
    fad8 mi re2
    la'8 fad do?2
    si8 sol si re sol si,

    %95
    la re la fad re4\mbreak
    sol8 re do si la sol
    do si si si' do si

    %98
    la sol sol do la sol
    fad sol sol, la' re, sol
    re la' sol fad mi re

    %101
    sol, sol' re si sol4
    re''2.
    mi~\mbreak

    %104
    mi
    fad~
    fad

    %107
    sol~
    sol
    fad\mbreak

    %110
    mi~
    mi~
    mi

    %113
    re~
    re
    mi\mbreak

    %116
    la,8 la fad re la' fad
    sol la sib sol do sol
    fad mi fad re la' re,

    %119
    sol, sol' la, la' sib sol
    re do sib sol fad' re
    sol, sol' la, la' sib la

    %122
    re, do sib sol fad'[re]\mbreak
    sol, sol' la sib la sol
    fad sol la sol fad mi

    %125
    re4 r r
    R2.
    si'?8 (la sol) si re sol %%5 inizio rep.

    %128
    fad8 la do,2
    si16 do re do si8 sol la re,
    fad' la do,2

    %131
    si16 do re do si8 sol la fad
    sol4\fermata r r

}

IIIvlIIn = \relative do'' {

    si8 sol re2
    fad8 re la2
    fad''8 do la2

    %4
    sol8 fad si,2
    sol''8 re si2
    dod8 la mi2\mbreak

    %7
    mi'8 dod la2
    la8 dod la2
    fad16(re fad ) la fad(re fad) la fad(re fad) la

    %10
    la8 re fad re la fad
    fad16(re fad) la fad(re fad) la fad(re fad) la
    la8 re fad re la fad

    %13
    si do16 re fad,8[re' la, dod']
    re4 r8 si si do?\mbreak
    la(sol fad) la la la

    %16
    sol(fad sol) sol si re  %%% inizio rip.
    re fad la,2
    sol16 la si la sol8 sol la re,

    %19
    re' fad la,2
    sol16 la si la sol8 si, do la
    sol4 r r %%% fine rip.

    %22
    R2.*5
    re''8 si sol2
    re'8 re, r4 r

    %29
    R2.*20
    fad'8 re la2
    dod8 la mi2

    %51
    dod'8 la mi2
    re8 dod16 si la2\mbreak
    dod'16(la dod) mi dod(la dod) mi dod(la dod) mi

    %54
    re8 la fad re la la'
    dod16( la dod) mi dod(la dod) mi dod(la dod) mi
    re16 mi fad mi re8 fad sol mi

    %57
    re dod16 si la2
    re16 mi fad mi re8 fad, sol mi
    re4 r r

    %60
    R2.*6
    re'16 la re fad re la re fad re la re fad
    re4 r r

    %68
    mi,8 fad mi re dod si\mbreak
    la dod la dod la dod
    re4 re re

    %71
    sol,8 si sol si sol si
    la dod la dod la dod
    fad lad fad lad fad lad

    %74
    si,4 r r\mbreak
    R2.*10
    re'8 si fad2

    %86
    lad8 fad do2
    dod'?8 lad fad2
    fad8 fad re2\mbreak

    %89
    fad'8 re la2
    dod8 la mi2
    mi'8 dod la2

    %92
    la8 la la2
    fad'8 do? la2
    sol8 re sol si re sol,

    %95
    fad re' la fad re4\mbreak
    sol8 re do si la sol
    do si si si' do si

    %98
    la sol sol do la sol
    fad sol sol, la' re, sol
    re la' sol fad mi re

    %101
    sol, sol' re si sol4
    sol'2.~
    sol\mbreak

    %104
    la~
    la
    si~

    %107
    si
    lad
    si~\mbreak

    %110
    si
    dod~
    dod

    %113
    la
    si
    sol

    %116
    fad8 la fad re la' fad
    sol la sib sol do sol
    fad mi fad re la' re,

    %119
    sol, sol' la, la' sib sol
    re do sib sol fad' re
    sol, sol' la, la' sib la

    %122
    re, do sib sol fad'[re]\mbreak
    sol, sol' la sib la sol
    fad sol la sol fad mi

    %125
    re4 r r
    R2.
    sol8(fad sol) sol si re  %%% inizio rip.

    %128
    re fad la,2
    sol16 la si la sol8 sol la re,
    re' fad la,2

    %131
    sol16 la si la sol8 si do la
    sol4\fermata r r

}

IIIvlan = \relative do'{

    sol'8 re si[si si si]
    re la fad fad fad fad
    re''[la] fad fad fad fad

    %4
    re re re re re re
    re'[si] sol sol si si
    la mi dod[dod dod dod]\mbreak

    %7
    dod? dod dod dod dod dod
    re[mi] fad fad fad fad
    la,4 la la

    %10
    fad'8 la re la fad re
    la4 la la
    fad'8 la re la fad re

    %13
    re si' re,4 mi
    fad r8 si si sol\mbreak
    fad fad fad fad fad fad

    %16
    re re re re re re %%%%%% rip
    la' fad fad fad fad fad
    re re re re mi re

    %19
    la' fad fad fad fad fad
    re re re re mi re
    si4 r r %% fine rip

    %22
    R2.*5
    si'8 sol re2
    si'8 si, r4 r

    %29
    R2.*20
    re'8 la fad fad fad fad
    mi mi dod dod dod dod

    %51
    dod? mi dod! dod dod dod
    la la fad fad fad fad\mbreak
    mi'4 mi la

    %54
    la8 fad re la fad[fad']
    mi4 mi la
    la4. la8 si la

    %57
    la la fad16 sol la sol fad sol la sol
    fad8 la la la, si la
    la4 r r

    %60
    R2.*6
    la'4 la la
    la r r

    %68
    mi8 fad mi re dod si
    la dod la dod la dod
    re4 re re

    %71
    sol,8 si sol si sol si
    la dod la dod la dod
    fad lad fad lad fad lad

    %74
    si,4 r r\mbreak
    R2.*10
    si'8[fad] re re re re

    %86
    dod dod lad lad lad lad
    lad? lad dod[dod dod dod]
    re fad, fad fad fad fad\mbreak

    %89
    re''[la] fad fad fad fad
    mi[mi] dod dod dod dod
    mi sol sol[sol sol sol]

    %92
    fad la fad[fad fad fad]
    re' la fad fad fad fad
    re4 re re

    %95
    re8 re' la fad re4\mbreak
    sol8 re do si la sol
    do si si si' do si

    %98
    la sol sol do la sol
    fad sol sol, la' re, sol
    re la' sol fad mi re

    %101
    sol, sol' re si sol4
    sol'4 sol sol
    do, do do\mbreak

    %104
    la' la la
    re, re re
    si' si si

    %107
    mi, mi mi
    dod dod dod
    re re re\mbreak

    %110
    mi mi mi
    mi mi mi
    mi  mi mi

    %113
    fad fad fad
    sol sol sol
    mi mi mi\mbreak

    %116
    re8 la' fad re la' fad
    sol la sib sol do sol
    fad mi fad re la' re,

    %119
    sol, sol' la, la' sib sol
    re do sib sol fad' re
    sol, sol' la, la' sib la

    %122
    re, do sib sol fad'[re]\mbreak
    sol, sol' la sib la sol
    fad sol la sol fad mi

    %125
    re4 r r
    R2.
    re8 re re re re re %%%%%% rip

    %128
    la' fad fad fad fad fad
    re re re re mi re
    la' fad fad fad fad fad

    %131
    re re re re mi re
    si4\fermata r r

}

IIIvcn = \relative do{

    sol'8 sol, sol'16 la si la sol la si sol
    re8 re, re'16 mi fad mi re mi fad mi
    re8 re, re'16 mi fad mi re mi fad re

    %4
    sol,8 re' sol16 la si la sol la si la
    sol8 sol, sol'16 la si la sol la si sol
    dod,8 la la'16 si dod si la si dod si\mbreak

    %7
    la8 la, la'16 si dod si la si dod si
    re8 la re,16 mi fad mi re mi fad mi
    re4 re re

    %10
    re8 re' re, re' re, re'
    re,4 re re
    re8 re' re, re' re, re'

    %13
    sol,4 la la,
    re8 re' si sol sol, do\mbreak
    re4 re, re'

    %16
    sol sol, sol'  %% inizio rep.
    re'8 re, re16 mi fad mi re mi fad re
    sol8 sol, sol' sol, do re

    %19
    re' re, re16 mi fad mi re mi fad re
    sol8 sol, sol' sol, do re
    sol,4 r16 sol' fad sol sol, sol' fad sol  %% fine ripresa

    %22
    sol,4 r16 sol' fad sol sol, sol' fad sol
    sol,[la si do re mi fad sol] sol,8 sol'
    fad re r16 re' dod re re, re' dod re

    %25
    re,4 r16 re' dod re re, re' dod re
    re,[mi fad sol la si do? re] re,8 re'
    \once\stemDown si \once\stemUp sol, r4 r

    %28
    \clef tenor re''16 re mi re re re mi re re re mi re
    sol fad mi re sol fad mi re sol fad mi re\mbreak
    do do re do do do re do do do re do

    %31
    fad mi re do fad mi re do fad mi re do
    si si do si si si do si si si do si
    mi re dod si mi re dod si mi re dod si

    %34
    dod8 la \clef bass r8 la re, re'
    si re, sol, si' mi, [mi']
    dod mi, la, dod' fad ,\clef tenor fad'

    %37
    re fad,\clef bass mi, \clef tenor re''\mbreak \clef bass \once\stemUp sol,, [\clef tenor sol'']
    la, la4 la si16 dod
    re[(dod) re(dod) re(dod) re(dod) re(dod) re(dod)]

    %40
    re8 la4 la re16 mi
    fad[(mi) fad(mi) fad(mi) fad(mi) fad(mi) fad(mi)]
    fad8 la,4 la mi'16 fad

    %43
    sol[(fad) sol(fad) sol(fad) sol(fad) sol(fad) sol(fad)]
    sol8 fad16 mi fad8\st re\st mi\st dod\st \mbreak
    re[dod16 si dod8 la si sol]

    %46
    \clef bass la[sol16 fad sol8 mi fad re]
    la la' re re, la' la,
    \once\stemUp re, la'' re  re, la' la, %%%%% continua con la parte di basso in fondo a p. 16

    %49
    re re, re'16 mi fad mi re mi fad re
    la'8 la, la'16 si dod si la si dod si
    la8 la, la'16 si dod si la si dod la

    %52
    re,8 la re16 mi fad mi re mi fad re\mbreak
    la4 la la
    re8 re' re, re' re, re'

    %55
    la,4 la la
    re8 re' re, re' sol, la
    re, re' re,16 mi fad mi re mi fad mi

    %58
    re8 la' re re, sol, la
    \clef tenor re'16 re mi re re, re' mi re re, re' mi re
    mi mi fad mi la, mi' fad mi la, mi' fad mi\mbreak

    %61
    fad fad sol fad \once\stemUp re, fad' sol fad \once\stemUp  re, fad' sol fad
    sol sol la sol la, sol' la sol la, sol' la sol
    la la si la \once\stemUp re,, la'' si la \once\stemUp re,, la'' si la

    %64
    si si do si si si do si si si do si
    dod dod re dod dod dod re dod dod dod re dod
    re4 r r

    %67
    re8-.(dod-. si-. la-. sol-. fad-.)
    sol-.(sol-. sol-. sol-. sol-. sol-.)\mbreak
    dod,16 sol' la sol dod, sol' la sol dod, sol' la sol

    %70
    re fad la fad re fad la fad re fad la fad
    si, fad' sol fad si, fad' sol fad si, fad' sol fad
    dod mi sol mi dod mi sol mi dod mi sol mi

    %73
    lad, mi' fad mi lad, mi' fad mi lad, mi' fad mi
    re(mi) fad(mi) fad(mi) fad(mi)re(dod) si(la?)
    sol(mi') sol(fad) sol(fad) sol(fad) mi(re) dod(si)

    %76
    la(fad') la(sol) la(sol) la(sol) fad(mi) re(dod)
    si(sol') si(la) si(la) si(la) sol(fad) mi(re)
    dod(re) mi (re) mi(re) mi(re) dod(si) lad(sold)

    %79
    fad4\clef bass r8 si re, si'
    mi, sol dod, mi lad, fad'
    re si' mi, dod' fad, re'\mbreak

    %82
    mid,4. re'8 dod si
    lad sold fad sol fad mi?
    re[si'] \appoggiatura mi re[dod16 si dod8 lad]

    %85
    si8 si, si'16 dod re dod si dod re si
    fad8 fad, fad'16 sold lad sold fad sold lad sold
    fad8 fad, fad'16 sold lad sold fad sold lad fad

    %88
    si8 fad si16[re dod si la? sol? fad mi]\mbreak
    re8 re, re'16 mi fad mi re mi fad re
    la'8 la, la'16 si dod si la si dod si

    %91
    la8 la, la'16 si dod si la si dod la
    re8 la re,16 mi fad mi re mi fad mi
    re8 re, re'16 mi fad mi re mi fad re

    %94
    sol4 sol, sol
    re'8 re' la fad re4\mbreak
    \clef tenor sol4~sol16 la(si do re mi fad sol)

    %97
    \appoggiatura fad8 mi re4 sol8 \appoggiatura fad mi [re]
    do si4 mi8 \appoggiatura re do [si]
    la sol4 do8 \appoggiatura si la [sol]

    %100
    fad re~re16[mi(fad sol la si do re)]
    si8\clef bass sol  re si sol4
    \clef tenor sol'16 sol si si sol sol si si re re fa, fa

    %103
    mi mi do do mi mi sol sol do do mi mi\mbreak
    la, la dod dod la la dod dod mi mi sol, sol
    fad? fad re re fad fad la la re re fad fad

    %106
    si, si red red si si red red fad fad la, la
    sol sol mi mi sol sol si si mi mi sol sol
    lad, lad sol' sol lad, lad sol' sol fad fad mi mi

    %109
    re re si si re re fad fad re re si si\mbreak
    sold sold mi' mi sold, sold mi' mi fad fad re re
    dod dod la? la dod dod mi mi dod dod la la

    %112
    sol? sol dod dod sol sol dod dod mi mi sol, sol
    fad fad re re fad fad la la re re la la
    si si sol sol si si re re si si sol sol

    %115
    mi mi do do mi mi sol sol do do mi mi\mbreak
    fad,8 re r la' \appoggiatura re do sib16(la)
    sib(do) re8~re[do16(re) mib(re) do(sib)]

    %118
    la sol fad  mi? re8 la' \appoggiatura re do sib?16(la)
    \appoggiatura do8 sib la16(sib) \appoggiatura re8 do sib16(do) \appoggiatura mib8 re do16(re)
    \appoggiatura sol,8 fad mi?16(fad) \appoggiatura la8 sol fad16(sol) \appoggiatura sib8 la sol16(la)

    %121
    \appoggiatura do8 sib la16(sib) \appoggiatura re8 do sib16(do) \appoggiatura mib?8 re do16(re)
    \appoggiatura sol,8 fad mi16(fad) \appoggiatura la8 sol fad16(sol) \appoggiatura sib8 la sol16(la)\mbreak
    sib4 dod2

    %124
    re4~re16 mib do? sib la do la fad
    \once\stemUp re8 sol'\p(fad mib re do)
    sib\clef bass sol do,, sol'' re fad!

    %127
    sol,4 sol sol'  %% inizio rep.
    re'8 re, re16 mi fad mi re mi fad re
    sol8 sol, sol' sol, do re

    %130
    re' re, re16 mi fad mi re mi fad re
    sol8 sol, sol' sol, do re
    sol,4\fermata  r r

}

IIIbcn = \relative do {

    sol'8 sol, sol'16 la si la sol la si sol
    re8 re, re'16 mi fad mi re mi fad mi
    re8 re, re'16 mi fad mi re mi fad re

    %4
    sol,8 re' sol16 la si la sol la si la
    sol8 sol, sol'16 la si la sol la si sol
    dod,8 la la'16 si dod si la si dod si\mbreak

    %7
    la8 la, la'16 si dod si la si dod si
    re8 la re,16 mi fad mi re mi fad mi
    re4 re re

    %10
    re8 re' re, re' re, re'
    re,4 re re
    re8 re' re, re' re, re'

    %13
    sol,4 la la,
    re8 re' si sol sol, do\mbreak
    re4 re, re'

    %16
    sol sol, sol'  %% inizio rep.
    re'8 re, re16 mi fad mi re mi fad re
    sol8 sol, sol' sol, do re

    %19
    re' re, re16 mi fad mi re mi fad re
    sol8 sol, sol' sol, do re
    sol,4 r sol % fine rip.

    %22
    sol r sol\mbreak
    sol r sol
    re' r re

    %25
    re r re
    re r re
    sol8 sol, sol'16 la si la sol la si la

    %28
    sol8 si si si si si
    si si si si si si\mbreak
    si si si si si si

    %31
    la  la la la la la
    la la la la la la
    sol sol sol sol sol sol

    %34
    la4 dod, re
    sol sol, sol
    la la la

    %37
    si mi,\mbreak sol
    la8 la' la sol fad mi
    re4 r r

    %40
    r8 re la sol fad mi
    re4 r r
    r8 la'' sol fad mi re

    %43
    la4 r r
    mi''8 dod re si dod la\mbreak
    si sol la fad sol mi

    %46
    fad re mi dod re re,
    la'4 re la
    re, re' la

    %49
    re8 re, re'16 mi fad mi re mi fad re
    la'8 la, la'16 si dod si la si dod si
    la8 la, la'16 si dod si la si dod la

    %52
    re,8 la re16 mi fad mi re mi fad re\mbreak
    la4 la la
    re8 re' re, re' re, re'

    %55
    la,4 la la
    re8 re' re, re' sol, la
    re, re' re,16 mi fad mi re mi fad mi

    %58
    re8 la' re re, sol, la
    re,4 re' re
    la' la, la\mbreak

    %61
    re' re, re
    mi la la
    re re, re

    %64
    sol sol, sol
    la' la, la
    re re re

    %67
    re r r
    R2.*6
    si4 r r\mbreak

    %75
    mi r r
    fad r r
    sol r r

    %78
    mi r r
    fad re si
    mi dod lad

    %81
    si dod re\mbreak
    dod? si mid
    fad lad,2

    %84
    si4 r8 re mi fad
    si8 si, si'16 dod re dod si dod re si
    fad8 fad, fad'16 sold lad sold fad sold lad sold
    fad8 fad, fad'16 sold lad sold fad sold lad fad

    %88
    si8 fad si16[re dod si la? sol? fad mi]\mbreak
    re8 re, re'16 mi fad mi re mi fad re
    la'8 la, la'16 si dod si la si dod si

    %91
    la8 la, la'16 si dod si la si dod la
    re8 la re,16 mi fad mi re mi fad mi
    re8 re, re'16 mi fad mi re mi fad re

    %94
    sol4 sol, sol
    re'8 re' la fad re4\mbreak
    R2.*6

    %102
    si4 si si
    do? do do\mbreak
    dod dod dod

    %105
    re re re
    red red red
    mi mi mi

    %108
    fad fad fad
    si, si si\mbreak
    mi mi mi

    %111
    la, la la
    la la la
    re re re

    %114
    sol, sol sol
    do do do\mbreak
    re r r

    %117
    R2.*8
    re2.
    sol,4 do, re

    %127
    sol sol sol'
    re'8 re, re16 mi fad mi re mi fad re
    sol8 sol, sol' sol, do re

    %130
    re' re, re16 mi fad mi re mi fad re
    sol8 sol, sol' sol, do re
    sol,4\fermata r r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp




}

forma = {

    \key sol\major
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 55
    s2.*132
    \bar"|."


}

IIIvlI = {
    \IIIglobal
    %\notypeset
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

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] All[egr]o molto"

\score {
  {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino  I]"}
            \IvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
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
          \set Staff.instrumentName = \markup \center-column{"Violon[cel]lo"}
          \Ivc
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"contrabass"
          \set Staff.instrumentName = \markup \center-column{"[Basso]"}
          \Ibc

        >>
      >>
  }

  \layout {

    indent = 1.8\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[2.] Largo"

\score {
  {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

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
          \IIvc
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"contrabass"
          \IIbc

        >>
      >>
  }

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
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

\pageBreak\markup\huge "[3.] All[egr]o"

\score {
  {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      }<<

        \new PianoStaff <<

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
          \IIIvc
        >>

        \new Staff  <<
          \set Staff.midiInstrument = #"contrabass"
          \IIIbc

        >>
      >>
  }

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
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



