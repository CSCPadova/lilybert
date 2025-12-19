\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

cadenza_vlI = \relative do {

    \tempo 4 = 40


}

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

dolce = _\markup \italic { dolce }

rinf = _\markup \italic { rinf }

tu = ^\markup \italic "Tutti"

pf = _\markup { \italic poco \dynamic f}

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

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
        \musicglyph "scripts.prall"
    }
}


mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \con
}

IvlIn = \relative do'' {
   
   la4 dod8. re16 mi8.[mi16 la8. mi16]
   <fad la, re,>4 <<<mi dod>\\la,>> r8 r16 mi' [la8. mi16]
   fad8.[mi16 la8. mi16] mi8.[re16 si'8. re,16]
   
   %4
   re4 dod8. fad,16 mi8.[re16 dod8. si16]
   la'4 dod8. re16 mi8.[mi16 la8. mi16]\mbreak
   \appoggiatura mi8 red4 dod8. si16 fad'8.[la16 sold8. fad16]
   
   %7
   sold4 fad8. mi16 si'8. si,16 mi8. si16
   dod4 si8. mi16 la4 sold8. si,16
   dod4 si8. mi16 la4 sold8. mi16
   
   %10
   red8. si16 mi8. si16 fad'8. si,16 sold'8. si,16\mbreak
   \tuplet 3/2 { la'8-! sold fad sold[fad mi] } fad2\tr 
   mi2~mi8.[la16 mi8. si'16]
   
   %13
   mi,2~mi8.[la16 mi8. si'16]
   mi,8.[dod16 si8. mi16] sold,8. mi'16 fad,8. red'16
   mi2 r
   mi4 sold8. la16 si8. si,16\mbreak mi8. si16 
   
   %17
   dod8. mi16 si4 r8 r16 si[mi8. si16]
   dod8.[si16 mi8. si16] si8.[la16 fad'8. la,16]
   la4 sold8. la16 si8.[si16 fad'8. si,16]
   
   %20
   mid8. sold16 si,8. dod16 re8.[re16 dod8. si16]
   si4 la8. si16 dod4 fad8. dod16\mbreak
   dod4 si8. fad'16 si,4 sold'8. si,16
   
   %23
   si4 la8. si16 dod8.[dod16 fad8. dod16]
   re8.[dod16 fad8. fad,16] la4 sold8. fad16
   fad4 la~la8.[la16 dod8. la16]
   
   %26
   fad'4 mi8. la,16 re4 dod8. la16\mbreak
   fad'4 mi8. la,16 re4 dod8. la16
   dod8.[dod16 si8. la16] <<si2\\mi,>>
   
   %29
   la4 dod8. re16 mi8.[mi16 la8. mi16]
   <fad la, re,>4 <<<mi dod>\\la,>> r8 r16 mi' [la8. mi16]
   fad8.[mi16 la8. mi16] mi8.[re16 si'8. re,16]\mbreak
   
   %32
   re4 dod8. re16 mi8.[mi16 la8. mi16]
   fad4 mi8. la,16 re4 dod8. la16
   fad'4 mi8. la,16 re4 dod8. la16
   
   %35
   fad'8. re16 la'8. la,16 dod4 si8. la16
   la2~la8. re16 la8. mi'16\mbreak
   la,2~la8. re16 la8. mi'16 
   
   %38
   la,8. fad'16 la,8. la'16 dod,4 si8. la16
   la8.[mi16 dod8. mi16] la,2
 
}

IvlIIn = \relative do'' {
   
   la4 dod8. re16 mi8.[mi16 la8. mi16]
   <fad la, re,>4 <<<mi dod>\\la,>> r8 r16 mi' [la8. mi16]
   fad8.[mi16 la8. mi16] mi8.[re16 si'8. re,16]
   
   %4
   re4 dod8. fad,16 mi8.[re16 dod8. si16]
   la'4 dod8. re16 mi8.[mi16 la8. mi16]\mbreak
   \appoggiatura mi8 red4 dod8. si16 red8.[fad16 mi8. red16]
   
   %7
   mi4 red mi si
   mi, mi red' mi
   mi, mi red' mi\mbreak
   
   %10
   fad8.[si,16 sold'8. si,16] red8. [si16 mi8. si16]
   \tuplet 3/2 { fad'8-! mi red } mi2 red4
   mi2~mi8. [la16 mi8. si'16]
   
   %13
   mi,2~mi8. [la16 mi8. si'16]
   mi,8.[dod16 si8. mi16] sold,8. mi'16 fad,8. red'16
   mi2 r
   mi4 sold8. la16 si8. si,16\mbreak mi8. si16 
   
   %17
   dod8. mi16 si4 r8 r16 si[mi8. si16]
   dod8.[si16 mi8. si16] si8.[la16 fad'8. la,16]
   la4 sold8. la16 si2
   
   %20
   si4 sold8. la16\mbreak si8.[si16 la8. sold16]
   sold4 fad8. sold16 la4 fad'8. dod16
   dod4 si8. fad'16 si,4 sold'8. si,16
   
   %23
   si4 la8. si16 dod8.[dod16 fad8. dod16]
   re8.[dod16 fad8. fad,16] la4 sold8. fad16\mbreak
   fad4 la~la8.[la16 dod8. la16]
   
   %26
   fad'4 mi8. la,16 re4 dod8. la16\mbreak
   fad'4 mi8. la,16 re4 dod8. la16
   dod8.[dod16 si8. la16] <<si2\\mi,>>
   
   %29
   la4 dod8. re16 mi8.[mi16 la8. mi16]
   <fad la, re,>4 <<<mi dod>\\la,>> r8 r16 mi' [la8. mi16]
   fad8.[mi16 la8. mi16] mi8.[re16 si'8. re,16]\mbreak
   
   %32
   re4 dod8. re16 mi8.[mi16 la8. mi16]
   fad4 mi8. la,16 re4 dod8. la16
   fad'4 mi8. la,16 re4 dod8. la16
   
   %35
   fad'8. re16 la'8. la,16 dod4 si8. la16
   la2~la8. re16 la8. mi'16\mbreak
   la,2~la8. re16 la8. mi'16 
   
   %38
   la,8. fad'16 la,8. la'16 dod,4 si8. la16
   la8.[mi16 dod8. mi16] la,2
   
}

Ivlan = \relative do' {
   
   mi2. mi4
   la, la' la la
   la la la sold
   
   %4
   mi4. r16 fad mi8.[re16 dod8. si16]
   la2 la'4 dod
   fad,2 si,4 si\mbreak
   
   %7
   si2 si4 sold'
   la sold fad mi
   la sold fad mi
   
   %10
   si si si si
   si si si si'
   sold8.[sold16 sold8. sold16] dod4 si
   
   %13
   sold8.[sold16 sold8. sold16] dod4 si\mbreak
   dod mi,2 red4
   si2 r
   
   %16
   si' r4 si
   mi, mi si' sold
   mi mi mi red
   
   %19
   si2 sold'4 fad
   sold2. mid4
   dod2 fad4 dod\mbreak
   
   %22
   fad2 sold
   sold4 fad fad la
   fad4 fad2 mid4 
   
   %25
   fad dod8. re16 mi4 la
   la la sold la
   la la sold la
   
   %28
   la8.[la16 sold8. fad16] sold2\mbreak
   mi dod4 mi
   la, la'  la la
   
   %31
   la la la sold
   mi2 la4 la
   la la sold la
   
   %34
   la la sold la
   la la2 sold4
   dod,8. [dod16 dod8. dod16] fad4 mi
   
   %37
   dod8. [dod16 dod8. dod16] fad4 mi
   fad8. la16 la2 sold4
   la8.[mi16 dod8. mi16] <<la2\\la,>>

}


Ibcn = \relative do {
   
   la2. dod4
   re dod8. si16 dod4 la
   re dod si mi
   
   %4
   la,4. r16 fad' mi8.[re16 dod8. si16]
   la4 r dod la
   si2 si'4 si,\mbreak
   
   %7
   mi fad sold mi
   la sold fad mi
   la sold fad mi
   
   %10
   si' si si si
   si mi, si4. si'8
   dod8.[dod16 si8. si16] la4 sold
   
   %13
   dod8.[dod16 si8. si16] \mbreak la4 sold
   la8.[la16 sold8. mi16] si4 si
   mi4. fad8 sold8.[la16 si8. la16]
   
   %16
   sold4 mi r sold
   la sold8. fad16 sold4 mi
   la sold fad si,\mbreak
   
   %19
   mi2 mi4 re!
   dod2 mid4 dod
   fad2 fad4 fad,
   
   %22
   re' red mi mid
   fad fad8. sold16 la4 fad
   si, la8. si16 dod4 dod
   
   %25
   fad,8. fad'16 mi8. re16 dod4 la\mbreak  %fine 4ta riga
   re' dod si la
   re, dod si la
   
   %28
   mi'2~mi8.[fad16 mi8. re16]
   dod4 la2 dod4
   re dod8. si16 dod4 la
   
   %31
   re dod si mi
   la la,8. si16 dod4 la\mbreak
   re dod si la
   
   %34
   re dod si la
   re dod8. re16 mi4. mi8
   fad8. fad16 mi8. mi16 re4 dod
   
   %37
   fad8. fad16 mi8. mi16 re4 dod
   re dod8. re16 mi4 mi,
   la1\fermata
   
}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*2
    s2 s4 <4>4 
    <3>1
    s
    <_+>
    s1*12
    s2 s4 <6>
    <_+>2 <7>
    s1
    <7>4 <6> s <6 5>
    s1*9
    <4>4 <3> s2



}

forma = {

    \time 4/4
    \key la\major
    \tempo 2 = 60
    s1*39
    \bar"|."

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

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {
   
   dod2 fad~
   fad mi
   re1
   
   %4
   dod
   si
   la
   
   %7
   sold
   la2 fad'~\mbreak
   fad mi4 re
   
   %10
   dod2 mi~
   mi re~
   re dod
   
   %13
   si mi~
   mi re
   dod fad~
   
   %16
   fad mi
   re1
   dod\mbreak
   
   %19
   si
   la sold
   la4 si dod2~
   
   %22
   dod si
   dod1\fermopz
   
   
}

IIvlIIn = \relative do'' {
   
   R1
   sold2 dod~
   dod si~
   
   %4
   si la~
   la sold~
   sold fad~
   
   %7
   fad mid\mbreak
   fad r 
   si1
   
   %10
   r2 la4 sold
   fad2 la
   sold la~
   
   %13
   la sol4 mi
   lad2 si~
   si la!4 fad
   
   %16
   sid2 dod~\mbreak
   dod si!~
   si la~
   
   %19
   la sold~
   sold fad~
   fad mid
   
   %22
   fad4 sold la sold
   fad1
   mid\fermata
   
}

IIvlan = \relative do' {
   
   fad4 sold la fad
   dod si dod dod,
   fad fad' sold fad
   
   %4
   mid dod\mbreak fad mi
   re si mi re
   dod la re dod
   
   %7
   si sold dod dod
   fad, fad' la fad
   sold fad sold mi
   
   %10
   la, si dod la
   re mi fad re
   mi mi, mi' mi
   
   %13
   mi1
   fad4 fad, fad' fad
   fad1
   
   %16
   sold4 sold dod, mi
   fad fad sold fad
   mid dod fad mi
   
   %19
   re si mi re\mbreak
   dod la re dod
   si si dod si
   
   %22
   la sold fad mi'
   re1
   dod\fermopz


}


IIbcn = \relative do {
   
   fad4_\markup\italic "Senza Cembalo" sold la fad
   dod si dod dod,
   fad fad' sold fad
   
   %4
   mid dod\mbreak fad mi
   re si mi re
   dod la re dod
   
   %7
   si sold dod dod
   fad, fad' la fad
   sold fad sold mi
   
   %10
   la, si dod la
   re mi fad re
   mi mi, mi' mi
   
   %13
   mi1
   fad4 fad, fad' fad
   fad1
   
   %16
   sold4 sold dod, mi
   fad fad sold fad
   mid dod fad mi
   
   %19
   re si mi re\mbreak
   dod la re dod
   si si dod si
   
   %22
   la sold fad mi'
   re1
   dod\fermopz

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    s1*12
    <4!>1
    <7 _+>2 <6 4>
    <4!>1
    <7 _+>2 <_!>
    <6 5> <_3>
    <6 5> <_3>
    s1
    s
    <6 5>2 <_+>
    s2 s4 <6>
    <7>2 <6>
    <_+>1
    
}

forma = {

    \time 4/4
    \key la\major
    \tempo 2 = 60
    s1*24
    \bar"|."

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

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con
}

IIIvlIn = \relative do'' {
   
   \tuplet 3/2 { la'16(sold fad) } mi8[mi]
   mi4 r8
   \tuplet 3/2 { la16(sold fad) } mi8[mi]
   
   %4
   mi4 r8
   \tuplet 3/2 { la16(sold fad) } mi8[fad]
   \tuplet 3/2 { mi16 re dod } si8[la]
   
   %7
   la16 si dod la dod red \mbreak
   mi8 mi, r
   \tuplet 3/2 { mi'16(red dod) } si8[red]
   
   %10
   \once\stemUp la, re'?(dod)
   \tuplet 3/2 { fad16(mi re?) } dod8 [mi]
   \once\stemUp si, mi'(red)
   
   %13
   \tuplet 3/2 { mi16[(red dod)]} si8 mi
   \tuplet 3/2 { dod16(si la) } \once\stemDown fad'8[la,,]
   \tuplet 3/2 { red'16(dod si) } \once\stemDown sold'8[si,,] \mbreak
   
   %16
   \tuplet 3/2 { mi'16(red dod) } la'8 [\once\stemUp dod,,]
   \tuplet 3/2 { fad'16[(mi red)] } si'8 \once\stemUp red,,
   \tuplet 3/2 { sold'16[(fad mi)] } fad8 sold
   
   %19
   \tuplet 3/2 { la16[(sold fad)] } sold8 mi
   fad, fad' mi
   \tuplet 3/2 { la16[(sold fad)] } sold8 mi
   
   %22
   si16 red mi fad si, la'\mbreak
   \tuplet 3/2 { sold16(fad mi) } fad4\tr 
   \tuplet 3/2 { mi16(red mi) si[(la si)] sold(fad sold)
   
   %25  OOKK
   mi(red mi) sold[(fad sold)] si(la si)}
   mi4 r8
   \tuplet 3/2 { mi16[(red dod)]} si8 si
   
   %28
   si4 r8
   \tuplet 3/2 { mi16[(red dod)]} si8 si
   si4 r8
   
   %31
   \tuplet 3/2 { mi16[(red dod)]} si8 mi
   fad, fad' dod
   re?8 mi16 re dod si
   
   %34
   lad sold fad4
   \tuplet 3/2 { fad'16[(mi re)] } dod8 dod
   dod4~\tuplet 3/2 { dod16(re mi)
   
   %37
   fad16[(mi re)] } dod8 dod~
   dod4 fad8\mbreak
   \tuplet 3/2 { re16[(dod si)] } dod4\tr 
   
   %40
   si4 re8~
   re16 fad mi8 re
   dod4 mi8~
   
   %43
   \tuplet 3/2 { mi16[(fad sold)] } <<{la8 [dod,]~
                                       dod [si]}\\{s la~
                                                 la [sold]}>> r
   \tuplet 3/2 { la'16[(sold fad)] } mi8 mi
   
   %46
   mi4 r8
   \tuplet 3/2 { la16[(sold fad)] } mi8 mi\mbreak
   fad16. re32 dod8[si]
   
   %49
   sold'16. re32  dod8[si]
   la'8 sold16. fad32 mi16. re32
   \tuplet 3/2 { dod16(si la) } \appoggiatura dod8 si4\tr 
   
   %52
   la8 dod mi
   \tuplet 3/2 { la16(sold fad) } mi8[mi]
   mi4~\tuplet 3/2 { mi16(fad sold)
   
   %55
   la(sold fad)} mi8[mi]\mbreak
   mi4~\tuplet 3/2 { mi16(fad sold)
   la(sold fad)} mi8[la]
   
   %58
   \tuplet 3/2 { dod,16[(si la)] } si8 sold'
   \tuplet 3/2 { la16(sold la) mi[(re mi)] dod(si dod)
   la(si la) dod[(re dod)] mi(fad mi)}
   
   %61
   la4 r8

}

IIIvlIIn = \relative do'' {
   
   \tuplet 3/2 { la'16(sold fad) } mi8[mi]
   mi4 r8
   \tuplet 3/2 { la16(sold fad) } mi8[mi]
   
   %4
   mi4 r8
   \tuplet 3/2 { la16(sold fad) } mi8[fad]
   \tuplet 3/2 { mi16 re dod } si8[la]
   
   %7
   la16 si dod la dod red \mbreak
   mi8 mi, r
   \tuplet 3/2 { mi'16(red dod) } si8[red]
   
   %10
   \once\stemUp la, re'?(dod)
   \tuplet 3/2 { fad16(mi re?) } dod8 [mi]
   \once\stemUp si, mi'(red)
   
   %13
   \tuplet 3/2 { mi16[(red dod)]} si8 mi
   \tuplet 3/2 { dod16(si la) } \once\stemDown fad'8[la,,]
   \tuplet 3/2 { red'16(dod si) } \once\stemDown sold'8[si,,] \mbreak
   
   %16
   \tuplet 3/2 { mi'16(red dod) } la'8 [\once\stemUp dod,,]
   \tuplet 3/2 { fad'16[(mi red)] } si'8 \once\stemUp red,,
   \tuplet 3/2 { sold'16[(fad mi)] } fad8 sold
   
   %19
   \tuplet 3/2 { la16[(sold fad)] } sold8 mi
   fad, fad' mi
   \tuplet 3/2 { la16[(sold fad)] } sold8 mi
   
   %22
   si16 red mi fad si, la'\mbreak
   \tuplet 3/2 { sold16(fad mi) } fad4\tr 
   \tuplet 3/2 { mi16(red mi) si[(la si)] sold(fad sold)
   
   %25  OOKK
   mi(red mi) sold[(fad sold)] si(la si)}
   mi4 r8
   \tuplet 3/2 { mi16[(red dod)]} si8 si
   
   %28
   si4 r8
   \tuplet 3/2 { mi16[(red dod)]} si8 si
   si4 r8
   
   %31
   \tuplet 3/2 { mi16[(red dod)]} si8 mi
   fad, fad' dod
   re?8 mi16 re dod si
   
   %34
   lad sold fad4
   \tuplet 3/2 { fad'16[(mi re)] } dod8 dod
   dod4~\tuplet 3/2 { dod16(re mi)
   
   %37
   fad16[(mi re)] } dod8 dod~
   dod4 fad8\mbreak
   \tuplet 3/2 { re16[(dod si)] } dod4\tr 
   
   %40
   si4 re8~
   re16 fad mi8 re
   dod4 mi8~
   
   %43
   \tuplet 3/2 { mi16[(fad sold)] } la8 [la,]\parenthesize ~
   la [sold] r
   \tuplet 3/2 { la'16[(sold fad)] } mi8 mi
   
   %46
   mi4 r8
   \tuplet 3/2 { la16[(sold fad)] } mi8 mi\mbreak
   fad16. re32 dod8[si]
   
   %49
   sold'16. re32  dod8[si]
   la'8 sold16. fad32 mi16. re32
   \tuplet 3/2 { dod16(si la) } \appoggiatura dod8 si4\tr 
   
   %52
   la8 dod mi
   \tuplet 3/2 { la16(sold fad) } mi8[mi]
   mi4~\tuplet 3/2 { mi16(fad sold)
   
   %55
   la(sold fad)} mi8[mi]\mbreak
   mi4~\tuplet 3/2 { mi16(fad sold)
   la(sold fad)} mi8[la]
   
   %58
   \tuplet 3/2 { dod,16[(si la)] } si8 sold'
   \tuplet 3/2 { la16(sold la) mi[(re mi)] dod(si dod)
   la(si la) dod[(re dod)] mi(fad mi)}
   
   %61
   la4 r8
   
}

IIIvlan = \relative do' {
   
   mi4 r8
   la sold16 fad mi re
   dod4 r8
   
   %4
   la' sold16 fad mi re
   dod4 la'8
   la4 mi8
   
   %7
   dod4 la'8\mbreak
   sold4 r8
   si4 si8
   
   %10
   mi,4 r8
   dod'4 dod8
   fad,4 r8
   
   %13
   si4 si8
   mi, dod r
   fad red r
   
   %16
   sold mi r
   si' si, r
   si si red\mbreak
   
   %19
   mi red si
   dod4 si8
   red mi sold
   
   %22
   fad4 fad8
   mi4 red8
   mi sold si
   
   %25
   sold si sold
   sold4 r8
   R4.
   
   %28
   mi8 red16 dod si la\mbreak
   sold4 r8
   mi' red16 dod si la
   
   %31
   sold4 si'8
   dod4 fad,8
   fad si sol
   
   %34
   dod,4 r8
   lad'4 r8
   lad? lad dod
   
   %37
   si sol mi
   lad fad lad\mbreak
   si4 lad8
   
   %40
   si4 fad8
   si sold? si
   mi,4 si'8
   
   %43
   dod4 mi,8
   mi mi r
   R4.
   
   %46
   la8 sold16 fad mi re
   dod4 la'8 
   la fad fad\mbreak
   
   %49
   si, sold' sold
   fad4 si8
   la4 sold8
   
   %52
   la4 r8
   R4.
   la8 sold16 fad mi re
   
   %55
   dod4 r8
   la'8 sold16 fad mi re
   dod4 la'8
   
   %58
   la4 si,8\mbreak
   mi dod mi
   dod mi dod
   
   %61
   la4 r8
 
}


IIIbcn = \relative do {
   
   la4 r8
   la' sold16 fad mi re
   dod4 r8
   
   %4
   la' sold16 fad mi re
   dod4 re8
   dod4 dod8
   
   %7
   fad fad, fad'\mbreak
   mi red16 dod si la
   sold4 r8
   
   %10
   la4 r8 
   lad4 r8
   si4 r8
   
   %13
   sold'4 sold8
   la la, r
   \parenthesize si' \parenthesize si, \parenthesize r
   dod' dod, r
   
   %17
   red' red, r
   mi red si\mbreak
   dod' si sold
   
   %20
   la, la' sold
   fad mi r
   red4 red8
   
   %23
   mi si' si,
   mi mi mi
   mi mi mi
   
   %26
   mi4.
   R\mbreak
   mi'8 red16 dod si la
   
   %29
   sold4 r8
   mi red16 dod si la
   sold4 sold8
   
   %32
   la4 lad8
   si sol' mi
   fad dod lad
   
   %35
   fad4 r8
   fad' fad, fad'\mbreak
   re mi mi
   
   %38
   fad lad fad
   si mi, fad
   re si si'
   
   %41
   sold mi sold
   la mi' sold,
   la4 la,8
   
   %44
   mi' mi r
   R4.\mbreak
   la8 sold16 fad mi re
   
   %47
   dod4 dod8
   re re re
   mi mi mi
   
   %50
   fad4 sold8
   la re, mi
   la,4 r8
   
   %53
   R4.
   la'8 sold16 fad mi re
   dod4 r8\mbreak
   
   %56
   la' sold16 fad mi re
   dod4 la8
   mi' mi mi
   
   %59
   la, la la
   la la la
   la4 r8
   
}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/8
    \key la\major
    \tempo 2 = 50
    s4.*26
    \bar":..:"
    s4.*35
    \bar ":|."

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

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #4

    }

    \header {
        title = \markup\smaller{Sinfonia in La maggiore}
        composer = \markup \center-column{"L. Leo (1694 - 1744)"}

    }

    \markup \huge {[1.] Allegro assai  }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Cembalo"}
                \set Staff.shortInstrumentName = "bc"
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
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

    \markup \huge {[2.] Andante  }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Cembalo"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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

    \markup \huge {[3.] Allegro  }

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Cembalo"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
                \override BarLine.hair-thickness = #1.2
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
