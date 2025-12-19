\language "italiano"
	%********************************** VARIABILI
\version "2.24.0"

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

dolce = _\markup\italic"Dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic \center-align"con l'arco"

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IvlIn = \relative do'' {

    sol'16-!
    sol8-! \once \stemUp re,-! r8 r16 si''-! \once \stemDown do8-! \once \stemUp la,-! r8 r16 la'-!
    la8-! \once \stemUp fad, -!r8 r16 la' la8 \once \stemUp sol, r r16  sol'\p
    sol8 \once \stemUp re, r r16 sol'\f  sol8 \once \stemUp mi, r r16  sol'\p

    %4
    fa8 fa, r r16 fa' mi8 mi, r r16 mi'\f
    mi8 re r r16 do si8-! si,-! si-! si-!
    sol''2\tr\p fad\mbreak

    %7
    sol,,8 si re sol re fad la re
    sol, si re sol fad16(mi) re4 r8
    sol,,8\p si re sol re fad la re

    %10
    sol, si re sol fad16\parentSlur (mi) re4 r8
    sol,\f si re si' la, dod mi la
    fad4 mi re dod

    %13
    si la sol4. fad16 mi
    fad8 la re sol\mbreak fad 32(mi) re8. \grace fad8 mi4\tr
    re8 fad la re la, dod mi la

    %16
    re, fad la re dod16(si) la8 r4
    re,,8\p fad la re la, dod mi la
    re, fad la re dod16(si) la8 r la'\f

    %19
    si16 si, si' si si si si si la la, la' la la la la la
    sol sol, sol' sol sol sol sol sol fad fad, fad' fad fad fad fad fad\mbreak
    mi mi, mi' mi mi mi mi mi mi4\fermata r8 r16 sol-!

    %22
    sol8-! \once\stemUp mi,-! r r16 fad'-! fad8-!\once\stemUp red,-! r r16 si''
    si8\once\stemUp sold, r r16 sold' la8-! la-! la-! la-!
    lad2 si\fermata

    %25
    mi,,8 sol si mi si, red fad si
    mi ,sol si mi red16 dod si8 r4
    mi,8\p sol si mi si, red fad si\mbreak

    %28
    mi, sol si mi red16 dod si8 r fad'
    si16\f la sold fad mi re dod si la,8 dod mi la
    la'16 sol! fad mi re do! si la sol,8 si re sol

    %31
    sol'16 fad mi re do si la sol re8 fad la re
    sol, si re si' la16 la, la' la la la la la
    sol sol, sol' sol sol sol sol sol fad fad, fad' fad fad fad fad fad\mbreak

    %34
    mi sol fad mi \grace fad8 mi4\tr mi16 sol fad mi \grace fad8 mi4\tr
    do'8 si16 la sol8 fad sol4 fad\tr
    mi16\p sol fad mi \grace fad8 mi4\tr mi16\f sol fad mi \grace fad8 mi4\tr

    %37
    fad8 sold16 lad si8 mi, re4 dod\tr
    si8 sol' fad16 mi re dod \grace dod8 si4\tr r
    sol,8 si re sol re fad la re

    %40
    sol, si re sol fad16(mi) re4 r8
    sol,,8\p si re sol re fad la re
    sol, si re sol fad16 (mi) re4 r8

    %43
    sol,8\f si re si' la, dod mi la
    fad4 mi re dod
    si la sol4.\tr fad16 mi

    %46
    fad\f re fad la re re re re fad, re fad la re re re re
    si sol si re sol sol sol sol si, sol si re sol sol sol sol
    mi do mi sol do do do do\mbreak mi, do mi sol do do do do

    %49
    fad,! re fad la re re re re fad, re fad la re re re re
    si8 la16 si \grace re8 do4\tr si8\p la16 si \grace re8 do4\tr
    si8\f la16 si \grace re8 do4\tr si8 la16 sol \grace si8 la4\tr

    %52
    sol16 fad mi re do si la sol sol'8 sol, r sol'
    la16 sol fad mi re do si la la'8 la, r la'\mbreak
    si16 la sol fad mi re do si si'8 si, r si'

    %55
    do16 re do si la sol fad mi re re' re re re re re re
    re, do'! do do do do do do si si si si si si si si
    sib sib sib sib sib sib sib sib sib4\fermata r

    %58
    la8-! \once \stemUp fad,!-! r8 r16 la'-! sol8-! \once \stemUp re, r4
    sol'8-! sol,-! r8 r16 sol'-!\mbreak la8-! \once \stemUp fad,-! \parenthesize r4
    re''8-!\once \stemUp re,,-! r r16 si'' do8 do, r4

    %61
    sol'2\tr fad

}

IvlIIn = \relative do'' {

    si16
    si8-! si,-! r r16 sol''-! la8-! \once\stemUp re,,-! r r16 fad'-!
    \once\stemDown fad8-! re,-! r r16 fad' \once\stemDown fad8 si,, r r16 re'\p
    re8\once\stemUp sib, r r16 re'\f dod8 dod, r r16 dod'\p

    %4
    re8 re, r r16 re' re8 re, r r16 dod'\f
    la'8 la, r r16 la sol8 -!sol, -!re''4~
    re\p dod\tr re2

    %7
    si8-! sol-! re-![si-!] fad'' re la fad
    si sol re si' la re, fad' r
    si,\p sol re si fad'' re la fad

    %10
    si sol re si' la re, fad' r
    sol\f re si sol' dod, la mi[mi']~
    mi re4 dod  si la8~

    %13
    la sol4 fad mi re16 dod
    re8 fad la mi' re re4 dod8
    fad re la fad dod'' la mi dod

    %16
    fad re la fad' mi la, la' r
    fad\p re la fad dod' la mi dod
    fad re la fad' mi la, la''16 la la\f la

    %19
    la la la la sol sol sol sol sol sol sol sol fad fad fad fad
    fad fad fad fad mi mi mi mi\mbreak mi mi mi mi re re re re
    re re re re dod dod dod dod sol'4\fermata r 8r16 mi-!

    %22
    \once\stemDown mi8-! dod,-! r r16 red'-! \once\stemDown  red8-! si,-! r r16 sold''
    \once\stemDown sold?8 mi, r r16 mi' mi8-! mi-! mi-! mi-!
    mi2\tr red\fermata

    %25
    sol!8 mi si sol red' si fad red
    sol' mi si sol fad si, red' r
    sol8\p mi si sol red' si fad red

    %28
    sol' mi si sol fad si, red' r
    mi,\f sold si mi mi16 re dod si la sol? fad mi
    re8 fad  la re re'16 do! si la sol fad mi re

    %31
    do,8 mi sol do la'16 sol fad mi re do si la
    si8 sol sol'16 sol sol sol sol sol sol sol fad fad fad fad
    fad fad fad fad mi mi mi mi mi mi mi mi red red red red\mbreak

    %34
    mi4 mi16 sol fad mi \grace fad8 mi4\tr mi16 sol fad mi
    la8 sol16(fad) mi8 mi mi4 red\tr
    mi\p mi16 sol fad mi \grace fad8 mi4\tr  mi16 sol fad mi

    %37
    \grace fad8 mi4\tr\f re8 dod si4 lad\tr
    si8 si4 lad8 si4 r
    si8 sol re si fad'' re la fad

    %40
    si sol re si' la re, fad' r\mbreak
    si,\p sol re si fad'' re la fad
    si sol re si' la re, fad' r

    %43
    sol\f re si sol' dod, la mi mi'~
    mi re4 dod si la8~
    la sol4 fad mi re16 dod

    %46
    re4\f r8 la' re, la' r la
    sol re' r si sol re' r si
    do sol' r mi\mbreak do sol' r mi

    %49
    re la' r fad re la' r fad
    sol\tr fad16 sol \grace si8 la sol16(fad) sol8\tr\p fad16(sol) \grace si8 la sol16(fad)
    sol8\tr\f fad16 sol \grace si8 la sol16(fad) sol8 sol4 fad8\tr

    %52
    sol sol, r sol sol16 fad mi re do si la sol
    la'8 la, r la' la16 sol fad mi re do si la
    si'8 si, r si'\mbreak si16 la sol fad mi re do si

    %55
    la4 r8 la'' fad re la fad
    r re' fad la sol16 sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol sol4\fermata r

    %58
    \once\stemDown fad8-!  re,-! r r16 re'-! \once\stemDown re8-!  si,-! r4
    \once\stemDown re'8-! sib,-! r r16 re'-! re8-! re,-! r4
    si''!8-!\once\stemUp si,,-! r r16 re' mi8 mi, r4\mbreak

    %61
    dod'2\tr re


}

Ivlan = \relative do' {

    re16-!
    re8-! sol,-! r r16 re'-! do8-! do-! r r16  re-!
    re8-! re-! r r16 re re8 re r r16 sib\p
    sib?8 sol r r16 re'\f mi8 la, r r16 la\p

    %4
    la8 la r r16 la la8 la r r16 la\f
    la8 fad'! r r16 fad re8-! re-! re-! re-!
    mi4\p mib la,2

    %7
    sol'8 re si re r la fad la
    r sol si re re la' fad la
    sol\p re si re r la fad la

    %10
    r sol si re re la' fad fad
    re\f re re re r dod la dod
    la4 r8 la' fad4. fad8

    %13
    re4 re si la\mbreak
    la r8 dod la la si la
    la fad' re fad r dod la dod

    %16
    r fad re fad la mi dod mi
    re\p fad re fad r dod la dod
    r fad re fad la mi fad fad\f

    %19
    re4. sol8 do,4. fad8
    si,4 r8 dod la4 la
    r2 dod!4\fermopz r8 r16 dod-!\mbreak

    %22
    dod?8-! lad-! r r16 si-! si8-! fad-! r r16 mi'
    mi8 si r r16 si dod8-! dod-! dod-! dod-!
    do!2 fad,!\fermata

    %25
    mi'8 sol mi sol r fad red fad
    r si sol si red, fad la red,
    si\p sol' mi sol r fad red fad

    %28
    r si, sol si si fad' la red,\mbreak
    mi\f mi mi sold r mi la, dod
    r re re fad r re si si

    %31
    r sol' do, mi r la fad fad
    r re re re mi mi red red
    si si si si do do' fad, si

    %34
    sol4 r sol8 r si r
    fad r sol do si4 si,
    sol\p r\mbreak sol'8 r sol r

    %37
    dod,\f dod si sol' fad4 fad
    fad8 mi re fad fad4 r
    sol8 re si re r la fad la

    %40
    r sol si re re la' fad la
    sol\p re si re r la fad la
    r sol si re re la' fad fad

    %43
    re\f re re re r mi la, dod
    la4. la'8\mbreak fad4. fad8
    re4 re si la

    %46
    fad16\f fad fad fad la la la la fad' fad fad fad la la la la
    sol sol sol sol re re re re sol, sol sol sol re' re re re
    do do do do sol' sol sol sol do, do do do sol' sol sol sol

    %49
    re' re re re la la la la\mbreak re, re re re la' la la la
    sol8 re fad re re\p re fad re
    re\f re fad re re re mi re

    %52
    re4 r8 re si sol sol'4
    r8 la fad re r la' fad re
    r re si sol r re' si sol

    %55
    r la' fad re r la' fad re
    la'16 la la la la la la la\mbreak mi mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi mi4\fermata r

    %58
    re8-! re-! r r16 la si8-! si-! r4
    sib8-! re-! r r16 re-! la8-! la-! r4
    sol'8-! sol,-! r r16 sol' sol8 sol r4

    %61
    sol2 la

}

Ibcn = \relative do {

    sol'16-!
    sol8-! sol,-! r r16 sol'-! sol8-! fad-! r r16 re-!
    re8-! do-! r r16 do do8 si r r16 sib\p
    sib8 sib r r16 sib\f la8 la r r16 la\p

    %4
    la8 la r r16 la la8 la r r16 la'\f
    fa8 fad r r16 fad sol8-! sol-! sol-! sol-!
    mi4\p mib re2

    %7
    sol8 sol, si sol r re' fad re
    r sol, si sol re' fad la re
    sol,8\p sol, si sol r re' fad re

    %10
    r sol, si sol re' fad la re
    sol,\f sol, si sol r la dod la
    re re la la' si si, fad' fad

    %13
    sol sol re' re,\mbreak mi mi dod la
    re4 r8 la re fad sol la
    re re, fad re r la dod la

    %16
    r re fad re la dod mi la
    re,\p re fad re r la dod la
    r re fad re la la' fad re\f

    %19
    sol fad sol mi fad mi fad re
    mi re dod la re4 re,
    r2\mbreak lad'4\fermata r8 r16 lad-!

    %22
    lad?8^\staccatissimo lad^\staccatissimo r8 r16 la^\staccatissimo la8^\staccatissimo la^\staccatissimo r r16 re
    re8 re r r16 re dod8-! dod-! dod-! dod-!
    do2 si\fermata

    %25
    mi'8 mi, sol mi r si red si
    r mi sol mi si red fad si
    mi8\p mi, sol mi r si red si\mbreak

    %28
    r mi sol mi si red fad si
    sold\f si sold mi r la, dod la
    r re fad re r sol, si sol

    %31
    r do? mi do r re fad re
    r sol si sol dod, dod red red
    mi mi sol mi la la si si,

    %34
    mi r re r do r sol' r\mbreak
    red r mi la si4 si,
    mi8\p r re? r do r si r

    %37
    lad\f fad' sol mi fad4 fad,
    si8 mi fad fad, si4 r
    sol8 sol si sol r re' fad re

    %40
    r sol, si sol re' fad la re
    sol,\p sol, si sol r re' fad re\mbreak
    r sol ,si sol re' fad la re

    %43
    sol,\f sol, si sol r la dod la
    re re la la' si si, fad' fad
    sol sol re' re, mi mi dod la

    %46
    re\f re fad re r re fad re
    r sol si sol r sol, si sol
    r do mi do r do mi do

    %49
    r re fad re\mbreak r re fad re
    sol, si la re sol,\p si la re
    sol,\f si la re sol, si do re

    %52
    sol, si re mi sol, si re sol
    re fad la re re, fad la re
    sol,, si re sol sol, si re sol

    %55
    re fad la re re, fad la re
    re,16 re re re re re re re\mbreak sol sol sol sol sol sol sol sol
    dod, dod dod dod dod dod dod dod dod4\fermata r

    %58
    do!8-! do-! r r16 do-! si8^\staccatissimo si-! r4
    sib8^\staccatissimo sib-! r r16 sib'-! fad8-! fad-! r4
    fa!8-! fa-! r r16 fa mi8 mi r4

    %61
    mib2 re

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s16
    s2 <4 2>8 <6 5> s4
    s8 <6 4> s4 <7>8 <6> s8 s16 <6>
    s8 <6> s4 <7 _+>8 <5> s8 s16 <7>
    <6 4>8 <_!> s8 s16 <4> <6>8 <5 4> s s16 <3+>
    <7>8 <6> s4 s2
    <7>4 <6+> s2
    s1*5
    <9>8 <8> <5 4> <3+> <9> <8> <5 4+> <3>
    <9> <8> <4> <3> <9> <8> <5> s
    s4 s8 <7> s <6> <6 5> s
    s1*4
    <9>4 <8> <9> <8>
    <9>8 <3> s4 <9 5>4 <8>
    s2 <7 3+>4 s8 s16 <7 5>
    <7 5>4 s8 s16 <6 4+> <6 4>8 <_+> s s16 <6 4>
    <6 4>8 <_+> s s16 <6 4+ 2> <6 4>2
    <6+> s
    s1*7
    s2 <6 5>4 <5>
    <9> <6> <6 5> <6+>
    s1
    <5 3>2 <6 4>4 <5 3+>
    s1
    <6 5>4 s8 <6+> <6 4>4 <5 3+>
    s4 <6 4>8 <3+> s2
    s1*5
    <9>8 <8> <5 4> <3+> <9> <8> <5+ 4> <3>
    <9> <8> <5 4> <3> <9> <8> <5> s
    s1
    s4 <6> s <6>
    s <6> s <6>
    s <6> s <6>
    s <7> s s8 <7>
    s4 s8 <7> s4 <6 5>
    s1*3
    <7>2 <5 3>
    <7>4 <7> <6>2
    <7->4 s8 s16 <7 6 5>  s2
    <6 4+ 2>4 s8 s16 <6> <6>4 s
    <6>4 s8 s16 <6> <6>2
    <6 4! 2>4 s8 s16 <6 4 2> <6>2
    <6+>1

}

forma = {

    \time 4/4
    \key sol\major
    \tempo 4 = 55
    \partial 16 s16
    s1*6\break
    \tempo 2 = 60
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -1)\mark\markup\huge"[I.2] Allegro Assai"
    s1*14
    s2 \tempo 4 = 55   \once \override Score.RehearsalMark.extra-offset = #'(3 . -3)\mark\markup\italic"Largo" s
    s1*3\break
    \tempo 2 = 55     \once \override Score.RehearsalMark.extra-offset = #'(0 . -1)\mark\markup\huge"[I.3] Allegro"
    s1*33
    \tempo 4 = 55   \once \override Score.RehearsalMark.extra-offset = #'(1 . -3)\mark\markup\italic"Largo"
    s1*3
    \tempo 4 = 50  \once \override Score.RehearsalMark.extra-offset = #'(5 . -3)\mark\markup\italic"Adagio"
    s1
    \bar"||"

}


IvlI = {
    \global
    %\notypeset
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
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IIvlIn = \relative do'' {

    sol'4 re
    sol,8 si4 re8~
    re mi16 fad sol8 sol

    %4
    fad re re,4
    re' la
    re,8 fad4 la8~

    %7
    la si16 do re8 re
    si la16(sol) la8 fad
    sol'4 re

    %10
    sol,8 si4 dod8
    re mi16(fad) sol8 sol\mbreak
    fad8[re si' la]

    %13
    sol[mi do' si]
    la[fad re' do]
    si16 la sol fad mi8 re

    %16
    dod32(si) la8. la'16 la, la' la,
    sol' la, sol' la, fad' la, fad' la,
    mi' la, mi' la, la'\p la, la' la,

    %19
    sol' la, sol' la, fad' la, fad' la,
    mi'4 r
    r r8 r16 re\f

    %22
    mib4 mi\mbreak
    fa8\tenuto fa\tenuto fad\tenuto fad\tenuto
    sol sol4 sol8

    %25
    sol sol4 fad16 mi
    fad8 mi16 re mi8 dod
    re16 la fad' re  la' fad dod' la

    %28
    re8 re, \grace fad8 mi4\tr
    re la
    re,8 fad4 la8~

    %31
    la si16 dod re8 re
    dod la la,4\mbreak
    la'' mi

    %34
    la, mi'~
    mi8 re4 dod8
    fad8 fad, fad'4~

    %37
    fad8 mi la4~
    la8 sol16 fad sol4~
    sol8 fad16 mi fad4~

    %40
    fad8 mi16 red mi si si' mi,
    red fad si, fad' mi sol si, sol'
    red fad si, fad' mi sol fad la

    %43
    sol(fad sol) mi\tenuto sol8 fad\tr \mbreak
    mi8 r sol r
    lad, r si r

    %46
    dod fad,4 fad'8~
    fad fad,4 fad'8~
    fad si4 lad8

    %49
    si4 r
    si, fad
    si,8 re4 fad8\parentSlur (

    %52
    fad) sold16(lad) si8 si
    lad si16(dod) re8 re
    dod re16 mi fad8 mi\mbreak

    %55
    re si sol' fad
    mi[dod la' sol]
    fad16 la re, la' mi la dod, la'

    %58
    fad la re, la' mi la dod, la'
    fad8 re'4 re,8~
    re re'4 re,8~

    %61
    re si'8~si16 la sol fad
    do' si la sol la sol fad mi
    <<
        {
            la2

            %64
            si
        }\\{
            fad16 re fad re fad re fad re
            sol re sol re\mbreak sol re sol re
        }
    >>
    la'32(fad) re8. re16 re, re' re,
    do'! re, do' re, si' re, si' re,

    %67
    la' re, la' re, re'16\p re, re' re,
    do' re, do' re, si' re, si' re,
    la'8 re, r4

    %70
    sol'4\f re
    sol,8 si4 re8~
    re do16 si la sol fad mi

    %73
    re8 fad4 re8
    sol4 r\mbreak
    sol'4 re

    %76
    sol,8 si4 re8~
    re mi16 fad sol8 sol
    fad32(mi) re8. r4

    %79
    R2
    r4 r8 r16 la'
    sib4 si

    %82
    do dod
    re8 do!16 si la8 sol
    la4 fad\tr

    %85
    sol r
    la8 la4 la8~
    la si16 do re8 do\mbreak

    %88
    si4 la
    sol re
    sol, re

    %91
    sol, r

}

IIvlIIn = \relative do'' {

    R2*3
    re4 la
    re,8 fad4 la8~

    %6
    la si16 dod re8 re
    si la16 sol la8 fad
    sol'4 re-!

    %9
    sol,8 si4 re8~
    re mi16 fad sol8 sol
    fad re4 dod8

    %12
    re [fad re fad,]
    r sol'[mi sol,]
    r la'[fad la,]

    %15
    r re'[si si,]\mbreak
    r8 la fad'4~
    fad8 mi4 re8

    %18
    dod16(si) la4 fad'8\p~
    fad mi4 re8
    \grace re dod4 r8 r16 la\f

    %21
    sib4 si
    do16 do do do sib sib sib sib
    la la la la re re re re

    %24
    si!8 sol r4
    la'8 la4 la8~
    la[la sol mi]

    %27
    fad16(re) re(la) fad'(re) la'(dod,)
    re8 re4 dod8\mbreak
    re4 r

    %30
    R2*2
    la'4 mi
    la,8 dod4 mi8~

    %34
    mi fad16 sol la8 sol
    fad4 mi~
    mi8 re16 dod re8 mi16 fad

    %37
    sol4. fad8
    si si, si' la16 sol
    la8 la, la' sol16 fad

    %40
    sol8 sol, sol' sol
    fad si,4 si'8~
    si si,4 si'8~\mbreak

    %43
    si mi,4 red8
    mi mi, mi'4~
    mi8 re16 dod re8 dod16 si

    %46
    lad dod fad, dod' si re fad, re'
    lad dod fad, dod' si re dod mi
    re dod re si re8 dod\tr

    %49
    si4 fad
    si,8 re4 fad8~
    fad sold16 lad si8 si

    %52
    lad si16 dod re8 re
    dod fad, si si\mbreak
    lad[lad lad lad]

    %55
    si[re si re,]
    r mi'[dod mi,]
    fad la'4 la,8~

    %58
    la la'4 la,8
    la16 re fad, re' la re fad, re'
    si re sol, re' la re fad, re'

    %61
    si re sol, re' sol fad mi re
    mi re do? si do si la sol
    fad32(la) re8. la32(re) fad8.

    %64
    sol,32(si) re8. si32(re) sol8.\mbreak
    fad32(re) la8. si4~
    si8 la4 sol8

    %67
    fad16(mi re4) si'8\p~
    si la4 sol8
    fad16(mi re4) r8

    %70
    R2
    re'4\f sol,
    re8 fad4 la8~

    %73
    la si16 do! re8 re
    si la16(sol) la8 fad
    sol4 r

    %76
    sol' re
    sol,8 sol'16(la) si8 si\mbreak
    la re, r r16 re

    %79
    mib4 mi
    fa fad
    sol8[sol fa fa]

    %82
    mi[mi la la]
    fad4 r8 r16 si,
    do4 la\tr

    %85
    sol8 sol'4 sol8~
    sol sol4 fad16 mi
    fad8 re la'4~

    %88
    la8 sol4 fad8
    sol4 re
    sol, re\mbreak

    %91
    sol, r

}

IIvlan = \relative do' {

    <<re4\\si>> r
    sol' re
    sol,8 re'4 dod8

    %4
    re4 r
    r8 la[re mi]
    fad4 la

    %7
    re, fad
    re8[re re la]
    r re[sol si]

    %10
    r re,[mi mi]\mbreak
    la,4 mi'
    la, r8 re

    %13
    si sol r mi'
    do la r fad'
    re si r si'

    %16
    mi, dod la la
    la[la la la]
    la[la la la]

    %19
    la\p[la la la]
    la dod\f re re
    re[re re re]\mbreak

    %22
    sol, sol r4
    R2*2
    r8 mi'[mi mi]

    %26
    re[la' si la]
    la4 r
    r8 la,[si la]

    %29
    fad4 r
    re'' la
    re,8 la'4 sold8

    %32
    la4 r
    r8 la,[la si]
    dod4 dod'\mbreak

    %35
    la r
    la re,
    R2

    %38
    re4 sol,
    R2
    si'4 mi,

    %41
    r8 fad[sol sol]
    fad[fad sol si]
    mi,[mi do si]

    %44
    si r mi r
    dod[dod si fad']
    fad[dod re re]\mbreak

    %47
    dod[dod re fad]
    si,[si' sol fad]
    fad4 r

    %50
    R2
    re4 si
    dod fad

    %53
    r fad
    r8 dod[dod dod]
    si4 r8 re

    %56
    dod la r la
    la[fad' la mi]
    re[la dod mi]\mbreak

    %59
    re[la' fad la]
    sol[sol fad la]
    sol, sol'4 sol,8

    %62
    sol mi'4 mi8
    la,4 r
    re r

    %65
    re8[re re re]
    re8[re re re]
    re8[re re re]

    %68
    re8[re re re]
    re4 r
    R2*5\mbreak

    %75
    r4 r8 sol,\parenthesize \f
    si sol r sol
    si sol r4

    %78
    re'' sol,
    sol8[sol sol sol]
    do,[do re re]

    %81
    re re r4
    R2*2
    mi4 la,8 re

    %85
    si4 r
    r8 mi[mi mi]\mbreak
    re[la' fad fad]

    %88
    re[re mi la,]
    si4 r
    sol' re

    %91
    sol, r

}

IIbcn = \relative do {

    sol'4 r
    r8 sol[si fad]
    sol4 mi

    %4
    re r
    r8 re[fad dod]
    re4 fad

    %7
    sol re
    sol,8[sol' fad re]
    r sol[si sol]

    %10
    r sol[mi mi]
    re[re mi la,]
    re4. re8

    %13
    mi4. mi8
    fad4. fad8\mbreak
    sol4 sold8 sold,

    %16
    la2
    la~
    la~

    %19
    la4\p re8 re,
    la'[la'\f fad re]
    sol[sol fa fa]

    %22
    mib do r4
    R2
    r4 r8 r16 si

    %25
    do4 dod
    re8[fad sol la]
    re,4 r

    %28
    r8 fad[sol la]
    re,4 r\mbreak
    r8 re[fad dod]

    %31
    re4 si
    la r
    r8 la'[la sold]

    %34
    la2
    re4 la
    re,8[re fad re]

    %37
    mi[mi fad re]
    sol[sol si sol]
    dod,[dod red red]

    %40
    mi[mi sol mi]
    si[red mi mi,]
    si'[red mi red]

    %43
    mi[do'! la si]\mbreak
    mi,[re! dod si]
    fad'[fad si si,]

    %46
    fad'[lad si si,]
    fad'[lad si lad]
    si[sol mi fad]

    %49
    si,4 r
    R2
    si4 r

    %52
    fad r
    fad' r
    fad fad,

    %55
    si4. si8
    dod4. dod8\mbreak
    re8[fad dod la]

    %58
    re[fad dod la]
    re[re fad re]
    sol[si re re,]

    %61
    sol sol, r sol
    do do'4 do,8
    re4 r

    %64
    re r
    re2
    re~

    %67
    re~
    re4 sol8 sol,\mbreak
    re'4 r

    %70
    R2*4
    sol4\f re
    sol,8[sol' si sol]

    %76
    r sol[si sol]
    r4 sol,
    re'8[re' si sol]

    %79
    do[do sib sib]
    la[la re re]
    sib sol r4

    %82
    R2
    r4 r8 r16 sol,\mbreak
    do4 re

    %85
    sol, r8 si
    do4 dod
    re8[re fad re]

    %88
    sol[si, do re]
    sol,4 r
    sol' re

    %91
    sol, r

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*2
    s4 <6+>
    s2*3
    <9>8 <5> s4
    s2*2
    s4 <5>8 <6+>
    s4 s8 <7>
    <5>4 <6>
    <5> <6>
    <5> <6>
    s <6>8 <5>
    s2*3
    s4 <9>8 <8>
    <_+>2
    <_->4 <6 4>8 <_!>
    s2*3
    <6 5>2
    s4 s8 <4+>
    s2
    s4 <6 5>8 <3+>
    s2*2
    s4 <7>8 <6+>
    s2
    s8 <3+> s4
    <3+>2
    <9>8 <8> <4> <3+>
    <9> <8> <6> s
    <9> <8> <9> <3>
    <9> <8> <6> s
    <6 5>4 <5>
    <9>8 <8> <6> s
    <_+>2
    s
    s4 <6 5>8 <3+>
    s4 <5>
    <7+>2
    <_+>
    <_+>
    s4 <6 5>8 <3+>
    s2*3
    <_+>2
    <_+>
    <_+>
    s2*9
    <6 4>2
    s2*14
    <3->4 <6 4>8 <_!>
    <6!>4 <3+>
    s2*3
    <6>2
    s4 s8 <6>
    <6 5>2
    s
    <9>8 <6> <6 5> s

}

forma = {

    \time 2/4
    \key sol\major
    \tempo 2 = 60
    s2*91
    \bar"|."

}


IIvlI = {
    \global
    %\notypeset
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
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f

}

IIIvlIn = \relative do'' {

    la8
    re re re re re re re re
    la'(re,) re4\tr si'16 re, (dod re) re4\tr
    re'8 dod16 si la sol fad mi fad(mi) re8 r re

    %4
    dod\tr re la fad' mi\tr fad la, la'\mbreak
    sold\tr la la, fad' fad\tr mi r re\p
    dod\tr re la fa' mi\tr fa la, la'

    %7
    sold\tr la la, fa' fa\tr mi r la,\f
    si32(dod) re8. dod32(re) mi8. re32(mi) fad?8. mi32(fad) sol8.
    fad8 fa fa fa si8. la16 sold fad mi re\mbreak

    %10
    \grace re8 dod si16(la) sol'!4\tr fad8 mi16 re mi4~
    mi8 la, re4. mi8 dod si
    \grace re8 dod si16 la \grace dod8 si4\tr la r8 la\f

    %13
    re re re re re\tr dod r dod
    fad fad fad fad fad\tr mi r mi
    la la la la la\tr sol r sol\mbreak

    %16
    \grace la8 sol fad16 mi fad4. mi16 re mi8 re
    dod16(la) re(si) mi(dod) fad(re) sol8 sold sold sold
    la si4 la16 sol! fad(re) sol(mi) la(fad) si(re,)

    %19
    la4 mi'\tr re16(la) si(sol) la fad sol mi
    fad4 mi\tr re\fermata r8 la'\solo
    re4 mi16(dod si la) fad'4 sol16(mi re dod)\mbreak

    %22
    la'4 \grace {sol16[la]} si8 re, \grace re dod4 re
    \grace fad8 mi16 \grace mi8 re16 dod si la sol fad sol \grace la8 sol4 fad8. la16
    re(la) fad'(la,) la'8 fad fad16 red mi4 la,8

    %25
    re16(si) sold'(re) si'8 re, \grace re dod4~\tuplet 6/4 { dod16(la si dod re mi) }
    \grace mi8 re4~\tuplet 6/4 {re16(si dod re mi fad) } \grace fad8 mi4~\tuplet 6/4 { mi16(dod re mi fad sol) }\mbreak
    \grace sol8 fad4~\tuplet 6/4 { fad16(re mi fad sold la) } \tupletSpan 4 \grace la8 \tuplet 6/4 {sold16(la si la sold fad) mi[(re dod si dod la)]}

    %28
    \grace la sold8. la16 si dod re mi fad8 \grace fad mi4 re8
    dod16.(la'32) mi16.(si'32) mi,16.(dod'32) mi,16.(re'32) mi,16.(mi'32) re16(dod) si la sold fad
    mi re'8.\terzine \tuplet 3/2 { dod16(si la) } si8\tr\noBeam la\tu la, la la\mbreak

    %31
    la la la la mi'(la,) \grace si8 la4\tr
    fad'16 la,(sold la) la4\tr la'8 sold16 (fad) mi re dod si
    dod si la8 r la sold\tr la mi dod'

    %34
    si\tr dod mi, mi' red\tr mi mi, dod'
    dod\tr si r la\p sold\tr la mi do'\mbreak
    si\tr do mi, mi' red\tr mi mi, do'

    %37
    do\tr si r mi\f la16 mi dod la la' mi dod la
    fad'8 fad, r fad' si16 fad red si si' fad red si
    sold'8 sold, r sold' dod16 sold mid dod dod' sold mid dod\mbreak

    %40
    la'\dolce (sold) sold(fad) fad(mi!) mi(re) re(dod) dod(si) si(la) la(sold)
    sold(la) la(sold) sold(fad) fad(mid) mid8 sold'4\f(la16 si)
    fad,8 la'4(si16 dod) sold,8 si'4 dod16 re

    %43
    dod8 mid, fad sold la4 sold\tr\mbreak
    fad4 r8 dod\solo fad16 dod fad, dod' fad dod fad, dod'
    fad dod la' dod, sold' dod, fad dod sold' dod, mid, dod' sold' dod, mid, dod'

    %46
    sold' dod, si' dod, la' dod, sold' dod, la' dod, fad, dod' la' dod, fad, dod'
    la' dod, dod' dod, si' dod, la' dod, sold' dod, mid, dod' sold' dod, mid, dod'\mbreak %% fine pag
    sold' dod, si' dod, la' dod, sold' dod, fad dod fad, dod' fad dod fad, dod'

    %49
    fad dod la' dod, sold' dod, fad dod \grace fad mid8. red16 dod8 mi
    la16 mi la, mi' la mi la, mi' la mi dod' mi, si' mi, la mi
    si' mi, sold, mi' si' mi, sold, mi' si' mi, re' mi, dod' mi, si' mi,\mbreak

    %52
    dod' mi, la, mi' dod' mi, la, mi' dod' mi, mi' mi, re' mi, dod' mi,
    si' mi, sold, mi' si' mi, sold, mi' si' mi, re' mi, dod' mi, si' mi,
    la red, fad, red' la' red, fad, red' la'(red,) la'8 \grace si la sold16(fad)\mbreak

    %55
    sold(fad) mi8 r <<{mi fad fad4 fad16[mi]}\\{mi8 mi re4 re16[dod]}>>
    <<{fad8 si4 fad8 mi mi4 mi16 [re]
       mi8 la4 mi8 re re4 re16[dod]

       %58
       re8 sold4 re8 dod dod4 dod8
       dod[re16 mi] re8[dod] \grace re8 dod[si]}\\{re8 re4 re8 re dod4 dod16 si
                                                   dod8 dod4 dod8 si si4 si16 la
                                                   si8 si4 si8 la la4 la8
                                                   la si16 dod si8[la] la[sold]}>> r sold\mbreak
    sold32\p(la) si8. si32(dod) re8. re2

    %61
    sold,32\f(la) si8. si32(dod) re8. re2
    la32(si) dod8. dod32(re) mi8. mi2
    lad,32(si) dod8. dod32(re) mi8. mi4.\tr fad16(sol?)

    %64
    \tupletSpan 4 \grace lad?8 \tuplet 3/2 { sol(fad sol) \grace sol fad[(mid fad)] \grace fad mid(red mid) \grace mi8 red[(dod red)]}
    \tuplet 3/2 { \grace red? do(si do) \grace do si[(lad si)] fad(lad mi') sol([(fad mi)]
    re?(dod? si)} \grace \parenthesize re dod8 . si32(dod) si 4 r8 fad

    %67
    si si si si si si si si
    fad'(si,) si4\tr sol'16 si,(lad si) si4\tr
    si'8 lad16 sol fad  mi re dod re(dod) si8 r la_\markup\center-align\italic { più \dynamic f}

    %70
    re8\tu re re re re re re re
    la'(re,) re4\tr si'16 re,(dod re) re4\tr
    re'8 dod16 si la8 sol fad16 mi re8 r8 <<la'\\fad\solo>>

    %73
    <<{\senza\override TupletBracket.bracket-visibility = ##f
       \tuplet 3/2 {
                     la la la la[la la] la la la la[la la]
                     si si si si[si si] si si si si[si si]
                     la\p la la la[la la] la la la la[la la]\mbreak

                     %76
                     si si si si[si si] si si si si[si si]
                     mi,\f mi mi mi[mi mi] mi mi mi mi[mi mi]
                     fad fad fad fad[fad fad] fad fad fad fad[fad fad]

                     %79
                     mi\p mi mi mi[mi mi] mi mi mi mi[mi mi]
                     fad fad fad fad[fad fad] fad fad fad fad[fad fad]
                     si,\f si si si[si si] si si si si[si si]

                     %82
                     dod dod dod dod[dod dod] dod dod dod dod[dod dod]
                     si\p si si si[si si] si si si si[si si]
                     dod dod dod dod[dod dod] dod dod dod dod[dod dod]

                     %85
                     sol'!\f sol sol sol[sol sol] sol sol sol sol[sol sol]
                     fad fad fad fad[fad fad] fad fad fad fad[fad fad]
                     fa\p fa fa  fa[fa fa] fa fa fa  fa[fa fa]

                     %88
                     mi mi mi mi[mi mi] mi mi mi mi[mi mi]
                     mi mi mi mi[mi mi] mi mi mi mi[mi mi]
                     mi\f mi mi mi[mi mi] mi mi mi mi[mi mi]}}\\{
                         \senza\override TupletBracket.bracket-visibility = ##f
                         \tuplet 3/2 {
                         fad re fad fad[re fad] fad re fad fad[re fad]
                         sol re sol sol[re sol] sol re sol sol[re sol]
                         fad re fad fad[re fad] fad re fad fad[re fad]\mbreak
                         sol re sol sol[re sol] sol re sol sol[re sol]
                         dod, la dod dod[la dod] dod la dod dod[la dod]
                         re la re re[la re] re la re re[la re]
                         dod la dod dod[la dod] dod la dod dod[la dod]
                         re la re re[la re] re la re re[la re]
                         sold, mi sold sold[mi sold] sold mi sold sold[mi sold]
                         la mi la la[mi la] la mi la la[mi la]
                         sold mi sold sold[mi sold] sold mi sold sold[mi sold]
                         la mi la la[mi la] la mi la la[mi la]
                         dod la dod dod[la dod] dod la dod dod[la dod]
                         re la re re[la re] re la re re[la re]
                         re sold, re' re[sold, re'] re sold, re' re[sold, re']
                         re sold, re' re[sold, re'] re sold, re' re[sold, re']\mbreak
                         re la re re[la re] re la re re[la re]
                         dod la dod dod[la dod] dod la dod dod[la dod]}}>>

    %91
    re16 dod si la sol fad mi re si' la sol fad mi re dod si
    dod si la8 r la'' \dolce sold(sol) fad(fa)
    mi(re) dod(do) si sib la si16 dod\mbreak

    %94
    re mi fad sol la(si) \terzine\con \tuplet 3/2 { dod[(si la)] } re8 re,16 mi \grace re8 mi4\fermata
    re4 r r r8 %la

    }

IIIvlIIn = \relative do'' {

    la8
    re re re re re re re re
    la'(re,) re4\tr si'16 re, (dod re) re4\tr
    re'8 dod16 si la sol fad mi fad(mi) re8 r4

    %4
    r r8 re dod\tr re la fad'
    mi\tr fad dod re re\tr dod r4\mbreak
    r r8 re \p dod\tr re la fa'

    %7
    mi fa dod re re dod r4
    r r8 la\f si32(dod) re8. dod32(re) mi8.
    re8 re re re re4 si'

    %10
    mi,8 mi4 la,8 re re4 dod8
    fad fad4 fad8 mi4 mi,
    la8 la4 sold8 la4 r

    %13
    r r8 la\f\mbreak mi' mi mi mi
    mi\tr re r re sol sol sol sol
    sol\tr fad r fad si si si si

    %16
    la4. sol16 fad sol4.\tr fad8
    mi fad sol la si si si si
    mi, sol!4 fad16 mi fad(re) sol(mi) la(fad) si(re,)

    %19
    la4 mi'\tr re8 sol, fad mi
    re4 dod\tr re\fermata r
    R1*9

    %30
    r4 r8 mi\f la la la la
    la la la la mi'(la,) \grace si8 la4\tr
    fad'16 la,(sold la) la4\tr la'8 sold16 (fad) mi re dod si

    %33
    dod si la8 r4 r r8 la
    sold la mi dod' si\tr dod sold la
    la\tr sold r4\mbreak r r8 la\p

    %36
    sold\tr la mi do' si do sold la
    la\tr sold r si\f dod! dod, r dod'
    re16 la fad re re' la fad re si'8 fad' r fad

    %39
    mi16 si sold mi mi' si sold mi dod'8 mid, r mid'
    fad,4\dolce la'16 (sold) sold(fad) fad(mi?) mi(re) re\parentSlur (dod) dod\parentSlur  (si)
    si(dod) dod(si) si(la) la(sold)\mbreak sold8 mid'4\f (fad16 sold)

    %42
    la,8 fad'4(sold16 la) mid,8 sold'4(la16 si)
    la4 fad2 mid4\tr
    fad r fad,8\pp fad fad fad

    %45
    fad4 r dod8 dod dod dod
    dod4 r fad8 fad fad fad
    fad4 r dod8 dod dod dod

    %48
    dod4 r fad8 fad fad fad
    fad4 r  dod8 dod dod dod
    dod la la la la4 r\mbreak

    %51
    mi'8 mi mi mi mi4 r
    la8 la la la la4 r
    mi8 mi mi mi mi4 r

    %54
    si8 si si si si4 si
    mi8 mi dod la r re re re
    r re re re r la la la

    %57
    r la la la r si si si
    r sold sold sold la r la r
    la4 r8 la mi'4 r\mbreak

    %60
    R1*2
    r2 dod'8\p si lad sold
    fad4 r dod'8 dod dod si

    %64
    lad r la r sol? r fad r
    mi r mid r fad r lad r
    si re, mi fad si,4 r8 fad'\f

    %67
    si si si si si si si si
    fad'(si,) si4\tr sol'16 si,(lad si) si4\tr
    si'8 lad16 sol fad  mi re dod re(dod) si8 r la_\markup\center-align\italic { più \dynamic f}

    %70
    re8 re re re re re re re
    la'\parentSlur (re,) re4\tr si'16 re,(dod re) re4\tr
    re'8 dod16 si la8 sol fad16 mi re8 r4

    %73
    re,8\p r re' r la r fad r
    sol r re r si r sol r
    R1*2

    %77
    r4 la\p-! dod-! la-!
    re-! mi-! fad-! re-!
    la' r r2

    %80
    R1
    r4 mi\p sold mi
    la si dod la

    %83
    mi r r2
    R1\mbreak
    r4 la\p dod la

    %86
    re la fad re
    sold,4 r r2
    r4 mi' sold mi

    %89
    la, r la r
    la dod dod dod
    re r r2

    %92
    \parenthesize R1
    r2 r8 dod re sold,
    la4 r8 la' sold(sol fad! mi)

    %95
    re4 r r r8

}

IIIvlIIIn = \relative do'' {

    la8
    re re re re re re re re
    la'(re,) re4\tr si'16 re, (dod re) re4\tr
    re'8 dod16 si la sol fad mi fad(mi) re8 r re

    %4
    dod\tr re la fad' mi\tr fad la, la'\mbreak
    sold\tr la la, fad' fad\tr mi r re\p
    dod\tr re la fa' mi\tr fa la, la'

    %7
    sold\tr la la, fa' fa\tr mi r la,\f
    si32(dod) re8. dod32(re) mi8. re32(mi) fad?8. mi32(fad) sol8.
    fad8 fa fa fa si8. la16 sold fad mi re\mbreak

    %10
    \grace re8 dod si16(la) sol'!4\tr fad8 mi16 re mi4~
    mi8 la, re4. mi8 dod si
    \grace re8 dod si16 la \grace dod8 si4\tr la r8 la\f

    %13
    re re re re re\tr dod r dod
    fad fad fad fad fad\tr mi r mi
    la la la la la\tr sol r sol\mbreak

    %16
    \grace la8 sol fad16 mi fad4. mi16 re mi8 re
    dod16(la) re(si) mi(dod) fad(re) sol8 sold sold sold
    la si4 la16 sol! fad(re) sol(mi) la(fad) si(re,)

    %19
    la4 mi'\tr re16(la) si(sol) la fad sol mi
    fad4 mi\tr re\fermata r
    R1*9

    %30
    r4 r8 mi\f la la la la
    la la la la mi'(la,) \grace si8 la4\tr
    fad'16 la,(sold la) la4\tr la'8 sold16 (fad) mi re dod si
    dod si la8 r la sold\tr la mi dod'

    %34
    si\tr dod mi, mi' red\tr mi mi, dod'
    dod\tr si r la\p sold\tr la mi do'\mbreak
    si\tr do mi, mi' red\tr mi mi, do'

    %37
    do\tr si r mi\f la16 mi dod la la' mi dod la
    fad'8 fad, r fad' si16 fad red si si' fad red si
    sold'8 sold, r sold' dod16 sold mid dod dod' sold mid dod\mbreak

    %40
    la'\dolce (sold) sold(fad) fad(mi!) mi(re) re(dod) dod(si) si(la) la(sold)
    sold(la) la(sold) sold(fad) fad(mid) mid8 sold'4\f(la16 si)
    fad,8 la'4(si16 dod) sold,8 si'4 (dod16 re)

    %43
    dod8 mid, fad sold la4 sold\tr\mbreak
    fad4 r
    la,8\pp la la la

    %46
    la(fad' mid red) mid, mid mid mid
    \once\stemUp mid sold'(fad mid) dod, dod dod dod
    \once\stemUp  dod la''(sold fad) mid, mid mid mid

    %49
    \once\stemUp mid? sold'(fad mid) la, la la la
    la fad'(mid red) sold, sold sold sold
    la dod, dod dod \once\stemUp dod mi'?(re? dod)

    %52
    sold sold sold sold \once\stemUp sold si' (la sold)\mbreak
    mi, mi mi mi \once\stemUp mi dod''(si la)
    sold, sold sold sold \once\stemUp sold si'(la sold)

    %55
    red, red red red red4 red
    mi8 mi dod la re!4 r8 re
    re sol? r re la la' r la

    %58
    la mi' r la,, si fad' r si,
    sold mi' r sold, la r la r
    la4 r8 mi' mi4 r

    %61
    R1*2\mbreak
    r2 dod'8\p si lad sold
    fad4 r dod'8 dod dod si

    %64
    lad r la r sol? r fad r
    mi r mid r fad r lad r
    si re, mi fad si,4 r8 fad'\f

    %67
    si si si si si si si si
    fad'(si,) si4\tr sol'16 si,(lad si) si4\tr
    si'8 lad16 sol fad  mi re dod re(dod) si8 r la_\markup\center-align\italic { più \dynamic f}

    %70
    re8 re re re re re re re
    la'(re,) re4\tr si'16 re,(dod re) re4\tr
    re'8 dod16 si la8 sol fad16 mi re8 r4

    %73
    re,8\p r re' r la r fad r
    sol r re r si r sol r
    R1*2

    %77
    r4 la\p-! dod-! la-!
    re-! mi-! fad-! re-!
    la' r r2

    %80
    R1
    r4 mi\p sold mi
    la si dod la

    %83
    mi r r2
    R1\mbreak
    r4 la\p dod la

    %86
    re la fad re
    sold,4 r r2
    r4 mi' sold mi

    %89
    la, r la r
    la dod dod dod
    re r r2

    %92
    \parenthesize R1
    r2 r8 dod re sold,
    la4 r8 la' sold(sol fad! mi)

    %95
    re4 r r r8

}

IIIvlan = \relative do' {

    r8
    fad4 r8 si la si la sol
    fad sol la fad re fad sol si
    la4 mi r8 fad16 sol la8 fad

    %4
    mi4 r r2\mbreak
    r4 r8 la, la la la la
    la4 r r2

    %7
    r4 r8 la\p la la r4
    re\f r r2
    r8 si' si si mi,4 r

    %10
    la la la8 la si la\mbreak
    la4 si2 sold4
    mi8 mi fad si, dod dod dod mi

    %13
    la,4 la' sol sol
    fad8 la fad la r sol mi sol
    r la fad la r si sol si

    %16
    mi,4 re si'8 si si si\mbreak
    la4 r r8 mi mi mi
    mi mi mi mi la,4 r

    %19
    re dod\tr re r
    la la la\fermata r
    R1*9

    %30
    r2 dod4\f r8 fad
    mi fad mi re dod re mi dod\mbreak
    la dod re fad mi4 si

    %33
    r8 dod16 re mi8 dod si4 r
    r2 r4 r8 mi
    mi mi mi mi mi4 r

    %36
    r2 r4 r8 mi\p
    mi mi, r4 r r8 la'\f\mbreak
    re,4 r8 la' red,4 r8 si'

    %39
    mi,4 r8 mi mid sold sold sold
    fad4 r r2
    r dod8\f dod dod dod

    %42
    dod dod dod dod dod dod dod dod
    dod si dod dod\mbreak dod4 dod
    dod r r2

    %45
    R1*22
    re4\f r8 sol fad sol fad mi
    re mi fad re si re mi sol

    %69
    fad r dod r fad r mi r\mbreak
    fad sol fad si la si la sol
    fad sol la fad re fad sol si

    %72
    la4 mi' la, r
    R1*22
    r2 r4 r8

}

IIIbcn = \relative do {

    r8
    re si' la sol fad sol fad mi
    re mi fad re sol la si sol
    fad4 dod r8 re16 mi fad8 re

    %4
    la4 r r2
    r4 r8 re la' la, re\p[re,]
    la'4 r r2

    %7
    r4 r8 re\mbreak la'8 la, r4
    sol'8\f sol, r4 r2
    r8 sold' sold sold sold4 r

    %10
    sol! dod, re8 fad sol la
    re, dod si la sold sold sold sold
    la dod re mi la, la' la sol!

    %13
    fad mi fad re mi mi dod la
    re re fad re mi mi sol mi\mbreak
    fad fad la fad sol sol si sol

    %16
    dod, dod re re sol, sol sol sold
    la4 r r8 re re re
    dod dod dod dod re4 r

    %19
    la' la, re r
    la' la, re\fermata r
    re\p^\markup\italic "Senza Organo" dod re mi

    %22
    fad sol\mbreak la8 la fad mi16(re)
    dod8 dod dod dod re re re re
    re4 r8 re dod dod dod dod

    %25
    si4 r8 sold' la la la,4
    r8 si' si,4 r8 dod' dod,4
    r8 re're,4 r8 fad dod[re]

    %28
    mi4 r re sold,\mbreak
    la8 sold la si dod re mi re
    dod re mi mi, la\tu\f fad' mi re

    %31
    dod re dod si la si dod la
    re mi fad re dod4 sold
    r8 la'16 si dod8 la mi4 r

    %34
    r2 r4 r8 la,
    mi' mi, la' la, mi'4 r\mbreak
    r2 r4 r8 la,\p

    %37
    mi' mi, r4 r8 la' la la,
    r re'\f re re, r si' si si,
    r mi mi mi, r dod' dod dod

    %40
    fad4 r r2
    r dod8\f dod dod dod
    dod dod dod dod dod dod dod dod

    %43
    fad sold la si dod4 dod,
    fad r\mbreak r2
    R1*14

    %59
    r2 r8 mi^\markup\center-align\italic "Senza Organo"_\markup\italic \center-align { \dynamic p Sempre} sold si
    mi,4 r si'8 la sold fad
    mi4 r si'8 la sold mi

    %62
    la4 r r2
    R1*4
    si,8 \f \tu sol' fad mi re mi re dod

    %68
    si dod re si mi fad sol mi
    re r lad r si r dod r
    re_\markup\center-align\italic{Più \dynamic f} si' la sol fad sol fad mi

    %71
    re mi fad re sol la si sol
    fad4 dod re r
    R1*2

    %75
    re8-!_\markup\italic\center-align{\dynamic pp sempre}^\markup\center-align\italic "Senza Organo" r re'-! r la-! r fad-! r
    sol-! r re-! r si-! r sol-! r
    la4 r r2

    %78
    R1
    r4 la\p-! dod-! la-!
    re-! mi-! fad-! re-!\mbreak

    %81
    mi4 r r2
    R1
    r4 mi4 sold mi

    %84
    la si dod la
    la,4 r r2
    R1

    %87
    r4 sold si sold
    mi' r r2
    r4 la, r la

    %90
    r la la la
    re r r sold,\mbreak
    la8 la' la,4 r2

    %93
    R1
    r2 r8 re la' la,\fermata
    \parenthesize re4 \parenthesize r4 \parenthesize r4 \parenthesize r8

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s1*6
    s4 s8 <_->
    <6! 4> <5 3> s4
    s1
    s8 <7!> s4 s2
    <6 4 2>4 <6 5> s2
    <9>8 <[6]> s4 <6 5>2
    s4 <6 5>8 <3+> s2
    <6> <7>8 <6> s4
    <9>8 <8> s4 <9>8 <8> s4
    <9>8 <8> s4 <9>8 <8> s4
    <6 5>2 <7>8 <6> s4
    s2 s8 <6 4+ 2> s4
    <6> <7>8 <6> s2
    <6 4>4 <3> s2
    <6 4>4 <3> s2
    s1*2
    s2 <4>8 <3> s4
    s2 <4>8 <3> s4
    s1*10
    <6 4>4 <5 3+> <_+>2
    s1
    <6 4>8 <5 3+> s4 s2
    s s8 <3+> s4
    s8 <_+> s4 s8 <_+> s4
    s1
    s2 <_+>
    s <_+>
    s8 <6> <6> <6+> <6 4>2
    s1*16
    <_+>1
    s1*8
    <6>2 s4 <6>
    s1*2
    s4 <6>8 <5> s2

}

forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 50
    \partial 8 s8
    %\mark\markup\smaller {\segno}
    s1*95
    \mark\markup\smaller\center-column {"D.C a"\smaller \musicglyph "scripts.ufermata" }
    %\bar"||"

}


IIIvlI = {
    \global
    %\notypeset
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \global
    <<\IIIvlIIn \forma>>

}

IIIvlIII = {
    \global
    <<\IIIvlIIIn \forma>>

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
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IVvlIn = \relative do'' {

    dod16_\solo\parenthesize \tr [re]
    mi32[(re16.)] \tuplet 3/2 { dod16(si la) } \grace {re16[mi]} fad8 fad \grace sold fad[mi] r la,16(dod)
    re8(\grace mi re) si'16. la32(sold fad mi re) re8\tr dod r \grace dod8 si16\tr la
    dod'32(si16.) la32(sold16.) fad32(sold la sold fad mi red mi) \grace mi8 red4 r8 si\mbreak

    %4
    sol'8 sol sol sol sol\tr fad4 si,8
    la' la la la la\tr sold?4 fad8
    sold32(si16.) sold32(mi16.) fad32(la16.) fad32(red16.) \grace red8 mi4 r8 \grace sold8 mi16. fad32

    %7
    sol8 sol sol fad16(mi) \grace re8 dod re4 si'8
    la32(dod,16.) re32(si16.) la8 mi'\tr re4. si'8
    \grace la8 sold! la si dod re16(si) dod4 si16 la

    %10
    sold32(re16.) dod32(si16.) \grace dod8 si8. la16 red8 mi dod si\mbreak
    \tupletSpan 4 \tuplet 6/4 { dod16 la'(sold fad mi re) dod[(si la sold fad mi)] \once\stemUp re sold'(fad mi re dod) si[(la sold fad mi re)]
    \once\stemUp dod fad'(mi re dod si) la[(sold fad mi re dod)] \once\stemUp  si mi'(re dod si la) sold[(fad mi re dod si)]}

    %13
    \once\stemUp la8 fad'' sold la \terzine \tuplet 3/2 { red,16(mi fad) dod[(re mi)] } \grace dod8 si4\tr
    la4 r8

}

IVvlIIn = \relative do'' {

    r8_\markup\italic {Sempre \dynamic p }
    r2 r8 dod, dod\tr\noBeam r
    r2 r8 dod dod\tr\noBeam r
    r2 r8 red red\tr\noBeam r

    %4
    r2 r8 si si\tr\noBeam r
    R1
    r2 r4 r8 r

    %7
    r8 dod dod\tr\noBeam r r2
    r2 r8 re re\tr\noBeam r
    r2 r8 dod re\noBeam r

    %10
    R1
    dod4 r re r
    dod r si r

    %13
    r2 r8 mi mi mi
    <<mi4\\dod>> r8

}


IVvlIIIn = \relative do'' {

    r8_\markup\italic { \dynamic p Sempre }
    r2 r8 mi, mi\tr\noBeam r
    r2 r8 mi mi\tr\noBeam r
    r2 r8 fad fad\tr\noBeam r

    %4
    r2 r8 red red\tr\noBeam r
    R1
    r2 r4 r8 r

    %7
    r8 mi mi\tr\noBeam r r2
    r2 r8 fad fad\tr\noBeam r
    r2 r8 mi fad\noBeam r

    %10
    R1
    mi4 r sold r
    mi r mi r

    %13
    r2 r8 la4 sold8
    la4 r8

}

IVbcn = \relative do {

    r8^\markup\italic"Senza Organo"_\markup\italic {\dynamic p Sempre}
    la8 la re[re] la'  la, la la
    la la sold sold la la la la
    la la la la si si r4

    %4
    lad8 lad lad lad si si si si
    dod dod red si mi mi si' si,\mbreak
    mi mi si' si, mi4 r8 r

    %7
    dod4 mi la, si
    fad'8. sol16 la8 la, re re re re
    re dod si la si la re re

    %10
    mi la, mi'[mi] fad sold! la mi
    la,4 r si r
    la r sold r\mbreak

    %13
    la8 red mi fad si, la mi'[mi,]
    la4 r8

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2 <6 4>8 <5> s4
    <6 4 2>2 <5 4>8 <3> s4
    s2 <_+>
    <7! 5> <6 4>
    <6> <4>8 <3+> <6+ 4> <5+>
    s4 <_+>8 <3+> s2
    s1
    s2 s4 s8 <6>
    <4+>8 <6> s4 s <7>8 <6>
    <_+>2 <6+>
    s <6+>
    s1
    s2 <_+>4 <5 4>8 <3+>

}

forma = {

    \time 4/4
    \key la\major
    \tempo 4 = 42
    \partial 8 s8
    s1*5
    s2 s4 s8 \bar ":..:"\break \grace s s
    s1*7
    s4 s8
    \bar ":|."

}


IVvlI = {
    \global
    %\notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}

IVvlIII = {
    \global
    <<\IVvlIIIn \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

VvlIn = \relative do'' {

    re,16 mi fad8 sol
    <<
        {
            la la la
            la la la
        }\\{
            la la la
            la la la
        }
    >>

    %4
    re la la
    mi' la, la
    fad' la, la

    %7
    sol'16 la sol fad sol mi
    fad sol fad mi fad re
    mi8 la, r

    %10
    la'\dolce la8.\tr si16
    sol8 sol8.\tr la16
    fad8 fad8.\tr sol16

    %13
    mi8 la,4\tr
    la'16\f la, la4\tr
    sol'16 la, la4\tr

    %16
    fad'16 la, la4\tr
    mi'16 la, la4\tr_\markup\italic {Più\dynamic f}
    re16 dod si la sol fad

    %19
    si8 dod re
    sold, la si
    sol!16 mi mi4

    %22
    re4.\fermata
    re'\solo
    \grace sol8 fad mi re\mbreak

    %25
    \grace si' la sol fad
    \grace {sol16[la]} si4.
    la16(fad) sol(mi) fad(re)

    %28
    \grace {sol16[la]} si8 la sol
    fad16 mi re dod re8
    fad fad8.\tr mi32(red)

    %31
    mi8(sold la)
    re, re8.\tr dod32(sid)
    dod8 mid fad

    %34
    si, si8.\tr la32(sold)
    la8(dod re)\mbreak
    fad16 mi re dod si la

    %37
    sold32(fad) mi8. la8
    si32(la) sold8. si8
    dod32(si) la8. dod8

    %40
    re32 dod si8. red8
    mi\f dod re!
    re16(si) dod(la) si(sold)

    %43
    la mi si'4\tr
    la,16\tu si dod8 re
    mi mi mi

    %46
    mi mi mi\mbreak
    la mi mi
    si' mi, mi

    %49
    dod' mi, mi
    re'16 mi re dod re si
    dod re dod si dod la

    %52
    si8 mi, r
    mi'\dolce mi8.\tr fad16
    re8 re8.\tr mi16

    %55
    dod8 dod8.\tr re16
    si8 mi,4
    mi'16\f -! mi,-! mi4\tr\mbreak

    %58
    re'16 mi, mi4\tr
    dod'16 mi, mi4\tr
    si'16 mi, mi4\tr

    %61
    la'16_\markup\italic{Più \dynamic f} sold fad mi re dod
    fad8 sold la
    red, mi fad

    %64
    re!16 si \grace dod8 si4\tr
    la8 r la\solo_\markup\italic \center-align"lento e dolce"
    re16 mi mi4\tr

    %67
    \tuplet 3/2 { fa16 (mi re) sol[(fa mi)] la(sol fa) }
    sib8 dod, re
    la16(dod mi) sib' la sol

    %70
    \grace sol fa16 mi re8 do?
    fa16\f sol sol4\tr
    \tuplet 3/2 { la16(sol fa) si?[(la sol)] do si la}

    %73
    re8 mi, fa
    do16(mi sol) re' do sib
    la32(sol fa mi) fa4\tr

    %76
    \tuplet 3/2 { la16(fa do) do[fa la] la sol fa }\mbreak
    sol8 do mi,\tr
    \tuplet 3/2 { fa16 la sol fa[mi re] re mi fa }

    %79
    mi8\tr la do,\tr
    \tuplet 3/2 { re16 fa mi re[do sib] sib do re }
    do8\tr mi fa\tr

    %82
    \tuplet 3/2 { sol16(fa mi) } sol[la sib la]
    \grace la8 sol4.
    lab8\noBeam lab8. sol32(fa)

    %85
    \tuplet 3/2 { mi16(re do)} do4\tr \mbreak
    re'8 re8. do32(sib)
    \tuplet 3/2 { la16(do sib) la[(sol fa)]} sol8\tr

    %88
    fa4 r8
    \tuplet 3/2 { fad16 la sol fad[mi re] } do8\tr
    \tuplet 3/2 { sib16(la sol) } sol,4

    %91
    \tuplet 3/2 { sold''16\f si! la sold[fad mi] } re8\tr
    \tuplet 3/2 { dod16(si la) } la,4
    \tuplet 3/2 {
        dod'16 la dod mi[dod mi] sol mi sol

        %94
        dod, la dod mi[dod mi] si' sol mi
        dod la dod mi[dod mi] si'  la sol
        fad mi re la[re fad] la sol fad

        %97
        mi dod la la[dod mi] sol fad mi
        fad re la la[re fad] la sol fad
    }
    sol64(la si la) sol16 mi64[(fad sol fad) mi16]\mbreak dod64(re mi re) dod16

    %100
    fad64(sol la sol) fad16 re64[(mi fad mi) re16] si64(dod re dod) si16
    mi64[(fad sol fad) mi16]\mbreak dod64[(re mi re) dod16] la64(si dod si) la16
    fa'4.(

    %103
    fad!)
    \tuplet 3/2 { sol16(si la) } \grace la8 sol4(
    sold4.)

    %106
    \tuplet 3/2 { la16 dod si } la4
    dod4.
    \tuplet 3/2 { re16(dod si la[sol fad] mi fad re) }

    %109
    la8_\markup\italic "a suo modo" mi'4\tr

}

VvlIIn = \relative do'' {

    re,16 mi fad8 sol
    <<
        {
            la la la
            la la la
        }\\{
            la la la
            la la la
        }
    >>

    %4
    re la la
    mi' la, la
    fad' la, la

    %7
    sol'16 la sol fad sol mi
    fad sol fad mi fad re
    mi8 la, r

    %10
    r8 fad'4\dolce~
    fad8 mi16(re) mi8~
    mi re16(dod) re8~

    %13
    re dod16 si dod la
    la'16\f la, la4\tr
    sol'16 la, la4\tr

    %16
    fad'16 la, la4\tr
    mi'16 la, la4\tr_\markup\italic {Più\dynamic f}
    re16 dod si la sol fad

    %19
    si8 dod re
    sold, la si
    sol!16 mi mi4

    %22
    re4.\fermata
    R
    re\p

    %25
    fad8(mi re)
    sol(fad mi)
    fad(mi re)

    %28
    sol dod, la
    re4.
    re'8 re re

    %31
    dod dod dod
    si si si
    la la la

    %34
    sol sol sol
    fad8. sol16(fad mi)
    re4 red8

    %37
    mi4.~_\markup\italic"Sostenuto"
    mi
    la,8 dod la

    %40
    si si' la
    sold la si
    mi, la sold

    %43
    fad16(dod) re8 mi
    la,16\f si dod8 re
    mi mi mi

    %46
    mi mi mi\mbreak
    la mi mi
    si' mi, mi

    %49
    dod' mi, mi
    re'16 mi re dod re si
    dod re dod si dod la

    %52
    si8 mi, r
    r8 dod'4\dolce~
    dod8 si16(la) si8~
    si la16(sold) la8~
    la sold16 fad sold mi
    mi'16\f -! mi,-! mi4\tr\mbreak

    %58
    re'16 mi, mi4\tr
    dod'16 mi, mi4\tr
    si'16 mi, mi4\tr

    %61
    la'16_\markup\italic{Più \dynamic f} sold fad mi re dod
    fad8 sold la
    red, mi fad

    %64
    re!16 si \grace dod8 si4\tr
    la8 r r
    R4.*23

    %89
    re,4 fad8
    sol sol, r
    mi'4 sold8

    %92
    la la, r
    la dod mi
    la, dod mi

    %95
    la, dod la
    re fad re
    dod dod' dod,\mbreak

    %98
    re fad re
    mi dod la
    re4 r8

    %101
    dod4 r8
    re re' re
    do do do

    %104
    si mi mi
    re re re
    dod la la

    %107
    sol! sol sol
    fad4 sol8
    la la,4\fermata

}

VvlIIIn = \relative do'' {

    re,16 mi fad8 sol
    <<
        {
            la la la
            la la la
        }\\{
            la la la
            la la la
        }
    >>

    %4
    re la la
    mi' la, la
    fad' la, la

    %7
    sol'16 la sol fad sol mi
    fad sol fad mi fad re
    mi8 la, r

    %10
    la'\dolce la8.\tr si16
    sol8 sol8.\tr la16
    fad8 fad8.\tr sol16

    %13
    mi8 la,4\tr
    la'16\f la, la4\tr
    sol'16 la, la4\tr

    %16
    fad'16 la, la4\tr
    mi'16 la, la4\tr_\markup\italic {Più\dynamic f}
    re16 dod si la sol fad

    %19
    si8 dod re
    sold, la si
    sol!16 mi mi4

    %22
    re4.\fermata
    R
    re\p

    %25
    fad8(mi re)
    sol(fad mi)
    fad(mi re)

    %28
    sol dod, la
    re4.
    re'8 re re

    %31
    dod dod dod
    si si si
    la la la

    %34
    sol sol sol
    fad8. sol16(fad mi)
    re4 red8

    %37
    mi4.~_\markup\italic"Sostenuto"
    mi
    la,8 dod la

    %40
    si si' la
    sold la si
    mi, la sold

    %43
    fad16(dod) re8 mi
    la,16\f si dod8 re
    mi mi mi

    %46
    mi mi mi\mbreak
    la mi mi
    si' mi, mi

    %49
    dod' mi, mi
    re'16 mi re dod re si
    dod re dod si dod la

    %52
    si8 mi, r
    mi'\dolce mi8.\tr fad16
    re8 re8.\tr mi16

    %55
    dod8 dod8.\tr re16
    si8 mi,4
    mi'16\f -! mi,-! mi4\tr\mbreak

    %58
    re'16 mi, mi4\tr
    dod'16 mi, mi4\tr
    si'16 mi, mi4\tr

    %61
    la'16_\markup\italic{Più \dynamic f} sold fad mi re dod
    fad8 sold la
    red, mi fad

    %64
    re!16 si \grace dod8 si4\tr
    la8 r r
    R4.*23

    %89
    re,4 fad8
    sol sol, r
    mi'4 sold8

    %92
    la la, r
    la dod mi
    la, dod mi

    %95
    la, dod la
    re fad re
    dod dod' dod,\mbreak

    %98
    re fad re
    mi dod la
    re4 r8

    %101
    dod4 r8
    re re' re
    do do do

    %104
    si mi mi
    re re re
    dod la la

    %107
    sol! sol sol
    fad4 sol8
    la la,4\fermata

}

Vvlan = \relative do' {

    re16 mi fad8 sol
    la la la
    la16 re dod si la sol

    %4
    fad mi re fad mi re
    dod si la dod si la
    re mi fad mi fad re

    %7
    mi8 dod la
    re fad re\mbreak
    la'8 la, r

    %10
    la4._\markup\italic"Arcata ferma"~
    la~
    la~

    %13
    la
    la'16\f sol fad mi fad re
    mi re dod si dod la

    %16
    re mi fad mi fad re
    dod si dod la si dod
    re'\f dod si la sol fad\mbreak

    %19
    si8 dod re
    sold, la si
    sol,! la4

    %22
    re4.\fermata
    R4.*21
    la16\f si dod8 re

    %45
    mi mi mi
    mi16 la sold fad mi re
    dod si la dod' si la\mbreak

    %48
    sold fad mi sold fad mi
    la si dod si dod la
    si8 sold mi

    %51
    la dod la
    mi' mi, r
    mi4._\markup\italic {\dynamic p e Arcata ferma}~

    %54
    mi~
    mi~
    mi

    %57
    mi'16\f re dod si dod la\mbreak
    si la sold fad sold mi
    la si dod si dod la

    %60
    sold fad sold mi fad sold
    la sold fad mi re dod
    fad8 sold la

    %63
    red, mi fad
    re! mi4
    la,8 r r

    %66
    R4.*44

}

Vbcn = \relative do {

    re16 mi fad8 sol
    la la la
    la16 re dod si la sol

    %4
    fad mi re fad mi re
    dod si la dod si la
    re mi fad mi fad re

    %7
    mi8 dod la
    re fad re\mbreak
    la'8 la, r

    %10
    la4.
    la~
    la~

    %13
    la
    la'16\f sol fad mi fad re
    mi re dod si dod la

    %16
    re mi fad mi fad re
    dod si dod la si dod
    re'\f dod si la sol fad\mbreak

    %19
    si8 dod re
    sold, la si
    sol,! la4

    %22
    re4.\fermata
    R4.*21
    la16_\markup\italic {Tutti \dynamic f} si dod8 re

    %45
    mi mi mi
    mi16 la sold fad mi re
    dod si la dod' si la\mbreak

    %48
    sold fad mi sold fad mi
    la si dod si dod la
    si8 sold mi

    %51
    la dod la
    mi' mi, r
    mi4.~

    %54
    mi~
    mi~
    mi

    %57
    mi'16\f re dod si dod la\mbreak
    si la sold fad sold mi
    la si dod si dod la

    %60
    sold fad sold mi fad sold
    la sold fad mi re dod
    fad8 sold la

    %63
    red, mi fad
    re! mi4
    la8_\markup\italic {\dynamic p Senza Organo} la sol!

    %66
    fa dod4
    re8 mi fa
    sol la sib

    %69
    dod, dod dod
    re4 r8
    la' mi do

    %72
    fa sol la
    sib do re
    mi, mi mi

    %75
    fa4.
    fa8 fa fa
    mi mi mi

    %78
    re re re\mbreak
    do do do
    sib sib sib

    %81
    la la la
    sib sib sib
    do4 r8

    %84
    si' si si
    do8. sib16 la fa
    sib8 la sol

    %87
    fa do' do,
    fa4 r8
    R4.*21

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    %s4.*56
    %s8 <6>

}

forma = {

    \time 3/8
    \key re\major
    \tempo 4. = 57
    s4.*65\break
    \key do\major
    \tempo 4 = 57
    s4.*27\break
    \key re\major
    \tempo 4. = 57
    s4.*17
    \mark\markup\smaller\center-column {"D.C a"\smaller \musicglyph "scripts.ufermata" }
    %\bar"|."

}


VvlI = {
    \global
    %\notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    \global
    <<\VvlIIn \forma>>

}

VvlIII = {
    \global
    <<\VvlIIIn \forma>>

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

    \header {
        title = \markup\smaller\fill-line {"Concerti da Chiesa e da Camera [Op. I]"}
        composer = \markup \center-column{"L. Zavateri(1690 - 1764)"}
    }

    \markup\huge\bold\column {"I. Introducione"}
    \markup \huge {[I.1] Largo e Spic[cat]o}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino""P.mo"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino ""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"Organo""Basso"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
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

    %\pageBreak

    \markup \huge {[I.4] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino""P.mo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violino ""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"Organo""Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge\bold\column {"II. Concerto Secondo con Violino ob[b]ligato"}
    \markup \huge {[II.1] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino P.mo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino P.mo"\vspace #-0.2"di Ripieno"}
                \set Staff.shortInstrumentName = "vlrp"
                \IIIvlIII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"Organo""Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[II.2] Adagio}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino P.mo"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino P.mo"\vspace #-0.2"di Ripieno"}
                \set Staff.shortInstrumentName = "vlrp"
                \IVvlIII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)
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

        systems-per-page = #3

    }

    \markup \huge {[II.3] Spiritoso}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino P.mo"}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino P.mo"\vspace #-0.2"di Ripieno"}
                \set Staff.shortInstrumentName = "vlrp"
                \VvlIII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"Organo""Basso"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}
