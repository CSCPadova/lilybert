\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

su = {\change Staff = "up" \stemDown \tieDown}

giu = {\change Staff = "down" \stemUp \tieUp}

tr = \trill

dolce = _\markup \italic \center-align"doux"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "tutti"

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

trio = ^\markup \italic "trio"

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
   \override TupletBracket #'bracket-visibility = ##f
   \terzine \senza
}


IflIn = \relative do'' {

   re,4. re8 re4. re8
   mi'2~mi4. \tuplet 3/2 { mi16 fad sol }
   la4. la8 la4. la8

   %4
   re,2. mi16 fad sol la
   si4. si8 si4. si8
   dod,4. dod8\mbreak re4. re8

   %7
   mi4. mi8 fad4. fad8
   mi2~mi4.\tuplet 3/2 {la16 sold la }
   dod,4. \tuplet 3/2 { la'16 sold la } si,4. \tuplet 3/2 { sold'16 fad sold }

   %10
   la,2~la4. \tuplet 3/2 { la'16 sol! fad }
   sol4. sol8 la4. mi8
   fad2~fad4. \tuplet 3/2 { si16 lad si }\mbreak

   %13
   re,4. \tuplet 3/2 { si'16 lad si } dod,4. \tuplet 3/2 { lad'16 sold lad }
   si,2~si4. \tuplet 3/2 { si'16 la! sold }
   la4. la8 si4. fad8

   %16
   sold2~\once\stemDown sold8 mi,16 fad sold la si dod
   re4. re8 re4. re8
   re2. mi16 fad sold la

   %19
   si4. si8\mbreak re,4. re8
   dod2~dod16 la si dod re mi fad sold
   la4. la8 sold4. fad8

   %22
   mi4. la8 sold4. la8
   si,2.\tr la4
   la2 r

   %25
   R1
   r4 r8 si'16(la sol4) r
   R1
   r4 r8 la16(sol fad4.) \tuplet 3/2 { fad16 mi re }
   mi4. \tuplet 3/2 { mi16 re dod }\mbreak re4. \tuplet 3/2 { re16 dod si }

   %30
   dod4. la8 sol'4. mi8
   fad2.\tr sol4
   mi1 mi4. mi8

   %33
   la,16(si) dod(re) mi(fad) sold8
   sold?(la) mi re
   dod16 (mi) la8 dod, si

   %36
   la16(si) dod(re) mi(fad) sol!(mi)
   fad(sol) la(si) la(sol) fad(mi)
   mi8(fad) r16 mi re dod

   %39
   la'(sol) fad(sol) la(fad) sol(mi)
   fad(mi) re(mi) fad(sol) la(fad)
   sol(la) si(la) sol(mi) fad(sol)

   %42
   mi(re) dod(re) mi(dod) re(si)
   dod(re) mi(fad) sold(la) si8\mbreak
   si(dod)~dod16 si la sold

   %45
   la8 mi~mi16 dod re si
   dod(sold) la(si) dod(re) mi(dod)
   fad(sol) la(si) dod,(re) mi8

   %48
   mi(fad)~fad16 mi fad mi
   la4~la16 fad sol mi
   fad(dod) re(mi) fad(sol) la(fad)

   %51
   sol(la) si(la) sol(fad) mi(re)\mbreak
   dod8 la'32(mi16.)~mi4
   re8 la'32(fad16.)~fad4

   %54
   mi8 la32(sol!16.)~sol4
   fad16. si32(la16.) sol32(fad16.) si32\p(la16.) sol32(
   fad16.) si32\f (la16.) sol32(fad16.) mi32 (re16.) dod32(

   %57
   re8.) mi16 mi4\tr
   re r
   R2*3

   %62
   r8 mi\trio mi8 fad32(mi re16)\mbreak
   mi8 fad32(mi re16) mi8 fad32(mi re16)
   mi8 mi la16 sol fad la

   %65
   sol fad sol fad mi sol fad mi
   fad4 r8 si16 la
   sold(la) si8 r la16 sol

   %68
   fad(sol) la8 r sold16 fad
   mi(fad) sold8 r fad16 mi
   re(mi) fad8 r mi16 re\mbreak

   %71
   dod mi la sold la sold la sold
   la dod la sold la sold la sold
   la mi la sold la sold la sold

   %74
   la8 la, r4
   r r8 mi'\f
   la,16(si) dod(re) mi(fad) sold8
   sold?[(la) mi re]
   re(dod) fad\p re\mbreak

   %79
   re(dod) fad\f re
   re dod16 re mi fad sol mi
   fad8 fad\solo si4~

   %82
   si lad
   si16 si,32 dod re16 re32 mi fad8 si
   r16 sol32 la si16 sol mi8 la

   %85
   r16 fad32 sol la16 fad re8 sol\mbreak
   r16 mi32 fad sol16 mi dod8 fad
   r16 re32 mi fad16 mi fad sold lad si

   %88
   lad si dod4 si8
   lad16 si dod4 si8
   lad16 si dod4 si8

   %91
   si lad r fad\tu
   si,16(dod) re(mi) fad(sold) lad8
   lad? (si) fad mi\mbreak

   %94
   re16(fad) si8 re, dod
   si16(lad) si(dod) re(dod) re(mi)
   dod8 fad16 (sold) la(si) sold8

   %97
   sold?(la)~la16 sold! fad mid
   fad dod la dod fad(mid) fad(mid)
   fad8 fad16 sold lad(si) sold(lad)\mbreak

   %100
   si(lad) si(dod,) re(mi) fad(mi)
   mi8(re16) dod re(dod) re(dod)
   fad(mi) re(mi) fad(re) mi(dod)

   %103
   re(mi) fad(mi) fad(mi) re(mi)
   dod8 fad mid16(fad) sold8
   sold?(la) r16 sold! fad mid

   %106
   fad8 dod fad mid\mbreak
   fad16 fad fad fad fad fad fad fad
   re(dod) si(dod) re(mi) fad(mi)

   %109
   mi8(re) r16 mi re dod
   fad16(mi) re(mi) fad(mi) fad(mi)
   sol(fad) sol(fad) sol(fad) sol(fad)

   %112
   mi(re) dod(re) mi(re) mi(re)
   fad(mi) fad(mi) fad(mi) fad(mi)\mbreak  %% fine pagina parte
   re(dod) si(dod) re(dod) re(dod)

   %115
   mi(re) mi(re) mi(re) mi(re)
   dod(si) dod(si) dod(si) dod(si)
   la(si) dod(re) mi(fad) sol (la)\mbreak %%%%% fine p 7 partitura  OK

   %118
   si,(dod) re(mi) fad(sol) la(si)
   dod,(re) mi(fad) sol(fad) sol(mi)\mbreak
   fad8 mi r4

   %121
   R2 %%%%% inizio p. 8 partitura
   r8 mi16\solo (fad32 sol) fad8 r
   R2

   %124
   r8 re16 (mi32 fad) mi8 r
   R2
   r8 dod16(re32 mi) re8 r

   %127
   R2\mbreak
   r8 si16(dod32 re) dod8 la\tu
   re,16(mi) fad(sol) la(si) dod8\mbreak

   %130
   dod(re) la fad\p
   re16(mi) fad(sol) la(si) dod8
   dod(re) la fad\f

   %133
   \once\stemUp re \once\stemDown fad' la16 (fad8.)
   sol,8 dod si'16(sol8.)
   la,8 re do'16(la8.)

   %136
   si16 si la la si si la la
   sol sol fad fad sol sol fad fad\mbreak
   mi mi re re mi mi re re

   %139
   dod dod si si dod dod si si
   la8. la'16(mi8.) dod16(
   la8.) la'16\p(mi8.) dod16(

   %142
   la8.)  la'16\f(mi8.) la16(
   sol8)[fad sol fad]
   fad mi r4

   %145
   R2*4
   fa16(sol la4)sol8
   fa[sol fa mi]

   %151
   fa16(sol la4) sol8
   fa[sol fa mi]
   fa[r r la]

   %154
   fa[r r la]
   fa4 r8 fa\mbreak
   fa?(mi) r la,\tu

   %157
   re,16(mi) fad(sol)  la(si) dod8

   %158
   dod(re) mi\p dod
   dod(re) mi\f dod
   dod(re) la'16 la dod, dod

   %161
   re re dod dod re re mi mi
   fad8 mi r mi\mbreak
   \appoggiatura sol8 fad4 \appoggiatura la8 sol sol

   %164
   sol fad \appoggiatura la sol\p sol
   sol fad \appoggiatura la sol\f sol
   sol fad16(mi) fad(mi) re(dod)

   %167
   re(dod) re(dod) re(dod) si(la)
   si'(la) si(la) si(la) sol(fad)
   sol(fad) sol(fad) sol(fad) mi(re)

   %170
   dod8 re16(mi) fad(sol) la(si)
   sol8[fad mi re]
   dod8 re16\p(mi) fad(sol) la(si)

   %173
   sol8[fad mi re]
   dod8[re\f mi fad]
   sol4 fad

   %176
   r8 re\p [mi fad]
   sol4 fad
   si16\f la sol si la sol fad la\mbreak

   %179
   sol fad mi sol fad mi re fad
   mi re dod mi re dod si re
   dod8 sol' r16 sol fad mi

   %182
   fad8 la la, dod
   re,4. re8 re4. re8
   mi'2~mi4. \tuplet 3/2 { mi16 fad sol }

   %185
   la4. la8 la4. la8
   re,2. mi16 fad sol la
   si4. si8 si4. si8

   %188
   dod,4. dod8\mbreak re4. re8
   mi4. mi8 fad4. fad8
   mi2~mi4.\tuplet 3/2 {la16 sol la }

   %191
   fad4. \tuplet 3/2 { la16 sol la } do,4. \tuplet 3/2 { la'16 sol la }\mbreak
   si,2. si4
   mi4. red8 mi4. fad8

   %194
   sol2~sol4. \tuplet 3/2 { si16 la si }
   sol4. \tuplet 3/2 { si16 la si } re,4. \tuplet 3/2 { si'16 la si }
   dod,!2 r\mbreak

   %197
   R1
   r2 r4 mi16 re dod si
   la4. sol'8 fad4. mi8

   %200
   fad4. re8 mi4. si8
   dod2.\tr re4
   re4. mi8 re1\fermata

}

IflIIn = \relative do'' {

   re,4. re8 re4. re8
   mi'2~mi4. \tuplet 3/2 { mi16 fad sol }
   la4. la8 la4. la8

   %4
   re,2. mi16 fad sol la
   si4. si8 si4. si8
   dod,4. dod8\mbreak re4. re8

   %7
   mi4. mi8 fad4. fad8
   mi2~mi4.\tuplet 3/2 {la16 sold la }
   dod,4. \tuplet 3/2 { la'16 sold la } si,4. \tuplet 3/2 { sold'16 fad sold }

   %10
   la,2~la4. \tuplet 3/2 { la'16 sol! fad }
   sol4. sol8 la4. mi8
   fad2~fad4. \tuplet 3/2 { si16 lad si }\mbreak

   %13
   re,4. \tuplet 3/2 { si'16 lad si } dod,4. \tuplet 3/2 { lad'16 sold lad }
   si,2~si4. \tuplet 3/2 { si'16 la! sold }
   la4. la8 si4. fad8

   %16
   sold2~\once\stemDown sold8 mi,16 fad sold la si dod
   re4. re8 re4. re8
   re2. mi16 fad sold la

   %19
   si4. si8\mbreak re,4. re8
   dod2~dod16 la si dod re mi fad sold
   la4. la8 sold4. fad8

   %22
   mi4. la8 sold4. la8
   si,2.\tr la4
   la2 r

   %25
   R1
   r4 r8 sol'16(fad mi4) r
   R1

   %28
   r4 r8 fad16(mi re4.) \tuplet 3/2 { fad16 mi re }
   mi4. \tuplet 3/2 { mi16 re dod }\mbreak re4. \tuplet 3/2 { re16 dod si }

   %30
   dod4. la8 sol'4. mi8
   fad2.\tr sol4
   mi1 mi4. mi8

   %33
   la,16(si) dod(re) mi(fad) sold8
   sold?(la) mi re
   dod16 (mi) la8 dod, si

   %36
   la16(si) dod(re) mi(fad) sol!(mi)
   fad(sol) la(si) la(sol) fad(mi)
   mi8(fad) r16 mi re dod

   %39
   la'(sol) fad(sol) la(fad) sol(mi)
   fad(mi) re(mi) fad(sol) la(fad)
   sol(la) si(la) sol(mi) fad(sol)

   %42
   mi(re) dod(re) mi(dod) re(si)
   dod(re) mi(fad) sold(la) si8\mbreak
   si(dod)~dod16 si la sold

   %45
   la8 mi~mi16 dod re si
   dod(sold) la(si) dod(re) mi(dod)
   fad(sol) la(si) dod,(re) mi8

   %48
   mi(fad)~fad16 mi fad mi
   la4~la16 fad sol mi
   fad(dod) re(mi) fad(sol) la(fad)

   %51
   sol(la) si(la) sol(fad) mi(re)\mbreak
   dod8 la'32(mi16.)~mi4
   re8 la'32(fad16.)~fad4

   %54
   mi8 la32(sol!16.)~sol4
   fad16. si32(la16.) sol32(fad16.) si32\p(la16.) sol32(
   fad16.) si32\f (la16.) sol32(fad16.) mi32 (re16.) dod32(

   %57
   re8.) mi16 mi4\tr
   re r
   R2*3

   %62
   r8 dod dod re32(dod si16)\mbreak
   dod8 re32(dod si16) dod8 re32(dod si16)
   dod8 dod re re16 fad

   %65
   mi re mi re dod mi re dod
   re4 r8 fad
   mi16(fad) mi8 r mi

   %68
   re16(mi) re8 r re
   dod16(re) dod8 r dod
   si16(la) si8  r si\mbreak

   %71
   la16 si dod si dod si dod si
   dod mi dod si dod si dod si
   dod mi dod si dod si dod si

   %74
   dod8 la r4
   r r8 mi'\f
   la,16(si) dod(re) mi(fad) sold8

   %77
   sold?[(la) mi re]
   re(dod) fad\p re\mbreak
   re(dod) fad\f re

   %80
   re dod16 re mi fad sol mi
   fad4 r
   R2*9

   %91
   r4 r 8 fad
   si,16(dod) re(mi) fad(sold) lad8
   lad? (si) fad mi\mbreak

   %94
   re16(fad) si8 re, dod
   si16(lad) si(dod) re(dod) re(mi)
   dod8 fad16 (sold) la(si) sold8

   %97
   sold?(la)~la16 sold! fad mid
   fad dod la dod fad(mid) fad(mid)
   fad8 fad16 sold lad(si) sold(lad)\mbreak

   %100
   si(lad) si(dod,) re(mi) fad(mi)
   mi8(re16) dod re(dod) re(dod)
   fad(mi) re(mi) fad(re) mi(dod)

   %103
   re(mi) fad(mi) fad(mi) re(mi)
   dod8 fad mid16(fad) sold8
   sold?(la) r16 sold! fad mid

   %106
   fad8 dod fad mid\mbreak
   fad16 fad fad fad fad fad fad fad
   re(dod) si(dod) re(mi) fad(mi)

   %109
   mi8(re) r16 mi re dod
   fad16(mi) re(mi) fad(mi) fad(mi)
   sol(fad) sol(fad) sol(fad) sol(fad)

   %112
   mi(re) dod(re) mi(re) mi(re)
   fad(mi) fad(mi) fad(mi) fad(mi)\mbreak  %% fine pagina parte
   re(dod) si(dod) re(dod) re(dod)

   %115
   mi(re) mi(re) mi(re) mi(re)
   dod(si) dod(si) dod(si) dod(si)
   la(si) dod(re) mi(fad) sol (la)\mbreak %%%%% fine p 7 partitura  OK

   %118
   si,(dod) re(mi) fad(sol) la(si)
   dod,(re) mi(fad) sol(fad) sol(mi)\mbreak
   fad8 mi r4

   %121
   R2 %%%%% inizio p. 8 partitura
   r8 dod16(re32 mi) re8 r
   R2

   %124
   r8 si16(dod32 re) dod8 r
   R2
   r8 la16(si32 dod) si8 r

   %127
   R2\mbreak
   r8 sold32(la si16) la8 la
   re,16(mi) fad(sol) la(si) dod8\mbreak

   %130
   dod(re) la fad\p
   re16(mi) fad(sol) la(si) dod8
   dod(re) la fad\f

   %133
   \once\stemUp re \once\stemDown fad' la16 (fad8.)
   sol,8 dod si'16(sol8.)
   la,8 re do'16(la8.)

   %136
   si16 si la la si si la la
   sol sol fad fad sol sol fad fad\mbreak
   mi mi re re mi mi re re

   %139
   dod dod si si dod dod si si
   la8. la'16(mi8.) dod16(
   la8.) la'16\p(mi8.) dod16(

   %142
   la8.)  la'16\f(mi8.) la16(
   sol8)[fad sol fad]
   fad mi r4

   %145
   R2*4
   re16(mi fa4) mi8
   re[mi re dod]

   %151
   re16(mi fa4) mi8
   re[mi re dod]
   re[r r fa]

   %154
   re[r r fa]
   re4 r8 re\mbreak
   fa?(mi) r la,

   %157
   re,16(mi) fad(sol)  la(si) dod8
   dod(re) mi\p dod
   dod(re) mi\f dod
   dod(re) la'16 la dod, dod

   %161
   re re dod dod re re mi mi
   fad8 mi r mi\mbreak
   \appoggiatura sol8 fad4 \appoggiatura la8 sol sol

   %164
   sol fad \appoggiatura la sol\p sol
   sol fad \appoggiatura la sol\f sol
   sol fad16(mi) fad(mi) re(dod)

   %167
   re(dod) re(dod) re(dod) si(la)
   si'(la) si(la) si(la) sol(fad)
   sol(fad) sol(fad) sol(fad) mi(re)

   %170
   dod8 re16(mi) fad(sol) la(si)
   sol8[fad mi re]
   dod8 re16\p(mi) fad(sol) la(si)

   %173
   sol8[fad mi re]
   dod8[re\f mi fad]
   sol4 fad

   %176
   r8 re\p [mi fad]
   sol4 fad
   si16\f la sol si la sol fad la\mbreak

   %179
   sol fad mi sol fad mi re fad
   mi re dod mi re dod si re
   dod8 sol' r16 sol fad mi

   %182
   fad8 la la, dod
   re,4. re8 re4. re8
   mi'2~mi4. \tuplet 3/2 { mi16 fad sol }

   %185
   la4. la8 la4. la8
   re,2. mi16 fad sol la
   si4. si8 si4. si8

   %188
   dod,4. dod8\mbreak re4. re8
   mi4. mi8 fad4. fad8
   mi2~mi4.\tuplet 3/2 {la16 sol la }

   %191
   fad4. \tuplet 3/2 { la16 sol la } do,4. \tuplet 3/2 { la'16 sol la }\mbreak
   si,2. si4
   mi4. red8 mi4. fad8

   %194
   sol2~sol4. \tuplet 3/2 { si16 la si }
   sol4. \tuplet 3/2 { si16 la si } re,4. \tuplet 3/2 { si'16 la si }
   dod,!2 r\mbreak

   %197
   R1
   r2 r4 mi16 re dod si
   la4. sol'8 fad4. mi8

   %200
   fad4. re8 mi4. si8
   dod2.\tr re4
   re4. mi8 re1\fermata

}

IobIn = \relative do'' {

   re,4. re8 re4. re8
   mi'2~mi4. \tuplet 3/2 { mi16 fad sol }
   la4. la8 la4. la8

   %4
   re,2. mi16 fad sol la
   si4. si8 si4. si8
   dod,4. dod8\mbreak re4. re8

   %7
   mi4. mi8 fad4. fad8
   mi2~mi4.\tuplet 3/2 {la16 sold la }
   dod,4. \tuplet 3/2 { la'16 sold la } si,4. \tuplet 3/2 { sold'16 fad sold }

   %10
   la,2~la4. \tuplet 3/2 { la'16 sol! fad }
   sol4. sol8 la4. mi8
   fad2~fad4. \tuplet 3/2 { si16 lad si }\mbreak

   %13
   re,4. \tuplet 3/2 { si'16 lad si } dod,4. \tuplet 3/2 { lad'16 sold lad }
   si,2~si4. \tuplet 3/2 { si'16 la! sold }
   la4. la8 si4. fad8

   %16
   sold2~\once\stemDown sold8 mi,16 fad sold la si dod
   re4. re8 re4. re8
   re2. mi16 fad sold la

   %19
   si4. si8\mbreak re,4. re8
   dod2~dod16 la si dod re mi fad sold
   la4. la8 sold4. fad8

   %22
   mi4. la8 sold4. la8
   si,2.\tr la4
   la2~la4. \tuplet 3/2 { la'16 sol! fad }

   %25
   sol4. fad8 sol4. fad8
   sol2~sol4. \tuplet 3/2 { sol16 fad mi }

   %27
   fad4. mi8 fad4. mi8
   fad2~fad4. \tuplet 3/2 { fad16 mi re }
   mi4. \tuplet 3/2 { mi16 re dod }\mbreak re4. \tuplet 3/2 { re16 dod si }

   %30
   dod4. la8 sol'4. mi8
   fad2.\tr sol4
   mi1 mi4. mi8

   %33
   la,16(si) dod(re) mi(fad) sold8
   sold?(la) mi re
   dod16 (mi) la8 dod, si

   %36
   la16(si) dod(re) mi(fad) sol!(mi)
   fad(sol) la(si) la(sol) fad(mi)
   mi8(fad) r16 mi re dod

   %39
   la'(sol) fad(sol) la(fad) sol(mi)
   fad(mi) re(mi) fad(sol) la(fad)
   sol(la) si(la) sol(mi) fad(sol)

   %42
   mi(re) dod(re) mi(dod) re(si)
   dod(re) mi(fad) sold(la) si8\mbreak
   si(dod)~dod16 si la sold

   %45
   la8 mi~mi16 dod re si
   dod(sold) la(si) dod(re) mi(dod)
   fad(sol) la(si) dod,(re) mi8

   %48
   mi(fad)~fad16 mi fad mi
   la4~la16 fad sol mi
   fad(dod) re(mi) fad(sol) la(fad)

   %51
   sol(la) si(la) sol(fad) mi(re)\mbreak
   dod8 la'32(mi16.)~mi4
   re8 la'32(fad16.)~fad4

   %54
   mi8 la32(sol!16.)~sol4
   fad16. si32(la16.) sol32(fad16.) si32\p(la16.) sol32(
   fad16.) si32\f (la16.) sol32(fad16.) mi32 (re16.) dod32(

   %57
   re8.) mi16 mi4\tr
   re8 la\solo la8 si32(la sol16)
   la8 si32(la sol16) la8 si32(la sol16)

   %60
   la8 la re re
   dod32(re dod16) re32(mi re16) mi32(fad mi16) fad32(sol fad16)
   fad8 (mi) r4\mbreak

   %63
   R2*3
   r8 fad16(mi) re(mi) fad8
   r mi16(re) dod(re) mi8

   %68
   r re16 (dod) si(dod) re8
   r dod16(si) la(si) dod8
   r si16 la sold(la) si8\mbreak

   %71
   la4 r8 mi'16 re
   dod4 r8 mi16 re
   dod4 r8 mi16 re

   %74
   dod re mi fad sol fad sol mi
   fad(re) mi8 r mi
   la,16(si) dod(re) mi(fad) sold8

   %77
   sold?[(la) mi re]
   re(dod) fad\p re\mbreak
   re(dod) fad\f re

   %80
   re dod16 re mi fad sol mi
   fad8 fad16\solo mi re dod re si
   dod si dod re dod mi re dod

   %83
   re(dod) si8 r16 fad'32 mi re16 dod
   si8 mi r16 mi32 re dod16 si
   la8 re r16 re32 dod si16 la\mbreak

   %86
   sol8 dod r16 dod32 si lad16 sold
   fad8 si re fad
   fad,2~

   %89
   fad~
   fad4. re'8
   re(dod) r fad

   %92
   si,16(dod) re(mi) fad(sold) lad8
   lad? (si) fad mi\mbreak

   %94
   re16(fad) si8 re, dod
   si16(lad) si(dod) re(dod) re(mi)
   dod8 fad16 (sold) la(si) sold8

   %97
   sold?(la)~la16 sold! fad mid
   fad dod la dod fad(mid) fad(mid)
   fad8 fad16 sold lad(si) sold(lad)\mbreak

   %100
   si(lad) si(dod,) re(mi) fad(mi)
   mi8(re16) dod re(dod) re(dod)
   fad(mi) re(mi) fad(re) mi(dod)

   %103
   re(mi) fad(mi) fad(mi) re(mi)
   dod8 fad mid16(fad) sold8
   sold?(la) r16 sold! fad mid

   %106
   fad8 dod fad mid\mbreak
   fad16 fad fad fad fad fad fad fad
   re(dod) si(dod) re(mi) fad(mi)

   %109
   mi8(re) r16 mi re dod
   fad16(mi) re(mi) fad(mi) fad(mi)
   sol(fad) sol(fad) sol(fad) sol(fad)

   %112
   mi(re) dod(re) mi(re) mi(re)
   fad(mi) fad(mi) fad(mi) fad(mi)\mbreak  %% fine pagina parte
   re(dod) si(dod) re(dod) re(dod)

   %115
   mi(re) mi(re) mi(re) mi(re)
   dod(si) dod(si) dod(si) dod(si)
   la(si) dod(re) mi(fad) sol (la)\mbreak %%%%% fine p 7 partitura  OK

   %118
   si,(dod) re(mi) fad(sol) la(si)
   dod,(re) mi(fad) sol(fad) sol(mi)\mbreak
   fad8 mi r8 fad16 \solo sol

   %121
   la8[sol fad mi]
   fad4 r8 mi16 fad
   sol8[fad mi re]

   %124
   mi4 r8 re16 mi
   fad8[mi re dod]
   re4 r8 dod16 re

   %127
   mi8[re dod si]\mbreak
   dod4 r8 la
   re,16(mi) fad(sol) la(si) dod8\mbreak

   %130
   dod(re) la fad\p
   re16(mi) fad(sol) la(si) dod8
   dod(re) la fad\f

   %133
   \once\stemUp re \once\stemDown fad' la16 (fad8.)
   sol,8 dod si'16(sol8.)
   la,8 re do'16(la8.)

   %136
   si16 si la la si si la la
   sol sol fad fad sol sol fad fad\mbreak
   mi mi re re mi mi re re

   %139
   dod dod si si dod dod si si
   la8. la'16(mi8.) dod16(
   la8.) la'16\p(mi8.) dod16(

   %142
   la8.)  la'16\f(mi8.) la16(
   sol8)[fad sol fad]
   fad mi r4

   %145
   re16\solo(mi fa4) mi8
   re[mi re dod]\mbreak
   re16(mi fa4) mi8

   %148
   re[mi re dod]
   re4 r
   R2*3

   %153
   r8 la'[ fa] r
   r8 la[ fa] r
   r la[sol fa]\mbreak

   %156
   fa?(mi) r la,
   re,16(mi) fad(sol)  la(si) dod8

   %158
   dod(re) mi\p dod
   dod(re) mi\f dod
   dod(re) la'16 la dod, dod

   %161
   re re dod dod re re mi mi
   fad8 mi r mi\mbreak
   \appoggiatura sol8 fad4 \appoggiatura la8 sol sol

   %164
   sol fad \appoggiatura la sol\p sol
   sol fad \appoggiatura la sol\f sol
   sol fad16(mi) fad(mi) re(dod)

   %167
   re(dod) re(dod) re(dod) si(la)
   si'(la) si(la) si(la) sol(fad)
   sol(fad) sol(fad) sol(fad) mi(re)

   %170
   dod8 re16(mi) fad(sol) la(si)
   sol8[fad mi re]
   dod8 re16\p(mi) fad(sol) la(si)

   %173
   sol8[fad mi re]
   dod8[re\f mi fad]
   sol4 fad

   %176
   r8 re\p [mi fad]
   sol4 fad
   si16\f la sol si la sol fad la\mbreak

   %179
   sol fad mi sol fad mi re fad
   mi re dod mi re dod si re
   dod8 sol' r16 sol fad mi

   %182
   fad8 la la, dod
   re,4. re8 re4. re8
   mi'2~mi4. \tuplet 3/2 { mi16 fad sol }

   %185
   la4. la8 la4. la8
   re,2. mi16 fad sol la
   si4. si8 si4. si8

   %188
   dod,4. dod8\mbreak re4. re8
   mi4. mi8 fad4. fad8
   mi2~mi4.\tuplet 3/2 {la16 sol la }

   %191
   fad4. \tuplet 3/2 { la16 sol la } do,4. \tuplet 3/2 { la'16 sol la }\mbreak
   si,2. si4
   mi4. red8 mi4. fad8

   %194
   sol2~sol4. \tuplet 3/2 { si16 la si }
   sol4. \tuplet 3/2 { si16 la si } re,4. \tuplet 3/2 { si'16 la si }
   dod,!2 r

   %197
   R1
   r2 r4  mi16 re dod si
   la4. sol'8 fad4. mi8

   %200
   fad4. re8 mi4. si8
   dod2.\tr re4
   re4. mi8 re1\fermata

}

IobIIn = \relative do'' {

   fad,4. fad8 fad4. fad8
   si2. si4
   la4. la8 dod4. dod8

   %4
   si2. do4
   re4. re8 si4. si8
   la4. la8 la4. la8\mbreak

   %7
   la4. mi'8 re4.re8
   dod2.la4
   la4. la8 sold4. si8

   %10
   la2. la4
   re4. re8 la4. la8
   la2. re4

   %13
   re4. re8 dod4. dod8\mbreak
   si2. si4
   la4. dod8 si4. si8

   %16
   si2~si8 mi,16 fad sold la si dod
   re4. re8 re4. re8
   re2. si4

   %19
   si4. si8 sold4. sold8
   la2. si4
   la4. la8 la4. la8\mbreak

   %22
   la4. la8 si4. dod8
   sold2. la4
   la2~la4. \tuplet 3/2 { fad'16 mi re }

   %25
   mi4. re8 mi4. re8
   mi2~mi4. \tuplet 3/2 { mi16 re dod }
   re4. dod8 re4. dod8

   %28
   re2~re4. re8
   si4. si8 si4. si8\mbreak

   %30
   la4. la8 mi'4. mi8
   re2.\tr mi4
   dod1 dod4 r

   %33
   R2*3
   r4 r8 la
   re,16(mi) fad(sol) la(si) dod8\mbreak

   %38
   dod8(re) la sol
   fad16(la) re8 fad, mi
   re16(mi) fad(sol) la(si) do(re)

   %41
   si(la) sol(la) si(dod!) re(mi)
   dod(si) la(si) dod(la) si(sold)
   la8 la16(dod) si8 mi

   %44
   mi mi4 si8
   la16(si) dod(si) la8 sold\mbreak
   la16(re,) mi8 r la

   %47
   la re16(si) la8 mi'
   mi(re)~re16 dod re dod
   re8[re re dod]

   %50
   re16(sol,) la(si) do(re) mi(la,)
   re8 re re la16 sold
   la8[dod dod dod]

   %53
   re[re re re]
   mi[mi mi mi]\mbreak
   re mi re mi\p

   %56
   re mi\f  re dod
   re re re dod
   la fad\solo fad sol32(fad mi16)

   %59
   fad8 sol32(fad mi16) fad8 sol32(fad mi16)
   fad8 mi re16 mi fad sol
   la32(si la16) si32(dod  si16) dod32(re dod16) re32(mi re16)

   %62
   re8(dod) r4\mbreak
   R2*3
   r8 la si16(dod) re8

   %67
   r si la16(si) dod8
   r la sold16(la) si8
   r sold fad16(sold) la8

   %70
   r fad mi16(fad) sold8\mbreak  %%fine p 5
   mi4 r8 dod'16 si
   la4 r8 dod16 si
   la4 r8 dod16 si

   %74
   la si dod re mi re mi dod
   re(si) dod8 r4
   r r8 si

   %77
   dod16(re) mi(re) dod8 si\mbreak
   si(la) r si\p
   si(la) r si\f

   %80
   si la16 si dod re mi dod
   re4 r
   R2*13

   %95  OKOKOKOK
   r4 r8 si
   fad16(sold) la(si) dod(red) mid8

   %97
   mid?(fad) dod si
   la16(dod) fad8 la, sold
   fad16(sold?) lad(si) dod(re) si(dod)

   %100
   re(dod) si(lad) si8 dod
   dod si16(lad) si(lad) si(lad)\mbreak
   si8 si si lad

   %103
   si16(dod) re(dod) re(dod) si(dod)
   la!8 dod dod dod
   dod4. dod8

   %106
   dod16(si) la(si) dod(la) si(sold)
   dod(sold) fad(sold) lad(si) dod(re)
   si8[si si dod]
   dod(si) r lad\mbreak

   %110
   si[si si si]
   re[re re re]
   dod[sol dod dod]

   %113
   dod[dod dod dod]
   si[fad si si]
   si[si si si]

   %116
   la[la la mi]
   la[la la la]\mbreak
   si[si si si]

   %119
   dod dod16 (re) mi(re) mi(dod)
   re8 dod r re16\solo mi
   fad8[mi re dod]

   %122
   re4 r8 dod16 re
   mi8[re dod si]
   dod4 r8 si16 dod

   %	125
   re8[dod si la]
   si4 r8 la16 si
   dod8[si la sold]\mbreak

   %128
   la4 r8 la
   re,16(mi) fad(sol) la(si) dod8\mbreak

   %130
   dod(re) la fad\p
   re16(mi) fad(sol) la(si) dod8
   dod(re) la fad\f

   %133
   \once\stemUp re \once\stemDown fad' la16 (fad8.)
   sol,8 dod si'16(sol8.)
   la,8 re do'16(la8.)

   %136
   si16 si la la si si la la
   sol sol fad fad sol sol fad fad\mbreak
   mi mi re re mi mi re re

   %139
   dod dod si si dod dod si si
   la8. la'16(mi8.) dod16(
   la8.) la'16\p(mi8.) dod16(

   %142
   la8.)  la'16\f(mi8.) la16(
   sol8)[fad sol fad]
   la,8 la r4

   %145
   fa16\solo(sol la4) sol8
   fa[sol fa mi]\mbreak
   fa16(sol la4) sol8

   %148
   fa[sol fa mi]
   re4 r
   R2*3

   %153
   r8 fa'[re] r8  %%% inizio p 9
   r fa[re] r
   r fa[mi re]\mbreak

   %156
   re[dod] r la\f
   re,16(mi) fad(sol)  la(si) dod8
   dod(re) mi\p dod

   %159
   dod(re) mi\f dod
   dod(re) la16 la la la
   fad fad dod' dod si si la la
   la8 la r dod

   %163
   \appoggiatura mi re4 dod16(re) mi8\mbreak
   mi(re) dod16\p(re) mi8
   mi(re) dod16\f(re) mi8

   %166
   mi re r fad,
   fad4 r8 fad
   si4 r8 si

   %169
   si4 r8 la16 sold
   la8 la la la16 fad
   re'8[dod si la]\mbreak

   %172
   sol la\p la la16 fad
   re'8[dod si la]
   la[la\f sol la]

   %175
   la4 la
   r8 la\p [dod re]
   mi4 re

   %178
   si8\f re re re
   re dod dod si
   si la la sol

   %181
   sol dod r16 dod re mi
   re8[la la la]\mbreak
   re,4. re8 re4. re8

   %184
   si'2. si4
   la4. la8 dod4. dod8
   si2. do4

   %187
   re4. re8 si4. si8
   la4. la8 la4. la8
   la4. mi'8 re4. re8

   %190
   mi2~mi4.\tuplet 3/2 {la16 sol la }
   fad4. \tuplet 3/2 { la16 sol la } do,4. \tuplet 3/2 { la'16 sol la }\mbreak
   si,2. si4
   mi4. red8 mi4. fad8

   %194
   sol2~sol4. \tuplet 3/2 { si16 la si }
   sol4. \tuplet 3/2 { si16 la si } re,4. \tuplet 3/2 { si'16 la si }
   dod,!2 r

   %197
   R1
   r2 r4  mi16 re dod si
   la4. sol'8 fad4. mi8

   %200
   fad4. re8 mi4. si8
   dod2.\tr re4
   re4. mi8 re1\fermata

   }


IvlIn = \relative do'' {

   re,4. re8 re4. re8
   mi'2~mi4. \tuplet 3/2 { mi16 fad sol }
   la4. la8 la4. la8

   %4
   re,2. mi16 fad sol la
   si4. si8 si4. si8
   dod,4. dod8\mbreak re4. re8

   %7
   mi4. mi8 fad4. fad8
   mi2~mi4.\tuplet 3/2 {la16 sold la }
   dod,4. \tuplet 3/2 { la'16 sold la } si,4. \tuplet 3/2 { sold'16 fad sold }

   %10
   la,2~la4. \tuplet 3/2 { la'16 sol! fad }
   sol4. sol8 la4. mi8
   fad2~fad4. \tuplet 3/2 { si16 lad si }\mbreak

   %13
   re,4. \tuplet 3/2 { si'16 lad si } dod,4. \tuplet 3/2 { lad'16 sold lad }
   si,2~si4. \tuplet 3/2 { si'16 la! sold }
   la4. la8 si4. fad8

   %16
   sold2~\once\stemDown sold8 mi,16 fad sold la si dod
   re4. re8 re4. re8
   re2. mi16 fad sold la

   %19
   si4. si8\mbreak re,4. re8
   dod2~dod16 la si dod re mi fad sold
   la4. la8 sold4. fad8

   %22
   mi4. la8 sold4. la8
   si,2.\tr la4
   la2 r

   %25
   R1*3
   r2 r4 r8 \tuplet 3/2 { fad'16 mi re }
   mi4. \tuplet 3/2 { mi16 re dod }\mbreak re4. \tuplet 3/2 { re16 dod si }

   %30
   dod4. la8 sol'4. mi8
   fad2.\tr sol4
   mi1 mi4. mi8

   %33
   la,16(si) dod(re) mi(fad) sold8
   sold?(la) mi re
   dod16 (mi) la8 dod, si

   %36
   la16(si) dod(re) mi(fad) sol!(mi)\mbreak
   fad(sol) la(si) la(sol) fad(mi)
   mi8(fad) r16 mi re dod

   %39
   la'(sol) fad(sol) la(fad) sol(mi)
   fad(mi) re(mi) fad(sol) la(fad)
   sol(la) si(la) sol(mi) fad(sol)

   %42
   mi(re) dod(re) mi(dod) re(si)
   dod(re) mi(fad) sold(la) si8\mbreak
   si(dod)~dod16 si la sold

   %45
   la8 mi~mi16 dod re si
   dod(sold) la(si) dod(re) mi(dod)
   fad(sol) la(si) dod,(re) mi8

   %48
   mi(fad)~fad16 mi fad mi
   la4~la16 fad sol mi
   fad(dod) re(mi) fad(sol) la(fad)

   %51
   sol(la) si(la) sol(fad) mi(re)\mbreak
   dod8 la'32(mi16.)~mi4
   re8 la'32(fad16.)~fad4

   %54
   mi8 la32(sol!16.)~sol4
   fad16. si32(la16.) sol32(fad16.) si32\p(la16.) sol32(
   fad16.) si32\f (la16.) sol32(fad16.) mi32 (re16.) dod32(

   %57
   re8.) mi16 mi4\tr
   re8 [re,\p re re]
   re[re re re]

   %60
   re[(dod) si si]\mbreak
   la la la' re,
   la'[la la la]

   %63
   la[la la la]
   la sol fad si
   mi, mi la la

   %66
   re,4 r
   R2*8
   r4 r8 mi'\f

   %76
   la,16(si) dod(re) mi(fad) sold8
   sold?[(la) mi re]
   re(dod) fad\p re\mbreak

   %79
   re(dod) fad\f re
   re dod16 re mi fad sol mi
   fad4 r

   %82
   R2
   r16 fad32\solo mi re16 fad si, si' fad si
   sol si32 la sol16 si la, la' mi la

   %85
   fad la32 sol fad16 la sol, sol' re sol
   mi sol32 fad mi16 sol fad, fad' dod fad\mbreak
   re fad si, dod re mi dod re

   %88
   dod fad, mi' fad, mi' fad, re' fad,
   dod' fad, mi' fad, mi' fad, re' fad,
   dod' fad, mi' fad, mi' fad, re' fad,

   %91
   re'8(dod) r fad\tu
   si,16(dod) re(mi) fad(sold) lad8
   lad? (si) fad mi\mbreak

   %94
   re16(fad) si8 re, dod
   si16(lad) si(dod) re(dod) re(mi)
   dod8 fad16 (sold) la(si) sold8

   %97
   sold?(la)~la16 sold! fad mid
   fad dod la dod fad(mid) fad(mid)
   fad8 fad16 sold lad(si) sold(lad)\mbreak

   %100
   si(lad) si(dod,) re(mi) fad(mi)
   mi8(re16) dod re(dod) re(dod)
   fad(mi) re(mi) fad(re) mi(dod)

   %103
   re(mi) fad(mi) fad(mi) re(mi)
   dod8 fad mid16(fad) sold8
   sold?(la) r16 sold! fad mid

   %106
   fad8 dod fad mid\mbreak
   fad16 fad fad fad fad fad fad fad
   re(dod) si(dod) re(mi) fad(mi)

   %109
   mi8(re) r16 mi re dod
   fad16(mi) re(mi) fad(mi) fad(mi)
   sol(fad) sol(fad) sol(fad) sol(fad)

   %112
   mi(re) dod(re) mi(re) mi(re)
   fad(mi) fad(mi) fad(mi) fad(mi)\mbreak  %% fine pagina parte
   re(dod) si(dod) re(dod) re(dod)

   %115
   mi(re) mi(re) mi(re) mi(re)
   dod(si) dod(si) dod(si) dod(si)
   la(si) dod(re) mi(fad) sol (la)\mbreak %%%%% fine p 7 partitura  OK

   %118
   si,(dod) re(mi) fad(sol) la(si)
   dod,(re) mi(fad) sol(fad) sol(mi)\mbreak
   fad8 mi la,\p la

   %121
   la [la la la]
   la [la la la]
   la [la la la]

   %124
   la [la la la]
   la [la la la]
   la [la la la]

   %127
   la [la la la]
   la4 r8 la\f
   re,16(mi) fad(sol) la(si) dod8\mbreak

   %130
   dod(re) la fad\p
   re16(mi) fad(sol) la(si) dod8
   dod(re) la fad\f

   %133
   \once\stemUp re \once\stemDown fad' la16 (fad8.)
   sol,8 dod si'16(sol8.)
   la,8 re do'16(la8.)

   %136
   si16 si la la si si la la
   sol sol fad fad sol sol fad fad\mbreak
   mi mi re re mi mi re re

   %139
   dod dod si si dod dod si si
   la8. la'16(mi8.) dod16(
   la8.) la'16\p(mi8.) dod16(

   %142
   la8.)  la'16\f(mi8.) la16(
   sol8)[fad sol fad]
   fad mi r4

   %145
   la,,8\p[la la la] \mbreak
   la [la la la]
   la [la la la]

   %148
   la [la la la]
   la [la la la]
   la [la la la]

   %151
   la [la la la]
   la [la la la]
   re r do r

   %154
   sib r la r\mbreak
   sol4 r8 sol
   la la r8 la'\f
   re,16(mi) fad(sol)  la(si) dod8

   %158
   dod(re) mi\p dod
   dod(re) mi\f dod
   dod(re) la'16 la dod, dod

   %161
   re re dod dod re re mi mi
   fad8 mi r mi\mbreak
   \appoggiatura sol8 fad4 \appoggiatura la8 sol sol

   %164
   sol fad \appoggiatura la sol\p sol
   sol fad \appoggiatura la sol\f sol
   sol fad16(mi) fad(mi) re(dod)

   %167
   re(dod) re(dod) re(dod) si(la)
   si'(la) si(la) si(la) sol(fad)
   sol(fad) sol(fad) sol(fad) mi(re)

   %170
   dod8 re16(mi) fad(sol) la(si)
   sol8[fad mi re]
   dod8 re16\p(mi) fad(sol) la(si)

   %173
   sol8[fad mi re]
   dod8[re\f mi fad]
   sol4 fad

   %176
   r8 re\p [mi fad]
   sol4 fad
   si16\f la sol si la sol fad la\mbreak

   %179
   sol fad mi sol fad mi re fad
   mi re dod mi re dod si re
   dod8 sol' r16 sol fad mi

   %182
   fad8 la la, dod
   re,4. re8 re4. re8
   mi'2~mi4. \tuplet 3/2 { mi16 fad sol }

   %185
   la4. la8 la4. la8
   re,2. mi16 fad sol la
   si4. si8 si4. si8

   %188
   dod,4. dod8\mbreak re4. re8
   mi4. mi8 fad4. fad8
   mi2~mi4.\tuplet 3/2 {la16 sol la }

   %191
   fad4. \tuplet 3/2 { la16 sol la } do,4. \tuplet 3/2 { la'16 sol la }\mbreak
   si,2. si4
   mi4. red8 mi4. fad8

   %194
   sol2~sol4. \tuplet 3/2 { si16 la si }
   sol4. \tuplet 3/2 { si16 la si } re,4. \tuplet 3/2 { si'16 la si }
   dod,!2~dod8 \stemUp la,16 si dod re mi fad\stemNeutral

   %197
   sol4. sol8 sol4. sol8\mbreak
   sol2. mi'16 re dod si
   la4. sol'8 fad4. mi8

   %200
   fad4. re8 mi4. si8
   dod2.\tr re4
   re4. mi8 re1\fermata

}

IvlIIn = \relative do'' {

   re,4. re8 re4. re8
   mi'2~mi4. \tuplet 3/2 { mi16 fad sol }
   la4. la8 la4. la8

   %4
   re,2. mi16 fad sol la
   si4. si8 si4. si8
   dod,4. dod8\mbreak re4. re8

   %7
   mi4. mi8 fad4. fad8
   mi2~mi4.\tuplet 3/2 {la16 sold la }
   dod,4. \tuplet 3/2 { la'16 sold la } si,4. \tuplet 3/2 { sold'16 fad sold }

   %10
   la,2~la4. \tuplet 3/2 { la'16 sol! fad }
   sol4. sol8 la4. mi8
   fad2~fad4. \tuplet 3/2 { si16 lad si }\mbreak

   %13
   re,4. \tuplet 3/2 { si'16 lad si } dod,4. \tuplet 3/2 { lad'16 sold lad }
   si,2~si4. \tuplet 3/2 { si'16 la! sold }
   la4. la8 si4. fad8

   %16
   sold2~\once\stemDown sold8 mi,16 fad sold la si dod
   re4. re8 re4. re8
   re2. mi16 fad sold la

   %19
   si4. si8\mbreak re,4. re8
   dod2~dod16 la si dod re mi fad sold
   la4. la8 sold4. fad8

   %22
   mi4. la8 sold4. la8
   si,2.\tr la4
   la2 r

   %25
   R1*3
   r2 r4 r8 \tuplet 3/2 { fad'16 mi re }
   mi4. \tuplet 3/2 { mi16 re dod }\mbreak re4. \tuplet 3/2 { re16 dod si }

   %30
   dod4. la8 sol'4. mi8
   fad2.\tr sol4
   mi1 mi4. mi8

   %33
   la,16(si) dod(re) mi(fad) sold8
   sold?(la) mi re
   dod16 (mi) la8 dod, si

   %36
   la16(si) dod(re) mi(fad) sol!(mi)\mbreak
   fad(sol) la(si) la(sol) fad(mi)
   mi8(fad) r16 mi re dod

   %39
   la'(sol) fad(sol) la(fad) sol(mi)
   fad(mi) re(mi) fad(sol) la(fad)
   sol(la) si(la) sol(mi) fad(sol)

   %42
   mi(re) dod(re) mi(dod) re(si)
   dod(re) mi(fad) sold(la) si8\mbreak
   si(dod)~dod16 si la sold

   %45
   la8 mi~mi16 dod re si
   dod(sold) la(si) dod(re) mi(dod)
   fad(sol) la(si) dod,(re) mi8

   %48
   mi(fad)~fad16 mi fad mi
   la4~la16 fad sol mi
   fad(dod) re(mi) fad(sol) la(fad)

   %51
   sol(la) si(la) sol(fad) mi(re)\mbreak
   dod8 la'32(mi16.)~mi4
   re8 la'32(fad16.)~fad4

   %54
   mi8 la32(sol!16.)~sol4
   fad16. si32(la16.) sol32(fad16.) si32\p(la16.) sol32(
   fad16.) si32\f (la16.) sol32(fad16.) mi32 (re16.) dod32(

   %57
   re8.) mi16 mi4\tr
   re8 [re,\p re re]
   re[re re re]

   %60
   re[(dod) si si]\mbreak
   la la la' re,
   la'[la la la]

   %63
   la[la la la]
   la sol fad si
   mi, mi la la

   %66
   re,4 r
   R2*8
   r4 r8 mi'\f

   %76
   la,16(si) dod(re) mi(fad) sold8
   sold?[(la) mi re]
   re(dod) fad\p re\mbreak

   %79
   re(dod) fad\f re
   re dod16 re mi fad sol mi
   fad4 r

   %82
   R2*13
   r4 r8 si,
   fad16(sold) la(si) dod(red) mid8

   %97
   mid?(fad) dod si
   la16(dod) fad8 la, sold
   fad16(sold?) lad(si) dod(re) si(dod)

   %100
   re(dod) si(lad) si8 dod
   dod si16(lad) si(lad) si(lad)\mbreak
   si8 si si lad

   %103
   si16(dod) re(dod) re(dod) si(dod)
   la!8 dod dod dod
   dod4. dod8

   %106
   dod16(si) la(si) dod(la) si(sold)
   la fad' fad fad fad fad fad fad
   re(dod) si(dod) re(mi) fad(mi)

   %109
   mi8(re) r16 mi re dod
   fad16(mi) re(mi) fad(mi) fad(mi)
   sol(fad) sol(fad) sol(fad) sol(fad)

   %112
   mi(re) dod(re) mi(re) mi(re)
   fad(mi) fad(mi) fad(mi) fad(mi)\mbreak  %% fine pagina parte
   re(dod) si(dod) re(dod) re(dod)

   %115
   mi(re) mi(re) mi(re) mi(re)
   dod(si) dod(si) dod(si) dod(si)
   la(si) dod(re) mi(fad) sol (la)\mbreak %%%%% fine p 7 partitura  OK

   %118
   si,(dod) re(mi) fad(sol) la(si)
   dod,(re) mi(fad) sol(fad) sol(mi)\mbreak
   fad8 mi la,\p la

   %121
   la [la la la]
   la [la la la]
   la [la la la]

   %124
   la [la la la]
   la [la la la]
   la [la la la]

   %127
   la [la la la]
   la4 r8 la\f
   re,16(mi) fad(sol) la(si) dod8\mbreak

   %130
   dod(re) la fad\p
   re16(mi) fad(sol) la(si) dod8
   dod(re) la fad\f

   %133
   \once\stemUp re \once\stemDown fad' la16 (fad8.)
   sol,8 dod si'16(sol8.)
   la,8 re do'16(la8.)

   %136
   si16 si la la si si la la
   sol sol fad fad sol sol fad fad\mbreak
   mi mi re re mi mi re re

   %139
   dod dod si si dod dod si si
   la8. la'16(mi8.) dod16(
   la8.) la'16\p(mi8.) dod16(

   %142
   la8.)  la'16\f(mi8.) la16(
   sol8)[fad sol fad]
   fad mi r4

   %145
   la,,8\p[la la la] \mbreak
   la [la la la]
   la [la la la]

   %148
   la [la la la]
   la [la la la]
   la [la la la]

   %151
   la [la la la]
   la [la la la]
   re r do r

   %154
   sib r la r\mbreak
   sol4 r8 sol
   la la r8 la'\f

   %157
   re,16(mi) fad(sol)  la(si) dod8

   %158
   dod(re) mi\p dod
   dod(re) mi\f dod
   dod(re) la'16 la dod, dod

   %161
   re re dod dod re re mi mi
   fad8 mi r mi\mbreak
   \appoggiatura sol8 fad4 \appoggiatura la8 sol sol

   %164
   sol fad \appoggiatura la sol\p sol
   sol fad \appoggiatura la sol\f sol
   sol fad16(mi) fad(mi) re(dod)

   %167
   re(dod) re(dod) re(dod) si(la)
   si'(la) si(la) si(la) sol(fad)
   sol(fad) sol(fad) sol(fad) mi(re)

   %170
   dod8 re16(mi) fad(sol) la(si)
   sol8[fad mi re]
   dod8 re16\p(mi) fad(sol) la(si)

   %173
   sol8[fad mi re]
   dod8[re\f mi fad]
   sol4 fad

   %176
   r8 la,\p[dod re]
   mi4 re
   si'16\f la sol si la sol fad la\mbreak

   %179
   sol fad mi sol fad mi re fad
   mi re dod mi re dod si re
   dod8 sol' r16 sol fad mi

   %182
   fad8 la la, dod
   re,4. re8 re4. re8
   mi'2~mi4. \tuplet 3/2 { mi16 fad sol }

   %185
   la4. la8 la4. la8
   re,2. mi16 fad sol la
   si4. si8 si4. si8

   %188
   dod,4. dod8\mbreak re4. re8
   mi4. mi8 fad4. fad8
   mi2~mi4.\tuplet 3/2 {la16 sol la }

   %191
   fad4. \tuplet 3/2 { la16 sol la } do,4. \tuplet 3/2 { la'16 sol la }\mbreak
   si,2. si4
   mi4. red8 mi4. fad8

   %194
   sol2~sol4. \tuplet 3/2 { si16 la si }
   sol4. \tuplet 3/2 { si16 la si } re,4. \tuplet 3/2 { si'16 la si }
   dod,!2~dod8 \stemUp la,16 si dod re mi fad\stemNeutral

   %197
   sol4. sol8 sol4. sol8\mbreak
   sol2. mi'16 re dod si
   la4. sol'8 fad4. mi8

   %200
   fad4. re8 mi4. si8
   dod2.\tr re4
   re4. mi8 re1\fermata

}

IvlaIn = \relative do'' {

   fad,4. fad8 fad4. fad8
   si2. si4
   la4. la8 dod4. dod8

   %4
   si2. do4
   re4. re8 si4. si8
   la4. la8 la4. la8\mbreak

   %7
   la4. mi'8 re4.re8
   dod2.la4
   la4. la8 sold4. si8

   %10
   la2. la4
   re4. re8 la4. la8
   la2. re4

   %13
   re4. re8 dod4. dod8\mbreak
   si2. si4
   la4. dod8 si4. si8

   %16
   si2~si8 mi,16 fad sold la si dod
   re4. re8 re4. re8
   re2. si4

   %19
   si4. si8 sold4. sold8
   la2. si4
   la4. la8 la4. la8\mbreak

   %22
   la4. la8 si4. dod8
   sold2 mi
   mi r

   %25
   R1*3
   r2 r4 r8 re'
   si4. si8 si4. si8\mbreak

   %30
   la4. la8 mi'4. mi8
   re2.\tr mi4
   dod1 dod4 r

   %33
   R2*3
   r4 r8 la
   re,16(mi) fad(sol) la(si) dod8\mbreak

   %38
   dod8(re) la sol
   fad16(la) re8 fad, mi
   re16(mi) fad(sol) la(si) do(re)

   %41
   si(la) sol(la) si(dod!) re(mi)
   dod(si) la(si) dod(la) si(sold)
   la8 la16(dod) si8 mi

   %44
   mi mi4 si8
   la16(si) dod(si) la8 sold\mbreak
   la16(re,) mi8 r la

   %47
   la re16(si) la8 mi'
   mi(re)~re16 dod re dod
   re8[re re dod]

   %50
   re16(sol,) la(si) do(re) mi(la,)
   re8 re re la16 sold
   la8[dod dod dod]

   %53
   re[re re re]
   mi[mi mi mi]\mbreak
   re mi re mi\p

   %56
   re mi\f  re dod
   re re re dod
   la[re,\p re re]

   %59
   re[re re re]
   re[dod si si]
   la la la' re,

   %62
   la' [la la la]\mbreak
   la[la la la]
   la sol fad si

   %65
   mi, mi la la
   re,4 r
   R2*9

   %76
   r4 r8 si'
   dod16(re) mi(re) dod8 si\mbreak
   si(la) r si\p

   %79
   si(la) r si\f
   si la16 si dod re mi dod
   re4 r

   %82
   R2*17
   r4 r8 fad,
   si,16(dod) re(mi) fad(sold) lad8

   %101
   lad?(si) fad mi\mbreak
   re16(fad) si8 re, dod
   si si' r fad

   %104
   fad fad sold sold
   sold?(fad) r16 mid fad sold!
   fad8[fad fad sold]

   %107
   la16(sold) fad(sold) lad(si) dod!(re)
   si8[si si dod]
   dod(si) r lad\mbreak

   %110
   si[si si si]
   re[re re re]
   dod[sol dod dod]

   %113
   dod[dod dod dod]
   si[fad si si]
   si[si si si]

   %116
   la[la la mi]
   la[la la la]\mbreak
   si[si si si]

   %119
   dod dod16 (re) mi(re) mi(dod)
   re8 dod la\p la
   la [la la la]

   %122
   la [la la la]
   la [la la la]

   %124
   la [la la la]
   la [la la la]
   la [la la la]

   %127
   la [la la la]
   la4 r8 la\f
   re,16(mi) fad(sol) la(si) dod8

   %130
   dod(re) la fad\p
   re16(mi) fad(sol) la(si) dod8
   dod(re) la fad\f

   %133
   re[la' la la]
   dod[dod dod dod]
   re[re re re]

   %136
   re16 re re re re re do do\mbreak
   re re do do re re do do
   si si la la si si la la

   %139
   sol sol fad fad sol sol fad fad
   mi8[la la la]
   la[la\p la la]

   %142
   la[la\f la la]
   la[la la la]
   la la r4

   %145
   la,8\p [la la la] \mbreak
   la [la la la]
   la [la la la]

   %148
   la [la la la]
   la [la la la]
   la [la la la]

   %151
   la [la la la]
   la [la la la]
   re r do r

   %154
   sib r la r\mbreak
   sol4 r8 sol
   la la r8 mi'\f

   %157
   la,8 re16(mi) fad8 sol
   sol(la) si sol\p
   sol(la) si\f sol

   %160
   sol(la) la16 la la la
   fad fad dod' dod si si la la
   la8 la r dod

   %163
   \appoggiatura mi re4 dod16(re) mi8\mbreak
   mi(re) dod16\p(re) mi8
   mi(re) dod16\f(re) mi8

   %166
   mi re r fad,
   fad4 r8 fad
   si4 r8 si

   %169
   si4 r8 la16 sold
   la8 la la la16 fad
   re'8[dod si la]\mbreak

   %172
   sol la\p la la16 fad
   re'8[dod si la]
   la[la\f sol la]

   %175
   la4 la
   r8 la\p [sol la]
   la4 la

   %178
   si8\f re re re
   re dod dod si
   si la la sol

   %181
   sol dod r16 dod re mi
   re8[la la la]\mbreak
   fad4. la,8 la4. la8

   %184
   si'2. si4
   la4. la8 dod4. dod8
   si2. do4

   %187
   re4. re8 si4. si8
   la4. la8 la4. la8
   la4. mi'8 re4. re8

   %190
   dod2. mi4\mbreak
   re4. la8 la4. la8
   sol2. fad4

   %193
   si4. si8 si4. red8
   mi2. si4
   si4. si8 si4. si8

   %196
   la2~la8 la,16 si dod re  mi fad\mbreak
   sol4. sol8 sol4. sol8
   sol2. la4

   %199
   la4. la8 la4. la8
   la4. fad8 sol4. fad8
   mi2.\tr fad4

   %202
   fad r fad1\fermata

}

IvlaIIn = \relative do' {

   la4. la8 la4. la8
   sol'2. sol4
   mi4. mi8 fad4. fad8

   %4
   fad2. fad4
   sol4. sol8 mi4. mi8
   mi4. mi8  re4. re8\mbreak

   %7
   la'4. la8 la4. la8
   la2. mi4
   mi4. dod8 mi4. mi8

   %10
   mi2~mi4. \tuplet 3/2 { mi16 re dod }
   re4. re8 mi4. mi8
   re2. fad4

   %13
   fad4.  fad8 fad4. fad8\mbreak
   fad2~fad4. \tuplet 3/2 { fad16 mi re }
   mi4. mi8 fad4. fad8

   %16
   mi2~mi8 mi16 fad sold la si dod
   re4. re8 re4. re8
   re2.  fad,4

   %19
   mi4. mi8 mi4. mi8
   mi2. mi4
   dod4. dod8 dod4. re8\mbreak

   %22
   mi4. mi8 re4. mi8
   mi2 mi
   dod r

   %25
   R1*3
   r2 r4 r8 \tuplet 3/2 { la'16 sol fad }
   mi4. mi8 mi4. mi8\mbreak

   %30
   mi4. dod8 la'4. la8
   la2. la4
   la1 la4 r

   %33
   R2*9
   r4 r8 mi  %%%%%%%% fin qui OK
   la,16(si) dod(re) mi(fad) sold8

   %44
   sold?(la) mi re
   dod16(mi) la8 dod, si\mbreak
   la16(si) dod(re) mi(fad) sol!(mi)

   %47
   fad(mi) re(sol) mi(re) la'8
   la4 la8 la
   la fad16 sol la8 dod

   %50
   la16(sol) fad(si) la(sol) mi(fad)
   re8 sol16(la) si8 mi,16(sold)
   mi8[la la la]

   %53
   fad[re re re]
   la'[la la la]\mbreak
   la[la la la\p]

   %56
   la[la\f la la]
   fad[si la la]
   fad[re\p re re]

   %59
   re[re re re]
   re dod si si
   la la la' re,

   %62
   la'[la la la]\mbreak
   la[la la la]
   la[sol fad si]

   %65
   mi, mi la la
   re,4 r
   R2*9

   %76
   r4 r8 mi
   mi la4 mi8\mbreak
   mi mi r mi\p

   %79
   mi mi r mi\f
   mi mi la la
   la4 r

   %82
   R2*9
   r8 lad16(si) lad(sold) fad(mi)
   fad8 fad si fad

   %93
   fad fad16 mi fad8 fad\mbreak
   fad re16(mi) fad8 lad
   fad[fad fad fad]

   %96
   fad[dod dod dod]
   dod4 r8 dod
   dod4 r8 dod

   %99
   la4 r
   R2*3
   r4 r8 si

   %104 OK
   fad16(sol) la(si) dod(re) mid8
   mid?(fad) dod si
   la16(dod) fad8 la, sold

   %107
   fad16(sold) lad(si) dod(re) mi(fad)
   fad8[fad fad fad]
   fad fad r fad\mbreak  %% metà p. 7

   %110
   fad fad fad fad
   re re sol sol
   sol mi16 fad sol8 sol

   %113
   dod, dod fad fad
   fad re16 mi fad8 fad
   si, si mi mi

   %116
   mi[mi mi dod]
   re[re re re]\mbreak
   re[mi mi mi]

   %119
   mi[la la la]
   la la la\p la
   la [la la la]

   %122
   la [la la la]
   la [la la la]

   %124
   la [la la la]
   la [la la la]
   la [la la la]

   %127
   la [la la la]
   la4 r8 la\f
   re,16(mi) fad(sol) la(si) dod8\mbreak

   %130
   dod(re) la fad\p
   re16(mi) fad(sol) la(si) dod8
   dod(re) la fad\f

   %133
   re[re re re]
   sol[sol sol sol]
   la[la la la]

   %136
   sol16[sol la la] sol[sol fad fad]\mbreak
   sol16 sol la la sol sol la la
   mi mi fad fad mi mi fad fad

   %139
   dod dod re re dod dod re re
   mi8[mi mi mi]
   mi[mi\p mi mi]

   %142
   mi[mi\f mi mi]
   mi re mi re
   re dod r4

   %145
   la8\p[la la la]
   la [la la la]
   la [la la la]

   %148
   la [la la la]
   la [la la la]
   la [la la la]

   %151
   la [la la la]
   la [la la la]
   re r do r

   %154
   sib r la r\mbreak
   sol4 r8 sol
   la la r8 dod\f

   %157
   fad,16(sol) la8 re mi
   mi(fad) sol\p mi
   mi(fad) sol\f mi

   %160
   mi(fad) re16 re mi mi
   re re fad fad fad fad mi mi
   re8 dod r la'

   %163
   la4 mi8 la\mbreak
   la4 la8\p la
   la4 la8\f la

   %166
   la la r re,16 fad
   re4 r8 re
   re4 r8 mi16 fad

   %169
   mi4 r8 mi16 sold
   mi8 fad16(dod) re(mi) fad(re)
   si'8[la sol fad]\mbreak

   %172
   mi8 fad16\p(dod) re(mi) fad(re)
   si'8[la sol fad]
   mi [re\f dod re]

   %175
   mi4 re
   r8 fad\p [mi re]
   dod4 re

   %178
   sol16\f la si sol la8 si
   si la la sol
   sol fad fad mi

   %181
   mi mi r la
   la re, fad mi\mbreak
   re4. fad,8 fad4. fad8

   %184
   sol'2. sol4\p
   mi4. mi8 fad4. fad8
   fad2. fad4

   %187
   sol4. sol8 mi4. mi8
   mi4. mi8 re4. re8
   la'4. la8 la4. la8

   %190
   la2. la4\mbreak
   la4. fad8 re4. re8
   re2. red4

   %193
   sol4. fad8 sol4. la8
   si2. fad4
   mi4. mi8 mi4. mi8

   %196
   mi2~mi8 la,16 si dod re mi fad\mbreak
   sol4. sol8 sol4. sol8
   sol2.dod,4

   %199
   mi4. mi8 dod4. dod8
   re4. re8 si4. si8
   la2 la

   %202
   la4 r la1\fermata

}

Ibcn = \relative do {

   re4. re8 re4. re8
   re'2. re4
   dod4. dod8 la4. la8

   %4
   si2. la4
   sol4. sol8 sol,4. sol8
   la4. la8 si4. si8\mbreak

   %7
   dod4. dod8 re4. re8
   la'2. dod,4
   mi4. mi8 re4. re8

   %10
   dod2~dod4. \tuplet 3/2 { dod16 si la }
   si4. si8 dod4. dod8
   re2. si4

   %13
   fad'4. fad8 mi4. mi8\mbreak
   re2~re4. \tuplet 3/2 { re16 dod si }
   dod4. dod8 red4. red8

   %16
   mi2~mi8 mi16 fad sold la si dod
   re4. re8 re4. re8
   re2. re4

   %19
   sold,4. sold8 mi4. mi8
   la2 sold
   fad4. fad8 mi4. re8\mbreak

   %22
   dod4. dod8 si4. la8
   mi'2 mi,
   la2 <<
      {
         \stemDown la'^\markup\italic"Bassone"~

         %25
         la1~
         la~
         la

         %28
         la2 la4. la8
      }\\{
         r2
         R1*3
         r2 r4 r8 \shiftOn la,
      }
   >>
   sold'4.\tu sold8 sold4. sold8\mbreak
   la4. la8 dod4. la8

   %31
   re4. la8 fad4. re8
   la'4. si8 la4. \tuplet 3/2 { sol16 fad mi } la4 r
   R2*13

   %46
   r4 r8 la
   re,16(mi) fad(sol) la(si) dod8
   dod(re) la sol

   %49
   fad16(la) re8 fad, mi
   re16(mi) fad(sol) la(si) do(re)
   si(la) sol(fad) mi(re) dod!(si)

   %52
   la8[la la la]
   si[si si si]
   dod[dod dod dod]\mbreak

   %55
   re[dod re dod\p]
   re dod\f re la
   si[sol la la]

   %58
   re,4 r
   R2*7
   r8 re''16^\markup\italic"Bassone" dod si8 re,

   %67
   mi sold la dod,
   re fad sold si,
   dod mi fad la,

   %70
   si re mi sold,\mbreak
   la4 r8 mi'
   la,4 r8 mi'

   %73
   la,4 r8 mi'
   la,[la' la la]
   re, la' r4

   %76
   r r8 mi\tu
   la,16(si) dod(re) mi(fad) sold8\mbreak %% fine primo sistema p. 6
   sold (la) r sold\p

   %79
   sold(la) r sold\f
   la la  la, la'
   re, re^\markup\italic"Cembalo" sol fad

   %82
   mi dod fad fad,
   si si re re
   mi mi dod dod

   %85
   re re si si\mbreak
   dod dod lad lad
   si si r si

   %88
   fad4 r8 si
   fad'4 r8 si
   fad4 r8 si,

   %91
   fad fad'16\tu(sol) fad(mi) re(dod)
   re(dod) si(dod) re(mi) fad(mi)
   re8 re'16 dod re8 lad\mbreak

   %94
   si fad16(sol) fad8 mi
   re16(mi) re(dod) si8 si'
   la16(si) la(sold) fad8 dod'

   %97
   fad,4 r8 dod'
   fad,4 r8 dod
   fad,4 r

   %100
   R2*7
   r4 r8 fad'
   si,16(dod) re(mi) fad(sold) lad8

   %109
   lad?(si) fad mi\mbreak
   re16(fad) si8 re, dod
   si [si si si]

   %112
   dod[dod' dod, si]
   la[la la la]
   si si' si, la

   %115
   sol[sol sol sol]
   la[la' la sol]
   fad[fad fad fad]\mbreak

   %118
   sol[sol sol sol]
   la[la la la]
   re, la' r4

   %121
   R2*7
   r4 r8 la\f
   re,16(mi) fad(sol) la(si) dod8

   %130
   dod(re) la fad\p
   re16(mi) fad(sol) la(si) dod8
   dod(re) la fad\f

   %133
   re[re re re]
   mi[mi mi mi]
   fad[fad fad fad]

   %136
   sol16[sol fad fad] sol[sol la la]\mbreak
   si16 si la la si si la la
   sol sol fad fad sol sol fad fad

   %139
   mi mi re re mi mi re re
   dod8[dod dod dod]
   dod[dod\p dod dod]

   %142
   dod[dod\f dod dod]
   dod re dod re
   la la' r4

   %145
   R2*11
   r4 r8 la\f
   re,8[re re re]

   %158
   re[re re\p re]
   re[re re\f re]
   re re fad16 fad la la

   %161
   si si la la si si dod dod
   re8 la r la
   re,16(mi) fad(sol) la(si) dod8  %% fine secondo sistema p. 9

   %164
   dod(re) la16\p(si) dod8
   dod re la16\f(si) dod8
   dod re16(dod) re(dod) si(la)

   %167
   si(la) si(la) si(la) sol(fad)
   sol(fad) sol(fad) sol(fad) mi(re)
   mi(re) mi(re) mi(re) dod(si)

   %170
   la8[la la la]
   la[la la la]\mbreak
   la[la\p la la]

   %173
   la[la la la]
   la [fad'\f mi re]
   dod4 re

   %176
   R2*2
   sol8\f sol fad si
   mi, la re, sol

   %180
   dod, fad si, mi
   la, la' r16 la si dod
   re8 fad, la la,\mbreak

   %183
   re4. re8 re4. re8
   si'2. si4
   dod4. dod8 la4. la8

   %186
   si2. la4
   sol4. sol8 sol,4. sol8
   la4. la8 si4. si8

   %189
   dod4. dod8 re4. re8
   la2. dod'4\mbreak
   re4. re8 fad,4. fad8

   %192
   sol2. si4
   sol4. la8 sol4. fad8
   mi2. red4

   %195
   mi4. mi8 sold,4. sold8
   la2~la8 la16 si dod re mi fad\mbreak
   sol4. sol8 sol4. sol8

   %198
   sol2. sol4
   dod,4. dod8 la4. la8
   re4. re8 sol,4. sol8

   %201
   la2 la
   re,4 r re1\fermata

}

Ibfn = \figures {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}


forma = {

   \key re\major
   \time 2/2
   \tempo 2 = 65
   \repeat volta 2 {s1*31}
   \alternative {{s1}{\time 2/4 \tempo 2 = 47 s2}}\break
   \set Score.currentBarNumber = #33
   \mark\markup\italic"              moderé"
   \repeat volta 2 {
      s2*150\break
      \time 2/2 \tempo 2= 65
      s1*19
   }
   \alternative {{\time 2/4 s2}{\time 2/2 s1}}
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


IvlaI = {
   \Iglobal
   %\clef soprano
   <<\IvlaIn \forma>>

}


IvlaII = {
   \Iglobal
   \clef alto
   <<\IvlaIIn \forma>>

}


Ibc = {
   \Iglobal
   \clef bass
   << \Ibcn \forma \Ibfn >>
   \typeset

}

IIglobal = 	{
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
   \terzine \senza
}



IIflIn = \relative do'' {

   la8 re
   (dod4) dod dod la8 fad'(
   mi4) mi mi la,8 si'(
   la4) sol fad mi

   %4
   re,8(fad) la[(fad')] mi2
   re,8(la') fad'[(si)] sol2
   re,8(la') fad'[(la)] dod,2

   %7
   re,8(fad) la[(re)] la(dod) mi[(sol)]
   la,(re) fad(la) la,(sol') fad(mi)
   fad4 mi re dod

   %10
   re16(si'8.) re,2  dod8 re\mbreak
   mi4 re dod si
   dod16(la'8.) dod,2 si8 dod

   %13
   re4 dod si la
   sold8(mi) sold[(si)] re2
   dod16(si la4.) si2\tr

   %16
   la2. la8 fad'(
   mi4) mi mi re8 si'(
   dod,4) dod dod la8\p sol'(  %%% OK

   %19
   fad4) re8 fad(mi4) dod8 mi(
   re4) si8 re (dod4) la8\f sol'(
   fad4) mi8 re dod4 si\mbreak

   %22
   fad8(lad) dod[(mi)] dod2
   fad,8(si) re[(fad)] re2
   fad,8(dod') mi[(sol)] mi2

   %25
   fad,8(re') fad[(si)] dod, (mid) sold(si)
   lad(si) lad(sold) fad(mi) re(dod)
   re4 dod si lad

   %28
   si16(fad'8.) si2 la!4
   sol fad mi red
   mi16(lad,8.) mi'2 re!4\mbreak

   %31
   dod si lad sold
   fad8(lad) dod[(mi)] sol2
   fad16(mi re4.) dod2\tr

   %34
   si2. si' 4
   dod si lad si
   dod si r2
   R1*5\mbreak

   %42
   r2 r4 la,8 re\tu(
   dod4) dod dod la8 fad'(
   mi4) mi mi la,8 si'(

   %45
   la4) sol fad mi
   re,8(fad) la[(fad')] mi2
   re,8(la') fad'[(si)] sol2

   %48
   re,8(la') fad'[(la)] dod,2
   re,8(fad) la[(re)] la(dod) mi[(sol)]
   la,(re) fad[(la)] la,(sol') fad(mi)\mbreak

   %51
   fad4 mi re do
   si16(re,8.) do'2 si8 la
   si4 dod re mi

   %54
   dod16(mi,8.) re'2 dod8 si
   dod4 re mi fad
   dod8(la) dod(mi) sol2

   %57
   fad16(mi re4.) mi2
   re2.

}

IIflIIn = \relative do'' {

   la8 re
   (dod4) dod dod la8 fad'(
   mi4) mi mi la,8 si'(
   la4) sol fad mi

   %4
   re,8(fad) la[(fad')] mi2
   re,8(la') fad'[(si)] sol2
   re,8(la') fad'[(la)] dod,2

   %7
   re,8(fad) la[(re)] la(dod) mi[(sol)]
   la,(re) fad(la) la,(sol') fad(mi)
   fad4 mi re dod

   %10
   re16(si'8.) re,2  dod8 re\mbreak
   mi4 re dod si
   dod16(la'8.) dod,2 si8 dod

   %13
   re4 dod si la
   sold8(mi) sold[(si)] re2
   dod16(si la4.) si2\tr

   %16
   la2. la8 fad'(
   mi4) mi mi re8 si'(
   dod,4) dod dod la8\p sol'(  %%% OK

   %19
   fad4) re8 fad(mi4) dod8 mi(
   re4) si8 re (dod4) la8\f sol'(
   fad4) mi8 re dod4 si\mbreak

   %22
   fad8(lad) dod[(mi)] dod2
   fad,8(si) re[(fad)] re2
   fad,8(dod') mi[(sol)] mi2

   %25
   fad,8(re') fad[(si)] dod, (mid) sold(si)
   lad(si) lad(sold) fad(mi) re(dod)
   re4 dod si lad

   %28
   si16(fad'8.) si2 la!4
   sol fad mi red
   mi16(lad,8.) mi'2 re!4\mbreak

   %31
   dod si lad sold
   fad8(lad) dod[(mi)] sol2
   fad16(mi re4.) dod2\tr

   %34
   si2. fad' 4
   sol fad mi fad
   sol fad r2
   R1*5\mbreak

   %42
   r2 r4 la,8 re(
   dod4) dod dod la8 fad'(
   mi4) mi mi la,8 si'(

   %45
   la4) sol fad mi
   re,8(fad) la[(fad')] mi2
   re,8(la') fad'[(si)] sol2

   %48
   re,8(la') fad'[(la)] dod,2
   re,8(fad) la[(re)] la(dod) mi[(sol)]
   la,(re) fad[(la)] la,(sol') fad(mi)\mbreak

   %51
   fad4 mi re do
   si16(re,8.) do'2 si8 la
   si4 dod re mi

   %54
   dod16(mi,8.) re'2 dod8 si
   dod4 re mi fad
   dod8(la) dod(mi) sol2

   %57
   fad16(mi re4.) mi2
   re2.

}

IIobIn = \relative do'' {
   la8 re
   (dod4) dod dod la8 fad'(
   mi4) mi mi la,8 si'(
   la4) sol fad mi

   %4
   re,8(fad) la[(fad')] mi2
   re,8(la') fad'[(si)] sol2
   re,8(la') fad'[(la)] dod,2

   %7
   re,8(fad) la[(re)] la(dod) mi[(sol)]
   la,(re) fad(la) la,(sol') fad(mi)
   fad4 mi re dod

   %10
   re16(si'8.) re,2  dod8 re\mbreak
   mi4 re dod si
   dod16(la'8.) dod,2 si8 dod

   %13
   re4 dod si la
   sold8(mi) sold[(si)] re2
   dod16(si la4.) si2\tr

   %16
   la2. la8 fad'(
   mi4) mi mi re8 si'(
   dod,4) dod dod la8\p sol'(  %%% OK

   %19
   fad4) re8 fad(mi4) dod8 mi(
   re4) si8 re (dod4) la8\f sol'(
   fad4) mi8 re dod4 si\mbreak

   %22
   fad8(lad) dod[(mi)] dod2
   fad,8(si) re[(fad)] re2
   fad,8(dod') mi[(sol)] mi2

   %25
   fad,8(re') fad[(si)] dod, (mid) sold(si)
   lad(si) lad(sold) fad(mi) re(dod)
   re4 dod si lad

   %28
   si16(fad'8.) si2 la!4
   sol fad mi red
   mi16(lad,8.) mi'2 re!4\mbreak

   %31
   dod si lad sold
   fad8(lad) dod[(mi)] sol2
   fad16(mi re4.) dod2\tr

   %34
   si2 r2
   R1*3
   r2 r4 fad'

   %39
   sol sol sol sol
   si16(la sol4.) fad4 mi
   la sol8 fad mi4 re\mbreak

   %42
   dod mi8(re) dod[(si)] la8 re(
   dod4) dod dod la8 fad'(
   mi4) mi mi la,8 si'(

   %45
   la4) sol fad mi
   re,8(fad) la[(fad')] mi2
   re,8(la') fad'[(si)] sol2

   %48
   re,8(la') fad'[(la)] dod,2
   re,8(fad) la[(re)] la(dod) mi[(sol)]
   la,(re) fad[(la)] la,(sol') fad(mi)\mbreak

   %51
   fad4 mi re do
   si16(re,8.) do'2 si8 la
   si4 dod re mi

   %54
   dod16(mi,8.) re'2 dod8 si
   dod4 re mi fad
   dod8(la) dod(mi) sol2

   %57
   fad16(mi re4.) mi2
   re2.

}

IIobIIn = \relative do'' {

   la4
   la la la la
   la la la dod
   la si la la

   %4
   la re mi dod
   re re mi dod
   la la la2

   %7
   la4 la la la
   la la la la
   la dod si lad

   %10
   si2 sold4 si\mbreak
   la la la sold
   la2 la4 si

   %13
   la sold fad fad
   mi8(si) mi[(sold)] si2
   la sold4 mi

   %16
   mi2. la4
   si si si sold
   la la la la\p

   %19
   la si la la
   la sold la la8\f si(
   dod4) si sol? mi\mbreak

   %22
   lad lad lad2
   si4 si si2
   dod4 dod dod2

   %25
   re4 re dod dod
   dod si dod lad
   si lad si sol

   %28
   si2 si4 si
   si la? si si
   lad2 dod4 si\mbreak

   %31
   sol sol fad mid
   fad lad dod lad
   si2 lad

   %34
   fad r
   R1*3
   r2 r4 re'

   %39
   si si la si
   dod dod re dod
   la si8 la sol4 fad\mbreak

   %42
   mi dod'8(si) la[(sold)] la4
   la la la la
   la la la dod

   %45
   la si la la
   la re mi dod
   re re mi dod

   %48
   la la la2
   la4 la la la
   la la la la\mbreak

   %51
   la sol la fad
   sol2 la4 fad
   sol sol la si

   %54
   la2 si4 sold
   la la la la
   la8(mi) la[(dod)] mi2

   %57
   re dod
   la2.

}


IIvlIn = \relative do'' {

   la8 re
   (dod4) dod dod la8 fad'(
   mi4) mi mi la,8 si'(
   la4) sol fad mi

   %4
   re,8(fad) la[(fad')] mi2
   re,8(la') fad'[(si)] sol2
   re,8(la') fad'[(la)] dod,2

   %7
   re,8(fad) la[(re)] la(dod) mi[(sol)]
   la,(re) fad(la) la,(sol') fad(mi)
   fad4 mi re dod

   %10
   re16(si'8.) re,2  dod8 re\mbreak
   mi4 re dod si
   dod16(la'8.) dod,2 si8 dod

   %13
   re4 dod si la
   sold8(mi) sold[(si)] re2
   dod16(si la4.) si2\tr

   %16
   la2. la8 fad'(
   mi4) mi mi re8 si'(
   dod,4) dod dod la8\p sol'(  %%% OK

   %19
   fad4) re8 fad(mi4) dod8 mi(
   re4) si8 re (dod4) la8\f sol'(
   fad4) mi8 re dod4 si\mbreak

   %22
   fad8(lad) dod[(mi)] dod2
   fad,8(si) re[(fad)] re2
   fad,8(dod') mi[(sol)] mi2

   %25
   fad,8(re') fad[(si)] dod, (mid) sold(si)
   lad(si) lad(sold) fad(mi) re(dod)
   re4 dod si lad

   %28
   si16(fad'8.) si2 la!4
   sol fad mi red
   mi16(lad,8.) mi'2 re!4\mbreak

   %31
   dod si lad sold
   fad8(lad) dod[(mi)] sol2
   fad16(mi re4.) dod2\tr

   %34
   si2 r4 re
   mi re dod re
   mi re r si

   %37
   dod si lad si
   dod si r2
   R1*3\mbreak

   %42
   r2 r4 la8 re(
   dod4) dod dod la8 fad'(
   mi4) mi mi la,8 si'(

   %45
   la4) sol fad mi
   re,8(fad) la[(fad')] mi2
   re,8(la') fad'[(si)] sol2

   %48
   re,8(la') fad'[(la)] dod,2
   re,8(fad) la[(re)] la(dod) mi[(sol)]
   la,(re) fad[(la)] la,(sol') fad(mi)\mbreak

   %51
   fad4 mi re do
   si16(re,8.) do'2 si8 la
   si4 dod re mi

   %54
   dod16(mi,8.) re'2 dod8 si
   dod4 re mi fad
   dod8(la) dod(mi) sol2

   %57
   fad16(mi re4.) mi2
   re2.

}

IIvlIIn = \relative do'' {

   la8 re
   (dod4) dod dod la8 fad'(
   mi4) mi mi la,8 si'(
   la4) sol fad mi

   %4
   re,8(fad) la[(fad')] mi2
   re,8(la') fad'[(si)] sol2
   re,8(la') fad'[(la)] dod,2

   %7
   re,8(fad) la[(re)] la(dod) mi[(sol)]
   la,(re) fad(la) la,(sol') fad(mi)
   fad4 mi re dod

   %10
   re16(si'8.) re,2  dod8 re\mbreak
   mi4 re dod si
   dod16(la'8.) dod,2 si8 dod

   %13
   re4 dod si la
   sold8(mi) sold[(si)] re2
   dod16(si la4.) si2\tr

   %16
   la2. la8 fad'(
   mi4) mi mi re8 si'(
   dod,4) dod dod la8\p sol'(  %%% OK

   %19
   fad4) re8 fad(mi4) dod8 mi(
   re4) si8 re (dod4) la8\f sol'(
   fad4) mi8 re dod4 si\mbreak

   %22
   fad8(lad) dod[(mi)] dod2
   fad,8(si) re[(fad)] re2
   fad,8(dod') mi[(sol)] mi2

   %25
   fad,8(re') fad[(si)] dod, (mid) sold(si)
   lad(si) lad(sold) fad(mi) re(dod)
   re4 dod si lad

   %28
   si16(fad'8.) si2 la!4
   sol fad mi red
   mi16(lad,8.) mi'2 re!4\mbreak

   %31
   dod si lad sold
   fad8(lad) dod[(mi)] sol2
   fad16(mi re4.) dod2\tr

   %34
   si2 r4 re
   mi re dod re
   mi re r fad,

   %37
   sol fad mi fad
   sol fad r2
   R1*3\mbreak

   %42
   r2 r4 la8 re(
   dod4) dod dod la8 fad'(
   mi4) mi mi la,8 si'(

   %45
   la4) sol fad mi
   re,8(fad) la[(fad')] mi2
   re,8(la') fad'[(si)] sol2

   %48
   re,8(la') fad'[(la)] dod,2
   re,8(fad) la[(re)] la(dod) mi[(sol)]
   la,(re) fad[(la)] la,(sol') fad(mi)\mbreak

   %51
   fad4 mi re do
   si16(re,8.) do'2 si8 la
   si4 dod re mi

   %54
   dod16(mi,8.) re'2 dod8 si
   dod4 re mi fad
   dod8(la) dod(mi) sol2

   %57
   fad16(mi re4.) mi2
   re2.

}

IIvlaIn = \relative do'' {

   la4
   la la la la
   la la la dod
   la si la la

   %4
   la re mi dod
   re re mi dod
   la la la2

   %7
   la4 la la la
   la la la la
   la dod si lad

   %10
   si2 sold4 si\mbreak
   la la la sold
   la2 la4 si

   %13
   la sold fad fad
   mi8(si) mi[(sold)] si2
   la sold4 mi

   %16
   mi2. la4
   si si si sold
   la la la la\p

   %19
   la si la la
   la sold la la8\f si(
   dod4) si sol? mi\mbreak

   %22
   lad lad lad2
   si4 si si2
   dod4 dod dod2

   %25
   re4 re dod dod
   dod si dod lad
   si lad si sol

   %28
   si2 si4 si
   si la? si si
   lad2 dod4 si\mbreak

   %31
   sol sol fad mid
   fad lad dod lad
   si2 lad

   %34
   fad r4 re'
   mi re dod re
   mi re r re,

   %37
   mi re dod re
   mi re r2
   R1*3\mbreak

   %42
   r2 r4 la'
   la la la la
   la la la dod

   %45
   la si la la
   la re mi dod
   re re mi dod

   %48
   la la la2
   la4 la la la
   la la la la\mbreak

   %51
   la sol la fad
   sol2 la4 fad
   sol sol la si

   %54
   la2 si4 sold
   la la la la
   la8(mi) la[(dod)] mi2

   %57
   re dod
   la2.

}

IIvlaIIn = \relative do' {

   re8 fad(
   mi4) mi mi re
   dod dod dod mi
   re re re dod

   %4
   re fad la2
   fad4 la la2
   fad4 re mi2

   %7
   re4 fad mi dod
   re re mi dod
   re sol fad fad

   %10
   fad2 mi4 sold\mbreak
   mi4 fad mi mi
   mi2 mi4 mi

   %13
   la, dod re red
   si8(sold) si(mi) sold2
   mi16(re dod8) mi4 mi2

   %16
   dod2. mi8 re
   mi4 mi mi mi
   mi mi mi mi\p

   %19
   re fad la fad
   fad mi mi mi8\f re(
   fad4) fad mi dod\mbreak

   %22
   dod fad fad2
   re4 fad fad2
   lad4 lad lad2

   %25
   si4 si sold mid
   fad mid fad fad
   fad mi! fad sol

   %28
   fad2 fad4 red
   mi red mi fad
   mi2 fad4 fad\mbreak

   %31
   mi mi dod si
   dod fad dod2
   fad fad

   %34
   re r
   R1
   r2 r4 re\p

   %37
   mi re dod re
   mi re r2
   R1*3\mbreak

   %42
   r2 r4 re8 fad(
   mi4) mi mi re
   dod dod dod mi

   %45
   re re re dod
   re fad la2
   fad4 la la2

   %48
   fad4 re mi2
   re4 fad mi dod
   re re mi dod\mbreak

   %51
   re dod re  re
   re2 re4 re
   re sol fad mi

   %54
   mi2 mi4 mi
   mi fad mi re
   mi8(dod) mi[(la)] dod2

   %57
   la16(sol fad8) la4 la2
   fad2.

}

IIbcn = \relative do {

   fad8 re(
   la'4) la la fad8 re(
   la'4) la la sol
   fad sol la sol

   %4
   fad re dod la
   re re' dod la
   re re, la' sol

   %7
   fad re dod la
   fad' re dod' la
   re, mi fad fad,

   %10
   si2 mi4 re\mbreak
   dod re mi mi,
   la2 la'4 sold

   %13
   fad mi re si
   mi mi mi, mi'
   la dod, mi mi,

   %16
   la' mi la, dod'8 re(
   sold,4) sold sold mi
   la la la dod,\p

   %19
   re si dod fad
   si, mi la, dod'8\f si
   lad4 si mi, sol\mbreak

   %22
   fad fad fad fad,
   fad' fad fad fad,
   fad' fad fad fad,

   %25
   fad' fad mid dod
   fad sold lad fad
   si, dod re mi

   %28
   re2 red4 si
   mi fad sol si
   dod,2 lad4 si\mbreak

   %31
   mi dod fad sold
   lad fad lad mi
   re si fad' fad,

   %34
   si' fad si, r
   R1*3
   r4 si'_\markup\italic "Bassoni" re si

   %39
   mi re dod si
   la la la, sol'
   fad sol sol, sol'\mbreak

   %42
   la2 r4 fad8 re(
   la'4) la la fad8 re(
   la'4) la la sol

   %45
   fad sol la sol
   fad re dod la
   re re' dod la

   %48
   re re, la' sol
   fad re dod la
   fad' re dod' la\mbreak

   %51
   re, mi fad re
   sol2 fad4 re'
   sol, mi fad sol

   %54
   la2 sold4 mi'
   la, fad dod re
   la la' la, la'

   %57
   re fad, la la,
   re\fermata la re,

}

IIbfn = \figures {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}


forma = {

   \key re\major
   \time 2/2
   \tempo 2 = 100
   \partial 4 s4
   s1*15
   s2.
   \bar":..:"\break
   s4
   s1*41
   s2.
   \bar":|."

}

IIflI = {
   \IIglobal
   \notypeset
   <<\IIflIn \forma>>

}

IIflII = {
   \IIglobal
   <<\IIflIIn \forma>>

}

IIobI = {
   \IIglobal
   <<\IIobIn \forma>>

}

IIobII = {
   \IIglobal
   <<\IIobIIn \forma>>

}

IIvlI = {
   \IIglobal
   <<\IIvlIn \forma>>

}

IIvlII = {
   \IIglobal
   <<\IIvlIIn \forma>>

}


IIvlaI = {
   \IIglobal
   % \clef soprano
   <<\IIvlaIn \forma>>

}


IIvlaII = {
   \IIglobal
   \clef alto
   <<\IIvlaIIn \forma>>

}


IIbc = {
   \IIglobal
   \clef bass
   << \IIbcn \forma \IIbfn >>
   \typeset

}

IIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}



IIIflIn = \relative do'' {

   fad4
   sol sol sol fad8 sol
   la4 sol fad mi
   fad fad fad fad

   %4
   fad\tr(mi) r la
   re, fad8 sol fad4 dod
   re si'4 si8 la sold4\mbreak

   %7
   la sold8 fad mi4 re
   dod \grace mi8 re4 mi (fad)
   dod\p \grace mi8 re4 mi(fad)

   %10
   dod8\f mi re fad mi sol fad la
   sold4 la si, sold'
   la2. dod,4

   %13
   re re re dod8 re
   mi4 re dod si\mbreak
   dod4 dod dod dod

   %16
   dod\tr si r re
   dod re mi re8 dod
   re4 mi fad mi8 re

   %19
   mi4 fad sol fad8 mi
   fad mi re fad mi4 la
   sol sol sol sol

   %22
   la, sol' sol sol
   fad mi dod2\tr\mbreak
   re8 fad mi sol fad la sol si

   %25
   la4 la la si
   la la8 sol fad mi re[dod]
   re4. mi8 mi2\tr

   %28
   re2.

}

IIIflIIn = \relative do'' {

   re4
   mi mi mi re8 mi
   fad4 mi re dod
   re re re re

   %4
   re\tr(dod) r dod
   si re8 mi re4 la
   si re re8 dod si4\mbreak

   %7
   la4 la si sold
   la si dod(re)
   la\p si dod(re)

   %10
   la\f la la re8 dod
   si4 la si si
   dod2. la4

   %13
   si si si la8 si
   dod4 si la sold\mbreak
   la la la la

   %16
   la\tr sold r sold
   la si dod la
   si dod re si

   %19
   dod re mi dod
   re la8 re dod4 la
   si dod8 re mi4 re

   %22
   dod dod mi re8 dod\mbreak
   re4 si mi,2\tr
   la4 dod re re

   %25
   re re re re
   re re la8 sol fad[mi]
   re4 re' dod2\tr

   %28
   re2.

}

IIIobIn = \relative do'' {

   fad4
   sol sol sol fad8 sol
   la4 sol fad mi
   fad fad fad fad

   %4
   fad\tr(mi) r la
   re, fad8 sol fad4 dod
   re si'4 si8 la sold4\mbreak

   %7
   la sold8 fad mi4 re
   dod \grace mi8 re4 mi (fad)
   dod\p \grace mi8 re4 mi(fad)

   %10
   dod8\f mi re fad mi sol fad la
   sold4 la si, sold'
   la2. dod,4

   %13
   re re re dod8 re
   mi4 re dod si\mbreak
   dod4 dod dod dod

   %16
   dod\tr si r re
   dod re mi re8 dod
   re4 mi fad mi8 re

   %19
   mi4 fad sol fad8 mi
   fad mi re fad mi4 la
   sol sol sol sol

   %22
   la, sol' sol sol
   fad mi dod2\tr\mbreak
   re8 fad mi sol fad la sol si

   %25
   la4 la la si
   la la8 sol fad mi re[dod]
   re4. mi8 mi2\tr

   %28
   re2.

}

IIIobIIn = \relative do'' {

   re4
   mi mi mi re8 mi
   fad4 mi re dod
   re re re re

   %4
   re\tr(dod) r dod
   si re8 mi re4 la
   si re re8 dod si4\mbreak

   %7
   la4 la si sold
   la si dod(re)
   la\p si dod(re)

   %10
   la\f la la re8 dod
   si4 la si si
   dod2. la4

   %13
   si si si la8 si
   dod4 si la sold\mbreak
   la la la la

   %16
   la\tr sold r sold
   la si dod la
   si dod re si

   %19
   dod re mi dod
   re la8 re dod4 la
   si dod8 re mi4 re

   %22
   dod dod mi re8 dod\mbreak
   re4 si mi,2\tr
   la4 dod re re

   %25
   re re re re
   re re la8 sol fad[mi]
   re4 re' dod2\tr

   %28
   re2.

}

IIIbcn = \relative do {

   re'4
   dod dod dod re
   la la la la,
   re mi fad sold

   %4
   la la, dod la
   mi' mi mi mi,
   mi' mi\mbreak mi mi,

   %7
   fad fad' sold mi
   la la la la,
   la'\p la la la,

   %10
   la'\f si dod re
   mi dod re mi
   la, mi la, la'

   %13
   sold sold sold la\mbreak
   mi mi mi mi,
   la si dod re

   %16
   mi mi sold mi
   la la la la,
   la' la la la,

   %19
   la' la la la,
   re fad la fad
   mi re dod si

   %22
   la la' dod la
   re sol,\mbreak la sol
   fad mi re mi

   %25
   fad fad fad sol
   fad fad fad la
   si sol la la,

   %28
   re\fermopz la re,

}

IIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key re\major
   \time 2/2
   \tempo 2 = 100
   \partial 4 s4
   s1*11
   s2.
   \bar":..:"\break
   s4
   s1*15
   s2.
   \bar":|."

}

IIIflI = {
  \IIIglobal
  \notypeset
  <<\IIIflIn \forma>>

}

IIIflII = {
  \IIIglobal
  <<\IIIflIIn \forma>>

}

IIIobI = {
  \IIIglobal
  <<\IIIobIn \forma>>

}

IIIobII = {
  \IIIglobal
  <<\IIIobIIn \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  << \IIIbcn \forma \IIIbfn >>
  \typeset

}

IVglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}



IVflIn = \relative do'' {

   r8
   R1*4\mbreak
   r2 r4 r8 la'
   sol fad16. la32(sol8) fad16. la32(fad8) mi r4

   %7
   R1
   r2 r4 r8 la
   sol fad16. la32(sol8) fad16. la32(fad8) mi r mi16.\p sol32(\mbreak

   %10
   fad8) sol16. si32(la8) sol fad mi r mi16.\f sol32(
   fad16)(mi) fad8 r fad16. la32(sold16.) (fad 32) sold8 r si16. sold32(
   la8) fad16. mi32(re8) dod16. mi32(dod8) si r4

   %13
   R1
   r2 r4 r8 la'16. sol!32(\mbreak
   fad8)  mi16. sol32(fad8) mi16. sol32(fad8) mi r sol16. si32(%%% inzio p. 13

   %16
   sol8) fad16. la32(fad8) mi16. sol32(mi8) re r4
   R1
   r2 r16. lad'32 si16. lad32 si8  r

   %19
   r16. sold32 la?16. sold32 la8 r r2\mbreak
   r4 r8 si16. sol!32(fad8) la16. fad32(sol8) sol16. mi32(
   fad8) mi r mi16. fad32 sol8 sol16. si32(sol8) sol16. si32(

   %22
   sol8) fad r re'16. do32 si16. do32 si16. la32 sol16. la32 sol16. fad32
   mi4~mi16. dod32 fad16. re32 mi4~mi16. dod32 fad16. re32\mbreak
   mi16. dod32 re16. mi32 fad16. sol32 la16. si32 fad8 mi r4

   %25
   R1
   r2 r4 r8 la,16. sol'32(
   fad8) fad fad dod16. si'32(la8) la la mi16. sol32(\mbreak

   %28
   fad8) re16. fad32(mi8) dod16. mi32 re8 r r4
   r2 r4 r8 re'
   do si la[si] do si r re

   %31
   do si la[si] sol16(fad) sol8~sol16 sol fad mi
   fad8. mi16 dod8.\tr re16 re4 r\mbreak
   R1

   %34
   r2 r16. si'32 (sol8)~sol16 sol  fad mi
   fad8. si,16 dod8.\tr re16 re2

}

IVflIIn = \relative do'' {

   r8
   R1*4\mbreak
   r2 r4 r8 fad
   mi re16. fad32(mi8) re16. fad32(re8) dod r4

   %7
   R1
   r2 r4 r8 fad
   mi re16. fad32(mi8) re16. fad32(re8) dod r dod16.\p mi32(\mbreak

   %10
   re8) mi16. sol32(fad8) mi re dod r dod16.\f mi32(
   re16)(dod) re8 r re16. dod32(si16.) (la32) si8 r sold16. si32(
   la8) la16. dod32(si8) la16. dod32(la8) sold r4

   %13
   R1
   r2 r4 r8 dod16. mi32(\mbreak
   re8) dod16. mi32(re8) dod16. mi32(re8) dod r  mi16. sol32(

   %16
   mi8) re16.fad32(re8) dod16. mi32(dod8) si r4
   R1
   r2 r16. dod32 re16. dod32 re8 r

   %19
   r16. si32 dod16. si32 dod8 r r2\mbreak
   r4 r8 dod16. mi32(re8) fad16. re32(mi8) mi16. dod32(
   re8) dod r dod16. re32 mi8 mi16. sol32(mi8) mi16. sol32(

   %22
   mi8) re r fad16. la32 sol16. la32 sol16. fad32 mi16. fad32 mi16. re32
   dod4~dod16. la32 re16. si32 dod4~dod16. la32 re16. si32\mbreak
   dod16. la32 si16. dod32 re16. mi32 fad16. sol32 re8 dod r4

   %25
   R1
   r2 r4 r8 la16. dod32(
   re8) re re[dod] re re re[re]\mbreak

   %28
   dod re si[dod] la r r4
   r2 r4 r8 si'
   la sol fad[sol] la sol r si

   %31
   la sol fad[sol] mi16(re) mi8~mi16 mi re dod
   fad8. mi16 dod8.\tr re16 re4 r\mbreak
   R1

   %34
   r2 r16. si'32(sol8)~sol16 sol fad mi
   fad8. si,16 dod8.\tr re16 re2

}

IVobIn = \relative do'' {

   r8
   R1*4
   r2 r8 la sol fad
   R1*2

   %8
   r2 r8 la sol fad
   r2 r8 mi' re dod \mbreak
   r2 r8 mi\p re dod

   %11
   r fad16\f(mi) re[(dod) re8] r re16(dod) si(la) si8
   r2 r8 mi red mi
   R1

   %14
   r2 r8 dod16. mi32(dod4)\mbreak
   r2 r8 dod16. mi32(dod4)
   r2 r8 re16. fad32(re4)

   %17
   R1
   r2 r8 fad re r
   r mi dod r r2\mbreak

   %20
   r8 mi re dod r2
   r8 mi re dod r2
   r8 la' sol fad r2

   %23
   r8 sol mi r r sol mi r\mbreak
   R1
   r2 r8 mi dod r

   %26
   r2 r8 mi dod r
   R1*2
   r2 r8 re do si

   %30
   r2 r8 re do si
   r2 r8 sol'~sol16 sol fad mi
   fad8. mi16 dod8.\tr re16 re4 r\mbreak

   %33
   R1
   r2 r16. si'32 (sol8)~sol16 sol fad mi
   fad8. si,16 dod8.\tr re16 re2

}

IVobIIn = \relative do'' {

   r8
   R1*4
   r2 r8 fad, mi re
   R1*2

   %8
   r2 r8 fad mi re
   r2 r8 dod' si la\mbreak
   r2 r8 dod\p si la

   %11
   r la16\f(sol) fad(mi) fad8 r si16(la) sold(fad) sold8
   r2 r8 sold fad sold
   R1

   %14
   r2 r8 la16. dod32(la4)\mbreak
   r2 r8 la16. dod32(la4)
   r2 r8 si16. re32(si4)

   %17
   R1
   r2 r8 re si r
   r dod la r r2\mbreak

   %20
   r8 dod si la r2
   r8 dod si la r2
   r8 fad' mi re r2

   %23
   r8 mi dod r r mi dod r\mbreak
   R1
   r2 r8 dod la r

   %26
   r2 r8 dod la r
   R1*2
   r2 r8 si la sol

   %30
   r2 r8 si la sol
   r2 r8 mi'~mi16 mi re dod
   re8. si16 mi,8.\tr fad16 fad4 r\mbreak

   %33
   R1
   r2 r8 mi'4 la,8
   la8. sol16 mi8.\tr fad16 fad2

}


IVvlIn = \relative do'' {

   re,16. mi32(
   re8) fad16. sol32(fad8) la16. si32(la8) la, r la'16.\p re32(
   dod8) la16. re32(dod8) la16. re32(dod8) la, r la'16.\f sol'32(
   fad8) fad fad dod16. si'32(la8) la la mi16. sol32(

   %4
   fad8) re16. fad32(mi8) dod16. mi32(re8) sol,4 la,16.\p sol'32(
   fad8) re16. fad32 (mi8) dod16. mi32(re4) r8 re\p
   dod re dod[re] la la' r8 la16.\f re32(

   %7
   dod8) la16. re32(dod8) la16. re32(dod8) sol~sol16. sol32 fad16. mi32
   fad16. fad32 mi16. re32 la'8 la, re4 r8 re\p
   dod re dod[re] la la' r la\pp \mbreak

   %10
   la la la dod, re la' r la\p
   re,4 r8 si mi4 r8 re
   dod re sold,[la] mi' mi r si'16.\f re32

   %13
   (dod8) dod la' dod,16. mi32(re8) re si' re,16.\p fad32(
   mi8) si16. re32(dod8) sold16. si32(la4) r8 la,\p\mbreak
   la la la la re la' r la

   %16
   dod, re la[la] lad si r8 fad''16.\f si32(
   lad8) lad lad fad16. si32(mi,8) mi mi dod16. sol'!32(
   fad8) re16. fad32(mi8) dod16. mi32(re4) r16 si [mi16. re32]

   %19
   dod4 r16 la [re16. dod32] si16.[re32(dod16.) mi32](re16.)[fad32(mi16.) sol32](\mbreak
   fad8) mi r8 la,\p la la la la
   re, la' r la dod, dod la la

   %22
   dod re r re sol sol sol,[sol']
   la la la re, la' la la re,\mbreak
   la' la re,[re] la la' r re,16.\f mi32(

   %25
   re8) fad16. sol32(fad8) la16. si32(la8) la, r la'16.\p re32(
   dod8) la16. re32(dod8) la16. re32(dod8) la, r  dod16.\p la32(
   re8) re re mi16. sol32(fad8) fad fad sol16. si32(\mbreak

   %28
   la8) si sol[la] fad sol4\pp mi16. sol32(
   fad8) re16. fad32(mi8) dod16. mi32(re2)~
   re1~

   %31
   re2~re8 sol'\f~ sol16 sol fad mi
   fad8. mi16 dod8.\tr re16 re4  r8 re,16. re'32(\mbreak
   do8) do do re,16. do'32(si8) si si re,16. si'32(

   %34
   la8) fad16. la32(sol8) mi16. sol32 fad16. si'32(sol8)~sol16 sol fad mi
   fad8. si,16 dod8.\tr re16 re2

}

IVvlIIn = \relative do'' {

   re,16. mi32(
   re8) fad16. sol32(fad8) la16. si32(la8) la, r la'16.\p re32(
   dod8) la16. re32(dod8) la16. re32(dod8) la, r la'16.\f sol'32(
   fad8) fad fad dod16. si'32(la8) la la mi16. sol32(

   %4
   fad8) re16. fad32(mi8) dod16. mi32(re8) sol,4 la,16.\p sol'32(
   fad8) re16. fad32 (mi8) dod16. mi32(re4) r8 re\p
   dod re dod[re] la la' r8 la16.\f re32(

   %7
   dod8) la16. re32(dod8) la16. re32(dod8) sol~sol16. sol32 fad16. mi32
   fad16. fad32 mi16. re32 la'8 la, re4 r8 re\p
   dod re dod[re] la la' r la\pp \mbreak

   %10
   la la la dod, re la' r la\p
   re,4 r8 si mi4 r8 re
   dod re sold,[la] mi' mi r si'16.\f re32

   %13
   (dod8) dod la' dod,16. mi32(re8) re si' re,16.\p fad32(
   mi8) si16. re32(dod8) sold16. si32(la4) r8 la,\p\mbreak
   la la la la re la' r la

   %16
   dod, re la[la] lad si r8 fad''16.\f si32(
   lad8) lad lad fad16. si32(mi,8) mi mi dod16. sol'!32(
   fad8) re16. fad32(mi8) dod16. mi32(re4) r16 si [mi16. re32]

   %19
   dod4 r16 la [re16. dod32] si16.[re32(dod16.) mi32](re16.)[fad32(mi16.) sol32](\mbreak
   fad8) mi r8 la,\p la la la la
   re, la' r la dod, dod la la

   %22
   dod re r re sol sol sol,[sol']
   la la la re, la' la la re,\mbreak
   la' la re,[re] la la' r re,16.\f mi32(

   %25
   re8) fad16. sol32(fad8) la16. si32(la8) la, r la'16.\p re32(
   dod8) la16. re32(dod8) la16. re32(dod8) la, r  dod16.\p la32(
   re8) re re mi16. sol32(fad8) fad fad sol16. si32(\mbreak

   %28
   la8) si sol[la] fad sol4\pp mi16. sol32(
   fad8) re16. fad32(mi8) dod16. mi32(re2)~
   re1~

   %31
   re2~re8 sol'\f~ sol16 sol fad mi
   fad8. mi16 dod8.\tr re16 re4  r8 re,16. re'32(\mbreak
   do8) do do re,16. do'32(si8) si si re,16. si'32(

   %34
   la8) fad16. la32(sol8) mi16. sol32 fad16. si'32(sol8)~sol16 sol fad mi
   fad8. si,16 dod8.\tr re16 re2

}

IVvlaIn = \relative do'' {

   re,16. mi32(
   re8) fad16. sol32(fad8) la16. si32(la8) la, r la'16.\p re32(
   dod8) la16. re32(dod8) la16. re32(dod8) la, r la'\f
   la la la[dod] re re re[re]

   %4
   dod re si[la] la mi4\p dod8\mbreak
   re re si[la] la4 r8 re\p
   dod re dod[re] la la' r8 la16.\f re32(

   %7
   dod8) la16. re32(dod8) la16. re32(dod8) sol~sol16. sol32 fad16. mi32
   fad16. fad32 mi16. re32 la'8 la, re4 r8 re\p
   dod re dod[re] la la' r la\pp \mbreak

   %10
   la la la dod, re la' r la\p
   re,4 r8 si mi4 r8 re
   dod re sold,[la] mi' mi r sold16.\f si32(

   %13
   la8) la dod la16. dod32(sold8) sold re' sold,16.\p sold32(
   la8) la la[mi] mi4 r8 la,\p
   la la la la re la' r la

   %16
   dod, re la[la] lad si r8 si'16.\f re32(
   dod8) dod dod si16. re32(dod8) dod dod[lad]
   si si16. re32(dod8) lad16. dod32(si4) r8 si

   %19
   la!4 r8 la sol sol fad[mi']\mbreak
   re dod r la\p la la la la
   re, la' r la dod, dod la la

   %22
   dod re r re sol sol sol,[sol']
   la la la re, la' la la re,\mbreak
   la' la re,[re] la la' r re,16.\f mi32(

   %25
   re8) fad16. sol32(fad8) la16. si32(la8) la, r la'16.\p re32(
   dod8) la16. re32(dod8) la16. re32(dod8) la, r  dod16.\p la32(
   re8) re re mi16. sol32(fad8) fad fad sol16. si32(\mbreak

   %28
   la8) si sol[la] fad mi4\pp dod16. mi32(
   re8) re si[dod] re2~
   re1~

   %31
   re2~re8 mi'\f~mi16 mi re dod
   re8 si la[la] la4 r8 re,16. re'32(\mbreak
   do8) do do re,16. do'32(si8) si si re,16. si'32(

   %34
   la8) fad16. la32(sol8) mi16. sol32 (fad8) la4 la8
   la si la[la] la2

}

IVvlaIIn = \relative do' {

   re16. mi32(
   re8) fad16. sol32(fad8) la16. si32(la8) la, r la'16.\p re32(
   dod8) la16. re32(dod8) la16. re32(dod8) la, r8 mi'16.\f dod32(
   re8) re re sol16. dod32(la8) la la [si]

   %4
   dod fad,16. la32(sol8) mi16.(sol32) fad8 la,4\p la8\mbreak
   la re, sol[mi] fad4 r8 re'\p
   dod re dod[re] la la' r8 la16.\f re32(

   %7
   dod8) la16. re32(dod8) la16. re32(dod8) sol~sol16. sol32 fad16. mi32
   fad16. fad32 mi16. re32 la'8 la, re4 r8 re\p
   dod re dod[re] la la' r la\pp \mbreak

   %10
   la la la dod, re la' r la\p
   re,4 r8 si mi4 r8 re
   dod re sold,[la] mi' mi r mi16. sold32(

   %13
   mi8) mi mi mi16. dod32(re8) re sold sold16.\p re32(
   mi8) fad mi si16. re32(dod4) r8 la\p
   la la la la re la' r la

   %16
   dod, re la[la] lad si r8 fad'
   fad fad fad[fad] lad lad lad[fad]
   fad sol sol[fad] fad4 r8 mi

   %19
   mi4 r8 re re sol re[la']\mbreak
   la la r la\p la la la la
   re, la' r la dod, dod la la

   %22
   dod re r re sol sol sol,[sol']
   la la la re, la' la la re,\mbreak
   la' la re,[re] la la' r re,16.\f mi32(

   %25
   re8) fad16. sol32(fad8) la16. si32(la8) la, r la'16.\p re32(
   dod8) la16. re32(dod8) la16. re32(dod8) la, r dod16.\p la32(
   re8) re re mi16. sol32(fad8) fad fad sol16. si32(\mbreak

   %28
   la8) si sol[la] fad la,4\pp la16. dod32(
   la8) re, sol mi16. sold32(fad4) r
   R1

   %31
   r2 r8 la'\f dod la
   la8. sol16 mi8. fad16 fad4 r8 re16. re'32(\mbreak
   do8) do do re,16. do'32(si8) si si re,16. si'32(

   %34
   la8) fad16. la32(sol8) mi16. sol32 (fad8) mi4 dod8\mbreak
   re8. mi16 mi8. fad16 fad2

}

IVbcn = \relative do {

   re16. mi32(
   re8) fad16. sol32(fad8) la16. si32(la8) la, r la'16.\p re32(
   dod8) la16. re32(dod8) la16. re32(dod8) la, r dod16.\f la32(
   re8) re re mi16. sol32(fad8) fad fad sol16. si32(

   %4
   la8) si sol[la] fad dod4\p la8\mbreak
   re si sol[la] re,4 r
   r2 r4 r8 la''16.\f re32(

   %7
   dod8) la16. re32(dod8) la16. re32(dod8) sol~sol16. sol32 fad16. mi32
   fad16. fad32 mi16. re32 la'8 la, re4 r
   R1*3

   %12
   r2 r4 r8 mi
   la, la la la' si, si si si'\p
   dod, re mi[mi,] la4 r\mbreak

   %15
   R1
   r2 r4 r8 re16.\f si32
   (fad'8) fad fad re16. si32(fad'8) fad fad[mi]

   %18
   re sol dod,[fad] si,4 r8 sol'
   la4 r8 fad sol la si[dod]\mbreak
   re la r4 r2

   %21
   r8 la_\markup\italic"Bassoni" sold la r2
   r8 re dod re r2
   r8 la la, r r la' la, r\mbreak

   %24
   r2 r4 r8 re16. mi32(
   re8) fad16. sol32(fad8) la16. si32(la8) la, r la'16.\p re32(
   dod8) la16. re32(dod8) la16. re32(dod8) la, r4

   %27
   R1\mbreak
   r2 r8 dod4\pp la8
   re si sol[la] re,4 r

   %30
   R1
   r2 r8 dod''\f mi la,
   re sol, la[la,] re4 r8 re16. re'32(\mbreak

   %33
   do8) do do re,16. do'32(si8) si si re,16. si'32(
   la8) fad16. la32(sol8) mi16. sol32(fad8) dod4 la8
   re sol, la4 re,2

}

IVbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key re\major
  \time 4/4
  \partial 8 s8
  \tempo 4 = 50
  s1*35
  \bar"|."

}

IVflI = {
  \IVglobal
  \notypeset
  <<\IVflIn \forma>>

}

IVflII = {
  \IVglobal
  <<\IVflIIn \forma>>

}

IVobI = {
  \IVglobal
  <<\IVobIn \forma>>

}

IVobII = {
  \IVglobal
  <<\IVobIIn \forma>>

}

IVvlI = {
  \IVglobal
  <<\IVvlIn \forma>>

}

IVvlII = {
  \IVglobal
  <<\IVvlIIn \forma>>

}


IVvlaI = {
  \IVglobal
  %\clef soprano
  <<\IVvlaIn \forma>>

}


IVvlaII = {
  \IVglobal
  \clef alto
  <<\IVvlaIIn \forma>>

}


IVbc = {
  \IVglobal
  \clef bass
  << \IVbcn \forma \IVbfn >>
  \typeset

}

Vglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}



VflIn = \relative do'' {

  re,4 re
  re re' re, re
  re fad' re, re
  re la'' la,8(dod) mi[(sol)]

  %4
  fad4 mi la2~
  la1~
  la2\appoggiatura mi8 dod4 re

  %7
  mi dod8[(re)] mi(fad) sol4
  sol\tr(fad) si2~
  si1~\mbreak

  %10
  si2 \appoggiatura fad8 red4 mi
  fad red8(mi) fad](sold)] la4
  la(sold) la dod,

  %13
  mi,8(sold) si[(re)] dod4 la'
  mi,8(re') sold[(si)] mi,4 la
  mi,8(sold) si[(re)] mi,(dod') mi[(la)]

  %16
  mi,(re') sold(si) sold(mi) sold(mi)
  la4 mi dod si8 la
  la2\mbreak la4 la

  %19
  la dod la la
  la mi' la, la
  la la' mi,8(sold) si(re)

  %22
  dod4 la mi'2~
  mi1~
  mi2 \appoggiatura fad8 si,4 lad

  %25
  si dod8 (re) dod(re) mi(dod)
  re4 si la'2~
  la1~\mbreak

  %28
  la2 \appoggiatura si8 red,4 fad
  mi fad8(sol) fad(sol) la(fad)
  sol4 mi sol si,

  %31
  la8(dod) mi(sol) fad4 la,
  sol8(si) re(fad) mi4 sol,
  fad8(lad) dod[(mi)] fad,(si) re[(fad)]

  %34
  fad,(lad) dod[(mi)] sol(mi) lad[(fad)]
  si4 fad re dod8 si\mbreak
  si2 r

  %37
  R1
  r2 fad'4 fad
  fad8 la sol(fad) si4 sol

  %40
  mi8(re) dod(re) mi4 mi
  mi8(sol) fad(mi) la4 fad
  re8(la') sol(fad) si4 sol

  %43
  mi re8(dod) re(mi) fad(sol)
  fad4 mi re, re
  re re' re, re

  %46
  re fad' re,\p re\mbreak
  re la'' la,8(dod) mi[(sol)]
  fad4 re fad2~

  %49
  fad1~
  fad2 \appoggiatura la8 do,4 si
  la sol' la,8(do) si(la)

  %52
  si4 sol sold'2~
  sold?1~
  sold?2 \appoggiatura si8 re,4 dod!\mbreak

  %55
  si4 la' si,8(re) dod(si)
  dod4 la8 dod sol'!4 fad
  mi,8(la) dod[(mi)]re,(la') fad'[(la)]

  %58
  la,(dod) mi[(sol)] re,(fad) la[(fad')]
  dod,(mi) la[(dod)] mi(sol) si[(sol)]
  la4 re, fad mi8(re)

  %61
  re2

}

VflIIn = \relative do'' {

  re,4 re
  re re' re, re
  re fad' re, re
  re la'' la,8(dod) mi[(sol)]

  %4
  fad4 mi dod2~
  dod1~
  dod2\appoggiatura dod8 la4 si

  %7
  dod la8(si) dod[(re)] mi4
  mi\tr(re) \once\tieDashed re2~
  re1~\mbreak

  %10
  re2 \appoggiatura red8 si4 dod
  red si8(dod) red[(mi)] fad4
  fad\tr(mi) la dod,4

  %13
  mi,8(sold) si[(re)] dod4 la'
  mi,8(re') sold[(si)] mi,4 la
  mi,8(sold) si[(re)] mi,(dod') mi[(la)]

  %16
  mi,(re') sold(si) sold(mi) sold(mi)
  la4 mi dod si8 la
  la2\mbreak la4 la

  %19
  la dod la la
  la mi' la, la
  la la' mi,8(sold) si(re)

  %22
  dod4 la dod2~
  dod1~
  dod2 \appoggiatura fad8 si,4 lad

  %25
  si dod8 (re) dod(re) mi(dod)
  re4 si fad'2~
  fad1~\mbreak

  %28
  fad2 \appoggiatura si8 red,4 fad
  mi fad8(sol) fad(sol) la(fad)
  sol4 mi sol si,

  %31
  la8(dod) mi(sol) fad4 la,
  sol8(si) re(fad) mi4 sol,
  fad8(lad) dod[(mi)] fad,(si) re[(fad)]

  %34
  fad,(lad) dod[(mi)] sol(mi) lad[(fad)]
  si4 fad re dod8 si\mbreak
  si2 r

  %37
  R1
  r2 re4 re
  re8(fad) mi(re) sol4 mi

  %40
  dod8(si) la(si) dod4 dod
  la8(mi') re(dod) fad4 re
  si8(fad') mi(re) sol4 mi

  %43
  dod la8(dod) la(dod) re(mi)
  re4 dod re, re
  re re' re, re

  %46
  re fad' re,\p re\mbreak
  re la'' la,8(dod) mi[(sol)]
  fad4 re la2~

  %49
  la1~
  la2 \appoggiatura la'8 do,4 si
  la sol' la,8(do) si(la)

  %52
  si4 sol si2~
  si1~
  si2 \appoggiatura si'8 re,4 dod!\mbreak

  %55
  si4 la' si,8(re) dod(si)
  dod4 la8 dod sol'!4 fad
  mi,8(la) dod[(mi)]re,(la') fad'[(la)]

  %58
  la,(dod) mi[(sol)] re,(fad) la[(fad')]
  dod,(mi) la[(dod)] mi(sol) si[(sol)]
  la4 re, fad mi8(re)

  %61
  re2

}

VobIn = \relative do'' {

  re,4 re
  re re' re, re
  re fad' re, re
  re la'' la,8(dod) mi[(sol)]

  %4
  fad4 mi r la
  r mi r dod
  r la \appoggiatura mi'8 dod4 re

  %7
  mi dod8[(re)] mi(fad) sol4
  sol\tr(fad) r si
  r  fad r re\mbreak

  %10
  r si \appoggiatura fad'8 red4 mi
  fad red8(mi) fad](sold)] la4
  la(sold) la dod,

  %13
  mi,8(sold) si[(re)] dod4 la'
  mi,8(re') sold[(si)] mi,4 la
  mi,8(sold) si[(re)] mi,(dod') mi[(la)]

  %16
  mi,(re') sold(si) sold(mi) sold(mi)
  la4 mi dod si8 la
  la2\mbreak la4 la

  %19
  la dod la la
  la mi' la, la
  la la' mi,8(sold) si(re)

  %22
  dod4 la r sol'
  r mi r dod
  r lad \appoggiatura fad'8 si,4 lad

  %25
  si dod8 (re) dod(re) mi(dod)
  re4 si r la'
  r fad r red\mbreak

  %28
  r si  \appoggiatura si'8 red,4 fad
  mi fad8(sol) fad(sol) la(fad)
  sol4 mi sol si,

  %31
  la8(dod) mi(sol) fad4 la,
  sol8(si) re(fad) mi4 sol,
  fad8(lad) dod[(mi)] fad,(si) re[(fad)]

  %34
  fad,(lad) dod[(mi)] sol(mi) lad[(fad)]
  si4 fad re dod8 si\mbreak
  si2 fad'4 fad

  %37
  fad sol8(fad) mi(re) dod(fad)
  re(dod) si4 r2
  R1*5

  %44
  r2 re,4 re
  re re' re, re

  %46
  re fad' re,\p re\mbreak
  re la'' la,8(dod) mi[(sol)]
  fad4 re r la'

  %49
  r fad r do
  r la \appoggiatura la'8 do,4 si
  la sol' la,8(do) si(la)

  %52
  si4 sol r si'
  r sold r re
  r si  \appoggiatura si'8 re,4 dod!\mbreak

  %55
  si4 la' si,8(re) dod(si)
  dod4 la8 dod sol'!4 fad
  mi,8(la) dod[(mi)]re,(la') fad'[(la)]

  %58
  la,(dod) mi[(sol)] re,(fad) la[(fad')]
  dod,(mi) la[(dod)] mi(sol) si[(sol)]
  la4 re, fad mi8(re)

  %61
  re2

}

VobIIn = \relative do'' {

  re,4 re
  re re' re, re
  re fad' re, re
  re re' dod dod

  %4
  re dod r dod
  r dod r la
  r dod, \appoggiatura dod'8 la4 si

  %7
  dod la8(si) dod[(re)] mi4
  \once\slurDashed mi\tr (re) r re
  r re r si\mbreak

  %10
  r re, \appoggiatura red'8 si4 dod
  red si8(dod) red[(mi)] fad4
  fad\tr(mi) la, la

  %13
  si sold la la
  sold si la dod
  si sold la la

  %16
  sold si8(sold) si(sold) si(sold)
  la4 la la sold
  mi2 \mbreak mi4 mi

  %19
  mi la mi mi
  mi dod' mi, mi
  mi la sold sold

  %22
  la mi r mi'
  r dod r lad
  r fad fad fad

  %25
  si si si lad
  si fad r fad'
  r red r si\mbreak

  %28
  r red, \appoggiatura si''8 red,4 fad
  mi fad8(sol) fad(sol) la(fad)
  sol4 mi sol si,

  %31
  la8(dod) mi(sol) fad4 la,
  sol8(si) re(fad) mi4 sol,
  fad8(lad) dod[(mi)] fad,(si) re[(fad)]

  %34
  fad,(lad) dod[(mi)] sol(mi) lad[(fad)]
  si4 fad re dod8 si\mbreak
  si2 re4 re

  %37
  re mi8(re) dod[(si)] lad4
  si8(lad) si4 r2
  R1*5

  %44
  r2 re,4 re
  re re' re, re

  %46
  re fad' re,\p re\mbreak
  re re' dod dod
  re fad,r4 do'

  %49
  r la r la
  r fad la sol
  fad sol fad8(la) sol(fad)

  %52
  sol4 re r re'
  r si r si
  r sold si la\mbreak

  %55
  sold la sold8(si) la(sold)
  la4 mi la la
  mi la la la

  %68
  la la la fad
  mi mi r dod'
  la fad la la

  %61
  fad2

}


VvlIn = \relative do'' {

  re,4 re
  re re' re, re
  re fad' re, re
  re la'' la,8(dod) mi[(sol)]

  %4
  fad4 mi la8(dod,4.)
  mi8(la,4.) dod8(mi,4.)
  la8(la,4.) \appoggiatura mi''8 dod4 re

  %7
  mi dod8[(re)] mi(fad) sol4
  sol\tr(fad) si8(re,4.)
  fad8(si,4.) re8(fad,4.)\mbreak

  %10
  si8(si,4.) \appoggiatura fad''8 red4 mi
  fad red8(mi) fad](sold)] la4
  la(sold) la dod,

  %13
  mi,8(sold) si[(re)] dod4 la'
  mi,8(re') sold[(si)] mi,4 la
  mi,8(sold) si[(re)] mi,(dod') mi[(la)]

  %16
  mi,(re') sold(si) sold(mi) sold(mi)
  la4 mi dod si8 la
  la2\mbreak la4 la

  %19
  la dod la la
  la mi' la, la
  la la' mi,8(sold) si(re)

  %22
  dod4 la sol'8(mi4.)
  sol8(dod,4.) mi8(lad,4.)
  dod8(fad,4.)\appoggiatura fad'8 si,4 lad

  %25
  si dod8 (re) dod(re) mi(dod)
  re4 si si'8(fad4.)
  si8(red,4.) fad8(si,4.)\mbreak

  %28
  red8(fad,4.) \appoggiatura si'8 red,4 fad
  mi fad8(sol) fad(sol) la(fad)
  sol4 mi sol si,

  %31
  la8(dod) mi(sol) fad4 la,
  sol8(si) re(fad) mi4 sol,
  fad8(lad) dod[(mi)] fad,(si) re[(fad)]

  %34
  fad,(lad) dod[(mi)] sol(mi) lad[(fad)]
  si4 fad re dod8 si\mbreak
  si2 r

  %37
  R1
  r2 si4\p la
  sol2 r4 sol

  %40
  la la, la' sol
  fad2 r4 fad
  sol2 r4 sol

  %43
  la8(sol) fad(sol) fad(mi) re(dod)
  re4 la re\f re
  re re' re, re

  %46
  re fad' re,\p re\mbreak
  re la'' la,8(dod) mi[(sol)]
  fad4 re la'8(do,4.)

  %49
  mi8(la,4.) do8(fad,4.)
  la8(re,4.) \appoggiatura la''8 do,4 si
  la sol' la,8(do) si(la)

  %52
  si4 sol si'8(re,4.)
  sold8(si,4.) re8(sold,4.)
  si8(mi,4.) \appoggiatura si''8 re,4 dod\mbreak

  %55
  si4 la' si,8(re) dod(si)
  dod4 la8 dod sol'!4 fad
  mi,8(la) dod[(mi)]re,(la') fad'[(la)]

  %58
  la,(dod) mi[(sol)] re,(fad) la[(fad')]
  dod,(mi) la[(dod)] mi(sol) si[(sol)]
  la4 re, fad mi8(re)

  %61
  re2

}

VvlIIn = \relative do'' {

  re,4 re
  re re' re, re
  re fad' re, re
  re la'' la,8(dod) mi[(sol)]

  %4
  fad4 mi la8(dod,4.)
  mi8(la,4.) dod8(mi,4.)
  la8(la,4.) \appoggiatura mi''8 dod4 re

  %7
  mi dod8[(re)] mi(fad) sol4
  sol\tr(fad) si8(re,4.)
  fad8(si,4.) re8(fad,4.)\mbreak

  %10
  si8(si,4.) \appoggiatura fad''8 red4 mi
  fad red8(mi) fad](sold)] la4
  la(sold) la dod,

  %13
  mi,8(sold) si[(re)] dod4 la'
  mi,8(re') sold[(si)] mi,4 la
  mi,8(sold) si[(re)] mi,(dod') mi[(la)]

  %16
  mi,(re') sold(si) sold(mi) sold(mi)
  la4 mi dod si8 la
  la2\mbreak la4 la

  %19
  la dod la la
  la mi' la, la
  la la' mi,8(sold) si(re)

  %22
  dod4 la sol'8(mi4.)
  sol8(dod,4.) mi8(lad,4.)
  dod8(fad,4.)\appoggiatura fad'8 si,4 lad

  %25
  si dod8 (re) dod(re) mi(dod)
  re4 si si'8(fad4.)
  si8(red,4.) fad8(si,4.)\mbreak

  %28
  red8(fad,4.) \appoggiatura si'8 red,4 fad
  mi fad8(sol) fad(sol) la(fad)
  sol4 mi sol si,

  %31
  la8(dod) mi(sol) fad4 la,
  sol8(si) re(fad) mi4 sol,
  fad8(lad) dod[(mi)] fad,(si) re[(fad)]

  %34
  fad,(lad) dod[(mi)] sol(mi) lad[(fad)]
  si4 fad re dod8 si\mbreak
  si2 r

  %37
  R1
  r2 si4\p la
  sol2 r4 sol

  %40
  la la, la' sol
  fad2 r4 fad
  sol2 r4 sol

  %43
  la8(sol) fad(sol) fad(mi) re(dod)
  re4 la re\f re
  re re' re, re

  %46
  re fad' re,\p re\mbreak
  re la'' la,8(dod) mi[(sol)]
  fad4 re la'8(do,4.)

  %49
  mi8(la,4.) do8(fad,4.)
  la8(re,4.) \appoggiatura la''8 do,4 si
  la sol' la,8(do) si(la)

  %52
  si4 sol si'8(re,4.)
  sold8(si,4.) re8(sold,4.)
  si8(mi,4.) \appoggiatura si''8 re,4 dod\mbreak

  %55
  si4 la' si,8(re) dod(si)
  dod4 la8 dod sol'!4 fad
  mi,8(la) dod[(mi)]re,(la') fad'[(la)]

  %58
  la,(dod) mi[(sol)] re,(fad) la[(fad')]
  dod,(mi) la[(dod)] mi(sol) si[(sol)]
  la4 re, fad mi8(re)

  %61
  re2

}

VvlaIn = \relative do'' {

  la,4 la
  la la' la, la
  la re' la, la
  la re' dod dod

  %4
  re dod r dod
  r dod r dod
  r dod \appoggiatura dod8 la4 si

  %7
  dod la8(si) dod[(re)] mi4
  mi\tr(re) r re
  r re r re\mbreak

  %10
  r re \appoggiatura red8 si4 dod
  red si8 dod red4 red
  red?(mi) la, la

  %13
  si sold la la
  sold si la dod
  si sold la la

  %16
  sold si8(sold) si(sold) si(sold)
  la4 la la sold
  mi2 \mbreak mi4 mi

  %19
  mi la mi mi
  mi dod' mi, mi
  mi la sold sold

  %22
  la mi r lad
  r lad? r lad
  r lad? fad fad

  %25
  si si si   lad
  si fad r red'
  r red? r red\mbreak

  %28
  r red r red
  mi mi mi red
  mi si si sol

  %31
  la la la fad
  sol sol sol mi
  fad lad si si

  %34
  dod lad r dod
  si si si lad\mbreak
  fad2 r

  %37
  R1
  r2 si4\p la
  sol2 r4 sol

  %40
  la la, la' sol
  fad2 r4 fad
  sol2 r4 sol

  %43
  la8(sol) fad(sol) fad(mi) re(dod)
  re4 la la\f la
  la la' la, la

  %46
  la re' la,\p la\mbreak
  la re' dod dod
  re la r do

  %49
  r do? r do
  r do? la sol
  fad sol fad8(la) sol(fad)

  %52
  sol4 re r re'
  r re r re
  r re si la\mbreak

  %55
  sold la sold8(si) la(sold)
  la4 mi la la
  mi la la la

  %68
  la la la fad
  mi mi r dod'
  la fad la la

  %61
  la2

}

VvlaIIn = \relative do' {

  fad,4 fad
  fad fad' fad, fad
  fad la' fad, fad
  fad la' la la

  %4
  la la r mi
  r mi r mi
  r mi r la

  %7
  la mi la dod
  la la r fad
  r fad r fad\mbreak

  %10
  r fad r si
  si fad si si
  si si mi, mi

  %13
  mi mi mi mi
  si mi mi mi
  mi mi mi mi

  %16
  mi mi r mi
  mi dod mi mi
  dod2\mbreak dod4 dod

  %19
  dod mi dod dod
  dod la' dod, dod
  dod mi si mi

  %22
  mi dod r dod
  r dod r dod
  r dod si dod

  %25
  fad mi sol fad
  fad re r fad
  r fad r fad\mbreak

  %28
  r fad r si
  si la do si
  si sol mi mi

  %31
  mi dod re re
  re si dod dod
  dod fad fad fad

  %34
  fad fad r fad
  fad fad fad fad\mbreak
  fad2 r

  %37
  R1
  r2 si4\p la
  sol2 r4 sol

  %40
  la la, la' sol
  fad2 r4 fad
  sol2 r4 sol

  %43
  la8(sol) fad(sol) fad(mi) re(dod)
  re4 la fad\f fad
  fad fad' fad, fad

  %46
  fad la' fad, fad\mbreak
  fad la' la la
  la fad r la

  %49
  r la r la
  r la re, re
  re re re re

  %52
  re si r si'
  r si r si
  r si mi, mi\mbreak

  %55
  mi mi mi mi
  mi dod mi re
  dod mi re re

  %58
  mi dod re la
  la dod r mi
  re re re dod

  %61
  fad2

}

Vbcn = \relative do {

  re4 re,
  re'2 re4 re,
  re'2 re4 re,
  re' fad la la,

  %4
  re la' r la
  r la, r la'
  r la, r la'

  %7
  la la, la' la
  re, re, r si''
  r si, r si'\mbreak

  %10
  r si, r si'
  si si, si' si
  mi, mi8 re dod4 la

  %13
  sold' mi la dod,
  mi re dod la
  sold' mi la dod,

  %16
  mi mi, r re'
  dod la mi' mi,
  la2\mbreak la'4la,

  %19
  la'2 la4 la,
  la'2 la4 la,
  la' dod,4 mi mi,

  %22
  la la' r fad
  r fad, r fad'
  r fad,8 mi' re4 fad

  %25
  re sol mi fad
  si, si' r si
  r si, r si'\mbreak

  %28
  r si, r la'
  sol do la si
  mi, mi, mi' re

  %31
  dod la re dod
  si sol dod si
  lad fad re' si

  %34
  lad' fad r mi
  re si fad' fad,\mbreak
  <<
    {
      si^\markup\italic"Bassone" si' si, re

      %37
      fad fad, r fad'
      si si, r2
    }\\{
      si2 r
      R1*2
    }
  >>
  R1*5

  %44
  r2 re4\tu re,
  re'2 re4 re,
  re'2 re4 re,\mbreak

  %47
  re' fad la la,
  re re, r re'
  r re, r re'

  %50
  r re, fad' sol
  re si re re,
  sol sol' r mi

  %53
  r mi, r mi'
  r mi, sold' la\mbreak
  mi4 dod mi mi,

  %56
  la la' dod, re
  la' sol fad re
  dod la fad' re

  %59
  la' la, r sol'
  fad si la la,
  re2

}

Vbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key re\major
  \time 2/2
  \tempo 1 = 50
  \partial 2 s2
  s1*17
  s2
  \bar":..:"\break
  s
  s1*42
  s2
  \bar":|."

}

VflI = {
  \Vglobal
  \notypeset
  <<\VflIn \forma>>

}

VflII = {
  \Vglobal
  <<\VflIIn \forma>>

}

VobI = {
  \Vglobal
  <<\VobIn \forma>>

}

VobII = {
  \Vglobal
  <<\VobIIn \forma>>

}

VvlI = {
  \Vglobal
  <<\VvlIn \forma>>

}

VvlII = {
  \Vglobal
  <<\VvlIIn \forma>>

}


VvlaI = {
  \Vglobal
  %\clef soprano
  <<\VvlaIn \forma>>

}


VvlaII = {
  \Vglobal
  \clef alto
  <<\VvlaIIn \forma>>

}


Vbc = {
  \Vglobal
  \clef bass
  << \Vbcn \forma \Vbfn >>
  \typeset

}

VIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}



VIflIn = \relative do'' {

  re,4 fad'
  sol(fad) re, la''
  si(la) re,, fad'
  sol fad mi re

  %4
  dod8 si la4 r2
  R1
  r2 si'4 si

  %7
  si si si la
  la\tr(sold) r la
  sold (sold sold) sold\mbreak

  %10
  la(la la) la
  re, dod re dod
  re si'2 sold4

  %13
  la4. fad8 sold2\tr
  la la4 dod,
  re(dod) r2

  %16
  r la'4 fad
  sol fad sol fad
  fad(mi) r2

  %19
  R1\mbreak
  r2 re'4 re
  re re re do

  %22
  do?(si) r si
  la(la la) sold
  la(la la) sold

  %25
  la la, la' re
  dod8(re) dod2 dod4
  re4. si8 dod2

  %28
  re

}

VIflIIn = \relative do'' {

  re,4 re'
  mi(re) re, fad'
  sol(fad) re, re'
  mi re si\tr sold

  %4
  la8 sold la4 r2
  R1
  r2 red4 mi

  %7
  fad red mi fad
  fad(mi) r4 dod
  si(si si) si\mbreak

  %10
  dod(dod dod) dod
  si la si la
  si re2 mi4

  %13
  dod4. re8 si2
  dod dod4 la
  si(la) r2

  %16
  r dod4 re
  mi re mi re
  re(dod) r2

  %19
  R1\mbreak
  r2 fad4 sol
  la fad sol la

  %22
  la(sol) r si,
  dod la(la) re
  dod la(la) re

  %25
  dod la dod fad
  mi8 (fad) mi2 mi4
  re4. sol8 mi2

  %28
  re

}

VIobIn = \relative do'' {

  r2
  R1*3
  r2 la'4 la
  la la la sol

  %6
  sol\tr(fad) r2
  R1
  r4 re si dod

  %9
  re re fad re\mbreak
  dod dod mi dod
  si dod si dod

  %12
  si re fad mi
  dod4. re8 si2
  la r

  %15
  r la'4 mi
  fad(mi) r2
  R1

  %18
  r2 la4 la
  la la la sol\mbreak
  sol\tr(fad) r2

  %21
  R1
  r4 si sol fad
  mi fad mi re

  %24
  mi fad mi re
  mi fad mi fad
  sol8(fad) sol2 sol4

  %27
  fad4. sol8 mi2
  re

}

VIobIIn = \relative do'' {

  r2
  R1*3
  r2 dod4 re
  mi dod re mi

  %6
  mi\tr(re) r2
  R1
  r4 si sold la

  %9
  si si re si\mbreak
  la la dod la
  sold la sold la

  %12
  sold? si2 si4
  la4. si8 si4 sold
  mi2 r

  %15
  r dod'4 dod
  re(dod) r2
  R1

  %18
  r2 dod4 re
  mi dod re mi\mbreak
  mi\tr(re) r2

  %21
  R1
  r4 sol mi re
  dod re dod si

  %24
  dod re dod si
  dod re dod re
  mi8(re) mi2 dod4

  %27
  la si la2
  fad

}


VIvlIn = \relative do'' {

  re,4 re'
  dod(re) re, re'
  dod(re) re, re'
  dod re sol, mi

  %4
  la la, r2
  R1
  r2 si4 dod

  %7
  red si dod red
  mi mi r mi8(fad)
  mi4 mi mi mi8(fad)\mbreak

  %10
  mi4 mi mi mi8(fad)
  mi4 mi8(fad) mi4 mi8(fad)
  mi2 r4 mi

  %13
  la re, mi mi
  la,2 la4 la'
  sold(la) r2

  %16
  r la,4 re
  dod re dod re
  la la' r2

  %19
  R1\mbreak
  r2 re,4 mi
  fad re mi fad

  %22
  sol sol, r si'
  dod la r re
  dod la r re

  %25
  dod r r re
  la la8(si) la4 la
  re sol, la la,

  %28
  re2

}


VIbcn = \relative do {

  r2
  R1*3
  r2 la'4 si
  dod la si dod

  %6
  re re, r2
  R1
  r4 mi' mi, mi'

  %9
  mi,2 r4 mi'\mbreak
  mi,2 r4 mi'
  mi, mi' mi, mi'

  %12
  mi, mi' sold, mi
  la re, mi mi,
  la2 r

  %15
  r la4 la'
  sold(la) r2
  R1

  %18
  r2 la4 si
  dod la si dod\mbreak
  re re, r2

  %21
  R1
  r2 r4 sol
  la la, r la'

  %24
  la la, r la'
  la la, la' la,
  la' la, 2 la'4

  %27
  re sol, la la,
  re2

}

VIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key re\major
  \time 2/2
  \tempo 1 = 60
  \partial 2 s2
  s1*13
  s2
  \bar":..:"\break
  s
  s1*13
  s2
  \bar":|."

}

VIflI = {
  \VIglobal
  \notypeset
  <<\VIflIn \forma>>

}

VIflII = {
  \VIglobal
  <<\VIflIIn \forma>>

}

VIobI = {
  \VIglobal
  <<\VIobIn \forma>>

}

VIobII = {
  \VIglobal
  <<\VIobIIn \forma>>

}

VIvlI = {
  \VIglobal
  <<\VIvlIn \forma>>

}


VIbc = {
  \VIglobal
  \clef bass
  << \VIbcn \forma \VIbfn >>
  \typeset

}

VIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}



VIIflIn = \relative do'' {

  la4 re16(dod8.) mi16(re8.)
  la4 fad'16(mi8.) la16(sol8.)
  la,4 sol'16(fad8.) si16(la8.)

  %4
  \appoggiatura sol8 fad2\tr mi4
  re si'16(la8.) sol16(fad8.)
  mi16\p(re8.) si'16(la8.) sol16(fad8.)

  %7
  mi16(fad8.) la16(sol8.) fad16(mi8.)
  \appoggiatura re8 dod4 si8 dod la4\mbreak
  si'16(la8.) sold16(la8.) si16(la8.)

  %10
  sold16(la8.) si16(la8.) sold16(la8.)
  re,4\p mi16(re8.) dod16(re8.)
  mi16(re8.) dod16(re8.) mi16(re8.)

  %13
  mi,4\f re'16(dod8.) mi16(re8.)
  fad16(mi8.) sol16(fad8.) la16(sold8.)
  si16(la8.) dod,4 si

  %16
  la2. la\mbreak
  mi'4 la16(sold8.) si16(la8.)
  mi,4\p dod'16(si8.) re16(dod8.)

  %19
  la4\f sol'!16(fad8.) si16(mi,8.)
  \appoggiatura si'8 re,2\tr dod4
  fad, sol'16(fad8.) mid16(fad8.)

  %22
  sol16(fad8.) mid16(fad8.) sol16(fad8.)
  fad,4\p fad'16(mi!8.) red16(mi8.)
  fad16(mi8.) red16(mi8.) fad16(mi8.)\mbreak

  %25
  fad,4\f mi'16(re!8.) dod16(si8.)
  lad16(si8.) si'16(la!8.) sol16(fad8.)
  mi16(re8.) si'16(re,8.) dod4

  %28
  si2.
  re4 fad, si
  re16(dod si8) fad'(re) si'4

  %31
  dod, mi, la
  do16(si la8) mi'(do) la'4
  si,4 re16(dod!8.) mi16(re8.)

  %34
  fad16(mi8.) sol16(fad8.) la16(sol8.)\mbreak
  si16(la8.) sol8 fad mi re
  dod4 re8 dod si[dod]

  %37
  la4 re16(dod8.) mi16(re8.)
  la4 fad'16(mi8.) la16(sol8.)
  la,4 sol'16(fad8.) si16(la8.)

  %40
  \appoggiatura sol8 fad2\tr mi4
  re si'16(la8.) sol16(fad8.)
  mi16\p(re8.) si'16(la8.) sol16(fad8.)

  %43
  mi16\f(fad8.) la16(sol8.) fad16(mi8.)
  \appoggiatura re8 dod4 si8 dod la4\mbreak
  si'16(la8.) sold16(la8.) si16(la8.)

  %46
  sold16(la8.) si16(la8.) sold16(la8.)
  sol!4\p la16(sol8.) fad16(sol8.)
  la16(sol8.) fad16(sol8.) la16(sol8.)

  %49
  la,4\f sol'16(fad8.) la16(sol8.)
  si16(la8.) si16(si,8.) re16(dod8.)
  mi16(re8.) mi4 dod

  %52
  re2.

}

VIIvlaIn = \relative do' {

  fad4 fad16(mi8.) sol16(fad8.)
  mi4 la dod
  fad, si16(la8.) mi4

  %4
  re2 dod4
  la' mi dod
  fad\p mi dod

  %7
  re\f re si
  la2 re4\mbreak
  mi  mi fad

  %10
  mi re mi
  fad\p fad fad
  mi la sold

  %13
  sold?\f mi sold!
  la la re,
  mi la sold

  %16
  la2. la\mbreak
  la4 re, mi
  mi\p mi mi

  %19
  la\f la si
  si2 lad4
  si fad sold

  %22
  dod si lad
  lad?\p lad sold
  fad si lad\mbreak

  %25
  lad?\f fad mi
  fad fad sol
  si si lad

  %28
  si2.
  fad4 re fad
  mi2 sold4

  %31
  mi dod mi
  re2 fad4
  re sol la

  %34
  la la dod\mbreak
  re, si'8 la sol[fad]
  mi2 dod4

  %37
  re sol fad
  mi la dod
  fad, si16(la8.) mi4

  %40
  re2 dod4
  la' mi dod
  fad\p mi dod

  %43
  re\f re si
  la2 re4\mbreak
  mi mi fad

  %46
  mi re dod
  dod\p dod re
  mi re dod

  %49
  mi\f re dod
  re re sol
  fad sol mi

  %52
  fad2.

}


VIIbcn = \relative do {

  re2 re'4
  dod2 la4
  re re, dod'

  %4
  re fad, la
  fad dod la
  si\p dod' la

  %7
  re si sol
  la la, si\mbreak
  dod dod' re,

  %10
  dod si dod
  si \p si' la,
  sold fad mi

  %13
  mi'\f la, si
  dod re si
  dod mi mi,

  %16
  la la'8 sol fad mi la,4 la' si,\mbreak
  dod si dod
  dod'\p sold la

  %19
  dod,\f re sol
  fad fad, mi'
  re dod si

  %22
  lad sold fad
  fad'\p dod si
  lad sold fad\mbreak

  %25
  fad'\f si, dod
  re re, mi'
  fad fad,fad'

  %28
  si, re fad
  si si, la'
  sold2 mi4

  %31
  la la, sol'!
  fad2 re4
  sol mi fad

  %34
  dod re mi\mbreak
  fad fad, sol'
  la2 sol4

  %37
  fad  mi re
  dod2 la4
  re re' dod

  %40
  re fad, la
  fad dod la
  si\p dod' la

  %43
  re\f si sol
  la la, si\mbreak
  dod dod' re,

  %46
  dod si la
  la'\p mi re
  dod si la

  %49
  dod'\f re mi,
  fad sol la
  si sol la

  %52
  re,\fermata la re,

}

VIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key re\major
  \time 3/4
  \tempo 2. = 55
  \repeat volta 2 {s2.*15}
  \alternative {{s2.}{s}} \break
  \bar".|:"
  \set Score.currentBarNumber = #17
  s2.*36
  \bar":|."

}

VIIflI = {
  \VIIglobal
  \notypeset
  <<\VIIflIn \forma>>

}


VIIvlaI = {
  \VIIglobal
  \clef alto
  <<\VIIvlaIn \forma>>

}


VIIbc = {
  \VIIglobal
  \clef bass
  << \VIIbcn \forma \VIIbfn >>
  \typeset

}

VIIIglobal = 	{
  \override Score.MetronomeMark #'transparent = ##t
  \override Score.BarNumber #'font-size = #0.5
  \override Score.BarNumber #'padding = #1.3
  \override TupletBracket #'bracket-visibility = ##f
  \terzine \senza
}



VIIIflIn = \relative do'' {

  fa4 la sol
  fa16(mi re8) mi2
  re4 la' sib

  %4
  la16(sol fa8) la[fa] sol mi
  fa4 re' do
  sib sol2\tr

  %7
  do4 sib8 la sol fa
  mi re do re mi fa
  sol4 la sib\mbreak

  %10
  la16(sol fa8) la4(sol)
  re'\p do sib
  la16(sol fa8) la4(sol)

  %13
  do\f sib la
  sol8 fa mi re do sib
  la4 sib sol

  %16
  fa2. fa %%%% OK
  la'4 do sib
  la16(sol fa8) la4(sol)

  %19
  fa sol la
  sol8(sib) sib[(la)] la(sol)\mbreak
  la4 sol fa

  %22
  mi8(fa16 sol) fa2
  sol8(la16 sib) la4 mi
  dod8(re16 mi) re2

  %25
  mi8(fa16 sol) sol8(fa) la[(sol)]
  sib(la) la[(sol)] sol(fa)
  la(sol) sol[(fa)] fa(re)

  %28
  fa(sol16 la) mi2
  fa4 la sol
  fa16(mi re8) mi2

  %31
  re4 la' sib
  la16(sol fa8) la fa sol mi\mbreak
  fa4 sol la

  %34
  sib8 sol la2
  re4 do8 sib la do
  sib la sol fa mi re

  %37
  dod4 sol' mi
  fa16(mi re8) fa4(mi)
  sib'\p(la) sol

  %40
  fa16 mi re8 fa4(mi)
  la\f sol fa
  mi8 re dod re mi sol

  %43
  fa4 sol mi
  re2.

}

VIIIflIIn = \relative do'' {

  re4 fa mi
  re dod2
  re4 re re

  %4
  re fa8 re mi dod
  re4 fa fa
  sol mi re

  %7
  do re8 do sib[la]
  sol fa mi si' do re
  mi4 fa sol\mbreak

  %10
  fa8 do fa4(mi)
  sib'\p la sol
  fa8 do fa4(mi)

  %13
  la\f sol fa
  mi8 re do[sib] la sol
  fa4 sol mi

  %16
  fa2. fa
  fa'4 la sol
  fa8 do fa4(mi)

  %19
  do mi fa
  mi8(fa) sol[(fa)] fa(mi)\mbreak
  fa4 re do

  %22
  sib do2~
  do4 do sib
  la la re

  %25
  dod8(re16 mi) mi8[(re)] fa(mi)
  sol(fa) fa[(mi)] mi(re)
  fa(mi) mi[(re)] re(la)

  %28
  re(mi16 fa) dod2
  re4 fa mi
  re8 la dod2

  %31
  re4 re re
  re fa8 re mi[dod]\mbreak
  re4 re fad

  %34
  sol8 re fad2
  sol4 sol fad
  re8 do sib[la] sol fa

  %37
  mi4 mi' dod
  re8 la re4(dod)
  sol'\p fa mi

  %40
  re8 la re4 dod
  fa\f mi re
  dod8 si la si dod mi

  %43
  re4 mi dod
  re2.

}

VIIIbcn = \relative do {

  re4 re' dod
  re la sol
  fa fa, sol'

  %4
  fa la la,
  re sib' la
  sol do sib

  %7
  la la, sib
  do2 r4
  do'2 mi,4\mbreak

  %10
  fa do' do,
  r r mi'
  fa do do,

  %13
  R2.
  r4 r do
  re sib do

  %16
  fa,la'8 sol fa mi fa,4 la do
  fa2 mi4
  fa do' sib

  %19
  la sol fa
  do' la, do'\mbreak
  fa, sib  la

  %22
  sol la fa
  mi fa sol
  sol fa re

  %25
  la' la la
  la la la
  la dod, re

  %28
  la la'8 sol fa mi
  re4 re' dod
  re la sol

  %31
  fa fa, sol'
  fa la la,\mbreak
  re sib' la

  %34
  sol re' do
  sib la re
  sol, sol, sol'

  %37
  la2 la,4
  re la' la,
  r r dod'\p

  %40
  re la la,
  R2.
  r4 r la'\f

  %43
  re sol, la
  re,\fermata la re,

}

VIIIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown



}


forma = {

  \key re\minor
  \time 3/4
  \tempo 2. = 55
  \repeat volta 2 {s2.*15}
  \alternative {{s2.}{s}} \break
  \bar".|:"
  \set Score.currentBarNumber = #17
  s2.*28
  \bar":|."

}

VIIIflI = {
  \VIIIglobal
  %\notypeset
  <<\VIIIflIn \forma>>

}

VIIIflII = {
  \VIIIglobal
  <<\VIIIflIIn \forma>>

}


VIIIbc = {
  \VIIIglobal
  \clef bass
  << \VIIIbcn \forma \VIIIbfn >>
  \typeset

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

  print-first-page-number = ##t
  first-page-number = #2

}

\bookpart {

  \paper  {

    systems-per-page = #2

  }

  \markup \huge {[1.] [Ouverture]}

  \score {
    {
      <<

        \new ChoirStaff \with {
          \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"flute"
              \set Staff.instrumentName = \markup \center-column{"Flûte"\vspace #-0.2"travers[ière]"\vspace #-0.2"1."}
              \IflI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"flute"
              \set Staff.instrumentName = \markup \center-column{"Flûte"\vspace #-0.2"travers[ière]"\vspace #-0.2"2."}
              \IflII
            >>
          >>

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"oboe"
              \set Staff.instrumentName = \markup \center-column{"Hautbois 1."}
              \IobI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"oboe"
              \set Staff.instrumentName = \markup \center-column{"Hautbois 2."}
              \IobII
            >>
          >>

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"violin"
              \set Staff.instrumentName = \markup \center-column{"Violino 1."}
              \IvlI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"violin"
              \set Staff.instrumentName = \markup \center-column{"Violino 2."}
              \IvlII
            >>
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola 1."}
            \IvlaI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola 2."}
            \IvlaII
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Bassone"\vspace #-0.2"& Cembalo"}
            \Ibc
          >>
        >>

      >>
    }

    \layout {

      indent = 2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

  \markup \huge {[2.] Bourrée 1. alternativement}

  \score {
    {
      <<

        \new ChoirStaff \with {
          \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"flute"
              \IIflI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"flute"
              \IIflII
            >>
          >>

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"oboe"
              \IIobI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"oboe"
              \IIobII
            >>
          >>

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"violin"
              \IIvlI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"violin"
              \IIvlII
            >>
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \IIvlaI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \IIvlaII
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
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
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    systems-per-page = #3

  }

  \markup \huge {[3.] Bourrée 2 - Trio}

  \score {
    {
      <<

        \new ChoirStaff \with {
          \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"flute"
              \set Staff.instrumentName = \markup \center-column{"Flûte"\vspace #-0.2"travers[ière]"\vspace #-0.2"1."}
              \IIIflI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"flute"
              \set Staff.instrumentName = \markup \center-column{"Flûte"\vspace #-0.2"travers[ière]"\vspace #-0.2"2."}
              \IIIflII
            >>
          >>

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"oboe"
              \set Staff.instrumentName = \markup \center-column{"Kautbois 1."}
              \IIIobI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"oboe"
              \set Staff.instrumentName = \markup \center-column{"Hautbois 2."}
              \IIIobII
            >>
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Bassone"}
            \IIIbc
          >>
        >>

      >>
    }

    \layout {

      indent = 2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    systems-per-page = #2

  }

  \markup \huge {[4.] Air}

  \score {
    {
      <<

        \new ChoirStaff \with {
          \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"flute"
              \IVflI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"flute"
              \IVflII
            >>
          >>

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"oboe"
              \IVobI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"oboe"
              \IVobII
            >>
          >>

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"violin"
              \IVvlI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"violin"
              \IVvlII
            >>
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \IVvlaI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \IVvlaII
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IVbc
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

  \markup \huge {[5.] Gavotte 1. altern[ativement]}

  \score {
    {
      <<

        \new ChoirStaff \with {
          \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"flute"
              \VflI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"flute"
              \VflII
            >>
          >>

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"oboe"
              \VobI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"oboe"
              \VobII
            >>
          >>

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"violin"
              \VvlI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"violin"
              \VvlII
            >>
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \VvlaI
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"viola"
            \VvlaII
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \Vbc
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

    systems-per-page = #3

  }

  \markup \huge {[6.] Gavotte 2.}

  \score {
    {
      <<

        \new ChoirStaff \with {
          \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
        } <<

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"flute"
              \set Staff.instrumentName = \markup \center-column{"Flûte 1."}
              \VIflI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"flute"
              \set Staff.instrumentName = \markup \center-column{"Flûte 2."}
              \VIflII
            >>
          >>

          \new PianoStaff <<

            \new Staff 																				<<
              \set Staff.midiInstrument = #"oboe"
              \set Staff.instrumentName = \markup \center-column{"Hautbois 1."}
              \VIobI
            >>

            \new Staff
            <<
              \set Staff.midiInstrument = #"oboe"
              \set Staff.instrumentName = \markup \center-column{"Hautbois 2."}
              \VIobII
            >>
          >>

          \new Staff
          <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violini"}
            \VIvlI
          >>

          \new Staff <<
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.instrumentName = \markup \center-column{"Bassoni"}
            \VIbc
          >>
        >>

      >>
    }

    \layout {

      indent = 2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

    systems-per-page = #5

  }

  \markup \huge {[7.] Menuet 1. altern[ativement]}

  \score {
    {
      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
      } <<

        \new Staff <<
          \set Staff.midiInstrument = #"oboe"
          \set Staff.instrumentName = \markup \center-column{"Flûtes"\vspace #-0.2"Hautbois &"\vspace #-0.2"Violini"}
          \VIIflI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"Viola 1. & 2."}
          \VIIvlaI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"bassoon"
          \set Staff.instrumentName = \markup \center-column{"Bassoni"\vspace #-0.2"& Cembalo"}
          \VIIbc
        >>

      >>
    }

    \layout {

      indent = 2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

  \markup \huge {[8.] Menuet 2. }

  \score {
    {
      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
      } <<

        \new Staff <<
          \set Staff.midiInstrument = #"flute"
          \set Staff.instrumentName = \markup \center-column{"Flûte"\vspace #-0.2"Trav[ersière] 1."}
          \VIIIflI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"flute"
          \set Staff.instrumentName = \markup \center-column{"Flûte"\vspace #-0.2"Trav[ersière] 2."}
          \VIIIflII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"harpsichord"
          \set Staff.instrumentName = \markup \center-column{"Cembalo"}
          \VIIIbc
        >>

      >>
    }

    \layout {

      indent = 2.2\cm

      \context	{
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #2
        \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

