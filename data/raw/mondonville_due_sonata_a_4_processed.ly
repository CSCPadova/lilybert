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

Iobn = \relative do'' {

   sol'16
   sol8.(fad16) fad8.(sol32 la)
   sol4 r8 r16 sol,
   mib'8. [mib16 re8.-+ do16]

   %4
   sib8.-+ la16 sol4
   R2*3
   r4 r8 r16 fa'!\f
   
   %9
   fa8.[sib,16 sib8. lab16]
   lab8.(sol32-+ fa) \appoggiatura fa16 sol8. sol'16
   sol8.[do,16 do8. sib16]
   
   %12
   sib8.(la?32-+ sol) \grace sol16 la4\mbreak
   fa'8.[sib,16 sol'8. mib16]
   la8.(sol32-+ fa) sib8. mib,16
   
   %15
   re4 do-+
   sib r
   R2*3
   
   %20
   r4 re8.\f mi16\mbreak
   \appoggiatura mi16 fa4 mi-+
   re r8 r16 sol re2
   
   %23 OOKK
   r8 re fad re sol re la' re,
   sib' sib, sib' la16-+ sol la8 la, la' sol16-+ fad\mbreak
   
   %25
   sol8 sol, sol' fad16-+ mi fad mi fad sol la sib do la
   sib do la sib sol la fa? sol mi fa sol fa mi fa re mi
   dod8-+ dod16 re mi fa sol mi fa8 mi16-+ re dod re mi dod\mbreak
   
   %28
   \grace dod16 re8 fa16 mi re do sib la sol8 mi'16 re dod sib la sol
   fa8 re'16 do? sib la sol fa mi8 dod'16 sib la sol fa mi
   fad8_+ fad16 sol la sib do? la\mbreak sib8 la16_+ sol fad sol la fad
   
   %31
   \grace fad16 sol4 r r2
   R1
   r8 re' fad re sol re la' re,
   
   %34
   sib' sib, sib' la16-+ sol la8 la, la' sol16-+ fa?
   sol8 sol, sol' fa16-+ mib fa8 fa, fa' mib16-+ re
   mib8 mib, mib' re16-+ do\mbreak re do re mib re fa mib re
   
   %37
   do8 re la sib \once\stemUp fa la'16(fa) sib(fa) do'(fa,)
   re'4 r r8 la,16 (fa) sib(fa) do'(fa,)
   re'8 sib fa re sol mib16 re mib4
   
   %40
   re8 sib' re sib sib' sib, sol' sib,
   mi? la, re la la' la, fad' la,
   re sol, do sol sol' sol, mi' re
   
   %43
   dod-+ la dod la re la mi' la,
   fa' fa, fa'4~fa8 sol, mi'4~\mbreak
   mi8 mi, re'4 dod8 [re dod8.-+ re16]
   
   %46
   re8 re'4 re,8~re16 re' do? sib do sib la re
   re,8 sol4 sol,8~sol16 sol' fa mib fa mib re sol
   sol,8 do'4 do,8~\mbreak do16 do' sib la sib la sol do
   
   %49
   do,8 fa4 fa,8~fa16 fa' mib re mib re do fa
   fa,8 re' re[re,] re' fa16 mib re do sib la
   sol8 sol' sol[sol,]\mbreak sol' sib16 la sol fa mib re
   
   %52
   do8 do, do' do, do' mib16 re do sib la sol
   fad8 sib fad sol \once\stemUp re fad'16 re sol re la' re,
   sib'4 r r8 fad,16(re) sol(re) la'(re,)\mbreak
   
   %55
   sib'8 do re do sib re do sib
   la16 re do sib la sib do la sib8 la16_+ sol fad sol la fad
   sol8 sol16 la sib do re mib fa?8 fa,?16 sol la sib do re\mbreak
   
   %58
   mib8 mib,16 fa sol la sib do \once\stemUp re,8 la'' fad la
   sol8 sib sol sib la do la do
   sol sib sol sib fad la fad la
   
   %61
   sol sib sol sib la do la do
   sol sib sol sib la, r sib4\fermata
   sib2 la4.-+ sol8
   
   %64
   sol1

}

IvlIn = \relative do'' {

   sol'16
   sol8.(fad16) fad8.(sol32 la)
   sol4 r8 r16 sol,
   mib'8. [mib16 re8.-+ do16]

   %4
   sib8.-+ la16 sol4
   sib'8.\p[re16 do8.-+ sib16]\mbreak
   la8.[do16 sib8.-+ la16]

   %7
   sol8.[sib16 la8.-+ sol16]
   fad4-+ r8 r16 fa\f
   fa8.[sib,16 sib8. lab16]

   %10
   lab8.(sol32-+ fa) \appoggiatura fa16 sol8. sol'16
   sol8.[do,16 do8. sib16]
   sib8.(la?32-+ sol) \grace sol16 la4\mbreak

   %13
   fa'8.[sib,16 sol'8. mib16]
   la8.(sol32-+ fa) sib8. mib,16
   re4 do-+

   %16
   sib r8 r16 sib'\p
   sib8.[(la16) la8.(sol16)]
   sol8.[(fa16) fa8.(mi!16)]

   %19
   mi8. [(re16) re8.(dod16)]
   dod8.(si32-+ la) re8.\f mi16\mbreak
   \appoggiatura mi16 fa4 mi-+

   %22 OOKK
   re r8 r16 sol re2
   r8 re fad re sol re la' re,
   sib' sib, sib' la16-+ sol la8 la, la' sol16-+ fad\mbreak
   
   %25
   sol8 sol, sol' fad16-+ mi fad mi fad sol la sib do la
   sib do la sib sol la fa? sol mi fa sol fa mi fa re mi
   dod8-+ dod16 re mi fa sol mi fa8 mi16-+ re dod re mi dod\mbreak
   
   %28
   \grace dod16 re8 fa16 mi re do sib la sol8 mi'16 re dod sib la sol
   fa8 re'16 do? sib la sol fa mi8 dod'16 sib la sol fa mi
   fad8_+ fad16 sol la sib do? la\mbreak sib8 la16_+ sol fad sol la fad
   
   %31
   \grace fad16 sol8 sol sol16 fa? mib re do8 re16 mib fa mib re do
   sib8 mib mib16 re do sib la8 sib16 do re do sib la\mbreak
   \once\stemUp sol8 re'' fad re sol re la' re,
   
   %34
   sib' sib, sib' la16-+ sol la8 la, la' sol16-+ fa?
   sol8 sol, sol' fa16-+ mib fa8 fa, fa' mib16-+ re
   mib8 mib, mib' re16-+ do\mbreak re do re mib re fa mib re
   
   %37
   do8 re la sib \once\stemUp fa la'16(fa) sib(fa) do'(fa,)
   \once\stemDown re'8 re,, do_+ sib fa' la16 (fa) sib(fa) do'(fa,)
   re'8 sib fa re sib mib16 re do8 fa\mbreak
   
   %40
   re sib' re sib sib' sib, sol' sib,
   mi? la, re la la' la, fad' la,
   re sol, do sol sol' sol, mi' re
   
   %43
   dod-+ la dod la re la mi' la,
   fa' fa, fa'4~fa8 sol, mi'4~\mbreak
   mi8 mi, re'4 <<{dod8 [re dod8.-+ re16]}\\{la4 la}>>
   
   %46
   re8 re'4 re,8~re16 re' do? sib do sib la re
   re,8 sol4 sol,8~sol16 sol' fa mib fa mib re sol
   sol,8 do'4 do,8~\mbreak do16 do' sib la sib la sol do
   
   %49
   do,8 fa4 fa,8~fa16 fa' mib re mib re do fa
   fa,8 re' re[re,] re' fa16 mib re do sib la
   sol8 sol' sol[sol,]\mbreak sol' sib16 la sol fa mib re
   
   %52
   do8 do, do' do, do' mib16 re do sib la sol
   fad8 sib fad sol \once\stemUp re fad'16 re sol re la' re,
   \once\stemDown sib'8 sib,, la_+ sol re' fad16(re) sol(re) la'(re,)\mbreak
   
   %55
   sib'(re,) do'(re,) re'(re,) do'(re,) sib' (re,) re'(re,) do'(re,) sib'(re,)
   la' re do sib la sib do la sib8 la16_+ sol fad sol la fad
   \grace fad sol8 sol16 la sib do re mib fa?8 fa,?16 sol la sib do re\mbreak
   
   %58
   mib8 mib,16 fa sol la sib do \terzine\con \tuplet 3/2 { re,(do' fad) \senza la-![ fad-! do-!] \con re,(do' fad) \senza la-![ fad-! do-!]}
   \stemUp <sol' sib, re,>8_\markup\italic "Segue" sib <sol sib, re,> sib <la do, re,> do <la do, re,> do
   <sol sib, re,> sib <sol sib, re,> sib <fad la, re,> la  <fad la, re,> la\mbreak
   
   %61
   <sol sib, re,> sib <sol sib, re,> sib <la do, re,> do <la do, re,> do
   <sol sib, re,> sib <sol sib, re,> sib <la, fad re> r\fermata <sib sol dod,>4
   <sib sol re>2 la4.-+ sol8
   
   %64
   sol1

}

IvlIIn = \relative do'' {

   r16
   <<
      {
         re,4 mib
         re
      }\\{
         sib4 do
         sib
      }
   >> r
   <<
      {
         la'2
         re,
      }\\{
         sol4 re
         sib2
      }
   >>
   
   %5
   re'\p~
   re~
   re4 do-+\mbreak
   
   %8
   re r
   <<
      {
         sib2\f ~
         sib
         
         %11
         do~
         do
         sib4~sib8. do16
         
         %14
         do4~do8. do16
         sib4 la-+
         sib
      }\\{
         re, fa~
         fa mib
         mib? sol~
         sol fa
         re8.[fa16 mib8. sol16]
         fa8.[re16 mib8. sol16]
         fa4 mib\mbreak
         re
      }
   >> r
   
   %17
   r r8 r16 sib'\parenthesize \p 
   sib8.[(la16) la8.(sol16)]
   sol8.[(fa16) fa8.(mi?16)]
   
   %20
   mi4 <<
      {
         re8.\parenthesize \f  re'16
         re4 dod
         re
      }\\{
         la,8. sib'16
         la4 sol
         fad
      }
   >> r <<re'2\\fad,>>

   %23
   R1
   r8 sol16 la sib do re mib fa?8 fa,16 sol la sib do re
   mib8 mib,16 fa sol la sib do re8 re,16 mi! fad sol la fad\mbreak
   
   %26
   sol8 la sib la sol la sib sol
   la r r4 r2
   R1*3
   
   %31
   <<{r8 re mib4~mib8 do re4~
      re8 sib do4~do8 re~re [do]\mbreak
      sib16 re do sib}\\{r4 r8 sol fad r r fa
                         mi? r r mib re fad sol [la]
                         re,16}>> la' sib do la sib8 la16_+ sol fad sol la fad
   
   %34
   \grace fad sol8 sol16 la sib do re mib fa?8 fa,?16 sol la sib do re
   mib8 mib,16 fa sol la sib do re8 re,16 mib fa sol la sib\mbreak
   do8 do,16 re mib fa sol la sib la sib do sib re do sib
   
   %37
   la8 fa' mib16-+ re do sib la(fa') fa, (fa') sol,(fa') la,(fa')
   sib,(fa') fa,(fa') mib re do sib la (fa') fa,(fa') sol, (fa') la, (fa')\mbreak
   sib, fa' sol la sib la sol fa mib re do sib la8._+ sib16
   
   %40
   sib sib' la sib sol sib fa sib mi,? sib' fa sib mi, sib' re, sib'
   dod, la' sol la fa la mi la re, la' mib la re, la' do,? la'\mbreak
   si, sol' fa sol mi sol re sol dod, sol' re sol dod, sol' sib,? sol'
   
   %43
   la, la' sol fa mi fa sol mi fa8 mi16-+ re dod re mi dod
   re mi fa sol la fa sol la \appoggiatura la sib4. do16 sib\mbreak
   la4~la16 do sib-+ la sol la fa sol mi8. re16
   
   %46
   re8 do16-+ sib la sib do la sib8 la16_+ sol fad sol la fad
   \appoggiatura fad sol8 sol si sol do sol re' sol,\mbreak
   mi'16 do sib? la sol la sib sol la8 sol16_+ fa mi! fa sol mi
   
   %49
   \appoggiatura mi fa8 fa la fa sib fa do' fa,
   re'16 sib do re mib fa sol la sib sib, sib' sib, sib' sib, sib' sib,\mbreak
   sib' mib, re do sib lab sol fa mib mib' mib, mib'  mib, mib' mib, mib'
   
   %52
   mib, la? sib do re mi! fad sol la la, la' la, la' la, la' la,
   la'8 re, do16-+ sib la sol\mbreak fad(re') re,(re') mi,(re') fad,(re')
   sol, (re') re,(re') do sib la sol fad(re') re,(re') mi,(re') fad,(re')
   
   %55
   sol,(re') la(re) sib(re) la(re) sol,(re') sib(re) la(re) sol,(re')\mbreak
   fad,8 re' fad re sol re la' re,
   sib' sib, sib' la16 -+ sol la8 la, la' sol16-+ fa
   
   %58
   sol8 sol, sol' la16 sol fad re la re fad re la re
   sol re sib re sol re sib re\mbreak la' fad do fad la fad do fad
   sol re sib re sol re sib re fad re la re fad re la re
   
   %61
   sol re sib re sol re sib re la' fad do fad la fad do fad\mbreak
   sol re sib re sol re sib re \stemUp <fad la, mib>8 r\fermata <sol dod, mi,>4
   <sol re re,>2 \stemNeutral fad4.-+ sol8
   
   %64
   sol1

}

Ifgn = \relative do {

   r16
   sol'4 la-+
   sib r
   do fad,-+
   <<sol2\\sol,>>
   \clef tenor \key fa\major sol''2\p
   fa
   mib-+
   re4 r\mbreak
   \clef bass \key fa\major r8 r16 sib, [re8. sib16]
   mib4 mib,
   r8 r16 do'[mi!8. do16]
   fa4 fa,
   re'8. re,16 mib'8. mib,16
   fa'8. fa,16 sol'8. la16
   \appoggiatura la8 sib8. mib,16 fa8. fa,16
   sib4 r
   R2*3
   r4 fa'8.\f sol16
   la4 la,
   re8.[re16 fad8. re16] re2

   %23
   R1*4
   \clef tenor \key fa\major r8 la' dod  la re la mi' la,
   fa' fa, fa' sol16 fa mi8 mi, mi' fa16 mi
   
   %29
   re8 re, re' mi16 re dod8 la si dod\mbreak
   \clef bass \key fa\major re re, fad re sol re la' re,
   sib' sib, sib' do16 sib la8 la, la' sib16 la
   
   %32
   sol8 sol, sol' la16 sol fad8 re mi! fad
   sol4 r r2\mbreak 
   r8 sol  sol, sol' fa, fa' fa, fa'
   
   %35
   mib, mib' mib, mib' re, re' re, re'
   do, do' do, do' sib, sib' sib, sib'
   fa'4 r fa'8 mib re do\mbreak
   
   %38
   sib4 r fa8 mib re do
   sib sib re sib sol' mib fa fa,
   sib4 r sol' r
   
   %41
   la r fad r
   sol r mi? r\mbreak
   fa8 fa, sol' sol, fa' fa, mi' mi,
   
   %44
   re' re' re16 do sib la sol8 la16 sib do sib la sol
   fa8 sib sib16 la sol fa mi8-+ re la' la, 
   re, re' fad re\mbreak sol re la' re,
   
   %47
   sib'16 sol fa? mib re mib fa re mib8 re16-+ do si do re si
   do8 do mi! do fa do sol' do,
   la'16 fa mib re do re mib do\mbreak re8 do16_+ sib la sib do la
   
   %50
   sib8 sib sib' sib, sib' re16 do sib la sol fa
   mib8 mib, mib' mib, mib' sol16 fa mib re do sib
   la8 la' la, la'\mbreak la, do16 sib la sol fad mi!
   
   %53
   re4 r re''8 do sib-+ la
   sol4 r re8 do sib_+ la
   sol4 r sol8 sol' fad sol
   
   %56
   re8 re, r4 r2
   r8 sol' sol, sol' fa,? fa'? fa, fa' 
   mib, mib' mib, mib' re, re' r4
   
   %59
   re,8 re' re, re' re, re' r4
   re,8 re' re, re' re, re' r4\mbreak
   re,8 re' re, re' re, re' r4
   
   %62
   re,8 re' re, re' do r8\fermata dod4
   re2 re,
   sol1

}

Ibcn = \relative do {

   r16
   sol'4 la-+
   sib r
   do fad,-+
   <<sol2\\sol,>>
   \clef tenor \key fa\major sol''2\p
   fa
   mib-+
   re4 r\mbreak
   \clef bass \key fa\major r8 r16 sib, [re8. sib16]
   mib4 mib,
   r8 r16 do'[mi!8. do16]
   fa4 fa,
   re'8. re,16 mib'8. mib,16
   fa'8. fa,16 sol'8. la16
   \appoggiatura la8 sib8. mib,16 fa8. fa,16
   sib4 r
   R2
   r4 r8 r16 sib'\p
   sib8.[(la16) la8.(sol16)]\mbreak
   sol4 fa8.\f sol16
   la4 la,
   re8.[re16 fad8. re16] re2

   %23
   R1*7
   r8 re fad re sol re la' re,
   sib' sib, sib' do16 sib la8 la, la' sib16 la
   
   %32
   sol8 sol, sol' la16 sol fad8 re mi! fad
   sol4 r r2\mbreak 
   r8 sol  sol, sol' fa, fa' fa, fa'
   
   %35
   mib, mib' mib, mib' re, re' re, re'
   do, do' do, do' sib, sib' sib, sib'
   fa'4 r fa'8 mib re do\mbreak
   
   %38
   sib4 r fa8 mib re do
   sib sib re sib sol' mib fa fa,
   sib4 r sol' r
   
   %41
   la r fad r
   sol r mi? r\mbreak
   fa8 fa, sol' sol, fa' fa, mi' mi,
   
   %44
   re' re' re16 do sib la sol8 la16 sib do sib la sol
   fa8 sib sib16 la sol fa mi8-+ re la' la, 
   re, re' fad re\mbreak sol re la' re,
   
   %47
   sib'16 sol fa? mib re mib fa re mib8 re16-+ do si do re si
   do8 do mi! do fa do sol' do,
   la'16 fa mib re do re mib do\mbreak re8 do16_+ sib la sib do la
   
   %50
   sib8 sib sib' sib, sib' re16 do sib la sol fa
   mib8 mib, mib' mib, mib' sol16 fa mib re do sib
   la8 la' la, la'\mbreak la, do16 sib la sol fad mi!
   
   %53
   re4 r re''8 do sib-+ la
   sol4 r re8 do sib_+ la
   sol4 r sol8 sol' fad sol
   
   %56
   <re re,>4 r r2
   r8 sol sol, sol' fa,? fa'? fa, fa'
   mib, mib' mib, mib' <re re,>4 r
   
   %59
   <re re,> <re re,> <re re,> r
   <re re,> <re re,> <re re,> r
   <re re,> <re re,> <re re,> r
   
   %62
   <re re,> <re re,> <do do,>8 r\fermata dod4
   re2 re,
   sol1
   
}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 2/4
   \key fa\major
   \once\override Score.RehearsalMark.extra-offset = #'(0 . -2.0)
   \mark\markup "Grave e staccato"
   \tempo 4 = 65
   \partial 16 s16
   \repeat volta 2 {s2*21}
   \alternative {{s2 }{s}}
   \set Score.currentBarNumber = #23
   \bar"||"\break
   \once\override Score.RehearsalMark.extra-offset = #'(0 . -2.0)
   \mark\markup "Allegro"
   \time 4/4
   \tempo 2 = 55
   s1*40
   \once\override Score.RehearsalMark.extra-offset = #'(-1 . +1.0)
   \mark\markup"Adagio"
   s1*2
   \bar "|."

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

Ifg = {
   \global
   \clef bass
   <<\Ifgn \forma>>

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

IIobn = \relative do'' {
   
   re,4 do
   re mi \appoggiatura mi16 fad4 sol
   fad_+ \appoggiatura mi16 re4 sol la
   si re \appoggiatura re16 do4. si8

   %4
   la2_+ si4 do\mbreak
   re mi \appoggiatura mi16 fad4 sol
   fad \appoggiatura mi16 re4 sol do

   %7
   si4.-+ la8 la4.-+ sol8
   sol2\fermata si,4 la
   si re do-+ si\mbreak

   %10
   la_+ sol do si
   la_+ sol fad_+ sol
   la2_+ re4 do

   %13
   si2-+ mi4 re
   dod-+ \appoggiatura si16 la4 la' sol
   fad-+ mi re dod\mbreak

   %16
   \appoggiatura dod16 re4 la la' sol
   fad-+ mi re dod
   \appoggiatura dod16 re4 la la' sol

   %19
   fad4.-+ mi8 mi4.-+ re8
   re2 sol,4 fad\mbreak
   sol si la_+ sol

   %22
   fad_+ mi la sol
   fad_+ mi red_+ mi
   fad2_+ si4 la

   %25
   sold_+ mi la si-+
   do \appoggiatura si16 la4 la sol?\mbreak
   fad_+ \appoggiatura mi16 re4 sol la_+
   
   %28
   si \appoggiatura la16 sol4 re' do
   si-+ la sol fad
   \appoggiatura fad16 sol4 re re' do
   
   %31
   si-+ la sol fad
   \appoggiatura fad16 sol4 re\mbreak re' do
   si re do4.-+ si8
   
   %34
   la2_+

}

IIvlIn = \relative do'' {

   si,4 do
   re mi \appoggiatura mi16 fad4 sol
   fad_+ \appoggiatura mi16 re4 sol la
   si re \appoggiatura re16 do4. si8

   %4
   la2_+ si4 do\mbreak
   re mi \appoggiatura mi16 fad4 sol
   fad \appoggiatura mi16 re4 sol do

   %7
   si4.-+ la8 la4.-+ sol8
   sol2\fermata si,4 la
   si re do-+ si\mbreak

   %10
   la_+ sol do si
   la_+ sol fad_+ sol
   la2_+ re4 do

   %13
   si2-+ mi4 re
   dod-+ \appoggiatura si16 la4 la' sol
   fad-+ mi re dod\mbreak

   %16
   \appoggiatura dod16 re4 la la' sol
   fad-+ mi re dod
   \appoggiatura dod16 re4 la la' sol

   %19
   fad4.-+ mi8 mi4.-+ re8
   re2 sol,4 fad\mbreak
   sol si la_+ sol

   %22
   fad_+ mi la sol
   fad_+ mi red_+ mi
   fad2_+ si4 la

   %25
   sold_+ mi la si-+
   do \appoggiatura si16 la4 la sol?\mbreak
   fad_+ \appoggiatura mi16 re4 sol la_+
   
   %28
   si \appoggiatura la16 sol4 re' do
   si-+ la sol fad
   \appoggiatura fad16 sol4 re re' do
   
   %31
   si-+ la sol fad
   \appoggiatura fad16 sol4 re\mbreak re' do
   si re do4.-+ si8
   
   %34
   la2_+

}

IIvlIIn = \relative do'' {
   
   sol8(sol,) la'(sol,) 
   si'(sol,) sol'(sol,) do'(sol,) si'(sol,)
   la'(re,) fad(re) re'(re,) do'(re,)
   si'(re,) la'(re,) sol(si) la(sol)
   
   %4
   fad(re) re'(re,) sol(sol,) la'(sol,)\mbreak
   si'(sol,) sol'(sol,) do'(sol,) si'(sol,)
   la'(re,) fad(re) re'(re,) la'(re,)
   
   %7
   re'4 sol8 la fad4.-+ sol8
   sol2 sol,8(re) fad(re)
   sol(re) si'(re,)\mbreak la'(re,) sol(re)
   
   %10
   fad(re) sol(re) la'(re,) si'(re,)
   fad(re) sol(re) la'(re,) si'(re,)
   fad(re) re'(re,) la'(re,) fad(re)
   
   %13
   re'(re,) sol(la) si(mi,) sol(mi)\mbreak
   mi'(mi,) la(mi) re'(la) dod(la)
   re(la) mi'(la,) la'(la,) sol'(la,)
   
   %16
   fad'(la,) mi'(la,) re(la) dod(la)
   re(la) mi'(la,) la'(la,) sol'(la,)
   fad'(la,) mi'(la,) re(la) dod(la)\mbreak
   
   %19
   re4. mi8 dod4.-+ re8
   re(re,) fad(re) mi(si) red(si)
   mi(si) sol'(si,) fad'(si,) mi(si)
   
   %22
   red(si) mi(si) fad'(si,) sol'(si,)\mbreak
   red(si) mi(si) fad'(si,) sol'(si,)
   red (fad) si(red) fad(si) red,(fad)
   
   %25
   si,(mi) sold,(si) mi,(mi') sold,(mi')
   la,(mi) la(do) mi(la) do,(mi)\mbreak
   la,(re) fad,(re') re,(re') fad,(re')
   
   %28
   sol,(sol,) re'(sol,) sol'(re) fad(re)
   sol(re) la'(re,) re'(re,) do'(re,)
   si'(re,) la'(re,) sol(re) fad(re)
   
   %31
   sol(re) la'(re,) re'(re,) do'(re,)\mbreak
   si'(re,) la'(re,) sol(re) fad(re)
   sol(re) si'(re,) la'(re,) sol(re)
   
   %34
   fad(re) re'(re,)
   
}

IIfgn = \relative do {
   
   sol'4 la
   si do(la-+) sol
   re' do(si-+) la
   sol fad mi do
   
   %4
   re re' sol, la
   si do(la-+) sol
   re' do(si-+) fad
   
   %7
   sol do, re re,
   sol2\fermopz sol'4 re
   sol, sol' fad-+ sol
   
   %10
   do si la-+ sol
   do, si la_+ sol
   re re' fad re
   
   %13
   sol, mi' sol mi
   la1
   \clef tenor \key sol\major la'4 sol fad-+ mi\mbreak
   
   %16
   re dod re mi
   la sol fad-+ mi
   re dod re la
   
   %19
   \clef bass \key sol\major si sol la la,
   re2 mi' 4si 
   mi, mi' red-+ mi
   
   %22
   la, sol fad-+ mi
   la, sol fad_+ mi
   si' si' red si
   
   %25
   mi re? do-+ si\mbreak
   la la, do' la
   re do si-+ la
   
   %28
   sol1
   re'4 do si-+ la
   sol fad sol la
   
   %31
   re do si-+ la
   sol fad sol re   
   sol, sol' fad-+ sol
   
   %34
   re2

}

IIbcn = \relative do {
   
   sol'4 do,
   sol' do(la-+) sol
   re' do(si-+) la
   sol fad mi do
   
   %4
   re re' sol, do,
   sol' do(la-+) sol
   re' do(si-+) fad
   
   %7
   sol do, re re,
   sol2\fermopz sol'4 re
   sol, sol' fad-+ sol
   
   %10
   do si la-+ sol
   do, si la_+ sol
   re re' fad re
   
   %13
   sol, mi' sol mi
   la1~
   la~
   
   %16
   la~
   la~\mbreak
   la2. la4
   
   %19
   si sol la la,
   re re, mi'' si 
   mi, mi' red-+ mi
   
   %22
   la, sol fad-+ mi
   la, sol fad_+ mi
   si' si' red si
   
   %25
   mi re? do-+ si\mbreak
   la la, do' la
   re do si-+ la
   
   %28
   sol1
   re~
   re~
   
   %31
   re~
   re2. re4
   sol, sol' fad-+ sol
   
   %34
   re2

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 2/2
   \override Staff.TimeSignature.style = #'single-digit
   \key sol\major
   \tempo 2 = 55
   \partial 2 s2
   s1*7
   s2
   \bar":..:"
   \mark\markup "Fine"
   s2
   s1*11
   s2
   \bar":|."
   \mark\markup "D.C."
   s2
   s1*13
   s2
   \bar"|."
   \mark\markup "D.C."

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

}IIfg = {
   \global
   \clef bass
   <<\IIfgn \forma>>

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

IIIobn = \relative do'' {
   
   sol'4. fad-+
   sol r4 r8 sol,4. re
   sol r4 r8 re''8\dolce sib re re la re
   re sib re re la re re,4. do-+\mbreak
   
   %4
   re8\f fad, sol la sib do re4 r8 r4 r8
   mib4 r8 r4 r8 re4 r8 r4 r8
   mib4 r8 r4 r8 do4 r8 r4 r8
   
   %7
   re4 r8 r4 r8 do4 r8 r4 r8\mbreak
   re4 r8 r4 r8 fa4 r8 r4 r8
   sol4 r8 r4 r8 sol4 r8 r4 r8
   
   %10
   la4 r8 r4 r8 fa4 r8 r4 r8
   sol4 r8 r4 r8 la4 r8 r4 r8
   sib4 r8 r4 r8 fa4 r8 r4 r8
   
   %13
   la,4 fa8 sib2. la4._+
   sib r4 r8 sib\dolce sib' sib, sib sib' sib,
   sib4. \parenthesize -+ r4 r8 sib  sib' sib, sib sib' sib,
   
   %16
   sib4.-+ r4 r8\mbreak la4\f fa8 sib4 fa8
   la4 mib'8 re do sib sib4. la_+
   sib r4 r8 sib'4. la-+
   
   %19  %%OOKK
   sib r4 r8 sib,4. \dolce fa
   sib r4 r8\mbreak do'4.\f si
   do r4 r8 do,4.\dolce sol
   
   %22
   do r4 r8 re'4.\f dod-+
   re r4 r8 re,4.\dolce la
   re, r4 r8 la''8\f fa la la mi la\mbreak
   
   %25
   la fa la la mi la la4. sol-+
   la r4 r8 re4 la8 fad4 re8
   re'4 re,8 sib'4 sib,8 do'4 sol8 mi4 do8
   
   %28
   do'4 do,8 fa4 fa,8\mbreak sib'4 fa8 re4 sib8
   sib'4 sib,8 mi4 mi,8 la'4 mi8 dod4 la8
   la'\dolce sol-+ fa mi fa mi fa sol fa mi fa mi
   
   %31
   re mi re do re do re mi re do re do\mbreak
   sib do sib la sib la sib do sib la sib la
   sol4. fa8\f mi re re4. sol
   
   %34
   fad4_+ r8 la'2.~la4.
   sib1.
   do
   
   %37
   la
   sib~
   sib
   
   %40
   la~
   la
   sol
   
   %43
   la
   re,,8 la' re fad sol la re,4 r8 r4 r8
   mib4 r8 r4 r8 fad4 r8 r4 r8\mbreak
   
   %46
   sol4 r8 r4 r8 re4 r8 r4 r8
   fad,4 re8 sol2. fad4._+
   sol r4 r8 sol\f sol' sol, sol sol' sol,
   
   %49
   sol4._+ r4 r8 sol\dolce sol' sol, sol sol' sol,
   sol4._+ r4 r8\mbreak fad4\f re8 sol4 re8
   fad4 do'8 sib la sol sol4. fad_+
   
   %52
   sol\fermata r4 r8

}

IIIvlIn = \relative do'' {
   
   sol'4. fad-+
   sol r4 r8 sol,4. re
   sol, r4 r8 re'''8\dolce sib re re la re
   re sib re re la re re,4. do-+\mbreak
   
   %4
   re8\f fad, sol la sib do re4 r8 si,4 r8
   mib'4 r8 do,4 r8 re'4 r8 si,4 r8
   mib'4 r8 do,4 r8 do'4 r8 la,4 r8
   
   %7
   re'4 r8 sib,?4 r8 do'4 r8 la,4 r8\mbreak
   re'4 r8 sib,4 r8 fa''4 r8 re,4 r8
   sol'4 r8 mib,4 r8 sol'4 r8 mi,4 r8
   
   %10
   la'4 r8 fa,4 r8 fa'4 r8 re,4 r8
   sol'4 r8 mib,4 r8 la'4 r8 fa,4 r8
   sib'4 r8 sol,4 r8\mbreak fa'4 r8 re,4 r8
   
   %13
   la'4 fa8 sib2. la4._+
   sib r4 r8 sib\dolce sib' sib, sib sib' sib,
   sib4.\parenthesize -+ r4 r8 sib sib' sib, sib sib' sib,
   
   %16
   sib4.-+ r4 r8\mbreak la4\f fa8 sib4 fa8
   la4 mib'8 re do sib sib4. la_+
   sib r4 r8 sib'4. la-+
   
   %19
   sib r4 r8 sib,4. \dolce fa
   sib, r4 r8\mbreak do''4.\f si
   do r4 r8 do,4.\dolce sol
   
   %22
   do, r4 r8 re''4.\f dod-+
   re r4 r8 re,4.\dolce la
   re, r4 r8 la''8\f fa la la mi la\mbreak
   
   %25
   la fa la la mi la la4. sol-+
   la r4 r8 re4 la8 fad4 re,8
   re''4 re,8 sib'4 sib,8 do'4 sol8 mi4 do,8
   
   %28
   do''4 do,8 fa4 fa,8\mbreak sib'4 fa8 re4 sib,8
   sib''4 sib,8 mi4 mi,8 la'4 mi8 dod4 la,8
   la''\dolce sol-+ fa mi fa mi fa sol fa mi fa mi
   
   %31
   re mi re do re do re mi re do re do\mbreak
   sib do sib la sib la sib do sib la sib la
   sol4. fa8\f mi re re4. dod_+
   
   %34
   re8 fad la re la re re, fad la re la re
   re, sol sib re sib re\mbreak re, sol sib re sib re
   mib, sol do mib do mib mib, sol do mib do mib
   
   %37
   fa, la  do mib do mib fa, la do mib do mib
   re, fa sib re sib re re, fa sib re sib re\mbreak
   mib, sol sib re sib re mib, sol sib re sib re 
   
   %40
   do, mib la do la do do, mib la do la do
   re, fad la do la do re, fad la do la do
   sib, re sol sib sol sib\mbreak sib, re sol sib sol sib
   
   %43
   do, mib sol do sol do do, mib sol do sol do
   fad, la re fad sol la re,4 r8 sib,4 r8
   mib'4 r8 do,4 r8 fad'4 r8 re,4 r8\mbreak
   
   %46
   sol'4 r8 mib,4 r8 re'4 r8 sib,4 r8
   fad'4 re8 sol2. fad4._+
   sol r4 r8 sol\f sol' sol, sol sol' sol,
   
   %49
   sol4._+ r4 r8 sol\dolce sol' sol, sol sol' sol,
   sol4._+ r4 r8\mbreak fad4\f re8 sol4 re8
   fad4 do'8 sib la sol sol4. fad_+
   
   %52
   sol\fermata r4 r8
  
}

IIIvlIIn = \relative do'' {
   
   sib8 re, sib' la re, la'
   sib sol re sib re sol sib re sib la re la
   sib re sol sib sol re sib\dolce re sib la re la\mbreak
   sib re sib la re la sol la sib la sib sol
   
   %4
   fad4._+ r4 r8 sol\f si re sol, si re
   sol, mib do sol' mib do sol' si re sol, si re
   sol, mib do sol' mib do\mbreak fa la do fa, la do
   
   %7
   fa, re sib fa' re sib fa' la do fa, la do
   fa, re sib fa' re sib sib' re fa sib, re fa
   sib, sol mib sib' sol mib do' mi! sol do, mi sol\mbreak
   
   %10
   do, la fa do' la fa sib la sib sib la sib
   sib la sib sib la sib sib la sib sib la sib
   sib la sib sib la sib sib la sib sib la sib
   
   %13
   mib re do re do sib re4. do-+\mbreak
   sib8 sib' sib, sib sib' sib, sib4. r4 r8
   sib8\dolce sib' sib, sib sib' sib, sib4. r4 r8
   
   %16
   sol'\f sib sol fa sib fa mib sib' mib, re sib' re,
   do la fa sib4 mib8 re4. do-+
   sib r4 r8 re8 fa, re' do fa, do'
   
   %19
   re sib fa re fa sib re\dolce fa re do fa do
   re sib fa re sib sib mib'\f sol, mib' re sol, re'\mbreak
   mib do sol mib sol do mib\dolce sol mib re sol re
   
   %22
   mib do sol mib do do fa'\f la, fa' mi la, mi'
   fa re la fa la re fa\dolce la fa mi la mi\mbreak
   fa re la fa re re fa'\f la fa mi la mi
   
   %25
   fa la fa mi la mi re mi fa mi fa re
   dod4.-+ r4 r8 la' fad re re fad la
   sol, sib re re sib sol\mbreak sol' mi do do mi sol
   
   %28
   fa, la do do la fa fa' re sib sib re fa
   mi, sol sib sib sol mi mi' dod la la dod mi
   re do sib la'\dolce sib la sib do? sib la sib la\mbreak
   
   %31
   sol la sol fa sol fa sol la sol fa sol fa
   mi fa mi re mi re mi fa mi re mi re
   dod si-+ la re4 sol8 fa4. mi-+
   
   %34
   re8 la fad re fad la\mbreak re la fad re fad la
   re sib sol re sol sib re sib sol re sol sib
   mib do sol mib sol do mib do sol mib sol do
   
   %37
   mib do la fa la do\mbreak mib do la fa la do
   re sib fa re fa sib re sib fa re fa sib
   re sib sol mib sol sib re sib sol mib sol sib
   
   %40
   do sol mib do mib sol\mbreak do sol mib do mib sol
   do la fad re fad la do la fad re fad la
   sib sol re sib re sol sib sol re sib re sol
   
   %43
   sib sol mib do mib sol\mbreak sib sol mib do mib sol
   la fad re re mi! fad sol fad sol sol fad sol
   sol fad sol sol fad sol sol fad sol sol fad sol
   
   %46
   sol fad sol sol fad sol\mbreak sol fad sol sol fad sol
   do sib la sib la sol sib4. la-+
   sol8 sol' sol, sol sol' sol, sol4. r4 r8
   
   %49
   sol8\dolce sol' sol, sol sol' sol, sol4. r4 r8\mbreak
   mib'\f sol mib re sol re do sol' do, sib sol' sib,
   la fad re sol4 do8 sib4. la_+
   
   %52
   sol4.\fermata r4 r8
 
}

IIIfgn = \relative do {
   
   sol'4 r8 re4 r8
   sol4. r4 r8 \clef tenor \key fa\major sol'4. fad-+
   sol r4 r8 sol4.\dolce fad-+
   sol fa! mib mib-+\mbreak
   
   %4
   \clef bass \key fa\major re8\f mib re do re do si4-+ r8 fa'?4 r8
   do4 r8 mib4 r8 si4 r8 fa'4 r8
   do4 r8 mib4 r8 la,4 r8 mib'4 r8\mbreak
   
   %7
   sib4 r8 re4 r8 la4 r8 mib'4 r8
   sib4 r8 re4 r8 re,4 r8 lab'4 r8
   mib4 r8 sol4 r8 mi4 r8 sib'4 r8
   
   %10
   fa4 r8 la4 r8 re,4 r8 fa4 r8\mbreak
   mib4 r8 sol4 r8 fa4 r8 la4 r8
   sol4 r8 sib4 r8 re,4 r8 fa4 r8
   
   %13
   do4. -+ sib fa' fa,
   sib' la sol fa
   sol\dolce fa mib re
   
   %16
   mib\f re do sib\mbreak
   fa' sol mib fa
   sib, r4 r8 sib'4 r8 fa4 r8   
   
   %19
   sib4. r4 r8 sib4.\dolce la-+
   sib r4 r8 do4\f r8 sol4 r8
   do,4. r4 r8 do'4.\dolce si-+
   
   %22
   do r4 r8 re4\f r8 la4 r8
   re,4 r8 r4 r8 re'4.\dolce dod-+
   re r4 r8 re4.\f dod
   
   %25
   re do! sib sib-+
   la8 sib la sol la sol fad4-+ r8 do'4 r8
   sib4 r8 sol4 r8 mi4 r8 sib'4 r8
   
   %28
   la4 r8 fa4 r8 re4 r8 la'4 r8
   sol4 r8 mi4 r8 dod4 r8 la4 r8
   re'4\dolce r8 dod4 r8 re4 r8 do4 r8
   
   %31
   sib4 r8 la4 r8 sib4 r8 la4 r8\mbreak
   sol4 r8 fa4 r8 sol4 r8 fa4 r8
   la2. \f la
   
   %34
   la4 r8 fad4 r8 la4 r8 fad4 r8
   sol,4 r8 sol'4 r8 sib4 r8 sol4 r8
   do,4 r8 sol'4 r8\mbreak do4 r8 sol4 r8
   
   %37
   fa,4 r8 la'4 r8 do4 r8 la4 r8
   sib,4 r8 fa'4 r8 sib4 r8 fa4 r8
   mib,4 r8 sol'4 r8 sib4 r8 sol4 r8
   
   %40
   la,4 r8 mib'4 r8 la4 r8 mib4 r8
   re,4 r8 fad'4 r8 la4 r8 fad4 r8
   sol,4 r8 re'4 r8 sol4 r8 re4 r8
   
   %43
   do,4 r8 mib'4 r8 sol4 r8 mib4 r8
   re4. do sib4 r8 re4 r8
   do4 r8 mib4 r8 re4 r8 fad4 r8
   
   %46
   mib4 r8 sol4 r8 sib,4 r8 re4 r8
   la4._+ sol re' re,
   sol'\f fa? mib re\mbreak
   
   %49
   mib\dolce re do sib
   do\f sib la sol
   re' mib do re
   
   %52
   sol,\fermata r4 r8 

}

IIIbcn = \relative do {
   
   sol'4 r8 re4 r8
   sol4. r4 r8 r2.
   \clef tenor \key fa\major r sol'4.\dolce fad-+
   sol fa! mib mib-+\mbreak
   
   %4
   \clef bass \key fa\major re8\f mib re do re do si4-+ r8 r4 r8
   do4 r8 r4 r8 si4 r8 r4 r8
   do4 r8 r4 r8  la4 r8 r4 r8
   
   %7
   sib4 r8 r4 r8  la4 r8 r4 r8\mbreak
   sib4 r8 r4 r8  re,4 r8 r4 r8
   mib4 r8 r4 r8  mi4 r8 r4 r8
   
   %10
   fa4 r8 r4 r8  re4 r8 r4 r8
   mib4 r8 r4 r8  fa4 r8 r4 r8\mbreak
   sol4 r8 r4 r8  re4 r8 r4 r8
   
   %13
   do4. -+ sib fa' fa,
   sib' la sol fa
   sol\dolce fa mib re
   
   %16
   mib\f re do sib\mbreak
   fa' sol mib fa
   sib, r4 r8 sib'4 r8 fa4 r8
   
   %19
   sib4. r4 r8 r2.
   r do4\f r8 sol4 r8
   do,4. r4 r8 r2.\mbreak
   
   %22
   r re'4\f r8 la4 r8
   re,4 r8 r4 r8 r2.
   r re'4.\f dod
   
   %25
   re do! sib sib-+
   la8 sib la sol la sol fad4-+ r8 r4 r8
   r4 r8 sol4 r8\mbreak mi4 r8 r4 r8
   
   %28
   r4 r8 fa4 r8 re4 r8 r4 r8
   r4 r8 mi4 r8 dod4 r8 la4 r8
   re'4\dolce r8 dod4 r8 re4 r8 do4 r8
   
   %31
   sib4 r8 la4 r8 sib4 r8 la4 r8\mbreak
   sol4 r8 fa4 r8 sol4 r8 fa4 r8
   mi4. re la'\f la,
   
   %34
   re4 r8 r4 r8 r2.
   sol,4 r8 r4 r8 r2.
   do4 r8 r4 r8 r2.
   
   %37
   fa,4 r8 r4 r8 r2.\mbreak
   sib4 r8 r4 r8 r2.
   mib,4 r8 r4 r8 r2.
   
   %40
   la4 r8 r4 r8 r2.
   re,4 r8 r4 r8 r2.
   sol4 r8 r4 r8 r2.
   
   %43
   do,4 r8 r4 r8 r2.\mbreak
   re'4. do sib4 r8 r4 r8
   do4 r8 r4 r8 re4 r8 r4 r8
   
   %46
   mib4 r8 r4 r8 sib4 r8 r4 r8
   la4._+ sol re' re,
   sol'\f fa? mib re\mbreak
   
   %49
   mib\dolce re do sib
   do\f sib la sol
   re' mib do re
   
   %52
   sol,\fermata r4 r8 
 
}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 12/8
    \key fa\major
    \tempo 2. = 60
    \partial 2. s2.
    s1.*17
    s2.
    \bar":..:"\break
    s2.
    s1.*33
    s2.
    \bar":|."
    
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

}IIIfg = {
    \global
    \clef bass
    <<\IIIfgn \forma>>

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
   
   r8 do, re mi fa sol la sib
   do fa, sol la sib do re mi
   fa-+ mi fa sol fa-+ mi fa sol
   
   %4
   fa-+ mi fa sol fa-+ mi fa sol\mbreak
   fa-+ mi fa sol mi-+ re mi do
   fa4 mi8-+ re do sib la sol
   
   %7
   fa4 la do mib
   re-+ fa, re sib
   sol' si re fa
   
   %10
   mi?-+ sol, mi do
   do' mi sol sib
   la-+ fa fa, la'\mbreak
   
   %13
   sol-+ mi do, sol''
   fa-+ re sol,, fa''
   mi-+ do do, do'
   
   %16
   si8 sol' do, sol' re sol do, sol'
   si, sol' do, sol' re sol do, sol'
   si, sol' fa mi re do si-+ la
   
   %19
   sol do si la sol fa mi_+ re\mbreak
   do fa mi_+ re re4._+ do8
   <do' sol do,>1
   
   %22
   r8 sol, la si do re mi fa
   sol do, re mi fa sol la si
   do-+ si do re do-+ si do re
   
   %25
   do-+ si do re\mbreak do-+ si do re
   do-+ si do re si-+ la si sol
   do4 si8-+ la sol fa mi re
   
   %28
   do4 mi sol sib?
   la_+ do la fa
   re fad la do
   
   %31
   si-+ re, si sol\mbreak
   mi' sold si re
   do-+ la do mi
   
   %34
   fa8 fa, re fa fa' fa, re fa
   mi' mi, do mi mi' mi, do mi
   re mi fa mi re do si la
   
   %37
   sold4-+ mi''2 re4\mbreak
   do4.-+ si8 si4. -+ la8
   <la mi do>2 r
   
   %40
   r8 do, re mi fa sol la sib!
   do fa, sol la sib do re mi
   fa-+ mi fa sol fa-+ mi fa sol
   
   %43
   fa-+ mi fa sol fa-+ mi fa sol\mbreak
   fa-+ mi fa sol mi-+ re mi do
   fa4 mi8-+ re do sib la sol
   
   %46
   fa4 la do mib
   re-+ fa, re sib
   sol' si re fa
   
   %49
   mi?-+ sol, mi do
   do' mi sol sib
   la-+ fa fa, la'\mbreak
   
   %52
   sol-+ mi do, sol''
   fa-+ re sol,, fa'
   mi8 do' fa, do' sol do fa, do'
   
   %55
   mi, do' fa, do' sol do fa, do'
   mi, do' sib la sol fa mi_+ re\mbreak
   do fa mi re do sib la sol
   
   %58
   fa' sib la_+ sol sol4._+ fa8
   <la fa do>1
 
}

IVvlIIn = \relative do'' {
   
   fa4 fa, r fa'8 mi
   fa4 fa, r8 sib la sol
   fa4 fa' sib, sib,
   
   %4
   fa' fa' sib, sib,
   fa' fa' do, do'
   fa,2 r4 la8 sib\mbreak
   
   %7
   do sib la sol fa sol la4
   sib, re'2 re4~
   re8 do si la sol la si4
   
   %10
   do, sol''2 sol4~
   sol8 fa mi re do re mi4
   fa, la'2 fa,4
   
   %13
   do sol''2 do,,4
   sol fa''2 sol,,4
   do mi'2 do,4\mbreak
   
   %16
   sol' do si-+ do
   sol do, si_+ do
   sol sol'8 la si do re si
   
   %19
   do mi sol fa mi re do si
   la si do re si4.-+ do8
   <do sol do,>1
   
   %22
   do4 do, r do'8 si\mbreak
   do4 do, r8 fa mi re
   do4 do' fa, fa'
   
   %25
   do, do' fa, fa'
   do, do' sol, sol'
   do,2 r4 mi'8 fa
   
   %28
   sol fa mi re do re mi4
   fa, la'2 la4~
   la8 sol fad mi\mbreak re mi fad4
   sol, si'2 si4~
   si8 la sold fad mi fad sold4
   
   %33
   la,4 do mi la
   la, la, r la'8 sold
   la4 la, r la''8 sol?
   
   %36
   fa mi re do si la sold la
   mi(sold si) mi\mbreak sold la si sold
   la4. si8 sold4.-+ la8
   
   %39
   la2 r8 do, re mi
   fa4 fa, r fa'8 mi
   fa4 fa, r8 sib la sol
   
   %42
   fa4 fa' sib, sib,
   fa' fa' sib, sib,
   fa' fa' do, do'
   
   %45
   fa,2 r4 la8 sib\mbreak
   do sib la sol fa sol la4
   sib, re'2 re4~
   
   %48
   re8 do si la sol la si4
   do, sol''2 sol4~
   sol8 fa mi re do re mi4
   
   %51
   fa, la'2 fa,4
   do sol''2 do,,4
   sol fa''2 sol,,4
   
   %54
   do fa mi_+ fa
   do' fa, mi_+ fa
   do do8 re mi fa sol mi
   
   %57
   fa la do sib la sol fa mi
   re mi fa sol mi4._+ fa8
   <la fa do>1
   
}

IVfgn = \relative do {
   
   fa1
   fa
   la4 r sib r
   
   %4
   la r sib r
   la r sol r
   la sol8-+ fa mi re do sib\mbreak
   
   %7
   la do fa do la do fa do
   sib fa' sib fa sib, fa' sib fa
   si, re sol re si re sol re
   
   %10
   do sol' do sol do, sol' do sol
   mi sol do sol mi sol do sol\mbreak
   fa la do la fa la do la
   
   %13
   mi sol do sol mi sol do sol
   re fa si fa re fa si fa
   do mi sol mi do mi sol mi
   
   %16
   re' sol, mi' sol, fa' sol, mi' sol,\mbreak
   re' sol, mi' sol, fa' sol, mi' sol,
   re'2 sol,
   
   %19
   mi1
   fa2 sol
   do,1
   
   %22
   do
   do
   mi'4 r fa r
   
   %25
   mi r fa r\mbreak
   mi r re r
   mi re8-+ do si la sol fa
   
   %28
   mi sol do sol mi sol do sol
   fa do' fa do fa, do' fa do
   fad, la re la fad la re la\mbreak
   
   %31
   sol re' sol re sol, re' sol re
   sold, si mi si sold si mi si
   la do mi do la mi do la
   
   %34
   re, re' fa re re, re' fa re\mbreak
   do, do' mi do do, do' mi do
   si do re mi fa mi re fa
   
   %37
   mi4 sold si mi
   la, re, mi mi,
   la la'8 sib! do sib la sol
   
   %40
   fa1
   fa
   la4 r sib r
   
   %43
   la r sib r
   la r sol r
   la sol8-+ fa mi re do sib\mbreak
   
   %46
   la do fa do la do fa do
   sib fa' sib fa sib, fa' sib fa
   si, re sol re si re sol re
   
   %49
   do sol' do sol do, sol' do sol
   mi sol do sol mi sol do sol\mbreak
   fa la do la fa la do la
   
   %52
   mi sol do sol mi sol do sol
   re fa si fa re fa si fa
   sol do, la' do, sib'? do, la' do,
   
   %55
   sol' do, la' do, sib' do, la' do,
   sol'2 do,
   la1
   
   %58
   sib2 do
   fa,1
   
}

IVbcn = \relative do {
   
   fa1
   fa
   do4 r re r
   
   %4
   do r re r
   do r sib r
   la r r2
   
   %7
   la4 la la la\mbreak
   sib sib sib sib
   si si si si
   
   %10
   do do do do
   mi mi mi mi
   fa fa fa fa
   
   %13
   mi mi mi mi
   re re re re
   do do do do
   
   %16
   re' mi fa mi\mbreak
   re mi fa mi
   re2 sol,
   
   %19
   mi1
   fa2 sol 
   do,1
   
   %22
   do
   do
   sol'4 r la r
   
   %25
   sol r la r
   sol r fa r\mbreak
   mi r r2
   
   %28
   mi4 mi mi mi
   fa fa fa fa
   fad fad fad fad
   
   %31
   sol sol sol sol
   sold sold sold sold
   la8 do mi do la mi do la
   
   %34
   re,4 r re r\mbreak
   do r do r
   si'8 do re mi fa mi re fa
   
   %37
   mi1
   la4 re, mi mi,
   la la'8 sib? do sib la sol
   
   %40
   fa1
   fa
   do4 r re r\mbreak
   
   %43
   do r re r
   do r sib r
   la r r2
   
   %46
   la4 la la la
   sib sib sib sib
   si si si si
   
   %49
   do do do do
   mi mi mi mi
   fa fa fa fa\mbreak
   
   %52
   mi mi mi mi
   re re re re
   sol la sib la
   
   %55
   sol la sib la
   sol2 do,
   la1
   
   %58
   sib2 do
   fa,1
   
}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 1 = 55
    s1*21
    \bar ":..:"\break
    s1*38
    \bar":|."

}

IVvlI = {
    \global
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}IVfg = {
    \global
    \clef bass
    <<\IVfgn \forma>>

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

VvlIIn = \relative do'' {

   \time 12/8
   \tempo 2. = 40
   do4 \parentSlur (fa8) mi(fa re)
   do(re sib) la(sib sol) fa(sol la) sib(do la)
   sol( mi do) fa(la fa) fa'(sol mi) fa(la do,)\mbreak
   fa(sol mi) fa(la do) do,(re do) sib(do la)

   %4
   sol-.(do-. re-.) mi-.(fa-. sol-.) do,4(fa8) mi(fa re)
   do(re sib) la(sib sol) fa(sol la) sib(do la)
   sol(do la) sib(sib' la) \mbreak sol16(la sol fa mi re) do(re do sib la sol)

   %7
   fa8(la sib) do(re fa,) mi(sol la) sib(sol do)
   la\fermata do16 sib la sol fa8 fa16 sol la sib do8(fa la) mi(sol do,)
   fa(mi re) do16 re do sib la sol\mbreak fa8 (la sib) do( mi fa)

   %10
   sol,(mi' fa) sol(la sib) mi,(fa sol) sol16 (la sol fa mi re)
   do8(la fa) mi(fa sol) do,(fa sol) la(sol fa)
   mi_! do'(re) mi-! mi(fa) sol-! sol(la) sib16(la sol fa mi re)

   %13
   do8(la sib-+) do(fa sol-+) la(fa sol-+) la16(sib la sol fa mi)
   re8-! si,(re) sol, (sol' si) re(sol si) sol(re si)
   sol(si re) sol (sol, sol') fa(sol, fa')  mi(sol, mi')

   %16
   re(sol, re') mi(sol, mi') fa(si re) fa,16(mi re do si la)\mbreak
   sol8(la si) do-+(si do) do(re do) si(re sol)
   mi sol,16(fa mi re) \once\stemUp do8 mi'16 (fa sol8) do,4(fa8) mi fa re

   %19
   la8_! do16(sib la sol) fa8_! la16(sol fa mi) re8(fa la) re(fa la)
   dod,,(mi sol) sib(mi sol)\mbreak la,,\parentSlur (dod mi) la(dod mi)
   re,(fa la) re(fa la) re(la sol) fa(mi re)

   %22
   sib'16(la sol la sib sol) la( sol fa sol la fa) sol(fa mi fa sol mi) fa(la sol fa mi re)
   dod(re mi re dod si) la8(si dod)\mbreak re(fa sol) la(la, re)
   dod(sol' la) sib?(dod, mi) re(fa sol) la(sol fa)

   %25
   mi-! sol16(fa mi re) dod8-! mi16(re dod si?) la8(sib la) sol(la fa)
   mi(la la,) re(re' sib') dod, (mi, fa) sol_! la16(sol fa mi)\mbreak
   fa8_! fa(sol) la_! la(sib) do?-! sib16(la sol fa) mi8_! sol16(fa mi re)

   %28
   do8(fa la) mi(sol do) fa,(do' fa) re(fa sib)
   sol-! sib16(la sol fa) mi8(do mi) fa16(la sol fa mi re) do(re do sib la sol)
   fa8_! sib16(la sib do) re(mib re do sib la) sol(do, sib do) sol' (do,) la'(do, sib do) la'(do,)

   %31
   mi(fa sol fa mi re) \once\stemUp do8 mi'16(fa sol8) do,4(fa8) mi(fa re)

}

VvlIn = \relative do'' {

\tempo 2. = 40
\time 12/8
\set Staff.timeSignatureFraction = 2/2\override Staff.TimeSignature.style = #'single-digit
\scaleDurations 3/2
{
   la4 sol8-+ fa
   sol4 do do, fa
   mi_+ fa sib(la)
   re(do) fa4. sol8

   %4
   mi4-+ \grace re16 do4 \grace sib16 la4 sol8-+ fa\mbreak
   sol4 do do, fa
   mi_+ fa \grace {sol16[la]} sib4(la)

   %7
   re8 [do fa sib] sol4. fa8
   fa2\fermata la,4 sib-+
   do sol la \grace sol16 fa4\mbreak

   %10
   mi_+ \grace re16 do4 sol'  \grace fa16 mi4
   fa \senza\terzinequarto \tuplet 3/2 { sol8(la sib)} la4._+ sib8
   sol2_+ do4 sol

   %13
   la_+ \grace sol16 fa4 re' la
   si-+ \grace la16 sol4 sol' re\mbreak

   %15
   fa mi \appoggiatura mi8 re4-+ do
   si-+ do re sol
   mi4.-+ re8 re4.-+ do8

   %18
   do2  \appoggiatura sib 16 la4 sol8_+ fa
   fa'2 la,4. re,8
   sib'4 mi, la4. sol8

   %21
   fa4_+ \appoggiatura mi16 re4 la' re
   dod-+ re \appoggiatura re16 mi4. fa8
   mi2-+ la4(re,)

   %24
   sib'(mi,) la(re,)\mbreak
   dod4-+ \appoggiatura sib16 la4 re mi8 fa
   \appoggiatura fa16 sol4 fa8-+ mi mi4.\parenthesize -+ re8

   %27
   re2 fa4 do
   la_+ sol do fa,
   mi \grace re16 do4 do' fa\mbreak

   %30
   re-+ sol mi4.-+ fa8
   \appoggiatura fa16 sol4 do, \appoggiatura sib16 la4 sol8_+ fa

}

}

Vfgn = \relative do {
\tempo 2. = 40
\time 12/8
\set Staff.timeSignatureFraction = 2/2\override Staff.TimeSignature.style = #'single-digit
\scaleDurations 3/2
{
    fa8 [la do fa,]
    mi [do' fa, do'] la, [fa' sib, fa']
    do[mi la, fa'] re[fa do fa]
    sib,[fa' la, fa'] la,4 sol8_+ fa

    %4
    do'[mi sol do] \mbreak fa,[la do fa,]
    mi[do' fa, do'] la, [fa' sib, fa']
    do[do' re, do'] mi,[do' fa, do']

    %7
    sib, [fa' la, sib] do[sib do do,]
    fa\fermata [fa la do] fa[do' sol do]
    la[do mi, do'] fa,[do la fa]

    %10
    do8[do' mi sol] do[do, sib' do,]
    la'[do, sol' do,] fa[mi fa sib,]
    do[sol' do sol] mi[sol mi do]

    %13
    fa[do la fa] fa'[la fa re]
    sol[re si sol] si'8[re si sol]
    si,[sol' do, sol'] re [sol mi sol]\mbreak

    %16
    fa[sol mi sol] re[sol si, sol']
    do,[re mi fa] sol[fa sol sol,]
    do[re mi do] fa[la do fa,]

    %19
    fa,2\fermata re'8[re' fa, re]
    sol[sib sol mi] dod[la' la, la']\mbreak
    re,[fa la re] fa[re la fa]

    %22
    sol[mi' fa, re'] mi,[dod' re, re']
    la[sol fa mi] fa[re' fa, re]
    sol[sib sol mi] fa[re' fa, re]

    %25
    la'[mi' sol, dod] fa,[la mi re]
    dod[la sib? sol] la[sol la la']\mbreak
    re,[re' do? sib] la[fa' sol, mi']

    %28
    fa,[do' do, do'] la,[fa' sib, fa']
    do[mi sol do] la[fa' la, fa]
    sib[sol' sib, sol] do [do, fa fa,]

    %31
    do'[re mi do] fa[la do fa,]

}

}

Vbcn = \relative do {

\tempo 2. = 40
\time 12/8
\set Staff.timeSignatureFraction = 2/2\override Staff.TimeSignature.style = #'single-digit
\scaleDurations 3/2
{
    fa8 [la do fa,]
    mi [do' fa, do'] la, [fa' sib, fa']
    do[mi la, fa'] re[fa do fa]
    sib,[fa' la, fa'] la,4 sol8_+ fa

    %4
    do2 fa'8[la do fa,]\mbreak
    mi[do' fa, do'] la, [fa' sib, fa']
    do[do' re, do'] mi,[do' fa, do']

    %7
    sib, [fa' la, sib] do[sib do do,]
    fa\fermata [fa la do] fa[do' sol do]
    la[do mi, do'] fa,4 fa,\mbreak

    %10
    do8[do' mi sol] do[do, sib' do,]
    la'[do, sol' do,] fa[mi fa sib,]
    do[sol' do sol] mi[sol mi do]

    %13
    fa2 fa8[la fa re]
    sol2 si8[re si sol]
    si,[sol' do, sol'] re [sol mi sol]\mbreak

    %16
    fa[sol mi sol] re[sol si, sol']
    do,[re mi fa] sol[fa sol sol,]
    do[re mi do] fa[la do fa,]

    %19
    fa,2\fermata re'8[re' fa, re]
    sol[sib sol mi] dod[la' la, la']\mbreak
    re,2 fa'8[re la fa]

    %22
    sol[mi' fa, re'] mi,[dod' re, re']
    la[sol fa mi] fa[re' fa, re]
    sol[sib sol mi] fa[re' fa, re]

    %25
    la'[mi' sol, dod] fa,[la mi re]
    dod[la sib? sol] la[sol la la']\mbreak
    re,[re' do? sib] la[fa' sol, mi']

    %28
    fa,[do' do, do'] la,[fa' sib, fa']
    do2 la'8[fa' la, fa]
    sib[sol' sib, sol] do [do, fa fa,]

    %31
    do'[re mi do] fa[la do fa,]

}

}

Vbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key fa\major
   \time 12/8
   \partial 2.  s2.
   \mark\markup {\segno}
   s1.*7
   \once \override Score.RehearsalMark.extra-offset = #'(+25  . -1.5) \mark\markup "Fine"
   s2.

   \bar ":|."
   s2.
   s1.*10
   \once \override Score.RehearsalMark.extra-offset = #'(0  . 0)
   \bar "||"
   \mark\markup \smaller\center-column{"Dal""Segno"}
   s1.*13
   \bar"||"
   \mark\markup \smaller\center-column{"Dal""Segno"}

}

VvlI = {
   \global
   <<\VvlIn \forma>>

}

VvlII = {
   \global
   <<\VvlIIn\forma>>

}

Vfg = {
   \global
   \clef bass
   <<\Vfgn \forma>>

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

    r2. <<
        {
            fa8 \parentSlur (fa fa) do(do do)
            la4.
        }\\{
            do8(do do) la\parentSlur ( la la)
            fa4.
        }
    >> r4 r8 <<
        {
            la'\parenthesize (la la) la\parenthesize (la la)
            sol\parenthesize (sol sol) sol\parenthesize (sol sol)\mbreak sol (sol sol) sol\parenthesize (sol sol)

            %4
            sol\parenthesize (sol sol) sol\parenthesize (sol sol) la(la la) la(la la)
            sol (sol sol) sol (sol sol) la(la la) la(la la)
            la(la la) la(la la) si(si si) si(si si)

            %7
            la(la la) la(la la) si(si si) si(si si)
        }\\{
            do,(do do) do(do do)
            do(do do) do(do do)\mbreak si(si si) si(si si)
            do(do do) do(do do) do(do do) do(do do)
            do(do do) do(do do) do(do do) do(do do)
            re(re re) re(re re)\mbreak re(re re) re(re re)
            re(re re) re(re re) re(re re) re(re re)
        }
    >>
    do'-! sol16(fa mi8) do'-! la16(sol fa8) do'-! sol16(fa mi8) do'-! la16(sol fa8)\mbreak
    <<{ fa,4.(mi) si'(do)}\\{ sol,2. sol}>>

    %10
    <<{ fa'4.(mi) si'(do)}\\{ sol,2. sol}>>
    <<{sol'4.~sol8 fa mi}\\sol,4.>> re'4 sol8 sol4_+ fa8
    mi_+ re do si4_+ do8\mbreak <<
        {
            s8 sol''(sol) sol (mi  mi)

            %13
            mi (do do) do (do do) mi,4.
        }\\{
            \once\stemUp do8 (mi' mi) mi (do do)
            do (sol sol) sol (mi mi)
            do4.
        }
    >> r4 r8
    r2. <<{sol''8\parentSlur (sol sol) mi\parentSlur (mi mi)
           mi,4.}\\{mi'8\parentSlur (mi mi) do\parentSlur ( do do)
                    do,4.} >> r4 r8\mbreak <<{mi'8(mi mi) mi(mi mi)

                                              %16
                                              re(re re) re(re re) re(re re) re(re re)
                                              re(re re) re(re re) mi(mi mi) mi(mi mi)
                                              re(re re) re(re re)\mbreak mi(mi mi) mi(mi mi)

                                              %19
                                              mi(mi mi) mi(mi mi) fa(fa fa) fa(fa fa)
                                              mi(mi mi) mi(mi mi) fa(fa fa) fa(fa fa)}\\{ sol,(sol sol)  sol(sol sol)
                                                  sol(sol sol) sol(sol sol) fad(fad fad) fad(fad fad)
                                                  sol(sol sol) sol(sol sol) sol(sol sol) sol(sol sol)
                                                  sol(sol sol) sol(sol sol) sol(sol sol) sol(sol sol)
                                                  la(la la) la(la la) la(la la) la(la la)
                                                  la(la la) la(la la) la(la la) la(la la) }>>
    re(do re) re, re re\mbreak sol sol' sol sol sol sol

    %22
    do, si do do, do do fa fa' fa fa fa fa
    si, la si si, si si mi mi' mi mi mi mi
    do mi do si re si\mbreak do mi do si re si

    %25
    <<{mi2. mi
       mi mi}\\{re4.(do) sold(la)
                re4.(do) sold(la)}>>
    mi8 mi' mi mi re do si-+ la sold la si do\mbreak

    %28
    do si la sold4_+ la8 <<{s mi'(mi) mi(mi mi)
                            fa(fa fa) fa(fa fa) re(re re) re(re re)
                            mi(mi mi) mi(mi mi) do(do do) do(do do)\mbreak

                            %31
                            re(re re) re(re re) do(do do) do(do do)}\\{la(la la) la(la la)
                                                                       la(la la) la(la la) sol(sol sol) sol(sol sol)
                                                                       sol(sol sol) sol(sol sol) fa(fa fa) fa(fa fa)\mbreak
                                                                       fa(fa fa) fa(fa fa) fa(fa fa) fa(fa fa)}>>
    do4 do''8 do sib-+ la sol la sib mi, fa sol
    fa-! do16(sib la8) fa'-! re16(do sib8) fa'-! do16(sib la8) fa'-! re16(do sib8)

    %34
    <<{sib'4.(la) mi(fa)
       sib(la) mi\parentSlur (fa)}\\{do2. do
                                                       do do}>>
    do4.-+~do8 sib la sol4_+ do8 do4-+ sib8

    %37
    la sol fa mi4_+ fa8\mbreak <<{s8 do'(do) do(la la)
                                  la(fa fa) fa fa fa fa4.}\\{fa8(la la) la(fa fa)
                                                             fa(do do) do la la la4.}>> r4 r8

}

VIvlIIn = \relative do'' {

    <fa do fa,>4. <mi do sol> <fa do fa,> r4 r8
    <<{fa8\parentSlur (fa fa) mi\parentSlur (mi mi)}\\{do\parentSlur (do do) do\parentSlur (do do)}>> la sol fa la sol fa
    sol fa mi sol fa mi fa mi re fa mi re\mbreak

    %4
    mi sol do mi, sol do fa, la do fa, la do
    mi, sol do mi, sol do fa, la do fa, la do
    fad, la re fad, la re sol, si re sol, si re

    %7
    fad, la re fad, la re sol, si re sol, si re
    sol, do do la do do sol do do la do do
    si, sol sol do sol sol re' sol, sol do sol sol

    %10
    si sol sol do sol sol re' sol, sol do sol sol\mbreak
    fa'' mi-+ re mi re do si-+ la sol do si la
    sol fa mi re4_+ do8 do4 r8 r do mi

    %13
    sol4 r8 r mi' sol <do mi, sol, sol,>4. r4 r8
    <do, mi, sol,>4. <si re, sol,> <do mi, sol,> r4 r8
    <<{sol'8(sol sol) sol(sol sol)}\\{mi(mi mi) mi(mi mi)}>> mi re do mi re do

    %16
    re do si re do si do si la do si la
    si re  sol si, re sol do, mi sol do, mi sol\mbreak
    si, re sol si, re sol do, mi sol do, mi sol

    %19
    dod, mi la dod, mi la re, fa la re, fa la
    dod, mi la dod, mi la re, fa la re, fa la
    fa mi fa fa mi fa\mbreak re do re re mi fa

    %22
    mi re mi mi re mi do si do do re mi
    re do re re do re si la si si do re
    mi la la fa sold sold mi la la fa sold sold\mbreak

    %25
    sold, mi mi la mi mi si' mi, mi la mi mi
    sold mi mi la mi mi si' mi, mi la mi mi
    re' do si do si la sold_+ fad mi mi' sold la\mbreak

    %28
    mi re-+ do si mi re dod mi la dod, mi la
    re, fa la re, fa la si, re sol si, re sol
    do, mi sol do, mi sol la, do fa la, do fa

    %31
    sib,! re fa sib, re fa\mbreak la, do fa la, do fa
    sol la sib la sol fa mi fa sol do, re mi
    do fa fa re fa fa do fa fa re fa fa

    %34
    mi, do do fa do do sol' do, do  fa do do\mbreak
    mi do do fa do do sol' do, do  fa do do
    sib' la sol la sol fa mi re do fa mi re

    %37
    do do' sib sol4 fa8 fa4 r8 r fa la\mbreak
    do4 r8 r la do <fa do fa,>4. r4 r8

}

VIfgn = \relative do {

    fa4. do fa r4 r8
    fa' 4.  do fa,8 la do fa, la do
    mi, sol do mi, sol do re, sol si re, sol si\mbreak

    %4
    do, mi sol do, mi sol do, fa la do, fa la
    do, mi sol do, mi sol do, fa la do, fa la
    re, fad la re, fad la re, sol si re, sol si\mbreak

    %7
    re, fad la re, fad la re, sol si re, sol si
    sol4 r8 la4 r8 sol4 r8 la4 r8
    si4 r8 do4 r8 re4 r8 do4 r8

    %10
    si4 r8 do4 r8 re4 r8 do4 r8
    si4. do re sol,
    fa sol do,8 do mi sol4.

    %13
    r8 mi sol do4 r8 <do, do,>4. r4 r8
    do4. sol do r4 r8
    \clef tenor \key fa\major do'4. sol do8 mi sol do, mi sol

    %16
    si, re sol si, re sol la, re fad la, re fad\mbreak
    \clef bass \key fa\major sol, si re sol, si re sol, do mi sol, do mi
    sol, si re sol, si re sol, do mi sol, do mi

    %19
    la, dod mi la, dod mi la, re fa la, re fa\mbreak
    la, dod mi la, dod mi la, re fa la, re fa
    re4. re8 do? re si la si si do re

    %22
    do4. do8 si do la sold la la si do\mbreak
    si4. si8 la si sold fad sold sold la si
    mi4 r8 fa4 r8 mi4 r8 fa4 r8

    %25
    sold,4 r8 la4 r8 si4 r8 la4 r8
    sold4 r8 la4 r8 si4 r8 la4 r8
    sold4 r8 la4 r8 si4 r8 la4 r8

    %28
    re,4. mi la8 dod mi la, dod mi
    la, re fa la, re fa sol, si re sol, si re\mbreak
    sol, do mi sol, do mi fa, la do fa, la do

    %31
    fa, sib re fa, sib re fa, la do fa, la do
    mi,4 do8 fa4 fa,8 do'4. sib'\mbreak
    do4 r8 re4 r8 do4 r8 re4 r8

    %34
    \clef tenor \key fa\major mi4 r8 fa4 r8 sol4 r8 fa4 r8
    mi4 r8 fa4 r8 sol4 r8 fa4 r8
    mi4 r8 fa4 r8\mbreak \clef bass \key fa\major do,4. la

    %37
    sib do\mbreak fa,8 fa la do4.
    r8 la do fa4 r8 fa,4. r4 r8

}

VIbcn = \relative do {

    fa4. do fa r4 r8
    fa' 4. do fa, fa
    mi mi re re

    %4
    do do do do
    do do do do\mbreak
    re re re re

    %7
    re re re re
    mi4 r8 fa4 r8 mi4 r8 fa4 r8
    re4 r8 mi4 r8 fa4 r8 mi4 r8

    %10
    re4 r8 mi4 r8 fa4 r8 mi4 r8
    re4. do\mbreak sol'4. mi
    fa sol do,8 do mi sol4.

    %13
    r8 mi sol do4 r8 <do, do,>4. r4 r8
    do4. sol do r4 r8
    do'4. sol do do

    %16
    si si\mbreak la la
    sol sol sol sol
    sol sol sol sol

    %19
    la la la la
    la la la la
    re, r4 r8 r2.

    %22
    do4. r4 r8 r2.\mbreak
    si4. r4 r8 r2.
    do'4 r8 re4 r8 do4 r8 re4 r8

    %25
    si4 r8 do4 r8 re4 r8 do4 r8
    si4 r8 do4 r8 re4 r8 do4 r8
    si4 r8 la4 r8 mi4. do\mbreak

    %28
    re mi la la
    la la sol sol
    sol sol fa fa

    %31
    fa fa fa fa
    mi4 do8 fa4 fa,8 do'4. sib'\mbreak
    la4 r8 sib4 r8 la4 r8 sib4 r8

    %34
    sol4 r8 la4 r8 sib4 r8 la4 r8
    sol4 r8 la4 r8 sib4 r8 la4 r8
    sol4 r8 fa4 r8 do4. la

    %37
    sib do\mbreak fa,8 fa la do4.
    r8 la do fa4 r8 fa,4. r4 r8

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 12/8
    \key fa\major
    \tempo 2. = 60
    s1.*13
    \bar":..:"\break
    s1.*25
    \bar":|."

}

VIvlI = {
    \global
    <<\VIvlIn \forma>>

}

VIvlII = {
    \global
    <<\VIvlIIn \forma>>

}VIfg = {
    \global
    \clef bass
    <<\VIfgn \forma>>

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

    systems-per-page = #3

}

    \header {
        title = \markup {Sonata 1\super a a quattro con Oboe [Op. 3/1]}
        composer = \markup \center-column{\vspace #+0.5"J.-J. Cassaneà de Mondonville (1711 - 1772)"}
    }

    \markup \huge {[I.1] Ouverture}

    \score {

        \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {Oboe}
                    \set Staff.shortInstrumentName = "ob"
                    \set Staff.midiInstrument = #"oboe"
                    \Iob
                >>

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
                \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \Ifg
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
            >>
        >>

        \layout {

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

    \markup \huge {[I.2] Aria - Grazioso e poco piano}

    \score {

        \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {Oboe}
                    \set Staff.shortInstrumentName = "ob"
                    \set Staff.midiInstrument = #"oboe"
                    \IIob
                >>

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
                \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \IIfg
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

        \layout {

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

    \markup \huge {[I.3] Giga - Allegro}

    \score {

        \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {Oboe}
                    \set Staff.shortInstrumentName = "ob"
                    \set Staff.midiInstrument = #"oboe"
                    \IIIob
                >>

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
                \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \IIIfg
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>

        \layout {

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
        title = \markup {Sonata 2\super a a quattro [Op. 3/2]}
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
                \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \IVfg
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

    \markup \huge {[II.2] Aria : Andante grazioso e poco piano}

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
                \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \Vfg
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

    \markup \huge {[II.3] Giga - Allegro}

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
                \set Staff.instrumentName = \markup \center-column{"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \VIfg
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
