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

dolce = _\markup\italic"doux"

fort = _\markup\italic"fort"

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



Ivln = \relative do'' {

    r4 r8 la si [dod re8. dod16]
    si4-+ si8 mi \appoggiatura re16 dod8.[si16(la8) si]
    dod la r mi' fad[sold la8. sold16]

    %4
    fad4-+ fad8 mi16-+ red mi8. fad16 red8.-+ mi16
    mi4 r8 la16 mi fad8 sold16 la sold8.-+ la16\mbreak
    si8 mi, r si re mi16 fad si,8.-+ la16

    %7
    la4 r r2
    R1%%% ripresa
    r8 dod16 re mi8 la, la'4 r\mbreak

    %10
    r8 fad,16\dolce sold la8 mi fad sold la fad
    sold mi16 fad sold8 mi la la'4 sol8
    fad si, dod re dod dod lad fad\mbreak

    %13
    sol si la sol fad re' dod fad
    red-+ fad sold si mi,4 r
    r8 la, re dod re re16 mi fad8 re\mbreak

    %16
    si4-+ r8 fad' si4 r
    r2 mi,8. re16 dod(si) la(sold)
    la(si) dod(re) dod8.-+ si16 dod4(si8.) la16

    %19
    la4 r8 la'16\fort mi fad8 sold16 la sold8.-+ la16\mbreak
    si8 mi, r si re mi16 fad si,8.-+ la16
    la4 r r la8 la16 fad   %% fine ripresa

    %22
    si4 r r8 fad lad fad\mbreak
    si4 r8 fad\dolce la4 sold
    fad4. sold8 mid2

    %25
    r r4 fad'8 fad16 dod
    re4 si8. si16 sold4_+ sold\mbreak
    r la8 dod fad,4 fad~

    %28
    fad mid_+ fad8 fad16\fort mid fad8 sold
    la4 r r2
    R1^\markup\italic"Reprise"%%% ripresa

    %31
    r8 dod16 re mi8 la, la'4 r\mbreak
    r8 fad,16\dolce sold la8 mi fad sold la fad
    sold mi16 fad sold8 mi la la'4 sol8

    %34
    fad si, dod re dod dod lad fad\mbreak
    sol si la sol fad re' dod fad
    red-+ fad sold si mi,4 r

    %37
    r8 la, re dod re re16 mi fad8 re\mbreak
    si4-+ r8 fad' si4 r
    r2 mi,8. re16 dod(si) la(sold)

    %40
    la(si) dod(re) dod8.-+ si16 dod4(si8.) la16
    la4 r8 la'16\fort mi fad8 sold16 la sold8.-+ la16\mbreak
    si8 mi, r si re mi16 fad si,8.-+ la16

    %43
    la4 r r2   %% fine ripresa

}

Ivocen = \relative do'' {

    \autoBeamOff

    R1*6
    r4 r8 la si dod re8. dod16
    si4-+ si8 mi \appoggiatura re16 dod8. si16(la8) si %%%ripresa

    %9
    dod \appoggiatura si16 la8 r dod16 re mi4 mi8. dod16\mbreak
    fad4 r8 dod red mi mi red
    \appoggiatura red?16 mi4 r8 mi dod2-+

    %12
    re8 re16 re mi8 fad lad,8.-+ sold16(fad4)\mbreak
    dod'8 mi re dod si4 si8 lad
    \appoggiatura lad?16 si4 r8 mi dod2-+

    %15
    re8 re16 dod re8 mi fad8. mi16 (re4)\mbreak
    fad8 si, si4. (sold8) la4
    \appoggiatura la16 sold2-+ r4 mi'8. re16

    %18
    dod[si] la[sold] la2 la8 sold
    \appoggiatura sold16 la2 r\mbreak
    R1

    %21
    r4 la8 la16 mi dod'4 dod8 dod16 fad
    mid8.  red16(dod4) fad8 fad16 mi? mi8(re?16) dod\mbreak
    \appoggiatura dod16 re2 dod8 dod dod4~

    %24
    dod dod8 si \appoggiatura si16 dod2
    r4 dod8 dod16 sold la4 la8 la
    la8. [sold16] sold8 sold mid4_+ mid8 sold\mbreak

    %27
    dod2~dod8 sold sold la
    la4 sold8.-+  fad16 fad2
    r4 r8 la si dod re8. dod16

    %30
    si4-+ si8 mi \appoggiatura re16 dod8. si16(la8) si %%%ripresa
    dod \appoggiatura si16 la8 r dod16 re mi4 mi8. dod16\mbreak
    fad4 r8 dod red mi mi red

    %33
    \appoggiatura red?16 mi4 r8 mi dod2-+
    re8 re16 re mi8 fad lad,8.-+ sold16(fad4)\mbreak
    dod'8 mi re dod si4 si8 lad

    %36
    \appoggiatura lad?16 si4 r8 mi dod2-+
    re8 re16 dod re8 mi fad8. mi16 (re4)\mbreak
    fad8 si, si4. (sold8) la4

    %39
    \appoggiatura la16 sold2-+ r4 mi'8. re16
    dod[si] la[sold] la2 la8 sold
    \appoggiatura sold16 la2 r\mbreak

    %42
    R1*2

}

Itesto = \lyricmode {

    Que vous m'offrez _ d'atraits _ agre - a -- bles retrai - tes? Les super - bes Pa --

    lais sont moins charmans _ que vous. Les Dieux, semblent _ vous avoir _ fai -- tes,

    Pour combler _ nos vœux les plus doux. Les Dieux, semblent _ vous avoir _ fai -- tes,

    Pour combler _ nos vœux, Pour combler _ nos vœux les plus doux. %%%%%%% fine ripresa

    Loin du tumul - tes_et des al -- lar -- mes, Seules _ vous renfer - mez les soli - des plai -- sirs:

    Puisse_a _ jamais _ la dou --  ceur de vos charmes _ Bor -- ner nos inno - - cens de -- sirs.

    Que vous m'offrez _ d'atraits _ agre - a -- bles retrai - tes? Les super - bes Pa --

    lais sont moins charmans _ que vous. Les Dieux, semblent _ vous avoir _ fai -- tes,

    Pour combler _ nos vœux les plus doux. Les Dieux, semblent _ vous avoir _ fai -- tes,

    Pour combler _ nos vœux, Pour combler _ nos vœux les plus doux.

}

Ibcn = \relative do {

    r8 la' si dod re dod si8. la16
    mi'8 mi, sold mi la la, dod re
    la mi' fad sold la [sold fad8.-+ mi16]

    %4
    si'4 la8 sold16-+ fad sold8 la si si,
    mi mi'16 re dod8 la re si mi8. la,16\mbreak
    sold4 sol8. sol16 fad8 dod16 re mi8 mi,

    %7
    la la' si dod re [dod si8. la16]
    mi'8 mi, sold mi la la, dod re  %%% reprise
    la4 r r8 la'16 si dod8 la\mbreak

    %10
    re re, la\noBeam  la'4 sold8 fad si
    mi,4 r r8 la16 si dod8 la
    re8 re, dod si fad'4 r8 fad\mbreak

    %13
    mi8 sol fad mi re si fad'4
    r8 si16 la sold8 mi la la4 sol8
    fad fad16 sol fad8 mi re4 r\mbreak

    %16
    red r r8 si red si
    mi4 mi'8. re16 dod16(si) la(sold) la8 mi
    la,4 r8 dod16 re mi8 re  mi mi,

    %19
    la la'16 si dod8 la re si mi8. la,16\mbreak
    sold4 sol8. sol16 fad8 dod16 re mi8 mi,
    la4 r r2 %% fine ripresa

    %22
    r4 dod'8 dod16 si lad4 r\mbreak
    r8 si, re si fad'4 mi
    re2 dod4 dod'8. dod16

    %25
    mid,4. dod8 fad4. fad,8
    si2 dod\mbreak
    r4 la8. la16 re4. si8

    %28
    dod2 fad,
    r8 la' si dod re[dod si8.-+ la16]

    mi'8 mi, sold mi la la, dod re  %%% reprise
    la4 r r8 la'16 si dod8 la\mbreak

    %10
    re re, la\noBeam  la'4 sold8 fad si
    mi,4 r r8 la16 si dod8 la
    re8 re, dod si fad'4 r8 fad\mbreak

    %13
    mi8 sol fad mi re si fad'4
    r8 si16 la sold8 mi la la4 sol8
    fad fad16 sol fad8 mi re4 r\mbreak

    %16
    red r r8 si red si
    mi4 mi'8. re16 dod16(si) la(sold) la8 mi
    la,4 r8 dod16 re mi8 re  mi mi,

    %19
    la la'16 si dod8 la re si mi8. la,16\mbreak
    sold4 sol8. sol16 fad8 dod16 re mi8 mi,
    la4 r r2 %% fine ripresa

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8 s <6> <6> <6 4\+> <6> <6>4
    \bassFigureExtendersOn <_>4 <_>8 <_>\bassFigureExtendersOff s4 <6>8 <6>
    s4 s8 <6 5/> <6> <6> <6>4
    \bassFigureExtendersOn <_+>4 <_>8 <_>\bassFigureExtendersOff <6> <6 5> <_+>4
    s <6> s2
    \bassFigureExtendersOn <6>4 <6>8 <6>\bassFigureExtendersOff <6> <6> s4
    s <6>8 <6> <6 4+> <6> <6>4
    s8 \bassFigureExtendersOn <_> <_> <_>\bassFigureExtendersOff s4 <6>8 <6 5>  %%% ripresa
    s2 s8 \bassFigureExtendersOn <_>8 <_> <_>\bassFigureExtendersOff
    s2 <6 4>8 <6> <7> <_+>
    s2  s8 \bassFigureExtendersOn <_> <_> <_>\bassFigureExtendersOff
    s8 <6> <6+> s <_+>4 s8 <6+><6 _-> <6> <6> <6 4+> <6>4 <4>8 <3+>
    s <_+> <6>4 \bassFigureExtendersOn <_>4 <_>8 <_>\bassFigureExtendersOff
    <6>8 s16 <6 4+> <6>8 <6 _-> s2
    \bassFigureExtendersOn <6>4 <6> <6>8 <6> <6 5/> <6>16 s
    <_>4 <_>8 <_> \bassFigureExtendersOff <6>8 s16 <5/> s4
    s s8 <6> <4>4 <3>
    \bassFigureExtendersOn <_>4 <_>8 <_> s2
    <6>4 <_>8 <_>\bassFigureExtendersOff <6>8 <6>16 <6 5> s4
    s1  %%% fine ripresa
    s4 <_+> <6> s
    s8 \bassFigureExtendersOn <_>8 <_>8 <_> s4 <6>
    <7> <6> <_+>4 <_+>8 <_+>
    <6>4. <_+>8 s2
    <7>4 <6> <_+>2
    s4 <6> <7> <6>8 <7 5>
    <4>4 <3+> s2
    \bassFigureExtendersOff s4 <6>8 <6>
    <6 4\+> <6> <6>4
    s8 \bassFigureExtendersOn <_> <_> <_>\bassFigureExtendersOff s4 <6>8 <6 5>  %%% ripresa
    s2 s8 \bassFigureExtendersOn <_>8 <_> <_>\bassFigureExtendersOff
    s2 <6 4>8 <6> <7> <_+>
    s2  s8 \bassFigureExtendersOn <_> <_> <_>\bassFigureExtendersOff
    s8 <6> <6+> s <_+>4 s8 <6+><6 _-> <6> <6> <6 4+> <6>4 <4>8 <3+>
    s <_+> <6>4 \bassFigureExtendersOn <_>4 <_>8 <_>\bassFigureExtendersOff
    <6>8 s16 <6 4+> <6>8 <6 _-> s2
    \bassFigureExtendersOn <6>4 <6> <6>8 <6> <6 5/> <6>16 s
    <_>4 <_>8 <_> \bassFigureExtendersOff <6>8 s16 <5/> s4
    s s8 <6> <4>4 <3>
    \bassFigureExtendersOn <_>4 <_>8 <_> s2
    <6>4 <_>8 <_>\bassFigureExtendersOff <6>8 <6>16 <6 5> s4
    s1  %%% fine ripresa

}


forma = {

    \time 4/4
    \key la\major
    \tempo 4 = 60
    s1*43
    \bar "||"

}

Ivl = {
    \notypeset
    <<\Ivln \forma>>

}

Ivoce = {
    \new Voice = "que"
    <<\Ivocen \forma>>
}



Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}




IIvln = \relative do'' {

    la8_\markup \italic "Detachez" si do re mi fa
    mi4 la, r8 la'
    sold fa mi re do-+ si

    %4
    do4 la r8 do
    fa mi re8.(mi32 re) do8. (\tuplet 3/2 { mi32 re do) }\mbreak
    si8.-+ la16(sol4) r

    %7
    sol'8 la16(sol) la8 sol fa-+ mi
    fa16 sol(mi sol) fa8 mi re-+ do
    sol' fa16 mi re do si la sol8. fa'16

    %10
    mi8.-+ fa16 re4.-+ do8
    do4 r mi16(fa) mi(sol)\mbreak
    fa8 mi re do si la

    %13
    sold4_+ mi'8.(fa16) mi(fa mi fa)
    mi8 re16 do si la sold fad mi8. re'16
    do8.-+ si16 si4.-+ la8

    %16
    la4 r r
    la8 si do re mi fa\mbreak %%% ripresa
    mi4 la, r

    %19
    r8 si do sold la4
    r la sold
    la r16 mi' fad sold la sold la si

    %22
    mi,4 r r\mbreak
    R2.
    mi,8 fad sold la si do

    %25
    si4 mi, r
    r mi'8 fad sold la
    si4 r8 si16 la sold8 si

    %28
    mi,4 r8 mi fad sold\mbreak
    la4 r8 la16 sol fad16(sol la fad)
    re4 r r

    %31
    r sol8 fa16 mi re do si la
    sol8 la si do do si
    do4 r8 mi fa sol\mbreak

    %34
    do,4. do8 fa mi
    re4-+ sol8.(la32 sol) fa8.(sol32 fa)
    mi8.-+[re16(do8) sol' la si]

    %37
    do4 r8 mi,16 re do8 mi
    la,4 r8 la si_+ do
    re8.(mi16) re8.(mi32 re) do8. (\tuplet 3/2 { mi32 re do) }\mbreak

    %40
    si4-+ si'8.(do16) si(sold la si)
    mi,4 la8 sol fa mi
    re do si4.(la16 si)

    %43
    do8(si16 la) do8(si16 la) mi'4
    r8 mi la sold la4~
    la16(si la sold) la4. sold8\mbreak

    %46
    la(si) do(si) la4~
    la8. \tuplet 3/2 { si32(la si) } si4.-+(la16 si)
    do2^\markup\italic "Lent" r8 mi,_\markup\italic"Fort doux"

    %49
    \appoggiatura mi16 fad2 r4
    sold8. la16 la4(sold8.-+ la16)
    la4 mi8.\fort \tuplet 3/2 { fa32(mi fa) } sol8(fa16-+ mi)\mbreak

    %52
    fa8 mi re do si la
    sold4_+ mi'8.(fa16) mi(fa) mi(fa)
    mi8 re16 do si la sold fad mi8. mi'16

    %55
    la8. si16 sold4.-+ la8
    la2. %% fine ripresa
    R2.*2

    %59
    r4 si8\dolce (la) sol[(si)]
    mi,4. mi8 fad sol
    fad8. sol32(fad)  fad4.-+(mi16 fad)

    %62
    sol2 r4
    r mi si\mbreak
    sol mi si'

    %65
    sol'4. \tuplet 3/2 { la16(sol la) } si4~
    si8 la16(sol) fad4.-+ mi8
    mi(re) mi[(re)] do(si)

    %68
    do(si) do[(si)] la(sold)
    la2 r4\mbreak
    la'8(sol) la[(sol)] fa(mi)

    %71
    fa(mi) fa[(sol)] fa(sol)
    mi4.-+ mi8 fa mi
    re(dod) re[(mi)] re(mi)

    %74
    dod(si) la[(sol)] fa(mi)
    fa(mi) re4 r
    sol8(fa) mi4 la8(si)\mbreak

    %77
    dod(re) mi4 la,
    sib do8 (sib) la[(sol)]
    la(sol) fa[(sol)] la(sib)

    %80
    mi,4 mi4. re8
    re4 fa'8 mi re fa
    mi fad16 mi fad sol la si sold8. la16\mbreak

    %83
    la4 mi r
    mi8 re16 do si la sold fa mi8. \tuplet 3/2 { re'32(do si) }
    do8. fa16 mi8.(fa32 mi) re8. \tuplet 3/2 { fa32(mi re) }

    %86
    do8.-+ si16 la4 r
    la8^\markup\italic"Reprise" si do re mi fa\mbreak %%% ripresa
    mi4 la, r

    %89
    r8 si do sold la4
    r la sold
    la r16 mi' fad sold la sold la si

    %92
    mi,4 r r\mbreak
    R2.
    mi,8 fad sold la si do

    %95
    si4 mi, r
    r mi'8 fad sold la
    si4 r8 si16 la sold8 si

    %98
    mi,4 r8 mi fad sold\mbreak
    la4 r8 la16 sol fad16(sol la fad)
    re4 r r

    %101
    r sol8 fa16 mi re do si la
    sol8 la si do do si
    do4 r8 mi fa sol\mbreak

    %104
    do,4. do8 fa mi
    re4-+ sol8.(la32 sol) fa8.(sol32 fa)
    mi8.-+[re16(do8) sol' la si]

    %107
    do4 r8 mi,16 re do8 mi
    la,4 r8 la si_+ do
    re8.(mi16) re8.(mi32 re) do8. (\tuplet 3/2 { mi32 re do) }\mbreak

    %110
    si4-+ si'8.(do16) si(sold la si)
    mi,4 la8 sol fa mi
    re do si4.(la16 si)

    %113
    do8(si16 la) do8(si16 la) mi'4
    r8 mi la sold la4~
    la16(si la sold) la4. sold8\mbreak

    %116
    la(si) do(si) la4~
    la8. \tuplet 3/2 { si32(la si) } si4.-+(la16 si)
    do2^\markup\italic "Lent" r8 mi,_\markup\italic"Fort doux"

    %119
    \appoggiatura mi16 fad2 r4
    sold8. la16 la4(sold8.-+ la16)
    la4 mi8.\fort \tuplet 3/2 { fa32(mi fa) } sol8(fa16-+ mi)\mbreak

    %122
    fa8 mi re do si la
    sold4_+ mi'8.(fa16) mi(fa) mi(fa)
    mi8 re16 do si la sold fad mi8. mi'16

    %125
    la8. si16 sold4.-+ la8
    la2. %% fine ripresa

}

IIvocen = \relative do'' {

    \autoBeamOff

    R2.*15
    la8 [si do re mi fa](
    mi4) la, r\mbreak  %%% ripresa

    %18
    do16[mi re fa](mi8) [re16-+ do] si[do la si](
    sold8.) fad16(mi4) r8 mi'
    fa[mi] re[do] re16[si do8]

    %21
    do8.-+ si16(la4) r
    do re4.-+ mi8\mbreak
    mi4(re-+) do8 re

    %24
    \appoggiatura re16 mi2 r4
    mi,8 [fad sold la si do](
    si4) mi, r

    %27
    mi'8[re mi fa mi re](
    dod4-+) la r\mbreak
    re8.[mi16](re8.)[(mi32 re)](do8.) [(\tuplet 3/2 { mi32 re do)] }(

    %30
    si4-+) sol si8-+ do
    \appoggiatura do16 re2 r4
    r fa mi8 re

    %33
    mi8. re16(do4) r8 sol\mbreak
    la2 si8 do
    do4(si4.-+) do8

    %36
    do2 r4
    mi8 [re do si la sol](
    fad4_+) fad r

    %39
    si8. [do16] si8.[(do32 si)] la8.[\tuplet 3/2 { do32 si la }](
    sold8.-+) fad16(mi4) r8 mi
    do'2 la8. sol16[

    %42
    fad8. sol16] sold4.-+ la8
    la4 la8.[do16 si8. re16](
    do8.)[\tuplet 3/2 { re32 do si }](la8)[si do re]

    %45
    mi4.(fa8)[mi8. fa16](\mbreak
    mi4.) fa16[mi] mi8.-+[(re32 mi)]
    fa8.[(sol32 fa)] \appoggiatura mi16 re4 r8 si

    %48
    mi2.~
    mi2 r4
    si8. do16 do4(si8.-+) la16

    %51
    la4 r r\mbreak
    R2.*5  %%% fine ripresa
    mi'4 do la\mbreak

    %58
    re8[do] re[do] si[la]
    si8.-+ la16(sol4) si8 mi
    dod4.-+ dod8 red mi

    %61
    red2.-+
    r4 mi si
    sol8[fad mi fad sol la](

    %64
    si8) [la si dod red si](
    mi4.-+) \tuplet 3/2 { fad16[(mi fad)] } sol4~
    sol8 fad16[mi] red4. mi8

    %67
    mi2 r4
    mi8[re] mi[re] do[si]
    do[si] la[sol] fa[mi]\mbreak

    %70
    fa8. mi16(re4) r
    la' la4. la8
    la2.~

    %73
    la4 la sol8 sol(
    la2) r4
    la re si

    %76
    mi dod4.-+ re8\mbreak
    mi4 la, r
    mi' fa8[mi] re[dod]

    %79
    re2.~
    re4 dod4.-+ re8
    re4 r r

    %82
    R2.*4
    la8 [si do re mi fa](
    mi4) la, r\mbreak  %%% ripresa

    %88
    do16[mi re fa](mi8) [re16-+ do] si[do la si](
    sold8.) fad16(mi4) r8 mi'
    fa[mi] re[do] re16[si do8]

    %91
    do8.-+ si16(la4) r
    do re4.-+ mi8\mbreak
    mi4(re-+) do8 re

    %94
    \appoggiatura re16 mi2 r4
    mi,8 [fad sold la si do](
    si4) mi, r

    %97
    mi'8[re mi fa mi re](
    dod4-+) la r\mbreak
    re8.[mi16](re8.)[(mi32 re)](do8.) [(\tuplet 3/2 { mi32 re do)] }(

    %100
    si4-+) sol si8-+ do
    \appoggiatura do16 re2 r4
    r fa mi8 re

    %103
    mi8. re16(do4) r8 sol\mbreak
    la2 si8 do
    do4(si4.-+) do8

    %106
    do2 r4
    mi8 [re do si la sol](
    fad4_+) fad r

    %109
    si8. [do16] si8.[(do32 si)] la8.[\tuplet 3/2 { do32 si la }](
    sold8.-+) fad16(mi4) r8 mi
    do'2 la8. sol16[

    %112
    fad8. sol16] sold4.-+ la8
    la4 la8.[do16 si8. re16](
    do8.)[\tuplet 3/2 { re32 do si }](la8)[si do re]

    %115
    mi4.(fa8)[mi8. fa16](\mbreak
    mi4.) fa16[mi] mi8.-+[(re32 mi)]
    fa8.[(sol32 fa)] \appoggiatura mi16 re4 r8 si

    %118
    mi2.~
    mi2 r4
    si8. do16 do4(si8.-+) la16

    %121
    la4 r r\mbreak
    R2.*5  %%% fine ripresa

}

IItesto = \lyricmode {

    Vo -- le, vo - le, d'une ai -- le le -- ge -- re, Les fleurs nai -- tront sous tes pas:

    Vo -- le, vo -- le, vo -- le vole_A - mour; quit -- te Cy -- the -- re, Ces

    lieux t'offrent _ plus d'a -- pas. Vo -- le, vo -- le, vo -- le, Ces

    lieux t'offrent _ plus d'a -- pas. Vo - - - - le, Ces lieux t'offrent _ plus d'a -- pas.  %%% fine ripresa

    Que dans ces ver -- tes prai -- ri -- res, Tout s'en -- fla -- me de tes feux,

    Tout s'en -- fla - - me de tes feux; Que sur ces ri -- ves fleu -- ri -- es,

    Tous les A -- mans soient heu -- reux. Que sur ces ri -- ves fleu -- ri -- es,

    Tous les A -- mans soient heu -- reux.

    Vo -- le, vo - le, d'une ai -- le le -- ge -- re, Les fleurs nai -- tront sous tes pas:

    Vo -- le, vo -- le, vo -- le vole_A - mour; quit -- te Cy -- the -- re, Ces

    lieux t'offrent _ plus d'a -- pas. Vo -- le, vo -- le, vo -- le, Ces

    lieux t'offrent _ plus d'a -- pas. Vo - - - - le, Ces lieux t'offrent _ plus d'a -- pas.  %%% fine ripresa

}

IIbcn = \relative do {

    \clef tenor R2.
    la'8 si do re mi fa
    mi re do si la sold

    %4
    la sib la sol fa mi
    \clef bass re do fa re mi fad\mbreak
    sol fa?16 mi re do si la sol8 fa

    %7
    mi4 r la
    \once\stemUp re,8 la'' re do si-+ la
    sol4 r si,8 sol

    %10
    do fa, sol2
    do'8 si la si dod la\mbreak
    re do? si la sold la

    %13
    mi4 r8 do'16 si do8.(si16)
    do8 re mi4 r8 sold,
    la re, mi4 mi,

    %16
    la r r
    R2.  %% ripresa
    \clef tenor la'8 si do re mi fa

    %19
    mi re do si la la,
    \clef bass re4 si mi
    la, r r

    %22
    la sol2\mbreak
    fa2.
    mi

    %25
    R
    mi'8 fad sold la si do
    sold4 mi r

    %28
    la8 sol la si la sol\mbreak
    fad4 re r
    sol?8.(la32 sol) fa?8 mi re do

    %31
    si-+ la sol4 r
    sol'8 fa16 mi re do si la sol8 sol'
    do sib la sol fa mi\mbreak

    %34
    fa sol fa mi re do
    sol'4 sol,2
    do8 re mi re do si

    %37
    la2 r4
    re'8 do re mi re do
    si4 sold la\mbreak

    %40
    mi4 mi re
    do2 re4~
    re mi mi,

    %43
    la la' sold
    la r8 mi la si
    do si la sold la4~\mbreak

    %46
    la8 sold la si dod la
    re4 si sol?
    do,2 r8 do

    %49
    re2 r4
    mi8. la,16 mi2
    la4. la'8 dod la\mbreak

    %52
    re do? si la sold la
    mi8. \tuplet 3/2 { \senza \override TupletBracket.bracket-visibility = ##ffa32(mi re) } la4 r8 do'16(si)
    do8 re mi4 r8 re,

    %55
    do la  mi'4 mi,
    la2. %%%% fine ripresa
    r4 r la'8(sol)\mbreak

    %58
    fad(mi) fad4 r
    r sol8(fad) sol[(mi)]
    la si la sol fad mi

    %61
    si'4 si si,
    sol mi r
    R2.\mbreak

    %64
    r4 mi'' si
    sol la sol,
    la si2

    %67
    mi2.
    R
    la8(sol) fa[(mi)] re(dod)\mbreak

    %70
    re2 r4
    re'2 r4
    dod do2

    %73
    si4 sib2
    la8(sol) fa[(mi)] re(dod)
    re4 r sol8(fa)

    %76
    mi4 la r\mbreak
    la r r
    sol2.

    %79
    fa8(mi) re[(mi)] fa(sol)
    la4 la,2
    re4 re'8 do si sol

    %82
    do8.(si32 la) re8.(do32 si) mi8. la,16\mbreak
    mi4 mi'8 re16 do si la sold fad
    mi4. mi8 re8. \tuplet 3/2 { fa32 mi re }

    %85
    do8. si32(la) sold4 mi
    la r r
    R2.  %% ripresa

    %88
    \clef tenor la'8 si do re mi fa
    mi re do si la la,
    \clef bass re4 si mi

    %91
    la, r r
    la sol2\mbreak
    fa2.

    %94
    mi
    R
    mi'8 fad sold la si do

    %97
    sold4 mi r
    la8 sol la si la sol\mbreak
    fad4 re r

    %100
    sol?8.(la32 sol) fa?8 mi re do
    si-+ la sol4 r
    sol'8 fa16 mi re do si la sol8 sol'

    %103
    do sib la sol fa mi\mbreak
    fa sol fa mi re do
    sol'4 sol,2

    %106
    do8 re mi re do si
    la2 r4
    re'8 do re mi re do

    %109
    si4 sold la\mbreak
    mi4 mi re
    do2 re4~

    %112
    re mi mi,
    la la' sold
    la r8 mi la si

    %115
    do si la sold la4~\mbreak
    la8 sold la si dod la
    re4 si sol?

    %118
    do,2 r8 do
    re2 r4
    mi8. la,16 mi2

    %121
    la4. la'8 dod la\mbreak
    re do? si la sold la
    mi8. \tuplet 3/2 { \senza \override TupletBracket.bracket-visibility = ##ffa32(mi re) } la4 r8 do'16(si)

    %124
    do8 re mi4 r8 re,
    do la  mi'4 mi,
    la2. %%%% fine ripresa

}

IIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2. <_>4 <_>8 <_> <_+> <6>
    <_+>4 \bassFigureExtendersOff <6>8 <6+> s <5/>
    \bassFigureExtendersOn <_>4 <_>8 <_> s <6>\bassFigureExtendersOff
    <6>4 <6> <6>8 <5/>
    \bassFigureExtendersOn <_>4 <_> <_>8 <_>
    <7>4 s <_+>
    \bassFigureExtendersOff s8 <_+> s <6> <6> <6+>
    \bassFigureExtendersOn s2 <5/>8 <5/>
    s <6 5> <4>4 <3>
    s <_+>8 <_+> <_+> <_+>
    s <6> <6+> s <5/> s
    <_+>4 s8 <6> s8. <6+ 5/>16
    <6>4 <_+> s8 <5/>
    s <6 5> <4>4 <3+>
    s2.

    s2.   %%% ripresa
    \bassFigureExtendersOff s8 <6+> <6> <6> <_+> <6> \bassFigureExtendersOn
    <_+> <_+> s <6+> s <6>
    s4 <7> <_+>
    s2.
    s4 <7> <6>
    <7> <6> s
    <_+>2.
    s
    <_+>8 \bassFigureExtendersOff s <6> <6+> <6+> <6>
    \bassFigureExtendersOn <5/>4 <5/ _+>8 s s4
    <_+>4 <_+> <_+>8 s
    <6>4 <6>8 s s4
    <_>8. <_>16 \bassFigureExtendersOff s8 <6> <6> s
    \bassFigureExtendersOn <6>4 <6>8 s s4   %%%%%%5 bar 31 OOKK
    <_>4 <_>8 <_>8 <4> <3>
    \bassFigureExtendersOff s4 <6>8 <6 _-> s <5/>
    s4 s8 <6> <6> s
    <4>4 <3> s
    s2 <6>8 <6+>
    s2.
    \bassFigureExtendersOn <_+>2 <_+>8 <_+>
    <6+>4 <5/> s
    <_+>2 <_+>8 s\bassFigureExtendersOff
    <6>2 <6>4 <6 5 _+> <_+> s
    s2 <5/>4
    s s8 \bassFigureExtendersOn <_+>8 <_+> <_+>
    <6> <6+> s <5/> s4
    <_>4 <_>8 <6+> <6> s
    s4 <5/> <7>
    s2.
    <9 7 _+>2 s4
    <7 _+>4 <4> <3+>
    s2 <6>4
    s8 <6> <6+> s <5/>4
    <_+> <6> s
    \bassFigureExtendersOff <6>8 <6> \bassFigureExtendersOn <_+>4 <_+>8 s
    <6>4 <_+> s
    s2.  %%%% fine ripresa

    s
    <5/>
    s2 <6>4
    <_+>4 <_+>8 <_+> <6+> s
    <_+>4 <_+> <_+>8 s
    <6>4 <6>8 s s4
    s2.
    s2 <_+>4
    <6>4 <6> <6>8 s
    <7>8 <6+> <_+>4 s
    <_+>2.
    s
    s4 <6>8 <6+> s <5/>
    s2.*2
    <6>4 s <6 4>
    \bassFigureExtendersOff <7>4 <7> <6>
    <_+> <6>8 <6+> s <5/>
    s2.
    s4 <_+>2
    <_+>2.
    <6 4+ _->2 s4
    \bassFigureExtendersOn <6>4 <6> <6>8 <6>
    <4>4 <_+>2
    s2 <5/>4
    \bassFigureExtendersOff <6> <6 5> <7 5/>\bassFigureExtendersOn
    <_+>4 <_+> <_+>8 <_+>16 <_+>32 s
    <_+>4 <_+> <_+>8 <_+>16 <_+>32 s
    \bassFigureExtendersOff <6>4 <6> <_+>
    s2.

    s2.   %%% ripresa
    \bassFigureExtendersOff s8 <6+> <6> <6> <_+> <6> \bassFigureExtendersOn
    <_+> <_+> s <6+> s <6>
    s4 <7> <_+>
    s2.
    s4 <7> <6>
    <7> <6> s
    <_+>2.
    s
    <_+>8 \bassFigureExtendersOff s <6> <6+> <6+> <6>
    \bassFigureExtendersOn <5/>4 <5/ _+>8 s s4
    <_+>4 <_+> <_+>8 s
    <6>4 <6>8 s s4
    <_>8. <_>16 \bassFigureExtendersOff s8 <6> <6> s
    \bassFigureExtendersOn <6>4 <6>8 s s4   %%%%%%5 bar 31 OOKK
    <_>4 <_>8 <_>8 <4> <3>
    \bassFigureExtendersOff s4 <6>8 <6 _-> s <5/>
    s4 s8 <6> <6> s
    <4>4 <3> s
    s2 <6>8 <6+>
    s2.
    \bassFigureExtendersOn <_+>2 <_+>8 <_+>
    <6+>4 <5/> s
    <_+>2 <_+>8 s\bassFigureExtendersOff
    <6>2 <6>4 <6 5 _+> <_+> s
    s2 <5/>4
    s s8 \bassFigureExtendersOn <_+>8 <_+> <_+>
    <6> <6+> s <5/> s4
    <_>4 <_>8 <6+> <6> s
    s4 <5/> <7>
    s2.
    <9 7 _+>2 s4
    <7 _+>4 <4> <3+>
    s2 <6>4
    s8 <6> <6+> s <5/>4
    <_+> <6> s
    \bassFigureExtendersOff <6>8 <6> \bassFigureExtendersOn <_+>4 <_+>8 s
    <6>4 <_+> s
    s2.  %%%% fine ripresa

}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key la\minor
    \tempo 2 = 50
    s2.*126
    \bar "||"

    }

IIvl = {
    \notypeset
    <<\IIvln \forma>>

}

IIvoce = {
    \new Voice = "vole"
    <<\IIvocen \forma>>
}



IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}




IIIvln = \relative do'' {

    R1
    r4 mi, sol sol8 mi
    si'4. si8 sol4 mi

    %4
    r si' red-+ red8 si
    fad'2 r
    r sol4. sol8

    %7
    sol2 r
    r4 re,8\dolce(mi) fad[(sol)] la(fad)
    si(do) re[(si)] do(mi,) fad[(sold)]

    %10
    la(mi) fad[(sol)] fad(mi) re4\mbreak
    r4 re'\fort sol8. \tuplet 3/2 { la32(sol la) } la8.-+(sol32 la)
    si4.\dolce \tuplet 3/4 { la32(sol fad) } sol8. \tuplet 3/2 { mi32(fad sol) } mi8.-+(fad32 sol)

    %13
    la4. \tuplet 3/4 { sol32(fad  mi) } re4.\tuplet 3/4 { do32(si la) }
    si4. \tuplet 3/4 { re32(do si) } la4._+ sol8\mbreak
    sol4 r8 si\fort^\markup\italic"Gayement" mi4 red-+

    %16
    mi fad8 sol si,4 la8 si
    sol4 mi r2
    R1*3

    %21
    r4 dod' fad8(mi) re[(dod)]
    re(mi) dod[(mi)] re(dod) si[(lad)]
    si(sol') fad[(dod)] dod4.-+ si8

    %24
    si4 r8 fad'\fort si4 fad\mbreak
    re8-+ dod si dod re  mi fad sol
    fad4 mi8-+ re dod4.-+ si8

    %27
    si2 r
    R1*7
    r2 sol4 mi

    %36
    si'4. la16_+ sol fad4._+ mi8
    mi1

}

IIIvocen = \relative do'' {

    \autoBeamOff

    r4 mi8 mi si4 si8 si
    \appoggiatura la16 sol2 r
    r r4 si

    %4
    fad2_+ r
    r fad4 sol8 la\mbreak
    sol4._+ fad8(mi2)

    %7
    r4 do' do4. do8
    do1
    r4 si mi4. re8

    %10
    do[si] la[sol] re'4.(\tuplet 3/4 {  do32 [si do)]}\mbreak
    si2-+ r
    re \appoggiatura do16 si4 \appoggiatura la16 sol4

    %13
    fad1-+
    sol2 sol4 fad\mbreak
    sol2 r

    %16
    R1
    r4 r8 si mi4 red-+
    mi fad8 sol si,4 la8 si

    %19
    sol4_+ mi8 fad sol la si dod\mbreak
    re4 mi8 fad si,4 dod8 re
    lad4-+ fad r dod'

    %22
    fad2~fad8[mi] re[dod]
    re8. dod16 (si2) si8 lad
    si2 r\mbreak

    %25
    R1*2
    fad4 fad8 fad si4. do8
    sold2_+ r4 si

    %29
    re4. re8 r4 do8 si
    do4 \appoggiatura si16 la4 r do8 si\mbreak
    la[(sol fad la] sol4) fad8_+ mi

    %32
    la2 r4 la8 la
    la4.(sol8) sol4(fad8) sol
    fad2_+ fad4 r

    %35
    sol mi si'4. mi8
    mi2 mi4 red
    \appoggiatura red?16 mi1

}

IIItesto = \lyricmode {

    Tout enchan - te_en ces lieux. Ces bois, cet -- te ver -- du -- re, Ce cal -- me_heu -- reux,

    Cette on -- de qui murmu - re Les doux Con -- certs de ces oi -- seaux.

    Je vois par -- tout des Ber -- gers, des Ber -- ge -- res, For -- mer sur le Ga -- zon mille _ danses _ le -- geres, _

    Au son de ten -- dres chalu - meaux.

    Pour contemp - ler leurs jeux, les Fau -- nes, les Dria - des, Les fo -- la -- tres Syl -- vains,

    les ti -- mi -- des Na -- ya -- des sortent _ des forets _ et des Eaux.

}

IIIbcn = \relative do {

    mi1~
    mi~
    mi

    %4
    red~
    red\mbreak
    r2 mi4. mi8

    %7
    mi2 r
    r4 fad8(mi) re(mi) fad[(re)]
    sol(la) si[(sol)] do(re) do[(si)]

    %10
    la(sol) fad[(mi)] re(do) si(la)\mbreak
    sol2 r4 re'
    sol2 r4 sol,

    %13
    do2 r4 do'
    si sol re' re,\mbreak
    sol, r8 sol' sol4 fad

    %16
    sol la8 si red,4 si
    mi2. fad4
    sol fad8 mi red4 si

    %19
    mi r8 si mi fad sol mi\mbreak
    si'4 la sol mi
    fad2 r

    %22
    r4 fad si8(lad) si[(fad)]
    si,(dod) re[(mi)] fad4 fad,
    si2 r4 r8 fad'\mbreak

    %25
    si2 si,4 si8 dod
    re4 mi fad fad,
    si1

    %28
    mi
    sold,
    la4 do'8 si la si la sol\mbreak

    %31
    fad mi red si mi mi fad sol
    dod,2 r4 dod
    red2 mi

    %34
    si2. r16 si la si
    sol2 r
    sol'4 mi si' si,

    %37
    mi,1

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    <5/>1
    s
    s
    <6>
    s4 \bassFigureExtendersOn <5/>4 <5/> <5/>8 <5/>
    <_>4 <_>8 <_>16 s <_>4 <_>8 <6+>
    \bassFigureExtendersOff s8 <6> <6> \bassFigureExtendersOn <6+> <_>4 <_>8 <_>
    s1*2
    <6 4 2>2 <4>4 <4>8 s
    <6>4 <6>8 s <4>4 <3>
    s2 <6>4 <6+>
    <6>4 <6>8 <6>16 s
    <6>4 <_+>
    s2. <6+>4
    <6> <6+> <5/>4 <5/>8 s
    s4 s8 <_+> <_>4 <_>8 <_>
    s4 <6 _+>8 s <6>4 <6+ 5>
    <_+>1
    s4 <_+> s8 <5/> s <_+>
    s <6+> <6> s <4>4 <3+>
    s2 s4 s8 <_+>
    s2 s4 s8 <6+ 5/>
    <6>4 <6+ 5> <4> <3+>
    <_+>2 s
    <_+>1
    <6 5/>
    <_>4 <_>8 <_> s4 s8 <6>
    <6+>4 <6 5/> s <6+>8 <6>16 s
    <6>2 <6>4 <6>8 s
    <5/>2 s
    <_+>2. <_+>8 <_+>16 <_+>
    <6>2 s
    <6> <4>4 <3+>
    <_+>1

}


forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \key mi\minor
    \tempo 2 = 50
    s1*14%\break
    \tempo 2 = 80
    s1*23
    \bar "||"

}

IIIvl = {
    \notypeset
    <<\IIIvln \forma>>

}

IIIvoce = {
    \new Voice = "tout"
    <<\IIIvocen \forma>>
}



IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}




IVvln = \relative do'' {

    si'4_\markup\italic "Flûtes"
    sold4.-+ sold8 la sold
    fad2-+ mi4
    la la4.(sold16-+ fad)

    %4
    fad4 r8 fad sold-+ la
    si4 r8 sold la si
    red,8.-+ dod16(si4) sold'~

    %7
    sold8 \tuplet 3/2 { fad16(mi fad) } red4.-+ mi8\mbreak
    mi2 r4
    R2.

    %10
    r4 r mi
    la la4.(sold16-+ fad)
    fad2-+ r4

    %13
    r si,8(dod) si4
    r si mi\mbreak
    red2-+ si4

    %16
    dod8.(red16) red4.-+(dod16 red)
    mi2 red4
    mi8.(fad16) fad4.-+(mi16 fad)

    %19
    sold8.\tuplet 3/2 { la32 (sold la) } si8.(mi,16) mi4
    R2.*3
    fad4 fad4.(mi16-+ red)

    %24
    red4. mi8 dod red
    lad4._+ sold8(fad4)
    r si'8(lad) si4

    %27
    r dod8(si) si8.\tuplet 3/2 { si32(la sold) }\mbreak
    fad8 si si4(lad8.-+) si16
    si4 r8 fad sold8.\tuplet 3/2 { fad32(mi red) }

    %30
    mi8.(fad32 sold) la4.(sold16-+ fad)
    fad2-+ r4
    R2.

    %33
    R  %%%% reprise
    r4 r si
    sold4.-+ sold8 la sold

    %36
    fad4.-+ sold8 la si
    mi,2 red4-+
    mi8.(fad16) fad4.-+(mi16 fad)

    %39
    sold8.la16 sold8.la32(sold) sold8. -+\tuplet 3/2 { la32(sold la) }\mbreak %% fine primo sistema p, 11
    si8 la sold fad mi fad
    red4.-+ dod8(si4)

    %42
    R2.
    r4 mi8.(fad32 mi) mi4
    r fad8.\tuplet 3/2 { sold32(fad sold) } fad4

    %45
    r fad8(sold) fad(sold)\mbreak
    red4. \tuplet 3/2 { mi16(red mi) } fad4
    r sold8 la si4

    %48
    mi,8.(fad16) mi8.\tuplet 3/2 { fad32(mi fad) } fad8.-+ mi32(fad)
    sold8. la32(sold) fad4 si
    sold8-+(la) sold(la) si4

    %51
    r mi,8. fad32(mi) mi4\mbreak
    r mi8. \tuplet 3/2 { fad32(mi fad) } mi4~
    mi8. \tuplet 3/2 { red32(dod red) } red4.-+ mi8

    %54
    mi8. sold16 sold8.-+ fad32(mi) sold8.-+\tuplet 3/2 { la32(sold la) }
    si8. mi,16 la8. si32(la) la8. red,16
    sold8.\tuplet 3/2 { fad32(mi fad) } fad4.-+ mi8\mbreak

    %57
    mi2.  %%%% fine ripresa
    r4 r r8 mi
    mi red dod si la sold

    %60
    fad4 fad'4. \tuplet 3/2 { sold16(fad mi) }
    red4 sold8(fad) mi-+(red)\mbreak
    mi (red) dod[(sold')] la(mid)

    %63
    fad(dod) fad[(mi)] re(dod)
    re4 dod8(red) dod[(si)]
    la(si) la[(sold)] fad4

    %66
    r mi'8(red) mi4\mbreak
    r mi8(fad) mi4~
    mi8(re) dod[(si)] la(sol)

    %69
    fad4 fad'8 fad sold la
    sold4.-+ \tuplet 3/2 { fad16(mi re) } dod8.\tuplet 3/2 { si32(la sold) }
    fad8 la la4(sold8._+) la16\mbreak

    %72
    la8 si dod red mi fad
    sold fad sold[la] si la16 sold
    fad4 si, si'~

    %75
    si8.\tuplet 3/2 { la32(sold fad) } mi4 r
    R2.^\markup\italic"Reprise"

    %77
    r4 r si'
    sold4.-+ sold8 la sold
    fad4.-+ sold8 la si

    %80
    mi,2 red4-+
    mi8.(fad16) fad4.-+(mi16 fad)
    sold8.la16 sold8.la32(sold) sold8. -+\tuplet 3/2 { la32(sold la) }\mbreak %% fine primo sistema p, 11

    %83
    si8 la sold fad mi fad
    red4.-+ dod8(si4)
    R2.

    %86
    r4 mi8.(fad32 mi) mi4
    r fad8.\tuplet 3/2 { sold32(fad sold) } fad4
    r fad8(sold) fad(sold)\mbreak

    %89
    red4. \tuplet 3/2 { mi16(red mi) } fad4
    r sold8 la si4
    mi,8.(fad16) mi8.\tuplet 3/2 { fad32(mi fad) } fad8.-+ mi32(fad)

    %92
    sold8. la32(sold) fad4 si
    sold8-+(la) sold(la) si4
    r mi,8. fad32(mi) mi4\mbreak

    %95
    r mi8. \tuplet 3/2 { fad32(mi fad) } mi4~
    mi8. \tuplet 3/2 { red32(dod red) } red4.-+ mi8
    mi8. sold16 sold8.-+ fad32(mi) sold8.-+\tuplet 3/2 { la32(sold la) }

    %98
    si8. mi,16 la8. si32(la) la8. red,16
    sold8.\tuplet 3/2 { fad32(mi fad) } fad4.-+ mi8\mbreak
    mi2.  %%%% fine ripresa

}

IVvocen = \relative do'' {

    \autoBeamOff

    r4
    R2.*6
    r4 r si\mbreak
    sold4._+ sold8 la sold

    %9
    fad2_+ mi4
    si'2 r4
    R2.

    %12
    r4 r si
    sold4._+ sold8 la sold
    fad2_+ mi4\mbreak

    %15
    si'2 r4
    R2.
    r4 r si

    %18
    dod8.[red16] red4.-+(dod16 [red)]
    mi2 sold,8 sold
    dod2 mi4

    %21
    re dod si\mbreak  %%% fine secondo sistema pagina 10
    lad4._+ sold8(fad4)
    dod'8. re16 re4.(dod16-+ [si)]

    %24
    si4. dod8 lad-+ si
    \appoggiatura si16 dod2.
    fad4. mi8 red4

    %27
    mi2 r8 dod\mbreak
    red mi red4(dod)-+
    si2 r4

    %30
    R2.
    r4 r si
    sold4._+ sold8 la sold

    %33
    fad2_+ mi4\mbreak %%% ripresa
    si'2 r4
    r r mi

    %36
    red4.-+ mi8 fad sold
    dod,2 si4
    dod8.[red16] red4.-+( dod16[red)]

    %39
    mi2 r4\mbreak
    r r sold,8 la
    si2 sold4

    %42
    la la si
    \appoggiatura si16 dod4. si8(la4)
    dod8 red mi4.(red16-+ dod)

    %45
    red4.-+ mi8 red-+ mi\mbreak
    \appoggiatura mi16 fad2 r4
    si,4. la8 sold4

    %48
    dod2 r8 red
    si mi mi4(red)
    \appoggiatura red16 mi2.

    %51
    si4. la8 sold4\mbreak
    la2 r8 la
    si dod sold4(fad)

    %54
    mi2 r4
    R2.*2
    r4 r r8 mi'  %%% fine ripresa

    %58
    mi[fad mi red dod-+ si](
    dod2) r8 dod
    fad8.[mi16](red8.)[mi32 (red] dod8.)[\tuplet 3/2 { mi32(red dod)] }(

    %61
    sid4.-+) sid8 dod red\mbreak
    sold,2 dod8 sold
    la2 si8 dod

    %64
    sold la la4(sold_+)
    fad2 r8 si
    sold2_+ r8 mi\mbreak

    %67
    si'4 si dod8 re
    dod2.-+
    fad8 mi re[dod] si[la]

    %70
    mi'4.(\tuplet 3/2 { re16[dod si)] } la8 si
    dod4(si2-+)\mbreak
    la r4

    %73
    r r mi'
    red2-+ si4
    sold4._+ sold8 la sold

    %76
    fad2_+ mi4\mbreak %%% ripresa
    si'2 r4
    r r mi

    %79
    red4.-+ mi8 fad sold
    dod,2 si4
    dod8.[red16] red4.-+( dod16[red)]

    %82
    mi2 r4\mbreak
    r r sold,8 la
    si2 sold4

    %85
    la la si
    \appoggiatura si16 dod4. si8(la4)
    dod8 red mi4.(red16-+ dod)

    %88
    red4.-+ mi8 red-+ mi\mbreak
    \appoggiatura mi16 fad2 r4
    si,4. la8 sold4

    %91
    dod2 r8 red
    si mi mi4(red)
    \appoggiatura red16 mi2.

    %94
    si4. la8 sold4\mbreak
    la2 r8 la
    si dod sold4(fad)

    %97
    mi2 r4
    R2.*3%%% fine ripresa

}

IVtesto = \lyricmode {

    Chan -- tez, doux Rossi - gnols chan -- tez, Chan -- tez, doux Rossi - gnols chan -- tez,

    Chan -- tez, chan -- tez, Apre - nez aux cœurs sans ten -- dres -- se,

    Tous les plai -- sirs que vous gou -- tez, Quand de ses traits l'A -- mour vous bles -- se.

    Chan -- tez, doux Rossi - gnols chan -- tez, Chan -- tez, doux Rossi - gnols chan -- tez, chan -- tez,

    Apre - nez aux cœurs sans ten -- dres -- se, Tous les plai -- sirs que vous gou -- tez,

    Quand de ses traits l'A -- mour vous bles -- se, Quand de ses traits l'A -- mour vous bles -- se.

    Cou -- lez, cou -- lez char -- mants Ruis -- seaux, ar -- ro -- sez cette ai -- mable _ plai -- ne.

    Heureux, _ qui peut com -- me vos Eaux, suivre _ le pen -- chant qui l'en -- trai -- ne.

    Chan -- tez, chan -- tez, doux Rossi - gnols chan -- tez, Chan -- tez, doux Rossi - gnols chan -- tez,

    chan -- tez, Apre - nez aux cœurs sans ten -- dres -- se, Tous les plai -- sirs que vous gou -- tez,

    Quand de ses traits l'A -- mour vous bles -- se, Quand de ses traits l'A -- mour vous bles -- se.

}

IVbcn = \relative do {

    \clef tenor r4
    r r mi'
    red4.-+ red8 mi red
    dod4 red mi

    %4
    si4. si8 si la
    sold4. sold8 fad mi
    la2 sold4

    %7
    la si si,\mbreak
    mi2 r4
    R2.

    %10
    \clef bass\key mi\major r4 r dod'
    red mi mi,
    si'4. la8 sold-+ fad
    mi2 mi4

    %14
    red2 dod4\mbreak
    si2 si'4
    la fad2-+

    %17
    mi r4
    R2.
    r4 mi'4.(re8)

    %20
    dod si lad2
    si4 la sol\mbreak
    fad2 r4

    %23
    fad2 r4
    sol4. mi8 fad fad,
    si4 \clef tenor \key mi\major fad''4. mi8

    %26
    red4. dod8 si4
    lad2 r4\mbreak
    si8 mi, fad2

    %29
    si, si'4
    dod red mi
    si8 dod si la sold fad

    %32
    mi2 mi'4
    red2 dod4\mbreak %%% ripresa
    si2 r4

    %35
    R2.*2
    \clef bass\key mi\major r4 r si
    la fad2-+

    %39
    mi r4\mbreak
    R2.
    r4 si'8 dod re4

    %42
    dod dod si
    la2 r4
    lad2 r4

    %45
    si2 r4\mbreak
    r4 si la
    sold4. fad8 mi4

    %48
    la2 r4
    sold8 mi si'4 si,
    mi2 r4

    %51
    re2 r4\mbreak
    dod2 r8 dod
    sold la si2

    %54
    mi mi'4
    red dod si
    la si si,\mbreak


    %57
    mi,2. %%% fine ripresa
    r4 r r8 mi'
    la8 si la sold fad mi

    %60
    red2 r8 red
    sold fad mi red dod sid\mbreak
    dod(sold') dod[(si)] la si16(dod)

    %63
    fad,8(mi) re[(dod)] si(la)
    si4 dod2
    fad,4 fad'8(mi) red(si)

    %66
    mi(si) mi[(fad)] mi(fad)\mbreak
    sold (fad) mi[(re)] dod(si)
    la4 la'8(sol) fad(mi)

    %69
    re dod si la sold! fad
    mi2 fad8 mi
    re4 mi2\mbreak

    %72
    la8 sold la si dod red
    mi red mi fad sold la
    si la si dod red si

    %75
    mi2 mi4
    red2 dod4\mbreak %%% ripresa
    si2 r4

    %78
    R2.*2
    r4 r si
    la fad2-+

    %82
    mi r4\mbreak
    R2.
    r4 si'8 dod re4

    %85
    dod dod si
    la2 r4
    lad2 r4

    %88
    si2 r4\mbreak
    r4 si la
    sold4. fad8 mi4

    %91
    la2 r4
    sold8 mi si'4 si,
    mi2 r4

    %94
    re2 r4\mbreak
    dod2 r8 dod
    sold la si2

    %97
    mi mi'4
    red dod si
    la si si,\mbreak

    %100
    mi,2. %%% fine ripresa

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2.
    <6>
    <6>4 <5/>2
    s <6>8 <6>
    <6>2 <6>4
    <6 4\+ 2>2 <6>4
    <7 5>2.
    s
    s
    s2 <6>4
    <5/> <4> <3>
    \bassFigureExtendersOn <_>2 <_>8 s
    s2.
    <6>2 <6+>4
    s2.
    s4  <6>2
    s2.*3
    <6>8 <6> <5/>2
    <_!>4 <6>8 s <6>4
    <_+>2.
    <5>4 <6! _!> s
    s4. <6 _!>8 <7 _+> s
    <_+>4 <_+>4. <_+>8
    <6>4. <6+>8 s4
    <6 5/>2.
    s8 <6 5> <4>4 <3+>
    s2.
    <6>4 <5/> s
    <_>4 <_> <_>8 <_>
    s2.
    <6>2 <6+>4  %%%% ripresa
    s2.*3
    s2 <6 5>4
    s <6>2
    s2.*2
    s2 <6 4\+>8 s
    <6>4 s <6 _!>
    s2.
    <5/>
    s
    s4 <_>4 <_>8 s
    <6>4 s8 <6> s4
    s2.
    <6>4 <4 > <3>
    s2.
    <6 4\+ 2>2 s4
    \bassFigureExtendersOff <6>2.
    <6>8 <6 5> <4>4 <3>
    s2.
    <6>4 <6> <7>
    <7> <4> <3>
    s2.  %%% fine ripresa
    s
    \bassFigureExtendersOn
    <_>2 <_>8 <_>
    s2.
    <_+>4 <_+>8 <6+> s <5/>
    s4 <_+> <6>8 <_+>
    s2 <_!>8 <6>16 s
    <6 5 _!>8 <7> <4>4 <3+>
    <_>4 <_>8 <_> <5/>4
    <_>2 <_>8 <_>
    <6>4 \bassFigureExtendersOff s8 <6> <6> <6 _!>
    \bassFigureExtendersOn <_>2 <_>8 <_>
    \bassFigureExtendersOff s4 <_!>8 <6> <6> <6>
    <7!>2 <5>8 <6>
    <7 5>4 <4> <3>
    \bassFigureExtendersOn <_>2 <_>8 <_>16 s
    <_>2 <_>8 <_>16 s
    <_>2 <_>8 <_>16 s
    s2.
    <6>2 <6+>4  %%%% ripresa
    s2.*3
    s2 <6 5>4
    s <6>2
    s2.*2
    s2 <6 4\+>8 s
    <6>4 s <6 _!>
    s2.
    <5/>
    s
    s4 <_>4 <_>8 s
    <6>4 s8 <6> s4
    s2.
    <6>4 <4 > <3>
    s2.
    <6 4\+ 2>2 s4
    \bassFigureExtendersOff <6>2.
    <6>8 <6 5> <4>4 <3>
    s2.
    <6>4 <6> <7>
    <7> <4> <3>
    s2.  %%% fine ripresa

}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key mi\major
    \tempo 4 = 75
    \partial 4 s4
    s2.*100
    \bar "||"

}

IVvl = {
    \notypeset
    <<\IVvln \forma>>

}

IVvoce = {
    \new Voice = "chantez"
    <<\IVvocen \forma>>
}


IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset
}




Vvocen = \relative do'' {

    \autoBeamOff

    r4 r8 mi mi8. mi16 do8 mi
    la, la16 sol fa8_+ mi16 fa mi4_+ r8 sol
    sol sol la si do8. do16\mbreak

    %4
    fa8 fa re fa si,8.-+ si16 r8 sol16 sol
    do8.[(\tuplet 3/2 { re32 do re] } mi8.-+) \tuplet 3/2 { fa32[mi fa] } sol8. fa16(mi8) re16[do]
    \appoggiatura do16 re4 r8 sol, sol sol la sib\mbreak

    %7
    la4._+ la16 re si8-+ si16 do
    do8. do16 r8 sol do8. do16 do8 mi
    la,4 la8 sol sol sol16 la\mbreak

    %10
    fad4_+ r8 la la la si-+ do
    \appoggiatura do16 re4 la8 si \appoggiatura la16 sol4 sol8 fad
    sol4 r8 si16 si si8 dod16 re\mbreak

    %13
    dod8.-+ fad16 red8-+ red red mi
    fad8. si,16 r8 si16 si mi8 re16 mi
    dod8-+ dod16 red mi4 mi8 red

    %16
    mi2 mi8 mi16 fa\mbreak
    dod4-+ re re8 mi
    fa4 r8 si, si si

    %19
    si4 re8 si16 re sold,8._+ fad16(mi4)
    r8 mi' do la re4(
    dod8-+) si dod4(si8.-+) la16

    %22
    la2.

}

Vtesto = \lyricmode {

    I -- cy, Cerés _ re -- pand ses thresors _  pre - cieux, Po -- mo -- ne de ses dons nous

    of -- fre les premi - ces, La bril -- lan -- te Flo -- re_a nos  yeux, Presen - te chaque _

    jour de 􏰋nouvel - les de -- li -- ces. A -- prés avoir _ or -- né nos fer -- ti -- les co --

    teaux, Bacchus _ d’un doux nec -- tar en -- ri -- chit nos ton -- neaux  Et l’autom - ne_en ces

    lieux ras -- sem -- ble_au  -- tour des belles, _ Tous les jeunes _ Bergers _ des Hameaux _ d’alen - tour; On ne voit

    point dans ce se -- jour, d'Indi - fe -- rens, ny de Cruel - les, Tout suit les Loix du tendre A -- mour.

}

Vbcn = \relative do {

    la1~
    la4 si do2
    do'4. si8 la4\mbreak

    %4
    fa2 mi
    mi8. re16 do4 si do
    sol2 mi\mbreak

    %7
    fa4. re8 sol4
    do,2. do'4
    dod2~dod4\mbreak

    %10
    re2~re4. do8
    si4 do8 re mi do re re,
    sol2 sol'8 mi\mbreak

    %13
    la8 fad si4. mi,8
    si2 sold4
    la8. fad16 sol8 la si4

    %16
    mi,2~mi8 mi'\mbreak
    la8. sol16 fa4. mi8
    re4 r r

    %19
    fa r mi r
    do2 sold4
    la8 re, mi2

    %22
    la2.

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s4 <6> s2
    s4 <6>8 <6+> s4
    <5> <6> s2
    <6>8. <6>16 s4 <6> s
    s2 <5/>
    s2.
    s1
    <6>2 <5/>4
    <_+>2. <6>8 <6 4+>
    <6>4 <6>8 <6 _+> s <6 5> <4> <3+>
    s2.
    <_+>4 <7 _+>2
    <_+> <6>4
    <_+>8. <6+ 5>16 <6>4 <4>8 <3+>
    <_+>2.
    <_+>4 <6>4. <6+>8
    s2.
    <6 4 3>2 <_+>
    <6> <5/>4
    s8 <6 5> <4>4 <3+>

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 4 = 80
    s1*2
    \time 3/4\once\override Staff.TimeSignature.style = #'single-digit
    s2.*1
    \time 4/4
    s1*3
    \time 3/4\once\override Staff.TimeSignature.style = #'single-digit
    s2.
    \time 4/4
    s1
    \time 3/4\once\override Staff.TimeSignature.style = #'single-digit
    s2.
    \time 4/4
    s1*2
    \time 3/4\once\override Staff.TimeSignature.style = #'single-digit
    s2.*7
    \time 4/4
    s1
    \time 3/4\once\override Staff.TimeSignature.style = #'single-digit
    s2.*3
    \bar "||"

}

Vvoce = {
    \notypeset
    \new Voice = "icy"
    <<\Vvocen \forma>>
}



Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset
}




VIvln = \relative do'' {

    dod4 (re)
    mi2 re4 dod8(si)
    dod4-+ si la8(si) sold[(si)]
    la(si dod re) mi4(fad)
    
    %4
    mi fad8(sold) la4 mi
    dod8(si la si) dod4(re)\mbreak
    dod8(si) la[(sold)] la(si) dod[(re)]
    
    %7
    mi4(mi mi mi)
    mi re8(dod) si(la) si[(sold)]
    la2 r
    
    %10
    r dod4 re
    mi8(re dod si) la4(si)\mbreak
    dod4 si8-+(la) si4 mi,
    
    %13
    la sold8_+(fad) mi4~mi
    mi la mi la
    sold2_+ la8(si) dod[(re)]
    
    %16
    mi4(mi mi  mi)
    mi re8(dod) si(la) si[(sold)]\mbreak
    la2 r
    
    %19
    r dod4 re %%% ^\markup\italic"Reprise"
    mi8(re dod si) la4(si)
    dod si8-+(la) si4 mi,
    
    %22
    la sold8_+(fad) mi4(mi
    mi) la mi la\mbreak
    sold8(re' dod re) mi4 la,
    
    %25
    si2-+ r
    R1*7
    si4(si si si)
    
    %34
    si la8(sold) la4 sold8(fad)\mbreak
    sold4 la8 (sold) fad_+[(mi)] fad(sold)
    mi2 r
    
    %37
    r si'4 dod
    si8(la sold fad) mi4~mi
    mi2 r
    
    %40
    mi'4(mi mi mi)\mbreak
    mi2 mi8[(re)] dod(si)
    
    %42
    dod(re) dod[(si)] la4 dod8 re
    mi4 la, mi sold_+
    la mi la8(si dod re)
    
    %45
    mi4(mi mi mi)\mbreak
    mi re8(dod) si(la) si[(sold)]
    la2 r %%%%% fine ripresa
    
    %48
    R1*3\mbreak
    r4 dod8(si) lad(si) dod[(lad)]
    si4 si8(la?) sold(la) si[(sold)]
    
    %53
    la(si dod re) mi4(mi
    mi) la8(sol) fad[(mi)] re(dod)
    si(la) sold[(fad)] mi4(mi\mbreak
    
    %56
    mi2) r
    r re8(mi) fad[(sol)]
    la4 re dod8(re) mi[(dod)]
    
    %59
    re(mi) fad[(sol)] la4 mi
    dod8-+(si) la[(si)] dod4 re\mbreak
    dod8(si) la[(sold)] la8(si dod re)
    
    %62
    mi4(mi mi mi)
    mi re8(dod) si(la) si[(sold)]
    la2 r
    
    %65
    r^\markup\italic"Reprise" dod4 re %%% ^\markup\italic"Reprise"
    mi8(re dod si) la4(si)
    dod si8-+(la) si4 mi,
    
    %68
    la sold8_+(fad) mi4(mi
    mi) la mi la\mbreak
    sold8(re' dod re) mi4 la,
    
    %71
    si2-+ r
    R1*7
    si4(si si si)
    
    %80
    si la8(sold) la4 sold8(fad)\mbreak
    sold4 la8 (sold) fad_+[(mi)] fad(sold)
    mi2 r
    
    %83
    r si'4 dod
    si8(la sold fad) mi4~mi
    mi2 r
    
    %86
    mi'4(mi mi mi)\mbreak
    mi2 mi8[(re)] dod(si)
    
    %88
    dod(re) dod[(si)] la4 dod8 re
    mi4 la, mi sold_+
    la mi la8(si dod re)
    
    %91
    mi4(mi mi mi)\mbreak
    mi re8(dod) si(la) si[(sold)]
    la2 r %%%%% fine ripresa
    
}

VIvocen = \relative do'' {

    \autoBeamOff
    
    r2
    R1*8
    r2 dod4 re
    mi2 r
    
    %11
    r dod4 re\mbreak
    mi2 re4 dod8 si
    dod4-+ si dod8[si] la[sold]
    
    %14
    la4 dod mi la,
    si2-+ r
    R1*2\mbreak
    
    %18
    r2 dod4 re
    mi2 r %%%%% ripresa
    r dod4 re
    
    %21
    mi2 re4 dod8 si
    dod4-+ si dod8[si] la[sold]
    la4 dod mi la,\mbreak
    
    %24
    si2-+ r
    r si4 dod
    si la8[sold] la4 si
    
    %27
    dod la2 mi4
    la2 la8 si la sold
    fad2_+ sold4 la\mbreak
    
    %30
    si4 sold la8[sold] fad[mi]
    si'4 sold2_+ mi'8 red
    mi4 fad si, mi
    
    %33
    fad2 r4 mi8 red
    mi4 fad si, red-+\mbreak
    mi2 r
    
    %36
    r si4 dod
    si2 r
    r si4 dod
    
    %39
    si2 re4 dod8 si
    dod4-+ si dod8[si] la[sold]
    la4 si dod8[si] la[sold]
    
    %42
    la4 dod8 re mi2~
    mi4 re8[dod] re[dod] si[la]
    la2 r
    
    %45
    R1*2
    r2 dod4 si %%%% fine ripresa
    dod re dod4. si8
    
    %49
    la4-+ \appoggiatura sold16 fad2 dod'4
    re re8 dod si4.-+ dod8\mbreak
    dod2 fad4. mi8
    
    %52
    red4-+ si mi4. red8
    dod4-+ \appoggiatura si16 la2 dod4
    mi2 re8 dod si dod
    
    %55
    sold2_+ si4 dod8 re\mbreak
    dod2-+ re4. mi8
    fad4 \appoggiatura mi16 re4 re la
    
    %58
    \appoggiatura sol16 fad8 mi[re mi] mi4._+ re8
    re2 r
    R1*4
    
    %64
    r2 dod'4 re
    mi2 r %%%%% ripresa
    r dod4 re
    
    %67
    mi2 re4 dod8 si
    dod4-+ si dod8[si] la[sold]
    la4 dod mi la,\mbreak
    
    %70
    si2-+ r
    r si4 dod
    si la8[sold] la4 si
    
    %73
    dod la2 mi4
    la2 la8 si la sold
    fad2_+ sold4 la\mbreak
    
    %76
    si4 sold la8[sold] fad[mi]
    si'4 sold2_+ mi'8 red
    mi4 fad si, mi
    
    %79
    fad2 r4 mi8 red
    mi4 fad si, red\mbreak
    mi2 r
    
    %82
    r si4 dod
    si2 r
    r si4 dod
    
    %85
    si2 re4 dod8 si
    dod4-+ si dod8[si] la[sold]
    la4 si dod8[si] la[sold]
    
    %88
    la4 dod8 re mi2~
    mi4 re8[dod] re[dod] si[la]
    la2 r
    
    %91
    R1*3

}

VItesto = \lyricmode {
  
  Doux Ec -- chos,  Doux Ec -- chos, de nos Mu -- set -- tes Re -- pe -- tez les tendres _ sons,
  
  Doux Ec -- chos,  Doux Ec -- chos, de nos Muset - tes Re -- pe -- tez les tendres _ sons,
  
  Et que les dou -- ceurs parfai - tes, Des biens dont nous jouïs - sons, soient tou -- 
  
  jours dans ces re -- traites _ Le su -- jet de vos chan -- sons, Le su -- jet de vos chan -- 
  
  sons,
  
  Doux Ec -- chos,  Doux Ec -- chos, de nos Muset - tes Re -- pe -- tez les tendres _ sons,
  
  Re -- pe -- tez les tendres _ sons.  %%%%%%%fine ripresa
  
  Que ces lieux sont fa  -- vo -- ra -- bles, Aux feux des Amans _ dis -- 
  
  crets; Ces a -- zi -- les se -- cou -- ra -- bles, Ces bois, ce
  
  fueil -- lage Epais, _  A des re -- gards im -- pla -- ca -- bles Cachent _ 
  
  leurs plai -- sirs se -- crets.
  
  Doux Ec -- chos,  Doux Ec -- chos, de nos Muset - tes Re -- pe -- tez les tendres _ sons,
  
  Et que les dou -- ceurs parfai - tes, Des biens dont nous jouïs - sons, soient tou -- 
  
  jours dans ces re -- traites _ Le su -- jet de vos chan -- sons, Le su -- jet de vos chan -- 
  
  sons,
  
  Doux Ec -- chos,  Doux Ec -- chos, de nos Muset - tes Re -- pe -- tez les tendres _ sons,
  
  Re -- pe -- tez les tendres _ sons. 
 
}

VIvcn = \relative do {

    la'4_\markup\italic "Violoncel" (si)
    dod si8-+(la) si4 mi,
    la mi la(si)
    dod8(si la si) dod4(re)

    %4
    dod8(si la si) dod(si) la[(sold)]
    la4(la la la)\mbreak
    la mi la(si)

    %7
    dod8(si la sold) la(si dod re)
    dod4 si8-+(la) mi4 mi,
    la2 r

    %10
    r la'4 si
    dod8[(si)] la(sold) la4 re,\mbreak
    la1
    r2 la'4 si

    %14
    dod8(si) la[(sold)] la4 la
    mi2 la4(si)
    dod8(si la sold) la(si dod re)

    %17
    dod4 si8-+(la) mi4 mi,
    la2 r
    r la'4(si)  %%% reprise

    %20
    dod8(si) la[(sold)] la4 re,
    la1
    r2 la'4 si

    %23
    dod8(si) la[(sold)] la4~la\mbreak
    mi(mi mi mi)
    mi2 r

    %26
    mi4. re8 dod4 si
    la2 la'8 si la sold
    fad2. fad4

    %29
    si8 dod si la sold4 fad\mbreak
    mi2. mi4
    red mi8[(fad)] sold(la) sold[(fad)]

    %32
    mi4 red mi~mi
    si si'8 la sold[la] sold fad
    mi4 la si si,\mbreak

    %35
    mi la, si2
    mi, r
    r2 mi'4 la

    %38
    mi2 mi4 la
    mi(mi mi mi)
    la mi la si\mbreak

    %41
    dod8(si) la[(sold)] la4 mi
    la8(sold) la[(si)] dod4 la,8 si
    dod4 re mi  mi,

    %44
    la1
    la'8(si) dod[(re)] dod(si) la[(si)]\mbreak
    dod4 si8(la) mi4 mi,

    %47
    la2 la'8(si) sold[(si)]  %%% fine ripresa
    la4 si dod dod,
    fad fad8 sold la4 fad

    %50
    si si,8 dod re2\mbreak
    dod r4 fad
    si,2 r4 mi

    %53
    la,2 la'4~la
    dod,~dod re~re
    mi mi8 fad sold4 mi\mbreak

    %56
    la8 si la sold fad sol fad mi
    re2 re4 re
    re8(mi) fad[(sol)] la4 la,

    %59
    re,2 fad'4 (sol)
    la(la la la)\mbreak
    la mi la(si)

    %62
    dod8(si) la[(sold)] la(si) dod[(re)]
    dod4 si8(la) mi4 mi,
    la2 r

    %65
    r la'4(si)  %%% reprise
    dod8(si) la[(sold)] la4 re,
    la1

    %68
    r2 la'4 si
    dod8(si) la[(sold)] la4~la\mbreak
    mi(mi mi mi)

    %71
    mi2 r
    mi4. re8 dod4 si
    la2 la'8 si la sold

    %74
    fad2. fad4
    si8 dod si la sold4 fad\mbreak
    mi2. mi4

    %77
    red mi8[(fad)] sold(la) sold[(fad)]
    mi4 red mi~mi
    si si'8 la sold[la] sold fad

    %80
    mi4 la si si,\mbreak
    mi la, si2
    mi, r

    %83
    r2 mi'4 la
    mi2 mi4 la
    mi(mi mi mi)

    %86
    la mi la si\mbreak
    dod8(si) la[(sold)] la4 mi
    la8(sold) la[(si)] dod4 la,8 si

    %89
    dod4 re mi  mi,
    la1
    la'8(si) dod[(re)] dod(si) la[(si)]\mbreak

    %92
    dod4 si8(la) mi4 mi,
    la2 r

}

VIbcn = \relative do {

    r2
    la1~
    la~
    la~

    %4
    la~
    la~
    la~

    %7
    la~
    la2 mi'4 mi,
    la2 r

    %10
    la1~
    la~\mbreak
    la

    %13
    la~
    la
    mi2 r

    %16
    la1~
    la2 mi'4 mi,\mbreak
    la2 r

    %19
    R1  %%%%%ripresa
    la~
    la~

    %22
    la~
    la\mbreak
    mi~

    %25
    mi
    mi'4. re8 dod4 si
    la2 la'8 si la sold
    fad2. fad4

    %29
    si8 dod si la sold4 fad\mbreak
    mi2. mi4
    red mi8[(fad)] sold(la) sold[(fad)]

    %32
    mi4 red mi~mi
    si si'8 la sold[la] sold fad
    mi4 la si si,\mbreak

    %35
    mi la, si2
    mi, r
    mi1~

    %38
    mi~
    mi
    la~

    %41
    la~
    la2 r4 la8 si
    dod4 re mi mi,

    %44
    la1~
    la~\mbreak
    la2 mi'4 mi,

    %47
    la2 la'8(si) sold[(si)]  %%% fine ripresa
    la4 si dod dod,
    fad fad8 sold la4 fad

    %50
    si si,8 dod re2\mbreak
    dod r4 fad
    si,2 r4 mi

    %53
    la,2 la'4~la
    dod,~dod re~re
    mi mi8 fad sold4 mi\mbreak

    %56
    la8 si la sold fad sol fad mi
    re2 re4 re
    re8(mi) fad[(sol)] la4 la,

    %59
    re,2 r
    la'1~
    la~

    %62
    la~
    la2 mi'4 mi,
    la2 r

    %65
    R1  %%%%%ripresa
    la~
    la~

    %68
    la~
    la\mbreak
    mi~

    %71
    mi
    mi'4. re8 dod4 si
    la2 la'8 si la sold

    %74
    fad2. fad4
    si8 dod si la sold4 fad\mbreak
    mi2. mi4

    %77
    red mi8[(fad)] sold(la) sold[(fad)]
    mi4 red mi~mi
    si si'8 la sold[la] sold fad

    %80
    mi4 la si si,\mbreak
    mi la, si2
    mi, r

    %83
    mi1~
    mi~
    mi

    %86
    la~
    la~
    la2 r4 la8 si

    %89
    dod4 re mi mi,
    la1~
    la~\mbreak

    %92
    la2 mi'4 mi,
    la2 r

}

VIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown
    
    s2
    s1*18
    s1*7  %%% ripresa
    <_>4. <_>8 <6>8 s <6>4
    s2 <_>4 <_>8 <_>
    s1
    <_+>4 <_+>8 <_+> <6>4 <6+>
    s1
    <6>4 <_> <_>8 <_> s <6+>
    s4 <5/>2.
    <_+>4 <_+>8 <_+> <6>4 s8 <6+>
    s4 <6 5> <4> <3+>
    s4 <6 5> <4> <3+>
    s1*7
    <6>8 s <6 5>4 <4> <3>
    s1*3
    s2 <6>4 <6+>  %%%fine ripresa
    <6>8 s <6 5>4 <4> <3+>
    <_>2. <_>8 s
    s4 s8 <_+> <6>2
    <_+> s4 <_+>8 s
    <_+>1
    s
    <5/>2 s4 <6>
    <_>2. <_>8 s
    <_>4. <_>8 <6>4 s8 <6 _!>
    s1
    <_>4. <_>8 s2
    s1*6
    s1*7  %%% ripresa
    <_>4. <_>8 <6>8 s <6>4
    s2 <_>4 <_>8 <_>
    s1
    <_+>4 <_+>8 <_+> <6>4 <6+>
    s1
    <6>4 <_> <_>8 <_> s <6+>
    s4 <5/>2.
    <_+>4 <_+>8 <_+> <6>4 s8 <6+>
    s4 <6 5> <4> <3+>
    s4 <6 5> <4> <3+>
    s1*7
    <6>8 s <6 5>4 <4> <3>
    s1*4

}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \key la\major
    \tempo 2 = 55
    \partial 2 s2
    s1*64
    s1*29
    \bar "|."

}

VIvl = {
    %\notypeset
    <<\VIvln \forma>>

}

VIvoce = {
    \new Voice = "doux"
    <<\VIvocen \forma>>
}


VIvc = {
    \clef bass
    <<\VIvcn \forma >>
}


VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset
}
#(set-global-staff-size 17)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \header {
        title = \markup\smaller {"Cantata ”Les plaisirs de la Campagne”"}
        %subsubtitle = \markup\tiny#(string-append "  ")
        composer = \markup \center-column{"A. Campra (1660-1744)"}
    }

    \paper {

        systems-per-page = #5

    }

    \markup \huge {"[1.] Gracieusement et Mesuré"}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \time 4/4\key la\major  r4^\markup\center-align"Violons"_\markup\center-align"Flûtes"}
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \Ivl \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \time 4/4 \key la\major  r1}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce \global
                \new Lyrics \lyricsto "que" \Itesto
            >>

            \new Staff = "main"
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup  \center-column{"Basse"\vspace #-0.2"Continue"}
                \set Staff.midiInstrument = #"cello"
                \Ibc \global
            >>
        >>

        \layout {

            indent = 2.3\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {"[2.] Ariette - Legerement et moderé"}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IIvl \global
            >>

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIvoce \global
                \new Lyrics \lyricsto "vole" \IItesto
            >>

            \new Staff = "main"
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \IIbc \global
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {"[3.] Récitatif Mesuré "}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IIIvl \global
            >>

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIIvoce \global
                \new Lyrics \lyricsto "tout" \IIItesto
            >>

            \new Staff = "main"
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \IIIbc \global
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {"[4.] Air. Tendrement "}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IVvl \global
            >>

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IVvoce \global
                \new Lyrics \lyricsto "chantez" \IVtesto
            >>

            \new Staff = "main"
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \IVbc \global
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = #7

    }

    \markup \huge {"[5.] Récitatif "}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Vvoce \global
                \new Lyrics \lyricsto "icy" \Vtesto
            >>

            \new Staff = "main"
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \Vbc \global
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {

        systems-per-page = #4

    }

    \markup \huge {"[6.] Air de Musette. Gracieusement et point vite"}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \VIvl \global
            >>

            \new Staff <<
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \VIvoce \global
                \new Lyrics \lyricsto "doux" \VItesto
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \VIvc \global
            >>

            \new Staff = "main"
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"harpsichord"
                \VIbc \global
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}

