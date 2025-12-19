\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

"|" = \bar "||"

tasto = _\markup\italic"Tasto"

tr = \trill

dolce =_\markup\italic\center-align"Doux"

forte = _\markup\italic\center-align"fort"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tous"

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



mbreak = { }


Iglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}

IvlIn = \relative do'' {

  re16 dod re mi re8 fad mi16 re mi fad mi fad sol la
  fad8 re fad16 sol fad sol la8 mi la[la]
  la4(sold) la8 dod,16 re mi8 mi

  %4
  re16 dod re mi re mi fad sol mi8-+ mi mi16 re mi fad
  sol8[re re16 dod re mi] fad8[la la si16 la]
  sol16-+[fad sol la sol si la sol] fad[mi fad sol fad la sol fad]

  %7
  mi8-+[mi mi fad16 mi] re8 re re re
  dod16 [si dod re dod mi re dod] si[la si dod si re dod si]\mbreak
  la2 r8 la la la

  %10
  si16 la si dod si dod re si dod si dod re dod re dod re
  mi8 sol,16 la si la si dod re8 re re re
  mi16 re mi fad mi fad sol mi fad mi fad sol fad sol fad sol

  %13
  la8 la, la la si16 la si dod si dod re si
  dod si dod re dod re mi dod re8 [fad, si la16 si]
  sold8 mi' la sol16 la fad8[re la re16 dod]

  %16
  si8[mi si mi16 re] dod8[fad dod fad16 mi]\mbreak
  re8 si mi,[mi] mi mi' dod la
  re16 [dod re mi re8 si] mi16[re mi fad mi8 re16 dod]

  %19
  re8 la' la la la sol sol sol
  sol fad fad fad fad mi mi mi
  mi[la sol la16 sol] fad8 [si la si16 la]

  %22
  sol8 fad16 sol la8 si16 la sol8 fad16 sol fad8.-+ mi16
  mi8 sol sol sol sol fad fad fad
  fad mi16 fad sol fad mi re dod8[re dod8. si16]

  %25
  si8 si' si si si mi, la la
  la re, fad fad fad[si, mi re16 mi]\mbreak
  dod8[re re dod16 re] si8[si si dod16 re]

  %28
  dod8 dod mi dod la[la' sol la16 sol]
  fad8[si la si16 la] sol8[sol sol fad16 mi]
  fad8 sol16 la si la sol fad mi8[fad mi-+ fad16 sol]

  %31
  fad8[la mi la16 sol] fad8[la mi fad16 sol]
  fad sol fad sol la sol fad mi fad sol fad sol la sol fad mi
  fad8[re la re16 dod] si8[mi si mi16 re]

  %34
  dod8[fad dod fad16 mi] re8[sol re sol16 fad]
  mi8[la sol la16 sol] fad8[si la si16 la]
  sol8 la sol fad mi[fad mi8. re16]\mbreak

  %37
  re8 fad mi sol fad[mi mi8.-+ re16]
  re8[re16 mi fad mi re dod] si8[mi16 fad sol fad mi re]
  dod8[fad16 sol la sol fad mi] re8[sol16 la si la sol fad]

  %40
  mi8 la  la la la re, sol[sol]
  sol fad16 sol mi8 fad16 sol fad8 sol16 la si la sol fad
  mi8[la sol fad16 mi] re8 sol16 fad mi8 fad16 sol

  %43
  fad1\fermata

}


IvlIIn = \relative do'' {

  R1
  re16 dod re mi re8 re dod16 si dod re dod8 re16 dod
  si la si dod si8 dod16 si la sol la si la8 dod

  %4
  si16 la si dod re dod re mi dod8 la dod16 si dod re
  mi8 [si si16 dod re mi] re8 re re4~
  re dod re8[la' la si16 la]

  %7
  sol16-+[fad sol la sol si la sol] fad[mi fad sol fad la sol fad]
  mi8[mi mi fad16 mi] re dod re mi re fad mi re\mbreak
  dod8 fad fad fad mi16 re mi fad mi sol fad mi

  %10
  re8 re re re mi16 re mi fad mi fad mi fad
  sol8 si,16 dod re dod re mi fad8 la fad re
  sol si sol mi la re, la si

  %13
  dod[mi16 re dod8 la] re re re re
  mi[mi la sol16 la] fad8 re re re
  mi16 re mi fad mi fad sol mi fad mi fad sol fad sol la fad

  %16
  sol fad sol la sol la si sol la8 la la la\mbreak
  si16 la sol fad mi fad re mi dod8 la' la la
  la sol sol sol sol16[fad sol la sol8 fad16 mi]

  %19
  fad8[re la re16 dod]si8[mi si mi16 re]
  dod8[fad dod fad16 mi] re8 sol sol sol
  sol[fad mi fad16 mi] red8[sol fad sol16 fad]

  %22
  mi8 red16 mi fad8 sol16 fad mi8 red16 mi red8. mi16
  mi8[si mi re16 mi] dod!8 la re dod16 re
  si8 dod16 re mi re dod si lad8 [si lad8. si16]

  %25
  si8 fad' re si si mi dod la
  re la' la la la sol sol sol\mbreak
  sol fad fad fad fad mi mi mi

  %28
  mi mi dod la mi' mi dod la
  re [sol fad sol16 fad]mi8[mi mi re16 dod]
  re8 mi16 fad sol fad mi re dod8 [re dod8. re16]

  %31
  re8 dod dod dod re re re dod
  re16 mi re mi fad mi re dod re mi re mi fad mi re dod
  re8 fad, fad fad sol sol sold sold

  %34
  la la la la sib sib si si
  do do dod dod re re re re
  mi mi  mi re re4. dod8\mbreak

  %37
  re[re si mi16 re] dod8[re dod8. re16]
  re2 r8 dod16[re mi re dod si]
  la8[re16 mi fad mi re dod] si8[mi16 fad sol fad mi re]

  %40
  dod8 dod dod dod re fad re re
  mi re16 mi dod8 re16 mi re8 mi16 fad sol fad mi re
  dod8[fad mi fad16 sol] fad8 mi16 re dod8. re16

  %43
  re1\fermata

}


Ivlan = \relative do {

  R1*3
  r2 la'16 sol la si la8[la]
  sol16 fad sol la sol8 la16 sol fad mi fad sol fad8 sol16 fad

  %6
  mi re  mi fad mi8 fad16 mi re8 re' re re
  re16 re, mi fad dod' fad, sol mi re'8 la la la
  la4 sol si mi\mbreak

  %9
  \clef alto mi8 re re re la'4 la~
  la sold la8 la, la la
  si si si si la la la la

  %12
  sol sol sol sol fad fad fad fad
  mi4 la2 sold4
  la8 la la la la sol fad si

  %15
  si4 la8 la la2
  sol fad8 fad' fad fad\mbreak
  fad mi mi mi mi [mi la sol16 la]

  %18
  fad8 si si si si la la la
  la fad fad fad fad mi mi mi
  mi re re re re [mi mi re16 mi]

  %21
  dod8 do do do \clef bass si re re re
  do do do do si4. si8
  \clef alto mi mi mi re mi re re re

  %24
  re\clef bass sol, mi mi fad mi fad fad,
  <<
    {
      si re re re  mi mi mi mi
      fad fad fad fad sol sol sol sol

      %27
      la la la la si si si si
      dod dod dod dod dod dod dod dod
    }\\{
      si, si si si dod! dod dod dod
      re re re si mi mi mi mi
      fad fad fad fad sol sol sol sol
      la la la la la la la la
    }
  >>
  \clef alto la' la la la si si si sol

  %30
  dod dod fad, fad la,4. la8
  la la la la si re la la
  \clef bass <<
    {
      la la16 la la8 la la la16 la la8 la

      %33
      la la la la sol si si si
    }\\{
      re, re16 re re8 re re re16 re re8 la
      re re re re mi mi mi mi
    }
  >>
  fad fad fad fad sol sol sol sol
  la la la la si si si si

  %36
  dod dod dod re sol, fad sol la\mbreak
  si fad sol mi la sol la la,
  <<
    {
      fad' fad fad fad sol sol sol sol

      %39
      la la la la si si si si
    }\\{
      re, re re re mi mi mi mi
      fad fad fad fad sol sol sol sol
    }
  >>
  la la la la si si si si
  dod dod dod la re4 sol,

  %42
  la8 fad sol la si sol la la,
  re1\fermata

}

Ibcn = \relative do {

  re'2 dod
  re dod
  si4 mi la,2

  %4
  si4 sold la2
  sol fad
  mi re16 dod re  mi re8 re

  %7
  mi16 re mi fad mi fad sol mi fad8 re fad16 sol fad sol
  la8 la la2 sold4\mbreak
  la8 re re re dod [dod dod re16 dod]

  %10
  si8 si si si la la la la
  sol sol sol sol fad fad fad fad
  mi mi mi mi re re re re

  %13
  dod dod dod dod si si si si
  la la la la si16 la si dod si dod re si
  dod si dod re dod re mi dod re8 re re re

  %16
  mi mi mi mi fad fad fad fad\mbreak
  sol sol sold mi la la, la la
  si si si si dod dod dod la

  %19
  re re re re mi  mi mi mi
  fad fad fad re sol sol sol sol
  la la la la si si si si

  %22
  do do la la si la si si,
  mi mi mi mi fad fad fad fad
  sol sol sol mi fad mi fad fad,

  %25
  si si si si dod dod dod dod
  re re re si mi mi mi mi\mbreak
  fad fad fad fad sol sol sol sol

  %28
  la la la la la la la la
  si si si si dod dod dod la
  re re sol, sol la sol la la,

  %31
  re la' la fad si[fad16 sol la8 la,]
  re[re16 re re8 re] re re16 re re8 dod
  re re re re mi mi mi mi

  %34
  fad fad fad fad sol sol sol mi
  la la la la si si si si
  dod dod dod re sol, fad sol la\mbreak

  %37
  si fad sol mi la sol la la,
  re re re re mi mi mi mi
  fad fad fad fad sol sol sol sol

  %40
  la la la la si si si si
  dod dod dod la re4 sol,
  la8 fad sol la si sol la la,

  %43
  re1\fermata

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1*9
  <7>4 <6> s2
  s <6>
  <7>4 <6> s2
  s1*6
  s2 <9>8 <8 4> s4
  s1
  <_+>8 <_-> s4 s2

}

forma = {

  \key re\major
  \time 4/4
  \tempo 2 = 55
  s1*43
  \bar"|."

}


IvlI = {
  \Iglobal
  \notypeset
  %\clef french
  <<\IvlIn \forma>>
}


IvlII = {
  \Iglobal
  %\clef french
  <<\IvlIIn \forma>>
}


Ivla = {
  \Iglobal
  \clef bass
  <<\Ivlan \forma>>
}


Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset
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


IIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}

IIvlIn = \relative do'' {

  fa2 mi4
  re2 dod4
  re mi2-+

  %4
  fa8 mi fa sol mi4
  fa2 mi4
  re2 dod4

  %7
  fa8. mi16 mi4. re8
  re2.
  fa4 sol2-+

  %10
  la8 sib la sol fa4
  sib sol2-+
  la8 sol la sib la4

  %13
  fa sol2-+
  la sol4
  sib8 la sol4.-+ fa8

  %16
  fa4. sib8 la sol
  mi2 fa4

  %18
  mi2 sol4
  fa mi re
  mi8 re mi fa mi4

  %21
  fa2 sol4
  la2 sib4
  la sol fa

  %24
  mi2.
  fa2 mi4
  re2 dod4

  %27
  re mi2-+
  fa8 mi fa sol mi4
  \appoggiatura {re16[mi]} fa2 mi4

  %30
  re2 dod4
  fa8 mi mi4. re8
  re [re re re]

  %33
  mi [fad sol fad16 mi]
  fad8[la la la]
  la[la sold16 la si8]

  %36
  la[re, re re]
  mi[fad sol fad16 mi]
  fad8[la la la]

  %39
  la[la sold16 la si8]
  la[fad fad fad]
  mi[mi mi16 fad sol8]

  %42
  fad[mi mi fad]
  re[fad mi re]
  dod[la' mi la]

  %45
  fad la16 sol fad8 mi16 re
  mi8[la, la la]
  si[si dod si16 dod]

  %48
  re8[la la la]
  si[si dod si16 dod]\mbreak
  re8[fad fad fad]

  %51
  sol[sol sol fad16 mi]
  fad8[fad fad fad]
  sol[sol sol fad16 mi]

  %54
  fad8[la, la la]
  si[si dod si16 dod]
  re8[la la la]

  %57
  si[si dod si16 dod]
  re8 fad16 sol la8 fad16 sol
  la8 fad16 sol la8 si

  %60
  la16 sol la si la8 la
  la fad16 sol la8 fad16 sol
  la8 fad16 sol la8 si

  %63
  la4. mi16 fad
  sol8[fad mi mi16 fad]
  sol8[fad  mi la]

  %66
  sol[fad mi fad]
  re16 dod re mi re8 mi16 fad\mbreak
  sol8[fad mi mi16 fad]

  %69
  sol8[fad mi la]
  sol[fad mi la]
  re,4. fad16 sol

  %72
  fad8[mi re-+ dod]
  re4. mi16 fad
  sol8[fad mi la]

  %75
  fad mi16 fad mi8 fad16 sol
  fad8[mi re-+ dod]
  re4. mi16 fad

  %78
  sol8[fad mi la]
  fad4. fad16 sol
  la8[si la si]

  %81
  la[si la si]
  la[sol fad sol]
  mi16 re mi fad mi8 fad16 sol

  %84
  la8[si la si]
  la[si la sol]
  fad4-+ mi-+

  %87
  re4. re16 mi\mbreak
  fa8[sol mi fa]
  re[mi fa? sol]

  %90
  la16 sol la sib la8 sol
  fa4 mi8-+ re16 mi
  fa8[sol mi fa]

  %93
  re[mi fa sol]
  la16[sol la sib] la8 sol
  fa4 mi8 mi16 fa

  %96
  sol8[mi fa re]
  mi[dod re mi]
  fa4 mi8 mi16 fa

  %99
  sol8[mi fa re]
  mi[dod re mi]

  %101
  fa4 mi-+
  re4. mi16 fa re4. re8  %%%%%alternative
  dod4 re

  %104
  la8[fa' mi fa]
  sol[fa mi re]
  mi16 re mi fa mi8 re

  %107
  dod4 re
  la4. fa'8
  mi[fa sol fa]

  %110
  mi4. fa16 sol
  la4 sol-+
  fa4.-+ fa16 sol

  %113
  la4 sol-+
  fa4. fa16 sol
  la8[sol fa mi]

  %116
  re[fa mi fa]
  sol[fa mi re]
  dod si16 dod la8 si

  %119
  dod[re mi fa]
  sol[fa mi la]
  fa4 mi-+

  %122
  re4. fa16 sol
  la4 sol-+
  re4. fa16 sol  %%%%% alternative
  la8[sol fa mi]

  %126
  re[fa mi fa]
  sol[fa mi re]
  dod si16 dod la8 si

  %129
  dod[re mi fa]
  sol[fa mi la]
  fa4 mi-+ fa4 mi-+ re4 r

}


IIvlIIn = \relative do'' {

  la2 la4
  la2 la4
  la sol2

  %4
  fa la4
  la2 la4
  la2 la4

  %7
  la sol mi
  fa2.
  re'4 mi2-+

  %10
  fa8 sol fa mi re4
  sol mi2-+
  fa8 mi fa sol fa4

  %13
  re mi2
  fa re4
  sol mi4. fa8

  %16
  fa2.
  dod2 re4
  dod2 mi4

  %19
  re dod si
  dod8 si dod re dod4
  re2 mi4

  %22
  fa2 re4
  re dod re
  dod2.

  %25
  la2 la4
  la2 la4
  la sol2

  %28
  fa la4
  la2 la4
  la2 la4

  %31
  la sol mi
  la4 r
  R2

  %34
  r8 la[la la]
  si[dod re dod16 si]
  dod8[re re re]

  %37
  re[re dod16 re mi8]
  re[la la la]
  si[dod re dod16 si]

  %40
  dod8[re re re]
  re re dod16 re mi8
  re[dod dod re]

  %43
  si[si si sold]
  la[dod dod dod]
  re[la la si]

  %46
  la[fad fad fad]
  sol sol sol16 fad mi8
  fad[fad fad fad]

  %49
  sol[sol sol16 fad mi8]\mbreak
  fad8[la la la]
  si[si si la16 sol]

  %52
  la8[la la la]
  si[si si la16 sol]
  la8[fad fad fad]

  %55
  sol[sol sol16 fad mi8]
  fad[fad fad fad]
  sol[sol sol 16 fad mi8]

  %58
  fad re'16 mi fad8 re16 mi
  fad8 re16 mi fad8 sol
  fad16 mi fad sol fad8 fad

  %61
  fad re16 mi fad8 re16 mi
  fad8 re16 mi fad8 sol
  fad4. dod16 re

  %64
  mi8[re dod  dod16 re]
  mi8[re dod re]
  mi[re dod la]

  %67
  fad16 mi fad sol fad8 dod'16 re\mbreak
  mi8[re dod dod16 re]
  mi8[re dod fad]

  %70
  mi[re dod la]
  fad4. la'16 si
  la8[sol fad mi]

  %73
  fad4. dod16 re
  mi8[re dod fad]
  re dod16 re dod8 la'16 si

  %76
  la8[sol fad-+ mi]
  fad4. dod16 re
  mi8[re dod \parenthesize fad]

  %79
  re4. re16 mi
  fad8[sol fad sol]
  fad[sol fad sol]

  %82
  fad[mi re mi]
  dod16 si dod re dod8 re16 mi
  fad8[sol fad sol]

  %85
  fad[sol fad mi]
  re4 dod-+
  re4. fa,16 sol\mbreak

  %88
  la8 [sib sol la]
  fa[dod' re mi]
  fa16 mi fa sol fa8 mi

  %91
  re4 dod8 fa,16 sol
  la8[sib sol la]
  fa[dod' re mi]

  %94
  fa16 mi fa sol fa8 mi
  si4 dod8 dod16 re
  mi8[dod re re]

  %97
  dod[la si dod]
  re4 dod8 dod16 re
  mi8[dod re re]

  %100
  dod[la si dod]
  re4 dod
  re r re4. re8

  %103
  mi4 fa
  dod8[re dod re]
  mi[re dod si]

  %106
  dod16 re dod re dod8 re
  mi4  fa
  dod4. re8

  %109
  dod[re mi re]
  dod4. re16 mi
  fa4 mi-+

  %112
  la,4. re16 mi
  fa4 mi
  fa4. re16 mi

  %115
  fa8[mi re dod]
  re[la sol la]
  sib[la sol fa]

  %118
  mi4. sol8
  la[si dod re]
  mi[re dod re]

  %121
  re4 dod
  re4. re16 mi
  fa4 mi-+

  %124
  re4. re16 mi
  fa8[mi re dod]
  re[la sol la]

  %127
  sib[la sol fa]
  mi4. sol8
  la[si dod re]

  %130
  mi[re dod re]
  re4 dod re4 dod re4 r




}


IIvlan = \relative do' {

  \clef alto re2 dod4
  re2 mi4
  fa mi2

  %4
  re8 dod re mi dod4
  re2 dod4
  re2 mi4

  %7
  sol,8 re' dod4. re8
  re2.
  re4 do2

  %10
  fa sib4
  sol do2
  fa, fa4

  %13
  sib8 la sol2
  fa sib4
  sol do do,

  %16
  fa4. sol8 fa mi
  la2 re,4
  la'2 la4

  %19
  re,2 re4
  la2 la4
  re2 do4

  %22
  fa2 sol4
  fa mi re
  la2.

  %25
  re2 dod4
  re2 mi4
  fa mi2-+

  %28
  re8 dod re mi dod4
  re2 dod4
  re2 mi4

  %31
  la,8 re dod4. re8
  \clef bass re4 r
  R2*7

  %40
  r8 re, [re re]
  mi[fad sol fad16 mi]
  fad8[la la la]

  %43
  la8 la sold16 la si8
  la[la, la la]
  si[dod re dod16 si]

  %46
  dod8[re re re]
  re[re dod16 re mi8]
  re[re re re]

  %49
  re[re dod16 re mi8]\mbreak
  re [re' re re]
  re[re dod16 re mi8]

  %52
  re[re re re]
  re[re dod16 re mi8]
  re[re, re re]

  %55
  re[re dod16 re mi8]
  re8[re re re]

  %57
  re[re dod16 re mi8]
  re re16 re re8 re
  re[re16 re re8 sol,]

  %60
  re' re16 re re8 re
  re re16 re re8 re
  re re16 re re8 sol,

  %63
  re'4. la'8
  mi fad16 sol la8 sol16 fad
  mi8 fad16 sol la8 fad

  %66
  mi fad16 sol la8 la,
  re4. la'8\mbreak
  mi fad16 sol la8 sol16 fad

  %69
  mi8 fad16 sol la8 fad
  mi fad16 sol la8 la,
  re4. re16 dod

  %72
  re8[mi fad la]
  re,4. sol16 fad
  mi8 fad16 sol la8 fad

  %75
  si[sold la re,16 dod]
  re8[mi fad la]
  re,4. sol16 fad

  %78
  mi8 fad16 sol la8 la,
  re4. re16 re
  re8[re re re]

  %81
  re8[re re re]
  re8[re re re]
  la'4. re16 re

  %84
  re8[re re re]
  re[sol, la la]
  si[sol la la,]

  %87
  re4. re'16 re\mbreak
  re8 [sol, do? la]
  sib[sib la sol]

  %90
  fa4 fa8 dod
  re re, \once\stemUp la' re'16 re
  re8[sol, do la]

  %93
  sib[sib la sol]
  fa4 fa8 dod
  re re, la'' sol16 fa

  %96
  mi8 la re, sib'
  la[sol fa mi]
  re[sol la sol16 fa]

  %99
  mi8 la re, sib'
  la[sol fa mi]
  re[sol la la,]

  %102
  re4 la'8 sol16 fa re4. re8
  la'4 re,
  la'8[la sol fa]

  %105
  mi fa16 sol la8 re,
  la4 la8 re
  la'4 re,

  %108
  la'4. la8
  sol[fa mi fa16 sol]
  la4. la16 sol

  %111
  fa4 do?
  fa4. sol16 fa
  fa4 do

  %114
  fa,4. la'16 sol
  fa8[sol la la,]
  re4. re8

  %117
  sol,8[la sib sol]
  la4. la'8
  sol[fa mi re]

  %120
  dod[re mi fa]
  sol[mi la la,]
  re4. la'16 sol

  %123
  fa4 dod
  fa,4. la'16 sol
  fa8[sol la la,]

  %126
  re4. re8
  sol,8[la sib sol]
  la4. la'8

  %129
  sol[fa mi re]
  dod[re mi fa]
  sol[mi la la,] sol'[mi la la,] re4 r

}

IIbcn = \relative do {

  re2 mi4
  fa2 mi4
  re2 dod4

  %4
  re2 la4
  re2 mi4
  fa2 mi4

  %7
  re la' la,
  re2.
  \clef alto re'4 do2

  %10
  fa sib4
  sol do2
  fa, fa4

  %13
  sib8 la sol2
  fa sib4
  sol do do,

  %16
  fa2.
  la2 re,4

  %18
  la'2 la4
  re,2 re4
  la2 la4

  %21
  re2 do4
  fa2 sol4
  fa mi re

  %24
  la2.
  \clef bass re,2 mi4
  fa2 mi4

  %27
  re2 dod4
  re2 la4
  re2 mi4

  %30
  fa2 mi4
  re la' la,\mbreak
  re4 r

  %33
  R2*11
  la'8[la, la la]
  si[dod re dod16 si]

  %46
  dod8[re re re]
  re[re dod16 re mi8]
  re[re re re]

  %49
  re[re dod16 re mi8]\mbreak
  re4 r
  R2*3

  %54
  r8 re[re re]
  re[re dod16 re mi8]
  re8[re re re]

  %57
  re[re dod16 re mi8]
  re re16 re re8 re
  re[re16 re re8 sol,]

  %60
  re' re16 re re8 re
  re re16 re re8 re
  re re16 re re8 sol,

  %63
  re'4. la'8
  mi fad16 sol la8 sol16 fad
  mi8 fad16 sol la8 fad

  %66
  mi fad16 sol la8 la,
  re4. la'8\mbreak
  mi fad16 sol la8 sol16 fad

  %69
  mi8 fad16 sol la8 fad
  mi fad16 sol la8 la,
  re4. re16 dod

  %72
  re8[mi fad la]
  re,4. sol16 fad
  mi8 fad16 sol la8 fad

  %75
  si[sold la re,16 dod]
  re8[mi fad la]
  re,4. sol16 fad

  %78
  mi8 fad16 sol la8 la,
  re4. re16 re
  re8[re re re]

  %81
  re8[re re re]
  re8[re re re]
  la'4. re16 re

  %84
  re8[re re re]
  re[sol, la la]
  si[sol la la,]

  %87
  re4. re'16 re\mbreak
  re8 [sol, do? la]
  sib[sib la sol]

  %90
  fa4 fa8 dod
  re re, \once\stemUp la' re'16 re
  re8[sol, do la]

  %93
  sib[sib la sol]
  fa4 fa8 dod
  re re, la'' sol16 fa

  %96
  mi8 la re, sib'
  la[sol fa mi]
  re[sol la sol16 fa]

  %99
  mi8 la re, sib'
  la[sol fa mi]
  re[sol la la,]

  %102
  re4 la'8 sol16 fa re4. re8
  la'4 re,
  la'8[la sol fa]

  %105
  mi fa16 sol la8 re,
  la4 la8 re
  la'4 re,

  %108
  la'4. la8
  sol[fa mi fa16 sol]
  la4. la16 sol

  %111
  fa4 do?
  fa4. sol16 fa
  fa4 do

  %114
  fa,4. la'16 sol
  fa8[sol la la,]
  re4. re8

  %117
  sol,8[la sib sol]
  la4. la'8
  sol[fa mi re]

  %120
  dod[re mi fa]
  sol[mi la la,]
  re4. la'16 sol

  %123
  fa4 dod
  fa,4. la'16 sol
  fa8[sol la la,]

  %126
  re4. re8
  sol,8[la sib sol]
  la4. la'8

  %129
  sol[fa mi re]
  dod[re mi fa]
  sol[mi la la,] sol'[mi la la,] re4 r

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown


}

forma = {

  \key do\major
  \time 3/4
  \tempo 2. = 60
  s2.*8
  \bar":..:"
  s2.*8
  \bar":..:"
  \mark\markup\smaller"D.C."
  s2.*15
  \bar"||"\break
  \mark\markup\huge "               [3.] Rigodon - Viste"
  \key re\major
  \time 4/8
  \tempo 2 = 66
  s2*56\break
  \key do\major
  s2*8
  \repeat volta 2{s2*6}
  \alternative {{s2}{s}}
  \set Score.currentBarNumber = #103
  s2*9
  \bar".|:"
  s2*12
  \bar":..:"
  \repeat volta 2{s2*7}
  \alternative {{s2}{s s}}
  \bar"|."

}


IIvlI = {
  \IIglobal
  \notypeset
  %\clef french
  <<\IIvlIn \forma>>
}


IIvlII = {
  \IIglobal
  %\clef french
  <<\IIvlIIn \forma>>
}


IIvla = {
  \IIglobal
  \clef bass
  <<\IIvlan \forma>>
}


IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}

IIIvlIn = \relative do'' {

  la2 la la
  re1 re2
  mi2. re4 mi2\mbreak

  %4
  fa2. mi4 fa2
  sol2. fa4 sol2
  la sol fa

  %7
  mi2. re4 mi2
  fa1.
  fa2 fa fa

  %10
  sib1 sib2
  sol sol sol
  do1 do2

  %13
  la la si
  sold mi la~
  la4 si sold?2. la4

  %16
  la2 la2. la4
  la2 sol2.-+ sol4
  sol2 fa2.-+ fa4

  %19
  fa1.
  mi4. fa8 mi2. re4
  re1.

  %22
  la'2^\markup\italic "Reprise" sol2.-+ sol4
  sol2 fa2.-+ fa4
  fa1.

  %25
  mi4. fa8 mi2. re4
  re1.

}


IIIvlIIn = \relative do'' {

  R1.*2
  la2 la la
  re1 re2

  %5
  mi2. re4 mi2
  fa mi re
  dod2. si4 dod2

  %8
  re1 fa2
  re re re
  re1 sol2

  %11
  mi mi mi
  mi1.
  fa2 re2. re4

  %14
  re2 do2. do4
  do4. si8 si2. la4
  la2 fa'2. fa4

  %17
  fa2 mi2. mi4
  mi2 re2.-+ re4
  re1.

  %20
  dod4. re8 dod2. re4
  re1.
  fa2 mi2. mi4

  %23
  mi2 re2.-+ re4
  re1.
  dod4. re8 dod2. re4

  %26
  re1.

}


IIIvlan = \relative do {

  R1.*26

}

IIIbcn = \relative do {

  R1.*5
  re2 re re
  la'1 la2

  %8
  la2. sol4 la2
  sib1.
  sol2 sol sol

  %11
  do1 do2
  la la la
  re1 re,2

  %14
  mi mi fa
  re mi mi,
  la la' re,

  %17
  la' sol mi
  la la re,
  sib' fa sol

  %20
  la2 la,1
  re4 dod? re mi fa re
  sol fa sol la sol mi

  %23
  la sol la sib la fa
  sib la8 sol fa4 mi fa sol
  la2 la,1

  %26
  re1.

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown


}

forma = {

  \key do\major
  \time 3/2
  \tempo 1 = 40
  s1.*26
  \bar"|."

}


IIIvlI = {
  \IIIglobal
  \notypeset
  %\clef french
  <<\IIIvlIn \forma>>
}


IIIvlII = {
  \IIIglobal
  %\clef french
  <<\IIIvlIIn \forma>>
}


IIIvla = {
  \IIIglobal
  \clef bass
  <<\IIIvlan \forma>>
}


IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IVglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

IVvlIn = \relative do'' {

  re8 mi fad sol fad sol mi fad sol fad mi re
  la'4. fad8 mi fad re mi fad mi fad sol
  fad sol la si la si sol la si la sol fad

  %4
  mi-+ mi mi fad mi fad re  mi fad mi re dod
  re mi fad sol la si la sol fad sol fad mi
  red si red mi fad sol fad sol la sol fad sol

  %7
  mi sol la si la si sol la si do si do\mbreak
  si mi, fad sol la si mi, fad sol la sol fad
  sol4. sol8 fad sol mi fad sol fad sol mi

  %10
  red si red mi red mi fad red fad sol fad sol
  la fad la sol fad mi fad sol la sol fad mi
  fad4 si8 la sold fad sold la si la sold fad

  %13
  sold4 do8 si la sold la si do si la sold
  la4 la8 la si sold la4 mi8 fad mi re\mbreak
  mi re mi fad mi re mi4 dod8 re dod si

  %16
  dod si dod re dod si dod la dod re si re
  mi dod mi fad re fad sol mi sol la fad la
  si sol si la sol fad sol mi sol fad mi re

  %19
  mi dod mi re dod si dod la re re mi dod
  re4 la8 la si do si si si mi re mi
  dod? dod dod fad mi fad re re re sol fad sol

  %22
  mi mi mi la sol la\mbreak fad fad fad si la si
  sol mi sol fad re fad mi dod mi re si re
  dod la dod re mi fad mi fad sol fad mi fad

  %25
  re4 la8 la si do si la si mi re mi re4 la'8 sol la sib la sib la sol la sib
  la4 fa8 mi fa sol fa sol fa mi fa sol
  fa sol la sib la sol la4 sol8 fa mi fa

  %28
  re4 la'8\dolce fa sol la sib la sol la4 sol8 fa mi fa
  re4.  r8 fad! fad mi mi fad sol fad sol
  fad4.\fermata r8 fad fad mi mi fad sol fad mi

  %31
  fad4. r r2.

}


IVvlIIn = \relative do'' {

  R1.
  la8 si dod re dod re si dod re dod si la
  re4.~re4 re8 mi4 si8 si dod re

  %4
  dod si la la la la si4 si8 dod re mi
  fad sol la si la sol fad sol la si la sol
  fad red fad sol red mi red mi fad mi mi red

  %7
  mi4 la8 sol fad sol mi fad sol la sol fad\mbreak
  sol dod, re mi re mi dod re mi fad mi red
  mi4. si8 si si do4 si8 la si sol

  %10
  fad si si si la la la la si sol mi' mi
  mi re do mi re do re mi do si la sol
  la4 re8 do si la si do re do si la

  %13
  si4 mi8 re do si do re mi re do si
  do4 do8 si re re dod4 dod8 re dod si\mbreak
  la si la re dod si dod4 mi8 fad mi re

  %16
  mi re mi fad mi re mi dod mi fad mi fad
  sol mi sol la fad la sol4. fad
  sol4. mi4 re8 re4 dod8 re4 la8

  %19
  la la la si la sold la4 la8 sol? sol sol
  fad4 fad8 fad fad fad re re re sol fad sol
  la la la re dod re si si si mi re mi

  %22
  dod dod dod fad mi fad\mbreak re re re sol4.
  si, re la si
  mi, la dod8 re mi re dod re

  %25
  re4 fad,8 fad fad fad re re re sol fa? sol re'4 fa8 mi fa sol fa sol fa mi fa sol
  fa4 la8 sol la sib la sib la sol la sib
  la mi fa sol fa mi fa re dod! re dod re re4 fa8

  %28
  la mi fa sol fa mi fa re dod! re dod re
  re4.  r8 fad! fad mi mi fad sol fad sol
  fad4.\fermata r8 fad fad mi mi fad sol fad mi

  %31
  fad4. r r2.

}


IVvlan = \relative do {

  R1.*2
  re8 mi fad sol fad sol mi fad sol fad mi re
  la'4. la si la
  la4 re,8 sol4 re8 re4 re'8 sol,4 la8

  %6
  si si la sol fad  mi si'4 fad8 sol la si
  mi,4 fad8 sol si, si do4 si8 la re re,\mbreak
  sol la' la mi fad sol la4 sol8 fad si si,

  %9
  mi4. mi8 mi mi la4.la,8 la la
  si si si dod dod dod red red red mi mi mi
  fad fad fad sol la si la sol fad sol la si

  %12
  la4 sold8 la si do si la sold la re do
  si4 la8 si do re do si la si do re
  la4 la8 re, si mi la,4 la8 la la la\mbreak

  %15
  la la la la la la la4 la'8 la la la
  la la la la la la la4 sol8 fad fad fad
  mi mi mi re4 re8 mi dod mi fad re fad

  %18
  sol mi sol la mi si' sol la la, re4 re'8
  dod dod dod si si si la4 fad8 sol mi la
  re,4 re8 re re re sol fad sol mi mi mi

  %21
  fad mi fad re re re sol fad sol mi mi mi
  la sol la fad fad fad\mbreak si la si sol fad sol
  mi mi mi re re re dod dod dod si si si

  %24
  la la' sol fad mi re dod si la re la' la,
  re4 re8 re re re sol fad sol mi mi mi re4 re8 mi re do fa4. do
  fa, do' fa? do

  %27
  fa,8 sib' la sol4 sol8 fa4 mi8 re la' la, re4 re8
  fa,8 sib' la sol4 sol8 fa4 mi8 re la' la,
  re4. r8 re re la' la la la, la la

  %30
  re4.\fermopz r8 re re la' la la la, la la
  re,4 r8 r4. r

}

IVbcn = \relative do {

  R1.*3
  la8 si dod re dod re si dod re dod si la
  re4. sol, re'4 re'8 sol,4 la8

  %6
  si si la sol fad  mi si'4 fad8 sol la si
  mi,4 fad8 sol si, si do4 si8 la re re,\mbreak
  sol la' la mi fad sol la4 sol8 fad si si,

  %9
  mi4. mi8 mi mi la4.la,8 la la
  si si si dod dod dod red red red mi mi mi
  fad fad fad sol la si la sol fad sol la si

  %12
  la4 sold8 la si do si la sold la re do
  si4 la8 si do re do si la si do re
  la4 la8 re, si mi la,4 la8 la la la\mbreak

  %15
  la la la la la la la4 la'8 la la la
  la la la la la la la4 sol8 fad fad fad
  mi mi mi re4 re8 mi dod mi fad re fad

  %18
  sol mi sol la mi si' sol la la, re4 re'8
  dod dod dod si si si la4 fad8 sol mi la
  re,4 re8 re re re sol fad sol mi mi mi

  %21
  fad mi fad re re re sol fad sol mi mi mi
  la sol la fad fad fad\mbreak si la si sol fad sol
  mi mi mi re re re dod dod dod si si si

  %24
  la la' sol fad mi re dod si la re la' la,
  re4 re8 re re re sol fad sol mi mi mi re4 re8 mi re do fa4. do
  fa, do' fa? do

  %27
  fa,8 sib' la sol4 sol8 fa4 mi8 re la' la, re4 re8
  fa,8 sib' la sol4 sol8 fa4 mi8 re la' la,
  re4. r8 re re la' la la la, la la

  %30
  re4.\fermopz r8 re re la' la la la, la la
  re,4 r8 r4. r

}

IVbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1.*2
  s2. s4. <4>8 <6>4
  s1.*6
  s4. <7>4 <6>8 <5->2.
  s1.
  <6>
  s1.
  s4. s4 <7>8

}

forma = {

  \key re\major
  \time 12/8
  \tempo 2. = 60
  \repeat volta 2 {s1.*24}
  \alternative {{s1.}{\set Score.measureLength = #(ly:make-moment 3 8) s4.}}
  \set Score.measureLength = #(ly:make-moment 9 8) \repeat volta 2{ s4.*3
                                                                    \set Score.measureLength = #(ly:make-moment 12 8)
                                                                    \set Score.currentBarNumber = #26
                                                                    s1.*2}
  \alternative {{\set Score.measureLength = #(ly:make-moment 3 8) s4.}{\set Score.measureLength = #(ly:make-moment 12 8) s1.}}
  \set Score.currentBarNumber = #29
  s1.*3
  \bar"|."

}


IVvlI = {
  \IVglobal
  %\notypeset
  %\clef french
  <<\IVvlIn \forma>>
}


IVvlII = {
  \IVglobal
  %\clef french
  <<\IVvlIIn \forma>>
}


IVvla = {
  \IVglobal
  \clef bass
  <<\IVvlan \forma>>
}


IVbc = {
  \IVglobal
  \clef bass
  <<\IVbcn \forma \IVbfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

  systems-per-page = 4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge{"[1.] Allegro"}

\score {

  \new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #7
  } <<

    \new Staff

    <<
      \set Staff.instrumentName =  \markup \center-column  {"VV[iolino"\vspace #-0.2"I]"}
      \set Staff.midiInstrument = #"violin"
      \IvlI
    >>

    \new Staff

    <<
      \set Staff.instrumentName =  \markup \center-column  {"VV[iolino"\vspace #-0.2"II]"}
      \set Staff.midiInstrument = #"violin"
      \IvlII
    >>

    \new Staff

    <<
      \set Staff.instrumentName =  \markup \center-column  {"Viola"\vspace #-0.2"di gamba"\vspace #-0.2"ob[b]ligata"}
      \set Staff.midiInstrument = #"viola"
      \Ivla
    >>

    \new Staff  \with {
      fontSize = #+1.5
      \override StaffSymbol #'staff-space = #(magstep +1.5)
    }
    <<
      \set Staff.instrumentName =  \markup \center-column  {"Organo"}
      \set Staff.midiInstrument = #"cello"
      \Ibc
    >>
  >>

  \layout {

    indent = 1.3\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##f
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

\markup\huge{"[2.] Rondeau Bemol"}

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

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##f
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

%\pageBreak

\markup\huge{"[4.] [Adagio]"}

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

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##f
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

%\pageBreak

\markup\huge{"[5.] [Allegro]"}

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

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #7
      \override SpacingSpanner.uniform-stretching = ##f
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


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}
