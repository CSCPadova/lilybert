\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

pf = #(make-dynamic-script "pf")

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Un tasto solo"

tr = \trill

dolce = _\markup\italic "dol."

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


Iglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IvlIn =  \relative do'' {
   
   r8 mi si sold' si, si' si, sold'
   si, si'4 la sold fad8~
   fad mi4 red8 mi, sold' si, sold'
   
   %4
   fad4 r8 fad dod4 r8 fad
   dod4 si lad sold
   fad8 red' red4\tr \mbreak si4 r8 red
   
   %7
   mi4 r8 mi fad4 r8 mi
   fad sold mi fad red mi dod red
   si dod fad,4\tr mi r
   
   %10
   r8 si' fad red' fad, fad' fad, red'
   fad, fad'4 mi red dod8~
   dod si4 lad8\mbreak si si' red, si'
   
   %13
   sold4 r8 mi fad4 r8 mi
   fad4 mi red dod
   si8 sold' fad4\tr mi r8 mi
   
   %16
   red4 r8 si' dod4 r8 si
   dod red si dod lad si sold lad
   fad sold dod,4\tr \mbreak si8 si'\soli~si16 red dod si
   
   %19
   lad8 mi' red dod red si r red
   dod fad,4 mid8 fad4 r16 fad sold(fad)
   lad(sold) si(lad) dod(fad,) sold(mi) mi8\tr red r4
   
   %22
   r2 r4 r16 sold, la sold\mbreak
   si(la) dod(si) red(dod) mi(red) sold si, dod si red dod mi red
   fad mi sold fad la sold si la red,8 si' si,16 la' sold fad
   
   %25
   sold si la sold fad4\tr  mi8 dod\tu sold mi'
   sold, sold' sold, \parenthesize mi'\mbreak sold, sold'4 fad8~
   fad mi4 red dod sid8
   
   %28
   r16 dod\soli red dod mi dod mi fad sold red sold la sold fad mi red
   mi4 r8 dod red sid r sid
   dod16 mi fad mi sold mi sold mi\mbreak si'si, red fad si la sold fad
   
   %31
   sold8 si, r mi fad si, r red
   mi16 si' sold si mi, si' mi, si' red, fad si red, dod si' la dod,\mbreak
   si la' sold si, la sold' fad la, sold si mi sold, fad mi' red fad,
   
   %34
   mi4 r8 dod' si mi, la4
   r8 mi fad sold la mi fad si,
   dod4 r8\tu la' si4 r8 la\mbreak
   
   %37
   si4 la sold fad
   mi8 dod' si4\tr la r
   r8 mi' si sold' si, si' si, sold'
   
   %40
   si, si'4 la sold fad8~
   fad mi4 red8 mi,16\soli fad mi fad sold mi sold la\mbreak
   si dod si dod red si dod red mi red mi red dod red mi dod
   
   %43
   red8 red fad si, dod lad' dod fad,
   r8 sold si mid, fad16 dod lad(dod fad) sold fad sold\mbreak
   mi lad, fad(lad mi') fad mi fad red8 fad, red si
   
   %46
   r fad'' red fad mi16 si sold(si mi) sold fad mi
   re fad, sold(re' mi) fad mi re dod8 mi, dod la\mbreak
   r8 la' mi dod' re16 mi re mi fad re fad sold
   
   %49
   la si la si dod la si dod re dod re dod si dod re si
   dod8 dod, mi la, si sold si mi, 
   r fad la red\mbreak mi, mi' si sold'
   
   %52
   si, si' si, sold' si, si'4 la8~
   la sold4 fad mi red8
   mi sold si, sold' fad4 r8 fad 
   
   %55
   dod4 r8 fad dod4 si
   lad sold fad8 red' dod4\tr \mbreak
   si4 r8 red mi4\tu r8 mi 
   
   %58
   fad4 r8 mi fad sold mi fad
   red mi dod red si dod fad,4
   mi8 mi'4 red8 mi4 r
   
}

IvlIIn = \relative do'' {
   
   R1*3
   r8 si fad red' fad, fad' fad, red'
   fad, fad'4 mi red dod8~
   
   %6
   dod si4 lad8 si si' red, si'
   sold4 r8 si, si4 r8 si
   si red dod4 si la\mbreak
   
   %9
   sold8 mi'4 red8  mi sold si, sold'
   fad4 r8 si, dod4 r8 si
   dod4 si lad sold
   
   %12
   fad8 red' dod4\tr si r
   r8 mi si sold' si, si' si, sold'
   si, si'4 la sold fad8~
   
   %15
   fad mi4 red8\mbreak mi8 sold si, sold'
   fad4 r8 fad fad4 r8 fad
   fad lad sold4 fad mi
   
   %18
   red8 si'4 lad8 si4 r8 sold^\markup\italic\center-align"Soli"
   fad8 si4 lad8
   si fad~fad16 lad sold fad
   
   %21
   mid8 si' lad sold lad16 dod, red mid fad4
   r2 r4 r16 si, dod si
   red(dod) mi(red) fad(si,) dod la\mbreak la8 sold r4
   
   %24
   r2 r16 sold la sold si(la) dod(si)
   red(dod) mi red fad mi sold fad la sold fad mi red fad mi red
   mi sold fad mi red4\tr mi r8 dod\tu
   
   %26
   red4 r8 dod red4 dod
   sid lad sold8 mi' red4\tr 
   dod 4 r8 dod\soli red sid r sid
   
   %29
   dod16 dod red dod mi dod mi fad sold red sold la sold fad mi red
   mi8 dod r mi fad si, r red
   mi,16 mi' fad mi sold mi sold mi\mbreak si' si, red fad si la sold fad
   
   %32
   sold4 r8 sold fad si, mi4
   r8 si dod red mi si dod fad,
   sold16 mi' si mi la, mi' la, mi' sold, si mi sold, fad mi' re! fad,
   
   %35
   mi re' dod mi, red dod' si red, dod mi la dod, si la' sold si,
   la8\tu la' mi dod' mi, mi' mi, dod'
   mi, mi'4 re dod si8~
   
   %38
   si la4 sold8 la la' dod, la'
   sold4 r8 mi fad4 r8 mi
   fad4 mi red dod
   
   %41
   si8 sold' fad4\tr mi8\soli sold, si mi,
   fad red' fad si, r dod mi lad
   si,16 dod si dod red si red mi fad sold fad sold lad fad sold lad\mbreak
   
   %44
   si lad si lad sold lad si sold lad8 dod, lad fad
   r dod' lad dod si16 fad(red fad) si dod si dod
   la? red,(si red) la' si la si sold8 si sold  mi
   
   %47
   r mi' si sold'\mbreak la,16 mi(dod mi) la dod si la
   sol si, dod sol' la si la sol fad8 fad' la re,
   mi dod mi la, r si re sold
   
   %50
   la,16 si la si dod la dod red mi fad mi fad sold mi fad sold\mbreak
   la sold la sold fad sold la fad sold4 r
   R1*2
   
   %54
   r2 r8 si, fad red'
   fad, fad' fad, red' fad, fad'4 mi8~
   mi red4 dod si lad8
   
   %57
   si si' red, si' sold4\tu r8 si,
   si4 r8 si si red dod4
   si la sold8 mi'4 red8
   
   %60
   mi sold fad4\tr mi r
   
}

Ivlan = \relative do'{
   
   R1*6
   r8 mi si sold' si, si' si, sold'
   si, si' sold la fad sold mi fad
   red sold, si4 si r8 mi
   red4 r8 fad fad4 r8 fad
   fad dod red mi fad lad, si dod\mbreak
   red sold dod, fad fad4 r8 red
   mi4 r8 si' si4 r8 si
   si fad sold la si red, mi fad
   sold dod fad, si si4 r
   r8 si fad red' fad, fad' fad, red'
   fad, fad red mi\mbreak dod' red si dod
   lad red, fad fad fad4 r
   R1*6
   r2 r4 r8 sold\tu
   sold4 r8 sold sold red mi fad
   sold sid, dod red mi la red, sold
   sold4 r r2
   R1*7
   mi4\tu r8 mi\mbreak mi4 r8 mi
   mi si dod red mi sold, la si
   dod fad si, mi mi4 r8 dod'
   si4 r8 si si4 r8 si
   si fad sold la si red, mi fad
   sold dod fad, si si4 r
   R1*15\mbreak
   r2 r8 mi,\tu si sold'
   si, si' si, sold' si, si' sold la
   fad sold mi fad red sold si si 
   si si, si si si4 r

}

Icbn = \relative do {
   
   mi4\soli r8 mi red4 r8 mi
   red4 dod si la
   sold8 la si4 mi r8 mi
   
   %4
   si'4 r8 si lad4 r8 si
   lad4 sold fad mi
   red8 mi fad fad, si2\mbreak
   
   %7
   mi4 r8 mi red4 r8 mi
   red si'4 la sold fad8~
   fad mi si' si, mi4 r8 mi
   
   %10
   si'4 r8 si lad4 r8 si
   lad4 sold fad mi
   red8 mi fad fad, si4 r8 si\mbreak
   
   %13
   mi4 r8 mi red4 r8 mi
   red4 dod si la
   sold8 la si4 mi r8 mi
   
   %16
   si'4 r8 si lad4 r8 si
   lad \clef tenor \key la\major fad'4 mi red dod8~
   dod si \clef bass \key la\major fad fad,\mbreak si mi\soli red mi
   
   %19
   fad sold fad4 si,8 si' lad si
   dod re dod4 fad, r
   fad lad si r
   
   %22
   si, red mi r
   R1
   r2 si'8 si, r si
   
   %25
   mi la, si4 mi r8 dod'\tu\mbreak
   sid4 r8 dod sid4 la
   sold fad mi8 fad sold sold,
   
   %28
   dod4 r8 dod' \soli sid4 sold
   dod, r8 dod' sid4 sold
   dod, r8 mi red4 si?
   
   %31
   mi r8 mi red4 si
   r8 mi sold si si4 la
   sold fad\mbreak mi8 sold la si
   
   %34
   mi, mi dod la mi'4 re
   dod si la8 dod re mi
   la,4\tu r8 la' sold4 r8 la
   
   %37
   sold4 fad mi re
   dod8 re mi mi, la4 r8 la
   mi'4 r8 mi red4 r8 mi
   
   %40
   red4 dod\mbreak si la
   sold8 la si4 mi r8 mi\soli 
   red si r si' sold dod lad fad
   
   %43
   si si, r si' lad fad r fad
   red sold mid dod fad fad, r fad'
   lad4 fad si r8 si,\mbreak
   
   %46
   red4 si mi r8 mi
   si mi sold, mi' la,4 r8 la'
   mi la dod, la' re,4 r8 re
   
   %49
   dod la r la' fad si sold mi
   la la, r la' sold mi r mi
   dod fad red si mi mi, r mi'\mbreak
   
   %52
   red4 r8 mi red4 dod
   si la sold8 la si4
   mi r8 mi si'4 r8 si
   
   %55
   lad4 r8 si lad4 sold
   fad mi red8 mi fad fad,
   si2 mi4\tu r8 mi 
   
   %58
   red4 r8 mi red si'4 la8~\mbreak
   la sold4 fad8~fad mi si' si,
   mi mi si' si, mi4 r
     
}


IvlIrn =  \relative do'' {
   
   r8 mi si sold' si, si' si, sold'
   si, si'4 la sold fad8~
   fad mi4 red8 mi, sold' si, sold'
   
   %4
   fad4 r8 fad dod4 r8 fad
   dod4 si lad sold
   fad8 red' red4\tr \mbreak si4 r8 red
   
   %7
   mi4 r8 mi fad4 r8 mi
   fad sold mi fad red mi dod red
   si dod fad,4\tr mi r
   
   %10
   r8 si' fad red' fad, fad' fad, red'
   fad, fad'4 mi red dod8~
   dod si4 lad8\mbreak si si' red, si'
   
   %13
   sold4 r8 mi fad4 r8 mi
   fad4 mi red dod
   si8 sold' fad4\tr mi r8 mi
   
   %16
   red4 r8 si' dod4 r8 si
   dod red si dod lad si sold lad
   fad sold dod,4\tr \mbreak si4 r
   
   %19
   R1*6
   r2  r8 dod\tu sold mi'
   sold, sold' sold, mi'\mbreak sold, sold'4 fad8~
   fad mi4 red dod sid8
   
   %28
   R1*8
   dod,4\tu r8 la' si4 r8 la\mbreak
   
   %37
   si4 la sold fad
   mi8 dod' si4\tr la r
   r8 mi' si sold' si, si' si, sold'
   
   %40
   si, si'4 la sold fad8~
   fad mi4 red8 mi4 r
   R1*9 
   r2 r8 mi si sold'
   
   %52
   si, si' si, sold' si, si'4 la8~
   la sold4 fad mi red8
   mi sold si, sold' fad4 r8 fad
   
   %55
   dod4 r8 fad dod4 si
   lad sold fad8 red' dod4\tr \mbreak
   si4 r8 red mi4\tu r8 mi 
   
   %58
   fad4 r8 mi fad sold mi fad
   red mi dod red si dod fad,4
   mi8 mi'4 red8 mi4 r

}

IvlIIrn = \relative do'' {
   
   R1*3
   r8 si fad red' fad, fad' fad, red'
   fad, fad'4 mi red dod8~
   
   %6
   dod si4 lad8 si si' red, si'
   sold4 r8 si, si4 r8 si
   si red dod4 si la\mbreak
   
   %9
   sold8 mi'4 red8  mi sold si, sold'
   fad4 r8 si, dod4 r8 si
   dod4 si lad sold
   
   %12
   fad8 red' dod4\tr si r
   r8 mi si sold' si, si' si, sold'
   si, si'4 la sold fad8~
   
   %15
   fad mi4 red8\mbreak mi8 sold si, sold'
   fad4 r8 fad fad4 r8 fad
   fad lad sold4 fad mi
   
   %18
   red8 si'4 lad8 si4 r
   R1*6
   r2 r4 r8 dod,\tu
   
   %26
   red4 r8 dod red4 dod
   sid lad sold8 mi' red4\tr 
   dod r r2\mbreak
   
   %29
   R1*7
   r8 la\tu mi dod' mi, mi' mi, dod'
   mi, mi'4 re dod si8~
   
   %38
   si la4 sold8 la la' dod, la'
   sold4 r8 mi fad4 r8 mi
   fad4 mi red dod
   
   %41
   si8 sold' fad4\tr  mi r
   R1*12\mbreak
   r2 r8 si fad red'
   
   %55
   fad, fad' fad, red' fad, fad'4 mi8~
   mi red4 dod si lad8
   si si' red, si' sold4\tu r8 si,
   
   %58
   si4 r8 si si red dod4
   si la sold8 mi'4 red8
   mi sold fad4\tr mi r
   
}

Ibcn = \relative do {
   
   mi4 r8 mi red4 r8 mi
   red4 dod si la
   sold8 la si4 mi r8 mi
   
   %4
   si'4 r8 si lad4 r8 si
   lad4 sold fad mi
   red8 mi fad fad, si2\mbreak
   
   %7
   mi4 r8 mi red4 r8 mi
   red si'4 la sold fad8~
   fad mi si' si, mi4 r8 mi
   
   %10
   si'4 r8 si lad4 r8 si
   lad4 sold fad mi
   red8 mi fad fad, si4 r8 si\mbreak
   
   %13
   mi4 r8 mi red4 r8 mi
   red4 dod si la
   sold8 la si4 mi r8 mi
   
   %16
   si'4 r8 si lad4 r8 si
   lad \clef tenor \key la\major fad'4 mi red dod8~
   dod si \clef bass \key la\major fad fad,\mbreak si mi\soli red mi
   
   %19
   fad sold fad4 si,8 si' lad si
   dod re dod4 fad, r
   fad lad si r
   
   %22
   si, red mi r
   R1
   r2 si'8 si, r si
   
   %25
   mi la, si4 mi r8 dod'\tu\mbreak
   sid4 r8 dod sid4 la
   sold fad mi8 fad sold sold,
   
   %28
   dod4 r8 dod' \soli sid4 sold
   dod, r8 dod' sid4 sold
   dod, r8 mi red4 si?
   
   %31
   mi r8 mi red4 si
   r8 mi sold si si4 la
   sold fad\mbreak mi8 sold la si
   
   %34
   mi, mi dod la mi'4 re
   dod si la8 dod re mi
   la,4\tu r8 la' sold4 r8 la
   
   %37
   sold4 fad mi re
   dod8 re mi mi, la4 r8 la
   mi'4 r8 mi red4 r8 mi
   
   %40
   red4 dod\mbreak si la
   sold8 la si4 mi r8 mi\soli 
   red si r si' sold dod lad fad
   
   %43
   si si, r si' lad fad r fad
   red sold mid dod fad fad, r fad'
   lad4 fad si r8 si,\mbreak
   
   %46
   red4 si mi r8 mi
   si mi sold, mi' la,4 r8 la'
   mi la dod, la' re,4 r8 re
   
   %49
   dod la r la' fad si sold mi
   la la, r la' sold mi r mi
   dod fad red si mi mi, r mi'\mbreak
   
   %52
   red4 r8 mi red4 dod
   si la sold8 la si4
   mi r8 mi si'4 r8 si
   
   %55
   lad4 r8 si lad4 sold
   fad mi red8 mi fad fad,
   si2 mi4\tu r8 mi 
   
   %58
   red4 r8 mi red si'4 la8~\mbreak
   la sold4 fad8~fad mi si' si,
   mi mi si' si, mi4 r

}

IbfnI = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s1
  s4 <7>8 <6> <7> <6> <7> <6>
  <7> <5> <4><3+> s2
  <_+>1
  s4 <7>8 <6> <7> <6> <7> <6>s4 <4>8 <3+> <_+>2
  s1
  s8 <4 2>4 <4+ 2> <4 2> s8
  <4 2>4 <4>8 <3+> s2
  <_+>1
  s4 <7>8 <6> <7> <6> <7> <6>
  <7>4 <4>8 <3+> s2
  s1
  s4 <7>8 <6> <7> <6> <7> <6>
  <7> s <4> <3+> s2
  <_+>1
  s4 <4 2>8 s2 s8
  s4 <4>8 <3+> s2
  <_+>8 s <4> <3+> <_+>2
  <_+>8 <_+> <4> <3+> <_+>4 s
  <_+>2 <4>8 <3+> s4
  <_+>2 <4>8 <3+> s4
  s1
  s2 <7+>
  s4 <_+> s2
  s <7>8 <6> <7> <6>
  <7> <6> <7> <6> <7+> s <4> <3+>
  s2 s4 <_+>
  s2 s4 <_+>
  s1
  s2 s4 <_+>
  s4 s8 <6> s2
  s1*4
  s4 <7>8 <6> <7> <6> <7> <6>
  <7>4 <4>8 <3+> s2
  s1 
  s4 <7>8 <6> <7> <6> <7> <6>
  <7> s <4> <3+> s2
  s2 s4 <5!>
  <_+>1
  s4 <6!> s2
  <5!>4 <_+> <_+> s
  <5!> <7 _+> <_+>2
  <_!>1
  <_!>
  s2 s4 <5!>
  s1
  s4 <5!> s2
  s2 s4 <7>8 <6>
  <7> <6> <7> <6> <7> s <4> <3+>
  s2 <_+>
  s2 s4 <7>8 <6>
  <7 _+> <6> <7> <6> <7><7+> <4> <3+>
  s1
  s2 s4 <2>8 <6>
  <4 2> s <4 2> s <4 2> s <4> <3+>
  s4 <4>8 <3+>
  
}

IbfnII = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s1
  s4 <7>8 <6> <7> <6> <7> <6>
  <7> <5> <4><3+> s2
  <_+>1
  s4 <7>8 <6> <7> <6> <7> <6>s4 <4>8 <3+> <_+>2
  s1
  s8 <4 2>4 <4+ 2> <4 2> s8
  <4 2>4 <4>8 <3+> s2
  <_+>1
  s4 <7>8 <6> <7> <6> <7> <6>
  <7>4 <4>8 <3+> s2
  s1
  s4 <7>8 <6> <7> <6> <7> <6>
  <7> s <4> <3+> s2
  <_+>1
  s4 <4 2>8 s2 s8
  s4 <4>8 <3+> s2
  <_+>8 s <4> <3+> <_+>2
  <_+>8 <_+> <4> <3+> <_+>4 s
  <_+>2 <4>8 <3+> s4
  <_+>2 <4>8 <3+> s4
  s1
  s2 <7+>
  s4 <_+> s2
  s <7>8 <6> <7> <6>
  <7> <6> <7> <6> <7+> s <4> <3+>
  s2 s4 <_+>
  s2 s4 <_+>
  s1
  s2 s4 <_+>
  s4 s8 <6> s2
  s1*4
  s4 <7>8 <6> <7> <6> <7> <6>
  <7>4 <4>8 <3+> s2
  s1 
  s4 <7>8 <6> <7> <6> <7> <6>
  <7> s <4> <3+> s2
  s2 s4 <5!>
  <_+>1
  s4 <6!> s2
  <5!>4 <_+> <_+> s
  <5!> <7 _+> <_+>2
  <_!>1
  <_!>
  s2 s4 <5!>
  s1
  s4 <5!> s2
  s2 s4 <7>8 <6>
  <7> <6> <7> <6> <7> s <4> <3+>
  s2 <_+>
  s2 s4 <7>8 <6>
  <7 _+> <6> <7> <6> <7><7+> <4> <3+>
  s1
  s2 s4 <2>8 <6>
  <4 2> s <4 2> s <4 2> s <4> <3+>
  s4 <4>8 <3+>
 
}

forma = {

  \key la\major
  \time 4/4
  \tempo 2 = 53
  s1*60
  \bar"|."

}

IvlI = {
  \Iglobal
  %\notypeset
  <<\IvlIn \forma>>

}

IvlII = {
  \Iglobal
  <<\IvlIIn \forma>>

}

IvlIr = {
  \Iglobal
  <<\IvlIrn \forma>>

}

IvlIIr = {
  \Iglobal
  <<\IvlIIrn \forma>>

}

Ivla = {
  \Iglobal
  \clef alto
  <<\Ivlan \forma>>

}

Icb = {
  \Iglobal
  \clef bass
  <<\Icbn \forma\IbfnI>>

}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \IbfnII>>
  \typeset

}


IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIvlIn =  \relative do'' {
   
   mi4-. la-. sold-. dod
   si la sold r8 mi
   fad4 r8 si sold4 la~
   
   %4
   la sold la la8 mi\solo
   si' re, r16 re' dod si dod8 la r16 la sold fad\mbreak
   sold mi la fad sold8 fad\tr mi4 r
   
   %7
   R1
   r2 r8 si' si fad16 la32(sold)
   la16(sold?) la8~la16 la si la sold!4 r
   
   %10
   r8 la si sold mi16 mi la si dod si la sold\mbreak
   fad fad fad si si4~si16 mi, mi la la4~
   la16 la sold fad sold si la sold fad fad sold la fad8.\tr mi16
   
   %13
   mi4 mi-.\tu red-. sold\parenthesize -.
   fad mi red r8 si
   dod4 r8 fad red4 mi~\mbreak
   
   %16
   mi red mi4\fermata r
   mi16 si sold si mi sold? fad mi fad mi red dod si dod red si
   fad' mi red dod si dod red si sold'8 si, sold si
   
   %19
   red,4 r\mbreak red'8 fad red fad,
   mi16 sold' mi fad sold la si fad sold8 sold,16 la si dod red si
   mi sold la si mi, sold fad mi fad red si red fad red dod si\mbreak
   
   %22
   dod lad fad lad mi' sold fad mi red si' fad si red, si' fad si
   sold4 r r2
   R1
   
   %25
   r16 mi si mi sold, mi' si mi dod4 r
   r2 si16 la sold la si dod re? si\mbreak 
   dod si la si dod red mi dod red dod si dod red mi fad red
   
   %28
   mi4 r r16 dod re? mi la, dod si la
   si sold mi sold si sold fad mi fad red si red la' dod si la\mbreak
   sold mi' si mi sold, mi' si mi dod4 r
   
   %31
   R1
   r2 r16 la' mi la dod, la' mi la
   fad mi re mi fad sold la fad sold fad mi fad sold la si sold\mbreak
   
   %34
   la si la si sold la sold la fad sold fad sold mi fad mi fad 
   re mi re mi dod re dod re si dod si dod la si la si
   sold si mi si sold si mi si\mbreak la dod mi dod la dod mi dod
   
   %37
   si8 sold si sold dod la dod la
   si4\fermata r8 mi_\tu fad4 r8 si
   sold4 la2 sold4
   
   %40
   la r r2

}

IIvlIIn = \relative do'' {
   
   r2 mi4-. la-.
   sold dod si mi,~
   mi re2 dod4
   
   %4
   si2\tr la4 r
   R1
   r2 r4 mi'8\solo si
   
   %7
   fad' la, r16 la' sold fad sold8 mi r16 mi red dod\mbreak
   red si mi dod red 8 dod\tr si4 r
   r8 mi fad red si mi mi si16 re?32(dod)
   
   %10
   re16(dod) re8~re16 re mi re dod dod fad sold la sold fad mi
   red4 r16 red red16.\tr mi32\mbreak mi4 r16 dod dod red  
   red fad mi red mi sold fad mi red red mi fad red8. mi16
   
   %13
   mi4 r si-.\parenthesize \tu mi-.
   red sold fad si,~
   si la2 sold4
   
   %16
   fad2 mi4\fermata r\mbreak
   sold8\soli si sold si red,4 r
   red'8 fad red fad, mi'16 si sold si mi sold fad mi 
   
   %19
   fad mi red dod si dod red si fad' mi red dod si dod red si
   sold'4 r\mbreak r16 sold mi fad sold la si fad
   sold4 r r2
   
   %22
   R1
   r16 sold la si mi, sold fad mi fad red si red fad red dod si
   dod lad fad lad mi' sold fad mi\mbreak red si' fad si red, si' fad si
   
   %25
   sold4 r r16 la mi la dod, la' mi la
   fad mi re? mi fad sold la fad sold fad mi fad sold la si sold
   la4 r\mbreak fad16 mi red mi fad sold? la fad 
   
   %28
   sold fad mi fad sold la si sold la4 r
   R1
   r2 r16 dod, re mi la, dod si la
   
   %31
   si sold mi sold si sold fad mi\mbreak fad red si red la' dod si la
   sold mi' si mi sold, mi' si mi dod4 r
   la16 sold fad sold la si dod la si la sold la si dod re si
   
   %34
   dod4 r\mbreak la'16 si la si sold la sold la
   fad sold? fad sold mi fad mi fad re mi re mi dod re dod re
   si8 sold si sold dod la dod la
   
   %37
   sold16 si mi si sold si mi si\mbreak la dod mi dod la dod mi dod
   sold4\fermopz  mi'2\parenthesize \tu re4~
   re dod si2
   
   %40
   la4\fermata r r2
   
}


IIvlIrn =  \relative do'' {
   
   mi4-. la-. sold-. dod
   si la sold r8 mi
   fad4 r8 si sold4 la~
   
   %4
   la sold la r
   R1*8
   
   %13
   si,4 mi-.\tu red-. sold-.
   fad mi red r8 si
   dod4 r8 fad red4 mi~\mbreak
   
   %16
   mi red mi4\fermata r
   R1*21
   r4 r8 mi_\tu fad4 r8 si
   sold4 la2 sold4
   
   %40
   la\fermopz r r2

}

IIvlIIrn = \relative do'' {
   
   r2 mi4-. la-.
   sold dod si mi,~
   mi re2 dod4
   
   %4
   si2\tr la4 r
   R1*8
   
   %13
   mi'4 r si-.\parenthesize \tu mi-.
   red sold fad si,~
   si la2 sold4
   
   %16
   fad2 mi4\fermata r\mbreak
   R1*21
   r4  mi'2\parenthesize \tu re4~
   re dod si2
   
   %40
   la4\fermata r r2

}

IIvlan = \relative do'{
   
   dod'4 r si r
   mi, r mi r8 la
   la4 fad si, la8 mi'\mbreak
   
   %4
   fad re si mi mi4 r
   R1*8
   sol4 r fad r
   
   %14
   si, r si r8 mi
   mi4 dod fad,8 fad' mi si'
   dod la fad si si4\parenthesize \fermata r
   
   %17
   R1*21
   r4 r8 la la4 fad
   si, la8 mi' fad re si mi\mbreak
   
   %40
   mi4\fermopz r r2

}

IIcbn = \relative do {
   
   la4 r mi' r
   mi r mi r8 dod
   re  mi fad re mi mi fad dod
   
   %4
   re si mi mi, la la'\soli dod la\mbreak
   sold fad sold mi la dod, red si
   mi dod la si mi mi sold mi
   
   %7
   red dod red si mi sold lad fad
   si sold mi fad si,4 r
   r8 dod red si mi4 r
   
   %10
   r8 fad sold mi\mbreak la4 la,
   si r8 si dod4 r8 la
   si4 mi si'8 mi, si4
   
   %13
   mi r si'\tu r
   si r si r8 sold
   la si dod la si si dod sold
   
   %16
   la fad si si, mi4\fermata r
   mi\soli r8 mi\mbreak si4 r
   si' r8 si mi,4 r8 mi
   
   %19
   si4 r si' r8 si
   mi,4 r mi r
   mi8 mi sold mi si si' red si
   
   %22
   lad4 fad si si,
   mi8 mi sold mi si si' red si\mbreak
   lad4 fad si si,
   
   %25
   mi mi, la la'
   re, r mi r
   la, r si r
   
   %28
   mi r la,8 la' dod la
   mi mi sold mi red4 si
   mi mi, la8 la' dod la
   
   %31
   mi mi sold mi\mbreak red4 si
   mi mi, la la'
   re, r si mi
   
   %34
   la, r r2
   R1
   r8 mi' mi mi la la la la
   
   %37
   mi mi mi mi la, la la la
   mi'4\fermata r8 dod8^\tu re mi fad re
   mi mi fad dod\mbreak re si mi mi,
   
   %40
   la4\fermopz  r r2

}

IIbcn = \relative do {
   
   la4 r mi' r
   mi r mi r8 dod
   re  mi fad re mi mi fad dod
   
   %4
   re si mi mi, la la'\soli dod la\mbreak
   sold fad sold mi la dod, red si
   mi dod la si mi mi sold mi
   
   %7
   red dod red si mi sold lad fad
   si sold mi fad si,4 r
   r8 dod red si mi4 r
   
   %10
   r8 fad sold mi\mbreak la4 la,
   si r8 si dod4 r8 la
   si4 mi si'8 mi, si4
   
   %13
   mi r si'\tu r
   si r si r8 sold
   la si dod la si si dod sold
   
   %16
   la fad si si, mi4\fermata r
   mi\soli r8 mi\mbreak si4 r
   si' r8 si mi,4 r8 mi
   
   %19
   si4 r si' r8 si
   mi,4 r mi r
   mi8 mi sold mi si si' red si
   
   %22
   lad4 fad si si,
   mi8 mi sold mi si si' red si\mbreak
   lad4 fad si si,
   
   %25
   mi mi, la la'
   re, r mi r
   la, r si r
   
   %28
   mi r la,8 la' dod la
   mi mi sold mi red4 si
   mi mi, la8 la' dod la
   
   %31
   mi mi sold mi\mbreak red4 si
   mi mi, la la'
   re, r si mi
   
   %34
   la, r r2
   R1
   r8 mi' mi mi la la la la
   
   %37
   mi mi mi mi la, la la la
   mi'4\fermata r8 dod8^\tu re mi fad re
   mi mi fad dod\mbreak re si mi mi,
   
   %40
   la4\fermopz  r r2

}

IIbfnI = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s2 <_+>
  <_+>1
  <9>4 <6> <7 _+> s
  <6 5>1
  <6>2 s4 <5->
  <_+> <7>8 <_+> <_+>2
  s8 <6> s2 <5!>4
  <_+>2 <_+>
  s8 <6> <5!> s <_+>2
  s4 <5!> s2
  <_+> <7>
  <7 _+>4 <_+> <_+> <_+>
  s2 <_+>
  s1
  s2 <7 _+>
  <6 5>1
  <_+>2 <_+>
  <_+> <_+>
  <_+> <_+>
  <_+>1
  <_+>2 <_+>
  s4 <7 _+> <_+>2
  <_+> <_+>
  s4 <7 _+> <_+>2
  <_+>1
  s2 <_+>
  s <_+>
  <_+> s
  <_+>1
  <_+>
  <_+>2 s
  <_+>1
  s2 <6+>
  s1
  s
  s8 <_+> s4 s2
  <_+>1
  s4 s8 <6> <9> s <6>4
  <7 _+> <5> <6 5> <_+>
  
}

IIbfnII = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s2 <_+>
  <_+>1
  <9>4 <6> <7 _+> s
  <6 5>1
  <6>2 s4 <5->
  <_+> <7>8 <_+> <_+>2
  s8 <6> s2 <5!>4
  <_+>2 <_+>
  s8 <6> <5!> s <_+>2
  s4 <5!> s2
  <_+> <7>
  <7 _+>4 <_+> <_+> <_+>
  s2 <_+>
  s1
  s2 <7 _+>
  <6 5>1
  <_+>2 <_+>
  <_+> <_+>
  <_+> <_+>
  <_+>1
  <_+>2 <_+>
  s4 <7 _+> <_+>2
  <_+> <_+>
  s4 <7 _+> <_+>2
  <_+>1
  s2 <_+>
  s <_+>
  <_+> s
  <_+>1
  <_+>
  <_+>2 s
  <_+>1
  s2 <6+>
  s1
  s
  s8 <_+> s4 s2
  <_+>1
  s4 s8 <6> <9> s <6>4
  <7 _+> <5> <6 5> <_+>

}

forma = {

  \key re\major
  \time 4/4
  \tempo 4 = 45
  s1*16
  \once \override Score.RehearsalMark.extra-offset = #'(5 . -2)\mark\markup\italic "Allegro"
  \tempo 2 = 50
  s1*21
  s4 s8\once \override Score.RehearsalMark.extra-offset = #'(5 . -2)\mark\markup\italic"Adagio" \tempo 4 = 45 s s2
  s1*2
  \bar"|."

}

IIvlI = {
  \IIglobal
  %\notypeset
  <<\IIvlIn \forma>>

}

IIvlII = {
  \IIglobal
  <<\IIvlIIn \forma>>

}

IIvlIr = {
  \IIglobal
  <<\IIvlIrn \forma>>

}

IIvlIIr = {
  \IIglobal
  <<\IIvlIIrn \forma>>

}

IIvla = {
  \IIglobal
  \clef alto
  <<\IIvlan \forma>>

}

IIcb = {
  \IIglobal
  \clef bass
  <<\IIcbn \forma\IIbfnI>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfnII>>
  \typeset

}


IIIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}


IIIvlIn =  \relative do'' {
   
   mi8\tu fad sold la si mi, r dod'
   si la sold fad sold fad r si
   sold fad r si sold fad r si
   
   %4
   sold fad mi fad red4 r
   red8 mi fad si, lad dod si lad\mbreak
   si lad r lad si lad r lad
   
   %7
   si lad r lad si mi, fad sold 
   dod, fad'4 mi8 red si fad' si,
   si4 r8 mi sold la si dod
   
   %10
   fad,4 si r8 fad si4
   r8 fad si4 r8 fad si4\mbreak
   r8 la sold fad16 mi red\soli fad mi fad red fad dod fad
   
   %13
   red dod si dod la dod si la sold4 r
   r2 r16 la' sold la mi dod la mi'
   fad re? la fad' sold mi si sold' la mi dod mi la mi la mi\mbreak
   
   %16
   si' mi, re mi si' mi,  si' mi, dod'4 r
   R1
   r2 la,8\tu si dod re
   
   %19
   mi la, r fad' mi re dod si
   dod si r mi dod si r mi 
   dod si r mi dod si la si
   
   %22
   sold4 r sold'8 la si mi,\mbreak
   red fad mi red mi red r red
   mi red r red mi red r red
   
   %25
   mi la, si dod  fad, si'4 la8
   sold mi, sold mi mi4 r8 la
   dod re? mi fad si,4 mi
   
   %28
   r8 si mi4 r8 si mi4\mbreak
   r8 si mi4 r8 re dod si16 la
   sold8 mi'4 re8 dod la mi' la,
   
   %31
   r8 re'4\parenthesize \soli dod8 si la sol fad
   mi4. mi8 re dod si la
   sold? mi'4 fad sold la8~
   
   %34
   la sold fad si sold mi fad si,
   r mi4 re8\mbreak dod la mi' la,
   re dod si la sold mi'4 re8
   
   %37
   dod si la sold fad4 sold
   lad si lad8 si4 lad8
   si si'4 la8 sold fad mi re
   
   %40
   dod la mi' la, re dod si la
   sold mi'4 fad sold la8~
   la sold fad si\mbreak sold la4 sold8
   
   %43
   la sold fad mi red mi4 red8
   mi fad sold la si mi, r dod'
   si la sold fad sold fad r si
   
   %46
   sold fad r si sold fad r si
   sold fad mi fad red4 r
   red8 mi fad si,\mbreak lad dod si lad
   
   %49
   si lad r lad si lad r lad
   si lad r lad si mi, fad sold
   dod, fad'4 mi8 red si fad' si,
   
   %52
   si4 r8 mi sold la si dod
   fad,4 si r8 fad si4
   r8 fad si4\mbreak r8 fad si4
   
   %55
   r8 la sold fad16 mi red8 si'\soli fad si
   red, fad si, red fad, red' fad red
   r si red fad, r si' fad sold
   
   %58
   la16(sold) la(sold) la8 si16(la) sold(fad) sold(fad) sold8 la16 sold\mbreak
   fad mi red dod si dod red mi fad mi red dod si dod red mi
   fad8 red fad si, fad' red fad si,
   
   %61
   r16 fad' mi fad si, fad' mi fad sold la sold fad mi sold fad mi
   red8 si fad' si,\mbreak mi si sold' si,
   fad'16 sold fad sold fad sold fad sold la si la si la si la si
   
   %64
   sold la sold la sold la sold la fad sold fad sold la sold la sold
   fad sold fad sold la sold la sold\mbreak fad8 fad si4~
   si16\tu sold fad mi la4~la16 fad mi red sold4~
   
   %67
   sold16 mi red dod fad4~fad16 red dod si mi8 si
   dod si la dod sold4(fad\tr)
   mi\fermata r r2

}

IIIvlIIn = \relative do'' {
   
   R1*3
   r2 si8 dod red mi
   fad si, r sold' fad mi red dod
   
   %6
   red dod r fad red dod r fad
   red dod r fad red dod si dod\mbreak
   lad fad dod' fad, r si'4 la?8
   
   %9
   sold la si dod si la sold fad16 mi
   red8 fad mi red mi red r red
   mi red r red mi red r red
   
   %12
   mi la, si dod\mbreak si4 r
   r2 r16 si'\soli la si sold si fad si
   sold fad mi fad re! fad mi re dod4 r
   
   %15
   R1
   r2 r16 la' sold la mi dod la mi'
   fad re la fad' sold mi si sold'\mbreak la mi dod mi la mi la mi
   
   %18
   si' mi, re mi si' mi, si' mi, dod'4 r
   R1*3
   mi,8 fad sold la si mi, r dod'
   
   %23
   si la sold fad sold fad r si\mbreak
   sold fad r si sold fad r si
   sold fad mi fad red si fad' si, 
   
   %26
   r mi4 re!8 dod re mi fad
   mi re dod si16 la sold8 si la sold
   la sold r sold' la sold r sold\mbreak
   
   %29
   la sold r sold la re, mi fad
   mi sold, si mi, r la'4 sold8
   fad4 r r2
   
   %32
   r8 la4\soli sold!8 fad mi re dod 
   si4 dod red mi
   red8 mi4 red8 mi si'4 la8\mbreak
   
   %35
   sold sold, si mi, r la'4 sold8
   fad mi re? dod si sold' si, si'
   la sold fad mi red si4 dod8~
   
   %38
   dod red4 mi8~mi red dod fad
   red si fad' si, mi re dod si
   la la'4 sold8 fad mi re dod
   
   %41
   si4 dod red mi
   red8 mi4 re8~re dod si mi
   dod si la sold fad sold fad4\tr
   
   %44
   mi r r2
   R1*2\mbreak
   r2 si'8 dod red mi
   
   %48
   fad si, r sold' fad mi red dod
   red dod r fad red dod r fad
   red dod r fad red dod si dod\mbreak
   
   %51
   lad fad dod' fad, r si'4 la8
   sold la si dod si la sold fad16 mi
   red8 fad mi red mi red r red
   
   %54
   mi red r red\mbreak mi red r red
   mi la, si dod si4 r
   r2 r8 fad'\soli red fad
   
   %57
   si, red fad, si red, fad' red mi\mbreak
   fad16(mi) fad(mi) fad8 sold16(fad) mi(red) mi(red) mi8 fad16(mi)
   red8 fad red si red fad red si
   
   %60
   la'16 sold fad mi red mi fad sold\mbreak la sold fad mi red mi fad sold
   la8 si, fad' si, mi si sold' si,
   r16 fad' mi fad si, fad' mi fad sold la sold fad mi sold fad mi\mbreak
   
   %63
   red mi red mi red mi red mi fad sold fad sold fad sold fad sold
   mi fad mi fad mi fad mi fad red mi red mi fad mi fad mi
   red mi red mi fad mi fad mi\mbreak red4 r8 red\tu
   
   %66
   mi4 r16 dod si la red4 r16 si la sold
   dod4 r16 la sold fad si4 r8 sold
   la red, mi2 red4
   
   %69
   mi\fermopz r r2
   
}


IIIvlIrn =  \relative do'' {
   
   mi8\tu fad sold la si mi, r dod'
   si la sold fad sold fad r si
   sold fad r si sold fad r si
   
   %4
   sold fad mi fad red4 r
   red8 mi fad si, lad dod si lad\mbreak
   si lad r lad si lad r lad
   
   %7
   si lad r lad si mi, fad sold 
   dod, fad'4 mi8 red si fad' si,
   si4 r8 mi sold la si dod
   
   %10
   fad,4 si r8 fad si4
   r8 fad si4 r8 fad si4\mbreak
   r8 la sold fad16 mi red4 r
   
   %13
   R1*5
   r2 la8\tu si dod re
   
   %19
   mi la, r fad' mi re dod si
   dod si r mi dod si r mi 
   dod si r mi dod si la si
   
   %22
   sold4 r sold'8 la si mi,\mbreak
   red fad mi red mi red r red
   mi red r red mi red r red
   
   %25
   mi la, si dod  fad, si'4 la8
   sold mi, sold mi mi4 r8 la
   dod re? mi fad si,4 mi
   
   %28
   r8 si mi4 r8 si mi4\mbreak
   r8 si mi4 r8 re dod si16 la
   sold8 mi'4 re8 dod la mi' la,
   
   %31
   R1*13
   mi'8 fad sold la si mi, r dod'
   si la sold fad sold fad r si
   
   %46
   sold fad r si sold fad r si
   sold fad mi fad red4 r
   red8 mi fad si,\mbreak lad dod si lad
   
   %49
   si lad r lad si lad r lad
   si lad r lad si mi, fad sold
   dod, fad'4 mi8 red si fad' si,
   
   %52
   si4 r8 mi sold la si dod
   fad,4 si r8 fad si4
   r8 fad si4\mbreak r8 fad si4
   
   %55
   r8 la sold fad16 mi red4 r
   R1*9
   r2 r8 fad si4~
   si16\tu sold fad mi la4~la16 fad mi red sold4~
   
   %67
   sold16 mi red dod fad4~fad16 red dod si mi8 si
   dod si la dod sold4(fad\tr)
   mi\fermata r r2

}

IIIvlIIrn = \relative do'' {
   
   R1*3
   r2 si8 dod red mi
   fad si, r sold' fad mi red dod
   
   %6
   red dod r fad red dod r fad
   red dod r fad red dod si dod\mbreak
   lad fad dod' fad, r si'4 la?8
   
   %9
   sold la si dod si la sold fad16 mi
   red8 fad mi red mi red r red
   mi red r red mi red r red
   
   %12
   mi la, si dod\mbreak si4 r
   R1*9
   mi8 fad sold la si mi, r dod'
   
   %23
   si la sold fad sold fad r si\mbreak
   sold fad r si sold fad r si
   sold fad mi fad red si fad' si, 
   
   %26
   r mi4 re!8 dod re mi fad
   mi re dod si16 la sold8 si la sold
   la sold r sold' la sold r sold\mbreak
   
   %29
   la sold r sold la re, mi fad
   mi sold, si mi, r la'4 sold8
   fad4 r r2
   
   %32
   R1*15
   r2 si,8 dod red mi
   
   %48
   fad si, r sold' fad mi red dod
   red dod r fad red dod r fad
   red dod r fad red dod si dod\mbreak
   
   %51
   lad fad dod' fad, r si'4 la8
   sold la si dod si la sold fad16 mi
   red8 fad mi red mi red r red
   
   %54
   mi red r red\mbreak mi red r red
   mi la, si dod si4 r
   R1*9
   r2 r4 r8 red\tu
   
   %66
   mi4 r16 dod si la red4 r16 si la sold
   dod4 r16 la sold fad si4 r8 sold
   la red, mi2 red4
   
   %69
   mi\fermopz r r2

}

IIIvlan = \relative do'{
   
   R1*8
   mi8 fad sold la si8 mi, r dod'
   si la sold fad sold fad r si
   
   %11
   sold fad r si sold fad r si
   sold fad mi fad fad4 r
   R1*6
   
   %19
   dod'8\tu re mi la,\mbreak sold si la sold
   la sold r sold la sold r sold
   la sold r sold la re, mi fad
   
   %22
   si,4 r r2
   R1*3 
   r2 la'8 si dod re
   
   %27
   mi la, r fad' mi re dod si
   dod si r mi dod si r mi\mbreak 
   dod si r mi dod si la si
   
   %30
   si4 sold mi dod
   la r r2
   R1*12
   
   %44
   r2 sold'8 la si mi,
   red fad mi red mi red r red
   mi red r red mi red r red\mbreak
   
   %47
   mi la si dod fad,4 r
   R1*4
   mi8 fad sold la si mi, r dod'
   
   %53
   si la sold fad sold fad r si
   sold fad r si sold fad r si
   sold fad mi fad fad4 r
   
   %56
   R1*9
   r2 r4 fad8 si\tu\mbreak
   sold la r la fad sold r sold
   
   %67
   mi fad r fad red mi r mi
   mi red dod mi si2
   si4\fermopz r r2
 
}

IIIcbn = \relative do {
   
   mi4\soli r mi8 fad sold la
   si4 r8 si mi, si' red, si
   mi si' red, si mi si' red, si 
   
   %4
   mi fad sold la si4 r\mbreak
   si,8 dod red mi fad4 r8 fad
   si, fad' lad fad si, fad' lad fad
   
   %7
   si, fad' lad fad si, dod red mi
   fad4 lad si red,
   mi\tu r mi8 fad sold la
   
   %10
   si4 r8 si\mbreak mi, si' red, si
   mi si' red, si mi si' red, si
   mi fad sold la si4 r8 lad\soli
   
   %13
   si si, dod red mi4 r8 red
   mi mi fad sold la4 r8 la
   re,4 mi dod la
   
   %16
   sold mi' la, r8 la'\mbreak
   re,4 mi dod la
   sold mi' la, r
   
   %19
   la8\tu si dod re mi4 r8 mi
   la,8 mi' sold mi la, mi' sold mi
   la, mi' sold mi la, si dod re
   
   %22
   mi4 r mi8 fad sold la
   si4 r8 si mi, si' red, si\mbreak
   mi si' red, si mi si' red, si
   
   %25
   mi fad sold la si4 red,
   mi sold la r
   la,8 si dod re mi4 r8 mi
   
   %28
   la, mi' sold mi la, mi' sold mi
   la, mi' sold mi la, si dod re\mbreak
   mi4 sold la dod,
   
   %31
   re fad\soli sol sol,
   la dod re re,
   mi'8 sold? la la, si si' dod dod,
   
   %34
   si mi la, si mi4 red
   mi sold la dod,
   re re, mi' sold
   
   %37
   la la, si8 red mi4\mbreak
   fad sold fad8 si mi, fad
   si,4 red mi sold
   
   %40
   la dod, re re,
   mi'8 sold la la, si si' dod dod,
   si mi la, si mi la re, mi
   
   %43
   la,4 r8 la si mi la, si
   mi4 r\mbreak mi8\tu fad sold la
   si4 r8 si mi, si' red, si
   
   %46
   mi si' red, si mi si' red, si
   mi fad sold la si4 r
   si,8\soli dod red mi fad4 r8 fad
   
   %49
   si, fad' lad fad si, fad' lad fad\mbreak
   si, fad' lad fad si, dod red mi
   fad4 lad si red,
   
   %52
   mi\tu r mi8 fad sold la
   si4 r8 si mi, si' red, si
   mi si' red, si mi si' red, si
   
   %55
   mi fad sold la si2\soli\mbreak
   si1~\tasto
   si~
   
   %58
   si~
   si~
   si~
   
   %61
   si~
   si~
   si~
   
   %64
   si~
   si2~si4 r8 si\tu 
   dod4 r8 la si4 r8 sold
   
   %67
   la4 r8 fad sold4 r8 mi
   la, si dod la si2
   mi4\fermopz r r2
   
}

IIIbcn = \relative do {
   
   mi4\soli r mi8 fad sold la
   si4 r8 si mi, si' red, si
   mi si' red, si mi si' red, si 
   
   %4
   mi fad sold la si4 r\mbreak
   si,8 dod red mi fad4 r8 fad
   si, fad' lad fad si, fad' lad fad
   
   %7
   si, fad' lad fad si, dod red mi
   fad4 lad si red,
   mi\tu r mi8 fad sold la
   
   %10
   si4 r8 si\mbreak mi, si' red, si
   mi si' red, si mi si' red, si
   mi fad sold la si4 r8 lad\soli
   
   %13
   si si, dod red mi4 r8 red
   mi mi fad sold la4 r8 la
   re,4 mi dod la
   
   %16
   sold mi' la, r8 la'\mbreak
   re,4 mi dod la
   sold mi' la, r
   
   %19
   la8\tu si dod re mi4 r8 mi
   la,8 mi' sold mi la, mi' sold mi
   la, mi' sold mi la, si dod re
   
   %22
   mi4 r mi8 fad sold la
   si4 r8 si mi, si' red, si\mbreak
   mi si' red, si mi si' red, si
   
   %25
   mi fad sold la si4 red,
   mi sold la r
   la,8 si dod re mi4 r8 mi
   
   %28
   la, mi' sold mi la, mi' sold mi
   la, mi' sold mi la, si dod re\mbreak
   mi4 sold la dod,
   
   %31
   re fad\soli sol sol,
   la dod re re,
   mi'8 sold? la la, si si' dod dod,
   
   %34
   si mi la, si mi4 red
   mi sold la dod,
   re re, mi' sold
   
   %37
   la la, si8 red mi4\mbreak
   fad sold fad8 si mi, fad
   si,4 red mi sold
   
   %40
   la dod, re re,
   mi'8 sold la la, si si' dod dod,
   si mi la, si mi la re, mi
   
   %43
   la,4 r8 la si mi la, si
   mi4 r\mbreak mi8\tu fad sold la
   si4 r8 si mi, si' red, si
   
   %46
   mi si' red, si mi si' red, si
   mi fad sold la si4 r
   si,8\soli dod red mi fad4 r8 fad
   
   %49
   si, fad' lad fad si, fad' lad fad\mbreak
   si, fad' lad fad si, dod red mi
   fad4 lad si red,
   
   %52
   mi\tu r mi8 fad sold la
   si4 r8 si mi, si' red, si
   mi si' red, si mi si' red, si
   
   %55
   mi fad sold la si2\soli\mbreak
   si1~\tasto
   si~
   
   %58
   si~
   si~
   si~
   
   %61
   si~
   si~
   si~
   
   %64
   si~
   si2~si4 r8 si\tu 
   dod4 r8 la si4 r8 sold
   
   %67
   la4 r8 fad sold4 r8 mi
   la, si dod la si2
   mi4\fermopz r r2

}

IIIbfnI = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s1
  <_+>1
  s
  s2 <_+>
  <_+> <_+>
  <_+>8 <_+> s4 <_+>2
  <_+>1
  <_+>2 <_+>
  s1
  <_+>
  s
  s2 <_+>
  <_+>4 <6> s2
  s4 <6!> s2
  s <6>
  s1*7
  <_+>1
  s
  s2 <_+>4 <6>8 <5!>
  s4 <6>8 <5!> s2
  s1*3
  s4 <6>8 <5!> s4 <6>8 <5!>
  s1*2
  s4 <5>8 <6> <5> <6> <5> <6>
  <7 _+>4 <5> s2
  s1*2
  s2 <_+>4 <5>8 <6>
  <5> <6+> <5> <6> <7> <_+> <6 5> <_+>
  <_+>1
  s
  s4 <5>8 <6> <5> <6> <5> <6>
  <7 _+>4 <6 5> <7> s
  s2 <_+>
  s1
  <_+>
  s
  s2 <_+>
  s <_+>
  <_+>8 <_+> s <_+> <_+> <_+> s4
  <_+>8 <_+> s4 s2
  <_+> <_+>
  s1
  <_+>2 s8 <_+> s4
  s1*12
  <7>2 <7>
  <7> <7>
  s8 <_+> <6>4 <6 4> <5 3+>

}

IIIbfnII = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown
  
  s1
  <_+>1
  s
  s2 <_+>
  <_+> <_+>
  <_+>8 <_+> s4 <_+>2
  <_+>1
  <_+>2 <_+>
  s1
  <_+>
  s
  s2 <_+>
  <_+>4 <6> s2
  s4 <6!> s2
  s <6>
  s1*7
  <_+>1
  s
  s2 <_+>4 <6>8 <5!>
  s4 <6>8 <5!> s2
  s1*3
  s4 <6>8 <5!> s4 <6>8 <5!>
  s1*2
  s4 <5>8 <6> <5> <6> <5> <6>
  <7 _+>4 <5> s2
  s1*2
  s2 <_+>4 <5>8 <6>
  <5> <6+> <5> <6> <7> <_+> <6 5> <_+>
  <_+>1
  s
  s4 <5>8 <6> <5> <6> <5> <6>
  <7 _+>4 <6 5> <7> s
  s2 <_+>
  s1
  <_+>
  s
  s2 <_+>
  s <_+>
  <_+>8 <_+> s <_+> <_+> <_+> s4
  <_+>8 <_+> s4 s2
  <_+> <_+>
  s1
  <_+>2 s8 <_+> s4
  s1*12
  <7>2 <7>
  <7> <7>
  s8 <_+> <6>4 <6 4> <5 3+>

}

forma = {

  \key la\major
  \time 4/4
  \tempo 2 = 55
  s1*69
  \bar"|."

}

IIIvlI = {
  \IIIglobal
  %\notypeset
  <<\IIIvlIn \forma>>

}

IIIvlII = {
  \IIIglobal
  <<\IIIvlIIn \forma>>

}

IIIvlIr = {
  \IIIglobal
  <<\IIIvlIrn \forma>>

}

IIIvlIIr = {
  \IIIglobal
  <<\IIIvlIIrn \forma>>

}

IIIvla = {
  \IIIglobal
  \clef alto
  <<\IIIvlan \forma>>

}

IIIcb = {
  \IIIglobal
  \clef bass
  <<\IIIcbn \forma\IIIbfnI>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfnII>>
  \typeset

}
#(set-global-staff-size 15.5)


\pointAndClickOff

\paper  {

   systems-per-page = #3
   print-first-page-number = ##t
   first-page-number = #2

}

\header {
   title = \markup\smaller\column {"Concerto terzo con due Violini, che concertano soli [Op. VIII/3]""  "}
   composer = \markup \center-column{"G. Torelli (1658 - 1709)"}
}

\markup\huge"[1.] Vivace"

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
   }<<

      \new PianoStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Primo del"\vspace #-0.2"Concertino"}
            \set Staff.midiInstrument = #"violin"
            \IvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Secondo del"\vspace #-0.2"Concertino"}
            \set Staff.midiInstrument = #"violin"
            \IvlII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column\small{"Alto Viola"}
            \set Staff.midiInstrument = #"viola"
            \Ivla
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column\small{"Violone ò"\vspace #-0.2"Arcileuto"}
            \set Staff.midiInstrument = #"contrabass "
            \Icb
         >>
      >>

      \new PianoStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Primo di"\vspace #-0.2"rinforzo"}
            \set Staff.midiInstrument = #"violin"
            \IvlIr
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup  \center-column\small{"Violino"\vspace #-0.2"Secondo di"\vspace #-0.2"rinforzo"}
            \set Staff.midiInstrument = #"violin"
            \IvlIIr
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column\small{"Organo"}
            \set Staff.midiInstrument = #"church organ"
            \Ibc
         >>
      >>
   >>

   \layout {

      indent = 2\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #0.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
         %\override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge"[2.] Largo - Allegro - Largo"

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
   }<<

      \new PianoStaff <<

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"contrabass "
            \IIcb
         >>
      >>

      \new PianoStaff <<

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlIr
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlIIr
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"church organ"
            \IIbc
         >>
      >>
   >>

   \layout {

      indent = 1\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #0.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
         %\override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge"[3.] Allegro"

\score {

   \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
   }<<

      \new PianoStaff <<

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlI
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlII
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"contrabass "
            \IIIcb
         >>
      >>

      \new PianoStaff <<

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlIr
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlIIr
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"church organ"
            \IIIbc
         >>
      >>
   >>

   \layout {

      indent = 1\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #0.5
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
         \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
         %\override SpacingSpanner.uniform-stretching = ##t
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
