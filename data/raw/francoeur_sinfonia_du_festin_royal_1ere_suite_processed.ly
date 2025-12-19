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

dolce = _\markup \italic { doux }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tous"

acc = ^\markup\italic"acc."

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

rinf = ^\markup\italic "rinf"

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##t

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
    \senza

}

IvlIn = \relative do'' {

   la'2 do,4. do8
   sol'2. do,8 do
   re2 la4.-+ si8

   %4
   \appoggiatura si?8 do2 r8 do sol[la]
   sib?4. do8 re4. mi8
   fa4 la,8 sib do4. fa,8

   %7
   sol4 sol8(la16 sib) la4.-+ sol8
   \appoggiatura sol la2 \appoggiatura sol8 fa2
   la'4. (sib16 do) sib8 la sib sol

   %10
   la4. (sib16 do) sib8 la sib sol
   la4 la la4.-+ sib8
   sol2-+ r

   %13
   r4 re8 re re re re mi
   \appoggiatura mi fa4 fa mi4.\prall fa8
   re4-+ sol,8 sol do do mi mi

   %16
   sol4. re8 re4 mi8[fa]
   mi2-+ r mi-+ r\mbreak
   r8 do\noBeam do do fa la16 sol fa [mi re do]

   %19
   re8 [fa16 mi] re do sib la sib8 la16 sib sol8 [do]
   la8 fa16 mi fa [sol la sib] do8 sol16 fa sol [la sib sol]
   la8 fa16 mi fa [sol la sib] do [re mi do] fa8. sol16

   %22
   mi8-+ sol fa16[mi re do] si8-+ do re mi
   re16 sol mi sol mi[sol mi sol] re sol mi sol re[sol do, sol']
   si, sol' mi sol mi[sol mi sol] re sol mi sol re[sol do, sol']

   %25
   si, sol sol sol sol[do do do] do mi mi mi mi[sol sol sol]
   sol8 do do,8.[re16] mi4(re8.-+) do16
   do8 do do do sol16 fa sol la sol[la sib sol]

   %28
   la8 la la la re mi16 fa sol[fa mi re]
   dod8-+ la' sol16[fa mi re] dod8-+ re mi fa
   mi la sol16[fa mi re]\mbreak dod8-+ re mi fa

   %31
   mi16 la, la la la[re re re] re fa fa fa fa[ la la la]
   la8 re re,8.[mi16]fa4(mi8.-+) re16
   re2 re16 sib' re, sib' re,[sib' re, sib']

   %34
   do, la' do, la' do, [la' do, la'] sib, sol' sib, sol' sib, [sol' sib, sol']
   fad sol fad sol la[re, mi fad] sol8[re] sol la16 sib
   mi, fa? mi fa sol[mi fa sol] do,[la' do, la'] do, la' do, la'\mbreak

   %37
   sib, [sol' sib, sol'] sib, sol' sib, sol' la,[fa' la, fa'] la, fa' la, fa'
   mi fa sol fa mi[re do sib] la8[do] fa mi16 fa
   re8 re sol4~sol8[mi] la sol16 la

   %40
   fa8 fa sib4~sib8. la16 la8.-+[sol16]
   sol8 [do] sib16 la sol fa mi8 [fa] sol la
   sol [do] sib16 la sol fa mi8[fa] sol la\mbreak

   %43
   sol16 do, do do do[fa fa fa] fa la la la la[do do do]
   do8[fa] fa,8. sol16 la4(sol8.-+) fa16
   fa2 r8 do16 [re] mib8 re16 do

   %46
   re2 r8 sib'16[la] sol fa mi re
   do2 r8 la'16[sol] fa mi re do\mbreak
   sib2 r8 sol'16[fa] mi re do sib

   %49
   la8 fa16 la fa[la fa la] sol do sol do sol[do sol do]
   la8 fa16 la fa[la fa la] sol do sol do sol[do sol do]

   %51
   la[sib la sol] fa sol la sib do re mi do fa8.[sol16]
   mi[do sol' do,] sol' do, la' do, sib' [do, la' do,] sol' do, fa do\mbreak
   mi do sol ' do, sol'[do, la' do,] sib'[do, la' do,] sol' do, fa do

   %54
   mi[do la' fa] sol mi fa re mi[do la' fa] sol mi fa re
   mi[do la' fa] sol mi fa re mi[do re sib] do la sib sol
   la[fa re' sib] do la sib sol  la[fa re' sib] do la sib sol\mbreak

   %57
   la[fa sib sol] do la re sib mi[do fa re] sol mi la fa
   sib4 la8.\prall sol16 la4(sol8.-+) fa16
   fa8 la,16 sib do[re do re] mib8 mib sib16[do sib do]

   %60
   re8[re] la16 sib la sib do8[re16 do] sib la sol fa
   mi do' la do la[do la do] sol do la do sol[do fa, do']\mbreak
   mi,16 do' la do la[do la do] sol do la do sol[do fa, do']

   %63
   mi,4 r <fa sol,>2\dolce^\accent
   <mi sol,> r
   r4 la8.\f[fa16] do'4 mi8. do16

   %66
   fa4 la8. fa16 sib2~
   sib4. r32 sol(la sib) la4(sol8.-+) fa16
   fa1

}

IvlIIn = \relative do'' {

   la'2 do,4. do8
   sol'2. do,8 do
   re2 la4.-+ si8

   %4
   \appoggiatura si?8 do2 r8 do sol[la]
   sib?4. do8 re4. mi8
   fa4 la,8 sib do4. fa,8

   %7
   sol4 sol8(la16 sib) la4.-+ sol8
   \appoggiatura sol la2 \appoggiatura sol8 fa2
   do'4.(re16 mib) re8 do re sib

   %10
   do4.(re16 mib) re8 do re sib
   do4 do fa4. sol8
   mi2-+ r

   %13
   r4 re8 re re [re re mi]
   \appoggiatura mi fa4 fa mi4.\prall fa8
   re4-+ sol,8 sol do do mi mi

   %16
   sol4. re8 re4 mi8[fa]
   mi2-+ r mi-+ r\mbreak
   r8 do\noBeam do do fa la16 sol fa [mi re do]

   %19
   re8 [fa16 mi] re do sib la sib8 la16 sib sol8 [do]
   la8 fa16 mi fa [sol la sib] do8 sol16 fa sol [la sib sol]
   la8 fa16 mi fa [sol la sib] do [re mi do] fa8. sol16

   %22
   mi8-+ sol fa16[mi re do] si8-+ do re mi
   re16 sol mi sol mi[sol mi sol] re sol mi sol re[sol do, sol']
   si, sol' mi sol mi[sol mi sol] re sol mi sol re[sol do, sol']

   %25
   si, sol sol sol sol[do do do] do mi mi mi mi[sol sol sol]
   sol8 do do,8.[re16] mi4(re8.-+) do16
   do8 do do do sol16 fa sol la sol[la sib sol]

   %28
   la8 la la la re mi16 fa sol[fa mi re]
   dod8-+ la' sol16[fa mi re] dod8-+ re mi fa
   mi la sol16[fa mi re]\mbreak dod8-+ re mi fa

   %31
   mi16 la, la la la[re re re] re fa fa fa fa[ la la la]
   la8 re re,8.[mi16]fa4(mi8.-+) re16
   re re mi fa sol[la sib dod] re2~

   %34
   re~re~
   re16 re do? sib la[fad sol la] re,8 re sol[la16 sib]
   mi, do re mi fa[sol la sib] do2~\mbreak

   %37
   do~do~
   do16 do sib  la sol[mi fa sol] do,8 do fa[mi16 fa]
   re8 re sol4~sol8[mi] la sol16 la

   %40
   fa8 fa sib4~sib8. la16 la8.-+[sol16]
   sol8 [do] sib16 la sol fa mi8 [fa] sol la
   sol [do] sib16 la sol fa mi8[fa] sol la\mbreak

   %43
   sol16 do, do do do[fa fa fa] fa la la la la[do do do]
   do8[fa] fa,8. sol16 la4(sol8.-+) fa16
   fa2 r8 do16 [re] mib8 re16 do

   %46
   re2 r8 sib'16[la] sol fa mi re
   do2 r8 la'16[sol] fa mi re do\mbreak
   sib2 r8 sol'16[fa] mi re do sib

   %49
   la8 fa16 la fa[la fa la] sol do sol do sol[do sol do]
   la8 fa16 la fa[la fa la] sol do sol do sol[do sol do]

   %51
   la[sib la sol] fa sol la sib do re mi do fa8.[sol16]
   mi[do sol' do,] sol' do, la' do, sib' [do, la' do,] sol' do, fa do\mbreak
   mi do sol ' do, sol'[do, la' do,] sib'[do, la' do,] sol' do, fa do

   %54
   mi[do la' fa] sol mi fa re mi[do la' fa] sol mi fa re
   mi[do la' fa] sol mi fa re mi[do re sib] do la sib sol
   la[fa re' sib] do la sib sol  la[fa re' sib] do la sib sol\mbreak

   %57
   la[fa sib sol] do la re sib mi[do fa re] sol mi la fa
   sib4 la8.\prall sol16 la4(sol8.-+) fa16
   fa8 la,16 sib do[re do re] mib8 mib sib16[do sib do]

   %60
   re8[re] la16 sib la sib do8[re16 do] sib la sol fa
   mi do' la do la[do la do] sol do la do sol[do fa, do']\mbreak
   mi,16 do' la do la[do la do] sol do la do sol[do fa, do']

   %63
   mi,4 r <fa sol,>2\dolce^\accent
   <mi sol,> r
   r4 la8.\f[fa16] do'4 mi8. do16

   %66
   fa4 la8. fa16 sib2~
   sib4. r32 sol(la sib) la4(sol8.-+) fa16
   fa1

}

IvlaIn = \relative do'' {

    fa,2 la
    do sol
    r4 la8 sol fa4. sol8

    %4
    mi2-+ mib
    re1
    do2. fa4

    %7
    fa2 mi-+
    fa r
    fa r\mbreak

    %10
    fa r
    r4 fa re sib
    do2 r4 mib

    %13
    re2 r
    r4 re' do4. re8
    si2 r4 do8 sol

    %16
    sol2 sol
    sol r sol r
    r r8 fa fa[fa]

    %19
    sib8 re16 do sib[la sol fa] sol8 fa16 sol mi[fa sol mi]
    fa8 la la la sol mi16 re mi[fa sol mi]
    fa8 la la[la] sol do do[si-+]

    %22
    do4. do,8 sol'4. sol8
    sol4. sol8 si4. do8\mbreak
    re sol, r sol si4. do8

    %25
    re4 r16 sol, sol sol sol mi mi mi mi[do do do]
    do8 sol r do' do4(si8.-+) do16
    do4 r r8 mi,16 fa mi[fa sol mi]

    %28
    fa4. la8 la4 sol-+
    la8 fa mi-+[re] la'4 r
    r8 fa mi-+[re]\mbreak la'4 r

    %31
    r r16 la la la la [fa fa fa] fa re re re
    re8 la r re' re4(dod8.-+) re16
    re2 sol,

    %34
    fad sol
    re8 la' la[la] sib16 do sib do re[do sib la]
    sol4 r fa2\mbreak

    %37
    mi fa
    do8 mi mi[mi] fa4 r8 la
    fa fa sib[la16 sib] sol4 r8 do

    %40
    la la re[mi16 re] do8 do4 fa8
    mi la,  sol[fa] do'4 r
    r8 la sol[fa] do'4 r\mbreak

    %43
    r r16 do do do do[la la la] la fa fa fa
    fa8 do r fa' fa4(mi8.-+) fa16
    fa2 r8 la, la[do]

    %46
    fa,2 r8 re re[sol]
    sol4 do, r8 do do[fa]\mbreak
    fa4 sib, r8 mi16 fa sol8[fa16 mi]

    %49
    fa4. fa8 mi mi sol mi
    fa4. fa8 mi mi sol mi
    fa4 la sol8 do4 si8

    %52
    do do sib[la] sol fa mi[re]\mbreak
    do do' sib[la] sol fa mi[re]
    do do'4 si8 do, do'4 si8

    %55
    do, do'4 si8 do sol la[mi]
    fa fa4 mi8 fa fa4 mi8\mbreak
    fa mi fa[sib] sol[fa] do' do

    %58
    sib4 re do~do8. sib16
    la4 r8 la16 sib do8 do sol16[la sol la]
    sib8 sib fa16[sol fa sol] la8[sib16 do] re do sib la

    %61
    sol8 do,4 do8 mi do4 si8\mbreak
    do do4 do8 mi do4 si8
    do4 r re2

    %64
    do r
    r4 fa8. la16 sol4 do,8. sol'16
    la2 r4 re8. sib16

    %67
    sol4 re' do~do8. sib16
    la1

}


IvlaIIn = \relative do'' {

    do2 la
    sol2. sol4
    la fa8 mi re2

    %4
    sol4 sol, do2
    r4 re8 do sib2
    r4 do la2

    %7
    re do
    do r
    fa r\mbreak

    %10
    fa r
    r4 fa re sib
    do2 r4 mib

    %13
    re2 r
    r4 re mi? la
    sol2 r4 mi8 mi

    %16
    re2 re-+
    do r do r
    r2 r8 fa fa[fa]

    %19
    sib re16 do sib[la sol fa] sol8 do, do[do]
    fa fa fa[do] mi sol sol[sol]
    do,4. do8 mi sol la[sol]

    %22
    sol4. mi8 re[sol] si, do
    si sol r do re4. sol8\mbreak
    sol4. do,8 re4. sol8

    %25
    sol4 r16 mi mi mi mi[do do do] do sol sol sol
    sol8 sol' mi[la] sol2
    mi-+ r8 do do[do]

    %28
    do4. fa8 fa4 sib8 sol
    mi fa mi-+[re] la'4 r
    r8 fa mi-+[re]\mbreak la'4 r

    %31
    r r16 fa fa fa fa[re re re] re la la la
    la8 la' fa[sib] la2
    fa4 re sol2

    %34
    fad sol
    re8 re re re re4. re8
    do4 r fa2\mbreak

    %37
    mi fa
    do4. do8 do4. do8
    sib re r re do mi r mi

    %40
    re fa r fa fa4 do'
    do8 la sol[fa] do'4 r
    r8 la sol[fa] do'4 r\mbreak

    %43
    r r16 la la la la[fa fa fa] fa do do do
    do8 do' la[re] do2
    la r8 fa fa[do]

    %46
    sib16 sib do re mi[fa sol la] sib la sol fa mi[re do sib]
    do la sib do re[mi fa sol] la sol fa mi re[do sib la]\mbreak
    sib sol la sib do[re mi fa] sol fa mi re do[sib la sol]

    %49
    fa4. do'8 do do do do
    do4. do8 do do do do
    do4 fa8 do mi[sol] la sol

    %52
    sol do sib[la] sol fa mi[re]\mbreak
    do do' sib[la] sol fa mi[re]
    do do4 fa8 sol do,4 fa8

    %55
    sol do,4 fa8 sol sib fa[sol]
    do, fa,4 sib8 do fa,4 sib8\mbreak
    do sib la [re] do do4 fa8

    %58
    fa4 fa fa (mi8.-+) fa16
    fa4 r8 fa mib[do] r mib
    re sib r sib fa'4 re

    %61
    do4. fa,8 do' do4 re8\mbreak
    sol, fa4 fa8 do' do4 re8
    sol,4 r re'2

    %64
    do r
    r4 do mi sol
    fa2 r4 sol8. re16

    %67
    mi8. do16 fa4 fa(mi8.-+) fa16
    fa2

}

Ifgn = \relative do {

   fa1
   mi
   re

   %4
   do
   sib
   la

   %7
   sib4 sol do do,
   fa2 r
   R1*3

   %12
   r4 sol'8 sol sol sol sol la
   sib2. sib4
   la si-+ do fa,

   %15
   sol2 r4 do8 do
   do2 si-+
   do2 do8 sib la-+ sol do2 r

   %18
   R1*2
   r8 fa, fa[fa] mi do do[do]
   fa4. fa8 mi do' re,[si']

   %22
   do,4. mi8 fa[mi] re do
   sol' do4 do8 si[do] si la\mbreak
   sol do do do si do si[la]

   %25
   sol4 r16 do do do do sol sol sol sol[mi mi mi]
   mi8 do la'[fa] sol4 sol,
   do2 r8 do do[do]

   %28
   fa fa fa fa sib4 sib,
   la r r8 re' dod[re]\mbreak
   la4 r r8 re dod[re]

   %31
   la4 r16 re re re re[la la la] la fa fa fa
   fa8 re sib'[sol] la4 la,
   re2 \clef tenor \key fa\major sol'2

   %34
   fad sol
   \clef bass \key fa \major re4. re,8 sol4 r
   \clef tenor \key fa\major r2 fa'\mbreak

   %37
   mi fa
   do4 \clef bass \key fa\major r8 do, fa4 r8 fa
   sib[la16 sib] sol8 sol do4 r8 la

   %40
   re[do16 re] sib8 sib fa'4 fa,
   do'4 r r8 fa mi fa
   do4 r r8 fa mi fa\mbreak

   %43
   do4 r16 fa fa fa fa[do do do] do la la la
   la8 fa re'[sib] do4 do,
   fa,8 fa' mi16[re do sib] la sol la sib la[sib do la]

   %46
   sib sib do re mi[fa sol la] sib la sol fa mi[re do sib]
   la la sib do re[mi fa sol] la sol fa mi re[do sib la]\mbreak
   sol sol la sib do[re mi fa] sol[fa mi re] do sib la sol

   %49
   fa8 fa fa fa do' do do do
   fa fa, fa fa do' do do do
   fa4  fa' mi re

   %52
   do8 do sib[la] sol fa mi[re]\mbreak
   do do' sib[la] sol[fa] mi re
   do fa mi[re] do fa mi[re]

   %55
   do[fa] mi re do[sib] la sol
   fa sib la[sol] fa sib la[sol]\mbreak
   fa sol la[sib] do[re] mi fa

   %58
   re4 sib do do,
   fa r8 fa' do16 re do re mib8[mib]
   re8[re] la4 sib do8 fa

   %61
   do8 fa fa fa mi fa mi[re]
   do fa fa fa mi[fa] mi re
   do4 r si'2

   %64
   do r
   r4 fa mi2
   re r4 sol,8. sib16

   %67
   do,4 sib do do,
   fa1

}

Ibcn = \relative do {

   fa1
   mi
   re

   %4
   do
   sib
   la

   %7
   sib4 sol do do,
   fa2 r
   R1*3

   %12
   r4 do'8 do do do do do
   sol2. sol4
   re'2 la'4 fa

   %15
   sol sol8 sol mi mi do do
   sol4 sol'8 sol sol4 sol,
   do2 do'8 sib la-+ sol do,2 r

   %18
   R1*2
   r8 fa fa[fa] mi do do[do]
   fa4. fa8 mi do' re,[si']

   %22
   do,4. mi8 fa[mi] re do
   sol' do4 do8 si[do] si la\mbreak
   sol do do do si do si[la]

   %25
   sol4 r16 do do do do sol sol sol sol[mi mi mi]
   mi8 do la'[fa] sol4 sol,
   do2 r8 do do[do]

   %28
   fa fa fa fa sib4 sib,
   la r r8 re' dod[re]\mbreak
   la4 r r8 re dod[re]

   %31
   la4 r16 re re re re[la la la] la fa fa fa
   fa8 re sib'[sol] la4 la,
   re8 re' re re re,2~

   %34
   re~re
   r8 re, re[re] sol4. sol8
   do2~do~\mbreak

   %37
   do~do
   r8 do do[do] fa4 r8 fa
   sib[la16 sib] sol8 sol do4 r8 la

   %40
   re[do16 re] sib8 sib fa'4 fa,
   do'4 r r8 fa mi fa
   do4 r r8 fa mi fa\mbreak

   %43
   do4 r16 fa fa fa fa[do do do] do la la la
   la8 fa re'[sib] do4 do,
   fa,8 fa' mi16[re do sib] la sol la sib la[sib do la]

   %46
   sib sib do re mi[fa sol la] sib la sol fa mi[re do sib]
   la la sib do re[mi fa sol] la sol fa mi re[do sib la]\mbreak
   sol sol la sib do[re mi fa] sol[fa mi re] do sib la sol

   %49
   fa8 fa fa fa do' do do do
   fa fa, fa fa do' do do do
   fa4  fa' mi re

   %52
   do8 do sib[la] sol fa mi[re]\mbreak
   do do' sib[la] sol[fa] mi re
   do fa mi[re] do fa mi[re]

   %55
   do[fa] mi re do[sib] la sol
   fa sib la[sol] fa sib la[sol]\mbreak
   fa sol la[sib] do[re] mi fa

   %58
   re4 sib do do,
   fa r8 fa' do16 re do re mib8[mib]
   re8[re] la4 sib do8 fa

   %61
   do8 fa fa fa mi fa mi[re]
   do fa fa fa mi[fa] mi re
   do4 r sol2

   %64
   do r
   r4 fa' mi2
   re r4 sol,8. sib16

   %67
   do,4 sib do do,
   fa1

}

Ibfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \tempo 1 = 40
    \repeat volta 2 {s1*16}
   \alternative {{s1}{s}}\break
   \set Score.currentBarNumber = #18
   \tempo 2 = 57
   \time 2/2
    \once \override Staff.TimeSignature.style = #'single-digit
    s1*45\break
    \tempo 2 = 45
    \time 2/2
    s1*6
    \bar "|."

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


IvlaI = {
    \Iglobal
    <<\IvlaIn \forma>>
}


IvlaII = {
    \Iglobal
    <<\IvlaIIn \forma>>
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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

IIvlIn = \relative do'' {

    la2 la
    sib2. sib4
    la-+ la8 sib do4 re

    %4
    sol,2-+ sol
    do re4. mi8
    \grace mi8 fa2. fa4

    %7
    re-+ re8 mi16(fa) mi4.-+ fa8
    \grace fa sol4. re8 mib4 re8 do
    si4-+ sol do4. do8

    %10
    re4 mi? fa4. sol8
    mi1-+
    do4 re do %%% Gai

    %13
    sib4.-+ la8 sol[la]
    sib4 do sib
    la4.-+ sol8 fa4

    %16
    la8[do] sib la sol fa
    la do sib la sol fa
    fa'4 re4.-+ sol8

    %19
    mi4.-+ re8 do4
    do re do
    sib4.-+ la8 sol[la]

    %22
    sib4 do sib
    la4.-+ sol8 fa4
    la8 do sib la sol fa

    %25
    sib la do sib re4~\mbreak
    re8 sol mi4.-+ fa8
    fa2.

    %28
    do4 fa la
    sol4.-+ fa8 mi[fa]
    sol-+ fa sol la sib sol

    %31
    \appoggiatura sol la2 \appoggiatura sol8 fa4
    fa la do
    sib4.-+ la8 sol[sib]

    %34
    la do sib la sol fa
    do'2.
    sol4^\markup\italic"Hautbois et I.ers Violons" la sol

    %37
    fa4.-+ mi8 re [mi]
    fa4 sol fa
    mi4.-+ re8 do4

    %40
    mi8\tu sol fa mi re[do]\mbreak
    mi sol fa mi re do
    re mi16(fa) re4.-+ do8

    %43
    do4.^\markup\italic "Hb. et Viol[ons]"_\dolce sib8(la)([sib)]
    do4 re do
    sib4.-+ la8 sol[la]

    %46
    sib4 do sib
    la4.-+ sol8 fa4
    la8\f ^\markup\italic"[Tous]"do sib la sol fa

    %49
    la do sib la sol fa
    fa'4 re4.-+ sol8
    mi4.-+ re8 do4

    %52
    do re do
    sib4.-+ la8 sol[la]
    sib4 do sib\mbreak

    %55
    la4.-+ sol8 fa4
    la8 do sib la sol fa
    sib la do sib re4~

    %58
    re8 sol mi4.-+ fa8
    fa2.
    R

    %61
    r8 la,^\markup\italic "Viol[ons]" re[re fa fa]
    mi2 r4
    r8 la, mi'[mi sol sol]

    %64
    fa4 re\tu mi-+
    fa re mi-+
    fa8 la sol fa mi re

    %67
    la'2.
    sib8 sib la la sol sol \mbreak
    fa[fa] mi mi re re

    %70
    la4 re dod-+
    re2.
    la'4 la8 la la la

    %73
    sib4 sib8[sib] la la
    re,4 sol fad-+
    sol2 sol,4

    %76
    sol' sol8 sol sol sol
    la4 la8 la sol sol
    do,4 fa mi-+

    %79
    fa4. sol8^\markup\italic"Viol[ons] et Haut[bois]" la[sib]
    do4 la8(sib) sib-+[la16(sib)]
    do4 la8(sib) sib-+[la16\parentSlur (sib)]\mbreak

    %82
    do4 sib-+ la
    sol2-+ la8 fa
    sol2-+ la8 fa

    %85
    sol2-+ sib8 la
    sol4 mi-+ fa
    do2.~

    %88
    do4.^\markup\italic "Viol[ons]"_\dolce sib8(la sib)
    do4 re do
    sib4.-+ la8 sol[la]

    %91
    sib4 do sib
    la4.-+ sol8 fa4
    la8\f\tu do sib la sol fa

    %94
    la do sib la sol fa\mbreak
    fa'4 re4.-+ sol8
    mi4.-+ re8 do4

    %97
    do re do
    sib4.-+ la8 sol[la]
    sib4 do sib

    %100
    la4.-+ sol8 fa4
    la8 do sib la sol fa
    sib la do sib re4~

    %103
    re8 sol mi4.-+ fa8
    fa2.

}

IIvlIIn = \relative do'' {

    la2 la
    sib2. sib4
    la-+ la8 sib do4 re

    %4
    sol,2-+ sol
    do re4. mi8
    \grace mi8 fa2. fa4

    %7
    re-+ re8 mi16(fa) mi4.-+ fa8
    \grace fa sol4. re8 mib4 re8 do
    si4-+ sol do4. do8

    %10
    re4 mi? fa4. sol8
    mi1-+
    do4 re do %%% Gai

    %13
    sib4.-+ la8 sol[la]
    sib4 do sib
    la4.-+ sol8 fa4

    %16
    la8[do] sib la sol fa
    la do sib la sol fa
    fa'4 re4.-+ sol8

    %19
    mi4.-+ re8 do4
    do re do
    sib4.-+ la8 sol[la]

    %22
    sib4 do sib
    la4.-+ sol8 fa4
    la8 do sib la sol fa

    %25
    sib la do sib re4~\mbreak
    re8 sol mi4.-+ fa8
    fa2.

    %28
    do4 fa la
    sol4.-+ fa8 mi[fa]
    sol-+ fa sol la sib sol

    %31
    \appoggiatura sol la2 \appoggiatura sol8 fa4
    fa la do
    sib4.-+ la8 sol[sib]

    %34
    la do sib la sol fa
    do'2.
    sol4^\markup\italic"Hautbois [seuls]" la sol

    %37
    fa4.-+ mi8 re [mi]
    fa4 sol fa
    mi4.-+ re8 do4

    %40
    mi8\tu sol fa mi re[do]\mbreak
    mi sol fa mi re do
    re mi16(fa) re4.-+ do8

    %43
    do4.^\markup\italic "Hb. [seuls]"_\dolce sib8(la)([sib)]
    do4 re do
    sib4.-+ la8 sol[la]

    %46
    sib4 do sib
    la4.-+ sol8 fa4
    la8\f ^\markup\italic"[Tous]"do sib la sol fa

    %49
    la do sib la sol fa
    fa'4 re4.-+ sol8
    mi4.-+ re8 do4

    %52
    do re do
    sib4.-+ la8 sol[la]
    sib4 do sib\mbreak

    %55
    la4.-+ sol8 fa4
    la8 do sib la sol fa
    sib la do sib re4~

    %58
    re8 sol mi4.-+ fa8
    fa2.
    la,4^\markup\italic"Hautbois" la8 la la la

    %61
    la2 r4
    la la8 la la la
    la2 r4

    %64
    r4 re\tu mi-+
    fa re mi-+
    fa8 la sol fa mi re

    %67
    la'2.
    sib8 sib la la sol sol \mbreak
    fa[fa] mi mi re re

    %70
    la4 re dod-+
    re2.
    fad4 fad8 fad fad fad

    %73
    sol4 sol8 sol re[re]
    sib4 do la-+
    sib sol'8 sol sib sib

    %76
    mi,4 mi8 mi mi mi
    fa4 fa8 fa do[do]
    la4 sib sol-+

    %79
    la2 fa'8^\markup\italic "2.es Viol[ons]"  sol
    la4 fa8(sol) sol-+[fa16 (sol)]
    la4 fa8(sol) sol-+[fa16 (sol)]\mbreak

    %82
    la4 sol-+ fa
    do2 fa,4
    do'2 fa,4

    %85
    do'2.~
    do2 sib8 la
    sol4 mi-+ fa

    %88
    do2 r4
    do'4^\markup\italic "[Violons doux]" re do
    sib4.-+ la8 sol[la]

    %91
    sib4 do sib
    la4.-+ sol8 fa4
    la8\f\tu do sib la sol fa

    %94
    la do sib la sol fa\mbreak
    fa'4 re4.-+ sol8
    mi4.-+ re8 do4

    %97
    do re do
    sib4.-+ la8 sol[la]
    sib4 do sib

    %100
    la4.-+ sol8 fa4
    la8 do sib la sol fa
    sib la do sib re4~

    %103
    re8 sol mi4.-+ fa8
    fa2.

}

IIvlaIn = \relative do'' {

    fa,2 fa
    fa2. re4
    do fa la \appoggiatura sol8 fa4

    %4
    mi2-+ sol
    la si4. dod8
    re2. re4

    %7
    si sol sol2
    sol sol4 sol8 fa
    sol4 si8 re sol,4. mi'8

    %10
    si4 do do4. si8
    do1\mbreak
    la4 sib la

    %13
    sol4.-+ fa8 mi[fa]
    sol4 do, mi-+
    fa2 la8 sol

    %16
    fa la sol fa do4
    r8 la'\noBeam sol fa do'[sib]
    la(si) si4.-+ la16(si)

    %19
    do4. sol8 do[sib]
    la4 sib la
    sol4.-+ fa8 mi[fa]

    %22
    sol4 do, mi-+
    fa2 r4
    fa2 r4

    %25
    r la sib\mbreak
    re do4. sib8
    la2.

    %28
    R2.*8
    mi'4 fa mi
    re4.-+ do8 si[do]

    %38
    re4 sol, si-+
    do2 r4
    do2 r4\mbreak

    %41
    sol2 do4
    do si4.-+ do8
    do2 r4

    %44
    R2.*4
    fa,2 r4
    do2 r4

    %50
    la' sol2
    sol r4
    la sib la

    %53
    sol4.-+ fa8 mi[fa]
    sol4 do, mi-+
    fa2 r4

    %56
    fa2 r4
    r la sib\mbreak
    re do4. sib8

    %59
    la2.
    R
    r4 r re,

    %62
    la'2 r4
    r mi' dod-+
    re la dod-+

    %65
    re la dod-+
    re la re
    dod-+ la8 la dod dod

    %68
    mi,4 fa dod\mbreak
    re mi fa
    la sol mi

    %71
    fa2.
    re'
    re,~

    %74
    re2 re4
    re2 r4
    do'2.

    %77
    do,~
    do2 do4
    do2 r4

    %80
    R2.*13
    fa8 la sol fa do4
    r8 la'\noBeam sol fa do' sib\mbreak

    %95
    la(si) si4.-+ la16(si)
    do4. mi,8 fa[sol]
    la4 sib la

    %98
    sol4.-+ fa8 mi[fa]
    sol4 do, mi-+
    fa2 r4

    %101
    fa2 r4
    r la sib\mbreak
    re do4. sib8

    %104
    la2.-+

}

IIvlaIIn = \relative do'' {

    do,2 do
    re2. fa4
    fa do fa re

    %4
    do2 mi
    fa fa4. sol8
    la2. la4

    %7
    sol re mi2
    re4. sol8 mib4 sol8 lab
    re,4 sol8 re mi?4. do8

    %10
    fa4 sol sol2
    sol1\mbreak
    la4 sib la

    %13
    sol4.-+ fa8 mi[fa]
    sol4 do, mi-+
    fa2 do4

    %16
    fa2 do4
    fa2 do4
    la' sol2

    %19
    sol do8 sib
    la4 sib la
    sol4.-+ fa8 mi[fa]

    %22
    sol4 do, mi-+
    fa2 r4
    fa2 do4

    %25
    re mib re\mbreak
    sib' sol4.-+ fa8
    fa2.

    %28
    R2.*8
    mi'4 fa mi
    re4.-+do8 si[do]

    %38
    re4 sol, si-+
    do2 r4
    sol2 r4\mbreak

    %41
    sol2 r4
    la sol4. fa8
    mi2-+ r4

    %44
    R2.*4
    fa2 r4
    do2 r4

    %50
    la' sol2
    sol2 r4
    la4 sib la

    %53
    sol4.-+ fa8 mi[fa]
    sol4 do, mi-+\mbreak
    fa2 r4

    %56
    fa2 do4
    re mib re
    sib' sol4.-+ fa8

    %59
    fa2.
    R
    r4 r re

    %62
    la'2 r4
    r r la
    la2 r4

    %65
    la2 r4
    r la sib
    mi,2.

    %68
    dod8 dod re re mi mi\mbreak
    la,4 do re
    re sib la

    %71
    la2.
    re'
    re,~

    %74
    re2 re4
    re2 r4
    do'2.

    %77
    do,~
    do2 do4
    do2 r4

    %80
    R2.*13
    fa2 do4
    fa2 do4\mbreak

    %95
    la' sol2
    sol4. mi8 fa[sol]
    la4 sib la

    %98
    sol4.-+ fa8 mi[fa]
    sol4 do, mi-+
    fa2 r4

    %101
    fa2 do4
    re mib re
    sib' sol4.-+ fa8

    %104
    fa2.

}

IIcrIn = \relative do' {

    R1*11
    R2.
    r4 sol'8 sol sol sol

    %14
    do,2 r4
    r fa8 fa fa do
    fa2 r4

    %17
    fa,2 r4
    la' sol2
    sol r4

    %20
    R2.
    r4 sol8 sol sol sol
    do,2 r4

    %23
    r4 fa8 fa fa do
    fa2 r4
    fa,2 r4\mbreak

    %26
    r4 do'2
    la r4
    R2.*4

    %32
    do4 fa la
    sol2-+ do,4
    fa la fa

    %35
    do2 r4
    R2.*8
    do'4 re do

    %45
    sib4.-+ la8 sol[la]
    sib4 do sib
    la4.-+ sol8 fa4

    %48
    R2.*4
    do'4 re do
    sib4.-+ la8 sol[la]

    %54
    sib4 do sib\mbreak
    la4.-+ sol8 fa4
    R2.*4

    %60
    la4 la8 la la la
    la2 r4
    la4 la8 la la la

    %63
    la2 r4
    la2 r4
    la2 r4

    %66
    R2.*13
    r4 r la8 sib
    do4 la sib-+

    %81
    do la sib-+\mbreak
    do sib la
    sol2-+ la8 fa

    %84
    sol2-+ la8 fa
    sol2-+ sib8 la
    sol4 mi-+ fa

    %87
    do2.
    R2.*2
    r4 sol'8 sol sol sol

    %91
    do,2 r4
    r4 fa8 fa fa do
    fa2 r4

    %94
    fa,2 r4\mbreak
    la'4 sol2
    sol r4

    %97
    do4 re do
    sib4.-+ la8 sol[la]
    sib4 do sib

    %100
    la4.-+ sol8 fa4
    R2.*2
    r4 do2

    %104
    la2.

}

IIcrIIn = \relative do'' {

    R1*11
    R2.*2
    r4 do,8 do do do

    %15
    fa,2 r4
    fa'2 r4
    fa,2 r4

    %18
    la' sol2
    do, r4
    R2.*2

    %22
    r4 do8 do do do
    fa,2 r4
    fa'2 r4

    %25
    fa,2 r4\mbreak
    r4 do2
    fa r4

    %28
    R2.*4
    do'4 fa la
    sol2-+ do,4

    %34
    fa r fa,
    do'2 r4
    R2.*9

    %45
    r4 sol'8 sol sol sol
    do,4 do8 do do do
    fa,2 r4

    %48
    R2.*5
    r4 sol'8 sol sol sol
    do,2 r4\mbreak

    %55
    r do8 do do do
    fa,2 r4
    R2.*3

    %60
    la'4 la8 la la la
    la2 r4
    la la8 la la la

    %63
    la2 r4
    la2 r4
    la2 r4

    %66
    R2.*13
    r4 r4 fa8 sol
    la4 fa sol-+

    %81
    la fa sol-+\mbreak
    la sol fa
    do2 fa,4

    %84
    do'2 fa,4
    do'2.~
    do~

    %87
    do
    R2.*3
    r4 do8 do do do

    %92
    fa,2 r4
    fa'2 r4
    fa,2 r4

    %95
    la' sol2
    do, r4
    R2.

    %98
    r4 sol'8 sol sol sol
    do,2 r4
    r do8 do do do

    %101
    fa,2 r4
    R2.
    r4 do2

    %104
    fa2.

}

IIfgn = \relative do {

    fa2 mib
    re sib
    fa'  la,4 sib

    %4
    do2 do'8 sib la sol
    fa2 fa4. mi8
    re2. re4

    %7
    sol sol, do2
    si4. si8 do4 sib8 lab
    sol4 sol'8 fa mi?4. mi8

    %10
    re4 do sol2
    do1\mbreak
    \clef tenor \key fa\major r4 r do'

    %13
    re4. mi8 re[fa]
    mi4 re-+ do
    fa2 r4

    %16
    \clef bass \key fa\major fa,2 r4
    fa,2 fa'8 mi
    re4 sol sol,

    %19
    do2 r4
    \clef tenor \key fa\major r4 r do'
    re4. mi8 re[fa]

    %22
    mi4 re-+ do
    fa2 r4
    \clef bass \key fa\major fa,2 mib4

    %25
    re do sib\mbreak
    sol do do,
    fa2.

    %28
    fa''4 la, fa
    do' sib8 la sol fa
    mi4 re-+ do

    %31
    fa2.
    \clef tenor \key fa\major fa'2 r4
    mi2 do4

    %34
    fa mi-+ re
    do2 r4
    mi fa mi

    %37
    re4.-+ do8\noBeam si do
    re4 sol, si-+
    do2 do,4

    %40
    do'8 mi re do sol4\mbreak
    do8 mi re do   \clef bass \key fa\major mi,[sol]
    fa la sol4 sol,

    %43
    do2 r4
    <<{do'4^\markup\italic "I.ers [Bassons]" re do
       sib4.-+ la8\noBeam sol la

       %46
       sib4 do sib
       la4.-+ sol8 fa4}\\{la_\markup\italic "2.es [Bassons]" sib  la
                          sol4.-+ fa8\noBeam mi fa
                          sol4 do, mi-+
                          fa2 fa,4}>>
    r4 la do

    %49
    fa,2 fa'8 sol
    la si si4.-+ la16(si)
    do2 r4

    %52
    \clef tenor \key fa\major r4 r do
    re4. mi8 re[fa]
    mi4 re-+ do\mbreak

    %55
    r8 fa\noBeam do[do] la la
    \clef bass \key fa\major fa2 mib4
    re do sib

    %58
    sol do do,
    fa2.
    R

    %61
    r8 la'\noBeam fa fa re re
    dod4 mi la,
    r8 la'\noBeam dod,8 dod la la

    %64
    re4 fa' mi-+
    re fa mi-+
    re do sib

    %67
    la8 la dod[dod] mi mi
    sol, sol fa fa mi mi\mbreak
    re re do do sib[sib]

    %70
    fa4 sol la
    re,2.
    re''

    %73
    re,~
    re2 re,4
    sol2 r4

    %76
    do'2.
    do,~
    do2 do,4

    %79
    fa2 r4
    R2.*2\mbreak
    \clef tenor \key fa\major fa''4 mi-+ fa

    %83
    do2 fa,4
    \clef bass \key fa\major do'2 fa,4
    do'2.~

    %86
    do2 sib8 la
    sol4 mi-+ fa
    do2 r4

    %89
    \clef tenor \key fa\major r4 r do'
    re4. mi8 re[fa]
    mi4 re-+ do

    %92
    fa2 r4
    \clef bass \key fa\major fa,2 r4
    fa,2 fa'8 mi

    %95
    re4 sol sol,
    do2 r4
    <<{do'4^\markup\italic "[I.ers Bassons]" re do

       %98
       sib4.-+ la8\noBeam sol la
       sib4 do sib
       la4.-+ sol8 fa4}\\{la_\markup\italic "[2.es Bassons]" sib  la
                          sol4.-+ fa8\noBeam mi fa
                          sol4 do, mi-+
                          fa2 fa,4}>>

    %101
    fa'2 mib4
    re do sib
    sol do do,

    %104
    fa2.

}

IIbcn = \relative do {

    fa2 mib
    re sib
    fa'  la,4 sib

    %4
    do2 do'8 sib la sol
    fa2 fa4. mi8
    re2. re4

    %7
    sol sol, do2
    si4. si8 do4 sib8 lab
    sol4 sol'8 fa mi?4. mi8

    %10
    re4 do sol2
    do1\mbreak
    R2.

    %13
    r8 sol'\noBeam sib8 sib sol sol
    do,2 r4
    r8 fa\noBeam do do la la

    %16
    fa2 r4
    fa'2 fa8 mi
    re4 sol sol,

    %19
    do do'8 sib la sol
    fa2 r4
    r8 sol\noBeam sib sib sol sol

    %22
    do,2 r4
    r8 fa\noBeam do do la la
    fa4 fa' mib

    %25
    re do sib\mbreak
    sol do do,
    fa2.

    %28
    R2.*7
    r4 r8 sol'\noBeam la si
    do2 r4

    %37
    r8 re\noBeam fa fa re re
    sol,2 r4
    r8 do\noBeam sol sol mi mi

    %40
    do2 r4\mbreak
    do'2 mi,4
    fa sol sol,

    %43
    do2 r4
    fa2 r4
    r8 sol\noBeam sib sib sol sol

    %46
    do,2 r4
    r8 fa\noBeam do do la la
    fa2 r4

    %49
    fa'2 fa8 mi
    re4 sol sol,
    do do'8 sib la sol

    %52
    fa2 r4
    r8 sol\noBeam sib sib sol sol
    do,2 r4\mbreak

    %55
    r8 fa'\noBeam do do la la
    fa2 mib4
    re do sib

    %58
    sol do do,
    fa2.
    R

    %61
    r8 la'\noBeam fa fa re re
    dod4 mi la,
    r8 la'\noBeam dod,8 dod la la

    %64
    re4 re' la
    re re, la'
    re do sib

    %67
    la8 la dod[dod] mi mi
    sol, sol fa fa mi mi\mbreak
    re re do do sib[sib]

    %70
    fa4 sol la
    re re'8 re re re
    re,2.~

    %73
    re~
    re2 re,4
    sol sol'8 sol sib sib

    %76
    do,2.~
    do~
    do2 do,4

    %79
    fa2 r4
    R2.*10
    r8 sol'\noBeam sib sib sol sol

    %91
    do,2 r4
    r8 fa'\noBeam do do la la
    fa2 r4

    %94
    fa,2 fa'8 mi\mbreak
    re4 sol sol,
    do do'8 sib la sol

    %97
    fa2 r4
    r8 sol\noBeam sib sib sol sol
    do,2 r4

    %100
    r8 fa\noBeam do do la la
    fa4 fa' mib
    re do sib

    %103
    sol do do,
    fa2.

}

IIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 2/2
    \tempo 2 = 50
    s1*11\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -1) \mark\markup\huge "Gai"
    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 60
   \repeat volta 2 { s2.*93}

}


IIvlI = {
    \IIglobal
    %\notypeset
    <<\IIvlIn \forma>>
}


IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>
}


IIvlaI = {
    \IIglobal
    <<\IIvlaIn \forma>>
}


IIvlaII = {
    \IIglobal
    <<\IIvlaIIn \forma>>
}


IIcrI = {
    \IIglobal
    <<\IIcrIn \forma>>
}


IIcrII = {
    \IIglobal
    <<\IIcrIIn \forma>>
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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

IIIvlIn = \relative do'' {

    fa,8 la16 sol fa8 sol la sib
    do4 re mi
    fa8 la16 sol fa8 sol la sib

    %4
    do la4 fa do8
    re fa do fa sib,4-+
    la8 fa4 fa fa8

    %7
    fa4 la' do
    sol,8 sol4 sol sol8\mbreak
    sol4 sol' do

    %10
    re,,8 re'16 do sib8 la sol fa
    do' sib16 la sol la sol fa mi fa mi re
    do8 do'16 do sol'4 r8 do,16 do

    %13
    la'4~la16 sol fa mi fa  mi re dod
    re8 la16 la fa'4 r8 re16 re
    sol4~sol16 fa mi re mi re do si\mbreak

    %16
    do sib? la sol la sol fa mi fa mi re do
    sol'8 sol4\< sol sol8~
    sol sol4 sol sol8~

    %19
    sol sol4 sol sol8\!
    fad\f fad4 fad fad8
    sol4 si re

    %22
    sol si re
    re~re16 do si la sol fa mi re\mbreak
    mi do re mi fa sol la sib? do8. mi,16

    %25
    la8 re, fa[si,] re sol,
    r do16(re) re4.-+ (do16 re)
    do8 <mi do>4\< <mi do> <mi do>8\parentSlur (

    %28
    <mi do>) <sol do,>4 <sol do,> <sol do,>8~
    <sol do,> <do do,>16[<do do,>] <do do,>8 <do do,> <do do,> <do do,>\!
    <do do,>2.

    %31
    do,8 mi16 re do8 re mi fa\mbreak
    sol sib4 sol fa8
    mi sol16 fa mi8 re do sib

    %34
    la do16 do fa4 r8 la,
    sol4 mi'4. \tuplet 5/4 { re32 dod sib la sol }
    fa8 la16 la re4. fa,8

    %37
    mi la dod la mi' la,
    sol'2 r16 sol fa mi
    fa8. re16 mi4 dod\mbreak

    %40
    R2.
    r8 <fa sib,>4 <fa sib,> <fa sib,>8~
    <fa sib,>16 sib la sol fa sol fa mib re mib re do

    %43
    sib8 do16 re mib fa sol la sib4
    r8 <la re,>4 <la re,> <la re,>8~
    <la re,>16 re do sib la sib la sol fa sol fa mi

    %46
    re8 mi16 fa sol la sib do re4\mbreak
    do4 sib4.\prall la8
    sol16 do sib la sol la sol fa mi fa mi re

    %49
    do2.~
    do8 sol'16 sol do4 r8 fa,16 fa
    re'4~re16 do sib la sib la sol fad\mbreak

    %52
    sol8 re16 re sib'4 r8 sol16 sol
    do4~do16 sib la sol la sol fa mi
    fa mi re do re do sib la sib la sol fa

    %55
    do'8 do4\< do do8~
    do do4 do do8\parentSlur (
    do) do4 do do8\!\mbreak

    %58
    si8\f si4 si si8
    <sol do,>4 mi sol
    do mi sol

    %61
    sol~sol16 fa mi re do sib la sol
    la fa sol la sib do re mi fa8. la,16
    re8 sol, sib mi, sol do,

    %64
    r fa'16(sol) sol4.-+(fa16 sol)\mbreak
    fa8 la4 la la8~
    la <do la,>4 <do la,> <do la,>8~

    %67
    <do la,> <fa la,>16 [<fa la,,>] <fa la,,>8 <fa la,,> <fa la,,> <fa la,,>
    <fa la,,>2.

}

IIIvlIIn = \relative do'' {

    fa,8 la16 sol fa8 sol la sib
    do4 re mi
    fa8 la16 sol fa8 sol la sib

    %4
    do la4 fa do8
    re fa do fa sib,4-+
    la8 fa4 fa fa8

    %7
    fa4 la' do
    sol,8 sol4 sol sol8\mbreak
    sol4 sol' do

    %10
    re,,8 re'16 do sib8 la sol fa
    do' sib16 la sol la sol fa mi fa mi re
    do8 do'16 do sol'4 r8 do,16 do

    %13
    la'4~la16 sol fa mi fa  mi re dod
    re8 la16 la fa'4 r8 re16 re
    sol4~sol16 fa mi re mi re do si\mbreak

    %16
    do sib? la sol la sol fa mi fa mi re do
    sol'8 r4 r r8
    fa fa4 fa fa8

    %19
    mi mi4 mi mi8\!
    mib\f mib4 mib mib8
    re4 si' re

    %22
    sol si re
    re~re16 do si la sol fa mi re\mbreak
    mi do re mi fa sol la sib? do8. mi,16

    %25
    la8 re, fa[si,] re sol,
    r do16(re) re4.-+ (do16 re)
    do8 <mi do>4\< <mi do> <mi do>8\parentSlur (

    %28
    <mi do>) <sol do,>4 <sol do,> <sol do,>8~
    <sol do,> <do do,>16[<do do,>] <do do,>8 <do do,> <do do,> <do do,>\!
    <do do,>2.

    %31
    do,8 mi16 re do8 re mi fa\mbreak
    sol sib4 sol fa8
    mi sol16 fa mi8 re do sib

    %34
    la do16 do fa4 r8 la,
    sol4 mi'4. \tuplet 5/4 { re32 dod sib la sol }
    fa8 la16 la re4. fa,8

    %37
    mi la dod la mi' la,
    sol'2 r16 sol fa mi
    fa8. re16 mi4 dod\mbreak

    %40
    R2.
    r8 <fa sib,>4 <fa sib,> <fa sib,>8~
    <fa sib,>16 sib la sol fa sol fa mib re mib re do

    %43
    sib8 do16 re mib fa sol la sib4
    r8 <la re,>4 <la re,> <la re,>8~
    <la re,>16 re do sib la sib la sol fa sol fa mi

    %46
    re8 mi16 fa sol la sib do re4\mbreak
    do4 sib4.\prall la8
    sol16 do sib la sol la sol fa mi fa mi re

    %49
    do2.~
    do8 sol'16 sol do4 r8 fa,16 fa
    re'4~re16 do sib la sib la sol fad\mbreak

    %52
    sol8 re16 re sib'4 r8 sol16 sol
    do4~do16 sib la sol la sol fa mi
    fa mi re do re do sib la sib la sol fa

    %55
    do'8 r4 r r8
    sib sib4 sib sib8
    la la4 la la8\!\mbreak

    %58
    la8\f la4 la la8
    <sol do,>4 mi sol
    do mi sol

    %61
    sol~sol16 fa mi re do sib la sol
    la fa sol la sib do re mi fa8. la,16
    re8 sol, sib mi, sol do,

    %64
    r fa'16(sol) sol4.-+(fa16 sol)\mbreak
    fa8 fa4 fa fa8~
    fa <la do,>4 <la do,> <la do,>8~

    %67
    <la do,> <do la,>16 [<do la,>] <do la,>8 <do la,> <do la,> <do la,>
    <do la,>2.

}

IIIvlaIn = \relative do'' {

    fa,8 fa4 fa fa8~
    fa fa4 fa fa8~
    fa fa4 fa fa8~

    %4
    fa fa4 fa fa8
    sib4 la sol
    fa8 fa4 fa fa8

    %7
    fa r r4 r
    mi8 mi4 mi mi8\mbreak
    mi r r4 r

    %10
    re8 re'16 do sib8 la sol fa
    do'8 sib16  la sol la sol fa mi fa mi re
    do4 r8 sol'16 sol do4~

    %13
    do~do16 re do si la4~
    la4. re16 re si4~
    si~si16 do si la sol4~\mbreak

    %16
    sol4. la16 sol fa4
    sol,8 r r4 r
    R2.

    %19
    <sol' sol,>8 <sol sol,>4 <sol sol,> <sol sol,>8~
    <sol sol,> <sol sol,>4 <sol sol,> <sol sol,>8
    <sol sol,>r r4 r

    %22
    R2.
    r8 sol16 sol re'2~\mbreak
    re8 sol, do mi, sol4~

    %25
    sol8 la16 sol fa4 r
    r8 sol16 la sol4 sol
    sol8 sol4\< sol sol8~

    %28
    sol do4 do do8~
    do8 mi16 mi mi8 mi mi mi\!
    mi2.

    %31
    R2.
    do,8 mi16 re do8 re mi fa
    sol la sib sol do4

    %34
    r8 do16 sib la8 sib do re
    r mi,16 fa sol8 mi  la4
    r8 la16 sol fa8 sol la sib

    %37
    la, r r4 r
    r4 r r16 la si dod
    re8. la'16 sib4 mi,\mbreak

    %40
    R2.
    r8 <re sib>4 <re sib> <re sib>8~
    <re sib> <re sib>4 <re sib> <re sib>8

    %43
    <re sib>8 <sol sol,>4 <sol sol,> <sol sol,>8
    fa fa4 fa fa8~
    fa fa4 fa fa8~
    fa sib4 sib sib8~\mbreak

    %47
    sib la4 sol fa8
    do'2.~
    do16 do sib la sol la sol fa mi fa mi re

    %50
    do4 do'16 sib la sol la sol fa mi
    re8 fa16 fa re4 r8 fa16 fa\mbreak
    sib4~sib16 la sol fa sol fa mi re

    %53
    do8 sol'16 sol do2~
    do8 re16 do sib la sol fa sol fa mi re
    do4 r r

    %56
    R2.
    <do do,>8 <do do,>4 <do do,> <do do,>8~
    <do do,> <do do,>4 <do do,> <do do,>8~

    %59
    <do do,> r r4 r
    R2.
    r8 sol'16 sol do2~

    %62
    do2.~
    do8 re16 do sib2
    r8 do16 re do4 do~\mbreak

    %65
    do8 fa,4 fa fa8~
    fa fa4 fa fa8~
    fa fa16 fa fa8 fa fa fa

    %68
    fa2.

}

IIIcrIn = %\transpose do fa, {

\relative do'' {
    \key do\major

    mi2.~
    mi~
    mi~

    %4
    mi2 sol4
    fa mi re
    do r r

    %7
    R2.*11
    re2.~
    re\f~

    %20
    re4 r r
    R2.*6
    sol2.~

    %28
    sol~
    sol8 sol16 sol sol8 sol sol sol
    sol2.

    %31
    R2.*10
    r4 do,2~
    do2.~

    %43
    do4 fa2
    mi4 mi2~
    mi2.

    %46
    la\mbreak
    sol4 sol(fa8\prall) mi
    re2.-+~

    %49
    re2 r4
    R2.*7
    sol,2.~\mbreak

    %58
    sol~
    sol4 r r
    R2.*5

    %65
    do2.
    mi~
    mi8 mi16 mi mi8 mi mi mi

    %68
    mi2.

}

%}

IIIcrIIn = %\transpose do fa, {

\relative do'' {
    \key do\major

    do2.~
    do~
    do~

    %4
    do2 mi4
    re do sol
    mi r r

    %7
    R2.*11
    re'2.~
    re\f~

    %20
    re4 r r
    R2.*6
    sol,2.~

    %28
    sol~
    sol8 sol16 sol sol8 sol sol sol
    sol2.

    %31
    R2.*10
    r4 do2~
    do2.~

    %43
    do4 fa2
    do2.~
    do

    %46
    do2 fa4\mbreak
    mi mi(re8\prall) do
    sol2.~

    %49
    sol2 r4
    R2.*7
    sol2.~\mbreak

    %58
    sol~
    sol4 r r
    R2.*5\mbreak

    %65
    do2.~
    do~
    do8 do16 do do8 do do do

    %68
    do2.

}

%}

IIIfgn = \relative do {

    fa'2.~
    fa~
    fa~

    %4
    fa~
    fa2 mi4-+
    fa8 fa, la do la fa

    %7
    fa, r r4 r
    r8 mi' sol do sol mi\mbreak
    mi, r r4 r

    %10
    re'8 re'16 do sib8 la sol fa
    do' sib16 la sol la sol fa mi fa mi re
    do4 sol''2~

    %13
    sol~sol8 la16 sol
    fa2.~
    fa2~ fa8 sol16 fa\mbreak

    %16
    mi4. fa16 mi re4~
    re8 r sol,,2~
    sol2.~

    %19
    sol~
    sol~
    sol8 r r4 r

    %22
    r r r8 re''
    sol2.~\mbreak
    sol~

    %25
    sol4 re r
    r8 do do4 si-+
    do sol2

    %28
    do2.
    mi~
    mi

    %31
    R2.
    do8 mi16 re do8 re mi fa
    sol2.~

    %34
    sol8 fa16 mi fa2~
    fa8 sol16 fa mi2~
    mi8 re16 dod re4. mi8

    %37
    dod4-+ r r
    r r r16 la si dod
    re8. fa,16 sol4 la\mbreak

    %40
    R2.
    \clef bass \key fa\major r4 sib,,2~
    sib2.

    %43
    sol'
    re~
    re

    %46
    sib'\mbreak
    \clef tenor \key fa\major fa''4 mi4.\prall fa8
    do2.~

    %49
    do16 do sib la sol la sol fa mi fa mi re
    do4 r fa'~
    fa~fa16 sol fa mi re4~\mbreak

    %52
    re4~re8 sol16 fa mi4~
    mi~mi16 fa mi re do4~
    do4. re16 do sib4

    %55
    \clef bass \key fa\major r4 do,,2~
    do2.~
    do~\mbreak

    %58
    do~
    do8 r r4 r
    \clef tenor\key fa\major r4 r r8 do''16 do

    %61
    sol'2.~
    sol8 la16 sol fa2~
    fa8 sol16 fa mi4 r

    %64
    r8 fa mi4.-+ fa8\mbreak
    fa2.
    do

    %67
    la
    fa

}

IIIbcn = \relative do {

    fa8 fa4 fa fa8(
    mi) mi4 mi mi8(
    re) re4 re re8

    %4
    la la4 la la8
    sib4 do do,
    fa8 fa'4 fa fa8

    %7
    fa r r4 r
    mi,8 mi'4 mi mi8\mbreak
    mi r r4 r

    %10
    re8 re'16 do sib8 la sol fa
    do' sib16 la sol la sol fa mi fa mi re
    do4 r8 do'16 do mi,8 do'16 do

    %13
    fa,2.~
    fa8 la16 la re,4. re'16 re
    mi,2.~\mbreak

    %16
    mi4 fa2
    sol8 sol4 sol sol8~
    sol sol4 sol sol8~

    %19
    sol <sol sol,>4 <sol sol,> <sol sol,>8~
    <sol sol,> <sol sol,>4 <sol sol,> <sol sol,>8
    <sol sol,> r r4 r

    %22
    r r r8 sol16 sol
    si,2.\mbreak
    do2 r8 mi

    %25
    fa2.
    r8 mi16 fa sol4 sol,
    do'8 do4 do do8~

    %28
    do do,4 do do8
    do do16 do do8 do do do
    do2.

    %31
    R2.*2
    do'8 mi16 re do8 re mi do
    fa, la16 sol fa8 sol la sib

    %35
    do dod4 dod dod8
    re, fa16 mi re8 mi fa sol
    la4 r r

    %38
    r r r16 la si dod
    re8. fa,16 sol4 la\mbreak
    R2.

    %41
    r8 sib,4 sib sib8~
    sib sib4 sib sib8~
    sib sol4 sol sol8

    %44
    re' re4 re re8~
    re re4 re re8~
    re sib4 sib sib8\mbreak

    %47
    fa''4 mi4.\prall fa8
    do2.~
    do16 do sib la sol la sol fa mi fa mi re

    %50
    do8 do16 do la4. fa'16 fa
    sib,2.~\mbreak
    sib8 re16 re sol,4. sol'16 sol

    %53
    la,2.~
    la4 sib2
    do8 do4 do do8~

    %56
    do do4 do do8~
    do <do do,>4 <do do,> <do do,>8~
    <do do,> <do do,>4 <do do,> <do do,>8~

    %59
    <do do,> r r4 r
    r r r8 do'16 do
    mi,2.

    %62
    fa2 r8 la,
    sib2.
    r8 la'16 sib do4 do,\mbreak

    %65
    fa8 fa4 fa fa8~
    fa fa,4 fa fa8~
    fa fa16 fa fa8 fa fa fa

    %68
    fa2.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 43
    s2.*30
    \bar ":..:"\break
    s2.*38
    \bar ":|."

}


IIIvlI = {
    \IIIglobal
    %\notypeset
    <<\IIIvlIn \forma>>
}


IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>
}


IIIvlaI = {
    \IIIglobal
    <<\IIIvlaIn \forma>>
}


IIIcrI = {
    \IIIglobal
    <<\IIIcrIn \forma>>
}



IIIcrII = {
    \IIIglobal
    <<\IIIcrIIn \forma>>
}


IIIfg = {
    \IIIglobal
    \clef tenor
    <<\IIIfgn \forma>>
}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}



IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

IVvlIn = \relative do'' {

    la4 sib8
    do4 do8 do(sib-+) la
    sib4 sib8 sib(la-+) sol
    la sib do sib4\prall la8

    %4
    sol4.-+  la4 sib8
    do4 do8 do(sib-+) la
    sib4 sib8 sib(la-+) sol

    %7
    la(sib do) sol4-+ fa8
    fa4. fa'8_\markup \italic"I.er couplet" (mi) fa
    sol4 sol8 la(sol-+) fa

    %10
    sol4 sol8 la(sol-+) fa
    sol(la sol) fa4\prall mi8
    re4.-+ re4 mi8

    %13
    fa4 fa8 fa(mi-+) re
    mi4 mi8 mi(re-+) do
    re(mi) fa re4-+ do8

    %16
    do4. la4-+ sib8
    do4 do8 do(sib-+) la
    fa'4_\markup\italic "2.e couplet" mi8

    %19
    re4 fa8 mi(re-+) dod
    re4 fa8 mi(fa) sol
    fa(sol fa) mi4\prall re8

    %22
    dod4.-+ la'8(sol la)
    sib4 sib8 sib(la-+) sol
    la4 la8 la(sol-+) fa

    %25
    sol(la sib) mi,4-+ re8
    re4. fa8(mi-+) re
    do4.^\<~do8\!(sib-+) la

}

IVvlIIn = \relative do'' {

    fa,4 sol8
    la4 la8 la(sol-+) fa
    sol4 sol8 sol(fa-+) mi
    fa sol la sol4\prall fa8

    %4
    mi4.-+ fa4 sol8
    la4 la8 la(sol-+) fa
    sol4 sol8 sol(fa-+) mi

    %7
    fa(sol la) mi4-+ fa8
    fa4.\mbreak do'4 re8
    mi4 mi8 fa(mi-+) re

    %10
    mi4 mi8 fa(mi-+) re
    mi(fa mi) re4\prall do8
    si4.-+ si4 do8

    %13
    re4 re8 re(do-+) si
    do4 do8 do(si-+) la
    si(do) re si4-+ do8

    %16
    do4. fa,4 sol8
    la4 la8 la(sol-+) fa\mbreak
    la4 sol8

    %19
    fa4 la8 sol(fa-+) mi
    fa4 la8 sol(la) sib
    la(sib la) sol4\prall fa8

    %22
    mi4.-+ fa'8(mi fad)
    sol4 sol8 sol(fa?-+) mi
    fa4 fa8 fa(mi-+) re

    %25
    mi la, re dod4-+ re8
    re4. fa,4 sol8
    la4.^\<~la8\!(sol-+) fa

}

IVfgn = \relative do {

    <<
        {
            la'4 sib8
            do4 do8 do(sib-+) la
            sib4 sib8 sib \parentSlur (la-+) sol
            la sib do sib4\prall la8

            %4
            sol4.-+ la4 sib8
            do4 do8 do(sib-+) la
            sib4 sib8 sib (la-+) sol

            %7
            la sib do sol4-+ fa8
            fa4.
        }\\{
            fa4 sol8
            la4 la8 la sol fa
            sol4 sol8 sol fa mi
            fa sol la sol4 fa8
            mi4.-+ fa4 sol8
            la4 la8 la(sol-+) fa
            sol4 sol8 sol fa mi
            fa sol la mi4-+ fa8
            fa4.
        }
    >> la8 sol fa
    do'4. r4 r8

    %10
    do,4. r4 r8
    r4 do'8 si4-+ do8
    sol4. sol8 fa mi

    %13
    re4. sol4 sol,8
    do4. do'
    sol4 fa8 sol4 sol,8

    %16
    do4. fa
    r4 r8 fa,4.\mbreak
    re''4 la8

    %19
    sib4 fa8 sol la sol
    fa mi re sib'4 sol8
    re'4 re,8 sol4.

    %22
    la re
    sol, do4 do,8
    fa4. sib

    %25
    sol8 fa sol la4 la,8
    re4. r4 r8
    r4 r8 fa4.

}

IVbcn = \relative do {

    fa4.
    r4 r8 fa,4.
    r4 fa'8 mi4-+ do8
    fa4. mi4-+ fa8

    %4
    do do' sib la4-+ sol8
    fa4. fa,
    r8 sol' fa mi-+ re do

    %7
    fa4 fa,8 do'4 do,8
    fa4. la'8 sol fa
    do'4. r4 r8

    %10
    do,4. r4 r8
    r4 do'8 si4-+ do8
    sol4. sol8 fa mi

    %13
    re4. sol4 sol,8
    do4. do'
    sol4 fa8 sol4 sol,8

    %16
    do4. fa
    r4 r8 fa,4.\mbreak
    re''4 la8

    %19
    sib4 fa8 sol la sol
    fa mi re sib'4 sol8
    re'4 re,8 sol4.

    %22
    la re
    sol, do4 do,8
    fa4. sib

    %25
    sol8 fa sol la4 la,8
    re4. r4 r8
    r4 r8 fa4.

}

IVbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 6/8
    %\override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 50
    \partial 4. s4.
    s2.
    \mark\markup\smaller{\segno}
    s2.*6
    s4. \bar"|."\mark\markup\smaller "Fin"  s
    s2.*9
    \bar "||"
    \mark\markup\smaller{al \segno}
    \set Score.measureLength = #(ly:make-moment 3 8) s4.
    \set Score.measureLength = #(ly:make-moment 6 8) s2.*9
    \bar "||"
    \mark\markup\smaller{al \segno}

}


IVvlI = {
    \IVglobal
    %\notypeset
    <<\IVvlIn \forma>>
}


IVvlII = {
    \IVglobal
    <<\IVvlIIn \forma>>
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
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

VvlIn = \relative do'' {

    do8
    fa, la16 sib do8 fa, fa' la
    la4.(sol4) sol8
    do, mi16 fa sol8 do, sol' sib

    %4
    sib4.(la4) do,8
    re16 fa sol la sib8 do,16 mi fa sol la8
    sib,16 re mi fa sol8 la,16 do re mi fa8\mbreak

    %7
    re8. do16 sib8 la sol fa
    mi16 fa sol fa mi re do4 do'8
    fa, la16 sib do8 fa, fa' la

    %10
    la4.(sol4) sol8
    do, mi16 fa sol8 do, sol' sib
    sib4.(la4) do,8

    %13
    re16 fa sol la sib8 do,16 mi fa sol la8
    sib,16 re mi fa sol8 la,16 do re mi fa8
    sol, sib la sol fa mi

    %16
    fa <fa la,> <fa la,> <fa la,>4 do'8_\markup\italic "I.er couplet"
    re4(do8) re4(do8)
    re <sib' re,> <sib re,> <sib re,>4 sib,8

    %19
    do4(sib8) do4(sib8)
    do <la' do,> <la do,> <la do,>4 la,8\mbreak
    sib4(la8) sib4(la8)

    %22
    sol4. la8\f fa la
    sol mi sol fa la fa
    mi mi mi mi4 do'8

    %25
    do, do'16(re mi8) do mi sol
    sol4.(fa4) re8
    sol, si16 do re8 sol, re' fa

    %28
    fa4.(mi8) mi16 fa sol fa \mbreak
    \once\stemDown mi8 do, do do do'16(re) mi(re)
    do8 do, do do mi16(fa) sol(fa)

    %31
    mi(re) mi(fa) sol(fa) mi(re) mi(fa) sol(fa)
    mi8 mi mi mi4 do'8
    fa_\markup\italic "2.e couplet"

    %34
    sol, mi'16 re mi8 fa, la re
    mi, dod'16 si dod8 re, re' dod\mbreak
    sib? la sol fa mi re

    %37
    dod16 re mi re dod si la4 mi''8^\markup\italic"a demi"
    fa4(mi8) fa4(sold8)
    la la,\f la la4 mi'8^\markup\italic"a demi"

    %40
    fa4(mi8) fa4(sold8)
    la la, \f la la4.
    la16 si dod re mi8 sol,16 si dod re mi8\mbreak

    %43
    fa,16 la si dod re8 mi,16 sol la si dod8
    re, sol fa mi re dod
    re re re re4.

    %46
    <re sib>8 <re sib> <re sib> <re sib> re' sib
    do <la fa> <la fa> <la fa>4.
    <mi do>8 <mi do> <mi do> <mi do> sib' sol

    %49
    la <fa la,> <fa la,> <fa la,>4 mib'8\mbreak
    re(do) mib re(do) mib
    re4.(do4) do8

    %52
    sib la sib la sol la
    \grace la sol2-+ r8 do

}

VvlIIn = \relative do'' {

    do8
    fa, la16 sib do8 fa, do' fa
    fa4.(mi4) sol8
    do, mi16 fa sol8 do, mi sol

    %4
    sol4.(fa4) do8
    re16 fa sol la sib8 do,16 mi fa sol la8
    sib,16 re mi fa sol8 la,16 do re mi fa8\mbreak

    %7
    re8. do16 sib8 la sol fa
    mi16 fa sol fa mi re do4 do'8
    fa, la16 sib do8 fa, do' fa

    %10
    fa4.(mi4) sol8
    do, mi16 fa sol8 do, mi sol
    sol4.(fa4) do8

    %13
    re16 fa sol la sib8 do,16 mi fa sol la8
    sib,16 re mi fa sol8 la,16 do re mi fa8
    sol, sib la sol fa mi

    %16
    fa <fa la,> <fa la,> <fa la,>4 la8
    sib4(la8) sib4(la8)
    sib <sib' re,> <sib re,> <sib re,>4 sol,8

    %19
    la4(sol8) la4(sol8)
    la <la' do,> <la do,> <la do,>4 fa,8\mbreak
    sol4(fa8) sol4(fa8)

    %22
    mi4. do8\f la do
    sib sol sib la do la
    sol sol sol sol4 do'8

    %25
    do,do'16 re mi8 do do mi
    mi4.(re4) re8
    sol, si16 do re8 sol, si re

    %28
    re4.(do8) mi16 fa sol fa\mbreak
    \once\stemDown mi8 do, do do do'16(re) mi(re)
    do8 do, do do do16(re) mi(re)

    %31
    do(si) do(re) mi(re) do(si) do(re) mi(re)
    do8 do do do4 do'8
    fa

    %34
    sol, mi'16 re mi8 fa, la re
    mi, dod'16 si dod8 re, re' dod\mbreak
    sib? la sol fa mi re

    %37
    dod16 re mi re dod si la4 dod'8^\markup\italic"a demi"
    re4 dod8 re4 sib!8
    la la\f la la4 dod8^\markup\italic"a demi"

    %40
    re4(dod8) re4 sib8
    la la\f la la4.
    la16 si dod re mi8 sol,16 si dod re mi8\mbreak

    %43
    fa,16 la si dod re8 mi,16 sol la si dod8
    re, sol fa mi re dod
    re re re re4.

    %46
    <re sib>8 <re sib> <re sib> <re sib> re' sib
    do <la fa> <la fa> <la fa>4.
    <mi do>8 <mi do> <mi do> <mi do> sib' sol

    %49
    la <fa la,> <fa la,> <fa la,>4 do'8\mbreak
    sib(la) do sib(la) do
    sib4.(la4) la8

    %52
    sol fa sol fa mi fa
    \appoggiatura fa mi2-+ r8 do'

}

VvlaIn = \relative do'' {

    r8
    r4 do,8 do4 do8
    do4.~do4 r8
    r4 do8 do4 do8

    %4
    do4.~do4 fa8
    fa4. fa
    mi fa\mbreak

    %7
    fa4 mi8 fa do si
    do4.~do8 mi16 fa sol mi
    fa4 do8 do4 do8

    %10
    do4.~ do4 r8
    r4 do8 do4 do8
    do4.~do4 fa8

    %13
    fa4. fa\mbreak
    mi fa
    re do
    do8 do do do4 fa8

    %17
    sib4 fa8 sib4 fa8
    sib sib, sib sib4 sib8
    fa'4 sib,8 fa'4 sib,8

    %20
    fa' fa fa fa4 fa8\mbreak
    do4 fa8 do4 fa8
    do4. do

    %23
    do do
    do8 do do do4 r8
    r4 r8 r do' do,

    %26
    sol' sol sol sol4 r8
    r4 r8 r sol sol,
    do do do do do'16 re mi re\mbreak

    %29
    do8 mi, mi mi mi16 fa sol fa
    mi8 do do do4.~
    do2.~

    %32
    do8 do do do4 r8
    fa
    fa4 mi8 mi4 re8

    %35
    re4 mi8 fa4 re8\mbreak
    sol fa mi re dod re
    la la la la4 r8

    %38
    R2.
    r8 mi' mi mi4 r8
    R2.

    %41
    r8 mi mi mi4 r8
    mi4. mi\mbreak
    re dod

    %44
    re4 re8 sol fa mi
    fa fa fa fa4.
    fa8 fa fa fa4.

    %47
    fa8 fa fa fa4.
    mi8 mi mi mi sol mi
    fa fa fa fa4 fa8\mbreak

    %50
    fa2.~
    fa2 r8 fa
    do4. fa,

    %53
    do'2 r4

}

VcrIn = %\transpose do fa, {
    \relative do'' {\key do\major

    r8
    R2.
    r8 sol sol sol4.
    R2.

    %4
    r8 sol sol sol4.
    R2.*3
    r8 sol sol sol4.

    %9
    R2.
    r8 sol sol sol4.
    R2.

    %12
    r8 sol sol sol4 do8
    do2.\mbreak
    fa4. mi

    %15
    re8 fa mi re do re
    do do do do4 r8
    R2.

    %18
    r8 do do do4 r8
    R2.
    r8 do do do4 r8\mbreak

    %21
    R2.
    r4 r8 sol' sol sol
    fa fa fa mi mi mi

    %24
    re re re re4.
    R2.
    r8 re re re4 r8

    %27
    R2.
    r8 re re re4 r8\mbreak
    re4. r4 r8

    %30
    re4. r4 r8
    r8 re re re re re
    re re re re4 r8

    %33
    r8
    R2.*5
    r8 mi mi mi4 r8

    %40
    R2.
    r8 mi mi mi4 r8
    mi2.~\mbreak

    %43
    mi~
    mi4.~mi4 re8
    do do do do4.

    %46
    r4 r8 r do re
    mi mi mi mi4.
    r4 r8 r fa re

    %49
    mi mi mi mi4 do8\mbreak
    do2.~
    do2 r8 do

    %52
    sol4. do,
    sol'8 sol sol sol4 r8

}

%}

VcrIIn = %\transpose do fa, {
    \relative do'' {\key do\major

    r8
    R2.
    r8 sol sol sol4.
    R2.

    %4
    r8 sol sol sol4.
    R2.*3
    r8 sol sol sol4.

    %9
    R2.
    r8 sol sol sol4.
    R2.

    %12
    r8 sol sol sol4 do8
    do2.\mbreak
    fa4. mi

    %15
    re8 fa mi re do re
    do sol sol sol4 r8
    R2.

    %18
    r8 do, do do4 r8
    R2.
    r8 do do do4 r8\mbreak

    %21
    R2.
    r4 r8 mi' mi mi
    re re re do do do

    %24
    sol sol sol sol4.
    R2.
    r8 re' re re4 r8

    %27
    R2.
    r8 re re re4 r8\mbreak
    sol,4. r4 r8

    %30
    sol4. r4 r8
    r8 sol sol sol sol sol
    sol sol sol sol4 r8

    %33
    r8
    R2.*5
    r8 mi mi mi4 r8

    %40
    R2.
    r8 mi mi mi4 r8
    mi2.~\mbreak

    %43
    mi~
    mi~
    mi8 mi mi mi4.

    %46
    r4 r8 r do' do
    do do do do4.
    r4 r8 r sol sol

    %49
    sol sol sol sol4 do8\mbreak
    do2.~
    do2 r8 do

    %52
    sol4. do,
    sol'8 sol sol sol4 r8

}

%}

Vbcn = \relative do {

    r8
    r4 fa8\tu la4 fa8
    do' do, do do4 r8
    r4 do'8 mi4 do8

    %4
    fa fa, fa fa la fa
    sib4. la
    sol fa\mbreak

    %7
    sib8. la16 sol8 fa mi re
    do4.~do8 do16 re mi do
    fa4 fa8 la4 fa8

    %10
    do' do, do do4.
    r4 do'8 mi4 do8
    fa fa, fa fa la fa

    %13
    sib4. la
    sol fa
    sib, do

    %16
    fa8 fa, fa fa4 r8
    R2.
    r8 sib sib sib4 r8

    %19
    R2.
    r8 fa' fa fa4 r8\mbreak
    R2.

    %22
    do4. do
    do do
    do8 do do do4 r8

    %25
    r4 r8 r8 do' do,
    sol' sol, sol sol4 r8
    r4 r8 r sol' sol,

    %28
    do do do do4 r8\mbreak
    r8 do do do4 r8
    r do do do4.~

    %31
    do2.
    do8 do do do4 r8
    fa

    %34
    do'4 dod8 re4 re,8
    la' la, sol' fa4 re8\mbreak
    sol fa mi re dod re

    %37
    la' la, la la4 r8
    R2.
    r8 la la la4 r8

    %40
    R2.
    r8 la la la4 r8
    la'4. sol\mbreak

    %43
    fa mi
    re4 re'8 la4 la,8
    re re, re re4.

    %46
    sib''8 sib, sib sib4.
    fa'8 fa, fa fa4 fa'8
    do' do, do do4.

    %49
    fa8 fa, fa fa4.\mbreak
    R2.*3
    r8 do' do do4 r8

}

Vbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 6/8
    \tempo 4. = 65
    \partial 8 s8
    s2.*8
    \mark\markup\smaller{\segno}
    s2.*7
    s4. s4 \bar"|."\mark\markup\smaller "Fin"  s8
    s2.*16
    \bar "||"
    \mark\markup\smaller{al \segno}
    \set Score.measureLength = #(ly:make-moment 1 8) s8
    \set Score.measureLength = #(ly:make-moment 6 8) s2.*20
    \bar "||"
    \mark\markup\smaller{al \segno}

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


VvlaI = {
    \Vglobal
    <<\VvlaIn \forma>>
}


VcrI = {
    \Vglobal
    <<\VcrIn \forma>>
}


VcrII = {
    \Vglobal
    <<\VcrIIn \forma>>
}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset
}



VIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

VIvlIn = \relative do'' {

    do4
    \appoggiatura do16 sib4.-+ do8 \appoggiatura sib16 la4
    \appoggiatura la16 sol4-+ \appoggiatura fa16 mi4 fa
    sib4. do8 sib4

    %4
    la-+ \appoggiatura sol16 fa4 la8 sib
    do4 \appoggiatura sib16 la4 sib8 do
    \appoggiatura do16 re4. mi8 \appoggiatura re16 do4

    %7
    fa mi4.\prall  fa8
    \appoggiatura fa16 sol2 do,4
    \appoggiatura do16 sib4.\prall do8 \appoggiatura sib16 la4\mbreak

    %10
    \appoggiatura la16 sol4\prall \appoggiatura fa16 mi4 fa
    sib4. do8 sib4
    \appoggiatura sib16 la4\prall \appoggiatura sol16 fa4 la8 sib

    %13
    do4 \appoggiatura sib16 la4 sib8 do
    re4. mi8  \appoggiatura re16 do4
    fa \appoggiatura fa16 mi4.-+ fa8

    %16
    fa2 do4_\markup\italic"I.er couplet"
    fa2 mi8 re
    sol2 \appoggiatura fa16 mi4

    %19
    la8(sol) fa[(mi)] re(do)\mbreak
    si4-+ \appoggiatura la16 sol4 do
    do \appoggiatura si16 la4 re

    %22
    re \appoggiatura do16 si4 mi
    do4. re8 si4-+
    do2  fa4_\markup\italic"2.e couplet"

    %25
    \appoggiatura fa16 mi4.-+ fa8 \appoggiatura mi16 re4
    \appoggiatura re16 dod4-+ \appoggiatura sib?16 la4 r8 la
    la4 \appoggiatura sol16 fa4 fa'

    %28
    fa \appoggiatura mi16 re4 r8 mi
    mi4 \appoggiatura re16 dod4 fa
    \appoggiatura mi16 re4.\prall mi8 dod4-+\mbreak

    %31
    \appoggiatura dod16 re2 la8 sib
    do4 sol sol8 la
    sib4 fa fa8 sol

    %34
    la sib do4. sib8
    la4 sol4.-+ fa8
    do'2.~

    %37
    do~
    do2

}

VIvlIIn = \relative do'' {

    la4
    \appoggiatura la16 sol4.-+ la8 \appoggiatura sol16 fa4
    \appoggiatura fa16 mi4 do do
    re8. mi16 mi4.-+(re16 mi)

    %4
    fa2 fa8 sol
    la4 fa sol8 la
    sib2 sib4

    %7
    la sol4. la8
    \appoggiatura fa16 mi2-+ mi4
    fa sol8 la \appoggiatura sol16 fa4\mbreak

    %10
    \appoggiatura fa16 mi4\prall \appoggiatura re16 do4 do
    re8 mi mi4.-+(re16 mi)
    fa2 fa8 sol

    %13
    la4 \appoggiatura sol16 fa4 sol8 la
    sib2 sib4
    la sol4. -+ fa8

    %16
    fa2 la4
    re2 do8 si
    mi2 \appoggiatura re16 do4

    %19
    do8(sib?) la[(sol)] fa(mi)\mbreak
    re4 mi mi
    mi \appoggiatura re16 do4 fa

    %22
    fa \appoggiatura mi16 re4 sol
    mi4. fa8 \appoggiatura mi16 re4
    mi2-+ la4

    %25
    \appoggiatura la16 sol4.-+ la8 \appoggiatura sol16 fa4
    mi2-+ r8 mi
    fa4 \appoggiatura mi16 re4 r8 la'

    %28
    la4 \appoggiatura sol16 fa4 r8 sol8
    sol4 \appoggiatura fa16 mi4 la
    \appoggiatura sol16 fa4. sol8 mi4-+\mbreak

    %31
    fa2 fa8 sol
    la4 mi mi8 fa
    sol4 re re8 mi

    %34
    fa sol la4. sol8
    fa4 do4. fa8
    mi2-+ la4

    %37
    sol8(fa) mi(re) do(sib)
    \appoggiatura sib16 la2-+

}

VIbcn = \relative do' {

    fa4
    \appoggiatura fa16 mi2\prall fa4
    sib,2 la4
    sol do do,

    %4
    fa2 r4
    \clef bass \key fa\major mib2 re8 do
    sib4 sol la

    %7
    fa do'4. fa,8
    do2 \clef alto \key fa\major do''4
    re mi fa\mbreak

    %10
    sib,2 la4
    sol do do,
    fa2 r4

    %13
    \clef bass \key fa\major mib2 re8 do
    sib8 la sol4 la
    fa do' do,

    %16
    fa2 fa'4
    re2 sol4
    mi?2 la8 sol

    %19
    fa2 fa4\mbreak
    sol8(fa) mi(re) do4
    fa2 re4

    %22
    sol2 mi4
    la fa sol
    do,2 re4

    %25
    sol2 sol4
    la2 r8 dod
    re2 re,4

    %28
    sib'2 r8 sol
    la2 fa4
    sib sol la\mbreak

    %31
    re,2 re'4
    la8 sib do4 do,
    sol8 la sib4 sib'

    %34
    fa2 mi4
    fa mi re
    do2 fa'4

    %37
    mi8(re) do(sib) la(sol)
    fa2

}

VIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 50
    \partial 4 s4
    \grace s16 s2.*15
    s2 \bar".|:"\mark\markup\smaller "Fin"  s4
    s2.*7
    s2
    \bar ":..:"
    \mark\markup\smaller\center-column{"Da""capo"}
    s4
    s2.*13
    s2
    \bar ":|."
    \mark\markup\smaller\center-column{"Da""capo"}

}


VIvlI = {
    \VIglobal
    %\notypeset
    <<\VIvlIn \forma>>
}


VIvlII = {
    \VIglobal
    <<\VIvlIIn \forma>>
}

VIbc = {
    \VIglobal
    \clef alto
    <<\VIbcn \forma \VIbfn>>
    \typeset
}



VIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

VIIvlIn = \relative do'' {

    fa,4. fa
    fa4 sib8 sib(la) re
    re(do) fa fa(mi) sol

    %4
    fa, la do fa4 la8
    sol do, sib' sib la-+ sol
    la fa do la fa \once\stemDown la'

    %7
    la(sol) sib sib (la-+ sol)
    la fa16 sol la8 sol do, sib'
    la sib16 la sol fa mi4-+ fa8

    %10
    sol mi do sol mi do\mbreak
    do4. r4 \tuplet 7/4 { fa'32 mi re do sib la sol }
    fa4. fa

    %13
    fa4 sib8 sib(la) re
    re(do) fa fa(mi) sol
    fa, la do fa4 la8

    %16
    la(sol) sib sib \parentSlur (la-+ sol)
    la fa do la fa \once\stemDown la'
    la(sol) sib sib\parentSlur  (la-+ sol)

    %19
    la fa16 sol la8 sol do, sib'\mbreak
    la8 sib16 la sol fa sol8 do, mi-+
    fa do la fa fa fa

    %22
    fa4.-+~fa
    do'\dolce~do
    fa8 mi-+ re mi4-+ fa8

    %25
    sol fa-+ mi fa4 sol8
    la4 sol8 fa4-+ mi8
    re-+ re,\f re re re re

    %28
    re4 r8 r4 r8\mbreak
    r8 mi mi mi mi mi
    mi4 r8 r4 r8

    %31
    r4 mi'8 mi(re) fa
    mi do16 re mi8 re sol, fa'
    mi fa16 mi re do re8 sol, si-+

    %34
    do sol mi do do do
    do4.-+~do
    la'8 sib la re4 fa8

    %37
    la, sib la mi'4 sol8
    la, sib la fa'4 la8
    sol(la) fa mi-+ fa re

    %40
    dod4 r8 r4 mi8
    fa(mi) sol sol(fa) mi
    fa mi16 fa  sol8 sol fa-+ mi\mbreak

    %43
    fa sol16 (fa mi fa) sol8 la16 (sol fa sol)
    la4.~la~
    la8 sib16 la sol fa mi4-+ re8

    %46
    re4. r4 r8
    <sib re,>4. <sib re,>
    <sib re,>4 r8 r4 r8

    %49
    R2.\mbreak
    <<
        {
            la4. la
            la
        }\\{
            fa fa
            fa
        }
    >> r4 r8

    %52
    R2.
    do'8 re do fa4 la8
    do, re do sol'4 sib8

    %55
    do, re do la'4 sol8
    fa sol fa mi fa mi
    re mi re do re do\mbreak

    %58
    sib do la sol4 fa8
    mi4 <mi sol,>8 <mi sol,>4 <mi sol,>8
    <mi sol,>4 r8 r4 r8

    %61
    R2.

}

VIIvlIIn = \relative do'' {

    fa,4. fa
    fa4 sib8 sib(la) re
    re(do) fa fa(mi) sol

    %4
    fa, la do fa4 fa8
    fa mi sol sol fa-+ mi
    fa fa do la fa fa'

    %7
    fa(mi) sol sol(fa-+ mi)
    fa4 fa8 fa mi sol
    do,4 do8 sib4 la8

    %10
    mi mi mi sol mi do\mbreak
    sol4. r4 r8
    fa'4. fa

    %13
    fa4 sib8 sib(la) re
    re(do) fa fa(mi) sol
    fa, la do fa4 fa8

    %16
    fa(mi) sol sol fa-+ mi
    fa fa do la fa fa'
    fa(mi) sol sol fa-+ mi

    %19
    fa4 do8 do do do\mbreak
    do re16 do sib la sib8 do16 sib la sol
    la8 do la fa do do

    %22
    do4.-+~do
    la'\dolce la
    re8 do-+si do4 re8

    %25
    mi re-+ do re4 mi8
    fa4 mi8 re4-+ do8
    si si, si si si si

    %28
    si4 r8 r4 r8\mbreak
    r8 do do do do do
    do4 r8 r4 r8

    %31
    r4 do'8 do(si) re
    do \caesura sol_\markup \italic "alto" sol sol sol sol
    sol4 sol8 fa4 fa8

    %34
    mi sol mi do sol sol
    sol4.~sol\mbreak
    <<{la'8 sib la re4 fa8

       %37
       la, sib la mi'4 sol8
       la, sib la fa'4 la8
       sol(la) fa mi-+ fa re

       %40
       dod4 r8}\\{re,2._\markup\italic "alto"
                  mi-+
                  fa4 la8 re,4.~
                  re sol
                  mi4 r8}>> \caesura r4 dod'8
    re8(dod) mi mi(re) dod
    re dod16 re mi8 mi re-+ dod\mbreak

    %43
    re8 mi16(re dod re) mi8 fa16(mi re mi)
    fa4.~fa~
    fa8 sol16 fa mi re dod4 re8

    %46
    re4. r4 r8
    fa,4.  fa
    fa4 r8 r4 r8

    %49
    R2.
    <<{la4. la
       la}\\{fa fa
             fa}>> r4 r8

    %52
    R2.
    la4. la
    sol r4 r8

    %55
    la4 r8 fa'4 mi8
    re mi re do re do
    sib do sib la sib la\mbreak

    %58
    sol4 fa8 mi4 fa8
    do4 <mi sol,>8 <mi sol,>4 <mi sol,>8
    <mi sol,>4 do'8 do4 do8

    %61
    do4. r4 r8

}

VIIhbIn = \relative do'' {

    fa,4. fa
    fa4 sib8 sib(la) re
    re(do) fa fa(mi) sol

    %4
    fa, la do fa4 la8
    sol do, sib' sib la-+ sol
    do2.-+

    %7
    do
    do8 do do do do do
    do sib16 la sol fa mi4-+ fa8

    %10
    sol mi do sol mi do\mbreak
    do4. r4 \tuplet 7/4 { fa'32 mi re do sib la sol }
    fa4. fa

    %13
    fa4 sib8 sib(la) re
    re(do) fa fa(mi) sol
    fa, la do fa4 la8

    %16
    la(sol) sib sib \parentSlur (la-+ sol)
    do2.
    do

    %19
    do8 fa,16 sol la8 sol do, sib'\mbreak
    la8 sib16 la sol fa sol8 do, mi-+
    fa do la fa fa fa

    %22
    fa4.-+~fa
    R2.*5
    r4 mi'8 mi(re) fa\mbreak

    %29
    fa mi r r4 r8
    r4 sol8 sol(fa) la
    la sol mi mi(re) fa

    %32
    mi do16 re mi8 re sol, fa'
    mi fa16 mi re do re8 sol, si-+

    %34
    do sol mi do do do
    do4.-+~do
    la'8 sib la re4 fa8

    %37
    la, sib la mi'4 sol8
    la, sib la fa'4 la8
    sol(la) fa mi-+ fa re

    %40
    la'4. la
    la~la
    la8 mi16 fa sol8 sol fa-+ mi\mbreak

    %43
    fa sol16 (fa mi fa) sol8 la16 (sol fa sol)
    la4.~la~
    la8 sib16 la sol fa mi4-+ re8

    %46
    re4. r4 r8
    sib4. sib
    sib4 fa8 fa4 sib8

    %49
    sib4 re8 re4 fa8\mbreak
    fa4. r4 r8
    R2.*2

    %53
    do8 re do fa4 la8
    do, re do sol'4 sib8

    %55
    do,4 r8 r4 do'8
    do4 sib8 sib4-+ la8
    la4-+ sol8 sol4-+ fa8\mbreak

    %58
    mi4-+ fa8 sib4 la8
    sol4.-+ r4 r8
    r4 sol8 sol la sol

    %61
    sol4.-+~sol

}

VIIhbIIn = \relative do'' {

    fa,4. fa
    fa4 sib8 sib(la) re
    re(do) fa fa(mi) sol

    %4
    fa, la do fa4 la8
    sol do, sib' sib la-+ sol
    do2.-+

    %7
    do
    do8 do do do do do
    do sib16 la sol fa mi4-+ fa8

    %10
    sol mi do sol mi do\mbreak
    do4. r4 \tuplet 7/4 { fa'32 mi re do sib la sol }
    fa4. fa

    %13
    fa4 sib8 sib(la) re
    re(do) fa fa(mi) sol
    fa, la do fa4 la8

    %16
    la(sol) sib sib \parentSlur (la-+ sol)
    do2.
    do

    %19
    do8 fa,16 sol la8 sol do, sib'\mbreak
    la8 sib16 la sol fa sol8 do, mi-+
    fa do la fa fa fa

    %22
    fa4.-+~fa
    R2.*5
    r4 do'8 do(si) re\mbreak

    %29
    re do r r4 r8
    r4 mi8 mi(re) fa
    fa mi mi mi(re) fa

    %32
    mi do16 re mi8 re sol, fa'
    mi fa16 mi re do re8 sol, si-+

    %34
    do sol mi do do do
    do4.-+~do
    la'8 sib la re4 fa8

    %37
    la, sib la mi'4 sol8
    la, sib la fa'4 la8
    sol(la) fa mi-+ fa re

    %40
    la'4. la
    la~la
    la8 mi16 fa sol8 sol fa-+ mi\mbreak

    %43
    fa sol16 (fa mi fa) sol8 la16 (sol fa sol)
    la4.~la~
    la8 sib16 la sol fa mi4-+ re8

    %46
    re4. r4 r8
    sib4. sib
    sib4 fa8 fa4 sib8

    %49
    sib4 re8 re4 fa8\mbreak
    fa4. r4 r8
    R2.*2

    %53
    do8 re do fa4 la8
    do, re do sol'4 sib8

    %55
    do,4 r8 r4 do'8
    do4 sib8 sib4-+ la8
    la4-+ sol8 sol4-+ fa8\mbreak

    %58
    mi4-+ fa8 sib4 la8
    sol4.-+ r4 r8
    r4 mi8 mi fa mi

    %61
    mi4.-+~mi

}

VIIcrIn = \relative do' {

    R2.*3
    do4. do
    do2.

    %6
    do8 do do do do do
    do4. r4 r8
    do4. do

    %9
    do r4 r8
    R2.*5
    do4. do

    %16
    do8 do do do do do
    do4 r8 r4 r8
    R2.

    %19
    r4 do8 do4 do8\mbreak
    do4 do8 do do do
    do la la la fa fa

    %22
    fa4.-+ ~ fa
    R2.*4
    r4 sol'8 sol4 sol8

    %28
    sol4 r8 r4 r8\mbreak
    r4 do8 do4 do8
    do4 r8 r4 r8

    %31
    R2.
    sol4. sol
    sol8 sol sol sol sol sol

    %34
    sol4 do,8 do4 do8
    do4.-+~do
    R2.*15

    %51
    r4 do8 do4 fa8
    fa4 la8 la4 do8
    do2.~

    %54
    do
    do4 r8 r4 r8
    R2.*3

    %59
    r4 do,8 do4 do8
    do4 r8 r4 r8
    R2.

}

VIIfgn = \relative do {

    R2.
    fa4 re'8 re do sib
    <<
        {
            sib la la la sol sib
            la4.-+~la4 fa8
        }\\{
            fa4. fa
            fa fa4 fa8
        }
    >>

    %5
    do4. r4 r8
    r4 fa8 la4 fa8
    do'4. r4 r8

    %8
    fa,4 fa8 do'4 do,8
    fa8 sol la sol4-+ fa8
    do do do mi mi mi\mbreak

    %11
    mi4.-+ r4 r8
    R2.
    <<
        {
            fa4 re'8 re do sib
            sib la la la sol sib
        }\\{
            fa4. fa
            fa~fa
        }
    >>

    %15
    la4-+ fa8 la4 fa8
    do'4 do,8 do4 do8
    r4 la'8 la4 fa8

    %18
    do'4.~do
    fa,,4 fa'8 mi4 do8\mbreak
    fa4 fa8 do'4 do,8

    %21
    fa fa fa fa la la
    la4.~la
    fa\dolce fa

    %24
    re4 sol8 sol4 fa8
    mi4 la8 la4 sol8
    fa4 do'8 si4 do8

    %27
    r8 sol sol sol sol sol
    sol4 r8 r4 r8\mbreak
    r8 sol sol sol sol sol

    %30
    sol4 r8 r4 r8
    r4 sol8 sol4 sol8
    sol4 do8 sol4 sol,8

    %33
    do4 do8 sol'4 sol,8
    do4. mi8 mi mi
    mi4.-+~mi

    %36
    re'2.
    mi
    fa4. r4 fa,8

    %39
    sib4 la8 sol4 sib8
    la4. r4 r8
    R2.*2\mbreak

    %43
    re8 re re sib sib sib
    fa4 la8 re fa fa,
    sib4 r8 la4 la,8

    %46
    re4. r4 r8
    sib'4. sib
    sib4 r8 r4 r8

    %49
    R2.\mbreak
    do4. do
    do r4 r8

    %52
    R2.
    la4. r4 r8
    mi4. r4 r8

    %55
    fa4. r4 r8
    R2.*3
    r4 <<{do8 mi4 sol8
    do4}\\{do,8 do4 do8
           do4}>>r8 r4 r8

    %61
    R2.

}

VIIbcn = \relative do {

    R2.
    fa4. fa
    fa, fa

    %4
    fa fa
    do' r4 r8
    fa,4. fa

    %7
    do r4 r8
    fa'4 fa8 do'4 do,8
    fa sol la sol4-+ fa8

    %10
    do do do do, do do\mbreak
    do4. r4 r8
    R2.

    %13
    fa'4. fa
    fa, fa
    fa~fa

    %16
    do~do
    r4 fa'8 fa4 fa8
    do4.~do

    %19
    fa,4 fa8 do'4 do8\mbreak
    fa4. do
    fa,8 fa fa fa fa fa

    %22
    fa4. ~ fa
    fa'\dolce fa
    re4 sol8 sol4 fa8

    %25
    mi4 la8 la4 sol8
    fa4 do'8 si4 do8
    sol sol, sol sol sol sol

    %28
    sol4 r8 r4 r8\mbreak
    r8 do do do do do
    do4 r8 r4 r8

    %31
    r4 do8 sol'4 sol,8
    do4 do8 sol'4 sol,8
    do4. sol

    %34
    do,8 do do do do do
    do4.~do
    re'2.

    %37
    dod
    re
    sol,4 la8 sib4 sol8

    %40
    la4. r4 r8
    R2.*2\mbreak
    re'8 re re sib sib sib

    %44
    fa4 fa8 fa4 re8
    sol4 r8 la4 la,8
    re,4. r4 r8

    %47
    sib'4. sib
    sib4 r8 r4 r8
    R2.\mbreak

    %50
    la4. la
    la r4 r8
    R2.

    %53
    la'4. r4 r8
    mi4. r4 r8
    fa4. r4 r8

    %56
    R2.*3
    r4 do,8 do4 do8
    do4 r8 r4 r8

    %61
    R2.

}

VIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {
    \time 6/8
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 45
    s2.*22
    \bar".|:"\mark\markup\smaller "Fin"
    s2.*13
    \bar ":..:"
    \mark\markup\smaller\center-column{"Da""capo"}
    s2.*26
    \bar ":|."
    \mark\markup\smaller\center-column{"Da""capo"}

}


VIIvlI = {
    \VIIglobal
    %\notypeset
    <<\VIIvlIn \forma>>
}


VIIvlII = {
    \VIIglobal
    <<\VIIvlIIn \forma>>
}


VIIhbI = {
    \VIIglobal
    <<\VIIhbIn \forma>>
}


VIIhbII = {
    \VIIglobal
    <<\VIIhbIIn \forma>>
}


VIIcrI = {
    \VIIglobal
    \clef alto
    <<\VIIcrIn \forma>>
}


VIIfg = {
    \VIIglobal
    \clef bass
    <<\VIIfgn \forma>>
}

VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
    \typeset
}



VIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

VIIIvlIn = \relative do'' {

    r4 do8 sib la-+ sol
    sib4 sib la
    sol\prall  mi-+ fa4~

    %4
    fa8 sol \appoggiatura sol16 la4. sib8
    la4-+ do8 sib la-+ sol
    sib4 sib la

    %7
    sol\prall mi-+ fa~
    fa8 sol sol4.-+ fa8
    fa4 do' re8 mib

    %10
    re4-+ re mi-+\mbreak
    fa \appoggiatura mi16 re4 sol~
    sol8 la mi4.-+ fa8

    %13
    sol4 do, re8 mib
    re4-+ re mi?-+
    fa4. sib8 la4-+~

    %16
    la8 sol sol4.-+ fa8
    fa8. la16 sol8. fa16 sol8. mi16
    fa8. la16 sol8. fa16 sol8. mi16

    %19
    fa8. la16 sol8. fa16 mi8. re16\mbreak
    do8. re16 sib4.-+(la16 sib)
    la8. la'16 sol8. fa16 sol8. mi16

    %22
    fa8. la16 sol8. fa16 sol8. mi16
    fa8. la16 sol8. fa16 mi8. re16
    do8. re16 sib4.-+(la16 sib)

    %25
    la4-+ la8\dolce sol la sib
    la4-+ sol la8 sib
    do4 mi,-+ fa~\mbreak

    %28
    fa8 sol \appoggiatura sol16 la4. sib8
    la4-+ la8 sol la sib
    la4-+ sol la8 sib

    %31
    do4 mi,-+ fa~
    fa8 sol sol4.-+ fa8
    fa4 la4.\f re8

    %34
    re4. mi8 \appoggiatura re16 do4
    r fa4. sol8
    mi4. re8 do4

    %37
    r la4. re8\mbreak
    re4. mi8 \appoggiatura re16 do4
    r fa4. sol8

    %40
    mi4.-+ re8 do4
    r8 la' fa8. mi16 re8. do16
    sib8. sib'16 sol8. fa16 mi8. re16

    %43
    do8. do'16 do8. sib16 la8. re16
    re8. do16 sib4.-+ (la16 sib)
    la8. la16 fa8. mi16 re8. do16\mbreak

    %46
    sib8. sib'16 sol8. fa16 mi8. re16
    do8. do'16 do8. sib16 la8 sib16 (do)
    sib8.-+ la16 sol4.-+ fa8

    %49
    fa4 do8\dolce(sib) do(mib)
    re(do) re(sib) do(mib)
    re(do) re(sib) do(mib)

    %52
    re4 mi?4. -+fa8
    sol4 do,8(sib) do(mib)
    re(do) re(sib) do(mib)\mbreak

    %55
    re_\markup\italic "I.er Violon" (do) re(sib) do(mib)
    re4 mi?4. -+ fa8
    sol4 sol\f sol

    %58
    sol4. la8 sol[la]
    sib4. la8 sol4~
    sol8 la la4.-+ sol8

    %61
    sol4 sol sol
    sol8 [fa] sol la sol la
    sib4 sol-+ la~

    %64
    la8 sib sol4.-+ fa8
    fa [do do do] fa mi16 fa\mbreak
    do16\tu re mi fa sol fa sol la sol fa mi re

    %67
    do8 do la'[la la la]
    la sib16 la sol fa mi re do sib la sol
    fa8 [do' do do] fa mi16 fa

    %70
    do re mi fa sol fa sol la sol fa mi re
    do8 do la'[la la la]
    la sib16 la sol fa mi re do sib la sol

    %73
    fa(do') fa(do) fa(do) fa(do) fa,(do') fa(do)
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do'(fa,) do'(fa,)

    %76
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) la,(fa') la (fa)
    re(la') fa'(la,) fa'(la,) fa'(la,) re,(si') fa'(si,)\mbreak

    %79
    <sol do,> (do) mi(do) mi(do) mi(do) <sol do,> (do) mi(do)
    sol,(si') re(si) re(si) re(si) sol,(si') re(si)
    <sol do,> (do) mi(do) mi(do) mi(do) <sol do,> (do) mi(do)

    %82
    sol,(si') re(si) re(si) re(si) sol,(si') re(si)
    <sol do,> (do) mi(do) mi(do) mi(do) <sol do,> (do) mi(do)
    sib,(sol') re'(sol,) re'(sol,) re'(sol,) sib,(sol') re'(sol,) \mbreak

    %85
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do'(fa,) do'(fa,)

    %88
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do(fa) la(fa)
    sib,(fa') sib(fa)  sib(fa)  sib(fa) sib,(fa') sib(fa)\mbreak

    %91
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)
    sib,(fa') re'(fa,) re'(fa,) re'(fa,) sib,(sol') mi'(sol,)
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)

    %94
    sib,(fa') re'(fa,) re'(fa,) re'(fa,) sol(sib) mi(sib)
    re,((la') fa'(la,) fa'(la,) fa'(la,) <fa' la, re,>8[r16 do]
    sib8.-+ la16 sol4.-+ fa8\mbreak

    %97
    fa16 do' re mi fa do re mi fa sol la fa
    sol fa mi re do re mi fa sol la sib sol
    la8 sib16 la sol la sib la sol la sol fa

    %100
    mi4.-+ re8 do4
    r16 do re mi fa do re mi fa sol la fa
    sol fa mi re do re mi fa sol la sib sol\mbreak

    %103
    la8 sib16 la sol la sib la sol la sol fa
    mi4.-+ re8 do4
    r8 fa,-. fa-.[do'-.] do8.-+(sib32 do)

    %106
    re8. re16 re4. mi16 fa
    do8. do16 do4. sib16 la\mbreak
    sib8. sib16 sib4.-+(la16 sib)

    %109
    la8. do16 do4.-+(sib16 do)
    re8. re16 re4.-+(do16 re)
    mi2 fa4~

    %112
    fa8 sol sol4.-+ fa8
    fa4

}

VIIIvlIIn = \relative do'' {

    r4 do8 sib la-+ sol
    sib4 sib la
    sol\prall  mi-+ fa4~

    %4
    fa8 sol \appoggiatura sol16 la4. sib8
    la4-+ do8 sib la-+ sol
    sib4 sib la

    %7
    sol\prall mi-+ fa~
    fa8 sol sol4.-+ fa8
    fa4 do' re8 mib

    %10
    re4-+ re mi-+\mbreak
    fa \appoggiatura mi16 re4 sol~
    sol8 la mi4.-+ fa8

    %13
    sol4 do, re8 mib
    re4-+ re mi?-+
    fa4. sib8 la4-+~

    %16
    la8 sol sol4.-+ fa8
    fa8. la16 sol8. fa16 sol8. mi16
    fa8. la16 sol8. fa16 sol8. mi16

    %19
    fa8. la16 sol8. fa16 mi8. re16\mbreak
    do8. re16 sib4.-+(la16 sib)
    la8. la'16 sol8. fa16 sol8. mi16

    %22
    fa8. la16 sol8. fa16 sol8. mi16
    fa8. la16 sol8. fa16 mi8. re16
    do8. re16 sib4.-+(la16 sib)

    %25
    la4-+ la8\dolce sol la sib
    la4-+ sol la8 sib
    do4 mi,-+ fa~\mbreak

    %28
    fa8 sol \appoggiatura sol16 la4. sib8
    la4-+ la8 sol la sib
    la4-+ sol la8 sib

    %31
    do4 mi,-+ fa~
    fa8 sol sol4.-+ fa8
    fa4 la4.\f re8

    %34
    re4. mi8 \appoggiatura re16 do4
    r fa4. sol8
    mi4. re8 do4

    %37
    r la4. re8\mbreak
    re4. mi8 \appoggiatura re16 do4
    r fa4. sol8

    %40
    mi4.-+ re8 do4
    r8 la' fa8. mi16 re8. do16
    sib8. sib'16 sol8. fa16 mi8. re16

    %43
    do8. do'16 do8. sib16 la8. re16
    re8. do16 sib4.-+ (la16 sib)
    la8. la16 fa8. mi16 re8. do16\mbreak

    %46
    sib8. sib'16 sol8. fa16 mi8. re16
    do8. do'16 do8. sib16 la8 sib16 (do)
    sib8.-+ la16 sol4.-+ fa8

    %49
    fa4 do8\dolce(sib) do(mib)
    re(do) re(sib) do(mib)
    re(do) re(sib) do(mib)

    %52
    re4 mi?4. -+fa8
    sol4 do,8(sib) do(mib)
    re(do) re(sib) do(mib)\mbreak

    %55
    re_\markup\italic "2.e Violon" (do) re(sib) do(mib)
    re4 mi?4. -+ fa8
    sol4 mi\f mi

    %58
    mi4. fa8 mi[fa]
    sol4. fa8 mi4~
    mi8 fa fa4.-+ mi8

    %61
    mi2 r4
    do8 re mib[re mib fa]
    re4-+ mi?-+ fa~

    %64
    fa8 sol mi4.-+ fa8
    fa [do do do] fa mi16 fa\mbreak
    do16\tu re mi fa sol fa sol la sol fa mi re

    %67
    do8 do la'[la la la]
    la sib16 la sol fa mi re do sib la sol
    fa8 [do' do do] fa mi16 fa

    %70
    do re mi fa sol fa sol la sol fa mi re
    do8 do la'[la la la]
    la sib16 la sol fa mi re do sib la sol

    %73
    fa(do') fa(do) fa(do) fa(do) fa,(do') fa(do)
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do'(fa,) do'(fa,)

    %76
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) la,(fa') la (fa)
    re(la') fa'(la,) fa'(la,) fa'(la,) re,(si') fa'(si,)\mbreak

    %79
    <sol do,> (do) mi(do) mi(do) mi(do) <sol do,> (do) mi(do)
    sol,(si') re(si) re(si) re(si) sol,(si') re(si)
    <sol do,> (do) mi(do) mi(do) mi(do) <sol do,> (do) mi(do)

    %82
    sol,(si') re(si) re(si) re(si) sol,(si') re(si)
    <sol do,> (do) mi(do) mi(do) mi(do) <sol do,> (do) mi(do)
    sib,(sol') re'(sol,) re'(sol,) re'(sol,) sib,(sol') re'(sol,) \mbreak

    %85
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do'(fa,) do'(fa,)

    %88
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do(fa) la(fa)
    sib,(fa') sib(fa)  sib(fa)  sib(fa) sib,(fa') sib(fa)\mbreak

    %91
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)
    sib,(fa') re'(fa,) re'(fa,) re'(fa,) sib,(sol') mi'(sol,)
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)

    %94
    sib,(fa') re'(fa,) re'(fa,) re'(fa,) sol(sib) mi(sib)
    re,((la') fa'(la,) fa'(la,) fa'(la,) <fa' la, re,>8[r16 do]
    sib8.-+ la16 sol4.-+ fa8\mbreak

    %97
    fa16 do' re mi fa do re mi fa sol la fa
    sol fa mi re do re mi fa sol la sib sol
    la8 sib16 la sol la sib la sol la sol fa

    %100
    mi4.-+ re8 do4
    r16 do re mi fa do re mi fa sol la fa
    sol fa mi re do re mi fa sol la sib sol\mbreak

    %103
    la8 sib16 la sol la sib la sol la sol fa
    mi4.-+ re8 do4
    r8 fa,-. fa-.[do'-.] do8.-+(sib32 do)

    %106
    re8. re16 re4. mi16 fa
    do8. do16 do4. sib16 la\mbreak
    sib8. sib16 sib4.-+(la16 sib)

    %109
    la8. do16 do4.-+(sib16 do)
    re8. re16 re4.-+(do16 re)
    mi2 fa4~

    %112
    fa8 sol sol4.-+ fa8
    fa4

}

VIIIhbIn = \relative do'' {

    r4 do8 sib la-+ sol
    sib4 sib la
    sol\prall  mi-+ fa4~

    %4
    fa8 sol \appoggiatura sol16 la4. sib8
    la4-+ do8 sib la-+ sol
    sib4 sib la

    %7
    sol\prall mi-+ fa~
    fa8 sol sol4.-+ fa8
    fa4 do' re8 mib

    %10
    re4-+ re mi-+\mbreak
    fa \appoggiatura mi16 re4 sol~
    sol8 la mi4.-+ fa8

    %13
    sol4 do, re8 mib
    re4-+ re mi?-+
    fa4. sib8 la4-+~

    %16
    la8 sol sol4.-+ fa8
    fa8. la16 sol8. fa16 sol8. mi16
    fa8. la16 sol8. fa16 sol8. mi16

    %19
    fa8. la16 sol8. fa16 mi8. re16\mbreak
    do8. re16 sib4.-+(la16 sib)
    la8. la'16 sol8. fa16 sol8. mi16

    %22
    fa8. la16 sol8. fa16 sol8. mi16
    fa8. la16 sol8. fa16 mi8. re16
    do8. re16 sib4.-+(la16 sib)

    %25
    la4-+ la8\dolce sol la sib
    la4-+ sol la8 sib
    do4 mi,-+ fa~\mbreak

    %28
    fa8 sol \appoggiatura sol16 la4. sib8
    la4-+ la8 sol la sib
    la4-+ sol la8 sib

    %31
    do4 mi,-+ fa~
    fa8 sol sol4.-+ fa8
    fa4 la4.\f re8

    %34
    re4. mi8 \appoggiatura re16 do4
    r fa4. sol8
    mi4. re8 do4

    %37
    r la4. re8\mbreak
    re4. mi8 \appoggiatura re16 do4
    r fa4. sol8

    %40
    mi4.-+ re8 do4
    r8 la' fa8. mi16 re8. do16
    sib8. sib'16 sol8. fa16 mi8. re16

    %43
    do8. do'16 do8. sib16 la8. re16
    re8. do16 sib4.-+ (la16 sib)
    la8. la16 fa8. mi16 re8. do16\mbreak

    %46
    sib8. sib'16 sol8. fa16 mi8. re16
    do8. do'16 do8. sib16 la8 sib16 (do)
    sib8.-+ la16 sol4.-+ fa8

    %49
    fa4 do8\dolce(sib) do(mib)
    re(do) re(sib) do(mib)
    re(do) re(sib) do(mib)

    %52
    re4 mi?4. -+fa8
    sol4 do,8(sib) do(mib)
    re(do) re(sib) do(mib)\mbreak

    %55
    re_\markup\italic "[I.er] Hautbois" (do) re(sib) do(mib)
    re4 mi?4. -+ fa8
    sol4 sol\f sol

    %58
    sol4. la8 sol[la]
    sib4. la8 sol4~
    sol8 la la4.-+ sol8

    %61
    sol4 sol sol
    sol8 [fa] sol la sol la
    sib4 sol-+ la~

    %64
    la8 sib sol4.-+ fa8
    fa [do do do] fa mi16 fa\mbreak
    do16 re mi fa sol fa sol la sol fa mi re

    %67
    do8 do la'[la la la]
    la sib16 la sol fa mi re do sib la sol
    fa8 [do' do do] fa mi16 fa

    %70
    do re mi fa sol fa sol la sol fa mi re
    do8 do la'[la la la]
    la sib16 la sol fa mi re do sib la sol

    %73
    fa4 la do
    sib-+ \appoggiatura la16 sol4 sib
    la-+ la do

    %76
    sib-+ \appoggiatura la16 sol4 sib
    la-+ \appoggiatura sol16 fa4 la
    do fa4. sol8\mbreak

    %79
    mi4-+ mi sol
    fa-+ \appoggiatura mi16 re4 fa
    mi-+ mi sol

    %82
    fa-+ \appoggiatura mi16 re4 fa
    mi-+ do do-+
    re re \appoggiatura do16 sib4\mbreak

    %85
    r do la-+
    sib  \appoggiatura la16 sol4 sib
    la-+ la do

    %88
    sib-+ \appoggiatura la16 sol4 sib
    la-+\appoggiatura sol16 fa2
    fa'2.~\mbreak

    %91
    fa~
    fa~
    fa~

    %94
    fa~
    fa2 r8 do
    sib8.-+ la16 sol4.-+ fa8\mbreak

    %97
    fa16 do' re mi fa do re mi fa sol la fa
    sol fa mi re do re mi fa sol la sib sol
    la8 sib16 la sol la sib la sol la sol fa

    %100
    mi4.-+ re8 do4
    r16 do re mi fa do re mi fa sol la fa
    sol fa mi re do re mi fa sol la sib sol\mbreak

    %103
    la8 sib16 la sol la sib la sol la sol fa
    mi4.-+ re8 do4
    r8 fa,-. fa-.[do'-.] do8.-+(sib32 do)

    %106
    re8. re16 re4. mi16 fa
    do8. do16 do4. sib16 la\mbreak
    sib8. sib16 sib4.-+(la16 sib)

    %109
    la8. do16 do4.-+(sib16 do)
    re8. re16 re4.-+(do16 re)
    mi2 fa4~

    %112
    fa8 sol sol4.-+ fa8
    fa4

}

VIIIhbIIn = \relative do'' {

    r4 do8 sib la-+ sol
    sib4 sib la
    sol\prall  mi-+ fa4~

    %4
    fa8 sol \appoggiatura sol16 la4. sib8
    la4-+ do8 sib la-+ sol
    sib4 sib la

    %7
    sol\prall mi-+ fa~
    fa8 sol sol4.-+ fa8
    fa4 do' re8 mib

    %10
    re4-+ re mi-+\mbreak
    fa \appoggiatura mi16 re4 sol~
    sol8 la mi4.-+ fa8

    %13
    sol4 do, re8 mib
    re4-+ re mi?-+
    fa4. sib8 la4-+~

    %16
    la8 sol sol4.-+ fa8
    fa8. la16 sol8. fa16 sol8. mi16
    fa8. la16 sol8. fa16 sol8. mi16

    %19
    fa8. la16 sol8. fa16 mi8. re16\mbreak
    do8. re16 sib4.-+(la16 sib)
    la8. la'16 sol8. fa16 sol8. mi16

    %22
    fa8. la16 sol8. fa16 sol8. mi16
    fa8. la16 sol8. fa16 mi8. re16
    do8. re16 sib4.-+(la16 sib)

    %25
    la4-+ la8\dolce sol la sib
    la4-+ sol la8 sib
    do4 mi,-+ fa~\mbreak

    %28
    fa8 sol \appoggiatura sol16 la4. sib8
    la4-+ la8 sol la sib
    la4-+ sol la8 sib

    %31
    do4 mi,-+ fa~
    fa8 sol sol4.-+ fa8
    fa4 la4.\f re8

    %34
    re4. mi8 \appoggiatura re16 do4
    r fa4. sol8
    mi4. re8 do4

    %37
    r la4. re8\mbreak
    re4. mi8 \appoggiatura re16 do4
    r fa4. sol8

    %40
    mi4.-+ re8 do4
    r8 la' fa8. mi16 re8. do16
    sib8. sib'16 sol8. fa16 mi8. re16

    %43
    do8. do'16 do8. sib16 la8. re16
    re8. do16 sib4.-+ (la16 sib)
    la8. la16 fa8. mi16 re8. do16\mbreak

    %46
    sib8. sib'16 sol8. fa16 mi8. re16
    do8. do'16 do8. sib16 la8 sib16 (do)
    sib8.-+ la16 sol4.-+ fa8

    %49
    fa4 do8\dolce(sib) do(mib)
    re(do) re(sib) do(mib)
    re(do) re(sib) do(mib)

    %52
    re4 mi?4. -+fa8
    sol4 do,8(sib) do(mib)
    re(do) re(sib) do(mib)\mbreak

    %55
    re_\markup\italic "[2.e] Hautbois" (do) re(sib) do(mib)
    re4 mi?4. -+ fa8
    sol4 mi\f mi

    %58
    mi4. fa8 mi[fa]
    sol4. fa8 mi4~
    mi8 fa fa4.-+ mi8

    %61
    mi2 r4
    do8 re mib[re mib fa]
    re4-+ mi?-+ fa~

    %64
    fa8 sol mi4.-+ fa8
    fa [do do do] fa mi16 fa\mbreak
    do16 re mi fa sol fa sol la sol fa mi re

    %67
    do8 do la'[la la la]
    la sib16 la sol fa mi re do sib la sol
    fa8 [do' do do] fa mi16 fa

    %70
    do re mi fa sol fa sol la sol fa mi re
    do8 do la'[la la la]
    la sib16 la sol fa mi re do sib la sol

    %73
    fa4 la do
    sib-+ \appoggiatura la16 sol4 sib
    la-+ la do

    %76
    sib-+ \appoggiatura la16 sol4 sib
    la-+ \appoggiatura sol16 fa4 la
    do fa4. sol8\mbreak

    %79
    mi4-+ mi sol
    fa-+ \appoggiatura mi16 re4 fa
    mi-+ mi sol

    %82
    fa-+ \appoggiatura mi16 re4 fa
    mi-+ do do-+
    re re \appoggiatura do16 sib4\mbreak

    %85
    r do la-+
    sib  \appoggiatura la16 sol4 sib
    la-+ la do

    %88
    sib-+ \appoggiatura la16 sol4 sib
    la-+\appoggiatura sol16 fa2
    sib2.\mbreak

    %91
    do
    re2 mi4
    do2.

    %94
    re2 mi4-+
    fa2 r8 do
    sib8.-+ la16 sol4.-+ fa8\mbreak

    %97
    fa16 do' re mi fa do re mi fa sol la fa
    sol fa mi re do re mi fa sol la sib sol
    la8 sib16 la sol la sib la sol la sol fa

    %100
    mi4.-+ re8 do4
    r16 do re mi fa do re mi fa sol la fa
    sol fa mi re do re mi fa sol la sib sol\mbreak

    %103
    la8 sib16 la sol la sib la sol la sol fa
    mi4.-+ re8 do4
    r8 fa,-. fa-.[do'-.] do8.-+(sib32 do)

    %106
    re8. re16 re4. mi16 fa
    do8. do16 do4. sib16 la\mbreak
    sib8. sib16 sib4.-+(la16 sib)

    %109
    la8. do16 do4.-+(sib16 do)
    re8. re16 re4.-+(do16 re)
    mi2 fa4~

    %112
    fa8 sol sol4.-+ fa8
    fa4

}

VIIIvlaIn = \relative do'' {

    r4 r la8 do
    fa,4 sol fa
    mi-+ sol do,

    %4
    fa fa mi-+
    fa2 la8 do
    fa,4 sol fa

    %7
    mi sol do,~
    do8 fa mi4.-+ fa8
    fa4 la sib8 do

    %10
    fa,4 fa sib\mbreak
    la2 re4
    si-+ do4. do8

    %13
    do2 do4
    do fa, sib
    la sol fa~

    %16
    fa mi4.-+ fa8
    fa4 la sol-+
    fa la sol-+

    %19
    fa2 r8 sol\mbreak
    la8 fa mi4.-+(re16 mi)
    fa4 la sol-+

    %22
    fa la sol-+
    fa2 r8 sol
    la fa mi2-+

    %25
    fa4 fa sol
    fa mi fa8 sol
    sol4 la fa~\mbreak

    %28
    fa fa mi-+
    fa fa sol
    fa mi fa8 sol

    %31
    sol4 la fa~
    fa mi4.-+ fa8
    fa2 la4

    %34
    sol2.
    la2 si8-+ la16(si)
    do4. sol8 do[sib?]

    %37
    la4.-+ sol8 fa4\mbreak
    sol2.
    la2 si8-+ la16(si)

    %40
    do2 r4
    r do2
    r4 sib2

    %43
    r4 la fa'~
    fa fa mi-+
    fa do2\mbreak

    %46
    r4 sib2
    r8 la la[sol] fa sol16(la)
    sol8-+ fa mi4.-+ fa8

    %49
    fa2 fa4
    fa2 fa4
    fa2 fa4

    %52
    fa sib4. la8
    mi4-+ do' la-+
    sib2 la4\mbreak

    %55
    sib2 la8 do
    fa,4 sib4. la8
    mi4 do' do

    %58
    do2.
    do~
    do4 do2

    %61
    do r4
    R2.*3
    r4 r la\mbreak

    %66
    sol2 mi4
    fa2 fa4
    fa fa mi-+

    %69
    fa4. la8 do[la]
    sol2 mi4
    fa2 fa4

    %72
    fa fa mi-+\mbreak
    fa2.
    sol

    %75
    fa
    sol2 mi4
    fa2.

    %78
    la4 sol2\mbreak
    sol2.
    sol

    %81
    sol
    sol
    sol

    %84
    sib\mbreak
    fa
    mi

    %87
    fa
    sol2 mi4-+
    fa2.

    %90
    fa\mbreak
    fa
    fa2 sol4

    %93
    la2 do4
    fa,2 sib4
    la2 r8 la

    %96
    sol-+ fa mi4.-+ fa8\mbreak
    fa2 la4
    sol2 mi4-+

    %99
    fa sol sol
    sol4. fa8 mi4-+
    r fa la

    %102
    sol2 mi4\mbreak
    fa sol sol
    sol4. fa8 mi4-+

    %105
    r fa la
    r sib sol
    r la fa\mbreak

    %108
    r sol mi-+
    fa2 fa4
    fa2 sol4

    %111
    sol2 la4
    re do4. sib8
    la4

}

VIIIvlaIIn = \relative do'' {

    r4 r fa,8 do
    re4 do do
    do2 do4

    %4
    re do4. do8
    do2 fa8 do
    re4 do do

    %7
    do2 do4
    re do4. sib8
    la2 do4

    %10
    do sib re\mbreak
    re2 re4~
    re do4. la'8

    %13
    mi4 sol fa
    fa re sol
    fa sol do,

    %16
    r do4. sib8
    la4 r do
    do r do

    %19
    do2 r8 sib\mbreak
    fa'8 re do2
    do do4

    %22
    do r do
    do2 r8 sib
    fa' re do2

    %25
    do4 do do
    do do do8 sol
    la4 do la\mbreak

    %28
    re do4. do8
    do4 do do
    do do do8 sol

    %31
    la4 do la
    re do4.  sib8
    la2 do8 re

    %34
    mi2 do4
    fa2 re4
    sol4. fa8 mi4-+

    %37
    r fa do8 re\mbreak
    mi2 sol4
    fa4. mi8 re4

    %40
    sol2 do,4
    r la'2
    r4 sol2

    %43
    r4 fa2
    re4 do2
    do4 la'2\mbreak

    %46
    r4 sol2
    r4 fa4. do8
    re4 do4. sib8

    %49
    la2 la4
    sib2 la4
    sib2 la4

    %52
    sib do4. do8
    do2 fa4
    fa2 fa4\mbreak

    %55
    fa2 do4
    sib do4. do8
    do4 do' do

    %58
    do2.
    do~
    do4 do2

    %61
    do r4
    R2.*3
    r4 r do,\mbreak

    %66
    mi2 sol4
    r8 do,\noBeam fa la, sib[do]
    re4 do2

    %69
    do do4
    mi2 sol4
    r8 do,\noBeam fa la, sib[do]

    %62
    re4 do4. sib8\mbreak
    la2.
    sol2 do4

    %65
    do2.
    do
    do

    %68
    la4 re sol,\mbreak
    do2 mi4
    re2.

    %71
    do
    re
    do

    %74
    sol'\mbreak
    la
    do,

    %77
    do
    do
    do

    %80
    re\mbreak
    do2 fa4
    re2 sol,4

    %83
    do2.
    sib2 sol'4
    fa2 r8 do

    %86
    re4 do4. sib8\mbreak
    la2 fa'4
    do2 do4

    %89
    do do si
    do2 do8 sib?
    la2 fa'4

    %92
    do2 do4\mbreak
    do do si
    do2 do4

    %95
    r do fa
    fa re sib
    do8. fa16 fa4. do8\mbreak

    %98
    re4 do4. do8
    do2 do4
    sib2 si4

    %101
    do2 do4~
    do8 fa mi4.-+ fa8
    fa4

}

VIIIcrIn = %\transpose do fa, {
    \relative do'' { \key do\major

    R2.*16
    r4 r re
    do r re

    %19
    do r r\mbreak
    r4 sol2
    mi4 do re'

    %22
    do r re
    do r r
    r sol2

    %25
    sol4 r r
    R2.*3
    r4 mi'8 re mi fa

    %30
    mi4-+ re mi8 fa
    sol4 sol, do~
    do8 re re4.-+ do8

    %33
    do2 r4
    R2.*7
    r4 sol'2

    %42
    r4 fa2
    r4 mi2
    do4 sol2

    %45
    sol4 sol'2\mbreak
    r4 fa2
    r4 mi2

    %48
    do4 sol2
    mi r4
    R2.*7

    %57
    r4 sol'4 sol
    sol2.~
    sol~

    %60
    sol4 do,2
    sol r4
    R2.*3

    %65
    r4 r mi'\mbreak
    re2 sol,4
    r do2

    %68
    r4 sol2
    mi4 do mi'
    re2 sol,4

    %71
    r do2
    r4 sol2\mbreak
    do,4 do'2

    %74
    sol2.
    do,4 do'2
    sol2.

    %77
    do,
    mi'4 re2\mbreak
    sol,2.

    %80
    re'
    sol,
    re'

    %83
    sol,
    R2.*3
    sol2.

    %88
    R
    sol
    do\mbreak

    %91
    do~
    do
    do

    %94
    do2 fa4
    mi2 r8 sol
    fa mi re4.-+ do8\mbreak

    %97
    do2 r4
    R2.*15
    r4

}

%}

VIIIcrIIn = %\transpose do fa, {
    \relative do'' { \key do\major

    R2.*16
    r4 r  sol
    do, r sol'

    %19
    do, r r\mbreak
    r sol2
    do4 r sol'

    %22
    do, r sol'
    do, r r
    r sol2

    %25
    do4 r r
    R2.*3
    r4 do' sol

    %30
    r sol sol
    r sol do,~
    do sol2

    %33
    do r4
    R2.*7
    r4 mi'2

    %42
    r4 re2
    r4 do2
    r4 sol2

    %45
    do,4 mi'2\mbreak
    r4 re2
    r4 do2

    %48
    r4 sol2
    do, r4
    R2.*7

    %57
    r4 sol'' sol
    sol2.\parentSlur (
    sol)~

    %60
    sol4 do,2
    sol r4
    R2.*3

    %65
    r4 r do\mbreak
    sol2 sol4
    r do,2

    %68
    r4 sol'2
    do,2 do'4
    sol2 sol4

    %71
    r do,2
    r4 sol'2\mbreak
    do,4 do'2

    %74
    sol2.
    do,
    sol

    %77
    do
    mi'4 re2\mbreak
    sol,2.

    %80
    re'
    sol,
    re'

    %83
    sol,
    R2.*2
    sol2.

    %87
    do,
    sol
    do

    %90
    do'\mbreak
    do~
    do

    %93
    do
    do2 sol4
    do2 r8 mi

    %96
    re do sol2\mbreak
    do, r4
    R2.*15

    %113
    r4

}

%}

VIIIfgn = \relative do {

    r4 r fa8 mi
    re4 mi fa
    sib,2 la4

    %4
    sib do do,
    fa2 fa'8 mi
    re4 mi fa

    %7
    sib, sib' la
    sib-+ do do,
    fa la, fa

    %10
    sib sib' sol\mbreak
    re'8 mi re do si4
    sol do fa,

    %13
    do do8 sib la4
    sib sib' sol
    re mi fa

    %16
    sib, do do,
    fa r sol'
    la r sib

    %19
    la2 r8 sib\mbreak
    la8 sib do4 do,
    fa2 sol4

    %22
    la r sib
    la2 r8 sib
    la sib do4 do,

    %25
    fa fa\dolce mi
    fa do do8 sib
    la2 re4\mbreak

    %28
    sib do do,
    fa fa' mi
    fa do do8 sib

    %31
    la2 re4
    sib do2
    fa,4 fa'2\f

    %34
    mi2.
    re
    do4. re8 mi[do]

    %37
    fa2.\mbreak
    mi
    re

    %40
    do4. sib8\noBeam la sol
    fa4 fa'2
    r4 sol2

    %43
    r4 la2
    sib4 do do,
    fa fa,2\mbreak

    %46
    r4 sol2
    r4 la2
    sib4 do do,

    %49
    fa2 fa'4\dolce
    sib,2 fa'4
    sib,2 fa'4

    %52
    sib8 la sol4.-+ fa8
    do'2 fa,4
    sib,2 fa'4\mbreak

    %55
    sib,2 fa'4
    sib8 la sol4.-+ fa8
    do'4 do\f do

    %58
    do2.
    do
    do,4 fa fa,

    %61
    do'2 r4
    r do' do
    sol2 re'4

    %64
    sib do do,
    fa2 fa4\mbreak
    mi2 do4

    %67
    la'8-. sol-. fa-.[mi-. re-. do-.]
    sib4 do4. sib8
    la sol fa4 fa'

    %70
    mi2 do4
    la'8-. sol-. fa-.[mi-. re-. do-.]
    sib4 do do,\mbreak

    %73
    fa4 la' do
    sib-+ \appoggiatura la16 sol4 sib
    la-+ la do

    %76
    sib-+ \appoggiatura  la16 sol4 sib
    la-+ \appoggiatura sol16 fa4 la~
    la8 si si4.-+(la16 si)\mbreak

    %79
    do4 \clef tenor \key fa\major mi sol
    fa-+ \appoggiatura mi16 re4 fa
    mi-+ mi sol

    %82
    fa-+ \appoggiatura mi16 re4 fa
    mi-+ do do-+
    re re \appoggiatura do16 sib4\mbreak

    %85
    r4 do la-+
    sib \appoggiatura la16 sol4 sib
    la-+ la do

    %88
    sib \appoggiatura la16 sol4 sib
    la-+ \appoggiatura sol16 fa4 la-+
    sib2.\mbreak

    %91
    do
    re2 mi4
    do2.

    %94
    re2 mi4-+
    fa2 \clef bass \key fa\major r8 la,,
    sib4 do do,\mbreak

    %97
    fa2 fa'4
    mi2 do4
    fa mi re

    %100
    do8 re16 mi fa sol la sib do8 do,
    fa,2 fa'4
    mi2 do4\mbreak

    %103
    fa mi re
    do16 sol la sib do sib do re do re do sib
    la la' do sib la sol fa mi re do sib la

    %106
    sib sib' re do sib la sol fa mi re do sib
    la la' do sib la sol fa mi re do sib la\mbreak
    sol sol' sib la sol fa mi re do sib la sol

    %109
    \once\stemUp fa la' do sib la sol fa mi re do sib la
    sib sib' re mib re do sib la sol fa mi re
    do sol' la sib do re do sib la fa sol la

    %112
    sib sol la sib do8 sib do[do,]
    fa4

}

VIIIbcn = \relative do {

    r4 r fa8 mi
    re4 mi fa
    sib,2 la4

    %4
    sib do do,
    fa2 fa'8 mi
    re4 mi fa

    %7
    sib, sib' la
    sib-+ do do,
    fa la, fa

    %10
    sib sib' sol\mbreak
    re'8 mi re do si4
    sol do fa,

    %13
    do do8 sib la4
    sib sib' sol
    re mi fa

    %16
    sib, do do,
    fa r sol'
    la r sib

    %19
    la2 r8 sib\mbreak
    la8 sib do4 do,
    fa2 sol4

    %22
    la r sib
    la2 r8 sib
    la sib do4 do,

    %25
    fa fa\dolce mi
    fa do do8 sib
    la2 re4\mbreak

    %28
    sib do do,
    fa fa' mi
    fa do do8 sib

    %31
    la2 re4
    sib do2
    fa,4 fa'2\f

    %34
    mi2.
    re
    do4. re8 mi[do]

    %37
    fa2.\mbreak
    mi
    re

    %40
    do4. sib8\noBeam la sol
    fa4 fa'2
    r4 sol2

    %43
    r4 la2
    sib4 do do,
    fa fa,2\mbreak

    %46
    r4 sol2
    r4 la2
    sib4 do do,

    %49
    fa2 fa'4\dolce
    sib,2 fa'4
    sib,2 fa'4

    %52
    sib8 la sol4.-+ fa8
    do'2 fa,4
    sib,2 fa'4\mbreak

    %55
    sib,2 fa'4
    sib8 la sol4.-+ fa8
    do'4 do\f do

    %58
    do2.
    do
    do,4 fa fa,

    %61
    do'2 r4
    r do' do
    sol2 re'4

    %64
    sib do do,
    fa2 fa4\mbreak
    mi2 do4

    %67
    la'8-. sol-. fa-.[mi-. re-. do-.]
    sib4 do4. sib8
    la sol fa4 fa'

    %70
    mi2 do4
    la'8-. sol-. fa-.[mi-. re-. do-.]
    sib4 do do,\mbreak

    %73
    fa2.
    do'
    fa,

    %76
    do'
    fa,
    fa'4 re2-+\mbreak

    %79
    do2.
    sol'
    do,

    %82
    sol
    do
    sib\mbreak

    %85
    la
    sol
    fa

    %88
    sol
    fa4 fa' mi
    re do sib\mbreak

    %91
    la fa' la,
    sib re sib
    la fa' la,

    %94
    sib sib' sol
    re2 r8 la
    sib4 do do,\mbreak

    %97
    fa2 fa'4
    mi2 do4
    fa mi re

    %100
    do8 re16 mi fa sol la sib do8 do,
    fa,2 fa'4
    mi2 do4\mbreak

    %103
    fa mi re
    do16 sol la sib do sib do re do re do sib
    la la' do sib la sol fa mi re do sib la

    %106
    sib sib' re do sib la sol fa mi re do sib
    la la' do sib la sol fa mi re do sib la\mbreak
    sol sol' sib la sol fa mi re do sib la sol

    %109
    \once\stemUp fa la' do sib la sol fa mi re do sib la
    sib sib' re mib re do sib la sol fa mi re
    do sol' la sib do re do sib la fa sol la

    %112
    sib sol la sib do8 sib do[do,]
    fa4

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 40
    s2.*112
    s4
    \key fa\minor

}


VIIIvlI = {
    \VIIIglobal
    %\notypeset
    <<\VIIIvlIn \forma>>
}


VIIIvlII = {
    \VIIIglobal
    <<\VIIIvlIIn \forma>>
}


VIIIhbI = {
    \VIIIglobal
    %\notypeset
    <<\VIIIhbIn \forma>>
}


VIIIhbII = {
    \VIIIglobal
    <<\VIIIhbIIn \forma>>
}


VIIIvlaI = {
    \VIIIglobal
    <<\VIIIvlaIn \forma>>
}


VIIIvlaII = {
    \VIIIglobal
    <<\VIIIvlaIIn \forma>>
}


VIIIcrI = {
    \VIIIglobal
    <<\VIIIcrIn \forma>>
}



VIIIcrII = {
    \VIIIglobal
    <<\VIIIcrIIn \forma>>
}


VIIIfg = {
    \VIIIglobal
    \clef bass
    <<\VIIIfgn \forma>>
}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
    \typeset
}



IXglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

IXvlIn = \relative do'' {

    lab4.\dolce sib8
    do4 do fa
    do4. reb8 do4~

    %3
    do8 reb do[(sib) lab(sol)]
    lab4 lab4. sib8
    do4 do fa

    %6
    do4. reb8 do4~
    do8 reb  do[(sib) lab(sol)]
    lab4 sol4. lab8

    %9
    \appoggiatura lab16 sol4 \appoggiatura fa16 mi4 lab
    sol-+ lab fa~\mbreak
    fa sol8 fa sol mi

    %12
    fa4 sol4. lab8
    \appoggiatura lab16 sol4 \appoggiatura fa16 mi4 lab
    sol-+ lab fa~

    %15
    fa sol8 fa sol mi
    fa4 lab' sol
    fa mib reb

    %18
    do2.~
    do4 sib4.-+(lab16 sib)
    do4 lab' sol\mbreak

    %21
    fa mib reb
    do2.~
    do4 sib4.-+(lab16 sib)

    %24
    do2 r8 fa,
    reb'4. fa,8 mi4-+
    do'4. reb8 sib4-+~

    %27
    sib8 lab sol4.-+(fa16 sol)
    lab4 \appoggiatura sol16 fa4 r8 fa
    reb'4.\staccatissimo fa,8 mi4

    %30
    do'4. reb8 sib4-+~\mbreak
    sib8 lab sol4.-+ fa8
    fa4 fa' lab

    %33
    sol fa sib
    lab sol fa
    \appoggiatura lab16 sol4 mi2-+

    %36
    fa4 fa lab
    sol fa sib
    lab sol fa

    %39
    \appoggiatura lab16 sol4 mi2-+
    fa4  lab lab\mbreak   %% fine p. 32 OOKK
    lab4.(sol8) lab[(sib)]

    %42
    sol4-+ sol sol
    sol4.(fa8) sol[(lab)]
    fa4-+ fa fa

    %45
    sol8 lab sib lab sol fa
    mi2-+ \appoggiatura reb16 do4
    r do do

    %48
    sib2-+ sib8 r
    r4 sib sib
    lab2-+ lab8 r

    %51
    r4 lab lab\mbreak
    sib8 do reb do sib lab
    sib4 sol-+ \appoggiatura sol16 lab4~

    %54
    lab8 sib sol4.-+ fa8
    fa4 fa' r
    r fa r

    %57
    r sol2~
    sol2.~
    sol4 mi fa

    %60
    sol lab sib
    do2.~
    do4 sib-+ lab\mbreak

    %63
    sol fa-+ mi
    fa do sib-+
    do mi fa

    %66
    sol la\staccatissimo \appoggiatura sol16 fa4
    sib sol-+ \appoggiatura sol16 lab4~
    lab8 sib sol4.-+ fa8

    %69
    fa4 fa r
    r fa r
    r sol2~

    %72
    sol2.~
    sol4 mi fa
    sol lab sib\mbreak

    %75
    do2.~
    do4 sib-+ lab
    sol fa-+ mi

    %78
    fa do sib-+
    do mi fa
    sol la\staccatissimo \appoggiatura sol16 fa4

    %81
    sib sol-+ lab~
    lab8 sib sol4.-+ fa8
    fa fa,4\f reb'8 do-+[sib]

    %84
    do fa,4 reb'8 do-+[sib]\mbreak
    do fa,4 lab sol8
    fa[lab] sol [sib lab sol]

    %87
    lab sol fa reb' do-+ sib
    do fa,4 reb'8 do-+[sib]
    do fa,4 lab sol8

    %90
    fa[lab] sol [sib lab sol]
    lab sol fa[mib'? re do]
    re sol,4 mib'8 re-+[do]

    %93
    re sol,4 mib'8 re-+[do]
    re mib re do re si
    do2 r4

}

IXvlIIn = \relative do'' {

    lab4.\dolce sib8
    do4 do fa
    do4. reb8 do4~

    %3
    do8 reb do[(sib) lab(sol)]
    lab4 lab4. sib8
    do4 do fa

    %6
    do4. reb8 do4~
    do8 reb  do[(sib) lab(sol)]
    lab4 sol4. lab8

    %9
    \appoggiatura lab16 sol4 \appoggiatura fa16 mi4 lab
    sol-+ lab fa~\mbreak
    fa sol8 fa sol mi

    %12
    fa4 sol4. lab8
    \appoggiatura lab16 sol4 \appoggiatura fa16 mi4 lab
    sol-+ lab fa~

    %15
    fa sol8 fa sol mi
    fa4 lab' sol
    fa mib reb

    %18
    do2.~
    do4 sib4.-+(lab16 sib)
    do4 lab' sol\mbreak

    %21
    fa mib reb
    do2.~
    do4 sib4.-+(lab16 sib)

    %24
    do2 r8 fa,
    reb'4. fa,8 mi4-+
    do'4. reb8 sib4-+~

    %27
    sib8 lab sol4.-+(fa16 sol)
    lab4 \appoggiatura sol16 fa4 r8 fa
    reb'4.\staccatissimo fa,8 mi4

    %30
    do'4. reb8 sib4-+~\mbreak
    sib8 lab sol4.-+ fa8
    fa4 fa' lab

    %33
    sol fa sib
    lab sol fa
    \appoggiatura lab16 sol4 mi2-+

    %36
    fa4 fa lab
    sol fa sib
    lab sol fa

    %39
    \appoggiatura lab16 sol4 mi2-+
    fa4 do do\mbreak   %% fine p. 32 OOKK
    sib2-+ sib8 r

    %42
    r4 sib sib
    lab2-+ lab8 r
    r4 lab lab

    %45
    sib8 do reb do sib lab
    sol2-+ sol4
    r lab lab

    %48
    lab2(sol8-+) r
    r4 sol sol
    sol2(fa8-+) r

    %51
    r4 fa fa\mbreak
    sol8 lab sib lab sol fa
    sol4 mi-+ fa~

    %54
    fa8 sol mi4.-+ fa8
    fa4 fa' r
    r fa r

    %57
    r4 fa2~
    fa2.
    mi4 do re

    %60
    mi fa sol
    lab2.~
    lab4 sol-+ fa\mbreak

    %63
    mi do sib
    lab sol fa
    mi-+ do' re

    %66
    \appoggiatura re16 mib?2.
    reb?2 do4~
    do8 fa mi4.-+ fa8

    %69
    fa4 fa r
    r fa r
    r fa2~

    %72
    fa2.
    mi4 do re
    mi fa sol\mbreak

    %75
    lab2.~
    lab4 sol-+ fa
    mi do sib

    %78
    lab sol fa
    mi-+ do' re
    \appoggiatura re?16  mib?2.

    %81
    reb!2 do4~
    do8 fa mi4.-+ fa8
    fa8 fa,4\f reb'8 do-+[sib]

    %84
    do fa,4 reb'8 do-+[sib]\mbreak
    do fa,4 lab sol8
    fa[lab] sol [sib lab sol]

    %87
    lab sol fa reb' do-+ sib
    do fa,4 reb'8 do-+[sib]
    do fa,4 lab sol8

    %90
    fa[lab] sol [sib lab sol]
    lab sol fa[mib'? re do]
    re sol,4 mib'8 re-+[do]

    %93
    re sol,4 mib'8 re-+[do]
    re mib re do re si
    do2 r4

}

IXvlaIn = \relative do'' {

    r4 r
    R2.*3
    r4 fa, mi
    fa fa do

    %6
    mi8 sol fa4 fa~
    fa8 lab sol4 mi-+
    fa r r

    %9
    R2.*3
    r4 mi4. fa8
    mi4 sol fa

    %14
    mi fa reb~
    reb do4. do8
    do2 r4

    %17
    do' sib lab
    sib lab sol
    fa2 sol4

    %20
    mi-+ r r\mbreak
    do' sib lab
    sib lab sol

    %23
    fa2 sol4
    mi2-+ r4
    r sol r

    %26
    r lab sol-+~
    sol8 fa mi4.-+re16(mi)
    fa4 do r

    %29
    r sol' r
    r lab sol-+~\mbreak
    sol8 fa mi4.-+ fa8

    %32
    fa2 do'4
    reb4 do sib
    do reb do

    %35
    sib sol2-+
    lab4 do fa,
    reb' do sib

    %38
    do reb do
    sib sol2-+
    lab4 r r

    %41
    R2.*42
    r4 lab sol
    fa lab sol\mbreak

    %85
    fa2 fa4
    r fa mi
    fa lab sol

    %88
    fa lab sol
    fa2 fa4
    r fa mi

    %91
    fa4. do'8 re[mib?]
    si4.-+ do8 re[mib]
    si2-+ do4~

    %94
    do lab sol
    sol2 r4\mbreak

}

IXvlaIIn = \relative do'' {

    r4 r
    R2.*3
    r4 do,4. sib8
    lab4 do lab

    %6
    sol8 sib lab4 lab~
    lab8 fa do'4. do8
    do4 r r

    %9
    R2.*3
    r4 do r
    r do r

    %14
    r do lab~
    lab sib8 [lab sib sol]
    lab2 r4

    %17
    fa' sol lab
    sol fa sol
    lab2 sol4

    %20
    sol do, r\mbreak
    fa sol lab
    sol fa sol

    %23
    lab2 sol4
    sol2 r4
    r sib, sol'

    %26
    r do, reb~
    reb do2
    do r4

    %29
    r sib sol'
    r do, reb~\mbreak
    reb do2

    %32
    do4 lab' fa
    sol lab mi
    fa mi fa

    %35
    reb do2
    do4 lab' do
    sol lab mi

    %38
    fa mi fa
    reb do2
    do4 r r

    %41
    R2.*42
    r4 do reb
    do lab reb\mbreak

    %85
    do reb do
    r reb do
    do lab reb

    %88
    do lab reb
    do reb do
    r reb do

    %91
    do2 do4
    sol'2 sol4
    sol2 fa4

    %94
    lab fa sol
    mi2-+ r4

}

IXfgn = \relative do {

    fa4. sol8
    lab4 lab reb
    lab2 r8 sol
    lab sib do4 do,

    %4
    fa fa4. sol8
    lab4 lab \appoggiatura sol16 fa4
    mi fa lab,

    %7
    sib do do,
    fa do' r
    r do r

    %10
    r lab reb\mbreak
    sib sol do
    fa, do' r

    %13
    r do r
    r lab reb
    sib sol do

    %16
    fa,2 r4
    lab' sol fa
    mi fa mib

    %19
    reb reb2-+
    do r4\mbreak
    lab' sol fa

    %22
    mi fa mib
    reb reb2-+
    do r4

    %25
    sib2 r4
    lab2 sib4~
    sib do do,

    %28
    fa fa' r
    sib,2 r4
    lab2 sib4~\mbreak

    %31
    sib do do,
    fa2 fa'4
    sib lab reb

    %34
    do sib lab
    sib do do,
    fa2 fa,4

    %37
    sib lab reb
    do sib lab
    sib do do,

    %40
    fa \clef tenor \key fa\minor fa'' mib\mbreak
    re2-+ re8 r
    r4 mib reb!

    %43
    do2 do8 r
    r4 reb do
    sib2.
    do4 \clef bass \key fa\minor do,8-. re-. mi-. do-.

    %47
    fa-. mib?-. fa-. sol-. fa-. mib-.
    re-. do-. re-. sib-. do-. re-.
    mib re mib fa mib reb

    %50
    do sib do lab sib do
    reb do reb mib reb do\mbreak
    sib2 sib'8 do

    %53
    reb2 lab4
    sib do do,
    fa fa sol

    %56
    lab sol fa
    sib do reb
    sib do reb

    %59
    do2.~
    do2 sib4
    lab sib do

    %62
    reb2 do4\mbreak
    sib lab sol
    fa mib reb

    %65
    do2.
    do'
    sib4 mi, fa

    %68
    sib, do do,
    fa fa' sol
    lab sol fa

    %71
    sib do reb
    sib do reb
    do2.~

    %74
    do2 sib4\mbreak
    lab sib do
    reb2 do4

    %77
    sib lab sol
    fa mib reb
    do2.

    %80
    do'
    sib4 mi, fa
    sib, do do,

    %83
    fa fa' sol
    lab fa sol\mbreak
    lab sib do

    %86
    reb sib do
    fa, fa, sol
    lab fa sol

    %89
    lab sib do
    reb sib do
    fa sol lab

    %92
    sol2 do,4
    sol'2 lab4
    fa re? sol

    %95
    do, do'8.\f sib16 la8.-+ sol16

}

IXbcn = \relative do {

    fa4. sol8
    lab4 lab reb
    lab2 r8 sol
    lab sib do4 do,

    %4
    fa fa4. sol8
    lab4 lab \appoggiatura sol16 fa4
    mi fa lab,

    %7
    sib do do,
    fa do' r
    r do r

    %10
    r lab reb\mbreak
    sib sol do
    fa, do' r

    %13
    r do r
    r lab reb
    sib sol do

    %16
    fa,2 r4
    lab' sol fa
    mi fa mib

    %19
    reb reb2-+
    do r4\mbreak
    lab' sol fa

    %22
    mi fa mib
    reb reb2-+
    do r4

    %25
    sib2 r4
    lab2 sib4~
    sib do do,

    %28
    fa fa' r
    sib,2 r4
    lab2 sib4~\mbreak

    %31
    sib do do,
    fa2 fa'4
    sib lab reb

    %34
    do sib lab
    sib do do,
    fa2 fa,4

    %37
    sib lab reb
    do sib lab
    sib do do,

    %40
    fa r r
    R2.*5
    r4 do'8-. re-. mi-. do-.

    %47
    fa-. mib?-. fa-. sol-. fa-. mib-.
    re-. do-. re-. sib-. do-. re-.
    mib re mib fa mib reb

    %50
    do sib do lab sib do
    reb do reb mib reb do\mbreak
    sib2 sib'8 do

    %53
    reb2 lab4
    sib do do,
    fa fa sol

    %56
    lab sol fa
    sib do reb
    sib do reb

    %59
    do2.~
    do2 sib4
    lab sib do

    %62
    reb2 do4\mbreak
    sib lab sol
    fa mib reb

    %65
    do2.
    do'
    sib4 mi, fa

    %68
    sib, do do,
    fa fa' sol
    lab sol fa

    %71
    sib do reb
    sib do reb
    do2.~

    %74
    do2 sib4\mbreak
    lab sib do
    reb2 do4

    %77
    sib lab sol
    fa mib reb
    do2.

    %80
    do'
    sib4 mi, fa
    sib, do do,

    %83
    fa fa' sol
    lab fa sol\mbreak
    lab sib do

    %86
    reb sib do
    fa, fa, sol
    lab fa sol

    %89
    lab sib do
    reb sib do
    fa sol lab

    %92
    sol2 do,4
    sol'2 lab4
    fa re? sol

    %95
    do, do'8.\f sib16 la8.-+ sol16

}

IXbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.transparent = ##t
    \tempo 2. = 40
    \partial 2 s2
    s2.*95
    \key fa\major

}


IXvlI = {
    \IXglobal
    %\notypeset
    <<\IXvlIn \forma>>
}


IXvlII = {
    \IXglobal
    <<\IXvlIIn \forma>>
}


IXvlaI = {
    \IXglobal
    <<\IXvlaIn \forma>>
}


IXvlaII = {
    \IXglobal
    <<\IXvlaIIn \forma>>
}


IXfg = {
    \IXglobal
    \clef bass
    <<\IXfgn \forma>>
}

IXbc = {
    \IXglobal
    \clef bass
    <<\IXbcn \forma \IXbfn>>
    \typeset
}



Xglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

XvlIn = \relative do'' {

    r4 do8. do16 fa8. fa16
    sol8.(la16) la4.-+ sol8
    fa8. mi16 re8.[do16 sib8. la16]

    %4
    sol8.-+ fa16 do'4. do8
    do4 do8. do16 fa8. fa16
    sol8.(la16) la4.-+ sol8

    %7
    fa mi re mi \appoggiatura re16 do4~
    do8 fa mi4.-+ fa8
    fa4 do2\dolce~\mbreak

    %10
    do4 sib-+ la
    re2 do4
    sib8-+ la sol4 la8 sib

    %13
    la4-+ do2~
    do4 sib-+ la
    re2 do4

    %16
    sib8 la sol4.-+ fa8
    fa fa'16\f sol la fa la fa sol mi sol mi
    re sib' re, sib' re, sib' re, sib' do, la' do, la'\mbreak  %%% fine p. 34

    %19
    sib, sol' sib, sol' la, fa' la, fa' sol, mi' sol, mi'
    fa, re' fa, re' mi, do' mi, do' re, si' re, si'
    do4 mi re-+

    %22
    do mi re-+
    do sol'4. re8
    mi8. fa16 re4.-+ do8

    %25
    do do do do fa16 sol la sol\mbreak
    fa mi re do re do sib re sol la sib la
    sol fa mi re mi re do mi la sib do sib

    %28
    la sol fa mi fa la sol fa sol sib la sol
    la8 do, do do fa16 sol la sol
    fa mi re do re do sib re sol la sib la

    %31
    sol fa mi re mi re do mi la sib do mi,
    fa sol la sib sol4.-+ fa8\mbreak

    %33
    fa,16(do') fa(do) fa(do) fa(do) fa,(do') fa(do)
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do'(fa,) do'(fa,)

    %36
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) la,(fa') la (fa)
    re(la') fa'(la,) fa'(la,) fa'(la,) re,(si') fa'(si,)\mbreak

    %39
    <sol do,> (do) mi(do) mi(do) mi(do) sol (do) mi(do)
    sol,(si') re(si) re(si) re(si) sol,(si') re(si)
    <sol do,> (do) mi(do) mi(do) mi(do) sol(do) mi(do)

    %42
    sol,(si') re(si) re(si) re(si) sol,(si') re(si)
    <sol do,> (do) mi(do) mi(do) mi(do) sol (do) mi(do)
    sib,(sol') re'(sol,) re'(sol,) re'(sol,) sib,(sol') re'(sol,) \mbreak

    %45
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do'(fa,) do'(fa,)

    %48
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do(fa) la(fa)
    sib,(fa') sib(fa)  sib(fa)  sib(fa) sib,(fa') sib(fa)\mbreak

    %51
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)
    sib,(fa') re'(fa,) re'(fa,) re'(fa,) sib,(sol') mi'(sol,)
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)

    %54
    sib,(fa') re'(fa,) re'(fa,) re'(fa,) sol(sib) mi(sib)
    re,((la') fa'(la,) fa'(la,) fa'(la,) <fa' la, re,>8 r16 do
    sib8-+ la sol4.-+ fa8

    %57
    fa4 la'4. fa8
    \appoggiatura fa16 sol2 do,4
    r la'4. fa8

    %60
    \appoggiatura fa16 sol2 do,4
    r re4. sib8
    \appoggiatura sib16 do2 fa,4
    r sib4. do8

    %64
    la4.-+ sol8 la[sib]
    do sib do re mib[fa]
    re4-+ mi-+ fa~

    %67
    fa8 sol sol4.-+ fa8\mbreak
    fa4 la4. fa8
    \appoggiatura fa16 sol2 do,4

    %70
    r la'4. fa8
    \appoggiatura fa16 sol2 do,4
    r re4. sib8

    %73
    do2 fa,4
    r sib4. do8
    la4.-+ sol8 la[sib]

    %76
    do sib do re mib fa
    re4.-+ sib'8 la4-+~
    la8 sol sol4.-+ fa8

    %79
    fa2.

}

XvlIIn = \relative do'' {

    r4 do8. do16 fa8. fa16
    sol8.(la16) la4.-+ sol8
    fa8. mi16 re8.[do16 sib8. la16]

    %4
    sol8.-+ fa16 do'4. do8
    do4 do8. do16 fa8. fa16
    sol8.(la16) la4.-+ sol8

    %7
    fa mi re mi \appoggiatura re16 do4~
    do8 fa mi4.-+ fa8
    fa4 la,2\dolce~\mbreak

    %10
    la4 sol-+ fa
    fa(mi-+) fa~
    fa fa mi-+

    %13
    fa la2~
    la4 sol-+ fa
    fa(mi-+) fa~

    %16
    fa mi4.-+ fa8
    fa fa'16\f sol la fa la fa sol mi sol mi
    re sib' re, sib' re, sib' re, sib' do, la' do, la'\mbreak  %%% fine p. 34

    %19
    sib, sol' sib, sol' la, fa' la, fa' sol, mi' sol, mi'
    fa, re' fa, re' mi, do' mi, do' re, si' re, si'
    do4 mi re-+

    %22
    do mi re-+
    do sol'4. re8
    mi8. fa16 re4.-+ do8

    %25
    do do do do fa16 sol la sol\mbreak
    fa mi re do re do sib re sol la sib la
    sol fa mi re mi re do mi la sib do sib

    %28
    la sol fa mi fa la sol fa sol sib la sol
    la8 do, do do fa16 sol la sol
    fa mi re do re do sib re sol la sib la

    %31
    sol fa mi re mi re do mi la sib do mi,
    fa sol la sib sol4.-+ fa8\mbreak

    %33
    fa,16(do') fa(do) fa(do) fa(do) fa,(do') fa(do)
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do'(fa,) do'(fa,)

    %36
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) la,(fa') la (fa)
    re(la') fa'(la,) fa'(la,) fa'(la,) re,(si') fa'(si,)\mbreak

    %39
    <sol do,> (do) mi(do) mi(do) mi(do) sol (do) mi(do)
    sol,(si') re(si) re(si) re(si) sol,(si') re(si)
    <sol do,> (do) mi(do) mi(do) mi(do) sol(do) mi(do)

    %42
    sol,(si') re(si) re(si) re(si) sol,(si') re(si)
    <sol do,> (do) mi(do) mi(do) mi(do) sol (do) mi(do)
    sib,(sol') re'(sol,) re'(sol,) re'(sol,) sib,(sol') re'(sol,) \mbreak

    %45
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do'(fa,) do'(fa,)

    %48
    sol,(mi') sib'(mi,) sib'(mi,) sib'(mi,) sol,(mi') sib'(mi,)
    la,(fa') la (fa) la(fa) la(fa) do(fa) la(fa)
    sib,(fa') sib(fa)  sib(fa)  sib(fa) sib,(fa') sib(fa)\mbreak

    %51
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)
    sib,(fa') re'(fa,) re'(fa,) re'(fa,) sib,(sol') mi'(sol,)
    la,(fa') do'(fa,) do'(fa,) do'(fa,) la,(fa') do'(fa,)

    %54
    sib,(fa') re'(fa,) re'(fa,) re'(fa,) sol(sib) mi(sib)
    re,((la') fa'(la,) fa'(la,) fa'(la,) <fa' la, re,>8 r16 do
    sib8-+ la sol4.-+ fa8

    %57
    fa4 la'4. fa8
    \appoggiatura fa16 sol2 do,4
    r la'4. fa8

    %60
    \appoggiatura fa16 sol2 do,4
    r re4. sib8
    \appoggiatura sib16 do2 fa,4
    r sib4. do8

    %64
    la4.-+ sol8 la[sib]
    do sib do re mib[fa]
    re4-+ mi-+ fa~

    %67
    fa8 sol sol4.-+ fa8\mbreak
    fa4 la4. fa8
    \appoggiatura fa16 sol2 do,4

    %70
    r la'4. fa8
    \appoggiatura fa16 sol2 do,4
    r re4. sib8

    %73
    do2 fa,4
    r sib4. do8
    la4.-+ sol8 la[sib]

    %76
    do sib do re mib fa
    re4.-+ sib'8 la4-+~
    la8 sol sol4.-+ fa8

    %79
    fa2.

}

XhbIn = \relative do'' {

    r4 do8. do16 fa8. fa16
    sol8.(la16) la4.-+ sol8
    fa8. mi16 re8.[do16 sib8. la16]

    %4
    sol8.-+ fa16 do'4. do8
    do4 do8. do16 fa8. fa16
    sol8.(la16) la4.-+ sol8

    %7
    fa mi re mi \appoggiatura re16 do4~
    do8 fa mi4.-+ fa8
    fa4 r r

    %10
    R2.*7
    r8 fa16 sol la fa la fa sol mi sol mi
    re sib' re, sib' re, sib' re, sib' do, la' do, la'\mbreak  %%% fine p. 34

    %19
    sib, sol' sib, sol' la, fa' la, fa' sol, mi' sol, mi'
    fa, re' fa, re' mi, do' mi, do' re, si' re, si'
    do4 mi re-+

    %22
    do mi re-+
    do sol'4. re8
    mi8. fa16 re4.-+ do8

    %25
    do do do do fa16 sol la sol\mbreak
    fa mi re do re do sib re sol la sib la
    sol fa mi re mi re do mi la sib do sib

    %28
    la sol fa mi fa la sol fa sol sib la sol
    la8 do, do do fa16 sol la sol
    fa mi re do re do sib re sol la sib la

    %31
    sol fa mi re mi re do mi la sib do mi,
    fa sol la sib sol4.-+ fa8\mbreak
    fa4 la, do

    %34
    sib-+ \appoggiatura la16 sol4 sib
    la-+ la do
    sib-+ \appoggiatura la16 sol4 sib

    %37
    la-+\appoggiatura sol16 fa4 la
    do fa4. sol8\mbreak
    mi4-+ mi sol

    %40
    fa-+ \appoggiatura mi16 re4 fa
    mi-+ mi sol
    fa-+ \appoggiatura mi16 re4 fa

    %43
    mi-+ do do-+
    re re \appoggiatura do16 sib4\mbreak
    r do la-+

    %46
    sib\appoggiatura la16 sol4 sib
    la-+ la do
    sib-+ \appoggiatura la16 sol4 sib

    %49
    la-+ \appoggiatura sol16 fa2
    fa'2.~\mbreak
    fa~

    %52
    fa~
    fa~
    fa~

    %55
    fa2 r8 do
    sib8-+ la sol4.-+ fa8\mbreak
    fa4 la'4. fa8

    %58
    \appoggiatura fa16 sol2 do,4
    r la'4. fa8
    \appoggiatura fa16 sol2 do,4

    %61
    r re4. sib8
    \appoggiatura sib16 do2 fa,4
    r sib4. do8

    %64
    la4.-+ sol8 la[sib]
    do sib do re mib[fa]
    re4-+ mi-+ fa~

    %67
    fa8 sol sol4.-+ fa8\mbreak
    fa4 la4. fa8
    \appoggiatura fa16 sol2 do,4

    %70
    r la'4. fa8
    \appoggiatura fa16 sol2 do,4
    r re4. sib8

    %73
    do2 fa,4
    r sib4. do8
    la4.-+ sol8 la[sib]

    %76
    do sib do re mib fa
    re4.-+ sib'8 la4-+~
    la8 sol sol4.-+ fa8

    %79
    fa2.

}

XhbIIn = \relative do'' {

    r4 do8. do16 fa8. fa16
    sol8.(la16) la4.-+ sol8
    fa8. mi16 re8.[do16 sib8. la16]

    %4
    sol8.-+ fa16 do'4. do8
    do4 do8. do16 fa8. fa16
    sol8.(la16) la4.-+ sol8

    %7
    fa mi re mi \appoggiatura re16 do4~
    do8 fa mi4.-+ fa8
    fa4 r r

    %10
    R2.*7
    r8 fa16 sol la fa la fa sol mi sol mi
    re sib' re, sib' re, sib' re, sib' do, la' do, la'\mbreak  %%% fine p. 34

    %19
    sib, sol' sib, sol' la, fa' la, fa' sol, mi' sol, mi'
    fa, re' fa, re' mi, do' mi, do' re, si' re, si'
    do4 mi re-+

    %22
    do mi re-+
    do sol'4. re8
    mi8. fa16 re4.-+ do8

    %25
    do do do do fa16 sol la sol\mbreak
    fa mi re do re do sib re sol la sib la
    sol fa mi re mi re do mi la sib do sib

    %28
    la sol fa mi fa la sol fa sol sib la sol
    la8 do, do do fa16 sol la sol
    fa mi re do re do sib re sol la sib la

    %31
    sol fa mi re mi re do mi la sib do mi,
    fa sol la sib sol4.-+ fa8\mbreak
    fa4 la, do

    %34
    sib-+ \appoggiatura la16 sol4 sib
    la-+ la do
    sib-+ \appoggiatura la16 sol4 sib

    %37
    la-+\appoggiatura sol16 fa4 la
    do fa4. sol8\mbreak
    mi4-+ mi sol

    %40
    fa-+ \appoggiatura mi16 re4 fa
    mi-+ mi sol
    fa-+ \appoggiatura mi16 re4 fa

    %43
    mi-+ do do-+
    re re \appoggiatura do16 sib4\mbreak
    r do la-+

    %46
    sib\appoggiatura la16 sol4 sib
    la-+ la do
    sib-+ \appoggiatura la16 sol4 sib

    %49
    la-+ \appoggiatura sol16 fa2
    sib2.\mbreak
    do

    %52
    re2 mi4
    do2.
    re2 mi4-+

    %55
    fa2 r8 do
    sib8-+ la sol4.-+ fa8\mbreak
    fa4 la'4. fa8

    %58
    \appoggiatura fa16 sol2 do,4
    r la'4. fa8
    \appoggiatura fa16 sol2 do,4

    %61
    r re4. sib8
    \appoggiatura sib16 do2 fa,4
    r sib4. do8

    %64
    la4.-+ sol8 la[sib]
    do sib do re mib[fa]
    re4-+ mi-+ fa~

    %67
    fa8 sol sol4.-+ fa8\mbreak
    fa4 la4. fa8
    \appoggiatura fa16 sol2 do,4

    %70
    r la'4. fa8
    \appoggiatura fa16 sol2 do,4
    r re4. sib8

    %73
    do2 fa,4
    r sib4. do8
    la4.-+ sol8 la[sib]

    %76
    do sib do re mib fa
    re4.-+ sib'8 la4-+~
    la8 sol sol4.-+ fa8

    %79
    fa2.

}

XvlaIn = \relative do'' {

    r4 r la8. la16
    sol4 do4. sib8
    la4 sib8. la16 sol8. fa16

    %4
    do8. re16 mi8.[fa16 sol8. mi16]
    fa2 la8. la16
    sol8. do16 do4. sib8

    %7
    la4 sib fa
    r do'4. sib8
    la4-+ r r\mbreak

    %10
    R2.*7
    r4 fa do'
    re2 do4\mbreak

    %19
    sib la sol
    fa mi re
    do2 sol'4

    %22
    sol2 sol4
    sol2 sol4
    sol8. do16 si4.-+ do8

    %25
    do4. la8 la[la]\mbreak
    sib4. sib8 re[re]
    do4. do8 mi[mi]

    %28
    re4 re do
    do4. la8 la[la]
    sib4. sib8 re[re]

    %31
    do4. do8 do[do]
    la re do4. sib8\mbreak
    la2.

    %34
    sol
    fa
    sol2 mi4-+

    %37
    fa2.
    la4 sol2\mbreak
    sol2.

    %40
    sol
    sol
    sol

    %43
    sol
    sib\mbreak
    fa

    %46
    mi
    fa
    sol2 mi4-+

    %49
    fa2.
    fa\mbreak
    fa

    %52
    fa2 sol4
    la2.
    fa2 sib4

    %55
    la2 r8 la
    sol fa mi4.-+ fa8\mbreak
    fa4 do'4. re8

    %58
    mi2 mi4
    r do si
    do2 do4

    %61
    r sib?4. sol8
    la2 fa4
    r sol mi-+

    %64
    fa4. mi8 fa[sol]
    la sib do4 do
    do sib la

    %67
    re do4. sib8\mbreak
    la4-+ do4. re8
    mi2 mi4

    %70
    r do si
    do2 do4
    r sib4. sol8

    %73
    la2 fa4
    r sol mi-+
    fa2 la8 sol

    %76
    fa4 la8 sib do4
    do sib fa'~
    fa mi4. -+ fa8

    %79
    fa2.

}

XvlaIIn = \relative do' {

    r4 r do8. fa16
    fa2 mib4
    re2 r8 do

    %4
    sib8. la16 sol4 do8. sib16
    la4 fa do'8. fa16
    fa2 mib4

    %7
    re sol la~
    la8 sib sol4.-+ fa8
    fa4 r r\mbreak

    %10
    R2.*7
    r4 r do
    sib2 do4\mbreak

    %19
    do2 do4
    do sol' fa
    mi2 fa4

    %22
    mi do fa
    mi2 fa4
    mi8. la16 sol4. fa8

    %25
    mi4.-+ do8 do[do]\mbreak
    re4. sol8 sol[re]
    mi4. mi8 mi[mi]

    %28
    fa fa4 fa mi8
    fa do r fa fa[do]
    re sib r sol' sol[re]

    %31
    mi4. mi8 mi[la]
    fa4 fa mi-+\mbreak
    fa4 do2

    %34
    do2.
    do
    do

    %37
    do
    la4 re sol,\mbreak
    do2 mi4

    %40
    re2.
    do
    re

    %43
    do
    sol'\mbreak
    la

    %46
    R
    do,
    R

    %49
    do
    re\mbreak
    do2 fa4

    %52
    re2 sol,4
    do2.
    sib2 sol'4

    %55
    fa2 r8 do
    re4 do4. sib8\mbreak
    la4 fa' la

    %58
    do2 do,4
    r fa sol
    mi2-+ do4

    %61
    r sib re
    fa2 do4
    re do do

    %64
    do2 la'8 sol
    fa4 do fa
    fa sol fa~

    %67
    fa mi4.-+ fa8\mbreak
    fa4 fa4. la8
    do2 do,4

    %70
    r fa sol
    mi2-+ do4
    r sib re

    %73
    fa2 do4
    re do4. do8
    do2 fa8 sol

    %76
    la4 fa fa
    fa sol fa
    re' do4. sib8

    %79
    la2.-+

}

XcrIn = %\transpose do fa, {
\relative do'' {
    \key do\major

    r4 r mi8 mi
    re2 sol,4
    do2 r4

    %4
    r sol2
    mi4 do mi'8[mi]
    re2 sol,4

    %7
    do2 r4
    r sol2
    mi r4\mbreak

    %10
    R2.*23
    r4 do'2
    sol2.

    %35
    do,4 do'2
    sol2.
    do,2 r4

    %38
    mi' re2\mbreak
    sol,2.
    re'

    %41
    sol,
    re'
    sol,

    %44
    R2.*2
    sol2.

    %47
    do,
    sol
    do

    %50
    do'\mbreak
    do
    do

    %53
    do
    do2 fa4
    mi2 r8 sol

    %56
    fa mi re4.-+ do8\mbreak
    do2 r4
    R2.*10

    %68
    r4 mi4. do8
    re2 sol,4
    r mi'4. do8

    %71
    re2 sol,4
    r do4. do8
    do2 do4

    %74
    r sol sol
    sol2.
    r4 do do

    %77
    do re do
    r sol2
    mi2.

}

%}

XcrIIn = %\transpose  do fa, {
\relative do'' {
    \key do\major

    r4 r do8 do
    sol2 sol4
    mi do r

    %4
    r sol2
    do do'8. do16
    sol2 sol4

    %7
    mi do r
    r sol2
    do r4

    %10
    R2.*23
    r4 do'2
    sol2.

    %35
    do,
    sol
    do2 r4

    %38
    mi'4 re2\mbreak
    sol,2.
    re'

    %41
    sol,
    re'
    sol,

    %44
    R2.*2
    sol2.
    do,

    %48
    sol'
    do,
    do'\mbreak

    %51
    do
    do
    do

    %54
    do2 sol4
    do2 r8 mi
    re do sol2\mbreak

    %57
    do, r4
    R2.*10
    r4 do'4. do8

    %69
    sol2 sol4
    r do,4. do8
    sol'2 sol4

    %72
    r do4. do8
    do2 do4
    r sol sol

    %75
    sol2.
    r4 do do
    do re do

    %78
    r sol2
    do,2.

}

%}

Xfgn = \relative do {

    fa2 fa8. fa16
    do'2 do,4
    re2.

    %4
    mi8. fa16 do8.[sib16 la8. sol16]
    fa2 fa'8. fa16
    do'2 do,4

    %7
    re8 do sib4 la
    sib do do,
    fa fa' mi\mbreak

    %10
    re2 do4
    sib2 la4
    sib do do,

    %13
    fa fa' mi
    re2 do4
    sib2 la4

    %16
    sib do do,
    fa fa'' do
    sol2 la4\mbreak

    %19
    mi fa do
    fa sol sol,
    do16 re mi fa sol mi re do si sol la si

    %22
    do re mi fa sol mi re do si sol la si
    do si do re mi fa sol la si sol la si
    do8. fa,16 sol8[fa sol sol,]

    %25
    do4. fa8 fa[fa]\mbreak
    sib4. sol8 sol[sol]
    do4. la8 la[la]

    %28
    re re16 do sib do sib la sol8 do
    fa,4. fa,8 fa[fa]
    sib16 do sib la sol8[sol sol sol]

    %31
    do4. la8 la[la]
    re sib do4 do,\mbreak
    fa4 la' do

    %34
    sib-+ \appoggiatura la16 sol4 sib
    la-+ la do
    sib-+ \appoggiatura la16 sol4 sib

    %37
    la-+ \appoggiatura sol16 fa4 la~
    la8 si si4.-+(la16 si)\mbreak
    do4 \clef tenor\key fa\major mi sol

    %40
    fa-+ \appoggiatura mi16 re4 fa
    mi-+ mi sol
    fa-+ \appoggiatura mi16 re4 fa

    %43
    mi-+ do do-+
    re re \appoggiatura do16  sib4\mbreak
    r do la-+

    %46
    sib \appoggiatura la16 sol4 sib
    la-+ la do
    sib-+ \appoggiatura la16 sol4 sib

    %49
    la-+-+ \appoggiatura sol16 fa4 la-+
    sib2.\mbreak
    do

    %52
    re2 mi4
    do2.
    re2 mi4

    %55
    fa2 \clef bass \key fa\major r8 la,,
    sib4 do do,\mbreak
    \once\stemUp fa8 la'16 sib do8[la] fa do'

    %58
    mi,16 sol la sib do8[sol] mi do'
    re, fa16 sol la8[fa] re si'
    do, mi16 fa sol8[mi] do la'

    %61
    sib,16 re mi fa sol8[re] sib sol'
    la, do fa[do] la fa'
    fa, fa' mi[re mi do]

    %64
    \once\stemUp fa, fa'' mi re do sib
    la sol la fa sol la
    sib4 sol re'

    %67
    sib do do,\mbreak
    fa8 sol16 la sib do re mi fa8 fa,
    mi fa16 sol la sib do re mi8 mi,

    %70
    re mi16 fa sol la si do re8 re,
    do re16 mi fa sol la sib? do8 do,
    sib do16 re mi fa sol la sib8 sib,

    %73
    \once\stemUp la do'16 sib la sol fa mi re do sib la
    sol8 fa'mi re mi do
    \once\stemUp fa, fa'' mi re do sib

    %76
    la sol la fa sol la
    sib4 sol re'
    sib4 do do,

    %79
    fa2.

}

Xbcn = \relative do {

    fa2 fa8. fa16
    do'2 do,4
    re2.

    %4
    mi8. fa16 do8.[sib16 la8. sol16]
    fa2 fa'8. fa16
    do'2 do,4

    %7
    re8 do sib4 la
    sib do do,
    fa fa' mi\mbreak

    %10
    re2 do4
    sib2 la4
    sib do do,

    %13
    fa fa' mi
    re2 do4
    sib2 la4

    %16
    sib do do,
    fa fa'' do
    sol2 la4\mbreak

    %19
    mi fa do
    fa sol sol,
    do16 re mi fa sol mi re do si sol la si

    %22
    do re mi fa sol mi re do si sol la si
    do si do re mi fa sol la si sol la si
    do8. fa,16 sol8[fa sol sol,]

    %25
    do4. fa8 fa[fa]\mbreak
    sib4. sol8 sol[sol]
    do4. la8 la[la]

    %28
    re re16 do sib do sib la sol8 do
    fa,4. fa,8 fa[fa]
    sib16 do sib la sol8[sol sol sol]

    %31
    do4. la8 la[la]
    re sib do4 do,\mbreak
    fa2.

    %34
    do'
    fa,
    do'

    %37
    fa,
    fa'4 re2-+\mbreak
    do2.

    %40
    sol'
    do,
    sol'

    %43
    do,
    sib\mbreak
    la

    %46
    sol
    fa
    sol2 do4

    %49
    fa, fa' mi
    re do sib\mbreak
    la fa la

    %52
    sib re sib
    la fa' la,
    sib sib' sol

    %55
    re2 r8 la
    sib4 do do,\mbreak
    \once\stemUp fa8 la'16 sib do8[la] fa do'

    %58
    mi,16 sol la sib do8[sol] mi do'
    re, fa16 sol la8[fa] re si'
    do, mi16 fa sol8[mi] do la'

    %61
    sib,16 re mi fa sol8[re] sib sol'
    la, do fa[do] la fa'
    fa, fa' mi[re mi do]

    %64
    \once\stemUp fa, fa'' mi re do sib
    la sol la fa sol la
    sib4 sol re'

    %67
    sib do do,\mbreak
    fa8 sol16 la sib do re mi fa8 fa,
    mi fa16 sol la sib do re mi8 mi,

    %70
    re mi16 fa sol la si do re8 re,
    do re16 mi fa sol la sib? do8 do,
    sib do16 re mi fa sol la sib8 sib,

    %73
    \once\stemUp la do'16 sib la sol fa mi re do sib la
    sol8 fa'mi re mi do
    \once\stemUp fa, fa'' mi re do sib

    %76
    la sol la fa sol la
    sib4 sol re'
    sib4 do do,

    %79
    fa2.

}

Xbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentUp



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.transparent = ##t
    \tempo 2. = 40
    s2.*79
    \bar "|."

}


XvlI = {
    \Xglobal
    %\notypeset
    <<\XvlIn \forma>>
}


XvlII = {
    \Xglobal
    <<\XvlIIn \forma>>
}


XhbI = {
    \Xglobal
    <<\XhbIn \forma>>
}


XhbII = {
    \Xglobal
    <<\XhbIIn \forma>>
}


XvlaI = {
    \Xglobal
    <<\XvlaIn \forma>>
}


XvlaII = {
    \Xglobal
    <<\XvlaIIn \forma>>
}


XcrI = {
    \Xglobal
    <<\XcrIn \forma>>
}



XcrII = {
    \Xglobal
    <<\XcrIIn \forma>>
}


Xfg = {
    \Xglobal
    \clef bass
    <<\Xfgn \forma>>
}

Xbc = {
    \Xglobal
    \clef bass
    <<\Xbcn \forma \Xbfn>>
    \typeset
}
#(set-global-staff-size 17)



\paper {

   print-first-page-number = ##t
   first-page-number = #2

}

\bookpart {

   \paper {

      systems-per-page = #3

   }

   \header {
      title = \markup\smaller{Simphonie du Festin Royal - Première Suite}
      composer = \markup \center-column{"  ""F. Francœur arr. (1698-1787)"}
   }

   \markup \huge {[1.] Ouverture de M.\super r Francœur}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.ers Viol[ons]"\vspace #-0.2"et Hautb[ois]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \IvlI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.es Viol[ons]"\vspace #-0.2"et Hautb[ois]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \IvlII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2 fa'2^\markup \right-align {I. \super er Alto}}
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al1"
            \IvlaI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2 do''2^\markup \right-align{2.\super e Alto}}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al2"
            \IvlaII
            \key fa\major
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Bassons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bs"
            \Ifg
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basses"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \Ibc
            \key fa\major
         >>
      >>

      \layout {

         indent = 1.4\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

      systems-per-page = #2

   }

   \markup \huge {[2.] Air grave de M. Francœur}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.ers Viol[ons]"\vspace #-0.2"et Hautb[ois]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \IIvlI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.es Viol[ons]"\vspace #-0.2"et Hautb[ois]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \IIvlII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 2/2 fa'2^\markup\center-align {"[I.] Parties"}}
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al1"
            \IIvlaI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2 do'2^\markup\center-align{"[2.] Parties"}}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al2"
            \IIvlaII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2 r1^\markup\right-align {I.er Cor}}
            \clef alto
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \IIcrI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef mezzosoprano \key fa\major \time 2/2 r1^\markup \right-align{2.e Cor}}
            \clef alto
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \IIcrII
            \key fa\major
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bs"
            \IIfg
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \IIbc
            \key fa\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 1.4\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

      systems-per-page = #3

   }

   \markup \huge {[3.] Air vif de M. Berton}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.ers Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \IIIvlI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.es Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \IIIvlII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 3/4\override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit fa'8^\markup\center-align {"Alto"}}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al1"
            \IIIvlaI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"I.er Cor"}
            \clef violin
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \IIIcrI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e Cor"}
            \clef violin
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \IIIcrII
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bs"
            \IIIfg
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \IIIbc
            \key fa\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 16.5)
         indent = 1.4\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[4.] Air de M. le C. de Brassac}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.ers Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \IVvlI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.es Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \IVvlII
            \key fa\major
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Bassons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bs"
            \IVfg
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basses"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \IVbc
            \key fa\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 16.5)
         indent = 1.4\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

      systems-per-page = #3

   }

   \markup \huge {[5.] Air gay de M. Dauvergne}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.ers Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \VvlI

         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.es Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \VvlII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 6/8\override MensuralStaff.TimeSignature.style = #'numbered fa'8^\markup\center-align {"Alto"}}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al1"
            \VvlaI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"I.er Cor"}
            \clef violin
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \VcrI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e Cor"}
            \clef violin
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \VcrII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \Vbc
            \key fa\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 17.5)
         indent = 1.4\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[6.] Rondeau gracieux et tendre de M. Royer}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.ers""Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \VIvlI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.es""Viol[ons]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \VIvlII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \VIbc
            \key fa\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 1.4\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

      systems-per-page = #3

   }

   \markup \huge {[7.] Chasse en Rondeau}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[1.er]""Hautbois"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob1"
            \VIIhbI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[2.e]""Hautbois"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob2"
            \VIIhbII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"1.er""Violon"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \VIIvlI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e""Violon"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \VIIvlII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Cors"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr"
            \VIIcrI
            \key fa\major
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bs"
            \VIIfg
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basses"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \VIIbc
            \key fa\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 16)
         indent = 1.4\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

      systems-per-page = #2

   }

   \markup \huge {[8.] Chaconne de M. Francœur}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[1.ers]""Violons"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \VIIIvlI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[2.es]""Violons"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \VIIIvlII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[1.ers] ""Hautb[ois]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob1"
            \VIIIhbI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[2.es]""Hautbois"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob2"
            \VIIIhbII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit r4^\markup\center-align {"1.er Alto"}}
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al1"
            \VIIIvlaI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""} \incipit { \clef mezzosoprano \key fa\major \time 3/4 \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit r4^\markup\center-align {"2.e Alto"}}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al2"
            \VIIIvlaII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"I.er Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \VIIIcrI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"2.e Cor"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \VIIIcrII
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"B[as]sons"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bs"
            \VIIIfg
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \VIIIbc
            \key fa\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 1.4\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

      systems-per-page = #3

   }

   \markup \huge {Mineur}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"vl1"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \IXvlI
            \key fa\minor
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"vl2"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \IXvlII
            \key fa\minor
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"al1"}
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al1"
            \IXvlaI
            \key fa\minor
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"al2"}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al2"
            \IXvlaII
            \key fa\minor
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"bs"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bs"
            \IXfg
            \key fa\minor
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"bc"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \IXbc
            \key fa\minor
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 0\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

      systems-per-page = #2

   }

   \markup \huge {Majeur}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"vl1"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \XvlI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"vl2"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \XvlII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"ob1"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob1"
            \XhbI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"ob2"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "ob2"
            \XhbII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"al1"}
            \clef violin
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al1"
            \XvlaI
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"al2"}
            \clef alto
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "al2"
            \XvlaII
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"cr1"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr1"
            \XcrI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"cr2"}
            \set Staff.midiInstrument = #"french horn"
            \set Staff.shortInstrumentName = "cr2"
            \XcrII
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"bs"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "bs"
            \Xfg
            \key fa\major
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"bc"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \Xbc
            \key fa\major
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 0\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

