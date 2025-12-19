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

pf = #(make-dynamic-script "pf")

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


global = {
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\terzine \con

			}

IvlIn = \relative do'' {

    re16
    re8.[fad16 fad8. la16] la2~
    la~la8.[la16 si8. la16]
    \grace la16 sol8.[fad16 mi8. fad16] mi2

    %4
    r8. la,16[si8. do16] si8.[dod16 re8. sol,16]
    fad4 mi\tr re fad'\upl~
    fad8 sol16 la re,8 fad mi4 la~\mbreak

    %7
    la8 sold16. fad32 \grace fad8 mi re16. dod32 re4 si'~
    si16 la sold fad mi8 \grace mi16 re8\prall dod4 r
    R1*2

    %11
    r2 r8 mi-.(mi-. mi-.)
    mi2~mi16. mi32 fad16. sol32 fad8 \grace fad16 mi8\prall
    red\noBeam re\parenthesize -. (re\parenthesize -.  re\parenthesize -. ) re2~

    %14
    re16 re mi fad mi8 re dod4 r
    r8. la16[dod8. mi16] fad2~
    fad8.[fad16 si8. la16] sold4. fad8\pf

    %17
    fad8.[mi16 mi8. re16] dod8.[re16 mi8. fad16]
    si,!2 la8.[la'16 la8. si16]
    do2~do8.[do16 si8. la16]\mbreak

    %20
    r8. sol16[sol8. la16] sib2
    lad2\tr si8. si,16 fad'4~
    fad8. sol16 mi8 re dod sol' fad4~

    %23
    fad8 sol mi4. sol8 fad4~
    fad8.[fad16 sol8. mi16] re4 dod\tr
    si8\noBeam re-.(re-. re-.) re2~

    %26
    re r8 mi\parenthesize -.  \parentSlur (mi\parenthesize -.  mi\parenthesize -. )\mbreak
    mi1~
    mi4 r r8 la,\p(mi' sol)

    %29
    sol16(fad \grace fad mi re) mi8 sol~sol16 fad \grace fad mi re mi8 sol
    sol16(fad \grace fad mi re) si'8 sol fad4 mi\tr
    re1~

    %32
    re2 re8 si'16(la) la[(sol)] sol(fad)\mbreak
    mi4 r r8 mi\parenthesize -.  \parentSlur (mi\parenthesize -.  mi\parenthesize -.)
    red2 mi4 r

    %35
    r8 re!\parenthesize -.  \parentSlur (re\parenthesize -.  re \parenthesize -.  )dod2
    re8 re la'4. re,8\noBeam sol sol
    \grace fad8 mi4. mi8 fad8.[sol16 la8. si16]

    %38
    \grace re,8 dod4 re8 mi \grace re4 dod2
    re8\p la la4 r8 si si4
    r8 la\f la si16. sol32 fad4 mi\parenthesize \tr

    %41
    re4 r r2

}

IvlIIn = \relative do'' {

    r16
    r8 r16 re[re8. fad16] fad2~
    fad~fad8.[fad16 sol8. fad16]
    \grace fad mi8.[re16 dod8. re16] dod4 dod8.\tr si32 dod

    %4
    re4 re,~re8.[mi16 fad8. mi16]
    re4 dod \parenthesize \tr re r
    R1*2\mbreak

    %8
    r2 r4 dod'~
    dod8 re16 mi la,8 dod si4 mi~
    mi8 red16 dod \grace dod si8 la16 sold la4 fad'~

    %11
    fad16 mi \grace mi red dod si8 la\prall sold4 r
    r8 si-.(si-. si-.) lad2
    si4 r r8 la\parenthesize -.  \parentSlur (la\parenthesize -.  la\parenthesize -.)

    %14
    sold2 r8. mi16[la8. dod16]\mbreak
    mi2~mi8.[mi16\upl re8.\upl dod16\upl]
    re4 re8. dod16 si4. re8\pf

    %17
    re8.[dod16 dod8. si16] la8.[si16 dod8. re16]
    \grace la4 sold2 la4 r
    r8. fa'16[\grace sol fa8. mi16] red2

    %20
    mi4 r r8. mi16[\grace fad mi8. re16]
    dod2 re4 r8 fad,
    sol mi'\grace re16 dod8 si\mbreak lad4 r8 lad

    %23
    si4. si8 dod4. dod8
    re4 si2 lad4
    si r r8 fad\parenthesize -.  \parentSlur (fad\parenthesize -.  fad\parenthesize -.)

    %26
    fad8. la16 la(sol) sol(fad) sol4 r
    r8 sold\parenthesize -.  sold\parenthesize -.  sold\parenthesize -.  sold8. si16 si(la) la(sold)
    la8\noBeam la'\parenthesize -.  \parentSlur (la\parenthesize -.  la\parenthesize -. ) la2\p~

    %29
    la1~
    la8 sol16 fad sol8 mi re4 dod\tr \mbreak
    r8 re,(la' do) do16(si) la(sol) la8 do

    %32
    do?16 si \grace si la16 sol la8 do! si4 r
    r8 la\parenthesize -.  \parentSlur (la\parenthesize -.  la\parenthesize -. ) la2~
    la16. la32 si16. do32 si8 la sold\noBeam sol\parenthesize -.  \parentSlur (sol\parenthesize -.  sol\parenthesize -.)

    %35
    sol2~sol16. sol32 la16. si32 la8 sol
    fad4 r8 la si4 r8 mi\mbreak
    dod4. dod8 re4 re8. sol,16

    %38
    \grace fad8 mi4 re8 sol \grace fad4 mi2
    re8\p fad fad4 r8 sol sol4
    r8 fad\f \noBeam fad sol16. mi32 re4 dod\tr

    %41
    re r r2

}

Ivlan = \relative do' {

    r16
    R1
    r8. re16[re8. re16] re2
    r4 si la2

    %4
    la4 la sol la8. si16
    la4 la fad la r
    la' la mi

    %7
    mi la fad fad
    sold sold la mi
    mi mi mi si\mbreak

    %10
    si mi dod dod
    red red mi r
    r si dod dod

    %13
    si r r la
    si si la r
    r la'~la8. la,16 la'8. la16

    %16
    si4 fad mi2~
    mi4. mi8 mi4 la8. fad16
    mi4 mi dod r

    %19
    r2 fad\mbreak
    sol4 r r2
    mi fad4 r8 si,

    %22
    si4 r8 sold' fad4. fad8
    re4. re8 dod4. dod8
    si4 sol' fad dod

    %25
    re r r2
    la\f re4 r
    r2 si

    %28
    dod4 r r la\mf
    re(la re la)
    re si' la mi\mbreak

    %31
    fad re re re
    re re re8 sol16. fad32 mi8 re
    dod4 r r mi

    %34
    fad fad mi r
    r re mi mi
    re r8 re re4 r8 si'

    %37
    la2 la4 re,8. si16
    la4 re8. si16 la4 la
    fad r8 re'\p re4 r8 re\f

    %40
    re4 re8 si la4 la
    fad r r2

}

Ibcn = \relative do {

    r16
    r2 r4 r8 r16 re
    re8.[fad16 fad8. si16] si2~
    si8. la16 sol4~sol8.[mi16 fad8. sol16]

    %4
    fad4 re sol fad8. sol16
    la4 la, re re
    re'\p re dod dod\mbreak

    %7
    dod dod si si
    mi, mi la, la
    la' la sold sold

    %10
    sold? sold fad fad
    si, si mi r
    r sol! fad fad

    %13
    si si, r fa'
    mi mi la la,\mbreak
    r la re8.[la'16 fad8. mi16]

    %16
    re8.[si16 dod8. re16] mi2~
    mi4. mi8 la4 la,8. re16
    mi4 mi, la r

    %19
    r la'~la8.[la16 sol8. fad16]
    mi4 r r sol~
    sol8.[sol16 fad8. mi16] re8 r re r\mbreak

    %22
    mi4. mid8 fad4. fad8
    sol4. sold8 la4. lad8
    si4 mi, fad fad,

    %25
    si r r2
    do\f si4 r
    r2 re

    %28
    dod?4 r r dod'
    re dod re dod
    re sol, la la,\mbreak

    %31
    re fad(sol fad)
    sol fad sol dod,8 re
    la4 r r do\f(

    %34
    si) si mi r
    r sib (la) la
    re4 r8 fad sol4 r8 mi

    %37
    la4 la, re8.[mi16 fad8. sol16]
    la4 si8 sol la4 la,\mbreak
    re4 r8 re\p re4 r8 re\f

    %40
    re4 re8 sol la4 la,
    re r r2

}

Ibfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\time 4/4
\key re\major
\tempo 4 = 65
\partial 16 s16
s1*41
\bar"|."

}


IvlI = {
	\global
	\notypeset
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
	\typeset
}


global = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \terzine \con
}

IIvlIn = \relative do'' {

   re8 re, r re' re re, r re'16 mi
   fad8 fad, r fad' fad fad,r fad'16 sol
   la8 la, r la' la la, r si'16 dod

   %4
   re dod si la sol fad mi re re'4 r
   re16 dod si la sol fad mi re re'4 r16 la sol fad\mbreak
   mi la, fad' la, sol'8 fad16 mi fad8 la4 sol16 fad

   %7
   mi la, fad' la, sol'8 fad16 mi fad8 re r re16 mi
   fad8 re r la'16 fad mi8 la, r dod16 re
   mi8 dod r la'16 mi re8 si r si16 dod

   %10
   re8 re'4 re,8 dod la mi'8.\tr re32 mi\mbreak
   fad8 fad, fad'4. re8 re8.\tr dod32 re
   mi8 mi, mi'4. dod8 dod8.\tr si32 dod

   %13
   re8 re, re'4. si8 si8.\tr la32 si
   dod8 dod, dod'8.\tr si32 dod re8 re, re'8.\tr dod32 re
   mi8 mi, mi'8.\tr re32 mi fad8 fad, sold'8.\tr fad32 sold\mbreak

   %16
   la8 si16 sold la8 la la si16 sold la8 la
   la la4 la si16 do si8 la
   sold si16 sold mi8 fad sol? sib16 fad sol8 sol

   %19
   sol sol4 sol la16 sib la8 sol
   fad la16 fad re8 mi fa la16 mi fa8 fa\mbreak
   fa16 sol fa mi re mi re do si mi (fad mi) sold\upl mi\upl sold\upl mi\upl

   %22
   la mi(fad mi) si'\upl mi,\upl si'\upl mi,\upl dod'! mi,(fad mi) sold\upl mi\upl sold\upl mi\upl
   la mi(fad mi) si'\upl mi,\upl si'\upl mi,\upl dod'4 r
   R1\mbreak

   %25
   r2 r8 la\p si4~
   si8 sold la4. fad8 sold4
   r8 la(mi sol!)  fad2~

   %28
   fad8\noBeam fad[\grace sol16 fad8 mi] \grace fad16 mi8 re \grace mi16 re8 dod
   <dod mi, la,>\f\noBeam la'16 mi fad8 mi16 re  dod4 si
   la r r2

   %31
   R1*2
   r8 si!16 dod re4. si16 dod re4~
   re8 re dod si lad dod16 re mi4~

   %35
   mi8 dod16 re mi4. fad16[sol fad8 mi]
   re\noBeam re16 mi fad4. fad8 fad8.\tr mi32(fad)
   si4 r\mbreak fad fad8.\tr mi32 fad

   %38
   sol8 sol, sol'4. mi8 mi8.\tr re32 mi
   fad8 fad, fad'4. sold16 la sold8 fad
   mid2\mp(mi8)\noBeam mi(fad mi)

   %41
   red2(re8)\noBeam re(mi re)
   dod2(do8)\noBeam do(re do)\mbreak
   si4 r r2

   %44
   re8 re, r re' re re, r re'16 mi
   fad8 fad, r fad' fad fad,r fad'16 sol
   la8 la, r la' la la, la'8.\tr sol32 la

   %47
   si8 si, si'4. sol8 sol8.\tr fad32 sol\mbreak
   la8 la, la'4. fad8 \grace sol16 fad8.\tr mi32 fad
   sol8 sol, sol'4. mi8 mi8.\tr re32 mi

   %50
   fad8 fad, fad'8.\tr mi32 fad sol8 sol, sol'8.\tr fad32 sol
   la8 la, la'8.\tr sol32 la si8 si, dod'8.\tr si32 dod
   re8 re4 re re re8~\mbreak

   %53
   re re4 re8 re8. [dod16 re8. re16]
   dod8.[si?16 la8. si16] do8 do4 do8~
   do? do4 do8 do8.[si16 do8. do16]

   %56
   sib?8.[la16 sol8 la] sib! sib4 sib8
   sib?16 la sol la sol fa mi fa mi4 r
   R1\mbreak

   %59
   r2 r16 re(mi re) fad\upl re\upl fad\upl re\upl
   sol re(mi re) la'\upl re,\upl la'\upl re,\upl si' re,(mi re) fad\upl re\upl fad\upl re\upl
   sol re mi re la' re, la' re, si'4. sold8

   %62
   la4. fad8\p sol!4. mi8
   fad4 r r8 sol si, re
   \grace re16 dod8 si \grace dod16 si8 la \grace si16 la8 sol \grace la16 sol8 fad\mbreak

   %65
   fad8\noBeam re'16\f la si8la16 sol fad4 mi
   re r r2

}

IIvlIIn = \relative do'' {

   R1
   re8 re, r re' re re, r re'16 mi
   fad8 fad, r fad' fad fad, r fad'16 sol
   
   %4
   la8 la, r si'16  dod re dod si la sol fad mi re
   re'4 r re16 dod si la sol fad mi re
   dod la re la mi'8 re16 dod re8 fad4 mi16 re\mbreak
   
   %7
   dod la re la mi'8 re16 dod re la la la la la la la
   re la la la la la la la dod la la la la la la la
   dod la la la la la la la si sold sold sold sold sold sold sold
   
   %10
   si sold sold sold sold sold sold sold la4 r
   r8 la la8.\tr sold?32 la si8 si, si'4~
   si8 sold sold8.\tr fad32 sold\mbreak la8 la, la'4~
   
   %13
   la8 fad fad8.\parenthesize \tr mi32 fad sold8 sold, sold'8.\parenthesize \tr fad32 sold
   la8 la, la'8.\parenthesize \tr sold?32 la si8 si, si'8.\tr la32 si
   dod8 dod, dod'8.\tr  si32 dod re8 re, si'8.\parenthesize \tr la32 si
   
   %16
   dod16 dod dod dod dod dod dod dod do do do do do do do do
   \repeat unfold 16 {do}
   si si si si si si si si sib sib sib sib sib sib sib sib\mbreak
   
   %19
   \repeat unfold 16 {sib}
   \repeat unfold 16 {la}
   la8 re16 do si do si la sold4 r
   
   %22
   R1
   r2 r16 la(si la dod la dod la)
   re la(si la) mi'\upl la,\upl mi'\upl la,\upl fad' la,(si la) dod\upl la\upl dod\upl la\upl
   
   %25
   re la(si la) mi'\upl la,\upl mi'\upl la,\upl\mbreak fad'4.\p red8
   mi4. dod8 re?4. si8
   dod4 r r8 si(fad la)
   
   %28
   \grace la8 sold2~sold8 si  \grace dod16 si8(la)
   la\parenthesize \f mi'16 dod re8 dod16 si la4 sold
   r8 la\p do4. la16 si do4~
   
   %31
   do?8 do[(si la)]\mbreak sol\noBeam sol16 la sib4~
   sib8 sol16 la sib4~sib8 sib(la sol)
   fad4 r8 si?16 la sol4. sol16 fad
   
   %34
   mi2 fad4. dod'16 si
   lad4. lad16 sol fad4 lad
   si8\noBeam si16 dod re4. si16 dod re4
   
   %37
   r8 si si8.\tr la32 si fad'4 r\mbreak
   r8 si, si8.\tr la32 si dod8 dod, dod'4~
   dod8 la \grace si16 la8.\tr sol32 la re,4 si'~
   
   %40
   si8\noBeam si(dod si) lad2\p \parentSlur (
   la!8\noBeam) la(si la) sold2(
   sol!8\noBeam) sol (la sol) fad2
   
   %43
   sol8 sol'16 fad sol fad mi re\mbreak dod! si la sol fad mi re dod
   re4 r r2
   re'8 re, r re' re re, r re'16 mi
   
   %46
   fad8 fad, r fad' fad fad, r re'
   r re, re'8. \parenthesize \tr dod32 re mi8 mi, mi'4
   r8 dod dod8.\tr si32 dod re8 re, re'4~\mbreak
   
   %49
   re8 si si8.\tr la32 si dod8 dod, dod'8.\tr si32 dod
   re8 re, re'8.\tr dod32 re mi8 mi, mi'8.\tr re32 mi
   fad8 fad, fad'8.\tr mi32 fad sol8 sol, mi'8.\tr re32 mi
   
   %52
   fad16 fad fad fad fad fad fad fad la fa fa fa fa fa fa fa
   la fa? fa fa fa fa fa fa fa fa fa fa fa fa fa fa \mbreak
   mi mi mi mi mi mi mi mi sol mib mib mib mib mib mib mib
   
   %55
   sol mib? mib mib mib mib mib mib mib mib mib mib mib mib mib mib
   re re re re re re re re sol re re re re re re re
   re8 sol16 mi! mi re dod re dod la(si la) dod\upl la\upl dod\upl la\upl
   
   %58
   re la(si la) mi'\upl la,\upl mi'\upl la,\upl fad' la,(si la) dod\upl la\upl dod\upl la\upl
   re la(si la) mi'\upl la,\upl mi'\upl la,\upl\mbreak fad'4 r
   R1
   
   %61
   r2 r8 re mi4~
   mi8 dod \parenthesize \p re4. si8 dod4
   r8 re(la do) si2 
   
   %64
   mi,8 la \grace la16 sol8 fad \grace sol16 fad8  mi8 \grace fad16 mi8 re
   re\noBeam la'16\f fad sol8 fad16 mi re4 dod
   re4 r r2
   
}

IIvlan = \relative do' {
   
   R1*2
   re8 re, r8 re' re re, r re'16 mi
   fad8 fad, r fad' fad fad, r fad'16 sol
   
   %5
   la8 la, r la' la la, r la'
   la4 r la8  re,4 si'8
   la4 r8 la la fad fad,4 r8 
   
   %8
   fad' fad,4 r8 mi' mi,4\mbreak
   r8 mi'  mi,4 r8 re' re,4
   r8 mi' mi,4 r8 mi' dod la
   
   %11
   si4 re2 sold,4~
   sold dod2 fad,4~
   fad si2 mi,4~
   
   %14
   mi r r2
   R1
   la'8 la, r la'16 si do8 la r la16 si
   
   %17
   do8 la r la16 sol fa8 fa16 mi red8 red\mbreak
   mi8 mi, r sol'16 la sib8 sol r sol16 la
   sib8 sol r sol16 fa mi8 mi16 re dod!8 dod
   
   %20
   re re, r fa'16 sol la8 fa r fa16 mi
   re4 re8 red mi4 r8 mi
   mi4 r8 mi mi4 r8 mi
   
   %23
   mi4 r8 mi mi4 r8 mi
   la4 r8 la,\mbreak la4 r8 mi'
   fad4 r8 la la4 r8 si
   
   %26
   sold4 r8 la fad4 r8 mi
   mi4 dod re2
   si2. mi4
   
   %29
   mi fad mi mi
   dod r8 la'\p fa4. fa16 mi
   red2 mi4 r8 sol16 fa\mbreak
   
   %32
   mi4. mi16 re dod!2
   re4 r r2
   R1*3
   
   %37
   fad8 fad, r sol' fad si, r si
   mi2 mi
   re4 fad2  si4
   
   %40
   sold2 fad
   fad mi
   mi re\mbreak
   
   %43
   re4 mi2 mi4
   la,8 fad' sol la si fad16 sol la8 dod,
   re4 r r2
   
   %46
   R1
   sol8 re r sol sol sol, r sol'
   fad fad, r fad' fad fad, r fad'
   
   %49
   mi mi, r mi' mi mi, r la'
   la4 r r2
   R1\mbreak
   
   %52
   re,8 re, r re'16 mi fa8 re r re16 mi
   fa?8 re r re'16 do? sib8 sib16 la sold8 sold
   la la, r do'16 re mib8 do r do16 re
   
   %55
   mib8 do? r do16 sib la8 la16 sol fad!8 fad
   sol sol, r sib'16 dod? re8 sib r sib16 la\mbreak
   sol4 sol8 sold la4 r8 la,
   
   %58
   la4 r8 la la4 r8 la
   la4 r8 la re4 r8 re
   re4 r8 re re4 r8 re
   
   %61
   re4 r8 re re4 r8 mi
   dod4 r8 re\p si4 r8 la
   la4 re2 si4
   
   %64
   la2. dod4(\mbreak
   re) si\f la4. sol8
   fad4 r r2

}

IIbcn = \relative do {

   R1*3
   re8 re, r re' re re, r re'16 mi
   fad8 fad,  r fad' fad fad, r fad'16 sol

   %6
   la8 la, r la' re re,16 mi fad8 sol
   la la, r la\mbreak re re' re,4
   r8 re' re,4 r8 dod' dod,4

   %9
   r8 dod' dod,4 r8 si' si,4
   r8 mi mi,4 r8 la' la, dod
   re2 sold,

   %12
   dod fad,
   si mi,
   R1*2\mbreak

   %16
   la'8 la, r la'16 si do8 la r la16 si
   do8 la r la16 sol fa8 fa16 mi red8 red
   mi mi, r sol'16 la sib8 sol r sol16 la

   %19
   sib8 sol r sol16 fa mi8 mi16 re dod!8 dod
   re re, r fa'16 sol\mbreak la8 fa r fa16 mi
   re4 re8 red mi4 r8 mi

   %22
   dod!4 r8 sold la4 r8 re
   dod4 r8 sold la4 r8 la'
   fad4 r8 dod re4 r8 sol

   %25
   fad4 r8 dod re4 r8 si'\p
   dod4. la8 si4. mi,8
   la,2(re)

   %28
   mi2. mi4
   la re, mi mi,
   la r r2

   %31
   R1*5
   si'8 si, r si' si si, r si'16 dod
   re8 re,r re'\mbreak re re, r re'

   %38
   mi2 la,
   re,4 re'8 dod si2
   dod fad,\p

   %41
   si mi,
   la re,
   sol la4. mi8

   %44
   fad8\f si16 la sol8 fad\mbreak sol la16 sol fad8 mi
   re4 r r2
   re8 re, r re' re re, r re'

   %47
   sol sol, r sol' mi dod r dod
   fad fad, r fad' re si r si
   mi mi, r mi' dod la r la\mbreak

   %50
   re4 r r2
   R1
   re'8 re, r re'16. mi32 fa8 re r re16. mi32

   %53
   fa8 re r re16 do sib8 sib16 la sold8 sold
   la la, r do'16 re mib8  do r do16 re
   mib8 do? r do16 sib\mbreak la8 la16 sol fad!8 fad

   %56
   sol sol, r sib'16 dod? re8 sib r sib16 la
   sol4 sol8 sold la4 r8 sol
   fad4 r8 dod re4 r8 sol

   %59
   fad4 r8 dod re4 r8 do'
   si4 r8 fad sol4 r8 do\mbreak
   si4. fad8 sol4. mi8

   %62
   fad4. re8\p mi4. dod8
   re2 sol,
   la2. la4(

   %65
   re) sol\f la la,
   re r r2

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 4/4
   \key re\major
   \tempo 2 = 60
   s1*66
   \bar"|."

}


IIvlI = {
   \global
   \notypeset
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
   \typeset

}


global = {
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\terzine \con

			}

IIIvlIn = \relative do'' {

    re4\p la'8
    la,4.
    mi'8 fad sol

    %4
    fad16. sol32 la8 la,\noBeam
    \grace dod16 si8  la re\upl\noBeam
    \grace la16 sol8 fad re'\upl\noBeam

    %7
    \grace dod16 si8(la) re\upl\noBeam
    \grace la16 sol8(fad) re'\upl\noBeam\mbreak
    mi16(fad sol mi fad re)

    %10
    \grace re16 dod8 si16 dod la8
    re4 la'8
    la,4.

    %13
    \grace la16 sol8 fad mi
    fad16. sol32 la8 re\f \upl\noBeam
    \grace dod16 si8\p la re\f\upl\noBeam

    %16
    \grace la16 sol8\p(fad) re'\upl\noBeam\f
    \grace dod16 si8\p \parentSlur (la) re\noBeam\f\upl\mbreak
    \grace la16 sol8\p \parentSlur (fad) re'\upl\noBeam

    %19
    si16 sol' fad la dod, mi
    re8 re, r
    fad'16.\tr mi64 fad la8\noBeam r

    %22
    mi16.\tr re64 mi la8\noBeam r
    re,16.\tr dod64 re si'16[sold mi re]
    re si dod8 fad\noBeam~

    %25
    fad16 mid sold8 si,
    \grace dod16 si la dod8[fad]~\mbreak
    fad16 mid sold8 si,

    %28
    \grace dod16 si la dod8 fad\upl\noBeam\f
    \grace mi16 re8\p(dod) fad\upl\f\noBeam
    \grace dod16 si8(la) fad'\noBeam~

    %31
    fad16 la la sold \grace la sold fad
    mid re \grace mid re dod \grace re dod si
    fad' dod re si \grace si la sold

    %34
    la16. si32 \grace la8 sold4\mbreak
    fad8 la'4~
    la8\upl sol16 fad mi red

    %37
    mi8 sol4~
    sol8 \grace sol16 fad mi \grace mi re dod
    re4\p la'8

    %40
    la,4.
    mi'8 fad sol
    fad16. sol32 la8 re,\noBeam

    %43
    \grace dod16 si8 (la) re\upl\noBeam
    \grace la16 sol8 (fad) re'\upl\noBeam\mbreak
    mi16 \parentSlur  (fad sol mi fad re)

    %46
    mi dod \grace si8 la4
    re la'8
    la,4.

    %49
    mi8 fad sol
    fad16. sol32 la8 re\upl\noBeam
    \grace dod16 si8 (la) re\upl\noBeam

    %52
    \grace la16 sol8 \parentSlur (fad) re'\upl\noBeam
    sol16 mi fad la dod, mi\mbreak
    re4 r8

    %55
    si4 si32 dod si dod
    re\f mi re mi fad[sol fad sol] la8
    si16 la32 sol la16[fad sol mi]

    %58
    \grace mi8 fad4.
    si,4\p si32 dod si dod
    re mi re mi fad[sol fad\f sol] la16 sol32 la\mbreak

    %61
    si16 la32 sol fad8[mi]
    re4 r8

}

IIIvlIIn = \relative do'' {

    re4\p la'8
    la,4.
    mi'8 fad sol

    %4
    fad16. sol32 la8 re,\noBeam
    \grace dod16 si8 la re\upl\noBeam
    \grace la16 sol8 fad re'\upl\noBeam

    %7
    \grace dod16 si8(la) re\upl\noBeam
    \grace la16 sol8(fad) re'\upl\noBeam\mbreak
    mi16(fad sol mi fad re)

    %10
    \grace re16 dod8 si16 dod la8
    re4 la'8
    la,4.

    %13
    \grace la16 sol8 fad mi
    fad16. sol32 la8 re\f \upl\noBeam
    \grace dod16 si8\p la re\f\upl\noBeam

    %16
    \grace la16 sol8\p(fad) re'\upl\noBeam\f
    \grace dod16 si8\p \parentSlur (la) re\noBeam\f\upl\mbreak
    \grace la16 sol8\p \parentSlur (fad) re'\upl\noBeam

    %19
    si16 sol' fad la dod, mi
    re8 re, r
    re (fad re

    %22
    dod mi dod)
    re (mi sold
    la,4) la'8\mbreak

    %25
    sold(mid dod)
    fad4 la8
    sold mid dod

    %28
    fad4 la8\f
    si\p fad la\noBeam
    re dod(la\noBeam)

    %31
    re,4 re8\mbreak
    dod si sold
    la si mid

    %34
    fad si, dod
    fad fad16[mi! red dod]
    si8\noBeam si' la

    %37
    sol16 fad mi re! dod si
    la4.
    re'4\p la'8

    %40
    la,4.
    mi'8 fad sol
    fad16. sol32 la8 re,\noBeam

    %43
    \grace dod16 si8 (la) re\upl\noBeam
    \grace la16 sol8 (fad) re'\upl\noBeam\mbreak
    mi16 \parentSlur  (fad sol mi fad re)

    %46
    mi dod \grace si8 la4
    re la'8
    la,4.

    %49
    mi8 fad sol
    fad16. sol32 la8 re\upl\noBeam
    \grace dod16 si8 (la) re\upl\noBeam

    %52
    \grace la16 sol8 \parentSlur (fad) re'\upl\noBeam
    sol16 mi fad la dod, mi\mbreak
    re4 r8

    %55
    si4 si32 dod si dod
    re\f mi re mi fad[sol fad sol] la8
    si16 la32 sol la16[fad sol mi]

    %58
    \grace mi8 fad4.
    si,4\p si32 dod si dod
    re mi re mi fad[sol fad\f sol] la16 sol32 la\mbreak

    %61
    sol16 fad32 mi re8[dod]
    re4 r8

}

IIIvlan = \relative do' {

    fad8 la fad
    mi dod re~
    re re dod

    %4
    re dod re~
    re fad[re]~
    re fad[re]~

    %7
    re fad[re]~
    re fad la
    sol16(fad mi8 re)

    %10
    mi4 r8
    fad(la fad)\mbreak
    mi(dod re

    %13
    mi re dod)
    re dod re\noBeam~\(
    re fad[re]~

    %16
    re [fad] re~
    re [fad] \) re\parentSlur (
    re) fad la

    %19
    si la mi
    fad4 r8
    R4.*18

    %39
    fad8 la fad(
    mi dod) re~
    re \noBeam re dod

    %42
    re4.
    re
    re4 la'8(

    %45
    sol16) fad mi8 re
    dod re mi
    fad la fad

    %48
    r mi re
    dod re mi
    r fad re~

    %51
    re[fad] re~
    re[fad] re
    si' la mi\mbreak

    %54
    fad sol la
    r re, mi
    la4 re,8~

    %57
    re\noBeam re\f dod
    fad sol la
    r re, mi

    %60
    fad4 re8
    si' la mi
    fad4 r8

}

IIIbcn = \relative do {

    re8 fad(re)
    dod la fad'
    sol la4

    %4
    re,8 mi fad
    sol re fad\noBeam
    si[(la)] fad

    %7
    sol re fad\noBeam
    si la fad\noBeam
    sol dod, re\mbreak

    %10
    la la'16 sol fad mi
    re8 fad re
    dod la fad'

    %13
    sol la4
    re,8 mi fad
    sol re sol\noBeam

    %16
    si[(la)] fad
    sol re fad\noBeam
    si la fad

    %19
    sol la la,
    re4 r8\mbreak
    R4.*18

    %39
    re8 fad re
    dod la fad'
    sol la4

    %42
    re,8 mi fad
    sol re fad
    sol la(fad)

    %45
    dod4 re8
    la'8. sol16 fad mi
    re8 fad re\mbreak

    %48
    dod dod' si
    la4.
    r8 re, fad

    %51
    sol re fad
    si la fad\noBeam
    sol la la,

    %54
    re mi fad
    sol sol, sol'
    fad4 fad8

    %57
    sol re\f la\mbreak
    re mi fad
    sol sol, sol'

    %60
    fad4 fad8
    sol la la,
    re4 r8

}

IIIbfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}

forma = {

\time 3/8
\key re\major
\tempo 4. = 50
s4.*62
\bar"|."

}


IIIvlI = {
	\global
	%\notypeset
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
	\typeset

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller "Concerto a 4 in Re maggiore"
    %subsubtitle = #(string-append " ")
    composer = \markup \center-column{"   ""B. Galuppi (1706 - 1785)"}
}

\markup \huge {[1.] [Maestoso]}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"Violino P.mo"}
            \IvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"Violino 2.do"}
            \IvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  \center-column{"Violetta"}
            \Ivla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"Basso"}
            \Ibc

        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[2.] All[egr]o spiritoso}

\score {

    \new ChoirStaff <<

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

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \IIbc

        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[3.] [Andantino]}

\score {

    \new ChoirStaff <<

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

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \IIIbc

        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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
