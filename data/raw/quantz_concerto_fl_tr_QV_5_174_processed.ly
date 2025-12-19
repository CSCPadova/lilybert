\language "italiano"


acc = \once \override Stem #'stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "coll'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript #'padding = #3

padall = \override TextScript #'padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f 

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber #'transparent = ##t

con = \override TupletNumber #'transparent = ##f

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
\version "2.20.0"


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 4 \con
}

Ifln = \relative do'' {

    R1*23
    sol4\solo sol8 sol si4 re
    sol~sol8.(la32 si) sol4 re

    %26
    \appoggiatura fad8 mi re16 do sol'2 mi4
    mi\tr re2 sol4\p
    fad8\tr(mi16 re) la'8\tr(sol16 fad) do'4 do

    %29
    \appoggiatura do8 \<si4. do8 re4\! sol,\f\mbreak
    fad8\tr(mi16 re) fad8\tr(mi16 re) la'4 do,
    si r r8 si16 \p[(do re8) re-.]

    %32
    re4 sol \appoggiatura re4 do2\tr
    si4 r r8 si16 \p[(do re8) re-.]
    re (mi16 fad) sol8.\tr (fad32 sol) la4 do,\<\mbreak

    %35
    si16\! (sol\f la si do re mi fad sol8) si16-. la-. sol-. \>fad-. mi-. re-.\!
    dod\p (la) mi' (dod) la'4 la,16 (si dod re mi dod si la)
    re (la) fad' (re) la'4 re,16 (mi fad sol la fad mi re)\mbreak

    %38
    mi \< (dod) sol' (mi) si'4 mi,16 (fad sol la si sol fad mi)
    fad (re) la' (fad\! ) re'4\f~re8 dod16-. si-. la-. sol-. fad-. mi-.
    re (si) fad' (re) si'4~si8 la16-. sol-. fad-. mi-. re-. dod-.

    %41
    si (sol) re' (si) sol'4~sol8 fad16 mi fad8 sold
    sold(la) r sol\p sol(fad) r sold
    sold?(la) r la\f~la si16 la si8 dod

    %44
    dod?(re) r la\p\mbreak la(si) r dod\<
    re16\!\f -. dod-. si-. la-. sol-. fad-. mi-. re-. si'-. la-. sol-. fad-. mi-. re-. dod-. si-.
    la (si dod re) mi4 dod16 \>(re mi fad\!) sol4

    %47
    fad16\p-. la (sol) si-. la-. sol-. fad-. mi-. re-. fad (mi) sol-. fad-. mi-. re-. dod-.\mbreak
    si-.\< re (dod) mi-. re-. dod-. si-. la-. sol-.\! si\mf (la) dod-. si-. la-. sol-. fad-.
    mi8 mi'16\f (fad sol8) sol fad8.\tr (mi32 fad) sol8 sol

    %50
    fad8.\tr mi32 fad sol4\tr la\tr  si8 re,
    la2 mi'\tr\>
    fad8.\!\p (mi32 fad) sol4\tr la\tr \tuplet 3/2 {
        si8\<  la sol

        %53
        \senza fad mi re dod[si la\!]
    } mi'2\f\tr
    re4\staccatissimo  r r2
    R1*10

    %65
    re4\solo re8 re fad4 la
    re re,4. fad16 (sol la sol fad mi)
    re  (mi fad sol la) sol-. fad-. mi-. re-. dod-. si-. la-. sol-. fad-. mi-. re-.

    %68
    do''!2~do8. [si16 la8.\tr sol16]
    fad8\tr(mi16 re) fad8\tr(mi16 re) la'4 do,\mbreak
    si r r8 si16 [(do re8) re-.]

    %71
    re4 sol \appoggiatura re4 do2\tr
    si4 r r8 si16 \p(do re8) re-.
    re (mi16 fad) sol8.\tr (fad32 sol) la4\< do,

    %74
    si8\!\tr\f(la16 sol) si8\tr(la16 sol) re'4~re8.(mi32 fa)\mbreak
    mi16-. do (mi sol) mi-. do(mi sol) la,-. si-. dod-. re-. mi-. fad!-. sol-. la-.
    fad-. re (fad la) fad-. re (fad la) si,-. dod-. red-. mi-. fad-. sol-. la-. si-.

    %77
    sol4 r r8 sol16 [(la si8) si-.]
    si4 mi \appoggiatura si4 la2\mbreak
    sol16-. mi (sol si) sol-. mi (sol si) do (la) mi-. la-. do-. si-. la-. sol-.

    %80
    fad-. re (fad la) fad-. re (fad la) si (sol) re-. sol-. si-. la-. sol-. fad-.
    mi-. do (mi sol) mi-. do (mi sol) la (fad)\< do-. fad-. la-. sol-. fad-. mi-.
    red\! (si\f red fad si fad mi red)\mbreak mi (si mi sol si sol fad mi)

    %83
    red -. si\p (red fad si fad mi red) mi (si mi sol si sol fad mi)
    red-. si (red) fad-. mi-. si (mi) sol-. fad-. red (fad) la-. sol-. mi (sol) si-.
    la16(si do4) si16 la sol(fad mi8) fad4\tr

    %86
    mi16 sol fad mi red do si la sol8 mi' \set Staff.ottavation = #"8va alta"  fad,4\tr
    mi4\unset Staff.ottavation r r2
    R1*5

    %93
    r2 r8 sol'16\solo (la si8) si-.\p
    si-. si4 \< si8 si-. si4 si8\!
    do-. do4\> si16 (la) si8-. si4 la16 (sol)\!

    %96
    la8-. la4 sol16(fad)\mbreak sol8 mi,16\f( red mi fad sol la)
    si (dod red mi fad la sol fad) \once\stemDown sol8 mi,16 (red mi fad sol la
    si dod red mi fad la sol fad) sol-. si (sol mi) sol-. si (sol mi)

    %99
    la-. sol-. fad-. mi-. re!-. do!-. si-. la-.\mbreak si-. sol (si) re-. sol-. re (sol) si-.
    la-. sol-. fad-. mi-. re-. do-. si-. la-. si8 si'16\p(do re8) re-.
    re-. re4\< re8 re-. re4 re8\!

    %102
    mi-. mi4\> re16 (do) re8-. re4 do16 (si)\!
    do8-. do4 si16 (la)\mbreak \stemDown si8 \stemUp sol,16\f( fad sol la si do)\stemNeutral
    re (mi fad sol la do si la) \once\stemDown si8 sol,16 (fad sol la si do

    %105
    re mi fad sol la do si la) si-. sol-. re-. si-. \once\stemUp  sol_> si' (la sol)
    la-. fad-. re-. la-. \once\stemUp fad_> la' (sol fad)\mbreak sol-. mi-. dod-. sol-. \once\stemUp mi_> sol' (fad mi)
    fad-. re-. la-. fad-. re4 r8 mi'16\p[(re mi8) fad]

    %108
    fad(sol) sol\<[(sold)] sold(la) la (do,)\!
    si4 r r2
    R1*5

    %115
    r4 r8 la'16\solo (si) \appoggiatura re8 do (si16 la) si8 do
    si(la) r fad16 (sol) la8 \set Staff.ottavation = #"8va alta" do, si sol'
    si,4\tr_\fermata  la\unset Staff.ottavation r2

    %118
    sol4 sol8 sol si4 re
    sol~sol8.(la32 si) sol4 re\mbreak
    \appoggiatura fad8 mi (re16 do) sol'2 mi4

    %121
    mi\tr re2 sol4
    fad8\tr(mi16 re) fad8\tr(mi16 re) la'4 do,
    si8\tr(la16 sol) si8\tr(la16 sol) re'4 sol

    %124
    fad8\tr(mi16 re) fad8\tr(mi16 re) la'4~la8.(si32 do)\mbreak
    si16 (re) do-. mi-. re-. do-. si-. la-. sol (si) la-. do-. si-. la-. sol-. fad-.
    mi (sol) fad-. la-. sol-. fad-. mi-. re-. do (mi) re-. fad-. mi-. re-. do-. si-.

    %127
    la8 la'16 (si) do8\< do si8.\tr (la32 si) do8 do\!
    si8.\tr \> (la32 si) do4\tr \mbreak re\tr mi8 (sol,)\!
    re2 la'\tr

    %130
    sol4 r r2
    r2 r4 r8 sol\solo
    fad16 (re) la-. fad-. re-. fad-. la-. re-.\mbreak fad (re) fad-. la-. fad (re) fad-. la-.

    %133
    sol (re) si-. sol-. re-. sol-. si-. re-. sol (re) sol-. si-. sol (re) sol-. si-.
    la (fad) re-. la-. fad-. la-. re-. fad-. la( fad) la-. do-. la (fad) la-. do-.
    si \set Staff.ottavation = #"8va alta" re,-. mi-. fad-. sol4~sol8 fad16-. mi-. re-. do-. si-. la-.\mbreak

    %136
    sol (mi) si' (sol) mi'4~ mi8 re16-. do-. si-. la-. sol-. fad-.
    mi-. sol-. la-. si-. do4~do8 si16-. la-. si8 dod
    dod?(re) r do\p do(si) r dod

    %139
    dod?(re) r re\f~re mi16 re mi8 fad\mbreak
    fad(sol) r re\p re(mi) r fad\f
    sol16-. fad-. mi-. re-. do-. si-. la-.  sol-. \unset Staff.ottavation mi''-. re-. do-. si-. la-. sol-. fad-. mi-.

    %142
    re-. mi-. fad-. sol-. la-. do-. si-. la-. si (re do) si-. la-. sol-. fad-. mi-.
    fad (sol la) sol-. fad-. mi-. re-. do-. si (re do) si-. la-. sol-. fad-. mi-.
    re (mi fad sol la si do si) do (fad la) sol-. fad-. mi-. re-. do-.

    %145
    si2 r4 \set Staff.ottavation = #"8va alta" si
    si2(la\tr)
    sol4\unset Staff.ottavation r r2

    %148
    R1*9

}

IvlIn = \relative do'' {

    sol8_\staccatissimo^\f sol16 sol si si re re sol sol si si sol sol re re
    \appoggiatura fad8 mi re16-. do-. sol'4\staccatissimo \appoggiatura fad8 mi re16-. do-. sol'4\staccatissimo
    re8\staccatissimo sol,16 sol si si re re sol sol si si sol sol re re

    %4
    do8\tr (si16 la) la'4\staccatissimo\mbreak do,8\tr (si16 la) la'4\staccatissimo\mbreak
    si,8_\staccatissimo sol16 sol si si re re sol, sol si si re re sol sol
    <<{mi4~\stemDown mi8. (fad32 sol)}\\\stemUp\shiftOn do,8\\\stemUp\shiftOnn sol8\\\stemUp\shiftOnnn do,8>> do'8 si la sol

    %7
    fad16 (mi re8) r la'16 (si) \appoggiatura re8 do (si16 la) si8 do
    si(la) r fad'16\p (sol) la8 do, si sol'
    si,4(la) r2

    %10
    re,8_\staccatissimo^\f re16 re fad fad la la re8 re, re' re\mbreak
    dod8\tr(si16 la) sol8\tr(fad16 mi) fad8\tr(mi16 re) re'8-.\p (re-.)
    dod8\tr(si16 la) sol8\tr(fad16 mi) fad8\tr(mi16 re) la'8\tr(sol16 fad)

    %13
    do'!8\tr\f(si16 la) fad'8\tr(mi16 re) la' sol fad mi re do si la
    sol,8\staccatissimo sol16 sol si si re re sol8 sol, sol' sol
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) sol''8-.\p (sol-.)\mbreak

    %16
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) fa'8\f-. (fa-.)
    mi16 re do si la si' la sol fad! mi re do si do' si la
    sol fad mi re do re' do si la sol fad mi re do si la

    %19
    si (do) re-. re-. re4\tr si16\p (do) re-. re-. re4\tr
    re16\f sol fad la sol re mi do\mbreak si (re) si sol la4\tr
    si16\p (do) re re re, (fad) la do si (do) re re re, (fad) la do

    %22
    re\f si' la sol fad mi re do si (la sol8) la4\tr
    sol8 si, do re sol,4 r
    r8 si'\p si si si si si si

    %25
    si si si si si si si si
    do do do do\mbreak do do do do
    do do si si si si si si

    %28
    la la fad' fad sol mi la fad
    re re re do si si si si
    la la la la la la la la

    %31
    sol,_\staccatissimo^\f sol16 sol si si re re sol4_\staccatissimo r
    r8 si16\p (do) re8 si la fad sol la
    sol,_\staccatissimo^\f sol16 sol si si re re sol4_\staccatissimo r

    %34
    r8 si16\p (do) re8 si la fad sol la
    si4 r mi r
    r8 mi mi mi mi mi mi mi

    %37
    fad fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol
    r fad fad fad mi mi mi mi

    %40
    r re re re dod dod dod dod
    r si si si\mbreak la la r4
    R1*4

    %46
    r8 mi'\p mi mi mi mi mi mi
    fad r mi la re, r dod r
    si r la re sol, r fad r

    %49
    mi4 r r2
    R1*4
    re8_\staccatissimo\f re16 re fad fad la la re re fad fad re re la la

    %55
    \appoggiatura do8 si la16-. sol-. re'4\staccatissimo\mbreak  \appoggiatura do8 si la16-. sol-. re'4\staccatissimo
    la8_\staccatissimo re,16 re fad fad la la re re fad fad re re la la
    sol8\tr(fad16 mi) mi'4\staccatissimo  sol,8\tr(fad16 mi) mi'4\staccatissimo

    %58
    fad,8_\staccatissimo re16 re fad fad la la re, re fad fad la la re re
    <<{si4~\slurDown si8.(dod32 re)}\\\stemUp\shiftOn re,8\\\stemUp\shiftOnn sol,>> sol' fad mi re
    dod16(si la8) r mi'16 (fad)  \appoggiatura la8 sol (fad16 mi) fad8 sol

    %61
    fad(mi) r dod'16\p (re) mi8 sol, fad re'
    mi, mi'16\f (fad) sol8 sol fad8.\tr (mi32 fad) sol8 sol
    fad8.\tr (mi32 fad) sol4\tr la\tr si8 re,

    %64
    la,2 mi'\tr
    re8 la'\p la la la la la la
    la la la la la la la la\mbreak

    %67
    la la la la la la la la
    la la la la la la la la
    la la la la la la la la

    %70
    sol,8_\staccatissimo^\f sol16 sol si si re re sol4_\staccatissimo r
    r8 si16\p[(do) re8 si] la fad sol la
    sol,8_\staccatissimo^\f sol16 sol si si re re sol4_\staccatissimo r

    %73
    r8 si16\p[(do) re8 si] la fad sol la\mbreak
    si4 r r8 sol sol sol
    sol sol sol sol r la la la

    %76
    la la la la r si si si
    mi,8\staccatissimo^\f mi16 mi sol sol si si mi4\staccatissimo r
    r8 sol,16\p[(la) si8 sol] fad red mi fad

    %79
    mi si' mi sol r mi la do
    r4 la r8 si sol si
    mi,4 sol\mbreak r fad

    %82
    red r mi r8 sol
    fad si r fad sol si r4
    R1*3

    %87
    mi,,8\f_\staccatissimo mi16 mi sol sol si si mi8 mi, mi' mi
    red\tr(dod16 si) la8\tr(sol16 fad) sol8\tr(fad16 mi) mi'8\p-. (mi-.)
    red\tr(dod16 si) la8\tr(sol16 fad) sol8\tr(fad16 mi) si''\f re, do si\mbreak

    %90
    do mi re do la' do, si la si re do si sol' si, la sol
    la do si la fad' la, sol fad sol (la) si si si4\tr
    sol16\p (la) si si si4\tr si16\f mi red fad mi si do la

    %93
    sol (si) sol mi fad4\tr mi r8 sol'\p
    fad8\tr sol r sol fad\tr sol r sol\mbreak
    sol sol fad fad fad fad mi mi

    %96
    mi mi red red mi sol sol sol
    fad fad fad fad sol sol sol sol
    fad fad fad fad sol4 r

    %99
    R1
    r2 r4 r8 si,\p
    la_\tr si r si la_\tr si r si

    %102
    sol sol la la la la sol sol
    sol sol fad fad\mbreak sol8 si' si si % inizio p 2
    la la la la si si si si

    %105
    la la la la si4 r
    R1*3
    sol,8_\staccatissimo\f sol16 sol si si re re sol sol si si sol sol re re

    %110
    \appoggiatura fad8 mi re16-. do-. sol'4\staccatissimo \appoggiatura fad8 mi re16-. do-. sol'4\staccatissimo
    re8\staccatissimo sol,16 sol si si re re sol sol si si sol sol re re
    do8\tr (si16 la) la'4\staccatissimo\mbreak do,8\tr (si16 la) la'4\staccatissimo\mbreak

    %113
    si,8_\staccatissimo sol16 sol si si re re sol, sol si si re re sol sol
    <<{mi4~\stemDown mi8. (fad32 sol)}\\\stemUp\shiftOn do,8\\\stemUp\shiftOnn sol8\\\stemUp\shiftOnnn do,8>> do'8 si la sol
    fad16 (mi re8) r fad16\p (sol) \appoggiatura si8 la (sol16 fad) sol8 la

    %116
    sol(fad) r la16 (si) do8 la sol si
    sol4_\fermata fad r2\mbreak
    r8 si\p si si si si si si

    %119
    si si si si si si si si
    do do do do do do do do
    do do si si si si si si

    %122
    la la la la la la la la
    si4 r r2
    R1

    %125
    si'8\p r la re sol, r fad r
    mi r re sol\mbreak do, r si r
    la4 r r2

    %128
    R1*2
    sol,8_\staccatissimo^\f sol'16 sol mi mi re re dod dod dod dod dod dod dod dod
    re8_\staccatissimo si'16\p si sol sol mi mi dod dod dod dod dod dod dod dod

    %132
    re4\p\staccatissimo fad'\staccatissimo r fad\tr
    re,4\staccatissimo sol'\staccatissimo r sol\tr
    fad,_\staccatissimo la'\staccatissimo r la\tr

    %135
    si8 si, si si\mbreak la la la la
    r sol sol sol fad fad fad fad
    r mi mi mi re re r4

    %138
    R1*4
    fad'8\p la r do si\staccatissimo re r sol,
    fad(la) r fad sol(si) r si,

    %144
    do2. r4
    r16 sol, ^\f la si do re  mi fad sol fad mi re do si la sol\mbreak
    re'4 r\fermata r2

    %147
    sol,8\staccatissimo^\f sol16 sol si si re re sol8 sol, sol' sol
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) sol''8\p-. (sol-.)\mbreak
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) fa'8\f-. (fa-.)

    %150
    mi16 re do si la si' la sol fad! mi re do si do' si la
    sol fad mi re do re' do si la sol fad mi re do si la
    si (do) re re re4\tr si16\p (do) re re re4\tr

    %153
    re16\f sol fad la sol re mi do\mbreak si (re) si sol la4\tr
    si16\p (do) re re re, fad la do si (do) re re re, fad la do
    re \f si' la sol fad mi re do si (la sol8) la4\tr

    %156
    sol8 si, do re sol,4\fermata r

}

IvlIIn = \relative do'' {

    sol8_\staccatissimo^\f sol16 sol si si re re sol sol si si sol sol re re
    \appoggiatura fad8 mi re16-. do-. sol'4\staccatissimo \appoggiatura fad8 mi re16-. do-. sol'4\staccatissimo
    re8\staccatissimo sol,16 sol si si re re sol sol si si sol sol re re

    %4
    do8\tr (si16 la) la'4\staccatissimo\mbreak do,8\tr (si16 la) la'4\staccatissimo\mbreak
    si,8_\staccatissimo sol16 sol si si re re sol, sol si si re re sol sol
    <<{mi4~\stemDown mi8. (fad32 sol)}\\\stemUp\shiftOn do,8\\\stemUp\shiftOnn sol8\\\stemUp\shiftOnnn do,8>> do'8 si la sol

    %7
    fad16 (mi re8) r8 fad16(sol) \appoggiatura si8 la(sol16 fad) sol8 la
    sol(fad) r8 la16\p(si) do8 la sol si
    sol4(fad) r2

    %10
    re8_\staccatissimo^\f re16 re fad fad la la re8 re, re' re\mbreak
    dod8\tr(si16 la) sol8\tr(fad16 mi) fad8\tr(mi16 re) re'8-.\p (re-.)
    dod8\tr(si16 la) sol8\tr(fad16 mi) fad8\tr(mi16 re) fad8\tr(mi16 re)

    %13
    la'8\tr\f(sol16 fad) la8\tr(sol16 fad) do' si la sol fad la sol fad
    sol,8\staccatissimo sol16 sol si si re re sol8 sol, sol' sol
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) sol''8-.\p (sol-.)\mbreak

    %16
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) fa'8\f-. (fa-.)
    mi16 re do si la si' la sol fad! mi re do si do' si la
    sol fad mi re do re' do si la sol fad mi re do si la

    %19
    si (do) re-. re-. re4\tr si16\p (do) re-. re-. re4\tr
    re16\f sol fad la sol re mi do\mbreak si (re) si sol la4\tr
    si16\p (do) re re re, (fad) la do si (do) re re re, (fad) la do

    %22
    si\f sol' fad mi re do si la si (la sol8) la4\tr
    sol8 si, do re sol,4 r
    r8 sol'\p sol sol sol sol sol sol

    %25
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol,16 la si8 do

    %28
    re re re re mi la fad re
    sol sol sol sol sol sol,16 la si8 do
    re re re re fad fad fad fad

    %31
    sol,_\staccatissimo^\f sol16 sol si si re re sol4_\staccatissimo r
    r8 sol16\p(la) si8 sol fad re mi fad
    sol,_\staccatissimo^\f sol16 sol si si re re sol4_\staccatissimo r

    %34
    r8 sol16\p(la) si8 sol fad re mi fad
    sol4 r si r
    r8 dod dod dod dod dod dod dod

    %37
    r re re re re re re re\mbreak
    r mi mi mi mi mi  mi mi
    re re re re la la dod dod

    %40
    si si si si fad fad la la
    sol sol sol sol re re r4
    R1*4

    %46
    r8 dod'\p dod dod dod dod dod dod
    re re dod dod si si la la\mbreak
    sol sol fad fad mi mi re re

    %49
    dod4 r r2
    R1*4
    re8_\staccatissimo\f re16 re fad fad la la re re fad fad re re la la

    %55
    \appoggiatura do8 si la16-. sol-. re'4\staccatissimo\mbreak  \appoggiatura do8 si la16-. sol-. re'4\staccatissimo
    la8_\staccatissimo re,16 re fad fad la la re re fad fad re re la la
    sol8\tr(fad16 mi) mi'4\staccatissimo  sol,8\tr(fad16 mi) mi'4\staccatissimo

    %58
    fad,8_\staccatissimo re16 re fad fad la la re, re fad fad la la re re
    <<{si4~\slurDown si8.(dod32 re)}\\\stemUp\shiftOn re,8\\\stemUp\shiftOnn sol,>> sol' fad mi re
    dod16(si la8) r dod16(re) \appoggiatura fad8 mi(re16 dod) re8 mi\mbreak

    %61
    re(dod) r mi16\p(fad) sol8 mi re fad
    \once\stemUp dod mi'16\f(fad) sol8 sol fad8.\tr (mi32 fad) sol8 sol
    fad8.\tr (mi32 fad) sol4\tr la\tr si8 re,

    %64
    la,2 mi'\tr
    re8 fad\p fad fad fad fad fad fad
    fad fad fad fad fad fad fad fad\mbreak

    %67
    fad fad fad fad fad fad fad fad
    fad fad fad fad fad fad fad fad
    fad fad fad fad fad fad fad fad

    %70
    sol,8_\staccatissimo^\f sol16 sol si si re re sol4_\staccatissimo r
    r8 sol16\p[(la) si8 sol] fad re mi fad
    sol,8_\staccatissimo^\f sol16 sol si si re re sol4_\staccatissimo r

    %73
    r8 sol16\p[(la) si8 sol] fad re mi fad
    sol4 r r8 si, si si
    do do do do dod dod dod dod

    %76
    re re re re red red red red\mbreak
    mi8^\f\staccatissimo^\f mi16 mi sol sol si si mi4\staccatissimo r
    r8 mi,16\p([fad) sol8 mi] red si dod red

    %79
    r mi si' mi r do mi la
    fad re r re re sol re si
    do4 mi r la,\mbreak

    %82
    fad r sol r8 mi'
    red si r red mi sol r4
    R1*3

    %87
    mi,8\f_\staccatissimo mi16 mi sol sol si si mi8 mi, mi' mi
    red\tr(dod16 si) la8\tr(sol16 fad) sol8\tr(fad16 mi) mi'8\p-. (mi-.)
    red\tr(dod16 si) la8\tr(sol16 fad) sol8\tr(fad16 mi) si''\f re, do si\mbreak

    %90
    do mi re do la' do, si la si re do si sol' si, la sol
    la do si la fad' la, sol fad sol (la) si si si4\tr
    sol16\p (la) si si si4\tr si16\f mi red fad mi si do la

    %93
    sol (si) sol mi fad4\tr mi r8 mi'\p
    red\tr mi si mi red\tr mi si mi\mbreak
    la, la re! re sol, sol do do

    %96
    fad, fad si si mi, mi' mi mi
    red red red red mi mi mi mi
    red red red red mi4 r

    %99
    R1
    r2 r4 r8 sol,\p
    fad\tr sol re sol fad\tr sol re sol

    %102
    do, do do do si si mi mi
    la, la re re \once\stemUp sol,  sol'' sol sol\mbreak
    fad fad fad fad sol sol sol sol

    %105
    fad fad fad fad sol4 r
    R1*3
    sol,8_\staccatissimo\f sol16 sol si si re re sol sol si si sol sol re re

    %110
    \appoggiatura fad8 mi re16-. do-. sol'4\staccatissimo \appoggiatura fad8 mi re16-. do-. sol'4\staccatissimo
    re8\staccatissimo sol,16 sol si si re re sol sol si si sol sol re re
    do8\tr (si16 la) la'4\staccatissimo\mbreak do,8\tr (si16 la) la'4\staccatissimo\mbreak

    %113
    si,8_\staccatissimo sol16 sol si si re re sol, sol si si re re sol sol
    <<{mi4~\stemDown mi8. (fad32 sol)}\\\stemUp\shiftOn do,8\\\stemUp\shiftOnn sol8\\\stemUp\shiftOnnn do,8>> do'8 si la sol
    fad16 (mi re8) r fad16\p (sol) \appoggiatura si8 la (sol16 fad) sol8 la

    %116
    sol(fad) r re re re sol sol,
    re'4\fermata re r2
    r8 sol\p sol sol sol sol sol sol

    %119
    sol sol sol sol\mbreak sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol,16 la si8 do

    %122
    re re re re fad fad fad fad
    sol4 sol, r2
    R1

    %125
    r8 sol''\p fad fad mi mi re re
    do do si si la la sol sol
    fad4 r r2

    %128
    R1*2
    sol,8_\staccatissimo^\f sol'16 sol mi mi re re dod dod dod dod dod dod dod dod
    re8_\staccatissimo si'16\p si sol sol mi mi dod dod dod dod dod dod dod dod

    %132
    re4\p_\staccatissimo la'_\staccatissimo r la\tr
    si,_\staccatissimo si'\staccatissimo r si\tr
    re,_\staccatissimo fad'\staccatissimo r fad\tr

    %135
    sol8 sol, sol sol re re fad fad
    mi mi mi mi si si re re
    do do do do sol sol r4

    %138
    R1*4
    la'8\p fad' r la\mbreak sol si r si,
    la(do) r la si(re) r sol,

    %144
    la2. r4
    r16 sol, ^\f la si do re  mi fad sol fad mi re do si la sol\mbreak
    re'4 r\fermata r2

    %147
    sol,8\staccatissimo^\f sol16 sol si si re re sol8 sol, sol' sol
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) sol''8\p-. (sol-.)\mbreak
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) fa'8\f-. (fa-.)

    %150
    mi16 re do si la si' la sol fad! mi re do si do' si la
    sol fad mi re do re' do si la sol fad mi re do si la
    si (do) re re re4\tr si16\p (do) re re re4\tr

    %153
    re16\f sol fad la sol re mi do\mbreak si (re) si sol la4\tr
    si16\p (do) re re re, fad la do si (do) re re re, fad la do
    si \f sol' fad mi re do si la si (la sol8) la4\tr

    %156
    sol8 si, do re sol,4\fermata r

}

Ivlan = \relative do' {

    si8\f\staccatissimo si si si si si si si
    do do do do do do do do
    si\staccatissimo si si si si si si' si
    la la la la la la la la
    re,\staccatissimo re re re\mbreak re sol sol sol
    sol2 mi8 re do si
    la re re re re re re re
    re re re re\p re re re re
    re4 re, r2
    re'8\staccatissimo \f re16 re fad fad la la re8 re, re' re
    dod8\tr(si16 la) sol8\tr(fad16 mi)\mbreak fad8\tr(mi16 re) la'\p sol la si
    mi,8 mi re mi la, re re re
    re^\f re re re re re re re
    sol,\staccatissimo sol16 sol si si re re sol8 sol, sol' sol
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) re'\p do re mi\mbreak
    la,8 la' sol la re, re\f do re
    sol, mi' mi mi la, fad' fad fad
    si, sol' sol sol re la' la la
    sol si la fad sol\p si la fad
    si,\f do re sol sol sol fad fad\mbreak
    sol\p si la fad sol si la fad
    re\f do re sol sol sol fad4\tr
    sol8 si, do re sol,4 r
    R1*3
    r2 r8 sol16\p[la si8 do]
    re re re re mi la fad re\mbreak
    sol sol sol sol sol sol,16 la si8 do
    re re re re fad fad fad fad
    sol,_\staccatissimo^\f sol16 sol si si re re sol4\staccatissimo r
    R1
    sol,8\staccatissimo^\f sol16 sol si si re re sol4\staccatissimo r
    R1*5
    re'8\p re, r fad16 sol la8 la la la
    si si, r re16 mi fad8 fad fad fad
    sol sol, r si16 dod re8 re r4
    R1*12
    fad8\f fad fad fad fad fad fad fad\mbreak
    sol sol sol sol sol sol sol sol
    fad fad fad fad fad fad fad fad
    mi mi mi mi mi mi mi mi
    la, la la la la re re re
    re2 si8 la sol fad
    mi la la la la la la la
    la la la la\p\mbreak la la la la
    \once\stemUp la dod'\f re mi la, dod re mi

    %63
    la, re, re re re re re re
    r re re re dod dod dod dod
    re4 r r2
    R1*4
    sol,8\f \staccatissimo sol16 sol si si re re\mbreak sol4\staccatissimo r
    R1
    sol,8\f \staccatissimo sol16 sol si si re re\mbreak sol4\staccatissimo r
    R1*4
    mi8\f\staccatissimo mi16 mi sol sol si si mi4\staccatissimo r
    R1*9
    mi,8\f\staccatissimo mi16 mi sol sol si si mi8 mi, mi' mi
    red\tr(dod16 si) la8\tr(sol16 fad) sol8\tr(fad16 mi) si'\p la si do
    fad,8 fad mi fad si, si mi\f mi
    mi mi re re re re do do
    do do si si si sol' fad red
    mi\p sol fad red sol\f la si mi,
    mi mi red red mi4 r
    R1*6
    r2 r4 r8 sol\p
    fad\tr sol re sol fad\tr sol re sol
    do, do do do\mbreak si si mi mi
    la, la re re sol,4 r
    R1*5
    si8\f\staccatissimo si si si si si si si
    do do do do do do do do
    si\staccatissimo si si si\mbreak si si si' si
    la la la la la la la la
    re,\staccatissimo re re re re sol sol sol
    sol2 mi8 re do si
    la re\p re re re re re re\mbreak
    re re re re re re sol sol,
    re'4\fermata re, r2
    R1*3
    r2 r8 sol16\p[la si8 do]
    re re re re fad fad fad fad
    sol4 sol, r2\mbreak
    R1*6

    %130
    sol8\f \staccatissimo sol'16 sol mi mi re re dod dod dod dod dod dod dod dod
    re8 \staccatissimo si'16\p si sol sol mi mi dod dod dod dod dod dod dod dod
    re1\p~

    %133
    re~
    re
    sol8 sol r si,16 do\mbreak re8 re re re
    mi mi, r sol16 la si8 si si si
    do8 do, r mi16 fad sol8 sol r4
    R1*6
    fad'2.\p r4
    r16 sol, la si do re mi fad sol fad mi re do si la sol\mbreak
    re'4 r\fermata r2
    sol,8 \f\staccatissimo sol16 sol si si re re sol8 sol, sol' sol
    fad8\tr(mi16 re) do8\tr(si16 la) si8\tr (la16 sol) re'\p do re mi
    la,8 la' sol la re, re\f do re
    sol, mi' mi mi la, fad' fad fad\mbreak
    si, sol' sol sol re la' la la
    sol si la fad sol\p si la fad si,\f do re sol sol sol fad fad
    sol\p si la fad sol si la fad
    re\f do re sol sol sol fad4\tr
    sol8 si, do re sol,4\fermopz r

}

Icbn = \relative do {

    sol'8\staccatissimo\f sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol\staccatissimo sol sol sol sol sol sol sol

    %4
    sol sol sol sol fad fad fad fad
    sol\staccatissimo sol sol sol si, si si si\mbreak
    do do do do do do do do

    %7
    re4 re, r2
    r r8 re'\p sol sol,
    re'4 re, r2

    %10
    re'8\f\staccatissimo re16 re fad fad la la re8 re, re' re
    dod\tr(si16 la) sol8\tr(fad16 mi) fad8\tr(mi16 re) fad\p mi fad sol\mbreak
    la8 la, si dod re re re re

    %13
    re^\f re re re re re re re
    sol,\staccatissimo sol16 sol si si re re sol8 sol, sol' sol
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) si\p la si do

    %16
    re8 re mi fad sol sol,\f la si\mbreak
    do do do do re re re re
    mi mi mi mi fad fad fad fad

    %19
    sol sol fad re sol \p sol fad re
    sol\f la si do re re re re
    sol,\p sol fad re sol sol fad re

    %22
    sol,\f la si do\mbreak re re re re
    mi si do re sol,4 r
    R1*7

    %31
    sol8_\staccatissimo^\f sol16 sol si si re re sol4\staccatissimo r
    R1
    sol,8_\staccatissimo^\f sol16 sol si si re re sol4\staccatissimo r

    %34
    R1*20

    %54
    re8\f re re re re re re re\mbreak
    re re re re re re re re
    re re re re re re re re

    %57
    re re re re dod dod dod dod
    re re re re fad, fad fad fad
    sol sol sol sol sol sol sol sol

    %60
    la4 la r2\mbreak
    r r8 la^\p re re,
    la' la\f si dod re la si dod

    %63
    re re mi mi fad fad sol sol
    la la la la la la la la
    re,4 r r2

    %66
    R1*4
    sol,8\f\staccatissimo sol16 sol si si re re sol4\staccatissimo r
    R1

    %72
    sol,8\f\staccatissimo sol16 sol si si re re sol4\staccatissimo r
    R1*4
    mi8\staccatissimo\f mi16 mi sol sol si si mi4\staccatissimo r

    %78
    R1*9

    %87
    mi,8\staccatissimo\f mi16 mi sol sol si si mi8 mi, mi' mi
    red8\tr(dod16 si) la8\tr(sol16 fad) sol8\tr(fad16 mi) sol\p fad sol la
    si8 si, dod red mi mi sold^\f sold\mbreak

    %90
    la la fad fad sol! sol mi mi
    fad fad red red mi mi red si
    mi\p mi red si mi\f fad sol la

    %93
    si si si si mi,4 r
    R1*15
    sol8\f \staccatissimo sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %111
    sol \staccatissimo sol sol sol sol sol sol sol
    sol sol sol sol fad fad fad fad
    sol \staccatissimo sol sol sol si, si si si

    %114
    do do do do do do do do
    re4 re, r2
    R1

    %117
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}
    R1*12

    %130
    sol8\f \staccatissimo sol'16 sol mi mi re re dod dod dod dod dod dod dod dod
    re8 \staccatissimo si'16\p si sol sol mi mi dod dod dod dod dod dod dod dod
    re4\staccatissimo r r2

    %133
    R1*12
    r16 sol, \f la si do re  mi fad sol fad mi re do si la sol

    %146
    re'4 r\fermopz r2
    sol,8 \f\staccatissimo sol16 sol si si re re sol8 sol, sol' sol
    fad8\tr(mi16 re) do8\tr(si16 la) si8\tr (la16 sol) si\p la si do

    %149
    re8 re mi fad sol sol,\f la si\mbreak
    do do do do re re re re
    mi mi mi mi fad fad fad fad

    %152
    sol sol fad re sol\p sol fad re
    sol\f la si do re re re re
    sol,\p sol fad re sol sol fad re

    %155
    sol,\f la si do\mbreak re re re re
    mi si do re sol,4\fermopz r

}

Ibcn = \relative do {

    sol'8\staccatissimo\f sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol\staccatissimo sol sol sol sol sol sol sol

    %4
    sol sol sol sol fad fad fad fad
    sol\staccatissimo sol sol sol si, si si si\mbreak
    do do do do do do do do

    %7
    re4 re, r2
    r r8 re'\p sol sol,
    re'4 re, r2

    %10
    re'8\f\staccatissimo re16 re fad fad la la re8 re, re' re
    dod\tr(si16 la) sol8\tr(fad16 mi) fad8\tr(mi16 re) fad^\p mi fad sol\mbreak
    la8 la, si dod re re re re

    %13
    re^\f re re re re re re re
    sol,\staccatissimo sol16 sol si si re re sol8 sol, sol' sol
    fad\tr(mi16 re) do8\tr(si16 la) si8\tr(la16 sol) si^\p la si do

    %16
    re8 re mi fad sol sol,\f la si\mbreak
    do do do do re re re re
    mi mi mi mi fad fad fad fad

    %19
    sol sol fad re sol\p sol fad re
    sol\f la si do re re re re
    sol,\p sol fad re sol sol fad re

    %22
    sol,\f la si do\mbreak re re re re
    mi si do re sol,4 r
    R1*7

    %31
    sol8_\staccatissimo^\f sol16 sol si si re re sol4\staccatissimo r
    R1
    sol,8_\staccatissimo^\f sol16 sol si si re re sol4\staccatissimo r

    %34
    R1\mbreak
    r8 sol\p sol fad mi sol mi sol
    la la la la la la la la

    %37
    la la la la la la la la
    la la la la la la la la
    R1*2

    %41
    r2 r8 re\p re re
    dod dod dod dod\mbreak re re re si
    la la la fad sol sol sol sol

    %44
    fad fad fad fad sol sol sol mi
    fad2 sol
    la8 la la la la la la la

    %47
    R1*2
    r8 la,^\p si dod\mbreak re la si dod
    re re mi mi fad fad sol sol

    %51
    la la la la la la la la
    re, re mi mi fad fad sol sol
    la la la la la la la la

    %54
    re,\f re re re re re re re\mbreak
    re re re re re re re re
    re re re re re re re re

    %57
    re re re re dod dod dod dod
    re re re re fad, fad fad fad
    sol sol sol sol sol sol sol sol

    %60
    la4 la r2\mbreak
    r r8 la^\p re re,
    la' la\f si dod re la si dod

    %63
    re re mi mi fad fad sol sol
    la la la la la la la la
    re,\p re re re re re re re

    %66
    re re re re\mbreak re re re re
    re re re re re re re re
    re re re re re re re re

    %69
    re re re re re re re re
    sol,\f\staccatissimo sol16 sol si si re re sol4\staccatissimo r
    R1

    %72
    sol,8\f\staccatissimo sol16 sol si si re re sol4\staccatissimo r
    R1*4
    mi8\staccatissimo\f mi16 mi sol sol si si mi4\staccatissimo r

    %78
    r2 r4 r8 si^\p
    mi mi mi mi la, la la la
    re re re re sol, sol sol sol\mbreak

    %81
    do do do do fad, fad fad fad
    si si si si si si si si
    si si si si si si si si

    %84
    si si sol sol red red mi mi
    fad fad red red mi sol la si\mbreak
    do la si red, mi sol la si

    %87
    mi,\staccatissimo\f mi16 mi sol sol si si mi8 mi, mi' mi
    red8\tr(dod16 si) la8\tr(sol16 fad) sol8\tr(fad16 mi) sol^\p fad sol la
    si8 si, dod red mi mi sold^\f sold\mbreak

    %90
    la la fad fad sol! sol mi mi
    fad fad red red mi mi red si
    mi\p mi red si mi\f fad sol la

    %93
    si si si si mi,4 r
    R1*4\mbreak
    r2 r8 mi\p mi mi

    %99
    fad fad fad fad sol sol sol sol
    fad fad fad fad sol4 r
    R1*4

    %105
    r2 r8 sol\p sol sol
    fad fad fad fad mi mi mi mi
    re re re re do do do re

    %108
    mi mi mi mi fad fad fad fad
    sol\staccatissimo \f sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %111
    sol\staccatissimo  sol sol sol sol sol sol sol
    sol sol sol sol fad fad fad fad
    sol \staccatissimo sol sol sol si, si si si

    %114
    do do do do do do do do
    re4 re, r2
    r r8 re'\p sol sol,

    %117
    re'4\fermata re, r2
    R1*5
    r2 r8 sol16\p[la si8 do]\mbreak

    %124
    re re re re fad fad fad fad
    sol4 r r2
    R1

    %127
    r8 re\p mi fad sol re mi fad
    sol sol la la si si do do
    re re re re re re re re\mbreak

    %130
    sol,,\f \staccatissimo sol'16 sol mi mi re re dod dod dod dod dod dod dod dod
    re8 \staccatissimo si'16\p si sol sol mi mi dod dod dod dod dod dod dod dod
    re1\p~

    %133
    re~
    re
    R1*2

    %137
    r2 r8 sol\p sol sol\mbreak
    fad fad fad fad sol sol sol mi
    re re re si do do do do

    %140
    si si si si do do do la
    si2 do
    re8 re r re re re r re

    %143
    re re, r re' re re, r re'\mbreak
    re2. r4
    r16 sol, \f la si do re  mi fad sol fad mi re do si la sol

    %146
    re'2 re,\fermata
    sol8 \f\staccatissimo sol16 sol si si re re sol8 sol, sol' sol
    fad8\tr(mi16 re) do8\tr(si16 la) si8\tr (la16 sol) si^\p la si do

    %149
    re8 re mi fad sol sol,\f la si\mbreak
    do do do do re re re re
    mi mi mi mi fad fad fad fad

    %152
    sol sol fad re sol\p sol fad re
    sol\f la si do re re re re
    sol,\p sol fad re sol sol fad re

    %155
    sol,\f la si do\mbreak re re re re
    mi si do re sol,4\fermopz r

}

Ibfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6 4>
    <5 3>
    <4 2>2 <6 5>
    s <6>
    s s4 <6>
    s1*2
    <6 4>4 <5 3> s2
    s1
    s2 s4 <6>
    <_+>4 <6> s2
    <7>1
    s
    s2 s4 <6>
    s4 <6> s <6!>
    s4 <6> <5> <6>
    <5> <6> <6> s
    s <6> s <6>
    s2 <6 4>4 <5 3>
    s <6> s <6>
    s2 <6 4>4 <5 3>
    s1*13
    <_+>1
    <6 4>
    <7 _+>
    s1*2
    s2 s4 s8 <4\+ 2>
    <6>4 <5> <4>8 <3> s <6\\>
    <_+>4 s8 <6> <9>4 <8>8 <4\+ 2>
    <6>2 s4 s8 <6\\>
    <6>2 <6 5>
    <_+> <7>
    s1*2
    s8 <_+> <6>4 s8 <6> s4
    s <6\\> <6> <6 5>
    <6 4>2 <5 _+>
    s4 <6\\> <6> <6 5>
    <6 4>2 <5 _+>
    s1
    <6 4>
    <5 3>
    <4 2>2 <6 5>
    s <6>
    s s4 <6>
    <_+>1
    s2 s8 <_+> s4
    s <6> s <6>
    s <7> <6> <6 5>
    <6 4>2 <5 _+>
    s1*3
    <7>1
    s1*9
    s2 s4 s8 <_+>
    s1*3
    <_+>2 <6 4>
    <5 _+> <6 4>
    <5 _+>4 <6> <6 5>2
    s4 <6 5> s <6 5>8 <_+>
    s <6> <_+> <6> s s <6 5> <_+>
    s1
    s2 s4 <6>
    <_+> <6> s <6 5>
    s <6 5> s <6 5>
    s <6 5> s <6>
    s <6> s <6>
    <6 4> <5 _+> s2
    s1*5
    <6>1
    <6>
    s1*5
    <6>2 <6\\>
    s1
    s2 <6>
    s1
    <6 4>
    <5 3>
    <4 2>2 <6 5>
    s <6>
    s s4 <6>
    s1*8
    s2 s4 <6>
    s2 <6>
    s1
    s
    s4 <6> s <6>
    s <7> <6> <6 5>
    <6 4>2 <5 3>
    s1*3
    <6 4>1 <5 3>
    s1
    s
    s2 s4 s8 <4\+ 2>
    <6>4 s8 <5>
    <4> <3> s <6\\>
    s4 s8 <6> <9> s <8> <4 2>
    <6>2 s4 s8 <6>
    <6>2 <6 5>
    s <6 4>
    <5 3> <6 4>
    <7 5>1
    s
    <6 4>2 <5 3>
    s1
    s2 s4 <6>
    s <6> s <6!>
    s4 <6> <5> <6>
    <5> <6> <6> s
    s <6> s <6>
    s2 <6 4>4 <5 3>
    s <6> s <6>
    s2 <6 4>4 <5 3>
    s <6 5>

}

forma = {
    \key sol\major
    \time 4/4
    \tempo 2 = 60
    s1*156
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

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

Icb = {
    \Iglobal
    \clef bass
    <<\Icbn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIfln = \relative do'' {

    r8
    R2.*7
    r2 r8 re,\mf\solo
    \appoggiatura do'16 sib8(la16 sol) mib'8.(sol32 fa) mib8 re

    %10
    dod8.\tr re16 re,4~re16 do'\<(sib la)\!
    sib16.\f(do32 re16. )re32\staccatissimo re4\>(do\tr)\!
    sib16.\p(do32 re16.) re32\staccatissimo re8\staccatissimo fad!\<(sol la)

    %13
    sib si\! (do re\> mib) sol,\!\mbreak
    \grace la16 sol8(fad) r mib\<(re do)\!
    sib8.\f\tr(la32 sib) do4 sib4

    %16
    sib\tr la r
    sib4. fa'16.(re32) sib8 sib
    sib4.\tr sol'16.(mib32) do8 do

    %19
    do8.(re32 mib) mib4(re\tr)
    do16.\p(re32 mib16.) mib32\staccatissimo mib4(re\tr)\mbreak
    do8 la'\<~la16 (do\! sib la) sib\staccatissimo fa(mib re)

    %22
    sol(mib re do) re8. fa32(mib) re8(do\tr)
    si16.(do32 re16. mib32) fa4(mib\tr)
    re16.\p(mib32 fa16.) fa32\staccatissimo fa4(mib\tr)

    %25
    re8 sol,(lab\< si do re)\!
    mib16.\f do32 mi16. do32 fa16. do32 sol'16. do,32 lab'16. fa32\> re16. do32\!
    \grace do8 si4. \p\senza \tuplet 3/2 { sol16\<(fad sol)\! } re'\staccatissimo re do si\>

    %28
    \grace si?8 do4.\! \tuplet 3/2 { sol16(fad\< sol) } mib'\staccatissimo mib\!(re do)\mbreak
    \grace do8\> re4.\! \tuplet 3/2 { sol,16\p(si re) } fa(sol32 lab) sol16 fa
    mib(do' lab fa) mib8.\<(re32 do) re4\tr\!

    %31
    do4 r2
    R2.*4
    r4 r8 lab'\solo(sol fa)

    %37
    mib8.\tr(re32 mib) fa4 mib\mbreak
    mib\tr re r8 sol,
    mib'4. sol8(mib do)

    %40
    \grace sib la4. do8 fa, mib'
    re16.(mib32 fa16.) fa32\staccatissimo fa4(mib\tr)
    re16.\p(mib32 fa16.) fa32\staccatissimo fa4(mib\tr)

    %43
    re8\staccatissimo\< fa4 sib\! re,8\mbreak
    re\tr do r do16(si) do(re32 mib) re16 do
    sib!8 re4\p sol sib,8~

    %46
    sib la4 do8\<(re mib)\!
    fad,16.(sol32 la16. sib32) do4(sib\tr)
    la16.\p(sib32 do16.) do32\staccatissimo do4(sib\tr)\mbreak

    %49
    la8 mib'\< (re fad sol ) fa\!
    mib(re do) sib'(la sol)
    \grace sol\> fad4.\! \tuplet 3/2 { re16\<(dod re) } la'\staccatissimo\! la\>(sol fad)

    %52
    \grace fad? sol4.\! \tuplet 3/2 { re16\<(dod re) } sib'\staccatissimo sib\>(la sol)
    \grace sol8 la4.\! \tuplet 3/2 { re,16\p(fad la)} do(re32 mib re16 do)\mbreak
     sib8 re fad, la sol4\<~

     %55
     sol8. \!do16 sib4\>(la\tr)\!
    sol2.~\p \<
    sol~

    %58
    sol8\! sol,16\f (la) si(sol) re'(si) fa'\staccatissimo fa(mib re)
    mib(sol) do,(mib) \grace sib8 la4~la16 do(re mib)
    re(fa) sib,(re) \grace la8 sol4~sol16 re'(mib re)

    %61
    do(mib) la,(do) \grace sol8 fad4~fad16 mib'\<(re do)\!\mbreak
    sib8\p sib'4 la sol8
    \grace sol fad2\tr\< sol4\!~

    %64
    sol8. do,16 \set Staff.ottavation = #"8va alta" sib4(la)
    sol \unset Staff.ottavation r r
    R2.*5

}

IIvlIn = \relative do'' {

    re,8\p
    \grace do'8 sib(la16 sol) mib'8.(sol32 fa) mib8 re
    dod8.\tr re16 re,4\< ~re16 do'(sib la)\!
    sib16.\mf(do32 re16. )re32\staccatissimo re4\>(do\tr)\!

    %4
    sib16.\p(do32 re16.) re32\staccatissimo re8\<\staccatissimo fad!(sol la)\!
    sib\mf si (do re mib) sol,\mbreak
    \grace la16 sol8(fad) r mib\p(re do)

    %7
    sib8.\tr(la32 sib) do4\< sib4\!
    sib\tr\mf la r
    r r8 sib\p sib sib

    %10
    la la la la la la
    sib(la) r fad(sol la)
    sib(la16.) re,32 re'4(do\tr)

    %13
    sib8(re sol,) si(do sib)\mbreak
    \grace do8 sib(la) r do(sib la)
    sol(sol) la(la) sol(sol)

    %16
    sol4\tr fad r
    r8 fa! fa fa fa fa
    sol sol sol sol sol sib

    %19
    la8.(sib32 do) do8 do sib sib
    la16.(sib32 do16.) do32\staccatissimo do8(do sib sib)
    la do\mf do do re re\p

    %22
    sib-. (sib-. sib-.\mf sib-. lab-. lab-.\f)\mbreak
    sol16.(la!32 si16. do32) re8(re do do)
    si16.\p(do32 re16.) re32\staccatissimo re8(re do do)

    %25
    si4 r8 sol4 si8
    do2 r4
    r8 re re re re re

    %28
    mib mib mib mib mib mib
    fa fa fa fa fa fa
    r4 r r8 sol,\p\mbreak

    %31
    \grace fa'8 mib(re16 do) lab'8.(do32 sib) lab8 sol
    fad8.\tr sol16 sol,4\<~sol16 fa!(mib re)\!
    mib16.\f(fa32 sol16.) sol32\staccatissimo sol4(fa\tr)

    %34
    mib16.\p(fa32 sol16.) sol32\staccatissimo sol8\staccatissimo\< si(do re)\!
    mib mi (fa sol lab) do,
    \grace re do(si) r fa'\p(mib re)\mbreak

    %37
    do(do) re(re) do(do)
    do4\tr si r
    r8 do do do do do

    %40
    do do do do do do
    re(do) r la\f(sib do)
    re\p(do) r la\f(sib do)

    %43
    re\p re re re re sib
    sib la la la la la\mbreak
    sol sol sol sol sol sol

    %46
    sol sol sol sol sol sol
    r fad16.(sol32) la8(la sol sol)
    fad16.(sol32 la16.) la32\staccatissimo la8(la sol sol)

    %49
    fad fad(sol la sib re)
    sol,4. sol8(do sib)
    la la' la la la la\mbreak

    %52
    sib sib sib sib sib sib
    do do do do do do
    R2.*2

    %56
    r8^\f _\markup\italic"senza Sordini"re,16.^\pizz mib32 fa8 re16. fa32 mib8 sol16. mib32
    re8\staccatissimo re,16.\p mib32 fa8 re' mib,[do']
    re, re r4 r

    %59
    R2.*6
    r16^\arco r32 sol\ff si16. sol32 do16. sol32 re'16. sol,32 mib'16. do32 la16. sol32
    fad16.(sol32 la16. sib32) do4(sib\tr)\mbreak

    %67
    la16.\p(sib32 do16.) do32\staccatissimo do4(sib\tr)
    la16.\staccatissimo fad'32\f fad8\tr sol16.\staccatissimo sol32 sol8\tr la16.\staccatissimo do,32 do16.\tr (sib64 la)
    sib16. sol'32 mib16. do32 sib8.\tr(la32 sol)

    %70
    la4\tr sol8 re sol,4\fermopz r

}

IIvlIIn = \relative do'' {

   r8
   r4 r8 sib\p sib sib
   la la la la la la
   sol(fad) r fad\f(sol la)

   %4
   sib\p(la16.) re,32 re'4(do\tr\f)
   sib8 (re sol,) si(do sib)
   \grace do sib (la) r do\p(sib la)

   %7
   sol8.\tr fad32 sol la4\< sol\!
   sol\tr\mf fad r\mbreak
   r r8 sol\p sol sol

   %10
   sol sol fad fad fad fad
   sol re r re(re re)
   re(re) r re(re re)

   %13
   re re(mib! fa sol) sol
   re(re re re re re)
   re(re re re re re)

   %16
   re4 re r
   r8 re re re re re
   mib mib mib mib mi mi\mbreak

   %19
   fa(fa fa fa fa fa)
   fa(fa fa fa fa fa)
   fa  fa\mf mib mib re re\p

   %22
   mib-.(mib-. fa-.\mf fa-. fa-. fa-.\f)
   sol(sol sol sol sol sol)
   sol\p(sol sol sol sol sol)

   %25
   sol4 r8 re(mib fa)
   sol do, do4 r
   r8 si' si si si si

   %28
   r do do do do do
   r re re re re re\mbreak
   R2.

   %31
   r4 r8 mib,\p mib mib
   re re re re re re
   do\f (si) r si(do re)

   %34
   mib\p(re16.) sol,32 sol'4\<(fa\tr\!)
   mib8(sol) do,(mi) fa(mib)
   \grace fa mib(re) sol\p[(sol sol sol)]

   %37
   sol(sol sol sol sol sol)
   sol4 sol r
   r8 sol sol sol sol sol\mbreak

   %40
   r la la la la la
   fa(fa) r fa(fa fa)
   fa(fa) r fa(fa fa)

   %43
   fa fa fa fa fa fa
   fa fa fa fa re re
   re re re re re re

   %46
   mib mib mib mib mib mib
   re(re re re re re)
   re(re re re re re)\mbreak

   %49
   re la(sib do re) sol,
   r si(do re mib sol)
   \once\stemUp re fad' fad fad fad fad

   %52
   r sol sol sol sol sol
   r la la la la la
   R2.*2

   %56
   r8^\f_\markup\italic"senza Sordini" si,16.^\pizz do32 re8 sol,16. re'32 do8 do,16. do'32
   si8 si,16.\p do32 re8 re do do
   si si r4 r

   %59
   R2.*6
   r16^\arco r32 sol'32\ff si16. sol32 do16. sol32 re'16. sol,32 mib'16. do32 la16. sol32
   fad16.(mi32 fad16. sol32) la4(sol\tr)\mbreak

   %67
   fad16.\p(sol32 la16.) la32\staccatissimo la4(sol\tr)
   fad16.\staccatissimo fad'32\f fad8\tr sol16. sol32 sol8\tr la16.\staccatissimo do,32 do16.\tr (sib64 la)
   sib16. sol'32 mib16. do32 sib8.\tr(la32 sol) la4\tr

   %70
   sol8 re sol,4\fermata r

}

IIvlan = \relative do' {

   r8
   r4 r8 sol'\p sol sol
   sol sol fad fad fad fad
   sol re r re\f(mi fad)

   %4
   sol\p re r re\f(mi fad)\mbreak
   sol\staccatissimo  fa (mib re do) dod
   re re re re-.\p  (re-. re-.)

   %7
   re re r16 re\staccatissimo\< fad\staccatissimo re\staccatissimo sol\staccatissimo re\staccatissimo sib\staccatissimo sol\staccatissimo\!
   re'8\mf re, re'4 r
   R2.*18

   %27
   r8 sol\p sol sol fa fa\mbreak
   mib mib mib mib do do
   si si si si si si

   %30
   R2.
   r4 r8 do\p do do
   do do\< si si si si\!

   %33
   do\f sol r sol(la si)\mbreak
   do\p sol r sol(la si)
   do(sib! lab sol fa) fad

   %36
   sol sol r4 r
   R2.*2
   r8 do\p do do do do

   %40
   fa fa fa fa fa fa
   sib, fa r4 r\mbreak
   R2.

   %43
   r8 sib\p sib sib sib sib
   fa fa fa fa fad fad
   sol sol sol sol sol sol

   %46
   do do do do do do
   re re, r4 r
   R2.*3\mbreak

   %51
   r8 re''\p re re do do
   sib sib sib sib sol sol
   fad fad fad fad fad fad

   %54
   R2.*2
   r4^\f _\markup\italic"senza Sordini" r16 sol^\pizz si sol do sol mib do
   sol'8 sol r16 sol,\p si sol do sol mib do\mbreak

   %58
   sol'8 sol r4 r
   R2.*6
   r8 re'\ff^\arco sol sol sol mi

   %66
   re re, r16 re'16 \staccatissimo fad\staccatissimo re\staccatissimo sol\staccatissimo re\staccatissimo sib\staccatissimo sol\staccatissimo
   re'8\p re, r16 re' fad re sol re sib sol
   re'8 re'4\f do8~do16. la32 la8\tr \mbreak

   %69
   sol sol sol4(fad\tr)
   sol8 re sol,4\fermata r

}

IIcbn = \relative do {

    r8
    R2.*10
    r4 r8 re\p(mi fad)
    sol re r re\f(mi fad)

    %13
    sol fa! (mib! re do) dod
    re re,  r4 r
    r4 r16 re'^\pizz -. fad-. re-. sol-. re-. sib-. sol-.

    %16
    re'8 re, re'4 r
    R2.*2
    r4 r16 fa\f-. la-. fa-. sib-. fa-. re-. sib-.

    %20
    fa'8 fa, r16 fa'\p-. la-. fa-. sib fa re sib
    fa'8 fa, r4 r
    R2.

    %23
    r4 r16 sol'\f-. si-. sol-. do sol mib do
    sol'8 sol, r16 sol'\p-. si-. sol-. do sol mib do
    sol'8 sol, r fa'\f^\arco(mib re)

    %26
    do(sib! lab [sol] fa fad)
    sol sol' r4 r
    R2.

    %29
    r4 r r8 sol\p
    do fa, sol4 sol,
    do r r

    %32
    R2.*5
    r4 r16 sol'^\pizz-. si-. sol-. do-. sol-. mib-. do-.

    %38
    sol'8 sol, sol'4 r
    R2.*2

    %41
    r4 r8 fa^\arco\f(sol la)
    sib fa r fa\p(sol la)\mbreak
    sib sib, r4 r

    %44
    R2.*3
    r4 r16 re^\pizz \f-. fad-. re-. sol-. re-. sib-. sol-.

    %48
    re'8 re, r16 re'\p fad re sol re sib sol
    re'8\f do sib la sol si
    do re mib re do dod\mbreak

    %51
    re8 re, r4 r
    R2.
    r4 r r8 re'^\arco

    %54
    sol re la' re, sib' sol
    mib' [do] re do re re,
    sol sol, r16 sol'\f^\pizz -. si-. sol-. do-. sol-. mib-. do-.

    %57
    sol'8 sol r16 sol\p si sol do sol mib do\mbreak
    sol'8 sol r4 r
    R2.*6
    r8 sol16.\ff^\arco fa32 mib8 re do[dod]

    %66
    re re, r16 re'-. fad-. re-. sol-. re-. sib-. sol-.
    re'8 re, r16 re'\p fad re sol re sib sol
    re'8.\f re16 mi8. mi16 fad8. fad16\mbreak

    %69
    sol8 do re4 re,
    sol8 re sol,4\fermopz r

}

IIbcn = \relative do {

    \set Staff.midiInstrument = #"harpsichord" r8
    r4 r8 sol' sol sol
    sol sol fad fad fad fad
    sol re r re(mi fad)

    %4
    sol re r re(mi fad)
    sol fa! (mib! re do) dod\mbreak
    re re re re re re

    %7
    re re r16 re-. fad-. re-. sol-. re-. sib-. sol-.
    re'8 re, re'4 r
    r4 r8 sol sol sol

    %10
    sol sol fad fad fad fad\mbreak
    sol re r\set Staff.midiInstrument = #"cello" re\p(mi fad)
    sol re r re\f(mi fad)

    %13
    sol fa! (mib! re do) dod
    re re, \set Staff.midiInstrument = #"harpsichord" re' re re re
    re re \set Staff.midiInstrument = #"cello" r16 re^\pizz -. fad-. re-. sol-. re-. sib-. sol-.

    %16
    re'8 re, re'4 r
    \set Staff.midiInstrument = #"harpsichord" r8 re re re re re
    mib mib mib mib mi mi
    fa fa\set Staff.midiInstrument = #"cello" r16 fa\f-. la-. fa-. sib-. fa-. re-. sib-.

    %20
    fa'8 fa, r16 fa'\p-. la-. fa-. sib fa re sib
    fa'8 fa, \set Staff.midiInstrument = #"harpsichord" mib' [mib] re[re]
    mib mib fa[fa fa fa]

    %23
    sol sol \set Staff.midiInstrument = #"cello" r16 sol\f-. si-. sol-. do sol mib do
    sol'8 sol, r16 sol'\p-. si-. sol-. do sol mib do
    sol'8 sol, r fa'\f^\arco(mib re)

    %26
    do(sib! lab [sol] fa fad)
    sol sol' \set Staff.midiInstrument = #"harpsichord" sol[sol] fa! fa
    mib mib mib mib do[do]

    %29
    si si si si si[\set Staff.midiInstrument = #"cello" sol']\p
    do fa, sol4 sol,
    do \set Staff.midiInstrument = #"harpsichord" r8 do do do

    %32
    do[do] si si si si
    do sol r sol(la si)
    do sol r sol(la si)

    %35
    do(sib! lab sol fa) fad
    sol[sol] sol' sol sol sol
    sol sol \set Staff.midiInstrument = #"cello" r16 sol^\pizz-. si-. sol-. do-. sol-. mib-. do-.

    %38
    sol'8 sol, sol'4 r
    \set Staff.midiInstrument = #"harpsichord" r8 do, do do do do
    fa fa fa fa fa fa

    %41
    sib, fa r8 \set Staff.midiInstrument = #"cello" fa'^\arco\f(sol la)
    sib fa r fa\p(sol la)\mbreak
    sib sib, \set Staff.midiInstrument = #"harpsichord" sib sib sib sib

    %44
    fa fa fa fa fad[fad]
    sol sol sol sol sol sol
    do do do do do do
    re re, r16 \set Staff.midiInstrument = #"cello" re'^\pizz \f-. fad-. re-. sol-. re-. sib-. sol-.

    %48
    re'8 re, r16 re'\p fad re sol re sib sol
    re'8\f do sib la sol si
    do re mib re do dod\mbreak

    %51
    re8 re, \set Staff.midiInstrument = #"harpsichord" re''[re do do]
    sib sib sib sib sol sol
    fad fad fad fad fad [\set Staff.midiInstrument = #"cello" re^\arco]

    %54
    sol re la' re, sib' sol
    mib' [do] re do re re,
    sol sol, r16 sol'\f^\pizz -. si-. sol-. do-. sol-. mib-. do-.

    %57
    sol'8 sol r16 sol\p si sol do sol mib do\mbreak
    sol'8 sol r4 r8 sol,\p^\arco
    do[do] fa fa fa fa

    %60
    sib,[sib] mib mib mib mib
    la,[la] re re re re
    sol4 do dod

    %63
    re8 re, do! do' sib sol\mbreak
    do4 re re,\fermata
    sol,8 sol'16.\ff fa32 mib8 re do[dod]

    %66
    re re, r16 re'-. fad-. re-. sol-. re-. sib-. sol-.
    re'8 re, r16 re'\p fad re sol re sib sol
    re'8.\f re16 mi8. mi16 fad8. fad16\mbreak

    %69
    sol8 do re4 re,
    sol8 re sol,4\fermata r

}

IIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2.*10
    s4 s8 <_+> <6>4
    s8 <_+> s4  <6>
    s8 <4! 2> <6> <6!> s <7>
    <6 4>8 <5 _+> s2
    s2.*10
    s4 s8 <4! 2> <6> <6!>
    s <4! 2> <6> <6!> s <6 5>
    <4> <_!> s2
    s2.
    s2 s8 <_!>
    s <_-> <6 4>4 <5 _!>
    s2.*10
    s2 <6>4
    s2 <6>4\mbreak
    s2.*6
    <_+>8 <6 4\+ 3> <6> <6\\> s <6 5!>
    s <6!> <6> <6-> <6> <6 5>
    <5 4> <_+> s2
    s2.
    s2 s8 <_+>
    s4 <6\\> <6>
    s <6 4> <5 _+>
    s8 <_!> s2
    s2.*2
    s4 <7>2
    s4 <7>2
    s4 <7 _+>2
    s4 <7> <6 5>
    <_+> <4\+ 2> <6>
    s <6 4> <5 _+>
    s8 <_!> <6> <6!> s <6>
    <_+>4 <7> s
    <_+>4 <7>  s
    <_+> <7> <6 5>
    s <6 4> <5 _+>

}

forma = {
    \key sol\minor
    \time 3/4
    \tempo 4 = 43
    \partial 8 s8
    s2.*70
    \bar "|."

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

IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>

}

IIcb = {
    \IIglobal
    \clef bass
    <<\IIcbn \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIIfln = \relative do'' {

   R2*38
   re'2\solo
   do8-.[si-. la-. sol-.]

   %41
   fad-.[mi-. re-. do-.]
   si [sol' sol sol]
   \grace la8 sol8(fad16 sol) la8 do\mbreak

   %44
   si4 r
   R2
   r8 sol[sol sol]

   %47
   \grace la8 sol8(fad16 sol) la8 do,
   si16-. re(mi re) dod-. mi(fad mi)
   re-. fad(sol fad) mi-. sol (la sol)

   %50
   fad8[re re re]\mbreak
   dod8.(re32 mi) re8 re\p
   dod8.(re32 mi) re8(fad16 sol)

   %53
   la-. sol-. fad-. mi-. re-. do!-. si-. la-.
   si8 si'4\< la8
   \grace la sol4.\tr\! fad8

   %56
   \grace fad8 mi4.\tr re8
   dod4 r8 mi\f \mbreak
   fad16-. la(si la) dod,-. la'(si la)

   %59
   re,-. la'(si la) mi-. la(si la)
   fad-.\p-. la(si la) dod,-. la'(si la)
   re,-. la'(si la) mi-. la(si la)

   %62
   fad-. re(fad la) fad-. re(fad la)\mbreak
   mi-. fad-. sol-. mi-. la-. sol-. fad-. mi-.
   re-. si(re fad) re-. si(re fad)

   %65
   dod-. re-. mi-. dod-. fad-. mi-. re-. dod-.
   si-. sol(si re) si-. sol(si re)
   la-.\< si-. dod-. la-. re-. dod-. si-. la-.\!\mbreak

   %68
   sol8\staccatissimo [sol'\f(fad sol)]
   r sol[(fad sol)]
   r dod16[(re mi8) sol,]

   %71
   fad sol16 (la) si8 re,
   dod\staccatissimo dod16(re mi8) sol,
   fad[re' si sol']

   %74
   fad16(mi re8) mi4\tr
   re\staccatissimo r8\set Staff.ottavation = #"8va alta"  la\p
   la[(si) si(sol)]

   %77
   fad16(sol) la8\staccatissimo   r la\<
   la[(si) si(dod)]\!
   re16(mi) fad8\staccatissimo  r4 \unset Staff.ottavation

   %80
   si,2\f
   sol'
   fad16(la) re,-. fad-. mi-. sol-. fad-. mi-.

   %83
   fad(la) re,-. fad-. mi-. sol-. fad-. mi-.\mbreak %% fine prima pag.
   fad,(la) sol(si) la(dod) si(re)
   dod(mi) re(fad) mi(sol) fad(la)

   %86
   sol-. fad-. mi-. re-. dod-. si-. la-. sol-.
   fad8 dod'16(\set Staff.ottavation = #"8va alta" re32 mi) re8 sol,
   fad16(mi re8) mi4\tr

   %89
   re4\unset Staff.ottavation r
   R2*24
   la''2\solo

   %115
   sol8-.[fad-. mi-. re-.]
   dod-. [si-. la-. sol-.]
   fad[re' re re]

   %118
   dod8.(re32 mi) re8 re\f
   dod8.(re32 mi) re8 fad16(sol)
   la-.\< sol-. fad-. mi-. re-. fad-. mi-. re-.\!

   %121
   re'2\f
   do!8-.[si-. la-. sol-.]
   fad-.[mi-. re-. do-.]\mbreak

   %124
   si[sol' sol sol]
   fad8.(sol32 la) sol8 sol\p
   fad8.(sol32 la) sol8 sol,16(la)

   %127
   si16 (do re mi \grace sol8 fa mi16 re)
   mi8 mi r mi
   mi16 (re dod si la dod mi sol)\mbreak

   %130
   fad8 fad r fad\mf
   fad16(mi red dod si red fad la)
   sol8 sol r sol\f

   %133
   fad16(mi red dod si red fad la)
   sol(la sol fad) mi(fad sol mi)
   do'(re) do-. si-. la-. sol-. fad-. mi-.\mbreak

   %136
   red4 r8 fad
   sol16\f(si) mi,(sol) si,(mi) sol,(si)
   mi,(sol si mi sol si sol mi)

   %139
   fad(si) red,(fad) si,(red) fad,(si)
   red,(fad si red fad si fad red)
   sol-.\p si-. mi,-. sol-. si,-. mi-. sol,-. si-.\mbreak

   %142
   mi,-. sol-. si-. mi-. sol-. si-. sol-. mi-.
   fad-. si-. red,-. fad-. si,-. red-. fad,-. si-.
   red,-. fad-. si-. red-. fad-. si-. fad-. red-.

   %145
   sol\<(si sol fad) mi(sol mi re!)\!
   do\f(la) mi'-. do-. la'-. do-. la-. sol-.
   fad(la fad mi) re(fad re do)\mbreak

   %148
   si(sol) re'-. si-. sol'-. si-. sol-. fad-.
   mi(sol mi re) do(mi do si)
   la(fad) do'-. la-. fad'-. la-. fad-. mi-.

   %151
   red(fad red dod) si (red si la)
   sol8[\staccatissimo do(si lad)]
   si fad'16(sol 32 la) sol8\> fad

   %154
   sol\staccatissimo\! [do\p(si lad)]\mbreak
   si[red(mi) la,]
   sol8 la16 (si) do8 mi,

   %157
   red red16\<(mi) fad8 \set Staff.ottavation = #"8va alta" la,\!
   sol\f mi' fad,4\tr
   mi\unset Staff.ottavation r

   %160
   R2*9
   r4 sol'\solo(
   fad mi)  %seconda riga ultima pagina

   %171
   red8.\tr(dod32 red) mi8 mi
   red8.\tr\p(dod32 red) mi8 mi
   red16(dod) red-. mi-. fad4

   %174
   r8 fad[(mi red)]
   mi16(red) mi-. fad-. sol4
   r8 sol\<[(fad mi)]

   %177
   fad16(mi) fad-. sol-.\! la4\mbreak
   r8 la\<[(sol fad)]\!
   sol16\f(fad mi fad sol la si sol)

   %180
   la(si) la-. sol-. fad-. mi-. re-. do-.
   si8 r si'4(
   la sol)

   %183
   fad8.\tr(mi32 fad) sol8 sol
   fad8.\tr\p(mi32 fad) sol8 sol
   fad16(mi) fad-. sol-. la4

   %186
   r8 la([sol fad)]\mbreak
   sol16\<(fad) sol-. la-. si4\!
   r8 si[(la sol)]

   %189
   la16\f(sol) la-. si-. do4
   r8 do\>[(si la)\!]
   si16\p(sol) si-. re-. si(sol) si-. re-.

   %192
   la(si do) la-. re-. do-. si-. la-.
   sol(mi) sol-. si-. sol(mi) sol-. si-.
   fad(sol la) fad-. si-. la-. sol-. fad-.\mbreak

   %195
   mi(do) mi-. sol-. mi-.\>(do) mi-. sol-.
   re(mi fad) re-. sol-. fad-. mi-. re-.
   do-. si-. la-. si-. do-.\< re-. mi-. fad-.\!

   %198
   \grace la8 sol8_>(fad16 mi) re8 sol
   la16_>(sol fad mi) re8 la'
   si16_>(sol fad sol) re8 si'

   %201
   do16(re  mi) re-. do-. si-. la-. sol-.\mbreak
   fad(sol la) sol-. fad-. mi-. re-. do-.
   si-. re(mi re) fad,-. re'(mi re)

   %204
   sol,-. re'(mi re) la-. re(mi re)
   si-. re(mi re) fad,-. re'(mi re)
   sol,-. re'(mi re) la-. re(mi re)

   %207
   si32(re16.)~ re4.
   R2*2
   re'2\solo

   %211
   do8-.[si-. la-. sol-.]
   fad-.[mi-. re-. do-.]\mbreak
   si[sol' sol sol]

   %214
   \grace la8 sol8(fad16 sol) la8 do
   si4 r
   R2

   %217
   r8 sol\solo[sol sol]
   \grace la8 sol(fad16 sol) la8 do,\mbreak
   si16-. re(mi re) dod-. mi (fad mi)

   %220
   re-. fad(sol fad) mi-. sol(la sol)
   fad4 r
   R2*3

   %225
   r8 sol\solo[sol sol]
   fad8.(sol32 la) sol8 sol\p\mbreak
   fad8.(sol32 la) sol8\staccatissimo si16(do)

   %228
   re-. do-. si-. la-. sol-. fad-. mi-. re-.
   mi-.\< sol(la sol) fad-. la(si la)
   sol-. si(do si) la-. do(re do)\!

   %231
   si8 red,16(mi32 fad) mi8 si'^>
   la-> dod,16(re!32mi) re8 la'->
   sol-> si,16(do!32 re) do8 sol'\mbreak

   %234
   fad16(la) fad-. re-. sol(si) sol-. re-.
   fad(la) fad-. re-. sol(si) sol-. re-.
   fad(la) fad-. re-. sol8 do

   %237
   si16(la sol8) la4\tr
   sol r8 re\p
   re[(mi) mi(do)]

   %240
   si16(do) re8\staccatissimo r re\<
   re[(mi) mi(fad)]\!\mbreak
   sol16(la) si8\staccatissimo r4

   %243
   mi,16\p(do) sol'-. mi-. do'-. si-. la-. sol-.
   do-. si-. la-. sol-. fad-. mi-. re-. do-.
   re(si) sol'-. re-. si'-. la-. sol-. fad-.

   %246
   si-. la-. sol-. fad-. mi-. re-. do-. si-.
   do(la) mi'-. do-. la'-. sol-. fad-. mi-.
   la-. sol-. fad-. mi-. re-. do-. si-. la-.\mbreak

   %249
   si(re) sol,-. si-. la-. do-. si-. la-.
   si(re) sol,-. si-. la-. do-. si-. la-.
   si(re) do(mi) re(fad) mi(sol)

   %252
   fad(la) sol(si) la(do) si(re)
   do-. si-. la-. sol-. fad-. mi-. re-. do-.
   si8 fad'16(sol32 la) sol8\set Staff.ottavation = #"8va alta" do,

   %255
   si16(la sol8) la4\tr \mbreak
   sol4 \unset Staff.ottavation r
   R2*22

}

IIIvlIn = \relative do'' {

   re2
   do8-. [si-. la-. sol-.]
   fad-.[mi-. re-. do-.]
   si[sol' sol sol]

   %5
   \appoggiatura la sol fad16 sol la8 do
   si16 sol fad sol mi sol fad sol
   re sol fad sol do, sol' fad sol\mbreak

   %8
   si,8[sol' sol sol]
   \appoggiatura la sol fad16 sol la8 do
   si16 re mi re dod mi fad mi

   %11
   re fad sol fad mi sol la sol
   fad8[re\p re re]
   dod8.(re32 mi) re8 re

   %14
   dod8.(re32 mi) re8 fad16\f sol
   la sol fad mi re do? si la\mbreak
   si8[sol'\p sol sol]

   %17
   fad8.(sol32 la) sol8 sol
   fad8.(sol32 la) sol8 si16\f (do)
   re16 do si la sol fa mi re

   %20
   mi8 do'\staccatissimo r mi,
   re16 si' la si do, la' sol la
   si,8 sol'\staccatissimo r si,

   %23
   la16 mi' re mi sol, si la sol
   fad8 re' sol, do\mbreak
   si8.\tr(la32 si) do8 la

   %26
   sol4\staccatissimo r8 re'\p
   re[(mi) mi-. do-.]
   si16\((do) re8\staccatissimo\) r re

   %29
   re[(mi) mi-. fad-.]
   sol16\((la) si8\staccatissimo\) r4
   mi,,2\f

   %32
   do'
   si16 re do si la sol fad mi
   re mi fad re sol8 do,\mbreak

   %35
   si [sol' do, re]
   \once\stemUp sol, si''16(do32 re) do8 la
   \once\stemDown si[si,, do re]

   %38
   sol,4 r
   R2*5
   r16 sol'\f fad sol mi sol fad sol

   %45
   re sol fad sol do, sol' fad sol
   si,4 r
   R2*4\mbreak

   %51
   r8 la'\p la,4\tr
   r8 la' la,4\tr
   R2*7

   %60
   r4 la\p
   si dod
   \once\stemUp re8[fad' fad fad]

   %63
   r mi [mi la]
   r re, [re re]
   r dod [dod fad]

   %66
   r si, [si si]\mbreak
   r la [la re]
   R2*7

   %75
   r4 r8 fad,\p
   fad[(sol) sol-. mi-.]
   re16(mi) fad8\staccatissimo r fad

   %78
   fad[(sol) sol-. mi-.]
   fad16(sol) la8\staccatissimo r4
   R2*9

   %89
   la'2\f
   sol8-.[fad-. mi-. re-.]\mbreak
   dod[-. si-. la-. sol-.]

   %92
   fad[re' re re]
   \appoggiatura mi re dod16 re mi8 sol
   fad16 re dod re si re dod re

   %95
   la re dod re sol, re' dod re
   fad,8[re' re re]
   \appoggiatura mi re dod16 re mi8 sol,

   %98
   fad16 la si la sold si dod si\mbreak
   la dod re dod si re mi re
   dod8[la' la la]

   %101
   sold8.(la32 si) la8 la
   sold8.(la32 si) la8 la,16(si)
   dod re mi re dod si la sol

   %104
   fad8[re'\p re re]
   dod8.(re32 mi) re8 re\mbreak
   dod8.(re32 mi) re8 fad16\f (sol)

   %107
   la16 sol fad mi re do! si la
   si8 sol'\staccatissimo r si,
   la16 fad' mi fad sol, mi' re mi

   %110
   fad,8 re'\staccatissimo r fad,
   mi16 si' la si re, fad mi re
   dod8[la' re, sol]\mbreak

   %113
   fad8.\tr(mi32 fad) sol8 mi
   re4\staccatissimo r4
   R2*3

   %118
   r8 la'\p la,4\tr
   r8 la' la,4\tr
   R2*5

   %125
   r8 re'\p re,4\tr
   r8 re' re,4\tr
   r8 sol[sol sol]\mbreak

   %128
   sol sol'16(mi) do8 si
   la[la la la]
   la la'16(fad) re8 do

   %131
   si[si si si]
   si[si' sol mi]
   si[si si si]

   %134
   si[si sol sol]\mbreak
   mi[mi' do la]
   \once\stemUp fad[si' fad red]

   %137
   r4 sol
   r sol
   fad si

   %140
   r fad
   r8 sol[sol sol]
   r sol[si sol]\mbreak %%%fine prima pagina

   %143
   r8 fad[fad fad]
   r fad [si fad]
   sol2~

   %146
   sol
   fad~
   fad

   %149
   mi~
   mi
   red

   %152
   R2*7\mbreak
   r8 mi\f[mi mi]
   red8.(mi32 fad) mi8 mi

   %161
   red8.(mi32 fad) mi8 sol16 (la)
   si la sol fad  mi re! do si
   do8 la'\staccatissimo r do,

   %164
   si16 sol' fad sol la, fad' mi fad\mbreak
   sol,8 mi'\staccatissimo r sol,
   fad16 mi fad sol mi sol fad mi

   %167
   red8 [si' mi, la]
   sol8.\tr(fad32 sol) la8 fad
   mi r si'4\p(

   %170
   la sol)
   fad8.\tr(mi32 fad) sol8 sol\mbreak
   fad8.\tr(mi32 fad) sol8 sol

   %173
   fad16\tr(mi) fad sol la8 la
   la[la sol fad]
   sol16(fad) sol la si8 si

   %176
   si[si la sol]
   red16(dod) red mi fad8 fad
   fad[fad mi red]

   %179
   R2*2\mbreak
   r4 re'\p(
   do si)

   %183
   la8.\tr(sol32 la) si8 si
   la8.\tr (sol32 la) si8 si
   la16(sol) la si do8 do

   %186
   do[do si la]
   si16(la) si do re8 re
   re[re do si]

   %189
   fad16(mi) fad sol la8 la\mbreak
   la[[la sol fad]
   \once\stemUp sol[si' si si]

   %192
   r la[la re]
   r sol,[sol sol]
   r fad[fad si]

   %195
   r mi,[mi mi]
   r re[re sol]
   R2*6

   %203
   r4 re,\p
   mi fad
   sol r\mbreak

   %206
   R2
   re'\f
   do8-.[si-. la-. sol-.]

   %209
   fad-.[mi-. re-. do-.]
   si4 r
   R2*4

   %215
   r16 sol'\f fad sol  mi sol fad sol
   re sol fad sol do, sol' fad sol
   si,4 r

   %218
   R2*3
   r8 re'\f[re re]\mbreak
   dod8.(re32 mi) re8 re

   %223
   dod8.(re32 mi) re8 fad16 (sol)
   la sol fad mi re do! si la
   si4 r

   %226
   r8 re \p re,4\tr
   r8 re' re,4\tr
   R2*10

   %238
   r4 r8 si'\p
   si[(do) do-. la-.]\mbreak
   sol16(la) si8\staccatissimo r si

   %241
   si[(do) do-. la-.]
   si16(do) re8\staccatissimo r4
   r mi(

   %244
   sol do)
   r re,(
   sol si)

   %247
   r do,(
   fad la)
   R2*7

   %256
   r8 sol\f[sol sol]\mbreak
   fad8.(sol32 la) sol8 sol
   fad8.(sol32 la) sol8 si16 do

   %259
   re do si la sol fa mi re
   mi8 do' r mi,
   re16 si' la si do, la' sol la

   %262
   si,8 sol'\staccatissimo  r si,
   la16 mi' re mi sol, si la sol\mbreak
   fad8 re' sol, do

   %265
   si8.\tr(la32 si) do8 la
   sol4\staccatissimo r8 re'\p
   re[(mi) mi-. do-.]

   %268
   si16(do) re8\staccatissimo r re
   re[(mi) mi-. fad-.]
   sol16 (la) si8\staccatissimo r4

   %271
   mi,,2\f
   do'\mbreak
   si16 re do si la sol fad  mi

   %274
   re mi fad re sol8 do,
   si[sol' do, re]
   \once\stemUp sol, si''16(do32 re) do8 la

   %277
   \once\stemDown si[si,, do re]
   sol,4\fermata r

}

IIIvlIIn = \relative do'' {

   re2
   do8-. [si-. la-. sol-.]
   fad-.[mi-. re-. do-.]
   si[sol' sol sol]

   %5
   \appoggiatura la sol fad16 sol la8 do
   si16 sol fad sol mi sol fad sol
   re sol fad sol do, sol' fad sol\mbreak

   %8
   si,8[sol' sol sol]
   \appoggiatura la sol fad16 sol la8 do
   si16 re mi re dod mi fad mi

   %11
   re fad sol fad mi sol la sol
   fad4 r
   r8 la,\p la,4\tr

   %14
   r8 la'[la, fad''16\f sol]
   la sol fad  mi re do! si la
   si4 r

   %17
   r8 re\p re,4\tr \mbreak
   r8 re'[re, si''16\f(do)]
   re16 do si la sol fa mi re

   %20
   mi8 do'\staccatissimo r mi,
   re16 si' la si do, la' sol la
   si,8 sol'\staccatissimo r si,

   %23
   la16 mi' re mi sol, si la sol
   fad8 re' sol, do\mbreak
   si8.\tr(la32 si) do8 la

   %26
   sol4\staccatissimo r8 si\p
   si[(do) do-. la-.]
   sol16 (la) si8\staccatissimo r si

   %29
   si[(do) do-. la-.]
   si16(do) re8\staccatissimo r4
   mi,2\f

   %32
   do'
   si16 re do si la sol fad mi
   re mi fad re sol8 do,\mbreak

   %35
   si [sol' do, re]
   \once\stemUp sol, sol''16(la32 si) la8 fad
   \once\stemDown sol[si,, do re]

   %38
   sol,4 r
   R2*5
   r16 sol'\f fad sol mi sol fad sol

   %45
   re sol fad sol do, sol' fad sol
   si,4 r
   R2*3\mbreak

   %50
   r4 r8 fad'\p
   mi8.(fad32 sol) fad8 fad
   mi8.(fad32 sol) fad8 r

   %53
   R2*7
   r4 la,\p
   si dod

   %62
   re8[re' re re]
   re[re dod dod]
   si [si si si]

   %65
   si[si la la]\mbreak
   sol[sol sol sol]
   sol[sol fad fad]

   %68
   R2*7
   r8 re\p[re re]
   re[re re re]

   %77
   re[re re re]
   re[re re re]
   re[re re re]

   %80
   R2*9
   la''2\f
   sol8-.[fad-. mi-. re-.]\mbreak
   dod[-. si-. la-. sol-.]

   %92
   fad[re' re re]
   \appoggiatura mi re dod16 re mi8 sol
   fad16 re dod re si re dod re

   %95
   la re dod re sol, re' dod re
   fad,8[re' re re]
   \appoggiatura mi re dod16 re mi8 sol,

   %98
   fad16 la si la sold si dod si\mbreak
   la dod re dod si re mi re
   dod8[la' la la]

   %101
   sold8.(la32 si) la8 la
   sold8.(la32 si) la8 la,16(si)
   dod re mi re dod si la sol

   %104
   fad4 r
   r8 la\p la,4\tr \mbreak
   r8 la'[la, fad''16\f(sol)]

   %107
   la16 sol fad mi re do! si la
   si8 sol'\staccatissimo r si,
   la16 fad' mi fad sol, mi' re mi

   %110
   fad,8 re'\staccatissimo r fad,
   mi16 si' la si re, fad mi re
   dod8[la' re, sol]\mbreak

   %113
   fad8.\tr(mi32 fad) sol8 mi
   re4\staccatissimo r4
   R2*2

   %117
   r4 r8 fad\p
   mi8.(fad32 sol) fad8 fad
   mi8.(fad32 sol) fad8 r

   %120
   R2*4
   r4 r8 si,\p
   la8.(si32 do) si8 si\mbreak

   %126
   la8.(si32 do) si8 si
   r si[si si]
   do[do do do]

   %129
   dod[dod dod dod]
   re[re re re]
   red[red red red]

   %132
   mi[mi mi mi]
   red[red red red]
   mi[mi mi mi]

   %135
   la,[la la la]\mbreak
   si4 si'
   r si

   %138
   r si
   si fad
   r si

   %141
   r8 si[sol si]
   r si[si si]
   r8 si[fad si]

   %144
   r si[si si]
   r si[mi si]
   do2~

   %147
   do\mbreak
   si~
   si

   %150
   la~
   la
   R2*7

   %159
   r8 mi'\f[mi mi]
   red8.(mi32 fad) mi8 mi
   red8.(mi32 fad) mi8 sol16 (la)

   %162
   si la sol fad  mi re! do si
   do8 la'\staccatissimo r do,
   si16 sol' fad sol la, fad' mi fad\mbreak

   %165
   sol,8 mi'\staccatissimo r sol,
   fad16 mi fad sol mi sol fad mi
   red8 [si' mi, la]

   %168
   sol8.\tr(fad32 sol) la8 fad
   mi r r4
   R2\mbreak

   %171
   si\p~
   si
   r8 si[si si]

   %174
   si[si si si]
   si[si si si]
   si[si si si]

   %177
   si[si si si]
   si[si si si]
   R2*4

   %183
   re2\p~
   re
   r8 re[re re]

   %186
   re[re re re]\mbreak
   re[re re re]
   re[re re re]

   %189
   re[re re re]
   re[re re re]
   sol[sol' sol sol]

   %192
   sol[sol fad fad]
   mi[mi mi mi]
   mi[mi re re]

   %195
   do[do do do]
   do[do si si]
   R2*6\mbreak

   %203
   r4 re,\p
   mi fad
   sol r\mbreak

   %206
   R2
   re'\f
   do8-.[si-. la-. sol-.]

   %209
   fad-.[mi-. re-. do-.]
   si4 r
   R2*4

   %215
   r16 sol'\f fad sol  mi sol fad sol
   re sol fad sol do, sol' fad sol
   si,4 r

   %218
   R2*3
   r8 re'\f[re re]\mbreak
   dod8.(re32 mi) re8 re

   %223
   dod8.(re32 mi) re8 fad16 (sol)
   la sol fad mi re do! si la
   si4 r8 si,\p

   %226
   la8.(si32 do) si8 si
   la8.(si32 do) si8 si\mbreak
   R2*10

   %238
   r8 sol'\p[sol sol]
   sol[sol sol sol]
   sol[sol sol sol]

   %241
   sol[sol sol sol]
   sol[sol sol sol]
   r4 do(

   %244
   mi sol)
   r sol,(
   re' sol)

   %247
   r la,(\mbreak
   do fad)
   R2*7

   %256
   r8 sol\f[sol sol]\mbreak
   fad8.(sol32 la) sol8 sol
   fad8.(sol32 la) sol8 si16 do

   %259
   re do si la sol fa mi re
   mi8 do' r mi,
   re16 si' la si do, la' sol la

   %262
   si,8 sol'\staccatissimo  r si,
   la16 mi' re mi sol, si la sol\mbreak
   fad8 re' sol, do

   %265
   si8.\tr(la32 si) do8 la
   sol4\staccatissimo r8 si\p
   si[(do) do-. la-.]

   %268
   sol16(la) si8\staccatissimo r si
   si[(do) do-. si-.]
   si16 (do) re8\staccatissimo r4

   %271
   mi,2\f
   do'\mbreak
   si16 re do si la sol fad  mi

   %274
   re mi fad re sol8 do,
   si[sol' do, re]
   \once\stemUp sol, sol''16(la32 si) la8 fad

   %277
   \once\stemDown sol[si,, do re]
   sol,4\fermata r

}

IIIvlan = \relative do' {

   re'2
   do8-. [si-. la-. sol-.]
   fad-.[mi-. re-. do-.]

   %4
   si[do re mi]
   re[re re re]
   re16 sol fad sol mi sol fad sol

   %7
   re sol fad sol do, sol' fad sol\mbreak
   si,8[do re mi]
   re[re re re]

   %10
   re[si' mi, dod']
   fad,[re la' la]
   la4 r8 fad\p

   %13
   mi8.(fad32 sol) fad8 fad
   mi8.(fad32 sol) fad8 la\f
   re,[fad sol la]\mbreak

   %16
   re,4 r8 si\p
   la8. (si32 do) si8 si
   la8.(si32 do) \once\stemUp si8 re'\f

   %19
   sol,[si do re]
   sol, mi16 fad sol8 sol
   sol[sol mi fad]

   %22
   sol si,16 do re8 re
   mi[mi mi mi]
   la, la si fad'

   %25
   sol8.\tr(fad32 sol) la8 fad
   sol[sol sol\p sol]
   sol[sol sol sol]

   %28
   sol[sol sol sol]
   sol[sol sol sol]
   sol[sol sol sol]

   %31
   do,2\f
   mi8 la16 sol fad sol la fad\mbreak
   re8 mi16 re do si la sol

   %34
   fad8[la si fad]
   sol[sol' do, re]
   sol,4 r

   %37
   r8 si[do re]
   sol,4 r
   R2*5

   %44
   r16 sol'\f fad sol mi sol fad sol\mbreak
   re sol fad sol do, sol' fad sol
   si,4 r

   %47
   R2*3
   r4 r8 fad'\p
   mi8.(fad32 sol) fad8 fad

   %52
   mi8.(fad32 sol) fad8 r
   R2*7
   r4 la,\p\mbreak

   %61
   si dod
   re2
   la'4~la8. la,16

   %64
   si2
   fad'4~fad8. fad,16
   sol2

   %67
   re'
   R2*21
   r8 fad\f[re fad]\mbreak

   %90
   si[la si sol]
   mi[re mi dod]
   re fad16 sol la8 si

   %93
   la[la la la]
   la16 re dod re si re dod re
   la re dod re sol, re' dod re

   %96
   fad,8 [sol la si]\mbreak
   la[la la, la]
   la fad' si, sold'

   %99
   dod, la mi' mi
   mi4 r
   r8 mi' mi,4\tr

   %102
   r8 mi'[mi, mi]
   mi[mi mi mi]
   re4 r8 fad\p\mbreak

   %105
   mi8.(fad32 sol) fad8 fad
   mi8.(fad32 sol) fad8 la\f
   re,[fad sol la]

   %108
   re, si16(dod) re8 re
   re[re si dod]
   re fad,16 (sol) la8 la

   %111
   si[si si si]
   mi,[mi fad dod']\mbreak
   re8.(dod32 re) mi8 dod

   %114
   re4 r
   R2*2
   r4 r8 fad\p

   %118
   mi8.(fad32 sol) fad8 fad
   mi8.(fad32 sol) fad8 r
   R2*4

   %124
   r4 r8 si,\p\mbreak
   la8.(si32 do) si8 si
   la8.(si32 do) si8 si

   %127
   R2*33
   r8 si'\f si,4\tr
   r8 si'[si, si']

   %162
   mi,[sol la si]
   mi,[mi re re]\mbreak
   re[re fad fad]

   %165
   si, sol16 la si8 si
   do[do dod dod]
   fad,[fad sol red']

   %168
   mi8.\tr(red32 mi) fad8 red
   mi4 r
   R2

   %171
   si2\p~
   si\mbreak
   R2*10

   %183
   re2\p~
   re
   R2*6

   %191
   sol2\p
   re'4~re8. re,16
   mi2

   %194
   si'4~si8. si,16
   do2
   sol'

   %197
   R2*6\mbreak
   r4 re\p
   mi fad

   %205
   sol r
   R2
   re'2\f

   %208
   do8-. [si-. la-. sol-.]
   fad-.[mi-. re-. do-.]
   si4 r

   %211
   R2*4
   r16 sol'\f fad sol mi sol fad sol
   re sol fad sol do, sol' fad sol\mbreak

   %217
   si,4 r
   R2*4
   r8 la' \f la,4\tr

   %223
   r8 la'[la, la']
   re,[fad sol la]
   re,4 r8 si\p

   %226
   la8.(si32 do) si8 si\mbreak
   la8.(si32 do) si8 si
   R2*29

   %257
   r8 re'\f re,4\tr
   r8 re'[re, re']
   sol,[si do re]

   %260
   sol, mi16 fad sol8 sol
   sol[sol mi fad]\mbreak
   sol si,16 do re8 re

   %263
   mi[mi mi mi]
   la,8 la si fad'
   sol8.\tr(fad32 sol) la8 fad

   %266
   sol[sol sol\p sol]
   sol[sol sol sol]
   sol[sol sol sol]

   %269
   sol[sol sol sol]
   sol[sol sol sol]
   do,2\f

   %272
   mi8 la16 sol fad sol la fad
   re8 mi16 re do si la sol
   fad8[la si fad]

   %275
   sol[sol' do, re]
   sol,4 r
   r8 si[do re]

   %278
   sol,4\fermata r

}

IIIcbn = \relative do {

   r8 sol[si sol]
   la[si do la]
   re[mi fad re]

   %4
   sol[la si do]
   si[sol fad re]
   sol[si,  do do]

   %7
   si[si la la]\mbreak
   sol[la si do]
   si[sol' fad re]

   %10
   sol[sol la la]
   si[si dod dod]
   re4 r

   %13
   R2
   r4 r8 re,16\f mi
   fad8[re mi fad]

   %16
   sol4 r
   R2
   r4 r8 sol16\f(la)\mbreak

   %19
   si8[sol la si]
   do[do mi, do']
   si[sol la re,]

   %22
   sol[sol si, sol']
   do,[do dod dod]
   re[do! si la]

   %25
   sol[sol' do, re]
   sol,4\staccatissimo r
   R2*4\mbreak

   %31
   r8 do'16 re mi re do si
   la sol fad mi re mi fad re
   sol8 sol, do4~

   %34
   do8[do si la]
   sol[sol' do, re]
   sol,4 r

   %37
   r8 si[do re]
   sol,4 r\mbreak
   R2*5
   r8 si\f  [do do]
   si[si la la]

   %46
   sol4 r
   R2*42
   r8 re'\f[fad re]\mbreak

   %90
   mi[fad sol mi]
   la[si dod la]
   re,[mi fad sol]

   %93
   fad re dod la
   re[fad sol sol]
   fad[fad mi mi]

   %96
   re[mi fad sol]\mbreak
   fad[re dod la]
   re[re mi mi]

   %99
   fad[fad sold sold]
   la4 r8 dod,
   si8.(dod32 re) dod8 dod

   %102
   si8.(dod32 re) dod8 dod
   la dod16(si) la8 dod
   re4 r

   %105
   R2
   r4 r8 re16\f mi\mbreak
   fad8[re mi fad]

   %108
   sol[sol si, sol']
   fad re mi la,
   re[re fad, re']

   %111
   sol,[sol sold sold]
   la[sol! fad mi]
   re re' sol, la

   %114
   re,4 r
   R2*44
   r4 r8 sol'\f

   %160
   fad8.(sol32 la) sol8 sol
   fad8.(sol32 la) sol8 mi16 fad
   sol8[mi fad sold]

   %163
   la la16 sol! fad mi fad re\mbreak
   sol8[sol red red]
   mi[mi sol, mi']

   %166
   la,[la lad lad]
   si[la! sol fad]
   mi mi' la, si

   %169
   mi,4 r
   R2*37
   r8 sol\f[si sol]

   %208
   la[si do la]
   re[mi fad re]
   sol4 r

   %211
   R2*4
   r8 si,\f  [do do]
   si[si la la]

   %217
   sol4 r
   R2*3
   r4 r8 fad'\f
   mi8.(fad32 sol) re8 re

   %223
   mi8.(fad32 sol) fad8 re16 mi
   fad8[re mi fad]
   sol4 r

   %226
   R2*30
   r4 r8 si\f
   la8.(si32 do) si8 si
   la8. (si32 do) si8 sol16 la\mbreak

   %259
   si8[sol la si]
   do[do mi, do']
   si[sol la re,]

   %262
   sol[sol si, sol']
   do,[do dod dod]
   re[do! si la]

   %265
   sol[sol' do, re]
   sol,4\staccatissimo r
   R2*4

   %271
   r8 do'16\f re mi re do si
   la sol fad mi re mi fad re\mbreak
   sol8 sol, do4~

   %274
   do8 [do si la]
   sol [sol' do, re]
   sol,4 r

   %277
   r8 si[do re]
   sol,4 \fermata r

}

IIIbcn = \relative do {

   r8 sol[si sol]
   la[si do la]
   re[mi fad re]

   %4
   sol[la si do]
   si[sol fad re]
   sol[si,  do do]

   %7
   si[si la la]\mbreak
   sol[la si do]
   si[sol' fad re]

   %10
   sol[sol la la]
   si[si dod dod]
   re4 r

   %13
   R2
   r4 r8 re,16\f mi
   fad8[re mi fad]

   %16
   sol4 r
   R2
   r4 r8 sol16\f(la)\mbreak

   %19
   si8[sol la si]
   do[do mi, do']
   si[sol la re,]

   %22
   sol[sol si, sol']
   do,[do dod dod]
   re[do! si la]

   %25
   sol[sol' do, re]
   sol,4\staccatissimo r
   R2*4\mbreak

   %31
   r8 do'16 re mi re do si
   la sol fad mi re mi fad re
   sol8 sol, do4~

   %34
   do8[do si la]
   sol[sol' do, re]
   sol,4 r

   %37
   r8 si[do re]
   sol,4 r\mbreak
   r8 sol[si sol]

   %40
   la[si do la]
   re[mi fad re]
   sol[la si do]

   %43
   si[sol fad re]
   sol[si,\f  do do]
   si[si la la]

   %46
   sol[la\p si do]
   si[sol' fad re]\mbreak
   sol[sol la la]

   %49
   si[si dod dod]
   re4 r
   R2

   %52
   r4 r8 re,16\p mi
   fad8[re mi fad]
   sol[sol sol fad]

   %55
   mi[re dod re]
   sol[sol sold sold]\mbreak
   la[la, dod la]

   %58
   re4 la
   si dod
   re r

   %61
   R2*6
   r4 r8 re\p
   mi4 r8 re

   %69
   dod4 r8 si
   la[la dod dod]\mbreak
   re[re sol sol]

   %72
   la[la dod dod]
   re[fad, sol mi]
   la[la la la]

   %75
   re,4\staccatissimo r
   R2*4
   r8 sol,\p[sol' fad]

   %81
   mi re dod la
   re[fad sol la]\mbreak
   re,[fad sol la]

   %84
   re,[mi fad sol]
   la,[si dod re]
   mi4 la

   %87
   re,8[la' si dod]
   re[fad, sol la]
   r re,\f[fad re]\mbreak

   %90
   mi[fad sol mi]
   la[si dod la]
   re,[mi fad sol]

   %93
   fad re dod la
   re[fad sol sol]
   fad[fad mi mi]

   %96
   re[mi fad sol]\mbreak
   fad[re dod la]
   re[re mi mi]

   %99
   fad[fad sold sold]
   la4 r8 dod,
   si8.(dod32 re) dod8 dod

   %102
   si8.(dod32 re) dod8 dod
   la dod16(si) la8 dod
   re4 r

   %105
   R2
   r4 r8 re16\f mi\mbreak
   fad8[re mi fad]

   %108
   sol[sol si, sol']
   fad re mi la,
   re[re fad, re']

   %111
   sol,[sol sold sold]
   la[sol! fad mi]
   re re' sol, la

   %114
   re, re'\p[fad re]
   mi[fad sol mi]\mbreak
   la[si dod la]

   %117
   re4 r
   R2
   r4 r8 re\p

   %120
   re,[re' do! do]
   si[sol, si sol]
   la[si do la]

   %123
   re[mi fad re]
   sol4 r
   R2*11

   %136
   r8 si,\p [red si]
   mi[mi mi mi]
   mi[mi mi mi]

   %139
   red[red red red]
   red?[red red red]
   mi[mi mi mi]

   %142
   mi[mi mi mi]
   red[red red red]
   red?[red red red]

   %145
   mi[mi mi mi]
   la2
   re

   %148
   sol,
   do
   fad,

   %151
   si
   mi,8[mi mi mi]
   red si r red'

   %154
   mi[mi mi mi]
   red[si dod red]\mbreak
   mi[mi la, la]

   %157
   si[si red, red]
   mi[sol la si]
   mi,4 r8 sol\f

   %160
   fad8.(sol32 la) sol8 sol
   fad8.(sol32 la) sol8 mi16 fad
   sol8[mi fad sold]

   %163
   la la16 sol! fad mi fad re\mbreak
   sol8[sol red red]
   mi[mi sol, mi']

   %166
   la,[la lad lad]
   si[la! sol fad]
   mi mi' la, si

   %169
   mi,4 r
   R2
   r8 si''^\p[sol mi]

   %172
   si[si' sol mi]\mbreak
   si4 r
   R2*4

   %178
   r4 r8 si^\p
   mi[mi mi mi]
   fad[fad fad fad]

   %181
   sol4 r
   R2
   r8 re'\p[si sol]

   %184
   re[re' si sol]
   re4 r\mbreak
   R2*10

   %196
   r4 r8 sol\p
   la[la la la]
   si[si si si]

   %199
   fad[fad fad fad]
   sol[sol sol sol]
   la[la la do]

   %202
   re,[re re fad]
   sol4 r
   R2

   %205
   r4 re\p
   mi fad\mbreak
   sol8 sol,\f[si sol]

   %208
   la[si do la]
   re[mi fad re]
   sol[sol,\p si sol]

   %211
   la[si do la]
   re[mi fad re]
   sol[la si do]

   %214
   si[sol fad re]
   sol[si,\f  do do]
   si[si la la]

   %217
   sol\p[la si do]\mbreak
   si[sol' fad re]
   sol[sol la la]

   %220
   si[si dod dod]
   re4 r8 fad,\f
   mi8.(fad32 sol) re8 re

   %223
   mi8.(fad32 sol) fad8 re16 mi
   fad8[re mi fad]
   sol4 r

   %226
   R2
   r4 r8 sol,16\p la
   si8[sol la si]

   %229
   do[do re re]\mbreak
   mi[mi fad fad]
   sol[sol sol sol]

   %232
   fad[fad fad fad]
   mi[mi mi mi]
   re4 re

   %235
   re re
   re8[re mi fad]
   sol[si do re]

   %238
   sol,4 r
   R2*4
   do8\p[do do do]

   %244
   do[do do do]
   si[si si si]
   si[si si si]\mbreak

   %247
   la[la la la]
   re,[re re re]
   sol[si do re]

   %250
   sol,[si, do re]
   sol,[la si do]
   re[mi fad sol]

   %253
   la4 re
   sol,8[re mi fad]
   sol[si, do re]

   %256
   sol,4 r8 si'\f
   la8.(si32 do) si8 si
   la8. (si32 do) si8 sol16 la\mbreak

   %259
   si8[sol la si]
   do[do mi, do']
   si[sol la re,]

   %262
   sol[sol si, sol']
   do,[do dod dod]
   re[do! si la]

   %265
   sol[sol' do, re]
   sol,4\staccatissimo r
   R2*4

   %271
   r8 do'16\f re mi re do si
   la sol fad mi re mi fad re\mbreak
   sol8 sol, do4~

   %274
   do8 [do si la]
   sol [sol' do, re]
   sol,4 r

   %277
   r8 si[do re]
   sol,4 \fermata r

}


IIIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*4
    <6>4 <6>
    s2
    <6>4 <6>
    s2
    <6>4 <6>
    s <_+>
    s <6>
    s2*3
    <6>2
    s2*3
    <6>2
    s4 <6>
    <6> <6>
    s <6>
    <6> <6 5>
    s8 s <6> <6>
    s4 <6 5>
    s2*6
    s4 <7>
    s <6>
    <4 2> <6>8 <6>
    s4 <6 5>
    s2
    s8 <6> <6 5>4
    s2*5
    <6>4 <6>
    s2
    <6>4 <6>
    s2
    <6>4 <6>
    s2
    s4 <6>
    s2*3
    <6>2
    s4 s8 <6>
    s4 <6 5>
    <6> s8 <5>
    <_+>2
    s4 <_+>
    <7> <6 5>
    s2*8
    s4 s8 <4 2>
    <5>4 s8 <6>
    <7 _+>2
    s
    <_+>4 <6>
    s2
    <6 4>4 <5 _+>
    s2*6
    s4 <6 5>
    s <6 5>8 <_+>
    s2
    s
    <_+>
    s4 <7 _+>
    s8 <_+> <7> <6 5>
    s4 <6 5>8 <_+>
    s2
    s
    <_+>
    s
    <6>4 <6>
    s2
    <6>4 <6\\>
    s2
    <6>4 <6>
    s <_+>
    s <6>
    <_+> s8 <6>
    <6\\>4  <6>
    <6\\> <6>
    <_+> s
    s2*3
    <6>2
    s4 <6>
    <6> <6\\>
    s <6>
    <6> <5>
    <_+> <6>8 <6\\>
    s4 <6 5>8 <_+>
    s2
    s
    <_+>
    s2*3
    s4 <4 2>
    <6>2
    s2*14
    <_+>2
    s
    s
    <6>
    s2*3
    <6>2
    s2*2
    <7>2
    <7>
    <7>
    <7>
    <7>
    <7 _+>
    s
    <6>
    s4 s8 <4\+ 2>
    <6>4 <7>8 <6 5>
    s2
    <_+>
    s4 <6 5>8 <_+>
    s4 s8 <6>
    <6\\>4 <6>
    <6\\> <6>
    s <7>8 <6 5>
    s4 <6 5>
    s <6 5>
    s <6>
    <6> <5>
    <_+> <6>8 <6\\>
    s4 <6 5>8 <_+>
    s2*2
    s8 <_+> <6>4
    <_+> <6>
    <_+>2
    s2*4
    s4 s8 <_+>
    s2
    <6>
    s
    s
    s4 <6>
    s <6>
    s2*12
    <6>2
    <6>
    <6>
    s2*6
    <7>4 <6 5>
    s2*7


    <6>4 <6>
    s2
    <6>4 <6>
    s2
    <6>4 <6>
    s <_+>
    s <6>
    s4 s8 <6>
    <6\\>4 <6>
    <6\\>4 <6>
    <6>2
    s2*3
    <6>2
    s
    s4 <6>
    s <6>
    <7> <6>
    <7> <6>
    <7> <6 4>
    <5 3> <6 4>
    <5 3> <7>8 <6 5>
    s4 <6 5>
    s2*7
    <6>2
    s
    s
    <7>
    s4 <6 5>
    s2*3
    s4 <7>
    s <7>8 <6 5>
    s <6 5> s4
    s s8 <6>
    <6>4 <6>
    <6> <6>
    <6>2
    s4 <6>
    <6> <6>
    s <6>
    <6> <5>
    s4 <6>8 <6>
    s4 <6 5>
    s2*6
    s4 <7>
    s <6>
    <4 2> <6>8 <6>
    s4 <6 5>
    s2
    s8 <6> <6 5>

}

forma = {
    \key sol\major
    \time 2/4
    \tempo 2 = 60
    s2*278
    \bar "|."

}

IIIfl = {
    \IIIglobal
    %\notypeset
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

IIIcb = {
    \IIIglobal
    \clef bass
    <<\IIIcbn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 16.7)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

    \markup\huge "[1.] Allegro"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Flauto""Traversiero"}
                    \set Staff.midiInstrument = #"flute"
                    \Ifl
                >>

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Violetta"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Basso""Ripieno"}
                \set Staff.midiInstrument = #"contrabass"
                \Icb
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Basso"}
                \set Staff.midiInstrument = #"cello"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

    \markup\huge "[2.] Arioso e mesto con Sordini"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \IIfl
                >>

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \IIcb
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

    \markup\huge "[3.] Presto"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIfl
                >>

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \IIIcb
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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
