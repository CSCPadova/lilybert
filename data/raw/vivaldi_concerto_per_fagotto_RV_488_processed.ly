\language "italiano"
	%********************************** VARIABILI
\version "2.24.0"

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


Iglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \terzine\con
}

IvlIn =  \relative do'' {

    R1
    r2 fa,4 do'
    fa fa, fa'8[mi16 re do sib la sol]

    %4
    \once\stemUp fa8 [la'16 sib do8 la] sol do, sol' do~
    do fa, re sib'~sib mi, do la'~
    la re, sib sol'~sol do, la fa'\mbreak

    %7
    mi sib'4 la8 sol la4 fa8
    mi sib'4 la8 sol la4 fa8
    mi sib sol'4 lab4. sol16 fa

    %10
    mi8 sib? sol'4 lab4. sol16 fa
    mi8[mi16 re do sib la sol] fa8[fa'16 mi re do sib la]
    sol8[sol'16 fa mi re do sib] la8 re sol,8.\tr fa16\mbreak

    %13
    fa4 r r2  %%% fin qui
    R1*11
    do'4 sol' do do,

    %26
    mi8 [re16 do si? la sol fa] sol'8[fa16 mi re do si la]
    sol8 sol' fa mi16 re mi fa sol fa mi fa sol mi
    re8 sol, re'sol~sol do, la fa'~

    %29
    fa si, sol mi'~mi la, fa re'~
    re sol, mi do'\mbreak la[la'16 sol fa mi re do]
    si8[si'16 la sol fa mi re] do8 [do'16 si la sol fa mi]

    %32
    re8[re'16 do si la sol fa] mi8 do' re,8.\tr do16
    do4 r r2
    R1*9

    %43
    la4 do mi mi,
    la'8[sol16 fa mi re do si] la4 r
    si'16[la sold fad mi re do si]\mbreak do4 la'^\markup\italic "1 Solo"~

    %46
    la  sol2 fa?4~
    fa mi fa(mi)
    re(mi) fa(mi)

    %49
    re16 fa mi re la' fa mi re mi4(fa)
    sol(fa)\mbreak mi(fa)
    sol(fa) mi16 sol fa mi sib'? sol fa mi

    %52
    fa4 sib!2 la4~
    la sol2 fa4
    mi2 re4 r\mbreak

    %55
    la\tu sol' fad2
    si,4 fa'! mi2
    la,4 mib' re sib'~

    %58
    sib la8 sol la4 r
    R1
    r2\mbreak sol8^\markup\italic "1 Solo" do, sol' do~

    %61
    do fa, re sib'~sib mi, do la'~
    la re, sib sol'~sol do, la fa'
    mi[sol16 fa sol8 la] sib[sol16 fa sol8 sib]

    %64
    la[fa16 mi fa8 la]\mbreak sol[sol16 fa sol8 sib]
    do fa,4 mib8 re sol4 fa8
    mi la4 sol8 fa sib4 la8

    %67
    sol16 mi la fa sib sol la fa sol4 r
    sol16 mi la fa sib sol la fa sol4 r\mbreak
    r4 r16 re mi fa sol4~sol16 mi fa sol

    %70
    la4~la16 fa sol la sib4~sib16 sol la sib
    do4~do16 la sib do la,4 r
    R1

    %73
    \once\stemUp fa8 [la'16 sib do8 la] sol do, sol' do~
    do fa, re sib'~sib mi, do la'~
    la re, sib sol'~sol do, la fa'\mbreak

    %76
    mi sib'4 la8 sol la4 fa8
    mi sib'4 la8 sol la4 fa8
    mi sib sol'4 lab4. sol16 fa

    %79
    mi8 sib? sol'4 lab4. sol16 fa
    mi8[mi16 re do sib la sol] fa8[fa'16 mi re do sib la]
    sol8[sol'16 fa mi re do sib] la8 re sol,8.\tr fa16\mbreak

    %82
    fa4\fermata r r2

}

IvlIIn = \relative do'' {

    R1
    fa,4 do' fa fa,
    fa'8[mi16 re do sib la sol] la'8[sol16 fa mi re do sib]

    %4
    la8[fa'16 sol la8 fa] mi4 r8 mi
    fa sib~sib16 la sol fa mi8 la~la16 sol fa mi
    re8 sol~sol16 fa mi re do8 fa~fa16 la sol fa\mbreak

    %7
    sol8 sol4 fa8 mi do'4 la8
    sol sol4 fa8 mi do'4 la8
    sol sol, mi'4 fa4. mi16 re

    %10
    do8 sol mi'4 fa4. mi16 re
    do8 do mi do la re fa re
    sib mi sol mi do16 la sol fa mi8.\tr  fa16\mbreak

    %13
    fa4 r r2  %%% fine qui
    R1*11
    r2 do'4 sol'

    %26
    do do, mi8 re16 do si? la sol fa
    mi8 mi' re do16 si? do re mi re do re mi do
    si?4 r8 si do fa~fa16 mi re do

    %29
    si8 mi~mi16 re do si la8 re\parenthesize ~ re16 do si la
    sol8 do~do16 mi re do\mbreak fa8 fa la fa
    re sol si sol mi la do la

    %32
    fa si re si sol16 mi re do si8.\tr do16
    do4 r r2
    R1*9

    %43
    r2 la4 do
    mi mi, la'16[sol fa mi re do si la]
    sold'16[ fad mi re do si la sold]\mbreak la4 r

    %46
    re2^\markup\italic "1 Solo" do
    si?4 do re(do)
    si?(do) re(do)

    %49
    si?16 re do si fa'8 sib! dod,4(re)
    mi(re)\mbreak dod(re)
    mi(re) dod16 mi re dod sol' mi re dod

    %52
    re2 dod4 do
    si sib8 re dod4 re~
    re dod re r\mbreak

    %55
    r2 re8\tu la4 la'8
    fa? re4 si8 do sol4 sol'8
    mib do4 la8 sib? fa4 fa'8

    %58
    sol4 fa8 mi? fa4 r
    R1
    r2\mbreak mi8^\markup\italic "1 Solo" sol, do mi

    %61
    fa sib~sib16 la sol fa mi8 la~la16 sol fa mi
    re8 sol~sol16 fa mi re do8 fa~fa16 la sol fa
    sol8[mi16 re mi8 fa] mi8[mi16 re mi8 sol]

    %64
    fa la,16 sol la8 fa'\mbreak mi[mi16 re mi8 sol]
    fa la, do la fa si? re si
    sol do mi dod la re fa re

    %67
    mi16 do fa do sol' do, fa do mi4 r
    mi16 do fa do sol' do, fa do mi4 r\mbreak
    r4 r16 sib do re mi4~mi16 do re mi

    %70
    fa4~fa16 re mi fa sol4~sol16 mi fa sol
    la4~la16 fa sol la la,4 r
    R1

    %73
    la8[fa'16 sol la8 fa] mi4 r8 mi
    fa sib~sib16 la sol fa mi8 la~la16 sol fa mi
    re8 sol~sol16 fa mi re do8 fa~fa16 la sol fa\mbreak

    %76
    sol8 sol4 fa8 mi do'4 la8
    sol sol4 fa8 mi do'4 la8
    sol sol, mi'4 fa4. mi16 re

    %79
    do8 sol mi'4 fa4. mi16 re
    do8 do mi do la re fa re
    sib mi sol mi do16 la sol fa mi8.\tr  fa16\mbreak

    %82
    fa4\fermata r r2

}

Ivlan =  \relative do' {

    r2 fa,4 do'
    fa fa, fa'8 [mi16 re do sib la sol]
    fa8 do' fa do do4 r8 do

    %4
    do4 do do r8 do'
    la re, fa4 sol8 do, mi4
    fa8 sib, re4 mi8 la, do4\mbreak

    %7
    do do do do
    do do do do
    do8 do do do re re re re

    %10
    sol, sol do mi re re re re
    sol,4 sol'8 mi re4 la'8 fa
    mi4 sib'8 sol fa16 fa mi re do8 do\mbreak

    %13
    la4 r r2
    R1*12
    do4 sol' do do,

    %27
    sol si' sol2
    sol4 r8 sol mi la, do4
    re8 sol, si4 do8 fa, la4

    %30
    si8 mi, sol4\mbreak do do'8 la
    sol4 re'8 si sol4 mi'8 do
    \parenthesize sol4 fa mi8 sol sol sol

    %33
    mi4 r r2
    R1*10
    la,4 do mi mi,

    %45
    mi'2\mbreak mi4 r
    R1*8
    r2 fa4 la\mbreak

    %55
    dod2 la
    re,8 si4 sol8 sol'2
    do,8 la4 fa8 fa'2

    %58
    mi do4 r
    R1*14
    do4 do do r8 do'

    %74
    la re, fa4 sol8 do, mi4
    fa8 sib, re4 mi8 la, do4\mbreak
    do do do do

    %77
    do do do do
    do8 do do do re re re re
    sol, sol do mi re re re re

    %80
    sol,4 sol'8 mi re4 la'8 fa
    mi4 sib'8 sol fa16 fa mi re do8 do\mbreak
    la4\fermata r r2

}

Ifgn = \relative do {

    fa,4 do' fa fa,
    fa'8[mi16 re do sib la sol] fa8 fa la fa
    r fa la fa fa4 do'

    %4
    fa fa, do' r8 do
    re16[mi fa sol la sib do re] do,[re mi fa sol la sib do]
    sib,[do re mi fa sol la sib] la, [sib  do re mi fa sol la]\mbreak

    %7
    do,4 do do do
    do do do do
    do8 do do do si si si si

    %10
    do do do do si si si si
    do2 re
    mi fa8 sib do do,\mbreak

    %13
    fa4 do' fa fa,
    do sib' la fa,
    fa' mib' re sib,

    %16
    sol' fa' mi? do,
    sib'16 mi, re do sib' mi, re do la' mi re do la' mi re do
    sol' mi re do sol' mi re do fa mi fa sol la sol la sib\mbreak

    %19
    do sib do re mi re mi do fa sol fa mi re mi re do
    si do si la sol la sol fa mi fa mi re do re mi fa
    sol4 r fa16 si, la sol fa' si, la sol

    %22
    mi' si la sol mi' si la sol re' si la sol re' si la sol
    do4 do'\mbreak si, re'
    la, do' sol, si'

    %25
    do,8[do16 re mi8 do] r do16[re mi8 do]
    do4 r do, r
    do' sol' do do,

    %28
    sol' r8 sol, la16 si do re mi fa sol la
    sol,[la si do re mi fa sol] fa,[sol la si do re mi fa]
    mi,[fa sol la si do re mi]\mbreak fa2

    %31
    sol la
    si do8[do,] sol' sol,
    do[do16 si do8 do'] si[sol,16 mi sol8 si']

    %34
    do[do,16 si do8 do'] fad,[re,16 do re8 la'']
    sol [sol,16 fad sol8 re''] sold,[mi,16 re mi8 si'']\mbreak
    do la,16 sold la8\noBeam r do'16[mi re mi do mi si mi]

    %37
    la, mi' sol, mi' fa, mi' mi, mi' re,[mi fa sol la si do re]
    si re do re si re la re sol, re' fa, re' mi, re' re, re'
    do,[re mi fa sol la si do] la do si do la do sol do

    %40
    fa, do' mi, do' re, do' do, do'\mbreak si,[do re mi fad sold la si]
    sold8 mi r si' \tuplet 3/2 { do16(si la) } mi'8\noBeam \tuplet 3/2 { sold,16(fad mi) } re'8\noBeam
    \tuplet 3/2 { do16(si la) } mi'8\noBeam \tuplet 3/2 { sold,16(fad mi) } re'8\noBeam do la re, mi

    %43
    la,4 r la r
    la r la do
    mi mi,\mbreak la'16 do si do la do si la

    %46
    si la si do si do re mi la, sol la si la si do re
    sol, si la sol do mi, re do sol si' la sol do mi, re do
    sol si' la sol do mi, re do sol si' la sol do mi, re do

    %49
    sol4 r la16 dod' si la re fa, mi re
    la dod' si la re fa, mi re\mbreak la dod' si la re fa, mi re
    la dod' si la re fa, mi re la4 r

    %52
    re16 fa mi re re' fa, mi re mi sol fa mi fad la sol fad
    sol si do re sol, sib? la sol la, dod si la re fa mi re
    sol sib? la sol la8 la, re4 fa

    %55
    la la, re do'
    sol2 do,4 sib'
    fa2 sib,4 sib'

    %58
    do,2 fa4 do'
    fa fa, do sib'
    la fa,\mbreak do' r8 do %%% p. 7 secondo sistema

    %61
    re16[mi fa sol la sib do re] do,[re mi fa sol la sib do]
    sib,[do re mi fa sol la sib] la,[sib do re mi fa sol la]
    do,4 r16 do' sib la sib sol \once\stemUp do,,8 r16 sib'' la sol

    %64
    la fa \once\stemUp do,8 r16 do'' sib la\mbreak sib sol \once\stemUp do,,8 r16 sib'' la sol
    la16 fa mi fa la, fa' mi fa sib, sol' fa sol si, sol' fa sol
    do, la' sol la dod, la' sol la re, sib' la sib re, sib' la sib

    %67
    do,?4 r do'16 do, sib' do, la' do, sol' do,
    do4 r do'16 do, sib' do, la' do, sol' do,\mbreak
    do sol' la sib sib4~sib16 la sib do do4~

    %70
    do16 sib do re re4~re16 do re mib mib4~
    mib16 re mi fa fa4~fa8[mi16 re do sib la sol]
    la fa sib sol la fa sib sol la fa do' fa, sol8.\tr fa16

    %73
    fa4 fa, do' r8 do
    re16[mi fa sol la sib do re] do,[re mi fa sol la sib do]
    sib,[do re mi fa sol la sib] la, [sib  do re mi fa sol la]\mbreak
    do,4 do do do

    %77
    do do do do
    do8 do do do si si si si
    do do do do si si si si

    %80
    do2 re
    mi fa8 sib do do,\mbreak
    fa,4\fermata r r2

}

Ibcn = \relative do {

    fa,4 do' fa fa,
    fa'8[mi16 re do sib la sol] fa8 fa la fa
    r fa la fa fa4 do'

    %4
    fa fa, do' r8 do  % da qui
    re16[mi fa sol la sib do re] do,[re mi fa sol la sib do]
    sib,[do re mi fa sol la sib] la, [sib  do re mi fa sol la]\mbreak

    %7
    do,4 do do do
    do do do do
    do8 do do do si si si si

    %10
    do do do do si si si si
    do2 re
    mi fa8 sib do do,\mbreak

    %13
    fa,4 r fa8 sol la fa
    do' re mi do fa, sol la fa
    fa sol la fa sib do re sib

    %16
    si do re si do re mi do
    do4 do do do
    do do fa re\mbreak

    %19
    do sib la r
    sol r do4. si16 la
    sol8 la si la sol4 sol

    %22
    sol sol sol sol
    do do\mbreak si si
    la la sol sol

    %25
    do8[do16 re mi8 do] r do16[re mi8 do]
    do4 r do r
    do sol' do do,

    %28
    sol' r8 sol, la16 si do re mi fa sol la
    sol,[la si do re mi fa sol] fa,[sol la si do re mi fa]
    mi,[fa sol la si do re mi]\mbreak fa2

    %31
    sol la
    si do8[do,] sol' sol,
    do4 r8 do sol4 r8 sol

    %34
    do4 r8 do re4 r8 fad,
    sol4 r8 re' mi4 r8 sold,\mbreak
    la si do la do' re do si

    %37
    la sol fa mi re4 r
    si'8 do si la sol fa mi re
    do4 r la'8 si la sol

    %40
    fa mi re do\mbreak si4 r8 re
    mi fad sold mi la la mi[mi]
    la la mi[mi] la la re, mi

    %43
    la,4 r la r
    la r la do
    mi mi,\mbreak la r

    %46
    R1*3
    sol'4 fa8 sol la,4 r
    R1

    %51
    r2 la8 la la la
    re4 r r2
    R1

    %54
    r2 re4 fa\mbreak
    la la, re do'
    sol2 do,4 sib'

    %57
    fa2 sib,4 sib'
    do,2 fa4 r
    fa,8 sol la fa do' re mi do

    %60
    fa, sol la fa\mbreak do'4 r
    R1*12
    fa4 fa, do' r8 do

    %74
    re16[mi fa sol la sib do re] do,[re mi fa sol la sib do]
    sib,[do re mi fa sol la sib] la, [sib  do re mi fa sol la]\mbreak
    do,4 do do do

    %77
    do do do do
    do8 do do do si si si si
    do do do do si si si si

    %80
    do2 re
    mi fa8 sib do do,\mbreak
    fa,4\fermata r r2

}

Ibfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 4/4
  \tempo 2 = 60
  s1*82
  \bar"|."


}

IvlI = {
  \Iglobal
  %\notypeset
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

Ifg = {
  \Iglobal
  \clef bass
  <<\Ifgn \forma>>

}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \terzinequarto
}

IIvlIn =  \relative do'' {

    R2.*8
    r8 r16 sol'[sol8. mi16 mi8. mi16]
    fa2.~

    %11
    fa8.[la16 la8. fad16 fad8. fad16]
    sol2.~
    sol8. mi16 re4.\tr do8

    %14
    do4 r r
    R2.*11
    r8 r16 la' [la8. mi16 mi8. re16]

    %27
    re2.
    do8. re16 si4.\tr la8
    la4 r r

    %30
    R2.*12
    r8 r16 fa'[fa8. mib16 mib8. re16]
    re2.~

    %44
    re8.[sib'16 sib8. sol16 sol8. fa16]
    mi?2.~
    mi8.[do'16 do8. sol16 sol8. la16]

    %47
    la8. sib16 sol4.\tr fa8
    fa2.\fermata

}

IIvlIIn = \relative do'' {

    R2.*8
    r8 r16 mi[mi8. do16 do8. sib!16]
    la2.~

    %11
    la8. fa'16 fad8.[re16 re8. do16]
    si2.
    do8. do16 si4.\tr do8

    %14
    do4 r r
    R2.*11
    r8 r16 mi[mi8. do16 do8. si16]

    %27
    si?2.
    la8. si16 sold4.\tr la8
    la4 r r

    %30
    R2.*12
    r8 r16 do[do8. do16 do8. sib?16]
    sib2.~

    %44
    sib8.[fa'16 fa8. re16 re8. do16]
    do2.~
    do8.[sol'16 sol8. mi16 mi8. fa16]

    %47
    fa8. sol16 mi4.\tr fa8
    fa2.\fermopz

}

IIvlan =  \relative do' {

    R2.*9
    r8 r16 do'[do8. la16 la8. fa16]
    la2.

    %12
    r8 r16 re[re8. si16 si8. sol16]
    mi8. sol16 sol4 sol
    mi r r

    %15
    R2.*12
    r8 r16 re'[re8. si16 si8. sold16]
    mi8. fa16 si,4. mi8

    %29
    do4 r r
    R2.*13
    r8 r16 fa [fa8. fa16 fa8. fa16]

    %44
    fa2.
    r8 r16 mi[sol8. sol16 sol8. sol16]
    sol4 mi2

    %47
    do8. re'16 sol,4. do8
    la2.\fermata

}

IIfgn = \relative do {

    do'4 \appoggiatura do8 re4. do8
    sib4. do8 sib4
    \tuplet 3/2 { sib8(do re mi[fa sol)] } sol8. sib,16

    %4
    sib8-!\tr(la-! la-! la-! la-! la-!)
    \senza \tuplet 3/2 { la8(sib do) re[(mi fa)] fa(re do) }
    si-.(fa-! fa-! fa-! re'-! fa,-!)

    %7
    mi-!(do'-! do-! do-! sol'-! do,-!)
    fa re si4.\tr do8\mbreak
    do4 r r

    %10
    \clef bass \key fa\major r8 r16 la[la8. fa16 fa8. re16]
    re2.
    r8 r16 sol[sol8. si,16 si8. sol16]

    %13
    do8. do16 sol'4 sol,
    \clef tenor \key fa\major do'4 do(re8.) mib16
    \appoggiatura sol,8 fad4. mi8 re4

    %16
    do'8(la) mib'(do) fad(do)\mbreak
    sib4. la8 sol4
    re' re(mi?8.) fa16

    %19
    \appoggiatura la,8 sold4. fad8 mi4
    si'8(sold) re'[(si)] fa'? re
    \appoggiatura re8 do4. si8 la4

    %22
    mi' re8(do) si(la)
    sib!(la la la la la)
    mi'4 re8(do) si(la)\mbreak

    %25
    fa'4 sold,2
    la4 \clef bass \key fa\major r r
    r8 r16 si[si8. sold16 sold8. mi16]

    %28
    la8. re,16 mi4 mi,
    \clef tenor \key fa\major do''4 \appoggiatura do8 re4. do8
    sib?4. do8 sib4

    %31
    \tuplet 3/2 { sib8 do re mi[fa sol] } sol8. sib,16\mbreak
    sib2\tr la4
    \tuplet 3/2 { fa8 sol la la[sib do] do re mib }

    %34
    re-!(sib-! sib-! sib-! sib-! sib-!)
    \tuplet 3/2 { sol la si si[do re] re mi? fa }
    mi-!( do-! do-! do-! do-! do-!)\mbreak

    %37
    mi-!(sib?-! sib-! sib-! sib-! sib-!)
    fa'4 fa, mib'
    \con \tuplet 3/2 { re8(do sib) } fa'2

    %40
    \tuplet 3/2 { mi?8(re do) } sib2
    \senza \tuplet 3/2 { la8 sol fa } sol4. fa8
    fa4 r r

    %43
    \clef bass \key fa\major r8 r16 sib [sib8. re,16 re8. sib16]
    sib2.
    r8 r16 do'[do8. mi,16 mi8. do16]

    %46
    do2.
    fa8. sib16 do4 do,
    fa2.\fermopz

}

IIbcn = \relative do {

    fa2.
    sol
    mi

    %4
    fa
    sol
    sol

    %7
    do,
    la'8 fa sol4 sol,\mbreak
    do r r

    %10
    r8 r16 la'[la8. fa16 fa8. re16]
    re2.
    r8 r16 sol[sol8. si,16 si8. sol16]

    %13
    do8. do16 sol'4 sol,
    do2.
    re

    %16
    fad\mbreak
    sol
    fa?

    %19
    mi
    sold
    la

    %22
    la,2 do4
    re do2
    do2.\mbreak

    %25
    re4 mi mi,
    la r r
    r8 r16 si'[si8. sold16 sold8. mi16]

    %28
    la8. re,16 mi4 mi,
    la fa'2
    sol2.

    %31
    mi4 do2\mbreak
    fa8 fa fa sol la sol
    fa2.

    %34
    sib,
    si
    do~

    %37
    do\mbreak
    la
    sib2 si4

    %40
    do2 mi4
    fa do do,
    fa r r

    %43
    r8 r16 sib' [sib8. re,16 re8. sib16]
    sib2.
    r8 r16 do'[do8. mi,16 mi8. do16]

    %46
    do2.
    fa8. sib16 do4 do,
    fa2.\fermopz

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key fa\major
  \time 3/4
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 2 = 50
  s2.*48
  \bar"|."

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

IIfg = {
  \IIglobal
  \clef tenor
  <<\IIfgn \forma>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>

}



IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn =  \relative do'' {

    do4 do8. re16
    sib4 sib8. do16
    la4 la8. sib16

    %4
    sol4 fa
    fa' fa8. la16
    re,4 re8. fa16

    %7
    si,4 si8. sol'16
    \appoggiatura fa8 mi2
    sol8 [sol16 sol sol sol sol sol]\mbreak

    %10
    la,8[do'16 do do do do do]
    si,8[si'16 si si si si si]
    do4 r

    %13
    mi,8 [sol16 sol sol sol sol sol]
    la,8[re16 re re re re re]
    sol,8[sol'16 sol sol sol sol sol]

    %16
    mi4 r
    R2*6
    r4 fa~

    %24
    fa mi ~
    mi re
    do r

    %27
    do2\mbreak
    re
    mi

    %30
    fa
    sol4. la8
    sol sol, sol'4~

    %33
    sol fa~
    fa mi~
    mi re~

    %36
    re do~\mbreak
    do si8 re
    mi4 do'~

    %39
    do si
    do sol8. la16
    fa4 fa8. sol16

    %42
    mi4 mi8. fa?16
    re4 do
    la' la8. sib16

    %45
    sol4 sol8. la16
    mi4 mi8. sol16
    fa4 r

    %48
    re8[fa16 fa fa fa fa fa]\mbreak
    sol,8[sol'16 sol sol sol sol sol]
    dod,8[la'16 la la la la la]

    %51
    fa4 r
    fa,8[re'16 re re re re re]
    sib8[sol'16 sol sol sol sol sol]

    %54
    dod,8[la'16 la la la la la]
    fa4 r
    R2*8

    %64
    fad2~
    fad
    sol4 r

    %67
    si,2~
    si
    do4 r\mbreak

    %70
    R2
    fa2~
    fa

    %73
    mib~
    mib
    re~

    %76
    re
    R2*3\mbreak
    re4 re8. mib16

    %81
    do4 do8. re16
    sib4 sib8. do?16
    la4 sol

    %84
    la'4 la8. sib16
    sol4 sol8. la16
    fa4 fa8. sol?16
    mi4 re

    %88
    sib'4 sib8. mi,16
    mib4 mib8. do16
    fa4 fa8. do16

    %91
    \appoggiatura do8 re2
    sib8[re16 re re re re re]\mbreak
    mib,8[mib'16 mib mib mib mib mib]

    %94
    la,8[fa'16 fa fa fa fa fa]
    re4 r
    R2*15

    %111
    do4 do8. re16\mbreak
    sib4 sib8. do16
    la4 la8. sib16

    %114
    sol4 fa
    do'' do8. re16
    sib4 r

    %117
    sib sib8. do16
    la4 r
    la la8. la16

    %120
    sol4 r
    fa fa8. la16\mbreak
    sib,4 sib8. sib'16

    %123
    mi,4mi8. do'16
    la4 r
    fa fa8. la16

    %126
    sib,4 sib8. sib'16
    mi,4 mi8. do'16
    fa,4 r

    %129
    R2*3
    fa8[la16 la la la la la]
    sib,8[sib'16 sib sib sib sib sib]

    %134
    mi,8[do'16 do do do do do]
    la4 r
    fa8[la16 la la la la la]

    %137
    sib,8 [sib'16 sib sib sib sib sib]
    mi,8[do'16 do do do do do]
    la2\fermata

}

IIIvlIIn = \relative do'' {

    la4 la8. sib16
    sol4 sol8. sol16
    fa4 fa8. sol16

    %4
    mi4 do
    la' la8. la16
    fa'4 fa8. la16

    %7
    re,4 re8. si16
    do2
    mi8[mi16 mi mi mi mi mi]\mbreak

    %10
    fa,8[fa'16 fa fa fa fa fa]
    re8[fa16 fa fa fa fa fa]
    mi4 r

    %13
    do8[mi16 mi mi mi mi mi]
    fa,8[la16 la la la la la]
    si8[re16 re re re re re]

    %16
    do4 r
    R2*7
    sib'2

    %25
    la4. fa8
    sol4 r
    r8 la,[fa' la,]\mbreak

    %28
    r sib[fa' sib,]
    r do[la' do,]
    r re[sib' re,]

    %31
    r mi[do' fa,]
    re si r4
    do'2

    %34
    si
    la
    sol\mbreak

    %37
    re4. si8
    sol4 r8 do
    re2

    %40
    mi4 mi8. fa16
    re4 re8. re16
    do4 do8. do16

    %43
    si4 sol
    mi' mi8. sol16
    mi4 mi8. mi16

    %46
    dod4 dod8. dod16
    re4 r
    la8[re16 re re re re re]\mbreak

    %49
    sib8[re16 re re re re re]
    la8[dod16 dod dod dod dod dod]
    re4 r

    %52
    la8[la16 la la la la la]
    sol8[sib16 sib sib sib sib sib]
    la8 [dod16 dod dod dod dod dod]

    %55
    re4 r
    R2*8
    re2~

    %65
    re
    re4 r
    sol,2~

    %68
    sol
    sol4 r\mbreak
    sol'2

    %71
    la
    sib
    sol

    %74
    lab
    fa
    sol

    %77
    R2*3\mbreak
    sib,4 sib8. do16
    la4 la8. sib16

    %82
    sol4 sol8. la16
    fad4 re
    fa'?4 fa8. fa16

    %85
    mi4 mi8. mi16
    re4 re8. re16
    dod4 sib

    %88
    fa'4 fa8. fa16
    sol4 sol8. sol16
    do,4 do8. la16

    %91
    fa2
    fa8[sib16 sib sib sib sib sib]\mbreak
    sol8[sol16 sol sol sol sol sol]

    %94
    do8[la16 la la la la la]
    sib4 r
    R2*15

    %111
    la4 la8. sib16\mbreak
    sol4 sol8. sol16
    fa4 fa8. fa16

    %114
    mi4 do
    la'' la8. la16
    sol4 r

    %117
    sol sol8. sol16
    fa4 r
    fa fa8. fa16

    %120
    mi4 r
    do do8. fa16\mbreak
    re4 re8. fa16

    %123
    sol,4 sol8. mi'16
    fa4 r
    do do8. fa16

    %126
    re4 re8. fa16
    sol,4 sol8. mi'16
    fa4 r

    %129
    R2*3
    do8[fa16 fa fa fa fa fa]
    re8[fa16 fa fa fa fa fa]

    %134
    do8[mi16 mi mi mi mi mi]
    fa4 r
    do8[fa16 fa fa fa fa fa]

    %137
    re8[fa16 fa fa fa fa fa]
    do8[mi16 mi mi mi mi mi]
    fa2\fermata

}

IIIvlan =  \relative do' {

    fa4 fa8. fa16
    re4 mi8. mi16
    do4 re8. re16

    %4
    mi4 la,
    la' la8. la16
    la4 la8. la16

    %7
    sol4 sol8. sol16
    sol2
    do8[do16 do do do do do]\mbreak

    %10
    do,8[do'16 do do do do do]
    si8[re,16 re re re re re]
    do4 r

    %13
    sol'8[sol16 sol sol sol mi mi]
    do8[fa16 fa fa fa fa fa]
    re8[si'16 si si si si si]

    %16
    sol4 r
    R2*23
    do4 do8. do16

    %41
    la4 si8. si16
    sol4 la8. la16
    sol4 mi

    %44
    la la8. la16
    la4 la8. la16
    la4 la8. la16

    %47
    la4 r
    fa8[la16 la la la la la]\mbreak
    sol8[sib16 sib sib sib sib sib]

    %50
    mi,8[mi16 mi mi mi mi mi]
    re4 r
    fa8[fa16 fa fa fa fa fa]

    %53
    re8[sol16 sol sol sol sol sol]
    mi8[mi16 mi mi mi mi mi]
    re4 r

    %56
    R2*24
    sol4 sol8. sol16
    fad4 fad8. fad16

    %82
    re4 mi8. mi16
    fad4 sol
    la4 la8. la16

    %85
    dod4 dod8. dod16
    la4 si8. si16
    mi,4 fa

    %88
    re re8. re16
    sol4 sol8. sol16
    la4 fa8. fa16

    %91
    fa2
    re8[re16 re re re re re]\mbreak
    sib8[sib16 sib sib sib sib sib]

    %94
    la8[do16 do do do do do]
    re4 r
    R2*15

    %111
    fa4 fa8. fa16\mbreak
    re4 mi8. mi16
    do4 re8. re16

    %114
    mi4 fa
    fa fa8. fa16
    sol4 r

    %117
    do, do8. do16
    fa4 r
    si, si8. si16

    %120
    do4 r
    la'la8. la16\mbreak
    fa4 fa8. fa16

    %123
    mi4 mi8. sol16
    fa4 r
    la la8. do16

    %126
    fa,4 fa8. fa16
    mi4 mi8. sol16
    la4 r

    %129
    R2*3
    la8[la16 la la la la la]
    fa8[fa16 fa fa fa sib sib]

    %134
    sol8[sol16 sol sol sol sol sol]
    fa4 r
    la8[la16 la la la la la]

    %137
    fa8[fa16 fa fa fa sib sib]
    sol8[sol16 sol sol sol sol sol]
    fa2\fermata

}

IIIfgn = \relative do {

    fa4 fa8. fa16
    sol4 do,8. do16
    fa4 si,8. si16

    %4
    do4 fa,
    fa' fa8. fa16
    fa4 fa8. fa16

    %7
    sol4 sol,8. sol16
    do2
    do8[do16 do do do do do]\mbreak

    %10
    fa8[fa16 fa fa fa fa fa]
    sol8[sol,16 sol sol sol sol sol]
    do4 r

    %13
    do8[do16 do do do do do]
    fa8[fa16 fa fa fa fa fa]
    sol8[sol,16 sol sol sol sol sol]

    %16
    do4 r
    fa16 mi fa sol la sol la sib
    do sib do re mi re mi do\mbreak

    %19
    fa mi re do re do sib la
    sib la sol fa sol fa mi re
    mi re do sib do sib la sol

    %22
    la8 fa r fa'
    la16 do sib do la sol fa la
    sol sib la sib sol fa mi sol

    %25
    fa la sol la fa mi re fa
    mi8 do r do
    la16 fa' mi fa la fa mi fa\mbreak

    %28
    sib, sol' fa sol sib sol fa sol
    do, la' sol la do la sol la
    re, sib' la sib re sib la sib

    %31
    mi, do' si do mi do si la
    si8 sol r sol
    la16[sol fa sol la si do re]

    %34
    sol,[fa mi fa sol la si do]
    fa,[mi re mi fa sol la si]
    mi, re do re mi re mi fa\mbreak

    %37
    sol fa sol la si la si sol
    do re do si la si la sol
    fa la sol fa sol8 sol,

    %40
    do4 do8. do16
    re4 sol,8. sol16
    do4 fad8. fad16

    %43
    sol4 do,
    dod' dod8. dod16
    dod?4 dod8. dod16

    %46
    la4 la8. la16
    re4 r
    re,8[re16 re re re re re]\mbreak

    %49
    sol8[sol16 sol sol sol sol sol]
    la8[la,16 la la la la la]
    re4 r

    %52
    re8[re16 re re re re re]
    sol,8[sol'16 sol sol sol sol sol]
    la8 [la,16 la la la la la]

    %55
    re8 fa4 la8~
    la8 re~re16 fa, mi re
    la8 dod4 mi8~

    %58
    mi8 sol~sol16 sib la sol\mbreak
    fad8 la4 do8~
    do mib~mib16 do sib la

    %61
    sol,8 sib4 re8~
    re sol~sol16 sib la sol
    fad8 re r la'

    %64
    \tuplet 3/2 { re do re } re mib
    \tuplet 3/2 { do sib do } do re
    \appoggiatura do8 sib4 r8 re,

    %67
    \tuplet 3/2 { sol fa sol } sol lab
    \tuplet 3/2 { fa mib fa } fa sol
    \appoggiatura fa mib4 r8 sol\mbreak

    %70
    mib'2~
    mib16[re do sib la sol fa mib]
    re do sib8 re'4~

    %73
    re16[do sib la sol fa mib re]
    do sib lab8 do'4~
    do16[sib la? sol fa mib re do]

    %76
    sib la sol8 r sol'
    fad16[(sol) la(sol) sib(la) do(sib)]
    mib4(re8) do

    %79
    sib la16 sol re do sib la\mbreak
    sol4 sol'8. sol16
    la4 re,8. re16

    %82
    sol4 dod,8. dod16
    re4 sol,
    re' re8. re16

    %85
    mi4 la,8. la16
    re4 sold,8. sold16
    la4 re,

    %88
    re' re8. re16
    do4 do8. do16
    la4 la8. fa16

    %91
    sib2
    sib8[sib16 sib sib sib sib sib]\mbreak
    mib8[mib16 mib mib mib mib mib]

    %94
    fa8[fa16 fa fa fa fa fa]
    sib,la sib do re do re mib
    fa mib fa sol la sol la sib

    %97
    do sib do re mib re mib do
    re8 sib r sib
    sib,8[sib'16 la sib8 re]

    %100
    re8 do r do
    \once\stemUp la,8[do'16 sib do8 mib]
    mib? re r re\mbreak

    %103
    \once\stemUp sib,8[re'16 do re8 fa]
    mib?16 fa mib re do re do sib
    la8 fa r do'

    %106
    fa,16 mi? fa sol la sol la sib
    do sib do re mi re mi do
    fa mi re do re do sib la

    %109
    sib la sol fa sol fa mi re
    mi re do sib do sib la sol
    la8 fa fa'8. fa16\mbreak

    %112
    sol4 do,8. do16
    fa4 si,8. si16
    do4 fa,

    %115
    fa'16 mi fa sol la sol la fa
    sol fa sol la sib la sib sol
    do, sib do re mi re mi do

    %118
    fa mi fa sol la sol la fa
    si, la si do re do re si
    do4 r

    %121
    fa16 mi fa sol la sol la fa\mbreak
    sib,? la sib do re do re sib
    do sib do re mi re mi do

    %124
    fa,4 r
    fa'16 mi fa sol la sol la fa
    sib, la sib do re do re sib

    %127
    do sib do re mi re mi do
    fa,4 r16 do'' re mi
    fa[mi re do sib la sol fa]

    %130
    mi[re do sib la sol fa mi]\mbreak
    fa fa' la sib do8 do,
    fa,8[fa'16 fa fa fa fa fa]

    %133
    sib,8[sib16 sib sib sib sib sib]
    do8[do16 do do do do do]
    fa4 r

    %136
    fa8[fa16 fa fa fa fa fa]
    sib,8[sib16 sib sib sib sib sib]
    do8[do16 do do do do do]

    %139
    fa,2\fermata

}

IIIbcn = \relative do {

    fa4 fa8. fa16
    sol4 do,8. do16
    fa4 si,8. si16

    %4
    do4 fa,
    fa' fa8. fa16
    fa4 fa8. fa16

    %7
    sol4 sol,8. sol16
    do2
    do8[do16 do do do do do]\mbreak

    %10
    fa8[fa16 fa fa fa fa fa]
    sol8[sol,16 sol sol sol sol sol]
    do4 r

    %13
    do8[do16 do do do do do]
    fa8[fa16 fa fa fa fa fa]
    sol8[sol,16 sol sol sol sol sol]

    %16
    do4 r
    fa mi
    do do8 sib\mbreak

    %19
    la fa r4
    R2*2
    fa'8[sol la sol]

    %23
    fa4 r
    R2*2
    do8[re mi do]

    %27
    la4 r\mbreak
    sib r
    do r

    %30
    re r
    mi r8 fa
    sol[fa mi do]

    %33
    R2*7
    do4 do8. do16
    re4 sol,8. sol16

    %42
    do4 fad8. fad16
    sol4 do,
    dod' dod8. dod16
    dod?4 dod8. dod16

    %46
    la4 la8. la16
    re4 r
    re,8[re16 re re re re re]\mbreak

    %49
    sol8[sol16 sol sol sol sol sol]
    la8[la,16 la la la la la]
    re4 r

    %52
    re8[re16 re re re re re]
    sol,8[sol'16 sol sol sol sol sol]
    la8 [la,16 la la la la la]

    %55
    re4 re
    re re
    la la

    %58
    la la\mbreak
    re re
    re re

    %61
    sol, sol
    sol sol
    re'8[mi fad re]

    %64
    R2*2
    sol8[re sib sol]
    R2*2

    %69
    do8[re mib do]\mbreak
    do[re mib do]
    fa4 r

    %72
    sib,8[do re sib]
    mib4 r
    lab,8[sib do lab]

    %75
    re4 r
    sol,8[la? sib sol]
    re'4. sol8

    %78
    fad2
    sol8[sol, re' re,]\mbreak
    sol'4 sol8. sol16

    %81
    la4 re,8. re16
    sol4 dod,8. dod16
    re4 sol,
    re' re8. re16

    %85
    mi4 la,8. la16
    re4 sold,8. sold16
    la4 re,

    %88
    re' re8. re16
    do4 do8. do16
    la4 la8. fa16

    %91
    sib2
    sib8[sib16 sib sib sib sib sib]\mbreak
    mib8[mib16 mib mib mib mib mib]

    %94
    fa8[fa16 fa fa fa fa fa]
    sib,4 r
    la r

    %97
    la r
    sib8[do re sib]
    R2

    %100
    fa'8[sol la fa]
    R2
    sib,8[do re sib]\mbreak

    %103
    R2
    mib?4 mi
    fa8[sol la fa]

    %106
    fa4 mi8 re
    do[sib la sol]
    fa4 r

    %109
    R2*2
    fa'4 fa8. fa16

    %112
    sol4 do,8. do16
    fa4 si,8. si16
    do4 fa,

    %115
    R2*13
    fa'8[sol la sol]
    fa4 r

    %130
    R2\mbreak
    fa,8[sib' do do,]
    fa8[fa16 fa fa fa fa fa]

    %133
    sib,8[sib16 sib sib sib sib sib]
    do8[do16 do do do do do]
    fa4 r

    %136
    fa8[fa16 fa fa fa fa fa]
    sib,8[sib16 sib sib sib sib sib]
    do8[do16 do do do do do]

    %139
    fa,2\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key fa\major
    \time 2/4
    \tempo 2 = 55
    s2*139
    \bar"|."


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

IIIfg = {
    \IIIglobal
    \clef bass
    <<\IIIfgn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}
#(set-global-staff-size 16)


\pointAndClickOff

\header {
  title = \markup \smaller{"Concerto per Fagotto in Fa maggiore [RV 488]"}
  composer = \markup \center-column{"A. Vivaldi (1678-1741)"}
}

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] All[egr]o non molto"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"primo]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"secondo]"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotto"}
            \Ifg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[2.] Largo"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"primo]"}
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"secondo]"}
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotto"}
            \IIfg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \IIbc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[3.] [Allegro]"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"primo]"}
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"secondo]"}
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotto"}
            \IIIfg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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
