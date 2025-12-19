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


Iglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \con\terzine

}

Ivln = \relative do'' {

    la'16 fa do8. fa16
    la16 fa do8. la'16
    sib8 la sol

    %4
    la sol fa
    la16 fa do8. fa16
    la16 fa do8. la'16

    %7
    sib8 la4\tr
    sol4.
    do16 sol mi8. do'16

    %10
    do la fa8. do'16
    do sol mi8. do'16\mbreak
    do la fa8 r

    %13
    \tuplet 3/2 {
        sol16(fa mi) sol[(fa mi)] la(sol fa)
        \senza sol fa mi sol[fa mi] la sol fa
        sol fa mi sol[fa mi] la sol fa
    }

    %16
    sol8 do, r
    sib'16 sol mi8. sib'16
    la16 fa do8. la'16
    sol mi do8. sol'16

    %20
    fa4 r8
    R4.*6
    r8 do'16 sib do do,

    %28
    do4 r8
    R4.*6
    r8 do'16 si do do,

    %36
    do4 r8
    R4.*2
    sol'16 mi do8. mi16

    %40
    sol16 mi do8. sol'16
    do8 si la
    la sol4

    %43
    sol16 mi do8. mi16\mbreak
    sol mi do8. sol'16
    do8 re si

    %46
    do4 r8
    R4.*14
    la16 fa  do8. fa16

    %62
    la fa do8. la'16
    sib8 la sol
    la sol fa

    %65
    la16 fa do8. fa16\mbreak
    la fa do8. la'16
    sib8 la4

    %68
    sol16 mi do8. sol'16
    sib16 sol mi8. sol16
    la8 sol fa

    %71
    sol mi4\tr
    la16 fa do8. la'16
    sol16 mi do8. sol'16

    %74
    la16 fa do8. la'16
    sib16 sol mi8. sib'16
    la16 fa do8. la'16

    %77
    sol16 mi do8. sol'16\mbreak %%% fine p. 5
    la8 sol fa
    sol mi4

    %80
    fa4.
    la16 fa do8. fa16
    la16 fa do8. la'16

    %83
    sib8 la sol
    la sol fa
    la16 fa do8. fa16

    %86
    la16 fa do8. la'16
    sib8 la4\tr
    sol4.

    %89
    do16 sol mi8. do'16
    do la fa8. do'16
    do sol mi8. do'16\mbreak

    %92
    do la fa8 r
    \con \tuplet 3/2 {
        sol16(fa mi) sol[(fa mi)] la(sol fa)
        \senza sol fa mi sol[fa mi] la sol fa
    }

    %95
    sol mi do mi sol mi
    fa4.\fermata\mbreak
    R4.*15

    %112
    R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IvlIn = \relative do'' {

    fa16 do la8. do16
    fa do la8. fa'16
    sol8 fa mi

    %4
    fa mi fa
    fa16 do la8. do16
    fa do la8. fa'16

    %7
    sol8 fa4\tr
    mi4 r8
    sol16 mi do8. sol'16

    %10
    la fa do8. la'16
    sol mi do8. sol'16\mbreak
    la fa do8 r

    %13
    \tuplet 3/2 {
        mi16(re do) mi[(re do)] fa(mi re)
        \senza mi re do mi[re do] fa mi re
        mi re do mi[re do] fa mi re
    }

    %16
    mi8 do r
    sol'16 mi do8. sol'16
    fa do la8. fa'16

    %19
    mi do sol8. mi'16
    fa4 r8
    R4.*6

    %27
    r8 do'16 sib do do,
    do4 r8
    R4.*6

    %35
    r8 do'16 si do do,
    do4 r8
    R4.*2

    %39
    mi16 do sol8. do16
    mi do sol8. mi'16
    la8 sol fa

    %42
    fa mi4
    mi16 do sol8. do16
    mi do sol8. mi'16

    %45
    mi8 fa re
    do4 r8
    R4.*14

    %61
    fa16 do la8. do16
    fa do la8. fa'16
    sol8 fa mi

    %64
    fa4.
    fa16 do la8. do16
    fa do la8. fa'16

    %67
    sol8 fa4
    mi16 do sol8. mi'16
    sol mi do8. mi16

    %70
    fa4 fa8
    sol mi4\tr
    fa16 do la8. fa'16

    %73
    mi do sol8. mi'16
    fa do la8. fa'16
    sol mi do8. sol'16

    %76
    fa do la8. fa'16
    mi do sol8. mi'16\mbreak
    fa4 fa8

    %79
    sol mi4
    fa4.
    fa16 do la8. do16

    %82
    fa do la8. fa'16
    sol8 fa mi
    fa mi fa

    %85
    fa16 do la8. do16
    fa do la8. fa'16
    sol8 fa4\mbreak

    %88
    mi r8
    sol16 mi do8. sol'16
    la fa do8. la'16

    %91
    sol mi do8. sol'16
    la fa do8 r
    \tuplet 3/2 {
        mi16 re do mi[re do] fa mi re

        %94
        mi re do mi[re do] fa mi re
    }
    mi do sol do mi sol
    fa4.\fermata \mbreak

    %97
    R4.*15
    R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ivlan = \relative do' {

    fa4 r8
    fa4 r8
    re mi4

    %4
    do do8
    fa4 r8
    fa4 r8

    %7
    re re4
    mi r8
    mi4 r8

    %10
    fa4 r8
    mi4 r8\mbreak
    fa4 r8

    %13
    do do do
    do do do
    do do do

    %16
    do4 r8
    mi4 r8
    do4 r8

    %19
    do4 r8
    fa do4
    fa8 sol la\mbreak

    %22
    sol mi do
    fa4.
    fa8 do4

    %25
    fa8 sol la
    sol fa si,
    do4 r8

    %28
    r do re
    mi16 fa sol8 la
    sol fa si,

    %31
    do16 re mi8 re
    do do re\mbreak
    mi16 fa sol8 la

    %34
    sol fa si,
    do4 r8
    r do16 re mi re

    %37
    do4 si8
    do sol' sol,
    do4 r8

    %40
    do4 r8
    do re4
    do r8

    %43
    do4 r8 \mbreak
    do4 r8
    sol' la sol

    %46
    mi re do
    do4 fa8
    mi fa4

    %49
    do r8
    do4 r8
    do4 fa8

    %52
    do fa4
    do r8
    do mi do\mbreak

    %55
    fa4.
    sol8 mi do
    fa4.

    %58
    sol8 mi do
    fa4 la,8
    sib do4

    %61
    fa8 fa16 mi fa fa,
    r8 fa'16 mi fa fa,
    sib8 do4

    %64
    fa4.
    fa8 fa16 mi fa fa,\mbreak
    r8 fa'16 mi fa fa,

    %67
    sib8 si4
    do8 do'16 sib do do,
    r8 do'16 sib do do,

    %70
    fa4 fa8
    sib, do4
    fa8 fa16 mi fa fa,

    %73
    r8 do''16 sib do do,
    r8 fa16 mi fa fa,
    r8 do''16 sib do do,

    %76
    r8 fa16 mi fa fa,
    r8 do''16 sib do do,\mbreak
    fa4 fa8

    %79
    sib, do4
    fa4.
    fa4 r8

    %82
    fa4 r8
    re mi4
    do do8

    %85
    fa4 r8
    fa4 r8
    re re4\mbreak %%% OK

    %88
    mi4 r8
    mi4 r8
    fa4 r8

    %91
    mi4 r8
    fa4 r8
    do do do

    %94
    do do do
    do do do
    do4.\fermata\mbreak

    %97
    re8 dod la
    re mi fa
    sol dod, la

    %100
    re la' fa
    re la' fa
    re4 dod8

    %103
    re la' la,
    re la' re,
    dod la' dod,\mbreak

    %106
    re la' re,
    mi la mi
    fa la fa

    %109
    re la' fa
    re4 dod8
    re la' la,

    %112
    re4.\fermata

}

Ivocen = \relative do' {

    \autoBeamOff

    R4.*19
    fa8 sol4
    la8[sol] fa\mbreak

    %22
    sib sol4
    la8[sol] fa
    fa sol4

    %25
    la8[sol] fa
    sib la4
    la8 sol r

    %28
    r mi fa
    sol[fa16 mi] re[do]
    sib'8 la4

    %31
    la8 sol4
    r8 mi fa\mbreak
    sol[fa16 mi] re[do]

    %34
    sib'8 la4
    la8 sol r
    r sol sol

    %37
    do[si16 la] sol fa
    mi8 re4
    do r8

    %40
    R4.*6
    r8 sol' do
    mi,4 fa8

    %48
    sol la4
    sol16[mi fa re] do8
    r sol' do

    %51
    mi,4 fa8
    sol la4
    sol16[mi fa re] do8

    %54
    sib' sol4\tr\mbreak
    la8(sol) fa
    sib sol4

    %57
    la8[sol] fa
    r do sib'
    la[sol] fa

    %60
    sol mi4
    fa16[mi fa8 do]
    fa16[mi fa8 do]

    %63
    sib'8 [la sol]
    la[sol fa]
    fa16[mi fa8 do]\mbreak

    %66
    fa16[mi fa8 do]
    sib'8 la4
    sol4.

    %69
    r8 sib sol
    la[sol] fa
    sol mi4

    %72
    fa16[mi] fa4
    sol16[fa] sol4
    la16[sol] la4

    %75
    sib16[la] sib4
    do4 r8
    r do la

    %78
    la[sol]  fa
    sol mi4
    fa r8

    %81
    R4.*16
    r8 la sol
    fa[mi] re

    %99
    sib' la sol
    fa[mi] re
    r la' la

    %102
    re[do16 sib] la sol
    fa8 mi4
    re16[dod] re4

    %105
    mi16[re] mi4\mbreak
    fa16[mi] fa4
    sol16[fa] sol4

    %108
    la4 r8
    r8 la la
    re[do16 sib] la sol

    %111
    fa8 mi4
    re4.\fermata

}

Itesto = \lyricmode {

    O mie porpo - re più belle, _  dell'Au - rora a -- mate _  figlie, _

    della _ ter -- ra_il -- lustri _ stelle, _ il Pas -- tor  della _  gran Manto _

    ite _ tosto -  a coro - nar.

    O mie porpo - re più belle, _  dell'Au - rora a -- mate _  figlie, _

    il Pas -- tor  della _  gran Manto _ ite _ tosto_a _ coro - nar - - - - - - - -

    ite _ tosto_a _ coro - nar - - - - - - - - ite _ tosto_a _ coro - nar,

    e_il pretio - so suo _ bel manto _  ite _ liete _ ad inos - trar - - - - - - - -

    ite _ liete _ ad inos - trar.

}

Ibcn = \relative do {

    r8 fa16 mi fa fa,
    r8 fa'16 mi fa fa,
    sib8 do4

    %4
    fa8 do fa,
    r fa'16 mi fa fa,
    r8 fa'16 mi fa fa,

    %7
    sib8 si4
    do8 do'16 sib? do do,
    r8 do'16 sib do do,

    %10
    r8 do'16 sib do do,
    r8 do'16 sib do do,\mbreak
    r8 fa16 mi fa fa,

    %13
    R4.*3
    r8 do''16 sib do do,
    r8 do'16 sib do do,

    %18
    r8 fa16 mi fa fa,
    r8 do''16 sib do do,
    fa,4 r8

    %21
    R4.*6
    r8 do''16 sib do do,
    do4 r8

    %29
    R4.*6
    r8 do'16 si do do,
    do4 r8

    %37
    R4.*2
    do8 do'16 si do do,
    r8 do'16 si do do,

    %41
    la8 si4
    do8 do'16 si do do,
    r8 do'16 si do do,\mbreak

    %44
    r8 do'16 si do do,
    do8 fa, sol
    do4 r8

    %47
    R4.*34
    r8 fa16 mi fa fa,
    r8 fa'16 mi fa fa,

    %83
    sib8 do4
    fa8 do fa,
    r8 fa'16 mi fa fa,

    %86
    r8 fa'16 mi fa fa,
    sib8 si4\mbreak
    do8 do'16 sib? do do,

    %89
    r8 do'16 sib do do,
    r8 do'16 sib do do,
    r8 do'16 sib do do,

    %92
    r8 fa16 mi fa fa,
    R4.*2
    do'8 do do

    %96
    fa,4.\fermata\mbreak
    R4.*15
    R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}

forma = {

    \time 3/8
    \key fa\major
    \tempo 4. = 57
    s4.*112
    \bar "||"
    \mark\markup\smaller "D.C."

}


Ivl = {
    \Iglobal
    %\notypeset
    <<\Ivln\forma>>
}

IvlI = {
    \Iglobal
    <<\IvlIn\forma>>
}

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan\forma>>
}

Ivoce = {
    \new Voice = "porpore"
    \Iglobal
    <<\Ivocen\forma>>
}



Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn\forma\Ibfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

IIvln = \relative do'' {

    R1*5
    fa8
    do'16 sib la sol fa8 fa fa16 mi fa8 r fa

    %8
    sib sib sib sib sib la r la
    sol16 mi re do fa re do si sol'4. fa8
    mi re16 do si8. do16\mbreak do4 r8 do

    %11
    fa la fa mib mib re r re
    sol sib sol fa fa mi? r sol
    la sol16 fa sib8 la16 sol do4. sib8

    %14
    la sol16 fa mi8. fa16\mbreak fa4 r
    R1*3
    mi8 [sol16 fa mi8 re16 do] fa8[la16 sol fa8 mi16 re]

    %19
    sol8[sib16 la sol8 fa16 mi] la8[do16 sib la8 sol16 fa]
    si4. do8 mi, re16 do si8. do16\mbreak
    \parenthesize do4 r8 mi fa fa fa fa

    %22
    fa mi sol16 mi fa sol do,4 r8 mi
    sol sol sol sol sol fa fa16 sol la sib\mbreak
    do8 fa, r4 r2

    %25
    R1*2\mbreak
    r4 la8 la sol16 la sol la sib la sib la
    sol la sol la sib la sib la sol fa sol8 r mi16 sol

    %29
    fa8 sol16 la sol8. fa16\mbreak fa4 r8 fa
    do'16 sib la sol fa8 fa fa16 mi fa8 r fa
    sib sib sib sib sib la r la

    %32
    sol16 mi re do fa re do si sol'4. fa8
    mi re16 do si8. do16 do4 r8 do
    fa la fa mib mib re r re

    %35
    sol sib sol fa fa mi? r sol
    la sol16 fa sib8 la16 sol do4. sib8
    la sol16 fa mi8. fa16\mbreak fa4\fermata r

    %38
    R1*2
    r2 la16 fa mi re sib' sol fa mi
    la fa mi re sib' sol fa mi la8 re, r la'16 re

    %42
    do16 la sib re, mi8. re16 re4 r\mbreak
    R1*3

}

IIvocen = \relative do' {

  \autoBeamOff

    sol'8 sol mi mi16 re re8 re r la'
    fa fa fa mi mi mi r si'\mbreak
    sold sold fad mi la la r4

    %4
    la8 la16 la sol8 la fa fa sold la\mbreak
    mi4 r r2\fermata
    r8

    %7
    R1*7
    r2 fa8[la] do fa,
    mi fa r fa sib sib sib sib

    %16
    sib la la fa sol16[fa sol8] r16 do [sib do]
    fa,[mi fa8] r16 la[sol fa]\mbreak mi8 re16 do si8. do16
    do4 r r2

    %19
    R1*2\mbreak
    sol'4 r8 do, la' la la la
    la sol r4 sol r8 do,

    %23
    sib' sib sib sib sib la r4\mbreak
    fa16[sol la sib] do8 fa, mi16[do mi sol] la8[sol]
    fa16[mi fa la] sib8[la] sol16[mi sol sib] do8[sib]

    %26
    la sol r sol 16 sib la8 sol16 fa mi8. fa16\mbreak
    fa4 fa8 fa mi16[fa mi fa] sol[fa sol fa]
    mi[fa mi fa] sol[fa sol fa] mi[re] do8 r sol'16 sib

    %29
    la8 sol16 fa mi8. fa16\mbreak \parenthesize fa4 r
    R1*7
    r2\mbreak r4 la8 la

    %38
    sib16[la] sol fa mi8 re mi dod r la'16 sol
    fa16[mi fa re] sol[fa sol mi] la8 sib la sol\mbreak
    fa mi16[re] dod8. re16 re4 r

    %41
    R1
    r2 r4 la'8 re,\mbreak
    sib' sib sib la sold16[fad] mi8 r mi16 la

    %44
    fa?16[mi fa re] sold[fad! sold mi] do'8 si16[la] sold8. la16
    la1\fermata

}

IItesto = \lyricmode {

    Tutta _  vaga_e _  festo - sa co -- sì tra mille _  fiori _ per dir la bella _ Clori _

    la porpo - rina _ rosa_a _ favel - lar.

    No, no, non vidi _ non vidi_il _ più gen -- tile _  né_in pieta - - - - - de o nobil - tà,

    no, non vidi_il _ più gen -- tile _  no, non vidi_il _ più genti - le né in pieta - - - - - - - de

    né_in pieta - de o  nobil - tà, né_in pieta - - - - - de, né_in pie -- tade _ o  nobil - tà.

    né un altro _ a lui simi - le, né più dot - - to né più dotto _ si vedrà, _

    né un altro_a _ lui simi - le, né più dot - - to si vedrà. _

}

IIbcn = \relative do {

    do2 si~
    si sold
    re' do~

    %4
    do re
    mi la,\fermata
    r8

    %7
    fa'4 mi re8 do sib la
    sol4 do fa8 sol la fa
    mi4 re si8 la si sol

    %10
    do fa sol sol,\mbreak do' re do sib
    la4. fa8 sib do sib la
    sol4. si8 do si do mi,

    %13
    fa4 sol la8 [sol16 fa mi8 do]
    fa8 sib do[do,]\mbreak fa sol la fa
    sol la sol fa mi re mi do

    %16
    fa mi fa fa, do'4 mi
    re si\mbreak do8 fa sol[sol,]
    do4 r re r

    %19
    mi r fa r
    sol8 fa sol  mi do fa sol [sol,]\mbreak
    do re mi do fa4 r8 fa

    %22
    do4 r do8 re mi do
    do4 r8 do fa sol la sol\mbreak
    fa sol la fa do4 r

    %25
    re r mi r
    fa8 do mi do fa sib do[do,]\mbreak
    fa4 r do r

    %28
    do r do8 re mi do
    fa4 do\mbreak fa r
    fa mi re8 do sib la

    %31
    sol4 do fa8 sol la fa
    mi4 re si8 la si sol
    do fa sol sol,\mbreak do' re do sib

    %34
    la4. fa8 sib do sib la
    sol4. si8 do si do mi,
    fa4 sol la8[sol16 fa mi8 do]

    %37
    fa sib do do,\mbreak fa,4\fermata fa'8 re
    sol,4 sold la8 si dod[la]
    re4 mi dod4. la8

    %40
    re sol la[la,] re4 sol
    fa sol fa8 mi fa re
    la' sib la la, re mi fa mi\mbreak

    %40
    re4. red8 mi re? do[la]
    re4 mi la,8 re mi[mi,]
    la1\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

}

forma = {

  \time 4/4
  \key do\major
  \tempo 4 = 50
  s1*5
  \bar "||"\break \once \override Score.RehearsalMark.extra-offset = #'(+6 . +1.0)
  \mark\markup\huge \column {"[3.] [Aria]"}
  \key fa\major
  \tempo 4 = 75
  \partial 8 s8
  s1*39
  \bar "||"
  \mark\markup\smaller "D.C."

}


IIvl = {
  \IIglobal
  %\notypeset
  <<\IIvln\forma>>
}

IIvoce = {
  \new Voice = "vaga"
  \IIglobal
  <<\IIvocen\forma>>
}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn\forma\IIbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \header {
        subtitle = \markup {Cantata in lode del Vescovo di Mantova [RV 685]}
        composer = \markup\center-column {"A. Vivaldi (1678 -1741)"}
    }

    \markup \huge "[1.] All[egr]o"


    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \Ivl
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column {"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column {"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 3/8 r4 r8^\markup\right-align"[Contralto]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce
                \new Lyrics \lyricsto "porpore" \Itesto
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup\center-column {"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm
            incipit-width =1.8\cm

            \context	{
                \Score
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

    \paper  {

        systems-per-page = #6

    }

    \markup \huge "[2.] [Recitativo]"


    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Viol[in]i""Soli"}
                \set Staff.midiInstrument = #"violin"
                \IIvl
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 sol'8}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIvoce
                \new Lyrics \lyricsto "vaga" \IItesto
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm
            incipit-width =1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.20.0
%}
