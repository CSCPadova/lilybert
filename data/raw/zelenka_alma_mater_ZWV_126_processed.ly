\language "italiano"
	%********************************** VARIABILI

acc = \once \override Stem #'stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

gambd = \set stemRightBeamCount = #1

gambs = \set stemLeftBeamCount = #1

gambss = \set stemLeftBeamCount = #2

gambdd = \set stemRightBeamCount = #2

pipeSymbol = \bar "||"

tasto = _\markup\italic"Tasto"

tr = \trill

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "T."

sos =_\markup\italic"sostenuto"

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

Iglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \con
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
}

IflIn = \relative do'' {

  la'4.^\tu\sos sol8 fad mi16(fad) re re(mi fad)
  mi(la,) dod(mi) sol(fad sol8) sol\tr(fad) r4
  R1

  %4
  mi16.(re32) mi16.(fad32) mi16.(fad32) mi16.(fad32) mi8 re16 dod re4~\mbreak
  re16. dod32 re16. mi32 dod16. si32 dod16. re32 si4. la8
  la16. sol32 la16. si32 la16. si32 la16. si32 la8 sol16 fad sol4~

  %7
  sol16. fad32 sol16. la32 fad16. mi32 fad16. sol32 mi4. mi'8
  fa64(sol la16.) fa64[(sol la16.)] fa64(sol la16.) fa64[(sol la16.)] re,2\prallprall\mbreak
  \grace dod8 re8.\tr dod32 re mi8\upl mi\upl mi4\fermata r8 la

  %10
  la2~la8. (re,16) mi8 dod16.\tr re32
  re4 r r2
  r fa64(sol la16.) fa64[(sol la16.)] fa64(sol la16.) fa64[(sol la16.)]\mbreak

  %13
  re,2 \appoggiatura {dod!8[re]} re8.\tr (dod32 re) mi8(dod)
  la re' re2.~
  re2 dod8 re16.\tr [dod64 re] mi16.(re32) re16.(dod32)

  %16
  \appoggiatura re8 dod8.(re16) mi8[(dod)] la la,\noBeam la4~
  la2 si
  dod8 mi mi2 mi4~

  %19
  mi r16 la [dod la] \grace sold8 la8.\tr sold32 la si8 sold
  \appoggiatura fad8 mi4 r r2\mbreak
  mi4. re8 dod8 si16 dod la8 si16 dod

  %22
  si mi, sold si re8\upl re\upl \grace mi re\tr [dod] r4
  R1*3
  r2 fad16.(mi32) fad16.(sold32) fad16.(sold32) fad16.(la32)

  %27
  sold8 fad16 sold la2
  sold8. la16 la4 r r2
  R1*13

  %42
  fad4. mi8 re(dod16 re) si si dod re
  dod fad, lad dod mi8 mi mi(re16 mi) fad8(mi)
  dod4. fad8 mid mid fad sold\mbreak

  %45
  fad16.(mi32) fad16.(sol32) fad16.(sol32) fad16.(sol32) fad8 mi16 red mi4~
  mi16. re32 mi16. fad32 re16. dod32 re16. mi32 dod4. si8
  si4 si' si2

  %48
  la16. si32 si16.[la64 si] dod8 si dod4\fermata r
  R1*2

}

IflIIn = \relative do'' {

  R1
  r2 re4.\tu\sos re8
  dod si16 (dod) la la(si dod) si(mi,) sold(si) re(dod re8)

  %4
  re8(dod) r4 fad16.(mi32) fad16.(sol32) fad16. re32 fad16. la32\mbreak
  sold8 fad16 sold la2 sold8. la16
  la4 r si,16. la32 si16. do32 si16. do32 si16. red32

  %7
  do?8 si16 do re2 do8. re16
  re4 r8 la si64(do re16.) si64[(do re16.)] si64(do re16.) si64[(do re16.)]\mbreak
  \tuplet3/2{sol,16(fad sol) sol[(fad sol)] sol(fad sol) sol[(fad sol)]} sol4\fermata r16 sol la sol

  %10
  fad16.(la32 re16.) fad,32 mi8[(dod')] fad,16.(la32 re16.) fad,32 mi8 dod'16.(re32)
  re4 r r2
  r r4 r8 la\mbreak

  %13
  si64(do re16.) si64[(do re16.)] si64(do re16.) si64[(do re16.)] \tuplet3/2 {sol,16(fad sol) sol[(fad sol)] sol(fad sol) sol[(fad sol)]}
  fad8 mi re4 r2
  R1*6

  %21
  mi'4. re8 dod8 si16 dod la8 si16 dod
  si mi, sold si re8\upl re\upl \grace mi re\tr [dod] r4
  R1*3

  %26
  mi16.(re32) mi16.(fad32) mi16.(re32) mi16.(fad32) mi8 re16 dod re4~
  re16.(dod32) re16.(mi32) dod16.(si32) dod16. (re32) si4. la8
  la4 r r2

  %29
  R1*13
  fad'4. mi8 re(dod16 re) si si dod re
  dod fad, lad dod mi8 mi mi(re16 mi) fad8(mi)
  dod4. fad8 mid mid fad sold\mbreak

  %45
  fad16.(mi32) fad16.(sol32) fad16.(sol32) fad16.(sol32) fad8 mi16 red mi4~
  mi16. re32 mi16. fad32 re16. dod32 re16. mi32 dod4. si8
  si4 r8 fad sol64(la si16.) sol64[(la si16.)] sol64(la si16.) sol64[(la si16.)]

  %48
  \tuplet3/2{\con mi,16(re mi) mi[(re mi)]  mi[(re mi)]  mi[(re mi)]} mi4\fermata r
  R1*2

}

IvlIn = \relative do'' {

  la'4. sol8 fad mi16(fad) re re(mi fad)
  mi(la,) dod(mi) sol(fad sol8) sol\tr(fad) r4
  R1

  %4
  mi16.(re32) mi16.(fad32) mi16.(fad32) mi16.(fad32) mi8 re16 dod re4~\mbreak
  re16. dod32 re16. mi32 dod16. si32 dod16. re32 si4. la8
  la16. sol32 la16. si32 la16. si32 la16. si32 la8 sol16 fad sol4~

  %7
  sol16. fad32 sol16. la32 fad16. mi32 fad16. sol32 mi4. re8
  re4 r8 fa? re4 r8 re\mbreak
  mi4 r8 re dod4\fermata r8 dod

  %10
  re4 dod8 mi re4 dod8 mi
  re4 r r2
  R1*9

  %21
  r2 r4 la'8 si16 dod
  si mi, sold si re8\upl re\upl \grace mi re\tr [dod] r4
  fad,8(mi) red(fad) si,4 r

  %24
  mi8(re) dod(mi) la,4 r\mbreak
  R1
  r2 fad''16.\tu(mi32) fad16.(sold32) fad16.(sold32) fad16.(la32)

  %27
  sold8 fad16 sold la2
  sold8. la16 la4 r8 re,, dod4 r8 mi\mbreak
  la,4 r8  la' sib64(dod re16.) sib64[(dod re16.)] sib64(dod re16.) sib64[(dod re16.)]

  %30
  \tuplet3/2{sol,16 fad sol \senza sol[fad sol] sol fad sol sol[fad sol]} fad8.(mi16) re4
  r r8 mi red4 r8 fad
  si,4 r8 si' do64(re mi16.) do64[(re mi16.)] do64(re mi16.) do64[(re mi16.)]

  %33
  \tuplet3/2{la,16(sold la) la[(sold la)] la16(sold la) la[(sold la)]} sold8.(fad16) mi4
  r4 r8 fad mid4 r8 sold
  dod,4 r8 dod' re64 mi fad16. re64[mi fad16.] re64 mi fad16. re64[mi fad16.]

  %36
  \tuplet3/2{si,16 lad si si[lad si] si lad si si[lad si]} lad8. sold16 fad4\mbreak
  R1
  r8 fad\p si si, r mi fad[dod']

  %39
  r4 r8 fad, sol si16(la) sol(fad) sol(la)
  si8 si si, si' si,4 r
  R1

  %42
  fad''4.\tu mi8 re(dod16 re) si si dod re
  dod fad, lad dod mi8 mi si4. si8
  la sold16 la fad fad sold la sold dod, mid sold si8 si\mbreak

  %45
  fad'16.(mi32) fad16.(sol32) fad16.(sol32) fad16.(sol32) fad8 mi16 red mi4~
  mi16. re32 mi16. fad32 re16. dod32 re16. mi32 dod4. si8
  si4 r r2

  %48
  r r4 r16 mi, fad mi
  re4 dod^\markup\italic"adag[io]" dod 4. si8
  si2 r

}

IvlIIn = \relative do'' {

  R1
  r2 re4.\tu re8
  dod si16 (dod) la la(si dod) si(mi,) sold(si) re(dod re8)

  %4
  re8(dod) r4 fad16.(mi32) fad16.(sol32) fad16. re32 fad16. la32\mbreak
  sold8 fad16 sold la2 sold8. la16
  la4 r si,16. la32 si16. do32 si16. do32 si16. red32

  %7
  do?8 si16 do re2 do8. re16
  re4 r8 fa,? re4 r8 re\mbreak
  mi4 r8 re dod4\fermata r8 dod

  %10
  re4 dod8 mi re4 dod8 mi
  re4 r r2
  R1*9

  %21
  dod'8(\tu(si) la(si) mi,4 r8 mi
  sold si la si mi,4 r
  fad8(mi) red(fad) si,4 r

  %24
  mi8(re) dod(mi) la,4 r\mbreak
  R1
  mi''16.\tu(re32) mi16.(fad32) mi16.(re32) mi16.(fad32) mi8 re16 dod re4~

  %27
  re16.(dod32) re16.(mi32) dod16.(si32) dod16. (re32) si4. la8
  la4 r8 re, dod4 r8 mi\mbreak
  la,4 r8 fad' re4 r8 re

  %30
  mi4 r8 dod re4 r
  r r8 mi red4 r8 fad
  si,4 r8 sold' mi4 r8 mi\mbreak

  %33
  fad4 r8 red si4 r
  r r8 fad' mid4 r8 sold
  dod,4 r8 lad' fad4 r8 fad

  %36
  sold4 r8 sold dod,4 r\mbreak
  R1
  r8 fad\p si si, r mi fad[dod']

  %39
  r4 r8 fad, sol si16(la) sol(fad) sol(la)
  si8 si si, si' si,4 r
  R1

  %42
  fad''4.\tu mi8 re(dod16 re) si si dod re
  dod fad, lad dod mi8 mi si4. si8
  la sold16 la fad fad sold la sold dod, mid sold si8 si\mbreak

  %45
  si8 lad r4 sol16. fad32 sol16. lad32 sol16.(fad32) sol16.(si32)
  lad8 sold16 lad si2 lad8. si16
  si8 la16 sol fad8 red si4 r8 si

  %48
  dod4 r8 si lad4\fermata r8 lad\mbreak
  si2 si4 lad8. si16
  si2 r

}


Ialton = \relative do' {

  \autoBeamOff
  R1*10
  r4 la'2^\markup\italic"ad libitum"~la8 sol
  fa?4.(mi8) re2\mbreak

  %13
  R1
  la'4. re,8 si' si si si
  si16[(sol)] la8 r la sol mi16 fad sol8 sol

  %16
  sol[la16(si)] la8 sol sol fad r mi\mbreak
  fad fad4 mi16[fad] sold8 sold4\tr fad16[sold]
  la8 [mi\tr]~mi16[la sold? la] si8[mi,\tr]~mi16 [si' la si]

  %19
  dod8[mi,\tr]~mi16[dod' si dod] re8[mi,\tr]~mi16[re' dod si]
  dod[si la sold] la8 [fad] sold4.^\markup\italic"al pl[aci]mento" la8\mbreak
  la4 r r2

  %22
  r la8 la4 si16[do]
  si8 si4 la16[si] sol8 sol4 fad16[sol]
  la8 la4 sol16[la] fad8 fad4 mi16[fad]\mbreak

  %25
  sol4. fad8 fad2^\markup\italic"al pl[aci]mento"
  mi4 r r2
  r r4 r8 mi

  %28
  la mi16 fad sol8 sol sol [la16 sib?] la8 sol\mbreak
  sol fad r4 r2
  r r4 r8 fad

  %31
  si fad16 sol la8 la la[si16 do?] si8 la
  la sold r4 r2\mbreak
  r r4 r8 sold?

  %34
  dod sold16 la si8 si si[dod16 re] dod8 si
  si lad r4 r2
  r r4 r8 lad

  %37
  si si4 lad16[si] dod8 dod4 si16[dod]
  re[dod si la] sol[fad mi red] mi8[dod']~dod16[si lad sold]
  fad[mi re dod] re8[si']~si16[la sol fad] mi[red mi8]~

  %40
  mi16[sol]~ \tuplet3/2{sol[(fad mi)]}  fad[la]~\tuplet3/2{la[(sold fad)]} sold[si]~\tuplet3/2{si[(lad sold)]} lad[dod]~\tuplet3/2{dod[(si lad)]}\mbreak
  si2~si8 sold lad8. si16
  si4 r r2

  %43
  R1*8

}

Itesto = \lyricmode {

  Al -- ma al -- ma al -- ma Redemptoris _ _ _ Ma -- ter quae pervia _ _ coeli _ por -- _ ta manes _ et stel - - - la _ ma - - - - - - - ris.

  Al ma _ Redempto - - - - - - - - - - - - ris Ma -- ter quae pervia _ _ coeli _  por - ta manes _ quae pervia _ _ Coeli _  por - ta manes _ quae pervia _ _ coeli _  por - ta manes _

  et stella _ _ ma - - - - - - - - - - - - - - - ris.

}


Ibcn = \relative do {

  re8^\markup\italic"Solo: pianissimo sempre" mi fad mi re mi fad re
  la' la, si dod re mi fad re
  la' si dod la mi' mi, fad sold

  %4
  la si dod la re, mi fad re\mbreak
  mi mi, fad fad' re si mi mi,
  la' sol fad re sol la si sol

  %7
  la la, si si' sol mi la la,
  re mi fa re sol sol, sol' fa\mbreak
  mi re dod si la4\fermata r8 la

  %10
  re fad la la, re fad la la,
  re4 r r2
  r re8^\markup\italic"Larghetto" mi fa re\mbreak

  %13
  sol sol, sol' fa? mi re dod la
  re mi fad fad, sol sol'16 fad sol8 sol,
  re[re'16 mi fad8 re] mi re dod si

  %16
  la4 dod8 la re re'16 dod re8 la\mbreak
  re re, re' dod si mi, mi' re
  dod dod dod dod sold sold sold sold

  %19
  la la la la si la sold mi
  la mi' dod re mi4 mi,_\markup\italic"adag[io]"\mbreak
  la8 si dod si la si dod la

  %22
  mi' mi, fad sold la, la'16 sold fad8 mi
  red dod si red mi sol16 fad mi8 re?
  dod si la dod re[fad16 mi re8 dod]\mbreak

  %25
  si mi si dod re2
  la'8 si dod la re, mi fad re
  mi mi, fad fad' re si mi mi,

  %28
  dod'4 r8 si la4 r8 dod\mbreak
  re mi fad re sol sol, sol' fad
  mi re dod la re mi fad mi

  %31
  red4 r8 dod si4 r8 red
  mi fad sold mi la la, la' sold\mbreak
  fad mi red si mi fad sold fad

  %34
  mid4 r8 re dod4 r8 mid
  fad sold? lad fad si si, si' la?
  sold fad  mi mid fad sold lad fad\mbreak

  %37
  si dod re si lad sol fad lad
  si4 r8 si dod16 si lad sold? fad4
  r8 lad si16 la? sol fad mi4 r8 sol16 fad

  %40
  sol8 mi re4 mi fad\mbreak
  sol8_\markup\italic"adagio"[fad mi re16 mi] fad2
  si8 dod re dod si dod re si

  %43
  fad' fad, sold lad si dod re si
  fad sold? la fad dod' dod, red mid\mbreak
  fad mi re si mi fad sol mi

  %46
  fad fad, sol sol' mi dod fad fad,
  si dod re si mi mi, mi' re
  dod si lad sol fad4\fermata r8 fad

  %49
  si4^\markup\italic"adag[io]" mid fad2
  si, r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

s1
s4 <6> <4> <6>
s2  <_+>4 <6>
<4> <6> <9> <6>
<7 _+> <5> <6 5> <_+>
s <6> <9> <6>
<7> <5> <6 5> s
<_-> s <5 _->8 \bassFigureExtendersOn <5 _-> <5 _->16 s <6 _-> s\bassFigureExtendersOff
<6>8 <5> <6> s <7>4 s
s1*2
s2 <_->4 s
\bassFigureExtendersOn <5 _->8 <5 _-> <5 _->16 s <6 3> s <6>8 <5> <6> s
s1
<6 4>8 s <6>4 <5>8 <5> <6>4
<7> <6> <4>8 <3> s4
s1*9
s2 <9>4 <6>
\bassFigureExtendersOff <7 _+> <5>
<6 5> <_+>
<6>4 s8 <6> <7>4 s8 <6>
<4>4 <6> \bassFigureExtendersOn <5 _->8 <5 _-> <5 _->16 s <6 3> s
\bassFigureExtendersOff <6>4 <6> s2
<6>4 s8 <6> <7 _+>4 s8 <6>
<4>4 <6>8 <_+>
\bassFigureExtendersOn <5 _->8 <5 _-> <5 _->16 s <6 3> s\bassFigureExtendersOff
s1
s2 <_+>
<4>4 <6>8 <_+> \bassFigureExtendersOn <5 3>8 <5 3> <5 3>16 s <6 3> s\bassFigureExtendersOff
s4 <5>8 <6 _+> <_+>4 <6>8 <_+>
s2 <6>
s <6>4 <_+>
s8 <6> s4 s s8 <6>
<6>2 <_+>4 <5 _+>
s2 <4>4 <_+>
s2 s4 <6>
<_+>4 \bassFigureExtendersOn <6>8 <6> <4>4 <6>
s1
<4>4 <6> <9> <6>
<7 _+> <5>8 s <6 5>4 <_+>
s2 <5 3>8 <5 3> <5 3>16 s <6 3> s
<6\\>4 <6>8 <6> <7 _+>4 s8 <_+>
s4 <6 5> <4> <_+>

}

forma = {

  %\override Staff.TimeSignature #'style = #'single-digit
  \time 4/4
  \key re\major
  \tempo 4 = 45
  s1*50
  \bar"|."

}


IflI = {
  \Iglobal
  \notypeset
  <<\IflIn \forma>>

}

IflII = {
  \Iglobal
  <<\IflIIn \forma>>

}


IvlI = {
  \Iglobal
  <<\IvlIn \forma>>

}

IvlII = {
  \Iglobal
  <<\IvlIIn \forma>>

}


Ialto = {
  \new Voice = "alma"
  \Iglobal
  \clef alto
  <<\Ialton \forma>>

}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset

}

IIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \con
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
}

IIvlIn = \relative do'' {

  r4 r mi, sol8_\upl [fad_\upl sol la si dod]
  re la fad la fad16 re fad la  re8 [la fad la] fad16 re fad la\mbreak
  re8 dod?16 si la8 [sol fad la16 sol] fad8 mi re4 r8 re'

  %4
  sol\upl re\upl si32(do re8.) sol,8_\upl si_\upl mi,16 [red mi fad] sol[fad sol la] si do red si
  mi8\upl si\upl sol32(la si8.) mi,8_\upl sol_\upl do,16[si do re] mi re mi fad sol[la si sol]
  do8_\upl sol_\upl mi32 [fad sol8.] do,8[mi] la,4\sos  r8 re sol4\mbreak

  %7
  r8 sol do,4 re sol, r r
  sol r r r2 r4
  R1.

  %10
  r4 r16 la' si dod re4 r r8 la, dod mi
  sol4\sos r8 dod, re4 r8sol do,4 re
  sol8 fad16 mi re8 [do si la] sol4 r r

  %13
  R1.
  r2 r4 re'8\upl\f [dod\upl re mi fad sol]
  la [sol la si dod la] re4 r r

  %16
  R1.
  r2 r4 r r r16 la\f si dod\mbreak
  re8\upl la\upl fad32[(sol la8.)] re,8 fad si,4 r r16 si'\p dod re

  %19
  mi8[si] sol32[(la si8.)] mi,8 sol dod,4 r r16 la'\f si dod
  re8\upl la\upl fad32[(sol la8.)] re,8 fad si,4\sos \breathe si'\p sol
  la r r r2 r4

  %22
  R1.
  r4 r la,\f re8_\upl [dod?_\upl re mi fad sol]
  la_\upl mi_\upl dod mi dod16 [la dod mi] la8 [mi dod mi] dod16[la dod mi]

  %25
  la8\tr sol16 fad mi8 [re dod mi16 re] dod8\p si la4 r16 la' si dod\mbreak
  re8\upl [la\upl] fad32(sol la8.) re,8\upl[fad\upl] si,2 r4
  r4 re'\p re sol,8(fad) sol4 r

  %28
  r do do fad,8(mi) fad4 r
  r2 r4 r do'(si)\mbreak
  la8[si] do(si16 do) re8[(mi)] la,(sold) la4 si~

  %31
  si8 la si4 do~do8 si do4 re~
  re8 [do si(la) si(sol)] red'[(mi) fad(mi) fad(red)]
  \tupletSpan 4 \tuplet3/2{mi8(re mi)}  si4 r r r r16 si\f dod red\mbreak

  %34
  mi8[dod lad fad lad dod] mi4 r8 lad, si4
  r8 mi la,4 si mi, r r
  r2 r4 r r r16 mi\p fad sold

  %37
  la8_\upl mi_\upl do32[(re mi8.)] la,8_\upl do_\upl re4 r r
  r2 r4 r fad32[(sol la8.)]re,8\upl fad\upl
  si,4\breathe re\p re mi2 re4

  %40
  R1.
  r4 r r16 re'\f mi fad sol8\upl[re\upl] si32(do re8.) sol,8_\upl[si_\upl]\mbreak
  mi,4 r r do\p mi do

  %43
  la r r re fad re
  si r r16 sol'\f la si do8[sol] mi32[(fad sol8.)] do,8 mi
  re'\p[la] fad32[(sol la8.)] re,8 fad mi'\f [si] sol32[(la si8.)] mi,8 sol\mbreak

  %46
  fad4  r r r2 r4
  r r r16 sol\p la si do8[sol] mi32(fad sol8.) do,8_\upl[mi_\upl]
  la,4\sos^\f r r r re_\upl\p fad_\upl

  %49
  r mi_\upl\f sol_\upl r fad_\upl\p la_\upl \mbreak
  sol8\p_\upl[mi_\upl] si32 (do re8.) sol,8_\upl[si_\upl] sol'4 r r
  R1.

  %52
  r4 r r8 re'\f sol\upl [re\upl] si32(do re8.) sol,8_\upl[si_\upl]
  fad16 [re  mi fad] sol fad sol la si [do red si] mi8\upl[si\upl] sol32(la si8.) mi,8_\upl[sol_\upl]\mbreak
  do,16 si do re mi [re mi fad] sol la si sol do8_\upl[sol_\upl] mi32(fad sol8.) do,8_\upl[mi_\upl]

  %55
  la,4\sos  r8 re_	\upl sol4_\upl r8 dod, re4 re
  sol8 fad16 mi re8 [do si la] sol2


}

IIvlIIn = \relative do'' {



  r4 r mi, sol8_\upl [fad_\upl sol la si dod]
  re la fad la fad16 re fad la  re8 [la fad la] fad16 re fad la\mbreak
  re8 dod?16 si la8 [sol fad la16 sol] fad8 mi re4 r8 re'

  %4
  sol\upl re\upl si32(do re8.) sol,8_\upl si_\upl mi,16 [red mi fad] sol[fad sol la] si do red si
  mi8\upl si\upl sol32(la si8.) mi,8_\upl sol_\upl do,16[si do re] mi re mi fad sol[la si sol]
  do8_\upl sol_\upl mi32 [fad sol8.] do,8[mi] la,4\sos  r8 re sol4\mbreak

  %7
  r8 sol do,4 re sol, r r
  sol r r r2 r4
  R1.

  %10
  r4 r16 la' si dod re4 r r8 la, dod mi
  sol4\sos r8 dod, re4 r8sol do,4 re
  sol8 fad16 mi re8 [do si la] sol4 r r

  %13
  R1.
  r2 r4 re'8\upl\f [dod\upl re mi fad sol]
  la [sol la si dod la] re4 r r

  %16
  R1.
  r2 r4 r r r16 la\f si dod\mbreak
  re8\upl la\upl fad32[(sol la8.)] re,8 fad si,4 r r16 si'\p dod re

  %19
  mi8[si] sol32[(la si8.)] mi,8 sol dod,4 r r16 la'\f si dod
  re8\upl la\upl fad32[(sol la8.)] re,8 fad si,4\sos \breathe si'\p sol
  la r r r2 r4

  %22
  R1.
  r4 r la,\f re8_\upl [dod?_\upl re mi fad sol]
  la_\upl mi_\upl dod mi dod16 [la dod mi] la8 [mi dod mi] dod16[la dod mi]

  %25
  la8\tr sol16 fad mi8 [re dod mi16 re] dod8\p si la4 r16 la' si dod\mbreak
  re8\upl [la\upl] fad32(sol la8.) re,8\upl[fad\upl] si,2 r4
  r4 re'\p re sol,8(fad) sol4 r

  %28
  r do do fad,8(mi) fad4 r
  r2 r4 r do'(si)\mbreak
  la8[si] do(si16 do) re8[(mi)] la,(sold) la4 si~

  %31
  si8 la si4 do~do8 si do4 re~
  re8 [do si(la) si(sol)] red'[(mi) fad(mi) fad(red)]
  \tupletSpan 4 \tuplet3/2{mi8(re mi)}  si4 r r r r16 si\f dod red\mbreak

  %34
  mi8[dod lad fad lad dod] mi4 r8 lad, si4
  r8 mi la,4 si mi, r r
  r2 r4 r r r16 mi\p fad sold

  %37
  la8_\upl mi_\upl do32[(re mi8.)] la,8_\upl do_\upl re4 r r
  r2 r4 r fad32[(sol la8.)]re,8\upl fad\upl
  si,4\breathe re\p re mi2 re4

  %40
  R1.
  r4 r r16 re'\f mi fad sol8\upl[re\upl] si32(do re8.) sol,8_\upl[si_\upl]\mbreak
  mi,4 r r do\p mi do

  %43
  la r r re fad re
  si r r16 sol'\f la si do8[sol] mi32[(fad sol8.)] do,8 mi
  re'\p[la] fad32[(sol la8.)] re,8 fad mi'\f [si] sol32[(la si8.)] mi,8 sol\mbreak

  %46
  fad4  r r r2 r4
  r r r16 sol\p la si do8[sol] mi32(fad sol8.) do,8_\upl[mi_\upl]
  la,4\sos^\f r r r re_\upl\p fad_\upl

  %49
  r mi_\upl\f sol_\upl r fad_\upl\p la_\upl \mbreak
  sol8\p_\upl[mi_\upl] si32 (do re8.) sol,8_\upl[si_\upl] sol'4 r r
  R1.

  %52
  r4 r r8 re'\f sol\upl [re\upl] si32(do re8.) sol,8_\upl[si_\upl]
  fad16 [re  mi fad] sol fad sol la si [do red si] mi8\upl[si\upl] sol32(la si8.) mi,8_\upl[sol_\upl]\mbreak
  do,16 si do re mi [re mi fad] sol la si sol do8_\upl[sol_\upl] mi32(fad sol8.) do,8_\upl[mi_\upl]

  %55
  la,4\sos  r8 re_	\upl sol4_\upl r8 dod, re4 re
  sol8 fad16 mi re8 [do si la] sol2

}


IIalton = \relative do' {

  \autoBeamOff
  R1.*6
  r2 r4 r r re
  sol8[fad] sol[la] si[do] re[la fad la] fad16[re fad la]

  %9
  re8[la fad la] fad16[re fad la] re8[do16 si] la8[sol fad la16 sol]\mbreak
  fad8[mi] re4 r r2 r4
  R1.

  %12
  r4 r re sol8[fad] sol[la]si[do]
  re[la fad la] fad16[re fad la] re8[la fad la] fad16[re fad la]\mbreak
  re8[do16 si] la8[sol fad la16 sol] fad8[mi] re4 r

  %15
  r r la' fad8[mi]fad[sol] la[fad]
  si sol4 mi8[dod mi] la\noBeam fad4 re8[si re]
  sol[fad sol la sol fad] mi[dod] la4 r\mbreak

  %18
  r2 r4 fad' si8[la] sol8 fad
  sol2.~sol4 la8[sol fad mi]
  fad2.~fad4 sol8[fad mi re]

  %21
  dod la'4 sol fad16[mi] fad8 si4 la sol16[fad]\mbreak
  sol8 mi4 fad16[sol] la8[sol] fad re'4 do16[si] la8[sol]
  fad16[(mi re8)] mi2 re r4

  %24
  R1.
  r2 r4 la'8. la16 la8 si la sol\mbreak
  fad8. [mi16] re4 r r fad fad

  %27
  sol4. la8 sol8[fad] mi[red] mi4 mi
  fad fad8[(sol)] fad[(mi)] red[do] red4 r
  r si' la sol4. fad8 sol4\mbreak

  %30
  r la sol fad8[mi] fad16[sol] la4 sol16[fad]
  sol8 [fad] sol16[la] si4 la16[sol] la8[fad] la16[si] do4 si16[la]
  si8[la sol fad sol mi] la2.~

  %33
  la4 sol8[fad] sol4~sol8[la] fad2\mbreak
  mi4 r r r2 r4
  r2 r4 sol sold4. fad16[sold]

  %36
  la4 la2 si4 si4. la16[si]
  do8. si16 la4 r r do4 do\mbreak
  si la4. sol8 fad8.[mi16] re4 r

  %39
  r sol4 sol la2 sol4
  r do la si2.
  la4 r r r2 r4\mbreak

  %42
  sol4(si) sol mi8[fad] sol4 r
  la(do) la fad8[sol] la4 r
  r re, re mi mi4. re16[mi]

  %45
  fad4 fad4.\tr mi16[fad] sol4 sol4.\tr fad16[sol]\mbreak
  la4 si do si la r
  s sol fa mi2 mi4

  %48
  r la sol fad si8[(la) la(sol)]
  sol4 do8[(si) si(la)] la4 re8[(do) do(si)]\mbreak
  si2.~si8[la si sol la si]

  %51
  do4. la8 si4~\breathe si8^\markup\italic"ad libitum" la la2
  sol4 r r r2 r4
  R1.*4

}

IItesto = \lyricmode {

Suc -- curre _ ca -- den - - - - - - ti

Suc -- curre _ caden - - - - - - - ti

Suc -- curre _ caden - - - - - - - - ti

Suc -- curre _ caden - - - - - - - - - - - - - - - - - - - - - - ti,

Surgere _ _ qui curat _ populo: _

tu quae genu - - is -- ti, na -- tura _ mi -- rante, _

tuum _ Sanctum _ _ Geni - to - - - - - - - - - - - - - - - - rem.

Virgo _ _ prius _ ac po - sterius _ _ Gabri - elis _ ab ore _ sumens _ illud _ illud _
a -- ve,

Virgo _ prius _ ac posterius _ _ Gabri - elis _ ab o - - - - - - re ab o -- re sumens _ illud _ illud _ a - - - - - - - - - - - ve,

}


IIbcn = \relative do {

  r4 r mi sol8\upl [fad\upl sol la si dod]
  re la fad la fad16 re fad la  re8 [la fad la] fad16 re fad la\mbreak
  re8 dod?16 si la8 [sol fad la16 sol] fad8 mi re4 r8 re'

  %4
  sol\upl re\upl si32(do re8.) sol,8\upl si\upl mi,4 r r8 si'
  mi8\upl si\upl sol32(la si8.) mi,8\upl sol\upl do,4 r r8 sol'
  do8\upl sol\upl mi16 [fad sol8] do,8\upl mi\upl la,4\sos r8 re sol4\mbreak

  %7
  r8 sol do,4 re sol8 fad16\p mi re8 do si[la]
  sol4 sol' mi re r r
  re r r re r r\mbreak

  %10
  re r r16 re\f mi fad sol8 [mi dod la dod mi]
  sol4^\sos r8 dod, re4 r8 sol do,?4 re4
  sol8 fad16 mi re8 [do si la] sol4 sol'\p mi

  %13
  re r r re r r\mbreak
  re r r re8\upl\f [dod\upl re mi fad sol]
  la [sol la si dod la] re4 r re,\p

  %16
  sol r la fad r sol
  mi r mi la r r16 la\f si dod\mbreak
  re8\upl la\upl fad32[(sol la8.)] re,8 fad si,4 r r16 si'\p dod re

  %19
  mi8[si] sol32[(la si8.)] mi,8 sol dod,4 r r16 la'\f si dod
  re8\upl la\upl fad32[(sol la8.)] re,8 fad si,4 \breathe si'\p sol
  la dod,? la' re re, red\mbreak

  %22
  mi dod la re fad la
  re sol, la re,8\upl\f [dod?\upl re mi fad sol]
  la\upl mi\upl dod mi dod16 [la dod mi] la8 [mi dod mi] dod16[la dod mi]

  %25
  la8\tr sol16 fad mi8 [re dod mi16 re] dod8\p si la4 r16 la' si dod\mbreak
  re8\upl [la\upl] fad32(sol la8.) re,8\upl[fad\upl] si,2 r4
  r si' si do4. re8 do[si]

  %28
  la sold la4 la si si8 do? si la
  sol2 fad4 mi mi' re\mbreak
  do la si8 do re4 r red

  %31
  mi r mi, fad re fad
  sol r sol fad8[mi red do red si]
  dod4 red mi la, si r16 si'\f dod red\mbreak

  %34
  mi8[dod lad fad lad dod] mi4 r8 lad, si4
  r8 mi la,4 si mi, mi'\p re
  do la8 si do4 sold r r16 mi\p fad sold

  %37
  la8\upl mi\upl do32[(re mi8.)] la,8_\upl do_\upl fad,4 fad' re\mbreak
  sol4 la si8 do re\f\upl [la\upl] fad32[(sol la8.)] re,8\upl fad\upl
  si,4 si'\p si do2 si4

  %40
  la mi fad sol dod,2^\markup\italic\center-align"adag[io]"
  re4 r r16 re\f mi fad sol8\upl[re\upl] si32(do re8.) sol,8_\upl[si_\upl]\mbreak
  mi,4 r r do'\p mi do

  %43
  la r r re fad re
  si r r16 sol'\f la si do8[sol] mi32[(fad sol8.)] do,8 mi
  re'\p[la] fad32[(sol la8.)] re,8 fad mi'\f [si] sol32[(la si8.)] mi,8 sol\mbreak

  %46
  fad4 \breathe sol\p mi8 fad sol4 re' do
  si sol si do8 sol mi32[(fad sol8.)] do,8 mi
  la,4 r8 la[si do] re4 si re

  %49
  mi do mi fad re fad\mbreak
  sol8\p\upl[mi\upl] si32 (do re8.) sol,8_\upl[si_\upl] mi,4 r r
  mi' fad sol \breathe do,^\markup\italic"adag[io]" re2

  %52
  sol4 r r8 re'\f sol\upl[re\upl] si32(do re8.) sol,8\upl[si\upl]\mbreak
  mi,4 r r8 si' mi\upl[si\upl] sol32(la si8.) mi,8\upl[sol\upl]
  do,4 r r8  sol' do\upl[sol\upl] mi32(fad sol8.) do,8\upl[mi\upl]

  %55
  la,4^\sos r8 re sol4 r8 dod, re4 re
  sol8 fad16 mi re8[do si la] sol2

}

IIbfn = \figuremode {

  \bassFigureExtendersOn
  \bassFigureStaffAlignmentDown

  s1.
  <5 3>4 <5 3> s4 <5 3> <5 3> s4
  s1.
  s1 s4 s8 <_+>
  s1.*3
  s2 <5>8 <6> s2.
  s1.
  s2. <5>4 <6> s
  <6 4\+ 2>4 s8 <6> s4 s2.
  s s4 s <5>8 <6>
  s1.*3
  s2 <_+>4 s2.
  s <_+>4 s s
  s1.
  s2. <6>4 s2
  s1 <6>8 s <6>4
  <_+>1.
  s2 <_+>4  s2.
  s4 <6> <_+> s2.
  <5 _+>4 <5 _+> s4 <5 _+> <5 _+> s4
  <_+>1.
  s2. <5>
  s4 <6>  s <5>2 <5>4
  <6>2. <_+>
  <6>2 <6\\>4 s <6>8 s <6>4
  <6> s1 <6>4
  <5>4 s <6> <5> s <6>
  s s <6> <6\\> <6> s
  s2. <7>4 <_+> s
  <5>4 <6>2 <_+>4 s8 <6> s4
  s2 <_+>4 s <_+> <_+>
  <6>2 s4 <6>2.
  <5>8 <5> s2 s2.
  s2 <7>8 <5> s2.
  <5+>4 <6>8 s <6> s <6>4 s <6>
  <5> <6> s s <7>2
  s1.*3
  s2. <5 3>4 <6> <6>
  <5 _ 3> <_> <_>8 s <5 _ 3>4 <_> <_>8 s
  <6>4 s <6>8 <6> s4 <5 3> <5 3>
  <6> s s <5 3> <5 3> <5 3>8 s
  <5>4 s <6>8 <6> s2.
  s <6>
  s <5>
  <6>4 <6> <5> <7>  <5 3>2
  s2. <5 3>2 <5 3>8 s
  s2 s8 <_+> <5 3>2 <5 3>8 s
  <5>2 s4 <5 3>2 <5 3>8 s
  <5>4 s8 <7> s4 s8 <6> <4>4 <3>

}

forma = {

  \override Staff.TimeSignature #'style = #'single-digit
  \time 3/2
  \key sol\major
  \tempo 2 = 60
  s1.*56
  \bar"|."

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


IIalto = {
  \new Voice = "succurre"
  \IIglobal
  \clef alto
  <<\IIalton \forma>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}

IIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \con
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
}

IIIvlIn = \relative do'' {

  r8 re, re dod r fad re fad
  r mi dod mi r la re, la'
  r fad red fad r sol mi si'

  %4
  r fad red fad r si mi, si'\mbreak
  r dod la dod si2~
  si4 la8 dod re2~

  %7
  re4 dod si4. si8
  la4 r8 si la[mi'] r do\mbreak
  do la r la re,[sib']  r la

  %10
  sol re' r sol, re' re, r sib'
  sib? sol r sol dod, la' r sol
  fa? do'? r la re, re' r sib16 la\mbreak

  %13
  sol8(fad) mi mi mi4\fermata r
  re8 re re re dod!4. dod8
  re fad la fad r re re' re,

  %16
  r si'! re si r dod mi la,\mbreak
  r la re, la' r re re, re'
  \appoggiatura re dod2 r

  %19
  r2 r8 re, re dod
  r8 fa [la16(sol) la8] r8 sib^\markup\italic"adagio" la sol\mbreak
  la2 r

}

IIIvlIIn = \relative do'' {

  fad,4 r8 mi re la' r re,
  mi dod r dod re la r fad'
  si, red r si' sol mi r sol

  %4
  fad red r red si mi r sold\mbreak
  mi la r mi [si' mi,] \parenthesize r \parenthesize mi
  r mi mi' mi, r fad si fad

  %7
  r si sol [mi'] r  mi si mi
  r dod si sold r mi la mi\mbreak
  r re la' la, r sol' fad! [re']

  %10
  r sol, sol, re' r re sol re
  r do'? do,? do' r fa,? mi do'?
  r la fa? dod' r re, re' re,\mbreak

  %13
  dod! re la si dod4_\fermata r
  la8 la si! si la4. la8
  la4 r8 la' sol re' r re,

  %16
  mi si r mi [mi' mi,] r mi'\mbreak
  re la r re [re, re'] r re,
  mi2 r

  %19
  r fa4 r8 mi
  fa? re r fad sol sol fad mi\mbreak
  fad2 r

}


IIIalton = \relative do' {

  \autoBeamOff
  r4 la'2 la4
  la8 mi la sol sol4 fad
  r si2 si4

  %4
  si8 fad si la la4 sold\mbreak
  r la2 sold4
  dod2. si8 [la]

  %7
  sold4 la2 sold8. [la16]
  la4 r do4. la8\mbreak
  fad8.[(mi16)] fad4 sol8.[(la16)] la8.\tr[sol32 la]

  %10
  sib8.[(la16)] sib4 r8 sib4 sol8
  mi8.[(re16)] mi4 fa8.[(sol16)] sol8.\tr[fa32 sol]
  la8.[(sol16)] la4 r8 sol4 sol8\mbreak

  %13
  sol2 sol4\fermata r
  fa4.^\markup\italic"adagio" mi8 mi2
  re4 r sib'4. la8

  %16
  \appoggiatura la sold4 sold la4. sol?8\mbreak
  fa4(fad sol sold)
  la4.^\markup\italic"adagio"_\markup\italic"ad libitum"  mi8 fad!4(fa)~

  %19
  fa mi8 [re] re4 r
  R1*2

}

IIItesto = \lyricmode {

  Pecca - torum _ miserere _ _ _ pecca - torum _ miserere _ _ _

  mise - re - - - - re pecca -

  torum _ miserere _ _ _ pecca - toru, _ mise - re -- re mise -

  re -- re mise - re -- re pecca - torum _ mise -

  re - - - - re.

}


IIIbcn = \relative do {

  re'8 re, r la' re re, r re
  dod la r la re re, r re'
  red si r red mi mi, r mi'

  %4
  red si r si mi mi, r mi'\mbreak
  la la, r la mi' mi, r mi'
  la la, r la' si si, r si'

  %7
  mi, \parenthesize mi, r la' mi' mi, r mi
  la la, r mi' la la, r la'\mbreak
  re re, r re' sib sol r re

  %10
  sol sol, r sol' sol, sol' r sol
  do do, r do' la fa r do
  fa fa,r fa' sib sib, r sol'\mbreak

  %13
  mi re dod! si la4^\fermata r
  re sold, la2
  re8 re, r re' sol sol,! r fa'

  %16
  mi mi, r mi' dod! la r dod'\mbreak
  re re, r dod' si si, r sib'
  la2 r

  %19
  r re8 re, r la'
  re re, r re' re re, re re\mbreak
  re2 r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOn
  \bassFigureStaffAlignmentDown

  s1*2
  <6>1
  s2 <5 4>4 s8 <_+>
  s2 <5 4>4 s8 <_+>
  <9>4 s8 <8> <9>4 s8 <8>
  <7 _+>2 <4>4 s8 <_+>
  s4 s8 <_+> <_->4 s8 <_->
  s2 s4 s8 <_+>
  <_->4 s8 <_-> <_->4 <_->8 <_->
  <7->4 s8 <5> <6>4 s
  s2 <6>
  <6\\>8 <5> s4 <7 _+> s
  <_-> <7-> <_+>2
  s2 <_->4 s
  <_+>2 <6>4 s8 <6>
  <_->4 s8 <4\+> <6>4 s8 <6\\>
  <_+>1
  s2 s4 s8 <_+>
  s4 s8 <5 _+> <6 4> <6 4> <5 _+> <4 2>
  <5 _+>

}

forma = {

  %\override Staff.TimeSignature #'style = #'single-digit
  \time 4/4
  \key re\major
  \tempo 4 = 40
  s1*21
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


IIIalto = {
  \new Voice = "peccatorum"
  \IIIglobal
  \clef alto
  <<\IIIalton \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 16)

\version "2.18.0"

\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #3

  }


  \markup \huge {[1.] Larghetto con sordini}

  \score {
    {
      <<

        \new ChoirStaff <<

          \new Staff
          <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup  \center-column {"Flauto""Travers[iere] 1"}
            \IflI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup  \center-column {"Flauto""Travers[iere] 2"}
            \IflII
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"Violino 1"}
            \IvlI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"Violino 2"}
            \IvlII
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"voice oohs"
            \Ialto
            \new Lyrics \lyricsto "alma" \Itesto
          >>

          \new Staff
          \with {
            fontSize = #+2
            \override StaffSymbol.staff-space = #(magstep +2)
          }
          <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"Basso""Continuo"}
            \Ibc

          >>
        >>

      >>
    }

    \layout {

      indent = 1.8\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8.0
        \override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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


  \markup \huge {[2.] Forte senza sordini e senza Flauti}

  \score {
    {
      <<

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
            \set Staff.midiInstrument = #"voice oohs"
            \IIalto
            \new Lyrics \lyricsto "succurre" \IItesto
          >>

          \new Staff
          \with {
            fontSize = #+2
            \override StaffSymbol.staff-space = #(magstep +2)
          }
          <<
            \set Staff.midiInstrument = #"cello"
            \IIbc
          >>
        >>

      >>
    }

    \layout {

      indent = 0.5\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8.0
        \override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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


  \markup \huge {[3.] Adagio}

  \score {
    {
      <<

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
            \set Staff.midiInstrument = #"voice oohs"
            \IIIalto
            \new Lyrics \lyricsto "peccatorum" \IIItesto
          >>

          \new Staff
          \with {
            fontSize = #+2
            \override StaffSymbol.staff-space = #(magstep +2)
          }
          <<
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
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8.0
        \override SpacingSpanner.uniform-stretching = ##t
        \override BarLine.hair-thickness = #1.2
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0
%}
