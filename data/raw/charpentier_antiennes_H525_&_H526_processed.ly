\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"


acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

arco = _\markup \italic "arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzic."

soli = ^\markup \italic { seules}

dolce = _\markup \italic { dolce }

solo = ^\markup \italic { seul }

tu = ^\markup \italic "tous"

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
   \override TupletBracket.bracket-visibility = ##f
}


IflIn = \relative do'' {

    r4 re fad sol
    la sol8 fad mi4 fad
    sol fad8 mi re4 mi

    %4
    fad fad8 sol la4 sol8 fad
    mi4 fad sol2
    re4 mi fad sol

    %7
    la si mi, re
    mi la sol la
    fad2 la

    %10
    mi sol
    re4 mi fad mi8 re\mbreak
    dod4 re mi re8 dod

    %13
    si dod re dod si4. la8
    la4 la dod re
    mi1

    %16
    r4 mi fad sold
    la1~
    la2 la,4 si

    %19
    dod re mi re8 dod
    si4 dod re dod8 si
    lad4 si si4. lad8

    %22
    si4 si'^\markup\italic "fl[ûtes] seules" la si8 la\mbreak
    sol4 sol fad sol8 fad
    mi [sol la si do si la sol]

    %25
    fad2 r
    r4 si la si8 la
    sol4 la8 sol fad4 si

    %28
    sold1
    r4 mi\tu re mi8 re
    do[do re mi fa mi re do]

    %31
    si2 \parenthesize r \mbreak
    r4 mi re mi8 re
    do4 re8 do si4 mi

    %34
    dod! mi^\markup\italic "fl[ûtes] seules" fad sol
    la sol8 fad mi4 fad
    sol4 fad8 mi re4 mi

    %37
    fad fad8 sol la4 sol8 fad
    mi4 fad sol2
    re4 mi fad sol

    %40
    la si mi, re
    mi la sol la8 sol\mbreak
    fad4 fad mi fad8 mi

    %43
    re[fad sol la si la sol fad]
    mi2 r
    r4 la sol la8 sol

    %46
    fad4 sol8 fad mi4 la
    fad re\tu mi fad
    sol fad8 mi re4 mi

    %49
    fad fad8 sol la4 sol8 fad
    mi4 dod re mi\mbreak  %%fine pagina
    la, re do re8 do

    %52
    si4 si' sol si
    la fad la si
    sol mi dod? la'

    %55
    fad re fad la
    mi dod mi fad
    re si sold mi'

    %58
    dod la la'2~
    la4 re, sol2~
    sol4 dod, fad4. fad8\mbreak

    %61
    fad4 si mi,4. mi8
    mi4 dod la la'^\markup\italic "fl[ûtes] seules" ~
    la sol~sol fad~

    %64
    fad mi mi4.\upprall re8
    re2. la'4\tu~
    la sol~sol fad~

    %67
    fad mi mi4.\upprall re8
    re\breve

}

IflIIn = \relative do'' {

    r4 re fad sol
    la sol8 fad mi4 fad
    sol fad8 mi re4 mi

    %4
    fad fad8 sol la4 sol8 fad
    mi4 fad sol2
    re4 mi fad sol

    %7
    la si mi, re
    mi la sol la
    fad2 la

    %10
    mi sol
    re4 mi fad mi8 re\mbreak
    dod4 re mi re8 dod

    %13
    si dod re dod si4. la8
    la4 la dod re
    mi1

    %16
    r4 mi fad sold
    la1~
    la2 la,4 si

    %19
    dod re mi re8 dod
    si4 dod re dod8 si
    lad4 si si4. lad8

    %22
    si4 r r2\mbreak
    r4 si'\soli la si8 la
    sol[mi fad sol la sol fad mi]

    %25
    red4 si' la si8 la
    sol4 sol fad sol8 fad
    mi4 mi mi4.\prall re8

    %28
    mi1
    r4 mi\tu re mi8 re
    do[do re mi fa mi re do]

    %31
    si2 \parenthesize r \mbreak
    r4 mi re mi8 re
    do4 re8 do si4 mi

    %34
    dod! r r2
    r4 la\soli dod re
    mi re8 dod si4 dod

    %37
    re dod8 si la4 si
    dod re mi2
    si4 dod re2~

    %40
    re4 mi8 re dod4 si
    dod2 r\mbreak
    r4 la' sol la8 sol

    %43
    fad[re mi fad sol fad mi re]
    dod4 la' sol la8 sol
    fad4 fad mi fad8 mi

    %46
    re4 re re4.\prall dod8
    re4 re\tu mi fad
    sol fad8 mi re4 mi

    %49
    fad fad8 sol la4 sol8 fad
    mi4 dod re mi\mbreak  %%fine pagina
    la, re do re8 do

    %52
    si4 si' sol si
    la fad la si
    sol mi dod? la'

    %55
    fad re fad la
    mi dod mi fad
    re si sold mi'

    %58
    dod la la'2~
    la4 re, sol2~
    sol4 dod, fad4. fad8\mbreak

    %61
    fad4 si mi,4. mi8
    mi4 dod la r
    re\soli mi dod re

    %64
    si sol sol4. la8
    fad2. la'4\tu~
    la sol~sol fad~

    %67
    fad mi mi4.\upprall re8
    re\breve

}

Ivln = \relative do'' {

    r4 re fad sol
    la sol8 fad mi4 fad
    sol fad8 mi re4 mi

    %4
    fad fad8 sol la4 sol8 fad
    mi4 fad sol2
    re4 mi fad sol

    %7
    la si mi, re
    mi la sol la
    fad2 la

    %10
    mi sol
    re4 mi fad mi8 re\mbreak
    dod4 re mi re8 dod

    %13
    si dod re dod si4. la8
    la4 la dod re
    mi1

    %16
    r4 mi fad sold
    la1~
    la2 la,4 si

    %19
    dod re mi re8 dod
    si4 dod re dod8 si
    lad4 si si4. lad8

    %22
    si4 r r2
    R1*6
    r4 mi re mi8 re
    do[do re mi fa mi re do]

    %31
    si2 \parenthesize r \mbreak
    r4 mi re mi8 re
    do4 re8 do si4 mi

    %34
    dod! r r2
    R1*12
    r4 re mi fad
    sol fad8 mi re4 mi

    %49
    fad fad8 sol la4 sol8 fad
    mi4 dod re mi\mbreak  %%fine pagina
    la, re do re8 do

    %52
    si4 si' sol si
    la fad la si
    sol mi dod? la'

    %55
    fad re fad la
    mi dod mi fad
    re si sold mi'

    %58
    dod la la'2~
    la4 re, sol2~
    sol4 dod, fad4. fad8\mbreak

    %61
    fad4 si mi,4. mi8
    mi4 dod la r
    R1*2

    %65
    r2. la'4~
    la sol~sol fad~
    fad mi mi4.\upprall re8

    %68
    re\breve

}

Ihcn = \relative do'' {

    R1
    r4 la dod re
    mi re8 dod si4 dod
    
    %4
    re dod8 si la4 si
    dod re mi2
    si4 dod re2~
    
    %7
    re4 mi8 re dod4 si
    dod dod re mi
    la, si do si8 la
    
    %10
    sol4 la si la8 sol
    fad4 sol la sol8 fad\mbreak
    mi4 fad8 sold la4 si8 la
    
    %13
    sold?4 la8 fad mi4. mi8
    mi1
    r4 sold la si
    
    %16
    dod2 r
    r4 dod re mi
    fad2 r
    
    %19
    la, sol?4 la
    si la8 sol fad4 sol
    fad sol fad4. fad8
    
    %22
    fad2 r
    R1*5
    r4 mi' re mi8 re
    
    %29
    do4 do si do8 si
    la[la si do re do si la]
    sold4 mi' re mi8 re\mbreak
    
    %32
    do4 do si do8 si
    la4 la la4.\prall sold8
    la2 r
    
    %35
    R1*13
    r4  la si dod
    re dod8 si la4 si
    
    %50
    dod la sol la8 sol\mbreak %% fine pagina
    fad4 fad sol la
    sol re' re re
    
    %53
    re2. re4
    si2 la
    la4 la la re
    
    %56
    la la la la
    fad2 mi
    mi4 mi'~mi dod
    
    %59
    re si~si mi
    dod la~la re\mbreak
    si2 si4. si8
    
    %62
    dod4 la mi r
    R1*2
    r2. la4
    
    %66
    si mi dod re\parenthesize ~
    re si la4. la8
    la\breve 
  
}

Itln = \relative do' {
   
   R1*3
   r4 re fad sol
   la sol8 fad mi4 fad
   
   %6
   sol fad8 mi re4 mi
   fad sol la si
   la1~
   
   %9
   la2 r4 re,
   mi re8 do si4 do
   re dod?8 si la4 si\mbreak
   
   %12
   la la' la fad
   mi fad sold8 fad mi re
   dod2 r
   
   %15
   r4 mi fad sold
   la2 r
   r4 la si dod
   
   %18
   re2 r
   mi,4 fad sol fad8 mi
   re4 mi fad mi8 re
   
   %21
   dod4 re dod fad8 mi
   red2 r
   R1*5
   
   %28
   r4 sold sold sold
   la la sold sold
   la2 fa
   
   %31
   mi4 sold sold sold\mbreak
   la la sold sold
   la fa mi4. mi8
   
   %34
   mi2 r
   R1*14
   r4 re fad sol
   
   %50
   la mi8 fad sol4 mi\mbreak
   re fad mi re
   re sol si sol
   
   %53
   re la' fad fad
   mi sol mi dod
   re fad re8 mi fad sol
   
   %56
   la4 mi dod dod
   si re si sold
   la dod dod mi
   
   %59
   re fad re sol?
   mi2 la8 sol fad mi\mbreak
   re4 re' si4. si8
   
   %62
   la4 mi dod r
   R1*2
   r2 r4  re
   
   %66
   re sol la la
   re, mi dod la'8 sol
   fad\breve

}


Ibsn = \relative do {

    R1*7
    r4 la' si dod
    re do8 si la4 si

    %10
    do si8 la sol4 la
    si la8 sol fad4 sol\mbreak
    la re, dod? re

    %13
    mi re mi mi,
    la1
    R1*3

    %18
    r4 re fad sol
    la4 sol8 fad mi4 fad
    sol fad8 mi re4 mi

    %21
    fad mi fad fad,
    si2 r\mbreak
    R1*6
    mi1

    %30
    la2 re,
    mi1\mbreak
    mi

    %33
    fa4 re mi2
    la, r
    R1*15

    %50
    r4 la' si dod\mbreak
    re re, mi fad

    %52
    sol2. sol4
    fad2. re4
    mi2 la

    %55
    re,2. re4
    dod2. la4
    si2 mi

    %58
    la,2. la'4
    si2. mi,4
    la2. re,4\mbreak

    %61
    sol2 sold4. sold8
    la2. r4
    R1*2

    %65
    r2. fad4
    sol mi fad re
    si sol la2

    %68
    re,\breve

}


Imdn = \relative do'' {

    R1*7
    s1*14
    s4 si'la si8 la\mbreak

    %23
    sol4 <si sol> <la fad> <si sol>8 <la fad>
    <sol mi> [<sol mi> <la fad> <si sol> <do la> <si sol> <la fad> <sol mi>]
    <<fad2\\{red4 si'}>> la si8 la

    %26
    sol4 <si sol> <la fad> <si sol>8 <la fad>
    <sol mi>4 <<{la8 sol fad4 si}\\{ mi,4 mi4.\prall re8}>>
    <sold mi>1

    %29
    s1*8
    <fad re>4 <fad dod>8 <sol si,> <la la,>4 <<{sol8 fad}\\\stemUp si,4>>
    <mi dod>4 <fad re> <sol mi>2

    %39
    <re si>4 <mi dod> <<{fad sol
                         la}\\{\stemUp re,2~
                               re4}>> <<si'4\\{ mi,8 re}>> <mi dod>4 <re si>
    <<{mi la}\\dod,2>>  sol'4 la8 sol\mbreak

    %42
    fad4 <la fad> <sol mi> <la fad>8 <sol mi>
    <fad re>[<fad re> <sol mi> <la fad> <si sol> <la fad> <sol mi> <fad re>]
    <<mi2\\{dod4 la'}>> sol la8 sol

    %45
    fad4 <la fad> <sol mi> <la fad>8 <sol mi>
    <fad re>4 <<{sol8 fad}\\re4>> <<{mi4 la}\\{re,4.\prall dod8}>>
    <fad re>4 r r2

    %48
    s1*14
    s2 s4 <<{\stemNeutral la~
    la sol~sol fad~

    %64
    fad }\\{\stemNeutral s4
           re mi dod re
           si}>> <mi sol,> <mi sol,>4. \upprall <re la>8
    <re fad,>2. s4
    s1*2

    %68
    s\breve

}


Imsn = \relative do {

    R1*7
    r4 la' si dod
    re do8 si la4 si

    %10
    do si8 la sol4 la
    si la8 sol fad4 sol\mbreak
    la re, dod? re

    %13
    mi re mi mi,
    la1
    R1*3

    %18
    r4 re fad sol
    la4 sol8 fad mi4 fad
    sol fad8 mi re4 mi

    %21
    fad mi fad fad,
    si1_\markup\italic \center-column{"orgue seul - l'orgue icy joüe"\vspace #-0.2"les parties des flutes"}\mbreak
    si1

    %24
    mi2 la,
    si1
    si

    %27
    do4 la si2
    mi1
    mi\tu

    %30
    la2 re,
    mi1\mbreak
    mi

    %33
    fa4 re mi2
    la, r
    R1*2

    %37
    \clef alto \key re\major r4_\markup\italic\center-column {"orgue seul jouant les"\vspace #-0.2"parties des fl[utes]"} re' fad sol
    la sol8 fad mi4 fad
    sol fad8 mi re4 mi

    %40
    fad sol la si
    la1\mbreak
    la

    %43
    re2 sol,
    la1
    la

    %46
    si4 sol la2
    re, r
    R1

    %49
    \clef bass\key re\major R
    r4 la\tu si dod\mbreak
    re re, mi fad

    %52
    sol2. sol4
    fad2. re4
    mi2 la

    %55
    re,2. re4
    dod2. la4
    si2 mi

    %58
    la,2. la'4
    si2. mi,4
    la2. re,4\mbreak

    %61
    sol2 sold4. sold8
    la2. fad4_\markup\italic\center-align\column{ "orgue seul jouant les"\vspace #-0.2"parties des fl[utes]"}
    si mi, la re,

    %64
    sol2 la4 la,
    re2. fad4\tu
    sol mi fad re

    %67
    si sol la2
    re,\breve

}


Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s1*27
   <8 _+>2 <7>
   <6 4> <7 5 3+>
   <_-> <_->
   <8 _+> <7>
   <6 4> <7 5 3+>
   s1*8
   <8>2 <7>
   <6 4> <7 3>
   s s
   <8> <7>
   <6 4> <7 5 3>
   
}


forma = {

   \time 2/2
   \override Staff.TimeSignature.style = #'single-digit
   \tempo 1 = 50
   \key re\major
   s1*67
   s\breve
   \bar"|."

}

IflI = {
   \Iglobal
   %\notypeset
   <<\IflIn \forma>>

}

IflII = {
   \Iglobal
   <<\IflIIn \forma>>

}

Ivl = {
   \Iglobal
   <<\Ivln \forma>>

}

Ihc = {
   \Iglobal
   <<\Ihcn \forma>>

}

Itl = {
   \Iglobal
   <<\Itln \forma>>

}

Ibs = {
   \Iglobal
   \clef bass
   <<\Ibsn \forma >>

}

Imd = {
   \Iglobal
   <<\Imdn \forma>>

}

Ims = {
   \Iglobal
   \clef bass
   <<\Imsn \forma\Ibfn>>

}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


IIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}


IIflIn = \relative do'' {
   
   sib'4\soli sib8 la sib do
   la4 la8 sib do la
   sib4 do8 sib la sol
   
   %4
   fad2.
   sol8 la sib la sol fa
   mi4. mi8 fad sol\mbreak
   
   %7
   la sib la sol fad mi
   re4 re4. re8
   mib4 mi4. mi8
   
   %10
   fa4 fad4. fad8
   sol4. sol8 la4
   sib la4.\prall sol8
   
   %13
   sol2.
   mib4\tu mib8 fa mib re
   do4 do4. do8
   
   %16
   re mib re do sib la
   sol4. la8 sib do
   re do re mib fa sol\mbreak  %% fine pagina
   
   %19 OOKK
   do,4. sib8 do re
   mib4 mib4. fa8
   re4 sib'8 la sol fa
   
   %22
   sol fa mib re do sib
   la4. la8 sib4~
   sib8 do la4. sib8
   
   %25
   sib2.
   R2.*9
   r4 re8\tu do re la
   
   %36
   sib4 si4. si8
   do4 mi\soli mi
   fa4 fa8 mib fa do
   
   %39
   re4 sib'8\tu la sib fa
   sol4 sol4.\prall fa8
   mi?4. mi8 fa4
   
   %42
   sol sol4.\prall fa8\mbreak
   fa4 r r
   R2.
   
   %45
   r4 re\tu re
   sol sol8 fad sol la
   fad4. mi8 re4
   
   %48
   fad4. \soli fad8 sol4
   la sol la
   sib sib la
   
   %51
   sol4. \prall fa?8 sol4
   la la sol
   fa4. mi8 fa4
   
   %54
   sol sol fa
   mi4. fad8 sol4\mbreak
   fad4. fad8 sol4~
   
   %57
   sol8 la fad4. sol8
   sol2 r
   sol4\tu fa mib re
   
   %60
   do si do4. re8
   si4 sol re'2~
   re4 mib8 re do2~
   
   %63
   do4 re8 do si4. do8
   do2 mib~
   mib re4. re8
   
   %66
   re4 sol do,4. sib8
   la4 fa fa'2~\mbreak
   fa4 mib16[re mib8] mib4.\prall re8 
   
   %69
   re4 sib sib'2~
   sib4 lab16 sol lab8 lab4. sol8
   sol4 mib sol4. sol8
   
   %72
   sol4 re fa4. sol8
   mi?4 mi la4. la8
   la4 sol8[fa mi fa sol la]
   
   %75
   fad4 re sib'2~
   sib4 la la4. la8
   la4 re, sol4. sol8
   
   %78
   sol4. la8 fad4. sol8
   sol1

}

IIflIIn = \relative do'' {
   
   sol'4\soli sol8 fad sol la
   fad4 fad8 sol la fad
   sol[fad? mib re do sib]
   
   %4
   la2.
   sib8 do re do sib la
   sol4. sol8 la sib\mbreak
   
   %7
   do re do sib la4
   sib si4. si8
   do2.~
   
   %10
   do4 la4. la8
   re4. mi8 fad4
   sol sol4.\prall fad8
   
   %13  OOKK
   sol2.
   mib4 mib8 fa mib re
   do4 do4. do8
   
   %16
   re mib re do sib la
   sol4. la8 sib do
   re do re mib fa sol\mbreak  %% fine pagina
   
   %19 OOKK
   do,4. sib8 do re
   mib4 mib4. fa8
   re4 sib'8 la sol fa
   
   %22
   sol fa mib re do sib
   la4. la8 sib4~
   sib8 do la4. sib8
   
   %25
   sib2.
   R2.*9
   r4 re8\tu do re la
   
   %36
   sib4 si4. si8
   do4 do8\soli sib do sol
   la4 la4. la8
   
   %39
   sib4 sib'8\tu la sib fa
   sol4 sol4.\prall fa8
   mi?4. mi8 fa4
   
   %42
   sol sol4.\prall fa8\mbreak
   fa4 r r
   R2.
   
   %45
   r4 re\tu re
   sol sol8 fad sol la
   fad4. mi8 re4
   
   %48
   re4.\soli re8 mi4
   fad mi fad
   sol sol fad
   
   %51
   mi4.\prall re8 mi4
   fa fa mib
   re4. do8 re4
   
   %54
   sib sib la
   sol4. la8 sib4\mbreak
   la4. la8 sib4
   
   %57
   la la4. sol8
   sol2 r
   sol'4\tu fa mib re
   
   %60
   do si do4. re8
   si4 sol re'2~
   re4 mib8 re do2~
   
   %63
   do4 re8 do si4. do8
   do2 mib~
   mib re4. re8
   
   %66
   re4 sol do,4. sib8
   la4 fa fa'2~\mbreak
   fa4 mib16[re mib8] mib4.\prall re8 
   
   %69
   re4 sib sib'2~
   sib4 lab16 sol lab8 lab4. sol8
   sol4 mib sol4. sol8
   
   %72
   sol4 re fa4. sol8
   mi?4 mi la4. la8
   la4 sol8[fa mi fa sol la]
   
   %75
   fad4 re sib'2~
   sib4 la la4. la8
   la4 re, sol4. sol8
   
   %78
   sol4. la8 fad4. sol8
   sol1

}

IIvln = \relative do'' {
   
   R2.*13
   mib4 mib8 fa mib re
   do4 do4. do8
   
   %16
   re mib re do sib la
   sol4. la8 sib do
   re do re mib fa sol\mbreak  %% fine pagina
   
   %19 OOKK
   do,4. sib8 do re
   mib4 mib4. fa8
   re4 sib'8 la sol fa
   
   %22
   sol fa mib re do sib
   la4. la8 sib4~
   sib8 do la4. sib8
   
   %25
   sib2.
   re8\soli mi re do re sib
   fa'2.~
   
   %28
   fa4 fa fa
   fa fa fa
   fa4. sol8 mi4\mbreak
   
   %31
   fa2.
   la4 sib8 la sol fa
   mi4 mi8 fa sol4
   
   %34
   fa8\prall mi mi4.\upprall re8
   re4 re8\tu do re la
   
   %36
   sib4 si4. si8
   do4 r r
   R2.
   
   %39
   r4 sib'8 la sib fa
   sol4 sol4.\prall fa8
   mi?4. mi8 fa4
   
   %42
   sol sol4.\prall fa8\mbreak
   fa4 do\soli re
   mib4 mib4. fa8
   
   %45
   re4 re\tu re
   sol sol8 fad sol la
   fad4. mi8 re4
   
   %48
   R2.*10
   R1
   sol4\tu fa mib re
   
   %60
   do si do4. re8
   si4 sol re'2~
   re4 mib8 re do2~
   
   %63
   do4 re8 do si4. do8
   do2 mib~
   mib re4. re8
   
   %66
   re4 sol do,4. sib8
   la4 fa fa'2~\mbreak
   fa4 mib16[re mib8] mib4.\prall re8 
   
   %69
   re4 sib sib'2~
   sib4 lab16 sol lab8 lab4. sol8
   sol4 mib sol4. sol8
   
   %72
   sol4 re fa4. sol8
   mi?4 mi la4. la8
   la4 sol8[fa mi fa sol la]
   
   %75
   fad4 re sib'2~
   sib4 la la4. la8
   la4 re, sol4. sol8
   
   %78
   sol4. la8 fad4. sol8
   sol1

}

IIvlIn = \relative do'' {
   
   R2.*13
   mib4 mib8 fa mib re
   do4 do4. do8
   
   %16
   re mib re do sib la
   sol4. la8 sib do
   re do re mib fa sol\mbreak  %% fine pagina
   
   %19 OOKK
   do,4. sib8 do re
   mib4 mib4. fa8
   re4 sib'8 la sol fa
   
   %22
   sol fa mib re do sib
   la4. la8 sib4~
   sib8 do la4. sib8
   
   %25
   sib2.
   R
   do8\soli re do sib do la
   re4 re re
   do do re8 do
   sib4 sib8 la sib do\mbreak
   la2.
   fa'4 mi8 fa mi re
   dod4. dod8 re4~
   re8 mi dod4. re8
   re4 re8\tu do re la
   
   %36
   sib4 si4. si8
   do4 r r
   R2.
   
   %39
   r4 sib'8 la sib fa
   sol4 sol4.\prall fa8
   mi?4. mi8 fa4
   
   %42
   sol sol4.\prall fa8\mbreak
   fa4 la,\soli si
   do4 sol4. la8
   
   %45
   sib?4 re\tu re
   sol sol8 fad sol la
   fad4. mi8 re4
   
   %48
   R2.*10
   R1
   sol4\tu fa mib re
   
   %60
   do si do4. re8
   si4 sol re'2~
   re4 mib8 re do2~
   
   %63
   do4 re8 do si4. do8
   do2 mib~
   mib re4. re8
   
   %66
   re4 sol do,4. sib8
   la4 fa fa'2~\mbreak
   fa4 mib16[re mib8] mib4.\prall re8 
   
   %69
   re4 sib sib'2~
   sib4 lab16 sol lab8 lab4. sol8
   sol4 mib sol4. sol8
   
   %72
   sol4 re fa4. sol8
   mi?4 mi la4. la8
   la4 sol8[fa mi fa sol la]
   
   %75
   fad4 re sib'2~
   sib4 la la4. la8
   la4 re, sol4. sol8
   
   %78
   sol4. la8 fad4. sol8
   sol1

}

IIhcn = \relative do'' {
   
   R2.*13
   sol4 do8 sib la sol
   la4 la4. la8
   
   %16
   sib4 sib re,
   mib4. fa8 sol la
   sib4 sib4. do8\mbreak
   
   %19
   la4. sol8 la si
   do4 sol4. la8
   sib?8 do re do sib4
   
   %22
   sib sol4. sol8
   fa4. fa8 fa4
   sol fa4. fa8
   
   %25
   fa2.
   R2.*9
   s4 fad fad
   
   %36
   sol sol4. sol8
   sol4 r r
   R2.
   
   %39
   r4 re' re
   sib re4. re8
   do4. do8 do4
   
   %42
   re do4. do8\mbreak
   do4 r r
   R2.
   
   %45
   r4 sib la
   sib do4. do8
   re2 la4
   
   %48
   R2.*10
   R1
   sib,2 do4 re
   
   %60
   mi2 fa
   sol2. sol4
   sol2 sol
   
   %63
   fa2. mib8 fa
   sol4 sol do4. sib8
   la2. sib4
   
   %66
   sol2 sol4. sol8
   fa4 la la la\mbreak
   sib2 do
   
   %69
   sib4 re re re
   do2 sib
   sib  si4. do8
   
   %72
   re1~
   re2 do4. sib?8
   la2 la
   
   %75
   la4 re re4. re8
   re4 do do4. do8
   re2. re4 
   
   %78
   mib2 re4. re8
   re1

}

IItln = \relative do' {
   
   R2.*11
   re'4 re8 do sib la
   sib4 si4. si8
   
   %14
   do4 sol4. sol8
   fa4 fa4. fa8
   fa4 fa sib,
   
   %17
   sib4. sib8 mib4
   fa fa sib8 sol\mbreak
   fa2 fa4
   
   %20
   sol sol4. fad8
   sol4 fa?4. fa8
   mi4 sib4. sib8
   
   %23
   do4. do8 re4
   do4. re8 mib4
   re2.
   
   %26
   R2.*9
   r4 re re
   re re4. re8
   
   %37
   mi4 r r
   R2.
   r4 fa4 fa
   
   %40
   mib sol4. sol8
   sol4. sol8 fa4
   fa mi? do'8 sib\mbreak
   
   %43
   la4 r r
   R2.
   r4 sol re
   
   %46
   re do do'
   la4. sol8 fad4
   R2.*10
   
   %58
   r2 sib4 la
   sol1
   sol2 fa
   
   %61
   re4 si si4. si8
   si2 do
   re2. do8 re
   
   %64
   mi4 fa sol mib
   do do fa re
   sib2 do~
   
   %67
   do2. re4\mbreak
   re mib fa4. fa8
   fa4 re fa sol
   
   %70
   mib2 fa~
   fa mib?4. mib8
   re4 sol sol4. sol8
   
   %73
   sol4 sol mi?4. mi8
   mi2. mi4
   re fad sol4. sol8
   
   %76
   mib2 mi4. mi8
   fad4 fad sol4. sol8
   la4 sib la re8 do
   
   %79
   si1
  
}


IIbsn = \relative do {
   
   R2.*12
   sol'4 sol8 fa mib re
   
   %14
   do4 do8 re mib do
   fa sol fa mib re do
   sib4 sib'8 la sol fa
   
   %17
   mib4 mib4. mib8
   sib la sib do re mib\mbreak %% fine pagina
   fa4. fa8 mib re
   
   %20
   do4 do4. do8
   sol'4 re4. re8
   mib2 mib4
   
   %23
   mib2 re4
   mib fa fa,
   sib2.
   
   %26
   R2.*9
   r4 re re
   sol, sol'4. sol8
   do,4 r r
   
   %38
   R2.
   r4 sib sib
   mib si4. si8
   
   %41
   do4. sib?8 la4
   sib do2\mbreak
   fa,4 r r
   
   %44
   R2.
   r4 sol' fa
   mib mib4. mib8
   
   %47
   re2.
   R2.*10
   r2 sol4 fa
   
   %59
   mib re do sib
   lab1
   sol2. sol'8 fa
   
   %62
   mib1
   re
   do2. do'4
   
   %65
   fa,2. sib4
   mib,2 mi4. mi8
   fa2. re4\mbreak
   
   %68
   sol2 la
   sib2. sib,4
   do2 re
   
   %71
   mib2~mib8 mib re do
   si1
   do
   
   %74
   dod
   re2 sol,4 sol'
   do,1
   
   %77
   sib2. sib4
   do2 re   
   sol,1

}

IImdn = \relative do'' {
   
   <<{sib'4 sib8 la sib do
   la4 la8 sib do la
   sib4 do8 sib la sol
   
   %4
   fad2.
   sol8 la sib la sol fa
   mi4. mi8 fad sol\mbreak
   
   %7
   la sib la sol fad mi
   re4 re4. re8
   mib4 mi4. mi8
   
   %10
   fa4 fad4. fad8
   sol4. sol8 la4
   sib la4.\prall sol8}\\{sol4 sol8 fad sol la
   fad4 fad8 sol la fad
   sol[fad? mib re do sib]
   
   %4
   la2.
   sib8 do re do sib la
   sol4. sol8 la sib\mbreak
   
   %7
   do re do sib la4
   sib si4. si8
   do2.~
   
   %10
   do4 la4. la8
   re4. mi8 fad4
   sol sol4 fad8}>>
   
   %13
   s2.*24
   <<{s4 mi mi
   fa4 fa8 mib fa do
   
   %39
   re4}\\{s4
          do8 sib do sol
   la4 la4. la8
   
   %39
   sib4}>> s s
   s2.*8
   <<{fad'4.  fad8 sol4
   la sol la
   sib sib la
   
   %51
   sol4. \prall fa?8 sol4
   la la sol
   fa4. mi8 fa4
   
   %54
   sol sol fa
   mi4. fad8 sol4\mbreak
   fad4. fad8 sol4~
   
   %57
   sol8 la fad4. sol8
   sol2}\\{re4. re8 mi4
   fad mi fad
   sol sol fad
   
   %51
   mi4. re8 mi4
   fa fa mib
   re4. do8 re4
   
   %54
   sib sib la
   sol4. la8 sib4\mbreak
   la4. la8 sib4
   
   %57
   la la4. sol8
   sol2}>> s

}


IImsn = \relative do {
   
   R2.^\markup\italic { " orgue seul"}_\markup\italic {"     L'orgue joüe les parties des flutes"}
   R2.*2
   re'4 re8 do sib la
   
   %5
   sol4 sol8 la sib sol
   do re do sib la sol\mbreak
   fad2.
   
   %8
   sol8 lab sol fa mib re
   do4 do'4. sib8
   la4 re4. do8
   
   %11
   sib4. sib8 la4
   sol re2
   sol4\tu sol8 fa mib re
   
   %14
   do4 do8 re mib do
   fa sol fa mib re do
   sib4 sib'8 la sol fa
   
   %17
   mib4 mib4. mib8
   sib la sib do re mib\mbreak %% fine pagina
   fa4. fa8 mib re
   
   %20
   do4 do4. do8
   sol'4 re4. re8
   mib2 mib4
   
   %23
   mib2 re4
   mib fa fa,
   sib2.
   
   %26
   sib'_\markup\italic"acc[ompagnement] seul"
   la8 sib la sol la fa
   sib4 sib sib
   
   %29
   la la sib
   sol sol do\mbreak
   fa,2.
   
   %32
   fa4 sol4. sol8
   la4. la8 sib4
   sol la la,
   
   %35
   re4 re\tu re
   sol, sol'4. sol8
   do,4 do^\markup\italic"acc. seul"_\markup\italic "l'orgue joüe les fl[utes]" do
   
   %38
   fa, fa'4. fa8
   sib,4 sib\tu sib
   mib si4. si8
   
   %41
   do4. sib?8 la4
   sib do2\mbreak
   fa,4 fa'_\markup\italic"acc. seul" fa
   
   %44
   do do4. do8
   sol'4 sol\tu fa
   mib mib4. mib8
   
   %47
   re2.
   re_\markup\italic"acc. seul"^\markup\italic\column{ "l'orgue joüe"\vspace #-0.2	"les fl[utes]"}
   re
   
   %50
   sol,
   do
   fa,
   
   %53
   sib 
   sib 
   do2 sol4\mbreak
   
   %56
   re'4. do8 sib4
   do re re,
   sol2 sol'4\tu fa
   
   %59
   mib re do sib
   lab1
   sol2. sol'8 fa
   
   %62
   mib1
   re
   do2. do'4
   
   %65
   fa,2. sib4
   mib,2 mi4. mi8
   fa2. re4\mbreak
   
   %68
   sol2 la
   sib2. sib,4
   do2 re
   
   %71
   mib2~mib8 mib re do
   si1
   do
   
   %74
   dod
   re2 sol,4 sol'
   do,1
   
   %77
   sib2. sib4
   do2 re   
   sol,1
   
}


IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s2.*8
   <_->4 <_+>2
   s2.*13
   <4+>2.
   s2.*8
   s4 <6>2
   <_+> <6>4
   s2.
   s4 <_+>2
   s2.*8
   <_->2.
   s2.*3
   <_+>2.
   <_+>
   <_->
   s2.*7
   s1*3
   <_+>1
   s
   s
   <_->
   <7>2 <6>
   <7> <6>
   s1
   <7>2 <5->
   s1
   <7>2 <5 ->
   s1
   s
   <9>2 <8>
   s1
   s
   <9 7 _->2 <8 6 _+>
   <7 5+> <6>
   <6 5> <3+>
   <_+>1

}


forma = {

   \time 3/4
   \once\override Staff.TimeSignature.style = #'single-digit
   \tempo 2. = 45
   \key fa\major
   s2.*57\break
   \time 2/2
   \tempo 1 = 45
   s1*22
   \bar"|."

}

IIflI = {
   \IIglobal
   <<\IIflIn \forma>>

}

IIflII = {
   \IIglobal
   <<\IIflIIn \forma>>

}

IIvl = {
   \IIglobal
   <<\IIvln \forma>>

}

IIvlI = {
   \IIglobal
   <<\IIvlIn \forma>>

}

IIhc = {
   \IIglobal
   <<\IIhcn \forma>>

}

IItl = {
   \IIglobal
   <<\IItln \forma>>

}

IIbs = {
   \IIglobal
   \clef bass
   <<\IIbsn \forma >>

}

IImd = {
   \IIglobal
   <<\IImdn \forma>>

}

IIms = {
   \IIglobal
   \clef bass
   <<\IImsn \forma\IIbfn>>

}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
#(set-global-staff-size 18)



\paper  {

   print-first-page-number = ##t
   first-page-number = #2

}

\bookpart {

   \paper  {

      systems-per-page = #2

   }

   \header {
      title = \markup\smaller "Antienne H.525 "
      composer = \markup \center-column{"M-A. Charpentier (1643-1707)"}
   }

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
      } <<

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key re\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 2/2 r4^\markup \center-align\smaller\center-column {"[Flûte I]"} re'' }
         \set Staff.shortInstrumentName = "fl1"
         \clef violin
         \set Staff.midiInstrument = #"flute"
         \IflI
         >>

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key re\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 2/2 r4^\markup \center-align\smaller\center-column {"[Flûte II]"} re'' }
         \set Staff.shortInstrumentName = "fl2"
         \clef violin
         \set Staff.midiInstrument = #"flute"
         \IflII
         >>

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key re\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 2/2 r4^\markup \center-align\smaller\center-column {"[Violon]"} re'' }
         \set Staff.shortInstrumentName = "vl"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \Ivl
         >>

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key re\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 2/2 r1^\markup \center-align\smaller\center-column {"[Haute-"\vspace #-0.2"contre]"} r4 la' }
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \Ihc
         >>

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key re\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 2/2 r1*3^\markup \center-align\smaller\center-column {"[Taille]"} r4 re' }
         \set Staff.shortInstrumentName = "tl"
         \clef alto
         \set Staff.midiInstrument = #"viola"
         \Itl
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bs"
            \Ibs
         >>

         \new PianoStaff \relative <<
            \set PianoStaff.midiInstrument = #"church organ"
            \new Staff = "up" <<
               \set PianoStaff.instrumentName =  \markup {\center-column{"Orgue"}}
               \set PianoStaff.shortInstrumentName = "Org"
               \Imd
            >>

            \new Staff = "down" <<
               \Ims
            >>
         >>
      >>

      \layout {

         indent = 2.0\cm

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

   \paper  {

      systems-per-page = #2

   }

   \header {
      title = \markup\smaller "Antienne H.526 "
      composer = \markup \center-column{"M-A. Charpentier (1643-1707)"}
   }

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
      } <<

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 3/4 sib''4^\markup \center-align\smaller\center-column {"[Flûte I]"} }
         \set Staff.shortInstrumentName = "fl1"
         \clef violin
         \set Staff.midiInstrument = #"flute"
         \IIflI
         >>

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 3/4 sol''4^\markup \center-align\smaller\center-column {"[Flûte II]"} }
         \set Staff.shortInstrumentName = "fl2"
         \clef violin
         \set Staff.midiInstrument = #"flute"
         \IIflII
         >>

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 3/4 r1*13^\markup \center-align\smaller\center-column {"[I Violon]"} mib''4 }
         \set Staff.shortInstrumentName = "vl1"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IIvl
         >>

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef french \key fa\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 3/4 r1*13^\markup \center-align\smaller\center-column {"[II Violon]"} mib''4 }
         \set Staff.shortInstrumentName = "vl2"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IIvlI
         >>

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef soprano \key fa\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 3/4 r1*13^\markup \center-align\smaller\center-column {"[Haute-"\vspace #-0.2"contre]"} sol'4 }
         \set Staff.shortInstrumentName = "hc"
         \clef violin
         \set Staff.midiInstrument = #"violin"
         \IIhc
         >>

         \new Staff <<
         \set Staff.instrumentName = \markup \center-column{""}
         \incipit { \clef mezzosoprano \key fa\major \override MensuralStaff.TimeSignature.style = #'numbered \override Staff.TimeSignature.style = #'single-digit \time 3/4 r1*11^\markup \center-align\smaller\center-column {"[Taille]"} re'4}
         \set Staff.shortInstrumentName = "tl"
         \clef alto
         \set Staff.midiInstrument = #"viola"
         \IItl
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Basses]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bs"
            \IIbs
         >>

         \new PianoStaff \relative <<
            \set PianoStaff.midiInstrument = #"church organ"
            \new Staff = "up" <<
               \set PianoStaff.instrumentName =  \markup {\center-column{"Orgue"}}
               \set PianoStaff.shortInstrumentName = "Org"
               \IImd
            >>

            \new Staff = "down" <<
               \IIms
            >>
         >>
      >>

      \layout {

         indent = 2.0\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
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
