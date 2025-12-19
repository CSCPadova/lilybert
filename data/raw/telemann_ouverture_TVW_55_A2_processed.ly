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

quarto = \tupletSpan 4

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


Iglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \quarto \senza
}

IvlIn = \relative do'' {

  mi4. dod8 re8.[mi16 fad8. sol16]
  mi4. la8 sold!4. fad8
  mi4. fad8 mi8.[la16 sold8. fad16]

  %4
  mi8.[re16 dod8. re16] re4. dod8
  dod2 mi4. mi8
  la4. la8 la4. sold8

  %7
  fad2 fad4. fad8
  si4. si8 si4. la8
  sold4. la8\mbreak sold8.[fad16 mi8. red16]

  %10
  mi4 dod fad4. fad8
  fad4. mi8 mi4 red8 mi
  red2-+ si4. si8

  %13
  mi2 mi,4. mi8
  si'4. sold8 la8.[si16 dod8. re16]
  si4. mi8 red4.-+ dod8

  %16
  si4. dod8 si8.[mi16 red8. dod16]
  si8.[la16 sold8. la16] la4. sold8\mbreak
  sold8. mi32 fad sold8. sold32 la si8. si32 dod red8. dod32 red

  %19
  mi8. dod32 red mi8. mi32 fad sold8. mi32 fad sold8. sold32 la
  si2 fad4. sold16 \parentSlur (la)
  sold4.-+ fad8 fad4. mi8

  %22
  mi1 mi2 mi4 mi
  fad fad sold la  %%% OK

  %24
  mi fad8 sold la4 dod,
  re re mi fad\mbreak
  dod si8(la) mi'4 mi

  %27
  mi4. fad8 mi fad mi fad
  mi4. fad8 mi fad mi fad
  mi fad sold mi la4 sold

  %30
  fad8 sold la fad si4 si
  si la sold fad8 sold
  la4 fad dod dod

  %33
  re re mi fad
  dod2 re8 mi dod re
  si dod re mi dod re si dod

  %36
  la dod si dod re mi dod re\mbreak
  si dod re  mi dod re si dod
  la4 dod fad4. fad8

  %39
  fad4. sold8 sold4.-+ fad8
  fad2 fad4 fad
  sold sold la si

  %42
  fad sold8 la si4 fad
  sold sold la si
  fad2-+ sold8 la fad sold

  %45
  mi fad sold la fad sold mi fad
  red fad  mi fad sold la fad sold
  mi fad sold la fad sold mi fad\mbreak

  %48
  red2 mi8 fad sold la
  si4 la8 sold fad4. mi8
  mi2 si4 dod

  %51
  re mi8 fad mi4 re8 dod
  re4 si sol'4. fad8
  mi4. re8 dod4. si8

  %54
  lad4 fad fad' fad
  fad4. sol8 fad sol fad sol
  fad4. sol8 fad sol fad sol

  %57
  fad sol fad sol fad sol fad sol\mbreak
  fad4 sol?8 lad si4 si,
  re4. dod8 dod4. si8

  %60
  si2 si4 si
  dod dod re mi
  si dod8 re mi4 si

  %63
  dod dod re mi
  si2-+ dod8 re si dod
  la si dod re si dod la si

  %66
  sold si la si dod re si dod
  la si dod re si dod la si
  sold si dod re mi4 mi\mbreak

  %69
  fad fad sold la
  mi fad8 sold la4 dod,
  re re mi fad

  %72
  dod si8(la) si4 dod
  re re re dod
  si8 dod re mi fad sol mi fad

  %75
  re mi fad sol mi fad re mi
  dod mi fad sold! la si sold la
  fad sold la si sold la fad la

  %78
  sold4 mi si si
  dod dod re mi\mbreak
  si dod8 re mi4 si

  %81
  dod dod re mi
  si2-+ mi4 mi
  mi4. fad8 mi fad mi fad

  %84
  mi4. fad8 mi fad mi fad
  mi fad mi fad mi fad mi fad
  mi4 fad8 sold la4 la,

  %87
  dod4. si8 si4. la8
  la dod re mi fad4. fad8
  fad2 mi4. mi8

  %90
  mi2 re4. re8
  re2\mbreak dod8 re si dod
  la si dod re mi fad sold mi

  %93
  la4 sold8 fad  mi4 re
  dod4. si8 si4. la8
  la4. la8 si8.[dod16 re8. mi16]

  %96
  dod4. dod8 re8.[mi16 fad8. sold16]
  mi4. mi8 mi8.[fad16 sol8. la16]
  fad4. mi8 mi4.-+ re8

  %99
  re2 la4. la8
  re4. re8 re4. dod8\mbreak
  si2 si4. si8

  %102
  mi4. mi8 mi4. mi8
  dod4. re8 dod8. si16 la8. sold16
  la4 fad fad'4. fad8

  %105
  fad4. sold8 la4 (sold8) la
  sold8. si32 la sold8. sold32 fad mi8. sold32 fad mi8. mi32 re
  dod8. mi32 re dod8. dod32 si la8. dod32 si la8. la32 sold

  %108
  fad4. la8 re4. dod16 si
  mi4. fad8 si,4. la8\mbreak
  la2 mi'4 mi  la,1

}


IvlIIn = \relative do'' {

  dod4. la8 la4 re
  dod4. dod8 si4. si8
  dod4. la8 la8.[dod16 si8. si16]
  
  %4
  dod4. la8 la4 sold
  la2 dod4. dod8
  fad4. fad8 fad4. mi8
  
  %7
  red2 red4. red8
  sold4. sold8 sold4. fad8
  mi2\mbreak red4. red8
  
  %10
  dod2 dod4. dod8
  si2 dod4. dod8
  fad,2 fad4. fad8
  
  %13
  mi2 mi4. mi8
  mi4. mi8 mi4 la
  sold4. sold8 fad4. fad8
  
  %16
  sold4. mi8 mi8.[sold16 fad8. fad16]
  sold4. mi8 mi4 red\mbreak
  mi2 fad4. fad8
  
  %19
  sold2 mi'4. mi8
  mi2 red4. mi16(fad)
  mi4. red8 red4. si8
  
  %22
  si1 si2 r
  R1
  r2 la4 la
  
  %25
  si si dod re\mbreak
  la2 sold4 sold
  la la si dod
  
  %28
  sold2 dod4 dod
  mi mi fad mi
  red8 mi fad red sold4 fad
  
  %31
  mid fad mid2
  fad4 la, fad la
  fad fad si la
  
  %34
  sold2 la4 la
  si si fad fad
  fad2 la4 la\mbreak
  
  %37
  si si fad fad
  fad sold la4. la8
  re4. re8 dod4. dod8
  
  %40
  dod2 red4 red
  mi mi fad sold
  red mi fad red
  
  %43
  mi mi fad sold
  red2 red4 red
  mi mi si si
  
  %46
  si2 red4 red
  mi mi si si\mbreak
  si2 si4 red
  
  %49
  mi fad8 mi red4. si8
  si2 sold4 lad
  si dod8 re dod4  si8 lad
  
  %52
  si2 si4 lad
  si2 mi,4 sol
  fad2 lad4 lad
  
  %55
  si si dod re
  lad2 lad4 lad
  si si dod re\mbreak
  
  %58
  lad dod fad, si
  si4. lad8 lad4. fad8
  fad2 sold!4 sold
  
  %61
  la la si dod
  sold la si sold
  la la si dod
  
  %64
  sold2 sold4 sold
  la la mi mi
  mi2 sold4 sold
  
  %67
  la la mi mi
  mi2 r\mbreak
  R1
  
  %70
  r2 la4 la
  si si dod re
  la2 sold4 sold
  
  %73
  la la si la
  sold2 dod4 dod
  re re la la
  
  %76
  la2 la4 mi'
  red mi mi red
  mi si sold sold
  
  %79
  la la si dod\mbreak
  sold la si sold
  la la si dod
  
  %82
  sold2 sold4 sold
  la la si dod
  sold2 sold4 sold
  
  %85
  la la si dod
  sold si mi, la
  la4. sold8 sold4. la8
  
  %88
  la2 la4. la8
  sold2 sold4. sold8
  fad2 fad4. fad8
  
  %91
  mi2\mbreak mi4. mi8
  fad sold la si sold la si sold
  la2. la4
  
  %94
  la4. sold8 sold4. la8
  la4. mi8 mi4 si'
  la4. la8 la4 la
  
  %97
  la4. la8 la4 mi'
  re4. dod8 dod4.-+ la8
  la2 fad4. fad8
  
  %100
  si4. si8 si4. la8\mbreak
  sold2 sold4. sold8
  dod4. dod8 dod4. si8
  
  %103
  la2 sold4. sold8
  fad2. dod'4
  si2 fad'4. fad8
  
  %106
  mi2 si4. si8
  la2 mi4. mi8
  re4. fad8 si4. si8
  
  %109
  si4 la sold4. mi8\mbreak
  mi2 r mi1

}

Ivlan = \relative do' {
  
  la'4. mi8 re4 la'
  la4. mi8 mi4. fad8
  la4. re,8 mi8.[mi16 mi8. fad16]
  
  %4
  la4. la8 fad4 mi
  mi2 la4. la8
  dod2 dod4. la8
  
  %7
  si2 si4. si8
  red2 red4. si8
  dod2\mbreak sold4. sold8
  
  %10
  sold4 mi fad4. lad8
  sold2 fad4. fad8
  fad2 red4. red8
  
  %13
  si2 dod4. dod8
  si4. si8 la4 mi'
  mi4. si8 si4. si8
  
  %16
  mi4. la,8 si8.[si16 si8. dod16]
  mi4. mi8 dod4 si\mbreak
  si2 si4. si8
  
  %19
  mi2 dod4. dod8
  si2 si'4. si8
  si4 dod si4. si8
  
  %22
  sold1 sold2 r
  R1*3
  r2 mi4 mi
  
  %27
  fad fad sold la
  mi2 la4 la
  la mi si' si
  
  %30
  si2 red4 red
  sold, dod dod dod
  dod2 fad,4 fad
  
  %33
  fad fad sold dod,
  dod2 fad4 fad
  fad fad dod re
  
  %36
  dod2 fad4 fad\mbreak
  fad fad dod re
  dod2 re4. re8
  
  %39
  fad4. fad8 mid4. dod8
  la'2 fad4 si
  si2. mi,4
  
  %42
  si'2 red4 si
  si2. mi,4
  si'2 si4 si
  
  %45
  si si la sold
  fad2 si4 si
  si si la sold\mbreak
  
  %48
  fad2 mi4 fad
  mi dod' fad, si
  sold2 mi4 mi
  
  %51
  fad fad sol fad
  fad re  mi dod
  si2 dod4 mi
  
  %54
  dod2 dod4 dod
  si si fad' si,
  dod2 dod4 dod
  
  %57
  si si fad' si,\mbreak
  dod2 re4 mi
  fad2 fad4 fad
  
  %60
  re2 si4 mi
  mi2. dod4
  mi2 sold!4 mi
  
  %63
  mi2. la,4
  mi'2 mi4 mi
  mi mi re dod
  
  %66
  si2 mi4 mi
  mi mi re dod
  si2 la4 dod\mbreak
  
  %69
  re re mi fad
  dod2 r
  R1
  
  %72
  r2 mi4 mi
  fad fad sold la
  mi2 la4 la
  
  %75
  la la mi fad
  mi2 fad4 si
  si si mi, si'
  
  %78
  si sold mi mi
  mi2. la,4\mbreak
  mi'2 sold4 mi
  
  %81
  mi2. la,4
  mi'2 si4 si
  la la mi' la,
  
  %84
  si2 si4 si 
  la la mi' la,
  si2 dod4 re
  
  %87
  mi2 mi4 mi
  dod2 re4. re8
  re4 si dod4. dod8
  
  %90
  dod4 la si4. si8
  si4 sold\mbreak la si
  dod la si4. mi8
  
  %93
  mi2. fad4
  mi2 mi
  dod4. dod8 mi4 mi
  
  %96
  mi4. mi8 re4 re
  mi4. mi8 la4 la
  la si la4. la8
  
  %99
  fad2 re4. re8
  fad2 fad4. re8\mbreak
  mi2 mi4. mi8
  
  %102
  sold2 sold4. mi8
  fad2 sold4. sold8
  dod,2. dod4
  
  %105
  fad2 red4. red8
  si2 mi4. mi8
  mi2 la,4. la8
  
  %108
  la4. re8 fad4. fad8
  si,4 la8. la16 mi'4. mi8\mbreak
  dod2 r dod1
  
}

Ibcn = \relative do {

  la'4. la8 fad4 re
  la'4. la8 mi'4. re8
  dod4. re8 dod8.[la16 mi'8. re16]

  %4
  dod8. si16 la4 si mi,
  la4. la8 la4. sold8
  fad2 fad4. fad8

  %7
  si4. si8 si4. la8
  sold2 sold4. sold8
  dod2\mbreak sid4. sid8

  %10
  dod4. si?8 lad4 fad
  sold2 lad4.-+ sold16 lad
  si4. la!8 la4(sold8) la

  %13
  sold8. sold32 fad mi8. mi32 red dod8. mi32 red dod8. si32 la
  sold4. mi'8 dod4 la
  mi'4. mi8 si'4. la8

  %16
  sold4. la8 sold8.[mi16 si'8. la16]
  sold4 dod, fad si,\mbreak
  mi2 red4. red8

  %19
  dod2 dod'4. dod8
  sold8. mi32 fad sold8. sold32 la si8. si32 dod red8. dod32 si
  mi4 la, si si,

  %22
  mi4. re'!8 dod8.[si16 dod8. sold16] mi2 r
  R1*5
  r2 la4 la

  %29
  dod dod red mi
  si2 sold8 la si sold
  dod4 fad, dod' dod,

  %32
  fad fad8 sold la4 fad
  si la sold fad
  mid2 fad4 fad

  %35
  sold sold la si
  fad2 fad4 fad\mbreak
  sold sold la si

  %38
  fad8 sold mi fad re mi dod re
  si dod la si dod4 dod,
  fad sold8 la si4 si

  %41
  si1~
  si2 si4 si
  si1~

  %44
  si2 si'4 si
  dod dod red mi
  si2 si4 si

  %47
  dod dod red mi\mbreak
  la,2 sold4 fad
  sold la si si,

  %50
  mi2 re4 dod
  si si' mi, fad
  si si, mi fad

  %53
  sol fad sol mi
  fad2 fad4 fad
  sol sol la si

  %56
  fad2 fad4 fad
  sol sol la si\mbreak
  fad mi re sol

  %59
  fad mi fad fad,
  si dod8 re mi4 mi
  mi1~

  %62
  mi2 mi4 mi
  mi1~
  mi2 mi4 mi

  %65
  fad fad sold la
  mi2 mi4 mi
  fad fad sold la

  %68
  re,2 dod4 la\mbreak
  re2 r4 si
  la'2 r

  %71
  R1*3
  r2 la4 la
  si si dod re

  %76
  la2 fad4 sold
  la sold la si
  mi, mi, mi' mi

  %79
  mi1~\mbreak
  mi2 mi,4 mi
  mi1~

  %82
  mi2 mi'4 mi
  fad fad sold la
  mi2 mi4 mi

  %85
  fad fad sold la
  mi re dod fad
  mi re mi mi,

  %88
  la2 re'8 mi dod re
  si dod re mi dod re si dod
  la si dod re si dod la si

  %91
  sold la si dod\mbreak la si sold la
  fad2 mi4. re8
  dod2. re4

  %94
  mi2 mi,
  la4. la'8 sold4 mi
  la4. la8 fad4 re

  %97
  dod4. dod8 dod4 la
  re sol la la,
  re4. re8 re4. dod8

  %100
  si2 si4. si8\mbreak
  mi4. mi8 mi4. re8
  dod2 dod4. dod8

  %103
  fad2 mid4. mid8
  fad2. mi!4
  red2 si4. si8

  %106
  mi2 sold4. sold8
  la2 dod,4. dod8
  re8. fad32 mi re8. re32 dod si8. re32 dod si8. si32 la

  %109
  sold8.[mi16 la8. re,16] mi2\mbreak
  la2 r la1

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key la\major
  \time 4/4
  \tempo 2 = 55
  \repeat volta 2 {s1*21}
  \alternative {{s1}{\time 2/2\once \numericTimeSignature \tempo 1 =55 s}}\break
  \set Score.currentBarNumber = #23
  \repeat volta 2 {
    s1*72\break
    \time 2/2
    \tempo 2 = 55 s1*15
  }
  \alternative {{\time 2/2\once \numericTimeSignature s1}{ \time 4/4 s}}
  \bar"|."

}

IvlI = {
  \Iglobal
  \notypeset
  \clef violin
  <<\IvlIn \forma>>

}

IvlII = {
  \Iglobal
  \clef violin
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
  <<\Ibcn \forma \Ibfn>>
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


IIglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \quarto \senza
}

IIvlIn = \relative do'' {
  
  dod8\footnote #' (-1 . 1) \markup\column\smaller {"Le legature indicate in modo discontinuo nel ms. sono state integrate senza notifica"" "} (re) mi(fad)
  mi(fad) mi(la) dod,(re) mi(fad) mi(fad) mi(la)
  fad(sol) fad(mi) mi(fad) mi(dod) re(mi) re(si)
  
  %4
  dod(re) dod(la) dod(re) mi(fad)
  mi(fad) mi(la) dod,(re) mi(fad)
  mi(fad) mi(la) sold!(la) si(sold)
  
  %7
  fad(sold) la(fad) sold(mi) fad(red)\mbreak
  mi2 mi4 (mi)
  mi(mi) mi(mi)
  
  %10
  mi(mi) fad(fad)
  fad(fad) fad(fad)
  fad (fad) sol8 (la) sol (mi)
  
  %13
  fad(sol) fad(re) mi(fad) mi(dod)
  re(mi) re(si) dod(re) dod(lad)
  si dod si fad' re si dod lad
  
  %16
  si2 si4 (si)\mbreak
  si (si) si (si)
  si (si) dod (dod)
  
  %19
  dod(dod) dod(dod)
  dod(dod) fad8(sol) fad(re)
  mi(fad) mi(dod) re(mi) re(si)
  
  %22
  dod(re) dod(la) si(dod) si(mi)
  si(dod) si(re) dod(re) dod(mi)
  si(dod) si(mi,) si'(dod) si(mi)
  
  %25
  si(dod) si(re) dod(re) dod(mi)\mbreak  
  si(dod) si(mi,) la'(si) la(fad)
  sold(la) sold(mi) fad(sold) fad(red)
  
  %28
  mi(fad) mi(dod) re(mi) re(si)
  dod(re) dod(la') dod,(la) si(sold)
  la2

}


IIvlIIn = \relative do'' {
  
  la8(si) dod(re)
  dod(re) dod(mi) la,(si) dod(re)
  dod(re) dod(mi) re(mi) re(si)
  dod(re) dod(la) si(dod) si(sold)
  
  %4
  la(si) la(mi) la(si) dod(re)
  dod(re) dod(mi) la,(si) dod(re)
  dod(re) dod(la) si(la) sold(si)
  
  %7
  la(sold) fad(la) si(sold) la(fad)\mbreak
  sold2 si8(dod) si(re)
  dod(re) dod(la) si(dod) si(re)
  
  %10
  dod(re) dod(la) dod(re) dod(mi)
  re(mi) re(si) dod(re) dod(mi)
  re(mi) re(si) re4(re)
  
  %13
  dod(dod) si(si)
  la(la) sol(sol)
  fad fad fad mi
  
  %16
  re2 fad8(sold!) fad(la)\mbreak
  sold(la) sold(mi) fad(sold) fad(la)
  sold(la) sold(mi) sold(la) sold(si)
  
  %19
  la(si) la(fad) sold(la) sold(si)
  la(si) la(fad) la4(la)
  la(la) sold(sold)
  
  %22
  mi(mi) sold8(la) sold(si)
  sold(la) sold(si) la(si) la(dod)
  sold(la) sold(si) sold(la) sold(si)
  
  %25
  sold(la) sold(si) la(si) la(dod)\mbreak
  sold(la) sold(si) mi4(mi)
  re(re) dod(dod)
  
  %28
  si(si) si8(dod) si(mi,)
  la(si) la(dod) la4(sold)
  mi2

}

IIvlan = \relative do' {
  
  mi4(la)
  la(la) mi(la)
  la(la) la(la)
  la(la) sold(sold)
  
  %4
  mi(mi) mi(la)
  la(la) mi(la)
  la(la) mi(mi)
  
  %7
  si'(si) si,(si)\mbreak
  si2 sold'8(la) sold(si)
  la(si) la(dod) sold(la) sold(si)
  
  %10
  la(si) la(mi) lad(si) lad(dod)
  si(dod) si(re) lad(si) lad(dod)
  si(dod) si(fad) si4(si)
  
  %13
  dod(dod) mi,(mi)
  la(la) mi(mi)
  fad si, si lad
  
  %16
  si2 red8(mi) red(mi)\mbreak
  mi(fad) mi (sold) red(mi) red(fad)
  mi(fad) mi(sold) mid(fad) mid(sold)
  
  %19
  fad(sold) fad(la) mid(fad) mid(sold)
  fad(sold) fad(la) fad4 (fad)
  la(la) re,(re)
  
  %22
  mi(mi) mi(mi)
  mi(mi) mi(mi)
  mi(mi) mi(mi)
  
  %25
  mi(mi) mi(mi)\mbreak
  mi(mi) mi(mi)
  si'(si) fad(fad)
  
  %28
  si(si) mi,(mi)
  mi(mi) mi(re)
  dod2
  
}

IIbcn = \relative do {
  
  la4(la) 
  la(la) la(la)
  la(la) la(la)
  la(la) la(la)
  
  %4
  la(la) la(la)
  la(la) la(la)
  la(la) mi'(mi)
  
  %7
  red(red) mi si\mbreak
  mi,2 r
  r mi'4 mi
  
  %10
  la,2 r
  r fad'4 fad
  la,2 si'8(dod) si(sol)
  
  %13
  la(si) la(fad) sol(la) sol(mi)
  fad(sol) fad(re) mi(fad) mi(dod)
  re mi re si fad'4 fad,
  
  %16
  si2 r\mbreak
  r si'4 si
  mi,2 r
  
  %19
  r dod'4 dod
  fad,2 re'8(mi) re(si)
  dod(re) dod(la) si(dod) si(sold)
  
  %22
  la4 la, mi'(mi)
  mi(mi) mi(mi)
  mi(mi) mi(mi)
  
  %25
  mi(mi) mi(mi)\mbreak
  mi(mi) dod'8(re) dod(la)
  si(dod) si(sold) la(si) la(fad)
  
  %28
  sold(la) sold(mi) sold4(sold)
  la(la) mi(mi)
  la,2
  
}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key la\major
   \time 4/4
   \tempo 4 = 63
   \partial 2 s2
   s1*7
   s2\bar ":..:"\break s
   s1*21
   s2
   \bar":|."

}

IIvlI = {
   \IIglobal
   \notypeset
   \clef violin
   <<\IIvlIn \forma>>

}

IIvlII = {
   \IIglobal
   \clef violin
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
   <<\IIbcn \forma \IIbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


IIIglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   
}

IIIvlIn = \relative do'' {
  
  la4 mi8 la
  dod4 la8 dod mi4 dod8 mi
  la2 sold4 la
  
  %3
  mi fad dod re
  mi dod la mi8 la
  dod4 la8 dod mi4 dod8 mi
  
  %6
  la2 sold4 la
  mi fad si, red
  mi2 si4 sold8 si\mbreak
  
  %9
  mi2 si4 sold8 si
  fad'2 si,4 sold8 si
  sold'4 si la fad
  
  %12
  sold mi si' sold8 si
  la4 fad8 la sold4 mid
  fad2 sol4 mi8 sol
  
  %15
  fad4 re8 fad mi4 dod
  re2 fad,4 re8 fad
  la4 fad8 la re4 la8 re
  
  %18
  fad2 mi4 la
  re, dod8 si dod4 la8 dod\mbreak
  si2 sold4 mi8 sold
  
  %21
  la2 sold4 mi8 sold
  si2 sold4 mi8 sold
  dod4 la8 dod mi4 dod8 la
  
  %24
  si4 sold la mi8 la
  dod4 la8 dod mi4 dod8 mi
  la2 sold4 la
  
  %27
  mi fad dod si
  la2

}


IIIvlIIn = \relative do'' {
  
  mi,4 mi8 mi
  la4 mi8 la dod4 la8 dod
  mi2 mi4 dod
  la la la si
  
  %4
  dod la mi mi8 mi
  la4 mi8 la dod4 la8 dod
  mi2 mi4 dod
  
  %7
  la la la fad
  sold2 sold4 mi8 sold\mbreak
  si2 sold4 mi8 sold
  
  %10
  la2 sold4 mi8 sold
  si4 mi mi red
  mi la, fad' sold
  
  %13
  fad dod re dod
  dod2 re4 mi
  re la si la
  
  %16
  la2 re,4 re8 re
  fad4 re8 fad la4 fad8 la
  re2 dod4 mi
  
  %19
  la, si la fad\mbreak
  sold2 mi4 mi8 mi
  mi2 mi4 mi8 mi
  
  %22
  sold2 mi4 mi8 mi
  la4 mi8 la dod4 la8 mi
  sold4 mi mi mi8 mi
  
  %25
  la4 mi8 la dod4 la8 dod
  mi2 mi4 dod
  la la la sold
  
  %28
  mi2

}

IIIvlan = \relative do' {
  
  dod4 la8 dod
  mi4 dod8 mi la4 mi8 la
  dod2 si4 la
  la fad fad fad
  
  %4
  la mi dod la8 dod
  mi4 dod8 mi la4 mi8 la
  dod2 si4 la
  
  %7
  la fad mi si
  si2 mi4 si8 mi\mbreak
  sold2 mi4 si8 mi
  
  %10
  si2 mi4 si8 mi
  si4 si' dod si
  si sold fad dod'
  
  %13
  dod dod si sold
  la2 re,4 la'
  la la sol mi
  
  %16
  fad2 la,4 fad8 la
  re4 la8 re fad4 re8 fad
  la2 la4 la
  
  %19
  la mi mi dod\mbreak
  mi2 si4 sold8 si
  dod2 si4 sold8 si
  
  %22
  re2 si4 sold8 si
  mi4 dod8 mi la4 mi8 dod
  mi4 si dod la8 dod 
  
  %25
  mi4 dod8 mi la4 mi8 la
  dod2 la4 fad
  mi si mi mi
  
  %28
  dod2

}

IIIbcn = \relative do {
  
  la'4 la8 la
  la,4 la8 la la'4 la8 la
  la,2 mi'4 fad
  dod re la' re,
  
  %4
  la' la, la' la8 la
  la,4 la8 la la'4 la8 la
  la,2 mi'4 fad
  
  %7
  dod re la si
  mi,2 mi'4 mi8 mi\mbreak
  mi2 mi4 mi8 mi
  
  %10
  red2 mi4 mi8 mi
  mi4 sold fad si
  mi,2 red4 mi
  
  %13
  fad la, si dod
  fad la la dod
  re fad, sol la
  
  %16
  re,2 re4 re8 re
  re,4 re8 re re'4 re8 re
  re,2 la''4 dod,
  
  %19
  fad sold la la,\mbreak
  mi'2 mi4 mi8 mi
  mi2 mi4 mi8 mi
  
  %22
  mi2 mi4 mi8 mi
  mi4 mi8 mi mi4 mi8 mi
  mi4 mi, la' la8 la
  
  %25
  la,4 la8 la la'4 la8 la
  la,2 mi'4 fad
  dod re mi mi,
  
  %28
  la2

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key la\major
   \time 2/2\numericTimeSignature
   \tempo 1 = 65
   \partial 2 s2
   s1*7
   s2 \bar ":..:"\break s
   s1*19
   s2
   \bar":|."

}

IIIvlI = {
   \IIIglobal
   \notypeset
   \clef violin
   <<\IIIvlIn \forma>>

}

IIIvlII = {
   \IIIglobal
   \clef violin
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
   <<\IIIbcn \forma \IIIbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


IVglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {

  mi8
  dod dod re
  mi4 fad8~
  fad sold la

  %4
  mi4 re8
  dod si re~
  re\upl si' re,

  %7
  dod si re~
  re\upl si' re,
  dod la16 si dod re

  %10
  mi dod re mi fad sold
  la sold fad mi re dod
  si4 mi8

  %13
  dod dod re\mbreak
  mi4 fad8~
  fad sold la

  %16
  mi4 re8
  dod si re~
  re\upl si' re,

  %19
  dod si re~
  re\upl si' re,
  dod la16 si dod re

  %22
  mi dod re mi fad sold
  la8 dod, si
  la4 dod8   %%% fine ripresa

  %25
  si4-+ la8
  si mi si~
  si sold la

  %28
  si mi, re'\mbreak
  dod4-+ si8
  dod fad dod~

  %31
  dod la si
  dod fad, dod'
  fad la16 sold fad mi

  %34
  red8 fad16 mi red dod
  si8 red16 dod si la
  sold8 si16 la sold fad

  %37
  sold8 sold la
  si4 dod8~
  dod red mi

  %40
  si4 fad'8
  sold fad la\parentSlur (
  la) si, fad'

  %43
  sold fad la~
  la si, fad'\mbreak
  sold8 mi16 fad sold la

  %46
  si8 la16 sold fad mi
  fad8 si, red
  mi4 mi8

  %49
  si dod re
  mi4 fad8~
  fad\upl sold la

  %52
  mi4 re8
  dod si re~
  re-\parenthesize \upl si' re,

  %55
  dod si re~
  re-\parenthesize \upl si' re,
  dod la16 si dod re

  %58
  mi dod re mi fad sold\mbreak
  la sold fad mi re dod
  si4-+ mi8

  %61
  dod dod re\mbreak
  mi4 fad8~
  fad sold la

  %64
  mi4 re8
  dod si re~
  re-\parenthesize\upl si' re,

  %67
  dod si re~
  re\parenthesize \upl si' re,
  dod la16 si dod re

  %70
  mi dod re mi fad sold
  la8 dod, si
  la4 dod8

  %73
  re fad mi\mbreak
  re la'4
  fad8 mi16 re mi8
  
  %76
  re mi8. fad32(sol)
  fad8 mi sol~
  sol fad mi
  
  %79
  fad mi sol~
  sol-\parenthesize \upl fad mi
  fad re16 mi fad re
  
  %82
  sol8 mi16 fad sol mi
  la8 la, dod
  re4 fad8
  
  %85
  mi re dod
  re si dod
  re mi16 re dod si
  
  %88
  dod8 la si\mbreak
  dod la' la,~
  la_\upl si mi,
  
  %91
  dod' la' la,~
  la_\upl si mi,
  dod' la re~
  
  %94
  re si mi~
  mi re dod~
  dod si mi8
  
  %97
  dod dod re
  mi4 fad8~
  fad sold la
  
  %100
  mi4 re8
  dod si re~
  re si' re,
  
  %103
  dod si re~
  re\upl si' re,
  dod la16 si dod re
  
  %106
  mi dod re mi fad sold
  la sold fad mi re dod
  si4 mi8
  
  %109
  dod dod re\mbreak
  mi4 fad8~
  fad sold la
  
  %112
  mi4 re8
  dod si re~
  re\upl si' re,
  
  %115
  dod si re~
  re\upl si' re,
  dod la16 si dod re
  
  %118
  mi dod re mi fad sold
  la8 dod, si
  la4\fermata r8   %%% fine ripresa

}


IVvlIIn = \relative do'' {
  
  si8
  la la la
  la4 la8
  re4 dod8
  
  %4
  si sold la~
  la sold si~
  si_\upl sold si
  
  %7
  la sold si~
  si_\upl sold si
  la mi la
  
  %10
  la4 re8
  mi re16 dod si la
  sold4 si8
  
  %13
  la la la\mbreak
  la4 la8
  re4 dod8
  
  %16
  si sold la~
  la_\upl sold si~
  si_\upl sold si
  
  %19
  la sold si~
  si_\upl sold si
  la mi la
  
  %22
  la4 dod8
  mi la, sold
  mi4 la8 %%% fine ripresa
  
  %25
  sold4_+ fad8
  sold si sold~
  sold mi la
  
  %28
  sold4 si8\mbreak
  la4 sold8
  la dod la~
  
  %31
  la fad si
  sold4 la8
  dod la dod
  
  %34
  si4 fad8
  fad red fad
  mi4 mi8
  
  %37
  mi mi mi
  mi4 mi8
  la4 sold8
  
  %40
  fad red red'
  mi red fad~
  fad fad, red'
  
  %43
  mi red fad~
  fad fad, si\mbreak
  si si mi
  
  %46
  mi4 mi8
  dod si si
  si4 si8 
  la la la
  
  %50
  la4 la8
  re4 dod8
  si sold la~
  
  %53
  la_\upl sold si~
  si_\upl sold si
  la sold si~
  
  %56
  si_\upl sold si
  la mi la
  la4 re8\mbreak
  
  %59
  mi re16 dod si la
  sold4_+ si8
  la la la
  
  %62
  la4 la8
  re4 dod8
  si sold la~
  
  %65
  la sold si~
  si_\upl sold si
  la sold si~
  
  %68
  si_\upl sold si
  la mi la
  la4 re8
  
  %71
  mi la, sold
  mi4 mi8
  fad la sol\mbreak
  
  %74
  fad fad4
  la8 sol16 fad sol8
  fad dod'4
  
  %77
  re8 dod mi~
  mi re dod
  re dod mi~
  
  %80
  mi\upl re dod
  re4 re8
  re4 dod8
  
  %83
  re4 la8
  la4 si8
  si4 lad8
  
  %86
  si4 fad8
  si4 sold8
  la mi sold\mbreak
  
  %89
  mi4 r8
  mi sold r
  mi4 r8
  
  %92
  mi sold r
  mi4 la8
  fad4 si8
  
  %95
  la4 la8~
  la sold si
  la la la
  
  %98
  la4 la8
  re4 dod8
  si sold la~
  
  %101
  la sold si~
  si_\upl sold si
  la sold si~
  
  %104
  si_\upl sold si
  la mi la
  la4 re8 
  
  %107
  mi re16 dod si la
  sold4 si8
  la la la\mbreak
  
  %110
  la4 la8
  re4 dod8
  si sold la~
  
  %113
  la_\upl sold si~
  si_\upl sold si
  la sold si~
  
  %116
  si_\upl sold si
  la mi la
  la4 dod8
  
  %119
  mi la, sold
  mi4\fermata r8
  
}


IVvlan = \relative do' {
  
  sold'8
  mi mi re
  la'4 re,8
  re4 mi8
  
  %4
  mi4 la,8
  mi'4 sold8~
  sold\upl mi sold
  
  %7
  mi4 sold8~
  sold\upl mi sold
  mi dod fad
  
  %10
  mi4 si'8
  mi, fad4
  sold sold8
  
  %13
  mi mi re\mbreak
  la'4 re,8
  re4 mi8
  
  %16
  mi4 la,8
  mi'4 sold8~
  sold\upl mi sold
  
  %19
  mi4 sold8~
  sold\upl mi sold
  mi dod \parenthesize fad
  
  %22
  mi4 si'8
  mi, fad si,
  dod4 mi8 %%% fine ripresa
  
  %25
  si4 red8
  si sold' mi~
  mi si red
  
  %28
  si4 sold'8\mbreak
  dod,4 mid8
  dod la' fad~
  
  %31
  fad dod mid
  dod4 fad8
  fad dod fad
  
  %34
  fad4 si,8
  si fad' si,
  si4 dod8
  
  %37
  si si la
  mi'4 la,8
  la4 si8
  
  %40
  si4 si'8
  si4 red8\parentSlur (
  red) red, si'
  
  %43
  si4 red8\parentSlur (
  red) red, si'\mbreak
  si sold sold
  
  %46
  sold4 sold8
  la red, fad
  sold4 sold8
  
  %49
  mi mi re
  la'4 re,8
  re4 mi8
  
  %52
  mi4 la,8
  mi'4 sold8~
  sold\upl mi sold
  
  %55
  mi4 sold8~
  sold-\parenthesize \upl mi sold
  mi dod fad
  
  %58
  mi4 si'8\mbreak
  mi, fad4
  sold sold8
  
  %61
  mi mi re
  la'4 re,8
  re4 mi8
  
  %64
  mi4 la,8
  mi'4 sold8~
  sold\upl mi sold
  
  %67
  mi4 sold8~
  sold\upl mi sold
  mi dod fad
  
  %70
  mi4 si'8
  mi, fad si,
  dod4 la8
  
  %73
  la re dod\mbreak
  la re4
  re dod8
  
  %76
  la sol'4
  la8 la dod\parentSlur (
  dod) la la
  
  %79
  la la dod~
  dod-\parenthesize\upl la la
  la4 la8
  
  %82
  sol4 sol8
  fad4 mi8
  fad4 re8
  
  %85
  mi4 fad8
  fad4 fad8
  mi4 mi8
  
  %88
  mi4 mi8\mbreak
  dod4 r8
  si4 r8
  
  %91
  la4 r8
  si4 r8
  la4 la8
  
  %94
  si4 si8
  dod4 mi8
  mi4 sold8
  
  %97
  mi mi re
  la'4 re,8
  re4 mi8
  
  %100
  mi4 la,8
  mi'4 sold8~
  sold\upl mi sold
  
  %103
  mi4 sold8~
  sold\upl mi sold
  mi dod fad
  
  %106
  mi4 si'8
  mi, fad4
  sold sold8
  
  %109
  mi mi re\mbreak
  la'4 re,8
  re4 mi8
  
  %112
  mi4 la,8
  mi'4 sold8~
  sold\upl mi sold
  
  %115
  mi4 sold8~
  sold\upl mi sold
  mi dod fad
  
  %118
  mi4 si'8
  mi, fad si,
  dod4\fermata r8
  
}

IVbcn = \relative do {
  
  mi8
  la la si
  dod4 re8
  si4 la8
  
  %4
  sold mi fad
  mi4 r8
  mi4 r8
  
  %7
  mi4 r8
  mi4 sold8
  la4 fad8
  
  %10
  dod4 si8
  dod re4
  mi mi8
  
  %13
  la la si\mbreak
  dod4 re8
  si4 la8
  
  %16
  sold mi fad  
  mi4 r8
  mi4 r8
  
  %19
  mi4 r8
  mi4 sold8
  la4 fad8
  
  %22
  dod4 si8
  dod re mi
  la,4 la8 %%% fine ripresa
  
  %25
  mi'4 fad8
  mi4 mi,8
  mi'4 fad8
  
  %28
  mi4 mid8\mbreak
  fad4 sold8
  fad4 fad,8
  
  %31
  fad'4 sold8
  fad4 fad8
  la fad la
  
  %34
  si4 si,8
  red si red
  mi4 mi,8
  
  %37
  mi' mi fad
  sold4 la8
  fad4 mi8
  
  %40
  red si si'
  si4 r8
  si4 r8
  
  %43
  si4 r8
  si4 red8\mbreak
  mi4 dod8
  
  %46
  sold4 dod8
  la si si,
  mi4 mi8
  
  %49
  la la si
  dod4 re8
  si4 la8
  
  %52
  sold mi fad
  mi4 r8
  mi4 r8
  
  %55
  mi4 r8
  mi4 sold8
  la4 fad8
  
  %58
  dod4 si8
  dod re4
  mi mi8
  
  %61
  la la si\mbreak
  dod4 re8
  si4 la8
  
  %64
  sold mi fad  
  mi4 r8
  mi4 r8
  
  %67
  mi4 r8
  mi4 sold8
  la4 fad8
  
  %70
  dod4 si8
  dod re mi
  la,4 la'8
  
  %73
  re, re re\mbreak
  re re re
  re re re
  
  %76
  re re re
  re la' r
  la, la la
  
  %79
  re la' r
  la, la la
  re4 re8
  
  %82
  mi4 mi8
  fad sol la
  re,4 re8
  
  %85
  dod4 fad8
  si4 la8
  sold4 mi8
  
  %88
  la dod, mi\mbreak
  la4 r8
  mi4 r8
  
  %91
  la,4 r8
  mi'4 r8
  la4 fad8
  
  %94
  si4 sold8
  dod4 la8
  mi'4 mi,8
  
  %97
  la la si
  dod4 re8
  si4 la8
  
  %100
  sold mi fad
  mi4 r8
  mi4 r8
  
  %103
  mi4 r8
  mi4 sold8
  la4 fad8
  
  %106
  dod4 si8
  dod re4
  mi mi8
  
  %109
  la la si\mbreak
  dod4 re8
  si4 la8
  
  %112
  sold mi fad  
  mi4 r8
  mi4 r8
  
  %115
  mi4 r8
  mi4 sold8
  la4 fad8
  
  %118
  dod4 si8
  dod re mi
  la,4\fermata r8

}

IVbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key la\major
  \time 3/8
  \tempo 4. = 65
  \partial 8 s8
  s4.*120
  \bar"|."

}

IVvlI = {
  \IVglobal
  \notypeset
  \clef violin
  <<\IVvlIn \forma>>

}

IVvlII = {
  \IVglobal
  \clef violin
  <<\IVvlIIn \forma>>

}

IVvla = {
  \IVglobal
  \clef alto
  <<\IVvlan \forma>>

}

IVbc = {
  \IVglobal
  \clef bass
  <<\IVbcn \forma \IVbfn>>
  \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


Vglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

VvlIn = \relative do'' {
  
  mi,4
  la la la la
  la4. si8 dod si dod la
  mi'4 mi mi mi
  
  %4
  mi2 r8 dod re mi
  fad mi re mi fad mi re fad
  mi re dod re mi re dod mi
  
  %7
  fad mi re mi fad mi re fad
  mi re dod re mi re dod mi
  re dod si re\mbreak dod si la dod
  
  %10
  si la si dod si4 mi,
  la la la la
  la4. si8 dod si dod la
  
  %13
  mi'4 mi mi mi
  mi2 r8 mi fad sold
  la sold fad sold la sold fad la
  
  %16
  sold fad mi fad sold fad mi sold
  la sold fad sold la sold fad la
  sold fad mi fad sold fad mi sold
  
  %19
  fad mi red fad\mbreak mi red dod mi
  red dod si dod red mi fad sold
  la4 la la la
  
  %22
  la2 \appoggiatura {sold16[la]} si4 la
  sold fad8(mi) sold(fad) mi(red)
  mi2. mi,4
  
  %25
  si' si si si
  si4. dod8 re dod re si
  dod4 si la sold 
  la sold8 la fad4 dod'
  
  %29
  re8 fad mi re mi dod re mi\mbreak
  re fad mi re mi dod re mi
  re si dod re mi dod re mi
  
  %32
  fad si la sol fad mi re dod
  re4. mi8 dod4.-+ si8
  si2. fad4
  
  %35
  si fad fad la
  sold2. si4
  mi si si re
  
  %38
  dod2. dod4\mbreak
  fad fad fad fad
  fad4. sold16 la sold4 fad
  
  %41
  mi red8 dod mi(red) dod(sid)
  dod(mi) red(dod) red\parentSlur(sid) dod\parentSlur (red)
  dod(mi) red(dod) red(sid) dod (red)
  
  %44
  dod sid dod red? mi red! mi fad
  sold4 la8 sold fad mi red dod
  dod2. mi,4
  
  %47
  la la la la
  la4. si8 dod si dod la
  mi'4 mi mi mi
  
  %50
  mi2 r8 dod re mi
  fad mi re mi fad mi re fad
  mi re dod re mi re dod mi
  
  %53
  fad mi re mi fad mi re fad
  mi re dod re mi re dod mi
  re dod si re dod si la dod
  
  %56
  si la sold la si la si dod
  re4 re re re
  re2 mi4 re\mbreak
  
  %59
  dod si8 la dod(si) la(sold)
  la la' sold fad mi re dod si
  dod4 la dod mi
  
  %62
  dod8 la' sold fad mi re dod si
  dod4. re8 si4. la8
  la2.

}


VvlIIn = \relative do'' {
  
  mi,4 
  la la la la
  la4. si8 dod si dod la
  mi'4 mi mi mi
  
  %4
  mi2 r8 la, si dod
  re dod si dod re dod si re
  dod si la si dod si la dod
  
  %7
  re dod si dod re dod si re
  dod si la si dod si la dod
  si la sold si\mbreak la sold fad la
  
  %10
  sold fad sold la sold4 mi
  la la la la
  la4. si8 dod si dod la
  
  %13
  mi'4 mi mi mi
  mi2 r8 sold, la si
  dod si la si dod si la dod
  
  %16
  si la sold la si la sold si
  dod si la si dod si la dod
  si la sold la si la sold si
  
  %19
  la sold fad la\mbreak sold fad mi sold
  fad2. red'4
  mi8 red dod red mi red mi dod
  
  %22
  red dod red mi fad mi fad red
  mi4 mi dod si
  si2. mi,4
  
  %25
  fad sold fad sold
  fad sold8 la si4 sold
  la sold fad mid
  
  %28
  fad2. lad4
  si8 re dod si dod lad si dod\mbreak
  si re dod si dod lad si dod
  
  %31
  si2 si
  si2. dod4
  si4. dod8 lad4. fad8
  
  %34
  fad2. fad4
  fad red fad fad
  mi2. sold4
  
  %37
  si sold si si
  la2. la4\mbreak
  dod dod dod red
  
  %40
  si2. red4
  dod dod dod sold
  sold2 sid
  
  %43
  sold sid
  sold2. dod4
  dod dod dod sid
  
  %46
  sold2. mi4
  la la la la
  la4. si8 dod si dod la
  
  %49
  mi'4 mi mi mi
  mi2 r8 la, si dod
  re dod si dod re dod si re
  
  %52
  dod si la si dod si la dod
  re dod si dod re dod si re
  dod si la si dod si la dod
  
  %55
  si la sold si la sold fad la
  sold fad mi fad sold4 sold
  la8 sold fad sold la sold la fad
  
  %58
  sold fad sold la si la si sold\mbreak
  la4 la fad mi
  mi2. mi4
  
  %61
  mi2 r4 mi
  mi2. sold4
  la4. si8 sold4. mi8
  
  %64
  mi2.
  
}

Vvlan = \relative do' {
  
  mi4
  la la la la
  la4. si8 dod si dod la
  mi4 mi mi mi
  
  %4
  mi2 r4 la
  la fad re fad
  la mi mi la
  
  %7
  la fad re fad
  la mi mi mi
  fad sold\mbreak mi mi
  
  %10
  mi2. mi4
  la la la la
  la4. si8 dod si dod la
  
  %13
  mi4 mi mi mi
  mi2 r4 mi
  mi dod la dod
  
  %16
  mi si si mi
  mi dod la dod
  mi si si mi
  
  %19
  dod red\mbreak si si
  si2. si'4
  la la la la
  
  %22
  fad2 si4 si
  si si la fad
  sold2. si,4
  
  %25
  si si si si
  si2. mi4
  mi re dod dod
  
  %28
  dod si8 dod la4 fad'
  fad2 lad\mbreak
  mi lad
  
  %31
  fad mi
  re2. fad4
  fad sol fad fad
  
  %34
  re2. si4
  red si si si
  si2. mi4
  
  %37
  sold mi mi mi
  mi2. mi4\mbreak
  la la la la
  
  %40
  red,2. sold4
  sold la sold sold
  mi2 sold
  
  %43
  mi sold
  mi2. sold4
  sold la, sold' sold
  
  %46
  mi2. mi4
  la la la la
  la4. si8 dod si dod la\mbreak
  
  %49
  mi4 mi mi mi
  mi2 r4 la
  la fad re fad
  
  %52
  la mi mi la
  la fad re fad
  la mi mi la
  
  %55
  fad sold mi mi
  mi2. mi4
  re re re re
  
  %58
  si2 mi4 mi\mbreak
  mi mi re si
  dod2. sold4
  
  %61
  la2 r4 sold
  la2 la'4 mi
  mi fad mi mi
  
  %64
  dod2.

}

Vbcn = \relative do {
  
  mi4
  la la la la
  la4. si8 dod si dod la
  mi'4 mi mi mi
  
  %4
  mi2 r4 la,
  re, re' re re,
  la' la, la la'
  
  %7
  re, re' re re,
  la' la, la la'
  re, mi\mbreak la la,
  
  %10
  mi'2. mi4
  la la la la
  la4. si8 dod si dod la
  
  %13
  mi'4 mi mi mi
  mi2 r4 mi,
  la, la' la la,
  
  %16
  mi' mi, mi mi'
  la, la' la la,
  mi' mi, mi mi'
  
  %19
  la, si\mbreak mi mi,
  si'2. si'4
  dod8 si la si dod si dod la
  
  %22
  si la si dod red dod red si
  mi4 sold, la si
  mi,2. mi4
  
  %25
  red mi red mi
  si la sold mi
  la si dod dod,
  
  %28
  fad2. fad'4
  si2 fad\mbreak
  si, fad'
  
  %31
  si dod
  re2. lad4
  si mi, fad fad,
  
  %34
  si8 si' la sol fad mi re dod
  si lad si dod red si dod red
  mi mi' red dod si la sold fad
  
  %37
  mi red mi fad sold mi fad sold
  la sold la si dod si la sold\mbreak
  fad mid fad sold la sold la fad
  
  %40
  sold2. sid4
  dod fad, sold sold,
  dod2 sold'
  
  %43
  dod, sold'
  dod,2. dod'4
  mi, fad sold sold,
  
  %46
  dod2. mi4
  la la la la
  la4. si8 dod si dod la\mbreak  
  
  %49
  mi'4 mi mi mi
  mi2 r4 la,4
  re,  re' re re,
  
  %52
  la' la, la la'
  re, re' re re,
  la' la, la la'
  
  %55
  re, mi la la,
  mi'2. mi4 
  fad8 mi re mi fad mi fad re
  
  %58
  mi re mi fad sold fad sold mi\mbreak
  la4 dod, re mi
  la, la dod mi
  
  %61
  la,8 la' sold fad mi re dod si
  la4 la dod mi
  la re, mi mi,
  
  %64
  la2.
 
}

Vbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key la\major
   \time 4/4
   \tempo 1 = 62
   \partial 4 s4
   s1*23
   s2.\bar ":..:"\break s4
   s1*39
   s2.
   \bar":|."

}

VvlI = {
   \Vglobal
   \notypeset
   \clef violin
   <<\VvlIn \forma>>

}

VvlII = {
   \Vglobal
   \clef violin
   <<\VvlIIn \forma>>

}

Vvla = {
   \Vglobal
   \clef alto
   <<\Vvlan \forma>>

}

Vbc = {
   \Vglobal
   \clef bass
   <<\Vbcn \forma \Vbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


VIglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

VIvlIn = \relative do'' {
  
  la4 mi dod'
  la4._+ sold8 la si
  dod4 si8 la mi'4
  
  %4
  dod4. si8 dod re
  mi4 re8(dod) la'4
  re, dod8(si) si'4
  
  %7
  dod, si8 la re4
  si2.
  mi4 si sold'
  
  %10
  mi4. fad8 sold la
  si4 la8 sold la4
  fad4. mi8 re dod
  
  %13
  re4 dod8(si) mi4
  sold, fad8(mi) re'4
  dod re8 dod si dod
  
  %16
  la2.

}


VIvlIIn = \relative do'' {
  
  la4 mi dod'
  la4._+ sold8 la si
  dod4 si8 la mi'4
  
  %4
  dod4. si8 dod re
  mi4 re8(dod) la'4
  re, dod8(si) si'4
  
  %7
  dod, si8 la re4
  si2.
  mi4 si sold'
  
  %10
  mi4. fad8 sold la
  si4 la8 sold la4
  fad4. mi8 re dod
  
  %13
  re4 dod8(si) mi4
  sold, fad8(mi) re'4
  dod re8 dod si dod
  
  %16
  la2.

}

VIvlan = \relative do' {
  
  dod2 r4
  dod mi la
  la2 r4
  
  %4
  mi la la
  la2 la4
  fad2 mi4
  
  %7
  mi fad si
  sold2.
  sold2 r4
  
  %10
  sold si red, 
  mi2 mi4
  la, re8 dod si lad
  
  %13
  si2 dod4
  si2 la4
  la2 sold4
  
  %16
  re'2.

}

VIbcn = \relative do {
  
  la'2 r4
  la, dod mi
  la2 r4
  
  %4
  la, la' fad
  dod2 fad4
  si,2 sold4
  
  %7
  la re si
  mi mi, mi'
  mi2 r4
  
  %10
  mi sold fad
  mi2 dod4
  re re8 mi fad4
  
  %13
  si,2 la4
  mi'2 fad4
  mi re mi
  
  %16
  la, la' la,

}

VIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key la\major
   \time 3/4
   \tempo 2. = 57
   s2.*8
   \bar":..:"
   s2.*8
   \bar":|."

}

VIvlI = {
   \VIglobal
   %\notypeset
   \clef violin
   <<\VIvlIn \forma>>

}

VIvlII = {
   \VIglobal
   \clef violin
   <<\VIvlIIn \forma>>

}

VIvla = {
   \VIglobal
   \clef alto
   <<\VIvlan \forma>>

}

VIbc = {
   \VIglobal
   \clef bass
   <<\VIbcn \forma \VIbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


VIIglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

VIIvlIn = \relative do'' {
  
  mi,2 fad4
  mi2 la4
  sold la fad
  
  %4
  mi2.
  la4 dod si
  la dod si
  
  %7
  la mi' fad
  \grace re8 mi2.
  si2 dod4
  
  %10
  si2 mi4
  red mi dod
  si2 mi4
  
  %13
  red mi dod\mbreak
  si mi fad
  sold2 fad4
  
  %16
  mi2 si4
  sold'2 fad4
  mi2.
  
  %19
  re!2 dod4
  re r r
  dod2 si4
  
  %22
  dod r r
  mi2 re4
  dod2 si4
  
  %25
  re2 dod4
  si r r
  mi,2 fad4\mbreak
  
  %28
  mi2 la4
  sold la fad
  mi2 la4 
  
  %31
  sold la fad
  mi2 sold4
  la dod si
  
  %34
  la dod si
  la' dod, si
  la2. la

}


VIIvlIIn = \relative do'' {
  
  dod,8 dod dod dod re re
  dod dod dod dod mi mi
  re re mi mi re re
  
  %4
  dod dod dod dod dod dod
  mi mi la  la sold sold
  mi mi la la sold sold
  
  %7
  mi mi dod' dod la la
  la la la la la la
  sold sold sold sold la la
  
  %10
  sold sold sold sold si si
  la la si si la la
  sold sold sold sold si si
  
  %13
  la la si si la la\mbreak
  sold sold si si red red
  mi mi mi mi red red
  
  %16
  si si si si sold sold
  mi' mi mi mi red red
  si si si si si si
  
  %19
  si si si si la la
  si si si si si si
  la la la la sold sold
  
  %22
  la la la la la la
  dod dod dod dod si si
  la la la la sold sold
  
  %25
  si si si si la la
  sold sold mi mi re re
  dod dod dod dod re re\mbreak
  
  %28
  dod dod dod dod mi mi
  re re mi mi re re
  dod dod dod dod mi mi
  
  %31
  re re mi mi re re
  dod dod dod dod re re
  mi mi la la sold sold
  
  %34
  mi mi la la sold sold
  dod dod la la sold sold
  mi mi mi mi mi mi mi2.

}

VIIvlan = \relative do' {
  
  la8 la la la la la
  la la la la dod dod
  si si dod dod la la
  
  %4
  la la la la la la
  dod dod mi mi re re
  dod dod mi mi re re
  
  %7
  dod dod la la re re
  mi mi mi mi mi mi
  mi mi mi mi mi mi
  
  %10
  mi mi mi mi sold sold
  fad fad sold sold mi mi
  mi mi mi mi sold sold
  
  %13
  fad fad sold sold mi mi\mbreak
  mi mi sold sold la la
  si si si si la la
  
  %16
  sold sold sold sold mi mi
  si' si si si la la
  sold sold sold sold sold sold
  
  %19
  sold sold sold sold mi mi
  sold sold sold sold sold sold
  mi mi mi mi mi mi
  
  %22
  mi mi mi mi mi mi
  la la la la sold sold
  mi mi mi mi mi mi
  
  %25
  sold sold sold sold mi mi
  mi mi sold sold sold sold
  la, la la la la la\mbreak
  
  %28
  la la la la dod dod
  si si dod dod la la
  la la la la dod dod
  
  %31
  si si dod dod la la
  la la la la si si
  dod dod mi mi re re
  
  %34
  dod dod mi mi re re
  mi mi mi mi re re
  dod dod dod dod dod dod dod2.
  
}

VIIbcn = \relative do {
  
  la4 r r
  la r r
  la r r
  
  %4
  la r r
  la r r
  la r r
  
  %7
  la r r
  la r r
  mi' r r
  
  %10
  mi r r
  mi r r
  mi r r
  
  %13
  mi r r
  mi r r
  mi r r
  
  %16
  mi r r
  mi r r
  mi r r
  
  %19
  mi, r r
  mi r r
  mi r r
  
  %22
  mi r r
  mi r r
  mi r r
  
  %25
  mi r r
  mi r r
  la4 r r\mbreak
  
  %28
  la r r
  la r r
  la r r
  
  %31
  la r r
  la r r
  la r r
  
  %34
  la r r
  la r r
  la r r  la r r
  
}

VIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key la\major
   \time 3/4
   \tempo 2. = 57
   s2.*8
   \bar":..:"\break
   \repeat volta 2 {s2.*27}
   \alternative {{s2.}{s}}
   \bar "|."

}

VIIvlI = {
   \VIIglobal
   %\notypeset
   \clef violin
   <<\VIIvlIn \forma>>

}

VIIvlII = {
   \VIIglobal
   \clef violin
   <<\VIIvlIIn \forma>>

}

VIIvla = {
   \VIIglobal
   \clef alto
   <<\VIIvlan \forma>>

}

VIIbc = {
   \VIIglobal
   \clef bass
   <<\VIIbcn \forma \VIIbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}


VIIIglobal = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

VIIIvlIn = \relative do'' {
  
  dod8. la16 mi'4 la
  sold8 fad16 sold mi2
  re8(sol) fad(mi) mi(re)
  
  %4
  mi \parentSlur (dod) re4 re,
  dod'8. la16 mi'4 la
  sold8 fad16 sold mi2
  
  %7
  red8 mi fad sold16 fad mi8 red-+
  dod-+ si si2
  si8 la16 si dod8 si16 dod red8 dod16 red
  
  %10
  mi8 red mi4. fad8\mbreak
  sold(la) si(la) sold(fad)
  dod si16(dod) fad,2
  
  %13
  la'8. sold16 fad4 mi
  fad8 mi16 re dod8 si dod la
  mi'8. re16 dod4 si
  
  %16
  la8 dod16 la mi2
  dod'8. la16 mi'4 la
  sold8 fad16 mi re2
  
  %19
  fad8 mi16 re mi8 la, re dod
  si la la2

}


VIIIvlIIn = \relative do'' {
  
  la8. la16 si4 la
  si8 la16 si sold2
  si8(re) dod(si) si(la)
  
  %4
  si \parentSlur (la) la4 fad
  la8. la16 si4 la
  si8 la16 si sold2
  
  %7
  si4 si si
  lad8 fad fad2
  mi4 mi la
  
  %10
  sold8 fad sold4. si8\mbreak
  re(mi) fad(mi) fad(re)
  dod si16\parentSlur (dod) fad,2
  
  %13
  mi'4 re la
  re8 dod16 si la8 sold la mi
  la4 la sold
  
  %16
  mi mi2
  mi8. mi16 mi4 la
  si si2
  
  %19
  re8 dod16 si la4 la
  sold8 mi mi2

}

VIIIvlan = \relative do' {
  
  mi8. mi16 mi4 red
  si si2
  si4 fad'8 \parentSlur (sol) sol \parentSlur (la)
  
  %4
  sol(mi) fad4 la,
  mi'8. mi16 mi4 red
  si si2
  
  %7
  si4 si sold'
  dod,8 mi red2
  si4 la la
  
  %10
  si si2\mbreak
  si'4 sold re'
  dod8 si16 \parentSlur (dod) fad,2
  
  %13
  mi4 la la
  la la2
  la4 mi mi
  
  %16
  mi8 la, sold2
  la8. la16 si4 red
  si sol'2
  
  %19
  la4 la fad
  si,8 re dod2

}

VIIIbcn = \relative do {
  
  la8. la'16 sold4 fad
  mi mi2
  sol8(si) la(sol) sol(fad)
  
  %4
  sol \parentSlur (la) re,4 re
  la8. la'16 sold!4 fad
  mi mi2
  
  %7
  si'4 red, mi
  fad si,2
  sold'4 la fad
  
  %10
  mi mi mi,\mbreak
  si''8 \parentSlur (dod) re\parentSlur (dod) re \parentSlur (si)
  dod si16\parentSlur (dod) fad,4 fad,
  
  %13
  dod' re dod
  re8. mi16 fad4 mi8. re16
  dod8. si16 la4 re
  
  %16
  dod8 la mi'4 mi,
  la8. la'16 sold4 fad
  mi sol2
  
  %19
  re4 dod re
  mi la,2

}

VIIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key la\major
   \time 3/4
   \tempo 2 = 55
   s2.*8
   \bar":..:"
   s2.*12
   \bar ":|."

}

VIIIvlI = {
   \VIIIglobal
   %\notypeset
   \clef violin
   <<\VIIIvlIn \forma>>

}

VIIIvlII = {
   \VIIIglobal
   \clef violin
   <<\VIIIvlIIn \forma>>

}

VIIIvla = {
   \VIIIglobal
   \clef alto
   <<\VIIIvlan \forma>>

}

VIIIbc = {
   \VIIIglobal
   \clef bass
   <<\VIIIbcn \forma \VIIIbfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

    \header {
        subtitle = \markup {Ouverture TWV 55:A2}
        composer = \markup\smaller \center-column{"G. Ph. Telemann (1681-1767)"}
    }

    \markup\huge "[1.] Ouverture"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \Ivla
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \Ibc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

    \pageBreak

    \markup\huge "[2.] Les Flots. Modéré"

    \score {

        \new ChoirStaff <<

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

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

    \markup\huge "[3.] Rejouissance"

    \score {

        \new ChoirStaff <<

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

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

    \pageBreak

    \markup\huge "[4.] Rondeau"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IVvla
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \IVbc
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

    \pageBreak

    \markup\huge "[5.] Fanfare. Tres viste"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \Vvla
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \Vbc
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

    \pageBreak

    \markup\huge "[6.] Menuet 1."

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \VIvla
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \VIbc
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

    \markup\huge "[7.] Menuet [2.]"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \VIIvla
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \VIIbc
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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

    \markup\huge "[8.] Polonoise"

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VIIIvlII
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \VIIIvla
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \VIIIbc
            >>
        >>

        \layout {

            indent = 0\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##t
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


