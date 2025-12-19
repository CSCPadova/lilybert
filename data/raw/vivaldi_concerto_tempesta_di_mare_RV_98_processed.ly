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
		\terzine \con

			}

Ifln = \relative do'' {

    fa,16[sol la sib do re mi fa] fa,8 fa fa fa
    fa16[sol la sib do re mi fa] fa,8 fa fa fa
    do'16[re mi fa sol la sib do] do,8 do do do

    %4
    do16[re mi fa sol la sib do] do,8 do do do
    do[do'16 sib la sol fa mib] re[re re re re re re re]
    re8[sib'16 la sol fa mi? re] do[do do do do do do do]

    %7
    do8[la'16 sol fa mi re do] sib[sib sib sib sib sib sib sib]
    sib8[sol'16 fa mi re do sib] la4 r
    sib'16 sol sib sol \parenthesize la\parenthesize  fa \parenthesize la \parenthesize fa sol mi sol mi la fa la fa

    %10
    sib sol sib sol la fa la fa sol mi sol mi la fa la fa
    sib sol sib sol la fa la fa sol[do sib la sol fa mi re]
    do8 do do do do'[sib16 la sol fa mi re]

    %13
    do8 do do do do'16 la do la do la do la
    do sol do sol do sol do sol do sol do sol do sol do sol
    fa8[mi16 re do sib la sol] fa8 fa fa fa

    %16
    fa4 r fa'16\solo la fa sol do, la' fa la
    do, la' fa la do, la' fa la do, sol' mi sol do, sol' mi sol
    do, sol' mi sol do, sol' mi sol do, la' fa la do, la' fa la

    %19
    do, la' fa la do, la' fa la sol8  \parenthesize do, \parenthesize r4
    \parenthesize la16 \parenthesize fa'\parenthesize do\parenthesize fa\parenthesize la, \parenthesize fa'\parenthesize do\parenthesize fa\parenthesize la,\parenthesize fa'\parenthesize do fa la, fa' do fa
    sib, fa' re fa sib, fa' re fa sib, fa' re fa sib, fa' re fa

    %22
    si, sol' re sol si, sol' re sol si, sol' re sol si, sol' re sol
    do, sol' mi sol do, sol' mi sol do, sol' mi sol do, sol' mi sol
    dod, la' mi la dod, la' mi la dod, la' mi la dod, la' mi la

    %25
    re, la' fa la re, la' fa la re, la' fa la re, la' fa la
    re, sib' fa sib re, sib' fa sib re, sib' fa sib re, sib' fa sib
    mi,8 do r4 r2

    %28
    fa16 do fa la fa do fa la re,[sib sib sib sib sib sib sib]
    sol' re sol sib sol re sol sib mi,[do do do do do do do]
    la' mi la do la mi la do fa,[re re re re re re re]\mbreak

    %31
    si' fa si re si fa si re mi, sol do sol mi sol do sol
    re sol do sol re sol do sol re sol si sol re sol si sol
    do[si la sol fa mi re do] do'[si la sol fa mi re do]

    %34
    do16[re mi fa sol la si do] do,8 do do do
    do16[re mi fa sol la si do] do,8 do do do
    sol16 la si do re mi fa sol sol,8 sol sol sol

    %37
    sol16 la si do re mi fa sol sol,8 sol sol sol
    fa'16 re fa re mi do mi do re si re si mi do mi do
    fa re fa re mi do mi do si4 r

    %40
    fa'4 r fa\parenthesize r
    \parenthesize do'16 \repeat unfold 12 {\parenthesize do} do do do
    si?[si si si si si si si] do4 sol

    %43
    sol sol fa fa
    fad fad sol sol
    sold sold la la

    %46
    si la sold la
    si la sold la
    la sold la16 mi la do la mi la do

    %49
    la8 la la la sol? sol sol sol
    mi16 do mi sol mi do mi sol la8 la la la
    fa fa sib sib sol16 mi sol sib sol mi sol sib \mbreak

    %52
    la fa la  do la fa la do sol mi sol sib sol mi sol sib
    la fa la  do la fa la do sol mi sol sib sol mi sol sib
    \once\stemDown la8 fa, fa fa fa16 sol la sib do re mi fa

    %55
    fa,8 fa fa fa fa16 sol la sib do re mi fa
    do8 do do do do16[re mi fa sol la sib do]
    do,8 do do do do16[re mi fa sol la sib do]

    %58
    sib sol sib sol la fa la fa sol mi sol mi la fa la fa
    sib sol sib sol la fa la fa sol mi sol mi la fa la fa
    sib sol sib sol la fa la fa sol [do sib la sol fa mi re]

    %61
    do8 do do do do'[sib16 la sol fa mi re]
    do8 do do do sol'16 do do sol sol do do mi,
    mi sol sol mi mi sol sol do, do mi mi sib sib mi mi sol,

    %64
    sol4 r r2\mbreak
    do'16 sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do
    \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do8 do do do

    %67
    do4 r r2\fermata

}

Iobn = \relative do'' {

    fa,16[sol la sib do re mi fa] fa,8 fa fa fa
    fa16[sol la sib do re mi fa] fa,8 fa fa fa
    do16[re mi fa sol la sib do] do,8 do do do

    %4
    do16[re mi fa sol la sib do] do,8 do do do
    fa4 r re'16[re re re re re re re]
    re4 r do16[do do do do do do do]

    %7
    do4 r sib16[sib sib sib sib sib sib sib]
    sib4 r fa16[fa fa fa fa fa fa fa]
    sol'16 mi sol mi \parenthesize fa\parenthesize do \parenthesize fa \parenthesize do mi do mi do fa do fa do

    %10
    sol' mi sol mi fa do fa do mi do mi do fa do fa do
    sol' mi sol mi fa do fa do mi[do sib la sol fa mi re]
    do8 do do do do'[sib16 la sol fa mi re]

    %13
    do8 do do do la''16 fa la fa la fa la fa
    sol fa sol fa sol fa sol fa sol mi sol mi sol mi sol mi
    fa8[mi16 re do sib la sol] fa8 fa fa fa

    %16
    fa4 r do'16\solo fa do fa la, fa' do fa
    la, fa' do fa la, fa' do fa mi mi do mi sol, mi' do mi
    sol, mi' do mi sol, mi' do mi fa fa do fa la, fa' do fa

    %19
    la, fa' do fa la, fa' do fa \parenthesize mi4 \parenthesize r
    \parenthesize  fa,16 \parenthesize do' \parenthesize la \parenthesize do  \parenthesize  fa, \parenthesize do' \parenthesize la \parenthesize do \parenthesize  fa, \parenthesize do' \parenthesize la \parenthesize do \parenthesize fa, do' la do
    fa, re' sib re fa, re' sib re fa, re' sib re fa, re' sib re

    %22
    sol, re' si re sol, re' si re sol, re' si re sol, re' si re
    sol, mi' do mi sol, mi' do mi sol, mi' do mi sol, mi' do mi
    la, mi' dod mi la, mi' dod mi la, mi' dod mi la, mi' dod mi

    %25
    la, fa' re fa la, fa' re fa la, fa' re fa la, fa' re fa
    sib, fa' re fa sib, fa' re fa sib, fa' re fa sib, fa' re fa
    do[do do do do do do do] do[do do do do do do do]

    %28
    fa4 r r16 re[re re re re re re]
    re4 r r16 mi[mi mi mi mi mi mi]
    mi4 r r16 fa[fa fa fa fa fa fa]

    %31
    \parenthesize fa4 r sol8 sol sol sol
    sol sol sol sol sol sol sol sol
    sol4 r r2

    %34
    do,,16[re mi fa sol la si do] do,8 do do do
    do16[re mi fa sol la si do] do,8 do do do
    sol'16 la si do re mi fa sol sol,8 sol sol sol

    %37
    sol16 la si do re mi fa sol sol,8 sol sol sol
    re'16 si re si do sol do sol si sol si sol do sol do sol
    re' si re si do sol do sol re'4 r

    %40
    re r re \parenthesize r
    \parenthesize mi16[\parenthesize mi\parenthesize mi\parenthesize mi\parenthesize mi\parenthesize mi\parenthesize mi \parenthesize mi] \parenthesize re16[\parenthesize re\parenthesize re\parenthesize re\parenthesize re\parenthesize re re re]
    re[re re re re re re re] mi4 mi

    %43
    dod dod la la
    la la re re
    si si mi mi

    %46
    re do si do
    re do si do
    si si la r

    %49
    fa'16 re fa la fa re fa la re,8 re re re
    mi mi mi mi fa16 do fa la fa do fa la
    re,8 re fa fa mi16 do mi sol mi do mi sol

    %52
    fa4 r mi16 do mi sol mi do mi sol
    fa4 r mi16 do mi sol mi do mi sol
    fa8 fa, fa fa fa16 sol la sib do re mi fa

    %55
    fa,8 fa fa fa fa16 sol la sib do re mi fa
    do,8 do do do do16[re mi fa sol la sib do]
    do,8 do do do do16[re mi fa sol la sib do]

    %58
    sol'16 mi sol mi fa do fa do mi do mi do fa do fa do
    sol' mi sol mi fa do fa do mi do mi do fa do fa do
    sol' mi sol mi fa do fa do mi do sib la sol fa mi re

    %61
    do8 do do do do'[sib16 la sol fa mi re]
    do8 do do do mi'16 sol sol mi mi sol sol do,
    do mi mi do do mi mi sol, sol do do sol sol do do mi,

    %64
    mi4 r r2
    \parenthesize do'16 \parenthesize sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do
    \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do8\parenthesize do do do

    %67
    do4 r r2\fermata

}

IvlIn = \relative do'' {

    fa,16[sol la sib do re mi fa] fa,8 fa fa fa
    fa16[sol la sib do re mi fa] fa,8 fa fa fa
    do16[re mi fa sol la sib do] do,8 do do do

    %4
    do16[re mi fa sol la sib do] do,8 do do do
    fa4 r r16 sib'[la sol fa mib re do]
    sib4 r r16 la'[sol fa mi? re do sib]

    %7
    la4 r r16 sol'[fa mi re do sib la]
    sol4 r fa16[fa fa fa fa fa fa fa]
    sol'16 mi sol mi \parenthesize fa\parenthesize do \parenthesize fa \parenthesize do mi do mi do fa do fa do

    %10
    sol' mi sol mi fa do fa do mi do mi do fa do fa do
    sol' mi sol mi fa do fa do mi[do sib la sol fa mi re]
    do8 do do do do'[sib16 la sol fa mi re]

    %13
    do8 do do do fa'16 do fa do fa do fa do
    fa do fa do fa do fa do mi do mi do mi do mi do
    fa8[mi16 re do sib la sol] fa8 fa fa fa

    %16
    fa4 r r2
    R1*2
    r2 sol16 [sol\parenthesize sol\parenthesize sol \parenthesize sol \parenthesize sol \parenthesize sol \parenthesize sol]

    %20
    \parenthesize la4 \parenthesize r \parenthesize r2
    R1*6
    sol16[sol sol sol sol sol sol sol] sol[sol sol sol sol sol sol sol]

    %28
    do4 r r16 fa[fa fa fa fa fa fa]
    sol4 r r16 sol[sol sol sol sol sol sol]
    la4 r r16 la[la la la la la la]

    %31
    si4 r mi,8 mi mi mi
    re re re re re re re re
    mi4 r r2


    %34
    do,16[re mi fa sol la si do] do,8 do do do
    do16[re mi fa sol la si do] do,8 do do do
    sol'16 la si do re mi fa sol sol,8 sol sol sol

    %37
    sol16 la si do re mi fa sol sol,8 sol sol sol
    re'16 si re si do sol do sol si sol si sol do sol do sol
    re' si re si do sol do sol re'4 r

    %40
    re r re \parenthesize r
    \parenthesize mi16[\parenthesize mi\parenthesize mi\parenthesize mi\parenthesize mi\parenthesize mi\parenthesize mi \parenthesize mi] \parenthesize re16[\parenthesize re\parenthesize re\parenthesize re\parenthesize re\parenthesize re re re]
    re[re re re re re re re] <<{mi\solo do sol do mi do sol do

    %43
    mi dod sol dod mi dod sol dod fa la, re, la' fa' la, re, la'
    fad' la, re, la' fad' la, re, la' sol' sib, re, sib' sol' sib, re, sib'
    sold' si, mi, si' sold' si, mi, si' la' do, mi, do'  la' do, mi, do'

    %46
    si' re, mi, re' la' do, mi, do' sold' si, mi, si' la' do, mi, do'
    si' re, mi, re' la' do, mi, do' sold' si, mi, si' la' do, mi, do'
    la' si, mi, si' sold' si, mi, si'}

        \new Staff \with {
           \override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 2) (padding . 0))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"violin" \key fa\major
            <<{mi16^\markup\italic"manoscritto" mi  mi mi mi mi mi mi
               mi mi mi mi mi mi mi mi fa fa fa fa fa fa fa fa
               fad fad fad fad fad fad fad fad sol sol sol sol sol sol sol sol
               sold sold sold sold sold sold sold sold la la la la la la la la
               si si si si la la la la sold sold sold sold la la la la
               si si si si la la la la sold sold sold sold la la la la
               la la la la sold sold sold sold}\\{\stemUp \override Stem #'transparent = ##t do,4 do
                                                  dod dod la la
                                                  la la sib sib
                                                  si si do do
                                                  re do si do
                                                  re do si do
                                                  si si}\\{\stemDown sol sol
                                                           sol sol re re
                                                           re re re re
                                                           mi mi mi mi
                                                           mi mi mi mi
                                                           mi mi mi mi
                                                           mi mi}>> }>> la'4 r

    %49
    r2 sol16 re sol si sol re sol si
    sol8 sol sol sol do, do do do
    re16 sib? re fa re sib re fa mi4 r

    %52
    fa16 do fa la fa do fa la sol4 r
    fa16 do fa la fa do fa la sol4 r
    fa,8 fa fa fa fa16 sol la sib do re mi fa

    %55
    fa,8 fa fa fa fa16 sol la sib do re mi fa
    do,8 do do do do16[re mi fa sol la sib do]
    do,8 do do do do16[re mi fa sol la sib do]

    %58
    sol'16 mi sol mi fa do fa do mi do mi do fa do fa do
    sol' mi sol mi fa do fa do mi do mi do fa do fa do
    sol' mi sol mi fa do fa do mi do sib la sol fa mi re

    %61
    do8 do do do do'[sib16 la sol fa mi re]
    do8 do do do do'16 mi mi do do mi mi sol,
    sol do do sol sol do do mi, mi sol sol mi mi sol sol sib,

    %64
    sib4 r r2
    \parenthesize do'16 \parenthesize sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do
    \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do8\parenthesize do do do

    %67
    do4 r r2\fermata

}

IvlIIn = \relative do'' {

    fa,16[sol la sib do re mi fa] fa,8 fa fa fa
    fa16[sol la sib do re mi fa] fa,8 fa fa fa
    do16[re mi fa sol la sib do] do,8 do do do

    %4
    do16[re mi fa sol la sib do] do,8 do do do
    fa4 r re'16[re re re re re re re]
    re4 r do16[do do do do do do do]

    %7
    do4 r sib16[sib sib sib sib sib sib sib]
    sib4 r fa16[fa fa fa fa fa fa fa]
    sol'16 mi sol mi \parenthesize fa\parenthesize do \parenthesize fa \parenthesize do mi do mi do fa do fa do

    %10
    sol' mi sol mi fa do fa do mi do mi do fa do fa do
    sol' mi sol mi fa do fa do mi[do sib la sol fa mi re]
    do8 do do do do'[sib16 la sol fa mi re]

    %13
    do8 do do do la''16 fa la fa la fa la fa
    sol fa sol fa sol fa sol fa sol mi sol mi sol mi sol mi
    fa8[mi16 re do sib la sol] fa8 fa fa fa

    %16
    fa4 r r2
    R1*10
    do'16 [do do do do do do do] do[do do do do do do do]

    %28
    fa4 r r16 re[re re re re re re]
    re4 r r16 mi[mi mi mi mi mi mi]
    mi4 r r16 fa[fa fa fa fa fa fa]

    %31
    \parenthesize fa4 r sol8 sol sol sol
    sol sol sol sol sol sol sol sol
    sol4 r r2

    %34
    do,,16[re mi fa sol la si do] do,8 do do do
    do16[re mi fa sol la si do] do,8 do do do
    sol'16 la si do re mi fa sol sol,8 sol sol sol

    %37
    sol16 la si do re mi fa sol sol,8 sol sol sol
    re'16 si re si do sol do sol si sol si sol do sol do sol
    re' si re si do sol do sol re'4 r

    %40
    re r re \parenthesize r
    \parenthesize mi16[\parenthesize mi\parenthesize mi\parenthesize mi\parenthesize mi\parenthesize mi\parenthesize mi \parenthesize mi] \parenthesize re16[\parenthesize re\parenthesize re\parenthesize re\parenthesize re\parenthesize re re re]
    re[re re re re re re re] mi4 mi

    %43
    dod dod la la
    la la re re
    si si mi mi

    %46
    re do si do
    re do si do
    si si la r

    %49
    fa'16 re fa la fa re fa la re,8 re re re
    mi mi mi mi fa16 do fa la fa do fa la
    re,8 re fa fa mi16 do mi sol mi do mi sol

    %52
    fa4 r mi16 do mi sol mi do mi sol
    fa4 r mi16 do mi sol mi do mi sol
    fa8 fa, fa fa fa16 sol la sib do re mi fa

    %55
    fa,8 fa fa fa fa16 sol la sib do re mi fa
    do,8 do do do do16[re mi fa sol la sib do]
    do,8 do do do do16[re mi fa sol la sib do]

    %58
    sol'16 mi sol mi fa do fa do mi do mi do fa do fa do
    sol' mi sol mi fa do fa do mi do mi do fa do fa do
    sol' mi sol mi fa do fa do mi do sib la sol fa mi re

    %61
    do8 do do do do'[sib16 la sol fa mi re]
    do8 do do do mi'16 sol sol mi mi sol sol do,
    do mi mi do do mi mi sol, sol do do sol sol do do mi,

    %64
    mi4 r r2
    \parenthesize do'16 \parenthesize sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do
    \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do8\parenthesize do do do

    %67
    do4 r r2\fermata



}

Ivlan = \relative do' {

    r2 fa,16[sol la sib do re mi fa]
    fa,8 fa fa fa fa16[sol la sib do re mi fa]
    do8 do do do do16[re mi fa sol la sib do]

    %4
    do,8 do do do do16 re mi fa sol la sib do
    fa,4 r sib,8 sib sib sib
    sib4 r la8 la la la

    %7
    la4 r sol8 sol sol sol
    sol4 r fa8 fa fa fa
    do' do \parenthesize do \parenthesize do do do do do

    %10
    do do do do do do do do
    do do do do do do do do
    do'[sib16 la sol fa mi re] do8 do do do

    %13
    do'[sib16 la sol fa mi re] do8 do do do
    do do do do do do do do
    fa mi16 re do sib la sol fa8 fa fa fa

    %16
    fa4 r fa fa
    fa fa do' do
    do do fa fa

    %19
    fa fa do16 \parenthesize do \parenthesize do \parenthesize do \parenthesize sib \parenthesize sib \parenthesize sib \parenthesize sib
    \parenthesize la4 \parenthesize r \parenthesize fa'8 \parenthesize fa \parenthesize mib \parenthesize mib
    re4 sib re sib'

    %22
    sol r sol8 sol fa fa
    mi4 do mi do'
    la r la8 la sol sol

    %25
    fa4 re fa re'
    sib r sib sib,
    do16[do do do do do do do] sib[sib sib sib sib sib sib sib]

    %28
    la4 r r16 sib'[la sol fa mib? re do]
    sib4 r r16 do'[sib la sol fa mi? re]
    do4 r r16 re'[do si la sol fa mi]

    %31
    \parenthesize re4 r do8 do do do
    sol' sol sol sol sol, sol sol sol
    do4 r r2

    %34
    do8 do do do do16 re mi fa sol la si do
    do,8 do do do do16 re mi fa sol la si do
    sol,8 sol sol sol sol16[la si do re mi fa sol]

    %37
    sol,8 sol sol sol sol16[la si do re mi fa sol]
    sol,8 sol sol sol sol sol sol sol
    sol sol sol sol sol4 r

    %40
    sol r \parenthesize sol \parenthesize r
    \parenthesize do8 \parenthesize do \parenthesize do \parenthesize do \parenthesize sol' \parenthesize sol \parenthesize sol \parenthesize sol
    sol,8 sol sol sol do4 do

    %43
    la la  re re
    do do sib sib'
    mi, re do la

    %46
    mi' mi mi mi
    mi mi mi mi
    mi mi la,8 la la la

    %49
    re re re re si si si si
    do do do do la la la la
    sib? sib sib sib do do do do

    %52
    \parenthesize do do do do do do do do
    do do do do do do do do
    fa,16[sol la sib do re mi fa] fa,8 fa fa fa

    %55
    fa16[sol la sib do re mi fa] fa,8 fa fa fa
    do'16[re mi fa sol la sib do] do,8 do do do
    do16[re mi fa sol la sib do] do,8 do do do

    %58
    do do do do do do do do
    do do do do do do do do
    do do do do do do do do

    %61
    do'[sib16 la sol fa mi re] do8 do do do
    do'[sib16 la sol fa mi re] do8 do do do
    do do do do do do do do

    %64
    do4 r \parenthesize r2
    \parenthesize do'16 \parenthesize sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do
    \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do8\parenthesize do do do

    %67
    do4 r r2\fermata

}

Ifgn = \relative do {

    r2 fa,16[sol la sib do re mi fa]
    fa,8 fa fa fa fa16[sol la sib do re mi fa]
    do8 do do do do16[re mi fa sol la sib do]

    %4
    do,8 do do do do16 re mi fa sol la sib do
    fa,4 r r16 sib,[do re mib fa sol la]
    sib4 r r16 la,[sib do re mi? fa sol]

    %7
    la4 r r16 sol,[la sib do re mi fa]
    sol4 r fa16[fa fa fa fa fa fa fa]
    do do' do do \parenthesize do, \parenthesize do'\parenthesize do\parenthesize do do, do' do do do, do' do do

    %10
    do, do' do do do, do' do do do, do' do do do, do' do do
    do, do' do do do, do' do do do,8 do do do
    do'[sib16 la sol fa mi re] do8 do do do

    %13
    do'[sib16 la sol fa mi re] do do' do do do, do' do do
    do, do' do do do, do' do do do, do' do do do, do' do do
    fa,8 mi16 re do sib la sol fa8 fa fa fa

    %16
    fa4 r fa fa
    fa fa do' do
    do do fa fa

    %19
    fa fa do16 \parenthesize do \parenthesize do \parenthesize do \parenthesize sib \parenthesize sib \parenthesize sib \parenthesize sib
    \parenthesize la4 \parenthesize r \parenthesize fa'8 \parenthesize fa \parenthesize mib \parenthesize mib
    re4 sib re sib'

    %22
    sol r sol8 sol fa fa
    mi4 do mi do'
    la r la8 la sol sol

    %25
    fa4 re fa re'
    sib r sib sib,
    do16[do do do do do do do] sib[sib sib sib sib sib sib sib]

    %28
    la4 r r16 sib'[la sol fa mib? re do]
    sib4 r r16 do'[sib la sol fa mi? re]
    do4 r r16 re'[do si la sol fa mi]

    %31
    \parenthesize re4 r do8 do do do
    sol' sol sol sol sol, sol sol sol
    do4 r r2

    %34
    do8 do do do do16 re mi fa sol la si do
    do,8 do do do do16 re mi fa sol la si do
    sol,8 sol sol sol sol16[la si do re mi fa sol]

    %37
    sol,8 sol sol sol sol16[la si do re mi fa sol]
    sol, sol' sol sol sol, sol' sol sol  sol, sol' sol sol  sol, sol' sol sol
    sol, sol' sol sol  sol, sol' sol sol  sol fa mi re do si la sol

    %40
    sol'[fa mi re do si la sol] \parenthesize sol'[\parenthesize fa\parenthesize mi\parenthesize re\parenthesize do\parenthesize si\parenthesize la \parenthesize sol]
    \parenthesize do8\parenthesize do\parenthesize do\parenthesize do\parenthesize sol'\parenthesize sol\parenthesize sol\parenthesize sol
    sol, sol sol sol do4 do


    %43
    la la  re re
    do do sib sib'
    mi, re do la

    %46
    mi' mi mi mi
    mi mi mi mi
    mi mi la,8 la la la

    %49
    re re re re si si si si
    do do do do la la la la
    sib? sib sib sib do do do do

    %52
    \parenthesize do do do do do do do do
    do do do do do do do do
    fa,16[sol la sib do re mi fa] fa,8 fa fa fa

    %55
    fa16[sol la sib do re mi fa] fa,8 fa fa fa
    do'16[re mi fa sol la sib do] do,8 do do do
    do16[re mi fa sol la sib do] do,8 do do do

    %58
    do do do do do do do do
    do do do do do do do do
    do do do do do do do do

    %61
    do'[sib16 la sol fa mi re] do8 do do do
    do'[sib16 la sol fa mi re] do do' do do, do do' do do,
    do do' do do, do do' do do, do do' do do, do do' do do,

    %64
    do4 r \parenthesize r2
    \parenthesize do'16 \parenthesize sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do
    \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do8\parenthesize do do do

    %67
    do4 r r2\fermata

}

Ibcn = \relative do {

    r2 fa,16[sol la sib do re mi fa]
    fa,8 fa fa fa fa16[sol la sib do re mi fa]
    do8 do do do do16[re mi fa sol la sib do]

    %4
    do,8 do do do do16 re mi fa sol la sib do
    fa,4 r sib,8 sib sib sib
    sib4 r la8 la la la

    %7
    la4 r sol8 sol sol sol
    sol4 r fa8 fa fa fa
    do' do \parenthesize do \parenthesize do do do do do

    %10
    do do do do do do do do
    do do do do do do do do
    do'[sib16 la sol fa mi re] do8 do do do

    %13
    do'[sib16 la sol fa mi re] do8 do do do
    do do do do do do do do
    fa mi16 re do sib la sol fa8 fa fa fa

    %16
    fa4 r fa fa
    fa fa do' do
    do do fa fa

    %19
    fa fa do16 \parenthesize do \parenthesize do \parenthesize do \parenthesize sib \parenthesize sib \parenthesize sib \parenthesize sib
    \parenthesize la4 \parenthesize r \parenthesize fa'8 \parenthesize fa \parenthesize mib \parenthesize mib
    re4 sib re sib'

    %22
    sol r sol8 sol fa fa
    mi4 do mi do'
    la r la8 la sol sol

    %25
    fa4 re fa re'
    sib r sib sib,
    do16[do do do do do do do] sib[sib sib sib sib sib sib sib]

    %28
    la4 r r16 sib'[la sol fa mib? re do]
    sib4 r r16 do'[sib la sol fa mi? re]
    do4 r r16 re'[do si la sol fa mi]

    %31
    \parenthesize re4 r do8 do do do
    sol' sol sol sol sol, sol sol sol
    do4 r r2

    %34
    do8 do do do do16 re mi fa sol la si do
    do,8 do do do do16 re mi fa sol la si do
    sol,8 sol sol sol sol16[la si do re mi fa sol]

    %37
    sol,8 sol sol sol sol16[la si do re mi fa sol]
    sol,8 sol sol sol sol sol sol sol
    sol sol sol sol sol4 r

    %40
    sol r \parenthesize sol \parenthesize r
    \parenthesize do8 \parenthesize do \parenthesize do \parenthesize do \parenthesize sol' \parenthesize sol \parenthesize sol \parenthesize sol
    sol,8 sol sol sol do4 do

    %43
    la la  re re
    do do sib sib'
    mi, re do la

    %46
    mi' mi mi mi
    mi mi mi mi
    mi mi la,8 la la la

    %49
    re re re re si si si si
    do do do do la la la la
    sib? sib sib sib do do do do

    %52
    \parenthesize do do do do do do do do
    do do do do do do do do
    fa,16[sol la sib do re mi fa] fa,8 fa fa fa

    %55
    fa16[sol la sib do re mi fa] fa,8 fa fa fa
    do'16[re mi fa sol la sib do] do,8 do do do
    do16[re mi fa sol la sib do] do,8 do do do

    %58
    do do do do do do do do
    do do do do do do do do
    do do do do do do do do

    %61
    do'[sib16 la sol fa mi re] do8 do do do
    do'[sib16 la sol fa mi re] do8 do do do
    do do do do do do do do

    %64
    do4 r \parenthesize r2
    \parenthesize do'16 \parenthesize sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do
    \parenthesize do'\parenthesize  sib \parenthesize la\parenthesize sol \parenthesize fa \parenthesize mi \parenthesize re \parenthesize do \parenthesize do8\parenthesize do do do

    %67
    do4 r r2\fermata

}

Ibfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\time 4/4
\key fa\major
\tempo 2 = 60
s1*67
\bar"|."

}


Ifl = {
	\global
	\notypeset
	<<\Ifln \forma>>

}

Iob = {
	\global
	<<\Iobn \forma>>

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

Ifg= {
	\global
	\clef bass
	<<\Ifgn \forma>>

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
		\terzine \con

			}

IIfln = \relative do'' {

    r8 r16 la' [la8.(sol16) sol8.(fad16)]
    fad?2.
    r8 r16 sib [sib8. la16 la8. sold16]

    %4
    sold?2.
    r8 r16 do[do8. si16 si8. la16]
    la4~la8. [la16 sold8. fad16]

    %7
    sold4~sold8.[sold16 la8. si?16]
    dod,4~dod8.[mi16 la8. dod,16]
    re4~re8.[fa16 sol8. la16]

    %10
    si,4~si8.[re16 sol8. si,16]
    do4~do8.[mi16 fa8. sol16]
    sib,?4~sib8.[mi16 sol8. sib,16]

    %13
    la4 r r
    R2.
    r8 r16 lab'[ lab8. sol16 sol8. fa16]

    %16
    fa2.~
    fa8.[sol16 sol8. fa16 fa8. mib16]
    mib?2.~

    %19
    mib8.[fa16 fa8. mib16 mib8. reb16]
    reb?8.[sol16 sol8. sib16 sib8. fa16]
    mi?16(do sib do) sol'(do, sib do) sib'(sol fa sol)

    %22
    lab8 sol16 fa mi4.\tr fa8
    fa16 fa, la do fa do la fa la do fa do
    la  fa la do fa do la fa la do fa do

    %25
    la fa la do fa do la fa la do fa do
    la8 fa do'4 do
    fa,2.\fermata

}

IIobn = \relative do'' {

    R2.
    r8 r16 re,[re8. re16 mi8. fad16]
    sol4 r r

    %4
    r8 r16 mi[mi8. mi16 fad8. sold16]
    la4 r r
    red,8.[red16 red8. red16 red8. red16]

    %7
    mi8.[mi16 mi8. mi16 mi8. mi16]
    la8.[la16 la8. la16 sol8. sol16]
    fa8.[fa16 fa8. fa16 fa8. fa16]

    %10
    sol8.[sol16 sol8. sol16 fa8. fa16]
    mi8.[mi16 mi8. mi16 mi8. mi16]
    do8.[do16 do8. do16 do8. do16]

    %13
    fa fa la do fa do la fa la do fa do
    la fa la do fa do la fa la do fa do
    la4 r r

    %16
    R2.*7
    r16 fa la do fa do la fa la do fa do
    la  fa la do fa do la fa la do fa do

    %25
    la fa la do fa do la fa la do fa do
    la8 fa do'4 do,
    fa2.\fermata

}

IIvlIn = \relative do'' {

    R2.
    r8 r16 re,[re8. re16 mi8. fad16]
    sol4 r r

    %4
    r8 r16 mi[mi8. mi16 fad8. sold16]
    la4 r r
    red,8.[red16 red8. red16 red8. red16]

    %7
    mi8.[mi16 mi8. mi16 mi8. mi16]
    la8.[la16 la8. la16 sol8. sol16]
    fa8.[fa16 fa8. fa16 fa8. fa16]

    %10
    sol8.[sol16 sol8. sol16 fa8. fa16]
    mi8.[mi16 mi8. mi16 mi8. mi16]
    do8.[do16 do8. do16 do8. do16]

    %13
    fa fa la do fa do la fa la do fa do
    la fa la do fa do la fa la do fa do
    la4 r r

    %16
    R2.*7
    r16 fa la do fa do la fa la do fa do
    la  fa la do fa do la fa la do fa do

    %25
    la fa la do fa do la fa la do fa do
    la8 fa do'4 do,
    fa2.\fermata

}

IIvlIIn = \relative do'' {

    R2.
    r8 r16 re,[re8. re16 mi8. fad16]
    sol4 r r

    %4
    r8 r16 mi[mi8. mi16 fad8. sold16]
    la4 r r
    red,8.[red16 red8. red16 red8. red16]

    %7
    mi8.[mi16 mi8. mi16 mi8. mi16]
    la8.[la16 la8. la16 sol8. sol16]
    fa8.[fa16 fa8. fa16 fa8. fa16]

    %10
    sol8.[sol16 sol8. sol16 fa8. fa16]
    mi8.[mi16 mi8. mi16 mi8. mi16]
    do8.[do16 do8. do16 do8. do16]

    %13
    fa fa la do fa do la fa la do fa do
    la fa la do fa do la fa la do fa do
    la4 r r

    %16
    R2.*7
    r16 fa la do fa do la fa la do fa do
    la  fa la do fa do la fa la do fa do

    %25
    la fa la do fa do la fa la do fa do
    la8 fa do'4 do,
    fa2.\fermata

}

IIvlan = \relative do' {

    R2.
    r8 r16 re[re8. re16 mi8. fad16]
    sol4 r r

    %4
    r8 r16 mi[mi8. mi16 fad8. sold16]
    la4 r r
    red,8.[red16 red8. red16 red8. red16]

    %7
    mi8.[mi16 mi8. mi16 mi8. mi16]
    la8.[la16 la8. la16 sol8. sol16]
    fa8.[fa16 fa8. fa16 fa8. fa16]

    %10
    sol8.[sol16 sol8. sol16 fa8. fa16]
    mi8.[mi16 mi8. mi16 mi8. mi16]
    do8.[do16 do8. do16 do8. do16]

    %13
    fa, fa la do fa do la fa la do fa do
    fa, fa la do fa do la fa la do fa do
    la4 r r

    %16
    R2.*7
    r16 fa la do fa do la fa la do fa do
    la  fa la do fa do la fa la do fa do

    %25
    la fa la do fa do la fa la do fa do
    la8 fa do'4 do,
    fa2.\fermata

}

IIfgn = \relative do {

    R2.
    r8 r16 re[re8. re16 mi8. fad16]
    sol4 r r

    %4
    r8 r16 mi[mi8. mi16 fad8. sold16]
    la4 r r
    red,8.[red16 red8. red16 red8. red16]

    %7
    mi8.[mi16 mi8. mi16 mi8. mi16]
    la8.[la16 la8. la16 sol8. sol16]
    fa8.[fa16 fa8. fa16 fa8. fa16]

    %10
    sol8.[sol16 sol8. sol16 fa8. fa16]
    mi8.[mi16 mi8. mi16 mi8. mi16]
    do8.[do16 do8. do16 do8. do16]

    %13
    fa, fa la do fa do la fa la do fa do
    fa, fa la do fa do la fa la do fa do
    la4 r r

    %16
    r8 r16 reb[reb8. do16 do8. si16]
    si?2.~
    si?8.[do16 do8. sib16 sib8. lab16]
    lab?2.
    sib
    do
    fa4 do' do,
    fa16 fa, la do fa do la fa la do fa do
    la  fa la do fa do la fa la do fa do

    %25
    la fa la do fa do la fa la do fa do
    la8 fa do'4 do,
    fa2.\fermata

}

IIbcn = \relative do {

    R2.
    r8 r16 re[re8. re16 mi8. fad16]
    sol4 r r

    %4
    r8 r16 mi[mi8. mi16 fad8. sold16]
    la4 r r
    red,8.[red16 red8. red16 red8. red16]

    %7
    mi8.[mi16 mi8. mi16 mi8. mi16]
    la8.[la16 la8. la16 sol8. sol16]
    fa8.[fa16 fa8. fa16 fa8. fa16]

    %10
    sol8.[sol16 sol8. sol16 fa8. fa16]
    mi8.[mi16 mi8. mi16 mi8. mi16]
    do8.[do16 do8. do16 do8. do16]

    %13
    fa, fa la do fa do la fa la do fa do
    fa, fa la do fa do la fa la do fa do
    la4 r r

    %16
    R2.*7
    r16 fa la do fa do la fa la do fa do
    la  fa la do fa do la fa la do fa do

    %25
    la fa la do fa do la fa la do fa do
    la8 fa do'4 do,
    fa2.\fermata

}

IIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\time 3/4
\key fa\major
\tempo 4 = 50
s2.*27
\bar"|."

}


IIfl = {
	\global
	\notypeset
	<<\IIfln \forma>>
}

IIob = {
	\global
	<<\IIobn \forma>>
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

IIfg = {
	\global
	\clef bass
	<<\IIfgn \forma>>
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
    \terzine \con

}

IIIfln = \relative do'' {

    fa,8 fa fa
    fa16 sol la sib do8
    fa, fa' fa,

    %4
    fa4 r8
    do''16\solo re do sib la sol
    \parenthesize la \parenthesize sib \parenthesize la \parenthesize sol \parenthesize fa\parenthesize  mi

    %7
    \parenthesize fa8^\markup\italic "[Tutti]" \parenthesize fa, \parenthesize fa
    \parenthesize fa16 \parenthesize sol \parenthesize la sib do8
    fa, fa' fa,

    %10
    fa4 r8
    sol'16\solo la sol fa mi re
    mi fa mi re do si

    %13
    do8\tu do do
    do16 re mi fa sol8
    do, do' do,

    %16
    do4 r8
    sol'16\solo la sol fa mi re
    mi fa mi re do si

    %19
    do8\tu do do
    do16 re mi fa sol8
    do, do' do,

    %22
    do4 r8
    do16 la' sol fa mi re
    do la' sol fa mi re

    %25
    do la' sol fa mi re
    do4 r8
    fa,16 re' do sib la sol

    %28
    fa re' do sib la sol
    fa re' do sib la sol
    fa4 r8

    %31
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %34
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %37
    fa'16\solo do la do fa la
    fa do la do fa la
    fa do la do fa do

    %40
    re4 r8
    sol16 re si re sol si
    sol re si re sol si

    %43
    sol re si re sol re
    mi4 r8
    la16 mi dod mi la dod

    %46
    la mi dod mi la dod
    la mi dod mi la mi
    fa4 r8

    %49
    re'16 do do sib sib la
    la sol sol fa fa mi
    mi re re dod dod si

    %52
    la si dod re mi fa
    la, si dod re mi fa
    sol fa sol sib? la sol

    %55
    fa8 \parenthesize re' \parenthesize fa,
    \parenthesize mi \parenthesize do' mi,
    re sib' re,

    %58
    dod la' do,
    si sol' sib,
    la dod mi

    %61
    fa la re
    mi, re' mi,
    re re re,

    %64
    re16 mi fa sol la8
    re, re' re,
    re4 r8

    %67
    re''16\solo do sib la sol fa
    sib la sol fa mi re
    dod8\tu la la

    %70
    la16 si dod re mi8
    la, la' la,
    la4 r8

    %73
    la'16 sol la sib la sol
    fad mi fad sol la fad
    sol fad sol la sol fa?

    %76
    mi re mi fa sol mi
    fa mi fa sol fa mib
    re do re mib fa re

    %79
    sol fa sol la sol fa
    mi re mi fa sol mi
    la sol la sib la sol

    %82
    fa mi fa sol la fa
    si la si do si la
    sold4 r8

    %85
    mi16 la do la mi la
    sold4 r8
    mi16 la do la mi la

    %88
    sold mi sold mi sold mi
    la mi la mi la mi
    la mi la mi la mi

    %91
    sold mi sold mi sold mi
    la4 r8
    fa, fa fa

    %94
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %97
    do''16\solo re do sib la \parenthesize sol
    \parenthesize la \parenthesize sib \parenthesize la \parenthesize sol fa mi
    fa8\tu fa, fa

    %100
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %103
    la' fa la
    sol mi sol
    la fa la

    %106
    sol mi sol
    fa do fa
    fa re fa

    %109
    sol re sol
    sol mi sol
    la mi la

    %112
    la fa la
    sib fa sib
    sib16 do, sib' do, la' do,

    %115
    sol' do, sol' do, fa do
    mi do mi do mi do
    sib' do, sib' do, la' do,

    %118
    sol' do, sol' do, fa do
    mi do mi do mi do
    <<{do16(re32 mi fa sol la sib do16\noBeam) r

    %121
    do,(re32 mi fa sol la sib do16\noBeam) r
    do,(re32 mi fa sol la sib do16\noBeam) r}

        \new Staff \with {
           \override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 2) (padding . 0))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"flute" \key fa\major
            do,16^\markup\italic"dal manoscritto - alternativa" mi mi sol sol do
            do, mi mi sol sol do
            do, mi mi sol sol do}>>

    la8 sib sol

    %124
    fa16 fa, fa la la do
    do la la do do fa
    fa do do fa fa la

    %127
    la fa fa la la do
    do la la fa fa do
    do fa fa do do la

    %130
    la do do la la fa
    <<{fa16(sol32 la sib do re mi fa[sol la16)]
       fa, fa fa fa fa fa

       %133
       sol(la32 sib do re mi fa sol[la sib16])
       sol, sol sol sol sol sol
       la(sib32 do re mi fa sol  la[sib do16)]

       %136
       la, la la la la la
       sib(do32 re mi fa sol la sib[do re16)]}

        \new Staff \with {
           \override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 2) (padding . 0))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"flute" \key fa\major
            fa,, la la do do fa
            fa, fa fa fa fa fa
            sol sib sib re re sol
            sol, sol sol sol sol sol
            la do do mi mi la
            la, la la la la la
            sib re re fa fa sib}>>

    sib, mi mi sol sol sib

    %139
    \parenthesize sib sol sol mi mi sib
    sib mi mi sol sol sib
    sib sol sol mi mi sib

    %142
    <<{la \parentSlur (sib32 do re mi fa sol la[sib do16)]
       fa,8 sol mi
       la,16 \parentSlur (sib32 do re mi fa sol la[sib do16)]}

        \new Staff \with {
           \override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 2) (padding . 0))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"flute" \key fa\major
            la,16 do do fa fa la
            fa8 sol mi
            la,16 do do fa fa la}>>

       %145
       fa8 sol mi
       fa4.\fermata

}

IIIobn = \relative do'' {

    fa,8 fa fa
    fa16 sol la sib do8
    fa, fa' fa,

    %4
    fa4 r8
    la'16\solo sib la sol fa mi
    \parenthesize fa \parenthesize sol\parenthesize fa\parenthesize mi \parenthesize re\parenthesize do

    %7
    \parenthesize fa,8^\markup\italic"[Tutti]"\parenthesize fa\parenthesize fa
    \parenthesize fa16\parenthesize sol\parenthesize la sib do8
    fa, fa' fa,

    %10
    fa4 r8
    mi'16\solo fa mi re do si
    do re do si la sol

    %13
    do,8\tu do do
    do16 re mi fa sol8
    do, do' do,

    %16
    do4 r8
    mi'16\solo fa mi re do si
    do re do si la sol

    %19
    do,8\tu do do
    do16 re mi fa sol8
    do, do' do,

    %22
    do4 r8
    do do do
    do4 r8

    %25
    R4.*2
    fa8 fa fa
    fa4 r8

    %29
    R4.*2

    %31
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %34
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %37
    R4.*3
    sib8 fa re
    si4 r8

    %42
    R4.*2
    do'8 sol mi
    dod4 r8

    %46
    R4.*2
    sib'8 la fa
    re4 r8

    %50
    R4.*2
    la'4 r8
    la4 r8

    %54
    la4 r8
    fa'8 \parenthesize re' \parenthesize fa,
    \parenthesize mi \parenthesize do' mi,
    re sib' re,

    %58
    dod la' do,
    si sol' sib,
    la dod mi

    %61
    fa la re
    mi, re' mi,
    re, re' re,

    %64
    re16 mi fa sol la8
    re, re' re,
    re4 r8

    %67
    sib''16\solo la sol fa mi re
    sol fa mi re do sib
    la8\tu la la

    %70
    la16 si dod re mi8
    la, la' la,
    la4 r8

    %73
    mi' la mi
    re la' re,
    re sol re

    %76
    do sol' do,
    do fa do
    \parenthesize sib fa' sib,

    %79
    re sol re
    do sol' do,
    mi la mi

    %82
    re la' re,
    fad si fad
    mi16 sold si sold mi sold

    %85
    la4 r8
    mi16 sold si sold mi sold
    la4 r8

    %88
    mi16 si mi si mi si
    mi do mi do mi do
    mi si mi si mi si

    %91
    mi si mi si mi si
    do4 r8
    fa, fa fa

    %94
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %97
    la'16\solo sib la \parenthesize sol \parenthesize fa\parenthesize mi
    \parenthesize fa\parenthesize sol \parenthesize fa\parenthesize mi re do
    fa,8\tu fa fa

    %100
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %103
    la' fa la
    sol mi sol
    la fa la

    %106
    sol mi sol
    fa do fa
    fa re fa

    %109
    sol re sol
    sol mi sol
    la mi la

    %112
    la fa la
    sib fa sib
    sib4 r8

    %115
    sib4 r8
    sib4 r8
    sib4 r8

    %118
    sib4 r8
    sib4 r8
    sib4 r8

    %121
    sib4 r8
    sib4 r8
    la sib sol

    %124
    \once\stemDown fa16 do, do fa fa la
    la fa fa la la do
    do la la do do fa

    %127
    fa do do fa fa la
    la fa fa do do la
    la do do la la fa

    %130
    fa la la fa fa do
    do4 r8
    fa16 fa fa fa fa fa

    %133
    R4.
    sol16 sol sol sol sol sol
    R4.

    %136
    la16 la la la la la
    R4.
    sib16 mi mi sol sol \parenthesize sib

    %139
    \parenthesize sib sol sol mi mi sib
    sib mi mi sol sol sib
    sib sol sol mi mi sib

    %142
    la4 r8
    fa' sol mi
    fa4 r8

    %145
    fa sol mi
    fa4.\fermata

}


IIIvlIn = \relative do'' {

    fa,8 fa fa
    fa16 sol la sib do8
    fa, fa' fa,

    %4
    fa4 r8
    R4.*2

    %7
    \parenthesize fa8^\markup\italic"[Tutti]"\parenthesize fa\parenthesize fa
    \parenthesize fa16\parenthesize sol\parenthesize la sib do8
    fa, fa' fa,

    %10
    fa4 r8
    R4.*2

    %13
    do8\tu do do
    do16 re mi fa sol8
    do, do' do,

    %16
    do4 r8
    R4.*2

    %19
    do8\tu do do
    do16 re mi fa sol8
    do, do' do,

    %22
    do4 r8
    R4.
    do8 do do

    %25
    do4 r8
    R4.*2
    fa8 fa fa

    %29
    fa4 r8
    R4.

    %31
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %34
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %37
    R4.*3
    sib8 fa re
    si4 r8

    %42
    R4.*2
    do'8 sol mi
    dod4 r8

    %46
    R4.*2
    sib'8 la fa
    re4 r8

    %50
    R4.*2
    la'4 r8
    la4 r8

    %54
    la4 r8
    fa'8 \parenthesize re' \parenthesize fa,
    \parenthesize mi \parenthesize do' mi,
    re sib' re,

    %58
    dod la' do,
    si sol' sib,
    la dod mi

    %61
    fa la re
    mi, re' mi,
    re, re re

    %64
    re16 mi fa sol la8
    re, re' re,
    re4 r8

    %67
    R4.*2
    la'8\tu la la

    %70
    la16 si dod re mi8
    la, la' la,
    la4 r8

    %73
    R4.
    re16 dod? re mi fad re
    si4 r8

    %76
    do?16 si do re mi do
    la4 r8
    \parenthesize sib?16\parenthesize la sib do re sib

    %79
    sol4 r8
    do16 si do re mi do
    la4 r8

    %82
    re16 do re mi fa re
    si4 r8
    si16 mi sold mi si mi

    %85
    do mi la mi do mi
    si mi sold mi si mi
    do mi la mi do mi

    %88
    si sold si sold si sold
    do la do la do la
    si la si la si la

    %91
    si sold si sold si sold
    la4 r8
    fa fa fa

    %94
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %97
    R4.*2
    fa8\tu fa fa

    %100
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %103
    fa'8 do fa
    mi do mi
    fa do fa

    %106
    mi do mi
    do la do
    re sib re

    %109
    re si re
    mi do mi
    mi dod mi

    %112
    fa re fa
    fa re fa
    mi4 r8

    %115
    sol4 r8
    sol4 r8
    sol4 r8

    %118
    sol4 r8
    sol4 r8
    sol4 r8

    %121
    sol4 r8
    sol4 r8
    fa8 sol mi

    %124
    \once\stemDown fa16 la,, la do do fa
    fa do do fa fa la
    la fa fa la la do

    %127
    do la la do do fa
    fa do do la la fa
    fa la la fa fa do

    %130
    do fa fa do do la
    la4 r8
    fa'16 fa fa fa fa fa

    %133
    R4.
    sol16 sol sol sol sol sol
    R4.

    %136
    la16 la la la la la
    R4.
    sol16 sib sib mi mi \parenthesize sol

    %139
    \parenthesize sol\parenthesize mi\parenthesize mi\parenthesize sib sib sol
    sol sib sib mi mi sol
    sol mi mi sib sib sol

    %142
    fa4 r8
    la sib sol
    fa4 r8

    %145
    la sib sol
    fa4.\fermata

}

IIIvlIIn = \relative do'' {

    fa,8 fa fa
    fa16 sol la sib do8
    fa, fa' fa,

    %4
    fa4 r8
    R4.*2

    %7
    \parenthesize fa8^\markup\italic"[Tutti]"\parenthesize fa\parenthesize fa
    \parenthesize fa16\parenthesize sol\parenthesize la sib do8
    fa, fa' fa,

    %10
    fa4 r8
    R4.*2

    %13
    do8\tu do do
    do16 re mi fa sol8
    do, do' do,

    %16
    do4 r8
    R4.*2

    %19
    do8\tu do do
    do16 re mi fa sol8
    do, do' do,

    %22
    do4 r8
    R4.
    do8 do do

    %25
    do4 r8
    R4.*2
    fa8 fa fa

    %29
    fa4 r8
    R4.

    %31
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %34
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %37
    R4.*3
    sib8 fa re
    si4 r8

    %42
    R4.*2
    do'8 sol mi
    dod4 r8

    %46
    R4.*2
    sib'8 la fa
    re4 r8

    %50
    R4.*2
    la'4 r8
    la4 r8

    %54
    la4 r8
    fa'8 \parenthesize re' \parenthesize fa,
    \parenthesize mi \parenthesize do' mi,
    re sib' re,

    %58
    dod la' do,
    si sol' sib,
    la dod mi

    %61
    fa la re
    mi, re' mi,
    re, re re

    %64
    re16 mi fa sol la8
    re, re' re,
    re4 r8

    %67
    R4.*2
    la'8\tu la la

    %70
    la16 si dod re mi8
    la, la' la,
    la4 r8

    %73
    mi' la mi
    re la' re,
    re sol re

    %76
    do sol' do,
    do fa do
    \parenthesize sib fa' sib,

    %79
    re sol re
    do sol' do,
    mi la mi

    %82
    re la' re,
    fad si fad
    mi16 sold si sold mi sold

    %85
    la4 r8
    mi16 sold si sold mi sold
    la4 r8

    %88
    mi16 si mi si mi si
    mi do mi do mi do
    mi si mi si mi si

    %91
    mi si mi si mi si
    do4 r8
    fa, fa fa

    %94
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %97
    R4.*2
    fa8\tu fa fa

    %100
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %103
    la' fa la
    sol mi sol
    la fa la

    %106
    sol mi sol
    fa do fa
    fa re fa

    %109
    sol re sol
    sol mi sol
    la mi la

    %112
    la fa la
    sib fa sib
    sib4 r8

    %115
    sib4 r8
    sib4 r8
    sib4 r8

    %118
    sib4 r8
    sib4 r8
    sib4 r8

    %121
    sib4 r8
    sib4 r8
    la sib sol

    %124
    \once\stemDown fa16 do, do fa fa la
    la fa fa la la do
    do la la do do fa

    %127
    fa do do fa fa la
    la fa fa do do la
    la do do la la fa

    %130
    fa la la fa fa do
    do4 r8
    fa16 fa fa fa fa fa

    %133
    R4.
    sol16 sol sol sol sol sol
    R4.

    %136
    la16 la la la la la
    R4.
    sib16 mi mi sol sol \parenthesize sib

    %139
    \parenthesize sib sol sol mi mi sib
    sib mi mi sol sol sib
    sib sol sol mi mi sib

    %142
    la4 r8
    fa' sol mi
    fa4 r8

    %145
    fa sol mi
    fa4.\fermata

}

IIIvlan = \relative do' {

    fa,8 fa fa
    fa16 sol la sib
    do8 fa, fa' fa,

    %4
    fa4 r8
    R4.*2
    \parenthesize fa8\parenthesize fa\parenthesize fa

    %8
    \parenthesize fa16\parenthesize sol\parenthesize la\parenthesize sib do8
    fa, fa' fa,
    fa4 r8

    %11
    R4.*2
    do'8 do do
    do16 re mi fa sol8

    %15
    do, do' do,
    do4 r8
    R4.*2

    %19
    do8 do do
    do16 re mi fa sol8
    do, do' do,

    %22
    do4 r8
    R4.*3
    do8 do do

    %27
    fa4 r8
    R4.*2
    fa8 fa fa

    %31
    sib16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %34
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %37
    R4.*3
    sib'8 fa re
    si4 r8

    %42
    R4.*2
    do'8 sol mi
    dod4 r8

    %46
    R4.*2
    sib'8 la fa
    re4 r8

    %50
    R4.*2
    la4 r8
    la4 r8

    %54
    la4 r8
    \parenthesize fa'4\parenthesize fa8
    \parenthesize mi4 \parenthesize mi8

    %57
    re4 re8
    dod4 do8
    si4 sib8

    %60
    la4 la8
    re4 re8
    la4 la8

    %63
    re re re
    re16 mi fa sol la8
    re, re' re,

    %66
    re4 r8
    R4.*2
    la8 la la

    %70
    la16 si dod re mi8
    la,8 la' la,
    la4 r8

    %73
    la la la
    re re re
    sol sol sol

    %76
    do, do do
    fa fa fa
    \parenthesize sib, sib sib

    %79
    si si si
    do do do
    dod dod dod

    %82
    re re re
    red red red
    mi16 mi mi mi mi mi

    %85
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %88
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %91
    mi mi mi mi mi mi
    mi4 r8
    fa fa fa

    %94
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %97
    R4.*2
    fa8 fa fa
    fa16 sol la sib do8

    %101
    fa, fa' fa,
    fa4 r8
    fa fa16 sol la fa

    %104
    do8 do16 re mi do
    fa8 fa16 sol la fa
    do8 do16 re mi do

    %107
    fa8 fa16 sol la fa
    sib,8 sib16 do re sib
    sol8 sol16 la si sol

    %110
    do8 do16 re mi do
    la8 la16 si dod la
    re8 re16 mi fa mi

    %113
    re8 re16 mi fa re
    do4 r8
    do4 r8

    %116
    do4 r8
    do4 r8
    do4 r8

    %119
    do4 r8
    do4 r8
    do4 r8

    %122
    do4 r8
    fa sib, do
    fa,8 fa16 fa fa fa

    %125
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa

    %128
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa

    %131
    fa4 r8
    fa'16 fa fa fa fa fa
    R4.

    %134
    sol16 sol sol sol sol sol
    R4.
    la16 la la la la la

    %137
    R4.
    do,16 do do do do do
    do do do do do do

    %140
    do do do do do do
    do do do do do do
    fa4 r8

    %143
    fa sib, do
    fa,4 r8
    fa' sib, do

    %146
    fa,4.\fermata

}

IIIfgn = \relative do {

    fa,8 fa fa
    fa16 sol la sib
    do8 fa, fa' fa,

    %4
    fa4 r8
    R4.*2
    \parenthesize fa8\parenthesize fa\parenthesize fa

    %8
    \parenthesize fa16\parenthesize sol\parenthesize la\parenthesize sib do8
    fa, fa' fa,
    fa4 r8

    %11
    R4.*2
    do'8 do do
    do16 re mi fa sol8

    %15
    do, do' do,
    do4 r8
    R4.*2

    %19
    do8 do do
    do16 re mi fa sol8
    do, do' do,

    %22
    do4 r8
    R4.*2
    do8 do do

    %26
    do4 r8
    R4.*2
    fa8 fa fa

    %30
    fa4 r8
    sib16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %34
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %37
    R4.*3
    sib'8 fa re
    si4 r8

    %42
    R4.*2
    do'8 sol mi
    dod4 r8

    %46
    R4.*2
    sib'8 la fa
    re4 r8

    %50
    R4.*2
    la4 r8
    la4 r8

    %54
    la4 r8
    \clef tenor \parenthesize fa''16\parenthesize fa\parenthesize fa\parenthesize fa\parenthesize fa\parenthesize fa
    \parenthesize mi\parenthesize mi\parenthesize mi mi mi mi

    %57
    re re re re re re
    dod dod dod dod do do
    si si si si sib sib

    %60
    do do do do do do
    \clef bass re, re re re re re
    la la la la la la

    %63
    re8 re re
    re16 mi fa sol la8
    re, re' re,

    %66
    re4 r8
    R4.*2
    la8 la la

    %70
    la16 si dod re mi8
    la,8 la' la,
    la4 r8

    %73
    dod16 sib dod re dod sib
    la4 r8
    si16 la si do si la

    %76
    sol4 r8
    la16 sol la sib? la sol
    \parenthesize fa4 r8

    %79
    si16 la si do si la
    sol4 r8
    dod16 si dod re dod si

    %82
    la4 r8
    red16 dod red mi red dod
    si mi mi mi mi mi

    %85
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %88
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %91
    mi mi mi mi mi mi
    mi4 r8
    fa fa fa

    %94
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %97
    R4.*2
    fa8 fa fa
    fa16 sol la sib do8

    %101
    fa, fa' fa,
    fa4 r8
    fa fa16 sol la fa

    %104
    do8 do16 re mi do
    fa8 fa16 sol la fa
    do8 do16 re mi do

    %107
    fa8 fa16 sol la fa
    sib,8 sib16 do re sib
    sol8 sol16 la si sol

    %110
    do8 do16 re mi do
    la8 la16 si dod la
    re8 re16 mi fa mi

    %113
    re8 re16 mi fa re
    do4 r8
    do4 r8

    %116
    do4 r8
    do4 r8
    do4 r8

    %119
    do4 r8
    do4 r8
    do4 r8

    %122
    do4 r8
    fa sib, do
    fa,8 fa16 fa fa fa

    %125
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa

    %128
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa

    %131
    fa4 r8
    fa'16 fa fa fa fa fa
    R4.

    %134
    sol16 sol sol sol sol sol
    R4.
    la16 la la la la la

    %137
    R4.
    do,16 do do do do do
    do do do do do do

    %140
    do do do do do do
    do do do do do do
    fa4 r8

    %143
    fa sib, do
    fa,4 r8
    fa' sib, do

    %146
    fa,4.\fermata

}

IIIbcn = \relative do {

    fa,8 fa fa
    fa16 sol la sib
    do8 fa, fa' fa,

    %4
    fa4 r8
    R4.*2
    \parenthesize fa8\parenthesize fa\parenthesize fa

    %8
    \parenthesize fa16\parenthesize sol\parenthesize la\parenthesize sib do8
    fa, fa' fa,
    fa4 r8

    %11
    R4.*2
    do'8 do do
    do16 re mi fa sol8

    %15
    do, do' do,
    do4 r8
    R4.*2

    %19
    do8 do do
    do16 re mi fa sol8
    do, do' do,

    %22
    do4 r8
    R4.*3
    do8 do do

    %27
    fa4 r8
    R4.*2
    fa8 fa fa

    %31
    sib16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %34
    sib'16 la sol fa mi re
    do sib la sol fa mi
    fa8 fa fa

    %37
    R4.*3
    sib'8 fa re
    si4 r8

    %42
    R4.*2
    do'8 sol mi
    dod4 r8

    %46
    R4.*2
    sib'8 la fa
    re4 r8

    %50
    R4.*2
    la4 r8
    la4 r8

    %54
    la4 r8
    \clef tenor \parenthesize fa''4\parenthesize fa8
    \parenthesize mi4 \parenthesize mi8

    %57
    re4 re8
    dod4 do8
    si4 sib8

    %60
    la4 la8
    \clef bass re,4 re8
    la4 la8

    %63
    re re re
    re16 mi fa sol la8
    re, re' re,

    %66
    re4 r8
    R4.*2
    la8 la la

    %70
    la16 si dod re mi8
    la,8 la' la,
    la4 r8

    %73
    la la la
    re re re
    sol sol sol

    %76
    do, do do
    fa fa fa
    \parenthesize sib, sib sib

    %79
    si si si
    do do do
    dod dod dod

    %82
    re re re
    red red red
    mi16 mi mi mi mi mi

    %85
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %88
    mi mi mi mi mi mi
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %91
    mi mi mi mi mi mi
    mi4 r8
    fa fa fa

    %94
    fa16 sol la sib do8
    fa, fa' fa,
    fa4 r8

    %97
    R4.*2
    fa8 fa fa
    fa16 sol la sib do8

    %101
    fa, fa' fa,
    fa4 r8
    fa fa16 sol la fa

    %104
    do8 do16 re mi do
    fa8 fa16 sol la fa
    do8 do16 re mi do

    %107
    fa8 fa16 sol la fa
    sib,8 sib16 do re sib
    sol8 sol16 la si sol

    %110
    do8 do16 re mi do
    la8 la16 si dod la
    re8 re16 mi fa mi

    %113
    re8 re16 mi fa re
    do4 r8
    do4 r8

    %116
    do4 r8
    do4 r8
    do4 r8

    %119
    do4 r8
    do4 r8
    do4 r8

    %122
    do4 r8
    fa sib, do
    fa,8 fa16 fa fa fa

    %125
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa

    %128
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa
    fa8 fa16 fa fa fa

    %131
    fa4 r8
    fa'16 fa fa fa fa fa
    R4.

    %134
    sol16 sol sol sol sol sol
    R4.
    la16 la la la la la

    %137
    R4.
    do,16 do do do do do
    do do do do do do

    %140
    do do do do do do
    do do do do do do
    fa4 r8

    %143
    fa sib, do
    fa,4 r8
    fa' sib, do

    %146
    fa,4.\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/8
    \key fa\major
    \tempo 4. = 72
    s4.*146
    \bar"|."

}


IIIfl = {
    \global
    %\notypeset
    <<\IIIfln \forma>>
}

IIIob = {
    \global
    <<\IIIobn \forma>>
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

IIIfg = {
    \global
    \clef bass
    <<\IIIfgn \forma>>
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
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

    \header {
   title = \markup\smaller "Concerto ”La tempesta di mare” [RV 98]"
   %subsubtitle = #(string-append " ")
   composer = \markup \center-column{"   ""A. Vivaldi (1678-1741)"}
    }

    \markup \huge {[1. Allegro]}

    \score {

            \new ChoirStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \set Staff.instrumentName = \markup  \center-column{"Flauto Traversier"}
                    \Ifl
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup  \center-column{"Aubois"}
                    \Iob
                >>

                \new Staff = "main"
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup  \center-column{"Violino principale""Violino di ripieno [Pmo]"}
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup  \center-column{"Violino di ripieno 2do"}
                    \IvlII
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup  \center-column{"Violetta"}
                    \Ivla
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"bassoon"
                    \set Staff.instrumentName = \markup  \center-column{"Fagotto"}
                    \Ifg

                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"cello"
                    \set Staff.instrumentName = \markup  \center-column{"Basso"}
                    \Ibc

                >>
            >>

        \layout {

            indent = 3\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\pageBreak

    \markup \huge {[2.] Largo}

    \score {

            \new ChoirStaff <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \IIfl
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIob
                >>

                \new Staff
                <<
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
                    \set Staff.midiInstrument = #"bassoon"
                    \IIfg

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
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

    \pageBreak

    \markup \huge {[3.] Presto}

    \score {

            \new ChoirStaff <<

                \new Staff = "main"
                <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIfl
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIob
                >>

                \new Staff
                <<
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
                    \set Staff.midiInstrument = #"bassoon"
                    \IIIfg

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
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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
