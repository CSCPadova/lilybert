\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

cadenza_vlI = \relative do {

    \tempo 4 = 40


}

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

dolce = _\markup \italic { dolce }

rinf = _\markup \italic { rinf }

tu = ^\markup \italic "tutti"

pf = _\markup { \italic poco \dynamic f}

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

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
        \musicglyph "scripts.prall"
    }
}


mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    mi4 r sol r
    do8 sol mi do sol' mi do sol
    mi' do sol mi do'[sol do re16 mi]

    %4
    re8[sol, re' mi16 fa] mi sol re sol mi sol re sol
    mi sol re sol mi sol re sol mi8 do la'16 la la la
    re, re re re sol sol sol sol do, do do do fa fa fa fa\mbreak

    %7
    si, si si si mi mi mi mi la, la la la re re re re
    sol, sol sol sol do, do do do do do do do si si si si
    do4 do'2 si4~

    %10
    si la2 sol4~
    sol fa2 mi4
    re2 \once\stemUp do16_\markup\italic "2 V.[iolini] Soli" [sol'' fa sol la8 la]

    %13
    la8\tr(sol) do sol sol\tr[fa16 sol la8 la]
    la8\tr(sol) do sol la8\tr(sol) do sol
    la\tr(sol) la16 sol fa mi re8 sol la16\tu la la la\mbreak

    %16
    re,16 re re re sol sol sol sol do, do do do fa fa fa fa
    si, si si si mi mi mi mi la, la la la re re re re
    sol, sol sol sol do, do do do do do do do si si si si

    %19
    \once\stemUp do16_\markup\italic "2 V.[iolini] Soli" [sol'' fa sol la8 la] la8\tr(sol) do sol
    sol\tr[fa16 sol la8 la] la\tr(sol) do sol
    la\tr(sol) do sol la\tr(sol) la16 sol fa mi\mbreak

    %22
    re4 r16 sol\solo fa sol mi sol do, sol' sib, mi fa sol
    fa do fa la fa do fa la fad la re, la' do, fad sol la
    sol re sol si sol re sol si sold si sold si re, sold la si

    %25
    la mi la do la mi la do la fa? la do la fa la do
    la fad la re la fad la re si sol? si re si sol si re\mbreak
    si fa si re si fa si re mi, do' mi, do' mi, do' mi, do'

    %28
    re, do' re, do' re, do' re, do' re, si' re, si' re, si' re, si'
    do, si' do, si' do, si' do, si' do, la' do, la' do, la' do, la'
    si,  la' si, la' si,  la' si, la' si, sol' si, sol' si, sol' si, sol'

    %31
    la, sol' la, sol' la, fad' la, fad' sol8\tu re si sol
    re' si sol re\mbreak si' sol re si
    sol'[re sol la16 si] la8[re, la' si16 do]

    %34
    si re la re si re la re si re la re si re la re
    si8 sol mi'16 mi mi mi la, la la la re re re re
    sol, sol sol sol do do do do fad, fad fad fad si si si si

    %37
    mi, mi mi mi la la la la re, re re re sol sol sol sol
    sol sol sol sol fad fad fad fad\mbreak sol4 sol'~
    sol fad2 mi4~

    %40
    mi re2 do4~
    do si la2
    sol16\solo sol' fa sol mi fa re mi do mi re mi do re sib do

    %43
    la la' sol la fa sol mi fa re la' sol la fad mi re do\mbreak
    si8 re sol16\tu sol sol sol do, do do do la' la la la
    re, re re re si' si si si mi, mi mi mi do' do do do

    %46
    fa, fa fa fa re' re re re sol, sol sol sol do do do do
    do do do do si si si si do4 do,~
    do si2 la4~

    %49
    la sol2 fa4~\mbreak
    fa mi re2
    do1\fermata

}

IvlIIn = \relative do'' {

    mi4 r sol r
    do8 sol mi do sol' mi do sol
    mi' do sol mi do'[sol do re16 mi]

    %4
    re8[sol, re' mi16 fa] mi sol re sol mi sol re sol
    mi sol re sol mi sol re sol mi8 do la'16 la la la
    re, re re re sol sol sol sol do, do do do fa fa fa fa\mbreak

    %7
    si, si si si mi mi mi mi la, la la la re re re re
    sol, sol sol sol do, do do do do do do do si si si si
    do4 do'2 si4~

    %10
    si la2 sol4~
    sol fa2 mi4
    re2\once\stemUp do16_\markup\italic "2 V.[iolini] Soli" [mi' re mi fa8 fa]

    %13
    fa\tr(mi) la mi mi\tr[re16 mi fa8 fa]
    fa\tr(mi) la mi fa\tr(mi) la mi
    fa\tr(mi) fa16 mi re do si8 sol' la16\tu la la la

    %16
    re,16 re re re sol sol sol sol do, do do do fa fa fa fa
    si, si si si mi mi mi mi la, la la la re re re re
    sol, sol sol sol do, do do do do do do do si si si si

    %19
    \once\stemUp do16_\markup\italic "2 V.[iolini] Soli" [mi' re mi fa8 fa] fa\tr(mi) la mi
    mi\tr[re16 mi fa8 fa] fa\tr(mi) la mi
    fa\tr (mi) la mi fa\tr(mi) fa16 mi re do\mbreak

    %22
    si4 r <<mi\\do>> r
    <<fa\\do>> r <<fad\\re>> r
    <<sol\\mi>> r <<sold\\ mi>> r

    %25
    <<la\\mi>> r <<la\\do,>> r
    <<la'\\re,>> r <<si'\\ re,>> r\mbreak
    <<si'\\ re,>> r <<do'\\mi,>> r

    %28
    <<do'\\re,>> r <<si'\\re,>> r
    <<si'\\do,>> r <<la'\\do,>> r
    <<la'\\si,>> r <<
        {
            sol' sol

            %31
            sol fad
        }\\{
            si, si
            la la
        }
    >> sol'8\tu re si sol
    re' si sol re\mbreak si' sol re si
    sol'[re sol la16 si] la8[re, la' si16 do]

    %34
    si re la re si re la re si re la re si re la re
    si8 sol mi'16 mi mi mi la, la la la re re re re
    sol, sol sol sol do do do do fad, fad fad fad si si si si

    %37
    mi, mi mi mi la la la la re, re re re sol sol sol sol
    sol sol sol sol fad fad fad fad\mbreak sol4 sol'~
    sol fad2 mi4~

    %40
    mi re2 do4~
    do si la2
    sol4 r r2

    %43
    R1\mbreak
    r8 re' sol16\tu sol sol sol do, do do do la' la la la
    re, re re re si' si si si mi, mi mi mi do' do do do

    %46
    fa, fa fa fa re' re re re sol, sol sol sol do do do do
    do do do do si si si si do4 do,~
    do si2 la4~

    %49
    la sol2 fa4~\mbreak
    fa mi re2
    do1\fermata

}

Ivlan = \relative do' {

    sol'4 r mi r
    mi r mi r
    do r sol'4. sol8

    %4
    sol4. sol8 sol sol sol sol
    sol sol sol sol sol4 mi16 mi mi mi
    fa fa fa fa re re re re mi mi mi mi do do do do\mbreak

    %7
    re re re re si si si si do do do do la la la la
    si si si si do do do do re re re re re re re re
    mi4 mi16 mi mi mi fa fa fa fa re re re re

    %10
    mi mi mi mi do do do do re re re re si si si si
    do do do do la la la la\mbreak si si si si do do do do
    do do do do si si si si do4 r

    %13
    R1*2
    r2 r4 mi16 mi mi mi\mbreak
    fa fa fa fa re re re re mi mi mi mi do do do do

    %17
    re re re re si si si si do do do do la la la la
    si si si si do do do do re re re re re re re re
    mi4 r r2

    %20
    R1*2\mbreak
    r2 sol4 r
    do, r la' r

    %24
    re, r si' r
    mi, r do' r
    do r si r\mbreak

    %27
    sol r sol r
    la r sol r
    sol r fa r

    %30
    fa  r mi re
    mi re re r
    si' r\mbreak sol r

    %33
    re4. re8 re4. re8
    re re re re re re re re
    re4 si'16 si si si do do do do la la la la

    %36
    si si si si sol sol sol sol la la la la fad fad fad fad
    sol sol sol sol mi mi mi mi fad fad fad fad sol sol sol sol
    la la la la la la la la\mbreak si4 si16 si si si

    %39
    do do do do la la la la si si si si sol sol sol sol
    la la la la fad fad fad fad sol sol sol sol mi mi mi mi
    fad fad fad fad sol sol sol sol sol sol sol sol fad fad fad fad

    %42
    sol4 r r2
    R1\mbreak
    r4 do,16 do do do la la la la re re re re

    %45
    si si si si mi mi mi mi do do do do fa fa fa fa
    re re re re sol sol sol sol mi mi mi mi sol sol sol sol
    re re re re re re re re mi4 mi16 mi mi mi

    %48
    fa fa fa fa re re re re mi mi mi mi do do do do
    re re re re si si si si do do do do la la la la\mbreak
    si si si si do do do do re re re re re re re re

    %51
    mi1\fermata

}


Ibcn = \relative do {

    do4 r do r
    do r do r
    do r mi4. re16 do

    %4
    si4. si8 do si do si
    do si do si do4 do'~
    do si2 la4~\mbreak

    %7
    la sol2 fa4~
    fa mi fa sol
    do, la'16 la la la re, re re re sol sol sol sol

    %10
    do, do do do fa fa fa fa si, si si si mi mi mi mi
    la, la la la re re re re\mbreak sol, sol sol sol do do do do
    fa fa fa fa sol sol sol sol do,4 r

    %13
    R1*2
    r2 r4 do'~\mbreak
    do si2 la4~

    %17
    la sol2 fa4~
    fa mi fa sol
    do, r r2

    %20
    R1*2\mbreak
    r2 do4 r
    la r re r

    %24
    si r mi r
    do r fa r
    fad r sol r\mbreak

    %27
    fa! r mi r
    fa r si, r
    mi r la, r

    %30
    re r sol, si
    do re sol r
    sol r\mbreak sol r

    %33
    si4. la16 sol fad4. fad8
    sol fad sol fad sol fad sol fad
    sol sol, sol'2 fad4~

    %36
    fad mi2 re4~
    re do2 si4
    do re\mbreak sol, mi''16 mi mi  mi

    %39
    la, la la la re re re re sol, sol sol sol do do do do
    fad, fad fad fad si si si si mi, mi mi mi la la la la
    re, re re re sol, sol sol sol do do do do re re re re

    %42
    sol,4 sol'8 fa mi2
    fa fad4 la\mbreak
    sol mi8 mi, fa' fa, fad'[fad,]

    %45
    sol' sol, sold'[sold,] la' la, la'[la,]
    si' si, si'[si,] do' do, mi do
    fa re sol sol, do4 la'16 la la la

    %48
    re, re re re sol sol sol sol do, do do do fa fa fa fa
    si, si si si mi mi mi mi la, la la la re re re re\mbreak
    sol, sol sol sol do do do do fa fa fa fa sol sol sol sol

    %51
    do,1\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*5
    <4 2>4 <6 3> <4 2> <6 3>
    <4 2> <6 3> <4 2> <6 3>
    <4 2> <6 3> <6 5> s
    s s <7> <5 3>
    <7> <5 3> <7> <5 3>
    s <5 3> <7> <3>
    <6 5>1
    s1*3
    <4 2>4 <6 3>  <4 2> <6 3>
    <4 2> <6 3> <4 2> <6 3>
    <4 2> <6 3> <6 5> s
    s1*4
    <6>2 <_+>
    <6>2 <_+>
    <6>1
    s
    <4 2>2 <6 3>
    <6 5> s
    <6 5>1
    <6 5>
    <6 5>4 <_+> s2
    s1*3
    s2 <4 2>4 <6 3>
    <4 2>4 <6 3> <4 2> <6 3>
    <4 2> <6 3> <4 2> <6 3>
    <6 5>4 <_+> s2
    <7>4 <5 3+> <7> <5 3>
    <7> <5+ 3> <7> <5 3>
    <7 _+> s <6 5> <_+>
    s s <6> <5->
    s s <6> <6+ 4>s s <5> <6>
    <5> <6> <5> <6>
    <5> <6> <5> <6>
    <6 5>1
    <7>4 <5 3> <7> <5 3>
    <7> <5 3> <7> <5 3>
    <7>2 <6 5>

}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 63
    s1*51
    \bar"|."

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
}

IIvlIn = \relative do'' {

    fad4 r8 r16 fad fad8. fad16
    fa!2\fermata r4
    mi r8 r16 mi mi8. mi16

    %4
    mib2\fermata r4
    re r8 r16 re re8. re16
    do2\fermata r4

    %7
    sol' r8 r16 sol sol8. sol16
    fad4 r8 r16 fad fad8. fad16
    sol4 r8 r16 sol sol8. sol16\mbreak

    %10
    sol4 r8 r16 sol fad8. fad16
    sol2.\fermata

}

IIvlIIn = \relative do'' {

    do4 r8 r16 do do8. do16
    si2\fermata r4
    sib r8 r16 sib sib8. sib16

    %4
    la2\fermata r4
    fa' r8 r16 fa fa8. fa16
    mi2\fermata r4

    %7
    dod4 r8 r16 dod dod8. dod16
    do!4 r8 r16 do do8. do16
    si?4 r8 r16 sib sib8. sib16\mbreak

    %10
    la4 r8 r16 la la8. la16
    si!2.\fermata

}

IIvlan = \relative do' {

    la'4 r8 r16 la re,8. re16
    re2\fermata r4
    sol r8 r16 sol do,8. do16

    %4
    do2\fermata r4
    si' r8 r16 si si8. si16
    sol2\fermata r4

    %7
    mi r8 r16 mi la8. la16
    la4 r8 r16 la la8. la16
    re,4 r8 r16 re re8. re16\mbreak

    %10
    re4 r8 r16 re re8. re16
    re2.\fermata

}


IIbcn = \relative do {

    re4 r8 r16 re re8. re16
    sol,2\fermata r4
    do r8 r16 do do8. do16

    %4
    fad,2\fermata r4
    sol r8 r16 sol sol8. sol16
    do2\fermata r4

    %7
    la r8 r16 la la8. la16
    re4 r8 r16 re re8. re16
    re4 r8 r16 re re8. re16\mbreak

    %10
    re4 r8 r16 re re8. re16
    sol,2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <7 5 _+>2.
    <7- 5>
    <7- 5>
    <7- 5>
    <7>
    s
    <7 5 _+>
    <7 5 _+>
    <6 4>4 s8 s16 <6> s4
    <5 4>4 s <3+>

}

forma = {

    \time 3/4
    \key do\major
    \tempo 4 = 50
    s2.*11
    \bar"|."

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
}

IIIvlIn = \relative do'' {

    sol'16\solo mi do mi sol mi do mi sol mi do mi
    sol re si re sol re si re sol re si re
    sol mi do mi sol mi do mi sol mi do mi

    %4
    sol re si re sol re si re sol re si re
    sol re si re sol re si re sol re si re
    sol mi la, mi' sol mi la, mi' sol mi la, mi'

    %7
    fad re la re fad re la re fad re la fad'
    <<<sol si, re,>2.	\fermata \\{\stemDown sol,,}>>
    sold''16 mi si mi sold mi si mi sold mi si sold'

    %10
    la mi do mi la mi do mi la mi do mi
    fa re la re fa re la re fa re la fa'
    sol? re si re sol re si re sol re si re

    %13
    mi do sol do mi do sol do mi do sol do
    do la fa la do la fa la do la fa la
    re la fad la re la fad la re la fad la\mbreak

    %16
    re si sol si re si sol si re si sol si
    mi si sold si mi si sold si mi si sold si
    mi do la do mi do la do mi do la do

    %19
    fa do la do fa do la do fa do la do
    fa re si re fa re si re fa re si re
    sol re si re sol re si re sol re si re

    %22
    sol mi do mi sol mi do mi sol mi do mi
    la fa do fa  la fa do fa  la fa do la'\mbreak
    si sol re sol si sol re sol si sol re sol

    %25
    do sol  mi sol do sol  mi sol do sol  mi sol
    do sol  re sol do sol  re sol do sol  re sol
    si sol re sol si sol re sol si sol re sol

    %28
    do sol do, sol' do sol do, sol' do sol do, sol'
    do\p sol  mi sol do sol  mi sol do sol  mi sol
    do sol  re sol do sol  re sol do sol  re sol\mbreak

    %31
    si sol re sol si sol re sol si sol re si'
    do\f do do do sol sol sol sol mi mi mi mi
    sol sol sol sol mi mi mi mi do do do do

    %34
    mi mi mi mi do do do do sol sol sol sol
    do do do do sol sol sol sol mi mi mi mi
    do2.\fermata

}

IIIvlIIn = \relative do'' {

    <<
        {
            mi4 mi mi
            sol sol sol
            mi mi mi

            %4
            re
        }\\{
            do do do
            re re re
            do do do
            si
        }
    >> r r
    <<
        {
            sol' sol sol
            sol sol sol

            %7
            fad fad fad
            sol2.\fermata
        }\\{
            si,4 si si
            la la la
            la la la
            si2.
        }
    >>
    <<
        {
            sold'4 sold sold

            %10
            la la la
            fa fa fa
            re4
        }\\{
            si si si
            do do do
            la la la
            si
        }
    >> r r

    %13
    <<
        {
            do do do
            do do do
            do do do\mbreak

            %16
            si
        }\\{
            sol sol sol
            la la la
            la la la
            sol
        }
    >> r r
    <<
        {
            mi' mi mi
            mi mi mi

            %19
            fa fa fa
            fa
        }\\{
            si, si si
            do do do
            do do do
            si
        }
    >> r r
    <<
        {
            sol' sol sol

            %22
            sol sol sol
            la la la\mbreak
            sol
        }\\{
            re re re
            mi mi mi
            fa fa fa
            fa
        }
    >> r r

    %25
    <<
        {
            sol sol sol
            sol sol sol
            sol sol sol

            %28
            sol
        }\\{
            mi mi mi
            re re re
            re re re
            mi
        }
    >> r r
    <<
        {
            sol\p sol sol
            sol sol sol\mbreak

            %31
            sol sol sol
            sol\f
        }\\{
            mi mi mi
            re re re
            re re re
            \shiftOn \stemUp do
        }\\{
            s2.*3
            \stemDown mi16 do' do do
        }
    >> sol sol sol sol mi mi mi mi
    sol sol sol sol mi mi mi mi do do do do

    %34
    mi mi mi mi do do do do sol sol sol sol
    do do do do sol sol sol sol mi mi mi mi
    do2.\fermata

}

IIIvlan = \relative do' {

    sol'4 sol sol
    sol sol sol
    sol sol sol

    %4
    sol r r
    re re re
    mi mi mi

    %7
    re re re
    re2.\fermata
    mi4 mi mi

    %10
    mi mi mi
    re re re
    re4 r r

    %13
    mi mi mi
    re re re
    re re re\mbreak

    %16
    re r r
    sold sold sold
    mi mi mi

    %19
    la la la
    fa r r
    si si si

    %22
    sol sol sol
    do, do do\mbreak
    re r r

    %25
    do do do
    do do do
    sol sol sol

    %28
    sol r r
    do do do
    do do do\mbreak

    %31
    sol sol sol
    sol r r
    mi' r r

    %34
    sol r r
    mi r r
    mi2.\fermata

}


IIIbcn = \relative do {

    do4 do do
    si si si
    do do do

    %4
    sol r r
    si si si
    do do do

    %7
    re re re
    sol,2.\fermata
    mi'4 mi mi

    %10
    la, la la
    re re re
    sol, r r

    %13
    do do do
    fa,  fa fa
    fad fad fad\mbreak

    %16
    sol r r
    sold sold sold
    la la la

    %19
    la la la
    re r r
    si si si

    %22
    do do do
    fa fa fa\mbreak
    si, r r

    %25
    mi mi mi
    fa fa fa
    sol sol sol

    %28
    do, r r
    mi mi mi
    fa fa fa\mbreak

    %31
    sol sol sol
    do, r r
    do r r

    %34
    do r r
    do r r
    do2.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*5
    <6 5>2.
    <3+>
    s
    <_+>
    s2.*5
    <6 5!>2.
    s
    s
    <5>
    <6>
    s2.*4
    <6 5>2.
    s
    <6 5>
    s2.*3
    <6 5>2.

}

forma = {

    \time 3/4
    \key do\major
    \tempo 2 = 65
    s2.*8
    \bar":|."
    s2.*28
    \bar "|."

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
}

IVvlIn = \relative do'' {

    sol'8\tu fa sol sol, la si do si do r r do
    re mi fa sol4\tr fa8 mi re do r r sol'
    la do, la' la do, la' sol do, sol' sol do, sol'

    %4
    la do, la' la do, la' sol do, sol' sol do, sol'
    la fa mi re mi do si la sol do re mi
    la,(si do re mi fa) si,(do re mi fa sol)

    %7
    do,(re mi fa sol la) re, mi fa sol fa sol\mbreak
    mi fa mi re mi do si sol si do re mi
    la, si do re, mi fa si, la sol do' re mi

    %10
    la, si do sol do si <<{ sol'8\solo fa sol}\\\shiftOn \stemUp do,,4.>>  sol'8 la si
    do\tr si do r r do re mi fa sol4\tr fa8
    mi re do la' sol la re, do re sol fa sol

    %13
    do, si do fa mi fa si, la si mi re mi
    la, si la re mi re\mbreak do re do la' si la
    do, re do la' si la si, do si sol' si, sol'

    %16
    sol la, sol' fad si, fad' sol\tu fad sol re mi fad
    sol fad sol r r sol la si do re4 do8
    si la sol r r sol\solo sol mi re dod re mi

    %19
    fa sol la~la fa mi re mi do si do re
    mi fa sol~sol4 sol8\tu\mbreak la do, la' la do, la'
    sol do, sol' sol do, sol' la do, la' la do, la'

    %22
    sol do, sol' sol do, sol' sol la, sol' sol la, sol'
    fa re fa fa re fa fa si, fa' fa si, fa'
    mi do mi mi do mi la do, la' la do, la'

    %25
    red, si red mi si mi mi la, mi' red si red
    mi si'\solo la sol fa mi red si' la sol fa mi\mbreak
    red si' la sol fa mi red mi fa fa sol la

    %28
    si, dod red red mi fa fa sol la la sol fa
    sol fa mi mi sol si mi, sol si mi, sol si
    red, fad si red, fad si red, fad si red, fad si

    %31
    mi, sol si mi, sol si mi, sol si mi, sol si
    mi, la do mi, la do mi, la do mi, la do
    re, fad la re, fad la\mbreak re, fad la re, fad la

    %34
    re, sol si re, sol si re, sol si re, sol si
    do, mi sol  do, mi sol  do, mi sol  do, mi sol
    do, mi la do, mi la do, mi la do, mi la

    %37
    la sold la la sold la la sold la la sold la
    do2.~do8 re do si do la
    si la sol fad sol mi red mi fad si, do red\mbreak

    %40
    mi fad red mi fad red mi4. r
    sol8\tu fa sol sol, la si do si do r r do
    re mi fa sol4\tr fa8 mi re do r r sol'

    %43
    la do, la' la do, la' sol do, sol' sol do, sol'
    la do, la' la do, la' sol do, sol' sol do, sol'
    la do, la' la do, la' \mbreak sol4 do,8 r r sol'\solo

    %46
    la sol la re, mi fa sol fa sol do, re mi
    fa mi fa si, do re mi re do re do si
    mi re do re do si mi re do fa mi re

    %49
    sol fa mi la sol fa si la sol do si la
    sol fa mi sol, la si do,4. do'8\tu re mi
    la, si do re mi fa si, do re mi fa sol

    %52
    do, re mi fa sol la re,4  sol,8 sol'\solo la16 sol fa mi
    fa8 mi re mi fa16 mi re do si8 sol si do sol do
    re sol, re' mi sol, mi' re sol, re' do sol do

    %55
    si sol si do sol do re sol, re' mi sol, mi'
    re sol, re' mi sol, mi' re sol, re'  mi sol, mi'\mbreak
    fa mi fa re do re si la sol sol si re

    %58
    fa4.~fa8 mi re mi re do sol la si
    do4. do8\tu re mi la, si do re mi fa
    si, do re mi fa sol do, re mi fa sol la

    %61
    re, mi fa sol fa sol mi fa mi re mi do
    si sol si do re mi\mbreak la, si do re, mi fa
    si, la sol do' re mi la, si do sol do si

    %64
    do,4. do'8 re mi la, si do sol do si
    do,4.

}

IVvlan = \relative do' {

    mi4. re mi r
    si re sol, r
    do do do r

    %4
    do do do r
    re la' re, r
    fa r re r

    %7
    do r si r\mbreak
    sol' la re, sol
    do, re re sol

    %10
    do, sol' mi r
    R1.*5
    r2. si'4. la

    %17
    si r fad la
    re, r r2.
    R1.

    %20
    r2.\mbreak do4. do
    do r do do
    do r mi mi

    %23
    la, r re re
    sol, r mi' mi
    fad sol fad fad

    %26
    sol r r2.\mbreak
    R1.*14
    mi4. re mi r

    %42
    si re sol, r
    do do do r
    do do do r

    %45
    do do\mbreak do r
    R1.*4
    r2. r4. sol'\mbreak

    %51
    fa r re r
    do r si r
    R1.*6

    %59
    r4. sol' fa r
    re r do r
    si r sol' la

    %62
    re, sol\mbreak do, re
    re sol do, sol'
    mi sol do, sol'

    %65
    mi

}


IVbcn = \relative do {

    do4. si la r
    la si do r
    fa fa mi r

    %4
    fa fa mi r
    fa fad sol r
    fa,? r sol r

    %7
    la r si r\mbreak
    do fa sol mi
    fa fa, sol mi'

    %10
    fa sol do, si
    la r si sol
    do do'~do si~

    %13
    si la2. sol4.~
    sol fa\mbreak fad fad
    fad? fad sol si,

    %16
    do re sol fad
    mi r re fad
    sol r mi la

    %19
    re, r fa? sol
    do, r\mbreak fa fa
    mi r fa fa

    %22
    mi r dod dod
    re r si si
    do? r do do

    %25
    si sol la si
    mi mi si mi\mbreak
    si mi si2.~

    %28
    si~si
    mi4. mi' mi mi,
    r si' si si,

    %31
    r mi' mi mi,
    r do' do do,
    r fad\mbreak fad fad,?

    %34
    r si' si si,
    r mi mi mi,
    r la' la la,

    %37
    r do' do do,
    r la' red, si
    mi la si si,\mbreak

    %40
    mi r mi r
    do si sol r
    sol si do r

    %43
    fa fa mi r
    fa fa mi r
    fa fa\mbreak mi do'~

    %46
    do si2. la4.~
    la sol do, sol'
    do, sol' do, re

    %49
    mi fa sol la
    mi4 fa8 sol4 sol,8 do4. mi,\mbreak
    fa r sol r

    %52
    la r sol2.~
    sol~sol~
    sol~sol~

    %55
    sol~sol~
    sol~sol~\mbreak
    sol~sol

    %58
    do4. fa sol sol,
    do mi, fa r
    sol r la r

    %61
    si r do fa
    sol mi\mbreak fa fa,
    sol mi' fa sol

    %64
    do, mi fa sol
    do,

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 12/8
    \key do\major
    \tempo 2. = 70
    s1.*64
    s4.
    \bar "|."

}



IVvlI = {
    \global
    <<\IVvlIn \forma>>

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

    fad,4 fad fad16[sol la si dod re mi fad]
    fad,4 fad fad16[sol la si dod re mi fad]
    fad,8 fad' re la fad re'\p la'4

    %4
    r16 mi fad sol la8 mi fad re la'4
    r16 mi fad sol la8 mi fad re la'16 (fad mi fad)
    si(sol fad sol) si(sol fad sol) la(fad mi fad) la(fad mi fad)\mbreak

    %7
    si(sol fad sol) si(sol fad sol) la8[la16 sold la8\f la]
    sold si, mi, mi mi[sol'!16 fad sol8 sol]
    fad la, re, re re[fa'16 mi fa8 fa]

    %10
    mi16[la, sol fad? mi re dod si] \once\stemUp la8 fad'' sol mi
    fad,4 fad fad16[sol la si dod re mi fad]
    fad,4 fad fad16[sol la si dod re mi fad]

    %13
    si,4 si si16[dod re mi fad sold? la si]\mbreak
    dod,4 dod dod16[re mi fad sold la si dod]
    mi,\p dod si dod mi dod si dod fad re dod re fad re dod re

    %16
    mi dod si dod mi dod si dod fad re dod re fad re dod re
    mi8\f[mi16 red mi8 mi] red fad, si, si
    si[re'!16 dod re8 re] dod8 mi, la, la

    %19
    la[do'16 si do8 do]\mbreak si mi mi mi
    mid mid mid mid fad fad fad fad
    sold sold sold sold lad lad lad lad

    %22
    si si si si si si si si
    lad lad lad lad si si,\p fad'4
    r16 dod re mi fad8 dod re si fad'4

    %25
    r16 dod re mi fad8 dod re si fad'16 re dod re\mbreak
    sol mi re mi sol mi re mi fad re dod re fad re dod re
    sol mi re mi sol mi re mi re\f[si la sol fad mi re dod]

    %28
    \once\stemUp si8 re' mi dod si4 si
    si16[dod re mi fad sol la si] si,4 si
    si16[dod red mi fad sol la si] sol,4 sol

    %31
    sol16[la si dod red mi fad sol] sol,4 sol
    sol16[la si dod red mi fad sol]\mbreak red8[si'16 lad si8 si]
    lad dod, fad, fad fad[la'!16 sold la8 la]

    %34
    sold si, mi, mi  mi [sol'16 fad sol8 sol]
    fad sol fad fad mi16 sol si sol mi sol si sol
    dod, mi la mi dod mi la dod, re fad la fad re fad la re,

    %37
    dod mi la mi dod mi la dod, re[fad mi re dod si la sol]\mbreak
    fad4 fad fad16[sol la si dod re mi fad]
    fad,4 fad fad16[sol la si dod re mi fad]
    fad,8 fad' re la fad re'\p la'4

    %41
    r16 mi fad sol la8 mi fad re la'4
    r16 mi fad sol la8 mi fad re la'16 (fad mi fad)
    si(sol fad sol) si(sol fad sol) la(fad mi fad) la(fad mi fad)\mbreak

    %44
    si(sol fad sol) si(sol fad sol) la8[la16 sold la8\f la]
    sold si, mi, mi mi[sol'!16 fad sol8 sol]
    fad la, re, re re[fa'16 mi fa8 fa]

    %47
    mi16[la, sol fad? mi re dod si] \once\stemUp la8 fad'' sol mi
    fad,4

}

VvlIIn = \relative do'' {

    re,4 re re16[mi fad sol la si dod re]
    re,4 re re16[mi fad sol la si dod re]
    re,8 re' la fad re4 r8 re'\p

    %4
    la'4 r r r8 re,
    la'4 r r fad16(re dod re)
    sol (mi re mi) sol (mi re mi) fad (re dod re) fad (re dod re)\mbreak

    %7
    sol (mi re mi) sol (mi re mi) fad8[fad16 mi fad8\f re]
    mi si mi, mi mi[mi'16 re mi8 dod]
    re la re, re re[re'16 dod re8 si]

    %10
    dod16[la sol fad mi re dod si] \once\stemUp la8 re' mi dod
    re,4 re re16[mi fad sol la si dod re]
    re,4 re re16[mi fad sol la si dod re]

    %13
    sold,4 sold sold16[la si dod re mi fad sold]\mbreak
    la,4 la la16[si dod re mi fad sold la]
    dod,\p la sold la dod la sold la re si la si re si la si

    %16
    dod la sold la dod la sold la re si la si re si la si
    dod8\f [dod16 si dod8 lad] si fad si, si
    si[si'16 la? si8 sold] la mi la, la

    %19
    la[la'16 sold la8 fad]\mbreak sold8 si si si
    dod dod dod dod dod dod dod dod
    dod dod dod dod dod dod dod dod

    %22
    re re re re dod dod dod dod
    dod dod dod dod re4 r8 si\p
    fad'4 r r r8 si,

    %25
    fad'4 r r re16 si dod si\mbreak
    mi dod si dod mi dod si dod re si dod si re si dod si
    mi dod si dod mi dod si dod si\f [si la sol fad mi re dod]

    %28
    si8 si' dod lad re,4 re
    re16[mi fad sol la si dod re] re,4 re
    red16[mi fad sol la si dod red] mi,4 mi

    %31
    mi16[fad sol la si dod red mi] mi,4 mi
    mi16[fad sol la si dod red mi]\mbreak si8[si'16 lad si8 si]
    lad dod, fad, fad fad[la'!16 sold la8 la]

    %34
    sold si, mi, mi  mi [sol'16 fad sol8 sol]
    fad mi mi red mi16 sol si sol mi sol si sol
    dod, mi la mi dod mi la dod, re fad la fad re fad la re,

    %37
    dod mi la mi dod mi la dod, re[re dod si la sol fad mi]\mbreak
    re4  re re16[mi fad sol la si dod re]
    re,4 re re16[mi fad sol la si dod re]

    %40
    re,8 re' la fad re4 r8 re'\p
    la'4 r r r8 re,
    la'4 r r fad16(re dod re)

    %43
    sol (mi re mi) sol (mi re mi) fad (re dod re) fad (re dod re)\mbreak
    sol (mi re mi) sol (mi re mi) fad8[fad16 mi fad8\f re]
    mi si mi, mi mi[mi'16 re mi8 dod]

    %46
    re la re, re re[re'16 dod re8 si]
    dod16[la sol fad mi re dod si] \once\stemUp la8 re' mi dod
    re,4

}

Vvlan = \relative do' {

    r2 fad,4 fad
    fad16[sol la si dod re mi fad] fad,4 fad
    fad16[sol la si dod re mi fad] re8 re'\p re re

    %4
    dod dod dod dod re re re re
    dod dod dod dod re re, re re
    re re re re re re re re\mbreak

    %7
    re re re re re4 r
    r8 si' mi, mi mi4 r
    r8 la re, re re4 r

    %10
    r16 la' [sol fad mi re dod si] la8 la' re la
    fad4 r fad, fad
    fad16[sol la si dod re mi fad] fad,4 fad

    %13
    sold16[la si dod re mi fad sold] sold,4 sold\mbreak
    dod16[re mi fad sold la si dod] mi,4 mi
    la,8\p la la la la la la la

    %16
    la la la la la la la la
    la4 r r8 fad' si, si
    si4 r r8 mi la,  la

    %19
    la4 r\mbreak sol'8 sol sol sol
    sol sol sol sol la la la la
    sold sold sold sold fad fad fad fad

    %22
    fad fad fad fad sold sold sold sold
    dod, dod fad fad fad si si si
    lad lad lad lad si si si si

    %25
    lad lad lad lad si si si si\mbreak
    si, si si si si si si si
    si si si si si16\f[si' la sol fad mi re dod]

    %28
    si8 fad' sol fad fad4 r
    fad fad fad fad
    fad red si si

    %31
    si si si si
    si si\mbreak si r
    r8 dod' fad,-! fad-! fad4 r

    %34
    r8 si mi, mi mi4 r
    si'8 mi, si' si,  sol' sol sol sol
    mi mi mi mi fad fad fad fad

    %37
    mi mi mi dod la4 la
    la r fad fad
    fad16[sol la si dod re mi fad] fad,4 fad

    %40
    fad16[sol la si dod re mi fad] re8 re'\p re re
    dod dod dod dod re re re re
    dod dod dod dod re re, re re

    %43
    re re re re re re re re\mbreak
    re re re re re4 r
    r8 si' mi, mi mi4 r

    %46
    r8 la re, re re4 r
    r16 la' [sol fad mi re dod si] la8 la' re la
    fad4

}


Vbcn = \relative do {

    r2 re4 re
    re16[mi fad sol la si dod re] re,4 re
    re16[mi fad sol la si dod re] re,4 r

    %4
    R1*3
    r2 re4 r
    r8 si' mi, mi mi4 r

    %9
    r8 la re, re re4 r
    r16 la' [sol fad mi re dod si] la8 re sol, la
    re4 r re re %%%%%% fine ripresa

    %12
    re16[mi fad sol la si dod re] re,4 re
    mi16[fad sold la si dod re mi] mi,4 mi\mbreak
    la,16[si dod re mi fad sold la] la,4 la

    %15
    la r r2
    R1
    la4 r r8 fad' si, si

    %18
    si4 r r8 mi la,  la
    la4 r\mbreak mi'8 mi mi mi
    dod dod  si si la la fad' fad

    %21
    fad fad mid mid mi mi mi mi
    re re re re mid, mid mid mid
    fad fad fad fad si4 r

    %24
    R1*3
    r2 r16 si'[la sol fad mi re dod]
    si8 si' mi, fad si,4 r

    %29
    si si si16[dod re mi fad sol la si]
    si,4 si mi16[fad sol la si dod red mi]
    mi,4 mi mi16[fad sol la si dod red mi]

    %32
    mi,4 mi\mbreak si4 r
    r8 dod' fad,-! fad-! fad4 r
    r8 si mi, mi mi4 r

    %35
    si'8 mi, si' si, mi mi mi mi
    la, la la la la la la la
    la la la la re4 re\mbreak

    %38
    re4 r re re
    re16[mi fad sol la si dod re] re,4 re
    re16[mi fad sol la si dod re] re,4 r

    %41
    R1*3
    r2 re4 r
    r8 si' mi, mi mi4 r

    %46
    r8 la re, re re4 r
    r16 la' [sol fad mi re dod si] la8 re sol, la
    re4

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*7
    s8 <6+> <3+>4 <3-> s
    s8 <6+> <3+>4 <3-> s  %% fine ripresa
    s1*7
    s2 s8 <6> <3+>4
    <3->1
    <3->
    <_+>4 <6 4+> s2
    <5 2+>4 <3+> <6 4+>2
    s <6 5>
    <_+> s
    s1*6
    <_+>1
    s
    s
    s8 <6+> <4+>4 <3->2
    s8 <6+> <4+>4 <3->2
    s4 <5 4>8 <3+> s2
    s1*9
    s8 <6+> <3+>4 <3-> s
    s8 <6+> <3+>4 <3-> s

}

forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 65
    s1*47
    s4\fermata
    \bar"|."

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

    r2 re4 mi8. fad16
    sol4~sol8. sol16 fad8.[fad16 sol8. la16]
    sib2~sib8.[sib16 la8. sol16]

    %4
    fad8.[mi16 re8. do16] sib4 sib'~
    sib8.[sib16 la8. sol16] la2~
    la8.[la16 sol8. fa?16] sol2~

    %7
    sol8. [sol16 fa8. mib16] re8.[fa16 mib8. re16]\mbreak
    do4.\tr sib8 sib4 r
    R1*2

    %11
    fa'4 sol8. la16 sib8.\p[sib16 la8. sol16]
    fad2 sol8.[la16 sol8. fa?16]
    mib8.[ sol16 fa8. mib16] re2

    %14
    do4\f~do8. lab'16 lab8.[lab16 sol8. fa16]\mbreak
    mib4 do'~do8.[do16 sib8. lab16]
    sib2~sib8.[sib16 lab?8. sol16]

    %17
    lab2~lab8.[lab16 sol8. fa16]
    sol2\parenthesize ~ sol4 fa
    sol fa8. mib16 mib4 re

    %20
    mib sol8. lab16 sib4 sib8. lab16\mbreak
    sol4~sol8. sol16 fa4~fa8. fa16
    sol8.[sib16 lab8. sol16] fad8.[fad16 sol8. la?16]

    %23
    sib4~sib8. la16 sol8.[fa16 mi8. re16]
    dod8.[dod16 re8. mi16] fa4~fa8. fa16
    mi4~mi8. mi16 re4 fa8. sol16

    %26
    la4~la8. sol16 fa8.[fa16 la8. sib16]\mbreak
    mi,8.[mi16 fa8. sol16] la2
    sib la

    %29
    sib la
    r re,4 mi8. fad16
    sol4 sol8. sol16 fad8.[fad16 sol8. la16]

    %32
    sib8.[sib16 la8. sol16] fad8.[fad16 sol8. la16]\mbreak
    sib8.[sib16 la8. sol16] fad8.[fad16 sol8. la16]
    sib8.[la16 sol8. fad16] sol2~

    %35
    sol fad
    sol1

}

VIvlIIn = \relative do'' {

    sol4 sib8. do16 re4~re8. do16
    sib8.[sib16 re8. mib16] la,2
    re8.[do16 re8. sib16] mib4 mi

    %4
    la,4. la8 re4 sol~
    sol8.[sol16 fa8. mib16] fa2~
    fa8.[fa16 mib8. re16] mib2~

    %7
    mib8.[mib16 re8. do16] sib8.[re16 do8. sib16]\mbreak
    sib4 la sib r
    R1

    %10
    r2 sib4 re8. mi?16
    fa4~fa8. mib16 re2\p~
    re8.[mib16 re8. do16] si2

    %13
    do8.[mib16 re8. do16] do4 si
    mib sol8. lab16 re,8.[re16 mib8. fa16]\mbreak
    sol8.[fa16 sol8. mib16] lab2

    %16
    sol~sol
    fa~fa
    mib~mib4 re

    %19
    mib8.[sib16 lab8. sol16] fa2
    mib?4 r sib'4 do8. re16
    mib4~mib8. mib16 re8.[re16 mib8. fa16]

    %22
    sib,8.[sol'16 fa!8. mib16] la8.[la16 sib8. do16]
    re4~re8. do16 sib8. [la16 sol8. fa16]
    mi?8.[mi16 fa8. sol16] la8.[sol16 la8. fa16]

    %25
    sol4~sol8. sol16 fa4 r
    la, si8. dod16 re2\mbreak
    dod8.[dod16 re8. mi16] re4 fad

    %28
    sol2 fad
    sol fad
    sol,4 sib8. do?16 re4~re8. do16

    %31
    sib8.[sib16 re8. mib16] la,4~la8. fad'16
    sol8.[re16 do8. sib16] la4~la8. fad'16\mbreak
    sol8.[re16 do8. sib16] la4~la8. re16

    %34
    re2 mi
    re~re
    re1

}

VIvlan = \relative do' {

    R1
    r2 re4 mi8. fad16
    sol2~sol8.[sol16 fad8. mi16]

    %4
    re8.[do16 sib8. la16] sib8.[la16 sib8. re16]
    mib4. mib8 do4. do8
    re4. re8 sib4. sib8

    %7
    do4. fa8 fa4. fa8\mbreak
    fa2 re4 r
    fa sol8. la16 sib8.[sib16 do8. sib16]

    %10
    la8.[fa16 sol8. la16] sib2
    do4 la r2
    R1

    %13
    r2 sol4\f la8. si16
    do4. do8  si8. [si16 do8. re16]\mbreak
    mib?2 fa,8.[fa16 sol8. lab16]

    %16
    re,8.[do16 re8. sib16] mib8.[mib16 fa8. sol16]
    do,8.[sib16 do8. lab16] re8.[re16 mib8. fa16]
    sib,8.[la16 sib8. do16] re4 sib'~

    %19
    sib8.[sib,16 do8. mib16] sib2
    sol4 r r2\mbreak
    mib'4 sol8. lab16 sib4~sib8. lab16

    %22
    sol4. sol8 do8. [do16 sib8. la16]
    sol8.[fad16 sol8. la?16] re,4. re8
    sol8.[sol16 fa8. mi?16] re4 r

    %25
    la8.[la16 si8. dod16] re4~re8. re16
    dod4 re8. mi16 la,2~\mbreak
    la re~

    %28
    re~re~
    re~re
    re4 r r2

    %31
    sol4 sib8. do16 re,8.[re16 mi8. fad16]
    re2~re8.[re16 mi8. fad16]\mbreak
    re2~re4 do

    %34
    sib sib' la2~
    la~la
    sib1

}


VIbcn = \relative do {

    R1
    sol4 sib8. do16 re4~re8. do16
    sib8.[do16 sib8. sol16] do4 dod

    %4
    re8.[re16 mi8. fad16] sol8.[fad16 sol8. sib,16]
    do4. do8 fa8.[mib16 fa8. la,16]
    sib4. sib8 mib8.[do16 mib8. sol,16]

    %7
    la4.la8 sib4. sib8\mbreak
    fa'8.[mib16 fa8. fa,16] sib4 re8. mib16
    fa4~fa8. mib16  re8.[re16 mi8. mi16]

    %10
    fa8. [fa16 mib8. mib16] re8.[re16 do8. sib16]
    la4 fa r2
    R1*2

    %14
    do'4 mib8. fa16 sol4. sol8\mbreak
    do,8.[re16 mib8. do16] re8.[re16 mib8. fa16]
    sol8.[lab16 sib8. sol16] do,8.[do16 re8. mib16]

    %17
    fa8.[sol16 lab8. fa16] sib,8.[sib16 do8. re16]
    mib8.[fa16 sol8. lab16] sib8.[do16 re8. sib16]
    mib4 lab, sib sib,

    %20
    mib, r r2\mbreak
    r sib'4 do8. re16
    mib2~mib8.[mib16 re8. do16]

    %23
    sib8. [la16 sib8. sol16] sib'2~
    sib8. [sib16 la8. sol16] fa8.[mi16 fa8. re16]
    la2~la~

    %26
    la re4 fa8. sol16\mbreak
    la4 la8. sol16 fad8. [fad16 mi8. re16]
    sol8.[sol16 la8. sib16] fad8.[fad16 mi8. re16]

    %29
    sol8.[sol16 la8. sib16] fad8.[fad16 mi8. re16]
    sol4 r re2\tasto~
    re~re~

    %32
    re~re~
    re re8.[re16 mi8. fad16]
    sol8. [fa?16 mib8. re16 ] dod8. [dod16 mi?8. dod16]

    %35
    re2 re,
    sol1\fermata

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <_+>
    s2 <7 _->4 <6 5>
    <_+>1
    <7>2 <7->
    <7> <7>
    <7 5->1
    <5 4>4 <3> s2
    s1*5
    <_->2 <9 5 3!>4 <8>
    s2 <7 5->
    s <7>
    s <7>
    s1*4
    s2 <6 4 2+>
    s <6>
    <6 4 2+>1
    <7 _+>2 <6 4>
    <3+>1
    <_+>
    s1*5
    s2 <_+>
    s <6 5>
    <5 4> <3+>

}

forma = {

    \time 4/4
    \key re\minor
    \tempo 4 = 55
    s1*35
    s1\fermata
    \bar"|."

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
}

VIIvlIn = \relative do'' {

    la8
    re[dod re fad,]
    \appoggiatura fad8 sol4. re'8
    dod[re mi re16 dod]
    re8[la re, re']

    %5
    dod[re mi re16 dod]
    re8[la re, mi']
    fad sol16 la mi8 la

    %8
    fad4\tr mi8 la,
    fad' sol16 la mi8 la
    fad4\tr mi8 la,\mbreak

    %11
    fad'[mi16(fad) sol(fad) mi(re)]
    dod8[si16 dod la8 mi]
    dod'[re16 mi si8 mi]

    %14
    dod4\tr si8 mi,
    dod'[re16 mi si8 mi]
    dod4\tr si8 mi

    %17
    re16(dod) si(la) dod(si) la(sold)
    la8[mi la, mi'']
    re16(dod) si(la) dod(si) la(sold)\mbreak

    %20
    la8[mi la, \once\stemDown fad'']
    re mi16 fad dod8 fad
    re mi16 fad dod8 fad

    %23
    sol la16 si fad8 si
    sol16 la si8 fad8 si
    sol4\tr fad8 si

    %26
    sol4\tr fad8 fad
    re mi16 fad dod8 fad
    re mi16 fad dod8 si'\mbreak

    %29
    la16(sol) fad(mi) fad(mi) re(dod)
    si8[fad si, \once\stemDown si'']
    la16(sol) fad(mi) fad(mi) re(dod)

    %32
    si8[fad si, fad'']
    si[la si re,]
    \appoggiatura re8 mi4. si'8

    %35
    lad[si dod si16 lad]
    si8[fad si, fad']\mbreak
    sold[la si la16 sold]

    %38
    la8[fad fad, dod']
    fad[mi fad la,]
    \appoggiatura la si4. fad8

    %41
    mid[fad sold fad16 mid]
    fad8[dod' fad la]
    fad[sol la sol16 fad]

    %44
    sol8[mi mi, si']
    mi[re mi sol,]\mbreak
    \appoggiatura sol la4. mi'8

    %47
    red8[mi fad mi16 red]
    mi8[si mi, mi']
    fad[sol16 la la,8 la']

    %50
    fad4 mi8 la,
    re[dod re fad,]
    \appoggiatura fad sol4. re'8\mbreak

    %53
    dod[re mi re16 dod]
    re8[la re, la'']
    fad sol16 la mi8 la

    %56
    fad4\tr  mi8 la,
    fad' sol16 la mi8 la
    fad4\tr mi8 la,

    %59
    fad'16(mi) re(dod) re(dod) si(la)
    si8 dod16 re la8 re
    si4\tr la8 re,\mbreak

    %62
    si'8 dod16 re la8 re
    si4\tr la8 re,
    si'16(la) sol(fad) sol(la) si(dod)

    %65
    re8[la re, la'']
    sol16(fad) mi(re) fad (mi) re (dod)
    re8 [la re, la'']

    %68
    sol16(fad) mi(re) fad (mi) re (dod)
    re8 [la re, la']
    sol16(fad) mi(re) fad (mi) re (dod)

    %71
    re2\fermata

}

VIIvlan = \relative do' {

    r8 r4 r8 re
    sol[fad sol si,]
    la[fad' sol la]

    %4
    re,[mi fad re]
    la[fad' sol la]
    re,[mi fad dod]

    %7
    re[re' dod la]
    re[re, dod la]
    re[re' dod la]

    %10
    re[re, dod la]\mbreak
    re[dod si sol]
    la[la dod la]

    %13
    la[la' sold mi]
    la,[la' sold mi]
    la,[la' sold mi]

    %16
    la,[la' sold mi]
    la[fad re mi]
    la,[si dod sold]

    %19
    la[fad' re mi]\mbreak
    la,[si dod lad]
    si[si' lad fad]

    %22
    si,[si' lad? red,]
    mi[mi' red si]
    mi[mi, red si]

    %25
    \once\stemUp mi,[mi'' red si]
    mi[mi, red lad]
    si[si' lad fad]

    %28
    si,[si' lad re,]\mbreak
    si[sol' mi fad]
    si,[dod re dod]

    %31
    si[sol' mi fad]
    si,[dod re dod]
    si4 r8 si

    %34
    mi[re mi sol,]
    fad[re' mi fad]
    si,[dod re si]\mbreak

    %37
    mid[fad sold dod,]
    fad[sold la fad]
    r4 r8 fad

    %40
    si[la si re,]
    dod[la si dod]
    fad [sold la fad]

    %43
    red[mi fad si,]
    mi[fad sol? mi]
    r4 r8 mi\mbreak

    %46
    la[sol la do,]
    si[sol' la si]
    mi,[fad sol dod,!]

    %49
    re [mi fad dod]
    re[re' dod la]
    r4 r8 re,

    %52
    sol[fad sol si,]\mbreak
    la[si dod la]
    re[mi fad dod]

    %55
    re [re' dod la]
    re[re, dod la]
    re [re' dod la]

    %58
    re[re, dod la]
    re[ la' fad re]
    sol,[sol' fad re]

    %61
    sol,[sol' fad re]\mbreak
    sol,[sol' fad re]
    sol,[sol' fad re]

    %64
    sol[re sol mi]
    fad[mi re dod]
    re[si sol la]

    %67
    re[mi fad dod]
    re[si sol la]
    re[mi fad dod]

    %70
    re[si sol la]
    re2\fermata


}


VIIbcn = \relative do {

    r8 r4 r8 re
    sol[fad sol si,]
    la[fad' sol la]

    %4
    re,[mi fad re]
    la[fad' sol la]
    re,[mi fad dod]

    %7
    re[re' dod la]
    re[re, dod la]
    re[re' dod la]

    %10
    re[re, dod la]\mbreak
    re[dod si sol]
    la[la dod la]

    %13
    la[la' sold mi]
    la,[la' sold mi]
    la,[la' sold mi]

    %16
    la,[la' sold mi]
    la[fad re mi]
    la,[si dod sold]

    %19
    la[fad' re mi]\mbreak
    la,[si dod lad]
    si[si' lad fad]

    %22
    si,[si' lad? red,]
    mi[mi' red si]
    mi[mi, red si]

    %25
    \once\stemUp mi,[mi'' red si]
    mi[mi, red lad]
    si[si' lad fad]

    %28
    si,[si' lad re,]\mbreak
    si[sol' mi fad]
    si,[dod re dod]

    %31
    si[sol' mi fad]
    si,[dod re dod]
    si4 r8 si

    %34
    mi[re mi sol,]
    fad[re' mi fad]
    si,[dod re si]\mbreak

    %37
    mid[fad sold dod,]
    fad[sold la fad]
    r4 r8 fad

    %40
    si[la si re,]
    dod[la si dod]
    fad [sold la fad]

    %43
    red[mi fad si,]
    mi[fad sol? mi]
    r4 r8 mi\mbreak

    %46
    la[sol la do,]
    si[sol' la si]
    mi,[fad sol dod,!]

    %49
    re [mi fad dod]
    re[re' dod la]
    r4 r8 re,

    %52
    sol[fad sol si,]\mbreak
    la[si dod la]
    re[mi fad dod]

    %55
    re [re' dod la]
    re[re, dod la]
    re [re' dod la]

    %58
    re[re, dod la]
    re[ la' fad re]
    sol,[sol' fad re]

    %61
    sol,[sol' fad re]\mbreak
    sol,[sol' fad re]
    sol,[sol' fad re]

    %64
    sol[re sol mi]
    fad[mi re dod]
    re[si sol la]

    %67
    re[mi fad dod]
    re[si sol la]
    re[mi fad dod]

    %70
    re[si sol la]
    re2\fermata

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2*34
    <_+>2
    s2*5
    <_+>2
    s2*5
    <_+>2

}

forma = {

    \time 2/4
    \key re\major
    \tempo 2 = 77
    \partial 8 s8
    s2*71
    \bar"|."

}



VIIvlI = {
    \global
    <<\VIIvlIn \forma>>

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

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{Sinfonia a 4 [RV 192]}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[I.1 Allegro] }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {[Violino I]}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {[Violino II]}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{[Basso]}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

    \markup \huge {[I.2 Grave] }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {[Violino I]}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {[Violino II]}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{[Basso]}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

    \markup \huge {[I.3 Allegro] }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {[Violino I]}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {[Violino II]}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{[Basso]}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/12)
                \override BarLine.hair-thickness = #1.2
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

    \markup \huge {[I.4 Allegro] }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {Violini}
                \set Staff.shortInstrumentName = "vl"
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{[Basso]}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{Concerto a 4 [RV 126]}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[II.1] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {[Violino I]}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {[Violino II]}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{[Basso]}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

    \markup \huge {[II.2] And[an]te }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {[Violino I]}
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {[Violino II]}
                \set Staff.shortInstrumentName = "vl2"
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \VIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{[Basso]}
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

        systems-per-page = #5

    }

    \markup \huge {[II.3] All[egr]o molto }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"2 Viol[ini]""unis[oni]"}
                \set Staff.shortInstrumentName = "vl"
                \VIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup\center-column{"Viol[et]te""con il B.[asso]"}
                \set Staff.shortInstrumentName = "vla"
                \VIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \VIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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
