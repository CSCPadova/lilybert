\language "italiano"
%********************************** VARIABILI
\version "2.20.0"

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

quarto = \tupletSpan 4

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
        \musicglyph "scripts.turn"
        \musicglyph "scripts.prall"
    }
}

%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}

mbreak = { }


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con
}

IvlIn = \relative do'' {

    \tuplet 3/2 {
        do16_\markup\italic"Il Capo d'Anno dissegnando il freddo con la Cronologia." do do mi[mi mi] sol sol sol do[do do]]
        si si si sol[sol sol] mi mi mi do[do do]
        \senza si si si sol[sol sol] mi mi mi do[do do]

        %4
        sol' sol, sol sol[sol sol]\mbreak sol sol sol sol[sol sol]
    }
    sol4 r\fermata
    r16 sol''\p sol16.\tr[fa64(sol)] lab16(sol) fa(mib)

    %7
    r16 fa fa16.\tr[mib64(fa)] sol16\parentSlur (fa) mib(re)
    r mib mib16.\tr [re64(mib)] fa16(mib) re(do)\mbreak
    re4 r

    %10
    \tuplet 3/2 { re,16\f re re sol[sol sol] si si si re [re re]}
    fa4 r
    \tuplet 3/2 { mi,16 mi mi la[la la] do do do mi[mi mi] }

    %13
    sol4 r
    \tuplet 3/2 {
        si,16 si si red[red red] fad fad fad la[la la]
        do[do do] do do do do[do do] do do do

        %16
        si\p si si si[si si] si si si si[si si]
        lad\f lad lad lad[lad lad] lad lad lad lad[lad lad]
        si\p si si si[si si]\mbreak la! la la la[la la]

        %19
        sold\f sold sold sold[sold sold] sold sold sold sold[sold sold]
        la\p la la la[la la] sol! sol sol sol[sol sol]
        fad\f fad fad fad[fad fad] fad fad fad fad[fad fad]\mbreak

        %22
        sol\p sol sol sol[sol sol] fa! fa fa fa[fa fa]
        mi\f mi mi mi [mi mi] mi mi mi mi[mi mi]
        mi\p mi mi mi [mi mi] mi mi mi mi[mi mi]

        %25
        red\f red red red[red red]\mbreak mi mi mi mi[mi mi]
        fad\p fad fad fad[fad fad] fad fad fad fad[fad fad]
        fad?\f fad fad fad[fad fad] mi mi mi mi[mi mi]

        %28
        mi,\p mi mi mi [mi mi] mi mi mi mi[mi mi]
    }\mbreak
    \once\stemUp red fad'\f fad(sol) sol4 r16 fad fad (sold) sold4
    r16 la la(si) si4~si16 la la sol! fa4~

    %31
    fa16(mi) mi(re) do8\upl\p r re\upl r do\upl r
    si4 r r2\fermata

}


IvlIIn = \relative do'' {

    \tuplet 3/2 { do,16 do do mi[mi mi] sol sol sol do[do do]
    si si si sol[sol sol] mi mi mi do'[do do]
        \senza si si si sol[sol sol] mi mi mi do[do do]

        %4
        sol' sol, sol sol[sol sol]\mbreak sol sol sol sol[sol sol]
    }
    sol4 r\fermata
    r16 mib''\p\noBeam mib16.\tr re64(mib) fa16(mib) re(do)
    r re\noBeam re16.\tr do64(re) mib16(re) do(si!)
    r do\noBeam do16.\tr si64(do) re16(do) si(la)\mbreak
    si4 r
    \tuplet 3/2 { si,16\f si si re[re re] sol sol sol si[si si] }
    re4 r
    \tuplet 3/2 { la,16 la la do[do do] la' la la do[do do] }
    mi4 r
    \tuplet 3/2 { fad,16 fad fad si[si si] red red red fad[fad fad]\mbreak
    la la la la[la la] la la la la[la la]
    la\p la la la[la la] sol sol sol sol[sol sol]
    sol\f  sol sol sol[sol sol] sol sol sol sol[sol sol]
    fad\p fad fad fad[fad fad]\mbreak  fad fad fad fad[fad fad]
    fa!\f fa fa fa[fa fa] fa! fa fa fa[fa fa]
    mi\p mi mi mi [mi mi] mi mi mi mi[mi mi]
    re\f re re re[re re] re re re re[re re]\mbreak
    re\p re re re[re re] re re re re[re re]
    re\f re re re[re re] re re re re[re re]
    dod\p dod dod dod[dod dod] dod dod dod dod[dod dod]
    do!\f do do do[do do]\mbreak do do do do[do do]
    si\p si si si[si si] la la la la[la la]
    sol\f  sol sol sol[sol sol] sol sol sol sol[sol sol]
    sol\fp sol sol sol[sol sol] sol sol sol sol[sol sol]}
    fad\f red' red(mi) mi4~mi8 red r16 re re(mi)
    fa4 r16 mi mi re do4~do16 (sib) sib(la)
    sold8_\upl r la_\upl\p r sib\upl r la_\upl r
    sold4 r r2\fermata

}

Ibcn = \relative do {

    \tuplet 3/2 {
        do16 do do mi[mi mi] sol sol sol do[do do]
        si si si sol[sol sol] mi mi mi do[do do]
        \senza si si si sol'[sol sol] mi mi mi do[do do]

        %4
        sol' sol, sol sol[sol sol] sol sol sol sol[sol sol]
    }
    sol4 r\fermata
    sol'4^\pp r

    %7
    sol r
    sol r
    \tuplet 3/2 { sol,16^\f sol sol sol'[sol sol] re re re si[si si] }

    %10
    sol4 r\mbreak
    \tuplet 3/2 { si'16 si si sold[sold sold] fa! fa fa re[re re] }
    do4 r

    %13
    \tuplet 3/2 { dod'16 dod dod sib[sib sib] sol?[sol sol] mi mi mi}
    red4 r
    \tuplet 3/2 {
        red'16 red red red[red red] red red red red[red red]\mbreak

        %16
        mi^\p mi mi mi[mi mi] mi mi mi mi[mi mi]
        mi^\f mi mi mi[mi mi] mi mi mi mi[mi mi]
        red^\p red red red[red red] red red red red[red red]

        %19
        re!^\f re re re[re re] re re re re[re re]
        dod^\p dod dod dod[dod dod] dod dod dod dod[dod dod]
        do!^\f do do do[do do] do do do do[do do]

        %22
        si^\p si si si[si si] la la la la[la la]
        sold^\f sold sold sold[sold sold] sold sold sold sold[sold sold]
        sol!^\p sol sol sol[sol sol] sol sol sol sol[sol sol]

        %25
        fad^\f fad fad fad[fad fad] mi mi mi mi[mi mi]\mbreak
        red^\p red red red[red red] red red red red[red red]
        mi^\f mi mi mi[mi mi] do do do do[do do]

        %28
        lad^\p lad lad lad[lad lad] lad lad lad lad[lad lad]
    }
    si4^\f r16 lad' lad(si) si4 r8 si
    la!4 sold la re,

    %31
    mi8 r fa ^\p r re r red r
    mi4 r r2\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2*5
    <8 6->2
    <7 5>
    <6- 4>
    <5 3>
    s
    \tuplet 3/2 { <5! 3>16 <5! 3> <5! 3> } s8 s4
    <3> s
    <5 3>2
    <6>
    \tuplet 3/2 { <7 - 3>16 <7- 3> <7- 3> } s8 s4
    \tuplet 3/2 { <5 4>16 <5 4> <5 4> } s8 \tuplet 3/2 { <3!>16 <3!> <3!> } s8
    <4\+ 3!>2
    <6 3>4 <5!>
    <4\+ 3->2
    <6 3>4 <5!>
    <4\+ 2>2
    <6 3>4 <6! 4>
    <6 5>4 s
    <6 4\+> s
    <6\\ 5->4 <8 6!>
    <3 6> <5!>
    \tuplet 3/2 { <10 9>16 <9> <9> } s8 \tuplet 3/2 { <5 3>16 <5 3> <5 3> } s8
    \tuplet 3/2 { <7 5>16 <7 5> <7 5> } s8 s4
    <5+ _+>4 s16 <7! 5> s8 <4> <5 3+> s <6\\ 3!>16 <4>
    <6->4 <6>8 <5> <9> <8> <7>8 <6- 3->16 <5>
    <98 _+>8  s8 <5 3> s <8 6-> s <7- 5>

}

forma = {

    \key do\major
    \time 4/8
    \tempo 4 = 60
    s2*28%\break\once \override Score.RehearsalMark.extra-offset = #'(0 . 0)
    \mark\markup\italic"Adagio"
    \time 4/4
    \tempo 4=35
    s1*4
    \bar"|."

}

IvlI = {
    \Iglobal
    \notypeset
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \quarto \senza
}

IIvlIn = \relative do'' {

    sol2 \afterGrace fa' ({mi16[re)]}
    do4 do' r8 la sol fad
    sol, sol' fa! mi fa, fa' mi re

    %4
    mi do16 re mi fad mi fad sol la sol la si8. la32 si
    do8 sol4 la8\mbreak si fad4 sol8
    la mi4 fad8 sol4 r8 sol,

    %7
    la4 la'8. sol32 fa mi16 fa mi fa sol la sol la
    si8 do r la si, si' r sol
    la, la' r fa sol, sol' r4\mbreak

    %10
    r8 sol,16 la si do si do re8 la fa[re]
    r la'16 si do re do re mi4. do'8
    re,4. si'8 do, mi la,[la']

    %13
    sold la do, si la4 r
    r8 do' \p si la si2~\mbreak
    si8 la16 si do si la sol la8. si32 do re8 do  %% inizio quarta riga

    %16
    si sol r4 fa,2\f
    \afterGrace mi'({re16[do)]} re4 si'
    r re, \afterGrace do'2 ({si16[la)]}

    %19
    sol4 sol, r2
    r8 mi'4 fa8 sol re4 mi8\mbreak
    fa do do' sib16 la sol la sib4 la16 sol

    %22
    fa sol la4 sol16 fa mi8 la16 sol fa8 sol
    fa4 mi\tr re8 re16 mi fa sol la8
    sol si re fa, mi do16 re mi fa sol8\mbreak

    %25
    la re, la' do, si4 r
    fa'16 sol fa sol la si la si do8 sol mi16 re mi do
    re4 si' r re,

    %28
    \afterGrace do'2 ({si16[la)]} sol4 sol,
    r2 r8 sol'4 la8
    fa fa,4 sol8\mbreak mi16 fa mi fa sol8 fa

    %31
    mi4 re\tr do8 sol''4\parenthesize \p la8
    fa fa,4 sol8 mi16 fa mi fa sol8 fa
    mi4 re\tr do r\fermata

}


IIvlIIn = \relative do'' {

    R1*2
    r2 re,
    \afterGrace do'\parentSlur ({si16[la)]} sol4 sol'

    %5
    r8 mi re dod re, re' do si
    do, do' si la si16 la sol la si do si do
    re8 do16 si la8 si\mbreak do16 re do re mi fa mi fa

    %8
    sol8 do,4 re8 mi si4 do8
    re la4 si8 do16 re do re mi fa mi fa
    sol8 re si[sol] r re'16 mi fa sol fa sol\mbreak

    %11
    la8 mi do[la] r sold mi'4
    r8 fad, re'4 r8 do16 re mi fa mi fa
    \con si,8\tuplet 3/2 { do16 (si la) }~la8 sold la mi'\p re do

    %14
    fa2~fa8 mi16 fa sol fa mi re\mbreak
    mi2~mi8 re16 mi fa8 mi
    re si la sol la, la' sol fa

    %17
    sol do, r4 sol'2\f
    \afterGrace fa'\parentSlur ({mi16[re)]}  do8 sol' fa mi
    re sol,4 la8 fa fa4 sol8

    %20
    mi16 fa sol4 la8 sib fa4 sol8\mbreak
    la fa'~fa16 la sol fa mi fa sol4 fa16 mi
    re mi fa4 mi16 re dod8 re4 mi8

    %23
    re4 dod\tr re8 re,4 do!8
    si sol'16 la si do re8 do4 do,16 re mi do\mbreak
    fa8 fad~fad16 mi fad8 sol16 la sol la si do si do

    %26
    re8 la16 si do re do re mi8 mi, r4
    sol2 \afterGrace fa'\parentSlur ({mi16[re)]}
    do8 sol' fa mi re sol,4 la8

    %29
    fa fa4 sol8\mbreak mi mi'4 fa8
    re re,4 mi8 do16 re do re mi8 re
    do4 si\tr do8 mi'4\p fa8

    %32
    re re,4 mi8 do16 re do re mi8 re
    do4 si\tr do r\fermata

}

IIbcn = \relative do {

    R1*5
    r2 sol_1
    \afterGrace  fa'_7\parentSlur ({mi16[re)]} do4_4 do'_8

    %8
    r8 la sol fad sol, sol' fa mi
    fa, fa' mi re mi4 do'
    si sol fa re'

    %11
    do la\mbreak sold8 mi16 fad sold la sold la
    si8 re,16 mi fad sold fad sold la si la si do re do re
    mi8 la, mi4 la, la'\p~

    %14
    la8 la sol fa sol4 sol,
    do r fa r\mbreak
    sol,2^\f fa'

    %17
    \grace {mi16[\parentSlur (re]} do4) do' r8 si la sol
    la, la' sol fa mi mi' re do
    si si,4 do8 re la4 si8

    %20
    do do' sib la \once\stemUp sol, sib' la sol
    fa la4 sib8\mbreak do sol4 la8
    sib fa4 sol8 la fa sib[sol]

    %23
    la sol la la, re4 r
    R1
    r2 sol,

    %26
    \afterGrace fa'\parentSlur ({mi16[re)]} do4 do'
    r8 si la sol la,  la' sol fa
    mi mi' re do\mbreak si si,4 do8

    %29
    re la4 si8 do4 do'~
    do si do8 la mi fa
    sol4 sol, do do'^\p~

    %32
    do si do8 la mi fa
    sol4 sol, do r

}

IIbfn = \figuremode {

   \bassFigureExtendersOn
   \bassFigureStaffAlignmentUp
   s1*6
   <6>4 <3>8 <4> s2
   \bassFigureStaffAlignmentDown
   s8 <3> s <6>16 s <6>8 <3> <3> <6>16 s
   <6>8 <3> <3> <6>16 s <6>4 s
   <6> s <6> s
   <6> s <6> s
   <3>8 <6 3+>16 s <6>4 <3!> <6>
   <_+>8 <3!> <6 4> <5 _+> <_!>4 s
   <6>8 <6 3>16 s <3> s <3>8 <7 3>4 <8>16 <7> s8
   s2 <7 3>4 s
   <5 3>1
   s2 s8 <6> s4
   <6> <5> <6>8 <3> s <3>
   <6>16 s <6>8 s <6> <3> <6> s <6>
   s8 <3> <3> <6> <3-> <5 3> <3> <8 6>16 s
   <3 8>8 <6> s <6>16 <5> s8 <_->4 <6>16 <5>
   <3>8 s4 <6 3->16 <5> <_+>8 <6> s <6 5>16 s <6 4>4 <5 _+> s2
   s1*2
   <6>4 <5>8 <6> <3>2
   s8 <6> s4 <6> <5>
   <6> s<6>16 s <6>8 s <6>
   s <6> s <6> s4 <5>8 <6>
   <4 2>4 <5 3>8 <6> <3> s <6>16 s <6 5> s
   <6 4>4 <5 3>  s <5>8 <6>
   <4 2>4 <5 3>8 <6> <3> s <6>16 s <6 5> s
   <6 4>4 <5 3>

}

forma = {

   \key do\major
   \time 4/4
   \tempo 2 = 62
   s1*33
   \bar"|."

}

IIvlI = {
   \IIglobal
   \notypeset
   <<\IIvlIn \forma>>

}

IIvlII = {
   \IIglobal
   <<\IIvlIIn \forma>>

}

IIbc = {
   \IIglobal
   \clef bass
   <<\IIbcn \forma \IIbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


IIIglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzine\con
}

IIIvlIn = \relative do'' {

    sol'8._\markup\italic "La buona speranza d'un Anno felice." fa32 mi re16 do
    do'8\upl sol\upl la\upl
    sol,8.\p fa32 mi re16 do

    %4
    do'8_\upl sol_\upl la_\upl
    sol16\f sol' sol(fa) fa(mi)
    \tuplet 3/2 { re si' sol re[sol re } si8]

    %7
    mi,16\p(sol) sol(fa) fa(mi)\mbreak
    \tuplet 3/2 { re[si' sol] re sol re} si8
    \tuplet 3/2 { re'16\f fad\upl la } do4

    %10
    si32(sol16. ) fad32[(mi16.)]  re32(dod16.)
    \tuplet 3/2 { re16 fad\upl  la  } do4
    si32(sol16. ) fad32[(mi16.)]  re32(dod16.)\mbreak

    %13
    re8\f\upl si\upl do\upl
    la_\upl si_\upl sol_\upl
    la_\upl fad_\upl sol_\upl

    %16
    mi32(mi'16.) re32[(do16.)] si32(la16.)
    \once\stemUp sol32\p(si'16.) la32[(sol16.)] fad32(mi16.)
    re32(do16.) si32[(la16.)] sol32 (fad16.)

    %19
    \grace fad8 sol4.
    re'8.\f do32 si la16 sol
    sol'8\upl re\upl mi\upl

    %22
    re8.\p do32 si la16 sol
    sol'8\upl re\upl mi\upl
    fa16\f(la) la(sol) fa(mi)

    %25
    fa\p(la,) la(sol) fa(mi)
    \tuplet 3/2 { \once\stemUp re\f fa' re la[re la] fa la fa }
    re4 r8\mbreak

    %28
    \tuplet 3/2 { sol16 si re } fa4\tr
    \tuplet 3/2 { mi16 do mi sol[mi sol } do8]
    \tuplet 3/2 { la16 do la fa[la fa } re8]

    %31
    \tuplet 3/2 { sol16 si sol mi[sol mi } do8]
    \tuplet 3/2 { fa16 sol la } sol [sol,8 mi'16]
    re4 r8

    %34
    do16(re) re(mi) mi(fa)\mbreak
    fa(sol) sol(la) la8
    si,16\p(do) do(re) re(mi)

    %37
    mi(fa) fa(sol) sol8
    la8\upl\f si,\upl sol'\upl
    la,\upl fa'\upl sol,\upl

    %40
    mi'\upl fa,\upl re'\upl
    mi,16(fa) fa16.\parenthesize _\tr mi64(fa) sol8
    la32(fa'16.) mi32[(re16.)] do32(si16.)\mbreak

    %43
    do32\p(mi16.) re32[(do16.)] si32(la16.)
    sol32(fa16.) mi32[(re16.)] do32(si16.)
    do4. do\fermopz

}


IIIvlIIn = \relative do'' {

    mi16 do32 re mi16 do fa(mi)
    r8 mi\upl fa\upl
    mi,16\p do32 re mi16 do fa(mi)

    %4
    r8 mi_\upl fa_\upl
    mi16\f mi' mi(re) re(do)
    \tuplet 3/2 { si sol' re si[re si } sol8]

    %7
    sol,16\p mi' mi (re) re(do)\mbreak
    \tuplet 3/2 { si sol' re si[re si } sol8]
    \tuplet 3/2 { re''16\parenthesize \f fad la } do4

    %10
    si32\parentSlur (sol16. ) fad32[(mi16.)]  re32(dod16.)
    \tuplet 3/2 { re16 fad\parenthesize \upl  la  } do4
    si32\parentSlur (sol16. ) fad32[(mi16.)]  re32(dod16.)\mbreak

    %13
    re8\f\upl si\upl do\upl
    la_\upl si_\upl sol_\upl
    la_\upl fad_\upl sol_\upl

    %16
    mi32(mi'16.) re32[(do16.)] si32(la16.)
    \once\stemUp sol32\p(si'16.) la32[(sol16.)] fad32(mi16.)
    re32(do16.) si32[(la16.)] sol32 (fad16.)

    %19
    \grace fad8 sol4.
    si16 sol32 la si16[sol do(si)]
    r8 si\upl do\upl

    %22
    si16\p sol32 la si16[sol do(si)]
    r8 si\upl\f dod\upl
    re16(fa) fa(mi) re(dod)

    %25
    re\p(fa,) fa(mi) re(dod)
    \tuplet 3/2 { \once\stemUp re\f fa'\upl re la[re la] fa la fa }
    re4 r8

    %28
    sol16 si8 re16 \tuplet 3/2 { fa mi fa }
    sol, do8 mi16 \tuplet 3/2 { sol fa sol }
    \tuplet 3/2 { la16 do la fa[la fa } re8]

    %31
    \tuplet 3/2 { sol16 si sol mi[sol mi } do8]
    \tuplet 3/2 { fa16 sol la } sol [sol,8 do16]
    si4 r8

    %34
    do16(re) re(mi) mi(fa)\mbreak
    fa(sol) sol(la) la8
    si,16\p(do) do(re) re(mi)

    %37
    mi(fa) fa(sol) sol8
    la8\upl\f si,\upl sol'\upl
    la,\upl fa'\upl sol,\upl

    %40
    mi'\upl fa,\upl re'\upl
    mi,16(fa) fa16._\tr mi64(fa) sol8
    la32(fa'16.) mi32[(re16.)] do32(si16.)\mbreak

    %43
    do32\p(mi16.) re32[(do16.)] si32(la16.)
    sol32(fa16.) mi32[(re16.)] do32(si16.)
    do4. do\fermopz

}

IIIbcn = \relative do {

    do'16 do do do do do
    do do do do do do
    do do do do do do

    %4
    do do do do do do
    do8^\f si do
    sol4 r8

    %7
    do,\p si do
    sol4 r8
    fad'16^\f fad fad fad fad fad\mbreak

    %10
    sol8 r la^\p
    fad16 fad fad fad fad fad
    sol8 r la^\f

    %13
    fad\upl sol\upl mi\upl
    fad\upl re\upl mi\upl
    do_\upl re_\upl si_\upl

    %16
    do re re,
    sol4 la8^\p
    si do re

    %19
    sol, sol'16\f la si sol\mbreak
    sol sol sol sol sol sol
    sol sol sol sol sol sol

    %22
    sol^\p sol sol sol sol sol
    sol,8_\upl sol' mi
    re^\f r la'

    %25
    re, r la^\p
    re16 re' \tuplet 3/2 { la16[(re la)] fa(la fa) }
    re\f re' re(do) do(si)\mbreak

    %28
    si16 si si si si si
    do8 do, \tuplet 3/2 { mi16[(do mi)] }
    re8[re'] \tuplet 3/2 { si16(re si) }

    %31
    mi,8[do'] \tuplet 3/2 { la16(do la) }
    re,8 si do
    sol16 sol' sol(fa) fa(mi)

    %34
    mi8 si do
    la' mi fa
    sol^\p mi si\mbreak

    %37
    do la' mi
    fa\f\upl sol\upl mi\upl
    fa\upl re\upl mi\upl

    %40
    do_\upl re_\upl si_\upl
    do\upl la'\upl mi\upl
    fa sol sol,

    %43
    do4 re8^\p
    mi fa sol
    do,16 do' mi, sol do, mi do,4._\fermata

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s4.
   s8 <5 3> <6 4>
   <5 3>4.
   s8 <5 3> <6 4>
   <5 3> <6>16 <5> <4 9> <3 8>
   <5 3+>4.
   s8 <6>16 <5 3> <4 9> <3 8>
   <5 3>4.
   <6>8 <5!>4
   s <4>16 <3+>
   <6>8 <5!>4
   s4 <4>16 <3+>
   <6>8 <3> <6>
   <3> <6> <3>
   <6> <_+> <6>
   <6 5> <6 4> <5 3+>
   s4 <6\\>16 <5><6>8 <6 5> <4>16 <3+>
   s4.
   s
   s8 <5 3> <6 4>
   <5 3>4.
   s4 <6\\>8
   <3!> s <6 4>16 <5 3+>
   <_!>8 s <6 4>16 <5 _+>
   <_!>4.
   s
   <6>8 \bassFigureExtendersOn <5> <5>\bassFigureExtendersOff
   <3>4.
   s
   s
   s8 <6>4
   s4.
   <6>8 <6> s
   <6> <6> <3>
   <3> <6> <6>
   <3> <6> <6>
   s4.*3
   s8 <6> <6>
   <6 5>16 s \bassFigureExtendersOn <6 4>16 <5 4>\bassFigureExtendersOff <4> <3>
   s4 <6>16 <5>
   <6>8 <6 5> <4>16 <3>

}

forma = {

   \key do\major
   \time 3/8
   \tempo 4. = 50
   s4.*19
   \bar":..:"\break
   \repeat volta 2{s4.*25}
   \alternative {{s4.}{s}}
   \bar "|."

}

IIIvlI = {
   \IIIglobal
   \notypeset
   <<\IIIvlIn \forma>>

}

IIIvlII = {
   \IIIglobal
   <<\IIIvlIIn \forma>>

}

IIIbc = {
   \IIIglobal
   \clef bass
   <<\IIIbcn \forma \IIIbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


IVglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \quarto \con
}

IVvlIn = \relative do'' {

    do4._\markup\italic"Menuet il giorno di 9 hore."  re16 mi re4
    sol8(sol,) \grace sol fa2
    mi4 mi'2

    %4
    re8 mi \grace re do2\tr
    si4 do8.\tr si32(do) re4
    sol \tuplet 3/2 { mi8(re do) si[(la sol)] }

    %7
    fad4 re'8 re, sol4\mbreak
    mi'4 si8 \parentSlur (la) sol\parentSlur (fad)
    sol2 r4 sol2 r4

    %10
    re'2._\markup\italic"La notte di 15 hore"
    \tuplet 3/2 { mi8 (fa sol) } \grace sol fa2
    \once\stemDown mi8 do, mi'2

    %13
    mi,8(re') \grace re8 do2
    si4 dod8.\tr si32(dod) re4\mbreak
    mi fa8(sol) sol8.\tr fa32(sol)

    %16
    la4 re, \tuplet 3/2 { sib'8(la sol)
    fa(mi re)} \grace re dod2\tr
    re4 fa2

    %19
    sol,8(fa') \grace fa mi2\tr
    re4 sol8(sol,) la4
    la8 la, \grace do si2\tr

    %22
    do4 do' \tuplet 3/2 { la8(sol fa) }
    \tuplet 3/2 { mi re do } \grace do si2\tr
    do r4  do2\fermopz r4

}


IVvlIIn = \relative do'' {

    do4.  re16 mi re4
    sol8(sol,) \grace sol fa2
    mi4 mi'2

    %4
    re8 mi \grace re do2\tr
    si4 do8.\tr si32(do) re4
    sol \tuplet 3/2 { mi8(re do) si[(la sol)] }

    %7
    fad4 re'8 re, sol4\mbreak
    mi'4 si8 (la) sol (fad)
    sol2 r4 sol2 r4

    %10
    re'2._\markup\italic"La notte di 15 hore"
    \tuplet 3/2 { mi8 (fa sol) } \grace sol fa2
    \once\stemDown mi8 do, mi'2

    %13
    mi,8(re') \grace re8 do2
    si4 dod8.\tr si32(dod) re4\mbreak
    mi fa8(sol) sol8.\tr fa32(sol)

    %16
    la4 re, \tuplet 3/2 { sib'8(la sol)
    fa(mi re)} \grace re dod2\tr
    re4 fa2

    %19
    sol,8(fa') \grace fa mi2\tr
    re4 sol8(sol,) la4
    la8 la, \grace do si2\tr

    %22
    do4 do' \tuplet 3/2 { la8(sol fa) }
    \tuplet 3/2 { mi re do } \grace do si2\tr
    do r4  do2\fermopz r4

}

IVbcn = \relative do {

    do4 do' si8 sol
    mi4 la si
    do2 do,4

    %4
    re mi fad
    sol mi si
    sol do mi

    %7
    re si mi
    do re re,
    sol sol'8 fa mi re sol,4 re'8 do si la

    %10
    sol4 sol' fa
    mi re sol,
    do do'8 si la4

    %13
    sold la red,
    mi la8 sol fa!4
    dod re sib'

    %16
    fa2 sol4
    sib la la,
    re2 re'8 do

    %19
    si4 do do,\mbreak
    sol' mi fa
    re sol fa

    %22
    mi do fa
    la sol sol,
    do mi8 re mi do do,2_\fermata r4

}

IVbfn = \figures {

   \bassFigureExtendersOn
   \bassFigureStaffAlignmentDown
   s2 <6>4
   s <6> <6>
   s2.
   s4 <6> <6>\bassFigureExtendersOff
   s <6> <6>
   s2 <5>8 <6>
   <_+>4 <6> <5>
   <6 5> <6 4> <5>8 <3+>
   s2.*2
   s2 <6>4
   <6> <3 7> <7 3>
   s2.
   <6>8 <5> \bassFigureExtendersOn <3!>4 <7/>\bassFigureExtendersOff
   s <3+> <6>
   <6> <3!> <6>
   <6>2 <3->4
   <5>8 <6> <8 _+>4 s
   <3!>2.
   <6>8 <5> <3>2
   s4 <6>2 s4 \bassFigureExtendersOn <3> <3>
   <6> s s
   <5>8 <6> <8 3>2



}

forma = {

   \key do\major
   \time 3/4
   \tempo 2. = 47
   \repeat volta 2{s2.*8}
   \alternative {{s2.}{s}}\break
   \set Score.currentBarNumber = #10
   \repeat volta 2{s2.*14}
   \alternative {{s2.}{s}}
   \bar"|."

}

IVvlI = {
   \IVglobal
   \notypeset
   <<\IVvlIn \forma>>

}

IVvlII = {
   \IVglobal
   <<\IVvlIIn \forma>>

}

IVbc = {
   \IVglobal
   \clef bass
   <<\IVbcn \forma \IVbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


Vglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \quarto \senza
}

VvlIn = \relative do'' {

    do8\upl_\markup\italic "Il Villano fantastico." mi\upl
    la,\upl[fa'\upl mi\upl re\upl]
    mi\upl re\upl do'8. si32 la
    sol8. fa16 mi8.\tr re32 do

    %4
    sol4 sol'8\p(fad)
    mib(re) mib(re)
    do(si!) sol'\pp(fad)\mbreak

    %7
    mib(re) mib(re)
    do(si!) sol16\f la si do
    re fad la fad do'8 si

    %10
    re,16 fad la fad do'8 si
    re,,16 fad la fad do'8 si
    la16 re, fad la re4\mbreak

    %13
    si8 sol16 si re,8 si'
    sol si16 sol re'8 si16 sol
    re'8 si16 sol re8 si'

    %16
    sol4 sol'16 la sib8
    la8 sol16 fa mi8 re16 dod
    re mi fa sol la8 fa16 re\mbreak

    %19
    la'8 fa16 re la'8 fa16 re
    la4 sib'8\p(la)
    sold(la) sib(la)

    %22
    sold la sib,\pp la
    sold la sib la
    sold la la'4\f

    %25
    fa8 re16 fa  la,8 fa'\mbreak
    re fa fa16 sol la8
    r sol,\p sol16 fa sol8

    %28
    r mi'\f mi16 fa sol8~
    sol[fa la do,]
    si4 sol'8 re16 si

    %31
    sol4 sol8 re16 si
    sol4 sol''8 re16 si
    sol'8 re16 si sol'8 re16 si\mbreak

    %34
    sol re' si sol sol'4
    mi8 do16 mi sol,8 mi'
    do mi16 sol do8 sol16 mi

   %37
   sol8 mi16 do sol8 mi'
   do4

}


VvlIIn = \relative do'' {

    do8\upl mi\upl
    la,\upl[re\upl do\upl si\upl]
    do4\upl do'8. si32 la
    sol8. fa16 mi8.\tr re32 do

    %4
    sol4 mib'8\p(re)
    do(si) do(si)
    fad(sol) mib'\pp(re)\mbreak

    %7
    do(si) do(si)
    fad(sol) sol16\f la si do
    re re fad re la'8 sol

    %10
    fad16 re fad re la'8 sol
    fad,16 re fad re la'8 sol
    fad16 re fad la re4\mbreak

    %13
    si8 sol16 si re,8 si'
    sol si16 sol re'8 si16 sol
    re'8 si16 sol re8 si'

    %16
    sol4 si8 dod
    re4. dod8
    re,16 mi fa sol la8 fa16 re

    %19
    la'8 fa16 re la'8 fa16 re\mbreak
    la8 la'16\p si dod8(re)
    mi(re) dod(re)

    %22
    mi(re) dod\pp(re)
    mi(re) dod(re)
    mi(re) dod\f(la')

    %25
    fa8 re16 fa  la,8 fa'
    re la re16 mi fa8\mbreak
    r\footnote #' (-1 . 3) \markup\column\smaller {" Così nel manoscritto" "  "} fa,\p fa16 mi fa8

    %28
    r8 sol\f do16 re mi8~
    mi[re la' do,]
    si4 sol'8 re16 si

    %31
    sol4 sol8 re16 si
    sol4 sol''8 re16 si
    sol'8 re16 si sol'8 re16 si\mbreak

    %34
    sol re' si sol sol'4
    mi8 do16 mi sol,8 mi'
    do mi16 sol do8 sol16 mi

   %37
   sol8 mi16 do sol8 mi'
   do4

}

Vbcn = \relative do {

    mi4\upl
    fa\upl sol\upl
    do,\upl do'8. si32 la
    sol8. fa16 mi8.\parenthesize \tr re32 do

    %4
    sol8 [sol'\p sol sol]
    sol[sol sol sol]
    sol[sol sol^\pp sol]

    %7
    sol[sol sol sol]
    sol sol sol16\f la si do\mbreak
    re8[re re re]

    %10
    re8[re re re]
    re8[re re re]
    re,4 re'

    %13
    si8 sol16 si re,8 si'
    sol si16 sol re'8 si16 sol
    re'8 si16 sol re8 si'

    %16
    sol4 mi
    fa8[sol la la,]
    re[re' dod re]

    %19
    dod[re dod re]
    la^\tasto[la la\p la]
    la[la la la]

    %22
    la[la la\pp la]
    la[la la la]
    la,4 la'\f

    %25
    fa8 re16 fa  la,8 fa'\mbreak
    re4 r8 re'\upl
    si16 la si8 r si^\p

    %28
    do16 si do8 r do,\f
    fa4 fad
    sol8 re16 si sol4

    %31
    sol'8 re16 si sol4
    sol'8 re16 si sol'8 re16 si
    sol'8 re16 si sol'8 re16 si\mbreak

    %34
    sol4 sol'
    mi8 do16 mi sol,8 mi'
    do mi16 sol do8 sol16 mi

   %37
   sol8 mi16 do sol8 mi'
   do4

}

Vbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   <6>4
   <6> <4>8 <3>
   s2*2
   s4 <8 6->8 <7+ 5>
   <6- 4> <5 3> <6 4> <5 3>
   <4 7+> <3 8> <8 6-> <7+ 5>
   <6- 4> <5 3> <6 4> <5 3>
   <4 7+> <3 8> s4
   <_+> <7 5>8 <6 4>
   <5 3+>4 <7 5>8 <6 4>
   <_+>4 <7 5>8 <6 4>
   <_+>2
   s2*3
   s4 <5>8 <6\\>
   <6>4 <4>8 <3+>
   <_!>4 <6>
   s2*7
   s4 s8 <3>
   <6 5>4 s8 <6 5>
   <3>2
   <7>8 <6> <6> <5>
   <3>2

}

forma = {

   \key do\major
   \time 2/4
   \tempo 2 = 60
   \partial 4 s4
   s2*15
   s4 \bar":..:"\break s
   s2*21
   s4
   \bar":|."

}

VvlI = {
   \Vglobal
   %\notypeset
   <<\VvlIn \forma>>

}

VvlII = {
   \Vglobal
   <<\VvlIIn \forma>>

}

Vbc = {
   \Vglobal
   \clef bass
   <<\Vbcn \forma \Vbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #5
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    subtitle = \markup {"”Il Gennàro” da ”Musicalischer Instrumental Kalender” (1748)]"}
    composer = \markup \center-column{"J. G. Werner (1678-1741)"}
}

\markup \huge {"[1.] Allegro"}

\score {

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup\center-column {"Violino I"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup\center-column {"Violino II"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                }<<
                    \set Staff.instrumentName = \markup\center-column{"Basso ò""Cembalo"}
                    \set Staff.midiInstrument = #"cello"
                    \Ibc
                >>
            >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup \huge {"[2.] Presto forte"}

\score {

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                }<<
                    \set Staff.midiInstrument = #"cello"
                    \IIbc
                >>
            >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup \huge {"[3.] Allegro"}

\score {

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                }<<
                    \set Staff.midiInstrument = #"cello"
                    \IIIbc
                >>
            >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup \huge {"[4.] Cantabile"}

\score {

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IVvlII
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                }<<
                    \set Staff.midiInstrument = #"cello"
                    \IVbc
                >>
            >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup \huge {"[5.] Allegro"}

\score {

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \VvlII
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                }<<
                    \set Staff.midiInstrument = #"cello"
                    \Vbc
                >>
            >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
