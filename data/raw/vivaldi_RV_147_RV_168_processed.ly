\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

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
}

IvlIn = \relative do'' {

    sol,8 <sol'' si, re, sol,>4 r8 r16 re, <fad' la, re,>4 r8 r16 fad,
    fad8. la16 la8.[do'16] \grace do8 si2\fermata
    sol8. sol16 si,8.[si16] do4 r16 mi (re32 do si la)

    %4
    sol8.[do,16] re8. re16 sol,4 r\mbreak
    sol''8.\p sol16 si,8.[si16] do4 r16 mi (re32 do si la)
    sol8.[do,16] re8. re16 sol,4\fermata r8 sol''

    %7
    si,16(re sol si) si8(la16 sol) si,(re sol si) si8(la16 sol)\mbreak
    fad re mi do re si do la si8 re, si sol
    si'16(re sol si) si8(la16 sol) si,(re sol si) si8(la16 sol)

    %10
    fad re mi do re si do la si8 sol~sol16 fad sol la
    si8 sol~sol16 fad sol la\mbreak si do re si sol la si sol
    re mi fad re sol, la si sol re'2~

    %13
    re4\fermata r8 sol' \p sib,16(re sol sib) sib8(la16 sol)
    sib,16(re sol sib) sib8(la16 sol) fad re mib do re sib do la\mbreak
    sib8 re, sib sol sib'16(re sol sib) sib8(la16 sol)

    %16
    sib,16(re sol sib) sib8(la16 sol) fad mi re8 r re
    lab'4\f(sol16) fa mib re mib re do8 r do
    sol'4 (fa16) mib re do re do sib8 r fa'\mbreak

    %19
    sib16 la sol8 r16 fa mib8 r16 re do8 r16 sib la sol
    fa re' re8(do8.) sib16 re,16 re' re8(do8.) sib16
    mib, re' re8(do8.) sib16 fa re' do sib do4\tr\mbreak

    %22
    sib4 r8 sol'\f sib,16(re sol sib) sib8(la16 sol)
    si,!16(re sol si!) si8(la16 sol) fad re mi? do re si do la
    si8 re, si sol si''16(do re8-.) re-. re-.

    %25
    sold,16(la si8-.) si-. si-. re,16(mi fa8-.) fa-. fa-.
    si,16(do re8-.) re-. re-. do16 si la8 r4
    la'16(si do8-.) do-. do-. fad,!16(sol la8-.) la-. la-.

    %28
    red,16(mi fad8-.) fad-. fad-. la,16(si do8-.) do-. la-.
    sol16 fad mi8 r mi' si16(mi sol si) si8(la16 sol)
    si,(red fad la) la8 (sol16 fad) si,(mi sol si) si8(la16 sol)

    %31
    si,(red fad la) la8(sol16 fad) sol mi fa4 mi8
    la16 mi fa4 mi8 si'16 mi, fa4 mi8
    do'8 mi, fad!4\tr mi r8 sol

    %34
    si,16(re sol si) si8(la16 sol) si,(re sol si) si8(la16 sol)
    fad re mi do re si do la si8 re, si sol
    <<{sol16 sol' sol' sol, sol,  sol' sol' sol, sol,  sol' fa' sol, sol,  sol' fa' sol,

    %37
     sol,  sol' mi' sol, sol,  sol' mi' sol, sol, sol' re' sol, sol, sol' re' sol,
    re re' re' re, re, re' re' re,  re, re' do' re, re, re' do' re,
     re, re' si' re,  re, re' si' re, re, re' la' re,  re, re' la' re,  }

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
            \key sol\major <<{sol8^\markup\italic"manoscritto"  sol sol sol fa fa fa fa
                                mi mi mi mi re re re re
                                re' re re re do do do do
                                si si si si la la la la}\\{\shiftOn \stemUp sol,2 sol
                                                           sol sol
                                                           re' re
                                                           re re}\\{\shiftOnn \stemUp sol,, sol
                                                                    sol sol
                                                                    re' re
                                                                    re re}>>}>>

    %40
    <la'' re, re,>4 r8 sol si16 sol la fad sol mi fad re
    mi do re si do la si sol re'4 re
    si'16 sol la fad sol mi fad re mi do re si do la si sol

    %43
    re4 re sol'16 si la8 r16 sol fad8
    r16 mi re8 r16 do si la si si' si8(la16) sol fad mi
    re sol sol8(fad16) mi re do si si' si8(la16) sol fad mi

    %46
    re sol sol8 (fad16) mi re do si8 sol' re, fad'
    sol16 re do si mi do si la re si la sol do la sol fad
    sol8 si,16 do re8 re sol,4 r

}

IvlIIn = \relative do'' {

    sol,8 <sol'' si, re, sol,>4 r8 r16 re, <fad' la, re,>4 r8 r16 fad,
    fad8. la16 la8.[do'16] \grace do8 si2\fermata
    sol8. sol16 si,8.[si16] do4 r16 mi (re32 do si la)

    %4
    sol8.[do,16] re8. re16 sol,4 r\mbreak
    sol''8.\p sol16 si,8.[si16] do4 r16 mi (re32 do si la)
    sol8.[do,16] re8. re16 sol,4\fermata r8 sol''

    %7
    si,16(re sol si) si8(la16 sol) si,(re sol si) si8(la16 sol)\mbreak
    fad re mi do re si do la si8 re, si sol
    si'16(re sol si) si8(la16 sol) si,(re sol si) si8(la16 sol)

    %10
    fad re mi do re si do la si8 sol~sol16 fad sol la
    si8 sol~sol16 fad sol la\mbreak si do re si sol la si sol
    re mi fad re sol, la si sol re'2~

    %13
    re4\fermata r8 sol'\p sib,16(re sol sib) sib8(la16 sol)
    sib,16(re sol sib) sib8(la16 sol) fad re mib do re sib do la\mbreak
    sib8 re, sib sol sib'16(re sol sib) sib8(la16 sol)

    %16
    sib,16(re sol sib) sib8(la16 sol) fad mi re8 r re
    lab'4\f(sol16) fa mib re mib re do8 r do
    sol'4 (fa16) mib re do re do sib8 r fa'\mbreak

    %19
    sib16 la sol8 r16 fa mib8 r16 re do8 r16 sib la sol
    fa re' re8(do8.) sib16 re,16 re' re8(do8.) sib16
    mib, re' re8(do8.) sib16 fa re' do sib do4\tr\mbreak

    %22
    sib4 r8 sol'\f sib,16(re sol sib) sib8(la16 sol)
    si,!16(re sol si!) si8(la16 sol) fad re mi? do re si do la
    si8 re, si sol r2

    %25
    si''16(do re8-.) re-. re-. si,16(do re8-.) re-. re-.
    sold,16 (la si8-.) si-. si-. la8 mi r4
    r2 la'16(si do8-.) do-. do-.

    %28
    si,16(dod red8-.) red-. red-. fad,16(sol la8-.) la-. fad-.
    mi8 si r mi' si16(mi sol si) si8(la16 sol)
    si,(red fad la) la8 (sol16 fad) si,(mi sol si) si8(la16 sol)

    %31
    si,(red fad la) la8(sol16 fad) sol mi fa4 mi8
    la16 mi fa4 mi8 si'16 mi, fa4 mi8
    do'8 mi, fad!4\tr mi r8 sol

    %34
    si,16(re sol si) si8(la16 sol) si,(re sol si) si8(la16 sol)
    fad re mi do re si do la si8 re, si sol
    sol16 sol' sol' sol, sol,  sol' sol' sol, sol,  sol' fa' sol, sol,  sol' fa' sol,

    %37
     sol,  sol' mi' sol, sol,  sol' mi' sol, sol, sol' re' sol, sol, sol' re' sol,
     re re' re' re, re, re' re' re,  re, re' do' re, re, re' do' re,
     re, re' si' re,  re, re' si' re, re, re' la' re,  re, re' la' re,

    %40
    <la' re, re,>4 r8 sol si16 sol la fad sol mi fad re
    mi do re si do la si sol re'4 re
    si'16 sol la fad sol mi fad re mi do re si do la si sol

    %43
    re4 re sol'16 si la8 r16 sol fad8
    r16 mi re8 r16 do si la si si' si8(la16) sol fad mi
    re sol sol8(fad16) mi re do si si' si8(la16) sol fad mi

    %46
    re sol sol8 (fad16) mi re do si8 sol' re, fad'
    sol16 re do si mi do si la re si la sol do la sol fad
    sol8 si,16 do re8 re sol,4 r

}

Ivlan = \relative do' {

    r8
    si4 r la r
    la8. la16 fad'8. fad16 re2\fermata
    sol8. sol16 si,8. si16 do4 r

    %4
    sol'8. mi16 re8. re16 sol,4 r\mbreak
    sol'8. sol16 si,8. si16 do4 r
    sol'8. do,16 re8. re16 sol,4\fermata r8 re'

    %7
    re re re re re re re si
    la4 r sol'8 re si[sol]
    re' re re re re re re si\mbreak

    %10
    la4 r si8 do re fad
    re do re fad si16 do re si sol la si sol
    re mi fad re sol, la si sol re'2\parentSlur(

    %13
    re4\fermata) r8 re\p re re re re\mbreak
    re re re sib la4 r
    sol'8 re sib[sol] re' re re re

    %16
    re re re sib la la la la
    re re re re sol sol sol sol
    do, do do do\mbreak fa fa fa fa

    %19
    re re mib mib fa fa sol sol
    do, fa mib mib re re re re
    mib mib mib mib fa fa fa fa

    %22
    sib,4 r8 re\parenthesize \f re re re re\mbreak
    re re re si la4 r
    sol'8 re si[sol] re' re si si

    %25
    sold' sold sold sold sold sold sold sold
    sold? sold sold sold mi mi mi mi
    mi mi mi la\mbreak fad fad fad fad

    %28
    fad fad fad fad red red red red
    si si si si sol' sol sol sol
    fad fad fad fad sol sol sol sol

    %31
    fad fad red red si si' do si\mbreak
    r do do si r do do si
    r mi, mi red mi4 r8 re

    %34
    re re re re re re re si
    la4 r sol'8 re si[sol]
    sol sol sol sol sol sol sol sol\mbreak

    %37
    sol sol sol sol sol sol sol sol
    re' re re re re re re re
    re re re re re re re re

    %40
    re si la sol sol' fad mi re
    do si la sol re''4 re\mbreak
    sol,8 fad mi re do si la sol

    %43
    re'4 re re8 fad fad fad
    sol sol la la re, re re re
    si' si la fad re re re re

    %46
    si' si la fad re re16 mi la,8 re\mbreak
    si sol' mi'16 do si la re si la sol do la sol fad
    sol8 si,16 do re8 re sol,4 r

}


Ibcn = \relative do {

    r8
    sol4 r re' r
    re re sol,2\fermata
    sol'8. sol16 si,8. si16 do4 r

    %4
    sol'8. do,16 re8. re16 sol,4 r\mbreak
    sol'8. sol16 si,8. si16 do4 r
    sol'8. do,16 re8. re16 sol,4\fermata r8 sol

    %7
    sol sol' sol sol, sol sol' sol sol,
    re'4 r sol8 re si[sol]
    sol sol' sol sol,\mbreak sol sol' sol sol,

    %10
    re'4 r sol8 la si re,
    sol la si re, si'16 do re si sol la si sol
    re mi fad re sol, la si sol re'2\parentSlur (

    %13
    re4\fermata) r8 sol,\p  \mbreak sol sol' sol sol,
    sol sol' sol sol, re'4 r
    sol8 re sib[sol] sol sol' sol sol,

    %16
    sol sol' sol sol, re' mib re do
    si si si si do re mib do\mbreak
    la la la la sib do re sib

    %19
    sib sib sib do re re mi mi
    fa fa mib mib re re re re
    mib mib mib mib fa fa fa fa\mbreak

    %22
    sib,4 r8 sol\f sol sol' sol sol,
    sol sol' sol sol, re'4 r
    sol8 re si[sol] sol sol' sol sol,

    %25
    mi mi' mi mi, mi mi' mi mi,
    mi mi' mi mi,\mbreak la la' la la,
    la la' la la, si si' si si,

    %28
    si si' si si, si fad' fad si,
    mi, mi' mi mi, mi mi' mi mi,
    red red' red red, mi mi' mi mi,\mbreak

    %31
    red red' red red, mi la' la sol
    r la la sol r la la sol
    r do si si, mi4 r8 sol,

    %34
    sol sol sol sol sol sol sol sol\mbreak
    re'4 r sol8 re si[sol]
    sol sol sol sol sol sol sol sol

    %37
    sol sol sol sol sol sol sol sol
    re' re re re re re re re
    re re re re re re re re

    %40
    re si la sol sol' fad mi re
    do si la sol re''4 re
    sol,8 fad mi re do si la sol

    %43
    re'4 re sol,8 re' re re
    mi mi fad fad\mbreak sol sol fad fad
    sol sol re re sol sol fad fad

    %46
    sol sol re re sol si,16 do re8 re
    sol, sol' mi'16 do si la re si la sol do la sol fad\mbreak
    sol8 si,16 do re8 re sol,4 r

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key sol\major
    \tempo 4 = 60
    \partial 8 s8
    s1*6\once \override Score.RehearsalMark.extra-offset = #'(+5 . -3.3)
    \mark\markup\huge"Allegro"
    \tempo 2 = 55
    s1*42
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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con
}

IIvlIn = \relative do'' {

    re8_\markup\italic "Sempre piano"
    sol,-.[(sol-. sol-. sol-.)]
    \tuplet 3/2 { sol16 mib' (re do[sib la)] } sol8-. (sol-.)
    \tuplet 3/2 { sol16 mib' (re do[sib la)] } sol8-. (sol-.)\mbreak

    %4
    sol8 sib' \appoggiatura sib8 la32 (sol la16) \appoggiatura la8 sol32 [(fad sol16)]
    fad32 \parentSlur (mi? re16) sib'8\noBeam \appoggiatura sib8 la32 (sol la16) \appoggiatura la8 sol32 [(fad sol16)]
    fad32(mi? re16) r8 \senza \tuplet 3/2 { r16 sol-.(la-.) sib-.[la-. sold-.] }

    %7
    \appoggiatura sold?8 la re, \tuplet 3/2 { r16 fa?-. sol?-. la-.[sol-. fad-.]}
    \appoggiatura fad?8 sol do, \tuplet 3/2 { r16 do-. re-. mib?-. [re-. dod-.] }
    \appoggiatura dod?8 re sib r sib\mbreak

    %10
    \appoggiatura do?8 sib16(la sib8) \appoggiatura do8 sib16[(la sib8)]
    \tuplet 3/2 { sib16-. sib'-. la-. sol-.  [fa-. mib-.]} re8 sib\mbreak
    \appoggiatura do8 sib16(la sib8) \appoggiatura do8 sib16[(la sib8)]

    %13
    \tuplet 3/2 { sib16-. sib'-. la-. sol-.  [fa-. mib-.]} re8 sib
    \tuplet 3/2 { reb16(do reb) reb[(do reb)] reb(do reb) reb[(do reb)] }
    \tuplet 3/2 { mib-. la,-. sib-. do-.[sib-. do-.]  mib-. la,-. sib-. do-. [sib-. do-.]}

    %16
    \tuplet 3/2 { reb16(do reb) reb[(do reb)] reb(do reb) reb[(do reb)] }
    \tuplet 3/2 { mib-. la,-. sib-. do-.[sib-. do-.] } do4\tr
    sib r8 fa'

    %19
    \tuplet 3/2 { sol16(fa sol) sol[(fa sol)]  la(sol la) la[(sol la)]}
    sib fa(mib re) do(sib la) mi
    fa sib mib do do4\tr

    %22
    sib r8 re
    sol,-.[(sol-. sol-. sol-.)]
    \tuplet 3/2 { sol16 mib' (re do[sib la)] } sol8-. (sol-.)

    %25
    \tuplet 3/2 { sol16 mib' (re do[sib la)] } sol8-. (sol-.)\mbreak
    sol8 sib' \appoggiatura sib8 la32 (sol la16) \appoggiatura la8 sol32 [(fad sol16)]
    fad32 \parentSlur (mi? re16) re8\tr\noBeam r mib'!

    %28
    mib dod\mbreak dod8.\tr re16
    \tuplet 3/2 { re-. re,-. mi-. fad-.[mi-. re-.] } r8 re'
    re si si8.\tr do16

    %31
    \tuplet 3/2 { do-. do,-. re-. mib?-.[re-. do-.] } r8 lab'
    \appoggiatura sib8 lab32 (sol lab16) \appoggiatura sib8 lab32[ (sol lab16)] \appoggiatura sib8 lab32 (sol lab16) \appoggiatura lab8 sol32[(fad sol16)]
    \appoggiatura sol8 fad32(mi fad16) \appoggiatura lab8 sol32[(fad sol16)] \appoggiatura sib8 lab32 (sol lab16) \appoggiatura lab8 sol32[(fad sol16)]

    %34
    \appoggiatura sol8 fad32(mi? fad16) \appoggiatura lab8 sol32[(fad sol16)] \appoggiatura sib8 lab32 (sol lab16) \appoggiatura lab8 sol32[(fad sol16)]
    fad32 mi? re16 r8 r re
    \tuplet 3/2 { mi?16(do si) do[(si do)] mi(do si) do[(si do)]  }

    %37
    \tuplet 3/2 { fad16(do si) do[(si do)] mi?(do si) do[(si do)]  }
    do'4~do32(si la sol fad  mi re do)
    si?16 sol' la8 la4\tr

    %40
    sol \tuplet 3/2 { r16 sol-. la-. sib-.[la-. sold-.] }
    sold4(\tuplet 3/2 { la16-.) fa-. sol?-. la-.[sol-. fad-.] }
    fad4(\tuplet 3/2 { sol16-.) do,-. re-. mib!-.[re-. dod-.] }

    %43
    dod4(re16) do?32(si la sol fad mi)
    re do? sib? la sol16 sol'' re, sol' re, fad'
    sol2

}

IIvlIIn = \relative do'' {

    re8
    sol,-.[(sol-. sol-. sol-.)]
    \tuplet 3/2 { sol16 mib' (re do[sib la)] } sol8-. (sol-.)
    \tuplet 3/2 { sol16 mib' (re do[sib la)] } sol8-. (sol-.)\mbreak

    %4
    sol8 sib' \appoggiatura sib8 la32 (sol la16) \appoggiatura la8 sol32 [(fad sol16)]
    fad32 \parentSlur (mi? re16) sib'8\noBeam \appoggiatura sib8 la32 (sol la16) \appoggiatura la8 sol32 [(fad sol16)]
    fad32(mi? re16) r8 \senza \tuplet 3/2 { r16 sol-.(la-.) sib-.[la-. sold-.] }

    %7
    \appoggiatura sold?8 la re, \tuplet 3/2 { r16 fa?-. sol?-. la-.[sol-. fad-.]}
    \appoggiatura fad?8 sol do, \tuplet 3/2 { r16 do-. re-. mib?-. [re-. dod-.] }
    \appoggiatura dod?8 re sib r sib\mbreak

    %10
    \appoggiatura do?8 sib16(la sib8) \appoggiatura do8 sib16[(la sib8)]
    \tuplet 3/2 { sib16-. sib'-. la-. sol-.  [fa-. mib-.]} re8 sib\mbreak
    \appoggiatura do8 sib16(la sib8) \appoggiatura do8 sib16[(la sib8)]

    %13
    \tuplet 3/2 { sib16-. sib'-. la-. sol-.  [fa-. mib-.]} re8 sib
    \tuplet 3/2 { reb16(do reb) reb[(do reb)] reb(do reb) reb[(do reb)] }
    \tuplet 3/2 { mib-. la,-. sib-. do-.[sib-. do-.]  mib-. la,-. sib-. do-. [sib-. do-.]}

    %16
    \tuplet 3/2 { reb16(do reb) reb[(do reb)] reb(do reb) reb[(do reb)] }
    \tuplet 3/2 { mib-. la,-. sib-. do-.[sib-. do-.] } do4\tr
    sib r8 fa'

    %19
    \tuplet 3/2 { sol16(fa sol) sol[(fa sol)]  la(sol la) la[(sol la)]}
    sib fa(mib re) do(sib la) mi
    fa sib mib do do4\tr

    %22
    sib r8 re
    sol,-.[(sol-. sol-. sol-.)]
    \tuplet 3/2 { sol16 mib' (re do[sib la)] } sol8-. (sol-.)

    %25
    \tuplet 3/2 { sol16 mib' (re do[sib la)] } sol8-. (sol-.)\mbreak
    sol8 sib' \appoggiatura sib8 la32 (sol la16) \appoggiatura la8 sol32 [(fad sol16)]
    fad32 \parentSlur (mi? re16) re8\tr\noBeam r mib'!

    %28
    mib dod\mbreak dod8.\tr re16
    \tuplet 3/2 { re-. re,-. mi-. fad-.[mi-. re-.] } r8 re'
    re si si8.\tr do16

    %31
    \tuplet 3/2 { do-. do,-. re-. mib?-.[re-. do-.] } r8 lab'
    \appoggiatura sib8 lab32 (sol lab16) \appoggiatura sib8 lab32[ (sol lab16)] \appoggiatura sib8 lab32 (sol lab16) \appoggiatura lab8 sol32[(fad sol16)]
    \appoggiatura sol8 fad32(mi fad16) \appoggiatura lab8 sol32[(fad sol16)] \appoggiatura sib8 lab32 (sol lab16) \appoggiatura lab8 sol32[(fad sol16)]

    %34
    \appoggiatura sol8 fad32(mi? fad16) \appoggiatura lab8 sol32[(fad sol16)] \appoggiatura sib8 lab32 (sol lab16) \appoggiatura lab8 sol32[(fad sol16)]
    fad32 mi? re16 r8 r re
    \tuplet 3/2 { mi?16(do si) do[(si do)] mi(do si) do[(si do)]  }

    %37
    \tuplet 3/2 { fad16(do si) do[(si do)] mi?(do si) do[(si do)]  }
    do'4~do32(si la sol fad  mi re do)
    si?16 sol' la8 la4\tr

    %40
    sol \tuplet 3/2 { r16 sol-. la-. sib-.[la-. sold-.] }
    sold4(\tuplet 3/2 { la16-.) fa-. sol?-. la-.[sol-. fad-.] }
    fad4(\tuplet 3/2 { sol16-.) do,-. re-. mib!-.[re-. dod-.] }

    %43
    dod4(re16) do?32(si la sol fad mi)
    re do? sib? la sol16 sol'' re, sol' re, fad'
    sol2

}

IIvlan = \relative do' {

    sol'8
    sol[sol sol sol]
    sol[sol sol sol]
    sol[sol sol sol]

    %4
    sol[sol do, dod]
    re[sol do, dod]
    re[fad sol sol]

    %7
    fa![fa fa fa]\mbreak
    mib[mib la, la]
    sib[sib sib sib]

    %10
    sib[sib sib sib]
    sib[sib sib sib]
    sib[sib sib sib]

    %13
    sib[sib sib sib]
    sib[sib sib sib]
    fa'[fa fa fa]

    %16
    sib,[sib sib sib]
    fa'[fa fa, fa]
    sib[sib sib sib]

    %19
    mib[mib mib mib]
    re sib fa' fa
    fa[fa fa, fa]

    %22
    sib4 r8 sol
    sol[sol sol sol]
    sol[sol sol sol]

    %25
    sol[sol sol sol]
    sol sol' do, dod\mbreak
    re[re sol sol]

    %28
    sol[sol sol sol]
    fad[fad fad fad]
    fa![fa fa fa]

    %31
    mib[mib mib do]
    do[do do dod]
    re[re re re]

    %34
    re[re re re]\mbreak
    re[re sib sib]
    do[do do do]

    %37
    do[do do do]
    fad,[fad fad fad]
    sol[sol re' re,]

    %40
    sol[sol' sol sol]
    fa[fa fa fa]
    mib[mib mib mib]\mbreak

    %43
    re[re re re]
    re32 (do sib la sol8) re'16 re, re' re,
    sol2


}


IIbcn = \relative do {

    sol'8
    sol [sol sol sol]
    sol [sol sol sol]
    sol [sol sol sol]

    %4
    sol[sol do, dod]
    re[sol do, dod]
    re[fad sol sol]

    %7
    fa?[fa fa fa]\mbreak
    mib[mib la, la]
    sib[sib sib sib]

    %10
    sib[sib sib sib]
    sib[sib sib sib]
    sib[sib sib sib]

    %13
    sib[sib sib sib]
    sib[sib sib sib]
    fa'[fa fa fa]

    %16
    sib,[sib sib sib]
    fa'[fa fa, fa]
    sib[sib sib sib]

    %19
    mib[mib mib mib]
    re sib fa' fa
    fa[fa fa, fa]

    %22
    sib4 r8 sol
    sol[sol sol sol]
    sol[sol sol sol]

    %25
    sol[sol sol sol]
    sol sol' do, dod\mbreak
    re[re sol sol]

    %28
    sol[sol sol sol]
    fad[fad fad fad]
    fa![fa fa fa]

    %31
    mib[mib mib do]
    do[do do dod]
    re[re re re]

    %34
    re[re re re]\mbreak
    re[re sib sib]
    do[do do do]

    %37
    do[do do do]
    fad,[fad fad fad]
    sol[sol re' re,]

    %40
    sol[sol sol sol]
    fa'[fa fa fa]
    mib[mib mib mib]\mbreak

    %43
    re[re re re]
    re32 do sib la sol16 sol re' re, re' re,
    sol2

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/4
    \key sol\minor
    \tempo 4 = 50
    \partial 8 s8
    s2*45
    \bar"||"

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    re4
    sol sol la re,
    si 'sol2 fad4
    sol si, do si8 la

    %4
    si4 sol sol, re''
    sol sol la re,\mbreak
    si' sol2 fad4

    %7
    sol si, re do8 si
    la4 re, re' re,
    do' re, si' la8 sol

    %10
    la4 re, re' re,
    do' re, si' la8 sol
    la4 fad la' la,\mbreak

    %13
    sol' la, fad' mi8 re
    mi4 la, la' la,
    sol' la, fad' mi8 re

    %16
    mi4 la, si8 la si dod
    re4 dod re8 dod re mi
    fad4 mi\mbreak fad8 mi fad sol

    %19
    la4 la, sol' fad8 mi
    fad4 la, sol' fad8 mi
    fad4 re mi dod

    %22
    re2 r4 si
    mi mi fad si,\mbreak
    sol' mi2 red4

    %25
    mi sol, la sol8 fad
    sol4 mi si'' si,
    la' si, sol' fad8 mi

    %28
    fad4 si, si' si,
    la' si, sol' fad8 mi
    fad4 si, la' sol8 fad

    %31
    sol4 mi fad red
    mi2 r4 re\mbreak
    sol sol la re,

    %34
    si' sol2 fad4
    sol si, do si8 la
    si4 sol re' do8 si

    %37
    la4 re, re'' re,
    do' re, si' la8 sol
    la4 re, re' re,

    %40
    do' re, si' la8 sol
    la4 re, mi8 re mi fad\mbreak
    sol4 fad sol8 fad sol la

    %43
    si4 la si8 la si do
    re4 re, do' si8 la
    si4 re, do' si8 la

    %46
    si4 sol la fad
    sol2.

}

IIIvlIIn = \relative do'' {

    r4
    r sol'2 fad4
    sol sol la re,
    si' sol, la sol8 fad

    %4
    sol4 sol sol, r
    r sol''2 fad4\mbreak
    sol sol la re,

    %7
    si' si,2 la8 sol
    fad4 fad r2
    r re'4 re,

    %10
    do' re, si' la8 sol
    la4 re, re' re,
    do' re, fad' mi8 re

    %13
    mi4 la, la' la,\mbreak
    sol' la, fad' mi8 re
    mi4 la,la' la,

    %16
    sol' la, r2
    r4 la si8 la si dod
    re4 dod re8 dod re mi

    %19
    fad4 la, mi' re8 dod\mbreak
    re4 la mi' re8 dod
    re4 fad sol mi

    %22
    re2 r4 r
    r mi2 red4
    mi mi fad si,

    %25
    sol' mi, fad red
    mi mi r2\mbreak
    r si''4 si,

    %28
    la' si, sol' fad8 mi
    fad4 si, si' si,
    la' si, fad' mi8 red

    %31
    mi4 sol la fad
    mi2 r
    r4 sol2 fad4\mbreak

    %34
    sol sol la re,
    si' sol, la sol8 fad
    sol4 re si' la8 sol

    %37
    fad4 fad r2
    r re''4 re,
    do' re, si' la8 sol

    %40
    la4 re, re' re,\mbreak
    do' re, r2
    r4 re mi8 re mi fad

    %43
    sol4 fad sol8 fad sol la
    si4 sol la sol8 fad
    sol4 \parenthesize si, la' sol8 fad

    %46
    sol4 si, do la
    sol2 r4

}

IIIvlan = \relative do' {

    r4
    r si' mi, re
    re si' mi, la
    sol re mi fad

    %4
    re sol sol, r
    r si' mi, la
    sol si mi, re\mbreak

    %7
    re re re do
    fad fad fad re
    fad fad re re

    %10
    fad fad re re
    fad fad re re
    mi fad fad la

    %13
    dod, dod re fad
    dod dod re fad\mbreak
    dod dod re fad

    %16
    dod re re8 dod re mi
    fad4 mi re4. la8
    la4 la' la la

    %19
    la la dod dod
    la la dod dod
    la la si la\mbreak

    %22
    fad2 r4 r
    r si do si
    si si do si

    %25
    si si, do si
    si sol red' red
    red? red mi sol

    %28
    red red mi sol
    red red mi sol
    red red red red

    %31
    si si' do si
    sol mi mi, r
    r si'' mi, re

    %34
    re si' mi, re
    re re mi re
    re si re mi

    %37
    fad fad fad fad\mbreak
    fad fad sol si
    fad fad sol si

    %40
    fad fad sol si
    fad sol sol8 fad sol la
    si4 la mi mi

    %43
    re re re re
    re re fad fad
    re re fad fad\mbreak

    %46
    re re mi re
    si2 r4

}


IIIbcn = \relative do {

    r4
    r sol 'do, re
    sol, sol' do, re
    sol, sol' do, re

    %4
    sol, sol' sol, r
    r sol' do, re
    sol, sol'\mbreak do, re

    %7
    sol, sol' do, re
    re re re re
    re re re re

    %10
    re re re re
    re re re re
    re re re re

    %13
    la la la la\mbreak
    la la la la
    la la la la

    %16
    la fad' sol sol,
    \parenthesize la \parenthesize  fad'\parenthesize  sol \parenthesize sol,
    re' la' re re,

    %19
    re re la la
    la la la la
    re re sol, la

    %22
    re re, r r
    r mi' la, si
    mi, mi' la, si

    %25
    mi, mi' la, si
    mi, sol si si
    si si si si

    %28
    si si si si
    si si si si\mbreak
    si si si si

    %31
    mi mi la, si
    mi, mi' mi, r
    r sol' do, re

    %34
    sol, sol' do, re
    sol, sol' do, re
    sol, sol' sol, do

    %37
    re re re re\mbreak
    re re re re
    re re re re

    %40
    re re re re
    re si do do,
    sol' re' do do,

    %43
    sol' re' re re
    re re re re
    re re re re

    %46
    sol, sol' do, re
    sol,2 r4

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \key sol\major
    \tempo 1 = 65
    \partial 4 s4
    s1*21
    s2 s4 \bar":..:"\break s4
    s1*24
    s2 s4
    \bar":|."

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {

    si8
    <<
        {
            <<
                {
                    si si si si \stemDown <si fad> <si fad> <si fad> <si fad>
                    \stemUp si si si si \stemDown <si fad> <si fad> <si fad> <si fad>
                    \stemUp fad' fad fad fad \stemDown <fad re> <fad re> <fad re> <fad re>

                    %4
                    \stemUp fad fad fad fad \stemDown <fad re> <fad re> <fad re> <fad re>
                    \stemUp si16(fad) si (fad) si16(fad) si (fad) \stemDown <sol mi>8 <sol mi> <sol mi> <sol mi>
                    \stemUp la16\parentSlur(mi) la\parentSlur(mi) la\parentSlur(mi) la\parentSlur(mi) \stemDown <fad re>8 <fad re> <fad re> <fad re>
                }\\{
                    fad,16(re) fad(re) fad(re) fad(re) s2
                    fad16(re) fad(re) fad(re) fad(re) s2
                    re'16(si) re(si) re(si) re(si) s2
                    re16(si) re(si) re(si) re(si) s2
                    re8 re re re s2
                    dod8 dod dod dod
                }
            >>
        }

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
            \key si\minor <<
                {
                    si2^\markup\italic"manoscritto" si8 si si si
                    si2 si8 si si si
                    fad'2 fad8 fad fad fad
                    fad2 fad8 fad fad fad
                    si16 (fad) si (fad) si16(fad) si (fad) sol8 sol sol sol
                    la16\parentSlur(mi) la\parentSlur(mi) la\parentSlur(mi) la\parentSlur(mi) fad8 fad fad fad
                }\\{
                    \stemDown fad,16(re) fad(re) fad(re) fad(re) fad2
                    fad16(re) fad(re) fad(re) fad(re) fad2
                    re'16(si) re(si) re(si) re(si) re2
                    re16(si) re(si) re(si) re(si) re2
                    re2 mi
                    dod2 re
                }
            >>
        }
    >>

    %7
    fad,8 fad'4 fad,8 fad mi'4 fad,8
    fad fad'4 fad,8 fad mi'4 fad,8
    fad fad'4 fad,8 fad4\fermata r

    %10
    <si fad si,>8.\p[dod16 re8 dod] <si fad si,>8.[dod16 re8 dod]
    si fad re si <si' fad si,>8.[dod16 re8 dod]
    <si fad si,>8.\p[dod16 re8 dod] si8-. dod-. re-. mi-.

    %13
    fad4 r16 fad-. re-. dod-. dod4(si16) la sol fad
    \grace fad8 sol fad r16 fad'-. re-. dod-. dod4(si16-.) la-. sol-. fad-.
    mi8 re r fad' re16-. dod-. si-. sol' sol8(fad16) mi

    %16
    re-. dod-. si-. sol' sol8(fad16) lad lad8(si16) sol fad-. mi-. re-. dod-.\mbreak
    re dod si8 si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
    si32(dod re dod si16) r si32(dod re dod si16) r\mbreak re8 sol fad16-. mi-. re-. dod-.

    %19
    si4 si'32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
    si32(dod re dod si16) r si32(dod re dod si16) r si8 sol fad16-. mi-. re-. dod-.
    <<
        {
            <<
                {
                    fad8\f fad fad fad fad fad fad fad

                    %22
                    la16(fad) la(fad) la(fad) la(fad) fad8 fad fad fad
                    \stemDown <sol mi>-.\p (<sol mi>-. <sol mi>-. <sol mi>-.) <sol mi>-.(<sol mi>-. <sol mi>-. <sol mi>-.)
                    \stemUp mi\f mi mi mi sol sol sol sol

                    %25
                    mi mi mi mi sol sol sol sol
                    \stemDown <fad re>-.\p(<fad re>-. <fad re>-. <fad re>-.) <fad re>-.(<fad re>-. <fad re>-. <fad re>-.)
                }\\{
                    \stemDown re16(si) re(si) re(si) re(si) red(si) red(si) red(si) red(si)
                    si8 si si si red16(si) red(si) red(si) red(si)
                    s1
                    dod16(la) dod(la) dod(la) dod(la) mi'(la,)  mi'(la,)  mi'(la,)  mi'(la,)
                    dod(la) dod(la) dod(la) dod(la) mi'(la,)  mi'(la,)  mi'(la,)  mi'(la,)
                }
            >>
        }

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
            \key si\minor <<
                {
                    fad'2 fad
                    la16(fad) la(fad) la(fad) la(fad) fad2
                    sol8-. (sol-. sol-. sol-. sol-. sol-. sol-. sol-.)
                    mi2 sol
                    mi sol
                    fad8\p-. (fad-. fad-. fad-. fad-. fad-. fad-. fad-.)
                }\\{
                    re16\f(si) re(si) re(si) re(si) red(si) red(si) red(si) red(si)
                    si2 red16(si) red(si) red(si) red(si)
                    mi2 mi
                    dod16(la) dod(la) dod(la) dod(la) mi'(la,)  mi'(la,)  mi'(la,)  mi'(la,)
                    dod16(la) dod(la) dod(la) dod(la) mi'(la,)  mi'(la,)  mi'(la,)  mi'(la,)
                    re2 re
                }
            >>
        }
    >>

    fad8\f mi16 re si8 fad \once\stemUp si, fad'' re si

    %28
    dod8 re16 dod re8 mid, \once\stemUp dod sold'' si sold
    la dod,16 si la8 fad \once\stemUp la, fad'' la fad\mbreak
    si,, re'16 dod si8 fad \once\stemUp si, fad'' si fad

    %31
    \once\stemUp dod, sold''16 la si8 sold si, sold' si sold
    la16 \repeat unfold 15 {fad}
    \repeat unfold 16 {fad}

    %34
    \repeat unfold 12 {fad} mid mid mid mid
    fad4 r <fad dod fad,>8.\p[sold16 la8 sold]
    <fad dod fad,>8.[sold16 la8 sold] fad dod la[fad]

    %37
    <fad' dod fad,>8.[sold16 la8 sold]\mbreak  <fad dod fad,>8.[sold16 la8 sold]
    fad sold la si dod4 r16 fad, la sold
    sold?4\parentSlur  (fad16) dod-. re-. mi-. re8 dod r16 fad la sold

    %40
    sold?4(fad16) la, \parenthesize -. si\parenthesize -. dod\parenthesize -. si8 la\mbreak fad'32(sold la sold fad16) r
    fad32(sold la sold fad16) r fad32(sold la sold fad16) r fad32(sold la sold fad16) r fad32(sold la sold fad16) r
    fad8 re dod16 si la sold\mbreak fad8 dod''4 dod,8

    %43
    dod si'4 dod,8 dod dod'4 dod,8
    dod si'4 dod,8 <<
        {
            \stemNeutral fad,16 dod' la' dod, fad, dod' la' dod,
            la' si la sold fad sold fad mi mi, re' sold re mi, re' sold re

            %46
            sold la sold fad mi fad mi re re, dod' fad dod re, dod' fad dod
            fad sol! fad mi re mi re dod sol si mi si sol si mi si
            mi fad sol fad mi re dod si fad lad mi' lad, fad lad mi' lad,
        }

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
            \key si\minor <<
                {
                    la'4^\markup\italic "manoiscritto" la
                    \stemNeutral la16 si la sold fad sold fad mi \stemUp sold4 sold
                    \stemNeutral sold16 la sold fad mi fad mi re \stemUp fad4 fad
                    \stemNeutral fad16 sol! fad mi re mi re dod\stemUp mi4 mi
                    \stemNeutral mi16 fad sol fad mi re dod si \stemUp mi8 mi mi mi
                }\\{
                    <dod fad,>2
                    s <re mi,>
                    s <dod re,>
                    s <si sol>
                    s <lad fad>
                }
            >>
        }
    >>

    %49
    <mi' lad,? fad>8 sol fad16 mi re dod \once\stemDown re8 si, \senza \tuplet 3/2 { re16 si'(dod re[dod si)]}
    \tuplet 3/2 {mi, si' (dod re[dod si)] fad si(dod re[dod si)] sol si(dod re[dod si)] re, si'(dod re[dod si)]}\mbreak
    \tuplet 3/2 { mi, si'(dod re[dod si)] fad si(dod re[dod si)] sol si(dod re[dod si)] re, si'(dod re[dod si)] }

    %52
    \tuplet 3/2 { mi, si'(dod re[dod si)] } fad8 lad si4 r16 fad'-.\p re-. dod-.
    dod4(si16-.) la-. sol-. fad-. sol8 fad r16 fad'-. re-. dod-.
    dod4(si16) la-. sol-. fad-. mi8 re r fad'

    %55
    re16-. dod-. si-. sol' sol8(fad16) mi re-. dod-. si-. sol'~sol8( fad16) lad\mbreak
    lad?8 (si16) sol fad mi re dod \tuplet 3/2 { re si(dod re\f[dod si)] re, si'(dod re[dod si)] }
    \tuplet 3/2 { mi, si'(dod re[dod si)] fad si(dod re[dod si)] sol si(dod re[dod si)] re, si'(dod re[dod si)] }\mbreak

    %58
    \tuplet 3/2 { mi, si'(dod re[dod si)] } fad8 lad si,2\fermata

}

IVvlIIn = \relative do'' {

    si8
    <<
        {
            si si si si \stemDown <si fad> <si fad> <si fad> <si fad>
            \stemUp si si si si \stemDown <si fad> <si fad> <si fad> <si fad>
            \stemUp fad' fad fad fad \stemDown <fad re> <fad re> <fad re> <fad re>

            %4
            \stemUp fad fad fad fad \stemDown <fad re> <fad re> <fad re> <fad re>
            \stemUp si16(fad) si (fad) si16(fad) si (fad) \stemDown <sol mi>8 <sol mi> <sol mi> <sol mi>
            \stemUp la16\parentSlur(mi) la\parentSlur(mi) la\parentSlur(mi) la\parentSlur(mi) \stemDown <fad re>8 <fad re> <fad re> <fad re>
        }\\{
            fad,16(re) fad(re) fad(re) fad(re) s2
            fad16(re) fad(re) fad(re) fad(re) s2
            re'16(si) re(si) re(si) re(si) s2
            re16(si) re(si) re(si) re(si) s2
            re8 re re re s2
            dod8 dod dod dod
        }
    >>

    %7
    fad,8 re'4 fad,8 fad dod'4 fad,8
    fad8 re'4 fad,8 fad dod'4 fad,8
    fad re'4 fad,8 fad4\fermata r

    %10
    <si fad si,>8.\p[dod16 re8 dod] <si fad si,>8.[dod16 re8 dod]
    si fad re si <si' fad si,>8.[dod16 re8 dod]
    <si fad si,>8.\p[dod16 re8 dod] si8-. dod-. re-. mi-.

    %13
    fad4 r16 fad-. re-. dod-. dod4(si16) la sol fad
    \grace fad8 sol fad r16 fad'-. re-. dod-. dod4(si16-.) la-. sol-. fad-.
    mi8 re r fad' re16-. dod-. si-. sol' sol8(fad16) mi

    %16
    re-. dod-. si-. sol' sol8(fad16) lad lad8(si16) sol fad-. mi-. re-. dod-.\mbreak
    re dod si8 si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
    si32(dod re dod si16) r si32(dod re dod si16) r\mbreak si8 sol' fad16-. mi-. re-. dod-.

    %19
    si4 si'32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
    si32(dod re dod si16) r si32(dod re dod si16) r si8 sol fad16-. mi-. re-. dod-.
    <<
        {
            fad8\f fad fad fad fad fad fad fad

            %22
            la16(fad) la(fad) la(fad) la(fad) fad8 fad fad fad
            \stemDown <sol mi>-.\p (<sol mi>-. <sol mi>-. <sol mi>-.) <sol mi>-.(<sol mi>-. <sol mi>-. <sol mi>-.)
            \stemUp mi\f mi mi mi sol sol sol sol

            %25
            mi mi mi mi sol sol sol sol
            \stemDown <fad re>-.\p(<fad re>-. <fad re>-. <fad re>-.) <fad re>-.(<fad re>-. <fad re>-. <fad re>-.)
        }\\{
            \stemDown re16(si) re(si) re(si) re(si) red(si) red(si) red(si) red(si)
            si8 si si si red16(si) red(si) red(si) red(si)
            s1
            dod16(la) dod(la) dod(la) dod(la) mi'(la,)  mi'(la,)  mi'(la,)  mi'(la,)
            dod(la) dod(la) dod(la) dod(la) mi'(la,)  mi'(la,)  mi'(la,)  mi'(la,)
        }
    >>
    fad'8\f mi16 re si8 fad \once\stemUp si, fad'' re si

    %28
    dod8 re16 dod re8 mid, \once\stemUp dod sold'' si sold
    la dod,16 si la8 fad \once\stemUp la, fad'' la fad\mbreak
    si,, re'16 dod si8 fad \once\stemUp si, fad'' si fad

    %31
    \once\stemUp dod, sold''16 la si8 sold si, sold' si sold
    la16 \repeat unfold 15 {fad}
    \repeat unfold 16 {fad}

    %34
    \repeat unfold 12 {fad} mid mid mid mid
    fad4 r <fad dod fad,>8.\p[sold16 la8 sold]
    <fad dod fad,>8.[sold16 la8 sold] fad dod la[fad]

    %37
    <fad' dod fad,>8.[sold16 la8 sold]\mbreak  <fad dod fad,>8.[sold16 la8 sold]
    fad sold la si dod4 r16 fad, la sold
    sold?4\parentSlur  (fad16) dod-. re-. mi-. re8 dod r16 fad la sold

    %40
    sold?4(fad16) la, \parenthesize -. si\parenthesize -. dod\parenthesize -. si8 la\mbreak fad'32(sold la sold fad16) r
    fad32(sold la sold fad16) r fad32(sold la sold fad16) r fad32(sold la sold fad16) r fad32(sold la sold fad16) r
    fad8 re dod16 si la sold fad8 la'4 dod,8

    %43
    dod sold'4 dod,8 dod la'4 dod,8
    dod sold'4 dod,8  fad,16 dod' la' dod, fad, dod' la' dod,
    la' si la sold fad sold fad mi mi, re' sold re mi, re' sold re

    %46
    sold la sold fad mi fad mi re re, dod' fad dod re, dod' fad dod
    fad sol! fad mi re mi re dod sol si mi si sol si mi si
    mi fad sol fad mi re dod si fad lad mi' lad, fad lad mi' lad,

    %49
    <mi' lad,? fad>8 sol fad16 mi re dod \once\stemDown re8 si, \senza \tuplet 3/2 { re16 si'(dod re[dod si)]}
    \tuplet 3/2 {mi, si' (dod re[dod si)] fad si(dod re[dod si)] sol si(dod re[dod si)] re, si'(dod re[dod si)]}\mbreak
    \tuplet 3/2 { mi, si'(dod re[dod si)] fad si(dod re[dod si)] sol si(dod re[dod si)] re, si'(dod re[dod si)] }

    %52
    \tuplet 3/2 { mi, si'(dod re[dod si)] } fad8 lad si4 r16 fad'-.\p re-. dod-.
    dod4(si16-.) la-. sol-. fad-. sol8 fad r16 fad'-. re-. dod-.
    dod4(si16) la-. sol-. fad-. mi8 re r fad'

    %55
    re16-. dod-. si-. sol' sol8(fad16) mi re-. dod-. si-. sol'~sol8( fad16) lad\mbreak
    lad?8 (si16) sol fad mi re dod \tuplet 3/2 { re si(dod re\f[dod si)] re, si'(dod re[dod si)] }
    \tuplet 3/2 { mi, si'(dod re[dod si)] fad si(dod re[dod si)] sol si(dod re[dod si)] re, si'(dod re[dod si)] }\mbreak

    %58
    \tuplet 3/2 { mi, si'(dod re[dod si)] } fad8 lad si,2\fermata

}

IVvlan = \relative do' {
   
   r8
   re re re re re r re r
   re re re re re r re r
   re re re re re r re r
   
   %4 
   fad fad fad fad fad r fad r
   fad fad fad re si' si si sol
   mi mi mi dod la' la la la
   
   %7
   si16 re si re si re si re lad dod lad dod lad dod lad dod\mbreak
   si16 re si re si re si re lad dod lad dod lad dod lad dod
   si re si re si re si re fad,4\fermata r
   
   %10
   re\p r8 fad re4 r8 fad
   si fad re si\mbreak re4 r8 fad
   re4 r8 fad re mi fad sol
   
   %13
   lad,4 r8 fad' fad fad fad re
   mi re re fad fad fad fad re
   sol, sol fad re' fad fad dod dod
   
   %16
   fad fad mi re\mbreak dod dod lad lad
   fad4 fad'8 fad sol sol lad,[lad]
   si si fad'[fad] sol sol lad, lad
   
   %19
   fad fad' fad fad sol sol lad, lad
   si si fad' fad sol sol lad, lad\mbreak
   fad\f fad' fad fad fad fad fad fad
   
   %22
   red red red red red red red red
   si\p si' si si si si si mi,
   mi\f mi mi mi mi mi mi mi
   
   %25
   mi mi mi mi dod dod dod dod
   la la'\p la la la la la la
   re,?16\f \repeat unfold 15 {re}
   
   %28
   \repeat unfold 16 {sold}
   dod, \repeat unfold 15{dod}\mbreak
   \repeat unfold 16 {fad}
   
   %31
   \repeat unfold 16 {mid}
   \repeat unfold 8{la} si si si si dod dod dod dod
   mi mi mi mi la, la la la\mbreak si si si si dod dod dod dod
   
   %34
   re re re re la la la la si si si si sold sold sold sold
   la4 r dod,\p r8 mid
   dod4 r8 mid dod dod' la fad
   
   %37
   dod4 r8 mid dod4 r8 mid\mbreak
   dod4 r8 \parenthesize fad mid dod dod dod
   dod dod dod si' si la la dod,
   
   %40
   dod dod dod si' si la dod,[dod]
   re re mid[mid] fad fad dod[dod]
   re re mid[mid] fad16 la fad la fad la fad la
   
   %43
   mid sold mid sold mid sold mid sold fad la fad la fad la fad la
   mid sold mid sold mid sold mid sold la8 si dod la
   fad mi fad re si' la si sold
   
   %46
   mi re mi dod la' sol? la fad\mbreak
   re dod re si si' la si sol
   si la si sol dod, si dod si
   
   %49
   dod4. lad8 fad4 re'8 re
   mi4 fad sol re
   mi fad sol re
   
   %52
   mi fad re8 fad\p fad fad
   fad fad fad fad\mbreak mi re re fad
   fad fad fad dod fad, fad fad re'
   
   %55
   fad fad dod dod fad fad mi re
   dod dod lad lad fad\parenthesize \f fad re' re
   mi mi fad fad sol sol re re
   
   %58
   mi mi fad fad si,2\fermata
   
}


IVbcn = \relative do {
   
   r8
   si si si si si16 re fad re si re fad re
   si8 si si si si16 re fad re si re fad re
   si8 si si si \mbreak si16 re fad re si re fad re
   
   %4
   si8 si si si si16 re fad re si re fad re
   si8 si si si mi16 sol si sol mi sol si sol
   la,8 la la la re16 fad la fad re fad la fad\mbreak
   
   %7
   fad si fad si fad si fad si fad lad fad lad fad lad fad lad
   fad si fad si fad si fad si fad lad fad lad fad lad fad lad
   fad si fad si fad si fad si fad4\fermata r
   
   %10
   si,4\p r8 fad' si,4 r8 fad'
   si fad re si si4 r8 fad'
   si,4 r8 fad' si,4 la8 sol
   
   %13
   fad4 r8 si si si si si
   si si si si\mbreak si si si si 
   si si si si si si lad lad
   
   %16
   si si si si fad' fad fad fad
   si,4 re8 re mi[mi] fad fad
   sol sol re[re] mi mi fad[fad]\mbreak
   
   %19
   si,4 re8 re mi[mi] fad fad
   sol sol re re mi mi fad[fad]
   si,\f si si si si si si si
   
   %22
   si si si si si si si si
   mi\p mi mi mi \mbreak mi mi mi mi
   la,\f la la la la la la la
   
   %25
   la la la la la la la la
   re\p re re re re re re re
   si16\f si si si si si si si\mbreak si si si si si si si si
   
   %28
   mid, mid mid mid mid mid mid mid mid mid mid mid mid mid mid mid
   \repeat unfold 16 {fad}
   \repeat unfold 16 {si}
   
   %31
   \repeat unfold 16 {dod}
   fad, fad fad fad fad' fad fad fad\mbreak sold sold sold sold la la la la
   si si si si fad fad fad fad sold sold sold sold la la la la
   
   %34
   si si si si fad fad fad fad sold sold sold sold dod, dod dod dod\mbreak
   fad,4 r fad'\p r8 dod
   fad4 r8 dod fad8 dod' la fad
   
   %37
   fad4 r8 dod fad4 r8 dod
   fad4 mi8 re dod mid fad fad
   fad fad fad fad fad fad fad fad\mbreak
   
   %40
   fad fad fad fad fad fad, la la
   si si dod dod re re la la
   si si dod dod dod16 fad dod fad dod fad dod fad
   
   %43
   dod mid dod mid dod mid dod mid dod fad dod fad dod fad dod fad 
   dod mid dod mid dod mid dod mid fad mid fad sold la sold la fad
   si,8 dod re si mi16 re mi fad sold fad sold mi
   
   %46
   la,8 si dod la re16 dod re mi\mbreak fad mi fad re
   sol,?8 la si sol mi'16 re mi fad sol la sol fad
   mi8 fad sol mi fad sold lad sold
   
   %49
   fad mi lad,[fad'] si,4 re8 re
   mi mi fad fad\mbreak sol sol re re
   mi mi fad fad sol sol re re
   
   %52
   mi mi fad fad si,\p si si si
   si si si si si si si si
   si si si lad si si si si\mbreak
   
   %55
   si si lad lad si si si si
   fad' fad fad fad si,\f si re re
   mi mi fad fad sol sol re re
   
   %58
   mi mi fad fad si,2\fermata
   
}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key si\minor
    \tempo 2 = 53
    \partial 8 s8
    s1*58
    \bar"||"

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


IVvla = {
    \global
    \clef alto
    <<\IVvlan \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con
}

VvlIn = \relative do'' {
    
    fad8. la32\parentSlur ( sold) fad8 dod \grace dod re dod r dod
    fad8. la32 \parentSlur (sold) fad8 la, si\parenthesize \trill  la r dod
    \tuplet 3/2 {fad16(sold la) sold[(la si)] } la8 sold\mbreak la16 fad8.~fad8[dod]
    
    %4
    la'16 fad8.~fad8[dod] \tuplet 3/2 {fad16(sold la) sold[(la si)] } la8 sid, 
    sid?(dod) r4 dod'8 dod32(si? lad sold) fad8 mi
    re lad'4(si16) r si8 si32 (la? sold fad) mi8 re\mbreak
    
    %7
    dod sold'4\parentSlur(la16) r la-.[(sold-. fad-. mi-. re-. dod-. si-. la-.)]
    mi4 si'8. dod32(re) dod4 si8. dod32(re)
    dod16 la' la8 r16 sol32(fad sol16) mi fad si si8 r16 la32(sold? la16) fad
    
    %10 OOKK
    sold8\noBeam si32(sold16.) si32[(mi,16.)] si'32(re,16.)dod32(la16.) red32[(mi16.)] sold32(la16.) dod,32[(red16.)]
    <mi si mi,>8 r32 fad mi re? dod8 si <mi si mi,>8\noBeam r32 fad mi re dod8 si
    dod8\noBeam la'16-.(la-. sold-. sold-. fad-. fad-.) mi-. (mi-. si'-. si-.) re,-.(re-. si-. si-.)
    
    %13
    dod32\f mi re dod si la sold fad mi16 la re, mi <la mi la,>4 r
    fad'8.\parenthesize \p la32 ( sold) fad8 dod \grace dod re dod r dod
    fad8. la32 sold fad8 la, si \trill  la r la
    
    %16
    sol'2\parentSlur ( sol8)[fad16(mi) re(dod) si(lad)]\mbreak
    lad8(si) r si la'?2~
    la8[sold?16(fad) mi(red) dod(sid)] sid4(dod)
    
    %19
    dod16 si'-. la-. sold-. la8 dod, re16 la'-. sold-. fad-. sold8 sid,
    dod16 fad-. sold-. la-. r si,?-. dod-. re-. mid,4. sold8(\mbreak
    si) mid(sold)[si] la sol4.
    
    %22
    \appoggiatura si8 mid,2 \appoggiatura sold?8 fad2
    fad16 la-.(sold-. fad-.)  la, la'-.(sold-. fad-.) si, la'-.(sold-. fad-.) dod la'-.(sold-. fad-.) 
    re la'-.(sold-. fad-.)  la, la'-.(sold-. fad-.)\mbreak  si,8 fad'16. sold32 sold4\tr 
    
    %25
    fad32(sold la sold) fad[(sold la sold)] fad(sold la sold) fad[(sold la sold)] fad16 dod la  fad la,8 si
    dod16 dod' la fad si,8 dod fad2\fermata
    
}

VvlIIn = \relative do'' {
   
   fad8. la32\parentSlur ( sold) fad8 dod \grace dod re dod r dod
    fad8. la32 \parentSlur (sold) fad8 la, si\parenthesize \trill  la r dod
    \tuplet 3/2 {fad16(sold la) sold[(la si)] } la8 sold\mbreak la16 fad8.~fad8[dod]
    
    %4
    la'16 fad8.~fad8[dod] \tuplet 3/2 {fad16(sold la) sold[(la si)] } la8 sid, 
    sid?(dod) r4 dod'8 dod32(si? lad sold) fad8 mi
    re lad'4(si16) r si8 si32 (la? sold fad) mi8 re\mbreak
    
    %7
    dod sold'4\parentSlur(la16) r la-.[(sold-. fad-. mi-. re-. dod-. si-. la-.)]
    mi4 si'8. dod32(re) dod4 si8. dod32(re)
    dod16 la' la8 r16 sol32(fad sol16) mi fad si si8 r16 la32(sold? la16) fad
    
    %10 OOKK
    sold8\noBeam si32(sold16.) si32[(mi,16.)] si'32(re,16.)dod32(la16.) red32[(mi16.)] sold32(la16.) dod,32[(red16.)]
    <mi si mi,>8 r32 fad mi re? dod8 si <mi si mi,>8\noBeam r32 fad mi re dod8 si
    dod8\noBeam la'16-.(la-. sold-. sold-. fad-. fad-.) mi-. (mi-. si'-. si-.) re,-.(re-. si-. si-.)
    
    %13
    dod32\f mi re dod si la sold fad mi16 la re, mi <la mi la,>4 r
    fad'8.\p la32 ( sold) fad8 dod \grace dod re dod r dod
    fad8. la32 sold fad8 la, si \trill  la r la
    
    %16
    sol'2~sol8[fad16(mi) re(dod) si(lad)]\mbreak
    lad8(si) r si la'?2~
    la8[sold?16(fad) mi(red) dod(sid)] sid4(dod)
    
    %19
    dod16 si'-. la-. sold-. la8 dod, re16 la'-. sold-. fad-. sold8 sid,
    dod16 fad-. sold-. la-. r si,?-. dod-. re-. mid,4. sold8(\mbreak
    \parenthesize si) mid(sold)[si] la sol4.
    
    %22
    \appoggiatura si8 mid,2 \appoggiatura sold?8 fad2
    fad16 la-.(sold-. fad-.)  la, la'-.(sold-. fad-.) si, la'-.(sold-. fad-.) dod la'-.(sold-. fad-.) 
    re la'-.(sold-. fad-.)  la, la'-.(sold-. fad-.)\mbreak  si,8 fad'16. sold32 sold4\tr 
    
    %25
    fad32(sold la sold) fad[(sold la sold)] fad(sold la sold) fad[(sold la sold)] fad16 dod la  fad la,8 si
    dod16 dod' la fad si,8 dod fad2\fermata

}

Vvlan = \relative do' {
   
   la'8\p la la la si la la la
   la la la dod, re dod la' la
   la mid mid mid dod dod dod la\mbreak
   
   %4
   dod dod dod la dod mid dod red
   sold, sold dod dod fad fad dod dod
   fad fad fad fad mi mi si si
   
   %7
   mi mi mi mi dod re mi fad\mbreak
   si, si sold' si la la sold si
   la mi mi mi la, fad' fad fad
   
   %10
   si, si sold' sold la fad si la
   sold sold la sold sold sold la sold
   mi dod' si la\mbreak si sold si mi,
   
   %13
   mi32\f mi' re dod si la sold fad mi16 la \parenthesize re, \parenthesize mi la,8 dod'\p si sold
   la la la la si la la la
   la la la dod, re dod dod dod\mbreak
   
   %16
   dod' dod dod dod mi, mi mi mi
   re re re re red' red red red
   fad, fad fad fad mid mid mid mid
   
   %19
   mid? mid dod fad fad fad mi? mi\mbreak
   mi mi fad fad sold, sold si si
   mid mid mid mid dod re re re
   
   %22
   dod dod dod dod dod dod dod dod
   dod dod la' la si si dod dod 
   re re la la\mbreak si si dod dod
   
   %25
   fad,16 dod fad[dod] fad dod fad[dod] fad dod' la fad la,8 si
   dod16 dod' la fad si,8 dod fad,2\fermata
   
}


Vbcn = \relative do {
   
   fad8^\p_\markup\italic "Senza Cembalo" fad fad fad fad fad fad fad
   fad fad fad fad fad fad fad fad
   fad dod dod dod fad fad fad fad
   
   %4
   fad fad fad fad fad dod fad fad
   mid mid fad\f fad lad,  lad lad lad
   si si si si sold sold sold sold\mbreak
   
   %7
   la? la la la la si dod red
   mi mi mi mi mi mi mi mi
   la, la dod dod re red red red
   
   %10
   mi mi mi mi mi mi mi mi
   mi mi mi mi mi mi mi mi
   la, la la la sold sold sold sold
   
   %13
   la32 \f mi'' re dod si la sold fad mi16 la re, mi\mbreak la,8 la'\p sold mid
   fad fad fad fad fad fad fad fad
   fad fad fad fad fad fad fad fad
   
   %16
   lad, lad lad lad lad lad fad' fad\mbreak
   si, si si si sid sid sid sid
   sid? sid sold' sold dod, dod dod dod
   
   %19
   dod dod fad fad si, si mi mi
   la, la re re dod dod dod dod
   dod dod dod dod fad si, si si
   
   %22
   si si si si la la la la
   la la la' la si si dod dod
   re re la la si si dod dod\mbreak
   
   %25
   fad,16 dod fad[dod] fad dod fad[dod] fad dod' la fad la,8 si
   dod16 dod' la fad si,8 dod fad,2\fermata
   
}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key la\major
    \tempo 4=60
    s1*26
    \bar"||"

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIvlIn = \relative do'' {

    si16 fad re fad si dod
    re8 re dod
    si16 fad re fad si dod

    %4
    mi,8 mi fad
    re si si
    re'16 la fad la re mi\mbreak

    %7
    fad re la re fad sold
    la8 dod, re
    sol, fad fad

    %10
    re'16 la fad la re mi
    fad re la re fad sold
    la8 la, dod

    %13
    re4.
    \senza \tuplet 3/2 { red16(mi fad) } si,4
    \tuplet 3/2 { red16(mi fad) } si,4

    %16
    \tuplet 3/2 { red16(mi fad) } la,8 [fad]
    sol mi mi
    mi16 sol si re sol [si]

    %19
    lad,8 fad fad
    \tuplet 3/2 { mi16 (fad sol) } fad4
    \tuplet 3/2 { mi16 (fad sol) } fad4

    %22
    si16 fad re fad si dod
    re8 re dod
    si16 fad si re fad si\mbreak

    %25
    sol8 fad r
    \tuplet 3/2 { si16(la sol) } fad4
    re16 si fad si re fad

    %28
    si8 re, dod
    si4.\fermata

}

VIvlIIn = \relative do'' {

    si16 fad re fad si dod
    re8 re dod
    si16 fad re fad si dod

    %4
    mi,8 mi fad
    re si si
    re'16 la fad la re mi\mbreak

    %7
    fad re la re fad sold
    la8 dod, re
    sol, fad fad

    %10
    re'16 la fad la re mi
    fad re la re fad sold
    la8 la, dod

    %13
    re4.
    \senza \tuplet 3/2 { si16(dod red) } fad,4
    \tuplet 3/2 { si16(dod red) } fad,4

    %16
    \tuplet 3/2 { si16(dod red) } fad,8[red]
    mi si si
    si16 mi sol si mi [sol]

    %19
    dod,8 fad, fad
    dod dod dod
    dod dod dod

    %22
    si'16 fad re fad si dod
    re8 re dod
    si16 fad si re fad si\mbreak

    %25
    sol8 fad r
    \tuplet 3/2 { si16(la sol) } fad4
    re16 si fad si re fad

    %28
    si8 si, lad
    si4.\fermata

}

VIvlan = \relative do' {

    re8 re re
    fad si lad
    fad re re
    dod dod lad

    %5
    fad fad fad
    fad' fad fad
    fad fad fad

    %8
    mi dod la?
    la la la
    fad' fad fad

    %11
    fad fad fad
    mi mi mi
    fad4.

    %14
    fad8 red red
    fad red red
    fad red red\mbreak

    %17
    si sol sol
    sol sol' sol
    mi lad, lad

    %20
    fad fad fad
    fad fad fad
    re' re re

    %23
    fad si lad
    re, re re
    si si r\mbreak

    %26
    re re re
    fad fad fad
    fad fad fad

    %29
    re4.\fermata

}


VIbcn = \relative do {

    si8 si si
    si fad' fad,
    si si si

    %4
    lad fad' fad,
    si si16 la? si dod\mbreak
    re8 re re

    %7
    re re re
    dod la re
    dod re16 mi fad mi

    %10
    re8 re re
    re re re
    re la' la,

    %13
    re4.\mbreak
    si8 si si
    si si si

    %16
    si si si
    mi mi mi
    mi mi mi

    %19
    fad fad fad
    lad, lad lad
    lad? lad lad

    %22
    si si si\mbreak
    si fad' fad,
    si si si

    %25
    si' si, r
    si si si
    si si si

    %28
    si fad' fad,
    si4.\fermata

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/8
    \key re\major
    \tempo 4. = 75
    s4.*13
    \bar":..:"\break
    s4.*16
    \bar ":|."

}



VIvlI = {
    \global
    %\notypeset
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
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
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
        title = \markup\smaller{Sinfonia per archi RV 147}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] Largo }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"Violino I."\super o}
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"Violino 2."\super o}
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
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
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    %\pageBreak

    \markup \huge {[2.] Andante }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    %\pageBreak

    \markup \huge {[3.] Presto }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

        %systems-per-page = #4

    }

    \header {
        title = \markup\smaller{Sinfonia per archi RV 168}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"Violino I."\super mo}
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"Violino 2."\super do}
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \IVbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

    \pageBreak

    \markup \huge {[2.] Andante }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \VvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \Vbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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

   % \pageBreak

    \markup \huge {[3.] Allegro }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \VIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \VIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \VIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
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