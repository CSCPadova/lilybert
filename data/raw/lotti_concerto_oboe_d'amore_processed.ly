\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

dolce =_\markup\italic"doux"

forte = _\markup\italic\center-align"fort"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tous"

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



mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##t
    \terzinequarto \con
}




Iobn = \transpose sol mi

\relative do'' {
    \key do\major

    sol8\solo
    do4. sol'16(si,) do4. sol'16(si,)
    do4. sol'16(si,) do4 r8 sol
    re'4. sol16(do,) re4. sol16(do,)

    %4
    re4. sol16(do,) re4 r
    R1*3
    r2 r4 r8 sol,\p

    %9
    do4. sol'16(si,) do4. sol'16(si,)
    do4. sol'16(si,) do4 r8 sol
    re'4. mi16\parenthesize  (sol) re4. mi16\parenthesize (sol)

    %12
    re4. mi16\parenthesize (sol) re4 r8 re
    mi16 re do re mi fa sol la re, do si do re mi fa sol
    do, si la si do re  mi fad si, la si sol do si do la

    %15
    re do re si mi re mi do fad re mi fad sol si la sol\mbreak
    fad re mi fad sol si la sol fad sol mi fad re mi re mi
    si re mi fad sol8 do, si16 re mi fad sol8 do,

    %18
    si sol' la,4 sol r
    R1
    r2 r4 r8 re'\p

    %21
    sol4. mi16(do) sol'4. mi16(do)
    la'8 sol r do, sol'4. mi16(do)\mbreak
    sol'4. mi16\parenthesize (do) la'8 sol r sol

    %24
    la16 fa sol la fa re mi fa sol mi fa sol mi do re mi
    fa re mi fa re do si do mi do re mi re do si la
    sol do si do la re do re si mi re mi do fa mi fa

    %27
    re8 sol4 fa16 mi re8 sol4 fa16 mi\mbreak
    re8 do16 si do8 la' mi4 re
    do r r r8 sol\p

    %30
    sol4. mi'16(do) sol4. re'16(si)
    sol4. mi'16(do) sol4 r8 sol'
    sol4. do16(sol) sol4. do16(sol)

    %33
    sol4. do16\parenthesize(sol) sol4 r8 sol
    la16 fa mi re mi fa sol mi fa re do si do re mi do\mbreak
    re si la sol la si do la si do re si do re mi fa

    %36
    sol la sol la sol la sol la sol8 la16 si do8 fa,
    mi4 re do r
    R1*7

    %45
    r2 r4 _\fermata r8 do\p
    do4. la'16\parenthesize ( fa) do4. la'16(fa)
    do4. la'16(fa) sol8 do, r sol'\mbreak

    %48
    la4. dod,8 re fa mi re
    dod si16 la sol'4. fa8 sib4~
    sib8 la16 sol la8 re, dod re16 dod re8 sol

    %51
    fa4 mi re r
    R1
    r2 r4 r8 fa\p

    %54
    mi4. fa16(re) mi4. fa16(re)
    mi4. fa16(re) mi8 la, r mi'\mbreak
    fa si4 sol mib re8

    %57
    dod4. re16 mi! re4. mi16 fa
    mi8 fad16 sold la8 re, do4 si!
    la r r r8

}

IvlIn = \relative do'' {
    \key la\major

    mi,8
    la4. mi'16(sold,) la4. mi'16(sold,)
    la4. mi'16(sold,)  la4 r8 mi
    si'4. mi16(la,) si4. mi16(la,)

    %4
    si4. mi16(la,) si4 r8 si
    dod16(la) dod(la) re(si) re(si) dod(la) dod(la) si (sold) mi (si')
    dod(la) dod(la) re(la) re(la)\mbreak dod(la) dod(la) si8 mi,

    %7
    la16 si dod si la8 mi la16 si dod si la8 mi
    dod16 si dod la mi'8 mi la,4 r
    r8 mi'\p la,4 r8 mi' la,4

    %10
    r8 mi' la,4 r8 mi' la,4
    r8 sold' mi4 r8 sold mi4
    r8 sold mi4 r8 sold mi4\mbreak

    %13
    dod'8\pp mi mi mi mi mi mi mi
    mi mi red red mi4 r8 la,
    si r dod r fad, fad sold sold

    %16
    fad fad sold sold fad4 r8 fad
    sold4 r8 fad sold la si la
    sold4 fad mi r8 si'\f

    %19
    dod16(la) dod(la) re(si) re(si) dod(la) dod(la) si (sold) mi (si')\mbreak
    dod(la) dod(la) re(si) re(si) dod(la) dod(la) si4
    r r8 la\p mi'4. dod16(la)

    %22
    fad'8 mi la16(mi) la(mi) dod8 la r la
    mi'4. dod16(la) fad'8 mi la16(mi) la(mi)
    fad4 r la, r

    %25
    sold r la sold8 fad
    mi r fad r sold r la r\mbreak
    si la sold dod si la sold dod

    %28
    si4 la8 la la4 sold
    la16 \f si dod si la8 mi la4 r8 mi\p
    dod'16(la) dod(la) dod(la) dod(la) re(si) re(si) re(si) re(si)

    %31
    dod(la) dod(la) dod(la) dod(la) si(sold) si(sold) mi4
    r8 mi' la16(mi) la(mi) dod(la) dod(la) la'(mi) la(mi)\mbreak
    dod(la) dod(la) la'(mi) la(mi) dod(la) dod(la) la'(mi) la(mi)

    %34
    fad8 r mi r re r dod r
    si r la r sold4 r
    r8 dod si dod la4 r8 si

    %37
    la4 sold la r8 mi\f
    la4. mi'16(sold,) la4. mi'16(sold,)\mbreak
    la4. mi'16(sold,)  la4 r8 mi

    %40
    si'4. mi16(la,) si4. mi16(la,)
    si4. mi16(la,) si4 r8 si
    dod16(la) dod(la) re(si) re(si) dod(la) dod(la) si (sold) mi (si')

    %43
    dod(la) dod(la) re(si) re(si) dod(la) dod(la) si8 mi,
    la16 si dod si la8 mi la16 si dod si la8 mi
    dod si16 la mi'8 mi la,4\fermata r8 mi''\p   %%% fine ripresa

    %46
    fad8-! fad-! fad-! fad-! mi mi mi mi
    fad fad fad fad mi mi mi mi
    fad fad, r lad si4. si8

    %49
    lad4 r8 dod dod(si) r si
    dod4 re8 si\mbreak lad4 si
    si lad si r8 re\f

    %52
    dod4. re16(si) dod4. re16(si)
    dod4. re16(si) dod8 fad, r4
    r8 si\p lad4 r8 si lad4

    %55
    r8 si lad4 r8 fad16 sold lad8[lad]
    si4 si do sold
    fad4. fad8\mbreak mi4. si'8

    %58
    fad4. fad8 fad4 mid
    fad r4 r r8

}

IvlIIn = \relative do'' {
    \key la\major

    mi,8
    la4. mi'16(sold,) la4. mi'16(sold,)
    la4. mi'16(sold,)  la4 r8 mi
    si'4. mi16(la,) si4. mi16(la,)

    %4
    si4. mi16(la,) si4 r8 sold
    la la si si la la sold sold
    la la si si la la sold mi

    %7
    la16 si dod si la8 mi la16 si dod si la8 mi
    dod16 si dod la mi'8 mi la,4 r
    r8 mi'\p la,4 r8 mi' la,4

    %10
    r8 mi' la,4 r8 mi' la,4
    r8 sold' mi4 r8 sold mi4
    r8 sold mi4 r8 sold mi4\mbreak

    %13
    la8\pp dod dod dod si si si si
    la la la la sold4 r8 la\mbreak
    sold r dod r fad, fad mi mi

    %16
    fad fad mi mi fad4 r8 red
    mi4 r8 red mi fad sold fad
    mi4 red mi r8 sold\f

    %19
    la la si si la la sold sold
    la la si si la la sold4
    r8 la\p la,4 r8 la' la,4

    %22
    r8 la' la,4 r8 la' la,4
    r8 la' la,4\mbreak r8 la' la,4
    re r dod r

    %25
    si r la r
    la8 r re r mi r fad r
    sold fad mi la sold fad mi la

    %28
    sold mi fad re mi4 mi
    la16\f si dod si la8 mi la16 si dod si la8 mi
    la\p la la la si si si si

    %31
    la la la la sold4 r
    r8 la la,4\mbreak r8 la' la,4
    r8 la' la,4 r8 la' la,4

    %34
    re'8 r dod r si r la r
    sold r fad r mi4 r
    r8 la sold la dod,4 r8 re

    %37
    mi4 mi la, r8 mi'\f
    la4. mi'16(sold,) la4. mi'16(sold,)
    la4. mi'16(sold,)  la4 r8 mi

    %40
    si'4. mi16(la,) si4. mi16(la,)
    si4. mi16(la,) si4 r8 sold
    la la si si la la sold sold

    %43
    la la si si la la sold mi
    la16 si dod si la8 mi la16 si dod si la8 mi
    dod16 si dod la mi'8 mi la,4\fermata r8 dod' \p %%% fine ripresa

    %46
    re16(la) re(la) re(la) re(la) dod(la) dod(la) dod(la) dod(la)
    re(la) re(la) re(la) re(la) dod(la)\mbreak dod(la) dod(la) dod(la)
    re8 fad,16 mi re8 mi fad4 sol

    %49
    dod, r8 fad fad4 r8 sol
    mi la16 sol fad8 sol fad4 mi8 sol
    fad2 re4 r8 re'\f

    %52
    dod4. re16(si) dod4. re16(si)
    dod4. re16(si) dod8 fad, r4
    r8 fad\p fad4 r8 fad fad4\mbreak

    %55
    r8 fad fad4 r8 fad fad4
    si, mi mi mi
    fad8 sold fad mi re dod re si

    %58
    la4. si8 dod2
    fad4 r r r8

}

Ivlan = \relative do' {
    \key la\major

    r8
    r mi la,4 r8 mi' la,4
    r8 mi' la,4 r8 mi' la,4
    r8 sold' mi4 r8 si' mi,4

    %4
    r8 si' mi,4 r8 si' mi,4
    mi8 mi mi mi  mi mi mi mi
    mi mi mi mi  mi mi mi mi\mbreak

    %7
    la16 si dod si la8 mi la16 si dod si la8 mi
    dod16 si dod la mi'8 mi la,4 r
    r8 mi'\p la,4 r8 mi' la,4

    %10
    r8 mi' la,4 r8 mi' la,4
    r8 sold' mi4 r8 sold mi4
    r8 sold mi4 r8 sold mi4

    %13
    la8\pp la la la sold sold sold sold\mbreak
    fad fad fad fad mi r fad r
    sold r la r si, si si si

    %16
    si si si si si4 r8 si
    mi4 r8 si mi4 sold,8 la
    si4 si mi r8 mi\f

    %19
    mi mi mi mi mi mi mi si
    mi mi mi mi\mbreak mi mi mi4
    r8 la\p la,4 r8 la' la,4

    %22
    r8 la' la,4 r8 la' la,4
    r8 la' la,4\mbreak r8 la' la,4
    re r dod r

    %25
    si r la r
    la8 r re r mi r fad r
    sold fad mi la sold fad mi la

    %28
    sold mi fad re mi4 mi
    la16\f si dod si la8 mi la16 si dod si la4
    r8 mi\p la,4 r8 mi' la,4

    %31
    r8 mi' la,4 r8 mi' la,4
    r8 la' la,4 r8 la' la,4
    r8 la' la,4 r8 la' la,4

    %34
    R1*2
    r8 la' sold la dod,4 r8 re
    mi4 mi, la r

    %38
    r8 mi'\f la,4 r8 mi' la,4
    r8 mi' la,4 r8 mi' la,4
    r8 sold' mi4 r8 si' mi,4

    %41
    r8 si' mi,4 r8 si' mi,4
    mi8 mi mi mi  mi mi mi mi
    mi mi mi mi  mi mi mi mi

    %44
    la16 si dod si la8 mi la16 si dod si la8 mi
    dod16 si dod la mi'8 mi la,4\fermata r8  r %% fine ripresa
    r8 la' la,4 r8 la' la,4

    %47
    r8 la' la,4 r8 la' la,4
    re8 dod si dod re4 mi
    fad r8 lad, si4 r8 mi

    %50
    la,4 re8 mi fad4 sold8 mi
    fad4 fad, si r\mbreak
    r8 fad'\f fad,4 r8 fad' fad,4

    %53
    r8 fad' fad,4 r8 fad' fad,4
    r8 fad'\p fad,4 r8 fad' fad,4
    r8 fad' fad,4 r8 fad' fad,4

    %56
    si mi, mi' mi
    fad8 sold fad mi re dod re si
    la4. si8 dod2

    %59
    fad,4 r r r8

}

Imdn = \relative do'' {
    \key la\major

    r8
    <la mi dod la>4.\f <sold mi re si>8 <la mi dod>4. <sold mi re si>8
    <la mi dod>4. <sold mi re si>8 <la mi dod la>4 r
    <si sold mi>4. <la mi dod>8 <si sold mi>4. <la mi dod>8

    %4
    <si sold mi>4. <la mi dod>8 <si sold mi>4 r
    <la mi dod> <si mi, re> <la mi dod> <sold mi si>
    <la mi dod> <si mi, re> <la mi dod> <sold mi si>\mbreak

    %7
    la16 si dod si la8 mi la16 si dod si la8 mi
    dod16 si dod la mi'8 <sold mi re si> <la mi dod la>4 r
    <<
        {
            <dod la>4. \p<si sold mi>8 <dod la>4. <si sold mi>8

            %10
            <dod la>4. <si sold mi>8 <dod la>4 r
            <la fad>4. <dod la>8 <si sold>4. <dod la>8
            <si sold>4. <dod la>8 <si sold>4 r
        }\\{
            r8 mi, la,4 r8 mi' la,4
            r8 mi' la,4 r8 mi' la,4
            r8 sold' mi4 r8 sold mi4
            r8 sold mi4 r8 sold mi4
        }
    >>

    %13
    R1*5
    r2 r4 r8 <sold mi si>\f
    <la mi dod>4 <si mi, re > <la mi dod>4 <sold mi si>

    %20
    <la mi dod>4 <si mi, re > <la mi dod>4 <sold mi si>
    <<
        {
            <dod la>2 \p<dod la>
            <re fad,>8 <dod la> <mi dod>4 <dod la>2

            %23
            <dod la>2 <re fad,>8 <dod la> <mi dod>4
            <fad la,> r <mi la,> r
            <re sold,> r <dod mi,> r
        }\\{
            r8 la la,4 r8 la' la,4
            r8 mi' la,4 r8 la' la,4
            r8 la' la,4 r8 mi' la,4
            re s dod s
            si s la s
        }
    >>

    %26
    R1*2
    r2 r4 r8 mi'\f
    la16 si dod si la8 mi la16 si dod si la8 mi

    %30
    R1*2
    <<
        {
            <dod' la>2 <dod la>
            <dod la>2 <dod la>
        }\\{
            r8 la la,4 r8 la' la,4
            r8 la' la,4 r8 la' la,4
        }
    >>

    %34
    R1*4
    <la' mi dod la>4.\f <sold mi re si>8 <la mi dod la>4. <sold mi re si>8
    <la mi dod>4. <sold mi re si>8 <la mi dod la>4 r

    %40
    <si sold mi>4. <la mi dod>8 <si sold mi>4. <la mi dod>8
    <si sold mi>4. <la mi dod>8 <si sold mi>4 r
    <la mi dod> <si mi, re> <la mi dod> <sold mi si>

    %43
    <la mi dod> <si mi, re> <la mi dod> <sold mi si>\mbreak
    la16 si dod si la8 mi la16 si dod si la8 mi
    dod16 si dod la mi'8 <sold mi re si> <la mi dod la>4\fermata r8 r %% fine ripresa

    %46
    R1*5
    r2 r8 <fad re>\f <si fad re>4
    <lad fad dod>4.<si fad re>8 <lad fad dod>4. <si fad re>8

    %53
    <lad fad dod>4.<si fad re>8 <lad fad dod>4 r\mbreak
    R1*5
    r2 r4 r8

}


Ibcn = \relative do {
    \key la\major

    r8
    r8 mi la,4 r8 mi' la,4
    r8 mi' la,4 r8 mi' la,4
    r8 si' mi,4 r8 si' mi,4

    %4
    r8 si' mi,4 r8 si' mi,4
    la8 mi mi mi mi mi mi, mi
    la' mi mi mi mi mi, mi' mi,\mbreak

    %7
    la'16 si dod si la8 mi la16 si dod si la8 mi
    dod16 si dod la mi'8 mi, la4 r
    R1*9  %%% inizia ripresa

    %18
    r2 r4 r8 mi'
    mi mi mi mi mi mi, mi' mi,
    mi' mi mi mi mi mi mi4

    %21
    R1*7
    r2 r4 r8 mi
    la16 si dod si la8 mi \mbreak la16 si dod si la4

    %30
    R1*8
    r8 mi la,4 r8 mi' la,4
    r8 mi' la,4 r8 mi' la,4

    %40
    r8 si' mi,4 r8 si' mi,4
    r8 si' mi,4 r8 si' mi,4
    la8 mi mi mi mi mi, mi' mi,

    %43
    la' mi mi mi mi mi, mi' mi,\mbreak
    la'16 si dod si la8 mi la16 si dod si la8 mi
    dod16 si dod la mi'8 mi, la4\fermata r8 r %%% fine ripresa

    %46
    R1*5
    r2 r8 si' si,4
    r8 fad' fad,4 r8 fad' fad,4

    %53
    r8 fad' fad,4 r8 fad' fad,4
    R1*5
    r2 r4 r8

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 4/4
    \tempo 2 = 55
    \partial 8 s8
    s1*44
    s2 \mark\markup "Fine" s4 s8 \bar "||" \break  s8
    s1*13
    s2 s4 s8\mark\markup \italic\smaller\center-column {  "Da Capo""al Fine"}

    \bar"|"

}


Iob =  {
    \Iglobal
    <<\Iobn \forma>>

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

Imd = {
    \Iglobal
    \context Staff = up <<\Imdn \forma>>

}

Ibc= {
    \Iglobal
    \clef bass
    \context Staff = down <<\Ibcn \forma\Ibfn>>

}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##t
    \terzinequarto \con
}


IIobn = \transpose sol mi

\relative do'' {
    \key sol\major

    r8
    R2.*10
    r4. r8 r re\p
    si8. do16 re8 do8. re16 si8

    %13
    la8. sol16 la8 la4 la8
    si8. do16 re8 do8. re16 si8
    la4. r8 r la

    %16
    si8. la16 si8 sol8. fad16 mi8
    mi'8. fad16 sol8 la,4 mi'8
    sol8. dod,16 re8\mbreak dod4.

    %19
    re4 r8 r4 r8
    R2.*3
    r4. r8 r re\p

    %24
    re4 si8 sol4 la16 si
    mi,8. fad16 mi8 mi4 mi'8
    mi4 do8 la8. si16 do8

    %27
    fad,4. re4 re'8\f
    si4 la8 si8. do16 re8
    la4. r8 r re\pp\mbreak

    %30
    si4 la8 si8. do16 re8
    la4. r8 r re
    mi8. re16 do8 do8. si16 la8

    %33
    si4 do8 re4 mi8
    re4 sol8 si,8. do16 la8
    sol4. r8 r si\f

    %36
    la4 re8 la8 re16 dod re8
    la4. r8 r re\pp\mbreak
    la4 re8 la re16 dod re8

    %39
    la4. r8 r re
    mi8. re16 do8 do8. si16 la8
    si4 do8 re4 mi8

    %42
    re4 sol8 si,8. do16 la8
    sol4.\fermata r4 r8
    R2.*10

    %54
    r4. _\fermata r8 r re'\p
    si8. la16 sol8 do4 mi8
    re4.~\mbreak re4 mi8

    %57
    fa4 mi8 re4 do8
    fa4 mi8 re4 do8
    si4 do8 re4 mi8

    %60
    re4.~ re4 re8
    mib4 re8 mib4 re8
    mib4 re8 mib4 re8

    %63
    mib8. re16 do8 si4.
    do r4  r8\mbreak
    R2.*3

    %68
    r4.r8 r mi\p
    do8. si16 la8 si4 re8
    sold,4. r8 r la

    %71
    re4 do8 si4 la8
    re4 re8 si4 la8
    sold4 mi'8 do8. re16 si8

    %74
    la4. r8 r do
    si4 mi8 red4 mi8
    si4 mi8\mbreak red4 mi8

    %77
    la,4.~la4 do8
    si4 mi8 sol,4 fad8
    mi4. r8 r

}

IIvlIn = \relative do'' {
    \key mi\major

    si'8\f
    sold8. la16 si8 la8. si16 sold8
    fad8. mi16 fad8 fad4 fad8
    sold8. fad16 sold8 la8. si16 sold8

    %4
    fad4.~fad4 fad8
    sold8. fad16 mi8 mi8. fad16 sold8
    dod,8. red16 dod8 fad8. sold16 la8

    %7
    red,8. dod16 si8 si'4.~
    si8. la16 sold8 sold8. la16 fad8
    mi4 si8\mbreak si'4.~\p

    %10
    si8. la16 sold8 sold8. la16 fad8
    mi4.~mi4 r8
    R2.*7

    %19
    r4. r8 r fad\f
    sold8. la16 si8 la8. si16 sold8
    fad8. mi16 fad8 fad4 fad8

    %22
    sold8. fad16 sold8 la8. si16 sold8
    fad4.~fad4 r8
    R2.*5

    %29
    red8. mi16 fad8 fad4 r8\mbreak
    R2.
    red8. mi16 fad8 fad4 r8

    %32
    R2.*5
    red8.\f mi16 fad8 fad4 r8
    R2.

    %39
    red8. \pp mi16 fad8 fad4 r8
    R2.*3
    r4. r8 r si\f

    %44
    sold8. la16 si8 la8. si16 sold8
    fad8. mi16 fad8 fad4 fad8
    sold8. fad16 sold8 la8. si16 sold8

    %47
    fad4.~fad4 fad8
    sold8. fad16 mi8 mi8. fad16 sold8
    dod,8. red16 dod8 fad8. sold16 la8

    %50
    red,8. dod16 si8 si'4.~
    si8. la16 sold8 sold8. la16 fad8
    mi4 si8\mbreak si'4.~\pp

    %53
    si8. la16 sold8 sold8. la16 fad8
    mi4.\fermata ~mi4 r8
    R2.*8

    %63
    r4. r8 r si\f\mbreak
    dod8. re16 mi8 re4 dod8
    si4 la8 re4 dod8

    %66
    si4 la8 fad'4 sold8
    la4 re,8 dod8. re16 dod8
    la4.~la4 r8

    %69
    R2.*6
    r8 r sold sold4 dod8
    sid4 dod8 sold4 dod8

    %77
    sid4 r8 r4.
    R2.
    r4. r8 r

}

IIvlIIn = \relative do'' {
    \key mi\major

    sold'8\f
    mi8. fad16 sold8 fad8. sold16 mi8
    red8. dod16 red8 red4 red8
    mi8. red16 mi8 fad8. sold16 mi8

    %4
    red4 red8 red4 red8
    mi4 si8 si4 si8
    la4 la8 dod4 dod8

    %7
    si4 si8 r r sold'
    fad4 mi8\mbreak mi8. fad16 red8
    mi4 mi8 r r sold\p

    %10
    fad4 mi8 mi8. fad16 red8
    mi4.~mi4 r8
    R2.*7

    %19
    r4. r8 r red\f
    mi8. fad16 sold8 fad8. sold16 mi8
    red8. dod16 red8 red4 red8

    %22
    mi8. red16 mi8 fad8. sold16 mi8
    red4.~red4 r8
    R2.*5

    %29
    si8. dod16 red8 red4 r8
    R2.
    si8. dod16 red8 red4 r8

    %32
    R2.*5
    si8. \f dod16 red8 red4 r8
    R2.

    %39
    si8.\pp dod16 red8 red4 r8
    R2.*3
    r4. r8 r  sold8\f

    %44
    mi8. fad16 sold8 fad8. sold16 mi8
    red8. dod16 red8 red4 red8
    mi8. red16 mi8 fad8. sold16 mi8

    %47
    red4 red8 red4 red8
    mi4 si8 si4 si8
    la4 la8 dod4 dod8

    %50
    si4 si8 r r sold'
    fad4 mi8\mbreak mi8. fad16 red8
    mi4 mi8 r r mi\pp

    %53
    fad4 mi8 mi8. fad16 red8
    mi4.~\fermata mi4 r8
    R2.*8

    %63
    r4. r8 r sold,\f
    la8. si16 dod8\mbreak re4 dod8
    si4 la8 re4 dod8

    %66
    si4 la8 fad'4 sold8
    dod,4 si8 la8. si16 sold8
    la4. la,4 r8

    %69
    R2.*6
    r8 r sold' sold4 dod8
    sid4 dod8 sold4 dod8

    %77
    sid4 r8 r4.
    R2.
    r4. r8 r

}

IIvlan = \relative do' {
    \key mi\major

    mi8\f
    si'4 mi,8 mi4 mi8
    si'4 si8 fad4 fad8
    si4 si8 si4 si8

    %4
    si4 fad8 si4 si8
    si4 sold8 mi4 mi8
    mi4 mi8 la4 la8

    %7
    fad4 fad8 r4 mi8\mbreak
    si4 si'8 si4 si8
    sold4 sold8 r4 mi8\p

    %10
    si4 si'8 si4 si8
    sold4.~sold4 r8
    R2.*7

    %19
    r4. r8 r si\f
    si4 mi,8 si'4 si8
    si4 si,8 si4 si'8

    %22
    si4 mi,8\mbreak la4 mi8
    si'4.~si4 r8
    R2.*19

    %43
    r4. r8 r mi,\f
    si'4 mi,8 mi4 mi8
    si'4 si8 fad4 fad8

    %46
    si4 si8 si4 si8
    si4 fad8 si4 si8
    si4 sold8 mi4 mi8

    %49
    mi4 mi8 la4 la8
    fad4 fad8 r4 mi8
    si4 si'8 si4 si8

    %52
    sold4 sold8 r8 r mi\pp
    si4 si'8 si4 si8
    sold4.~sold4 r8

    %55
    R2.*8
    r4. r8 r mi\f
    mi8. re16 dod8 re4 mi8\mbreak

    %65
    fad4 mi8 la4 sold8
    fad4 mi8 re4 re8
    mi4 fad8 mi4 mi8

    %68
    dod4. ~dod4 r8
    R2.*10
    r4. r8 r

}

IImdn = \relative do'' {
    \key mi\major

    <si sold mi>8\f
    <si sold mi>4 <sold mi>8 <la fad>4 <sold mi>8
    <fad red>4 <si fad red>8 <si fad red>4 <si fad red>8
    <si sold mi>4 <si sold mi>8 <la fad si,>4 <si sold mi>8

    %4
    <si fad red>4 <si fad red>8 <si fad red>4 <fad red>8
    <sold mi>4 <sold mi>8 <si mi,>4 <si mi,>8
    <dod mi,>4 <mi, dod>8 <fad dod>4 <fad dod>8

    %7
    <fad red si>4 <fad red si>8 r4 <sold mi si>8\mbreak
    <fad si,>4 <sold mi si>8 <sold mi si>4 <fad red si>8
    <sold mi si>4 <sold mi si>8 r4 <sold mi si>8

    %10
    <fad si,>4 <sold mi si>8 <sold mi si>4 <fad red si>8
    <sold mi si>4.~<sold mi si>4 r8
    <sold mi si>4 <sold mi si>8 <fad dod>4 <fad dod>8

    %13
    <fad red si>4 <fad red si>8 < fad red si>4 <si fad red>8
    <sold mi>4. <la fad>4 <sold mi>8\mbreak
    <fad red>4 <si fad red>8 <si fad red>4 <fad red si>8

    %16
    <sold mi si>4 <sold mi si>8 <sold mi dod>4 <sold mi dod >8
    <lad fad mi>4 <lad fad mi>8 <dod fad, mi>4 <dod fad, mi>8
    <si fad red>4 <si sold mi>8 <lad fad dod>4 <lad fad dod>8

    %19
    <si fad red>4 <fad red si>8 <fad red si>4 <fad red>8\f
    <sold mi>4 <sold mi>8 <la fad>4 <sold mi>8
    <fad red>4 <fad red si>8 <fad red si>4 <fad red>8\mbreak

    %22
    <sold mi>4 <sold mi>8 <la fad>4 <sold mi>8
    <fad red>4 <si fad red>8 <si fad red>4 <fad red si>8\p
    <si mi, si>4 <mi, si>8 <mi si>4 <si' mi,>8

    %25
    <dod mi,>4 <mi, dod la>8 <mi dod la>4 <la mi dod>8
    <dod fad, dod>4 <fad, dod>8 <fad dod>4 <dod' fad,>8
    <si fad red>4 <lad mi>8 <<si4.\\{fad8. mi16 red8}>>

    %28
    <sold mi si>4 <fad red si>8 <sold mi si>4 <sold mi si>8\mbreak
    <fad red si>4. <si fad red>4 <fad red si>8
    <sold mi si>4 <fad red si>8 <sold mi si>4 <sold mi si>8

    %31
    <fad red si>4. <si fad red>4  <si mi, si>8
    <la mi dod>4 <la fad dod>8 <si fad si,>4 <fad red si>8
    <sold mi si>4. <si mi, si>4 <la mi dod>8

    %34
    <<{si8. la16 sold8}\\{<mi si>4 <mi si>8}>> <sold mi>4 <fad red>8
    <<{sold4 la8 si8. la16 sold8}\\{<mi si>4. <mi si>}>>\mbreak
    <fad red si>4\f <fad red si>8 <sold mi si>4 <sold mi si>8

    %37
    <fad red si>4. <si fad red>4 <sold mi si>8\pp
    <fad red si>4 <fad red si>8 <sold mi si>4 <sold mi si>8
    <fad red si>4. <si fad red>4 <si mi, si>8

    %40
    <la mi dod>4 <la mi dod>8 <la fad dod>4 <fad red si>8
    <sold mi si>4. <si mi, si>4 <la mi dod>8
    <<{si8. la16 sold8}\\<mi si>4.>> <sold mi si>4 <fad red si la>8\mbreak

    %43
    <mi si sold>4. r4 <si' sold mi>8\f
    <si sold mi>4 <sold mi>8 <la fad>4 <sold mi>8
    <fad red>4 <si fad red>8 <si fad red>4 <si fad red>8

    %46
    <si sold mi>4 <si sold mi>8 <si sold mi>4 <si sold mi>8
    <si fad red>4 <si fad red>8 <si fad red>4 <fad red>8
    <sold mi>4 <sold mi>8 <si mi,>4 <si mi,>8

    %49
    <dod mi,>4 <mi, dod>8 <fad dod>4 <fad dod>8\mbreak
    <fad red si>4 <fad red si>8 r4 <sold mi si>8
    <fad si,>4 <sold mi si>8 <sold mi si>4 <fad red si>8

    %52
    <sold mi si>4 <sold mi si>8 r4 <sold mi si>8\pp
    <fad si,>4 <sold mi si>8 <sold mi si>4 <fad red si>8
    <sold mi si>4.~<sold mi si>4 <sold mi si>8\p

    %55
    <si sold mi>4 <sold mi si>8 <la mi la,>4 <mi dod la>8
    <<{sold4 la8 si4 la8}\\{<mi si>4. <mi si>4 <mi dod>8}>>
    <la re, la>4 <la mi dod>8 <sold mi si>4 <la mi la,>8\mbreak

    %58
    <la re, la>4 <la mi dod>8 <sold mi si>4 <la mi la,>8
    <sold mi red>4 <la mi dod>8 <sold mi si>4 <la mi dod>8
    <si mi, si>4 <sold mi>8 <mi si sold>4 <si' sold mi>8

    %61
    <do la fad>4 <si sold>8 <<{r  <do la fad red>8 <si sold mi>}\\{\giu\stemUp <do, la fad>4 <si sold>8}>>
    <do' la fad>4 <si sold>8 <<{r  <do la fad red>8 <si sold mi>}\\{\giu\stemUp <do, la fad>4 <si sold>8}>>
    \su\stemNeutral <la' mi do>4 <la fa si,>8 <sold mi si>4.

    %64
    <la mi dod>4. <re, la>4 <dod sold>8
    <si fad>4 <la mi>8 <re la>4 <dod sold>8
    <si fad>4 <la mi>8 <fad' re la>4 <sold mi re>8

    %67
    <la mi dod>4 <si fad si,>8 <la mi dod>4 <sold mi re>8
    <<{<la mi>4. ~la4 la8}\\{dod,4 re8 mi8. re16 dod8}>>
    <la' fad dod>4 r8 <<{si8. la16 sold8}\\{<fad re>4 <fad si,>8}>>

    %70
    <sold mid dod>4. <<{fad8. sold16 <la fad>8}\\{dod,4 dod8}>>
    <si' fad si,>4 <la fad dod>8 <sold mid dod>4 <fad dod>8
    <si fad si,>4 <la fad dod>8 <sold mid dod>4 <fad dod>8\mbreak

    %73
    <si mid, dod>4 <la fad dod>8 <fad dod la>4 <sold mid dod>8
    <<
        {
            la4 si8 dod8. si16 la8
            sold8. fad16 mi8
        }\\{
            <fad dod>4. <fad dod>4 <fad dod>8
            dod4.
        }
    >> <red sid>4 <mi dod>8

    %76
    <fad red>4 <mi dod>8 <red sid>4 <mi dod>8
    <fad red>4 <fad sid, sold>8 <sold fad red>4 <la fad red>8
    <sold mi>4 <dod, sold>8 <mi dod sold>4 <red sid sold fad>8

    %79
    dod4.~dod4

}

IIbcn = \relative do {
    \key mi\major

    mi8
    mi4 mi8 la,4 la8
    si4 si8 si4 si8
    si4 si8 si4 si8

    %4
    si4 si8 si4 si8
    mi4 mi8 sold4 sold8
    la4 la8 la,4 la8

    %7
    si4 si8 r r mi
    red4 mi8 si4 si8\mbreak
    mi4 mi8 r r mi^\p

    %10
    red4 mi8 si'4 si,8
    mi4 si8 mi,4.
    mi'4^\p mi8 la,4 la8

    %13
    si4 si8 si4 si8
    si'4 si8 si4 si8
    si,4 si8 si4 si8

    %16
    mi4 mi8 dod4 dod8
    dod'4 dod8 lad4 lad8\mbreak
    si4 mi,8 fad4 fad8

    %19
    si,4 si8 si4 si8
    si'4 si8 si4 si8
    si,4 si8 si4 si8

    %22
    si'4 si8 si4 si8
    si,4 si8 si4 si8
    sold4 sold8 sold4 sold8

    %25
    la4 la8 la4 la8
    la'4 la8 la4 la8\mbreak
    si,4 dod8 red8. dod16 si8

    %28
    mi4 si8 si4 si8
    si4 si8 si4 si8
    si4 si8 si4 si8

    %31
    si4 si8 si4 sold'8
    la4 fad8 red4 si8
    mi4 fad8 sold4 la8

    %34
    sold8. fad16 mi8 si'4 si,8
    mi4 fad8\mbreak sold8. fad16 mi8
    si4 si8 si4 si8

    %37
    si4 si8 si4 si8
    si4 si8 si4 si8
    si4 si8 si4 sold'8

    %40
    la4 sold8 fad4 red8
    mi4 fad8 sold4 la8
    sold8. fad16 mi8 si4.

    %43
    mi, r8 r mi'\mbreak
    mi4 mi8 la,4 la8
    si4 si8 si4 si8

    %46
    si'4 si8 si4 si8
    si,4 si8 si4 si8
    mi4 mi8 sold,4 sold8

    %49
    la4 la8 la4 la8
    si4 si8 r r mi
    red4 mi8 si4 si8

    %52
    mi4 mi,8\mbreak r r mi'
    red4 mi8 si'4 si,8
    mi,4.\fermata ~mi4 mi8

    %55
    mi'4 re8 dod4 la8
    mi'4 fad8 sold4 la8
    fad4 mi8 re4 dod8

    %58
    fad4 mi8 re4 dod8
    si4 la8 mi'4 la8
    sold8. la16 si8 mi,4 mi8\mbreak

    %61
    red!4 mi8 red4 mi8
    red4 mi8 red4 mi8
    la4 re,8 mi4 mi,8

    %64
    la4 la8 fad'4 mi8
    re4 dod8 fad4 mi8
    re4 dod8 re8. dod16 si8

    %67
    dod4 re8 mi4 mi,8
    la4 si8 dod8. si16 la8^\p\mbreak
    fad'4 r8 si,8. dod16 re8

    %70
    dod4 si8 la8. sold16 fad8
    re'4 dod8 si4 la8
    re4 dod8 si4 la8

    %73
    sold4 fad8 dod'4 dod8
    fad4 sold8 la8. sold16 fad8
    mi8. red16 dod8 sold4 sold8

    %76
    sold4 sold8 sold4 sold8\mbreak
    sold4 red'8 sid4.
    dod8. red16 mi8 sold,4.

    %79
    dod~ dod4

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 6/8
    \tempo 2. = 37
    \partial 8 s8
    s2.*53
    s8 \mark\markup "Fine"s4  s4 \bar "||"\break s8
    s2.*24
    s4. s4\mark\markup \italic\smaller\center-column {  "Da Capo""al Fine"}
    \bar"|"

}


IIob = {
    \Iglobal
    <<\IIobn \forma>>

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

IImd = {
    \IIglobal
    \context Staff = up <<\IImdn \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    \context Staff = down <<\IIbcn \forma\IIbfn>>

}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##t
    \terzinequarto \con
}




IIIobn = \transpose sol mi

\relative do'' {
    \key do\major

    mi8\f sol4 fa8
    mi sol4 fa8
    mi fa mi4

    %4
    re r8 re
    mi mi4 re16 do
    re8 re4 do16 si

    %7
    do8 do4 si16 (la)
    si sol si re sol re sol re
    si sol si sol sol' re sol re\mbreak

    %10
    si sol si sol sol'8 do,
    si4 la
    sol r

    %13
    mi'8\p sol4 fa8
    mi8 sol4 fa8
    mi fa mi4

    %16
    re r
    mi8 sol4 fa8
    mi8 sol4 fa8

    %19
    mi fa mi4
    re r\mbreak
    mi8 mi4 re16 do

    %22
    re8 re4 do16 si
    do8 do4 si16 la
    si8 re~re16 do re do

    %25
    si8 re~re16 do re do
    si8 re~re16 mi fad sol
    si,8 re~re16 mi fad sol

    %28
    si,8 re16 do re8 sol
    si,4 la\mbreak
    sol4 r

    %31
    R2*4
    mi'8\p sol4 fa16 mi
    re8 fa4 mi16 re

    %37
    do8 mi4 re16 do
    si8 la16 si sol4
    la8 do4 si8

    %40
    do mi4 re8
    mi sol4 fa8
    mi16 fa sol4 fa8

    %43
    mi do'4 si8\mbreak
    la sol4 fa16 mi
    fa8 mi4 re8

    %46
    mi4 r
    mi8 sol4 sol,8
    la16 do si do re mi fa la,

    %49
    si re do re mi fa sol si,
    do mi re mi fa sol la do,
    re sol fa mi re sol fa mi

    %52
    re sol fa mi re sol fa mi\mbreak
    re sol fa mi re do si la
    sol8 la16 si do8 fa

    %55
    mi4 re
    do r
    mi8 fa4 mi16 re

    %58
    mi8 fa4 mi16 re
    mi8 fa4 mi16 re
    mi8 sol16 fa mi8 re

    %61
    mi sol16 fa mi8 re
    mi sol16 fa mi re do si
    la8 la'16 sol\mbreak fa mi re do

    %64
    si8 la16 sol sol'8 fa
    mi4 re
    do r

    %67
    R2*9
    r4_\fermata r8 do\p
    fa4 sol

    %78
    mi8 re16 mi do8 fa
    mi4 r8 mi
    fa4 sol

    %81
    la8[dod, re mi]
    dod4 r\mbreak
    re8.[mi16 fa8. sol16]

    %84
    fa8.[sol16 la8. si16]
    la8.[dod,16 re8. mi16]
    dod4 r

    %87
    mi8 sol4 fa8
    mi8 sol4 fa8
    mi fa16 sol la8 re,

    %90
    dod si16 dod la4
    fa'8 mi4 fa16 sol
    fa la sol la fa mi re do\mbreak

    %93
    si sol' fa sol mi re dod si
    la dod si dod dod mi re mi
    mi4~mi16 fa sol mi

    %96
    la8[dod, re sol]
    fa4 mi
    re r

    %99
    fa8 fa4 mi16 re
    mi8 mi4 re16 do
    re8 re4 do16 si

    %102
    do8 si16 do la4\mbreak
    si8 mi4 si8
    do16 si la do si mi re mi

    %105
    do si la do si mi re mi
    do si la si do re mi fa
    mi2~

    %108
    mi~
    mi8 fad16 sold la8 re,
    do4 si

    %111
    la2

}

IIIvlIn = \relative do'' {
    \key la\major

    dod8\f mi4 re8
    dod mi4 re8
    dod re dod4

    %4
    si r8 si
    dod dod4 si16 la
    si8  si4 la16 sold

    %7
    la8 la4 sold16 (fad)
    sold mi sold si mi si mi si
    sold mi sold mi mi' si mi si\mbreak

    %10
    sold mi sold mi mi'8 la,
    sold4 fad
    mi r

    %13
    la8\p dod4 si8
    la dod4 si8
    la si la4

    %16
    sold8 sold16 la si8 sold
    la dod4 si8
    la dod4 si8

    %19
    la si la4
    sold8 sold16 la si8 sold
    la[la, la fad']\mbreak

    %22
    sold[si, si mi]
    fad[si, si red]
    mi [sold si, si]

    %25
    mi [sold si, si]
    mi[sold sold fad]
    mi[sold sold fad]

    %28
    mi[fad sold mi]
    si4 si
    mi r8 si'\f

    %31
    dod8 mi~mi16 re dod si
    dod8 mi~mi16 re dod si
    dod8 re dod4 \mbreak

    %34
    si r
    la8\p[dod mi, mi]
    sold[si mi, mi]

    %37
    fad[mi red si]
    mi4 r8 dod
    re[re mi mi]

    %40
    fad[la mi mi]
    la[dod dod si]
    la16 si dod4 si8

    %43
    la fad'4 mi8
    re dod4 si16 la
    si8 la4 sold8\mbreak

    %46
    la si16 la sold8 si
    dod4 mi,
    fad4 r8 fad

    %49
    sold4 r8 sold
    la4 r8 la
    si4 r8 si

    %52
    si4 r8 dod
    si4 r
    sold la~

    %55
    la sold
    la8 mi'16 re dod8 si
    la[si mi, mi]

    %58
    la[si mi, mi]
    la[si mi, mi]
    la dod16 si la8 mi

    %61
    la8 dod16 si la8 mi
    la dod16 si la sold fad mi
    re8 re'16 dod si la sold fad

    %64
    mi8[re dod re]
    mi4 mi
    la, r

    %67
    mi''8\f fad4 mi16(re)\mbreak
    mi8 fad4 mi16(re)
    mi la mi la dod, mi dod mi

    %70
    la,8 mi'4 re16(dod)
    si(sold) si(sold) mi'(si) mi(si)
    sold(mi) sold(mi) mi'(si) mi(si)

    %73
    sold8 fad16 mi re'8 re
    re dod16 si dod8 la'
    dod,4 si

    %76
    la\fermata r
    fad\p sol
    la8[sol fad re]\mbreak

    %79
    la'[la, la' sol]
    fad[re dod la]
    re[dod re mi]

    %82
    fad dod'16 si lad8 fad'
    si,4 dod
    re mi

    %85
    fad8[lad, si dod]
    lad dod16 si dod8 re
    fad,[dod' lad si]

    %88
    fad[dod' lad si]
    fad[mi re mi]
    fad[sold lad fad]\mbreak

    %91
    si[fad lad fad]
    re'4 r8 fad,
    sold4 r8 si

    %94
    lad4 r8 si
    lad dod16 si lad8 sold
    fad lad si4~

    %97
    si lad
    si8 fad'16 mi re8 dod
    si4 mi,

    %100
    dod re
    sold8 mid dod4
    fad8[sold la fad]\mbreak

    %103
    sold mid16 fad sold8 mid
    la r sold r
    la r sold r

    %106
    la4 r
    r8 la16 (si) dod(re) dod(re)
    dod(re) dod(re) dod(re) dod(re)

    %109
    dod4 r8 fad,
    fad4 mid
    fad2

}

IIIvlIIn = \relative do'' {
    \key la\major

    la8\f dod4 si8
    la8 dod4 si8
    la8 si la4

    %4
    sold r8 sold
    la la4 sold16 fad
    sold8 sold4 fad16 mi

    %7
    fad8 fad4 mi16(red)
    mi8[mi sold sold]
    mi[mi sold sold]

    %10
    mi[mi mi mi]\mbreak
    mi4 red
    mi r

    %13
    la8\p[dod mi, mi]
    la[dod mi, mi]
    la[sold la la,]

    %16
    mi' mi16 fad sold8 mi
    la[dod mi, mi]
    la[dod mi, mi]

    %19
    la[sold la la,]
    mi' mi16 fad sold8 mi
    la[[la, la la']

    %22
    sold[mi mi mi]
    mi[si si red]\mbreak
    mi [sold si, si]

    %25
    mi [sold si, si]
    mi[sold sold fad]
    mi[sold sold fad]

    %28
    mi[fad sold \parenthesize mi]
    si4 si
    mi r8 sold\f

    %31
    la8 dod~dod16 si la sold
    la8 dod~dod16 si la sold
    la8 si la4

    %34
    sold r
    la8\p[dod mi, mi]
    sold[si mi, mi]

    %37
    fad[mi red si]
    mi4 r8 dod
    re[re mi mi]

    %40
    fad[la mi mi]
    R2*2
    la4 r

    %44
    R2
    re,4 la
    mi'8 sold16 fad mi8 sold

    %47
    la4 mi
    fad r8 re
    mi4 r8 mi

    %50
    fad4 r8 fad
    sold4 r8 sold
    la4 r8 la\mbreak

    %53
    mi4 r
    mi8[re dod re]
    mi4 mi

    %56
    la8 dod16 si la8 mi
    la r r4
    R2*8

    %66
    dod,4 r
    dod'8\f re4 dod16 si
    dod8 re4 dod16 si

    %69
    dod mi dod mi la, dod la dod
    mi,8 dod'4 si16 la
    sold8[sold si si]

    %72
    mi,[mi sold sold]\mbreak
    mi4 r8 sold
    si4 la8 la

    %75
    la4 sold
    la\fermata r
    fad\p sol

    %78
    la8[sol fad re]
    la'[la, la' sol]
    fad[re dod la]
    re[dod re mi]

    %82
    fad dod'16 si lad8 fad
    re'[si lad fad]
    si[si, dod dod']\mbreak

    %85
    re[fad, sol mi]
    fad lad16 sold lad8 si
    fad[dod' lad si]

    %88
    fad[dod' lad si]
    fad[mi re mi]
    fad[sold lad fad]\mbreak

    %91
    si[fad lad fad]
    si4 r8 re,
    mi4 r8 mi

    %94
    fad4 r8 re
    fad lad16 sold fad8 mi
    re[dod re mi]\mbreak

    %97
    fad4 fad
    si8 re16 dod si8 fad
    si,4 mi

    %100
    la, re
    sold8 mid dod4
    fad8[sold la fad]

    %103
    mid dod16 red mid8 dod
    fad r mid r
    fad r dod r

    %106
    fad r r4
    r8 fad16(sold) la(si) la(si)\mbreak
    la(si) la(si) la(si) la(si)

    %109
    la4 r8 fad
    fad4 mid
    fad2

}

IIIvlan = \relative do' {
    \key la\major

    mi4\f la8 sold
    la4 mi8 sold
    la mi mi4

    %4
    mi8 si'16 la sold8 mi
    mi[dod dod mi]
    mi[si si mi]

    %7
    dod16 dod red mi red8 si
    si[si si si]
    si[si si si]

    %10
    si[si si si]\mbreak
    si4 si
    si r

    %13
    la'8\p[dod mi, mi]
    la[dod mi, mi]
    la[sold la la,]

    %16
    mi' mi16 fad sold8 mi
    la[dod mi, mi]
    la[dod mi, mi]

    %19
    la[sold la la,]
    mi' mi16 fad sold8 mi
    la[la, la fad']

    %22
    sold[mi mi mi]\mbreak
    mi[si si red]
    mi[sold si, si]

    %25
    mi[sold si, si]
    mi[sold sold fad]
    mi[sold sold fad]

    %28
    mi[fad sold mi]
    si4 si
    mi r8 mi\f

    %31
    mi[mi la mi]
    mi[mi la mi]
    mi mi mi4

    %34
    mi r
    la8\p[dod mi, mi]\mbreak
    sold[si mi, mi]

    %37
    fad[mi red si]
    mi4 r8 dod
    re[re mi mi]

    %40
    fad[la mi mi]
    R2*2
    la4 r

    %44
    R2
    re,4 la
    mi'8 sold16 fad mi8 sold

    %47
    la4 dod,
    re4 r8 re
    mi4 r8 mi

    %50
    fad4 r8 fad
    sold4 r8 \parenthesize sold
    mi4 r8 la

    %53
    mi4 r
    mi8 [re dod re]
    mi4 mi

    %56
    la r
    R2*9
    la,4 r

    %67
    la'8\f[la fad la]
    la[la fad la]
    la[la mi mi]

    %70
    mi[mi la si]
    mi,[mi sold sold]
    si[si, si si]\mbreak

    %73
    si4 r8 si
    sold[mi' mi fad]
    mi4 mi

    %76
    dod\fermata r
    fad\p sol
    la8[sol fad re]

    %79
    la'[la, la' sol]
    fad[re dod la]
    re[dod re mi]

    %82
    fad dod'16 si lad8 fad
    re'[si lad fad]
    si[si, dod dod']

    %85
    re[fad, sol mi]\mbreak
    fad lad16 sold lad8 si
    fad[dod' lad si]

    %88
    fad[dod' lad si]
    fad[mi re mi]
    fad[sold lad fad]

    %91
    si[fad lad fad]
    si4 r8 re,
    mi4 r8 mi

    %94
    fad4 r8 re
    fad lad16 sold fad8 mi
    re[dod re mi]

    %97
    fad4 fad\mbreak
    si8 re16 dod si8 fad
    si,4 mi

    %100
    la, re
    sold8 mid dod4
    fad8[sold la fad]

    %103
    mid dod16 red mid8 dod
    fad r mid r
    fad r dod r

    %106
    fad r r4
    R2*2
    la4 r8 fad

    %110
    fad4 mid
    fad2

}

IIImdn = \relative do'' {
    \key la\major

    <la mi dod>4 mi8 <sold mi re>
    <la mi dod>4 mi8 <sold mi re>
    <la mi dod> <si mi, si> <la mi dod>4

    %4
    <sold mi si> <si sold mi>
    <la mi dod>2
    <sold mi si>

    %7
    <fad mi dod>4 <fad red>
    <sold mi si>2\mbreak
    <si sold mi>

    %10
    <mi si sold>4 <si mi,>8 <la fad dod>
    <sold mi si>4 <fad red si la>
    <mi si sold> r

    %13
    R2*17
    r4 r8 <sold mi si>8
    <la mi dod>[mi fad sold]

    %32
    <la dod,>[mi fad sold]\mbreak
    <la dod,> <mi si> <la dod,>4
    <sold mi si> r

    %35
    R2*32
    <mi dod>8 <fad re>4 la8
    <mi dod> <fad re>4 la8

    %69
    <mi dod>4 <la mi dod>
    <mi la,> <la mi la,>
    <sold mi si>2

    %72
    <si sold mi>\mbreak
    <sold mi si>4 r8 <si fad re>
    <<{<sold mi>8 si}\\re,4>> <la' mi dod>8 <la fad re>

    %75
    <dod la mi>4 <si sold mi re>
    <la mi dod>\fermata r
    R2*35

}

IIIbcn = \relative do {
    \key la\major

    la'4^\f dod,8 mi
    la4 dod,8 mi
    la[sold la la,]

    %4
    mi' sold16 fad mi8 mi,
    la' [la, la' la,]
    mi'[mi, mi' mi,]

    %7
    la'[fad si si,]
    mi[mi, mi' mi,]
    mi'[mi, mi mi']

    %10
    mi[si' sold la]\mbreak
    si4 si,
    mi8 si mi,4

    %13
    R2*17
    r4 r8 mi'^\f
    la[dod, re mi]

    %32
    la[dod, re mi]
    la[sold la la,]
    mi' si mi,4

    %35
    R2*32
    la'8^\f[la, la' la,]\mbreak
    la'[la, la la]

    %69
    la'[la, la' la,]
    dod[dod dod, dod]
    mi'[mi mi, mi]

    %72
    mi'[mi, mi mi]
    mi'4 r8 si'
    mi,[sold la re,]

    %75
    mi4 mi,
    la r
    R2*35

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/4
    \tempo 2 = 60
    s2*75
    s8 \mark\markup "Fine" s s4 \bar "||"\break
    s2*35
    \bar"|"
    \mark\markup \italic\smaller\center-column {  "Da Capo""al Fine"}

}


IIIob = {
    \Iglobal
    <<\IIIobn \forma>>

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

IIImd = {
    \IIIglobal
    \context Staff = up <<\IIImdn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    \context Staff = down <<\IIIbcn \forma\IIIbfn>>

}

#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Concerto per Oboe d'amore in La maggiore}
    composer = \markup \center-column{"A. Lotti (1667 - 1740)"}

}

\markup\huge {[1.] Allegro}

\score {

    \new ChoirStaff\with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    }  <<

        \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"Oboe"}
            \set Staff.shortInstrumentName = "ob"
            \Iob
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IvlI
        >>


        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \Ivla
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
        } <<
            \set PianoStaff.instrumentName =  \markup {\center-column{"Cembalo""(Basso)"}}
            \new Staff = "up"
            <<
                \set Staff.midiInstrument = #"harpsichord"
                \Imd
            >>

            \new Staff = "down"
            <<
                \set Staff.midiInstrument = #"cello"
                \Ibc
            >>
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.common-shortest-duration =
            #(ly:make-moment 1/16)
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

\markup\huge {[2.] Affettuoso}

\score {

    \new ChoirStaff\with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    }  <<

        \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"Oboe"}
            \set Staff.shortInstrumentName = "ob"
            \IIob
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IIvlI
        >>


        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IIvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIvla
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
        } <<
            \set PianoStaff.instrumentName =  \markup {\center-column{"Cembalo""(Basso)"}}
            \new Staff = "up"
            <<
                \set Staff.midiInstrument = #"harpsichord"
                \IImd
            >>

            \new Staff = "down"
            <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.common-shortest-duration =
            #(ly:make-moment 1/16)
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

\markup\huge {[3.] Allegro}

\score {

    \new ChoirStaff\with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    }  <<

        \new Staff <<
            \set Staff.midiInstrument = #"oboe"
            \set Staff.instrumentName = \markup \center-column{"Oboe"}
            \set Staff.shortInstrumentName = "ob"
            \IIIob
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IIIvlI
        >>


        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IIIvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIIvla
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
        } <<
            \set PianoStaff.instrumentName =  \markup {\center-column{"Cembalo""(Basso)"}}
            \new Staff = "up"
            <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIImd
            >>

            \new Staff = "down"
            <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.common-shortest-duration =
            #(ly:make-moment 1/16)
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