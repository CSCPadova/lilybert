\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

tasto =_\markup\italic "T.S."

solo = ^\markup \italic { Solo }

dolce =_\markup\italic"Doux"

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.6

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


Iglobal = 	{

  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletNumber #'transparent = ##t
  \override TupletBracket #'bracket-visibility = ##f

}

IflIn = \relative do'' {

  sol'8(fad sol4) si,-. do-.
  re16(do si4.) do16(re mi4.)
  mi4(re) r8 re\p mi fad  %%%% ripresa

  %4
  sol4 fad8(mi re do si do)
  re si sol si do(re mi do)
  mi4(re) r re\f\mbreak

  %7
  do-. la'-. la-. do,~
  do si8 la si sol si4
  si(la)~la8 sol\p la si

  %10
  do-. fad(sol la) la(sol fad mi)
  re(do si la) do(si la sol)
  si4(la) r la\f

  %13
  si8(la si) re do(si do) mi\mbreak
  re si sol si re fa(mi re)
  mi(re mi) sol fad!(mi fad) la

  %16
  sol re si re sol si la sol
  la(sol la) do si(la si) re
  do(si la sol) fad mi re do

  %19
  si4 sol' si8(la sol fad)
  sol2 r \mbreak%%% fine ripresa
  \once	\slurDashed sol8\p(fad sol4) si, do

  %22
  re16(do si4.) do16(re mi4.)
  mi4(re) r8 re\pp mi fad
  sol4 fad8(mi re do si do)

  %25
  re si sol si do re mi do
  mi4(re) r re\p\mbreak
  do-. la'-. la-. do,~

  %28
  do si8 la si sol si4
  si(la)~la8 sol\pp la si
  do(fad sol la) la(sol fad mi)

  %31
  re(do si la) do(si la sol)
  si4(la) fad'2\p~
  fad mi\mbreak

  %34
  re sol~
  sol fad
  mi la~

  %37
  la4 sol8(fad sol fad mi re)
  mi \once\slurDashed la(sol fad mi re dod si)
  la4 si8(dod re dod si dod)

  %40
  re4 mi8(fad sol fad mi re)\mbreak
  la'1~
  la8 si la sol fad mi re dod

  %43
  re(sol fad mi) re4-. dod-.
  re8 si(la sol) fad4-. mi-.
  re r r2

  %46
  re''8\f(dod re4) fad, sol
  la16(sol fad4.) sol16(la si4.)\mbreak
  si4 (la) r8 la\p si dod

  %49
  re4 dod8(si la sol fad sol)
  la fad re fad sol la si sol
  si4 (la) r la\f

  %52
  sol-. mi'-. mi-. sol,~
  sol fad8 mi fad re fad4-.
  \once\slurDashed fad(mi)~mi8 re\p mi fad\mbreak

  %55
  sol dod(re mi) mi(re dod si)
  la(sol fad mi) sol(fad mi re)
  fad4(mi) r sol,\f

  %58
  fad8(mi fad) la sol(fad sol) si
  la fad re fad la do si la
  si(la si) re dod(si dod) mi\mbreak

  %61
  re la fad la re fad mi re
  mi(re mi) sol fad(mi fad) la
  sol(fad mi re) dod(si la sol)

  %64
  fad4 re' fad8(mi re dod)
  re\p(dod re4) fad,-. sol-.
  la8 si do?4~do8 si la sol\mbreak

  %67
  fad4 mi'(re do)
  si-. re-. sol-. r
  r do(si) r

  %70
  R1
  si8(la si4) red, r
  r2 sold

  %73
  la2. sold4\mbreak
  la(sol!) fad(mi)
  fad8(mi fad4) si,-. r

  %76
  R1
  mi'8\f(red mi4) sol, la
  si16(la sol4.) la16(si do4.)

  %79
  do4 (si) r sold
  la8(sold la4) dod,-. re-.\mbreak
  mi16(re dod4.) re16(mi fad4.)

  %82
  fad4(mi) r2
  fad8(mi fad4) si, r
  r si'2\p lad4

  %85
  si8(lad si4) fad r
  fad8(mi fad4) si, r
  si8(lad si4) fad r\mbreak

  %88
  R1
  r2 r4 fad'-\parenthesize -.\f
  mi-. dod'-. dod-. mi,~

  %91
  mi re8 dod re si re4
  re(dod)~dod8 si\p dod red
  mi lad(si dod) dod(si lad sold)

  %94
  fad(mi re dod) mi(re dod si)\mbreak
  re4(dod) fad2\p~
  fad1~

  %97
  fad~
  fad4 mi8 red mi fad sol la
  sold4-. si-. si-. re,-.

  %100
  re8(mi fa4) fa8(mi re4)
  do8(si) do(si) la4 sold\mbreak
  la8 mi(fad sold) la(si dod re)

  %103
  mi1~
  mi4 re8(dod re mi fad sol)
  fad4-. la-. la-. do,?-.

  %106
  do8(re mi4) mi8(re do4)
  si8(la) si(la) sol sol'(fad mi)
  re(do si) re do(re mi) do\mbreak

  %109
  mi4(re) r8 re mi fad
  sol4 fad8(mi re do si do)
  re si sol si do re mi do

  %112
  mi4(re) r re
  do-. la'-. la-. do,~
  do si8 la si sol si4\mbreak

  %115
  si4(la)~la8 sol la si
  do(fad sol la) la(sol fad mi)
  re(do si la) do(si la sol)

  %118
  \once\slurDashed si4(la) si2~
  si la
  sol do~\mbreak

  %121
  do si
  la re~
  re4 do8(si do si la sol)

  %124
  la re(do si la sol fad mi)
  re re' mi fad sol(fad mi fad)
  sol4 la8 si do si la sol

  %127
  re'1~\mbreak
  re8 mi re do si la sol fad
  sol(do si la) sol4-. fad-.

  %130
  sol8(mi re do) si4-. la-.
  sol r r2
  sol'8\f(fad sol4) si,-\parenthesize -. do-\parenthesize -.

  %133
  re16(do si4.) do16(re mi4.)
  mi4(re) r8 re\p mi fad  %%%% ripresa
  sol4 fad8(mi re do si do)

  %136
  re si sol si do(re mi do)
  mi4(re) r re\f\mbreak
  do-. la'-. la-. do,~

  %139
  do si8 la si sol si4
  si(la)~la8 sol\p la si
  do-. fad(sol la) la(sol fad mi)

  %142
  re(do si la) do(si la sol)
  si4(la) r la\f
  si8(la si) re do(si do) mi\mbreak

  %145
  re si sol si re fa(mi re)
  mi(re mi) sol fad!(mi fad) la
  sol re si re sol si la sol

  %148
  la(sol la) do si(la si) re
  do(si la sol) fad mi re do
  si4 sol' si8(la sol fad)

  %151
  sol2\fermata r \mbreak%%% fine ripresa

}

IflIIn = \relative do'' {

  re8(do re4) sol,-\parenthesize -. la-\parenthesize -.
  si sol mi do'~
  do4(si) r8 la\p si do %% ripresa

  %4
  re4 la si8(la sol la)
  si4 re mi do
  do(si) r si\f \mbreak

  %7
  la4-. do-. do-. la~
  la sol8 fad sol re sol4
  sol(fad)~fad8 mi\p fad sol

  %10
  la4 do fad, re
  sol re'2 sol4
  sol(fad) r fad,\f

  %13
  sol re re do'\mbreak
  si re sol, si
  do8(si do) mi la,(sol la) do

  %16
  re4 sol re si
  re fad sol si,
  la2~la8 do si la

  %19
  sol4 si do la
  si2 r %%% fine rip
  re8\p(do re4) sol, la

  %22
  \once\slurDashed si (sol) mi (do')
  do si r8 la\pp si do
  re4 la si8(la sol la)

  %25
  si4 re mi do
  do(si) r si\p\mbreak
  la do do (la)~

  %28
  la sol8 fad sol re sol4
  sol(fad)~fad8 mi\pp fad sol
  la4 do fad, re

  %31
  sol re'2 sol4
  \once\slurDashed sol(fad) re2\p~
  re dod\mbreak

  %34
  la si
  la re
  la2. sol8 fad

  %37
  mi4 dod'2 la4~
  la8 \once\slurDashed la'(sol fad mi re dod si)
  la1~

  %40
  la4 sol8 fad mi4 si'\mbreak
  mi8(re dod si) la sol fad mi
  re4 la' re mi

  %43
  fad re la sol
  fad mi fad sol
  la r r2

  %46
  la'8\f(sol la4) re, mi
  fad re si sol'\mbreak
  sol(fad) r8 mi\p fad sol

  %49
  la4 mi fad8(mi re mi)
  fad4 la si sol
  sol(fad) r fad\f

  %52
  mi-\parenthesize -. sol-\parenthesize -. sol-\parenthesize -. mi~
  mi re8 dod re la re4-.
  re(dod)~dod8 si\p dod re\mbreak

  %55
  mi4 sol dod, la
  re la'4~la re
  re(dod) r dod,\f

  %58
  re la mi sol
  fad la re, fad
  sol8(fad sol) si mi,(re mi) sol\mbreak

  %61
  la4 re la fad
  la dod re2~
  re4 dod8 si la4 mi'~

  %64
  mi re si la
  la8\p(sol la4) re, mi
  fad8(sol la4.) si8 do4~\mbreak

  %67
  do8 re(do si la sol fad la)
  sol4-. si-. re-. r
  r la'(sol) r

  %70
  R1
  fad8(mi fad4) si, r
  r2 fa'

  %73
  la,4(si) do(re)\mbreak
  do re do2
  do8(si do4) fad, r

  %76
  R1
  si'8\f(la si4) mi, fad
  sol mi do la'

  %79
  la(sol) r mi
  mi8(re mi4) la, si\mbreak
  dod la fad re'

  %82
  re(dod) r2
  re8(dod re4) re, r
  r sol'\p fad dod

  %85
  re8(dod re4) si lad'-.
  si-. r r mi,-.
  re-. r r lad-.\mbreak

  %88
  si-. r r2
  r r4 re-.\f
  dod-. mi-. mi-. dod~

  %91
  dod si8 lad si fad si4
  si(lad)~lad8 sold\p lad si
  dod4 re lad dod~

  %94
  dod si8 lad si4 si'\mbreak
  si(lad) dod,2\p
  red1~

  %97
  red
  si~
  si~

  %100
  si
  la4 sold la si\mbreak
  dod1~

  %103
  dod
  la~
  la~

  %106
  la
  sol4 re sol la
  si re, mi do'\mbreak

  %109
  do(si) r8 la si do
  re4 la si8(la sol la)
  si4 re mi do

  %112
  do(si) r si
  la-. do-. do-. la~
  la sol8 fad sol re sol4\mbreak

  %115
  sol(fad)~fad8 mi fad sol
  la4 do fad, re
  sol re'2 sol4

  %118
  sol(fad) sol,2~
  sol fad
  re mi\mbreak

  %121
  re sol
  re'2. do8 si
  la4 fad2 re4~

  %124
  re8 \once\slurDashed re'(do si la sol fad mi)
  re2 re'~
  re4 do8 si la4 mi'

  %127
  la8(sol fad mi re do si la)\mbreak
  sol4 re' sol la
  si sol re do

  %130
  si la si do
  re r r2
  re8\f(do re4) sol, la

  %133
  si (sol) mi (do')
  do4(si) r8 la\p si do %% ripresa
  re4 la si8(la sol la)

  %136
  si4 sol mi do'
  do(si) r si\f \mbreak
  la4-. do-. do-. la~

  %139
  la sol8 fad sol re sol4
  sol(fad)~fad8 mi\p fad sol
  la4 do fad, re

  %142
  sol re'2 sol4
  sol(fad) r fad,\f
  sol re re do'\mbreak

  %145
  si re sol, si
  do8(si do) mi la,(sol la) do
  re4 sol re si

  %148
  re fad sol si,
  la2~la8 do si la
  sol4 si do la

  %151
  si2\fermata r %%% fine rip

}

IflIIIn = \relative do'' {

  si8(la si do) re4 re,
  sol1~
  sol8 fad sol la sol(fad\p sol la) %%% ripresa

  %4
  si4 do re re,
  sol1~
  sol8 fad sol la sol la sol\f fad\mbreak

  %7
  mi2 re
  re re
  re8(mi fad sol) la(si\p la sol)

  %10
  fad4 mi re do'
  si fad sol si
  re2 r4 re,\f

  %13
  re sol2 fad4\mbreak
  sol si re, sol
  sol2 re

  %16
  sol4 re' si re
  la re re sol~
  sol fad8 mi re4 re,

  %19
  re mi mi re
  re2 r %%% fine ripresa
  \once\slurDashed si'8\p(la si do) re4 re,

  %22
  sol1~
  sol8 fad sol la sol fad\pp sol la
  si4 do re re,

  %25
  sol1~
  sol8 fad sol la sol la\p sol fad\mbreak
  mi2 re

  %28
  re re
  re8(mi fad sol) la(si\pp la sol)
  fad4 mi re do'

  %31
  si fad sol si
  re2 la4\p re,
  sol2 la\mbreak

  %34
  re,4 la' re sol,
  mi2 la
  mi re

  %37
  la'2. la8 si
  dod la'(sol fad mi re dod re)
  mi4(re) la'(sol)

  %40
  fad(la) dod,(mi)\mbreak
  la, mi' sol dod,
  re mi, fad sol

  %43
  la re,8 mi fad4 sol
  la dod re dod
  re r r2

  %46
  fad8\f(mi fad sol) la4 la,
  re1~\mbreak
  re8 dod(re mi) re(do\p re mi)

  %49
  fad4 sol la la,
  re1~
  re8 dod(re mi re) mi\f re do

  %52
  si2 la
  la la
  la8(si dod re mi fad\p mi re)\mbreak

  %55
  dod4 si la sol
  fad dod' re fad
  la2 r4 la,\f

  %58
  la re2 dod4
  re fad la, re,
  re2 la'\mbreak

  %61
  re4 la fad la
  mi la la fad
  mi2. mi4

  %64
  fad fad sol mi
  fad8\p(mi fad4) re' dod
  re do!8(si la sol fad mi)\mbreak

  %67
  re4-. la'-. fad-. re-.
  re sol8(fad sol4) r
  r la mi' r

  %70
  R1
  red8(dod red4) fad, r
  r2 re'!  %%%%%%Fin qui OK

  %73
  mi4 fa, mi2~\mbreak
  mi fad!4 sol
  la8(sol la4) red, r

  %76
  R1
  sol8\f(fad sol la) si2
  mi,1~

  %79
  mi8 red mi fad mi4 si'
  dod8(si dod re) mi4 mi,\mbreak
  la1~

  %82
  la2 r
  la8(sol la4) sol r
  r dod\p dod fad,

  %85
  fad8(mi fad4) re mi'-.
  re-. r r sol,-.
  fad-. r r mi-.\mbreak

  %88
  re-. r r2
  r8 dod'\f(re mi re dod si la)
  sol2 fad

  %91
  fad fad
  fad8(sold lad si) dod(re\p dod si)
  lad4 fad fad mi

  %94
  re fad si sol\mbreak
  fad2 lad\p
  la!1~

  %97
  la2 fad
  sol2. fad4
  mi2. fad4

  %100
  sold1
  mi~\mbreak
  mi2 mi~

  %103
  mi1
  fad2. dod'4
  re2 fad,~

  %106
  fad1
  re'8(do si do) re4 re,
  sol1~\mbreak

  %109
  sol8 fad sol la sol(fad sol la)
  si4 do re re,
  sol1~

  %112
  sol8 fad sol la sol la sol fad
  mi2 re
  re re~\mbreak

  %115
  re8 mi(fad sol la si la sol)
  fad4 mi re do'
  do fad, sol si

  %118
  re2 re,4 sol
  mi'2 re~
  re sol,4 mi\mbreak

  %121
  la2 re,
  fad re
  re'4 la fad sol

  %124
  fad8 \once\slurDashed re'(do si la sol fad sol)
  la4(sol) re'(do)
  si(re) fad,(la)

  %127
  re, la' do fad,\mbreak
  sol(la) si(do)
  re sol,8 la si4(do)

  %130
  re fad sol fad
  sol r r2
  \once\slurDashed si,8\f(la si do) re4 re,

  %133
  sol1~
  sol8 fad sol la sol(fad\p sol la) %%% ripresa
  si4 do re re,

  %136
  sol1~
  sol8 fad sol la sol la sol\f fad\mbreak
  mi2 re

  %139
  re re
  re8(mi fad sol) la(si\p la sol)
  fad4 mi re do'

  %142
  si fad sol si
  re2 r4 re,\f
  re sol2 fad4\mbreak

  %145
  sol si re, sol
  sol2 re
  sol4 re' si re

  %148
  la re re sol~
  sol fad8 mi re4 re,
  re mi mi re

  %151
  re2 r %%% fine ripresa

}

Ivocen = \relative do'' {

  %\autoBeamOff
  R1*20
  sol'8(fad sol4) si, do
  re si do8 re mi4

  %23
  mi(re) r re
  sol(fad8[mi] re do) si[(do)]
  re4 sol, do8(re) mi4

  %26
  mi(re) r re\mbreak
  do la' la do,
  do(si8[la] si sol) si4

  %29
  si(la) r2
  R1
  re8(do re4) re,2

  %32
  r r4 la'
  si(dod) dod(re)\mbreak
  re8(mi re dod re4) mi

  %35
  la,2 r4 re
  dod re re mi
  mi8(fad mi re mi4) fad

  %38
  la,2 r4 la
  sol'(fad) fad(mi)
  fad(mi8 re dod4) si\mbreak

  %41
  dod8 [la si dod] re [mi fad sol]
  la2 r4 sol,
  fad8(si la sol fad4 mi

  %44
  re8 re' dod si la4) sol
  fad re' fad8(mi) re[(dod)]
  re2 r

  %47
  R1*18
  r2 r4 la
  re la fad sol\mbreak

  %67
  la8(si do4) do8(si la4)
  si8(la si la) sol4 sol'
  fad mi8(red) mi4 si

  %70
  sol(la) la(si)
  si2 r4 si
  mi2 re16(mi fa4.)

  %73
  mi4 re do si\mbreak
  do(si) la la'
  \grace mi8 red2. fad4

  %76
  si, mi8 fad sol4 fad
  mi2 r
  r r4 red

  %79
  mi si si8 dod re?4
  dod2 r\mbreak
  r r4 la

  %82
  sol'2 mi8(fad sol4)
  fad2 r4 si,
  mi2 dod8(re mi4)

  %85
  re2 r4 dod
  si8(mi re dod si4) lad
  si8(dod re mi fad4) sol\mbreak

  %88
  fad mi8(re) mi4 dod
  si2 r
  R1*5

  %95
  r2 r4 mi
  red fad fad la,
  la8(si do4) do8(si la4)

  %98
  sol8 (fad sol fad) mi4 red
  mi fad sold la
  si8(do re si) sold2\tr

  %101
  la r4 re\mbreak
  dod mi mi sol,
  sol8(la si4) si8(la sol4)

  %104
  fad8(mi fad mi) re4 mi
  fad8(la do2) la4
  fad'2 r

  %107
  sol8(fad sol4) si, do
  re8(do si4) do8(re mi4)\mbreak
  mi(re) r re

  %110
  sol(fad8 mi re do si do
  re4) sol, do8(re) mi4
  mi(re) r re

  %113
  do la' la do,
  do(si8 la si sol) si4\mbreak
  la re, re'2

  %116
  r4 sol, do2
  r4 fad, sol sol'
  sol(fad) r re,

  %119
  mi fad fad sol
  sol8(la sol fad sol4) la\mbreak
  re,2 r4 sol

  %122
  fad sol sol la
  la8(si la sol la4) si
  re,2 r4 re

  %125
  do'(si) si(la)
  si(la8 sol fad4) mi
  fad8 re mi fad sol la si do\mbreak

  %128
  re2 r4 do
  si8 mi re do si4 la
  sol8 sol' fad mi re4 do

  %131
  si la8 sol la4 fad
  sol2 r
  R1*19

}

Itesto = \lyricmode {

  Hört doch! der sanf -- ten Flö - ten Chor

  er -- freut die Brust, er -- götzt das Ohr,

  hört doch! der sanf -- ten Flö -- ten Chor,

  hört doch! der sanf -- ten Flö -- ten Chor

  er -- freut die Brust, er -- götzt das Ohr,

  der sanf -- ten Flö -- ten Chor - - - - - - - -

  er -- freut die Brust, er -- götzt das Ohr.

  Der un -- zer -- trenn -- ten Ein -- tracht Stärke -

  macht die -- se net -- te Har -- mo -- nie

  und tut noch größ -- re Wun -- der -- wer -- ke;

  dies merkt, und stimmt doch - auch wie sie,

  dies merkt, und stimmt - doch auch,

  dies merkt, und stimmt doch auch wie sie,

  dies merkt, und stimmt, und stimmt doch auch wie sie.

  Der un -- zer -- trenn -- ten Ein -- tracht Stär -- ke

  macht die -- se net -- te Har -- mo -- nie

  und tut noch größ -- re Wun -- der -- wer -- ke;

  dies merkt, und stimmt, dies merkt, und stimmt

  doch auch, und stimmt doch auch wie sie,

  dies merkt, und stimmt doch auch wie sie,

  dies merkt, und stimmt doch auch wie sie.

  Hört doch! der sanf -- ten Flö -- ten Chor

  er -- freut die Brust, er -- götzt das Ohr,

  der sanf -- ten Flö -- ten Chor - - - - - - - -

  er -- freut - - - -  - - - - - - die Brust, er - götzt das Ohr.

}

Ibcn = \relative do {

  sol2_\markup\italic"piano sempre" r
  R1
  r4 sol sol'2  %% ripresa

  %4
  R1*2
  r4 sol, sol'2~\mbreak
  sol fad

  %8
  sol sol,
  re'4 re, re'2
  R1*2

  %12
  r4 re8(mi fad do si la)
  sol2 la\mbreak
  si r4 sol

  %15
  do si do la
  si2 r4 si'
  fad re sol mi

  %18
  la si8 do re4 fad,
  sol mi do re
  sol, la8(si do re  mi fad)  %% fine ripresa

  %21
  sol2\p r
  R1
  r4 sol, sol'2

  %24
  R1*2
  r4 sol, sol'2~\mbreak
  sol fad

  %28
  sol sol,
  re'4 re, re'2
  R1*2

  %32
  r4 re8(mi re do si la)
  sol2 sol'~\mbreak
  sol4 fad8 mi fad4 re

  %35
  dod (mi) re(fad)
  sol(fad8 mi) sol(fad mi re)
  dod4(mi) la,(re)

  %38
  la' la,8 si dod4 re
  dod la la'2
  re,4 la la' sol~\mbreak

  %41
  sol8 fad(mi re dod si la sol)
  fad re'(dod si la sol fad mi)
  re4(re re re)

  %44
  re(re re re)
  re si' sol la
  re2 r

  %47
  R1\mbreak
  r4 re, re'2
  R1*2

  %51
  r4 re re'2~
  re dod
  re re,

  %54
  la'4 la, la'2\mbreak
  R1*2
  r4 la,8(si la sol fad mi)

  %58
  re2 mi
  fad r4 re'
  sol fad sol mi\mbreak

  %61
  fad2 r4 fad
  dod(la) re(la)
  mi' fad8 sol la4 dod,

  %64
  re si sol la
  re re, re'2
  r4 re, re'2\mbreak

  %67
  r4 re, re' re,
  sol sol'8(la si4) mi,
  la(sol8 fad sol4) red

  %70
  mi re? do8(si do4)
  si si'2 la4
  sold8(fad sold4) si, re

  %73
  do re mi mi,\mbreak
  la mi' la2~
  la4 la, la'(sol8 fad

  %76
  sol4) mi si' si,
  mi2 r
  R1

  %79
  r4 mi sol mi
  la2 r\mbreak
  R1

  %82
  r4 la dod la
  re re, sol8(fad sol4)
  dod, re8(mi fad4) fad,

  %85
  si(si si si)
  si(si si si)
  si sol re dod'\mbreak

  %88
  re si fad' fad,
  si fad' si2~
  si lad

  %91
  si si,
  fad'4 fad, fad'2
  R1*2

  %95
  r4 fad8(mi fad sold lad fad)
  si4 si,(si si)
  si(si si si)

  %98
  mi si sol si
  mi mi,(mi mi)
  mi(mi mi mi)

  %101
  la(si) do(si)\mbreak
  la(la la la)
  la(la la la)

  %104
  re la fad la
  re re,(re re)
  re(re re re)

  %107
  sol2 r
  R1\mbreak
  r4 sol sol'2

  %110
  R1*2
  r4 sol, sol'2~
  sol fad

  %114
  sol sol,\mbreak
  re' r4 re,
  re'2 r4 re,

  %117
  re'2 r
  r8 re, (mi fad sol la si sol)
  do4 do, do'2~

  %120
  do4 si8 la si4 sol
  fad(la) sol(si)
  la(si8 la) do(si la sol)

  %123
  fad4(la) re,(sol)
  re' mi fad sol
  fad re re'2

  %126
  sol,4 re re' do!~
  do8 si(la sol fad mi re do)
  si8 sol'(fad mi re do si la)

  %129
  sol4(sol sol sol)
  sol(sol sol sol)
  sol mi la re

  %132
  sol2 r
  R1
  r4 sol, sol'2  %% ripresa

  %135
  R1*2
  r4 sol, sol'2~\mbreak
  sol fad

  %139
  sol sol,
  re'4 re, re'2
  R1*2

  %143
  r4 re8(mi fad do si la)
  sol2 la\mbreak
  si r4 sol

  %146
  do si do la
  si2 r4 si'
  fad re sol mi

  %149
  la si8 do re4 fad,
  sol mi do re
  sol,2\fermata r

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s1*6
  <4 2>2 <6 5>
  <9 4>4 <8 3> <8 3>2
  <6 4>4 <5 3> s2
  s1*2
  \bassFigureExtendersOn
  s2 <_>4 <_>\bassFigureExtendersOff
  s2 <7>4 <6>
  <6>1
  s2 <4 2>
  <6> s
  <6> s4 <7>
  <7>2 <7>4 <6 5>
  s2 <6>
  s1  %%% fine ripresa
  s1*6
  <4 2>2 <6 5>
  <9 4>4 <8 3> s2
  <6 4>4 <5 3> s2
  s1*3
  <7>2 <6 4+ 2>
  <5 2> <6 4 2>
  <6 5> s
  <6 4+ 2> <5 2>
  <6>4 <6\\> <7 _+>2
  <_+> <6>
  <6 5>4 <6 4> <6 4> <5 _+>
  s <_+> \bassFigureExtendersOn <_>8 <_> <[6]>4
   <4+ 2>2 <4+>
  \bassFigureExtendersOff <6>4 <6> <6 4> <7 5+>
  s2 s4 <7\\ 4 2>
  <5 3> s s <7\\ 4>
  <5 3> s <6 5> <_+>
  s1*6
  <4 2>2 <6 5>
  <9 4>4 <8 3> s2
  \bassFigureExtendersOn <6 4>4 <5 _+> <_>4 <_>
  s1*2
  s4 <_+> <_+> <_+>
  s2 <7>4 <6\\>
  <6>1
  <5>2 <4+ 2>
  <6> s4 <6>\bassFigureExtendersOff
  <6> <7 _+> s <6 4>
  <7> s <7 _+> <6 5>
  s2 <6 5>4 <_+>
  s1*2
  s4 <7!> s2
  s <6>4 <5>
  <6> <6>8 <6\\> <6>4 <6>
  s2 <6>
  <_+> s4 <4+ 2>
  <6>2\bassFigureExtendersOn <6\\ 5!>4 <5!>\bassFigureExtendersOff
  <6>4 <_!> <6 4> <5 _+>
  s <7 5> <6 8> <7 5>\bassFigureExtendersOn
  <6 4+ 2>2 <4+>4 s
  <6> s <6 4> <5 _+>\bassFigureExtendersOff
  s1
  s
  s2 <6>4 <7 _+>
  <_+>1
  s
  \bassFigureExtendersOn s4 <7 _+> <6 _ 5> <_>\bassFigureExtendersOff
  s2 <7>
  <7> <7 4>4 <_+>
  s2 s4 <7\\ 4 2+>
  <5 3>2 s4 <7\\ 4 2+>
  <5 3> s <6> <6\\ 5->
  <6>2 <4>4 <_+>
  s1
  <6 4+ 2>2 <6 5>
  <9 4> <8 3>
  <6 4>4\bassFigureExtendersOn <5+ _+> <_+> <_+>\bassFigureExtendersOff
  s1
  s
  s4 <_+> <8> <6 5-> \bassFigureExtendersOn
  <7- _+>1 <_+>2 <_+>
  <9>4 <4>8 <_+> <6>4 <_+>8 s \bassFigureExtendersOff
  <_+>2 <7 _+>4 s
  \bassFigureExtendersOn <7 _ _+>2 <_>4 <_>\bassFigureExtendersOff
  s2 <6>4 <6\\>
  <_+>1
  <7 _+>
  s4 <_+> <6> <_+>
  s1
  <7->
  s1*6
  <4 2>2 <6 5>
  <9 4>4 <8 3> s2
  s1
  <7>
  <7>
  s8 <6 4> <6 4 2> s s4 <6>
  <7>2 <6 4 2>
  <5 2> <6 4 2>
  <6 5> <5 3>
  <6 4 2> <5 2>
  \bassFigureExtendersOn <6>4 <6> <7>2
  s4 <_>8 <_> <6>4 <5>8 s\bassFigureExtendersOff
  <6 5>4 <6 4> <6 4> <5 3>
  s2 s4 <[6]>\bassFigureExtendersOn
  <4 _ 2>2 <_>4 <_>
  \bassFigureExtendersOff <6>2 <6 4>4 <7 5>
  s2 s4 <7 4 2>
  <5 3>2 s4 <7 4 2>
  <[5 3]> s <6 5>2
  s1*6
  <4 2>2 <6 5>
  <9 4>4 <8 3> <8 3>2
  <6 4>4 <5 3> s2
  s1*2
  \bassFigureExtendersOn
  s2 <_>4 <_>\bassFigureExtendersOff
  s2 <7>4 <6>
  <6>1
  s2 <4 2>
  <6> s
  <6> s4 <7>
  <7>2 <7>4 <6 5>
  s2 <6>

}

forma = {

  \time 2/2
  \key sol\major
  \tempo 1 = 57
  s1*151
  \bar "|."

}


IflI = {
  \Iglobal
  %\notypeset
  <<\IflIn\forma>>
}

IflII = {
  \Iglobal
  <<\IflIIn\forma>>
}

IflIII = {
  \Iglobal
  <<\IflIIIn\forma>>
}

Ivoce = {
  \new Voice = "doch"
  \Iglobal
  %\clef soprano
  <<\Ivocen\forma>>
}



Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn\forma\Ibfn>>
  \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

  systems-per-page = #3
  print-first-page-number = ##t
  first-page-number = #2

}

  \markup \huge {9. Aria: “Hört doch! der sanften Flöten Chor”}


  \score {

      \new ChoirStaff <<

        \new Staff <<
          \set Staff.instrumentName = \markup\center-column {"Traversa""[I]"}
          \set Staff.midiInstrument = #"flute"
          \IflI
        >>
        \new Staff <<
          \set Staff.instrumentName = \markup \center-column {"Traversa""[II]"}
          \set Staff.midiInstrument = #"flute"
          \IflII
        >>
        \new Staff <<
          \set Staff.instrumentName = \markup  \center-column {"Traversa""[III]"}
          \set Staff.midiInstrument = #"flute"
          \IflIII
        >>
        \new Staff <<
          \set Staff.instrumentName = \markup  \center-column {"Soprano"}
          \set Staff.midiInstrument = #"synth voice"
          \Ivoce
          \new Lyrics \lyricsto "doch" \Itesto
        >>

        \new Staff  <<
          \set Staff.instrumentName = \markup\center-column {"[Basso]"}
          \set Staff.midiInstrument = #"cello"
          \Ibc
        >>
      >>

    \layout {

      indent = 1.5\cm

      \context	{
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
        %\override SpacingSpanner.uniform-stretching = ##t
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
