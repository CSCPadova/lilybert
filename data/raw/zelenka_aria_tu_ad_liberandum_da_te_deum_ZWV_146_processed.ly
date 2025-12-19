\language "italiano"
	%********************************** VARIABILI

\version "2.17.97"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

ten = ^\markup \italic \center-align "ten"

tr = \trill

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

ds = \markup \italic \small \center-column{"Da Capo""dal Segno"}

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \con
}

flIn = \relative do'' {

    r4 si' sol8. fad16 mi[(red mi8)] mi4. \tr red16  mi
    fad(mi fad8) fad4.\tr mi16 fad sol[(fad)] mi4 do'8 si( la)
    sol16(fad) mi4 do'8 [si(la)] sol16(fad) mi4. r4

    %4
    R1.*2
    fad8 re!16 mi fad[(sol) fad(sol)] fad(sol) fad(sol) \parenthesize sol4 mi8(red) mi8 [si']
    lad(si) dod(lad) si4~si8 sold lad4. si8

    %8
    si4 fad32(mi re8.) fad32(mi re8.) mi32(re dod8.) mi32(re dod8.) mi32(re dod8.)
    re8(mi) dod4. si8 si4 si' si
    si32(la sold8.) si32(la sold8.) si32(la sold8.) do2.~

    %11
    do16 la sol(fad) la32(sol fad8.) la32(sol fad8.) \appoggiatura lad8 si2.~
    si16 sol fad mi sol32(fad mi8.) sol32(fad mi8.) \appoggiatura sold8 la2.~\mbreak
    la8  si sol(fad) sol4 sol8(la) fad4. mi8

    %14
    mi4 si'32(la sol8.) si32(la sol8.) la32(sol fad8.) la32(sol fad8.) la32(sol fad8.)
    sol8(la) fad4. mi8 mi4 r2
    R1.*2

    %18 OK
    r4 sol32(fad mi8.) sol32(fad mi8.) fad32 (mi red8.) fad32(mi red8.) fad32(mi red8.)
    mi8 dod red?4. mi8 mi4 r r
    R1.*5

    %25
    r2. r4 fad fad
    fad32(mi re8.) fad32(mi re8.) fad32(mi re8.) sol2.~
    sol16 mi re dod? mi32(re dod8.) mi32(re dod8.)fad2.~

    %28
    fad16 re dod si re32(dod si8.) re32(dod si8.) mi8 red mi2\mbreak
    mi4(fad8) mi re4~re8 mi dod4. si8
    si4 re'32(dod si8.) re32(dod si8.)dod32(si lad8.) dod32(si lad8.) dod32(si lad8.)

    %31
    si8 sold lad4. si8 si4 r r
    R1.
    r4 la fad8 mi re16([dod re8)] re4. \tr dod16 re

    %34
    mi16(re mi8) mi4. re16 mi fad [mi] re4 si'8[la sol]
    fad16 mi re8~re [si' la sol] fad16 mi re4. r4
    R1.*5

    %41
    r2. r4 re'32(do si8.) re32(do si8.)
    do32(si la8.) do32(si la8.) do32(si la8.) si4 r r
    R1.

    %44
    r4 mi,32(re do8.) mi32(re do8.) re32(do si8.) re32(do si8.) re32(do si8.)\mbreak
    do4 r r r2.
    r r4 si'32(la sol8.) si32(la sol8.)

    %47
    la32(sol fad8.) la32(sol fad8.) la32(sol fad8.) sol4 r r
    R1.*2
    r4 si si si32(la sold8.) si32(la sold8.) si32(la sold8.)

    %51
    \appoggiatura si8 do2.~do16 la sol fad la32(sol fad8.) la32(sol fad8.)
    \appoggiatura lad8 si2.~si16 sol fad mi sol32(fad mi8.) sol32(fad mi8.)\mbreak
    la2.~la8 [si sol fad] sol4~

    %54
    sol8 la fad4. mi8 mi4 sol32(fad mi8.) sol32(fad mi8.)
    fad32(mi red8.) fad32(mi red8.) fad32(mi red8.) mi4 r r
    R1.*5

    %61
    r4 si'32(la sol8.) si32(la sol8.) la32 sol fad8. la32 sol fad8. la32 sol fad8.
    sol8 la fad4.^\markup\italic"adag[io]"  mi8 mi2 r4

}

flIIn = \relative do'' {

    R1.*2
    r2. r4 mi re8(do)
    si16(lad) si8 si4.\tr lad16 si dod16[(si dod8)] dod4.\tr si16 dod\mbreak

    %5
    re(dod) si4 sol'8[fad(mi)] re16 (dod) si4 sol'8[fad(mi)]
    re16(dod si8) r4 r sol '8 mi16 fad sol(la) sol(la) sol[(la) sol(la)]
    sol4 fad8(mi) re4~re8 mi dod4. si8

    %8
    si4 re32(dod si8.) re32(dod si8.) dod32(si lad8.) dod32(si lad8.) dod32(si lad8.)\mbreak
    si8(dod) lad4. si8 si4 r r
    r4 mi mi mi32(re do?8.) mi32(re do8.) mi32(re do8.)

    %11
    fad2.~fad16 re dod(si) re32 dod si8. re32 dod si8. \appoggiatura red8 mi2.~
    mi16 do? si la do32(si la8.) do32(si la8.)
    si4 red mi mi8(fad) red4. mi8

    %14
    mi 4sol32(fad mi8.) sol32(fad mi8.) \once\slurDashed fad32(mi red8.) fad32(mi red8.) fad32(mi red8.)
    mi8(dod) red4. mi8 mi4 r2
    R1.*2

    %18 OK
    r4 si32(la sol8.) si32(la sol8.) la32(sol fad8.) la32(sol fad8.) la32(sol fad8.)
    sol8 la fad4. mi8 mi4 r r
    R1.*6

    %26
    r4 si' 'si si8.(la32 sol) si(la sol8.) si32(la sol8.)
    dod?2.~dod16 la sol fad la32(sol fad8.) la32(sol fad8.)
    si2.~si16 sol fad mi si'32(la sol8.) si32(la sol8.) \mbreak

    %29
    lad2 si4 si8 sold lad4. si8
    si4 fad32(mi re8.) fad32(mi re8.) mi32(re dod8.) mi32(re dod8.) mi32(re dod8.)
    re8 mi dod4. si8 si4 r r

    %32
    R1.*9
    r2. r4 si'32(la sol8.) si32(la sol8.)
    la32(sol fad8.) la32(sol fad8.) la32(sol fad8.) sol4 r r

    %43
    R1.
    r4 do32(si la8.) do32(si la8.) si32(la sold8.) si32(la sold8.) si32(la sold8.)\mbreak
    la4 r r r2.

    %46
    r r4 re,32(do si8.) re32(do si8.)
    do32(si la8.) do32(si la8.) do32(si la8.) si4 r r
    R1.*2

    %50
    r2. r4 mi mi
    mi32(re do8.) mi32(re do8.) mi32(re do8.) fad2.~
    fad16 re do si re32(do si8.) re32(do si8.) \appoggiatura red8 mi2.~\mbreak

    %53
    mi16 do si la do32(si la8.) do32(si la8.) si4 red mi
    mi8 dod red4. mi8 mi4 si32(la sol8.) si32(la sol8.)
    la32(sol fad8.) la32(sol fad8.) la32(sol fad8.) sol4 r r

    %56
    R1.*5
    r4 sol'32(fad mi8.) sol32(fad mi8.) fad32(mi red?8.) fad32(mi red8.) fad32(mi red8.)
    mi8 fad red4. mi8 mi2 r4

}

vln = \relative do'' {

    mi,4\p sol mi do' la fad
    red si red mi mi red
    mi mi red mi mi fad

    %4
    sol mi do lad fad' lad,\mbreak
    si si' lad si, si' lad
    si, re si mi mi mi

    %7
    fad fad sol mi fad fad
    si, si' si, r lad' fad\mbreak
    si8 mi, fad4 fad si,8 si'16 dod? re8 si re si

    %10
    mi mi,16 fad sold8 [mi sold mi ]la8 la,16 si do8 la do la
    re' re,16 mi fad8 [re fad re] sol sol,16 la si8 sol si4
    do'8 do,16 re mi8 [do mi do] fad4 fad fad\mbreak

    %13
    red si' sol la si si,
    mi mi' mi, r red' si,
    mi8 la si4 si, r2 r4

    %16
    R1.*2
    r4 mi' mi, r red' si,
    mi8 la, si4 si mi r r

    %20
    R1.*2
    r4 mi' re8 [do] si16(lad si8) si4.\tr lad16 si
    dod?(si dod8) dod4.\tr si16 dod re[(dod)] si4 sol'8[ fad(mi)]

    %24
    re16(dod?) si4 sol'8 fad[(mi)] re16(dod) si4. r4
    r2. fad'8 fad,16 sold? lad8 fad lad fad
    si si,16 dod re8 [si re si] mi' mi,16 fad sol8 mi sol mi

    %27
    la la,16 si dod?8 [la dod la] re' re,16 mi fad8 re fad re
    sol sol,16 la si8 [sol si sol] dod' dod,16 red? mi8 dod mi dod\mbreak
    fad4. fad8 sol4 mi fad fad

    %30
    si, si' si, lad' r fad
    si8 mi, fad4 fad si, r r
    R1.\mbreak

    %33
    re4 fad re si' sol mi
    dod la dod re re dod
    re re dod re r r

    %36
    R1.
    r4 do'8\f\solo(re) mi4 la, re8(mi) fad4
    si, mi8(fad) sol4 re fad8 sol la4~

    %39
    la sol2~sol4 fad2~
    fad8 (sol) sol(la) la(sol) fad [sol] la4 re,\mbreak
    mi8 fad fad4. sol8 sol4 sol, sol,

    %42
    r fad' re sol r r
    R1.
    r4 la la, r sold' mi\mbreak

    %45
    R1.
    r2. r4  sol sol,
    r fad' re sol r r

    %48
    R1.*2
    si8 si,16 do red8[si red si] mi' mi,16 fad sold8 mi sold mi
    la la,16 si do8[la do la] re' re,16 mi fad8 re fad re

    %52
    sol sol,16 la si8[sol si sol] do' do,16 red? mi8 do mi do\mbreak
    fad4 fad mi red si'8 la sol4
    la si sol, mi' mi r

    %55
    r red si mi2 r4
    \slurDashed mi'32\solo\p  (re do8. )mi32 (re do8.) \slurSolid mi32 (re do8.) fad2.~
    fad16 re do si  re32(do si8.) re32(do si8.) mi2.~

    %58
    mi16 do si la do32(si la8.) do32(si la8.) si8[(do) red(mi) fad(red)]
    \appoggiatura do8 si4 r r r2.
    R1.

    %61
    r4 mi mi, r red' si,
    sol' si si, mi2 r4

}

vocen = \relative do' {

    \autoBeamOff

    R1.*14
    r2. r4 si' sol8[(fad)]
    mi red mi mi4\tr red16[mi] fad8[(mi)]fad fad4\tr mi16 [fad]\mbreak

    %17
    sol16[(fad)] mi4 do'8[si(la)]  sol16[(fad)] mi4 do'8[ si(la)]
    sol8[(fad)] mi4 r r2.
    r r4 si' sol8\tr[(fad)]

    %20
    mi8 red mi mi4\tr red16 [mi] fad[(mi fad8)] fad4.\tr mi16[fad]\mbreak
    sol16[(fad)] mi4 do'8[si la] sol16[(fad)] mi4 do'8[si la]
    sol8 fad4\tr fad16[sol] la4~la sol8\tr[(fad)] sol4~

    %23
    sol8 fad fad8.[(sol16)] mi4 re4.\tr re8 dod4
    r2. r4 fad4 fad\mbreak
    si4. lad8[si dod] lad sold fad4 r

    %26
    si fad si mi,8\tr[red] mi4 r
    la4. sol8 la4 re,8 dod re4 r
    sol sol8[fad] sol4 dod,8\tr[si] dod4 r\mbreak

    %29
    fad4. fad8 sol4 mi(fad4.) fad8
    si,2 r4 r2.
    r r4 fad' fad

    %32
    sol sol4.(la16)[si] la4 mi la\mbreak
    fad8 mi re4 r sol sol fad
    mi8.[(sold16)] la4 sold\appoggiatura sold8 fad4.\tr fad8 mi4

    %35
    r2. la4 la4. sol8
    fad8.[(lad16)] si4 lad\appoggiatura la?8 sol4.\tr sol8 fad4\mbreak
    mi4 la sol fad8[sol16 la] si8[la la8.\tr sol16]

    %38
    sol8 [la16 si] do8[(si)] si8.\tr[la16] la8[si16 do] re8[do do8.\tr si16]
    si32[(la sol8.)] si32[(la sol8.)] si16[ sol(la sol)] do32[(si la8.) ] do32[(si la8.)] do16[la si la]
    re8[do16 si] la8[sol fad mi] \appoggiatura mi8 re4. do'8 si4~\mbreak

    %41
    si8 [sol] la2\tr  sol r4
    r2. r4 si la
    \appoggiatura la8 sold4 sold4.\tr fad16[sold] la8[(si)] si4. la16[ si]

    %44
    do8 si la4 r r2.\mbreak
    r4 la \tuplet 3/2 { sol8[fad sol] } fad4 fad4.\tr mi16[fad]
    sol8[la] la4. sol16[la] si8[la] sol4 r

    %47
    r2. si4 la8[sol] fad[mi]
    red8[(mi)] mi4 fad sol16[(fad)] mi4 do'8[si la]\mbreak
    sol16[fad] mi4 do'8[si la] sol[fad  mi sol fad mi]

    %50
    red do si4 r mi sold mi
    la8[sold] la4 r re, fad8 mi re4
    sol8 [fad] sol4 \parenthesize r do, mi do\mbreak

    %53
    fad8[mi fad sol fad mi] red4 si'8[la] sol4
    la si2 mi, r4
    r2. si'4 mi,  si'

    %56
    do2.~do16 [la sol fad] la32[sol fad8.] la32[sol fad8.]\mbreak
    \once\tieDashed si2.~si16[sol fad mi] sol32[fad mi8.] sol32[fad mi8.]
    la2. la4(si8)[la sol fad]

    %59
    sol16[fad mi fad] sol[fad sol la] sol[si la sol] la[sol fad sol] la[sol la si] la[do si la]
    si[la si do] si8 [la] sol4~ sol8^\markup\italic"adag[io] ad lib[itum]" [fad] fad2\mbreak
    mi2 r4 r2.

    %62
    R1.

}

testo = \lyricmode {

    Tu, ad libe - ra -  - - - - -  - - - - - - - ndum
    Tu, ad libe - ra -  - - - - -  - - - - - - - - - ndum
    su -- scepturus _ _ hominem, _ _ suscep - tu -- rus hominem, _ _
    non horruisti _ _ _  Vir -- ginis _ uterum _ _ non horru - isti _  Vir -- ginis _ ute - rum.
    Tu, de -- victo _ mortis _ a -- cule - o,
    ape - ru -- isti _ cre -- denti - bus  ape - ru -- isti _ cre -- denti - bus
    Regna _ caelo - - - - - - - - - - - - - - - - - - - rum.
    Tu, de - victo _ mortis _ a -- cule - o, Tu, de - victo _ mortis _ a -- cule -- o,
    ape - ru -- isti _ creden - - -- - - - - - - ti -- bus  ape - ru -- isti _ cre -- denti - bus
    Regna _  Regna _ cae -- lo - - - - - rum,
    Regna _ cae -- lo - - - - - - - - - - - - - - - - - rum.

}

bcn = \relative do {

    R1.*14
    r2. mi4 sol mi
    do' la fad red si red\mbreak

    %17
    mi mi red mi mi red
    mi2 r4 r2.
    r mi4 sol mi

    %20
    do' la fad red si red\mbreak
    mi mi red mi mi red
    mi, mi' fad sol mi dod

    %23
    lad fad' lad, si si' lad
    si, si' lad si, si' lad\mbreak
    sol fad mi fad2 r4

    %26
    R1.*5
    r2. si4 re si
    mi si mi dod4. si8 la dod\mbreak

    %33
    re2 r4 r2.
    R1.
    r2. re,4 fad la

    %36
    re red si mi mi, si'\mbreak
    do la do re, si re
    mi re mi fad re fad

    %39
    sol sol, sol' la la, la'
    si do do do fad, sol\mbreak
    do la re sol, sol, r

    %42
    r2. sol4 sol' fa
    mi mi' re do sold mi
    la la, r r2.\mbreak

    %45
    la4 do la re re' do
    si fad re sol sol, r
    r2. sol4 sol' la

    %48
    si8 la sol4 red mi r red\mbreak
    mi r red mi do' la
    si2 r4 r2.

    %51
    R1.*4
    r2. mi8 mi,16 fad sol8 mi  sol mi
    la la,16 si do8 [la do la] re' re,16 mi fad8 re fad re\mbreak

    %57
    sol8 sol,16 la si8[sol si sol] mi'' do,16 re mi8 do mi do
    fad4 fad mi red si red
    mi mi, mi' fad re fad

    %60
    sol red mi la, red si
    mi2 r4 r2.
    R1.

}

bfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.*15
    s4 <5> <7> s <_+> s
    s s <6> s s <6>
    s1.
    s2. s4 <6> s
    s s <7> <6> <_+> s
    s s <6> s s <6>
    s s <6 5> <9> <3> <7 5>
    <6> <_+> s s s <6>
    s s <6> s s <6>
    <5> <6 4> <5> <_+> s s
    s1.*6
    s4 <6> s <6>  s <_+>

    %33
    s1.*2
    s2. s4 <6> <5>
    s <6> <_+> <_-> s s
    s1.
    \bassFigureExtendersOn s2. <6>4 <6> s
    <9> <8> <8> <9> <8> s
    <5> <6> <6> <4 2> <6> s
    s <6> s s2.
    s s4 s <3>
    <_+>1.
    s
    s2. s4 s <4 2>
    <6>1.
    s2. s4 s <6 5>
    <_+> <6> s s2.
    s1.
    <_+>
    s1.*4
    s2. s4 s <_+>
    s2. <7>2 s4
    <7>2 <7>4 <5>2 <5>4
    <7> <6>8 s  <6 4>4 s <6-> s
    s2. <6>
    s4 <6> s <5 3> s <_+>
    s1.
    <7>4 <_+>

}

forma = {

    \override Staff.TimeSignature.style = #'single-digit
    \time 3/2
    \key mi\minor
    \tempo 4 = 67
    s1.*62
    \bar"|."

}



flI = {
    \global
    %\notypeset
    <<\flIn \forma>>

}

flII = {
    \global
    <<\flIIn \forma>>

}

vl = {
    \global
    <<\vln \forma>>

}


voce = {
    \new Voice = "tu ad"
    \global
    \clef "treble_8"
    <<\vocen \forma>>

}

bc = {
    \global
    \clef bass
    <<\bcn \forma \bfn>>
    \typeset

}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge {[1.] Andante sostenuto}

\score {

            \new ChoirStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup  \center-column{"Traversa""1."}
                    \flI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup  \center-column{"Traversa""2."}
                    \flII
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup  \center-column{"T[utti]""Violini"}
                    \vl
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"voice oohs"
                    \voce
                    \new Lyrics \lyricsto "tu ad" \testo
                >>

                \new Staff
                \with {
                    fontSize = #+1
                    \override StaffSymbol #'staff-space = #(magstep +1)
                }
                <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                    \bc

                >>
            >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 8)  %aumenta lo spazio orizzontale
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

