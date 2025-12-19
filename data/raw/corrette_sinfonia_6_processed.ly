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


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t   		
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.4
   \override TupletBracket.bracket-visibility = ##f
   \terzinequarto\con
}

IvlIn = \relative do'' {
   
   mi,8
   la4 si8 dod4 re8
   mi4. mi4 fad8
   mi4 dod8 re4 mi8
   
   %4
   la,4.~la4 mi8
   la4 si8 dod4 re8
   mi4.\parenthesize ~ mi4 fad8
   
   %7
   mi4 dod8 re4 mi8
   la,4.~la4 la'8\mbreak
   la4 la8 sold4 fad8
   
   %10
   mi4. mi4 mi8
   fad4 fad8 fad4 fad8
   fad4.\tr mi4 mi8
   
   %13
   re4 re8 re4 fad8
   mi4 mi8 mi4 mi8
   re4 re8 re4 fad8
   
   %16
   mi4 mi8 mi4 re8
   dod4 mi8 re4 dod8
   si4.\tr  la4 la,8\mbreak
   
   %19
   mi' mi mi la la la
   dod dod dod mi mi mi
   la la la la la la
   
   %22
   la4.~la4 si8
   dod la la la la dod
   si dod la si dod la
   
   %25
   si4 la8 si re16 dod si8
   dod si dod la4 si8
   dod la la la la dod\mbreak
   
   %28
   si dod la si dod la
   si4\tr la8 si re16 dod si8
   dod si dod la4 mi8
   
   %31
   dod mi la si, mi red
   mi si sold mi4 sold'8
   la4 la8 la4 la8
   
   %34
   la4. sold4\tr la8
   la fad re la la' la
   la mi dod la la' la
   
   %37
   la fad re\mbreak la la' la
   la4 dod8 dod4 si8
   la4 dod8 si4 la8
   
   %40
   sold4.\tr la4 mi,8
   la mi si' dod la re
   mi re dod mi4 fad8
   
   %43
   mi re dod re mi re
   dod si dod la4 mi8
   la mi si' dod la re
   
   %46
   mi re dod mi4 sold8
   mi re dod\mbreak si la sold
   la4. la16(si dod re mi fad32 sold)
   
   %49
   la4 la8 sold4\tr fad8
   mi4.~mi4 mi8
   fad4 fad8 fad4 fad8
   
   %52
   fad4.\tr mi4 mi8
   fad re la la re fad
   mi dod la la dod mi
   
   %55
   fad re la la re fad
   mi la mi mi4 re8
   dod4 mi8 re4 dod8\mbreak
   
   %58
   si4.\tr la4 mi8
   la la la dod dod dod
   mi mi mi la la la
   
   %61
   la la la la la la
   la4.\tr ~la4 mi,8
   la16 sold la si dod si dod re
   
   %64
   mi re mi fad mi re mi fad
   mi dod re mi mi dod re mi
   dod la' sold fad mi re dod si\mbreak
   
   %67
   la si la si dod re dod re
   mi fad mi fad mi fad mi fad
   re mi re mi re mi re mi
   
   %70 OOKK
   dod4. la'8
   la sold16 fad mi la sold fad
   mi dod la dod mi dod  la mi'
   
   %73
   fad re la re fad re la fad'
   fad4\tr mi8 dod' 
   fad,16 re' re, re' fad, re' re, re'\mbreak
   
   %76
   mi, dod' la, dod' mi, dod' la, dod'
   fad, re' re, re' fad, re' re, re'
   dod mi, dod' mi, dod' mi, re' mi, 
   
   %79
   dod' mi, mi' mi, re' mi, dod' mi,
   si'4\tr la,8 mi
   \tuplet 3/2 {la la la dod[dod dod]
   
   %82
   mi mi mi} mi16 la la la
   la la la la la la la la
   la4.
  
}

IvlIIn = \relative do'' {
   
   mi,8
   la4 si8 dod4 re8
   mi4. mi4 fad8
   mi4 dod8 re4 mi8
   
   %4
   la,4.~la4 mi8
   la4 si8 dod4 re8
   mi4.\parenthesize~ mi4 fad8
   
   %7
   mi4 dod8 re4 mi8
   la,4.~la4 dod8\mbreak
   si4. si4 la8
   
   %10
   sold4 dod8 dod re la
   la fad re re re' re
   re4.(dod4) re8
   
   %13
   re la fad re re' re
   dod mi, dod \once\stemUp la dod' dod
   re la fad re re' re
   
   %16
   dod dod dod si si si
   la4 dod8 sold4 la8\mbreak
   sold4. la4 mi8
   
   %19
   mi mi mi la la la
   dod dod dod mi mi mi
   la la la la la la
   
   %22
   la4.~ la4 mi,8
   la4 si8 dod4 re8
   mi4. mi4 fad8
   
   %25
   mi4 dod8 re4 mi8
   la,4.~la4 mi8
   la4 si8 dod4 re8\mbreak
   
   %28
   mi4. ~ mi4 fad8
   mi4 dod8 re4 mi8
   la,4.~la4 dod8
   
   %31
   mi4 mi8 mi4 red8
   mi4.~mi4 mi8
   mi4. mi4 mi8
   
   %34
   red4. mi
   re!4 re8 re4 fad8
   mi4 mi8 mi4 mi8\mbreak
   
   %37
   re4 re8 re4 fad8
   mi4 mi8 mi4 re8
   dod4 mi8 re4 dod8
   
   %40
   si4. \tr la4 r8
   R2.*7
   r4 r8 r4 dod8
   
   %49
   si4. si4 la8
   sold4 dod8 dod la la
   la fad re re re' re
   
   %52
   re4.(dod4) dod8\mbreak
   re la fad re re' re
   dod mi, dod \once\stemUp la dod' dod
   
   %55
   re la fad re re' re
   dod dod dod dod4 si8
   la4 dod8 sold4 la8
   
   %58
   la4.~la4 mi'8
   dod dod dod la la la
   mi mi mi dod dod dod
   
   %61
   la dod mi la, dod mi
   la,4.~la4 r8
   r mi 'la16 sold la si
   
   %64
   dod si dod re dod si dod re
   si la si dod si la si sold
   la8[r16 la'] sold fad mi re
   
   %67
   dod re dod re la si la si
   dod re dod re dod re dod re
   si dod si dod\mbreak si la si sold
   
   %70
   la4 r8 r
   dod16 dod dod dod dod dod dod dod
   dod dod dod dod dod dod dod dod
   
   %73
   re re re re re re re re
   re4 dod8 la'
   la la4 la8~
   
   %76
   la la4 la8
   la la4 la8
   la[la la si]\mbreak
   
   %79
   la[la sold la]
   sold4 dod16 dod dod dod
   la la la la mi mi mi mi
   
   %82
   dod dod dod dod la la la la
   mi mi mi mi dod dod dod dod
   la4.
   
   


}

Ivlan = \relative do' {
   
   mi8
   la,4 si8 dod4 re8
   mi4. mi4 fad8
   mi4 dod8 re4 mi8
   
   %4
   la,4.~la4 mi'8
   la,4 si8 dod4 re8
   mi4. mi4 fad8
   
   %7
   mi4 dod8 re4 mi8
   la,4.~la4 r8
   mi'4. mi4 dod8
   
   %10
   do4 mi8 la sold la
   fad4 la8 la4 la8
   la4. la4 la8
   
   %13
   la4. la
   la la
   la la\mbreak
   
   %16
   la8 la la mi mi sold
   fad4 mi8 mi4 mi8
   re4. dod4 do8
   
   %19
   mi mi mi la la la
   dod dod dod mi mi mi
   la, la la la la la
   
   %22
   la4.~la4 r8
   R2.*7
   r4 r8 r4 la8
   
   %31
   la4 la8 sold4 fad8
   mi4. mi4 mi8
   fad4 fad8 fad4 fad8
   
   %34
   fad4. mi4 la8
   la4 la8 la4 la8\mbreak
   la4 la8 la4 la8
   
   %37
   la4 la8 la4 la8
   la4 mi8 mi4 mi8
   la,4 la'8 fad4 si,8
   
   %40
   mi4.~mi4 r8
   R2.*7
   r4 r8 r4 mi8
   
   %49
   mi4. mi4 dod8
   dod4 mi8 la sold la
   fad4 la8 la4 la8
   
   %52
   la la la la4 la8
   la la la la la la
   la la la la la la
   
   %55
   la la la la la la\mbreak
   la la la mi4 sold8
   fad4 mi8 mi4 mi8
   
   %58
   re4.(dod4) r8
   mi mi mi mi mi mi
   mi mi mi mi mi mi
   
   %61
   mi mi mi mi mi mi
   mi mi mi mi [mi] r8
   la,4\solo r
   
   %64
   la8[la' la la]
   la4 sold8  mi
   la4 r8 mi
   
   %67
   fad[fad fad fad]
   dod4 fad
   si, fad'
   
   %70
   la,4. r8
   la'8[la la la]\mbreak
   la[la la la]
   
   %73
   la[la la la]
   la4 la
   la8[fad re fad]
   
   %76
   la[la la la]
   la[fad re fad]
   mi[mi mi mi]
   
   %79
   mi[mi mi mi]
   mi4 mi
   r la,16 la la la
   
   %82
   dod dod dod dod mi mi mi mi
   la la la la mi mi mi mi
   dod4 r8
   
}

Ibcn = \relative do {
   
   mi8
   la,4 si8 dod4 re8
   mi4. mi4 fad8
   mi4 dod8 re4 mi8
   
   %4
   la,4. la4 mi'8
   la,4 si8 dod4 re8
   mi4. mi4 fad8
   
   %7
   mi4 dod8 re4 mi8\mbreak
   la,4. la'4 la8
   mi4. mi4 fad8
   
   %10
   dod4 la'8 la si dod
   re4 re8 re4 re,8
   la'4 la8 la la sol
   
   %13
   fad re re fad re re
   la'4. la4 sol8
   fad re re fad re re\mbreak
   
   %16
   la' si la sold4 mi8
   fad4 dod8 si4 la8
   mi'4. mi4 la,8
   
   %19
   mi' mi mi la la la
   dod dod dod mi mi mi
   la, la la la la la
   
   %22
   la,4.~la4 r8
   R2.*7
   r4 r8 r4 la'8\mbreak
   
   %31
   la4 la8 sold4 fad8
   mi4. mi4 mi8
   fad4 fad8 fad4 fad8
   
   %34
   si,4. mi4 la,8
   re4 re8 re4 re8
   la'4 la8 la4 la8
   
   %37
   re,4 re8 re4 re8
   la'4 la8 la4 mi8
   fad4 dod8 re4 red8\mbreak
   
   %40
   mi4. la,4 r8
   r4 mi'8 la4 si8
   dod si la la4 la8
   
   %43
   la4. sold
   la la4 r8
   r4 mi8 la4 si8
   
   %46
   dod si la la4 re,8
   dod4 re8 mi4 mi,8
   la4.~la4 la'8
   
   %49
   mi4. mi4 fad8\mbreak
   dod4 la'8 la si dod
   re4 re8 re4 re,8
   
   %52
   la'4 la8 la la la
   re4 re8 re4 re,8
   la'4 la8 la4 la8
   
   %55
   re4 re8 re4 re,8
   la'4 la8 la4 mi8
   fad4 dod8 si4 la8
   
   %58
   mi'4. la,4 la'8\mbreak
   la la la la la la
   la la la la la la
   
   %61
   la la la la la la
   la,4.~la4 r8
   R2*7
   
   %70
   r4. r8
   la'8[la la la]
   la[la la la]
   
   %73
   la[la la la] 
   la[la la la] 
   re, [re re re]
   
   %76
   la'[la la la]
   re[re re re]
   la[la la sold]
   
   %79
   la[dod, si la]\mbreak
   mi'4 la,
   la'8 [la la la ]
   
   %82
   la [la la la]
   la [la la la]
   la,4.
   
}


Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s8
   s2.*8
   <4>4. <7 3>4 <5>8 
   <3>2.
   s
   s
   <6>
   s
   <6>
   s4.  <5/>4 <7>8
   <5>4 <6>8 <6>4.
   s2.*2
   <6>2.
   s2.*10
   s4. <6>4 <6\\>8
   s2.
   <7>
   <7 _+>
   s
   s
   s
   s4. s4 <7>8
   <5>4 <6>8 <6 5>4 <5/>8
   s2.
   s
   <6>
   s4. <5/>
   s2.
   s
   <6>
   <6>4 <6 5>8 s4.
   s2.
   <4>4. <7 3>4 <5>8
   <3>2.
   s2.*5
   s4. s4 <7>8
   <5>4 <6>8 <6\\>4.
   s2.*5
   s2*9
   <6 4>2
   s4 <3>
   s2*4
   s4 s8 <5/>
   s <6> <6\\>
  
}


forma = {

   \key la\major
   \time 6/8
   \tempo 2. = 53
   \partial 8 s8
   s2.*61
   s2 s8
   \bar "|."\break
   \time 2/4
   \tempo 2 = 62
   \partial 8 s8
   s2*7
   s4. \bar ":..:" s8
   s2*13
   s4. 
   \bar":|."
   
}

IvlI = {
   \Iglobal
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


Ibc = {
   \Iglobal
   \clef bass
   <<\Ibcn \forma \Ibfn >>

   }



IIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t   		
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.4
   \override TupletBracket.bracket-visibility = ##f
}


IIvlIn = \relative do'' {
   
   la8 dod re 
   mi4 fad8
   \grace fad mi4 re8
   
   %4
   dod\tr si dod
   re si4\tr 
   la4.
   
   %7
   la8 sold la 
   si4 si8
   mi4 re8
   dod\tr si dod
   
   %11
   re8 \afterGrace dod4 {re8}
   si4\tr si8
   la sold la
   
   %14
   si4 si8
   mi4 re8 
   dod\tr si dod
   re si4\tr 
   
   %18
   la4.
   la16 mi' dod la' re, si'
   mi, dod' mi, dod' fad, re'
   
   %21
   mi, dod' mi, dod' re, si'
   dod, la' si, sold' dod, la'
   re, si' si, sold' fad sold
   
   %24
   <<la4.\\{la16 fad mi re \slurUp dod32[(re dod si)]}>>
   dod'16 mi, si' mi, la mi
   sold mi mi mi si sold'
   
   %27
   mi dod' mi, dod' re, si'
   dod, la' si, sold' dod, la'
   re, si' re, si' dod, la'\mbreak
   
   %30
   dod, sold' fad sold mi si'
   dod mi, si' mi, la mi
   sold mi mi mi si sold'
   
   %33
   mi dod' mi, dod' re, si'
   dod, la' si, sold' dod, la'
   re, si' si, sold' fad sold
   
   %36
   <<la4.\\{la8[mi] \slurUp la32(si la si)}>>
   

}

IIvlIIn = \relative do'' {
   
   la16(mi) la(mi) si'(mi,)
   dod'(la) dod(la) re(la)
   dod(mi,) dod'(mi,) si'(mi,)
   
   %4
   la(mi) sold(mi) la(mi)
   si'(la) mi(sold) fad(mi)
   la mi dod mi la,8
   
   %7
   dod'16(mi,) si'(mi,) la(mi)
   sold(mi) sold(mi) sold(mi)
   la(mi) la(mi) si' (mi,)\mbreak
   
   %10
   la(mi) sold(mi) la(mi)
   si' mi, mi mi mi la
   sold mi mi mi mi mi
   
   %13
   mi mi mi mi mi mi
   mi mi mi mi mi mi
   mi mi mi mi mi mi
   
   %16
   mi mi mi mi mi mi
   si' (la) mi(sold) fad(sold)
   la8 mi la,
   
   %19
   la'8 dod re 
   mi4 fad8
   \grace fad mi4 re8
   
   %22
   dod(si) dod
   re si4\tr 
   la4.
   
   %25
   la8 sold la 
   si4 si8
   mi4 re8
   dod(si) dod
   
   %29
   re8 \afterGrace dod4 {re8}
   si4.\tr
   la8 sold la
   
   %32
   si4 si8
   mi4 re8 
   dod(si) dod
   re si4\tr 
   
   %36
   la4.
   
}

IIvlan = \relative do' {
   
   R4.*3
   la4 mi'8
   fad mi re 
   
   %6
   dod4.
   R4.*8
   la'8 mi mi
   
   %16
   mi4 mi8
   fad mi re
   dod4.
   
   %19
   R4.*3
   la'4 mi8
   fad mi re 
   
   %24
   dod4.
   R4.*7
   mi4.
   
   %33
   mi8 mi mi
   mi4 mi8
   fad mi re
   
   %36
   dod4.

}

IIbcn = \relative do {
   
   la4.~
   la~
   la~
   
   %4
   la4 la'8
   re, mi mi,
   la4.
   
   %7
   la4 la8
   mi'4 re8
   dod la' sold
   
   %10
   la mi la
   sold4 la8
   \once\stemUp dod, mi' re
   
   %13
   dod si la
   sold mi re\mbreak
   dod dod' si
   
   %16
   la sold la
   re, mi mi,
   la4.
   
   %19
   la~
   la~
   la~
   
   %22
   la4 la'8
   re, mi mi,
   la4.
   
   %25
   la4 la8
   mi'4 re8
   dod la sold
   
   %28
   la4 la'8\mbreak
   sold4 la8
   mi4 mi8
   
   %31
   la si dod
   re4.
   dod8 la sold
   
   %34
   la4 la,8
   re mi mi,
   la4.

}


IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s4.*4
   <6 5>4.
   s4.*3
   <6>8 s <5/>
   s4.
   <5/>
   s
   <6>
   <6>
   <6>8 s <6\\>
   s <5/> s
   <6\\ 5>4.
   s4.*5
   <6  5>4.
   s4.*3
   <6>8 s <5/>
   s4.
   <5/>
   s
   s
   <4 2>
   <6>8 s <5/>
   s4.
   <6 5>

}


forma = {

   \key la\major
   \time 3/8
   \tempo 4 = 47
   s4.*6
   \bar ":..:"
   s4.*12
   \bar ":..:"
   s4.*6
   \bar ":..:"
   s4.*12
   \bar ":|."

}

IIvlI = {
   \IIglobal
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


IIbc = {
   \IIglobal
   \clef bass
   <<
      \IIbcn \forma \IIbfn>>

   }


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46, 2.19.49, 2.20.0,
2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3, 2.23.4, 2.23.5,
2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11, 2.23.12, 2.23.13,
2.23.14, 2.24.0
%}


IIIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t   		
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.4
   \override TupletBracket.bracket-visibility = ##f
}


IIIvlIn = \relative do'' {
   
   la8[la]
   mi'[mi mi mi]
   fad[mi mi la]
   mi[fad mi re]
   
   %4
   dod4 la8 la
   mi'[mi mi mi]
   fad[mi mi la]
   
   %7
   mi[fad mi re]
   dod[dod si dod]
   re[dod si dod]
   
   %10
   re[re re re]
   re mi dod4
   si dod8 dod
   
   %13
   dod si16 la si8 dod\mbreak
   re[mi fad mi]
   re dod si4\tr 
   
   %16
   la <<{dod16 dod dod dod
        re8[dod si dod]}\\{mi,16 mi mi mi
                           mi4}>>
   re'8[re re re]
   
   %19
   re mi dod4\tr 
   si8.[dod16 dod8 dod]
   dod si16 la si8 dod
   
   %22
   re[ mi fad mi]
   re dod si4\tr\mbreak
   la mi8 la
   
   %25
   dod, re16 mi fad8 fad 
   si, dod16 re mi8 mi
   \once\stemUp la, la'' r la
   
   %28
   r la r sold 
   <<{<la dod,> [<la dod,> <la dod,> <la dod,>]}\\{mi, [mi mi mi]}>>
   <la' dod, mi, la,>4 la,16 dod mi la
   
   %31
   mi la, mi' la, mi' la, mi' la,
   fad' la, mi' la, mi' la, la' la,
   mi' la, fad' la, mi' la, re la\mbreak
   
   %34
   dod la dod mi la la, la la  
   mi' la, mi' la, mi' la, mi' la,
   fad' la, mi' la, mi' la, la' la,
   
   %37
   mi' la, fad' la, mi' la, re la
   dod mi, dod' mi, si' mi, dod' mi,
   re' mi, dod' mi, si' mi, dod' mi,
   
   %40
   re' dod re si' re, dod re si'
   re, dod re mi dod si dod la'\mbreak
   si,4 <<{\stemDown dod'16 dod dod dod
         
         %43
         dod8[la]}\\\stemDown {la,16 la la la
   la4}>> si'16 la si dod
   re8 dod16dod re re dod dod
   si si mi, la sold sold sold sold
   
   %46
   la4 la16 la la la 
   la8 [sold fad mi]
   red16 si si si si' si, si si
   
   %49
   la' si, si si sold' si, si si
   fad' si, si si si' si, si si\mbreak
   la' si, si si sold' si, si si
   
   %52
   fad'8\tr[si, mi la]
   la16 sold fad mi sold8 fad\tr 
   mi4 la,8 la
   
   %55
   mi'[mi mi mi]
   fad\tr[mi mi la]
   mi[fad mi re]
   
   %58
   dod4 la8 la
   mi'[mi mi mi]
   fad\tr[mi mi la]
   
   %61
   mi[fad mi re]\mbreak
   dod\tr [dod si dod]
   re [dod si dod]
   re[re re mi]
   
   %65
   re mi dod4\tr 
   si dod8 dod
   dod si16 la si8 dod
   
   %68
   re[mi fad mi]
   re dod si4\tr 
   la r16 mi' re mi 
   
   %71
   fad fad(mi fad) sold sold(fad sold)
   la la(sold la) si si(la si)\mbreak
   dod dod(si dod) re re(dod re)
   
   %74
   \once \override Score.RehearsalMark.extra-offset = #'(-20 . +2)
   mi4\fermata_\markup {\musicglyph "scripts.dfermata" } dod,8\p \mark\markup\huge {"[4.] Bon Joseph écoutez moi"} dod8
   la la mi' mi
   dod8.\tr re16 mi8 la,
   
   %77
   re dod si4\tr 
   la dod8\< dod
   la la mi' mi
   
   %80
   dod8.\tr [re16 mi8 la,]
   re8 dod si4\tr
   la la'8 la
   
   %83
   sold sold\mbreak fad fad
   mi4\! mi8 fad
   mi re16 dod re8 mi
   
   %86
   dod\tr dod16 re mi8 mi
   mi dod16 re mi8 mi
   mi dod16 re mi8 dod16 re
   
   %89
   mi8 mi fad4\tr 
   mi4 la,8. si16
   dod8 re si4\tr 
   
   %92
   la dod16 re dod si
   la si dod re\mbreak mi fad mi re
   dod si dod re mi la, si dod
   
   %95
   re dod si re dod8 si\tr 
   la8 mi la, \once\stemDown mi''
   dod'[dod si si]
   
   %98
   la la4 la8
   la la4 sold8
   la4 la,16 si dod la
   
   %101
   mi 'fad sold mi la8 la
   sold\tr la4 la8\mbreak
   la la4 sold8
   
   %104
   la4 mi8 fad
   mi  re16 dod re8 mi
   dod16 re dod re mi re mi re
   
   %107
   dod re dod re mi re mi re
   dod8 la'16 si dod8 dod
   dod mi, fad4\tr 
   
   %110
   mi la,16 si la si
   dod8 re si4\tr 
   la dod'16 mi, dod' mi,\mbreak
   
   %113
   la mi la mi mi' mi, mi' mi,
   dod' re dod re mi8 la,
   re dod si4\tr 
   
   %116
   la4 dod16 mi, dod' mi,
   la mi la mi mi' mi, mi' mi,
   dod' re dod re mi8 la,
   
   %119
   re dod si4\tr 
   la4  la,16 la la la
   sold la la la fad la la la
   
   %122
   mi la la la\mbreak mi la fad la
   mi la re, la' dod, la' si, sold'
   la,8 la'16 si dod8 dod
   
   %125
   dod la'16 si dod8 dod
   dod dod16 re mi8 mi
   mi mi, fad4\tr 
   
   %128
   mi la8. si16
   dod8  re si4\tr 
   la4 r8 mi,
   
   %131
   la16 la la la\mbreak dod dod dod dod
   mi mi mi mi la la la la
   dod dod dod dod mi mi mi mi
   
   %134
   <<\stemDown \tweak Stem.length #10 la4\\la,,>>
   
}

IIIvlIIn = \relative do'' {
   
   r4
   dod8[dod dod dod]
   re[dod dod dod]
   dod[re dod si]
   
   %4
   la4 r
   dod8[dod dod dod]
   re[dod dod dod]
   
   %7
   dod[re dod si]
   la[dod la dod]
   re[dod si dod]
   
   %10
   re[re re re]
   re mi dod4
   si dod8 dod\mbreak
   
   %13
   dod si16 la si8 dod\mbreak
   re[mi fad mi]
   re dod si4 
   
   %16
   la4 la16 la la la
   mi8[mi mi mi]
   la la mi mi
   
   %19
   si' [si mi, la]
   sold[la la la]
   la sold16 fad sold8 la
   
   %22
   la[la la la]\mbreak
   sold la sold4
   la mi8 la
   
   %25
   dod, re16 mi fad8 fad 
   si, dod16 re mi8 mi
   la,4 dod'8 r
   
   %28
   si r si r
   la[la la la]
   la4 r
   
   %31
   dod8[dod dod dod]
   re[dod dod dod]
   dod[re dod si]\mbreak
   
   %34
   la[la' mi dod]
   la[dod dod dod]
   re[dod dod dod]
   
   %37
   dod[re dod si]
   la[la' sold la]
   si[la sold la]
   
   %40
   si r mi, r
   mi4 mi8 la
   sold4 la16 la la la
   
   %43
   la8 fad re16 dod re mi
   fad8[ mi fad mi]\mbreak
   re dod si4
   
   %46
   la dod16 dod dod dod
   si si si si dod dod dod dod
   fad,8 r sold' r
   
   %49
   fad r mi r
   red r sold r
   fad r mi r
   
   %52
   red16 si si si si si si si
   si8 mi4 red8
   mi4 r\mbreak
   
   %55
   dod8[dod dod dod]
   re[dod dod dod]
   dod[re dod si]
   
   %58
   la4 r
   dod8[dod dod dod]
   re[dod dod dod]
   
   %61
   dod[re dod si]
   la[dod si dod]
   re[dod si dod]
   
   %64
   re[re re re]
   re mi dod4\mbreak
   si4 dod8 dod
   
   %67
   dod si16 la si8 dod
   re[mi fad mi]
   re dod si4
   
   %70
   la r  
   r4 r16 mi' re mi 
   fad fad(mi fad) sold sold(fad sold)
   
   %73
   la la(sold la) si si(la si)
   dod4\fermata r8 la,\p\mbreak
   dod[mi la mi]
   
   %76
   mi mi, r la'
   sold la sold4
   la r8 la,\<
   
   %79
   dod[mi la mi]
   mi mi, r la
   sold la4 sold8
   
   %82
   la4 dod8 dod
   si mi4 red8
   mi4\! dod8 re?
   
   %85
   dod si16 la si8 si\mbreak
   si la16 si dod8 dod
   si la16 si dod8 dod
   
   %88
   dod la16 si dod8 la16 si
   dod8 dod re4
   dod dod,8 dod
   
   %91
   dod fad16 fad mi mi re re
   dod4 r
   la8[la' sold mi]
   
   %94
   la4 dod,
   si mi\mbreak
   la,4 dod'16 re dod si
   
   %97
   la si dod re  mi fad mi re
   dod si dod re mi la, si dod
   re dod si re dod8 si
   
   %100
   la4 r 
   R2
   r4 re,16 mi fad re
   
   %103
   la' si dod la re8 re
   dod4 dod8 re\mbreak
   dod si16 la si8 si
   
   %106
   la16 si la si dod si dod si
   la16 si la si dod si dod si
   la8 dod16 re mi8 mi
   
   %109
   mi16 mi mi  mi red red red red
   mi4 dod16 re! dod re
   mi8 fad sold fad16 sold\mbreak
   
   %112
   la4 mi8 mi
   dod la dod' dod
   la16 si la si dod8 dod
   
   %115
   si la sold4
   la mi8 mi
   dod la dod' dod
   
   %118
   la16 si la si dod8 dod
   si la sold4\mbreak
   la la,8 la
   
   %121
   sold r fad r
   mi r mi8 fad
   mi[re dod si]
   
   %124
   \once\stemUp la dod'16 re mi8 mi
   re dod16 re mi8 mi
   mi la16 si dod8 dod
   
   %127
   dod mi, red4\mbreak
   mi mi8 la16 sold
   la8 si sold4\tr 
   
   %130
   la r8 mi
   <<{mi16 mi mi mi mi mi mi mi}\\{dod dod dod dod dod dod dod dod}>>
   <<{mi16 mi mi mi mi mi mi mi}\\{dod dod dod dod dod dod dod dod}>>
   
   %133
   <<{mi16 mi mi mi mi mi mi mi}\\{dod dod dod dod dod dod dod dod}>>
   <<mi4\\dod>>
 
}

IIIvlan = \relative do' {
   
   r4
   la'8[la la la]
   la[la la mi]
   la[la la sold]
   
   %4
   la sold16 fad mi re dod si
   la8[la' la la]
   la[la la mi]
   la[la la sold]
   
   %8
   la4 r
   la8[la  la la]
   sold[la si la]
   
   %11
   sold16 la si sold la8 la
   sold4 mi8 mi
   mi4 mi8 mi\mbreak
   
   %14
   la[la la la]
   sold la sold4
   la r
   
   %17
   la8[la mi la]
   la[fad re re]
   re8.[re16 re8 re]
   
   %20
   re8.[re16 re8 re]
   fad4 mi8 mi
   fad[dod re mi]
   
   %23
   mi mi mi4
   mi mi8 la
   dod, re16 mi fad8 fad 
   
   %26
   si, dod16 re mi8 mi
   la,4 fad'8 r
   fad r mi r
   
   %29
   <<{mi[mi mi mi]
      mi4}\\{la,8[la la la]
             la4}>> r
   R2*15
   
   %46
   r4 la'8 mi
   fad[mi fad fad]
   fad4 r
   
   %49
   si r
   si r
   red,8 r mi r
   
   %52
   la, [fad' sold fad]
   fad[si si si]
   si4 r
   
   %55
   la8[la la la]
   la[la la mi]
   la[la la sold]
   
   %58
   la sold16 fad mi re dod si
   la8[la' la la]
   la[la la mi]
   la[la la sold]
   
   %62
   la4 r
   la8[la  la la]
   sold[la si la]
   
   %65
   sold16 la si sold la8 la
   sold4 mi8 mi
   mi4 mi8 mi\mbreak
   
   %68
   la[la la la]
   sold la sold4
   la r
   
   %71
   R2*3
   r4\fermata r
   r8 dod,\p dod si
   
   %76
   la4 r8 mi'
   mi[mi mi re]\mbreak
   dod4 r 
   
   %79
   r8 dod\< dod si
   dod4 r8 mi
   mi[mi mi re]
   
   %82
   dod4 mi8 mi
   mi4 si8 si
   si4\! r8 la'
   
   %85
   la4 mi
   mi r8 la
   la la, r la'
   
   %88
   la r la r
   la[la la la]
   la4 r 
   
   %91
   la r8 sold
   la4 r
   R2*4\mbreak
   
   %97
   la,8[la' sold mi]
   la4 dod,
   si mi
   
   %100
   la, mi'8 mi
   mi mi4 red8
   mi[dod fad fad]
   
   %103
   mi[mi fad re?]
   mi4 la8 la
   la4 fad8 mi
   
   %106
   mi4 r8 mi
   mi4 r8 mi
   mi4 la8 la
   
   %109
   la[si si si]
   sold4 la8 la
   la[fad mi re]\mbreak
   
   %112
   dod4 r
   R2*7
   r4 la'8 la
   
   %121
   sold r fad r
   mi4 mi8 fad
   mi[re dod si]
   
   %124
   la4 r
   la' r
   la r
   
   %127
   la8[si si si]
   sold4 r8 mi
   mi r mi r
   
   %130
   mi4 r
   la16 la la la la la la la
   la16 la la la la la la la
   
   %133
   la16 la la la la la la la
   la4

}

IIIbcn = \relative do {
   
   r4
   la8 [la' la la]
   la[la la la]
   la[re mi mi,]
   
   %4
   la sold16 fad mi re dod si 
   la8 [la' la la]
   la[la la la]
   
   %7
   la[re, mi mi,]
   la4 r 
   re'8[dod si la]
   
   %10
   sold [fad mi re]\mbreak
   mi16 fad sold mi la8 la,
   mi'4 la8 la
   
   %13
   mi'4 mi8 la,
   fad'[mi re dod]
   si la mi' mi,
   
   %16
   la4 r
   la sol
   fad si
   
   %19
   sold la
   mi8[la la la]
   re,4. dod8\mbreak
   
   %22
   fad[mi re dod]
   si la mi' mi,
   la4 mi'8 la
   
   %25
   dod, re16 mi fad8 fad
   si, dod16 re mi8 mi
   la, r fad' r
   
   %28
   re r mi r
   la,[la' la la] 
   la,4 r\mbreak
   
   %31
   la2~
   la2~
   la2~
   
   %34
   la2~
   la2~
   la2~
   
   %37
   la2
   la4 r
   R2
   
   %40
   sold8[sold sold sold]
   sold4 la
   mi la'16  la la la
   
   %43
   la8 re, sol4\mbreak
   fad8 la re, la'
   sold la mi' mi,
   
   %46
   la4 la8 dod
   red, mi lad, lad
   si4 r
   
   %49
   si4 r
   si4 r
   si4 r
   
   %52
   si8 si'16 la sold8 red
   mi4 si\mbreak
   mi16 fad mi re dod re dod si 
   
   %55
   la8[la' la la]
   la[la la la]
   la re, mi mi,
   
   %58
   la4 r
   la8[la' la la]
   la[la la la]
   
   %61
   la re, mi mi,\mbreak
   la4 r
   fad''8[mi re dod]
   
   %64
   si[la sold fad]
   mi16 fad sold mi la8 la,
   mi'4 la8 la
   
   %67
   la4 sol
   fad8[mi re dod]
   si la mi' mi,
   
   %70
   la4 r
   R2*2\mbreak
   la'4 re,
   
   %74
   la\fermata r
   r8 la'\p dod8 sold
   la la16 dod dod8 dod
   
   %77
   si la mi' mi,
   la4 r
   r8 la,\< dod sold
   
   %80
   la la16 si dod8 dod
   si la mi' mi,\mbreak
   la4 la16 si dod re
   
   %83
   mi fad sold la si8 si,
   mi4\! la8 la
   la4 sold
   
   %86
   la8 la, r la'
   la la, r la'
   la4 la8 la
   
   %89
   la la re re,\mbreak
   la'4 fad8 fad16 sold
   la8 re, mi mi,
   
   %92
   la4 r
   R2*7
   r4 la'8 la
   
   %101
   sold[sold fad fad]
   mi la re, re
   dod dod si si
   
   %104
   la4 r\mbreak
   la8 la' la sold
   la4 r8 la
   
   %107
   la4 r8 la
   la la, la' la
   la sold16 mi si'8 si,
   
   %110
   mi4 r
   la8 re, mi mi,
   la4 r\mbreak
   
   %113
   la2~
   la2~
   la2~
   
   %116
   la2~
   la2~
   la2~
   
   %119
   la2
   la4 la'8 la
   sold r fad r
   
   %122
   mi[re dod re]\mbreak
   dod[re mi mi,]
   la4 r8 la'
   
   %125
   la,4 r8 la'
   la,4 r8 la'
   la sold16 mi si'8 si,
   
   %128
   dod8[dod' dod si]
   la re, mi mi,
   la4 r\mbreak
   
   %131
   la16 la la la la la la la
   la16 la la la la la la la
   la16 la la la la la la la
   
   %134
   la4
   
}


IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s4
   s2
   <6 4>4 <3>
   s8 <6 5> s4
   s2
   s
   <6 4>4 <3>
   s8 <6 5> s4
   s2
   s
   <7>
   <7>
   s2*3
   <6\\>2
   s
   s4 <4 2>
   <6>2
   <5/>
   s
   <7>8 <4 2> s <6>
   <5>2
   <6\\>
   s
   <6>
   4 <7>
   <7> <7>
   s2
   <6 5>
   s2*11
   <5/>2
   s
   s
   s4 <4 2>
   <6>2
   <5/>
   s
   <5/>4 <5/>
   <_+>2
   <7 _+>
   s2
   s
   <_+>4 <6>8 <5/>
   s4 <_+>
   s <6>
   s2
   <6 4>4 <3>
   s8 <6 5> <6 4> <7>
   s2
   s
   <6 4>4 <3>
   s8 <6 5> <6 4> <3>
   s2
   s
   <7>
   <7>
   s
   s4 <4 2>
   <5>2
   <6>
   s2*13
   s4 <_+>
   s2
   <5 2>4 <5/>
   s2*4
   s4 <6>
   s8 <6 5> s4
   s2*9
   <6>4 <7>8 <6\\>
   s2
   <6>4 <7>8 <6\\>
   s2
   s4 s8  <5/>
   s2*3
   s8 <6> <_+>4
   s2
   s8 <6 5> s4
   s2*9
   <6>4 <6>
   s <6>8 <6 5>
   <6> <6 5> s4
   s2*3
   s8 <6> <_+> <7>
   <5>4 <6>
   s8 <6 5 > s4
   
}


forma = {

   \key la\major
   \time 2/4
   \tempo 2 =45
   \partial 4 s4
   s2*73
   s4 \bar "||"\break
   s
   s2*59
   s4
   \bar "|."

}

IIIvlI = {
   \IIIglobal
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


IIIbc = {
   \IIIglobal
   \clef bass
   << \IIIbcn \forma \IIIbfn>>

   }


%{
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.16.0, 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11,
2.17.14, 2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27,
2.17.29, 2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

   systems-per-page = #4
   print-first-page-number = ##t
   first-page-number = #2

}

\header {
        title = \markup\smaller\center-column {"Symphonie de Noëls n. VI"}
        composer = \markup \center-column{"M. Corrette (1707 - 1795"}
        
    }

\markup \huge {[1.] Allegro}

\score {

   \new ChoirStaff <<

      \new Staff
      <<
         \set Staff.midiInstrument = "violin"
         \set Staff.instrumentName = \markup  \center-column{"Violino""Primo"}
         \set Staff.shortInstrumentName = "vl1"
         \IvlI
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = "violin"
         \set Staff.instrumentName = \markup  \center-column{"Violino""Secondo"}
         \set Staff.shortInstrumentName = "vl2"
         \IvlII
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = "viola"
         \set Staff.instrumentName = \markup  \center-column{"Alto"}
         \set Staff.shortInstrumentName = "vla"
         \Ivla
      >>


      \new Staff
      <<
         \set Staff.midiInstrument = "cello"
         \set Staff.instrumentName = \markup  \center-column{"Organo"}
         \set Staff.shortInstrumentName = "bc"
         \Ibc
      >>
   >>

   \layout {

      indent = 1.8\cm

      \context	{
         \Score
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
         \remove Dynamic_performer
      }
   }

}

\pageBreak

\markup \huge {[2.] Amoroso - Quoy ma voisine est tu fâché(e) }

\score {

   \new ChoirStaff <<

      \new Staff
      <<
         \set Staff.midiInstrument = "violin"
         \set Staff.instrumentName = \markup  \center-column{"Violino""Primo"}
         \set Staff.shortInstrumentName = "vl1"
         \IIvlI
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = "violin"
         \set Staff.instrumentName = \markup  \center-column{"Violino""Secondo"}
         \set Staff.shortInstrumentName = "vl2"
         \IIvlII
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = "viola"
         \set Staff.instrumentName = \markup  \center-column{"Alto"}
         \set Staff.shortInstrumentName = "vla"
         \IIvla
      >>


      \new Staff
      <<
         \set Staff.midiInstrument = "cello"
         \set Staff.instrumentName = \markup  \center-column{"Organo"}
         \set Staff.shortInstrumentName = "bc"
         \IIbc
      >>
   >>

   \layout {

      indent = 1.8\cm

      \context	{
         \Score
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
         \remove Dynamic_performer
      }
   }

}

\pageBreak

\markup \huge {[3.] Allegro - Quoy ma voisine est tu fâché(e) }

\score {

   \new ChoirStaff <<

      \new Staff
      <<
         \set Staff.midiInstrument = "violin"
         \set Staff.instrumentName = \markup  \center-column{"Violino""Primo"}
         \set Staff.shortInstrumentName = "vl1"
         \IIIvlI
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = "violin"
         \set Staff.instrumentName = \markup  \center-column{"Violino""Secondo"}
         \set Staff.shortInstrumentName = "vl2"
         \IIIvlII
      >>

      \new Staff
      <<
         \set Staff.midiInstrument = "viola"
         \set Staff.instrumentName = \markup  \center-column{"Alto"}
         \set Staff.shortInstrumentName = "vla"
         \IIIvla
      >>


      \new Staff
      <<
         \set Staff.midiInstrument = "cello"
         \set Staff.instrumentName = \markup  \center-column{"Organo"}
         \set Staff.shortInstrumentName = "bc"
         \IIIbc
      >>
   >>

   \layout {

      indent = 1.8\cm

      \context	{
         \Score
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
         \remove Dynamic_performer
      }
   }

}
