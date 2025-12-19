\language "italiano"
	%********************************** VARIABILI

acc = \once \override Stem #'stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript #'padding = #3

padall = \override TextScript #'padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber #'transparent = ##t

con = \override TupletNumber #'transparent = ##f

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
\version "2.20.0"


Iglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto \senza

}

IvlIn = \relative do'' {

    fa16(sol)
    fa8 fa, fa fa'16(sol) fa8 fa, fa fa'16(sol)
    fa8 mi16 re do sib la sol la8 fa fa la'16(sib)
    la8 sol16 fa mi re do sib\mbreak do8 la la do'16(re)

    %4
    do8 sib16 la sol fa mi re mi8 do do sol'16 la
    sib sib sib sib sib sib sib sib sib sol la sib sol sol la sib
    do, mi fa sol la la la la\mbreak la fa sol la fa fa sol la

    %7
    sib, re mi fa sol sol sol sol sol mi fa sol mi mi fa sol
    la, do re mi fa fa fa fa fa re mi fa sol sol sol sol
    sol mi fa sol la la la la la fa sol la sib sib sib sib

    %10
    sib8.[la16 la8. sol16] la4(sol)
    fa4. sol8 la16 do, si do la' do, si do
    sol' do, si do sol' do, si do\mbreak la' do, si do la' do, si do

    %13
    sol' do, si do sol' do, si do la'8. sol16 fa  sol fa mi
    re mi re do si do si la sol do si do mi do si do\mbreak
    sol do si do mi do si do la do si do mi do si do

    %16
    sol do si do mi do si do la8 si do fa
    mi4 re do r8 fa16(sol) mi4 re do r8 sol'16(la)
    sol8 do, do sol'16(la) sol8 si, si sol'16(la)

    %19
    sol8 sol16 (la) sol fa mi re mi8 do do do'16(re)
    do8 fa, fa do'16(re) do8 mi, mi do'16(re)\mbreak
    do8 do16  re do sib la sol la8 fa fa  la16(sib)

    %22
    la8 re, re la'16(sib) la8 dod, dod la'16(sib)
    la8 la16 sib la sol fa mi fa la la la fa la la la\mbreak
    fad la la la fad la la la re, fad fad fad la, re re re

    %25
    fad, la la la re, re' re re si sol' sol sol re sol sol sol
    si, re re re sol, si si si\mbreak re, sol sol sol si, re re re
    \once\stemUp sol, sol'' sol sol re sol sol sol mi do do do sol do do do

    %28
    la fa' fa fa do fa fa fa re sib' sib sib fa sib sib sib\mbreak
    sol la sib la sol fa mi re mi8 do do re16 mi
    fa8 fa, fa fa'16(sol) fa8 fa, fa fa'16(sol)

    %31
    fa8 mib16 re do re mib do re8 do16 re sib8 sol'16(la)\mbreak
    sol8 sol, sol sol'16(la) sol8 sol, sol sol'16(la)
    sol8 fa16 mi re  mi fa sol mi8 re16 mi do8 sol'16 la

    %34
    sib8 do, do sol'16 la sib8 sib sib sib
    sib la4 sol16 fa\mbreak mi8 fa16 sol sol8. fa16
    fa4 r8 do re16 fa, mi fa re' fa, mi fa

    %37
    do' fa, mi fa do' fa, mi fa re' fa, mi fa  re' fa, mi fa
    do' fa, mi fa do' fa, mi fa\mbreak re'8. do16 sib do sib la
    sol la sol fa mi fa mi re do fa mi fa la fa mi fa

    %40
    do fa mi fa la fa mi fa re fa mi fa la fa mi fa\mbreak
    do fa mi fa la fa mi fa re8 mi fa sib
    la4 sol fa r8 sol'16(la) la,4 sol fa\fermata r

}

IvlIIn = \relative do'' {

    fa16(sol)
    fa8 fa, fa fa'16(sol) fa8 fa, fa fa'16(sol)
    fa8 mi16 re do sib la sol la8 fa fa la'16(sib)
    la8 sol16 fa mi re do sib\mbreak do8 la la do'16(re)

    %4
    do8 sib16 la sol fa mi re mi8 do do sol'16 la
    sib sib sib sib sib sib sib sib sib sol la sib sol sol la sib
    do, mi fa sol la la la la\mbreak la fa sol la fa fa sol la

    %7
    sib, re mi fa sol sol sol sol sol mi fa sol mi mi fa sol
    la, do re mi fa fa fa fa fa re mi fa sol sol sol sol
    sol mi fa sol la la la la la fa sol la sib sib sib sib

    %10
    sib8.[la16 la8. sol16] la4(sol)
    fa4. sol8 la16 do, si do la' do, si do
    sol' do, si do sol' do, si do\mbreak la' do, si do la' do, si do

    %13
    sol' do, si do sol' do, si do la'8. sol16 fa  sol fa mi
    re mi re do si do si la sol do si do mi do si do\mbreak
    sol do si do mi do si do la do si do mi do si do

    %16
    sol do si do mi do si do la8 si do4~
    do si do r8 fa16(sol) mi4 re do r8 sol'16(la)
    sol8 do, do sol'16(la) sol8 si, si sol'16(la)

    %19
    sol8 sol16 (la) sol fa mi re mi8 do do do'16(re)
    do8 fa, fa do'16(re) do8 mi, mi do'16(re)\mbreak
    do8 do16  re do sib la sol la8 fa fa  la16(sib)

    %22
    la8 re, re la'16(sib) la8 dod, dod la'16(sib)
    la8 la16 sib la sol fa mi fa fa fa fa la fa fa fa
    la fad fad fad la fad fad fad fad re re re re la la la

    %25
    la fad fad fad fad la la la re, si' si si si4
    r16 si si si si re, re re sol4 r16 si, si si
    \once\stemUp si? re' re re si si si si sol mi' mi mi do mi mi mi

    %28
    do do do do la do do do\mbreak fa, re' re re sib? re re re
    re4 r16 sib sib sib sol8 do do re16 mi
    fa8 fa, fa fa'16(sol) fa8 fa, fa fa'16(sol)

    %31
    fa8 mib16 re do re mib do re8 do16 re sib8 sol'16(la)\mbreak
    sol8 sol, sol sol'16(la) sol8 sol, sol sol'16(la)
    sol8 fa16 mi re  mi fa sol mi8 re16 mi do8 sol'16 la

    %34
    sib8 do, do sol'16 la sib8 sib sib sib
    sib la4 sol16 fa\mbreak mi8 fa16 sol sol8. fa16
    fa4 r8 do re16 fa, mi fa re' fa, mi fa

    %37
    do' fa, mi fa do' fa, mi fa re' fa, mi fa  re' fa, mi fa
    do' fa, mi fa do' fa, mi fa\mbreak re'8. do16 sib do sib la
    sol la sol fa mi fa mi re do fa mi fa la fa mi fa

    %40
    do fa mi fa la fa mi fa re fa mi fa la fa mi fa\mbreak
    do8 fa fa fa re mi fa4~
    fa mi fa r8 sol'16(la) fa,4\repeatTie mi fa\fermata r

}

IvlrpIn = \relative do'' {

    fa16(sol)
    fa8 fa, fa fa'16(sol) fa8 fa, fa fa'16(sol)
    fa8 mi16 re do sib la sol la8 fa fa la'16(sib)
    la8 sol16 fa mi re do sib\mbreak do8 la la do'16(re)

    %4
    do8 sib16 la sol fa mi re mi8 do do sol'16 la
    sib sib sib sib sib sib sib sib sib sol la sib sol sol la sib
    do, mi fa sol la la la la\mbreak la fa sol la fa fa sol la

    %7
    sib, re mi fa sol sol sol sol sol mi fa sol mi mi fa sol
    la, do re mi fa fa fa fa fa re mi fa sol sol sol sol
    sol mi fa sol la la la la la fa sol la sib sib sib sib

    %10
    sib8.[la16 la8. sol16] la4(sol)
    fa4. sol8 la16 do, si do la' do, si do
    sol' do, si do sol' do, si do\mbreak la' do, si do la' do, si do

    %13
    sol' do, si do sol' do, si do la'8. sol16 fa  sol fa mi
    re mi re do si do si la sol do si do mi do si do\mbreak
    sol do si do mi do si do la do si do mi do si do

    %16
    sol do si do mi do si do la8 si  do fa
    mi4 re do r8 fa16(sol) mi4 re do r8 sol'16(la)
    sol8 do, do sol'16(la) sol8 si, si sol'16(la)

    %19
    sol8 sol16 (la) sol fa mi re mi8 do do do'16(re)
    do8 fa, fa do'16(re) do8 mi, mi do'16(re)\mbreak
    do8 do16  re do sib la sol la8 fa fa  la16(sib)

    %22
    la8 re, re la'16(sib) la8 dod, dod la'16(sib)
    la8 la16 sib la sol fa mi fa la la la fa la la la\mbreak
    fad la la la fad la la la re, fad fad fad la, re re re

    %25
    fad, la la la re, re' re re si sol' sol sol re sol sol sol
    si, re re re sol, si si si\mbreak re, sol sol sol si, re re re
    \once\stemUp sol, sol'' sol sol re sol sol sol mi do do do sol do do do

    %28
    la fa' fa fa do fa fa fa re sib' sib sib fa sib sib sib\mbreak
    sol la sib la sol fa mi re mi8 do do re16 mi
    fa8 fa, fa fa'16(sol) fa8 fa, fa fa'16(sol)

    %31
    fa8 mib16 re do re mib do re8 do16 re sib8 sol'16(la)\mbreak
    sol8 sol, sol sol'16(la) sol8 sol, sol sol'16(la)
    sol8 fa16 mi re  mi fa sol mi8 re16 mi do8 sol'16 la

    %34
    sib8 do, do sol'16 la sib8 sib sib sib
    sib la4 sol16 fa\mbreak mi8 fa16 sol sol8. fa16
    fa4 r8 do re16 fa, mi fa re' fa, mi fa

    %37
    do' fa, mi fa do' fa, mi fa re' fa, mi fa  re' fa, mi fa
    do' fa, mi fa do' fa, mi fa\mbreak re'8. do16 sib do sib la
    sol la sol fa mi fa mi re do fa mi fa la fa mi fa

    %40
    do fa mi fa la fa mi fa re fa mi fa la fa mi fa\mbreak
    do fa mi fa la fa mi fa re8 mi fa sib
    la4 sol fa r8 sol'16(la) la,4 sol fa\fermata r

}

IvlrpIIn = \relative do'' {

    fa16(sol)
    fa8 fa, fa fa'16(sol) fa8 fa, fa fa'16(sol)
    fa8 mi16 re do sib la sol la8 fa fa la'16(sib)
    la8 sol16 fa mi re do sib\mbreak do8 la la do'16(re)

    %4
    do8 sib16 la sol fa mi re mi8 do do mi16 fa
    sol sol sol sol sol sol sol sol sol mi fa sol mi mi fa sol\mbreak
    la, do re mi fa fa fa fa fa4 r16 la, sib do

    %7
    re,4 r16 sib' sib sib sib4 r16 do do do
    do4 r16 la sib do re sib do re sib sib do re
    sol,4 r16 do re mi\mbreak fa re mi fa sol sol sol sol

    %10
    sol mi fa sol do,8 fa fa4(mi)
    fa4. sol8 la la la la
    sol sol sol4 la8 la la la

    %13
    sol sol sol4 la8. sol16 fa sol fa mi
    re mi re do si do si la sol8 do do do
    do do do do do do do do

    %16
    do do do do do4 do4~
    do si do r8 fa16(sol) do,4\repeatTie si do r8 sol'16(la)
    sol8 do, do sol'16(la) sol8 si, si sol'16(la)

    %19
    sol8 sol16 (la) sol fa mi re mi8 do do do'16(re)
    do8 fa, fa do'16(re) do8 mi, mi do'16(re)\mbreak
    do8 do16  re do sib la sol la8 fa fa  la16(sib)

    %22
    la8 re, re la'16(sib) la8 dod, dod la'16(sib)
    la8 la16 sib la sol fa mi  fa re re re fa re re re
    fad re re re fad re re re la' la, la la la fad fad fad\mbreak

    %25
    fad re re re re fad fad fad re re' re re re si si si
    re sol, sol sol re sol sol sol sol re re re re sol sol sol
    sol si si si re re re re\mbreak do sol sol sol do sol sol sol

    %28
    la la la la fa la la la \once\stemUp re, sol' sol sol re sol sol sol
    sol4 r16 re re re do8 do do re16 mi
    fa8 fa, fa fa'16(sol) fa8 fa, fa fa'16(sol)

    %31
    fa8 mib16 re do re mib do re8 do16 re sib8 sol'16(la)\mbreak
    sol8 sol, sol sol'16(la) sol8 sol, sol sol'16(la)
    sol8 fa16 mi re  mi fa sol mi8 re16 mi do8 sol'16 la

    %34
    sib8 do, do sol'16 la sib8 sib sib sib
    sib la4 sol16 fa\mbreak mi8 fa16 sol sol8. fa16
    fa4 r8 do  re re re re

    %37
    do do do4 re8 re re re
    do do do4 re8. do16 sib do sib la\mbreak
    sol la sol fa mi fa mi re do8 fa fa fa

    %40
    fa fa fa fa fa fa fa fa
    fa fa fa fa re mi fa4~
    fa mi fa r8 sol'16(la) fa,4\repeatTie mi fa\fermata r

}

Ivlan = \relative do' {

    la'16(sib)
    la4 r8 la16(sib) la4 r8 la16(sib)
    la sib do sib la sol la sib do4 r8 do
    do4 r8 fa, fa4 r8 fa\mbreak

    %4
    fa4 r8 mi16 fa sol4 r8 sol
    do, mi mi do do mi mi do
    do fa fa re re fa fa re

    %7
    re sol sol mi mi4 r16 do re mi
    fa4 r16 fa sol la re,4 r16 re re re\mbreak
    mi4 r16 do' do do fa, la sib do re sib do re

    %10
    mi,4 r16 sib' do re do4 do
    do4. do8 do do do do
    do do do do do do do do

    %13
    do do do do do4 r8 do16 sib\mbreak
    la sib la sol fa8 fa sol4 r8 sol
    sol sol sol sol la la sol sol

    %16
    sol sol sol sol do,4. la'8
    sol4 sol sol r8 la16(sib) sol4 sol sol r8 mi16(fa)
    mi4 r8 mi16(fa) re4 r8 si'16 si\mbreak

    %19
    do8 do re re sol, mi mi la16(sib)
    la4 r8 la16(sib) sol4 r8 mi16 mi
    fa8 fa sol sol do,4 r8 mi16 mi

    %22
    fa4 r8 fa16 sol mi4. fa16 sol
    re8 re mi mi la,4 r16 la' la la\mbreak
    la4 r16 fad fad fad fad4 r16 re re re

    %25
    re4 r16 la la la si4 r16 re re re
    re4 r16 re re re re si si si sol sol sol sol
    sol4 r16 si si si\mbreak do4 r16 do do do

    %28
    do4 r16 do do do re4 r16 re re re
    re4 r16 sol sol sol sol8 mi mi fa16 sol
    do,4 r8 do'16 sib la4 r8 la16 la

    %31
    sib8 sib do do fa,4 r8 sib16 do\mbreak
    re4 r8 re16 do si4 r8 si16 si
    do8 do re re sol,4 r8 mi16 fa

    %34
    sol4 r8 mi16 fa sol8 sol mi mi
    do do' re re sol, la16 sib sol8 do
    do4 r8 la fa fa fa fa\mbreak

    %37
    fa fa fa fa fa fa fa fa
    fa fa fa fa fa4 r8 fa16 mi
    re mi re do sib8 sib do4 r8 do

    %40
    do do do do re re do do
    do do do' do fa,4 r8 re\mbreak
    do4 do do r8 mi16(fa) do4 do do\fermata r

}

Ifgn = \relative do {

    r8
    fa,4 r fa r
    fa r8 fa'16 sol fa8 mi16 re do sib la sol
    fa4 r8 la'16 sib la8 sol16 fa mi re do sib

    %4
    la4 r8 do'16 re\mbreak do8 sib16 la sol fa mi re
    mi8 do do mi mi do do mi
    fa re re fa fa re re fa

    %7
    sol mi mi do do do' do do,
    fa la, la fa sib4 r16 sol la sib
    do4 r16 la sib do\mbreak re4 r16 sol, la sib

    %10
    do do re mi fa sol la sib do sib la sib do8 do,
    fa fa, fa do' fa4 fa,
    mi mi' fa fa,

    %13
    mi mi' fa8 sol la sol
    fa4 re mi do
    mi do fa do\mbreak

    %16
    mi do fa8 sol la fa
    sol4 sol, do8 do16 sib la8 sol sol'4 sol, do2
    do'4 r sol r

    %19
    la si do8 do16 re do si la sol
    fa4 r do r
    re mi\mbreak fa8 fa16 sol fa mi re dod

    %22
    re4 r la r
    si dod re r
    re' r fad, r

    %25
    re fad sol r
    sol, r si r
    si sol do mi

    %28
    fa la, sib? r
    sib r8 sol do do' do sib
    la4 r fa r

    %31
    sol la sib r
    si r sol r
    la si do r

    %34
    mi, r mi do
    fa sib, do8 fa do'[do,]
    fa sol la fa sib4 sib,\mbreak

    %37
    la la' sib sib,
    la la' sib8 do re do
    sib4 sol la fa

    %40
    la fa sib fa
    la fa sib8 do re sib
    do4 do, fa r do' do, fa\fermata r

}

Ibcn = \relative do {

    r8
    fa,4 r fa r
    fa r8 fa'16 sol fa8 mi16 re do sib la sol
    fa4 r8 la'16 sib la8 sol16 fa mi re do sib

    %4
    la4 r8 do'16 re\mbreak do8 sib16 la sol fa mi re
    mi8 do do mi mi do do mi
    fa re re fa fa re re fa

    %7
    sol mi mi do do do' do do,
    fa la, la fa sib4 r16 sol la sib
    do4 r16 la sib do\mbreak re4 r16 sol, la sib

    %10
    do do re mi fa sol la sib do4 do,
    fa8 fa, fa do' fa4 fa,
    mi mi' fa fa,

    %13
    mi mi' fa8 sol la sol
    fa4 re mi do
    mi do fa do\mbreak

    %16
    mi do fa8 sol la fa
    sol4 sol, do8 do16 sib la8 sol sol'4 sol, do2
    do'4 r sol r

    %19
    la si do8 do16 re do si la sol
    fa4 r do r
    re mi\mbreak fa8 fa16 sol fa mi re dod

    %22
    re4 r la r
    si dod re r
    re' r fad, r

    %25
    re fad sol r
    sol, r si r
    si sol do mi

    %28
    fa la, sib? r
    sib r8 sol do do' do sib
    la4 r fa r

    %31
    sol la sib r
    si r sol r
    la si do r

    %34
    mi, r mi do
    fa sib, do8 fa do'[do,]
    fa sol la fa sib4 sib,\mbreak

    %37
    la la' sib sib,
    la la' sib8 do re do
    sib4 sol la fa

    %40
    la fa sib fa
    la fa sib8 do re sib
    do4 do, fa r do' do, fa\fermata r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s1
    s2 <6 4>
    s4 s8 <6> <6>4 <4 2>
    <6>2 s
    <6 5> <6 5>
    <5>4 s8 <6> <6>2
    s4 <6 4> <7> s
    s <6> s2
    s1
    <7>4 s8 <6> <6 4>4 <5 3>
    s1
    <6>
    <6>2 s4 <6>
    <6> <6!> <6> s
    <6>1
    <6> s s4 <2> s2
    s <_!>
    <7>4 <6> s2
    s1
    <7>4 <6> s2
    s <_+>
    <7> <6>
    <_+> <6>
    s4 <6> <_!> s
    <_!>2 <6>
    <6> s4 <6>
    s <6> s2
    s1
    <6>
    <7>4 <6> s2
    <6 5>1
    <7>4 <6> s2
    <6 5> <6 5>4 <7>
    <4>8 <3> <7> <6> s4 <4>8 <3>
    s4 <6> s2
    <6> s
   <6>2 s4 <6>
   <6> <6> <6> s
   <6>1
   <6>2 s4 <6>
    <6 4> <5 3> s2 <6 4>4 <5 3>

}

forma = {

    \key fa\major
    \time 4/4
    \tempo 2 = 60
    \partial 8 s8
    \repeat volta 2 {s1*16}
    \alternative {{s1}{s}}\break
    \set Score.currentBarNumber = #18
     \repeat volta 2 {s1*24}\alternative {{s1}{s}}
    \bar "|."

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


IvlrpI = {
    \Iglobal
    <<\IvlrpIn \forma>>
}


IvlrpII = {
    \Iglobal
    <<\IvlrpIIn \forma>>
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



IIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto \senza

}

IIvlIn = \relative do'' {

    fa4 fa2
    sol4 do, sol'
    la sib8(la) sol(fa)

    %4
    mi2.\mbreak
    fa4 sol la
    sol4. fa8 mi4

    %7
    fa \grace mi8 re2
    do2.
    fa16 do do fa fa do do fa fa do do fa

    %10
    mi do do mi mi do do mi mi do do mi\mbreak
    fa do do fa fa do do fa fa do do fa
    sol do, do sol' sol do, do sol' sol do, do sol'

    %13
    la do, do la' sol do, do sol' fa do do fa\mbreak
    mi sol, sol do do sol sol do do sol sol do
    do sol sol do do sol sol do si sol sol si

    %16
    do do si la sol fa mi re do4
    fa' \grace fa8 mib2\mbreak
    re4. mib8 re4

    %19
    sol\grace sol8 fa2
    mi?2.
    sib'4 la4. sib8

    %22
    sol2 fa4
    sib\p la4. sib8
    la\f(sol) fa(mi) fa4~

    %25
    fa8 sol \grace la sol2
    fa2.
    do16 la la do do la la do do la la do\mbreak

    %28
    sib fa fa sib sib fa fa sib sib fa fa sib
    re si si re re si si re re si si re
    do sol sol do do sol sol do do sol sol do\mbreak

    %31
    re sib sib re re sib sib re do la la do
    sib sol sol sib sib sol sol sib la fa fa la
    re\p sib sib re re sib sib re do la la do\mbreak

    %34
    sib\f sol sol sib sib sol sol sib la fa fa la
    re fa re fa do fa do fa do mi do mi
    fa fa mi re do sib la sol fa4\fermata

}

IIvlIIn = \relative do'' {

    fa16 do do fa fa do do fa fa do do fa\mbreak
    mi do do mi mi do do mi mi do do mi
    fa do do fa fa do do fa fa do do fa

    %4
    sol do, do sol' sol do, do sol' sol do, do sol'
    la do, do la' sol do, do sol' fa do do fa
    mi sol, sol do do sol sol do do sol sol do

    %7
    do sol sol do do sol sol do si sol sol si\mbreak
    do do si la sol fa mi re do4
    fa' fa2

    %10
    sol4 do, sol'
    la sib8(la) sol(fa)
    mi2.

    %13
    fa4 sol la
    sol4. fa8 mi4
    fa \grace mi8 re2

    %16
    do2.\mbreak
    do16 la la do do la la do do la la do
    sib fa fa sib sib fa fa sib sib fa fa sib

    %19
    re si si re re si si re re si si re\mbreak
    do sol sol do do sol sol do do sol sol do
    re sib? sib re re sib sib re do la la do

    %22
    sib sol sol sib sib sol sol sib la fa fa la\mbreak
    re\p sib sib re re sib sib re do la la do
    sib\f sol sol sib sib sol sol sib la fa fa la

    %25
    re fa re fa do fa do fa do mi do mi\mbreak
    fa fa mi re do sib la sol fa4
    fa' \grace fa8 mib2

    %28
    re4. mib8 re4
    sol \grace sol8 fa2
    mi?2.

    %31
    sib'4 la4. sib8
    sol2 fa4
    sib\p la4. sib8

    %34
    la\f(sol) fa(mi) fa4~
    fa8 sol sol2
    fa2.\fermata

}

IIvlrpIn = \relative do'' {fa4 fa2
    sol4 do, sol'
    la sib8(la) sol(fa)

    %4
    mi2.\mbreak
    fa4 sol la
    sol4. fa8 mi4

    %7
    fa \grace mi8 re2
    do2.
    fa16 do do fa fa do do fa fa do do fa

    %10
    mi do do mi mi do do mi mi do do mi\mbreak
    fa do do fa fa do do fa fa do do fa
    sol do, do sol' sol do, do sol' sol do, do sol'

    %13
    la do, do la' sol do, do sol' fa do do fa\mbreak
    mi sol, sol do do sol sol do do sol sol do
    do sol sol do do sol sol do si sol sol si

    %16
    do do si la sol fa mi re do4
    fa' \grace fa8 mib2\mbreak
    re4. mib8 re4

    %19
    sol\grace sol8 fa2
    mi?2.
    sib'4 la4. sib8

    %22
    sol2 fa4
    sib\p la4. sib8
    la\f(sol) fa(mi) fa4~

    %25
    fa8 sol \grace la sol2
    fa2.
    do16 la la do do la la do do la la do\mbreak

    %28
    sib fa fa sib sib fa fa sib sib fa fa sib
    re si si re re si si re re si si re
    do sol sol do do sol sol do do sol sol do\mbreak

    %31
    re sib sib re re sib sib re do la la do
    sib sol sol sib sib sol sol sib la fa fa la
    re\p sib sib re re sib sib re do la la do\mbreak

    %34
    sib\f sol sol sib sib sol sol sib la fa fa la
    re fa re fa do fa do fa do mi do mi
    fa fa mi re do sib la sol fa4\fermata

}

IIvlrpIIn = \relative do'' {

    fa16 do do fa fa do do fa fa do do fa\mbreak
    mi do do mi mi do do mi mi do do mi
    fa do do fa fa do do fa fa do do fa

    %4
    sol do, do sol' sol do, do sol' sol do, do sol'
    la do, do la' sol do, do sol' fa do do fa
    mi sol, sol do do sol sol do do sol sol do

    %7
    do sol sol do do sol sol do si sol sol si\mbreak
    do do si la sol fa mi re do4
    fa' fa2

    %10
    sol4 do, sol'
    la sib8(la) sol(fa)
    mi2.

    %13
    fa4 sol la
    sol4. fa8 mi4
    fa \grace mi8 re2

    %16
    do2.\mbreak
    do16 la la do do la la do do la la do
    sib fa fa sib sib fa fa sib sib fa fa sib

    %19
    re si si re re si si re re si si re\mbreak
    do sol sol do do sol sol do do sol sol do
    re sib? sib re re sib sib re do la la do

    %22
    sib sol sol sib sib sol sol sib la fa fa la\mbreak
    re\p sib sib re re sib sib re do la la do
    sib\f sol sol sib sib sol sol sib la fa fa la

    %25
    re fa re fa do fa do fa do mi do mi\mbreak
    fa fa mi re do sib la sol fa4
    fa' \grace fa8 mib2

    %28
    re4. mib8 re4
    sol \grace sol8 fa2
    mi?2.

    %31
    sib'4 la4. sib8
    sol2 fa4
    sib\p la4. sib8

    %34
    la\f(sol) fa(mi) fa4~
    fa8 sol sol2
    fa2.\fermata

}

IIvlan = \relative do' {

    la'4. sib8 do4
    sol4. fa8 mi4
    do' do4. do,8

    %4
    sol'4. fa8 mi4
    do do4. do'8
    do4. sol8 sol4

    %7
    re sol4. sol8
    mi2.\mbreak
    la4. sib8 do4

    %10
    sol4. fa8 mi4
    do' do4. do,8
    sol'4.fa8 mi4


    %13
    do do4. do'8
    do4. sol8 sol4
    re sol4. sol8

    %16
    mi2.
    fa4 fa4. fa8
    fa2.

    %19
    sol4 sol4. sol8
    sol2.
    sol4 la do,\mbreak

    %22
    do2 do4
    sol'\p la do,
    do sol' fa

    %25
    re sol,4. do8
    do2.
    fa4 fa4.fa8

    %28
    fa2.
    sol4 sol4. sol8
    sol2.

    %31
    sol4 la do,
    do2 do4
    sol'\p la do,

    %34
    do\f sol' fa
    re sol,4. do8
    do2.\fermata

}

IIfgn = \relative do {

    fa4 fa, fa'
    do' do, do'
    fa, fa, fa'\mbreak

    %4
    do do, do'
    fa mi fa
    do mi do

    %7
    sol' sol,2
    do2.
    fa4 fa, fa'

    %10
    do' do, do'
    fa, fa, fa'
    do do, do'

    %13
    fa mi fa
    do mi do
    sol' sol,2

    %16
    do2.
    la4 fa la
    sib2.\mbreak

    %19
    si4 sol si
    do2.
    sol'4 fa2

    %22
    mi fa4
    sol\p fa2
    mi4\f do re

    %25
    sib do2
    fa,2.
    la4 fa la

    %28
    sib2.
    si4 sol si
    do2.

    %31
    sol'4 fa2
    mi fa4
    sol\p fa2

    %34
    mi4\f do re\mbreak
    sib do2
    fa,2.\fermata

}

IIbcn = \relative do {

    fa4 fa, fa'
    do' do, do'
    fa, fa, fa'\mbreak

    %4
    do do, do'
    fa mi fa
    do mi do

    %7
    sol' sol,2
    do2.
    fa4 fa, fa'

    %10
    do' do, do'
    fa, fa, fa'
    do do, do'

    %13
    fa mi fa
    do mi do
    sol' sol,2

    %16
    do2.
    la4 fa la
    sib2.\mbreak

    %19
    si4 sol si
    do2.
    sol'4 fa2

    %22
    mi fa4
    sol\p fa2
    mi4^\f do re

    %25
    sib do2
    fa,2.
    la4 fa la

    %28
    sib2.
    si4 sol si
    do2.

    %31
    sol'4 fa2
    mi fa4
    sol\p fa2

    %34
    mi4^\f do re\mbreak
    sib do2
    fa,2.\fermata
}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*4
    s4 <6>2
    s4 <6>2
    <7 4>4 <6 4> <5 _!>
    s2.*5
    s4 <6> s
    s <6> s
    <7 4>4 <6 4> <5 _!>
    s2.
    <6>
    s
    <6 5>
    s
    s4 <6> <5>
    <6 5>2.
    s4 <6> <5>
    <6 5>2.
    <6 5>4 <4> <3>
    s2.
    <6 5>
    s
    <6>
    s
    s4 <6> <5>
    <6 5>2.
    s4 <6> <5>
    <6 5>2.
    <6 4>4 <4> <3>

}

forma = {

    \key fa\major
    \time 3/4
    \tempo 2 = 60
    s2.*36
    \bar "||"
    \mark\markup\smaller\center-column{"Da""Capo"}

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


IIvlrpI = {
    \IIglobal
    <<\IIvlrpIn \forma>>
}


IIvlrpII = {
    \IIglobal
    <<\IIvlrpIIn \forma>>
}


IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>
}


IIfg = {
    \IIglobal
    \clef bass
    <<\IIfgn \forma>>
}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}



IIIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto \senza

}

IIIvlIn = \relative do'' {

    r2 r4 do
    la \grace sol8 fa4 r fa'
    mi \grace re8 do4 r fa

    %4
    \grace mi8 re4 do8 re sib2
    la r4 re
    re do r fa

    %7
    fa mi r la
    si, do8 re \grace mi8 re2
    do r4 do do2 r4 sol'

    %10
    mi4\grace re8 do4 r sol'
    la \grace sol8 fa4 r la
    sib4. la8 sol fa  mi re

    %13
    dod4 la r la'
    sol fa r fa\p
    mib re r sib'\f

    %16
    dod,re8 mi \grace fa mi4. re8
    re2. sol8 fa\mbreak
    mib4 re8 do sol4 si

    %19
    do2 r4 fa
    re \grace do8 sib4 re sol
    mi do r la'

    %22
    fa \grace mi8 re4 fa sib
    sol mi r do'
    \grace fa,8 mi4 fa8 sol \grace la8 sol4. fa8

    %25
    fa2 r4 sol fa2\fermata r

}

IIIvlIIn = \relative do'' {

    r2 r4 do
    la \grace sol8 fa4 r fa'
    mi \grace re8 do4 r fa

    %4
    \grace mi8 re4 do8 re sib2
    la r4 re
    re do r fa

    %7
    fa mi r la
    si, do8 re \grace mi8 re2
    do r4 do do2 r4 sol'

    %10
    mi4\grace re8 do4 r sol'
    la \grace sol8 fa4 r la
    sib4. la8 sol fa  mi re

    %13
    dod4 la r la'
    sol fa r fa\p
    mib re r sib'\f

    %16
    dod, re8 mi \grace fa mi4. re8
    re2. sol8 fa\mbreak
    mib4 re8 do sol4 si

    %19
    do2 r4 fa
    re \grace do8 sib4 re sol
    mi do r la'

    %22
    fa \grace mi8 re4 fa sib
    sol mi r do'
    \grace fa,8 mi4 fa8 sol \grace la8 sol4. fa8

    %25
    fa2 r4 sol fa2\fermata r

}

IIIvlrpIn = \relative do'' {
    r2 r4 do
    la \grace sol8 fa4 r fa'
    mi \grace re8 do4 r fa

    %4
    \grace mi8 re4 do8 re sib2
    la r4 re
    re do r fa

    %7
    fa mi r la
    si, do8 re \grace mi8 re2
    do r4 do do2 r4 sol'

    %10
    mi4\grace re8 do4 r sol'
    la \grace sol8 fa4 r la
    sib4. la8 sol fa  mi re

    %13
    dod4 la r la'
    sol fa r fa\p
    mib re r sib'\f

    %16
    dod, re8 mi \grace fa mi4. re8
    re2. sol8 fa\mbreak
    mib4 re8 do sol4 si

    %19
    do2 r4 fa
    re \grace do8 sib4 re sol
    mi do r la'

    %22
    fa \grace mi8 re4 fa sib
    sol mi r do'
    \grace fa,8 mi4 fa8 sol \grace la8 sol4. fa8

    %25
    fa2 r4 sol fa2\fermata r

}

IIIvlrpIIn = \relative do'' {

    r2 r4 do
    la \grace sol8 fa4 r fa'
    mi \grace re8 do4 r fa

    %4
    \grace mi8 re4 do8 re sib2
    la r4 re
    re do r fa

    %7
    fa mi r la
    si, do8 re \grace mi8 re2
    do r4 do do2 r4 sol'

    %10
    mi4\grace re8 do4 r sol'
    la \grace sol8 fa4 r la
    sib4. la8 sol fa  mi re

    %13
    dod4 la r la'
    sol fa r fa\p
    mib re r sib'\f

    %16
    dod, re8 mi \grace fa mi4. re8
    re2. sol8 fa\mbreak
    mib4 re8 do sol4 si

    %19
    do2 r4 fa
    re \grace do8 sib4 re sol
    mi do r la'

    %22
    fa \grace mi8 re4 fa sib
    sol mi r do'
    \grace fa,8 mi4 fa8 sol \grace la8 sol4. fa8

    %25
    fa2 r4 sol fa2\fermata r

}

IIIvlan = \relative do' {

    r2 r4 sol
    do do r re
    sol, sol r la'

    %4
    fa fa fa4. mi8
    fa2 r4 la
    sol mi r la

    %7
    re si sol fa8 mi
    fa4 sol8 la re,4. sol8
    mi2 r4 sol,  mi'2 r4 re'

    %10
    sol, sol r do
    do do r fa,
    re re r sib'

    %13
    mi, mi r fa
    sib la r la\p
    sol fa r sol\f

    %16
    mi fa8 sol la,4 dod
    re fa8 mi re4 si'8 la
    sol4 lab\mbreak re, sol

    %19
    sol2 r4 la
    fa fa sol sib
    sol sol la do

    %22
    la la sib re
    sib sib do mi,8 fa
    sol4 la8 sib do4. do8

    %25
    la2 r4 re do2\fermata r4

}

IIIfgn = \relative do {

    fa4 do' la mi
    fa la fa sib,
    do do' la fa

    %4
    sib la sol do
    fa, do' la fa
    mi la fa re

    %7
    si sol' mi do
    re mi8 fa sol4 sol,\mbreak
    do do' la mi do sol' mi si

    %10
    do do' sol mi
    fa la fa re
    sol sib mi, sol

    %13
    la, la' sol fa
    r fa\p mib re
    r sib'\f sol sol,

    %16
    la re la' la,
    re re'8 do\mbreak si4 sol
    do fa, sol sol,

    %19
    do do' la fa
    sib re sib sol
    r mi do la

    %22
    re fa re sib
    r sol' mi do
    do' fa, do do,

    %25
    fa fa' mi si fa2\fermata r

}

IIIbcn = \relative do {

    fa4 do' la mi
    fa la fa sib,
    do do' la fa

    %4
    sib la sol do
    fa, do' la fa
    mi la fa re

    %7
    si sol' mi do
    re mi8 fa sol4 sol,\mbreak
    do do' la mi do sol' mi si

    %10
    do do' sol mi
    fa la fa re
    sol sib mi, sol

    %13
    la, la' sol fa
    r fa\p mib re
    r sib'\f sol sol,

    %16
    la re la' la,
    re re'8 do\mbreak si4 sol
    do fa, sol sol,

    %19
    do do' la fa
    sib re sib sol
    r mi do la

    %22
    re fa re sib
    r sol' mi do
    do' fa, do do,

    %25
    fa fa' mi si fa2\fermata r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>4 <6>
    s2 s4 <6 5>
    s2 <6>
    s4 <6> <7> <7>
    s s <6> <6>
    <7>1
    <6 5>4 <_!> <6> <6>
    <6!> <6> <4> <_!>
    s s <6> <6> s s <6> <6 5>
    s1*3
    <_+>1
    s
    s
    <_+>2 <4>4 <_+>
    s2 <6 5>
    <_-> <4>4 <_+>
    s2 <6>
    s4 <6> s2
    s4 <6> s2
    s1
    s4 <6> <6> s
    s s <4> <3>
    s s <6> <6 5>

}

forma = {

    \key fa\major
    \time 4/4
    \tempo 4 = 60
    s1
    \repeat volta 2{s1*7}
    \alternative {{s1}{s}}\break
    \set Score.currentBarNumber = #10
    \repeat volta 2{s1*15}
    \alternative {{s1}{s}}
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


IIIvlrpI = {
    \IIIglobal
    <<\IIIvlrpIn \forma>>
}


IIIvlrpII = {
    \IIIglobal
    <<\IIIvlrpIIn \forma>>
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
    \typeset
}



IVglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto \senza

}

IVvlIn = \relative do'' {

    fa4 do8 fa sol la
    sol4 do,8 sol' la sib
    la sol16 la sib8 la sol[fa]

    %4
    mi2.
    do'4 fa,8 do' sib la
    sib4. la8 sol4

    %7
    la8 sib sol2
    fa2.
    la4 do,8 fa sol la\mbreak

    %10
    sol4 do,8 mi fa sol
    fa la16 sol fa8 mi re[do]
    \grace do si2.

    %13
    sol'4\soli la8 sol fa mi
    fa la16 sol fa8 fa fa[fa]
    fa4 sol8 fa mi re

    %16
    mi sol16 fa mi8 mi mi[mi]\mbreak
    mi4 fa8 mi re do
    re4 re8 mi fa4

    %19
    mi fa8 mi re do
    re4 sol,8 re' \tu mi fa
    sol4 la8 sol fa mi

    %22
    fa8 la16 sol fa8 fa fa[fa]
    fa4 sol8 fa mi re
    mi sol16 fa mi8 mi mi[mi]\mbreak

    %25
    mi4 fa8 mi re do
    re4. mi8 fa4
    mi8 re re2

    %28
    do2.
    sol'4 do,8 sol' do, sol'
    sol4 si,8 sol' re sol

    %31
    si, sol' fa la sol fa
    mi4. re8 do4
    la' re,8 la' re, la'\mbreak

    %34
    la4 dod,8 la' mi la
    dod, la' sol sib la sol
    fa4. mi8 re4

    %37
    sib' fa8 sib sib sib
    sib4 la8 sol fa mi
    la4 mi8 la la la

    %40
    la4 sol8 fa mi re
    sol4 re8 sol sol sol\mbreak
    sol4. sib8 la[sol]

    %43
    fa sol mi4. re8
    re2.
    la'4 fa16(la sol la) fa(la sol la)

    %46
    mi (la sol la) mi(la sol la) mi(la sol la)
    dod,(la' sol la) re,(la' sol la) mi(la sol la)\mbreak
    fa4. mi16 fa re4

    %49
    sol mi16(sol fa sol) mi(sol fa sol)
    re(sol fa sol) re(sol fa sol) re(sol fa sol)
    si,(sol' fa sol) do,(sol' fa sol) re(sol fa sol)

    %52
    mi4. re16 mi do4\mbreak
    do' do do
    do sib8 la sol fa

    %55
    sib4 sib sib
    sib la8 sol fa mi
    la4 la la

    %58
    la sol8 fa mi re
    sol4 la8 sol fa sol
    mi4 do\soli do

    %61
    do re8 do sib la\mbreak
    sib re16 do sib8 sib sib[sib]
    sib4 do8 sib la sol

    %64
    la8 do16 sib la8 la la[la]
    la4 sib8 la sol fa
    sol4 sol8 la sib4

    %67
    la sib8 la sol fa
    sol4 do,8 sol'\tu la sib\mbreak
    do4 re8 do sib la

    %70
    sib re16 do sib8 sib sib[sib]
    sib4 do8 sib la sol
    la8 do16 sib la8 la la[la]

    %73
    la4 sib8 la sol fa
    sol4. la8 sib4
    la8 sol sol2

    %76
    fa2.\fermata

}

IVvlIIn = \relative do'' {

    fa4 do8 fa sol la
    sol4 do,8 sol' la sib
    la sol16 la sib8 la sol[fa]

    %4
    mi2.
    do'4 fa,8 do' sib la
    sib4. la8 sol4

    %7
    la8 sib sol2
    fa2.
    la4 do,8 fa sol la\mbreak

    %10
    sol4 do,8 mi fa sol
    fa la16 sol fa8 mi re[do]
    \grace do si2.

    %13
    mi4\soli fa8 mi re do
    re fa16 mi re8 re re[re]\mbreak
    re4 mi8 re do si

    %16
    do mi16 re do8 do do[do]
    do 4re8 do si la
    si4 si8 do re4

    %19
    do re8 do si la
    si4 si8 si\tu do re\mbreak
    mi4 mi8 mi mi mi

    %22
    mi fa16 mi re8 re re[re]
    re4 re8 re re re
    re mi16 re do8 do do[do]

    %25
    do4 do8 do do do
    si4. do8 re4
    do do4. si8

    %28 OK
    do2.
    sol'4 do,8 sol' do, sol'
    sol4 si,8 sol' re sol

    %31
    si, sol' fa la sol fa
    mi4. re8 do4
    la' re,8 la' re, la'\mbreak

    %34
    la4 dod,8 la' mi la
    dod, la' sol sib la sol
    fa4. mi8 re4

    %37
    sib' fa8 sib sib sib
    sib4 la8 sol fa mi
    la4 mi8 la la la

    %40
    la4 sol8 fa mi re
    sol4 re8 sol sol sol\mbreak
    sol4. sib8 la[sol]

    %43
    fa sol mi4. re8
    re2.  %%% OK
    re4. re8 re[re]

    %46
    dod mi dod mi dod mi
    dod mi re fa mi sol
    fa4 la,4. si8

    %49
    do4. do8 do[do]\mbreak
    si re si re si re
    si re do mi re fa

    %52
    mi4. re16 mi do4
    do' do do
    do sib8 la sol fa

    %55
    sib4 sib sib
    sib la8 sol fa mi
    la4 la la

    %58
    la sol8 fa mi re
    sol4 la8 sol fa sol
    mi4 la,\soli la

    %61
    la sib8 la sol fa
    sol sib16 la sol8 sol sol[sol]
    sol4 la8 sol fa mi\mbreak

    %64
    fa la16 sol fa8 fa fa[fa]
    fa4 sol8 fa mi re
    mi4 mi8 fa sol4

    %67
    fa sol8 fa mi re
    mi4 mi8 mi\tu fa sol
    la4 la8 la la la

    %70
    la sib16 la sol8 sol sol [sol]\mbreak
    sol4 sol8 sol sol sol
    sol la16 sol fa8 fa fa[fa]

    %73
    fa4 fa8 fa fa fa
    mi4. fa8 sol4
    fa fa4. mi8

    %76
    fa2.\fermata

}

IVvlrpIn = \relative do'' {



    fa4 do8 fa sol la
    sol4 do,8 sol' la sib
    la sol16 la sib8 la sol[fa]

    %4
    mi2.
    do'4 fa,8 do' sib la
    sib4. la8 sol4

    %7
    la8 sib sol2
    fa2.
    la4 do,8 fa sol la\mbreak

    %10
    sol4 do,8 mi fa sol
    fa la16 sol fa8 mi re[do]
    \grace do si2.

    %13
    R2.*7
    r4 r8 re\tu mi [fa]
    sol4 la8 sol fa mi

    %22
    fa8 la16 sol fa8 fa fa[fa]
    fa4 sol8 fa mi re
    mi sol16 fa mi8 mi mi[mi]\mbreak

    %25
    mi4 fa8 mi re do
    re4. mi8 fa4
    mi8 re re2

    %28
    do2.
    sol'4 do,8 sol' do, sol'
    sol4 si,8 sol' re sol

    %31
    si, sol' fa la sol fa
    mi4. re8 do4
    la' re,8 la' re, la'\mbreak

    %34
    la4 dod,8 la' mi la
    dod, la' sol sib la sol
    fa4. mi8 re4

    %37
    sib' fa8 sib sib sib
    sib4 la8 sol fa mi
    la4 mi8 la la la

    %40
    la4 sol8 fa mi re
    sol4 re8 sol sol sol\mbreak
    sol4. sib8 la[sol]

    %43
    fa sol mi4. re8
    re2.
    fa4. fa8 fa[fa]
    mi dod mi dod mi dod
    mi dod fa re sol mi
    fa4. mi16 fa re4
    mi4. mi8 mi[mi]
    re si re si re si
    re si mi do fa re

    %52
    mi4. re16 mi do4\mbreak
    do' do do
    do sib8 la sol fa

    %55
    sib4 sib sib
    sib la8 sol fa mi
    la4 la la

    %58
    la sol8 fa mi re
    sol4 la8 sol fa sol
    mi4 r r

    %61
    R2.*7
    r4 r8 sol, \tu la [sib]\mbreak
    do4 re8 do sib la

    %70
    sib re16 do sib8 sib sib[sib]
    sib4 do8 sib la sol
    la8 do16 sib la8 la la[la]

    %73
    la4 sib8 la sol fa
    sol4. la8 sib4
    la8 sol sol2

    %76
    fa2.\fermata

}

IVvlrpIIn = \relative do'' {

    la4 fa8 la sib[do]
    do4. mi8 fa[sol]
    do,4. do8 sib[la]

    %4
    sol2.\mbreak
    fa'4. fa8 fa[fa]
    re mi fa2~

    %7
    fa4 fa4. mi8
    fa2.
    do4. do8 do[do]

    %10
    do2 do4~
    do si4. la8
    re,2.

    %13
    R2.*7
    r4 r8 si' \tu do[re]
    mi4 mi8 mi mi mi

    %22
    mi fa16 mi re8 re re[re]
    re4 re8 re re re
    re mi16 re do8 do do[do]

    %25
    do4 do8 do do do
    si4. do8 re4
    do do4. si8

    %28 OK
    do2.
    mi4. mi8 mi[mi]
    re4. re8 re[re]

    %31
    re4. fa8 mi[re]
    do2.
    fa4. fa8 fa[fa]\mbreak

    %34
    mi4. mi8 mi[mi]
    mi4. sol8 fa[mi]
    re2.

    %37
    fa4. fa8 sol[fa]
    mi(re) mi2
    mi4. mi8 fa[mi]

    %40
    re(dod) re2
    re4. re8 mi[re]
    dod2 re4~

    %43
    re re4. dod8
    re2.
    la4. la8 la[la]\mbreak

    %46
    la4 la la
    la la la
    la4. sol16 la fa4

    %49
    sol4. sol8 sol[sol]
    sol4 sol sol
    sol sol sol

    %52
    sol4. fa16 sol mi4
    do'' do do
    do sib8 la sol fa

    %55
    sib4 sib sib
    sib la8 sol fa mi
    la4 la la

    %58
    la sol8 fa mi re
    sol4 la8 sol fa sol
    mi4 r r

    %61
    R2.*7
    r4 r8 mi,\tu fa [sol]
    la4 la8 la la la

    %70
    la sib16 la sol8 sol sol [sol]\mbreak
    sol4 sol8 sol sol sol
    sol la16 sol fa8 fa fa[fa]

    %73
    fa4 fa8 fa fa fa
    mi4. fa8 sol4
    fa fa4. mi8

    %76
    fa2.\fermata

}

IVvlan = \relative do' {

    do'4. do8 do[do]
    sol4. sol8 fa[mi]\mbreak
    la4. la,8 la[sib]

    %4
    do2.
    la4. la'8 sib[do]
    sol4. do8 re4

    %7
    do do4. sib8
    la2.
    la4. la8 sib[do]

    %10
    sol4. sol8 la[sib]
    la4 re,4. re8
    re2.

    %13
    R2.*7
    r4 r8 re\tu re[re]\mbreak
    sol4 do4. do8

    %22
    la4 la8 la la la
    sol4 sol sol
    sol sol8 sol sol sol

    %25
    fa4 fa fa
    fa4. mi8 re4
    sol8 la re,4. sol8

    %28
    mi2.
    sol4. sol8 sol[sol]
    sol4. sol8 sol[sol]

    %31
    sol4. sol8 la[si]\mbreak
    sol2.
    la4. la8 la[la]

    %34
    la4. la8 la[la]
    la4. la8 si[dod]
    la2.

    %37
    fa4. re8 re[re]
    mi fa sol2
    mi4. do8 do[do]

    %40
    re mi fa2
    re4. sib'8 sib[sib]
    mi,2 fa8 sol

    %43
    la sib mi,4 la\mbreak
    la2.
    re,4. re8 re[re]

    %46
    la'4. la,8 la[la]
    la4 si dod
    re2.

    %49
    do?4. do8 do[do]
    sol'4. sol,8 sol[sol]
    sol4 la si

    %52
    do2.
    R
    fa4 fa fa

    %55
    fa sib8 la sol fa
    mi4 mi mi\mbreak
    mi la8 sol fa mi

    %58
    re4 re re
    re' re re
    sol, r r

    %61
    R2.*7
    r4 r8 sol\tu fa[mi]
    fa4 fa8 fa fa fa

    %70
    re4 re re
    mi mi8 mi mi mi
    do4 do do\mbreak

    %73
    re re8 re re re
    mi4. re8 do4
    do8 re sol,4. do8

    %76
    do2.\fermata

}

IVfgn = \relative do {

    fa4 r r
    mi r r
    fa r r

    %4
    do8 mi16 re do8 sib la[sol]
    la2 fa4
    sol4. la8 sib4

    %7
    fa do' do,
    fa'8 mi16 re do8 sib la[sol]
    fa2 fa'4

    %10
    mi2.
    re2 fa4\mbreak
    sol8 si16 la sol8 fa mi[re]

    %13
    R2.*7
    r4 sol8\tu fa mi re
    do4 la do

    %22
    re re, re'
    si sol si
    do do, do'

    %25
    la fa la
    sol2 si4
    do8 fa sol4 sol,

    %28 OK
    do2.
    do'4 do, do'
    si sol si

    %31
    sol si sol
    do8 re do sib! la sol
    fa4 re fa

    %34
    dod la dod
    la dod la
    re2.

    %37
    re'4 re, re'
    dod2.
    do!4 do, do'

    %40
    si2.
    sib!4 sib, sib'\mbreak
    la8 sib la sol fa mi

    %43
    re sol la4 la,
    re8 do16 sib la8 sol fa[mi]
    re4 r r

    %46
    R2.*6
    do''4 do do
    la8 do16 sib la8 sol fa[mi]

    %54
    re fa re fa re fa
    sol sib16 la sol8 fa mi[re]
    do mi do mi do mi

    %57
    fa la16 sol fa8 mi re[do]
    sib re sib re sib re
    si re si re si re

    %60
    do4 r r
    R2.*7
    r4 do'8\tu sib la sol

    %69
    fa4 re fa
    sol sol, sol'\mbreak
    mi do mi

    %72
    fa fa, fa'
    re sib re
    do2 mi4

    %75
    fa8 sib, do4 do,
    fa2.\fermata

}

IVbcn = \relative do {

    fa4 r r
    mi r r
    fa r r

    %4
    do8 mi16 re do8 sib la[sol]
    la2 fa4
    sol4. la8 sib4

    %7
    fa do' do,
    fa'8 mi16 re do8 sib la[sol]
    fa2 fa'4

    %10
    mi2.
    re2 fa4\mbreak
    sol8 si16 la sol8 fa mi[re]

    %13
    do4 do'\solo do
    do2.
    si4 si, si'

    %16
    si?2.
    la4 la, la'
    sol2 sol,4

    %19
    do si do
    sol sol'8\tu fa mi[re]\mbreak
    do4 la do

    %22
    re re, re'
    si sol si
    do do, do'

    %25
    la fa la
    sol2 si4
    do8 fa sol4 sol,

    %28 OK
    do2.
    do'4 do, do'
    si sol si

    %31
    sol si sol
    do8 re do sib! la sol
    fa4 re fa

    %34
    dod la dod
    la dod la
    re2.

    %37
    re'4 re, re'
    dod2.
    do!4 do, do'

    %40
    si2.
    sib!4 sib, sib'\mbreak
    la8 sib la sol fa mi

    %43
    re sol la4 la,
    re8 do16 sib la8 sol fa[mi]
    re4. \clef tenor re''8 re[re]

    %46
    la'4. la,8 la[la]
    la4 si dod
    re2.\mbreak

    %49
    do4. do8 do[do]
    sol'4. sol,8 sol[sol]
    sol4 la si

    %52
    \clef bass  do4 do do
    la8 do16 sib la8 sol fa[mi]
    re fa re fa re fa

    %55
    sol sib16 la sol8 fa mi[re]
    do mi do mi do mi
    fa la16 sol fa8 mi re[do]

    %58
    sib re sib re sib re
    si re si re si re
    do4 fa\solo fa

    %61
    fa fa, fa'
    fa2.
    mi4 mi, mi'\mbreak

    %64
    mi2.
    re4 re, re'
    do2 mi4

    %67
    fa mi fa
    do do'8\tu sib la sol
    fa4 re fa

    %70
    sol sol, sol'\mbreak
    mi do mi
    fa fa, fa'

    %73
    re sib re
    do2 mi4
    fa8 sib, do4 do,

    %76
    fa2.\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6>
    s
    s
    <6>
    s
    s4 <4> <3>
    s2.*2
    <6>2.
    <7>
    <_!>
    s2 <6>4
    <4 2>2.
    <6 5>
    <4 2>
    s
    <_!>
    s4 <6 5> s
    <_!> <_!> <6>
    <6 5>2.
    <9>2 <8>4
    <6 5>2.
    <9>4 s <8>
    <6>2.
    <7>2 <6 5>4
    s <4> <_!>
    s2.*2
    <6>2.
    <_!>
    s
    <6>
    <6>
    <_+>
    s
    <6>
    <7>
    <6>
    <7>
    <6>
    <7 _+>
    s4 <4> <_+>
    s2.*2
    <_+>2 <_+>4
    <_+> <7> <6>
    s2.
    s
    <_!>
    s4 <7> <6>
    s2.
    <6>
    <7>
    <7>
    <7>
    <7>
    <7>
    <6>
    s
    s4 s <6>
    <4 2>2.
    <6>
    <4 2>
    s
    s2 <6 5>4
    s <6 5> s
    s2.
    <6 5>
    <9>2 <8>4
    <6 5>2.
    <9>2 <8>4
    s2.
    s2 <6 5>4
    s <4> <3>

}

forma = {

    \key fa\major
    \time 3/4
    \tempo 2 = 60
    s2.*28
    \bar ":..:"\break
    s2.*48
    \bar ":|."

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


IVvlrpI = {
    \IVglobal
    <<\IVvlrpIn \forma>>
}


IVvlrpII = {
    \IVglobal
    <<\IVvlrpIIn \forma>>
}


IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>
}


IVfg = {
    \IVglobal
    \clef bass
    <<\IVfgn \forma>>
}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset
}



Vglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
    \terzinequarto \senza

}

VvlIn = \relative do'' {

    r16 fa mi fa
    do fa mi fa do fa mi fa
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol

    %4
    la sol fa mi fa do sib do\mbreak
    la do sib do fa, do' sib do
    re fa mi fa la, fa' mi fa

    %7
    sib, sib' la sol la fa mi sol
    fa8 fa, r16 la' sol la %%%%% fine
    fa la sol la do, la' sol fa\mbreak

    %10
    sol la sol fa mi sol fa sol
    mi sol fa sol do, sol' fa mi
    fa sol fa mi re fa mi fa

    %13
    re fa mi fa si, fa' mi re
    mi fa mi re do mi fa sol\mbreak
    la sol fa mi fa mi re do

    %16
    re do si la sol do si do
    sol do si do sol do si do
    la do si do la do si do

    %19
    sol do si do\mbreak sol do si do
    la do si do la do si do
    sol do si do sol do si do

    %22
    la si do re mi fa sol la
    sol fa mi fa re8. do16
    do8 do,\mbreak \once\stemUp do16 fa'\p mi fa

    %25
    do fa mi fa do fa mi fa
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol

    %28
    la sol fa mi fa do sib do
    la do sib do\mbreak fa, do' sib do
    re fa mi fa la, fa' mi fa

    %31
    sib, sib' la sol la fa mi sol
    fa8 fa, \once\stemUp fa16 la'\f sol la
    fa la sol la mi la sol la

    %34
    fa sol fa mi\mbreak  re fa sol la
    sib la sol fa sol fa mi re
    mi re dod si la la' sol la

    %37
    fa la sol la mi la sol la
    fa la sol la re, la' sol la\mbreak
    sib la sol fa mi re dod mi

    %40
    re8 re, re16 sol' sol sol
    mib sol sol sol re sol sol sol
    mib sol sol sol do, fa fa fa

    %43
    re fa fa fa do fa fa fa\mbreak
    re fa fa fa sib, mib mib mib
    do re do sib la re do re

    %46
    sib do sib la sol do sib do
    la sib la sol fa fa' mi fa
    do fa mi fa do fa mi fa

    %49
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol
    la sol fa mi fa do sib do\mbreak

    %52
    la do sib do fa, do' sib do
    re fa mi fa la, fa' mi fa
    sib, sib' la sol la fa mi sol

    %55
    fa8 fa,\fermata r4

}

VvlIIn = \relative do'' {

    r16 fa mi fa
    do fa mi fa do fa mi fa
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol

    %4
    la sol fa mi fa do sib do\mbreak
    la do sib do fa, do' sib do
    re fa mi fa la, fa' mi fa

    %7
    sib, sib' la sol la fa mi sol
    fa8 fa, r16 la' sol la %%%%% fine
    fa la sol la do, la' sol fa\mbreak

    %10
    sol la sol fa mi sol fa sol
    mi sol fa sol do, sol' fa mi
    fa sol fa mi re fa mi fa

    %13
    re fa mi fa si, fa' mi re
    mi fa mi re do mi fa sol\mbreak
    la sol fa mi fa mi re do

    %16
    re do si la sol do si do
    sol do si do sol do si do
    la do si do la do si do

    %19
    sol do si do\mbreak sol do si do
    la do si do la do si do
    sol do si do sol do si do

    %22
    la si do re mi fa sol la
    sol fa mi fa re8. do16
    do8 do,\mbreak \once\stemUp do16 fa'\p mi fa

    %25
    do fa mi fa do fa mi fa
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol

    %28
    la sol fa mi fa do sib do
    la do sib do\mbreak fa, do' sib do
    re fa mi fa la, fa' mi fa

    %31
    sib, sib' la sol la fa mi sol
    fa8 fa, \once\stemUp fa16 la'\f sol la
    fa la sol la mi la sol la

    %34
    fa sol fa mi\mbreak  re fa sol la
    sib la sol fa sol fa mi re
    mi re dod si la la' sol la

    %37
    fa la sol la mi la sol la
    fa la sol la re, la' sol la\mbreak
    sib la sol fa mi re dod mi

    %40
    re8 re, re16 sol' sol sol
    mib sol sol sol re sol sol sol
    mib sol sol sol do, fa fa fa

    %43
    re fa fa fa do fa fa fa\mbreak
    re fa fa fa sib, mib mib mib
    do re do sib la re do re

    %46
    sib do sib la sol do sib do
    la sib la sol fa fa' mi fa
    do fa mi fa do fa mi fa

    %49
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol
    la sol fa mi fa do sib do\mbreak

    %52
    la do sib do fa, do' sib do
    re fa mi fa la, fa' mi fa
    sib, sib' la sol la fa mi sol

    %55
    fa8 fa,\fermata r4

}

VvlrpIn = \relative do'' {

    r16 fa mi fa
    do fa mi fa do fa mi fa
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol

    %4
    la sol fa mi fa do sib do\mbreak
    la do sib do fa, do' sib do
    re fa mi re la fa' mi fa

    %7
    sib, sib' la sol la fa mi sol
    fa8 fa, r16 la' sol la %%%%% fine
    fa la sol la do, la' sol fa\mbreak

    %10
    sol la sol fa mi sol fa sol
    mi sol fa sol do, sol' fa mi
    fa sol fa mi re fa mi fa

    %13
    re fa mi fa si, fa' mi re
    mi fa mi re do mi fa sol\mbreak
    la sol fa mi fa mi re do

    %16
    re do si la sol do si do
    sol do si do sol do si do
    la do si do la do si do

    %19
    sol do si do\mbreak sol do si do
    la do si do la do si do
    sol do si do sol do si do

    %22
    la si do re mi fa sol la
    sol fa mi fa re8. do16
    do8 do,\mbreak \once\stemUp do16 fa'\p mi fa

    %25
    do fa mi fa do fa mi fa
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol

    %28
    la sol fa mi fa do sib do
    la do sib do\mbreak fa, do' sib do
    re fa mi fa la, fa' mi fa

    %31
    sib, sib' la sol la fa mi sol
    fa8 fa, \once\stemUp fa16 la'\f sol la
    fa la sol la mi la sol la

    %34
    fa sol fa mi\mbreak  re fa sol la
    sib la sol fa sol fa mi re
    mi re dod si la la' sol la

    %37
    fa la sol la mi la sol la
    fa la sol la re, la' sol la\mbreak
    sib la sol fa mi re dod mi

    %40
    re8 re, re16 sol' sol sol
    mib sol sol sol re sol sol sol
    mib sol sol sol do, fa fa fa

    %43
    re fa fa fa do fa fa fa\mbreak
    re fa fa fa sib, mib mib mib
    do re do sib la re do re

    %46
    sib do sib la sol do sib do
    la sib la sol fa fa' mi fa
    do fa mi fa do fa mi fa

    %49
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol
    la sol fa mi fa do sib do\mbreak

    %52
    la do sib do fa, do' sib do
    re fa mi re la fa' mi fa
    sib, sib' la sol la fa mi sol

    %55
    fa8 fa,\fermata r4

}

VvlrpIIn = \relative do'' {

    r16 fa mi fa
    do fa mi fa do fa mi fa
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol

    %4
    la sol fa mi fa do sib do\mbreak
    la do sib do fa, do' sib do
    re fa mi re la fa' mi fa

    %7
    sib, sib' la sol la fa mi sol
    fa8 fa, r16 la' sol la %%%%% fine
    fa la sol la do, la' sol fa\mbreak

    %10
    sol la sol fa mi sol fa sol
    mi sol fa sol do, sol' fa mi
    fa sol fa mi re fa mi fa

    %13
    re fa mi fa si, fa' mi re
    mi fa mi re do mi fa sol\mbreak
    la sol fa mi fa mi re do

    %16
    re do si la sol do si do
    sol do si do sol do si do
    la do si do la do si do

    %19
    sol do si do\mbreak sol do si do
    la do si do la do si do
    sol do si do sol do si do

    %22
    la si do re mi fa sol la
    sol fa mi fa re8. do16
    do8 do,\mbreak \once\stemUp do16 fa'\p mi fa

    %25
    do fa mi fa do fa mi fa
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol

    %28
    la sol fa mi fa do sib do
    la do sib do\mbreak fa, do' sib do
    re fa mi fa la, fa' mi fa

    %31
    sib, sib' la sol la fa mi sol
    fa8 fa, \once\stemUp fa16 la'\f sol la
    fa la sol la mi la sol la

    %34
    fa sol fa mi\mbreak  re fa sol la
    sib la sol fa sol fa mi re
    mi re dod si la la' sol la

    %37
    fa la sol la mi la sol la
    fa la sol la re, la' sol la\mbreak
    sib la sol fa mi re dod mi

    %40
    re8 re, re16 sol' sol sol
    mib sol sol sol re sol sol sol
    mib sol sol sol do, fa fa fa

    %43
    re fa fa fa do fa fa fa\mbreak
    re fa fa fa sib, mib mib mib
    do re do sib la re do re

    %46
    sib do sib la sol do sib do
    la sib la sol fa fa' mi fa
    do fa mi fa do fa mi fa

    %49
    sol fa mi re do sol' fa sol
    do, sol' fa sol do, sol' fa sol
    la sol fa mi fa do sib do\mbreak

    %52
    la do sib do fa, do' sib do
    re fa mi re la fa' mi fa
    sib, sib' la sol la fa mi sol

    %55
    fa8 fa,\fermata r4

}

Vvlan = \relative do' {

    r16 la' sol la
    fa la sol la fa la sol la
    mi8 [mi mi mi]
    mi[mi mi mi]\mbreak

    %4
    do4 r16 la' sol la
    fa la sol la fa la sol la
    fa8 re' do sib16 la

    %7
    sol8 do do4
    do2 %%%% fine
    do4 la

    %10
    mi r16 mi re mi
    sol8[mi mi la]
    la4 r16 la sol la\mbreak

    %13
    fa8[re re sol]
    sol4 r16 do, re mi
    fa8[la fa la]

    %16
    si,4. sol'8
    do,4 mi
    do fa

    %19
    do mi
    do fa
    do mi

    %22
    do16 re mi fa sol8 mi
    do4 si\mbreak
    do r16 la'\p sol la

    %25
    fa la sol la fa la sol la
    mi8 [mi mi mi]
    mi[mi mi mi]\mbreak

    %28
    do4 r16 la' sol la
    fa la sol la fa la sol la
    fa8 re' do sib16 la

    %31
    sol8 do do4
    do r16 do\f sib do
    la4 la

    %34
    la r16 la sib do
    re,8[re' re re]
    dod2

    %37
    la4 la
    la r16 fa mi fa
    re8 mi16 fa dod8 la'

    %40
    la4 r16 re re re
    sol,4 sol\mbreak
    sol4 r16 do do do

    %43
    fa,4 fa
    fa r16 sib sib sib
    fa4 r16 la la la

    %46
    re,8 mi16 fa sol8 sol
    do,4 r16 la' sol la
    fa16 la sol la fa la sol la

    %49
    mi8 [mi mi mi]
    mi[mi mi mi]\mbreak
    do4 r16 la' sol la

    %52
    fa la sol la fa la sol la
    fa8 re' do sib16 la
    sol8 do do4

    %55
    do2\fermata

}

Vfgn = \relative do {

    r4
    fa fa,
    do'2
    do'4 do,

    %4
    fa2
    fa4 fa,
    sib fa'

    %7
    sol8[fa do' do,]
    fa2 %% fine
    la4 fa

    %10
    do'2
    do4 do,\mbreak
    re re'

    %13
    si sol
    do2
    fa,4 re

    %16
    sol4. fa8
    mi4 do
    fa fa,

    %19
    mi' do
    fa fa,
    mi' do

    %22
    fa do
    mi8[fa sol sol,]
    do4 r

    %25
    fa\p fa,
    do'2\mbreak
    do'4 do,

    %28
    fa2
    fa4 fa,
    sib fa'

    %31
    sol8[fa do' do,]
    fa4 fa,\f
    re' dod

    %34
    re fa
    sol sib
    la2

    %37
    re,4 dod
    re fa
    sol8 re la' la,

    %40
    re4 si\mbreak
    do si
    do la

    %43
    sib! la
    sib sol
    la fa

    %46
    sol mi
    fa2
    fa'4 fa,

    %49
    do'2
    do'4 do,
    fa2

    %52
    fa4 fa,
    sib fa'
    sol8[fa do' do,]

    %55
    fa2\fermata %% fine

}

Vbcn = \relative do {

    r4
    fa fa,
    do'2
    do'4 do,

    %4
    fa2
    fa4 fa,
    sib fa'

    %7
    sol8[fa do' do,]
    fa2 %% fine
    la4 fa

    %10
    do'2
    do4 do,\mbreak
    re re'

    %13
    si sol
    do2
    fa,4 re

    %16
    sol4. fa8
    mi4 do
    fa fa,

    %19
    mi' do
    fa fa,
    mi' do

    %22
    fa do
    mi8[fa sol sol,]
    do4 r

    %25
    fa\p fa,
    do'2\mbreak
    do'4 do,

    %28
    fa2
    fa4 fa,
    sib fa'

    %31
    sol8[fa do' do,]
    fa4 fa,\f
    re' dod

    %34
    re fa
    sol sib
    la2

    %37
    re,4 dod
    re fa
    sol8 re la' la,

    %40
    re4 si\mbreak
    do si
    do la

    %43
    sib! la
    sib sol
    la fa

    %46
    sol mi
    fa2
    fa'4 fa,

    %49
    do'2
    do'4 do,
    fa2

    %52
    fa4 fa,
    sib fa'
    sol8[fa do' do,]

    %55
    fa2\fermata %% fine

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s2*6
    s8 s <4> <3>
    s2  %% fine
    <6>
    s
    s4 <6>
    s2*4
    <_!>2
    <6>
    s
    <6>
    s
    <6>
    s
    <6>4 <_!>
    s2*7
    s8 s <4> <3>
    s2
    s4 <6>
    s <6>
    <6 5>2
    <_+>
    s4 <6>
    s <6>
    <6 5> <_+>
    s <6 5>
    <_-> <6>
    <_-> <6>
    s <6>
    s <6->
    <6>2
    <6>
    s
     s2*6
    s8 s <4> <3>

}

forma = {

    \key fa\major
    \time 2/4
    \tempo 2 = 70
    \partial 4 s4
    s2*55
    \bar "|."

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


VvlrpI = {
    \Vglobal
    <<\VvlrpIn \forma>>
}


VvlrpII = {
    \Vglobal
    <<\VvlrpIIn \forma>>
}


Vvla = {
    \Vglobal
    \clef alto
    <<\Vvlan \forma>>
}


Vfg = {
    \Vglobal
    \clef bass
    <<\Vfgn \forma>>
}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset
}
#(set-global-staff-size 16)


\pointAndClickOff

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge {[1.] Allegro}

\score {

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column {"Violino"\vspace #-0.2 "Primo"}
                        \set Staff.midiInstrument = #"violin"
                        \IvlI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2 "Secondo"}
                        \set Staff.midiInstrument = #"violin"
                        \IvlII
                    >>
                >>

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column {"Violino Primo"\vspace #-0.2 "de Concerto"\vspace #-0.2 "Grosso"}
                        \set Staff.midiInstrument = #"violin"
                        \IvlrpI
                    >>

                    \new Staff <<
                        \set Staff.instrumentName = \markup \center-column{"Violino Secondo"\vspace #-0.2 "de Concerto"\vspace #-0.2 "Grosso"}
                        \set Staff.midiInstrument = #"violin"
                        \IvlrpII
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Alto"\vspace #-0.2"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \Ivla
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                    \set Staff.midiInstrument = #"bassoon"
                    \Ifg
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                } <<
                    \set Staff.instrumentName = \markup \center-column{"Organo"}
                    \set Staff.midiInstrument = #"church organ"
                    \Ibc
                >>
            >>

    \layout {

        indent = 2.2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

\markup \huge {[2.] Aria Allegro}

\score {

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIvlII
                    >>
                >>

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIvlrpI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIvlrpII
                    >>
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvla
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \IIfg
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                } <<
                    \set Staff.midiInstrument = #"church organ"
                    \IIbc
                >>
            >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

\markup \huge {[3.] Largo e Cantabile}

\score {

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlII
                    >>
                >>

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlrpI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlrpII
                    >>
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIIvla
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \IIIfg
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                } <<
                    \set Staff.midiInstrument = #"church organ"
                    \IIIbc
                >>
            >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

\markup \huge {[4.] Allegro ma non presto}

\score {

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlII
                    >>
                >>

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlrpI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlrpII
                    >>
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IVvla
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \IVfg
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                } <<
                    \set Staff.midiInstrument = #"church organ"
                    \IVbc
                >>
            >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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

\markup \huge {[5.] Presto Assai}

\score {

            \new ChoirStaff <<

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlII
                    >>
                >>

                \new PianoStaff <<

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlrpI
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlrpII
                    >>
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \Vvla
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"bassoon"
                    \Vfg
                >>

                \new Staff \with {
                    fontSize = #+1
                    \override StaffSymbol.staff-space = #(magstep +1)
                } <<
                    \set Staff.midiInstrument = #"cello"
                    \Vbc
                >>
            >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
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
