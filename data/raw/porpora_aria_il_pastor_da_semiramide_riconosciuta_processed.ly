\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { soli }

solo = ^\markup \italic { solo }

tu = _\markup \italic "tutti"

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
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}
mbreak = { }


global = 	{
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletNumber #'transparent = ##t
   \override TupletBracket #'bracket-visibility = ##f

}

crIn = %\transpose do re,{

   \relative do'' {
   \key do\major
   r4 r8
   R1.
   do1.\p
   re4 do8 r4 r8 r2.

   %4
   sol1.~
   sol4. r4 r8\mbreak mi'4. r4 r8
   mi4. r4 r8 mi4. r4 r8
   r4 r8 r r re\f  mi fa sol la si4\tr

   %8
   do8 do, fa mi re4\tr do4. r4 r8
   R1.*10
   r2. r4 r8 <<{re4. ~

   %20
   re1.}\\{s4. s2.\f s\p}>>
   sol4.~sol8 la4\tr sol4 mi8 re4.
   re r4 r8\mbreak r2.

   %23
   R1.
   r2. r4 r8 sol,4.~
   sol1.~

   %26
   sol~
   sol4. r4 r8 r2.
   R1.

   %29
   sol'1.~
   sol4. r4 r8\mbreak r2.
   R1.

   %32
   r4 r8 sol,4.~ sol2.~
   sol2. do4. r4 r8
   R1.

   %35
   r2.\mbreak mi4. r4 r8
   mi4.\p r4 r8 mi4. r4 r8
   r2. mi2.\p ~

   %38
   mi4.\f ~mi8 fa4\tr mi8 fa sol la si4\tr
   do8 do, fa mi re4\tr do4. r4 r8
  %}

   R4.*28

}

crIIn = %\transpose do re,{

   \relative do'' {
   \key do\major

   r4 r8
   R1.
   do,1.\p
   sol'4 do,8 r4 r8 r2.

   %4
   sol'1.~
   sol4. r4 r8 \mbreak do4. r4 r8
   do4. r4 r8 do4. r4 r8

   %7
   r4 r8 r r re\f mi fa sol la8 si4\tr
   do8 do,4 sol4. mi r4 r8
   R1.*11

   %20
   <<{re'1.~
      re4.}\\{s2.\f s\p}>> mi8 fad4\tr  sol8 sol,4 re'4.
   sol, r4 r8  r2.

   %23
   R1.
   r2. r4 r8 sol4.~
   sol1.~

   %26
   sol~
   sol4. r4 r8 r2.
   r2. r4 r8 sol4.~

   %29
   sol1.
   do4. r4 r8 r2.
   R1.

   %32
   r2. sol'~
   sol~sol4. r4 r8
   R1.

   %35
   r2. do,4. r4 r8
   do4.\p r4 r8 do4. r4 r8
   r2. do\p~

   %38
   do4.\f ~do8 re4 mi8 fa sol la si4\tr
   do8 do,4 sol4. do, r4 r8
   %}

   R4.*28

}

flIn = \relative do'' {
   \key re\major

   r4 r8
   r2. r4 r8 fad4 sol8\tr
   la8. si16 la8 la4 re8 si4 la8 fad la re
   \grace la sol4 fad8 r4 r8 r2.

   %4
   r4 r8 la re la sol si sol fad re' fad,
   fad4\tr mi8 dod(mi sol)\mbreak fad la re dod16 si la8 sol
   fad la re dod16 si la8 sol fad sol la si dod4\tr

   %7
   re8 re, sol fad mi4\tr fad8\f sol la si dod4\tr
   re8 re, sol fad16. mi32 mi4\tr re4. fad4 sol8
   la8. si16 la8 la4 re8 si4\tr la8 fad4 sol8\mbreak

   %10
   la8. si16 la8 la4 re8 si4 la8 la4 re8
   \grace la16 sol4\tr fad8 r4 r8 r2.
   r4 r8 la (re la) sol (si sol) fad (re' fad,)

   %13
   fad4\tr mi8 la4 la8 la8.\tr sold16 la8 la16. si32 dod8 si\mbreak
   la8. sold16 la8 la16. si32 dod8 si la sold la mi4 mi8
   fad8. sold16 fad8 re'4 fad,8 fad4\tr mi8 la4 mi8

   %16
   fad re' dod si la sold la dod16 si dod si  la4.~
   la8 dod16 si dod si la4.~\mbreak la8 la8.\tr sold32 la mi8 si'8.\tr la32 si
   mi,8 dod'8. si32 dod re,4 re'8 dod4 si16 dod re8 dod si

   %19
   la4. sold\tr la~la8 sold4\tr
   la8\f mi la sold16 (la) si8 re,\mbreak dod\p (mi la) sold16. la32 si8 re,
   dod re mi fad sold4\tr la8 la,  la' la sold4

   %22
   la4. la4 mi8 la8. dod32 si la8 la4 mi8
   fad4\tr mi8 la4 mi8 la dod16 si la8 la4 mi8
   fad4\tr mi8 mi4 la8 sol4\tr fad8 la si16 la si la

   %25
   sol8 la16 sol la sol fad8 sol16 fad sol fad mi4.\tr la8 si16 la si la
   sol8 la16 sol la sol fad8 sol16 fad sol fad\mbreak mi8 fad16 mi fad mi re8 fad re
   dod4.\tr la'4 la8 sib8. dod16 sib8 sib4 sib8

   %28
   la8. sol16 la8 la4 re8 sol,8. fad16 sol8 \grace si la4 sol8
   fad la re dod16 si la8 sol fad la re dod16 si la8 sol
   fad sol la si dod4\tr\mbreak re8 re, sol fad mi4\tr

   %31
   re8 fad16 mi fad mi re4.\tr~re8 la'16 fad sol mi re4.~
   re16 fad la8 re dod16 si la8 sol fad la re dod16 si la8 sol
   fad la re dod16 si la8 sol fad sol la si dod4\tr

   %34
   re8 re, sol fad mi4\tr fad8 sol la si dod4\tr
   re8 re, sol fad mi4\tr \mbreak re4. r4 r8
   fad\p(la re) dod16(si) la8 sol fad sol la si dod4\tr

   %37
   re8 re,  sol fad mi4\tr re4.~re8 fad16 mi fad mi
   re4.~re8 mi4\tr fad8 sol la si8 dod4
   re8 re, sol fad16. mi32 mi4\tr re4. r4 r8

   %40
   \key fa\major
   la'8 la8. sib16\mbreak
   \grace la16 sol4 fa8
   mi16 [la sol mi fa re]

   %43
   dod16. re32 re8.\tr[dod32(re)]
   mi16 sold \grace sib16 la4
   fa8 mi re

   %46
   la' mi r16\fermata la
   fa8 mi re
   dod16 sib la8 r\fermata

   %49
   r do'? fa,
   fa8.\tr mi16 fa8
   fa do'32[sib la16] sib32[la sol16]

   %52
   fa8.\tr mi16 fa8
   r re' sol,
   sol fad sol

   %55
   sol re' sol,
   sol16. fad32 sol4
   sib8 lab sol

   %58
   lab32[sib do16] do4\tr
   sol8\tr[lab sib]
   lab32[(sib do16)] do4

   %61
   sol8\tr[la! sib]
   la8 la4\tr
   la8\noBeam  la8.\tr sold32(la)

   %64
   la8 la la
   la4.~
   la8 sold4

   %67
   la4 r8

}

flIIn = \relative do'' {
   \key re\major

   r4 r8
   r2. r4 r8re4 mi8
   fad8. sol16 fad8 fad la16 fad la fad sol4\tr fad8 re fad16 re fad re
   dod4\tr re8 r4 r8 r2.

   %4
   r4 r8 fad la fad mi sol mi re fad re
   re4\tr dod8 dod(mi sol)\mbreak fad la re dod16 si la8 sol
   fad la re dod16 si la8 sol fad sol la si dod4\tr

   %7
   re8 re, re re dod4\tr  fad8_\markup {[\musicglyph #"f"]} sol la si dod4\tr\mbreak
   re8 re,4 re8 dod4 re4. re4 mi8
   fad8. sol16 fad8 fad4 fad8 sol4\tr fad8 re4 mi8

   %10
   fad8. sol16 fad8 fad4 fad8 sol4 fad8 fad re fad\mbreak
   dod4 re8 r4 r8 r2.
   r4 r8 fad (la fad) mi (sol mi) re (fad re)

   %13
   re4\tr dod8 la'4 la8 la8.\tr sold16 la8 la16. si32 dod8 si\mbreak
   la8. sold16 la8 la16. si32 dod8 si8 la sold la dod,4 dod8
   re8. mi16 re8 fad4 re8 re4\tr dod8 la'4 mi8

   %16
   fad re' dod si la sold la dod16 si dod si  la4.~
   la8 dod16 si dod si la4.~\mbreak la8 la8.\tr sold32 la mi8 si'8.\tr la32 si
   mi,8 dod'8. si32 dod re,4 re'8 dod4 si16 dod re8 dod si

   %19
   la4. sold\tr la~la8 sold4\tr
   la8\f mi la sold16 (la) si8 re,\mbreak dod\p (mi la) sold16. la32 si8 re,
   dod re mi fad sold4\tr la8 la,  la' la sold4

   %22
   la4. dod,4 dod8 dod8. mi32 re dod8 dod mi dod
   re4\tr dod8 dod mi dod\mbreak dod mi dod dod mi dod
   re4 dod8 dod mi dod dod4 re8 la' si16 la si la

   %25
   sol8 la16 sol la sol fad8 sol16 fad sol fad mi4.\tr la8 si16 la si la
   sol8 la16 sol la sol fad8 sol16 fad sol fad\mbreak mi8 fad16 mi fad mi re8 fad re
   dod4.\tr la'4 la8 sib8. dod16 sib8 sib4 sib8

   %28
   la8. sol16 la8 la4 re8 sol,8. fad16 sol8 \grace si la4 sol8
   fad la re dod16 si la8 sol fad la re dod16 si la8 sol
   fad sol la si dod4\tr\mbreak re8 re, sol fad mi4\tr

   %31
   re8 fad16 mi fad mi re4.\tr~re8 la'16 fad sol mi re4.~
   re16 fad la8 re dod16 si la8 sol fad la re dod16 si la8 sol
   fad la re dod16 si la8 sol fad sol la si dod4\tr

   %34
   re8 re, sol fad mi4\tr fad8 sol la si dod4\tr
   re8 re, sol fad mi4\tr \mbreak re4. r4 r8
   fad\p(la re) dod16(si) la8 sol fad sol la si dod4\tr

   %37
   re8 \once\tieDashed re,4~ re8 dod4\tr re4.~re8 fad16 mi fad mi
   re4.~re8 mi4\tr fad8 sol la si dod4
   re8 re,4~re8 dod4\tr re4. r4 r8

  %40
  \key fa\major
   la'8 la8. sib16\mbreak
   \grace la16 sol4 fa8
   mi16 [la sol mi fa re]

   %43
   dod16. re32 re8.\tr[dod32(re)]
   mi16 sold \grace sib16 la4
   fa8 mi re

   %46
   la' mi r16\fermata la
   fa8 mi re
   dod16 sib la8 r\fermata

   %49
   r do'? fa,
   fa8.\tr mi16 fa8
   fa do'32[sib la16] sib32[la sol16]

   %52
   fa8.\tr mi16 fa8
   r re' sol,
   sol fad sol

   %55
   sol re' sol,
   sol16. fad32 sol4
   sib8 lab sol

   %58
   lab32[sib do16] do4\tr
   sol8\tr[lab sib]
   lab32[(sib do16)] do4

   %61
   sol8\tr[la! sib]
   la8 la4\tr
   la8\noBeam  la8.\tr sold32(la)

   %64
   la8 la la
   la4.~
   la8 r r

   %67
   R4.

}

vlIn = \relative do'' {
   \key re\major

   fad4 sol8
   la8. si16 la8 la4 re8 si4 la8 la,4 sol8
   fad4. r4 r8 r2.
   r4 r8 la'8 re la sol si sol fad re' fad,

   %4
   fad4\tr mi8 r4 r8 r2.
   r4 r8 dod(mi sol)\mbreak fad la re dod16 si la8 sol
   fad la re dod16 si la8 sol fad sol la si dod4\tr

   %7
   re8 re, sol fad mi4\tr fad8\f sol la si dod4\tr
   re8 re, sol fad16. mi32 mi4\tr re4. r4 r8
   re,4\p re8 re4 re8 re4 re8 fad4 mi8\mbreak

   %10
   re4 re8 re4 re8 re4 re8 re4 re8
   la4 re8 la'' re la sol si sol fad re' fad,
   fad4\tr mi8 re,4 re8 la4 la8 la4 sold8

   %13
   la4 la8 mi'-.(mi-. mi-.) fad-.(fad-. fad-.) mi-.(mi-. mi-.)\mbreak
   fad-.(fad-. fad-.) mi-.(mi-. mi-.) fad-.(fad-. fad-.) r4 r8
   r2. r4 r8 mi'-.\p(mi-. mi-.)

   %16
   si-.(si-. si-.) si-.(si-. si-.) dod-.(dod-. dod-.) dod-.(dod-. dod-.)
   dod-.(dod-. dod-.) dod-.(dod-. dod-.) dod-.(dod-. dod-.) si-.(si-. si-.)\mbreak
   dod-.(dod-. dod-.)  re-.(re-. re-.) mi-.(mi-. mi-.) fad-.(fad-. fad-.)

   %19
   dod-.(dod-. dod-.) si-.(si-. si-.) dod16 mi re dod si la mi8 si'4\tr
   la16\f(dod) mi8 la sold16(la) si8 re, dod\p(mi la) sold16. la32 si8 re,
   dod re mi fad sold4\tr la8 la,  re\noBeam dod16. si32 \grace dod16 si8.[la16]

   %22
   la4. la,4\p la8\mbreak la4 la8 la4 la8
   la-. (la-. la-.) la-. (la-. la-.) la-. (la-. la-.) la-. (la-. la-.)
   la-. (la-. la-.) la-. (la-. la-.) la4 re8 r4 r8

   %25
   R1.*2
   dod'8-.(dod-. dod-.) dod-.(dod-. dod-.)  re-.(re-. re-.)  re-.(re-. re-.)
   dod-.(dod-. dod-.)  re-.(re-. re-.)  re-.(re-. re-.) dod-.(dod-. dod-.)

   %29
   re-.(re-. re-.) dod-.(dod-. dod-.) re-.(re-. re-.) dod-.(dod-. dod-.)
   fad, sol la si dod4\tr\mbreak re8 re, re'~re dod4\tr
   re4. r4 r8 r2.

   %32
   r8 re-.\p(re-.) dod-.(dod-. dod-.)  re-.(re-. re-.) dod-.(dod-. dod-.)
   re-.(re-. re-.) dod-.(dod-. dod-.) fad, sol la si dod4\tr
   re8 re, re'~re dod4\tr  fad8 sol la si dod4\tr

   %35
   re re,8 re dod4\tr \mbreak \once\slurDashed re16 \f (fad) la8 re dod16(si) la8 sol
   fad\p(la re) dod16(si) la8 sol fad sol la si dod4\tr
   re8 re,  sol fad mi4\tr re8  fad16\p(mi) fad(mi) re4.~

   %38
   re8 fad16(mi) fad(mi) re8_\markup {[\musicglyph #"f"]} mi4\tr fad8 sol la si dod4
   re8 re, sol fad16.[ mi32] mi4\tr re4. r4 r8
   \key fa\major
   re,8 dod re

   %41
   mi la, re
   la la la
   la sib4\tr

   %44
   la8 la dod
   re dod? sib
   la la r16\fermata dod

   %47
   re8 dod? si
   la r r\fermata
   do'16\p do do do do do

   %50
   re re re re re re
   do do do do do do\mbreak
   re re re re re re

   %53
   re re re re re re
   mi mi mi mi mi mi
   re re re re re re

   %56
   mi mi mi mi mi mi
   mi mi mi mi mi mi
   fa fa fa fa fa fa

   %59
   mi mi mi mi mi mi
   fa fa fa fa fa fa
   mi mi mi mi mi mi

   %62
   fa do do do do do
   do do do do do do
   do do do do do do

   %65
   do do do do do do
   do8  r r
   R4.

}

vlIIn = \relative dod'' {
   \key re\major

   re4 mi8
   fad8. sol16 fad8 fad la16 fad la fad sol4\tr fad8 fad,4 mi8
   re4. r4 r8 r2.
   r4 r8 fad'8 la fad mi sol mi re fad re

   %4
   re4\tr dod8 r4 r8 r2.
   r4 r8 dod(mi sol)\mbreak fad la re dod16 si la8 sol
   fad la re dod16 si la8 sol fad sol la si dod4\tr

   %7
   re8 re, sol fad mi4\tr fad8\f sol la si dod4\tr
   re8 re, sol fad16. mi32 mi4\tr re4. r4 r8
   re,4\p re8 re4 re8 re4 re8 fad4 mi8\mbreak

   %10
   re4 re8 re4 re8 re4 re8 re4 re8
   la4 re8 fad 'la16(fad) la(fad) mi8 sol mi re fad16(re) fad(re)
   re4\tr dod8 re,4 re8 la4 la8 la4 sold8

   %13
   la4 la8 dod-.(dod-. dod-.) re-.(re-. re-.) dod-.(dod-. dod-.) \mbreak
   re-.(re-. re-.) mi-.(mi-. mi-.) fad-.(fad-. fad-.) r4 r8
   r2. r4 r8 la-._\markup {[\musicglyph #"p"]} (la-. la-.)

   %16
   la-.(la-. la-.) sold-. (sold-. sold-.) la-.(la-. la-.) la-.(la-. la-.)
   la-.(la-. la-.) la-.(la-. la-.) la-.(la-. la-.) mi'-. (mi-. mi-.)\mbreak
   mi-. (mi-. mi-.) sold-.(sold-. sold-.) la-.(la-. la-.) la,-.(la-. la-.)

   %19
   la-.(la-. la-.) sold-. (sold-. sold-.) dod16 mi re dod si la mi8 si'4\tr
   la16\f(dod) mi8 la sold16(la) si8 re, dod\p(mi la) sold16. la32 si8 re,
   dod re mi fad sold4\tr la8 la,  re\noBeam dod16. si32 \grace dod16 si8.[la16]

   %22
   la4. la,4\p la8\mbreak la4 la8 la4 la8
   la-. (la-. la-.) la-. (la-. la-.) la-. (la-. la-.) la-. (la-. la-.)
   la-. (la-. la-.) la-. (la-. la-.) la4 re8 r4 r8

   %25
   R1.*2
   mi8-.(mi-. mi-.)  mi-.(mi-. mi-.) re-.(re-. re-.)  mi-.(mi-. mi-.)
   mi-.(mi-. mi-.) re-.(re-. re-.)  mi-.(mi-. mi-.) mi-.(mi-. mi-.)

   %29
   fad-.(fad-. fad-.) mi-.(mi-. mi-.) fad-.(fad-. fad-.) mi-.(mi-. mi-.)
   fad sol la si dod4\tr\mbreak re8 re, re'~re dod4\tr
   re4. r4 r8 r2.

   %32
   r8 fad,\p-.(fad-.) mi-.(mi-. mi-.) fad-.(fad-. fad-.) mi-.(mi-. mi-.)
   fad-. (fad-. fad-.) mi-.(mi-. mi-.) fad sol la si dod4\tr
   re8 re, re'~re dod4\tr  fad8 sol la si dod4\tr

   %35
   re re,8 re dod4\tr \mbreak \once\slurDashed re16 \f (fad) la8 re dod16(si) la8 sol
   fad\p(la re) dod16(si) la8 sol fad sol la si dod4\tr
   re8 \once\tieDashed re,4~ re8 dod4\tr re8  fad16\p(mi) fad(mi) re4.~

   %38
   re8 fad16(mi) fad(mi) re8_\markup {[\musicglyph #"f"]} mi4\tr fad8 sol la si dod4
   re8 re,4~ re8 dod4\tr re4. r4 r8
   \key fa\major
   re,8 dod re

   %41
   mi la, re
   la la la
   la sib4\tr

   %44
   la8 la dod
   re dod? sib
   la la r16\fermata dod

   %47
   re8 dod? si
   la r r\fermata
   fa'16\p fa fa fa fa fa

   %50
   fa fa fa fa fa fa
   fa fa fa fa fa fa\mbreak
   fa fa fa fa fa fa

   %53
   sol sol sol sol sol sol
   sol sol sol sol sol sol
   sol sol sol sol sol sol

   %56
   sol sol sol sol sol sol
   sol sol sol sol sol sol
   lab lab lab lab lab lab

   %59
   sol sol sol sol sol sol
   lab lab lab lab lab lab
   sol sol sol sol sol sol

   %62
   la! la la la la la
   la la la la la la
   la la la la la la

   %65
   la la la la la la
   la8 r r
   R4.

}

vlan = \relative dod' {
   \key re\major

   la'4 sol8
   fad4 re8 re fad re sol,4 re'8 fad,4 mi8
   re4. r4 r8 r2.
   r4 r8 re'4 re8 mi4 mi8 la,4 si8

   %4
   la4 la8 r4 r8 r2.
   r4 r8 mi' dod mi\mbreak re4 fad8 mi dod mi
   re4 fad8 mi dod mi fad mi re si' la sol

   %7
   fad4 si8 la4 sol8 fad mi re re sol mi
   la fad si la sol4\tr fad4. fad,4 mi8
   re4\p re8 re4 re8 re4 re8 fad4 mi8\mbreak

   %10
   re4 re8 re4 re8 re4 re8 re4 re8
   la'4 mi8 re' fad re mi dod mi fad4 si8
   la4 la,8 re4 re,8 la'4 la8 la4 sold8

   %13
   la4 la8 dod-.(dod-. dod-.) re-.(re-. re-.) dod-.(dod-. dod-.)\mbreak
   re-.(re-. re-.)  mi-.(mi-. mi-.) fad-.(fad-. fad-.) r4 r8
   r2. r4 r8 dod-._\markup {[\musicglyph #"p"]} (dod-. dod-.)

   %16
   re-.(re-. re-.) mi-.(mi-. mi-.)  la-.(la-. la-.) sold-.(sold-. sold-.)
   fad-.(fad-. fad-.) mi-.(mi-. mi-.) fad-.(fad-. fad-.)  sold,-.(sold-. sold-.)\mbreak
   la-.(la-. la-.)  si-.(si-. si-.) la-.(la-. la-.) re-.(re-. re-.)

   %19
   mi-.(mi-. mi-.) mi-.(mi-. mi-.) mi la fad mi re4\tr
   dod8\f-.(dod-. dod-.) si sold'4\tr la8_\markup {[\musicglyph #"p"]} dod, dod si sold'4\tr
   la8 sold mi la, re si mi dod fad mi re4\tr

   %22
   dod4. la4\p la8\mbreak la4 la8 la4 la8
   la-.(la-. la-.)  la-.(la-. la-.)  la-.(la-. la-.)  la-.(la-. la-.)
   la-.(la-. la-.)  la-.(la-. la-.) la4 re,8 r4 r8

   %25
   R1.*2
   la'8-.(la-. la-.)  la'-.(la-. la-.)  la-.(la-. la-.) sol-.(sol-. sol-.)
   sol-.(sol-. sol-.) fad-.(fad-. fad-.) mi-.(mi-. mi-.)  la,-.(la-. la-.)

   %29
   re-.(re-. re-.)  la-.(la-. la-.) re-.(re-. re-.)  la-.(la-. la-.)
   fad' mi re re sol mi\mbreak la fad si la sol4\tr
   fad4. r4 r8 r2.

   %32
   r8 la,-._\markup {[\musicglyph #"p"]} (la-.) la-.(la-. la-.)  la-.(la-. la-.)  la-.(la-. la-.)
   la-.(la-. la-.)   la-.(la-. la-.) fad' mi re re mi4\tr
   la8 fad si la sol4\tr  fad8 mi re re mi4\tr

   %35
   la8 fad si la sol4\tr \mbreak fad8\f-.(fad-. fad-.) mi dod mi
   re\p fad fad mi dod mi fad mi re re mi4\tr
   la8 fad si la sol4 fad8 la_\markup {[\musicglyph #"p"]} fad fad la fad

   %38
   fad re fad la\f sol4\tr fad8 mi re re mi4\tr
   la8 fad si la sol4\tr fad4. r4 r8
   \key fa\major
   re8 dod re

   %41
   mi la, re
   la la la
   la sib4\tr

   %44
   la8 la dod
   re dod? sib
   la la r16\fermata dod

   %47
   re8 dod? si
   la r r\fermata

   %49
   la8-.\p(la-. la-.)
   sib-.(sib-. sib-.)
   la-.(la-. la-.)\mbreak

   %52
   sib-.(sib-. sib-.)
   si-.(si-. si-.)
   do-.(do-. do-.)

   %55
   si-.(si-. si-.)
   do-.(do-. do-.)
   do-.(do-. do-.)

   %58
   do-.(do-. do-.)
   do-.(do-. do-.)
   do-.(do-. do-.)

   %61
   do-.(do-. do-.)
   fa-.(fa-. fa-.)
   mib-.(mib-. mib-.)

   %64
   mib-.(mib-. mib-.)
   mib\f-.(mib-. mib-.)
   mi! r r

   %67
   R4.

}

vocen = \relative dod' {
   \key re\major
   \autoBeamOff

   r4 r8
   R1.*7
   r2. r4 r8 fad4 sol8
   la8. si16[la8] la4 re8 si4 la8 fad4 sol8\mbreak

   %10
   la8. si16 la8 la4 re8 si4 la8 la4 re8
   \grace la16 sol4\tr fad8 r4 r8 r2.
   r4 r8 la[re] la8 sol[si] sol8 fad [re'] fad,8

   %13
   fad4 mi8 la4 la8 la8.\tr[sold16] la8 la16.[si32 dod8] si\mbreak
   la8.[sold16] la8 la16.[si32 dod8] si la[sold] la mi4 mi8
   fad8.[sold16] fad8 re'4 fad,8 fad4\tr mi8 la4 mi8

   %16
   fad[re'] dod si[la] sold la4.~la8 [dod16 si dod si]
   la4.\tr ~la8[ dod16 si dod si] la8[ la8.\tr sold32 la] mi8 [si'8.\tr la32 (si)]\mbreak
   mi,8[dod'8.si32 dod] re,4 re'8 dod4 si16[dod] re8[dod] si

   %19
   la4. si dod16[mi re dod si la] mi8 si'4\tr
   la4. r4 r8 r2.
   R1.

   %22
   r4 r8 la4 mi8\mbreak la8.  dod32 [si la8] la4 mi8
   fad4\tr mi8 la4 mi8 la dod16 [si] la8 la4 mi8
   fad4\tr mi8  mi4 la8 sol4\tr fad8 r4 r8

   %25
   r4 r8 la si16[la si la] sol8 la16[sol] la[sol] fad8[re'] fad,
   mi16[re] mi4 la8 si16[la si la]\mbreak sol8 la16[sol] la[sol] fad8[re'] fad,
   mi16^\p[re] mi4 la la8 sib8. dod16 sib8 sib4 sib8

   %28
   la8.[sol16] la8 la4 re8 sol,8.[fad16] sol8 \grace si8 la4 sol8
   fad[la] re dod16[si la8] sol fad[la re] dod16[si la8 sol]
   fad[sol la] si dod4\tr\mbreak re8[re,] sol fad mi4\tr

   %31
   re4.~re8[fad16 mi fad mi] re4.\tr~re8[la'16 fad sol mi]
   re8 re'4 dod16[si la8] sol fad[la] re dod16[si la8] sol
   fad[la] re dod16[si la8] sol fad[sol] la si dod4\tr

   %34
   re8[re,] sol fad mi4\tr  fad8[sol la] si dod4\tr
   re8[re,] sol fad mi4\tr\mbreak re4. r4 r8
   R1.*4

   %40
   \key fa\major
   la'8 la8.[sib16]\mbreak
   \grace la16 sol4 fa8
   mi16 [la sol mi fa re]

   %43
   dod16.[re32] re8.\tr[dod32(re)]
   mi16[sold] \grace sib16 la4
   fa8[mi] re

   %46
   la' mi r16\fermata la
   fa8[mi] re
   dod16[sib] la8 r\fermata

   %49
   r do'? fa,
   fa8.\tr[mi16] fa8
   fa do'32[sib la16] sib32[la sol16]

   %52
   fa8.\tr[mi16] fa8
   r re' sol,
   sol[fad] sol

   %55
   sol re'[sol,]
   sol16.[fad32] sol4
   sib8[lab] sol

   %58
   lab32[sib do16] do4\tr
   sol8\tr[lab sib]
   lab32[(sib do16)] do4

   %61
   sol8\tr[la! sib]
   la8 la4\tr
   la8 la8.\tr [sold32(la)]

   %64
   la8 la la
   la4.~
   la8[si8.\tr] la16

   %67
   la4 r8

}

testo = \lyricmode {

    Il pas -- tor  se torna_aprile _ _ _ non  ram -- menta _ i giorni_algenti_i _ _ _ giorni_al - genti _
    dall' ovile _ all' ombre_usate _ _ _ riconduce _ _ i bianchi_ar - menti_i _ bianchi_ar - menti, _
    e l'avene _ _ abbandonate _ _ _ fa di nuovo _ risonar - - - - - -
    di nuo - - - vo risonar - -  riso - nar.
    Il pas -- tor  se torna_aprile _ _ _ non  ram -- menta _ i giorni_algen - - ti_i giorni_al - genti _
    dall' ovile _ all' ombre _ u -- sate _ riconduce _ _ i bianchi _ ar -- menti _ e
    l'avene _ _ abbando - - nate _ abbandonate _ _ _ fa di nuovo _ risonar - - - - fa di nuovo _ risonar - - - -
    e l'avene _ _ abbando - - nate _ abbandonate _ _ _ fa di nuovo _ risonar - - fa di nuovo _ risonar. - -
    Ma il nocchier _ placa - to_il vento _ più non teme  _ o si scolora _ _  ma con -- tento
    in su la  - prora _ ma con -- tento in su la prora _ va can -- tan - - - - - - do va can -- tando _
    in faccia al mar.

}

bcn = \relative do {
   \key re\major

   fad4 mi8
   re4 re8 re4 re8 re4 re8 r4 r8
   R1.
   r4 r8 re4 re8 re4 dod8 re4 sold,8

   %4
   la4 la8 r4 r8 r2.
   r4 r8 la-.(la-. la-.)\mbreak re-.(re-. re-.)  la-.(la-. la-.)
   re-.(re-. re-.)  la-.(la-. la-.) re mi fad sol4 la8

   %7
   si4 sol8 la4 la,8 re_\markup {[\musicglyph #"f"]} mi fad sol mi la
   fad si sol la la,4 re4. r4 r8
   R1.*2

   %11
   r4 r8 re4\p re8 la4 la8 re4 sold,8
   la4 la8 r4 r8 r2.
   R1.\mbreak

   %14
   r2. r4 r8  la-.\p(la-. la-.)
   la-.(la-. la-.)  la-.(la-. la-.) la-.(la-. la-.) dod-. (dod-. dod-.)
   re-.(re-. re-.) mi-.(mi-. mi-.)  la-.(la-. la-.) sold-.(sold-. sold-.)

   %17
   fad-.(fad-. fad-.) mi-.(mi-. mi-.) fad-.(fad-. fad-.)  sold,-.(sold-. sold-.)\mbreak
   la-.(la-. la-.)  si-.(si-. si-.) la-.(la-. la-.) re-.(re-. re-.)
   mi-.(mi-. mi-.) mi-.(mi-. mi-.) la fad re mi mi,4

   %20
   la8-.\f(la-. la-.) mi'-.(mi-. mi-.) la,-._\markup {[\musicglyph #"p"]} (la-. la-.) mi'-.(mi-. mi-.)
   la, si dod re si mi dod fad re mi4 mi,8
   la4. r4 r8 r2.\mbreak

   %23
   R1.*4
   la8-.\p(la-. la-.) la-.(la-. la-.) la-.(la-. la-.) sol-.(sol-. sol-.)
   sol-.(sol-. sol-.) fad-.(fad-. fad-.) mi-.(mi-. mi-.) la-.(la-. la-.)

   %29
   re-.(re-. re-.) la-.(la-. la-.) re-.(re-. re-.) la-.(la-. la-.)
   re mi fad sol mi la\mbreak fad si sol la la,4
   re8-. (re-. re-.) dod-.(dod-. dod-.) si-.(si-. si-.) la-.(la-. la-.)

   %32
   si fad re la'-.(la-. la-.) re-.(re-. re-.) la-.(la-. la-.)
   re-.(re-. re-.) la-.(la-. la-.) re mi fad sol mi la
   fad si sol la la, la re mi fad sol mi la

   %35
   fad si sol la la,4\mbreak re8-.(re-. re-.) la-.(la-. la-.)
   re-.(re-. re-.) la-.(la-. la-.) re mi fad sol mi la
   fad si sol la la,4 re8 re'\p-. re-. dod-.(dod-. dod-.)

   %38
   si-.(si-. si-.) fad^\f  mi4 re8 mi fad sol mi la
   fad sol sol la la,4 re,4. r4 r8

   \key fa\major
   R4.*9

   %49
   la'8-.\p(la-. la-.)
   sib-.(sib-. sib-.)
   la-.(la-. la-.)\mbreak

   %52
   sib-.(sib-. sib-.)
   si-.(si-. si-.)
   do-.(do-. do-.)

   %55
   si-.(si-. si-.)
   do-.(do-. do-.)
   do-.(do-. do-.)

   %58
   do-.(do-. do-.)
   do-.(do-. do-.)
   do-.(do-. do-.)

   %61
   do-.(do-. do-.)
   fa-.(fa-. fa-.)
   mib-.(mib-. mib-.)

   %64
   mib-.(mib-. mib-.)
   mib\f-.(mib-. mib-.)
   mi!-.\fermata (mi-. mi-.)

   %67
   la,4 r8

}

bfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   <6>4 <6>8
   s2. <6 4>4 <5>8 s4.
   s1.
   s2. <2>
   s1.*7
   s2. <7>4. s4 <7>8
   s1.*8
   s4. <_+> s <_+>
   s <6+> <6> <6 4>4 <_+>8
   s1.*5
   s2. <2->4. <_->
   <4+ 2> <6> <7> <_+>
   s1.*9
   s4. <6> s2.
   s1.
   s4.*11
   <6>4.
   s
   <6>
   <_!>
   s
   <_!>
   <7>
   <6- 4>
   <_!>
   <6- 4>
   <_!>
   <_!>
   <6 4>
   s
   s
   <6 4>8 <5 4+>

}

forma = {

   \time 12/8
   \tempo 2. = 33
   \partial 4. s4.
   s1.*39
   \bar "||"\break
   \mark\markup\huge "[2.] Andantino"
   \time 3/8
   \tempo 4. = 55
   s4.*28
   \bar "||"
   \mark\markup \smaller"D. C."

}

crI = {
   \global
   <<\crIn\forma>>
}

crII = {
   \global
   <<\crIIn\forma>>
}

flI = {
   \global
   <<\flIn\forma>>
}

flII = {
   \global
   <<\flIIn\forma>>
}

vlI = {
   \global
   <<\vlIn\forma>>
}

vlII = {
   \global
   <<\vlIIn\forma>>
}

vla = {
   \global
   \clef alto
   <<\vlan\forma>>
}

voce = {
   \new Voice = "pastor"
   \global
   \clef alto
   <<\vocen\forma>>
}

bc = {
   \global
   \clef bass
   <<\bcn\forma\bfn>>

}
#(set-global-staff-size 16)

\pointAndClickOff

\paper  {

    systems-per-page = #2
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge {"[1.] Moderato"}

\score {

            \new ChoirStaff 	\with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
        } <<
                \new PianoStaff <<
                    \new Staff <<
                        \set Staff.instrumentName = \markup\center-column {"Cor[no]""da Caccia [I]"}
                        \set Staff.midiInstrument = "french horn"
                        \crI
                    >>
                    \new Staff <<
                        \set Staff.instrumentName = \markup\center-column {"Cor[no]""da Caccia [II]"}
                        \set Staff.midiInstrument = "french horn"
                        \crII
                    >>
                >>
                \new PianoStaff <<
                    \new Staff <<
                        \set Staff.instrumentName = \markup\center-column {"Traverso [I]"}
                        \set Staff.midiInstrument = "flute"
                        \flI
                    >>
                    \new Staff <<
                        \set Staff.instrumentName = \markup\center-column {"Traverso [II]"}
                        \set Staff.midiInstrument = "flute"
                        \flII
                    >>
                >>
                \new PianoStaff <<
                    \new Staff <<
                        \set Staff.instrumentName = \markup\center-column {"V[iolino I]"}
                        \set Staff.midiInstrument = "violin"
                        \vlI
                    >>
                    \new Staff <<
                        \set Staff.instrumentName = \markup\center-column {"V[iolino II]"}
                        \set Staff.midiInstrument = "violin"
                        \vlII
                    >>
                >>

                \new Staff<<
                        \set Staff.instrumentName = \markup\center-column {"[Viola]"}
                    \set Staff.midiInstrument = "viola"
                    \vla
                >>
                \new Staff <<
                    \set Staff.midiInstrument = "voice oohs"
                    \voce
                    \new Lyrics \lyricsto "pastor" \testo

                >>

                \new Staff <<
                        \set Staff.instrumentName = \markup\center-column {"[Basso]"}
                    \set Staff.midiInstrument = "cello"
                    \bc
                >>
            >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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