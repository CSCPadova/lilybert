\language "italiano"
	%********************************** VARIABILI
\version "2.20.0"

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

dolce = _\markup\italic"doux"

fort = _\markup\italic"fort"

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

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

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
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}

%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}

mbreak = { }


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \senza
}

IvlIn = \relative do'' {

   sol8
   si'32(la sol8.) la32(sol fad8.)
   sol8. fad32(mi re8.)mi32\p(fad
   sol8.) fad32(mi re8.) mi32\pp(fad

   %4
   sol8.) fad32(mi re8) sol,\f
   si'32(la sol8.) la32(sol fad8.)
   sol8. fad32(mi re8.) \tuplet 3/2 { do32(si la }\mbreak

   %7
   sol8.) fad32(mi re8) do'
   si la r re\p
   si(la) r mi'

   %10
   si(la) r fad'
   si,(la) r sol'
   si,(la) r sol\f

   %13
   si'32(la sol8.) la32(sol fad8.)
   sol8. fad32(mi re8.) do32\p(re
   mi8.) re32 (do si8.) la32(si\mbreak

   %16
   do8.) si32(la sol8) re
   si''32\f(la sol8.) la32(sol fad8.)
   sol8. fad32(mi re8.) do32(re

   %19
   mi8.) re32(do si8.) la32(sol)
   si8(la) r re
   re16(fa) mi8 fa16(sol) si,8

   %22
   si4(do16) si la sol
   mi'(sol) fad!8 sol16(la) dod,8\mbreak
   dod?4(re16) do si la

   %25
   si8 [mi mi mi]
   \tuplet 3/4 { mi32(re dod) } la'4 si8\p
   \tuplet 3/4 { mi,32(re dod) } la'4 si8\f

   %28
   dod, re r la
   fad'[fad fad fad]
   \tuplet 3/4 { fad32(mi red) } si'4 do8\p

   %31
   \tuplet 3/4 { fad,32(mi red) } si'4 do8\f
   red, mi r16 la do, si\mbreak
   la la' la, sol fad \once\stemDown la' fad, mi

   %34
   red \once\stemDown la'' red,,  dod \once\stemUp si  la'' sol fad
   sol32(fad mi8.) fad32(mi red8.)
   \autoBeamOff mi16 fad8 sol lad si16\autoBeamOn

   %37
   sol32(fad mi8.) fad32(mi red8.)
   mi8 mi, r si'\p
   do32(si la16) la la la la la la\mbreak

   %40
   \tuplet 3/4 { do32(si la) } fad'8~fad16 do si la
   \tuplet 3/4 { sol32(fad mi) } mi'8~mi16 si la sol
   si,(sol') fad8 r mi\f

   %43
   sol'32(fad mi8.) fad32(mi red8.)
   mi8. red32(dod si8.) dod32\p(red
   mi8.) red32(dod si8.) dod32\pp (red

   %46
   mi8.) red32(dod si8) mi,\f \mbreak
   sol'32(fad mi8.) fad32(mi red8.)
   mi8. red32(dod si8.) \tuplet 3/2 { la32(sol fad }

   %49
   mi8.) red32(dod si8) la'
   sol(fad) r si\p
   sol(fad) r dod'

   %52
   sol(fad) r red'
   sol,(fad) r mi'
   sol,(fad) r mi\f

   %55
   sol'32(fad mi8.) fad32(mi red8.)
   mi8. red32(dod si16) si' si si
   si16(la sol fad) sol(fad mi re)

   %58
   do(si) la8 r re,
   fad'32(mi re8.) mi32(re dod8.)
   re8. dod32(si la16) la' la la\mbreak

   %61
   la(sol fad mi) fad(mi re do!)
   si(la) sol8 r16 sol' sol sol
   do,(si) la8 r16 sol' sol sol

   %64
   re(do) si8 r16 sol' sol sol
   mi sol32(fa mi re do si) do16 mi32(re do si la sol)
   la16 do32(si la sol fad mi) fad16 la' la la\mbreak

   %67
   si, do32(re mi16) re32(do si16) do32(re mi16) re32(do
   si8) la~la16 re\p do re
   si8 sol'~sol16 fad32 mi re16 do

   %70
   si8 la~la16 si do re
   mi fad sol la si si si si
   si8 la r re,\f

   %73
   si'32(la sol8.) la32(sol fad8.)\mbreak
   sol8. fad32(mi re8.) mi,32\p (fad
   sol8.) fad32(mi re8.) mi'32\pp(fad

   %76
   sol8.) fad32(mi re8) sol,\f
   si'32(la sol8.) la32(sol fad8.)
   sol8. fad32(mi re8.) \tuplet 3/2 { do32(si la}

   %79
   sol8.) fad32(mi re8) re'\staccatissimo
   do\staccatissimo si\staccatissimo r mi\p\mbreak
   do(si) r fad'

   %82
   do(si) r sol'
   do,(si) r la'
   do,(si) r sol\f

   %85
   mi'32(re do8.) fa32(sol la8.)
   \appoggiatura {sol16[fa]} mi8. \tuplet 3/2 { re32(do si } do8) do,
   fad'!32(mi re8.) sol32(la si8.)\mbreak

   %88
   \appoggiatura {la16[sol]} fad8. \tuplet 3/2 { mi32(re dod } re8) re,
   si'[si si dod]
   dod?4(re16) do\p si la

   %91
   si8[si si dod]
   dod?4(re16) do\f si la
   si32(la sol16) mi'(re) si32(la sol16) fad'(sol)

   %94
   si,32\p(la sol16) mi'(re) si32(la sol16) fad'(sol)
   la,8\f la la si16\tr (la32 si)\mbreak
   do8 re16\tr(do32 re) mi8 fad16\tr(mi32 fad)

   %97
   sol8 la16\tr(sol32 la) si8 do
   si la r16 do mi, re
   do do' do, si la\once\stemDown do' la, sol

   %100
   fad\once\stemDown do'' fad,, mi \once\stemUp re do'' si la
   si32(la sol8.) la32(sol fad8.)
   \autoBeamOff sol16 la,8 si do re16\autoBeamOn \mbreak

   %103
   si32(la sol8.) la32(sol fad8.)
   sol8 sol, r4

}

IvlIIn = \relative do'' {

    sol8
   si'32(la sol8.) la32(sol fad8.)
   sol8. fad32(mi re8.)mi32\p(fad
   sol8.) fad32(mi re8.) mi32\pp(fad

   %4
   sol8.) fad32(mi re8) sol,\f
   si'32(la sol8.) la32(sol fad8.)
   sol8. fad32(mi re8.) \tuplet 3/2 { do32(si la }\mbreak

   %7
   sol8.) fad32(mi re8) do'
   si la r re\p
   si(la) r mi'

   %10
   si(la) r fad'
   si,(la) r sol'
   si,(la) r sol\f

   %13
   si'32(la sol8.) la32(sol fad8.)
   sol8. fad32(mi re8.) do32\p(re
   mi8.) re32 (do si8.) la32(si\mbreak

   %16
   do8.) si32(la sol8) re
   si''32\f(la sol8.) la32(sol fad8.)
   sol8. fad32(mi re8.) do32(re

   %19
   mi8.) re32(do si8.) la32(sol)
   si8(la) r re
   re16(fa) mi8 fa16(sol) si,8

   %22
   si4(do16) si la sol
   mi'(sol) fad!8 sol16(la) dod,8\mbreak
   dod?4(re16) do si la

   %25
   si8 [mi mi mi]
   \tuplet 3/4 { mi32(re dod) } la'4 si8\p
   \tuplet 3/4 { mi,32(re dod) } la'4 si8\f

   %28
   dod, re r la
   fad'[fad fad fad]
   \tuplet 3/4 { fad32(mi red) } si'4 do8\p

   %31
   \tuplet 3/4 { fad,32(mi red) } si'4 do8\f
   red, mi r16 la do, si\mbreak
   la la' la, sol fad \once\stemDown la' fad, mi

   %34
   red \once\stemDown la'' red,,  dod \once\stemUp si  la'' sol fad
   sol32(fad mi8.) fad32(mi red8.)
   \autoBeamOff mi16 fad8 sol lad si16\autoBeamOn

   %37
   sol32(fad mi8.) fad32(mi red8.)
   mi8 mi, r sol\p
   fad[fad fad fad]

   %40
   red[red red red]
   mi sol~sol16 sol fad mi
   mi8 red r mi\f

   %43
   sol'32(fad mi8.) fad32(mi red8.)
   mi8. red32(dod si8.) dod32\p(red
   mi8.) red32(dod si8.) dod32\pp (red

   %46
   mi8.) red32(dod si8) mi,\f \mbreak
   sol'32(fad mi8.) fad32(mi red8.)
   mi8. red32(dod si8.) \tuplet 3/2 { la32(sol fad }

   %49
   mi8.) red32(dod si8) la'
   sol(fad) r si\p
   sol(fad) r dod'

   %52
   sol(fad) r red'
   sol,(fad) r mi'
   sol,(fad) r mi\f

   %55
   sol'32(fad mi8.) fad32(mi red8.)
   mi8. red32(dod si16) si' si si
   si16(la sol fad) sol(fad mi re)

   %58
   do(si) la8 r re,
   fad'32(mi re8.) mi32(re dod8.)
   re8. dod32(si la16) la' la la\mbreak

   %61
   la(sol fad mi) fad(mi re do!)
   si(la) sol8 r16 sol' sol sol
   do,(si) la8 r16 sol' sol sol

   %64
   re(do) si8 r16 sol' sol sol
   mi sol32(fa mi re do si) do16 mi32(re do si la sol)
   la16 do32(si la sol fad mi) fad16 la' la la\mbreak

   %67
   si, do32(re mi16) re32(do si16) do32(re mi16) re32(do
   si8) la~la16 re\p do re
   si8 sol'~sol16 fad32 mi re16 do

   %70
   si8 la~la16 si do re
   mi fad sol la si si si si
   si8 la r re,\f

   %73
   si'32(la sol8.) la32(sol fad8.)\mbreak
   sol8. fad32(mi re8.) mi,32\p (fad
   sol8.) fad32(mi re8.) mi'32\pp(fad

   %76
   sol8.) fad32(mi re8) sol,\f
   si'32(la sol8.) la32(sol fad8.)
   sol8. fad32(mi re8.) \tuplet 3/2 { do32(si la}

   %79
   sol8.) fad32(mi re8) re'\staccatissimo
   do\staccatissimo si\staccatissimo r mi\p\mbreak
   do(si) r fad'

   %82
   do(si) r sol'
   do,(si) r la'
   do,(si) r sol\f

   %85
   mi'32(re do8.) fa32(sol la8.)
   \appoggiatura {sol16[fa]} mi8. \tuplet 3/2 { re32(do si } do8) do,
   fad'!32(mi re8.) sol32(la si8.)\mbreak

   %88
   \appoggiatura {la16[sol]} fad8. \tuplet 3/2 { mi32(re dod } re8) re,
   si'[si si dod]
   dod?4(re16) do\p si la

   %91
   si8[si si dod]
   dod?4(re16) do\f si la
   si32(la sol16) mi'(re) si32(la sol16) fad'(sol)

   %94
   si,32\p(la sol16) mi'(re) si32(la sol16) fad'(sol)
   la,8\f la la si16\tr (la32 si)\mbreak
   do8 re16\tr(do32 re) mi8 fad16\tr(mi32 fad)

   %97
   sol8 la16\tr(sol32 la) si8 do
   si la r16 do mi, re
   do do' do, si la\once\stemDown do' la, sol

   %100
   fad\once\stemDown do'' fad,, mi \once\stemUp re do'' si la
   si32(la sol8.) la32(sol fad8.)
   \autoBeamOff sol16 la,8 si do re16\autoBeamOn \mbreak

   %103
   si32(la sol8.) la32(sol fad8.)
   sol8 sol, r4

}

Ivlan = \relative do' {

    si8
    re32(do si8.) fad'32(mi re8.)
    re8 sol r re\p
    re sol r re\pp

    %4
    re sol r16 mi \f re do
    re32(do si8.) fad'32(mi re8.)
    re8 sol la fad\mbreak

    %7
    si, si16 do re8 re
    sol fad r fad\p
    sol(fad) r do'

    %10
    sol(fad) r la
    sol(fad) r si
    sol(fad) r re\f

    %13
    re32(do si8.) fad'32(mi re8.)
    re8 sol sol si\p
    sol mi fa fa\mbreak

    %16
    sol sol re re
    re32\f(do si16) re8 fad32(sol la16) re,8
    re sol sol si

    %19
    sol la re, sol
    sol fad r fad
    sol do si la

    %22
    sol sol r sol
    sol re' dod si\mbreak
    la la r16 fad sol la

    %25
    re,8[si' si si]
    \tuplet 3/4 { dod,32(re mi) } re4 re8\p
    \tuplet 3/4 { dod32(re mi) } re4 re8\f

    %28
    la la r16 sol la si
    do!8[do' do do]
    \tuplet 3/4 { red,32(mi fad) } mi4 mi8\p

    %31
    \tuplet 3/4 { red32(mi fad) } mi4 mi8\p
    si si r16 mi sol fad\mbreak
    mi8 mi16 re do8 do16 si

    %34
    la8 la16 sol fad8 red'
    mi32(fad sol8.) la32(sol fad8.)
    si8 si si mi,16 fad

    %37
    si,8 si8 red32(mi fad8.)
    sol8 mi r mi\p
    red[red red red]\mbreak

    %40
    si[si si si]
    si[si si si]
    si si r si\f

    %43
    mi32(fad sol8.) red32(mi fad8.)
    si,8 mi r si\p
    si mi r si\pp

    %46
    si mi r16 do'\f si la\mbreak
    si32(la sol8.) la32(sol fad8.)
    mi8 si fad' red

    %49
    si si fad' fad
    mi red r red\p
    mi(red) r mi

    %52
    mi(red) r fad
    mi(red) r sol
    mi(red) r si'\f\mbreak

    %55
    si32(la sol8.) la32(sol fad8.)
    si,8 la mi' red
    mi fad si, si16(mi)

    %58
    mi(re) do8 r la'
    la32(sol fad8.) sol32(fad mi8.)
    la,8 sol re' dod\mbreak

    %61
    re mi la, la16 re
    re(do) si do re8 si
    do do16 re mi8 do

    %64
    sol' re16 mi fa8 re
    do sol' mi mi
    re sol, la re\mbreak

    %67
    re la16(re) re8 la16(re)
    re(sol) fad8~fad fad\p
    sol si~si16 la32 sol fad16 la

    %70
    sol8 fad~fad16 fad sol sol
    sol la si fad sol sol sol sol
    sol8 fad r si,\f

    %73
    re32(do si8.) fad'32(mi re8.)\mbreak
    re8 sol r la,\p
    re sol r la,\pp

    %76
    re sol r16 mi\f re do
    re32(do si8.) fad'32(mi re8.)
    re8 sol la fad

    %79
    si, si16 do re8 sol
    la sol r do\p
    la(sol) r la

    %82
    fad(sol) r si
    fad(sol) r do
    fad,(sol) r sol\f

    %85
    sol32(fa mi16) sol8 re si'
    sol fa sol mi
    la fad mi dod\mbreak

    %88
    la sol re' re
    re[re re mi]
    la, la r16 fad'\p sol la

    %91
    re,8[re re mi]
    la, la r16 fad'\f sol la
    re,32(do si16) la re re32(do si16) re8

    %94
    re32\p(do si16) la re re32(do si16) re8
    mi\f mi mi fad\mbreak
    sol sol sol do

    %97
    re re re la
    sol fad r16 sol do si
    sol8 sol16 fad mi8 mi16 re

    %100
    do8 do16 si la fad' sol la
    sol32(la si8.) do32(si la8.)
    re,8 re re fad16 la\mbreak

    %103
    re,32(do si8.) do32(si la8.)
    si8 sol r4

}

Ibcn = \relative do {

    sol8
    sol' si, re do
    si si' r do,\p
    si si' r do,\pp

    %4
    si si' r16 do\f si la
    sol8 si, re do
    si si' fad re\mbreak

    %7
    mi, mi' si fad
    sol [re' re,] r
    r re'\p [re,] r

    %10
    r re' [re,] r
    r re' [re,] r
    r \stemUp re' [re, \stemDown si''\f]\stemNeutral

    %13
    sol si, re do
    si si' si, sol\p
    do do' re re,\mbreak

    %16
    mi mi' si si,
    sol\f si re do
    si si' si, sol

    %19
    do fad sol si
    re re, re' do
    si la sol fa

    %22
    mi mi, r16 sol' la si
    do8 si la sol\mbreak
    fad! fad, r16 re' mi fad

    %25
    sol8[sol sol sol]
    sol[fad fad sol\p]
    sol[fad fad sol\f]

    %28
    sol fad r16 mi fad sol
    la8[la la la]
    la[sol sol la\p]

    %31
    la[sol sol la\f]
    la sol r16 re' mi re\mbreak
    do8 do16 si la8 la16 sol

    %34
    fad8 fad16 mi red8 si
    mi [do' la si]
    sol red mi dod16 red

    %37
    mi8 [sol si si,]
    mi16 mi si sol mi4
    R2*3

    %42
    r4 r8 sol'\f
    mi [do' la si]
    sol sol, r la'\p

    %45
    sol sol, r la'\pp
    sol sol, r16 la'\f sol fad\mbreak
    mi8 do' la si

    %48
    sol sol red si
    sol sol red red'
    mi[si' si,] r

    %51
    r si'\p[si,] r
    r si'[si,] r
    r si'[si,] r

    %54
    r si'[si, sol'\f]\mbreak
    mi do' la si
    sol fad sol fad

    %57
    sol red mi sold,
    la do'16(si) la(sol) fad(mi)
    re8 si' sol la

    %60
    fad mi fad mi\mbreak
    fad dod re fad,
    sol sol'16 la si8 sol

    %63
    la, la'16 si do8 la
    si, si'16 do re8 si
    do si la sol

    %66
    fad mi re fad\mbreak
    sol fad sol fad
    sol[re re re\p]

    %69
    re[re re re]
    re re re mi16 si
    do do'si la sol8 dod,

    %72
    re re, r sol'\f
    sol, si re do\mbreak
    si si' r do,\p

    %75
    si si' r do,\pp
    si si' r16 do\f si la
    sol8 si, re do

    %78
    si si' fad re
    mi, mi' si si'
    fad[sol sol,] r\mbreak

    %81
    r sol'\p[sol,] r
    r sol'[sol,] r
    r sol'[sol,] r

    %84
    r sol'[\once\stemUp sol, si'\f]
    do, re si sol
    do re mi mi,

    %87
    fad' si dod, la\mbreak
    re mi fad fad,
    sol[sol' sol sol]

    %90
    fad fad, r16 re'\p mi fad
    sol8[sol sol sol]
    fad fad, r16 re'\f mi fad

    %93
    sol8 fad sol si
    sol\p fad sol si
    do,\f do do re\mbreak

    %96
    mi si do la
    si fad sol fad'
    sol re r16 mi sol fad

    %99
    mi8 mi16 re do8 do16 si
    la8 la16 sol fad re' mi fad
    sol8 mi' do re

    %102
    si fad sol la16 fad\mbreak
    sol8 mi do re
    sol,4 r

}


Ibfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 2/4
   \key sol\major
   \tempo 2 = 47
   \partial 8 s8
   s2*104
   \bar "|."


}

IvlI = {
   \Iglobal
   \clef violin
   \notypeset
   <<\IvlIn \forma >>

}

IvlII = {
   \Iglobal
   \clef violin
   <<\IvlIIn \forma >>

}

Ivla ={
   \Iglobal
   \clef alto
   << \Ivlan \forma >>

}

Ibc = {
   \Iglobal
   \clef bass
   << \Ibcn \Ibfn \forma >>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IIvlIn = \relative do'' {

    mi,8
    si' [\appoggiatura {dod16[red]} mi8] mi sol
    fad32(mi red dod) si4 do8
    si32(la sol fad) mi4 do'8

    %4
    red, fad r mi\mbreak
    si '[\appoggiatura {dod16[red]} mi8] mi sol
    fad32(mi red dod) si4 do8

    %7
    si32(la sol fad) mi4 mi'8
    mi\tr red r si'\f
    \appoggiatura la8 sol8. fad16 mi32(fa re16) do32[(re si16)]

    %10
    \appoggiatura si8 do8. \tuplet 4/2{mi64(re do si la32 sold) } la16 do mi la
    \appoggiatura sol8 fad8. mi16 re32(mi do16) si32[(do la16)]
    \appoggiatura la8 si8. \tuplet 4/2{re64(do si la sol32 fad)} sol16 sol' fad sol

    %13
    la,(si32 do) la8~la16 sol' fad sol
    si,(do32 re) si8~si16 sol' fad sol
    do,(re32 mi) do8~do16 sol' fad sol

    %16
    re, fad la do la'8. \tuplet 5/2{sol32(fad mi re do)}\mbreak
    si16 mi8 re32(do si16) mi8\p re32 (do
    si16) sol'8\f fad32(mi re16) si'8 la32(sol

    %19
    fad8) sol r16 do,\p do do
    si do32(re mi16) mi, sol8 la\tr
    sol4 r8 mi\f

    %22
    si' [\appoggiatura {dod16[red]} mi8] mi sol
    fad32(mi red dod) si4 do8
    si32(la sol fad) mi4 do'8

    %25
    red, fad r mi\p
    si'[\appoggiatura {dod16[red]} mi8] mi sol
    fad32(mi red dod) si4 do'8

    %28
    si32(la sol fad) mi4 do'8
    red, fad r si\f
    \appoggiatura la8 sol8. fad16 mi32(fad red16) mi (do!)\mbreak

    %31
    do8.\tr  si32(lad) si16 fad' la,\p fad'
    \appoggiatura la,8 sol8. fad16 mi32(fad red16) mi(do)
    do8.\tr si32(lad) si16 fad' la,\f fad'

    %34
    sol,(si) red(mi) do'8.\tr si32(la)
    sol16(si) red(mi) do'8.\tr si32(la)\mbreak
    sol16 fad32(mi fad16) do! red8\tr mi

    %37
    la,32\p(si sol16)~sol32(la fad16)~fad32(sol mi16)~mi32(fad red16)~
    red do'!\staccatissimo si\staccatissimo mi,\staccatissimo  \appoggiatura {mi16[fad]} sol8 fad16(mi)
    mi2

}

IIvlIIn = \relative do'' {

    mi,8
    sol[sol sol si]
    si[fad fad fad]
    mi[mi mi do]

    %4
    si red r mi\p \mbreak
    si'[si si si]
    si[fad fad fad]

    %7
    mi mi mi fad
    fad fad r si\f
    si la si si

    %10
    la la r la\mbreak
    la sol la la
    sol sol r sol

    %13
    la[la la la]
    si[si si si]
    do[do do do]

    %16
    la[la la la]\mbreak
    sol la sol la\p
    sol do\f re mi

    %19
    re si r16 la\p la la
    sol8 mi re re
    re4 r8 mi\f

    %22
    mi sol sol si
    si fad fad fad\mbreak
    mi[mi mi do]

    %25
    si red r mi\p
    si'[si si si]
    si[si si red]

    %28
    mi[si si do]
    si red r fad\f
    mi red si mi16 do!\mbreak

    %31
    do8.\tr  si32(lad) si16 fad' la,\p fad'
    \appoggiatura la,8 sol8. fad16 mi32(fad red16) mi(do)
    do8.\tr si32(lad) si16 fad' la,\f fad'

    %34
    sol,(si) red(mi) do'8.\tr si32(la)
    sol16(si) red(mi) do'8.\tr si32(la)\mbreak
    sol16 fad32(mi fad16) do! red8\tr mi

    %37
    la,32\p(si sol16)~sol32(la fad16)~fad32(sol mi16)~mi32(fad red16)~
    red do'!\staccatissimo si\staccatissimo mi,\staccatissimo  \appoggiatura {mi16[fad]} sol8 fad16(mi)
    mi2

}

IIvlan = \relative do' {

    sol8
    mi' si si mi
    fad[fad si, red]
    mi [si si fad]

    %4
    fad si r si\p\mbreak
    mi[mi mi mi]
    fad fad si, red

    %7
    mi si si dod
    si si r fad'
    mi red mi mi

    %10
    mi do r mi\mbreak
    re dod re re
    re si r re

    %13
    mi[mi mi mi]
    fad[fad fad fad]
    sol[sol sol sol]

    %16
    re[re re re]\mbreak
    re la16(re) re8 la16\p(re)
    re8 do\f sol' mi

    %19
    la sol r re\p
    re la si fad
    si4 r8  si\f

    %22
    sol si si mi
    fad fad si, red\mbreak
    mi[si si fad]

    %25
    fad si r si\p
    mi[mi mi mi]
    fad[fad fad fad]

    %28
    si[sol sol fad]
    fad si r si\f
    si la mi sol\mbreak

    %31
    fad fad r red\p
    si la si sol
    fad fad r red\f

    %34
    sol sol fad fad16(si)
    si8 sol' fad fad16(si)\mbreak
    si la32(sol la16)  sol fad8.\tr sol16

    %37
    mi8\p  re do si
    la16 red mi8 mi red
    mi2

}

IIbcn = \relative do {

    mi,8
    mi'[mi mi mi]
    red[red red la']
    sol[sol sol, la]

    %4
    si si' r16 la\p sol fad\mbreak
    sol8[sol sol mi]
    red[red red la']

    %7
    sol sol sol, lad
    si si' r red,\f
    mi fad sol sold

    %10
    la la, r do\mbreak
    re mi fad re
    sol sol, r si

    %13
    do[do do do]
    re[re re re]
    mi[mi mi mi]

    %16
    fad[fad fad fad]\mbreak
    sol fad sol fad\p
    sol la\f si do

    %19
    re mi r fad,\p
    sol do, re re,
    sol4 r16 la'\f sol fad

    %22
    mi8[mi mi mi]
    red[red red la']\mbreak
    sol sol sol, la

    %25
    si si' r16 la\p sol fad
    sol8 sol sol mi
    red[red red la']

    %28
    sol[sol sol la]
    si si, r red
    mi fad sol mi\mbreak

    %31
    red red, r si'\p
    mi, fad sol mi
    red red r si'\f

    %34
    mi, mi red red
    mi' mi red red\mbreak
    mi la si si,

    %37
    do\p si la sol
    fad sol si si
    mi,2

}


IIbfn = {

    \figures {

        \bassFigureExtendersOff
        \bassFigureStaffAlignmentUp





    }

}

forma = {

    \time 2/4
    \key sol\major
    \tempo 4 = 50
    \partial 8 s8
    s2*39
    \bar "|."

}

IIvlI = {
    \IIglobal
    \clef violin
    \notypeset
    <<\IIvlIn \forma >>

}

IIvlII = {
    \IIglobal
    \clef violin
    <<\IIvlIIn \forma >>

}

IIvla ={
    \IIglobal
    \clef alto
    << \IIvlan \forma >>

}

IIbc = {
    \IIglobal
    \clef bass
    << \IIbcn \IIbfn \forma >>
    \typeset

}


IIIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    R1*5
    sol'1
    fad2.\tr mi8 fad

    %8
    sold2.\tr fad8 sold\mbreak
    la4 sol! fad mi8 fad
    sol4 fad mi re8 mi

    %11
    fad4 re sol2~
    sol4 fad8 mi fad4 mi
    re2.\tr dod8 re

    %14
    mi2. la8 sol
    fad4 mi8 fad sol4 fa
    mi re do si8 do\mbreak

    %17
    re2. do8 si
    la2 re~
    re4 mi8 fa si,4 mi~

    %20
    mi mi la, re~
    re re si'2~
    si4 la8 sold la4 sol

    %23
    fad sol la2~\mbreak
    la4 sol8 fad sol2~
    sol4 si8 la sol4 fad

    %26
    mi re dod si
    la2. sold8(la16 si)
    la2. \p sold8(la16 si)

    %29
    la2.\f fad'4
    mi re dod si
    la2 r

    %32
    R1*3
    la'1
    fad2.\tr mi8 fad

    %37
    sold2.\tr fad8 sold\mbreak
    la4 sol! fad mi8 fad
    sol4 fad mi fad8 mi

    %40
    re4 mi fad sol8 fad
    mi4 fad8 sold la2~
    la4 sol!8 fad si4 la

    %43
    sol fad mi re8 mi
    fad4 mi re dod8 re
    mi2 re~

    %46
    re4 fad8 mi re4 dod\mbreak
    si dod8 re mi4 re
    dod2 re~

    %49
    re4 dod8 re mi2~
    mi4 re8 dod re mi fad sol
    la4 mi la2~

    %52
    la4 sol8 fad si4 la
    sold fad8 sold la4 sol
    fad mi re2~\mbreak

    %55
    re dod~
    dod si~
    si la~

    %58
    la sold
    la4 si dod si8 dod
    re4 mi fad sold

    %61
    la2 si4 sold8(la16 si)
    la2\p si4 sold8(la16 si)\mbreak
    la2\f si4 sold8(la16 si)

    %64
    la4 sol! fad mi8 fad
    sol4 fad mi re8 mi
    fad4 mi8 fad sol4 fad

    %67
    mi re8 mi fad4 mi
    re dod8 re mi4 re
    dod si8 dod re4 do

    %70
    si2 sol'\mbreak
    sol fad~
    fad mi~

    %73
    mi re~
    re do~
    do si~

    %76
    si4 do8 si la4 sol
    fad mi'8 re do4 si
    la sol la fad

    %79
    sol2 la4 fad8(sol16 la)\mbreak
    sol2\p la4 fad8(sol16 la)
    sol2 \f la4 fad8(sol16 la)

    %82
    sol4 la si do
    la si8 do re4 do
    si8 do si la sol la si do

    %85
    re4 la re2~
    re4 do8 si mi4 re
    do si8 do re4 do\mbreak

    %88
    si re sol fad8 sol
    la4 fad sol la
    si la sol2~

    %91
    sol4 fad8 mi la4 sol
    fad mi8 fad sol4 fad
    mi re8 mi fad4 mi8 fad

    %94
    sol4 la si2
    la r
    R1*3

    %99
    re1
    si2. \tr la8 si
    dod2.\tr  si8 dod

    %102
    re4 do! si la8 si
    do4 si la sol8 la
    si2. re,4\mbreak

    %105
    la'2. si8 la
    sol2. mi4
    fad2. sol8 fad

    %108
    mi2. do4
    re2. mi8 re
    do2. re8 do

    %111
    si4 do re do8 si
    la4 si do re8 do
    si4 la r re

    %114
    mi fad sol fad8 mi\mbreak
    fad4 mi8 fad sol4 mi
    fad4 mi8\p fad sol4 mi

    %117
    fad mi8\f fad sol4 mi
    fad sol la2~
    la4 sol8 fad sol4 fa

    %120
    mi fad! sol la8 sol
    fad4 mi8 re mi4 fad
    sol sol, sol'2~

    %123
    sol4 mi fad2\tr
    sol1\fermata

}

IIIvlIIn = \relative do'' {

    re1
    si2.\tr la8 si
    dod2. si8 dod

    %4
    re4 do! si la8 si
    do4 si la sol8 la
    si4 sol8 la si4 dod

    %7
    re la re dod
    si dod8 re mi4 re\mbreak
    dod si8 dod re4 do

    %10
    si la8 si dod4 si8 dod
    re4 do! si la8 sol
    la1~

    %13
    la4 sol8 fad sol2~
    sol4 fad8 sol la2~
    la4 si8 la sol2~

    %16
    sol4 re mi fad8 mi\mbreak
    re4 do re mi
    fad fad8 sol la4 si8 la

    %19
    sold4 re'8 do si2
    la4 do8 si la2
    sol4 do si dod8 re

    %22
    dod4 re mi2~
    mi4 re8 dod re4 do\mbreak
    si dod re mi8 re

    %25
    dod2. re8 dod
    si4 la sol fad
    mi sol8 fad mi4 re

    %28
    mi sol8\p fad mi4 re
    mi sol8\f fad mi4 fad8 sol
    la4 la2 sold4\mbreak

    %31
    la si dod si8 dod
    re2 red\tr
    mi1~

    %34
    mi4 re!8 dod re2~
    re4 dod8 si dod2
    re4 dod si2~

    %37
    si4 la8 si dod4 si
    la2. si8 la\mbreak
    sol4 la si dod8 si

    %40
    la2 la
    la r
    R1*3

    %45
    la1
    fad2.\tr mi8 fad\mbreak
    sold2.\tr fad8 sold

    %48
    la4 sol! fad mi8 fad
    sol4 fad mi re8 mi
    fad2 la~

    %51
    la dod
    si1~
    si2 la~

    %54
    la4 sol la re8 dod\mbreak
    si2 la
    fad1~

    %57
    fad2 mi~
    mi mi~
    mi la~

    %60
    la4 la la re
    dod si8 dod re4 si
    dod si8\p dod re4 si\mbreak

    %63
    dod si8\f dod re4 si
    dod si8 dod re2~
    re4 re dod si8 dod

    %66
    re4 la re dod8 re
    mi4 re dod si8 dod
    re4 dod si la8 si

    %69
    dod4 si la sol8 la
    si4 do! re do8 si\mbreak
    la1

    %72
    sol
    fad
    mi

    %75
    re2 sol4 fad
    mi2. mi4
    fad2. sol8 fad

    %78
    mi4 re mi do
    re do8 re mi4 do\mbreak
    re do8\p re mi4 do

    %81
    re do8\f re mi4 do
    re  re sol la
    fad2. mi8 fad

    %84
    re2 sol
    la2. sol8 la
    si2. la8 si

    %87
    do4 si la sol8 la\mbreak
    si4 la sol si
    la1

    %90
    re,2 sol4 fad
    mi la2 dod4
    la2 r

    %93
    R1
    sol'
    fad2.\tr mi8 fad

    %96
    sold2. fad8 sold\mbreak
    la4 sol! fad mi8 fad
    sol4 fad mi re8 mi

    %99
    fad4 sol la2~
    la4 la sol fad
    mi fad8 sol la4 sol

    %102
    fad mi8 fad sol4 fad8 sol
    la4 sol fad mi8 fad
    sol4 re sol2~\mbreak

    %105
    sol4 la fad2~
    fad4 si, mi2~
    mi4 fad re2~

    %108
    re4 sol, do2~
    do4 re8 do si2~
    si4 mi, la2~

    %111
    la4 sol8 fad sol4 la8 sol
    fad4 sol la fad
    sol fad r la

    %114
    si do re mi\mbreak
    re2. dod8(re16 mi)
    re2.\p dod8(re16 mi)

    %117
    re2.\f dod8 (re16 mi)
    re2. do!4
    si do re2~

    %120
    re4 do8 si do4 do
    do2. si8 la
    sol2. la4

    %123
    la2 la
    si1\fermata

}

IIIvlan = \relative do' {

    R1*16
    sol'1
    fad2.\tr mi8 fad

    %19
    sold2. \tr fad8 sold
    la4 sol! fad mi8 fad
    sol4 fad mi2~

    %22
    mi4 re la'2~
    la4 sol re fad\mbreak
    re2 si'

    %25
    mi,4 sol8 fad mi4 re
    sol fad mi re
    dod mi8 re dod4 si

    %28
    dod mi8\p re dod4 si
    dod mi8\f re dod4 re
    dod fad mi re\mbreak

    %31
    dod re mi fad8 mi
    re4 mi8 fad sol4 fad
    mi fad8 sold la4 sol

    %34
    fad sol la sol8 fad
    mi2. fad8 mi
    re2 r

    %37
    R1*3
    re1
    dod2.\tr si8 dod

    %42
    red2.\tr dod8 red
    mi4 re! dod si8 dod
    re4 dod si la8 si

    %45
    dod4 la re2~
    re4 re8 mi fad4 si8 la\mbreak
    sold4 fad mi2~

    %48
    mi4 la, si2~
    si4 la8 si dod4 si8 dod
    la4 fad'8 mi fad sol la si

    %51
    mi,2.\tr re8 mi
    fad2.\tr mi8 fad
    sold4 si, mi2

    %54
    fad4 dod re dod8 re\mbreak
    mi1~
    mi2 re

    %57
    dod4 re mi re8 dod
    si1
    dod4 re mi re8 mi

    %60
    fad4 dod re dod8 si
    mi4 re8 mi fad4 re
    mi re8\p mi fad4 re\mbreak

    %63
    mi re8\f  mi fad4 re
    mi re8 mi fad4 sol8 fad
    mi4 fad8 sol la2~

    %66
    la sol4 si
    la2. la4
    fad sol8 fad mi2~

    %69
    mi4 fad8 mi re2~
    re re~\mbreak  %%% fine pagina
    re re

    %72
    si1~
    si2 si
    sol1~

    %75
    sol2 re'
    do2. si4
    la do8 si la4 sol

    %78
    do si do la
    si la8 si do4 la\mbreak
    si la8\p si do4 la

    %81
    si la8\f si do4 la
    si fad sol do
    re2 re,

    %84
    sol8 mi' re do si do re mi
    la,2 fad'
    mi1

    %87
    mi2 r\mbreak
    R1
    re'

    %90
    si2.\tr la8 si
    dod2.\tr si8 dod
    re4 do! si la8 si

    %93
    do4 si la sol8 la
    si4 do re2~
    re4 fad, re' dod

    %96
    si re8 dod si4 dod8 si\mbreak
    la2. si8 la
    sol4 si la2~

    %99
    la4 sol re'2~
    re4 la si2
    la2. dod8 si

    %102
    la2 sol
    mi re
    re2. do8 si\mbreak

    %105
    mi4 do re fad8 mi
    re4 si do mi8 re
    do4 la si re8 do

    %108
    si4 sol la do8 si
    la4 fad sol si8 la
    sol4 do8 si la4 fad'

    %111
    re do sol' mi
    re1~
    re2. fad4

    %114
    sol la si dod\mbreak
    la4 sol8 la si4 sol
    la sol8\p la si4 sol

    %117
    la sol8\f la si4 sol
    la sol re2~
    re4 do sol'2~

    %120
    sol4 re do mi
    la,2 re
    si4 si8 do re4 mi

    %123
    re2 re
    re1\fermata

}

IIIbcn = \relative do {

    R1*11
    re'1
    si2.\tr la8 si

    %14
    dod2.\tr  si8 dod
    re4 do! si la8 si
    do4 si la sol8 la\mbreak

    %17
    si4 la si do
    re re, re' do
    si do8 re mi4 re

    %20
    do si8 do re4 do
    si la sol sold
    la si dod la

    %23
    re, mi fad re\mbreak
    sol, la si sol
    la1~

    %26
    la~
    la~
    la~

    %29
    la~
    la~
    la4 la la' sol\mbreak

    %32
    fad sol8 la si4 la
    sol la8 si dod4 la
    re, mi fad sol

    %35
    la2 la,
    re re'4 dod
    si dod8 re mi4 re

    %38
    dod si8 dod re4 dod\mbreak
    si la sol la8 sol
    fad4 mi re2

    %41
    la'2.\tr sold8 la
    si2 si,
    mi4 fad8 sol! la4 sol

    %44
    fad2 sol~
    sol fad
    si1\mbreak

    %47
    mi,1
    la,2 r
    R1

    %50
    re
    dod2.\tr si8 dod
    red2.\tr dod8 red

    %53
    mi4 re! dod si8 dod
    re4 mi fad si8 la\mbreak
    sold4 fad8 sold la4 la,

    %56
    re dod re si
    fad' mi8 re dod4 re
    mi re mi mi,

    %59
    la1~
    la~
    la~

    %62
    la~\mbreak
    la~
    la2 la'

    %65
    la la
    re4 dod si la8 si
    dod4 si la sol8 la

    %68
    si4 la sol fad8 sol
    la4 sol fad mi8 fad
    sol,4 la si do!\mbreak

    %71
    re mi fad re
    mi fad sol la
    si si, re si

    %74
    do re mi fad
    sol sol, si sol
    la si do la

    %77
    re1~
    re~
    re~\mbreak

    %80
    re~
    re~
    re2 r

    %83
    R1
    sol1
    fad2.\tr mi8 fad

    %86
    sold2.\tr  fad8 sold
    la4 sol! fad mi8 fad\mbreak
    sol4 fad mi re8 mi

    %89
    fad4 re mi fad
    sol fad mi fad8 sol
    la4 sol fad mi

    %92
    re2 sol
    do, re
    sol,1

    %95
    re'2 si'
    mi,4 mi mi re\mbreak
    dod si8 dod re4 dod

    %98
    si la8 si dod4 si8 dod
    re4 mi fad mi8 fad
    sol4 fad mi fad8 sol

    %101
    la4 sol fad mi
    re2 mi
    do re

    %104
    sol,4 la si sol\mbreak
    do la re re'8 do
    si4 sol do si

    %107
    la fad si, si'8 la
    sol4 mi la sol
    fad re sol, sol'8 fad

    %110
    mi4 do fad re
    sol, la si do
    re1~

    %113
    re~
    re~\mbreak
    re~

    %116
    re~
    re
    re4 mi fad re

    %119
    sol, la si sol
    do re mi do
    re2 r4 re

    %122
    mi2 si4 do
    re2 re,
    sol1\fermata

}


IIIbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 2/2
   \key sol\major
   \tempo 1 = 60
      s1*124
   \bar "|."

}

IIIvlI = {
   \IIIglobal
   \clef violin
   \notypeset
   <<\IIIvlIn \forma >>

}

IIIvlII = {
   \IIIglobal
   \clef violin
   <<\IIIvlIIn \forma >>

}

IIIvla ={
   \IIIglobal
   \clef alto
   << \IIIvlan \forma >>

}

IIIbc = {
   \IIIglobal
   \clef bass
   << \IIIbcn \IIIbfn \forma >>
   \typeset

}


IVglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {

    sol8 si re
    \afterGrace la'4.\tr ( {sol16[la)]}
    si8 fad sol

    %4
    re16(si) do(la) si(fad)
    sol8 si re
    \afterGrace la'4.\tr ( {sol16[la)]}

    %7
    si8 sol mi
    dod8.\tr (si32 dod) la'8
    si,8.\tr(la32 si) sol'8

    %10
    la,8.\tr(sol32 la) fad'8\mbreak
    sol,8.\tr (fad32 sol) mi'8
    fad,8.\tr(mi32 fad) re'8

    %13
    mi, fad sol
    la sol4\tr
    fad8 sol mi

    %16
    re16 mi fad sol la si
    dod8\p dod16(re32 mi) re8
    dod8 dod16(re32 mi) re8

    %19
    dod8\pp dod16(re32 mi) re8\mbreak
    dod8 dod16(re32 mi) re8
    la'8\f si, dod

    %22
    re mi16(fad32 sol) fad8
    sol la, si
    dod re16(mi32 fad) mi8

    %25
    fad dod4\tr
    re8 \appoggiatura {sol16[la]} si4
    la16(sol fad8) mi

    %28
    re4. re
    re,8 fad la
    \afterGrace mi'4.\tr ({re16[mi)]}

    %31
    fad8 dod re
    si la16 sol fad mi
    re8 fad la

    %34
    \afterGrace mi'4.\tr ({re16[mi)]}
    fad8 dod re
    lad8.\tr(sold32 lad) fad'8

    %37
    sol,!8.(fad32 sol) mi'8
    fad,8.\tr(mi32 fad) re'8\mbreak
    mi,8.\tr(re32 mi) dod'8

    %40
    re,8.\tr(dod32 re) la'!8
    sol fad16 sol la8
    sol fad la\p

    %43
    sol fad16 sol la8
    sol fad16 la do!8\f
    si mi mi

    %46
    si fad' fad
    si, sol' fad16 mi
    red si la sol fad mi

    %49
    red8\p red16(mi32 fad) mi8
    red8 red16(mi32 fad) mi8
    red'8\pp red16(mi32 fad) mi8\mbreak

    %52
    red8 red16(mi32 fad) mi8
    do'\f re,! mi
    fad sol16(la32 si) la8

    %55
    si do, re
    mi fad16(sol32 la) sol8
    la red,4\tr

    %58
    mi8 la,4\tr
    si16(la sol8) fad
    mi16 si dod red mi fad\mbreak

    %61
    sold8\p sold16(la32 si) la8
    si si16(do32 re) do8
    fad, fad16(sol32 la) sol8

    %64
    la la16(si32 do) si8
    mi\f la, fad'16(sol32 la)
    sol8 sol, la16(si32 do)

    %67
    si16 re do si la sol
    fad8 mi16 fad re8\mbreak
    sol si re

    %70
    \afterGrace la'4.\tr ({sol16[la)]}
    si8 fad sol
    re16(si) do(la) si(fad)

    %73
    sol8 si re
    \afterGrace la'4.\tr ( {sol16[la)]}
    si8 mi, la

    %76
    fad8.\tr(mi32 fad) re'8\mbreak
    mi,8.\tr(re32 mi) do'8
    re,8.\tr(do32 re) si'8

    %79
    do,8.\tr( si32 do) la'8
    si,8.\tr(la32 si) sol'8
    la, si do

    %82
    re do4
    si8 do la
    sol16 la si do re mi\mbreak

    %85
    fad8\p fad16(sol32 la) sol8
    fad8 fad16(sol32 la) sol8
    fad,8\pp fad16(sol32 la) sol8

    %88
    fad8 fad16(sol32 la) sol8
    re'\f mi, fad
    sol la16(si32 do) si8

    %91
    do re, mi
    fad sol16(la32 si) la8\mbreak
    si fad4\tr

    %94
    sol8 \appoggiatura {do16[re]} mi4
    re16(do si8) la
    sol4. sol\fermata

}

IVvlIIn = \relative do'' {

    sol8 si re
    \afterGrace la'4.\tr ( {sol16[la)]}
    si8 fad sol

    %4
    re16(si) do(la) si(fad)
    sol8 si re
    \afterGrace la'4.\tr ( {sol16[la)]}

    %7
    si8 sol mi
    dod8.\tr (si32 dod) la'8
    si,8.\tr(la32 si) sol'8

    %10
    la,8.\tr(sol32 la) fad'8\mbreak
    sol,8.\tr (fad32 sol) mi'8
    fad,8.\tr(mi32 fad) re'8

    %13
    mi, fad sol
    la sol4\tr
    fad8 sol mi

    %16
    re4 r8
    sol8\p sol16(la32 si) la8
    sol8 sol16(la32 si) la8

    %19
    sol8\pp sol16(la32 si) la8\mbreak
    sol8 sol16(la32 si) la8
    la'\f si, dod

    %22
    re mi16(fad32 sol) fad8
    sol la, si
    dod re16(mi32 fad) mi8

    %25
    fad dod4\tr
    re8 \appoggiatura {sol16[la]} si4
    la16(sol fad8) mi

    %28
    re4. re
    re,8 fad la
    \afterGrace mi'4.\tr ({re16[mi)]}

    %31
    fad8 dod re
    si la16 sol fad mi
    re8 fad la

    %34
    \afterGrace mi'4.\tr ({re16[mi)]}
    fad8 dod re
    lad8.\tr(sold32 lad) fad'8

    %37
    sol,!8.(fad32 sol) mi'8
    fad,8.\tr(mi32 fad) re'8\mbreak
    mi,8.\tr(re32 mi) dod'8

    %40
    re,8.\tr(dod32 re) la'!8
    sol fad16 sol la8
    sol fad la\p

    %43
    sol fad16 sol la8
    sol fad16 la do!8\f
    si mi mi

    %46
    si fad' fad
    si, sol' fad16 mi
    red4 r8

    %4
    la,8\p la16(si32 do) si8
    la8 la16(si32 do) si8
    la'8\pp la16(si32 do) si8\mbreak

    %7
    la8 la16(si32 do) si8
    do'\f re, mi
    fad sol16(la32 si) la8

    %55
    si do, re
    mi fad16(sol32 la) sol8
    la red,4\tr

    %58
    mi8 la,4\tr
    si16(la sol8) fad
    mi4 r8\mbreak

    %61
    re8\p re mi
    mi mi mi
    do do re

    %64
    re re re
    mi'\f la, fad'16(sol32 la)
    sol8 sol, la16(si32 do)

    %67
    si16 re do si la sol
    fad8 mi16 fad re8\mbreak
    sol si re

    %70
    \afterGrace la'4.\tr ({sol16[la)]}
    si8 fad sol
    re16(si) do(la) si(fad)

    %73
    sol8 si re
    \afterGrace la'4.\tr ( {sol16[la)]}
    si8 mi, la

    %76
    fad8.\tr(mi32 fad) re'8\mbreak
    mi,8.\tr(re32 mi) do'8
    re,8.\tr(do32 re) si'8

    %79
    do,8.\tr( si32 do) la'8
    si,8.\tr(la32 si) sol'8
    la, si do

    %82
    re do4
    si8 do la
    sol4 r8\mbreak

    %85
    do\p do16(re32 mi) re8
    do do16(re32 mi) re8
    do,\pp do16(re32 mi) re8

    %88
    do do16(re32 mi) re8
    re'\f mi, fad
    sol la16(si32 do) si8

    %91
    do re, mi
    fad sol16(la32 si) la8\mbreak
    si fad4\tr

    %94
    sol8 \appoggiatura {do16[re]} mi4
    re16(do si8) la
    sol4. sol\fermata

}

IVvlan = \relative do' {

    si8 re si
    mi re4
    re8 do re

    %4
    sol fad fad
    re re si'
    mi, re4

    %7
    re8 re mi
    mi4 re8
    re4 dod8

    %10
    re4 si8\mbreak
    si4 la8
    la4 fad'8

    %13
    si, si si16 dod
    re8 mi dod
    re mi dod

    %16
    re4 r8
    mi\p mi16(fad32 sol) fad8
    mi mi16(fad32 sol) fad8

    %19
    mi\pp mi16(fad32 sol) fad8\mbreak
    mi mi16(fad32 sol) fad8
    re\f re  sol

    %22
    fad la la
    si, re re
    sol fad la

    %25
    la sol4
    la8 si dod
    re re, dod

    %28
    fad4. fad\mbreak
    fad,8 la fad
    si la4

    %31
    la8 sol la
    re dod16 mi re dod
    re8 fad fad

    %34
    si la4
    la8 fad fad
    dod4 si8

    %37
    si4 lad8
    si4 fad8\mbreak
    lad4 fad8

    %40
    fad4 red'8
    mi red16 mi fad8
    mi8 red red\p

    %43
    mi red16 mi fad8
    mi red red\f
    mi si' si

    %46
    si si si
    si si la16 sol
    fad4 r8

    %49
    fad,8\p fad16(sol32 la) sol8
    fad fad16(sol32 la) sol8
    fad'\pp fad16(sol32 la) sol8

    %52
    fad fad16(sol32 la) sol8
    mi\f re la'
    la sol re

    %55
    re do sol'
    sol fad si,
    la fad'4

    %58
    mi8 mi4
    mi8 mi red
    sol,4 r8\mbreak

    %61
    si\p si do
    sold sold la
    la la si

    %64
    fad fad sol!
    sol'\f la la
    si, si re

    %67
    re sol, do16 si
    la8 sol16 la fad8\mbreak
    si re si

    %70
    mi re4
    re8 do re
    sol fad fad

    %73
    re re si'
    mi, re4
    re8 mi do'

    %76
    la4 sol8\mbreak
    sol4 fad8
    sol4 mi8

    %79
    mi4 re8
    re4 si8
    mi4 mi16 fad

    %82
    sol8 la fad
    sol la fad
    sol4 r8\mbreak

    %85
    la\p la16(si32 do) si8
    la la16(si32 do) si8
    la,\pp la16(si32 do) si8

    %88
    la la16(si32 do) si8
    sol \f sol do
    si re re

    %91
    do sol sol
    do si re\mbreak
    re la4

    %94
    re8 mi fad
    sol sol fad
    si,4. si\fermata

}

IVbcn = \relative do {

    sol8 sol sol
    sol' fad16 mi fad re
    sol8 la si

    %4
    si, re do
    si sol sol
    sol' fad16 mi fad re

    %7
    sol8 si sol
    la sol fad
    sol fad mi

    %10
    fad mi re\mbreak
    mi re dod
    re fad re

    %13
    sol fad mi
    fad dod la
    re sol, la

    %16
    re,4 r8
    R4.*4
    fad'8\f sol la

    %22
    si dod re
    mi, fad sol
    la si dod

    %25
    re, mi la,
    fad' sol mi
    fad la la,

    %28
    re re16 do si la re8 la fad
    re re re
    re' dod16 si dod la

    %31
    re8 mi fad
    sol la sol
    fad re' re

    %34
    re, dod16 si dod la
    re8 lad si
    fad' mi re

    %37
    mi re dod
    re dod si\mbreak
    dod si lad

    %40
    si re si
    si si si
    si si' si,\p

    %43
    si si si
    si si' fad\f
    sol sol sol

    %46
    red red red
    mi mi la,
    si4 r8

    %49
    R4.*4
    la8\f si do
    re mi fad

    %55
    sol, la si
    do re mi
    fad si la

    %58
    sol do, do'
    sol si si,
    mi,4.\mbreak

    %61
    R4.*4
    do'8\f do re
    mi mi fad

    %67
    sol mi do
    re4.\mbreak
    sol,8 sol sol

    %70
    sol' fad16 mi fad re
    sol8 la si
    si, re do

    %73
    si la sol
    sol' fad16 mi fad re
    sol8 do la

    %76
    re do si\mbreak
    do si la
    si la sol

    %79
    la sol fad
    sol si sol
    do, si la

    %82
    si fad re
    sol do re
    sol,4 r8\mbreak

    %85
    R4.*4
    si8\f do re
    mi fad sol

    %91
    la, si do
    re mi fad\mbreak
    sol, re' do

    %94
    si do la
    si re re,
    sol si sol sol4.\fermata

}


IVbfn = {

   \figures {

      \bassFigureExtendersOff
      \bassFigureStaffAlignmentUp





   }

}

forma = {

   \time 3/8
   \key sol\major
   \tempo 4. = 60
   \repeat volta 2 {s4.*27}
   \alternative {{s4.}{s}}
   \bar":..:"\break \set Score.currentBarNumber = #29
   \repeat volta 2 {s4.*67}
   \alternative {{s4.}{s}}
   \bar "|."


}

IVvlI = {
   \IVglobal
   \clef violin
   %\notypeset
   <<\IVvlIn \forma >>

}

IVvlII = {
   \IVglobal
   \clef violin
   <<\IVvlIIn \forma >>

}

IVvla ={
   \IVglobal
   \clef alto
   << \IVvlan \forma >>

}

IVbc = {
   \IVglobal
   \clef bass
   << \IVbcn \IVbfn \forma >>
   \typeset

}

\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

#(set-global-staff-size 18)

\markup \huge {[1.] Vivace}

\score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
        } <<

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Violino 1." }
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Violino 2."}
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>

            \new Staff

            <<
                \set Staff.instrumentName =  \markup \center-column  {"Viola"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff  \with {
                fontSize = #+1.5
                \override StaffSymbol #'staff-space = #(magstep +1.5)
            }
            <<
                \set Staff.instrumentName =  \markup \center-column  {"Cembalo"}
                \set Staff.midiInstrument = #"cello"
                \Ibc
            >>
        >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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

\markup \huge {[2.] Andante}

\score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
        } <<

            \new Staff

            <<
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

            \new Staff  \with {
                fontSize = #+1.5
                \override StaffSymbol #'staff-space = #(magstep +1.5)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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

\markup \huge {[3.] Alla breve}

\score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
        } <<

            \new Staff

            <<
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

            \new Staff  \with {
                fontSize = #+1.5
                \override StaffSymbol #'staff-space = #(magstep +1.5)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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

\markup \huge {[4.] Allegro}

\score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
        } <<

            \new Staff

            <<
                \set Staff.midiInstrument = #"violin"
                \IVvlI
            >>

            \new Staff

            <<
                \set Staff.midiInstrument = #"violin"
                \IVvlII
            >>

            \new Staff

            <<
                \set Staff.midiInstrument = #"viola"
                \IVvla
            >>

            \new Staff  \with {
                fontSize = #+1.5
                \override StaffSymbol #'staff-space = #(magstep +1.5)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \IVbc
            >>
        >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner
            #'base-shortest-duration = #(ly:make-moment 1 4) %aumenta lo spazio orizzontale
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