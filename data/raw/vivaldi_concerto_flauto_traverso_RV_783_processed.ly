\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

"|" = \bar "||"

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

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
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

Ifln = \relative do'' {

  re'4 re re16 la fad re re' [la fad re]
  re'4 re re16 la fad re re'[la fad re]
  re'8 dod16 si la8[sol] fad mi re4

  %4
  la' la la16 mi dod la la'[mi dod la]\mbreak
  la'4 la la16 mi dod la la'[mi dod la]
  la'8 sold16 fad mi8[re] dod si la4

  %7
  sol'8 si4 sol8 fad la4 fad8
  mi sol4 mi8 re fad4 re8
  dod16 la si dod re mi fad sol\mbreak la8  la la la

  %10
  dod,16 la si dod re mi fad sol la8 la la la
  sol4 r8 fad16 mi fad8 re mi dod
  sol'4 r8 fad16 mi fad8 re mi dod

  %13
  re re'16 re dod[dod si si] la la si si la[la sol sol]\mbreak
  fad fad sol sol fad[fad mi mi] re mi fad sol la8[la,]
  re4 r8 la' re\solo la re la

  %16
  fad mi16 re fad8[la] re la re la
  fad mi16 re fad8[la] re la fad re
  la'4 r8 la\mbreak si16 la sol4 si8  %%% bar 18 OK

  %19
  la16 sol fad4 la8 sol16 fad mi4 sol8
  fad16 mi re8 r la' re16 la la la re[la la la]
  si sol sol sol si[sol sol sol] dod sol sol sol dod[sol sol sol]\mbreak

  %22
  la fad fad fad la[fad fad fad] si fad fad fad si[fad fad fad]
  sold8 mi r16 mi mi mi sold mi mi mi la [mi mi mi]
  si' mi, mi mi dod' [mi, mi mi] re'4. dod16 si

  %25
  dod8 la si sold\mbreak la4 r16 mi mi mi
  sold [mi mi mi]  la mi mi mi si'mi, mi mi dod' [mi, mi mi]
  re'4. dod16 si dod8 si16 la si8 [la16 sold]

  %28
  la4\f la la16 mi dod la la' [mi dod la]
  la'4 la \mbreak la16 mi dod la la' [mi dod la]  %%% OK
  la'8 sold16 fad mi8[re] dod16 la si dod re [mi fad sold]

  %31
  la8 la la la dod,16 la si dod re [mi fad sold]
  la8 [la16 la] sold sold fad fad mi mi fad fad\mbreak mi[mi re re]
  dod dod re re dod[dod si si] la si dod re mi8[mi,]\mbreak

  %34
  la4 r8 la'\solo sold16 la si4 si8
  mid, sold dod,4~dod8 sold'16 la si8[la16 sold]
  la8 fad r dod'\mbreak re32 dod si8. re32[dod si8.]

  %37
  sold16 mi mi mi sold[mi mi mi] dod'32[si la8.] dod32 si la8.
  fad16 re re re fad[re re re] si'32 la sold8. si32[la sold8.]
  mid16 dod dod dod mid[dod dod dod]\mbreak la'32[sold fad8.] la32 sold fad8.

  %40
  si16 sold sold sold si[sold sold sold] dod la la la dod[la la la]
  re32 [dod si8.] re32 dod si8. la8 fad sold mid
  fad4\f fad fad16 dod la fad fad'[dod la fad]\mbreak

  %43
  fad'4 fad fad16 dod la fad fad'[dod la fad]
  fad'8[fad16 fad] mi mi re re dod[dod re re] dod dod si si
  la la si si la[la sold sold] fad sold la si dod8[dod,]

  %46
  fad4 r8 la'\solo re  la re la\mbreak
  fad mi16 re fad8[la] re la re la
  fad mi16 re fad8[sol] la4 r16 re re re

  %49
  re, re' re re mi,[re' re re] fad, re' re re mi,[re' re re]
  re, re' re re mi,[re' re re] fad, re' re re\mbreak mi,[re' re re]
  re,4 r16 la' la la la, la' la la si, [la' la la]

  %52
  dod, la' la la si,[la' la la] la, la' la la si,[la' la la]
  dod, la' la la si,[la' la la] la,4 r8 la'\mbreak
  fad16 mi re4 do8 si16 la sol4 si'8

  %55
  sol16 fad mi4 re8 dod16 si la4 dod'8
  la16 sol fad4 mi8 re16 dod si4 re'8
  si16 la sol4 fad8 mi16 re dod4 la'8\mbreak

  %58
  re16 dod si la re[dod si la] si sol sol sol si[sol sol sol]
  dod si la sol dod[si la sol] la fad fad fad la[fad fad fad]
  si la sol fad si[la sol fad] sol mi mi mi sol[mi mi mi]\mbreak

  %61
  fad re mi fad sol[la si dod] re re re re re[re re re]
  re re, mi fad sol[la si dod] re re re re re[re re re]
  re8 dod16 si la8[sol] fad mi16 re mi4\tr \mbreak

  %64
  re8 mi16 fad sol[la si dod] re8 dod16 si la8[sol]
  fad mi16 re mi4\tr re2
  re'4 re re16 la fad re re' [la fad re]

  %67
  re'4 re re16 la fad re re'[la fad re]
  re'8 dod16 si la8[sol] fad mi re4
  la' la la16 mi dod la la'[mi dod la]\mbreak

  %70
  la'4 la la16 mi dod la la'[mi dod la]
  la'8 sold16 fad mi8[re] dod si la4
  sol'8 si4 sol8 fad la4 fad8

  %73
  mi sol4 mi8 re fad4 re8
  dod16 la si dod re mi fad sol\mbreak la8  la la la
  dod,16 la si dod re mi fad sol la8 la la la

  %76
  sol4 r8 fad16 mi fad8 re mi dod
  sol'4 r8 fad16 mi fad8 re mi dod
  re re'16 re dod[dod si si] la la si si la[la sol sol]\mbreak

  %79
  fad fad sol sol fad[fad mi mi] re mi fad sol la8[la,]
  re4\fermata r r2

}

IvlIn =  \relative do'' {

  re'4 re re16 la fad re re' [la fad re]
  re'4 re re16 la fad re re'[la fad re]
  re'8 dod16 si la8[sol] fad mi re4

  %4
  la' la la16 mi dod la la'[mi dod la]\mbreak
  la'4 la la16 mi dod la la'[mi dod la]
  la'8 sold16 fad mi8[re] dod si la4

  %7
  sol'8 si4 sol8 fad la4 fad8
  mi sol4 mi8 re fad4 re8
  dod16 la si dod re mi fad sol\mbreak la8  la la la

  %10
  dod,16 la si dod re mi fad sol la8 la la la
  sol4 r8 fad16 mi fad8 re mi dod
  sol'4 r8 fad16 mi fad8 re mi dod

  %13
  re re16 re dod[dod si si] la la si si la[la sol sol]\mbreak
  fad fad sol sol fad[fad mi mi] re mi fad sol la8 [la,]
  re4 r r2    %%%%%%%%%% qui ripresa

  %16
  R1*2
  r4 r8 fad'\p sol16 fad  mi4 sol8
  fad16 mi re4 fad8 mi16 re dod4 mi8\mbreak

  %20
  fad [la,] fad8 mi re mi fad re
  sol4 sol mi8 re mi dod
  fad4 fad re8 dod re si

  %23
  mi fad sold fad mi4 mi
  mi mi mi8 fad sold mi
  la la, re mi\mbreak la, si dod la

  %26
  mi'4 mi mi mi
  mi8 fad sold mi la la, re mi
  la'4\f la la16 mi dod la la' [mi dod la]

  %29
  la'4 la \mbreak la16 mi dod la la' [mi dod la]  %%% OK
  la'8 sold16 fad mi8[re] dod16 la si dod re mi fad sold
  la8 la la la dod,16 la si dod re mi fad sold

  %32
  la8 [la,16 la] sold sold fad fad mi mi fad fad\mbreak mi[mi re re]
  dod dod re re dod[dod si si] la si dod re mi8[mi]\mbreak
  la,4  r r2

  %35
  R1*7
  fad''4\f fad fad16 dod la fad fad'[dod la fad]\mbreak
  fad'4 fad fad16 dod la fad fad'[dod la fad]

  %44
  fad'8[fad16 fad] mi mi re re dod[dod re re] dod dod si si
  la la si si la[la sold sold] fad sold la si dod8[dod,]
  fad4 r r2

  %47
  R1*6
  r2 la,8\p si dod la
  re mi fad re sol, la si sol

  %55
  mi' fad sol mi la, si dod la
  fad' sol la fad\mbreak si, dod re si
  sol' la si sol dod,re  mi dod

  %58
  re mi fad re sol fad sol si
  dod, re  mi dod fad mi fad la
  si, dod re si mi re mi dod\mbreak

  %61
  re sol fad mi re mi fad mi
  re sol fad mi re mi fad mi
  re sol dod, la re re' la la,

  %64
  re fad dod la re fad dod la\mbreak
  re re' la la, re2
  re''4 re re16 la fad re re' [la fad re]

  %67
  re'4 re re16 la fad re re'[la fad re]
  re'8 dod16 si la8[sol] fad mi re4
  la' la la16 mi dod la la'[mi dod la]\mbreak

  %70
  la'4 la la16 mi dod la la'[mi dod la]
  la'8 sold16 fad mi8[re] dod si la4
  sol'8 si4 sol8 fad la4 fad8

  %73
  mi sol4 mi8 re fad4 re8
  dod16 la si dod re mi fad sol\mbreak la8  la la la
  dod,16 la si dod re mi fad sol la8 la la la

  %76
  sol4 r8 fad16 mi fad8 re mi dod
  sol'4 r8 fad16 mi fad8 re mi dod
  re re16 re dod[dod si si] la la si si la[la sol sol]\mbreak

  %79
  fad fad sol sol fad[fad mi mi] re mi fad sol la8[la,]
  re4\fermata    r r2%%%%%%%%%% qui ripresa

}

IvlIIn = \relative do'' {

  re'4 re re16 la fad re re' [la fad re]
  re'4 re re16 la fad re re'[la fad re]
  re'8 dod16 si la8[sol] fad mi re4

  %4
  la' la la16 mi dod la la'[mi dod la]\mbreak
  la'4 la la16 mi dod la la'[mi dod la]
  la'8 sold16 fad mi8[re] dod si la4

  %7
  mi'8 sol4 mi8 re fad4 re8
  dod mi4 dod8\mbreak si re4 si8
  dod16 la si dod re mi fad sol la8 la la la
  
  %10
  dod,16 la si dod re mi fad sol la8 la la la
  mi4 r8 re16 dod re8 fad, sol mi
  mi'4 r8 re16 dod\mbreak re8 fad, sol mi

  %13
  re re'16 re dod[dod si si] la la si si la[la sol sol]\mbreak
  fad fad sol sol fad[fad mi mi] re mi fad sol la8 [la,]
  re4 r r2    %%%%%%%%%% qui ripresa

  %16
  R1*2
  r8 la'\p fad re sol4 dod,
  fad si, mi la,
  re8 mi fad mi re mi fad re
  sol4 sol mi8 re mi dod
  fad4 fad re8 dod re si
  mi fad sold fad mi4 mi\mbreak
  mi mi mi8 fad sold mi
  la la, re mi la, si dod la
  mi'4 mi mi mi
  mi8 fad sold mi la la, re mi
  la'4\f la la16 mi dod la la' [mi dod la]

  %29
  la'4 la \mbreak la16 mi dod la la' [mi dod la]  %%% OK
  la'8 sold16 fad mi8[re] dod16 la si dod re mi fad sold
  la8 la la la dod,16 la si dod re mi fad sold

  %32
  la8 [la,16 la] sold sold fad fad mi mi fad fad\mbreak mi[mi re re]
  dod dod re re dod[dod si si] la si dod re mi8[mi]\mbreak
  la,4  r r2

  %35
  R1*7
  fad''4\f fad fad16 dod la fad fad'[dod la fad]\mbreak
  fad'4 fad fad16 dod la fad fad'[dod la fad]

  %44
  fad'8[fad16 fad] mi mi re re dod[dod re re] dod dod si si
  la la si si la[la sold sold] fad sold la si dod8[dod,]
  fad4 r r2

  %47
  R1*6
  r2 la,8\p si dod la
  re mi fad re sol, la si sol

  %55
  mi' fad sol mi la, si dod la
  fad' sol la fad\mbreak si, dod re si
  sol' la si sol dod,re  mi dod

  %58
  re mi fad re sol fad sol si
  dod, re  mi dod fad mi fad la
  si, dod re si mi re mi dod\mbreak

  %61
  re sol fad mi re mi fad mi
  re sol fad mi re mi fad mi
  re sol dod,[la] re re' la la,

  %64
  re fad dod la re fad dod la\mbreak
  re sol la la, re2
  
  re''4 re re16 la fad re re' [la fad re]
  re'4 re re16 la fad re re'[la fad re]
  re'8 dod16 si la8[sol] fad mi re4

  %4
  la' la la16 mi dod la la'[mi dod la]\mbreak
  la'4 la la16 mi dod la la'[mi dod la]
  la'8 sold16 fad mi8[re] dod si la4

  %7
  mi'8 sol4 mi8 re fad4 re8
  dod mi4 dod8\mbreak si re4 si8
  dod16 la si dod re mi fad sol la8 la la la
  
  %10
  dod,16 la si dod re mi fad sol la8 la la la
  mi4 r8 re16 dod re8 fad, sol mi
  mi'4 r8 re16 dod\mbreak re8 fad, sol mi

  %13
  re re'16 re dod[dod si si] la la si si la[la sol sol]\mbreak
  fad fad sol sol fad[fad mi mi] re mi fad sol la8 [la,]
  re4\fermata r r2

}

Ivlan = \relative do'{

  fad8 sol la sol fad4 fad
  fad8 sol la sol fad4 fad
  sol8 si mi, dod la sol' la fad

  %4
  mi fad mi re dod4 dod
  dod8 re mi re dod4 dod\mbreak
  re8 fad si, sold mi4 r8 la

  %7
  la la' la la, la la' la la,
  la la' la la, la la' la la,
  mi'4 r dod8 re mi dod

  %10
  mi4 r dod8 re  mi dod\mbreak
  dod4 r8 la' la la si, dod
  dod4 r8 la' la la si, dod

  %13
  re re'16 re dod [dod si si] la la si si la [la sol sol]
  fad fad sol sol fad [fad mi mi] re mi fad sol la8 [la,]\mbreak
  re4 r r2

  %16
  R1*2
  r8 la'\p fad re sol4 dod,
  fad si, mi la,

  %20
  re8 mi fad mi re mi fad re
  sol4 sol mi8 re mi dod
  fad4 fad re8 dod re si

  %23
  mi fad sold fad mi4 mi\mbreak
  mi mi mi8 fad sold mi
  la la, re mi la, si dod la

  %26
  mi'4 mi mi mi
  mi8 fad sold mi la la, re mi
  dod8\f re mi re dod4 dod

  %29
  dod8 re mi re dod4 dod
  dod8 fad si, sold mi4 r
  dod'8 re mi dod mi4 r

  %32
  mi8 [la16 la] sold sold fad fad mi mi fad fad\mbreak mi[mi re re]
  dod dod re re dod[dod si si] la si dod re mi8[mi,]\mbreak
  la4  r r2

  %35
  R1*7
  la'8 si dod si la4 la
  la8 si dod si la4 la\mbreak

  %44
  la8 fad16 fad mi [mi re re] dod dod re re dod[dod si si]
  la' la si si la[la sold sold] fad sold la si dod8[dod,]
  fad4 r r2

  %47
  R1*19
  fad8 sol la sol fad4 fad
  fad8 sol la sol fad4 fad

  %68
  sol8 si mi, dod la sol' la fad
  mi fad mi re dod4 dod
  dod8 re mi re dod4 dod\mbreak

  %71
  re8 fad si, sold mi4 r8 la
  la la' la la, la la' la la,
  la la' la la, la la' la la,

  %74
  mi'4 r dod8 re mi dod
  mi4 r dod8 re  mi dod\mbreak
  dod4 r8 la' la la si, dod

  %77
  dod4 r8 la' la la si, dod
  la re'16 re dod [dod si si] la la si si la [la sol sol]
  fad fad sol sol fad [fad mi mi] re mi fad sol la8 [la,]\mbreak

  %80
  re4\fermata r r2

}

Ibcn = \relative do {

  re8 mi fad mi re4 re
  re8 mi fad mi re4 re
  re8 sol dod, la re mi fad re

  %4
  dod re dod si la4 la
  la8 si dod si la4 la
  la8 re sold, mi\mbreak la si dod la

  %7
  la la' la la, la la' la la,
  la la' la la, la la' la la,
  la4 r la8 si dod la

  %10
  la4 r la8 si dod la
  la la' re la\mbreak re, re' sol,la
  la, la' re la re, re, sol la

  %13
  re, re''16 re dod [dod si si] la la si si la [la sol sol]
  fad fad sol sol fad [fad mi mi] re mi fad sol la8 [la,]\mbreak
  re4 r re r

  %16
  re r re r
  re r re r
  la r r2

  %19
  R1*9
  la8 si dod si la4 la
  la8 si dod si la4 la

  %30
  la8 re sold, mi la4 r\mbreak
  la8 si dod si la4 r
  la8 la'16 la sold [sold fad fad] mi mi fad fad mi [mi re re]

  %33
  dod dod re re dod [dod si si] la si dod re mi8 [mi,]
  la si dod la si4. sid8\mbreak
  dod8 red mid red dod4 dod

  %36
  fad8 sold la fad si re si re
  mi, sold mi sold la dod la dod
  re, si' re, si' re si re si

  %39
  dod mid, dod' mid, fad la fad la
  sold mid sold mid\mbreak la fad la fad
  si mid, si' mid, fad la si dod

  %42
  fad, sold la sold fad4 fad
  fad8 sold la sold fad4 fad
  fad8 [fad'16 fad] mi mi re re dod [dod re re] dod dod si si\mbreak

  %45
  la [la si si] la la sold sold fad [sold la si] dod8 dod,
  fad4 r re r
  re r re r

  %48
  re r re8  mi fad mi
  re re mi mi fad fad mi mi\mbreak
  re re mi mi fad fad mi mi

  %51
  re re dod si la la si si
  dod dod si si la la si si
  dod dod si si la4 r

  %54
  R1*12\mbreak
  re8 mi fad  mi re4 re
  re8 mi fad mi re4 re

  %68
  re8 sol dod,[la] re mi fad re
  dod re dod si la4 la
  la8 si dod si la4 la\mbreak

  %71
  la8 re sold, mi la si dod la
  la la' la la, la la' la la,
  la la' la la, la la' la la,

  %74
  la4 r la8 si dod la
  la4 r la8 si dod la\mbreak
  re la' re la re, re' sol, la

  %77
  la, la' re la re, re, sol la
  re, [re''16 re] dod dod si si la [la si si] la la sol sol
  fad [fad sol sol] fad fad mi mi re mi fad sol la8 [la,]

  %80
  re4\fermata r r2

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key re\major
  \time 2/2
  \tempo 2 = 60
  s1*80
  \bar"|."

}

Ifl = {
  \Iglobal
  \notypeset
  <<\Ifln \forma>>

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

IIglobal = {
		\override Score.MetronomeMark #'transparent = ##t
		\override Score.BarNumber #'font-size = #0.5
		\override Score.BarNumber #'padding = #1.3
		\override TupletBracket #'bracket-visibility = ##f
}

IIfln = \relative do'' {

  re8 re re re re32 la la re re[fad fad la] la fad fad re re[la la fad']
  mi dod dod mi mi[sol sol si] si sol sol mi mi[dod dod sol']\mbreak fad re re fad fad[la la re] re la la fad fad[re re si']
  \appoggiatura mi,8 re32 dod re16 \appoggiatura mi8 re32[dod re16] \appoggiatura mi8 re32[dod re16] \appoggiatura mi8 re32[dod re16] sold32 mi mi sold sold[si si re]~re si si sold sold[mi mi sold]
  la16 si dod la si8.\tr [la16] la2
  la4~la16 do32 si la sol fad mi red16 do'32 si la sol fad mi red16 la'32 sol fad mi red dod
  si red red fad fad[red red fad] fad la la si\mbreak si[fad fad sol] sol8\tr sol\tr sol\tr sol\tr
  sol4~sol16 si32 la sol fad mi re dod16 si'32 la sol fad mi re dod16 sol'32 fad mi re dod si
  la dod dod mi mi[dod dod mi] mi sol sol la la[mi mi fad]\mbreak fad8\tr fad \tr fad\tr fad\tr
  re'16 dod32 si la sol fad mi re16 \senza\tuplet 7/6{re'32 dod si la sol fad mi} re fad fad la la[re re la] la fad fad la la[do do la]
  si64[do re16.] si64[do re16.] do64 [si la16.] do64 [si la16.] re32 dod? si la sol fad mi re re' dod si la sol fad mi re
  re'16 dod32 si la16 fad mi8.\tr[re16] re2

}

IIvlIn =  \relative do'' {

  la8 la la la la la la la
  dod dod dod dod la la la la
  sold sold sold sold sold sold sold mi'\mbreak
  dod mi sold, si dod2
  fad8 fad fad fad fad fad fad fad
  sol sol sol sol sol sol sol sol
  sol sol sol sol sol sol sol sol
  sol sol sol sol\mbreak fad fad fad fad
  fad fad fad fad fad fad fad fad
  mi mi dod dod la' la la la
  fad fad mi mi fad2

}

IIvlIIn = \relative do'' {

  fad,8 fad fad fad fad fad fad re'
  mi mi mi mi fad fad fad fad
  si, si si si si si si si
  si mi, mi sold\mbreak la2
  si8 si si si si si si si
  si si si si si si si si
  mi mi mi mi mi mi mi mi
  mi mi mi mi la, la la la
  la la la la la la la la
  si si mi mi re re re re
  re re dod dod re2

}

IIvlan = \relative do'{

  re8 re re re re re re re
  la la la la re re re re
  mi mi mi mi mi mi mi mi
  la, la mi' mi, la2\mbreak
  red8 red red red red red red red
  red? red red red  mi mi mi mi
  dod dod dod dod dod dod dod dod
  dod dod dod dod re re re re
  re re re re re re re re
  sol sol sol sol fad fad fad fad
  re re la la re2

}

forma = {

\key re\major
\time 2/2
\tempo 8 = 60
s1*4
\bar":..:"\break
s1*7
\bar":|."

}

IIfl = {
	\IIglobal
	\notypeset
	<<\IIfln \forma>>

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
	\typeset

}

IIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIIfln = \relative do'' {

  fad8[la mi la]
  fad[la mi la]
  fad[la mi la]

  %4
  fad mi re4
  la'8[re la re]
  si[re si re]\mbreak

  %7
  la [re la re]
  si[re si re]
  la[si la sol]

  %10
  fad mi re4
  la'2
  do,

  %13
  si8 la sol4
  si'2
  re,

  %16
  dod8 si la4
  fad'8 la la4
  r8 la la4

  %19
  r8 la la4
  r8 la[si dod]
  re dod16 si la8 sol

  %22
  fad4 mi
  re8 la' la4
  r8 la la4

  %25
  r8 la la4\mbreak
  r8 la [si dod]
  re dod16 si la8 sol

  %28
  fad mi16 re mi4\tr
  re r
  fad16\solo la sol la fad la sol la

  %31
  mi la sol la mi la sol la
  fad la sol la\mbreak fad la sol la
  mi la sol la mi la sol la

  %34
  fad8 re r la'
  si16 dod re4 si8
  la re4 la8

  %37
  sol re'4 sol,8
  fad mi re4\mbreak
  la'16 si la si la si la si

  %40
  la8[mi dod la]
  la'16 si la si la si la si
  la8[mi dod la]

  %43
  dod4\tr re\tr
  mi\tr fad\tr
  sold\tr la\tr \mbreak

  %46
  si16 mi, fad mi fad mi fad mi
  si' mi, fad mi fad mi fad mi
  si' re, mi re mi re mi re

  %49
  si' re, mi re mi re mi re
  dod [la si dod re mi fad sold]\mbreak
  la [la, si dod re mi fad sold]

  %52
  la si la si la si la si
  la si la si la si la si
  la8 sold16 fad mi8 re'

  %55
  dod si16 la si4\tr
  la2\mbreak
  dod,8 [mi si mi]

  %58
  dod[mi si mi]
  dod[mi si mi]
  dod la r4

  %61
  re8[fad dod fad]
  re8[fad dod fad]
  re8[fad dod fad]

  %64
  re si r fad'\mbreak
  si16\solo [dod re dod si la sol fad]
  sol8 \grace fad8 mi4.\tr

  %67
  la16[si dod si la sol fad mi]
  fad8 \grace mi8 re4.\tr
  sol16[la si la sol fad mi re]

  %70
  mi8\grace re dod4.\tr\mbreak
  fad16 sold lad sold fad mi re dod
  re8 fad si16 la sol fad

  %73
  si8 fad si16 la sol fad
  si8 la16 sol fad8 mi
  re dod16 si dod4\tr \mbreak %%%%% fine prima pagina bar 75

  %76
  si r8 re
  fad\tu[la mi la]
  fad[la mi la]

  %79
  fad[la mi la]
  fad re r la'
  fad16\solo re re fad fad la la fad\mbreak

  %82
  fad re re fad fad la la fad
  sol re re sol sol si si sol
  sol re re sol sol si si sold

  %85
  sold mi mi sold sold si si sold
  sold mi mi sold\mbreak sold si si sold
  la mi mi la la dod dod la

  %88
  la mi mi la la dod dod la
  re8 re, r la'
  re4~re16 dod si la

  %91
  re dod si la\mbreak re dod si la
  re4~re16 dod si la
  re dod si la re dod si la

  %94
  re re, mi fad sol la si dod
  re8 dod4 si8
  la sol4 fad8\mbreak

  %97
  si la4 sol8
  fad mi4 re8
  re' dod16 si la8 sol

  %100
  fad mi16 re mi4\tr
  re r\mbreak
  re'8 dod4 si8

  %103
  la sol4 fad8
  si la4 sol8
  fad mi4 re8

  %106
  re' dod16 si la8 sol\mbreak
  fad mi16 re  mi4\tr
  re8[la' mi la]

  %109
  fad[la mi la]
  fad[la mi la]
  fad16[re mi fad sol la si dod]\mbreak

  %112
  re8 dod16 si la8 sol
  fad mi16 re mi4\tr
  re4 r

}

IIIvlIn =  \relative do'' {

  fad8[la mi la]
  fad[la mi la]
  fad[la mi la]

  %4
  fad mi re4
  la'8[re la re]
  si[re si re]\mbreak

  %7
  la [re la re]
  si[re si re]
  la[si la sol]

  %10
  fad mi re4
  la'2
  do,

  %13
  si8 la sol4
  si'2
  re,

  %16
  dod8 si la4
  fad'8 la la4
  r8 la la4

  %19
  r8 la la4
  r8 la[si dod]
  re dod16 si la8 sol

  %22
  fad4 mi
  re8 la' la4
  r8 la la4

  %25
  r8 la la4\mbreak
  r8 la [si dod]
  re dod16 si la8 sol

  %28
  fad mi16 re mi4\tr
  re r
  la'8 r la r

  %31
  la r la r
  la r la r\mbreak
  la r la r

  %34
  la4 r
  R2*22
  dod,8 [mi si mi]

  %58
  dod[mi si mi]
  dod[mi si mi]
  dod la r4

  %61
  re8[fad dod fad]
  re8[fad dod fad]
  re8[fad dod fad]

  %64
  re si r si,
  re8\p[re re re]
  mi[mi fad sol]

  %67
  dod,[dod dod dod]
  re[re mi fad]\mbreak
  si,[si si si]

  %70
  dod[dod re mi]
  lad,[lad lad lad]
  si[si dod dod]

  %73
  re[re mi mi]
  fad[fad lad, lad]
  si[si fad' fad]\mbreak

  %76
  si,4 r8 re'
  fad\f[la mi la]
  fad[la mi la]

  %79
  fad[la mi la]
  fad re r4
  R2*27

  %108
  re8[la' mi la]
  fad[la mi la]
  fad[la mi la]

  %111
  fad16[re mi fad sol la si dod]\mbreak
  re8 dod16 si la8 sol
  fad mi16 re mi4\tr

  %114
  re4 r

}

IIIvlIIn = \relative do'' {

  la'8 r la r
  la r la r
  la r la r

  %4
  la r la r
  re r re r
  re r re r

  %7
  re r re r
  re r re r
  dod r dod r

  %10
  re r re, r
  fad2
  la,

  %13
  sol
  sold'\mbreak
  si,

  %16
  la
  r4 r8 la'
  la4 r8 la

  %19
  la4 r8 la
  la4 r8 dod
  re dod16 si la8 sol

  %22
  fad4 mi
  re r8 la'\mbreak
  la4 r8 la

  %25
  la4 r8 la
  la4 r8 dod
  re dod16 si la8 sol

  %28
  fad mi16 re mi4\tr
  re r
  fad8\p r fad r

  %31
  mi r mi r\mbreak
  fad r fad r
  mi r mi r

  %34
  fad4 r
  R2*22
  mi8 r mi r

  %58
  mi8 r mi r
  mi8 r mi r
  mi r r4

  %61
  fad8 r fad r
  fad8 r fad r
  fad8 r fad r

  %64
  fad4 r8 si,,
  re8\p[re re re]
  mi[mi fad sol]

  %67
  dod,[dod dod dod]
  re[re mi fad]\mbreak
  si,[si si si]

  %70
  dod[dod re mi]
  lad,[lad lad lad]
  si[si dod dod]

  %73
  re[re mi mi]
  fad[fad lad, lad]
  si[si fad' fad]\mbreak

  %76
  si,4 r
  la''8 r la r
  la r la r

  %79
  la r la r
  la r r4
  R2*27

  %108
  la8 r la r
  la r la r
  la r la r

  %111
  la16[re, mi fad sol la si dod]
  re8 dod16 si la8 sol
  fad mi16 re mi4\tr

  %114
  re2

}

IIIvlan = \relative do'{

  re8[re dod dod]
  re8[re dod dod]
  re8[re dod dod]

  %4
  re[la re, re']
  fad[fad fad fad]
  sol[sol sol sol]\mbreak

  %7
  fad[fad fad fad]
  sol[sol sol sol]
  la[la la la]

  %10
  re,[mi fad re]
  re2
  fad

  %13
  re
  mi
  sold

  %16
  mi\mbreak
  fad8[fad mi re]
  dod[re dod si]

  %19
  la[fad' mi re]]
  dod[re dod si]
  la[si' mi, dod]

  %22
  la[si' dod, dod]
  la[fad' mi re]
  dod[dod dod si]\mbreak

  %25
  la[re dod si]
  la[si la sol]
  fad[si' mi, dod]

  %28
  re[re re dod]
  re4 r
  re8 r fad r

  %31
  la r dod r
  la r re, r
  mi r la r

  %34
  la4 r
  R2*22
  la8[la sold sold]

  %58
  la[la sold sold]
  la[la sold sold]
  la[la la lad]\mbreak

  %61
  si[si lad lad]
  si[si lad lad]
  si[si lad lad]

  %64
  si si, r4
  R2*11
  r4 r8 re

  %77
  re[re dod dod]
  re[re dod dod]\mbreak
  re[re dod dod]

  %80
  re re, r4
  R2*27
  re'8[re dod dod]

  %109
  re[re dod dod]
  re[re dod dod]
  re4 r\mbreak

  %112
  la'8[si mi, dod]
  la[re re re]
  re2

}

IIIbcn = \relative do {

  re8[re dod dod]
  re8[re dod dod]
  re8[re dod dod]

  %4
  re[la re, re']
  fad[fad fad fad]
  sol[sol sol sol]\mbreak

  %7
  fad[fad fad fad]
  sol[sol sol sol]
  la[la la la]

  %10
  re,[mi fad re]
  re[re re re]
  re[re re re]

  %13
  sol[sol sol sol]
  mi[mi mi mi]
  mi[mi mi mi]\mbreak

  %16
  la,[la la la]
  re[re' dod si]
  la[si la sol]

  %19
  fad[si la sol]
  fad[sol fad mi]
  re[fad dod la]

  %22
  re[sol la la,]
  re[re' dod si]\mbreak
  la[si la sol]

  %25
  fad[si la sol]
  fad[sol fad mi]
  re sol dod,[la]

  %28
  re re, la''[la,]
  re,4 r
  re'8 r re r

  %31
  dod r dod r\mbreak
  re r re r
  dod r dod r

  %34
  re[mi fad re]
  r sol sol,4
  r8 fad' fad,4

  %37
  r8 mi' mi,4
  r8 re' re,4
  r8 re'' re,4

  %40
  r8 dod' dod,4\mbreak
  r8 dod' dod,4
  r8 la' la,4

  %43
  la8[la' si, si']
  dod,[dod' re, re']
  mi,[mi' fad, fad']

  %46
  sold,4 sold
  sold? sold
  sold? sold

  %49
  sold? sold
  la r
  la r\mbreak

  %52
  la r
  la r
  dod8[re sold, mi]

  %55
  la la, mi'[mi,]
  la2
  la'8[la sold sold]

  %58
  la[la sold sold]
  la[la sold sold]
  la[la la lad]\mbreak

  %61
  si[si lad lad]
  si[si lad lad]
  si[si lad lad]

  %64
  si si, r4
  R2*11
  r4 r8 re

  %77
  re[re dod dod]
  re[re dod dod]
  re[re dod dod]

  %80
  re re, r re'
  re4 re
  re re

  %83
  si si
  si si
  mi mi

  %86
  mi mi
  dod dod
  dod8 [si la sol]

  %89
  fad[mi re re']
  fad re re,4\mbreak
  r8 re' re,4

  %92
  r8 re' re,4
  r8 re' re,4
  r8 re' re,4

  %95
  re' re
  re re
  re re

  %98
  re re
  dod dod
  re8[re' la la,]

  %101
  re[mi fad mi]\mbreak
  re4 re
  re re

  %104
  re re
  re re
  re re

  %107
  re8[re la' la,]
  re[re dod dod]
  re[re dod dod]

  %110
  re[re dod dod]
  re4 r\mbreak
  fad8[sol dod, la]

  %113
  re re, la''[la,]
  re2

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key re\major
  \time 2/4
  \tempo 2 = 62
  s2*56
  \bar":..:"\break
  s2*58
  \bar":|."

}

IIIfl = {
  \IIIglobal
  %\notypeset
  <<\IIIfln \forma>>

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
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #4

  }


  \markup\huge "[1.] [Allegro]"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"Flauto"\vspace #-0.2"Traverso"}
            \Ifl
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
            \IvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
            \IvlII
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \Ivla
          >>
          \new Staff \with {
            fontSize = #+1
            \override StaffSymbol #'staff-space = #(magstep +1)
          }<<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Basso""Continuo"}
            \Ibc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.3\cm

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

}

\pageBreak

\bookpart {

  \paper  {

    systems-per-page = #5

  }


  \markup\huge "[2.] Largo"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IIfl
          >>

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
        >>

      >>
    }

    \layout {

      indent = 0.5\cm

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

}

\pageBreak

\bookpart {

  \paper  {

    systems-per-page = #4

  }


  \markup\huge "[3.] [Allegro]"

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IIIfl
          >>

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

      >>
    }

    \layout {

      indent = 0.5\cm

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

}




%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}
