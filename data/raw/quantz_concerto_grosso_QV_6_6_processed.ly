\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"


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

st = \staccatissimo

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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}


IflIn =  \relative do'' {

    R1*6
    r2 r16 sol la si do re mi fad
    sol re sol sol sol re sol sol\mbreak sol4~sol16 sol mi sol
    la mi la la la mi la la la4~la16 la fad la

    %10
    si fad si si si fad si si si4~si16 si sol si
    do sol do do do sol do do do4~do16 do la do
    re la re re re la re re\mbreak re do si la sol si la sol

    %13
    fad re re re re re re re la' do, do do do do do do
    si8 sol' la, fad' sol sol, r4
    R1*3

    %18
    r8 re' si re mi mi mi re16 do
    re8 sol re mi re sol re mi
    re16 do si re do si la do si4 r

    %21
    r2\mbreak r8 si16 do re8 si
    la re la si la4 r
    r8 re la si la4 r

    %24
    r16 sol si re sol fad mi re dod la dod mi la sol fad mi
    fad re fad la fad re fad la mi8 la4 mi8\mbreak
    fad16 re fad la fad re fad la mi8 la4 mi8

    %27
    fad16(mi fad) la sol(fad sol) si la sol fad sol la si la si
    la sol fad sol la si la si la sol fad sol mi8.\tr re16
    re4 r r2\mbreak

    %30 OOKK
    R1
    r2 r4 r8 re
    dod16 la la la la la la la mi' la, la la la la la la
    la' mi dod mi la sol fad mi fad8 re r la'\mbreak
    si16 re, re re re re re re la' re, re re re re re re

    %35
    sol dod, dod dod dod dod dod dod fad la, la la la la la la
    mi' la, la la la la la la mi' sol, sol sol sol sol sol sol
    fad fad fad fad re' re re re si si si si sol' sol sol sol

    %38  OOKK
    dod, dod dod dod la' la la la fad4 r
    r8 la fad la si si si la16 sol
    la8 re la si la re la si

    %41
    la16 sol fad la sol fad mi sol fad4 r
    r2 r8 fad16 sol la8 fad\mbreak
    mi8 la mi fad mi4 r

    %44
    r8 la mi fad mi4 r
    R1*10\mbreak
    r2 r8 sol16 la si la  sol si

    %56
    la sol la si la sol fad la sol fad sol la si la sol si
    la sol la si la sol fad la sol4 r
    r2 r8 si, mi fad\mbreak

    %59
    sol4(sold) la lad
    si8. la?16 sol fad mi red mi8 la fad8.\tr mi16
    mi8 si mi fad sol4\upl sold\upl

    %62
    la\upl lad\upl si8 fad~fad16 si la? si
    sold(la si4) sold8 la mi~mi16 la sold la\mbreak
    fad(sol la4) fad8 sol re~re16 sol fad sol

    %65
    mi(fad sol4) mi8 fad dod~dod16 fad mi fad
    red(mi fad4) red8 mi16 fad sol4 fad16 mi
    fad sol la4 sol16 fad sol la si sol la sol fad mi

    %68
    red4 r\mbreak r2
    R1  %% OOKK
    r16 si' fad red si(red fad si) si, si' fad red si(red fad si)

    %71
    sold4 r sold r
    r16 la mi dod la(dod mi la)\mbreak la, la' mi dod la(dod mi la)
    fad4 r fad r

    %74
    r16 sol re si sol(si re sol) sol, sol' re si sol(si re sol)
    mi do re mi la,(dod mi la) fad re mi fad si,(red fad si)
    sol mi fad sol si, mi fad sol\mbreak do, mi fad sol si, mi fad sol

    %77
    lad, mi' fad sol fad mi re dod re dod re mi fad mi re fad
    mi re mi fad mi re dod mi re dod re mi fad mi re fad
    mi re mi fad mi re dod mi re4 r\mbreak

    %80
    r2 r8 fad si lad\tr
    si8 fad si lad\tr si16 si la si sol la fad sol
    mi fad sol fad mi re do si do8 mi la[sold\tr]

    %83
    la\upl mi\upl la\upl sold\upl la4 r
    r2 r8 re, sol fad\tr
    sol re sol fad\tr sol4 r

    %86
    R1*9
    r8 re si re mi mi mi re16 do
    re8 sol re mi re sol re mi\mbreak

    %97
    re16 do si re do si la do si4 r
    r2 r8 si16 do re8 si
    la re la si la4 r

    %100
    r8 re la si la4 r\mbreak
    r8 re sol fad\tr sol re sol fad\tr
    sol4 r r16 sol, la si do re mi fad

    %103
    sol re sol sol sol re sol sol sol4~sol16 sol mi sol
    la mi la la la mi la la la4~la16 la fad la
    si fad si si si fad si si si4~si16 si sol si

    %106
    do sol do do do sol do do do4~do16 do la do
    re la re re re la re re re do si la sol si la sol
    fad re re re re re re re la' do, do do do do do do

    %109
    si8 sol' la, fad' sol sol, r4
    R1*4

}


IflIIn =  \relative do'' {

    R1*6
    r2 r16 sol la si do re mi fad
    sol re sol sol sol re sol sol\mbreak sol4~sol16 sol mi sol
    la mi la la la mi la la la4~la16 la fad la

    %10
    si fad si si si fad si si si4~si16 si sol si
    do sol do do do sol do do do4~do16 do la do
    re la re re re la re re\mbreak re do si la sol si la sol

    %13
    fad re re re re re re re la' do, do do do do do do
    si8 sol' la, fad' sol sol, r4
    R1*3

    %18
    r8 si sol si do do do si16 la
    si8 re si do si re si do
    si16 la sol si la sol fad la sol4 r

    %21
    r2 r8 sol16 la si8 sol
    fad la fad sol fad4 r
    r8 la fad sol fad4 r

    %24
    r16 si sol la si la sol fad mi dod' la dod mi8 dod
    re la4 re8 dod16 la dod mi dod la dod mi\mbreak
    re8 la4 re8 dod16 la dod mi dod la dod mi

    %27
    re(dod re) fad mi(re mi) sol fad mi re mi fad sol mi sol
    fad mi re mi fad sol mi sol fad mi re mi dod8.\tr re16
    re4 r r2

    %30
    R1
    r2 r4 r8 re

    %32
    dod16 la la la la la la la mi' la, la la la la la la
    la' mi dod mi la sol fad mi fad8 re r la'\mbreak
    si16 re, re re re re re re la' re, re re re re re re

    %35
    sol dod, dod dod dod dod dod dod fad la, la la la la la la
    mi' la, la la la la la la mi' sol, sol sol sol sol sol sol
    fad fad fad fad re' re re re si si si si sol' sol sol sol

    %38
    dod, dod dod dod la' la la la fad4 r
    r8 fad re fad sol sol sol fad16 mi
    fad8 la fad sol fad la fad sol

    %41
    fad16 mi re fad mi re dod mi re4 r
    r2 r8 re16 mi fad8 re\mbreak
    dod mi dod re dod4 r

    %44
    r8 mi dod re dod4 r
    R1*10
    r2 r8 mi16 fad sol fad mi sol

    %56
    fad mi fad sol fad mi red fad mi red mi fad sol fad mi sol
    fad mi fad sol fad mi red fad mi4 r
    R1*3

    %61
    r8 si mi fad sol4\upl sold\upl
    la\upl lad\upl si8 fad~fad16 si la? si
    sold(la si4) sold8 la mi~mi16 la sold la\mbreak
    fad(sol la4) fad8 sol re~re16 sol fad sol

    %65
    mi(fad sol4) mi8 fad dod~dod16 fad mi fad
    red(mi fad4) red8 mi16 fad sol4 fad16 mi
    fad sol la4 sol16 fad sol la si sol la sol fad mi

    %68
    red si si si si' si, si si\mbreak fad' si, si si sol' si, si si %% inizio p 10
    red si si si si' si, si si fad' si, si si sol' si, si si
    red4\p r red r
    mi r mi r

    %72
    dod r\mbreak dod r
    re r re r
    si r si r

    %75
    do? r  r2
    R1
    r2 si16 lad si dod re dod si re

    %78
    dod si dod re dod si lad dod si lad si dod re dod si re
    dod si dod re dod si lad dod si4 r\mbreak
    r2 r8 fad' si lad\tr

    %81
    si8 fad si lad\tr si4 r
    r2 r8 mi, la sold\tr
    la\upl mi\upl la\upl sold\upl la4 r

    %84
    r2 r8 re, sol fad\tr
    sol re sol fad\tr sol4 r
    R1*9

    %95
    r8 si, sol si do do do si16 la
    si8 re si do si re si do\mbreak
    si16 la sol si la sol fad la sol4 r

    %98
    r2 r8 sol16 la si8 sol
    fad la fad sol fad4 r
    r8 la fad sol fad4 r\mbreak

    %101
    r8 sol si la\tr si sol si la\tr
    si4 r r16 sol la si do re mi fad
    sol re sol sol sol re sol sol sol4~sol16 sol mi sol

    %104
    la mi la la la mi la la la4~la16 la fad la
    si fad si si si fad si si si4~si16 si sol si
    do sol do do do sol do do do4~do16 do la do

    %107
    re la re re re la re re re do si la sol si la sol
    fad re re re re re re re la' do, do do do do do do
    si8 sol' la, fad' sol sol, r4

    %110
    R1*4

}

Ivln =  \relative do'' {

    sol,4\upl sol\upl sol\upl r16 sol' fad sol
    sol,4 r16 sol' fad sol sol,8 sol' re si
    sol sol' re si sol la16 si do re mi fad\mbreak

    %4
    sol8 re si sol re'4\upl re\upl
    re\upl r16 re' dod re re,4 r16 re' dod re
    re,8 re' la fad re re' la fad

    %7
    re16 mi fad sol la8 re si16 sol la si do re mi fad
    sol re sol sol sol re sol sol\mbreak sol4~sol16 sol mi sol
    la mi la la la mi la la la4~la16 la fad la

    %10
    si fad si si si fad si si si4~si16 si sol si
    do sol do do do sol do do do4~do16 do la do
    re la re re re la re re\mbreak re do si la sol si la sol

    %13
    fad re re re re re re re la' do, do do do do do do
    si8 sol' la, fad' sol sol, r re'\p
    mib mib mib16 re do sib la8 re re16 do sib la

    %16
    sol8 do do16 sib la sol\mbreak fad8 re sol\f si,!  %% inizio p. 4 OOKK
    do4 re sol,8 sol' re si
    sol4 r8 sol'\p do4 do,

    %19
    sol' r8 do, sol'4 r8 do,
    sol'4 re sol, r
    r2 sol'4 r8 sol

    %22
    re4 r8 sol, re'4 r
    re r8 sol, re'4 r
    R1*5

    %29
    re4\upl re \upl re\upl r16 re' dod re\mbreak
    re,4 r16 re' dod re re,8 re' la fad
    re re' la fad re16 mi fad sol la si dod re

    %32
    dod la la la la la la la mi' la, la la la la la la
    la' mi dod mi la sol fad mi fad8 re r la'\mbreak
    si16 re, re re re re re re la' re, re re re re re re

    %35
    sol dod, dod dod dod dod dod dod fad la, la la la la la la
    mi' la, la la la la la la mi' sol, sol sol sol sol sol sol
    fad fad fad fad re' re re re si si si si sol' sol sol sol

    %38
    dod, dod dod dod la' la la la fad re dod si la sol fad mi
    re4 r8 re\p sol4 sol,
    re' r8 sol, re'4 r8 sol,

    %41
    re'4 la re r
    r2 re4 r8 re\mbreak
    la'4 r8 re, la'4 r

    %44  OOKK
    la r8 re, la'4 r
    r16 la si dod re la sol la fad la re, la' mi la sol la
    fad la si dod re la mi' la, fad' re la fad' mi dod la mi'\mbreak

    %47
    fad(sol la) fad re fad mi sol fad(sol la) fad re mi do re
    si re mi fad sol re sol re mi re do re mi do re mi
    la, mi' fad sol la mi la mi fad mi re mi fad re mi fad

    %50
    si, fad' sol la si fad si fad sol si la si mi, si' re, si'\mbreak
    do, mi fad sol la mi la mi fad la sol la re, la' do, la'
    si, re mi fad sol re sol re mi sol fad sol do, sol' si, sol'

    %53
    la, mi' fad sol fad sol mi fad red la si do si do la si
    <<{mi si sol si mi si sol si mi la, sol la mi' la, sol la
      red fad, si, fad' red' fad, si, fad'}

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"violin"
            \key sol\major <<{mi'2^\markup\italic "manoscritto" mi
    red}\\{\stemUp\shiftOn si la
        fad}\\{ \stemDown sol sol
        \stemUp \shiftOnn si,}>>}>> <<mi'4\\\stemUp\shiftOn si\\\stemDown sol>> r8 mi
    la4 si mi, r8 mi
    la4 si mi, r

    %58
    R1*3
    r8 si'\f mi fad sol4\upl sold\upl
    la\upl lad\upl si8 fad~fad16 si la? si

    %63
    sold(la si4) sold8 la mi~mi16 la sold la\mbreak
    fad(sol la4) fad8 sol re~re16 sol fad sol
    mi(fad sol4) mi8 fad dod~dod16 fad mi fad

    %66
    red(mi fad4) red8 mi16 fad sol4 fad16 mi
    fad sol la4 sol16 fad sol la si sol la sol fad mi
    red si si si si' si, si si\mbreak fad' si, si si sol' si, si si %% inizio p 10

    %69 OOKK
    red si si si si' si, si si fad' si, si si sol' si, si si
    red4\p r red r
    r16 mi si sold mi(sold si mi) mi, mi' si sold mi(sold si mi)

    %72
    dod4 r\mbreak dod r
    r16 re la fad re(fad la re) re, re' la fad re(fad la re)
    si4 r si r

    %75
    do? r  r2
    R1
    r2 si,4 r8 si

    %78
    mi4 fad si, r8 si
    mi4 fad si, r\mbreak
    r2 r8 fad''\f\upl si\upl lad\tr

    %81
    si fad si lad\tr si4 r
    r2 r8 mi, la sold\tr
    la\upl mi\upl la\upl sold\tr la16 la sol la fad sol mi fad\mbreak

    %84
    re mi fad mi re do si la si8 re sol fad\tr
    sol re sol fad\tr sol4 r
    R1

    %87
    r8 sol\p re sol r fa re fa
    r mi do mi\mbreak r la mi la
    r sol mi sol r fad? re fad

    %90
    la r la r la r la r
    sol r sol r sol r sol r\mbreak
    fad r fad r sol,,4\upl\f sol\upl

    %93
    sol\upl r16 sol' fad sol sol,4 r16 sol' fad sol
    sol,8 sol' re si sol sol' re si
    sol4 r8 sol'\p do4 do,

    %96
    sol' r8 do, sol'4 r8 do,\mbreak
    sol'4 re sol, r
    r2 sol'4 r8 sol

    %99
    re4 r8 sol, re'4 r
    re r8 sol, re'4 r\mbreak
    sol,4 r8 re' sol,4 r8 re'

    %102
    sol,4 r r16 sol'\f la si do re mi fad
    sol re sol sol sol re sol sol sol4~sol16 sol mi sol
    la mi la la la mi la la la4~la16 la fad la

    %105
    si fad si si si fad si si si4~si16 si sol si
    do sol do do do sol do do do4~do16 do la do
    re la re re re la re re re do si la sol si la sol

    %108
    fad re re re re re re re la' do, do do do do do do
    si8 sol' la, fad' sol sol, r re'\p
    mib mib mib16 re do sib la8 re re16 do sib la

    %111
    sol8 do do16 sib la sol fad8 re sol\f si,!
    do4 re sol,16 sol' fad mi re do si la\mbreak
    sol sol' fad mi re do si la sol4 r

}


IobIn = \relative do'' {

    R1*6
    r2 r16 sol la si do re mi fad
    sol re sol sol sol re sol sol\mbreak sol4~sol16 sol mi sol
    la mi la la la mi la la la4~la16 la fad la

    %10
    si fad si si si fad si si si4~si16 si sol si
    do sol do do do sol do do do4~do16 do la do
    re la re re re la re re\mbreak re do si la sol si la sol

    %13
    fad re re re re re re re la' do, do do do do do do
    si8 sol' la, fad' sol sol, r4
    R1*5

    %20
    r2 r8 si16 do re8 mi
    re16 do si re do si la do\mbreak si4 r
    r2 r8 la16 si do si do si

    %23
    la4 \parenthesize r4 r8 la16 si do si do la
    si4 r r2
    R1*4

    %29
    re,4\upl re \upl re\upl r16 re' dod re\mbreak
    re,4 r16 re' dod re re,8 re' la fad
    re re' la fad re16 mi fad sol la si dod re

    %32
    dod la la la la la la la mi' la, la la la la la la
    la' mi dod mi la sol fad mi fad8 re r la'\mbreak
    si16 re, re re re re re re la' re, re re re re re re

    %35
    sol dod, dod dod dod dod dod dod fad la, la la la la la la
    mi' la, la la la la la la mi' sol, sol sol sol sol sol sol
    fad fad fad fad re' re re re si si si si sol' sol sol sol

    %38  OOKK
    dod, dod dod dod la' la la la fad re dod si la sol fad mi
    re4 r r2
    R1

    %41
    r2 r8 fad'16 sol la8 si
    la16 sol fad la sol fad mi sol fad4 r\mbreak
    r2 r8 mi16 fad sol fad sol fad

    %44
    mi4 r r8 mi16 fad sol fad sol mi
    re4 r r2
    R1*11

    %57
    r2 r8 sol16 la si la sol si
    la sol la si la sol fad la sol4 r\mbreak
    r8 si, mi re do la fad' mi

    %60
    red si mi[si] do la si4
    mi,8 si' mi fad sol4\upl sold\upl
    la\upl lad\upl si8 fad~fad16 si la? si

    %63
    sold(la si4) sold8 la mi~mi16 la sold la\mbreak
    fad(sol la4) fad8 sol re~re16 sol fad sol
    mi(fad sol4) mi8 fad dod~dod16 fad mi fad

    %66
    red(mi fad4) red8 mi16 fad sol4 fad16 mi
    fad sol la4 sol16 fad sol la si sol la sol fad mi
    red si si si si' si, si si\mbreak fad' si, si si sol' si, si si %% inizio p 10

    %69 OOKK
    red si si si si' si, si si fad' si, si si sol' si, si si
    red4\p r red r
    mi r mi r

    %72
    dod r\mbreak dod r
    re r re r
    si r si r

    %75
    do? r  r2
    R1*3
    r2 r8 re16 mi fad mi re fad\mbreak

    %80
    mi re mi fad  mi re dod mi re8 fad\upl\f si\upl lad\tr
    si fad si lad\tr si4 r
    r2 r8 mi, la sold\tr

    %83
    la\upl mi\upl la\upl sold\tr la4 r\mbreak
    r2 r8 re, sol fad\tr
    sol re sol fad\tr sol16 sol fa sol  mi fa re mi

    %86
    do re mi re do si la sol fad? re mi fad sol si la do
    si sol si re sol fad sol re si sol si re fa mi fa re
    mi do si do mi do si do\mbreak mi la, dod mi la sol la mi

    %89
    dod la dod mi sol fad sol mi fad re dod re fad re dod re
    la' do,! si do la' do, si do la' si, la si la' si, la si
    sol' si, la si sol' si, la si sol' la, sol la sol' la, sol la\mbreak

    %92
    fad' la, sol la fad' la, sol la sol'4 r
    R1*4
    r2 r8 si,16 do re8 mi

    %98
    re16 do si re do si la do si4 r
    r2 r8 la16 si do si do si
    la4 r r8 la16 si do si do la\mbreak

    %101
    si4 r r2
    r8 re sol fad\tr sol16 sol, la si do re mi fad
    sol re sol sol sol re sol sol sol4~sol16 sol mi sol

    %104
    la mi la la la mi la la la4~la16 la fad la
    si fad si si si fad si si si4~si16 si sol si
    do sol do do do sol do do do4~do16 do la do

    %107
    re la re re re la re re re do si la sol si la sol
    fad re re re re re re re la' do, do do do do do do
    si8 sol' la, fad' sol sol, r4

    %110
    R1*4

}


IobIIn = \relative do'' {

    R1*7
    si8 do re16 sol, si re\mbreak do16 sol do do do sol do do
    dod8 re mi16 la, dod mi re la re re re la re re

    %10
    red8 mi fad16 si, red fad mi si mi mi mi si mi mi
    mi8 fad sol16 do, mi sol fad do fad fad fad do fad fad
    fad8 sol la16 re, fad la\mbreak sol8 sol16 fad sol8 mi

    %13
    re16 la la la la  la la la fad la la la la la la la
    sol8 si fad la si sol r4
    R1*5

    %20
    r2 r8 sol16 la si8 do
    si16 la sol si la sol fad la\mbreak sol4 r
    r2 r8 fad16 sol la sol la sol
    fad4 \parenthesize r4 r8 fad16 sol la sol la fad
    sol4 r r2
    R1*4

    %29
    re4\upl re \upl re\upl r16 re' dod re\mbreak
    re,4 r16 re' dod re re,8 re' la fad
    re re' la fad re16 mi fad sol la si dod re

    %32
    dod la la la la la la la mi' la, la la la la la la
    la' mi dod mi la sol fad mi fad8 re r la'\mbreak
    si16 re, re re re re re re la' re, re re re re re re

    %35
    sol dod, dod dod dod dod dod dod fad la, la la la la la la
    mi' la, la la la la la la mi' sol, sol sol sol sol sol sol
    fad fad fad fad re' re re re si si si si sol' sol sol sol

    %38  OOKK
    dod, dod dod dod la' la la la fad re dod si la sol fad mi
    re4 r r2
    R1

    %41
    r2 r8 re'16 mi fad8 sol fad16 mi re fad mi re dod mi re4 r\mbreak
    r2 r8 dod16 re mi re mi re
    dod4 r r8 dod16 re mi re mi dod

    %44
    re4 r r2
    R1*11
    r2 r8 mi16 fad sol fad mi sol

    %57
    fad mi fad sol fad mi red fad mi4 r\mbreak
    R1*2
    r8 si mi fad sol4\upl sold\upl
    la\upl lad\upl si8 fad~fad16 si la? si

    %63
    sold(la si4) sold8 la mi~mi16 la sold la\mbreak
    fad(sol la4) fad8 sol re~re16 sol fad sol
    mi(fad sol4) mi8 fad dod~dod16 fad mi fad

    %66
    red(mi fad4) red8 mi16 fad sol4 fad16 mi
    fad sol la4 sol16 fad sol la si sol la sol fad mi
    red si si si si' si, si si\mbreak fad' si, si si sol' si, si si %% inizio p 10

    %69 OOKK
    red si si si si' si, si si fad' si, si si sol' si, si si
    red4\p r si r
    si r si r

    %72
    dod r\mbreak dod r
    la r la r
    si r si r

    %75
    sol r r2
    R1*3
    r2 r8 si16 dod re dod si re\mbreak
    dod si dod re dod si lad dod si8 fad' si\upl lad\tr
    si fad si lad\tr si4 r
    r2 r8 mi, la sold\tr

    %83
    la\upl mi\upl la\upl sold\tr la4 r\mbreak
    r2 r8 re, sol fad\tr
    sol re sol fad\tr sol4 r

    %86
    R1*11
    r2 r8 sol,16 la si8 do
    si16 la sol si la sol fad la sol4 r
    r2 r8 fad16 sol la sol la sol
    fad4 r r8 fad16 sol la sol la fad\mbreak
    sol4 r r2
    r8 sol si la\tr si4 r
    si8 do re16 sol, si re do sol do do do sol do do
    dod8 re mi16 la, dod mi re la re re re la re re

    %105
    red8 mi fad16 si, red fad mi si mi mi mi si mi mi
    mi8 fad sol16 do, mi sol fad do fad fad fad do fad fad
    fad8 sol la16 re, fad la\mbreak sol8 sol16 fad sol8 mi

    %108
    re16 la la la la  la la la fad la la la la la la la
    sol8 si fad [la] si sol r4
    R1*4

}

IvlIn = \relative do'' {

    sol,4\upl sol\upl sol\upl r16 sol' fad sol
    sol,4 r16 sol' fad sol sol,8 sol' re si
    sol sol' re si sol la16 si do re mi fad\mbreak

    %4
    sol8 re si sol re'4\upl re\upl
    re\upl r16 re' dod re re,4 r16 re' dod re
    re,8 re' la fad re re' la fad

    %7
    re16 mi fad sol la8 re si16 sol la si do re mi fad
    sol re sol sol sol re sol sol\mbreak sol4~sol16 sol mi sol
    la mi la la la mi la la la4~la16 la fad la

    %10
    si fad si si si fad si si si4~si16 si sol si
    do sol do do do sol do do do4~do16 do la do
    re la re re re la re re\mbreak re do si la sol si la sol

    %13
    fad re re re re re re re la' do, do do do do do do
    si8 sol' la, fad' sol sol, r re'\p
    mib mib mib16 re do sib la8 re re16 do sib la

    %16
    sol8 do do16 sib la sol\mbreak fad8 re sol\f si,!  %% inizio p. 4 OOKK
    do4 re sol,8 sol' re si
    sol4 r8 sol'\p do4 do,

    %19
    sol' r8 do, sol'4 r8 do,
    sol'4 re sol, r
    r2 sol'4 r8 sol

    %22
    re4 r8 sol, re'4 r
    re r8 sol, re'4 r
    R1*5

    %29
    re4\upl re \upl re\upl r16 re' dod re\mbreak
    re,4 r16 re' dod re re,8 re' la fad
    re re' la fad re16 mi fad sol la si dod re

    %32
    dod la la la la la la la mi' la, la la la la la la
    la' mi dod mi la sol fad mi fad8 re r la'\mbreak
    si16 re, re re re re re re la' re, re re re re re re

    %35
    sol dod, dod dod dod dod dod dod fad la, la la la la la la
    mi' la, la la la la la la mi' sol, sol sol sol sol sol sol
    fad fad fad fad re' re re re si si si si sol' sol sol sol

    %38
    dod, dod dod dod la' la la la fad re dod si la sol fad mi
    re4 r8 re\p sol4 sol,
    re' r8 sol, re'4 r8 sol,

    %41
    re'4 la re r
    r2 re4 r8 re\mbreak
    la'4 r8 re, la'4 r

    %44
    la r8 re, la'4 r
    R1*3
    sol'4\p sol sol r

    %49
    la la la r
    si si si r\mbreak
    R1*4

    %55
    r2 mi,,4\p r8 mi
    la4 si mi, r8 mi
    la4 si mi, r

    %58
    R1*3
    r8 si'\f mi fad sol4\upl sold\upl
    la\upl lad\upl si8 fad~fad16 si la? si

    %63
    sold(la si4) sold8 la mi~mi16 la sold la\mbreak
    fad(sol la4) fad8 sol re~re16 sol fad sol
    mi(fad sol4) mi8 fad dod~dod16 fad mi fad

    %66
    red(mi fad4) red8 mi16 fad sol4 fad16 mi
    fad sol la4 sol16 fad sol la si sol la sol fad mi
    red si si si si' si, si si\mbreak fad' si, si si sol' si, si si %% inizio p 10

    %69 OOKK
    red si si si si' si, si si fad' si, si si sol' si, si si
    red4\p r red r
    mi r mi r

    %72
    dod r\mbreak dod r
    re r re r
    si r si r

    %75
    do? r  r2
    R1
    r2 si,4 r8 si

    %78
    mi4 fad si, r8 si
    mi4 fad si, r\mbreak
    r2 r8 fad''\f\upl si\upl lad\tr

    %81
    si fad si lad\tr si4 r
    r2 r8 mi, la sold\tr
    la\upl mi\upl la\upl sold\tr la4 r\mbreak

    %84
    r2 r8 re, sol fad\tr
    sol re sol fad\tr sol4 r
    R1

    %87
    r8 sol\p re sol r fa re fa
    r mi do mi\mbreak r la mi la
    r sol mi sol r fad? re fad

    %90
    la r la r la r la r
    sol r sol r sol r sol r\mbreak
    fad r fad r sol,,4\upl\f sol\upl

    %93
    sol\upl r16 sol' fad sol sol,4 r16 sol' fad sol
    sol,8 sol' re si sol sol' re si
    sol4 r8 sol'\p do4 do,

    %96
    sol' r8 do, sol'4 r8 do,\mbreak
    sol'4 re sol, r
    r2 sol'4 r8 sol

    %99
    re4 r8 sol, re'4 r
    re r8 sol, re'4 r\mbreak
    sol,4 r8 re' sol,4 r8 re'

    %102
    sol,4 r r16 sol'\f la si do re mi fad
    sol re sol sol sol re sol sol sol4~sol16 sol mi sol
    la mi la la la mi la la la4~la16 la fad la

    %105
    si fad si si si fad si si si4~si16 si sol si
    do sol do do do sol do do do4~do16 do la do
    re la re re re la re re re do si la sol si la sol

    %108
    fad re re re re re re re la' do, do do do do do do
    si8 sol' la, fad' sol sol, r re'\p
    mib mib mib16 re do sib la8 re re16 do sib la

    %111
    sol8 do do16 sib la sol fad8 re sol\f si,!
    do4 re sol,16 sol' fad mi re do si la\mbreak
    sol sol' fad mi re do si la sol4 r

}


IvlIIn = \relative do'' {

    sol,4\upl sol\upl sol\upl r16 sol' fad sol
    sol,4 r16 sol' fad sol sol,8 sol' re si
    sol sol' re si sol la16 si do re mi fad\mbreak

    %4
    sol8 re si sol re'4\upl re\upl
    re\upl r16 re' dod re re,4 r16 re' dod re
    re,8 re' la fad re re' la fad

    %7
    re16 mi fad sol la8 re si8 sol r4
    si8 do re16 sol, si re\mbreak do16 sol do do do sol do do
    dod8 re mi16 la, dod mi re la re re re la re re

    %10
    red8 mi fad16 si, red fad mi si mi mi mi si mi mi
    mi8 fad sol16 do, mi sol fad do fad fad fad do fad fad
    fad8 sol la16 re, fad la\mbreak sol8 sol16 fad sol8 mi

    %13
    re16 la la la la  la la la fad la la la la la la la
    sol8 si fad la si sol r8 re'\p
    mib mib mib16 re do sib la8 re re16 do sib la

    %16
    sol8 do do16 sib la sol\mbreak fad8 re sol\f si,!  %% inizio p. 4 OOKK
    do4 re sol,8 sol' re si
    sol4 r8 sol'\p do4 do,

    %19
    sol' r8 do, sol'4 r8 do,
    sol'4 re sol, r
    r2 sol'4 r8 sol

    %22
    re4 r8 sol, re'4 r
    re r8 sol, re'4 r
    R1*5

    %29
    re4\upl re \upl re\upl r16 re' dod re\mbreak
    re,4 r16 re' dod re re,8 re' la fad
    re re' la fad re16 mi fad sol la si dod re

    %32
    dod la la la la la la la mi' la, la la la la la la
    la' mi dod mi la sol fad mi fad8 re r la'\mbreak
    si16 re, re re re re re re la' re, re re re re re re

    %35
    sol dod, dod dod dod dod dod dod fad la, la la la la la la
    mi' la, la la la la la la mi' sol, sol sol sol sol sol sol
    fad fad fad fad re' re re re si si si si sol' sol sol sol

    %38
    dod, dod dod dod la' la la la fad re dod si la sol fad mi
    re4 r8 re\p sol4 sol,
    re' r8 sol, re'4 r8 sol,

    %41
    re'4 la re r
    r2 re4 r8 re\mbreak
    la'4 r8 re, la'4 r

    %44
    la r8 re, la'4 r
    R1*3
    re4\p re mi r

    %49
    mi mi fad r
    fad fad sol r\mbreak
    R1*4

    %55
    r2 mi,4\p r8 mi
    la4 si mi, r8 mi
    la4 si mi, r

    %58
    R1*3
    r8 si'\f mi fad sol4\upl sold\upl
    la\upl lad\upl si8 fad~fad16 si la? si

    %63
    sold(la si4) sold8 la mi~mi16 la sold la\mbreak
    fad(sol la4) fad8 sol re~re16 sol fad sol
    mi(fad sol4) mi8 fad dod~dod16 fad mi fad

    %66
    red(mi fad4) red8 mi16 fad sol4 fad16 mi
    fad sol la4 sol16 fad sol la si sol la sol fad mi
    red si si si si' si, si si\mbreak fad' si, si si sol' si, si si %% inizio p 10

    %69 OOKK
    red si si si si' si, si si fad' si, si si sol' si, si si
    red4\p r si r
    si r si r

    %72
    dod r\mbreak dod r
    la r la r
    si r si r

    %75
    sol r r2
    R1
    r2 si,4 r8 si

    %78
    mi4 fad si, r8 si
    mi4 fad si, r\mbreak
    r2 r8 fad''\f\upl si\upl lad\tr

    %81
    si fad si lad\tr si4 r
    r2 r8 mi, la sold\tr
    la\upl mi\upl la\upl sold\tr la4 r\mbreak

    %84
    r2 r8 re, sol fad\tr
    sol re sol fad\tr sol4 r
    R1

    %87
    re8\p si r re re si r re
    do sol r do\mbreak la dod r mi
    mi dod r mi re la r re

    %90
    re r re r re r re r
    re r re r mi r mi r\mbreak
    la, r la r sol,4\upl\f sol\upl

    %93
    sol\upl r16 sol' fad sol sol,4 r16 sol' fad sol
    sol,8 sol' re si sol sol' re si
    sol4 r8 sol'\p do4 do,

    %96
    sol' r8 do, sol'4 r8 do,\mbreak
    sol'4 re sol, r
    r2 sol'4 r8 sol

    %99
    re4 r8 sol, re'4 r
    re r8 sol, re'4 r\mbreak
    sol,4 r8 re' sol,4 r8 re'

    %102
    sol,4 r r2
    si'8\f do re16 sol, si re do sol do do do sol do do
    dod8 re mi16 la, dod mi re la re re re la re re

    %105
    red8 mi fad16 si, red fad mi si mi mi mi si mi mi
    mi8 fad sol16 do, mi sol fad do fad fad fad do fad fad
    fad8 sol la16 re, fad la\mbreak sol8 sol16 fad sol8 mi

    %108
    re16 la la la la  la la la fad la la la la la la la
    sol8 si fad [la] si sol r8 re'\p
    mib mib mib16 re do sib la8 re re16 do sib la

    %111
    sol8 do do16 sib la sol\mbreak fad8 re sol\f si,!
    do4 re sol,16 sol' fad mi re do si la\mbreak
    sol sol' fad mi re do si la sol4 r

}


Ivlan = \relative do' {

    sol4\upl sol\upl sol\upl r16 sol' fad sol
    sol,4 r16 sol' fad sol sol,8 sol' re si
    sol sol' re si sol la16 si do re mi fad\mbreak

    %4
    sol8 re si sol re'4\upl re\upl
    re\upl r16 re' dod re re,4 r16 re' dod re
    re,8 re' la fad re re' la fad

    %7
    re8 do16 si la8 fad' re4 r
    re8 do si re\mbreak mi re do mi
    mi re dod mi fad mi re fad

    %10
    fad mi red fad sol fad mi sol
    sol fad mi sol la sol fad la
    la sol fad la\mbreak si si16 do re8 do16 si

    %13
    la8 fad fad re re fad fad re
    re re re re re4 r8 re'\p
    mib mib mib16 re do sib la8 re re16 do sib la

    %16
    sol8 do do16 sib la sol\mbreak fad8 re sol\f [si,!]  %% inizio p. 4 OOKK
    do4 re sol,8 sol' re si
    sol4 r r2

    %19
    R1*10
    re'4\upl re \upl re\upl r16 re' dod re\mbreak
    re,4 r16 re' dod re re,8 re' la fad

    %31
    re re' la fad re re re re
    mi dod r mi dod la r mi'
    dod la r dod' la fad la fad\mbreak

    %34
    sol si r si fad la r la
    mi sol r sol re fad r fad
    dod mi r dod la mi' r dod

    %37
    la16 la la  la la' la la la re, re re re si' si si si\mbreak
    mi, mi mi mi mi mi mi  mi re4 r
    re r r2

    %40
    R1*8
    sol4 si, do r
    dod dod re r

    %50
    red red mi r\mbreak
    R1*10
    r2 r4 si'\f

    %62
    do dod fad,8 red mi fad
    si sold4 mi8~mi dod' red mi\mbreak
    la, fad4 re?8~re si' do? re

    %65
    sol, mi4 dod8~dod la' si dod
    fad, red4 si8 si si si si
    si mi red[si] si si mi[do']

    %68
    fad,4 sol\mbreak red si'
    fad sol red si'
    fad\p r fad r

    %71
    mi r mi r
    mi r\mbreak mi r
    re r re r

    %74
    re r re r
    do r r2
    R1*4

    %80
    r2 r8 re\f fad fad
    fad re fad fad fad4 r
    r2 r8 do mi mi

    %83
    mi do mi mi mi4 r\mbreak
    r2 r8 si re re
    re si re re re4 r

    %86
    R1
    sol,4 \p r sol r
    do r\mbreak dod r

    %89
    la r re r
    fad8 r fad r sol r sol r
    si, r si r do r do r\mbreak

    %92
    re r re r sol,4\upl\f  sol\upl
    sol\upl r16 sol' fad sol sol,4 r16 sol' fad sol
    sol,8 sol' re si sol sol' re si

    %95
    sol4 r r2
    R1*7
    re'8\f do si[re] mi re do[mi]

    %104
    mi re dod mi fad mi re fad
    fad mi red fad\mbreak sol fad mi sol
    sol fad mi sol la sol fad la

    %107
    la sol fad la si si16 do re8 do16 si
    la8 fad fad re re fad fad re
    re re re re\mbreak re4 r8 re'\p

    %110
    mib mib mib16 re do sib la8 re re16 do sib la
    sol8 do do16 sib la sol fad8 re sol\f si,!
    do4 re sol,16 sol' fad mi re do si la\mbreak

    %113
    sol sol' fad mi re do si la sol4 r

}


Ifgn = \relative do {

    sol4\upl sol\upl sol\upl r16 sol' fad sol
    sol,4 r16 sol' fad sol sol,8 sol' re si
    sol sol' re si sol la16 si do re mi fad\mbreak

    %4
    sol8 re si sol re'4\upl re\upl
    re\upl r16 re' dod re re,4 r16 re' dod re
    re,8 re' la fad re re' la fad

    %7
    re mi fad re sol4 r
    sol,8 la si sol\mbreak do re mi do
    la si dod la re mi fad re

    %10
    si dod red si mi fad sol mi
    do? re? mi do fad sol la fad
    re mi fad re\mbreak sol sol,16 la si8 do

    %13
    re re' la fad re re' la fad
    sol sol, re'[re,] sol4 r8 re''\p
    mib mib mib16 re do sib la8 re re16 do sib la

    %16
    sol8 do do16 sib la sol\mbreak fad8 re sol\f [si,!]  %% inizio p. 4 OOKK
    do4 re sol,8 sol' re si
    sol4 r r2

    %19
    R1
    r2 sol'4 r8 do,
    sol'4 re\mbreak sol, r

    %22
    r2 re'4 r8 re,
    re'4 r re r8 re
    sol4 r r2

    %25
    R1*4
    re4\upl re \upl re\upl r16 re' dod re\mbreak
    re,4 r16 re' dod re re,8 re' la fad

    %31
    re re' la fad re re fad re

    %32
    r la' dod la r la, dod la
    r la' dod la re re, fad re\mbreak
    r sol sol, sol' r fad fad, fad'

    %35
    r mi mi, mi' r re re, re'
    r la dod la r la' dod la
    re,16 re re re fad fad fad fad sol sol sol sol mi mi mi mi\mbreak

    %38
    la la la la dod, dod dod dod re4 r
    re r r2
    R1

    %41
    r2 re'4 r8 sol,
    re'4 la re, r\mbreak
    r2 la'4 r8 la,

    %44
    la'4 r la r8 la,
    re4 r r2
    R1*11

    %57
    r2 mi4 r8 mi
    la4 si mi, r\mbreak
    R1*2

    %61
    r2 r8 si'\f mi re
    do la  fad' mi red si dod red
    mi mi, mi' red? dod la si dod\mbreak

    %64
    re? re, re' do? si sol la si
    do do, do' si la fad sol la
    si si, si' la sol fad mi sol

    %67
    red dod si red mi red do[la]
    si4 si\mbreak si si
    si si si si

    %70
    si\pp r si r
    mi r mi r
    la, r\mbreak la r

    %73
    re r re r
    sol, r sol r
    do r r2

    %76
    R1*3
    r2 si'4 r8 si\mbreak
    mi,4 fad si8 si,\f re fad

    %81
    re si re fad si,4 r
    r2 r8 la do mi
    do la do mi la,4 r\mbreak

    %84
    r2 r8 sol si re
    si sol si re sol,4 r
    R1*6

    %92
    r2 sol4\upl\f sol\upl
    sol\upl r16 sol' fad sol sol,4 r16 sol' fad sol
    sol,8 sol' re si sol sol' re si

    %95
    sol4 r r2
    R1
    r2 sol'4 r8 do,

    %98
    sol'4 re sol, r
    r2 re'4 r8 re,
    re'4 r re r8 re\mbreak

    %101
    sol4 r r2
    sol4 r8 re' sol,4 r
    sol,8\f la si sol do re mi do

    %104
    la si dod la re mi fad re
    si dod red si\mbreak mi fad sol mi
    do? re? mi do fad sol la fad

    %107
    re mi fad re sol sol,16 la si8 la
    re re' la fad re re' la fad
    sol sol, re'[re,]\mbreak sol4 r8 re''\p

    %110
    mib mib mib16 re do sib la8 re re16 do sib la
    sol8 do do16 sib la sol fad8 re sol\f si,!
    do4 re sol,16 sol' fad mi re do si la\mbreak

    %113
    sol sol' fad mi re do si la sol4 r

}


Ibcn = \relative do {

    sol4\upl sol\upl sol\upl r16 sol' fad sol
    sol,4 r16 sol' fad sol sol,8 sol' re si
    sol sol' re si sol la16 si do re mi fad\mbreak

    %4
    sol8 re si sol re'4\upl re\upl
    re\upl r16 re' dod re re,4 r16 re' dod re
    re,8 re' la fad re re' la fad

    %7
    re mi fad re sol4 r
    sol,8 la si sol\mbreak do re mi do
    la si dod la re mi fad re

    %10
    si dod red si mi fad sol mi
    do? re? mi do fad sol la fad
    re mi fad re\mbreak sol sol,16 la si8 do

    %13
    re re' la fad re re' la fad
    sol sol, re'[re,] sol4 r8 re''\p
    mib mib mib16 re do sib la8 re re16 do sib la

    %16
    sol8 do do16 sib la sol\mbreak fad8 re sol\f [si,!]  %% inizio p. 4 OOKK
    do4 re sol,8 sol' re si
    sol4 r r2

    %19
    R1*5
    sol'4\pp r8 sol la4 r8 la,
    re4 r8 re la'4 r8 la,\mbreak

    %26
    re4 r8 re la'4 r8 la
    re4 sol, re' r8 dod
    re4 r8 dod re sol, la la,

    %29
    re4\upl re \upl re\upl r16 re' dod re\mbreak
    re,4 r16 re' dod re re,8 re' la fad
    re re' la fad re re fad re

    %32
    r la' dod la r la, dod la
    r la' dod la re re, fad re\mbreak
    r sol sol, sol' r fad fad, fad'

    %35
    r mi mi, mi' r re re, re'
    r la dod la r la' dod la
    re,16 re re re fad fad fad fad sol sol sol sol mi mi mi mi\mbreak

    %38
    la la la la dod, dod dod dod re4 r
    re r r2
    R1*5

    %45
    re4 r8 dod re4 r8 dod
    re sol fad dod re4 dod\mbreak
    re r8 dod re4 r8 fad

    %48
    sol4 r r2
    R1
    r2 mi8 fad sol mi\mbreak

    %51
    la4 r8 dod, re mi fad re
    sol4 r8 si, do? re mi do
    fad4 r8 la, si4 red

    %54
    mi8 fad sol mi do' si do la\mbreak
    si la si si, mi4 r
    R1*5

    %61
    r2 r8 si'\f mi re
    do la  fad' mi red si dod red
    mi mi, mi' red? dod la si dod\mbreak

    %64
    re? re, re' do? si sol la si
    do do, do' si la fad sol la
    si si, si' la sol fad mi sol

    %67
    red dod si red mi red do[la]
    si4 si\mbreak si si
    si si si si

    %70
    si\pp r si r
    mi r mi r
    la, r\mbreak la r

    %73
    re r re r
    sol, r sol r
    do dod re red

    %76
    mi r\mbreak la sol
    fad lad si r
    R1*2

    %80
    r2 r8 si,\f re fad
    re si re fad si,4 r
    r2 r8 la do mi

    %83
    do la do mi la,4 r\mbreak
    r2 r8 sol si re
    si sol si re sol,4 r8 sol'

    %86
    la4 r8 do re do si fad
    sol4 r r2
    R1*4

    %92
    r2 sol,4\upl\f sol\upl
    sol\upl r16 sol' fad sol sol,4 r16 sol' fad sol
    sol,8 sol' re si sol sol' re si

    %95
    sol4 r r2
    R1*7
    sol8\f la si sol do re mi do

    %104
    la si dod la re mi fad re
    si dod red si\mbreak mi fad sol mi
    do? re? mi do fad sol la fad

    %107
    re mi fad re sol sol,16 la si8 la
    re re' la fad re re' la fad
    sol sol, re'[re,]\mbreak sol4 r8 re''\p

    %110
    mib mib mib16 re do sib la8 re re16 do sib la
    sol8 do do16 sib la sol fad8 re sol\f si,!
    do4 re sol,16 sol' fad mi re do si la\mbreak

    %113
    sol sol' fad mi re do si la sol4 r

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

}


forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 63
    s1*113
    \bar"|."

}


Ivl = {
    \Iglobal
    \notypeset
    <<\Ivln \forma>>

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

IobI = {
    \Iglobal
    <<\IobIn \forma>>

}

IobII = {
    \Iglobal
    <<\IobIIn \forma>>

}

Ifg = {
    \Iglobal
    \clef bass
    <<\Ifgn \forma>>

}

IflI = {
    \Iglobal
    <<\IflIn \forma>>

}

IflII = {
    \Iglobal
    <<\IflIIn \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma\Ibfn >>
    \typeset

}


IIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
			}


IIflIn =  \relative do'' {

    re8.(mib16) re8 re4 re8 sol4(re8) sib'4(re,8)
    re8. mib16 re8 re4 re8 la'4(re,8) do'4(re,8)
    sib'8.(la16) sol8 fad4\tr sol8 la4 re,8 r r la'\mbreak

    %4
    sib8. la16 sol8 fad4 sol8 do,4. \parentSlur (do8.)(sib16) la8
    sib8.(la16) sol8 sib8.(do16) la8 sol2.
    R1.

    %7
    r2. fad'8.(sol16) la8 la4(sol8)\mbreak
    fad4 sib8 la4 \parentSlur (sol8) fad4 r8 r4.
    re8.(mib16) re8 re4(mib8) fa8.(sol16) fa8 mib8.(fa16) re8

    %10
    do4 re8 mib8.(fa16) re8 do4 r8 r4.
    do8.(re16) mib8 mib8.(re16) do8\f\mbreak re8.(do16) sib8 la4\tr sib8
    do4 fa,8 r r do' re8.(do16) sib8 la4\tr sib8

    %13
    mib4. sol4 fa8 re8.(do16) sib8 re8.(mib16) do8
    sib2. r\mbreak
    R1.*2

    %17
    sol'8.(la16) sol8 sol4 r8 r4. r8 r la
    fa8.(mi16) re8 fa8.(sol16) mi8\mbreak re4 r8 r4.
    r8 r re sib'4 sib8 sib16(la sol fa mi re) do8(sol' sib)

    %20
    la2.~la16 sol(fa mi re do) sib8(fa' la)
    sol2.~\mbreak sol16 fa(mi re dod si) la8(mi' sol)
    fa8.(sol16) la8 la8.(sol16) fa8 mi8.(fa16) sol8 sol8.(fa16) mi8

    %23
    fa4 r8 r4. r2.
    R1.*2
    r2. fad8.(sol16) la8 la4(sol8)

    %27
    fad4(sib8) la4(sol8)\mbreak fad4 r8 r4.
    R1.*2
    r2. re8. mib16 re8 re4 re8\mbreak

    %31
    mib4 sol8 mi8.\tr re16(mi8) fa4 la8 fad8.\tr mi16 fad8
    sol4.~sol8. fa16 mib8 re8.(do16) sib8 la8. sol16 fad8
    sol4 r8 r4. r2.

    %34
    sib8.(do16) re8 re8.(do16) sib8la8.(sib16) do8 do8. \parentSlur (sib16) la8
    sib4 re8 re4 re8 sol4(re8) sib'4(re,8)
    re8. mib16 re8 re4 re8 la'4(re,8) do'4(re,8)

    %37
    sib'8.(la16) sol8 fad4\tr sol8 la4 re,8 r r la'\mbreak
    sib8. la16 sol8 fad4 sol8 do,4. do8.(sib16) la8
    sib8.(la16) sol8 sib8.(do16) la8 sol2.

}


IIflIIn =  \relative do'' {

    re8.(mib16) re8 re4 re8 sol4(re8) sib'4(re,8)
    re8. mib16 re8 re4 re8 la'4(re,8) do'4(re,8)
    sib'8.(la16) sol8 fad4\tr sol8 la4 re,8 r r la'\mbreak

    %4
    sib8. la16 sol8 fad4 sol8 do,4. \parentSlur (do8.)(sib16) la8
    sib8.(la16) sol8 sib8.(do16) la8 sol2.
    R1.

    %7
    r2. la8.(sib16) do8 do4(sib8)\mbreak
    la4 re8 do4(sib8) la4 r8 r4.
    sib8.(do16) sib8 sib4(do8) re8.(mib16) re8 do8.(re16) do8

    %10
    la4 sib8 do8. \parentSlur  (re16) sib8 la4 r8 r4.
    la8.(sib16) do8 do8.(sib16) la8\f \mbreak sib4 sib8 la4\tr sib8
    do4 fa,8 r r do' re8.(do16) sib8 la4\tr sib8

    %13
    mib4. sol4 fa8 re8.(do16) sib8 re8.(mib16) do8
    sib2. r\mbreak
    R1.*2

    %17
    mi8. \parentSlur (fa16) mi8 mi4 r8 r4. r8 r dod
    re4 re8 re8.(mi16) dod8\mbreak re4 r8 r4.
    R1.*7

    %26
    r2. la8.(sib16) do8 do4\parentSlur (sib8)
    la4(re8) do4(sib8)\mbreak la4 r8 r4.
    R1.*6

    %34
    sol8.(la16) sib8 sib8.(la16) sol8\mbreak fad8.(sol16) la8 la8.(sol16) fad8
    sol4 re'8 re4 re8 sol4(re8) sib'4(re,8)
    re8. mib16 re8 re4 re8 la'4(re,8) do'4(re,8)

    %37
    sib'8.(la16) sol8 fad4\tr sol8 la4 re,8 r r la'\mbreak
    sib8. la16 sol8 fad4 sol8 do,4. do8.(sib16) la8
    sib8.(la16) sol8 sib8.(do16) la8 sol2.

}

IIvln =  \relative do'' {

    re8.(mib16) re8 re4 re8 sol4(re8) sib'4(re,8)
    re8. mib16 re8 re4 re8 la'4(re,8) do'4(re,8)
    sib'8.(la16) sol8 fad4\tr sol8 la4 re,8 r r la'\mbreak

    %4
    sib8. la16 sol8 fad4 sol8 do,4. \parentSlur (do8.)(sib16) la8
    sib8.(la16) sol8 sib8.(do16) la8 sol8. re16 sib8 sol4.
    R1.*5

    %11
    r4. r8 r do'\f \mbreak re8.(do16) sib8 la4\tr sib8
    do4 fa,8 r r do' re8.(do16) sib8 la4\tr sib8
    mib4. sol4 fa8 re8.(do16) sib8 re8.(mib16) do8

    %14
    sib8. fa16 re8 sib4. re'8.(mib16) fa8 fa4 sol8\mbreak
    lab4.~lab4 sol8 mib8. re16 do8 mib8. fa16 re8
    do4. r4 r8 mi8.(fa16) sol8 sol4 la8

    %17
    sib4.~sib4 la8 fa8. mi16 re8 fa8. sol16 mi8
    re4. r\mbreak r8 r la fa'4 fa8
    fa16(mi re do sib la) sol8(re' fa) mi2.~

    %20
    mi16 re (do sib la sol) fa8 do' mi re2.~
    re16 do (sib la sol fa) mi8 si' re\mbreak dod4.~dod4 dod8
    re8.(mi16) fa8 fa8.(mi16) re8 dod8. re16 mi8 mi8. re16 dod8

    %23
    re4 r8 r4. r2.
    la'8.\f sib16 la8 la4 la8\mbreak sib4.~sib8. do16 la8

    %25
    sol8.(la16) sib8 la8.(sib16) sol8 fad8. sol16 la8 la4 sol8
    fad4 sib8 la4 sol8 fad4. r4 r8
    R1.

    %28
    re8. mib16 re8 re4 re8 mib4(sol8) mi8.(re16) mi8
    fa4(la8) fad8.(mi16) fad8 sol4.~sol8. fa?16 mib8
    re8. do16 sib8 la8. sol16 fad8 sol4 r8 r4.\mbreak

    %31
    r8 r sol do4 sib8 la4 re,8 re'4 do8
    sib8.(la16) sib8 sib8.(la16) sol8 fad4 sol8 do,4 re8
    sol,4 r8 r4. r2.

    %34
    R1.
    re''8.\f(mib16) re8 re4 re8 sol4(re8) sib'4(re,8)
    re8. mib16 re8 re4 re8 la'4(re,8) do'4(re,8)

    %37
    sib'8.(la16) sol8 fad4\tr sol8 la4 re,8 r r la'\mbreak
    sib8. la16 sol8 fad4 sol8 do,4. do8.(sib16) la8
    sib8.(la16) sol8 sib8.(do16) la8 sol8. re16 sib8 sol4.

}


IIobIn = \relative do'' {

    re8.(mib16) re8 re4 re8 sol4(re8) sib'4(re,8)
    re8. mib16 re8 re4 re8 la'4(re,8) do'4(re,8)
    sib'8.(la16) sol8 fad4\tr sol8 la4 re,8 r r la'\mbreak

    %4
    sib8. la16 sol8 fad4 sol8 do,4. \parentSlur (do8.)(sib16) la8
    sib8.(la16) sol8 sib8.(do16) la8 sol2.
    re'8.\pp(mib16) re8 re4 (mib8) re4(mib8) re4(do8)

    %7
    sib8.(do16) re8 do8.(re16) sib8 la4 r8 r4.\mbreak
    r2. la8.(sib16) do8 do8.(sib16) la8
    sib4 r8 r4. r2.

    %10
    r r8 r re mib8. fa16 re8
    do4 r8 r4 do8\f \mbreak re8.(do16) sib8 la4\tr sib8
    do4 fa,8 r r do' re8.(do16) sib8 la4\tr sib8

    %13
    mib4. sol4 fa8 re8.(do16) sib8 re8.(mib16) do8
    sib2. r\mbreak
    fa'8.\pp(sol16) fa8 fa4 r8 r4. r8 r sol

    %16
    mib8.(re16) do8 mib8.(fa16) re8 do4 r8 r4.
    R1.*6
    fa8.(sol16) la8 la8.(sol16) fa8 mi8.(fa16) sol8 sol8. \parentSlur (fa16) mi8

    %24
    fa4 r8 r4.\mbreak r2.
    R1.*2
    r2.\mbreak la,8.(sib16) do8 do8.(sib16) la8

    %28
    sib4. r r2.
    R1.*4
    sib8.(do16) re8 re8.(do16) sib8 la8.(sib16) do8 do8.(sib16) la8

    %34
    sib4 r8 r4.\mbreak r2.
    re8.\f(mib16) re8 re4 re8 sol4(re8) sib'4(re,8)
    re8. mib16 re8 re4 re8 la'4(re,8) do'4(re,8)

    %37
    sib'8.(la16) sol8 fad4\tr sol8 la4 re,8 r r la'\mbreak
    sib8. la16 sol8 fad4 sol8 do,4. do8.(sib16) la8
    sib8.(la16) sol8 sib8.(do16) la8 sol2.

}


IIobIIn = \relative do'' {

    sib4 sib8 sib4 sib8 sib4 r8 r4 r8
    la4 la8 la4 la8 la4 r8 r4 r8
    re8.(do16) sib8 do4 re8 re4 re8 re4 re8\mbreak

    %4
    re8. do16 sib8 do4 sib8 la4 la8 la4 la8
    sol4 sol8 sol8. \parentSlur (la16) fad8 sol2.
    sib8.\pp\parentSlur (do16) sib8 sib4(do8) sib4(do8) sib4(la8)
    sol8.(la16) sib8 la8.(sib16) sol8 fad4 r8 r4.\mbreak
    r2. fad8.(sol16) la8 la8.\parentSlur (sol16) fad8
    sol4 r8 r4. r2.
    r r8 r sib do8. re16 sib8
    la4 r8 r r fa?\f\mbreak fa8. \parentSlur (mib16) re8 mib4 fa8
    la8. sib16 do8 do4 la8 fa8.(mib16) re8 mib4 fa8
    do'4. mib8. \parentSlur (re16) do8 sib4 sib8 sib8. \parentSlur (do16) la8

    %14
    sib2. r\mbreak
    re8.\pp\parentSlur (mib16) re8 re4 r8 r4. r8 r si
    do4 do8 do8.\parentSlur (re16) si8 do4 r8 r4.
    R1.*6
    re8.(mi16) fa8 fa8.(mi16) re8 dod8.(re16) mi8 mi8.(re16) dod8
    re4 r8 r4. r2.
    R1.*2
    r2.\mbreak fad,8.(sol16) la8 la8.(sol16) fad8
    sol4. r r2.
    R1.*4
    sol8.(la16) sib8 sib8.(la16) sol8 fad8.(sol16) la8 la8.(sol16) fad8
    sol4 r8 r4.\mbreak r2.
    sib4\f sib8 sib4 sib8 sib4 r8 r4 r8
    la4 la8 la4 la8 la4 r8 r4 r8

    %37
    re8.(do16) sib8 do4 re8\mbreak re4 re8 re4 re8
    re8.(do16) sib8 do4 sib8 la4 la8 la4 la8
    sol4 sol8 sol8.(la16) fad8 sol2.

}


IIfgn = \relative do {

    sol'4 sol8 sol4 sol8 sol4 r8 r4.
    fad4 fad8 fad4 fad8 fad4 r8 r4.
    sol8. la16 sib8 la4 sol8 re8. mi16 fad8 fad4 re8\mbreak

    %4
    sol8. la16 sib8 la4 sol8 fad4 fad8 fad4 fad8
    sol4 sib8 re4 re,8 sol2.
    sol4 sol8 sol4 sol8 sol4 sol8 sol4 fad8

    %7
    sol4 sol8 do,4 do8 re4 r8 r4.
    r2. re4 re8 re4 re8
    sol4 r8 r4. r2.

    %10
    r r8 r fa fa4 fa8
    fa4 r8 r r fa\f\mbreak sib8. do16 re8 do4 sib8
    fa8. sol16 la8 la4 fa8 sib8. do16 re8 do4 sib8

    %13
    la4. sol4 la8 sib4 re,8 fa4 fa,8
    sib2. r\mbreak
    r r4. r8 r sol

    %16
    do4 mib8 sol4 sol,8 do4 r8 r4.
    R1.*6
    re4 re8 re4 re8 la'4 la8 la4 la8

    %24
    re,4 re8 re4 re8\mbreak sol4 sol8 re4 re8
    mi4 mi8 do4 do8 re4 re8 re4 re8
    re4 re8 re4 re8 re4 r8 r4 r8

    %27
    r2.\mbreak re4 re8 re4 re8
    sol4 r8 r4. r2.
    R1.*4

    %33
    sol,4 sol8 sol4 sol8 re'4 re8 re4 re8
    sol,4 r8 r4.\mbreak r2.
    sol'4\f sol8 sol4 sol8 sol4 r8 r4.

    %36
    fad4 fad8 fad4 fad8 fad4 r8 r4.
    sol8. la16 sib8 la4 sol8\mbreak re8. mi16 fad8 fad4 re8
    sol8. la16 sib8 la4 sol8 fad4 fad8 fad4 fad8

    %39
    sol4 sib8 re4 re,8 sol2.\fermata

}

IIvlIn = \relative do'' {

    re8.(mib16) re8 re4 re8 sol4(re8) sib'4(re,8)
    re8. mib16 re8 re4 re8 la'4(re,8) do'4(re,8)
    sib'8.(la16) sol8 fad4\tr sol8 la4 re,8 r r la'\mbreak

    %4
    sib8. la16 sol8 fad4 sol8 do,4. \parentSlur (do8.)(sib16) la8
    sib8.(la16) sol8 sib8.(do16) la8 sol8. re16 sib8 sol4.
    R1.*5

    %11
    r4. r8 r do'\f \mbreak re8.(do16) sib8 la4\tr sib8
    do4 fa,8 r r do' re8.(do16) sib8 la4\tr sib8
    mib4. sol4 fa8 re8.(do16) sib8 re8.(mib16) do8

    %14
    sib8. fa16 re8 sib4. r2.\mbreak
    R1.*3
    r2.\mbreak re4 re8 re4 re8

    %19
    sol4 sol8 sol4 sol8 do,4 do8 do4 do8
    fa4 fa8 fa4 fa8 sib,4 sib8 sib4 sib8
    mi4 mi8 mi4 mi8\mbreak la,4 la8 la4 la8

    %22
    re4 re8 re4 re8 la'4 la8 la4 la8
    re,4 r8 r4 r8 r2.
    la''8.\f sib16 la8 la4 la8\mbreak sib4.~sib8. do16 la8

    %25
    sol8.(la16) sib8 la8.(sib16) sol8 fad8. sol16 la8 la4 sol8
    fad4 sib8 la4 sol8 fad4. r4 r8
    R1.

    %28
    r2. r8 r8 sol, do4 sib8
    la4 re,8 re'4 do8 sib8. la16 sib8 sib8. la16 sol8
    fad4 sol8 do,4 re8 sol,4 r8 r4 r8\mbreak

    %31
    R1.*4
    re''8.\f(mib16) re8 re4 re8 sol4(re8) sib'4(re,8)
    re8. mib16 re8 re4 re8 la'4(re,8) do'4(re,8)

    %37
    sib'8.(la16) sol8 fad4\tr sol8 la4 re,8 r r la'\mbreak
    sib8. la16 sol8 fad4 sol8 do,4. do8.(sib16) la8
    sib8.(la16) sol8 sib8.(do16) la8 sol8. re16 sib8 sol4.

}


IIvlIIn = \relative do'' {

    sib4 sib8 sib4 sib8 sib4 r8 r4 r8
    la4 la8 la4 la8 la4 r8 r4 r8
    re8.(do16) sib8 do4 re8 re4 re8 re4 re8\mbreak

    %4
    re8. do16 sib8 do4 sib8 la4 la8 la4 la8
    sol4 sol8 sol8. la16 fad8 sol8. re16 sib8 sol4.
    R1.*5

    %11
    r4. r8 r fa'\f fa8.(mib16) re8 mib4 fa8
    la8. sib16 do8 do4 la8 fa8.(mib16) re8 mib4 fa8
    do'4. mib8. \parentSlur (re16) do8 sib4 sib8 sib8. \parentSlur (do16) la8

    %14
    sib8. fa16 re8 sib4. r2.
    R1.*3
    r2.\mbreak re4 re8 re4 re8

    %19
    sol4 sol8 sol4 sol8 do,4 do8 do4 do8
    fa4 fa8 fa4 fa8 sib,4 sib8 sib4 sib8
    mi4 mi8 mi4 mi8\mbreak la,4 la8 la4 la8

    %22
    re4 re8 re4 re8 la'4 la8 la4 la8
    re,4 r8 r4 r8 r2.
    fa'4\f fa8 fa4 fa8\mbreak sol4 sol8 fa4 fa8

    %25
    mib4 mib8 mib4 mib8 la,8. sib16 do8 do4 sib8
    la4 re8 do4 sib8 la4 r8 r4 r8
    R1.

    %28
    r2. r8 r sol8 do4 sib8
    la4 re,8 re'4 do8 sib8. la16 sib8 sib8. la16 sol8
    fad4 sol8 do,4 re8 sib4 r8 r4 r8\mbreak

    %31
    R1.*4
    sib'4\f sib8 sib4 sib8 sib4 r8 r4 r8
    la4 la8 la4 la8 la4 r8 r4 r8

    %37
    re8.(do16) sib8 do4 re8\mbreak re4 re8 re4 re8
    re8.(do16) sib8 do4 sib8 la4 la8 la4 la8
    sol4 sol8 sol8.(la16) fad8 sol8. re16 sib8 sol4.

}


IIvlan = \relative do' {

    re4 re8 re4 re8 re4 r8 r4.
    re4 re8 re4 re8 re4 r8 r4.
    re8. fad16 sol8 la4 sib8 fad8. sol16 la8 la4 fad8\mbreak

    %4
    sib,8. do16 re8 do4 re8 re4 re8 re4 re8
    re4 re8 re4 re8 re2.
    R1.*5

    %11
    r4. r8 r do\f\mbreak sib8. la16 sib8 do4 re8
    do4 do8 do4 do8  sib8. la16 sib8 do4 re8
    do4. sib4 fa'8 fa4 fa8 fa4 fa8

    %14
    fa2. r\mbreak
    R1.*3
    r2. re4 re8 re4 re8

    %19
    sol4 sol8 sol4 sol8 do,4 do8 do4 do8
    fa4 fa8 fa4 fa8 sib,4 sib8 sib4 sib8
    mi4 mi8 mi4 mi8\mbreak la,4 la8 la4 la8

    %22
    re4 re8 re4 re8 la'4 la8 la4 la8
    re,4 r8 r4 r8 r2.
    re4\f re8 re4 re8\mbreak re4 re8 re4 re8

    %25
    sib4 sib8 mib4 mib8 re4 re8 re4 sol8
    la4 sol8 fad4 sol8 re4 r8 r4 r8
    R1.

    %28
    r2. r8 r sol do4 sib8
    la4 re,8 re'4 do8 sib8. la16 sib8 sib8. la16 sol8
    fad4 sol8 do,4 re8 sol,4 r8 r4 r8\mbreak

    %31
    R1.*4
    re'4\f re8 re4 re8 re4 r8 r4 r8
    re4 re8 re4 re8 re4 r8 r4.

    %37
    re8. fad16 sol8 la4 sib8 fad8. sol16 la8 la4 fad8\mbreak
    sib,8. do16 re8 do4 re8 re4 re8 re4 re8
    re4 re8 re4 re8 re2.\fermata

}


IIbcn = \relative do {

    sol'4 sol8 sol4 sol8 sol4 r8 r4.
    fad4 fad8 fad4 fad8 fad4 r8 r4.
    sol8. la16 sib8 la4 sol8 re8. mi16 fad8 fad4 re8\mbreak

    %4
    sol8. la16 sib8 la4 sol8 fad4 fad8 fad4 fad8
    sol4 sib8 re4 re,8 sol2.
    R1.

    %7
    r2. re4 re8 re4 re8\mbreak
    re4 re8 re4 re8 re4 r8 r4.
    sol4 sol8 sol8. fa16 mib8 re4 re8 mib4 mib8

    %10
    fa4 fa8 fa4 fa8 fa4 r8 r4.
    fa4 fa8 fa4 fa8\f \mbreak sib8. do16 re8 do4 sib8
    fa8. sol16 la8 la4 fa8 sib8. do16 re8 do4 sib8

    %13
    la4. sol4 la8 sib4 re,8 fa4 fa,8
    sib2. sib4\p sib8 sib4 sib8\mbreak
    si4 si8 si4 si8 do4 mib8 sol4 sol,8

    %16
    do4 r8 r4. do4 do8 do4 do8
    dod4 dod8 dod4 dod8 re4 fa8 la4 la,8
    re4 fa8 la4 la,8\mbreak re4 r8 r4.

    %19
    R1.*5
    re4 re8 re4 re8\mbreak sol4 sol8 re4 re8
    mi4 mi8 do4 do8 re4 re8 re4 re8

    %26
    re4 re8 re4 re8 re4 re8 re4 re8
    re4 re8 re4 re8 \mbreak re4 r8 r4.
    R1.*6

    %34
    sol,4 sol8 sol4 sol8\mbreak re'4 re8 re4 re8
    sol4\f sol8 sol4 sol8 sol4 r8 r4.
    fad4 fad8 fad4 fad8 fad4 r8 r4.

    %37
    sol8. la16 sib8 la4 sol8\mbreak re8. mi16 fad8 fad4 re8
    sol8. la16 sib8 la4 sol8 fad4 fad8 fad4 fad8
    sol4 sib8 re4 re,8 sol2.\fermopz

}

IIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

}


forma = {

\time 12/8
\key sol\minor
\tempo 4. = 55
s1.*39
\bar"|."

}


IIvl = {
	\IIglobal
	\notypeset
	<<\IIvln \forma>>

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

IIobI = {
	\IIglobal
	<<\IIobIn \forma>>

}

IIobII = {
	\IIglobal
	<<\IIobIIn \forma>>

}

IIfg = {
	\IIglobal
	\clef bass
	<<\IIfgn \forma>>

}

IIflI = {
	\IIglobal
	<<\IIflIn \forma>>

}

IIflII = {
	\IIglobal
	<<\IIflIIn \forma>>

}

IIbc = {
	\IIglobal
	\clef bass
	<<\IIbcn \forma\IIbfn >>
	\typeset

}


IIIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
			}


IIIflIn =  \relative do'' {

    sol'8[re re sol]
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %4
    si8 sol r la
    si16(do re4) la8
    si16(do re4) la8\mbreak

    %7
    si sol16 si re8 si16 re
    sol(la si4) re,8
    dod la16 dod mi8 dod16 mi

    %10
    la4 r16 dod, re mi
    la,8 re16 dod re8 si
    la re16 dod re8 sol,

    %13
    fad4 mi\tr \mbreak
    re r16 re' do re
    si do re4 fa8

    %16
    mi do~do16 mi re mi
    dod re mi4 sol8
    fad re,4 la''8

    %19
    si16(do re4) do8
    si16(do re4) do8\mbreak
    si la16 sol la8 fad

    %22
    sol sol, r la\p
    sib16(do re4) la8
    sib16 do re4 do8\f

    %25
    si! la16 sol la8 fad
    sol16 la si do re8 sol
    si,4 la\tr\mbreak

    %28
    sol r
    R2*9
    r4 r8 sol'

    %39
    fad16 mi fad sol la8 la
    si sol4 la8
    si sol16 la si8 la16 sol

    %42
    la sol fad sol la si sol la
    si8 sol16 la si8 la16 sol\mbreak
    la8 fad16 sol la8 si

    %45
    sol[(fad) fad(mi)]
    mi re16 mi fad8 mi16 re
    mi(fad sol4) fad8

    %48
    mi re16 mi fad8 mi16 re
    mi4 r
    R2

    %51
    la16 sol fad sol la si la si\mbreak
    la sol fad sol la si sol la
    si la sol la si do si do

    %54
    la sol fad sol la si la si
    sol(fad sol la) fad(mi fad sol)
    mi(re mi fad) mi sol fad la

    %57
    sol(fad sol la) fad(mi fad sol)
    mi8[si'(la sol)]\mbreak
    fad4 mi\tr
    re8[la la re]

    %61
    dod4 r8 re16 la
    si dod re la sol8 mi'16 sol,
    fad8 re16 fad la8 fad16 la

    %64
    re mi fad sol la8 do,
    si sol16 si re8 si16 re\mbreak
    mi16 fad sold la si8 re,

    %67
    dod la16 dod mi8 dod16 mi
    la8 sol4 la8
    fad mi16 re si'8 si

    %70
    si16 sol mi dod la'8 la
    la16 fad re si sol'8 sol
    sol16 mi dod la fad'8 fad\mbreak

    %73
    fad16 re si sol mi'8 re
    dod[la'\p(sold la)]
    mi fa4 mi16 re

    %76
    dod8[la'(sold la)]
    mi fa4 mi16 re
    dod\f(re mi dod) la8 sol

    %79
    fad re' mi,[dod']\mbreak
    re8[la'(sol la)]
    si[si(la sol)]

    %82
    la[fad(mi fad)]
    sol[sol(fad mi)]
    fad16 mi fad sol la si la si

    %85
    sol la sol la fad sol fad sol
    mi4 r\mbreak
    R2*2

    %89
    mi8 re16 mi fad8 mi16 re
    mi fad sol4 fad16 mi
    fad la sol la fad mi re fad

    %92
    mi la sol la mi re dod mi
    re si' la si re, dod si re
    dod si dod re\mbreak mi fad sol mi

    %95
    fad4 r
    R2*14
    r4 r8 fad

    %111
    sol16 mi sol si fad red fad si
    sol4 r
    R2*4

    %117
    r4 r8 mi
    red16 si(la si) mi si(la si)
    fad' si,(la si) sol' si,(la si)

    %120
    fad' sol fad sol la sol la fad
    sol la sol la si la sol la\mbreak
    fad4 r

    %123
    R2*4
    r16 la sol la mi sol fad mi\mbreak
    fad8[la re, fad]
    r16 sol fad sol re fa mi re

    %130
    mi8[sol do, mi]
    r16 fad mi fad dod mi re dod
    red8 si mi4~

    %133
    mi8 dod fad4~\mbreak
    fad8 re sol4~
    sol8 mi la4~

    %136
    la8 fad si16 la sol fad
    sol fad sol la si la sol fad
    sol fad sol la si la sol fad

    %139
    sol fad mi fad si,8 red\mbreak
    mi sol16 la si8 si
    la fad16 sol la8 sol16 fad

    %142
    sol fad sol la si8 si
    la[(sol) sol(fad)]
    fad4 r

    %145
    R2*9
    r8 re'[re(do)]
    do(si) si(la)

    %156
    la(si) si(la)
    la(sol) sol(fad)
    fad(mi) mi(re)

    %159
    re(do) do(si)
    si[re re sol]\mbreak
    fad4 r8 sol16 re

    %162
    mi(fad sol) re do8 la'16 do,
    si8 sol r4
    R2*6

    %170
    r16 re' do re la do si la
    si sol' fad sol re fa mi re
    mi la sol la mi sol fad? mi

    %173
    fad la sol la fad la mi la
    re, fad mi fad re fad do fad\mbreak
    si, sol' fad sol mi sol re sol

    %176
    do, mi re mi do mi si mi
    la, fad' mi fad re fad do fad
    si, sol' fad sol si, sol' fad sol

    %179
    la, sol' fad sol la, sol' fad sol
    la, fad' mi fad la, fad' mi fad
    sol4 r\mbreak

    %182
    R2*7
    r4 r16 re do re
    si(do re4) fa8
    mi do~do16 mi re mi

    %192
    dod re mi4 sol8
    fad re,4 la''8
    si16(do re4) do8

    %195
    si16(do re4) do8\mbreak
    si la16 sol la8 fad
    sol sol, r la\p

    %198
    sib16(do re4) la8
    sib16 (do re4) do8\f
    si! la16 sol la8 fad

    %201
    sol mi'16 re mi8 sol,
    fad re'16 do re8 fad,\mbreak
    mi do'16 si do8 mi,

    %204
    re[re'\p(dod re)]
    la sib4 la16 sol
    fad8[re'(dod re)]

    %207
    la sib4 la16 sol
    fad\f re mi fad sol fad sol la
    si la si do re8 r\mbreak

    %210
    R2
    r4 r8 r16 sol
    sol4 fad

    %213
    sol2

}


IIIflIIn =  \relative do'' {

    sol'8[re re sol]
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %4
    si8 sol r la
    si16(do re4) la8
    si16(do re4) la8\mbreak

    %7
    si sol16 si re8 si16 re
    sol(la si4) re,8
    dod la16 dod mi8 dod16 mi

    %10
    la4 r16 dod, re mi
    la,8 re16 dod re8 si
    la re16 dod re8 sol,

    %13
    fad4 mi\tr \mbreak
    re r16 re' do re
    si do re4 fa8

    %16
    mi do~do16 mi re mi
    dod re mi4 sol8
    fad re,4 la''8

    %19
    si16(do re4) do8
    si16(do re4) do8\mbreak
    si la16 sol la8 fad

    %22
    sol sol, r la\p
    sib16(do re4) la8
    sib16 do re4 do8\f

    %25
    si! la16 sol la8 fad
    sol16 la si do re8 sol
    si,4 la\tr\mbreak

    %28
    sol r
    R2*9
    r4 r8 re'

    %39
    re16 dod re mi fad8 fad
    sol re4 fad8
    sol mi16 fad sol8 fad16 mi

    %42
    fad mi re mi fad sol mi fad
    sol8 mi16 fad sol8 fad16 mi\mbreak
    fad8 re16 mi fad8 fad

    %45
    mi[(re) re(dod)]
    dod? si16 dod re8 dod!16 si
    dod?(re mi4) re8

    %48
    dod si16 dod re8 dod16 si
    dod4 r
    R2

    %51
    fad16 mi re mi fad sol fad sol\mbreak
    fad mi re mi fad sol mi fad
    sol fad mi fad sol la sol la

    %54
    fad mi re mi fad sol fad sol
    mi(re mi fad) re(dod re mi)
    dod(si dod re) dod mi re fad

    %57
    mi(re mi fad) re(dod re mi)
    dod8[sol'(fad mi)]\mbreak
    re4 dod\tr
    re8[la la re]

    %61
    dod4 r8 re16 la
    si dod re la sol8 mi'16 sol,
    fad8 re16 fad la8 fad16 la

    %64
    re mi fad sol la8 do,
    si sol16 si re8 si16 re\mbreak
    mi16 fad sold la si8 re,

    %67
    dod la16 dod mi8 dod16 mi
    la8 sol4 la8
    fad mi16 re si'8 si

    %70
    si16 sol mi dod la'8 la
    la16 fad re si sol'8 sol
    sol16 mi dod la fad'8 fad\mbreak

    %73
    fad16 re si sol mi'8 re
    dod[la'\p(sold la)]
    mi fa4 mi16 re

    %76
    dod8[la'(sold la)]
    mi fa4 mi16 re
    dod\f(re mi dod) la8 sol

    %79
    fad re' mi,[dod']\mbreak
    re[fad(mi fad)]
    sol[sol(fad mi)]

    %82
    fad[la(sol la)]
    si[si(la sol)]
    la re,16 mi fad sol fad sol

    %85
    mi fad mi fad re mi re mi
    dod4 r\mbreak
    R2*2

    %89
    dod8 si16 dod re8 dod16 si
    dod re mi4 re16 dod
    re4 r

    %92
    R2*3
    r16 la' sol la fad mi re fad
    mi la sol la mi re dod mi

    %97
    re si' la si re, dod si re
    dod re mi re dod si la sol
    fad4 r

    %100
    R2*27
    r16 la' sol la mi sol fad mi\mbreak
    fad8[la re, fad]
    r16 sol fad sol re fa mi re

    %130
    mi8[sol do, mi]
    r16 fad mi fad dod mi re dod
    red8 si mi4~

    %133
    mi8 dod fad4~\mbreak
    fad8 re sol4~
    sol8 mi la4~

    %136
    la8 fad si16 la sol fad
    sol fad sol la si la sol fad
    sol fad sol la si la sol fad

    %139
    sol fad mi fad si,8 red\mbreak
    mi mi16 fad sol8 sol
    fad red16 mi fad8 mi16 red

    %142
    mi red mi fad sol8 sol
    fad[\parentSlur (mi) mi \parentSlur (red)]
    red4 r

    %145
    R2*9
    r8 si'[si(la)]
    la(sol) sol(fad)

    %156
    fad(re) re(do)
    do(si) si(la)
    la \parentSlur (do) do \parentSlur (si)

    %159
    si(la) la\parentSlur (sol)
    sol[re' re sol]
    fad4 r8 sol16 re

    %162
    mi(fad sol) re do8 la'16 do,
    si8 sol r4
    R2*16

    %180
    r4 r8 do
    si16 sol' fad sol si, sol' fad sol\mbreak
    la, sol' fad sol la, sol' fad sol

    %183
    la, fad' mi fad la, fad' mi fad
    sol4 r
    R2*4\mbreak

    %189
    r4 r16 re do re
    si\parentSlur (do re4) fa8
    mi do~do16 mi re mi

    %192
    dod re mi4 sol8
    fad re,4 la''8
    si16(do re4) do8

    %195
    si16(do re4) do8\mbreak
    si la16 sol la8 fad
    sol sol, r la\p

    %198
    sib16(do re4) la8
    sib16 (do re4) do8\f
    si! la16 sol la8 fad

    %201
    sol mi'16 re mi8 sol,
    fad re'16 do re8 fad,\mbreak
    mi do'16 si do8 mi,

    %204
    re[re'\p(dod re)]
    la sib4 la16 sol
    fad8[re'(dod re)]

    %207
    la sib4 la16 sol
    fad\f re mi fad sol fad sol la
    si la si do re8 r\mbreak

    %210
    R2
    r4 r8 r16 sol,
    la4 la

    %213
    si2

}

IIIvln =  \relative do'' {

    sol'8[re re sol]
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %4
    si8 sol r la
    si16(do re4) la8
    si16(do re4) la8\mbreak

    %7
    si sol16 si re8 si16 re
    sol(la si4) re,8
    dod la16 dod mi8 dod16 mi

    %10
    la4 r16 dod, re mi
    la,8 re16 dod re8 si
    la re16 dod re8 sol,

    %13
    fad4 mi\tr \mbreak
    re r16 re' do re
    si do re4 fa8

    %16
    \once\stemUp mi do,~ \stemUp do16 \stemDown mi' re mi\stemNeutral
    dod re mi4 sol8
    fad re,4 la''8

    %19
    si16(do re4) do8
    si16(do re4) do8\mbreak
    si la16 sol la8 fad

    %22
    sol sol, r la\p
    sib16(do re4) la8
    sib16 do re4 do8\f

    %25
    si! la16 sol la8 fad
    sol16 la si do re8 sol
    si,4 la\tr\mbreak

    %28
    sol r
    R2*31
    re'8\f[la la re]

    %61
    dod4 r8 re16 la
    si dod re la sol8 mi'16 sol,
    fad8 re16 fad la8 fad16 la

    %64
    re mi fad sol la8 do,
    si sol16 si re8 si16 re\mbreak
    mi16 fad sold la si8 re,

    %67
    dod la16 dod mi8 dod16 mi
    la8 sol4 la8
    fad mi16 re si'8 si

    %70
    si16 sol mi dod la'8 la
    la16 fad re si sol'8 sol
    sol16 mi dod la fad'8 fad\mbreak

    %73
    fad16 re si sol mi'8 re
    dod[la'\p(sold la)]
    mi fa4 mi16 re

    %76
    dod8[la'(sold la)]
    mi fa4 mi16 re
    dod\f(re mi dod) la8 sol

    %79
    fad re' mi,[dod']\mbreak
    re re, r re\p
    sol4 sol,

    %82
    re'4 r8 re
    sol4 sol,
    re' re'

    %85
    dod re
    la r\mbreak
    R2*2

    %89
    la4 re,
    la' la,
    re re'

    %92
    dod r
    si sold
    la\mbreak r8 dod,

    %95
    re4 re'
    dod r
    si sold

    %98
    la r8 dod,
    re4 r
    R2*3

    %103
    r16 re fad la re mi do re
    si sol si re la fad la re
    si la sol la si do re mi

    %106
    dod la dod mi si sold si mi
    dod si la si dod re mi fad
    re si re fad\mbreak dod lad dod fad

    %109
    re si re fad si la sol fad
    sol mi sol si fad red fad si
    sol4 r8 fad

    %112
    sol16 mi sol si fad red fad si
    sol(fad mi re?) do? mi la sol
    fad(mi re do) si re sol fad\mbreak

    %115
    mi(re do si) la do fad mi
    red si(la si) mi si(la si)
    fad' si,(la si) sol' si,(la si)

    %118
    fad'4 r
    r r8 mi
    red16 mi red mi fad mi fad red

    %121
    mi red mi fad sol fad mi fad\mbreak
    red4 r
    R2*4

    %127
    r16 la' sol la mi sol fad mi\mbreak
    fad8[la re, fad]
    r16 sol fad sol re fa mi re

    %130
    mi8[sol do, mi]
    r16 fad mi fad dod mi re dod
    red8 si mi4~

    %133
    mi8 dod fad4~\mbreak
    fad8 re sol4~
    sol8 mi la4~

    %136
    la8 fad si16 la sol fad
    sol fad sol la si la sol fad
    sol fad sol la si la sol fad

    %139
    sol fad mi fad si,8 red\mbreak
    mi4 r
    R2*19

    %160
    sol8[re re sol]
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %163
    si8 sol r4
    R2*6
    r4 fad\p

    %171
    sol si,
    do dod
    re8 la' re do

    %174
    si4 r8 la\mbreak
    sol[si do si]
    la4 r8 sol

    %177
    fad[la si la]
    sol4 sol
    do, do

    %180
    re re
    sol, sol'\mbreak
    do, do

    %183
    re re
    sol, r
    R2*4

    %189
    r4 r16 re'' do re
    si do re4 fa8
    \once\stemUp mi do,~ \stemUp do16 \stemDown mi' re mi\stemNeutral

    %192
    dod re mi4 sol8
    fad re,4 la''8
    si16(do re4) do8

    %195
    si16(do re4) do8\mbreak
    si la16 sol la8 fad
    sol sol, r la\p

    %198
    sib16(do re4) la8
    sib16 (do re4) do8\f
    si! la16 sol la8 fad

    %201
    sol mi'16 re mi8 sol,
    fad re'16 do re8 fad,\mbreak
    mi do'16 si do8 mi,

    %204
    re[re'\p(dod re)]
    la sib4 la16 sol
    fad8[re'(dod re)]

    %207
    la sib4 la16 sol
    fad\f re mi fad sol fad sol la
    si la si do re8 fad,\mbreak

    %210
    sol[si, do re]
    sol,4 r8 r16 sol''
    sol4 fad

    %213
    sol2

}


IIIobIn = \relative do'' {

    sol'8[re re sol]
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %4
    si8 sol r la
    si16(do re4) la8
    si16(do re4) la8\mbreak

    %7
    si sol16 si re8 si16 re
    sol(la si4) re,8
    dod la16 dod mi8 dod16 mi

    %10
    la4 r16 dod, re mi
    la,8 re16 dod re8 si
    la re16 dod re8 sol,

    %13
    fad4 mi\tr \mbreak
    re r16 re' do re
    si do re4 fa8

    %16
    mi do~do16 mi re mi
    dod re mi4 sol8
    fad re, r4

    %19
    R2
    r4 r8 do''\mbreak
    si la16 sol la8 fad

    %22
    sol sol, r4
    R2
    r4 r8 do\f

    %25
    si! la16 sol la8 fad
    sol16 la si do re8 sol
    si,4 la\tr\mbreak

    %28
    sol r8 re'16 do
    si la si do re8 re
    mi do4 re8

    %31
    mi do16 re mi8 re16 do
    re do si do re mi do re
    mi8 do16 re mi8 re16 do

    %34
    re8 si16 (do) re8(mi)
    do(si) si(la)\mbreak
    la sol16 la si8 la16 sol

    %37
    la(si do4) si8
    la sol16 la si8 la16 sol
    la4 r

    %40
    R2*9
    mi'16 re dod re mi fad mi fad
    mi re dod re mi fad re mi

    %51
    fad4 r\mbreak
    R2*8
    re8[la la re]

    %61
    dod4 r8 re16 la
    si dod re la sol8 mi'16 sol,
    fad8 re16 fad la8 fad16 la

    %64
    re mi fad sol la8 do,
    si sol16 si re8 si16 re\mbreak
    mi16 fad sold la si8 re,

    %67
    dod la16 dod mi8 dod16 mi
    la8 sol4 la8
    fad mi16 re si'8 si

    %70
    si16 sol mi dod la'8 la
    la16 fad re si sol'8 sol
    sol16 mi dod la fad'8 fad\mbreak

    %73
    fad16 re si sol mi'8 re
    dod4 r
    R2*2

    %77
    r4 r8 mi16 re
    dod\f(re mi dod) la8 sol
    fad re' mi,[dod']\mbreak

    %80
    re re, r4
    R2*5
    mi'8 re16 mi fad8 mi16 re\mbreak

    %87
    mi(fad sol4) fad8
    mi[la(sol fad)]
    mi4 r

    %90
    R2*9
    r8 la,[(sol la)]
    si_\upl[si(la sol)]\mbreak

    %101
    la_\upl [fad(mi fad)]
    sol_\upl[sol(fad mi)]
    fad4 r

    %104
    R2*18
    fad'16 sol fad sol la sol la fad
    sol la sol la si la sol la

    %124
    fad sol la4 sol16 fad
    sol8. la16 fad8.\tr mi16
    mi4 r

    %127
    r16 la sol la mi sol fad mi\mbreak
    fad8[la re, fad]
    r16 sol fad sol re fa mi re

    %130
    mi8[sol do, mi]
    r16 fad mi fad dod mi re dod
    red8 si mi4~

    %133
    mi8 dod fad4~\mbreak
    fad8 re sol4~
    sol8 mi la4~

    %136
    la8 fad si16 la sol fad
    sol fad sol la si la sol fad
    sol fad sol la si la sol fad

    %139
    sol fad mi fad si,8 red\mbreak
    mi4 r
    R2*3

    %144
    r16 fad mi fad si, fad' mi fad
    sol la fad sol mi fad re mi
    dod mi re mi la, mi' re mi\mbreak

    %147
    fad sol mi fad re mi do! re
    si re do re sol, re' do re
    mi fa re mi do re si do

    %150
    la8[(re) re(do)]
    do[(si) si(la)]
    la si16(do) re8(do)

    %153
    do[(si) si(la)]\mbreak
    la4 r
    R2*5

    %160
    sol'8[re re sol]\mbreak
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %163
    si la si do re8 re
    mi do4 re8
    mi do16 re mi8 re16 do

    %166
    re do si do re mi do re
    mi8 do16 re mi8 re16 do\mbreak
    re8 si16 do re8 mi

    %169
    do[(si) si(la)]
    la4 r
    R2*13

    %184
    re16 do si do re mi re mi
    do(si do re) si(la si do)
    la(sol la si) la do si re

    %187
    do si do re si la si do
    la8 [mi'(re do)]\mbreak
    si4 la\tr

    %190
    sol8 re'4 fa8
    mi do~do16 mi re mi
    dod re mi4 sol8

    %193
    fad re, r4
    R2
    r4 r8 do''\mbreak

    %196
    si la16 sol la8 fad
    sol sol, r4
    R2

    %199
    r4 r8 do\f
    si! la16 sol la8 fad
    sol mi'16 re mi8 sol,

    %202
    fad re'16 do re8 fad,\mbreak
    mi do'16 si do8 mi,
    re4 r

    %205
    R2*2
    r4 r8 la'16 sol fad\f
    re mi fad sol fad sol la

    %209
    si la si do re8 r\mbreak
    R2
    r4 r8 r16 sol

    %212
    sol4 fad\tr
    sol2

}


IIIobIIn = \relative do'' {

    sol'8[re re sol]
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %4
    si8 sol r la
    si16(do re4) la8
    si16(do re4) la8\mbreak

    %7
    si sol16 si re8 si16 re
    sol(la si4) re,8
    dod la16 dod mi8 dod16 mi

    %10
    la4 r16 dod, re mi
    la,8 re16 dod re8 si
    la re16 dod re8 sol,

    %13
    fad4 mi\tr \mbreak
    re r16 re' do re
    si do re4 fa8

    %16
    mi do~do16 mi re mi
    dod re mi4 sol8
    fad re, r4

    %19
    R2
    r4 r8 do''\mbreak
    si la16 sol la8 fad

    %22
    sol sol, r4
    R2
    r4 r8 do\f

    %25
    si! la16 sol la8 fad
    sol16 la si do re8 sol
    si,4 la\tr\mbreak

    %28
    sol r8 fad
    sol16 fad sol la si8 si
    do sol4 si8

    %31
    do la16 si do8 si16 la
    si la sol la si do la si
    do8 la16 si do8 si16 la

    %34
    si8 sol16 la si8 si
    la(sol) sol(fad)\mbreak
    fad mi16 fad sol8 fad16 mi

    %37
    fad(sol la4) sol8
    fad mi16 fad sol8 fad16 mi
    fad4 r

    %40
    R2*9
    dod'16 si la si dod re dod re
    dod si la si dod re si dod

    %51
    re4 r\mbreak
    R2*8
    re8[la la re]

    %61
    dod4 r8 re16 la
    si dod re la sol8 mi'16 sol,
    fad8 re16 fad la8 fad16 la

    %64
    re mi fad sol la8 do,
    si sol16 si re8 si16 re\mbreak
    mi16 fad sold la si8 re,

    %67
    dod la16 dod mi8 dod16 mi
    la8 sol4 la8
    fad mi16 re si'8 si

    %70
    si16 sol mi dod la'8 la
    la16 fad re si sol'8 sol
    sol16 mi dod la fad'8 fad\mbreak

    %73
    fad16 re si sol mi'8 re
    dod4 r
    R2*2

    %77
    r4 r8 mi16 re
    dod\f(re mi dod) la8 sol
    fad re' mi,[dod']\mbreak

    %80
    re re, r4
    R2*5
    dod'8 si16 dod re8 dod16 si\mbreak

    %87
    dod(re mi4) re8
    dod[fad(mi re)]
    dod4 r

    %90
    R2*9
    r8 fad,[mi fad]
    sol_\upl[sol(fad mi)]\mbreak

    %101
    fad_\upl[la(sol la)]
    si_\upl [si\parentSlur (la sol)]
    la4 r

    %104
    R2*18
    red16 mi red mi fad mi fad red
    mi fad mi fad sol fad mi fad

    %124
    red mi fad4 mi16 red
    mi8. fad16 red8.\tr mi16
    mi mi\f re mi si re do si

    %127
    do8[mi la, dod]\mbreak
    r16 re do? re la do si la

    %129
    si8 re sol, si
    r16 do si do sol si la sol
    la8[do fad, la]

    %132
    r8 red[si sol]
    r mi'[dod la]\mbreak
    r fad' [re si]

    %135
    r sol'[mi do]
    r la'[fad red]
    mi16 red mi fad sol fad mi red

    %138
    mi red mi fad sol fad mi red
    mi8 do si si\mbreak
    si4 r

    %141
    R2*9
    r8 si[si(la)]
    la[(sol) sol(fad)]

    %152
    fad sol16 la si8(la)
    la[(sol) sol(fad)]\mbreak
    fad4 r

    %155
    R2*5
    sol'8 re re sol]\mbreak
    fad4 r8 sol16 re

    %162
    mi(fad sol) re do8 la'16 do,
    si8 sol16 la si8 si
    do sol4 si8

    %165
    do la16 si do8 si16 la
    si la sol la si do la si
    do8 la16 si do8 si16 la\mbreak

    %168
    si8 sol16 la si8 si
    la\parentSlur (sol) sol\parentSlur (fad)
    fad4 r

    %171
    R2*13
    si16 la sol la si do si do
    la(sol la si) sol(fad sol la)

    %186
    fad\parentSlur (mi fad sol) fad la sol si
    la sol la si sol fad sol la
    fad8[do'(si la)]\mbreak

    %189
    sol4 fad\tr
    sol8 re'4 fa8
    mi do~do16 mi re mi
    dod re mi4 sol8

    %193
    fad re, r4
    R2
    r4 r8 do''\mbreak

    %196
    si la16 sol la8 fad
    sol sol, r4
    R2

    %199
    r4 r8 do\f
    si! la16 sol la8 fad
    sol mi'16 re mi8 sol,

    %202
    fad re'16 do re8 fad,\mbreak
    mi do'16 si do8 mi,
    re4 r

    %205
    R2*2
    r4 r8 la'16 sol fad\f
    re mi fad sol fad sol la

    %209
    si la si do re8 r\mbreak
    R2
    r4 r8 r16 sol,

    %212
    la4 la
    si2

}


IIIfgn = \relative do {

    sol'8[la si sol]
    re'[do si sol]
    do[si la re,]

    %4
    sol,[sol' fad re]
    sol[sol fad re]
    sol[sol fad re]\mbreak

    %7
    sol[sol sol sol]
    sol[sol sol sol]
    la[la la la]

    %10
    sol sol fad16 mi re dod
    re8[mi fad sol]
    re[mi fad sol]

    %13
    la[sol la la,]\mbreak
    re[mi fad re]
    sol[sol si si]

    %16
    do[re mi sol,]
    la la dod, dod
    re[mi fad re]

    %19
    sol[sol fad re]
    sol[sol fad re]\mbreak
    sol[si, do re]

    %22
    sol,[sol' fad re\p]
    sol[sol fad re]
    sol[sol fad re\f]

    %25
    sol[si, do re]
    sol,[la si do]
    re[do re re,]\mbreak

    %28
    sol8[sol' fad re]
    sol4 r8 sol,
    do4 do'8 sol

    %31
    do,4 do'
    sol r8 sol
    do4 do,

    %34
    sol' r8 sol
    fad4 sol\mbreak
    re8[re sol sol,]

    %37
    re'4 r8 sol
    re[re sol sol,]
    re'4 r

    %40
    R2*9
    la4 r8 la'
    la la, r la'

    %51
    re,4 r\mbreak
    R2*8

    %60
    re8\f[mi fad re]
    la'[sol fad re]
    sol fad mi la,

    %63
    re[re re re]
    fad[fad fad fad]
    sol[sol sol sol]\mbreak

    %66
    sold[sold sold sold]
    la[la la la]
    dod[dod dod dod]

    %69
    re re re16 si sol mi
    dod'8 dod dod16 la fad re
    si'8 si si16 sol mi dod

    %72
    la'8 la la16 fad re si\mbreak
    sol'8 sol sol16 fad sol mi
    la2\p~

    %75
    la
    la~
    la~

    %78
    la8[la\f dod dod]
    re[fad, sol la]\mbreak
    re,4 r

    %81
    R2*5
    la'8[la re re,]\mbreak
    la'4 r8 re,

    %88
    la'4 r8 re,
    la'4 r
    R2*9

    %99
    re,4 r8 re
    sol4 sol,\mbreak
    re'4 r8 re

    %102
    sol4 sol,
    re' r
    R2*18

    %122
    si'8 si, r si'
    mi4 mi,
    si'8[si red si]

    %125
    mi[la, si si,]
    mi[mi sold mi]
    la[la dod la]\mbreak

    %128
    re,[re fad re]
    sol[sol si sol]
    do,[do mi do]

    %131
    fad[fad la fad]
    si,[si' sol mi]
    la[sol la fad]\mbreak

    %134
    si[la si sol]
    do[si do la]
    red[dod red si]

    %137
    mi mi, r si'
    mi mi, r si'
    mi[la, si si,]\mbreak

    %140
    mi4 r
    R2*9
    re2~
    re

    %152
    re~
    re~\mbreak
    re~

    %155
    re~
    re~
    re~

    %158
    re~
    re
    sol8[la si sol]\mbreak

    %161
    re'[do si sol]
    do[si la re,]
    sol4 r8 sol,

    %164
    do4 do'8 sol
    do,4 do'
    sol r8 sol

    %167
    do4 do,\mbreak
    sol' r8 sol
    fad4 sol

    %170
    re r
    R2*13
    sol4 r8 sol

    %185
    fad4 sol
    re r8 sol
    fad4 sol

    %188
    re r8 fad\mbreak
    sol[do re re,]
    sol[sol si si]

    %191
    do[re mi sol,]
    la la dod, dod
    re[mi fad re]

    %194
    sol[sol fad re]
    sol[sol fad re]\mbreak
    sol[si, do re]

    %197
    sol,[sol' fad re\p]
    sol[sol fad re]
    sol[sol fad re\f]

    %200
    sol[si, do re]
    \once\stemUp sol, mi''16 re mi8 sol,
    fad re'16 do re8 fad,\mbreak

    %203
    mi do'16 si do8 mi,
    re2~
    re~

    %206
    re
    re~
    re8 mi16 fad sol fad sol la

    %209
    si la si do re8 fad,\mbreak
    sol[si, do re]
    sol,4 r8 r16 si

    %212
    do4 re
    sol,2

}

IIIvlIn = \relative do'' {

    sol'8[re re sol]
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %4
    si8 sol r la
    si16(do re4) la8
    si16(do re4) la8\mbreak

    %7
    si sol16 si re8 si16 re
    sol(la si4) re,8
    dod la16 dod mi8 dod16 mi

    %10
    la4 r16 dod, re mi
    la,8 re16 dod re8 si
    la re16 dod re8 sol,

    %13
    fad4 mi\tr \mbreak
    re r16 re' do re
    si do re4 fa8

    %16
    \once\stemUp mi do,~ \stemUp do16 \stemDown mi' re mi\stemNeutral
    dod re mi4 sol8
    fad re,4 la''8

    %19
    si16(do re4) do8
    si16(do re4) do8\mbreak
    si la16 sol la8 fad

    %22
    sol sol, r la\p
    sib16(do re4) la8
    sib16 do re4 do8\f

    %25
    si! la16 sol la8 fad
    sol16 la si do re8 sol
    si,4 la\tr\mbreak

    %28
    sol r
    R2*31
    re'8\f[la la re]

    %61
    dod4 r8 re16 la
    si dod re la sol8 mi'16 sol,
    fad8 re16 fad la8 fad16 la

    %64
    re mi fad sol la8 do,
    si sol16 si re8 si16 re\mbreak
    mi16 fad sold la si8 re,

    %67
    dod la16 dod mi8 dod16 mi
    la8 sol4 la8
    fad mi16 re si'8 si

    %70
    si16 sol mi dod la'8 la
    la16 fad re si sol'8 sol
    sol16 mi dod la fad'8 fad\mbreak

    %73
    fad16 re si sol mi'8 re
    dod[la'\p(sold la)]
    mi fa4 mi16 re

    %76
    dod8[la'(sold la)]
    mi fa4 mi16 re
    dod\f(re mi dod) la8 sol

    %79
    fad re' mi,[dod']\mbreak
    re re, r re\p
    sol4 sol,

    %82
    re'4 r8 re
    sol4 sol,
    re' re'

    %85
    dod re
    la r\mbreak
    R2*2

    %89
    la4 re,
    la' la,
    re re'

    %92
    dod r
    si sold
    la\mbreak r8 dod,

    %95
    re4 re'
    dod r
    si sold

    %98
    la r8 dod,
    re4 r
    R2*27

    %127
    r16 la'' sol la mi sol fad mi\mbreak
    fad8[la re, fad]
    r16 sol fad sol re fa mi re

    %130
    mi8[sol do, mi]
    r16 fad mi fad dod mi re dod
    red8 si mi4~

    %133
    mi8 dod fad4~\mbreak
    fad8 re sol4~
    sol8 mi la4~

    %136
    la8 fad si16 la sol fad
    sol fad sol la si la sol fad
    sol fad sol la si la sol fad

    %139
    sol fad mi fad si,8 red\mbreak
    mi4 r
    R2*19

    %160
    sol8[re re sol]
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %163
    si8 sol r4
    R2*6
    r4 fad\p

    %171
    sol si,
    do dod
    re8 la' re do

    %174
    si4 r8 la\mbreak
    sol[si do si]
    la4 r8 sol

    %177
    fad[la si la]
    sol4 sol
    do, do

    %180
    re re
    sol, sol'\mbreak
    do, do

    %183
    re re
    sol, r
    R2*4

    %189
    r4 r16 re'' do re
    si do re4 fa8
    \once\stemUp mi do,~ \stemUp do16 \stemDown mi' re mi\stemNeutral

    %192
    dod re mi4 sol8
    fad re,4 la''8
    si16(do re4) do8

    %195
    si16(do re4) do8\mbreak
    si la16 sol la8 fad
    sol sol, r la\p

    %198
    sib16(do re4) la8
    sib16 (do re4) do8\f
    si! la16 sol la8 fad

    %201
    sol mi'16 re mi8 sol,
    fad re'16 do re8 fad,\mbreak
    mi do'16 si do8 mi,

    %204
    re[re'\p(dod re)]
    la sib4 la16 sol
    fad8[re'(dod re)]

    %207
    la sib4 la16 sol
    fad\f re mi fad sol fad sol la
    si la si do re8 fad,\mbreak

    %210
    sol[si, do re]
    sol,4 r8 r16 sol''
    sol4 fad

    %213
    sol2

}


IIIvlIIn = \relative do'' {

    sol'8[re re sol]
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %4
    si8 sol r la
    si16(do re4) la8
    si16(do re4) la8\mbreak

    %7
    si sol16 si re8 si16 re
    sol(la si4) re,8
    dod la16 dod mi8 dod16 mi

    %10
    la4 r16 dod, re mi
    la,8 re16 dod re8 si
    la re16 dod re8 sol,

    %13
    fad4 mi\tr \mbreak
    re r16 re' do re
    si do re4 fa8

    %16
    \once\stemUp mi do,~ \stemUp do16 \stemDown mi' re mi\stemNeutral
    dod re mi4 sol8
    fad re,4 la''8

    %19
    si16(do re4) do8
    si16(do re4) do8\mbreak
    si la16 sol la8 fad

    %22
    sol sol, r la\p
    sib16(do re4) la8
    sib16 do re4 do8\f

    %25
    si! la16 sol la8 fad
    sol16 la si do re8 sol
    si,4 la\tr\mbreak

    %28
    sol r
    R2*31
    re'8\f[la la re]

    %61
    dod4 r8 re16 la
    si dod re la sol8 mi'16 sol,
    fad8 re16 fad la8 fad16 la

    %64
    re mi fad sol la8 do,
    si sol16 si re8 si16 re\mbreak
    mi16 fad sold la si8 re,

    %67
    dod la16 dod mi8 dod16 mi
    la8 sol4 la8
    fad mi16 re si'8 si

    %70
    si16 sol mi dod la'8 la
    la16 fad re si sol'8 sol
    sol16 mi dod la fad'8 fad\mbreak

    %73
    fad16 re si sol mi'8 re
    dod[la'\p(sold la)]
    mi fa4 mi16 re

    %76
    dod8[la'(sold la)]
    mi fa4 mi16 re
    dod\f(re mi dod) la8 sol

    %79
    fad re' mi,[dod']\mbreak
    re re, r re\p
    sol4 sol,

    %82
    re'4 r8 re
    sol4 sol,
    re' re'

    %85
    dod re
    la r\mbreak
    R2*2

    %89
    la4 re,
    la' la,
    re re'

    %92
    dod r
    si sold
    la\mbreak r8 dod,

    %95
    re4 re'
    dod r
    si sold

    %98
    la r8 dod,
    re4 r
    R2*26

    %126
    r16 mi' re mi si re do si
    do8[mi la, dod]\mbreak
    r16 re do? re la do si la

    %129
    si8 re sol, si
    r16 do si do sol si la sol
    la8[do fad, la]

    %132
    r8 red[si sol]
    r mi'[dod la]\mbreak
    r fad' [re si]

    %135
    r sol'[mi do]
    r la'[fad red]
    mi16 red mi fad sol fad mi red

    %138
    mi red mi fad sol fad mi red
    mi8 do si si\mbreak
    si4 r

    %141
    R2*19
    sol'8[re re sol]
    fad4 r8 sol16 re
    mi(fad sol) re do8 la'16 do,

    %163
    si8 sol r4
    R2*6
    r4 fad\p

    %171
    sol si,
    do dod
    re8 la' re do

    %174
    si4 r8 la\mbreak
    sol[si do si]
    la4 r8 sol

    %177
    fad[la si la]
    sol4 sol
    do, do

    %180
    re re
    sol, sol'\mbreak
    do, do

    %183
    re re
    sol, r
    R2*4

    %189
    r4 r16 re'' do re
    si do re4 fa8
    \once\stemUp mi do,~ \stemUp do16 \stemDown mi' re mi\stemNeutral

    %192
    dod re mi4 sol8
    fad re,4 la''8
    si16(do re4) do8

    %195
    si16(do re4) do8\mbreak
    si la16 sol la8 fad
    sol sol, r la\p

    %198
    sib16(do re4) la8
    sib16 (do re4) do8\f
    si! la16 sol la8 fad

    %201
    sol mi'16 re mi8 sol,
    fad re'16 do re8 fad,\mbreak
    mi do'16 si do8 mi,

    %204
    re[re'\p(dod re)]
    la sib4 la16 sol
    fad8[re'(dod re)]

    %207
    la sib4 la16 sol
    fad\f re mi fad sol fad sol la
    si la si do re8 fad,\mbreak

    %210
    sol[si, do re]
    sol,4 r8 r16 sol'
    la4 la

    %213
    si2

}


IIIvlan = \relative do' {

    si'8[la sol si]
    la[la re la]
    sol[sol sol fad]

    %4
    sol[re re fad]
    sol si la16 sol fad mi
    re8 si' la16 sol fad mi\mbreak

    %7
    re8[re si' si]
    si16 do re4 si8
    mi, mi dod dod

    %10
    dod? dod re16 mi fad sol
    fad8[sol la re,]
    fad[sol la re,]

    %13
    re4 dod\mbreak
    re16 re' do re la8 fad
    re[sol, sol' sol]

    %16
    sol[fad sol si]
    mi,[la, la' la]
    la[sol la fad]

    %19
    sol si la16 sol fad mi
    re8 si' la16 sol fad mi\mbreak
    re8[re' mi la,]

    %22
    si[re, re fad\p]
    sol sib la16 sol fad mi
    re8 sib' la16 sol fad mi

    %25
    re8\f[re mi la,]
    si sol'16 fad sol8 sol
    sol4 fad\tr\mbreak

    %28
    sol4 r
    R2*31
    fad8\f[mi re fad]

    %61
    mi[mi la fad]
    re[re re dod]
    re la16 re fad8 re16 fad

    %64
    la8[la re, la']
    sol re16 sol si8 sol16 re\mbreak
    si'8[si mi, si']

    %67
    la mi16 la dod8 la16 dod
    mi8[mi la, mi']
    re re, fad si16 sol

    %70
    mi8 mi mi la16 fad
    re8 re re sol16 mi
    dod8 dod dod fad16 re\mbreak

    %73
    si8[si si si']
    mi, fa4\p mi16 re
    dod8[la'(sold la)]

    %76
    mi fa4 mi16 re
    dod8[la'(sold la)]
    mi16 fad sol la mi8 mi

    %79
    la[la si mi,]\mbreak
    fad4 r
    R2*45

    %126
    si8 mi, r mi
    mi la r la\mbreak
    la re, r re

    %129
    re sol r sol
    sol do, r do
    do fad r fad

    %132
    fad[fad sol sol]
    mi[mi la la]\mbreak
    re,[re si' si]

    %135
    mi,[mi do' do]
    fad,[ fad fad si]
    si si r si

    %138
    si si r si
    si do fad, fad\mbreak
    sol4 r

    %141
    R2*19
    si8[la sol si]\mbreak
    la[la re si]

    %162
    sol[sol sol fad]
    sol4 r
    R2*25

    %189
    r4 r8 re
    re[sol, sol' sol]
    sol[fa sol si]

    %192
    mi,[la, la' la]
    la[sol la fad]
    sol si la16 sol fad mi

    %195
    re8 si' la16 sol fad mi\mbreak
    re8[re' mi la,]
    si[re, re fad\p]

    %198
    sol sib la16 sol fad mi
    re8 sib' la16 sol fad mi
    re8[re mi la,]

    %201
    si mi'16 re mi8 sol,
    fad re'16 do re8 fad,\mbreak
    mi do'16 si do8 mi,

    %204
    re8 sib'4 la16 sol
    fad8[re'(dod re)]
    la sib4 la16 sol

    %207
    fad8[re' dod re]
    la16 re, mi fad sol fad sol la
    si la si do re8 fad,\mbreak

    %210
    sol[si, do re]
    sol,4 r8 r16 re'
    mi4 re

    %213
    re2

}


IIIbcn = \relative do {

    sol'8[la si sol]
    re'[do si sol]
    do[si la re,]

    %4
    sol,[sol' fad re]
    sol[sol fad re]
    sol[sol fad re]\mbreak

    %7
    sol[sol sol sol]
    sol[sol sol sol]
    la[la la la]

    %10
    sol sol fad16 mi re dod
    re8[mi fad sol]
    re[mi fad sol]

    %13
    la[sol la la,]\mbreak
    re[mi fad re]
    sol[sol si si]

    %16
    do[re mi sol,]
    la la dod, dod
    re[mi fad re]

    %19
    sol[sol fad re]
    sol[sol fad re]\mbreak
    sol[si, do re]

    %22
    sol,[sol' fad re\p]
    sol[sol fad re]
    sol[sol fad re\f]

    %25
    sol[si, do re]
    sol,[la si do]
    re[do re re,]\mbreak

    %28
    sol4 r
    R2*9
    r4 r8 sol

    %39
    re'4 r8 re,
    sol4 sol'8 re
    sol,4 sol'

    %42
    re r8 re
    sol4 sol,\mbreak
    re'4 r8 re

    %45
    dod4 re
    la re
    la r8 re

    %48
    la'4 re,
    la r
    R2

    %51
    re4 r8 re'\mbreak
    re re, r re'
    sol,4 sol,

    %54
    re' r8 re
    dod4 re
    la r8 re

    %57
    dod4 re
    la r8 dod\mbreak
    re[sol la la,]

    %60
    re\f[mi fad re]
    la'[sol fad re]
    sol fad mi la,

    %63
    re[re re re]
    fad[fad fad fad]
    sol[sol sol sol]\mbreak

    %66
    sold[sold sold sold]
    la[la la la]
    dod[dod dod dod]

    %69
    re re re16 si sol mi
    dod'8 dod dod16 la fad re
    si'8 si si16 sol mi dod

    %72
    la'8 la la16 fad re si\mbreak
    sol'8 sol sol16 fad sol mi
    la2\p~

    %75
    la
    la~
    la~

    %78
    la8[la\f dod dod]
    re[fad, sol la]\mbreak
    re,4 r

    %81
    R2*22
    r8 re[fad re]
    sol sol fad fad

    %105
    sol4 r8 sold
    la[la sold sold]
    la4 r8 lad

    %108
    si si\mbreak lad lad
    si4 r8 red,
    mi mi red red

    %111
    mi mi red red
    mi mi red red
    mi4 r8 do

    %114
    re4 r8 si\mbreak
    do4 r8 la
    si4 r

    %117
    R2
    si4 r
    R2

    %120
    si'8 si, r si'
    mi4 mi,\mbreak
    si' r

    %123
    R2*3
    r8 mi,\f[sold mi]
    la[la dod la]\mbreak

    %128
    re,[re fad re]
    sol[sol si sol]
    do,[do mi do]

    %131
    fad[fad la fad]
    si,[si' sol mi]
    la[sol la fad]\mbreak

    %134
    si[la si sol]
    do[si do la]
    red[dod red si]

    %137
    mi mi, r si'
    mi mi, r si'
    mi[la, si si,]\mbreak

    %140
    mi4 r8 mi
    fad4 si,
    mi4 r8 mi

    %143
    red4 mi
    si red
    mi r8 sol

    %146
    la4 dod\mbreak
    re r8 fad,
    sol4 si

    %149
    do r8 do,
    re2~
    re

    %152
    re~
    re~\mbreak
    re~

    %155
    re~
    re~
    re~

    %158
    re~
    re
    sol8[la si sol]\mbreak

    %161
    re'[do si sol]
    do[si la re,]
    sol4 r

    %164
    R2*25
    r4 r8 re
    sol[sol si si]

    %191
    do[re mi sol,]
    la la dod, dod
    re[mi fad re]

    %194
    sol[sol fad re]
    sol[sol fad re]\mbreak
    sol[si, do re]

    %197
    sol,[sol' fad re\p]
    sol[sol fad re]
    sol[sol fad re\f]

    %200
    sol[si, do re]
    \once\stemUp sol, mi''16 re mi8 sol,
    fad re'16 do re8 fad,\mbreak

    %203
    mi do'16 si do8 mi,
    re2~
    re~

    %206
    re
    re~
    re8 mi16 fad sol fad sol la

    %209
    si la si do re8 fad,\mbreak
    sol[si, do re]
    sol,4 r8 r16 si

    %212
    do4 re
    sol,2

}

IIIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

}


forma = {

\time 2/4
\key sol\major
\tempo 2 = 65
s2*213
\bar"|."

}


IIIvl = {
	\IIIglobal
	%\notypeset
	<<\IIIvln \forma>>

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

IIIobI = {
	\IIIglobal
	<<\IIIobIn \forma>>

}

IIIobII = {
	\IIIglobal
	<<\IIIobIIn \forma>>

}

IIIfg = {
	\IIIglobal
	\clef bass
	<<\IIIfgn \forma>>

}

IIIflI = {
	\IIIglobal
	<<\IIIflIn \forma>>

}

IIIflII = {
	\IIIglobal
	<<\IIIflIIn \forma>>

}

IIIbc = {
	\IIIglobal
	\clef bass
	<<\IIIbcn \forma\IIIbfn >>
	\typeset

}
#(set-global-staff-size 16.5)


\pointAndClickOff


\paper  {

    systems-per-page = #2
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup \smaller "Concerto grosso [QV 6:6]"
    composer = \markup \center-column{"J. J. Quantz (1697-1773)"}
}

\markup \huge {[1. Allegro]}

\score {

    <<

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<
                \set PianoStaff.instrumentName = \markup  \center-column{"2 Flauti""traversi"}

                \new Staff = "main" <<
                    \set Staff.midiInstrument = #"flute"
                    \IflI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IflII
                >>
            >>

            \new PianoStaff <<
                \set PianoStaff.instrumentName = \markup  \center-column{"2 Oboè"}

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violino""concertato"}
                \set Staff.midiInstrument = #"violin"
                \Ivl
            >>

            \new PianoStaff <<
                \set PianoStaff.instrumentName = \markup  \center-column{"2 Violini""ripieni"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violetta"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \Ifg
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
            >>
        >>

    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

\markup \huge {[2.] alla Siciliana}

\score {

    <<

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<
                \set PianoStaff.instrumentName = \markup  \center-column{"2 Flauti""traversi"}

                \new Staff = "main" <<
                    \set Staff.midiInstrument = #"flute"
                    \IIflI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IIflII
                >>
            >>

            \new PianoStaff <<
                \set PianoStaff.instrumentName = \markup  \center-column{"2 Oboè"}

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violino""concertato"}
                \set Staff.midiInstrument = #"violin"
                \IIvl
            >>

            \new PianoStaff <<
                \set PianoStaff.instrumentName = \markup  \center-column{"2 Violini""ripieni"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violetta"}
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \IIfg
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

\markup \huge {[3.] Allegro}

\score {

    <<

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new PianoStaff <<
                \set PianoStaff.instrumentName = \markup  \center-column{"2 Flauti""traversi"}

                \new Staff = "main" <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIflI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIflII
                >>
            >>

            \new PianoStaff <<
                \set PianoStaff.instrumentName = \markup  \center-column{"2 Oboè"}

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violino""concertato"}
                \set Staff.midiInstrument = #"violin"
                \IIIvl
            >>

            \new PianoStaff <<
                \set PianoStaff.instrumentName = \markup  \center-column{"2 Violini""ripieni"}

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violetta"}
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \IIIfg
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>

    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
