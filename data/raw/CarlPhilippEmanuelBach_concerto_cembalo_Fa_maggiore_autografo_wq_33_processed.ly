\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = ^\markup\italic"tasto"

tr = \trill

ten = ^\markup\italic"ten."

pizz = ^\markup\italic"pizzicato"

arco = ^\markup\italic"coll'arco"

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

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

pratubeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

pratubem = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.flat"
	  \musicglyph #"scripts.turn"
      \musicglyph #"scripts.prall"}}

turnshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-4
    \center-column {\musicglyph #"scripts.turn"}}

beqturnshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-4
    \center-column {\musicglyph #"scripts.turn"}}


pradies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.sharp"
      \musicglyph #"scripts.prall"}}

turnbeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
      \musicglyph #"scripts.turn"}}

mordbeq = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.natural"
      \musicglyph #"scripts.mordent"}}

turndies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {\musicglyph #"scripts.turn"
	  \musicglyph #"accidentals.sharp"
      }}

turnbeqdies = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1.5
    \center-column {
	 "♮♯"
      \musicglyph #"scripts.turn"}}

turnbem = ^\markup \override #'(baseline-skip . 1) {
    \halign #-1
    \center-column {
	  \musicglyph #"accidentals.flat"
      \musicglyph #"scripts.turn"}}

turnbemshift = ^\markup \override #'(baseline-skip . 1) {
    \halign #-2
    \center-column {
	  \musicglyph #"accidentals.flat"
      \musicglyph #"scripts.turn"}}

turnshift = ^\markup  {\halign #-2.5 \musicglyph #"scripts.turn"}

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
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.4
   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza
}


IvlIn = \relative do'' {

   do8. fa16 fa8(mi16.) re32
   re8(do16.) la'32 la8(sol16.) fa32
   fa8(mi16.) re32 re8(do16.) sib32

   %4
   \grace sib la(sol la sib) do8\staccatissimo <<fa4\ten\\la,8\f>>
   \grace la32 sol\p(fa sol la) sib8\staccatissimo <<sol'4\ten\\sib,8\f>>
   \grace sib32 la\p(sol la sib) do8\staccatissimo fa16.\f do32 la16. fa32

   %7
   <<{\override TupletBracket.bracket-visibility = ##f \senza re'8. \tuplet 3/2{do32 sib la}}\\\stemUp\shiftOn fa8\\\stemUp\shiftOnn sib,>> sol'16. re'32 sol,16. fa32
   fa4(mi8) r\mbreak
   do'8.\p fa16 fa8(mib16.) reb32

   %10
   reb?8(do16.) lab'32 lab8(sol16.) fa32
   fa8(mi!16.) reb32 reb8(do16.) sib32
   \grace sib32 lab(sol lab sib) do8\staccatissimo  la,!8.\f \once\stemDown mib''16^\p

   %13
   \grace mib32 reb(do reb mib) fa8\staccatissimo si,,!8.\f \once\stemDown fa''16^\p
   \grace fa32 mi!(re? mi fa) sol8\staccatissimo mi,16.\f do'32\p do'16. sol32
   sib4(lab\tr)

   %16
   \once\stemDown sol8. \once\stemUp do,,16\f  do' do do sib
   la! do la sol fad la re, do\mbreak
   sib sol' r sib, sib' sib sib la

   %19
   sol sib sol fa mi sol do, sib
   la fa' r8 \grace re'32 do(sib do re) mib8\staccatissimo
   sib,16 fa' r8 \grace do'32 sib(la sib do) re8\staccatissimo

   %22
   si,16 sol' r8 \grace mi'!32 re(do re mi) fa8\staccatissimo
   do,16 sol' r8 \grace re'32 do(si do re) mi8\staccatissimo
   dod,16 la' mi dod' la mi' dod sol'

   %25
   fa16. la32 sol[fa mi re] <<{s8 sib'}\\{s \stemUp\shiftOn do,}\\{\stemDown do\staccatissimo  mi,}>>\mbreak % fine pagina
   la'8\staccatissimo re,16. sol32 \grace fa8 mi4\tr
   fa16. la32 sol[fa mi re] do8\staccatissimo r16 sold'\p

   %28
   sold?8(la16.) mi32 mi8(fa16.) dod32
   dod?8(re16.) la32 la8(sib16.) fad32
   fad?8(sol16.) re'32 <re fa,! sol,>8.\f fa,16

   %31
   mi16. sol32 do16. mi32 sol8[r16 sib,]
   la16. fa32 re'16. sib32 \grace la8 sol4\tr
   fa8\staccatissimo [r16 la] re,8\staccatissimo [r16 fa]

   %34
   si,4\tr do\tr \mbreak
   fa8\staccatissimo la,16.\staccatissimo do32 fa8\staccatissimo r
   R2*3

   %39
   r4 <<fa'\ten\\la,8\f>>
   r4 <<sol'4\ten\\sib,8\f>>
   r4 fa'16.\f do32 la16. fa32

   %42
   <<{\override TupletBracket.bracket-visibility = ##f \senza re'8. \tuplet 3/2{do32 sib la}}\\\stemUp\shiftOn fa8\\\stemUp\shiftOnn sib,>> sol'16. re'32 sol,16. fa32
   fa4(mi8) r\mbreak
   R2*3

   %47
   r4 la,!\f
   r si\f
   r mi\f

   %50
   R2
   r8. do16\f do' do do sib
   la do la sol fad la re, do\mbreak

   %53
   sib sol' r8 r4
   R2*3
   r8. sib,16\f sib' sib sib la

   %58
   sol sib sol fa mi sol do, sib
   la fa' r8 r4
   R2*7

   %67
   r8. sol,16\f sol' sol sol fa
   mi8\staccatissimo r r dod'\staccatissimo\p
   re\staccatissimo r r la'\staccatissimo \mbreak

   %70
   la(sol) r4
   r8. do,,16\f do' do la fa
   mi8\staccatissimo r r mi\staccatissimo \p

   %73
   fa\staccatissimo r r fa\staccatissimo
   sib'!\staccatissimo \f  mi,4\p mi8
   fa fa, r4

   %76
   <<\stemDown do'2\\{s4\mf s\p}>>\mbreak
   si8 sol,4 sol8
   \once\stemUp lab\f[mib''\p(do) fad]

   %79
   (sol\staccatissimo) r r4
   do8\staccatissimo r do\staccatissimo r
   do8\staccatissimo r do\staccatissimo r

   %82
   la,\staccatissimo r sol\staccatissimo r\mbreak
   fa\staccatissimo r mi\staccatissimo r
   <<\stemDown la'2\\{s4\mf s\p}>>

   %85
   sol8\staccatissimo r r4
   R2*4\mbreak
   sol,8.\f do16 do8(si16.) la32

   %91
   la8(sol16.) mi'32 mi8(re16.) do32
   do8(si16.) la32 la8(sol16.) fa32
   \grace fa mi(re mi fa) sol8\staccatissimo <<do4\ten\\\stemUp\shiftOn mi,8\\\stemUp \shiftOnn sol,>>

   %94
   \grace mi'32 re\p(do re mi) fa8\staccatissimo <<re'4\ten\\\stemUp\shiftOn fa,8\\\stemUp \shiftOnn sol,\f>>
   \grace fa'32 mi\p(re mi fa) sol8\staccatissimo do16.\f sol32 mi16.  do32
   la'8.\tuplet 3/2 { sol32 fa mi } re16. la'32 re,16. do32

   %97
   do8(si16) sol sol' sol sol fa\mbreak  %% fine p. 4
   mi sol mi re dod mi la, sol'
   fa re' r re, fa fa fa mi

   %100
   re fa re do si re sol, fa'
   mi do' r8 \grace la'32 sol(fa sol la) sib!8\staccatissimo
   fa,16 do' r8 \grace sol'32 fa(mi fa sol) la8\staccatissimo

   %103
   fad,16 re' r8 \grace si'32 la(sol la si) do8\staccatissimo
   sol,16 re' r8 \grace la'32 sol(fad sol la) si8\staccatissimo
   sold,16 mi' si sold' mi si' mi,, re'\mbreak %%fine prima riga p. 5 OK

   %106
   do16. mi32 re[do si la] sol8\staccatissimo <fa' si, re, sol,>
   mi\staccatissimo la,16. re32\grace do8 si4\tr
   do16. mi32 re[do si la] sol8\staccatissimo r16 red'\p

   %109
   red?8(mi16.) si32 si8(do16.) sold32
   sold?8(la16.) mi32 mi8(fa16.) dod32
   dod?8(re16.) la'32 <<{la8.^\f do,!16}\\\stemUp \shiftOn re4\\\stemUp \shiftOnn la>>

   %112
   si16. re32 sol16. si32 re8[r16 fa,]
   mi16. do32 la'16. fa32 \grace mi8 re4\tr \mbreak
   \once\stemUp do8\staccatissimo[r16 mi'] la,8\staccatissimo[r16 do]

   %115
   fad,4\tr sol\tr
   do,8\staccatissimo mi16.\staccatissimo sol32 do8\staccatissimo r
   R2*5

   %122
   do8.\f fa16 fa8(mi16.) re32\mbreak
   re8(do16.) la'32 la8(sol16.) fa32
   fa8(mi16.) re32 re8(do16.) sib32

   %125
   sib8\p(la) r4
   R2*7
   r8. fa16 \f fa fa fa mib

   %134
   re fa re do sib fa' sib, lab
   sol8\staccatissimo r r4
   R2*3 % fine penultima riga p. 6

   %139
   r8. sol16\f sol' sol sol fa
   mi! sol mi re do sol' do, sib
   la!8\staccatissimo r r4

   %142
   R2*3
   r8. la16\f la' la la sol
   fa8\staccatissimo r r4\mbreak

   %147
   r8. la,16\pp la' la la sol
   fa8\staccatissimo[r16 la,] la' fa mi re
   dod8\staccatissimo[r16 la] la' la la sol

   %150
   fa la fa re dod mi dod la
   re la r la la' la la sol
   fa la fa re dod mi la, sol'

   %153
   fa re r re re' re re do\mbreak
   sib8\staccatissimo[r16 re,] re' sib la sol
   fad8\staccatissimo [r16 re] re' re re do

   %156
   sib re sib sol fad la fad re
   sol re r re re' re re do
   sib re sib sol fad la re, do'

   %159
   sib sol r sol mi sol do, sib'
   la fa r fa re fa sib, la'\mbreak
   sol mi r mi dod mi la, sol'

   %162
   fa re re do? sib sib la sold
   la la' r la, la' la la sol
   fa re re do sib sib la sold

   %165
   la2~
   la~
   la~\mbreak

   %168
   la
   r8. la16\f la' la la sol
   fa re re do sib sib sib la

   %171
   sol8.\pp sol16 sol mib' mib sol,
   la8.\mf la16 la fad' fad la,
   sib8.\pp sib16 sib sol' sol sib,

   %174
   si8.\mf si16 si sold' sold si,\mbreak
   dod8\staccatissimo r r4
   R2*10

   %186
   la'8.\f re16 re8(do16.) sib32
   sib8(la16.) fa'32 fa8(mi16.) re32
   re8 (dod16.) sib32 sib8(la16.) sol32

   %189
   \grace sol fa(mi fa sol) la8\staccatissimo <<re4\ten\\\stemUp\shiftOn fa,8\\\stemUp\shiftOnn la,8>>\mbreak
   \grace fa'32 mi\p(re mi fa) sol8\staccatissimo <<mi'4\ten\\\stemUp\shiftOn sol,8\f\\\stemUp\shiftOnn la,8>>
   \grace sol'32 fa\p(mi fa sol) la8\staccatissimo mib'16.\f do32 la16. fad32

   %192
   sol16. sib32 re16. sol32 fad16. la32 re,16. do'32
   \grace do32 sib(la sib do) re8\staccatissimo mi,!8. sol16
   \grace sol32 fa(mi fa sol) la8\staccatissimo do,8. mib16

   %195
   re16. fa32 sib,16. re32 sol,16. sib32 re16. fa,32
   fa8(mi16.) do'32\p do8(sib16.) la32\mbreak
   la8(sol16.) la'32 la8(sol16.) fa32

   %198
   fa8(mi16.) do'32\pp do8(sib16.) la32
   sol16 do,,\ff do' do do la sol fa
   do' do, do' do do  la sol fa

   %201
   do' do, do'8 r4
   R2*3
   r4 <<fa4\ten\\la,8\f>>\mbreak

   %206
   r4 <<sol'4\ten\\sib,8\f>>
   r4 fa'16.\f do32 la16. fa32
   <<{\override TupletBracket.bracket-visibility = ##f \senza re'8. \tuplet 3/2{do32 sib la}}\\\stemUp\shiftOn fa8\\\stemUp\shiftOnn sib,>> sol'16. re'32 sol,16. fa32

   %209
   fa8\p(mi) r4
   R2
   r8. do16\f  do' do do sib

   %212
   la do la sol fad la re, do
   sib sol' r sib, sib' sib sib la\mbreak
   sol sib sol fa mi sol do, sib

   %215
   la8\staccatissimo\p r do'4
   (sib8) r r4
   r8 <sol' si, re, sol,>\pizz [<sol si, re, sol,> <sol si, re, sol,>]

   %218
   <mi do mi, sol,> r r4
   r8 la4\arco\p la8
   la r r4\mbreak

   %221
   r8 sib,![(re fa)]
   sold, si4 mi8
   r la,[(do mi)]

   %224
   fad, la4 re8
   r sol,[(sib! re)]
   mi, r r4

   %227
   r r8 fad\staccatissimo \mbreak
   sol\staccatissimo r r re'\staccatissimo
   re(do) r4

   %230
   r8. fa,16\f fa' fa re sib
   la8\staccatissimo r r la,\staccatissimo\p
   sib\staccatissimo r r sib\staccatissimo

   %233
   mib'\staccatissimo \f la,4\p la8
   sib sib, r4\mbreak
   <<\stemDown fa''2\\{s4\mf s\p}>>

   %236
   mi8 do,4 do8
   \once\stemUp reb\f[ \stemDown lab''\p(fa) si,](
   do\staccatissimo)\stemNeutral r r4

   %239
   fa8\staccatissimo r fa\staccatissimo r\mbreak
   fa\staccatissimo r fa\staccatissimo r
   re,\staccatissimo r do\staccatissimo r

   %242
   sib\staccatissimo r la\staccatissimo r
   <<\stemDown re'2\\{s4\mf s\p}>>
   do8\staccatissimo r r4

   %245
   R2\mbreak
   la,16\f fa' r8 \grace re'32 do(sib do re) mib8\staccatissimo
   sib,16 fa' r8\grace do'32 sib(la sib do) re8\staccatissimo %%% fin qui OK

   %248
   si,16 sol' r8 \grace mi'32 re(do re mi!) fa8\staccatissimo
   do,\staccatissimo\pp r16 do do' do do sib
   la do la fa mi sol mi do

   %251
   fa do r do do' do do sib
   lab do lab fa mi sol do, sib'\mbreak
   lab fa r fa lab lab lab sol

   %254
   fa reb r reb fa fa fa mib
   reb reb reb\mf do si fa' fa si,
   do2\pp~

   %257
   do~
   do4 sib!16 sib sib sib\mbreak
   la! la la la sol sol sol sol

   %260
   R2*9
   r8. do16 do' do do sib
   la do la sol fad la re, do\mbreak

   %271
   sib sol' r sib, sib' sib sib la
   sol sib sol fa mi sol do, sib
   la fa' r8 \grace re'32 do(sib do re) mib8\staccatissimo

   %274
   sib,16 fa' r8 \grace do'32 sib(la sib do) re8\staccatissimo
   si,16 sol' r8 \grace mi'!32 re(do re mi) fa8\staccatissimo
   do,16 sol' r8 \grace re'32 do(si do re) mi8\staccatissimo

   %277
   dod,16 la' mi dod' la mi' dod sol'
   fa16. la32 sol[fa mi re] <<{s8 sib'}\\{s \stemUp\shiftOn do,}\\{\stemDown do\staccatissimo  mi,}>>\mbreak
   la'8\staccatissimo re,16. sol32 \grace fa8 mi4\tr

   %280
   fa16. la32 sol[fa mi re] do8\staccatissimo r16 sold'\p
   sold?8(la16.) mi32 mi8(fa16.) dod32
   dod?8(re16.) la32 la8(sib16.) fad32

   %283
   fad?8(sol16.) re'32 <re fa,! sol,>8.\f fa,16
   mi16. sol32 do16. mi32 sol8[r16 sib,]
   la16. fa32 re'16. sib32 \grace la8 sol4\tr

   %286
   fa8\staccatissimo [r16 la] re,8\staccatissimo [r16 fa]
   si,4\tr do\tr \mbreak
   fa8\staccatissimo la,16.\staccatissimo do32 fa8\staccatissimo r

}

IvlIIn = \relative do'' {

   do8. fa16 fa8(mi16.) re32
   re8(do16.) la'32 la8(sol16.) fa32
   fa8(mi16.) re32 re8(do16.) sib32

   %4
   \grace sib la(sol la sib) do8\staccatissimo <<fa4\ten\\la,8\f>>
   \grace la32 sol\p(fa sol la) sib8\staccatissimo <<sol'4\ten\\sib,8\f>>
   \grace sib32 la\p(sol la sib) do8\staccatissimo fa16.\f do32 la16. fa32

   %7
   <<{\override TupletBracket.bracket-visibility = ##f \senza re'8. \tuplet 3/2{do32 sib la}}\\\stemUp\shiftOn fa8\\\stemUp\shiftOnn sib,>> sol'16. re'32 sol,16. fa32
   fa4(mi8) r\mbreak
   do'8.\p fa16 fa8(mib16.) reb32

   %10
   reb?8(do16.) lab'32 lab8(sol16.) fa32
   fa8(mi!16.) reb32 reb8(do16.) sib32
   \grace sib32 lab(sol lab sib) do8\staccatissimo  la,!8.\f \once\stemDown mib''16^\p

   %13
   \grace mib32 reb(do reb mib) fa8\staccatissimo si,,!8.\f \once\stemDown fa''16^\p
   \grace fa32 mi!(re? mi fa) sol8\staccatissimo mi,16.\f do'32\p do'16. sol32
   sol4(fa\tr)

   %16
   mi8. do,16\f do' do do sib
   la! do la sol fad la re, do\mbreak
   sib sol' r sib, sib' sib sib la

   %19
   sol sib sol fa mi sol do, sib
   la fa' r8 \grace re'32 do(sib do re) mib8\staccatissimo
   sib,16 fa' r8 \grace do'32 sib(la sib do) re8\staccatissimo

   %22
   si,16 sol' r8 \grace mi'!32 re(do re mi) fa8\staccatissimo
   do,16 sol' r8 \grace re'32 do(si do re) mi8\staccatissimo
   dod,16 la' mi dod' la mi' dod sol'

   %25
   fa16. la32 sol[fa mi re] <<{s8 sib'}\\{s \stemUp\shiftOn do,}\\{\stemDown do\staccatissimo  mi,}>>\mbreak % fine pagina
   la'8\staccatissimo re,16. sib32 \grace la8 sol4\tr
   fa16. la'32 sol[fa mi re] do8\staccatissimo r16 sold'\p

   %28
   sold?8(la16.) mi32 mi8(fa16.) dod32
   dod?8(re16.) la32 la8(sib16.) fad32
   fad?8(sol16.) re'32 <re fa,! sol,>8.\f re,16

   %31
   do16. sol'32 do16. mi32 sol8[r16 sib,]
   la16. fa32 re'16. sib32 \grace la8 sol4\tr
   fa8\staccatissimo [r16 la] re,8\staccatissimo [r16 fa]

   %34
   si,4\tr do\tr \mbreak
   fa8\staccatissimo la,16.\staccatissimo do32 fa8\staccatissimo r
   R2*3

   %39
   r4 <<fa'\ten\\la,8\f>>
   r4 <<sol'4\ten\\sib,8\f>>
   r4 fa'16.\f do32 la16. fa32

   %42
   <<{\override TupletBracket.bracket-visibility = ##f \senza re'8. \tuplet 3/2{do32 sib la}}\\\stemUp\shiftOn fa8\\\stemUp\shiftOnn sib,>> sol'16. re'32 sol,16. fa32
   fa4(mi8) r\mbreak
   R2*3

   %47
   r4 la,!\f
   r si\f
   r mi\f

   %50
   R2
   r8. do16\f do' do do sib
   la do la sol fad la re, do\mbreak

   %53
   sib sol' r8 r4
   R2*3
   r8. sib,16\f sib' sib sib la

   %58
   sol sib sol fa mi sol do, sib
   la fa' r8 r4
   R2*7

   %67
   r8. sol,16\f sol' sol sol fa
   mi8\staccatissimo r r sol\staccatissimo\p
   la\staccatissimo r r re\staccatissimo \mbreak

   %70
   do16(si) re8 r4
   r8. do,16\f do' do la fa
   mi8\staccatissimo r r mi\staccatissimo \p

   %73
   fa\staccatissimo r r fa\staccatissimo
   sib!\staccatissimo \f  sib4\p sib8
   do4 r

   %76
   <<\stemUp fad,2\\{s4\mf s\p}>>\mbreak
   sol8 sol,4 sol8
   lab\f~lab4.\p

   %79
   sol8\staccatissimo r r4
   fa''!8\staccatissimo r mi\staccatissimo r
   re8\staccatissimo r do\staccatissimo r

   %82
   la\staccatissimo r sol\staccatissimo r\mbreak
   fa\staccatissimo r mi\staccatissimo r
   <<\stemDown do'2\\{s4\mf s\p}>>

   %85
   si8\staccatissimo r r4
   R2*4\mbreak
   sol8.\f do16 do8(si16.) la32

   %91
   la8(sol16.) mi'32 mi8(re16.) do32
   do8(si16.) la32 la8(sol16.) fa32
   \grace fa mi(re mi fa) sol8\staccatissimo <<do4\ten\\\stemUp\shiftOn mi,8\\\stemUp \shiftOnn sol,>>

   %94
   \grace mi'32 re\p(do re mi) fa8\staccatissimo <<re'4\ten\\\stemUp\shiftOn fa,8\\\stemUp \shiftOnn sol,\f>>
   \grace fa'32 mi\p(re mi fa) sol8\staccatissimo do16.\f sol32 mi16.  do32
   la'8.\tuplet 3/2 { sol32 fa mi } re16. la'32 re,16. do32

   %97
   do8(si16) sol sol' sol sol fa\mbreak  %% fine p. 4
   mi sol mi re dod mi la, sol'
   fa re' r re, fa fa fa mi

   %100
   re fa re do si re sol, fa'
   mi do' r8 \grace la'32 sol(fa sol la) sib!8\staccatissimo
   fa,16 do' r8 \grace sol'32 fa(mi fa sol) la8\staccatissimo

   %103
   fad,16 re' r8 \grace si'32 la(sol la si) do8\staccatissimo
   sol,16 re' r8 \grace la'32 sol(fad sol la) si8\staccatissimo
   sold,16 mi' si sold' mi si' mi,, re'\mbreak %%fine prima riga p. 5 OK

   %106
   do16. mi32 re[do si la] sol8\staccatissimo <fa' si, re, sol,>
   mi\staccatissimo la,16. fa32\grace mi8 re4\tr
   do16. mi'32 re[do si la] sol8\staccatissimo r16 red'\p

   %109
   red?8(mi16.) si32 si8(do16.) sold32
   sold?8(la16.) mi32 mi8(fa16.) dod32
   dod?8(re16.) la'32 <<{la8.^\f la,!16}\\\stemUp \shiftOn re4\\\stemUp \shiftOnn la>>

   %112
   sol16. re'32 sol16. si32 re8[r16 fa,]
   mi16. do32 la'16. fa32 \grace mi8 re4\tr \mbreak
   \once\stemUp do8\staccatissimo[r16 mi'] la,8\staccatissimo[r16 do]

   %115
   fad,4\tr sol\tr
   do,8\staccatissimo mi16.\staccatissimo sol32 do8\staccatissimo r
   R2*5

   %122
   do8.\f fa16 fa8(mi16.) re32\mbreak
   re8(do16.) la'32 la8(sol16.) fa32
   fa8(mi16.) re32 re8(do16.) sib32

   %125
   sib8\p(la) r4
   R2*7
   r8. fa16 \f fa fa fa mib

   %134
   re fa re do sib fa' sib, lab
   sol8\staccatissimo r r4
   R2*3 % fine penultima riga p. 6

   %139
   r8. sol16\f sol' sol sol fa
   mi! sol mi re do sol' do, sib
   la!8\staccatissimo r r4

   %142
   R2*3
   r8. la16\f la' la la sol
   fa8\staccatissimo r r4\mbreak

   %147
   r8. la,16\pp la' la la sol
   fa8\staccatissimo[r16 la,] la' fa mi re
   dod8\staccatissimo[r16 la] la' la la sol

   %150
   fa la fa re dod mi dod la
   re la r la la' la la sol
   fa la fa re dod mi la, sol'

   %153
   fa re r re re' re re do\mbreak
   sib8\staccatissimo[r16 re,] re' sib la sol
   fad8\staccatissimo [r16 re] re' re re do

   %156
   sib re sib sol fad la fad re
   sol re r re re' re re do
   sib re sib sol fad la re, do'

   %159
   sib sol r sol mi sol do, sib'
   la fa r fa re fa sib, la'\mbreak
   sol mi r mi dod mi la, sol'

   %162
   fa re re do? sib sib la sold
   la la' r la, la' la la sol
   fa re re do sib sib la sold

   %165
   la2~
   la~
   la~\mbreak

   %168
   la
   r8. la16\f la' la la sol
   fa re re do sib sib sib la

   %171
   sol8.\pp sol16 sol mib' mib sol,
   la8.\mf la16 la fad' fad la,
   sib8.\pp sib16 sib sol' sol sib,

   %174
   si8.\mf si16 si sold' sold si,\mbreak
   dod8\staccatissimo r r4
   R2*10

   %186
   la'8.\f re16 re8(do16.) sib32
   sib8(la16.) fa'32 fa8(mi16.) re32
   re8 (dod16.) sib32 sib8(la16.) sol32

   %189
   \grace sol fa(mi fa sol) la8\staccatissimo <<re4\ten\\\stemUp\shiftOn fa,8\\\stemUp\shiftOnn la,8>>\mbreak
   \grace fa'32 mi\p(re mi fa) sol8\staccatissimo <<mi'4\ten\\\stemUp\shiftOn sol,8\f\\\stemUp\shiftOnn la,8>>
   \grace sol'32 fa\p(mi fa sol) la8\staccatissimo mib'16.\f do32 la16. fad32

   %192
   sol16. sib32 re16. sol32 fad16. la32 re,16. do'32
   \grace do32 sib(la sib do) re8\staccatissimo mi,!8. sol16
   \grace sol32 fa(mi fa sol) la8\staccatissimo do,8. mib16

   %195
   re16. fa32 sib,16. re32 sol,16. sib32 re16. fa,32
   fa8(mi16.) la32\p la8(sol16.) fa32\mbreak
   la8(sol16.) do32 do8(sib16.) la32

   %198
   la8(sol16.) la'32\pp la8(sol16.) fa32
   mi16 do,\ff do' do do la sol fa
   do' do, do' do do  la sol fa

   %201
   do' do, do'8 r4
   R2*3
   r4 <<fa4\ten\\la,8\f>>\mbreak

   %206
   r4 <<sol'4\ten\\sib,8\f>>
   r4 fa'16.\f do32 la16. fa32
   <<{\override TupletBracket.bracket-visibility = ##f \senza re'8. \tuplet 3/2{do32 sib la}}\\\stemUp\shiftOn fa8\\\stemUp\shiftOnn sib,>> sol'16. re'32 sol,16. fa32

   %209
   fa8\p(mi) r4
   R2
   r8. do16\f  do' do do sib

   %212
   la do la sol fad la re, do
   sib sol' r sib, sib' sib sib la\mbreak
   sol sib sol fa mi sol do, sib

   %215
   la8\staccatissimo\p r fa'4~
   fa8 r r4
   r8 <sol' si, re, sol,>\pizz [<sol si, re, sol,> <sol si, re, sol,>]

   %218
   <mi do mi, sol,> r r4
   r8 mi4\arco\p mi8
   re r r4\mbreak

   %221
   <<fa8\\\stemUp\shiftOn sib,!\\\stemUp\shiftOnn re,\pizz>> r r4
   <<mi'8\\\stemUp\shiftOn si\\\stemUp\shiftOnn mi,>> r r4
   <<mi'8\\\stemUp\shiftOn la,\\\stemUp\shiftOnn mi>> r r4

   %224
   <<re'8\\\stemUp\shiftOn fad,\\\stemUp\shiftOnn la,>> r r4
   <<re'8\\\stemUp\shiftOn sol,\\\stemUp\shiftOnn sib,!>> r r4
   <<do'8\\\stemUp\shiftOn mi,\\\stemUp\shiftOnn sol,>> r r4

   %227
   r4 r8 do\staccatissimo\arco \mbreak
   re\staccatissimo r r sol\staccatissimo
   fa16(mi) sol8 r4

   %230
   r8. fa16\f fa' fa re sib
   la8\staccatissimo r r la,\staccatissimo\p
   sib\staccatissimo r r sib\staccatissimo

   %233
   mib\staccatissimo \f mib4\p mib8
   fa4 r\mbreak
   <<\stemUp fa2\\{s4\mf s\p}>>

   %236
   sol8 do,4 do8
   reb8\f~reb4.\p
   do8\staccatissimo r r4

   %239
   sib'8\staccatissimo r la\staccatissimo r\mbreak
   sol\staccatissimo r fa\staccatissimo r
   re\staccatissimo r do\staccatissimo r

   %242
   sib\staccatissimo r la\staccatissimo r
   <<\stemUp fa'2\\{s4\mf s\p}>>
   mi8\staccatissimo r r4

   %245
   R2\mbreak
   la,16\f fa' r8 \grace re'32 do(sib do re) mib8\staccatissimo
   sib,16 fa' r8\grace do'32 sib(la sib do) re8\staccatissimo %%% fin qui OK

   %248
   si,16 sol' r8 \grace mi'32 re(do re mi!) fa8\staccatissimo
   do,\staccatissimo\pp r16 do do' do do sib
   la do la fa mi sol mi do

   %251
   fa do r do do' do do sib
   lab do lab fa mi sol do, sib'\mbreak
   lab fa r fa lab lab lab sol

   %254
   fa reb r reb fa fa fa mib
   reb reb reb\mf do si fa' fa si,
   do2\pp~

   %257
   do~
   do4 sib!16 sib sib sib\mbreak
   la! la la la sol sol sol sol

   %260
   R2*9
   r8. do16 do' do do sib
   la do la sol fad la re, do\mbreak

   %271
   sib sol' r sib, sib' sib sib la
   sol sib sol fa mi sol do, sib
   la fa' r8 \grace re'32 do(sib do re) mib8\staccatissimo

   %274
   sib,16 fa' r8 \grace do'32 sib(la sib do) re8\staccatissimo
   si,16 sol' r8 \grace mi'!32 re(do re mi) fa8\staccatissimo
   do,16 sol' r8 \grace re'32 do(si do re) mi8\staccatissimo

   %277
   dod,16 la' mi dod' la mi' dod sol'
   fa16. la32 sol[fa mi re] <<{s8 sib'}\\{s \stemUp\shiftOn do,}\\{\stemDown do\staccatissimo  mi,}>>\mbreak
   la'8\staccatissimo re,16. sib32 \grace la8 sol4\tr

   %280
   fa16. la'32 sol[fa mi re] do8\staccatissimo r16 sold'\p
   sold?8(la16.) mi32 mi8(fa16.) dod32
   dod?8(re16.) la32 la8(sib16.) fad32

   %283
   fad?8(sol16.) re'32 <re fa,! sol,>8.\f re,16
   do16. sol'32 do16. mi32 sol8[r16 sib,]
   la16. fa32 re'16. sib32 \grace la8 sol4\tr

   %286
   fa8\staccatissimo [r16 la] re,8\staccatissimo [r16 fa]
   si,4\tr do\tr \mbreak
   fa8\staccatissimo la,16.\staccatissimo do32 fa8\staccatissimo r

}


Ivlan = \relative do' {

   la8[la sib sib]
   r fa'[re re']
   sol,4 sol

   %4
   fa8 la do, do
   re\p [re mi\f mi]
   fa\p la do,\f do

   %7
   sib fa' re re
   sol,4. r8\mbreak
   r lab[sib sib]

   %10
   r fa'[reb reb']
   r sol,[sol mi]
   do4 la!8\f fa'\p

   %13
   fa4 si,8\f sol'\p
   sol4 mi8\f sol\p
   do,[do si si]

   %16
   do8. do16\f do' do do sib!
   la! do la sol fad la re, do\mbreak %ripresa
   sib sol' r sib, sib' sib sib la

   %19
   sol sib sol fa mi sol do, sib
   la do do fa fa fa fa fa
   sib, re re re re re fa fa

   %22
   si, re re sol sol sol sol sol
   do, mi mi mi mi mi sol sol
   dod, mi mi mi mi mi mi mi

   %25
   re la' la fa sol sol sol sol\mbreak
   do, do sib sib do do sib sib
   la la' la fa sol8\staccatissimo r16 mi\p

   %28
   mi8(fa16.) dod32 dod8(re16.) la32
   la8(sib16.) fad32 fad8(sol16.) do!32
   do8(re) r16. fa!32\f fa16. si,32

   %31
   do4 r16. mi32 fa16. sol32
   fa16. fa32 fa16. sol32 \grace fa8 mi4\tr
   fa8\staccatissimo[r16 la] re,8\staccatissimo[r16 fa]

   %34
   si,4\tr do\tr \mbreak
   fa,8\staccatissimo la16.\staccatissimo do32 fa8\staccatissimo r
   R2*3

   %39
   r4 do8\f do
   r4 mi8\f mi
   r4 do8\f do

   %42
   sib[fa' re re]
   sol,4. r8\mbreak
   R2*3

   %47
   r4 la!8\f fa'
   r4 si,8\f sol'
   r4 mi8\f sol\p

   %50
   R2
   r8. do,16\f do' do do sib
   la do la sol fad la re, do\mbreak

   %53
   sib sol' r8 r4
   R2*3
   r8. sib,16\f sib' sib sib la

   %58
   sol sib sol fa mi sol do, sib
   la fa' r8 r4
   R2*7

   %67
   r8. sol,16\f sol' sol sol fa
   mi8\staccatissimo r r4
   R2*2

   %71
   r8. do16\f do' do la fa
   mi8\staccatissimo r r mi\staccatissimo\p
   fa\staccatissimo r r fa\staccatissimo

   %74  OOOOOOOKKKKKKKKK
   mi\staccatissimo\f r r4
   R2
   <<\stemDown do2\\{s4\mf s\p}>>\mbreak

   %77
   re8 sol,4 sol8
   lab\f~lab4.\p
   sol8\staccatissimo r r4

   %80
   r8 la'!\staccatissimo r sol\staccatissimo
   r fa\staccatissimo r mi\staccatissimo
   R2*2

   %84
   <<
      {
         \stemDown re2~
         re8\staccatissimo
      }\\{s4\mf s\p}
   >> r8 r4
   R2*4

   %90
   mi,8\f[mi fa fa]
   r do'[la la']
   re,4 re

   %93
   do8[mi sol, sol]
   la la si si
   do mi sol, sol

   %96
   fa do' la la
   sol8. sol16 sol' sol sol fa!\mbreak
   mi sol mi re dod mi la, sol'

   %99
   fa re' r re, fa fa fa mi
   re fa re do si re sol, fa'
   mi sol sol do do do do do

   %102
   fa, la la la  la la do do
   fad, la la re re re re re
   sol, si si si si si re re

   %105
   sold, si si si si si si si\mbreak
   mi, mi mi do re re re re
   do do fa fa sol sol fa fa

   %108
   mi mi mi do re8\staccatissimo  r16 si'\p
   si?8(do16.) sold32 sold8(la16.) mi32
   mi8(fa16.) dod32 dod8(re16.) sol,32 %%%%%%% O K

   %111
   sol8(la) r16. do!32\f do16. fad,32
   sol4 r16. si32 do16. re32
   do16. do32 do16. re32 \grace do8 si4\tr

   %114
   do8\staccatissimo[r16 mi] la,8\staccatissimo [r16 do]
   fad,4\tr sol\tr
   do,8\staccatissimo mi16.\staccatissimo sol32 do8\staccatissimo r

   %117
   R2*5
   la8\f[la sib sib]\mbreak
   r fa'[re re']

   %124
   sol,4 sol~
   sol8\p(fa) r4
   R2*7

   %133
   r8. fa,16\f  fa' fa fa mib
   re fa re do sib fa' sib, lab
   sol8\staccatissimo r r4
   R2*3

   %139
   r8. sol16\f sol' sol sol fa
   mi! sol mi re do sol' do, sib
   la!8\staccatissimo r r4

   %142
   R2*3
   r8. la16\f la' la la sol
   fa8\staccatissimo r r4\mbreak

   %147
   r8. la,16\pp la' la la sol
   fa8\staccatissimo[r16 la,] la' fa mi re
   dod8\staccatissimo [r16 la] la' la la sol

   %150
   fa la fa re dod mi dod la
   re la r la la' la la sol
   fa la fa re dod mi la, sol'

   %153
   fa re r re re' re re do\mbreak
   sib8\staccatissimo [r16 re,]  re' sib la sol
   fad8\staccatissimo [r16 re]  re' re re do

   %156
   sib re sib sol fad la fad re
   sol re r re re' re re do
   sib re sib sol fad la re, do'

   %159
   sib sol r sol mi sol do, sib'
   la fa r fa re fa sib, la'\mbreak
   sol mi r mi dod mi la, sol'

   %162
   fa re re do sib sib la sold
   la la' r la, la' la la sol
   fa re re do sib sib la sold

   %165
   la2~
   la~
   la~

   %168
   la
   r8. la16\f la' la la sol
   fa re re do sib sib sib la

   %171
   sol8.\pp sol16  sol mib' mib sol,
   la8.\mf la16 la fad' fad la,
   sib8.\pp sib16 sib sol' sol sib,

   %174
   si8.\mf si16 si sold' sold si,\mbreak
   dod8\staccatissimo r r4
   R2*10

   %186 OK
   fa,8\f[fa sol sol]
   r re'[sib sib']
   mi,4 mi

   %189
   re8 fa la, re\mbreak
   re8\p[re dod\f dod]
   re\p fa fad4\tr\f

   %192
   r8 sol[do la]
   re,4 r8 sib
   do4 r8 fa

   %195
   fa[re re sol,]
   sol [do\p do do]
   do[do do do]

   %198
   do[do\pp do do]
   do16 do\ff do' do do la sol fa
   do' do, do' do do la sol fa

   %201
   do' do, do'8 r4
   R2*3
   r4 do,8\f do  %%%% ok

   %206
   r4 mi8\f mi
   r4 do8\f do
   sib[fa' re re]

   %209
   do4\p r
   R2
   r8. do16\f do' do do sib

   %212
   la do la sol fad la re, do
   sib sol' r sib, sib' sib sib la\mbreak
   sol sib sol fa mi sol do, sib

   %215
   la8\staccatissimo\p  r mib'4(
   re8) r r4
   r8 <re' fa, sol,>\pizz[<re fa, sol,> <re fa, sol,>]

   %218
   <do mi, sol, do,> r r4
   r8 sol4\p\arco sol8
   fa r r4\mbreak

   %221
   R2*9
   r8. fa,16\f fa' fa re sib
   la8\staccatissimo r r la\staccatissimo\p

   %232
   sib\staccatissimo r r sib\staccatissimo
   la\staccatissimo\f r r4
   R2

   %235
   <<\stemUp si2\\{s4\mf s\p}>>
   do8 do4 do8
   reb\f~reb4.\p

   %238
   do8\staccatissimo  r r4
   r8 re!\staccatissimo r do\staccatissimo \mbreak
   r sib\staccatissimo r la\staccatissimo

   %241
   R2*2
   <<{\stemUp sol2~
      sol8\staccatissimo}\\{s4\mf s\p}>> r8 r4

   %245
   R2
   la16\f do do fa fa fa fa fa
   sib, re re re re re fa fa

   %248
   si, re re sol sol sol sol sol
   do,8\staccatissimo\pp r16 do do' do do sib
   la do la fa mi sol mi do

   %251
   fa do r do do' do do sib
   lab do lab fa mi sol do, sib'\mbreak
   lab fa r fa lab lab lab sol

   %254
   fa reb r reb fa fa fa mib
   reb reb reb\mf do si fa' fa si,
   do2\pp~

   %257
   do~
   do4 sib!16 sib sib sib\mbreak
   la! la la la sol sol sol sol

   %260
   R2*9
   r8. do16\f do' do do sib!
   la! do la sol fad la re, do\mbreak %ripresa

   %271
   sib sol' r sib, sib' sib sib la
   sol sib sol fa mi sol do, sib
   la do do fa fa fa fa fa

   %274
   sib, re re re re re fa fa
   si, re re sol sol sol sol sol
   do, mi mi mi mi mi sol sol

   %277
   dod, mi mi mi mi mi mi mi
   re la' la fa sol sol sol sol\mbreak
   do, do sib sib do do sib sib

   %280
   la la' la fa sol8\staccatissimo r16 mi\p
   mi8(fa16.) dod32 dod8(re16.) la32
   la8(sib16.) fad32 fad8(sol16.) do!32

   %283
   do8(re) r16. fa!32\f fa16. si,32
   do4 r16. mi32 fa16. sol32
   fa16. fa32 fa16. sol32 \grace fa8 mi4\tr

   %286
   fa8\staccatissimo[r16 la] re,8\staccatissimo[r16 fa]
   si,4\tr do\tr
   fa,8\staccatissimo la16.\staccatissimo do32 fa8\staccatissimo r

}

Imdn = \relative do'' {

   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza

   s2*35
   do8. fa16 fa8(mi16.) re32
   re8(do16.) la'32 la8(sol16.) fa32

   %38
   fa8(mi16.)re32 re8(do16.) sib32
   \grace sib32 la(sol la sib do8\staccatissimo) r4
   \grace la32 sol(fa sol la sib8\staccatissimo) r4

   %41
   \grace sib32 la(sol la sib do8\staccatissimo) r4
   R2*2
   do8.\p fa16 fa8(mib16.) reb32

   %45
   reb?8(do16.) lab'32 lab8(sol16.) fa32
   fa8(mi!16.)reb32 reb8(do16.) sib32
   \grace sib32 lab(sol lab sib do8\staccatissimo) r8. mib16

   %48
   \grace mib?32 reb(do reb mib) fa8\staccatissimo r8. fa16
   \grace fa32 mi!(re? mi fa) sol8\staccatissimo r16.\f do,32\p do'16. sol32
   sib4(lab\tr)

   %51
   sol r
   R2\mbreak
   r8 sib,16 sol' re sib' sol re'

   %54
   fa,(mi) do' la sol(fad) la do,
   do(sib) sib(do) do(re) re(mib)
   sol,8(fad16.) sol32 \tuplet 3/2 {
      la16 sol fad mib[re do]

      %57
      sib la sol
   } sol8 r4
   R2
   r8 la'16 fa' do la' fa do'

   %60
   mib,16(re) sib' sol fa(mi) sol sib,
   sib(la) r16 sol' \grace fa8 mib4\tr \mbreak
   re16 sib'(la sol) \grace sol8 fa4\tr

   %63
   mi!16 do'(sib la) \grace la8 sol4\tr
   fa16 re'(do si)la(sol) re' fa,
   fa8(mi16.)\prall fa32 \tuplet 3/2 { sol16[fa mi] re do sib! }

   %66
   la sold'(la) fa mi(re) la' do,
   \grace re16 do8\tr si r4
   \tuplet 3/2 { do16 mi re do[sol' fa] } mi8\staccatissimo \tuplet 3/2 {
      r16 dod mi

      %69
      re fa mi re[la' sol]
   } fa8\staccatissimo \tuplet 3/2 {
      r16 fa mi
      re[re' do] si la sol re'[do si] la sol fa
   }
   fa8(mi\prall) r4

   %72
   s2*13
   \tuplet 3/2 {
      si16 re la' sol[fa! mi] re do si la[sol fa]
      mi do' si la[fa' re]
   } \grace do8 si4\tr  %%%% fin qui controlla parte separata

   %87
   s2*2
   s4 r16. do32 re,16. si'32
   do4 r

   %91
   s2*26
   sol8. do16 do8(si16.) la32  %%%% attacco a p. 5 metà last line
   la8(sol16.) mi'32 mi8(re16.) do32 % p 5 parte separata

   %119
   do8(si16.) la32 la8(sol16.) fa32
   \grace fa32 mi(re mi fa) sol8\staccatissimo do,16. do'32 mi,16. sol32
   fa16. fa'32 la,16. re32\grace do8 sib!4\tr

   %122
   la r
   s2*2
   do8. fa16 fa8(mi16.) re32

   %126
   re8(do16.) sol'32sol8(fa16.) mib32
   re sib' la sol fa[re' sib sol] \grace fa8 mib4\tr
   re16 fad la32[sol fa mib] \grace re8 do4\tr

   %129
   sib16. sib32 \tuplet 3/2 { sib16[mib sol] } \grace sib,8 lab4\tr
   sol32 mib' re do re[do  si do] fad16(sol) r sib,~
   sib32 la do sib re[do mib re] fa mib re do sib[la sol fa]

   %132
   mib4.(re8)\pratu
   do4 r
   R2

   %135
   \grace fa32 mi(re mi fa) sol8\staccatissimo r16 sib re, (mib)
   mi!(fa) fa8~fa16 do' mi, (fa)
   fad(sol) sol8~sol16 re' fad,(sol)

   %138
   sol mib'8 re32 do sib16(lab) fa' lab,\mbreak
   \grace {sol16[sib]} lab8(sol) r4
   R2

   %141
   \grace sol32 fa(mi fa sol) la8\staccatissimo \grace sol'32 fa(mi fa sol) la8\staccatissimo
   \grace la,32 sol(fa sol la) sib8\staccatissimo \grace la'32 sol(fa sol la) sib8\staccatissimo
   \grace sib,32 la (sol la sib) do8\staccatissimo \grace sib'32 la (sol la sib) do8\staccatissimo

   %144
   sib,8\tr sib'~sib16 la32 sol fa mi re do
   sib8(la) r4
   r32 la re fa la[fa mi re] dod mi sol sib la[sol fa mi]\mbreak

   %147
   \grace mi8 fa mi dod32 la mi la dod[la mi la]
   re la re, la' re [la fa la] re la re, la' re [la fa la]
   mi'[la, mi la] mi' la, dod mi dod[la dod mi] dod la dod mi

   %149
   re la re fa re [la re fa] mi la, mi' sol mi[la, mi' sol]
   fa la fa re dod[mi dod la] dod la mi la dod[la mi la]
   re la fa la re[la fa la] mi' la, sol la dod[la mi la]

   %153
   re la fa la re[la re mi] fad re la re fad[re la re]\mbreak
   sol re sol, re' sol[re sib re] sol re sol, re' sol[re sib re]
   la' re, la re la'[re, fad la]fad re fad la fad[re fad la]

   %156
   sol re sol sib sol[re sol sib] la re, la' do la[re, la' do]
   sib re sib sol fad[la fad re] fad re la re fad[re la re]
   sol re sib re sol[re sib re] la' re, do re fad[re la re]

   %159
   sol re sib re sol[re sib re] sol do, sib do mi[do sol do]
   fa do la do fa[do la do] fa sib, la sib re[sib fa sib]\mbreak %%%fine penultima riga p 7
   mi sib sol sib mi[sib sol sib] mi la, sol la dod[la mi la]

   %162
   re la fa la re[la fa la] re sold, fa sold re'[ fa, re' fa,]
   dod' la mi la dod[la mi la] dod la mi la dod[la mi la]
   re la fa la re[la fa la] re sold, fa sold re'[fa, re' fa,]

   %165
   dod' la mi la dod[la dod mi] \stemDown sol, \stemUp dod[mi sib'] \stemDown sol, \stemUp dod[mi sib']
   \stemDown fa, \stemUp re'[fa la] \stemDown fa, \stemUp la[re la'] \stemDown mi, \stemUp sib'[dod sol'] \stemDown mi, \stemUp sol[dod sol']
   \stemDown re, \stemUp la'[re fa] \stemDown re, \stemUp la'[re fa] \stemDown re, \stemUp fa[la fa'] \stemDown re, \stemUp fa[la fa']\mbreak %% Fine p. 7 inizio p. 8 bar 168

   %168
   \stemDown dod, \stemUp sol'[sib mi] \stemDown dod, \stemUp sol'[sib mi] \stemDown <re, si> \stemUp fa[sold re'] \stemDown <re, si> \stemUp fa[sold re']
   s mi, la dod s mi,[la dod] r4
   R2

   %171
   \stemNeutral sib'32 mib, sib mib sib'[mib, sib mib] sib' mib, sib mib sib'[mib, sib mib]
   do' fad, do fad do'[fad, do fad] do' fad, do fad do'[fad, do fad]
   re' sol, re sol re'[sol, re sol] re' sol, re sol re'[sol, re sol]

   %174
   re' sold, re sold re'[sold, re sold] r re' si sold re[si' sold re]\mbreak
   mi la, si dod re[mi fa sol] la sol la sib la[sol fa mi]
   fa8\staccatissimo [r16 re']mi,8\staccatissimo[r16 sib']

   %177
   dod,8\staccatissimo [r16 mi] sol,8\staccatissimo[r32 sib la sol]
   fa16. re'32 do[sib la sol] \grace fa8 mi4\tr
   re8\staccatissimo[r16 \once\stemDown re''\p] re(mi,) r sib'

   %180
   sib(dod,) r mi mi(sol,) r16. mi32\f
   mi8(fa16.) fad32 fad8(sol16.) la32\mbreak
   la8(sib16.) dod32 dod8(re16.) mi32

   %183
   mi8(fa16.) fad32 fad8(sol16.) la32
   la8(sib16.) dod32 dod8(re32) la fa re
   <sib' sol mi re>4\arpeggio mi,, \upprall

   %186
   re\f r
   s2*15
   do'8. fa16 fa8(mi16.) re32

   %203 OOOOKKKK
   re8(do16.) la'32 la8(sol16.) fa32
   fa8(mi16.) re32 re8(do16.) sib32
   \grace sib la(sol la sib) do8\staccatissimo r4\mbreak

   %206
   \grace la32 sol(fa sol la) sib8\staccatissimo r4
   \grace sib32 la(sol la sib) do8\staccatissimo r4
   R2

   %209
   sol'32 fa sol la sib[la sib do] re16 do8 sib16
   sib4(la\tr)
   sol r

   %212
   R2*3
   s2*11
   s4 s8 \tuplet 3/2 {
      sol,16 mi do

      %227
      fa la sol fa[do' sib]
   } la8\staccatissimo \tuplet 3/2 {
      r16 fad la
      sol sib la sol[re' do]
   } sib8\staccatissimo \tuplet 3/2 {
      r16 sib la
      sol sol' fa mi[re do] sol' fa mi re[do sib]
   }

   %230
   sib8(la\prall) r4
   s2*13
   \tuplet 3/2 {
      mi16 sol re' do[sib! la] sol fa mi re[do sib]

      %245
      \giu\stemUp la\su \stemDown fa' mi re[sib' sol]
   }  \grace fa8 \stemNeutral mi4\tr \mbreak
   fa4 r
   s2*2

   %249
   mi'32 do sol do mi[do mi sol] mi do mi sol mi[do mi sol]
   fa do fa la fa[do fa la] sol do, sol' sib sol[do, sol' sib]
   la do la fa mi[sol mi do] mi do sol do mi[do sol do]

   %252
   fa do lab do fa[do lab do] sol' do, sib do mi[do sol do]\mbreak
   fa do lab do fa[do lab do] fa do fa, do' fa[do sib do]
   reb lab fa lab reb[lab fa lab] reb[lab reb, lab'] reb lab solb lab

   %255
   \stemDown reb, \stemUp fa[lab reb] fa reb lab fa \stemDown si, \stemUp fa'[lab re] fa re lab fa
   \stemNeutral mi' do sol do mi[do sol do] fa do lab do fa[do lab do]
   mi do sol do mi [do sol do] re si fa si re[si fa si]

   %258
   do sol mi sol do[sol mi sol]re' sol, mi sol re'[sol, mi sol]\mbreak
   do fa, do fa do'[fa, do fa] sib mi, do mi sib'[mi, do mi]
   la8\staccatissimo[r16 fa'] sol,8\staccatissimo [r16 re']

   %261
   mi,8\staccatissimo [r16 sol]sib,8\staccatissimo [r32 re do sib]
   \giu\stemUp la16.\su\stemDown fa'32 mi[re do sib] \giu\stemUp \grace la8 \stemUp sol4\tr
   \su \stemNeutral s8 r16 fa''\p fa(sol,) r re'

   %264
   re(mi,) r sol sol(sib,) r8
   r4 r8. sib''16\pp
   sib(reb,) r sol sol(sib,) r mi\mbreak

   %267
   mi(sol,) r reb' r8. sib'16\f
   sib32 la sol la do[sib la sol] sol4\upprall
   fa r

}

Imsn = \relative do {

   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza

   fa8 [fa sol sol]
   la [la sib sib]
   do [re mi do]

   %4
   fa [fa la, la]
   sib\p[sib do\f do]
   fa,\p[fa la,\f la]

   %7
   sib[sib sib si]
   do4. r8\mbreak
   r fa\p[sol sol]

   %10
   r lab[sib sib]
   r do[mi! do]
   fa,[fa la,!\f la\p]

   %13
   sib[sib si\f si\p]
   do[do mi\f mi\p]
   fa[fa si, si]

   %16
   do8. do16\f do'  do do sib!
   la! do la sol fad la re, do\mbreak  %%%%ripresa
   sib sol' r sib, sib' sib sib la

   %19
   sol sib sol fa mi sol do, sib
   la la la la la la la la
   sib sib sib sib sib sib sib sib

   %22
   si si si si si si si si
   do do do do do do do do
   dod dod dod dod dod dod dod dod

   %25
   re re re re mi mi mi mi\mbreak
   fa fa sib, sib do do do do
   re re re re mi8\staccatissimo [r16 mi'\p\tasto]

   %28
   mi8(fa16.) dod32 dod8(re16.) la32
   la8(sib16.) fad32 fad8(sol16.) la32
   la8(sib) r16. si,32\f si16. sol32

   %31
   do4 r16. do32 re16. mi32
   fa16. la32 sib16. sol32 do8 do,
   fa\staccatissimo[r16 la] re,8\staccatissimo[r16 fa]

   %34
   si,4\tr do\tr \mbreak
   fa,8\staccatissimo la16.\staccatissimo do32 fa8\staccatissimo r
   <la fa>8 [<la fa> <sib sol> <sib sol>]
   la[la <re sib> <re sib>]

   %38
   do[ re mi do]
   fa[fa la, la]
   sib[sib do do]

   %41
   fa,[fa la, la]
   sib[sib sib si]
   do4. r8

   %44
   r <lab' fa>[<sib sol> <sib sol>]
   r lab[<reb sib> <reb sib>]
   r do[mi do]

   %47
   fa,[fa la,! la]
   sib[sib si si]
   do[do mi mi]

   %50
   fa[fa si, si]
   do[r16 do] do' do do sib
   la do la sol fad la re, do\mbreak

   %53
   sib sol' r8 r sib,
   do la re fad,
   sol[la sib do]

   %56
   re re, r fad
   sol[r16 sib\f] sib' sib sib la
   sol sib sol fa mi sol do, sib

   %59
   la fa' r8  r la,
   sib sol do mi
   fa fa, r16 fa' sol la\mbreak

   %62
   sib8 sib, r16 sol' la si
   do8 do, r16 la' si dod
   re8 re, r si

   %65
   do[re mi mi]
   fa[fa fa fad]
   sol8. sol,16 sol' sol sol fa

   %68
   <sol mi>8[<sol mi> <sol mi> mi]
   fa[<la fa> <la fa> fa]\mbreak
   sol[sol si si]

   %71
   do[r16 do,] do' do la fa
   \tuplet 3/2 {
      mi sol \su \stemUp do\noBeam mi[sol do] sol [mi do] \giu\stemDown mi, \su\stemUp dod'[mi]
      \giu \stemDown fa, la \su \stemUp re\noBeam fa[la re] la[fa re] \giu\stemDown fa,\su\stemUp re'[fa]

      %74
      \giu \stemDown sol, sib! \su \stemUp mi\noBeam sol[sib mi] sib[sol mi] \giu\stemDown sol,\su\stemUp mi'[sol]
      \giu \stemDown la, do \su \stemUp fa\noBeam la[do fa] do[la fa] \giu\stemDown la,\su\stemUp do'[fa,]
      \giu\stemDown lab,\su\stemUp do[mib] fad[do' fad,] mib[do] \giu\stemDown lab lab,\noBeam\su \stemUp do''[fad,]

      %77
      \giu\stemDown sol,, \su \stemUp sol''[si] re[sol re] si[sol] \stemDown re \giu si[sol]\su\stemUp fa'
      \giu\stemDown lab,\su\stemUp do[mib] fad[do' fad,] mib[do] \giu\stemDown lab lab,\noBeam\su \stemUp fad''' do
      \giu\stemDown sol,, \su\stemUp si''[re] sol[re si] sol\stemDown re[\giu si] sol\noBeam \su\stemUp si'[sol']

      %80
      \stemDown la, \stemUp do[fa!] do'[fa, do] \stemDown sol \stemUp do[mi] do'[mi, do]
      \stemDown fa, do'[re] do'[re, do] \stemDown mi,[sol] \stemUp do mi[sol do]
      \stemDown la, \stemUp mi'[fa] do'[mi, fa] \stemDown sol, \stemUp red'[mi] do'[red, mi]

      %83
      \stemDown fa, \stemUp dod'[re] dod'?[dod, re] \stemDown mi,[sol] \stemUp do mi[sol do]
      \stemDown re,, \stemUp do'[fad] la[do si] la sol fad mi[re do]
   }
   \giu\stemNeutral sol,4 r8 si,

   %86
   do[fa sol sol,]
   \tuplet 3/2 {
      \su \stemUp do''16 \giu\stemDown mi,,[sib'!]\su\stemUp do[mi sol] do \giu\stemDown fa,,[la]\su\stemUp do[fa la]
      \stemUp do \giu\stemDown mi,,[sib'!]\su\stemUp do[mi sol] do \giu\stemDown fa,,[la]\su\stemUp do[fa la]

      %89
      do[la fad] mib[do] \giu\stemDown fad,
   } \stemNeutral sol8 sol,\mbreak
   do8\f[do re re]

   %91
   mi[mi fa fa]
   sol[la si sol]
   do[do mi, mi] % fin qui OK fine p. 4 solo cembalo

   %94
   fa\p[fa sol\f sol]
   do,\p[do mi,\f mi]
   fa[fa fa fad]

   %97
   sol8. sol16 sol' sol sol fa!\mbreak
   mi sol mi re dod mi la, sol'
   fa re' r re, fa fa fa mi

   %100
   re fa re do si re sol, fa'
   mi mi mi mi mi mi mi mi
   fa fa fa fa fa fa fa fa

   %103
   fad fad fad fad fad fad fad fad
   sol sol sol sol sol sol sol sol
   sold sold sold sold sold sold sold sold\mbreak

   %106
   la la la la si si si si
   do do fa, fa sol sol sol, sol
   la la la la si8\staccatissimo[r16 si'\p\tasto]

   %109
   si?8(do16.) sold32 sold8(la16.) mi32
   mi8(fa16.) dod32 dod8(re16.) mi32
   mi8 (fa) r16. fad,32\f fad16. re32

   %112
   sol4 r16. sol32 la16. si32
   do16. mi32 fa16. re32 sol8 sol,\mbreak
   do8\staccatissimo[r16 mi'] la,8\staccatissimo[r16 do]

   %115
   fad,4\tr sol\tr
   do,8\staccatissimo mi16.\staccatissimo sol32 do8\staccatissimo r
   <mi, do>[<mi do> <fa re> <fa re>]

   %118
   mi[mi <la fa> <la fa>]
   sol[la si sol]
   do[do sib! sib]

   %121
   la[fa sol do,]
   fa\f[fa sol sol]\mbreak
   la[la sib sib]

   %124
   do[re mi do]
   fa,[fa <sib sol> <sib sol>]
   la la r la

   %127
   sib re do\su la'
   \giu sib, sol' la, fad'
   sol, mib' fa, re'

   %130
   mib,4 r8 mi\mbreak
   fa2
   r8 <sib mi,!>[<sib mi,> <sib mi,>]

   %133
   <la fa>8.[ fa,16\f] fa' fa fa mib
   re fa re do sib fa' sib, lab
   <sib' sol>8[<sib sol> <sib sol> <sib sol>]

   %136
   r <do lab>[<do lab> <do lab>]
   r <re sib>[<re sib> <re sib>]
   r do [re <re sib>]\mbreak  %%% fine penultima riga p. 6

   %139 OOOOOKKKKK
   mib8[r16 \once\stemUp sol,,\f]  sol' sol sol fa
   mi! sol mi re do sol' do, sib
   <do' la>8[<do la> <do la>^\p <do la>]

   %142
   <re sib>^\f [<re sib> <re sib>^\p <re sib>]
   <mi do>^\f [<mi do> <mi do>^\p <mi do>]
   <fa re>^\f [<fa re> <sol mi> <sol mi>]

   %145
   fa8[r16 \once\stemUp la,,\f] la' la la sol
   fa8[fa mi dod]\mbreak
   re la la' r

   %148
   fa r r4
   dod8 r la' r
   fa r dod r

   %151
   re16 la r la la'8 r
   fa r dod la
   fa'16 re r re re'8 r\mbreak

   %154
   sib r r4
   fad8 r re' r
   sib r fad r

   %157
   sol16 re r re re'8 r
   sib r fad re
   sib'16 sol r sol mi8 do

   %160
   la'16 fa r fa re8 sib\mbreak
   sol'16 mi r mi dod8 la
   fa' re16 do? sib8 la16 sold

   %163
   la8 r la' r
   fa re16 do sib8 la16 sold
   la8 r s4

   %166
   s2*3
   la'32 s s16 la32 s s16 r8 la16 sol
   fa re re do sib sib sib la

   %171
   sol4 r8 sol
   la4 r8 la
   sib4 r8 sib

   %174
   si4 si\mbreak
   dod4 r8 dod
   re16 re re8 r16 sol, sol8

   %177
   r16 sol' sol8 r16 dod, dod8
   re[sol la la,]
   sib16 sib sib8 r sol\p

   %180
   r8 sol' r dod,16. dod'32\f
   dod?8(re16.) la32 la8(sib16.) fad32\mbreak
   fad?8(sol16.) mi32 mi8(fa16.) dod32

   %183
   dod8(re16.) la32 la8(sib16.) fad32
   fad?8(sol16.) mi32 mi8(fa!)
   sol4 la

   %186
   re8\f [re mi mi]
   fa[fa sol sol]
   la [la dod la]

   %189
   re[re fa, fa]\mbreak
   sol\p[sol la\f la]
   re\p re do\f do

   %192
   sib[sib la fad]
   sol4 r8 sol
   la4 r8 la,

   %195
   sib[sib sib sib]
   do[do\p do\tasto do]\mbreak
   do[do do do]

   %198
   do[do\pp do do]
   do16 do\ff do' do do la sol fa
   do' do, do' do do la sol fa

   %201
   do' do, do'8 r4
   <la fa>8 [<la fa> <sib sol> <sib sol>]
   la[la <re sib> <re sib>]

   %204
   do[ re mi do]
   fa[fa la,\f la]
   sib[sib do\f do]

   %207
   fa,[fa la,\f la]
   sib[sib sib si]
   do4\p r8 mi

   %210
   fa[fa si, si]
   do[r16 do\f] do' do do sib
   la do la sol fad la re, do

   %213
   sib sol' r sib, sib' sib sib la
   sol sib sol fa mi sol do, sib
   \tuplet 3/2 {
      \su\stemUp fa''' \giu\stemDown la,,[\su mib']  \stemUp fa[la do] fa \giu\stemDown la,,[\su mib'] \stemUp fa[la do]

      %216
      fa \giu\stemDown sib,,[re] \su\stemUp fa[sib re] fa \giu\stemDown sib,,[re] \su\stemUp fa]sib re]
      sol\giu\stemDown si,,[\su fa'] \stemUp sol[si re] sol \giu\stemDown si,, [\su fa']\stemUp sol[si re]
      sol \stemDown do,,[mi]\stemUp sol[do mi] sol \stemDown do,,[mi] \stemUp sol[do mi]

      %219
      la \stemDown dod,,[sol'] \stemUp la[dod mi] la \stemDown dod,,[sol'] \stemUp la[dod mi]
      la \stemDown re,,[fa] \stemUp la[re fa] la \stemDown re,,[fa] \stemUp la[re fa]
      sib \giu \stemDown re,,,[re' ] \su\stemUp fa[sib re] \stemDown fa[re do] sib fa' la,

      %222
      \stemUp sold \giu\stemDown re,[re'] \su\stemUp mi[sold si] mi[si sold] si[sold mi]
      mi' \giu\stemDown do,,[do'] \su\stemUp mi[la do]\stemDown  mi[do si] la mi' sol,
      \stemUp fad\giu \stemDown do,[do'] \su\stemUp re[fad la] re[la fad] la fad re

      %225
      re'\giu\stemDown sib,,![sib'] \su \stemUp re[sol sib] \stemDown re[sib la] sol re' fa,
      \stemUp mi \giu \stemDown sib,[sib'] \su \stemUp do[mi sol] \stemDown do[sol mi]
   } \giu\stemNeutral  sib,8
   la[<do' la> <do la> la]

   %228
   sib[<re sib> <re sib> sib]
   do[do mi mi]
   fa[r16 fa,] fa'4

   %231
   \tuplet 3/2 {
      \stemDown la,,16[do] \stemUp fa la[do\su fa] \giu do[la fa] \stemDown la, \stemUp fad'[la]
      \stemDown sib,[re] \stemUp sol sib[\su re sol] re[\giu sib sol] \stemDown sib, \stemUp sol'[sib]
      \stemDown do,[mib]\stemUp la \su do[mib la] mib[do\giu la] \stemDown do, \stemUp la'[do]

      %234
      \stemDown re,[fa] \stemUp sib \su re[fa sib] fa[re sib] \giu\stemDown re, \su \stemUp fa'[sib,]
      \giu\stemDown reb, \stemUp fa[lab] si[\su \stemDown fa' \giu\stemUp si,] lab[fa] \stemDown reb[reb,] \su\stemUp fa''[\giu si,]
      \stemDown do,, \su\stemUp do''[mi] sol[do sol] mi[do]\giu\stemDown sol mi[do] \stemUp sib'!

      %237
      \stemDown reb, \stemUp fa[lab] si[\su \stemDown fa'\giu \stemUp si,] lab[fa] \stemDown reb \stemUp reb,\noBeam \su si'''[fa]
      \giu\stemDown do,, \su\stemUp mi''[sol] do[sol mi] do \giu\stemDown sol[mi] do \su\stemUp mi'[do']
      \stemDown re, \stemUp fa[sib!] fa'[sib, fa] \stemDown do \stemUp fa[la] fa'[la, fa]

      %240
      \stemDown sib, \stemUp fa'[sol] fa'[sol, fa] \giu\stemDown la,[do] \su\stemUp fa la[do fa]
      \stemDown re, \stemUp la'[sib] fa'[la, sib] \stemDown do, \stemUp sold'[la] fa'[sold, la]
      \giu\stemDown sib, \su\stemUp fad'[sol?] fad'?[fad, sol] \giu\stemDown la,[do] \su\stemUp fa la[do fa]

      %243
      \giu\stemDown sol,, \su\stemUp fa'[si] \stemDown re[fa mi] re[do  si] la sol fa
   }
   \giu\stemNeutral do4 r8 mi,
   fa sib do do,\mbreak

   %246
   la16^\f la la la la la la la
   sib sib sib sib sib sib sib sib
   si si si si si si si si

   %249
   do8\pp r do' r
   la r mi r
   fa16 do r do do'8 r

   %252
   lab r mi do\mbreak
   lab'16 fa r fa lab8. sol16
   fa reb r reb fa8 r

   %255
   s2
   do'~
   do~

   %258
   do4 sib!\mbreak
   la! sol
   fa16 fa fa8 r16 sib, sib8

   %261
   sib16 sib sib8 r16 mi, mi8
   \stemDown fa sib do do,
   <<fa'8\staccatissimo\\{\stemUp\shiftOn re,16 re re8}>> \stemNeutral r sib'\p

   %264
   r sib' r mi,
   R2
   r8 mi'\pp r reb\mbreak

   %267
   r sib sol r16 mi\f
   fa8 sib, do do,
   fa[r16 do'] do' do do sib

   %270
   la do la sol fad la re, do\mbreak  %%%%ripresa
   sib sol' r sib, sib' sib sib la
   sol sib sol fa mi sol do, sib
   la la la la la la la la

   %274
   sib sib sib sib sib sib sib sib
   si si si si si si si si
   do do do do do do do do

   %277
   dod dod dod dod dod dod dod dod
   re re re re mi mi mi mi\mbreak
   fa fa sib, sib do do do do

   %280
   re re re re mi8\staccatissimo [r16 mi'\p\tasto]
   mi8(fa16.) dod32 dod8(re16.) la32
   la8(sib16.) fad32 fad8(sol16.) la32

   %283
   la8(sib) r16. si,32\f si16. sol32
   do4 r16. do32 re16. mi32
   fa16. la32 sib16. sol32 do8 do,

   %286
   fa\staccatissimo[r16 la] re,8\staccatissimo[r16 fa]
   si,4\tr do\tr
   fa,8\staccatissimo la16.\staccatissimo do32 fa8\staccatissimo r

}


Ibcn = \relative do {

   fa8 [fa sol sol]
   la [la sib sib]
   do [re mi do]

   %4
   fa [fa la, la]
   sib\p[sib do\f do]
   fa,\p[fa la,\f la]

   %7
   sib[sib sib si]
   do4. r8\mbreak
   r fa\p[sol sol]

   %10
   r lab[sib sib]
   r do[mi! do]
   fa,[fa la,!\f la\p]

   %13
   sib[sib si\f si\p]
   do[do mi\f mi\p]
   fa[fa si, si]

   %16
   do8. do16\f do'  do do sib!
   la! do la sol fad la re, do\mbreak  %%%%ripresa
   sib sol' r sib, sib' sib sib la

   %19
   sol sib sol fa mi sol do, sib
   la la la la la la la la
   sib sib sib sib sib sib sib sib

   %22
   si si si si si si si si
   do do do do do do do do
   dod dod dod dod dod dod dod dod

   %25
   re re re re mi mi mi mi\mbreak
   fa fa sib, sib do do do do
   re re re re mi8\staccatissimo [r16 mi'\p]

   %28
   mi8(fa16.) dod32 dod8(re16.) la32
   la8(sib16.) fad32 fad8(sol16.) la32
   la8(sib) r16. si,32\f si16. sol32

   %31
   do4 r16. do32 re16. mi32
   fa16. la32 sib16. sol32 do8 do,
   fa\staccatissimo[r16 la] re,8\staccatissimo[r16 fa]

   %34
   si,4\tr do\tr \mbreak
   fa,8\staccatissimo la16.\staccatissimo do32 fa8\staccatissimo r
   R2*3

   %39
   r4 la8\f la
   r4 do8\f do
   r4 la,8\f la

   %42
   sib[sib sib si]
   do4. r8\mbreak
   R2*3

   %47
   r4 la8\f la
   r4 si8\f si
   r4 mi8\f mi\p

   %50
   R2
   r8. do16\f do' do do sib
   la do la sol fad la re, do\mbreak

   %53
   sib sol' r8 r4
   R2*3
   r8. sib,16\f sib' sib sib la

   %58
   sol sib sol fa mi sol do, sib
   la fa' r8 r4
   R2*7

   %67
   r8. sol,16\f sol' sol sol fa
   mi8\staccatissimo r r mi\p\staccatissimo
   fa\staccatissimo r r fa\staccatissimo\mbreak

   %70
   sol4 r
   r8. do,16\f do' do la fa
   mi8\staccatissimo r r mi\staccatissimo\p

   %73
   fa\staccatissimo r r fa\staccatissimo
   sol\f sol4\p sol8
   la4 r

   %76
   <<\stemDown lab2\\{s4\mf s\p}>>\mbreak
   sol8 sol,4 sol8
   lab\f~lab4.\p

   %79
   sol8\staccatissimo r r4
   R2*4
   <<\stemDown fad'2\\{s4\mf s\p}>>

   %85
   sol8\staccatissimo r r4
   R2*4
   do,8\f[do re re]

   %91
   mi[mi fa fa]
   sol[la si sol]
   do[do mi, mi]

   %94
   fa\p[fa sol\f sol]
   do,\p[do mi,\f mi]
   fa[fa fa fad]

   %97
   sol8. sol16 sol' sol sol fa!\mbreak
   mi sol mi re dod mi la, sol'
   fa re' r re, fa fa fa mi

   %100
   re fa re do si re sol, fa'
   mi mi mi mi mi mi mi mi
   fa fa fa fa fa fa fa fa

   %103
   fad fad fad fad fad fad fad fad
   sol sol sol sol sol sol sol sol
   sold sold sold sold sold sold sold sold\mbreak

   %106
   la la la la si si si si
   do do fa, fa sol sol sol, sol
   la la la la si8\staccatissimo[r16 si'\p]

   %109
   si?8(do16.) sold32 sold8(la16.) mi32
   mi8(fa16.) dod32 dod8(re16.) mi32
   mi8 (fa) r16. fad,32\f fad16. re32

   %112
   sol4 r16. sol32 la16. si32
   do16. mi32 fa16. re32 sol8 sol,\mbreak
   do8\staccatissimo[r16 mi'] la,8\staccatissimo[r16 do]

   %115
   fad,4\tr sol\tr
   do,8\staccatissimo mi16.\staccatissimo sol32 do8\staccatissimo r
   R2*5

   %122
   fa,8\f[fa sol sol]\mbreak
   la[la sib sib]
   do[re mi do]

   %125
   fa,4\p r
   R2*7
   r8. fa,16\f fa' fa fa mib

   %134
   re fa re do sib fa' sib, lab
   sol8\staccatissimo r r4
   R2*3

   %139
   r8. sol16\f sol' sol sol fa
   mi! sol mi re do sol' do, sib
   la!8\staccatissimo r r4

   %142
   R2*3
   r8. la16\f la' la la sol
   fa8\staccatissimo r r4\mbreak

   %147
   r8. la,16\pp la' la la sol
   fa8\staccatissimo[r16 la,] la' fa mi re
   dod8\staccatissimo [r16 la] la' la la sol

   %150
   fa la fa re dod mi dod la
   re la r la la' la la sol
   fa la fa re dod mi la, sol'

   %153
   fa re r re re' re re do\mbreak
   sib8\staccatissimo [r16 re,]  re' sib la sol
   fad8\staccatissimo [r16 re]  re' re re do

   %156
   sib re sib sol fad la fad re
   sol re r re re' re re do
   sib re sib sol fad la re, do'

   %159
   sib sol r sol mi sol do, sib'
   la fa r fa re fa sib, la'\mbreak
   sol mi r mi dod mi la, sol'

   %162
   fa re re do sib sib la sold
   la la' r la, la' la la sol
   fa re re do sib sib la sold

   %165
   la2~
   la~
   la~

   %168
   la
   r8. la16\f la' la la sol
   fa re re do sib sib sib la

   %171
   sol8.\pp sol16  sol mib' mib sol,
   la8.\mf la16 la fad' fad la,
   sib8.\pp sib16 sib sol' sol sib,

   %174
   si8.\mf si16 si sold' sold si,\mbreak
   dod8\staccatissimo r r4
   R2*10

   %186
   re8\f[re mi mi]
   fa[fa sol sol]
   la [la dod la]

   %189
   re[re fa, fa]\mbreak
   sol\p[sol la\f la]
   re\p re do\f do

   %192
   sib[sib la fad]
   sol4 r8 sol
   la4 r8 la,

   %195
   sib[sib sib sib]
   do[do\p do do]\mbreak
   do[do do do]

   %198
   do[do\pp do do]
   do16 do\ff do' do do la sol fa
   do' do, do' do do la sol fa

   %201
   do' do, do'8 r4
   R2*3
   r4 la8\f la\mbreak

   %206
   r4 do8\f do
   r4 la,8\f la
   sib[sib sib si]

   %209
   do4\p r
   R2
   r8. do16\f do' do do sib

   %212
   la do la sol fad la re, do
   sib sol' r sib, sib' sib sib la\mbreak
   sol sib sol fa mi sol do, sib

   %215
   la8\staccatissimo\p  r la'4(
   sib8) r r4
   r8 si,\pizz[si si]

   %218
   do r r4
   r8 dod'4\p\arco dod8
   re r r4\mbreak

   %221
   re2~
   re
   do~

   %224
   do
   sib!~
   sib8 r r4

   %227
   r r8 la,\staccatissimo \mbreak
   sib\staccatissimo r r sib\staccatissimo
   do4 r

   %230
   r8. fa16\f  fa' fa re sib
   la8 r r la,\staccatissimo\p
   sib\staccatissimo r r sib\staccatissimo

   %233
   do\staccatissimo \f  do4\p do8
   re4 r\mbreak
   <<\stemDown reb2\\{s4\mf s\p}>>

   %236
   do8 do4 do8
   reb\f~reb4.\p
   do8\staccatissimo r r4

   %239
   R2*4
   <<\stemDown si2\\{s4\mf s\p}>>
   do8\staccatissimo r r4

   %245
   R2\mbreak
   la16\f la la la la la la la
   sib sib sib sib sib sib sib sib

   %248
   si si si si si si si si
   do8\staccatissimo\pp[r16 do] do' do do sib
   la do la fa mi sol mi do

   %251
   fa do r do do' do do sib
   lab do lab fa mi sol do, sib'\mbreak
   lab fa r fa lab lab lab sol

   %254
   fa reb r reb fa fa fa mib
   reb reb reb\mf do si fa' fa si,
   do2\pp~

   %257
   do~
   do4 sib!16 sib sib sib\mbreak
   la! la la la sol sol sol sol

   %260
   R2*9
   r8. do16\f do' do do sib
   la do la sol fad la re, do\mbreak  %%%%ripresa

   %271
   sib sol' r sib, sib' sib sib la
   sol sib sol fa mi sol do, sib
   la la la la la la la la

   %274
   sib sib sib sib sib sib sib sib
   si si si si si si si si
   do do do do do do do do

   %277
   dod dod dod dod dod dod dod dod
   re re re re mi mi mi mi\mbreak
   fa fa sib, sib do do do do

   %280
   re re re re mi8\staccatissimo [r16 mi'\p]
   mi8(fa16.) dod32 dod8(re16.) la32
   la8(sib16.) fad32 fad8(sol16.) la32

   %283
   la8(sib) r16. si,32\f si16. sol32
   do4 r16. do32 re16. mi32
   fa16. la32 sib16. sol32 do8 do,

   %286
   fa\staccatissimo[r16 la] re,8\staccatissimo[r16 fa]
   si,4\tr do\tr
   fa,8\staccatissimo la16.\staccatissimo do32 fa8\staccatissimo r

}

Ibfn =  \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentUp

   s4 <7>8 <6>
   <6 4> <3> <7 > <6>
   s4 <7>
   s <6>
   <6> <7>
   s <6>
   s <6>8 <5>
   <4>4 <3>
   s8 <_-> <7> <6->
   s <6> <7- _-> <6>
   s <_!> <7->4
   <_->4 <6>
   <_-> <6>
   s <6>
   <9 4> <7- 5>
   s2*4
   s4 <6>
   s2
   <6>
   s
   <6>
   s4 <6>8 <5>
   s <6> <6 4> <5 3>
   s4 <6>
   s2*2
   s4 s16. <5>32 s8
   s4 s8 <7>16. <5->32
   s16. <6>32 s8 <6 4> <5 3> %% fine p.2
   s2*8
   s4 <6>
   s <6>8 <5>
   <4>4 <3>
   s2*46
   s4 <7>8 <6!>
   s4 <7>8 <6>
   <_!>4 <7>
   s <6>
   <6> <7 _!>
   s <6>
   s <6>8 <5>
   <4> <_!> s4
   s2*3
   <6>2
   s
   <6>
   <_!>
   <6>
   s4 <6>
   s8 <6> <6 4> <5 _!>
   s4 <6>
   s2*2
   s4 s16. <5>32 s16. <7 _+>32
   <_!>4 s16. <_!>32 <7>16 <5>
   s16. <6>32 s8 <6 4> <5 _!>
   s2*8
   s4 <7>8 <6>
   <6>4 <7>8 <6>
   s4 <6>
   s2*2 %%% fine p. 5 parte separata bar 124
   s2*59
   s4 <7>8 <6>
   <4> <3> <7> <6>
   <4> <_+> <7> <_+>
   s4 <6>
   <6 5> <_+>  % bar 190 OK
   s <4\+ _->
   <6> <6\\>8 <6 5->
   s4 s8 <6>
   <6>4 s8 <5->
   s4 <6>8 <5>
   <4> <3> s4
   s2*10
   s4 <6>
   <6>2
   s2*37
   s4 <6>
   s2
   <6>2
   s2*24
   <6>2
   s
   <6>
   s
   <6>
   s4 <6>
   s8 <6> <6 4> <5 3>
   s4<6>
   s2*2
   s4 s16. <5>32 s16. <7 _!>32
   s4 s8 <7>16 <5>
   s4 <6 4>8 <5 3>

}


forma = {

   \key fa\major
   \time 2/4
   \tempo 4 = 57
   s2*288
   \bar "|."

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

Imd = {
   \Iglobal
   \context Staff = up
   <<\Imdn \forma>>

}

Ims = {
   \Iglobal
   \clef bass
   \context Staff = down
   <<\Imsn \forma\Ibfn>>

}

Ibc = {
   \Iglobal
   \clef bass
   <<\Ibcn \forma>>
   \typeset

}



IIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.4
   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza
}


IIvlIn = \relative do'' {

   fa,8
   mib(re) r sib sol'-. fa-. r sib\p
   do,8.\p(re32 mib) mib16(re) re(do) re16.\tr (mib32 fa8) r sib,\f
   <<{sol'8. fa32 mib}\\\stemUp\shiftOn sib8>> re do \con \tuplet 3/2 { re16(do sib) } sib8 r4

   %4
   r16. re'32 re8~\senza \tuplet 3/2 { re16 fa (mib) sol[(fa mib)]} re8(do\tr) r4
   r16. do32\p do8~ \tuplet 3/2 { do16 mib (re) fa[(mib re)] } do8(sib) r16 sib\f  sib(re)\mbreak
   do8(sib) r16 sib\p sib(mi) mi(sib) sib8 r16. sib32\f sib16.\staccatissimo sol'32

   %7
   \once\stemDown sol8. do,,16 do8. sib'16 \tuplet 3/2 { la[(sol fa)] } fa8-.[(fa-. fa-.)]
   fa8. mib32 (re) do16(si) lab'(sol) fa(mib) mib8-.[(mib-. mib-.)]
   mib8. re32 (do) sib16(la) sol'(fa) mib[(re)] fa8\p(sol lab)

   %10
   r8 sol sol16(fa) fa(mib)\mbreak mib(re) re8\f~re16(mib) mib(re)
   re(sol) fa32[(mib re do)] sib8(do\tr) sib\noBeam r r re16.\p(fa32)
   \grace fa16 mib8(re) r re16.(sib'32) \grace fa16 mib8(re) r sib''32\ff fa re sib

   %13
   <<sol'4\ten\\\stemUp\shiftOn sib,8\\\stemUp\shiftOnn mib,>> \grace {sib32[do]} do4\tr <<{sib16.\staccatissimo re32 fa16.\pp\staccatissimo sib32}\\sib,4>> re'8\staccatissimo r
   R1*2
   r2 r8. sib16\f fa16. sib32 re,16. fa32

   %17
   sib,8\staccatissimo r r4 r8 mi16\p(sol) sol(do) do(do,)
   fad4 fad8 fad r re16(sol) sol(re) re8\mbreak
   r16 re re(sol) fa8(mi) r16 mi' mi(sib') sib16. sib,32\f sib16. \staccatissimo sol'32

   %20
   \once\stemDown sol8. do,,16 do8. sib'16 \grace do32 sib16(la) r8 r4
   R1
   r2 r16. do,32\f mi16. sol32 do8\staccatissimo r\mbreak

   %23
   r16. do,32\p fa16. la32 do8\staccatissimo r r16. do,32\f mi16. sol32 sib,8\staccatissimo r
   R1
   do''8\staccatissimo \f r r4 r8 la,16.\p(fa32)fa8(mi)\mbreak

   %26
   R1*2
   r2 r4 r8 do''\f
   sib(la) r fa re'\staccatissimo do\staccatissimo r fa,,\p\mbreak

   %30
   sol,8. la32 (sib) sib16(la) la(sol) la16.\tr(sib32) do8 r fa\f
   <<{re'8. do32 sib}\\\stemUp\shiftOn fa8\\\stemUp\shiftOnn sib,>> la' sol \tuplet 3/2 { la16(sol fa) } fa8 r16 lab16\pp (fa re)
   si(re) sol,8 r si do4\staccatissimo r16 mib'!(do la)

   %33
   fad(la) re,8 r fad sol sol' r sol
   r sol r sol r2\mbreak
   r r8. re,16\f do(sib) la(sol)

   %36
   sol(mib') mib8\pp~mib mib~mib16 mib do'(la) sol8(fad)
   R1
   re''8\f\staccatissimo  r r4 r8 sib,16.\p (sol32) sol8(fad)\mbreak

   %39
   R1
   r2 r16. re'32\p re8~\tuplet 3/2 {
      re16 fad (sol) sol[(re mib)]
      mib(si do)
   } do8 r16. do32\f do16.\staccatissimo la'32 la8.\once\stemUp  re,,16 re8. do'16

   %42
   \grace re32 do16 (sib) re8\p[(mib fa)]  r mib mib16(re) re(do)\mbreak
   do(sib) sib8~sib16(do) do(sib) sib(la) re16.\tr(mib32) \grace sol,8 fad4\tr
   sol\staccatissimo r16 sib\pp(sol mi) dod(mi) la,8 r dod

   %45
   re r r4 r2
   r4 r16 lab'\pp(fa re) si(re) sol,8 r si
   do r r lab'' r sib r4\mbreak

   %48
   r2 r4 r8 re,,16.\p(fa32)
   \grace fa8 mib(re) r4 r r8 mib16.\p(sol32)
   fa8(mib) r4 r2

   %51
   r r4 r8 fa\f
   mib(re) r sib sol'\staccatissimo fa\staccatissimo r4\mbreak
   r2 r4 r8 sib,\f

   %54
   <<{sol'8.\f fa32 mib}\\\stemUp\shiftOn sib8>>  re8 do \tuplet 3/2 { re16(do sib) } sib8 r re16.\p(fa32)
   \grace fa16 mib8(re) r sib'16.(fa32) mib8(re) r4
   r8 r16 sol sib(sol) r8 r8.fa16 sib[(fa)] r8\mbreak

   %57
   r2 r8 fa16.\p(la32) \grace la16 sol8 (fa)
   r fa'16.\pp(do32) sib8(la) r8.. sol32 fa8[(mib\staccatissimo)]
   r8.. mib'32 re8[(do\staccatissimo)] r2

   %60
   R1
   fa8\staccatissimo\f r r4 r8 re,16.\p(sib32) sib8[(la)]
   R1

   %63
   r2 r8 fa'-.\f(fa-. fa-.)\mbreak
   fa8. (mib32 re) do16(si) lab'(sol) fa(mib) mib8-.[(mib-. mib-.)]
   mib8.(re32 do) sib16(la) sol'(fa) mib[(re)] fa8\p(sol lab)

   %66
   r8 sol sol16(fa) fa(mib)\mbreak mib(re) re8\f~re16(mib) mib(re)
   re(sol) fa32[(mib re do)] sib8(do\tr) sib\noBeam r r re16.\p(fa32)
   \grace fa16 mib8(re) r re16.(sib'32) \grace fa16 mib8(re) r sib''32\ff fa re sib

   %69
   <<sol'4\ten\\\stemUp\shiftOn sib,8\\\stemUp\shiftOnn mib,>> \grace {sib32[do]} do4\tr sib r

}


IIvlIIn = \relative do'' {

   re,8
   do(sib) r sib mib-. re-. r sib'\p
   do,8.\p(re32 mib) mib16(re) re(do) sib16.\tr do32 re8 r sib\f
   <<{sol'8. fa32 mib}\\\stemUp\shiftOn sib8>> re do \con \tuplet 3/2 { re16(do sib) } sib8 r4

   %4
   r16. re'32 re8~\senza \tuplet 3/2 { re16 fa (mib) sol[(fa mib)]} re8(do\tr) r4
   r16. do32\p do8~ \tuplet 3/2 { do16 mib (re) fa[(mib re)] } do8(sib) r16 sib\f  sib(re)\mbreak
   do8(sib) r16 sib\p sib(mi) mi(sib) sib8 r16. sib32\f sib16.\staccatissimo sol'32

   %7
   \once\stemDown sol8. do,,16 do8. sib'16 \tuplet 3/2 { la[(sol fa)] } fa8-.[(fa-. fa-.)]
   fa8. mib32 (re) do16(si) lab'(sol) fa(mib) mib8-.[(mib-. mib-.)]
   mib8. re32 (do) sib16(la) sol'(fa) mib[(re)] re8\p[(mib fa)]

   %10
   r mib mib16(re) re(do)\mbreak do8 do\f(sib)[lab]
   sol8. sol16 sib8(la!\tr) sib r r sib16.\p(re32)
   \grace re do8(sib) r sib16. (re32) \grace re16 do8(sib) r sib''32\ff fa re sib

   %13
   <<sol'4\ten\\\stemUp\shiftOn sib,8\\\stemUp\shiftOnn mib,>> \grace {sib32[do]} do4\tr <<{sib16.\staccatissimo re32 fa16.\pp\staccatissimo sib32}\\sib,4>> re'8\staccatissimo r
   R1*2
   r2 r8. sib16\f fa16. sib32 re,16. fa32

   %17
   sib,8\staccatissimo r r4 r8 mi16\p(sol) sol(do) do(do,)
   fad4 fad8 fad r re16(sol) sol(re) re8\mbreak
   r16 re re(sol) fa8(mi) r16 mi' mi(sib') sib16. sib,32\f sib16. \staccatissimo sol'32

   %20
   \once\stemDown sol8. do,,16 do8. sib'16 \grace do32 sib16(la) r8 r4
   R1
   r2 r16. do,32\f mi16. sol32 do8\staccatissimo r\mbreak

   %23
   r16. do,32\p fa16. la32 do8\staccatissimo r r16. do,32\f mi16. sol32 sib,8\staccatissimo r
   R1
   do'8\f\staccatissimo r r4 r2 %%%%%% OOK

   %26
   R1*2
   r2 r4 r8 la'\f
   sol(fa) r fa sib\staccatissimo la\staccatissimo r fa,\p\mbreak

   %30
   sol,8. la32 (sib) sib16(la) la(sol) la16.\tr(sib32) do8 r fa\f
   <<{re'8. do32 sib}\\\stemUp\shiftOn fa8\\\stemUp\shiftOnn sib,>> la' sol \tuplet 3/2 { la16(sol fa) } fa8 r16 lab16\pp (fa re)
   si(re) sol,8 r si do4\staccatissimo r16 mib'!(do la)

   %33
   fad(la) re,8 r fad sol sib r si
   r do r dod r2\mbreak
   r r8. re,16\f  do(sib) la(sol)

   %36
   sol(mib') mib8\pp~mib mib~mib16 mib do'(la) sol8(fad)
   R1
   re'8\f\staccatissimo r r4 r2\mbreak

   %39
   R1
   r2 r16. re32\p re8~\tuplet 3/2 {
      re16 fad (sol) sol[(re mib)]
      mib(si do)
   } do8 r16. do32\f do16.\staccatissimo la'32 la8.\once\stemUp  re,,16 re8. do'16

   %42
   \grace re32 do16 (sib) si8\p[(do re)] r do do16(sib!) sib(la)\mbreak
   la(sol) sol4 sol8 sol sol \grace sol fad4\tr
   sol\staccatissimo r16 sib\pp(sol mi) dod(mi) la,8 r dod

   %45
   re r r4 r2
   r4 r16 lab'\pp(fa re) si(re) sol,8 r si
   do r r reb' r reb r4\mbreak

   %48
   r2 r4 r8 si,16.\p re32
   \grace re8 do si r4 r  r8 do16.\p mib32
   re8(do) r4 r2

   %51
   r r4 r8 re\f
   do(sib)  r sib mib\staccatissimo re\staccatissimo r4\mbreak
   r2 r4 r8sib\f

   %54
   <<{sol'8.\f fa32 mib}\\\stemUp\shiftOn sib8>>  re8 do \tuplet 3/2 { re16(do sib) } sib8 r  sib16.\p(re32)
   \grace re16 do8(sib) r re16.(re32) do8[(sib)] r4
   r8. mib16 sol[(mib)] r8 r8. re16 fa[(re)] r8\mbreak

   %57
   r2 r8 la16.\p(do32) \grace do16 sib8[la]
   r la'16.\pp(la32) sol8[(fa)] r8.. mib32 re8[(do\staccatissimo)]
   r8.. do'32 sib8[(la\staccatissimo)] r2

   %60
   R1
   fa8\f\staccatissimo r r4 r2
   R1

   %63
   r2 r8 fa-.\f(fa-. fa-.)\mbreak
   fa8. (mib32 re) do16(si) lab'(sol) fa(mib) mib8-.[(mib-. mib-.)]
   mib8.(re32 do) sib16(la) sol'(fa) mib[(re)] re8\p[(mib fa)]

   %66
   r mib mib16(re) re(do)\mbreak do8 do\f(sib)[lab]
   sol8. sol16 sib8(la!\tr) sib r r sib16.\p(re32)
   \grace re do8(sib) r sib16. (re32) \grace re16 do8(sib) r sib''32\ff fa re sib

   %69
   <<sol'4\ten\\\stemUp\shiftOn sib,8\\\stemUp\shiftOnn mib,>> \grace {sib32[do]} do4\tr sib

}


IIvlan = \relative do' {

   r8
   r4 sib r sib
   r8 sol\p la la r sib fa4
   r8 sib\f sib la sib8. sib'16 fa16. sib32 re,16. fa32

   %4
   sib,8 fa' fa[re] r mi16(sol) sol(do) do(do,)
   fad4\p fad8 fad r re16(sol) sol(re) re8\f \mbreak
   r16 re re(sol) fa!8(mi\p) r16 mi mi(sib') sib(mi,) mi8

   %7
   r16. do32\f do8 r16. sol32 sol8 fa4\staccatissimo  r16 lab'(fa re)
   si(re) sol,8 r re' sol,4\staccatissimo r16 sol'(mib? do)
   la(do) fa,8 r do' fa, r r4

   %10
   mib4\p fa8 fa\mbreak r fad\f(sol) fa
   mib mib fa[(mib\tr)] re re16.\p(fa32) \grace fa mib8(re)
   r re16.(sib'32) \grace fa16 mib8(re) r4 r8 fa'\ff

   %13
   sib,4 la\tr <<sib4\\{sib8 r}>> r4
   R1*2
   r2 r8. sib'16\f fa16. sib32 re,16. fa32

   %17
   sib,8\staccatissimo  r r4 r8 sib\p sib sib
   la4 la8 la r sol sol sol\mbreak
   r sol sol sol r sol sol r

   %20
   r16. do32\f do8 r16. sol32 sol8 fa8 r r4
   R1
   r2 r8 do'\f mi\staccatissimo r\mbreak

   %23
   r fa\p fa\staccatissimo r r sol,\f sol\staccatissimo r
   R1
   fa'8\staccatissimo\f r r4 r2

   %26
   R1*3
   r4 fa,\f r fa\mbreak
   r8 re\p mi mi r la do4

   %31
   r8 fa\f fa mi fa4 r16 lab\pp (fa re)
   si(re) sol,8 r si do4\staccatissimo r16 mib'!(do la)
   fad(la) re,8 r fad sol re r re

   %34
   r do r sol r2\mbreak
   r2 r8. re'16 \f do(sib) la(sol)
   sol(mib') mib8\pp~mib mib~mib16 mib do'(la) sol8(fad)

   %37
   R1
   sol8\f\staccatissimo r r4 r2\mbreak
   R1

   %40
   r2 r8 sib\p sib sib
   r la la la r16. re,32\f re8 r16.  la32 la8
   sol8 r r4 do4\p re8 re\mbreak

   %43
   r mib mib re do sib16. do32 re8 do
   sib4\staccatissimo r16 sib'\pp(sol mi) dod(mi) la,8 r dod
   re r r4 r2

   %46
   r4 r16 lab'\pp(fa re) si(re) sol,8 r si
   do mib, fa[fa] r sol r4\mbreak
   R1*4

   %52
   r4 sib\f r sib\mbreak
   r2 r8 sib\f re4
   r8 sib sib la sib r r4

   %55
   R1*6
   sib8\f\staccatissimo r r4 r2
   R1

   %63
   r2 r4 r16 lab'\f(fa re)
   si(re) sol,8 r re' sol,4\staccatissimo r16 sol'(mib? do)
   la(do) fa,8 r do' fa, r r4

   %66
   mib4\p fa8 fa\mbreak r fad\f(sol) fa
   mib mib fa[(mib\tr)] re re16.\p(fa32) \grace fa mib8(re)
   r re16.(sib'32) \grace fa16 mib8(re) r4 r8 fa'\ff

   %69
   sib,4 la\tr  sib4 r

}

IImdn = \relative do'' {

   \override TupletBracket.bracket-visibility = ##f
   \terzine \senza

   s8
   s1*12
   r2 r4 r8 <<
      {
         fa
         mib[(re)]
      }\\{re do[sib]}
   >> r8 sib^\markup {\halign #-2 \musicglyph #"scripts.turn" } \tupletSpan 4 \tuplet 3/2 { sol'16[(mib sol)] } <<fa8\\re>> \con \tuplet 10/8 {r32(sib' la re do sib la sol fa mib)}

   %15
   re8~re32 do(re mib) \grace {re32[fa]} mib16(re) \grace mib 32 re16 (do) re16.^\markup {\halign #-2 \musicglyph #"scripts.turn" } mib32 fa8 r32(sib, la sib re fa sib) fad
   fad?8~fad32 la64(sol fa32 mib) re16 \grace fa32 mib8 do16\turn re32 do sib do sib8 r4
   r16. re32 \senza re8~\tuplet 3/2 { re16 fa mib sol[fa mib] } re8(do\prall) r4

   %18
   \tuplet 3/2 {  r16 do do do16[mib re] do\prall si do la'[fad do] } do la\turn sib?8 r16 sib sib^\markup {\halign #-2 \musicglyph #"scripts.turn" }  re \mbreak
   do8(sib\prall) r16 sib\p sib(mi) mi(sib) sib8 r4
   r2 r8 <do la>\f^\markup {\halign #-2 \musicglyph #"scripts.turn" }(<re sib> <mib! do>)

   %21
   \grace {re32[fa]} <mib do>16(<re sib>) r re re mi8 fa16 \grace {mi32]sol]} fa16 (mi) r mi mi\turn sib'8 la16
   sol(fa) mi\prall(re) do8~do32(si) la'(sol) fa8(mi\pratu) \tuplet 3/2 {
      r16 do do do[mi sol]
      sol mi fa
   } do8 \tuplet 3/2 { r16 do do do[fa la] la fad sol } do,8 \tuplet 3/2 {
      r16 do do do[sol' sib,]

      %24
      la fa' fa fa[sib, sib] la fa' fa fa[sol, sol] fa fa'\p fa fa[(sib,) fa'] r la, fa' fa[(sol,) fa']
      r fa,\f la do[fa do'] la fa do la[fa re]
   } do8(si\prall) r16. sib32 sol'16. sib,32\mbreak
   \giu\stemUp  sib32 la \su fa' do mib! re sib' sol fa8~fa32 mi sol sib,\giu la]sib si do dod\su re sib' sol fa8~fa32 mi sol \giu sib,?\mbreak

   %27
   \once\stemUp la16\su fa''32 do mib![re do sib] sib8 sol\downprall fa \giu la,16. do32 <<\su s8\pratu\\{\giu\stemUp \grace do8 \stemUp sib \su <la' fa>16. <do la>32}>>
   \su\grace {<<do8\\la>>} <sib sol>\pratu [<la fa>] \giu \stemUp <<\su s8\pratu\\{\giu \stemUp \grace do,16  \stemUp sib8[ \su <la' fa>16. <fa' la,>32]}>> \su \grace {<<do8\\la>>} <sib sol>\pratu [<la fa>] r4
   s1*2

   %31
   s2 r8 \stemNeutral fa'-.(fa-. fa-.)\mbreak
   fa8. mib!32 re do16(si) lab'(sol) fa(mib) do'8-.[(do-. do-.)]
   do8. sib32 la sol16(fad) la(do,) do(sib) sib(sol') sol(si,) si(sol')

   %34
   sol(do,) do(sol') sol sib32 la do[sib la sol] sol16(fad\prall) r la la(do,) r la'\mbreak
   la(sib,) r sol' sol sib,8 sib16 \grace do sib8\pratu la r4
   r8 r32 sol' fa mib re[do si do] do do' sib la sol8(fad\prall) r16 do(la') do,

   %37
   \tuplet 3/2 {
      sib sol' sol sol[do, do] sib sol' sol sol[la, la] sol sol'\p sol sol[do, sol'] r sib, sol' sol[la, sol']
      \giu\stemUp r16 sol,,^\f sib \su re[sol sib] re sol re sib[sol mib]
   } re8(dod\prall) r16. do32 la'16. do,32\mbreak
   do sib sol' re fa mi do' la sol8~sol32 fad la do, sib do dod re mib! mi do' la sol8~sol32 fad la do,?

   %40
   sib16 \stemDown sol''32 re \stemNeutral fa[mib re do] do8 la\downprall sol4 r
   s1*3
   r8 sol'-.(sol-. sol-.)sol8. fa32 mi re16(dod) sib' la

   %45
   sol(fa) la re, re(mib!) r sol sol (dod,) r mi mi sol,8 sib32 la
   sol16(fa)fa'8-.[fa-.fa-.] fa8. mib!32 re do16(si) lab'(sol)
   fa(mib) sol do, do(reb) r fa mib(reb) r32 reb do sib lab16[(sol) fa'(mib)]\mbreak

   %48
   reb(do) do mib re8(do\pratu) <<{s8 re16.[fa32] \grace fa8 mib\pratu [(re)]}\\{si [si16. re32] \stemDown \grace re8 \stemDown do8[si]}>>
   r8 <<{re16. fa32 fa16 mib mib re re (mib) mib16.[sol32] fa8(mib)}\\{si16. re32 re16 do do si si do do16.[mib32] re8 do}>>
   r8 <<
      {
         mib16 do' sib la sol fa mib re r re fa mib r mib

         %51
         sol fa r fa fa8(lab32) sol fa mib re4(do8\pratu)
      }\\{
         do16 mib re do sib la do sib s sib re do s do
         mib re s re re8(fa32) mib re do  sib4(la8)
      }
   >> r
   r2 r4 r8 sib'\mbreak
   sib16 do,~do32[do re mib] \grace {re32[fa]} mib16[re \grace mib re do] re16.^\markup {\halign #-2 \musicglyph #"scripts.turn" } mib32 fa8 r4

   %54
   r2 r8 <<{re16. fa32 \grace fa8 mib\pratu re}\\{sib16. re32 \stemDown \grace re8 \stemDown do8 [sib]}>>
   r <<
      {
         sib'16. fa32 mib8[(re\pratu)] r fa16.^\markup {\halign #-2 \musicglyph #"scripts.turn" } do'32 do16 sib sib lab\pratu
         sol sol sib sol r sol sib sol sol fa sib fa r fa re' fa,
      }\\{
         re16. re32 do8 sib s re16. lab'32 lab16 sol sol fa
         mib mib sol mib s mib sol mib mib re fa re s re fa re
      }
   >>

   %57
   <fa re>16 <mib do>8 <sol mib>32 <fa re> \grace <mib do>8 <re sib>4\pratu <do la> r8 <<
      {
         la'16. do32
         \grace do8 sib [la]
      }\\{
         fa16. la32
         \stemDown \grace la8 \stemDown sol [fa]
      }
   >> r \stemNeutral fa,16. do32 s4 r8.. <do' mib,>32
   \once\slurDown <sib re,>8(<la do,>\staccatissimo) r8.. <<{sol'32 fa8(mib16.) do'32}\\{mib,32 re8[(do16)]}>> sib'32[la sol fa] do'16 mib,

   %60
   \tuplet 3/2 {
      re sib' sib sib[mib, mib] re sib' sib sib[do, do] sib sib'\p sib sib[mib,(sib')] r re, sib' sib[do,(sib')]
      \stemUp r^\f sib,, re  fa[sib fa'] re sib fa re [\giu sib sol]
   } fa8(mi\prall) \su r16. \stemNeutral mib'!32 do'16. mib,32
   mib re sib' fa lab sol mib' do sib8~sib32 la do mib, re mib mi fa fad sol mib' do sib8~sib32 la do mi,

   %63
   \once\stemUp re16\stemDown sib'' sib sib sib8\fermata do,\upprall sib4 r

}

IImsn = \relative do {

   r8 r4 sib r sib
   r8 mib\p fa fa r sib, re4
   r8 mib\f fa fa, sib8. sib'16 fa16. sib32 re,16. fa32

   %4
   sib,8 sib' sib sib r sib sib sib
   la4\p la8 la r sol sol sol\f\mbreak
   r sol sol sol\p r sol sol sol

   %7
   r16. mi32\f mi8 r16. mi32 mi8 fa4\staccatissimo r16 lab(fa re)
   si(re) sol,8 r si do4\staccatissimo r16 sol'(mib do)
   la(do) fa,8 r la sib r r4

   %10
   mib,\p fa8 fa\mbreak r fad\f(sol) fa
   mib mib fa[fa] sib sib16.\p\tasto (re32)\grace re16 do8(sib)
   r sib16.(re32) \grace re16 do8 (sib) r4 r8 re\ff

   %13
   mib4 fa sib,8 r r4
   r sib r sib\mbreak
   r8 <sol' mib> <la fa> <la fa> r sib, re4

   %16
   r8 mib fa fa, sib8. sib'16 fa16. sib32 re,16. fa32
   sib,8\staccatissimo <fa'' sib,> <fa sib,> <re sib> r sib sib sib
   la4 la8 la r sol sol sol\mbreak

   %19
   r sol sol sol r sol sol r
   r16. mi32\f mi8 r16. mi32 mi8 fa4 r8 fa
   sib sib r <sol' si,> <sol do,> <sol do,> r <<mi\\dod>>

   %22
   re fa, sol[sol] do, do' sib sib\mbreak
   r <fa' la,> <fa la,> <fa la,> r <sol, mi> <sol mi> <sol mi>
   fa <fa' re>  <fa do> <re sib> <do la> re, do[sib]

   %25
   la4 r r8  \stemDown  re do do\mbreak
   fa sib, r do fa sib, r do
   fa sib, do [do,] fa fa'16.\p la32\stemDown \grace la8 sol fa

   %28
   r <<{s16.\pp\su fa'32}\\ {\giu <la, fa>16.[ la32]}>> \stemDown \grace la16 sol8 <la fa> \stemNeutral r4 fa,
   r fa\f r fa\mbreak
   r8 sib\p do do, r fa la4

   %31
   r8 sib\f do do fa,4 r16 lab'\pp(fa re)
   si(re) sol,8 r si  do4\staccatissimo r16 mib'!(do la)
   fad(la) re,8 r fad sol sol fa fa

   %34
   mi mi mib mib re re r <re' fad,>\mbreak
   r <re sol,> r <<{sol, sol [fad]}\\{dod re re16 re}>> do?(sib) la(sol)
   sol(mib') mib4\pp mib8~mib16 mib do'(la) sol8(fad)

   %37
   sol <sol mib> <sol re> <mib do>  <re sib> mib re do
   \stemDown sib4 r r8 mi re re\mbreak
   sol do, r re sol do, r re

   %40
   \stemNeutral sol, do re [re,] sol sol'\p sol sol
   r sol sol sol r16. fad32\f fad8 r16. fad32 fad8
   sol r r4 do,\p re8 re\mbreak

   %43
   r mib mib[re] do sib16. do32 re8 re,
   sol4\staccatissimo r16 sib'\pp(sol mi) dod(mi) la,8 r dod
   re fa <sib sol> <sib sol> r la dod,[dod]

   %46
   re4 r16 lab'(fa re)si(re) sol,8 r si
   do mib fa[fa] r sol[r <sib sol>]\mbreak
   lab <mib' lab,> <fad lab,> <fad lab,> <sol sol,>4 r8 sol,

   %49
   sol sol r sol do, do r do
   fa, fa r fa sib sib r sib
   r sib mib[mib] fa4 fa,

   %52
   r sib r sib\mbreak
   r8 <<sol'\\{mib <la fa> <la fa>}>> r sib, re4
   r8 mib fa fa, sib r r4

   %55
   r2 r4 r8sib
   mib4 r8 mib sib4 r8 sib\mbreak
   do la sib[mi,] fa4 r

   %58
   s4 s8 \stemUp la'16. la32 <sib sol>8 (<la fa>\staccatissimo) s4
   \stemNeutral r2 r8 fa sol la
   sib <sib sol> <sib fa> <sol mib> <fa re> sol fa mib\mbreak

   %61
   \stemDown re4 r r8 sol,8 fa fa
   \stemNeutral sib mib r fa sib, mib r fa
   sib,16 re sib mi, fa4_\fermata sib r16 lab'\f(fa re)

   %64
   si(re) sol,8 r si do4\staccatissimo r16 sol'(mib do)
   la(do) fa,8 r la sib r r4
   mib,\p fa8 fa\mbreak r fad\f(sol) fa

   %67
   mib mib fa[fa] sib sib16.\p\tasto (re32)\grace re16 do8(sib)
   r sib16.(re32) \grace re16 do8 (sib) r4 r8 re\ff
   mib4 fa sib,4 r

}


IIbcn = \relative do {

   r8 r4 sib r sib
   r8 mib\p fa fa r sib, re4
   r8 mib\f fa fa, sib8. sib'16 fa16. sib32 re,16. fa32

   %4
   sib,8 sib' sib sib r sib sib sib
   la4\p la8 la r sol sol sol\f\mbreak
   r sol sol sol\p r sol sol sol

   %7
   r16. mi32\f mi8 r16. mi32 mi8 fa4\staccatissimo r16 lab(fa re)
   si(re) sol,8 r si do4\staccatissimo r16 sol'(mib do)
   la(do) fa,8 r la sib r r4

   %10
   mib,\p fa8 fa\mbreak r fad\f(sol) fa
   mib mib fa[fa] sib sib16.\p^\markup\italic"Violoncello solo" (re32)\grace re16 do8(sib)
   r sib16.(re32) \grace re16 do8 (sib) r4 r8 re\ff^\markup\italic\center-align"tutti i bassi"

   %13
   mib4 fa <<{sib,8 r}\\sib4>> r
   R1*2
   r2 r8. sib'16\f fa16. sib32 re,16. fa32

   %17
   sib,8\staccatissimo r r4 r2
   R1*2
   r16. mi32\f mi8 r16. mi32 mi8 fa r r4

   %21
   R1
   r2 r8 do\f  sib\staccatissimo r\mbreak
   r la\p la\staccatissimo r r mi\f mi\staccatissimo  r

   %24
   R1
   la8\f\staccatissimo r r4 r2\mbreak
   R1*3

   %29
   r4 fa\f r fa \mbreak
   r8 sib\p do do, r fa la4
   r8 sib\f do do fa,4 r16 lab'\pp(fa re)

   %32
   si(re) sol,8 r si  do4\staccatissimo r16 mib'!(do la)
   fad(la) re,8 r fad sol sol fa fa
   mi mi mib mib r2\mbreak

   %35
   r2 r8. re16\f do(sib) la(sol)
   sol(mib') mib4\pp mib8~mib16 mib do'(la) sol8(fad)
   R1

   %38
   sib,8\staccatissimo \f r r4 r2\mbreak
   R1
   r2 r8 sol'\p sol sol

   %41
   r sol sol sol r16. fad32\f fad8 r16. fad32 fad8
   sol r r4 do,\p re8 re\mbreak
   r mib mib[re] do sib16. do32 re8 re,

   %44
   sol4\staccatissimo r16 sib'\pp(sol mi) dod(mi) la,8 r dod
   re r r4 r2
   r4 r16 lab'\pp(fa re) si(re) sol,8 r si

   %47
   do r r4 r2\mbreak
   R1*4
   r4 sib\f r sib\mbreak

   %53
   r2 r8 sib\f re4
   r8 mib fa fa, sib r r4
   R1*6

   %61
   re8\staccatissimo \f r r4 r2
   R1
   r2  r4 r16 lab'\f(fa re)

   %64
   si(re) sol,8 r si do4\staccatissimo r16 sol'(mib do)
   la(do) fa,8 r la sib r r4
   mib,\p fa8 fa\mbreak r fad\f(sol) fa

   %67
   mib mib fa[fa] sib sib16.\p^\markup\italic"Violoncello solo" (re32)\grace re16 do8(sib)
   r sib16.(re32) \grace re16 do8 (sib) r4 r8 re\ff^\markup\italic\center-align"tutti i bassi"
   mib4 fa sib, r

}

IIbfn =  \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentUp

   s8
   s1
   s8 <6 5> s4 s <6>
   s <6 4>8 <5 3> s2
   s8 <5> s4 s8 <4!> s4
   <6\\>1
   s4 <7!>8 <6!> s2
   s16. <6 5>32 s8 s4 s s16 <6> s8
   <6 5> <_!> s <6> s4 s16 <6 4> <6>8
   <6 5>4 s8 <6> s2 %% fine p. 12 OK
   s4 <8 6>8 <7- 5> s <5> <_-> <6 _->
   <7> <6> <6 4> <5 3>s2
   s s4 s8 <6>
   s1*7
   s16. <6>32 s8 s2 s4
   s1*9
   s8 <6> <6 4> <5 _!> s4 <6> %% OK bar 30
   s4 <6 4>8 <5 _!> s2
   s1*9
   s8 <4 2> s4 s16. <6 5>32 s8 s4
   s2 s4 <8 6>8 <7 5 _+> %%% ok bar 42
   s4 s8 <6 4> <6 5> <6> <6 4> <5 _+>
   s1*10
   s4 <6 4>8 <5 3>  s2
   s1*8
   s2 s4 s16 <6> <6 _->8  %%%%% ok bar 63
   <5> <7 _!> s <6> s4 s8 <6>
   <5> <7> s <6> s2
   s4 <8 6>8 <7 5> s <5> <_-> <6 _->
   <7> <6> <6> s s2
   s s4 s8 <6>

}


forma = {

   \key sib\major
   \time 4/4
   \tempo 4 = 45
   \partial 8 s8
   s1*69
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

IImd = {
   \IIglobal
   \context Staff = up
   <<\IImdn \forma>>

}

IIms = {
   \IIglobal
   \clef bass
   \context Staff = down
   <<\IImsn \forma\IIbfn>>

}

IIbc = {
   \IIglobal
   \clef bass
   <<\IIbcn \forma>>
   \typeset

}



IIIglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.4
  \override TupletBracket.bracket-visibility = ##f
  \terzine \senza
}


IIIvlIn = \relative do'' {

  fa,16 fa fa fa la la la la do do do do
  fa4 r8 la fa do
  re sib fa4 r8 re'

  %4
  do la fa4 fa'
  r8. do16 sol'4\staccatissimo sib,\staccatissimo
  la8 do fa, la do, mib

  %7
  re fa sib4 r8 re
  do fa la, do fa, la
  do,2(sib4\tr) \mbreak

  %10
  la\staccatissimo r8. do'16 la'4\staccatissimo
  sol\staccatissimo \grace sol4 fa2\tr
  mi4 r8. la,16\p fa'4\staccatissimo

  %13
  mi\staccatissimo \grace mi4 re2\tr
  dod4 r8. fa,16\f re'4\staccatissimo
  do!4\staccatissimo\grace do4 sib2\tr

  %16
  la4\staccatissimo dod4.(re16 mi)
  re8 re, re re' do!16 (sib la sol)
  fa4(mi8) mi16[mi] sol sol sib sib

  %19
  mi4\staccatissimo r8 sol,16 sol sib sib mi mi\mbreak
  sol sol sib, sib mi mi sol sol sib4\staccatissimo
  r16 sib,, la sib la sib la sib sol' sib, sol' sib,

  %22
  la la do do fa fa fa fa la la do do
  mib4\staccatissimo r8 la,16 la do do mib mib
  la la do, do mib mib la la do4\staccatissimo

  %25
  r16 mib,, re mib re mib re mib do' mib, do' mib,\mbreak %% fine p. 18 OK
  re re' re re re do sib la sol fa mi! re
  mi mi' mi mi mi re do sib la sol fa mi  %%% ripresa

  %28
  fa fa' fa fa fa mi re do sib la sol fa
  sol4\staccatissimo sol'\staccatissimo r8. sol16
  fad sol fad sol sib4\staccatissimo r8. sol,16\p

  %31
  fad sol fad sol sib4\staccatissimo r8. sol'16\f
  fad sol fad sol fad sol fad sol sib sol fad sol
  fad sol fad sol fad sol fad sol sib sol sib sol\mbreak

  %34
  la fa! sib sol \grace fa4 mi2\tr
  fa4\staccatissimo r8. fa,16\p re'4\staccatissimo
  do\staccatissimo \grace do sib2\tr

  %37
  la16\ff la' la, la' la, la' la, la' la, la' la, la'
  re,, re' re, re' re, re' re, re' re, re' re, re'
  sol,, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol'

  %40
  do, do' do, do' do, do' do, do' do, do' do, do'
  fa, fa' fa, fa' fa, fa' fa, fa' fa, fa' fa, fa'
  sib4\staccatissimo r8. sol16 la4\staccatissimo

  %43
  r8. fa16 sol4\staccatissimo mi\tr \mbreak
  fa8 do la fa re' sib
  sol mi fa re si4

  %46
  r8. si16 do4\staccatissimo do\staccatissimo
  fa8 do fa4\staccatissimo r %%%%%%%%%% fine ripresa
  R2.*5

  %53
  r8 fa'\f la, do fa, la\mbreak
  do,2(sib4\tr)
  la\staccatissimo r r

  %56
  R2.*7
  r16 sol'\f fad sol fad sol fad sol re' fa, re' fa,\mbreak
  mi4\staccatissimo r r

  %65
  R2.*18
  mi2.\pp~
  mi

  %85
  do''4\staccatissimo\mf mi,\staccatissimo fa\staccatissimo
  do'\staccatissimo fad,\staccatissimo sol\staccatissimo
  <fa! si, re, sol,>8\f r r4 r

  %88
  R2.\mbreak
  r8 si4\p re do8~
  do si4 la sol8

  %91
  R2.*3
  do,16 \f do do do mi mi mi mi sol sol sol sol
  do4 r8 sol mi do\mbreak

  %96
  la' fa do4 r8 la'
  sol mi do4 do'
  r8. sol16 re'4\staccatissimo fa,\staccatissimo

  %99
  mi8 sol do, mi sol, sib!
  la do fa4 r8 la,
  sol do mi do, mi sol

  %102
  sol2(fa4\tr)
  mi\staccatissimo r8. sol16 mi'4\staccatissimo
  re\staccatissimo \grace re do2\tr

  %105
  si4 r8. mi,16\p do'4\staccatissimo \mbreak
  si4\staccatissimo \grace si la2\tr
  sold4 r8. do,16\f la'4\staccatissimo

  %108
  sol!\staccatissimo \grace sol fa2\tr
  mi16\ff mi' mi, mi' mi, mi' mi, mi' mi, mi' mi,mi'
  la, la' la, la' la, la' la, la' la, la' la, la'

  %111
  re,, re' re, re' re, re' re, re' re, re' re, re'
  sol,, sol' sol, sol' sol, sol' sol, sol'sol, sol' sol, sol'
  do, do' do, do' do, do' do, do' do, do' do, do'

  %114
  fa,4\staccatissimo fa'\staccatissimo r8. re16
  dod re dod re fa4\staccatissimo r8. re,16\p
  dod re dod re fa4\staccatissimo r8. re'16\f\mbreak%%%% fine primo sistema p. 22

  %117 OK
  dod re dod re dod re dod re fa re dod re
  dod re dod re dod re dod re la' fa mi re
  mi8.\staccatissimo do!16 re4\staccatissimo si\tr

  %120
  do8 sol mi[do] la' fa'
  re si do la fad4
  r8. fad16 sol4\staccatissimo sol,

  %123
  do\staccatissimo r r
  R2.*4
  r8 do''\f mi, sol do, mi

  %129
  sol,2(fa4\tr)
  mi\staccatissimo r r
  R2.

  %132
  r8 do''\pizz mi, sol do,4
  R2.
  r8 do' fa, la do,4

  %135
  R2.*8
  r4 r8 sib,\pizz do re
  mib4 fa sol

  %145
  lab sib sib,
  mib r r\mbreak
  r r8 do re mi!

  %148
  fa4 sol la
  sib do do,
  fa r r

  %151
  R2.*3
  r16 re\f\arco dod re dod re dod re la' do, la' do,
  sib8 r r4 r\mbreak

  %156
  r16 re'\f dod re dod re dod re la' do, la' do,
  sib8 r r4 re'\p\staccatissimo
  do\staccatissimo r do\staccatissimo

  %159
  si\staccatissimo r si\staccatissimo
  do\staccatissimo r r
  r8 fa,\pizz do la fa[mib]

  %162
  re[fa] sib re fa sib\mbreak
  la fa do la fa[la']
  sib sib, r4 r

  %165
  r sib'\p\arco(la)
  r la(sol)
  r sol (fa)

  %168
  r fa(mib)
  r mib\staccatissimo mib\staccatissimo
  r mib\staccatissimo mib\staccatissimo\mbreak

  %171
  r la\staccatissimo do\staccatissimo
  r fad,\staccatissimo do'\staccatissimo
  r8 fad,, la do mib[mib,]

  %174
  <fad' do re,>\f r r4 r
  R2.
  r4 r8. re16 sib'4\staccatissimo

  %177
  la\staccatissimo \grace la sol2\tr
  fad8 r r4 r
  R2.

  %180
  r4 r8. re,16\p sib'4\staccatissimo
  la\staccatissimo \grace la sol2\tr
  fad8 r r4 r

  %183
  R2.
  r4 r r8. si16\f
  si?2(do8) r

  %186
  r4 r r8. fad16\pp
  fad?2(sol8) r
  r4 r r8. la16\f

  %189
  sold la sold la do4\staccatissimo r\mbreak
  r4 r r8. la,16\p
  sold la sold la do4\staccatissimo r

  %192
  R2.*4
  sol16\f sol sol sol sib sib sib sib re re re re
  sol4 r8 sib sol re

  %198
  mib do sol4 r8 mib'\mbreak
  re sib sol4 sol'
  r8. re16 la'4\staccatissimo do,\staccatissimo

  %201
  sib16 sol fad sol fad sol fad sol re' fa, re' fa,
  mi! mi sol sol do do do, do mi mi sol sol
  sib!4\staccatissimo r8 mi,16 mi sol sol sib sib

  %204
  mi mi sib sib mi mi sol sol sib4\staccatissimo
  r16 sib,, la sib la sib la sib sol' sib, sol' sib,
  la la do do fa fa fa fa la la do do\mbreak

  %207
  mib4\staccatissimo r8 la,16 la do do mib mib
  la la do, do mib mib la la do4\staccatissimo
  r16 mib,, re mib re mib re mib do' mib, do' mib,

  %210
  re re' re re re do sib la sol fa mi! re
  mi mi' mi mi mi re do sib la sol fa mi
  fa fa' fa fa fa mi re do sib la sol fa

  %213
  sol sol' sol sol sol fa mi re do sib la sol
  la8 r r4 r\mbreak
  R2.*4

  %219
  r8 fa'\f la, do fa, la
  do,2(sib4\tr)
  la\staccatissimo  r r

  %222
  R2.*5
  la'16\ff la' la, la' la, la' la, la' la, la' la, la'
  re,, re' re, re' re, re' re, re' re, re' re, re'

  %229
  sol,, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol'
  do, do' do, do' do, do' do, do' do, do' do, do'
  fa, fa' fa, fa' fa, fa' fa, fa' fa, fa' fa, fa'

  %232
  sib, sib' r8 r4 r
  R2.*8
  fa2.\p ~

  %242
  fa~
  fa~
  fa4 r re'\staccatissimo \mf\mbreak

  %245
  do2.\pp~
  do~
  do4\staccatissimo do,,\staccatissimo \f mi'\staccatissimo\p

  %248
  r do,\staccatissimo\f fa'\staccatissimo\p
  r do,\staccatissimo\f  sol''\p
  r do,,\staccatissimo\f  la''\staccatissimo\p

  %251
  r do,,\staccatissimo\f sib''\staccatissimo\p
  do,,\staccatissimo\f do''\staccatissimo \p la,,\staccatissimo\mbreak
  sib\staccatissimo re\staccatissimo mi\staccatissimo

  %254
  fa\staccatissimo fad2\tr
  sol4\staccatissimo mib\staccatissimo re\staccatissimo
  dod\staccatissimo re\staccatissimo do\staccatissimo

  %257
  si\staccatissimo dod2\tr
  re4\staccatissimo sib!\staccatissimo la\staccatissimo
  sold\staccatissimo la\staccatissimo  sol\staccatissimo

  %260
  la''2 re,4\mbreak
  sol2 fa4\mf
  fa2(mib4)

  %263
  re2 r4
  r16 do,\f si do si do si do sol' sib, sol' sib,
  la8 r r4 r

  %266
  r16 do'\f si do si do si do sol' sib, sol' sib,
  la8 r r4 r\mbreak
  R2.*18

  %286
  la2.\pp ~
  la\mbreak
  la'4\staccatissimo\mf la\staccatissimo sib\staccatissimo

  %289
  si\staccatissimo si\staccatissimo do\staccatissimo
  <mi, sib! sol sol,>8\f r r4 r
  R2.

  %292
  r8 mi4\p sol fa8~
  fa mi4 re do8
  R2.*3

  %297
  fa,16 \f fa fa fa la la la la do do do do
  fa fa fa fa la la la la do4\staccatissimo
  r16 mib,, re mib re mib re mib do' mib, do' mib,

  %300
  re re' re re re do sib la sol fa mi! re  %% di qui ripresa
  mi mi' mi mi mi re do sib la sol fa mi  %%% ripresa
  fa fa' fa fa fa mi re do sib la sol fa

  %303
  sol4\staccatissimo sol'\staccatissimo r8. sol16
  fad sol fad sol sib4\staccatissimo r8. sol,16\p
  fad sol fad sol sib4\staccatissimo r8. sol'16\f

  %306
  fad sol fad sol fad sol fad sol sib sol fad sol
  fad? sol fad sol fad sol fad sol sib sol sib sol\mbreak
  la fa! sib sol \grace fa4 mi2\tr

  %309
  fa4\staccatissimo r8. fa,16\p re'4\staccatissimo
  do\staccatissimo \grace do sib2\tr
  la16\ff la' la, la' la, la' la, la' la, la' la, la'

  %312
  re,, re' re, re' re, re' re, re' re, re' re, re'
  sol,, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol'
  do, do' do, do' do, do' do, do' do, do' do, do'

  %315
  fa, fa' fa, fa' fa, fa' fa, fa' fa, fa' fa, fa'
  sib4\staccatissimo r8. sol16 la4\staccatissimo
  r8. fa16 sol4\staccatissimo mi\tr \mbreak

  %318
  fa8 do la fa re' sib
  sol mi fa re si4
  r8. si16 do4\staccatissimo do\staccatissimo

  %321
  fa4 r r

}


IIIvlIIn = \relative do'' {

  fa,16 fa fa fa la la la la do do do do
  fa4 r8 la fa do
  re sib fa4 r8 re'

  %4
  do la fa4 fa'
  r8. do16 sol'4\staccatissimo sol,\staccatissimo
  fa8 do' fa, la do, mib

  %7
  re fa sib4 r8 re
  do fa la, do fa, la
  do,2(sib4\tr) \mbreak

  %10
  la\staccatissimo r8. do'16 la'4\staccatissimo
  sol\staccatissimo \grace sol4 fa2\tr
  mi4 r8. la,16\p fa'4\staccatissimo

  %13
  mi\staccatissimo \grace mi4 re2\tr
  dod4 r8. fa,16\f re'4\staccatissimo
  do!4\staccatissimo\grace do4 sib2\tr

  %16
  la4\staccatissimo dod4.(re16 mi)
  re8 re, re re' do!16 (sib la sol)
  fa4(mi8) mi16[mi] sol sol sib sib

  %19
  mi4\staccatissimo r8 sol,16 sol sib sib mi mi\mbreak
  sol sol sib, sib mi mi sol sol sib4\staccatissimo
  r16 sib,, la sib la sib la sib sol' sib, sol' sib,

  %22
  la la do do fa fa fa fa la la do do
  mib4\staccatissimo r8 la,16 la do do mib mib
  la la do, do mib mib la la do4\staccatissimo

  %25
  r16 mib,, re mib re mib re mib do' mib, do' mib,\mbreak %% fine p. 18 OK
  re re' re re re do sib la sol fa mi! re
  mi mi' mi mi mi re do sib la sol fa mi  %%% ripresa

  %28
  fa fa' fa fa fa mi re do sib la sol fa
  sol4\staccatissimo sol'\staccatissimo r8. sol16
  fad sol fad sol sib4\staccatissimo r8. sol,16\p

  %31
  fad sol fad sol sib4\staccatissimo r8. sol'16\f
  fad sol fad sol fad sol fad sol sib sol fad sol
  fad sol fad sol fad sol fad sol sib sol sib sol\mbreak

  %34
  la fa! sib sol \grace fa4 mi2\tr
  fa4\staccatissimo r8. fa,16\p re'4\staccatissimo
  do\staccatissimo \grace do sib2\tr

  %37
  la16\ff la' la, la' la, la' la, la' la, la' la, la'
  re,, re' re, re' re, re' re, re' re, re' re, re'
  sol,, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol'

  %40
  do, do' do, do' do, do' do, do' do, do' do, do'
  fa, fa' fa, fa' fa, fa' fa, fa' fa, fa' fa, fa'
  sib,4\staccatissimo r8. sol'16 la4\staccatissimo

  %43
  r8. fa16 sol4\staccatissimo mi\tr \mbreak
  fa8 do la fa re' sib
  sol mi fa re si4

  %46
  r8. si16 do4\staccatissimo do\staccatissimo
  fa8 do fa4\staccatissimo r %%%%%%%%%% fine ripresa
  R2.*5

  %53
  r8 fa'\f la, do fa, la\mbreak
  do,2(sib4\tr)
  la\staccatissimo r r

  %56
  R2.*7
  r16 sol'\f fad sol fad sol fad sol re' fa, re' fa,\mbreak
  mi4\staccatissimo r r

  %65
  R2.*18
  do2.\pp~
  do

  %85
  mi'4\mf\staccatissimo  do\staccatissimo do\staccatissimo
  fad\staccatissimo do\staccatissimo si\staccatissimo
  <fa'! si, re, sol,>8 \f r r4 r

  %88
  R2.
  r8 re4\p fa  mi8~
  mi re4 do si8

  %91
  R2.*3
  do16 \f do do do mi mi mi mi sol sol sol sol
  do4 r8 sol mi do\mbreak

  %96
  la' fa do4 r8 la'
  sol mi do4 do'
  r8. sol16 re'4\staccatissimo re,\staccatissimo

  %99
  do8 sol' do, mi sol, sib!
  la do fa4 r8 la,
  sol do mi do, mi sol

  %102
  sol2(fa4\tr)
  mi\staccatissimo r8. sol16 mi'4\staccatissimo
  re\staccatissimo \grace re do2\tr

  %105
  si4 r8. mi,16\p do'4\staccatissimo \mbreak
  si4\staccatissimo \grace si la2\tr
  sold4 r8. do,16\f la'4\staccatissimo

  %108
  sol!\staccatissimo \grace sol fa2\tr
  mi16\ff mi' mi, mi' mi, mi' mi, mi' mi, mi' mi,mi'
  la, la' la, la' la, la' la, la' la, la' la, la'

  %111
  re,, re' re, re' re, re' re, re' re, re' re, re'
  sol,, sol' sol, sol' sol, sol' sol, sol'sol, sol' sol, sol'
  do, do' do, do' do, do' do, do' do, do' do, do'

  %114
  fa,4\staccatissimo fa'\staccatissimo r8. re16
  dod re dod re fa4\staccatissimo r8. re,16\p
  dod re dod re fa4\staccatissimo r8. re'16\f\mbreak%%%% fine primo sistema p. 22

  %117 OK
  dod re dod re dod re dod re fa re dod re
  dod re dod re dod re dod re la' fa mi re
  mi8.\staccatissimo do!16 re4\staccatissimo si\tr

  %120
  do8 sol mi[do] la' fa'
  re si do la fad4
  r8. fad16 sol4\staccatissimo sol,

  %123
  do\staccatissimo r r
  R2.*4
  r8 do''\f mi, sol do, mi

  %129
  sol,2(fa4\tr)
  mi\staccatissimo r r
  R2.*2

  %133
  r8 do'\pizz mi, sol do,4
  R2.*9
  r4 r8 sib\pizz do re
  mib4 fa sol

  %145
  lab sib sib,
  mib r r\mbreak
  r r8 do re mi!

  %148
  fa4 sol la
  sib do do,
  fa r r

  %151
  R2.*3
  r16 re\f\arco dod re dod re dod re la' do, la' do,
  sib8 r r4 r\mbreak

  %156
  r16 re'\f dod re dod re dod re la' do, la' do,
  sib8 r r4 fa'4\staccatissimo\p
  mib\staccatissimo r sol\staccatissimo

  %159
  re\staccatissimo r re\staccatissimo
  do\staccatissimo r r
  r fa fa

  %162
  fa2.~\mbreak
  fa~
  fa4 r r

  %165
  mib2.
  re
  do

  %168
  sib
  r4 la\staccatissimo sol\staccatissimo
  r fad\staccatissimo sol\staccatissimo

  %171
  r mib'\staccatissimo mib\staccatissimo
  r mib\staccatissimo mib\staccatissimo
  r8 fad, la do mib[mib,]

  %174
  <fad' do re,>\f r r4 r
  R2.
  r4 r8. re16 sib'4\staccatissimo

  %177
  la\staccatissimo \grace la sol2\tr
  fad8 r r4 r
  R2.

  %180
  r4 r8. re,16\p sib'4\staccatissimo
  la\staccatissimo \grace la sol2\tr
  fad8 r r4 r

  %183
  R2.
  r4 r r8. si16\f
  si?2(do8) r

  %186
  r4 r r8. do16\pp
  do2(re8) r
  r4 r r8. la'16\f

  %189
  sold la sold la do4\staccatissimo r\mbreak
  r4 r r8. la,16\p
  sold la sold la do4\staccatissimo r

  %192
  R2.*4
  sol16\f sol sol sol sib sib sib sib re re re re
  sol4 r8 sib sol re

  %198
  mib do sol4 r8 mib'\mbreak
  re sib sol4 sol'
  r8. re16 la'4\staccatissimo la,\staccatissimo

  %201
  sol16 sol fad sol fad sol fad sol re' fa, re' fa,
  mi! mi sol sol do do do, do mi mi sol sol
  sib!4\staccatissimo r8 mi,16 mi sol sol sib sib

  %204
  mi mi sib sib mi mi sol sol sib4\staccatissimo
  r16 sib,, la sib la sib la sib sol' sib, sol' sib,
  la la do do fa fa fa fa la la do do\mbreak

  %207
  mib4\staccatissimo r8 la,16 la do do mib mib
  la la do, do mib mib la la do4\staccatissimo
  r16 mib,, re mib re mib re mib do' mib, do' mib,

  %210
  re re' re re re do sib la sol fa mi! re
  mi mi' mi mi mi re do sib la sol fa mi
  fa fa' fa fa fa mi re do sib la sol fa

  %213
  sol sol' sol sol sol fa mi re do sib la sol
  la8 r r4 r\mbreak
  R2.*4

  %219
  r8 fa'\f la, do fa, la
  do,2(sib4\tr)
  la\staccatissimo  r r

  %222
  R2.*5
  la'16\ff la' la, la' la, la' la, la' la, la' la, la'
  re,, re' re, re' re, re' re, re' re, re' re, re'

  %229
  sol,, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol'
  do, do' do, do' do, do' do, do' do, do' do, do'
  fa, fa' fa, fa' fa, fa' fa, fa' fa, fa' fa, fa'

  %232
  sib, sib' r8 r4 r
  R2.*8
  la,4\p( sib do)

  %242
  re(do sib)
  la(sib do)
  re r fa\staccatissimo\mf  \mbreak

  %245
  mi\pp(fa sol)
  la(sol fa)
  mi\staccatissimo r do\staccatissimo\p

  %248
  r r do\staccatissimo
  r r do\staccatissimo
  r r do\staccatissimo

  %251
  r r do\staccatissimo
  do,\f \staccatissimo r la\staccatissimo\p \mbreak
  sib\staccatissimo re\staccatissimo mi\staccatissimo

  %254
  fa\staccatissimo fad2\tr
  sol4\staccatissimo mib\staccatissimo re\staccatissimo
  dod\staccatissimo re\staccatissimo do\staccatissimo

  %257
  si\staccatissimo dod2\tr
  re4\staccatissimo sib!\staccatissimo la\staccatissimo
  sold\staccatissimo la\staccatissimo  sol\staccatissimo

  %260 OOOOOOOKKKK
  do'4(sib2)~sib4 la(do\mf)
  fa,(sib la)~
  la sol r

  %263
  r16 do,\f si do si do si do sol' sib, sol' sib,
  la8 r r4 r

  %266
  r16 do'\f si do si do si do sol' sib, sol' sib,
  la8 r r4 r\mbreak
  R2.*18

  %286
  fa2.\pp~
  fa\mbreak
  fa'4\mf\staccatissimo fa\staccatissimo fa\staccatissimo

  %289
  fa\staccatissimo fa\staccatissimo mi\staccatissimo
  <mi sib! sol sol,>8\f r r4 r
  R2.

  %292
  r8 sol,4\p sib la8~
  la sol4 fa mi8
  R2.*3

  %297
  fa16 \f fa fa fa la la la la do do do do
  fa fa fa fa la la la la do4\staccatissimo
  r16 mib,, re mib re mib re mib do' mib, do' mib,

  %300
  re re' re re re do sib la sol fa mi! re  %% di qui ripresa
  mi mi' mi mi mi re do sib la sol fa mi  %%% ripresa
  fa fa' fa fa fa mi re do sib la sol fa

  %303
  sol4\staccatissimo sol'\staccatissimo r8. sol16
  fad sol fad sol sib4\staccatissimo r8. sol,16\p
  fad sol fad sol sib4\staccatissimo r8. sol'16\f

  %306
  fad sol fad sol fad sol fad sol sib sol fad sol
  fad? sol fad sol fad sol fad sol sib sol sib sol\mbreak
  la fa! sib sol \grace fa4 mi2\tr

  %309
  fa4\staccatissimo r8. fa,16\p re'4\staccatissimo
  do\staccatissimo \grace do sib2\tr
  la16\ff la' la, la' la, la' la, la' la, la' la, la'

  %312
  re,, re' re, re' re, re' re, re' re, re' re, re'
  sol,, sol' sol, sol' sol, sol' sol, sol' sol, sol' sol, sol'
  do, do' do, do' do, do' do, do' do, do' do, do'

  %315
  fa, fa' fa, fa' fa, fa' fa, fa' fa, fa' fa, fa'
  sib,4\staccatissimo r8. sol'16 la4\staccatissimo
  r8. fa16 sol4\staccatissimo mi\tr \mbreak

  %318
  fa8 do la fa re' sib
  sol mi fa re si4
  r8. si16 do4\staccatissimo do\staccatissimo

  %321
  fa4 r r

}


IIIvlan = \relative do' {

  la8 la do do la la
  la la la la la la
  sib sib re re sib sib

  %4
  la la la la la' la
  sol sol do, do do do
  do do la la la la

  %7
  sib sib re re sib sib
  la la do do la la
  r la sol sol mi sol\mbreak

  %10
  fa4\staccatissimo r8. la'16 do4\staccatissimo
  do\staccatissimo do(si\tr)
  do r8. la16\p la4\staccatissimo

  %13
  la\staccatissimo la (sold\tr)
  la r8. fa16\f fa4\staccatissimo
  fa\staccatissimo fa(mi\tr)

  %16
  fa8 fa fa fa fa fa
  fa fa fa fa mi16(re do sib)
  la4(sol8) do mi, sol

  %19
  do, do' sol mi do4\mbreak
  r r8 do'' sol mi
  do4\staccatissimo sol\staccatissimo mi\staccatissimo

  %22
  fa\staccatissimo  r8 fa' do la
  fa fa' do fa la, do
  fa,4\staccatissimo r8 fa la do

  %25
  fa4\staccatissimo do\staccatissimo la\staccatissimo\mbreak
  fa4\staccatissimo sol\staccatissimo r8. sol16
  sol4\staccatissimo la\staccatissimo r8. la16  %%%%% ripresa

  %28
  la4\staccatissimo sib\staccatissimo r8. sib16
  sib8 sol' sib sol mi4
  r8 mi sol sib mi,4

  %31
  r8 mi\p sol sib mi,4
  r r do'\f
  r r do8 do\mbreak

  %34
  do re16 sib \grace la4 sol2\tr
  fa4\staccatissimo r8. fa16\p fa4\staccatissimo
  fa\staccatissimo fa(mi8\tr re)

  %37
  dod4\ff r16 dod dod dod dod dod dod dod
  do4 r16 do do do do do do do
  si4 r16 si si si si si si si

  %40
  sib!4 r16 sib sib sib sib sib sib sib
  la4 r16 la la la la la la la
  fa4\staccatissimo r8. do'16 do4\staccatissimo

  %43
  r8. do'16 re4\staccatissimo sol,\tr \mbreak
  la8 do la fa re' sib
  sol mi fa re si4

  %46
  r8. si16 do4\staccatissimo do\staccatissimo
  fa8 do fa4\staccatissimo r %%%%%%%%% fine ripresa
  R2.*6

  %54
  r8 la,\f sol sol mi sol
  fa4\staccatissimo r r
  R2.*7

  %63
  r4 re'\staccatissimo\f si\staccatissimo\mbreak
  do4\staccatissimo r r
  R2.*20

  %85
  sol'4\staccatissimo\mf sol\staccatissimo fa\staccatissimo
  do\staccatissimo do\staccatissimo re\staccatissimo
  sol,8\f r r4 r

  %88
  R2.\mbreak
  r8 sol'4\p sol sol8~
  sol sol4 sol sol8

  %91
  R2.*3
  mi8\f mi sol sol mi mi
  mi mi mi mi mi mi\mbreak

  %96
  fa fa la la fa fa
  mi mi mi mi mi mi
  re re' sol, [sol sol sol]

  %99
  sol sol mi mi mi mi
  fa fa la la fa fa
  mi mi sol mi do  mi

  %102
  r mi re si si re
  sol,4\staccatissimo r8. mi'16 sol4\staccatissimo
  sol\staccatissimo sol(fad\tr)

  %105
  sol r8. mi16\p mi4\staccatissimo\mbreak
  mi\staccatissimo mi(red\tr)
  mi r8. do16\f do4\staccatissimo

  %108
  do\staccatissimo do(si8\tr) la
  sold4\ff r16 sold' sold sold sold sold sold sold
  sol!4 r16 sol sol sol sol sol sol sol

  %111
  fad4 r16 fad fad fad fad fad fad fad
  fa!4 r16 fa fa fa fa fa fa fa
  mi4 r16 mi mi mi mi mi mi mi

  %114
  do4\staccatissimo re\staccatissimo si
  r8 si re fa sol,4
  r8 si\p re fa sol,4\mbreak

  %117
  r r sol'\f
  r r re
  sol,8.\staccatissimo sol'16 la4\staccatissimo re,\tr

  %120
  mi8 sol mi do la'4
  r8 si do la fad4
  r8. fad16 sol4\staccatissimo sol,\staccatissimo

  %123
  do\staccatissimo r r
  R2.*5
  r8 mi\f re si si re

  %130
  sol,4\staccatissimo r r
  R2.*12
  r4 r8 sib\pizz do re

  %144
  mib4 fa sol
  lab sib sib,
  mib\staccatissimo r r\mbreak

  %147
  r4 r8 do re mi!
  fa4 sol la
  sib do do,

  %150
  fa\staccatissimo r r
  R2.*3
  r4 la,4\staccatissimo\arco fad\staccatissimo

  %155
  sol8 r r4 r\mbreak
  r la'4\staccatissimo\f fad\staccatissimo
  re8 r r4 sol\staccatissimo\p

  %158
  sol\staccatissimo r sol\staccatissimo
  sol\staccatissimo r sol\staccatissimo
  sol\staccatissimo r r

  %161
  r r mib(
  re2.)\mbreak
  do

  %164
  sib4 r r
  do'2.
  sib

  %167
  la
  sol
  R2.*2

  %171
  r4 fad\staccatissimo\p sol\staccatissimo
  r la\staccatissimo sol\staccatissimo
  r8 fad, la do mib[mib,]

  %174
  re\f r r4 r
  R2.
  r4 r8. sib''16\f re4\staccatissimo

  %177
  re\staccatissimo re(dod\tr)
  re8 r r4 r
  R2.

  %180
  r4 r8. sib,16\p re4\staccatissimo
  re\staccatissimo re(dod\tr)
  re8 r r4 r

  %183
  R2.
  r4 r r8. fa16\f
  fa2(sol8) r

  %186
  r4 r r8. la16\pp
  la2(sib8) r
  R2.

  %189
  r8 fad,\f la do mib4\mbreak
  r8 mib\p do la fad4
  r8 fad la do mib4

  %192
  R2.*4
  sib8\f sib re re sib sib
  sib sib sib sib sib sib

  %198
  do do mib mib do do\mbreak
  sib sib sib sib sib' sib
  la la re, re re re

  %201
  re4\staccatissimo  r8 re si sol
  do, do' mi! do sol[mi]
  do do' sol[do] mi, sol

  %204
  do,4\staccatissimo r8 do mi sol
  do4\staccatissimo sol\staccatissimo mi
  fa8 fa la fa do' la\mbreak

  %207
  fa fa' do fa la, do
  fa,4\staccatissimo r8 fa la do
  fa4\staccatissimo do\staccatissimo la\staccatissimo

  %210
  fa4\staccatissimo  sol\staccatissimo r8. sol16
  sol4\staccatissimo la\staccatissimo r8. la16
  la4\staccatissimo sib\staccatissimo r8. sib16

  %213
  sib4\staccatissimo do\staccatissimo do\staccatissimo
  do8 r r4 r\mbreak
  R2.*5

  %220
  r8 la\f sol sol mi sol
  fa4\staccatissimo r r
  R2.*5

  %227
  dod'4\ff r16 dod dod dod dod dod dod dod
  do!4 r16 do do do do do do do
  si4 r16 si si si si si si si

  %230
  sib!4 r16 sib sib sib sib sib sib sib
  la4 r16 la la la la la la la
  fa4\staccatissimo r r

  %233
  R2.*8
  fa4\p(sol la)
  sib(la sol)

  %243
  fa(sol la)
  sib r sol'\staccatissimo\mf\mbreak
  sol\pp(fa mi)

  %246
  fa(mi fa)
  sol\staccatissimo r sol\staccatissimo\p
  r r la\staccatissimo

  %249
  r r sol\staccatissimo
  r r fa\staccatissimo
  r r mi\staccatissimo

  %252
  fa\staccatissimo\f r la,\staccatissimo \p\mbreak
  sib\staccatissimo re\staccatissimo mi\staccatissimo
  fa\staccatissimo fad2\tr

  %255
  sol4\staccatissimo mib\staccatissimo re\staccatissimo
  dod\staccatissimo re\staccatissimo do\staccatissimo
  si\staccatissimo dod2\tr

  %258
  re4\staccatissimo sib!\staccatissimo la\staccatissimo
  sold\staccatissimo la\staccatissimo  sol\staccatissimo
  fad4\staccatissimo sol\staccatissimo fa\staccatissimo\mbreak

  %261
  mi\staccatissimo fa\staccatissimo mib'\mf (
  re2)(do4)
  re2 r4

  %264
  r sol,\staccatissimo \f mi\staccatissimo
  fa8 r r4 r
  r sol'\f\staccatissimo mi\staccatissimo

  %267
  do8 r r4 r\mbreak
  R2.*20\mbreak
  do'4\staccatissimo\mf do\staccatissimo sib\staccatissimo

  %289
  fa\staccatissimo fa\staccatissimo sol\staccatissimo
  sol8\f r r4 r
  R2.

  %292
  r8 do,4\p do do8~
  do do4 do do8
  R2.*3

  %297
  la8\f la do do la la
  la4 r8 fa la do
  fa4\staccatissimo do\staccatissimo la\staccatissimo

  %300
  fa\staccatissimo sol\staccatissimo r8. sol16
  sol4\staccatissimo la\staccatissimo r8. la16  %%%%% ripresa
  la4\staccatissimo sib\staccatissimo r8. sib16

  %303
  sib8 sol' sib sol mi4
  r8 mi sol sib mi,4
  r8 mi\p sol sib mi,4

  %306
  r r do'\f
  r r do8 do\mbreak
  do re16 sib \grace la4 sol2\tr

  %309
  fa4\staccatissimo r8. fa16\p fa4\staccatissimo
  fa\staccatissimo fa(mi8\tr re)
  dod4\ff r16 dod dod dod dod dod dod dod

  %312
  do4 r16 do do do do do do do
  si4 r16 si si si si si si si
  sib!4 r16 sib sib sib sib sib sib sib

  %315
  la4 r16 la la la la la la la
  fa4\staccatissimo r8. do'16 do4\staccatissimo
  r8. do'16 re4\staccatissimo sol,\tr \mbreak

  %318
  la8 do la fa re' sib
  sol mi fa re si4
  r8. si16 do4\staccatissimo do\staccatissimo

  %321
  fa, r r

}

IIImdn = \relative do'' {

  s2.*47
  <<
    {
      do4\tr re\staccatissimo mi\staccatissimo
      fa8.\tr sol16 la4\staccatissimo r8 do,

      %50
      re(fa) la(sib) fa(re)
      do(mi) fa(la) do do~
      do sib4 sol8(mi) sib

      %53
      la4
    }\\{
      \stemUp\shiftOn la4 sib sol
      la do la
      sib r sib
      la r la
      sol sol sol
    }
  >> r r
  R2.
  r4 r8. <do la>16 \stemUp <la' do,>4^\staccatissimo

  %56
  <sol do,>^\staccatissimo <<
    {
      \grace sol4 fa2\tr
      mi4 r fa\staccatissimo
      mi\staccatissimo \grace mi re2\tr

      %59
      dod4 r re\staccatissimo
      do!\staccatissimo \grace do sib2\tr
    }\\ {
      \shiftOn do4 si
      do r8. \once\stemUp la16 la4
      la la sold
      la r8. \once\stemUp fa16 fa4
      fa fa mi
    }
  >>
  \stemNeutral la4~la8 si16 dod re mi fa sol

  %62
  la fa mi re la'4. do,!8
  \grace re8 do si r4 r\mbreak
  r sol'8(mi) re\prall(do)

  %65
  \stemUp \slurUp do4. dod8 dod(re)
  re4 la'8(fa mi\prall re)
  re4. red8 red(mi)

  %68
  mi4 si'8(sol fad\prall mi)
  mi4. mi8 mi(fa!)
  fa4. fad8 fad(sol)

  %71
  sol4. sold8 sold(la)
  la(si) si(do) do(dod)
  dod?(re) re4. fa,!8

  %74
  fa16 mi re do re2\upprall\mbreak
  \stemNeutral \slurNeutral do4\staccatissimo r16 do re mi re do si la
  \once \slurUp sol2(fad4\pratu)

  %77
  fad?(sol16) re mi fad sol la si do
  re mi fa!8 r re si sol
  fa\tr mi r16 do' re mi re do si la

  %80
  \once\slurUp sol2(fad4\pratu)
  fad(sol16) sol fad sol fad sol fad sol
  si sol fad sol fad sol fad sol re' fa, re' fa,\mbreak

  %83
  mi do' mi, do' mi, do' mi, do' mi, do' mi, do'
  mi, do' mi, do' mi, do' mi, do' mi, do' mi, do'
  sol mi' sol, mi' sol, mi' sol, mi' fa, fa' fa, fa'

  %86
  do fad do fad do fad do fad si, sol' si, sol'
  r16\stemUp re fa si \stemDown re si fa re \stemUp mi \stemDown mi' \stemUp mi, \once \stemDown mi'
  re, si' re, si' do, la' do, la' si, sol' si, sol'\mbreak

  %89
  \stemNeutral r re fa si re si fa re \override Rest #'staff-position = #+4 r mi do' mi,
  r re si' re, r do la' do, r si sol' si,
  s2.

  %92
  fa8 si re fa, mi do'
  r16 do' mi, do' re, do' re, do' re, si' re, si'
  <<<do sol>4\\mi,>> r r

  %95
  s2.*28
  \stemUp sol,4\tr la^\staccatissimo si^\staccatissimo
  do8.\tr re16 mi4^\staccatissimo r8 sol,

  %125
  \slurUp la(do) mi(fa) do(la)\mbreak
  sol(si) do(mi) sol \once\tieUp sol~
  sol fa4 re8(si) fa

  %128
  mi4 r r\slurNeutral \stemNeutral
  R2.
  r8 do'' sol do mi, sol

  %131
  do, mi sol, do mi,[sol]
  do,4\staccatissimo r8 do'' mi, sol
  do,4\staccatissimo r8 do mi, sol

  %134
  do,4\staccatissimo r8 do'' fa, la
  do, do' \grace do4 sib2\tr
  la8 la \grace la4 sol2\tr\mbreak

  %137
  fa8 fa \grace fa4 mib2\tr %% inizio p. 23
  re4\staccatissimo <sol sib,>\staccatissimo <fa sib,>\staccatissimo
  \grace sib, la2\tr sib4

  %140
  \override Rest #'staff-position = #-3 r8.fa16 <<{mib'4\staccatissimo re\staccatissimo}\\{do sib}>>
  do16 mib re fa mib re do sib la sol fa mib
  re8[fa] lab re fa lab

  %143
  do(sib) \grace sib4 lab2\tr
  sol8 sib re,(fa) mib(sol)
  fa16 mib re do \grace sib4 lab2\tr

  %146
  sol8[sol] sib mib sol sib\mbreak
  re(do) \grace do4 sib2\tr
  la!8 do mi,!(sol) fa (la)

  %149
  sol16 fa mi re \grace do4 sib2\tr
  la8 la do mib la do
  mib,,4(re) \override Rest #'staff-position = #+1.5 r8. do'16

  %152
  \grace {sib16[re]} do4(sib) \override Rest #'staff-position = #+2 r8. re16
  re fa mib re  mib do mib re do sib la sol
  \grace sol8 fad4\prall r r

  %155
  s8 sol16 sib re sib la sol r la mib' sol,\mbreak
  fad4 r r %%%%% <-------------------------------------- OK ultimo sistema p. 23
  r16 sol' fad sol fad sol fad sol re' sol, re' sol,

  %158
  r sol fad sol fad sol fad sol do sol do sol
  r sol fad sol fad sol fad sol si sol si sol
  do sol mib do si do mib sol do sol mib do

  %161
  la' fa mi! fa mi fa mi fa do' fa, do' fa,
  r fa mi fa mi fa mi fa sib fa sib fa\mbreak
  r fa mi fa mi fa mi fa la fa la fa

  %164
  sib fa re sib la sib re fa sib fa mib re
  sib' mib, re mib re mib re mib la mib re mib
  la re, dod re dod re dod re sol re dod re

  %167
  sol do,! si do si do si do fa do si do
  fa sib,! la sib la sib la sib mib sib la sib
  mib la, sold la mib'4\staccatissimo r

  %170
  do16 mib, re mib fad4\staccatissimo r\mbreak
  la'16 mib re mib re mib re mib sol mib re mib
  fad mib re mib re mib re mib sol mib re mib

  %173
  la do, si do si do si do sol' do, si do
  fad do la' fad do' sib? la sol fad mib re do
  sib sol' mib do \grace sib4 la2\pratu

  %176
  sol4 r r
  R2.
  r16 re'' do sib la sol fad mi re do sib la

  %179
  sol fa? mib re dod8 sib' r sol\mbreak
  \grace {fad16[la]} sol4(fad) r
  R2.

  %182
  r16 re mi fad sol la si dod re mi fad sol
  la sib! do! sib la sol fad mi re do sib la
  sib sol re' sib la4\staccatissimo r

  %185
  r r r8. \stemUp <re sol,>16
  \once\slurUp <re sol,>2\((<mib sol,>8)\) r
  r4 r r8. <sold re>16

  %188
  \once\slurUp <sold? re>2(<la mib>8) r
  \slurNeutral\stemNeutral r4 r r8. do,16\mbreak
  si16 do si do mib4\staccatissimo r

  %191
  r r r8. do,16
  si do si do mib4\staccatissimo r8. la'16
  sold la sold la sold la sold la do la sold la

  %194
  sold la sold la sold la sold la re, fad la do
  sib sol do la \grace sol4 fad2\tr
  sol4 s2

  %197
  s2.*17
  <<
    {
      do,4\tr re\staccatissimo mi\staccatissimo
      fa8.\tr sol16 la4\staccatissimo \override Rest #'staff-position = #+4 r8 do,

      %216
      re(fa) la(sib) fa(re)
      do(mi) fa(la) do do~
      do sib4 sol8(mi) sib

      %219
      la4
    }\\{
      \stemUp\shiftOn la sib sol
      la do la
      sib r sib
      la r la
      sol sol sol
    }
  >> r r
  R2.
  r4 r8. \stemUp <do la>16 <la' do,>4\staccatissimo

  %222
  <<
    {
      sol\staccatissimo \grace sol fa2\tr
      mi4 \override Rest #'staff-position = #-1 r8. la,16 fa'4\staccatissimo
      mi\staccatissimo \grace mi re2\tr

      %225
      dod4 r8. fa,16 re'4\staccatissimo
      do!4\staccatissimo \grace do sib2\tr
      la4
    }\\{
      \stemUp\shiftOn do \stemDown do si
      do s \once\stemUp la
      la la sold
      la s fa
      fa fa mi8 re
      dod4
    }
  >> s s

  %228
  s2.*4
  \stemUp r4 r8. <fa' re>16 <re' fa,>4^\staccatissimo
  <do fa,>^\staccatissimo <<
    {
      \grace do sib2\tr

      %234
      la4 r8. re,16 sib'4\staccatissimo
      la\staccatissimo \grace la sol2\tr
      fad4 r8. sib,16 sol'4\staccatissimo

      %237
      fa!\staccatissimo \grace fa mib2\tr \mbreak
      r16 re dod re mib re dod re sib' re, sib' re,
      r do si do re do si do la' do, la' do,

      %240
      r sib! la sib do sib la sib sol' sib, sol' sib,
    }\\{
      \once\shiftOn fa'4 mi
      \once\shiftOn fa s \once\stemUp\once\shiftOn re4
      \shiftOn re re dod
      re s s
      s sib la~
      la la sol~
      sol sol fa~
      fa fa mi
    }
  >>
  \stemNeutral r16 la sol la fa' sib, la sib fa' do si do
  fa re dod re fa do si do fa sib,! la sib

  %243
  r la sol la fa' sib, la sib fa' do si do
  fa re dod re dod re dod re sol, si re fa\mbreak
  r mi re mi do' fa, mi fa do' sol fad sol

  %246
  do la sold la do sol fad sol do fa, mi fa
  r mi red mi red mi red mi do mi do mi
  mi fa mi fa mi fa mi fa do fa do fa

  %249
  fad sol fad sol fad sol fad sol do, sol' do, sol'
  sold la sold la sold la sold la do, la' do, la'
  la sib la sib la sib la sib do, sib' do, sib'

  %252
  si do si do si do si do do, do' do, do'\mbreak
  do re do re sib re sib re sib re sib re
  sib do sib do la do la do la do la do

  %255
  la sib la sib sol sib sol sib sol sib sol sib
  sol la sol la fa la fa la fa la fa la
  fa sol fa sol mi sol mi sol mi sol mi sol

  %258
  mi fa mi fa re fa re fa re fa re fa
  re  mi re mi do  mi do mi do mi do mi
  do re do re sib re sib re sib re sib re \mbreak

  %261
  sib do sib do la do la do mib, do' mib, do'
  re, do' re, do' re, sib' re, sib' do, la' do, la'
  sib,16 re mi fad sol la sib do re sib la sol

  %264
  \grace fa!8 mi4 r r
  s8 fa16 la do la sol fa r re' sol, fa
  mi4 r r

  %267
  r do'8(la sol\prall fa)\mbreak
  \stemUp fa4. fad8 fad(sol)
  sol4 re'8(sib la\prall sol)

  %270
  sol4. sold8 sold(la)
  la4 \slurUp mi'8(do si\prall la)
  la4. la8 la(sib!)

  %273
  sib4. si8 si(do)
  do4. dod8 dod(re)
  re(mi) mi(fa) fa(fad)

  %276
  fad?(sol) \stemNeutral sol4. sib,8
  sib16 la sol fa sol2\upprall
  fa4\staccatissimo r16 fa' sol la sol fa mi re

  %279
  \stemUp do2(si4\pratu)\mbreak
  \stemNeutral \slurNeutral \once\stemUp \once\slurUp si4(do16) sol la si do re mi fa
  sol la sib!8 r sol mi sib

  %282
  sib\tr la r16 fa sol la sol fa mi re
  do2(si4\pratu)
  si?4(do16) do' si do si do si do

  %285
  mi do si do si do si do sol' sib, sol' sib,
  la fa' la, fa' la, fa' la, fa' la, fa' la, fa'
  la, fa' la, fa' la, fa' la, fa' la, fa' la, fa'\mbreak

  %288
  do la' do, la' do, la' do, la' sib, sib' sib, sib'
  fa si fa si fa si fa si mi, do' mi, do'
  r sol, sib! mi sol mi sib sol la fa' la, fa'

  %291
  sol, mi' sol, mi' fa, re' fa, re' mi, do' mi, do'
  r sol sib mi sol mi sib sol r la fa' la,
  r sol mi' sol, r fa re' fa, r mi do' mi,

  %294
  s2.
  sol'8 sib re mi, fa fa,
  r16 \stemDown fa \giu\stemUp la, \su \stemDown fa' \giu\stemUp sol, \su \stemDown fa' \giu\stemUp sol, \su \stemDown fa' \giu\stemUp sol, \su \stemDown mi' \giu\stemUp sol, \su \stemDown mi'

  %297
  \stemNeutral fa4 r r

}

IIImsn = \relative do {

  fa8 fa fa fa fa fa
  fa fa fa fa fa fa
  fa fa fa fa fa fa

  %4
  fa fa fa fa fa fa
  mi mi mi mi mi mi
  fa fa fa fa fa fa

  %7
  fa fa fa fa fa fa
  fa fa fa fa fa fa
  r fa mi sol do, mi\mbreak

  %10
  fa,4\staccatissimo r8. fa'16 fa'4\staccatissimo
  mi_\staccatissimo re2
  do4 r8. dod16\p re4\staccatissimo

  %13
  do!_\staccatissimo sib2
  la4 r8. la16\f sib4\staccatissimo
  la\staccatissimo sol2

  %16
  fa8 fa la, la la la
  sib sib sib sib sib sib
  do  do' sol do mi, sol

  %19
  do, do' sol mi do4\mbreak
  r r8 do' sol mi
  do4\staccatissimo mi\staccatissimo do\staccatissimo

  %22
  fa,8 fa' la fa do la
  fa fa' do fa la, do
  fa,4\staccatissimo r8 fa la do

  %25
  fa4_\staccatissimo la_\staccatissimo fa_\staccatissimo\mbreak % fine p 18
  sib,\staccatissimo sib\staccatissimo r8. si16
  do4\staccatissimo do\staccatissimo r8. dod16  %%ripresa

  %28
  re4\staccatissimo re\staccatissimo r8. re16
  mi8 sol sib sol mi4
  r8 mi sol sib mi,4

  %31
  r8 mi\p sol sib mi,4
  r r mi\f
  r r mi8 mi\mbreak

  %34
  fa sib, do4 do
  re\staccatissimo r8. la'16\p sib4\staccatissimo
  la_\staccatissimo  sol2

  %37
  sol4\ff r16 sol sol sol sol sol sol sol
  fad4 r16 fad fad fad fad fad fad fad
  fa!4 r16 fa fa fa fa fa fa fa

  %40
  mi4 r16 mi mi mi mi mi mi mi
  mib4 r16 mib mib mib mib mib mib mib
  re4\staccatissimo r8. mi!16 fa4\staccatissimo

  %43
  r8. la16 sib4_\staccatissimo do\staccatissimo
  fa,8 do' la fa re' sib
  sol mi fa re si4

  %46
  r8. si16 do4\staccatissimo do\staccatissimo
  fa8 do fa4\staccatissimo r  %%%% fine ripresa
  \su \stemDown fa'_\staccatissimo fa_\staccatissimo fa_\staccatissimo

  %49
  fa fa fa
  fa s fa
  fa s fa

  %52
  mi mi mi
  fa \giu\stemNeutral  r r\mbreak
  r8 fa,\f mi sol do, mi

  %55
  fa4\staccatissimo r8. fa16 \su\stemDown fa'4_\staccatissimo
  mi_\staccatissimo re2
  do4 r8. dod16\p re4

  %58
  do!_\staccatissimo \giu sib!2
  la4 \stemNeutral r8. la16\f sib4\staccatissimo
  la\staccatissimo sol2

  %61
  fa4 fa, r
  r r8 fad'16 [mi fad8 re]
  sol4 si\staccatissimo sol\staccatissimo\mbreak

  %64
  do\staccatissimo r r  %% inizio 2do sistema p 20
  \su r8 \stemDown <sol' mi> <sol mi>4 r
  r8 <la fa> <la fa>4 r

  %67
  r8 <la fad>\p <la fad>4 r
  r8 <si sol> <si sol>4 r
  r8 <si sold> <si sold>4 r

  %70
  r8 <do la> <do la>4 r
  r8 <re si> <re si>4 <re si>
  <mi do> <mi sold,> <mi la,>

  %73
  si \giu r8 si,16 re \su sol 8\giu\stemUp si,
  \stemDown do \su mi sol4 \giu\stemUp sol,\mbreak
  \stemNeutral r8 la la,4\staccatissimo r

  %76
  r8 <do' la> <do la> <do la> <do la> <do la>
  r8 si si,4\staccatissimo r
  r si'\staccatissimo sol\staccatissimo

  %79
  r8 do do,4\staccatissimo r
  r8 <do' la> <do la> <do la> <do la> <do la>
  r8 si si,4\staccatissimo r

  %82
  sol' r8 la si sol\mbreak
  do si la sol fa mi
  la sol fa mi re do

  %85
  sib! sib' r sib la[la,]
  lab lab' r lab sol[sol,]
  sol4\su\stemDown r sol''

  %88
  sol sol sol\mbreak
  \giu\stemNeutral sol,, r \su\stemDown sol''
  sol sol sol

  %91
  \giu \stemDown r8 sol,,16[sib  re8] \stemUp fa si re
  \giu \stemNeutral r4 r do,
  fa sol sol,

  %94
  do8 do' do do do do
  do do do do do do  %%%%%% fine sistema p.21
  do do do do do do

  %97
  do do do do do do
  si si si si si si
  do do do do do do

  %100
  do, do do do do do
  do do do do do do
  r do si re sol, si

  %103
  do4\staccatissimo r8. do16 do'4\staccatissimo
  si_\staccatissimo la2
  sol4 r8. sold16\p la4_\staccatissimo\mbreak

  %106
  sol!_\staccatissimo fa2
  mi4 r8. mi16\f fa4\staccatissimo
  mi\staccatissimo re2

  %109
  re4\ff r16 re re re re re re re
  dod4 r16 dod dod dod dod dod dod dod
  do!4 r16 do do do do do do do

  %112
  si4 r16 si si si si si si si
  sib!4 r16 sib sib sib sib sib sib sib
  la8 do si re sol,4

  %115
  r8 si re fa sol,4
  r8 si\p re fa sol,4\mbreak
  r r si\f

  %118
  r r si
  do8.\staccatissimo mi16 fa4_\staccatissimo sol_\staccatissimo
  do,8 sol' mi do la'4

  %121
  r8 si do la fad4
  r8. fad16 sol4\staccatissimo sol,\staccatissimo
  <<
    {
      \su \stemDown mi'' fa re

      %124
      mi sol mi
      fa \override Rest #'staff-position = #-4 r fa
      mi r mi
    }\\{
      \giu\stemDown do re do
      do do do
      do \override Rest #'staff-position = #+3 r do
      do r do
    }
  >>

  %127 OOOKKK
  \giu \stemNeutral <re si> <re si> <re si>
  do r r
  r8 do, si re sol, si

  %130
  do4\staccatissimo r r
  R2.
  r8 sib'! sib,4\staccatissimo r

  %133
  r8 sib' sib,4\staccatissimo r
  r8 la' la,4\staccatissimo r
  r8 la' sol sol sol sol

  %136
  fa fa mi mi mi mi\mbreak
  re <sib' re,> <sib do,> <sib do,> <la do,> <la do,>
  sib, sib mib mib re re

  %139
  <<{mib mib mib mib fa fa}\\{do do do do re re}>>
  la la la la sib sib
  fa4 r8 fa' sol la

  %142
  sib4\staccatissimo r r
  r r8 sib, do re
  mib4 fa sol

  %145
  lab sib sib,
  mib\staccatissimo r r\mbreak
  r r8 do re mi!

  %148
  fa4 sol la
  sib do do,
  fa\staccatissimo r r

  %151
  r8 sol fad la re, fad
  r sol re sib sol[sib]
  do2.

  %154
  re4\staccatissimo fad\staccatissimo re\staccatissimo
  \stemDown sib'16 re s8 s4 \stemNeutral do,4\mbreak
  re\staccatissimo fad\staccatissimo re\staccatissimo

  %157
  sol\staccatissimo  r si
  do r mib,
  fa! r fa

  %160
  mib r r
  fa r la
  sib r re,\mbreak

  %163
  mib r mib
  re r r
  do r fa

  %166
  sib, r mib
  la, r re
  sol, r do

  %169
  fad16 do' si do si do si do sol do si do
  la do si? do si do si do sol do si do\mbreak
  fad,16 do' si do si do si do sol do si do

  %172
  la do si do si do si do sol do si do
  fad, la sold la sold la sold la mib la sold la
  re,4 r re

  %175
  sol8 do re4 re,
  sol r8. sol,16\f sol'4\staccatissimo
  fa!\staccatissimo mib2

  %178
  re4\staccatissimo r r
  r r mib\mbreak
  re r8. sol,16\p sol'4\staccatissimo

  %181
  fa\staccatissimo mib2
  re4\staccatissimo r r
  r re\staccatissimo fad\staccatissimo

  %184
  sol\staccatissimo re\staccatissimo r8. re16\f
  re2(mib8)[r16 si']
  si?2(do8) r

  %187
  r4 r r8. \su \stemDown si'16\pp
  \once\slurDown si?2(do8) s
  \giu\stemNeutral r8 fad,,\f la do mib4\mbreak

  %190
  r8 mib do la fad4
  r8 fad, la do mib4
  r8 mib do  la fad4

  %193
  r r fad'
  r r fad
  sol8 do, re4 re,

  %196
  sol8 sol'\f sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol\mbreak

  %199
  sol sol sol sol sol sol
  fad fad fad fad fad fad
  sol4\staccatissimo r8 re si sol

  %202
  do, do' mi! do sol[mi]
  do do' sol[do] mi, sol
  do,4\staccatissimo r8 do mi sol

  %205
  do4\staccatissimo mi\staccatissimo do\staccatissimo
  fa,8 fa' la fa do la\mbreak
  fa fa' do fa la, do

  %208
  fa,4\staccatissimo r8 fa la do
  fa4_\staccatissimo la_\staccatissimo fa_\staccatissimo
  sib,\staccatissimo sib\staccatissimo r8. si16

  %211
  do4\staccatissimo do\staccatissimo r8. dod16
  re4\staccatissimo re\staccatissimo r8. re16
  mi4\staccatissimo mi\staccatissimo mi\staccatissimo

  %214
  \su \stemDown fa'_\staccatissimo fa_\staccatissimo fa_\staccatissimo\mbreak
  fa fa fa
  fa s fa

  %217
  fa s fa
  mi mi mi
  fa \giu \stemNeutral r r

  %220
  r8 fa,\f mi sol do, mi
  fa4\staccatissimo r8. fa16 \su\stemDown fa'4_\staccatissimo
  mi_\staccatissimo re2

  %223
  do4 \override Rest #'staff-position = #-5 r8. dod16\p re4_\staccatissimo
  \giu\stemNeutral do!\staccatissimo sib!2
  la4 r8. la16\f sib4\mbreak

  %226
  la\staccatissimo sol2
  sol4 r16 sol sol sol sol sol sol sol
  fad4 r16 fad fad fad fad fad fad fad

  %229
  fa!4 r16 fa fa fa fa fa fa fa
  mi4 r16 mi mi mi mi mi mi mi
  mib4 r16 mib mib mib mib mib mib mib

  %232
  re4\staccatissimo r8. sib'16 \su\stemDown sib'4_\staccatissimo
  la_\staccatissimo sol2
  fa4 s8. fad16\f sol4

  %235
  fa!_\staccatissimo mib2
  re4 s8. re16\f <sib' mib,>4
  <sib re,> do,2\mbreak

  %238
  \giu \stemNeutral sib s4
  la2 s4
  sol2 s4

  %241
  fa sol la
  sib la sol
  fa sol la

  %244
  sib r si\mbreak
  do \su\stemDown re mi
  fa mi re

  %247
  \giu do r sib
  la r la
  mi r mi

  %250
  fa r fa
  sol r sol
  la r la\mbreak

  %253
  sib \su re mi
  fa fad2
  sol4 mib re

  %256
  \giu\stemNeutral dod re do
  si dod2
  re4 sib! la

  %259
  sold la sol
  fad sol fa\mbreak
  mi fa la,

  %262
  sib r r
  \su\stemDown sib'4 \giu\stemNeutral sib,2
  do4\staccatissimo mi\staccatissimo do\staccatissimo

  %265
  la'16 do s8 s4 sib
  do\staccatissimo mi\staccatissimo do\staccatissimo
  fa,\staccatissimo r r\mbreak

  %268
  r8 <do' la> <do la>4 r
  r8 <re sib> <re sib>4 r
  r8 <re si> <re si>4 r

  %271
  \su\stemDown r8 <mi do> <mi do>4 r
  r8 <mi dod> <mi dod>4 r
  r8 <fa re> <fa re>4 r

  %274
  r8 <sol mi> <sol mi>4 <sol mi>
  <la fa> <la dod,> <la re,>
  mi \giu\stemNeutral r8 mi,16[sol do8 mi,]

  %277
  fa la do4 do,
  r8 re re,4\staccatissimo r
  \su\stemDown r8 <fa'' re> <fa re> <fa re> <fa re> <fa re>\mbreak

  %280
  r8 mi \giu\stemNeutral mi,4\staccatissimo r
  r \su\stemDown mi'_\staccatissimo \giu\stemNeutral do\staccatissimo
  r8 fa fa,4 r

  %283
  r8 <fa re> <fa re> <fa re> <fa re> <fa re>
  r mi mi,4\staccatissimo r
  do'8 do' r re mi do

  %286
  fa mi re do sib la
  re do sib la sol fa\mbreak
  mib\f mib' r mib re[re,]

  %289
  reb reb' r reb do do,
  do4 r do'
  do do do

  %292
  do,, r do''
  do do do
  r8 sol16 sib \su\stemDown mi8\noBeam \stemUp sol sib mi\mbreak

  %295
  \giu\stemNeutral r4 sol,,, la
  \stemDown sib do \stemNeutral \once\shiftOn do,
  fa8 fa' fa fa fa fa

  %298
  fa4 r8 fa, la do
  fa4_\staccatissimo la_\staccatissimo fa_\staccatissimo

  %300
  sib,\staccatissimo sib\staccatissimo r8. si16 % alla ripresa
  do4\staccatissimo do\staccatissimo r8. dod16  %%ripresa
  re4\staccatissimo re\staccatissimo r8. re16

  %303
  mi8 sol sib sol mi4
  r8 mi sol sib mi,4
  r8 mi\p sol sib mi,4

  %306
  r r mi\f
  r r mi8 mi\mbreak
  fa sib, do4 do

  %309
  re\staccatissimo r8. la'16\p sib4\staccatissimo
  la_\staccatissimo  sol2
  sol4\ff r16 sol sol sol sol sol sol sol

  %312
  fad4 r16 fad fad fad fad fad fad fad
  fa!4 r16 fa fa fa fa fa fa fa
  mi4 r16 mi mi mi mi mi mi mi

  %315
  mib4 r16 mib mib mib mib mib mib mib
  re4_\staccatissimo r8. mi!16 fa4\staccatissimo
  r8. la16 sib4_\staccatissimo do\staccatissimo

  %318
  fa,8 do' la fa re' sib
  sol mi fa re si4
  r8. si16 do4\staccatissimo do\staccatissimo

  %321
  fa,4 r r

}


IIIbcn = \relative do {

  fa8 fa fa fa fa fa
  fa fa fa fa fa fa
  fa fa fa fa fa fa

  %4
  fa fa fa fa fa fa
  mi mi mi mi mi mi
  fa fa fa fa fa fa

  %7
  fa fa fa fa fa fa
  fa fa fa fa fa fa
  r fa mi sol do, mi\mbreak

  %10
  fa,4\staccatissimo r8. fa'16 fa'4\staccatissimo
  mi\staccatissimo re2
  do4 r8. dod16\p re4\staccatissimo

  %13
  do!\staccatissimo sib2
  la4 r8. la16\f sib4\staccatissimo
  la\staccatissimo sol2

  %16
  fa8 fa la, la la la
  sib sib sib sib sib sib
  do  do' sol do mi, sol

  %19
  do, do' sol mi do4\mbreak
  r r8 do' sol mi
  do4\staccatissimo mi\staccatissimo do\staccatissimo

  %22
  fa,8 fa' la fa do la
  fa fa' do fa la, do
  fa,4\staccatissimo r8 fa la do

  %25
  fa4\staccatissimo la\staccatissimo fa\staccatissimo\mbreak % fine p 18
  sib,\staccatissimo sib\staccatissimo r8. si16
  do4\staccatissimo do\staccatissimo r8. dod16  %%ripresa

  %28
  re4\staccatissimo re\staccatissimo r8. re16
  mi8 sol sib sol mi4
  r8 mi sol sib mi,4

  %31
  r8 mi\p sol sib mi,4
  r r mi\f
  r r mi8 mi\mbreak

  %34
  fa sib, do4 do
  re\staccatissimo r8. la'16\p sib4\staccatissimo
  la\staccatissimo  sol2

  %37
  sol4\ff r16 sol sol sol sol sol sol sol
  fad4 r16 fad fad fad fad fad fad fad
  fa!4 r16 fa fa fa fa fa fa fa

  %40
  mi4 r16 mi mi mi mi mi mi mi
  mib4 r16 mib mib mib mib mib mib mib
  re4\staccatissimo r8. mi!16 fa4\staccatissimo

  %43
  r8. la16 sib4\staccatissimo do\staccatissimo
  fa,8 do' la fa re' sib
  sol mi fa re si4

  %46
  r8. si16 do4\staccatissimo do\staccatissimo
  fa8 do fa4\staccatissimo r  %%%% fine ripresa
  R2.*6\mbreak

  %54
  r8 fa\f mi sol do, mi
  fa4\staccatissimo r r
  R2.*7

  %63
  r4 si\staccatissimo\f sol\staccatissimo\mbreak
  do\staccatissimo r r
  R2.*18

  %83
  do8\pizz\p si la sol fa mi
  la sol fa mi re do
  sib!\f sib' r sib la [la,]

  %86
  lab lab' r lab sol[sol,]
  sol\ff r r4 r
  R2.\mbreak

  %89
  sol'4\p sol sol
  sol sol sol
  R2.*3

  %94
  do8\arco\f do do do do do
  do do do do do do\mbreak
  do do do do do do

  %97
  do do do do do do
  si si si si si si
  do do do do do do

  %100
  do, do do do do do
  do do do do do do
  r do si re sol, si

  %103
  do4\staccatissimo r8. do16 do'4\staccatissimo
  si\staccatissimo la2
  sol4 r8. sold16\p la4\staccatissimo\mbreak

  %106
  sol!\staccatissimo fa2
  mi4 r8. mi16\f fa4\staccatissimo
  mi_\staccatissimo re2

  %109
  re4\ff r16 re re re re re re re
  dod4 r16 dod dod dod dod dod dod dod
  do!4 r16 do do do do do do do

  %112
  si4 r16 si si si si si si si
  sib!4 r16 sib sib sib sib sib sib sib
  la8 do si re sol,4

  %115
  r8 si re fa sol,4
  r8 si\p re fa sol,4\mbreak
  r r si\f

  %118
  r r si
  do8.\staccatissimo mi16 fa4\staccatissimo sol\staccatissimo
  do,8 sol' mi do la'4

  %121
  r8 si do la fad4
  r8. fad16 sol4\staccatissimo sol,\staccatissimo
  do\staccatissimo r r

  %124
  R2.*5
  r8 do\f si re sol, si
  do4\staccatissimo r r

  %131
  R2.*12
  r4 r8 sib\pizz do re
  mib4 fa sol

  %145
  lab sib sib,
  mib\staccatissimo r r \mbreak
  r r8 do re mi!

  %148
  fa4 sol la
  sib do do,
  fa\staccatissimo r r

  %151
  R2.*3
  r4 fad\f\arco re\staccatissimo
  sol8 r r4 r\mbreak

  %156
  r fad4\f\staccatissimo re\staccatissimo
  sol8 r r4 si\p\staccatissimo
  do\staccatissimo r mib,\staccatissimo

  %159
  fa!\staccatissimo r fa\staccatissimo
  mib\staccatissimo r r
  fa2(la4)

  %162
  sib2(re,4)\mbreak
  mib2.
  re4 r r

  %165
  do2 fa4
  sib,2 mib4
  la,2 re4

  %168
  sol,2 do4
  fad,\staccatissimo r sol\staccatissimo
  la\staccatissimo r sol\staccatissimo\mbreak

  %171
  fad\staccatissimo r r
  R2.
  r8 fad'\p la do mib mib,

  %174
  re\f r r4 r
  R2.
  r4 r8. sol,16 \f sol'4\staccatissimo

  %177
  fa!\staccatissimo mib2
  re8 r r4 r
  R2.\mbreak

  %180
  r4 r8. sol,16\p sol'4\staccatissimo
  fa\staccatissimo mib2
  re8 r r4 r

  %183
  R2.
  r4 r r8. re16\f
  re2(mib8) r

  %186
  R2.*3
  r8 fad\f la do mib4\mbreak
  R2.

  %191
  r8 fad,,\p la do mib4
  r8 mib do la fad4
  R2.*3

  %196
  sol8\f sol' sol sol sol sol
  sol sol sol sol sol sol
  sol sol sol sol sol sol\mbreak

  %199
  sol sol sol sol sol sol
  fad fad fad fad fad fad
  sol4\staccatissimo r8 re si sol

  %202
  do, do' mi! do sol[mi]
  do do' sol[do] mi, sol
  do,4\staccatissimo r8 do mi sol

  %205
  do4\staccatissimo mi\staccatissimo do\staccatissimo
  fa,8 fa' la fa do la\mbreak
  fa fa' do fa la, do

  %208
  fa,4\staccatissimo r8 fa la do
  fa4\staccatissimo la\staccatissimo fa\staccatissimo
  sib,\staccatissimo sib\staccatissimo r8. si16

  %211
  do4\staccatissimo do\staccatissimo r8. dod16
  re4\staccatissimo re\staccatissimo r8. re16
  mi4\staccatissimo mi\staccatissimo mi\staccatissimo

  %214
  fa8 r r4 r\mbreak
  R2.*5
  r8 fa\f mi sol do, mi

  %221
  fa4\staccatissimo r r
  R2.*5
  sol4\ff r16 sol sol sol sol sol sol sol

  %228
  fad4 r16 fad fad fad fad fad fad fad
  fa!4 r16 fa fa fa fa fa fa fa
  mi4 r16 mi mi mi mi mi mi mi

  %231
  mib4 r16 mib mib mib mib mib mib mib
  re4\staccatissimo r r
  R2.*11

  %244
  r4 r si\staccatissimo\mf\mbreak
  do2.\pp~
  do~

  %247
  do4\staccatissimo r sib'\staccatissimo\p
  r r la\staccatissimo
  r r mi\staccatissimo

  %250
  r r fa\staccatissimo
  r r sol\staccatissimo
  la\staccatissimo\f r r\mbreak

  %253
  R2.*8
  r4 r la,\mf(
  sib2.)~

  %263
  sib2 r4
  r mi\staccatissimo\f do\staccatissimo
  fa8 r r4 r

  %266
  r mi\f\staccatissimo do\staccatissimo
  fa8 r r4 r\mbreak
  R2.*18

  %286
  fa'8\p\pizz mi re do sib la
  re do sib la sol fa\mbreak
  mib\f mib' r mib re[re,]

  %289
  reb reb' r reb do do,
  do\ff r r4 r
  R2.

  %292
  do4\p do do
  do do do
  R2.*3

  %297
  fa8\arco\f fa fa fa fa fa
  fa4 r8 fa, la do
  fa4\staccatissimo la\staccatissimo fa\staccatissimo

  %300
  sib,\staccatissimo sib\staccatissimo r8. si16 % alla ripresa
  do4\staccatissimo do\staccatissimo r8. dod16  %%ripresa
  re4\staccatissimo re\staccatissimo r8. re16

  %303
  mi8 sol sib sol mi4
  r8 mi sol sib mi,4
  r8 mi\p sol sib mi,4

  %306
  r r mi\f
  r r mi8 mi\mbreak
  fa sib, do4 do

  %309
  re\staccatissimo r8. la'16\p sib4\staccatissimo
  la\staccatissimo  sol2
  sol4\ff r16 sol sol sol sol sol sol sol

  %312
  fad4 r16 fad fad fad fad fad fad fad
  fa!4 r16 fa fa fa fa fa fa fa
  mi4 r16 mi mi mi mi mi mi mi

  %315
  mib4 r16 mib mib mib mib mib mib mib
  re4\staccatissimo r8. mi!16 fa4\staccatissimo
  r8. la16 sib4\staccatissimo do\staccatissimo

  %318
  fa,8 do' la fa re' sib
  sol mi fa re si4
  r8. si16 do4\staccatissimo do\staccatissimo

  %321
  fa,4 r r

}

IIIbfn =  \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp

  s2.*2
  <6 4>2.
  <5 3>
  <6>2 <5>4
  s2 <7->4
  <6 4>2.
  <5 3>
  s4 <6> <7>
  s2.
  <6>4 <7> <6!>
  s4 s8. <6>16 s4
  <6> <7> <6\\>
  <_+> s8. <6>16 s4
  s <7> <6>
  s <6 _+> s
  s2 <6>4
  <4> <6 4> <6>
  <7> <6> <7>
  s s8 <7> <6>4
  <7> <5> <7>
  s <6> <6 4>
  <7-> <6 _-> <5->
  <7-> s <5->
  <7-> <5-> <7->
  s <6> s8. <6 5>16
  <_!>4 <6> s8. <6 5>16
  s4 <6> s8. <6 5>16
  <5>4 <2> <5>
  s8 <5> <6>4 <5>
  s8 <5> <6>4 <5>
  s s <5>
  s s <5>
  s8 <6> <6 4>4 <5 3>
  s4 s8. <6>16 s4
  <6> <7> <6>
  <4\+>2.
  <5->
  <4!>
  <5->
  <4 2>
  <6>4 s8. <6 5>16 s4
  s8. <6>16 <6>4 s
  s2.*10
  s4 <6> <7>
  s2.*41
  <6 4>2.
  <5 3>
  <6>2 <5->4
  s2.
  <6 4>
  <5 3>
  s4 <6> <7 _!>
  s2.
  <6>4 <7> <6\\>
  <_!> s8. <6>16 <5 3>4 %%%%%% fine secondo sistema p.19/26 bar 105 OK

  <6>4 <7> <6\\>
  <_+> s8. <6>16 s4
  <6> <7> <6!>
  <4\+>2.
  <5->
  <4\+>
  <5->
  <4 2>
  <6>4 <5> <7 _!>
  s8 <5> <6!>4 <7 _!> %%% 115
  s8 <5> <6!>4 <7 _!>
  s s <5>
  s s <5>
  s8. <6>16 <6>4 <_!>
  s2.*9
  s4 <6> <7 _!>
  s2.*47
  s4 <7> <6\\> %%%% fine p. 20/26 bar 177 OK

  s2.*3
  s4 <7> <6\\>
  s2.*2
  s2 s8. <6 ! _!>16
  s2 <6>4
  s2.*3
  s8 <7-> <6\\>4 s
  s2.
  s8 <7-> <6\\>4 s
  s2.*6
  <6- 4>2.
  <5 3>
  <6 5>
  s4 s8 <6!> <5->4
  <_!> <6> <6! 4>
  <7-> <6> <5>
  <7> s <5>
  <7> <5> <7>
  s <6> <6 4>
  <7-> <6 _-> <5->
  <7-> s <5->
  <7-> <5-> <7->
  s <6> s8. <6 5>16
  s4 <6> s8. <6 5>16
  s4 <6> s
  s <6> s
  s2.*6
  s4 <6> <7>
  s2.*6
  s4 s16 <4\+> s8 s4
  <5->2.
  <4!>
  <5->
  <4 2>
  <6>
  s2.*65

  s4 s <6>%%% ripresa
  <7-> <5-> <7->
  s <6> s8. <6 5>16
  <_!>4 <6> s8. <6 5>16
  s4 <6> s8. <6 5>16
  <5>4 <2> <5>
  s4 <6> <5>
  s <6>4 s
  s s <5>
  s s <5>
  s8 <6> <6 4>4 <5 3>
  s4 s8. <6>16 s4
  s <7> <6>
  <4\+>2.
  <5->
  <4!>
  <5->
  <4 2>
  <6>4 s8. <6 5>16 s4
  s8. <6>16 <6>4 s

}


forma = {

  \key fa\major
  \time 3/4
  \tempo 2 = 60
  s2.*321
  \bar "|."

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

IIImd = {
  \IIIglobal
  \context Staff = up
  <<\IIImdn \forma>>

}

IIIms = {
  \IIIglobal
  \clef bass
  \context Staff = down
  <<\IIImsn \forma\IIIbfn>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma>>
  \typeset

}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

  systems-per-page = #3
  print-first-page-number = ##t
  first-page-number = #2

}

\markup \huge {[1.] Allegretto}

\score {
  {

      \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violino 1"}
          \IvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"Violino 2"}
          \IvlII
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \set Staff.instrumentName = \markup \center-column{"Viola"}
          \Ivla
        >>

        \new PianoStaff <<

          \set PianoStaff.midiInstrument = #"harpsichord"
          \new Staff = "up" \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          }
          <<
            \set PianoStaff.instrumentName =  \markup \center-column{"Cembalo"}
            \Imd
          >>

          \new Staff = "down"  \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          }
          <<
            \Ims
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \set Staff.instrumentName = \markup \center-column{"Basso"}
          \Ibc
        >>

      >>
  }

  \layout {

    indent = 1.6\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup \huge {[2.] Adagio}

\score {
  {

      \new ChoirStaff \with {
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

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIvla
        >>

        \new PianoStaff <<

          \set PianoStaff.midiInstrument = #"harpsichord"
          \new Staff = "up" \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          }
          <<
            \IImd
          >>

          \new Staff = "down"  \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          }
          <<
            \IIms
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \IIbc
        >>

      >>
  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup \huge {[3.] Allegro assai}

\score {
  {

      \new ChoirStaff \with {
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

        \new Staff <<
          \set Staff.midiInstrument = #"viola"
          \IIIvla
        >>

        \new PianoStaff <<

          \set PianoStaff.midiInstrument = #"harpsichord"
          \new Staff = "up" \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          }
          <<
            \IIImd
          >>

          \new Staff = "down"  \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
          }
          <<
            \IIIms
          >>
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"cello"
          \IIIbc
        >>

      >>
  }

  \layout {

    indent = 0.5\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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