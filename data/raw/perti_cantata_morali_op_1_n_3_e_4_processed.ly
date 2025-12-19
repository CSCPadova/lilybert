\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

s1^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza I]"}\bar "|"

\cadenzaOff

}

MyCadenzabis = \relative do'' {

\cadenzaOn

s2.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza III]"}\bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

saltabis = #(skip-of-length MyCadenzabis)

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

arco = _\markup \italic "con l'arco"

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

terzinequarto = \tupletSpan 4

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


Ibasson = \relative do {

    \autoBeamOff
    
    r8 do do do do4 do8 re
    mib4 mib r lab~
    lab lab8 lab lab4 lab8 sol\mbreak
    
    %4
    mib4 mib r8 sol mib sol
    do, do sol' la16 si do8 do lab sib?16 do
    fa,4. sol8 sol4 sol
    
    %7
    r sib8 sol\mbreak mib4 fa8 sol
    la,! la r do do8. do16 do8 re  
    mib mib mib mib16 re re8 re r sib'16 lab
    
    %10
    lab8 lab lab sol\mbreak sol sol r sol
    sol4 sol8 sol do4 do
    r8 sol sol lab sib8. sib16 sib8 lab
    
    %13
    lab4 lab si, si
    r8 si? si do\mbreak do4 do
    mi mi r8 mi mi fa
    
    %16
    fa4 fa r8 do' mib,? fa
    sol2 do,

}

Itesto = \lyricmode {
   
   In tene - bro -- sa ec -- lis -- si lan -- gue il tra -- cio pia -- ne  -- ta
   
   e_il san -- gue_os -- tile _  cor -- re dell’ I -- stro a_im -- porpo - rar la spon -- da.
   
   Dalle _  pie -- tre pro -- fonde _ di la -- cere _ me -- schite _ o -- desi_an - cora _ 
   
   mormo - rare _ agi - tata _ da sma -- nie or -- ren -- de e da de -- li -- rij _ a -- tro -- ci
   
   l’omb -- ra di Soli - ma -- no l’omb -- ra di Soli - ma -- no in que -- ste vo -- ci.

}

Ibcn = \relative do {
   
   do1~
   do2 si~
   si1
   
   %4
   do~
   do2 lab~
   lab sol
   
   %7
   mib'1
   la,!~
   la2 sib~
   
   %10
   sib mib!~
   mib mi~
   mi1
   
   %13
   fa2 si,~
   si do
   mi!1
   
   %16
   fa2 mib4. fa8
   sol2 do,

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*4
    <_+>2 <7>
    <6> <_+>
    s1*3
    <7->1
    s
    s
    <_->
    s
    s
    <_->2 <6>
    <4> <3>

}


forma = {

    \time 4/4
    \key sib\major
    \tempo 4 = 65
    s1*17
    \bar "||"

}

Ibasso = {
    %\notypeset
    \clef bass
    \new Voice = "perdite"
    <<\Ibasson \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}





IIvlIn = \relative do'' {

   r4 do8 reb do r fa sol
   mi r fa lab solb16 (fa) fa8 fa mi
   fa4 r r do8 reb
   
   %4
   do r r4 r2
   R1
   r4 do8 reb do r r4
   
   %7
   R1*2
   sol'4 do8
   lab(sol) lab
   
   %11
   sib(lab) sib
   sol4 sol8
   R4.*22
   
   %35
   r4 do,8 reb do r fa sol
   mi r fa lab solb16 (fa) fa8 fa mi
   fa4 r r do8 reb
   
   %38
   do r r4 r2
   R1
   r4 do8 reb do r r4
   
   %41
   R1
   r2 r4 do'8 sol
   lab fa r4 r2
   
   %44
   r4 sol, la! r

}

IIvlIIn = \relative do'' {

   r4 lab8 sib lab r lab sib
   sol r do do sib16(lab) sol(fa) sol4
   fa r r lab8 sib
   
   %4
   lab r r4 r2
   R1
   r4 lab8 sib lab r r4
   
   %7
   R1*2
   mib'4 sol8
   fa(mib) fa
   
   %11
   re(do) re
   mib4 mib8
   R4.*22
   
   %35
   r4 lab,8 sib lab r lab sib
   sol r do do sib16(lab) sol(fa) sol4
   fa r r lab8 sib
   
   %38
   lab r r4 r2
   R1
   r4 lab8 sib lab r r4
   
   %41
   R1
   r2 r4 sol'8 do,
   do4 r r2
   
   %44
   r4 mi, fa r
   
}

IIbasson = \relative do {

   \autoBeamOff

   R1*2
   r4 fa8 mi fa4 r
   r sib8 la! sib4 do8 sib16 do

   %5
   reb8. do16 sib8 lab solb solb16 fa mib8 mib16 fa
   fa8 fa r4 r do'8 do,
   fa4 sib8 sol16 fa mi4 do'8 sol

   %8
   lab fa sib sib16 do do2
   R4.*4
   sol4 do8
   
   %14
   lab [sol] lab
   sib lab sib
   sol4 sol8
   
   %17
   r sol la?
   sib8. la16(sol8)
   la sol la
   
   %20
   fad16[mib fad re mib fad]
   sol[fad sol sib la sol]
   la4 re,8
   
   %23
   r sol fa
   mib16[re do re mib fa]
   sol[fa sol re mib sib]
   
   %26
   do8[re] mib
   re4 re8
   sol,4.
   
   %29
   r8 do' sib
   lab16[sol fa sol lab sib]
   do[sib do sol lab mib] 
   
   %32
   fa8 [sol] lab
   sol4 sol8
   do,4.
   
   %35
   R1*2
   r4 fa8 mi fa4 r
   r sib8 la! sib4 do8 sib16 do

   %39
   reb8. do16 sib8 lab solb solb16 fa mib8 mib16 fa
   fa8 fa r4 r do'8 do,
   fa4 sib8 sol16 fa mi4 do'8 sol

   %42
   lab fa sib sib16 do do4 r
   r do8 sol lab fa do sib16 do
   fa,4 r r2
  
}

IItesto = \lyricmode {

   Dove _ sei dove _ sei fa -- ma vo -- lante _  di Bi -- sanzi - o_op -- pressa _ al suo -- lo

   il tuo piè do -- ve fug -- gì? do -- ve do -- ve do -- ve fug -- gì?
   
   Ah, che_un’ A -- qui -- la  im -- pe  -- ran -- te per accre - sce -- re il suo vo - - lo le bell’ a - - li ti ra -- pì
   
   le bell’ a - - li ti ra -- pì.
   
   Dove _ sei dove _ sei fa -- ma vo -- lante _  di Bi -- sanzi - o_op -- pressa _ al suo -- lo

   il tuo piè do -- ve fug -- gì? do -- ve do -- ve do -- ve fug -- gì? do -- ve do -- ve do -- ve fug -- gì?

}

IIvcn = \relative do {

   r4 fa8 mi fa r reb 'sib
   do r lab fa sib reb do do,
   fa4 r r fa8 mi
   
   %4
   fa r r4 r2
   R1
   r4 fa8 mi fa r r4
   
   %7
   R1*2
   do'4 do,8
   fa4 fa8
   
   %11
   sib4 sib,8 
   mib4 mib8
   R4.*22
   
   %35
   r4 fa8 mi fa r reb 'sib
   do r lab fa sib reb do do,
   fa4 r r fa8 mi
   
   %38
   fa r r4 r2
   R1
   r4 fa8 mi fa r r4
   
   %41
   R1
   r2 r4 mi
   fa r r2
   
   %44
   r4 do fa, r
   
}

IIbcn = \relative do {

   r4 fa8 mi fa r reb sib
   do r lab fa sib reb do do,
   fa4 r r fa'8 mi
   
   %4
   fa r reb do reb r do fa,
   sib r sib' lab solb4 solb,
   fa fa'8 mi fa r fa mib?
   
   %7
   reb4 sib do mi
   fa4 reb do2
   do4.
   
   %10
   fa
   sib,
   mib
   
   %13
   do 
   fa
   sib,
   
   %16
   mib
   sib4 la8
   sol4.
   
   %19
   do
   re4 do8
   sib sol4
   
   %22
   r8 re' do
   sib4 r8
   do4 r8
   
   %25
   sol4 r8
   do re mib
   re re,4
   
   %28
   sol8 sol' fa
   mib4 r8
   fa4 r8
   
   %31
   do4 r8 
   fa8 sol lab
   sol sol,4
   
   %34
   do4.
   r4 fa8 mi fa r reb sib
   do r lab fa sib reb do do,
   
   %37
   fa4 r r fa'8 mi
   fa r reb do reb r do fa,
   sib r sib' lab solb4 solb,
   
   %40
   fa fa'8 mi fa r fa mib?
   reb4 sib do mi
   fa4 reb do mi
   
   %43
   fa mi fa do
   fa, do fa r

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s4 <_->8 <7- 5>  <_-> s <5->4  
   s4 <6>4 <6->16 <5> s8 <4> <3>
   s2 s4 <_->8 <7->
   <_-> s <6> <6+> <6> s <7>8 <_!>
   s2 <7>4 <6>
   <_!>4 <_->8 <5> <_->4 <5>
   s2 <_!>4 <6>
   <_-> <6> s2
   <_->4.
   <_->
   s4.*3
   <_->4.
   s
   s
   <6>4 <6+>8 
   s4.
   <6>
   <_+>
   <6>
   s8 <_+>4
   s4.*6
   <6>4.
   <6>
   s4.*4
   s4 <_->8 <7- 5>  <_-> s <5-> <6> 
   s4 <6>4 <6->16 <5> s8 <4> <3>
   s2 s4 <_->8 <7- 5>
   <_-> s <6> <6+> <6> s <7 _->8 <_!>
   s2 <7>4 <6>
   <_!>4 <_->8 <5> <_->4 <5>
   s1
   s4 <6> s <6>
   <6>1
   s4 <_!> <_!>
   
}


forma = {

   \time 4/4
   \key sib\major
   \tempo 4 = 60   
   \once \override Score.RehearsalMark.extra-offset = #'(9 . -1) \mark\markup"Adagio, e staccato"
   s1*8
   \bar "||"
   \time 3/8
   \tempo 4. = 60
   \once \override Score.RehearsalMark.extra-offset = #'(5 . -1) \mark\markup"Andante"
   s4.*26
   \bar "||"
   \time 4/4
   \tempo 4 = 60
   \once \override Score.RehearsalMark.extra-offset = #'(9 . -1) \mark\markup"Adagio, e staccato"
   s1*10
   \bar "||"

}

IIvlI = {
   %\notypeset
   <<\IIvlIn \forma>>

}

IIvlII = {
   <<\IIvlIIn \forma>>

}

IIbasso = {
   \new Voice = "fama"
   \clef bass
   <<\IIbasson \forma>>
}

IIvc = {
   \clef bass
   <<\IIvcn \forma>>
}

IIbc = {
   \clef bass
   <<\IIbcn \forma \IIbfn>>
   \typeset
}




IIIbasson = \relative do {

    \autoBeamOff
    
    sib'4 sib8 sib fa fa r fa
    fa fa fa mib fa4 fa
    fa8 fa16 fa fa8 sol lab lab16 lab sib8 sib16 fa
    sol4 sol r do~
    do8 sol mi fa16 sol do,4 do
    sol'8 la16 sib do8 do sol sol16 la sib8. la16
    la8 la r sol la la si si
    do do r mib, fa lab sol4
    do, r8 re  mi mi fad fad
    sol sol r sib, do mib! re4
    sol,2 r
    
}

IIItesto = \lyricmode {
   
   Ma quan --  do fia _ ch’a sogget -  -- ti -- re_il mon -- do
   
   ter -- _ mini la gran lu -- na il gi -- ro im -- men -- so?
   
   Eh_che in -- darno _ vi pen -- so men -- tre l’Eu -- ropa _ og -- gi frappor _  si ve -- de
   
   fra l’u -- no_e l’al -- tro cor -- no un sì gran pie -- de
   
   fra l’u -- no_e l’al -- tro cor -- no un sì gran pie -- de.

}

IIIbcn = \relative do {
   
   sib1~
   sib~
   sib2.~sib4
   mib2 mi~
   mi?1~
   mi?
   fa4 mi fa sol
   lab mib! fa sol
   do, sib do re
   mib sib do re
   sol,2 r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*3
    s2 <6>
    s1
    s
    <_!>4 <6> s <_+>
    s1
    s4 <6> <_!> <_+>
  
}


forma = {

    \time 4/4
    \key sib\major
    \tempo 4 = 60
    s1*6
     \once \override Score.RehearsalMark.extra-offset = #'(20 . 1)\mark\markup"andante"
     s2\tempo 4 = 85 s
    s1*4
    \bar "||"

}

IIIbasso = {
    %\notypeset
    \clef bass
    \new Voice = "quando"
    <<\IIIbasson \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}





IVvlIn = \relative do'' {
   
   r16 sol' fa mib re do sib lab sol4 r
   sib'8 lab16 sol fa8. mib16 mib4 r
   r16 sol fa mib re do sib lab sol4 r
   
   %4
   R1\mbreak
   r16 re' do sib la sol fa mib re4 r
   R1
   
   %7
   r2 r16 re' do sib la sol fa mib
   re4 r r16 sol' fa mib re do sib lab
   sol4 r r16 sol' fa mib re do sib lab
   
   %10
   sol4 r r2
   R1*3
   r16 sol' fa mib re do sib lab sol4 r
   
   %15
   sib'8 lab16 sol fa8. mib16 mib4 r
   R1
   r2 r16 mib re do sib lab sol fa
   
   %18
   mib4 r r2
   R1*5
   r16 sib'' la? sol fa mib re do sib re do sib la8. sol16
   
   %25
   sol4 r\mbreak r16 sol' fa mib re do sib lab
   sol4 r sib'8 lab16 sol fa8. mib16 
   mib4 r r16 sol fa mib re do sib lab 
   
   %28
   sol4 r r2
   r r16 re' do sib la sol fa mib\mbreak 
   re4 r r2
   
   %31
   R1
   r16 re' do sib la sol fa mib re4 r  
   r16 sol' fa mib re do sib lab sol4 r 
   
   %34
   r16 sol' fa mib re do sib lab sol4 r
   R1*3
   r2 r16 sol' fa mib re do sib lab 
   
   %39
   sol4 r sib'8 lab16 sol fa8. mib16
   mib4 r r2
   
}

IVvlIIn = \relative do'' {
   
   r16 mib re do sib lab sol fa mib4 r
   sol'8 fa16 mib re8. mib16 mib4 r\mbreak
   r16 mib re do sib lab sol fa mib4 r
   
   %4
   R1
   r16 sib' la? sol fa mib re do sib4 r
   R1
   
   %7
   r2 r16 sib' la sol fa mib re do
   sib4 r r16 mib' re do sib lab sol fa
   mib4 r r16 mib' re do sib lab sol fa
   
   %10
   mib4 r r2
   R1*3
   r16 mib' re do sib lab sol fa mib4 r\mbreak
   
   %15
   sol'8 fa16 mib re8. mib16 mib4 r
   R1
   r2 r16 do sib lab sol fa mib re
   
   %18
   do4 r r2
   R1*5
   r16 sol'' fa mib re do sib la?\mbreak sol8 mib' re4
   
   %25
   re r r16 mib re do sib lab sol fa
   mib4 r sol'8 fa16 mib re8. mib16
   mib4 r r16 mib re do sib lab sol fa
   
   %28
   mib4 r r2\mbreak
   r r16 sib' la? sol fa mib re do
   sib4 r r2
   
   %31
   R1
   r16 sib' la sol fa mib re do sib4 r
   r16 mib' re do sib lab sol fa mib4 r\mbreak
   
   %34
   r16 mib' re do sib lab sol fa mib4 r
   R1*3
   r2 r16 mib' re do sib lab sol fa
   
   %39
   mib4 r sol'8 fa16 mib re8. mib16
   mib4 r r2

}

IVbasson = \relative do {

    \autoBeamOff
    
    R1
    r2 r4 mib'8 sib
    mib,4 r r8 sib' la fa\mbreak
    
    %4
    sib8 [la16 sol] fa8 [mib16 fa] re8[fa16 mib] re [mib re do]
    sib4 r r re8 mib
    fa sib fa8. fa16 sib,8 [sib re do16 sib]
    
    %7
    fa'8 [fa la sol16 fa]\mbreak sib4 r
    r sib8 fa sib,4 r
    r8 mib' sib sol mib4 r
    
    %10
    r mib'8 do lab fa re sib
    sol4 sol'8 lab sib mib,\mbreak sib8. sib16
    mib8 [mib sol fa16 mib] sib'8 [sib re do16 sib]
    
    %13
    mib4 sol,8 lab sib mib, sib8. sib16
    mib4 r r2
    r r4 sol8 do\mbreak
    
    %16
    si sol do do, sol'4 do8 mib,
    fa4 sol8. sol16 do,4 r
    r sol'8 la sib do16 [sib] la8. sol16
    
    %19
    fad4 re'8 sib\mbreak sol4 do8 la
    fad4 sol8 mib do mib re8. re16
    sol,8 [sib16 do] re8 [mib16 fad] sol8 [la16 sib] do [sib la sol]
    
    %22
    fad4 re'8 sib\mbreak sol4 do
    fad, sib r8 la16 [sol] fad8. sol16
    sol4 r r8 do^\p fad,8. sol16
    
    %25
    sol4 r r2
    R1
    r4 mib'8 sib\mbreak mib,4 r
    
    %28
    r8 sib' la fa sib [la16 sol] fa8 [mib16 fa]
    re8 [fa16 mib] re [mib re do] sib4 r
    r re8 mib fa sib fa8. fa16\mbreak
    
    %31
    sib,8 [sib re do16 sib] fa'8[ fa la sol16 fa]
    sib4 r r sib8 fa
    sib,4 r r8 mib' sib sol
    
    %34
    mib4 r r mib'8 do
    lab fa re sib\mbreak sol4 sol'8 lab
    sib mib, sib8. sib16 mib8 [mib sol fa16 mib]
    
    %37
    sib'8 [sib re do16 sib] mib4 sol,8 lab
    sib mib, sib8. sib16 mib4 r
    R1*2
}

IVtesto = \lyricmode {
   
   Non ca -- dé, preci - pi -- tò - - - - l’otto - mana -  liber - tà - - 
   
   non ca -- dé, preci - pi -- tò non ca -- dé, preci - pi -- tò  
   
   l’otto - mana -  liber - tà - -  l’otto - mana -  liber - tà. 
   
   Il suo fa -- sto già spa -- rì, già spa -- rì, sen fug -- gì,
   
   e quel sol che tramon - tò non più no, no, no, no, non più no, non sorge - rà - - - - 
   
   non più no, no, no, no, non sorge - rà non sorge - rà.
   
   Non ca -- dé, preci - pi -- tò - - - - l’otto - mana -  liber - tà - - 
   
   non ca -- dé, preci - pi -- tò non ca -- dé, preci - pi -- tò  
   
   l’otto - mana -  liber - tà - -  l’otto - mana -  liber - tà. 
   
}

IVvcn = \relative do {
   
   mib4 r r16 mib' re do sib lab sol fa
   mib8 lab sib sib, mib4 r
   mib r mib r
   
   %4
   R1
   sib'4 r sib, r
   R1\mbreak
   
   %7
   r2 sib4 r 
   sib r sib r
   mib r mib r
   
   %10
   mib r r2   
   R1*3 
   mib4 r r16 mib' re do sib lab sol fa\mbreak
   
   %15
   mib8 lab sib sib, mib4 r
   R1
   r2 do4 r
   
   %18
   do r r2
   R1*5
   sol'4 r sol8 do, re re,
   
   %25
   sol4 r mib' r
   r16 mib' re do sib lab sol fa mib8 lab sib sib,
   mib4 r mib r
   
   %28
   mib r r2
   r sib'4 r
   sib, r r2
   
   %31
   R1
   sib4 r sib r
   sib r mib r\mbreak
   
   %34
   mib r mib r
   R1*3
   r2 mib4 r
   
   %39
   r16 mib' re do sib lab sol fa mib8 lab sib sib,
   mib4 r r2
   
}

IVbcn = \relative do {
   
   mib4 r mib r
   mib8 lab sib sib, mib4 r
   mib r mib8 sib' la? fa\mbreak
   
   %4
   sib4 fa sib, r
   sib r sib re8 mib
   fa sib, fa' fa, sib4 r
   
   %7
   fa r\mbreak sib r
   sib r sib r
   mib r mib r
   
   %10
   mib r lab8 fa re sib
   sol4 sol'8 lab sib mib,\mbreak sib'8 sib,
   mib4 r sib r
   
   %13
   mib sol8 lab sib mib, sib'sib,
   mib4 r mib r
   mib8 lab sib sib, mib4 do\mbreak
   
   %16
   sol' do, sol mib
   fa sol do r
   do sib8 la sol4 do
   
   %19
   re sib\mbreak mib la,!
   re mib do re
   sol, re' mib do
   
   %22
   re sib\mbreak mib la,!
   re sib do re
   sol, r sol'8 do, re re,
   
   %25
   sol4 r mib' r
   mib r4 mib8 lab sib sib,
   mib4 r\mbreak mib r
   
   %28
   mib8 sib' la fa sib4 fa
   sib, r sib r
   sib re8 mib fa sib, fa' fa,\mbreak
   
   %31
   sib4 r fa r
   sib r sib r
   sib r mib r
   
   %34
   mib r mib r
   lab8 fa re sib\mbreak sol4 sol'8 lab
   sib mib, sib' sib, mib4 r
   
   %37
   sib r mib sol8 lab
   sib mib, sib' sib, mib4 r
   mib r mib8 lab sib sib,\mbreak
   
   %40
   mib4 r r2
  
}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*15
    <_+>2 <_+>4 <6>
    s1
    s4 <6> <_-> s
    <_+>2 s
 
}


forma = {

    \time 4/4
    \key sib\major
    \tempo 2 =60
    s1*40
    \bar "||"

}

IVvlI = {
    %\notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVbasso = {
    \clef bass
    \new Voice = "non"
    <<\IVbasson \forma>>
}

IVvc = {
    \clef bass
    <<\IVvcn \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset
}





VvlIn = \relative do'' {
   
   R1*2
   R1.*8
   do2. do4 do2\mbreak
   do1 do2
   R1.*7
   sol'2. sol4 sol2
   sol1 sol2
   R1.*6
   sol8 fa sol la sol4 fa mib re
   mib2 mi1
   fa r2
   R1.*8\mbreak
   mib8 re mib fa mib4 re do sib
   lab8 sol fa mib
   re2. re4
   do1

}

VvlIIn = \relative do'' {
   
   R1*2
   R1.*7
   fa,2. fa4 fa2
   
   %11
   fa1 fa2
   R1.*7
   do'2. do4 do2
   
   %20
   do1 do2
   R1.*8
   do8 sib do re do4 sib lab sol\mbreak
   
   %30
   lab1.
   R1.*8
   do8 sib do re do4 sib lab sol
   
   %40
   fa8[mib re do] do2. si?4
   do1

}

Vbasson = \relative do {

    \autoBeamOff
    
    r8 sol' sol sol re re r re
    fa8. fa16 fa8 mib mib4 mib
    fa2. fa4 fa2
    
    %4
    fa1 fa2\mbreak
    sib, do reb
    do fa2. sib,4
    
    %7
    do8[sib do re] do4 re mi do
    fa8[mib fa sol] fa4 mib reb do
    sib reb do1\mbreak
    
    %10
    fa,1.
    R
    do''2. do4 do2
    do1 do2
    
    %14
    fa, sol lab
    sol do2. fa,4
    sol8[fa sol la] sol4 la si sol\mbreak
    
    %17
    do8[sib? do re] do4 sib lab sol
    fa lab sol1
    do,1.
    
    %20
    R
    sol'2. sol4 sol2
    sol1 sol2
    
    %23
    do, re mib\mbreak
    re sol2. do,4
    re8[do re mib] re4 mi? fad re
    
    %26
    sol8[fa? sol la] sol4 fa mib? re
    do mib re1
    sol,1.
    
    %29
    R\mbreak
    fa'2. fa4 fa2
    fa1 fa2
    
    %32
    do'2. do4 do2
    do1 do2
    fa, sol lab
    
    %35
    sol do2. fa,4
    sol8[fa sol la] sol4 la si sol\mbreak
    do8[sib? do re] do4 sib lab sol 
    
    %38
    fa lab sol1
    do,1.
    R1.
    
    %41
    R1
    
}

Vtesto = \lyricmode {
   
   Co -- sì dell’A -- sia _  in tor -- bido _  lin -- guag -- gio.
   
   Par -- lano _  l’om -- bre al -- lor ch’è spen -- to il rag - - - - - - - - - - - - gio,
   
   par -- lano _  l’om -- bre al -- lor ch’è spen -- to il rag - - - - - - - - - - - - gio,
   
   par -- lano _  l’om -- bre al -- lor ch’è spen -- to il rag - - - - - - - - - - - - gio,
   
   par -- lano _  l’om -- bre par -- lano _  l’om -- bre al -- lor ch’è spen -- to il rag - - - - - - - - - - - - gio.

}

Vvcn = \relative do {
   
   R1*2
   R1.*7
   fa,2 fa' sol
   
   %11
   lab sol fa
   mib re do
   R1.*6
   
   %19
   do2 do re
   mib re do
   sib la sol
   
   %22
   R1.*6
   sol'2 r sol,\mbreak
   do r do
   
   %30
   fa,1 r2
   R1.*8
   do'2 r r
   
   %40
   fa sol sol,
   do1

}

Vbcn = \relative do {
   
   si1~
   si2 do
   fa mib fa
   
   %4
   reb do reb\mbreak
   sib do reb
   do lab sib
   
   %7
   do r do
   fa r reb
   sib do do,\mbreak
   
   %10
   fa fa' sol 
   lab sol fa
   mib re do
   
   %13
   lab' sol lab
   fa sol lab
   sol mib fa
   
   %16
   sol r sol,\mbreak
   do r lab
   fa sol1
   
   %19
   do2 do re
   mib re do
   sib la sol
   
   %22
   mib' re mib
   do re mib\mbreak
   re sib do
   
   %25
   re r re
   sol r mib
   do re re,
   
   %28
   sol r sol
   do r do\mbreak
   fa, fa sol
   
   %31
   lab sol fa
   do' sib do
   lab sol lab
   
   %34
   fa sol lab
   sol mib fa
   sol r sol\mbreak
   
   %37
   do r lab
   fa sol1
   do2 r r
   
   %40
   fa sol sol,
   do1

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*2
    <_->1.
    s1.*3
    <_!>1.
    <_->
    s
    s2 <8> <7>
    <6>1.
    <6>
    s1.*3
    <_+>1.
    s
    s
    s1 <7>2
    <6>1.
    <6>
    s
    s
    <_+>
    <_+>1 <_+>2
    s1.
    s
    <_+>2 s <_+>
    <_-> s <_!>
    s1.*5
    <_+>1.
    <_+>2 s <_+>
    s1.*3
    <_->2 <4> <3>
    




}


forma = {

    \time 4/4
    \key sib\major
    \tempo 4 = 50
    s1*2
    \bar "||"
     \once \override Score.RehearsalMark.extra-offset = #'(5 . 0) \mark\markup "Largo"
    \time 3/2
    \tempo 1 = 30
    s1.*38
    \set Score.measureLength = #(ly:make-moment 4 4) s1
    \bar "|."

}

VvlI = {
    %\notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}

Vbasso = {
    \clef bass
    \new Voice = "asia"
    <<\Vbasson \forma>>
}

Vvc = {
    \clef bass
    <<\Vvcn \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset
}





VIvlIn = \relative do'' {

    R1
    r2 fad4 si\parentSlur (
    si) lad r8 si mi,4~

    %4
    mi re dod2
    si r
    R1*3

    %9
    r2 dod4 fad\mbreak
    fad mid r8 fad si4~
    si la sold2

    %12
    fad r
    R1*4
    r4 sol8 si la2

    %18
    r4 mi8 sol fad4 si
    lad r8 fad mi4 r8 mi\p
    fad4 r8 la\f la(sol) r sol\p

    %21
    sol(fad) r fad\f mi4 mi\mbreak
    re2 r
    R1

    %24
    fad4 si si lad
    r8 si mi,2 re4
    dod2 si

    %27
    R1*3
    r2 fad'4 si
    si lad r8 si si dod16 si

    %32
    lad4 si8 fad fad2
    fad1

}

VIvlIIn = \relative do'' {

    r2 dod4 fad
    fad mi mi re
    dod2~dod8 si16 lad si4

    %4
    lad8 fad fad4 fad2
    fad r
    R1*2\mbreak

    %8
    dod'4 fad fad mid
    r8 fad fad4 sold la8 sold16 fad
    sold2~ sold8 fad16 mid fad4

    %11
    mid8 dod dod4 dod2
    dod r
    R1*3

    %16
    r2 r4 fad8 re
    sol2. fad4~
    fad8 si, mi2 re4

    %19
    dod r8 re re4 r8 dod\p
    re4 r8 fad\f fad(mi) r mi\p
    mi(re) r re\f re4 dod\mbreak

    %22
    re2 r
    dod4 fad fad mi
    mi re dod2~

    %25
    dod8 si16 lad si4 lad8 fad fad4
    fad2 fad
    R1*4

    %31
    dod'4 fad fad mi
    mi re dod2
    si1

}

VIbasson = \relative do {

    \autoBeamOff

     R1*3
    re4 si' si lad
    si8 si, re mi\mbreak fad4 fad

    %6
    r si8 la sol fad si8. mi,16
    fad4 si8 dod lad2
    R1*3

    %11
    dod,4 fad fad mid
    fad8 sold la si dod4 dod
    r fad,8 mi re si si' la

    %14
    sol fad si mi, fad4 si8 dod\mbreak
    lad4 si8 re do [si] lad [si]
    fad4. fad8 si,2

    %17
    r r4 fad'8 re
    sol sol sol mi si' si si, si\mbreak
    fad' fad re re sol la16 si la8. la16

    %20
    re,4 re'8 la si4 dod8 dod
    re4 fad, 8 fad sol la16 si la8. la16\mbreak
    re,2 r

    %23
    R1*2
    r2 fad4 si
    si lad si8 si, re mi

    %27
    fad4 fad r si8 la\mbreak
    sol fad si mi, fad4 si8 dod
    lad4 si8 la? sol4 mi

    %30
    r fad8. fad16 si,2
    R1*3

}

VItesto = \lyricmode {

    Son le -- gato_e _ a not -- te os -- cura _ vò cer -- cando _ liber - tà  liber - tà,

    son le -- gato_e _ a not -- te os -- cura _ vò cer -- cando _

    vò cer -- cando _  liber - tà  liber - tà vò cer -- can -- do liber - tà.

   L’au -- reo cri -- ne se mi strin -- se, se m’av -- vinse, _ sua pos -- sanza _ or perde - rà

    perde - rà  perde - rà sua pos -- sanza _ or perde - rà.

    Son le -- gato_e _ a not -- te os -- cura _ vò cer -- cando _ liber - tà  liber - tà,

    vò cer -- can -- do liber - tà.

}

VIvcn = \relative do {

    fad4 si si lad
    r8 sold sold4 lad si
    fad8 dod' fad mi re4 r8 sol,

    %4
    fad lad, si si'\mbreak fad2
    si, r
    R1*2

    %8
    r2 sold'4 dod
    dod si si la
    r8 sold dod si la4 r8 re

    %11
    dod mid, fad fad, dod'2
    fad, r
    R1*4

    %17
    r4 si'8 sol\mbreak re'4 re,
    r sol8 mi si'4 si,
    fad'4 r8 re sol4 la

    %20
    re, fad sol la
    si r8 fad sol4 la
    re,2 fad4 si

    %23
    si lad r8 sold sold4\mbreak
    lad si fad8 dod' fad mi
    re4 r8sol, fad lad, si si'

    %26
    fad2 si,4 r
    R1*5
    fad'4 si si lad

    %33
    si1

}

VIbcn = \relative do {

    si2 fad
    sold lad4 si
    fad'2 si,4 sol'

    %4
    fad si, fad'2
    si,4 si8 sol\mbreak fad4 fad'8 mi
    re4 red mi8 fad sol4

    %7
    fad sol fad2
    fad, dod'
    red mid4 fad

    %10
    dod2 fad4 re\mbreak
    dod fad, dod'2
    fad,4 fad'8 re dod4 dod8 si

    %13
    la4 lad si red
    mi8 fad sol4 fad sol\mbreak
    fad4 re mi2

    %16
    fad si,
    r4 si8 sol re'2
    mi si\mbreak

    %19
    fad'4 re sol la
    re, fad sol la
    si fad sol la\mbreak

    %22
    re,2 si
    fad sold
    lad4 si fad'2

    %25
    si,4 sol' fad si,
    fad'2 si,4. sol8
    fad4 fad'8 mi re4 red\mbreak

    %28
    mi8 fad sol4 fad sol
    fad re mi2
    fad si,

    %31
    fad' sol
    fad4 si, fad'2
    si,1

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <_->2 <4>4 <3+>
    <7> <6> <6 5> s
    <4> <3+> <3 9>8 <8> <6>4
    <7 _+>2 <4>4 <3+>
    s2 <_+>
    s1
    <_+>2 <_+>
    <_->2 <4>4 <3+>
    <7> <6> <6 5> s
    <4> <3+> <3 9>8 <8> <6>4
    <7 _+>2 <4>4 <3>
    s2 <_+>
    s1
    s2 <_+>
    <_+>1
    <4>4 <3> s2
    s4 <6> <4> <3>
    <9 _-> <8> <5 4> <3->
    <_+>1
    s2 s4 <7>
    s1
    s2 <_->
    <4>4 <3+> <7> <6>
    <6 5> s <4> <3+>
    <9>8 <8> <6>4 <7 _+> s
    <4> <3+> s2
    <_+>1
    s2 <_+>
    s1
    <4>4 <3> s2
    <4>4 <3+> <7> <6>
    <7 _+>2 <4>4 <3+>

}


forma = {

    \time 4/4
    \key si\minor
    \tempo 4 = 70
    s1*33
    \bar "||"

}

VIvlI = {
    %\notypeset
    <<\VIvlIn \forma>>

}

VIvlII = {
    <<\VIvlIIn \forma>>

}

VIbasso = {
    \clef bass
    \new Voice = "son"
    <<\VIbasson \forma>>
}

VIvc = {
    \clef bass
    <<\VIvcn \forma>>
}

VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset
}




VIIbasson = \relative do {

    \autoBeamOff

    r4 re8 re sol4 sol8 la
    si4 si r si8 re
    fad,4 fad8 sol sol4 sol

    %4
    r sol8 sol si4 si8 dod
    re re r re, mi fad sol8. fad16
    fad4 fad r la~

    %7
    la la8 do fad, fad r fad16 sol
    la4 la8 sol sol sol r si
    si mi, r mi la la r do,

    %10
    si4 si r8 si' sold si
    mi, mi mi fad sold sold r sold16 la
    si8 si si dod? re4 re8 do

    %13
    do?4 do r la8 la
    si4 si8 dod? re4 r8 la
    fa re mi4 la, mi'8 mi

    %16
    fad4 fad8 sol la4 r8 mi
    do la si4 mi,2

}

VIItesto = \lyricmode {

    Se del Cie -- lo stel -- lato _ le va -- ghezze _ ri -- miro _

    se con -- templo_i _ splen -- dori _ de’ sfavil - lanti _ lumi, _ ah ben com -- prendo _

    che bel -- lezza _ ter -- rena _  è_un fan -- go, è_un fu --mo, un nulla _ e che la notte _

    mi dà luce _ e m’ad -- dita _ il sentie - ro ve -- race _ per di -- scerner _ il ver dal ben falla - ce,

    per di -- scerner _ il ver dal ben falla - ce.

}


VIIbcn = \relative do {

    sol1~
    sol~
    sol

    %4
    sol'
    fad2 mi
    re1

    %7
    red~
    red2 mi
    do1

    %10
    si2 sold~
    sold1~
    sold

    %13
    la2 do
    re4 mi fa do
    re mi la, sol

    %16
    la si do sol
    la si mi,2

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*4
    <6>2 <7>4 <6>
    s1*3
    <7>2 <6>
    <_+>1
    s
    s
    <_->2 <6>
    s4 <_+> s2
    s s4 <6>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 4 = 80
    s1*17
    \bar "||"

}

VIIbasso = {
    %\notypeset
    \clef bass
    \new Voice = "cielo"
    <<\VIIbasson \forma>>
}

VIIbc = {
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
    \typeset
}





VIIIvlIn = \relative do'' {

    R2.*9
    r4. si'8. la16 si8
    sol8. la16 sol8 la8. sol16 la8
    
    %12
    fad8. mi16 fad8 mi8. fad16 sol8\mbreak
    fad4 fad8 mi4.
    R2.*7
    
    %21
    r4. r8 r fad
    re8. dod16 si8 r r sol'
    fad8. mi16 re8 dod4 dod8
    
    %24
    si4. r
    R2.*7
    r8 r si'\mbreak sol8. fad16 mi8
    
    %33
    r r do' si8. la16 sol8
    fad4 fad8 mi4 mi8
    red8. dod16 red8 mi4.

}

VIIIvlIIn = \relative do'' {
   
    R2.*10
    r4. mi8. re16 mi8
    do8. si16 do8 si4 mi8
    
    %13
    mi4 red8 mi4.
    R2.*8
    r8 r re si8. la16 sol8
    
    %23
    si4. si4 lad8\mbreak
    si4. r
    R2.*7
    
    %32
    r4. r8 r sol'
    mi8. re16 do8 mi4.
    mi4 red8 mi4 sol,8
    
    %35
    fad4 fad8 mi4.

}

VIIIbasson = \relative do {

    \autoBeamOff
    
    R2.
    r8 r mi si'8. la16 si8\mbreak
    sol8. fad16 mi8 la8. sol16 la8
    fad8.(mi16) re8 re'8. dod16 re8
    si8. la16 si8 sol8. fad16 sol8
    mi8. re16 do8\mbreak re8. do16 re8
    sol,4. r
    si'8. la16 si8 sol8. fad16 sol8
    mi8. re16 mi8 do8. si16 la8\mbreak
    si8. la16 si8 mi,4.
    R2.*2
    r4. r8 r si'' 
    si8. dod16 re8\mbreak dod8. re16 si8
    lad8. si16 dod8 fad,8. [sold16 lad fad]
    si [si, re si fad' sold] lad[fad si dod re si]
    mi[mi, sol mi la si]\mbreak dod[la re re, fad re]
    sol[fad mi fad sol mi] fad[sold lad fad si si,]
    re[si mi mi, sol mi] fad4 fad8
    r8 r fad' re8. dod16 si8\mbreak
    mi8. fad16 sol8 fad8. mi16 fad8
    si,4. r
    R2.
    r8 r mi mi8. fad16 sol8\mbreak
    fad8. sol16 mi8 red8. mi16 fad8
    si,8.[dod16 red si] mi[fad sol mi si' si,]
    red[si mi fad sol mi] la[ si dod la re? re,?]\mbreak
    fad[re sol la si sol] do[si la si do la]
    si[dod? red si mi mi,] sol[mi la la, do la]
    si4 si8 r r si'
    sol8. fad16 mi8\mbreak la8. si16 dod8
    si8. la16 si8 mi,4.
    R2.*3

}

VIIItesto = \lyricmode {
   
   O stel -- le lu -- centi _ le vo -- stre fa -- vil -- le spezza - no_i lac -- ci
   
   e rendo - no_al co -- re la sua liber - tà spezza - no_i lac -- ci
   
   e rendo - no_al co -- re la sua liber - tà.  
   
   De l’al -- ma_i le -- gami _ tu rom -- pi, tu fran - - - - - - - - gi tu rom -- pi, tu frangi _ 
   
   cele -  ste splen -- dor,
   
   de l’al -- ma_i le -- gami _ tu rom -- pi, tu fran - - - - - - - - gi tu rom -- pi, tu
   
   frangi _  ce -- leste _ splen -- dor.

}

VIIIvcn = \relative do {
   
   r8 r mi si'8. la16 si8
   sol8. fad16 mi8 red8. dod16 red8\mbreak
   mi8. re?16 mi8 dod8. si16 dod8
   
   %4
   re4. fad
   sol8. fad16 sol8 mi8. re16 mi8
   do8. si16 do8\mbreak re8. do16 re8
   
   %7
   sol,4. si'8. la16 si8
   sol8. fad16 sol8 mi8. re16 mi8
   do8. si16 do8 la8. sol16 la8\mbreak
   
   %10
   si8. la16 si8 mi,4.
   mi''8. re16 mi8 do8. si16 do8
   la8. sol16 la8 sol8. fad16 mi8
   
   %13
   si'8. la16 si8 mi,4.
   re4 si8\mbreak mi4 sol8
   fad4 mi8 re4.
   
   %16
   si4 fad'8 fad, si4
   mi la8\mbreak la, re4
   sol8 mi4 fad si8
   
   %19
   si, mi,4 fad fad'8
   re8. dod16 si8 r r si'\mbreak
   sol8. fad16 mi8 fad8. mi16 fad8
   
   %22
   si,4 si'8 sol8. fad16 mi8
   re8. dod16 si8 fad'8. mi16 fad8
   si,4 mi8 mi4.\mbreak
   
   %25
   la,4 do8 si4 la8
   sol4. mi4 si'8
   si' mi,4 la, re8\mbreak
   
   %28
   re, sol4 do8 la4
   si mi8 mi, la4
   si si'8 sol8. fad16 mi8
   
   %31
   r r mi\mbreak do8. si16 la8
   si8. la16 si8 mi4 mi'8
   do8. si16 la8 sol8. fad16 mi8
   
   %34
   si8 s si'8 sol8. fad16 mi8
   si8. la16 si8 mi,4.

}

VIIIbcn = \relative do {
   
   r8 r mi si'8. la16 si8
   sol8. fad16 mi8 red8. dod16 red8\mbreak
   mi8. re?16 mi8 dod8. si16 dod8
   
   %4
   re4. fad
   sol8. fad16 sol8 mi8. re16 mi8
   do8. si16 do8\mbreak re8. do16 re8
   
   %7
   sol,4. si'8. la16 si8
   sol8. fad16 sol8 mi8. re16 mi8
   do8. si16 do8 la8. sol16 la8\mbreak
   
   %10
   si8. la16 si8 mi,4.
   mi'8. re16 mi8 do8. si16 do8
   la8. sol16 la8 sol8. fad16 mi8
   
   %13
   si'8. la16 si8 mi4.
   re4 si8\mbreak mi4 sol8
   fad4 mi8 re4.
   
   %16
   si4 fad'8 fad, si4
   mi la8\mbreak la, re4
   sol8 mi4 fad si8
   
   %19
   si, mi,4 fad fad'8
   re8. dod16 si8 r r si'\mbreak
   sol8. fad16 mi8 fad8. mi16 fad8
   
   %22
   si,4 si'8 sol8. fad16 mi8
   re8. dod16 si8 fad'8. mi16 fad8
   si,4 mi8 mi4.\mbreak
   
   %25
   la,4 do?8 si4 la8
   sol4. mi4 si'8
   si' mi,4 la re8\mbreak
   
   %28
   re, sol4 do,8 la4
   si mi8 mi, la4
   si si'8 sol8. fad16 mi8
   
   %31
   r r mi\mbreak do8. si16 la8
   si8. la16 si8 mi4 mi8
   do8. si16 la8 sol8. fad16 mi8
   
   %34
   si'4 si'8 sol8. fad16 mi8
   si8. la16 si8 mi,4.
   
}

VIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s4 <_->8 <_+>4.
    s2.*5
    s4. <_+>
    s2.*3
    <_->2.
    <_->4. <6>
    <5 4>4 <3+>8 s4.
    <6> <6>
    <_+> s
    s4 <_+>8 s <_->4
    <_->4. s
    s <_+>
    s <_+>
    s2.
    <6>
    <_->
    <6>4. <5 4>4 <3+>8
    s2.
    <6>4. <_+>
    s s4 <_+>8
    s <_->4 s4.
    s2.
    <_+>
    <_+>
    s
    <4>4 <3+>8 <_->4.
    s <6>
    <6 4>4 <3+>8 <6>4.
    <_+>
    
}


forma = {

    \time 6/8
    \key re\major
    \tempo 2. = 39
    s2.*35
    \bar "||"

}

VIIIvlI = {
    %\notypeset
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    <<\VIIIvlIIn \forma>>

}

VIIIbasso = {
    \clef bass
    \new Voice = "stelle"
    <<\VIIIbasson \forma>>
}

VIIIvc = {
    \clef bass
    <<\VIIIvcn \forma>>
}

VIIIbc = {
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
    \typeset
}





IXvlIn = \relative do'' {

   R1*9
   sol16 la si do re8 la\mbreak si sol r fad
   sol re r4 r2

   %12
   R1*2
   r2 re'16 mi fad sol la8 mi
   fad re r dod re la r4

   %16
   R1*3
   r4 la'8 mi fad re r fad\mbreak
   sol8. fad16 mi4 re r

   %21
   R1*3
   r4 r8 sol, si si16 dod re8 la
   si4 sol r2

   %26
   r4 r8 re' fad fad16 sol la8 mi
   fad4 re r2
   R1*3\mbreak

   %31
   r2 r4 sol8 fad
   mi8. re16 dod8 re16 mi fad8 fad mi4
   re r r2

   %34
   R1*4
   r4 re'8 dod si8. la16 sol fad mi re
   dod8 re re8. dod16\mbreak re mi fad sol la4

   %40
   si16 la sol fad mi4 re r

}

IXvlIIn = \relative do'' {

   R1*9
   r2 sol16 la si do re8 la
   si sol r fad sol re r4

   %12
   R1*3
   re'16 mi fad sol la8 mi fad re r dod
   re la r4 r2

   %17
   R1\mbreak
   r2 r4 mi'8 si
   dod la r dod re la r re

   %20
   si16 dod re8 re8. dod16 re4 r
   R1*3
   r4 r8 re, sol sol la fad

   %25
   sol4 re r2\mbreak
   r4 r8 la' re re mi dod
   re4 la r2

   %28
   R1*3
   r4 re8 do si8. la16 sol fad mi re
   dod?8 dod' 16 si la8 si16 dod re8 re re8. dod16

   %33
   re4 r r2\mbreak
   R1*3
   r2 r4 la'8 sol

   %38
   fad8. mi16 re dod si la sol sol' si8. la16 sol fad
   mi8 fad mi4 re8. mi16 fad mi re dod
   si dod re8 re8. dod16 re4 r

}

IXbasson = \relative do {

   \autoBeamOff

   r4 fad2 fad4
   r8 re mi fad lad, lad lad8. si16
   si4 si8 si' fad fad fad sol

   %4
   la la r la16 si\mbreak do4 do8 si
   si4 si r8 sol si8. la16
   la8 la r mi sol sol sol fad
   
   %7
   fad fad r la do do do si\mbreak
   si si sol2 do8 si
   si4 la sol2
   
   %10
   R1
   r2 sol16[la si do] re8 la\mbreak
   si sol si sol la fad sol mi
   
   %13
   fad re re' la si dod re sol,
   la4. la8 re,4 r\mbreak
   R1
   
   %16
   re16[mi fad sol] la8 mi fad re fad re
   mi dod re si dod la la' mi\mbreak
   fad sold la re, mi4. mi8
   
   %19
   la,2 r
   r2 r4 re~
   re re8 mi fad16 fad fad fad fad8 fad16 sol\mbreak
   
   %22
   la4 la la8 la16 si do8 si
   si si r sol si si16 dod  re8 la
   si sol r4 r2
   
   %25
   r4 r8 re fad fad16 sol la8 mi\mbreak
   fad4 re r2
   r4 re'8 do si8. la16[sol fad mi re]
   
   %28
   do16 [sol' do8. si16 la sol] fad [mi re do] si [sol' re'8]~
   re16 [do si la] sol[fad mi re]\mbreak do[do' mi8. re16 do si]
   la[sol fad mi] re[do si la] sol8 sol r sol'
   
   %31
   mi16 [sol] do,[mi] re4 sol, r
   r2\mbreak r4 la'8 sol
   fad8.[mi16 re dod?] si[la sol re'] sol8.[fad16 mi re]
   
   %34
   dod[si la sol] fad[re' la'8. sol16 fad mi] re [dod si la]
   sol[sol' si8. la16 sol fad]\mbreak mi[re dod si] la[sol fad mi]
   re8 re r re'' si16 [re] sol, [si] la4
   
   %37
   re,4 r8 re si16[re] sol,[si] la4
   re r r2
   R1*2

}

IXtesto = \lyricmode {
   
   Not -- te che fra gl’or -- rori_il _ mon -- do_os -- cu -- ra mi gui -- da_e m’assi - cura _ 
   
   col fa -- vor di sue stel -- le e fà che l’al -- ma nel por --  to di sua cal -- ma,
   
   nel por --  to di sua cal -- ma ab -- bia la cal - ma.
   
   Stel - le_a -- miche _ son con --  tento _ se vi mi -- ro, se con --  tem -- plo_il vo -- stro bel - lo.
   
   Stel - le_a -- miche _ son con --  tento _ se vi mi -- ro, se con --  tem -- plo_il vo -- stro bel - lo.
   
   Voi con in -- flussi _ di sa -- lute _ e -- terna _  l’a -- nima _ mi be -- ate, _ 
   
   lo spi -- rito _ ravvi - vate, _  nel por -- to già tro -- vo cal -- ma
   
    più tem --  pes - - - - - - - - - te non te -- me l’al -- ma 
    
    più tem --  pes - - - - - - - - - te non te -- me l’al -- ma non te -- me l’al -- ma.
 
}

IXvcn = \relative do {

   R1*10
   sol'16 la si do re8 la si sol r re
   sol,4 r r2

   %13
   R1*2
   r2 re'16 mi fad sol la8 mi\mbreak
   fad8 re r8 la re4 r

   %17
   R1*2
   r2 r4 re'8 la
   si sol la la, re4 r

   %21
   R1*3
   r4 r8 sol sol4 re
   sol,2 r

   %26
   r4 r8 re'' re4 la
   re,2 r\mbreak
   R1*4

   %32
   r4 la'8 sol fad re la4
   re, r r2
   R1*5

   %39
   r4 la''8 sol fad8. mi16 re dod si la
   sol8 re' la4 re r

}

IXbcn = \relative do {
   
   si1~
   si2 lad
   si1
   
   %4
   fad
   sol2 sol'
   dod,1
   
   %7
   re
   sol,2 do
   re sol,
   
   %10
   sol8 sol' fad re sol, sol' fad re
   sol,16 la si do re8 la si sol fad re\mbreak
   sol4 sol'8 mi fad re mi dod?
   
   %13
   re4 fad8 re sol la si sol
   la sol la la, re re' dod la\mbreak
   re, re' dod la re,16 mi fad sol la8 mi
   
   %16
   fad re dod la re4 re8 si
   dod la si sold la4 dod8 la\mbreak
   re mi fad re mi re mi mi,
   
   %19
   la la' dod la re re, fad re
   sol sol, la4 re2~
   re1~
   
   %22
   re2 re
   sol, sol'4 fad8 re
   sol2 sol4 re
   
   %25
   sol,2 re'4 dod\mbreak
   re2 re4 la
   re fad sol si,
   
   %28
   do la re si
   sol si\mbreak do do'
   fad, re sol, si
   
   %31
   do re sol, mi
   la la'8 sol\mbreak fad re la' la,
   re4 fad, sol mi
   
   %34
   la fad re fad
   sol sol'\mbreak dod,! la
   re fad, sol la
   
   %37
   re si sol la
   re fad, sol2\mbreak
   la8 re la4 re r8 fad,
   
   %40
   sol re' la4 re r

}

IXbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   <_->1
   s
   s
   <6>2 <5->
   s1
   s
   s2 <7->
   s <_->
   <4>4 <3> s2
   s1
   s4 s8 <6> s2
   s1*3
   s2 s4 s8 <6>
   s1*6
   s2 <7->
   s1*5
   s4 <_-> s2
   s1*7
   s4 <6> s2
   s1
   s
   s4 <4> <3> s
   s <4> <3>

}


forma = {

   \time 4/4
   \key re\major
   \tempo 4 = 50
   s1*9
   \bar "||"\break
   \once \override Score.RehearsalMark.extra-offset = #'(+3 . -0.4)\mark\markup\larger "[5.] Aria, presto"
   \tempo 2 = 50
   s1*10
   s2 s4
   \once \override Score.RehearsalMark.extra-offset = #'(+5 . -2)\mark\markup "Adag[io]"
   \tempo 4 = 50
   s4
   s1*2
   s4
   \once \override Score.RehearsalMark.extra-offset = #'(+7 . -2)\mark\markup "Alleg[ro]"
   \tempo 2 = 50
   s2 s4
   s1*17
   \bar "||"

}

IXvlI = {
   %\notypeset
   <<\IXvlIn \forma>>

}

IXvlII = {
   <<\IXvlIIn \forma>>

}

IXbasso = {
   \clef bass
   \new Voice = "notte"
   <<\IXbasson \forma>>
}

IXvc = {
   \clef bass
   <<\IXvcn \forma>>
}

IXbc = {
   \clef bass
   <<\IXbcn \forma \IXbfn>>
   \typeset
}





XvlIn = \relative do'' {
   
   R2.*2
   r4 r si'
   lad4. sold8 lad4
   
   %5
   si4. la?8 sol?4
   fad2 fad4
   R2.*3\mbreak
   
   %10
   r4 la la
   fad re r8 re
   dod si dod re mi dod
   
   %13
   re dod re re, fad sol
   la2 la4 
   R2.
   
   %16
   r4 fad' fad
   si si4. si8
   lad sold lad si lad4\mbreak
   
   %19
   si8 lad si dod si4
   mi,8 re mi fad mi4
   fad2.
   
   %22
   R
   r4 re re
   la' la4. la8
   
   %25
   fad mi fad sol fad4
   mi8 re mi fad mi4
   r re re\mbreak
   
   %28
   sol sol4. sol8
   fad mi fad sol fad4
   mi8 re mi fad mi4
   
   %31
   re8 dod re mi re4
   dod2 r4
   r si si
   
   %34
   dod dod red
   mi mi mi
   mi mi mi\mbreak
   
   %37
   re re dod
   re dod2
   si2.
   
   %40
   r4 fad' fad
   sold sold sold
   lad fad si~
   
   %43
   si si4. lad8
   si2.
   R 
   
   %46
   mi,
   re
   dod
   
   %49
   si
   la\mbreak
   sol 
   
   %52
   fad4 si2~
   si4 lad fad'~
   fad mi2
   
   %55
   fad mi4
   re2.
   dod
   
   %58
   si8 la sold2
   fad r4
   R2.
   
   %61
   r4 r fad'
   mid4. red8 mid4\mbreak
   fad4. mi?8 re?4
   
   %64
   dod2 dod4
   R2.
   r4 dod' dod
   
   %67
   la fad r
   R2.*2
   r4 mi mi
   
   %71
   dod la r8 la'
   sold fad sold la si sold
   la sold la la, dod re\mbreak
   
   %74
   mi2 mi4
   R2.
   r4 dod dod
   
   %77
   fad fad4. fad8
   mid red? mid fad mid4
   fad8 mid? fad sold? fad4
   
   %80
   si,8 la si dod si4
   dod2.
   R
   
   %83
   r4 la la
   mi' mi4. mi8
   dod si dod re dod4
   
   %86
   si8 la si dod si4
   la8 sold la si la4
   sold2.
   
   %89
   r4 fad' fad
   sold sold lad
   si si si\mbreak
   
   %92
   si si si
   si la sold
   fad2.~
   
   %95
   fad4 fad4. mid8
   r4 fad sold
   la2.
   
   %98
   sold
   fad
   mi2 r4
   
   %101
   si'2.
   la
   sold\mbreak
   
   %104
   fad
   mi
   re
   
   %107
   dod
   r4 si'2~
   si4 la2
   
   %110
   si4 dod2
   fad,2.~
   fad4. mi8 re4~
   
   %113
   re dod2
   si2.
   sold2 dod4
   
   %116
   lad2 si si4. lad8
   si2.
 
}

XvlIIn = \relative do'' {
   
   R2.*4
   r4 r si'
   lad4. sold8 lad4
   
   %7
   si4. la?8 sol?4
   fad2 fad4
   R2.*3
   
   %12
   r4 la la
   fad re r8 fad
   mi re mi dod re mi\mbreak
   
   %15
   re8 dod re mi re4  
   dod2 dod4
   r si si
   
   %18
   fad' fad r8 fad 
   re dod re mi re4
   dod8 si dod re dod4
   
   %21
   re2.
   r4 la la
   re re, r8 re'\mbreak
   
   %24
   dod si dod re dod4
   re8 dod re mi re4
   r la la
   
   %27
   re la r8 re
   dod si dod re dod4
   re8 dod re mi re4 
   
   %30
   r dod dod
   si8 lad si dod si4\mbreak
   r fad fad
   
   %33
   sold sold sold
   lad lad lad
   si2 si4 
   
   %36
   fad' fad fad
   fad si2~
   si4 si4. lad8
   
   %39
   si4 si, si
   dod fad, fad'~
   fad mi mi
   
   %42
   mi2 re4~\mbreak
   re dod2
   si2.
   
   %45
   r4 re2~
   re4 dod2~
   dod4 si2~
   
   %48
   si4 la2~
   la4 sol2~
   sol4 fad2~
   
   %51
   fad4 mi2~
   mi4 re2
   dod4 dod'2
   
   %54
   si2.
   mi~
   mi4 si2~
   
   %57
   si4 la8 sold la4\mbreak
   sold8 fad fad4. mid8 
   fad2 fad'4
   
   %60
   mid4. red8 mid4
   fad4. mi?8 re?4
   dod2 dod4
   
   %63
   R2.*2
   r4 fad fad
   mid dod r
   
   %67
   R2.*5
   r4 mi mi
   dod la r8 dod
   
   %74
   si la si sold la si
   la sold la si la4
   sold2. 
   
   %77
   r4 fad fad
   dod' dod4. dod8
   la sold la si la4\mbreak
   
   %80
   sold8 fad sold la sold4
   la2.
   r4 mi' mi
   
   %83
   la la4. la8
   sold fad sold la sold4
   la8 sold la si la4
   
   %86
   r sold sold\mbreak
   fad8 mi fad sold? fad4
   r dod dod
   
   %89
   red red red
   mid mid mid
   fad fad si,
   
   %92
   dod dod dod
   dod dod si
   la la4. sold8
   
   %95
   la4 sold2
   fad2.\mbreak
   r4 dod'\solo red
   
   %98
   mi2.
   re
   dod4 la'2~
   
   %101
   la4 sold2~
   sold4 fad2~
   fad4 mi2~
   
   %104
   mi4 re2~
   re4 dod2~
   dod4 si2~
   
   %107
   si4 lad fad'~
   fad mi2
   fad2.\mbreak
   
   %110
   sold
   lad4 si2
   dod si4~
   
   %113
   si si4. lad8
   si4 fad2~
   fad4 mi2~
   
   %116
   mi re dod
   si2.
   
}

Xbasson = \relative do {

    \autoBeamOff
    
    r4 r si'
    lad4. sold8 lad4
    si4. la?8 sol?4 
    
    %4
    fad2 fad4
    R2.*3\mbreak
    r4 fad fad
    
    %9
    re si r8 si'
    la [sol la si dod la]
    re [dod re re, fad sol]
    
    %12
    la2 la4
    R2.
    r4 la la
    
    %15
    si si si,\mbreak
    fad'2 fad4
    R2.
    
    %18
    r4 fad fad
    si2 si4
    r la la
    
    %21
    re re4. re8
    dod [si dod re] dod4
    si8 [la si dod] si4
    
    %24
    la2.\mbreak
    r4 re, re
    la' la4. la8
    
    %27
    fad [mi fad sol] fad4
    mi8 [re mi fad] mi4
    re2 re'4
    
    %30
    dod la r
    r r si
    lad fad r\mbreak
    
    %33
    R2.
    r4 fad fad
    sold sold sold
    
    %36
    lad lad lad
    si re, mi 
    fad2.
    
    %39
    si,
    R
    R2.*3\mbreak
    
    %44
    r4 si' dod
    re fad, sol
    la la, la'
    
    %47
    si si,8 [dod re mi]
    fad4 fad, fad'
    sol sol,8 [la si dod]
    
    %50
    re4 re, re'
    mi mi8[fad sol la]\mbreak
    si4 si,8 [dod re mi]
    
    %53
    fad2 fad4
    r si2~
    si4 la2~
    
    %56
    la4 sold fad
    mid dod fad
    si, dod2
    
    %59
    fad,2.
    R2.*3
    r4 r fad' 
    
    %64
    mid4. red8 mid4
    fad4. mi?8 re?4
    dod2 dod4
    
    %67
    R2.
    r4 dod' dod
    la fad r8 fad
    
    %70
    mi [re mi fad sold mi]\mbreak
    la [sold la la, dod re]
    mi2 mi4
    
    %73
    R2.
    r4 mi mi
    fad fad fad,
    
    %76
    dod'2 dod4
    R2.
    r4 dod dod
    
    %79
    fad2 fad4 
    r mi mi\mbreak
    la la4. la8
    
    %82
    sold [fad sold la] sold4
    fad8 [mi fad sold] fad4
    mi2.
    
    %85
    r4 r la
    sold mi r
    r r fad
    
    %88
    mid dod r\mbreak
    R2.
    r4 dod dod
    
    %91
    red red red
    mid mid mid
    fad fad sold
    
    %94
    la la4. si8
    dod2.
    fad,
    
    %97
    R2.*2
    r4 fad sold\mbreak
    la dod, re
    
    %101
    mi mi, mi'
    fad fad8 [sold la si]
    dod4 dod, dod'
    
    %104
    re re,8[mi fad sol]
    la4 la, la'
    si si,8[dod re mi]
    
    %107
    fad2 fad4\mbreak
    R2.
    r4 fad2~
    
    %110
    fad4 mi2~
    mi4 re (si)
    lad fad' si
    
    %113
    mi, fad2
    si, si'4
    mi,4 mi mi
    
    %116
    fad2 si, fad'
    si,2.
    
}

Xtesto = \lyricmode {
   
   A -- manti _ che di -- te che di -- te, le lu -- singhe _ sprez -- za - - te
   
   o -- gni lar -- va sban -- dite, _  non te --  mete _ non te --  mete _ pu -- gna - - - te
   
   non te --  mete _ pu -- gna - - - te pu -- gnate _ pu -- gnate _ 
   
   de le pal -- me chi pu -- gna è ve -- ro e --  -- re -- de
   
   a chi for --  te com -- bat - - - - - - - - - - - - - - - - - te il sen - so ce - - - - de.
   
   A -- manti _ che di -- te che di -- te, le lu -- singhe _ sprez -- za - - te
   
   o -- gni lar -- va sban -- dite, _  non te --  mete _ non te --  mete _ pu -- gna - - - te pu -- gnate _ pu -- gnate _
   
   de le pal -- me chi pu -- gna chi pu -- gna è ve -- ro e --  -- re -- de
   
   a chi for --  te com -- bat - - - - - - - - - - - - - - -  te il sen -- so ce - - - - de il sen -- so il sen -- so ce -- de.
 
}

Xvcn = \relative do {
   
   R2.*5
   r4 fad fad
   re si si'
   
   %8
   lad4. sold8 lad4
   si2 si,4
   R2.*3
   
   %13
   r4 re' re
   dod la r8 la
   si8 lad si dod re mi
   
   %16
   fad2 fad,4
   R2.
   r4 fad fad
   
   %19
   si2 si,4
   la'2 la,4
   r re re
   
   %22
   la' la r8 la
   si2 si4
   r la la
   
   %25
   re re4. re8
   dod si dod re dod4
   fad,8 mi fad sol fad4
   
   %28
   mi2 mi4\mbreak
   re2 re4
   la'2 la,4
   
   %31
   si si' si,
   fad'2.
   R2.*2
   
   %35
   r4 si si
   dod dod dod
   re re mi
   
   %38
   fad fad,2
   si si,4
   fad' re re
   
   %41
   mi mi mi
   fad fad sol
   mi fad2\mbreak
   
   %44
   si,2.
   r4 fad' sol
   la2 la,4
   
   %47
   si2 si'4
   fad2 fad,4
   sol2 sol'4
   
   %50
   re2 re4
   mi2 mi4
   si'2 si,4
   
   %53
   fad' fad, fad'
   sol sol, sol'
   fad fad, fad'
   
   %56
   si,2 si4
   dod2 fad4\mbreak
   si, dod2
   
   %59
   fad4 la si
   dod si dod
   fad,2 r4
   
   %62
   R2.*2 
   r4 dod' dod
   la fad r
   
   %66
   R2.
   r4 fad fad
   mid dod2
   
   %69
   fad fad4
   mi2.
   la,
   
   %72
   R\mbreak
   r4 la' la
   sold mi r8 mi
   
   %75
   fad mi fad sold la si
   dod2 dod,4
   R2.
   
   %78
   r4 dod dod
   fad2 fad,4
   mi'2 mi,4
   
   %81
   r la' la
   mi' mi4. mi8
   fad2 fad,4\mbreak
   
   %84
   r mi mi
   la la4. la8
   mi2 mi4
   
   %87
   fad2 fad4
   dod'2.
   R2.*2
   
   %91
   r4 fad, fad
   sold sold sold
   la la si
   
   %94
   dod2 si4
   dod dod,2
   fad2.
   
   %97
   R\mbreak
   r4 \solo sold la
   si fad sold
   
   %100
   la dod, re
   mi2 mi4
   fad2 fad4
   
   %103
   dod'2 dod4
   re2 re,4
   la'2 la4
   
   %106
   si2 si,4
   fad' fad, fad'
   sol2 sol4\mbreak
   
   %109
   fad\clef tenor \key re\major fad'2~
   fad4 mi2~
   mi4 re si
   
   %112
   lad fad si
   \clef bass \key re\major mi, fad2
   si,2.
   
   %115
   mi
   fad2 si, fad'
   si,2.
   
}

Xbcn = \relative do {
   
   si2.
   lad
   si2 sol4 
   
   %4
   fad2.
   si2 mi4 
   fad2.\mbreak
   
   %7
   si,2 mi4 
   fad2.
   si,2 si4
   
   %10
   la2.
   re
   la
   
   %13
   re
   la
   si\mbreak
   
   %16
   fad
   R
   r4 fad fad
   
   %19
   si2.
   la
   re
   
   %22
   dod
   si
   la\mbreak
   
   %25
   r4 re re 
   la2.
   fad
   
   %28
   mi
   re 
   la'
   
   %31
   si
   fad\mbreak
   R
   
   %34
   r4 fad' fad
   sold sold sold 
   lad lad lad
   
   %37
   si re, mi 
   fad fad,2
   si2.
   
   %40
   fad'4 re2
   mi2.
   fad2 sol4
   
   %43
   mi fad2\mbreak
   si,2.
   r4 fad sol
   
   %46
   la2.
   si
   fad'
   
   %49
   sol
   re
   mi
   
   %52
   si
   fad'
   sol
   
   %55
   fad
   si,
   dod2 fad4
   
   %58
   si, dod2
   fad,4 la si
   dod si dod
   
   %61
   fad,2 si4 
   dod2.\mbreak
   fad,4 la si 
   
   %64
   dod2.
   fad,2 re'4 
   dod2.
   
   %67
   fad,
   dod'
   fad
   
   %70
   mi\mbreak
   la,
   mi'
   
   %73
   la,
   mi'
   fad
   
   %76
   dod
   R
   r4 dod dod
   
   %79
   fad2.
   mi\mbreak
   la
   
   %82
   sold
   fad
   mi
   
   %85
   la,
   mi'
   fad
   
   %88
   dod\mbreak
   R
   r4 dod dod
   
   %91
   red2 red4
   mid2 mid4
   fad fad, sold
   
   %94
   la2 si4
   dod2.
   fad,
   
   %97
   R2.*2
   r4 fad' sold\mbreak
   la dod, re
   
   %101
   mi2.
   fad
   dod
   
   %104
   re
   la
   si
   
   %107
   fad\mbreak 
   sol
   fad4 fad'2~
   
   %110
   fad4 mi2~
   mi4 re si
   lad fad si
   
   %113
   mi fad2 
   si,2.
   mi
   
   %116
   fad2 si, fad'
   si,2.
 
}

Xbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s2.*2
    s2 <6>4
    <_+>2.
    s2 <_->4
    <_+>2.
    s
    <_+>
    s2.*7
    <_+>2.
    s
    s4 <_+> s
    s2.*8
    <6>2.
    <6>
    s2.*3
    <_+>2.
    s
    s4 <5 _+> <6+>
    <6>2.
    <6 5>
    s4 <6>2
    <4>4 <3+>2
    s2.
    <_+>
    <9 _+>4 <8>2
    <7 _+>2.
    <7 5>4 <4> <3+>
    s2.
    s4 <6>2
    <4>4 <3>2
    <9 _->4 <8>2
    <5 4>4 <3->2
    <3 9>4 <8>2
    <4>4 <3>2
    <9 _->4 <8>2
    <5 4>4 <3->2
    <4>4 <3+>2
    <7>4 <6>2
    <4>4 <3->2 
    <7>4 <6+> s
    <7  _+>2 <_->4
    s <4> <3+>
    s <6>2
    <_+>2.
    s2 <_->4 
    <_+>2.
    s
    <_+>
    <_->2 <6>4
    <_+>2.
    <_->
    <_+>
    <_->
    <_+>
    s
    <_+>
    s
    <_+>
    <_-> 
    <_+>
    s
    s4 <_+>2
    <_->2.
    <_+>
    s2.*3
    <_+>2.
    s
    <_+>
    <_->
    <_+>
    s
    s4 <5 _+> <6+>
    <6>2.
    <6 5>
    <4>4 <3-> s
    <6>2 <6+ 5>4
    <6 4> <5 3+> s
    s2.*3
    s4 <6> s
    s <6> s
    <5 4> <3+> s 
    <_- 9 > <8> s
    <5+ 4>4 <3-> s
    <9> <8> s
    <4> <3> s
    <9 _-> <8> s
    <4> <3+> s
    <7> <6> s
    <4> <3->2
    <2+>4 <6>2
    <2>4 <6>2
    s2.
    <5>4 <4> <3+> s2.
    <9 _+>4 <8> s
    <7 _+>2 s <4>4 <3+>

}


forma = {

    \time 3/4
    \key si\minor
    \tempo 2. = 50
    s2.*115
    \set Score.measureLength = #(ly:make-moment 3 2)
    s1.
    s2.
    \bar "|."

}

XvlI = {
    %\notypeset
    <<\XvlIn \forma>>

}

XvlII = {
    <<\XvlIIn \forma>>

}

Xbasso = {
    \clef bass
    \new Voice = "amanti"
    <<\Xbasson \forma>>
}

Xvc = {
    \clef bass
    <<\Xvcn \forma>>
}

Xbc = {
    \clef bass
    <<\Xbcn \forma \Xbfn>>
    \typeset
}

\pointAndClickOff

global = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f

}

\paper {

   print-first-page-number = ##t
   first-page-number = #2

}

\bookpart {

   \paper {

      systems-per-page = #6

   }

   \header {
      subtitle = \markup "Perdite dell'Ottomano - Op. I/3"
      composer = \markup {"G. A. Perti (1661-1756)"}
   }

   \markup \huge {[1.] Rec[itativo]}

   \score {

      \new ChoirStaff <<

         \new Staff  <<
            \set Staff.midiInstrument = #"voice aahs"
            \set Staff.instrumentName = \markup {"Basso"}
            \Ibasso\global
            \new Lyrics \lyricsto "perdite" \Itesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \Ibc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 2\cm
         incipit-width =2\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #10
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[2.] Sinfonia}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \IIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \IIvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.midiInstrument = #"voice aahs"
            \IIbasso \global
            \new Lyrics \lyricsto "fama" \IItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \IIvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \IIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[3.] Rec[itativo]}

   \score {

      \new ChoirStaff <<

         \new Staff  <<
            \set Staff.midiInstrument = #"voice aahs"
            \set Staff.instrumentName = \markup {"Basso"}
            \IIIbasso\global
            \new Lyrics \lyricsto "quando" \IIItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \IIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 2\cm
         incipit-width =2\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #10
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[4.] Aria, allegro}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \IVvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \IVvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.midiInstrument = #"voice aahs"
            \IVbasso \global
            \new Lyrics \lyricsto "non" \IVtesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \IVvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \IVbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[5.] Così dell'Asia in torbido linguaggio}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \VvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \VvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.midiInstrument = #"voice aahs"
            \Vbasso \global
            \new Lyrics \lyricsto "asia" \Vtesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \Vvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \Vbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \header {
      subtitle = \markup "La Notte illuminata - Op. I/4"
      composer = \markup {"G. A. Perti (1661-1756)"}
   }

   \markup \huge {[1.] Adagio, e staccato}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \VIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \VIvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.midiInstrument = #"voice aahs"
            \VIbasso \global
            \new Lyrics \lyricsto "son" \VItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \VIvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \VIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[2.] Rec[itativo]}

   \score {

      \new ChoirStaff <<

         \new Staff  <<
            \set Staff.midiInstrument = #"voice aahs"
            \set Staff.instrumentName = \markup {"Basso"}
            \VIIbasso\global
            \new Lyrics \lyricsto "cielo" \VIItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \VIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 18)
         indent = 2\cm
         incipit-width =2\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #10
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[3.] Allegro}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \VIIIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \VIIIvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.midiInstrument = #"voice aahs"
            \VIIIbasso \global
            \new Lyrics \lyricsto "stelle" \VIIItesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \VIIIvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \VIIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[4.] Rec[itativo]}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \IXvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \IXvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.midiInstrument = #"voice aahs"
            \IXbasso \global
            \new Lyrics \lyricsto "notte" \IXtesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \IXvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \IXbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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

   \markup \huge {[6.] Andante}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
            \set Staff.midiInstrument = #"violin"
            \XvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
            \set Staff.midiInstrument = #"violin"
            \XvlII\global
         >>

         \new Staff  <<
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \set Staff.midiInstrument = #"voice aahs"
            \Xbasso \global
            \new Lyrics \lyricsto "amanti" \Xtesto
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \set Staff.midiInstrument = #"cello"
            \Xvc\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Basso"\vspace #-0.2"Continuo"}
            \set Staff.midiInstrument = #"church organ"
            \Xbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #2
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
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