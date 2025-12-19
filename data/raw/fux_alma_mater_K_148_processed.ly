\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

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
mbreak = { }


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f

}

Isopranon = \relative do'' {

   \autoBeamOff

   R1*3
   r2 sib16[do re mib] fa8 re\mbreak
   fa4 sib, r fa'8 re

   %6
   mib8. mib16 mib8 re16[do] re8 sib fa'16[mib fa re]
   mib[re mib do] re[do re sib] do4 fa,
   r do'8 do\mbreak re4 mi

   %9
   fa8[mi16 re] do[sib la sol] fa4~fa16 [re' do re]
   la4 sol fa2
   R1

   %12
   r2 r4 r16 fa [sol la]\mbreak
   sib [do sib do] sib[do sib do] sib8 sol r16 sol[la sib]
   do[re do re] do[re do re] do8 la r16 la[sib do]

   %15
   re[mib re mib] re[mib re mib] re8 sib r16 sib[do re]
   mib[fa mib fa] mib[fa mib fa]\mbreak mib8 do fa8. mib16
   re4~re16[mib do re] mib8[la,] sib[do]

   %18
   re16[la sib mib] do4 sib2
   R1*2
   r2 r4 re

   %22
   mib8. re16 mib4 fa8. mib16 re8 do
   re[do] re4 r8 mib do8. sib16
   do[la sib do] re[do sib la]\mbreak sib4 sol

   %25
   r8 sib do16[sib] do8 re2~
   re4~re16[re mib fa] sol[fa mib re] mib[re do sib]
   la8[fad] sol16[mib' re mib] sib4 la\mbreak

   %28
   sol2 r
   R1
   r4 re' mi8. re16 mi4

   %31
   fa8 mi16[fa] sol[(fa)] mi[(re)] dod4 la
   r8 re mi16[re] mi[[re] dod8[mi] la4
   r16 re,[mi fa] sol4 r16 fa[mib re] mib8[re16 dod]

   %34 OOKK
   re4~re16[dod re mi] mi2
   re r4
   R2.*5

   %41
   r4 r sib
   do fa, do'\mbreak
   re mib8 [re] mib4

   %44
   la, re8 [do] re4
   sol, do8 [sib la sol]
   la4 fa r

   %47
   R2.*3
   r4 r sib
   do fa, do'\mbreak

   %52
   re mib8 [re] mib4
   la, re8 [do] re4
   sol, do8 [sib la sol]
   la4 fa r

   %56
   sol4. la8 sib do
   re4. mib8 re[mib]
   fa[sib,] la4. sib8

   %59
   sib2 r4\mbreak
   re2 r4
   sol, fa'4. re8
   mib[re] mib4 r8 do

   %63
   fa[(mib)] mib[(re)] re[(do)]
   si4 sol r8 sol'
   mib[sol] re[sol] do,[sol']

   %66
   si,4 sol2\mbreak
   r4 sol sol
   la2 si4

   %69
   do8[si do re] si[do]
   re[do re mib do re]
   mib[re] do2

   %72
   r4 sol' lab
   si,2 do4\mbreak
   re fa mib8[si]

   %75
   do[re] re2
   do2.
   R2.*10

   %87
   r4 mib8. re16 do8  fa, fa'8. mib16
   re8. do16 sib4\mbreak r do8. re16
   mib8[do] re sib la4-+ sib

   %90
   fa8 fa sol la sib2~
   sib4~sib16[sib do re] mib[re mib do] re[fa sol la]\mbreak
   sib8 sib, r4 do4. re8

   %93
   mib[(re)] mib[(do)] re[do] sib [do]
   la2 sib
   do4. sib8 do[sib] do4\mbreak

   %96
   re8[do] re4 mib8[re] mib[fa]
   sol4. fa8 mib16[sib do re] mib4~
   mib re mib2

   %99
   do4. sib8 la4 sib
   mib4. do8 fa8.[sol16 fa8 mib]\mbreak
   re4 do sib2~

   %102
   sib r

}

Itesto = \lyricmode {

    Al - ma al -- ma al -- ma Re -- dem -- ptoris _ Ma -- ter,

    al - - - ma Re -- dem -- pto -- ris Ma - - - - ter,

    al - - - ma al - - - ma al - - - ma al - - - ma Re -- dem -- pto - ris Ma - ter,

    quæ per -- via _ cæ -- li porta _ ma -- nes et stel -- la ma - - ris,

    et stel -- la ma - - - - - - ris, quæ per -- via _ cæ -- li porta _ ma -- nes

    et stel -- la ma - - - - - - - ris.

    Suc -- cur -- re ca -- den - - - - - - - - ti, suc -- cur -- re ca -- den  - - - - - - - -  ti,

    sur -- gere _  qui cu -- rat, cu -- rat,  po -- pu -- lo:

    tu quæ ge -- nu -- is -- ti, na -- tu -- ra mi -- ran -- te, mi -- ran - - - te,

    tu -- um san -- ctum Ge -- ni -- to - rem, tu -- um san -- ctum  san -- ctum Ge -- ni -- to -- rem.

    Vir -- go pri -- us ac po -- steri - us, Ga -- bri -- e -- lis ab o -- re

    su -- mens il -- lud A - - - ve su -- mens il -- lud A - - ve, pec -- ca -- to -- rum

    mi -- se -- re -- re, mi -- se -- re - - re, pec -- ca -- to -- rum mi -- se -- re - - re.

}

IvlIn = \relative do'' {

    sib16 do re mib fa8 re fa sib, r4
    fa'8 sib16 lab sol fa sol lab fa4. sol16 fa
    mib4~mib16 sol fa mib re do re mib do4-+

    %4
    \parenthesize sib2 r\mbreak
    sib16 do re mib fa8 re fa4 re
    R1*5

    %11
    sib'8 la16 sol fa mib re do sib4 la8 re
    la4 sol-+ fa2\mbreak
    r8 fa sol fa sol4 r

    %14
    r8 sol la sol la4 r
    r8 la sib[la] sib4 r
    r8 sib do sib\mbreak r2

    %17
    R1
    r2 r16 fa' sol la sib fa re fa
    sol4. fa16 mib re mib fa4 mib16 re\mbreak

    %20
    do8. sib16 do8 re mib4. fa16 mib
    re do re mib \parenthesize do4 sib2
    R1*3

    %25
    r2 r8 la sib16(la) sib8
    la la' sib[sib,] r2
    R1

    %28
    r2 r16 re mib fa sol fa mib re
    do8 la sib[mib] sib4 la
    sol2 r

    %31
    R1*4
    r4 r sib'~
    sib la8 sib do4

    %37
    fa,4. re8 mib fa
    sol4. fa8 mib re
    do4. re8 mib do
    re4 do2

    %41
    sib r4
    R2.*4
    r4 r sib'

    %47
    sol8 fa mib re do sib
    la fa sol la sib4~
    sib la2-+

    %50
    sib r4
    R2.*25
    r4 sol' la

    %77
    si,2 do4
    r re re
    do sib la

    %80
    sib la2
    sol4 sol' lab\mbreak
    si,2 do4

    %83
    re2 mib4
    fa mib re
    mib re2

    %86
    do2.
    sol'2\p fa~
    fa sol4. fa8

    %89
    mib mib, fa4. mib8 re4
    fa' mib re8.[re16 mib8 fa]
    sol4 fa r2\mbreak

    %92
    R1*3
    sol4. fa8 mib4 fa~\mbreak
    fa fa sol4. lab8

    %97
    sib4. lab8 sol4. fa8
    fa2 mib4 mib~
    mib8 re do2 re4

    %100
    sol,4. la8 sib2\mbreak
    sib4 la sib8 re, mib fa
    sol2 fa

}

IvlIIn = \relative do'' {

    sib16 la sib do re8 sib re[re,] r4
    r4 mib'2 re4~
    re do4. sib4 la8

    %4
    sib2 r\mbreak
    sib16 la sib do re8 sib re4 sib
    R1*4

    %10
    r2 fa'8 mi16 re do sib la sol
    fa2 sol8 mi fa4~
    fa mi fa2\mbreak

    %13
    r8 re mib? re mib4 r
    r8 mi fa mi fa4 r
    r8 fad sol[fad] sol4 r

    %16
    r8 sol lab sol\mbreak r2
    R1*2
    r16 sib do re mib do la do re4. do16 sib\mbreak

    %20
    la8. sol16 la8 sib do4. re16 do
    sib la sib do la4 sib2
    R1*3

    %25
    r4 r8 sol fad16(mib) fad8\noBeam sol sol'
    fad16 mi fad8 sol sol, r2
    R1\mbreak

    %28
    r16 sol sib do re do sib la sol8. la16 sib4
    la8 fad sol2 fad4
    sol2 r

    %31  OOKK
    R1*4
    r4 r re'
    do4. sib8 la4

    %37
    sib8 do re sib do re
    mib4. re8 do sib
    la4. sib8 do la

    %40
    sib2 la4
    sib2 r4
    R2.*4

    %46
    r4 r fa'
    sib, sol'8 fa mib re
    do la sib do re4

    %49
    do do2-+
    sib r4
    R2.*26

    %77
    r4 re mib
    fad,2 sol4
    la sol fad

    %80
    sol2 fad4
    sol2 r4\mbreak
    r sol' lab

    %83
    si,2 do4
    re do si
    do2 si4

    %86
    do2.
    sib2\p  la
    sib\mbreak sib4 sol

    %89
    sol8 la sib[re] do4 sib8 do
    re4 do sib8.[sib16 do8 re]
    mib4 re r2\mbreak

    %92
    R1*3
    mib2 do4 lab\mbreak
    sib2~sib4. lab8

    %97
    sol4 lab sib4. do8
    sib2 sol4 mib8 fa
    sol fa mib4 fa2

    %100
    do'4. do8 re4 sol,\mbreak
    fa2 re8 sib' sol fa
    mib2 re

}

Ibcn = \relative do {

    sib2 r4 sib8. do16
    re8 sib mib4 sib'8 fa sib la
    sol fa sol la sib sib, fa'[fa,]

    %4
    sib2 sib'\mbreak
    r sib,4 sib'
    do8 sib la[fa] sib4 r8 sib

    %7
    do la sib[sol] la sib la sol
    fa sol la fa\mbreak sib la sol do
    la4 la,8 do re do sib la16 sib

    %10
    do8 sib do do, fa4 fa'8 mib
    re4. la'8 sol4 re'8 sib
    do sib do do, fa sol fa mib\mbreak

    %13
    re8 sib r4 r8 mib16 re mib8[re]
    do do, r4 r8 fa'16 mi fa8[mib?]
    re re, r4 r8 sol'16 fad sol8[fa?]

    %16
    mib?8 mib, r4\mbreak r8 lab' la[fa]
    sib4 lab sol8 fa16 mib re8 mib
    fa8 sol fa[fa,] sib4 r8 re

    %19
    mib re do[fa] sib sib, re mib\mbreak
    fa4. mib16 re do8 do' la fa
    sol mib fa fa, sib4 sib'8 la

    %22
    sol do, do' sib la fa r fa
    sib la sib la sol mib la sol
    la sol fad[re]\mbreak sol la sib la

    %25
    sol fa mib4 re8 re' sib sol
    r re' sib sol r sol do do,
    re do sib do re do re re,\mbreak

    %28
    sol4. la8 sib4 sol
    la8 re sib[do] re do re re,
    sol4 sol'8 fa mi fa sol [la]

    %31
    re do sib[sol] la si dod la\mbreak
    re sib sol sib la sol fa[la]
    sib la sol[mi] la sib sol[la]

    %34 OOKK
    sib la sol sib la sol la la,
    re2 sib4
    fa'2 mib4

    %37
    re sib'8 lab sol fa
    mib4 do mib
    fa2 r4

    %40
    sib, fa' fa,
    sib2 sib'4~
    sib la fa \mbreak

    %43
    sib sol sol,8 sol'
    fa4 fa, fa'
    mib mi do

    %46
    fa mib? re
    mib2 r4
    mib re8 do sib4

    %49
    mib fa fa,
    sib2 sib'4~
    sib la fa\mbreak

    %52
    sib sol sol,8 sol'
    fa4 fa, fa'
    mib mi do

    %55
    fa2 re4
    mib? re do
    sib2 do4

    %58
    re8 mib fa4 fa,
    sib sib' lab\mbreak
    sol2 la?4

    %61
    si2 sol4
    do2 sib?4
    lab sol fa

    %64
    sol4. la?8 si4
    do sib? lab
    sol4. la?8 si4\mbreak

    %67
    do2 mi,4
    fa2.
    mib4 re do

    %70
    si la sol
    do2 re4
    mib2 fa4

    %73
    sol fa mib\mbreak
    fa2 sol4
    lab8 fa sol4 sol,

    %76
    do2 fa4
    sol2 do,4
    do2 sib4

    %79
    la2 re4
    sol re' re,
    sol2 fa4

    %82
    sol2 fa4
    fa2 mib4
    re2 sol4

    %85
    fa sol sol,
    do2.
    mib2 fa4 fa,

    %88
    sib2\mbreak mib4. re8
    do4 sib fa' sol
    re mib8 fa sol4 fa

    %91
    mib sib' do sib\mbreak
    r16 sib, do re mib4. re8 mib re
    do4. fa8 sib, do re mib

    %94
    fa mib fa fa, sib4 sib'8 lab
    sol4 mib lab fa\mbreak
    sib lab sol4. fa8

    %97
    mib4 fa sol4. lab8
    sib lab sib sib, mib re do4~
    do mib2 re4

    %100
    do mib8 fa re4 mib\mbreak
    fa8 mib fa fa, r sib do re
    mib2 sib

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1
   s2 <4>4 <3>
   <6 5>2 <9>8 <8> <4> <3>
   s1*4
   s2 s4 <6!>
   <6>1
   <6 4>4 <5 3> s2
   <6>1
   <6 4>4 <5 3> s2
   s1
   <_!>
   <_+>
   s
   s2 <6>4 <6>8 <6>
   <6>1
   s1*3
   <6>1
   s1*2
   s4 <6> <_+> <6>
   s8 <_+> <6>4 s2
   <_+> <6 4>4 <5 _+>
   s1
   s8 <_+> <6>4 <6 4> <5 _+>
   s2 s8 <6\\ 5> s <_+>
   s <_!> <6> <6> <_+>2
   s4 <6> <_+> <6>
   s2 <6>4 <6->8 <_+>
   s2 <4>4 <_+>  %%% fine 4/4
   s2.*6
   s2 <3>4
   <2> s2
   s4 <6> s
   <6>2.
   <6>
   s
   s
   <4 2>4 <6>2
   s2.
   s2 <3>4
   <2>2.
   s4 <6> s
   <6>2.
   s2.*6
   <_!>2.
   s
   s
   <6>4 <6> <6>
   <_!>2.
   s
   <_!>
   s
   s
   <6>
   <_! 6>
   s
   s2 <_->4
   <_!>2.
   <6>
   s
   s
   <_!>
   <4+ 2>
   s2 <_+>4
   s <4> <_+>
   s2 <_->4
   <_!>2 <_->4
   <4- 2>2.
   s2 <_!>4
   <7 5>2.
   s %%% fine 3/4
   s1
   s2 <5>4 <6>
   s1*6
   <6>1
   s
   s2 <6>
   <4>4 <3> s2
   s4 <6> <4 2> s
   s1
   <6 4>4 <5 3>

}

forma = {

   \key sib\major
   \time 4/4
   %\override Staff.TimeSignature.style = #'single-digit
   \tempo 2 = 45
   s1*34\break
   \time 3/4
   \tempo 2. = 60
   s2.*52
   \bar "||"\break
   \mark\markup \huge "[2.] Virgo prius ac  posterius"
   \time 4/4
   \tempo 2 = 38
   s1*16
   \bar "|."

}

Isoprano = {
   \new Voice = "alma"
   %\notypeset
   \Iglobal
   <<\Isopranon\forma>>
}


IvlI = {
   \Iglobal
   \clef violin
   <<\IvlIn \forma>>
}


IvlII = {
   \Iglobal
   \clef violin
   <<\IvlIIn \forma>>
}


Ibc = {
   \Iglobal
   \clef bass
   <<\Ibcn \forma \Ibfn>>
   \typeset
}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge\bold\fill-line {"Alma redemptoris mater [K. 148]"}
    \markup \fill-line{"  ""J. J. Fux (1660-1741)"}

    \markup \huge {[1.] Alma redemptoris mater}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Vioilino I"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino II"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major\time 4/4  r1^\markup \right-align"Soprano" }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Isoprano
                \set Staff.shortInstrumentName = "sop"
                \new Lyrics \lyricsto "alma" \Itesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso""Continuo"}
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.8
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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