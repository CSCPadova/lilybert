\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

dolce = _\markup \italic \center-align"doux"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

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
mbreak = { }


Iglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza
}


Ifln = \relative do'' {

  R1*25
  do4\solo do2 \tuplet 3/2 { mi8 re do }
  la'4(sol2) r8 si,

  %28
  re4(do8.) mi16 mi4(re8.) fa16
  mi8. la16 sol4 r si
  do2 \tuplet 3/2 {
    si8 la sol fa[mi re]

    %31
    mi re do]
  } do4\tr r2\mbreak
  do8.(re32 mi fa16 sol la si) do4 sib~
  sib2(la4) sol

  %34
  sol8 mi fa re' re si? do mi,
  \grace fa mi4\tr re r2
  sol \grace fa8 mi4 \grace re8 do4

  %37
  \appoggiatura do8 sib1(
  sib'?8) la(sol fa mi re do sib?)
  sib4\tr la r la'8 fa\mbreak  %%% fine p. 9

  %40
  mi2 re4. do8
  si!(re') re2 do8 si
  si sold la si \tuplet 3/2 { do dod re red[mi sol,?] }

  %43
  \grace sol fad2 r\mbreak
  re8.(mi32 fad sol16 la si do)] re4 do~
  do8 lad si4 r8 fad sol4

  %46
  r8 mi do' la \grace sol fad2
  \grace la8 sol2 r\mbreak
  re8.(mi32 fad sol16 la si do)] re4 do~

  %49
  do8 lad si4 r8 fad sol red
  mi mi' re? do do si si la
  sol4.\tr fad16(sol) \tuplet 3/2 { la8 sol fad mi[re do] }\mbreak

  %52
  si sol do' la la2\tr
  sol r
  R1*13

  %67
  re2\solo(re')\mbreak
  sol,(fad4) sol8(mi)
  \grace mi re4 do8 si \grace re do4 si8 la

  %70
  si do re4. re'8 si(sol)
  sol(fad) fad(mi) mi(re) re(do)\mbreak
  \tuplet 3/2 { si(la sol) } sol4 r re''8 si

  %73
  la2(sold4) si8 fa?
  fa2~fa8 red mi fa
  sold la si do re red mi si\mbreak

  %76
  \grace si4 do2 r4 r8 do
  do red, red4\tr \tuplet 3/2 { r8 red(mi) fad[(mi red)] }
  \grace fad? mi(red) \grace fad mi(red) mi sol la sib

  %79
  sib dod, dod4\tr \tuplet 3/2 { r8 dod(re) mi[re dod] }
  \grace mi re(dod) \grace mi re(dod) re fa sol lab
  lab si, si4. si'8 sol mi

  %82
  re2(do8) la  mi' do
  la' mi do' la mi'4 re8 do
  \grace do si2 r

  %85
  mi,8.(fad32 sold) la16 (si do re) mi4 re
  re8 si do4 r8 sold la mi
  \grace sol fa4 mi8 re re do do si

  %88
  \grace si la2 r
  la8.(si32 do) re16(mi fad sold) la4 la\mbreak % fine p. 15
  la2(sold8) fa mi re

  %91
  do(la) fa'(re) \grace do si2\tr
  la r
  R1*8

  %101
  \tuplet 3/2 {
    r8\solo la do mi[do mi] la mi la do[si la]
    sold mi, sold si[sold si] re si re fa![mi re]
    dod la dod mi[dod mi] sol?  mi sol sib[la sol]

    %104
    fad re, fad la[fad la] do? la do mi[re do]
    si sol si re[si re] fa? re fa la[sol fa]
  }\mbreak
  mi(do') do4 \tuplet 3/2 { do8(si la) sol[fa mi] }

  %107
  re la' la4 \grace sol8 fa4 \grace mi8 re4
  \grace do8 si2 r
  sol' \grace fa8 mi4 \grace re8 dod4\mbreak

  %110
  \grace mi8 re dod \grace mi re dod re4 r8 mi
  \grace sol fa2 \grace mi8 re4 \grace do8 si4
  \grace re8 do si \grace re do si do4 r8 do'

  %113
  do2 si8 la sol fa\mbreak
  \grace mi8 re2 r
  R1*9

  %124
  r8 sol4\solo sol8~\tuplet 3/2 { sol fa mi fa[mi re] }
  mi sol4~sol8 \tuplet 3/2 { sol fa mi fa[mi re]}\mbreak
  do do'4 do8~\tuplet 3/2 { do sib la sib[la sol]}

  %127
  la do4 do8~\tuplet 3/2 { do sib la sib[la sol]}
  la2 \grace sol8 fa4 \grace mi8 re4
  sol8 mi \grace re do2 r4\mbreak

  %130
  fa2 \grace mi8 re4 \grace do8 sib4
  mi8 do sib2 la4
  re2 re'

  %133
  do sib8 la sol fa\mbreak
  mi sib' sib2 la4
  la\tr sol r8 sib la mi

  %136
  \grace mi fa2 r8 la sol re
  \grace re mi2 do'\mbreak
  si!8 la sol fa \grace fa mi2

  %139
  \grace mi8 re2 r
  sol,8.(la32 si) do16(re  mi fa) \tuplet 3/2 {
    sol8 fa mi fa[mi re]
    mi do re mi[re do] sol' fa mi fa[mi re]\mbreak

    %142
    mi re do sol'[fa mi] sib' la sol re'[do sib]
    la sol fa la[sol fa] do' si! la mi' re do
    si re do si[la sol] fa mi re do[si la]

    %145
    sol re' do si[la sol]
  } fa2\tr\mbreak
  mi8 do'(si do) r mi(red mi)
  r sol(fad sol) r mi' si do

  %148
  \grace si la4 sol16 (fa mi re) do4 re\tr
  do2 do'\mbreak
  do_\fermata re,\tr

  %151
  do r
  R1*14

}


IvlIn =  \relative do'' {

  do4 do2 \tuplet 3/2 { mi8 (re do) }
  la'4(sol8) r r4 r8 si,
  re4(do8.) mi16 mi4(re8.) fa16\mbreak

  %4
  mi8. la16 sol4 r si,
  do4.\tr si16 (do) \tuplet 3/2 {
    re8(do si) la[(sol fa)]
    mi re do
  }
  do4 r2

  %7
  do'8.(re32 mi fa16 sol la si) do4 sib\mbreak
  sib2(la4) sol~
  sol fa2 mi4

  %10
  re8 re4 re8~\tuplet 3/2 { re do si la[sol fa] }
  mi sol'4 sol8~\tuplet 3/2 { sol fa mi re[do sib] }
  la la'4 la8~\tuplet 3/2 { la8 sol fad mi[re do] }

  %13
  si re'4 re8~\tuplet 3/2 { re do si la[sol fa!]
  mi do' si la[sol fa] } mi4 re\tr
  do2 r4 r8 re\p\mbreak

  %16
  mib4.\tr re16(mib) fa4 mib
  \grace mib?8 re2 r4 r8 sol
  do,4.\tr\pp si16(do) re4 do

  %19
  si8 re4\f re8~\tuplet 3/2 { re do si la [sol fa] }\mbreak
  mi sol'4 sol8~\tuplet 3/2 { sol fa mi re[do sib]}
  la la'4 \once\tieDashed la8~\tuplet 3/2 { la sol fad mi[re do] }

  %22
  si? re'4 re8~\tuplet 3/2 { re do si la[sol fa?] }
  mi8.[do'16 la8. fa16] mi4 re\tr \mbreak
  do4. la8 fa4 sol

  %25
  do,2 r
  mi4\p mi mi mi
  fa mi re re\mbreak

  %28
  mi mi sol sol
  sol8. fa16 mi4 fa fa
  sol la sol si,

  %31
  do8.\f(re32 mi fa16 sol la si) do8.[sol16 mi8. sol16]\mbreak
  do,4\p do r mi
  fa8.(sol32 la sib16 do re mi) fa4 do

  %34
  re si mi mi8 do
  sol4\f sol sol \tuplet 3/2 { si8(la sol) }\mbreak
  do4\p sol sol sol

  %37
  sol sol sol sol
  sol sol sol sol
  sol fa r2\mbreak

  %40
  r4 la  la la
  sol sol sol sol
  mi mi la la

  %43
  re,8.\f (mi32 fad sol16 la si do) re4\staccatissimo do\staccatissimo\mbreak
  si2\p la
  sol4 sol re re

  %46
  mi mi re re
  sol8.\f(la32 si) do16(re mi fad) sol8. re16 si8. sol16\mbreak
  fad4\p re r la'

  %49
  sol sol r sol
  sol la la8 sol sol fad
  si4 do do \tuplet 3/2 { do8 si la }\mbreak

  %52
  sol4 la \grace sol8 fad2\tr
  sol4^\tu\f sol2 \tuplet 3/2 { si8(la sol) }
  mi'4(re8) r r4 r8 fad,

  %55
  la4(sol8.) si16 si4(la8.) do16\mbreak
  si8. mi16 re4 r fad,
  sol4.\tr fad16 (sol) \tuplet 3/2 { la8 sol fad mi[re do]

  %58
  si la sol} sol4 r2
  sol'8.(la32 si do16 re mi fad) sol4 fa\mbreak
  fa2(mi4) re~

  %61
  re do2 si4~
  si8 la4 la8~\tuplet 3/2 { la sol fad mi[re do] }
  si re'4 re8~\tuplet 3/2 { re do si la[sol fa?] }\mbreak

  %64
  mi mi'4 mi8~\tuplet 3/2 { mi re dod si[la sol] }
  fad la'4 \once\tieDashed la8~\tuplet 3/2 { la8 sol fad mi[re do?]
  si sol' fad mi[re do]} si4 la\tr

  %67
  sol2 r
  R1*4
  sol8.\f(la32 si) do16(re mi fad) sol4 fa,!

  %73
  mi\p si' si si
  si si si si
  si si si si \mbreak

  %76
  la,8.\f(si32 do re16 mi fad sold) la4 do\p
  do si si si
  si si si sib

  %79
  sib? la la la\mbreak
  la la la lab
  lab lab sol sol

  %82
  \parenthesize la mi mi r
  r mi la la
  mi8.\f(fad32 sold la16 si do re) mi4\staccatissimo re\staccatissimo

  %85
  do2\p si~
  si4 la la la
  la la la sold

  %88
  la2 r
  R1*3 %%%% inizio p. 16
  la4^\tu\f la2 \tuplet 3/2 { do8(si la)}

  %93
  fa'4(mi8) r r4 r8 sold,\mbreak
  si4(la8.) do16 do4(si8.) re16
  do8. fa16 mi4 r la

  %96
  la4.\tr sold16 (la) \tuplet 3/2 { si8 la sold fa[mi re]
  do mi mi mi[mi mi] mi re do si[la sol]}\mbreak
  fa fa'4 fa8~\tuplet 3/2 { fa mi re do[sib la] }

  %99
  sold si'4 si8~\tuplet 3/2 { si la sold fa[mi re]
  do la' sol? fa [mi re]} do4 si\tr
  la do\p do do\mbreak

  %102
  r si si si
  r dod dod dod
  r la la la

  %105
  r si si si\mbreak
  do r r2
  R1*2

  %109
  r4 sib\p sib la\mbreak
  la la  la la
  la la la sol

  %112
  sol sol sol sol
  la la r la\mbreak
  sol sol r2

  %115
  do4^\tu\f do2 \tuplet 3/2 { mi8(re do)}
  la'4(sol8) r r4 r8 si,
  re4(do8.) mi16 mi4(re8.) fa16\mbreak

  %118
  mi8. la16 sol4 r si,
  do4.\tr si16(do) \tuplet 3/2 { re8 do si la[sol fa]
  mi re do} do4 r2

  %121
  do'8.(re32 mi fa16 sol la si) do4 sib~
  sib2 (la4) sol~
  sol fa2 mi4

  %124
  re r r2
  R1*3
  r4 la\p la la

  %129
  sol sol sol sol  %%% fine p. 20
  fa fa fa fa
  mi mi mi mi

  %132
  re fa fa fa
  fa fa fa fa\mbreak
  sol sol2 sol4

  %135
  fa mi mi la
  la la sol sol
  sol sol sol sol\mbreak

  %138
  r la la fad
  sol8.\f(la32 si do16 re mi fa) sol4 fa,?
  mi sol\p sol sol

  %141
  sol sol sol sol\mbreak
  sol do do do
  do re re re

  %144
  re sol, r2
  r4 si, do re\mbreak
  mi\f r mi r

  %147
  mi r mi r
  fa\p fa sol sol,
  la8.(si32 do re16 mi fa sol) la8.[la16 sol8. fad16]\mbreak

  %150
  sol2_\fermata sol,
  do'8^\tu\f sol'4 sol8~\tuplet 3/2 { sol fa mi re[do sib] }
  la la'4 la8~\tuplet 3/2 { la sol fad mi[re do] }

  %153
  \parenthesize si re'4 re8~\tuplet 3/2 { re do si la[sol fa?]
  mi do' si la[sol fa]} mi4 re\tr
  do2 r4 r8 re\p

  %156
  mib4.\tr re16(mib) fa4 mib
  \grace fa8 mib4 re r r8 \parenthesize sol\mbreak
  do,4.\pp\tr si16(do) re4 do

  %159
  si8 re4\f re8~\tuplet 3/2 { re do si la[sol fa] }
  mi sol'4 sol8~\tuplet 3/2 { sol fa mi re[do sib]}
  la la'4 la8~\tuplet 3/2 { la sol fad? mi[re do] }

  %162
  si re'4 re8~\tuplet 3/2 { re do si la [sol fa?] }
  mi8.[do'16 la8. fa16] mi4 re\tr
  do r8 la fa4 sol

  %165
  do,2 r

}

IvlIIn = \relative do'' {

  do4 do2 \tuplet 3/2 { mi8 (re do) }
  la'4(sol8) r r4 r8 si,
  re4(do8.) mi16 mi4(re8.) fa16\mbreak

  %4
  mi8. la16 sol4 r si,
  do4.\tr si16 (do) \tuplet 3/2 {
    re8(do si) la[(sol fa)]
    mi re do
  }
  do4 r2

  %7
  do'8.(re32 mi fa16 sol la si) do4 sol\mbreak
  sol2(fa4) mi
  re2 do

  %10
  si8 re4 re8~\tuplet 3/2 { re do si la[sol fa] }
  mi sol'4 sol8~\tuplet 3/2 { sol fa mi re[do sib] }
  la la'4 la8~\tuplet 3/2 { la8 sol fad mi[re do] }

  %13
  si re'4 re8~\tuplet 3/2 { re do si la[sol fa!]
  mi do' si la[sol fa] } mi4 re\tr
  do2 r4 r8 si\p \mbreak

  %16
  do4.\tr \once\slurDashed si16(do) re4 do
  \grace do8 si2 r4 r8 fa
  mib4.\tr\pp re16(mib) fa4 mib

  %19
  re8 re'4\f re8~\tuplet 3/2 { re do si la [sol fa] }\mbreak
  mi sol'4 sol8~\tuplet 3/2 { sol fa mi re[do sib]}
  la la'4 \once\tieDashed la8~\tuplet 3/2 { la sol fad mi[re do] }

  %22
  si? re'4 re8~\tuplet 3/2 { re do si la[sol fa?] }
  mi8.[do'16 la8. fa16] mi4 re\tr \mbreak
  do4. la8 fa4 sol

  %25
  do,2 r
  do4\p do do do
  do do si si\mbreak

  %28
  la la si si
  do do  re re
  mi fa sol si,

  %31
  do8.\f(re32 mi fa16 sol la si) do8.[sol16 mi8. sol16]\mbreak
  do,4\p do r mi
  fa8.(sol32 la sib16 do re mi) fa4 do

  %34
  si sol do do,
  sol'\f sol sol \tuplet 3/2 { si8(la sol) }\mbreak
  do4\p mi, mi mi

  %37
  mi mi mi mi
  mi mi mi mi
  do do r2\mbreak

  %40
  r4 fad fad re
  re re re re
  mi mi mi mi

  %43
  re8.\f (mi32 fad sol16 la si do) re4\staccatissimo do\staccatissimo\mbreak
  si4\p sol fad re
  sol sol si, si

  %46
  do do re re
  sol8.\f(la32 si) do16(re mi fad) sol8. re16 si8. sol16\mbreak
  fad4\p re sol fad

  %49
  sol sol si, si
  do do re re
  mi mi fad fad

  %52
  sol do, re re
  sol4\f sol2 \tuplet 3/2 { si8(la sol) }
  mi'4(re8) r r4 r8 fad,

  %55
  la4(sol8.) si16 si4(la8.) do16\mbreak
  si8. mi16 re4 r fad,
  sol4.\tr fad16 (sol) \tuplet 3/2 { la8 sol fad mi[re do]

  %58
  si la sol} sol4 r2
  sol'8.(la32 si do16 re mi fad) sol4 re\mbreak
  re2(do4) si(

  %61
  la2) sol
  fad8 la4 la8~\tuplet 3/2 { la sol fad mi[re do] }
  si re'4 re8~\tuplet 3/2 { re do si la[sol fa?] }\mbreak

  %64
  mi mi'4 mi8~\tuplet 3/2 { mi re dod si[la sol] }
  fad la'4 \once\tieDashed la8~\tuplet 3/2 { la8 sol fad mi[re do?]
  si sol' fad mi[re do]} si4 la\tr

  %67
  sol2 r
  R1*4
  sol8.\f(la32 si) do16(re mi fad) sol4 fa,!

  %73
  mi\p mi mi mi
  sold sold sold sold
  sold? sold sold sold\mbreak

  %76
  la,8.\f(si32 do re16 mi fad sold) la4 la\p
  la la la la
  sol sol sol sol

  %76
  sol sol sol sol\mbreak
  fa fa fa fa
  fa fa mi mi

  %79
  la la, la la
  r la do red
  mi8.\f(fad32 sold la16 si do re) mi4\staccatissimo re\staccatissimo

  %85
  mi\p la, sold mi(
  la) la, do do
  re re  mi mi

  %88
  fa2 r
  R1*3 %%%% inizio p. 16
  la4^\tu\f la2 \tuplet 3/2 { do8(si la)}

  %93
  fa'4(mi8) r r4 r8 sold,\mbreak
  si4(la8.) do16 do4(si8.) re16
  do8. fa16 mi4 r la

  %96
  la4.\tr sold16 (la) \tuplet 3/2 { si8 la sold fa[mi re]
  do mi mi mi[mi mi] mi re do si[la sol]}\mbreak
  fa fa'4 fa8~\tuplet 3/2 { fa mi re do[sib la] }

  %99
  sold si'4 si8~\tuplet 3/2 { si la sold fa[mi re]
  do la' sol? fa [mi re]} do4 si\tr
  la la\p la la\mbreak

  %102
  r sol sol sol
  r la la la
  r fad fad fad

  %105
  r sol sol sol\mbreak
  sol r r2
  R1*2

  %109
  r4 sol\p sol sol\mbreak
  fa fa fa fa
  fa fa fa fa

  %112
  mi mi mi mi
  fa fa fa fad\mbreak
  sol sol r2

  %115
  do4^\tu\f do2 \tuplet 3/2 { mi8(re do)}
  la'4(sol8) r r4 r8 si,
  re4(do8.) mi16 mi4(re8.) fa16\mbreak

  %118
  mi8. la16 sol4 r si,
  do4.\tr si16(do) \tuplet 3/2 { re8 do si la[sol fa]
  mi re do} do4 r2

  %121
  do'8.(re32 mi fa16 sol la si) do4 sol~\mbreak
  sol2(fa4) mi
  re2 do

  %124
  si4 r r2
  R1*3
  r4 fa\p fa fa

  %129
  mi mi mi mi\mbreak
  re re re re
  do do do do

  %132
  sib sib sib sib
  la la la la\mbreak
  sol mi' fa si,!

  %135
  do do dod dod
  re re si si
  do? do mi mi\mbreak

  %138
  fa fa fa fad
  sol8.\f(la32 si do16 re mi fa) sol4 fa,?
  mi do\p si sol

  %141
  do do si si\mbreak
  do do mi mi
  fa fa fad fad

  %144
  sol sol r2
  r4 sol, la si\mbreak
  do r do r

  %147
  do r do r
  fa\p fa sol sol,
  la8.(si32 do re16 mi fa sol) la8.[la16 sol8. fad16]\mbreak

  %150
  sol2_\fermata sol,
  do'8^\tu\f sol'4 sol8~\tuplet 3/2 { sol fa mi re[do sib] }
  la la'4 la8~\tuplet 3/2 { la sol fad mi[re do] }

  %153
  \parenthesize si re'4 re8~\tuplet 3/2 { re do si la[sol fa?]
  mi do' si la[sol fa]} mi4 re\tr
  do2 r4 r8 si\p

  %156
  do4.\tr si16(do) re4 do
  \grace re8 do4 si r r8 fa\mbreak
  mib4.\tr\pp re16(mib) fa4 mib

  %159
  re8 re'4\f re8~\tuplet 3/2 { re do si la[sol fa] }
  mi sol'4 sol8~\tuplet 3/2 { sol fa mi re[do sib]}
  la la'4 la8~\tuplet 3/2 { la sol fad? mi[re do] }

  %162
  si re'4 re8~\tuplet 3/2 { re do si la [sol fa?] }
  mi8.[do'16 la8. fa16] mi4 re\tr
  do r8 la fa4 sol

  %165
  do,2 r

}

Ivlan = \relative do'{

  mi4 mi mi \tuplet 3/2 { sol8(fa mi)}
  fa4(mi) re\staccatissimo re\staccatissimo
  mi mi sol sol\mbreak sol8. fa16 mi4 fa fa
  sol sol la si
  do,8.(re32 mi) fa16(sol la si)

  %6
  do8.[sol16 mi8. sol16]
  mi4 mi mi do\mbreak
  fa8.(sol32 la sib?16 do re mi) fa4 do

  %9
  re si? sol la
  si si, do re
  mi mi fa sol\mbreak

  %12
  la fad sol la
  si si do re
  do do8 la sol4 fa

  %15
  mi2 r4 sol\p \mbreak
  do do fa,? fad
  sol sol sol sol

  %18
  lab\pp lab fa fad
  la si,\f do re\mbreak
  mi mi fa sol

  %21
  la fad sol la
  si si do re
  do do8. la16 sol4 fa\tr

  %24
  mi4. la8 fa4 sol
  mi2 r
  R1*9

  %35
  do'4\f si si si \mbreak
  do4\p r r2
  R1*2

  %39
  fa,,8.\f(sol32 la sib16 do re mi) fa4 fa\mbreak
  R1*13
  si4\f si si \tuplet 3/2 { re8(do si) }

  %54
  do4 si la la
  si si re re\mbreak
  re8. do16 si4 do do,

  %57
  re re mi fad
  sol,8.(la32 si) do16\f(re mi fad) sol8.[re16 si8. re16]
  si4\p si si sol\mbreak

  %60
  do8.(re32 mi fa16\f sol la si) do4 sol
  la fad re mi
  fad fad sol la

  %63
  si si, do re\mbreak
  mi dod re mi
  fad fad sol la

  %66
  sol sol8 mi re4 do
  si2 r\mbreak
  R1*20

  %88
  fa8.(sol32 la sib16\f do re mi) fa4 mi
  red\p fa? fa fa\mbreak
  si si si si

  %91
  la la la sold
  la do,\f do do
  re do re re\mbreak

  %94
  mi mi mi mi
  mi mi re re
  mi mi fa! sold

  %97
  la do, re mi\mbreak
  fa re mi fa
  mi sold la si

  %100
  la \tuplet 3/2 { re8 do si } la4 sold
  la2\p r\mbreak
  R1*6

  %108
  sol,8.(la32 si do16 re mi fa?) sol4 fa
  mi\p r r2\mbreak
  R1*4

  %114
  sol,8.(la32\f si do16 re mi fa) sol8.[fa16 mi8. re16]
  mi4 mi mi fa
  fa mi re re

  %117
  mi mi sol sol\mbreak
  sol8. fa16 mi4 fa fa
  sol sol la si

  %120
  do,8.(re32 mi fa16 sol la si) do8.[sol16 mi8. sol16]
  mi4 mi mi do\mbreak
  fa8.(sol32 la sib16 do re mi) fa4 do

  %123
  re si? sol la
  si si\p do re
  do si do re\mbreak

  %126
  do mi, fa sol
  fa mi fa sol
  fa\p r r2

  %129
  R1*22
  mi4\f mi fa sol
  la fad sol la

  %153
  si si do re\mbreak
  do do8 la sol4 fa
  mi2 r4 sol

  %156
  do\p do fa, fad
  sol sol sol sol\mbreak
  lab\pp lab fa fad

  %159
  sol si,\f do re
  mi mi fa sol
  si fad sol si\mbreak

  %162
  si si do re
  do do8 la sol4 fa
  mi4. la8 fa4 sol

  %165
  mi2 r

}

Ibcn = \relative do {

  do4 do do do
  do do si si
  la la si si\mbreak

  %4
  do do re re
  mi mi fa sol
  do,8.(re32 mi fa16 sol la si) do8.[sol16 mi8. sol16]

  %7
  do,4 do r mi\mbreak
  fa8.(sol32 la sib?16 do re mi) fa4 do
  si? sol do fad,

  %10
  sol sol, la si
  do do re mi\mbreak
  fa re mi fad

  %13
  sol sol la si
  do fa, sol sol,
  do sol8 mi do2\mbreak

  %16
  R1*3
  r4 sol'\f la si\mbreak
  do do re  mi

  %21
  fa re mi fad
  sol sol la si
  do fa, sol sol,\mbreak

  %24
  do4. la'8 fa4 sol
  do, do' sol mi
  do r r2

  %27
  R1*8
  sol'4\f sol fa fa\mbreak
  mi r r2

  %37
  r4 do do\p do
  do do do do
  fa,8.\f(sol32 la sib16 do re mi) fa4 fa\mbreak

  %40
  fad fad fad\p fad
  sol sol si, si
  do do do dod

  %43
  re2 r\mbreak
  R1*9
  sol4\f sol sol sol

  %54
  sol sol fad fad
  mi mi fad fad\mbreak
  sol sol la la,

  %57
  si si do re
  sol,8.(la32 si do16\f re mi fad) sol8.[re16 si8. re16]
  sol,4\p sol r si\mbreak

  %60
  do8.(re32 mi fa16\f sol la si) do4 sol
  fad re sol dod,
  re re mi fad

  %63
  sol sol, la si\mbreak
  do la si dod
  re re mi fad

  %66
  sol do, re re,
  sol sol'\p si dod\mbreak
  re re do! si

  %69
  fad sol fad fad
  sol sol si, dod
  re2 re,\mbreak

  %72
  sol2\f r
  R1*15
  fa8.(sol32 la sib16\f do re mi) fa4 mi

  %89
  red2 \p si\mbreak  %%%% fine p. 15
  mi4 mi mi sold
  la re, mi mi,

  %92
  la la\f la la
  la la si si\mbreak
  do do sold sold

  %95
  la la si si
  do do re mi
  la la, si do\mbreak

  %98
  re si do re
  mi mi fa! sold
  la re, mi mi,

  %101
  la r r2\mbreak
  mi'4\p r r2
  la,4 r r2

  %104
  re4 r r2
  sol,4 r r2\mbreak
  do4 do mi mi

  %107
  fa fa fa fad
  sol,8.\f la32(si do16 re mi fa) sol4 fa?

  %109
  mi\p r r2\mbreak
  R1*4
  \once\slurDashed sol,8.\f la32(si do16 re mi fa) sol8.[fa16 mi8. re16]

  %115
  do4 do do do
  do do si si
  la la si si\mbreak

  %118
  do do re re
  mi mi fa \parenthesize sol
  do,8.(re32 mi fa16 sol la si) do8.[sol16 mi8. sol16]

  %121
  do,4 do r mi\mbreak
  fa8.(sol32 la sib16 do re mi) fa4 do
  si? sol do fad,

  %124
  sol sol\p la si
  do sol la si\mbreak
  do do, re mi

  %127
  fa do re mi
  fa r r2
  R1*22

  %151
  do4\f do re mi
  fa re mi fad
  sol sol la si\mbreak

  %154
  do fa, sol sol,
  do sol8 mi do4 r
  R1*3

  %159
  r4 sol'\f la si
  do do re mi
  fa re mi fad\mbreak

  %162
  sol sol la si
  do fa, sol sol,
  do4. la'8 fa4 sol

  %165
  do,2 r

}

Ibfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown




}

forma = {

  \key do\major
  \time 4/4
  \tempo 2 = 75
  s1*165
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
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza
}


IIfln = \relative do'' {

  R4.*16
  do'4.~\solo
  do~

  %19
  do~
  do
  fa,8 mi re\mbreak

  %22
  do16 do' \grace do8 sib4
  \tuplet 3/2 { la16 sib do } sib8[la]
  la(sol) r

  %25
  si \grace re do \grace si la
  sol4 fa8~
  \tuplet 3/2 { fa16 mi do' sib![la sol] fa mi re }

  %28
  \grace do8 si4 r8
  re'4~re16. fa,32\mbreak
  \tuplet 3/2 { fa16 red mi fa[sol la] si do dod}

  %31
  re4~re16. fa,32
  \tuplet 3/2 { fa16 red mi fa[sol la] si do sol}
  \grace si?8 la sol \tuplet 3/2 { r16 do(la) }

  %34
  \grace sol8 fa mi8. do16
  \appoggiatura sib'!8 \tuplet 3/2 { la16 sol fa } mi8[re\tr]
  do4 r8

  %37
  R4.*7
  sol'8\solo mi \grace sol fa16.\tr[(mi64 fa)]\mbreak
  sol8 sol8. la16

  %46
  \tuplet 3/2 { sib! do re } re8[do16. sib32]
  \grace sib8 la4 r8
  dod[re8. sib16]

  %49
  \grace la8 sol4 r8
  sib16 la re dod mi sol,
  \appoggiatura sol8 fa4 mi8\mbreak

  %52
  re16 re' do sib la sold
  \grace sold?8 la4 r8
  r16 dod mi8 re16. sold,32

  %55
  \grace sold?8 la4 r8
  \tuplet 3/2 { sib16 sol mi } \grace re8 dod8. [sib'16]
  \tuplet 3/2 { sib sold la } dod8.[re16]\mbreak

  %58
  \grace dod?8 \tuplet 3/2 { sib16(la sol) } fa8[mib\tr]
  \tuplet 3/2 { re16 sib' sol } sol8\tr[fa]
  \grace fa mi4 r8

  %61
  do'4.~
  do~
  do~

  %64
  do
  \tuplet 3/2 { do16 la fa } \grace fa8 mib4
  \tuplet 3/2 { mib?16(dod re) } re8.[sib'16]

  %67
  sib16. mi,32 mi8.[do'16]
  do16 la \grace sol8 fa8.[mib'16]
  \tuplet 3/2 { re16 do sib } la8[sol\tr]

  %70
  fa4.~\mbreak
  fa
  fa8\fermata sol4\tr

  %73
  fa r8
  R4.*7

}


IIvlIn =  \relative do'' {

  do8 la sib
  do16. la'32 la4
  sib,8 sol la

  %4
  sib16. sol'32 sol4
  fa8 mi re\mbreak
  do do sib

  %7
  \tuplet 3/2 { la16(sib do) } sib8.[la16]
  \grace sib8 la sol r
  fa fa8. fa'16

  %10
  fa16[sol,] sol8. sib'16
  sib16[re,] re8. mi16
  \grace mi8 fa4 r8

  %13
  \tuplet 3/2 { fa16 la sol fa[mi re] do si do
  dod re do sib? [la sol] fad la sol}
  re16. sib'32 \grace fa8 mi4

  %16
  fa16. do32 \grace sib8 la4
  do'8\p la sib\tr
  do16. la'32 la4

  %19
  sib,8 sol la\tr
  sib16. sol'32 sol4
  \grace sol8 fa4 r8\mbreak

  %22
  R4.*7
  r8 fa,\p re\mbreak
  do4 r8

  %31
  r fa re
  do4 r8
  R4.*3

  %36
  sol'8^\tu\f mi fa
  sol16. mi'32 mi4\mbreak
  fa,8 re mi

  %39
  fa16. re'32 re4
  do8 si la
  sol sol fa\tr

  %42
  mi16. fa32 \grace mi8 re4\tr
  do4 r8
  do'4.\p~\mbreak

  %45
  do4.~
  do~
  \tuplet 3/2 { do16 fa mi re[do sib] la sol fa }

  %48
  mi8 fa re
  \tuplet 3/2 { mi16 mi'(re dod[sib la] sol mi re)}
  dod4 dod16 mi

  %51
  re8 re dod\mbreak
  re re re
  dod16. sold'32 la16. mi32 dod16. la32

  %54
  re8 re re
  dod16. la'32 sol16.\f fa32 mi16. re32
  sib'8\p sib sib

  %57
  r la la\mbreak
  \tuplet 3/2 { sol16(fa mi) } re8[dod]
  re re re

  %60
  do!4 r8
  do' la sib
  do16. la'32 la4

  %63
  sib,8 sol la\mbreak
  sib16. sol'32 sol4
  fa r8

  %66
  R4.*5
  r16 re,\f re do do si
  do8\fermata do4

  %73
  fa8 fa8. fa'16
  fa sol, sol8.[sib'16]
  sib[re,] re8. mi16

  %76
  \grace mi8 fa4 r8
  \tuplet 3/2 { fa16 la sol fa[mi re] do si do
  dod re do sib?[la sol] fad la sol}

  %79
  re16. sib'32 \grace fa8 mi4
  fa16. do32 \grace sib8 la4

}

IIvlIIn = \relative do'' {

  la8 fa \grace la sol
  la16. do32 do4
  sol8 mi \grace sol fa

  %4
  sol16. sib32 sib4
  la4 sib8\mbreak
  la la sol

  %7
  \tuplet 3/2 { \once\slurDashed fa16 (sol la) } sol8.[fa16]
  \grace sol8 fa mi r
  fa fa8. fa'16

  %10
  fa16[sol,] sol8. sib'16
  sib16[re,] re8. mi16
  \grace mi8 fa4 r8

  %13
  \tuplet 3/2 { fa16 la sol fa[mi re] do si do
  dod re do sib? [la sol] fad la sol}
  re16. sib'32 \grace fa8 mi4

  %16
  fa16. do32 \grace sib8 la4
  la'8\p fa sol\tr
  la16. do32 do4

  %19
  sol8 mi fa\tr
  sol16. sib32 sib4
  la r8\mbreak

  %22
  R4.*7
  r8 sib,\p sib\mbreak
  do4 r8

  %31
  r sib sib
  do4 r8
  R4.*3

  %36
  mi8\f do re
  mi16. sol32 sol4\mbreak
  re8 si do

  %39
  re16. fa32 fa4
  mi4 fa8
  mi mi re\tr

  %42
  do16. re32 \grace do8 si4
  do r8
  do'4.\p~\mbreak

  %45
  do4.~
  do~
  \tuplet 3/2 { do16 fa mi re[do sib] la sol fa }

  %48
  mi8 fa re
  \tuplet 3/2 { mi16 mi'(re dod[sib la] sol mi re)}
  dod4 la8

  %51
  re sold, la\mbreak
  sib sib sib
  la16.[sold'32] la16. mi32 dod?16.[la32]

  %54
  sib8 sib sib
  la16. la'32 sol16.\f[fa32] mi16. re32
  sol8\p sol sol

  %57
  fa fa fa\mbreak
  sol la la,
  sib sib si

  %60
  do4 r8
  la' fa sol
  la16. do32 do4

  %63
  sol8 mi fa\mbreak
  sol16. sib32 sib4
  la r8

  %66
  R4.*5
  r16 re,\f re do do si
  do8\fermata do4

  %73
  fa8 fa8. fa'16
  fa sol, sol8.[sib'16]
  sib[re,] re8. mi16

  %76
  \grace mi8 fa4 r8
  \tuplet 3/2 { fa16 la sol fa[mi re] do si do
  dod re do sib?[la sol] fad la sol}

  %79
  re16. sib'32 \grace fa8 mi4
  fa16. do32 \grace sib8 la4

}

IIvlan = \relative do'{

  fa4 r8
  fa, fa'16. do32 la16. fa32
  do'4 r8

  %4
  do do'16. sol32 mi16. do32
  fa4 fa8\mbreak
  fa re mi

  %7
  fa re re
  do do r
  r do do

  %10
  r re re
  r sib sib
  la8. re16 do16. sib32

  %13
  do4 r8\mbreak
  fa4 r8
  sib, la sol\tr

  %16
  fa4 r8
  R4.*19
  do'4\f r8

  %37
  do do'16. sol32 mi16. do32\mbreak
  sol'4 r8
  sol, sol'16. re32 si16.[sol32]

  %40
  do4 do8
  do la si
  do sol' fa

  %43
  mi4 r8
  R4.*16
  r16 si'\f do16. sol32 mi16. do32

  %61
  fa4\p r8
  r fa16.[do32] la16. fa32
  do'4 r8\mbreak

  %64
  r8 do'16.[sol32] mi16. do32
  fa4 r8
  R4.*5

  %71
  r16 re\f re do do si
  do8\fermata\p do4
  r8 do do

  %74
  r re re
  r sib sib
  la8. re16 do16. sib32

  %77
  do4 r8\mbreak
  fa4 r8
  sib, la sol\tr

  %80
  fa4 r8

}

IIbcn = \relative do {

  fa4 r8
  fa,8 fa'16. do32 la16.[fa32]
  do'4 r8

  %4
  do8 do'16. sol32 mi16. do32
  fa4 sib8\mbreak
  fa8 sol sol,

  %7
  fa' sib, si
  do do' sib!
  sib la, la

  %10
  r sib sib
  r sib' do
  re8. re,16 do16. sib32

  %13
  la4 r8\mbreak
  sib4 r8
  sib do do,

  %16
  fa4 r8
  fa'4\p r8
  r fa16.[do32] la16. fa32

  %19
  do'4 r8
  r8 do'16. sol32 mi16. do32
  fa4 sib8\mbreak

  %22
  la sol do
  fa, sib si
  do do, re

  %25
  mi4 do8
  re si sol
  do fa fad

  %28
  r16. fad32 sol16.[re32 si16. sol32]
  sol4 r8\mbreak
  r do mi

  %31
  sol4 r8
  r do, mi
  fa mi do

  %34
  si do mi
  fa sol sol,
  do4\f r8

  %37
  do do'16. sol32 mi16. do32\mbreak
  sol4 r8
  sol [sol'16. re32] si16. sol32

  %40
  do4 fa8
  do re sol,
  la16.[fa32] sol8 sol'

  %43
  do, mi sol
  do do,\p re\mbreak
  mi do fa

  %46
  sol  mi do
  fa fa, r
  R4.*12

  %60
  r16 si'\f do16. sol32 mi16. do32
  fa4\p r8
  r fa16.[do32] la16. fa32

  %63
  do'4 r8\mbreak
  r8 do'16.[sol32] mi16. do32
  fa8 la, la

  %66
  sib sib sib
  do do sib
  la la la

  %69
  sib do do,
  re16 re' re do do si\mbreak
  r16 re\f re do do si

  %72
  do4\fermata\p do,8
  fa la\f la
  r sib sib

  %75
  r sib' do
  re8. re,16 do16. sib32
  la4 r8\mbreak

  %78
  sib4 r8
  sib do do,
  fa4 r8

}

IIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown




}

forma = {

  \key fa\major
  \time 3/8
  \tempo "Presto" 4 = 45
  s4.*80
  \bar"|."

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

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}


IIIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza
}


IIIfln = \relative do'' {

  R4.*39
  do8\solo mi sol
  do do,8. la'16

  %42
  \grace sol8 fa4.\tr
  mi16 do sol' mi do' la\mbreak
  \grace sol8 fa4.\tr

  %45
  \grace fa8 mi4 r8
  do la'4~
  la16 fad sol mi re do

  %48
  si fad'? \grace fad8 mi4
  \grace mi8 re4.
  r16 fad la sol fad mi\mbreak

  %51
  \grace re8 do4.\tr
  si16 sol' mi do' si la
  \grace sol8 fad4.

  %54
  re16 fad la do si la
  re, sol si re do si
  re, fad la do si la

  %57
  si re do si la sol\mbreak
  re fad la do si la
  re, sol si re do si

  %60
  re, fad la do si la
  si re do si la sol
  mi' re do si la sol

  %63
  fad  mi re do si la
  sol8 sol' fad
  \grace fad?16 mi8 re r\mbreak

  %66
  \grace re8 do si r
  mi16 do \grace si8 la4
  si16 fad' \grace fad8 sol4

  %69
  mi16 do' \grace si8 la4\tr
  sol4 r8
  R4.*28

  %99
  sol4.\solo
  si
  re~

  %102
  re8 do16 si la sol
  mi'8(re) sol,\staccatissimo
  do8(si) sol\staccatissimo

  %105
  mi'8(re) sol,\staccatissimo
  do8(si) sol\staccatissimo
  la4 si16 do\mbreak

  %108
  si4 r16 mi,
  fad4 sol16(la)
  sol4 r16 do,

  %111
  re4 mi16(fa?)
  mi4 la16(si)
  do8 \grace si la \grace sol fad

  %114
  \grace mi red4 r8
  si16 red fad do' si la
  sold fa! mi re dod si\mbreak

  %117
  la dod mi si' la sol
  fad mi re do? si la
  sol si re la' sol fa!

  %120
  mi re do si la sol'
  fad mi red do si la'
  sol fad mi red mi si'

  %123
  do8 mi do
  \grace si8 lad4.
  si8 re si\mbreak

  %126
  \grace la sold4.
  la8 do la
  \grace sol? fad4.

  %129
  sol8 si sol
  \grace fa? mi4.
  r8 do' la

  %132
  r sol mi
  fad la do
  \grace mi, red4.\mbreak

  %135
  mi16 si sol' mi si' sol
  mi' si la sol fad mi
  do' la \grace sol8 fad4

  %138
  mi r8
  R4.*10
  r16 mi,\solo sol si mi sol

  %150
  fad  mi red do si la
  sol sol si mi sol si\mbreak
  la sol fad mi red do

  %153
  si si mi sol si mi
  do4.
  si16 sol fad mi la sol

  %156
  \appoggiatura sol8 fad4 r8
  si4.
  re

  %159
  \grace la8 sold4.~
  sold?8 mi16 fad sold! la
  si8 do re~

  %162
  re do si
  \grace si do4 r8
  R4.

  %165
  la
  do
  \grace sol8 fad4.~

  %168
  fad?8 re16 mi fad sol\mbreak
  la8 si do~
  do si la

  %171
  \grace la si4 re16 fa,!
  \grace fa8 mi4 do'16 mi,
  \grace mi8 re4 re'16 fa,

  %174
  \grace fa8 mi4.\tr
  re16 do' si la sol fa
  mi do sol' mi do' mi,

  %177
  \grace fa8 mi\tr re r\mbreak
  R4.*11
  do8\solo mi sol

  %190
  do do,8. la'16
  \grace sol8 fa4.\tr
  mi16 do sol' mi do' la

  %193
  \grace sol8 fa4.\tr
  \grace fa8 mi4.
  do8 la'4~

  %196
  la16 fad sol mi re do
  si fad'? \grace fad8 mi4\mbreak
  re r8

  %199
  sol,16 si re sol si sol
  fa! sol re sol si, re
  sol, do mi sol do sol

  %202
  fa sol mi sol do, mi
  sol, si re sol si sol
  fa sol re fa si, re

  %205
  fa, do' mi sol do sol
  fa mi re do si do\mbreak
  do mi sol do mi do

  %208
  si do sol do mi, sol
  do, fa la do sib la
  sol fa mi fa mi fa

  %211
  do mi sol do mi do
  si do sol do mi, sol
  do, fa la do sib la

  %214
  sol fa mi fa mi fa
  re'8 fad, sol\mbreak
  do mi, fad

  %217
  si red, mi
  la dod, re
  sol sol fa?\tr

  %220
  \grace fa mi4 r16 sol
  do,4 sib8\tr
  \grace sib? la4 la'16 fad

  %223
  \grace re8 do4.\tr
  si4 re'16 si\mbreak
  \grace sol8 fa4.\tr

  %226
  mi
  do'
  do8\fermata \grace{do,16[re]} re4\tr

  %229
  do r8
  R4.*27

}


IIIvlIn =  \relative do'' {

  do,8\staccatissimo mi\staccatissimo sol\staccatissimo
  do do, r
  mi\staccatissimo sol\staccatissimo si\staccatissimo

  %4
  mi mi, r
  sol do mi\mbreak
  sol do, do'

  %7
  sol4 fa8\tr
  mi4 r16 do
  sol4 fa8\tr

  %10
  mi16 sol do mi sol do,
  la' sol fa mi re do\mbreak
  si sol' sol sol sol sol

  %13
  sol sol sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %16
  fa8\staccatissimo mi\staccatissimo r
  re \grace do8 si4\tr\mbreak
  do4 re8

  %19
  mib\p mib re
  \grace re8 do4.~
  do16 mib re8 do

  %22
  si sol'4
  \grace fa8 mib re do\mbreak
  \tuplet 3/2 { si16 (la sol) } r sol\f la si

  %25
  do mi re do si la
  sol la sol fa mi re
  do mi re do si la

  %28
  sol sol'' sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %31
  sol sol sol sol sol sol
  fa8\staccatissimo mi\staccatissimo r
  re \grace do si4\tr

  %34
  do8 do'16 do, do' do,
  re4 mi16(fa)
  mi si do sol mi do\mbreak

  %37
  fa16.\tr(mi64 fa) sol8[sol,]
  do do' do,
  do4 r8

  %40
  R4.*14
  r8 fad\p fad
  r sol sol

  %56
  r la la
  r si si\mbreak
  r8 fad fad

  %59
  r sol sol
  r la la
  r si si

  %62
  R4.*8
  sol,8^\tu\f si re
  sol sol, r

  %72
  si re sol
  si si, r\mbreak
  re sol si

  %75
  re sol, sol'
  re4 do8\tr
  si4 r16 sol

  %78
  re4 do8
  si16 re sol si re sol,
  mi' re do si la sol

  %81
  re re'' re re re re\mbreak
  re re re re re re
  re re re re re re

  %84
  re re re re re re
  do8\staccatissimo si\staccatissimo r
  la \grace sol fad4\tr

  %87
  sol4 la,8
  sib\p sib la
  \grace la sol4.~\mbreak %%%%% fine p 37

  %90
  sol16 sib la8 sol
  fad re'4
  \grace do8 sib la sol

  %93
  \tuplet 3/2 { fad16(mi re) } r re'\f mi fad
  sol si la sol fad mi
  re mi re do si la

  %96
  sol si la sol fad mi
  <do' re,>8 si r
  la \grace sol fad4\mbreak

  %99
  sol8\p sol sol
  sol sol sol
  sol re si

  %102
  sol\staccatissimo sol'\staccatissimo r
  do si r
  la sol r

  %105
  do si r
  la sol re
  mi fad fad\mbreak

  %108
  sol4 si8
  do si red
  mi4 sol,8

  %111
  la si si
  do4 mi,8
  mi4 lad,8

  %114
  si\f red fad
  si4\p r8
  si4 r8\mbreak

  %117
  la4 r8
  la4 r8
  sol4 r8

  %120
  sol4 la8
  la4 si8
  si4 sol8

  %123
  sol sol sol
  fad fad fad
  fad? fad fad\mbreak

  %126
  mi mi mi
  mi mi mi
  re re re

  %129
  re re re
  do do do
  do do do

  %132
  do do do
  do do do
  si16 fad' si la sol fad\mbreak

  %135
  mi4 r8
  si'4 r8
  la si si,

  %138
  mi\f^\tu sol si
  mi sol si
  \grace si la4.

  %141
  sol16 si la sol fad mi
  do' si la sol fad mi
  red si' si si si si\mbreak

  %144
  si si si si si si
  si si si si si si
  si si si si si si

  %147
  la8\staccatissimo sol\staccatissimo r
  fad \grace mi red4\tr
  mi4 r8

  %150
  R4.*7
  r8 sold,\p sold
  r si si

  %159
  r re si\mbreak
  sold4 r8
  sold la si~

  %162
  si la sold
  \grace sold? la4 r8
  la,\f do mi

  %165
  la fad\p fad
  r la la
  r do la

  %168
  fad4 r8\mbreak
  fad sol la~
  la sol fad

  %171
  sol4 r8
  R4.*6
  do,8^\tu\f mi sol

  %179
  do do, r
  mi sol do
  mi mi, r

  %182
  sol do mi
  sol do, do'
  \grace sol fa4.\tr

  %185
  mi4 r16 do
  \grace sol8 fa4.
  mi16 sol' fa mi re do\mbreak

  %188
  la' sol fa mi re do
  si la sol fa mi re
  do4 r8

  %191
  R4.*8
  re'4.~
  re

  %201
  mi~
  mi
  re~

  %204
  re
  mi~
  mi\mbreak

  %207
  mi~
  mi
  fa~

  %210
  fa
  mi~
  mi

  %213
  fa~
  fa
  R4.*13

  %228
  R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}
  do16^\tu\f sol' sol sol sol sol
  sol sol sol sol sol sol

  %231
  sol sol sol sol sol sol
  sol sol sol sol sol sol
  fa8\staccatissimo mi\staccatissimo r\mbreak

  %234
  re \grace do si4\tr
  do4 re8
  mib\p mib re

  %237
  \grace re do4.~
  do16 mib re8 do
  si sol'4

  %240
  \grace fa8 mib re do
  \tuplet 3/2 { si16 (la sol) } r sol\f la si
  do mi re do si la

  %243
  sol la sol fa mi re
  do mi re do si la
  sol sol'' sol sol sol sol

  %246
  sol sol sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %249
  fa8\staccatissimo mi\staccatissimo r
  re \grace do si4\tr
  do8 do'16 do, do' do,

  %252
  re4 mi16(fa)
  mi si do sol mi do\mbreak
  fa16.\tr(mi64 fa) sol8[sol,]

  %255
  do do' do,
  do4 r8

}

IIIvlIIn = \relative do'' {

  do,8\staccatissimo mi\staccatissimo sol\staccatissimo
  do do, r
  mi\staccatissimo sol\staccatissimo si\staccatissimo

  %4
  mi mi, r
  sol do mi\mbreak
  sol do, do'

  %7
  sol4 fa8\tr
  mi4 r16 do
  sol4 fa8\tr

  %10
  mi16 sol do mi sol do,
  la' sol fa mi re do\mbreak
  si sol' sol sol sol sol

  %13
  sol sol sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %16
  re8\staccatissimo do\staccatissimo r
  fa, \grace mi re4\tr \mbreak
  mi si'8

  %19
  do\p sol fa
  \once\tieDashed mib4.~
  mib16 do' si8 la

  %22
  si do re
  do \grace si lab4\mbreak
  sol8 r16 sol\f la si

  %25
  do mi re do si la
  sol la sol fa mi re
  do mi re do si la

  %28
  sol sol'' sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %31
  sol sol sol sol sol sol
  re8\staccatissimo do\staccatissimo r
  re \grace do si4\tr

  %34
  do8 do'16 do, do' do,
  re4 mi16(fa)
  mi si do sol mi do\mbreak

  %37
  fa16.\tr(mi64 fa) sol8[sol,]
  do do' do,
  do4 r8

  %40
  R4.*14
  r8 fad\p fad
  r sol sol

  %56
  r la la
  r si si\mbreak
  r8 fad fad

  %59
  r sol sol
  r la la
  r si si

  %62
  R4.*8
  sol,8\f si re
  sol sol, r

  %72
  si re sol
  si si, r\mbreak
  re sol si

  %75
  re sol, sol'
  re4 do8\tr
  si4 r16 sol

  %78
  re4 do8
  si16 re sol si re sol,
  mi' re do si la sol

  %81
  re re'' re re re re\mbreak
  re re re re re re
  re re re re re re

  %84
  re re re re re re
  la8\staccatissimo sol\staccatissimo r
  do, \grace si la4\tr

  %87
  si fad8
  sol\p re do
  sib4.~\mbreak

  %90
  sib16 sol' fad8 mi
  fad? sol la
  sol \grace fad? mib4

  %93
  re8 r16 re'\f mi fad
  sol si la sol fad mi
  re mi re do si la

  %96
  sol si la sol fad mi
  <la re,>8 sol r
  la \grace sol fad4\mbreak

  %99
  sol8\p sol sol
  sol sol sol
  sol re si

  %102
  sol\staccatissimo sol'\staccatissimo r
  sol sol sol
  sol sol sol

  %105
  sol sol sol
  sol sol si,
  do re re\mbreak

  %108
  sol sol sol
  la si si,
  mi mi' mi,

  %111
  fa sol sol
  do, do si
  la4 lad8

  %114
  si\f red fad
  red4\p r8
  mi4 r8\mbreak

  %117
  dod4 r8
  re4 r8
  si4 r8

  %120
  do?4 dod8
  re4 red8
  mi4 mi8

  %123
  mi mi mi
  mi mi mi
  re? re re\mbreak

  %126
  re re re
  do do do
  do do do

  %129
  si si si
  si si si
  la la la

  %132
  la la la
  la la la
  si16 fad' si la sol fad\mbreak

  %135
  mi4 r8
  si'4 r8
  la si si,

  %138
  mi\f sol si
  mi sol si
  \grace si la4.

  %141
  sol16 si la sol fad mi
  do' si la sol fad mi
  red si' si si si si\mbreak

  %144
  si si si si si si
  si si si si si si
  si si si si si si

  %147
  fad8\staccatissimo mi\staccatissimo r
  fad \grace mi red4\tr
  mi4 r8

  %150
  R4.*7
  r8 mi,\p mi
  r sold sold

  %159
  r si sold\mbreak
  mi4 r8
  mi4 r8

  %162
  mi4 r8
  mi4 r8
  la,\f do mi

  %165
  la\p re, re
  r fad fad
  r la fad

  %168
  re4 r8\mbreak
  re4 r8
  re4 r8

  %171
  re4 r8
  R4.*6
  do8\f mi sol

  %179
  do do, r
  mi sol do
  mi mi, r

  %182
  sol do mi
  sol do, do'
  \grace sol fa4.\tr

  %185
  mi4 r16 do
  \grace sol8 fa4.
  mi16 sol' fa mi re do\mbreak

  %188
  la' sol fa mi re do
  si la sol fa mi re
  do4 r8

  %191
  R4.*8
  si'4.~
  si

  %201
  do~
  do
  si~

  %204
  si
  do~
  do\mbreak

  %207
  sol~
  sol
  la~

  %210
  la
  sol~
  sol

  %213
  la~
  la
  R4.*13

  %228
  R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}
  do16\f sol' sol sol sol sol
  sol sol sol sol sol sol

  %231
  sol sol sol sol sol sol
  sol sol sol sol sol sol
  re8\staccatissimo do\staccatissimo r\mbreak

  %234
  fa, \grace mi re4\tr
  mi si'8
  do\p sol fa

  %237
  mib4.~
  mib?16 do' si8 la
  si do re

  %240
  do \grace si lab4
  sol8 r16 sol\f la si\mbreak
  do mi re do si la

  %243
  sol la sol fa mi re
  do mi re do si la
  sol sol'' sol sol sol sol

  %246
  sol sol sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %249
  re8\staccatissimo do\staccatissimo r\mbreak
  re \grace do si4\tr
  do8 do'16 do, do' do,

  %252
  re4 mi16(fa)
  mi si do sol mi do\mbreak
  fa16.\tr(mi64 fa) sol8[sol,]

  %255
  do do' do,
  do4 r8

}

IIIvlan = \relative do'{

  R4.
  do8 mi sol
  do do, r

  %4
  mi sol do
  mi mi, r\mbreak
  mi sol mi

  %7
  re re' si
  sol mi sol
  si, re si

  %10
  sol4 do8
  do4 re8\mbreak
  re[r16 sol la si]

  %13
  do mi re do si la
  sol la sol fa mi re
  do mi re do si la

  %16
  sol8\staccatissimo sol\staccatissimo r
  re' sol fa\mbreak
  mi do r

  %19
  R4.*5
  r8 r sol'\f
  sol sol sol

  %26
  sol sol sol
  sol sol sol
  sol8[r16 sol la si]

  %29
  do mi re do si la\mbreak
  sol la sol fa mi re
  do mi re do si la

  %32
  sol8\staccatissimo sol\staccatissimo r
  fa' \grace mi re4
  mi sol8

  %35
  la si sol
  sol4 sol8\mbreak
  fa sol sol,

  %38
  do do' do,
  do sol mi
  do4 r8

  %41
  R4.*13
  r8 re'\p re
  r re re

  %56
  r re re
  r re re\mbreak
  r re re

  %59
  r re re
  r re re
  r re re

  %62
  R4.*9
  sol,8\f si re
  sol sol, r

  %73
  si re sol\mbreak
  si si, r
  si' re si

  %76
  la la fad
  re si re
  fad la fad

  %79
  re4 sol8
  sol4 la8
  sol8[r16 re mi fad]\mbreak

  %82
  sol16 si la sol fad mi
  re mi re do si la
  sol si la sol fad mi

  %85
  re8 re' r
  la re do
  si sol r

  %88
  R4.*5
  r8 r re'\p
  re re re

  %95
  re re re
  re re re
  re\staccatissimo sol\staccatissimo r

  %98
  do, \grace si la4\mbreak
  si4\p r8
  R4.*38

  %138
  mi4\f r8
  r mi sol
  fad red si

  %141
  mi4 sol,8
  la4 lad8
  si[r16 si dod red]\mbreak

  %144
  mi sol fad mi red do?
  si do si la sol fad
  mi sol' fad mi red dod

  %147
  si8\staccatissimo si\staccatissimo r
  la' \grace sol fad4\tr
  sol r8

  %150
  R4.*13
  la,8\f do mi
  do la r

  %165
  R4.*14
  do8\f mi sol
  do do, r

  %181
  mi sol do
  mi mi, r
  mi sol mi

  %184
  re re' si
  sol mi sol
  si, re si

  %187
  sol4 sol'8\mbreak
  do,4 \parenthesize la'8
  re,8[r16 fa mi re]

  %190
  do4 r8
  R4.*8
  sol'4.\p~

  %200
  sol~
  sol~
  sol~

  %203
  sol~
  sol~
  sol~

  %206
  sol(
  do,)~
  do~

  %209
  do~
  do~
  do~

  %212
  do~
  do~
  do

  %215
  R4.*13
  R4.^\markup\center-align {\musicglyph #"scripts.ufermata"}
  mi8[r16 mi' re do]

  %230
  si do si la sol fad
  sol la sol fa! mi re
  do mi re do si la

  %233
  sol8\staccatissimo sol\staccatissimo r\mbreak
  re' sol fa
  mi4 r8

  %236
  R4.*5
  r8 r sol\f \mbreak
  sol16 sol sol sol sol sol

  %243
  sol sol sol sol sol sol
  sol sol sol sol sol sol
  sol8[r16 sol la si]

  %246
  do mi re do si la
  sol la sol fa mi re
  do mi re do si la

  %249
  sol8\staccatissimo sol\staccatissimo r\mbreak
  fa' \grace mi re4\tr
  mi4 sol8

  %252
  la si sol
  sol4 sol8
  fa sol sol,

  %255
  do do' do,
  do4 r8

}

IIIbcn = \relative do {

  R4.
  do8 mi sol
  do do, r

  %4
  mi sol do
  mi mi, r\mbreak
  do' mi do

  %7
  re si sol
  do do, mi
  re si sol

  %10
  do4 mi8
  fa4 fad8\mbreak
  sol[r16 sol la si]

  %13
  do mi re do si la
  sol la sol fa mi re
  do mi re do si la

  %16
  sol8\staccatissimo do\staccatissimo r
  fa sol sol,\mbreak
  do do r

  %19
  r r sol'\p
  lab lab sol
  fad4 r8

  %22
  sol la? si
  do fa,4\mbreak
  sol8 sol sol\f

  %25
  sol sol sol
  sol16 sol sol sol sol sol
  sol sol sol sol sol sol

  %28
  sol8[r16 sol la si]
  do mi re do si la\mbreak
  sol la sol fa mi re

  %31
  do mi re do si la
  sol8\staccatissimo do\staccatissimo r
  fa sol sol,

  %34
  do4 mi8
  fa sol sol,
  do4 mi8\mbreak

  %37
  fa sol sol,
  do do' do,
  do sol mi

  %40
  do4 r8
  do'\p mi fa
  sol la si

  %43
  do do, r\mbreak
  sol' la si
  do re mi

  %46
  fa fa, fa
  mi do r
  sol' do fad,

  %49
  sol re si
  sol4 r8\mbreak
  la'8 fad re

  %52
  sol do, dod
  re la fad
  re4\p r8

  %55
  re'4 r8
  re4 r8
  re4 r8\mbreak

  %58
  re4 r8
  re4 r8
  re4 r8

  %61
  re4 r8
  do4 dod8
  re4 fad8

  %64
  sol4 r8
  do si sol\mbreak
  fad sol sol,

  %67
  do re re,
  r mi' do
  do re re,

  %70
  sol4 r8
  sol\f si re
  sol sol, r

  %73
  si re sol\mbreak
  si si, r
  sol' si sol

  %76
  la fad re
  sol sol, si
  la fad re

  %79
  sol4 si8
  do4 dod8
  re[r16 re mi fad]\mbreak

  %82
  sol16 si la sol fad mi
  re mi re do si la
  sol si la sol fad mi

  %85
  re8 sol r
  do re re,
  sol sol' r

  %88
  r r re
  mib mib re\mbreak
  dod4.

  %91
  re8 mi fad
  sol do,?4
  re16 re re re re re

  %94
  re16 re re re re re
  re16 re re re re re
  re16 re re re re re

  %97
  re8\staccatissimo sol\staccatissimo r
  do, re re,\mbreak
  sol4 r8

  %100
  R4.*15
  r8 si'\p si,
  r mi  mi,\mbreak

  %117
  r la' la,
  r re re,
  r sol' sol,

  %120
  do4 r8
  R4.*17
  mi4\f r8

  %139
  r mi sol
  fad red si
  mi4 sol,8

  %142
  la4 lad8
  si[r16 si dod red]\mbreak
  mi sol fad mi red do?

  %145
  si do si la sol fad
  mi sol' fad mi red dod?
  si8\staccatissimo mi\staccatissimo r

  %148
  la si si,
  mi4 r8
  mi4.~

  %151
  mi~\mbreak
  mi~
  mi

  %154
  la,8 la'16 sol fad mi
  red8 mi lad,
  si si'16 la sol fad

  %157
  mi4 r8
  mi4 r8
  mi4 r8\mbreak

  %160
  r mi mi
  mi4 r8
  mi,4 r8

  %163
  la\f do mi
  la la, r
  re4 r8

  %166
  re4 r8
  re4 r8
  r8 re re\mbreak

  %169
  re4 r8
  re,4 r8
  sol la si

  %172
  do mi do
  sol' si, sol
  do la fad

  %175
  sol4 si8
  do4 fad8
  sol16 sol, sol' fa! mi re\mbreak

  %178
  do4 r8
  do\f mi sol
  do do, r

  %181
  mi sol do
  mi mi, r
  do' mi do

  %184
  re si sol
  do do, mi
  re si sol

  %187
  do4 mi8\mbreak
  fa4 fad8
  sol[r16 fa! mi re]

  %190
  do8\p mi fa
  sol la si
  do do, r

  %193
  sol' la si
  do re mi
  fa la, fa

  %196
  mi do r
  si do fad\mbreak
  sol re si

  %199
  sol4.\p~
  sol~
  sol~

  %202
  sol~
  sol~
  sol~

  %205
  sol~
  sol(
  do)~

  %208
  do~
  do~
  do~

  %211
  do~
  do~
  do~

  %214
  do(
  sib4) sib'?8\mbreak
  la4 r8

  %217
  sol4 r8
  fa4 r8
  mi re sol

  %220
  do, do re
  mi re mi
  fa fa, r

  %223
  re' mi fad
  sol sol la\mbreak
  si la si

  %226
  do do si
  la sol fad
  sol4\fermata sol,8

  %229
  la\f r16 mi'' re do
  si do si la sol fad
  sol la sol fa! mi re

  %232
  do mi re do si la
  sol8\staccatissimo do\staccatissimo r\mbreak
  fa sol sol,

  %235
  do do, r
  r r sol''\p
  lab lab sol

  %238
  fad4.
  sol8 la si
  do fa,?4

  %241
  sol16\f sol sol sol sol sol\mbreak
  sol sol sol sol sol sol
  sol sol sol sol sol sol

  %244
  sol sol sol sol sol sol
  sol8[r16 sol la si]
  do mi re do si la

  %247
  sol la sol fa mi re
  do mi re do si la
  sol8\staccatissimo do\staccatissimo r\mbreak

  %250
  fa sol sol,
  do4 mi8
  fa sol sol,

  %253
  do4 mi8
  fa\tr sol sol,
  do do' do,

  %256
  do4 r8

}

IIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown




}

forma = {

  \key do\major
  \time 3/8
  \tempo 4. = 65
  s4.*256
  \bar"|."


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

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] Allegro molto"

\score {

  \new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
  }<<

    \new Staff <<
      \set Staff.midiInstrument = #"flute"
      \set Staff.instrumentName = \markup \center-column{"Flauto""Traverso"}
      \Ifl
    >>

    \new PianoStaff \with {
      \override StaffGrouper.staff-staff-spacing.basic-distance = #3
    }<<

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
    >>

    \new Staff <<
      \set Staff.midiInstrument = #"viola"
      \set Staff.instrumentName = \markup \center-column{"Viola"}
      \Ivla
    >>

    \new Staff <<
      \set Staff.midiInstrument = #"cello"
      \set Staff.instrumentName = \markup \center-column{"Basso"}
      \Ibc

    >>
  >>

  \layout {

    indent = 1.6\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[2.] Adagio ma non troppo"

\score {

  \new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
  }<<

    \new Staff <<
      \set Staff.midiInstrument = #"flute"
      \IIfl
    >>

    \new PianoStaff \with {
      \override StaffGrouper.staff-staff-spacing.basic-distance = #3
    }<<

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
      \set Staff.midiInstrument = #"cello"
      \IIbc

    >>
  >>

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[3.] Allegro"

\score {

  \new ChoirStaff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
  }<<

    \new Staff <<
      \set Staff.midiInstrument = #"flute"
      \IIIfl
    >>

    \new PianoStaff \with {
      \override StaffGrouper.staff-staff-spacing.basic-distance = #3
    }<<

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
      \set Staff.midiInstrument = #"cello"
      \IIIbc

    >>
  >>

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
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





%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
