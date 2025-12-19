\language "italiano"
%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

unis = _\markup\italic "Unisoni"

arco = _\markup \italic "arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzic."

soli = ^\markup \italic { Soli}

dolce = ^\markup \italic { Doux }

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

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
        \musicglyph "scripts.turn"
        \musicglyph "scripts.prall"
    }
}
mbreak = { }



IvlIn = \relative do'' {

   R1.*2
   r2 r re
   si dod re

   %5
   dod la'1~
   la2 sol1~
   sol2 fad1~

   %8
   fad2 mi1~
   mi2 mi1~
   mi4. fad8 mi2.\tr re4

   %11
   re2 la1\dolce
   r2 la1\mbreak
   r2 si dod

   %14
   re1 dod4. re8
   dod2_+ r r dod1.
   r4 r8 re\f [fad8. re16]

   %17
   mi4 la, la'
   re,8 mi fad sol la4
   sol8-+ fad mi4 fad8 sol

   %20
   fad4.-+re8[fad8. re16]
   mi4 la, la'
   re, dod8-+ si la4\mbreak

   %23
   sol8 fad mi4._+ re8
   re16 re' re re fad fad fad fad re fad re fad
   mi la, la la la' la la la mi la mi la  %%% reprise

   %26
   fad re re re si' si si si sol si sol si
   mi, la, la la la' la la la mi la mi la
   fad re re re fad fad fad fad re fad re fad\mbreak

   %29
   mi la, la la la' la la la mi la mi la
   fad re re re si' si si si sol si sol si
   mi, la, la la la' la la la mi la mi la

   %32 la tromba
   <<
      {
         fad4^\markup\italic\center-align {Trompette} la2~
         la2.~
         la2.~

         %35
         la2.~
         la2.~
         la2.~

         %38
         la2.~
         la2.
      }\\{
         fad16 \stemUp re, re re\stemDown fad' sol fad mi re mi re dod
         si sol sol sol sol' la sol fad mi fad mi re\mbreak
         dod la la la la' si la sol fad sol fad mi
         re la' la la dod, re dod si la si la sol
         fad re re re fad' sol fad mi re mi re dod
         si sol sol sol sol' la sol fad mi fad mi re
         dod la la la la' si la sol fad sol fad mi \mbreak
         re la'  la la dod, re dod si la si la sol
      }
   >>
   fad re re re fad fad fad fad la la la la

   %41
   re fad, fad fad la la la la re re re re
   fad la, la la re re re re fad fad fad fad
   la re, re re fad fad fad fad la la la la\mbreak

   %44
   re8. \tuplet 3/2 { re32 re re } re8 la re la
   re la re la fad re
   la'8.\tuplet 3/2 {la32 la la} la8 la la la

   %47
   la8. si16 mi,4.-+ re8
   re16 re, re re fad fad fad fad la la la la
   re fad, fad fad la la la la re re re re

   %50
   fad la, la la re re re re fad fad fad fad\mbreak
   la re, re re fad fad fad fad la la la la
   re8. \tuplet 3/2 { re32 re re } re8 la re la

   %53
   re la re la fad re
   la'8.\tuplet 3/2 {la32 la la} la8 la la la
   la8. si16 mi,4.-+ re8

   %56
   re4 re8 mi fad sol %% fin
   mi4 la2~
   la4 si8 la sol fad\mbreak

   %59
   mi re dod si la4~
   la re8 mi fad sol
   mi4 la2~

   %62
   la4 si8 la sol fad
   mi re dod si la4~
   la re dod8 re

   %65
   si4 mi re8 mi
   dod8. la16 la'4. mi8
   fad8. sol16 mi4.-+ re8

   %68
   re4 re dod8 re
   si4 mi re8 mi
   dod8. la16 la'4. mi8

   %71
   fad8. sol16 mi4.-+ re8\mbreak

}

IvlIIn = \relative do'' {

   r2 r la
   sol fad mi
   re dod fad

   %4
   re mi fad
   mi la' fad
   re si mi

   %7
   dod la re
   si sol si
   si dod re~

   %10
   re dod2. re4
   re2 r fad,\dolce
   mi r la\mbreak

   %13
   la1.~
   la2 sold2._+ la4
   la2 r la la1.

   %16
   r4 r8 re\f [fad8. re16]

   %17
   mi4 la, la'
   re,8 mi fad sol la4
   sol8-+ fad mi4 fad8 sol

   %20
   fad4.-+re8[fad8. re16]
   mi4 la, la'
   re, dod8 -+ si la4\mbreak

   %23
   sol8 fad mi4._+ re8
   re16 re' re re fad fad fad fad re fad re fad
   mi la, la la la' la la la mi la mi la  %%% reprise

   %26
   fad re re re si' si si si sol si sol si
   mi, la, la la la' la la la mi la mi la
   fad re re re fad fad fad fad re fad re fad\mbreak

   %29
   mi la, la la la' la la la mi la mi la
   fad re re re si' si si si sol si sol si
   mi, la, la la la' la la la mi la mi la

   %32 la tromba
   fad16 \stemUp re, re re\stemDown fad' sol fad mi re mi re dod
   si sol sol sol sol' la sol fad mi fad mi re\mbreak
   dod la la la la' si la sol fad sol fad mi
   
   %35
   re la' la la dod, re dod si la si la sol
   fad re re re fad' sol fad mi re mi re dod
   si sol sol sol sol' la sol fad mi fad mi re
   
   %38
   dod la la la la' si la sol fad sol fad mi \mbreak
   re la'  la la dod, re dod si la si la sol
   fad re re re fad fad fad fad la la la la

   %41
   re fad, fad fad la la la la re re re re
   fad la, la la re re re re fad fad fad fad
   la re, re re fad fad fad fad la la la la\mbreak

   %44
   re8. \tuplet 3/2 { re32 re re } re8 la re la
   re la re la fad re
   la'8.\tuplet 3/2 {la32 la la} la8 la la la

   %47
   la8. si16 mi,4.-+ re8
   re16 re, re re fad fad fad fad la la la la
   re fad, fad fad la la la la re re re re

   %50
   fad la, la la re re re re fad fad fad fad\mbreak
   la re, re re fad fad fad fad la la la la
   re8. \tuplet 3/2 { re32 re re } re8 la re la

   %53
   re la re la fad re
   la'8.\tuplet 3/2 {la32 la la} la8 la la la
   la8. si16 mi,4.-+ re8

   %56
   re4 re8 mi fad sol %% fin
   mi4 la2~
   la4 si8 la sol fad\mbreak

   %59
   mi re dod si la4~
   la re8 mi fad sol
   mi4 la2~

   %62
   la4 si8 la sol fad
   mi re dod si la4~
   la re dod8 re

   %65
   si4 mi re8 mi
   dod8. la16 la'4. mi8
   fad8. sol16 mi4.-+ re8

   %68
   re4 re dod8 re
   si4 mi re8 mi
   dod8. la16 la'4. mi8

   %71
   fad8. sol16 mi4.-+ re8\mbreak

}

Ibcn = \relative do {

   re2 re' dod
   si la sol
   fad mi re

   %4
   sol,4. fad8 mi2 re
   la'' fad re
   si mi dod

   %7
   la re si
   sol1.
   sold

   %10
   la
   re,2 r re'\dolce
   dod r dod\mbreak

   %13
   si1.
   mi,
   la2 re' dod la,1.

   %16
   re2\f re4
   la2 la4
   si2 fad4

   %19
   sol la2
   re, re'4
   la2 la4

   %22
   si2 fad4\mbreak
   sol la2
   re,8 re' re re re re

   %25
   la la la la la la %%%% reprise
   si[si] sol sol sol sol
   la la la la la la

   %28
   re,8 re' re re re re
   la la la la la la
   si[si] sol sol sol sol

   %31
   la la la la la la
   re,8 re' re re re re
   sol, sol sol sol sol sol\mbreak

   %34
   la la la la la la
   fad sol la la la la
   re, re' re re re re

   %37
   sol, sol sol sol sol sol
   la la la la la la\mbreak  %% fine pagina
   fad[sol] la la la la

   %40
   re,[re] re' re re re
   re,[re] re' re re re
   re,[re] re' re re re

   %43
   re,[re] re' re re re\mbreak
   re,8. \tuplet 3/2 { re32 re re } re8 re re re
   re' re re re re re

   %46
   re,8. \tuplet 3/2 { re32 re re } re8 re re' re
   fad, sol la2
   re,8[re] re' re re re

   %49
   re,[re] re' re re re
   re,[re] re' re re re
   re,[re] re' re re re\mbreak

   %52
   re,8. \tuplet 3/2 { re32 re re } re8 re re re
   re' re re re re re
   re,8. \tuplet 3/2 { re32 re re } re8 re re' re

   %55
   fad, sol la2
   re4 re'2 %%% fin
   dod2.

   %58
   si\mbreak
   sol4 la la,
   re re'2

   %61
   dod2.
   si
   sol4 la la,8 sol

   %64
   fad2.
   sol
   la4. si8 dod la

   %67
   re sol, la2
   re4 fad,2
   sol2.

   %70
   la4. si8 dod la
   re sol, la2

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1 <6>2
   <6> <6> <6>
   <6> <6> s
   s <6>1
   s1.\bassFigureExtendersOn
   <7>2 <3> <3>
   <7>2 <3> <3> \bassFigureExtendersOff
   <7>2 <6>1
   <5//>1.
   <4>2 <3>1
   s1.
   <6>2 s <6>
   <7>1.
   <7 4>2 <3+>1
   s1 <6>2

}


forma = {

   \time 3/2
   %\override Staff.TimeSignature.style = #'single-digit
   \key re\major
   \tempo 1 = 35
   s1.
   \repeat volta 2 {s1.*13}
   \alternative {{s1.}{s}}
   \set Score.currentBarNumber = #16
   \bar "|."\break
   \once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
   \mark\markup\huge\larger "[2.] Chaconne"
   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \tempo 2. = 45
   s2.*56

}

IvlI = {
   <<\IvlIn \forma>>

}

IvlII = {
   <<\IvlIIn \forma>>

}

Ibc = {
   \clef bass
   <<\Ibcn \forma \Ibfn>>
}




IIfln = \relative do'' {
   
   re4 fa sol
   la sol-+ fa
   sib la-+ sol
   
   %4
   la sol fa
   mi fa sol
   fa mi re
   
   %7
   la'2.~
   la~
   la~
   
   %10
   la4 mi fa
   sol la sib
   dod, re mi
   
   %13
   fa mi4.-+ re8\mbreak
   re4 fa sol
   la sol-+ fa
   
   %16
   sib la-+ sol
   la sol fa 
   mi fa sol 
   
   %19
   fa mi re
   la'2.~
   la~
   
   %22
   la~
   la4 mi fa
   sol la sib
   
   %25
   dod, re mi
   fa mi4.-+ re8
   
}

IIvlIn = \relative do'' {
   
   re4\dolce re, mi
   fa mi re
   sol re' mi
   
   %4
   fa sol la 
   sol fa mi 
   re dod re
   
   %7
   dod la' sol
   fa mi fa
   dod re mi 
   
   %10
   fa sol la 
   sib dod, re 
   mi fa sol8 dod,
   
   %13
   re4 dod4.-+ re8\mbreak
   re4 re, mi
   fa mi re
   
   %16
   sol re 'mi
   fa sol la 
   sol fa mi 
   
   %19
   re dod re
   dod la' sol
   fa mi fa
   
   %22
   dod re mi 
   fa sol la 
   sib dod, re 
   
   %25
   mi fa sol8 dod,
   re4 dod4.-+ re8

}

IIvlIIn = \relative do'' {
   
   re4\dolce re, mi
   fa mi re
   sol2.
   
   %4
   re'4 mi fa
   sol la sib
   la sol fa
   
   %7
   mi fa mi
   re dod re
   la si dod
   
   %10
   re dod re
   mi2 fa4 
   sol la sib
   
   %13
   la la,2\mbreak
   re4\dolce re, mi
   fa mi re
   
   %16
   sol2.
   re'4 mi fa
   sol la sib
   
   %19
   la sol fa
   mi fa mi
   re dod re
   
   %22
   la si dod
   re dod re
   mi2 fa4 
   
   %25
   sol la sib
   la la,2
   
}

IIpartien = \relative do'' {
   
   r2.
   re,~
   re~
   
   %4
   re~
   re~
   re2 re'4
   
   %7
   la2.~
   la~
   la~
   
   %10
   la
   sol~
   sol
   
   %13
   fa8 sol la2\mbreak
   re,2.~
   re~
   
   %16
   re~
   re~
   re~
   
   %19
   re2 re'4
   la2.~
   la~
   
   %22
   la~
   la
   sol~
   
   %25
   sol
   fa8 sol la2
   
}

IIbcn = \relative do {
   
   re,2 r4
   R2.*25

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key do\major
    \tempo 2. = 45
    s2.*26

}

IIfl = {
    <<\IIfln \forma>>

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIpartie = {
    <<\IIpartien \forma>>

}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}





IIIvlIn = \relative do'' {
   
   re4 fad2\f
   si,4 mi2
   la,4 la'2
   
   %4
   re,4 sol fad8 mi
   fad4 fad2
   si,4 mi2
   
   %7
   la,4 la'2
   re,4. mi8 dod4-+
   re8 re16 mi fad8 re fad re
   
   %10
   si4 r32 sol[la si dod re mi fad sol la si la sol fad mi re]\mbreak
   dod8 dod16 re mi8 dod mi dod
   la4 \tuplet 14/16 { r32 la[si dod re mi fad sol la sol fad mi re dod] }
   
   %13
   re8 re16 mi fad8 re fad re
   si4 r32 sol[la si dod re mi fad sol la si la sol fad mi re]\mbreak
   dod8 dod16 re mi8 dod mi dod
   
   %16
   la4 \tuplet 14/16 { r32 la[si dod re mi fad sol la sol fad mi re dod] }
   re4 fad,8^\markup\italic "Doux et tres marqué"(fad) fad(fad)
   fad(mi)mi(fad)sol(mi)
   
   %19
   fad(re) re'(re) re(re)
   re(dod) dod(re) mi(dod)
   re fad,16 fad fad8(fad) fad(fad)
   
   %22
   fad(mi)mi(fad)sol(mi)
   fad re'16 re re8(re) re(re)
   re(dod) dod(re) mi(dod)
   
   %25
   re16 fad, fad fad\repeat unfold 8 {fad}
   \repeat unfold 8 {mi} sol sol sol sol\mbreak
   fad re' re re\repeat unfold 8 {re}
   
   %28
   re re re re dod dod dod dod mi mi mi mi
   re fad, fad fad \repeat unfold 8 {fad}
   \repeat unfold 8 {mi} sol sol sol sol\mbreak
   
   %31
   fad re' re re\repeat unfold 8 {re}
   re re re re dod dod dod dod mi mi mi mi\mbreak
   re re,\f re re fad fad fad fad la la la la
   
   %34
   re fad, fad fad la la la la re re re re
   fad la, la la re re re re fad fad fad fad
   la8. si16 mi,4. re8
   
   %37
   re16 re, re re fad fad fad fad la la la la
   re fad, fad fad la la la la re re re re
   fad la, la la re re re re fad fad fad fad
   
   %40
   la re, re re fad fad fad fad la la la la
   re8.\tuplet 3/2 { re32 re re } re8 la re la
   re la re la fad re
   
   %43
   la'8.\tuplet 3/2 { la32 la la } la8 la la la
   la8. si16 mi,4. re8
   re2. r4 r8 re do4   %%% Loure
   
   %46
   sib la sol fa la2
   re, r4 mi2 r4
   fa4. sol8 la4 sol \afterGrace fa2_+({mi8)}
   
   %49
   mi2_+ mi'4\mbreak la, do2
   sold4 mi mi' re4.-+ do8 si4
   do4 mi, la4. si8 si4.-+ la8
   
   %52
   la2. r4 r8 re do4 la2. r4 r8 mi' fa4 \set Score.currentBarNumber = #53
   dod4 re mi la,4. sib8 la sol
   fad4 sol la re, r8 re' fad,8._+(mi32 fad)
   
   %55
   sol2 r4 la2 r4
   sib4. do8 re4\mbreak sol, la fad8.(mi32 fad)
   sol4 sib2 la4 re2
   
   %58
   dod2-+mi,4_\markup\italic"Doux et gratieux" sol4. fa8 mi4
   fa mi fa8._+(mi32 fa) sol4. fa8 mi4
   fa4. mi8 fa sol la4\f si dod8.(si32 dod)
   
   %61
   re4 la fa'4. mi16 re dod4. re8
   mi4 la, re4. mi,8 mi4. re8
   re2. r4 r8 mi' fa4^\markup\italic\center-align "[à la Reprise]"
   
   %64
   re,2 mi4^\markup\italic"petitte Reprise" _\markup\italic"Doux et gratieux" sol4. fa8 mi4
   fa mi fa8._+(mi32 fa) sol4. fa8 mi4
   fa4. mi8 fa sol la4\f si dod8.(si32 dod)
   
   %67
   re4 la fa'4. mi16 re dod4. re8
   mi4 la, re4. mi,8 mi4. re8
   re2. r
   
}

IIIvlIIn = \relative do'' {
   
   re,4 fad'2\f
   si,4 mi2
   la,4 la'2
   
   %4
   re,4 sol fad8 mi
   fad4 fad2
   si,4 mi2
   
   %7
   la,4 la'2
   re,4. mi8 dod4-+
   re8 re16 mi fad8 re fad re
   
   %10
   si4 r32 sol[la si dod re mi fad sol la si la sol fad mi re]\mbreak
   dod8 dod16 re mi8 dod mi dod
   la4 \tuplet 14/16 { r32 la[si dod re mi fad sol la sol fad mi re dod] }
   
   %13
   re8 re16 mi fad8 re fad re
   si4 r32 sol[la si dod re mi fad sol la si la sol fad mi re]\mbreak
   dod8 dod16 re mi8 dod mi dod
   
   %16
   la4 \tuplet 14/16 { r32 la[si dod re mi fad sol la sol fad mi re dod] }
   re4 re,8^\markup\italic "Doux et tres marqué"(re) re(re)
   re(dod) dod(re) mi(dod)
   re(fad) fad (fad) fad (fad)
   fad(mi) mi(fad) sol(mi)
   fad re16 re re8(re) re(re)
   re(dod) dod(re) mi(dod)
   re fad16 fad fad8(fad) fad(fad)
   fad(mi) mi(fad) sol(mi)
   fad16 \repeat unfold 11 {re}
   re re re re \repeat unfold 8 {dod}\mbreak
   re \repeat unfold 11 {fad}
   mi mi mi mi\repeat unfold 8 {sol}
   fad16 \repeat unfold 11 {re}
   re re re re \repeat unfold 8 {dod}
   re \repeat unfold 11 {fad}
   mi mi mi mi\repeat unfold 8 {sol}
   re' re,\f re re fad fad fad fad la la la la
   
   %34
   re fad, fad fad la la la la re re re re
   fad la, la la re re re re fad fad fad fad
   la8. si16 mi,4. re8
   
   %37
   re16 re, re re fad fad fad fad la la la la
   re fad, fad fad la la la la re re re re
   fad la, la la re re re re fad fad fad fad
   
   %40
   la re, re re fad fad fad fad la la la la
   re8.\tuplet 3/2 { re32 re re } re8 la re la
   re la re la fad re
   
   %43
   la'8.\tuplet 3/2 { la32 la la } la8 la la la
   la8. si16 mi,4. re8
   re2. r4 r8 re do4   %%% Loure
   
   %46
   sib la sol fa la2
   re, r4 mi2 r4
   fa4. sol8 la4 sol \afterGrace fa2_+({mi8)}
   
   %49
   mi2_+ mi'4\mbreak la, do2
   sold4 mi mi' re4.-+ do8 si4
   do4 mi, la4. si8 si4.-+ la8
   
   %52
   la2. r4 r8 re do4 la2. r4 r8 mi' fa4 \set Score.currentBarNumber = #53
   dod4 re mi la,4. sib8 la sol
   fad4 sol la re, r8 re' fad,8._+(mi32 fad)
   
   %55
   sol2 r4 la2 r4
   sib4. do8 re4\mbreak sol, la fad8.(mi32 fad)
   sol4 sib2 la4 re2
   
   %58
   dod2 dod,4_\dolce mi4. re8 dod4
   re dod re8.(dod32 re) mi4. re8 dod4
   re r r r2.
   
   %61
   R1.*3
   r4 r dod_\dolce mi4. re8 dod4
   re dod re8.(dod32 re) mi4. re8 dod4
   
   %66
   re r r r2.
   R1.*3
   
}

IIIbcn = \relative do {
   
   r4 r8 re mi fad
   sol4 r8 sol fad mi
   fad4 r8 fad sol la
   
   %4
   si4 sol la
   re, r8 re mi fad
   sol4 r8 sol fad mi
   
   %7
   fad4 r8 fad sol la
   si4 sol la
   re, r8 re re re
   
   %10
   sol,2 mi4\mbreak
   la r8 la' la la
   fad2 la4
   
   %13
   re, r8 re re re
   sol,2 mi4
   la r8 la' la la
   
   %16
   fad2 la4
   re, re,8^\markup\italic "Doux et tres marqué"(re) re(re)
   la'(la) la(la) la(la)
   
   %19
   re(re) re(re) re(re)
   la(la) la(la) la(la)
   re, re16 re re8(re) re(re)
   
   %22
   la'(la) la(la) la(la)
   re re16 re re8(re) re(re)
   la la la la la la
   
   %25
   re,16 \repeat unfold 11 {re}
   la' \repeat unfold 11 {la}\mbreak
   \repeat unfold 12 {re}
   
   %28
   \repeat unfold 12 {la}
   re, \repeat unfold 11 {re}
   la' \repeat unfold 11 {la}
   
   %31
   \repeat unfold 12 {re}
   \repeat unfold 12 {la}\mbreak
   re,8 [re] re' re re re
   
   %34
   re,8 [re] re' re re re
   re,8 [re] re' re re re
   fad, sol la[la la la]
   
   %37
   re,8 [re] re' re re re
   re,8 [re] re' re re re
   re,8 [re] re' re re re\mbreak
   
   %40
   re,8 [re] re' re re re
   re,8. \tuplet 3/2 { re32 re re } re8 re re re
   re' re re re re re
   
   %43
   re,8. \tuplet 3/2 { re32 re re } re8 re re re
   fad sol la2
   re4. re8 la4 re,2 r4
   
   %46
   r2. r4 r8 la'' sol4
   fa mi re dod si la
   re2 fa,4 mi re2
   
   %49
   la'4. la'8 sol4\mbreak fa mi re
   mi4. re8 do4 si sold mi
   la sol fa re mi2
   
   %52
   la4. sol8 fa mi re2. la'4. la'8 mi4 la,2.~
   la4. la'8 sol4 fa dod la
   re4. re8 la4 sib do re
   
   %55
   sib' do re fad, mi re
   sol4. sol8 fa?4 \mbreak mib do re
   sol,2 sol4 re'2 re4
   
   %58
   la' la,2_\dolce~la2.
   la~la
   la~la4. la'8	\f sol4
   
   %61
   fa2 fa4 sol la re,
   la sol fa sol la2
   re,4. mi8 fa sol la2.
   
   %64
   re,2 la'4\dolce~la2.
   la~la
   la~la4. la'8	\f sol4
   
   %67
   fa2 fa4 sol la re,
   la sol fa sol la2
   re,2. r
   
}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/4
    \key re\major
    \tempo 2. = 45
    s2.*44\break
    \mark\markup\larger "[5.] Loure"
    \time 6/4
    \key do\major
    \tempo 1. = 30
    s1.
    \repeat volta 2{s1.*6}
    \alternative {{s1.}{s}}
    \once \override Score.RehearsalMark.extra-offset = #'(+7 . -1)
    \mark \markup\italic"Reprise"
    \repeat volta 2{s1.*10}
    \alternative {{s1.}{s}} 
    s1.*5
    \bar "|."

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}





IVfln = \relative do'' {
   
   la'8[re, re mi]
   fad[re re la']
   si[sol sol si]
   
   %4
   la fad fad16 sol la fad
   sol la sol fad mi fad sol mi
   fad sol fad mi re mi fad sol
   
   %7
   la8\f[re, re mi]
   fad-+[re re la']
   si[sol sol si]
   
   %10
   la fad fad16 sol la fad
   sol la sol fad mi fad sol mi
   fad sol fad mi re4
   
   %13
   fad8_\dolce^\markup\italic {"petites Flûtes"}[re re fad]
   fad[(mi) la,-! mi']
   mi[dod dod mi]
   
   %16
   mi(re) sold,-! re'
   re[si si re]
   dod\f la la'4\mbreak
   
   %19
   r8 la[la sol16 fad]
   sol8 re si'4
   r8 si[si la16 sol]
   
   %22
   la8 sol16 fad sol8 fad16 mi
   fad sol fad mi re mi fad re
   mi8 la, la'4
   
   %25
   la la8 sol16 fad
   mi8-+ re dod16 re mi dod
   re8^\markup\italic {Flûtes}_\dolce sol16 fad mi fad sol mi\mbreak
   
   %28
   fad8 mi16 re dod re mi dod
   re8 sol16 fad mi fad sol mi
   fad8 mi16 re dod re dod re
   
   %31
   mi8 la, la'4
   la la8 sol16 fad
   mi8 re dod16 re mi dod
   
   %34
   re4 re
   fad8\f[re re fad]
   
}

IVvlIn = \relative do'' {
   
   re[fad, fad sol]
   la[fad fad fad']
   sol[mi mi sol]
   
   %4
   fad re re16 mi fad re
   mi fad mi re dod re mi dod
   re dod re mi re dod re mi
   
   %7
   la8\f [re, re mi]
   fad-+[re re la']
   si[sol sol si]
   
   %10
   la fad fad16 sol la fad
   sol la sol fad mi fad sol mi
   fad sol fad mi re4
   
   %13
   re8_\dolce [si si re]
   fad[(mi) la,-! mi']
   mi[dod dod mi]
   
   %16
   mi(re) sold,-! re'
   re[si si re]
   dod\f la la'4\mbreak
   
   %19
   r8 la[la sol16 fad]
   sol8 re si'4
   r8 si[si la16 sol]
   
   %22
   la8 sol16 fad sol8 fad16 mi
   fad sol fad mi re mi fad re
   mi8 la, la'4
   
   %25
   la la8 sol16 fad
   mi8-+ re dod16 re mi dod
   re8_\dolce sol16 fad mi fad sol mi\mbreak
   
   %28
   fad8 mi16 re dod re mi dod
   re8 sol16 fad mi fad sol mi
   fad8 mi16 re dod re dod re
   
   %31
   mi8 la, la'4
   la la8 sol16 fad
   mi8 re dod16 re mi dod
   
   %34
   re4 re
   fad8\f[re re fad]
   
}

IVvlIIn = \relative do'' {
   
   re[fad, fad sol]
   la[fad fad fad']
   sol[mi mi sol]
   
   %4
   fad re re16 mi fad re
   mi fad mi re dod re mi dod
   re dod re mi re dod re mi
   
   %7
   fad8\f [fad, fad sol]
   la[fad fad fad']
   sol[mi mi sol]\mbreak
   
   %10
   fad8 re re16 mi fad re
   mi fad mi re dod re mi dod
   re dod re mi re4
   
   %13
   re8_\dolce [si si re]
   re[(dod) la-! dod]
   dod[la la dod]
   
   %16
   dod[(si) sold-! si]
   si[sold sold si]
   la\f la fad'4\mbreak
   
   %19
   r8 fad[fad mi16 re]
   sol8 sol, sol'4
   r8 sol[sol fad16 mi]
   
   %22
   fad8 mi16 re mi8 re16 dod
   re mi re dod si dod re si
   dod8 la fad'4
   
   %25
   fad fad8 mi16 re
   dod8 si la16 si dod la
   re8_\dolce mi16 re dod re mi dod\mbreak
   
   %28
   re8 dod16 si la si dod la
   re8 mi16 re dod re mi dod
   re8 dod16 si la si la si 
   
   %31
   dod8 la fad'4
   fad fad8 mi16 re
   dod8 si la16 si dod la
   
   %34
   re4 re
   re8 \f[si si re]

}

IVbcn = \relative do {
   
   re4_\markup\italic"Tambourin deux fois entieres" re
   re re
   sol, sol
   
   %4
   re' re
   sol, la
   re, re
   
   %7
   re' re
   re re
   sol, sol\mbreak
   
   %10
   re' re
   sol, la
   re, re 
   
   %13
   re' re
   la la 
   la' la
   
   %16
   mi mi,
   mi' mi
   la, r\mbreak
   
   %19
   re r
   sol, r
   sol' r
   
   %22
   re r
   re re
   la la
   
   %25
   la la
   la la
   re, la'\mbreak
   
   %28
   la la
   re, la'
   re r
   
   %31
   la la
   la la
   la la
   
   %34
   re, re
   re' re

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/4
    %\override Staff.TimeSignature.style = #'single-digit
    \key re\major
    \tempo 2 = 65
    s2*13\break
    \mark\markup\italic "Reprise"
    \bar ".|:"
     s2*22
    \bar ":|."

}

IVfl = {
    <<\IVfln \forma>>

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}





VvlIn = \relative do'' {

   re4 fad2\f
   si,4 mi2
   la,4 la'2

   %4
   re,4 sol fad8 mi
   fad4 fad2
   si,4 mi2

   %7
   la,4 la'2
   re,4. mi8 dod4-+
   re4 fad,8^\markup\italic "Doux et tres marqué"(fad) fad(fad)

   %10
   fad(mi)mi(fad)sol(mi)
   fad(re) re'[(re) re(re)]
   re(dod) dod(re) mi(dod)

   %13
   re fad,16 fad fad8(fad) fad(fad)
   fad(mi)mi(fad)sol(mi)
   fad re'16 re re8(re) re(re)

   %16
   re(dod) dod(re) mi(dod)
   re16 fad, fad fad\repeat unfold 8 {fad}
   \repeat unfold 8 {mi} sol sol sol sol\mbreak

   %19
   fad re' re re\repeat unfold 8 {re}
   re re re re dod dod dod dod mi mi mi mi
   re fad, fad fad \repeat unfold 8 {fad}

   %22
   \repeat unfold 8 {mi} sol sol sol sol\mbreak
   fad re' re re\repeat unfold 8 {re}
   re re re re dod dod dod dod mi mi mi mi\mbreak

   %25
   re re re re fad fad fad fad re fad re fad
   mi la, la la la' la la la mi la mi la  %%% reprise

   %27
   fad re re re si' si si si sol si sol si
   mi, la, la la la' la la la mi la mi la
   fad re re re fad fad fad fad re fad re fad

   %30
   mi la, la la la' la la la mi la mi la
   fad re re re si' si si si sol si sol si
   mi, la, la la la' la la la mi la mi la

   %33 la tromba
   <<
      {
         fad4^\markup\italic\center-align {Trompette} la2~
         la2.~
         la2.~

         %36
         la2.~
         la2.~
         la2.~

         %39
         la2.~
         la2.
      }\\{
         fad16 \stemUp re, re re\stemDown fad' sol fad mi re mi re dod
         si sol sol sol sol' la sol fad mi fad mi re\mbreak
         dod la la la la' si la sol fad sol fad mi
         re la' la la dod, re dod si la si la sol
         fad re re re fad' sol fad mi re mi re dod
         si sol sol sol sol' la sol fad mi fad mi re
         dod la la la la' si la sol fad sol fad mi \mbreak
         re la'  la la dod, re dod si la si la sol
      }
   >>
   fad re re re fad fad fad fad la la la la

   %42
   re fad, fad fad la la la la re re re re
   fad la, la la re re re re fad fad fad fad
   la re, re re fad fad fad fad la la la la\mbreak

   %45
   re8. \tuplet 3/2 { re32 re re } re8 la re la
   re la re la fad re
   la'8.\tuplet 3/2 {la32 la la} la8 la la la

   %48
   la8. si16 mi,4.-+ re8
   re16 re, re re fad fad fad fad la la la la
   re fad, fad fad la la la la re re re re

   %51
   fad la, la la re re re re fad fad fad fad\mbreak
   la re, re re fad fad fad fad la la la la
   re8. \tuplet 3/2 { re32 re re } re8 la re la

   %54
   re la re la fad re
   la'8.\tuplet 3/2 {la32 la la} la8 la la la
   la8. si16 mi,4.-+ re8

   %57
   re2.

}

VvlIIn = \relative do'' {

   re4 fad2\f
   si,4 mi2
   la,4 la'2

   %4
   re,4 sol fad8 mi
   fad4 fad2
   si,4 mi2

   %7
   la,4 la'2
   re,4. mi8 dod4-+
   re4 re,8^\markup\italic "Doux et tres marqué"(re) re(re)
   re(dod) dod(re) mi(dod)
   re(fad) fad (fad) fad (fad)
   fad(mi) mi(fad) sol(mi)
   fad re16 re re8(re) re(re)
   re(dod) dod(re) mi(dod)
   re fad16 fad fad8(fad) fad(fad)
   fad(mi) mi(fad) sol(mi)
   fad16 \repeat unfold 11 {re}
   re re re re \repeat unfold 8 {dod}\mbreak
   re \repeat unfold 11 {fad}
   mi mi mi mi\repeat unfold 8 {sol}
   fad16 \repeat unfold 11 {re}
   re re re re \repeat unfold 8 {dod}
   re \repeat unfold 11 {fad}
   mi16 mi mi mi sol sol sol sol sol sol sol sol
   fad re' re re fad fad fad fad re fad re fad

   mi la, la la la' la la la mi la mi la  %%% reprise

   %27
   fad re re re si' si si si sol si sol si
   mi, la, la la la' la la la mi la mi la
   fad re re re fad fad fad fad re fad re fad

   %30
   mi la, la la la' la la la mi la mi la
   fad re re re si' si si si sol si sol si
   mi, la, la la la' la la la mi la mi la

   %33 la tromba
   fad16 \stemUp re, re re\stemDown fad' sol fad mi re mi re dod
   si sol sol sol sol' la sol fad mi fad mi re\mbreak
   dod la la la la' si la sol fad sol fad mi

   %36
   re la' la la dod, re dod si la si la sol
   fad re re re fad' sol fad mi re mi re dod
   si sol sol sol sol' la sol fad mi fad mi re

   %39
   dod la la la la' si la sol fad sol fad mi \mbreak
   re la'  la la dod, re dod si la si la sol
   fad re re re fad fad fad fad la la la la

   %42
   re fad, fad fad la la la la re re re re
   fad la, la la re re re re fad fad fad fad
   la re, re re fad fad fad fad la la la la\mbreak

   %45
   re8. \tuplet 3/2 { re32 re re } re8 la re la
   re la re la fad re
   la'8.\tuplet 3/2 {la32 la la} la8 la la la

   %48
   la8. si16 mi,4.-+ re8
   re16 re, re re fad fad fad fad la la la la
   re fad, fad fad la la la la re re re re

   %51
   fad la, la la re re re re fad fad fad fad\mbreak
   la re, re re fad fad fad fad la la la la
   re8. \tuplet 3/2 { re32 re re } re8 la re la

   %54
   re la re la fad re
   la'8.\tuplet 3/2 {la32 la la} la8 la la la
   la8. si16 mi,4.-+ re8

   %57
   re2.

}

Vbcn = \relative do {
   
   re,4 r8 re' mi fad
   sol4 r8 sol fad mi
   fad4 r8 fad sol la
   
   %4
   si4 sol la
   re, r8 re mi fad
   sol4 r8 sol fad mi
   
   %7
   fad4 r8 fad sol la
   si4 sol la
   re, re,8^\markup\italic "Doux et tres marqué"(re) re(re)
   la'(la) la(la) la(la)
   
   %11
   re(re) re(re) re(re)
   la(la) la(la) la(la)
   re, re16 re re8(re) re(re)
   
   %14
   la'(la) la(la) la(la)
   re re16 re re8(re) re(re)
   la la la la la la
   
   %17
   re,16 \repeat unfold 11 {re}
   la' \repeat unfold 11 {la}\mbreak
   \repeat unfold 12 {re}
   
   %20
   \repeat unfold 12 {la}
   re, \repeat unfold 11 {re}
   la' \repeat unfold 11 {la}
   
   %23
   \repeat unfold 12 {re}
   \repeat unfold 12 {la}\mbreak
   re,8 re' re re re re
   
   %26
   la la la la la la %%%% reprise
   si[si] sol sol sol sol
   la la la la la la

   %29
   re,8 re' re re re re
   la la la la la la
   si[si] sol sol sol sol

   %32
   la la la la la la
   re,8 re' re re re re
   sol, sol sol sol sol sol\mbreak

   %35
   la la la la la la
   fad sol la la la la
   re, re' re re re re

   %38
   sol, sol sol sol sol sol
   la la la la la la\mbreak  %% fine pagina
   fad[sol] la la la la

   %41
   re,[re] re' re re re
   re,[re] re' re re re
   re,[re] re' re re re

   %44
   re,[re] re' re re re\mbreak
   re,8. \tuplet 3/2 { re32 re re } re8 re re re
   re' re re re re re

   %47
   re,8. \tuplet 3/2 { re32 re re } re8 re re' re
   fad, sol la2
   re,8[re] re' re re re

   %50
   re,[re] re' re re re
   re,[re] re' re re re
   re,[re] re' re re re\mbreak

   %53
   re,8. \tuplet 3/2 { re32 re re } re8 re re re
   re' re re re re re
   re,8. \tuplet 3/2 { re32 re re } re8 re re' re

   %56
   fad, sol la2
   re2. 
   
}

Vbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \key re\major
   \tempo 2. = 45
   s2.*57
   \bar "|."

}

VvlI = {
   <<\VvlIn \forma>>

}

VvlII = {
   <<\VvlIIn \forma>>

}

Vbc = {
   \clef bass
   <<\Vbcn \forma \Vbfn>>
}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \header {
        title = \markup\smaller{"Fantaisie"}
        composer = \markup{"J-F. Rebel (1666 - 1747)"}
    }

    \markup \huge {[1.] Grave}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 3/2\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi r1.^\markup\center-align "[Violon 1.] "r r2 r re''}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi r2^\markup\center-align "[Violon 2.]"r la'2}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[3.] Mineur}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi re''4^\markup\center-align "Flûte"fa'' sol''}
                \clef french
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IIfl\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi  re''4^\markup\center-align "Violon [1.]"re' mi'}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi re''4^\markup\center-align "Violon [2.]"re' mi'}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi r2.^\markup\center-align "Partie" re'}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "prt"
                \IIpartie\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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
    
}
    
\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[4.] Majeur}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi  re''4^\markup\center-align "Violon [1.]"re' mi'}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi re''4^\markup\center-align "Violon [2.]"re' mi'}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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
    
}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[6.] Tambourin}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 2/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi  la''8^\markup\center-column\smaller{"Flûtes Allemandes"\vspace #-0.4"et petites Flûtes"} [re'' re'' mi'']}
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \set Staff.shortInstrumentName = "fl"
                \IVfl\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 2/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi re''8^\markup\center-align "Violon [1.]"[fad' fad' sol']}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 2/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi re''8^\markup\center-align "Violon [2.]"[fad' fad' sol']}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 3.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

}
    
\bookpart {

    \paper  {

        systems-per-page = #5

    }

    \markup \huge {[7.] Chaconne}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digit  re''4^\markup\center-align "Violon [1.]"fad''2}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digit re''4^\markup\center-align "Violon [2.]"fad''2}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \Vbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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
    
}

