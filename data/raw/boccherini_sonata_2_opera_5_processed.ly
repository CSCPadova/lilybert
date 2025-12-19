\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

dolce = _\markup \italic { dol[ce] }

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
  \terzine \senza
}


Ivln = \relative do'' {

  <mi, sol,>4\f mi'8-.(re-.) do-.(si-. la-. sol-.)
  fa16 re'(dod) re dod(re) mi fa \grace fa mi8 re16 do \grace mi re8 do16 si
  <do mi, sol,>4\f  mi8-.(re-.) do-.(si-. la-. sol-.)

  %4
  fa16 re'(dod) re dod(re) mi fa \grace fa mi8 re16 do? \grace mi re8 do16 si
  do8\f <mi, sol,>4 <mi sol,> <mi sol,>  <mi sol,>8
  r8 <fa la,>4\f <fa la,> <fa la,> <fa la,>8

  %7
  r <mi sol,>4\f <mi sol,> <mi sol,>  <mi sol,>8
  \afterGrace sol'1\tr\dolce {fad32[sol]}
  si,16(re) sol re do(mi) sol mi re(fa) sol fa \grace fa mi8 re16 do

  %10
  \afterGrace sol'1\tr\dolce {fad32[sol]}
  si,4 <sol' si, re, sol,> <sol si, re, sol,> r
  R1

  %13
  r4 do,16\p(si) do si do8 r r4
  r8 fad16-. mi-. mi(re) re-. do-. do(si) si-. la-. la(sol) sol-. fad-.
  fad?8(sol) sold[(la)] lad(si) r4

  %16
  R1
  r4 sol'16(fad) sol fad sol8 r r4\mbreak
  r8 sol16-. fad-. fad(mi) mi-. re-. re(do) do-. si-. si(la) la-. sol-.

  %19
  mid8(fad?) fad](sol)] sold(la) r4
  R1
  r4 re16(dod) re dod re fad, sol la si\< do re mi

  %22
  fad(sol la) sol fad8 mi-. re-. do-. si-.\! la-.\f
  sol8.\tr la16 si8\p  si4 sol8(fad) fa-.\mbreak
  r8 mi4 mi do8(si)[la-.]

  %25
  r sol4 sol sol'8(fad)[fa-.]
  r mi4 mi do8(si)[la-.]
  r sol4 sol8 sol4 r

  %28
  r r8 re'4\< re re8
  re4 r8\! fad\f(sol4) r8 fad'(
  sol4) r8 fad,(sol) fad sol fad\mbreak

  %31
  sol^\ff re' re re re re re re
  re r r4 r2
  mi16\f(la,) sold la sold la si do \grace do si8 la16 sol? \grace si la8 sol16 fad

  %34
  sol8 r r4 r2
  mi'16\f(la,) sold la sold la si do \grace do si8 la16 sol? \grace si la8 sol16 fad
  sol8 la-. si-. do-. si-. la-. sol-. fad-.\mbreak

  %37
  sol-. la-. si-. do-. si-. la-. sol-. fad-.
  sol4 <sol' si, re, sol,> <sol si, re, sol,> r
  <sol, sol,>\f si8-. la-. sol-.(fad-. mi-. re-.)
  
  %40
  do16(la') sold la sold(la) si do \grace do si8 la16 sol \grace si la8 sol16 fad
  <sol sol,>4\f si8-. la-. sol-.(fad-. mi-. re-.)\mbreak
  do16(la') sold la sold(la) si do \grace do si8 la16 sol \grace si la8 sol16 fad
  
  %43
  sol4 sol, r2
  sol'4\dolce sol4. la8(si)[do]
  \grace re16 do4 si4. do8(re)[mi]
  
  %46
  re4 r <<{re,2(
          mi4)}\\{\stemUp si2(do4\f)}>> mi'8-.(re-.) do-.(si-. la-. sol-.)
  fa16 re'(dod) re dod(re) mi fa\mbreak \grace fa mi8 re16 do? \grace mi re8 do16 si
  
  %49
  do,4 mi'8-.(re-.) do-.(si-. la-. sol-.)  
  fa16 re'(dod) re dod(re) mi fa \grace fa mi8 re16 do? \grace mi re8 do16 si
  do4 r r2
  
  %52
  do4\p do4. re8(mi)[fa]
  \grace sol8 fa4 mi4. fa8(sol)[la]
 <<{\once\stemDown sol4\< sib,2 sib4\!}\\{s4 sol2 sol4}>>
  
  %55
  fa'16\f(sol) fa mi fa(sol) fa mi fa8 r r4\mbreak
  <do fa,>4 r <fa, la,> r4
  mi'16(fa) mi re mi(fa) mi re mi8 r r4
  
  %58
  <do mi,> r <mi, sol,> r
  re'16(mi) re dod re(mi) re dod re8 r r4
  re si <<{sol fa}\\sol,2>>
  
  %61
  <mi' sol,>4 r r8 sol'\f(fa) [mi]
  \grace mi16 re4 re8 re re8.(mi32 fa mi8) re
  \grace mi16 re4 do4. sol'8(fa)[mi]\mbreak
  
  %64
  \grace mi16 re4 re8. re16 re8.(mi32 fa mi8) re
  \grace mi16 re4 do4. sol'8(fa)[mi]
  \grace mi16 re4 re8. re16 re4 re
  
  %67
  \tupletSpan 4 \tuplet 3/2 { re8(fa) mib-. } mib2 mib4
  mib?8(re) re re re,16(re') mib! re \grace re do8 si!16 do
  \grace si16 \afterGrace sol'1\tr {fad32[sol]}
  
  %70
  si,16\f(re) sol mi do(mi) sol mi re(fa) sol fa \grace fa mi8 re16 do\mbreak
  \afterGrace sol'1\tr {fad32[sol]}
  si,16(re) sol mi do(mi) sol mi re(fa) sol fa \grace fa mi8 re16 do
  
  %73
  <<sol'4\\si,>> <sol' si, re, sol,> <sol si, re, sol,> r
  R1
  r4 fa,16\p(mi) fa mi fa8 r r4
  
  %76
  r8 si16-. la-. la(sol) sol-. fa-. fa(mi) mi-. re-. re(do) do-. si-.
  si8(do) dod[(re)] red(mi) r4
  R1\mbreak
  
  %79
  r4 do'16(si) do si do8 r r4
  r8 do16-. si-. si(la) la-. sol-. sol(fa) fa-. mi-. mi(re) re-. do-.
  lad8(si) si[(do)] dod(re) r4
  
  %82
  R1
  sol'\dolce
  <<{si,4\< si2\! si4\f}\\{re, re2 re4}>>
  
  %85
  do'8.\tr re16 mi4.\p do8(si) [sib]
  r8 la4 la fa8(mi)[re]\mbreak
  r8 do4 do do'8(si!)[sib] 
  
  %88
  r la4 la fa8(mi)[re]
  r do4\< do8 do4\! r
  r r8 sol'4\f sol sol8
  
  %91
  sol4 r8 si(do4) r8 si(
  do4) r8 si(do) si do si
  do\ff sol' sol sol sol sol sol sol
  
  %94
  sol fa[(mi) re-.] do-. si-. la-. sol-.\mbreak
  fa16\f(re') dod re dod re mi fa \grace fa mi8 re16 do? \grace mi re8 do16 si
  sol'8 fa[(mi) re-.] do-. si-. la-. sol-.
  
  %97
  fa16\f(re') dod re dod re mi fa \grace fa mi8 re16 do? \grace mi re8 do16 si
  do8\noBeam re-.(mi-. fa-.) mi-.(re-. do-. si-.)
  do\noBeam re-.(mi-. fa-.) mi-.(re-. do-. si-.)
  
  %100
  do4 <do mi, sol,> <do mi, sol,>\fermata r
  
}

Imdn = \relative do'' {

  r16 do\f mi sol do do, si' si, la' la, sol' sol, fa' fa, mi' mi,
  re' fa mi fa mi fa sol la \grace la sol8 fa16 mi \grace sol fa8 mi16 re
  do do mi sol do do, si' si, la' la, sol' sol, fa' fa, mi' mi,

  %4
  re' fa mi fa mi fa sol la \grace la sol8 fa16 mi \grace sol fa8 mi16 re
  r do, mi do sol' mi do' sol mi' do sol' mi do' sol mi do\mbreak
  r do, fa do la' fa do' la fa' do la' fa do' la fa do

  %7
  r do, mi do sol' mi do' sol mi' do sol' mi do' sol mi do
  si re sol re do mi sol mi re fa sol fa \grace fa mi8 re16 do
  \afterGrace sol'1\tr {fad32[sol]}

  %10
  si,16 re sol re do mi sol mi re fa sol fa \grace fa mi8 re16 do
  sol'4 <<{<sol re>4 <sol re>}\\{si, si}>> r
  <<
    {
      la2\p(si4) do

      %13
      \grace do16 si8 la la4~la16
    }\\{
      fad2(sol4) la
      \grace la16 sol8 fad fad4~fad16 la si do
    }
  >> re mi fad sol
  sold(la) la-. sol-. sol(fad) fad-. mi-. mi(re) re-. do-.  do(si) si-. la-.
  lad8(si) si[(do)] dod(re) r4

  %16
  <<{si2(do4) re}\\{sol,2(la4) si}>>\mbreak
  <<{\grace re16 do8 si si4~si16}\\{\grace si16 la8 sol sol4~sol16 si do re}>> mi fad sol la
  lad(si) si-. la-. la(sol) sol-. fad-. fad(mi) mi-. re-. re(do) do-. si-.

  %19
  sold8(la) lad[(si)] si(do) r4
  <<
    {
      la2(si4) do
      \grace do16 si8 la la4~la16
    }\\{
      fad2(sol4) la
      \grace la16 sol8 fad fad4~fad16 la si do
    }
  >>  re\< mi fad sol\mbreak

  %22
  la si do si la si sol la fad sol mi fad re mi do\! re\f
  si8.\tr do16 re4. <<
    {
      si8\noBeam^\markup\italic"dolcis[simo]" do re
      red(mi) mi4. la,8 si[do]
      dod(re) re4. si8 do[re]

      %26
      red(mi) mi4. la,8 si[do]
      dod(re) re4. si8\< do[re]\mbreak
      \stemDown mi8.\tr re32 mi fad8. mi32 fad sol8.\tr fad32 sol la8.\tr sol32 la\!
    }\\{
      sol,8 la[si]
      si (do) do4. fad,8 sol[la]
      lad(si) si4. sol8 la[si]
      si(do) do4. fad,8 sol[la]
      lad(si) si4. sol8 la[si]\mbreak
    }
  >>

  %29
  si'8\f sol~sol16 si la do si8 sol~sol16 si la do
  si8 sol~sol16 si la do si sol la do si sol la do
  si^\ff sol la do si sol la do si sol la do si sol la do

  %32
  \stemUp si\dolce sol la fad \stemNeutral sol mi fad re mi do re si do\f la si sold\mbreak
  la do si do si do re mi \grace mi re8 do16 si la fad' la do
  si\dolce sol la fad sol mi fad re mi do re si do\f la si sold

  %35
  la do si do si do re mi \grace mi re8 do16 si \grace re do8 si16 la
  si sol' do, la' re, si' mi, do' re, si' do, la' si, sol' la, fad'
  si, sol' do, la' re, si' mi, do'\mbreak re, si' do, la' si, sol' la, fad'

  %38
  sol,4 <<{<sol' re si>4 <sol re si>2}\\{sol,4 sol2}>>
  r16 sol\f si re sol sol, fad' fad, mi' mi, re' re, do' do, si' si,
  la' do si do si do re mi \grace mi re8 do16 si \grace re do8 si16 la

  %41
  sol sol si re sol sol, fad' fad, mi' mi, re' re, do' do, si' si,
  la' do si do si do re mi
  \grace mi re8 do16 si \grace re do8 si16 la

  %44
  sol4\p sol~\mbreak sol8 la(si) do-. \grace re16 do4 si4. do8(re)[mi-.]
  \grace fa16 mi4 re4. mi8(fa)[sol]
  fa16\< re mi fa sol la si do si do re do si la sol fa\!

  %47
  mi\f do mi sol do do, si' si, la' la, sol' sol, fa' fa, mi' mi,
  re' fa mi fa mi fa sol la \grace la sol8 fa16 mi \grace sol fa8 mi16 re\mbreak
  do do mi sol do do, si' si, la' la, sol' sol, fa' fa, mi' mi,

  %50
  re'  fa mi fa mi fa sol la \grace la sol8 fa16 mi \grace sol fa8 mi16 re
  do4\p do4. re8(mi) [fa-.]
  \grace sol16 fa4 mi4. fa8(sol)[la-.]

  %53
  \grace sib16 la4-. sol4. la8(sib)[do-.]
  sib16\<(sol mi do) r4 \clef bass sib,16(sol mi do\!) r4
  \clef violin la'''16\f sib la sol la sib la sol la do la fa do la' fa do

  %56
  la fa' do la fa do' la fa do8 r r <<la''\\fa>>
  <<sol16\\{mi la sol fad}>> sol la sol fad sol do sol mi do sol' mi do
  sol mi' do sol mi do' sol mi do r16 r8 r <<sol''\\mi>>

  %59
  <<fa?16\\{re sol fa mi}>> fa sol fa mi\mbreak fa fa la fa \giu\stemUp \clef violin re-. \su\stemDown si re si
  \giu\stemUp si-.\su\stemDown si re si \giu \stemUp fa-.\su\stemDown fa si fa \giu\stemUp re-. \clef bass \su\stemDown re fa re <<{s8 fa'}\\{\once\stemUp si,,  re'}>>
  mi16 do re mi fa sol la si do\ff do, do' do,  r do do' do,

  %62
  r do do' do, r do do' do, r do do' do,  r do do' do, \mbreak
  r do do' do, r do do' do, r do do' do, r do do' do,
  r do do' do, r do do' do, r do do' do, r do do' do,

  %65
  r do do' do, r do do' do, r do do' do, r do do' do,
  r do do' do, r do do' do, r do do' do, r do do' do,
  r do do' do, r do do' do, r do do' do, r do do' do,

  %68
  r do do' do, r do do' do, r do do' do, r do do' do,\mbreak
  si\f re sol re do mi sol mi re fa sol fa \grace fa mi8 re16 do
  \afterGrace sol'1\tr {fad32[sol]}

  %71
  si,16 re sol re do mi sol mi re fa sol fa \grace fa mi8 re16 do
  \afterGrace sol'1\tr {fad32[sol]}
  sol,4 <sol' si, sol>4 <sol si, sol> r

  %74
  <<
    {
      re,2(mi4) fa\mbreak
      \grace fa16 mi8 re re4~re16 re mi fa
    }\\{
      \stemUp si,2(do4) re
      \stemDown \grace re16 do8 si \stemUp si4~si
    }
  >> sol'16 la si do
  dod(re) re-. do-. do(si) si-. la-. la(sol) sol-. fa-. fa(mi) mi-. re-.

  %77
  red8(mi) mi[(fa)] fad(sol) r4
  <<
    {
      mi2(fa4) sol
      \grace sol16 fa8 mi mi4~mi16 mi fa sol
    }\\{
      \stemUp do,2(re4) mi
      \stemDown \grace mi16  re8 do \stemUp do4~do
    }
  >> \stemNeutral la'16 si do re

  %80
  red(mi) mi-. re-. re(do) do-. si-. si(la) la-. sol-. sol(fa) fa-. mi-.
  dod8(re) red[(mi)] mi(fa) r4
  r8 <re si>\dolce (<mi do>) <fa re> <sol mi> <la fa> <si sol> <do la>\mbreak

  %83
  <re si> <do la> <si sol> <do la> <re si> <do la> <re si> <mi do>
  fa16\< sol la fa re mi fa re si do re si\! sol\f si re fa
  mi8.\tr fa16 sol4.^\markup\italic"dolcis[simo]" <<{mi8 fa sol}\\{do, re mi}>>

  %86
  <<
    {
      sold8(la) la4. re,8 mi fa
      fad(sol) sol4. mi8 fa sol
      sold(la) la4. re,8 mi fa\mbreak

      %89
      fad(sol) sol4
    }\\{
      mi8 fa fa4. si,8 do[re]
      red mi mi4. do8 re?[mi]
      mi fa fa4. si,8 do[re]\mbreak
      red mi mi4.
    }
  >> mi,8\f fa![sol]
  la8.\tr sol32 la si8.\tr [la32 si] do8.\tr si32 do re8.\tr do32 re
  mi8 do~do16 mi re fa mi8 do~do16 mi re fa

  %92
  mi8\ff do~do16 mi re fa mi do re fa mi do re fa
  mi do re fa mi do re fa mi do re fa mi do re fa\mbreak
  mi mi, re' re, do' do, si' si, la' \giu  la, \su sol'\giu sol, \su fa'\giu fa, \su mi'\giu mi,

  %95
  \su r16  fa'' mi fa mi fa sol la \grace la sol8 fa16 mi \grace sol16 fa8 mi16 re
  mi mi, re' re, do' do, si' si, la' \giu  la, \su sol'\giu sol, \su fa'\giu fa, \su mi'\giu mi,
  \su re' fa mi fa mi fa sol la \grace la sol8 fa16 mi \grace sol16 fa8 mi16 re\mbreak

  %98
  mi do' fa, re' sol, mi' la, fa' sol, mi' fa, re' mi, do' re, si'
  mi, do' fa, re' sol, mi' la, fa' sol, mi' fa, re' mi, do' re, si'
  do,4 <mi' do sol mi> <mi do sol mi>\fermata r

}

Imsn = \relative do {

  <<do1\f\\do,>>
  <<la''4\\fa>> r sol sol,
  <<do1\f\\do,>>

  %4
  <<la''4\\fa>> r sol sol,
  <<do1\f\\do,>>
  <<do'1\f\\do,>>

  %7
  <<do'1\f\\do,>>
  fa'8\f sol, mi' sol,  si sol do sol
  fa' sol, mi' sol,  si sol do sol

  %10
  fa' sol, mi' sol,  si si' do, mi\mbreak
  sol, sol' re si sol4 r
  re'8\p re' re, re' re, re' re, re'

  %13
  re,(re') re re re,4 r
  re,1(
  re'2)~re16 re' dod re si re sol, si

  %16
  re,8 re' re re re, re' re, re'\mbreak
  re,(re') re re re,4 r
  re,1(

  %19
  re'2)~re16 re' dod re la re fad, la
  re, 8re' re re re, re' re, re'
  re,(re') re re re,4 r\mbreak

  %22
  re,2\< re'\!
  sol,8\f sol' sol sol sol,2~
  sol8\p sol' sol sol sol,2~

  %25
  sol8 sol' sol sol sol,2~
  sol8 sol' sol sol sol,2~
  sol8 sol' sol sol sol sol, la si\mbreak

  %28
  do do' re, re' mi, mi' fad, fad'?
  r16 sol, si re \su \stemDown sol8 re \giu\stemNeutral r16 sol, si re \su \stemDown sol8 re
  \giu\stemNeutral r16 sol, si \su re \stemDown sol8 re sol re sol re

  %31
  sol fad sol fad sol fad sol fad
  sol \giu r r4 r r8 <<re,\f\\si>>\mbreak
  <<mi4\\do>> r8 \stemNeutral do re4 re,

  %34
  <<sol'\\\stemUp \shiftOn sol,>> r r r8 <<re'\f\\si>>\mbreak
  <<mi4\\do>> r8 do re re re, re
  sol4 r8 do re4 re,

  %37
  sol r8 do\mbreak re4 re,
  sol8\noBeam \tuplet 3/2 { sol'16(fad sol) } sol,8 [sol] sol2
  <<sol'1\\sol,\f>>
  
  %40
  <<mi'4.\\do>> do8 re4 re,  
  <<sol'1\\sol,\f>>
  <<mi'4.\\do>> do8 re4 re,
  
  %43
  sol8\p(sol') sol sol\mbreak sol2
  sol,8 (sol') sol sol sol2
  sol,8 (sol') sol sol sol2
  
  %46
  sol,\< sol'4 sol,\! 
  <<do1\\do,\f>>
  <<la''4\\fa>> r sol sol,\mbreak
  
  %49
  <<do1\\do,\f>>
  <<la''4.\\fa>> fa8 sol4 sol,
  do8\p(do') do do do2
  
  %52
  do,8(do') do do do2
  do,8(do') do do do2
  do,4\< \clef violin sib''16(sol mi do) r4 \clef bass sib,16(sol mi do)\!\mbreak
  
  %55
  fa2\f~fa4 r
  r2 r16fa'\f do la fa8 fa'
  \once\slurUp <do do,>2(<do do,>4) r
  
  %58
  r2 r16 do' sol mi do8 do'
  <<{sol2~sol8}\\{sol,2~sol8}>> r s4
  s2 s4 <<{sol'4 
           
           %61
           do, re mi mi
           fa fa sol sol
           la la mi mi\mbreak
           
           %64
           fa fa sol sol
           la la mi mi
           fa fa fad fad
           
           %67
           sol sol lab lab
           sol sol fad fad\mbreak}\\{\shiftOn \stemUp sol,4
                                     do, re mi2\f 
                                     fa\f sol\f 
                                     la\f mi\f 
                                     fa\f sol\f 
                                     la\f mi\f 
                                     fa\f fad\f 
                                     sol\f lab\f 
                                     sol\f fad\f }>>
  sol'8\f sol, mi' sol, si sol do mi
  
  %70
  fa sol, mi' sol, si sol do mi
  fa sol, mi' sol, si sol do mi
  fa sol, mi' sol, si sol do mi
  
  %73
  sol sol re si sol4 r 
  sol8\p sol' sol sol sol, sol' sol, sol'\mbreak
  sol,(sol') sol sol sol2
  
  %76
  sol,1(
  sol'2)~sol16 sol fad sol mi sol do, mi\mbreak
  sol,8 sol' sol sol sol, sol' sol, sol'\mbreak
  
  %79
  sol,(sol') sol sol sol2
  sol,1(
  sol'2)~sol16 sol fad sol re sol si, re
  
  %82
  sol,1\tenuto\mbreak
  sol'
  <<{sol2 sol4 sol}\\{sol,2\< sol4\! sol\f}>>
  
  %85
  do8 do' do do do,2\p~
  do8 do' do do do,2~
  do8 do' do do do,2
  
  %88
  do8 do' do do do,2~
  do8 do' do do do do,\f re mi
  fa, fa' sol, sol' la, la' si, si'
  
  %91
  r16 do, mi sol do8 sol r16 do, mi sol do8 sol
  r16 do,\ff mi sol do8 sol do sol do sol
  do si do si do si do si\mbreak
  
  %94
  do4 r r r8 \once\stemDown do,8
  <<la4\f\\fa>> r8 fa' sol sol sol, sol
  <do do,>4 r r r8 \once\stemDown do
  
  %97
  <<la4\\fa>>r8  fa'8 sol sol sol, sol\mbreak
  <do do,>4 r8 fa sol4 sol,
  <do do,>4 r8 fa sol4 sol,
  
  %100
  do,8 \tuplet 3/2 { do'16[(si do)] } do,8 do do4\fermata r4

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \time 4/4
  \tempo 2 = 55
  \key do\major
  s1*38
  \bar ":|."\break
  s1*62
  \bar "|."

}

Ivl = {
  \Iglobal
  \notypeset
  <<\Ivln \forma>>

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
  <<\Imsn \forma \Ibfn>>
  \typeset

}



IIglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.4
  \override TupletBracket.bracket-visibility = ##f
  \terzine \senza
}


IIvln = \relative do'' {

  sol4\dolce \grace sib16 lab8. sol16 sol8 sol4 do8
  \grace sib16 lab8 sol16 lab sol4 r2
  lab,\p(sol4) re'\mbreak

  %4
  R1
  lab2(sol4) re'
  r8 sol\f~sol16. do32 sol16. mib32 do8 do4 sib!8

  %7
  <<
    {
      re1^\tenuto\p (
      mib4)
    }\\{
      lab,!1(
      sol4)
    }
  >> mib'8.\tr re16 mib4 mib'~
  mib re mib mib,~
  
  %10
  mib re8. do16 sib4 sib'(
  do) do,(re) re'
  mib, mib' <<
    {
      la,2(
      
      %13
      sib4)
    }\\{
      mib,2(
      re4)
    }
  >> r8 fa4 mib re8
  mib sol,4 sol8 lab2
  r8 sol4 sol8 lab2
  
  %16
  <mib' sol,>4 r<mib sol,> r
  <mib sol,> r r r8mib~
  mib8 mib mib mib mib16 mib mib mib re [re re re]
  
  %19
  <mib sol,>4\f <mib sol,>8. <mib  sol,>16 <mib sol,>4 r
  R1
  sib'4.^\markup\italic"dolcis[simo]" sib '8~\mbreak sib8 [sib,]~sib16 sib'(lab) sol
  
  %22
  fa4 r8 fa(sol4)(lab8) sib
  lab fa r fa sol4 (lab8) sib
  lab4 r r2
  
  %25
  re,(si16) re(fa) lab si,-. [re(fa) lab]
  sol4 r r2
  do,2(la16) do(mib) solb la,-. [do(mib) solb]
  
  %28
  fa4(reb8) sib^\markup\italic"poco cresc[ente]" sol'4(mi8) sib
  lab'4(fa8) re sib'4(sol8) mi\mbreak  %% fine prima riga
  do'4(lab8) fa mib,! mib'4 \grace mib16 re16. do32
  
  %31
  si16(sol') sol sol sol [sol, sol sol] sol mi(fa mi fa) [fa fa fa]
  fa re(mi? re mi) [mi mi mi] mi do(re do re) [re re re]
  do8 sol4 sol8(lab) lab'4 si8
  
  %34
  do sol4 sol,8(lab) lab'4 si8
  do4 r <mib, do>\f r
  <mib do>\f r r r8 do\p~
  
  %37
  do16 do do do do[do do do] do do do do si[si si si]
  do8\f <mib sol,>4 <mib sol,>8 <mib sol,>2\fermata

}

IImdn = \relative do'' {
  \override TupletBracket.bracket-visibility = ##f

  sol'4\dolce \grace sib8 lab8. sol16 sol8 sol4 do8
  \grace sib16 lab8 sol16 lab sol4~sol16 sol(lab sol) r sol(lab) mi
  \grace sol fa8 fa4 fa8~fa32 lab(sol lab sib lab sol lab) fa  (lab sol lab sib lab sol fa)

  %4
  fa16(mib) lab sol sol4~\mbreak sol16 sol(lab sol) r sol lab sol
  \grace sol fa8 fa4 fa8~fa32 lab(sol lab sib lab sol lab) fa  (lab sol lab sib lab sol fa)
  \grace fa16 mib8 \grace mib16 re16. do32 do16.\f do32 sol16. mib32 \giu\stemUp do16. do32 sol16. mib32 do4

  %7
  \su\stemNeutral r8 \grace mi''16 fa8\p \grace mi16 fa8 \grace mi16 fa8 fa16 sol lab sol \grace sib16 lab8 [sol16 fa]\mbreak
  sib8. (sol16) mib4~mib16 sib(mib) sib(sol') [mib(sib' sol)]
  sib(la lab8)~\sestine\con \tuplet 6/4 { lab16 [re, mib fa sol lab }] sol32\< re, fa sol lab sib do re mib[fa sol lab] sib16 sol

  %10
  sol4\tr fa\! r8 mib mib mib\mbreak
  mi8 [fa]~\tuplet 6/4 {fa16 lab(sol fa sol lab)} fad8[sol]~\tuplet 6/4{sol16 sib(lab sol lab sib)}
  sib16(lab sol lab) \appoggiatura {sol32[lab sib]} lab4. <<{mib8 mib[mib]}\\{la, la[la]}>>

  %13
  \afterGrace re4\tr {do32[re]} \afterGrace do4\tr {sib32[do]} \afterGrace sib4\tr {lab?32[sib]} \afterGrace lab4\tr {sol32[lab]}
  \tuplet 3/2 { sol16 lab sib } sib8\noBeam ~\tuplet 6/4{sib16 sol lab sib do sib} sib8 [fa']~\tuplet 6/4 {fa16 mib re do sib lab}
  \tuplet 3/2 { sol16 lab sib } sib8\noBeam ~\tuplet 6/4{sib16 sol lab sib do sib} sib8 [fa']~\tuplet 6/4 {fa16 mib re do sib lab}

  %16
  \stemUp sol32[\giu sol,(lab sib do \su re mib fa] \stemNeutral sol) sib, (do re mib fa sol lab sib)[mib,(fa sol lab sib do re] mib) sol,(lab sib do re mib fa
  sol)\<sib,(do re mib fa sol lab] sib) mib,(fa sol lab sib do re mib8\!\noBeam) r r16 mib,\dolce (fa fad
  sol8) sol~sol16[lab \grace sol fa mib] \grace mib fa2\tr\mbreak

  %19
  mib4\f <sol, mib sib>8. <sol mib sib>16 <sol mib sib>4 r
  sib\dolce  \grace re16 do8. sib16 sib4 sib
  mi8 mi4 mi16.\tr fa32 sol16[sol (fa mi)] r reb(do sib)

  %22
  lab[do \grace mi? reb do] do' do, \grace mi reb do do2\tr~
  do16 do \grace mi? reb do do'[do, \grace mi reb do] do2\tr~\mbreak
  do16 do \grace mi? reb do reb8[reb]~reb16 fa-. fa(mib?) mib[(reb) reb(do)]

  %25
  \grace do16 si8 si8. si32[(do re? mib fa sol] lab16) [fa(re) si-.] lab'-. fa(re) si-.
  r si \grace re do si do8[do]~do16 do(mib) reb-. reb[(do) do(sib?)]
  \grace sib la8 [la8.]~la32(sib do reb mib fa solb16)[mib(do) la-.] solb'-.mib(do) la-.

  %28
  r32 sib[(la sib reb sib la sib] fa' sib, la sib reb sib la sib)\mbreak r32 sib_\markup\italic"Poco cresc[ente]"[(la sib mi sib la sib] sol' sib, la sib mi sib la sib)
  r lab[(sol lab fa' lab, sol lab] lab' lab, sol lab fa' lab, sol lab) r do[(sib? do mi do sib do] sol' do, sib do sib' do, sib do)
  r do[(si do lab' do, si do] do' do, si do lab' do, si do) r do[(si do la' do, si do] do' do, si do la' do, si do)

  %31
  si2\tr\p \afterGrace lab? {sol32[lab]}
  \afterGrace sol2\tr {fad32[sol]}  \afterGrace fa2\tr {mi32[fa]}
  \tuplet 3/2 { mib!16 lab sol } sol8\noBeam~\tuplet 6/4 {sol16 mib sol do mib sol}\tuplet 6/4{ fa[re si lab fa re]} \tuplet 6/4 { si re fa lab sol fa}\mbreak

  %34
  \tuplet 3/2 { mib16 lab sol } sol8\noBeam~\tuplet 6/4 {sol16 mib sol do mib sol}\tuplet 6/4{ fa[re si lab fa re]} \tuplet 6/4 { si re fa lab sol fa}\mbreak
  mib32[sol,(do mib] do sol do mib sol) s32*7 s32 mib(sol do sol[mib sol do] mib) s32*7
  s32 do[(mib sol] mib do mib sol do8\noBeam) r r4 r8 do,\p

  %37
  <<{mib[mib]~\stemDown mib16 [fa \once\stemUp \grace mib re do]}\\{sol8}>> \grace do16 \afterGrace re2\tr\< {do32[re]\!}\mbreak
  do4\f <do sol mib>8 <do sol mib> <do sol mib>2\fermata

}

IImsn = \relative do {
  \override TupletBracket.bracket-visibility = ##f

  <<
    {
      mib4_\markup\italic"ten[uto]"  fa  mib mib
      fa mib mib mib
      re re re re
      
      %4
      sol mib\mbreak mib mib
      re re re re
    }\\{
      do do do do
      do do do do
      do do(si) si
      do do\mbreak do do
      do do(si) si
    }
  >>
  do4~do16.\f do'32 sol16. mib32 \stemDown do16. do32 sol16. mib32 do4\stemNeutral
  
  %7
  r2 sib'\p(\mbreak
  sol4) sol'8. fa16 sol4 mib(
  fa) sib, mib\< mib,
  
  %10
  sib' sib'8. lab16\! sol4^\markup\italic "dolcis[simo]" sol(
  lab) lab, sib sib'(
  do) do <do la fa> <do la fa>
  
  %13
  sib(lab! sol) fa
  mib mib(re) re
  mib mib(re) re
  
  %16
  mib2\tenuto mib,
  mib' <<
    {
      r32\! \su \stemDown mib'(re do\giu sib lab sol fa\stemNeutral  mib8\!) [la,\dolce](
      \stemUp sib8) sib' sib sib sib, sib' sib sib\mbreak
    }\\{
      s2
      sib,2 sib
    }
  >>
  
  %19
  <<{mib4 mib mib}\\{\stemUp \shiftOn mib, mib mib}>> r
  <<
    {
      sol'_\markup\italic "ten[uto]" sol fa fa
      sol sol sol sol
    }\\{
      mib mib re reb
      do do do mi
    }
  >>
  
  %22
  <<lab\\fa>> r4 \tuplet 3/2 { mi16 sol do mi,[sol do] fa, lab do sol[sib do]}
  <<lab!2\\fa>> \tuplet 3/2 { mi16 sol do mi,[sol do] fa, lab do sol[sib do]}
  <<
    {
      lab4_\markup\italic"ten[uto]" lab lab lab
      
      %25
      lab lab lab lab(
      sol) sol solb solb
      solb solb solb solb(
      
      %28
      fa) fa \mbreak mi mi
      <fa re> <fa re> <sol mi> <sol mi>
      fa fa(fad) fad
      
      %31
      sol8 sol sol sol sol, sol' sol sol
      sol, sol' sol sol sol, sol' sol sol
    }\\{
      fa4 fa fa fa
      fa fa fa fa(
      mib) mib mib mib
      mib mib mib mib(
      reb) reb\mbreak do do
      si si sib sib
      lab lab la la
      sol2 sol
      sol sol
    }
  >>
  do4 <<{mib(re) fa}\\{do(si) re}>>
  
  %34
  do <<{mib(re) fa}\\{do(si) re}>>
  <<mib8\\do>> r \clef violin r32 do'( mib sol mib[do mib sol] do) s32*8 sol32(do mib do[sol do mib]
  sol) s32*7 \clef bass r32 do,,\f(sib! lab sol fa mib re do8\noBeam) do' lab fad\p (
  
  %37
  sol) sol[sol sol] <<{sol,8\< sol' sol sol\!}\\{sol,4 sol}>>
  <<{do8 do16. do32 do8[do] do2\fermata}\\{do,4 do8 do do2}>>

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \time 2/2
  \tempo 4 = 55
  \key do\minor
  s1*38
  \bar "|."

}

IIvl = {
  \IIglobal
  \notypeset
  <<\IIvln \forma>>

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
  <<\IImsn \forma \IIbfn>>
  \typeset

}



IIIglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.4
  \override TupletBracket.bracket-visibility = ##f
  \terzine \senza
}


IIIvln = \relative do'' {

  mi,8_\markup\italic "Soave" fa(mi)[sol(fa) mi]
  \con\tupletSpan 4 \appoggiatura \tuplet 3/2 { re8 mi fad? } mi4. re8 do4
  si(do) re

  %4
  do r r
  mi8 fa?(mi)[sol(fa) mi]
  \appoggiatura \tuplet 3/2 { re8 mi fad? } mi4. re8 do4
  
  %7
  re re8. mi16 do8. re16
  do2(si4)
  re'2.\<~
  
  %10
  re4 r r
  re,2.
  sol,4\! r mi'\p
  
  %13
  la, r re
  sol, r mi'\mbreak
  la, r re
  
  %16
  sol,8\f sol'4 sol8\p fad[sol]
  <<la\\la>> fad4 fad8\p(sol) [la]
  si\f sol4 sol8\p(la)[si]
  
  %19
  do16-.\f do(re) mi \grace mi re8 do16 si \grace do la8 sol16 fad
  sol8 sol4 sol8\p(fad)[sol]
  la\f fad4 fad8\p(sol)[la]\mbreak
  
  %22
  si\f sol4 sol8\p(la)[si]
  do16\parenthesize -. \f do(re) mi \grace mi re8 do16 si \grace do la8 sol16 fad
  sol4 r r
  
  %25
  R2.
  sol'8\p(fad mi re do si)
  si16(re) do mi re8-. si(do) re\mbreak
  
  %28
  sol,16\f(do) re mi \grace mi re8 do16 si \grace do la8 sol16 fad
  sol4 r r
  R2.
  
  %31
  sol'8\p(fad mi re do si)
  si16(re) do mi re8-. si(do) re\mbreak
  sol,16\f(do) re mi \grace mi re8 do16 si \grace do la8 sol16 fad
  
  %34
  sol8 re <si 're, sol,>4 r
  dod,8\f dod4 dod dod8
  re\p fa!-. re-. fa-. re-. fa-.
  
  %37
  mi-. dod-. la-. dod-. mi-. dod-.
  re-. fa-. re-. fa-. re-. fa-.
  <<re\\re\f>> sol,4 sol sol8\mbreak
  
  %40
  do? mi-. do-. mi-. do-. mi-.
  re-. si-. sol-. si-. re-. si-.
  do-. mi-. do-. mi-. do-. mi-.
  
  %43
  do-. mib-. do-. mib-. do-. mib-.
  fa-. lab-.  fa-. lab-.  fa-. lab-. 
  sib,-. re-. sib-. re-. sib-. re-.
  
  %46
  mib-. sol-. mib-. sol-. mib-. sol-.\mbreak
  lab,-. do-. lab-. do-. lab-. do-.
  re-. fa-. re-. fa-. re-. fa-.
  
  %49
  sol,-. si-. sol-. si-. sol-. si-.
  do do'4\< do do8\!
  r do4\f do do8
  
  %52
  r do\f do [do la la]
  sol\p sol'4 sol sol8(
  la\f) do,4 do mib,8(
  
  %55
  re) sol'4\p sol sol8(
  la)\f do,4 do mib,8
  re si <si' re, sol,>4 r
  
  %58
  mi,8\p fa(mi)[sol(fa) mi]
  \con\tupletSpan 4 \appoggiatura \tuplet 3/2 { re8 mi fad? } mi4. re8 do4
  si(do) re
  
  %61
  do r r
  mi8 fa?(mi)[sol(fa) mi]
  mi16(fa) mi re do8 mi(fa\<) sol
  
  %64
  fa la,4 la la'8\!
  sol8.\tr la16 si8^\markup\italic"dolcis[simo]" si4 do8
  re re,4 re'8(si)[fa]
  
  %67
  mi8.\tr re16 do8 do'4 re8
  mi mi,4 mi'8 \grace fa16 mi8 re16 do
  si8.\tr do16 re8 si4 do8\mbreak
  
  %70
  re re,4 re8 \grace mi16 re8 do16 si
  do4 r la 
  re r sol, 
  
  %73
  do r la
  re r sol,
  do8\f do4 do8\p(si)[do]
  
  %76
  <<re\\re\f>> si4 si8\p(do)[re]
  mi\f do4 do8\p(re)[mi]\mbreak
  fa16\f fa(sol) la \grace la sol8 fa16 mi \grace mi re8 do16 si
  
  %79
  do8\f do4 do8\p(si)[do]
  re\f si4 si8\p(do)[re]
  mi\f do4 do8\p(re)[mi]
  
  %82
  fa16\f fa(sol) la \grace la sol8 fa16 mi \grace mi re8 do16 si
  do4 r r
  R2.\mbreak
  
  %85
  do'8\p(si la  sol fa mi)
  mi16(sol) fa la sol8 mi(fa) sol
  do,16\f (fa) sol la \grace la sol8 fa16 mi \grace mi re8 do16 si
  
  %88
  do4 r r
  R2.
  do'8\p(si la  sol fa mi)
  
  %91
  mi16(sol) fa la sol8 mi(fa) sol\mbreak
  fa16\f fa(sol) la \grace la sol8 fa16 mi \grace mi re8 do16 si
  do8\f do4 do do8
  
  %94
  do do' do do,(si)[fa']
  <do' mi, sol,>4 r8 do, do do
  do do'~do16 sol(do) mi \grace mi re8 do16 si
  
  %97
  do8 mi, <do' mi, sol,>4\fermata r
  
}

IIImdn = \relative do'' {

  sol'8_\markup\italic "Soave" la16(si do8) si(la) sol-.
  \appoggiatura \tuplet 3/2 { fad8 [sol la] } sol4. fa8 mi4
  re8. re16 mi8. mi16 fa8. fa16

  %4
  mi8 r \clef bass r16 mi,,(sol do) mi8 r
  \clef violin sol'8 la16(si do8) si(la) sol-.
  \appoggiatura \tuplet 3/2 { fad8 [sol la] } sol4. fa8 mi4

  %7
  fa fa8. sol16 mi8. fa16
  mi2(re16) sol si sol
  fad\< la re, do' ~do si8 la sol fad16

  %10
  sol re si sol re' si sol re r4\mbreak
  fad'16 la re, do'~do si8 la sol fad16\!
  sol\dolce sol fad sol mi\giu\clef violin do \su re \giu si \su do \giu la \su si \giu sold

  %13
  \su r16 do'(la fad) re \giu si \su do \giu la \su si \giu sol \su la \giu fad
  \su r16 sol' fad sol mi \giu do \su re \giu si \su do \giu la \su si \giu sold\mbreak
  \su r16 do'(la fad) re\giu si \su do \giu la \su si \giu sol \su la \giu fad

  %16
  \su <<{si4\f~si16\p sol fad sol}\\{sol4~\stemUp \once \override Stem #'transparent = ##t  sol16}>> la do si re
  <<{do4\f~do16 la sold la}\\{la4~\stemUp \once \override Stem #'transparent = ##t la16\p}>> si re do mi
  <<{re4\f~re16 si la si}\\{si4~\stemUp \once \override Stem #'transparent = ##t si16\p}>> do mi re fa!

  %19
  mi mi fad\< sol \grace sol fad8 mi16 re \grace re do8 si16 la\!\mbreak
  <si sol>8\f <sol si,>~<sol si,>16\p sol fad sol la do si re
  <do la>8\f <la do,>~<la do,>16\p la sold la si re do mi

  %22
  <re si>8\f <si re,>~<si re,>16\p si la si do mi re fa!
  mi mi fad\< sol \grace sol fad8 mi16 re \grace re do8 si16 la\!
  si\f(do) do re re(mi) mi fad fad(sol) sol la\mbreak

  %25
  la(si) si do do2
  si8\p(la sol fad mi re)
  re16(fa! mi sol) fa8 fa4 fa8

  %28
  mi16\f mi fad sol \grace sol fad8 mi16 re \grace re do8 si16 la
  si\f(do) do re re(mi) mi fad fad(sol) sol la
  la(si) si do do2\mbreak

  %31
  si8\p(la sol fad mi re)
  re16(fa! mi sol) fa8 fa4 <<fa8^\f\\re>>
  <<mi16\\{do [mi fad sol]}>>  \grace sol fad8 mi16 re \grace re do8 si16 la

  %34
  sol8 re <sol re si>4 r %% fine prima parte OK
  dod,16\f mi la dod? mi, la dod mi la, dod mi la
  \giu \clef violin fa! \p\su la \giu re, \su la' \giu fa \su la \giu re, \su la' \giu fa \su la \giu re, \su la'
  
  %37
  \giu sol \su la \giu mi \su la \giu dod,\su la' \giu mi \su la \giu sol \su la \giu mi \su la 
  \giu fa \su la \giu re, \su la' \giu fa \su la \giu re, \su la' \giu fa \su la \giu re, \su la'\mbreak
  sol la si do? si do re do si la sol fa
  
  %40
  \giu \clef violin mi\p \su sol \giu do,\su sol' \giu mi \su sol \giu do,\su sol' \giu mi \su sol \giu do,\su sol'
  \giu fa \su sol \giu re \su sol \giu si,\su sol' \giu re \su sol \giu fa \su sol \giu re\su sol
  \giu mi \su sol \giu do,\su sol' \giu mi \su sol \giu do,\su sol' \giu mi \su sol \giu do,\su sol'
  
  %43
  \giu mib \su sol \giu do, \su sol'\giu do \su sol \giu  do, \su sol' \giu mib \su sol \giu do, \su sol'
  \giu fa \su lab \giu do, \su lab'\giu do \su lab \giu  do, \su lab' \giu fa \su lab \giu do, \su lab'
  \giu re, \su fa \giu sib, \su fa'\giu sib \su fa \giu  sib, \su fa' \giu re \su fa \giu sib, \su fa'
  
  %46
  \giu mib \su sol \giu sib, \su sol'\giu sib \su sol \giu  sib, \su sol' \giu mib \su sol \giu sib, \su sol'\mbreak
  \giu do, \su mib \giu lab, \su mib' \giu lab \su mib \giu lab, \su mib' \giu do \su mib \giu lab, \su mib'
  \giu re \su fa \giu lab, \su fa'\giu lab \su fa \giu  lab, \su fa' \giu re \su fa \giu lab, \su fa'
  
  %49
  \giu si,!\< \su re \giu sol, \su re' \giu sol \su re \giu sol, \su re' \giu si \su re \giu sol, \su re'\!
  r16 mib\f(re) mib-. mib8.\tr re32 mib mib8.\tr re32 mib\mbreak
  r16 mib\f(re) mib-. mib8.\tr re32 mib mib8.\tr re32 mib
  
  %52
  r16 mib\f(re) mib-. mib8.\tr re32 mib \grace fa16 mib8 re16 do
  si\p si8 do re do re si16
  do\f mib re mib \grace fa mib8 re16 mib \grace fa16 mib8 re16 do
  
  %55
  si\p si8 do re do re si16
  do\f mib re mib \grace fad? mib8 re16 mib \grace fad16 mib8 re16 do
  <<<sol' re>4\\si,>> sol r\mbreak
  
  %58
  sol'8_\markup\italic"Soave" la16(si do8) si(la) sol
  \appoggiatura \tuplet 3/2 { fad8 [sol la] } sol4. fa8 mi4
  re8. re16 mi8. mi16 fa8. fa16
  
  %61
  mi8 r \clef bass r16 mi,,(sol do) mi8 r
  \clef violin sol'8 la16(si do8) si(la) sol\mbreak
  sol16(la sol fa mi8) sol(la)\< sib
  
  %64
  \grace sib?16 la8 sol16 fa \grace sol fa8 mi16 re \grace re do8 si16 do\!
  si8.\tr do16 re8_\markup\italic"dolcis[simo]" re4  mi8
  fa fa4 fa8 \grace sol16 fa8 mi16 re
  
  %67
  do8. \tr re16 mi8 mi4 fa8
  sol sol4 sol8 \grace la16 sol8 fa16 mi\mbreak
  re8. mi16 fa8 re,4 mi8
  
  %70
  fa fa4 fa8 \grace sol16 fa8 mi16 re
  mi do' si do la\giu \clef violin fa\su sol \giu mi \su fa \giu re\su mi \giu dod
  \su r16 fa' re si sol\giu mi \su fa \giu re \su mi \giu do? \su re \giu si
  
  %73
  \su r16 do' si do la\giu fa\su sol \giu mi \su fa \giu re\su mi \giu dod
  \su r16 fa' re si sol\giu mi \su fa \giu re \su mi \giu do? \su re \giu si
  \su <mi do>4\f~<mi do>16\p do si do re fa mi sol
  
  %76
  <fa re>4\f~<fa re>16\p re dod re mi sol fa la
  <sol mi>4\f~<sol mi>16\p mi re mi fa la sol sib
  la la si!\< do \grace do si8 la16 sol \grace sol fa8 mi16 re\!\mbreak
  
  %79
  <<{<mi do>8^\f do ~do16^\p do si do}\\{\stemUp s8 \override Stem.cross-staff = ##t \override Stem.length = #13 \override Flag.style = #'no-flag \giu\clef bass \once\tieUp mi,~mi16}>> \su re' fa  mi sol
  <<{<fa re>8^\f re ~re16^\p re dod re}\\{\stemUp s8 \override Stem.cross-staff = ##t \override Stem.length = #13 \override Flag.style = #'no-flag \giu fa,~fa16}>> \su mi' sol fa la
  <<{<sol mi>8^\f mi ~mi16^\p mi re mi}\\{\stemUp s8 \override Stem.cross-staff = ##t \override Stem.length = #13 \override Flag.style = #'no-flag \giu sol,~sol16}>> \su fa' la sol sib
  
  %82
  la la si!\< do \grace do si8 la16 sol \grace sol fa8 mi16 re\!\mbreak
  mi\f(fa) fa sol sol(la) la si si(do) do re
  re(mi) mi fa <<fa2\\re>>
  
  %85
  mi8\p(re do si la sol)
  sol16 sib la do sib8 sib'4 <<sib,8\\sol>>
  <<{la16\f [la si! do]}\\fa,>> \grace do' si8 la16 sol \grace sol fa8 mi16 re\mbreak
  
  %88
  mi\f(fa) fa sol sol(la) la si si(do) do re
  re(mi) mi fa <<fa2\\re>>
  mi8\p\parentSlur (re do si la sol)
  
  %91
  sol16 sib la do sib8 sib'4 <<sib,8\\sol>>
  la16\f [la si! do] \grace do si8 la16 sol \grace sol fa8 mi16 re
  mi do mi sol do sol do mi sol mi sol do\mbreak
  
  %94
  la do la fa mi do sol mi fa re si sol
  r do mi sol do sol do mi sol mi sol do
  la do la fa mi do mi sol \grace sol fa8 mi16 re
  
  %97
  do8 sol <<<do sol>4\fermata\\mi,>> r
  
}

IIImsn = \relative do {

  do2.~
  do8 do' do, do' do, do'
  r16 sol sol,8 r16 sol' sol,8 r16 sol' sol,8

  %4
  r16 do,(mi sol) do8 r \clef violin r16 sol''(do mi)\mbreak
  \clef bass r4 do,, do~
  do8 do' do, do' do, do'

  %7
  sol si sol si do, do'
  sol,16 sol' fad sol re sol si, re sol,4
  r8 re'\< re' do si la

  %10
  si4 r sol16 re si sol
  re8 re' re'[do si la]\!
  si4 \clef violin s2

  %13
  la'4 s2
  sol4 s2\mbreak
  la4 s2

  %16
  \clef bass r16 sol,(fad sol) sol,2~
  sol16 sol'(fad sol) sol,2~
  sol16 sol'(fad sol) sol,4. sol'8

  %19
  do, do' re re re, re\mbreak
  sol,16 sol'(fad sol) sol,2~
  sol16sol'(fad sol) sol,2~

  %22
  sol16 sol'(fad sol) sol,4. sol'8
  do, do'\< re re re, re\!
  sol la si do \su \stemDown re[mi]

  %25
  fad sol la[fad re fad]
  \giu sol,2.
  sol,4. \once\stemUp sol'16[\su sol'] \giu \once\stemUp la,\su sol' \giu \once\stemUp  si,\su sol'

  %28
  \giu do,8 do, re [re re, re]
  sol' la si do \su \stemDown re[mi]
  fad sol la[fad re fad]\mbreak

  %31
  \giu sol,2.
  sol,4. \once\stemUp sol'16[\su sol'\giu \once\stemUp la,\su sol' \giu \once\stemUp  si,\su sol']
  \giu do,8 do, re [re] re, re

  %34
  sol si16 re sol8 fa!(mi) re
  <<mi4\\la,>> la2
  s2.*3
  
  %39
  \clef bass <<si'4\\sol^\f>> \once\stemUp sol,2
  s2.*10
  \clef bass <<{\shiftOn \stemDown do'2 sib4
                
                %51
                lab2 sol4
                fad fad fad}\\{\stemDown do2 sib4
                                 lab2 sol4
                                 fad fad fad}>>
  sol'8 la si! la si sol
  
  %54
  fad4 fad, fad'
  sol8 la si la si sol\mbreak
  fad4 fad, <<\stemUp fad'\\\stemUp \shiftOn fad,>>
  
  %57
  \stemNeutral sol16 sol' re si sol sol' fa,! fa' mi, mi' re, re'\mbreak
  do,2.(
  do'8) do' do, do' do, do'
  
  %60
  r16 sol sol,8 r16 sol' sol,8 r16 sol' sol,8
  r16 do,(mi sol) do8 r \clef violin r16 sol''(do mi)\mbreak
  \clef bass r4 do,, do~
  
  %63
  do8 do' do,2\<
  fa,8 fa' fa fa fad[fad]\!
  sol, (sol') sol sol sol, sol'
  
  %66
  sol, (sol') sol sol sol, sol'
  sol, (sol') sol sol sol, sol'
  sol, (sol') sol sol sol, sol'
  
  %69
  sol, (sol') sol sol sol, sol'
  sol, (sol') sol sol sol, sol'
  do,4 s2
  
  %72
  re'4 s2
  do4 s2
  mi4 s2
  
  %75
  \clef bass r16 mi, re mi do,2~
  do16 do' si do do,2~
  do16 do' si do do,2
  
  %78
  fa8 fa'\<(sol)[sol sol, sol]\!\mbreak
  \stemDown do,16 do' si do \stemUp\shiftOn  \once\tieDown do,2~
  \stemDown do16 do' si do \stemUp\shiftOn  do,2~
  
  %81
  \stemDown do16 do' si do \stemUp\shiftOn  do,4.\stemNeutral do'8
  fa, fa'\<(sol)[sol sol, sol\!]\mbreak 
  do re mi fa sol la
  
  %84
  si do re si sol si
  do,2.
  do'4.^\dolce do,16 do' re, do' mi, do'
  
  %87
  fa,8 fa sol sol sol, sol\mbreak
  do re mi fa sol la
  si do re si sol si
  
  %90
  do,2.
  do'4.do,16 do' re, do' mi, do'
  fa,8 fa sol sol sol, sol
  
  %93
  <<{do2 do4\mbreak}\\{\stemUp\shiftOn   do,2 do4}>>
  fa8 fa' sol sol sol, sol
  <<{mi'4 mi mi}\\{do do do}>>
  
  %96
  fa,8 fa' sol sol sol, sol
   <<{do4 do\fermata\mbreak}\\{\stemUp\shiftOn   do, do}>> r
   
}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \time 3/4
  \tempo 2 = 50
  \key do\major
  s2.*34
  \bar ":|."\break
  s2.*63
  \bar"|."

}

IIIvl = {
  \IIIglobal
  %\notypeset
  <<\IIIvln \forma>>

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
  <<\IIImsn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
   title = \markup\smaller"Sonata 2 per Forte-piano con Violino [Op. 5]"
   composer = \markup \center-column{"   ""L. Boccherini (1743 - 1805)"}
}

\markup \huge {[1.] Allegro e con spirito}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino"}
            \Ivl
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"bright acoustic"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Forte-piano"}
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
    >>

    \layout {

        indent = 2\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvl
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"bright acoustic"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
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
    >>

    \layout {

        indent = 1\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

\markup \huge {[3.] Allegretto }

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvl
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"bright acoustic"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
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
    >>

    \layout {

        indent = 1\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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
