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



IvlIn = \relative do'' {

   sol4 re sol, r
   sol'16 la si do re8 re, sol re si sol
   R1

   %4
   sol''16 re si re sol re si re mi8 sol, mi do
   R1
   sol''16[re sol re sol re sol re] mi[do mi do mi do mi do]

   %7
   fad[do fad do fad do fad do] re[si re si re si re si]
   mi[si mi si mi si mi si] do[la do la do la do la]
   re[la re la re la re la] <<si4\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,>> r

   %10
   sol'4 re sol, r
   r8 sol''[la sol16 fad] sol4 r
   r8 sol,[la sol16 fad] sol4 r

   %13
   r8 si do la si[re16 si re si re si]
   sol'8[re16 si re si re si]\mbreak si'8 sol la fad
   sol4 r r2

   %16
   r8 sol la fad sol4 r
   sol, re sol, r
   sol'16[la si do re8 re,] sol re si sol

   %19
   R1
   sol''16 re si re sol re si re mi8 sol, mi do
   R1

   %22
   sol'8 re si sol sol' re si sol
   sol''16[re sol re sol re sol re] mi[do mi do mi do mi sol]
   fad[do fad do fad do fad do] re[si re si re si re fad]

   %25
   mi[si mi si mi si mi si]\mbreak do[la do la do la do mi]
   re[la re la re la re la] <<{si8[sol' la sol16 fad]}\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,4>>
   sol''4 r r8 sol,[la sol16 fad]

   %28
   sol4 r r r8 sol'
   sol16[mi sol mi sol mi sol mi] sol8 fad mi mi
   re4 la \once\stemUp re,8 [la'' si la16 sol]

   %31
   la4 r r8 re,[mi re16 dod]
   re8 fad sol mi re4 la
   re, r r r8 re'

   %34
   si'16[sold si sold si sold si sold] mi4 r
   R1
   mi16[si mi si mi si mi si] mi[dod mi dod mi dod mi dod]

   %37
   re si re si sol' re sol re sol mi sol mi fad dod fad dod
   fad re fad re mi si mi si mi dod mi dod red la red la
   sol' mi sol mi do sol do sol do[la do la do la do la]

   %40
   si sold si sold re' si re si re[si re si re si re si]
   dod lad dod lad mi' dod mi dod mi[dod mi dod mi dod mi dod]
   red sid red sid fad ' dod fad dod fad[red fad red fad red fad red]

   %43
   mi[dod mi dod mi dod mi dod] re?[si re si re si re si]
   mi[dod mi dod mi dod mi dod] re[si re si re si re si]
   do![la do la do la do la] si sol si sol mi' si mi si

   %46
   mi[dod mi dod mi dod mi dod] re8 re dod dod
   si4 fad si, r
   fad''16[re fad re fad re fad re] sol4 r

   %49
   sol16[dod, sol' dod, sol' dod, sol' dod,]\mbreak re4 r
   fad16[do! fad do fad do fad do] si4 r
   sol re sol, r8 re''

   %52
   mi16[si mi si mi si mi si] dod4 r
   re16[la re la re la re la] si4 r
   do16[sol do sol do sol do sol] do4 r

   %55
   si16[sol si sol si sol si sol] mi'[do mi do mi do mi do]
   fad,4 r8 fad re'16[si re si re si re si]
   mi,4 r8 mi do'16[la do la do la do la]

   %58
   re,4 r8 do' si si la la
   si16[sol si sol si sol si sol] r2\mbreak
   r8 la' fad re r2

   %61
   r8 sol mi do r2
   r8 la' fad do si si la la
   si16[sol si sol si sol si sol] re'[si re si re si re si]

   %64
   sol'[re sol re sol re sol re] si'[sol si sol si sol si sol]
   si8 si la la si16 sol si sol si sol si sol
   si8 si la la sol2\fermata

}

IvlIIn = \relative do'' {

   sol4 re sol, r
   sol'16 la si do re8 re, sol re si sol
   R1

   %4
   re''16 si sol si re si sol si do8 sol mi do
   R1
   si'16[sol' si, sol' si, sol' si, sol'] sol[mi sol mi sol mi sol mi]
   
   %7
   la,[fad' la, fad' la, fad' la, fad'] fad[re fad re fad re fad re]
   sol,[mi' sol, mi' sol, mi' sol, mi'] mi[do mi do mi do mi do]
   fad,[re' fad, re' fad, re' fad, re']<<si4\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,>> r

   %10
   sol'4 re sol, r
   r8 si'[do si16 la] si4 r
   r8 si,[do si16 la] si4 r
   
   %13
   r8 sol' la fad sol[si16 sol si sol si sol]
   re'8[si16 sol si sol si sol]\mbreak sol'8 si, do la
   si4 r r2
   
   %16
   r8 si do la si4 r
   sol re sol, r
   sol'16[la si do re8 re,] sol re si sol

   %19
   R1
   re''16 si sol si re si sol si do8 sol mi do
   R1

   %22
   sol'8 re si sol sol' re si sol
   si'16[sol' si, sol' si, sol' si, sol'] sol[mi sol mi sol mi sol mi]
   la,[fad' la, fad' la, fad' la, fad'] fad[re fad re fad re fad re]
   
   %25
   sol,[mi' sol, mi' sol, mi' sol, mi'] \mbreak mi[do mi do mi do mi do]
   fad,[re' fad, re' fad, re' fad, re'] <<{si8[si do si16 la]}\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,4>>
   si'4 r r8 si,[do si16 la]
   
   %28
   si4 r r r8 re'
   mi16[si mi si mi si mi si] mi8 re re dod
   re4 la \once\stemUp re,8 [fad' sol fad16 mi]
   
   %31
   fad4 r r8 fad, [sol fad16 mi]
   fad8 re' mi dod re4 la
   re, r r r8 la''
   
   %34
   sold16[mi sold mi sold mi sold mi] do!4 r
   R1
   si16[sol si sol si sol si sol]\mbreak dod[lad dod lad dod lad dod lad]
   
   %37
   si fad si fad re' si re si mi dod mi dod dod la dod la
   re si re si si sol si sol dod la dod la la fad la fad
   mi' si mi si sol mi sol mi la[fad la fad la fad la fad]
   
   %40
   sold mi sold mi si' sold si sold si[sold si sold si sold si sold]
   lad fad lad fad dod' lad dod lad dod[lad dod lad dod lad dod lad]
   sid sold sid sold red' sid red sid red[sid red sid red sid red sid]
   
   %43
   dod[sold dod sold dod sold dod sold] si[sold si sold si sold si sold]
   dod[la dod la dod la dod la] la[fad la fad la fad la fad]
   la[fad la fad la fad la fad] re' si re si si sol si sol
   
   %46
   dod[lad dod lad dod lad dod lad] si8 si si lad
   si4 fad si, r
   re'16[si re si re si re si] re4 r
   
   %49
   mi16[la, mi' la, mi' la, mi' la,]\mbreak  fad'4 r
   do16[la do la do la do la] sol4 r
   sol re sol, r8 si'
   
   %52
   si16[sol si sol si sol si sol] la4 r
   la16[fad la fad la fad la fad] sol4 r
   sol16[mi sol mi sol mi sol mi] la4 r
   
   %55
   sol16[re sol re sol re sol re] do'[sol do sol do sol do sol]
   re4 r8 la' si16[fad si fad si fad si fad]
   do4 r8 sol' la16[mi la mi la mi la mi]
   
   %58
   fad4 r8 la sol sol sol fad
   sol16[re sol re sol re sol re] r2\mbreak
   r8 fad' re la r2
   
   %61
   r8 mi' do sol r2
   r8 fad' do la sol sol \parenthesize fad fad
   sol16[re sol re sol re sol re] si'[sol si sol si sol si sol]
       
   %64
   re'[si re si re si re si] sol'[re sol re sol re sol re]
   sol8 sol sol fad sol16 re sol re sol re sol re
   sol8 sol sol fad sol2\fermata
   
}

IvlaIn = \relative do' {
   
   sol'4 re sol, r
   sol'16 la si do re8 re, sol re si sol
   R1

   %4
   si'8 si, si si' sol sol mi do
   R1
   re16[si re si re si re si] do4 r
   
   %7
   do16[la do la do la do la] si4 r
   si16[sol si sol si sol si sol] la4 r
   la16[fad la fad la fad la fad ] sol4 r
   
   %10
   sol' re sol, r
   r8 re' mi re re4 r
   r8 re mi re re4 r
   
   %13
   r8 re mi re re re re re
   si re re re\mbreak re re mi re
   re4 r r2
   
   %16
   r8 re mi re re4 r
   sol re sol, r
   sol'16[la si do re8 re,] sol re si sol

   %19
   R1
   si'8 si, si si' sol sol mi do
   R1
   
   %22
   sol'8 re si sol sol' re si sol
   re'16[si re si re si re si] do4 r
   do16[la do la do la do la] si4 r
   
   %25
   si16[sol si sol si sol si sol] la4 r
   la16[fad' la, fad' la, fad' la, fad']  re8 re mi re
   re4 r r8 re mi re
   
   %28
   re4 r r r8 si'
   si si si si dod la la la
   re4 la re,8 re' si dod
   
   %31
   la4 r r8 la, si la
   la la' si la la4 la
   re, r r r8 fa
   
   %34
   mi mi mi mi la4 r
   R1
   sol8 sol sol sol\mbreak lad lad lad lad
   
   %37
   fad fad si si dod dod la la
   si si sol sol la la fad fad
   mi mi mi mi fad fad fad fad
   
   %40
   mi mi mi mi sold sold sold sold
   fad fad fad fad lad lad lad lad
   sold sold sold sold sid2
   
   %43
   sold mi
   mi fad
   re re4 sol?
   
   %46
   lad2 fad
   si4 fad si, r
   si'8 si si si si4 r
   
   %49
   dod8 dod dod dod\mbreak la4 r
   la8 la la fad re4 r
   sol re sol, r8 sol'
   
   %52
   sol sol sol sol mi4 r
   fad8 fad fad fad re4 r
   mi8 mi mi mi re4 r
   
   %55
   re8 re re si sol' sol sol mi
   la, la la fad' fad fad fad re
   sol, sol sol mi' mi mi mi do
   
   %58
   la la la fad' re re re re
   re re re re r2\mbreak 
   r8 re' la fad r2
   
   %61
   r8 do' sol mi r2
   r8 re' la fad re re re re
   re re re re sol sol sol sol
   
   %64
   si si si si re re re re
   re re re re re re re re
   re re re re si2\fermata
   
}

IsopranoIn = \relative do'' {

   \autoBeamOff
   R1*16
   re4 re8 re re16 do si8 r4
   si4 la8. la16 si8. la16 sol4

   %19
   R1
   re'8 re16 re re8 re mi4 r
   r2 r4 r8 re

   %22
   re re r sol sol sol, r4
   re'8 re16 re re8 re mi2
   do8 do16 do do8 do re2

   %25
   si8 si16 si si8 si do4. do8
   la la la la si4 r8 re
   si sol r4 r r8 re'

   %28
   si sol r4 r r8 re'
   mi mi mi mi mi fad mi4
   re r r2

   %31
   R1
   r2 fad4 mi8 mi
   fad16 mi re8 r4 r re~

   %34
   re8 mi16 fa mi8 re do4 r
   r2  r8 re re re
   mi2~\mbreak mi4 re8 [dod]

   %37
   re si sol'2 fad4~
   fad mi2 red4
   sol do,2 si8 [la]

   %40
   sold4 re'2 dod8[si]
   lad4 mi'2 re8[dod]
   sid4 fad'2 mi8[red]

   %43
   dod2 re!
   mi re
   do! si4 mi~

   %46
   mi re8[dod] re re dod4
   si r r2
   R1*3

   %51
   r2 re4 re8 re
   mi8. mi16 mi8 mi dod dod dod dod
   re4. re8 si si si si

   %54
   do4 r8 do do do do si16[la]
   si4 r8 re mi mi mi mi
   fad,4. fad8 re' re re re

   %57
   mi,4. mi8 do' do do do
   re,4. do'8 si si la la
   si4 r r2\mbreak

   %60
   r8 re la fad r2
   r8 do' sol mi r2
   r8 do' do do16 do si8 si la la

   %63
   si4 r8 sol si sol r si
   re si r re sol re r si
   si si la la si4 r8 si

   %66
   si si16 si la4 si2\fermata

}

ItestoI = \lyricmode {

   Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me, fe -- sti -- na

   festi - na ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na ad adiu - van -- dum me, fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me

   ad a -- diu -- van - - - - - - - - - - - - - - - - - - - - dum me fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne fe -- sti -- na fe -- sti -- na.

}

IaltoIn = \relative do' {

   \autoBeamOff
   R1*16
   sol'4 fad8 fad sol16 re re8 r4
   sol4 fad8. fad16 sol8. re16 re4
   
   %19
   R1
   sol8 sol16 sol sol8 sol sol4 r
   r2 r4 r8 sol
   
   %22
   sol sol r si si si r4
   si8 si16 si si8 si si2
   la8 la16 la la8 la la2
   
   %25
   sol8 sol16 sol sol8 sol\mbreak fad4. fad8
   fad fad fad fad sol4 r8 la
   sol re r4 r r8 la'
   
   %28
   sol re r4 r r8 sol
   sol sol si si la la la4
   la r r2
   
   %31
   R1
   r2 la4 la8 la
   la16 la la8 r4 r r8 fa
   
   %34
   mi mi mi mi mi4 r
   r2 r8 si' si si
   si2\mbreak lad4. lad8
   
   %37
   fad4 r8 re mi4 fad
   re mi dod la'
   si mi, fad2
   
   %40
   mi sold
   fad lad
   sold sid
   
   %43
   sold la~
   la1~
   la2 sol?4 mi
   
   %46
   fad4. fad8 fad fad fad4
   fad r r2
   R1*3
   
   %51
   r2 sol4 sol8 sol
   do8. do16 do8 do la la la la
   la4. la8 sol sol sol sol
   
   %54
   sol4. sol8 la la la la
   sol4 r8 sol sol sol sol sol
   fad4. fad8 fad fad fad fad
   
   %57
   mi4. mi8 mi mi mi mi
   fad4. fad8 sol sol sol fad
   sol4 r r2\mbreak
   
   %60
   r8 fad fad re r2
   r8 sol mi do r2
   r8 fad fad fad16 fad sol8 sol sol fad
   
   %63
   sol4 r8 re sol re r sol
   si sol r sol si sol r sol
   sol sol sol fad sol4 r8 sol
   
   %66
   sol sol16 sol sol8(fad) sol2\fermata
   
}

ItestoII = \lyricmode {
   
   Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me, fe -- sti -- na

   festi - na ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na ad adiu - van -- dum me, fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad a -- diu -- van -- dum me ad adiu - van - dum me

   ad a -- diu -- van - - - - - - - - - - - - - - - - - dum me fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne fe -- sti -- na fe -- sti -- na.

}

ItenoreIn = \relative do' {

   \autoBeamOff

   R1*16
   si4 la8 la si16 la sol8 r4
   re' re8. re16 re8. do16 si4

   %19
   R1
   si8 si16 si si8 si do4 r
   r2 r4 r8 si

   %22
   si si r re re re r4
   sol8 sol16 sol sol8 sol sol2
   fad8 fad16 fad fad8 fad fad2

   %25
   mi8 mi16 mi mi8 mi\mbreak mi4. mi8
   re re re re re4 r8 re
   re si r4 r r8 re

   %28
   re si r4 r r8 si
   si si si si dod re re[dod]
   re4 r r2

   %31
   R1
   r2 re4 dod8 dod
   re16 re re8 r4 r r8 la

   %34
   si si si si la4 r
   r2 r8 si si si
   si4. mi8\mbreak dod4. dod8

   %37
   si4 r8 re dod2
   si la
   sol la

   %40
   si1
   dod
   red

   %43
   mi
   dod2 re?~
   re~re4 mi

   %46
   lad,4. lad8 si si si[lad]
   si4 r r2
   R1*3

   %51
   r2 si4 si8 si
   do8. do16 do8 do mi mi mi mi
   fad4. re8 re re re re

   %54
   mi4. mi8 re re re re
   re4 r8 si do do do do
   la4. la8 si si si si

   %57
   sol4. sol8 la la la la
   la4. re8 re re re re
   re4 r r2\mbreak

   %60
   r8 la re la r2
   r8 mi' do sol r2
   r8 la la la16 re re8 re re re

   %63
   re4 r8 si re si r re
   sol re r si re si r re\mbreak
   re re re re re4 r8 re

   %66
   re re16 re re4 re2\fermata

}

ItestoIII = \lyricmode {

   Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me, fe -- sti -- na

   festi - na ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na ad adiu - van -- dum me, fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad a -- diu -- van -- dum me ad adiu - van - - dum me

   ad a -- diu -- van - - - - - - - - - - dum me fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne fe -- sti -- na fe -- sti -- na.

}

IbassoIn = \relative do {

   \autoBeamOff
   R1*16
   sol'4 re8 re sol16 sol, sol8 r4
   sol'16[la si do] re8 re, sol8. sol,16 sol4

   %19
   R1
   sol'8 sol16 sol sol8 sol do,4 r
   r2 r4 r8 sol'

   %22
   sol sol, r sol' sol sol, r4
   sol'8 sol16 sol sol8 sol do2
   fad,8 fad16 fad fad8 fad si2

   %25
   mi,8 mi16 mi mi8 mi\mbreak la4. la8
   re, re re re sol4 r8 re
   sol sol, r4 r  r8 re'

   %28
   sol sol, r4 r r8 sol'
   sol sol sol sol la re, la'[la,]
   re4 r r2

   %31
   R1
   r2 re'4 la8 la
   re,16 re re8 r4 r r8 re

   %34
   sold sold sold sold la4 r
   r2 r8 sol sol sol
   sol2\mbreak fad4. fad8

   %37
   si,4 r8 si' la2
   sol fad
   mi red

   %40
   re! mi~
   mi fad~
   fad sold~

   %43
   sold~sold
   sol! fad~
   fad sol

   %46
   fad4. fad8 si si, fad'4
   si,4 r r2
   R1*3

   %51
   r2 sol'4 sol8 sol
   sol8. sol16 sol8 sol sol sol sol sol
   fad4. fad8 fa fa fa fa

   %54
   mi4. mi8 fad! fad fad fad
   sol4 r8 sol do, do do do
   re4. re8 si si si si

   %57
   do4. do8 la la la la
   re4. re8 sol sol re re
   sol,4 r r2\mbreak

   %60
   r8 re' re' re, r2
   r8 do do' do, r2
   r8 re re re16 re sol8 sol re re

   %63
   sol,4 r8 sol' sol sol, r sol'
   sol sol, r sol' sol sol, r sol'
   sol sol re re sol4 r8 sol

   %66
   sol sol16 sol re4 sol2\fermata

}

ItestoIV = \lyricmode {

   Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me, fe -- sti -- na

   festi - na ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na ad adiu - van -- dum me, fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad a -- diu -- van -- dum me ad adiu - van - dum me

   ad a -- diu -- van - - - - - - - - - - dum me fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne fe -- sti -- na fe -- sti -- na.

}

IbcIn = \relative do {

   sol'4 re sol, r
   sol'16 la si do re8 re, sol re si sol
   R1

   %4
   sol'8 sol, sol sol' do sol mi do
   R1
   sol'8 sol sol sol do,4 r

   %7
   fad8 fad fad fad si,4 r
   mi8 mi mi mi la,4 r
   re8 re re re sol,4 r

   %10
   sol'4 re sol, r
   r8 sol' do, re sol,4 r
   r8 sol' do, re sol,4 r

   %13
   r8 sol' do, re sol, sol' sol sol
   sol, sol' sol sol\mbreak sol, sol' do, re
   sol,4 r r2

   %16
   r8 sol'\f do, re sol,4 r
   sol' re sol, r %%% OOKK
   sol'16[la si do re8 re,] sol re si sol

   %19
   R1
   sol'8 sol, sol sol' do, sol' mi do
   R1

   %22
   sol'8 re si sol sol' re si sol
   sol' sol sol sol do4 do,
   fad8 fad fad fad si4 si,

   %25
   mi8 mi mi mi\mbreak la4 la,
   re8 re re re sol, sol' do, re
   sol,4 r r8 sol' do, re

   %28
   sol,4 r r r8 sol'
   sol sol, sol sol' la re, la' la,
   re'4 la re,8 re' sol, la

   %31
   re,4 r r8 re sol, la
   re, re' sol, la re'4 la
   re, r r r8 re

   %34
   sold sold sold sold la la, r4
   r2 r8 sol' sol sol
   sol sol sol sol\mbreak fad fad fad fad

   %37
   si, si si si' la la la la
   sol sol sol sol fad fad fad fad
   mi mi mi mi red red red red

   %40
   re! re re re mi mi mi mi
   mi mi mi mi fad fad fad fad
   fad fad fad fad sold sold sold sold

   %43
   sold? sold sold sold sold sold sold sold
   sol! sol sol sol fad fad fad fad
   fad fad fad fad sol sol sol sol

   %46
   fad fad fad fad si si, fad' [fad,]
   si'4 fad si, r
   si'8 si si si si4 r

   %49
   la8 la la la\mbreak re,4 r
   re8 re re re sol4 r
   sol re sol,8 sol' sol sol

   %52
   sol sol sol sol sol sol sol sol
   fad fad fad fad fa fa fa fa
   mi mi mi mi fad! fad fad fad

   %55
   sol sol sol sol do, do do do
   re re re re si si si si
   do do do do la la la la

   %58
   re re re re sol sol, re'[re,]
   sol sol sol sol r2\mbreak
   r8 re' re re r2

   %61
   r8 do do do r2
   r8 re re re sol sol re re
   sol, sol sol sol sol sol sol sol

   %64
   sol sol sol sol sol sol sol sol
   sol' sol, re'[re,] sol sol sol sol
   sol' sol, re'[re,] sol2\fermata

}

IbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s1*5
   s2 <7>
   <7> <7>
   <7> <7>
   <7> s
   s1*13
   s2 <7>
   <7> s
   s1*4
   s2 <7 _+>
   s1*3
   s2 s4 s8 <_->
   <6 5>1
   s 
   <6>2 <7 _+> 
   s4 <6> <7 5 _+> <6>
   <7 5> <6> <7 5+> <6+ 3>
   <5> <6> <7> s
   <6 4+ 2>2 <7 _+>
   <6+ 4+ 2> <7 _+>
   <6+ 4+ 2+> <7 _+>
   <6 4+> <6 5!>
   <6 4+> <6>
   <6 5->4 s <5 > <6>
   <7 _+> s s <5 4>8 <3+>s1
   s2 <6>
   <7 _+> s
   <7->1
   s
   <6 4>2 <6 4+>
   s <6 4>
   s <6 5>
   s1*3
   <7>4 s s <5 4>8 <3>
   s1*3
   s8 <7> s4 s2
   s1*2
   s4 <5 4>8 <3> s2
   s4 <5 4>8 <3>
   
}


IvlIIIn = \relative do'' {

   r2 sol4 re
   sol, r r2
   sol'16 [la si do re8 re,] sol re si sol

   %4
   R1
   re''16 la fad la re la fad la si8 re, si sol
   r2 do'16[sol do sol do sol do sol]

   %4
   la[fad la fad la fad la fad] si[fad si fad si fad si fad]
   sol [mi sol mi sol mi sol mi] la[mi la mi la mi la mi]
   fad[re fad re fad re fad re] <<si'4\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,>> r

   %10
   r2 sol'4 re
   sol, r r8 si'[do si16 la]
   si4 r r8 si,[do re16 do]

   %13
   si8 si' do la si4 r
   R1
   r8 re16\p[si re si re si] sol'8[re16 si re si re si]

   %16
   si'8 sol\f la fad sol4 r
   r2 sol,4 re
   sol, r r2

   %19
   sol'16 la si do re8 re, sol re si sol
   R1
   re''16 la fad la re la fad la si8 re, si sol

   %22
   sol' re si sol sol' re si sol
   r2 do'16[sol do sol do sol do sol]
   la[fad la fad la fad la re] si[fad si fad si fad si fad]

   %25
   sol mi sol mi sol mi sol do\mbreak la[mi la mi la mi la mi]
   fad[re fad re fad re fad la] <<si4\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,>> r
   r8 si'[do si16 la] si4 r

   %28
   r8 si,[do re16 do] si4 r8 sol''
   sol16[mi sol mi sol mi sol mi] sol8 fad mi mi
   re4 la re, r

   %31
   r8 fad'[sol fad16 mi] fad4 r
   r8 fad sol mi fad4 r
   re la re, r

   %34
   r2 r4 r8 do'
   la'16[fad la fad la fad la fad] re4 r
   mi16[si mi si mi si mi si]\mbreak mi[dod mi dod mi dod mi dod]

   %37
   re si re si sol' re sol re sol mi sol mi fad dod fad dod
   fad re fad re mi si mi si mi dod mi dod red la red la
   sol' mi sol mi do sol do sol do[la do la do la do la]

   %40
   si sold si sold re' si re si re[si re si re si re si]
   dod lad dod lad mi' dod mi dod mi[dod mi dod mi dod mi dod]
   red sid red sid fad ' dod fad dod fad[red fad red fad red fad red]

   %43
   mi[dod mi dod mi dod mi dod] re?[si re si re si re si]
   mi[dod mi dod mi dod mi dod] re[si re si re si re si]
   do![la do la do la do la] si sol si sol mi' si mi si

   %46
   mi[dod mi dod mi dod mi dod] re8 re dod dod
   si4 r si fad
   si, r sol''16[re sol re sol re sol re]
   
   %49
   sol4 r \mbreak fad16[re fad re fad re fad re]
   do4 r sol re
   sol, r r2

   %52
   mi'''1
   re
   do

   %55
   si4 r r2
   r8 la fad re r2
   r8 sol mi do r2

   %58
   r8 la' fad do si si la la
   si16[sol si sol si sol si sol] mi'[do mi do mi do mi do]\mbreak
   fad,4 r8 fad re'16[si re si re si re si]

   %61
   mi,4 r8 mi do'16[la do la do la do la]
   re,4 r8 do' si si la la
   si16[sol si sol si sol si sol] re'[si re si re si re si]

   %64
   sol'[re sol re sol re sol re] si'[sol si sol si sol si sol]
   si8 si la la si16 sol si sol si sol si sol
   si8 si la la sol2\fermata

}

IvlIVn = \relative do'' {
   
   r2 sol4 re
   sol, r r2
   sol'16 [la si do re8 re,] sol re si sol

   %4
   R1
   la'16 fad re fad la fad re fad sol8 re si sol
   r2 mi'16[do' mi, do' mi, do' mi, do']
   
   %7
   do[la do la do la do la] re,[si' re, si' re, si' re, si']
   si[sol si sol si sol si sol] do,[la' do, la' do, la' do, la']
   la[fad la fad la fad la fad] <<si4\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,>> r

   %10
   r2 sol'4 re
   sol, r r8 sol'[la sol16 fad]
   sol4 r r8 sol,[la si16 la]
   
   %13
   sol8 sol' la fad sol4 r
   R1
   r8 si16\p[sol si sol si sol] re'8[si16 sol si sol si sol]
   
   %16
   sol'8 si,\f do la si4 r
   r2 sol4 re
   sol, r r2

   %19
   sol'16 la si do re8 re, sol re si sol
   R1
   la'16 fad re fad la fad re fad sol8 re si sol
   
   %22
   sol' re si sol sol' re si sol
   r2 mi'16[do' mi, do' mi, do' mi, do']
   do[la do la do la do la] re,[si' re, si' re, si' re, si']
   
   %25
   si[sol si sol si sol si sol] do,[la' do, la' do, la' do, la']
   la[fad la fad la fad la fad] <<si4\\\stemUp \once \override Stem #'transparent = ##t re,\\\stemDown sol,>> r
   r8 sol'[la sol16 fad] sol4 r
   
   %28
   r8 sol,[la si16 la] sol4 r8 re''
   mi16[si mi si mi si mi si] mi8 re re dod
   re4 la re, r

   %31
   r8 re'[mi re16 dod] re4 r 
   r8 re mi dod re4 r
   re la re, r
   
   %34
   r2 r4 r8 la''
   fad16[re fad re fad re fad re] si4 r
   si16[sol si sol si sol si sol]\mbreak dod[lad dod lad dod lad dod lad]
   
   %37
   si fad si fad re' si re si mi dod mi dod dod la dod la
   re si re si si sol si sol dod la dod la la fad la fad
   mi' si mi si sol mi sol mi la[fad la fad la fad la fad]
   
   %40
   sold mi sold mi si' sold si sold si[sold si sold si sold si sold]
   lad fad lad fad dod' lad dod lad dod[lad dod lad dod lad dod lad]
   sid sold sid sold red' sid red sid red[sid red sid red sid red sid]
   
   %43
   dod[sold dod sold dod sold dod sold] si[sold si sold si sold si sold]
   dod[la dod la dod la dod la] la[fad la fad la fad la fad]
   la[fad la fad la fad la fad] re' si re si si sol si sol
   
   %46
   dod[lad dod lad dod lad dod lad] si8 si si lad
   si4 r si fad
   si, r re'16[si re si re si re si]\mbreak

   %49
   mi4 r\mbreak re16[la re la re la re la]
   la4 r sol re
   sol, r r2
   
   %52
   r la''~
   la sol~
   sol fad
   
   %55
   sol4 r r2
   r8 fad re la r2
   r8 mi' do sol r2
   
   %58
   r8 fad' re la sol sol sol fad
   sol16[re sol re sol re sol re] do'[sol do sol do sol do sol]\mbreak
   re4 r8 la' si16[fad si fad si fad si fad]
   
   %61
   do4 r8 sol' la16[mi la mi la mi la mi]
   fad4 r8 la sol sol fad fad
   sol16[re sol re sol re sol re] si'[sol si sol si sol si sol]
       
   %64
   re'[si re si re si re si] sol'[re sol re sol re sol re]
   sol8 sol sol fad sol16 re sol re sol re sol re
   sol8 sol sol fad sol2\fermata

}

IvlaIIn = \relative do' {
   
   r2 sol'4 re
   sol, r r2
   sol'16 [la si do re8 re,] sol re si sol

   %4
   R1
   fad'8 fad, fad fad' re re si sol
   r2 sol'16[mi sol mi sol mi sol mi]
   
   %7
   fad4 r fad16[re fad re fad re fad re]
   mi4 r mi16[do mi do mi do mi do]
   re4 r re r
   
   %10
   r2 sol4 re
   sol, r r8 re' mi re
   re4 r r8 re, mi re
   
   %13
   re re' mi re re4 r
   R1
   r8 re\p re re si re re re
   
   %16
   re re\f mi re re4 r
   r2 sol4 re
   sol, r r2

   %19
   sol'16 la si do re8 re, sol re si sol
   R1
   fad'8 fad, fad fad' re re si sol
   
   %22
   sol' re si sol sol' re si sol
   r2 sol'16[mi sol mi sol mi sol mi]
   fad4 r fad16[re fad re fad re fad re]
   
   %25
   mi4 r\mbreak mi16[do mi do mi do mi do]
   re4 r re r
   r8 re mi re re4 r
   
   %28
   r8 re, mi re re4 r8 si''
   si si si si dod la la la
   re4 la re, r
   
   %31
   r8 la' si la la4 r
   r8 la si la la4 r
   re la re, r
   
   %34
   r2 r4 r8 re
   re re re re sol4 r 
   sol8 sol sol sol\mbreak lad lad lad lad
   
   %37
   fad fad si si dod dod la la
   si si sol sol la la fad fad
   mi mi mi mi fad fad fad fad
   
   %40
   mi mi mi mi sold sold sold sold
   fad fad fad fad lad lad lad lad
   sold sold sold sold sid2
   
   %43
   sold mi
   mi fad
   re re4 sol?
   
   %46
   lad2 fad
   fad4 r si fad
   si, r si'8 si si si
   
   %49
   dod4 r\mbreak la8 la la la
   fad4 r sol re
   sol, r r2
   
   %52
   r dod'
   fad, si
   mi, la
   
   %55
   sol4 r r2
   r8 re' la fad r2
   r8 do' sol mi r2
   
   %58
   r8 re' la fad re re re re
   re re re si sol' sol sol mi\mbreak
   la, la la fad' fad fad fad re
   
   %61
   sol, sol sol mi' mi mi mi do
   la la la fad' re re re re
   re re re re sol sol sol sol
   
   %64
   si si si si re re re re
   re re re re re re re re
   re re re re si2\fermata
   
}

IsopranoIIn = \relative do'' {

   \autoBeamOff
   R1*16
   r2 re4 re8 re
   re16 do si8 r4 r2

   %19
   si4 la8 la si8. la16 sol4
   R1
   re'8 re16 re re8 re re4 r

   %22
   r8 re re re r sol sol sol,
   r2 do8 do16 do do8 do
   do2 si8 si16 si si8 si

   %25
   si2\mbreak la8 la16 la do8 do
   do do la4 sol r
   r r8 re' si sol r4

   %28
   r r8 re' si sol r8 re'
   mi mi mi mi mi fad mi4
   re r r2

   %31
   R1*2
   fad4 mi8 mi fad16 mi re8 r4
   r2 r4 do~

   %35
   do8 re16 mi re8 do si re re re
   mi2~\mbreak mi4 re8 [dod]

   %37
   re si sol'2 fad4~
   fad mi2 red4
   sol do,2 si8 [la]

   %40
   sold4 re'2 dod8[si]
   lad4 mi'2 re8[dod]
   sid4 fad'2 mi8[red]

   %43
   dod2 re!
   mi re
   do! si4 mi~

   %46
   mi re8[dod] re re dod4
   si r r2
   R1*3

   %51
   r2 re4 re8 re
   mi8. mi16 mi8 mi dod dod dod dod
   re4. re8 si si si si

   %54
   do4 r8 do do do do si16[la]
   si4 r r2
   r8 re la fad r2

   %57
   r8 do' sol mi r2
   r8 do' do do16 do si8 si la la
   si4 r8 re mi mi mi mi\mbreak

   %60
   fad,4. fad8 re' re re re
   mi,4. mi8 do' do do do
   re,4. do'8 si si la la

   %63
   si4 r r8 sol si sol
   r si re si r re sol re
   si si16 si la8 la si4 r8 si

   %66
   si si16 si la4 si2\fermata

}

ItestoV= \lyricmode {

   Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me, fe -- sti -- na

   festi - na ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na fe -- sti -- na fe -- sti -- na ad adiu - van -- dum me, fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me

   ad a -- diu -- van - - - - - - - - - - - - - - - - - - - - dum me fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na Do -- mi -- ne

   ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne fe -- sti -- na fe -- sti -- na.

}

IaltoIIn = \relative do' {

   \autoBeamOff
   R1*16
   r2 sol'4 fad8 fad 
   sol16 re re8 r4 r2
   sol4 fad8 fad sol8. re16 re4
   R1
   fad8 fad16 fad fad8 fad sol4 r
   r8 sol sol sol r si si si
   r2 sol8 sol16 sol sol8 sol
   la2 fad8 fad16 fad fad8 fad
   sol2\mbreak mi8 mi16 mi mi8 mi
   fad fad fad4 re r
   r r8 la' sol re r4
   r4 r8 la' sol re r sol
   sol sol si si la la la4
   la r r2
   R1*2
   la4 la8 la la16 la la8 r4
   r2 r4 r8 mi
   re re re re re si' si si
   si2\mbreak lad4. lad8
   
   %37
   fad4 r8 re mi4 fad
   re mi dod la'
   si mi, fad2
   
   %40
   mi sold
   fad lad
   sold sid
   
   %43
   sold la~
   la1~
   la2 sol?4 mi
   
   %46
   fad4. fad8 fad fad fad4
   fad r r2
   R1*3
   r2 sol4 sol8 sol
   do8. do16 do8 do la la la la
   la4. la8 sol sol sol sol
   
   %54
   sol4. sol8 la la la la
   sol4 r r2
   r8 fad fad re r2
   r8 mi mi do r2
   r8 fad fad fad16 fad sol8 sol sol fad
   sol4 r8 sol sol sol sol sol\mbreak
   fad4. fad8 fad fad fad fad
   mi4. mi8 mi mi mi mi
   fad4. fad8 sol sol sol fad
   sol4 r r8 re sol re
   r sol si sol r sol si sol
   sol sol16 sol sol8 fad sol4 r8 sol
   sol sol16 sol sol8(fad) sol2\fermata
   
}

ItestoVI = \lyricmode {
   
   Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me, fe -- sti -- na

   festi - na ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na fe -- sti -- na fe -- sti -- na ad adiu - van -- dum me, fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van - dum me

   ad a -- diu -- van - - - - - - - - - - - - - - - - - dum me fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na Do -- mi -- ne

   ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne fe -- sti -- na fe -- sti -- na.

}

ItenoreIIn = \relative do' {

   \autoBeamOff
   R1*16
   r2 si4 la8 la
   si16 la sol8 r4 r2

   %19
   re'4 re8 re re8. do16 si4
   R1
   la8 la16 la la8 la si4 r

   %22
   r8 si si si r re re re
   r2 mi8 mi16 mi mi8 mi
   mi2 re8 re16 re re8 re

   %25
   re2\mbreak do8 do16 do la8 la
   la la do4 si r
   r r8 re re si r4

   %28
   r r8 re re si r8 si
   si si si si dod re re[dod]
   re4 r r2

   %31
   R1*2
   re4 dod8 dod re16 la la8 r4
   r2 r4 r8 la

   %35
   la la la la sol si si si
   si4. mi8\mbreak dod4. dod8

   %37
   si4 r8 re dod2
   si la
   sol la

   %40
   si1
   dod
   red

   %43
   mi
   dod2 re?~
   re~re4 mi

   %46
   lad,4. lad8 si si si[lad]
   si4 r r2
   R1*3

   %51
   r2 si4 si8 si
   do8. do16 do8 do mi mi mi mi
   fad4. re8 re re re re

   %54
   mi4. mi8 re re re re
   re4 r r2
   r8 la re la r2

   %57
   r8 sol do sol r2
   r8 la la la16 re re8 re re re
   re4 r8 si do do do do\mbreak

   %60
   la4. la8 si si si si
   sol4. sol8 la  la la la
   la4. re8 re re re re

   %63
   re4 r r8 si re si
   r re sol re r si re si\mbreak
   re re16 re re8 re re4 r8 re

   %66
   re re16 re re4 re2\fermata

}

ItestoVII = \lyricmode {

   Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me, fe -- sti -- na

   festi - na ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na fe -- sti -- na fe -- sti -- na ad adiu - van -- dum me, fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van - - dum me

   ad a -- diu -- van - - - - - - - - - - dum me fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na Do -- mi -- ne

   ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne fe -- sti -- na fe -- sti -- na.

}

IbassoIIn = \relative do {

   \autoBeamOff
   R1*16
   r2 sol'4 re8 re
   sol16 sol, sol8 r4 r2

   %19
   sol'16[la si do] re8 re, sol8. sol,16 sol4
   R1
   re'8 re16 re re8 re sol4 r

   %22
   r8 sol sol sol, r sol' sol sol,
   r2 do'8 do16 do do8 do
   fad,2 si8 si16 si si8 si

   %25
   mi,2\mbreak la8 la16 la la8 la
   re, re re4 sol r
   r  r8 re sol sol, r4

   %28
   r r8 re' sol sol, r8 sol'
   sol sol sol sol la re, la'[la,]
   re4 r r2

   %31
   R1*2
   re'4 la8 la re,16 re re8 r4
   r2 r4 r8 la'

   %35
   fad fad fad fad sol sol sol sol
   sol2\mbreak fad4. fad8
   si,4 r8 si' la2

   %38
   sol fad
   mi red
   re! mi~

   %41
   mi fad~
   fad sold~
   sold~sold

   %44
   sol! fad~
   fad sol
   fad4. fad8 si si, fad'4

   %47
   si, r r2
   R1*3
   r2 sol'4 sol8 sol

   %52
   sol8. sol16 sol8 sol sol sol sol sol
   fad4. fad8 fa fa fa fa
   mi4. mi8 fad! fad fad fad

   %55
   sol4 r r2
   r8 re re' re, r2
   r8 do do' do, r2

   %58
   r8 re re re16 re sol8 sol re re
   sol,4 r8 sol' do, do do do\mbreak
   re4. re8 si si si si

   %61
   do4. do8 la la la la
   re4. re8 sol sol re re
   sol,4 r r8 sol sol' sol,

   %64
   r sol' sol sol, r sol' sol sol,
   sol' sol16 sol re8 re sol,4 r8 sol'
   sol sol16 sol re4 sol,2\fermata

}

ItestoVIII = \lyricmode {

   Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me, fe -- sti -- na

   festi - na ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na fe -- sti -- na fe -- sti -- na ad adiu - van -- dum me, fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van - dum me

   ad a -- diu -- van - - - - - - - - - - dum me fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na fe -- sti -- na Do -- mi -- ne

   ad adiu - van -- dum me ad adiu - van -- dum me ad adiu - van -- dum me

   fe -- sti -- na Do -- mi -- ne fe -- sti -- na fe -- sti -- na fe -- sti -- na

   Do -- mi -- ne Do -- mi -- ne fe -- sti -- na fe -- sti -- na.

}

IbcIIn = \relative do {

   r2 sol'4 re
   sol, r r2
   sol'16 [la si do re8 re,] sol re si sol

   %4
   R1
   re'8 re, re re' sol re si sol
   r2 do8 do do do

   %7
   fad4 r si,8 si si si
   mi4 r la,8 la la la
   re4 r sol,4 r

   %10
   r2 sol'4 re
   sol, r r8 sol' do, re
   sol,4 r r8 sol' do, re

   %13
   sol, sol' do, re sol,4 r
   R1
   r8 sol'\p sol sol sol, sol' sol sol

   %16
   sol, sol'\f do, re sol,4 r
   r2 sol'4 re
   sol, r r2

   %19
   sol'16 la si do re8 re, sol re si sol
   R1
   re'8 re, re re' sol re si sol

   %22
   sol' re si sol sol' re si sol
   r2 do'8 do do do
   fad,4 fad, si'8 si si si

   %25
   mi,4 mi,\mbreak la'8 la la la
   re, re re re sol,4 r
   r8 sol' do, re sol,4 r

   %28
   r8 sol' do, re sol,4 r8 sol'
   sol sol, sol sol'  la re, la' la,
   re'4 la re, r

   %31
   r8 re sol, la re,4 r
   r8 re' sol, la re,4 r
   re''4 la re, r

   %34
   r2 r4 r8 la'
   fad8 fad fad fad sol sol, sol' sol
   sol sol sol sol\mbreak fad fad fad fad

   %37
   si, si si si' la la la la
   sol sol sol sol fad fad fad fad
   mi mi mi mi red red red red

   %40
   re! re re re mi mi mi mi
   mi mi mi mi fad fad fad fad
   fad fad fad fad sold sold sold sold

   %43
   sold? sold sold sold sold sold sold sold
   sol! sol sol sol fad fad fad fad
   fad fad fad fad sol sol sol sol

   %46
   fad fad fad fad si si, fad' [fad,]
   si4 r si' fad
   si, r si'8 si si si

   %49
   la4 r\mbreak re,8 re re re
   re4 r sol re
   sol, r sol8 sol' sol sol

   %52
   sol sol sol sol sol sol sol sol
   fad fad fad fad fa fa fa fa
   mi mi mi mi fad! fad fad fad

   %55
   sol4 r r2
   r8 re re re r2
   r8 do do do r2

   %58
   r8 re re re sol sol, re'[re,]
   sol sol sol si do do do do\mbreak
   re re re re si si si si

   %61
   do do do do la la la la
   re re re re sol sol, re'[re,]
   sol sol sol sol sol sol sol sol

   %64
   sol sol sol sol sol sol sol sol
   sol' sol, re'[re,] sol sol sol sol
   sol' sol, re'[re,] sol2\fermata

}

IbfIIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s1*5
   s2 <7>
   <7> <7>
   <7> <7>
   <7> s
   s1*13
   s2 <7>
   <7> <7>
   s1*4
   s2 <7 _+>
   s1*5
   <6 5>1
   <6>2 <7 _+> 
   s4 <6> <7 5 _+> <6>
   <7 5> <6> <7 5+> <6+ 3>
   <5> <6> <7> s
   <6 4+ 2>2 <7 3+>
   <6+ 4+ 2> <7 _+>
   <6+ 4+ 2+> <7 _+>
   <6 4+> <6 5!>
   <6 4+> <6>
   <6 5->4 s <5 > <6>
   <7 _+> s s <5 4>8 <3+>s1
   s2 <6>
   <7 _+> s
   <7->1
   s
   <6 4>2 <6 4+>
   <6> <6 4>
   s <6 5>
   s1*3
   <7>4 s s <5 4>8 <3>
   s1*3
   <7>4 s s2
   s1*2
   s4 <5 4>8 <3> s2
   s4 <5 4>8 <3>




}


forma = {

   \time 4/4
   \key sol\major
   \tempo 2 = 65
   s1*66
   \bar "|."

}

IvlI = {
   \notypeset
   <<\IvlIn \forma>>

}

IvlII = {
   <<\IvlIIn \forma>>

}

IvlaI = {
   \clef alto
   <<\IvlaIn \forma>>

}

IsopranoI = {
   \new Voice = "domine1"
   <<\IsopranoIn \forma>>
}

IaltoI = {
   \new Voice = "domine2"
   <<\IaltoIn \forma>>
}

ItenoreI = {
   \new Voice = "domine3"
   <<\ItenoreIn \forma>>
}

IbassoI = {
   \clef bass
   \new Voice = "domine4"
   <<\IbassoIn \forma>>
}



IbcI = {
   \clef bass
   <<\IbcIn \forma \IbfIn>>
}

IvlIII = {
   <<\IvlIIIn \forma>>

}

IvlIV = {
   <<\IvlIVn \forma>>

}

IvlaII = {
   \clef alto
   <<\IvlaIIn \forma>>

}

IsopranoII= {
   \new Voice = "domine5"
   <<\IsopranoIIn \forma>>
}

IaltoII= {
   \new Voice = "domine6"
   <<\IaltoIIn \forma>>
}

ItenoreII = {
   \new Voice = "domine7"
   <<\ItenoreIIn \forma>>
}

IbassoII = {
   \clef bass
   \new Voice = "domine8"
   <<\IbassoIIn \forma>>
}



IbcII = {
   \clef bass
   <<\IbcIIn \forma \IbfIIn>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IIvlIn = \relative do'' {

   r8 si'16_\markup {\dynamic pp Sempre} sol mi8\upl si16(sol) mi8_\upl si'16(sol)
   \once\stemUp mi8_\upl si''16(sol) mi8\upl si16(sol) mi8 do'\upl
   do\upl si\upl r4 r

   %4
   R2.
   r8 sol'16(mi) red8\upl si'16(fad) si,8\upl la'\upl
   la\upl sol\upl r4 r

   %7
   r8 si16(sol) mi8\upl sol16(mi) si8\upl si'\upl\mbreak
   do,2.~
   do8 la'16(fad) re8\upl fad16(re) la8\upl la'\upl

   %10
   si,2.~
   si8 sol'16(mi) do8 mi16(do) sol8 sol'
   la,2.~

   %13
   la8 fad'16(red) si8 red16(si) fad8 fad'
   <<{sol8^\markup\italic"Pmi" fad sol fad sol fad}\\{sol_\markup\italic"2di" red mi red mi red}>>  %%ripresa
   R2.

   %16
   r8 <<{si do si do si}\\{sol la sol la sol}>>\mbreak
   R2.
   r8 fa' fa fa fa sold

   %19
   la2.
   sol8 sol16(si) fad8 fad16(si) red,8 red16( fad)
   mi4 r r

   %22
   r8 mi\f la fad si si,
   mi4 r r  %%%Fine ripresa
   R2.*3
   
   %27
   r8 si'16(sol) mi8 si16(sol) mi8 si'16(sol)
   mi4 r r
   r8 si''16(sol) mi8 sol16(mi) si8 si'
   
   %30
   do,2.~
   do8 la'16(fad) re8 fad16 (re) la8 la'
   si,2.~
   
   %33
   si8 sol'16(mi) do8 mi16 (do) sol8 sol'\mbreak
   la,2.~
   la8 fad'16(red) si8 red16(si) fad8 fad'
   
   %36
   sol4 r r
   r8 si16(sol) mi8 si16(sol) mi8 sol'16(mi)
   lad,4 dod mi
   
   %39
   fad4. mi16(fad) \appoggiatura la8 sol fad16(mi)
   fad4. mi16(fad) \appoggiatura la8 sol fad16(mi)
   fad8 si, si4 lad
   
   %42
   si8 fad'16(re) si8 fad'16(re) si8 si'16(fad)
   sol2.~
   sol8 mi16(dod) lad8 dod16(lad) \once\stemUp fad8 sol'16(mi)
   
   %45
   re8 si\f mi dod fad fad,
   si4 r r
   r8 fad'16\p(si,) lad8 dod16(lad) fad8 lad'16(fad)
   
   %48
   mi2.
   r8 si'16(fad) re8 fad16(re) si8 re16(si)\mbreak
   sold'2.
   
   %51
   r8 la16(mi) do8 mi16(do) la8 do16(la)
   la'2.
   r8 si16(sold) re8 sold16(re) si8 re16(sold,)
   
   %54
   mi4 r r
   r8 fad'16(red) si8 red16(si) fad8 fad'16(red)
   mi4 r r
   
   %57
   r8 si'16(sol) mi8 si16(sol) mi8 si'16(sol)
   mi4 r8 mi'16(do) la4
   r r8 la'16(fad) red4
   
   %60
   r r8 sol16(mi) si4
   r r8 la'16(fad) red4
   r8 si'16(sol) mi8 si16(sol) mi8 si'16(sol)
   
   %63
   mi4 r r
   sol fad2\fermata
   <<{mi8^\markup\italic"Pmi" fad' sol fad sol fad}\\{mi,_\markup\italic"2di" red' mi red mi red}>>  %%ripresa
   
   %66
   R2.
   r8 <<{si do si do si}\\{sol la sol la sol}>>\mbreak
   R2.
   
   %69
   r8 fa' fa fa fa sold
   la2.
   sol8 sol16(si) fad8 fad16(si) red,8 red16( fad)
   
   %72
   mi4 r r
   r8 mi\f la fad si si,
   mi4\fermata r r

}

IIvlaIn = \relative do' {
   
   sol8\upl_\markup {\dynamic pp Sempre} sol'\upl sol\upl sol\upl sol,\upl sol'\upl
   sol, sol' sol sol \once\stemUp sol,[la']
   la sol r4 r
   
   %4
   R2.
   r8 mi fad fad fad red
   si si r4 r
   
   %7
   r8 sol' sol sol sol sol\mbreak
   mi2.
   fad8 fad la, la fad' fad
   
   %10
   re2.
   mi8 mi sol, sol mi' mi
   do2.
   
   %13
   red8 red fad, fad red' red
   si si mi si mi si %%% ripresa
   R2.
   
   %16
   r8 mi la mi la mi\mbreak
   R2.
   r8 do' do do do re
   
   %19
   mi mi, mi mi la red,
   si si red red fad si,
   sol4 r r
   
   %22
   r8 mi'\f la fad si si,
   mi4 r r  %%%fine ripresa
   R2.*3
   
   %27
   sol,8 sol' sol sol sol, sol'
   sol,4 r r
   sol8 sol' sol sol sol, sol'
   
   %30
   mi2.
   fad8 fad la, la fad' fad
   re2.
   
   %33
   mi8 mi sol, sol mi' mi\mbreak
   do2.
   red8 red fad, fad red' red
   
   %36
   si4 r r
   sol8 sol' sol sol si, si
   dod2 fad4
   
   %39
   fad r8 si si lad
   r4 r8 si si lad
   r fad fad fad fad fad
   
   %42
   re re re re re re
   si2.
   r8 dod dod dod dod dod
   
   %45
   fad si,\f mi dod fad fad,
   si4 r r
   si8\p si dod dod dod dod
   
   %48
   lad2.
   fad'8 fad fad fad re re\mbreak
   si2 sold4
   
   %51
   mi'8 mi mi mi do[do]
   fa2.
   si,8 si sold sold sold sold
   
   %54
   la4 r r
   red8 red red red red red
   si4 r r
   
   %57
   sol8 sol' sol sol \once\stemUp sol, [sol']
   do,4 r8 do do4
   r r8 red red4
   
   %60
   r r8 si sol'4
   r r8 fad fad4
   r8 sol sol sol sol, sol'
   
   %63
   sol,4 r r
   si2.\fermata
   si8 si mi si mi si %%% ripresa
   
   %66
   R2.
   r8 mi la mi la mi\mbreak
   R2.
   
   %69
   r8 do' do do do re
   mi mi, mi mi la red,
   si si red red fad si,
   
   %72
   sol4 r r
   r8 mi'\f la fad si si,
   mi4\fermata r r
   
}

IIsopranoIn = \relative do'' {

   \autoBeamOff
   R2.*23
   si4 mi, do'
   do\tr si r
   
   %26
   fad'8 si, si4 la
   sol4. fad8 mi4
   r si' mi\mbreak
   
   %29
   mi4. si8 sol mi
   \appoggiatura re' do32[(si do8.) ]\appoggiatura re8 do32[(si do8.)] \appoggiatura re8 do32[(si do8.~)]
   do8 fad4 re do8
   
   %32
   \appoggiatura do8 si32[(la si8.)] \appoggiatura do8 si32[(la si8.)] \appoggiatura do8 si32[(la si8.)~]
   si8 mi4 do si8
   \appoggiatura si8 la32[(sold la8.) ]\appoggiatura si8 la32[(sold la8.) ]\appoggiatura si8 la32[(sold la8.~)]\mbreak
   
   %35
   la8 red4 si la8
   sol8. [fad16] mi4 r
   si' si8 si mi mi
   
   %38
   fad,4 lad dod
   re4. dod16 [re] \appoggiatura fad8 mi [re16 dod]
   re4. dod16 [re] \appoggiatura fad8 mi  re16 [dod]\mbreak
   
   %41
   re8 dod16  si dod2\tr
   si4 r r
   R2.*3
   
   %46
   si4 fad re'
   re dod r
   dod?8 lad fad4 mi'\mbreak
   
   %49
   mi8.\tr re16 re4 r
   re4. do16 [si] \appoggiatura la8 sold re'16 si
   do4. mi8[\grace re do la]
   
   %52
   \appoggiatura sol fa4. fa'8 re16[do si la]
   sold4. fa'8\mbreak mi16[re do si]
   do8[si] la2
   
   %55
   red16[mi fad?8]~fad16[mi red dod] si8 la
   sol8. fad16 mi4 r
   si'4. la8 sol16[fad] mi[re]\mbreak
   
   %58
   do8[do']~do16[si la sol] fad8[mi]
   red[red']~red16[do si la] sol8[fad]
   mi[mi']~mi16[re do si] la8[sol]
   
   %61
   fad[fad']~fad16[mi red dod] si8[la]\mbreak
   sol[fad] mi2
   si' si4
   
   %64
   mi8 sol,16 mi fad2\tr 
   mi r4
   R2.*9
   
}

IItestoI = \lyricmode {
   
   Glo -- ri -- a Pa -- tri Glori - a et Fi -- li -- o et Spi - ritu - i Sanc - - - - - - - - - - - - - - - - - - to
   
   Glo -- ri -- a et Spi -- ri -- tu -- i Sanc - - - to et Spi -- ri -- tui  _ Sanc -- to
   
   Glo -- ri -- a Pa -- tri Glori - a et Fi -- lio _ et Spi -- ri -- tui _ Sanc - - - - - - - - to
   
   Glo -- ria _  Fi -- lio _ et Spi -- ri -- tui Sanc - - - - - - - - to et Spi -- ri -- tui _ Sanc -- to.

}

IIbcIn = \relative do {
   
   mi8\upl_\markup {\dynamic pp Sempre}  mi\upl mi\upl mi\upl mi\upl mi\upl
   mi mi mi mi mi mi
   mi mi r4 r
   
   %4
   R2.
   r8 mi si[si si si]
   mi mi r4 r
   
   %7
   r8 mi mi mi mi mi\mbreak 
   la2.
   re,8 re re re re re
   
   %10
   sol2.
   do,8 do do do do do
   fad2.
   
   %13
   si,8 si si si si si
   mi si' si si si si  %% ripresa
   R2.
   
   %16
   mi,8 mi mi mi mi mi\mbreak 
   R2.
   la8 la la la la si
   
   %19
   do la la la la si
   mi, sol si si si, si
   mi4 r r
   
   %22
   r8 mi\f la fad si si,
   mi4 r r %%% fine ripresa
   r8 mi mi mi mi mi
   
   %25
   mi mi mi mi mi mi\mbreak
   red red red red si si
   mi mi mi mi mi mi
   
   %28
   mi4 r r
   r8 mi mi mi mi mi
   la2.
   
   %31
   re,8 re re re re re
   sol2.
   do,8 do do do do do\mbreak
   
   %34
   fad2.
   si,8 si si si si si
   mi,4 r r
   
   %37
   mi'8 mi mi mi sol sol
   fad2.
   si,4 r8 si' mi, fad
   
   %40
   si,4 r8 si' mi, fad
   si, si' fad mi fad fad,
   si si si si si si
   
   %43
   mi4 r r
   r8 lad, lad lad lad lad
   si8 si' \f mi dod fad fad,
   
   %46
   si\p si, si si si si
   fad' fad fad fad fad fad
   fad2.
   
   %49
   si,8 si si si si si\mbreak
   mi2.
   la,8 la la la la la
   
   %52
   re2.
   mi8 mi mi mi mi mi
   la,4 r r
   
   %55
   si8 si si si si si
   mi4 r r
   mi8 mi mi mi mi mi
   
   %58
   la,4 r8 la la4
   r r8 si si4
   r r8 mi mi4
   
   %61
   r r8 si si4
   r8 mi mi mi mi mi
   mi4 r r
   
   %64
   mi si2_\fermata 
   mi8 si' si si si si  %% ripresa
   R2.
   
   %67
   mi,8 mi mi mi mi mi\mbreak 
   R2.
   la8 la la la la si
   
   %70
   do la la la la si
   mi, sol si si si, si
   mi4 r r
   
   %73
   r8 mi\f la fad si si,
   mi4\fermata r r %%%
   
}

IIbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


IIvlIIIn = \relative do'' {
   
   R2.*2
   r8 si'16(sol) mi8\upl si16(sol) mi8\upl si'16(sol)
   \once\stemUp mi8\upl si''16(sol) mi8\upl si16(sol) mi8 do'\upl
   
   %5
   do\upl si\upl r4 r
   r8 sol'16(mi) red8\upl si'16(fad) si,8\upl la'\upl
   la\upl sol\upl r4 r\mbreak 
   
   %8
   r8 mi16(do) la8\upl do16(la) mi8\upl mi'\upl
   fad,2.~
   fad8 re'16(si) sol8 si16(sol) re8 re'
   
   %11
   mi,2.~
   mi8[do'16(la) fad8 la16(fad)] la,8\once\stemDown  do'
   red,2~red8 red'
   
   %14
   mi4 r r  %% inizio ripresa
   r8   <<{fad^\markup\italic"Pmi"  sol fad sol fad}\\{red_\markup\italic"2di" mi red mi red}>>  %%ripresa
   R2.\mbreak
   
   %17
   r8 <<{si do si do si}\\{sol la sol la sol}>>
   R2.
   r8 do do do do red
   
   %20
   mi4 r r
   r8 sol16(si) fad8 fad16(si) red,8 red16(fad)
   mi8 mi\f la fad si si,
   
   %23
   mi4 r r %% fine ripresa
   R2.*4
   r8 si'16(sol) mi8 si16(sol) mi8 si'16(sol)
   
   %29
   mi4 r r
   r8 mi'16(do) la8 do16(la) mi8 mi'
   fad,2.~
   
   %32
   fad8 re'16(si) sol8 si16(sol) re8 re'
   mi,2.~
   mi8 do'16(la) fad8 la16(fad) \once\stemUp la,8 \once\stemDown do'
   
   %35
   red,2.
   \once\stemUp mi8 si''16(sol) mi8 si16(sol) mi8 si'16(sol)
   mi4 r r
   
   %38
   r8 mi'16(dod) lad8 dod16(lad) fad8 mi'16(dod)
   re8 fad16(re) si4 r
   r8 fad'16(re) si4 r
   
   %41
   R2.*2
   r8 si16(sol) mi8 mi'16(si) sol8 sol'16(mi)
   dod2.
   
   %45
   re8 si\f mi dod fad fad,
   si4 r r
   R2.
   
   %48
   r8 mi16\p(dod) lad8 dod16(lad) fad8 mi'16(dod)
   fad2.\mbreak
   r8 si16(sold) mi8 sold16(mi) si8 sold'
   
   %51
   la2.
   r8 la16(fa) re8 fa16(re) la8 fa'16(re)
   si'2.
   
   %54
   r8 la16(mi) do8 mi16(do) la8 do16(la)
   la'2.
   r8 si16(sol) mi8 si16(sol) mi8 si'16(sol)
   
   %57
   mi4 r r
   r8 mi'16(do) la4 r
   r8 la'16(fad) red4 r
   
   %60
   r8 sol16(mi) si4 r
   r8 la'16(fad) red4 r
   R2.
   
   %63
   r8 si'16(sol) mi8 si16(sol) mi8 si'16(sol)
   mi4 r r
   mi4 r r  %% inizio ripresa
   
   %66
   r8   <<{fad'^\markup\italic"Pmi"  sol fad sol fad}\\{red_\markup\italic"2di" mi red mi red}>>  %%ripresa
   R2.\mbreak
   r8 <<{si do si do si}\\{sol la sol la sol}>>
   
   %69
   R2.
   r8 do do do do red
   mi4 r r
   
   %72
   r8 sol16(si) fad8 fad16(si) red,8 red16(fad)
   mi8 mi\f la fad si si,
   mi4\fermata r r
   
}

IIvlaIIn = \relative do' {
   
   R2.*2
   r8 sol'\upl sol\upl sol\upl sol, \upl sol'\upl 
   sol, sol' sol sol \once\stemUp sol,[\once\stemDown la']
   
   %5
   la sol re4 r
   r8 mi fad fad fad red
   si si r4 r\mbreak
   
   %8
   r8 do do do do do
   la2.
   sol8 si si si si si
   
   %11
   sol2.
   fad8 la la la la la
   fad2~fad8 si
   
   %14
   si4 r r %%% inizio ripresa 
   r8 si mi si mi si
   R2.\mbreak
   
   %17
   r8 mi la mi la mi
   R2.
   r8 mi mi mi la red,
   
   %20
   si4 r r
   r8 si red[red fad si,]
   si8\f mi la fad si si,
   
   %23
   mi4 r r %%%ripresa
   R2.*4
   sol,8 sol' sol sol sol, sol'
   
   %29
   sol,4 r r
   r8 do do do do do
   la2.
   
   %32
   sol8 si si si si si
   sol2.\mbreak
   do8 do do do do la
   
   %35
   fad2 si4
   si8 si si si sol sol
   sol4 r r
   
   %38
   dod8 dod dod dod lad lad
   fad re' re4 r
   r8 re re4 r
   
   %41
   R2.*2
   r8 sol, sol sol si si'
   lad2.
   
   %45
   fad8 si,\f mi dod fad fad,
   si4 r r
   R2.
   
   %48
   r8 dod\p dod dod dod dod
   re2.\mbreak
   sold,8 si si si sold mi'
   
   %51
   mi2.
   fa8 fa fa fa fa fa 
   sold2.
   
   %54
   mi8 mi mi mi do do
   fad2.
   sol,8 sol' sol sol sol, sol'
   
   %57
   si,4 r r
   r8 do do4 r
   r8 red red4 r
   
   %60
   r8 si sol'4 r
   r8 fad fad4 r
   R2.
   
   %63
   r8 sol sol sol sol, sol'
   si,2.\fermata 
   sol4 r r%%% inizio ripresa 
   
   %63
   r8 si mi si mi si
   R2.\mbreak
   r8 mi la mi la mi
   
   %69
   R2.
   r8 mi mi mi la red,
   si4 r r
   
   %72
   r8 si red[red fad si,]
   si8\f mi la fad si si,
   mi4 r r %%%ripresa
 
}

IIbcIIn = \relative do {
   
   R2.*2
   r8 mi\upl mi\upl mi\upl mi\upl mi\upl 
   mi mi mi mi mi mi
   
   %5
   mi mi r4 r
   r8 mi si si si si
   mi mi r4 r\mbreak 
   
   %8
   r8 la la la la la
   re,2.
   sol8 sol sol sol sol sol
   
   %11
   do,2.
   fad8 fad fad fad fad fad
   si,2~si8 si
   
   %14
   mi4 r r %ripresa
   si'8 si si si si si
   R2.\mbreak
   
   %17
   mi,8 mi mi mi mi mi
   R2.
   r8 la la la la si
   
   %20
   mi,4 r r
   r8 sol si si si, si
   mi mi\f la fad si si,
   
   %23
   mi4 r r  %% fine ripresa
   R2.*4
   r8 mi mi mi mi mi
   
   %29
   mi4 r r
   r8 la la la la la
   re,2.  
   
   %32
   sol8 sol sol sol sol sol
   do,2.\mbreak
   fad8 fad fad fad fad fad
   
   %35
   si,2.
   mi8 mi mi mi mi mi
   mi4 r r
   
   %38
   fad8 fad fad fad fad fad
   si,8 si' si,4 r
   r8 si' si,4 r
   
   %41
   R2.*2
   r8 mi mi mi mi mi
   fad2.
   
   %45
   si,8 si'\f mi dod fad fad,
   si,4 r r
   R2.
   
   %48
   r8 fad'\p fad fad lad, lad
   si2.\mbreak
   mi8 mi mi mi mi mi
   
   %51
   la,2.
   re8 re re re re re
   mi2.
   
   %54
   la,8 la la la la la
   si2.
   mi8 mi mi mi mi mi
   
   %57
   mi4 r r
   r8 la, la4 r
   r8 si si4 r
   
   %60
   r8 mi mi4 r
   r8 si si4 r
   R2.
   
   %63
   r8 mi mi mi mi mi
   mi4 r r
   mi4 r r %ripresa
   
   %66
   si'8 si si si si si
   R2.\mbreak
   mi,8 mi mi mi mi mi
   
   %69
   R2.
   r8 la la la la si
   mi,4 r r
   
   %72
   r8 sol si si si, si
   mi mi\f la fad si si,
   mi4\fermata r r
   
}

IIbfIIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \key sol\major
   \tempo 2 = 45
   s2.*74
   \bar "|."

}

IIvlI = {
   \notypeset
   <<\IIvlIn \forma>>

}

IIvlaI = {
   \clef alto
   <<\IIvlaIn \forma>>

}

IIsopranoI = {
   \new Voice = "gloria"
   <<\IIsopranoIn \forma>>
}

IIbcI = {
   \clef bass
   <<\IIbcIn \forma \IIbfIn>>
}

IIvlIII = {
   <<\IIvlIIIn \forma>>

}

IIvlaII = {
   \clef alto
   <<\IIvlaIIn \forma>>

}

IIbcII = {
   \clef bass
   <<\IIbcIIn \forma \IIbfIIn>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IIIvlIn = \relative do'' {
   
   sol'4. sol8 sol4 fad
   la4. la8 la8. la16 sold4
   si si8 si si4 lad
   
   %4
   lad?4. lad8 si8. si16 si4
   sold4. sold8 la4 la
   fad4. fad8 sol?8. sol16 sol4
   
   %7
   mi la fad sol
   sol fad sol2\fermata
   R1*3
   
   %12
   r2 mi\mbreak
   dod do
   si4 sol'2 fad4
   
   %15
   mi la re,8[re mi fad]
   sol4 r r8 re re4~
   re8 do16 si do[re mi fa] sol8 sol, r sol'
   
   %18
   re2~re8 re16 re re8 re
   re sol, r4 r re'8 re
   la' la16 la la[sol fad mi]\mbreak re8 re re'16[do si la]
   
   %21
   sol8 sol sol sol mi mi16 mi re8 re
   sol4. sol8 fad[mi re do]
   si sol r4 r r8 re'16 re
   
   %24
   sol8 sol16 sol sol8 sol mi mi r mi16 mi
   la8 la16 la la8 la sol sol sol sol
   mi la4 fad8 mi2
   
   %27
   fad4 sol8[si] lad4 si~
   si lad si si,8 si\mbreak 
   fad' fad16 fad fad[mi red do] si8 si si'16[la sold fad]
   
   %30
   mi8 mi mi sol? dod, dod16 dod re8 fad
   sol16[fad mi re]] dod8 dod fad16[mi re dod] si8 r
   mi2 red
   
   %33
   re! do!4 la'~
   la sol fad si
   mi,8[mi fad sold] la4 r
   
   %36
   r la,8 la\mbreak mi' mi16 mi la[sol fa mi]
   fa8 re fa[la] sold4 la16[sol fa mi]
   fa8 re si'[sold] mi4 sol
   
   %39
   fad8[re16 mi fad mi fad re] sol4 r
   r r8 sol sol sol16 sol sol8 sol
   sol mi mi mi fad4 sol~
   
   %42
   sol fad sol sol~
   sol fad2 mi4~
   mi re2 do4~
   
   %45
   do8 si fad' fad sol sol fad4
   sol sol2 fad4~
   fad mi2 re4~
   
   %48
   re do~do8 si fad' fad
   sol sol fad4 sol2\fermata

}

IIIvlIIn = \relative do'' {
   
   si4. si8 la4 la
   do4. do8 do8. do16 si4
   re re8 re re4 dod
   
   %4
   dod?4. dod8 red8. red16 red4
   si4. si8 do4 do
   la4. la8 si8. si16 si4
   
   %7
   sol do la si
   la2 si\fermata
   sol2 fad
   
   %10
   fa mi4 do'~
   do si la re
   sol,8[la si dod] re4 r\mbreak
   
   %13
   r8 la la4~la8 sol16 fad sol la si do
   re8 re, r re' la2~
   la8 la16 la la8 la la re, r4
   
   %16
   r sol8 sol re' re16 re re[do si la]
   sol8 sol sol'16[fa mi re] do8 do do do
   re re16 re sol,8 sol re'4. do8
   
   %19
   si[si la sol] fad re r4
   mi'2\mbreak fad
   sol4 si,8 si dod4 re~
   
   %22
   re dod re r8 la16 la
   re8 re16 re re[do si la] sol8 sol r sol16 sol
   mi'8 mi16 mi mi[re do si] la8 la r la16 la
   
   %25
   fad'8 fad16 fad fad[mi re do] si8 si sol'4~
   sol fad si, do!
   red mi fad2~
   
   %28
   fad4 fad, si2\mbreak
   lad la
   sol4 mi'2 re4
   
   %31
   dod fad si,8[si dod red]
   mi4 r r8 si si4~
   si8 la16 sold la[si do re] mi8 mi r mi
   
   %34
   si2~si8 si16 si si8 si
   si si mi16[re do si] do8 la la la
   mi' mi mi16[re dod si]\mbreak la8 la mi'4
   
   %37
   la, re16[do si la] si8 sold mi'4
   re8 fa mi16 re do si do8 la re mi
   la,8[fad16 sol la sol la fad] si4 r
   
   %40
   r8 re re4~re8 do16 si do[re mi fa]
   sol8 sol, r mi' la, la16 la si8 si
   mi mi re4 re mi16[re do si]
   
   %43
   do8 la16 la re[do si la]\mbreak si8 sol do16[si la sol]
   la8 fad16 fad si[la  sol fad] sol8 mi la16[sol fad mi]
   fad8 sol la16[si do re] si8 si la4
   
   %46
   si mi16[re do si] do8 la16 la re[do si la]
   si8 sol do16[si la sol] la8 fad16 fad si[la sol fad]
   sol8 mi la16[sol fad mi] fad8 sol la16[si do re]
   
   %49
   si8 si la4 si2\fermata
   
}

IIIvlaIn = \relative do' {
   
   re4. re8 re4 re
   mi4. mi8 mi8. mi16 mi4
   fad fad8 fad fad4 fad
   
   %4
   fad4. fad8 fad8. fad16 fad4
   mi4. mi8 mi4 mi
   re4. re8 re8. re16 re4
   
   %7
   mi do do re
   mi re re2\fermata  %%OOKK
   R1*5
   
   %14
   r4 si8 si dod4 re~
   re dod re r
   sol,2 fad
   
   %17
   fa mi4 do'~
   do si la re
   sol,8 [la si dod] re4 r
   
   %20
   r8 la la4~\mbreak la8 sol16 fad sol[la si do]
   re8 re, r re' la2
   si8 mi4 dod8 la4 r
   
   %23
   r r8 fad16 fad si8 si16 si si[la sol fad]
   mi8 mi r mi16 mi do'8 do16 do do[si la sol]
   fad8 fad r fad16 fad re'8 re16 re re8 dod16[si]
   
   %26
   dod4 re2 do4
   si mi2 re4
   dod4. lad8 fad4 r\mbreak
   
   %29
   R1
   r4 si8 si lad4 si~
   si lad si si16[do si la?]
   
   %32
   sol8 mi r4 r si'8 si
   sold sold16 sold sold8 la16 si do!8 la mi' mi
   fad fad16 fad si,8 si si si r4
   
   %35
   r2 la
   sold\mbreak sol
   fa4 re'2 do4
   
   %38
   si mi la,8[la si dod]
   re4 do! si sol8 sol
   re' re16 re re[do si la] sol8 sol sol'16[fad mi re]
   
   %41
   do8 do do do re2~
   re4. do8 si sol r mi'
   mi re16 mi fad[mi re do]\mbreak re8[do16 re mi re do si]
   
   %44
   do8[si16 do re do si la]  si8[la16 si do si la sol]
   la8 si re re re re re4
   re r8 mi mi re16 mi fad[mi re do]
   
   %47
   re8[do16 re mi re do si]  do8[si16 do re do si la]  
   si8[la16 si do si la sol] la8 si re re 
   re re re4 re2\fermata
   
}

IIIsopranoIn = \relative do'' {

   \autoBeamOff
   si4. si8 la4 la
   do4. do8 do8. do16 si4
   re re8 re re4 dod
   
   %4
   dod?4. dod8 red8. red16 red4
   si4. si8 do4 do
   la4. la8 si8. si16 si4
   
   %7
   sol do la si
   la2 si\fermata
   sol2 fad
   
   %10
   fa mi4 do'~
   do si la re
   sol,8[la si dod] re4 r\mbreak
   
   %13
   r8 la la4~la8 sol16 fad sol[la] si[do]
   re8 re, r re' la2~
   la8 la16 la la8 la la re, r4
   
   %16
   r sol8 sol re' re16 re re[do] si[la]
   sol8 sol sol'16[fa] mi[re] do8 do do do
   re re16 re sol,8 sol re'4. do8
   
   %19
   si[si la sol] fad re r4
   mi'2\mbreak fad
   sol4 si,8 si dod4 re~
   
   %22
   re dod re r8 la16 la
   re8 re16 re re[do] si[la] sol8 sol r sol16 sol
   mi'8 mi16 mi mi[re] do[si] la8 la r la16 la
   
   %25
   fad'8 fad16 fad fad[mi] re[do] si8 si sol'4~
   sol fad si, do!
   red mi fad2~
   
   %28
   fad4 fad, si2\mbreak
   lad la
   sol4 mi'2 re4
   
   %31
   dod fad si,8[si dod red]
   mi4 r r8 si si4~
   si8 la16 sold la[si] do[re] mi8 mi r mi
   
   %34
   si2~si8 si16 si si8 si
   si si mi16[re] do[si] do8 la la la
   mi' mi mi16[re] dod[si]\mbreak la8 la mi'4
   
   %37
   la, re16[do] si[la] si8 sold mi'4
   re8[fa mi16 re do si] do8 la re mi
   la,8[fad16 sol la sol la fad] si4 r
   
   %40
   r8 re re4~re8 do16 si do[re] mi[fa]
   sol8 sol, r mi' la, la16 la si8 si
   mi mi re4 re mi16[re] do[si]
   
   %43
   do8 la16 la re[do] si[la]\mbreak si8 sol do16[si] la[sol]
   la8 fad16 fad si[la] sol[fad] sol8 mi la16[sol] fad[mi]
   fad8 sol la16[si do re] si8 si la4
   
   %46
   si mi16[re] do[si] do8 la16 la re[do] si[la]
   si8 sol do16[si] la[sol] la8 fad16 fad si[la] sol[fad]
   sol8 mi la16[sol] fad[mi] fad8 sol la16[si do re]
   
   %49
   si8 si la4 si2\fermata
   
}

IIItestoI = \lyricmode {
   
   Si -- cut e -- rat in prin -- ci -- pio, _ et nunc, et sem -- per, et in sæ -- cula _  sæcu - lorum _ 
   
   et in sæ -- cula _  sæcu - lorum _ a -- men.
   
   A - - - - - - - - men in sæ -- cula _  sæcu - lorum _  in sæ -- cula _  sæcu - lorum _  et in sæ -- cula _  sæcu - lorum _ 
   
    sæcu - lorum _ et in sæ -- cula _  sæcu - lo -- rum a - men a - men sæcu - lo -- rum a -- men
    
    et in sæ -- cula _  sæcu - lo -- rum et in sæ -- cula _  sæcu - lo -- rum et in sæ -- cula _  sæcu - lo -- rum 
    
    a - - - - - - men a  - - - - - - - - men in sæ -- cula _  sæcu - lo -- rum in sæ -- cula _  sæcu - lo -- rum 
    
    sæcu - lo -- rum sæcu - lo -- rum sæcu - lo -- rum a -- men sæcu - lo -- rum a - - men a - - men
    
    in sæ -- cula _  sæcu - lo -- rum in sæ -- cula _  sæcu - lo -- rum  a -- men
    
    et in sæ -- cula _  sæcu - lo -- rum  et in sæ -- cula _  sæcu - lo -- rum  sæcu - lo -- rum a - men a -- men
    
    et in sæ -- cula _  sæcu - lo -- rum  et in sæ -- cula _  sæcu - lo -- rum  sæcu - lo -- rum a - men a -- men.

}

IIIaltoIn = \relative do' {

   \autoBeamOff
   
   sol'4. sol8 sol4 fad
   la4. la8 la8. la16 sold4
   si si8 si si4 lad
   
   %4
   lad?4. lad8 si8. si16 si4
   sold4. sold8 la4 la
   fad4. fad8 sol?8. sol16 sol4
   
   %7
   mi la fad sol
   sol fad sol2\fermata
   R1*3
   
   %12
   r2 mi\mbreak
   dod do
   si4 sol'2 fad4
   
   %15
   mi la re,8[re mi fad]
   sol4 r r8 re re4~
   re8 do16 si do[re] mi[fa] sol8 sol, r sol'
   
   %18
   re2~re8 re16 re re8 re
   re sol, r4 r re'8 re
   la' la16 la la[sol] fad[mi]\mbreak re8 re re'16[do] si[la]
   
   %21
   sol8 sol sol sol mi mi16 mi re8 re
   sol4. sol8 fad[mi re do]
   si sol r4 r r8 re'16 re
   
   %24
   sol8 sol16 sol sol8 sol mi mi r mi16 mi
   la8 la16 la la8 la sol sol sol sol
   mi la4 fad8 mi2
   
   %27
   fad4 sol8[si] lad4 si~
   si lad si si,8 si\mbreak 
   fad' fad16 fad fad[mi] red[do] si8 si si'16[la] sold[fad]
   
   %30
   mi8 mi mi sol? dod, dod16 dod re8 fad
   sol16[fad mi re]] dod8 dod fad16[mi re dod] si8 r
   mi2 red
   
   %33
   re! do!4 la'~
   la sol fad si
   mi,8[mi fad sold] la4 r
   
   %36
   r la,8 la\mbreak mi' mi16 mi la[sol] fa[mi]
   fa8 re fa[la] sold4 la16[sol] fa[mi]
   fa8 re si'[sold] mi4 sol
   
   %39
   fad8[re16 mi fad mi fad re] sol4 r
   r r8 sol sol sol16 sol sol8 sol
   sol mi mi mi fad4 sol~
   
   %42
   sol fad sol sol~
   sol fad2 mi4~
   mi re2 do4~
   
   %45
   do8 si fad' fad sol sol fad4
   sol sol2 fad4~
   fad mi2 re4~
   
   %48
   re do~do8 si fad' fad
   sol sol fad4 sol2\fermata
   
}

IIItestoII = \lyricmode {
   
   Si -- cut e -- rat in prin -- ci -- pio, _ et nunc, et sem -- per, et in sæ -- cula _  sæcu - lorum _ 
   
   et in sæ -- cula _  sæcu - lorum _ A - men. 
   
   A - - - - - - - - men in sæ -- cula _  sæcu - lorum _  in sæ -- cula _  sæcu - lorum _  et in sæ -- cula _  sæcu - lorum _ 
   
   sæcu - lorum _  et in sæ -- cula _  sæcu - lorum _ a - men 
   
   et in sæ -- cula _  sæcu - lorum _ et in sæ -- cula _  sæcu - lorum _ sæcu - lo  - rum a - - - - - men
   
    et in sæ -- cula _  sæcu - lorum _ sæcu - lorum _ et in sæ -- cula _  sæcu - lo  - rum  a -- men 
    
    a - - - - - - - - men et in sæ -- cula _  sæcu - lorum _ a -- men a - - men a -- men  a - men 
    
    in sæ -- cula _  sæcu - lorum _ sæcu - lo -- rum a -- men a - - - - men  sæcu - lorum _ a -- men 
    
    a - - - - men sæcu - lorum _ a -- men.

}

IIItenoreIn = \relative do' {

   \autoBeamOff
   
   re4. re8 re4 re
   mi4. mi8 mi8. mi16 mi4
   fad fad8 fad fad4 fad
   
   %4
   fad4. fad8 fad8. fad16 fad4
   mi4. mi8 mi4 mi
   re4. re8 re8. re16 re4
   
   %7
   mi do do re
   mi re re2\fermata  %%OOKK
   R1*5
   
   %14
   r4 si8 si dod4 re~
   re dod re r
   sol,2 fad
   
   %17
   fa mi4 do'~
   do si la re
   sol,8 [la si dod] re4 r
   
   %20
   r8 la la4~\mbreak la8 sol16 fad sol[la] si[do]
   re8 re, r re' la2
   si8 mi4 dod8 la4 r
   
   %23
   r r8 fad16 fad si8 si16 si si[la] sol[fad]
   mi8 mi r mi16 mi do'8 do16 do do[si] la[sol]
   fad8 fad r fad16 fad re'8 re16 re re8 dod16[si]
   
   %26
   dod4 re2 do4
   si mi2 re4
   dod4. lad8 fad4 r\mbreak
   
   %29
   R1
   r4 si8 si lad4 si~
   si lad si si16[do si la?]
   
   %32
   sol8 mi r4 r si'8 si
   sold sold16 sold sold8 la16[si] do!8 la mi' mi
   fad fad16 fad si,8 si si si r4
   
   %35
   r2 la
   sold\mbreak sol
   fa4 re'2 do4
   
   %38
   si mi la,8[la si dod]
   re4 do! si sol8 sol
   re' re16 re re[do] si[la] sol8 sol sol'16[fad] mi[re]
   
   %41
   do8 do do do re2~
   re4. do8 si sol r mi'
   mi re16 mi fad[mi] re[do]\mbreak re8[do16 re mi re do si]
   
   %44
   do8[si16 do re do si la]  si8[la16 si do si la sol]
   la8 si re re re re re4
   re r8 mi mi re16 mi fad[mi] re[do]
   
   %47
   re8[do16 re mi re do si]  do8[si16 do re do si la]  
   si8[la16 si do si la sol] la8 si re re 
   re re re4 re2\fermata
   
}

IIItestoIII = \lyricmode {
   
   Si -- cut e -- rat in prin -- ci -- pio, _ et nunc, et sem -- per, et in sæ -- cula _  sæcu - lorum _ 
   
   et in sæ -- cula _  sæcu - lorum _ A - men. 
   
   Sæcu - lo -- rum a -- men a - - - - - - - - men in sæ -- cula _  sæcu - lorum _ in sæ - - cula _ 
   
   et in sæ -- cula _  sæcu - lorum _  et in sæ -- cula _  sæcu - lorum _  et in sæ -- cula _  sæcu - - lo -- rum a - - - - men 
   
   sæcu - lo -- rum a -- men a - men et in sæ -- cula _  sæcu - lorum _ et in sæ -- cula _  sæcu - lorum _  
   
   a - - - - - - - - - - men et in sæ -- cula _  sæcu - lorum _ sæcu - lorum _ sæcu - lo -- rum a -- men 
   
   in sæ -- cula _  sæcu - lo - - - rum sæcu - lo -- rum a -- men
   
   in sæ -- cula _  sæcu - lo - - - rum sæcu - lorum _ a -- men.

}

IIIbassoIn = \relative do {

   \autoBeamOff
   sol'4. sol8 re4 re
   la'4. la8 mi8. mi16 mi4
   si' si8 si fad4 fad
   
   %4
   fad4. mi8 red8. dod16 si4
   mi4. re8 do4 la
   re4. do8 si8. la16 sol4
   
   %7
   do la re sol,
   do re sol,2\fermata
   R1*3
   
   %12
   r2 r4 fad'8 fad
   la la16 la la[sol] fad[mi] re8 re re'16[do] si[la]
   sol8 sol sol sol la la16 la re,8 re
   
   %15
   la'4. sol8 fad[mi re do]
   si sol r4 r2
   r r4 mi'8 mi
   
   %18
   fad4 sol2 fad4
   sol r re2
   dod\mbreak do
   
   %21
   si4 sol'2 fad4
   mi la re,8[re mi fad]
   sol4 r8 re16 re sol8 sol16 sol sol[fad] mi[re]
   
   %24
   do8 do r do16 do la'8 la16 la la[sol] fad[mi]
   re8 re r re16 re si'8 si16 si si8 la16[sol]
   la4 re, sold la~
   
   %27
   la sol! fad si,
   fad'4. mi8 re si r4\mbreak
   r r8 fad' red8 red16 red red[si] dod[red]
   
   %30
   mi8 mi sol sol fad fad16 fad si[la] sol[fad]
   mi8 mi fad16[sol fad mi] re8 si r4
   r mi8 mi si' si16 si si[la] sold[fad] 
   
   %33
   mi8 mi mi16[re] do![si] la8 la do' do
   red,4 mi2 red4
   mi r r2
   
   %36
   mi4 re\mbreak dod2
   re mi4 la~
   la sold la r
   
   %39
   r2 sol
   fad fa
   mi4 do'2 si4
   
   %42
   la re, sol r8 sol
   la si16 do re8 re,\mbreak sol[la16 si] do8 do,
   fad sol16 la si8 si, mi fad16 [sol] la8 la,
   
   %45
   re sol re' re, sol sol, re''[re,]
   sol4 r8 sol la si16 do re8 re,
   sol[la16 si] do8 do, fad sol16 la si8 si,
   
   %48
   mi fad16 [sol] la8 la, re sol re' re,
   sol sol, re'' [re,] sol 2\fermata
   
}

IIItestoIV = \lyricmode {
   
   Si -- cut e -- rat in prin -- ci -- pio, _ et nunc, et sem -- per, et in sæ -- cula _  sæcu - lorum _ 
   
   et in sæ -- cula _  sæcu - lorum _ A - men.
   
   Et in sæ -- cula _  sæcu - lorum _ sæcu - lorum _ et in sæ -- cula _  sæcu - lo -- rum a - men sæcu - lo -- rum a -- men 
   
   a - - - - - - - - men et in sæ -- cula _  sæcu - lo -- rum et in sæ -- cula _  sæcu - lo -- rum et in sæ -- cula _  sæcu - lo -- rum 
   
   a - - - - - men a -- men in sæ -- cula _  sæcu - lo -- rum et in sæ -- cula _  sæcu - lo -- rum a - men 
   
   et in sæ -- cula _  sæcu - lo -- rum sæcu - lo -- rum  sæcu - lo -- rum a -- men a - - - - - - men a - - - - - - - men 
   
    in sæ -- cula _  sæcu - lo -- rum  in sæ -- cula _  sæcu - lo -- rum sæcu - lo -- rum a -- men  a -- men  a -- men 
    
    in sæ -- cula _  sæcu - lo -- rum  in sæ -- cula _  sæcu - lo -- rum sæcu - lo -- rum a -- men  a -- men  a -- men.

}

IIIbcIn = \relative do {
   
   sol8 la si sol re' mi fad re
   la si do la mi' fad sold mi
   si dod re si fad' sold lad fad
   
   %4
   fad sol! fad  mi red dod red si
   mi fa mi re do si do la
   re mi re do si la si sol
   
   %7
   do si do \parenthesize la re do si sol
   do la re re, sol2
   sol'8 la si sol re mi re do
   
   %10
   si la si sol do re mi do
   re fad sol sol, re'  mi fad re
   si'[la sol fad16 mi] re8 mi fad re\mbreak
   
   %13 OOKK
   la' sol la la, re fad  mi re
   sol la si sol  la la, re[re,]
   la'' si la sol fad mi re do
   
   %16
   si la si sol fad' mi fad re
   sol la si sol do, re mi do
   fad fad, sol' sol, sol' sol, fad' fad,
   
   %19
   sol' la si dod re re, fad re
   dod si dod la\mbreak do si do do,
   si' sol sol' sol, sol' sol, fad'[fad,]
   
   %22
   mi' fad sol la re, re mi fad 
   sol fad  mi re sol fad sol mi
   do si do do, la'' sol la fad
   
   %25
   re do re re, si'' la si sol
   la la, re[re,] sold' sold, la'[la,]
   la' la, sol'![sol,] fad' fad, si[si']
   
   %28
   fad sol fad mi re si re mi\mbreak
   fad sold lad fad red dod red si
   mi fad sol? mi fad fad, si' sol
   
   %31
   mi mi, fad' mi re si si' la
   sol fad sol mi si' la si sold
   mi re mi mi, la la' do la
   
   %34
   red, red, mi'[mi,] mi' mi, red'[red,]
   mi' sold fad mi la si do la
   mi fa mi re\mbreak dod si dod dod,
   
   %37
   re' fa mi re mi mi, la'[la,]
   la' la, sold'[sold,] la' la si dod
   re re, do'! do, sol' la si sol
   
   %40
   fad mi fad fad,  fa' mi fa fa,
   mi' do do' do, do' do, si'[si,]
   la' la, re[re,] sol' sol, sol sol'
   
   %43
   la[si16 do re8 re,]\mbreak sol[la16 si do8 do,]
   fad[sol16 la si8 si,] mi[fad16 sol la8 la,]
   re sol re' re, sol sol, re'' re,
   
   %46
   sol sol, sol sol' la[si16 do re8 re,]
   sol[la16 si do8 do,] fad[sol16 la si8 si,] 
   mi[fad16 sol la8 la,] re sol re' re, 
   
   %49
   sol sol, re'' [re,] sol ,2\fermata
   
}

IIIbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s2 <5 4>4 s8 <3>
   s2 <6 4>4 s8 <5 3+>
   s2 <6 4>4 s8 <5+3+>
   s1
   <_+>
   s
   s4 <6> <7>2
   <6 5>1
   s
   <6 5->
   <7>
   s4 s8 <6+> s2
   <_+>2 <7->
   s <7 _+>
   <5 4>4 <3+> s2
   s1
   <7->
   <6 5>2 <5 2>
   s1
   s2 <4>
   s <6 4+>
   <7>4 s8 <_+> s2
   s1*3
   <7 _+>4 <3> <6 5> <_->
   <6 4+> <6> <7 _+> s
   <5+ 4>4 <3+> s2
   <_+> <7>
   s <7 _+>
   <6+ 5>4 <_+> s s8 <6 4+>
   <6>2 <_+>
   <7! _+> <_->
   <6 5> <5 2>4 <3>
   s1
   <_+>2 <6 5>
   <_-> <7 _+>
   <6- 2>4 <6> s s8 <6 5>
   s4 <6 4> s2
   s <6 4>
   s <6 4 2>
   <7 5 4> 4 s8 <7> s4 s8 <6>
   <7>2 <7>
   <7> <7>
   <7> s
   s4 s8 <6> <7>2
   <7> <7>
   <7> <7>
   
}


forma = {

   \time 4/4
   \key sol\major
   \tempo 2 = 38
   s1*8
   \bar "||"\break
   \once \override Score.RehearsalMark.extra-offset = #'(0 . -2.0) \mark\markup \huge\column { "Allegro"}
   \tempo 2 = 60
   s1*41
   \bar "|."

}

IIIvlI = {
   %\notypeset
   <<\IIIvlIn \forma>>

}

IIIvlII = {
   <<\IIIvlIIn \forma>>

}

IIIvlaI = {
   \clef alto
   <<\IIIvlaIn \forma>>

}

IIIsopranoI = {
   \new Voice = "sicut1"
   <<\IIIsopranoIn \forma>>
}

IIIaltoI = {
   \new Voice = "sicut2"
   <<\IIIaltoIn \forma>>
}

IIItenoreI = {
   \new Voice = "sicut3"
   <<\IIItenoreIn \forma>>
}

IIIbassoI = {
   \new Voice = "sicut4"
   \clef bass
   <<\IIIbassoIn \forma>>
}


IIIbcI = {
   \clef bass
   <<\IIIbcIn \forma \IIIbfIn>>
   \typeset
}
#(set-global-staff-size 16)


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

      systems-per-page = #1

   }

   \header {
      subtitle = \markup "Domine ad adiuvandum [RV 593]"
      composer = \markup {"A. Vivaldi (1678-1741)"}
   }

   \markup \huge {[1.] All[egr]o}

   \score {
      {
         <<

            \new ChoirStaff  <<

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \set Staff.instrumentName = \markup \center-column{{\bold\huge "Pmo Coro"} "[Violino I"\vspace #-0.3"Hautbois  I]"}
                  \IvlI\global
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \set Staff.instrumentName = \markup \center-column{"[Violino  II"\vspace #-0.3"Hautbois  II]"}
                  \IvlII\global
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                  \IvlaI\global
               >>

               \new Staff  <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef soprano \key sol\major \time 4/4 r1^\markup\center-align "[Canto]"}
                  \clef violin
                  \set Staff.midiInstrument = #"synth voice"
                  \IsopranoI \global
                  \new Lyrics \lyricsto "domine1" \ItestoI
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef alto \key sol\major \time 4/4 r1^\markup\center-align "[Alto]"}
                  \clef violin
                  \set Staff.midiInstrument = #"synth voice"
                  \IaltoI \global
                  \new Lyrics \lyricsto "domine2" \ItestoII
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef tenor \key sol\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                  \clef "treble_8"
                  \set Staff.midiInstrument = #"synth voice"
                  \ItenoreI \global
                  \new Lyrics \lyricsto "domine3" \ItestoIII
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                  \set Staff.midiInstrument = #"synth voice"
                  \IbassoI \global
                  \new Lyrics \lyricsto "domine4" \ItestoIV
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                  \set Staff.midiInstrument = #"contrabass"
                  \IbcI \global
               >>
            >>

            \new ChoirStaff <<

               \new Staff  <<
                  \set Staff.midiInstrument = #"violin"
                  \set Staff.instrumentName = \markup \center-column{{\bold\huge "2do Coro"} "[Violino III]"}
                  \IvlIII\global
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \set Staff.instrumentName = \markup \center-column{"[Violino IV]"}
                  \IvlIV\global
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \set Staff.instrumentName = \markup \center-column{"[Viola II]"}
                  \IvlaII\global
               >>

               \new Staff  <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef soprano \key sol\major \time 4/4 r1^\markup\center-align "[Canto]"}
                  \clef violin
                  \set Staff.midiInstrument = #"synth voice"
                  \IsopranoII \global
                  \new Lyrics \lyricsto "domine5" \ItestoV
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef alto \key sol\major \time 4/4 r1^\markup\center-align "[Alto]"}
                  \clef violin
                  \set Staff.midiInstrument = #"synth voice"
                  \IaltoII \global
                  \new Lyrics \lyricsto "domine6" \ItestoVI
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef tenor \key sol\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                  \clef "treble_8"
                  \set Staff.midiInstrument = #"synth voice"
                  \ItenoreII \global
                  \new Lyrics \lyricsto "domine7" \ItestoVII
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                  \set Staff.midiInstrument = #"synth voice"
                  \IbassoII \global
                  \new Lyrics \lyricsto "domine8" \ItestoVIII
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                  \set Staff.midiInstrument = #"contrabass"
                  \IbcII \global
               >>
            >>

         >>
      }

      \layout {

         indent = 2\cm
         incipit-width =2\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

   \paper {

      systems-per-page = #2

   }

   \markup \huge {[2.] And[ant]e molto - Senza Hautbois}

   \score {
      {
         <<

            \new ChoirStaff  <<

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \set Staff.instrumentName = \markup \center-column{{\bold\huge "Pmo Coro"} "[Violino I & II]"}
                  \IIvlI\global
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \set Staff.instrumentName = \markup \center-column{"[Viola I]"}
                  \IIvlaI\global
               >>

               \new Staff  <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef soprano \key sol\major \time 4/4 r1^\markup\center-align "[Canto]"}
                  \clef violin
                  \set Staff.midiInstrument = #"synth voice"
                  \IIsopranoI \global
                  \new Lyrics \lyricsto "gloria" \IItestoI
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{"[Basso]""Senza Org[ano"}
                  \set Staff.midiInstrument = #"contrabass"
                  \IIbcI \global
               >>
            >>

            \new ChoirStaff <<

               \new Staff  <<
                  \set Staff.midiInstrument = #"violin"
                  \set Staff.instrumentName = \markup \center-column{{\bold\huge "2do Coro"} "[Violino III & IV]"}
                  \IIvlIII\global
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \set Staff.instrumentName = \markup \center-column{"[Viola II]"}
                  \IIvlaII\global
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{"[Basso]""Senza Org[ano]"}
                  \set Staff.midiInstrument = #"contrabass"
                  \IIbcII \global
               >>
            >>

         >>
      }

      \layout {

         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

   \pageBreak

   \markup \huge {[3.] And[ant]e - Ambi li Cori Unisoni}

   \score {

            \new ChoirStaff  <<

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \set Staff.instrumentName = \markup \center-column{"[Violino I""Hautbois I]"}
                  \IIIvlI\global
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"violin"
                  \set Staff.instrumentName = \markup \center-column{"[Violino II""Hautbois II]"}
                  \IIIvlII\global
               >>

               \new Staff <<
                  \set Staff.midiInstrument = #"viola"
                  \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                  \IIIvlaI\global
               >>

               \new Staff  <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef soprano \key sol\major \time 4/4 si'4.^\markup\center-align "[Canto]" si'8}
                  \clef violin
                  \set Staff.midiInstrument = #"synth voice"
                  \IIIsopranoI \global
                  \new Lyrics \lyricsto "sicut1" \IIItestoI
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef alto \key sol\major \time 4/4 sol'4.^\markup\center-align "[Alto]" sol'8}
                  \clef violin
                  \set Staff.midiInstrument = #"synth voice"
                  \IIIaltoI \global
                  \new Lyrics \lyricsto "sicut2" \IIItestoII
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef tenor \key sol\major \time 4/4 re'4.^\markup\center-align"[Tenore]" re'8}
                  \clef "treble_8"
                  \set Staff.midiInstrument = #"synth voice"
                  \IIItenoreI \global
                  \new Lyrics \lyricsto "sicut3" \IIItestoIII
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                  \set Staff.midiInstrument = #"synth voice"
                  \IIIbassoI \global
                  \new Lyrics \lyricsto "sicut4" \IIItestoIV
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                  \set Staff.midiInstrument = #"contrabass"
                  \IIIbcI \global
               >>
            >>

      \layout {

         indent = 2.5\cm
         incipit-width =2.5\cm

         \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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
