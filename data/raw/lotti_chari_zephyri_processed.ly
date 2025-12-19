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

dolce = _\markup \italic { dolce }

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
      \musicglyph "scripts.prall"}}
mbreak = { }



IobIn = \relative do'' {

    la'8. si16 sold8 la8. si16 sold8 la8. si16 sold8 la8. si16 sold8
    la4 mi8 dod8. si16 la8 fad'8. sold?16 mi8 re8. mi16 dod8
    si2. mi8. fad16 red8 mi4.~

    %4
    mi8. fad16 red8 mi4.~mi8. fad16 red8 mi8. fad16 re8
    dod4.~ dod8. si16 la8 la'8. si16 sold8  la8. si16 sold8\mbreak
    la4 si,8 dod8. la'16 sold8 la4 si,8 dod8. la'16 sold8

    %7
    la8. sold16 fad8 mi4.~mi4 fad8 si,4.
    la8. si16 sold8 la8. si16 sold8 la2.
    dod8.\solo re16 dod8 dod4 re8 dod8. re16 si8 la8. si16 sold8

    %10
    dod8. re16 si8 dod4 re8 dod8. re16 si8 la8. si16 sold8\mbreak
    dod8. re16 si8 dod4 re8 dod8. re16 si8 la4.
    la4 si8 sold4. la2.

    %13
    la'8.\tu si16 sold8 la8. si16 sold8  la4 si,8 dod8. la'16 sold8
    la4 si,8 dod8. la'16 sold8 la4. la,
    dod8.\solo re16 si8 dod4 re8 dod8. re16 si8 la8. si16 sold8\mbreak

    %16
    dod8. re16 si8 dod4 re8 dod8. re16 si8 la8. si16 sold8
    dod8. re16 si8 dod4 re8 dod8. re16 si8 la4.
    la4 si8 sold4. la2.

    %19
    R1.*7
    r8 la\solo sold la4. r8 la sold la4.
    r8 sold fad sold4. r8 si la si4.

    %28
    R1.*5
    la'8.\tu si16 sold8 la8. si16 sold8 la8. si16 sold8 la8. si16 sold8
    la4 mi8 dod8. si16 la8 fad'8. sold?16 mi8 re8. mi16 dod8

    %35
    si2. mi8. fad16 red8 mi4.~
    mi8. fad16 red8 mi4.~mi8. fad16 red8 mi8. fad16 re8
    dod4.~ dod8. si16 la8 la'8. si16 sold8  la8. si16 sold8\mbreak

    %38
    la4 si,8 dod8. la'16 sold8 la4 si,8 dod8. la'16 sold8
    la8. sold16 fad8 mi4.~mi4 fad8 si,4.
    la8. si16 sold8 la8. si16 sold8 la2.

    %41
    R1.*14

}

IobIIn = \relative do'' {

    dod4 re8 mi4 re8 dod4 re8 mi4 re8
    dod4. r8 r dod re8. mi16 dod8 si8. dod16 la8
    sold2. sold4. r8 r la

    %4
    si4. r8 r la sold4. r8 r sold
    la4. r4 r8 dod4 re8 mi4 re8\mbreak
    dod4 sold8 la4 re8 dod4 sold8 la4 re8

    %7
    dod4 re8 dod4 si8 la4 la8 la4 sold8
    la4. r8 r si, la2.
    R1.*4

    %13
    dod'4 re8 mi4 re8 dod4 sold8 la4 re8
    dod4 sold8 la4 re8 dod4. dod
    R1.*5

    %20
    R1.*13
    dod4 re8 mi4 re8 dod4 re8 mi4 re8
    dod4. r8 r dod re8. mi16 dod8 si8. dod16 la8

    %35
    sold2. sold4. r8 r la
    si4. r8 r la sold4. r8 r sold
    la4. r4 r8 dod4 re8 mi4 re8\mbreak

    %38
    dod4 sold8 la4 re8 dod4 sold8 la4 re8
    dod4 re8 dod4 si8 la4 la8 la4 sold8
    la4. r8 r si, dod2.

    %41
    R1.*14

}


IvlIn = \relative do'' {

    la'8. si16 sold8 la8. si16 sold8 la8. si16 sold8 la8. si16 sold8
    la4 mi8 dod8. si16 la8 fad'8. sold?16 mi8 re8. mi16 dod8
    si2. mi8. fad16 red8 mi4.~

    %4
    mi8. fad16 red8 mi4.~mi8. fad16 red8 mi8. fad16 re8
    dod4.~ dod8. si16 la8 la'8. si16 sold8  la8. si16 sold8\mbreak
    la4 si,8 dod8. la'16 sold8 la4 si,8 dod8. la'16 sold8

    %7
    la8. sold16 fad8 mi4.~mi4 fad8 si,4.
    la8. si16 sold8 la8. si16 sold8 la2.
    R1.*4

    %13
    la'8. si16 sold8 la8. si16 sold8  la4 si,8 dod8. la'16 sold8
    la4 si,8 dod8. la'16 sold8 la4. la,
    R1.*5

    %20
    r8 r sold\soli la4. r8 r si la4.\mbreak
    sold4. r8 r fad sold8. fad16 mi8 mi4 red8
    mi2. r

    %23
    R1.*10
    la'8. si16 sold8 la8. si16 sold8 la8. si16 sold8 la8. si16 sold8
    la4 mi8 dod8. si16 la8 fad'8. sold?16 mi8 re8. mi16 dod8

    %35
    si2. mi8. fad16 red8 mi4.~
    mi8. fad16 red8 mi4.~mi8. fad16 red8 mi8. fad16 re8
    dod4.~ dod8. si16 la8 la'8. si16 sold8  la8. si16 sold8\mbreak

    %38
    la4 si,8 dod8. la'16 sold8 la4 si,8 dod8. la'16 sold8
    la8. sold16 fad8 mi4.~mi4 fad8 si,4.
    la8. si16 sold8 la8. si16 sold8 la2.

    %41
    R1.*14

}

IvlIIn = \relative do'' {

    dod4 re8 mi4 re8 dod4 re8 mi4 re8
    dod4. r8 r dod re8. mi16 dod8 si8. dod16 la8
    sold2. sold4. r8 r la

    %4
    si4. r8 r la sold4. r8 r sold
    la4. r4 r8 dod4 re8 mi4 re8\mbreak
    dod4 sold8 la4 re8 dod4 sold8 la4 re8

    %7
    dod4 re8 dod4 si8 la4 la8 la4 sold8
    la4. r8 r si, la2.
    R1.*4

    %13
    dod'4 re8 mi4 re8 dod4 sold8 la4 re8
    dod4 sold8 la4 re8 dod4. dod
    R1.*5

    %20
    r8 r mi, fad4. r8 r sold fad4.\mbreak
    mi4. r8 r red mi4 la,8 si4.
    mi2. r

    %23
    R1.*10
    dod'4 re8 mi4 re8 dod4 re8 mi4 re8
    dod4. r8 r dod re8. mi16 dod8 si8. dod16 la8

    %35
    sold2. sold4. r8 r la
    si4. r8 r la sold4. r8 r sold
    la4. r4 r8 dod4 re8 mi4 re8\mbreak

    %38
    dod4 sold8 la4 re8 dod4 sold8 la4 re8
    dod4 re8 dod4 si8 la4 la8 la4 sold8
    la4. r8 r si, dod2.

    %41
    R1.*14

}

Ivlan = \relative do' {

    mi4 si'8 la4 si8 mi,4 si'8 la4 si8
    mi,4. r8 r la la4. r8 r mi
    mi2. mi4. r8 r fad

    %4
    sold?4. r8 r fad mi4. r8 r mi
    la,4. r4 r8 mi'4 si'8 la4 si8\mbreak
    mi,4. r8 r si' mi,4. r8 r si'

    %7
    mi,4.~mi4 re8 dod4 la8 mi'4.
    mi r4 r8 mi2.
    R1.*4

    %13
    mi4 si'8 la4 si8 mi,4. r8 r si'
    mi,4. r8 r si' mi,4. mi
    R1.*18

    %33
    mi4 si'8 la4 si8 mi,4 si'8 la4 si8
    mi,4. r8 r la la4. r8 r mi
    mi2. mi4. r8 r fad

    %36
    sold!4. r8 r fad mi4. r8 r mi
    la,4. r4 r8 mi'4 si'8 la4 si8
    mi,4. r8 r si' mi,4. r8 r si'

    %39
    mi,4.~mi4 re8 dod4 la8 mi'4.
    mi r4 r8 mi2.
    R1.*14

}

Isopranon = \relative do'' {

    \autoBeamOff
    R1.*8
    la8. [si16 sold8] la4 (fad'8) mi8. fad16[(re8)] dod8.[re16 si8]
    la8. [si16 sold8] la4 fad'8 mi8. [fad16 re8] dod8.[re16 si8]\mbreak

    %11
    la8. [si16 sold8] la4 (fad'8) mi8. fad16[re8] dod4.~
    dod4 re8 si4. la2.
    R1.*2

    %15
    la8. [si16 sold8] la4 (fad'8) mi8. fad16[(re8)] dod8.[re16 si8]\mbreak
    la8. [si16 sold8] la4 fad'8 mi8. [fad16 re8] dod8.[re16 si8]
    la8. [si16 sold8] la4 (fad'8) mi8. fad16[(re8)] dod4.~

    %18
    dod4 re8 si4. la2.
    dod8.[si16 la8] mi'8.[re16 dod8]si4 si8 dod4 red8
    mi4. mi8.[fad16 red8] mi4.~mi8.[fad16 red8]\mbreak

    %21
    mi8.[red16 dod8] si4.~si8.[la16 sold8] sold4 fad8
    mi2. mi'8.[fad16 re?8] mi8.[re16 mi8]
    fad4 mi8 fad4. re8.[mi16 re8] re8. dod16[si8]

    %24
    mi4(re8) mi4. dod8. [si16 la8] re8. [dod16 si8]
    mi8.[re16 dod8] fad8.[mi16 re8] mi8.[re16 dod8] re8.[dod16 si8]\mbreak
    la4.~la8[dod si] dod4. r8 re [dod]

    %27
    si4. r8 re[dod] re4. r8 mi[re]
    dod8.[re16 dod8] dod8.[si16 la8] re8.[mi16 re8] re8.[dod16 si8]
    mi4.~mi8.[fad16 re8] dod8.[re16 si8] la8.[dod16 si8]

    %30
    dod4 re8 si4. la2.\mbreak
    fad'4(mi8) re4(fad8) mi4 re8 mi4.~
    mi4 re8 si4. la2.

    %33
    R1.*8
    dod8. [si16 la8] mi'8.[ re16 dod8] dod4. si
    dod8. [si16 la8] sold4(la8) si4. mi,
    dod'8. [si16 la8] mi'8. [re16 dod8] dod4. si
    la8. [si16 la8] la8. [si16 la8] si8. [dod16 si8] si4.
    dod8. [re16 dod8] red8. [mi16 red8]\mbreak mi4.~mi8. [fad16 red8]
    mi8. [red16 dod8] si8. [dod16 la8] sold4.~sold8. [mi'16 red8]
    mi8. [red16 dod8] si8. [dod16 la8] sold4. fad
    mi2. si'4. si
    sold'?4(mi8) fad4 (mi8) re?4. dod
    si~si8. [dod16 lad8]\mbreak si8. [re16 dod8] re8. [mi16 re8]
    dod4.~dod8. [re16 si8] dod8. [mi16 re8] mi8. [fad16 mi8]
    re8. [mi16 re8] re8. [dod16 si8] mi8. [fad16 mi8] mi8. [re16 dod8]
    fad4 lad,8 si4.~si4 sol'?8 fad [sol mi]
    re4. dod si2

}

Itesto = \lyricmode {

    Ca -- ri Ze -- phÿ -- ri fon -- tes a -- mo -- ris pla -- ci -- dis -- si -- mi spi -- ra -- te.

    Ca -- ri Ze -- phÿ -- ri fon -- tes a -- mo -- ris pla -- ci -- dis -- si -- mi spi -- ra -- te,

    pla -- ci -- dis -- si -- mi spi -- ra - - - - - - te,

    ca -- ri Ze -- phÿ -- ri fon -- tes a -- mo -- ris pla -- ci -- dis -- si -- mi

    spi -- ra - - - - - - - - - - - - - - - - te, pla -- ci -- dis -- si -- mi spi -- ra -- te.

    Præ -- pa -- ra -- te nim -- bam -- ro -- ris et ar -- do -- ris dul -- ces flam -- mas

    tem -- pe -- ra - - - - - - - - - - - - - - - - te.

}

Ibcn = \relative do {

    la4 si8 dod4 si8 la4 si8 dod4 si8
    la4. r8 r la re4. r8 r la'
    mi2. r

    %4
    R1.
    r2. la,4 si8 dod4 si8 \mbreak
    la4. r8 r si la4. r8 r si

    %7
    la4.~la4 si8 dod4 re8 mi4 mi,8
    la1.
    la4. r4 r8 la4. r4 r8

    %10
    la4. r4 r8 la4. r4 r8\mbreak
    la4. r4 r8 la4. r8 r sold
    la4 re8 mi4 mi,8 la2.

    %13
    la4 si8 dod4 si8 la4. r8 r si
    la4. r8 r si la2.
    la4. r4 r8 la4. r4 r8\mbreak

    %16
    la4. r4 r8 la4. r4 r8
    la4. r4 r8 la4. r8 r sold
    la4 re8 mi4 mi,8 la2.

    %19
    la4. r8 r la' sold4. la4 fad8
    mi4. r4 r8 r2.\mbreak
    R1.

    %22
    r2. dod4. r8 r dod
    re4. r8 r re si4. r8 r si
    dod4. r8 r dod la4. si

    %25
    dod re la mi'\mbreak
    la, r4 r8 la4. r4 r8
    mi'4. r4 r8 mi4. r4 r8

    %28
    la,4. r8 r la si4. r8 r si
    dod4. si la r8 r sold
    la4 re8 mi4 mi,8 la2.\mbreak

    %31
    re4. r8 r re dod4 si8 la4.
    re mi la,2.
    la4 si8 dod4 si8 la4 si8 dod4 si8

    %34
    la4. r8 r la re4. r8 r la'
    mi2. r
    R1.

    %37
    r2. la,4 si8 dod4 si8 \mbreak
    la4. r8 r si la4. r8 r si
    la4.~la4 si8 dod4 re8 mi4 mi,8

    %40
    la4. r4 r8 la2.
    la'4. r8 r la mi4. r8 r mi
    la4. mi4 fad8 mi4. r8 r mi

    %43
    la4. r8 r la mi4. r8 r re
    dod4. r8 r dod re4. mi
    la fad \mbreak mi fad

    %46
    sold r8 r fad mi4. r8 r fad
    sold4. r8 r fad mi4. si
    mi2. re4. re

    %49
    mi re4 mi8 fad4. fad,
    si r4 r8\mbreak si4. r4 r8
    fad'4. r4 r8 si,4. r4 r8

    %52
    si4. r4 r8 dod4. r4 r8
    re4. r8 r mi re4. r8 r mi
    fad4. fad, si2.

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 12/8
    \key re\major
    \tempo 2. = 50
    s1.*54
    \bar "||"
    \mark\markup\center-column\smaller {"Da""Capo"}

}

IobI = {
    <<\IobIn \forma>>

}

IobII = {
    <<\IobIIn \forma>>

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Ivla = {
    \clef alto
    <<\Ivlan \forma>>

}

Isoprano = {
    \new Voice = "zephyri"
    <<\Isopranon \forma>>

}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}




IIsopranon = \relative do'' {

    \autoBeamOff
    
    r4 dod8 dod8 dod4 dod8 si
    dod8 dod r dod dod dod8. dod16 fad8
    lad,4 lad lad8 lad lad lad16 si
    
    %4
    dod4 dod mi re8 dod\mbreak
    re4. re8 red red16 red16 mi8 fad
    si,4 si dod dod8 dod
    
    %7
    red4. mi8 si4 si
    r2 la8 la la si16 sold
    la8 la r4\mbreak dod8 dod16 dod mi8 dod16 si
    
    %10
    lad4 lad lad8  si16 dod lad8 fad
    si8 si r4 fad' re8 dod16[si]
    la2 sold
    
    %13
    fad r 

}

IItesto = \lyricmode {
   
   In -- ter i -- gnes cæ -- les -- tes a -- ma -- bi -- lis jam sem -- per 
   
   ar -- det no -- va pi -- rau -- sta a -- ni -- ma me -- a, cu -- ius in --  
   
   vic -- tus a -- mor quæ -- rit be -- a -- tas pal -- mas, 
   
   Ip -- sa ve -- ro non hor -- ret squal -- li -- da mun -- di tor --  men -- ta 
   
   sed in --  con -- cus -- sa ma -- net a -- mat con -- ten - ta.

}
IIbcn = \relative do {
   
   fad1~
   fad
   mi~
   
   %4
   mi
   si2 la
   sold la~
   
   %7
   la si
   mi dod~
   dod~dod
   
   %10
   mi1
   re2 si
   dod1
   
   %13
   fad2 r
   
}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key re\major
    \tempo 4 = 65
    s1*13
    \bar "|."

}

IIsoprano = {
    \new Voice = "ignes"
    <<\IIsopranon \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}




IIIvlIn = \relative do'' {
   
   R2.
   r4 dod fad
   re4. mi8 fad4
   sol8 fad sol2
   fad4 fad re
   sol4. fad8 mi re
   dod4. la'8 la4~
   la8 re, sol fad sol4~
   sol8 mi fad4. sol8
   fad sol mi2\mbreak
   re r4
   mi8. [re16 dod8. si16 la8. sol16]
   fad'2 r4
   sol8.[fad16 mi8. re16 dod8. si16]
   lad'4. si8 re,4~
   re8 mid? dod2
   si2. 
   sol'4. dod,8 re4~
   re8 mi dod2
   si

}

IIIvlIIn = \relative do'' {
   
   r4 fad, si
   lad4. si8 dod4~
   dod si4. re8
   
   %4
   mi re mi2
   re4 re8. mi16 fad4~
   fad mi8 re dod si
   
   %7
   la si dod4. si16 dod
   re4 re4. dod16 re
   mi4 mi2~
   
   %10
   mi8 re re4 dod\mbreak
   re8.[dod16 si8. la16 sol8. fad16]
   mi'2 r4
   
   %13
   fad8.[mi16 re8. dod16 si8. la16]
   mi'8.[re16 dod8. si16 la8. sold16]
   dod4. re8 si4~
   
   %16
   si8 dod lad2
   si2.
   do4. lad8 si4~
   
   %19
   si8 do? lad2
   si2.

}

IIIvlan = \relative do' {
   
   r4 re8. [mi16 fad8. re16]
   dod4 fad fad
   fad fad si
   
   %4
   si si2
   si4 si si
   si4. la8 sol fad
   
   %7
   mi4. mi8 fad4
   fad si si~
   si la la\parenthesize ~
   
   %10
   la8 si la2\mbreak
   fad r4
   la2 r4
   
   %13
   la8.[sol16 fad8. mi16 re8. dod16]
   si2 r4
   sol'2  sold4~
   
   %16
   sold dod, fad
   re4. mi8 fad4
   mi4. mi8 fad4
   
   %19
   sol? fad2
  re2.
   
}

IIIbcn = \relative do {
   
   r4 si8. [dod16 re8. si16]
   fad'4 fad8.[sol16 lad8. fad16]
   si4 si,8.[dod16 re8. si16]
   
   %4
   mi4 mi8.[fad16 sol8. mi16]
   si'4 si,8.[dod16 re8. si16]
   mi4 mi8.[fad16 sol8. mi16]
   
   %7
   la4 la, la'
   si si, si'
   dod dod, dod'
   
   %10
   re8. sol,16 la4 la,\mbreak
   re2 r4
   dod'8.[si16 la8. sol16 fad8. mi16]
   
   %13
   re2.
   mi2 r4
   mi2 mid4~
   
   %16
   mid fad fad,
   si'8.[la16 sol8. fad16 mi?8. re16]
   mi2 si4
   
   %19
   mi fad fad,
   si2.
   
}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/4
    \key si\minor
    \tempo 2 = 55
    s2.*20
    \bar "|."

} 

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>

}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}




IVsopranon = \relative do'' {

    \autoBeamOff
    
    R2.*4
    r4 fad, si
    lad4. si8(dod4)
    
    %7
    re8 dod re2
    dod r4\mbreak
    R2.*2
    
    %11
    r4 fad si,
    lad4.  si8(dod4)
    re8 dod re2
    
    %14
    dod r4
    r4 re si
    sol'4. fad8 mi re\mbreak
    
    %17
    dod8. [si16] dod4. mi8
    fad4. mi8 [re dod]
    si[lad] si4. re8
    
    %20
    mi4. re8[dod si]
    la[re] dod2
    re2.
    
    %23
    r4 fad si,
    do2 do4
    do? do2\mbreak
    
    %26
    do?8[la!] si2
    r4 dod? re
    mi4. re8 dod si
    
    %29
    lad4. si16[lad] sold8. [lad16]
    si4. dod16[si] lad8[si]
    dod4. re16[dod] si8[dod]
    
    %32
    re8.[dod16 si8. la16 sol8. fad16]\mbreak
    mi'2.~
    mi8.[re16 dod8. si16 lad8. sold16]
    
    %35
    fad'2.~
    fad8.[mi16 re8. dod16 si8. lad16]
    sol'8[mi] fad2~
    
    %38
    fad8[mi] re4 dod
    si2.
    do4. lad8 si4~\mbreak
    
    %41
    si8 [dod] lad2
    si2.\fermata
    R2.*3
    
    %46
    r4 re dod8 re
    mi4. re8(mi4)
    mi4. fad8[sol mi]\mbreak
    
    %49
    dod4. si8(la4)
    la8.[si16 dod8. re16] mi8.[fad16]
    si,8.[dod16 re8. mi16] fad8.[sol16]
    
    %52
    dod,4 dod2
    re4. re8[dod si]
    mi4. mi8[re dod]
    
    %55
    fad8.[mi16] re4. dod8
    si8.[la16] sol2\mbreak
    fad r4
    
    %58
    fad'8.[mi16 re8. dod16] si8.[la16]
    re8.[dod16] re2
    fad8.[mi16 re8. dod16] si8.[la16]
    
    %61
    mid'2.
    fad4. mi16[re] dod4~
    dod8 si la4 sold
    
    %64
    fad2 r4
    
}

IVtesto = \lyricmode {
   
   Qua -- si phœ -- nix or -- ba pro -- lis,
   
   qua -- si phœ -- nix or -- ba pro -- lis se re -- no -- vat
   
   in -- flam -- ma - - - - - - - - - - - ta qua -- si phœ -- nix 
   
   or -- ba pro -- lis se re -- no -- vat
   
   in -- flam -- ma - - - - - - - - - - - - - - ta in -- flam -- ma - - ta,
   
   in -- de ad lu -- cem cla -- ri so -- lis vo -- lat fe -- lix et 
   
   be -- a - - - - - - - - ta  vo -- lat fe -- lix et be -- a -- ta - 
   
   et be -- a - ta.

}

IVbcn = \relative do {
   
   r4 si8.[dod16 re8. mi16]
   fad4 fad8.[sold16 lad8. fad16]
   si4 si8.[lad16 si8. re,16]
   
   %4
   mi8.[fad16 sol8. mi16 fad8. fad,16]
   si4 si8.[dod16 re8. mi16]
   fad4 fad8.[sold?16 lad8. fad16]
   
   %7
   si8. [lad16] si4 si,
   fad' fad8.[sol16 fad8. mi16] \mbreak
   si4 si'8.[lad16 si8. re,16]
   
   %10
   mi8.[fad16 sol8. mi16 fad8. fad,16]
   si4 si8.[dod16 re8. mi16]
   fad4 fad8.[sold16 lad8. fad16]
   
   %13
   si8. [lad16] si4 si,
   fad' fad8.[sol?16 fad8. mi16] 
   re8.[dod16 si8. dod16 re8. si16]
   
   %16
   mi4 mi8.[fad16 sol8. mi16]\mbreak
   la4 la8.[sol16 fad8. mi16]
   re4 re8.[mi16 fad8. re16]
   
   %19
   sol4 sol8.[fad16 mi8. re16]
   dod4 dod8.[re16 mi8. dod16]
   fad8 re la'4 la,
   
   %22
   re re8.[mi16 re8. dod16]
   si4 si8.[dod16 re8. si16]
   mi2.
   
   %25
   fad\mbreak
   sol4 sol8.[la16 sol8. fad16]
   mi4 mi8.[fad16 mi8. re16]
   
   %28
   dod4 dod8.[re16 mi8. dod16]
   fad4 fad, r
   sold' sold, r
   
   %31
   lad' lad, r
   si' si, r\mbreak
   dod'8.[si16 lad8. sold16 fad8. sold16]
   
   %34
   lad4 r8 sold[fad8. mi16]
   re'8.[dod16 si8. lad16 sold8. fad16]
   si4 si, re
   
   %37
   mi re8.[mi16 re8. dod16]
   si8 mi fad4 fad,
   si4 si8.[dod16 re8. si16]
   
   %40
   mi2 re4\mbreak
   mi fad fad,
   si\fermata si8.[dod16 re8. mi16]
   
   %43
   fad4 fad8.[sold16 lad8. fad16]
   si4 si8.[lad16 si8. re,16]
   mi8.[fad16 sol8. mi16 fad8. fad,16]
   
   %46
   si4 si' fad
   sol sol8.[fad16 mi8. fad16]
   sol4 sol8.[fad16 mi8. sol16]\mbreak
   
   %49
   la4 la8.[sol16 fad8. mi16]
   re4 r re
   sol r sol
   
   %52
   la la8.[si16 la8. sol16]
   fad4 r r
   dod r r
   
   %55
   re r r
   sol la la,\mbreak
   re4 re8.[mi16 fad8. mi16]
   
   %58
   re2 r4
   re2 r4
   re4. mi8 fad4
   
   %61
   sold2.
   la2 la4
   si dod dod,
   
   %64
   fad2 r4

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/4
    \key si\minor
    \tempo 2 = 45
    s2.*64
    \bar "||"
    \mark\markup\smaller\center-column{"DC a"{\musicglyph "scripts.ufermata"}\vspace #0.2"poi Rit."}

}

IVsoprano = {
    \new Voice = "quasi"
    <<\IVsopranon \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}





VvlIn = \relative do'' {
   
   R1
   mi4 fad8. sold16 la8 la, la [la'16 sold]
   la8 mi mi[la16 sold] la8 dod, dod[la'16 sold]
   
   %4
   la8 si, si[la'16 sold] la8 la, la[la'16 sold]
   la8 sold16 fad mi8[re] dod re si4
   la r r2
   
   %7
   R1*6\mbreak
   r2 mi'4 fad8. sold16
   la8 la, la4 r2
   
   %15
   R1
   mi'4 sold8. la16 si8[si,] si si'16 la
   si8[mi,] mi si'16 la si8 fad fad[si16 la]
   
   %18
   si8 mi, mi[fad16 sold] fad mi red mi fad[ sold fad sold]\mbreak
   la2~la8 sold16 la fad4
   mi r r2
   
   %21
   R1*5
   mi4 sold8. la16 si8[mi,] mi sold16 la
   si8[mi,] mi mi16 fad sol!2~
   
   %28
   sol4 fad8 mi re mi mi4
   si r\mbreak r2
   R1*3
   
   %33
   re4 fad8. sol16 la8 fad re fad
   mi4 r r2\mbreak
   R1
   
   %36
   r2\set Staff.midiInstrument = #"oboe" mi4^\markup \italic "Oboe" fad8 sold
   la8 mi mi[la16 sold] la8 dod, dod[la'16 sold]
   la8 [la,] la dod16 si dod8[la] la si16 dod
   
   %39
   si8[sold] sold dod16 si dod8[la] la si16 dod
   si4 r r16\set Staff.midiInstrument = #"violin" la'^\markup \italic "[Tutti]" sold? la fad4\mbreak
   r16 si la si sold4 r16 la sold la fad4
   
   %42
   r16 sold fad sold mi4 r16 fad mi fad re4
   r16 si la si dod4 r16 fad mi fad re4
   r16 sold fad sold mi4 r16 la sold la fad4\mbreak
   
   %45
   r16 si la si sold8 [sold,] la dod16 si dod8[la]
   r2 r8 dod16[si] dod8 la
   mi' mi, r4 r2
   
   %48
   R1*2\mbreak
   r8 mi'\noBeam mi la16 sold la8[mi] mi la16 sold 
   la8 dod, dod[la'16 sold] la8[dod,] dod re16 dod
   
   %52
   si4 r r16 \set Staff.midiInstrument = #"oboe" la'^\markup \italic "Oboe" sold? la fad4
   r16 si la si sold4 r16 la sold la fad4
   r16 sold fad sold mi4 r16 fad mi fad re4
   
   %55
   r16 si^\markup\italic"[Tutti]" la si dod4 r16 fad mi fad re4
   r16 sold fad sold mi4 r16 la sold la fad4\mbreak
   r16 si la si sold8 [sold,] la dod16 si dod8[la]
   
   %58
   r2 r8 dod16[si] dod8 la
   mi' mi, r4 r2
   R1*2
   
   %62
   r8 mi'\noBeam \tu mi la16 sold la8[mi] mi la16 sold
   la4 r r2\mbreak
   r8 mi\noBeam mi la16 sold la8[dod,] si mi
   
   %65
   dod4 r r2
   
}

VvlIIn = \relative do'' {
   
   R1
   dod4 re8. si16 dod4. dod16 si
   dod4 r8 dod16 si dod4 r8 dod16 si
   
   %4
   dod4 r8 dod16 si dod4 r8 dod16 si
   dod4 r8 sold la la la sold
   la4 r r2
   
   %7
   R1*6\mbreak
   r2 dod4 re8 si
   dod dod dod4 r2
   
   %15
   R1
   sold'4 mi8. fad16 sold8[sold,] sold [sold'16 fad]
   sold4 r fad r
   
   %18
   sold r red r\mbreak
   mi16[red dod red] mi fad mi fad mi8 mi4 red8
   mi4 r r2
   
   %21
   R1*5
   si4 mi8.[fad16] sold8 sold, sold [mi'16 fad]
   sold4 r r8 sol16[fad] mi8 re
   
   %28
   dod4. dod8 si si4 lad8
   si4 r\mbreak r2
   R1*3
   
   %33
   fad'4 re8. mi16 fad8 re fad, re'
   dod4 r r2\mbreak
   R1*5
   
   %40
   r2 r16\set Staff.midiInstrument = #"violin" la' sold? la fad4\mbreak
   r16 si la si sold4 r16 la sold la fad4
   
   %42
   r16 sold fad sold mi4 r16 fad mi fad re4
   r16 si la si dod4 r16 fad mi fad re4
   r16 sold fad sold mi4 r16 la sold la fad4\mbreak
   
   %45
   r16 si la si sold8 [sold,] la dod16 si dod8[la]
   r2 r8 dod16[si] dod8 la
   mi' mi, r4 r2
   
   %48
   R1*2\mbreak
   r8 dod'\noBeam dod dod16 si dod4 r8 dod16 si
   dod4 r8 dod16 si dod8[la] la si16 la
   
   %52
   sold4 r r2
   R1*2
   
   %55
   r16 si la si dod4 r16 fad mi fad re4
   r16 sold fad sold mi4 r16 la sold la fad4\mbreak
   r16 si la si sold8 [sold,] la dod16 si dod8[la]
   
   %58
   r2 r8 dod16[si] dod8 la
   mi' mi, r4 r2
   R1*2
   
   %62
   r8 dod'\noBeam dod dod16 si dod8[dod] dod dod16 si
   dod4 r r2
   r8 dod\noBeam dod dod16 si dod8[la] la sold
   
   %65
   la4 r r2

}

Vvlan = \relative do' {
   
   R1
   la'4 r mi r
   mi r mi r
   
   %4
   mi r mi r 
   mi r8 si' mi, fad mi4
   dod r r2
   
   %7
   R1*6\mbreak
   r2 mi4 r
   mi r r2
   
   %15
   R1
   si'4 r si r
   mi, r fad r
   
   %18
   mi r si' r\mbreak
   mi,8 [mi] dod' dod si dod si4
   sold r r2
   
   %21
   R1*5
   sold4 r mi8 si' la[sold16 fad]
   mi4 r r8 si' dod re, 
   
   %28
   mi4 fad~fad8 sol? fad4
   re r\mbreak r2
   R1*3
   
   %33
   la'4 r la r
   la r r2\mbreak
   R1*15
   
   %50
   mi4 r mi r
   mi r mi r
   mi r r2
   
   %53
   R1*9
   mi4 r mi r
   mi r r2\mbreak
   
   %64
   mi4 r mi8[mi] fad mi
   mi4 r r2
   
}

Vsopranon = \relative do'' {

    \autoBeamOff
    
    la4 dod8.[re16] mi4 la,
    R1*4
    la4 dod8.[re16] mi4 la,8\noBeam mi'16[re]
    
    %7
    mi8[dod la dod] si [sold mi si']
    dod [la16 si] dod8 [la]\mbreak re[si16 dod] re8[si]
    mi[dod16 re] mi8[dod] fad4 r8 re
    
    %10
    mi[dod la dod] re[si16 dod] re8[si]
    dod[mi16 re] mi8[dod] si [mi16 re] mi8[si]
    dod[la16 si] dod[re mi fad] mi2\parenthesize ~\mbreak
    
    %13
    mi8 re16[dod] si4 la2
    r4 r8 dod si[mi16 re] mi8[si]
    dod[red] mi4~mi8 fad red4
    
    %16
    mi2 r
    R1*3
    mi,4 sold8.[la16] si4 mi,8 si'
    
    %21
    dod[re16 mi] la,8[dod] si16[la si la] sold8[si]
    dod16[si dod si] la8[dod] red16[dod red dod] si8[red]
    mi16[red? mi red] dod8[mi] fad8.[mi16] red![dod si la]\mbreak
    
    %24
    sold4. si8 mi[fad16 red] mi8[fad16 red]
    mi4. red16[dod] si8 la16[sold] fad4
    mi2 r
    
    %27
    R1*2
    si'4 re?8.[mi16]\mbreak fad4 si,8 re16[mi]
    fad8[re si re] dod[lad fad dod']
    
    %31
    re[si16 dod] re8[si] mi[dod16 re] mi8[dod]
    fad[mi] re4~re8 mi dod4
    re r r2
    
    %34
    la4 dod8.[re16] mi4 la,8 mi'16[re]\mbreak
    mi8[dod la dod] si[sold] mi4
    mi'1~
    
    %37
    mi~
    mi~
    mi~
    
    %40
    mi4 r16 mi[re mi] dod4 r16 fad[mi fad]\mbreak
    re4 r16 mi[re mi] dod4 r16 re[dod re]
    si4 r16 dod[si dod] la4 r16 si[la si]
    
    %43
    sold4 r16 la [sold la]  fad4 r16 si[la si]
    sold4 r16 dod[si dod] la4 r16 re[dod re]\mbreak
    si4 r16 mi[re mi] dod8[mi16 re] mi8[dod]
    
    %46
    si8[mi16 re] mi8[si] dod[mi16 re] mi8[dod]
    si [mi16 re] mi8[sold,] la[fad'16 mi] fad8[la,]
    si[mi16 re] mi8[sold,] la[si16 dod] si8[la]
    
    %49
    sold[mi] mi'4~mi8 re16[dod] si4\mbreak
    la r r2
    R1
    
    %52
    r4 r16 mi'[re mi]  dod4 r16 fad[mi fad]
    re4 r16 mi[re mi] dod4 r16 re[dod re]
    si4 r16 dod[si dod] la4 r16 si[la si]\mbreak
    
    %55
    sold4 r16 la[sold la] fad4 r16 si[la si]
    sold4 r16 dod[si dod] la4 r16 re[dod re]
    si4 r16 mi[re mi] dod8[mi16 re] mi8[dod]
    
    %58
    si8 [mi16 re] mi8[si] dod[mi16 re] mi8[dod]
    si8 [mi16 re] mi8[sold,]\mbreak la[fad'16 mi] fad8[la,]
    si8[mi16 re] mi8 [sold,] la[si16 dod] si8[la]
    
    %61
    sold[mi] mi'4~mi8 re16[dod] si4
    la r r2
    r8 la dod[mi16 re] dod8[fad] si, mi\mbreak
    
    %64
    dod4 r r2
    R1
   
}

Vtesto = \lyricmode {
   
   Al -- le -- lu -- ja Al -- le -- lu --ia, 
   al - - - - - - - - - - - - - - - - - - - - le -- lu -- ja,
   al - - - - le -- lu -- ja,
   al -- le -- lu -- ja, al - - - - - - - - - - - - - - - - - - - le -- lu -- ja,
   al -- le -- lu -- ja, al - - - - - - - - le -- lu -- ja.
   Al -- le lu -- ja, 
   al - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - le -- lu -- ja,
   al - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - le -- lu -- ja,
   al - - le -- lu -- ja.

}

Vbcn = \relative do {
   
   la4 r la r
   la r la r
   la r la r
   
   %4
   la r la r
   la r8 si8 la[re] mi[mi,]
   la4 r la r
   
   %7
   la r8 la' sold4 r8 sold
   la4 r8 la \mbreak si4 r8 si 
   dod4 r8 dod, re4 r8 re
   
   %10
   dod4 r8 la' si4 r8 sold
   la4 r8 la sold4 r8 sold
   la4 r8 re, dod[la] la la'16 sold\mbreak
   
   %13
   la8 re, mi mi, la4 r
   la4. la'8 sold4 r8 sold
   la4 r8 sold la fad si si,
   
   %16
   mi4 r mi r
   mi r red r
   mi r si r\mbreak 
   
   %19
   dod16 si la si dod [red dod red] mi8 la si[si,]
   mi4 r mi4. sold8
   la4. la,8 mi'4. sold8
   
   %22
   la4. la,8 si4. si8
   dod4. dod8 red4. red8\mbreak
   mi4 r mi r
   
   %25
   mi fad sold8 la si si,
   mi4 r mi r
   mi r r8 mi16 re dod8[si]
   
   %28
   lad4. lad8 si[mi] fad fad,
   si4 r\mbreak si r
   si4. si8 fad'4. fad8
   
   %31
   si,4. si8 dod4. dod8
   re4. mi8 fad sol la la,
   re4 r re r
   
   %34
   la r la' r\mbreak
   la r mi r
   R1
   
   %37
   la,4 r la r
   la r la r
   mi' r la, r
   
   %40
   mi' sold la re,\mbreak
   si' mi, la re,
   sold dod, fad si,
   
   %43
   mi dod re si
   mi dod fad re\mbreak
   sold mi la r8 la
   
   %46
   sold4 r8 sold la4 r8 la
   sold4 r8 mi\mbreak fad4 r8 fad
   sold?4 r8 mi fad4 r8 re
   
   %49
   mi4 r8 sold la re, mi mi,\mbreak
   la4 r la r
   la4 r la r
   
   %52
   mi' sold la re,
   si' mi, la re,
   sold dod, fad si,\mbreak
   
   %55
   mi dod re si
   mi dod fad re
   sold mi la r8 la
   
   %58
   sold4 r8 sold la4 r8 la
   sold4 r8 mi\mbreak fad4 r8 fad
   sold4 r8 mi fad4 r8 re
   
   %61
   mi4 r8 sold la[re,] mi mi,
   la4 r la r
   la la'8 sold la[re,] mi mi,\mbreak
   
   %64
   la4 r la8 [dod] re mi
   la,4 r r2
   
}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/2
    \key re\major
    \tempo 2 = 50
    s1*65
    \bar "|."

}

VvlI = {
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}

Vvla = {
    \clef alto
    <<\Vvlan \forma>>

}

Vsoprano = {
    \new Voice = "alleluja"
    <<\Vsopranon \forma>>
}


Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
}


global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller\center-column {"Chari zephyri fontes"}
        composer = \markup \center-column{"A. Lotti (1667 - 1740)"}
    }

    \markup \huge \column{"[1.] Aria - Chari Zephyri fontes"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"2 Oboi"}
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob1"
                    \IobI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.shortInstrumentName = "ob2"
                    \IobII\global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"2 Violini"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{Violetta}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Ivla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 12/8 r\longa r\longa^\markup\center-align "Soprano"  la'8. [si'16 sold'8]}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \Isoprano\global
                \new Lyrics \lyricsto "zephyri" \Itesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Basso Continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 16)
            indent = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

        systems-per-page = #6

    }

    \markup \huge \column{"[2.] Recitativo - Inter ignes cælestes amabilis"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 4/4 r4^\markup\center-align "Soprano"  dod''8 dod'' dod''4 }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IIsoprano\global
                \new Lyrics \lyricsto "ignes" \IItesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Basso Continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 19)
            indent = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

        systems-per-page = #4

    }

    \markup \huge \column{"[3.] Ritornello"}

    \score {

        \new ChoirStaff <<		

            \new PianoStaff <<

                \new Staff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"2 Violini"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \IIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \IIIvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{Violetta}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Basso Continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 16.5)
            indent = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

        systems-per-page = #6

    }

    \markup \huge \column{"[4.] Aria - Quasi phoenix orba prolis"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key si\minor \time 3/4\override MensuralStaff.TimeSignature.style = #'numbered r\longa r\longa r4^\markup\center-align "Soprano"  fad'4 si' }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \IVsoprano\global
                \new Lyrics \lyricsto "quasi" \IVtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Basso Continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 19)
            indent = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

        systems-per-page = #4

    }

    \markup \huge \column{"[5.] Alleluja"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"2 Oboi""2 Violini"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl1"
                    \VvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vl2"
                    \VvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{Violetta}
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \Vvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 2/2 la'4^\markup\center-align "Soprano"  dod''8. [re''16] mi''4 la'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "sop"
                \Vsoprano\global
                \new Lyrics \lyricsto "alleluja" \Vtesto
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Basso Continuo"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Vbc\global
            >>
        >>

        \layout {
            #(layout-set-staff-size 15)
            indent = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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
