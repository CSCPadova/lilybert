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

   r8 do si do sol' do, si do
   sol do si do fad(sol la) do,
   sib? sib la sib r sib la sib

   %4
   r sib la sib re(mib fa?) si,
   do16[sol sol sol sol sol sol sol] sol[sol sol sol sol sol sol sol]
   sol[sol sol sol sol sol sol sol] la[la la la la la la la]

   %7
   sib8 sib do sib r sib do sib
   r sib do sib re(do si) re\mbreak
   sol, mib' re mib sol mib re mib

   %10
   lab4 lab lab lab
   lab?8 re, do re fa re do re
   sol4 sol sol sol

   %13
   sol8 do, si do mib do si do
   fa[lab16 sol fa8 fa16 mib] re8[fa16 mib re8 re16 do]
   si8[re16 do si8 si16 la?] sol8[la16 si do re mib fa]

   %16
   sol8 sol, si, sol sol'[la16 si do re mib fa]\mbreak
   sol8 sol, si, sol r sol'' mib do
   re fa re si do mib do lab

   %19
   sol fa' re si do mib do lab
   sol fa' re si do mib do lab
   sol si re fa mib do re si

   %22
   do la'? fad do do mib do la
   la do la fad fad la' fad do
   sib? sol' la, fad'\mbreak sol sib, la sib

   %25
   r sib la sib r sib la sib
   re(mib fa) si, do do si do
   sol' do, si do sol do si do

   %28
   fad(sol la) do, sib?16[re re re re re re re]
   re[re re re re re re re] re[re re re re re re re]
   re[re re re re re re re] sol,8 mib' re mib

   %31
   r mib re mib r mib re mib
   re4 r re'8 sib la sib
   re sib la sib\mbreak mib4 mib

   %34 OOKK
   mib mib mib8 la, sol la
   do la sol la re4 re
   re re re8 sol, fa sol

   %37
   sib sol fa sol do4 do
   do do do8 fad, mi fad
   la fad mi fad re[mi16 fad sol la sib do]

   %40
   re8 la, fad re re'[mi?16 fad sol la sib do]
   re8 la, fad re r fad' re la\mbreak
   sib sib' sol re mib? sol mib do

   %43
   la mib' do la re fa? re sib
   fa' lab fa re sol sib sol mib
   re sib' fa re sol sib sol mib

   %46
   re sib' fa re sol mib fa, re'
   mib mib re mib sib' mib, re mib
   sib mib re mib la(sib do) mib,

   %49
   re re do re r re do re\mbreak
   r re do re sib(do re) fa,
   mib16[sib' sib sib sib sib sib sib] sib[sib sib sib sib sib sib sib]

   %52
   sib[sib sib sib sib sib sib sib] la[la la la la la la la]
   fa8 fa do' fa, r fa do' fa,
   r  fa do' fa, fa'(mib re) fa

   %55
   mib sol fa sol sib sol fa sol
   do4 do do do
   do8 fa, sol fa lab fa sol fa

   %58
   sib4 sib sib sib
   sib8 mib, fa mib sol mib fa mib\mbreak
   lab4 lab lab lab

   %61
   lab?8 [lab16 sol fa8 fa16 mib] re8[fa16 mib re8 re16 do]
   sib8[lab'16 sol fa8 fa16 mib] re8 [fa16 mib re8 re16 do]
   si8[fa'16 mib re8 re16 do] si8[re16 do si8 si16 \once\set suggestAccidentals = ##t la?]

   %64
   sol8[fa'16 mib re8 re16 do] si8[re16 do si8 si16 la]\mbreak
   sol[sol sol sol sol sol sol sol] lab[lab lab lab lab lab lab lab]
   lab?[lab lab lab lab lab lab lab] lab lab lab lab sol sol sol sol

   %67
   do do do do do do do do do do do do si si si si
   fa'8[lab16 sol fa8 fa16 mib] re8 [fa16 mib re8 re16 do]
   si8[re16 do si8 si16 la?] sol8[la16 si do re mib fa]

   %70
   sol8 sol, si, sol sol'8[la16 si do re mib fa]
   sol8 sol, si, sol r sol'' mib do\mbreak
   re fa re si do mib do lab

   %73
   sol fa' re si do mib do lab
   sol fa' re si do mib do lab
   sol si re fa mib do re si

   %76
   do sol' mib do si lab' fa re
   mib do re si do2\fermata

}

IvlIIn = \relative do'' {
                         
   R1*2
   r8 sol fad sol re' sol, fad sol
   re sol fad sol si(do re) fa,?
   
   %5
   mib mib re mib r mib re mib
   r mib re mib la(sib do) fad, 
   sol16[re re re re re re re] re [re re re re re re re]
   
   %8
   re [re re re re re re re] re [re re re re re re re]\mbreak
   mib8 do' si do mib do si do
   do4 fa fa fa
   
   %11
   fa8 sib, la? sib re sib la sib
   sib4 mib mib mib
   mib8 lab, sol lab do lab sol lab
   
   %14
   re4 r fa8[lab16 sol fa8 fa16 mib] 
   re8[fa16 mib re8 re16 do] si8 sol si, sol
   sol'[la16 si do re mib fa] sol8 sol, si, sol\mbreak
   
   %17
   sol'[la16 si do re mib fa] sol4 r
   r8 lab fa re mib sol mib do
   si re si sol mib' sol mib do
   
   %20
   si re si sol mib' sol mib do
   si re fa lab sol mib fa re
   mib mib do la la do la fad
   
   %23
   fad? la fad! re re fad' do la
   sol sib la la\mbreak sol sol fad sol
   re' sol, fad sol re sol fad sol
   
   %26
   si(do re) fa,? mib16[sol sol sol sol sol sol sol]
   sol[sol sol sol sol sol sol sol] sol[sol sol sol sol sol sol sol]
   fad[fad fad fad fad fad fad fad] \once\stemUp sol8 sib' la sib
   
   %29
   r sib la sib r sib la sib
   re,(mib fa) si, do do sol' do,
   r do sol' do, r do sol' do,
   
   %32
   la'(sol fad) la sib sol fad sol
   sib sol fad sol\mbreak sol4 do
   do do do8 fa,? mib fa
   
   %35
   la fa mib fa fa4 sib
   sib sib sib8 mib, re mib
   sol mib re mib mib4 la
   
   %38
   la la la8 re, do re
   fad re do re fad la, fad re
   re'[mib16 fad sol la sib do] re8 la, fad re 
   
   %41
   re'[mib16 fad sol la sib do] re8 la fad re\mbreak
   re sol re sib sol mib' do sol
   fa do' la fa fa re' sib fa
   
   %44
   re' fa re sib mib sol mib sib
   sib fa' re sib mib sol mib sib
   sib fa' re sib sib mib fa, re'
   mib sol fa sol r sol fa sol
   
   %48
   r sol fa sol do, \parentSlur (re mib) do
   sib sib la sib fa' sib, la sib\mbreak
   fa sib la sib re(mib fa) lab,
   
   %51
   sol sol fa sol r sol fa sol
   r sol fa sol do(re mib) do
   sib16[fa' fa fa fa fa fa fa]  fa[fa fa fa fa fa fa fa]
   
   %54
   fa[fa fa fa fa fa fa fa] fa[fa fa fa fa fa fa fa]
   sol8 mib re mib sol mib re mib
   mib4 lab lab lab
   
   %57
   lab?8 re, mib re fa re mib re
   re4 sol sol sol
   sol8 do, re do mib do re do\mbreak
   
   %60
   do4 fa fa fa
   fa r r8 lab16[sol fa8 fa16 mib]
   re8[fa16 mib re8 re16 do] sib8[lab'16 sol fa8 fa16 mib]
   
   %63
   re8[re16 do si8 si16 la] sol8[fa'16 mib re8 re16 do]
   si8[re16 do si8 si16 la] sol8[fa'16 mib re8 re16 do]
   si16[sol sol sol sol sol sol sol] sol[sol sol sol sol sol sol sol]
   
   %66
   fa[fa fa fa fa fa fa fa] \once\set suggestAccidentals = ##t sib? sib sib sib sib sib sib sib
   sib sib sib sib \once\set suggestAccidentals = ##t la? la la la re re re re re re re re
   re4 r fa8[lab16 sol fa8 fa16 mib]
   
   %69
   re8[fa16 mib re8 re16 do] si8 sol si, sol
   sol'[la16 si do re mib fa] sol8 sol, si, sol
   sol'[la16 si do re mib fa] sol4 r\mbreak
   
   %72
   r8 lab fa re mib sol mib do
   si re si sol mib' sol mib do
   si re si sol mib' sol mib do
   
   %75
   si re fa lab sol mib fa re
   mib do' sol mib re fa re si
   do mib fa re mib2\fermata
   
}

Ivlan = \relative do' {
   
   R1*4
   r8 do si do sol' do, si do
   sol do si do fad(sol la) do,
   
   %7
   \once\set suggestAccidentals = ##t sib? sib la sib r sib la sib
   r sib la sib re \parentSlur (mib fa) si,\mbreak
   do4 do do sol'
   
   %10
   do8 lab sol lab do lab sol lab
   re,4 re re fa
   sib8 sol fa sol sib sol fa sol
   
   %13
   do,4 do do do
   si si si si
   si? si re8 sol si, sol
   
   %16
   r sol' si, sol r sol' si, sol\mbreak
   r sol' si, sol mib' fa sol lab
   sol1~
   
   %19
   sol~
   sol~
   sol2~sol4. si,8
   
   %22
   la?1~
   la
   re8 re re re\mbreak re16[re re re re re re re]
   
   %25
   re[re re re re re re re] re[re re re re re re re]
   si [si si si si si si si] sol8 mib' re mib
   r mib re mib r mib re mib
   
   %28
   la(sib? do) fad, re sol fad sol
   re' sol, fad sol re sol fad sol
   si(do re) fa,? mib16[sol sol sol sol sol sol sol]
   
   %31
   sol[sol sol sol sol sol sol sol] sol[sol sol sol sol sol sol sol]
   la8(sib? do) fad, sol4 re
   re re\mbreak sol8 mib re mib %%% inizio p 3
   
   %34
   sol mib re mib la,4 la
   la la fa'8 re do re
   fa re do re sol,4 sol
   
   %37
   sol sol mib'8 do sib do
   mib do sib do fad,4 fad
   fad? fad r8 la' fad re
   
   %40
   r la' fad re r la' fad re
   r la' fad re la'4. fad8\mbreak
   re4. sol8 sol4. mib8
   
   %43
   do2 sib~
   sib1~
   sib~
   
   %46
   sib2~sib8 sib sib sib
   sol16[sib sib sib sib sib sib sib] sib[sib sib sib sib sib sib sib]
   sib[sib sib sib sib sib sib sib] la[la la la la la la la]
   
   %49
   fa[fa' fa fa fa fa fa fa] fa[fa fa fa fa fa fa fa]\mbreak
   fa[fa fa fa fa fa fa fa] fa fa fa fa re re re re
   sib8 mib re mib sib' mib, re mib
   
   %52
   sib mib re mib la?(sib do) mib,
   re re do re r re do re
   r re do re sib(do re) do
   
   %55
   sib4 sib sib sib
   mib8 do re do mib do re do
   fa4 fa fa fa
   
   %58
   re8 sib do sib re sib do sib
   mib4 mib mib mib\mbreak
   do8 lab sib lab do lab sib lab
   
   %61
   re4 re re re
   re re re re
   re fa fa fa
   
   %64
   fa fa fa fa
   re16[re re re re re re re] mib[mib mib mib mib mib mib mib]
   sib[sib sib sib sib sib sib sib] fa' fa fa fa mib mib mib mib
   
   %67
   sol sol sol sol fa fa fa fa la la la la sol sol sol sol
   si,4 si si si
   si? si re8 sol si,! sol
   
   %70
   r sol' si, sol r sol' si, sol
   r sol' si, sol mib' fa sol lab\mbreak
   sol1~
   
   %73
   sol~
   sol~
   sol2~sol8 sol lab sol
   
   %76
   sol1~
   sol8 sol lab sol sol2\fermata

}


Ibcn = \relative do {

   R1*6
   r8 sol' fad sol re' sol, fad sol
   re sol fad sol si(do re) fa,?\mbreak
   
   %9
   mib4 mib do do
   lab'8 fa mib fa lab fa mib fa
   sib,4 sib sib sib
   
   %12
   sol'8 mib re mib sol mib re mib
   lab,4 lab lab lab
   sol sol sol sol
   
   %15
   sol sol sol8 sol' si, sol
   r sol' si, sol r sol' si, sol\mbreak
   r sol' si, sol do re mib fa
   
   %18
   sol1\tasto~
   sol~
   sol~
   
   %21
   sol2 do,8 do sol' sol,
   fad1~
   fad
   
   %24
   sol8 sol' re' re,\mbreak sol, sol' re sol
   r sol re sol r sol re sol
   sol,2 do8 do sol do
   
   %27
   r do sol do r do sol do
   re2 sol,8 sol' re sol
   r sol re sol r sol re sol
   
   %30
   sol,2 do8 do si do
   sol' do, si do sol do si do
   fad sol la do, sib4 sib
   
   %33
   sib sol'\mbreak mib8 do sib do
   mib do sib do fa,4 fa 
   fa fa re'8 sib la sib
   
   %36
   re sib la sib mib,4 mib
   mib mib do'8 la sol la
   do la sol la re,4 re
   
   %39
   re re r8 la'' fad re
   r la' fad re r la' fad re
   r la' fad re re2\mbreak
   
   %42
   sol do,
   fa sib,\tasto~
   sib1~
   
   %45
   sib~
   sib2 mib8 mib sib' sib,
   mib mib sib mib r mib sib mib
   
   %48
   r mib sib mib fa2
   sib,8 sib fa sib r sib fa sib\mbreak
   r sib fa sib sib2
   
   %51
   mib,8 mib' sib mib r mib sib mib
   r mib sib mib fa2
   sib,8 sib la sib re sib fa sib
   
   %54
   fa sib la sib re(mib fa) lab,
   sol4 mib' mib mib
   do'8 lab sib lab do lab sib lab
   
   %57
   re,4 re re re
   sib'8 sol lab sol sib sol lab sol
   do,4 do do do\mbreak
   
   %60
   lab'8 fa sol fa lab fa sol fa
   sib,4 sib sib sib
   sib sib sib sib
   
   %63
   sol' sol, sol sol
   sol sol sol sol
   sol'16[sol sol sol sol sol sol sol] do,[do do do do do do do]
   
   %66
   re[re re re re re re re] re re re re mib mib mib mib
   mi mi mi mi fa fa fa fa fad fad fad fad sol sol sol sol
   sol,4 sol sol sol
   
   %69
   sol sol sol8 sol' si, sol
   r sol' si, sol r sol' si, sol
   r sol' si, sol do, re mib fa\mbreak
   
   %72
   sol1~
   sol~
   sol~
   
   %75
   sol2 do8 do fa sol
   do,2 sol'
   do,8 do fa, sol do,2\fermata

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s1*6
   s4 <6 5> s <6 5>
   s <6 5> s s8 <6 4!>
   s1
   s
   <7->
   s
   <7>
   <7 _!>
   s1*2
   s2 s4 s8 <_->
   s1*4
   <7>1
   s
   s2 s4 <_+>
   s4 <_+> s <_+>
   <_!>2 s4 <_!>
   s <_!> s <_!>
   <_+>4 <7> s4 <_+>
   s <_+> s <_+>
   <_!>1
   s1*3
   s2 <7>
   s1
   s2 <7>
   s1
   s2 <7 _+>
   s1*4
   <7>1
   s1*13
   <7 5->1
   s
   <7>
   s
   <7>
   s
   <_!>4 <7> s2
   s1
   s2 <6- 5>
   <6 5-> s
   <6 5> <6 5>
   <7 _!>1
   s1*7
   s2 <_!>

}

forma = {

   \time 4/4
   \key sol\minor
   \tempo 2 = 67
   s1*77
   \bar"||"

}



IvlI = {
   \global
   \notypeset
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
}

IIvlIn = \relative do'' {
   
   mib8 mib mib mib mib16. lab32 lab16. do32 do16. lab32 lab16. fa32
   fa8 fa fa fa sol16. sib32 sib16. mib32 mib16. sib32 sib16. sol32
   sol8 sol sol sol fa16. lab32 lab16. do32 do16. lab32 lab16. fad32\mbreak
   fad?8 fad fad fad sol16. sib32 sib16. re32 re16. sib32 sib16. sol32
   sol8 sol sol sol lab lab lab lab
   lab? lab lab lab sol sol sol sol
   sol sol sol sol fad fad fad fad
   sol16. si32 si16. re32 re16. si32 si16. fa?32 fa8 fa fa fa
   mib16. sol32 sol16. do32 do16. sol32 sol16. mib32 mib8 mib mib mib
   re re re re re re re re
   mib1\fermata

}

IIvlIIn = \relative do'' {
   
   do8 do do do do16. fa32 fa16. lab32 lab16. fa32 fa16. re32
   re8 re re re sib16. sol'32 sol16. sib32 sib16. sol32 sol16. mi32
   mi?8 mi mi mi do16. fa32 fa16. lab32 lab16. fa32 fa16. do32\mbreak
   do8 do do do sib16. sol'32 sol16. sib32 sib16. sol32 sol16. re32
   mib8 mib mib mib fa fa fa fa
   re re re re re re re re
   do do do do do do do do
   si16. sol'32 sol16. si32 si16. sol32 sol16.  re32 re8 re re re
   do16. mib32 mib16. sol32 sol16. mib32 mib16. do32 do8 do do do
   do do do do si si si si 
   do1\fermata
   
}

IIvlan = \relative do' {
   
   sol'8 sol sol sol lab4 r
   lab8 lab lab lab sol4 r
   sib8 sib sib sib lab4 r\mbreak
   la!8 la la fad re4 r
   do8 do do do do do fa fa
   fa fa fa fa sol sol sol sol
   mib mib mib mib re re re re\mbreak
   re4 r si'8 si si si
   sol4 r la!8 la la la
   re, re re re sol sol sol sol
   sol1\fermata
   
}


IIbcn = \relative do {
   
  do8 do do do fa4 r
  sib,8 sib sib sib mib4 r
  do8 do do do fa4 r\mbreak
  re8 re re re sol4 r
  do,8 do do do fa fa fa fa
  si, si si si sib sib sib sib
  la la la la lab lab lab lab
  sol4 r sol8 sol sol sol
  do4 r fad8 fad fad fad
  sol sol sol sol sol, sol sol sol
  do1\fermata
  
}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s2 <7 _->
    <7->1
    <7 _!>2 <_->
    <7 _+>1
    s2 <_->
    <7> <6>
    <7> <6+>
    <_!>1
    s2 <7>
    <5 4> <3 !>

}

forma = {

    \time 4/4
    \key sib\major
    \tempo 4 = 40
    s1*11
    \bar"||"

}



IIvlI = {
    \global
    \notypeset
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
   
   do8 mib do do mib do sol'4. sol
   mib8 sol mib mib sol mib re4. re
   mib8 sol mib mib sol mib lab2.~
   
   %4
   lab sol~
   sol fa~
   fa mib8 sol mib mib sol mib\mbreak
   
   %7
   fa lab fa fa lab fa mib sol mib mib sol mib
   fa lab fa fa lab fa mib mib do sol do sol
   mib sol mib do mib do sol mib'' do sol do sol
   
   %10
   mib sol mib do mib do sol4 fa''8\p fa4 fa8
   fa lab sol fa4 fa8 fa lab sol fa4 fa8
   fad2.\f sol8 \once\set suggestAccidentals = ##t la? sib sol la fad\mbreak
   
   %13
   sol4. r re8 fad re re fad re
   sol4. sol fad8 la fad fad la fad
   sol sib sol sol sib sol sol2.
   
   %16
   la8 do la la do la la2. 
   sol8 sib sol sol sib sol sol2.
   fad8 la fad fad la fad sol sib sol sol sib sol\mbreak
   
   %19
   fad la fad fad la fad sol sib sol sol sib sol
   fad re la fad la fad re re' la fad la fad
   re sol re sib re sib sol sol' re sib re sib
   
   %22
   sol4 re''8 re4 re8 re fa? mib re4 re8
   re fa mib re4 re8 mib2.~
   mib4 do8 do4 do8\mbreak do mib re do4 do8
   
   %25
   do mib re do4 do8 re2.~
   re4 lab'8 lab4 lab8 lab do sib lab4 lab8
   lab? do sib lab!4 lab8 sol sib sol fa lab fa
   
   %28
   sol sib sol fa lab fa sol4 mib8 mib4 re8
   mib sib' sol sol sib sol fa4. fa
   sol r\mbreak sib, 8re sib sib re sib
   
   %31
   sib'2. lab8 do lab lab do lab
   sib2. lab4 lab8 sol4 sol8\mbreak
   fa lab fa fa lab fa do'4. do
   
   %34
   lab8 do lab lab do lab sol4. sol
   lab8 do lab lab do lab reb2.~
   reb do~
   
   %37
   do sib~
   sib lab~
   lab\mbreak  sol8 mib do sol do sol
   
   %40
   mib sol mib do mib do sol mib'' do sol do sol
   mib sol mib do mib do sol4. r
   do'8 mib do do mib do sol'4. sol
   
   %43
   do,8 mib do do mib do sol'4. sol
   sol4 mib8 re4 re8 do2.\fermata

}

IIIvlIIn = \relative do'' {
   
   r2. sol8 si sol sol si sol
   do4. do si8 re si si re si
   sol'4. do, do2.
   
   %4
   re8 fa re re fa re re2.
   do8 mib do do mib do do2.
   si8 re si si re si do mib do do mib do\mbreak
   
   %7
   do fa do do fa do do mib do do mib do
   do fa do do fa do do mib do sol do sol
   mib sol mib do mib do sol mib'' do sol do sol
   
   %10
   mib sol mib do mib do sol4 re''8\p re4 re8
   re fa mib re4 re8 re fa mib re4 re8
   do2.\f sib8 do re sib do la\mbreak
   
   %13
   sol sib sol sol sib sol re'4. re
   sib8 re sib sib re sib la re la la re la
   sib re sib sib re sib mib2.~
   
   %16
   mib re~
   re do~
   do sib8 sol' re re sol re\mbreak
   
   %19
   re fad re re fad re re sol re re sol re
   re re la fad la fad re re' la fad la fad
   re sol re sib re sib sol sol' re sib re sib
   
   %22
   sol4 sib'8 sib4 sib8 si re do si4 si8
   si? re do si!4 si8 do2.~
   do4 la8 la4 la8\mbreak la do sib?  la4 la8
   
   %25
   la do sib la4 la8 sib2.~
   sib4 fa'8 fa4 fa8 fa lab sol fa4 fa8
   fa lab sol fa4 fa8 mib sol mib re fa re
   
   %28
   mib sol mib re fa re mib4 sol,8 fa4 fa8 
   sol4. r r2.
   mib8 sol mib mib sol mib\mbreak sib' fa' re re fa re
   
   %31
   sol2. fa8 lab fa fa lab fa
   sol2. fa4 fa8 fa4 mi8\mbreak
   fa4. r do8 mi do do mi do
   
   %34
   fa4. fa mi8 sol mi mi sol mi
   fa lab fa fa lab fa fa2.
   sol8 sib sol sol sib sol sol2.
   
   %37
   fa8 lab fa fa lab fa fa2.
   mi8 sol mi mi sol mi mib2.
   re8 fa re re fa re\mbreak mib mib do sol do sol
   
   %40
   mib sol mib do mib do sol mib'' do sol do sol
   mib sol mib do mib do sol4. r
   mib''8 sol mib mib sol mib re4. re
   
   %43
   mib8 sol mib mib sol mib re4. re
   mib4 do8 do4 si8 do2.\fermata
   
}

IIIvlan = \relative do' {
   
   R1.
   r2. sol'8 si sol sol si sol
   do4. do lab8 do lab lab do lab
   
   %4
   fa2. sol8 sib sol sol sib sol
   mib2. fa8 lab fa fa lab fa
   re4. sol sol8 do sol sol do sol\mbreak
   
   %7
   lab do lab lab do lab sol do sol sol do sol
   lab do lab lab do lab sol mib' do sol do sol
   mib sol mib do mib do sol mib'' do sol do sol
   
   %10
   mib sol mib do mib do sol4 sol'8\p sol4 sol8
   sol4 sol8 sol4 sol8 sol4 sol8 sol4 sol8
   la?4\f la8 la4 fad8 re4 re8 re4 re8\mbreak
   
   %13
   re4. re r2.
   sol,8 sib sol sol sib sol re'4. re
   re re mib8 sol mib mib sol mib
   
   %16
   do2. re8 fa re re fa re
   sib2. do8 mib do do mib do
   la2. re8 re' sib sib re sib\mbreak
   
   %19
   la re la la re la sib re sib sib re sib
   la re la fad la fad re re' la fad la fad
   re sol re sib re sib sol sol' re sib re sib
   
   %22
   sol4 sol'8 sol4 sol8 sol4 sol8 sol4 sol8
   sol4 sol8 sol4 sol8 sol4 sol8 sol4 sol8
   la4 la8 fa4 fa8\mbreak fa4 fa8 fa4 fa8
   
   %25
   fa4 fa8 fa4 fa8 fa4 fa8 fa4 fa8
   re4 re8 re4 re8 re4 re8 re4 re8
   re4 re8 re4 re8 sib4 sib'8 sib4 sib8
   
   %28
   sib4 sib8 sib4 sib8 sib4 sib,8 sib4 sib8
   sib4. r sib8 re sib sib re sib
   mib4. mib\mbreak fa fa
   
   %31
   mi2. do
   mi do4 do8 do4 do8\mbreak
   do4. r r2.
   
   %34
   fa8 lab fa fa lab fa do'4. do
   lab fa reb8 fa reb reb fa reb
   sib2. do8 mib do do mib do
   
   %37
   lab?2. sib8 reb sib sib reb sib
   sol2. lab8 do lab lab do lab
   fa'2.\mbreak mib8 mib' do sol do sol
   
   %40
   mib sol mib do mib do sol mib'' do sol do sol
   mib sol mib do mib do sol4. r
   r2.  sib'8 re sib sib re sib
   
   %43
   sol4. sol si8 re si si re si
   do4 sol8 sol4 sol8 sol2.\fermata
   
}


IIIbcn = \relative do {
   
   R1.
   do8 mib do do mib do sol'4. sol
   do,8 mib do do mib do fa lab fa fa lab fa
   
   %4
   sib, re sib sib re sib mib sol mib mib sol mib
   lab, do lab lab do lab re fa re re fa re
   sol, si sol sol si sol do do' do, do do' do,\mbreak
   
   %7
   do do' do, do do' do, do do' do, do do' do,
   do do' do, do do' do, do mib' do sol do sol
   mib sol mib do mib do sol mib'' do sol do sol
   
   %10
   mib sol mib do mib do sol4. r
   R1.
   re'8 re' re, re re' re, sol4 sol,8 re'4 re,8\mbreak
   
   %13
   sol4. sol r2.
   r re'8 fad re re fad re
   sol4. sol do,8 mib do do mib do
   
   %16
   fa?  la fa fa la fa sib, re sib sib re sib
   mib sol mib mib sol mib la, do la la do la
   re fad re re fad re re re' re, re re' re,\mbreak
   
   %19
   re re' re, re re' re, re re' re, re re' re,
   re re' la fad la fad re re' la fad la fad
   re sol re sib re sib sol sol' re sib re sib
   
   %22
   sol1.~
   sol2. do8 do' do, do do' do,
   fa1.~
   
   %25
   fa2. sib,8 sib' sib, sib sib' sib,
   sib1.~
   sib2. mib4 mib8 sib4 sib8
   
   %28
   mib4 mib8 sib4 sib8 mib4 mib8 sib'4 sib,8
   mib sol mib mib sol mib sib'4. sib
   sol8 mib sol sol mib sol\mbreak sib,4. sib'
   
   %31
   do,8 do' do, do do' do, fa2.
   do8 do' do, do do' do, fa4 fa8 do'4 do,8\mbreak
   fa,4. r r2.
   
   %34
   r do'8 mi do do mi do 
   fa4. fa sib8 reb sib sib reb sib
   mib, sol mib mib sol mib lab do lab lab do lab
   
   %37
   reb, fa reb reb fa reb sol sib sol sol sib sol
   do, mi do do mi do fa lab fa fa lab fa
   si, re si si re si\mbreak do mib' do sol do sol
   
   %40
   mib sol mib do mib do sol mib'' do sol do sol
   mib sol mib do mib do sol4. r
   r2. <<{sol'8 si sol sol si sol
          
          %43
          do4. do sol8 si sol sol si sol}\\{sol,2.~
                                            sol~sol}>>
   do4 do8 sol'4 sol,8 do2.\fermata
 
}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1.*3
    <7>2. <7>
    <7> <7>
    <7>1.
    <6- 4>2. <5 3>
    <6- 4> <5 3>
    s1.*3
    <_+>1.
    s1.*3  
    <7>2. <7>
    <7> <7>
    <7> <6 4>
    <5 3+> <6 4>
    <5 3+> s
    s1.
    <7 _!>
    s 
    <7>
    s
    <7->
    s
    s2. s4. <5 4>4 <3>8
    s1.*2
    <7 _!>2. <_->
    <7 _!> s4. <5 4>4 <3!>8
    s1.*2
    <_->2. <_->
    <7-> <7>
    <7> <7>
    <7> <7 _->
    <7-> s
    s1.*4
    s4. <5 4>4 <3!>8
    
}

forma = {

    \time 12/8
    \key sib\major
    \tempo 2. = 70
    s1.*44
    \bar"|."

}



IIIvlI = {
    \global
    \notypeset
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

    r8 re sol re do' sib4 la8~
    la re, fa re sib' la4 sol8~
    sol do, mib do fad la4 re,8~

    %4
    re do4 sib16 la re8[sol,16 fad sol la sib do]
    re(do) re8 re16(do) re8 re4 r
    do16(sib) do8 do16(sib) do8 do4 r

    %7
    la'8[re,16 do re mi fad sol]\mbreak la fad sol la re, fad sol la
    sib(la) sib8 sib16(la) sib8 sib16 do, re do sib' do, re do
    la'(sol) la8 la16(sol) la8 la16 sib, do sib la' sib, do sib

    %10
    sol'(fa) sol8 sol16(fa) sol8 sol16 la, sib la sol' la, sib la
    fad'8[re16 do re mi fad sol] la(sol) la8 la16(sol) la8
    la[re,16 do re mi fad sol] la(sol) la8 la16(sol) la8\mbreak

    %13
    sib8 sol sol16(fad) sol8 fad16(mi) fad8 fa16(mi) fa8
    mi16(re) mi8 mib16(re) mib8 re sib' sib16(la) sib8
    la16(sol) la8 la16(sol) la8 sol16(fad) sol8 sol16(fad) sol8

    %16
    fad16 sol la sol fad re mi fad sol[la sib la sol \once\set suggestAccidentals = ##t fa? mi re]
    dod(mi la) la re,(fa la) la dod,(mi la) la re,(fa la) la
    dod,(mi la) la re,(fa la) la\mbreak dod,8 re re dod

    %19
    re la re la sol' fa4 mi8~
    mi la, do la fa' mi4 re8~
    re sol, sib sol dod mi4 la,8~

    %22
    la sol4 fa16 mi la8[re,16 dod re mi fa sol]
    la16(sol) la8 la16(sol) la8 la4 r
    sol16(fa) sol8 sol16(fa) sol8 sol4 r\mbreak

    %25
    mi'8[la,16 sol la si dod re] mi dod re mi la, dod re mi
    fa[fa fa fa fa fa fa fa] fa[mi re \set suggestAccidentals = ##t do? sib? la sol fa]
    mi'[mi mi mi mi mi mi mi] mi[re do sib la sol fa mi]

    %28
    re'[re re re re re re re] re[do sib la sol fa  mi re]\set suggestAccidentals = ##f
    dod'[dod dod dod dod dod dod dod] fa8 re re16(dod) re8
    dod16(si) dod8 do16(si) do8\mbreak si16(la) si8 sib16(la) sib8

    %31
    la fa' fa16(mi) fa8 mi16(re) mi8 mi16(re) mi8
    re16(dod) re8 re16(dod) re8 dod[la16 sol la si dod re]
    mi(re) mi8 mi16(re) mi8 mi[la,16 sol la si dod re]

    %34
    mi(re) mi8 mi16(re) mi8 fa16[sol fa mi re do sib la]
    re[mi re do sib la sol fa] mi[fa sol la sib do re mi]
    fa8 la, sib sol fa' la, sib sol\mbreak %%% fine p. 3

    %37
    la do fa do sib' la4 sol8~
    sol do, mi do la' sol4 fa8~
    fa sib, re sib mi sol4 do,8~

    %40
    do sib4 la16 sol do8[fa,16 mi fa sol la sib]
    do(sib) do8 do16(sib) do8  do4 r
    sib16(la) sib8 sib16(la) sib8 sib4 r

    %43
    sol'8[do,16 sib do re mi fa] sol mi fa sol do, mi fa sol\mbreak
    la(sol) la8 la16(sol) la8 la16 sib, do sib la' sib, do sib
    sol'(fa) sol8 sol16(fa) sol8 sol16 la, sib la sol' la, sib la

    %46
    fa'16(mi) fa8 fa16(mi) fa8  fa8 mib4 re8~
    re do4 sib8 la16(do fa) fa sib,(re fa) fa
    la,(do fa) fa sib,(re fa) fa la,(do fa) fa sib,(re fa) fa

    %49
    la,[sib do re  mib fa sol la]\mbreak sib8 re, do la'
    sib fa, sib fa mib'8 re4 do8~
    do fa, la fa re' do4 sib8~

    %52
    sib mib, sol mib la do4 fa,8~
    fa mib4 re16 do fa8[sib16 la sib do re mib]
    fa(\once \override AccidentalSuggestion.avoid-slur = #'inside \once\set suggestAccidentals = ##t mib?) fa8 fa16(mib) fa8 fa4 r

    %55
    mib16(re) mib8 mib16(re) mib8 mib4 r\mbreak
    do8[fa,16 \once\set suggestAccidentals = ##t mib? fa sol la sib] do la sib do fa, la sib do
    re8[sib16 la sib do re mib] fa8 fa4 mib16 re

    %58
    mib8[do16 si do re mib fa] sol8 sol4 fa16 mib
    lab8 lab4 sol16 fa mib8 do sol si
    do sol do sol fa' mib4 re8~

    %61
    re8 sol, sib sol mib' re4 do8~
    do fa, lab fa si re4 sol,8~
    sol fa4 mib16 re sol8[do16 si do re mib fa]

    %64
    sol(fa) sol8 sol16(fa) sol8 sol4 r
    fa16(mib) fa8 fa16(mib) fa8 fa4 r
    re8[sol,16 fa sol la si do] re si do re sol, si do re

    %67
    mib8 sol4 mib8~mib re4 do8\mbreak
    sib[sol16 fad sol la sib do] re(do) re8 re16(do) re8
    re[sol,16 fad sol la sib do] re(do) re8 re16(do) re8

    %70
    re re sol re do' sib4 la8~
    la re, fa re sib' la4 sol8~
    sol do, mib do fad la4 re,8~

    %73
    re do4 sib16 la\mbreak sib8 sol' sol16(fad) sol8
    fad16(mi) fad8 fa16(mi) fa8 mi16(re) mi8 mib16(re) mib8
    re8 sib' sib16(la) sib8 la16(sol) la8 la16(sol) la8

    %76
    sol16(fad) sol8 sol16(fad) sol8\mbreak fad16 sol la sol fad re mi fad
    sol8 sol sol fad sol2\fermata

}

IVvlIIn = \relative do'' {

    R1*3
    r2 r8 re sol re
    do' sib4 la8~la re, fa re

    %6
    sib' la4 sol8~sol do, mib do
    fad la4 re,8~\mbreak re do4 sib16  la
    re4 r mib16(re) mib8 mib16(re) mib8

    %9
    mib?16 fa, sol fa mib' fa, sol fa re'(do) re8 re16(do) re8
    re16 mib, fa mib re' mib, fa mib do'(sib) do8 do16(sib) do8
    do2 fad8[re16 do re mi fad sol]

    %12
    la(sol) la8 la16(sol) la8 fad[re16 do re mi fad re]\mbreak
    re4 r r2
    r r8 sol sol16(fad) sol8

    %15
    fad16(mi) fad8 fa16(mi) fa8 mi16 (re) mi8 mib16(re) mib8
    re fad la16 fad sol la re,4. re8
    la16(dod mi) mi la,(re fa) fa la,(dod mi) mi la,(re fa) fa

    %18
    la,(dod mi) mi la,(re fa) fa\mbreak mi8 fa mi4
    \once\stemDown  fa8[re,16 dod re mi fa sol] la(sol) la8 la16(sol) la8
    la4 r sol16(fa) sol8 sol16(fa) sol8

    %21
    sol4 r mi'8[la,16 sol la si dod re]
    mi dod re mi la, dod re mi fa8 la, re la
    sol' fa4 mi8~mi la, do la

    %24
    fa' mi4 re8~re sol, sib sol\mbreak
    dod mi4 la,8~la sol4 fa16 mi
    la4 r sib16[sib sib sib sib sib sib sib]

    %27
    sib[la sol fa mi re do sib] la'[la la la la la la la]
    la[sol fa mi re do sib la] sol'[sol sol sol sol sol sol sol]
    sol[fa mi re do sib la sol] la4 r

    %30
    R1
    r8 re' re16(dod) re8 dod16(si) dod8 do16(si) do8
    si16(la) si8 sib16(la) sib8 la4 r

    %33
    r8 la16[sol la si dod re] mi(re) mi8 mi16(re) mi8
    mi[la,16 sol la si dod la] la4 r
    fa'16[sol fa mi re \set suggestAccidentals = ##t do? sib? la] sol[la sib do re mi fa sol]

    %36
    la8 fa sol mi la fa sol mi\mbreak\set suggestAccidentals = ##f
    fa[fa,16 mi fa sol la sib] do(sib) do8 do16(sib) do8
    do4 r sib16(la) sib8 sib16\parentSlur (la) sib8

    %39
    sib4 r sol'8[do,16 sib do re mi fa]
    sol mi fa sol do, mi fa sol la8 do, fa do
    sib' la4 sol8~sol do, mi do

    %42
    la' sol4 fa8~fa sib, re sib
    mi sol4 do,8~do sib4 la16 sol\mbreak
    do4 r re16(do) re8 re16(do) re8

    %45
    re16 mi, fa mi re' mi, fa mi do'(sib) do8 do16(sib) do8
    do16 re, mi re do' re, mi re sib'8 sib4 sib8~
    sib la4 sol8 fa16(la do) do fa,(sib re) re

    %48
    fa,16(la do) do fa,(sib re) re fa,16(la do) do fa,(sib re) re
    fa,[sol la sib do re mib fa]\mbreak re8 sib la do
    re[sib16 la sib do re mib] fa\parentSlur(mib) fa8 fa16\parentSlur(mib) fa8

    %51
    fa4 r mib16(re) mib8 mib16(re) mib8
    mib?4 r do8[fa,16 \once\set suggestAccidentals = ##t mib? fa sol la sib]
    do la sib do fa, la sib do re8 fa, sib fa

    %54
    mib' re4 do8~do fa, la fa
    re' do4 sib8~sib mib, sol mib\mbreak
    la8 do4 fa,8~fa mib4 re16 do

    %57
    fa4 r re'8 re4 do16 si
    do4 r mib8 mib4 re16 do
    do8 fa4 mib16 re do8 mib re re

    %60
    do[do16 si do re mib fa] sol(fa) sol8 sol16(fa) sol8
    sol4 r fa16(mib) fa8 fa16(mib) fa8\mbreak
    fa4 r re8[sol,16 fa sol la si do]

    %63
    re si do re sol, si do re mib8 sol, do sol
    fa'8 mib4 re8~re sol, \once\set suggestAccidentals = ##t sib? sol
    mib' re4 do8~do fa, lab fa

    %66
    si re4 sol, fa mib16 re
    sol8 mib'4 do8~do \once\set suggestAccidentals = ##t sib?4 la8\mbreak
    re16(do) re8 re16(do) re8 re[sol,16 fad sol la sib do]

    %69
    re(do) re8 re16(do) re8 re[sol,16 fad sol la sib do]
    re8[sol,16 fad sol la sib do]  re(do) re8 re16(do) re8
    re4 r do16(sib) do8 do16(sib) do8

    %72
    do4 r la'8[re,16 do re mi fad sol]
    la fad sol la re, fad sol la\mbreak sib4 r
    R1

    %75
    r8 sol sol16(fad) sol8  fad16(mi) fad8 fa16(mi) fa8
    mi16(re) mi8 mib16(re) mib8\mbreak re fad la16 fad sol la
    sib8 sib, la la sol2\fermata

}

IVvlan = \relative do' {

    sib'4 sib la la
    la la sol sol
    sol sol la la

    %4
    la la sib sib
    la la la la
    sol sol sol sol

    %7
    la la\mbreak la la
    sol sol sol mib
    do fa fa re

    %10
    sib mib mib do
    la la' la fad
    \once \set suggestAccidentals = ##t fad? fad re re\mbreak

    %13
    sib4 sib' la re,
    sol la sib re,
    re re mi do

    %16
    la re re re
    mi fa mi fa
    mi fa\mbreak la8 la la la

    %19
    la4 fa mi mi
    mi mi re re
    re re mi mi

    %22
    mi mi re fa
    mi mi mi mi
    re re re re\mbreak

    %25
    mi mi mi mi
    re re re sol
    sol do, do fa

    %28
    fa sib, sib mi
    mi la, fa fa'
    mi la\mbreak re, mi

    %31
    fa la la la
    re, fa mi mi
    dod dod dod dod

    %34
    dod? dod re la'
    la la, do? do
    do8 do re do do do re do\mbreak

    %37
    do4 la' sol sol
    sol sol fa fa
    fa fa sol sol

    %40
    sol sol fa la
    sol sol sol sol
    fa fa fa fa

    %43
    sol sol sol sol\mbreak
    fa fa fa re
    sib mi mi do

    %46
    la re re sol
    sol do, do re
    do re do re

    %49
    do la\mbreak fa fa'
    fa re do do
    do do sib sib

    %52
    sib sib do do
    do do sib re
    do do do do

    %55
    sib sib sib sib\mbreak
    do do do do
    sib r sol' sol

    %58
    sol r sol sol
    lab re, sol sol
    sol mib re re

    %61
    re re do do\mbreak
    do do re re
    re re do mib

    %64
    re re re re
    do do do do
    re re re re

    %67
    do do la' la\mbreak
    sol sib, sib sib
    sib sib sib sib

    %70
    sib sib' la la
    la la sol sol
    sol sol la la

    %73
    la la\mbreak re, sib'
    la re, sol la
    sib re, re re

    %76
    mi do\mbreak la4 re
    re8 re re re sib2\fermata

}


IVbcn = \relative do {

    sol'4 sol fad fad
    fa! fa mi! mi
    mib mib re re

    %4
    fad fad sol sol
    fad fad fa fa
    mi! mi mib mib

    %7
    re re\mbreak fad fad
    sol sol do, do
    fa? fa sib, sib

    %10
    mib mib la, la
    re re re re
    re re re re\mbreak

    %13
    sol, sol' re' si
    do fad, sol sol,
    re' si' do do,

    %16
    re do \once\set suggestAccidentals = ##t sib? sib'
    la la, la' la,
    la' la,\mbreak la'8 re, la' la,

    %19
    re4 re dod dod
    do! do si si
    sib! sib la  la

    %22
    dod dod re re
    dod dod do do
    si si sib sib\mbreak

    %25
    la la la la
    re re sol sol
    do, do fa fa

    %28
    sib, sib mi mi
    la, la re re
    la' fad\mbreak sol dod,

    %31
    re re' la fad
    sol sol la la,
    la' la, la' la,

    %34
    la' la, re re,
    re' re, mi' do
    fa,8 fa' sib, do  fa, fa' sib, do\mbreak

    %37
    fa,4 fa' mi mi
    mi mi re re
    re re do do

    %40
    mi mi fa fa
    mi mi mi mi
    re re re re

    %43
    do do mi mi\mbreak
    fa fa sib, sib
    mi mi la, la

    %46
    re re sol sol
    mib mib fa fa,
    fa' fa, fa' fa,

    %49
    fa' fa,\mbreak sib fa'
    sib, sib' la la
    la la sol sol

    %52
    sol sol fa fa
    la, la sib sib'
    la la la la

    %55
    sol sol sol sol\mbreak
    fa fa la, la
    sib re si sol

    %58
    do do' do, do'
    fa, si, do sol'
    do, do si si

    %61
    sib! sib la la\mbreak
    lab lab sol sol
    si si do do

    %64
    si si sib sib
    la la lab lab
    sol sol si si

    %67
    do do fad fad\mbreak
    sol sol, sol' sol,
    sol' sol, sol' sol,

    %70
    sol' sol fad fad
    fa! fa mi mi
    mib mib re re

    %73
    fad fad\mbreak  sol sol
    re' si do fad,
    sol sol, re' si'

    %76
    do do,\mbreak re re,
    sol8 sol re're, sol2\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6 5>
    <6> <6 5>
    <6> <7 _+>
    <6 5> s
    <6 5> <6>
    <6 5> <6>
    <7 _+>  <6 5>
    s <7 _->
    <[7-]> <7>
    <7> <7>
    <7 _+> s
    s1
    s2 <_+>4 <6 5>
    s <7-> s2
    <_+>4 <6 5!> s <_->
    s1
    <_+>4 <6 4> <5 3+> <6 4>
    <5 3+> <6 4> <_+> <5 4>8 <3+>
    s2 <6 5>
    <6> <6 5>
    <6> <_+>
    s1
    <6 5>2 <6>
    <6 5> <6>
    <_+>1
    s2 <7>
    <7> <7>
    <7> <7>
    <7 _+> s
    <_+>4 <6 5!> <_!> <7->
    s s <_+> <6 5!>
    <_!> <7!> s2
    s1*4
    s2 <6 5>
    <6> <6 5>
    <6>1
    <6 5>
    <6 5>2 <6>
    <6 5> <6>
    s1
    s2 <7>
    <7> <7>
    <7> <7>
    <7> s4 <6 4>
    <5 3> <6 4> <5 3> <6 4>
    <5 3>2 s
    s <6 5->
    <6> <6- 5>
    <6->1
    <6 5->
    <6 5->2 <6>
    <6- 5> <6->
    s1
    s2 <6 5>4 <7>
    <_->1
    <_->4 <7-> <_-> s
    s2 <6 5>
    <6> <6! 5->
    s <_!>
    <6 5> <_->
    <6 5> <6>
    <6 5-> <6>
    <_!> <6 5>
    <_-> <7->
    s1*2
    s2 <6 5>
    <6> <6 5>
    <6> <_+>
    s1
    <_+>4 <6 5!> s <7->
    s s <_+> <7 5!>
    <3!> <3-> <_+>2
    s4 <5 4>8 <3+>

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 60
    s1*77
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
}

VvlIn = \relative do'' {

    r2 sol'
    fad4 sol~sol fa?4~
    fa mi8 re dod4 la'~

    %4
    la sol~sol fa~
    fa mi8 sib'~sib la do4
    si do~do sib?~

    %7
    sib lab~\mbreak lab sol~
    sol fa mib sol
    la2 sib4 re

    %10
    sol,2 fad4 sol\parentSlur (
    sol2) fad4 sol~
    sol fad sol sib,

    %13
    la2 sol\fermata

}

VvlIIn = \relative do'' {

    re2~re4 do~
    do sib la2
    si la

    %4
    re do
    sib4. sol'8 fa2~
    fa4 mib re2

    %7
    do\mbreak sib
    lab sol4 mib'
    \once\set suggestAccidentals = ##t mib?2 re~

    %10
    re4 do~do sib8 re
    dod2 do4 sib
    la2 sib4 sol~

    %13
    sol fad sol2\fermata

}

Vvlan = \relative do' {

    sib'2~sib4 sol8 mib
    la,4 re mi? re~
    re8 do re si mi4. la8

    %4
    fa4 re mi do
    re sib do8 sib do la
    re si' sol do lab4 sib

    %7
    sol lab\mbreak fa sol
    mib fa8 re sib4 sib'
    do2 sib~

    %10
    sib4 sol8 mib la,4 re8 sol
    \once\set suggestAccidentals = ##t mi?4. dod'8 la fad re sib
    mib do re4 re2

    %13
    mib8 do re4 re2\fermata

}


Vbcn = \relative do {

    sol'8 fad sol sol, mib' re mib do
    re la' sib sol dod, la' re re,
    sold, la si sold la si dod la

    %4
    \once\set suggestAccidentals = ##t sib? la sib sol? la sol la fa
    sol fa sol do fa sol la fa
    sol sol, do mib fa re sol sol,

    %7
    mib' do fa fa,\mbreak re' sib mib mib,
    do' lab' re, sib mib sol fa mib
    fad, sol la fad sol sol' sib sol

    %10
    mib re mib do re la' sib sol
    la si dod la re re, sol sol,
    do la re re, sol' fad sol sol,

    %13
    do la re re, sol2\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <7>4 <6>
    <7 3+>2 <6 5>
    <7> <_+>
    <7>4 <6> <7> <6>
    <7> <6>8 <7> s2
    <7 3!>4 <_-> <6 5>2
    <6 5>4 <3-> <6 5->2
    <6- 5> s
    <7->1
    <7>4 <6> <7 _+>2
    <7 3+> <7! _+>
    <6 5> s
    <6 5>4 <3+> s2

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 40
    s1*13
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

    re16 re re re re re
    sol sol fa  mib re do
    sib sib sib sib sib sib

    %4
    mib mib re do sib la
    sol la32 sib do re mi? fad sol16\noBeam r
    sol, la32 sib do re mi? fad sol16\noBeam r

    %7
    sib, do32 re mi fad sol la sib16\noBeam r
    sib, do32 re mi fad sol la sib16\noBeam r
    re, re re re re re

    %10
    sol sol fa mib re do
    sib8 sib'4~\mbreak
    sib16 re do sib la sol

    %13
    la8 la4~
    la16 do sib la sol fa
    sol8 sol4~

    %16
    sol16 sib la sol fa mi
    fad8 fad4
    sol8 re r16 sol

    %19
    la8 re, r16 la'
    sib8 re, r16 sib'
    do4.~

    %22
    do8 sib la
    sib4.~
    sib8 la sol

    %25
    fa16 mi fa sol la8\mbreak %%%%% fine p. 9
    sib mi,4
    re16 la la la la la

    %28
    re re do sib la sol
    fa fa fa fa fa fa
    sib sib la sol fa mi

    %31
    re[mi32 fa sol la si dod] re16 r
    re,[mi32 fa sol la si dod] re16 r
    fa, sol32 la sib? do? re mi fa16\noBeam r

    %34
    fa, sol32 la sib do re mi fa16\noBeam r
    la, la la la la la
    re re do sib la sol

    %37
    fa8 fa'4~
    fa16 la sol fa  mi re
    mi8 mi4~

    %40
    mi16 sol fa mi re do
    re8 re4~
    re16 fa mi re \once\set suggestAccidentals = ##t dod? si

    %43
    dod8 dod4
    re8 la r16 re
    mi8 la, r16 mi'

    %46
    fa8 la, r16 fa'
    sol4.~
    sol8 fa mi

    %49
    fa4.~
    fa8 mib re\mbreak
    mib16 re mib fa sol8

    %52
    lab re,4
    do16 sol sol sol sol sol
    do do sib lab sol fa

    %55
    mib mib mib mib mib mib
    lab lab sol fa mib re
    do re32 mib fa sol \once\set suggestAccidentals = ##t la? si do16\noBeam r

    %58
    do, re32 mib fa sol la si do16\noBeam r
    mib, fa32 sol la si do re mib16\noBeam r
    mib, fa32 sol la si do re mib16\noBeam r\mbreak

    %61
    sol, sol sol sol sol sol
    do do sib lab sol fa
    mib8 mib'4~

    %64
    mib16 sol fa mib re do
    re8 re4~
    re16 fa mib re do sib

    %67
    do8 do4~
    do16 mib re do \once\set suggestAccidentals = ##t si? la
    si8 si4

    %70
    do8 sol r16 do
    re8 sol, r16 re'\mbreak
    mib8 sol, r16 sol'

    %73
    fa4.~
    fa8 mib re
    mib4.~

    %76
    mib8 re do
    re16 sib re fa sib8
    re, mib do

    %79
    sib16 fa' fa fa fa fa
    sib sib la sol fa mib
    re re re re re re

    %82
    sol sol fa mib re do
    sib8 sib'4~
    sib16 re do sib la sol

    %85
    la8 la4~
    la16 do sib la sol fa
    sol8 sol4~

    %88
    sol16 sib la sol fa \once\set suggestAccidentals = ##t mib?
    fad8 fad4
    sol16 re re re re re

    %91
    sol sol fa mib re do
    sib sib sib sib sib sib
    mib mib re do sib la

    %94
    sol sol' sol sol sol sol
    sol sol sol sol sol sol
    fad fad fad fad fad fad

    %97
    sol sib, sib sib sib sib
    la la la la la la
    la la la la la la

    %100
    sol4.\fermata

}

VIvlIIn = \relative do'' {

    R4.*2
    re16 re re re re re
    sol sol fa mib re do

    %5
    sib sib sib sib sib sib
    mib mib re do sib la
    sol la32 sib do re \once\set suggestAccidentals = ##t mi? fad sol16\noBeam r

    %8
    sol, la32 sib do re mi fad sol16\noBeam r
    sib, do32 re mi fad sol la sib16\noBeam r
    sib, do32 re mi fad sol la sib16\noBeam r

    %11
    R4.
    mib,8 mib4~
    mib16 sol fa mib re do

    %14
    re8 re4~
    re16 fa mib re do sib
    do8 do4~

    %17
    do16 mib re do sib la
    sib8 sib r16 re
    fad8 la, r16 fad'

    %20
    sol8 sib, r16 sol'
    la4.~
    la8 sol fad

    %23
    sol4.~
    sol8 fa? mi
    re16 dod re mi fa8\mbreak

    %26
    sol dod,4
    re r8
    R4.

    %29
    la16 la la la la la
    re re do sib la sol
    fa fa fa fa fa fa

    %32
    sib sib la sol fa mi
    re mi32 fa sol la si dod re16\noBeam r
    re, mi32 fa sol la si dod re16\noBeam r

    %35
    fa, sol32 la si dod re mi fa16\noBeam r
    fa, sol32 la si dod re mi fa16\noBeam r
    R4.\mbreak

    %38
    sib,8 sib4~
    sib16 re do sib la sol
    la8 la4~

    %41
    la16 do sib la sol fa
    sol8 sol4~
    sol16 sib la sol fa mi

    %44
    fa8 fa r16 la
    dod8 mi, r16 dod'
    re8 fa, r16 re'

    %47
    mi4.~
    mi8 re dod
    re4.~

    %50
    re8 do? si\mbreak
    do16 si do re mib8
    fa si,4

    %53
    do r8
    R4.
    sol16 sol sol sol sol sol

    %56
    do do sib lab sol fa
    mib mib mib mib mib mib
    lab lab sol fa mib re

    %59
    do re32 mib fa sol \once\set suggestAccidentals = ##t la? si do16\noBeam r
    do, re32 mib fa sol la si do16\noBeam r\mbreak
    mib, fa32 sol la si do re mib16\noBeam r

    %62
    mib, fa32 sol la si do re mib16\noBeam r
    R4.
    lab8 lab4~

    %65
    lab16 do sib lab sol fa
    sol8 sol4~
    sol16 sib lab sol fa mib

    %68
    fa8 fa4~
    fa16 lab sol fa mib re
    mib?8 do r16 sol

    %71
    si8 re, r16 si'\mbreak
    do8 mib, r16 mib
    re'4.~

    %74
    re8 do si
    do4.~
    do8 sib la

    %77
    sib16 fa sib re fa8
    sib, do la
    sib4 r8

    %80
    R4.
    fa'16 fa fa fa fa fa
    sib sib la sol fa mib\mbreak

    %83
    re4 r8
    mib mib4~
    mib16 sol fa mib re do

    %86
    re8 re4~
    re16 fa mib re do sib\mbreak
    do8 do4~

    %89
    do16 mib re do sib la
    sib4 r8
    R4.

    %92
    re16 re re re re re
    sol sol fa mib re do
    sib sib sib sib sib sib

    %95
    la la la la la la
    la la la la la la
    sib sol sol sol sol sol

    %98
    sol sol sol sol sol sol
    fad fad fad fad fad fad
    sol4.\fermata

}

VIvlan = \relative do' {

    R4.*6
    re16 re re re re re
    sol sol fa  mib re do
    
    %9
    sib sib sib sib sib sib
    mib mib re do sib la
    sol8 sol'4~\mbreak
    
    %12
    sol16 sib la sol fa mib
    do' mib re do sib la
    fa la sol fa mib re
    
    %15
    sib' re do sib la sol
    mib sol fa mib re do
    la' do sib la sol fad
    
    %18
    re8 re r16 re
    re8 re r16 re
    re8 re r16 re
    
    %21
    fad fad fad fad fad fad
    fad? fad fad fad fad fad
    re re re re re re
    
    %24
    mi mi mi mi mi mi
    la,4 la'8\mbreak
    mi la4
    
    %27
    fa4 r8
    fa4 r8
    fa4 r8
    
    %30
    fa4 r8
    fa4 r8
    fa4 r8
    
    %33
    la,16 la la la la la
    re re do sib la sol
    fa fa fa fa fa fa
    
    %36
    sib sib la sol fa mi
    re8 re'4~\mbreak
    re16 fa mi re do sib
    
    %39
    sol' sib la sol fa mi
    do mi re do sib la
    fa' la sol fa mi re
    
    %42
    sib re do sib la sol
    mi' sol fa  mi re dod
    la8 la r16 la'
    
    %45
    la8 dod, r16 la'
    la8 fa r16 la
    dod, dod dod dod dod dod
    
    %48
    dod? dod dod dod dod dod
    la la la la la' [la]
    si si si si si si\mbreak
    
    %51
    sol4 sol8
    fa re sol
    mib4 r8
    
    %54
    mib?4 r8
    mib?4 r8
    mib?4 r8
    
    %57
    mib?4 r8
    mib?4 r8
    sol16 sol sol sol sol sol
    
    %60
    do do sib lab sol fa\mbreak
    mib mib mib mib mib mib
    lab lab sol fa mib re
    
    %63
    do8 do'4~
    do16 mib re do sib lab
    fa lab sol fa mib re
    
    %66
    sib' re do sib lab sol
    mib sol fa mib re do
    lab' do sib lab sol fa
    
    %69
    re fa mib re do si
    sol8 sol' r16 sol
    sol8 si, r16 sol'\mbreak
    
    %72
    sol8 do, r16 sol'
    sol sol sol sol sol sol
    sol sol sol sol sol sol
    
    %75
    sol sol sol sol sol sol
    la la la la la la
    fa fa fa fa fa fa
    
    %78
    fa8 sol fa
    re4 r8
    re4 r8
    
    %81
    re4 r8
    re4 r8
    sib4 r8
    
    %84
    sol'16 sib la sol fa mib
    do' mib re do sib la   
    fa la sol fa mib re
    
    %87
    sib' re do sib la sol\mbreak
    mib sol fa mib re do
    la' do sib la sol fad
    
    %90
    re sib sib sib sib sib
    sib sib sib sib sib sib
    sib sib sib sib sib sib
    
    %93
    sib sib sib sib sib sib
    sol re' re re re re
    re re re re re re
    
    %96
    re re re re re re
    re re re re re re
    re re re re re re
    
    %99
    re re re re re re
    re4.\fermata
    
}


VIbcn = \relative do {

    R4.*4
    sol16 sol sol sol sol sol
    sol' sol fa mib re do

    %7
    sol sol sol sol sol sol
    mib' mib re do sib la
    sol la32 sib do re \once\set suggestAccidentals = ##t mi? fad sol16\noBeam r

    %10
    sol, la32 sib do re mi fad sol16\noBeam r
    sol sol sol sol sol sol\mbreak
    do, do do do do do

    %13
    fa fa fa fa fa fa
    sib, sib sib sib sib sib
    mib mib mib mib mib mib

    %16
    la, la la la la la
    re re re re re re
    sol sol sol sol sol sol

    %19
    re re re re re re
    sol sol sol sol sol sol
    re re re re re re

    %22
    re re re re re re
    sol sol sol sol sol sol
    dod, dod dod dod dod dod

    %25
    re4 re8\mbreak
    sol la la,
    re4 r8

    %28
    re4 r8
    re4 r8
    re4 r8

    %31
    re16 re re re re re
    re' re do sib la sol
    fa fa fa fa fa fa

    %34
    sib sib la sol fa mi
    re mi32 fa sol la si dod re16\noBeam r
    re, mi32 fa sol la si dod re16\noBeam r

    %37
    re, re re re re re\mbreak
    sol sol sol sol sol sol
    do, do do do do do

    %40
    fa fa fa fa fa fa
    sib, sib sib sib sib sib
    mi mi mi mi mi mi

    %43
    la, la la la la la
    re re re re re re
    la la la la la la

    %46
    re re re re re re
    la la la la la la
    la la la la la la

    %49
    re re re re re re
    sol, sol sol sol sol sol\mbreak
    do4 do'8

    %52
    fa, sol sol,
    do4 r8
    do4 r8

    %55
    do4 r8
    do4 r8
    do16 do do do do do

    %58
    do' do sib lab sol fa
    mib mib mib mib mib mib
    lab lab sol fa mib re\mbreak

    %61
    do re32 mib fa sol la? si do16\noBeam r
    do, re32 mib fa sol la si do16\noBeam r
    do, do do do do do

    %64
    fa fa fa fa fa fa
    sib, sib sib sib sib sib
    mib mib mib mib mib mib

    %67
    lab, lab lab lab lab lab
    re re re re re re
    sol, sol sol sol sol sol

    %70
    do do do do do do
    sol sol sol sol sol sol\mbreak
    do do do do do do

    %73
    si si si si si si
    sol sol sol sol sol sol
    do do do do do do

    %76
    fa, fa fa fa fa fa
    sib4 r8
    sib mib fa

    %79
    sib,4 r8
    sib4 r8
    sib4 r8

    %82
    sib4 r8
    sib16 sib sib sib sib sib
    do do do do do do

    %85
    fa fa fa fa fa fa
    sib, sib sib sib sib sib
    mib mib mib mib mib mib\mbreak

    %88
    la, la la la la la
    re re re re re re
    sol, sol sol sol sol sol

    %91
    sol sol sol sol sol sol
    sol sol sol sol sol sol
    sol sol sol sol sol sol

    %94
    sol sol sol sol sol sol
    re' re re re re re
    re, re re re re re

    %97
    sol sol sol sol sol sol
    re' re re re re re
    re, re re re re re

    %100
    sol4.\fermata

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s4.*5
    <6->4.
    s4.*5
    <7 _->4.
    <7->
    <7>
    <7>
    <7>
    <7 _+>
    s
    <_+>
    s 
    <7 _+>
    s
    s
    <7->
    s4.*13
    <7>4.
    <7>
    <7>
    <7>
    <7>
    <7 _+>
    s
    <_+>
    s
    <7 _+>
    s
    s
    <7 3!>
    <_->
    s4.*3
    <_->4.
    s4.*7
    <_->4.
    <7- 3->
    <7->
    <7>
    <7>
    <7>
    <7 3!>
    s4.*3
    <6 5>4.
    <7>
    <_->
    <7>
    s4.*7
    <7 _->4.
    <7->
    <7>
    <7>
    <7>
    <7 _+>
    s4.*3
    <6->4.
    s
    <5 4>4.
    <3+>
    s
    <5 4>
    <3+>
   
}

forma = {

    \time 3/8
    \key fa\major
    \tempo 4. = 65
    s4.*100
    \bar"|."

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
        title = \markup\smaller{Concerto per archi in Do minore RV 119}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
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

    \markup \huge {[2.] Largo }

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

    \markup \huge {[3.] All[egr]o }

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

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{Concerto per archi in Sol minore RV 156}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] All[egr]o }

    \score {

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino I]"}
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  {"[Violino 2]"}
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
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

    \markup \huge {[2.] Ad[agi]o }

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

    %\pageBreak

    \markup \huge {[3.] All[egr]o }

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