\language "italiano"
	%********************************** VARIABILI

\version "2.20.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

ten = ^\markup \italic \center-align "ten"

tr = \trill

soli = ^\markup \italic { soli }

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

ds = \markup \italic \small \center-column{"Da""Capo"}

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
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16,
2.19.22, 2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46,
2.19.49, 2.19.80, 2.20.0
%}

mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \con\terzine
}

Ifln = \relative do'' {

    dod'16 la
    si8 mi, mi fad16 sold la8 la, r si16 dod
    \tuplet 3/2 { re(mi, re') re[(si re)]  dod(mi, dod')  dod[(la dod)]} dod8\tr si r dod16 re
    mi8 la, la\noBeam sol'32(fad mi16) fad32[(mi re16)] la'8\noBeam\staccatissimo\mbreak fad\staccatissimo re32[(dod si16)]

    %4
    mi32(re dod16) la'8\staccatissimo\noBeam mi\staccatissimo\noBeam dod32(si la16) re[re8 re16]~\tuplet 3/2 { re(si dod) re[(mi dod)]}
    re[re8 re16]~\tuplet 3/2 { re(si dod) re[(dod si)] dod[((si la)} mi' la,] si4\tr
    la r r2

    %7
    r4 fad8 sold16 la si8 la16 sold la8. si16
    sold8 sold'32[(fad mi16)] si'8\staccatissimo \once\stemUp sold,\staccatissimo la\noBeam dod32(si la16) mi'8\staccatissimo dod\staccatissimo
    r8 si32(la sold16) mi'8\staccatissimo si\staccatissimo r dod\staccatissimo fad,\staccatissimo mi'\staccatissimo

    %10
    red\staccatissimo fad\staccatissimo red\staccatissimo si\staccatissimo r2
    r8 si'\staccatissimo sold\staccatissimo\noBeam mi32(red dod16) fad32[(mi red16)]  si'8\staccatissimo fad\staccatissimo\noBeam  red32(dod si16)
    mi32(red dod16) la'[dod,] red8.\tr mi16 mi8 sold,16 fad mi4

    %13
    r8 mi'16 re? dod4 r8 fad16 mi re8 lad
    si16 fad lad fad si fad lad  fad\mbreak r8 re'16 dod si4
    r2 r16 mi(re dod) la'\staccatissimo dod,(si la)

    %16
    sold\staccatissimo sold(fad mi) la'\staccatissimo dod,(si la) sold mi si' mi, la mi sold mi
    la fad sold mi' mi,4\tr r r8 fad'16 mi\mbreak
    \tuplet 3/2 { re16(fad mi) } fad8\staccatissimo\noBeam mi\staccatissimo \tuplet 3/2 { mi16[(re dod)] re (fad mi) } fad8\staccatissimo\noBeam mi\staccatissimo \tuplet 3/2 { re16[(dod si)]

    %19
    dod (mi re)} mi8\staccatissimo\noBeam re\staccatissimo \tuplet 3/2 { re16[(dod si)] dod(mi re) dod[(si dod)] red(fad mi) fad[(mi red)]
    mi(fad red) } mi8\noBeam r4\mbreak r2
    r4 r8 dod'16 la re8 re, re mi16 fad

    %22
    \tuplet 3/2 { sol16[(fad sol)]  la,(sol' fad) sol[(fad sol)] la,(la' sol) fad[(mi fad)] } re8 r mi
    fad16 fad8 fad16~\tuplet 3/2 { fad[(re mi)] fad[(si si,)] } mi mi8 mi16~\mbreak \tuplet 3/2 { mi(dod re) mi[(la la,)]
    re(dod re)} fad8\staccatissimo\noBeam re\staccatissimo \tuplet 3/2 { si16[(re dod)] re(dod re) } si'8\staccatissimo\noBeam  sold! \tuplet 3/2 { si,16[(mi re)]

    %25
    dod[(si la)} la' la,] \once\stemUp mi8\once\stemDown sold'\tr la[\once\stemUp la,_\fermata] r mi16 la
    sold mi8 sold16 fad red8 fad16\mbreak mi\staccatissimo sold(si mi) fad,\staccatissimo fad(mi red)
    mi(red) mi8 r16 mi' re! dod fad fad sol la r fad mi re

    %28
    sold !sold la si r sold fad mi la la si dod r la sold fad
    si si dod re\mbreak mi,4 r2
    r16 la si dod fad, fad sold la sold sold la si mi, mi fad sol

    %31
    fad fad sold! la re, re dod si mid\staccatissimo mid8(la16) sold\staccatissimo sold8(fad16)
    mid4\tr r r2
    r r4 r8

}

Ivocen = \relative do'' {

    \autoBeamOff

    r8
    R1*5
    r4 r8 dod16 la si8 mi, mi fad16 [sold]
    la [sold] la8 r si16 dod re8 dod16[si] dod8. re16

    %8
    si4\tr r8 si\mbreak dod32[si la16] mi'8\staccatissimo dod\staccatissimo la32[sold fad16]
    si32[la sold16] mi'8\staccatissimo si8\staccatissimo sold32[fad mi16] la[la8 la16]~ \tuplet 3/2 { la[fad sold] la[si sold]  }
    la[la8 la16]~ \tuplet 3/2 { la[fad sold] la[sold fad]  }  sold32[fad mi16 si' dod] red,4\tr

    %11
    mi4\staccatissimo r\mbreak r2
    r r4 r8 si'16 la
    sold4 r8 dod16 si la8 lad si dod

    %14
    re dod16 mi re8 dod re16[dod] si8 r mi,16 re'\mbreak
    dod8 si16[la] sold8.\tr la16 la4 dod16[la sold] la\staccatissimo
    si4 dod16[la sold] la si8 re dod si

    %17
    dod16[la] si8 r4 r8 la16 sold\mbreak fad8 lad
    \tuplet 3/2 { si16[re dod] } re8\staccatissimo dod\staccatissimo \tuplet 3/2 { dod16[si lad] si[re dod] } re8\staccatissimo  dod\staccatissimo  \tuplet 3/2 { si16[la? sold]
        la[dod si]} dod8\staccatissimo si\staccatissimo \tuplet 3/2 { si16[la sold] la[dod si] la[sold la] fad[la sold] la[sold fad]

    %20
    sold[la fad]} mi8 r re' dod32[si la16 mi' la,] si4\tr
    la r r2
    R1*3\mbreak

    %25
    r2 r4\fermata r8 dod16 la
    si sold8[si16] la fad8[la16] sold  mi[sold si] la la[sold fad]
    sold[fad] mi8 la la\mbreak la16 fad[mi re] si'8 si

    %28
    si16 sold[fad mi] dod'8 dod dod16 la[sold fad] re'8 re
    re16 re[dod si] r si[dod] re dod8 fad, sold mid
    fad4\mbreak si8 si si la16[sold] la8 la

    %31
    la sold16 [fad] sold8 sold sold16 sold8[fad16] si si8[la16]
    sold4 r16 si[la] sold dod8 si4(la16[sold])\mbreak
    la8.[si16] sold4 fad4.

}

Itesto = \lyricmode {

    Fraget _ nicht, vergnügte _ _ freunde, _ was mich stets so fröhlich _ macht, so

    fröh - - - - - - - - - - - - lich macht; fraget _ nicht, fraget _ nicht, vergnügte _ _ freunde,  _ vergnügte _ _  freunde, _

    was mich stets so  fröhlich _ macht, fra -- get nicht, fra -- get  nicht, vergnügte _ _ freunde, _

    was mich stets so fröh - - - - - - - - - - - - - - - - lich,  so fröh -- lich macht.

    Seht! ich brauche, _ was ich habe, _ samt der gabe, _ nicht, mit eitlem _ unter - fangen, _

    grössre _ dinge  _ zu ver -- langen, _ als mein glück mir zuge - dacht,

     grössre _ dinge _ zu ver -- langen, _ als mein glück mir zuge - dacht, als mein glück mir zu -- gedacht. _

}


Ibcn = \relative do {

    la'8
    sold sold sold sold fad fad fad fad
    sold sold la la mi mi mi re
    dod dod dod dod re re re re

    %4
    dod dod dod dod si re fad[si]
    sold si sold mi la dod, re mi\mbreak
    la,4 r8 la' sold sold sold[sold]

    %7
    fad[mi] re dod si [mi] la la,
    mi' mi sold[mi]\mbreak la, la la la
    sold sold sold sold fad fad fad fad

    %10
    si si si red mi sold16 la si8 si,
    mi  mi mi mi\mbreak red red red red
    dod dod'16 la si8 si, mi4 r8 sold16 fad

    %13
    mi4 r8 la16 sold fad4 r8 fad
    si, fad' si,[fad'] si, si'16 la sold8 sold,\mbreak
    la re mi[re] dod la r4

    %16
    mi'8 mi, r4 mi' la,8 mi'
    la, mi' r8 mi16 re dod8[la]\mbreak re[dod]
    si si' r fad si, si' r mi,

    %19
    la, la' r mi la, la si[si]\mbreak
    mi,4 r8 sold' la dod, re[mi]
    la,4 r8 sol' fad fad fad fad

    %22
    dod dod dod dod re re, fad la
    re re re re dod dod dod dod
    si si si' si sold sold mi mi\mbreak

    %25
    la[dod,16 re mi8 mi,] la4_\fermata r8 la
    mi mi' la,[si] mi, mi' la,[si]
    mi8. re16 dod dod si la\mbreak re re mi fad re re dod si

    %28
    mi mi fad sold mi mi re dod fad fad sold la fad fad mi re
    sold sold la si sold sold fad mi la8 la, si[dod]
    fad,16 fad' sold la\mbreak red, red dod si mi mi fad sold dod, dod si la

    %31
    re re mi fad si, si la sold dod8 dod dod[dod]
    dod4 r16 re dod si la la' sold fad sold, sold' fad mid\mbreak
    fad,8 si dod[dod,] fad4.

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    <6>1
    <5>2 <6 4>8 <5 3> s4
    <6>1
    <6>2 s4 <6  4>
    <5>2 s8 <6> <6 5>4
    s2 <6>\bassFigureExtendersOn
    <_>8 <_>\bassFigureExtendersOff <6> <6> <7> <7> s4
    s <6> s s8 <6>
    <7> <6> s4 <7>2
    <_+>4 s8 <5> s4 <_+>
    s4 s8 <6>  <7> <6> s4
    s8 <6> <_+>4 s s8 <6>16 <6\\>
    s4 s8 s16 <6\\> s4 s8 <_+>
    s <_+> s <_+> s4 <6>
    s2 <6>
    s1
    s2 <6>4 s8 <6>
    s4 s8 <_+> s2
    s2 s4 <_+>
    s4 s8 <5> s <6> <6 5>4
    s4 s8 <2> <6>2
    <5!> s4 <6>
    s4 s8 <6> <7> <6> s4
    s2 <5>
    s8 <6>16 <6 5> s4 s2
    s4 <6>8 <_+> s4 <6>8 <_+>
    s4 <6>  s <6>
    s <6> s <6>
    <5> <6> s8 <6> <6> <_+>
    s4 <6> s <6>
    s <6> <_+>8 <6 4> <5 _+> <6 4>
    <_+ 5>4 <6> <6> <6\\>
    s4 <_+>

}

forma = {

    \time 4/4
    \key la\major
    \tempo 4 = 70
    \partial 8 s8
    s1*32
    \set Score.measureLength = #(ly:make-moment 7 8)
    s2 s4 s8
    \bar"||"
    \mark\markup\center-column{"Von""vorn"}

}



Ifl = {
    \global
    %\notypeset
    <<\Ifln \forma>>

}


Ivoce = {
    \new Voice = "fraget"
    \global
    <<\Ivocen \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.83  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IIvocen = \relative do'' {

    \autoBeamOff

    r8 fad, fad sold la dod la fad
    si4 r8 si\mbreak re re re dod
    la4 dod8 si16 dod lad8 dod mi re

    %4
    si si r si si4 fad
    si8 si\mbreak si dod la la la sold
    sold4 r8 mi' mi la, r8 dod16 si

    %7
    la8 la dod la fad fad\mbreak re' dod
    la la r4 r8 dod dod re
    si4 r8 si si fad la sold

    %10
    sold r16 si re8 dod dod4 r8 mi\mbreak
    dod dod red mi si4 r

}

IItesto = \lyricmode {

    Ich schätze _ den noch nicht be -- glückt, den hohe _ würde _ schmückt, wenn er nach einer _ höhern _

    strebet; _ und mancher, _ der sein feld mit saurer _ arbeit _ pflügt, ist glücklich, _ wenn er nur vergnügt _ bey

    seinem _ pflüge _ lebet. _ Wer nichts be -- gehrt, wird billig _ reich ge -- nennt, und glücklich _ der,

    der sich da -- für er -- kennt.



}


IIbcn = \relative do {

    fad1~
    fad2~fad~
    fad mi

    %4
    re1~
    re2 red
    re! dod~

    %7
    dod re
    mi4 la,~la2
    red1

    %10
    mi2 la,~
    la si4 mi

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <7/ 2>
    <5 3>2 <4\+>
    <6>1
    s2 <5>
    <2> <6>
    s1
    s
    <6>
    s
    s2 <_+>

}

forma = {

    \time 4/4
    \key la\major
    \tempo 4 = 75
    s1*11
    \bar"|."

}


IIvoce = {
    \new Voice = "ich"
    %\notypeset
    \global
    <<\IIvocen \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.83  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \con\tupletSpan 4
}

IIIfln = \relative do'' {

    r2 la4 mi
    la2 dod4 re8(si)
    dod2 mi4 re

    %4
    dod si8(la) sold4 la
    si2 mi4 la
    sol8(fad mi re) sol(fad mi re)

    %7
    mi4\tr re mi mi8(fad)
    re2 mi4 mi8(re)\mbreak
    sol2 fad4 mi8(dod)

    %10
    re2 mi8(fad mi re)
    fad(sol fad re) sol(la sol mi)
    fad\staccatissimo la re la fad la fad la

    %13
    fad la re la fad la fad la
    mi la dod la mi la mi la\mbreak
    mi la dod la mi la mi la

    %16
    re,4 si'2 re,4
    dod la' si, sold'
    la8(sold) fad(mi) re(dod) si(la)

    %19
    la'(sold) fad(mi) re(dod) si(la)
    mi'4 la, mi sold
    la2 r

    %22
    R1*4
    r2\mbreak dod8(si) la(sold)
    la4\tr sold la la8(si)

    %28
    sold2 la4 la8(sold)
    dod2 si4 la8(fad)
    sold2 la8(si la sold)

    %31
    si(dod si sold) dod(re dod la)
    r si mi si sold si sold si\mbreak
    sold si mi si sold si sold si

    %34
    mi,2 r
    r mi'4 si
    mi2 \tuplet 3/2 { sold8(la sold) fad[(sold la)] }

    %37
    sold2 la8 mi re dod
    fad la, sold la re la fad' la,
    mi' la, sold la dod la mi' la,\mbreak

    %40
    re si dod re dod la si dod
    si2 r
    R1

    %43
    r4 si' dod, lad'
    r si dod, lad'
    r8 fad si fad re fad re fad

    %46
    dod fad lad fad dod fad dod fad
    re4 si r2
    R1\mbreak

    %49
    r4 la' si, sold'
    r la si, sold'
    r8 mi la mi dod mi dod mi

    %52
    si mi sold mi si mi si mi
    dod4 la r2
    r mi'4 mi

    %55
    mi8(dod) re4 r2
    r fad4 fad
    fad8(red) mi4 r2\mbreak

    %58
    R1*3
    r8 dod si la la' mi re dod
    fad la, sold la re la fad' la,

    %63
    mi' la, sold la dod la mi' la,
    red2\fermata r
    R1*3

    %68
    r8 fad si fad re fad re fad
    si, fad' si fad\mbreak re fad re fad
    sold,4 mi8(fad) sold la si dod

    %71
    re4 si sold mi
    R1
    r2 mi'4 la

    %74
    sol8(fad mi re) sol(fad mi re)
    mi4\tr re mi mi8(fad)
    re2 mi4 mi8(re)\mbreak

    %77
    sol2 fad4 mi8(dod)
    re2 mi8(fad mi re)
    fad(sol fad re) sol(la sol mi)

    %80
    fad\staccatissimo la re la fad la fad la
    fad la re la fad la fad la
    mi la dod la mi la mi la\mbreak

    %83
    mi la dod la mi la mi la
    re,4 si'2 re,4
    dod la' si, sold'

    %86
    la8(sold) fad(mi) re(dod) si(la)
    la'(sold) fad(mi) re(dod) si(la)
    mi'4 la, mi sold

    %89
    la2\fermata r
    r dod
    r dod

    %92
    r dod\mbreak
    r sold'4 dod,
    la' fad, sold' dod,

    %95
    la' fad, r2
    R1*3
    r2 fad'4 si,

    %100
    sold' mi, fad' si,
    sold' mi, r2
    R1*6

}


IIIvocen = \relative do'' {

    \autoBeamOff
    R1*20
    r2 la4 mi
    la2 dod4 re8 [si]

    %23
    dod2 mi4 re\mbreak
    dod4 si8[la] sold4 la
    si2 dod4 si

    %26
    la8[sold fad mi] la[sold fad mi]
    fad4\tr mi fad fad8[sold]
    mi2 fad4 fad8[mi]

    %29
    la2 sold4 fad8[red]
    mi2 fad8[sold fad mi]\mbreak
    sold[la sold mi] la[si la fad]

    %32
    sold4 r si r
    mi r si r
    sold fad8[mi] fad2\tr

    %35
    mi r
    R1*5
    r2 sold4 la

    %42
    si2 si4 dod
    re2 mi4 re8 [dod]
    re[dod si re ] mi[re dod mi]

    %45
    re4 si r2\mbreak
    R1
    r2 fad4 sold

    %48
    la2 la4 si
    dod2 re4 dod8[si]
    dod[si la dod] re[dod si re]

    %51
    dod4 la r2\mbreak
    R1
    r2 la4 la

    %54
    la sol8[fad] sol4. la8
    fad2\tr si4 si
    si la8[sold!] la4. si8

    %57
    sold2\tr la4 mi\mbreak
    la2 dod4 re8[si]
    dod2 mi4 re

    %60
    dod si8[la] si2\tr
    la r
    la1~

    %63
    la
    la\fermata
    r2 si4 la\mbreak

    %66
    sold8[la sold mi] la[si la fad]
    si[dod si sold] dod[re dod la]
    re4 re r re

    %69
    r re r re
    r re8[dod] si[la sold fad]
    mi4 sold si mi\mbreak

    %72
    dod4 si8[la] si2\tr
    la\staccatissimo r
    R1*15

    %89
    r2\fermata fad4 sold
    la sold fad sold
    la sold fad sold

    %92
    la sold dod si
    la sold dod2\mbreak
    r dod

    %95
    r dod4 fad,
    re' dod2 mi4
    re dod8 si dod4 lad

    %98
    si2 si4 la?
    sold fad\mbreak si2
    r si

    %101
    r si4 mi,
    dod' si2 re4
    dod si8 la si4 sold

    %104
    la2 si4 la8 sold\mbreak
    dod2. re4
    sold,1\tr

    %107
    fad

}

IIItesto = \lyricmode {

    Immer - hin wird mein sinn, ohne _ sorgen, _ ohne _ neid, ruhig _ scher - - - - - - - - - - - - - - - - - - zen ruhig _ scher -- zen;

    immer - hin wird mein sinn ruhig _  scher - - zen,

    immer - hin wird mein sinn ruhig _ scher - - zen,

    ohne _ sorgen, _ ohne _ neid, ohne _ sorgen, _ ohne _ neid, wird mein sinn immer - hin ruhig _ scher - -  zen,

    ru -- hig, ruhig _ scher  - - - - - - - - - - - - - zen, ruhig _ scher -- zen.

    Denn es liegen _ meine _ güter _ und ver -- gnügen _ nicht im kasten, _ nein, nein, nein,

    im herzen _ und in der zufrieden - - heit, nicht im kasten, _

    nein, nein, nein,  im herzen _ und in der zufrieden - - heit, in der zu -- frie - den -- heit.

}


IIIbcn = \relative do {

    la2 r
    r la'4 mi
    la2 dod4 si

    %4
    la re,  mi fad
    mi re dod la
    <<
        {
            r2\slurDown si'8(la) sol[(fad)]

            %7
            sol4 fad sol sol8(la)
            fad2 sol4 sol8(fad)
            si2 la4 sol8(mi)

            %10
            fad2 \slurUp sol8(la sol fad)
            la (si la fad) si (do si sol)
            la4
        }\\{
            \tieDown re,1~
            re\staccatissimo~
            re\staccatissimo~
            re\staccatissimo~
            re\staccatissimo~
            re\staccatissimo~
            re4\staccatissimo
        }
    >> re re' re,

    %13
    r re re' re,
    r la la' la,
    r la la' la,\mbreak

    %16
    si la sold mi
    la dod re mi
    fad2 r

    %19
    fad,2. fad'4
    dod re mi mi,
    la2 r

    %22
    r la'4 mi
    la2 dod4 si\mbreak
    la dod, si la

    %25
    mi1~
    mi~
    mi~

    %28
    mi~
    mi~
    mi~

    %31
    mi
    mi'4 r mi, r
    mi' r mi, r

    %34
    mi' sold, la si
    mi,2 r
    r mi''4 si

    %37
    mi mi, dod la
    re2 fad4 re
    dod2 la'4 dod,\mbreak

    %40
    si sold' la la,
    mi'2 \tuplet 3/2{mi8(fad sold) fad[(sold la)]}
    sold4 sold, \tuplet 3/2{sold'8(la si) lad[(si dod)]}

    %43
    si2 mi,4 fad
    si, sol' mi fad
    si si, si' si,\mbreak

    %46
    r fad' lad fad
    si,2 \tuplet 3/2{re8[(mi fad)] si,(dod re)}
    dod4 la \tuplet 3/2{dod'8(re mi) sold,![(la si)]}

    %49
    la2 re,4 mi
    la, fad' re mi
    la la, la' la,

    %52
    r mi' sold mi
    la,2 dod4 la
    si2 dod

    %55
    re re4 si
    dod2 red
    mi r\mbreak

    %58
    r la4 mi
    la2 dod4 si
    la dod, re mi

    %61
    la, si dod la
    re2 fad4 re
    dod2 la'4 dod,

    %64
    si1\fermata
    red2. si4\mbreak
    mi mi, fad fad'

    %67
    sold sold, la la'
    si r la r
    sold r fad r

    %70
    mi2 mi
    mi2. sold4\mbreak
    la dod, re mi

    %73
    la,2 dod4 la
    <<
        {
            r2\slurDown si'8(la sol fad)
            sol4 fad sol sol8(la)

            %76
            fad2 sol4 sol8(fad)
            si2 la4 sol8(mi)
            fad2 \slurUp sol8(la sol fad)

            %79
            la (si la fad) si (do si sol)
            la4
        }\\{
            \tieDown re,1~
            re\staccatissimo~
            re\staccatissimo~
            re\staccatissimo~
            re\staccatissimo~
            re\staccatissimo~
            re4\staccatissimo
        }
    >> re re' re,
    r re re' re,

    %82
    r la la' la,
    r la la' la,\mbreak
    si la sold mi

    %85
    la dod re mi
    fad2 r
    fad,2. fad'4

    %88
    dod re mi mi,
    la2_\fermata la'4 sold
    fad sold la sold

    %91
    fad sold la sold
    fad dod la' sold
    fad dod mid2\mbreak

    %94
    fad mid
    fad lad
    si lad4 fad

    %97
    si re, mi fad
    si, dod red si
    mi si\mbreak red2

    %100
    mi red
    mi sold
    la sold4 mi

    %103
    la dod, re si
    dod la re dod8 si\mbreak
    la4 sold la si

    %106
    dod2 dod,
    fad1

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s
    s2
    <6>4 <6>
    s2 s4 <6\\>
    s2 <6>
    s1*10
    s2 <5>
    s4 <6> <6> s
    s1
    s2 s4 <6>
    <6>1
    s1*2
    s2 <6>4 <6>
    s <6> <6> s
    s1*9
    s4 <6> <6 5> <_+>
    s1
    s2 s4 <_+>
    s2 <6>
    s1
    <6>
    s4 <6> s2
    s2 s4 <7>
    <6>2 s4 <5>
    s2 <6 _!>4 <_+>
    s2 <6 _!>4 <_+>
    s1
    s4 <_+> s2
    s <6>4 <6\\>
    <6>2 <6>4 <6>
    s2 <6>
    s <6>
    s1*3
    <7>2 <5!>
    s <6>
    <7> <5>
    s1
    s
    s2 <6>4 <6>
    s <6> <6> s
    s2 <6>
    s1
    <6>
    <7 _+>
    <6>
    s
    <6>
    s2 <2>
    <7> <6>
    <7>2 s
    s s4 <6>
    s <6> <6 5> s
    s1*11
    s2 <5>
    s4 <6> <6 5> s
    s1
    s2 s4 <6>
    <6>1
    s2 <6>4 <6\\>
    \bassFigureExtendersOn <_> <_> <6> <6\\>
    <_> <_> <6> <6\\>
    s <_+> <6> <6\\>
    s <_+> <6>2
    s <6>
    s <6>
    s <6>
    s4 <6>8 s <6 _!>4 <_+>
    <_> <_>\bassFigureExtendersOff <6>2
    <_+>4 <_+> <6>2
    s <6>
    s <6>
    s <6>
    s4 <6> <6> <6>
    <6>2 <6>
    <6>1
    <4+>

}

forma = {

    \time 4/4
    \key la\major
    \tempo 1 = 55
    s1*107
    \bar"||"
    \mark\markup\center-column{"Von""vorn"}

}



IIIfl = {
    \global
    %\notypeset
    <<\IIIfln \forma>>

}


IIIvoce = {
    \new Voice = "wird"
    \global
    <<\IIIvocen \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.19.83  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge\bold\fill-line {"  ""I Cantata - Die Zufriedenheit”""  "}

    \markup \huge\column {"  ""[1.] Mutig"}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Violino oder""Traverse"}
                \Ifl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce
                \new Lyrics \lyricsto "fraget" \Itesto
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"cello"
                \Ibc

            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

}

\pageBreak

\bookpart {

    \paper  {

        systems-per-page = #6
    }

    \markup \huge\column {"[2.] Recitatif"}

    \score {

        \new ChoirStaff <<

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"voice oohs"
                \IIvoce
                \new Lyrics \lyricsto "ich" \IItesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \IIbc

            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

}

\pageBreak

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge\column {"[3.] Lustig"}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"flute"
                \IIIfl
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"voice oohs"
                \IIIvoce
                \new Lyrics \lyricsto "wird" \IIItesto
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc

            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

}

\pageBreak
