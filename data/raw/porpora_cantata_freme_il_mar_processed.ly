\language "italiano"
	%********************************** VARIABILI

\version "2.17.97"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

ten = ^\markup \italic \center-align "ten"

piuf =_\markup\italic\bold "più f"

pof =_\markup\italic\bold "poco f"

pf  = #(make-dynamic-script "pf")

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
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}
mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto\senza
}

Ifln = \relative do'' {

    \tuplet 3/2 { fa8 sol fa la[sib la] do re do }
    fa,4 \tuplet 3/2 { do'8 sib do } re8. fa,16
    mi4. re16 do \tuplet 3/2 {
        sol'8 la sib

        %4
        la do, si do[si do] fa sol la\mbreak
        sol do, si do[si do] sol' la sib?
    }
    la8. sol16 si4. do8

    %7
    do4~\tuplet 3/2 {
        do8 re do sib?[do la]
        sib sol fad sol[la sib]~sib la sol\mbreak
        la fa mi fa[sol la]~la sol fa

        %10
        sol do, si do[si do] sol' la sib?
        la do, si do[si do] fa sol la
        sol do, si do[mi fa] sol la sib?\mbreak
    }

    %13
    do8. fa,16 sol4 mi
    fa r r
    R2.

    %16
    \tuplet 3/2 { fa8 sol fa la[sib la] do re do }
    fa,4  r r
    \tuplet 3/2 { r8 do si do[si do] sol' la sib?\mbreak }

    %19
    la4 r r
    r \tuplet 3/2 { la,8 sib la do[re do]}
    fa4 r r

    %22
    \tuplet 3/2 { r8 sol fad sol[la sib]~sib la sol }
    \parenthesize sib,4 r r
    R2.*10  %%%% inizio p. 4

    %34
    \tuplet 3/2 {
        r8 sol' fad sol[la sib]~sib la sol
        la fa mi fa[sol la]~la sol fa
        sol do, si do[si do] sol' la sib?
    }\mbreak

    %37
    la4 r r
    \tuplet 3/2 { sol8 la sol re[mi re] } sol4
    R2.

    %40
    \tuplet 3/2 { fa8 sol fa do'[re do] } fa,4
    R2.
    \tuplet 3/2 { fa8 sol fa do'[re do] } fa,4\mbreak

    %43
    R2.*3
    \tuplet 3/2 { r8 do si do[si do] sol' la sib?\mbreak }
    do4 r r

    %48
    R2.*7
    \tuplet 3/2 {
        r8 do, si do[si do] fa sol la
        sol do, si do[si do] sol'[la sib?]
    }

    %57
    la4 r r
    \tuplet 3/2 { r8 do, si do[si do] sol'[la sib?]}
    la4 r r\mbreak

    %60
    \tuplet 3/2 { do,8 re do mi[fa mi] sol la sol }
    do4 r r
    R2.*7

    %69
    r8 do si4. do8
    do4~\tuplet 3/2 {
        do8 re do sib?]do la]
        sib sol fad sol[la sib]~sib la sol

        %72
        la fa mi fa[sol la]~la sol fa\mbreak
        sol do, si do[si do] sol' la sib?
        la do, si do[si do] fa sol la

        %75
        sol do, si do[mi fa] sol la sib?
    }
    do8. fa,16 sol4 mi
    fa r r

    %78
    r \tuplet 3/2 { sol8 la sol } do4~
    do si2
    do4 sol2

    %81
    R2.
    re4 sol8 la16 sol si8 do16 si\mbreak
    do4 r r

    %84
    R2.*6
    \tuplet 3/2 { r8 fa, [mi fa mi fa ]re'[dod re] }
    mi,4 r r\mbreak

    %92
    r \tuplet 3/2 { mi8 fa mi si'[do re] }
    do4 r r
    R2.

    %95
    do4~\tuplet 3/2 { do8 la sold la[si? do]\mbreak }
    re4~\tuplet 3/2 { re8 si la si[do re] }
    fa,4 si,2

    %98
    la sold4
    la2.

}


Ivocen = \relative do'' {

    \autoBeamOff
    R2.*14
    fa4 do sib
    la2 r4

    %17
    do sib la
    la sol r\mbreak
    do(fa,) re'

    %20
    mi, fa r
    do' re do
    do sib r

    %23
    sib do(sib)
    sib(la) do\mbreak
    re si2

    %26
    do4(sol) do
    re si2
    do4 sol do

    %29
    mib(re) do
    sib8. [la16] sib4 do
    re(sol,) mib'\mbreak

    %32
    do~\tuplet 3/2 { do8 [sib la] sib [la sol]
    mib'?[re] do} sib4 la
    sol2 r4

    %35
    R2.*2\mbreak
    do4 fa do
    do sib r

    %39
    sib do((sib)
    sib(la) do
    re sib2

    %42
    do4(fa,) do'\mbreak
    re sib2
    do4 re8. [mi16] fa4

    %45
    sib, sib la
    la sol r
    do(fa,) do'

    %48
    re sib8.[la16] \tuplet 3/2 { sib8[do re] }\mbreak
    do4 la4. sib16 [do]
    sib4 sol8.[fa16] \tuplet 3/2 { sol8[la sib] }

    %51
    la4~\tuplet 3/2 { la8[sol fa] sib[la sol] }
    do4~\tuplet 3/2 { do8[sib la] re[do sib] }
    fa'4. mi16[re] \tuplet 3/2 { do8[sib do]

    %54
    re[do] sib} la4 sol\mbreak
    fa r r
    do' r r

    %57
    do(sib) la
    la(sol)  r
    do sib la\mbreak

    %60
    la sol r
    r do fa,
    re'8. do16 sib4. re8

    %63
    do8. sib16 la4. do8\mbreak
    sib8.[la16] sol4. la16[sib]
    \tuplet 3/2 {la8[sol fa] }sib4. la16[sol]

    %66
    \tuplet 3/2 { do8[sib la] } re4. do16[sib]
    fa'4. mi16[re] do4
    re sol,4. fa8\mbreak

    %69
    fa4 r r
    R2.*7
    r4 la re

    %78
    si do r
    re(sol,) fa'
    mi8. re16 do4. si8

    %81
    \tuplet 3/2 { do[re] mi } re4. do8
    si16[la] sol8 r4 r\mbreak
    do4 do(re)

    %84
    sib8.[la16] sib4 re~
    re mib sol,
    fad4. sol8 \tuplet 3/2 { la[sib] do }

    %87
    sib4 si4. do16[si]\mbreak
    re4. do16[si?] \tuplet 3/2 { la8[sol la] }
    fa'4 dod4. re8

    %90
    re2.~
    re4 mi4. re8\mbreak
    do4 si r

    %93
    mi(la,) fa'
    sold,2 si4~
    \tuplet 3/2 { si8[la sold] la[do si] }do4~\mbreak

    %96
    \tuplet 3/2 { do8[si la] si[re do] } re4~
    \tuplet 3/2 { re8[do si?] } fa'4 mi8.[re16]
    \tuplet 3/2 { do8[si la]} si4. la8

    %99
    la2.

}

Itesto = \lyricmode {

    Freme _ il mar e col sus[s]urro _ _ par che dica _ in questa _  sponda _ più non v'è la bella _ Ni -- ce

    che rendeva _ _ il cor feli - - ce dell' a -- man - - te suo fedel _

    in questa _  sponda _ più non v'è la bella _ Ni -- ce che rendeva _ _  _ il cor felice _ _ dell'

    a -- man - - - - - - - - - - - - - - - - te suo fe -- del,  no non v'è più la bella _ Ni -- ce

    che rendeva_il  _ _  cor felice _ _ dell'  a -- man - - - - - - - - - - -  te suo fe -- del.

    Questa _ spiaggia _ tan -- to vaga _ che soave _ il cor ristora _ _

    or l'af -- fligge _  ed è_una _ piaga _ che gli dà do - - - - - glia crudel - è_una _

    piaga _ che gli dà do - - - - - -  - glia crudel. _

}


Ibcn = \relative do {

    fa4 fa, r
    fa' la sib
    do do, mi

    %4
    fa r fa\mbreak
    mi r do
    fa re sol

    %7
    mi fad re
    sol sol, mi'\mbreak
    fa la fa

    %10
    mi do mi
    fa la fa
    mi do' sib\mbreak

    %13
    la sib do
    fa, r r
    fa la sol

    %16
    fa fa, r
    la' sol fa
    do' do, mi\mbreak

    %19
    fa la sib
    do fa, r
    la sib la

    %22
    sol2 mi4
    re r r
    fa2 mi4\mbreak

    %25
    fa re sol
    mi do mi
    fa re2

    %28
    mi4 r r
    fad2 re4
    sol sol, la'

    %31
    sib2 sol4\mbreak
    la fad sol
    do re, re,

    %34
    sol mi' do
    fa la fa
    do2 mi4\mbreak

    %37
    fa r fa
    sol sol, r
    mi'2 r4

    %40
    fa fa, la'
    sib2 sol4
    fa2 la4\mbreak

    %43
    sib2 sol4
    la sol fa
    mi fa fa,

    %46
    do' do' sib
    la2 fa4
    sib2 sol4\mbreak

    %49
    la2 fa4
    sol2 do,4
    fa fa, sol'

    %52
    la la, sib'
    fa sol la
    sib do do,\mbreak

    %55
    fa2 la4
    mi do mi
    fa sol fa

    %58
    do2 r4
    fa sol fa\mbreak
    do do' sib

    %61
    la fa la
    sib sib, sol'
    la la, fa'\mbreak

    %64
    sol fa do
    fa sol sol,
    la' sib sol

    %67
    fa sol la
    sib do do,\mbreak
    fa sol fa

    %70
    mi fad re
    sol mi do
    fa la fa\mbreak

    %73
    mi do mi
    fa do' sib
    mi, do' sib

    %76
    la sib do
    fa, r fa
    fa mi do

    %79
    fa sol sol,
    do fa sol
    mi  fad re

    %82
    sol sol, fad'?\mbreak
    mi2 fad4
    sol sol, r

    %85
    sib' do, mib
    re re, fad'
    sol fa? re\mbreak

    %88
    fa re fa~
    fa8. sol16 la4 la,
    re si' la

    %91
    sold mi sold\mbreak
    la mi sold
    la do, re

    %94
    mi mi, sold'
    la la, la'\mbreak
    si2 la4

    %97
    sold2 mi4
    la, mi'2
    la,2.

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key fa\major
    \tempo 2 = 55
    s2.*76
    s4
    \bar"||"\break
    s2
    s2.*22
    \bar "||"
    \mark \markup {\ds}

}



Ifl = {
    \global
    \notypeset
    <<\Ifln \forma>>

}


Ivoce = {
    \new Voice = "freme"
    \global
    %\clef soprano
    <<\Ivocen \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


global = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}


IIvocen = \relative do'' {

   \autoBeamOff
   r4 r8 re re la la sib
   sol sol r mi' dod dod dod re\mbreak
   re la r4 r r8 mib'

   %4
   do? do  do si do do r16 do re la
   sib?8 sib mib4\mbreak do do8 sib
   sol sol r4 si4 r16  si re si

   %7
   do8 do r8 do do sol sol sol16 la\mbreak
   sib8 do16 re sib8. la16 la8 la r do
   fa,8. fa16 sib8 do mib4 mib

   %10
   mib?8 la,16 la la8 sib\mbreak sib sib re4
   fa8 re si si r16 si re sol, do4
   la8 la16 la sib8 do\mbreak sol8 sol r4

   %13
   r do8 fa, fa' do la la16 sib
   do8. do16 re8 mi re re r4\mbreak
   re8 do sib do16 re mi,8 mi r8 do'

   %16
   re sib r8 la fa fa r4
   r1\fermata

}

IItesto = \lyricmode {

   File - no_ab -- bando - nato _ quanto _  mi fai pie -- tade _

   par -- tì  la bella _ Irene _ e tu re -- stasti_a - man -- te disperato, _ _ _

   Ma a che t'af -- fliggi _ indarno _ _ speri _ dar tregua _  alle_ tue _ pene _ è ver

   che lontananza _ _ _ salda _  mortal _ fe -- rita _  ma tu ben sai _

   che vero_a - mor non si guarisce _ _ mai. _

   Segui _ segui _ dunque _ fedel _ chi t'innamora _ _ _  e

   così _ goderai _ _ _ felice _ _ ogn' ora. _

}


IIbcn = \relative do {

   re1
   mi
   fa2 fad~

   %4
   fad1
   sol4 do,~\mbreak do2
   re4 sol, fa'?2

   %7
   mi1\mbreak
   mi2 fa~
   fa1~

   %10
   fa2\mbreak re~
   re4  fa2 mi4
   fa2\mbreak sol

   %13
   do,4 la~la2~
   la sib~\mbreak
   sib~sib4 la

   %16
   la2 do
   fa,1\fermata

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1*2
   <6>1
   s1*2
   <_+>2 <6 4!>
   s1*5
   s2 <_!>

}

forma = {

   \time 4/4
   \key fa\major
   \tempo 4 = 65
   s1*17
   \bar"|."

}


IIvoce = {
   \new Voice = "sileno"
   \notypeset
   \global
   %\clef soprano
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


global = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

IIIfln = \relative do'' {

   do8
   fa sib, la
   \stemUp la sol \stemDown do'~\stemNeutral
   do8 sib16 la sol fa

   %4
   mi16 fa32 sol fa8\noBeam r
   la16 sib32 do do8. [re16]
   sol,16 la32 sib sib8.[do16]

   %7
   la16 sib32 do do8.[re16]\senza
   \tuplet 3/2{mi,16 fa sol fa[sol la] sol la sib}
   la16. do,32 do8.[re32 do]

   %10
   sol'16. do,32 do8.[re32 do]
   la'16.[do,32] do8. re32 do\mbreak
   sib'16.[do,32] do8. re32 do

   %13
   \tuplet 3/2 { do'16 sib la sib[la sol] la sol fa  }
   re'16. re,32 mi8 fa
   fa4 r8

   %16
   R4.*7
   r8 r do'~\mbreak
   do sib16 la sol fa

   %25
   mi fa32 sol fa8\noBeam r
   R4.*7
   r16 do do8.[re32 do]

   %34
   la'16. do,32 do8.[re32 do]
   sol'8 r r\mbreak
   R4.*3

   %39
   la16[sib32 do] do8. re16
   sol,16 la32 sib sib8.[do16]
   la16 sib32 do do8.[re16]

   %42
   \tuplet 3/2{mi,16 fa sol fa[sol la] sol la sib}
   la8 r r
   R4.*2

   %46
   r8 r do,
   la'16[sib32 do] do8. re16\mbreak
   sol,16 [la32 sib] sib8. do16

   %49
   la8 r r
   R4.*9
   r8 r do,

   %60
   fa sib, la\mbreak
   la sol \once\stemDown do'~
   do sib16 la sol fa

   %63
   mi16 fa32 sol fa8\noBeam r
   la16 sib32 do do8. [re16]
   sol,16 la32 sib sib8.[do16]

   %66
   la16 sib32 do do8.[re16]
   \tuplet 3/2{mi,16 fa sol fa[sol la] sol la sib}
   la16. do,32 do8.[re32 do]

   %69
   sol'16. do,32 do8.[re32 do]
   la'16. do,32 do8.[re32 do]\mbreak
   sib'16.[do,32] do8. re32 do

   %72
   \tuplet 3/2 { do'16 sib la sib[la sol] la sol fa  }
   re'16. re,32 mi8. [fa16]
   fa4 r8

   %75
   R4.*11
   r16  re re8. [mib32 re]
   la'16. re,32 re8.[mi32 re]

   %88
   sib'16.[re,32] re8. mi32 re
   do'8 r r
   R4.*10

   %100
   r16 mi,\noBeam mi8. fa32 mi
   si'16.[mi,32] mi8. fa32 re
   do'16.[mi,32] mi8. fa32 mi\mbreak

   re'8 r r
   R4.*4
   r4

}


IIIvocen = \relative do'' {

   \autoBeamOff
   r8
   R4.*14
   r8 r do
   fa[sib,] la

   %17
   la sol do~\mbreak
   do sib16[la] sol[fa]
   mi8 fa sol

   %20
   la la8.[sib32 do]
   sol8[sol8. la32 sib]
   la16[do sib la sol fa]

   %23
   do'[si] do8 r\mbreak
   R4.
   r8 r do~

   %26
   do do do
   re16[mi32 fa] sib,8 r
   sib sib sib

   %29
   do16[re32 mi] la,8 r\mbreak
   do re mi
   fa[re] mi

   %32
   do re do16[si]
   do4.~
   do~

   %35
   do16[si do mi re fa]\mbreak
   mi8[re16 mi] do8
   re si4

   %38
   do4.
   R4.*4
   do8 fa do

   %44
   re do fa~
   fa sib, la
   la sol r

   %47
   R4.*2
   do8 fa, do'
   re16[do] re8 r

   %51
   sib la16[sol] la[sib]
   do[sib] do8 r
   fa, sol la\mbreak

   %54
   sib[la8. sol16]
   do8[sib8. la16]
   re8[do8. sib16]

   %57
   fa'8 mi16[re] do[sib]
   la8 sol4
   fa r8

   %60
   R4.*14
   r8 r la
   re dod4

   %76
   re8 la do?~\mbreak
   do re16[do] si8
   do sol sib~

   %79
   sib do16[sib] la8
   re do16[sib] la[sol]
   do8 do[sib]

   %82
   la[sib16 do re8]~
   re[do16 sib la sol]\mbreak
   fad8 sol la

   %85
   sib la4
   sol r8
   R4.

   %88
   r8 r la
   sib16[do32 re] do8 sib\mbreak
   sib la do~

   %91
   do16[re32 mi] re8 do
   do si re~
   re16[mi32 fa] mi8 re\mbreak

   %94
   do[si8. la16]
   re8[do8. si?16]
   mi8 re16[do] si[la]

   %97
   fa'8[mi] la,
   sold la re\mbreak
   do16[re mi do] re[si]

   %100
   la8[do8. re32 mi]
   r8 si16[do re8]
   r do16.[re32 mi8]\mbreak

   %103
   r fa la,
   sold la mi'~
   mi fa la,

   %106
   sold la re
   do si4\mbreak
   la4

}

IIItesto = \lyricmode {

   La pasto - rella _  la -- scia_  la villa _ per coglier _ ro -  - se, ed il pa -- store _

   lascia _  la gregge _ ed il suo_a -- more _  seguendo _ _ và - seguendo _ _ và.

   La pasto - rella _  la -- scia_  la villa _ ed il pa -- store _

   lascia _  la gregge _ ed il suo_a -- mo - - - re seguendo _ _ và.

   La torto - rella _ la -- scia_il suo nido _ e và seguendo _ _ chi l'innamo - - - ra

   con fedeltà, _ _

   la -- scia_il suo _ nido _  la torto - rella _ e và se -- guen - - do chi

   l'inna - mora _ con fe -- deltà, - - -  và seguendo _ _ chi l'inna - mora _

   con fedeltà. _ _



}


IIIbcn = \relative do {

   r8
   la'8 sol fa
   do' do, mi
   fa re sib

   %4
   do4 r8
   fa la do\mbreak
   mi, sol do

   %7
   fa, la do
   do, re mi
   fa la fa

   %10
   mi do mi
   fa la fa\mbreak
   sol mi do

   %13
   la' sol fa
   sib do do,
   fa4 r8

   %16
   la sol fa
   do mi4\mbreak
   fa8 re sib

   %19
   do re mi
   fa la do
   mi, sol do

   %22
   fa, re4
   do mi8\mbreak
   fa8 re sib

   %25
   do4 r8
   la' fa la
   sib sib, sib'

   %28
   sol mi sol
   la sib, sol'\mbreak
   fa4  mi8

   %31
   re si' do
   mi, fa sol
   do, mi do

   %34
   fa la fa
   mi4 si8\mbreak  %%%% fine p.11
   do re mi

   %37
   fa sol sol,
   do4.
   fa8 la do

   %40
   mi, sol do
   fa, la do\mbreak
   do, re mi

   %43
   fa4 la8
   sib fa la
   sib sol fa

   %46
   do' do, mi
   fa la do\mbreak
   mi, la do

   %49
   fa,4 la8
   sib4 la8
   sol r r

   %52
   la r r
   fa mi fa\mbreak
   sol fa mi

   %55
   la sol fa
   sib la sol
   la4 fa8

   %58
   fa do' do,
   fa4 r8
   la sol fa\mbreak

   %61
   do' do, mi
   fa re sib
   do4 r8

   %64
   fa la do
   mi, sol do\mbreak
   fa, la do

   %67
   do, re mi
   fa la fa
   mi do mi

   %70
   fa la fa\mbreak
   sol mi do
   la' sol fa

   %73
   sib do do,
   fa4 r8
   re la' sol

   %76
   fa4 mi8\mbreak
   fa re sol
   do,4 re8

   %79
   mi do mi
   sib'4 sib8
   la fad sol

   %82
   re4 fad8
   sol mi do\mbreak
   re sib' re,

   %85
   mi do re
   \once\stemUp sol, sib' sol
   fad re fad

   %88
   sol sib sol
   fad do mi\mbreak
   fa? fa, r

   %91
   fad' re fad
   sol sol, r
   sold' mi sold\mbreak

   %94
   la4 r8
   si4 r8
   do,4 r8

   %97
   re do re
   mi fa re\mbreak
   mi4 mi,8

   %100
   la la' do
   mi, la do
   mi, la do\mbreak

   %103
   fa, re fa
   mi do' sold
   la re, fa

   %106
   mi do re
   mi mi,4\mbreak
   la4

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 3/8
   \key fa\major
   \tempo 4 = 65
   \partial 8 s8
   s4.*74
   \bar"||"\break
   s4.*33
   \set Score.measureLength = #(ly:make-moment 1 4)   s4
   \bar"||"
   \mark \markup {\ds}

}



IIIfl = {
   \global
   %\notypeset
   <<\IIIfln \forma>>

}


IIIvoce = {
   \new Voice = "pastorella"
   \global
   %\clef soprano
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
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[1.] Amoroso}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"recorder"
                \set Staff.instrumentName = \markup  \center-column{"Flauto"}
                \Ifl
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce
                \new Lyrics \lyricsto "freme" \Itesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \Ibc

            >>
        >>

        \layout {

            indent = 1.3\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

\bookpart {

    \paper  {

        systems-per-page = #7

    }

    \markup \huge {[2.] Rec[itati]vo}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"voice oohs"
                \IIvoce
                \new Lyrics \lyricsto "sileno" \IItesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \IIbc

            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[3.] And[ant]e}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"recorder"
                \IIIfl
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"voice oohs"
                \IIIvoce
                \new Lyrics \lyricsto "pastorella" \IIItesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc

            >>
        >>

        \layout {

            indent = 0.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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


%{
convert-ly (GNU LilyPond) 2.19.83  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
