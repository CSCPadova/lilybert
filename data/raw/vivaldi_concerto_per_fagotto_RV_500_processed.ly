\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

s1^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to" }s1*9\bar "|"

\cadenzaOff

}

MyCadenzabis = \relative do'' {

\cadenzaOn

s2.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza III]"}\bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

saltabis = #(skip-of-length MyCadenzabis)

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

Iglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IvlIn =  \relative do'' {

   mi8[do16 si la8 la] mi '[do16 si la8 la]
   si[sold16 fad mi8 mi] si'[sold16 fad mi8 mi]
   mi'[do16 si la8 la] la'[do,16 si la8 la]

   %4
   si mi, do'4\tr si2
   si8 mi,do'4\tr si r8 la'\mbreak
   sold2 sol

   %7
   fad fa
   mi4 r8 la,\p sold2
   sol! fad

   %10
   fa! mi4 r8 mi'16 do\mbreak
   la8 do16 la mi8 la16 mi fa4 r8 fa'16 re
   si8 re16 si fad8 si16 fad sold4 r8 re'\p

   %13
   do(la) si(mi) do(la) si(mi)
   do16\f la' sold la si,8 sold' la4 r
   R1*3

   %18
   r8 si16 sold mi8 sold16 mi do8 la'16 mi do8 mi16 do
   fa4 r r2
   r8 la16 fa re8 fa16 re si8 re16 si fa8 si16 fa

   %21
   re'4 r r2
   r8 sol16 mi do8 mi16 do la8 do16 la mi8 la16 mi
   do'4 r r2

   %24
   r8 fa16 re si8 re16 si\mbreak fa'2
   mi re
   do si8 fa'16 re si8 re16 si

   %27
   sol4 r r2
   r8 mib'16[fa sol8 mib] r re16[mib fa8 re]
   r mib16[fa sol8 mib]\mbreak r re16[mib fa8 re]

   %30
   \parenthesize do4 r r2
   R1
   r2 sol'8[mi16 re do8 do]

   %33
   sol'[mi16 re do8 do] re[si16 la sol8 sol]
   fa'8[re16 do si8 si]\mbreak mi8 do r do'
   si2 sib

   %36
   la lab
   sol4 r8 do, si2
   sib la

   %39
   lab sol4 r8 fa'\p
   mi!(do) re(sol) mi(do) re(sol)
   mi16\f do' si do re,8 si' do4 r

   %42
   R1*2
   do,1~
   do2 sib~

   %46
   sib1
   do~
   do2\mbreak la4 r

   %49
   R1*6
   la'8[fa16 mi re8 re] la'[fa16 mi re8 re]
   re' la fa re dod'2

   %57
   do! si
   sib la4 r8 re,
   dod2 do

   %60
   si sib
   la16 re fa re la re fa re la8 fa' sol mi
   re4 r r2

   %63
   R1*3
   r2 r4 r8 la'
   sold2 sol

   %68
   fad\mbreak fa
   mi16 do mi do la' do, mi do sib2
   dod re

   %71
   red mi
   mi16 do mi do la do mi do\mbreak r2
   R1*3

   %76
   mi8[do16 si la8 la] mi '[do16 si la8 la]
   si[sold16 fad mi8 mi] si'[sold16 fad mi8 mi]
   mi'[do16 si la8 la] la'[do,16 si la8 la]

   %79
   si mi, do'4\tr si2
   si8 mi,do'4\tr si r8 la'\mbreak
   sold2 sol

   %82
   fad fa
   mi4 r8 la,\p sold2
   sol! fad

   %85
   fa! mi4 r8 mi'16 do\mbreak
   la8 do16 la mi8 la16 mi fa4 r8 fa'16 re
   si8 re16 si fad8 si16 fad sold4 r8 re'\p

   %88
   do(la) si(mi) do(la) si(mi)
   do16\f la' sold la si,8 sold' la4\fermata r

}

IvlIIn = \relative do'' {

    la16 [si do re mi8 mi] la,16[si do re mi8 mi]
    mi,16[fad sold la si8 si] mi,16[fad sold la si8 si]
    la16 si do re mi8 mi la,16 si do re mi8 mi

    %4
    sold, sold la4\tr  sold2
    sold8 sold la4\tr sold!4 r8 mi'\mbreak
    re2 dod

    %7
    do! si
    do4 r8 mi,\p re2
    dod do

    %10
    si do4 r8 do'16 la\mbreak
    mi8 la16 mi do8 mi16 do la4 r8 re'16 la
    fad8 si16 fad re8 fad16 re  si4 r8 si'\p

    %13
    la(mi) sold(si) la(mi) sold(si)
    la16\f la' sold la si,8 sold' la4 r %%%% fine ripresa
    R1*3

    %18
    r8 sold16 mi si8 mi16 si la8 mi'16 do la8 do16 la
    la'4 r r2\mbreak
    r8 fa16 re si8 re16 si fa8 si16 fa re8 fa16 re

    %21
    si'4 r r2
    r8 mi16 do la8 do16 la mi8 la16 mi do8 mi16 do
    la'4 r r2

    %24
    r8 re16 si sol8 si16 sol\mbreak re'2
    do fa
    mi re8 re16 si sol8 si16 sol

    %27
    re4 r r2
    r8 do'16 [re mib8 do] r si16[do re8 si]
    r8 do16 [re mib8 do] \mbreak r si16[do re8 si]

    %30
    \parenthesize do4 r r2
    R1
    r2 do16 re mi fa sol8 sol

    %33
    do,16 re mi fa sol8 sol sol,16 la si do re8 re
    sol,16 la si do re8 re\mbreak do8 sol r8 sol'
    fa2 mi!

    %36
    mib re
    mib4 r8 sol, fa2
    mi! mib\mbreak

    %39
    re mib4 r8 re'\p
    do(sol) si!(re) do(sol) si(re)
    do mi si re mi4 r

    %42
    R1*2
    la,1~
    la2 sol~

    %46
    sol1~
    sol~
    sol2 fad4 r

    %49
    R1*6
    re'16[mi fa sol la8 la] re,16[mi fa sol la8 la]
    la8 fa re la sol'2

    %57
    fad fa
    mi fa4 r8 la,
    sol2 fad

    %60
    fa! mi
    fa16 la re la fa la re la fa8 re' mi dod
    re4 r r2

    %63
    R1*3
    r2 r4 r8 do
    re2 dod

    %68
    do!\mbreak si
    do16 la do la mi' la, do la fa2
    sol la~

    %71
    la si
    do16 la do la mi' la, do la\mbreak r2
    R1*3

    %76
    la16 [si do re mi8 mi] la,16[si do re mi8 mi]
    mi,16[fad sold la si8 si] mi,16[fad sold la si8 si]
    la16 si do re mi8 mi la,16 si do re mi8 mi

    %79
    sold, sold la4\tr  sold2
    sold8 sold la4\tr sold!4 r8 mi'\mbreak
    re2 dod

    %82
    do! si
    do4 r8 mi,\p re2
    dod do

    %85
    si do4 r8 do'16 la\mbreak
    mi8 la16 mi do8 mi16 do la4 r8 re'16 la
    fad8 si16 fad re8 fad16 re  si4 r8 si'\p

    %88
    la(mi) sold(si) la(mi) sold(si)
    la16\f la' sold la si,8 sold' la4\fermata r

}

Ivlan =  \relative do' {

    r8 mi mi do r mi mi do
    r si si sold r si si sold
    r mi' mi do r mi mi do

    %4
    mi mi la la mi fad sold fad
    mi mi la la mi4 r8 do'\mbreak
    si4. sold8 mi4. dod'8

    %7
    la4. fad8 re4. si'8
    mi,4 r8 do\p si4. sold8
    mi4. dod'8 la4. fad8

    %10
    re4. si'8 mi,4 r8 mi'\mbreak
    do do la la fa4 r8 re'
    re re si si sold4 r8 sold'\p

    %13
    mi1
    mi8\f mi mi mi do4 r %% fine ripresa
    R1*3

    %18
    r8 si' sold sold mi4 mi
    do r r2
    r8 re' sol, sol re4 re

    %21
    sol, r r2
    r8 do' fa, fa do4 do
    fa, r r2

    %24
    r8 si' re, re\mbreak si2
    sol si
    sol sol8 si si si

    %27
    si4 r r2
    do4 r8 do sol'4 r8 sol,
    do4 r8 do\mbreak sol'4 r8 sol,

    %30
    do4 r r2
    R1
    r2 r8 sol' sol mi

    %33
    r sol sol mi r re re si
    r re re si\mbreak sol' mi r mib
    re4. si8 sol4. mi'!8

    %36
    do4. la8 fa4. re'8
    sol,4 r8 mib' re4. si8
    sol4. mi'?8 do4. la8\mbreak

    %39
    fa4. re'8 sol,4 r8 si\p
    sol1~
    sol8 sol' sol sol sol4 r

    %42
    R1*2
    fad1~
    fad2 re~

    %46
    re1
    mib~
    mib2\mbreak re4 r

    %49
    R1*6
    r8 la' la fa r la la fa
    fa re la' fa mi4. dod8

    %57
    la4. fad'8 re4. si!8
    sol4. mi'8 la,4 r8 fa'\mbreak
    mi4. dod8 la4. fad'8

    %60
    re4. si!8 sol4. mi'8
    la,4 la  la8 la' sib? la
    fa4 r r2

    %63
    R1*4
    si4. sold8 mi4. dod8
    la'4. fad8\mbreak re4. si8

    %69
    mi4. do8 la2
    sol fa
    si sold'

    %72
    mi4 mi\mbreak r2
    R1*3
    r8 mi mi do r mi mi do

    %77
    r si si sold r si si sold
    r mi' mi do r mi mi do
    mi mi la la mi fad sold fad

    %80
    mi mi la la mi4 r8 do'\mbreak
    si4. sold8 mi4. dod'8
    la4. fad8 re4. si'8

    %83
    mi,4 r8 do\p si4. sold8
    mi4. dod'8 la4. fad8
    re4. si'8 mi,4 r8 mi'\mbreak

    %86
    do do la la fa4 r8 re'
    re re si si sold4 r8 sold'\p
    mi1

    %89
    mi8\f mi mi mi do4\fermata r

}

Ifgn = \relative do {

    r8 la16[si do8 la] r la16[si do8 la]
    r mi'16[fad sold8 mi] r mi16[fad sold8 mi]
    r8 la,16[si do8 la] r la16[si do8 la]

    %4
    mi[mi'16 red mi8 mi] mi,[mi'16 red mi8 mi]
    mi,[mi'16 red mi8 mi] mi,4 r8 la'\mbreak
    mi16 fad sold fad mi fad sold mi la, si dod si la si dod la

    %7
    re  mi fad mi re mi fad re sold, la si la sold la si sold
    la[si do re mi fad sold la] mi\p fad sold fad mi fad sold mi
    la, si dod si la si dod la re  mi fad mi re mi fad re

    %10
    sold, la si la sold la si sold la[si do re mi fad sold la]
    do,8 do do do re re re re
    re re re re mi4 r8 mi\p

    %13
    la,4 mi' la, mi'
    la,8\f la mi' mi la,4 r8 mi'
    la16 do si la si re do si\mbreak la sold fad mi fad sold la si

    %16
    do si la sold la si do re mi8[re16 do si8 la]
    sold16 si la si mi, si' la si si, si' la si sold, si' la si
    mi,,4 r mi''2~mi16 do mi do la la do la fa fa la fa re re fa re\mbreak

    %19
    si4 r re'2~
    re16 si re si sol sol si sol mi mi sol mi do do mi do
    la4 r do'2~

    %22
    do16 la do la fa fa la fa re re fa re si si re si
    sol4 r\mbreak sol16 si' re si sol, si' re si
    sol, do' mi do sol, do' mi do sol, si' re si sol, si' re si

    %25
    sol, do' mi do sol, do' mi do sol,4 r
    fa''8[\appoggiatura mi re \appoggiatura do si \appoggiatura la sol] \appoggiatura fa mi4 do'
    mib16 re do4. re16 do si4.

    %28
    mib16 re do4.\mbreak re16 do si4.
    do16 sol fa sol la fa mi fa sol mi re mi fa re do re
    mi do si do re si la si do[re mi fa sol la si do]

    %31
    sol, sol' fa sol sol, sol' fa sol do,8[do16 re mi8 do]
    r do16[re mi8 do] r sol16[la si8 sol]
    r sol16[la si8 sol]\mbreak do do, r do'

    %35
    sol'16 la si la sol la si sol do, re mi re do re mi do
    fa sol la sol fa sol la fa si, do re do si do re si
    do [re mib fa sol la si do] sol la si la sol la si sol

    %38
    do, re mi! re do re mi do fa sol la sol fa sol la fa\mbreak
    si, do re do si do re si do4 r8 sol\p
    do4 sol do sol

    %41
    do8 do' sol[sol,] do[do do16 re mi fa]
    sol8[sol sol16 la si sol] do8[do do16 re mi fa]
    sol,8[sol sol16 fa mi re] mi8 do r16 do' sib do

    %44
    la do sib do fad, do' sib do\mbreak re, do' sib do fad, do' sib do
    re, do' sib do fad, do' sib la sib sol fad sol sib, sol' fad sol
    sol, sol' fad sol sib, sol' fad sol sol, sol' fad sol sib, sol' fad sol

    %47
    mib do' si? do mib, do' si do do, do' si do mib, do' si do
    do,[re mib fa sol la si do]\mbreak fad,8 re r re'
    re(sib) sib(sol) sol(mi) mi(dod)

    %50
    dod? sol'4 la sib la8~
    la sol4 fa16 mi fa8 sol4 la8~
    la sib4 dod re do?16 sib

    %53
    la sib la fa sol la sol mi fa sol fa re mi fa mi dod\mbreak
    re[re' do? sib la sol fa mi] fa8 mi16 re la'8 la,
    re,[re'16 mi fa8 re] r re16[mi fa8 re]

    %56
    re4 re la'16 si! dod si la si dod la
    re, mi fad mi re mi fad re sol la si! la sol la si sol
    dod, re mi re dod re mi dod re[mi fa sol la si! dod re]

    %59
    la16 si! dod si la si dod la re, mi fad mi re mi fad re
    sol la si la sol la si sol dod, re mi re dod re mi dod
    re4 re re8 re sol, la

    %62
    re16 mi fa re la' si dod la re la fa re re' la fa re
    la' mi dod la la' mi dod la\mbreak re' la fa re re' la fa re
    la'8 la, r la' fa'2~

    %65
    fa16 mi re do si8 la sold fa!4 mi8~
    mi re4 do16 si do8 la r la
    mi16 mi' sold mi mi, mi' sold mi la, la' dod la la,  la' dod la

    %68
    re,, re' fad re re, re' fad re\mbreak sold,sold' si sold sold, sold' si sold
    la8 la, r la re,16 re' fa re re, re' fa re
    mi, mi' sol mi mi, mi' sol mi fa, fa' la fa fa, fa' la fa

    %71
    fad, fad' la fad fad, fad' la fad sold, sold' si sold sold, sold' si sold
    la8 la, r la'\mbreak \appoggiatura mi'8 re16(do re8) \appoggiatura mi8 re16(do re8)
    \appoggiatura mi8 re16(do re8) re16(do re8) re2

    %74
    si16 do re si sold la si sold re mi fa re sold, la si sold
    la[si do re mi fa sol la] fa8[mi16 re mi8 mi,]
    la [la16 si do8 la] r la16[si do8 la]

    %77
    r mi'16[fad sold8 mi] r mi16[fad sold8 mi]
    r8 la,16[si do8 la] r la16[si do8 la]
    mi[mi'16 red mi8 mi] mi,[mi'16 red mi8 mi]

    %80
    mi,[mi'16 red mi8 mi] mi,4 r8 la'\mbreak
    mi16 fad sold fad mi fad sold mi la, si dod si la si dod la
    re  mi fad mi re mi fad re sold, la si la sold la si sold

    %83
    la[si do re mi fad sold la] mi\p fad sold fad mi fad sold mi
    la, si dod si la si dod la re  mi fad mi re mi fad re
    sold, la si la sold la si sold la[si do re mi fad sold la]

    %86
    do,8 do do do re re re re
    re re re re mi4 r8 mi\p
    la,4 mi' la, mi'

    %89
    la,8\f la mi' mi la,4\fermata r

}

Ibcn = \relative do {

    r8 la16[si do8 la] r la16[si do8 la]
    r mi'16[fad sold8 mi] r mi16[fad sold8 mi]
    r8 la,16[si do8 la] r la16[si do8 la]

    %4
    mi[mi'16 red mi8 mi] mi,[mi'16 red mi8 mi]
    mi,[mi'16 red mi8 mi] mi,4 r8 la'\mbreak
    mi16 fad sold fad mi fad sold mi la, si dod si la si dod la

    %7
    re  mi fad mi re mi fad re sold, la si la sold la si sold
    la[si do re mi fad sold la] mi\p fad sold fad mi fad sold mi
    la, si dod si la si dod la re  mi fad mi re mi fad re

    %10
    sold, la si la sold la si sold la[si do re mi fad sold la]
    do,8 do do do re re re re
    re re re re mi4 r8 mi\p

    %13
    la,4 mi' la, mi'
    la,8\f la mi' mi la,4 r8 la  %%%% fine ripresa OK
    la4 sold\mbreak la r

    %16
    la r la8 si do re
    mi r mi, r mi r mi r
    mi'8 fad sold mi la,4 la

    %19
    fa' r r2
    si,8 do re si si4 si
    mi r r2

    %22
    la,8 si do la  la4 la
    re r r2
    sol,8 la si sol\mbreak sol4 sol

    %25
    sol sol sol sol
    sol sol sol8 sol' sol, sol'
    sol,2 do8 re mi do

    %28
    R1*2
    do8 r fa r mi r re r
    do r sol r do4 r

    %32
    sol sol do8[do16 re mi8 do]
    r do16[re mi8 do] r sol16[la si8 sol]
    r sol16[la si8 sol]\mbreak do do, r do'

    %35
    sol'16 la si la sol la si sol do, re mi re do re mi do
    fa sol la sol fa sol la fa si, do re do si do re si
    do [re mib fa sol la si do] sol la si la sol la si sol

    %38
    do, re mi! re do re mi do fa sol la sol fa sol la fa\mbreak
    si, do re do si do re si do4 r8 sol\p
    do4 sol do sol

    %41
    do8 do' sol[sol,] do do do do
    do4 r la8 la la la
    sol4 r8 sol do do, r4

    %44
    re' re\mbreak re re
    re re sol, sol
    sol sol sol sol

    %47
    do do do do
    do do\mbreak re16 do re mi fad mi fad re
    sol4 sol, sol sol

    %50
    la dod dod dod
    dod? dod re re
    re re mi fa

    %53
    fa mi re dod
    re4 r re8 re, la''[la,]
    re,[re'16 mi fa8 re] r re16[mi fa8 re]

    %56
    re4 re la'16 si! dod si la si dod la
    re, mi fad mi re mi fad re sol la si! la sol la si sol
    dod, re mi re dod re mi dod re[mi fa sol la si! dod re]

    %59
    la16 si! dod si la si dod la re, mi fad mi re mi fad re
    sol la si la sol la si sol dod, re mi re dod re mi dod
    re4 re re8 re sol, la

    %62
    re4 r re re
    la r\mbreak  re re
    la8 si! dod la re mi fa mi

    %65
    re4 re mi8 r re r
    do r sold r la si do la
    mi4 mi la la

    %68
    re, re\mbreak sold sold
    la8 si do la re,4 re
    mi mi fa fa

    %71
    fad fad sold sold
    la8 si do la\mbreak si' si la la
    sold sold fad fad mi si sold mi

    %74
    mi1
    la4 r8 la' fa re mi [mi,]
    la [la16 si do8 la] r la16[si do8 la]

    %77
    r mi'16[fad sold8 mi] r mi16[fad sold8 mi]
    r8 la,16[si do8 la] r la16[si do8 la]
    mi[mi'16 red mi8 mi] mi,[mi'16 red mi8 mi]

    %80
    mi,[mi'16 red mi8 mi] mi,4 r8 la'\mbreak
    mi16 fad sold fad mi fad sold mi la, si dod si la si dod la
    re  mi fad mi re mi fad re sold, la si la sold la si sold

    %83
    la[si do re mi fad sold la] mi\p fad sold fad mi fad sold mi
    la, si dod si la si dod la re  mi fad mi re mi fad re
    sold, la si la sold la si sold la[si do re mi fad sold la]

    %86
    do,8 do do do re re re re
    re re re re mi4 r8 mi\p
    la,4 mi' la, mi'

    %89
    la,8\f la mi' mi la,4\fermata r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key la\minor
  \time 4/4
  \tempo 2 = 57
  s1*89
  \bar"|."

}

IvlI = {
  \Iglobal
  \notypeset
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

Ifg = {
  \Iglobal
  \clef bass
  <<\Ifgn \forma>>

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

IIvlIn =  \relative do'' {

    do8 do do do sol sol sol sol
    sol sol sol sol do do do do
    re re re re re re re re

    %4
    la' la sol sol\mbreak fad re re re
    sol mi re re, sol2
    mi'8 mi mi mi sold, sold sold sold

    %7
    sold? sold sold sold la la la la\mbreak
    re re re re fad, fad fad fad
    fad? fad fad fad sol sol sol sol

    %10
    mi' do mi do fa fa, fa fa
    fad' re fad re sol sol, sol sol
    do do do do do4 r

    %13
    do,8 do' sol' sol, do2\fermata

}

IIvlIIn = \relative do'' {

    do8 do do do sol sol sol sol
    sol sol sol sol do do do do
    re re re re re re re re

    %4
    la' la sol sol\mbreak fad re re re
    sol mi re re, sol2
    mi'8 mi mi mi sold, sold sold sold

    %7
    sold? sold sold sold la la la la\mbreak
    re re re re fad, fad fad fad
    fad? fad fad fad sol sol sol sol

    %10
    mi' do mi do fa fa, fa fa
    fad' re fad re sol sol, sol sol
    do do do do do4 r

    %13
    do,8 do' sol' sol, do2\fermata

}

IIvlan =  \relative do' {

    do8 do do do sol sol sol sol
    sol sol sol sol do do do do
    re re re re re re re re

    %4
    la' la sol sol\mbreak fad re re re
    sol mi re re, sol2
    mi'8 mi mi mi sold, sold sold sold

    %7
    sold? sold sold sold la la la la\mbreak
    re re re re fad, fad fad fad
    fad? fad fad fad sol sol sol sol

    %10
    mi' do mi do fa fa, fa fa
    fad' re fad re sol sol, sol sol
    do do do do do4 r

    %13
    do,8 do' sol' sol, do2\fermata

}

IIfgn = \relative do {\senza \tupletSpan 16

    do4 do' si~si8\noBeam~\tuplet 3/2 { si32 re do si[la sol] }
    fa4 fa' mi~mi8\noBeam~\tuplet 3/2 { mi32 sol, fa mi[re do] }
    fad4~fad8\noBeam ~\tuplet 3/2 { fad32 la sol fad[mi re] }do'16(la) la(fad) fad(re) re(dod')

    %4
    dod?2\mbreak re8\noBeam~\tuplet 3/2 { re32 la sol fad[mi re] } re'8\noBeam~\tuplet 3/2 { re32 la sol fad[mi re] }
    si'16. fa32 sol16. dod,32 re8 re, sol2
    sold'4 re' mi,~mi16. fad32 sold la si do

    %7
    re4~re32 do si la sold fad mi re do8\noBeam ~do64 la si do re mi fad sold la8 r\mbreak
    fad4 do' re,~re16. mi32 fad sol la si
    do4~do32 si la sol fad mi re do si8\noBeam ~si64 sol la si do re mi fad sol8 r

    %10
    do16. mi,32 fa16. mi32 sib'16. mi,32 fa16. mi32 la8 fa fa,4
    re''16. fad,32 sol16. fad32 do'16. fad,32 sol16. fad32 si!8 sol sol, re''
    mib2~mib32 re do sib lab sol fa mib re do sib lab sol fa mib re

    %13
    \once\stemUp  do8 do''16. re32 \grace \parenthesize mi?8 re4\tr do2\fermata

}

IIbcn = \relative do {

    do8 do do do sol sol sol sol
    sol sol sol sol do do do do
    re re re re re re re re

    %4
    la' la sol sol\mbreak fad re re re
    sol mi re re, sol2
    mi'8 mi mi mi sold, sold sold sold

    %7
    sold? sold sold sold la la la la\mbreak
    re re re re fad, fad fad fad
    fad? fad fad fad sol sol sol sol

    %10
    mi' do mi do fa fa, fa fa
    fad' re fad re sol sol, sol sol
    do do do do do4 r

    %13
    do,8 do' sol' sol, do2\fermata

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key la\minor
  \time 4/4
  \tempo 4 = 34
  s1*5
  \bar":..:"
  s1*8
  \bar ":|."

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

IIfg = {
  \IIglobal
  \clef bass
  <<\IIfgn \forma>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}

IIIglobal = {
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
}

IIIvlIn =  \relative do'' {

    R1*2
    sol'4 fa mi4. la8
    fad re mi fad sol sol la si

    %5
    do4 r8 mi, fa fa fad fad
    sol4. fa!8\mbreak mi16 fa mi re do  mi re do
    si8 sol sol'4~sol8 fa16 mi mi'4

    %8
    la,8[sol16 fad sol8 la] re,16[mi re do si do si la]
    sol8 sol' sol la fa? fa fa sol
    mi4 r r2

    %11
    do'4 fa,\mbreak si mi,
    la re, sol do,
    fa si, do16 sol' fa mi re8 fa

    %14
    mi16 sol fa mi re8 fa mi4 r
    R1*2
    r2 r4 r8 fad

    %18
    fad?2 sol4 r8 si,
    si2 do4 r
    sol'8 r sol r fa r fa r\mbreak

    %21
    la r la r sol r sol r
    si r si r la r la r
    do r do r si4 r

    %24
    sol,1
    la~
    la

    %27
    re\mbreak
    re4 r sol fa!
    mi4. la8 fad re mi fad

    %30
    sol4 do, fad si,
    mi la, re sol,
    do fad, sol16 re' do si la8 do

    %33
    si16 re do si la8 do si4 r
    re8 sol4 re8 re sol4 re8
    re la'4 re,8 re la'4 re,8

    %36
    re si'4 re,8 re si'4 re,8
    do la'4 do,8\mbreak do la'4 do,8
    re la'4 re,8 re la'4 re,8

    %39
    re si'4 re,8 re si'4 re,8
    re la'4 re,8 re la'4 re,8
    re la'4 re,8 re sol4 re8

    %42
    si sol'4 si,8\mbreak do la'4 do,8
    do la'4 fad8 red fad4 red8
    mi sol4 mi8 mi la4 mi8

    %45
    fad si4 fad8 sol4 r
    R1\mbreak
    la4 sol fad2

    %48
    sol4 fa! mi4. la8
    fad re mi fad sol sol la si
    do4 r8 mi, fa fa fad fad

    %51
    sol4. fa!8 mi16 fa mi re do mi re do\mbreak
    si16 sol' sol sol fa! fa fa fa mi8 do r4
    R1*2

    %55
    do1~
    do
    re~

    %58
    re
    mi~
    mi\mbreak

    %61
    fa~
    fa2 fa8 re si sol
    R1*10

    %73
    sol'4 fa mi4. la8
    fad re mi fad sol sol la si
    do4 r8 mi, fa fa fad fad

    %76
    sol4. fa!8\mbreak mi16 fa mi re do  mi re do
    si8 sol sol'4~sol8 fa16 mi mi'4
    la,8[sol16 fad sol8 la] re,16[mi re do si do si la]

    %79
    sol8 sol' sol la fa? fa fa sol
    mi4 r r2
    do'4 fa,\mbreak si mi,

    %82
    la re, sol do,
    fa si, do16 sol' fa mi re8 fa
    mi16 sol fa mi re8 fa mi4\fermata r

}

IIIvlIIn = \relative do'' {

    do4 sib la r8 re
    si? sol la si do re  mi fad
    sol4 r8 si, do do dod dod

    %4
    re4. do!8 si16 do si la sol la sol fa
    mi8 do do'4~do8 sib?16 la la'4
    re,8[do16 si? do8 re]\mbreak sol,4 r

    %7
    re'16[si re si re si re si] mi4 r
    re16[la re la re la re la] si4 r
    r8 mi mi fa re re re mi

    %10
    do4 r r2
    r8 sol' la re,\mbreak r fa sol do,
    r mi fa si, r re mi la,

    %13
    r do re sol, mi'16 mi re do si8 re
    do16 mi re do si8 re do4 r
    R1*2

    %17
    r2 r4 r8 re
    re2 si4 r8 sol
    sol2 mi4 r

    %20
    mi'8 r mi r do r do r\mbreak
    fad r fad r re r re r
    sold r sold r mi r mi r

    %23
    fa? r fa r sol?4 r
    re,2 mi
    mi fad

    %26
    mi fad
    si la\mbreak
    si4 r r2

    %29
    R1
    r8 re mi la, r do re sol,
    r si do fad, r la si mi,

    %32
    r sol la re, re16 si' la sol fad8 la\mbreak
    sol16 si la sol fad8 la sol4 r
    si8 re4 si8 si re4 si8

    %35
    la re4 la8 la re4 la8
    sold sold'4 si,8 si sold'4 si,8
    la mi'4 la,8\mbreak la mi'4 la,8

    %38
    la fa'4 la,8 la fa'4 la,8
    si sold'4 si,8 si sold'4 si,8
    la mi'4 la,8 la mi'4 la,8

    %41
    la fa'4 la,8 la re4 la8
    sol re'4 sol,8\mbreak sol mi'4 sol,8
    la fad'4 la,8 la red4 la8

    %44
    sol mi'4 sol,8 do mi4 la,8
    red fad4 red8 mi4 r
    r2 mi4 re?\mbreak

    %47
    dod2 re4 do
    si2 la~
    la si8 si do re

    %50
    mi sol, do4~do8[sib?16 la] la'4
    re,8[do16 si? do8 re] do16 re do si la do si la\mbreak
    sol16[re' re re re re re re] do8 sol r4

    %53
    R1*2
    sol1
    la~

    %57
    la
    si~
    si

    %60
    do\mbreak
    re~
    re2 re8 si sol re

    %63
    R1*8
    do'4 sib la r8 re
    si? sol la si do re  mi fad

    %73
    sol4 r8 si, do do dod dod
    re4. do!8 si16 do si la sol la sol fa
    mi8 do do'4~do8 sib?16 la la'4

    %76
    re,8[do16 si? do8 re]\mbreak sol,4 r
    re'16[si re si re si re si] mi4 r
    re16[la re la re la re la] si4 r

    %79
    r8 mi mi fa re re re mi
    do4 r r2
    r8 sol' la re,\mbreak r fa sol do,

    %82
    r mi fa si, r re mi la,
    r do re sol, mi'16 mi re do si8 re
    do16 mi re do si8 re do4\fermata r

}

IIIvlan =  \relative do' {

    R1*6
    sol'4 fa mi4. la8
    fad re mi fad sol sol la si

    %9
    do4 r r2
    r8 sol sol la fa fa fa sol
    mi16 sol sol sol fa fa fa fa\mbreak re re re re mi mi mi mi

    %12
    do do do do re re re re si si si si do do do do
    la la la la si si si si sol8 la' re, si'
    sol la re, si' sol4 r

    %15
    R1*2
    r2 r4 r8 la
    la2 sol4 r8 re

    %19
    re2 do4 r
    do'8 r do r la r la r\mbreak
    re r re r si r si r

    %22
    mi r mi r do r do r
    la r la r re,4 r
    si2 do

    %25
    dod re
    dod re
    sol fad\mbreak

    %28
    sol4 r re r8 re
    mi mi mi mi la,4. la'8
    re,16 re re re do do do do la la la la si si si si

    %31
    sol sol sol sol la la la la fad fad fad fad sol sol sol sol
    mi mi mi mi fad fad fad fad si8 re re re\mbreak
    re re re re re4 r

    %34
    sol8 si4 sol8 sol si4 sol8
    fad fad4 fad8 fad fad4 fad8
    si, mi4 mi8 sold sold4 sold8

    %37
    mi do'4 mi,8\mbreak mi do'4 mi,8
    fa re'4 fa,8 fa re'4 la8
    sold sold4 sold8 sold sold4 sold8

    %40
    mi do'4 mi,8 mi do'4 mi,8
    fa do'4 fa,8 fa si4 fa8
    mi si'4 mi,8\mbreak mi do'4 mi,8

    %43
    fad fad4 fad8 fad si4 si,8
    si si'4 si,8 la do'4 do,8
    si red4 si8 si4 r

    %46
    r2 si'4. sold8\mbreak
    mi4. dod8 la'4. fad8
    re4. si8 do do mi mi

    %49
    fad4. fad8  re re do si
    sol' mi r mi do4 re
    re4. si8 sol4. re'8\mbreak

    %52
    re16[si' si si si si si si] sol8 mi r4
    R1*2
    mi1

    %56
    fa
    fad
    sol

    %59
    sold
    la~\mbreak
    la

    %62
    si2 si8 re, re re
    R1*14
    sol4 fa mi4. la8

    %78
    fad re mi fad sol sol la si
    do4 r r2
    r8 sol sol la fa fa fa sol

    %81
    mi16 sol sol sol fa fa fa fa\mbreak re re re re mi mi mi mi
    do do do do re re re re si si si si do do do do
    la la la la si si si si sol8 la' re, si'

    %84
    sol la re, si' sol4\fermata r

}

IIIfgn = \relative do {

    R1*4
    do4 sib la r8 re
    si? sol la si\mbreak do re mi fad

    %7
    sol4 r8 si do do dod dod
    re4. do!8 si16 do si la sol la sol fa
    mi8 do r4 r2

    %10
    r8 mi mi fa re re re mi
    do16 mi mi mi re re re re\mbreak sol sol sol sol do, do do do
    fa fa fa fa si, si si si mi mi mi mi la, la la la

    %13
    re re re re sol, sol sol sol do8 fa sol[sol,]
    do fa sol sol, do4 r8 do'16 si
    la sol do si la sol do si la8 sol r la16 sol\mbreak

    %16
    fa mi la sol fa mi la sol fa8 mi r fa16 mi
    re do fa mi re do  fa mi re8 do r do'
    do4.\tr si16 la si8 sol r re'

    %19
    fa,4.\tr mi16 re mi8 do r do'
    sol16 mi re' do sol mi re' do la fa do' sib la fa do' sib\mbreak
    la fad mi' re la fad mi' re si? sol re' do si sol re' do

    %22
    si sold fa' mi si sold fa' mi do la mi' re do la mi' re
    do la fa' mi fa mi re do si8 sol? r sol
    si,16 sol sol' re si sol sol' re do sol sol' mi do sol sol' mi

    %25
    dod la la' mi dod la la' mi re la la' fad re la la' fad
    dod la la' mi dod la la' mi fad re re' la fad re re' la
    sol re re' si sol re re' si fad re re' la fad re re' la\mbreak

    %28
    si8 la16 sol do,8 re sol,4 r8 si
    do do dod dod re4. do8
    sol16 si' si si la la la la re, re re re sol sol sol sol

    %31
    do, do do do fad fad fad fad si, si si si mi mi mi mi
    la, la la la re re re re sol,8 sol' re[re,]\mbreak
    sol sol' re[re,] sol4 r8 re'

    %34
    \senza \tuplet 3/2 { sol si, la sol[si re] sol si, la sol[si re]
    re' fad, mi re [fad la] re fad, mi re[fad la]
    re sold, fad mi[sold si] re sold, fad mi[sold si]

    %37
    do do, si la[do mi]\mbreak la do, si la[do mi]
    la fa mi re[fa la] re fa, mi re[fa la]
    re sold, fad mi[sold si] re sold, fad mi[sold si]}

    %40
    do4 r8 la mi'2~
    \tuplet 3/2 { mi8 do la fa[la fa] } si,4 re'~
    \tuplet 3/2 { re8 si sol mi[sol mi]\mbreak } la,4 do'~

    %43
    \tuplet 3/2 { do8 la fad red[fad red] } si4 r8 si'
    \tuplet 3/2 { si la si si[la si] do si do do[si do]
    red dod red red[dod red]} mi[si32 la sol fad] mi8 si'32 la sol fad

    %46
    \tuplet 3/2 { mi8 sol mi la[si si,] } mi16 fad sold mi mi fad sold mi
    la si dod la la si dod la re, mi fad re re  mi fad re
    sol la si sol sol la si sol do,8 do dod dod

    %49
    re4. do?8 si si la sol
    do4 sib la r8 re
    si? sol la si do re mi fad

    %52
    sol la si sol do, do, r sol''
    sol16 do si do mi, do' si do fa, la sol la re, fa mi fa
    si, re do re sol, sol' fa sol mi8 do r do

    %55
    do16 sol' fa sol mi sol fa sol do, sol' fa sol mi sol fa sol
    la, fa' mi fa la, fa' mi fa\mbreak la fa mi fa la, fa' mi fa
    re la' sol la fad la sol la re, la' sol la fad la sol la

    %58
    si, sol' fad sol si, sold' fad sol si sol fad sol si, sol' fad sol
    mi si' la si sold si la si mi, si' la si sold si la si
    do, la' sold la do, la' sold la do la sold la do, la' sold la\mbreak

    %61
    la re do re la re do re fa mi re do re do si la
    si sol fa sol re sol fa sol sol,4 r8 sol'
    mib'2~mib8 mib re dod

    %64
    re2~re8 re do si
    do2~do8 do si la\mbreak
    si16 la sol4. fa16 mib re4.

    %67
    mib16 re do8 r sol'  do16 sol fa sol mi sol fa sol
    do, sol' fa sol sol, sol' fa sol do,,4 r8 sol''
    do16 sol fa sol mi sol fa sol do, sol' fa sol sol, sol' fa sol

    %70
    do,,4 r8 do'' mi8 re16 do re4
    do r r2
    R1*3

    %75
    do,4 sib la r8 re
    si? sol la si\mbreak do re mi fad
    sol4 r8 si do do dod dod

    %78
    re4. do!8 si16 do si la sol la sol fa
    mi8 do r4 r2
    r8 mi mi fa re re re mi

    %81
    do16 mi mi mi re re re re\mbreak sol sol sol sol do, do do do
    fa fa fa fa si, si si si mi mi mi mi la, la la la
    re re re re sol, sol sol sol do8 fa sol[sol,]

    %84
    do fa sol sol, do4\fermata r

}

IIIbcn = \relative do {

    R1*4
    do4 sib la r8 re
    si? sol la si\mbreak do re mi fad

    %7
    sol4 r8 si do do dod dod
    re4. do!8 si16 do si la sol la sol fa
    mi8 do r4 r2

    %10
    r8 mi mi fa re re re mi
    do16 mi mi mi re re re re\mbreak sol sol sol sol do, do do do
    fa fa fa fa si, si si si mi mi mi mi la, la la la

    %13
    re re re re sol, sol sol sol do8 fa sol[sol,]
    do fa sol sol, do4 r
    do do do8 do, r4\mbreak

    %16
    do'4 do do8 do, r4
    do'8 do do do sol do, do r
    re'4 r sol8 sol, sol r

    %19
    sol4 r do8 do, do r
    do' r do r fa r fa r\mbreak
    fad r fad r sol r sol r

    %22
    sold r sold r la r la r
    la r la r sol? re si sol\mbreak
    sol r sol r do r do r

    %25
    la r la r la r la r
    la r la r re r re r
    re r re r re r re r\mbreak

    %28
    sol sol, do re sol,4 r8 si
    do do dod dod re4. do8
    sol16 si' si si la la la la re, re re re sol sol sol sol

    %31
    do, do do do fad fad fad fad si, si si si mi mi mi mi
    la, la la la re re re re sol,8 sol' re[re,]\mbreak
    sol sol' re[re,] sol4 r

    %34
    sol sol sol sol
    re' re re re
    mi mi mi mi

    %37
    la, la\mbreak la la
    fa fa fa fa
    mi mi mi mi'

    %40
    la, la la la
    fa' fa si, si
    mi mi\mbreak la, la

    %43
    red red si si
    mi mi la la
    la la sol mi

    %46
    mi r8 si mi16 fad sold mi mi fad sold mi
    la si dod la la si dod la re, mi fad re re  mi fad re
    sol la si sol sol la si sol do,8 do dod dod

    %49
    re4. do?8 si si la sol
    do4 sib la r8 re
    si? sol la si do re mi fad

    %52
    sol la si sol do, do, r do'
    do4 do re re
    si sol do8 re mi do

    %55
    do4 do do do
    la la\mbreak la la
    re re re re

    %58
    si si si si
    mi mi mi mi
    do do do do\mbreak

    %61
    fa fa fa fa
    sol sol, sol sol
    sol' sol sol sol

    %64
    fa fa fa fa
    mib mib mib mib\mbreak
    re8 sol, si sol r sol si sol

    %67
    r do mib do do4 do
    do sol do, r
    do' do do sol

    %70
    do,8 do' mi do r do sol' sol,
    do4 r r2
    R1*3

    %75
    do4 sib la r8 re
    si? sol la si\mbreak do re mi fad
    sol4 r8 si do do dod dod

    %78
    re4. do!8 si16 do si la sol la sol fa
    mi8 do r4 r2
    r8 mi mi fa re re re mi

    %81
    do16 mi mi mi re re re re\mbreak sol sol sol sol do, do do do
    fa fa fa fa si, si si si mi mi mi mi la, la la la
    re re re re sol, sol sol sol do8 fa sol[sol,]

    %84
    do fa sol sol, do4\fermata r

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}

forma = {

  \key la\minor
  \time 4/4
  \tempo 2 = 60
  s1*84
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

IIIvla = {
  \IIIglobal
  \clef alto
  <<\IIIvlan \forma>>

}

IIIfg = {
  \IIIglobal
  \clef bass
  <<\IIIfgn \forma>>

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

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] All[egr]o"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"primo]"}
                \IvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"secondo]"}
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Fagotto"}
            \Ifg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup\huge "[2.] Largo"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IIfg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIbc
        >>
    >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup\huge "[3.] All[egr]o"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
    } <<

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \IIIfg
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"cello"
            \IIIbc
        >>
    >>

    \layout {

        indent = 0.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

