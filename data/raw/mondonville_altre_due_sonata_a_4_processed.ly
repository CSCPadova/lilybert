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

dolce = _\markup\italic {Doux}

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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {
   
   sib'4 la8-+ sol fa mib re do
   sib4 la8_+ sol fa mib re do
   re fa sib re, mib sol sib sol\mbreak
   
   %4
   re fa sib re, mib sol sib sol
   re fa sib re, do mib la do,
   sib4 sib' la8_+ sol fa mib
   
   %7
   re sib' \afterGrace sib4-+({la16[sib)]} fa'8 sib, \afterGrace sib4-+({la16[sib)]}
   do8 la la4_+ fa8 la la4_+\mbreak
   sib8 fa' \afterGrace fa4-+({mib16[fa)]} sib8 sib, \afterGrace sib4-+({la16[sib)]}
   
   %10
   do4 do~do8 sib la sol
   fa4 fa'2 fa,4~
   fa fa'2 fa,4~
   
   %13
   fa fa'2 sib8 la
   sol4-+ do, do do~\mbreak
   do8 sib la sol fa4 mib?_+
   
   %16
   \senza \tuplet 3/2 { re8(sib do) re[(do sib)] } re'4 re~
   re8 do si la sol4 fa_+
   \tuplet 3/2 { mi8(do re) mi[(re do)] } mi'4 mi~
   
   %19
   mi8 re dod si? la4 sol_+\mbreak
   \tuplet 3/2 { fa8(re mi) fa[(mi re)] } fa'4 fa~
   fa8 mi re do sib4 la_+
   
   %22
   \tuplet 3/2 { sol8(mi fa) sol[(fa mi)] } sol'4 sol~
   sol8 fa mi re do4 sib-+\mbreak
   \tuplet 3/2 { la8(fa sol) la[(sol fa)] la'(sol fa) la[(sol fa)] }
   
   %25
   do'4 la sol\parenthesize -+ fa
   sib, la sol_+ fa
   <re sib>2 <re sib>
   
   %28
   mi4 fa8 sol la4 sol\mbreak
   do, fa mi4._+ fa8
   fa1
   
   %31 OOKK
   fa'4 mi8-+ re do sib la sol
   fa4 mi8_+ re do sib la sol
   la do fa la, sib re fa sib,\mbreak
   
   %34
   la do fa la, sib re fa sib,
   la do fa la sol sib mi sol,
   fa4 fa' mi8 re do sib
   
   %37
   la fa' \afterGrace fa4-+( {mi16 fa)]} do8 fa \afterGrace fa4-+( {mi16 fa)]}\mbreak
   sol8 do, \afterGrace do4-+( {si?16 do)]} mi,8 do' \afterGrace do4-+( {si16 do)]}
   fa,8 do' \afterGrace do4-+( {si?16 do)]} fa8 do \afterGrace do4-+( {si16 do)]}
   
   %40
   sol4 do8 sib? la sol fad mi
   re (re') re(fad) fad(la) la(fad)\mbreak
   re,(re') re(sol) sol(sib) sib(sol)
   
   %43
   re, (re') re(fad) fad(la) la(fad)
   re,(re') re(sol) sol(sib) sib(sol)
   re,(sol) sol(sib) sib(re) re(sib)
   
   %46
   sol4 mib'8(re) do(re) sib(do)\mbreak
   la sol fad_+ mi re4 r
   re' sol, re sol,
   
   %49
   re' sol re' sol,
   fad_+ sol8 la sib(re,)la'(re,)
   re' re, sol la fad4. sol8
   
   %52
   sol2 r\mbreak
   sol'4 fa?8-+ mib re do sib la
   sol4 fa8_+ mib re do sib la
   
   %55
   sol4 sol'2 sol,4~
   sol sol'2 sol,4~
   sol sol' \appoggiatura sol8 la4._+ sib8
   
   %58
   la4 re, r2\mbreak
   sib''4 la8-+ sol fa mib re do
   sib4 la8_+ sol fa mib re do
   
   %61
   re fa sib re, mib sol sib mib,
   re fa sib re, mib sol sib mib,
   re fa sib re, do mib la do,\mbreak
   
   %64
   sib4 sib' la8_+ sol fa mib
   re sib' \afterGrace sib4-+({la16[sib)]} fa'8 sib, \afterGrace sib4-+({la16[sib)]}
   do8 la la4 _+ fa8 la la4 _+\mbreak
   
   %67
   sib8 fa' \afterGrace fa4-+({mi?16[fa)]} sib8 sib, \afterGrace sib4-+({la16[sib)]}
   do4 fa fa fa~\mbreak
   fa8 mib re do sib4 lab_+
   
   %70
   \tuplet 3/2 { sol8(mib fa) sol[(fa mib)] } sol'4 sol~
   sol8 fa mi re do4 sib-+
   \tuplet 3/2 { la8(fa sol) la[(sol fa)] } la'4 la~
   
   %73
   la8 sol fad mi re4 do-+\mbreak
   \tuplet 3/2 { sib8(sol la) sib[(la sol)] } sib'4 sib~
   sib8 la sol fa mib?4 re-+
   
   %76
   \tuplet 3/2 { do8(la sib) do[(sib la)] } do'4 do~
   do8 sib la sol fa4 mib-+
   \tuplet 3/2 { re8(sib do) re[(do sib)]  re,(do sib) re'[(do sib)]} \mbreak
   
   %79
   fa'4 re do-+ sib
   mib, re do_+ sib
   <sib' sol>2 <sib sol>
   
   %82
   la4 sib8 do re4 do
   fa, sib la4._+ sib8
   sib1
  
}

IvlIIn = \relative do'' {
   
   <sib fa sib,>2 <sib fa sib,>
   <sib fa sib,>2. re8 mib
   fa sib re, sib' sol sib mib, sib'
   
   %4
   fa sib re, sib' sol sib mib, sib'\mbreak
   fa sib re, sib' mib, fa do mib
   re4-+ sib r re8 mib
   
   %7
   fa re sib fa \once\stemUp re fa' mib-+ re
   mib do la fa \once\stemUp do mib' re-+ do
   re sib fa[re] sib \once\stemUp re' do-+ sib\mbreak
   
   %10
   la4_+ fa r la8 sib
   do\upl fa,(mi fa) re'\upl fa,(mi fa)
   do'\upl fa,(mi fa) re'\upl fa,(mi fa)
   
   %13
   do' fa, re' do sib la sol fa
   mi4 _+ do r2\mbreak
   fa4 fa fa fa
   
   %16
   \senza \tuplet 3/2 { fa8(re mi?) fa[(mi re)] fa(sib, do) re[(do sib)] }
   sol'4 sol sol sol
   \tuplet 3/2 { sol8(mi fa) sol[(fa mi)] sol(do, re) mi[(re do)]}
   
   %19
   la'4 la la la\mbreak
   \tuplet 3/2 { la8(fa sol) la[(sol fa)] la(re, mi) fa[(mi re)] }
   sib'4 sib sib sib
   
   %22
   \tuplet 3/2 { sib8(sol la) sib[(la sol)] sib(mi, fa) sol[(fa mi)] }
   do'4 do do do\mbreak
   \tuplet 3/2 { do8(la sib) do[(sib la)] fa'(mi re) do[(sib la)] }
   
   %25
   sol4 la sib la
   sol_+ la sib la
   <sib fa sib,>2 <sib fa sib,>
   
   %28
   sol4_+ fa8 mi? \appoggiatura mi16 fa4 sib\mbreak
   la4.-+ sol8 sol4.-+ fa8
   fa1
   
   %31
   <la fa do>2 <la fa do>
   <la fa do>2. la8 sib
   do fa la, fa' re fa sib, fa'
   
   %34
   do fa la, fa' re fa sib, fa'\mbreak
   do fa la, fa' sib, do sol sib
   la4_+ fa r la8 sib
   
   %37
   do la fa do la do' sib_+ la
   sib sol mi do sol sib' la _+ sol
   la fa do la fa' la sol_+ fa
   
   %40
   mi4_+ do r2\mbreak
   la'4 re do-+ sib8 la
   \appoggiatura la16 sib4 re sib sol
   
   %43
   \appoggiatura sol16 la4 re do-+ sib8 la
   \appoggiatura la16 sib4 re sib sol
   sol' re sol4. fa?8
   
   %46
   mib(re) do(sib) la(sib) sol(la)
   fad4_+ re r la'\mbreak
   la sib do sib
   
   %49
   la sib do sib
   la _+ sol8 fad \appoggiatura fad8 sol4 do
   sib4.-+ la8 la4._+ sol8
   
   %52
   sol2 r
   sib8(re,) re'(re,) la'(re,) re'(re,)
   sib'(re,) la'(re,) sol la sib do\mbreak
   
   %55
   re_\upl sol,(fad sol) mib'_\upl sol,(fad sol)
   re'_\upl sol,(fad sol) mib'_\upl sol,(fad sol)
   re' sol, mib' re do sib la sol
   
   %58
   fad4_+ re r2
   sib'8(fa?) re'(fa,) do'(fa,) fa'(fa,)
   re'(fa,) do'(fa,) sib do re mib\mbreak
   
   %61
   fa sib re, sib' sol sib mib, sib'
   fa sib re, sib' sol sib mib, sib'
   fa sib re, sib' mib, fa do mib
   
   %64
   re4-+ sib r re8 mib
   fa re sib fa \once\stemUp re fa' mib-+ re
   mib do la fa \once\stemUp do mib' re-+ do\mbreak
   
   %67
   re sib fa re sib \once\stemUp re' do_+ sib
   la4_+ fa r2
   sib4 sib sib sib
   
   %70
   \tuplet 3/2 { sib8(sol lab) sib[(lab sol)] sib(mib, fa) sol[(fa mib)] }
   do'4 do do do
   \tuplet 3/2 { do8(la? sib) do[(sib la)] do(fa, sol) la[(sol fa)] }\mbreak
   
   %73
   re'4 re re re
   \tuplet 3/2 { re8(sib do) re[(do sib)] re(sol, la) sib[(la sol)]}
   mib'4 mib mib mib
   
   %76
   \tuplet 3/2 { mib8(do re) mib[(re do)] mib(la, sib) do[(sib la)] }
   fa'4 fa fa fa\mbreak
   \tuplet 3/2 { fa8(re mib) fa[(mib re)] sib'(la sol) fa[(mib re)] }
   
   %79
   do4 re mib re
   do-+ re mib re
   <mib sol, sib,>2 <mib sol, sib,>
   
   %82
   do4-+ sib8 la \grace la16 sib4 mib
   re4.-+ do8 do4.-+ sib8
   sib1
   
}

Ivcn = \relative do {
   
   sib'2 sib
   sib2. r4
   sib4 sib, mib mib,
   
   %4
   sib'' sib, mib mib,
   sib' sib, fa' fa'
   sib, re fa sib
   
   %7
   sib, r fa' r
   la, r fa' r\mbreak
   sib, r sib r
   
   %10
   fa8 fa' mib re do re do sib
   la4 fa' sib, sol'
   la, fa' sib, sol'
   
   %13
   la,2 sib_+
   do8 mi sol fa mi re do sib
   la do fa do la do fa do
   
   %16
   sib4 sib sib sib\mbreak
   si8 re sol re si re sol re
   do4 do do do
   
   %19
   dod8 mi la mi dod mi la mi
   re4 re re re
   re8 fa sib fa re fa sib fa
   
   %22
   mi4 mi mi mi
   mi8 sol do sol mi sol do mi,
   fa4 fa fa fa
   
   %25
   mi'8 do fa do mi do fa do
   mi do fa do mi do fa do
   sib2 sib
   
   %28
   sib,4 sib' la mi-+ 
   fa8 sol la sib do4 do,
   fa1
   
   %31 OOKK
   fa2 fa
   fa2. r4
   fa' fa, sib sib,
   
   %34
   fa' fa, sib sib,
   fa' fa' do do'
   fa, la do fa
   
   %37
   fa,, r do' r
   mi, r do' r\mbreak
   fa, r fa r
   
   %40
   do mi'8 sol do sib la sol
   fad(re') la(re) fad,(re') re,(re')
   sol,(re') sib(re) sol, re' sib re\mbreak
   
   %43
   fad, (re') la(re) fad,(re') re,(re')
   sol,(re') sib(re) sol, re' sib re
   re,\upl sol(fad sol) re\upl sol(fad sol)
   
   %46
   do,4 do'8 re mib4 do\mbreak
   re r \clef tenor \key sib\major r fad
   fad8 re sol re fad re sol re
   
   %49
   fad re sol re fad re sol re
   re4 do sib fad
   \clef bass \key sib\major sol8 la sib do\mbreak  re4 re,
   
   %52
   sol fa?8-+ mib re do sib la
   sol4 r fad r
   sol2 r4 sol8 la
   
   %55
   sib4 sol' do, la'
   sib, sol' do, la'\mbreak
   sib, do8 re mib4 do
   
   %58
   re re8 mib re sib' do, la'
   sib4 r la r
   sib2 r
   
   %61
   sib4 sib, mib mib,
   sib'' sib, mib mib,\mbreak
   sib' sib, fa' fa'
   
   %64
   sib, re fa sib
   sib, r fa' r
   la, r fa' r
   
   %67
   sib, r sib' r
   fa8 la do sib la sol fa mib\mbreak
   re fa sib fa re fa sib fa
   
   %70
   mib4 mib mib mib
   mi8 sol do sol mi sol do sol
   fa4 fa fa fa
   
   %73
   fad8 la re la fad la re la\mbreak
   sol4 sol sol sol
   sol8 sib mib sib sol sib mib sib
   
   %76
   la4 la la la
   la8 do fa do la do fa do
   sib4 sib sib sib
   
   %79
   la8 fa sib fa la fa sib fa\mbreak
   la fa sib fa la fa sib fa
   mib2 mib
   
   %82
   mib,4 mib' re la
   sib8 do re mib fa4 fa,
   sib1
   
}

Ibcn = \relative do {
   
   sib'2 sib
   sib2. r4
   sib2 mib,
   
   %4
   sib' mib,
   sib fa
   sib4 re fa sib
   
   %7
   sib, r fa' r
   la, r fa' r\mbreak
   sib, r sib r
   
   %10
   fa8 fa' mib re do re do sib
   la2 sib
   la sib
   
   %13
   la sib_+
   do8 mi sol fa mi re do sib
   la2 la
   
   %16
   sib4 sib sib sib\mbreak
   si2 si
   do4 do do do
   
   %19
   dod2 dod
   re4 re re re
   re2 re
   
   %22
   mi4 mi mi mi
   mi2 mi
   fa4 fa fa fa'
   
   %25
   do1~\mbreak 
   do2. do4
   sib2 sib
   
   %28
   sib,4 sib' la mi-+ 
   fa8 sol la sib do4 do,
   fa1
   
   %31 OOKK
   fa2 fa
   fa2. r4
   fa'2 sib,
   
   %34
   fa sib,
   fa do'
   fa4 la do fa
   
   %37
   fa,, r do' r
   mi, r do' r\mbreak
   fa, r fa r
   
   %40
   do mi'8 sol do sib la sol
   fad4 la fad re
   sol sib sol sib
   fad la fad re
   sol sib sol sib
   sib,8\upl sol'(fad sol) sib,\upl sol'(fad sol)
   
   %46
   do,4 do'8 re mib4 do\mbreak
   re re,8 mi fad sol la sib
   do4 sib la sol
   
   %49
   do, sib la sol
   do do' sib fad
   sol8 la sib do\mbreak  re4 re,
   
   %52
   sol fa?8-+ mib re do sib la
   sol4 r fad r
   sol2 r4 sol8 la
   
   %55
   sib2 do
   sib do
   sib4 do8 re mib4 do
   
   %58
   re re8 mib re sib' do, la'
   sib4 r la r
   sib2 r
   
   %61
   sib mib,
   sib' mib,
   sib fa
   
   %64
   sib4 re fa sib
   sib, r fa' r
   la, r fa' r
   
   %67
   sib, r sib' r
   fa8 la do sib la sol fa mib\mbreak
   re2 re
   
   %70
   mib4 mib mib mib
   mi2 mi
   fa4 fa fa fa
   
   %73
   fad2 fad
   sol4 sol sol sol
   sol2 sol
   
   %76
   la4 la la la
   la2 la
   sib4 sib sib sib
   
   %79
   fa1~
   fa2. fa4
   mib2 mib
   
   %82
   mib,4 mib' re la
   sib8 do re mib fa4 fa,
   sib1
   
}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \key sib\major
    \tempo 1 = 50
    s1*30
    \bar":..:"\break
    \mark\markup "Reprise"
    s1*54\bar":|."

}

IvlI = {
    \global
    <<\IvlIn \forma>>

}

IvlII = {
    \global
    <<\IvlIIn \forma>>

}

Ivc = {
    \global
    \clef bass
    <<\Ivcn \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>

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

IIvlIn = \relative do'' {

   re16(mib) fa(re) do-+(sib)
   \appoggiatura re16 do8 \appoggiatura sib16 la4_+
   sib16(fa) sib(re) do(fa)

   %4
   \appoggiatura mib16 re4-+ do8
   fa \appoggiatura mib8 re \appoggiatura do8 sib
   la16 sib \appoggiatura sib8 do fa,

   %7
   fa' mib re\mbreak
   \appoggiatura re16 do4.-+
   re16(mib) fa(re) do-+(sib)

   %10
   \appoggiatura re16 do8 \appoggiatura sib16 la4_+
   sib16(fa) sib(re) do(fa)
   \appoggiatura mib16 re4-+ do8

   %13
   fa sib4
   la16(sol) fa8 la,
   sib16 mib re8 do-+
   
   %16
   sib4.
   fa'8 \appoggiatura fa16 sol8 sib,
   la_+ mib'4
   
   %19
   re16(fa) mib(re) mib(do)
   re4-+ \appoggiatura do8 sib
   re fa \appoggiatura mib16 re8
   
   %22
   do fa \appoggiatura mib16 re8
   \appoggiatura do16 sib8 mib \appoggiatura re16 do8
   \appoggiatura sib16 la4 \appoggiatura sol16 fa8\mbreak
   
   %25
   do'16(sib) la(sol) fa(mib)
   re8(do_+) sib
   re'16(do) sib(la) sol(fa)
   
   %28
   mi8 (re_+) do_\upl
   sol''16(fa) mi(re) do(sib)
   la8 (sol _+) fa_\upl
   
   %31
   sol do do,
   fa4 r8\mbreak
   re'16(mib) fa(re) do-+(sib)
   
   %34
   \appoggiatura re16 do8 \appoggiatura sib16 la4_+
   sib16(fa) sib(re) do(fa)

   %36
   \appoggiatura mib16 re4-+ do8
   fa \appoggiatura mib8 re \appoggiatura do8 sib
   la16 sib \appoggiatura sib8 do fa,

   %39
   fa' mib re\mbreak
   \appoggiatura re16 do4.-+
   re16(mib) fa(re) do-+(sib)

   %42
   \appoggiatura re16 do8 \appoggiatura sib16 la4_+
   sib16(fa) sib(re) do(fa)
   \appoggiatura mib16 re4-+ do8

   %45
   fa sib4
   la16(sol) fa8 la,
   sib16 mib re8 do-+
   
   %48
   sib4.
   re8 \appoggiatura re16 mib8 sol,
   \appoggiatura sol16 fad4_+ \appoggiatura mi?16 re8
   
   %51
   sol16(fad) sol(sib) la(re)
   \appoggiatura do8 sib4-+ la8
   
   %53
   re sol, sol'~
   sol16(fa) mib-+(re) do8~
   do fa, fa'~
   
   %56
   fa16(mib) re-+(do) sib8~\mbreak
   sib mib, mib'~
   mib16(re) do-+(sib) la8~
   
   %59
   la re, re'~
   re16(do) sib-+(la) sol8~
   sol mib'16 (re) do-+(sib)
   
   %62
   la8 do8. re16
   sib16-+( la32 sol) sib8[la_+]
   sol4.\mbreak
   
   %65
   sib8 mib16(re) do-+(sib)
   <<
      {
         \appoggiatura sib la?8_+ \appoggiatura sol16 fa8 sib
         do16 re \grace re16 mib8 re
         
         %68
         \grace re16 do8 \grace sib16 la8 sib
         do mib \grace mib16 re8
         \appoggiatura re16 do4.-+
      }\\{
         s4 sol8
         la16 sib \grace sib do8 sib
         \grace sib16 la8 \grace sol16 fa8 sol
         la do \grace do16 sib8
         fa4.
      }
   >>
   
   %71
   re'16(mib) fa(re) do-+(sib)
   \appoggiatura re16 do8 \appoggiatura sib16 la4_+
   sib16(fa) sib(re) do(fa)

   %74
   \appoggiatura mib16 re4-+ do8
   fa \appoggiatura mib8 re \appoggiatura do8 sib
   la16 sib \appoggiatura sib8 do fa,

   %77
   fa' mib re\mbreak
   \appoggiatura re16 do4.-+
   re16(mib) fa(re) do-+(sib)

   %80
   \appoggiatura re16 do8 \appoggiatura sib16 la4_+
   sib16(fa) sib(re) do(fa)
   \appoggiatura mib16 re4-+ do8

   %83
   fa sib4
   la16(sol) fa8 la,
   sib16 mib re8 do-+
   
   %86
   sib4.

}

IIvlIIn = \relative do'' {
   
   sib16 sib sib sib sib[do32 re]
  \appoggiatura re16 mib mib mib mib mib[re32 do]
  \appoggiatura do16 re fa32 mib re16-+[do32 sib] la16_+ fa
  
  %4
  sib la sib sib' la32-+[sol fa mib]
  re8-+ fa8. mib32 re\mbreak
  do8 fa la,-+
  
  %7
  \appoggiatura la16 sib8 fa'8. sib16
  \appoggiatura sib16 la4.-+
  sib,16 sib sib sib sib[do32 re]
  
  %10
  \appoggiatura re16 mib mib mib mib mib[re32 do]
  \appoggiatura do16 re fa32 mib re16-+[do32 sib] la16_+ fa
  sib la sib sib' la32-+[sol fa mib]\mbreak
  
  %13
  re8-+ fa8. mib32 re
  do16-+ sib la8 fa
  fa' sib, la-+
  
  %16
  sib4.  %% fine rondeau
  re,16 re mib mib mi mi
  fa fa sol sol la la
  
  %19
  sib sib mib, mib fa fa
  sib sib fa fa re re
  fa'8 re sol~\mbreak
  
  %22
  sol do, fa~
  fa sib, mib
  \appoggiatura re16 do4.-+
  
  %25
  R
  sib,16 sib' do, do' re, re'
  R4.
  
  %28
  do,16 do' re, re' mi, mi'
  R4.
  fa,16 fa' sol, sol' la, la'\mbreak
  
  %31
  sib,32 sib' la sol \appoggiatura sol16 la8[sol-+]
  fa4 r8  %% Fine 1 couplet
  sib,16 sib sib sib sib[do32 re]
  
  %34
  \appoggiatura re16 mib mib mib mib mib[re32 do]
  \appoggiatura do16 re fa32 mib re16-+[do32 sib] la16_+ fa
  sib la sib sib' la32-+[sol fa mib]
  
  %37
  re8-+ fa8. mib32 re\mbreak
  do8 fa la,-+
  \appoggiatura la16 sib8 fa'8. sib16
  
  %40
  \appoggiatura sib16 la4.-+
  sib,16 sib sib sib sib[do32 re]
  \appoggiatura re16 mib mib mib mib mib[re32 do]
  
  %43
  \appoggiatura do16 re fa32 mib re16-+[do32 sib] la16_+ fa
  sib la sib sib' la32-+[sol fa mib]\mbreak
  re8-+ fa8. mib32 re
  
  %46
  do16-+ sib la8 fa
  fa' sib, la-+
  sib4.  %% fine rondeau
  
  %49
  sol16 sol sol sol sol[la32 sib]
  \appoggiatura sib16 do do do do do[sib32-+ la]\mbreak
  \appoggiatura la16 sib re32 do sib16-+[la32 sol] fad16_+ re
  
  %52
  sol fad sol sol' re do-+
  sib sib sib sib sib[do32 re]
  \appoggiatura re16 mib mib mib mib mib[fa32 sol]
  
  %55
  la,16 la la la la[sib32 do]\mbreak
  \appoggiatura do16 re re re re re[mib32 fa]
  sol,16 sol sol sol sol[la32 sib]
  
  %58
  \appoggiatura sib16 do do do do do[re32 mib]
  fad,16 fad fad fad fad[sol32 la]
  \appoggiatura la16 sib sib sib sib sib[do32 re]\mbreak
  
  %61
  \appoggiatura re16 mib re do sib la-+ sol
  fad8_+ sol \appoggiatura sol16 la8
  re,16 re' re re do[re32 do]
  
  %64
  sib4 r8
  r16 sib'32[lab] sol lab fa sol mib[fa re mib]
  do4-+ r8\mbreak 
  
  %67
  r16 fa fa fa fa sib,
  \appoggiatura sol' fa8 r r
  r16 fa fa fa fa sib
  \appoggiatura sib la4.-+
  
  %71
  r16 sib, sib sib sib[do32 re] %% fine 2 couplet
  \appoggiatura re16 mib mib mib mib mib[re32 do]
  \appoggiatura do16 re fa32 mib re16-+[do32 sib] la16_+ fa
  
  %74
  sib la sib sib' la32-+[sol fa mib]
  re8-+ fa8. mib32 re\mbreak
  do8 fa la,-+
  
  %77
  \appoggiatura la16 sib8 fa'8. sib16
  \appoggiatura sib16 la4.-+
  sib,16 sib sib sib sib[do32 re]
  
  %80
  \appoggiatura re16 mib mib mib mib mib[re32 do]
  \appoggiatura do16 re fa32 mib re16-+[do32 sib] la16_+ fa
  sib la sib sib' la32-+[sol fa mib]\mbreak
  
  %83
  re8-+ fa8. mib32 re
  do16-+ sib la8 fa
  fa' sib, la-+
  
  %86
  sib4.  %% fine rondeau
  
}

IIvcn = \relative do {
   
   R4.*4
   sib'16 sib sib sib sib[do32 re]
   \appoggiatura re8 mib16 mib mib mib mib[re32 do]
   
   %7
   re16[do32 sib] la16-+ fa sib sib,
   fa'[mib32-+ re] do32 sib la sol fa8\noBeam
   R4.*4
   
   %13
   sib'16 sib sib sib sib[do32 re]
   \appoggiatura re8 mib16 mib mib mib mib[re32-+ do]
   re16[do32-+ sib] fa'16 mib fa fa,
   
   %16
   sib[la32-+ sol]fa mib re do sib8\noBeam
   R4.*4
   sib'16 sib sib sib sib sib
   
   %22
   la la la la la la
   sol sol sol sol sol sol
   fa[mib32-+ re] do re sib do la[sib sol la]
   
   %25
   fa16 fa' sol, sol' la, la'\mbreak
   R4.
   sol,16 sol' la, la' sib, sib'
   
   %28
   R4.
   do,16 do' re, re' mi, mi'
   R4.*2
   
   %32
   fa16 [mi32-+ re] do sib la sol fa8\noBeam
   R4.*4
   sib16 sib sib sib sib[do32 re]
   
   %38
   \appoggiatura re8 mib16 mib mib mib mib[re32 do]
   re16[do32 sib] la16-+ fa sib sib,
   fa'[mib32-+ re] do32 sib la sol fa8\noBeam
   
   %41
   R4.*4
   sib'16 sib sib sib sib[do32 re]
   \appoggiatura re8 mib16 mib mib mib mib[re32-+ do]
   
   %47
   re16[do32-+ sib] fa'16 mib fa fa,
   sib[la32-+ sol]fa mib re do sib8\noBeam
   R4.*4
   
   %53
   sol'16 sol sol sol sol[la32 sib]
   do16 do do do do[re32 mib]
   fa,16 fa fa fa fa[sol32 la]
   
   %56
   sib16 sib sib sib sib[do32 re]
   mib,16 mib mib mib mib[fa32 sol]\mbreak
   la16 la la la la[sib32 do]
   
   %59
   re,16 re re re re[mi32 fad]
   sol16 sol sol sol sol[la32 sib]
   do16 sib do re mib do
   
   %62
   re re, mib mi fa fad\mbreak
   sol8 re re,
   sol16 sol' sol sol sol [lab32 sib]
   
   %65
   mib,4 r8
   fa16 fa' fa fa fa sib,
   fa'8 r r
   
   %68
   r16 fa fa fa fa sib,
   fa'8 r r\mbreak
   fa,16 fa fa fa fa[sol32 la] 
   
   %71
   sib8 r r
   R4.*3
   sib16 sib sib sib sib[do32 re]
   
   %76
   \appoggiatura re8 mib16 mib mib mib mib[re32 do]
   re16[do32 sib] la16-+ fa sib sib,
   fa'[mib32-+ re] do32 sib la sol fa8\noBeam
   
   %79
   R4.*4
   sib'16 sib sib sib sib[do32 re]
   \appoggiatura re8 mib16 mib mib mib mib[re32-+ do]
   
   %85
   re16[do32-+ sib] fa'16 mib fa fa,
   sib[la32-+ sol]fa mib re do sib8\noBeam

}

IIbcn = \relative do {
   
   R4.*4
   sib'16 sib sib sib sib[do32 re]
   \appoggiatura re8 mib16 mib mib mib mib[re32 do]
   
   %7
   re16[do32 sib] la16-+ fa sib sib,
   fa'[mib32-+ re] do32 sib la sol fa8\noBeam
   R4.*4
   
   %13
   sib'16 sib sib sib sib[do32 re]
   \appoggiatura re8 mib16 mib mib mib mib[re32-+ do]
   re16[do32-+ sib] fa'16 mib fa fa,
   
   %16
   sib[la32-+ sol]fa mib re do sib8\noBeam
   R4.*4
   sib'16 sib sib sib sib sib
   
   %22
   la la la la la la
   sol sol sol sol sol sol
   fa[mib32-+ re] do re sib do la[sib sol la]
   
   %25
   fa16 fa' sol, sol' la, la'\mbreak
   R4.
   sol,16 sol' la, la' sib, sib'
   
   %28
   R4.
   do,16 do' re, re' mi, mi'
   R4.*2
   
   %32
   fa16 [mi32-+ re] do sib la sol fa8\noBeam
   R4.*4
   sib16 sib sib sib sib[do32 re]
   
   %38
   \appoggiatura re8 mib16 mib mib mib mib[re32 do]
   re16[do32 sib] la16-+ fa sib sib,
   fa'[mib32-+ re] do32 sib la sol fa8\noBeam
   
   %41
   R4.*4
   sib'16 sib sib sib sib[do32 re]
   \appoggiatura re8 mib16 mib mib mib mib[re32-+ do]
   
   %47
   re16[do32-+ sib] fa'16 mib fa fa,
   sib[la32-+ sol]fa mib re do sib8\noBeam
   R4.*4
   
   %53
   sol'16 sol sol sol sol[la32 sib]
   do16 do do do do[re32 mib]
   fa,16 fa fa fa fa[sol32 la]
   
   %56
   sib16 sib sib sib sib[do32 re]
   mib,16 mib mib mib mib[fa32 sol]\mbreak
   la16 la la la la[sib32 do]
   
   %59
   re,16 re re re re[mi32 fad]
   sol16 sol sol sol sol[la32 sib]
   do16 sib do re mib do
   
   %62
   re re, mib mi fa fad\mbreak
   sol8 re re,
   sol16 sol' sol sol sol [lab32 sib]
   
   %65
   mib,4 r8
   fa16 fa' fa fa fa sib,
   fa'8 r r
   
   %68
   r16 fa fa fa fa sib,
   fa'8 r r\mbreak
   fa,16 fa fa fa fa[sol32 la] 
   
   %71
   sib8 r r
   R4.*3
   sib16 sib sib sib sib[do32 re]
   
   %76
   \appoggiatura re8 mib16 mib mib mib mib[re32 do]
   re16[do32 sib] la16-+ fa sib sib,
   fa'[mib32-+ re] do32 sib la sol fa8\noBeam
   
   %79
   R4.*4
   sib'16 sib sib sib sib[do32 re]
   \appoggiatura re8 mib16 mib mib mib mib[re32-+ do]
   
   %85
   re16[do32-+ sib] fa'16 mib fa fa,
   sib[la32-+ sol]fa mib re do sib8\noBeam
   
}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 3/8
   \key sib\major
   \tempo 4 = 53
   s4.*16
   \bar":|."\break
   \override Score.RehearsalMark.extra-offset = #'(0 . 0)
   \mark\markup "1. reprise"
   s4.*16
   \bar "||"\break
   \mark \markup "[Refrain]"
   s4.*16
   \bar "||"\break
   \mark\markup "2. reprise"
   s4.*22
   \bar "||"\break
   \mark \markup "[Refrain]"
   s4.*16
   \bar "|."

}

IIvlI = {
   \global
   <<\IIvlIn \forma>>

}

IIvlII = {
   \global
   <<\IIvlIIn \forma>>

}

IIvc = {
   \global
   \clef bass
   <<\IIvcn \forma>>

}

IIbc = {
   \global
   \clef bass
   <<\IIbcn \forma \IIbfn>>

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
   
   sib,4 mib re do
   sib8 sib'_\upl sib_\upl sib_\upl sib\upl sib\upl sib\upl sib\upl
   sib4 fa2 re4~
   
   %4
   re sib2 sib'4
   la sib la sol\mbreak
   fa8 fa'\upl fa\upl fa\upl fa\upl fa\upl fa\upl fa\upl 
   
   %7
   fa4 do2 la4~
   la fa2 la4
   sib sib, r sib'
   
   %10
   re8 sib fa re sib re fa sib\mbreak
   la fa do' la fa do fa la
   do la fa do la do fa la
   
   %13
   sol sib mi sol mi sib mi sol
   sol, sib mi sol mi sib sol sib\mbreak
   la fa do fa la, la' fa do
   
   %16
   la do fa la do fa, la fa
   do4 do'8 la la4_+ sib8 sol
   sol4_+ la8 fa fa4_+ sol8 mi\mbreak
   
   %19
   mi4_+ do mi sol
   do8 fa, la, fa' do' fa, la, fa'
   re' fa, sib, fa' re' fa, sib, fa'
   
   %22
   re' sol, si, sol' re' sol, si, sol'
   mi' sol, do, sol'\mbreak mi' sol, sib, sol'
   do fa la, fa' do fa la, fa'
   
   %25
   re fa fa re do fa fa do
   sib sol' sol sib, la fa' fa la,
   sol2_+ r4 do\mbreak
   
   %28
   do do, do' do
   mi,8 do mi fa sol4 fa8_+(mi)
   fa4 fa'2 mi4-+
   
   %31  OOKK
   fa2 fa,
   fa4 sib la sol
   fa8 fa'\upl fa\upl fa\upl fa\upl fa\upl fa\upl fa\upl 
   
   %34
   fa4 do2 la4~
   la fa2 fa4
   mi fa mi re
   
   %37
   do8 do'_\upl do_\upl do_\upl do\upl do\upl do\upl do\upl\mbreak
   do4 sol2 mi4~
   mi do2 mi4
   
   %40
   fa2 r4 fa'
   la8 fa do la fa la do fa
   mi do sol mi do sol' do mi\mbreak
   
   %43
   sol mi do sol mi sol do mi
   re si sol re si sol' si re
   fa re si sol re sol si re
   
   %46
   do sol mi do sol mi' sol do\mbreak
   mi do sol mi do mi sol do
   si sol re si sol r r4
   
   %49
   sol''8-+(fad) sol4 sol8-+(fad) sol4
   sol8\upl mib\upl mib,4_+ sol'8\upl mib\upl mib,4_+\mbreak
   fa'!8-+(mi) fa4 fa8-+(mi) fa4
   
   %52
   fa8\upl re\upl re,4_+ fa'8\upl re\upl re,4_+
   mi'8-+(re) mi4 mi8-+(re) mi4
   mi8\upl dod\upl dod,4_+ mi'8\upl dod\upl dod,4_+\mbreak
   
   %55
   re'8-+(dod) re4 re8-+(dod) re4
   la'2 r4 la,
   la la, la' la
   
   %58
   dod,8 (mi la dod) mi4 re8-+(dod)
   re4 re,2 dod4_+\mbreak
   re re'8 mib! fa4 la,_+
   
   %61
   sib mib, re do
   sib8 sib'_\upl sib_\upl sib_\upl sib\upl sib\upl sib\upl sib\upl
   sib4 fa2 re4~
   
   %64
   re sib2 re4
   mib(sol sib) mib\mbreak
   do, fa mi re
   
   %67
   do8 do'_\upl do_\upl do_\upl do\upl do\upl do\upl do\upl\mbreak
   do4 sol2 mi4~
   mi do2 mi4
   
   %70
   fa(la do) fa4\mbreak
   fa8 sib, re, sib' fa' sib, re, sib'
   sol' sib, mib, sib' sol' sib, mib, sib'
   
   %73
   sol' do, mi, do' sol' do, mi, do'
   la' do, fa, do' la' do, fa, do'
   fa8 sib, re, sib'\mbreak fa' sib re, sib'
   
   %76
   sol sib sib sol fa sib sib fa
   mib do' do mib, re sib' sib re,
   do2-+ r4 fa 
   
   %79
   fa fa, fa' fa\mbreak
   la,,8(do fa la) do4 sib8-+(la)
   sib4 sib2 la4_+
   
   %82
   sib2 sib,
   
}

IIIvlIIn = \relative do'' {
   
   r8 sib\upl sib\upl sib\upl sib\upl sib\upl sib\upl sib\upl
   sib4 sol fa mib
   sib8 re re fa re fa fa sib
   
   %4
   fa sib sib re sib re fa sib\mbreak
   r8 fa,_\upl fa_\upl fa_\upl fa_\upl fa_\upl fa_\upl fa_\upl
   fa4 re' do sib
   
   %7
   fa8 la, la' do, la' do, do' la
   do, fa fa la fa la do mib\mbreak
   re fa sib, fa' re sib fa re
   
   %10
   sib re fa sib re fa sib, re
   do fa la, fa do la' fa do
   la do fa la do fa la, do\mbreak
   
   %13
   sib mi sol mi sib sol mi do
   sib mi sol sib sol mi sib mi
   la, do fa la do, fa la do
   
   %16
   fa, la do fa la, do fa, la\mbreak
   sol sib mi, sol fa la re, fa
   mi sol do, mi re fa sib, re
   
   %19
   do mi sol mi do sol' sib, sol'
   la, fa' do' fa, la, fa' do' fa,\mbreak
   sib, fa' re' fa, sib, fa' re' fa,
   
   %22
   si, sol' re' sol,  si, sol' re' sol,
   do, sol' mi' sol, sib, sol' mi' sol,
   la, fa' do' fa, la, fa' do' fa,\mbreak
   
   %25
   sib, fa' re' fa, la, fa' do' fa,
   sol, mi' sib' mi, fa fa la fa
   mi_\upl fa_\upl fa_\upl sol_\upl sol_\upl la_\upl la_\upl sib_\upl
   
   %28
   sib\upl do\upl do\upl mi\upl mi\upl sol\upl sol\upl sib\upl\mbreak
   sib2. la8-+(sol)
   \terzinequarto \tuplet 3/2 { la8(sib la) sol[(la sol)] } la4 sol-+
   
   %31
   fa2 fa,
   r8 fa'\upl fa\upl fa\upl fa\upl fa\upl fa\upl fa\upl 
   fa4 re do sib\mbreak
   
   %34
   la8 fa fa la fa la la do
   la do do fa do fa fa la
   sol do,\upl do\upl do\upl do\upl do\upl do\upl do\upl
   
   %37
   do4 la sol fa
   do8 mi mi sol\mbreak mi sol sol do
   sol do do mi do mi sol sib,
   
   %40
   la do fa do la' fa do la
   fa la do fa la, do fa la,
   sol do mi sol\mbreak mi do sol do
   
   %43
   mi, sol do mi sol, do mi sol
   si, re si sol fa re si sol
   sol si re fa fa si re fa,\mbreak
   
   %46
   mi sol do sol mi sol do mi
   sol mi do sol mi sol do mi
   re si sol re sol, r r4
   
   %49
   si'8 sol re' sol, si sol re' sol,\mbreak
   mib? sol do sol mib sol do sol
   la fa do' fa, la fa do' fa,
   
   %52
   re fa sib fa re fa sib fa
   sol mi sib' mi, sol mi sib' mi,
   dod mi la mi\mbreak dod mi la mi
   
   %55
   fa re la' re, fa re la' re,
   dod_\upl re_\upl re_\upl mi_\upl mi_\upl fa_\upl fa_\upl sol_\upl
   sol_\upl la_\upl la_\upl dod_\upl dod\upl mi\upl mi\upl sol\upl
   
   %58
   sol2. fa8-+(mi)\mbreak
   \tuplet 3/2 { fa(sol fa) mi[(fa re)] } fa4 mi-+
   re1
   
   %61
   r8 sib\upl sib\upl sib\upl sib\upl sib\upl sib\upl sib\upl
   sib4 sol fa mib?
   sib8 re re fa re fa fa sib\mbreak
   
   %64
   fa sib sib re sib re fa lab
   sol mib do sol mib r r4
   r8 do'\upl do\upl do\upl do\upl do\upl do\upl do\upl
   
   %67
   do4 la sol fa
   do8 mi mi sol mi sol sol do\mbreak
   sol do do mi do mi sol sib
   
   %70
   la fa do la fa do la fa'
   re sib' fa' sib, re, sib' fa' sib,
   mib, sib' sol' sib, mib, sib' sol' sib,
   
   %73
   mi, do' sol' do, mi, do' sol' do,\mbreak
   fa, do' la' do, mi, do' la' do,
   re, sib' fa' sib, re, sib' fa' sib,
   
   %76
   mib, sib' sol' sib, re, sib' fa' sib,
   do, la' mib' la, sib, sib' re sib
   la,_\upl sib_\upl sib_\upl do_\upl\mbreak do_\upl re_\upl re_\upl mib_\upl
   
   %79
   mib_\upl fa_\upl fa_\upl la_\upl la\upl do\upl do\upl mib\upl
   mib2. re8-+(do)
   \tuplet 3/2 { re(mib re) do[(re sib)] } re4 do-+
   
   %82
   sib2 sib,
   
}

IIIvcn = \relative do {
   
   r8 sib'\upl sib\upl sib\upl sib\upl sib\upl sib\upl sib\upl
   sib4 mib re do
   sib sib, r sib'
   
   %4
   sib sib, r2\mbreak
   r8 fa'\upl fa\upl fa\upl fa\upl fa\upl fa\upl fa\upl
   fa4 sib la sol
   
   %7
   fa4 fa, r fa'
   fa fa, la fa
   sib2 r\mbreak
   
   %10
   sib4 (re fa) sib,
   fa2 r
   fa'4(la do) fa,
   
   %13
   do2 r
   do'4 do, mi do
   fa2 r\mbreak
   
   %16
   fa2. fa4
   mi do re sib
   do la sib sol
   
   %19
   do2 r
   fa4 la2 fa4~
   fa sib2 fa4
   
   %22
   sol si2 sol4~
   sol do2 sol4
   fa2 r
   
   %25
   r4 sib r la
   r sol r fa
   do2 r
   
   %28
   R1
   do'2. do4
   fa4 sib, do do,
   
   %31
   fa1
   r8 fa'\upl fa\upl fa\upl fa\upl fa\upl fa\upl fa\upl\mbreak
   fa4 sib, la sol
   
   %34
   fa2 r4 fa
   fa fa, r2
   r8 do''\upl do\upl do\upl do\upl do\upl do\upl do\upl
   
   %37
   do4 fa, mi re
   do2 r4 do'\mbreak
   do do, mi do
   
   %40
   fa fa, r2
   fa'4 (la do) fa,
   do2 r
   
   %43
   do4(mi sol) do,
   sol2 r\mbreak
   sol'4 sol, si sol
   
   %46
   do2 r
   do4 do do do
   sol' sol, r2
   
   %49
   re''4 si re si
   sol2 r
   do4 la do la\mbreak
   
   %52
   fa2 r
   sib4 sol sib sol
   mi2 r
   
   %55
   la4 fa la fa
   mi2 r
   R1
   
   %58
   la2. la4
   re sol, la la,
   re1
   
   %61
   r8 sib'\upl sib\upl sib\upl sib\upl sib\upl sib\upl sib\upl
   sib4 mib re do
   sib4 sib, r sib'
   
   %64
   sib, fa' re sib\mbreak
   mib mib, r2
   r8 do''\upl do\upl do\upl do\upl do\upl do\upl do\upl
   
   %67
   do4 fa, mi re
   do2 r4 do'
   do, sol' mi do\mbreak
   
   %70
   fa  fa, r2\mbreak
   sib4 re2 sib4~
   sib mib2 sib4
   
   %73
   do mi2 do4~
   do fa2 do4
   sib2 r
   
   %76
   r4 mib r re
   r do r sib\mbreak
   fa2 r
   
   %79
   R1
   fa'2. fa4
   sib mib, fa fa,
   
   %82
   sib1

}

IIIbcn = \relative do {
   
   sib'2 r
   r8 sib\upl sib\upl sib\upl sib\upl sib\upl sib\upl sib\upl
   sib4 sib, r sib'
   
   %4
   sib sib, r sib\mbreak
   fa'2 r
   r8 fa\upl fa\upl fa\upl fa\upl fa\upl fa\upl fa\upl
   
   %7
   fa4 fa, r fa'
   fa fa, la fa
   sib2 r\mbreak
   
   %10
   sib2. sib4
   fa2 r
   fa'2. fa4
   
   %13
   do2 r
   do'4 do, mi do
   fa2 r\mbreak
   
   %16
   fa2. fa4
   mi do re sib
   do la sib sol
   
   %19
   do2 r
   fa2. fa4\mbreak
   sib sib, r2
   
   %22
   sol'2. sol4
   do do, r2
   fa2. fa4
   
   %25
   sib r la r
   sol r fa r\mbreak
   do2 r
   
   %28
   R1
   do'2. do4
   fa4 sib, do do,
   
   %31
   fa1
   fa'2 r
   r8 fa\upl fa\upl fa\upl fa\upl fa\upl fa\upl fa\upl\mbreak
   
   %34
   fa4 fa, r fa
   fa fa, r fa'
   do2 r
   
   %37
   r8 do'\upl do\upl do\upl do\upl do\upl do\upl do\upl
   do4 do, r do'\mbreak
   do do, mi do
   
   %40
   fa fa, r2
   fa'2. fa4
   do2 r
   
   %43
   do2. do4
   sol2 r\mbreak
   sol'2. sol4
   
   %46
   do,2 r
   do2. do4
   sol' sol, r2
   
   %49
   sol'2. sol4
   do do, do do
   fa2. fa4\mbreak
   
   %52
   sib sib, sib sib
   mi2. mi4
   la la, la la
   
   %55
   re2. re4
   la2 r
   R1
   
   %58
   la'2. la4
   re sol, la la,
   re1
   
   %61
   sib'2 r
   r8 sib\upl sib\upl sib\upl sib\upl sib\upl sib\upl sib\upl
   sib4 sib, r sib'
   
   %64
   sib,2. sib4\mbreak
   mib mib, r2
   do'' r
   
   %67
   r8 do\upl do\upl do\upl do\upl do\upl do\upl do\upl
   do4 do, r2
   do2. do4
   
   %70
   fa  fa, r2\mbreak
   sib2. sib4 
   mib mib, r2
   
   %73
   do'2. do4
   fa fa, r2
   sib2. sib4
   
   %76
   mib r re r
   do r sib r\mbreak
   fa2 r
   
   %79
   R1
   fa'2. fa4
   sib mib, fa fa,
   
   %82
   sib1
   
}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {
    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \key sib\major
    \tempo 1 = 60
    s1*31
    \bar":..:"\break
    s1*51
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

IIIvc = {
    \global
    \clef bass
    <<\IIIvcn \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

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
   
   mi8(fa) fa4.-+ mi16(fa)
   \appoggiatura fa16 sol4 fa8(sol) mi fa16(sol)
   la8\upl do\upl sol\upl do\upl fa,\upl do'\upl\mbreak
   
   %4
   mi,4-+ re8 (mi) do16 mi(fa sol)
   la8\upl do\upl sol\upl do\upl fa,\upl do'\upl
   mi,4-+ re8 (mi) do mi16(fa)
   
   %7
   \appoggiatura fa16 sol4 fa mi
   re4.-+ si8\f do re
   mi8(fa) fa4.-+ mi16 (fa)\mbreak
   
   %10
   \appoggiatura fa16 sol4 fa8(sol) mi fa16(sol)
   la8\upl do\upl sol\upl do\upl fa,\upl do'\upl
   mi,4-+ re8 (mi) do16 mi(fa sol)
   
   %13
   la8\upl do\upl sol\upl do\upl fa,\upl do'\upl
   mi,4-+ re8 (mi) do mi16(fa)
   \appoggiatura fa16 sol4 fa mi
   
   %16
   re2-+ r4\mbreak
   sol8 [mi mi sol] mi fa16(sol)
   la8[fa fa la] la sol16(fa)
   
   %19
   sol8 [mi mi sol] sol fa16(mi)
   fa8[re re fa] fa mi16(re)
   mi8[do do mi] mi re16(do)
   
   %22
   re8[si si re] re do16(re)\mbreak
   mi8 re mi re do si
   la16 do si do re8 re16 do si la sol fad
   
   %25
   mi8\noBeam mi' [do' mi,] mi16-+(re) mi8
   r8 re[re' re,] re16-+(do) re8
   r mi[do' mi,] mi16-+(re) mi8
   
   %28
   r8 re[re' re,] re16-+(do) re8\mbreak
   r8 sol16 fa mi fa re mi do re si do
   <<{la8 la la(si) si(la)
      
      %31
      la4}\\{s8 fad fad(sol) sol(fad)
             fad4}>> r r 
   r16 la, re la fad' re la' fad re' la fad' re
   la'2~la8 sol16 fad\mbreak
   
   %34
   sol8. la16 fad4.-+ sol8
   sol2 r4
   <sol, sol,>2 r4
   
   %37
   sol re' sol,
   la16 re, mi fad sol la si do re do si la
   si sol la si do re mi fad sol fad mi re\mbreak
   
   %40
   mi re do si do si la sol la sol fad mi
   re4 do'2
   si8-+ la16(sol) si4(la8._+) sol16
   
   %43
   sol8[sol' sol sol] si16 la sol fad
   sol8[si, si si] re16 do si la\mbreak
   si8[sol sol sol]si16 la sol fad
   
   %46
   sol sol si re sol re si sol re sol si, re
   sol,2.
   si'8\p(do) do4.-+(si16 do)
   
   %49
   \appoggiatura do16 re4 do8(re) si do16(re)\mbreak
   mi8\upl sol\upl re\upl sol\upl do,\upl la'\upl
   si,4-+ la8(si) sol16 si(do re)
   
   %52
   mi sol fad sol re sol fad sol do, la' sol la
   si,4-+ la8(si) sol si16(do)
   \appoggiatura do16 re4 do4-+ si\mbreak
   
   %55
   la8\f re16 do si do la si sold la fad sold
   mi4 mi~mi16 re do si
   la4 do'~do16 do, si la
   
   %58
   mi'4 mi~mi16 re do si
   la4 do'~do16 do, si la\mbreak
   si4 si'~si16 si, re si
   
   %61
   do4 do'~do16 la, si do
   re4 re'~re16 do si la
   si4 si'2
   
   %64
   mi,8. la16 la,4 sold_+
   la8 [do do do] mi16 re do si \mbreak %%% fine pagina
   do8 [la la la] do16 si la sold
   
   %67
   la16 la do  mi la mi do la mi la do, mi
   la,2 r4
   fa''16(do) la'(do,) sol'(do,) mi(do) fa(do) sol'(do,)
   
   %70
   la'(do,) fa(do) sol'(do,) mi(do) fa fa, sol la\mbreak
   sib do re mi fa la do fa, mi(sol) do,(mi)
   fa la sol fa mi re do sib la fa sol la
   
   %73
   sib do re mi fa la do fa, mi(sol) do,(mi)
   fa la sol fa mi re do sib la8 fa'16 sol\mbreak
   la\upl do,(sib do) sol'\upl do,(sib do) fa\upl do(sib do)
   
   %76
   mi8 re16(do) sib la sol fa mi re do sib
   <fa' la,>4 la do
   fa la do~
   
   %79
   do8 sib(la sol fa mib)
   mib4-+ re r\mbreak
   sol, si? re
   
   %82
   sol si re\parenthesize ~
   re8 do(si la sol fa)
   fa4-+ mi r
   
   %85
   la, dod mi
   la dod mi~
   mi8 re(dod si la sol)
   
   %88
   fa-+[(mi) re(dod)] re4\mbreak
   dod8(re) dod(re) la' la,
   re la' sib? la16 (sol) \appoggiatura sib16 la8 sol16(fa)
   
   %91
   mi8(re) dod4.-+ re8
   re16\upl re(dod re) fad\upl re(dod re) la'\upl re,(dod re)
   re,_\upl do'?(si do) fad\upl do(si do) la'\upl do,(si la)\mbreak
   
   %94
   si\upl re(do re) si\upl re(do re) sol\upl re(do re)
   si\upl re(do re) sol\upl re(do re) fa?\upl re(do re)
   mi\upl sol(fa sol) do\upl sol(fa sol) mi\upl sol(fa sol)
   
   %97
   re\upl sol(fa sol) si\upl sol(fa sol) re\upl sol(fa sol)\mbreak
   re\upl fa(mi fa) la\upl sol(fa mi) re\upl do(si do)
   si4-+ \appoggiatura la16 sol4 sol'
   
   %100
   \tuplet 3/2 { si,8(do re) } sol,4 do
   si16-+ re mi fa sol fa mi re do re si do
   la8\noBeam la' [fa, la'] la16-+(sol) la8\mbreak
   
   %103
   r8 sol[sol, sol'] sol16-+(fa) sol8
   r la[fa, la'] la16-+(sol) la8
   r8 sol[sol, sol'] sol16-+(fa) sol8
   
   %106
   r do16 sib la sib sol la fa sol mi fa
   <<{re8 re, re(mi) mi(re)
   re4}\\{s8 si? si(do) do(si)
             si4}>> r r\mbreak
   
   %109
   r16 re sol re si' sol re' si sol' re si' sol
   re'2~re8 do16 \parenthesize (si)
   do8 re si4.-+ do8
   
   %112
   do2 r4
   do,,2_+ r4
   do' sol do,\mbreak
   
   %115
   re16 sol la si do re mi fa sol fa mi re
   mi do re mi fa sol la si do si la sol
   la sol fa mi fa mi re do re do si la\mbreak
   
   %118
   sol4 fa'2
   mi8 re16 do re4.-+ do8
   do[mi mi mi] sol16 fa mi re
   
   %121
   mi8[do do do] mi16 re do si
   do8[mi, mi mi] sol16 fa mi re\mbreak
   mi do' mi sol do sol mi do sol do mi, sol
       
   %124
   do,2.\fermopz

}

IVvlIIn = \relative do'' {
   
   do8(re) re4.-+ do16 (re)
   \appoggiatura re16 mi4 re8(mi) do re16(mi)
   fa4 mi-+ re
   
   %4
   do sol mi16 do'(re mi)
   fa4 mi-+ re\mbreak
   do sol mi8 do'16(re)
   
   %7
   \appoggiatura re mi4 re do
   si-+ r r
   do8(re) re4.-+ do16 (re)
   
   %10
   \appoggiatura re16 mi4 re8(mi) do re16(mi)
   fa4 mi-+ re
   do sol mi16 do'(re mi)
   
   %13
   fa4 mi-+ re\mbreak
   do sol mi8 do'16(re)
   \appoggiatura re mi4 re do
   
   %16
   si2-+ r4
   mi8[do do, mi'] do re16(mi)
   fa8[do fa, fa'] fa mi16 (re)
   
   %19
   mi8[do do, mi'] mi re16(do)
   re8[si sol re'] re do16(si)\mbreak
   do8[sol do, do'] do si16(la)
   
   %22
   si8[sol sol, si'] si la16(si)
   do8 sol do si la sol
   fad4_+ re re'-+
   
   %25
   mi16\upl do(si do) sol_\upl do(si do) sol'\upl do,(si do)\mbreak
   re\upl si(la si) sol_\upl si(la si) sol'\upl si,(la si)
   mi\upl do(si do) sol_\upl do(si do) sol'\upl do,(si do)
   
   %28
   re\upl si(la si) sol_\upl si(la si) sol'\upl si,(la si) 
   mi fa re mi do re si do la si sol la\mbreak
   fad8 re' re re re re
   
   %31
   <<{s8 la' la si si la
      sold}\\{re fad fad sol sol fad
              re do do do do do}>>
   do2-+~do8 si16 la
   
   %34
   si8 do la4._+ sol8
   sol16 sol' si, sol' do, sol' re sol mi sol do, sol'\mbreak
   re sol si, sol' do, sol' re sol mi sol do, sol'
   
   %37
   re sol si, sol' do,  la' la, la' si, sol' sol, sol'
   <fad la, re,>2.
   <sol si, re,>
   
   %40
   <sol la, mi>
   <fad la, re,>
   <sol si, re,>4 fad4.-+ sol8
   
   %43
   sol[si, si si] re16 do si la
   si8[sol sol sol] si16 la sol fad
   sol8[si, si si] re16 do si la
   
   %46
   si8 <sol'' si, re, sol,> <sol si, re, sol,> <sol si, re, sol,> <sol si, re, sol,> <sol si, re, sol,>
   <sol si, re, sol,>2.
   sol,8\p(la) la4._+ sol16(la)\mbreak
   
   %49
   \appoggiatura la si4 la8(si) sol la16(si)
   do4 si-+ la
   sol re sol,16 sol' la si
   
   %52
   do4 si-+ la
   sol re sol,8 sol'16(la) 
   \appoggiatura la si4 la_+ sol
   
   %55
   fad_+ r r\mbreak
   si16_\upl\f sold(fad sold) mi_\upl sold(fad sold) mi'_\upl sold,(fad sold)
   do_\upl la(sold la) mi_\upl la(sold la) mi'\upl la,(sold la)
   
   %58
   si_\upl sold(fad sold) mi_\upl sold(fad sold) mi'_\upl sold,(fad sold)
   do_\upl la(sold la) mi_\upl la(sold la) mi'\upl la,(sold la)
   re\upl si(sold si) fad_\upl si(sold si) re\upl si(sold si)
   
   %61
   mi\upl do(si do) la\upl do(si do) mi \upl do(si la)
   fa' mi re do re do si la si la sold fad
   mi4 mi'4. re8\mbreak
   
   %64
   do-+ si16 la do4 si-+
   la8[la la la] do16 si la sold
   la8[do, do do] mi16 re do si
   
   %67
   la'8 <la mi do> <la mi do> <la mi do> <la mi do> <la mi do>
   <la mi do>4 r r
   la8(sib) sib4.-+ la16(sib)\mbreak  %% fine pagina
   
   %70
   \appoggiatura sib do4 sib8(do) la sib16(do)
   re8\upl fa\upl do\upl fa\upl sib,\upl sol'\upl
   la,4_+ sol8(la) fa16 la(sib do)
   
   %73
   re8\upl fa\upl do\upl fa\upl sib,\upl sol'\upl
   la,4_+ sol8(la) fa la16 sib
   \appoggiatura sib do4 sib-+ la\mbreak
   
   %76
   sol do, r
   r16 fa' mi re do re sib do la sib sol la
   fa fa' mi re do re sib do la sib sol la
   
   %79
   fa fa' sol, fa' la, fa' sib, fa' do fa la, fa'\mbreak
   sib,8 re16 do re8[sib fa re]
   r16 sol' fa mi re mi do re si? do la si
   
   %82
   sol sol' fa mi re mi do re si do la si
   sol sol' la, sol' si, sol' do, sol' re sol si, sol'
   do,8 mi16 re mi8[do sol mi]\mbreak
   
   %85
   r16 la' sol fa mi fa re mi dod re si dod
   la la' sol fa mi fa re mi dod re si dod
   la la' si, la' dod, la' re, la' mi la dod, la'
   
   %88
   re,8 (mi fa sol la) fa\upl\mbreak
   sib\upl la(sol-+ fa mi re)
   la'4 dod,-+ \appoggiatura dod 16 re4~
   
   %91
   re8 mi mi4.-+ re8
   re la re la fad la
   re la re la fad re 
   
   %94
   sol re sol re si re
   sol re sol re si sol\mbreak
   do mi sol mi do sol'
   
   %97
   si, re sol re si sol'
   do, fa do' la fa la
   re, sol si sol do4
   
   %100
   \tuplet 3/2 { re8(mi fa) } \appoggiatura fa16 mi4.-+ fa8
   re2-+ sol4\mbreak
   la16\upl fa(mi fa) do\upl fa(mi fa) do'\upl fa,(mi fa)
   
   %103
   sol\upl mi(re mi) do\upl mi(re mi) do'\upl mi,(re mi)
   la\upl fa(mi fa) do\upl fa(mi fa) do'\upl fa,(mi fa)
   sol\upl mi(re mi) do\upl mi(re mi) do'\upl mi,(re mi)\mbreak
   
   %106
   la sib sol la fa sol mi fa re mi do re
   si8 sol' sol sol sol sol
   <<{s8 si si do do si
   
   %109
   si}\\{sol re re mi mi re
            sol fa fa fa fa fa}>>
   fa2-+~fa8 mi16 (re)
   mi8 fa re4.-+ do8\mbreak
   
   %112
   do16 do' mi, do' fa, do' sol do la do fa, do'
   sol do mi, do' fa, do' sol do la do fa, do'
   sol do mi, do' fa, sol re sol mi sol do, do'\mbreak
   
   %115
   <si re, sol, sol,>2.
   <do mi, sol, sol,>
   <do re, la do,>
   
   %118
   <si re, sol, sol,>
   <do mi, sol, sol,>4 si4.-+ do8
   do[do, do do] mi16 re do si
   
   %121
   do8[mi, mi mi] sol16 fa mi re\mbreak
   mi8[do do do] mi16 re do si
   do8 <mi' do mi, sol,> <mi do mi, sol,> <mi do mi, sol,> <mi do mi, sol,> <mi do mi, sol,>
   
   %124
   <mi do mi, sol,>2.\fermopz

}

IVvcn = \relative do {
   
   do'4\solo fa,2
   do do'4
   fa, sol sol
   
   %4
   do,2 do'4
   fa, sol sol\mbreak
   do,2 do'4
   
   %7
   \clef tenor do8\upl sol'\upl si,\upl sol'\upl do,\upl sol'\upl
   sol,4 sol'8 fa mi re
   \clef bass do\upl\tu do,\upl fa\upl do'\upl fa,\upl do'\upl
   do, do' do, do' do, do'
   
   %11
   fa, la sol fa sol sol,\mbreak
   do do' do, do' do, do'
   fa, la sol fa sol sol,
   
   %14
   do do' do, do' do, do'
   do, sol' si, sol' do, sol'
   sol, sol' si re si sol
   
   %17
   do,4 do'~do16 sib la sol
   fa4 fa~fa16 sol la si?
   do,4 do'~do16 do si do
   
   %20
   sol4 sol~sol16 fa sol sol,
   do4 do~do16 re mi fa\mbreak
   sol,4 sol'~sol16 fa mi re
   
   %23
   do4 do'8 re mi do
   re re16 do si8[re sol, si]
   do4 mi, do
   
   %26
   sol' si, sol
   do' mi, do
   sol' si, sol
   
   %29
   do do'8 re mi do
   re4 r r
   r8 re re re re re
   
   %32
   <re, re,>4 r r
   r16 fad' fad fad re fad la, re fad, la re, fad\mbreak
   sol,4 re' re,
   
   %35
   sol8 sol' la si do la
   si sol la si do la
   si sol la fad sol sol,
   
   %38
   re' re re re re re
   sol, sol sol sol sol sol
   do do do do do do
   
   %41
   re re re re re re
   sol do, re4 re,\mbreak
   sol r r
   
   %44
   r16 sol si re sol4 r
   r16 sol, si re sol4 r
   r8 <sol sol,> <sol sol,><sol sol,> <sol sol,> <sol sol,>
   
   %47
   <sol sol,>2.
   sol4\solo do,2
   sol sol'4
   
   %50
   do, re re\mbreak
   sol,2 sol'4 
   do, re re
   
   %53
   sol2 sol,4   
   sol'8\upl re'\upl fad,\upl re'\upl sol,\upl re'\upl
   re,4 re8\tu do si la\mbreak
   
   %56
   sold4 sold' si
   la, la' do\mbreak
   mi,, sold' si
   
   %59
   la, la' do
   si, sold' si
   do, mi la
   
   %62
   re, la' re
   sold,8 si sold mi fad sold\mbreak
   la re, mi4 mi,
   
   %65
   la r r
   r16 la do mi la4 r
   r8 <la la,> <la la,> <la la,> <la la,> <la la,>
   
   %68
   la, la'16 sib do re do sib la sib la sol
   fa2.~
   fa2 fa4\mbreak
  
   %71
   sib la sol\mbreak
   fa do fa,
   sib la sol
   
   %74
   fa do fa
   fa'8 do' mi, do' fa, do'
   do,16 do' sib la sol fa mi re do sib la sol
   
   %77
   fa8 fa fa fa fa fa
   fa fa fa fa fa fa\mbreak
   fa4 r fa
   
   %80
   sib8 sib'16 la sib8[fa re sib]
   sol8 sol sol sol sol sol
   sol sol sol sol sol sol
   
   %83
   sol4 r sol
   do8 do'16 si? do8[sol mi do]
   la la la la la la\mbreak
   
   %86
   la la la la la la
   la4 r la
   re16 la' dod, la' re, la' mi la fa la re, la'
   
   %89
   sol mi' fa, re' mi, dod' re, re' dod, la' re, la'
   fa, fa' mi re sol, sol' fa mi fa, fa' mi re
   sol4 la la,
   
   %92
   re la' do?
   fad,, la' do\mbreak
   sol, si re
   
   %95
   sol, si re
   do, mi' sol
   sol, re' sol
   
   %98
   la, fa' la
   sol8 si fa re' mi, do'
   re,4 do do,\mbreak
   
   %101
   sol'8 sol'16 fa mi8[sol mi do]
   fa4 la, fa
   do' mi, do
   
   %104
   fa' la, fa
   do' mi, do
   fa fa'8 sol la fa
   
   %107
   sol4 r r
   \clef tenor r8 sol' sol sol sol sol
   \clef bass <sol, sol,>4 r r\mbreak
   
   %110
   r16 si si si sol si re, sol si, re sol, si
   do,4 sol'2
   \clef tenor do8 do' re mi fa re
   
   %113
   mi do re mi fa re 
   \clef bass mi do re si do do,
   sol' sol sol sol sol sol
   
   %116
   do do do do do do\mbreak
   fa, fa fa fa fa fa
   sol sol sol sol sol sol
   
   %119
   do,4 sol' sol,
   do r r
   r16 do mi sol do4 r
   
   %122  
   r16 do, mi sol do4 r
   r8 <do, do,> <do do,> <do do,> <do do,> <do do,>
   <do do,>2.\fermopz

}

IVbcn = \relative do {
   
   R2.*8
   do'8\upl do,\upl fa\upl do'\upl fa,\upl do'\upl
   do,4 do do
   
   %11
   fa8 la sol fa sol sol,\mbreak
   do4 do do
   fa8 la sol fa sol sol,
   
   %14
   do4 do do
   do si do
   sol8 sol' si re si sol
   
   %17
   do,4 r r
   fa r r
   do r r\mbreak
   
   %20
   sol' r r
   do, r r
   sol r r
   
   %23
   do do'8 re mi do
   re re16 do si8[re sol, si]
   do2 do,4
   
   %26
   sol'2 sol,4
   do'2 do,4
   sol'2 sol,4\mbreak
   
   %29
   do do'8 re mi do
   re4 r r
   R2.
   
   %32
   <re, re,>4 r r
   r8 re re re re re
   sol,4 re' re,
   
   %35
   sol r r
   sol r r\mbreak
   sol r r
   
   %38
   r8 re' re re re re
   sol, sol sol sol sol sol
   do do do do do do
   
   %41
   re re re re re re
   sol do, re4 re,\mbreak
   sol r sol'
   
   %44
   sol, r sol' 
   sol, r sol'
   la,8 <sol' sol,> <sol sol,><sol sol,> <sol sol,> <sol sol,>
   
   %47
   <sol sol,>2.
   R2.*7
   r4 re8 do si la\mbreak
   
   %56
   sold4 r r
   la r r
   mi r r
   
   %59
   la r r
   si r r
   do r r
   
   %62
   re r re'
   sold,8 si sold mi fad sold\mbreak
   la re, mi4 mi,
   
   %65
   la r la'
   la, r la'
   la,8 <la' la,> <la la,> <la la,> <la la,> <la la,>
   
   %68
   <la la,>4 r r
   fa sib,2
   fa fa'4
   
   %71
   sib la sol\mbreak
   fa do fa,
   sib la sol
   
   %74
   fa do fa
   fa'8 do' mi, do' fa, do'
   do,4 r r
   
   %77
   fa,8 fa fa fa fa fa
   fa fa fa fa fa fa\mbreak
   fa4 r fa
   
   %80
   sib r r
   sol8 sol sol sol sol sol
   sol sol sol sol sol sol
   
   %83
   sol4 r sol
   do r r
   la8 la la la la la\mbreak
   
   %86
   la la la la la la
   la4 r la
   re8 dod re mi fa re
   
   %89
   sol fa mi re dod re
   fa,4 sol fa
   sol' la la,
   
   %92
   re r r\mbreak
   fad, r r
   sol r r
   
   %95
   sol r r
   do, r r
   sol' r r
   
   %98
   la r la'
   sol8 si fa re' mi, do'
   re,4 do do,\mbreak
   
   %101
   sol'8 sol'16 fa mi8[sol mi do]
   fa2 fa,4
   do'2 do,4 
   
   %104
   fa'2 fa,4
   do'2 do,4
   fa fa'8 sol la fa
   
   %107
   sol4 r r
   R2.
   <sol sol,>4 r r\mbreak
   
   %110
   r8 sol, sol sol sol sol
   do,4 sol'2
   do4 r r
   
   %113
   do r r 
   do r r
   r8 sol' sol sol sol sol
   
   %116
   do do do do do do\mbreak
   fa, fa fa fa fa fa
   sol sol sol sol sol sol
   
   %119
   do,4 sol' sol,
   do r do'
   do, r do'
   
   %122
   do, r do'\mbreak
   do,8 <do do,> <do do,> <do do,> <do do,> <do do,>
   <do do,>2.\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \key do\major
    \tempo 2 = 60
    s2.*47
    \bar":..:"\break
    \mark\markup "Reprise"
    s2.*77
    \bar":|."

}

IVvlI = {
    \global
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}

IVvc = {
    \global
    \clef bass
    <<\IVvcn \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>

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

VvlIn = \relative do'' {

   mib4(sol)
   sol, re' fa8(mib) re(do)
   si4-+ \appoggiatura lab16 sol4 lab4.(sol8)
   sol4 do \appoggiatura do16 re4. mib8

   %4
   re2-+ mib4 \appoggiatura mib16 fa8 sol\mbreak
   sol,4 re' fa8(mib) re(do)
   si4-+ \appoggiatura lab16 sol4 re'4.(\senza \tuplet 3/2 { mib16 re mib) }

   %7
   fa4 (mib8-+) re re4.-+ do8
   do2   <<
      {
         mib4.(re8)
         re2  mib,4.(re8)

         %10
         re2 sol'4.(fa8)
         fa2 sol,4. (fa8)
         fa2
      }\\{
         sol
         sol sol,
         sol sib'?
         sib sib,
         sib
      }
   >> sib'8\f(do) reb(mib)

   %13
   do4-+ \appoggiatura sib16 lab4 do8(re?) mib(fa)
   re4-+ \appoggiatura do16 sib4 <<{sib(lab8-+) sol}\\{s4 mib}>>
   do'(sib8_+) lab sol4(fa8_+) mib\mbreak

   %16
   lab,4(lab') sib,(sib')
   lab8(sib) sol(lab) fa4._+ mib8
   mib2 mib'4(sol)

   %19
   sol, re' fa8(mib) re(do)
   si4-+ \appoggiatura lab16 sol4 lab4.(sol8)
   sol4 do \appoggiatura do16 re4. mib8

   %22
   re2-+ mib4 \appoggiatura mib16 fa8 sol\mbreak
   sol,4 re' fa8(mib) re(do)
   si4-+ \appoggiatura lab16 sol4 re'4.(\senza \tuplet 3/2 { mib16 re mib) }

   %25
   fa4 (mib8-+) re re4.-+ do8
   do2 sol'4(fa8-+) mib
   fa4 fa, sol(fa8_+) mib

   %28
   fa4 \appoggiatura mib16 re4 <<
      {
         re'4. (do8)
         do2 fa,
         fa
      }\\{
         fa
         fa re4. do8
         do2
      }
   >> fa'4\f(lab))

   %31
   sol8 sol,(fa-+ mib) sol'4 (sib)
   la?8 la,(sol-+ fa) fa'4(mib8-+) re
   sol4(fa8-+) mib re4(do8-+) sib

   %34
   mib,4(mib') fa,(fa')\mbreak
   mib8(fa) re(mib) do4.-+(sib8)
   sib2 <<
      {
         re4. fa8

         %37
         \appoggiatura fa16 mib4 \appoggiatura re16 do4 do \appoggiatura do16 re8 mib
         re4 \appoggiatura do16 sib4 sib4. reb8
         \appoggiatura reb16 do4
      } \\{
         sol2
         sol4 r fa2
         fa4 r mib2
         mib4
      }
   >> \appoggiatura sib'16 lab4 re?4. fa8\mbreak

   %40
   si,4-+ \appoggiatura lab16 sol4 sol'(fa8-+) mib
   lab4(sol8-+) fa mib4(re8-+) do
   fa,4(fa') sol,(sol')

   %43
   si, do \appoggiatura do16 re4. mib8
   re2-+ mib4(sol)
   sol, re' fa8(mib) re(do)

   %46
   si4-+ \appoggiatura lab16 sol4 lab4.(sol8)
   sol4 do \appoggiatura do16 re4. mib8
   re2-+ mib4 \appoggiatura mib16 fa8 sol\mbreak

   %49
   sol,4 re' fa8(mib) re(do)
   si4-+ \appoggiatura lab16 sol4 re'4.(\senza \tuplet 3/2 { mib16 re mib) }
   fa4 (mib8-+) re re4.-+ do8

   %52
   do2

}

VvlIIn = \relative do'' {
   
   r8 do [sol mib]~
   mib re sol re'~re do fa, re~
   re re sol si~si lab re, si~
   si do mib sol~sol lab re, do~\mbreak
   
   %4
   do si re sol~ sol do sol mib~
   mib re sol re'~re do fa, re~
   re re sol si~si do fa, re~
   
   %7
   re re lab' do~ do si sol re~
   re mib sol do~  do mib, sol do~\mbreak
   
   %9
   do re, sol si~si mib, sol do~
   do re, sol si r sol sib mib~
   mib fa, sib re~re sol, sib mib~
   
   %12
   mib fa, sib re r sib, mib sib'~
   sib lab mib do~do do fa do'~\mbreak
   do sib fa re r mib re mib~
   
   %15
   mib mib' re mib~mib mib, re mib~
   mib mib' re mib~mib mib, re mib
   re re mib fa re4._+ mib8
   
   %18
   mib sol sib mib ~mib do sol mib~\mbreak
   mib re sol re'~re do fa, re~
   re re sol si~si lab re, si~
   
   %21
   si do mib sol~sol lab re, do~\mbreak
   do si re sol~ sol do sol mib~
   mib re sol re'~re do fa, re~
   
   %24
   re re sol si~si do fa, re~
   re re lab' do~ do si sol re~
   re mib sol do r8 sol sib mib~
   
   %27
   mib fa, sib re~re sol, sib mib~
   mib fa, sib re~re re, fa sib~
   sib do, fa la~la re, fa sib~
   
   %30
   sib do, fa la r fa sib, fa'~\mbreak
   fa mib sib sol~sol sol do sol'~
   sol fa do la r sib la sib~
   
   %33
   sib sib' la sib~sib sib, la sib~
   sib sib' la sib~sib sib, la sib
   la la sib re la4._+ sib8
   
   %36
   sib sib re fa~fa re sol re'~
   re do sol mib~mib do fa do'~
   do sib fa re~re sib mib sib'~
   
   %39
   sib lab mib do~do lab re lab'~
   lab sol re si~si do si do~
   do do' si do~ do do, si do~\mbreak
   
   %42
   do do' si do~do do, si do
   fa sol, mib' sol, re' sol, do sol
   si re sol si~si do sol mib~
   
   %45
   mib re sol re'~re do fa, re~
   re re sol si~si lab re, si~
   si do mib sol~sol lab re, do~\mbreak
   
   %48
   do si re sol~ sol do sol mib~
   mib re sol re'~re do fa, re~
   re re sol si~si do fa, re~
   
   %51
   re re lab' do~ do si sol re~
   re mib sol do

}

Vvcn = \relative do {
   
   do'4 do,
   sib' sib, lab' lab,
   sol' sol, fa' fa,
   mib' mib, fa' fa,
   
   %4
   sol' sol, do' do,
   sib' sib, lab' lab,
   sol' sol, lab' lab,
   
   %7
   fa' fa, sol' sol,
   do do, do'' do,
   sol' sol, do\p do,
   
   %10
   sol' sol' mib'\f mib,
   sib' sib, mib\p mib,
   sib' sib, sol''\f sol,\mbreak
   
   %13
   lab' lab, la' la,
   sib' sib, sol'2
   lab sib
   
   %16
   do sol
   fa4-+ mib sib' sib,
   mib mib, do''4 do,
   
   %19
   sib' sib, lab' lab,
   sol' sol, fa' fa,
   mib' mib, fa' fa,
   
   %22
   sol' sol, do' do,
   sib' sib, lab' lab,
   sol' sol, lab' lab,
   
   %25
   fa' fa, sol' sol,
   do do,  mib'' mib,\mbreak
   sib' sib, mib mib,
   
   %28
   sib' sib, sib'' sib,
   fa' fa, sib\p sib,
   fa' fa' re \f re,
   
   %31
   mib' mib, mi' mi,
   fa' fa, re'2\mbreak
   mib fa
   
   %34
   sol re
   do4_+ sib fa' fa,
   sib sib' si si,
   
   %37
   do' do, la' la,
   sib' sib, sol' sol,\mbreak
   lab' lab, fa' fa,
   
   %40
   sol' sol, mib'2
   fa sol
   lab mib
   
   %43
   re4 do si_+ do
   sol sol' do do,
   sib' sib, lab' lab,
   
   %46
   sol' sol, fa' fa,
   mib' mib, fa' fa,
   sol' sol, do' do,
   
   %49
   sib' sib, lab' lab,
   sol' sol, lab' lab,
   fa' fa, sol' sol,
   
   %52
   do do,  

}

Vbcn = \relative do {
   
   do'2
   sib lab
   sol fa 
   mib fa
   
   %4
   sol do
   sib lab
   sol lab
   
   %7
   fa sol 
   do, do'
   sol do,\p
   
   %10
   sol mib''\f
   sib mib,\p
   sib sol'\mbreak
   
   %13
   lab la
   sib sol
   lab sib
   
   %16
   do sol
   fa4-+ mib sib'2
   mib, do'2
   
   %19
   sib lab
   sol fa 
   mib fa
   
   %22
   sol do
   sib lab
   sol lab
   
   %25
   fa sol 
   do, mib'
   sib mib,\mbreak
   
   %28
   sib sib'
   fa sib,\p 
   fa re'\f 
   
   %31
   mib mi
   fa re
   mib fa 
   
   %34
   sol re\mbreak
   do4_+ sib fa'2
   sib, si' 
   
   %37
   do la
   sib sol
   lab fa
   
   %40
   sol mib
   fa sol\mbreak
   lab mib
   
   %43
   re4 do si_+ do
   sol2 do'2
   sib lab
   
   %46
   sol fa 
   mib fa
   sol do
   
   %49
   sib lab
   sol lab
   fa sol 
   
   %52
   do,
   
}

Vbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 2/2
   \override Staff.TimeSignature.style = #'single-digit
   \key sib\major
   \tempo 2 = 55
   \partial 2 s2
   s1*7
   s2
   \bar":|."\break
   \mark\markup "I. Reprise"
   s2
   s1*9
   s2
   %\bar"||"\break
   \once \override Score.RehearsalMark.extra-offset = #'(+5 . 0)
   \mark\markup "[Refrain]"
   s2
   s1*7
   s2
   \bar "||"\break
   \mark\markup "2. Reprise"
   s2
   s1*17
   s2
   %\bar"||"\break
   \once \override Score.RehearsalMark.extra-offset = #'(+5 . 0)
   \mark\markup "[Refrain]"
   s2
   s1*7
   s2
   \bar "|."
}

VvlI = {
   \global
   <<\VvlIn \forma>>

}

VvlII = {
   \global
   <<\VvlIIn \forma>>

}

Vvc = {
   \global
   \clef bass
   <<\Vvcn \forma>>

}

Vbc = {
   \global
   \clef bass
   <<\Vbcn \forma \Vbfn>>

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

   r8
   do,4 r8 re4 r8 mi4 fa8 sol4 do8
   <<{re4. si-+}\\{sol sol}>> do8 sol mi mi sol do
   do,4 r8 re4 r8 mi4 fa8 sol fa mi\mbreak

   %4
   re4.<<sol\\si,>> do8 sol' do mi sol do
   sol(fa-+ mi) sol, mi do la''(sol-+ fa) fa do la
   sol'\p(fa-+ mi) sol, mi do la''(sol-+ fa) fa do la

   %7
   la'\f(sol-+ fad) la, fad re si''(la-+ sol) sol re si\mbreak
   la'\p(sol-+ fad) la, fad re si''(la-+ sol) sol re si
   si,\f(la si) re'(do re) si(la si) sol(fa? sol)

   %10
   do,(si do) mi'(re mi) do(si do) la(sol la)
   re,(do re) fad'(mi fad) re(do re) si(la si)\mbreak
   mi,(re mi) sol'(fad sol) mi(re mi) do(si do)

   %13
   fad,(mi fad) la'(sol la) fad(mi fad) re(do re)
   sol4 r8 do,4 r8 sol' re si sol re si
   sol4 r8 do4 r8\mbreak sol si re sol si re

   %16
   sol4 r8 do,4 r8 sol4 r8 do4 r8
   la4. re8(do-+ si) do(la' sol) fad(sol la)
   re, si mi mi la, re re sol, do do fad, si

   %19
   si mi, la la re, sol\mbreak fad(re fad) sol(re sol)
   do(re si) la(re do) si re, sol si re sol
   si sol re si sol re sol,4. r4 r8

   %22 OOKK
   sol'4 r8 la4 r8 si4 do8 re4 sol8
   <<{la4. fad}\\{re re}>>\mbreak sol8 re si si re sol
   sol,4 r8 la4 r8 si4 do8 re do si

   %25
   <<{do4. fad,}\\{re re}>> sol8 re si sol4.
   re'8 re' re, re re' re, re4. r4 r8
   fa fa' fa, fa fa' fa, mi si' mi sold si sold\mbreak %%% fine sec riga p 2

   %28
   mi4 r8 la,4 r8 mi' sold si si sold mi
   mi,4\p r8 la,4 r8 mi' sold si mi sold si
   la\f(sold la) fa(mi fa) si,(la sold) la(sold la)

   %31
   si(sold la) sold4 la8 la la' mi do la mi\mbreak
   dod(mi la) dod(mi la) la(mi dod) la(mi dod)
   dod(mi la) dod(mi la) la(mi dod) la(mi sol)

   %34
   fad(la re) fad(la re) re(la fad) re(la fad)
   fad(la re) fad(la re) re(la fad) re(la do)
   si,(re sol) si(re sol) sol(re si) sol(re si)

   %37
   si(re sol) si(re sol) sol(re si) sol(re fa)
   mi(sol do) mi(sol do)\mbreak do(sol mi) do(sol mi)
   mi(sol do) mi(sol do)\mbreak do(sol mi) do (sol sib)

   %40
   la,(do mi) la(do fa) fa(do la) fa(do la)
   la(do mi) la(do fa) fa(do la) fa(do la)\mbreak
   la(re fa) la(re fa) si,(do re) sol, fa mi

   %43
   re4 re'8 re, si sol mi''(re-+ do) do sol mi
   sol'(fa-+ mi) sol, mi do la''(sol-+ fa) fa do la
   la'(sol-+ fad) la, fad re\mbreak si''(la-+ sol) sol re si

   %46
   mi,(re mi) sol'(fa? sol) mi(re mi) do(si do)
   fa,(mi fa) la'(sol la) fa(mi fa) re(do re)
   sol,(fa sol) si'(la si) sol(fa sol) mi(re mi)\mbreak

   %49
   la, \parenthesize (sol la) do' (si do) la (sol la) fa (mi fa)
   si, (la si) re' (do re) si (la si) sol (fa sol)
   do4 r8 fa,4 r8 do mi sol sol mi do

   %52
   do,4 r8 fa4 r8\mbreak do mi sol do mi sol
   do4 r8 fa,4 r8 do4 r8 fa,4 r8
   re4. sol8(fa_+ mi) fa(re' do) si(do re)

   %55
   sol, mi la la re, sol sol do, fa fa si, mi\mbreak
   mi la, re re sol, do re sol, re' mi sol, mi'
   re sol, re' sol re fa mi mi sol do mi sol

   %58
   do do sol mi do sol do,4. r4

}

VIvlIIn = \relative do'' {
   
   sol'8
   do,4 do'8 do,4 sol'8 do,4.-+~do8 re mi
   fa mi fa re sol fa mi-+ re do do4 sol'8
   do, do' do, do sol' do, do4.-+~do8 si la\mbreak
   
   %4
   sol fa mi re sol fa mi_+ re do do4 do'8
   do-+ \parenthesize (si do) do sol mi do'-+ (si do) do la fa
   do'\p -+ (si do) do sol mi do'-+ (si do) do la fa
   
   %7
   re'\f-+ (dod re) re la fad re'-+(dod re) re si sol\mbreak
   re'\p-+ (dod re) re la fad re'-+(dod re) re si sol
   re'\f(do? re) si(la si) sol(fa? sol) mi(re mi)
   
   %10
   mi'(re mi) do(si do) la(sol la) fad(mi fad)
   fad'(mi fad) re(do re) si(la si) sol (fad sol)\mbreak
   sol'(fad sol) mi(re mi) do(si do) la(sol la)
   
   %13
   la'(sol la) fad(mi fad) re(do re) si(la si)
   sol sol' sol, sol sol' sol, sol sol' sol, sol sol' sol,
   sol sol' sol, sol sol' sol, sol sol' sol, sol sol' sol,\mbreak
   
   %16
   sol sol' sol, sol sol' sol, sol sol' sol, sol sol' sol,
   fad'-+ mi re sol(fad mi) re(do si) la (re do)
   si mi si la re la sol do sol fad si fad
   
   %19
   mi la mi re sol re re(fad re) re (sol re)
   mi(la sol) fad(la fad) sol re' si sol4.~
   sol8 re si sol4. <si' re sol,>4. r4 re8
   
   %22
   sol,4 sol'8 sol,4 re'8 sol,4._+~sol8 la si
   do si do la re do si-+ la sol sol4 re'8\mbreak
   sol, sol' sol, sol re' sol, sol4.~sol8 fad mi
   
   %25
   re do si la re do si_+ la sol sol4 re''8
   fa? mi fa fa mi fa re do re re do re
   si la si si la si\mbreak sold fad mi mi mi' mi,
   
   %28
   mi mi' mi, mi mi' mi, mi mi' mi, mi mi' mi,
   mi\p mi' mi, mi mi' mi, mi mi' mi, mi mi' mi,
   mi'\f (re do) si(do la) sold(fad mi) mi'(re do)\mbreak
   
   %31
   fa si, do si4-+ la8 la4. r4 r8
   la la' la, la la' la, la la' la, la la' la,
   la la' la, la la' la, la la' la, la la' mi
   
   %34
   fad4-+ r8 fad4 r8 la4 r8 fad4 r8\mbreak
   <<la,4\\fad>> r8 fad'4 r8 la4 r8 fad4 r8
   sol, sol' sol, sol sol' sol, sol sol' sol, sol sol' sol,
   
   %37
   sol sol' sol, sol sol' sol, sol sol' sol, sol sol' \parenthesize re
   mi4-+ r8 mi4 r8 sol4 r8 mi4 r8\mbreak
   <<sol,4\\mi>> r8 mi'4 r8 sol4 r8 mi4 r8
   
   %40
   fa, fa' fa, fa fa' fa, fa fa' fa, fa fa' fa,
   fa fa' fa, fa fa' fa, fa fa' fa, fa fa' fa,
   fa fa' fa, fa fa' fa, fa'(mi re) do(si la)\mbreak
   
   %43
   sol_+(fad sol) sol re si sol'_+(fad sol) sol mi do
   do'-+(si do) do sol mi do'-+(si do) do la fa
   re'-+(dod re) re la fad re'-+(dod re) re si sol
   
   %46
   sol(fa? sol) mi(re mi)\mbreak do(si do) la(sol la)
   la'(sol la) fa(mi fa) re(do re) si(la si)
   si'(la si) sol(fa sol) mi(re mi) do(si do)
   
   %49
   do'(si do) la(sol la) fa(mi fa) re(do re)\mbreak
   re'(do re) si(la si) sol(fa sol) mi(re mi)
   do do' do, do do' do, do do' do, do do' do,
   
   %52
   do do' do, do do' do, do do' do, do do' do,
   do do' do, do do' do, do do' do, do do' do,
   si'-+(la sol) do(si la) sol(fa mi) re (sol fa)
   
   %55
   mi la mi re sol re do fa do si mi si
   la re la sol do sol sol re' sol, sol mi' sol,\mbreak
   sol re' do si re si \once\stemUp do sol'' mi do4.~
   
   %58
   do8 sol mi do4. <do' sol do,>4. r4
   
}

VIvcn = \relative do {
   
   r8
   do'4 r8 si4 r8 la sol fa mi re do
   si4._+ sol do do,
   do''4 r8 si4 r8 la sol fa mi re do

   %4
   si4._+ sol do do,
   mi'4 r8 mi,4 r8 fa'4 r8 fa,4 r8
   mi'4\p r8 mi,4 r8 fa'4 r8 fa,4 r8
   
   %7
   fad'4\f r8 fad,4 r8 sol'4 r8 sol,4 r8
   fad'4\p r8 fad,4 r8 sol'4 r8 sol,4 r8
   r4 r8 sol'4\f r8 sol4 r8 do,4 r8
   
   %10
   r4 r8 la'4 r8 la4 r8 re,4 r8
   r4 r8 si'4 r8 si4 r8 mi,4 r8\mbreak
   r4 r8 do'4 r8 do4 r8 fad,4 r8
   
   %13
   r4 r8 re'4 r8 re4 r8 sol,4 r8
   re'4 r8 mi4 r8 re4 r8 r4 r8
   si4 r8 do4 r8 si4 r8 r4 r8\mbreak
   
   %16
   re4 r8 mi4 r8 re4 r8 mi4 r8
   re4 do8 si la sol fad4.-+ r4 re8
   sol4. fad mi re

   %19
   do si la sol
   do, re\mbreak sol r8 re'' si
   sol4.~sol8 re si sol4. r4 r8

   %22
   sol'4 r8 fad4 r8 mi re do si la sol
   fad4._+ re sol sol
   sol'4 r8 fad4 r8 mi re do si la sol\mbreak

   %25
   fad4._+ re sol sol
   r4 r8 r4 re''8 fa mi fa fa mi fa\mbreak
   re do re re do re mi4 r8 r4 r8
   
   %28
   si4 r8 do4 r8 si4 r8 r4 r8
   si4\p r8 do4 r8 si4 r8 r4 r8
   do,4.\f re mi do
   
   %31
   re mi la8 mi do la mi do
   la'4. dod'4 r8 mi4 r8 dod4 r8
   la4 r8 dod4 r8 mi4 r8 dod4 r8\mbreak
   
   %34
   re4 r8 re4 r8 fad?4 r8 re4 r8
   re,4 r8 re'4 r8 fad4 r8 re4 r8
   si4 r8 si4 r8 re4 r8 si4 r8
   
   %37
   sol4 r8 si4 r8\mbreak re4 r8 si4 r8
   do4 r8 do4 r8 mi4 r8 do4 r8
   do,4 r8 do'4 r8 mi4 r8 do4 r8
   
   %40
   la4 r8 la4 r8 do4 r8 la4 r8\mbreak
   fa4 r8 la4 r8 do4 r8 la4 r8
   re, re' re, re re' re, re'(do si) mi re do
   
   %43
   si4 r8 si,4 r8 do'4 r8 do,4 r8
   mi4 r8 mi,4 r8\mbreak fa'4 r8 fa,4 r8
   fad'4 r8 fad,4 r8 sol'4 r8 sol,4 r8
   
   %46
   r4 r8 do'4 r8 do4 r8 fa,4 r8
   r4 r8 re'4 r8 re4 r8 sol,4 r8\mbreak
   r4 r8 mi'4 r8 mi4 r8 la,4 r8
   
   %49
   r4 r8 fa'4 r8 fa4 r8 si,4 r8 
   \clef tenor r4 r8 sol'4 r8 sol4 r8 do,4 r8
   \clef bass sol4 r8 la4 r8\mbreak sol4 r8 r4 r8
   
   %52
   mi4 r8 fa4 r8 mi4 r8 r4 r8
   sol4 r8 la4 r8 sol4 r8 la4 r8
   sol4 fa8 mi re do si4._+ r4 sol8
   
   %55
   do4. si la sol
   fa mi re do
   sol' sol do, r8 sol'' mi
   
   %58
   do4.~do8 sol mi do4. r4

}

VIbcn = \relative do {

   r8
   do'4 r8 si4 r8 la sol fa mi re do
   si4._+ sol do do,
   do''4 r8 si4 r8 la sol fa mi re do

   %4
   si4._+ sol do do,
   mi'2. fa
   mi\p fa\mbreak

   %7
   fad\f sol
   fad\p sol
   sol,4.\f r4 r8 r2.

   %10
   la4. r4 r8 r2.
   si4. r4 r8 r2.
   do4. r4 r8 r2.

   %13
   re4. r4 r8 r2.
   si'4 r8 do4 r8 si4 r8 r4 r8\mbreak
   re4 r8 mi4 r8 re4 r8 r4 r8

   %16
   si4 r8 do4 r8 si4 r8 do4 r8
   re4 do8 si la sol fad4.-+ r4 re8
   sol4. fad mi re

   %19
   do si la sol
   do, re\mbreak sol r8 re'' si
   sol4.~sol8 re si sol4. r4 r8

   %22
   sol'4 r8 fad4 r8 mi re do si la sol
   fad4._+ re sol sol
   sol'4 r8 fad4 r8 mi re do si la sol\mbreak

   %25
   fad4._+ re sol sol
   R1.*2
   sold'4 r8 la4 r8 sold4 r8 r4 r8

   %29
   sold4\parenthesize \p r8 la4 r8 sold4 r8 r4 r8
   do,4.\parenthesize \f re mi do
   re mi la8 mi do la mi do

   %32
   la'4. la'4 r8 dod4 r8 la4 r8
   la,4 r8 la'4 r8\mbreak dod4 r8 la4 r8
   re, re' re, re re' re, re re' re, re re' re,

   %35
   re re' re, re re' re, re re' re, re re' la  
   si4 r8 sol4 r8 si4 r8 sol4 r8
   sol,4 r8 sol'4 r8 si4 r8 sol4 r8

   %38
   do, do' do, do do' do, do do' do, do do' do,
   do do' do, do do' do, do do' do, do do' sol
   la4 r8 fa4 r8 la4 r8 fa 4 r8

   %41
   fa,4 r8 fa'4 r8 la4 r8 fa4 r8
   re re' re, re re' re, re'(do si) mi re do
   si2. do

   %44
   mi, fa
   fad sol
   do,4. r4 r8 r2.

   %47
   re4. r4 r8 r2.
   mi4. r4 r8 r2.
   fa4. r4 r8 r2.

   %50
   sol4. r4 r8 r2.\mbreak
   mi4 r8 fa4 r8 mi4 r8 r4 r8
   sol4 r8 la4 r8 sol4 r8 r4 r8

   %53
   mi4 r8 fa4 r8 mi4 r8 fa4 r8
   sol4 fa8 mi re do si4._+ r4 sol8
   do4. si la sol

   %56
   fa mi re do
   sol' sol do, r8 sol'' mi
   do4.~do8 sol mi do4. r4
   
}

VIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 12/8
   \key do\major
   \tempo 1 = 50
   \partial 8 s8
   s1.*20
   s2. s4. s4
   \bar":..:"\break
   s
   s1.*36
   s2. s4. s4
   \bar":|."

}

VIvlI = {
   \global
   <<\VIvlIn \forma>>

}

VIvlII = {
   \global
   <<\VIvlIIn \forma>>

}

VIvc = {
   \global
   \clef bass
   <<\VIvcn \forma>>

}

VIbc = {
   \global
   \clef bass
   <<\VIbcn \forma \VIbfn>>

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17)


\pointAndClickOff

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

    systems-per-page = #4

}

    \header {
        title = \markup {Sonata 3\super a a quattro [Op. 3/3]}
        composer = \markup \center-column{\vspace #+0.5"J.-J. Cassaneà de Mondonville (1711 - 1772)"}
    }

    \markup \huge {[I.1] Allegro}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "vc"
                \Ivc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

    \pageBreak

    \markup \huge {[I.2] Aria: moderato grazioso}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "vc"
                \IIvc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

    \pageBreak

    \markup \huge {[I.3] Allegro}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "vc"
                \IIIvc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

    systems-per-page = #4

}

    \header {
        title = \markup {Sonata 4\super a a quattro [Op. 3/4]}
        composer = \markup \center-column{\vspace #+0.5"J.-J. Cassaneà de Mondonville (1711 - 1772)"}
    }

    \markup \huge {[II.1] Allegro}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \IVvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "vc"
                \IVvc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IVbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

    \pageBreak

    \markup \huge {[II.2] Aria: andante grazioso}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \VvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \VvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "vc"
                \Vvc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Vbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

    \pageBreak

    \markup \huge {[II.3] Giga}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \VIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \VIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "vc"
                \VIvc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

