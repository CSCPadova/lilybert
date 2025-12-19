\language "italiano"
	%********************************** VARIABILI
\version "2.24.0"

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

%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

Ifln = \relative do'' {

    re,16 mi fad sol la si dod la re mi fad sol la si dod la
    re4 r r2
    R1

    %4
    r2 mi,16 re dod re mi8 fad\mbreak
    mi4-+~mi8 fad-+ sol16 mi dod la la' sol fad mi
    fad8.-+ mi16 re8 re, r16 la'' fad re re' dod si la

    %7
    sold8.[fad16 mi8 mi] \tuplet 3/2 { si'16(la sold ) sold[(fad mi)] mi(si' do) re[(do si)]\mbreak
    do(si do) do[(si do)] } mi do mi do \tuplet 3/2 { si(la sold) sold[(fad mi)]  mi(si' dod) re[(dod si)]
    dod(si dod) la[(sold la)] mi(re mi) dod[(si dod)]} \once\stemDown fad8 re, r fad'\mbreak

    %10
    \once\stemDown mi dod, r mi' \once\stemDown re re, r re'
    \tuplet 3/2 { dod16(re mi) mi-.[mi-. mi-.] mi,(si' dod) re[(dod si)]  dod(re mi) mi-.[mi-. mi-.] mi,(si' dod) re[(dod si)]
    dod (la dod) mi[(dod mi)] la mi la dod[la dod]\mbreak } mi mi, re dod si4

    %13
    la,16 si dod re mi fad sold mi la si dod re mi fad sold mi
    la4 r r2
    R1

    %16
    r2 la16 sol fad sol la8 si
    la4-+~la8 si-+ do16 la fad re re' do si la\mbreak
    \once\stemDown si8 sol,16 la si re sol si \once\stemDown la8 fad,16 sol la red fad la

    %19
    \tuplet 3/2 { sol(fad sol) sol[(fad sol)] la(sol la) la[(sol la)] si(la si) si[(la si)] } do si la sol
    fad4 r sold16 la si8 si sold-+
    la mi mi la si16 do re8 re si-+

    %22
    do4~do16 si la do si8 la16 sol fad4-+
    mi r r2
    R1

    %25
    r8 fad\p(fad fad) mid(mid mid mid)\mbreak
    fad(fad fad fad) mi?(mi mi mi)
    re(re re re) dod(dod dod dod)

    %28
    dod4 r r8 dod'16\f[si lad sol fad mi]
    re4 r r8  si'16 [la? sol fad mi re] \mbreak
    sol la sol fad mi re dod si mi8 re dod4-+

    %31
    si r r2
    R1*2
    r2 fad'16 sol la8 la fad-+

    %35
    sol re re sol la16 si do8 do la-+
    si16 la sol si la sol fad la\mbreak sol fad mi sol fad mi re fad
    mi la, dod mi la4 r16 la, dod mi fad4

    %38
    r16 la,\p dod mi la4 r16 la, dod mi fad4
    r8 dod\f re4 r8 si dod4
    r8 la si4 r8 sol la4\mbreak

    %41
    r16 re re dod si4 r16 fad' fad mi re4
    r16 la' la sol fad4 r16 fad mi re dod4
    re16 re' dod si la sol fad mi re re dod si la sol fad mi

    %44
    re1

}

Ivln =  \relative do'' {

    re,16 mi fad sol la si dod la re mi fad sol la si dod la
    re4 r la16 sol fad sol la8 si\mbreak
    la4-+~la16 sol fad mi fad8 sol-+ la re

    %4
    dod8.-+ si16 la8 la, dod16 si la si dod8 re
    dod4-+~dod8 re-+ mi mi dod dod
    re la re,4 fad'~fad16 mi re dod\mbreak

    %7
    si4 r sold'8\p sold sold sold
    la la la la sold sold sold sold
    la4 r r8 re,\f fad la

    %10
    r dod, mi la r si, re sold
    r dod, si sold\mbreak r dod si sold

    %12
    la4 r r16 dod si la sold4
    la,16 si dod re mi fad sold mi la si dod re mi fad sold mi
    la4 r mi16 re dod re mi8 fad\mbreak

    %15
    mi4-+~mi8 fad-+ sol16 mi dod la la' sol fad mi
    fad8.-+ mi16 re8 re, fad'16 mi re mi fad8 sol
    fad4-+~fad8 sol-+ la la fad fad\mbreak

    %18
    sol4. sol8 fad4. red8
    \tuplet 3/2 { mi16(red mi) mi[(red mi)] fad(mi fad) fad[(mi fad)] sol(fad sol) sol[(fad sol)] } la sol fad mi\mbreak
    red4 r si8\p si si si

    %21
    mi mi mi mi sold sold sold sold
    la mi\f mi mi sol fad16 mi red4-+
    mi4 r r2

    %24
    R1\mbreak
    r8dod\p(dod dod) re(re re re)
    dod(dod dod dod) dod(dod dod dod)

    %27
    si(si si si) si(si si si)
    lad16 fad\f sol lad si dod re mi fad4 r\mbreak
    r16 si, dod re mi fad sold lad si4 r

    %30
    r8 si16[la sol fad mi re] dod8 si lad4-+
    si r r2
    R1*2

    %34
    r2 la8\p la la la
    re re re re\mbreak fad fad fad fad
    sol mi4 re dod re8

    %37
    dod4 r16 la dod mi sol4 r16 la, re fad
    mi4 r16 la,\p dod mi sol4 r16 la, re fad\mbreak
    mi4 r8 fad\f sol4 r8 mi

    %40
    fad4 r8 re mi4 r8 dod
    re4 r16 mi mi re dod4 r16 sol' sol fad
    mi4 r16 re' re dod\mbreak si la sol fad mi4-+

    %43
    re16 re' dod si la sol fad mi re re dod si la sol fad mi
    re1

}

Ivlan =  \relative do' {

    \clef bass re,,16 mi fad sol la si dod la re mi fad sol la si dod la
    \clef alto \key re\major re4 r fad16 mi re mi fad8 sol
    fad16 mi re fad mi8 dod re la  re, [\once\stemDown fad']

    %4
    mi mi16 re dod re dod si la2~\mbreak
    la16 la' mi dod la8 re dod dod la la
    la la'16 sol fad sol fad mi re8 re, r fad'

    %7
    mi si mi,4 mi'8\parenthesize \p mi mi mi
    la la la la mi mi mi mi
    la,4 r  \tuplet 3/2 {re16\parenthesize \f (dod re) fad[(mi fad)] la (sold la) re,[(dod re)] \mbreak

        %10
        dod(si dod) mi[(re mi)] la(sold la) dod,[(si dod)] si(la si) re[(dod re)] sold( fad sold) si,[(la si)]
    }
    la8 la' sold mi r la sold mi
    mi4 r r8 mi mi mi,

    %13
    \clef bass \key re\major la,16 si dod re mi, fad sold mi\mbreak la si dod re mi fad sold mi
    la4 r \clef alto \key re\major dod16 si la si dod8 re
    dod4-+~dod8 re-+ mi mi dod dod

    %16
    re la'16 sol fad sol fad mi re2~
    re16 re la fad re8 sol fad4. re'8
    re si16 la sol8 re\mbreak r8 re'16 dod si8 si

    %19
    r mi do do sol mi r do'
    si4 r  re8\p re re re
    do do do do si si si si

    %22
    la4 r r8 do\f si la
    sol mi r4\mbreak r2
    r16 re fad la re la fad re sol mi sol si mi re dod si

    %25
    lad8 la\p(la la) si(si si si)
    dod (dod dod dod)  fad(fad fad fad)
    fad(fad fad fad) sold(sold sold sold)

    %28
    fad(fad\f fad fad) lad,4 r\mbreak
    r8 si' si si re,4 r
    si' r r8 fad fad mi

    %31
    re re16 mi fad mi re dod si dod re dod si la sol fad
    mi8 mi'16 fad sol fad mi re dod re mi re dod si la sol
    fad8 fad'16 sol la sol fad mi re dod si la sol fad mi re\mbreak

    %34
    dod4-+ r do'8 \p do do do
    si si si si la la la la
    sol sol' fad fad mi mi re re

    %37
    la la'\f fad fad dod dod re re
    la la'\p fad fad dod dod re\f re
    la4 r16 re re dod si4 r16 dod dod si\mbreak

    %40
    la4 r16 si si la sol4 r16 la la sol
    fad4 r8 mi la4 r8 sol
    dod4 r8 re, sol si la sol

    %43
    fad16 re' dod si la sol fad mi \clef bass \key re\major re re dod si la sol fad mi
    re1

}

Ibcn = \relative do {

    re,16 mi fad sol la si dod la re mi fad sol la si dod la
    re4 r re r8 sol,
    re re' dod la re, mi fad re

    %4
    la' mi la,4 r8 la' la re,\mbreak
    la2 r8 la' la la,
    re4 re, r8 re'16 dod si dod re si

    %7
    mi4 mi, r2
    R1
    r8 la' la la re, re re re\mbreak

    %10
    la la la la mi' mi mi mi
    la,4 r8 mi'' la,4 r8 mi'
    la,4 r r8 la, mi' mi,

    %13
    la16 si dod re mi, fad sold mi\mbreak la si dod re mi fad sold mi
    la4 r la r8 re,
    la la' la re dod dod la la

    %16
    re,2 r8 re' re sol,
    re2 r8 re re re,
    sol sol sol sol\mbreak re' re red si

    %19
    mi,4 r r8 mi' la la,
    si4 r r2
    R1

    %22
    r8 la'^\f la, la mi' la si si,
    mi,16 mi' sol si mi si sol mi\mbreak dod la dod mi la mi dod la
    re8 re re re mi mi mi mi

    %25
    fad fad^\p(fad fad) sold(sold sold sold)
    la(la la la) lad(lad lad lad)
    si(si si si) mid,(mid mid mid)

    %28
    fad4 fad, r8 fad'^\f fad fad\mbreak
    si,4 r r8 si' si si
    mi, mi, r mi'' la, si fad fad,

    %31
    si si'16 dod re dod si la sol la si la sol fad mi re
    dod8 dod'16 re mi re dod si la si dod si la sol fad mi
    re8 re'16 mi fad mi re dod si la sol fad mi re dod si\mbreak

    %34
    la4 r r2
    R1*2
    la1\f~

    %38
    la~
    la16 la' la sol fad4 r16 sol sol fad mi4\mbreak
    r16 fad fad mi re4 r16 mi mi re dod4

    %41
    r8 re sol4 r8 fad si4
    r8 la re4 r8 mi, la la,
    re16 re' dod si la sol fad mi re re dod si la sol fad mi

    %44
    re1

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    s4 <5/> s2
    s1
    s2 s8 <7> s4
    s1
    <_+>
    s1*2
    s2 <_+>4 <7>
    s s8 <7 _+> s4 s8 <7 _+>
    s2 s4 <4>8 <7 _+>
    s4 <_+>  s <_+>
    s1
    s2 <5/>
    s1
    s2 s8 <7!> s4
    s2 s4 <5/>
    s2 s4 <_!>8 <6>
    <_+>1
    s
    s8 <_!> <6>4 s8 <6 _!> <4> <7 _+>
    s2 <5/>
    s2 <7>4 <6>
    <_+>8 <_!> s4 <6\\ 5/>2
    <6> <5/>
    s <5/>
    <_+> s8 <7 _+> s4
    s1
    s2 <5/>4 <4>8 <7 _+>
    s1*11
    s2 s4 s8 <7>

}

forma = {

    \key re\major
    \time 4/4
    \tempo 2 = 45
    s1*44
    \bar":|."

}

Ifl = {
    \Iglobal
    <<\Ifln \forma>>

}

Ivl = {
    \Iglobal
    <<\Ivln \forma>>

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



IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza
}

IIfln = \relative do'' {

    re8 dod4-+
    si fad'4. si8
    sold4 \appoggiatura sold8 lad4. si8
    lad2 \parenthesize r4

    %4
    R2.
    r4 fad re'
    dod dod4. (\tuplet 3/2 { si16 la? sold) }

    %7
    la4. si8 dod4~
    dod si4.-+ la8
    sold2 r4

    %10
    R2.
    r4 dod8[(si) la(si16 dod)]\mbreak
    si8-+(la) sold2

    %13
    fad2 r4
    la re dod
    re4.(dod16 si) la8[(do)]

    %16
    si la sol?4. fad8
    mi4 mi fad-+sol8(fad16 mi)
    la4. (\tuplet 3/2 { sol16 fad mi) }

    %19
    fad4 re'4. la8
    sol-+ fad mi2-+
    re r4

    %22
    R2.
    r4 si' si
    si2.~\mbreak

    %25
    si4 mi4. si8
    la-+(sol) fad2-+
    mi4 sol fad

    %28
    mi re dod
    fad sold lad
    si8(dod16 re) dod4.-+ si8

    %31
    lad2 re4~
    re dod2~
    dod4 si2~

    %34
    si2.
    lad2\fermata si8(dod16 re)
    dod8-+(si) lad2

    %37
    si4. si2.

}

IIvln =  \relative do'' {

    si8 fad4
    sol re si'
    mi8 re dod4 si
    fad2 r4

    %4
    R2.
    r4 r fad'
    sold sold mid

    %7
    fad4. sold8 la4~
    la sold4. fad8
    mid2 r4

    %10
    R2.
    r4 la8[\parenthesize (sold) fad \parenthesize (sold16 la)]\mbreak
    sol8-+(fad) mid2-+

    %13
    fad2 r4
    re2 mi?4-+
    fad2 re4

    %16
    sol,8 la si4 sol
    la dod re-+
    mi2 dod4

    %19
    re2 fad4
    mi8-+(re) dod2-+
    re r4

    %22
    R2.*2
    r8  \tuplet 3/2 { re16 (mi fad) } fad4.-+(mi16 fad)
    sol2 sol4\mbreak

    %26
    fad8(mi) red2
    mi2.
    sol4 fad mi

    %29
    re mi fad
    sol2 mi4
    fad fad8(mi) fad(sol)

    %32
    mi4.-+ re8[mi(fad)]
    re4-+ re2~
    re2.

    %35
    dod2\fermata re8(mi16 fad)
    mi8(re) dod2-+
    si4. si2.

}

IIvlan =  \relative do' {

    r4 r8
    R2.*2
    r4 r8 dod re4
    mi8(re16 dod) fad4. \parenthesize (\tuplet 3/2 { mi16  re dod)}

    %5
    re4.-+ dod8 si4
    r sold dod~
    dod fad 4. (\tuplet 3/2 { mi16  re dod)}

    %8
    re2 re4
    dod sold'8(fad) mid8(fad16 sold)
    dod,8 re si4.-+(la16 sold?)

    %11
    la4. si8 dod4
    re dod4.-+ si8\mbreak
    la2 r4

    %14
    R2.*3
    r4 la re
    dod2 la'4~

    %19
    la8 sol fad sol la4~
    la la4.(\tuplet 3/2 { sol16 fad mi) }
    fad4-+ fad8(sol) la4~
    la8 do fad,4.(sol16 la)

    %23
    red,2.
    \parenthesize r8 \tuplet 3/2 { sid16((dod red) }  red4.-+(dod16 red)\mbreak
    mi8(fad) sol(la) si4

    %26
    do si4.(\tuplet 3/2 { la16 sol fad) }
    sol8-+ fad mi2
    R2.*3

    %31
    r4 r si'~
    si fad fad
    fad fad2

    %34
    sold2.
    sol!2\fermata fad4
    sol fad4.(\tuplet 3/2 { mi16 re dod) }

    %37
    re4. re2.

}

IIbcn = \relative do {

    r4 r8
    R2.*2
    r4 r8 lad' si4
    dod4 lad fad

    %5
    si,2 si'4
    mid,2 dod4
    fad2 fad,4

    %8
    si2 si4
    dod2 dod4
    mid2 dod4

    %11
    fad2 fad,4
    si dod dod,\mbreak
    fad2 r4

    %14
    R2.*3
    la2.~
    la

    %19
    re2 re'4
    dod8 re la4 la,
    re'2.

    %22
    do
    si
    r4 si si,\mbreak

    %25
    mi2 mi'4
    la, si si,
    mi,2 r4

    %28
    R2.*3
    r4 fad' si
    sol lad fad

    %33
    si si2
    mid,2.
    mi!2\fermata re4

    %36
    mi fad fad,
    si4. si2.

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4 s8
  s2.*2
  s4 s8 <5/> s4
  <6\\>2.
  s
  <5/>
  s
  <7 9>4 <6\\> s
  <_+>2.
  <5/>
  s
  <6>4 <4> <7 _+>
  s2.*4
  s2 <6 4>4
  <7>2.
  s
  <5/>4 <4> <7>
  s2.
  <4+>
  <_+>
  s4 <7 _+> s
  s2.
  <6 _!>4 <4> <7>
  s2.*4
  s4 <_+> s
  <5/> <5/> s
  <9>2.
  <7>
  <4+ _!>
  <6>4 <4> <7 _+>

}

forma = {

  \key si\minor
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 40
  \repeat volta 2{\partial 4. s4.
                  s2.*36}
  \alternative {{\set Score.measureLength = #(ly:make-moment 3 8) s4.}{\set Score.measureLength = #(ly:make-moment 3 4) s2.}}
  \bar":|."

}

IIfl = {
  \IIglobal
  <<\IIfln \forma>>

}

IIvl = {
  \IIglobal
  <<\IIvln \forma>>

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
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza
}

IIIfln = \relative do'' {

    si'2 lad
    si2. fad4
    sol fad mi re

    %4
    dod2-+ si
    fad4 re'(dod si)
    fad mi'(re dod)

    %7
    re4. mi8 mi4.-+(re16 mi)
    fad1
    si2 lad

    %10
    si2. fad4
    sol fad mi re
    dod2-+ si

    %13
    fad4 re'(dod si)
    si' la sold si
    la4.-+ sold8 sold4.-+ fad8

    %16
    fad1

    %17
    fad2 mi
    fad4 sol la fad
    si la sol fad

    %20
    mi sold(la) fad
    mi sold(la) re,
    dod mi la sol?

    %23
    fad4.-+ mi8 mi4.-+ re8
    re1
    fad2 si4 la

    %26
    sol2.-+ fad4
    mi re dod si
    lad dod(re mi)

    %29
    fad, mi'(re dod)
    re si fad' re
    si'2 dod,-+

    %32
    si1

    %33
    \tuplet 3/2 { si'8(dod re) re[(dod si)] lad(si dod) dod[(si lad)]
    si(lad si) fad[(mi fad)] re(dod re) si[(lad si)]
    sol'(la? sol) fad[(sol fad)] mi(fad mi) re[(mi re)]}

    %36
    dod2-+ si
    \tuplet 3/2 { fad8(si re) re[(dod si)] si(dod re) re[(dod si)]\mbreak
    fad(dod' mi) mi[(re dod)] dod(re mi) mi[(re dod)]}

    %39
    re mi re mi mi4.-+(re16 mi)
    fad1
    \tuplet 3/2 {si8(dod re) re[(dod si)] lad(si dod) dod[(si lad)]

    %42
    si(lad si) fad[(mi fad)] re(dod re) si[(lad si)]
    sol'(la sol) fad[(sol fad)]\mbreak mi(fad mi) re[(mi re)]}
    dod2-+ si

    %45
    \tuplet 3/2 {fad8(si re) re[(dod si)] si(dod re) re[(dod si)]
    dod(mid sold) si[(la sold)] sold(la si) si[(la sold)]
    la(sold la) fad[(sold la)]} sold2-+

    %48
    fad1

    %49
    \tuplet 3/2 { fad8(sol la) la[(sol fad)] mi(fad sol) sol[(fad mi)]\mbreak
    fad(mi re) sol[(fad mi)] la(sol fad) fad[(sol la)]
    si (do si) la[(si  la)] sol(la sol) fad[(sol fad)]

    %52
    mi(re mi) sold[(fad sold)] la(si la) fad[(mi fad)]
    mi(re mi)  sold[(fad sold)] la(si la) fad[(mi fad)]
    dod(re mi) la,[(dod mi)] \mbreak la(sol fad) mi[(fad sol)]

    %55
    fad(sol la) sol[(la fad)]} mi2-+
    re1
    \tuplet 3/2 { fad8(mi re) re[(dod si)] si'(la sol) fad[(sol la)] }

    %58
    sol2-+ \tuplet 3/2 { sol8(la sol) fad[(sol fad)]
    mi(fad mi) re[(mi re)] dod(re dod) si[(dod si)]}
    lad4 \tuplet 3/2 { dod8(re mi)\mbreak mi[(re mi)] mi(re mi)

    %61
    fad,(sold lad) lad[(si dod)] dod(re mi) mi[(re dod)]
    re fad, si re[si re] fad si, re fad[re fad]
    si(lad si) si,[(dod re)]} dod2-+

    %64
    si1

    %65
    R1*16
    R1*16

    %97
    si'2\p lad
    si2. fad4\f
    sol fad mi re

    %100
    dod2-+ si
    fad4\p re'(dod si)
    fad mi'(re dod)

    %103
    re4.\f mi8 mi4.-+(re16 mi)
    fad1
    si2\p lad

    %106
    si2. fad4\f
    sol fad mi re
    dod2-+ si

    %109
    fad4\p re'(dod si)
    si' la sold si\f
    la4.-+ sold8 sold4.-+ fad8

    %112
    fad1

    %113
    fad2\p mi
    fad4 sol la fad\f
    si la sol fad

    %116
    mi sold(la) fad
    mi sold\p(la) re,
    dod mi\f la sol?

    %119
    fad4.-+ mi8 mi4.-+ re8
    re1
    fad2\p si4 la

    %122
    sol2.-+ fad4
    mi\f re dod si
    lad dod\p(re mi)

    %125
    fad, mi'(re dod)
    re\f si fad' re
    si'2 dod,-+

    %128
    si1

}

IIIvln =  \relative do'' {

    re2 dod
    re4 mi fad re
    mi re dod si

    %4
    lad2 si
    r4 fad'(mi re)
    r dod(si lad)

    %7
    si4. dod8 dod4.-+ si8
    lad4 lad si dod
    re2 dod

    %10
    re4 mi fad re
    mi re dod si
    lad2 si

    %13
    r4 fad'(mi re)
    dod2. dod4
    dod fad mid2

    %16
    fad1

    %17
    re2 dod
    re4 la re2~
    re4 fad mi re

    %20
    dod r r la
    la,2 r4 sold'
    la2 r4 dod

    %23
    re4. dod8 dod4.-+ re8
    re2 fad4 mi
    re dod si2~

    %26
    si4 mi mi,2
    r4 dod' sol' mi
    dod lad(si dod)

    %29
    r dod(si lad)
    si1
    r4 si lad2

    %32
    si1

    %33 OOKK
    si2\p fad
    si4 si,  r si'
    mi, fad sol mi

    %35
    fad2 si,
    re r
    lad2. fad'4

    %38
    si la sol2-+
    fad4 mi re dod
    si2 fad'

    %41
    si4 si, r si'
    mi, fad sol mi
    fad2 si,

    %44
    si2. si'4
    mid,2. dod4
    fad fad dod' dod,

    %47
    fad1

    %49
    re'2 la\mbreak
    re,4 mi fad re
    sol la si sol

    %52
    la2 r4 re
    dod2 r4 si
    la la, r la'

    %55
    re sol, la la,
    re2 re'4 dod
    si si, r si'

    %58
    mi si mi, fad
    sol fad mi sol
    fad2 r

    %61
    lad2. fad4
    si si, r2
    r4  si fad' fad

    %64
    si,1

    %65
    R1*32

    %97 OOKK
    si'4\p re dod mi
    re dod si re\f
    mi re dod si

    %100
    lad2 si
    re,\p r
    lad r4 lad'\f

    %103
    si4. dod8 dod4. si8
    lad1\mbreak
    si4\p re dod mi

    %106
    re dod si re\f
    mi re dod si
    lad2 si

    %119
    si,\p r4 re'
    mid,2 r4 mid'\f
    fad4. mid8 mid4.-+ fad8

    %112
    fad1

    %113 OOKK
    re4\p re, la' la,
    re' mi fad re\f

    %115
    re fad mi re\mbreak
    dod re(dod) r
    r re\p(dod) si

    %118
    la2 r4 dod\f
    re4. dod8 dod4.-+ re8
    re2 re4\p dod

    %121
    si dod red si
    mi si mi,2
    r4 si'\f sol' mi

    %124
    dod2 r
    lad,\p r4 lad'\f
    si1

    %127
    r4 si lad2
    si1

}

IIIvlan =  \relative do' {

    fad2 fad
    fad4 si, si'2~
    si4 si, mi2~

    %4
    mi4 dod re dod
    si si, r2
    dod' fad~

    %7
    fad4 si, mi sol
    dod, dod re mi
    fad2 fad~

    %10
    fad4 si, si'2~
    si4 si, mi2~
    mi4 dod re dod

    %13
    si si, r fad''
    sold fad mid sold
    fad re dod si

    %16
    la sold fad2

    %17
    la'2 la
    la4 sol? fad la
    sol2. re4

    %20
    la' re,(dod) r
    r re(dod) r
    r la' la,2\mbreak

    %23
    r4 si' la sol
    fad mi re2
    r4 fad fad red

    %26
    mi2. mi4
    mi,2. si'4
    fad'2 r

    %29
    dod2. fad4
    fad2 r
    r4 fad fad dod

    %32
    re1

    %33  OOKK
    R1*32

    %65
    si8 re fad fad lad, dod fad fad
    si, re fad si si fad re si
    sol' si fad si mi, si' re, si'

    %68
    dod,2-+ si
    si,8 re fad si re fad si, re
    lad, dod fad lad dod fad lad, dod\mbreak

    %71
    re mi re mi mi4.-+(re16 mi)
    fad1
    si,8 re fad fad lad, dod fad fad

    %74
    si, re fad si si fad re si
    sol' si fad si mi, si' re, si'
    dod,2-+ si

    %77
    si,8 re fad si re fad si, re
    dod mid sold mid dod sold mid dod
    la' dod fad la, sold2-+

    %80
    fad1

    %81
    fad8 la re re mi, sol? dod dod\mbreak
    fad, la re fad la fad re la
    si re la re sol, re' fad, re'

    %84
    mi, mi' sold mi la mi fad re
    mi mi sold mi la la, re si
    dod la dod mi la mi dod la\mbreak

    %87
    fad' sol la fad mi2-+
    re1
    fad8 mi re dod si red fad si

    %90
    sol mi si sol mi si' sol' fad
    mi fad re mi dod re si dod\mbreak
    lad dod fad fad fad dod lad fad

    %93
    mi dod' fad fad fad dod lad fad
    re' si si' fad re si fad re
    \once\stemUp si re' fad si dod,2-+

    %96
    si1

    %97
    R1
    r2 r4 si'\f
    si2 mi,~

    %100
    mi4 dod re2
    R1
    r2 r4 fad

    %103
    fad si, mi sol
    dod,1
    R

    %106
    r2 r4 si'
    si2 mi,~\mbreak
    mi4 dod re2

    %109
    R1
    r2 r4 dod
    dod re dod si

    %112
    la1
    R
    r2 r4 fad'

    %115
    sol2 r4 re
    la'2 r4 re,
    dod2 r4 sold

    %118
    la2 r4 la'\mbreak
    la si la sol
    fad1

    %121
    R1*2
    mi2. si4
    fad'1

    %125
    r2 r4 fad
    fad1
    r4 fad fad mi

    %128
    re1

}

IIIbcn = \relative do {

    si'2 fad
    si4 dod re si
    mi, fad sol mi

    %4
    fad2 si,
    si' r
    lad2. fad4

    %7
    si la sol2-+
    fad4 mi re dod
    si2 fad'

    %10
    si4 dod re si
    mi, fad sol mi
    fad2 si,

    %13
    si' r
    mid,2. dod4
    fad si, dod dod,

    %16
    fad1

    %17 OOKK
    re''2 la
    re,4 mi fad re
    sol la si sol

    %20
    la2 r4 re
    dod r r si
    la si dod la\mbreak

    %23
    re sol, la la,
    re,2 re''4 dod
    si dod red si

    %26
    mi si mi, fad
    sol fad mi sol
    fad fad, r2

    %29
    lad'2. fad4
    si si, r2
    r4 si fad' fad,

    %32
    si1

    %33 OOKK
    R1*32

    %65
    si'2 fad
    re2. si4
    mi fad sol mi

    %68
    fad2 si,
    si' r
    fad r\mbreak

    %71
    si4 la sol2
    fad4 mi re dod
    si2 fad'

    %74
    re2. si4
    mi fad sol mi\mbreak
    fad2 si,

    %77
    si' r
    mid,2. dod4
    fad fad, dod' dod,

    %80
    fad1

    %81 OOKK
    re'2 la\mbreak
    re4 re, r re'
    sol, la si sol

    %84
    la2 r4 re'
    dod2 r4 si
    la la, r la'\mbreak

    %87
    re re, la' la,
    re,2 re''4 dod
    si si, r si

    %90
    mi mi, r2
    sol'4 fad mi sol\mbreak
    fad fad, r2

    %93
    lad r4 fad'
    si si, r2
    r4 si fad' fad,

    %96
    si1

    %97 OOKK
    R1
    r2 r4 si\f
    mi fad sol mi

    %100
    fad2 si,
    R1
    r2 r4 fad'

    %103
    si la sol2-+
    fad fad,
    R1

    %106
    r2 r4 si
    mi fad sol mi
    fad2 si,

    %109
    R1
    r2 r4 dod
    fad si, dod dod,

    %112
    fad1

    %113
    R1
    r2 r4 re'
    sol la si sol

    %116
    la2 r
    la, r
    la r4 la'\mbreak

    %119
    re sol, la la,
    re,1
    R

    %122
    r2 mi'4 fad
    sol fad mi sol
    fad1

    %125
    r2 r4 fad
    si1
    r4 si, fad' fad,

    %128
    si1

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s2 <7 _+>
  s1
  <7>2 <6>
  <7 _+>1
  s
  <5/>
  s2 <7>4 <6>
  <_+> s <6> <6\\>
  s2 <7 _+>
  s1
  <7>2 <6>
  <7 _+>1
  s
  <5/>
  s4 <6> <4> <7 _+>
  s1

  %17
  s2 <7>
  s1
  <7>2 <6>
  s1
  <6>4 s s <6\\>
  s2 <5/>
  s4 <6> <4> <7>
  s1
  s2 <5/>
  s1
  <6>2 <6>
  <_+>1
  <5/>
  s
  s4 s <4> <7 _+>
  s1

  %33
  s1*32

  %65
  s2 <7 _+>
  <6> s
  <7> <6>
  <7 _+>1
  s
  <7 _+>
  s2 <7>4 <6>
  <_+> s <6> <6\\>
  s2 <_+>
  <6>1
  <7>2 <6>
  <7 _+>1
  s1
  <5/>
  s2 <4>4 <7 _+>
  s1

  %81
  s2 <7>
  s1
  <7>2 <6>
  s1
  <6>2 s4 <6//>
  s2 s4 <7>
  s2 <4>4 <7>
  s1
  s2 s4 <7 _+>
  s1
  <6>2 <6>
  <_+>1
  <5/>
  s
  s2 <4>4 <7 _+>
  s1

  %97
  s1*2
  <7>2 <6>
  <7 _+> s
  s1
  s2 s4 <7 _+>
  s2 <7>4 <6>
  <_+>1
  s1*2
  <7>2 <6>
  <7 _+>1
  s
  s2 s4 <7 _+>
  s <6> <4> <7 _+>
  s1

  %113
  s1
  s
  <7>2 <6>
  s1
  s
  s2 s4 <7>
  s <6> <4> <7>
  s1
  s
  s
  <6>2 <6>
  <_+>1
  s2 s4 <7 _+>
  s1
  s2 <4>4 <7 _+>

}

forma = {

  \key si\minor
  \time 2/2
  \tempo 1 = 50
  s1*16
  \bar":..:"
  s1*16
  \bar":..:"
  \tempo 2 = 75
  s1*16
  \bar":..:"
  s1*16
  \bar":..:"
  s1*16
  \bar":..:"
  s1*16
  \bar":..:"
  \tempo 1 = 50
  s1*16
  \bar":..:"
  s1*16
  \bar":|."

}

IIIfl = {
  \IIIglobal
  <<\IIIfln \forma>>

}

IIIvl = {
  \IIIglobal
  <<\IIIvln \forma>>

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

}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVfln = \relative dod'' {

    fad4.
    mi16(sol) fad(mi) re(dod)
    re(mi) fad(sol) la(si)

    %4
    dod(re) mi,(sol) fad(mi)
    fad8.-+ mi16 re8
    R4.

    %7
    la'(
    la-+
    la

    %10
    la8) re re\mbreak
    re,8 mi16(fad) sol8
    dod,8.-+ si16 la8

    %13
    fad'4.
    mi16(sol) fad(mi) re(dod)
    re(mi) fad(sol) la(si)

    %16
    dod(re) mi,(sol) fad(mi)
    fad8.-+ mi16 re8
    R4.

    %19
    la'(
    la-+
    la

    %22
    la8) re re
    re,16 mi dod4-+
    re4.

    %25 OOKK
    la'
    re8 dod16(si)  la(sol)
    fad-+(la) sol(fad) mi(re)

    %28
    dod8.-+ si16 la8
    R4.*4
    si'8 dod re

    %34
    dod16(si) la(sold) la8~
    la16 si si4-+\mbreak
    la4.

    %37
    mi4 fad8
    sol fad mi
    la sol16(fad) mi(re)

    %40
    dod8.-+ si16 la8
    r re're(
    re4.-+

    %43
    re16) fad, mi4-+
    re4.
    R4.*16

    %61
    R4.*8

}

IVvln =  \relative dod'' {

    R4.*5
    re,32 re re re fad[fad fad fad] la la la la
    la, la la la mi'[mi mi mi] sol sol sol sol

    %8
    re re re re fad[fad fad fad] la la la la
    la, la la la mi'[mi mi mi] sol sol sol sol\mbreak
    fad16 mi re mi fad re

    %11
    si' la sol fad mi re
    mi4.
    R4.*5

    %18
    re32 re re re fad[fad fad fad] la la la la
    la, la la la mi'[mi mi mi] sol sol sol sol
    re re re re fad[fad fad fad] la la la la

    %21
    la, la la la mi'[mi mi mi] sol sol sol sol
    fad16 mi re mi fad re
    si'8 mi,4-+

    %24
    re4.

    %25 OOKK
    re'16\p mi fad mi re dod
    si8 la16 sol fad mi\mbreak
    re8 si' sol

    %28
    la16 mi dod mi la,8
    la'32\f la la la mi'[mi mi mi] sol sol sol sol
    fad fad fad fad re[re re re] dod dod dod dod

    %31
    si si si si fad'[fad fad fad] la la la la\mbreak
    sold sold sold sold fad[fad fad fad] mi mi mi mi
    R4.

    %34
    r8 r mi
    fad16 sold sold4-+
    la4.

    %37
    la,8\p sol fad
    mi la sol
    fad si sol

    %40
    la16 mi dod mi la,8\mbreak
    re32\f re re re fad[fad fad fad] la la la la
    re re re re fad[fad fad fad] la la la la

    %43
    re16 re, dod4-+
    re4.
    R4.*16

    %61
    R4.*8

}

IVvlan =  \relative dod' {

    r16 re,-. fad-. la-. re-. re,-.
    sol8 la4
    si8 la16 sol fad sol

    %4
    la si dod8 la
    re16 la fad la re,8
    fad'32 fad fad fad la[la la la] fad fad fad fad

    %7
    mi mi mi mi sol[sol sol sol] mi mi mi mi
    fad fad fad fad la[la la la] fad fad fad fad
    mi mi mi mi\mbreak sol[sol sol sol] mi mi mi mi

    %10
    re16 mi fad sol la fad
    sol8 sol, r
    r la' la,

    %13
    r16 re,-. fad-. la-. re-. re,-.
    sol8 la4
    si8 la16 sol fad sol

    %16
    la si dod8 la
    re16 la fad la re,8
    fad'32 fad fad fad la[la la la] fad fad fad fad

    %19
    mi mi mi mi sol[sol sol sol] mi mi mi mi
    fad fad fad fad la[la la la] fad fad fad fad
    mi mi mi mi\mbreak sol[sol sol sol] mi mi mi mi

    %22
    re16 mi fad sol la fad
    sol8 sol16 fad sol la
    fad8.-+ mi16 re8

    %25 OOKK
    R4.*4
    dod32 dod dod dod dod[dod dod dod] dod dod dod dod
    re re re re re[re re re] re re re re

    %31
    red red red red red[red red red] red red red red
    mi mi mi mi mi[mi mi mi] mi mi mi mi
    sold16 la sold fad sold mi\mbreak

    %34
    la,8 si dod
    re16 mi re dod re si
    dod8.-+ si16 la8

    %37
    R4.*4
    r8 re,32 re re re fad[fad fad fad]
    la la la la re[re re re] fad fad fad fad

    %43
    la8 la16 sol fad mi
    fad8.-+ mi16 re8

    %45
    fa16(sol) sol16-+[(fa32 sol)] la8-!
    la(sol-+) fa
    sol16(fa) mi(fa) sol(la)

    %48
    fa8.-+ mi16 re8
    fa16(mi) re(do) sib(la)
    sib(re) sol(fa) mi(re)

    %51
    dod(re) re8.-+[(dod32 re)]
    mi4.\mbreak
    fa16(sol) sol16-+[(fa32 sol)] la8-!

    %54
    la(sol-+) fa
    sol16(fa) mi(fa) sol(la)
    fa8.-+ mi16 re8

    %57
    fa16(mi) re(do) sib(la)
    mi'(fad) sold(la) si(re,)
    do(re) si4-+

    %60
    la4.

    %61 OOKK
    mi'16(re) dod(si) la(sol')
    fa(mi) re(do) sib(la)
    sib(la') sol(fa) mi(re)

    %64
    dod8.-+ si16 la8
    sold' la16(sold) fa(mi)
    fa(mi) re(do) sib(la)

    %67
    sol(fa) mi4-+
    re4.

}

IVbcn = \relative dod {

    R4.*5
    re32 re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] dod dod dod dod

    %8
    re re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    re8 re, re'

    %11
    sol16 fad mi re dod si
    la la' dod mi dod la
    re,4 r8

    %14
    R4.*4
    re32 re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] dod dod dod dod

    %20
    re re re re re[re re re] re re re re
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    re8 re, re'

    %23
    sol la la,
    re16 la fad la re,8

    %25 OOKK
    R4.*4
    la''32 la la la la[la la la] la la la la
    re, re re re re[re re re] re re re re

    %31
    si' si si si si[si si si] si si si si
    mi, mi mi mi mi[mi mi mi] mi mi mi mi
    R4.\mbreak

    %34
    r8 r la
    re, mi  fad,
    fad'16 mi dod mi la,8

    %37
    R4.*4
    re32 re re re re[re re re] re re re re
    re re re re re[re re re] re re re re

    %43
    re8 la' la,
    re16 la fad la re,8\mbreak

    %45
    \clef alto re''16(mi) mi16-+[(re32 mi)] fa8-!
    fa(mi-+) re
    mi16 re dod8 la

    %48
    re16 la fa la re,8
    \clef bass re'16(do) sib(la) sol(fa)
    sol fa mi fa sol mi

    %51
    la8 re,4
    la16 la' dod mi dod la\mbreak
    \clef alto  re16(mi) mi16-+[(re32 mi)] fa8-!

    %54
    fa(mi-+) re
    mi16 re dod8 la
    re16 la fa la re,8

    %57
    \clef bass re4 re'8
    sold, mi sold
    la16 re, mi8[mi,]

    %60
    la' la,4

    %61
    la'8 la, la'
    re fa, re\mbreak
    sol16(fa) mi(fa) sol(mi)

    %64
    la mi dod mi la,8
    re' dod la
    re16(do?) sib(la) sol(fa)

    %67
    mi(re) la8[la]
    re,4.

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*6
    <5/>4.
    s
    <5/>
    s4.*9
    <5/>4.
    s
    <5/>
    s
    <6>8 <7> s
    s4.*5
    <7>4.
    s
    <7 _+>
    <_+>
    s4.*2
    <6>8 <4> <7 _+>
    s4.*7
    s8 <4> <7>
    s4.
    s8 <6> <6>
    s4.
    <7>8 <5/> s
    s4.*2
    <_->4.
    <7 _+>
    <_+>8 <5/> s
    s <6\\> <6>
    s4.
    <7>8 <5/> s
    s4.*2
    <5/>4.
    s8 <4> <7 _+>
    <_+>4.
    <_+>8 s <7>
    s4.
    <_->
    <_+>
    <4+>8 <6> <7 _+>
    s4.
    <6\\>8 <4> <7 _+>

}

forma = {

    \key re\major
    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 4 = 55
    \mark\markup {\segno}
    s4.*24
    \bar":..:"
    s4.*20
    \bar":..:"\break
    \key do\major
    \mark\markup\huge "2.e Aria"
    s4.*16
    \bar":..:"
    s4.*8
    \bar ":|."
    \key re\major \mark\markup {\segno}

}

IVfl = {
    \IVglobal
    <<\IVfln \forma>>

}

IVvl = {
    \IVglobal
    <<\IVvln \forma>>

}

IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\header {
    title = \markup\smaller\center-column{" Sonata IV a quatre parties [Op. XI]" }
    composer = \markup \center-column{"J-B. Quentin (ca.1690 - ca.1742)"}

}

\markup\huge "[1.] Allegro "

\score {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

      \new Staff  <<
        \set Staff.midiInstrument = #"flute"
        \set Staff.shortInstrumentName = "fl"
        \set Staff.instrumentName = \markup \center-column{"Violino I / Flauto"\vspace #-0.2"traversiere"}
        \Ifl
      >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
        \set Staff.shortInstrumentName = "vl"
          \set Staff.instrumentName = \markup \center-column{"Violino II"}
          \Ivl
        >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.shortInstrumentName = "vla"
        \set Staff.instrumentName = \markup \center-column{"Viola"\vspace #-0.2"[da gamba]"}
        \Ivla
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"cello"
        \set Staff.shortInstrumentName = "bc"
        \set Staff.instrumentName = \markup \center-column{"Basso"}
        \Ibc
      >>
    >>

  \layout {

    indent = 2\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup\huge "[2.] Adagio "

\score {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

      \new Staff  <<
        \set Staff.midiInstrument = #"flute"
        \set Staff.shortInstrumentName = "fl"
        \set Staff.instrumentName = \markup \center-column{"Violino I / Flauto"\vspace #-0.2"traversiere"}
        \IIfl
      >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
        \set Staff.shortInstrumentName = "vl"
          \set Staff.instrumentName = \markup \center-column{"Violino II"}
          \IIvl
        >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.shortInstrumentName = "vla"
        \set Staff.instrumentName = \markup \center-column{"Viola"\vspace #-0.2"[da gamba]"}
        \IIvla
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"cello"
        \set Staff.shortInstrumentName = "bc"
        \set Staff.instrumentName = \markup \center-column{"Basso"}
        \IIbc
      >>
    >>

  \layout {

    indent = 2\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup\huge "[3.] Gracieusement "

\score {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

      \new Staff  <<
        \set Staff.midiInstrument = #"flute"
        \set Staff.shortInstrumentName = "fl"
        \set Staff.instrumentName = \markup \center-column{"Violino I / Flauto"\vspace #-0.2"traversiere"}
        \IIIfl
      >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
        \set Staff.shortInstrumentName = "vl"
          \set Staff.instrumentName = \markup \center-column{"Violino II"}
          \IIIvl
        >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.shortInstrumentName = "vla"
        \set Staff.instrumentName = \markup \center-column{"Viola"\vspace #-0.2"[da gamba]"}
        \IIIvla
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"cello"
        \set Staff.shortInstrumentName = "bc"
        \set Staff.instrumentName = \markup \center-column{"Basso"}
        \IIIbc
      >>
    >>

  \layout {

    indent = 2\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup\huge "[4.] Aria - Moderement "

\score {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

      \new Staff  <<
        \set Staff.midiInstrument = #"flute"
        \set Staff.shortInstrumentName = "fl"
        \set Staff.instrumentName = \markup \center-column{"Violino I / Flauto"\vspace #-0.2"traversiere"}
        \IVfl
      >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
        \set Staff.shortInstrumentName = "vl"
          \set Staff.instrumentName = \markup \center-column{"Violino II"}
          \IVvl
        >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.shortInstrumentName = "vla"
        \set Staff.instrumentName = \markup \center-column{"Viola"\vspace #-0.2"[da gamba]"}
        \IVvla
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"cello"
        \set Staff.shortInstrumentName = "bc"
        \set Staff.instrumentName = \markup \center-column{"Basso"}
        \IVbc
      >>
    >>

  \layout {

    indent = 2\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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
