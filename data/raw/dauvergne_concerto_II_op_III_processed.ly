\language "italiano"
%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

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
        \musicglyph "scripts.prall"
    }
}

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IvlIn = \relative do'' {

    fa,4. \tuplet 6/4	 { sol32(la sib do re mi) } fa4 fa,
    sol4. \tuplet 6/4 { la32(sib do re mi fa) } sol4 sol,
    \appoggiatura sol8 la4 \appoggiatura sol8 fa4 r8 r16 fa' sol8. la16

    %4
    mi,4. \tuplet 8/4 { fa32(sol la sib do re mi fa) } sol8. mi16 fa8. sol16\mbreak
    re,4. \tuplet 8/4 { mi32(fa sol la si do re mi) } fa8. re16 mi8. fa16
    mi8. do16 do,2 do'8. la16

    %7
    re4. \tuplet 7/4 { sib32(do re mi fa sol la)} sib4 re,
    mi-+ r16 do re mi fa4 fa,
    sib la8. sib16 sol8. sol16 do8. sib16

    %10
    la4_+  r16  la sib do re4 fa\mbreak
    si, -+r16 sol la si do8. mi,16 re8._+ do16
    sol2 re'_+

    %13
    do1 do
    r8 do' do do do do-+
    re4~re16 do sib la sib do re mi

    %16
    fa8 la,16 sib do sib la sib do sib la do\mbreak
    sib8 sol16 la sib la sol la sib la sol sib
    la8 fa'16 sol la sol fa sol la sol fa la

    %19
    sol8 mi16 fa sol fa mi fa sol fa mi sol
    fa8 re16 mi fa mi re mi fa mi re fa
    mi8 do'-! do-! do-! do-! do~

    %22
    do sib16 la sib8 sib \once\stemUp fa, sib'~
    sib la16 sol la8 la \once\stemUp fa, la'
    sol4 sol2-+

    %25
    \once\stemDown fa8 fa,16 fa la la do do fa fa la la
    \once\stemDown fa8 <fa, do> <fa do> <fa do> <fa do> <fa do>
    <mi do> mi16 mi sol sol do do mi mi sol sol

    %28
    \once\stemDown mi8 <mi, do> <mi do> <mi do> <mi do> <mi do>\mbreak
    <re si> re16 re sol sol si? si re re fa fa
    \once\stemDown re8 <re, si> <re si> <re si> <re si> <re si>

    %31
    <mi do>4. la'16 sol fa mi re do
    si8 fad\p(sol) fad(sol) fad(
    sol) mib\f-! re-! do-! si-! la-!

    %34
    sol fad'\p(sol) fad(sol) fad(
    sol) mib\f-! re-! do-! si-! la-!
    \once\stemUp sol sol''-! sol-! sol-! sol-! sol~

    %37
    sol fa16 mi fa8 fa \once\stemUp do, fa'~
    fa mi16 re mi8 mi \once\stemUp do, mi'
    re4 re2-+

    %40
    do4 do' do
    sib16 la sol la sib la sol fa mi re do sib'
    la sol fa sol la sol fa mi re do sib la'\mbreak

    %43
    sol fa mi fa sol fa mi re dod sib la sol'
    \once\stemDown fa8 re,16 re fa fa la la re re fa fa
    mi8-! sold,\p(la) sold(la) sold(

    %46
    la) fa\f-! mi-! re-! dod-! si-!
    la sold'\p(la) sold(la) sold(
    la) fa\f-! mi-! re-! dod-! si-!

    %49
    \once\stemUp la la'' la la la la
    si4~si16 dod la si dod re si dod\mbreak
    re8 fa, fa fa fa fa

    %52
    mi4 mi2-+
    re8 re,16 re fad fad la la re re fa fa
    \once\stemDown la8 <fad, do> <fad do> <fad do> <fad do> <fad do>

    %55
    <sol sib,> sib16\p do re do sib do re do sib re
    do8 la16 sib do sib la sib do sib la do
    sib8 sib,16 \f sib re re sol sol sib sib re re\mbreak

    %58
    \once\stemDown sol8 <mi, sib> <mi sib> <mi sib> <mi sib> <mi sib>
    <fa la,> la16\p sib do sib la sib do sib la do
    sib8 sol16 la sib la sol la sib la sol sib

    %61
    la8 fa16\parenthesize \f fa la la do do fa fa la la
    sol sol mi, mi sol sol do do mi mi sol sol
    fa fa re, re sol sol si si re re fa fa\mbreak

    %64
    mi8 do do do do do-+
    re16(do) re(do) re(do) sib(la) sol(la) sib(re)
    do(sib) do(sib) do(sib) la(sol) fa(sol) la(do)

    %67
    sib la sib la sib la sol fa mi fa sol sib
    la8 fa16 fa la la do do mib mib do do
    re8-! do-! sib-! la-! sol-! fa-!\mbreak

    %70
    do4.\fermata mi8 fa4 sol_+
    la4. la8 sib4 do-+
    re4. re8 mi4 fa

    %73
    mi2-+ fa4. fa8
    fa4. sol8 mi4.-+ fa8
    fa1

}

IvlIIn = \relative do'' {

    <fa, la,>4. \tuplet 6/4	 { sol32(la sib do re mi) } fa4 <fa, la,>
    <sol sib,>4. \tuplet 6/4 { la32(sib do re mi fa) } sol4 <sol,do,>
    \appoggiatura sol8 la4 \appoggiatura sol8 fa4 r8 r16 fa' sol8. la16

    %4
    mi,4. \tuplet 8/4 { fa32(sol la sib do re mi fa) } sol8. mi16 fa8. sol16\mbreak
    re,4. \tuplet 8/4 { mi32(fa sol la si do re mi) } fa8. re16 mi8. fa16
    mi8. do16 do,2 do'8. la16

    %7
    re4. \tuplet 7/4 { sib32(do re mi fa sol la)} sib4 re,
    mi-+ r16 do re mi fa4 fa,
    sib la8. sib16 sol8. sol16 do8. sib16

    %10
    la4_+  r16  la sib do re4 fa\mbreak
    si,-+ r16 sol la si do8. mi,16 re8._+ do16
    sol2 re'_+

    %13
    do1 do
    r8 do' do do do do-+
    re4~re16 do sib la sib do re mi

    %16
    \once\stemDown fa8 fa, fa fa fa fa_+
    sol4~sol16 fa mi re do re mi do
    fa2.

    %19
    r8 do'16 re mi re do re mi re do mi
    re8 si16 do re do si do re do si re
    do8 do'-! do-! do-! do-! do~

    %22
    do sib16 la sib8 sib \once\stemUp fa, sib'~
    sib la16 sol la8 la \once\stemUp fa, la'
    sol4 sol2-+

    %25
    \once\stemDown fa8 fa,16 fa la la do do fa fa la la
    \once\stemDown fa8 <fa, do> <fa do> <fa do> <fa do> <fa do>
    <mi do> mi16 mi sol sol do do mi mi sol sol

    %28
    \once\stemDown mi8 <mi, do> <mi do> <mi do> <mi do> <mi do>\mbreak
    <re si> re16 re sol sol si? si re re fa fa
    \once\stemDown re8 <re, si> <re si> <re si> <re si> <re si>

    %31
    <mi do>4. la'16 sol fa mi re do
    si8 do,\p(si) do(si) do(
    si) mib\f-! re-! do-! si-! la-!\mbreak

    %34
    sol do\p(si) do(si) do(
    si) mib\f-! re-! do-! si-! la-!\mbreak
    \once\stemUp sol sol''-! sol-! sol-! sol-! sol~

    %37
    sol fa16 mi fa8 fa \once\stemUp do, fa'~
    fa mi16 re mi8 mi \once\stemUp do, mi'
    re4 re2-+

    %40
    do4 do' do
    sib16 la sol la sib la sol fa mi re do sib'
    la sol fa sol la sol fa mi re do sib la'\mbreak

    %43
    sol fa mi fa sol fa mi re dod sib la sol'
    \once\stemDown fa8 re,16 re fa fa la la re re fa fa
    \once\stemDown mi8 re,\p(dod) re(dod) re(\mbreak

    %46
    dod) fa\f-! mi-! re-! dod-! si-!
    la re\p(dod) re(dod) re(\mbreak
    dod) fa\f-! mi-! re-! dod-! si-!


    %49
    \once\stemUp la la'' la la la la
    si4~si16 dod la si dod re si dod\mbreak
    re8 fa, fa fa fa fa

    %52
    mi4 mi2-+
    re8 re,16 re fad fad la la re re fa fa
    \once\stemDown la8 <fad, do> <fad do> <fad do> <fad do> <fad do>

    %55
    <sol sib,> sol16\p la sib la sol la sib la sol sib
    la8 fad16 sol la sol fad sol la sol fad la\mbreak
    sol8 sib,16 \f sib re re sol sol sib sib re re\mbreak

    %58
    \once\stemDown sol8 <mi, sib> <mi sib> <mi sib> <mi sib> <mi sib>
    <fa la,> fa16\p sol la sol fa sol la sol fa la
    sol8 mi16 fa sol fa mi fa sol fa mi sol

    %61
    fa8 fa16\parenthesize \f  fa la la do do fa fa la la
    sol sol mi, mi sol sol do do mi mi sol sol
    fa fa re, re sol sol si si re re fa fa\mbreak

    %64
    mi4 do la~
    la sol2~
    sol4 fa2~

    %67
    fa4 mi sol
    fa8 fa16 fa la la do do mib mib do do
    re8-! do-! sib-! la-! sol-! fa-!\mbreak

    %70
    do4. \fermata do8 do4 mi_+
    fa4. fa8 fa4 la_+
    sib4. sib8 sib4 la

    %73
    sol2_+ la4. la8
    sol4. sol8 sol4._+ fa8
    fa1

}

Ivlan = \relative do' {

    do2. do4
    re2 do
    do la'

    %4
    sol do~
    do si-+
    do la~\mbreak

    %7
    la sol~
    sol fa
    mi4 fa do do

    %10
    do2 fa4 la
    re,2 do~
    do si_+

    %13
    do4 mi fa sol  do,1\mbreak
    R2.*4
    r8 fa fa fa fa fa

    %19
    do' do, do do do do
    sol' sol, sol sol sol sol
    do mi16 fa sol fa mi fa sol fa mi sol

    %22
    fa2 sol4\mbreak
    do,8 la'16 sib do sib la sib do sib la do
    re4 do sib

    %25
    la2.
    r8 la la la la la
    sol2.

    %28
    r8 sol sol sol sol sol
    fa2.
    r8 fa fa fa fa fa

    %31
    mi4 re2~
    re8 re\p sol re sol re
    sol mib\f-! re-! do-! si-! la-!

    %34
    sol re'\p sol re sol re
    sol mib\f-! re-! do-! si-! la-!
    sol si'16 do re do si do re do si re

    %37
    do2 re4
    sol,8 mi16 fa sol fa mi fa sol fa mi sol
    la4 sol fa

    %40
    mi8 do do do do do
    re4 mi2_+\mbreak
    fa4 re2~

    %43
    re4 dod2_+
    re8 la la la la la
    la mi'\p  la mi la mi

    %46
    la fa\f-! mi-! re-! dod-! si-!
    la mi'\p  la mi la mi
    la fa\f-! mi-! re-! dod-! si-!

    %49
    \once\stemUp la dod'16 re mi re dod re mi re dod mi
    re4 mi2
    la,8 fa16 sol la sol fa sol la sol fa la

    %52
    sib4 la sol
    fad2.
    r8 la la la la la

    %55
    re,2.\p~
    re~
    re

    %58
    r8 sol\f sol sol sol sol
    do,2.\p ~
    do~

    %61
    do
    r8 do\f do do do do
    do4 si2_+

    %64
    do4 do fa\mbreak
    sib,2 sib4
    la2 la4

    %67
    sol do2
    do8 fa fa fa fa fa
    fa fa mi fa do si

    %70
    do4.\fermata sol8 la4 sib
    la4. do8 re4 mib
    re4. do8 do4 do

    %73
    do2 do4. do8
    re2 do4 sib
    la1

}


Ibcn = \relative do {

    fa,2 fa'~
    fa mi
    fa fa,

    %4
    mi mi'
    re sol
    do, fa\mbreak

    %7
    sib sib,~
    sib la
    sol4 fa mi do

    %10
    fa2 fa'
    sol do,
    sol' sol,

    %13
    do4 sib la sol  <do do,>1\mbreak
    R2.*7
    r8 do'-! do-! do-! do-! do-!

    %22
    re4~re16 do sib la sib do re mi
    fa8 fa, fa fa fa fa
    sib4 do do,

    %25
    fa2.
    r8 <<
        {
            fa16 fa la la do do la la fa fa
            do2.

            %28
            r8 do16 do mi mi sol sol mi mi do do
            sol2.
            r8 sol'16 sol si si re re si si sol sol

            %31
            do,4
        }\\{
            fa,8 fa fa fa fa\mbreak
            do'2.
            r8 do, do do do do
            sol'2.
            r8 sol sol sol sol sol
            do4
        }
    >> fa2
    sol2.~
    sol8 mib-!\f re-! do-! si-! la-!\mbreak

    %34
    sol2.~
    sol8 mib'-!\f re-! do-! si-! la-!
    sol sol' sol sol sol sol

    %37
    la4~la16 sol fa mi? fa sol la si
    do8 do, do do do do
    fa4 sol sol,\mbreak

    %40
    do2.
    R
    r8 fa fa fa sib sib,

    %43
    mi mi mi mi la la,
    re re re re fa re
    la'2.~

    %46
    la8 fa\f-! mi-! re-! dod-! si-!\mbreak
    la2.~
    la8 fa'\f-! mi-! re-! dod-! si-!

    %49
    la la' la la la la
    la sol16 fa sol8 sol  la, sol'
    fa re re re re re

    %52
    sol4 la la,
    re2.\mbreak
    << {r8 re16 re fad fad la la fad fad re re}\\{r8 re, re re re re}>>

    %55
    sol2.\p
    re
    sol

    %58
    <<{r8 do16^\f do mi mi sol sol mi mi do do}\\{r8 do, do do do do}>>
    fa2.\p
    do\mbreak

    %61
    fa8 fa' fa fa fa fa
    mi mi mi mi mi  mi
    re re re re re re

    %64
    do2.\tasto~
    do~
    do~

    %67
    do\mbreak
    fa,8 fa' fa fa fa fa
    sib la sol fa mi re

    %70
    do4.\fermata sib'8 la4 sol
    fa mib re do
    sib la sol fa

    %73
    do'2 fa4 fa,\mbreak
    sib2 do4 do,
    fa1

}

Ibfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s1
    <2>2 <5/>
    s1
    <6>2 <6>
    <7>4 s <7 _!>2
    s1
    <9 7>2 <6 5>
    <4\+> <6>
    <6\\> <5/>4 <5/>
    s2 <6 5>
    <7 _!> s
    <4> <7 _!>
    <_>4 <_> <6> <6\\> s1
    s2.*8
    <7>4 <6>8 s <6 5> s
    <5 4>4 <3> s
    <6 5> <4> <7>
    s2.*4
    <_!>2 s4
    s8 <7 _!> s2
    s4 <9 7> <6 5>
    <_!>2.
    s
    <_!>
    s
    <_!>
    <7>4 <6>8 s <6 5>4
    <4> <3> s
    <6 5> <4> <7 _!>
    s2.
    s
    s2 <7>8 s
    <7 5/>4 s <7 _+>
    s2.
    <_+>
    s
    <_+>
    s
    <_+>
    <2!>4 <6 5> <7 _+>
    <6>4 <6> <6>8 s
    <6 5>4 <4> <7 _+>8 s
    <_+>2.
    s8 <7 _+> s2
    s2.
    <7 _+>
    s
    s8 <7> s2
    s2.
    <7>
    s
    <6>
    <7>4 <6!\\> s
    s2.*4
    s2 <7->4
    s8 <6> <6\\>4 <6>8 <6!\\>
    <_>4. <_>8 <6>4 <6\\>
    <_>4. <_>8 <6>4 <6\\ _->
    <_>4 <_> <6\\>2
    <7>1
    <6 5>2 <7>

}

forma = {

    \time 2/2
    \key fa\major
    \tempo 2 = 53
    \override Score.RehearsalMark.extra-offset = #'(+0 . -1)
    \mark\markup\huge "Grave"
    \repeat volta 2 {s1*12}
    \alternative  {{s1}{s}}\break
    \mark\markup\huge "Presto"
    \time 3/4
    \set Score.currentBarNumber = #14
    \tempo 2 = 70
    \bar ".|:"
    s2.*56\break
    \mark\markup\huge "Adagio"
    \time 2/2
    \tempo 2 = 45
    s1*6
    \bar":|."

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
    \senza
}

IIvlIn = \relative do'' {

    do2 sib4-+
    la8 (sol) fa_+(mi) fa4
    sib,8(fa' re'4) do-!

    %4
    sib2-+ la4
    do8(fa) sol-+(fa) sol-+(fa)
    re(fa) sol-+(fa) sol(fa)

    %7
    do(la) sib(sol) la(fa)
    sol(fa) mi(re_+) do4
    do'2 sib4-+

    %10
    la8(sol) fa_+(mi) fa4\mbreak
    sib,8(fa' re'4) do-!
    sib2-+ la4

    %13
    fa8(do' la') fa(mi-+ re)
    mi,(re' sol) mi(re-+ do)
    re(fa) mi(re) do-+ (si)

    %16
    do2.
    do'
    fad,2~\tuplet 3/2 { fad8(sol la) }

    %19
    do,(mib) re(do) sib-+(la)
    sib(fad) sol_+(fad) sol4
    sib'2.\mbreak

    %22
    mi,?2~\tuplet 3/2 { mi8(fa? sol) }
    sib,(re) do(sib) la-+(sol)
    la(mi) fa_+(mi) fa4

    %25
    sib,8(fa' re') sib(la_+ sol)
    la,(sol' do) la(sol_+ fa)
    sol,(fa' sib4) la-!

    %28
    la_+ sol do'-!
    do(si) sib
    la(mi) fa

    %31
    \appoggiatura mi8 \tuplet 3/2 { re do sib } la4 sol_+
    fa2.
    fa4\p do'8(fa,) reb'(fa,)

    %34
    mi (reb' sol2)
    mib,!4 la8(mib) do'(mib,)
    re(do' fa2)

    %37
    reb,!4(sol sib)
    do,(fa lab?)
    si,8(re fa) lab(sol fa)

    %40
    mi2._+
    lab4 mib'8(lab,) fa'(lab,)
    sol(fa' sib2)~\mbreak

    %43
    sib8 lab (sol fa mib reb)
    do2-+ sib4
    mib, mib'8(do) reb(sib)

    %46
    mib,4 reb'8(sib) do(lab)
    \tuplet 3/2 { sib(do reb) } do4 sib-+
    lab2.

    %49
    sol8\f(do) mib(do) lab'(do,)
    mib,4. sol8 sib mib\mbreak
    sib(reb) fa(reb) sib'(reb,)

    %52
    fa,4. lab8 do fa
    reb(do) sib(lab) sol(fa)
    mi2_+ \appoggiatura reb8 do4

    %55
    reb\p(sol sib)
    do,(fa lab)
    sol8(sib) lab(sol) fa_+(mi)

    %58
    fa2.

}

IIvlIIn = \relative do'' {

    la4(sol) mi_+
    fa sib(la)
    r fa fa

    %4
    fa(mi_+) fa-!
    do'2.
    re

    %7
    fa,4 mi fa
    mi8(fa) sol(la) sib(sol)
    la4(sol) mi_+

    %10
    fa sib(la)
    r fa fa
    fa(mi_+) fa

    %13
    r re'2~
    re4 do2~
    do8 la sol fa mi_+ re

    %16
    mi2.
    R
    mib'

    %19
    la,8(do) sib(la) sol_+(fad)
    sol4-! do,(sib)
    R2.

    %22
    reb'
    sol,8(sib) la(sol) fa_+ (mi)
    fa4-! sib,(la)

    %25
    r sol'2~
    sol4 fa2~
    fa4 mi fa

    %28
    fa_+ mi mi'
    fa2 sol4
    do, sib la

    %31
    fa fa mi_+
    fa2.
    lab\p(

    %34
    sol)
    sol(
    fa)

    %37
    sol
    mi4_+ fa2
    re2.(

    %40
    do)
    do(
    sib)

    %43
    sib
    lab2_+ sol4
    sib'(do sol)

    %46
    lab(sol lab)\mbreak
    lab, lab sol_+
    lab2.

    %49
    mib'4\f lab2~
    lab4 sol2
    fa4 sib2~

    %52
    sib4 lab2~
    lab4 reb,8(do) sib(lab)
    sol2.

    %55
    mi'\p
    fa
    sib,8(reb) do(sib) lab_+(sol)

    %58
    lab2.

}

IIvlan = \relative do' {

    do2 do4
    do2.
    r4 r do

    %4
    re do do
    fa2.
    fa

    %7
    do4 do do
    do2.
    do2 do4

    %10
    do2.
    r4 r do\mbreak
    re do do

    %13
    la'2.
    sol
    la,4 sol sol

    %16
    sol2.
    R
    la

    %19
    r4 re re
    re2.
    R

    %22
    sol,\mbreak
    r4 do do
    do2.

    %25
    re
    do
    re4 do do

    %28
    do2 do4
    re8(do) re(fa) mi(sol)
    fa4 do do

    %31
    re do sib
    la2.
    do2\p reb4

    %34
    reb2.
    do
    do

    %37
    sib
    sib4 lab2
    lab2.

    %40
    sol
    mib'2 reb4\mbreak
    reb2.

    %43
    reb4 sib mib
    mib2 mib4
    mib2.~

    %46
    mib
    fa4 mib  reb
    do2.

    %49
    R
    sib4\f mib2~\mbreak
    mib4 reb2

    %52
    do4 fa2~
    fa sol4
    sol2.

    %55
    sol,\p
    lab2 do4
    reb do do

    %58
    do2.

}


IIbcn = \relative do {

    fa4 mi do
    fa sol la
    sib, sib' la

    %4
    sol do, fa
    la2.
    sib

    %7
    la4 sol fa
    do8(re) mi(fa) sol(mi)\mbreak
    fa4 mi do

    %10
    fa sol la
    sib, sib' la
    sol do, fa

    %13
    fa, fa'2
    mi,4 mi'2
    fa4 sol sol,

    %16
    do2.
    R
    do'

    %19
    fad,2 re4
    sol la sib
    R2.

    %22
    sib
    mi,2 do4
    fa sol la

    %25
    sib, sib'2\mbreak
    la,4 la'2
    sol4 do, fa

    %28
    do' do, do
    do2 do4
    fa sol la

    %31
    sib do do,
    fa2.\mbreak
    fa\p

    %34
    mi
    mib!
    re

    %37
    reb!
    do
    si

    %40
    do
    lab'
    sol2 fa4\mbreak

    %43
    mib2.
    lab4 lab, mib'
    sol,8(mib') lab, (mib') sib(mib)

    %46
    do(mib) sib(mib) lab,(lab')
    reb,4 mib mib,
    lab do8(lab) mib'(do)

    %49
    lab'4\f lab,2
    mib'4 mib,2\mbreak
    sib''4 sib,2

    %52
    fa'4 fa,2
    sib2.
    do4. do8-! mi-! sol-!

    %55
    sib,2.\p
    lab
    sib4 do do,

    %58
    fa2.

}

IIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s4 <5/> s
    s <6\\> <6>8 s
    <6 _ 5>4 <_> <6>
    <7>8 s <7>2
    <6> s4
    <6 5>2 s4
    <6> <6\\> s
    <7>2 <7>4
    s <5/> <5/>
    s <6\\> <6>8 s
    <6 _ 5>4 <_> <6>
    <7>8 s <7>2
    s4 <6>2
    <7>4 <6> s
    <6 5> <4> <7 _!>
    s2.*2
    <4\+ _->2.
    <5/>2 <5/>4
    s <6\\+> <6>
    s2.
    <4\+ _-> <5/>
    s4 <6\\> <6>
    s <6>2
    <7>4 <6>2
    <7>8 s <7>2
    <6 4>4 <3> s
    <7\+> s <7->
    s <6\\> <6>8 s
    <6 5>4 <4> <7>
    s2.
    s2 <6>4
    <7 5/>2.
    <6>
    <7 5/>
    <6>
    <7 _!>4 <6 _ 4> <_>
    <7/>2.
    <_!>
    s
    <7 _ 5/> 2 <_>4
    <7>2.
    s2 <7>4
    <7> s <6\\>
    <6> <6\\> s
    <6 5> <4> <7>
    s2.*2
    <5 4>4 <3>2
    <5 4>4 <3>2
    <5 4>4 <3>2
    <9 7>2 <6 5>4
    <_!>2.
    <4\+ _->
    <6>2 s4
    <6 5> <4> <7 _!>

}

forma = {

    \time 3/4
    \key fa\major
    \tempo 2 = 83
    s2.*16
    \bar ":..:"
    s2.*16
    \bar ":..:"\break
    \once\override Score.RehearsalMark.extra-offset = #'(+5 . +1.0)
    \mark\markup\huge "Minuetto 2.d"
    \key fa\minor
    s2.*8
    \bar":..:"
    s2.*18
    \bar":|."
    \mark\markup\smaller\center-column {"D.C."\vspace #+0.2"[al I.mo]"}

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
    \senza
}

IIIvlIn = \relative do'' {

    fa,8 do'-! do-! re8.-+ mi32 fa
    do4. fa,8
    sol8. sib16 la(sol) fa_+(mi)

    %4
    fa16. fa'32 mi16.(fa32) mi16.(fa32) mi16.(fa32)
    sol,8.la32 sib la16(sol) fa_+(mi)
    \grace mi8 fa2

    %7
    \tuplet 3/2 {
        \once\stemDown la'16 fa, fa fa[fa fa] fa fa fa \once\stemUp fa[fa' la]
        \once\stemDown sol mi, mi mi[mi mi] mi mi mi \once\stemUp mi [mi' sol]\mbreak
        \once\stemDown fa re, re re[re re] re re re \once\stemUp re[re' fa]

        %10
        \once\stemDown mi do, do do[do do]
    } do8 \once\stemDown sol''-+
    \tuplet 3/2 { la16 sol fa fa-+[mi re] re-+ do si si_+[la sol]}
    sol4 fad'\p(

    %13
    sol16.) sol,32\f si16. re32 fa!8.-+ mi32 re
    mi4 si\p(
    do8) la-!\f sol16. fa32 mi16._+ re32

    %16
    do4. do8
    mi8-! mi-! sol8. sol32 la
    sib8-! sib-! fa8. fa32 sol

    %19
    \tuplet 3/2 {
        la16 fa' fa fa-+[mi fa] fa, la do mib[re do]
        re sol sol sol-+[fa sol] sol ,si re fa-+[mi? re]
        mi la la la-+[sol la] la, dod mi sol-+[fa mi]
    }

    %22
    fa16. re32 re,8\noBeam r16. la''32 sib16. re,32\mbreak
    mi16.-+ re32 mi8 r16. sol32 la16. do,32
    re16.-+ do32 re8 r16. fa32 sol16. mi32

    %25
    dod8-+ la sol'8.-+ fa32 mi
    la16. re32 re,16. sol32 fa8(mi-+)
    re4. re8

    %28
    \tuplet 3/2 {
        sol,16 sol sol sol[sol sol] sol si re fa-+[mi re]
        \once\stemDown mi do, do do[do do]
    } do8 do'\mbreak
    \tuplet 3/2 {
        fa,16 fa fa fa[fa fa] fa la do mib-+[re do]

        %31
        \once\stemDown re sib, sib sib[sib sib] sib sib sib \once \stemUp sib[sib' re]
        \once \stemDown do la, la la[la la] la la la \once \stemUp la[la' do]
        \once \stemDown sib sol, sol sol[sol sol] sol sol sol \once \stemUp sol[sol' sib]

        %34
        la fa fa fa[fa fa]
    } fa8 do'_+\mbreak
    \tuplet 3/2 { re16 do sib sib_+ [la sol] sol_+ fa mi mi_+ [re do] }
    do4 si'\p(

    %37
    do16.) do,32\f mi16. sol32 sib!8._+ la32 sol
    la4 mi\p(
    fa8) re'\f do16. sib32 la16._+ sol32

    %40
    fa4.

}

IIIvlIIn = \relative do'' {

    fa,8 do'-! do-! re8.-+ mi32 fa
    do4. fa,8
    sol8. sib16 la(sol) fa_+(mi)

    %4
    fa16. fa'32 mi16.(fa32) mi16.(fa32) mi16.(fa32)
    sol,8.la32 sib la16(sol) fa_+(mi)
    \grace mi8 fa2

    %7
    \tuplet 3/2 {
        \once\stemDown la'16 fa, fa fa[fa fa] fa fa fa \once\stemUp fa[fa' la]
        \once\stemDown sol mi, mi mi[mi mi] mi mi mi \once\stemUp mi [mi' sol]\mbreak
        \once\stemDown fa re, re re[re re] re re re \once\stemUp re[re' fa]

        %10
        \once\stemDown mi do, do do[do do]
    } do8 \once\stemDown sol''-+
    \tuplet 3/2 { la16 sol fa fa-+[mi re] re-+ do si si_+[la sol]}
    sol4 do\p(

    %13
    si16.) sol32\f si16. re32 fa8.-+ mi32 re
    mi4 fa,\p(
    mi8) la-!\f sol16. fa32 mi16. -+ re32

    %16
    do4. do8
    mi8-! mi-! sol8. sol32 la
    sib8-! sib-! fa8. fa32 sol

    %19
    \tuplet 3/2 {
        la16 fa' fa fa-+[mi fa] fa, la do mib[re do]
        re sol sol sol-+[fa sol] sol ,si re fa-+[mi? re]
        mi la la la-+[sol la] la, dod mi sol-+[fa mi]
    }

    %22
    fa16. re32 re,8\noBeam r16. la''32 sib16. re,32\mbreak
    mi16.-+ re32 mi8 r16. sol32 la16. do,32
    re16.-+ do32 re8 r16. fa32 sol16. mi32

    %25
    dod8-+ la sol'8.-+ fa32 mi
    la16. re32 re,16. sol32 fa8(mi-+)
    re4. re8

    %28
    \tuplet 3/2 {
        sol,16 sol sol sol[sol sol] sol si re fa-+[mi re]
        \once\stemDown mi do, do do[do do]
    } do8 do'\mbreak
    \tuplet 3/2 {
        fa,16 fa fa fa[fa fa] fa la do mib-+[re do]

        %31
        \once\stemDown re sib, sib sib[sib sib] sib sib sib \once \stemUp sib[sib' re]
        \once \stemDown do la, la la[la la] la la la \once \stemUp la[la' do]
        \once \stemDown sib sol, sol sol[sol sol] sol sol sol \once \stemUp sol[sol' sib]

        %34
        la fa fa fa[fa fa]
    } fa8 do'_+\mbreak
    \tuplet 3/2 { re16 do sib sib_+ [la sol] sol_+ fa mi mi_+ [re do] }
    do4 fa\p(

    %37
    mi16.) do32\f mi16. sol32 sib8._+ la32 sol
    la4 sib,\p(
    la8) \once\stemDown re'\f do16. sib32 la16._+ sol32

    %40
    fa4.

}

IIIvlan = \relative do' {

    r8
    r la' sol4_+
    la do,
    re do16. sib32 la16._+ sol32

    %4
    la4 do
    re do16. sib32 la16._+ sol32
    la2

    %7
    do8[do do do]
    do[do do do]\mbreak
    do[do si si]

    %10
    do[mi sol mi]
    do4 la'8 fa
    re4 re

    %13
    re si
    sol sol
    sol8 do4 si8_+

    %16
    do4. r8\mbreak
    r mi mi4
    re8 re re4

    %19
    do fa~
    fa8 re sol4~
    sol8 mi la4~

    %22
    la fa(
    sol) mi(
    fa) re(

    %25
    mi) mi
    fa8 re'4 dod8-+\mbreak
    re4 r

    %28
    r8 re,[re re]
    sol,4 r
    r8 do[do do]

    %31
    fa4 fa8 fa
    fa[fa fa fa]
    fa[fa mi mi]

    %34
    fa [la, do la]\mbreak
    fa'4 re8 sib
    sol4 sol

    %37
    sol mi'_+
    do do
    do8 fa4 mi8_+

    %40
    fa4.

}


IIIbcn = \relative do {

    r8
    r fa [sib sib,]
    fa'4 la,
    sib do

    %4
    re la
    sib do
    fa16. (fa'32) mi16.(fa32) mi16.(fa32) mi16.(fa32)

    %7
    fa,8 [fa fa fa]
    mi [mi mi mi]\mbreak
    re [re re re]

    %10
    do [do mi do]
    fa4. re8
    sol4 la

    %13
    si sol
    do, re
    mi8 [fa sol sol,]

    %16
    do4. r8
    r4 do'\mbreak
    sol sib

    %19
    fa la,
    sib si
    do dod

    %22
    re re'~
    re do?~
    do sib

    %25
    la dod,
    re8 [sib' la la,]
    re re, re4\mbreak

    %28
    r8 sol' [si, sol]
    do4 r
    r8 fa [la, fa]

    %31
    sib [sib' sib sib]
    la[ la la la]
    sol [sol sol sol]

    %34
    fa [fa la fa]
    sib,4. sol8\mbreak
    do4 re

    %37
    mi do
    fa sol
    la8 [sib do do,]

    %40
    fa,4.

}

IIIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s8
    s s <6 _ 5> <_>
    s4 <6>8 s
    <6 5>4 <7>
    <5> <6>8 s
    <6 5>4 <7>
    s2
    s
    <6>
    <7>4 <6!\\>
    s2
    <9 7>4 <6 _ 5>8 <_>
    <_!>4 <6\\+>
    <5/> <5/>
    s <6!\\>
    <6>16 s <6 5>8 <4> <7 _!>
    s2
    s4 <6 5>
    s <6 5>
    s <5/>
    <9>8 <8> <5/>4
    <9>8 <8> <5/>4
    s <6 5>
    <2> <6 5>
    <2> <6\\>
    <_+> <5/>
    s8 <6\\> <4> <7 _+>
    s2
    s8 <7 _!> <5/> s
    <9> <8> s4
    s8 <7 _ _->4 <_>8
    <9> <8> s4
    <6>2
    <7>4 <6\\>
    s2
    <9 7>4 <6 _ 5>8 <_>
    s4 <6!\\>
    <5/> <5/>
    s <6\\>
    <6>16 s <6 5>8 <4> <7>

}

forma = {

    \time 2/4
    \key fa\major
    \tempo 2 = 42
    \partial 8 s8
    s2*15
    s4. \bar ":..:" \break s8
    s2*23
    s4.
    \bar":|."

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
    \senza
}

IVvlIn = \relative do'' {

    fa,8-! fa-! la-! do-!
    fa,-! sib-! re-! sol,-! sib-! mi-!
    fa,4 fa8-! fa-! la-! do-!
    fa,-! sib-! re-! sol,-! sib-! mi-!

    %4
    fa,4 fa'8 fa(mi) mib-!
    mib(re) sol-! sol(fad) fa-!
    fa(mi) do'-! do(si) sib-!\mbreak

    %7
    la-+ sol fa sol-+ fa mi
    fa4\fermata fa,8\f-! fa-! la-! do-!
    fa4 la8\p la8.-+ sol16 la8

    %10
    sol4 do,,8\f-! do-! mi-! sol-!
    do4 sol'8\p sol8.-+ fa16 sol8
    fa4 sol,,8\f sol si re

    %13
    sol4 fa'8\p fa8.-+ mi16 fa8\mbreak
    mi4 sol8\f la-! dod,(re)
    sol-! si,(do) fa16(mi) re(do) si(la)

    %16
    sol4 re8\p mib(re mib)
    re4. fad\f(
    sol4) re8 mib\p(re mib)

    %19
    re4. fad\f(
    sol4) si8-! si(re) fa,?
    fa(mi?) do'-! do(mi) sol,-!\mbreak

    %22
    sol(fa) re'-! re(fa) mi-!
    la16(sol) fa(mi) re(do) sol8 do si_+
    do4 la'8-! la(fa) re-!

    %25
    re(dod-+) sib-! sib(la_+) sol-!
    fa(mi re) sib''4.\p(
    la) sold(

    %28
    la) sib,\f(\mbreak
    la) sold_+(
    la4) la'8 la4 sol8

    %31
    fad la re, do4.-+
    si8 sol sol' sol4 fa8
    mi sol do, sib4.-+

    %34
    la8 fa fa' fa4 mi8
    re fa do si re la
    sold si mi, la do mi,\mbreak

    %37
    sold si mi, fad la red,
    sold si mi, la do mi,
    sold si? mi , fad la red,

    %40
    mi4. si''\p(
    sold) re\f(
    do8) la-! mi-! la'4.\p(

    %43
    mi) do\f(\mbreak
    si8) sold-! mi-! si''?4.\p(
    sold) re\f(

    %46
    do4) fa8-! mi4 re8
    do si la si4.-+
    la4 fa8-! fa(lab do)

    %49
    fa4. lab(
    sol4) mi,8-! mi(sol do)
    sol'4. sib(

    %52
    lab4) fa,8-! fa(lab do)
    fa4 lab8 sol4-+ fa8
    mi4-+ reb8-! reb(do-+) si-!

    %55
    si?(do) reb-! reb(do-+) si!-!
    \appoggiatura si?8 do2.\fermata
    r4 lab,8\f-! lab-! do-! mib-!

    %58
    lab-! do-! mib-! lab4.(
    sol4) sol,,8-! sol-! sib-! mib-!
    sol-! sib-! reb-! sib'4.(

    %61
    lab4) mib8-! mib(fa) reb-!
    reb(mib) do-! do(reb) sib-!
    sib(do) mib-! mib(fa) reb-!

    %64
    reb(mib) do-! do(reb) sib-!\mbreak
    do4 lab'8\p lab(fa re)
    mib,4 lab'8-! lab(fa re)

    %67
    mib,4. reb'!4.\f-+
    do8-+ sib lab sib-+ lab sol
    lab4 mib8 reb'4.-+

    %70
    do8-+ sib lab sib4.-+
    lab4 lab8-!  lab(do mib)
    lab4. do,(

    %73
    sib4-!) sib8-! sib(reb fa)
    sib4. reb,(
    do4) do8 sib4-+ lab8

    %76
    sol4_+ lab8 sol4_+ fa8
    mi4_+ do'8\f re4 mi8-+
    fa4 sol8-+ lab4 si8-+

    %79
    do4 reb8-! reb(do)-+ si-!\mbreak
    si\p(do) reb-!  reb(do-+) si-!
    do2.\f

    %82
    si8-!(la sol) sib4.
    la8-+(sol fa) lab4.
    sol fa

    %85
    mi4-+\fermata

}

IVvlIIn = \relative do'' {

    fa,8-! fa-! la-! do-!
    fa,-! sib-! re-! sol,-! sib-! mi-!
    fa,4 fa8-! fa-! la-! do-!
    fa,-! sib-! re-! sol,-! sib-! mi-!

    %4
    fa,4 fa'8 fa(mi) mib-!
    mib(re) sol-! sol(fad) fa-!
    fa(mi) do'-! do(si) sib-!\mbreak

    %7
    la-+ sol fa sol-+ fa mi
    fa4\fermata fa,8\f-! fa-! la-! do-!
    fa4 fa8\p fa8.-+ mi16 fa8

    %10
    mi4 do,8\f-! do-! mi-! sol-!
    do4 mi8\p mi8.-+ re16 mi8
    re4 sol,,8\f sol si re

    %13
    sol4 re'8\p re8.-+ do16 re8\mbreak
    do4 sol'8\f la-! dod,(re)
    sol-! si,(do) fa16(mi) re(do) si(la)

    %16
    sol4 si,8\p-! do(si do)
    si4. do\f(
    si4) si8 do\p(si do)

    %19
    si4. do\f(
    si4) si'8-! si(re) fa,
    fa(mi) do'-! do(mi) sol,-!\mbreak

    %22
    sol(fa) re'-! re(fa) mi-!
    la16(sol) fa(mi) re(do) sol8 do si_+
    do4 la'8-! la(fa) re-!

    %25
    re(dod-+) sib-! sib(la_+) sol-!
    fa(mi re) fa'4.\p(
    mi) re(

    %28
    dod) sib\f(\mbreak
    la) sold_+(
    la4) la'8 la4 sol8

    %31
    fad la re, do4.-+
    si8 sol sol' sol4 fa8
    mi sol do, sib4.-+

    %34
    la8 fa fa' fa4 mi8
    re fa do si re la
    sold si mi, la do mi,\mbreak

    %37
    sold si mi, fad la red,
    sold si mi, la do mi,
    sold si? mi , fad la red,

    %40
    mi4. re'\p(
    si) sold\f(
    la) mi'\p(

    %43
    do) la\f(
    sold) re'\p(
    si) sold\f (

    %46
    la4) fa'8-! mi4 re8
    do si la si4.-+
    la4 fa8-! fa(lab do)

    %49
    fa4. do(
    sib4) mi,8-! mi(sol do)
    mi4. sol(

    %52
    fa4) fa,8-! fa(lab do)
    fa4 lab8 sol4-+ fa8
    mi4-+ lab,8-! lab(sol_+) fa-!

    %55
    fa(sol) lab-! lab(sol_+) fa-!
    mi2._+\fermata
    r4 lab,8\f-! lab-! do-! mib-!

    %58
    lab-! do-! mib-! do4.(
    sib4) sol,8-! sol-! sib-! mib-!
    sol-! sib-! reb-! reb4.(

    %61
    do4) mib8-! mib(fa) reb-!
    reb(mib) do-! do(reb) sib-!
    sib(do) mib-! mib(fa) reb-!

    %64
    reb(mib) do-! do(reb) sib-!\mbreak
    do4 lab'8\p lab(fa re)
    mib,4 lab'8-! lab(fa re)

    %67
    mib,4. reb'!4.\f-+
    do8-+ sib lab sib-+ lab sol
    lab4 mib8 reb'4.-+

    %70
    do8-+ sib lab sib4.-+
    lab4 lab8-!  lab(do mib)
    lab4. lab,(

    %73
    sol4-!) sib8-! sib(reb fa)
    sib4. sib,(
    lab4) do8 sib4-+ lab8

    %76
    sol4_+ lab8 sol4_+ fa8
    mi4_+ do'8\f re4 mi8-+
    fa4 sol8-+ lab4 si8-+

    %79
    do4 lab,8-! lab(sol_+) fa_!
    fa\p(sol) lab-! lab(sol_+) fa-!
    mi4. mi'?\f(

    %82
    fa sol)
    do,2.
    re

    %85
    sol,4\fermata

}

IVvlan = \relative do' {

    do8 do4 do8
    re4. do8 sol sib
    la4 do8 do4 do8
    re4. do8 sol sib
    la4 la'8 sib4 do8
    fa,4 si8 do4 re8
    sol,4 mi8 fa4 sol8
    do, sib la sib la sol
    la4\fermata fa'8-! fa-! la-! do-!
    fa4. fa,\p
    do'4 do,8-!\f do-! mi-! sol-!
    do4. do,\p
    sol'4 sol,8-!\f sol-! si-! re-!
    sol4. sol,\p
    do\f do
    do4 sol'8 la16(sol) fa(mi) re(do)\mbreak
    si4.\p do
    sol re'\f~
    re do\p
    sol re'\f\parenthesize ~
    re r4 re8-!
    re(do) r r4 mi8-!
    mi(re) r r4 sol8
    do,4 fa8 mi4_+ re8 do4 r8 r4 fa8
    sol4. mi
    la, re\p(
    dod) sib!
    la fa'\f(
    mi) re(
    dod4) dod8 dod mi dod
    la4. fad'(
    sol4) si,8 si re si\mbreak
    sol4. mi'
    fa la~
    la fa
    mi8-! sold-! si-! do,4(la'8)
    si,4(sold'8) la,4 (fad'8)
    mi sold si do,4(la'8)
    si,4(sold'8) la,4 fa'8\mbreak
    mi4 mi8 mi\p sold si
    re4. si,\f
    la4 la8 la\p do mi
    la4. mi\f~
    mi4 mi8 mi\p sold si
    re4. si,\f
    la4 la'8 la4 sold8
    la4. sold_+

    %48 OOKK
    la4 r8 r4 r8
    r4 r8 do,4.
    do r4 r8
    r4 r8 do4.
    do r4 r8
    r4 do8 reb4 sib'8
    sol4 fa8 fa(mi_+) re-!
    re(mi) fa-! fa(mi_+) re-!\mbreak
    do2.\fermata
    R
    r4 r8 mib4.
    mib r4 r8
    r4 r8 sol4.(
    lab) lab~
    lab sol_+
    lab lab~
    lab sol_+\mbreak
    lab lab,\p(
    sol) lab(
    sol) sol'\f
    lab4 mib8 reb4 reb8
    do4. sol'
    lab4 mib8 reb4 reb8
    do4. r4 r8
    r4 r8 mib4.\mbreak
    mib r4 r8
    r4 r8 fa4.
    fa4 fa8 mi4 fa8
    do4 do8 do4 si8_+
    do4 do'8\f do4 si?8
    lab4 sol8 fa4.
    mi4_+ fa8 fa(mi_+) reb-!\mbreak
    re\p(mi) fa-! fa(mi_+) re-!
    do4. do\f
    re mi
    fa fa
    si,2.
    do4\fermata

}


IVbcn = \relative do {

    fa8 fa4.
    fa fa
    fa4 fa,8 fa4.
    fa fa

    %4
    fa4 fa'8 sol4 la8
    sib4 sol8 la4 si8
    do4 do,8 re4 mi8

    %7
    fa4 fa,8 do'4 do,8
    fa4\fermata fa'8-! fa-! la-! do-!
    fa4. r4 r8

    %10
    r4 do,8-!\f do-! mi-! sol-!
    do4. r4 r8
    r4 sol,8 sol si re

    %13
    sol4. r4 r8
    r4 r8 fa4.
    mi fa

    %16
    sol2.\p ~\mbreak
    sol4. lab,\f(
    sol) sol'\p~

    %19
    sol lab,\f(
    sol) sol'
    do do,

    %22
    re si4 do8
    fa4 la8 sol4 sol,8
    do4 r8 r4 re8

    %25
    mi4. dod
    re r4 r8
    R2.

    %28
    r4 r8 re4.\f(
    dod) sib!(
    la) r4 r8

    %31
    r4 re8 re fad re\mbreak
    sol,4. r4 r8
    r4 do8 do mi do

    %34
    fa,4. re'4 mi8
    fa4. re
    mi2.~

    %37
    mi
    mi4. mi,
    mi2.~

    %40
    mi\mbreak
    r4 mi'8\f mi sold mi
    la,4. r4 r8

    %43
    r4 la'8 la do la
    mi4. r4 r8
    r4 mi8 mi sold mi

    %46
    la,4 re'8 do4 si8
    la4 la,8 mi'4 mi,8
    la4 r8 r4 r8

    %49
    r4 fa'8 fa lab fa
    do4. r4 r8
    r4 do8 do mi do

    %52
    fa4. r4 r8
    r4 fa8 sib,4 reb8
    do4. r4 r8

    %55
    do4. r4 r8\mbreak
    do4.\fermata r4 \tuplet 3/2 { reb16 do sib }
    lab4. r4 r8

    %58
    r4 lab'8 lab do lab
    mib4. r4 r8
    r4 mib8 mib sol mib

    %61
    lab,4 do8 reb4 (sib'8)
    do,4(lab'8) sib,4(sol'8)\mbreak
    lab,4(do8) reb4(sib'8)

    %64
    do,4(lab'8) sib,4(sol'8)
    lab,4. fa'\p(
    mib) fa(

    %67
    mib) sib'8\f(sol mib)
    lab4 do,8 reb4 mib8
    fa sol lab sib sol mib\mbreak

    %70
    lab4 do,8 reb4 mib8
    lab,4. r4 r8
    r4 lab'8 lab do lab

    %73
    mib4. r4 r8
    r4 sib'8 sib reb sib
    fa4 fa8 do'4 fa,8

    %76
    mi4 fa8 mi4 re8\mbreak
    do4. r4 r8
    R2.

    %79
    do4. r4 r8
    do4.\p r4 r8
    do2.\f^\tasto~

    %82
    do~
    do~
    do~

    %85
    do4\fermata

}

IVbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s8 s4.
    <6 4 2> <7\+>
    <3>2.
    <6 4 2>4. <7\+>
    <3> <7>8 <6\\> <5/>
    <5/>4 <3>8 <7> <6+\\> <5/>
    <5/>4 <3>8 <7> <6!\\> <5/>
    s4. <4>4 <7>8
    s2.*4
    s4 <7 _ _!>8 <_>4 <_>8
    s2.
    s4 s8 <6 5>4 s8
    <6>4 s8 <6 5>4.
    <_!> <6- 4>
    <_!> <6+\\>
    <_!> <6- 4>
    <_!> <6+\\>
    <_!> <7_!>
    <9 4>8 <3>8 s s4.
    <9 4>4 <7>8 <5/>4.
    <6 _ 5>4 <_>8 <4>4 <7_!>8
    s2.
    <7 5/>8 <6+\\>8 s <5/>4.
    s2.*2
    s4 s8 <6 5>4 s8
    <6>4. <6+\\>
    <_+> s
    s4 <7 _ _+>8 <_>4 <_>8
    <_!>2.
    s4 <7>8 s4.
    s s4 <6+\\>8
    <6>4. <6! 5>
    <_+> <6 4>
    <_+> <7\+>
    <_+> <6 4>
    <_+> <7\+>
    <_+>2.
    s4 <7 _ _+>8 <_>4 <_>8
    s2.
    s
    <_+>
    s4 <7 _ _+>8 <_>4 <_>8
    s4 <6! 5>8 <6>4 <6+\\>8
    s4. <4>4 <7 _+>8
    s2.
    s
    <_!>
    s4 <7 _ _+>8 <_>4 <_>8
    s2.
    s4. <6 _ 5>4 <_>8
    <_!>2 s4
    <_!>2 s4
    <_!>2.
    <5>
    s
    s
    s4 <7>8 s4.
    s  <6 5>4 s8
    <6>4. <6\\>
    s <6 5>4 s8
    <6>4. <6\\>
    s <6!\\>
    <3> <6!\\>
    <3>4 s8 <6\\>4.
    s <6 5>4 <7>8
    <5>4 <5>8 <6\\>4 <6\\>8
    s4. <6 5>4 <7>8
    s2.*4
    s4. <7 _!>
    <6>4 s8 <6>4 <6!\\>8
    <_!>2.
    s
    <_!>2 s4
    <_!>2.

}

forma = {

    \time 6/8
    \key fa\major
    \tempo 2. = 50
    \partial 2 s8^\markup\smaller {\musicglyph "scripts.segno"} s4.
    s2.*7
    s4
    \bar ":..:"
    \mark\markup\huge "Fine"
    s8 s4.
    s2.*15
    s4^\markup\smaller {\musicglyph "scripts.segno"}
    \bar ":..:"\break
    s8 s4.
    s2.*23
    s4^\markup\smaller {\musicglyph "scripts.segno"}
    \bar ":..:"\break
    \once\override Score.RehearsalMark.extra-offset = #'(+5 . +1.0)
    \mark\markup\huge "[Mineur]"
    \key fa\minor
    \partial 2 s8 s4.
    s2.*36
    s4
    \bar":|."
    \mark\markup\smaller\center-column {"Da""Capo"}

}



IVvlI = {
    \global
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}


IVvla = {
    \global
    \clef alto
    <<\IVvlan \forma>>

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

    do4
    fa-! fa~fa8 la sol mi
    fa4-! fa~fa8 la sol mi
    fa4 mi8-+ re do4 sib

    %4
    la8_+ sol fa2 sol4
    la8 do si re do4 sol
    la8 do si re do4 sol

    %7
    la8 si do fa, mi do' re, si'
    do,2.  do'4 do,2. sol'4
    do-! do~do8 mi re si

    %10
    do4-! do~do8 mi re si
    do4 si8_+ la sol4 fa
    mi8_+ re do2 r4

    %13
    do'8(re mi re) mi(fa sol fa)
    sol(la sib la) sib(la) sib4-!
    sib,8(do re do) re(mi fa mi)

    %16
    fa(sol la sol) la(sol) la4-!\mbreak
    do,,4.(sol'8) sib(la) do(si)
    do,4.(sol'8) sib?(la) do(si)

    %19
    do,4_! sib'-! la8(fa) sol(mi)
    fa1
    do4.\p(sol'8) sib(la) do(si)

    %22
    do,4.(sol'8) sib?(la) do(si)
    do,4 sib' la8 fa sol mi
    fa2. sol4 fa2. lab8 sib

    %25
    do4-! do~do8 lab sib sol
    lab4-! lab~lab8 fa sol mi
    fa4 reb' do8 sib lab sol

    %28
    fa_+ (mi) fa2 fa'4\p
    sol8(mi) fa(lab) sol(mi) fa(lab)
    sol(mi) fa4-! do2~\f

    %31
    do4 reb8 do sib lab sol fa
    mi2. do'8(reb)
    mib4-! mib~mib8 do reb sib

    %34
    do4 do~do8 lab sib sol
    lab4 fa' mib8 reb do sib
    lab_+(sol) lab2 do4

    %37
    lab'-! lab~lab8 sol fa mib
    re-+ do re2 sol8 lab
    sib(lab) sib(lab) sib(sol) lab(fa)

    %40
    mi4 do, r do'-!\mbreak
    do8\p(reb) do(si) do(si) do(si)
    do(sol') fa-+(mi) fa(mi) fa(mi)

    %43
    fa4 reb\f do8(sib) lab(sol)
    fa_+(mi) fa2 do'4-!
    do8\p(reb) do(si) do(si) do(si)

    %46
    do(sol')  fa-+(mi)  fa(mi) fa(mi)
    fa4 reb\f do8 sib lab sol
    fa2.

}

VvlIIn = \relative do'' {

    do4
    fa-! fa~fa8 la sol mi
    fa4-! fa~fa8 la sol mi
    fa4 mi8-+ re do4 sib

    %4
    la8_+ sol fa2 sol4
    la8 do si re do4 sol
    la8 do si re do4 sol

    %7
    la8 si do fa, mi do' re, si'
    do,2.  do'4 do,2. sol'4
    do-! do~do8 mi re si

    %10
    do4-! do~do8 mi re si
    do4 si8_+ la sol4 fa
    mi8_+ re do2 r4

    %13
    do'8(re mi re) mi(fa sol fa)
    sol(la sib la) sib(la) sib4-!
    sib,8(do re do) re(mi fa mi)

    %16
    fa(sol la sol) la(sol) la4-!\mbreak
    do,,4.(sol'8) sib(la) do(si)
    do,4.(sol'8) sib?(la) do(si)

    %19
    do,4_! sib'-! la8(fa) sol(mi)
    fa1
    do4.\p(sol'8) sib(la) do(si)

    %22
    do,4.(sol'8) sib?(la) do(si)
    do,4 sib' la8 fa sol mi
    fa2. sol4 fa2.  fa8 sol

    %25
    lab4-! lab ~lab8 fa sol mi
    fa4 fa2 sib,4
    lab fa'2 mi4_+

    %28
    fa do lab do'\p
    reb(do) reb(do)
    sib-+ lab r do\f

    %31
    reb8 do sib lab sol fa mi re
    do2. lab'8 (sib)
    do4-! do~do8 lab sib sol

    %34
    lab4 lab2 reb,4
    do lab'2 sol4_+
    lab mib do lab

    %37
    r do' do, do'~
    do sib sib, sib'8 do
    mi,4 fa sol lab\mbreak

    %40
    sol8 fa mi_+ re do2
    r4 lab'\p(sol_+ fa)
    sol-! reb'(do-+ sib)

    %43
    lab fa2\f mi4_+
    fa2 r
    r4 lab\p(sol_+ fa)

    %46
    sol-! reb'(do-+ sib)
    lab fa2\f mi4_+
    fa2.

}

Vvlan = \relative do' {

    r4
    la' do2 sib4
    la do2 do,4~
    do fa2 mi4_+

    %4
    fa2. do4
    do fa sol mi
    do fa sol mi

    %7
    do sol'8 la sol4 fa
    mi2. r4 mi2. r4
    mi sol2 fa4

    %10
    mi sol2 sol,4
    sol do2 si4_+
    do2 r

    %13
    r4 do' sol la
    sib8(do) re(do) re(do) re4
    r sib fa sol

    %16
    la8(sib) do(sib) do(sib) do4\mbreak
    mi, sol fa re
    mi sol fa re

    %19
    mi sol do,8 la sib sol
    la1
    mi'4 sol\p fa re

    %22
    mi sol fa re
    mi sol do,8 la sib sol
    la2. r4 la2. r4

    %25
    fa'2 r
    fa r
    r4 sol,2 sib4

    %28
    lab2. lab'4\p
    sib-+ lab sib-+ lab8. fa16
    do4 fa r2

    %31
    r reb4\f sib
    sol2. r4
    lab2 r

    %34
    lab r
    r4 sib2 reb4
    do2 r

    %37
    r r4 fa
    fa2 r
    r4 do do do

    %40
    do2 r
    r4 fa\p(mi_+ re)\mbreak
    mi_! sib'(lab sol)

    %43
    fa sol,\f lab sib
    lab2 r
    r4 fa'\p(mi_+ re)\mbreak

    %46
    mi_! sib'(lab sol)
    fa sol,\f lab sib
    lab2.

}


Vbcn = \relative do {

    r4
    fa,2. do'4
    fa2. sib4
    la sib-+ do do,

    %4
    fa sol la mi
    fa re' mi, do'
    fa, re' mi, do'

    %7
    fa, mi8 fa sol4 sol,
    do2. r4 do2. r4
    do2. sol'4

    %10
    do2. fa,4
    mi fa sol sol,
    do re mi do

    %13
    r do' do do,
    sol'2 sol,
    r4 sib' sib  sib,

    %16
    fa'2 fa,
    do' r
    do r

    %19
    r4 do' do do,
    fa fa la fa
    do2 r

    %22
    do r
    r4 do' do do,
    fa fa mi re fa,2. r4

    %25
    R1
    r2 r4 do'
    reb sib do do,

    %28
    fa2 r
    R1
    r2 fa'

    %31
    sib,2. sib4
    do2. r4
    R1

    %34
    r2 r4 mib
    fa reb mib mib,
    lab2 r

    %37
    r4 fa' fa fa,
    sib sib'~sib8 do sib lab
    sol4 fa mi fa

    %40
    do' do, r2
    R1
    r2 r4 do

    %43
    fa sib do do,
    fa fa, r2
    R1

    %46
    r2 r4 do'
    fa sib do do,
    fa,2.

}

Vbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s4
    s2. <7>4
    s2. <4\+>4
    <6>8 s <6 5>4 <4> <7>
    <_>2 <_>4
    <6>8 s
    <6 5>4 <6!\\> <6> <6>8 s
    <6 5>4 <6!\\> <6> <6>8 s
    <6 5> s <6>4 <4> <7 _!>
    s1 s
    s2. <7 _!>4
    s2. <4\+>4
    <6>8 s <6 5>4 <4> <7 _!>
    <_>2 <_>4 <_>
    s2. <6 5>4
    s1
    s2. <6 5>4
    s1
    <7>2 <6 4>4 <7\+>
    <3>2 <6 4>4 <7\+>
    <3> <3> <4> <7>
    s <_> <_> s
    <7>2 <6 4>4 <7\+>
    <3>2 <6 4>4 <7\+>
    <3> <3> <4> <7>
    s s <6> <6!\\> s1
    s
    s2. <7 _!>4
    <5>8 s <6 5>4 <4> <7 _!>
    s1*3
    <9 7>2 <6 5>
    <_!>1
    s
    s2. <7>4
    <5>8 s <6 5>4 <4> <7>
    s1
    s2. <7 _!>8 s
    <9 _!> 4 <8> s <6 5 _->4
    <6!\\>  s <5/> s
    <_!>1
    s
    s2. <7 _!>4
    s <6 5> <4> <7 _!>
    s1
    s
    s2. <7 _!>4
    s <6 5> <4> <7 _!>

}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \partial 4 s4
    \tempo 1 = 60
    \repeat volta 2 {s1*7}
    \alternative {{s1}{s}}
    \set Score.currentBarNumber = #9
    \repeat volta 2 {s1*15}
    \alternative {
        {s1}{s2. \bar ":..:"\break \key fa\minor  s4}
    }
    \once\override Score.RehearsalMark.extra-offset = #'(+5 . +1.0)
    \mark\markup\huge "All.° 2.do"
    \set Score.currentBarNumber = #25
    s1*7
    s2.
    \bar":..:"
    s4
    s1*15
    s2.
    \bar":|."
    \mark\markup\smaller\center-column {"D.C."\vspace #+0.2"[al I.mo]"}

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



global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIvlIn = \relative do'' {

    do8
    la fa fa'
    mi-+ do sib'
    la sol16-+ fa sol mi

    %4
    fa la, do la fa' fa
    fa sib, re sib fa' fa
    fa la, do la fa' fa

    %7
    fa mi re do sib la
    sol4_+ do8 sol4 sol8
    mi do do'-!

    %10
    do(sib16-+) la sib8\mbreak
    sol'16 fa mi re do sib
    la4._+

    %13
    re16 sib fa sib re re
    do la fa la do do
    sib la sib sol la fa

    %16
    do4.
    sib''
    la16 do mi, sol fa8

    %19
    sib,4.\p
    la16 do mi, sol fa8\mbreak
    fa'16\f (mi fa) re-! do si

    %22
    do_+(si do) la sol fa
    sol sib la fa sol mi
    fa4.

    %25
    fa'16\p (mi fa) re-! do-! si-!
    do_+(si do) la sol fa
    sol sib la fa sol mi

    %28
    fa4 fa8 fa4 do'8-!\p
    do(lab) lab-!
    lab(fa) fa'-!

    %31
    \tuplet 3/2 { fa16(sol lab) } sol8[fa]
    mi4-+ r16 sol\f
    sol16.(mi32) do16.[(sol32)] mi16.(do32)

    %34
    sib8-! lab-! r
    reb do si_+
    do4 do'8-!\p

    %37
    do(lab) mib'\mbreak
    mib(do) lab'-!
    \tuplet 3/2 { lab16(sib do) } sib8[lab]

    %40
    sol4-+ r16 sib\f
    sib16.(sol32) reb16.[(sib32)] sol16.(mib32)
    sol,8-! lab-! r

    %43
    \tuplet 3/2 { sib'16(do reb)} do8[sib-+]
    lab4 lab'8\p~
    lab \once\stemUp mib,_! do'8~

    %46
    do-+ sib-! sol'~
    sol \once \stemUp do,, sib'~
    sib-+ lab-! fa'~

    %49
    fa mi-! sol~
    sol fa reb\f
    do16(sib) lab(sol) fa_+(mi)

    %52
    fa4 fa'8\p~
    fa mi-! sol~
    sol fa reb\f

    %55
    do16(sib) lab(sol) fa_+(mi)
    fa4

}

VIvlIIn = \relative do'' {

    do8
    la fa fa'
    mi-+ do sib'
    la sol16-+ fa sol mi

    %4
    fa la, do la fa' fa
    fa sib, re sib fa' fa
    fa la, do la fa' fa

    %7
    fa mi re do sib la
    sol4_+ do8 sol4 sol8
    mi do do'-!

    %10
    do(sib16-+) la sib8\mbreak
    sol'16 fa mi re do sib
    la4._+

    %13
    re16 sib fa sib re re
    do la fa la do do
    sib la sib sol la fa

    %16
    do4.
    sib''
    la16 do mi, sol fa8

    %19
    sib,4.\p
    la16 do mi, sol fa8\mbreak
    fa'16\f (mi fa) re-! do si

    %22
    do_+(si do) la sol fa
    sol sib la fa sol mi
    fa4.

    %25
    fa'16\p (mi fa) re-! do-! si-!
    do_+(si do) la sol fa
    sol sib la fa sol mi

    %28
    fa4 fa8 fa4 r8
    r r do'\p
    do(lab) do,~

    %31
    do sib' reb
    do16. \f do32 do16.(sol32) sol16. (mi32)
    mi4.

    %34
    mi?8-! fa-! r
    reb do si_+
    do4 r8

    %37
    r r do'\p
    do(lab) mib~\mbreak
    mib reb' fa

    %40
    mib16.\f mib32 mib16. (sib32) sib16.(sol32)
    sol4.
    reb8-! do-! r

    %43
    lab' lab sol_+
    lab16.(mib32) mib16.(do32) do16.(lab32)
    lab4 lab'8-!\p

    %46
    lab(sol) r
    r r sol-!
    sol(fa) lab~\mbreak

    %49
    lab sol-! sib~
    sib lab mi_+\f
    fa16(reb) do(sib) lab(sol)

    %52
    lab4 lab'8\p~
    lab sol-! sib~
    sib lab mi_+\f

    %55
    fa16(reb) do(sib) lab(sol)
    lab4

}

VIvlan = \relative do' {

    r8
    fa4 la8
    sol4 sol8
    do, sib16 la sib sol

    %4
    la4 do8
    re4 re8
    do4 do8

    %7
    re4 sol16 fa
    mi4 r8 mi4 r8
    r4 mi8

    %10
    fa4.\mbreak
    sol
    do,4 fa8

    %13
    fa4.
    fa
    mi16 fa sol8 fa

    %16
    mi4.
    sol'
    do,8 sib la

    %19
    sol4.
    do,8 sib la
    r fa'4\f

    %22
    mi8 do do
    re do sib\mbreak
    la4.

    %25
    r8 fa'4\p
    mi8 do do
    re do sib

    %28
    la4. la4 r8
    fa'4.\p
    fa

    %31
    reb4 sib8
    sol4.
    R\mbreak

    %34
    do8-!\f do-! r
    reb-! do-! si-!
    do4 r8

    %37
    lab4.\p
    lab
    fa'4 reb8

    %40
    sib4.
    R
    mib8\f-! mib-! r

    %43
    fa mib reb
    do4.
    mib\p

    %46
    mib\mbreak
    do
    do

    %49
    sib4 reb8
    do4 sib8\f
    do do do

    %52
    do4.
    sib4\p reb8
    do4 sib8\f

    %55
    do do do
    do4

}


VIbcn = \relative do {

    r8
    r4 fa8
    do'4 mi,8
    fa do' do,

    %4
    fa la fa
    sib4 sib8
    la4 la,8

    %7
    sib4.
    do4 r8 do4 r8
    r4 do8\mbreak

    %10
    re4.
    mi
    fa8 la fa

    %13
    sib4.
    la
    sol8 mi fa

    %16
    do do, do
    r mi' do
    fa sol la

    %19
    r mi\p do
    fa sol la\mbreak
    r re, \f sol

    %22
    do, fa fa,
    sib do do,
    fa4.

    %25
    r8 re'\p sol
    do, fa fa,
    sib do do,

    %28
    fa4 r8 fa4 r8
    fa'4.\p
    fa,

    %31
    sib
    do
    R

    %34
    do'8\f fa, r
    reb do si
    do4 r8

    %37
    lab'4.\p
    lab,\mbreak
    reb

    %40
    mib
    R
    mib'8\f lab, r

    %43
    reb, mib mib,
    lab4.
    lab'\p

    %46
    mib
    mi
    fa

    %49
    sol\mbreak
    lab4 sib8\f
    lab16[sib] do8 do,

    %52
    fa4.
    sol\p
    lab4 sib8\f

    %55
    lab16[sib] do8 do,
    fa,4

}

VIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s8 s4.
    <7>4 <7>8
    s <4> <7>
    <_>4 <_>16 s
    <6 _ 5>4 <_>8
    <6>4 <6>16 s
    <6 5>4.
    s s s
    <7>4 <6>8
    <5/>4.
    <_>4 <_>8
    <6 5>4 s8
    <6>4 s8
    <6\\>4 <6\\>8
    s4.
    s8 <5/> s
    s <6\\> <6>
    s <5/> s
    s <6\\> <6>
    s <7>16 s <7 _!>8
    <7->4.
    <6 5>8  <4> <7>
    s4.
    s8 <7>16 s <7 _!>8
    <7->4.
    <6 5>8  <4> <7>
    s4. s
    s
    s
    <9 7> 4 <6 5>8
    <_!>4.
    s
    <7 _!>
    <6\\>8 <_!> <7/>
    <_!>4.
    s
    s
    <9 7> 4 <6 5>8
    s4.
    s
    <7>
    <6 5>8 <4> <7>
    s4.
    s
    <6 4>4 <3>8
    <5/>4.
    <9 4>4 <3>8
    <9 7>4 <6!\\ 5/>8
    <5\+>8 <6> <4\+ _->
    <6> <4> <7 _!>
    s4.
    <9 7>4 <6!\\ 5/>8
    <5\+>8 <6> <4\+ 3>
    <6> <4> <7 _!>

}

forma = {

    \time 3/8
    \key fa\major
    \partial 8 s8
    \tempo 4. = 60
    \repeat volta 2 {s4.*7}
    \alternative {{s4.}{s}}
    \set Score.currentBarNumber = #9
    \repeat volta 2 {s4.*19}
    \alternative {
        {s4.}{ s4\break \once\override Score.RehearsalMark.extra-offset = #'(+5 . +1.0) \mark\markup\huge "Vivace 2°"  \bar ":..:"\break \key fa\minor  s8}
    }

    \set Score.currentBarNumber = #29
    s4.*7
    s4
    \bar":..:"\break
    s8
    s4.*19
    s4
    \bar":|."
    \mark\markup\smaller\center-column {"D.C."\vspace #+0.2"[al I.mo]"}

}



VIvlI = {
    \global
    <<\VIvlIn \forma>>

}

VIvlII = {
    \global
    <<\VIvlIIn \forma>>

}


VIvla = {
    \global
    \clef alto
    <<\VIvlan \forma>>

}

VIbc = {
    \global
    \clef bass
    <<\VIbcn \forma \VIbfn>>

}



global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

VIIvlIn = \relative do'' {

    r4 la8.[fa16 do'8. la16]
    re4-! re4. mi16 fa
    do8.[fa16 fa,8. fa16 fa8. fa16]

    %4
    sol8.[sib16 la8. sol16 fa8._+ mi16]
    fa4 la8.[fa16 do'8. la16]
    re4-! re4. mi16 fa

    %7
    do8.[fa16 fa,8. fa16 fa8. fa16]
    sol8 la16 sib sol4._+ fa8
    fa4 fa'4.(sol16 la)\mbreak

    %10
    sol8.[sol,16 do8. mi16 sol8. sib16]
    la8.[la,16 do8. fa16 la8. do16]
    re8.[sib16 do8. la16 sib8. sol16]

    %13
    la4 fa4. (sol16 la)
    sol8.[sol,16 do8. mi16 sol8. sib16]
    la8.[la,16 do8. fa16 la8. do16]

    %16
    re8.[sib16 do8. la16 sib8. sol16]
    la4 la8.[(fa16) dod8.(re16)]\mbreak
    mi,8.[(re'16) sol8.(mi16) si8.(do16)]

    %19
    re,8.[(do'16) fa8. (la,16) sib8.(sol'16)]
    sol8.[(fa16) mi8.(re16) do8.(sib16)]
    la4 la'8.[(fa16) dod8.(re16)]

    %22
    mi,8.[(re'16) sol8.(mi16) si8.(do16)]
    re,8.[(do'16) fa8. (la,16) sib8.(sol'16)]
    sol8.[(fa16) mi8.(re16) do8.(sib16)]

    %25
    la4 do4. r16 do
    do8. re,16 sib'4. r16 sib\mbreak
    sib8. do,16 la'4. r16 la

    %28
    la4 sol8.[fa16 sol8. mi16]
    fa4 do'4. r16 do
    do8. re,16 sib'4. r16 sib

    %31
    sib8. do,16 la'4. r16 la
    la4 sol8.[fa16 sol8. mi16]
    fa4 la16 \f fa do' la fa' do la' fa

    %34
    do'4-! do-! do-!
    do2.~\mbreak
    do2 si4-+

    %37
    do8 do,16 re mi8 fa16 sol la4~
    la8 la,16 sib do8 re16 mi sol4~
    sol 8 la,16 sib do8 re16 mi fa4~

    %40
    fa8 sol,16 la sib8 do16 re mi8 fa16 sol
    fa,4 la16 fa do' la fa' do la' fa
    do'4-! do-! do-!

    %43
    do2.~\mbreak
    do2 si4-+
    do8 do,16 re mi8 fa16 sol la4~

    %46
    la8 la,16 sib do8 re16 mi sol4~
    sol8 la,16 sib do8 re16 mi fa4~
    fa8 sol,16 la sib mi sol sib, la do fa la,\mbreak

    %49
    sol4 do-! do-!
    do4~\tuplet 3/2 {
        do8 sib-! la-! sol-![fa-! mib-!]
        re-! do-! sib-!
    } re'4-! re-!

    %52
    re~\tuplet 3/2 {
        re8 do-! si-! la-![sol-! fa-!]
        mi-! re-! do-!
    } sol''4-! sol-!
    sol~\tuplet 3/2 { sol8 fa-! mi-! re-![do-! sib-!] }

    %55
    la4 do' fa,
    sol8. la32 sib la8.[sol16 fa8.-+ mi16]\mbreak
    fa4 do-! do-!

    %58
    do4~\tuplet 3/2 {
        do8 sib-! la-! sol-![fa-! mib-!]
        re-! do-! sib-!
    } re'4-! re-!
    re~\tuplet 3/2 {
        re8 do-! si-! la-![sol-! fa-!]

        %61
        mi-! re-! do-!
    } sol''4-! sol-!
    sol~\tuplet 3/2 { sol8 fa-! mi-! re-![do-! sib-!] }
    la4 do' fa,

    %64
    sol8. la32 sib la8.[sol16 fa8.-+ mi16]
    fa8.[fa,16 la8. do16] fa4~\mbreak
    fa8. sol,16 mi'2~

    %67
    mi8. fa,16 re'4. r16 do
    sib8-! la-! sol-! fa-! mi-! re-!
    la\p(mi') fa(la) re,(fa)

    %70
    mi(sol) fa(la) re,(fa)
    mi(sol) fa(re') dod(fa)
    mi sib'-! la-! sol-! fa-+-! mi-!

    %73
    fa8.[fa,16\f la8. re16] fa4~
    fa8. sol,16 mi'2~
    mi8. fa,16 re'4. r16 do

    %76
    sib8-! la-! sol-! fa-! mi-! re-!
    la-!\p(mi') fa(la) re,(fa)
    mi(sol) fa(la) re,(fa)

    %79
    mi(sol) fa(re') dod(sol')
    fa8.-+ mi16 mi2-+
    re4 re'-!\p re-!

    %82
    re2.~
    re~
    re8 mib,-!\f re-! do-! sib-! la-!\mbreak

    %85
    sol,4 do''\p-! do-!
    do2.~
    do~

    %88
    do8 re,-!\f do-! sib-! la-! sol-!
    la4 sib do-+
    re8-! do-! sib-! la-! sol-! fa-!

    %91
    do si'\p(do) mi,(fa) re-!
    do si'(do) mi,(fa) re-!
    do4 do''\pp(sib

    %94
    lab sol fa)\mbreak
    mi-! sib'(lab
    sol fa mi)

    %97
    fa2.~
    fa~
    fa

    %100
    fa4(mi fa)
    mi-! do'4(sib
    lab sol fa)

    %103
    mi-! sib'(lab
    sol fa mi)
    fa2.~

    %106
    fa~
    fa
    fa4(mi fa)

    %109
    mi-+ mib(reb
    do sib la)
    sib-! reb(do

    %112
    sib lab sol)
    lab mib'2~
    mib4 reb8 do sib lab

    %115
    sol4_+ mib' mib
    mib(\tuplet 3/2 { fa8 sol lab) sib[(do reb)] }
    mib,4~\tuplet 3/2 { mib8(fa sol) lab[(sib do)]}\mbreak

    %118
    reb,4~\tuplet 3/2 {
        reb8(mib fa) sol[(lab sib)]
    }
    do,4 \tuplet 3/2 {
        lab'8(sol lab) mib[(reb do)]
    }
    fa,8(reb') do4(sib-+)

    %121
    lab-! do2(
    sib8 )mib,(sol sib) reb4(
    do8) fa,(lab do) fa4

    %124
    mi8.(fa16) \afterGrace fa2-+ ( {mib16[fa)]}
    sol4-! do,(re
    mi fa sol-+)\mbreak

    %127
    lab \appoggiatura sol8 fa4 \appoggiatura mib8 re4
    si8_+ sol-!\f fa-!  mib re do
    sol4 fa''-! fa-!

    %130
    fa~\tuplet 3/2 { \once\stemDown fa8 re,(mib fa [mib re]) }
    mib4 sol'-! sol-!
    sol4~\tuplet 3/2 { \once\stemDown sol8 mib, (fa sol[fa mib)]}

    %133
    re4 lab''(sol
    fa mib re)
    do(si do)\mbreak

    %136
    \tuplet 3/2 { re8(mib fa) } \appoggiatura mib re2-+
    do4-! mib \appoggiatura reb8 do4
    \appoggiatura sib8 la4 \appoggiatura do8 sib4 do-+

    %139
    re-! fa \appoggiatura mib8 re4
    \appoggiatura do8 si4 \appoggiatura re8 do4 re-+
    mi sol\p-! sol-!

    %142
    sol4~\tuplet 3/2 { sol8 (mi do) sib[(mi sol)] }
    lab,4~\tuplet 3/2 {
        lab8(do fa) sol,[(do mi)]\mbreak
        fa,(lab do) mi,[(sol do)] re,(fa si)
    }

    %145 OOKK
    do,4 fa-!\f fa-!
    fa4. sol16 la sib do re mi
    fa(mi) fa(mi) fa(mi) fa(mi) fa do fa la

    %148
    sol(fa) sol(fa) sol(fa) sol(fa) sol do, sol' sib
    \once\stemDown la fa, fa fa fa fa fa fa fa do' fa la
    \once\stemDown sol mi, mi mi mi mi mi mi mi do' mi sol

    %151
    \once \stemDown fa re, re re re re re re re sib' re fa
    mi fa sol fa mi fa re mi do re sib do
    la4 fa-! fa-!

    %154
    fa4. sol16 la sib do re mi
    fa(mi) fa(mi) fa(mi) fa(mi) fa do fa la
    sol(fa) sol(fa) sol(fa) sol(fa) sol do, sol' sib

    %157
    \once\stemDown la fa, fa fa fa fa fa fa fa do' fa la
    \once\stemDown sol mi, mi mi mi mi mi mi mi do' mi sol
    \once \stemDown fa re, re re re re re re re sib' re fa

    %160
    mi fa sol fa mi fa re mi do re sib do\mbreak
    la4 do4.-+ sib16 la
    sol8. si16 do4. r16 sol

    %163
    fa8. si16 re4. r16 fa,
    mi4._+ fa16 sol do,4
    r8. fa16[la8. si16] \appoggiatura si8 do4

    %166
    r8. mi,16[sol8. si16] \appoggiatura si8 do4
    r8. re,16[fa8. si16 re8. fa,16]
    mi4._+ fa16 sol do,4\mbreak

    %169
    r do''2\p~
    do8.[(la16) sib8. (sol16) la8. (fad16)]
    sol4 sib2~

    %172
    sib8.[(sol16) la8. (fa16) sol8.(mi16)]
    fa4 do4.(re16 mib)
    re8-! do-! sib-! la-! sol-! fa-!

    %175
    mi16\f do fa re sol mi la fa sib sol la fa
    mi do fa re sol mi la fa sib sol la fa\mbreak
    mi do fa re sol mi la fa sib sol do la

    %178
    re sib mi do fa re sol mi la fa sib sol
    do4. mi,8 fa4~
    fa8. sib,16 sol4._+ fa8

    %181
    fa4 do''2\p~
    do8.[(la16) sib8. (sol16) la8. (fad16)]
    sol4 sib2~

    %184
    sib8.[(sol16) la8. (fa16) sol8.(mi16)]
    fa4 do4.(re16 mib)
    re8-! do-! sib-! la-! sol-! fa-!

    %187
    mi16\f do fa re sol mi la fa sib sol la fa
    mi do fa re sol mi la fa sib sol la fa\mbreak
    mi do fa re sol mi la fa sib sol do la

    %190
    re sib mi do fa re sol mi la fa sib sol
    do4. mi,8 fa4~
    fa8. sib,16 sol4._+ fa8

    %193
    fa2.

}

VIIvlIIn = \relative do'' {

    r4 la8.[fa16 do'8. la16]
    re4-! re4. mi16 fa
    do8.[fa16 fa,8. fa16 fa8. fa16]

    %4
    sol8.[sib16 la8. sol16 fa8._+ mi16]
    fa4 la8.[fa16 do'8. la16]
    re4-! re4. mi16 fa

    %7
    do8.[fa16 fa,8. fa16 fa8. fa16]
    sol8 la16 sib sol4._+ fa8
    fa4 fa'4.(sol16 la)\mbreak

    %10
    sol8.[sol,16 do8. mi16 sol8. sib16]
    la8.[la,16 do8. fa16 la8. do16]
    re8.[sib16 do8. la16 sib8. sol16]

    %13
    la4 fa4. (sol16 la)
    sol8.[sol,16 do8. mi16 sol8. sib16]
    la8.[la,16 do8. fa16 la8. do16]

    %16
    re8.[sib16 do8. la16 sib8. sol16]
    la4 la8.[(fa16) dod8.(re16)]\mbreak
    mi,8.[(re'16) sol8.(mi16) si8.(do16)]

    %19
    re,8.[(do'16) fa8. (la,16) sib8.(sol'16)]
    sol8.[(fa16) mi8.(re16) do8.(sib16)]
    la4 la'8.[(fa16) dod8.(re16)]

    %22
    mi,8.[(re'16) sol8.(mi16) si8.(do16)]
    re,8.[(do'16) fa8. (la,16) sib8.(sol'16)]
    sol8.[(fa16) mi8.(re16) do8.(sib16)]

    %25
    la4 do4. r16 do
    do8. re,16 sib'4. r16 sib\mbreak
    sib8. do,16 la'4. r16 la

    %28
    la4 sol8.[fa16 sol8. mi16]
    fa4 do'4. r16 do
    do8. re,16 sib'4. r16 sib

    %31
    sib8. do,16 la'4. r16 la
    la4 sol8.[fa16 sol8. mi16]
    fa2.

    %34
    r4 la16\f fa do' la fa' do la' fa
    sol2.\mbreak
    fa

    %37
    mi8 do16 re mi8 fa16 sol la4~
    la8 la,16 sib do8 re16 mi sol4~
    sol 8 la,16 sib do8 re16 mi fa4~

    %40
    fa8 sol,16 la sib8 do16 re mi8 fa16 sol
    fa,2.
    r4 la16 fa do' la fa' do la' fa

    %43
    sol2.\mbreak
    fa
    mi8 do16 re mi8 fa16 sol la4~

    %46
    la8 la,16 sib do8 re16 mi sol4~
    sol 8 la,16 sib do8 re16 mi fa4~
    fa8 sol,16 la sib mi sol sib, la do fa la,\mbreak

    %49
    sol4 do-! do-!
    do4~\tuplet 3/2 {
        do8 sib-! la-! sol-![fa-! mib-!]
        re-! do-! sib-!
    } re'4-! re-!

    %52
    re~\tuplet 3/2 {
        re8 do-! si-! la-![sol-! fa-!]
        mi-! re-! do-!
    } sol''4-! sol-!
    sol~\tuplet 3/2 { sol8 fa-! mi-! re-![do-! sib-!] }

    %55
    la4 do' fa,
    sol8. la32 sib la8.[sol16 fa8.-+ mi16]\mbreak
    fa4 do-! do-!

    %58
    do4~\tuplet 3/2 {
        do8 sib-! la-! sol-![fa-! mib-!]
        re-! do-! sib-!
    } re'4-! re-!
    re~\tuplet 3/2 {
        re8 do-! si-! la-![sol-! fa-!]

        %61
        mi-! re-! do-!
    } sol''4-! sol-!
    sol~\tuplet 3/2 { sol8 fa-! mi-! re-![do-! sib-!] }
    la4 do' fa,

    %64
    sol8. la32 sib la8.[sol16 fa8.-+ mi16]
    fa8.[fa,16 la8. do16] fa4~\mbreak
    fa8. sol,16 mi'2~

    %67
    mi8. fa,16 re'4. r16 do
    sib8-! la-! sol-! fa-! mi-! re-!
    la\p(dod) re(fa si, re)

    %70
    dod(mi) re(fa si, re)
    dod-! sol'(fa) re'(dod) fa
    mi sib'-! la-! sol-! fa-+-! mi-!

    %73
    fa8.[fa,16\f la8. re16] fa4~
    fa8. sol,16 mi'2~
    mi8. fa,16 re'4. r16 do

    %76
    sib8-! la-! sol-! fa-! mi-! re-!
    la\p(dod) re(fa si, re)
    dod(mi) re(fa si, re)

    %79
    dod-! sol'(fa) re'(dod) sol'-!
    fa8.-+ mi16 mi2-+
    re4 re'-!\p re-!

    %82
    re2.~
    re~
    re8 mib,-!\f re-! do-! sib-! la-!\mbreak

    %85
    sol,4 do''\p-! do-!
    do2.~
    do~

    %88
    do8 re,-!\f do-! sib-! la-! sol-!
    la4 sib do-+
    re8-! do-! sib-! la-! sol-! fa-!

    %91
    do si'\p(do) mi,(fa) re-!
    do si'(do) mi,(fa) re-!
    do2.\pp

    %94 OOKK
    R
    r4 sol''(fa)
    sib,(lab sol)

    %97
    fa-! fa(sol)
    lab(sol fa)
    sib(lab sol)

    %100
    do(sib lab)
    sol2._+\mbreak
    R

    %103
    r4 sol'(fa)
    sib,(lab sol)
    fa-! fa(sol)

    %106
    lab(sol fa)
    sib(lab sol)
    do(sib lab)

    %109
    sol-! do,(sib)
    la(sib do)
    reb sib(lab?)

    %112
    sol(lab sib)
    do2 do'4~
    do \appoggiatura sib8 lab4 \appoggiatura sol8 fa4

    %115
    mib sol2
    lab4 sib2
    sol4 lab2

    %118
    fa4(sol) sib
    mib, do'2
    sib8(lab) lab4(sol_+)

    %121
    lab mib lab~
    lab sol sib~
    sib lab do

    %124
    sib lab2\mbreak
    sol2._+
    do4 (re mi)

    %127
    fa lab,2
    sol8 sol-!\f fa-! mib-! re-! do-!
    sol4 re''-! re-!

    %130
    re~\tuplet 3/2 { re8 (si do) re[(do si)]}
    do4 mib-! mib-!
    mib~\tuplet 3/2 { mib8(do re) mib[(re do)] }

    %133
    si4-! si(do)\mbreak
    re,(mib fa)
    mib(fa mib)

    %136
    re8(do) do4 si_+
    do2.
    mib4(re? do)

    %139
    sib2.
    fa'4 mi re
    do2.\p

    %142
    mi4-! sol-! mi-!
    fa-! lab-! sib-!
    lab(sol fa)\mbreak

    %145 OOKK
    mi4 fa-!\f fa-!
    fa4. sol16 la sib do re mi
    fa(mi) fa(mi) fa(mi) fa(mi) fa do fa la

    %148
    sol(fa) sol(fa) sol(fa) sol(fa) sol do, sol' sib
    \once\stemDown la fa, fa fa fa fa fa fa fa do' fa la
    \once\stemDown sol mi, mi mi mi mi mi mi mi do' mi sol

    %151
    \once \stemDown fa re, re re re re re re re sib' re fa
    mi fa sol fa mi fa re mi do re sib do
    la4 fa-! fa-!

    %154
    fa4. sol16 la sib do re mi
    fa(mi) fa(mi) fa(mi) fa(mi) fa do fa la
    sol(fa) sol(fa) sol(fa) sol(fa) sol do, sol' sib

    %157
    \once\stemDown la fa, fa fa fa fa fa fa fa do' fa la
    \once\stemDown sol mi, mi mi mi mi mi mi mi do' mi sol
    \once \stemDown fa re, re re re re re re re sib' re fa

    %160
    mi fa sol fa mi fa re mi do re sib do\mbreak
    la4 do4.-+ sib16 la
    sol8. si16 do4. r16 sol

    %163
    fa8. si16 re4. r16 fa,
    mi4._+ fa16 sol do,4
    r8. fa16[la8. si16] \appoggiatura si8 do4

    %166
    r8. mi,16[sol8. si16] \appoggiatura si8 do4
    r8. re,16[fa8. si16 re8. fa,16]
    mi4._+ fa16 sol do,4\mbreak

    %169
    r do''2\p~
    do8.[(la16) sib8. (sol16) la8. (fad16)]
    sol4 sib2~

    %172
    sib8.[(sol16) la8. (fa16) sol8.(mi16)]
    fa4 do4.(re16 mib)
    re8-! do-! sib-! la-! sol-! fa-!

    %175
    mi16\f do fa re sol mi la fa sib sol la fa
    mi do fa re sol mi la fa sib sol la fa\mbreak
    mi do fa re sol mi la fa sib sol do la

    %178
    re sib mi do fa re sol mi la fa sib sol
    do4. mi,8 fa4~
    fa8. sib,16 sol4._+ fa8

    %181
    fa4 do''2\p~
    do8.[(la16) sib8. (sol16) la8. (fad16)]
    sol4 sib2~

    %184
    sib8.[(sol16) la8. (fa16) sol8.(mi16)]
    fa4 do4.(re16 mib)
    re8-! do-! sib-! la-! sol-! fa-!

    %187
    mi16\f do fa re sol mi la fa sib sol la fa
    mi do fa re sol mi la fa sib sol la fa\mbreak
    mi do fa re sol mi la fa sib sol do la

    %190
    re sib mi do fa re sol mi la fa sib sol
    do4. mi,8 fa4~
    fa8. sib,16 sol4._+ fa8

    %193
    fa2.

}

VIIvlan = \relative do'' {

    r4 r la8. fa16
    sib4 sib,2~
    sib4 la fa'8. do16

    %4
    re4 do8.[sib16 la8. sol16]
    la2 la'8. fa16
    sib4 sib,2~

    %7
    sib4 la fa'8. do16
    re4 do sib
    la2.

    %10
    r4 sol'2\mbreak
    do,4 fa2~
    fa4 fa mi-+

    %13
    fa2.
    r4 sol2
    do,4 fa2~

    %16
    fa4 fa mi-+
    fa2 la4
    sol2 sol4

    %19
    fa2 fa4
    fa sol8 fa mi sol
    do,2 la'4\mbreak

    %22
    sol2 sol4
    fa2 fa4
    fa sol8 fa mi sol

    %25
    do,2 la'4
    fa re sol
    mi do fa

    %28
    re do sib
    la2 la'4
    fa re sol

    %31
    mi do fa
    re do sib\mbreak
    la2.

    %34
    R
    r4 mi'16\f do sol' mi do' sol mi' do
    re2.

    %37
    do2 r8 r16 mi,
    re2 r8 r16 re
    do2 r8 r16 do

    %40
    sib2 do8 sib
    la2.
    R\mbreak

    %43
    r4 mi'16 do sol' mi do' sol mi' do
    re2.
    do2 r8 r16 mi,

    %46
    re2 r8 r16 re
    do2 r8 r16 do
    sib4 sol' fa

    %49
    mi2.
    r4 do-! do~
    do sib2

    %52
    r4 re-! re~
    re do2\mbreak
    r4 sol' sol~

    %55
    sol fa2~
    fa8.[re16 do8. sib16 la8. sol16]
    la2.

    %58
    r4 do-! do~
    do sib2\mbreak
    r4 re-! re~

    %61
    re do2
    r4 sol' sol~
    sol fa2~

    %64
    fa8.[re16  do8. sib16 la8. sol16]
    la2 r8 r16 la'\f
    sol2 r8 r16 sol

    %67
    fa2 fa4~
    fa sib8-! la-! sol-! fa-!
    mi4 la,\p sold\mbreak

    %70
    la2 sold4
    la la2
    sib8 sol'-! fa-! mi-! re-! dod-!

    %73
    re2 r8 r16 fa\f
    sol2 r8 r16 sol
    la2 r8 r16 la

    %76
    re,4 sib'8-! la-! sol-! fa-!
    mi4 la,\p sold\mbreak
    la2 sold4

    %79
    la2.~
    la8 re re4 dod_+
    re2.

    %82
    r4 r8 re'-!\p do-! sib-!
    la(do) sib (re) fad,(la)
    sol4 sol\f fad_+

    %85
    sol2.\mbreak
    r4 r8 do-!\p sib-! la-!
    sol(sib) la(do) mi,(sol)

    %88
    fa4 fa\f mi_+
    fa mi_+ fa~
    fa sib8 la sol fa

    %91
    mi(fa\p mi) do-! re(si)
    do-! fa(mi) do(re) si-!\mbreak
    do2.\p

    %94
    do'4(sib lab)
    sol(mi fa)
    reb(do sib)

    %97
    lab(do sib)
    lab(reb do)
    sib(do reb)

    %100
    do do do
    do2.\mbreak
    do'4(sib lab)

    %103
    sol(mi fa)
    reb(do sib)
    lab(do sib)

    %106
    lab(reb do)
    sib(do reb)
    do do do

    %109
    do fa2
    fa4 fa fa\mbreak
    fa mib2

    %112
    mib4 mib mib
    mib2.
    fa2 reb4

    %115
    sib2 sib4
    do reb2
    sib4 do2

    %118
    lab4 sib2
    do mib4
    fa mib reb

    %121
    do2 mib4
    mib2 fa4\mbreak
    fa2 fa4

    %124
    do do2
    do4-! do'(si)
    sib!(lab sol)

    %127
    fa2 fa4
    re8-! sol-!\f fa-! mib-! re-! do-!
    sol2.

    %130
    r4 sol sol
    sol2.
    r4 sol sol\mbreak

    %133
    sol re' mib
    fa(sol) lab-!
    sol(lab) sol-!

    %136
    lab sol fa
    mib2.
    do4 sib la

    %139
    sib2.
    re4 do si
    do2.\p

    %142
    do4 mi do\mbreak
    fa2 mi4_+
    fa do si_+

    %145 OOKK
    do2.\f
    r4 do-! do-!
    do-! sib-! la-!

    %148
    re do mi_+
    fa do re~
    re do2~

    %151
    do4 sib2~
    sib8.[sib'16 do8. sib16 la8. sol16]\mbreak
    fa2.

    %154
    r4 do-! do-!
    do-! sib-! la-!
    re do mi_+

    %157
    fa do re~
    re do2~
    do4 sib2~

    %160
    sib8.[sib'16 do8. sib16 la8. sol16]
    fa4 la, do~
    do sol do~\mbreak

    %163
    do si2_+
    do16\f do do do do do do do sib sib sib sib
    la2 r8 r16 la'

    %166
    sol2 r8 r16 sol
    fa4 re si
    do2.

    %169
    r4 la'\p sol
    fad8.[do16 re8. sib16 do8. la16]\mbreak
    sib4 sol' fa

    %172
    mi8.[sib16 do8. la16 sib8. sol16]
    la4 fa' fa
    fa re2

    %175
    do8\f re mi fa mi fa
    do re mi fa mi fa
    do4. fa8 mi fa

    %178
    fa4 re4. sol8\mbreak
    mi4 sol do,
    re8. sol16 mi4._+ fa8

    %181
    fa4 la\p sol
    fad8.[do16 re8. sib16 do8. la16]\mbreak
    sib4 sol' fa

    %184
    mi8.[sib16 do8. la16 sib8. sol16]
    la4 fa' fa
    fa re2

    %187
    do8\f re mi fa mi fa
    do re mi fa mi fa
    do4. fa8 mi fa

    %190
    fa4 re4 r8 r16 re
    mi4 sol do,
    re8. sol16 mi4._+ fa8

    %193
    fa2.

}


VIIbcn = \relative do {

    fa,4 r r
    r sib'8.[fa16 re'8. sib16]
    fa'4 la,8.[fa16 do'8. la16]

    %4
    sib,4 do do,
    fa2.
    r4 sib'8.[fa16 re'8. sib16]

    %7
    fa'4 la,8.[fa16 do'8. la16]
    sib,4 do do,
    fa4 fa'2~\mbreak

    %10
    fa4 mi2
    fa4 la,2
    sib4 la sol

    %13
    fa fa'2~
    fa4 mi2
    fa4 la,2

    %16
    sib4 la sol
    fa fa'2
    mi2.

    %19
    re
    do\mbreak
    fa,4 fa'2

    %22
    mi2.
    re
    do

    %25
    fa,8.[fa'16 la8. do16 fa,8. la16]
    re,8.[fa16 sol8. sib16 mi,8. sol16]
    do,8.[mi16 fa8. la16 re,8. fa16]

    %28
    sib,4 do do,\mbreak
    fa8.[fa'16 la8. do16 fa,8. la16]
    re,8.[fa16 sol8. sib16 mi,8. sol16]

    %31
    do,8.[mi16 fa8. la16 re,8. fa16]
    sib,4 do do,
    fa2.

    %34
    R2.*2
    r4 fa'16\f la re, fa sol fa sol sol,
    do2 r8 r16 do

    %38
    sib2 r8 r16 sib
    la2 r8 r16 la
    sol4 do do,

    %41
    fa2.
    R2.*2
    r4 fa'16 la re, fa sol fa sol sol,

    %45
    do2 r8 r16 do
    sib2 r8 r16 sib
    la2 r8 r16 la

    %48
    sol4 mi fa
    do'2.
    la

    %51
    sib4~\tuplet 3/2 { sib8 re-! fa-! sib-![re-! sib-!] }
    si,2.
    do4~\tuplet 3/2 { do8 mi-! sol-! do-![mi-! do-!] }\mbreak

    %54
    mi,2.
    fa4~\tuplet 3/2 { fa8 la do la[fa la] }
    sib,4 do do,

    %57
    fa2.
    la
    sib4~\tuplet 3/2 { sib8 re-! fa-! sib-![re-! sib-!] }

    %60
    si,2.
    do4~\tuplet 3/2 { do8 mi-! sol-! do-![mi-! do-!] }\mbreak
    mi,2.

    %63
    fa4~\tuplet 3/2 { fa8 la do la[fa la] }
    sib,4 do do,
    fa2 r8 r16 fa'

    %66
    do4. r16 dod[[mi8. dod16]
    re4. r16 re[fa8. re16]
    sol,4. r16 sol[sib8. sol16]

    %69
    la2.~\p
    la~\mbreak
    la8 dod re fa mi re

    %72
    sol4 la la,
    re2 r8 r16 re\f
    mi4. r16 mi[sol8. mi16]

    %75
    fa4. r16 fa[la8. fa16]
    sol4. r16 sol[sib8. sol16]
    la,2.~

    %78
    la~\mbreak
    la8 dod re fa mi dod
    re8. sol16 la4 la,

    %81
    re2.
    r8 re'\p do sib la sol
    fad(la) sol(sib) la(do)

    %84
    sib8.\f do16 re4 re,
    sol2.
    r8 do\p sib la sol fa\mbreak

    %87
    mi(sol) fa(la) sol(sib)
    la8.\f sib16 do4 do,
    fa sol la

    %90
    sib,2.
    do\tasto~
    do

    %93
    do
    R2.*3
    r4 lab'\p sib

    %98
    do sib lab\mbreak
    reb do sib
    lab sol fa

    %101
    do2.
    R2.*3
    r4 lab'\p sib

    %106
    do sib lab\mbreak
    reb do sib
    lab sol fa

    %109
    do la sib
    mib reb do\mbreak
    sib sol lab

    %112
    reb do sib
    lab do lab
    reb2.

    %115
    mib2 mib'4~
    mib reb2~

    %117
    reb4 do2~
    do4 sib sol
    lab2 lab,4\mbreak

    %120
    reb mib mib,
    lab2 lab'4
    mib2 sib'4

    %123
    fa2 lab4
    sol fa2
    do2.\tasto~

    %126
    do
    fa
    sol8 sol-! \f fa-! mib-! re-! do-!

    %129
    sol2.\mbreak
    r4 sol' sol,
    do2.

    %132
    r4 do' do,
    sol fa' mib
    re do si

    %135
    do re mib
    fa-+ sol sol,
    do2.

    %138
    fa,
    sib\mbreak
    sol

    %141
    do\p\tasto~
    do~
    do~

    %144
    do
    do4 fa-!\f mi-!
    re-! do-! sib

    %147
    la sol fa
    sib do do,
    fa fa'2

    %150
    mi2.
    re
    do

    %153
    fa,4 fa' mi
    re do sib
    la sol fa

    %156
    sib do do,
    fa fa'2
    mi2.

    %159
    re
    do\mbreak
    fa16 fa, fa fa fa fa fa fa \once\stemUp fa fa' la fa

    %162
    mi mi, mi mi mi mi mi mi \once\stemUp mi mi' sol mi
    re re, re re re re re re \once\stemUp re re'fa re
    do do do do do do do do do do do do\mbreak

    %165
    fa fa, fa fa fa fa fa fa \once\stemUp fa fa' la fa
    mi mi, mi mi mi mi mi mi \once\stemUp mi mi' sol mi
    re re, re re re re re re \once\stemUp re re'fa re

    %168
    do do do do do do do do sib sib sib sib\mbreak
    la2.\p
    re

    %171
    sol,
    do
    fa,8.[fa'16 la8. do16 la8. fa16]

    %174
    sib,2.\mbreak
    do\f\tasto~
    do

    %177
    do8 re mi fa sol la\mbreak
    sib,4 sib' sib
    sib2 la4

    %180
    sib do do,
    fa, la2\p
    re2.

    %183
    sol,
    do
    fa,8.[fa'16 la8. do16 la8. fa16]

    %186
    sib,2.\mbreak
    do\f\tasto~
    do

    %189
    do8-! re-! mi-!fa-! sol-! la-!
    sib,4 sib' sib
    sib2 la4

    %192
    sib do do,
    fa,2.

}

VIIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2.
    s4 <6 _ 5>4 <_>
    <5 4> <6> <6>8 s
    <6 5>4 <4> <7>
    s2.
    s4 <6 _ 5>4 <_>
    <5 4> <6> <6>8 s
    <6 5>4 <4> <7>
    s2.
    <2>4 <5/> s
    s <6> s
    <6 5> 8 s <6>4 <6\\>
    s2.
    <2>4 <5/> s
    s <6> s
    <6 5> 8 s <6>4 <6\\>
    s s <6>
    <7> s <6>
    <7> s <6>
    <5 4> s <7>
    s s <6>
    <7> s <6>
    <7> s <6>
    <5 4>2 <7>4
    s2.
    <7>8 s <7>4 <5/>
    <7> <7>8 s <7> s
    <7>4 <5 4> <7>
    s2.
    <7>8 s <7>4 <5/>
    <7> s4 <7>8 s
    <7>4 <5 4> <7>
    s2.*3
    s4 <6 5>8 s <7 _!>4
    s2 <6>4
    <7> <6> s
    <7> <6> s
    <7>8 s <7>4 <7>
    s2.*3
    s4 <6 _ 5>8 <_> <7 _!>4
    s2 <6>4
    <7> <6> <6>
    <7> <6> s
    <7> <5/> s
    s2.
    <5/>2.
    <9>4 <8> s
    <5/> s s
    <9> <8> <8>
    <5/>4 s s
    <9> <8> <8>
    <6 5> <4> <7>
    s2.
    <5/>2.
    <9>4 <8> s
    <5/> s s
    <9> <8> s
    <5/> s s
    <9> <8> <8>
    <6 5> <4> <7>
    s2.<5 4>4 <3> 8 s16 <5/> <5/>8 <5/>
    <9> 4<8> <8>8 <8>
    <9 7>4 <6 _ 5> <_>
    <_+> <6 4> <7\+>
    <_+> <6 4> <7\+>
    <_+>4 <_+> <6+\\>
    <6 5> <4> <7 _+>
    s2.
    <9 7>8 s <7>4 <7>8 <7>
    <5\+>4 <6> <6>8 <6>
    <9 7>4 <6 _ 5> <_>8 <_>
    <_+>4 <6 4> <7\+>
    <_+> <6 4> <7\+>
    <_+>2 <6+\\>8 <6+\\>
    s8. <6 5>16 <4>4 <7 _+>
    s2.
    s8 <_+> <_+> <6> <6+\\> s
    <5/>4 s <6+\\>
    <6>8 s16 <6 5 _-> <4>4 <7 _+>
    s2.
    s8 <_> <_> <6> <6\\> s
    <5/>4 s <6\\>
    <6>8 s16 <6 5> <4>4 <7>
    s <6\\> <6>
    <9 7> s <6 5>
    s2.*2
    <_!>2.
    s2.*3
    s4 <6>8 s <6 5> s
    <6 4> s <6 5> s <6>4
    <6\\>4 <6 4>8 s <6 5> s
    <6>4 <6!\\> s
    <_!>2.
    s2.*3
    s4 <6>8 s <6 5> s
    <6 4> s <6 5> s <6>4
    <6\\>4 <6 4>8 s <6 5> s
    <6>4 <6!\\> s
    <_!>4 <5/> s
    <4\+> <6> <6!\\>
    s <5/> s
    <4\+> <6> <6!\\>
    <_>2 <_>4
    <9 7>4 s <6 5>
    s2.
    <2>4 <6 5> s
    <4\+> <6> s <2> <6> <5/>
    s2.
    <6 5>4 <4> <7>
    s2.
    <5 4>4 <3> s
    <5 4> <3> <6>
    <6!\\>2.
    s
    s
    <6 _ 5>4 <_> <_>
    <_!>4 <_!> <_!>8 s
    <_!>2.
    s4 <7 _!> s
    s2.
    s
    <_!>4 <4\+ _-> <6>
    <6!\\> s <7/>
    s <6!\\ 5/> <6>
    <6! 5> <4> <7 _!>
    s2.
    <_!>4 <6 4> <7 _!>8 s
    <_!>4 s s
    <_!> <6 4> <7 _!>
    s2.*4
    s4 <_> <_>
    <5> <6 4> <4\+>
    <6> <6\\> s
    <6 5> <4> <7>
    s s <6>
    <7> <6> s
    <7> <6> s
    <7>2.
    s4 <_> <_>
    <5> <6 4> <4\+>
    <6> <6\\> s
    <6 5> <4> <7>
    s s <6>
    <7> <6> s
    <7> <6> s
    <7>2.
    s
    <6>
    <7>4 <6!\\> <6!\\>8 <6!\\>
    <7->4 <7-> <7->
    s2.
    <6>
    <7>4 <6!\\> <6!\\>8 <6!\\>
    <7->4 <7-> <7->
    <5 3>2 <7 5-/>8 s
    <7 _+>4 <6 4> <7 _+>
    s2.
    <7>4 <6 4> <7>
    s s <5/>
    <9 7> s <6 5>
    s2.*2
    <_>4 <_>8 <6 5> <6\\> <6>
    <9 7> 4<6 _ 5> <_>
    <4\+> s <6>8 s
    <6 5>4 <4> <7>
    s4 <5> <7 5-/>8 s
    <7 _+>4 <6 4> <7 _+>
    s2.
    <7>4 <6 4> <7>
    s s <5/>
    <9 7> s <6 5>
    s2.*2
    <_>4 <_>8 <6 5> <6\\> <6>
    <9 7>4 <6 _ 5> <_>
    <4\+> s <6>8 s
    <6 5>4 <4> <7>

}

forma = {

    \time 3/4
    \key fa\major
    \tempo 2. = 50
    s2.*92\break
    \key fa\minor
    \once\override Score.RehearsalMark.extra-offset = #'(+5 . +1.0)
    \mark\markup\huge "[Minore]"
    s2.*52\break
    \key fa\major\once\override Score.RehearsalMark.extra-offset = #'(+5 . +1.0)
    \mark\markup\huge "M[aggio]re"
    s2.*49
    \bar"|."

}

VIIvlI = {
    \global
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    \global
    <<\VIIvlIIn \forma>>

}


VIIvla = {
    \global
    \clef alto
    <<\VIIvlan \forma>>

}

VIIbc = {
    \global
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Concert de simphonies Op. III n. II}
    composer = \markup \center-column{"A. Dauvergne (1713-1797)"}

}

\markup \huge\column {"[1.] Ouverture""  " }

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \Ivla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \Ibc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup \huge\column {"[2.] Minuetto grazioso"}

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \IIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup \huge\column {"[3.] Andante"}

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IIIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IIIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup \huge\column {"[4.] Andantino"}

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \IVvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \IVvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IVvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \IVbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup \huge\column {"[5.] Allegro"}

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \VvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \VvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \Vvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \Vbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup \huge\column {"[6.] Vivace"}

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \VIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \VIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \VIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \VIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

\markup \huge\column {"[7.] Chaconne"}

\score {

    \new ChoirStaff <<

        \new Staff  <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \VIIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \VIIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \VIIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \VIIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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
