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
}

IvlIn =  \relative do'' {

    fa,2 fa4~fa8. fa16
    fa2 fa'
    mi32(re do8.)~do4 r4 r16 do re32 mi fa sol

    %4
    la2 fa4~fa8. fa16
    fa,2 do''\mbreak
    re32(do sib8.)~sib4 sib,, r16 sol'' fa32 mi re do
    si32 la sol8.~sol4 sol, r16 la'' sol32 fa mi re

    %8
    mi32(re do8.) sol'32(fa mi8.) sib'4 r8 r32 mi, fa sol
    sib,4 r8 r32 sol la sib do,4 r8 r32 mi' fa sol
    la8 fa do la fa2\fermata\tr

    %11
    do'8-.\pp fa-. fa-. la-. la-. do,-. do-. sib-.\mbreak  %% inizio ripresa
    sib mi mi sol sol sib, sib la
    la do do fa fa la, la sol

    %14
    \stemUp do,4~\f do32 re(mi fa sol64 la sib do re mi fa sol128 la) \stemNeutral sib2
    \stemUp fa,4~fa32 mi(fa sol la sib do64 re mi fa128 sol)  \stemNeutral la2
    si8.[do16 mi,8. fa16] sib,?4 do

    %17
    fa,4 r r2   %%% fine ripresa
    R1*4
    do'4\p do do do

    %23
    re r r2
    re4 re re re
    mi r r2\mbreak

    %26
    mi4 mi mi mi
    fa4 r r2
    r4 fa fa fa

    %29
    fa fa r2
    r4 mi mi mi
    mi mi r2

    %32
    r4 re re re\mbreak
    re re r2
    R1*3

    %37
    r2 la,
    la4~la8. la16 la2
    la''\mbreak sold32 fad mi8.~mi4

    %40
    r r16 r32 mi fad sold la si do4 mi,8. mi16
    do4 la8. la16 mi2\tr
    mi'8.[si16 do8. sold16] la8.[mi16 fa8. dod16]

    %43
    re8.[sold,16 la8. re16] mi4~mi8~mi32 re do si
    la4 r r2
    R1\mbreak

    %46
    r2 r8 mi'' mi mi
    mi mi mi mi mi4 r
    r8 re re re re4 r

    %49
    R1*8
    r2 do,2
    do4~do8. do16 do2

    %59
    do' si32(la sol8.)~sol4
    r r16 sol la32 si do re mi4 r16 sol fa32 mi re do
    sib!4 r16 re do32 sib la sol fa2

    %62
    fa4~fa8. fa16 fa2
    fa'\mbreak mi32(re do8.) r16 do32 (re mi fa sol la)
    sib4 r16 sol fa32 mi re do la'8 fa r4

    %65
    R1*2
    do8 do do fa reb reb reb reb
    reb? reb do do do do do do\mbreak

    %69
    do do sib sib sib sib sib reb
    lab sib sib lab lab sol sol r
    R1*13

    %84
    do8-.\pp fa-. fa-. la-. la-. do,-. do-. sib-.\mbreak  %% inizio ripresa
    sib mi mi sol sol sib, sib la
    la do do fa fa la, la sol

    %87
    \stemUp do,4~\f do32 re(mi fa sol64 la sib do re mi fa sol128 la) \stemNeutral sib2
    \stemUp fa,4~fa32 mi(fa sol la sib do64 re mi fa128 sol)  \stemNeutral la2
    si8.[do16 mi,8. fa16] sib,?4 do

    %90
    fa,4\fermata r r2

}

IvlIIn = \relative do'' {

    do,16(fa la) fa do(fa la) fa do(fa la) fa do(fa la) fa
    do(fa sib) fa do(fa sib) fa do(fa sib) fa do(fa sib) fa
    sol,(mi' do') mi, sol,(mi' do') mi, sol,(mi' do') mi, sol,(mi' do') mi,

    %4
    do(fa la) fa do(fa la) fa do(fa la) fa do(fa la) fa
    la(do fa) do la(do fa) do la(do fa) do la(do fa) do\mbreak
    re,(sib' fa') sib, re,(sib' fa') sib, re,(sib' fa') sib, re,(sib' fa') sib,

    %7
    re,(si' sol') si, re,(si' sol') si, re,(si' sol') si, re,(si' sol') si,
    mi,(do' sol') do, mi,(do' sol') do, mi,(do' sol') do, mi,(do' sol') do,
    mi,(do' sib') do, mi,(do' sib') do, mi,(do' sib') do, mi,(do' sib') do,

    %10
    fa,(do' la') do, fa,(do' la') do, fa,(do' la') do, fa,(do' la') do,\fermata
    la8-.\pp do-. do-. fa-. fa-. la,-. la-. sol-.\mbreak
    sol sib sib mi mi sol, sol fa

    %13
    fa la la do do fa, fa mi
    \stemUp do4~\f do32 re(mi fa sol64 la sib do re mi fa sol128 la) \stemNeutral sib2
    \stemUp fa,4~fa32 mi(fa sol la sib do64 re mi fa128 sol)  \stemNeutral la2

    %16
    si8.[do16 mi,8. fa16] sib,?4 do
    fa,4 r r2   %%% fine ripresa
    R1*4

    %22
    la4\p la la la
    fa4 r r2
    si4 si si si

    %25
    sol r r2\mbreak
    dod4 dod dod dod
    la r r2

    %28
    r4 la la la
    sib sib r2
    r4 sol sol sol

    %31
    la la r2
    r4 fa fa fa\mbreak
    mi4 mi r2

    %34
    R1*3
    r2 la,16(mi' la) mi la,(mi' la) mi
    la,(mi' la) mi la,(mi' la) mi la,(fa' la) fa la,(fa' la) fa

    %39
    la,(fa' la) fa la,(fa' la) fa\mbreak sold(si mi) si sold(si mi) si
    sold?(si? mi) si sold(si mi) si la(do mi) do la(do mi) do
    la(do mi) do la(do mi) do sold(si mi) si sold(si mi) si

    %42
    mi8.[si16 do8. sold16] la8.[mi16 fa8. dod16]
    re8.[sold,16 la8. re16] mi4~mi8~mi32 re do si
    la4 r r2

    %45
    R1\mbreak
    r2 r8 si' si si
    dod dod dod dod dod4 r

    %48
    r8 si si si si4 r
    R1*8
    r2 sol16(do mi) do sol(do mi) do

    %58
    sol(do mi) do sol(do mi) do sol(do fa) do sol(do fa) do
    sol(do fa) do sol(do fa) do re,(si' sol') si, re,(si' sol') si,
    re,(si'? sol') si, re,(si' sol') si, sol(do mi) do sol(do mi) do

    %61
    sol(sib! mi) sib sol(sib mi) sib do,(fa la) fa do(fa la) fa
    do(fa la) fa do(fa la) fa do(fa sib) fa do(fa sib) fa
    do(fa sib) fa do(fa sib) fa\mbreak sol,(mi' do') mi, sol,(mi' do') mi,

    %64
    sol,(mi' do') mi, sol,(mi' do') mi, <<la4\\\stemUp \once \override Stem #'transparent = ##t fa\\\stemDown do>> r
    R1*2
    lab'8 lab lab lab lab lab lab lab

    %68
    sol sol sol sol sol sol sol sol\mbreak
    fa fa fa fa fa fa fa fa
    fa mi mi fa do do do4

    %71
    R1*13
    la'8-.\pp do-. do-. fa-. fa-. la,-. la-. sol-.\mbreak
    sol sib sib mi mi sol, sol fa

    %86
    fa la la do do fa, fa mi
    \stemUp do4~\f do32 re(mi fa sol64 la sib do re mi fa sol128 la) \stemNeutral sib2
    \stemUp fa,4~fa32 mi(fa sol la sib do64 re mi fa128 sol)  \stemNeutral la2

    %89
    si8.[do16 mi,8. fa16] sib,?4 do
    fa,4\fermata r r2   %%% fine ripresa

}

Ivlan =  \relative do' {

    la4 la la la
    sib sib sib sib
    do do do do

    %4
    do do la la
    do do do do\mbreak
    fa, fa fa fa

    %7
    fa fa fa fa
    sol sol sol sol
    sol sol sol do

    %10
    do1\fermata
    fa4\pp fa do do\mbreak  %%% inizio ripresa
    mi mi mi mi

    %13
    do do do do
    mi,8\f mi mi mi' mi mi mi mi
    do do do do do do do do

    %16
    si'8.[do16 mi,8. fa16] sib,?4 do
    fa,4 r r2  %%%%% fine ripresa
    R1*4

    %22
    fa'4\p fa fa fa
    sib,4 r r2
    sol'4 sol sol sol

    %25
    do,4 r r2\mbreak
    la'4 la la la
    re,4 r r2

    %28
    r4 re re re
    sol sol r2
    r4 do, do do

    %31
    fa fa r2
    r4 sib, sib sib\mbreak
    sold sold r2

    %34
    R1*3
    r2 mi4 mi
    mi mi fa fa

    %39
    fa fa\mbreak fa si
    si? mi mi mi
    mi do si si

    %42
    mi'8.[si16 do8. sold16] la8.[mi16 fa8. dod16]
    re8.[sold,16 la8. re16] mi4~mi8~mi32 re do si
    la4 r r2

    %45
    R1
    r2 r8 sold' sold sold
    la la la la la4 r

    %48
    r8 sol? sol sol sol4 r
    R1*8
    r2 mi4 mi

    %58
    mi mi fa fa
    fa fa sol sol
    sol sol sol sol

    %61
    mi mi do la
    la la sib sib
    sib sib\mbreak do mi,

    %64
    mi mi do r
    R1*2
    fa'8 fa fa fa fa fa fa fa

    %68
    fa fa mib mib mib mib mib mib\mbreak
    mib? mib reb reb reb reb reb reb
    do do do do do do do4

    %71
    R1*13
    fa4\pp fa do do\mbreak  %%% inizio ripresa
    mi mi mi mi

    %86
    do do do do
    mi,8\f mi mi mi' mi mi mi mi
    do do do do do do do do

    %89
    si'8.[do16 mi,8. fa16] sib,?4 do
    fa,4\fermata r r2  %%%%% fine ripresa

}

Ifgn = \relative do {

    fa4 fa fa fa
    fa fa fa fa
    mi mi mi mi

    %4
    fa fa fa fa
    fa fa fa fa\mbreak
    sib, sib sib sib

    %7
    sol sol sol sol
    do do do do
    do do do do

    %10
    fa1\fermata
    fa4\pp fa fa fa\mbreak  %%%%%ripresa
    do do do do

    %13
    fa fa fa fa
    do8\f do do do do do do do
    fa fa fa fa fa fa fa fa

    %16
    si8.[do16 mi,8. fa16] sib,?4 do
    fa4~fa32 mi fa sol la sib do re64 mi fa2%%% fine ripresa
    \stemUp do,4~do32 si do re mi fa sol la \stemNeutral sib?2

    %19
    la4~la16. do32 sib la sol fa re'4~re16. sib32 la sol fa mi
    do'4~do16. la32 sol fa mi re sib'4~sib16. sol32 fa mi re do
    si2\tr do\fermata

    %22
    \senza \tuplet 3/2 { fa8\p la do fa,[la do] fa, la do fa,[la do]
    sib,\f re fa sib,[re fa] sib, re fa sib,[re fa]
    sol\p si re sol,[si re] sol, si re sol,[si re]

    %25
    do,\f mi sol do,[mi sol] do, mi sol do,[mi sol]
    la\p[dod mi] la,[dod mi] la,[dod mi] la,[dod mi]
    re,\f fa la re,[fa la] re, fa la re,[fa la]}

    %28
    re,4 r8 la'\p fa'32 mi re8. re32 mi fa8.
    sib,4~sib16\f do sib la sol la sol fa mi fa mi re
    do4 r8 sol'\p mi'32 re do8. do32 re mi8.

    %31
    la,4~la16\f sib la sol fa sol fa mi re mi re do
    sib4 r8 fa'\p re'32 do sib8. sib32 do re8.\mbreak
    mi,4 r16  mi\f fa mi mi, mi' fa mi la mi si' mi,

    %34
    mi, mi' fa mi si' mi, do' mi, mi, mi'fa mi do' mi, re' mi,
    mi,8 si''4\p~si16(do32 re) do8 do~do8. re32 mi
    re8 re~re8.(mi32 fa) mi16 si\f do sold la mi fa dod

    %37
    re sold, la re mi8 mi, la4 la
    la la la la
    la la\mbreak mi' mi

    %40
    mi mi la, la
    la la mi' mi
    mi'8.[si16 do8. sold16] la8.[mi16 fa8. dod16]

    %43
    re8.[sold,16 la8. re16] mi4~mi8~mi32 re do si
    la16-. la'-. la-. si-.si4\tr do16-. do-. do-. re-. re4\tr mi16 mi mi fa red re re mi
    dod do do re si sib sib do\mbreak

    %46
    la8.\tr[sold16 la si do re] mi8 mi, r4
    r16 mi' mi re dod4\tr~dod16 sol, sol fa fa mi mi re
    \once\stemUp re re'' re do si4\tr~\once\stemDown si16 fa, fa mi mi re re do

    %49
    \once\stemUp do do'' do mi, fa re' re fad, sol mi' mi sold, la fa' fa la,
    si re re fad, sol? re re si do4 r32 do re mi fa? sol la si
    do16 mi do sol mi sol mi do\mbreak fa la fa do la do la fa

    %52 inizio p. 6
    re''fa re la fad la fad re sol si? sol re si re si sol
    r si' (do re) fa,4\tr mi16\tr re32 mi fa16\tr[mi32 fa] sol8 r
    r16 si,( do re) fa,4\tr mi16\tr[re32 mi] fa16\tr mi32 fa sol8\noBeam r

    %55
    r16 do'[do do do do do do] la do sol do fa, do' mi, do'
    re, do' do, do' si, do' la, do' sol,32 la si do re mi fa sol sol, la si do re mi fa sol\mbreak
    mi16 do' fa, do' sol do sol, si' do,4 do

    %58
    do do do do
    do do si si
    si? si do do

    %61
    do do fa fa
    fa fa fa fa
    fa fa\mbreak do do

    %64
    do do fa16 la sol sib la do sib re
    do8 la~la8. sib32 do sib8 sol~sol8. la32 sib
    la8 fa~fa8. sol32 la sol8 mi~mi8. fa32 sol

    %67
    re4 r16 do' do reb reb fa fa mib mib reb reb do
    do si si do do4~do16 mib mib reb reb do do sib?\mbreak %%%Fine primo sistema pagina 7
    sib la la sib sib4~sib16 reb reb do do sib sib lab

    %70
    lab? sol sol sib sib do do fa, fa8\tr mi! r do'
    \senza \tuplet 3/2 { la?16 sib do fa,[sol la] } do,8 mib re sib r re'
    \tuplet 3/2 { sib16 do re sol,[la sib] } re,8 fa mi? do r do'

    %73
    \tuplet 3/2 { sib16 do re sol,[la sib] mi, fa sol do,[re mi] } do,4 r8 do''
    do4(si8) fa fa4(mi8) sib'\mbreak
    sib4(la8) mib mib4(re8) fa

    %76
    fa4(mi?8) sib' sib\tr la r do
    re16 sib la sol la, sib' la sol do la sol fa sib, la' sol fa
    sib sol fa mi la, sol' fa mi la fa sib sol do la re sib

    %79
    mi4(fa) sib,2
    r16 la sol fa mi re do sib la sol fa mi re do re mi
    fa [sol la sib do8] r\mbreak do'8.\tr sib32 do sib8.\tr la32 sib

    %82
    la16 fa la, fa' sib, fa' do mi do'8.\tr sib32 do sib8.\tr la32 sib
    la16 fa la, fa' sib, fa' do mi fa4 r
    fa\pp fa fa fa\mbreak  %%%%%ripresa

    %85
    do do do do
    fa fa fa fa
    do8\f do do do do do do do

    %88
    fa fa fa fa fa fa fa fa
    si8.[do16 mi,8. fa16] sib,?4 do
    fa4\fermata r r2

}

Ibcn = \relative do {

    fa4 fa fa fa
    fa fa fa fa
    mi mi mi mi

    %4
    fa fa fa fa
    fa fa fa fa\mbreak
    sib, sib sib sib

    %7
    sol sol sol sol
    do do do do
    do do do do

    %10
    fa1\fermata
    fa4\pp fa fa fa\mbreak  %%%%%ripresa
    do do do do

    %13
    fa fa fa fa
    do8\f do do do do do do do
    fa fa fa fa fa fa fa fa

    %16
    si8.[do16 mi,8. fa16] sib,?4 do
    fa,4_\markup {\circle {1 }} fa fa fa %%% fine ripresa
    do' do do do\mbreak

    %19
    fa fa sib mi,
    la re, sol do,
    si sol do2\fermata

    %22
    R1
    sib4\f sib sib sib
    R1

    %25
    do4 do do do\mbreak
    R1
    re4 re re re

    %28
    R1
    r4 sol sol mi
    do r r2

    %31
    r4 fa fa re
    sib r r2\mbreak
    r4 mi, mi mi

    %34
    mi mi mi mi
    \once\stemUp mi8 sold' sold sold la la la la
    si si si si do la do, [la]

    %37
    re16 sold, la re mi8 mi, la4_\markup {\circle {2 }} la
    la la la la
    la la\mbreak mi' mi

    %40
    mi mi la, la
    la la mi' mi
    mi'8.[si16 do8. sold16] la8.[mi16 fa8. dod16]

    %43
    re8.[sold,16 la8. re16] mi4~mi8~mi32 re do si
    la4 sold'_\markup {\circle {3 }} la si
    do si la sol?\mbreak

    %46
    \parenthesize r fa2 mi4
    r2 r8 sol, fa mi
    re4 r r8 fa mi re

    %49
    do r re r mi r fa r
    sol r si r do re mi re
    do4_\markup {\circle {4 }} sib!\mbreak la fa

    %52
    re' do si sol
    sol'8 re si sol do re mi fa
    sol, la si sol do, [re mi fa16 sol]

    %55
    do,4 r fa'8 mi re do
    si la sol fad sol r sol r\mbreak
    do fa sol sol, do4_\markup {\circle {5 }} do

    %58
    do do do do
    do do si si
    si? si do do

    %61
    do do fa fa
    fa fa fa fa
    fa fa\mbreak do do

    %64
    do do fa8_\markup {\circle {6 }} mi fa sol
    \once\stemDown la  fa, fa4 r8 mi mi4
    r8 re re4 r8 do do4

    %67
    fa r r2
    R1*3
    fa'8 la, la la sib sib sib sib

    %72
    sol' sib, si si do do do do
    do do do do do, do do do
    sol' sol sol sol do do do do\mbreak

    %75
    fa, fa fa fa sib sib sib si
    do do do do fa fa, la' [fa]
    sib,4 do la sib

    %78
    sol la fa'8 sol la sib
    do[sib la sol16 fa] mi8 re mi do
    fa[la,16 sib do8 sib] la[fa re8. mi16]

    %81
    fa16[sol la sib do8 la]\mbreak fa8 la' sol do,
    fa, la sib do fa, la' sol do,
    fa, la sib do fa,4 r

    %84
    fa'4\pp fa fa fa\mbreak  %%%%%ripresa
    do do do do
    fa fa fa fa

    %87
    do8\f do do do do do do do
    fa fa fa fa fa fa fa fa
    si8.[do16 mi,8. fa16] sib,?4 do

    %90
    fa,4\fermata r r2

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 45
  s1*90
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

Ifg = {
  \Iglobal
  \clef bass
  <<\Ifgn \forma>>

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
  \terzine
}

IIvlIn =  \relative do'' {

    r8 sol' sol8.\tr(fa32 sol) do,8 mi
    re8 sol, sol8.\tr \parentSlur (fa32 sol) sol,8 fa'
    mi sol' sol8.\tr(fa32 sol) do,8 sol'

    %4
    la re, re8.\tr\parentSlur (do32 re) fad,8 do'
    si sol' sol8.\tr(fad32 sol) sib8 re,
    dod16(mi) la,(sib) sol(sib) mi,(sol)  \once\stemUp la, mi''(fa sol)

    %7
    fa8 re re8.\tr(dod32 re) la'8 re,
    sold,16(si!) mi,(sold) si(re) sold(si) mi, re (do si)\mbreak
    do8 mi do8.\tr(si32 la) si8 sold

    %10
    do mi do8.\tr(si32 la) si8 sold?
    la la mi do la4
    R2.*4\mbreak

    %16
    si8 si si si si si
    si si si si si si
    si si si si si si

    %19
    do do r4 r
    R2.
    r4 mi'8 mi mi mi\mbreak  %% fine primo sistema p. 10

    %22
    mi mi mi mi mi mi
    fa mi r4 r
    R2.

    %25
    fad,8 fad fad fad fad fad
    sol sol sol sol sol sol
    mi mi mi mi mi la\mbreak

    %28
    la la la la si[si]
    sol sol sol sol sol do
    do do do r r4

    %31
    R2.*4
    r4 r8 sol sol si
    sol4 r8 sol sol si

    %37
    sol4 r \parenthesize r2\mbreak
    R2.*2
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvlIIn = \relative do'' {

    r8 sol' sol8.\tr(fa32 sol) do,8 mi
    re8 sol, sol8.\tr \parentSlur (fa32 sol) sol,8 fa'
    mi sol' sol8.\tr(fa32 sol) do,8 sol'

    %4
    la re, re8.\tr\parentSlur (do32 re) fad,8 do'
    si sol' sol8.\tr(fad32 sol) sib8 re,
    dod16(mi) la,(sib) sol(sib) mi,(sol)  \once\stemUp la, mi''(fa sol)

    %7
    fa8 re re8.\tr(dod32 re) la'8 re,
    sold,16(si!) mi,(sold) si(re) sold(si) mi, re (do si)\mbreak
    do8 mi do8.\tr(si32 la) si8 sold

    %10
    do mi do8.\tr(si32 la) si8 sold?
    la la mi do la4
    R2.*4\mbreak

    %16
    mi'8 mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %19
    mi mi r4 r
    R2.
    r4 do'8 si do si\mbreak

    %22
    do do si si do[do]
    la do r4 r
    R2.

    %25
    red,8 red red red red red
    si' si si si si sol
    do do do do do do\mbreak

    %28
    fad, fad fad fad re[sol]
    mi mi mi mi mi la
    la la la r r4

    %31
    R2.*4
    r4 r8 mib mib re
    mib4 r8 mib mib re

    %37
    mib4 r \parenthesize r2\mbreak
    R2.*2
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIvlan =  \relative do' {

    mi8 re mi fa sol mi
    si sol' sol8.\tr\parentSlur (fa32 sol) sol,8 fa'
    mi re do fa sol mi

    %4
    re fad la sol la fad
    re do re do re sib'
    mi, mi dod la dod dod

    %7
    la la' la sol fa fa
    si,! [si] sold' la si sold\mbreak
    mi si' mi, mi fa mi

    %10
    mi si' mi,[mi fa mi]
    do la' mi do la4
    R2.*4\mbreak %%% fine p. 9

    %16
    sold8 sold sold sold sold sold
    sold? sold sold sold sold sold
    sold? sold sold sold sold sold

    %19
    la la r4 r
    R2.
    r4 la'8 sold la sold\mbreak

    %22
    la la sold sold la[la]
    re, la r4 r
    R2.

    %25
    si8 si si si si si
    mi mi mi mi mi mi
    la, la la la la[la]\mbreak

    %28
    re re re re sol,[sol]
    do do do do do[do]
    re re re r r4

    %31
    R2.*4
    r4 r8 do do sol
    do4 r8 do do sol

    %37
    \parenthesize do4 r r2
    R2.*2
    R2.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIfgn = \relative do {

    do8 si do re mi do
    sol sol' sol8.\tr\parentSlur (fa32 sol) sol,8 fa'
    mi do mi re mi do

    %4
    fad re fad mi re fad
    sol la sib la sib sol
    la dod, mi dod la la'

    %7
    re, dod re mi fa re
    mi re mi fad sold mi\mbreak
    la sold la do, re mi

    %10
    la sold la do, re mi
    la, la' mi do la4
    do'8._\solo\tr(si32 do) do8.\tr\tr (si32 do)  re8 sol,

    %13
    do8.\tr(si32 do) do8.\tr (si32 do) fa8 re
    do16(sol) mi(sol) do,(mi) sol(do) mi(do) sol(do)
    si32 re do re sol,[si la si] re, sol fa sol si,[re do re] sol,8 r\mbreak

    %16
    re''4~re16 fa mi re dod re dod re
    re4~re16 fa mi re dod re dod re
    mi,4~mi32 fad sold la si do? re mi fa?16 re do si

    %19
    do4 r16 mi32 re do16\tr si32 do la16\tr do32 si la16\tr[sol?32 la]
    fa4 r16 fa'32 mi re16\tr do32 re si16\tr re32 do si16\tr la32 si
    sold8 mi \tuplet 3/2 { do'16 si do } re8\tr\noBeam\senza \tuplet 3/2 { do16 si do } re8\tr \noBeam

    %22
    \tuplet 3/2 { do16 si la mi'[re do] si la sold re'[do si] do si la mi'[re do]
    fa mi re do[si la]} \stemUp  re,,8 \stemDown la'' \stemUp mi, \stemDown sold' \stemNeutral
    la,4 r r

    %25
    r16 si' do si r red mi red r la si la
    r sol la sol r mi fad mi r si' do si
    do4~do32 mi re mi do[mi re mi] la, do si do mi,[la sol la]\mbreak

    %28
    fad4~fad32 re' do re la[re do re] si re do re re,[sol fad sol]
    mi4~mi32 do' si do sol[do si do] mi, do' si do sol[do si do]
    fad,4 r32 la si do fad,[la re, fad] sol si do re sol,[si re, sol]

    %31
    mi do' re mi sol,[do mi, sol] fad[la re, fad] sol si re, sol la[fad sol dod,] re16 re,\mbreak
    sol4 r8 sol' sol8. fa?32 sol
    sol,4 r8 si' si8.\tr la32 si

    %34
    do4 r8 mi, mi8. re32 do
    sol'4 r16 do re  mib mib re do si
    do lab sol fad sol do re mib mib re do si

    %37
    do16_\footnote #'(1 . 4) \markup \column{"Bar 37: the Fagotto part is in 4/4" "  "} [lab sol fad] sol16 si32 do re16[sol,32 la] si16 re,32 mi fa?16[si,32 do] re16 sol,32 la si16 sol\mbreak
    do do'32 si do16\tr si32 do mi,16 do'32 si do16\tr si32 do fa,16 re sol sol,
    do do'32 si do16\tr si32 do \once\stemUp mi,,16 do''32 si do16\tr si32 do fa,,16 re sol' sol,

    %40
    do,2.\fermata

}

IIbcn = \relative do {

    do8 si do re mi do
    sol sol' sol8.\tr\parentSlur (fa32 sol) sol,8 fa'
    mi do mi re mi do

    %4
    fad re fad mi re fad
    sol la sib la sib sol
    la dod, mi dod la la'

    %7
    re, dod re mi fa re
    mi re mi fad sold mi\mbreak
    la sold la do, re mi

    %10
    la sold la do, re mi
    la, la' mi do la4
    do8_\markup {\circle {8 }}  re mi do si sol

    %13
    do re mi do re sol,
    do re mi re do[do,]
    sol' sol' si,[la] sol r\mbreak

    %16
    R2.*3
    r4 do'8 la fa re
    re re, re''[si sold mi]

    %21
    mi mi, r4 r\mbreak
    R2.
    r8 la re,[re mi mi]

    %24
    la la' do[la fad red]
    si4 r r
    R2.*4

    %30
    r4 r8 re sol sol,
    do, do' re[sol,] re' re,\mbreak
    sol la si do si la

    %33
    sol sol' si la sol fa
    mi la sol fa mi do
    sol' sol, sol r r4

    %36
    R2.
    r4 \parenthesize r r8 sol [sol sol]
    do do mi mi fa16 re sol sol,

    %39
    do8 do mi,[mi] fa16 re sol sol
    do,2.\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key do\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4 = 55
  s2.*36
  \set Score.measureLength = #(ly:make-moment 4 4)
  s1
  \set Score.measureLength = #(ly:make-moment 3 4)
  s2.*3
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

IIfg = {
  \IIglobal
  \clef bass
  <<\IIfgn \forma>>

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
  \terzine\con
}

IIIvlIn =  \relative do'' {

    fa,16 sol la sib do8 do,
    re16 mi fa sol la8 la,
    sib16 do re mi fa sol la si

    %4
    do8 do, r4
    do'16 re mi fa sol8 sib,?
    la sol fa4

    %7
    do'16 re mi fa sol8 sib,
    la sol fa4
    r8 mib'\p-.[(mib-. mib-.)]

    %10
    la4(mib)
    re8-.[(re-. re-. re-.)]
    la'4(do,)\mbreak

    %13
    sol8\f[re sib sol]
    r8 fa''\p-.[(fa-. fa-.)]
    si4(fa)

    %16
    mi?8-.[(mi-. mi-. mi-.)]
    si'4(re,)
    la8\f[mi do la]

    %19
    fa'16 sol fa mi fa sol fa mi % ripresa
    fa sol fa mi fa sol fa mi
    fa8 do' sib4\tr

    %22
    la8 sib sol4\tr \mbreak
    fa16 sol fa mi fa sol fa mi
    fa sol fa mi fa sol fa mi

    %25
    fa8 do' sib4\tr
    la8 la' sol4\tr
    fa8[mi16 re do8 sib16 la]

    %28
    re8[do16 sib la8 sol16 fa]
    fa'8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,]

    %31
    fa4 r \mbreak %%% fine ripresa
    R2*3
    fa16 sol fa mi fa sol fa mi

    %36
    fa4 r
    R2*24
    re16 mi re dod re mi re dod

    %62
    re mi re dod re mi re dod
    re'8[do16 sib la8 sol16 fa]
    sib8[la16 sol fa8 mi16 re]

    %65
    re'8[do16 sib la8 sol16 fa]
    sol8[fa16 mi la8 la,]
    re8[re'\p re(mi)]

    %68
    fa2~
    fa8[mi mi(fad)]
    sol2~

    %71
    sol8[fad fad(sold)]\mbreak
    la la, r4
    R2*2   %%%% inizio p 16

    %75 OK
    r4 si8 sold
    do do la la
    si [si si sold]

    %78
    mi[la la la]
    si[si si sold]
    mi[mi' fad fad]

    %81
    mi[mi mi mi]\mbreak
    mi4 r
    R2*5

    %88
    la,16 si do re mi8 mi,
    la [la, do la]
    mi''16 fad sold la si8 re,

    %91
    do si la4\mbreak
    mi'16 fad? sold la si8 re,
    do si la4

    %94
    r8 mib'\p -.[(mib-. mib-.)]
    la4(mib)
    re8-.[(re-. re-. re-.)]

    %97
    la'4(do,)
    sol8\f[re sib sol]
    r8 re''\p -.[(re-. re-.)]

    %100
    sol4(re)
    do8-.[(do-. do-. do-.)]
    sol'4(sib,)

    %103
    fa16 sol fa mi fa sol fa mi
    fa sol fa mi\mbreak fa sol fa mi
    fa8 do' sib4\tr

    %106
    la8 la' sol4\tr
    fa8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,]

    %109
    fa4 r \mbreak
    R2*5
    r4 r8 do'

    %116
    re[re re re]
    re[re re re]
    re[re re re]

    %119
    re re r re
    do[do do do]
    do[do do do]\mbreak

    %122
    do[do do do]
    do do r do
    re4 r

    %125
    R2*9
    fa,16 sol fa mi fa sol fa mi % ripresa
    fa sol fa mi fa sol fa mi

    %136
    fa8 do' sib4\tr
    la8 sib sol4\tr \mbreak
    fa16 sol fa mi fa sol fa mi

    %139
    fa sol fa mi fa sol fa mi
    fa8 do' sib4\tr
    la8 la' sol4\tr

    %142
    fa8[mi16 re do8 sib16 la]
    re8[do16 sib la8 sol16 fa]
    fa'8[mi16 re do8 sib16 la]

    %145
    sib8[la16 sol do8 do,]
    fa4\fermata r \mbreak %%% fine ripresa

}

IIIvlIIn = \relative do'' {

    fa,16 sol la sib do8 do,
    re16 mi fa sol la8 la,
    sib16 do re mi fa sol la si

    %4
    do8 do, r4
    do4. re16 mi
    fa4. sol16 la

    %7
    do,4. re16 mi
    fa4. sol16 la
    la8 do-\parenthesize-. \p[\parentSlur (do-\parenthesize-. do-\parenthesize-.)]

    %10
    mib4(do)
    do8-\parenthesize-. [\parentSlur (do-\parenthesize-. do-\parenthesize-. do-\parenthesize-.)]
    mib4(la,)\mbreak

    %13
    sol8\f[re sib sol]
    r8 re''-.[(re-. re-.)]
    fa4(re)

    %16
    re8-.[(re-. re-. re-.)]
    fa4(si,)
    la8\f[mi do la]

    %19
    fa'16 sol fa mi fa sol fa mi % ripresa
    fa sol fa mi fa sol fa mi
    fa8 la sol4\tr

    %22
    fa8 sol mi4\tr \mbreak
    fa16 sol fa mi fa sol fa mi
    fa sol fa mi fa sol fa mi

    %25
    fa8 la sol4\tr
    fa8 fa' mi4
    fa8[mi16 re do8 sib16 la]

    %28
    re8[do16 sib la8 sol16 fa]
    fa'8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,]

    %31
    fa4 r \mbreak %%% fine ripresa
    R2*3
    fa16 sol fa mi fa sol fa mi

    %36
    fa4 r
    R2*24
    re16 mi re dod re mi re dod

    %62
    re mi re dod re mi re dod
    re'8[do16 sib la8 sol16 fa]
    sib8[la16 sol fa8 mi16 re]

    %65
    re'8[do16 sib la8 sol16 fa]
    sol8[fa16 mi la8 la,]
    re4 r
    R2*7   %%%% inizio p 16

    %75 OK
    r4 sold8 sold
    mi[mi fa fa]
    re[re re re]

    %78
    do[do fa fa]
    re[re re re]
    do[do' si si]

    %81
    si?[si si si]\mbreak
    do4 r
    R2*5

    %88
    la16 si do re mi8 mi,
    la [la, do la]
    mi'4. fad16 sold

    %91
    la4. si16 do\mbreak
    mi,4. fad16 sold
    la4. si16 do

    %94
    do8[do-.\p(do-. do-.)]
    mib4(do)
    do8-.[(do-. do-. do-.)]

    %97
    mib4(la,)
    sol8\f[re sib sol]
    r8 sib'-.\p[(sib-. sib-.)]

    %100
    re4(sib)
    sib8-.[(sib-. sib-. sib-.)]
    re4\parentSlur (sol,)

    %103
    fa16 sol fa mi fa sol fa mi
    fa sol fa mi\mbreak fa sol fa mi
    fa8 la sol4\tr

    %106
    fa8 fa' mi4\tr
    fa8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,]

    %109
    fa4 r \mbreak
    R2*5
    r4 r8 la

    %116
    la[la la la]
    la[la la la]
    la[la la la]

    %119
    sib sib r sib
    sol[sol sol sol ]
    sol[sol sol sol ]\mbreak

    %122
    sol[sol sol sol ]
    la la r la
    fa4 r

    %125
    R2*9
    fa16 sol fa mi fa sol fa mi % ripresa
    fa sol fa mi fa sol fa mi

    %136
    fa8 la sol4\tr
    fa8 sol mi4\tr \mbreak
    fa16 sol fa mi fa sol fa mi

    %139
    fa sol fa mi fa sol fa mi
    fa8 la sol4\tr
    fa8 fa' mi4

    %142
    fa8[mi16 re do8 sib16 la]
    re8[do16 sib la8 sol16 fa]
    fa'8[mi16 re do8 sib16 la]

    %145
    sib8[la16 sol do8 do,]
    fa4\fermata r

}

IIIvlan =  \relative do' {

    fa16 sol la sib do8 do,
    re16 mi fa sol la8 la,
    sib16 do re mi fa sol la si

    %4
    do8 do, r4
    do4. re16 mi
    fa4. sol16 la

    %7
    do,4. re16 mi
    fa4. sol16 la
    fad8[fad\p fad fad]

    %10
    fad?[fad fad fad]
    fad?[fad fad fad]
    fad?[fad fad fad]\mbreak

    %13
    sol\f[re sib sol]
    sold'[sold\p sold sold]
    sold?[sold sold sold]

    %16
    sold?[sold sold sold]
    sold?[sold sold sold]
    la\f[ mi do la]

    %19
    la16 sib la sol la sib la sol %% ripresa
    la sib la sol la sib la sol
    la4 re8 mi

    %22
    do4 do\mbreak
    la16 sib la sol la sib la sol
    la sib la sol la sib la sol

    %25
    la4 re8 mi
    do4 do
    fa'8[mi16 re do8 sib16 la]

    %28
    re8[do16 sib la8 sol16 fa]
    fa'8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,]

    %31
    fa4 r \mbreak %%% fine ripresa
    R2*3
    la,16 sib la sol la sib la sol

    %36
    la4 r
    R2*24
    fa'16 sol fa mi fa sol fa mi

    %62
    fa sol fa mi fa sol fa mi
    re'8[do16 sib la8 sol16 fa]
    sib8[la16 sol fa8 mi16 re]

    %65
    re'8[do16 sib la8 sol16 fa]
    sol8[fa16 mi la8 la,]
    re4 r

    %68
    R2*7
    r4 mi8 mi
    la, la re re

    %77
    sold, sold mi' mi
    la, la re re
    sold, sold mi' mi

    %80
    la,[la' la la]
    sold[sold fad mi]
    la,4 r

    %83
    R2*5
    la'16[si do re mi8 mi,]
    la [la, do la]

    %90
    mi'4. fad16 sold?
    la4. si16 do\mbreak
    mi,4. fad16 sold

    %93
    la4. si16 do
    fad,8[fad\p fad fad]
    fad?[fad fad fad]

    %96
    fad?[fad fad fad]
    fad?[fad fad fad]
    sol\f[re sib sol]

    %99
    mi'[mi\p mi mi]
    mi[mi mi mi]
    mi[mi mi mi]

    %102
    mi[mi mi mi]
    la,16 sib la sol la sib la sol
    la sib la sol\mbreak la sib la sol

    %105
    la4 re8 mi
    do4 do
    fa8[mi16 re do8 sib16 la]

    %108
    sib'8 la16 sol do8 do,
    fa4 r
    R2*5

    %115
    r4 r8 fad
    fad?[fad fad fad]
    fad?[fad fad fad]

    %118
    fad?[fad fad fad]
    sol sol r sol
    mi[mi mi mi]

    %121
    mi[mi mi mi]\mbreak
    mi[mi mi mi]
    fa fa r fa

    %124
    sib,4 r
    R2*9
    la16 sib la sol la sib la sol %% ripresa

    %135
    la sib la sol la sib la sol
    la4 re8 mi
    do4 do\mbreak

    %138
    la16 sib la sol la sib la sol
    la sib la sol la sib la sol
    la4 re8 mi

    %141
    do4 do
    fa'8[mi16 re do8 sib16 la]
    re8[do16 sib la8 sol16 fa]

    %144
    fa'8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,]
    fa4\fermata r \mbreak %%% fine ripresa

}

IIIfgn = \relative do {

    fa16 sol la sib do8 do,
    re16 mi fa sol la8 la,
    sib16 do re mi fa sol la si

    %4
    do8 do, r4
    \clef tenor \key fa\major do'16 re mi fa sol8 sib,?
    la sol fa4

    %7
    do'16 re mi fa sol8 sib,
    la sol fa4
    R2*4

    %13
    \clef bass\key fa\major sol8\f [re sib sol]
    R2*4
    la'8\f[mi do la]

    %19
    fa'16 sol fa mi fa sol fa mi  %%ripresa
    fa sol fa mi fa sol fa mi
    fa8[fa sol do,]

    %22
    fa[fa do' do,]\mbreak
    fa16 sol fa mi fa sol fa mi
    fa sol fa mi fa sol fa mi

    %25
    fa8[fa sol do,]
    fa[fa do' do,]\mbreak
    fa'8[mi16 re do8 sib16 la]

    %28
    re8[do16 sib la8 sol16 fa]
    fa'8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,] \mbreak

    %31
    fa4 r%%% fine ripresa
    fa16\solo sol fa mi re la' sol fa
    mi16 sib' la sol fa do' sib la

    %34
    sol sib sol mi do' sol mi do
    fa8 fa, r4
    fa'16 sol fa mi re la' sol fa

    %37
    mi sib' la sol fa do' sib la
    sol8 si4 do8
    fa2~

    %40
    fa16 mi re do sib8 la
    sib2~
    sib16 la sol fa mi8 re\mbreak

    %43
    mi16 re do8 r sol'
    la16 do fa, mib la do fa, mib
    re8 fad4 sol8

    %46
    si16 re sol, fa? si re sol, fa
    mi8 sold4 la8
    dod16 mi la, sol? dod mi la, sol

    %49
    fa la fad8 sol16 si sold8
    la16 do la8 sib!16 re si8
    do16 mi dod8 re16 fa re8

    %52
    dod16 la mi dod la8 r\mbreak
    r8 re'16 la sib la re sol,
    la sol re' fa, sol fa re' mi,

    %55
    fa mi re' re, mi re re' re,
    la2\tr
    r8 la'16 dod, re dod la' sib,

    %58
    do? sib la' la, sib la la' sol,
    la sol la' fa,\mbreak sol fa la' mi,
    fa la re fa la8 la,

    %61
    re16 mi re dod re mi re dod
    re mi re dod re mi re dod
    re'8[do16 sib la8 sol16 fa]

    %64
    sib8[la16 sol fa8 mi16 re]
    re'8[do16 sib la8 sol16 fa]
    sol8[fa16 mi la8 la,]

    %67
    re4 r8 dod
    r8 la' [la(si)]
    do2~

    %70
    do8[si si(dod)]
    re2\mbreak
    \tuplet 3/2 { do?16 re mi } la,[do] \tuplet 3/2 { fa, sol la } re,[ fa]

    %73
    \tuplet 3/2 { si16 do re } sol,[si] \tuplet 3/2 { mi, fa sol}  do,[mi]
    \tuplet 3/2 { la si do } fa,[la] \tuplet 3/2 { re, mi fa } si,[re]
    do8 la r si'

    %76
    do32 si la8. fa'4~
    fa8[mi16 re do8 si]
    do32 si la8. fa'4~

    %79
    fa8[mi16 re do8 si]
    do4(red)
    mi2\mbreak

    %82
    r16 do, si la mi re' do si
    mi, mi're do mi, fa' mi re
    mi, sold' fad mi mi, si'' la sold

    %85
    la si do re mi8 sold,
    la16 si do re mi8 sold,
    \tuplet 3/2 { la16 si do re,[mi fa] } mi8 mi,

    %88
    la'16[si do re mi8 mi,]
    la [la, do la]
    mi'16 fad sold la si8 re,

    %91
    do si la4\mbreak
    mi'16 fad sold la si8 re,
    do8 si la4

    %94
    R2*4
    sol'8\f [re sib sol]
    R2*4

    %103
    fa'16 sol fa mi fa sol fa mi
    fa sol fa mi\mbreak fa sol fa mi
    fa8[fa sol do,]

    %106
    fa[fa do' do,]
    fa'8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,]

    %109
    fa16. -\parenthesize \trill mi32 fa sol la sib do8 do,
    re16.\tr do32 re mi fa sol la8 la,
    sib16.\tr la32 sib do re mi fa8 fa,

    %112
    do' do, r16 do'' re sib
    do la sib sol la fa sol mi\mbreak
    fa do re la sib4\tr

    %115
    la-\parenthesize \p r8 do'
    do32(re mib8.)~mib16[re32(do si16 do)]
    do32(re mib?8.)~mib16[re32(do si16 do)]

    %118
    do sib? la sol fad mib' re do
    sib sol re sib sol8 r
    sib'32(do re8.)~re16[do32( sib la16 sib)]

    %121
    sib32(do re8.)~re16[do32( sib la16 sib)]\mbreak
    sib16 la sol fa mi re' do sib
    la fa do la fa8 r

    %124
    \senza \tuplet 3/2 { re''16 sib la sol[fa mi] do' la sol fa[mi re]
    sib' sol fa mi[re do] la' fa mi re[do si]}
    do4 r16 do' sib? la

    %127
    \once\stemUp do,, sib'' la sol \once\stemUp  do,, la'' sol fa
    \once\stemUp do, sol'' fa mi \once\stemUp do, [do''32 sib la16 do]
    \once\stemUp do,,[sib''32 la sol16 sib] \once\stemUp  do,, [la''32 sol fa16 la]\mbreak

    %130
    do,,4 \tuplet 3/2 { r16 mi' fa sol[la sib]
    la do sib la[sol fa]} sib,8 do
    \tuplet 3/2 { \once\stemUp fa,16 do'' sib la[sol fa] } sib,8 do

    %133
    fa,4 r
    fa'16 sol fa mi fa sol fa mi  %%ripresa
    fa sol fa mi fa sol fa mi

    %136
    fa8[fa sol do,]
    fa[fa do' do,]
    fa16 sol fa mi fa sol fa mi  %%ripresa

    %139
    fa sol fa mi fa sol fa mi
    fa8[fa sol do,]
    fa[fa do' do,]

    %142
    fa'8[mi16 re do8 sib16 la]
    re8[do16 sib la8 sol16 fa]
    fa'8[mi16 re do8 sib16 la]

    %145
    sib8 la16 sol do8 do,
    fa4\fermata r \mbreak %%% fine ripresa

}

IIIbcn = \relative do {

    fa16 sol la sib do8 do,
    re16 mi fa sol la8 la,
    sib16 do re mi fa sol la si

    %4
    do8 do, r4
    \clef tenor \key fa\major do'16 re mi fa sol8 sib,?
    la sol fa4

    %7
    do'16 re mi fa sol8 sib,
    la sol fa4
    R2*4

    %13
    \clef bass\key fa\major sol8\f [re sib sol]
    R2*4
    la'8\f[mi do la]

    %19
    fa'16 sol fa mi fa sol fa mi  %%ripresa
    fa sol fa mi fa sol fa mi
    fa8[fa sol do,]

    %22
    fa[fa do' do,]\mbreak
    fa16 sol fa mi fa sol fa mi
    fa sol fa mi fa sol fa mi

    %25
    fa8[fa sol do,]
    fa[fa do' do,]\mbreak
    fa'8[mi16 re do8 sib16 la]

    %28
    re8[do16 sib la8 sol16 fa]
    fa'8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,] \mbreak

    %31
    fa4 r%%% fine ripresa
    fa_\markup {\circle {9 }} sib,
    do re

    %34
    mi do
    fa16 sol fa mi fa sol fa mi
    fa4 sib,

    %37
    do re
    mi8[sol fa mi]
    re[do sib la]

    %40
    sib4. fa'8
    sol[fa mi re]
    do4. si8\mbreak

    %43
    do[re mi do]
    fa,2
    sib8[re do si16 la]

    %46
    sol2
    do8[mi re dod16 si]
    la2

    %49
    re8[do si mi]
    do fa re sol
    mi la fa sib

    %52
    la4 la,\mbreak
    re8 r fa r
    mi r re r

    %55
    do r sib r
    la16 si dod re mi8 dod
    la r la r

    %58
    sol r fa r
    mi r \mbreak re mi
    fa re la'4

    %61
    re16 mi re dod re mi re dod
    re mi re dod re mi re dod
    re'8[do16 sib la8 sol16 fa]

    %64
    sib8[la16 sol fa8 mi16 re]
    re'8[do16 sib la8 sol16 fa]
    sol8[fa16 mi la8 la,]

    %67
    re4 r8 dod
    re4 r8 sol
    do,4 r8 re'

    %70
    sol,4 r8 la
    re,4 r8 mi'\mbreak
    la, r re, r

    %73
    sol r do, r
    fa r sold, r
    la4 r

    %76
    R2*6
    la4 mi
    mi mi

    %84
    mi mi
    la8[la' sold mi]
    la,[la' sold mi]

    %87
    la re, mi mi,
    la'16_\markup {\circle {10 }} [si do re mi8 mi,]
    la[la, do la]

    %90
    mi'16 fad sold la si8 re,
    do si la4\mbreak
    mi'16 fad sold la si8 re,
    do8 si la4

    %94
    R2*4
    sol'8\f [re sib sol]
    R2*4

    %103
    fa'16 sol fa mi fa sol fa mi
    fa sol fa mi\mbreak fa sol fa mi
    fa8[fa sol do,]

    %106
    fa[fa do' do,]
    fa'8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,]

    %109
    fa4_\markup {\circle {11 }} do
    re la
    sib fa

    %112
    do'8 mi fa sib
    la[sol fa mi]\mbreak
    fa[fa, sol mi]

    %115
    fa[fa fa] r
    R2*3
    r16 sol' re sib sol8 r

    %120
    R2*3
    r16 fa' do la fa8 r
    sib' mi, la re,

    %125
    sol do, fa si,
    do[do, do] r
    do r do r

    %128
    do r do r
    do r do r\mbreak
    do[do do do]

    %131
    fa[fa sib do]
    fa,[fa sib do]
    fa,4 r

    %134
    fa'16 sol fa mi fa sol fa mi  %%ripresa
    fa sol fa mi fa sol fa mi
    fa8[fa sol do,]

    %137
    fa[fa do' do,]\mbreak
    fa16 sol fa mi fa sol fa mi
    fa sol fa mi fa sol fa mi

    %140
    fa8[fa sol do,]
    fa[fa do' do,]\mbreak
    fa'8[mi16 re do8 sib16 la]

    %143
    re8[do16 sib la8 sol16 fa]
    fa'8[mi16 re do8 sib16 la]
    sib8[la16 sol do8 do,] \mbreak

    %146
    fa4\fermata r%%% fine ripresa

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 2/4
  \tempo 2 = 55
  s2*146
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

IIIfg = {
  \IIIglobal
  \clef bass
  <<\IIIfgn \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 16)


\pointAndClickOff

\header {
  title = \markup \smaller{"Concerto per Fagotto [RV 485]"}
  %subsubtitle = \markup\small#(string-append "  ")
  composer = \markup \center-column{"A. Vivaldi (1678-1741)"}
}

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] All[egr]o non molto"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"primo]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"secondo]"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotto"}
            \Ifg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
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

\markup\huge "[2.] And[ant]e"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

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
            \set Staff.midiInstrument = #"bassoon"
            \IIfg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
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

\markup\huge "[3.] All[egr]o molto"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

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
            \set Staff.midiInstrument = #"bassoon"
            \IIIfg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
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
