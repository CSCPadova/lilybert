\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

cadenza_vlI = \relative do {

    \tempo 4 = 40


}

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

dolce = _\markup \italic { dolce }

rinf = _\markup \italic { rinf }

tu = ^\markup \italic "Tutti"

pf = _\markup { \italic poco \dynamic f}

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


mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    mi8
    mi,-. mi16-. red-. mi8-. [fad-.] sold-. sold16.-. fad32-. sold8-. sold16.-. la32-.
    si4 la-+ sold r8 sold16.\p la32
    si4 la-+ sold r8 mi'\f

    %4
    mi4(dod'8) mi,\noBeam mi4(si'8) mi,\noBeam\mbreak
    mi8-. la-. la-. sold-. \grace sold fad4. mi,8\p
    mi4(dod'8) mi,-. mi4(si'8) mi,-.

    %7
    mi8-. la-. la-. sold-. \grace sold fad4. fad'8\f
    fad4 red8 fad \grace fad mi4 dod8 mi
    mi mi  dod mi \grace mi red4(si8) fad\p\mbreak

    %10
    fad4(red8) fad-. \grace fad mi4(dod8) mi
    mi-. mi-. dod-. mi-. \grace mi red4(si8) si''\f\noBeam
    si4(si,8) si'-. si4(si,8) si'-.

    %13
    si si,16 dod red8-+ [dod16 si] si4 r8 si\p\mbreak
    si4(si,8) si'-. si4(si,8) si'-.
    si si,16 dod red8 [dod16 si] si4 r8 si''\f

    %16
    si,8-. si16.-. lad32-. si8-. dod-. red-. red16.-. dod32-. red8-. red16.-. mi32-.\mbreak
    fad4-. mi-. red-. r8 red16.-\p mi32
    fad4-. mi-. red-. r8 si'\f

    %19
    si4(mid,8) sold sold4(si,8) re-.
    re?4(mid,8) mid-. fad(sold) la-. la'-.\p
    la4(red,!8) fad-.\mbreak fad4(la,8) dod-.

    %22
    dod4(red,8) red-. mi(fad) sold-. sold'\f
    sold4(fad8) fad-. fad4(mi8) mi-.
    mi4(red8) dod dod4(sid8) sold'\p

    %25
    la4. \grace sold8 fad-+ sold4. \grace fad8 mi-+\mbreak
    la4. \grace sold8 fad-+ sold4 mi8. fad16
    mi4 red8.-+ dod16 dod4 r8 mi\f

    %28
    mi,8-.mi16-. red-. mi8-. [fad-.] sold-. sold16.-. fad32-. sold8-. sold16.-. la32-.
    si4 la sold r8 sold16.\p la32
    si4 la sold r8 mi'\f

    %31
    \grace mi re4-+(dod8) dod16(la) si8 si16(sold) la8[mi'\p]
    \grace mi re4-+(dod8) dod16(la) si8 si16(sold) la8[fad'\f]
    \grace fad mi4(red!8) red16(si) dod8 dod16(lad) si8[fad'\p]\mbreak

    %34
    \grace fad mi4 red8 red16 si dod8 dod16 lad si8[si\pp]
    \grace si dod4. dod8 \grace dod red4. red8
    red mi mi mi mi4 re~

    %37
    re dod red4.\f mi16. fad32\mbreak
    mi4 red8. mi16 mi4 r8 sold\p
    \grace sold fad4. sold8 \grace sold fad4. fad8

    %40
    sold-. la-. sold(fad-+) mi4 r8 sold,
    \grace sold fad4. sold8 \grace sold fad4. fad8\f\mbreak
    sold-. la-. sold(fad_+) mi4 r8

}

IvlIIn = \relative do'' {

    r8
    r si\f si si si8.(la16) sold8-. r
    r sold'16[(mi)] mi(red) fad(red) mi4 r
    r8 sold,16\p[(mi)] mi(red) fad(red) mi4 r

    %4
    r8 mi'\f mi4\mbreak si8 mi mi4
    la,8 red16. mi32 fad8[mi] \grace mi red4. r8
    r mi,\p mi4 si8 mi mi4

    %7
    la,8 red16. mi32  fad8 mi \grace mi red4. r8
    r red'\f red4 \mbreak red8 dod16. si32 dod4
    dod8 dod lad dod dod si16. lad32 si8\noBeam r

    %10
    r red,\p red4 red8 dod16. si32 dod4
    \grace red8 dod dod lad dod dod si16. lad32 si8\noBeam r\mbreak
    r8 fad''\f fad4 si,8  sold' sold4

    %13
    fad8. sold,16 si8[lad16. si32] si4 r
    r8 fad\p fad4 si,8 sold' sold4
    red8. sold,16 si8[lad16. si32] si4 r8 r\mbreak

    %16
    r fad''\f fad fad fad8.(mi16) red8-. r
    r red16[(si)] si(lad) dod(lad)  si4 r
    r8 red16\p[(si)] si(lad) dod(lad)  si4 r\mbreak

    %19
    r8 si'\f si4 mid,8 sold sold4
    si,8 re dod si la sold fad r
    r la'\p la4 red,8 fad fad4

    %22
    la,8 dod si la sold fad mi r
    r mi'\f mi4\mbreak red8 red red4
    dod8 la' fad mi mi4 red8 sold\p

    %25
    sold fad16 mi fad8[fad] fad4 mi8. red16
    sold8 fad16 mi fad8[fad] fad4 mi8. red16
    mi4 sid8. dod16 dod4 r\mbreak

    %28
    r8 si\f si si si8.(la16) sold8-. r
    r sold'16[(mi)] mi(red) fad(red) mi4 r
    r8 sold,16\p[(mi)] mi(red) fad(red) mi4 r

    %31
    r r8 mi'\f \grace mi re4 dod8 dod16\p la\mbreak
    si8 si16 sold la8[mi'] \grace mi re4 dod8 r
    r4 r8 fad\f \grace fad mi4 red!8 red16\p si

    %34
    dod8 dod16 lad si8[fad'] \grace fad mi4 red8 si\pp
    si4 la8 la la la la la\mbreak
    la sold sold sold fad2

    %37
    sold4 la la\f sold8. la16
    sold4 fad8. mi16 mi4 r8 mi'\p
    \grace mi red4. mi8 \grace mi red4. red8

    %40
    mi fad-. mi (red-+)\mbreak mi4 r8 mi,
    \grace mi red4. mi8 \grace mi red4. red8\f
    mi fad-. mi(red_+) mi4 r8

}

Ivlan = \relative do' {

    r8
    r sold'16.\f-. fad32-. sold8[red mi si] r8 si'
    mi,8(si) r si si sold16. la32 si8\noBeam r\mbreak
    mi8\p(si) r si si sold16. la32 si8[dod']\f

    %4
    dod4 r8 dod16.-. la32-. si4 r8 si16.-. sold32-.
    la8 fad si4 si r8 dod,\p
    dod4 r8 dod16. la32 si4 r8 si16. sold32\mbreak

    %7
    la8 fad si4 si r8 red\f
    red4 r8 red lad4 r8 lad
    lad4 r8 lad si4 r8 red\p

    %10
    red4 r8 red lad4 r8 lad
    lad4 r8 lad\mbreak si4 r8 red\f
    red4 r8 fad sold4 r8 sold

    %13
    fad4 fad fad r8 red\p
    red4 r8 fad, sold4 r8 si
    fad4 fad fad r8 r

    %16
    r red'16.\f dod32 red8[lad] si fad r fad'
    si, fad r fad' fad red16. mi32 fad8\noBeam r
    si, \p fad r fad' fad red16. mi32 fad8\noBeam r\mbreak

    %19
    r8 sold-.\f sold(mid) r mid-. mid(si)
    r sold' sold(dod,) dod(si) la r
    r8 fad'-.\p fad(red) r red-. red(la)

    %22
    r fad'-. fad(si,) si(la) sold mi'\f \mbreak
    mi4 r8 fad sid,4 r8 mi
    la,4 r8 la sold4 r8 sid\p

    %25
    dod4 red sid dod
    dod red sid dod8. red16
    sold,4 sold sold r\mbreak

    %28
    r8 sold'16.\f fad32 sold8[red] mi si r si'
    mi, si r si si sold16. la32 si8\noBeam r
    mi8\p(si) r si si4 \once\stemUp sold8 dod'\f

    %31 OOKK
    \grace dod si4(la8) r\mbreak r sold mi la\p
    sold mi la r sold mi dod red'\f
    \grace red dod4 si8 r r lad fad si\p

    %34
    lad fad si r lad fad red r
    r mi\pp fad4~\mbreak fad8 fad\noBeam fad4~
    fad8 mi mi4 mi8 mi la, la

    %37
    si4 dod8 la' fad4\f  mi8 dod
    si4 si si r
    r8 si'\p si4 r8 si si4~\mbreak

    %40
    si8 dod-. si(la-+) sold4 r
    r8 si, si4 r8 si si4\f~
    si8 dod-. si(la_+) sold4 r8

}


Ibcn = \relative do {

    r8
    r4 r8  si\f mi-. mi16.-. red32-. mi8-. mi16.-. fad32-.
    sold8 mi fad si, mi4 r\mbreak
    sold8\p mi fad si, mi4 r

    %4
    r8 la\f mi' la, r sold mi' sold,
    r fad red mi si4 r
    r8 la\p mi' la, r sold mi' sold,

    %7
    r fad red mi si'4 r
    r8 si\f red si r dod mi dod
    r fad lad  fad r si red si

    %10
    r8 si,\p red si r dod mi dod
    r fad, lad fad r si red si\mbreak
    r red\f si red r mi sold mi

    %13
    r fad16. mi32 fad8[fad,] si si' si,4
    r8 red\p si red r mi sold mi
    r fad16. mi32 fad8[fad,] si4 r8 r

    %16
    r4 r8 fad'\f si-. si16.-. lad32-. si8-. si16.-. dod32-.
    red8 si dod fad, si4 r
    red8\p si dod fad, si4 r

    %19
    r8 dod\f dod dod \mbreak r dod dod dod
    r dod dod dod fad, dod fad r
    r si\p si si r si si si

    %22
    r si si si mi, si mi r
    r si' \f si si r sid dod dod\mbreak
    r fad, fad fad r sold sold sold\p

    %25
    sold sold sold sold sold sold sold sold
    sold sold sold sold sold sold dod,8. la'16
    sold4 sold, dod r

    %28
    r r8 si\f \mbreak mi mi16. red32 mi8 mi16. fad32
    sold8 mi fad si, mi4 r
    sold8\p mi fad si, mi4 r

    %31
    mi8\f mi mi mi mi mi mi mi\p
    mi mi mi mi\mbreak mi mi la, r
    fad'\f fad fad fad fad fad fad fad\p

    %34
    fad fad fad fad fad fad si, si\pp
    si si si si si si si si
    si si si si\mbreak si si si si

    %37
    si si la la si\f si mi, la
    si4 si mi, r8 mi'\p
    si'4 r8 mi, si'4 r8 si

    %40
    mi, la, si4 mi, r8 mi\mbreak
    si'4 r8 mi, si'4 r8 si\f
    mi, la si4 mi, r8

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s1
    <6>4 <6> s2
    <6>4 <6> s2
    \bassFigureExtendersOn r8 <_>8 <_> s s <6> <6> s
    s4 <5> s2
    s8 <_> <_> s s <6> <6> s
    s4 <5> s2
    s4 <6> s <6>
    s8 <_+> <_+> s s2
    s4 <6>8 <6> s4 <6>8 <6>
    s8 <7 _+> <_+> <_+> s4 <6>8 <6>
    s <6> s4 s <6>
    \bassFigureExtendersOff  s8 <6 4>16 s32 <6> <6 4>8 <5 _+> s2
    s8 <6> s4 s <6>
    s8 <6 4>16. <6>32 <6 4>8 <5 _+>  s4 s8 s
    s4 s8 <_+> s2
    <6>4 <6\\> s2
    <6>4 <6\\> s2
    s8 <7 _+> s4 s2
    s8 <_+> s4 s8 <_+>4 s8
    s <7 _+> s4 s2
    s s8 <_+>4 s8
    s <6> <5> s s <6 5> s4
    s8 <7> <6> <5> s <4> <3> s
    s1
    s2 s4 s8. <6>32 s
    <6 4>4 <5 _+> s2
    s1
    <6>4<6> s2
    <6>4<6> s2
    <7- 5>4 <6 4> <5 3> <4>
    <7- 5>4 <6 4> <5 3> s
    <7 _+> <6 4> <5 _+> <6 4>
    <7 _+> <6 4> <5 _+> s
    <_+>2  <3>
    s4 <4> s4 <_!>
    \bassFigureExtendersOff  s2 <_+>4 <6>8 <6>
    <4>4 <_+> s2
    s1*3
    s4 <5 3>

}

forma = {

    \time 2/2
    \key mi\major
    \partial 8 s8
    \tempo 2 = 40
    s1*14
    s2 s4 s8
    \bar":..:"\break
    s
    s1*26
    s2 s4 s8
    \bar ":|."
    \mark\markup\fermata
}



IvlI = {
    \global
    <<\IvlIn \forma>>

}

IvlII = {
    \global
    <<\IvlIIn \forma>>

}


Ivla = {
    \global
    \clef alto
    <<\Ivlan \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    si2.\p mi32(re do8.)
    si2. mi,4
    mi(red8)(mi) fad-. do'-. si-. la-.

    %4
    la4 sol8. la16 si2\mbreak
    mi,4(red8)(mi) fad-. do'-. si-. la-.
    \grace la sol4 sol8. fad16 mi4 r

    %7
    r sol sol re'8(sol,)
    sol2(fad4-+) re
    sol1

    %10
    \grace sol2 fad1\fermata\mbreak
    r8 do'(mi lad,)  \grace lad4 si2
    r8 la!(do fad,) \grace fad4 sol2

    %13
    r8 mi'(re do) si(la) sol(la)
    sol8 sol4(la8) sol2
    r8 do(mi lad,) \grace lad4 si2\mbreak

    %16
    r8 la!(do fad,) \grace fad4 sol2
    r8 mi'(re do) si(la) sol(la)
    sol8 sol4(la8) sol2

    %19
    sol2 re'32(do si8.)~si4
    \grace si8 la sold16(la) la4~la8 do si la\mbreak
    \grace la sol1-+

    %22
    fad2. \grace do'8 si8.(sol16)
    \grace fad4 mi2 mi4.-+ red16 mi
    \grace mi4 red2\fermata r8 si'(mi) re!-.

    %25
    \grace re do2 r8 la(re) do-.
    \grace do si2 r8 fad(si) la-.\mbreak
    sol1

    %28
    mi'~
    mi4 mi,8. fad16 mi4 red8. mi16
    mi2 r8 si'(mi) re-.

    %31
    \grace re do2 r8 la(re) do-.
    \grace do si2 r8 fad(si) la-.\mbreak
    sol1

    %34
    mi'~
    mi4 mi,8. fad16 mi4 red8. mi16
    mi1

}

IIvlIIn = \relative do'' {

    r4 mi,8.\p fad16 sol4 la
    sol mi8. fad16 sol2~
    sol4 fad8 mi fad2

    %4
    fad4 mi8. fad16 sol2\mbreak
    fad4. mi8 red mi fad4
    fad mi8. fad16 sol4 r

    %7
    R1
    la
    la4 sol8. fad16 sol4 dod

    %10
    \grace dod2 re1\fermata\mbreak
    r2 r8 fad, si fad
    mi4 r  r8 re sol re

    %13
    mi4 r8 mi' re do si mi,
    re re'4 do8 si2
    r r8 fad si fad\mbreak

    %16
    mi4 r r8 re sol re
    mi4 r8 mi' re do si mi,
    re re'4 do8 si2

    %19 OOKK
    si2. sol4
    sol fad8. mi16 fad2\mbreak
    fad4 mi8. red16 mi2

    %22
    mi4 red r2
    r4 si' lad4. si8
    si2\fermata r

    %25
    r8 mi, la sol fad2\mbreak
    r8 re sol mi fad2
    fad4 mi8. red16 mi2

    %28
    sol1\parenthesize ~
    sol4 sol8. la16 sol4 fad8. mi16
    mi2 r

    %31
    r8 mi la sol fad2\mbreak
    r8 re sol mi fad2
    fad4 mi8. red16 mi2

    %34
    sol1\parenthesize ~
    sol4 sol8. la16 sol4 fad8. mi16
    mi1

}

IIvlan = \relative do' {

    sol4\p sol sol do8 la
    si4 si si si
    si2 si

    %4
    si2. si4
    si2 si\mbreak
    si2. r4

    %7
    r re re re
    mi2 re4 re8. do16
    si2. sol4

    %10
    \grace sol2 la1\fermata
    r4 do fad, re'
    r la re, si'\mbreak

    %13
    r sol sol4. do8
    si4 re re2
    r4 do fad, re'

    %16
    r la re, si'
    r sol sol4. do8
    si4 re re2\mbreak

    %19
    re2. re4
    re2 si
    si dod

    %22
    si2. si4
    sol2 mi
    fad\fermata r4 si

    %25
    si la r la\mbreak
    la sol r si
    si1

    %28
    dod
    si2 si
    si r4 si

    %31
    si la r la
    la sol r si
    si1

    %34
    dod
    si2 si
    si1

}


IIbcn = \relative do {

    mi4\p mi mi mi
    mi mi mi mi
    si si si si

    %4
    mi mi mi mi
    si si si si\mbreak
    mi mi mi r

    %7
    si si si si
    do do re re
    mi mi mi mi

    %10
    re2 re,\fermata
    mi'4 mi re re
    do do si si\mbreak

    %13
    do do do do
    re re, sol2
    mi'4 mi re re

    %16
    do do si si
    do do do do
    re re, sol2

    %19
    sol4 sol sol sol
    re' re red red
    mi mi la, la

    %22
    si si si si
    do do do2
    si\fermata sold'4 sold\mbreak

    %25
    la la re, re
    sol sol red red
    mi mi do si

    %28
    lad lad lad lad
    si si si si
    mi,2 sold'4 sold\mbreak

    %31
    la la re, re
    sol sol red red
    mi mi do si

    %34
    lad lad lad lad
    si si si si
    mi,1




}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    <4>4 <_+> s <7>
    <4> <3> s2
    <4>4 <_+> s2
    s1
    <6>
    s
    s
    <4>2 <3>
    <6> <6>
    <6> <6>
    s1
    <4>4 <3> s2
    <6>2 <6>
    <6> <6>
    s1*3
    s2 <7 5>
    s <7>
    <5 _+>1
    s
    s2 <6>
    s1
    s2 <6>
    s2 s4 <6>
    <5>1
    <4>2 <4>4 <_+>
    s2 <6>
    s1
    s2 <6>
    s2 s4 <6>
    <5>1
    <4>2 s4 <_+>

}

forma = {

    \time 4/4
    \key mi\minor
    \tempo 2 = 55
    s1*18
    \bar ":..:"\break
    s1*18
    \bar":|."
    \mark\markup\fermata

}



IIvlI = {
    \global
    <<\IIvlIn \forma>>

}

IIvlII = {
    \global
    <<\IIvlIIn \forma>>

}


IIvla = {
    \global
    \clef alto
    <<\IIvlan \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    si'4-. si-. si-.
    si-. r la-.
    r \grace la8 sold4 \grace sold8 fad4

    %4
    \grace fad8 mi(red mi2)\mbreak
    si4\p-. si-. si-.
    si-. r la-.

    %7
    r \grace la8 sold4 \grace sold8 fad4
    \grace fad8 mi(red mi2)
    \grace fad'8 mi8.\f(fad16) sold4-. r

    %10
    \grace sold8 fad8.(sold16) la4-. r
    sold8. (si16) la4-. sold-.
    \grace sold4 fad2.\mbreak

    %13
    \grace fad,8 mi8.\p(fad16) sold4-. r
    \grace sold8 fad8.(sold16) la4-. r
    sold8. (si16) la4-. sold-.

    %16
    \grace sold4 fad2.
    si'4\f r r
    si r r

    %19
    si\p(sold) mid-.
    \grace mid?4 fad2.\mbreak
    la4\f r r

    %22
    la r r
    la\p(fad) red-.
    \grace red4 mi2.

    %25
    si4\f si si
    \grace dod8 si4 la r
    \grace si8 la4 sold r

    %28
    \grace sold8 fad mi fad4 r
    si\p si si\mbreak
    \grace dod8 si4 la r

    %31
    \grace si8 la4 sold r
    \grace sold8 fad mi fad4 r
    si4\f si si

    %34
    \grace si4 dod2.
    red4 red8 dod red4
    \grace red mi2.

    %37
    si4\p si si\mbreak
    \grace si4 dod2.
    red4 red8 dod red4

    %40
    \grace red mi2.
    si'4\f si si
    \grace si4 dod2.

    %43
    r8 si mi,4 red
    \grace red mi2.
    si4\p si si\mbreak

    %46
    \grace si4 dod2.
    r8 mi\f si,4 fad''-+
    mi2.

}

IIIvlIIn = \relative do'' {

    sold'4 sold sold
    sold r fad
    r mi si

    %4
    sold2.\mbreak
    sold4\p sold sold
    sold r fad

    %7
    r mi si
    sold2.
    r4 r mi''\f

    %10
    r r fad
    mi8. sold16 fad4 mi
    \grace mi4 red2.\mbreak

    %13
    r4 r mi,\p
    r r fad
    mi8. sold16 fad4 mi

    %16
    \grace mi4 red2.
    red'4\f r r
    mid r r

    %19
    r r si'\p
    \grace si4 la2.\mbreak
    red,4\f r r

    %22
    fad r r
    r r la\p
    \grace la4 sold2.

    %25
    sold,4 \f sold sold
    \grace la8 sold4 fad r
    \grace sold8 fad4 mi r

    %28
    \grace mi8 red dod red4 r\mbreak
    sold\p sold sold
    \grace la8 sold4 fad r

    %31
    \grace sold8 fad4 mi r
    \grace mi8 red dod red4 r
    r r si'\f

    %34
    \grace si4 la2.
    la4 la la
    \grace la4 sold2.\mbreak

    %37
    r4 r si\p
    \grace si4 la2.
    la4 la la

    %40
    \grace la4 sold2.
    r4 r mi'\f
    mi2.

    %43
    r4 r la,
    \grace la4 sold2.
    r4 r mi\p\mbreak

    %46
    mi2.
    r4 si\f la
    sold2.

}

IIIvlan = \relative do' {

    r4 mi mi
    r dod2
    r4 si si

    %4
    si2.
    r4 si\p si
    r dod2\mbreak

    %7
    r4 si si
    si2.
    r4 si\f si

    %10
    r si si
    r mi dod
    si2.

    %13
    r4 si\p si
    r si si
    r mi dod

    %16
    si2.\mbreak
    r4 fad'\f fad
    r mid mid

    %19
    r mid\p(sold)
    r fad(dod)
    r dod\f dod

    %22
    r red red
    r red\p fad
    r mi si

    %25
    r mi\f sold\mbreak
    r red fad
    r mi mi

    %28
    r  red8. mi16 fad4
    r mi\p sold
    r red fad

    %31
    r mi mi
    r red8.\f mi16 fad4
    r r red

    %34
    mi2.\mbreak
    fad4 fad fad
    si,2.

    %37
    r4 r red\p
    mi2.
    fad4 fad si,

    %40
    si2.
    r4 mi\f mi
    r dod dod

    %43
    r si si
    r si si\mbreak
    r mi\p mi

    %46
    r dod dod
    r si\f si
    si2.

}


IIIbcn = \relative do {

    r4 mi mi
    r la2
    r4 si si,

    %4
    mi mi, mi\mbreak
    r mi\p mi
    r la2

    %7
    r4 si si
    mi mi, mi
    r mi'\f mi,

    %10
    r red' red,
    r mi' lad
    si si, si\mbreak

    %13
    r mi\p mi,
    r red' red,
    r mi lad

    %16
    si2.
    r4 si'\f si,
    r dod' dod,

    %19
    r dod'\p dod,
    r fad fad,\mbreak
    r fad'\f fad,

    %22
    r si' si,
    r si'\p si,
    r mi mi,

    %25
    r mi'\f mi,
    r fad' red
    r mi lad,

    %28
    r si si\mbreak
    r sold'\p mi
    r fad red

    %31
    r mi lad,
    r si\f si
    r si si

    %34
    r si si
    si si si
    si si si\mbreak

    %37
    r si\p si
    r si si
    si si si

    %40
    mi, mi mi
    r sold'\f sold,
    r la' la,

    %43
    r si' si,
    r mi mi,\mbreak
    r sold\p sold

    %46
    r la la
    r si\f si
    mi,2.

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    s
    s4 <6> <5>
    s2.*3
    s4 <6> <5>
    s2.*2
    s4 <6 5> s
    s s <7 5>
    <6 4> <5 3> s
    s2.
    s4 <5> s
    s s <7 5>
    <6 4>4 <5 3> s
    s2.
    s4 <7 5 _+> s
    s2.*3
    s4 <7> s
    s <7 5> s
    s2.*3
    s4 s <7 5>
    s2.
    s4 <6> s
    s2.
    s4 s <7 5>
    s2.
    s4 <2> s
    s2.
    <3>
    <4>
    s
    s4 <2> s
    <3>2.
    s2.*3
    s4 <4> <3>
    s2.
    s4 <6> s

}

forma = {

    \time 3/4
    \key mi\major
    \tempo 2. = 57
    s2.*16
    \bar":..:"\break
    s2.*32
    \bar ":|."
    \mark\markup\fermata

}



IIIvlI = {
    \global
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \global
    <<\IIIvlIIn \forma>>

}


IIIvla = {
    \global
    \clef alto
    <<\IIIvlan \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {

    si4\p mi2
    \grace do8 si4 si8._+(la16) sol4
    fad fad~fad8. si16

    %4
    \grace la8 sol4 sol8. fad16 mi4
    si' sol'2
    \grace sol8 fad4~fad8. lad,16 si4\mbreak

    %7
    mi la,8_+ sol fad_+ mi
    mi4(si'2)
    r4 mi,8\f fad sol la

    %10
    si4 si8-. dod-. re-. si-.
    mi4 la,8-. sold-. fad(mi)
    si2.

    %13
    si'4\p mi~mi8 re\mbreak
    \grace re8 do4 do8. [si16 la8. sol16]
    fad4 re' re8. do16

    %16
    \grace do8 si4 si8. la16 sol4
    mi' mi mi8. fad16
    \grace mi8 red4. dod16 si mi8\noBeam r\mbreak

    %19
    \grace la,8 sol8.\f fad16 sol4 fad8. mi16
    mi2.

}

IVvlIIn = \relative do'' {

    r4 r sol\p
    \grace sol4 fad2 mi4~
    mi red8 mi fad red

    %4
    \grace red?4 mi2 si4
    r r do'~
    do8 lad si4 fad'\mbreak

    %7
    fad4. mi8 red mi
    \grace mi4 red?2.
    r4 mi,8\f fad sol la

    %10
    si4 si8 dod re si
    mi4 la,8 sold fad mi
    si2.

    %13
    R
    mi'4\p la do\mbreak
    do8 la \grace sol4 fad2

    %16
    re4 sol si
    r si, do
    si2.

    %19
    r4 mi,\f  red8. mi16
    mi2.

}


IVbcn = \relative do {

    mi2\p mi4
    red2 mi4
    la,2 si4

    %4
    mi2.
    r4 r mi
    re2 r4

    %7
    do2 r4
    si2 r4
    mi2\f mi4

    %10
    re2 re4
    do2 do4
    si2.

    %13
    mi2\p sold4
    la2.
    re,2 fad4\mbreak

    %16
    sol2.
    sol2 la4
    si la sol

    %19
    la\f si si,
    mi2.

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6>
    <6\\>2 <_+>4
    s2.
    s
    <6 3>
    <7>4 <6> s
    <_+>2.
    s
    <6>
    <7>4 <6> s
    <_+>2.
    <_+>2 <6>4
    s2.
    s2 <6>4
    s2.
    <6>
    \bassFigureExtendersOn <_+>4 <_+> <6>
    <7> <6 4> <5 _+>

}

forma = {

    \time 3/4
    \key mi\minor
    \tempo 2. = 57
    s2.*12
    \bar":..:"\break
    s2.*8
    \bar ":|."
    \mark\markup\center-column\small {"Menuet""da capo"}

}



IVvlI = {
    \global
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VvlIn = \relative do'' {

    si'8
    \grace si la sold16 (fad mi8) red-.
    \grace red mi4(si8) si,-.
    mi [fad sold lad]

    %4
    \grace lad? si4 r8 la\p\mbreak
    sold fad \grace fad mi4
    red r8 fad'\f

    %7
    fad[(si) fad-.\once\stemUp red,\p]
    red4(si'8) fad'\f-.
    fad[(si) fad-.\once\stemUp red,\p]

    %10
    red4(si'8) fad'\f-.
    \grace sold fad mi16 red \grace fad8 mi red16 dod
    si4. fad'8\mbreak

    %13
    \grace la sold fad \grace la sold fad16 mi
    fad4(red8) fad-.
    \grace fad mi red \grace fad mi red16 dod

    %16
    si4. red,8\p
    \grace fad mi red \grace fad mi red16 dod
    red4(si8) \once\stemDown red'-.\mbreak

    %19
    \grace red dod si \grace red dod si16\f lad
    si4(fad'8) fad,
    si4(fad'8) fad,

    %22
    si[si fad' fad,]
    si4 r8 fad'\f
    \grace fad mi red16 dod si8 lad

    %25
    si4(fad8) fad-.\mbreak
    si[dod red mid]
    \grace mid? fad4. mi8\p

    %28
    red-. dod-. si4-+
    lad4. si8\f
    mi-.[fad-. sold-. lad-.]

    %31
    si si16 lad si8 la\p
    sold-. fad-.\grace fad mi4-+\mbreak
    red4. si'8\f

    %34
    si4(fad8) mi-.\p
    \grace mi red4(mi8) si'-.\f
    si4(fad8) mi\p

    %37
    red4(mi8) fad-.
    sold[sold\f red mi]
    \grace sold fad4.\fermata r8

    %40
    r4 r8 sold,\p\mbreak
    \grace sold la4 mi8 r
    r4 r8 sold\p

    %43
    \grace sold la4 mi8 r
    r mi\f[fad mi]
    \grace mi red4.\fermata si'8

    %46
    mi[fad sold lad]
    si si16 lad si8 la-.\p\mbreak
    sold-. fad-. \grace fad mi4

    %49
    red r8 si\f
    si[(red) si-. red,-.\p]
    red4(fad8) si-.\f

    %52
    si[(red) si-. red,-.\p]
    red4(\once\stemUp fad8) \once\stemDown la'-.\f
    \grace la8 sold fad16 mi \grace sold8 fad mi16 red\mbreak

    %55
    mi4. si'8
    \grace red  dod si  \grace red dod si16 la
    si4(sold8) si-.

    %58
    \grace si la sold \grace si la sold16 fad
    mi4. sold,8\p
    \grace si la sold \grace si la sold16 fad\mbreak

    %61
    sold4(mi8) sold-.
    \grace sold  fad mi \grace sold fad mi16\f red
    mi4(si'8) si,

    %64
    mi4(si'8) si,-.
    mi-.[mi-. si'-. si,-.]
    mi4 r8

}

VvlIIn = \relative do'' {

    r8
    r4 r8 si'
    \grace si la sold16(fad mi8) red-.
    mi4 r8 mi,

    %4
    red4 r8 si\p\mbreak
    mi[fad sold lad]
    si4 r

    %7
    r r8 fad\p
    fad[(si) fad-.] r
    r4 r8 fad\p

    %10
    fad[si fad mi'\f]
    \grace mi red dod16 si \grace red8 dod si16 lad\mbreak
    si4. red8

    %13
    \grace fad mi red \grace fad8 mi red16 dod
    red4(si8) red
    \grace red dod si \grace red dod si16 lad

    %16
    si4. fad8\p
    \grace la? sold fad \grace la sold fad16 mi
    fad4(red8) fad-.\mbreak

    %19
    \grace fad mi red \grace fad8 mi red16\f dod
    red4 r8 mi
    red4 r8 mi

    %22
    red[red fad mi]
    red4 r8 r
    r4 r8 fad'\f

    %25
    \grace fad mi red16(dod si8) lad-.\mbreak
    si4 r8 si
    lad4 r8 fad\p

    %28
    si,-. [dod-. red-. mid-.]
    fad4 r
    r r8 mi'\f-.

    %31
    red[(dod red) \once\stemUp si,-!\p ]
    mi-.[fad-. sold-. lad-.]\mbreak
    si4 r

    %34
    r r8 sold'\p
    \grace sold8 la4(mi8) r
    r4 r8 sold\p

    %37
    \grace sold8 la4(mi8) r
    r mi\f[fad mi]
    \grace mi red4.\fermata si8\f\mbreak

    %40
    si4(fad8) mi-!\p
    \grace mi red4(mi8) si'\f
    si4(fad8) mi\p

    %43
    red4(mi8) fad\f
    sold[sold red mi]
    \grace mi fad4.\fermata r8

    %46
    r4 r8 mi'\mbreak
    red[(dod red) \once\stemUp si,-.\p ]
    mi-.[fad-. sold-. lad-.]

    %49
    si4 r
    r4 r8 si,\p-.
    si[(red) si-.] r

    %52
    r4 r8 si\p
    si[(red si) si'-.\f]\mbreak
    si sold \grace si la sold16 fad

    %55
    sold4. sold'8
    \grace si la sold \grace si la sold16 fad
    sold4(mi8) sold-.

    %58
    \grace sold fad mi \grace sol fad mi16 red
    mi4. si8\p\mbreak
    \grace red dod si \grace red dod si16 la

    %61
    si4(sold8) si-.
    \grace si la sold  \grace si la sold16\f fad
    sold4 r8 la

    %64
    sold4 r8 la-.
    sold-.[sold-. si-. la-.]
    sold4 r8

}

Vvlan = \relative do' {

    r8
    r si[mi fad]
    sold4 r8 fad
    sold si, \grace fad' mi red16 mi

    %4
    fad4 r\mbreak
    r8 si,\p \grace fad' mi red16 mi
    fad4 r\mbreak

    %7
    r8 red\f[red(fad)]
    r8 red\p[red(fad)]
    r8 red\f[red(fad)]

    %10
    r8 red\p[red(si)]
    si\f [fad fad fad]
    red4. si''8\mbreak

    %13
    sold4(mi8) si'-.
    fad4 r8 fad
    sold4 fad

    %16
    fad r8 si\p
    sold4(mi8) si'-.
    fad4 r8 fad

    %19
    sold4 fad
    fad\f red8 fad\mbreak
    fad4 red8 fad

    %22
    fad[(si) fad-. fad-.]
    fad4 r8 r
    r fad\f[fad fad]

    %25
    fad4. mi8
    red fad, \grace dod' si lad16(si)
    dod4 r\mbreak

    %28
    r8 fad,\p \grace dod' si lad16(si)
    dod4 r
    r8 si\f \grace fad' mi red16 mi

    %31
    fad4 r
    r8 si, \p\grace fad' mi red16 mi
    fad4 r8 red\f

    %34
    red4 r8 mi\p\mbreak
    fad4(sold8) red\f
    red4 r8 mi\p

    %37
    fad4(sold8) red
    mi[(si')\f  lad-. sold-.]
    fad4\fermata r8 red\f

    %40
    red4 r8 mi,\p
    fad4 sold8 red\f\mbreak
    red4 r8 mi\p

    %43
    fad4 (sold8) red\f
    mi[(si') la-. sold-.]
    fad4\fermata r

    %46
    r8 si \grace fad' mi red16 mi
    fad4 r8 red\p
    mi si \grace fad' mi red16 mi\mbreak

    %49 OOKK
    fad4 r
    r8 fad\f[red(fad)]
    r8 fad\p[red(fad)]

    %52
    r8 fad\f[red(fad)]
    r8 fad\p[red(fad)]
    mi4\f dod8 si

    %55
    si4 r8 mi'\mbreak
    dod4(la8) mi'
    si4 r8 si-.

    %58
    dod4 -. si-.
    si4-. r8 mi,\p
    dod4(la8) mi'-.

    %61
    si4 r8 si-.
    dod4-. si-.\mbreak
    si4\f(sold8) si-.

    %64
    si4(sold8) si-.
    si-.[mi-. si-. si-.]
    si4 r8

}


Vbcn = \relative do {

    r8
    mi4 r8 si'
    mi,4 r
    mi4 dod

    %4
    si r
    mi\p dod
    si r\mbreak

    %7
    si\f r
    si\p r
    si\f r

    %10
    si\p r8 mi\f
    fad4 fad,
    si r8 si'

    %13
    si,[si' si, si']
    si,[si' si, si']\mbreak
    mi,4 r8 fad

    %16
    si,4 r8 si'\p
    si,[si' si, si']
    si,[si' si, si']

    %19
    mi,4 r8 fad\f
    si4 r8 fad
    si4 r8 fad

    %22
    si-. [si-. fad-. fad-.]\mbreak
    si4 r8 r
    mi,4\f fad

    %25
    si, r
    si sold
    fad r

    %28
    si\p sold
    fad r\mbreak
    mi'\f dod

    %31
    si r
    mi\p dod
    si r

    %34
    si8\f[si' si,] r
    r si\p si4
    r8 si\f[si' si,]

    %37
    r si\p [si si]\mbreak
    r si\f [si si]
    si4\fermata r

    %40
    si8\f[si' si,] r
    r si\p si4
    r8 si\f[si' si,]

    %43
    r si\p [si si]
    r si\f [si si]\mbreak
    si4\fermata r

    %46
    mi dod
    si r
    mi\p dod

    %49
    si r
    si\f r
    si\p r

    %52
    si\f r\mbreak
    si\p r8 si\f
    mi[mi la, si]

    %55
    mi,4 r8 mi''
    mi,[mi' mi, mi']
    mi,[mi' mi, mi'-.]

    %58
    la,4 r8 si\mbreak
    mi,4 r8 mi\p
    mi,[mi' mi, mi']

    %61
    mi,[mi' mi, mi'-.]
    la,4 r8 si\f
    mi4 r8 si

    %64
    mi4 r8 si-.\mbreak
    mi-. mi-. si-. si-.
    mi4 r8

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s8
    s2
    s
    s4 <6\\>
    s2
    s4 <6\\>
    s2*5
    <6 4>4 <7>
    s2
    <6 4>8 <5> <6 4> s
    \bassFigureExtendersOn <5 3>8 <_> <_> <_>\bassFigureExtendersOff
    s4 s8 <_+>
    s2
    <6 4>8 <5> <6 4> s
    <5>2
    <6>4 s8 <_+>
    s2*4
    s4 <_+>
    s2
    s4 <6\\>
    <_+>2
    s4 <6>
    <_+>2
    s4 <6\\>
    s2
    s4 <6\\>
    s2*5
    s8 <6 4> <5 3> <6 4>
    <5>2
    s
    s8 <7> s4
    s4 s8 <6>
    s8 <7> s4
    s8 <6 4> <5 3> <6 4>
    <5>2
    s4 <6>
    s2
    s4 <6\\>
    s2*4
    s4 s8 <7 5>
    s4 <6>
    s2
    <6 4>8 <5 3> <6 4> s
    <5 3>2
    s2
    s
    <6 4>8 <5 3> <6 4> s
    <5 3>2
    <6 5>

}

forma = {

    \time 2/4
    \key mi\major
    \tempo 2 = 60
    \partial 8 s8
    s2*22
    s4 s8
    \bar":..:"%\break
    s8
    s2*42
    s4.
    \bar ":|."
    \mark\markup\fermata

}



VvlI = {
    \global
    <<\VvlIn \forma>>

}

VvlII = {
    \global
    <<\VvlIIn \forma>>

}


Vvla = {
    \global
    \clef alto
    <<\Vvlan \forma>>

}

Vbc = {
    \global
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}
#(set-global-staff-size 15.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \header {

        title = \markup\smaller{Sinfonia in Mi maggiore}
        composer = \markup \center-column{"G. Ferrandini (1710 - 1791)"}

    }

    \markup \huge {[1.] Allegro moderato }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino 2."}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {
            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

    \markup \huge {[2.] Andante alla breve }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino 2."}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/4)
                \override BarLine.hair-thickness = #1.2
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

    \markup \huge {[3.] Tempo di Menuet }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino 2."}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #0.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

    \markup \huge {[4.] Trio }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino 1."}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino 2."}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17.5)
            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

    \markup \huge {[5.] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino 1."}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino 2."}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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
