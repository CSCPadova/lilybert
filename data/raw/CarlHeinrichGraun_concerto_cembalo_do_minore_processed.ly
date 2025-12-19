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



Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.4
   \override TupletBracket.bracket-visibility = ##f
   \terzine \con
}


IvlIn = \relative do'' {

   sol'8 do, si16 re do si do sol mib'8~mib re
   sol do, si16 re do si do sol mib'8~mib re
   do16 re mib fa sol do, lab'8 do,16 re mib fa sol do, lab'8

   %4
   sol fa16 mib re mib fa re si do re si sol4
   sol'8 do, sol'16 sib lab sol lab8 fa(mi fa)
   sib,16 do re mib? fa sib, lab'8 lab4 (sol)

   %7
   mib8 lab, mib'16 sol fa mib fa8 re(do re)
   sol,16 la si do re sol, fa'8 fa4(mib)
   lab16 do, re do re do re do sol' do, re do re do re do

   %10
   lab' do, re do re do re do sol' do, re do re do re do
   lab' sol fa mib re do si la sol4 r8 re'\p\mbreak
   mib16 fa sol8 sol sol sol4 fa8 mib

   %13
   re16 mib fa8 fa fa fa4 mib8 re
   mib16 fa sol8 sol-.(sol-.) sol4 fa8 mib
   fa16 sol lab8 lab-. (lab-.) lab4 sol8 fa

   %16
   do' sib16 la? sol8 fa do' sib16 la sol8 fa
   mib4 re do r
   R1*4

   %22
   mib8\parenthesize \p  mib mib mib mib r r4
   re8 re re re re r r4\mbreak
   do8 do do do do r r4

   %25
   lab'8 r sol r sol4 fa
   mib8 mib mib mib mib r r4
   re8 re re re fa r r4

   %28
   sol8 sol sol sol sib r r4
   do,8 r r4 re8 r r4
   mib8 r r4 fa8 r r4

   %31
   sol8 fa r lab sol fa r4\mbreak
   r2 r8 solb,\p solb solb
   solb?2\fermata  fa

   %34
   sib'8 r r4 lab8 r r4
   sol8 r r4 fa8 r r4
   sib8 sib sib sib lab lab lab lab

   %37
   sol sol sol sol fa r r4
   r2 r8 mib re16 fa mib8
   r2 r8 sol fa16 lab sol8

   %40
   R1
   r2 r16 sib,\parenthesize \f do re mib fa sol lab\mbreak
   sib8 mib, re16 fa mib re mib sib sol'8\parentSlur (sol) fa

   %43
   sib, mib, re16 fa mib re mib sib sol'8\parentSlur ( sol) fa
   mib16 fa sol lab sib mib, do'8 sib16 do re mib fa sib, lab'8
   sol mib16 sol lab8 sol sol fa r fa,\p

   %46
   sol16 lab sib8 sib sib sib4 lab8 sol
   lab16 sib do8 do do do4 sib8 lab
   mib'\parenthesize \f re16 do sib8 lab\mbreak mib' re16 do sib8 lab

   %49
   sol4 fa mib r
   R1*5
   r8 mib'\parenthesize \p mib mib mib r r4

   %56
   r8 re re re re r r4
   r8 do do do do r8 r4
   R1*2

   %60
   fad4\staccatissimo r fad\staccatissimo r
   sol\staccatissimo r sol \staccatissimo r
   fad4\staccatissimo r fad\staccatissimo r

   %63
   sol\staccatissimo r sol \staccatissimo r
   fad r r2
   R1\mbreak

   %66
   r4 r8 fad\f sol16 la sib8 sib sib
   sib4 la8 sol fad16 sol la8 la la
   la4 sol8 fad sol4 r

   %69
   R1*5
   sol8 do, si16 re do si do sol mib'8 mib re
   R1

   %76
   do16 re mib fa sol do, lab'8 do,16 re mib fa sol do, lab'8
   R1
   sol8 fa16 mib re mib fa re si do re si sol4

   %79
   R1
   sol'8 do, sol'16 sib lab sol\mbreak lab8 fa mi? fa
   R1

   %82
   mib?8 lab, mib'16 sol fa mib fa8 re do re
   R1
   lab'16 do, re do re do re do sol' do, re do re do re do

   %85
   R1
   lab'16 sol fa mib re do si la sol4 r
   mi'8\parenthesize \p mi mi mi mi mi mi mi

   %88
   fa r r4 r2
   fad8 fad fad fad fad fad fad fad
   sol r r4 r2

   %91
   R1*8
   r2 r4 r8 re\parenthesize \f \mbreak
   mib16 \parentSlur (fa sol8) sol-. \parentSlur ( sol-.) sol4 fa8 mib

   %101
   fa16 \parentSlur (sol lab8) lab-.\parentSlur (lab-.) lab4 sol8 \parentSlur (fa)
   do' sib16 lab sol8 fa do' sib16 lab sol8 fa
   mib4 re do8 sib16 lab sol8 fa

   %104
   mib re16 do sol'8 sol, do4\fermata r

}


IvlIIn = \relative do'' {

   sol'8 do, si16 re do si do sol mib'8~mib re
   sol do, si16 re do si do sol do8\parentSlur (do) si
   do16 re mib fa sol do, lab'8 do,16 re mib fa sol do, lab'8

   %4
   sol fa16 mib re mib fa re si do re si sol4
   sol'8 do, sol'16 sib lab sol lab8 fa\parentSlur (mi fa)
   sib,16 do re mib? fa sib, fa'8 fa4 (mib)

   %7
   mib8 lab, mib'16 sol fa mib fa8 re\parentSlur (do re)
   sol,16 la si do re sol, re'8 re4(do)
   lab'16 do, re do re do re do sol' do, re do re do re do

   %10
   lab' do, re do re do re do sol' do, re do re do re do
   lab' sol fa mib re do si la sol4 r8 si8\parenthesize \p
   do16 re mib8 mib mib mib4 re8 do

   %13
   si16 do re8 re re re4 do8 si
   do16 re mib8 mib-. (mib-.) mib4 re8 do
   re16 mib fa8\mbreak fa-. (fa-.) fa4 mib8 re

   %16
   do'8 sib16 lab sol8 fa do' sib16 lab sol8 fa
   mib4 re do r
   R1*4

   %22
   do8\p do do do do r r4\mbreak
   sib8 sib sib sib sib r r4
   lab8 lab lab lab lab r r4

   %25
   fa'8 r mib r mib4 re
   do8 do do do do r r4
   lab8 lab lab lab lab r r4

   %28
   reb8 reb reb reb reb r r4
   r fa,8 r r4 sol8 r
   r4 lab8 r r4 sib8 r

   %31
   mib re r fa mib re r4
   r2 r8\mbreak mib,\parenthesize \p mib mib
   mib2\fermata re

   %34
   mib'8 r r4 re8 r r4
   mib8 r r4 re8 r r4
   mib8 mib mib mib re re re re

   %37
   mib mib mib mib re r r4
   r2 r8 mib re16 fa mib8
   r2 r8 mib re16 fa mib8

   %40
   R1
   r2 r16 sib\parenthesize \f do re mib fa sol lab
   sib8 mib, re16 fa mib re mib sib mib8~mib re

   %43
   sib mib, re16 fa mib re mib sib mib8~mib re
   mib16 fa sol lab sib mib, do'8 sib16 do re mib fa sib,  fa'8
   mib re16 mib fa8 mib mib[re] r8 re,\p

   %46
   mib16 fa sol8 sol sol sol4 fa8 mib
   fa16 sol lab8 lab lab lab4 sol8 fa
   mib' \f re16 do sib8 lab mib' re16 do sib8 lab

   %49
   sol4 fa mib r
   R1*5
   r8 do'\p do do do r r4

   %56
   r8 sib sib sib sib r r4
   r8 la la la \parenthesize la r r4
   R1*2

   %60
   re4\staccatissimo r re\staccatissimo r
   mi\staccatissimo r mi\staccatissimo r
   re\staccatissimo r re\staccatissimo r

   %63
   mi\staccatissimo r mi\staccatissimo r
   re4 r r2
   R1

   %66
   r4 r8 la\parenthesize \f  sib16 do re8 re re
   re4 do8 sib la16 sib do8 do do
   do4 sib8 la sib4 r

   %69
   R1*5
   sol'8 do, si16 re do si do sol do8 do si
   R1

   %76
   do16 re mib fa sol do, lab'8 do,16 re mib fa sol do, lab'8
   R1
   sol8 fa16 mib re mib fa re si do re si sol4

   %79
   R1
   sol'8 do, sol'16 sib lab sol\mbreak lab8 fa mi fa
   R1

   %82
   mib?8 lab, mib'16 sol fa mib fa8 re do re
   R1
   lab'16 do, re do re do re do sol' do, re do re do re do

   %85
   R1
   lab'16 sol fa mib re do si la sol4 r
   reb'8\p reb reb reb reb reb reb reb

   %88
   do r r4 r2
   mib8 mib mib mib mib mib mib mib\mbreak
   re r r4 r2

   %91
   R1*8
   r2 r4 r8 si8\f
   do16 (re mib8) mib-.(mib-.) mib4 re8 do

   %101
   re16 (mib fa8) fa-. (fa-.) fa4 mib8 (re)
   do' sib16 lab sol8 fa do' sib16 lab sol8 fa
   mib4 re do8 sib16 lab sol8 fa

   %104
   mib re16 do sol'8 sol, do4\fermata r

}


Ivlan = \relative do' {

    mib8 sol fa \parenthesize lab sol sol sol sol
    sol4 fa8 lab sol sol sol4
    sol8 do r do sol do r do

    %4
    do do lab fa re4 sol16 fa mib re
    mib4 sol do, r
    fa8 sib sib sib sib sib sib sol

    %7
    lab4 lab lab r
    sol8 sol sol sol\mbreak sol sol sol sol
    fa do' fa, do' mib, do' mib, do'

    %10
    fa, do' fa, do' mib, do' mib, do'
    fa,4 lab si, r8 sol'\p
    sol sol sol sol sol sol sol sol

    %13
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    re re re re re re re re\mbreak

    %16
    sol4 r8 si sol4 r8 lab
    do,4\f si do r
    R1*4

    %22
    sol'8\p sol sol sol fa r r4
    fa8 fa fa fa mib8 r r4
    mib8 mib mib mib fa8 r r4

    %25
    sib8 r sib r sib2
    la!8 la la la fa r r4\mbreak
    fa8 fa fa fa fa r r4

    %28
    sib8 sib sib sib sib r r4
    R1*3
    r2 r8 la,!\p la la

    %33
    sib1\fermata
    R1*8
    sol'8\f sib lab fa sib sib sib sib,

    %43
    sib4 lab8 sol sib sib sib sib
    sib4 r8 mib fa4 r8 sib
    sib4 do sib8 sib,\p sib sib\mbreak

    %46
    sib sib sib sib sib sib sib sib
    fa' fa fa fa fa fa fa fa
    mib4\parenthesize \f r8 re sib4 r8 fa'

    %49
    mib4 re mib r
    R1*5
    r8 sol\p sol sol la! r r4

    %56
    r8 fa fa re sol r r4
    r8 do, do do fad r r4
    R1*2\mbreak

    %60
    la4\parenthesize \staccatissimo r la\parenthesize \staccatissimo r
    sib\parenthesize \staccatissimo r sib\parenthesize \staccatissimo r
    la4\parenthesize \staccatissimo r la\parenthesize \staccatissimo r

    %63
    sib\parenthesize \staccatissimo r sib\parenthesize \staccatissimo r
    la4 r r2
    R1

    %66
    r4 r8 re,\parenthesize \f re re re re
    re re re re re re re re
    re re re re re4 r

    %69
    R1*5
    mib8 sol fa lab sol8 sol sol4\mbreak
    R1

    %76
    sol8 do r do sol do r4
    R1
    do8 do lab fa re4 sol16 fa mib re

    %79
    do4 r r2
    mib4 sol do, r
    R1

    %82
    lab'4 lab lab r
    R1
    fa8 do' fa, do' mib, do' mib, do'

    %85
    R1
    fa,4 lab re, r
    sol8\p sol sol sol sol sol sol sol\mbreak

    %88
    fa r r4 r2
    la!8 la la la la la la la
    si?8 r r4 r2

    %91
    R1*8
    r2 r4 r8 sol\f
    sol sol sol sol sol sol sol sol

    %101
    re re re re re re re re
    sol4 r8 si sol4 r8 lab
    do,4 si do'8 sib?16 lab sol8 fa

    %104
    mib re16 do sol'8 sol, do4\fermata r

}

Imdn = \relative do'' {

   %\clef soprano
   sol'8 do, si16 re do si do sol mib'8~mib re
   sol do, si16 re do si do sol mib'8~mib re
   do16 re mib fa sol do, lab'8 do,16 re mib fa sol do, lab'8

   %4
   sol fa16 mib re mib fa re si do re si sol4
   sol'8 do, sol'16 sib lab sol lab8 fa\parentSlur (mi? fa)
   sib,16 do re mib? fa sib, lab'8 lab4 (sol)

   %7
   mib8 lab, mib'16 sol fa mib fa8 re\parentSlur (do re)
   sol,16 la si do re sol, fa'8 fa4(mib)
   lab16 do, re do re do re do sol' do, re do re do re do

   %10
   lab' do, re do re do re do sol' do, re do re do re do
   lab' sol fa mib re do si la sol4 r8 <<
      {
         re'
         mib16 fa sol8 sol sol sol4 fa8 mib

         %13
         re16 mib fa8 fa fa fa4 mib8 re
         mib16 fa sol8 sol sol sol4 fa8 mib
         fa16 sol lab8\mbreak lab lab lab4 sol8 fa
      }\\{
         si,8
         do16 re mib8 mib mib mib4 re8 do
         si16 do re8 re re re4 do8 si
         do16 re mib8 mib mib mib4 re8 do
         re16 mib fa8\mbreak fa fa fa4 mib8 re
      }
   >>

   %16
   do'8 sib16 lab sol8 fa do' sib16 lab sol8 fa
   mib4 re do r
   sol'8\solo do, si16 re do si do sol mib'8~mib re

   %19
   sol do, si16 re do si do sol mib'8~mib re
   do16 re mib fa sol do, lab'8 do,16 re mib fa sol do, lab'8
   sol fa16 mib re mib fa re si do re si sol4

   %22
   mib'8 mib mib8.\tr re32 mib do'8 do16 sib lab sol fa mib
   re8 re re8.\tr do32 re sib'8 sib16 lab sol fa mib re
   do lab do mib do lab do mib lab8 lab16 sol fa mib re do\mbreak

   %25
   sib lab' sol fa sol mib sib' mib, <<{sol4 fa}\\{mib re}>>
   la'!16 mib fa mib fa mib fa mib do'16 sib la sol fa mib re do
   re lab sib lab sib lab sib lab fa' mib re do sib lab sol fa

   %28
   sol' reb mib reb mib reb mib reb sib' lab sol fa mib reb do sib
   do sol lab sol fa do' sib lab\mbreak re lab sib lab sol re' do sib
   mib sib do sib lab mib' re do fa do re do sib fa' mib re

   %31
   <<
      {
         sol8 fa~fa16 lab sol fa sol8 fa~fa16 lab sol fa
         sol8 solb solb solb solb solb, solb solb
         solb?2\fermata fa
      }\\{
         mib'8 re~ re16 fa mib re mib8 re~re16 fa mib re
         mib8 mib mib mib mib mib, mib mib
         mib2 re
      }
   >>

   %34
   sib''16 sib, mib sib sib' sib, mib sib lab' sib, re sib lab' sib, re sib
   sol' sib, mib sib sol' sib, mib sib  fa' sib, mib sib fa' sib, mib sib
   sib' sib, mib sib sib' sib, mib sib\mbreak lab' sib, re sib lab' sib, re sib

   %37
   sol' sib, mib sib sol' sib, mib sib fa' sib, re sib fa' sib, re sib
   sol sib lab do sib re do mib re fa mib8 r4
   sib16 re do mib re fa mib sol fa lab? sol8 r4

   %40
   \tuplet 3/2 { lab16(sol fa) } lab8\noBeam \tuplet 3/2 { sol16(fa mib) } sol8\noBeam \tuplet 3/2 { fa16(mib re) } fa8\noBeam mib lab,
   sol4 fa mib16 sib' do re mib fa sol lab
   sib8 mib, re16 fa mib re\mbreak mib sib sol'8~sol fa

   %43
   sib, mib, re16 fa mib re mib sib sol'8~sol mib
   mib16 fa sol lab sib mib, do'8 sib16 do re mib fa sib, lab'8
   <<{sol fa16 sol lab8 sol sol[fa]}\\{mib re16 mib fa8 mib mib[re]}>> r <<
      {
         fa,

         %46
         sol16 lab sib8 sib sib sib4 lab8 sol
         lab16 sib do8 do do do4 sib8 lab
      }\\{
         re,
         mib16 fa sol8 sol sol sol4 fa8 mib
         fa16 sol lab8 lab lab lab4 sol8 fa
      }
   >>
   mib' re16 do sib8 lab mib' re16 do sib8 lab\mbreak

   %49
   sol4 fa mib r8 sib\solo
   reb16 mib reb do reb8 sib mi16 fa sol8 sol16 la! sib8
   sib16 do reb8 mi16 reb do sib do re mi fa sol do, sib'8

   %52
   lab16 sol fa8 r do, mib16 fad? mib re mib8 do
   fad16 sol la8 la16 sib do8 do16 re mib!8 fad16 mib re do
   re mi fad sol la re, do'8 sib16 la sol8 r re

   %55
   mib?16 do do' do, sib' do, sol' do, la'! do, sol' do,\mbreak fa do mib do
   re sib sib' sib, la'! sib, fad' sib, sol' sib, fad' sib, mib sib re sib
   do la la' la, sol' la, mib'! la, fad' la, mib' la, re la do la

   %58
   sib sol sol' sol, la do sib la do sol sol' sol, la do sib la
   sib sol mib' sol, re' sol, do sol sib sol re' sol, do sol sib sol
   fad' la, do la mib' la, do la fad' la, do la mib' la, do la

   %61
   sol' sol, sib sol dod sol sib sol sol' sol, sib sol dod sol sib sol
   fad' la, do la mib' la, do la fad' la, do la mib' la, do la
   sol' sol, sib sol dod sol sib sol sol' sol, sib sol dod sol sib sol

   %64
   \once\stemUp <fad' re la>4 \once \override Rest.staff-position = #+2 r re,16 re' do re\mbreak re, re' do re
   re, sib' la sib re, la' sol la sib sol mib' re do sib la sol
   fad mib re8 r <<
      {
         fad' sol16 la sib8 sib sib

         %67
         sib4 la8 sol fad16 sol la8 la la
         la4 sol8 fad sol4 re8 re
         re4 do8 sib do16 re mib8 mib mib

         %70
         mib4 re8 do
      }\\{
         la8 sib16 do re8 re re
         re4 do8 sib la16 sib do8 do do
         do4 sib8 la sib16 do re8 sib sib
         sib4 la8 sol la16 sib do8 do do
         do4 sib8 la
      }
   >>
   sib16 sol' fa mib mib sol fa mib
   re sol fa mib re8 do \stemUp sib16 la do sib la sol sib la
   \stemNeutral sol sol' fa mib re8 do sib16 la do \parenthesize sib\mbreak la sol sib la

   %73
   sol \giu sol, si \su re sol\giu si, \su re sol si re, sol si re sol, si re
   sol8\tu do, si16 re do si do sol mib'8 mib re
   sol,\solo do, si16 re do si do16 \giu sol \su mib'8~mib [re]

   %76
   do'16\tu re mib fa sol do, lab'8 do,16 re mib fa sol do, lab'8
   do,,16\solo re mib fa sol do, lab'8 do,16 re mib fa sol do, lab'8
   sol'8\tu fa16 mib re mib fa re si do re si sol4

   %79
   sol8\solo fa16 mib re mib fa re si do re si\mbreak \giu\once\stemUp sol4\mbreak
   \su sol''8\tu do, sol'16 sib lab sol\mbreak lab8 fa mi fa
   sib,,16\solo do re mib <<{fa sib, lab'8 lab4 sol}\\{s8 fa fa4 mib}>>

   %82
   mib'?8 \tu lab, mib'16 sol fa mib fa8 re do re
   \stemUp \giu sol,,16_\solo la si \su do <<{re \giu sol, \su fa'8 fa4 mib}\\{s8 re re4 do}>>\stemNeutral
   lab''16\tu do, re do re do re do sol' do, re do re do re do

   %85
   lab\solo do, re do re do re do sol' do, re do re do re do
   lab''\tu sol fa mib re do si la sol4 r
   mi'16\solo sol, sib sol reb' sol, sib sol mi' sol, sib sol reb' sol, sib sol\mbreak

   %88
   fa' fa, lab fa do' fa, lab fa fa' fa, lab fa do' fa, lab fa
   fad' lab, do lab mib' lab, do lab fad' lab, do lab mib' lab, do la
   sol' sol, si sol re' sol, si sol sol' sol, si sol re' sol, si sol

   %91
   lab'4 sol8 fa mi16 sol sib?4 sib,8
   reb4 do8 sib lab16 sol fa8 r4
   sol' fa8 mib re16 fa lab4 lab,8

   %94
   do4 sib8 lab sol16 fa mib8 r mib'
   <<
      {
         do8.\tr[ sib16 do8 do']\mbreak si16 do sol4 mib8
         do8.\tr[ sib16 do8 do'] si16 do sol4 mib8
      }\\{
         do, do do do do do do do
         do do do do do do do do
      }
   >>

   %97
   lab''16 fa sol mib fa re mib do si8 lab' sol do
   mib,16 re fa mib re do mib re do do sib lab sol8 fa
   mib16 re fa mib re do mib re do4 r8 <<
      {
         re'8

         %100
         mib16 fa sol8 sol sol sol4 fa8 mib
         fa16 sol lab8 lab lab lab4 sol8 fa
      }\\{
         si,8 do16 re mib8 mib mib mib4 re8 do
         re16 mib fa8 fa fa fa4 mib8 re
      }
   >>
   do' sib16 lab sol8 fa do' sib16 lab sol8 fa

   %103
   mib4 re do8 sib16 lab sol8 fa
   mib re16 do sol'8\giu sol, \su do4\fermopz r

}

Imsn = \relative do {

   do8 mib re fa mib do sol' fa
   mib4 re8 fa mib do sol' fa
   mib \su do' \giu r fa, mib \su do' \giu r fa,(

   %4
   mib) lab fa re sol4~sol16 fa mib re
   do4 mi fa r
   re8 re re re mib mib mib mib\mbreak

   %7
   do4 do re r
   si8 si si si do do do do
   fa do' fa, do' mib, do' mib, do'

   %10
   fa, do' fa, do' mib, do' mib, do'
   fa,4 fa, sol r8 sol'
   sol sol sol sol sol sol sol sol

   %13
   sol sol sol sol sol sol sol sol\mbreak
   sol sol sol sol sol sol sol sol
   si, si si si si si si si

   %16
   mib4 r8 re mib4 r8 fa
   sol fa sol sol, do4 r
   do8 mib re fa mib do sol' fa

   %19
   mib4 re8 fa mib do sol' fa
   mib do' r fa,\mbreak mib do' r fa,
   mib lab fa re sol4~sol16 fa mib re

   %22
   do8 do do do lab' lab lab lab
   sib sib sib sib sol sol sol sol
   lab lab lab lab fa fa fa fa\mbreak

   %25
   re4 mib sib8 sib sib sib
   fa' fa fa fa la! la la la
   sib sib sib sib re, re re re

   %28
   mib mib mib mib sol, sol sol sol
   lab4 r8 lab\mbreak sib4 r8 sib
   do4 r8 do re4 r8 re'

   %31
   \su mib \giu sib sib sib \su mib \giu sib sib sib
   \su mib \giu la,! la la la la, la la
   sib1\fermata

   %34
   sol'8 sol sol sol fa fa fa fa
   mib mib mib mib sib sib sib sib
   sol' sol sol sol\mbreak fa fa fa fa

   %37
   mib mib mib mib sib sib sib sib
   mib fa sol lab sib do r4
   \stemDown sol8 lab sib \su do re mib r4

   %40
   do8 re mib [\once\stemUp \giu sol,]\stemDown lab sib \su do [\giu lab]
   sib lab sib sib, mib4 r
   mib8 sol fa lab\mbreak sol mib sib' lab

   %43
   sol4 fa8 lab sol mib sib' lab\mbreak
   sol4 r8 lab? re,4 r8 re
   mib4 lab sib8 sib sib sib

   %46
   sib sib sib sib sib sib sib sib
   re, re re re re re re re
   sol4 r8 fa sol4 r8 lab

   %49
   sib lab sib sib, mib4 r
   <sol mi>8 <sol mi> <sol mi> <sol mi> <sol mi> <sol mi> <sol mi> <sol mi>
   <sol mi?> <sol mi> <sol mi> <sol mi> <sol mi> <sol mi> <sol mi> <sol mi>

   %52
   fa fa fa fa <la fad> <la fad> <la fad> <la fad>
   <la fad> <la fad> <la fad> <la fad> <la fad> <la fad> <la fad> <la fad>
   <la fad> <la fad> <la fad> <la fad> sol la sib? sol

   %55
   do4 r8 do fa, mib'\mbreak re do
   sib4 r8 sib mib, re' do sib
   la4 r8 la re, do' sib la

   %58
   sol re' fad, re' sol, re' fad, re'
   sol, do sib la sol sib la sol
   re4 r re r

   %61
   dod r dod r
   re4 r re r
   dod r dod r

   %64
   re16 \su re' do re \giu re, \su re' do re \giu re, sib' la sib\mbreak re, sib' la sib
   re, sol fad sol re fad mi fad sol8 do, re mi
   re4 r8 re re re re re

   %67
   re re re re re re re re
   re re re re sol sol sol sol
   sol sol sol sol fad fad fad fad

   %70
   fad? fad fad fad sib4 r8 la
   sib4 r8 \su do re4 \giu re,
   \stemNeutral mib sib8 do re4\mbreak re,

   %73
   sol r r2
   do8 mib re fa mib do sol' fa

   %75
   mib4 re8 fa mib do sol' fa
   mib do' r fa, mib do' r fa,
   mib do' r fa, mib do' r fa,

   %78
   mib lab fa re sol4~sol16 fa mib re
   do4 fa, sol r8 fa'16 mib
   do4 mi fa r

   %81
   re8 re re re mib mib mib mib
   do4 do re r
   \stemDown si8 si si si do do do do

   %84
   \stemNeutral fa do' fa, do' mib, do' mib, do'
   fa,, do' fa, do' mib, do' mib, do'
   fa,4 fa sol r

   %87
   sib'8 sib sib sib sib sib sib sib\mbreak
   lab4 r4 r2
   do8 do do do do do do do

   %90
   si4 r4 r2
   <re si>8 <re si> <re si> <re si> <mi? do> <mi do> <mi do> <mi do>
   <sol, mi> <sol mi> <sol mi> <sol mi> <lab fa> <lab fa> <lab fa> <lab fa>

   %93
   <do lab> <do lab> <do lab> <do lab> <re sib> <re sib> <re sib> <re sib>
   <fa, re> <fa re> <fa re> <fa re> <sol mib> <sol mib> <sol mib> <sol mib>
   lab lab lab lab mib mib mib mib

   %96
   lab lab lab lab mib mib mib mib
   fa4 fa, r8 fa' mib fa
   sol4 sol, lab mib'8 fa

   %99
   sol4 sol, do, r8 sol''
   sol sol sol sol sol sol sol sol
   si, si si si si si si si

   %102
   mib4 r8 re mib4 r8 fa
   sol fa sol sol, do' sib16 lab sol8 fa
   mib re16 do \stemDown sol'8 \stemUp sol, do4 r

}

Ibcn = \relative do {

   do8 mib re fa mib do sol' fa
   mib4 re8 fa mib do sol' fa
   mib do' r fa, mib do' r fa,

   %4
   mib lab fa re sol4~sol16 fa mib re
   do4 mi fa r
   re8 re re re mib mib mib mib\mbreak

   %7
   do4 do re r
   si8 si si si do do do do
   fa do' fa, do' mib, do' mib, do'

   %10
   fa, do' fa, do' mib, do' mib, do'
   fa,4 fa, sol r8 sol'\parenthesize \p
   sol sol sol sol sol sol sol sol

   %13
   sol sol sol sol sol sol sol sol\mbreak
   sol sol sol sol sol sol sol sol
   si, si si si si si si si

   %16
   mib4 r8 re mib4 r8 fa
   sol fa sol sol, do4 r
   R1*4

   %22
   do8\p do do do lab' r r4
   sib,8 sib sib sib sol' r r4\mbreak
   lab8 lab lab lab fa r r4

   %25
   re8 r mib r sib2
   fa'8 fa fa fa la! r r4
   sib8 sib sib sib re, r r4

   %28
   mib8 mib mib mib sib r r4
   R1*3
   r2 r8 la!\parenthesize \p la la

   %33
   sib1\fermopz\mbreak
   sol'8 r r4 fa8 r r4
   mib8 r r4 sib8 r r4

   %36
   sol'8 sol sol sol fa fa fa fa
   mib mib mib mib sib r r4
   R1*4

   %42
   mib8\parenthesize \f  sol fa lab sol mib sib' lab
   sol4 fa8 lab sol mib sib' [lab]\mbreak
   sol4 r8 lab re,4 r8 re

   %45
   mib4 lab sib8 sib\p sib sib
   sib sib sib sib sib sib sib sib
   re, re re re re re re re

   %48
   sol4\f r8 fa sol4 r8 lab
   sib lab sib sib, mib4 r
   R1*5\mbreak

   %55
   r8 do'\parenthesize \p do do fa, r r4
   r8 sib sib sib mib, r r4
   r8 la la la re, r r4

   %58
   R1*2
   re4 r re r
   dod r dod r

   %62
   re r re r
   dod r dod r\mbreak
   re r r2

   %65
   R1
   r4 r8 re\f re re re re
   re re re re re re re re

   %68
   re re re re sol,4 r
   R1*5
   do8 mib re fa mib do sol' fa

   %75
   mib r r4 r2\mbreak
   mib8 do' r fa, mib do' r4
   R1

   %78
   mib,8 lab fa re sol4~sol16 fa mib re
   do8 r r4 r2
   do4 mi fa r

   %81
   R1
   do4 do re r
   R1\mbreak

   %84
   fa8 do' fa, do' mib, do' mib, do'
   R1
   fa,,4 fa sol r

   %87
   sib'8\p sib sib sib sib sib sib sib
   lab? r r4 r2
   do8 do do do do do do do

   %90
   si r r4 r2\mbreak
   R1*8
   r2 r4 r8 sol

   %100
   sol sol sol sol sol sol sol sol
   si,? si si si si si si si
   mib4 r8 re mib4 r8 fa

   %103
   sol fa sol sol, do' sib16 lab sol8 fa\mbreak
   mib re16 do sol'8 sol, do4\fermopz r

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}


forma = {

   \time 4/4
   \tempo 2 = 55
   \key sol\minor
   s1*104
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

Ivla = {
   \Iglobal
   \clef alto
   <<\Ivlan \forma>>

}

Imd = {
   \Iglobal
   \context Staff = up
   <<\Imdn \forma>>

}

Ims = {
   \Iglobal
   \clef bass
   \context Staff = down
   <<\Imsn \forma>>

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
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


IIvlIn = \relative do'' {

    sib8 do16. sib32 do8
    do sib r
    re16. mib32 fa16. sol32 lab8

    %4
    lab? sol r
    do, mib8. do16
    sib8 mib8. sib16

    %7
    lab8 fa'8. lab,16
    sol8 fa sib
    \tuplet 3/2 { la!16(sol fa) } mib'8[mib]

    %10
    re do fa
    mi16(fa sol) sib,-.(sib-. sib-.)
    sib8 la mib'!

    %13
    re16(mib fa) lab,-.(lab-. lab-.)
    lab?8 sol r16 sib
    sib8 la! r16 mib'

    %16
    \tuplet 3/2 { re(do sib) } do4\tr\mbreak
    sib4.
    R4.*4

    %22
    do8\p do do
    sib sib sib
    lab lab lab

    %25
    sol fa r
    R4.
    r8 r fa'

    %28
    mi16(fa sol) sib,-.(sib-. sib-.)
    sib8 la! r
    R4.*11

    %41
    fa'8\parenthesize \f sol16. fa32 sol8
    sol fa r
    la,?16. sib32 do16. re32 mib8

    %44
    mib re do
    \tuplet 3/2 { si16(la sol) } fa'8[fa]
    mib re lab'

    %47
    sol16(fa) sol(mib) fa(re)
    re8 mib r
    R4.*10

    %59
    sib8 do16. sib32 do8\mbreak
    do sib r
    R4.*2

    %63
    re16\parenthesize \f (mib fa) reb?-.(reb-. reb-.)
    reb?8 do r
    R4.*2

    %67
    re16(mib fa) lab,-. (lab-. lab-.)
    sol8 fa r
    r r r16 lab\p

    %70
    sol8 fa r
    R4.*12
    re'16\parenthesize \f (mib fa) lab,-. (lab-. lab-.)

    %84
    lab?8 sol r16 do
    do8 sib r16 lab'
    \tuplet 3/2 { sol(fa mib)} sol8[fa]

    %87
    mib lab, r16 lab
    \tuplet 3/2 { sol(fa mib) } sol8[fa]
    mib4\fermopz r8

}


IIvlIIn = \relative do'' {

    sol8 lab16. sol32 lab8
    lab? sol r
    sib16. do32 re16. mib32 fa8

    %4
    fa mib r
    lab, do8. lab16
    sol8 sol8. sol16
    fa8 lab?8. fa16

    %8
    mib8 re re
    do do' do
    sib la? la

    %11
    sol16(la sib) sol-.(sol-. sol-.)
    sol8 \parenthesize fa do'
    sib16(do re) fa,-.(fa-. fa-.)\mbreak

    %14
    fa8 mib r16 sol
    sol8 fa r16 do'
    sib8 sib la

    %17
    sib4.
    R4.*4
    lab?8\p lab lab

    %23
    sol sol sol
    fa fa fa
    mib re r
    R4.

    %27
    r8 r la'!
    sol16(la sib) sol-.(sol-. sol-.)
    sol8 fa r

    %30
    R4.*11
    re'8 mib16. re32 mib8
    mib re r

    %43
    fa,16. sol32 la!16. sib32 do8\mbreak
    do8 sib fa
    sol re' re

    %46
    do si? fa'
    mib16\parentSlur (re) mib\parentSlur (do) re\parentSlur (si)
    si?8 do r

    %49
    R4.*10
    sol8 lab16. sol32 lab8
    lab? sol r

    %61
    R4.*2
    sib16\parenthesize \f (do reb) sib-.(sib-. sib-.)
    sib8 lab r

    %65
    R4.*2
    fa16(sol lab) fa-.(fa-. fa-.)
    mib8 re r

    %69
    r r r16 fa\p
    mib8 re r
    R4.*12\mbreak

    %83
    fa16\parenthesize \f (sol lab) fa-.(fa-. fa-.)
    fa8 mib r16 lab
    lab?8 sol r16 fa'

    %86
    mib8 mib re
    mib mib, r16 fa
    mib8 mib re

    %89
    mib4\fermata

}


IIvlan = \relative do' {


    \footnote #' (-1 . 2) \markup\column\smaller {"Le prime 12 battute della parte di Viola sono errate. Le ho sostituite raddoppiando la parte di Basso""  "}mib8  mib  mib
    mib mib r
    sib sib sib

    %4
    mib mib r
    mib mib mib
    mib mib mib

    %7
    re re re
    mib sib sib
    fa' fa fa

    %10
    fa fa fa
    do do do
    fa fa fa

    %13
    sib,8 sib do
    do do do
    do do fa

    %16
    fa fa mib
    re4.
    R4.*9


    %27
    r8 r do\p  %% da qui in poi OK
    do do do
    do do r

    %30
    R4.*11
    sib'8 sib sib
    sib sib r

    %43
    do, fa fa
    fa fa fa
    re si si

    %46
    do sol' si,
    do sol' sol
    sol4 r8

    %49
    R4.*10
    mib8 mib mib
    mib mib r

    %61
    R4.*2
    mib8\f mib mib
    mib mib r

    %65
    R4.*2
    sib8 sib sib
    sib sib r

    %69
    R4.
    sib8\parenthesize \p sib r
    R4.*12

    %83
    sib8\f sib re
    sib sib re
    mib mib sib'

    %86
    sib sib lab
    sol re r16 sib
    sib8 sib sib

    %89
    sol4\fermata r8

}

IImdn = \relative do'' {
    \terzine

    <<
        {
            sib8 do16. sib32 do8
            do [sib]
        }\\{
            sol8 lab16. sol32 lab8
            lab? [sol]
        }
    >> r8
    <<
        {
            re'16. mib32 fa16. sol32 lab8

            %4
            lab? [sol]
        }\\{
            sib,16. do32 re16. mib32 fa8
            fa [mib]
        }
    >> r
    <<
        {
            do8 mib8. do16
            sib8 mib8. sib16

            %7
            lab8 fa'8. lab,16
            sol8 fa sib
        }\\{
            lab r r16 lab
            sol8 r r16 sol
            fa8 r r16 fa
            mib8 re r
        }
    >>
    \tuplet 3/2 { la'!16\parentSlur (sol fa) } <<
        {
            mib'8[mib]

            %10
            re do fa
            mi16(fa sol) sib,-.(sib-. sib-.)
            sib8 la mib'!

            %13
            re16(mib fa) lab,-.(lab-. lab-.)
            lab?8 [sol] r16 sib
            sib8[ la!]
        }\\{
            do8[do]
            sib la la
            sol16(la sib) sol-.(sol-. sol-.)
            sol8 fa do'
            sib16(do re) fa,-.(fa-. fa-.)\mbreak
            fa8 mib r16 sol
            sol8 [fa]
        }
    >> r16 mib'

    %16
    \tuplet 3/2 { re16(do sib) } do4\tr
    sib4.
    <<
        {
            sib8\solo do16 sib do8

            %19
            do[sib]
        }\\{
            sol lab16 sol lab8
            lab? [sol]
        }
    >> r8
    \tuplet 3/2 { sib16 do re re[mib fa] fa sol lab }
    lab?8 sol r

    %22
    \tuplet 3/2 { do,16 lab do } mib8.[do16]
    \tuplet 3/2 { sib16 sol sib } mib8.[sib16]
    \tuplet 3/2 { lab16 fa lab } <<{s8. lab16}\\{fa'8. fa,16}>>

    %25
    <<{sol8 fa sib}\\{mib,re r}>>
    \tuplet 3/2 { la'!16 sol fa } <<
        {
            mib'8[mib]
            re do fa

            %28
            mi16(fa sol) sib,-.(sib-. sib-.)
            sib8 la! sib'
            la16 \parentSlur (sib do) mib,-. \parentSlur (mib-. mib-.)

            %31
            re16
        }\\{
            do8[do]
            sib la la
            sol16 (la sib)  sol-. (sol-. sol-.)
            sol8 fa re'
            do16 \parentSlur (re mib) do-. \parentSlur(do-. do-.)
            sib sib' la! sib fa lab]
        }
    >>
    \shiftOn sol re mib! sib do sol
    la! fa' mi fa do mib

    %34
    re la sib fa sol re\mbreak
    mib sol do mib sol do
    sib8 sib32(la) sol16 fa mi

    %37
    mib!8 mib32(re) do16 sib la
    reb8 reb32(do) sib16 la sol
    fa la do mib fa sib,

    %40
    \tuplet 3/2 { sol' fa mib } re8.\tr[do16]
    <<
        {
            s8 sol'16. fa32 sol8
            sol [fa]
        }\\{
            sib,8\tu mib16. re32 mib8
            mib [re]
        }
    >> r
    <<
        {
            %43
            la!16. sib32 do16. re32 mib8
            mib re do
            s8 fa8[fa]

            %46
            mib re lab'
            sol16(fa) sol(mib) fa(re)
            re8 [mib]
        }\\{
            fa,16. sol32 la!16. sib32 do8\mbreak
            do8 sib lab?
            \tuplet 3/2 { si16 la? sol } re'8[re]
            do si fa'
            mib16\parentSlur (re) mib\parentSlur (do) re\parentSlur (si)
            si?8 [do]
        }
    >> r

    %49
    \stemUp \tuplet 3/2 { mi16\solo do mi } do'8 [mi,]\stemNeutral
    <<
        {
            \terzine \override TupletBracket.bracket-visibility = ##f \tuplet 3/2 {
                fa16 do' sib lab[sol fa]mib re do
                re sib re
            } sib'8[re,]

            %52
            \tuplet 3/2 {
                mib16 sib' lab sol[fa mib] reb do sib
                do lab mib'
            } mib8.\tr[re32 do]
            \tuplet 3/2 { re16 sib fa' } fa8.\tr[mib32 re]

            %55
            \tuplet 3/2 { mib16 do sol' } sol8.\tr[fa32 \parenthesize mib]
            \tuplet 3/2 { fa16 re lab'? } lab8.\tr[sol32 fa]
        }\\{
            fa,8 fa fa
            fa fa fa
            mib mib mib
            mib fa fa
            fa sol sol
            sol lab lab
            lab?8 sib sib
        }
    >>
    \tuplet 3/2 { sol'16 lab sib lab [sib sol] fa sol mib}

    %58
    mib8[re] r
    <<
        {
            sib8\tu do16. sib32 do8
            do[sib]
        }\\{
            sol8 lab?16. sol32 lab8
            lab?8[sol]
        }
    >> r

    %61
    \tuplet 3/2 { sib16\solo do re re[mib fa] fa sol lab}
    lab?8[sol] r
    <<
        {
            re16(mib fa) reb-.(reb-. reb-.)

            %64
            reb?8 [do]
        }\\{
            sib16(do reb!) sib-.(sib-. sib-.)
            sib8 [lab]
        }
    >> r
    mib'32 do mib do' mib,[do mib do'] mib,[do mib do']
    mib,8 re r
    <<
        {

            %67
            re16(mib fa) lab,-. (lab-. lab-.)
            sol8[fa]
        }\\{
            fa16(sol lab) fa-.(fa-. fa-.)
            mib8 [re]
        }
    >> r16 <<
        {
            lab''
            sol8[fa] r16 lab,

            %70
            sol8[fa] r16 lab'
            sol8[fa]
        }\\{
            fa16
            mib8 re s16 fa,
            mib8 re s16 fa'
            mib8[re]
        }
    >> r
    mib16(re) re(do) do(sib)

    %73
    sib lab32 sol fa16 mib re mib
    mib'(re) re(do) do(sib)
    sib lab32 sol fa16 mib re mib

    %76
    do'32[sib lab sol] fa16 mib re fa
    fa'32[mib re do] sib16 lab sol fa
    \tuplet 3/2 { sol sib mib } sol,[mib' fa, re']

    %79
    \tuplet 3/2 { sol, sib mib } sol,[mib' fa, re']
    mib8 mib, do'
    sol fa4

    %82
    mib4.
    <<
        {
            re'16\tu(mib fa) lab,-. (lab-. lab-.)
            lab?8 sol r16 do

            %85
            do8 sib r16 lab'
        }\\{
            fa,16(sol lab) fa-.(fa-. fa-.)
            fa8 mib s16 lab
            lab?8 sol s16 fa'
        }
    >>
    \tuplet 3/2 { sol(fa mib)} sol8[fa]
    mib lab, r16 lab

    %88
    \tuplet 3/2 { sol(fa mib) } sol8[fa]
    mib4\fermata r8

}

IImsn = \relative do {

    mib8 mib  mib
    mib mib r
    sib sib sib

    %4
    mib mib r
    mib mib mib
    mib mib mib

    %7
    re re re
    mib sib sib
    fa' fa fa

    %10
    fa fa fa
    do do do
    fa fa fa

    %13
    sib, sib sib
    mib mib mi\mbreak
    fa fa la!

    %16
    sib fa fa,
    sib sib'16 lab sol fa
    mib8 mib mib

    %19
    mib mib mib
    re re re
    mib mib mib

    %22
    mib mib mib
    mib mib mib
    re re re

    %25
    mib sib sib
    fa' fa fa
    fa fa fa

    %28
    do do do
    fa fa fa
    fa fa fa

    %31
    sib do re
    \su\once\stemDown mib \giu r r
    fa, sol la

    %34
    sib r r
    do, do do
    <<{\su \stemDown do' do do}\\{\giu fa, fa fa}>>

    %37
    <do' la fa> <do la fa> <do la fa>
    <do sol mi> <do sol mi> <do sol mi>
    <do mib,!>4 <sib re,>8

    %40
    <<{sib sib la
       sib4}\\{mib,8 fa fa
               \shiftOn \stemUp sib, sib sib}>>
    sib sib r

    %43
    fa' fa fa
    sib, sib lab
    sol sol sol

    %46
    sol sol sol
    sol sol sol
    do do do

    %49
    \su \stemDown <sol'' do,> <sol do,>[<sol do,>]\stemNeutral
    \giu lab, lab lab
    lab lab lab

    %52
    sol sol sol
    lab la la
    sib si si

    %55
    do do do
    re re re
    mib do lab

    %58
    sib sib, r
    mib mib mib
    mib mib r

    %61
    re re re
    mib mib r
    sol8 sol sol

    %64
    lab lab r
    la! la la
    sib sib, r

    %67
    sib sib sib
    sib sib sib
    sib sib sib

    %70
    sib sib sib
    sib sib r
    do sib lab

    %73
    sol4 r8
    do sib lab
    sol4 r8

    %76
    lab4 r8
    re4 r8
    mib sib' sib,

    %79
    mib sib' sib,
    sol4 lab8
    sib4.

    %82
    mib,
    sib'8 sib sib
    mib mib mib

    %85
    mib mib \parenthesize re
    mib sib' sib,
    do re r16 re

    %88
    mib8 sib' sib,
    mib,4\fermata r8

}

IIbcn = \relative do {

    mib8 mib  mib
    mib mib r
    sib sib sib

    %4
    mib mib r
    mib mib mib
    mib mib mib

    %7
    re re re
    mib sib sib
    fa' fa fa

    %10
    fa fa fa
    do do do
    fa fa fa

    %13
    sib, sib sib
    mib mib mi\mbreak
    fa fa la!

    %16
    sib fa fa,
    sib4.
    R4.*9

    %27
    r8 r fa'\p
    do do do
    fa, fa r

    %30
    R4.*11
    sib8\f sib sib
    sib sib r

    %43
    fa' fa fa
    sib, sib lab
    sol sol sol

    %46
    sol sol sol
    sol sol sol\mbreak
    do4 r8

    %49
    R4.*10
    mib8 mib mib
    mib mib r

    %61
    R4.*2
    sol8\parenthesize \f sol sol
    lab lab r

    %65
    R4.*2
    sib,8 sib sib
    sib sib r

    %69
    R4.
    sib8\parenthesize \p sib r
    R4.*12

    %83
    sib8\parenthesize \f sib sib
    mib mib mib
    mib mib re

    %86
    mib sib' sib,
    do re r16 re
    mib8 sib' sib,

    %89
    mib,4\fermata r8

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}


forma = {

    \time 3/8
    \tempo 4 = 40
    \key sol\minor
    s4.*89
    \bar "|."

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

IIvla = {
    \IIglobal
    \clef alto
    <<\IIvlan \forma>>

}

IImd = {
    \IIglobal
    \context Staff = up
    <<\IImdn \forma>>

}

IIms = {
    \IIglobal
    \clef bass
    \context Staff = down
    <<\IImsn \forma>>

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
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}


IIIvlIn = \relative do'' {

    do4. sol
    mib'16 sol fa mib re do do4 si8
    do4. sol

    %4
    mib'16 sol fa mib re do do4 si8
    sol'16 lab sib4 lab16 sol fa mib re do
    sib8 lab' lab lab sol r

    %7
    mib16 \parentSlur (fa sol4) fa16 mib re do si la
    sol8 fa' fa fa mib r
    lab do, do sol'16 do, re mib re do

    %10
    lab'8 do, do sol'16 do, re mib re do
    lab' sol fa mib re do si sol' fa mib re do
    si mib re do si la\mbreak sol sol fa mib re do

    %13
    si mib re do si la sol4 r8
    reb''4. do4 \parentSlur (sib8)
    sol' sol sib, sib la! r

    %16
    mib'4. re?4 \parentSlur (do8)
    la' la do, \parentSlur (do) si r
    lab'4. sol

    %19
    fa8 mib16 re mib8 mib4 re8
    lab'?4.\p sol
    fa8 mib16 re mib8 mib4 re8

    %22
    sol \parenthesize \f do,4 mib16 re do4
    sol '8 do,4 mib16 re do4
    lab'16 sol fa mib re do si la sol fa mib re

    %25
    mib8 fa sol do,4 r8\mbreak
    R2.*8
    lab'8\parenthesize \p r r lab r r

    %35
    lab? r r lab sol r
    sol r r sol r r
    sol r r sol fa r

    %38
    sib r r do r r
    do r r re r r
    re r r mib r r

    %41
    mib r r fa r r
    R2.*2
    do'4.\parenthesize \f  sib

    %45
    lab8 sol16 fa sol8 sol4(fa8)
    do4.\parenthesize \p sib
    lab8 sol16 fa sol8 sol4(fa8)

    %48
    R2.*9
    mib'4.\parenthesize \f sib\mbreak
    sol'16 sib lab sol fa mib mib4(re8)

    %59
    mib4. sib
    sol'16 sib lab sol fa mib mib4(re8)
    reb4. do4 \parentSlur (sib8)

    %62
    sib' \staccatissimo sib \staccatissimo reb, reb do r
    mib4. re!4\parentSlur (do8)
    do' do mib, mib re r

    %65
    la'4. sol
    fa8 mib16 re mib8 mib4(re8)
    do4. sib\p

    %68
    lab8 sol16 fa sol8 sol4(fa8)
    sib\f mib,4 sol16 fa mib4
    sib'8 mib,4 sol16 fa mib4\mbreak

    %71
    do'16 sib lab sol fa mib re8 fa' lab,
    sol fa4 mib r8
    R2.*3

    %76
    r4 r8 r fa\p fa'
    R2.*3
    r4 r8 r sol,\p sol'

    %81
    R2.
    r4 r8 r re, re'
    R2.

    %84
    r4 r8 r do, do'
    R2.
    fad8 r r r4 r8

    %87
    sol8 r r r4 r8
    fad8 r r r4 r8
    sol8 r r r4 r8

    %90
    fad\p fad fad r4 r8
    sol sol sol r4 r8
    fad fad fad r4 r8

    %93
    R2.*10
    do4. \f sol
    mib'16 sol fa mib re do do4 \parentSlur (si8)

    %105
    R2.*2
    sol'16 lab sib4 \mbreak lab16 sol fa mib re do
    sib8 lab' lab lab sol r

    %109
    R2.*2
    lab8 do, do sol'16 do, re mib re do
    lab'8 r r sol r r

    %113
    lab16\parenthesize \f sol fa mib re do si sol' fa mib re do
    si mib re do si la sol sol fa mib re do
    si mib re do si la sol4 r8

    %116
    R2.*4
    lab''4. sol
    fa8 \parenthesize \p r r r4 r8\mbreak

    %122
    sol4. fa
    mib8 r r r4 r8
    fa4. mib

    %125
    re8 r r r4 r8
    R2.*6
    sol8 do,4 mib16 (re) do4

    %133
    sol'8 do,4 mib16 (re) do4
    lab'16 sol fa mib re do si la sol fa mib re\mbreak
    mib8 fa sol do,4\fermata r8

}


IIIvlIIn = \relative do'' {

    do4. sol
    mib'16 sol fa mib re do do4 si8
    do4. sol

    %&4
    mib'16 sol fa mib re do do4 si8
    sol'16 lab sib4 lab16 sol fa mib re do
    sib8 fa' fa fa mib r

    %7
    mib16 (fa sol4) fa16 mib re do si la
    sol8 re' re re do r
    lab' do, do sol'16 do, re mib re do

    %10
    lab'8 do, do sol'16 do, re mib re do
    lab' sol fa mib re do si sol' fa mib re do
    si mib re do si la\mbreak sol sol fa mib re do

    %13
    si mib re do si la sol4 r8
    reb''4. do4 \parentSlur (sib8)
    sol' sol sib, sib la! r

    %16
    mib'4. re?4 (do8)
    la' la do, \parentSlur (do) si r
    fa'4. mib

    %19
    re8 do16 si do8 do4 si8
    fa'4.\p mib
    re8 do16 si do8 do4 si8

    %22
    sol '8\f do,4 mib16 re do4
    sol '8 do,4 mib16 re do4
    lab'16 sol fa mib re do si la sol fa mib re

    %25
    mib8 fa sol do,4 r8\mbreak
    R2.*8
    mib8\parenthesize \p r r mib r r

    %35
    fa r r fa mib r
    mib r r mib r r
    mib r r mib re r

    %38
    mib r r mib r r
    fa r r fa r r\mbreak
    sol r r sol r r

    %41
    lab r r lab r r
    R2.*2
    lab'4.\f sol

    %45
    fa8 mib16 re mib8 mib4(re8)
    lab4. sol
    fa8 mib16 re mib8 mib4(re8)

    %48
    R2.*9
    mib'4.\f sib\mbreak
    sol'16 sib lab sol fa mib mib4(re8)

    %59
    mib4. sib
    sol'16 sib lab sol fa mib mib4(re8)
    reb4. do4 (sib8)

    %62
    sib' \parenthesize \staccatissimo sib\parenthesize \staccatissimo reb, reb do r
    mib4. re!4 (do8)
    do' do mib, mib re r

    %65
    fa4. mib
    lab,8 sol16 fa sol8 sol4(fa8)
    lab4. sol\p

    %68
    fa8 mib16 re mib8 mib4 \parentSlur (re8)
    sib'\f mib,4 sol16 fa mib4
    sib'8 mib,4 sol16 fa mib4\mbreak

    %71
    do'16 sib lab sol fa mib re8 fa' lab,
    sol fa4 mib r8
    R2.*3

    %76
    r4 r8 r fa\p fa'
    R2.*3
    r4 r8 r sol,\p sol'

    %81
    R2.
    r4 r8 r re, re'
    R2.

    %84
    r4 r8 r do, do'
    R2.
    la8 r r r4 r8

    %87
    sib8 r r r4 r8
    la8 r r r4 r8
    sib8 r r r4 r8

    %90
    la8\p la la r4 r8
    sib8 sib sib r4 r8
    la8 la la r4 r8

    %93
    R2.*10
    do4.\f sol
    mib'16 sol fa mib re do do4 \parentSlur (si8)

    %105
    R2.*2
    sol'16 lab sib4 \mbreak lab16 sol fa mib re do
    sib8 fa' fa fa mib r

    %109
    R2.*2
    lab8 do, do sol'16 do, re mib re do
    do8 r r do r r

    %113
    lab'16 \f sol fa mib re do si sol' fa mib re do
    si mib re do si la sol sol fa mib re do
    si mib re do si la sol4 r8

    %116
    R2.*4
    fa''4. mib
    re8\p r r r4 r8

    %122
    mib4. re
    do8 r r r4 r8
    re4. do

    %125
    si8 r r r4 r8
    R2.*6
    sol'8 do,4 mib16 (re) do4

    %133
    sol'8 do,4 mib16 (re) do4
    lab'16 sol fa mib re do si la sol fa mib re\mbreak
    mib8 fa sol do,4\fermopz r8

}


IIIvlan = \relative do' {

    \footnote #' (-1 . 2) \markup\column\smaller {"Nel manoscritto mancano alcune battute nella parte di Viola. Sostituite con pause." "  "}  sol'8 fa mib re do si
    do4 mib8 mib4(re8)
    sol fa mib re do si

    %4
    do4 mib8 mib4(re8)
    do do do do do do
    fa sib, sib sib sib sib

    %7
    mib mib mib re re re
    re sol, sol sol sol do\mbreak
    do do do do do do

    %10
    do do do do do do
    do do do sol'4 r8
    r4 r8 r16 sol fa mib re do

    %13
    si mib re do si la sol4 r8
    sol' sol sol sol sol sol
    sib sib sol sol fa r\mbreak

    %16
    la la la la la la
    do do la~la sol r
    si4. do

    %19
    si8 sol sol sol4.
    si4.\parenthesize \p do
    si8 sol sol sol4.

    %22
    sol8\parenthesize \f sol sol lab lab lab\mbreak
    mib mib mib mib mib mib
    fa4 r8 re4 r8

    %25
    mib fa sol do,4 r8
    R2.*8
    do8\p r r do r r

    %35
    sib r r sib sib r
    do r r sib r r
    la! r r sib sib r

    %38
    sol r r lab r r\mbreak
    lab? r r sib r r
    do r r do r r

    %41
    do r r re r r
    R2.*2
    re4.\f mib

    %45
    re8 sib' sib sib4.
    re,4.\p mib
    re8 sib sib sib4.

    %48
    R2.*9
    sib'8\parenthesize \f lab sol fa mib re\mbreak
    mib4 sol8 sol4 \parentSlur (fa8)

    %59
    sib lab sol fa mib re
    mib4 sol8 sol4(fa8)
    mib mib mib mib mib mib

    %62
    mib mib mib mib mib mib
    fa fa fa fa fa fa
    fa fa fa fa fa r\mbreak

    %65
    re4. mib
    fa8 sib, sib sib4.
    re mib\p

    %68
    re8 sib sib sib4.
    sib8\f sib sib do do do
    sol sol sol sol sol sol

    %71
    mib'4 r8 sib4 fa'8
    mib re4 mib r8\mbreak
    R2.*17

    %90
    re8\p r r r4 r8
    re r r r4 r8
    re r r r4 r8

    %93
    R2.*14
    do8 do do do do do
    fa sib, sib sib4 r8

    %109
    R2.*2\mbreak
    do8 do do do do do
    R2.

    %113
    do8 do do sol'4 r8
    r4 r8 r16 sol fa mib re do
    si mib re do si la sol4 r8

    %116
    R2.*16\mbreak
    sol'8 sol sol lab lab lab
    mib mib mib mib mib mib

    %134
    fa4 r8 re4 r8
    mib fa sol do,4\fermata r8

}

IIImdn = \relative do'' {

    <<{do4. sol
    mib'16 sol fa mib re do}\\{mib,8 re do}>> do'4 si8
    do4. sol

    %4
    mib'16 sol fa mib re do do4 si8
    sol'16 lab sib4 lab16 sol fa mib re do
    sib8 lab' lab lab sol r

    %7
    mib16 fa sol4 fa16 mib re do si la
    sol8 fa' fa fa mib r
    lab do, do sol'16 do, re mib re do

    %10
    lab'8 do, do sol'16 do, re mib re do
    lab' sol fa mib re do si sol' fa mib re do
    si mib re do si la\mbreak sol sol fa mib re do

    %13
    \stemUp \giu si \su mib re do \giu si  la sol4 r8
    \su \stemNeutral reb''4. do4 (sib8)
    sol' sol sib, sib la! r

    %16
    mib'4. re?4 (do8)
    la' la do,\parentSlur (do) si r
    <<
        {
            lab'4. sol

            %19
            fa8 mib16 re mib8 mib4 re8
            lab'?4. sol
            fa8 mib16 re mib8 mib4 re8
        }\\{
            fa4. mib
            re8 do16 si do8 do4 si8
            fa'4. mib
            re8 do16 si do8 do4 si8
        }
    >>

    %22
    sol' do,4 mib16 re do4
    sol '8 do,4 mib16 re do4
    lab'16 sol fa mib re do si la sol fa mib re

    %25
    mib8 fa sol do,4 r8
    \stemUp do'4.\solo sol
    \stemNeutral mib'16 sol fa mib re do do4 si8

    %28
    do4. sol
    mib'16 sol fa mib re do do4 si8
    <<{do16 do' sib lab sol fa mib sol fa mib re do}\\{do,4 s8 do4 s8}>>

    %31
    lab''4.\mbreak do,
    sib16 sib' lab sol fa mib re fa mib re do sib
    sol'4. sib,

    %34
    lab16 sol lab8 mib' lab,16 sol lab8 mib'
    lab,16 sol lab8 fa' lab, sol r
    sol16 fa sol8 mib' sol, 16 fa sol8 mib'

    %37
    sol, 16 fa sol8 mib' sol,8 fa r
    sib16 mib, fa sol fa mib do' sib lab sol fa mib
    do' fa, sol lab sol fa re' do sib lab sol fa\mbreak

    %40
    re' sol, lab sib lab sol mib' re do sib lab sol
    mib' lab, sib do sib lab fa' mib re do sib lab
    lab'? sol fa mib re do do' sib lab! sol fa mib

    %43
    re do sib lab sol fa sol8 fa r
    <<
        {
            do''4.\tu  sib
            lab8 sol16 fa sol8 sol4\parentSlur (fa8)

            %46
            do4. sib
            lab8 sol16 fa sol8 sol4\parentSlur (fa8)
        }\\{
            lab'4. sol
            fa8 mib16 re mib8 mib4\parentSlur (re8)
            lab4. sol
            fa8 mib16 re mib8 mib4\parentSlur (re8)
        }
    >>
    sib'\solo reb,4 mib16 fa sol lab sib do

    %49
    reb8 do sib sib4(do8)
    do do,4\mbreak fa16 sol lab sib do re
    mib8 re do do4(re8)

    %52
    \tuplet 3/2 { lab'16 sib do } fa,4 \tuplet 3/2 { sol16 lab sib} mib,4
    \tuplet 3/2 { fa16 sol lab } re,4 re(mib8)
    \tuplet 3/2 { lab,16 sib do } fa,4 \tuplet 3/2 { sol16 lab sib} mib,4

    %55
    \tuplet 3/2 { fa16 sol lab? } re,4 mib'8 re16 do sib lab!
    sol8 fa4 mib r8
    mib'4.\tu sib

    %58
    sol'16 sib lab sol fa mib mib4(re8)
    mib4. sib
    sol'16 sib lab sol fa mib mib4\parentSlur (re8)
    reb4. do4 (sib8)

    %62
    sib'\parenthesize \staccatissimo sib\parenthesize\staccatissimo reb, reb do r
    mib4. re!4 \parentSlur (do8)
    do' do mib, mib re r

    %65
    <<
        {
            do'4. sib
            lab?8 sol16 fa sol8 sol4\parentSlur (fa8)
            do4. sib

            %68
            lab8 sol16 fa sol8 sol4 \parentSlur (fa8)
        } \\{
            lab'4. sol
            fa8 mib16 re mib8 mib4\parentSlur (re8)
            lab4. sol
            fa8 mib16 re mib8 mib4 \parentSlur (re8)
        }
    >>
    sib' mib,4 sol16 fa mib4
    sib'8 mib,4 sol16 fa mib4\mbreak

    %71
    do'16 sib lab sol fa mib re8 fa' lab,
    sol fa4 mib r8
    \giu\stemUp sol,16 sib \su mib\giu sib sol sib sol sib \su mib\giu sib sol sib

    %74
    sol sib \su mi\giu sib sol sib sol sib \su mi\giu sib sol sib
    \su <<{<fa' do>4 s8 <fa do>4 s8}\\{\giu \stemUp\override Stem.cross-staff = ##t	\override Stem.length = #12  \override Flag.style = #'no-flag  lab,4 s8 lab4 s8}>>
    \stemNeutral fa'16 lab do fa do lab fa8 r r

    %77
    \giu la,?16 \su re fa re \giu la \su re\mbreak \giu la16 \su re fa re \giu la \su re
    \giu la16 \su do fad do \giu la \su do \giu la16 \su do fad do \giu la \su do
    <<{<sol' re>4 r8 <sol re sib>4 r8}\\{\giu \stemUp\override Stem.cross-staff = ##t	\override Stem.length = #12  \override Flag.style = #'no-flag  sib,4 }>>

    %80
    sol'16 sib re sol re sib sol8 r r
    sib'16 la sol fa mib re mib sol fa mib re dod
    dod?4. re

    %83
    la'16 sol fa mib re dod re fa mi re do? si\mbreak
    si?4.(do)
    \stemUp sol'16 fa mib! re do si \stemNeutral do mib re do si la

    %86
    fad'8 mib re do sib la
    sol' re do sib la sol
    fad' mib re do sib la

    %89
    sol' re do sib la sol
    fad16 \parentSlur (la re4) fad16(sol la4)
    sol,16(sib re4) sol16(la sib4)

    %92
    fad,16 \parentSlur (la re4) la'16(sib do4)
    sib16 la sol fa mib re\mbreak mib sol fa mib re do
    la' sol fa mib re do re fa mib re do sib

    %95
    sol' fa mib re do sib do mib re do sib la
    fad' la do, mib re do sib re do sib la sol
    fad la do, mib re do \stemUp \giu sib \su re do \giu sib la sol

    %98
    fad4 r8 \su <re'' la re,>4\stemNeutral r8
    sib16 re sol8 sib, la16 do fad8 la,
    sib sol' fa mib re do

    %101
    sib16(do re8) sol, fad16(sol la8) fad\mbreak
    \stemUp sol re16 do\giu sib la  sol4 r8
    \su do'4.\tu sol

    %104
    \stemNeutral mib'16 sol fa mib re do do4(si8)
    do4.\solo sol
    mib'16 sol fa mib re do do4(si8)

    %107
    sol'16\tu lab sib4 lab16 sol fa mib re do
    sib8 lab' lab lab sol r
    mib16\solo fa sol4 fa16 mib re do si la

    %110
    sol8 fa' fa fa mib r
    lab\tu do, do sol'16 do, re mib re do\mbreak
    lab'8 \solo do, do sol'16 do, re mib re do

    %113
    lab' sol fa mib re do si sol' fa mib re do
    si mib re do si la sol sol fa mib re do
    \stemUp \giu si \su mib re do \giu si la sol4 r8\stemNeutral

    %116
    \su sol'16 sib reb4 do(sib8)
    <<{sol' sol sib, sib la r}\\{do, do do do do do}>>
    la'16(do mib4) re do8

    %119
    la' la do,\mbreak  do si r
    <<{lab'4. sol}\\{fa mib}>>
    fa16 re si' re, fa re fa re si' re, fa re

    %122
    <<{sol4. fa}\\{mib re}>>
    mib16 do do' do, mib do mib do do' do, mib do
    <<{fa4. mib}\\{re do}>>

    %125
    <<{re8 la' sol fad sol do,
       si? lab' sol fad sol do,
       si16 sol la si do re}\\{si?8 r r r r mib,
                               re4 r8 r r mib
                               re4 r8}>> mib'16 si do re mib fa

    %128
    <<{sol8 do,4 mib16 re do4
    sol'8 do,4 mib16 re do4}\\{do,8 do do do do do
                               do do do do do do}>>
    lab''16 sol fa mib re do si lab' sol fa mib re

    %131
    <do' sol mib>8 <do sol mib> <si sol re> <do sol mib>4 r8\mbreak
    sol8\tu do,4 mib16 (re) do4
    sol'8 do,4 mib16 (re) do4

    %134
    lab'16 sol fa mib re do si la sol fa mib re\mbreak
    mib8 fa sol do,4.\fermata

}

IIImsn = \relative do {

   s4. \giu si'8 la sol
   \su do4 \giu\stemNeutral do,8 sol' sol ,fa'
    mib re do si la sol

    %4
    do4 do,8 sol' sol' fa
    mi mi mi fa fa fa
    re re re mib? mib mib

    %7
    do do do re re re
    si si si do do do
    fa fa fa mib mib mib\mbreak

    %10
    fa fa fa mib mib mib
    fa fa fa sol4 r8
    r4 r8 r16 sol fa mib re do

    %13
    \stemDown si mib re do si la sol4\stemNeutral  r8
    mi' mi mi mi mi mi
    mi? mi mi fa fa fa

    %16
    fad fad fad fad fad fad
    fad? fad fad sol sol sol
    sol sol sol sol sol sol

    %19
    sol sol sol sol sol sol
    sol sol sol sol sol sol\mbreak
    sol sol sol sol sol sol

    %22
    mib mib mib fa fa fa
    sol sol sol lab lab lab
    fa4 r8 sol4 r8

    %25
    mib fa sol do,4 r8
    \stemDown \su mib' re do \giu si la sol
    \su do4 \stemNeutral \giu do,8 sol' sol, fa'

    %28
    mib re do si la sol
    do4 do,8 sol' sol' fa
    mib4 r8 mib4 r8
    \stemDown \giu fa16 lab \su do\giu lab fa lab fa lab \su do\giu lab fa lab

    %32
    <sib re,>4 r8 <sib re,>4 r8\stemNeutral
    mib,16 sol sib sol mib sol mib sol sib sol mib sol
    do,8 do do do do do

    %35
    re re re mib mib mib
    do do do sib sib sib
    la! la la sib sib lab

    %38
    sol4 r8 lab4 r8
    lab4 r8 sib4 r8
    sib4 r8 do4 r8

    %41
    do4 r8 re4 r8
    R2.
    r4. mib8 sib r

    %44
    sib8 sib sib sib sib sib
    sib sib sib sib sib sib
    sib sib sib sib sib sib

    %47
    sib sib sib sib sib sib
    sol sol sol sol sol sol
    sol sol sol lab lab lab

    %50
    la! la la la la la
    la la la sib sib sib
    re re re mib mib mib

    %53
    sib sib sib do do do
    re re re mib mib mib
    sib sib sib do4 lab'8

    %56
    sib4 sib,8 mib4.
    sol8 fa mib re do sib
    mib4 mib,8\mbreak sib' sib' lab

    %59
    sol fa mib re do sib
    mib4 mib,8 sib' sib' lab
    sol sol sol sol sol sol

    %62
    sol sol sol lab lab lab
    la! la la la la la
    la la la sib sib sib

    %65
    sib, sib sib sib sib sib
    sib sib sib sib sib sib\mbreak
    sib sib sib sib sib sib

    %68
    sib sib sib sib sib sib
    sol sol sol lab lab lab
    sib sib sib do do do

    %71
    lab4 r8 sib4 re8
    mib sib' sib, mib4 r8
    mib,4 r8 mib4 r8

    %74
    do4 r8 do4 r8
    \shiftOn fa16 lab do fa do lab fa lab do fa do lab
     fa4 r8 r4.

    %77
    re4 r8 re4 r8
    re4 r8 re4 r8
     \shiftOn sol16 sib re sol re sib sol sib re sol re sib

    %80
     sol4 r8 r4.
    <<{sib'8 sib sib sib sib sib
       la la la la la la

       %83
       la la la la la la
       sol sol sol sol sol sol
       sol sol sol sol sol sol}\\{sol sol sol sol sol sol
                                  fad fad fad fad fad fad
                                  fa! fa fa fa fa fa
                                  mib mib mib mib mib mib
                                  mib mib mib mib mib mib}>>

    %86
    <<{la \su\stemDown do sib\giu \stemUp la sol fad
       r sib la sol fad mi
       r \su \stemDown do' sib\giu\stemUp la sol fad

       %89
       r sib la sol fad mi}\\{\stemDown re4 r8 r4.
                              re4 r8 r4.
                              re4 r8 r4.
                              re4 r8 r4.}>>
    re8  re re re re re
    re re re re re re

    %92
    re re re re re re
    sol4 r8 do,4 r8
    fa4 r8 sib,4 r8

    %95
    mib4 r8 la,4 r8
    re4 r8 r4.
    re4 r8 r4.

    %98
    re,4 s8  fad'4 r8
    sol4 r8 re'4 r8
    sol,4 r8 r4.

    %101
    sol4 r8 re4 r8
    sol,4 r8 r4.
    \su \stemDown mib''8 re do \giu  si la sol

    %104
    \su do4 \giu \stemNeutral do,8 sol' sol, fa'
    mib re do si la sol
    do4 do,8 sol' sol' fa
    mi8 mi mi fa fa fa\mbreak

    %108
    re re re mib mib mib
    do do do re re re
    si si si do do do
    fa8 fa fa mib mib mib

    %112
    fa fa fa mib mib mib
    fa fa fa sol4 r8
    r4. r16 sol fa mib re do

    %115
    \stemDown si mib re do si la \stemNeutral sol4 r8
    <<{sol'8 sol sol sol sol sol
       sol sol sol s s s

       %118
       la la la la la la
       la la la}\\{mi8 mi mi mi mi mi
                   mi? mi mi fa fa fa
                   fad fad fad fad fad fad
                   fad? fad fad}>> sol sol sol
    sol sol sol sol sol sol

    %121
    sol4 r8 r4.
    sol8 sol sol sol sol sol
    sol4 r8 r4.

    %124
    sol8 sol sol sol sol sol
    sol4 r8 r r sol
    sol4 r8 r r sol

    %127
    sol4 r8 r4.
    mib8 mib mib fa fa fa
    sol sol sol lab lab lab

    %130
    fa4 r8 sol4 r8
    mib fa sol do,4 r8
    mib8 mib mib fa fa fa

    %133
    sol sol sol lab lab lab
    fa4 r8 sol4 r8
    mib fa sol do,4 r8

}

IIIbcn = \relative do {

    mib'8 re do si la sol
    do4 do,8 sol' sol ,fa'
    mib re do si la sol

    %4
    do4 do,8 sol' sol' fa
    mi mi mi fa fa fa
    re re re mib? mib mib

    %7
    do do do re re re
    si si si do do do
    fa fa fa mib mib mib\mbreak

    %10
    fa fa fa mib mib mib
    fa fa fa sol4 r8
    r4 r8 r16 sol fa mib re do

    %13
    si mib re do si la sol4 r8
    mi' mi mi mi mi mi
    mi? mi mi fa fa fa

    %16
    fad fad fad fad fad fad
    fad? fad fad sol sol sol
    sol sol sol sol sol sol

    %19
    sol sol sol sol sol sol
    sol,\p sol sol sol sol sol\mbreak
    sol sol sol sol sol sol

    %22
    mib'\parenthesize \f mib mib fa fa fa
    sol sol sol lab lab lab
    fa4 r8 sol4 r8

    %25
    mib fa sol do,4 r8
    R2.*8
    do8\p r r do r r

    %35
    re r r mib mib r
    do r r sib r r
    la! r r sib sib r

    %38
    sol r r\mbreak lab r r
    lab? r r sib r r
    sib r r do r r

    %41
    do r r re r r
    R2.*2
    sib8\f sib sib sib sib sib

    %45
    sib sib sib sib sib sib
    sib\p sib sib sib sib sib
    sib sib sib sib4 r8

    %48
    R2.*9
    sol'8\parenthesize \f fa mib re do sib
    mib4 mib,8\mbreak sib' sib' lab

    %59
    sol fa mib re do sib
    mib4 mib,8 sib' sib' lab
    sol sol sol sol sol sol

    %62
    sol sol sol lab lab lab
    la! la la la la la
    la la la sib sib sib

    %65
    sib, sib sib sib sib sib
    sib sib sib sib sib sib\mbreak
    sib sib sib sib\p sib sib

    %68
    sib sib sib sib sib sib
    sol\f sol sol lab lab lab
    sib sib sib do do do

    %71
    lab4 r8 sib4 re8
    mib sib' sib, mib4 r8
    R2.*13

    %86
    re8 r r r4 r8
    re r r r4 r8\mbreak
    re r r r4 r8

    %89
    re r r r4 r8
    re\parenthesize \p re re r4 r8
    re re re r4 r8

    %92
    re re re r4 r8
    R2.*10
    mib'8\parenthesize \f re do si la sol

    %104
    do4 do,8 sol'4 r8
    R2.*2
    mi8 mi mi fa fa fa\mbreak

    %108
    re re re mib4 r8
    R2.*2
    fa8 fa fa mib mib mib

    %112
    R2.
    fa8\parenthesize \f fa fa sol4 r8
    r4 r8 r16 sol fa mib re do

    %115
    si mib re do si la sol4 r8
    R2.*16
    mib'8 mib mib fa fa fa

    %133
    sol sol sol lab lab lab\mbreak
    fa4 r8 sol4 r8
    mib fa sol do,4 r8

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}


forma = {

    \time 6/8
    \tempo 2. = 45
    \key sol\minor
    s2.*135
    \bar "|."

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

IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>

}

IIImd = {
    \IIIglobal
    \context Staff = up
    <<\IIImdn \forma>>

}

IIIms = {
    \IIIglobal
    \clef bass
    \context Staff = down
    <<\IIImsn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Concerto per Cembalo [GraunWV Bv:XIII:50] }
    composer = \markup \center-column{"C. H. Graun (1704-1759)"}

}

\markup \huge {[1.] Allegro}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""1.mo"}
            \set Staff.shortInstrumentName = "vl1"
            \IvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""2.do"}
            \set Staff.shortInstrumentName = "vl2"
            \IvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \Ivla
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"harpsichord"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Cembalo""Ob[b]ligato"}
                \set PianoStaff.shortInstrumentName = "cmb"
                \clef violin
                \Imd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \Ims
            >>
        >>


        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.shortInstrumentName = "bc"
            \Ibc

        >>
    >>

    \layout {

        indent = 1.6\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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

\markup \huge {[2.] Larghetto}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""1.mo"}
            \set Staff.shortInstrumentName = "vl1"
            \IIvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""2.do"}
            \set Staff.shortInstrumentName = "vl2"
            \IIvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIvla
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"harpsichord"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Cembalo""Ob[b]ligato"}
                \set PianoStaff.shortInstrumentName = "cmb"
                \clef violin
                \IImd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IIms
            >>
        >>


        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.shortInstrumentName = "bc"
            \IIbc

        >>
    >>

    \layout {

        indent = 1.6\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""1.mo"}
            \set Staff.shortInstrumentName = "vl1"
            \IIIvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""2.do"}
            \set Staff.shortInstrumentName = "vl2"
            \IIIvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIIvla
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"harpsichord"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Cembalo""Ob[b]ligato"}
                \set PianoStaff.shortInstrumentName = "cmb"
                \clef violin
                \IIImd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IIIms
            >>
        >>


        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.shortInstrumentName = "bc"
            \IIIbc

        >>
    >>

    \layout {

        indent = 1.6\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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
