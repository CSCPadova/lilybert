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



Isopranon = \relative do'' {

    \autoBeamOff

    r4 r8 la fad4. la8
    re,4 re r r8 re'
    si4. re8 sol,4 sol

    %4
    r8 sol sol sol\mbreak si4 si8 la
    la4 la la8 la la la16 si
    sol8 sol r mi16 fad sol4 sol8 fad

    %7
    fad4 fad\mbreak la8 la r16 la re la
    si4 r8 si si4 dod8 re
    dod la r fad' re4. dod8(

    %10
    re2) r4 mi8 mi16 mi\mbreak
    dod8 dod r dod dod dod re mi
    si si r si si4 si8 dod

    %13
    re re16 re si8 re sold,4 sold8 la
    la4 la\mbreak r8 la dod re
    mi mi r mi16 fad red4 red8 mi

    %16
    mi4 mi si8 si16 si si8 dod
    la la r mi' si2\mbreak
    si4 r8 mi si4~si16[dod si dod]

    %19
    re4 dod8 si dod4(si)
    la1

}

Itesto = \lyricmode {

   Pie -- tà Si -- gnore _ Pie -- tà Si -- gnore _ a le tue piante _ hu -- mi -- le

   Ec -- co_in laccio _ ser -- vile _ quel -- la Tra -- cia che_al -- te -- ra strinse _

   e allen - tò di mil -- le Im -- peri _ il fre -- no, quella _ son io _ che_in bel -- li -- cosa _ schiera _

   e -- spo -- si_au -- da -- ce a mille _ ac -- cia -- ri il se -- no

   Or dal tuo braccio _ debel - la -- ta e vin -- ta anzi _ che vin -- ci -- trice _ io pian -- go

   io pian - go av -- vin -- ta.

}

Ibcn = \relative do {

   re1~
   re2 sol,~
   sol1

   %4
   sol'
   dod,~
   dod

   %7
   re2 fad,
   sol1~
   sol4 fad la2

   %10
   re la~
   la1~
   la~

   %13
   la~
   la
   sold2 fad

   %16
   mi mi'
   dod re4 mi
   fad dod re mi

   %19
   fad mi8 red mi4 mi,
   la1

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*8
    <4 2>4 s <4> s8 <3>
    s1
    s
    <2>
    s
    s
    s2 <6+>
    <_+>1
    s
    <4>4 <3> s2
    s <4>4 <3+>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 35
    s1*16\once \override Score.RehearsalMark.extra-offset = #'(+18 . 0)
    \mark\markup "adag[io]"
    s2 \tempo 4 = 57 s
    s1*3
    \bar "||"

}

Isoprano = {
    \notypeset
    \new Voice = "pietà"
    <<\Isopranon \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}


IIvlIn = \relative do'' {

    R2.*60
    r4 re8 mi fad sol
    la2.
    r4 mi8 re dod mi
    re4 sol sol\mbreak
    fad mi mi
    re2 r4
    r4 dod8 re mi fad
    sold4 sold8 fad mi sold
    fad4 fad8 sold la si
    la4 la sold
    la2.
    r4 mi8 re dod mi\mbreak
    re4 sol sol
    fad mi mi
    re2



}

IIvlIIn = \relative do'' {

    R2.*60
    R2.
    r4 fad,8 sol la si

    %63
    dod4 dod8 si la dod
    si4 si8 dod re mi\mbreak
    re4 re dod

    %66
    re la8 si dod re
    mi2.
    r4 si8 la sold si

    %69
    la4 re re
    dod si si
    la fad8 sol la si

    %72
    dod4 dod8 si la dod\mbreak
    si4 si8 dod re mi
    re4 re dod

    %75
    re2.

}

IIsopranon = \relative do'' {

    \autoBeamOff

    R2.*4
    re,4 fad re
    la'4. la8 la4

    %7
    la dod la
    re4. re8 re4
    R2.

    %10
    re,4 fad re
    la'4. la8 la4
    la dod la

    %13
    re4. re8 re4
    R2.
    re4 dod si

    %16
    dod4. si8 la4
    sold sold8 [la] si4
    la4. la8 la4\mbreak

    %19
    la si si
    dod4. re8 mi4
    re8 [dod] re2

    %22
    dod2.
    r4 si2~
    si4 la4. si8\mbreak

    %25
    dod4(si4.) la8
    la2.\tr~
    la

    %28
    R
    re,4 mi mi
    fad4. sol8 la4

    %31
    sol8 [fad] sol2
    fad2.\mbreak
    r4 mi2~

    %34
    mi4 re4. mi8
    fad4(mi4.) re8
    re2.~

    %37
    re
    R2.*2
    sol4 si sol\mbreak

    %41
    re'4. re8 re4
    re fad re
    sol4. sol8 sol4

    %44
    R2.
    sol4 fad mi
    fad4. mi8 re4

    %47
    dod dod8 [re] mi4\mbreak
    re4. re8 re4
    re mi mi

    %50
    fad4. mi8 re4
    mi8 [fad] sol2
    fad2.

    %53
    r4 mi2~
    mi4 re4. mi8\mbreak
    fad4(mi4.) re8

    %56
    re2.
    r4 mi2~
    mi4 re4. mi8

    %59
    fad4(mi4.) re8
    re2.
    R2.*15

}

IItesto = \lyricmode {

    Per -- do -- no_o Ce -- sare _ so -- spen -- di_i ful -- mini _

    Per -- do -- no_o Ce -- sare _ so -- spen -- di_i ful -- mini _

    ch’or -- mai si can -- giano _  miei van -- ti_e fre -- miti _

    in duo -- lo_e_in ge -- miti _  in duo -- lo in duo -- lo_e_in ge -- mi -- ti,

    ch’or -- mai si can -- giano _ in duo -- lo in duo -- lo_e_in ge -- mi -- ti.

    Per -- do -- no_o Ce -- sare _ so -- spen -- di_i ful -- mini _

    ch’or -- mai si can -- giano _  miei van -- ti_e fre -- miti _ in duo -- lo_e_in ge -- mi -- ti

    in duo -- lo in duo -- lo_e_in ge -- mi -- ti in duo -- lo_e_in ge -- mi -- ti.

}

IIvcn = \relative do {

   r4 re8 mi fad sol
   la4 la8 si dod la
   si4 sol8 la si dod\mbreak

   %4
   re4 sol, la
   re,2.
   r4 re8 mi fad sol

   %7
   la4 la8 si dod la
   si4 sol8 la si dod
   re4 sol, la

   %10
   re,2.
   r4 re8 mi fad sol\mbreak
   la4 la8 si dod la

   %13
   si4 sol8 la si dod
   re4 sol, la
   re,2.

   %16
   r4 la8 si dod re
   mi4 mi8 fad sold mi
   fad4 re8 mi fad sold\mbreak

   %19
   la4 re, mi
   la,2.
   r4 re8 mi fad sold

   %22
   la4 la,8 si dod re
   mi4 mi8 fad sold mi
   fad4 re8 mi fad sold\mbreak

   %25
   la4 re, mi
   la, re8 mi fad sol?
   la4 la8 si dod la

   %28
   si4 sol8 la si dod
   re4 sol, la
   re,2.

   %31
   r4 sol8 la si dod
   re4 re,8 mi fad sol\mbreak
   la4 la8 si dod la

   %34
   si4 sol8 la si dod
   re4 sol, la
   re, sol8 la si do

   %37
   re4 re,8 mi fad re
   mi4 do8 re mi fad
   sol4 do, re

   %40
   sol,2.\mbreak
   r4 sol8 la si do
   re4 re8 mi fad re

   %43
   mi4 do8 re mi fad
   sol4 do, re
   sol,2.

   %46
   r4 re'8 mi fad sol
   la4 la8 si dod? la\mbreak
   si4 sol8 la si dod

   %49
   re4 sol, la
   re,2.
   r4 sol8 la si dod

   %52
   re4 re,8 mi fad sol
   la4 la8 si dod la
   si4 sol8 la si dod\mbreak

   %55
   re4 sol, la
   re, re8 mi fad sol
   la4 la8 si dod la

   %58
   si4 sol8 la si dod
   re4 sol, la
   re,2.

   %61
   R2.
   r4 re8 mi fad sol
   la4 la8 si dod la
   si4 sol8 la si dod\mbreak

   %65
   re4 sol, la
   re,2 r4
   r la8 si dod re

   %68
   mi4 mi8 fad sold mi
   fad4 re8 mi fad sold\mbreak
   la4 re, mi

   %71
   la, re8 mi fad sol?
   la4 la8 si dod la
   si4 sol8 la si dod

   %74
   re4 sol, la
   re,2.

}

IIbcn = \relative do {

   r4 re8 mi fad sol
   la4 la8 si dod la
   si4 sol8 la si dod\mbreak

   %4
   re4 sol, la
   re,2.
   r4 re8 mi fad sol

   %7
   la4 la8 si dod la
   si4 sol8 la si dod
   re4 sol, la

   %10
   re,2.
   r4 re8 mi fad sol\mbreak
   la4 la8 si dod la

   %13
   si4 sol8 la si dod
   re4 sol, la
   re,2.

   %16
   r4 la8 si dod re
   mi4 mi8 fad sold mi
   fad4 re8 mi fad sold\mbreak

   %19
   la4 re, mi
   la,2.
   r4 re8 mi fad sold

   %22
   la4 la,8 si dod re
   mi4 mi8 fad sold mi
   fad4 re8 mi fad sold\mbreak

   %25
   la4 re, mi
   la, re8 mi fad sol?
   la4 la8 si dod la

   %28
   si4 sol8 la si dod
   re4 sol, la
   re,2.

   %31
   r4 sol8 la si dod
   re4 re,8 mi fad sol\mbreak
   la4 la8 si dod la

   %34
   si4 sol8 la si dod
   re4 sol, la
   re, sol8 la si do

   %37
   re4 re,8 mi fad re
   mi4 do8 re mi fad
   sol4 do, re

   %40
   sol,2.\mbreak
   r4 sol8 la si do
   re4 re8 mi fad re

   %43
   mi4 do8 re mi fad
   sol4 do, re
   sol,2.

   %46
   r4 re'8 mi fad sol
   la4 la8 si dod? la\mbreak
   si4 sol8 la si dod

   %49
   re4 sol, la
   re,2.
   r4 sol8 la si dod

   %52
   re4 re,8 mi fad sol
   la4 la8 si dod la
   si4 sol8 la si dod\mbreak

   %55
   re4 sol, la
   re, re8 mi fad sol
   la4 la8 si dod la

   %58
   si4 sol8 la si dod
   re4 sol, la
   re,2.

   %61
   R2.
   r4 re8 mi fad sol
   la4 la8 si dod la
   si4 sol8 la si dod\mbreak

   %65
   re4 sol, la
   re,2 r4
   r la8 si dod re

   %68
   mi4 mi8 fad sold mi
   fad4 re8 mi fad sold\mbreak
   la4 re, mi

   %71
   la, re8 mi fad sol?
   la4 la8 si dod la
   si4 sol8 la si dod

   %74
   re4 sol, la
   re,2.

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*63
    s4 <6 5> s
    s2.*4
    s4 <6 5> <_+>
    s2.*3
    s4 <6 5>

}


forma = {

    \time 3/4
    \key re\major
    \tempo 2 = 60
    s2.*60
    \bar "||"\break\once \override Score.RehearsalMark.extra-offset = #'(+2 . 1)
    \mark\markup"Ritornello"
    s2.*15
    \bar "||"

}

IIvlI = {
    %\notypeset
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIvc = {
    \notypeset
    \clef bass
    <<\IIvcn \forma>>

}

IIsoprano = {
    \new Voice = "perdono"
    <<\IIsopranon \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}




IIIsopranon = \relative do'' {

    \autoBeamOff

    r4 sold4. sold8 sold4
    r sold8 la\mbreak si si si si16 dod
    re8 re r re re re mi si

    %4
    dod dod r dod16 dod dod4 re8 mi\mbreak
    fad fad r16 fad mi fad re8 re r re
    si si dod re dod4(si)

    %7
    la2 r4 dod~
    dod8 dod dod4\mbreak r dod8 re
    mi mi r mi16 mi mi8 fad16 sol dod,4

    %10
    la si8 dod re re r la
    do do do si\mbreak si4 si
    mi fad8 sol lad, [sold16 fad] si4~

    %13
    si lad si2
    r4 red4. red8 red4
    r8 red16 fad si,8 si\mbreak r mi4 mi16 fad

    %16
    re8 re r16 si si dod re8 re re dod
    dod dod r dod mi mi r mi
    fad mi fad dod\mbreak red4 r8 si

    %19
    dod4 red8 mi sold,4(fad)
    mi1

}

IIItesto = \lyricmode {

    Pian -- gono _  li ru -- belli _ On -- gari _ Regni _

    non li tuoi giusti _ sdegni, _ ma quel vin -- dice _ telo _

    ch’a danni _ loro _ han provo - cato_in _ Cie -- lo

    Pian -- gono _ non ché assisa _ la tua Prole _ Real _ mirin _ sul Trono _

    ma piangon _ per de -- si -- o del tuo per -- do - - no.

    Pian -- gono _ ma che dissi? _ ah già re -- spira _

    per tua pie -- tate _ la Pan -- nonia _ ed io _

    viè più che_il suo do -- lor de -- plo -- ro il mi -- o.

}

IIIbcn = \relative do {

    re1~
    re~
    re

    %4
    la
    re~
    re2 mi

    %7
    la, sol~
    sol1~
    sol~

    %10
    sol2 fad~
    fad\mbreak sol4 sol'8 fad
    mi2~mi4 re8 dod16 si

    %13
    fad'2 si,
    la1~
    la2\mbreak sold~

    %16
    sold1
    la
    lad2\mbreak si4 sold

    %19
    la2 si
    mi1

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <4+ 2>1
    s1*4
    <6 4+>2 <4>4 <3+>
    s2 <4 2>
    s1*4
    s2 <4+ 2>4 <6>
    <4> <3> s2
    <4+ 2>1
    s1*4
    s2 <4>4 <3+>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 30
    s1*20
    \bar "||"

}

IIIsoprano = {
    \notypeset
    \new Voice = "piangono"
    <<\IIIsopranon \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}



IVvlIn = \relative do'' {

    R4.*2
    r8 mi fad
    sold mi la~

    %5
    la sold4\mbreak
    fad8 si, si'~
    si la4~

    %8
    la8 sold8. la16
    la4.
    R4.*24

    %34
    r8 mi fad
    sold mi la~
    la sold4

    %37
    fad mi8
    fad si, si'~\mbreak
    si la4

    %40
    sold fad8
    sold fad8. mi16
    mi4.

    %43
    R4.*28
    r8 mi fad
    sold mi la~

    %73
    la sold4
    fad8 si, si'~
    si la4~\mbreak

    %76
    la8 la8. sold16
    la4 mi8\p~
    mi re4~

    %79
    re8 dod si
    dod si4
    la4.

}

IVvlIIn = \relative do'' {

    r8\solo la si
    dod la re~
    re dod4\mbreak

    %4
    si la8
    si mi, mi'~
    mi re4

    %7
    dod si8
    dod si8. la16
    la4.

    %10
    R4.*26
    r8 si dod
    red si mi~

    %38
    mi red4\mbreak
    dod8 fad, fad'~
    fad mi4~

    %41
    mi8 red8. mi16
    mi4.
    R4.*26

    %69
    r8 la, si
    dod la re~
    re dod4

    %72
    si la8
    si mi, mi'~
    mi re4\mbreak

    %75
    dod si8
    dod si4
    la8\p dod si

    %78
    la4 si16 la
    sold8 la4~
    la8 la8. sold16

    %81
    la4.

}

IVsopranon = \relative do'' {

    \autoBeamOff

    R4.*8
    r8 la si
    dod la re~

    %11
    re dod4
    si la8
    R4.*2

    %15
    r8 la si\mbreak
    dod la re~
    re dod4

    %18
    si la8
    sold la4
    si8. si16 dod8~

    %21
    dod re mi
    fad4 mi8
    r re dod\mbreak

    %24
    si4 la8~
    la sold la
    si [mi,] mi'~

    %27
    mi re4
    dod4.
    r8 si dod

    %30
    re4 do8~
    do si8.  la16\mbreak
    la4 sol8~

    %33
    sol fad4
    mi4.
    R4.*7

    %42
    r8 mi fad
    sold mi la~
    la sold4

    %45
    fad mi8
    R4.*2
    r8 mi fad\mbreak

    %49
    sold mi la~
    la sold4
    fad mi8

    %52
    red mi4
    fad8. fad16 sold8~
    sold la si

    %55
    dod4 si8
    r la sold
    fad4 mi8~\mbreak

    %58
    mi red mi
    fad [si,] si'8~
    si la4

    %61
    sold4.
    r8 fad sold
    la4 sol!8~

    %64
    sol fad8. mi16
    mi4 mi'8~
    mi re4~

    %67
    re8 do4~
    do8 si4
    la4.

    %70
    R4.*12

}

IVtesto = \lyricmode {

    Pa -- ce pa -- ce_a que -- sto core _ pa -- ce pa -- ce_a que -- sto core _

    fra tue glo -- rie e -- sul -- ti_il Tra -- ce, gri -- di_ogn’ antro _

    pace _  pa - - ce ah, pie -- tà del mio do -- lo - - re.

    Pa -- ce pa -- ce_a que -- sto core _ pa -- ce pa -- ce_a que -- sto core _

    fra tue glo -- rie e -- sul -- ti_il Tra -- ce, gri -- di_ogn’ antro _

    pace _  pa - - ce ah, pie -- tà del mio do -- lo - - - - re.



}

IVvcn = \relative do {

    r8 la' sold
    la fad si
    sold la la,

    %4
    mi'4 fad8
    red mi4
    si'4.

    %7
    dod4 re8
    mi mi,4
    la4.

    %10
    R4.*24
    r8 mi red
    mi dod fad

    %36
    red mi4
    si' dod8
    lad si4

    %39
    fad4.
    sold4 la8
    si si,4

    %43
    mi4.
    R4.*26
    r8 la sold

    %70
    la fad si
    sold la la,
    mi'4 fad8

    %73
    red mi4
    si4.
    dod4 re8

    %76
    mi mi,4\mbreak
    la8\p la' sold
    fad4 re8

    %79
    mi fad re
    mi mi,4
    la4.

}

IVbcn = \relative do {

    la8 la' sold
    la fad si
    sold la la,

    %4
    mi'4 fad8
    red mi4
    si4.\mbreak

    %7
    dod4 re8
    mi mi,4
    la8 la' sold

    %10
    la fad si
    sold la la,
    r mi' fad

    %13
    sold mi la~
    la sold4
    fad mi8\mbreak

    %16
    la fad si
    sold la la,
    mi' re dod

    %19
    si la4
    sold8 mi la~
    la si dod

    %22
    re re' dod
    si4 la8\mbreak
    sold mi la

    %25
    re, mi fad
    mi4.
    fad8 sold4

    %28
    la8 dod, re
    mi4.
    fad8 sold la

    %31
    re, mi mi,\mbreak
    la' red, mi
    la, si4

    %34
    mi red8
    mi dod fad
    red mi4

    %37
    si dod8
    lad si4
    fad'4.

    %40
    sold4 la8
    si si,4\mbreak
    mi red8

    %43
    mi dod fad
    red mi4
    \clef tenor \key re\major r8 si' dod

    %46
    red si mi~
    mi red4
    dod si8\mbreak

    %49
    \clef bass \key re\major mi, dod fad
    red mi4
    si'8 la sold

    %52
    fad mi4
    red8 si mi~
    mi fad sold

    %55
    la la sold
    fad4 mi8
    red si mi\mbreak

    %58
    la, si dod
    si4.
    dod8 red4

    %61
    mi8  sold la
    si4 si,8
    dod red mib

    %64
    la, si4
    mi?4.
    fad8 si la\mbreak

    %67
    sold la la,
    re mi mi,
    la la' sold

    %70
    la fad si
    sold la la,
    mi'4 fad8

    %73
    red mi4
    si4.
    dod4 re8

    %76
    mi mi,4\mbreak
    la8 la' sold
    fad4 re8

    %79
    mi fad re
    mi mi,4
    la4.

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*2
    <5->8 <5 3> <6>
    <_+>4.
    <6 5>8 <_+>4
    <4>8 <3->4
    <7>8 <6> <6 5>
    <6 4> <5 3+>4
    s4.*3
    s8 <_+>4
    s4.*5
    <_+>4.
    s4.*10
    <_+>4.
    s
    <7- 5>8 <_+>4
    s4 <_->8
    <7 5>4.
    <_+>
    <_+>
    <5->8 <5 _+> <6>
    <_+>4.
    <6 5>8 <_+>4
    <4>8 <3->4
    <7>8 <6> <6 5>
    <6+ 4> <5 3+>4
    s4.*3
    s8 <_+>4
    s4.*21
    s8 <_->4
    <7- 5>8 <_+>4
    <_+>4.
    s4 <_->8
    <5->8 <5 3> <6>
    <_+>4.
    <6 5>8 <_+>4
    <4>8 <3->4
    <7>8 <6> <6 5>
    <6 4> <5 3+>4
    s4 <6>8
    <7> <6->4
    <7 _+>8 <5> <6 5>
    <6 4> <5 3+>4

}


forma = {

    \time 3/8
    \key re\major
    \tempo 4. = 55
    s4.*81
    \bar "||"

}

IVvlI = {
    \notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVsoprano = {
    \new Voice = "pace"
    <<\IVsopranon \forma>>
}

IVvc = {
    \clef bass
    <<\IVvcn\forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset
}





VvlIn = \relative do'' {

    R1*5
    r4 la' la la
    la re, r8 si' la sol\mbreak

    %8
    fad sol fad mi fad mi16 fad sol4~
    sol fad8 sol16 fad mi2
    re r

    %11
    R1
    r4 la' la la
    la re, r2

    %14
    r8 si' la sol fad4 r\mbreak
    r2 r8 la sol fad
    mi4 r r2

    %17
    R1*2
    r2 r4 si'
    si si si mi,

    %21
    r2 r8 dod' si la
    sold4 r r2
    R1*2

    %25
    r4 la la la
    la re, r2
    r8 si' la sol\mbreak fad4 r

    %28
    r8 la sol fad mi fad mi re
    dod la r4 mi' r
    re r la' r

    %31
    r8 re dod si la si la sol
    fad re r4\mbreak la' r
    sol r re' r

    %34
    R1*2
    r2 r8 re dod si
    la si la sol fad4 r

    %38
    R1
    r8 la sol fad mi [fad mi8. re16]
    re4 r r2

}

VvlIIn = \relative do'' {

    R1*5
    r2 r4 re
    re re re sol,

    %8
    r8 mi' re dod re dod16 re mi8 re
    dod si16 dod re2 dod4
    re2 r

    %11
    r r4 mi
    mi mi mi la,
    r2 r8 sol' fad mi\mbreak

    %14
    re4 r r2
    r r8 fad mi re
    dod4 r r2

    %17
    R1*2
    r4 fad fad fad
    fad si, r2

    %21
    r8 la' sold fad mi4 r
    R1*2\mbreak
    r2 r4 mi

    %25
    mi mi mi la,
    r2 r8 sol' fad mi
    re4 r r2

    %28
    r r8 la' sol fad
    mi fad mi re dod4 la\mbreak
    r fad' r2

    %31
    r r8 re' dod si
    la si la sol fad4 re
    r si' r2

    %34
    R1*2
    r8 fad mi re dod re4 mi8
    fad si,4 dod8\mbreak re4 r

    %38
    R1
    r8 fad mi re dod[re dod8. re16]
    re4 r r2

}

Vsopranon = \relative do'' {

    \autoBeamOff

    r4 la8 la re8. re16 re8 dod
    re re r8 la do4. si8\mbreak
    si4 si r si8 si

    %4
    mi8. mi16 mi8 re mi mi r si
    re4. dod8 dod4 dod
    R1*3

    %9
    r2 r4 la
    la la la re,
    r8 re' dod si dod re si4

    %12
    la r\mbreak r2
    r4 re re re
    re sol, r8 sol' fad mi

    %15
    fad sol mi4 re r
    r2 r8 mi re dod
    si16 [la si dod] si [mi re mi] dod [si dod re] dod [fad mi fad]

    %18
    re [dod re mi] re [si dod re] mi [fad sol fad] mi [re dod si]
    lad8 si re8. dod16(\mbreak si4) r
    r2 r4 mi

    %21
    mi mi  mi la,
    r8 la sold fad mi16[re mi fad] mi[la sold? la]\mbreak
    fad[mi fad sol] fad[si la si] sold[fad sold la] sold[mi fad sold]

    %24
    la[si dod si] la[dod si dod] re8 dod si4
    la r r2
    r4 re re re

    %27
    re sol, r8 re fad sold
    la1~
    la~

    %30
    la2 r8 la si dod\mbreak
    re1~
    re~

    %33
    re2 r16 re [dod si] la[re dod re]
    si[la si dod] si[mi re mi] dod[si dod re] dod[la si dod]\mbreak
    re[mi fad mi] re[fad mi fad] sol8 fad mi4

    %36
    re r r2
    r r8 re mi fad
    sol fad mi4 re r\mbreak

    %39
    R1*2

}

Vtesto = \lyricmode {

    Do -- na Ce -- sare _ in -- vitto _ a noi sa -- lu -- te,

    do -- na Ce -- sare _ in -- vitto _ a noi sa -- lu -- te.

    Ch’è_il vin -- cer lo -- de e_il per -- donar _ virtu - te,

    ch’è_il vin -- cer lo -- de e_il per -- do -- nar virtu - te,

    e_il per -- do -- nar - - - - - - - - virtu - te ch’è_il vin -- cer lo -- de

    e_il per -- do -- nar - - - - - - - - virtu - te ch’è_il vin -- cer lo -- de

    e_il per -- do -- nar  e_il per -- do -- nar - - - - - - - - - virtu - te

    e_il per -- donar _  virtu - te.

}

Vvcn = \relative do {

    R1*5
    r4 la'8 sol fad sol fad mi

    %7
    re mi re dod si sol' fad mi\mbreak
    re sol la la, re4 sol
    la re, la la'8 sol

    %10
    fad sol fad mi r re' dod si
    la si la sold la re, mi mi,
    la la' dod si\mbreak la si la sol

    %13
    fad sol fad mi re mi re dod
    si sol' fad mi re mi re dod
    re sol la la, re4 r

    %16
    r8 la' sold fad mi4 r\mbreak
    R1*2

    %19
    r2 r8 si' re dod
    si dod si la sold la sold fad
    mi fad mi re dod la' sold fad

    %22
    mi fad mi re dod4 r \mbreak
    R1*2

    %25
    r8 la' dod si la si la sol\mbreak
    fad sol fad mi re mi re dod
    si sol' fad mi re4 r

    %28
    R1
    r8 re' dod si la si la sol
    fad sol fad mi re4 r\mbreak

    %31
    R1
    r8 sol fad mi re mi re do
    si  do si la sol4 r

    %34
    R1*2
    r8 re'' dod si la si la sol

    %37
    fad sol fad mi re4 r
    r2 r8 re' dod si\mbreak
    la4 r la8 re, la' la,

    %40
    re4 r r2

}

Vbcn = \relative do {

    fad,1~
    fad
    sol2 sold~

    %4
    sold1~
    sold2 la
    la4 la'8 sol fad sol fad mi

    %7
    re mi re dod si sol' fad mi\mbreak
    re sol la la, re4 sol,
    la re la la'8 sol

    %10
    fad sol fad mi r re' dod si
    la si la sold la re, mi mi,
    la la' dod si\mbreak la si la sol

    %13
    fad sol fad mi re mi re dod
    si sol' fad mi re mi re dod
    re sol la la, re4 r

    %16
    r8 la' sold fad mi4 r\mbreak
    sold r la lad
    si r mi, r

    %19
    fad8 si, fad' fad,\mbreak si si' re dod
    si dod si la sold la sold fad
    mi fad mi re dod la' sold fad

    %22
    mi fad mi re dod4 r \mbreak
    re4 red mi r
    fad r re8 la mi' mi,

    %25
    la la' dod si la si la sol\mbreak
    fad sol fad mi re mi re dod
    si sol' fad mi re4 r

    %28
    R1
    r8 re' dod si la si la sol
    fad sol fad mi re4 r\mbreak

    %31
    R1
    r8 sol fad mi re mi re do
    si  do si la sol4 fad

    %34
    sol sold la r\mbreak
    re r sol, la
    re8 re' dod si la si la sol

    %37
    fad sol fad mi re re' dod re
    sol, re la' la, re re' dod si\mbreak
    la4 r la8 re, la' la,

    %40
    re4 r r2

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*5
    s2 <6>
    s1
    s8 <6> <6 4> <5 3> s4 <6>8 <5>
    <7>2 <4>4 <3>
    s1*6
    s2 <_+>
    s1
    <_->2 <_->
    <_+> <_->
    s1
    <_+>
    s2 <6>
    <5>4 <6> <_+>2
    s2 s4 <4>8 <3+>
    s1
    <6>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 4 = 47
    s1*5
    \bar "||"\break
    \once \override Score.RehearsalMark.extra-offset = #'(+6 . 0)
    \mark\markup \larger {[6.] Andante staccato}
    \tempo 2 = 60
    s1*35
    \bar "|."

}

VvlI = {
    \notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}

Vsoprano = {
    \new Voice = "dona"
    <<\Vsopranon \forma>>
}

Vvc = {
    \clef bass
    <<\Vvcn \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset
}





VIvlIn = \relative do'' {

    R1
    r4 sol'~ sol8 sol16 fa mib8 re
    mib4. re16 do re4. do16 sib

    %4
    do2. sib4
    la2 sol4 sol'~
    sol8 sol16 fa mib8 re\mbreak mib4. re16 do

    %7
    re2\tr do4 r
    r sol'8 la16 sib la8 re, r4
    R1

    %10
    r2 r4 sib'~
    sib8 sib16 lab sol8 fa sol4 r
    r2 mi!4 fa8 mi\mbreak

    %13
    fa4 r r re8 mib16 fa
    mib8 do r4 r2
    r r4 sol'~

    %16
    sol8 sol16 fa mib8 re mib4. re16 do
    re4. do16 sib do2~
    do4 sib la2

    %19
    sol1

}

VIvlIIn = \relative do'' {

    r4 re4. re16 do sib8 la
    sib4 r re2~
    re8 do16 sib do4. sib16 la sib4~

    %4
    sib la8 sol fad4 sol~
    sol fad sol r
    re'2~re8 do16 si do4~

    %7
    do si do r
    r re8. sol16 fad4 r
    R1

    %10
    r4 fa?4. fa16 mib re8 do\mbreak
    re4 mib8 re mib4 r
    r2 sol,4 la8 do

    %13
    do4 r r sol8 sol
    sol4 r r2
    r4 re'4. re16 do sib8 la

    %16
    sib4 re4. do16 sib do4~\mbreak
    do8 sib16 la sib2 la8 sol
    fad4 sol2 fad4

    %19
    sol1

}

VIsopranon = \relative do'' {

    \autoBeamOff

    R1*3
    r2 r4 re~
    re8 re16 do sib8 la sib2\mbreak

    %6
    r2 r4 sol'~
    sol8 sol16 fa mib8 re mib4 do8 re16 mib
    re8 sol, r4 r re'~

    %9
    re8 re16 do sib8 la sib4\mbreak mib8 fa16 sol
    re4(do) sib2
    r4 sib4. sib16 lab sol8 fa

    %12
    sol4 do4. do16 sib la?8 sol
    la4 la8 sib16 do\mbreak sib8 sol r4
    r re'8 mib16 fa mib8 do mib re16 do

    %15
    sib4(la) sol2
    R1*4

}

VItesto = \lyricmode {

    Muo -- iono _  le Cit -- tà, muo -- iono _ le Cit -- tà, muo -- iono_i _ Re -- gni

    muo -- iono _ le Cit -- tà, muo -- iono_i _ Re -- gni

    muo -- iono _ le Cit -- tà, muo -- iono _ le Cit -- tà, muo -- iono_i _ Re -- gni

    muo -- iono_i _ Re -- gni muo -- iono_i _ Re -- gni.

}

VIvcn = \relative do {

    sol'2 fad
    sol si
    do4 la fad sol

    %4
    mib do re2~
    re sol
    si do4 do,\mbreak

    %7
    sol' sol, do r
    r sol'8. sol,16 re'4 r
    R1

    %10
    r2 sib'
    sib, mib4 r
    r2 do2

    %13
    fa4 r r si8 si
    do4 r r2\mbreak
    r sol

    %16
    sol4 si do la!
    fad sol mib do
    re sol, re'2

    %19
    sol,1

}

VIbcn = \relative do {

    sol2 fad
    sol si
    do4 la! fad sol

    %4
    mib' do re2~
    re sol,\mbreak
    si do

    %7
    sol do
    sol re'
    fad sol4\mbreak mib

    %10
    fa fa, sib2
    sib mib4. re8
    mib4 r do2

    %13
    fa4 fad\mbreak sol si,
    do si do2
    re4 re, sol2

    %16
    sol4 si do la!\mbreak
    fad sol mib' do
    re sol, re'2

    %19
    sol,1

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    s <6>
    <3- 9>4 <5-> <6 5> s
    <6 5> <6>8 <5> <7 _+>4 <6 4>
    <4 5> <3+ 5> s2
    <6>2 <9 _->4 <8>
    <4> <3+> <_->2
    <_-> <_+>
    s1
    <6 4>4 <5 3> s2
    <5 3>4 <6 4>8 <5 3> s2
    s <5 3 _!>4 <6 4>8 <5 3+>
    s1
    <_->2 <_->
    <4>4 <3+> <_->2
    <_-> <9 _->4 <5->
    <6 5>2 <6 5>4 <6>8 <5>
    <7> <4>4 <5 3+>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 55
    s1*19
    \bar "||"

}

VIvlI = {
    %\notypeset
    <<\VIvlIn \forma>>

}

VIvlII = {
    <<\VIvlIIn \forma>>

}

VIsoprano = {
    \new Voice = "città"
    <<\VIsopranon \forma>>
}

VIvc = {
    \clef bass
    <<\VIvcn \forma>>
}

VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset
}






VIIsopranon = \relative do'' {

    \autoBeamOff
    
    r8 la la la re re r re
    re re re mi fa4 fa\mbreak
    r8 re16 re re8 mi16 fa sol8 sol mi mi
    
    %4
    mi fa16 sol dod,8 dod dod dod16 dod re8 mi
    fa2 r4 re~\mbreak
    re mi8 fa re4. dod8(
    
    %7
    re2) r4 fa,8 fa
    sib4 sib8 do re4 re
    r8 re mi fa sib, sib16 sib sol8 sib\mbreak
    
    %10
    mi,!4. fa8 fa4 fa
    r do'8 do la4 la8 la
    re re r re re do do sib
    
    %13
    sib4 sib\mbreak r8 re16 re re8 mi16 fad
    sol8 fa? mib re mib4 mib
    r sol,8 sol do do16 sib lab8 sol
    
    %16
    lab4 r8 do\mbreak fa4. mib8
    mib4(re) do2

}

VIItesto = \lyricmode {
   
   Del gran To -- nante _  a pa -- lesar _ gli sde -- gni alle _ teste _ rea - li  

   le co -- me -- te_a -- di -- rate _ parlan _ la sù dal Ciel lin -- gue fa -- ta -- li,
   
  so -- no_in -- van coro - na -- te di sa -- cro_al -- lor le ambi - zi -- o -- se fron -- ti
   
  che se_in ter -- ra_i Mo -- narchi _  saran _ di colpe _ car -- chi
  
  quan -- do_il  fato _ ve -- der gli vo -- glia_op -- pres -- si,
  
  oggi _ hanno _ allo - ri_al crin, di -- man ci -- pres -- si.

}

VIIbcn = \relative do {
   
   re1~
   re
   re2 mi~
   
   %4
   mi1
   re2 sib
   sol la
   
   %7
   re sib~
   sib1~
   sib2 sol~
   
   %10
   sol fa
   fa1
   fad
   
   %13
   sol2 si~
   si do
   mi!1
   
   %16
   fa
   sol2 do,

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    <_->1
    s
    s2 <7>
    s4 <6+>2.
    s1
    s2 <4>4 <3>
    s1
    s
    s2 <7>
    <6>1
    s1*3
    s2 <_->
    s1
    <_->2 <_->
    
}


forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 60
    s1*17
    \bar "||"

}

VIIsoprano = {
    %\notypeset
    \new Voice = "gran"
    <<\VIIsopranon \forma>>
}

VIIbc = {
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
    \typeset
}





VIIIvlIn = \relative do'' {
   
   R1*26
   s2 sol'4 la
   sib la sol la
   
   %29
   fad8 re r4 r2
   r la'4 sol\mbreak
   fa fad sol16 la fad sol mi4
   
   %32
   re r sol fa
   mi16 fad sol4 fad8 sol4 r
   r2 sol4\p fa?
   
   %35
   mi16 fad sol4 fad8 sol4 r\mbreak
   R1*24
   sol4 la sib r8 la
   
   %61
   sol4 la fad8 re r4
   R1
   la'4 sol fa fad
   
   %64
   sol16 la fad? sol mi4 re r
   sol fa?\mbreak mi16 fad sol4 fad8
   sol4 r r2
   
   %67
   sol4\p fa? mi16 fad sol4 fad8
   sol4 r r2

}

VIIIvlIIn = \relative do'' {
   
   R1*28
   re4 mi fa mi
   re mi dod8 la r4
   re do si16 dod re4 dod8
   re4 do? sib? do8 re
   do16 re sib do la4\mbreak sol r
   re'\p do sib? do8 re
   do16 re sib do la4 sol r
   R1*25
   r2 re'4 mi
   fa r8 mi re4 mi
   dod8 la r4\mbreak re4 dod
   si16 dod re4 dod8 re4 do?
   sib? do8 re do16 re sib do la4
   sol r re'\p do
   sib do8 re do16 re sib do la4
   sol r r2

}

VIIIsopranon = \relative do'' {

    \autoBeamOff
    
    R1*2
    sol4 la sib la\mbreak
    sol la fad sol
    
    %5
    mib' re8. mib16 do4 sib
    la sol8. do16 re4 re
    sol fa8. sol16 mib4 re\mbreak
    
    %8
    do re8. mib16 re8 [do16 sib] la4
    sol r r2
    r r4 sib8 do 
    
    %11
    re mib fa sib, do16 [re mib fa] mib4\mbreak
    re do8 re mib4 re8 mib
    do4(sib8) do re8. [mib16 do8. re16]
    
    %14
    mib[fa re mib] do4 sib r
    r4 re8 do\mbreak sib4 la8. sib16
    sol4(la8) sib la [sol16 fa] mi4
    
    %17
    re2 r
    R1\mbreak
    sol4 la sib la
    
    %20
    sol la fad sol
    mib' re8. mib16 do4 sib
    la sol8. do16 re4 re\mbreak
    
    %23
    sol fa8. sol16 mib4 re
    do re8. mib16 re8 [do16 sib] la4
    sol r sol'^\p fa8. sol16
    
    %26
    mib4 re do re8. mib16\mbreak
    re8 [do16 sib] la4 sol r
    R1*7
    
    %35
    r2 sol4 do
    sib r8 la sol4 la
    fad sol mib' re\mbreak
    
    %38
    do sib la sol8. do16
    re4 re sol fa
    mib re do re8. mib16
    
    %41
    re8[do16 sib] la4 sol r\mbreak
    R1
    r4 sib8 do re mib fa sib,
    
    %44
    do16[re mib fa] mib4 re do8 re
    mib4(re) do sib8 do\mbreak
    re8.[mib16 do8. re16] mib [fa re mib] do4
    
    %47
    sib r r re8 do
    sib4(la) sol la8 sib
    la[sol16 fa] mi4 re2\mbreak
    
    %50
    R1
    r2 sol4 la
    sib4 r8 la sol4 la
    
    %53
    fad sol mib' re\mbreak
    do sib la sol8. do16
    re4 re sol fa
    
    %56
    mib re do re8. mib16
    re8[do16 sib] la4 sol r\mbreak
    sol'\p fa mib re
    
    %59
    do re8. mib16 re8[do16 sib] la4
    sol r r2
    R1*8
 
}

VIIItesto = \lyricmode {
   
   So -- no_i fa -- sti de’ Re -- gnan -- ti ven -- to, a -- re -- na, fu -- mo e om -- bra
   
   ven -- to, a -- re -- na, fu -- mo e om - bra;
   
   og -- gi ri -- don festeg - gian - ti e  di -- mani _ il duol gl’in -- gom - - bra
   
   e  di -- mani _ il duol gl’in -- gom - bra. 
   
   So -- no_i fa -- sti de’ Re -- gnan -- ti ven -- to, a -- re -- na, fu -- mo e om -- bra
   
   ven -- to, a -- re -- na, fu -- mo e om - bra ven -- to, a -- re -- na, fu -- mo e om - bra.
   
   Sol dei Re le pom -- pe so -- no piu -- ma, lam -- po, fio -- ri e ve -- tro
   
   piu -- ma, lam -- po, fio -- ri e ve - tro;  og -- gi cal -- can re -- gio tro - no e 
   
   di -- man son nel fe --  re - - tro e di -- man son nel fe --  re - tro.
   
   Sol dei Re le pom -- pe so -- no piu -- ma, lam -- po, fio -- ri e ve -- tro
   
   piu -- ma, lam -- po, fio -- ri e ve - tro piu -- ma, lam -- po, fio -- ri e ve - tro.
   
}

VIIIvcn = \relative do {
   
   r8 sol' fad re r sol\p fad re
   r re'\f sib fad sol do, re re,
   sol sol' fad re r sol fad re\mbreak
   
   %4
   r mib do la r re sib sol
   r do' sib sol r la sol sol,
   r8  fa' mib4 re8 re' do re 
   
   %7
   r sib si sol r do sib? sol\mbreak
   r la sol fad sol do, re re,
   sol sol' fad re r re' sib fad
   
   %10
   sol do, re re, sol4 r
   sib8 do re mib do4 fa8 fa,\mbreak
   sib sib' la fa r sol fa re
   
   %13
   r mib re do r sib' la fa
   sol mib fa fa, sib sib' la sol
   fad4 re\mbreak r8 sol fa! re
   
   %16
   r mi re dod re sol la la,
   re sol fad re r sol\p fad re 
   r re'\f sib fad sol do, re re,\mbreak
   
   %19
   sol sol' fad re r sol fad re
   r mib do la r re sib sol
   r do' sib sol r la sol sol,
   
   %22
   r fa' mib4 re8 re' do re\mbreak
   r sib si sol r do sib? sol
   r la sol fad sol do, re re,
   
   %25
   sol sol' fad re r mib re sib
   r do' sib sol r la sol fad\mbreak
   sol do, re re, sol sol' fad re
   
   %28
   r sol fad re r mib do la
   \clef tenor \key fa\major  r8 re' dod la r re dod la
   \clef bass \key fa\major r sib sol mi\mbreak r la si dod
   
   %31
   r re la re, sol re la' la,
   re, re' mi fad r sol la si
   do sol re re, sol sol'\p fa mib\mbreak
   
   %34
   r re mi! fad r sol la si
   do sol re re, sol sol' fad re
   r sol fad re r mib do la
   
   %37
   r re sib sol r do' sib sol\mbreak
   r la sol sol,  r fa' mib4
   re8 re' do re r sib si sol
   
   %40
   r do sib? sol r la sol fad
   sol do, re re, sol sol' fad re\mbreak
   r8 re' sib fad sol do, re re,
   
   %43
   sol4 r sib8 do re mib
   do4 fa8 fa, sib sib' la fa
   r sol fa re r mib re do\mbreak
   
   %46
   r sib' la fa sol mib fa fa,
   sib sib' la sol fad4 re
   r8 sol fa! re r mi re dod
   
   %49
   re sol la la, re sol fad re\mbreak
   r sol\p fad re r re'\f sib fad
   sol do, re re, sol sol' fad re
   
   %52
   r sol fad re r mib do la
   r re sib sol r do' sib sol\mbreak
   r la sol sol, r fa' mib4
   
   %55
   re8 re' do re r sib si sol
   r do sib? sol r la sol fad
   sol do, re re, sol sol'\p fad re\mbreak
   
   %58
   r mib re sib r do' sib sol
   r la sol fad sol do, re re,
   sol sol' fad re r sol fad re
   
   %61
   r mib do la \clef tenor \key fa\major  r re' dod la\mbreak
   r re dod la \clef bass\key fa\major r sib sol mi
   r la si dod r re la re,
   
   %64
   sol re la' la, r re mi fad
   r sol la si\mbreak do sol re re,
   sol sol'\p fa mib r re mi? fad
   
   %67
   r sol la si do sol re re,
   sol4 r r2

}

VIIIbcn = \relative do {
   
   r8 sol' fad re r sol\p fad re
   r re'\f sib fad sol do, re re,
   sol sol' fad re r sol fad re\mbreak
   
   %4
   r mib do la r re sib sol
   r do' sib sol r la sol sol,
   r8  fa' mib4 re8 re' do re 
   
   %7
   r sib si sol r do sib? sol\mbreak
   r la sol fad sol do, re re,
   sol sol' fad re r re' sib fad
   
   %10
   sol do, re re, sol4 r
   sib8 do re mib do4 fa8 fa,\mbreak
   sib sib' la fa r sol fa re
   
   %13
   r mib re do r sib' la fa
   sol mib fa fa, sib sib' la sol
   fad4 re\mbreak r8 sol fa! re
   
   %16
   r mi re dod re sol la la,
   re sol fad re r sol\p fad re 
   r re'\f sib fad sol do, re re,\mbreak
   
   %19
   sol sol' fad re r sol fad re
   r mib do la r re sib sol
   r do' sib sol r la sol sol,
   
   %22
   r fa' mib4 re8 re' do re\mbreak
   r sib si sol r do sib? sol
   r la sol fad sol do, re re,
   
   %25
   sol sol' fad re r mib re sib
   r do' sib sol r la sol fad\mbreak
   sol do, re re, sol sol' fad re
   
   %28
   r sol fad re r mib do la
   \clef tenor \key fa\major  r8 re' dod la r re dod la
   \clef bass \key fa\major r sib sol mi\mbreak r la si dod
   
   %31
   r re la re, sol re la' la,
   re, re' mi fad r sol la si
   do sol re re, sol sol'\p fa mib\mbreak
   
   %34
   r re mi! fad r sol la si
   do sol re re, sol sol' fad re
   r sol fad re r mib do la
   
   %37
   r re sib sol r do' sib sol\mbreak
   r la sol sol,  r fa' mib4
   re8 re' do re r sib si sol
   
   %40
   r do sib? sol r la sol fad
   sol do, re re, sol sol' fad re\mbreak
   r8 re' sib fad sol do, re re,
   
   %43
   sol4 r sib8 do re mib
   do4 fa8 fa, sib sib' la fa
   r sol fa re r mib re do\mbreak
   
   %46
   r sib' la fa sol mib fa fa,
   sib sib' la sol fad4 re
   r8 sol fa! re r mi re dod
   
   %49
   re sol la la, re sol fad re\mbreak
   r sol\p fad re r re'\f sib fad
   sol do, re re, sol sol' fad re
   
   %52
   r sol fad re r mib do la
   r re sib sol r do' sib sol\mbreak
   r la sol sol, r fa' mib4
   
   %55
   re8 re' do re r sib si sol
   r do sib? sol r la sol fad
   sol do, re re, sol sol'\p fad re\mbreak
   
   %58
   r mib re sib r do' sib sol
   r la sol fad sol do, re re,
   sol sol' fad re r sol fad re
   
   %61
   r mib do la \clef tenor \key fa\major  r re' dod la\mbreak
   r re dod la \clef bass\key fa\major r sib sol mi
   r la si dod r re la re,
   
   %64
   sol re la' la, re, re' mi fad
   r sol la si\mbreak do sol re re,
   sol sol'\p fa mib r re mi? fad
   
   %67
   r sol la si do sol re re,
   sol4 r r2
  
}

VIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*3
    s4 <6> s2
    s1 
    s2 <_+>
    s1*4
    s2 <7 _->4 <7>
    s1*10
    s2 <_+>
    s1*5
    s2 s4 <6>
    s8 <_+>s4 s8 <_-> s4
    s <6> s8 <_+> <6> <5->
    s4 <6+>8 <7 _+> <_!>4 <4>8 <3>
    s4 <6>8 <5> s <_-> <6> <5->
    s8 s <4> <3+> s2
    s4 <6>8 <5-> s4 <6>8 <5->
    s4 <4>8 <3+> s2
    s s4 <6>
    s1*7
    <7 _->4 <7> s2
    s1*16
    s4 <6> s8 <_+> s4
    s8 <_-> s4 s <6>
    s8 <_+> <6> <5-> s8 <_->  <6+>8 <7 _+>
    <_!>4 <4>8 <3> s4 <6>8 <5->
    s <_-> <6> <5-> <_!> s <4> <3+>
    s2 s8 <6> s <5->
    s <_-> <6> <5-> <_!> s <4> <3+>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 50
    s1*26
    s2  \once \override Score.RehearsalMark.extra-offset = #'(6 . 1 )
    \mark\markup "Ritornello" s
    s1*7
    s2\once \override Score.RehearsalMark.extra-offset = #'(5 . 1 )
    \mark\markup "Seconda" s
    s1*24\once \override Score.RehearsalMark.extra-offset = #'(6 . 0.5 )
    \mark\markup "Ritornello"
    s1*9
    \bar "||"
}

VIIIvlI = {
    %\notypeset
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    <<\VIIIvlIIn \forma>>

}

VIIIsoprano = {
    \new Voice = "fasti"
    <<\VIIIsopranon \forma>>
}

VIIIvc = {
    \clef bass
    <<\VIIIvcn \forma>>
}

VIIIbc = {
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
    \typeset
}




IXsopranon = \relative do'' {

    \autoBeamOff
    
    r4 r8 sol sib4 sib8 do16 re
    mib8 mib r sib sol8. sol16 la8 sib
    mib,16[fa sol lab] sib[sol lab sib] do[re mib do] fa[do re mib]
    
    %4
    re8 re r mib16 sib\mbreak do8 [mib16 re] do [sib lab sol]
    fa8 fa r sib16 sol do4 lab8 sol
    fa2 mib
    
    %7
    r4 sib'8 sib re4 re8 do
    do do r16 do do re\mbreak mib8. do16 re8 mib
    la,!4. sib8 sib4 sib
    
    %10
    sib8 sib16 la sol8 fa sol2
    mib'8 mib16 re do8 sib do4 do8 re16 mib\mbreak
    re8 re r re sol4 re8 mib16 fa
    
    %13
    mib4 do8 re16 mib sib4. la16 [sol]
    sol1

}

IXtesto = \lyricmode {
   
   Non v’è tor -- re gi -- gante _ che_il ful -- mine _ to -- nan - - - - te
   
   non at -- ter - - ri non at -- ter -- i_e ro -- vi -- ni, 
   
   han -- no_i lo -- ro de -- stini _ fuga - ci_an -- cor le più su -- per -- be mo -- li.
   
   Muo -- iono _ le Cit -- tà, muo -- iono _ le Cit -- tà, muo -- iono_i _ Re -- gni
   
   e l’uom d’es -- ser mor -- tal par che si sde - gni.

}

IXbcn = \relative do {
   
   mib1~
   mib~
   mib2 lab,
  
   %4
   sib4 sol\mbreak lab2
   sib4 sol lab2
   sib mib
   
   %7
   sib1~
   sib
   do2 sib
   
   %10
   re mib
   sol, lab4 la\mbreak
   sib2 si
   
   %13
   do re
   sol,1

}

IXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*2
    s2 <5>4 <6>
    s1*2
    <4>4 <3> s2
    s1
    s
    <6 _->2 s
    s1
    <6->
    s <_->

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 70
    s1*14
    \bar "||"

}

IXsoprano = {
    %\notypeset
    \new Voice = "torre"
    <<\IXsopranon \forma>>
}

IXbc = {
    \clef bass
    <<\IXbcn \forma \IXbfn>>
    \typeset
}




Xsopranon = \relative do'' {

    \autoBeamOff
    
    r8 la re 
    dod8. re16 mi8
    fa8. mi16 re8 
    
    %4
    mi la, re~
    re mi4 
    fa mi8
    
    %7
    r sol fa 
    mi8. fa16 re8
    dod8. re16 mi8 
    
    %10
    fa mi4\mbreak
    re4. 
    r8 sol fa
    
    %13
    mi8. fa16 re8
    dod8. re16 mi8
    fa mi4 
    
    %16
    re r8
    R4.*5
    r8 fa, sol
    
    %23
    la8. sib16 do8
    re8. do16 sib8
    do4 fa,8
    
    %26
    r fa\p sol
    la8. sib16 do8
    re8. do16 sib8\mbreak
    
    %29
    do4 fa,8
    r fa' mi
    re8. do16 sib8
    
    %32
    do8. sib16 la8
    sib16 [la] sol4
    fa4.
    
    %35
    r8 fa' \p mi
    re8. do16 sib8
    do8. sib16 la8
    
    %38
    sib16 [la] sol4
    fa4.
    r8 la re
    
    %41
    dod8. re16 mi8
    fa8. mi16 re8
    mi la, re~
    
    %44
    re mi4
    fa mi8
    r sol fa\mbreak
    
    %47
    mi8. fa16 re8 
    dod8. re16 mi8
    fa mi4 
    
    %50
    re4.
    r8 sol\p fa\mbreak
    mi8. fa16 re8 
    
    %53
    dod8. re16 mi8
    fa mi4 
    re4 r8
    
}

Xtesto = \lyricmode {
   
   Va fre -- giato _ di por -- po -- re_ed o -- ri
   
   quel Mo -- narca _  quel Mo -- narca, _  e_gli o -- meri _ e_il cri -- ne,
   
   quel Mo -- narca, _ e_gli o -- meri _ e_il cri -- ne.
   
   Ma quei fra -- gili_e _  vani _ te -- sori _ ma quei fra -- gili_e _  vani _ te -- so -- ri 
   
   che vil fan -- go non co -- prano _  al -- fi -- ne 
   
   che vil fan -- go non co -- prano _  al -- fi -- ne.
   
   Va fre -- giato _ di por -- po -- re_ed o -- ri
   
   quel Mo -- narca _  quel Mo -- narca, _  e_gli o -- meri _ e_il cri -- ne,
   
   quel Mo -- narca, _ e_gli o -- meri _ e_il cri -- ne.
   
}

Xbcn = \relative do {
   
   re4 r8
   la4 r8
   re4 r8
   
   %4
   la'8. sol16 fa8
   fa mi4 
   re8 re' do
   
   %7
   sib4 la8 
   sol4 fa8
   mi re dod
   
   %10
   re la' la,\mbreak
   re re' do
   sib4 la8
   
   %13
   sol4 fa8
   mi re dod
   re la' la, 
   
   %16
   re \clef tenor\key fa\major la' re
   dod8. re16 mi8
   fa8. mi16 re8
   
   %19
   mi la, re\mbreak
   sol, la la,
   \clef bass\key fa\major re4 r8
   
   %22
   fa4 r8
   fa4 r8
   sib,4 r8
   
   %25
   fa'4 r8
   fa4 r8
   fa4 r8
   
   %28
   sib,4 r8\mbreak
   fa'8\clef tenor\key fa\major fa' mi
   re4 do8
   
   %31
   sib4 r8
   la8. sol16 fa8
   sib do do,
   
   %34
   fa fa' mi
   re4 do8
   sib4 r8
   
   %37
   la8. sol16 fa8\mbreak
   sib do do,
   fa4.
   
   %40
   \clef bass\key fa\major  re4 r8
   la4 r8
   re4 r8
   
   %43
   la'8. sol16 fa8~
   fa mi4
   re8 re' do
   
   %46
   sib4 la8\mbreak
   sol4 fa8
   mi re dod
   
   %49
   re la' la,
   re re' do
   sib4 la8
   
   %52
   sol4 fa8
   mi re dod
   re la' la,
   
   %55
   re4 r8

}

Xbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s4.
    <_+>
    s4.
    s4 <6>8
    s <6+>4 
    s4.*13
    <7 _->8 <7 _+> s
    s4.*21
    <_+>4.
    s
    s4 <6> <6+>

}


forma = {

    \time 3/8
    \key fa\major
    \tempo 4 = 70
    s4.*55
    \bar "||"

}

Xsoprano = {
    %\notypeset
    \new Voice = "va"
    <<\Xsopranon \forma>>
}

Xbc = {
    \clef bass
    <<\Xbcn \forma \Xbfn>>
    \typeset
}





XIvlIn = \relative do'' {
   
   r8 la re
   dod8. re16 mi8
   fa8. mi16 re8 
   
   %4
   mi la,4
   r8 la' re
   sib8. la16 sol8
   
   %7
   sol8. la16 fa mi
   fa sol mi8. re16
   re4.
   
   %10
   r8 la'\p re\mbreak
   sib8. la16 sol8
   sol8. la16 fa mi
   
   %13
   fa sol mi8. re16   
   re4.

}

XIvlIIn = \relative do'' {
   
   R4.*3
   r8 mi la
   fa8. mi16 re8
   
   %6
   r re mi
   dod la re~
   re dod4
   
   %9
   r8 re\p la' 
   fa8. mi16 re8
   r re mi
   
   %12
   dod la re~
   re dod8. re16
   re4.
   
}

XIsopranon = \relative do'' {

    \autoBeamOff
    
    R4.*14

}

XIvcn = \relative do {
   
   re4 r8
   la'4 r8
   re4 r8 
   
   %4
   r la la,
   re4 r8
   r sol sol
   
   %7
   la4 sib8 
   sol la la,
   re re'\p dod
   
   %10
   re4 r8
   r sol, sol \mbreak
   la4 sib8
   
   %13
   sol la la,
   re4.

}

XIbcn = \relative do {
   
   re4 r8
   la'4 r8
   re,4 r8
   
   %4
   la4 r8
   re4 r8 
   sol4 r8
   
   %7
   la4 sib8 
   sol la la,
   re4 dod8\p
   
   %10
   re4 r8
   sol4 r8
   la4 sib8 
   
   %13
   sol la la,
   re4.
   
}

XIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s4.
   < _+>
    s
    <_+>
    <_-> 
    <_->
    <7>4 <5>8
    <7 5>8 <_+>4
    s4.
    <_->
    <_-> <7 _+>4 <5>8
    <5> <_+>
 
}


forma = {

    \time 3/8
    \key fa\major
    \tempo 4 = 70
    s4.*14
    \bar "||"

}

XIvlI = {
    %\notypeset
    <<\XIvlIn \forma>>

}

XIvlII = {
    <<\XIvlIIn \forma>>

}

XIsoprano = {
    %\new Voice = "cives1"
    <<\XIsopranon \forma>>
}

XIvc = {
    \clef bass
    <<\XIvcn \forma>>
}

XIbc = {
    \clef bass
    <<\XIbcn \forma \XIbfn>>
    \typeset
}





XIIvlIn = \relative do'' {

   R1*11
   r2 r4 sol'~
   sol8 sol16 fa mib8 re\mbreak mib4. re16 do

   %14
   re2\tr do4 r
   r sol'8 la16 sib la8 re, r4
   R1

   %17
   r2 r4 sib'~
   sib8 sib16 lab sol8 fa sol4 r
   r2 mi!4 fa8 mi\mbreak

   %20
   fa4 r r re8 mib16 fa
   mib8 do r4 r2
   r r4 sol'~

   %23
   sol8 sol16 fa mib8 re mib4. re16 do
   re4. do16 sib do2~
   do4 sib la2

   %26
   sol1

}

XIIvlIIn = \relative do'' {

   R1*12
   re2~re8 do16 si do4~

   %14
   do si do r
   r re8. sol16 fad4 r
   R1

   %17
   r4 fa?4. fa16 mib re8 do\mbreak
   re4 mib8 re mib4 r
   r2 sol,4 la8 do

   %20
   do4 r r sol8 sol
   sol4 r r2
   r4 re'4. re16 do sib8 la

   %23
   sib4 re4. do16 sib do4~\mbreak
   do8 sib16 la sib2 la8 sol
   fad4 sol2 fad4

   %26
   sol1

}

XIIsopranon = \relative do'' {

   \autoBeamOff

   r4 r8 fa, sib4 sib8 sib16 do
   re8 re r fa do do mib re
   sib4 sib r r8 sib

   %4
   re8. re16 mi8 fa\mbreak sol sol16 fa mib8 re
   mib4 mib r8 do16 do do8 sib16 do
   lab8 lab do fa16 mib mib4(re)

   %7
   do2\mbreak do8 do16 do re8 mi
   fa do mib mib16 re re8 re r sib
   re8. re16 mib8 fa sol sol r sol\mbreak

   %10
   do, do re mib re do4.
   sib2 r4 re~
   re8 re16 do sib8 la sib2\mbreak

   %13
   r2 r4 sol'~
   sol8 sol16 fa mib8 re mib4 do8 re16 mib
   re8 sol, r4 r re'~

   %16
   re8 re16 do sib8 la sib4\mbreak mib8 fa16 sol
   re4(do) sib2
   r4 sib4. sib16 lab sol8 fa

   %19
   sol4 do4. do16 sib la?8 sol
   la4 la8 sib16 do\mbreak sib8 sol r4
   r re'8 mib16 fa mib8 do mib re16 do

   %22
   sib4(la) sol2
   R1*4

}

XIItesto = \lyricmode {

   Del Ciel pro -- voca _ l’i -- re l’or -- go -- glio de’ Ti -- se -- i

   ben ch’al -- zino _ di bron -- zo al Ciel le fron -- ti

   son se -- polcri _ del fa -- sto i mauso - le -- i,

   ab -- bian le gem -- me_e l’or nel se -- no i mon -- ti

   de’ ful -- mini _ di -- vi -- ni son de -- sti -- na -- ti se - gni.

   Muo -- iono _  le Cit -- tà, muo -- iono _ le Cit -- tà, muo -- iono_i _ Re -- gni

   muo -- iono _ le Cit -- tà, muo -- iono_i _ Re -- gni

   muo -- iono _ le Cit -- tà, muo -- iono _ le Cit -- tà, muo -- iono_i _ Re -- gni

   muo -- iono_i _ Re -- gni muo -- iono_i _ Re -- gni.

}

XIIvcn = \relative do {

   R1*11
   r2 sol'
   si do4 do,\mbreak

   %14
   sol' sol, do r
   r sol'8. sol,16 re'4 r
   R1

   %17
   r2 sib'
   sib, mib4 r
   r2 do2

   %20
   fa4 r r si8 si
   do4 r r2\mbreak
   r sol

   %23
   sol4 si do la!
   fad sol mib do
   re sol, re'2

   %26
   sol,1

}

XIIbcn = \relative do {

   sib1~
   sib~
   sib~

   %4
   sib2 si
   do mi!
   fa sol

   %7
   do, la!~
   la sib~
   sib mib~

   %10
   mib fa4 fa,
   sib2 fad2~
   fad sol
   
   %13
   si do
   sol do
   sol re'
   fad sol4\mbreak mib

   %17
   fa fa, sib2
   sib mib4. re8
   mib4 r do2

   %20
   fa4 fad\mbreak sol si,
   do si do2
   re4 re, sol2

   %23
   sol4 si do la!\mbreak
   fad sol mib' do
   re sol, re'2

   %26
   sol,1

}

XIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1*4
   <_->1
   s2 <4>4 <3+>
   s1*3
   <6 4>2 <4>4 <3>
   s1
   s2 <_->
   <6>2 <9 _->4 <8>
   <4> <3+> <_->2
   <_-> <_+>
   s1
   <6 4>4 <5 3> s2
   <5 3>4 <6 4>8 <5 3> s2
   s <5 3 _!>4 <6 4>8 <5 3+>
   s1
   <_->
   <4>4 <3+> <_->2
   <_-> <9 _->4 <5->
   <6 5>2 <6 5>
   <7> <4>4 <5 3+>

}


forma = {

   \time 4/4
   \key fa\major
   \tempo 4 = 65
   s1*10
   s2 \once \override Score.RehearsalMark.extra-offset = #'(5 . 1) \mark\markup "Andante" s
   \tempo 4 = 75
   s1*15
   \bar "|."

}

XIIvlI = {
   %\notypeset
   <<\XIIvlIn \forma>>

}

XIIvlII = {
   <<\XIIvlIIn \forma>>

}

XIIsoprano = {
   \new Voice = "ciel"
   <<\XIIsopranon \forma>>
}

XIIvc = {
   \clef bass
   <<\XIIvcn \forma>>
}

XIIbc = {
   \clef bass
   <<\XIIbcn \forma \XIIbfn>>
   \typeset
}

\pointAndClickOff

global = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f

}

\paper {

   print-first-page-number = ##t
   first-page-number = #2

}

\bookpart {

   \paper {

      systems-per-page = #6

   }

   \header {
      subtitle = \markup "La Turchia supplicante Op. I/1"
      composer = \markup {"G. A. Perti (1661-1756)"}
   }

   \markup \huge {[1.] Rec[itativo]}

   \score {

      \new ChoirStaff <<

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 4/4 r2^\markup\center-align "Canto" r8 la'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \Isoprano \global
            \new Lyrics \lyricsto "pietà" \Itesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \Ibc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 2\cm
         incipit-width =2\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\bookpart {

   \paper {

      systems-per-page = #3

   }

   \markup \huge {[2.] Aria, andante}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \IIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \IIvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/4\numericTimeSignature r2.^\markup\right-align "Canto" }
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \IIsoprano \global
            \new Lyrics \lyricsto "perdono" \IItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \IIvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \IIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            %\override StaffGrouper.staffgroup-staff-spacing.padding = #2
            %\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\bookpart {

   \paper {

      systems-per-page = #6

   }

   \markup \huge {[3.] Rec[itativo]}

   \score {

      \new ChoirStaff <<

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 4/4 r4^\markup\center-align "Canto" sold'4. sold'8}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \IIIsoprano \global
            \new Lyrics \lyricsto "piangono" \IIItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \IIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\bookpart {

   \paper {

      systems-per-page = #3

   }

   \markup \huge {[4.] Sinfonia, allegro}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \IVvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \IVvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 3/8\numericTimeSignature r4.^\markup\right-align "Canto" }
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \IVsoprano \global
            \new Lyrics \lyricsto "pace" \IVtesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \IVvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \IVbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            %\override StaffGrouper.staffgroup-staff-spacing.padding = #2
            %\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[5.] Recitativo}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \VvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \VvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major \time 4/4 r4^\markup\right-align "Canto" la'8 la'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \Vsoprano \global
            \new Lyrics \lyricsto "dona" \Vtesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \Vvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \Vbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            %\override StaffGrouper.staffgroup-staff-spacing.padding = #2
            %\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\bookpart {

   \paper {

      systems-per-page = #3

   }

   \header {
      subtitle = \markup "Vanità delle grandezze humane Op. I/2"
      composer = \markup {"G. A. Perti (1661-1756)"}
   }

   \markup \huge {[1.] Largo}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \VIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \VIvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 4/4 r1^\markup\right-align "Canto" }
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \VIsoprano \global
            \new Lyrics \lyricsto "città" \VItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \VIvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \VIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            %\override StaffGrouper.staffgroup-staff-spacing.padding = #2
            %\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\bookpart {

   \paper {

      systems-per-page = #6

   }

   \markup \huge {[2.] Rec[itativo]}

   \score {

      \new ChoirStaff <<

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 4/4 r8^\markup\center-align "Canto" la'8 la' la'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \VIIsoprano \global
            \new Lyrics \lyricsto "gran" \VIItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \VIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\bookpart {

   \paper {

      systems-per-page = #3

   }

   \markup \huge {[3.] Aria, andante}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \VIIIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \VIIIvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 4/4 r1^\markup\right-align "Canto" }
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \VIIIsoprano \global
            \new Lyrics \lyricsto "fasti" \VIIItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \VIIIvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \VIIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            %\override StaffGrouper.staffgroup-staff-spacing.padding = #2
            %\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\bookpart {

   \paper {

      systems-per-page = #6

   }

   \markup \huge {[4.] Rec[itativo]}

   \score {

      \new ChoirStaff <<

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 4/4 r4^\markup\center-align "Canto" r8 sol'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \IXsoprano \global
            \new Lyrics \lyricsto "torre" \IXtesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \IXbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #10
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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
   
   \markup \huge {[5.] Aria}
   
   \score {

      \new ChoirStaff <<

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 3/8\numericTimeSignature r8^\markup\center-align "Canto" la' re''8 }
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \Xsoprano \global
            \new Lyrics \lyricsto "va" \Xtesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \Xbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #10
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\bookpart {

   \paper {

      systems-per-page = #3

   }

   \markup \huge {[6.] Ritornello}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \XIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \XIvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 4/4 r4^\markup\right-align "Canto" r8}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \XIsoprano \global
            %\new Lyrics \lyricsto "fasti" \VIIItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \XIvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \XIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            %\override StaffGrouper.staffgroup-staff-spacing.padding = #2
            %\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

\bookpart {

   \paper {

      systems-per-page = #3

   }

   \markup \huge {[7.] L'arroganza}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \XIIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \XIIvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 4/4 r4^\markup\center-align "Canto" r8 fa'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \XIIsoprano \global
            \new Lyrics \lyricsto "ciel" \XIItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \XIIvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \XIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            %\override StaffGrouper.staffgroup-staff-spacing.padding = #2
            %\override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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