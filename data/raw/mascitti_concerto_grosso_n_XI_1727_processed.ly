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

arco = _\markup \italic \center-align"con l'arco"

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

IvlIn = \relative do'' {

   re8
   sol16 la si la sol8 re mi16 fad sol fad mi8 si
   do16 re si do la re do re si4 sol
   si'8 sol sol, si' la fad \once\stemUp re, la''
   
   %4
   sol mi \once\stemUp dod, sol''\mbreak fad4 re
   re16(do) re(sol) re(do) re(sol) mi2
   mi16(re) mi(la) mi(re) mi(la) fad4. re8
   
   %7
   sol16 la si la sol8 re la'16 si do si la8 re,
   si'16 do la si do re si do re8 do16 si la si sol la
   fad(mi) fad(la) do,(si) do(la') si,(re) sol(si,) la(sol') la,(fad')
   
   %10
   sol si la sol fad re mi fad sol si la sol fad re mi fad
   sol(fad) sol(si) mi,(re) mi(sol) dod,2
   la'8 fad re la si2\mbreak
   
   %13
   si'8 sol mi si dod2
   la'8 fad re la' si la sol fad
   mi4. re8 re4\p r8 la'
   
   %16
   re, sol r fad si, mi r re\f\mbreak
   dod[re re8. dod16] re8 si mi,4
   re2. r8 la'
   
   %19
   re16 mi fad mi re8 la re16 mi fad mi re8 la
   mi'16 fad sol fad mi la sol la fad4. re8
   sol16(fad) sol(si) sol(fad) sol(si) do,(si) do(si') do,(si) do(la')\mbreak
   
   %22
   si,(la) si(re) sol(fad) sol(sol,) la(sol) la(sol') fad(mi) fad(la,)
   sol(fad) sol(mi') si(la) si(mi) do(si) do(mi) si(la) si(mi)
   la,(sol) la(mi') sol,(fad) sol(mi') red(si) mi(sol,) fad(mi') red(fad,)
   
   %25
   mi2 mi'16(re) mi(la) mi(re) mi(la)\mbreak
   fad4. re8 sol re sol, re'
   mi2 la8 mi la, mi'
   
   %28
   fad2 si8 fad si, fad'
   sol2 la8 fad re la'
   si4.\p la8\mbreak do4. si8
   
   %31
   la4. sol8 fad4. sol8\f
   la re, sol4. la16 sol fad8. sol16
   sol16 la si la sol8 re mi16(re) mi(sol) re(do) re (sol)
   
   %34
   mi(re) mi(sol) re(do) re(sol) do,(si) do(la') do,(si) do(la')
   si,8 re sol4~sol16 si la sol fad sol mi fad 
   sol8 mi la,8.[sol16] sol4.

}

IvlIIn = \relative do'' {
   
   r8
   si16 do re do si8 si do sol r re'
   la re re fad, sol4 re
   r8 re' re re, r re' re re
   
   %4
   r dod mi dod r la la la
   r sol sol sol r sol sol sol
   r dod dod dod r la la la\mbreak
   
   %7
   r re re re r re re fad
   sol sol fad fad sol re mi mi
   la, la la la sol si do la
   
   %10
   si16 re do si la fad sol la re, re' do si la fad sol la
   re,8 si' si si mi,2
   re'8 re re re re2
   
   %13
   mi8 mi mi mi mi2
   re8 re re re re dod re4~\mbreak
   re dod re8\p la'16 sol fad8 mi
   
   %16
   r re sol, dod r si mi, la\f
   sol fad mi4 re8 [re re8. dod16]
   re2. r8 r
   
   %19
   fad16 sol la sol fad8 mi fad re r re'
   re[re re8. dod16] re8 la r la
   re re re re sol,4 la
   
   %22
   r8 sol re si' r la la la\mbreak
   r sol mi sol r mi mi mi
   r la si si r sol la fad
   
   %25
   sol4 r la8 la la la
   la4 r re8 re re si
   r sol sol sol r la la la
   
   %28
   r la la la r si si si
   r si si si r re re re
   r re\p re re r sol sol fad
   
   %31
   r mi mi re\mbreak r do do si
   r la'\f re, mi si la la4
   sol8 re' re re r sol, sol sol
   
   %34
   r sol sol sol r fad la fad
   re sol si[re] mi16 re do si la4
   sol8[sol sol8. fad16] sol4.

}

IbcIn = \relative do {
   
   r8 
   sol'8 sol, sol sol' do do, do sol'
   la sol fad re sol sol, si re
   sol16 fad  sol la si la si sol fad re' do re fad, re' do re 
   
   %4
   mi, sol fad sol la, la' sol la\mbreak re, do re mi fad mi fad re
   si4. sol'8 do16 re mi re do re si do
   la4. la8 re16 mi fad mi re mi do re
   
   %7
   si8 la si sol fad re' fad, re'
   sol, sol, la la' si si, do do'\mbreak
   re re, fad re sol mi do re
   
   %10
   sol sol, re' do si do re do
   si sol' sol, sol' la16 si dod si la si sol la
   fad re' do re fad, re' do re sol, re' do re si do la si\mbreak
   
   %13
   sol mi' re mi sol, mi' re mi la, dod si dod la si sol la
   fad re' do? re fad, re' do re sol, fad sol la si dod! re fad,
   sol fad sol mi la sol la la, re\parenthesize \p mi fad mi re8 dod
   
   %16
   si16 dod re dod si8 la sol16 la si la sol8 fad\f\mbreak
   mi8 re la' la' si sol la la,
   re2. r8 r
   
   %19
   re' re, re dod' si si, si fad'
   sol mi la la, re16 mi fad mi re8 do
   si sol' si, sol' mi4 fad\mbreak
   
   %22
   sol8 sol, si sol re'4 red
   mi8 mi sol mi la4 sol
   fad mi si'8 do la si
   
   %25
   mi,16 fad sol fad mi fad re mi dod4. la8\mbreak
   re16 mi fad mi re mi do re si sol' fad sol si, sol' fad sol
   do, sol' fa sol mi fa re mi dod la' sol la dod, la' sol la
   
   %28
   re, la' sol la fad sol mi fad red si' la si red, si' la si
   mi, si' la si mi, do' si do fad, re' do re fad, re' do re
   sol, la si la sol8 fad\mbreak mi16 fad sol fad mi8 re
   
   %31
   do16 re mi re do8 si la16 si do si la8 sol\f
   re' do si do re do re re,
   sol sol' si sol do, do' si sol
   
   %34
   do do, si si' la la fad re
   sol16 la si la sol8 si do do, re re
   mi do re re, sol4.

}

IvlIIIn = \relative do'' {
   
   re8
   sol16 la si la sol8 re mi16 fad sol fad mi8 si
   do16 re si do la re do re si4 sol
   si'8 sol sol, si' la fad \once\stemUp re, la''
   
   %4
   sol mi \once\stemUp dod, sol''\mbreak fad4 re
   re4. re8 mi2
   mi4. mi8\mbreak fad4. fad8
   
   %7
   sol4. sol8 la4. la8
   si16 do la si do re si do re8 do16 si la si sol la
   fad8 la do, do si sol' la, fad'
   
   %10
   sol4 fad sol fad
   sol8 sol mi si dod2
   la'8 fad re la si2
   
   %13
   si'8 sol mi si dod2\mbreak
   la'8 fad re la' si la sol fad
   mi4. re8 re4 r
   
   %16
   r2 r4 r8 re\f\mbreak
   dod[re re8. dod16] re8 si mi,4
   re2. r8 la'
   
   %19
   re16 mi fad mi re8 la re16 mi fad mi re8 la
   mi'16 fad sol fad mi la sol la fad4. re8
   sol sol sol sol do,4 la'~
   
   %22
   la sol2 fad4~
   fad mi r8 do si mi 
   r la, sol sol r mi' fad, red'
   
   %25
   mi2 mi8 dod dod mi
   fad4. re8 sol re sol, re'
   mi2 la8 mi la, mi'
   
   %28
   fad2 si8 fad si, fad'\mbreak
   sol2 la8 fad re la'
   si4 r r2
   
   %31
   r r4 r8 sol\f 
   la re, sol4. la16 sol fad8. sol16
   sol8 sol sol re r mi re si
   
   %34
   r mi re si r do do do
   si re sol4~sol16 si la sol fad sol mi fad
   sol8 mi la,8. sol16 sol4.
   
}

Ivlan = \relative do' {
   
   r8 
   si'8 si si si sol sol sol sol
   mi mi fad fad re2
   r8 si' si si r la la la
   
   %4
   r mi mi mi r fad fad fad
   r si si si r mi, mi mi
   r mi mi mi r re re re\mbreak
   
   %7
   r sol sol sol r la la la
   r si la do sol sol mi la
   la fad re re re mi mi re
   
   %10
   re4 re8 la si mi fad la,
   si si sol \once\stemDown si' la2
   la8 la la la sol2
   
   %13
   sol8 si si si la2
   fad8 la la do\mbreak si mi, re la'
   si si la la fad4 r
   
   %16
   r2 r4 r8 la,\f 
   mi' fad la mi r si' la la
   la2. r8 r
   
   %19
   la8 la la la fad re fad la
   si sol la la la4 r8 la
   si si si si si si la re,\mbreak
   
   %22
   r re re re r re fad fad
   r mi mi mi r la si si
   r fad sol mi r mi fad si,
   
   %25
   si4 r mi8 mi mi mi
   re4 r si'8 si si sol
   r mi mi mi r dod mi dod
   
   %28
   r re fad la r red, fad fad
   r sol sol sol\mbreak r la la la
   sol4 r r2
   
   %31
   r r4 r8 re\f 
   re re re sol, r mi' re re
   re re sol sol r do, re re
   
   %34
   r do re re r la' la la
   sol re re re sol, mi' re fad
   mi mi re re re4 r8

}

IbcIIn = \relative do {
   
   r8 
   sol'8 sol, sol sol' do do, do sol'
   la sol fad re sol sol, si re
   sol8 sol, r sol' fad fad, r fad'
   
   %7
   mi4 la, re4. re8
   si4. sol'8 do4. si8
   la4. la8 re4. do8
   
   %7
   si8 la si sol fad4. re8\mbreak
   sol sol, la4  si do
   re8 re fad re sol mi do re
   
   %10
   sol,4 re'8 do si do re do
   si sol sol sol' la4. sol8
   fad fad fad fad sol sol si la
   
   %13
   sol sol sol sol la4. sol8
   fad fad fad fad sol la si fad
   sol mi la la, re4 r\mbreak
   
   %16
   r2 r4 r8 fad,\f\mbreak
   mi8 re la' la' si sol la la,
   re2. r8 r
   
   %19
   re' re, re dod' si si, si fad'
   sol mi la la, re4. do8
   si sol r sol' mi4 fad\mbreak
   
   %22
   sol8 sol, si sol re'4 red
   mi8 mi sol mi la4 sol
   fad mi si8 do la si
   
   %25
   mi4. re8 dod4. la8
   re4. do8 si si si si
   do4 r dod8 dod dod dod
   
   %28
   re4 r red8 red red red
   mi4. mi8 fad4. fad8
   sol4 r r2
   
   %31
   r r4 r8 sol,\f
   re' do si do re do re re,
   sol sol' si sol do, do' si sol
   
   %34
   do do, si si' la la fad re
   sol4. si8 do do, re re
   mi do re re, sol4.
 
}

IbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s8
   s1
   s4 <6 5-> s2
   s <6>4 <6>
   <7> <7 _+> s <6>
   <6>1
   <_+>
   <6>4 <6> <6> <6>
   s <6> <6> <6 5>
   s <6 5-> s <6 5>
   s2 <6>
   <6>4 <6 5> <_+>2
   <6>4 <6> s2
   <6>4 <6> <_+>2
   <6>4 <6> s2
   <6 5>4 <_+> s s8 <6>
   <6>4 <6>8 <6 _+> <6>4 s8 <6>
   <6+>4 <4>8 <3+> s <6 5> <4> <3+>
   s1
   s4 s8 <6>
   <5>4 s8 <6>
   <6 5>4 <4>8 <3+> s2
   <6>4 <6> 8 s \bassFigureExtendersOn <6 5>8 <5>\bassFigureExtendersOff <5->4
   <9> <6> <4> <5- 3>
   <9> <6> s <6>
   <6+> s <7 _+> <6 5>8 <_+>
   s2 <6>
   s <6>4 <6 5->
   s2 <6>4 <6 5->
   s2 <6>4 <6 5->
   s <6> <6> <6 5->
   s s8 <6> <6>4 s8 <6>
   <6>4 s8 <6> <6>4 <6>
   s <6> <4> <3>
   s <6> s <6>
   s <6> s <6 5->
   s s8 <6> <6 5>2
   s8 <6 5> <4> <3>
   
}

IbfIIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s8
   s1
   s4 <6 5-> s2
   s <6>4 s8 <6>
   <7>4 <7 _+> s2
   <6>1
   <_+>
   <6>4 <6> <6> s
   s <6> <6> <6 5>
   s <5-> s <6 5>
   s2 <6>
   <6>4 <6 5> <_+>2
   <6>4 s s2
   <6>4 s <_+>2
   <6>4 s2 s8 <6>
   <6 5>4 <_+> s2
   s2 s4 s8 <6>
   <6+>4 <4>8 <3+> s s <4> <3+>
   s1
   s4 s8 <6>
   <5>4 s8 <6>
   <6 5>4 <4>8 <3+> s2
   <6>4 s4 <6 5> <5->4
   <9> <6> <4> <5- 3>
   <9> <6> s <6>
   <6+> s <7 _+> <6 5>8 <_+>
   s2 <6>
   s <6>4 <6 5->
   s2 <6>4 <6 5>
   s2 <6>4 <6 5->
   s4 <6> <6> <6 5->
   s1
   s1
   s4 <6> <6 4> <3>
   s s s <6>
   s <6> s <6 5->
   s s8 <6> <6 5>2
   s8 <6 5> <4> <3>

}


forma = {

   \key sol\major
   \time 4/4
   \tempo 2 = 55
   \partial 8 s8
   s1*17
   s2. s8
   \bar":..:"\break
   s8
   s1*17
   s2. s8
   \bar ":|."

}


IvlI = {
   \notypeset
   <<\IvlIn \forma>>

}

IvlII = {
   <<\IvlIIn \forma>>

}

IbcI = {
   \clef bass
   <<\IbcIn \forma \IbfIn>>

}

IvlIII = {
   <<\IvlIIIn \forma>>

}


Ivla = {
   \clef alto
   <<\Ivlan \forma>>

}


IbcII = {
   \clef bass
   << \IbcIIn \forma \IbfIIn >>
   \typeset

}


IIvlIn = \relative do'' { 
   
   r8 sol sol sol fad fa fa fa
   mi mi la sol fad? sol sol fad
   sol si si si la la la la
   
   %4
   sol sol sol sol fad fad' fad fad
   sol la la la fad fad sol sol
   sol sol fad fad fad fad mi mi
   
   %7
   mi mi re re re re do do\mbreak
   do do si si si si la la
   la la sol sol fad fad fad fad
   
   %10
   sold sold la la la la sol? sol
   sol sol fad fad mi mi mi mi
   mi mi mi mi fad4 r
   
   %13
   r8 la' la la la sold sol sol\mbreak
   sol sol fa fa mi mi\parenthesize \f mi mi
   fad fad sol sol sol sol fad fad
   
   %16
   fad fad mi mi mi mi re re
   re re do do do\p\startTrillSpan do si si\stopTrillSpan
   la\startTrillSpan la si si\stopTrillSpan do\startTrillSpan do si si\stopTrillSpan
   
   %19
   la\startTrillSpan la sib sib\stopTrillSpan la\startTrillSpan la la la\stopTrillSpan
   si?4 r la\pp r
   sol r sol r
   
   %22
   fad1\fermata

}

IIvlIIn = \relative do'' {
   
   r2 r8 re re re
   re dod do do do si la re
   si sol mi'4~\mbreak mi8 re re re
   
   %4
   re re dod dod re  la la la
   mi' mi mi mi re re re si
   la la la la sol sol sol sol
   
   %7
   fad fad fad fad mi mi mi mi
   fad fad fad fad mi mi mi mi
   red red mi mi mi mi re? re
   
   %10
   re re do do\mbreak si si si si
   dod dod re re si dod re re
   re re dod dod re4 r
   
   %13
   r2 r8 re' re re
   dod dod re re re re\parenthesize \f do? do
   do do si si la la la la
   
   %16
   si si si si la la la la
   sol sol sol sol fad\p\startTrillSpan fad sol sol\stopTrillSpan\mbreak
   fad\startTrillSpan fad sol sol\stopTrillSpan la\startTrillSpan la sol sol\stopTrillSpan
   
   %19
   fad\startTrillSpan fad sol sol\stopTrillSpan sol \startTrillSpan sol fad fad\stopTrillSpan
   sol4 r re r
   re r dod r
   
   %22
   re1\fermata
   
}

IIbcIn = \relative do { \override TrillSpanner.bound-details.left.text = #'()
   
   R1*2
   r8 sol' sol sol fad fa fa fa
   mi mi la la re, re re' re 
   
   %5
   re dod do do do do si sol
   re re red red mi mi sol mi
   si' si si la sold sold la la\mbreak
   
   %8
   red, red re re dod dod do do 
   si si lad lad si si si si
   mi mi fa fa re re mi mi
   
   %11
   la, la re re sol, la si la
   sold sold la la re re' re re
   dod do do do si si mi, mi\mbreak
   
   %14
   la la sold sold la la\parenthesize \f la la
   re, re mi mi do do re re
   sol, sol do do fad, fad si si
   
   %17
   mi, mi la la re\p\startTrillSpan re re re\stopTrillSpan
   re\startTrillSpan re re re\stopTrillSpan re\startTrillSpan re re re\stopTrillSpan
   re\startTrillSpan re dod dod\stopTrillSpan re\startTrillSpan re re re\stopTrillSpan\mbreak
   
   %20
   sol,4 r fad \pp r
   mi r la r
   re,1\fermata

}

IIvlIIIn = \relative do'' {
    \override TrillSpanner.bound-details.left.text = #'()
   
   R1*2
   r8 si si si la la la la
   
   %4
   sol sol sol sol fad fad' fad fad
   sol la la la fad fad sol sol
   sol sol fad fad fad fad mi mi
   
   %7
   mi mi re re re re do do\mbreak
   do do si si si si la la
   la la sol sol fad fad fad fad
   
   %10
   sold sold la la la la sol? sol
   sol sol fad fad mi mi mi mi
   mi mi mi mi fad4 r
   
   %13
   R1
   r2 r8 mi'\parenthesize \f mi mi
   fad fad sol sol sol sol fad fad
   
   %16
   fad fad mi mi mi mi re re
   re re do do do\p\startTrillSpan do si si\stopTrillSpan
   la\startTrillSpan la si si \stopTrillSpan do\startTrillSpan do si si\stopTrillSpan
   
   %19
   la\startTrillSpan la sib sib\stopTrillSpan la\startTrillSpan la la la\stopTrillSpan
   si?4 r la\pp r
   sol r sol r
   
   %22
   fad1\fermata

}

IIvlan = \relative do' {
    \override TrillSpanner.bound-details.left.text = #'()
   
   R1*2
   r8 re sol sol la fa re la'
   si si la mi fad? la fad la
   
   %5
   si mi, la mi la la re, re
   re la si si si si si si
   si fad' si, si si si do la
   
   %8
   la la fad si sol mi la mi
   fad fad dod' dod\mbreak si si re si
   si si la la fa fa mi mi
   
   %11
   mi mi re re' re dod si mi
   si si la la la4 r
   R1
   
   %14
   r2 r8 mi'\parenthesize \f la la
   la la sol mi mi mi fad re
   re re mi do do do re si
   
   %17
   si si do la\mbreak la\p\startTrillSpan la re re\stopTrillSpan
   la\startTrillSpan la sol sol'\stopTrillSpan fad \startTrillSpan fad re re\stopTrillSpan
   re\startTrillSpan fad mi mi\stopTrillSpan re\startTrillSpan la la re\stopTrillSpan
   
   %20
   re4 r re,\pp r
   mi r la r
   la1\fermata
   
}

IIbcIIn = \relative do {
    \override TrillSpanner.bound-details.left.text = #'()
   
   R1*2
   r8 sol' sol sol fad fa fa fa
   mi mi la la re, re re' re 
   
   %5
   re dod do do do do si sol
   re re red red mi mi sol mi
   si' si si la sold sold la la\mbreak
   
   %8
   red, red re re dod dod do do 
   si si lad lad si si si si
   mi mi fa fa re re mi mi
   
   %11
   la, la re re sol, la si la
   sold sold la la re4 r
   R1
   
   %14
   r2 r8 la'\f la la
   re, re mi mi do do re re
   sol, sol do do fad, fad si si
   
   %17
   mi, mi la la re\p\startTrillSpan re re re\stopTrillSpan
   re\startTrillSpan re re re\stopTrillSpan re\startTrillSpan re re re\stopTrillSpan
   re\startTrillSpan re dod dod\stopTrillSpan re\startTrillSpan re re re\stopTrillSpan\mbreak
   
   %20
   sol,4 r fad \pp r
   mi r la r
   re,1\fermata

}

IIbfIn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown
	
	s1*2
	s4 <6> <7>8 <6> s4
	<7> <7 _+> s2
	<4 2>8 <6> <6>4 <4+ 2> <6>
	<4> <5- 3> <9> <6>
	<4> <3-> <6 5->2
	<7->4 <6> <7> <6>
	<7 _+> <7- 5-> <4> <3->
	<7 _+> <5> <6 5 _-> <_->
	<7 _+>2 <6 5>
	<6 5->4 <_+> s2
	<6>4 <6> <7>8 <6+> <7 _->4
	<7 _+> <7- 5-> <4> <3->
	<7> <5> <6 5>2
	<7>4 <7> <7> <7>
	<7> <7> <7> <6 4>
	<5 > <6 4> <7 5> <6 4>
	<5> <7- 5-> <4> <3>
	s2 <6>
	<7> <7 _+>

}

IIbfIIn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown
	
	s1*2
	s4 <6> <7>8 <6> s4
	<7> <7 _+> s2
	<4 2>8 <6> s4 <4+ 2> <6>
	<4> <5- 3> <9> <6>
	<4> <3-> <6 5->2
	<7->4 <6> <7> <6>
	<7 _+> <7- 5-> <4> <3->
	<7 _+> s <6 5 _-> <_->
	<7 _+>2 <6 5>
	<6 5->4 <_+> s2
	s1
	s2 s8 <4> <3->4
	<7>2 <6 5>2
	<7>4 <7> <7> <7>
	<7> <7> <7> <6 4>
	<5 > <6 4> <7 5> <6 4>
	s <7- 5-> <4> <3>
	s2 <6>
	<7> <7 _+>

}


forma = {

\key sol\major
\time 4/4
\tempo 4 = 40
s1*22
\bar "|."

}


IIvlI = {
	\notypeset
	<<\IIvlIn \forma>>

}

IIvlII = {
	<<\IIvlIIn \forma>>

}

IIbcI = {
	\clef bass
	<<\IIbcIn \forma \IIbfIn>>

}

IIvlIII = {
	<<\IIvlIIIn \forma>>

}


IIvla = {
	\clef alto
	<<\IIvlan \forma>>

}


IIbcII = {
	\clef bass
	<< \IIbcIIn \forma \IIbfIIn >>
	\typeset

}

IIIvlIn = \relative do'' {
   
   r4 re re re
   mi re mi fad
   sol re sol2~
   
   %4
   sol fa
   mi2. la4
   fad re sol2~
   
   %7
   sol fad
   mi1
   re2 re'~
   
   %10
   re do~
   do4 re si sol
   la2. la4
   
   %13
   sol fad sol la
   fad re sol2~
   sol fad
   
   %16
   sol4 sol, sol sol
   si la si dod\mbreak
   re la re2~
   
   %19
   re do
   si mi~
   mi re
   
   %22
   do1
   si2. si'4
   la1
   
   %25
   sol
   fad
   mi2. mi4
   
   %28
   re dod re si
   dod la la la
   si la si dod
   
   %31
   re la re2~
   re do?
   si sol'~
   
   %34
   sol fa
   mi la~
   la sol
   
   %37
   fad4 re sol2~
   sol4 mi la2~
   la4 fad si2~
   
   %40
   si4 sol do2~
   do4 la re do
   si la sol fad
   
   %43
   mi fad sol2~
   sol fad~
   fad mi~
   
   %46
   mi re~
   re do~
   do si
   
   %49
   la1
   sol\mbreak
   si'8 do si do re do re do
   
   %52
   si do si do re do re do
   si re si re si re si re 
   la re la re la re la re 
   
   %55
   sol, si sol si mi, la mi la
   fad sol fad sol la sol la sol
   fad sol fad sol la sol la sol 
   
   %58
   fad sol fad sol la fad sol la
   si si, si do\mbreak re si do re
   mi re mi fa mi sol fad sol
   
   %61
   re do re mi re sol fad sol
   do, si do re do la' sol la
   si, sol' fad sol si, sol' do, sol'
   
   %64
   re sol si, sol' do, sol' re sol
   mi la sol la dod, la' re, la'
   mi la dod, la' re, la' mi la
   
   %67
   fad re do? re\mbreak fad, re' sol, re'
   la re fad, re' sol, re' la re
   si sol si re si sol si mi
   
   %70
   la, fad la re la fad la re
   sol, mi sol do sol mi sol do
   fad,4 sol2 fad4
   
   %73
   sol re'\p  sol2~
   sol4 fad sol la
   fad fad fad\f fad
   
   %76
   sol fad sol la
   re,2. mi4
   dod la re2~
   
   %79
   re \mbreak dod
   re1
   red
   
   %82
   mi
   fad
   sol
   
   %85
   sold
   la
   si
   
   %88
   do~
   do2 do
   do si~
   
   %91
   si si
   si la~
   la la\mbreak
   
   %94
   la sol~
   sol4 sol fad mi
   red2 mi~
   
   %97
   mi re!~
   re4 mi do la
   si2. mi4
   
   %100
   dod2 re~
   re4 mi do2~
   do4 re si2~
   
   %103
   si4 do la2~
   la4 si sol2~
   sol fad
   
   %106
   mi1
   r4 re re re
   mi re mi fad\mbreak
   
   %109
   sol re sol2~
   sol4 fad fad fad
   si1~
   
   %112
   si4 la la la
   re1~
   re4 do do do
   
   %115
   do2 si
   la re~
   re do~
   
   %118
   do si~
   si la4 sol
   fad re sol2~
   
   %121
   sol fad
   sol1\fermata
   
}

IIIvlIIn = \relative do'' {
   
   R1*2
   r4 sol sol sol
   la sol la si
   
   %5
   do sol do2~
   do si
   la re~
   
   %8
   re dod
   re4 fad fad fad
   sol fad sol la\mbreak
   
   %11
   re,2. mi4
   dod la re2~
   re do?~
   
   %14
   do si
   la1
   sol2 r4 re'
   
   %17
   sol fad sol la
   fad2. fad4
   mi2 la~
   
   %20
   la sol
   fad si~
   si la~
   
   %23
   la sol~
   sol fad~
   fad mi~
   
   %26
   mi red
   mi4 mi, mi mi
   fad mi fad sold\mbreak
   
   %29
   la2. la'4
   sol fad sol la
   fad fad, fad fad
   
   %32
   sol fad sol la
   re, si' si si
   do si do re
   
   %35
   sol, dod dod dod
   re dod re mi
   la,2 re4 si
   
   %38
   mi2. mi4
   fad2. fad4 
   sol2. mi4 
   
   %41
   la2. fad4
   re do si la
   sol la si re
   
   %44
   do1\mbreak
   si 
   la
   
   %47
   sol2. la4
   fad re sol2~
   sol fad
   
   %50
   sol1
   sol'8 la sol la si la si la
   sol la sol la si la si la
   
   %53
   sol si sol si sol si sol si
   fad la fad la fad la fad re
   re2 dod
   
   %56
   re8 mi re mi fad mi fad mi
   re mi re mi\mbreak fad mi fad mi
   re mi re mi fad re mi fad
   
   %59
   sol sol, sol la si sol la si
   do4 sol sol sol
   r sol sol sol
   
   %62
   sol sol fad fad
   sol r sol sol
   sol sol sol sol
   
   %65
   sol r la la
   la la la la
   la r re, re\mbreak
   
   %68
   re re re re
   re2 r4 mi'
   mi re r re
   
   %71
   re do r do
   do si la2
   r4 sol\p sol sol
   
   %74
   si la si dod
   re la re2\f ~
   re do~
   
   %77
   do si
   la1
   sol
   
   %80
   fad
   fad'
   si,
   
   %83
   si2 red\mbreak
   mi mi,
   si'1
   
   %86
   mi
   mi2 sold
   la mi
   
   %89
   re1~
   re
   do~
   
   %92
   do
   si~
   si
   
   %95
   do2 la'~
   la4 si sol mi
   fad2. si4
   
   %98
   sold2 la~
   la sol~
   sol4 la fad re
   
   %101
   mi2. fad4
   re2. mi4
   do2. re4
   
   %104
   si2. si4\mbreak
   dod,2 la4 la'
   sol2. la4
   
   %107
   fad re re'2~
   re do
   si1
   
   %110
   la~
   la4 sol sol sol
   do1~
   
   %113
   do4 si si si
   mi2. la4
   fad2 sol~
   
   %116
   sol4 fad fad fad
   sol fad sol la
   re,2. re4
   
   %119
   mi sol, do2~
   do si
   la1
   
   %122
   sol\fermata
   
}

IIIbcIn = \relative do {
   
   R1*8
   r4 re re re
   mi re mi fad
   
   %11
   sol re sol2~
   sol fad
   mi la
   
   %14
   re, mi
   do re
   sol, r
   
   %17
   R1\mbreak
   r4 re' re re
   la' la, do la
   
   %20
   mi' mi sol mi
   si' si, re si
   mi mi fad re
   
   %23
   sol sol, si sol
   re' re fad red
   mi mi sol mi
   
   %26
   la fad si si,
   mi2 do
   si2. mi4
   
   %29
   la,2 fad'
   mi2. la,4
   re, re' re re
   
   %32
   mi re mi fad
   sol sol sol sol\mbreak
   la sol la si
   
   %35
   do la la la
   si la si dod
   re re si sol
   
   %38
   do si do la
   re do re re,
   mi re mi do
   
   %41
   fad mi fad re
   sol2 si
   do si
   
   %44
   la1 
   sol
   fad 
   
   %47
   mi
   re2 mi
   do re
   
   %50
   sol,1\mbreak
   r4 sol' sol sol,
   r sol' sol sol,
   
   %53
   r sol' sol sol,
   r re'' re re,
   mi sol la la,
   
   %56
   r re' re re,
   r re' re re,
   r re' re re,
   
   %59
   r sol\mbreak sol sol,
   r do' do do,
   si si' si si,
   
   %62
   la la re re,
   sol r sol' la
   si sol la si
   
   %65
   do r la si
   dod la si dod
   re r\mbreak re, mi
   
   %68
   fad re mi fad
   sol sol, r sol'
   fad fad, r fad'
   
   %71
   mi mi, r mi'
   re sol, re2
   sol r
   
   %74
   R1
   r4 re'\parenthesize \f re re
   mi re mi fad
   
   %77
   sol sol, sol'2~
   sol fad
   mi\mbreak la,
   
   %80
   re4 re' re do
   si si si la
   sol sol fad mi
   
   %83
   red si' la si
   mi, fad sol fad
   mi mi' mi re
   
   %86
   do do si la
   sold mi re mi
   la, la' la sol
   
   %89
   fad mi fad re
   sol, sol' sol fad
   mi re mi do
   
   %92
   fad, fad' fad mi
   red dod red si\mbreak
   mi fad sol mi
   
   %95
   la1
   si2 mi,
   si1
   
   %98
   mi2 fa
   re mi
   la si
   
   %101
   sol la
   fad sol
   mi fad
   
   %104
   sol4 sol, si sol
   la2 re~
   re dod
   
   %107
   re1
   la\mbreak
   r4 sol si sol
   
   %110
   re'1
   sol,
   la
   
   %113
   si
   do
   re2 sol,
   
   %116
   re4 re' re re
   mi re mi fad
   sol sol, sol sol
   
   %119
   do2. do4
   re1~
   re
   
   %122
   sol,\fermata
  
}

IIIvlIIIn = \relative do'' {
   
   R1*10
   r4 re' si sol
   la2. la4
   
   %13
   sol fad sol la
   fad re sol2~
   sol fad
   
   %16
   sol2 r
   R1
   r4 la, re2~
   
   %19
   re do
   si mi~
   mi re
   
   %22
   do1
   si2. si'4
   la1
   
   %25
   sol
   fad
   mi2. mi4
   
   %28
   re dod re si
   dod la la la
   si la si dod
   
   %31
   re la re2~
   re do?
   si sol'~
   
   %34
   sol fa
   mi la~
   la sol
   
   %37
   fad4 re sol2~
   sol4 mi la2~
   la4 fad si2~
   
   %40
   si4 sol do2~
   do4 la re do
   si la sol fad
   
   %43
   mi fad sol2~
   sol fad~
   fad mi~
   
   %46
   mi re~
   re do~
   do si
   
   %49
   la1
   sol\mbreak
   R1*26
   
   %77
   r2 re'4\f mi
   dod la re2~
   
   %79
   re \mbreak dod
   re1
   red
   
   %82
   mi
   fad
   sol
   
   %85
   sold
   la
   si
   
   %88
   do~
   do2 do
   do si~
   
   %91
   si si
   si la~
   la la\mbreak
   
   %94
   la sol~
   sol4 sol fad mi
   red2 mi~
   
   %97
   mi re!~
   re4 mi do la
   si2. mi4
   
   %100
   dod2 re~
   re4 mi do2~
   do4 re si2~
   
   %103
   si4 do la2~
   la4 si sol2~
   sol fad
   
   %106
   mi1
   r4 re re re
   mi re mi fad\mbreak
   
   %109
   sol re sol2~
   sol4 fad fad fad
   si1~
   
   %112
   si4 la la la
   re1~
   re4 do do do
   
   %115
   do2 si
   la re~
   re do~
   
   %118
   do si~
   si la4 sol
   fad re sol2~
   
   %121
   sol fad
   sol1\fermata

}

IIIvlan = \relative do' {
   
   R1*10
   r4 si' si si
   mi,2 re4 fad
   
   %13
   sol2 mi4 la
   la2 sol
   mi re
   
   %16
   re r
   R1
   r4 fad la la
   
   %19
   la2 mi4 la
   si1
   si2 fad
   
   %22
   sol4 sol la fad
   re2 sol
   la red,4 fad
   
   %25
   si,2 si'
   do si\mbreak
   si la
   
   %28
   la si4 mi,
   mi2 re
   re2. mi4
   
   %31
   fad la la la 
   mi fad mi re
   re2. si'4
   
   %34
   la si la sol
   sol la mi mi
   re mi re la'
   
   %37
   la2 si
   sol mi4 la
   la2 fad4 re
   
   %40
   si2 sol'4 la~
   la fad re2\mbreak
   re re
   
   %43
   mi4 do re2
   mi do
   re si
   
   %46
   do la
   si sol'4 mi
   la2 sol
   
   %49
   mi re
   re1
   R1*26
   
   %77
   r4 sol\f si sol
   mi2 re
   mi1
   
   %80
   re2 fad~
   fad4 fad red fad
   sol si la sol
   
   %83
   fad2. si4\mbreak
   si la si la
   sold2 mi
   
   %86
   mi4 mi re do
   si2 si'
   la4 mi mi sol
   
   %89
   la sol la fad
   re1
   sol4 fad sol mi
   
   %92
   do1
   fad4 mi fad red
   si2 mi
   
   %95
   la, do'
   si1
   si
   
   %98
   si2 la
   fa mi
   mi re
   
   %101
   si' la\mbreak
   la sol
   sol fad
   
   %104
   re2. sol4
   mi2 re
   si mi
   
   %107
   la,1
   la
   r2 re
   
   %110
   re1
   re
   do2 mi
   
   %113
   re fad
   mi sol4 do
   la2 sol4 re
   
   %116
   re2 la'4 re
   si2 sol4 re
   re2 sol\parentSlur (
   
   %119
   sol) mi
   re1~
   re
   
   %122
   re\fermata

}

IIIbcIIn = \relative do {
   
   R1*10
   
   %11
   r2 sol'~
   sol fad
   mi la
   
   %14
   re, mi
   do re
   sol, r
   
   %17
   R1\mbreak
   r4 re' re re
   la' la, do la
   
   %20
   mi' mi sol mi
   si' si, re si
   mi mi fad re
   
   %23
   sol sol, si sol
   re' re fad red
   mi mi sol mi
   
   %26
   la fad si si,
   mi2 do
   si2. mi4
   
   %29
   la,2 fad'
   mi2. la,4
   re, re' re re
   
   %32
   mi re mi fad
   sol sol sol sol\mbreak
   la sol la si
   
   %35
   do la la la
   si la si dod
   re re si sol
   
   %38
   do si do la
   re do re re,
   mi re mi do
   
   %41
   fad mi fad re
   sol2 si
   do si
   
   %44
   la1 
   sol
   fad 
   
   %47
   mi
   re2 mi
   do re
   
   %50
   sol,1\mbreak
   R1*26
   
   %77
   r2 sol'2\parenthesize \f~
   sol fad
   mi\mbreak la,
   
   %80
   re4 re' re do
   si si si la
   sol sol fad mi
   
   %83
   red si' la si
   mi, fad sol fad
   mi mi' mi re
   
   %86
   do do si la
   sold mi re mi
   la, la' la sol
   
   %89
   fad mi fad re
   sol, sol' sol fad
   mi re mi do
   
   %92
   fad, fad' fad mi
   red dod red si\mbreak
   mi fad sol mi
   
   %95
   la1
   si2 mi,
   si1
   
   %98
   mi2 fa
   re mi
   la si
   
   %101
   sol la
   fad sol
   mi fad
   
   %104
   sol4 sol, si sol
   la2 re~
   re dod
   
   %107
   re1
   la\mbreak
   r4 sol si sol
   
   %110
   re'1
   sol,
   la
   
   %113
   si
   do
   re2 sol,
   
   %116
   re4 re' re re
   mi re mi fad
   sol sol, sol sol
   
   %119
   do2. do4
   re1~
   re
   
   %122
   sol,\fermata

}

IIIbfIn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown
	
	s1*9
	<7>2 <6>
	<4> <3>
	<4+ 2> <6>
	<7> <7 _-> 
	<7> <5>
	<6 5> s
	s1*3
	<4>2 <6>
	<4> <6>
	<4> <6>
	<6 5> <5->
	<9> <6>
	<4> <6+>
	<9> <6>
	<6 5> <_+>
	s <6>
	<7>2. <_+>4
	<_+>2 <6>
	<7> 2. <_+>4
	s1
	<7>2 <6>
	s s
	<7> <6->
	s4 <_+> s2
	<7> <6>
	s <6>
	<5> <6>
	<5> <6>
	<5> <6>
	<5-> <6 5->
	s <6>
	s <6>
	<7> <6>
	<7> <6> 
	<7> <6>
	<7> <6>
	<7> s
	<6 5> s
	s1*5
	<7>2 <7 _+>
	s1*5
	<6>2 s4 <6>
	<7>2 <7>
	s1
	<6>2 s4 <5 ->
	s2 <_+>
	<6> s4 <5->
	s1
	<6>2 s4 <5->
	s2 s4 <6>
	<7> <6> s <6>
	<7> <6> s <6>
	<7> s <4> <3>
	s1*3
	<7>2 <6>
	<4> <3>
	<4+ 2> <6>
	<7> <7 _+>
	s1
	<_+>
	<6>
	<6>2 <4+>
	<_->1
	<_+>
	<6>
	<6>2 <6 4+>
	s1
	<6 5->
	<4>2 <3>
	<6 5>1
	<5- 4>2 <3>
	<6 5->1
	<4>2 <6>
	<7> <6>
	<7 _+> s
	<4> <3->
	<7 _+> <5>
	<6 5 _-> <_->
	<7 _+> s
	<6 5> <_->
	<6 5-> s
	<6 5> <5->
	<9> <6>
	<7 _+> s
	<4 2> <5->
	s1
	<4>2 <3->
	s1
	<4>2 <3>
	<9> <8>
	<9> <8>
	<9> <8>
	<9> <8>
	<7>2 s
	<4> <3>
	<7> <6>
	<4> <3>
	<7> <6>
	<7 5> <6 4>
	<5 4> <3>
	
}

IIIbfIIn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown
	
	s1*11
	<4+ 2>2 <6>
	<7> <7 _-> 
	<7> <5>
	<6 5> s
	s1*3
	<4>2 <6>
	<4> <6>
	<4> <6>
	<6 5> <5->
	<9> <6>
	<4> <6+>
	<9> <6>
	<6 5> <_+>
	s <6>
	<7>2. <_+>4
	<_+>2 <6>
	<7> 2. <_+>4
	s1
	<7>2 <6>
	s s
	<7> <6->
	s4 <_+> s2
	<7> <6>
	s <6>
	<5> <6>
	<5> <6>
	<5> <6>
	<5-> <6 5->
	s <6>
	s <6>
	<7> <6>
	<7> <6> 
	<7> <6>
	<7> <6>
	<7> <5>
	<6 5> s
	s1*28
	<4+ 2>2 <6>
	<7> <7 _+>
	s1
	<_+>
	<6>
	<6>2 <4+>
	<_->1
	<_+>
	<6>
	<6>2 <6 4+>
	s1
	<6 5->
	<4>2 <3>
	<6 5>1
	<5- 4>2 <3>
	<6 5->1
	<4>2 s
	<7> <6>
	<7 _+> s
	<4> <3->
	<7 _+> <5>
	<6 5 _-> <_->
	<7 _+> s
	<6 5> <_->
	<6 5-> s
	<6 5> <5->
	<9> <6>
	<7 _+> s
	<4 2> <5->
	s1
	<4>2 <3->
	s1
	<4>2 <3>
	<9> <8>
	<9> <8>
	<9> <8>
	<9> <8>
	<7>2 s
	<4> <3>
	<7> <6>
	<4> <3>
	<7> <6>
	<7 5> <6 4>
	<5 4> <3>

}


forma = {

\key sol\major
\time 2/2
\tempo 1 = 55
s1*119 \once \override Score.RehearsalMark.extra-offset = #'(+5 . -2)
\mark\markup\italic "Adagio"
\tempo 2 = 30
s1*3
\bar "|."

}


IIIvlI = {
	\notypeset
	<<\IIIvlIn \forma>>

}

IIIvlII = {
	<<\IIIvlIIn \forma>>

}

IIIbcI = {
	\clef bass
	<<\IIIbcIn \forma \IIIbfIn>>

}

IIIvlIII = {
	<<\IIIvlIIIn \forma>>

}


IIIvla = {
	\clef alto
	<<\IIIvlan \forma>>

}


IIIbcII = {
	\clef bass
	<< \IIIbcIIn \forma \IIIbfIIn >>
	\typeset

}

IVvlIn = \relative do'' {
   
   sol8
   la4 re, r8 re'
   si4 sol r8 re'
   mi4 mi r8 la
   
   %4
   fad4 sol r8 re
   mi4 la, r8 si
   do4 re r8 mi
   
   %7
   si4 la2
   sol r8 si'\p 
   la4 sol4. sol8
   
   %10
   sol4 fad r8 la\f 
   si4 mi, r8 fad
   sol4 la r8 si
   
   %13
   fad4 mi2
   re r8 fa\p 
   sold,4 la4. si8\mbreak
   
   %16
   do8. si16 do4. mi8
   fad,4 sol4. la8
   si8. la16 si4. si8\f 
   
   %19
   si4 la r8 sol
   fad2 r8 sol\p  
   fad4 sol4. fad8
   
   %22
   mi4 mi4. fad8
   red2 mi4
   mi mi4. red8
   
   %25
   mi2 r8 mi'\f 
   mi4 re r8 do
   si4 sol r8 re'
   
   %28
   mi4 mi r8 la
   fad4 re r8 re\p\mbreak
   re4 do4. do8
   
   %31
   do4 si4. si8
   si4 la4. sol8
   fad4 re r8 re'\f 
   
   %34
   mi4 la, r8 si
   do4 re r8 mi
   si4 la2
   
   %37
   sol r8 re'\p 
   re4 do4. do8
   do4 si4. si8
   
   %40
   si4 la4. sol8
   fad4 re r8 re'\f 
   mi4 la, r8 si
   
   %43
   do4 re4. mi8
   si4 la2
   sol2.\fermata 

}

IVvlIIn = \relative do'' {
   
   si8
   do4 la r8 la
   re,2 r8 re'
   re4 dod r8 do
   
   %4
   do4 si r8 sol
   sol4 fad r8 fad
   sol4 sol r8 sol
   
   %7
   sol4 sol4. fad8
   sol2 r8 re'\p
   re4 re4. dod8
   
   %10
   re2 r8 re\f 
   re4 dod r8 dod
   re4 re r8 re
   
   %13
   re4 re4. dod8\mbreak
   re2 r8 la\p 
   mi4 mi4. sold8
   
   %16
   la4 mi4. la8
   re,4 re4. fad8
   sol4 re r8 sol\f 
   
   %19
   sol4 fad r8 mi
   mi4 red r8 si'\p 
   si4 si4. si8
   
   %22
   si4 la4. la8
   la2 sol4
   fad fad2
   
   %25
   mi r8 sol\f 
   la4 la r8 re,
   re2 r8 si'
   
   %28
   la4 la r8 dod
   re2 r8 fad,\p\mbreak
   sol4 la4. la8
   
   %31
   re,2~re8 re'
   re4 do4. si8
   la2 r8 sol\f 
   
   %34
   sol4 fad r8 fad
   sol4 sol r8 sol
   sol4 sol4. fad8
   
   %37
   sol2 r8 si\p 
   sol4 la4. la8
   re,2~re8 re' 
   
   %40
   re4 do4. si8
   la2 r8 sol\f 
   sol4 fad r8 fad
   
   %43
   sol4 sol r8 sol
   sol4 sol4. fad8\mbreak
   sol2.\fermata

}

IVbcIn = \relative do {
   
   sol'8
   sol4 fad r8 fad
   sol2 r8 si
   sol4 la r8 la,
   
   %4
   re4 mi r8 si
   do4 re r8 re
   mi4 si r8 do
   
   %7
   re4 re,2
   sol r8 sol'\p
   fad4 mi4. la,8
   
   %10
   re2 r8 fad\f
   sol4 la r8 la
   si4 fad r8 sol
   
   %13
   la4 la,2
   re r8 re\p
   re4 do4. si8\mbreak
   
   %16
   la2~la8 do
   do4 si4. la8
   sol2~sol8 sol\f
   
   %19
   la4 la r8 la
   si2 r8 mi\p
   red4 mi4. re8
   
   %22
   do4 do4. la8
   si2 do4
   la si2
   
   %25
   mi, r8 mi'\f
   fad4 fad r8 fad
   sol2 r8 si,
   
   %28
   do4 dod r8 la
   re2 r8 re\p \mbreak
   mi4 fad4. fad8
   
   %31
   sol2~sol8 si,
   do4 do4. do8
   re2 r8 si\f
   
   %34
   do4 re r8 re
   mi4 si r8 do
   re2 re,4
   
   %37
   sol2 r8 sol'\p
   mi4 fad4. fad8
   sol4 sol,4. si8
   
   %40
   do4 do4. do8
   re2 r8 si\f
   do4 re r8 re
   
   %43
   mi4 si r8 do
   re4 re,2
   sol2.\fermata
   
}

IVvlIIIn = \relative do'' {
   
   sol8
   la4 re, r8 re'
   si4 sol r8 re'
   mi4 mi r8 la
   
   %4
   fad4 sol r8 re
   mi4 la, r8 si
   do4 re r8 mi
   
   %7
   si4 la2
   sol r4 
   R2.
   
   %10
   r4 r r8 la'\f 
   si4 mi, r8 fad
   sol4 la r8 si
   
   %13
   fad4 mi2
   re r4 
   R2.*3
   r4 r r8 si8\f 
   
   %19
   si4 la r8 sol
   fad2 r4
   R2.*4
   
   %25
   r4 r r8 mi'\f 
   mi4 re r8 do
   si4 sol r8 re'
   
   %28
   mi4 mi r8 la
   fad4 re r
   R2.*3
   r4 r r8 re\f 
   
   %34
   mi4 la, r8 si
   do4 re r8 mi
   si4 la2
   
   %37
   sol r4
   R2.*3
   r4 r r8 re'\f 
   mi4 la, r8 si
   
   %43
   do4 re4. mi8
   si4 la2
   sol2.\fermata 

}

IVvlan = \relative do' {
   
   re8
   mi4 fad r8 re
   re4 si r8 si'
   si4 mi, r8 la
   
   %4
   la4 sol r8 si
   la4 la r8 re,
   do4 sol r8 mi'
   
   %7
   re4 re4. re8
   si2 r4
   R2.
   
   %10
   r4 r r8 la'\f 
   mi4 mi r8 la
   sol4 re r8 si'
   
   %13
   la4 la4. mi8
   fad2 r4
   R2.*3\mbreak
   
   %18
   r4 r r8 re\f 
   do4 do r8 do
   si2 r4
   
   %21
   R2.*4 
   r4 r r8 si'\f 
   la4 fad r8 la
   
   %27
   sol4 si r8 sol
   sol4 sol r8 mi
   re4 fad r
   
   %30
   R2.*3
   r4 r r8 si\f 
   la4 la r8 re,
   
   %35
   do4 sol r8 mi'
   re4 re4. la8
   si2 r4
   
   %38
   R2.*3
   r4 r r8 si'\f \mbreak
   la4 la r8 fad
   
   %43
   mi4 re r8 sol
   re4 re2
   re2.\fermata
   
}

IVbcIIn = \relative do {
   
   sol'8
   sol4 fad r8 fad
   sol2 r8 si
   sol4 la r8 la,
   
   %4
   re4 mi r8 si
   do4 re r8 re
   mi4 si r8 do
   
   %7
   re4 re,2
   sol r4
   R2.
   
   %10
   r4 r r8 fad'\f
   sol4 la r8 la
   si4 fad r8 sol
   
   %13
   la4 la,2
   re r4
   R2.*3
   r4 r r8 sol,\f
   
   %19
   la4 la r8 la
   si2 r4
   R2.*4
   
   %25
   r4 r r8 mi\f
   fad4 fad r8 fad
   sol2 r8 si,
   
   %28
   do4 dod r8 la
   re2 r4
   R2.*3
   r4 r r8 si\f
   
   %34
   do4 re r8 re
   mi4 si r8 do
   re2 re,4
   
   %37
   sol2 r4
   R2.*3
   r4 r r8 si\f
   do4 re r8 re
   
   %43
   mi4 si r8 do
   re4 re,2
   sol2.\fermata

}

IVbfIn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown
	
	s8
	<4 2>4 <6> s8 <6 5->
	s2.
	<6 5>4 <_+> s8 <_->
	<7>4 <5> s8 <6>
	<6 5>4 s s8 <6>
	<6>4 <6> s8 <6 5>
	<6 4>4 <4> <3>
	s2.
	<6>4 <7> s8 <7 _+>
	<4>4 <3> s8 <6>
	<6 5>4 <_+> s8 <6>
	<6>4 <6> s8 <6 5>
	<6 4>4 <4> <3+>
	s2 s8 <_->
	<4+ 2>4 <6> s8 <6+>
	s2 s8 <6>
	<4+ 2>4 <6> s8 <6>
	s2.
	<9 7>4 <8 6> s
	<4> <3+> s
	<6> s s8 <6>
	<7>4 <6> s
	<7 _+> s <5>
	<6 5> <4> <3+>
	s2.
	<7>4 <6> s8 <5->
	s2 s8 <6>
	<6 5>4 <6 5-> s8 <_+>
	s2.
	<7>4 <5-> s
	<4> <3> s8 <6>
	<9 7>4 <8 6> s
	s2 s8 <6>
	<6 5>4 s s8 <6>
	<6>4 <6> s
	<6 4> <5> <3>
	s2.
	<7>4 <5-> s
	<4> <3> s8 <6>
	<9 7>4 <8 6> s
	s2 s8 <6>
	<6 5>4 s s8 <6>
	<6>4 <6> s
	<6 4> <4> <3>

}

IVbfIIn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown
	
	s8
	<4 2>4 <6> s8 <6>
	s2.
	<6 5>4 <_+> s8 <_->
	<7>4 <5> s8 <6>
	<6 5>4 s s8 <6>
	<6>4 <6> s8 <6 5>
	<4>4 <3>2
	s2.*2
	s4 s s8 <6>	
	<6 5>4 <_+> s8 <6>
	<6>4 <6> s8 <6 5>
	<6 4>4 <4> <3+>
	s2.*5
	<9 7>4 <8 6> s
	<4> <3+> s
	s2.*5
	<7>4 <6> s8 <5->
	s2 s8 <6>
	<6 5>4 <6 5-> s8 <_+>
	s2.*4
	s4 s s8 <6>
	<6 5>4 s s8 <6>
	<6>4 <6> s
	<6 4> <5> <3>
	s2.*4
	s2 s8 <6>
	<6 5>4 s s8 <6>
	<6>4 <6> s8 <6 5>
	<6 4>4 <5 4> <3>

}


forma = {

\key sol\major
\time 3/4
\tempo 4 = 60
\partial 8 s8
s2.*45
\bar "|."

}


IVvlI = {
	\notypeset
	<<\IVvlIn \forma>>

}

IVvlII = {
	<<\IVvlIIn \forma>>

}

IVbcI = {
	\clef bass
	<<\IVbcIn \forma \IVbfIn>>

}

IVvlIII = {
	<<\IVvlIIIn \forma>>

}


IVvla = {
	\clef alto
	<<\IVvlan \forma>>

}


IVbcII = {
	\clef bass
	<< \IVbcIIn \forma \IVbfIIn >>
	\typeset

}

VvlIn = \relative do'' {
   
   sol'8 la16(sol) fad8
   si do16(si) la8
   re do16(si) la(sol)
   
   %4
   fad8 re r
   sol16 si sol re si fa'
   fa?8 mi r
   
   %7
   la16 do la mi la, sol'
   sol8 fad r
   do' re16(do) si8
   
   %10
   la si16(la) sol8
   do\p re16 ( do) si8
   la si16 (la) sol8
   
   %13
   fad\f sol8.\tr(fad32 sol)
   la8 re, si'\mbreak
   la16(sol) sol8. fad16
   
   %16
   sol4.
   re8\p si'4
   la4.
   
   %19
   sol
   fad4 r8
   la16\f fad re la fad do'
   
   %22
   do8 si r
   si'16 sold mi si mi, re'
   re8 dod r
   
   %25
   la'16\p(fad) re(la') fad(re)
   si'(sol) re(si') sol(re)\mbreak
   la'(fad) re(la') fad(re)
   
   %28
   si'(la) si(sol) la(si)
   la8.\f sol16 fad8
   si mi,4
   
   %31
   re8 fad16(mi) re8
   la'4.~
   la16 la si la sol8~
   
   %34
   sol16 sol la sol fad8~
   fad16 fad sol fad mi8~
   mi16 mi fad mi re8
   
   %37
   si\p do16(si) la8
   sol la16(sol) fad8
   si mi,4
   
   %40
   re4.
   re'8\f fad16(mi) re8
   la'4.~\mbreak
   
   %43
   la8 sol16 fad sol la
   fad4 fad8
   mi16 re mi fad sol la
   
   %46
   re,4 sol8~
   sol fad16(mi) fad8
   si4.~
   
   %49
   si8 la16 si sol la
   fad8 sol4~
   sol8 la16 (sol) fad8~
   
   %52
   fad sol16 (fad) mi8
   mi red r
   re!4\p do8~
   
   %55
   do si4
   la r8
   re16\f la fad re la' do\mbreak
   
   %58
   do8 si r
   sol'16 re si sol re' fa
   fa?8 mi r
   
   %61
   la16 mi dod la mi' la
   fad re fad la fad re
   sol re sol si sol re
   
   %64
   la' re, la' re la re,
   si' la si do la si
   do8\p re16(do) si8
   
   %67
   la si16(la) sol8
   fad sol8.\tr(fad32 sol)
   la8 re, si'\mbreak
   
   %70
   la16(sol) sol8. fad16
   sol4 r8
   r si,16\f  la sol8
   
   %73
   mi'8. mi16 fad mi
   re8. re16 mi re
   do8. re16 si do
   
   %76
   la sol la do si re
   do4.~
   do16 re si do re si
   
   %79
   mi8\p fad16(mi) re8
   do si16(la) si8
   mi la,4
   
   %82
   sol8 r sol\f~
   sol sol8. fad16
   sol4.

}

VvlIIn = \relative do'' {
   
   R4.
   sol'8 la16(sol) fad8
   sol mi16(re) do(si)
   
   %4
   la4 r8
   re re r
   sol, sol r
   
   %7
   mi' do r8
   la la r
   sol'4 fad8
   
   %10
   mi4 re8
   fad4\p sol8
   mi4 re8
   
   %13
   do\f re si
   fad' la re,
   do16 si la4
   
   %16
   sol4.
   r8 re'\p sol~
   sol fad4~\mbreak
   
   %19
   fad8 mi4~
   mi8 re r
   re\f la r
   
   %22
   re, re r
   mi' si r
   mi, mi r
   
   %25
   re'\p fad r
   re sol r
   re fad r
   
   %28
   sol16(fad) sol(mi) fad(sol)
   dod,8.\f dod16 re8~
   re re8. dod16
   
   %31
   re4 r8
   la dod16(si) la8
   si8. si16 dod si\mbreak
   
   %34
   la8. la16 si la
   sol8. sol16 la sol
   fad4 la8
   
   %37
   re,4\p re8
   dod4 re8~
   re re8. dod16
   
   %40
   re4.
   R4.
   la'8\f dod16(si) la8
   
   %43
   si4 mi8~
   mi re16(dod) re8~
   re do4~
   
   %46
   do8 si16 la si sol
   la4 la'8~
   la sol16(fad) sol8
   
   %49
   do4.~
   do8 si16(la) si8
   la4 si16 la
   
   %52
   sol4 la16 sol
   fad4 r8
   sold,4\p la8~
   
   %55
   la la8. sold16
   la\f mi la si do la
   fad8 re r
   
   %58
   re re r
   si' re r
   sol, sol r
   
   %61
   mi' mi r
   la, la r\mbreak
   re si r
   
   %64
   re fad r
   re4 re8
   sol4\p fad8
   
   %67
   mi4 re8
   do re si
   fad' la re,
   
   %70
   do16 si la4
   sol8\f si16(la) sol8
   re'4.~
   
   %73
   re16 re do si do8~
   do16 do si la si8~
   si16 si la si sol la
   
   %76
   fad mi fad la sol si\mbreak
   mi, re mi sol fad la
   sol8 re sol
   
   %79
   sol4\p sol8
   fad4 sol8~
   sol sol8. fad16
   
   %82
   sol8 r re'\f
   mi la,4
   sol4.

}

VbcIn = \relative do {
   
   sol'4 re8
   sol4 re'8
   si do4
   
   %4
   re16 do re mi re do
   si4 sol8
   do16 si do re do si
   
   %7
   la4 dod8
   re16 dod re mi fad re
   mi4 re8
   
   %10
   do?4 si8
   la4\p sol8
   do, do' si
   
   %13
   la\f si sol
   re' fad, sol\mbreak
   do re re,
   
   %16
   sol,4.
   sol'16\p fad sol la si do
   re re, fad mi fad re
   
   %19
   mi re mi re dod la
   re dod re fad mi sol
   fad4\f re8
   
   %22
   sol16 fad sol la si la
   sold4 sold8
   la16 sol! la si la sol
   
   %25
   fad8\p fad, r
   sol' sol, r\mbreak
   fad' fad, r
   
   %28
   sol' sol, r
   la'4\f re,8
   sol la la,
   
   %31
   re4 re8
   dod la dod
   re4 mi8
   
   %34
   dod4 re8
   si4 dod8
   re4 fad8
   
   %37
   sol4\p fad8
   mi4 re8
   sol, la4 
   re,4.
   
   %41
   re'4\parenthesize \f r8
   dod la r\mbreak
   mi'4 dod8
   
   %44
   re fad16 mi re8
   la4 la'8
   fad sol si,
   
   %47
   do re4
   sol8 si16 la sol8
   la do la
   
   %50
   re mi si
   do4 re8
   si4 do8
   
   %53
   la si r
   mi,4\p la8 
   re, mi mi,
   
   %56
   la\f do la
   re re' fad,\mbreak
   sol16 fad sol la si la
   
   %59
   sol8 sol, si
   do16 si do re mi re
   dod8 la dod
   
   %62
   re re' do?
   si sol sol
   fad re fad
   
   %65
   sol4 fad8\parenthesize \p
   mi4 re8
   do4 si8
   
   %68
   la si sol
   re' fad sol\mbreak
   do re re,
   
   %71 
   sol4 sol8\f
   fad sol  si
   do4 la8
   
   %74
   fad sol4
   mi8 fad sol
   re4 sol,8
   
   %77
   do4 re8
   sol,4 si8
   do4 si8
   
   %80
   la4 sol8
   do re4
   mi8 r si
   
   %83
   do re re,
   sol4.

}

VvlIIIn = \relative do'' {
   
   R4.*2
   re 8 mi4
   
   %4
   fad r8
   sol re r
   fa8 mi r
   
   %7
   la mi r
   sol8 fad r
   do' re16(do) si8
   
   %10
   la si16(la) sol8
   do\p re16 ( do) si8
   la si16 (la) sol8
   
   %13
   fad\f sol8.\tr(fad32 sol)
   la8 re, si'\mbreak
   la16(sol) sol8. fad16
   
   %16
   sol4.
   R4.*4
   fad8\f la r
   
   %22
   do,8 si r
   sold' si r
   re, dod r
   
   %25
   fad\p la r
   sol si r
   fad la r
   
   %28
   si, re r
   la'8.\f sol16 fad8
   si mi,4
   
   %31
   re8 fad16(mi) re8
   la'4.~
   la16 la si la sol8~
   
   %34
   sol16 sol la sol fad8~
   fad16 fad sol fad mi8~
   mi16 mi fad mi re8
   
   %37
   si\p do16(si) la8
   sol la16(sol) fad8
   si mi,4
   
   %40
   re4.
   R4.*2
   
   %43
   r8 sol'16 \parenthesize \f fad sol la
   fad4 fad8
   mi16 re mi fad sol la
   
   %46
   re,4 sol8~
   sol fad16(mi) fad8
   si4.~
   
   %49
   si8 la16 si sol la
   fad8 sol4~
   sol8 la16 (sol) fad8~
   
   %52
   fad sol16 (fad) mi8
   mi red r
   R4.*3
   la8\f re r
   
   %58
   do8 si r
   re sol r
   fa mi r
   
   %61
   dod dod r
   fad fad r
   sol sol r
   
   %64
   la la r
   si si r
   R4.*6
   r8 si,16\f la sol8
   
   %73
   mi'8. mi16 fad mi
   re8. re16 mi re
   do8. re16 si do
   
   %76
   la sol la do si re
   do4.~
   do8 si r
   
   %79
   R4.*3
   r8 r sol\f~
   sol sol8. fad16
   sol4.

}

Vvlan = \relative do' {
   
   R4.*2
   sol'8 sol mi
   re fad r
   
   %5
   sol si r
   do4 r8
   do, mi r
   
   %8
   re4 r8
   mi sol r
   mi4 sol8
   
   %11
   la4\p si8
   do mi, sol
   la\f sol re'
   
   %14
   re la sol~\mbreak
   sol sol re
   si4.
   
   %17
   R4.*4
   la'8\f fad r
   sol4 r8
   
   %23
   mi mi r
   la4 r8
   la\p la r
   
   %26
   re, re r
   la' la r
   re, re r
   
   %29
   mi4\f fad8
   mi mi la
   fad4 fad8
   
   %32
   mi4 mi8
   fad4 sol8
   mi4 fad8
   
   %35
   re4 mi8\mbreak
   la,4 la8
   si\p sol re'
   
   %38
   mi4 la8
   mi mi la,
   la4.
   
   %41
   R4.*2
   mi'8\f sol mi
   la4 la8
   
   %45
   la4 mi8
   la sol sol
   mi fad re
   
   %48
   re4 r8
   mi mi la
   la sol re
   
   %51
   mi4 re8
   re4 mi8
   do si r
   
   %54
   R4.*2
   mi8\f mi la
   la la r\mbreak
   
   %58
   sol si r
   re, re r
   do mi r
   
   %61
   la la r
   fad re r
   re re r
   
   %64
   re re r
   re4 r8
   R4.*5
   
   %71
   r8 re\f re
   la' sol re
   do mi do
   
   %74
   la si sol
   sol' fad re
   re4 re8
   
   %77
   mi sol re\mbreak
   re4 r8
   R4.*3 
   
   %82
   r8 r si'\f 
   la la re,
   re4.

}

VbcIIn = \relative do {
   
   R4.*2
   si'8 do4
   
   %4
   re8 re, r
   si'4 sol8
   do do, r
   
   %7
   la'4 dod8
   re8 re, r
   mi4 re8
   
   %10
   do?4 si8
   la4\p sol8
   do do' si
   
   %13
   la\f si sol
   re' fad, sol\mbreak
   do, re re,
   
   %16
   sol4.
   R4.*4
   fad'4\f re8
   
   %22
   sol sol, r
   sold'4 sold8
   la la, r
   
   %25
   fad'\p fad, r
   sol' sol, r\mbreak
   fad' fad, r
   
   %28
   sol' sol, r
   la'4\f re,8
   sol la la,
   
   %31
   re4 re8
   dod la dod
   re4 mi8
   
   %34
   dod4 re8
   si4 dod8
   re4 fad8
   
   %37
   sol4\p fad8
   mi4 re8
   sol, la4 
   re,4.
   
   %41
   R4.*2
   mi'4\parenthesize \f  dod8
   
   %44
   re fad16 mi re8
   la4 la'8
   fad sol si,
   
   %47
   do re4
   sol8 si16 la sol8
   la do la
   
   %50
   re mi si
   do4 re8
   si4 do8
   
   %53
   la si r
   R4.*2
   
   %56
   la,8\f do la
   re4 fad8
   sol sol, r
   
   %59
   sol'8 sol, si
   do do, r
   dod' la dod
   
   %62
   re re' do?
   si sol sol
   fad re fad
   
   %65
   sol sol, r
   R4.*5
   
   %71 
   r8 sol'\f sol
   fad sol  si
   do4 la8
   
   %74
   fad sol4
   mi8 fad sol
   re4 sol,8
   
   %77
   do4 re8
   sol,4 r8
   R4.*3
   r8 r si\f
   
   %83
   do re re,
   sol4.

}

VbfIn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown
	
	s4.*2
	<6>4.
	s
	<6>4 <7->8
	<4->8 <3>4
	<_-> <5->8
	<4> <3>4
	<6> <6>8
	<6>4 <6>8
	<6>4 s8
	<6> s <6>
	<6> <6> s
	s <6 5-> s
	<6 5> <4> <3>
	s4.
	s4 <6>8
	<4>4.
	<9>8 <8> <5->
	<9> <8> <6+>
	<6>4 <7>8
	<4> <3> s
	<6>4 <5->8
	<4> <3+> s
	<6>4.
	s
	<6>
	s
	<_+>
	<6 5>8 <4> <3+>
	s4.
	<6>
	<6 5>
	<6 5->
	<6 5>4 <5->8
	<9> <8> <6>
	s4 <6>8
	<6+>4.
	<6 5>8 <4> <3+>
	s4.*2
	<6>4.
	<4>8 <3> <5->
	<9> <6> s
	<4> <3-> s
	<6 5-> s <6>
	<6 5>4.
	<9>8 <6> s
	<9> <6> s
	<7> s <6>
	<6 5>4.
	<6 5>
	<6 5>8 <_+> s
	<7- _+>4.
	<6 5 _->8 <4> <3+>
	s4.
	s8 s <5->
	<4> <3> s
	s s <5->
	<4-> <3> s
	<6> s <6 5->
	s4.
	<6>
	<6>8 s <6 5->
	s4 <6>8
	<6>4 <6>8
	<6>4 <6>8
	<6> <6> s
	s <6 5->4
	<6 5>8 <4> <3>
	s4.
	<6>8 s <6>
	<9> <8> s
	<6 5->4.
	<6 5>8 <5-> s
	s4.
	s4 <7>8
	<4> <3> <6>
	<5>4 <6>8
	<6>4.
	<6 5>8 <4> <3>
	s4 <6>8
	<6 5> <4> <3>

}

VbfIIn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown
	
	s4.*2
	<6>4.
	s
	<6>4 <7->8
	<4->8 <3>4
	<_-> <5->8
	<4> <3>4
	<6> <6>8
	<6>4 <6>8
	<6>4 s8
	<6> s <6>
	<6> <6> s
	s <6 5-> s
	<6 5> <4> <3>
	s4.*5
	<6>4 <7!>8
	<4> <3> s
	<6>4 <6 5->8
	<4> <3+> s
	<6>4.
	s
	<6>
	s
	<_+>
	<6 5>8 <4> <3+>
	s4.
	<6>
	<6 5>
	<6 5->
	<6 5>4 <5->8
	<9> <8> <6>
	s4 <6>8
	<6+>4.
	<6 5>8 <4> <3+>
	s4.*3
	<4>8 <3> <6 5->
	<9> <6> s
	<4> <3-> s
	<6 5-> s <6>
	<6 5>4.
	<9>8 <6> s
	<9> <6> s
	<7> s <6>
	<6 5>4.
	<6 5>
	<6 5>8 <_+> s
	s4.*3
	s8 s <5->
	<4> <3> s
	s s <5->
	<4-> <3> s
	<6> s <6 5->
	s4.
	<6>
	<6>8 s <6 5->
	s4.*7 
	<6>8 s <6>
	<9> <8> s
	<6 5->4.
	<6 5>8 <5-> s
	s4.
	s4 <7>8
	<4> <3> s
	s4.*3
	s4 <6>8
	<6 5> <4> <3>

}


forma = {

\key sol\major
\time 3/8
\tempo 4. = 70
s4.*40
\bar":..:"\break
s4.*44
\bar ":|."

}


VvlI = {
	%\notypeset
	<<\VvlIn \forma>>

}

VvlII = {
	<<\VvlIIn \forma>>

}

VbcI = {
	\clef bass
	<<\VbcIn \forma \VbfIn>>

}

VvlIII = {
	<<\VvlIIIn \forma>>

}


Vvla = {
	\clef alto
	<<\Vvlan \forma>>

}


VbcII = {
	\clef bass
	<< \VbcIIn \forma \VbfIIn >>
	\typeset

}
#(set-global-staff-size 17)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \override TrillSpanner.bound-details.left.text = #'()
    \terzine \senza						
}

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
        title = \markup\smaller{Concerto grosso n. 3 Op. 7 }
        composer = \markup \center-column{"M. Mascitti (1664? - 1760)"}
         
    }

\markup \huge {[1.] Vivace}

\score {

    \new ChoirStaff \with { \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino I"\vspace #-0.2"Concertino"}
                \IvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino II"\vspace #-0.2"Concertino"}
                \IvlII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso del"\vspace #-0.2"Concertino"}
                \IbcI \global
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"di Ripieno"}
                \IvlIII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \Ivla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"Basso di"\vspace #-0.2"Ripieno"}
                \IbcII\global
            >>
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
             
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

\markup \huge {[2.] Largo}

\score {

    \new ChoirStaff \with { \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIbcI\global
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlIII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IIbcII\global
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #01
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale

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

\markup \huge {[3.] Allegro}

\score {

    \new ChoirStaff \with { \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIIbcI \global
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlIII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIIvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IIIbcII\global
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #01
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale

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

\markup \huge {[4.] Largo}

\score {

    \new ChoirStaff \with { \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IVbcI \global
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlIII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IVvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IVbcII\global
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #01
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale

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

\markup \huge {[5.] Allegro}

\score {

    \new ChoirStaff \with { \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \VbcI \global
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \VvlIII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \Vvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \VbcII\global
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #01
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine.hair-thickness = #1.2
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale

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
