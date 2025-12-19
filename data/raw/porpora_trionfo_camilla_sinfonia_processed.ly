\language "italiano"


acc = \once \override Stem #'stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript #'padding = #3

padall = \override TextScript #'padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \set tupletSpannerDuration = #(ly:make-moment 1 8)

terzinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

sestine = \set tupletSpannerDuration = #(ly:make-moment 1 2)

sestinequarto = \set tupletSpannerDuration = #(ly:make-moment 1 4)

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber #'transparent = ##t

con = \override TupletNumber #'transparent = ##f

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
\version "2.20.0"


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza
}


IcrIn = %\transpose do re, {
		 \relative do'' {

	r16 mi
	mi4 r8 r16\fermata re re4 r8 r16\fermata do
	do4 r do r
	do r r2

	%4
	do2 mi
	sol4 r r2
	sol8 sol sol sol fa2\tr \mbreak

	%7
	mi4 r r2
	sol8\p mi mi mi re re re re
	mi4 r mi8\f mi16 mi mi8 mi

	%10
	sol4 r re8[re16 re re8 re]
	mi2 sol8[sol16 sol sol8 sol]
	la2 fa

	%13
	sol mi\mbreak
	re1
	do8 do16 do do8 do mi[mi16 mi mi8 mi]

	%16
	sol1
	re8 re re re re[re16 re re8 re]
	mi2 sol

	%19
	sol1
	la\mbreak
	sol4 r r2

	%22
	R1*4
	re8[re16 re re8 re] mi2\tr \p
	re8[re16 re re8 re] fad2\mbreak

	%28
	sol1~
	sol2 fa
	mi4 r r2

	%31
	sol2 sol8[sol16 sol sol8 sol]
	mi16 sol fa sol mi sol fa sol mi sol fa sol mi sol fa mi
	re8[re16 re re8 re] sol[sol16 sol sol8 sol]

	%34
	la2 la8[la16 la la8 la]\mbreak
	fa8[fa16 fa fa8 fa] fa fa fa fa
	sol4 r sol r

	%37
	fa r fa r
	mi r mi r
	fa r r2

	%40
	R1\mbreak
	fa8 fa fa fa sol sol sol sol
	fa fa fa fa mi mi mi mi

	%43
	fa4 r r2
	R1
	fa2 fa8[fa16 fa fa8 fa]

	%46
	sol2 re8[re16 re re8 re]
	mi do mi sol\mbreak sol [re16 re re8 re]
	mi do mi sol sol re16 re re8 re

	%49
	mi sol16 sol sol8 sol sol sol16 sol sol8 sol
	mi mi16 mi mi8 mi mi mi16 mi mi8 mi
	do do16 do do8 do mi mi16 mi mi8 mi

	%52
	re2 sol
	sol la~\mbreak
	la sol

	%55
	la1
	sol
	fa

	%58
	mi
	re8 re re re re re re re
	do mi do sol do mi do sol\mbreak

	%61
	sol'2 do
	sol sol4\staccatissimo fa\staccatissimo
	do8 mi do sol do mi do sol

	%64
	sol'4\staccatissimo fa\staccatissimo mi8 do16 do do8 mi,16 mi
	mi4 mi mi  r

}

%}


IcrIIn = %\transpose do re, {
		 \relative do'' {

	r16 do
	do4 r8 r16\fermata sol sol4 r8 r16\fermata mi
	mi4 r mi r
	mi r r2

	%4
	mi2 sol
	do4 r r2
	mi8 mi mi mi re re sol, sol\mbreak

	%7
	do4 r r2
	mi8\p do do do sol sol sol sol
	do4 r do8\f do16 do do8 do

	%10
	re4 r sol,8[sol16 sol sol8 sol]
	do2 mi8[mi16 mi mi8 mi]
	fa2 do~

	%13
	do do\mbreak
	sol1
	mi8[mi16 mi mi8 mi] do'[do16 do do8 do]

	%16
	\parenthesize sol1
	sol8 sol sol sol sol[sol16 sol sol8 sol]
	do2 mi

	%19
	re1
	re\mbreak
	sol,4 r r2

	%22
	R1*4
	sol8[sol16 sol sol8 sol] do2\p
	sol8[sol16 sol sol8 sol] re'2\mbreak

	%28
	re1
	do2 re
	do4 r r2

	%31
	re re8[re16 re re8 re]
	do16 mi re mi do mi re mi do mi re mi do mi re do
	sol8[sol16 sol sol8 sol] re'[re16 re re8 re]

	%34
	mi2 mi8[mi16 mi mi8 mi]\mbreak
	re8[re16 re re8 re] re re re re
	re4 r mi r

	%37
	fa r re r
	mi r mi r
	re r r2

	%40
	R1\mbreak
	re8 re re re sol, sol sol sol
	re' re re re mi mi mi mi

	%43
	re4 r r2
	R1
	re2 re8[re16 re re8 re]

	%46
	re2 sol,8[sol16 sol sol8 sol]
	do sol mi do\mbreak sol'[sol16 sol sol8 sol]
	do sol mi do sol' sol16 sol sol8 sol

	%49
	do do16 do do8 do sol' sol16 sol sol8 sol
	do, do16 do do8 do mi mi16 mi mi8 mi
	do do16 do do8 do do do16 do do8 do

	%52
	re2 re
	mi mi\mbreak
	fad sol

	%55
	mi fa
	re mi
	re1

	%58
	do
	re8 re re re sol, sol sol sol
	do mi do sol do mi do sol\mbreak

	%61
	mi'2 sol
	mi do4\staccatissimo sol\staccatissimo
	do8 mi do sol do mi do sol

	%64
	mi'4\staccatissimo re\staccatissimo do8 mi,16 mi mi8 do16 do
	do4 do do r

}
%}

IobIn = \relative do'' {

    r16 fad
    fad4 r8 r16\fermata mi mi4 r8 r16\fermata \tuplet 3/2 { la,32(si dod) }
    re8 fad re la re fad re la
    fad8.\tr mi16 re mi fad sol la8 sol16 fad sol la si dod

    %4
    re la si dod re mi fad sol la fad mi fad sol la si dod
    re8 la la la si si si si
    la la la la sol sol sol sol\mbreak

    %7
    fad4 la si2\p
    la sol\tr
    fad4\f fad\staccatissimo fad fad\staccatissimo

    %10
    mi8 la mi[dod] mi la mi[dod]
    fad4\staccatissimo fad\staccatissimo fad\staccatissimo la
    si8 sol si[sol] sol2\tr

    %13
    la8 fad la fad fad2\tr \mbreak
    sol8 mi sol mi sol mi sol mi
    fad la, la la fad' la, la la

    %16
    mi' la mi dod mi la mi dod
    dod mi dod la dod mi dod la
    fad' la la la la2

    %19
    mi8 la la la la2
    re,8 sold sold sold sold2\mbreak
    la8 dod la mi la dod la mi

    %22
    dod8.\tr si16 la si dod re mi8 re16 dod re mi fad sold
    la dod si la sold fad mi re dod la' sold fad mi re dod si
    la8 mi' mi mi fad2

    %25
    mi8 mi mi mi re2
    dod4 r r2
    R1\mbreak

    %28
    la8 mi' mi mi la, mi' mi mi
    fad re re re sol sol sol sol
    fad16 la sol la fad la sol la fad la sol la fad la sol fad

    %31
    mi2 mi8[mi16 mi mi8 la]
    fad4 r r2
    mi2 mi8[mi16 mi mi8 la]

    %34
    fad2 fad8[fad16 fad fad8 si]\mbreak
    sol8[sol16 sol sol8 sol] sol sol sol sol
    la4 r la r

    %37
    sol r sol r
    fad r fad r
    mi8 sol sol sol la la la la

    %40
    sol sol sol sol fad fad fad fad\mbreak
    mi4 r r2
    R1

    %43
    mi8 sol mi si mi sol mi si
    \grace la8 sol8.\tr fad16 mi fad sol la si8 la16 sol la si do? red
    mi8 sol mi si sol' si sol mi

    %46
    mi4 mi8 mi mi mi mi mi
    fad16 la sol la fad la sol fad\mbreak mi4 r
    fad16 la sol la fad la sol fad mi8 la mi la

    %49
    fad fad fad fad mi4\staccatissimo la\staccatissimo
    re,8 re re re dod4\staccatissimo fad\staccatissimo
    si,8 si si si la4\staccatissimo re\staccatissimo

    %52
    sol8 sol sol sol sol sol sol sol
    fad4 r r8 si si la\mbreak
    sold2 la~

    %55
    la sol?~
    sol fad
    mi mi\tr

    %58
    fad re
    re dod!\tr
    re8 fad re la re fad re la\mbreak

    %61
    fad4 re' fad la
    re16 la fad re la' fad re la fad'4\staccatissimo mi\staccatissimo
    re16 re fad fad re re la la re re fad fad re re la la

    %64
    fad'4^\staccatissimo mi\staccatissimo fad16 la fad re la fad' re la
    fad8 fad fad fad fad4 r

}

IobIIn = \relative do'' {

    r16 re
    re4 r8 r16\fermata dod dod4 r8 r16\fermata \tuplet 3/2 { la32(si dod) }
    re8 fad re la re fad re la
    fad8.\tr mi16 re mi fad sol la8 sol16 fad sol la si dod

    %4
    re fad, sol la si dod re  mi fad re dod re mi fad sol mi
    fad8 fad fad fad sol sol sol sol
    fad fad fad fad mi mi mi mi\mbreak

    %7
    re4 fad sol2\p
    fad mi\tr
    fad8\f la fad[re] fad la fad[re]

    %10
    mi4 dod mi dod
    fad8 la fad[re] fad la fad[re]
    sol re sol[re] re2\tr

    %13
    fad8 re fad re re2\tr \mbreak
    mi8 dod mi dod mi dod mi dod
    re fad, fad fad re' fad, fad fad

    %16
    dod' mi dod la dod mi dod la
    la dod la mi la dod la mi
    re' fad fad fad fad2

    %19
    mi8 dod dod dod dod2
    re8 si si si si2\tr \mbreak
    la'8 dod la mi la dod la mi

    %22
    dod8.\tr si16 la si dod re mi8 re16 dod re mi fad sold
    la la sold fad mi re dod si la la' sold fad mi re dod si
    la8 dod dod dod re2

    %25
    dod8 dod dod dod si2
    la4 r r2
    R1\mbreak

    %28
    mi8 dod' dod dod mi, dod' dod dod
    la la la re mi mi mi mi
    re16 fad mi fad re fad mi fad re fad mi fad re fad mi re

    %31
    dod2 dod8[dod16 dod dod8 mi]
    re4 r r2
    dod2 dod8[dod16 dod dod8 mi]

    %34
    red2 red8[red16 red red8 fad]\mbreak
    mi[si16 si si8 si] si si si si
    do4 r do r

    %37
    si r si r
    la r la r
    sol8 si si si do do do do

    %40
    si si si si la la la la\mbreak
    sol4 r r2
    R1

    %43
    mi'8 sol mi si mi sol mi si
    \grace la8 sol8.\tr fad16 mi fad sol la si8 la16 sol la si do? red
    mi8 sol mi si mi sol mi si

    %46
    dod!4 dod8 dod dod dod dod dod
    re16 fad mi fad re fad mi re\mbreak dod4 r
    re16 fad mi fad re fad mi re dod8 mi dod mi

    %49
    re re re re dod4\staccatissimo dod\staccatissimo
    si8 si si si la4\staccatissimo la\staccatissimo
    sol8 sol sol sol fad4\staccatissimo fad\staccatissimo

    %52
    mi8 si' si si dod dod dod dod
    re4 r r8 re re re~\mbreak
    re2 dod

    %55
    si si
    la re
    re dod\tr

    %58
    re fad,
    mi mi
    re'8 fad re la re fad re la\mbreak

    %61
    re,4 la' re fad
    la16 fad re la fad' re la fad re'4\staccatissimo dod\staccatissimo
    re16 re fad fad re re la la re re fad fad re re la la

    %64
    re4\staccatissimo dod\staccatissimo re16 fad re la fad re' la fad
    re8 re re re re4 r

}

IvlIn = \relative do'' {

    r16 fad
    <fad la, re,>4 r8 r16\fermata <<{mi <mi dod>4}\\{dod16 la4}>> r8 r16\fermata \tuplet 3/2 { la32(si dod) }
    re8 fad re la re fad re la
    fad8.\tr mi16 re mi fad sol la8 sol16 fad sol la si dod

    %4
    re la si dod re mi fad sol la fad mi fad sol la si dod
    re fad, la fad la fad la fad si sol si sol si sol si sol
    la fad la fad la fad la fad sol mi sol mi sol mi sol mi\mbreak

    %7
    fad re fad re fad re fad re si'\p sol si sol si sol si sol
    la fad la fad la fad la fad sol mi sol mi sol mi sol mi
    <fad la, re,>4\staccatissimo\f <fad la, re,> <fad la, re,>\staccatissimo <fad la, re,>

    %10
    dod16 mi la mi dod mi la mi dod mi la mi dod mi la mi
    <fad la, re,>4\staccatissimo  <fad la, re,>4\staccatissimo  <fad la, re,>4\staccatissimo  <fad la, re,>4\staccatissimo
    re16 sol si sol re sol si sol re sol si sol re sol si sol

    %13
    re fad la fad re fad la fad re fad la fad re fad la fad\mbreak
    dod mi la mi dod mi la mi dod mi la mi dod mi la mi
    fad fad, la fad la fad la fad fad' fad, la fad la fad la fad

    %16
    dod' mi la mi dod mi la mi dod mi la mi dod mi la mi
    dod mi la mi dod mi la mi dod mi la mi dod mi la mi
    fad la re la fad la re la fad la re la fad la re la

    %19
    mi la dod la mi la dod la mi la dod la mi la dod la
    re, sold si sold re sold si sold re sold si sold re sold si sold\mbreak
    la8 dod la mi la dod la mi

    %22
    dod8.\tr si16 la si dod re mi8 re16 dod re mi fad sold
    la dod si la sold fad mi re dod la' sold fad mi re dod si
    la dod mi dod mi dod mi dod fad re fad re fad re fad re

    %25
    mi dod mi dod mi dod mi dod mi si mi si mi si mi si
    dod mi, dod' mi, dod' mi, dod' mi, re'\p fad, re' fad, re' fad, re' fad,
    dod' mi, dod' mi, dod' mi, dod' mi, si 'sold si sold si sold si sold\mbreak

    %28
    la\f dod mi dod mi dod mi dod mi dod mi dod mi dod mi dod
    fad re fad re fad re fad re sol mi sol mi sol mi sol mi
    fad la sol la fad la sol la fad la sol la fad la sol fad

    %31
    mi mi la mi dod mi la mi dod mi la mi dod mi la mi
    fad la sol la fad la sol la fad la sol la fad la sol fad
    mi mi la mi dod mi la mi dod mi la mi dod mi la mi

    %34
    red fad si fad red fad si fad red fad si fad red fad si fad\mbreak
    sol si sol mi sol si sol mi sol si sol mi sol si sol mi
    do mi re do re mi fad! sol la si la sol fad mi re do

    %37
    si re do si do re mi fad sol la sol fad mi re do si
    la do si la si do red mi fad sol fad mi red do si la
    sol si sol' si, sol'si, sol' si, la' do, la' do, la' do, la' do,

    %40
    sol' si, sol' si, sol' si, sol' si, fad' la, fad' la, fad' la, fad' la,\mbreak
    sol\p mi si' sol si sol si sol do la do la do la do la
    si sol si sol si sol si sol la fad la fad la fad la fad

    %43
    <<<mi' si>8\f\\{sol, sol' mi si}>> mi sol mi si
    sol8.\tr fad16 mi fad sol la si8 la16 sol la si do? red
    mi si' sol mi mi si' sol mi sol si sol mi sol si sol mi

    %46
    dod! mi la mi dod mi la mi dod mi la mi dod mi la mi
    fad la sol la fad la sol fad\mbreak mi mi la mi dod mi la mi
    fad la sol la fad la sol fad mi mi la mi dod mi la mi

    %49
    fad la re la fad la re la mi la dod la mi la dod la
    re, fad si fad re fad si fad dod fad la fad dod fad la fad
    si, re sol re si re sol si, la re fad re la re fad re

    %52
    si sol' si, sol' si, sol' si, sol' dod, sol' dod, sol' dod, sol' dod, sol'
    re fad re fad re fad re fad re si' re, si' re, si' re, si'\mbreak
    re, sold re sold re sold re sold dod, la' dod, la' dod, la' dod, la'

    %55
    si, la' si, la' si, la' si, la' si, sol' si, sol' si, sol' si, sol'
    la, sol' la, sol' la, sol' la, sol' re fad re fad re fad re fad
    re mi re mi re mi re mi dod mi dod mi dod mi dod mi

    %58
    re fad re fad re fad re fad fad, re' fad, re' fad, re' fad, re'
    mi, re' mi, re' mi, re' mi, re' mi, dod' mi, dod' mi, dod' mi, dod'
    re8 fad re la re fad re la\mbreak

    %61
    fad16 re fad la re fad, la re fad la, re fad la re, fad la
    re la fad re la' fad re la fad'4\staccatissimo mi\staccatissimo
    re16 re fad fad re re la la re re fad fad re re la la

    %64
    <fad' la, re,>4^\staccatissimo <<<mi dod>\staccatissimo\\la,>> fad'16 la fad re la fad' re la
    <fad' la, re,>8 <fad la, re,> <fad la, re,> <fad la, re,> <fad la, re,>4 r

}

IvlIIn = \relative do'' {

    r16 re
    re4 r8 r16\fermata <<{mi mi4}\\{la,16 la4}>> r8 r16\fermata \tuplet 3/2 { la32(si dod) }
    re8 fad re la re fad re la
    fad8.\tr mi16 re mi fad sol la8 sol16 fad sol la si dod

    %4
    re fad, sol la si dod re  mi fad re dod re mi fad sol mi
    fad re fad re fad re fad re sol si, sol' si, sol' si, sol' si,
    fad' re fad re fad re fad re mi dod mi dod mi dod mi dod\mbreak

    %7
    re fad la fad la fad la fad sol\p si, sol' si, sol' si, sol' si,
    fad' re fad re fad re fad re mi dod mi dod mi dod mi dod
    re\f fad la fad re fad la fad re fad la fad re fad la fad

    %10
    <<{<mi dod>4 <mi dod>\staccatissimo <mi dod> <mi dod>\staccatissimo}\\{la, la la la}>>
    re16 fad la fad re fad la fad re fad la fad re fad la fad
    si, re sol re si re sol re  si re sol re si re sol re

    %13
    la re fad re la re fad re la re fad re la re fad re\mbreak
    mi, dod' mi dod mi, dod' mi dod mi, dod' mi dod mi, dod' mi dod
    re re, fad re fad re fad re re' re, fad re fad re fad re

    %16
    mi dod' mi dod mi, dod' mi dod mi, dod' mi dod mi, dod' mi dod
    mi, mi' dod mi mi, mi' dod mi mi, mi' dod mi mi, mi' dod mi
    re fad la fad re fad la fad re fad la fad re fad la fad

    %19
    dod mi la mi dod mi la mi dod mi la mi dod mi la dod,
    si re sold re si re sold re si re sold re si re sold si,\mbreak
    la'8 dod la mi la dod la mi

    %22
    dod8.\tr si16 la si dod re mi8 re16 dod re mi fad sold
    la la sold fad mi re dod si la la' sold fad mi re dod si
    la mi dod' mi, dod' mi, dod' mi, re' fad, re' fad, re' fad, re' fad,

    %25
    dod' la dod la dod la dod la si sold si sold si sold si sold
    la dod mi dod mi dod mi dod fad\p re fad re fad re fad re
    mi dod mi dod mi dod mi dod re si re si re si re si\mbreak

    %28
    dod\f mi, dod' mi, dod' mi, dod' mi, dod' mi, dod' mi, dod' mi, dod' mi,
    re' fad, re' fad, re' fad, re' fad, mi' dod mi dod mi dod mi dod
    re fad mi fad re fad mi fad re fad mi fad re fad mi re

    %31
    la dod mi dod mi, dod' mi dod mi, dod' mi dod mi, dod' mi dod
    re fad mi fad re fad mi fad re fad mi fad re fad mi re
    la dod mi dod mi, dod' mi dod mi, dod' mi dod mi, dod' mi dod

    %34
    fad, red' mi red fad, red' mi red fad, red' mi red fad, red' mi red\mbreak
    mi sol mi si mi sol mi si mi sol mi si mi sol mi si
    la do si la si do re mi fad sol fad  mi re do si la

    %37
    sol si la sol la si do re mi fad mi re do si la sol
    fad la sol fad sol la si do? red mi red do si la sol fad
    mi sol si sol si sol si sol do la do la do la do la

    %40
    si sol si sol si sol si sol la fad la fad la fad la fad\mbreak
    mi\p si' sol' si, sol' si, sol' si, la' do, la' do, la' do, la' do,
    sol' si, sol' si, sol' si, sol' si, fad' la, fad' la, fad' la, fad' la,

    %43
    <<<mi' si>8\f\\{sol, sol' mi si}>> mi sol mi si
    sol8.\tr fad16 mi fad sol la si8 la16 sol la si do? red
    mi sol mi si mi sol mi si mi sol mi si mi sol mi si

    %46
    mi, dod'! mi dod mi, dod' mi dod mi, dod' mi dod mi, dod' mi dod
    re fad mi fad re fad mi re\mbreak dod dod mi dod mi, dod' mi dod
    re fad mi fad re fad mi re dod dod mi dod mi, dod' mi dod

    %49
    re fad la fad re fad la re, dod mi la mi dod mi la dod,
    si re fad re si re fad si, la dod fad dod la dod fad la,
    sol si re si sol si re sol, fad la re la fad la re fad,

    %52
    sol si sol si sol si sol si mi, dod' mi, dod' mi, dod' mi, dod'
    re fad re fad re fad re fad re si' re, si' re, si' re, si'\mbreak
    re, sold re sold re sold re sold dod, la' dod, la' dod, la' dod, la'

    %55
    si, la' si, la' si, la' si, la' si, sol' si, sol' si, sol' si, sol'
    la, sol' la, sol' la, sol' la, sol' re fad re fad re fad re fad
    re mi re mi re mi re mi dod mi dod mi dod mi dod mi

    %58
    re fad re fad re fad re fad fad, re' fad, re' fad, re' fad, re'
    mi, re' mi, re' mi, re' mi, re' mi, dod' mi, dod' mi, dod' mi, dod'
    re8 fad re la re fad re la\mbreak

    %61
    re,16 la re fad la re, fad la re fad, la re fad la, re fad
    la fad re la fad' re la fad re'4\staccatissimo dod\staccatissimo
    re16 re fad fad re re la la re re fad fad re re la la

    %64
    <fad' la, re,>4^\staccatissimo <<<mi dod>\staccatissimo\\la,>> re16 fad re la fad re' la fad
    <<{<la fad>8 < la fad> <la fad> <la fad> <la fad>4}\\{re,8 re re re re4}>> r

}

Ivlan = \relative do' {

    r16 re
    re4 r8 r16 \fermata la la4 r8 r16\fermata \tuplet 3/2 { la32(si dod) }
    re8 fad re la re fad re la
    fad8.\tr mi16 re mi fad sol la8 sol16 fad sol la si dod

    %4
    re4 r r2
    re8 re re re re re re re
    re re re re la la la la\mbreak

    %7
    re re re re re\p re re re
    re re re re la la la la
    re\f re, re' re, re' re, re' re,

    %10
    la'' la, la' la, la' la, la' la,
    re re, re' re, re' re, re' re,
    re' re, re' re, re' re, re' re,

    %13
    re' re, re' re, re' re, re' re,\mbreak
    la'' la, la' la, la' la, la' la,
    re re re re re re re re

    %16
    la' la, la' la, la' la, la' la,
    la' la, la' la, la' la, la' la,
    re re, re' re, re' re, re' re,

    %19
    la'' la, la' la, la' la, la' la,
    mi' mi, mi' mi, mi' mi, mi' mi,\mbreak
    la' dod la mi la dod la mi

    %22
    dod8.\tr si16 la si dod re mi8 re16 dod re mi fad sold
    la4 r r16 la sold fad mi re dod si
    la8 la' la la la la la la

    %25
    la la la la mi mi mi mi
    la, la la la la'\p la la la
    la la la la mi mi mi mi\mbreak

    %28
    la, la'\f la la sol sol sol sol
    fad fad fad fad mi mi mi mi
    re4 r re r

    %31
    la'8 la, la' la, la' la, la' la,
    re4 r re r
    la'8 la, la' la, la' la, la' la,

    %34
    si' si, si' si, si' si, si' si,\mbreak
    mi mi, mi' mi, mi' mi, mi' mi,
    la4 r re r

    %37
    sol r do, r
    fad r si, r
    mi8 mi mi mi mi mi mi mi

    %40
    mi mi mi mi si si si si\mbreak
    mi\p mi mi mi mi mi mi mi
    mi mi mi mi si si si si

    %43
    mi\f sol mi si mi sol mi si
    sol8.\tr fad16 mi fad sol la si8 la16 sol la si do? red
    mi8 mi, mi' mi, mi' mi, mi' mi,

    %46
    la' la, la' la, la' la, la' la,
    re4 r\mbreak la'8 la, la' la,
    re4 r la'8 la, la' la,

    %49
    re re, re' re, la'' la, la' la,
    si' si, si' si, fad' fad, fad' fad,
    sol' sol, sol' sol, re' re, re' re,

    %52
    mi' mi mi mi la, la la la
    re re re re fad fad fad fad\mbreak
    mi si' si si la la la la

    %55
    fad fad fad fad mi mi mi mi
    mi mi mi mi la, la' la la
    si si si si la la la la

    %58
    la la la la si si si si
    si, si si si la la la la
    re fad re la re fad re la\mbreak

    %61
    re re, re' re, re' re, re' re,
    re' re, re' re, la''4\staccatissimo la,\staccatissimo
    re8 fad re la re fad re la

    %64
    re4\staccatissimo la\staccatissimo re8 re16 re re8 re16 re
    re8 re re re re4 r

}

Ibcn = \relative do {

    r16 re
    re4 r8 r16 \fermata la la4 r8 r16\fermata \tuplet 3/2 { la32(si dod) }
    re8 fad re la re fad re la
    fad8.\tr mi16 re mi fad sol la8 sol16 fad sol la si dod

    %4
    re4 r r2
    re8 re re re re re re re
    re re re re la la la la\mbreak

    %7
    re re re re re\p re re re
    re re re re la la la la
    re\f re, re' re, re' re, re' re,

    %10
    la'' la, la' la, la' la, la' la,
    re re, re' re, re' re, re' re,
    re' re, re' re, re' re, re' re,

    %13
    re' re, re' re, re' re, re' re,\mbreak
    la'' la, la' la, la' la, la' la,
    re re re re re re re re

    %16
    la' la, la' la, la' la, la' la,
    la' la, la' la, la' la, la' la,
    re re, re' re, re' re, re' re,

    %19
    la'' la, la' la, la' la, la' la,
    mi' mi, mi' mi, mi' mi, mi' mi,\mbreak
    la' dod la mi la dod la mi

    %22
    dod8.\tr si16 la si dod re mi8 re16 dod re mi fad sold
    la4 r r16 la sold fad mi re dod si
    la8 la' la la la la la la

    %25
    la la la la mi mi mi mi
    la, la la la la'\p la la la
    la la la la mi mi mi mi\mbreak

    %28
    la, la'\f la la sol sol sol sol
    fad fad fad fad mi mi mi mi
    re4 r re r

    %31
    la'8 la, la' la, la' la, la' la,
    re4 r re r
    la'8 la, la' la, la' la, la' la,

    %34
    si' si, si' si, si' si, si' si,\mbreak
    mi mi, mi' mi, mi' mi, mi' mi,
    la4 r re r

    %37
    sol r do, r
    fad r si, r
    mi8 mi mi mi mi mi mi mi

    %40
    mi mi mi mi si si si si\mbreak
    mi\p mi mi mi mi mi mi mi
    mi mi mi mi si si si si

    %43
    mi\f sol mi si mi sol mi si
    sol8.\tr fad16 mi fad sol la si8 la16 sol la si do? red
    mi8 mi, mi' mi, mi' mi, mi' mi,

    %46
    la' la, la' la, la' la, la' la,
    re4 r\mbreak la'8 la, la' la,
    re4 r la'8 la, la' la,

    %49
    re re, re' re, la'' la, la' la,
    si' si, si' si, fad' fad, fad' fad,
    sol' sol, sol' sol, re' re, re' re,

    %52
    mi' mi mi mi la, la la la
    re re re re si si si si\mbreak
    mi mi mi mi fad fad fad fad

    %55
    re re re re mi mi mi mi
    dod dod dod dod re re re re
    sol sol sol sol la la la la

    %58
    re, re re re si si si si
    sol sol sol sol la la la la
    re fad re la re fad re la\mbreak

    %61
    re re, re' re, re' re, re' re,
    re' re, re' re, la''4\staccatissimo la,\staccatissimo
    re8 fad re la re fad re la

    %64
    re4\staccatissimo la\staccatissimo re8 re16 re re8 re16 re
    re8 re re re re4 r

}

Ibfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \tempo 2 = 60
    \partial 8 s8
    s1*65
    \bar "|."

}


IcrI = {
    \Iglobal
    \notypeset
    <<\IcrIn \forma>>

}


IcrII = {
    \Iglobal
    <<\IcrIIn \forma>>

}


IobI = {
    \Iglobal
    <<\IobIn \forma>>

}


IobII = {
    \Iglobal
    <<\IobIIn \forma>>

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
    <<\Ibcn \forma \Ibfn>>
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
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    re2.
    la
    si4(la sol)

    %4
    \grace re'8 dod2\tr re4
    sol,(fad mi)
    fad16(sol la8)~la2

    %7
    <<
        {
            la2.
            la
            la

            %10
            la
        }\\{
            mi4(fad sol)
            \slurUp fad mi8 sol (fad mi)
            fad4 mi8 sol (fad mi)
            fad4 mi re
        }
    >>
    la'2.
    \appoggiatura {si16[dod]} re2.

    %13
    dod4(si) la
    \appoggiatura {re16[mi]} fad2.\mbreak
    mi4(sold,) la

    %16
    fad8 re' \grace dod si4.\tr la16 si
    dod4 re mi
    fad sold2

    %19
    la4 la, re
    dod16 (si la8) si4. la8
    la2.~

    %22
    la
    mi'
    la

    %25
    sol4(fad mi)
    si2.
    sol'

    %28
    fad4(mi re)
    re,2.
    la'

    %31
    si4(la sol)\mbreak
    \grace re'8 dod2\tr re4
    sol,(fad mi)

    %34
    fad16(sol la8)~la2
    <<
        {
            la2.
            la

            %37
            la
            la4
        }\\{
            mi4(fad sol)
            \slurUp fad mi8 sol (fad mi)
            fad4 mi8 sol (fad mi)
            fad4
        }
    >> re'2
    dod4 \appoggiatura {re16[mi]} fad2

    %40
    \grace fad4 mi2.
    \appoggiatura {mi,16[fad]} sol2.
    fad4(la re)

    %43
    si8. sol'16  mi4.\tr re16 mi
    fad4(sol la)
    si,8 si' \grace re,4 dod2\tr \mbreak

    %46
    re8. mi16 \grace fad8 mi4.\tr re16(mi)
    fad4(sol la)
    si dod2\tr

    %49
    re4 re, sol
    fad16(mi re8) mi4.\tr re8
    re2.~

    %52
    re

}

IIvlIIn = \relative do'' {

    re2.
    la
    si4(la sol)

    %4
    \grace re'8 dod2\tr re4
    sol,(fad mi)
    fad mi re

    %7
    dod(re mi)
    re dod8 mi(re dod)
    re4 dod8 mi (re dod)

    %10
    re4 mi sold
    la2.
    \appoggiatura {si16[dod]} re2.

    %13
    dod4(si) la
    \appoggiatura {re16[mi]} fad2.\mbreak
    mi4(sold,) la

    %16
    fad8 re' \grace dod si4.\tr la16 si
    dod4 re mi
    fad sold2

    %19
    la4 la, re
    dod16 (si la8) si4. la8
    <<
        {
            la2.

            %22
            mi
        }\\{
            la8 fad mi re dod si
            \stemUp dod2.
        }
    >>
    mi'
    la

    %25
    sol4(fad mi)
    si2.
    sol'

    %28
    fad4(mi re)
    re,2.
    la'

    %31
    si4(la sol)\mbreak
    \grace re'8 dod2\tr re4
    sol,(fad mi)

    %34
    fad16(sol la8)~la2
    dod,4(re mi)
    re dod8 mi(re dod)

    %37
    re4 dod8 mi(re dod)
    re4 re'2
    dod4 \appoggiatura {re16[mi]} fad2

    %40
    \grace fad4 mi2.
    \appoggiatura {mi,16[fad]} sol2.
    fad4(la re)

    %43
    si8. sol'16  mi4.\tr re16 mi
    fad4(sol la)
    si,8 si' \grace re,4 dod2\tr \mbreak

    %46
    re8. mi16 \grace fad8 mi4.\tr re16(mi)
    fad4(sol la)
    si dod2\tr

    %49
    re4 re, sol
    fad16(mi re8) mi4.\tr re8
    <<
        {
            re8 si la sol fad mi

            %52
            la2.
        }\\{
            la
            fad
        }
    >>

}

IIvlan = \relative do' {

    fad4(sol la)
    mi(dod re)
    re(dod re)

    %4
    mi2 <<re4\\si>>
    dod(re mi)
    re(dod re)

    %7
    mi(re dod)
    re mi8 dod(re mi)
    re4 mi8 dod(re mi)

    %10
    re4 la si
    dod(fad mi)
    re(la' si)

    %13
    mi, sold la~
    la re dod\mbreak
    si si, la

    %16
    si8 si' \grace la4 sold2\tr
    la4 re, dod
    si8. dod16 re4 mi

    %19
    mi re si'
    mi,~mi re
    dod8 re dod si la sold

    %22
    la2.
    dod4(dod') si
    la(mi) fad

    %25
    re(red) mi
    r mi red
    mi re!(mi)

    %28
    la,(dod re)
    re8. mi16 fad4 sol
    re(mi fad)

    %31
    re dod re\mbreak
    mi2 <<re4\\la>>
    dod(re mi)

    %34
    re(dod re)
    mi(re dod)
    re mi8 dod(re mi)

    %37
    re4 mi8 dod(re mi)
    fad4 la si
    mi, re2

    %40
    \grace re8 dod4. re8(mi fad)
    si,8. dod16 re4 mi
    fad2 la4

    %43
    re, \appoggiatura re4 dod2\tr
    la'4(sol fad)
    mi mi2\tr \mbreak

    %46
    la,4 la' dod,
    re sol, re'
    re sol mi

    %49
    la si <<
        {
            la
            la
        }\\{
            mi
            fad
        }
    >> la sol
    fad8(sol) fad(mi) re(dod)

    %52
    re2.

}

IIbcn = \relative do {

    re4(mi fad)
    dod(la re)
    sol(la si)

    %4
    la(sol fad)
    mi(re dod)
    re(mi fad)

    %7
    dod(si la)
    re la2
    re4 la2

    %10
    re4 dod si
    la(re dod)
    si fad'(sold)

    %13
    la(si dod)
    re8. dod16 si4 la\mbreak
    sold mi fad

    %16
    re mi8(re dod si)
    la4(si dod)
    re8. dod16 si4 mi

    %19
    dod fad sold
    la mi mi,
    la2.

    %22
    la8 fad' mi re dod si
    la4 la'(sol)
    fad dod red

    %25
    mi si mi,
    r sol' fad
    mi si(dod)

    %28
    re(mi fad)
    si(la sol)
    fad(mi re)

    %31
    sol(la si)\mbreak
    la(sol fad)
    mi(re dod)

    %34
    re(mi fad)
    dod(si la)
    re la2

    %37
    re4 la2
    re4 fad sold
    la re,8 (mi fad sold)

    %40
    la4 la,8(si dod re)
    mi4 si' dod
    re re, fad

    %43
    sol la8(sol fad mi)
    re4(mi fad)
    sol la sol\mbreak

    %46
    fad dod la
    re(mi fad)
    sol mi la

    %49
    fad si, dod
    re la' la,
    re2.

    %52
    re,

}

IIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*17
    s4 <6\\> <_+>
    s2.
    s4 <_+>2

}

forma = {

    \time 3/4
    \tempo 2 = 57
    s2.*52
    \bar "|."

}

IIvlI = {
    \IIglobal
    \notypeset
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
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}


IIIcrIn = %\transpose do re, {
\relative do'' {

    mi4 sol
    do,2\tr mi4 sol
    do,2\tr sol'4 r
    fa r re r

    %4
    do r sol' r
    fa r re sol
    mi2 r

    %7
    R1*5
    r2 mi4 r
    re r do r

    %14
    re r mi r
    re r do r
    re re mi fad

    %17
    sol re mi fad
    sol mi fad2
    sol r\mbreak

    %20
    R1*2
    r4 sol\f fad2
    sol4 re re2

    %24
    re r
    R1
    r2 mi4 sol

    %27
    do,2\tr mi4 sol
    do,2\tr la'4 r
    sol r fa r

    %30
    mi r la r\mbreak
    sol r fa r
    mi r re r

    %33
    do r r2
    R1*7
    mi4 sol do,2\tr

    %42
    mi4 sol do,2\tr
    mi4 sol do,2\tr
    r4 fa re sol

    %45
    mi2 sol
    la4 fa re sol
    mi2 r

    %48
    R1*2
    r4 mi re2
    do r

    %52
    do r
    mi re
    mi4 mi re2\tr

    %55
    do

}

 %}


IIIcrIIn = %\transpose do re, {
\relative do'' {

    mi4 sol
    do,2\tr mi4 sol
    do,2\tr mi4 r
    do r sol r

    %4
    mi r do' r
    do r sol sol
    do2 r

    %7
    R1*5
    r2 do4 r
    sol r do, r

    %14
    sol' r do r
    sol r do, r
    sol' re' mi fad

    %17
    sol re mi fad
    sol sol, re'2
    sol, r\mbreak

    %20
    R1*2
    r4 re'\f re2
    re4 sol, re'2

    %24
    sol, r
    R1
    r2 mi'4 sol

    %27
    do,2\tr mi4 sol
    do,2\tr do4 r
    do r re r

    %30
    do r do r\mbreak
    do r re r
    do r re r

    %33
    do r r2
    R1*7
    mi4 sol do,2\tr

    %42
    mi4 sol do,2\tr
    mi4 sol do,2\tr
    r4 re re sol,

    %45
    do2 do
    do4 re sol, sol
    do2 r

    %48
    R1*2
    r4 do re sol,
    mi2 r

    %52
    mi r
    do' re4 sol,
    do do re sol,

    %55
    mi2

}

 %}

IIIobIn = \relative do'' {

    fad4 la
    re,2\tr fad4 la
    re,2\tr la'4 re
    si sol mi la

    %4
    re,2\tr la'4 re
    si sol mi dod'
    re  re,^\markup\italic"Flauto solo senza Hautb." fad la

    %7
    re,2\tr fad4 la
    re,2\tr la'4 re
    si sol mi la\mbreak

    %10
    re,2\tr la'4 re
    si sol mi dod'!
    re4 re, fad^\markup\italic"Hautb. tutti" re

    %13
    mi dod re si
    dod mi fad re
    mi dod re si

    %16
    dod mi fad sold
    la mi fad sold
    la8 la, fad' re \grace dod8 si4.\tr la8

    %19
    la4 mi' 8^\markup\italic "Flauto" la, fad' la, sold' la,\mbreak
    la' la, mi' la, fad' la, sold' la,
    la' la, si' la, dod' la, re' la,

    %22
    mi''4 la,^\parenthesize \tu  si, sold'
    la la,8 si si4.\tr la8
    la2 dod4 mi

    %25 OOKK
    la,2\tr dod4 mi
    la,2\tr fad'4 la
    re,2\tr fad4 la

    %28
    re,2\tr si'4 sol
    la fad sol mi
    fad8 la re,4 si' sol\mbreak

    %31
    la fad sol mi
    fad re mi dod
    re8 fad4 fad fad fad8

    %34
    re fad4^\markup\italic"Flauto" fad fad  fad8
    fad si4^\markup\italic"Hautb." si si si8
    sol si4^\markup\italic"Flauto" si si  si8

    %37
    sol mi4^\markup\italic"Hautb." mi mi mi8
    dod mi4^\markup\italic"Flauto" mi mi  mi8
    mi la4^\markup\italic"Hautb." la la la8\mbreak

    %40
    fad la4^\markup\italic"Flauto" la la la8
    fad2^\tu re'4 la
    re,2\tr re'4 la

    %43
    re,2\tr la'4 re
    si sol mi dod'
    re re, la' re

    %46
    si sol mi dod'
    re4 la8^\markup\italic"Flauto" re, si' re, dod' re,
    re' re, la' re, si' re, dod' re,\mbreak

    %49
    re'4 re, mi4.\tr re16 mi
    fad8 la re, ^\tu mi mi4.\tr re16 mi
    re4 la si dod

    %52
    re la' si dod
    re re, mi4. re16 mi
    fad8 la re, mi mi4.\tr re8

    %55
    re2

}

IIIobIIn = \relative do'' {

    fad4 la
    re,2\tr fad4 la
    re,2\tr la'4 re
    si sol mi la

    %4
    re,2\tr la'4 re
    si sol mi dod'
    re  re,^\markup\italic"Flauto solo senza Hautb." fad la

    %7
    re,2\tr fad4 la
    re,2\tr la'4 re
    si sol mi la\mbreak

    %10
    re,2\tr la'4 re
    si sol mi dod'!
    re4 re, fad^\markup\italic"Hautb. tutti" re

    %13
    mi dod re si
    dod mi fad re
    mi dod re si

    %16
    dod mi fad sold
    la mi fad sold
    la8 la, fad' re \grace dod8 si4.\tr la8

    %19
    la4 mi' 8^\markup\italic "Flauto" la, fad' la, sold' la,\mbreak
    la' la, mi' la, fad' la, sold' la,
    la' la, si' la, dod' la, re' la,

    %22
    mi''4 la,^\parenthesize \tu  si, sold'
    la la,8 si si4.\tr la8
    la2 dod4 mi

    %25 OOKK
    la,2\tr dod4 mi
    la,2\tr fad'4 la
    re,2\tr fad4 la

    %28
    re,2\tr si'4 sol
    la fad sol mi
    fad8 la re,4 si' sol\mbreak

    %31
    la fad sol mi
    fad re mi dod
    re lad si dod

    %34
    re4 lad^\markup\italic"Flauto" si dod
    fad red^\markup\italic"Hautb." mi fad
    sol red^\markup\italic"Flauto" mi fad

    %37
    mi sold,^\markup\italic"Hautb." la si
    dod sold^\markup\italic"Flauto" la si
    r dod^\markup\italic"Hautb." re mi\mbreak

    %40
    fad dod^\markup\italic"Flauto" re mi
    la,2^\tu re'4 la
    re,2\tr re'4 la

    %43
    re,2\tr la'4 re
    si sol mi dod'
    re re, la' re

    %46
    si sol mi dod'
    re4 la8^\markup\italic"Flauto" re, si' re, dod' re,
    re' re, la' re, si' re, dod' re,\mbreak

    %49
    re'4 re, mi4.\tr re16 mi
    fad8 la re, ^\tu mi mi4.\tr re16 mi
    re4 la si dod

    %52
    re la' si dod
    re re, mi4. re16 mi
    fad8 la re, mi mi4.\tr re8

    %55
    re2

}

IIIvlIn = \relative do'' {

    fad4 la
    re,2\tr fad4 la
    re,2\tr la'4 re
    si sol mi la

    %4
    re,2\tr la'4 re
    si sol mi dod'
    re re,\p fad la

    %7
    re,2\tr fad4 la
    re,2\tr la'4 re
    si sol mi la\mbreak

    %10
    re,2\tr la'4 re
    si sol mi dod'!
    re re, fad8 \f la re, fad

    %13
    mi la dod, mi re si' si, re
    dod la mi' la, fad' la re, fad
    mi la dod, mi re si' si, re

    %16
    dod la mi' la, fad' la, sold' la,
    la' la, mi' la, fad' la, sold' la,
    la' la, fad' re \grace dod8 si4.\parenthesize \tr  la8

    %19
    la4 mi' 8\p la, fad' la, sold' la,\mbreak
    la' la, mi' la, fad' la, sold' la,
    la' la, si' la, dod' la, re' la,

    %22
    mi''4 la,\f si, sold'
    la la,8 si si4.\tr la8
    la2 dod4 mi

    %25 OOKK
    la,2\tr dod4 mi
    la,2\tr fad'4 la
    re,2\tr fad4 la

    %28
    re,2\tr si'8 re sol, si
    la re fad, la sol si mi, sol
    fad la re,4 si'8 re sol, si\mbreak

    %31
    la re fad, la sol si mi, sol
    fad la re, fad mi sol dod, mi
    re fad lad, fad' si, fad' dod fad

    %34
    re fad lad,\p fad' si, fad' dod fad
    re si'\f red, si' mi, si' fad si
    sol si red,\p si' mi, si' fad si

    %37
    sol mi \f sold, mi' la, mi' si mi
    dod mi sold,\p mi' la, mi' si mi
    dod la'\f dod, la' re, la' mi la\mbreak

    %40
    fad la dod, la' re, la' mi la
    \once\stemUp <fad la, re>2 re'4 la
    re,2\tr re'4 la

    %43
    re,2\tr la'4 re
    si sol mi dod'
    re re, la' re

    %46
    si sol mi dod'
    re8 re, la' re, si' re, dod' re,
    re' re, la' re, si' re, dod' re,\mbreak

    %49
    re'4 re, mi4.\tr re16 mi
    fad8 la re, mi mi4.\tr re16 mi
    re8 re, la' re, si' re, dod' re,

    %52
    re' re, la'' la, si' la, dod' la,
    re'4 re, mi4. re16 mi
    fad8 la re, mi mi4.\tr re8

    %55
    re2

}

IIIvlIIn = \relative do'' {

    fad4 la
    re,2\tr fad4 la
    re,2\tr la'4 re
    si sol mi la

    %4
    re,2\tr la'4 re
    si sol mi dod'
    re r re,,8\p dod re mi

    %7
    fad sol fad mi re dod re mi
    fad sol fad mi re mi fad re
    sol fad sol mi la sol la la,\mbreak

    %10
    si si' la sol fad mi fad re
    sol fad sol mi la4 la,
    re2 fad'8\f la re, fad

    %13
    mi la dod, mi re si' si, re
    dod la mi' la, fad' la re, fad
    mi la dod, mi re si' si, re

    %16
    dod la mi' la, fad' la, sold' la,
    la' la, mi' la, fad' la, sold' la,
    la' la, fad' re \grace dod8 si4.\parenthesize \tr  la8

    %19
    la4 dod,\p re mi\mbreak
    fad dod re mi
    fad sold la si

    %22
    dod la'\f si, sold'
    la la,8 si si4.\tr la8
    la2 dod4 mi

    %25 OOKK
    la,2\tr dod4 mi
    la,2\tr fad'4 la
    re,2\tr fad4 la

    %28
    re,2\tr si'8 re sol, si
    la re fad, la sol si mi, sol
    fad la re,4 si'8 re sol, si\mbreak

    %31
    la re fad, la sol si mi, sol
    fad la re, fad mi sol dod, mi
    re fad lad, fad' si, fad' dod fad

    %34
    re4 fad,\p sold lad
    si8 si'\f red, si' mi, si' fad si
    sol4 si,\p dod red

    %37
    mi8 mi\f sold, mi' la, mi' si mi
    dod4 mi,\p fad sold
    la8 la'\f dod, la' re, la' mi la\mbreak

    %40
    fad4 la,\p si dod
    re2 re'4 la
    re,2\tr re'4 la

    %43
    re,2\tr la'4 re
    si sol mi dod'
    re re, la' re

    %46
    si sol mi dod'
    re4 fad,, sol la
    si fad sol la\mbreak

    %49
    si fad sol la
    re,8 la'' re, mi mi4.\tr re16 mi
    re8 re, la' re, si' re, dod' re,

    %52
    re' re, la'' la, si' la, dod' la,
    re'4 re, mi4. re16 mi
    fad8 la re, mi mi4.\tr re8

    %55
    re2

}

IIIvlan = \relative do' {

    fad8 mi fad sol
    la si la sol fad mi fad sol
    la si la sol fad sol la fad
    mi4 si' dod, dod'

    %4
    re,8 sol fad mi fad sol la fad
    re4 si' dod, la'
    fad2 r

    %7
    R1*5
    r2 fad4\f si
    mi, la la sold

    %14
    la la la si
    mi, la re, mi
    mi la la mi

    %17
    dod la' la mi
    dod fad mi re
    dod2 r

    %20
    R1*2
    r4 mi8\f la sold4 si
    dod,8 re mi fad mi4 re

    %24
    dod2 dod8 si dod re
    mi fad mi re dod si dod mi
    re dod re mi fad mi fad sol

    %27
    la si la sol fad mi fad sol
    la fad sol la sol4 mi
    fad re mi dod

    %30
    re fad sol mi\mbreak
    fad re' mi, dod'
    re, si' dod, lad'

    %33
    si fad sold lad
    si r r2
    r4 si,\f dod red

    %36
    mi r r2
    r4 mi fad sold
    la r r2

    %39
    r4 la si dod\mbreak
    re r r2
    fad,8 mi fad sol la si la sol

    %42
    fad mi fad sol la si la sol
    fad mi fad sol la sol la fad
    re4 si' dod, la'

    %45
    fad8 mi fad sol la sol la fad
    re4 si' dod, la'
    fad r r2

    %48
    R1*2
    r4 fad si la
    fad mi re la'

    %52
    fad re re la'
    fad la si la
    fad fad si la

    %55
    fad2

}

IIIbcn = \relative do {

    re8 dod re mi
    fad sol fad mi re dod re mi
    fad sol fad mi re mi fad re
    sol fad sol mi la sol la fad

    %4
    si, si' la sol fad mi fad re
    sol fad sol mi la4 la,
    re2 r

    %7
    R1*5
    r2 re'4\f si
    dod la si mi,

    %14
    la dod, re si'
    dod, la' si, sold'
    la dod, re mi

    %17
    fad dod re mi
    fad re mi mi,
    la2 r\mbreak

    %20
    R1*2
    r4 dod'8\f re mi4 mi,
    la,8 si dod re mi4 mi,

    %24
    la2 la'8 sold la si
    dod re dod si la si la sol
    fad sol fad mi re dod re mi

    %27
    fad sol fad mi re dod re mi
    fad re mi fad sol4 mi'
    fad, re' mi, dod'

    %30
    re fad, sol mi'\mbreak
    fad, mi' mi, dod'
    re, si' dod, lad'

    %33
    si fad sold lad
    si r r2
    r4 si,\f dod red

    %36
    mi r r2
    r4 mi fad sold
    la r r2

    %39
    r4 la si dod\mbreak
    re r r2
    re,8 dod re mi fad sol fad mi

    %42
    re dod re mi fad sol fad mi
    re dod re mi fad mi fad re
    sol fad sol mi la sol la la,

    %45
    si si' la sol fad mi fad re
    sol fad sol mi la sol la la,
    re4 r r2

    %48
    R1*2
    r4 si' sol la
    re, fad sol la

    %52
    si fad sol la
    si fad sol la
    re, si' sol la

    %55
    re,2

}

IIIbfn = \figures {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    <6>1
    <6>
    s1*22
    <6>1
    s
    <6>
    s1*13
    s2 <6>
    s1
    s2 <6>
    <6 5>1
    <5>
    <6 5>
    s1*3
    s4 <5> <6 5> s

}

forma = {

    \time 2/2
    \tempo 1 = 57
    \partial 2 s2
    s1*23
    s2 \bar ":..:"\break s
    s1*30
    s2
    \bar "|."

}


IIIcrI = {
    \IIIglobal
    %\notypeset
    <<\IIIcrIn \forma>>

}


IIIcrII = {
    \IIIglobal
    <<\IIIcrIIn \forma>>

}


IIIobI = {
    \IIIglobal
    <<\IIIobIn \forma>>

}


IIIobII = {
    \IIIglobal
    <<\IIIobIIn \forma>>

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
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \header {
        subtitle = \markup "”Il trionfo di Camilla” Sinfonia "
        composer = \markup {"N. Porpora (1686-17681)"}
    }


\paper  {

    systems-per-page = #2

}

    \markup\huge "[1.] [Allegro]"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.midiInstrument = #"french horn"
                    %\key re\major
                    \IcrI
                >>

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Corni"}
                    \set Staff.midiInstrument = #"french horn"
                    %\key re\major
                    \IcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Hautboes"}
                    \set Staff.midiInstrument = #"oboe"
                    \key re\major
                    \IobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \key re\major
                    \IobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Violini"}
                    \set Staff.midiInstrument = #"violin"
                    \key re\major
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                    \key re\major
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
                \key re\major
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"[Bassi]"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
                 \key re\major
            >>
        >>

        \layout {

            indent = 1.7\cm

            #(layout-set-staff-size 17.5)

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
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
                \remove Dynamic_performer
            }
        }

    }

}

\bookpart {

\paper  {

    systems-per-page = #4

}

    \markup\huge "[2.] Moderato"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"[Violini]"}
                    \set Staff.midiInstrument = #"violin"
                    \key re\major
                    \IIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                    \key re\major
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \IIvla
                \key re\major
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"[Bassi]"}
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
                 \key re\major
            >>
        >>

        \layout {

            indent = 1.7\cm

            #(layout-set-staff-size 18.5)

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
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
                \remove Dynamic_performer
            }
        }

    }

}

\bookpart {

\paper  {

    systems-per-page = #2

}

    \markup\huge "[3.] Allegro"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.midiInstrument = #"french horn"
                    %\key re\major
                    \IIIcrI
                >>

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Corni"}
                    \set Staff.midiInstrument = #"french horn"
                    %\key re\major
                    \IIIcrII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"Hautboes""Flauti"}
                    \set Staff.midiInstrument = #"oboe"
                    \key re\major
                    \IIIobI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"oboe"
                    \key re\major
                    \IIIobII
                >>
            >>

            \new PianoStaff <<

                \new Staff
                <<
                    \set PianoStaff.instrumentName =  \markup \center-column{"[Violini]"}
                    \set Staff.midiInstrument = #"violin"
                    \key re\major
                    \IIIvlI
                >>

                \new Staff
                <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                    \key re\major
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \IIIvla
                \key re\major
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            } <<
                \set Staff.instrumentName = \markup \center-column\smaller{"[Bassi]"}
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
                 \key re\major
            >>
        >>

        \layout {

            indent = 1.7\cm

            #(layout-set-staff-size 17.5)

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
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
                \remove Dynamic_performer
            }
        }

    }

}
