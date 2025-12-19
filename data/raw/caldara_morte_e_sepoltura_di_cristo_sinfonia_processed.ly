\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

solo = ^\markup \italic { solo }

soli = ^\markup \italic { soli }

trio = ^\markup \italic {trio}

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinesedici = \tupletSpan 16

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

senza = \override TupletNumber.transparent = ##f

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


mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \senza
}

IvlIn = \relative do'' {

    R1*2
    fad2 sol4 mid
    r8 fad re dod\mbreak re2

    %5
    dod4 r re4. mi,8
    dod'4. re,8 si'4. dod,8
    la'4. sold16 fad sold2

    %8
    fad4 r r2\mbreak
    R1
    r2 r4 re'8 dod16(si)

    %11
    mi8 mi fad mi re16 dod si8 r fad'
    fad mi16 re mi8 mi mi\tr(re) fad[si]\mbreak
    sol4 fad2 r8 fad

    %14
    fad mi16 red mi8 mi mi(red) la' sol16(fad)
    sol fad mi8 r4 fad4. sol,8
    mi'4. fad,8 re'4. mi,8

    %17
    dod'4. re,8 si'4. dod,8
    lad'2\fermata r8 si\p si si
    lad4 si2 lad4

    %20
    si1\fermata

}

IvlIIn = \relative do'' {

    si2 do4 lad
    r8 si sol fad sol2
    fad4 r8 dod' re4 dod~

    %4
    dod la~\mbreak la sold8 fad
    mid fad dod'4. re,8 si'4~
    si8 dod, la'4. si,8 sold'4~

    %7
    sold8 dod,8 fad4~fad mid
    fad lad8 sold16 fad si8 si dod[si]\mbreak
    lad16 sold fad8 r dod' dod si16 lad si8 si

    %10
    si\tr(lad) fad'16 mi re dod re dod si8 r si'
    sol(mi) dod4 r8 re si lad
    si2~si4 r8 sol'\mbreak

    %13
    mi4 dod4. fad,8 si[lad]
    si4. la?16 sol la8 fad' red8.\tr dod32(red)
    mi8 si mi4~mi8 fad, re'4~

    %16
    re8 mi, dod'4. re,8 si'4~
    si8 dod, la'4. si,8 sol'4
    fad2\fermata r8 sold\p sold sold

    %19
    fad4 fad fad2
    fad1\fermata

}


Ivlan = \relative do {

    r4 re'8 dod16 si mi8 mi fad[mi]
    re16 dod si8 r fad' fad mi16 re mi8 mi
    mi re  r la' si4 sold

    %4
    fad r8 mid\mbreak fad4 re8 re'
    sold, la r fad fad fad mi mi
    mi mi re re re re dod dod

    %7
    dod dod re re re re dod dod
    dod4 r r2\mbreak
    R1

    %10
    r2 si'
    do4 lad r8 si sol fad
    sol2 fad4 re8 dod?16 si\mbreak

    %13
    mi8 mi fad[mi] re16 dod si8 r dod
    si4 r8 sol' dod,4 fad
    si,8 sol' la[la] la la sol[sol]

    %16
    sol sol fad fad fad fad mi[mi]
    mi mi re re re re dod dod
    dod2\fermata r8 re\p re re

    %19
    dod4 re dod2
    si1\fermata

}

Ibcn = \relative do {

    R1*2_\markup\italic "Senz'Organo"
    r4 la'8 sold16 fad si8 si dod si
    la16 sold fad8 r dod'\mbreak dod si16 la si8 si

    %5
    si la r lad si si sold sold
    la la fad fad sold sold mid mid
    fad fad re re si si dod dod

    %8
    fad2 sold?4 mid\mbreak
    r8 fad re dod re2
    dod4 r r2

    %11
    R1
    r2 si'\mbreak
    do4 lad r8 si sol fad

    %14
    sol2 fad
    mi8 mi dod[dod] re re si[si]
    dod dod lad[lad] si si sold[sold]\mbreak

    %17
    la la fad fad sol sol mi mi
    mi2\fermata r8 mid\p mid mid
    fad1

    %20
    si\fermata

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    s2 <6>4 <_+>
    s2 <2>4 <6+>8 <5>
    <4+>2 <10 9>4 <6 5>
    <10 9> <6 5> <10 9> <6 5>
    <10 9>2 <6 5>
    s1
    s2 <7>4 <6>
    <7>8 <6+> s4 s2
    s1*2
    s2 s4 s8 <_+>
    <7>4 <6> <7> <6+>
    s s <10 9> <6 5>
    <9> <6 5> <9> <6 5>
    <9> <6 5> <9> <6 5>
    <4+>2

}


forma = {

    \key si\minor
    \time 4/4
    \tempo 4 = 35
    s1*20
    \bar"||"

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

}



IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \senza
}

IIvlIn = \relative do'' {

    si8 sol' fad16(mi) re(dod) si8 sol' fad16(mi) re(dod)
    si8 si16 dod re8 dod16 si dod8 fad, mid4
    r8 fad mid4 r8 dod' fad4~

    %4
    fad8 mid mid4\mbreak fad8 fad mi? re16 dod
    re(dod) si8 r fad' re4 r8 fad
    re re16 mi fad8 mi16 re dod8 la16. si32 dod8 dod,

    %7
    r la'16. si32 dod8 dod, r2\mbreak
    r si'8 sol' fad16(mi) re(dod)
    si8 sol' fad16(mi) re(dod)  si8 si' sol16(fad) mi(re)

    %10
    dod8 re fad mi16 re dod8 dod dod4
    si r r8 mi16 fad sol8 fad16 mi\mbreak
    fad8 re dod4 r8 re dod4

    %13
    r8 fad mi16(re) dod(si) la8 fad' mi16(re) dod(si)
    la8 la'4 sol fad mi8~
    mi re4 dod8 re re16 mi fad8 mi16 re\mbreak

    %16
    mi4 la4. sol8[sol fad16 mi]
    fad(sol) la8 r4 r2
    r r8 fad si4~

    %19
    si8 [la la sol16 fad] sol8 sol16. la32 si8 si,
    r sol'16. la32 si8 si,\mbreak r2
    la8 fa' mi16(re) do(si) la8 fa' mi16(re) do(si)

    %22
    la8 la16 si do4. la16 sol fa mi' re do
    si8 si16. do32 re8 re, r si'16. do32 re8 re,\mbreak
    re' si' la16(sol) fad(mi) re8 do' si16(la) sol(fad)

    %25
    mi8 sol la16(sol) fad(mi)  red8 mi4 red8
    mi mi16 fad sol8 fad16 mi fad4 si~
    si8[lad lad8.\tr sold32(lad)] si8 re,16 mi fad8 mi16 re\mbreak

    %28
    dod?4 r r2
    R1*3
    fad8 re' dod16(si) lad(sold) fad8 re' dod16(si) lad(sold)

    %33
    fad8 fad16 sol? la?8 sol16 fad sol8 mi16 fad sol8 fad16 mi
    fad8 re16 mi fad8 mi16 re mi8 dod16 re mi8 re16 dod
    re8 si16 dod re8 dod16 si dod8 fad, fad'4~

    %36
    fad8 mi mi re16 dod re4. dod16 si
    dod2 si4 si,8\p dod
    re1_\tr

    %39
    dod\fermata

}

IIvlIIn = \relative do'' {

    R1
    r2 fad,8 re' dod16(si) la(sold)
    fad8 re' dod16(si) la(sold) fad8 fad16 sold la8 sold16 fad

    %4
    sold8 dod, sold'4\mbreak fad8 fad sold[lad]
    si si lad4 r8 si lad4
    r8 si fad si la?4 r8 dod

    %7
    la4 r8 dod la16 si dod4 si16 la\mbreak
    si8 sold si dod fad, re' dod4
    r8 re dod4 r8 re mi16(re) dod(si)

    %10
    lad8(si) si4. si8 lad4
    si8 si16 dod re8 dod16 si dod8 dod16 re mi8 re16 dod\mbreak
    re4 r8 la fad4 r8 la

    %13
    fad re' dod16(si) la(sol) fad8 re' dod16(si) la(sol)
    fad4 si la sol
    fad mi re r\mbreak

    %16
    r8 la'16 si dod8 si16 la si4 mi~
    mi8[re re dod16 si] dod re mi4 re16 dod
    re4 si8 mi la,4 r8 si

    %19
    mi mi fad fad fad\tr(mi) r4
    mi,8 do' si16(la) sol(fad)\mbreak mi8 mi' re do16 si
    do8 do si4 r8 do si4

    %22
    r8 do16 re mi(do) la(sol) fad mi re4 fad8\tr
    sol4 r8 re' si4 r8 re\mbreak
    si4 r8 la fad4 r8 si

    %25
    sol si do16(si) la(sol) fad8 mi fad4
    mi r r8 re'16 mi fad8 mi16 re
    mi8 dod?16 re mi8 re16 dod re8 si16 dod re8 dod16 si\mbreak

    %28
    lad8 sol' fad16(mi) re(dod) si8  sol' fad16(mi) re(dod)
    si8 si16 dod re8 dod16 si dod8 fad, mid4
    r8 fad\noBeam mid8 dod' lad4 si8 dod

    %31
    re4 r8 fad, re4 r8 fad\mbreak
    re \once\stemDown fad' mi16(re) dod(si) lad8 fad' mi16(re) dod(si)
    lad4 r8 si mi,4 r8 la?

    %34
    re,4 r8 sol dod,4 r8 fad
    si,4 si'4. lad16 si dod8 si16 lad\mbreak
    si8 si dod4. fad,8 si4~

    %37
    si lad si r
    r8 si,\p si si si2
    fad'1\fermata

}


IIvlan = \relative do' {

    R1*4
    si8 sol' fad16(mi) re(dod) si8 sol' fad16(mi) re(dod)
    si8 si16 dod re8 dod16 si dod8 fad, mid4

    %7
    r8 fad mid4 r8 dod' fad4~
    fad8[mi? mi re16 dod] re dod si8 r fad'
    re4 r8 fad re4 r8 mi

    %10
    fad fad fad fad sol4 fad
    fad r8 sold la4 r8 la\mbreak
    la8 fad16. sol?32 la8 la, r8 fad'16. sol32 la8 la,

    %13
    la4 r8 dod re4 r8 dod
    re re re re re re re mi
    la, si si la la4 r\mbreak

    %16
    R1
    r8 re16 mi fad8 mi16 re mi4 la~
    la8[sol sol fad16 mi] fad4 r8 fad

    %19
    mi dod si4 si8 mi red4
    r8 sol, fad [si]\mbreak sol sol' la[si]
    r4 r8 mi, do4 r8 mi

    %22
    do4 r8 do16 si la4 r
    sol8 mi' re16(do) si(la) sol8 mi' re16(do) si(la)\mbreak
    sol8 sol' mi4 r8 la, si[si]

    %25
    si mi mi[fad] si, sol do[si]
    si4 r r8 fad'16 mi re8 mi16 fad
    mi4. fad8 fad4 r8 fad\mbreak

    %28
    fad4 r r2
    r fad8 re' dod?16(si) la(sold)
    fad8 re' dod16(si) la(sold) fad8 mi16 fad sol?8 fad16 mi

    %31
    fad8 si, lad4 r8 si lad4\mbreak
    r8 si'\noBeam sol sold dod, si' sol[sold]
    dod, dod fad4 r8 si, mi4

    %34
    r8 la, re4 r8 sol dod,4
    r8 fad fad fad fad4. fad8\mbreak
    si,8 sold' fad[fad] fad4 r8 fad

    %37
    sol4 fad fad r
    r8 re\p si la sold2
    lad1\fermata

}

IIbcn = \relative do {

    R1*5_\markup\italic "Con l'Organo"
    r2 fad8 re' dod16(si) la(sold)
    fad8 re' dod16(si) la(sold) fad8 fad16 sold la8 sold16 fad\mbreak

    %8
    sold8 dod, sold' lad si8 si,8 lad4
    r8 si lad4 r8 si mi4~
    mi8 re re dod16 si mi8 dod fad fad,

    %11
    si4 r8 si la?4 r8 la\mbreak
    re si' la16(sol?) fad(mi) re8 si' la16(sol) fad(mi)
    re8 fad16. sol32 la8 la, r fad'16. sol32 la8 la,

    %14
    r re sol sol, re' re, si'[dod]
    re si sol la re,4 r\mbreak
    R1

    %17
    r2 r8 la'16 si dod8 si16 la
    si4 mi4. re8[re dod16 si]
    dod4 red mi8 do' si16(la) sol(fad)

    %20
    mi8 mi red4\mbreak r8 mi fad sold
    r la sold4 r8 la sold4
    r8 la la, la' re,4 r8 re

    %23
    sol, sol fad4 r8 sol\noBeam fad fad'\mbreak
    sol16(fad) mi(re) dod8 dod re re red[red]
    mi16(re?) do(si) la8 lad si do la? si

    %26
    mi,4 r r8 si'16 dod? re8 dod16 si
    dod4. fad8 si,4 r8 si
    fad'4 r r2

    %29
    R1*2
    si,8 sol' fad16(mi) re(dod) si8 sol' fad16(mi) re(dod)\mbreak
    si4 mi8 mid fad8 si, mi8 mid

    %33
    fad fad red4 r8 mi dod4
    r8 re si4 r8 dod lad4
    r8 si si si fad' fad16 sold lad8 sold16 fad\mbreak

    %36
    sold8 sold lad[lad] si si, re si
    mi dod fad fad, si4 r
    r8 si\p^\markup\italic"senza organo" sol fad mid2

    %39
    fad1\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*24
    s2 <_+>



}


forma = {

    \key si\minor
    \time 4/4
    \tempo 4 = 65
    s1*36
    s2 s4\tempo 4 = 40
    \once \override Score.RehearsalMark.extra-offset = #'(+5 . -3) \mark\markup\italic "adagio" s
    s1*2
    \bar"|."

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

}


%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller {Morte e Sepoltura di Cristo - Introduzione}
    composer = \markup \center-column{"A. Caldara (1670 -1736)"}
}

\markup \huge {[1.] Grave}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""Primo]"}
            \set Staff.shortInstrumentName = "vl1"
            \IvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""Secondo]"}
            \set Staff.shortInstrumentName = "vl2"
            \IvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \Ivla
        >>

        \new Staff  \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
            \set Staff.shortInstrumentName = "bc"
            \Ibc

        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[2.] Andante}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""Primo]"}
            \set Staff.shortInstrumentName = "vl1"
            \IIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"[Violino""Secondo]"}
            \set Staff.shortInstrumentName = "vl2"
            \IIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIvla
        >>

        \new Staff  \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
            \set Staff.shortInstrumentName = "bc"
            \IIbc

        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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


