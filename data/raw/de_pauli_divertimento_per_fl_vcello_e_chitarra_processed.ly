\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

MyCadenza = \relative do'' {

\cadenzaOn

    re16_\markup\italic "a piacere" [(dod) mi(re) fad(mi) sol(fad) la(sol) si(la) do!(si) re(do) mi(re) fad(mi) sol(fad) la\fermata(sol fad mi re do si la sol fad mi re do? si la sol fad mi)] \break re8\fermata [red16 mi (fa_\markup\italic "rallen - - - - - - - - - - - - - - - tan - - - - - - - - - -  - - - - - - do"  fad sol sold la lad si do dod re red mi fa)] fad4\fermata_\accent \bar "|."

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

dolce = _\markup \italic { dolce }

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

notypeset = \set Score.skipTypesetting = ##t

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
      \musicglyph "scripts.prall"}}
mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Ifln = \relative do'' {

    sol'16\f
    sol2.\fermata \slashedGrace la 8 sol16(fad) sol-. si-.
    re,4 \slashedGrace do'8 si16(la) si-. re-. sol,8[r16 sol] la8[r16 si]\mbreak
    re4._\accent (do8) la4 \slashedGrace si8 la16(sold) la-. do-.

    %4
    fad,4-. \slashedGrace sol8 fad16(mi) fad-. la-. re,8[r16 re] fad8.[la16]
    mi'4._\accent (re8) si4-. sol8._\accent (fad16)
    mi4-. la8._\accent (sol16) fad4-. re'8._\accent(do16)\mbreak

    %7
    si4 sol'_\accent~ sol8[mi-.] do-. la-.
    sol4 \appoggiatura {la16[sol]} fad8(sol) si4._\accent la8
    sol-.\ff re'16(do) si(la) sol-. fad-. sol(la) si-. fad-. la(sol) mi-. dod-.

    %10
    re8-. re16(mi) fad(sol) la-. si-. \mbreak re-. _\accent(do) la-. fad-. re(do) la-. fad-.
    sol8-.\noBeam re''16(do) si(la) sol-. fad-. sol(la) si-. fad-. la(sol) mi-. dod-.    re8-.\noBeam re16(mi) fad(sol) la-. si-. re_\accent (do) la-. fad-. re(do) la-. fad-.\mbreak

    %13
    sol(la si do re mi fad sol) dod,(re mi fad sol la si dod)
    re8-.\noBeam re16(dod_\accent) mi_\accent(re dod si) la(si) sol(la) fad(sol) mi(fad)
    re8-.\noBeam re'16(dod) mi_\accent (re dod si si_\accent  la fad re \mbreak la'_\accent sold sol mi)

    %16
    re2\fermata ~\MyCadenza

}

Ivcn = \relative do {

    sol'16\f
    sol2.\fermata r4
    sol r sol r
    re8 re' la[fad] re4 r

    %4
    re r fad r
    sol r sol r
    do, r re r\mbreak

    %7
    sol8 r sol4 r r
    sol r fad r
    sol8 r r4 <<{\stemNeutral dod,2(

                 %10
                 re4) r fad2(
                 sol8)}\\{s4 s_\accent
                         s s s s_\accent}>> r8 r4 <<{\stemNeutral dod,2(
                 re4)}\\{s4 s_\accent}>> r <<{\stemNeutral fad2(

                                              %13
                                              sol4)}\\{s4 s_\accent}>> r dod, r
    re r la8 [la'] mi[dod]\mbreak
    re4 r la8 la' mi[dod]

    %16
    re4 r \fermata
    #(skip-of-length MyCadenza)
    \bar "|."

}

Ichn = \relative do'' {

    <sol' si,sol re sol,>16\f
    <sol si, sol re sol,>2.\fermata r4
    sol,,16 si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    re, do' fad do la do fad do re, do' fad do la do fad do

    %4
    re, do' fad do la do fad do re, do' fad do la do fad do
    sol, si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    do,8 <mi' do sol> <mi do sol> <mi do sol> re, <fad' do la> <fad do la> <fad do la>

    %7
    <sol si, sol re sol,> r <sol si, sol re sol,>4 r r
    sol,,16 si' sol' si, sol si sol' si, re, do' fad do la do fad do
    <sol' si, sol re sol,>8 r r4\mbreak <sol dod, la sol la,>2

    %10
    <fad re la re,>4 r <fad do! la re,>2
    <sol si, sol re sol,>8 r r4\mbreak <sol dod, la sol la,>2
    <fad re la re,>4 r <fad do! la re,>2

    %13
    sol,,8 <sol'' si, sol> <sol si, sol> <sol si, sol> la,,  <sol'' dod,> <sol dod,>  <sol dod,>
    re, <fad' re la> <fad re la> <fad re la> la,, <sol'' dod, la> <sol dod, la> <sol dod, la>
    re, <fad' re la> <fad re la> <fad re la> la,, <sol'' dod, la> <sol dod, la> <sol dod, la>

    %16
    <fad re la re, fad,>4 r\fermata \salta
    \bar "|."

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 30
    \partial 16 s16
    s1*17
    %\bar"|."

}



Ifl = {
    \global
    %\notypeset
    <<\Ifln \forma>>

}

Ivc = {
    \global
    \clef bass
    <<\Ivcn \forma>>

}

Ich = {
    \global
    <<\Ichn \forma \Ibfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIfln = \relative do'' {

    r16 _\markup "Dol.[ce]" re[mi8. fad16]
    sol4. fad8 sol8. fad16 sol8. si16
    <<{\stemNeutral re2~re8. re16}\\{s4 s_\accent}>> mi8._\accent re16\mbreak
    <<{\stemNeutral la2~la8. la16}\\{s4 s_\accent}>> si8._\accent la16

    %4
    sol8-. do16 \> (si) la(sol fad mi) \! re8.  re16 mi8. fad16
    sol4. fad8 sol8. fad16 sol8. si16
    re2_\accent ~re8. re16 mi8. fad16

    %7
    sol2_\accent ~sol8. mi16 re8. dod16\mbreak
    re2_\accent r4 r8 sol,
    fad4.-. la16(do) mi4._\accent re8

    %10
    sol,4. si16(re) sol_\accent (fad mi re) do(si la sol)
    \tupletSpan 4 \con \tuplet 3/2 { fad8-. la\accent (sol) fad-.[do'(si)]  } la8\noBeam -. mi'16_\accent (re) mi_\accent [ (re) ] mi_\accent(re) \mbreak
    <<{\stemNeutral lad4~lad16 si(re do)}\\{s8 s_\accent}>> si8. re,16 mi8. fad16

    %13
    sol4. fad8 sol8. fad16 sol8. si16
    <<{\stemNeutral re2~re8. mi16}\\{s4 s_\accent}>> fad8. sol16
    sol8. re16 si8. sol16 re'8. do16 la8. fad16\mbreak

    %16
    sol4 si sol8

}

IIvcn = \relative do {

    r4 r8
    sol'4 r sol r
    sol r sol r
    re r re r

    %4
    sol,8 sol' re[si] sol4 r
    sol' r sol r
    sol r sol r\mbreak

    %7
    dod, r la r
    re8 re' la[fad] re r r4
    re4_\markup "pizzic.[ato]" r fad re

    %10
    sol r sol r
    re mi re r
    sol,8 sol' re[si] sol4 r

    %13
    sol' r sol r
    sol r sol r
    sol r re r

    %16
    sol,8[sol'] re si sol\noBeam

}


IIchn = \relative do'' {

    r4 r8
    sol,16 si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    sol, si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    re, do' fad do la do fad do re, do' fad do la do fad do

    %4
    sol, si' sol' si, sol si sol' si, sol4 r\mbreak
    sol,16 si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    sol, si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,

    %7
    la, dod' mi dod la dod mi dod la, dod' mi dod la dod mi dod
    re, re' fad re la re fad re <fad re la re,>8 r r4
    re,16 do' fad do la do fad do re, do' fad do la do fad do\mbreak

    %10
    sol, si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    re, do' fad do la do fad do re, do' fad do la do fad do
    sol, si' sol' si, sol si sol' si,  \once\stemUp <sol' si, sol re>8 r r4

    %13
    sol,,16 si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    sol, si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    sol, si' sol' si, sol si sol' si, re, do' fad do la do fad do

    %16
    sol, si' sol' si, sol si sol' si,  <sol' si, sol re sol,>8

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 40
    \partial 4. s4.
    s1*15
    s2 s8
    \bar"|."

}



IIfl = {
    \global
    %\notypeset
    <<\IIfln \forma>>

}

IIvc = {
    \global
    \clef bass
    <<\IIvcn \forma>>

}

IIch = {
    \global
    <<\IIchn \forma \IIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \con
}

IIIfln = \relative do'' {

    \tuplet 3/2 { re8(mi) fad-.
    \once\stemDown sol-.re,(si') sol-.[re'(si)] \senza sol'(re) si'-. sol-.[re'_\accent(si)]
    sol'\>(fad mi re\![do si)] mi\> (re do si\![la sol)]\mbreak
    fad_\accent (mi) re-. la'_\accent [(sol) fad-.] do'_\accent (si) la-. sol[(fad) la-._\accent ]

    %4
    sol-. si\> (la sol[fad mi] re\! do si la[sol fad]
    sol) re (si') sol-.[re'(si)] sol'(re) si'-. sol[(re') si-.]
    sol'_\accent (fad mi re[do si)] mi_\accent (re do si[la sol)] \mbreak

    %7
    dod,_\accent (si la) mi'_\accent [(re dod)] sol'_\accent  (fad mi) si'_\accent (la) dod,8-.]
    re(fad) la-. re_\accent [(la) fad-.]}  re4-. \tuplet 3/2 { re8(dod) re-.
    mib'_\accent (do?) la-. fad[(la) mib-._\accent] re(fad) la-. re_\accent[(do) la-.]

    %10
    sol-. sol,(si re[sol si)] re_\accent (si) sol-. sol'_\accent [(re) si-.]
    do-. sold_\accent (la) la-[mid_\accent (fad)]\mbreak fad-. dod_\accent (re) re-.[la_\accent (do!)]
    si(do dod) re[(mi re)] re-. re-.\< mi-. fad sol-. la-.]\!

   %13
   \stemDown sol-.\stemUp re,(si')\stemNeutral  sol-.[re'(si)] sol'(re) si'-._\accent sol-.[re'_\accent(si)]
    sol'_\accent(fad mi re[do si)] mi_\accent (re do si\![la sol)]
    si-. re_\accent (dod) re_\accent[(si) sol-.] la-. do_\accent (si) do_\accent[(la) fad-.]

    %16
    sol(re')_\accent si-. sol-.[re-. si-.]} sol4

}

IIIvcn = \relative do {

    \tuplet 3/2 { r4 r8 }
    sol r sol' r re r si r
    sol r re' r si r sol r
    re' r re' r do r la r

    %4
    sol4 r r2
    sol,8 r sol' r re r si r\mbreak
    sol r re' r si r sol r

    %7
    dod r dod r dod r dod r
    \senza \tuplet 3/2 { re8 re' la fad[la fad] } re4 r
    re8 r re r re r re r

    %10
    sol r sol r sol r sol r
    re r re r re r re r
    sol4 r r2

    %13
    sol,8 r sol' r \mbreak re r si r
    sol r re' r si r sol r
    <si sol> r sol' r re r re' r

    %16
    sol,, sol' re[si] sol4

}


IIIchn = \relative do'' {

    \tuplet 3/2 { r4 r8 }
    <sol' si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r
    <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r
    <fad do la re, fad,> r <fad do la re, fad,> r <fad do la re, fad,> r <fad do la re, fad,> r

    %4
    <sol si, sol re sol,>4 r r2
    <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r
    <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r\mbreak

    %7
    <mi dod sol la,> r  <mi dod sol la,> r <mi dod sol la,> r <mi dod sol la,> r
    <fad re la re, fad,> r <fad re la re, fad,> r <fad re la re, la>4 r
    <fad do la re, fad,>8 r <fad do la re, fad,>8 r <fad do la re, fad,>8 r <fad do la re, fad,>8 r

    %10
    <sol re si sol re sol,> r <sol re si sol re sol,> r <sol re si sol re sol,> r <sol re si sol re sol,> r
    <fad do la re, fad,> r <fad do la re, fad,> r <fad do la re, fad,> r <fad do la re, fad,> r
    <sol si, sol re sol,>4 r r2\mbreak

    %13
    <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r
    <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r
    <sol si, sol re sol,> r r4 <fad do la re, fad,>8 r <fad do la re, fad,>8 r

    %16
    <sol si, sol re sol,>8 r <sol si, sol re sol,>8 r  <sol si, sol re sol,>4

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 50
    \partial 4 s4
    s1*15
    s2 s4
    \bar"|."

}



IIIfl = {
    \global
    %\notypeset
    <<\IIIfln \forma>>

}

IIIvc = {
    \global
    \clef bass
    <<\IIIvcn \forma>>

}

IIIch = {
    \global
    <<\IIIchn \forma \IIIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIfln = \relative do'' {

    sol'4-. r8 sol-. sol-. sol-.
    sol4_\accent(re8) si'-. si-. si-.
    si4_\accent(sol8) re'-. re-. re-.

    %4
    re4_\accent(si8) si4_\accent(sol8)\mbreak
    re4 r8 re'(dod) re-.
    la4 r8 do!(si) do-.

    %7
    sol4 r8 sol-. sol-. sol-.
    sol4_\accent(re8) si'-. si-. si-.
    si4_\accent(sol8) re'-. re-. re-.

    %10
    re4_\accent(si8) si4_\accent(sol8)\mbreak
    re4 r8 re'(dod) re-.
    la4 r8 do!(si) do-.

    %13
    sol4 r8  si(lad) si-.
    si4_\accent(sol8) si(lad) si-.
    si(lad) si-. mi_\accent(re) do-.

    %16
    do4_\accent(si8) si(lad) si-.
    si4_\accent(sol8) si(lad) si-.\mbreak  % fineterza riga
    si(la) si-. mi_\accent(re) do-.

    %19
    do4_\accent(si8) mi(re) do-.
    do4_\accent(si8) mi_\accent(re) do-.
    mi_\accent(re) do-. mi_\accent(re) do-.

    %22
    si2.\fermata_\accent
    si8\p (lad) si-. re(do) si-.\mbreak
    do(si) do-.  do(si) do-.

    %25
    do(si) do-. mi(re) do-.
    si_\markup\italic "cres[cente]" (lad) si-. si(lad) si-.
    si(lad) si-.  re(do) si-.

    %28
    do(si) do-. do(si) do-.
    do(si) do-. mi(re) do-.\mbreak
    si\f(lad) si-. si(lad) si-.

    %31
    si(lad) si-. re(do) si-.
    do(si) do-. do(si) do-.
    do(si) do-. mi(re) do-.

    %34
    si4-.\ff si8-. si4-. si8-.
    do4-. do8-. do4-. do8-.
    si4 si8 si4 si8\mbreak

    %37
    do4 do8 do4 do8
    si-. si-. si-.  si-. si-. si-.
    do-. do-. do-. do-. do-. do-.

    %40
    si si si si si si
    dod dod dod dod dod dod
    re4 r8 re(mi) do!-.\mbreak

    %43
    si(do) la-. sol(la) fad-.
    sol4 r8 si\p(lad) si-.
    si4_\accent (sol8) si(lad) si-.

    %46
    si(lad) si-. mi(re) do-.
    do4 (si8) si(lad) si-.
    si4(sol8) si(lad) si-.

    %49
    si(lad) si-. mi(re) do-.\mbreak  %% fine pagina
    do4(si8) mi_\accent (re) do-.
    do4(si8) mi_\accent (re) do-.

    %52
    mi_\accent (re) do-. mi_\accent (re) do-.
    si2.\fermata_\accent
    si8\p(lad) si-. re(do) si-.

    %55
    do(si) do-. do(si) do-.
    do(si) do-. mi(re) do-.
    si_\markup\italic "cres."(lad) si-. si(lad) si-.\mbreak

    %58
    si(lad) si-. re(do) si-.
    do(si) do-. do(si) do-.
    do(si) do-. mi(re) do-.

    %61
    si\f(lad) si-. si(lad) si-.
    si(lad) si-. re(do) si-.
    do(si) do-. do(si) do-.

    %64
    do(si) do-.mi(re) do-.\mbreak
    si-. \ff si-. si-. do-. do-. do-.
    si-. si-. si-. la-. la-. la-.

    %67
    si-. si-. si-. do-. do-. do-.
    si-. si-. si-. la-. la-. la-.
    sol4-. r8 si\ff(lad) si-.

    %70
    si(lad) si-. mi_\accent (re) do-.\mbreak
    do4_\accent (si8) mi_\accent(re) do-.
    mi_\accent(re) do-. mi_\accent(re) do-.

    %73
    si4.-. do-.
    si-. la-.
    sol4-. r8 sol'4 r8

    %76
    sol,2.\fermata

}

VIvcn = \relative do {

    sol'4 r8 sol sol sol
    sol4 re8 si' si si
    si4 sol8 re' re re

    %4
    re4 si8 si4 sol8
    re4 r8 re' dod re
    la4 r8 do! si do

    %7
    sol4 r8 sol sol sol
    sol4 re8 si' si si
    si4 sol8 re' re re

    %10
    re4 si8 si4 sol8
    re4 r8 re' dod re
    la4 r8 do! si do\mbreak

    %13
    sol4 r8 re' dod re
    re4 si8 re dod re
    re dod re sol fad mi

    %16
    mi4 re8 re dod re
    re4 si8 re dod re
    re dod re sol fad mi

    %19
    mi4 re8 sol fad mi
    mi4 re8 sol fad mi
    sol fad mi sol fad mi\mbreak\mbreak

    %22
    re2.\fermata
    sol,8 fad sol si la sold
    la sold la la sold la

    %25
    la sold la do si la
    sol! fad sol sol fad sol
    sol fad sol si la sold

    %28
    la sold la la sold la
    la sold la do si la
    sol? fad sol sol fad sol

    %31
    sol fad sol si la sold\mbreak
    la sold la la sold la
    la sold la do si la

    %34
    sol? re' si sol re' si
    sol mi' do sol mi' do
    sol re' si sol re' si

    %37
    sol mi' do sol mi' do
    sol sol sol sol sol sol
    red red red red red red

    %40
    mi mi mi mi mi mi
    la, la la la la la\mbreak
    fad4 r8 r4 r8

    %43
    fad4 r8 r4 r8
    sol4 r8 re'' dod re
    re4 si8 re dod re

    %46
    re dod re sol fad mi
    mi4 re8 re dod re
    re4(si8) re dod re

    %49
    re dod re sol fad mi
    mi4 re8 sol fad mi\mbreak
    mi4 re8 sol fad mi

    %52
    sol fad mi sol fad mi
    re2.\fermata
    sol,8 fad sol si la sold

    %55
    la sold la la sold la
    la sold la do si la
    sol! fad sol sol fad sol

    %58
    sol fad sol si la sold
    la sold la la sold la\mbreak
    la sold la do si la

    %61
    sol! fad sol sol fad sol
    sol fad sol si la sold
    la sold la la sold la

    %64
    la sold la  do si la
    sol sol sol do, do do
    re re re do do do

    %67
    sol' sol sol do, do do
    re re re do do do\mbreak
    sol'4 r8 re' dod re

    %70
    re dod re sol fad mi
    mi4 re8 sol fad mi
    sol fad mi sol fad mi

    %73
    re4 r8 do, 4.
    re4 r8 re4 r8
    sol4 r8 sol4 r8\mbreak

    %76
    sol,2.\fermata

}


VIchn = \relative do'' {

    <sol' si, sol re sol,>4 r8 <sol sol,> <sol sol,> <sol sol,>
    <sol sol,>4 <re re,>8 <si si,> <si si,> <si si,>
    <si si,>4 <sol sol,>8 <re' re,> <re re,> <re re,>

     %4
     <re re,>4 <si si,>8 <si si,>4 <sol' sol,>8\mbreak
     <re re,>4 r8 r4 r8
     <re re,>4 r8 r4 r8

     %7
     <sol si, sol re sol,>4 r8 <sol sol,> <sol sol,> <sol sol,>
    <sol sol,>4 <re re,>8 <si si,> <si si,> <si si,>
    <si si,>4 <sol sol,>8 <re' re,> <re re,> <re re,>

     %10
     <re re,>4 <si si,>8 <si si,>4 <sol' sol,>8\mbreak
     <re re,>4 r8 r4 r8
     <re re,>4 r8 r4 r8

     %13
     sol,,8<sol'' si, sol> <sol si, sol>  sol,, <sol'' si, sol> <sol si, sol>
     sol,,<sol'' si, sol> <sol si, sol>  sol,, <sol'' si, sol> <sol si, sol>
     sol,,<sol'' si, sol> <sol si, sol>  sol,, <sol'' si, sol> <sol si, sol>

     %16
     sol,,<sol'' si, sol> <sol si, sol>  sol,, <sol'' si, sol> <sol si, sol>
     sol,,<sol'' si, sol> <sol si, sol>  sol,, <sol'' si, sol> <sol si, sol>
     sol,,<sol'' si, sol> <sol si, sol>  sol,, <sol'' si, sol> <sol si, sol>

     %19
     sol,,<sol'' si, sol> <sol si, sol>  sol,, <sol'' si, sol> <sol si, sol>
     sol,,<sol'' si, sol> <sol si, sol>  sol,, <sol'' si, sol> <sol si, sol>
     sol,,<sol'' si, sol> <sol si, sol>  sol,, <sol'' si, sol> <sol si, sol>

     %22
     sol,, <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,
     re' <fad' do la> re, re <fad' do la> re,

     %25
     re <fad' do la> re, re <fad' do la> re,
     sol, <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,

     %28
     re' <fad' do la> re, re <fad' do la> re,
     re <fad' do la> re, re <fad' do la> re,
     sol, <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,

     %31
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,
     re' <fad' do la> re, re <fad' do la> re,
     re <fad' do la> re, re <fad' do la> re,

     %34
     sol, <sol'' si, sol> <sol si, sol> sol,, <sol'' si, sol> <sol si, sol>
     re, <fad' do la> <fad do la> re, <fad' do la> <fad do la>
     sol,, <sol'' si, sol> <sol si, sol> sol,, <sol'' si, sol> <sol si, sol>

     %37
     re, <fad' do la> <fad do la> re, <fad' do la> <fad do la>
     <sol si, sol re sol,>4 r8  <sol si, sol re sol,>4 r8
     <sol dod, sol la,>4 r8 <sol dod, sol la,>4 r8

     %40
     <mi si sol>4 r8  <mi si sol>4 r8
     <mi dod sol>4 r8 <mi dod sol>4 r8
     <fad re la re,>4 r8 r4 r8

     %43
     <fad re la re,>4 r8 r4 r8
     sol,, <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,

     %46
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,

     %49
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,

     %52
     sol <sol'' si, sol> sol,, sol <sol'' si, sol> sol,,
     sol <sol'' si, sol>  <sol si, sol> sol,, <sol'' si, sol> <sol si, sol>
     sol,, <sol'' si, sol>  <sol si, sol> sol,, <sol'' si, sol> <sol si, sol>

     %55
     re, <fad' do la> <fad do la> re, <fad' do la> <fad do la>
     re, <fad' do la> <fad do la> re, <fad' do la> <fad do la>
     sol,, <sol'' si, sol>  <sol si, sol> sol,, <sol'' si, sol> <sol si, sol> %% secondo

     %58
     sol,, <sol'' si, sol>  <sol si, sol> sol,, <sol'' si, sol> <sol si, sol>
     re, <fad' do la> <fad do la> re, <fad' do la> <fad do la>
     re, <fad' do la> <fad do la> re, <fad' do la> <fad do la>

     %61
     sol,, <sol'' si, sol>  <sol si, sol> sol,, <sol'' si, sol> <sol si, sol> %% terzo
     sol,, <sol'' si, sol>  <sol si, sol> sol,, <sol'' si, sol> <sol si, sol>
     re, <fad' do la> <fad do la> re, <fad' do la> <fad do la>

     %64
     re, <fad' do la> <fad do la> re, <fad' do la> <fad do la>
     sol,, <sol'' si, sol> <sol si, sol> do,, <mi' do sol> <mi do sol>
     sol,, <sol'' si, sol> <sol si, sol> re, <fad' do la> <fad do la>

     %67
     sol,, <sol'' si, sol> <sol si, sol> do,, <mi' do sol> <mi do sol>
     sol,, <sol'' si, sol> <sol si, sol> re, <fad' do la> <fad do la>
     sol,, <sol'' si, sol> <sol si, sol> sol,, <sol'' si, sol> <sol si, sol>

     %70
     sol,, <sol'' si, sol> <sol si, sol> sol,, <sol'' si, sol> <sol si, sol>
     sol,, <sol'' si, sol> <sol si, sol> sol,, <sol'' si, sol> <sol si, sol>
     sol,, <sol'' si, sol> <sol si, sol> sol,, <sol'' si, sol> <sol si, sol>

     %73
     <sol si, sol sol,>4 r8 <mi do sol do,>4 r8
     <sol si, sol re sol,>4 r8 <fad do la re, fad,>4 r8\mbreak
     <sol si, sol re sol,>4 r8 <sol si, sol re sol,>4 r8

     %76
     <sol si, sol re sol,>2.\fermata

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 6/8
    \key sol\major
    \tempo 2. = 60
    s2.*76
    \bar"|."

}



VIfl = {
    \global
    %\notypeset
    <<\VIfln \forma>>

}

VIvc = {
    \global
    \clef bass
    <<\VIvcn \forma>>

}

VIch = {
    \global
    <<\VIchn \forma \VIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \con
}

IVfln = \relative do'' {

    r8 r4
    sol' r sol r
    sol r sol r
    re r re r

    %4
    sol,8 sol' re[si] sol4-. r\mbreak
    sol' r sol r
    sol r sol r

    %7
    dod, r la r
    re8 re' la[fad] re r r4
    re r fad re

    %10
    sol r sol r
    re fad re r\mbreak
    sol,8 sol' re[si] sol r r4

    %13
    sol' r sol r
    sol r sol r
    re r re r

    %16
    sol,8 sol' re[si] sol

}

IVvcn = \relative do {

    \tuplet 2/1{re'8\solo(dod} \tuplet 3/2{do8 [si la)]) \senza
    sol(fad sol) si[(lad si)] sol(fad sol) si[(lad si)]
    re(dod) mi-. re[(dod) mi-.] re-. sol(fad) sol[(re) si-.]
    la(sold la) do[(si do)] mi(re do) si[(do la)]\mbreak

    %4
    sol-. si(la sol[fad mi)] re-. re(red mi[fa fad)]
    sol(fad sol) si[(lad si)] sol(fad sol) si[(lad si)]
    re (dod) mi-. re[(dod) mi-.]  re(dod do si[do la)]

    %7
    sol(fad) la-. sol[(fad) la-.] sol(fad) mi-. mi[(re) dod-.]
    re-. re(dod) re[(fad la)]} re,4 r8 re'
    \tuplet 3/2 { re(dod do si[la) sol-.] fad-. mi'_\accent(re do[si la)]

    %10
    sol-. si_\accent (lad) si-.[re_\accent (dod)] re-. sol(fad) sol[(re) si-.]
    re(dod do si[la sol] fad mi re do[si la)]\mbreak
    sol(re) si'-. sol[(re) si'-.] sol-. re'\<(red mi[fa fad)] \!

    %13
    sol(fad sol) si[(lad si)] sol(fad sol) si[(lad si)]
    re(dod) mi-. re[(dod) mi-.] re-. sol(fad) sol[(re) si-.]
    la(sold la) do[(si do)] mi(re do) si[(do la)]\mbreak

    %16
    sol-. re(do si[do re)]} sol,8

}


IVchn = \relative do'' {

    r8 r4
    sol,16_\markup\italic\tiny \column{"Nota dell'Autore: Se questo accordo risulta difficile si potrà suonare"\vspace #-0.2"l'accompagnamento della prima Variazione anche p.[er] la Seconda"} si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    sol, si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    re, do' fad do la do fad do re, do' fad do la do fad do

    %4
    sol, si' sol' si, sol si sol' si,  sol4 r\mbreak
    sol, 16si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    sol, si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,

    %7
    la, dod' mi dod sol dod mi dod la, dod' mi dod sol dod mi dod
    re, re' fad re la re fad re <fad re la re,>8 r r4
    re,16 do' fad do la do fad do re, do' fad do la do fad do\mbreak

    %10
    sol, si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    re, do' fad do la do fad do re, do' fad do la do fad do
    sol, si' sol' si, sol si sol' si, \once\stemUp <sol' si, sol re>8 r r4

    %13
    sol,,16 si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    sol, si' sol' si, sol si sol' si, sol, si' sol' si, sol si sol' si,
    sol, si' sol' si, sol si sol' si, re, do' fad do la do fad do

    %16
    sol, si' sol' si, sol si sol' si, \once\stemUp <sol' si, sol re sol,>8

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 43
    \partial 4. s4.
    s1*15
    s2 s8
    \bar"|."

}



IVfl = {
    \global
    %\notypeset
    <<\IVfln \forma>>

}

IVvc = {
    \global
    \clef bass
    <<\IVvcn \forma>>

}

IVch = {
    \global
    <<\IVchn \forma \IVbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Vfln = \relative do'' {

    r16 re-.[mi8.-. fad16-.]
    sol8-. la16\<(si do re mi fad mi8)\!  dod16_\accent (re) lad_\accent (si) fad_\accent(sol)\mbreak
    re8-. mi16\<(fad sol la si do)\! re8-. lad16_\accent(si) fad_\accent(sol) dod,_\accent(re)
    re'_\accent(do!) si-. la?-. sol(fad) mi-. re-. si'_\accent(la) sol-. fad-. mi(re) mi-. fad-.

    %4
    sol\<(la sol fad) sol(la si do)\! dod\>(re mi re)\! do_\accent(si) do-. la-.\mbreak
    sol8-. la16\<(si do re mi fad sol8)\! dod,16_\accent(re) lad_\accent(si) fad_\accent(sol)
    re8-. mi16\< (fad sol la si do re8)\! lad16_\accent(si) fad_\accent(sol) dod,_\accent(re)

    %7
    dod(si la si) dod(re mi fad) sol(la) dod-. mi-. dod_\accent(la) sol-. mi-.\mbreak
    re-. re'(la) fad-. re-. la(fad) la-. re,8 r do''!16(si la sol)
    fad_\accent(la) sol_\accent(si) la_\accent(do) si_\accent(re) do8-. fad16_\accent(mi) re(do si la)

    %10
    sol_\accent(si) la_\accent(do) si_\accent(re) do_\accent(mi) re8-. sol16_\accent(fad mi re do si)\mbreak
    la(sol fad mi )re\<(mi fad sol la si do re\!) fad_\accent(mi re do)
    si-. re_\accent(dod re) dod_\accent(re mi re) si8-. re,16\<(fad) mi (sol) fad(la)\!

    %13
    sol8-. la16\<(si do re mi fad sol8)\! dod,16_\accent(re) lad_\accent(si) fad_\accent(sol)\mbreak
    re8-. mi16\<(fad sol la si do re8)\! sol,16(fad) la_\accent(sol fad mi)
    re8-. re'16_\accent(dod) mi_\accent(re si sol) fad8-. do'16(si) re_\accent(do la fad)

    %16
    sol(la si do re mi fad sol) sol,8-.

}

Vvcn = \relative do {

    r8 r4
    sol8 sol' re[si] sol4 r
    re'8 re' la[fad] re4 r
    re8 r la' r fad r re r

    %4
    sol4 r r2
    sol,8 sol' re[si] sol4 r\mbreak
    re'8 re' la[fad] re4 r

    %7
    la8 r la' r mi r dod r
    re re' la fad re r r4
    re r fad re

    %10
    sol,4 r sol' r
    re r fad re
    sol,8 sol' re[si] sol4 r\mbreak

    %13
    sol8 sol' re[si] sol4 r
    re'8 re' la[fad] re4 r
    sol, r fad' re

    %16
    sol,8 sol' re[si] sol8

}


Vchn = \relative do'' {

    r8 r4
    sol,8 <sol'' si, sol> si,,[<sol'' si, sol>] <sol si, sol re sol,>4 r
    re,8[<fad' do la>] fad, <fad' do la> <fad do la re,>4 r
    re,8[<fad' do la>] <fad do la> <fad do la> re,[<fad' do la>] <fad do la> <fad do la>

    %4
    <sol si, sol re sol,>4 r r2\mbreak
    sol,,8[<sol'' si, sol>] si,, <sol'' si, sol> <sol si, sol re sol,>4 r
    re,8[<fad' do la>] fad,<fad' do la> <fad do la re,>4 r

    %7
    la,,8[<sol'' dod, la>] <sol dod, la> <sol dod, la> la,,8[<sol'' dod, la>] <sol dod, la> <sol dod, la>
    re,8[<fad' re la>] <fad re la> <fad re la> \once\stemUp <fad re la>8 r r4
    re,8[<fad' do la>] <fad do la> <fad do la> re,[<fad' do la>] <fad do la> <fad do la>\mbreak

    %10
    sol,, <sol'' si, sol> <sol si, sol> <sol si, sol> sol,, <sol'' si, sol> <sol si, sol> <sol si, sol>
    re, <fad' do la> <fad do la> <fad do la>  re, <fad' do la> <fad do la> <fad do la>
    sol,, <sol'' si, sol> <sol si, sol> <sol si, sol> <sol si, sol sol,>4 r

    %13
    sol,,8[ <sol'' si, sol>] si,, <sol'' si, sol> <sol si, sol re sol,>4 r
    re,8[<fad' do la>] fad, <fad' do la> <fad do la re,>4 r\mbreak
    sol,,8[<sol'' si, sol re>] <sol si, sol re> <sol si, sol re> re, <fad' do la> <fad do la> <fad do la>

    %16
    sol,, <sol'' si, sol re> <sol si, sol re> <sol si, sol re> <sol si, sol re sol,>

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 50
    \partial 4. s4.
    s1*15
    s2 s8
    \bar"|."

}



Vfl = {
    \global
    %\notypeset
    <<\Vfln \forma>>

}

Vvc = {
    \global
    \clef bass
    <<\Vvcn \forma>>

}

Vch = {
    \global
    <<\Vchn \forma \Vbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #5
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Divertimento per Flauto, Violoncello e Chitarra}
    composer = \markup \center-column{"  ""Giuseppe de Pauli (1797 - 1877"}
}

\markup \huge {[1.] Introduzione Maestoso }

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup  \center-column{"Flauto"}
            \set Staff.shortInstrumentName = "fl"
            \Ifl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
            \set Staff.shortInstrumentName = "vc"
            \Ivc
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"acoustic guitar (nylon)"
            \set Staff.instrumentName = \markup  \center-column{"Chitarra"}
            \set Staff.shortInstrumentName = "ch"
            \Ich
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

\markup \huge {[2.] Andante Tema }

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup  \center-column{"Flauto"}
            \set Staff.shortInstrumentName = "fl"
            \IIfl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
            \set Staff.shortInstrumentName = "vc"
            \IIvc
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"acoustic guitar (nylon)"
            \set Staff.instrumentName = \markup  \center-column{"Chitarra"}
            \set Staff.shortInstrumentName = "ch"
            \IIch
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

\markup \huge {[3.] 1.\super ma Variazione }

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup  \center-column{"Flauto"}
            \set Staff.shortInstrumentName = "fl"
            \IIIfl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
            \set Staff.shortInstrumentName = "vc"
            \IIIvc
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"acoustic guitar (nylon)"
            \set Staff.instrumentName = \markup  \center-column{"Chitarra"}
            \set Staff.shortInstrumentName = "ch"
            \IIIch
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

\markup \huge {[4.] 2.\super a Variazione }

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup  \center-column{"Flauto"}
            \set Staff.shortInstrumentName = "fl"
            \IVfl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
            \set Staff.shortInstrumentName = "vc"
            \IVvc
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"acoustic guitar (nylon)"
            \set Staff.instrumentName = \markup  \center-column{"Chitarra"}
            \set Staff.shortInstrumentName = "ch"
            \IVch
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

\markup \huge {[5.] 3.\super a Variazione, con Anima }

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup  \center-column{"Flauto"}
            \set Staff.shortInstrumentName = "fl"
            \Vfl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
            \set Staff.shortInstrumentName = "vc"
            \Vvc
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"acoustic guitar (nylon)"
            \set Staff.instrumentName = \markup  \center-column{"Chitarra"}
            \set Staff.shortInstrumentName = "ch"
            \Vch
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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

\markup \huge {[6.] Finale All[egr]o }

\score {

    \new ChoirStaff <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup  \center-column{"Flauto"}
            \set Staff.shortInstrumentName = "fl"
            \VIfl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"Violoncello"}
            \set Staff.shortInstrumentName = "vc"
            \VIvc
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"acoustic guitar (nylon)"
            \set Staff.instrumentName = \markup  \center-column{"Chitarra"}
            \set Staff.shortInstrumentName = "ch"
            \VIch
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)  %aumenta lo spazio orizzontale
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