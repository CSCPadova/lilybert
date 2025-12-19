\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

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
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

Ifln = \relative do'' {

   R1*25
   sol'4-.\solo(sol-.) sol16 re do re sol la si la
   sol re do re sol la si la sol re do re sol la si sol

   %28
   la4-.(la-.) la16 re, do re la' si do si\mbreak
   la re, do re la' si do si la re, do re la' si do la
   si4-.(si-.) si16 re, do re si' do re do

   %31
   si re, do re si' do re do si re,do re si' do re si
   do8 si4 la16 sol\mbreak la16 re, dod re mi re dod re
   do'8 si4 la16 sol la re, dod re mi re dod re

   %34
   do' si do la si la si sol la8 re, r4
   la4-.(la-.) la16 re dod re fad re dod re\mbreak
   la' re, dod re fad re dod re la re dod re fad re dod re

   %37
   la' re, dod re fad re dod re la re dod re fad re dod re
   la' sol fad mi re8 do si4 r
   si-.(si-.)\mbreak si16 mi red mi sol mi red mi

   %40
   si' mi, red mi sol mi red mi si mi red mi sol mi red mi
   si' mi, red mi sol mi red mi si mi red mi sol mi red mi
   si' la sol fad mi8 re dod4 r\mbreak

   %43
   la'4-.(la-.) la,16 dod si dod la dod si la
   sol' fad mi fad sol mi dod mi la, dod si dod la dod si la
   fad' mi re mi fad re dod re la dod si dod la dod si la

   %46
   mi' re dod re mi dod si dod la dod si dod la dod si la\mbreak
   re la si dod re mi fad sol la8 si4 dod8
   re16 la, si dod re mi fad sol la8 si4 dod8

   %49
   re dod16 si la8 sol fad4 mi\tr
   re\staccatissimo  r r2
   R1*16

   %67
   re4-.\solo(re-.) re16 fad mi fad la fad mi fad
   re' fad, mi fad la fad mi fad re sol fad sol si sol fad sol
   re' sol, fad sol si sol fad sol\mbreak re fad  mi fad la fad mi fad

   %70
   re' fad, mi fad la fad mi fad re sol fad sol si sol fad sol
   re' sol, fad sol si sol fad sol re dod re mi fad mi fad sol
   la sol fad mi re mi fad sol la sol la si do si do re\mbreak

   %73
   mi8 re4 do8 si16 (la) sol8 r4
   sol,4-.(sol-.) sol16 si la si re si la si
   sol' si, la si re si la si sol do si do mi do si do

   %76
   sol' do, si do mi do si do sol si la si re si la si\mbreak
   sol' si, la si re si la si sol do si do mi do si do
   sol' do, si do mi do si do sol fad sol la si la si do

   %79
   re do si la sol la si do re do re mi fa mi fa sol
   la8 sol4 fa8\mbreak mi16 re do8 r4
   mi4-.(mi-.) mi16 fad sol mi la sol fad mi

   %82
   fad4-.(fad-.) fad16 sol la fad si la sol fad
   sol la si sol do si la sol fad re dod re la' re, dod re
   fad sol la fad si la sol fad\mbreak mi do si do sol' do, si do

   %85
   mi fad sol mi la sol fad mi red dod si8 r4
   la4 r r2
   R1*3

   %90
   sol4 fad\tr mi16 si'\solo dod red mi fad sol la
   si sol fad sol mi sol fad mi red si dod red mi fad sol la\mbreak
   si sol fad sol mi sol fad mi red si dod red mi sol fad mi

   %93
   fad si, red mi fad la sol fad sol si,  mi fad sol si la sol
   la re, fad sol la do si la si re, mi fad sol la si do\mbreak
   re si la si sol si la sol fad re mi fad sol la si do

   %96
   re si la si sol si la sol fad re mi fad sol la si do
   re do si4 la8 sold mi4 fad16 sold
   la8 mi si' mi,\mbreak do'16 mi, fad sold la si do re

   %99
   mi re dod4 si8 lad fad4 sold16 lad
   si8 fad dod' fad, re'16 fad, sol fad sol8 re'
   dod16 mi, (fad mi) fad8 dod' si16 red, (mi red) mi8 si'\mbreak

   %102
   lad16\staccatissimo dod, (re mi) re(mi fad) si\staccatissimo lad\staccatissimo dod, re mi re(mi fad) si\staccatissimo
   lad fad mi fad si la sol fad sol si sol mi la sol fad mi
   fad la fad re sol fad mi re mi sol mi dod fad mi re dod\mbreak % fin epagina

   %105
   re8 sol4 fad mi re8~
   re do!16 si do8 mi4 sol8 do si
   lad si4 la16 sol fad4. mi8

   %108
   re16\fermata dod si8 dod4\tr si r
   R1*7
   sol4\solo sol sol8\tr r sol16 la si do

   %117
   re4 re re8\tr r re16 \tu dod re mi
   fa8 sold,4 la8\mbreak fa'sold,4 la8
   fa'\solo sold4 la8 fa sold4 la8

   %120
   R1*3
   mi8\solo fad4 sol8 mi fad4 sol8
   do, do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr

   %125
   do,8 do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr\mbreak
   mi8 la la4\tr fad8 si si4\tr
   sol8 do do4\tr la8 re4 do8

   %128
   si la16 sol la8 mi \appoggiatura sol8 fad2\tr
   sol4 r r2
   R1

   %131
   sol16 si la sol mi' sol, fad mi\mbreak fad la sol fad re' fad, mi re
   mi sol fad mi do' mi, re do re fad  mi re si' re, do si
   do mi re do la' do, si la si re do si sol' si, la sol

   %134
   la si do re mi fad sol la\mbreak fad (mi) re8 r4
   re'-.(re-.) re,16 fad mi fad re fad mi re
   do' si la si do la fad la re, fad mi fad re fad mi re

   %137
   si' la sol la si sol fad sol re fad mi fad re fad mi re\mbreak
   la' sol fad sol la fad mi fad re fad mi fad re fad mi re
   sol re mi fad sol la si do re8 do4 si16 la

   %140
   si re, mi fad sol la si do re8 do4 si16 la\mbreak
   si8 la16 sol la8 mi \appoggiatura sol8 fad2\tr
   sol8 fad16 mi re8 do si4\fermata la\tr

   %143
   \parenthesize sol r r2
   R1*13

}


IvlIn =  \relative do'' {

   sol4\staccatissimo sol\staccatissimo sol8\tr r sol16 la si do
   re4\staccatissimo re\staccatissimo re8\tr r re16 mi fad re
   sol8 sol4 la8 fad fad4 sol8

   %4
   mi mi4 fad8 re re4 mi8\mbreak
   do do4 la'8 si, si4 sol'8
   la,4 si16 la si sol  la4 si16 la si sol

   %7
   la8 re do si si\tr la r4
   sol4\staccatissimo sol\staccatissimo sol8\tr r sol16 la si do
   re4\staccatissimo re\staccatissimo re8\tr r re16 dod re mi\mbreak

   %10
   fa8 sold,4 la8 fa' sold,4 la8
   fa'\p sold,4 la8 fa' sold,4 la8
   re\f re \appoggiatura mi16 re8 do16 si do8 la' la4\tr

   %13
   re,8 re \appoggiatura mi16 re8 do16 si do8 la16 sold la si do re\mbreak
   mi8 fad,!4 sol8 mi' fad,4 sol8
   mi'8\p fad,4 sol8 mi' fad,4 sol8

   %16
   do\f do\appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   do,8 do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   mi8\p mi4 re8 do do4 si8\mbreak

   %19
   la la4 sol8 fad mi'\f re sol
   si,4 la\tr sol r
   do8\p do\appoggiatura re16 do8 si16 la si8 sol' sol4\tr

   %22
   do,8 do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   mi8\f mi4 re8 do do4 si8\mbreak
   la la4 sol8 fad mi16 re sol8 si,

   %25
   do4\staccatissimo re\staccatissimo sol, r
   re''4\p-.( re-. re-.) r
   re r re r

   %28
   fad-.(fad-. fad-.) r
   fad r fad r
   sol-.(sol-. sol-.) r

   %31
   sol r sol r
   la sol fad r
   la sol fad r

   %34
   re re re r
   r2 la4-.(la-.-.
   la-.) r la r

   %37
   la r la r
   la-.(la-.) re,-.(re-.)
   r2 si'4-.(si-.

   %40
   si-.) r si r
   si r si r
   si-.(si-.) mi,-.(mi-.

   %43
   mi-.) r mi-.(mi-.)
   r2 mi4-.(mi-.)
   r2 mi4-.(mi-.)

   %46
   r2 mi4-.(mi-.)
   R1*3
   re4^\tu\f \staccatissimo re\staccatissimo re8\tr r re16 mi fad sol\mbreak

   %51
   la4\staccatissimo la\staccatissimo la8\tr r la16 si dod la
   re8 re4 mi8 dod dod4 re8
   si si4 dod8 la la4 si8

   %54
   sol sol4 mi'8 fad, fad4 re'8
   mi,4 fad16 mi fad re mi4 fad16 mi fad re\mbreak
   mi8 la sol fad fad\tr mi r4

   %57
   sol8\p sol \appoggiatura la16 sol8 fad16 mi fad8 re' re4\tr
   sol,8 sol \appoggiatura la16 sol8 fad16 mi fad8 re' re4\tr
   si'8\f si4 la8 sol sol4 fad8

   %60
   mi mi4 re8\mbreak dod si16 la re8 sol
   fad4 mi\tr re r
   sol,8\p sol \appoggiatura la16 sol8 fad16 mi fad8 re' re4\tr

   %63
   sol,8 sol \appoggiatura la16 sol8 fad16 mi fad8 re' re4\tr
   si8\f si4 la8 sol sol4 fad8
   mi mi4 re8\mbreak dod si16 la re8 fad

   %66
   sol4\staccatissimo la\staccatissimo re, r
   r2 la'4-.\p(la-.
   la-.) r si-.(si-.

   %69
   si-.) r la-.(la-.
   la-.) r si-.(si-.
   si-.) r r2

   %72
   R1*2
   r2 re,4-.( re-.
   re-.) r mi-.(mi-.

   %76
   mi-.) r re-.(re-.
   re-.) r mi-.(mi-.
   mi-.) r r2

   %79
   R1*7
   la8^\tu\f la \appoggiatura si16 la8 sol16 fad sol8 mi' mi4\tr
   la,8\p la \appoggiatura si16 la8 sol16 fad sol8 mi' mi4\tr

   %88
   do'8\f do4 si8\mbreak la la4 sol8
   fad fad4 mi8 red dod16 si mi8 la,
   sol4 fad\tr mi r

   %91
   R1*6
   re'2\p mi~
   mi~ mi4 r

   %99
   mi2 fad~
   fad~ fad4 r
   R1

   %102
   lad8 r si r lad r si r
   lad r si r sol2
   fad mi

   %105
   re4 r r2
   R1*3
   sol,4\staccatissimo ^\tu\f sol\staccatissimo sol8\tr r sol16 la si do\mbreak

   %110
   re4\staccatissimo re\staccatissimo re8\tr r re16 mi fad re
   sol8 sol4 la8 fad fad4 sol8
   mi mi4 fad8 re re4 mi8

   %113
   do do4 la'8 si, si4 sol'8\mbreak
   la,4 si16 la si sol la4 si16 la si sol
   la8 re do si si\tr la r4

   %116
   R1
   r2 r4 re16\f dod re mi
   fa8 sold,4 la8 fa' sold,4 la8

   %119
   re,4\p do re do
   re'8^\tu\f re \appoggiatura mi16 re8 do16 si do8 la' la4\tr
   re,8 re \appoggiatura mi16 re8 do16 si do8 la16 sold la si do re\mbreak

   %122
   mi8 fad,4 sol8 mi' fad,4 sol8
   r2 r4 r8 si\p
   la re, mi fad sol4 si16 la si sol

   %125
   la8 re, mi fad sol4 si,16 la si sol
   do4 dod16 si dod la re4  red16 dod red si
   mi4 r r2

   %128
   R1
   sol4^\tu\f \staccatissimo sol\staccatissimo sol8\tr r sol16 la si do
   re4\staccatissimo re\staccatissimo re8\tr r re16 mi fad re

   %131
   sol2\p fad
   mi re
   do si

   %134
   do la4 la
   r2 la4-.(la-.)
   r2 la4-.(la-.)

   %137
   r2 la4-.(la-.)
   r2 la4-.(la-.)
   R1*4

   %143
   sol4^\tu\f \staccatissimo sol\staccatissimo sol8\tr r sol16 la si do
   re4\staccatissimo re\staccatissimo re8\tr r re16 dod re mi
   fa8 sold,4 la8\mbreak fa' sold,4 la8

   %146
   mi' fad,!4 sol8 mi' fad,4 sol8
   do do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   do,8 do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr

   %149
   mi8\p mi4 re8\mbreak do do4 si8
   la la4 sol8 fad mi'\f re sol
   si,4 la\tr sol r

   %152
   do8\p do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   do,8 do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr \mbreak
   mi8\f mi4 re8 do do4 si8

   %155
   la la4 sol8 fad mi16 re sol8 si,
   do4\staccatissimo re\staccatissimo sol,\fermata r

}

IvlIIn = \relative do'' {

   re,4\staccatissimo re\staccatissimo re8\staccatissimo r sol16 la si do
   re4\staccatissimo re\staccatissimo  re8\tr r re16 mi fad re
   sol8 sol4 la8 fad fad4 sol8

   %4
   mi mi4 fad8 re re4 mi8\mbreak
   do do4 la'8 si, sol4 si8
   fad16 mi fad re sol fad sol mi fad mi fad re sol fad sol mi

   %7
   fad8 si la sol sol\tr fad r4
   re4\staccatissimo re\staccatissimo re8\staccatissimo r sol16 la si do
   re4\staccatissimo re\staccatissimo  re8\tr r re16 dod re mi\mbreak

   %10
   fa8 sold,4 la8 fa' sold,4 la8
   fa'\p sold,4 la8 fa' sold,4 la8
   re\f re \appoggiatura mi16 re8 do16 si do8 la' la4\tr

   %13
   re,8 re \appoggiatura mi16 re8 do16 si do8 la16 sold la si do re\mbreak
   mi8 fad,!4 sol8 mi' fad,4 sol8
   mi'8\p fad,4 sol8 mi' fad,4 sol8

   %16
   do\f do\appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   do,8 do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   r2 mi8\p mi4 re8\mbreak

   %19
   do do4 si8 la4\tr\f si8 sol
   sol4 fad\tr sol r
   do8\p do\appoggiatura re16 do8 si16 la si8 sol' sol4\tr

   %22
   do,8 do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   r2 mi8\f mi4 re8
   do do4 si8\mbreak la sol16 fad sol8 si,

   %25
   do4\staccatissimo re\staccatissimo sol, r
   si'-.\p(si-. si-.) r
   si r si r

   %28
   re-.(re-. re-.) r
   re r re r
   re-.(re-. re-.) r

   %31
   re r re r\mbreak
   re re re r
   re re re r

   %34
   la' sol fad r
   r2 fad,4-.(fad-.
   fad-.) r fad r

   %37
   fad r fad r
   fad-.(fad-.) sol-.(sol-.)
   r2 sol4-.(sol-.

   %40
   sol-.) r sol r
   sol r sol r
   sol-.(sol-.) la-.(la-.)

   %43
   dod,-. r dod-.(dod-.)
   r2 dod4-.(dod-.)
   r2 dod4-.(dod-.)

   %46
   r2 dod4-.(dod-.)
   R1*3
   la4\staccatissimo \f la\staccatissimo \mbreak la8\staccatissimo r re16 mi fad sol

   %51
   la4\staccatissimo la\staccatissimo la8\tr r la16 si dod la
   re8 re4 mi8 dod dod4 re8
   si si4 dod8 la la4 si8

   %54
   sol sol4 mi'8 fad,  re4 fad8\mbreak
   dod16 la dod la re dod re si dod si dod la re dod re si
   dod8 fad mi re re\tr dod r4

   %57
   mi8\p sol  \appoggiatura la16 sol8 fad16 mi fad8 re' re4\tr
   sol,8 sol \appoggiatura la16 sol8 fad16 mi fad8 re' re4\tr\mbreak
   r2 si'8\f si4 la8

   %60
   sol sol4 fad8 mi re16 dod re8 mi
   re4 dod\tr re r
   sol,8\p sol \appoggiatura la16 sol8 fad16 mi fad8 re' re4\tr

   %63
   sol,8 sol \appoggiatura la16 sol8 fad16 mi fad8 re' re4\tr
   r2 si8\f si4 la8
   sol sol4 fad8 mi re16 dod re8 fad

   %66
   sol4\staccatissimo la\staccatissimo re, r
   r2 fad4\p-.(fad-.
   fad-.) r sol-.(sol-.

   %69
   sol-.) r fad-.(fad-.
   fad-.) r sol-.(sol-.
   sol-.) r r2

   %72
   R1*2
   r2 si,4-.(si-.
   si-.) r do-.(do-.

   %76
   do-.) r si-.(si-.
   si-.) r do-.(do-.
   do-.) r r2

   %79
   R1*7
   la'8\f la \appoggiatura si16 la8 sol16 fad sol8 mi' mi4\tr
   la,8\p la \appoggiatura si16 la8 sol16 fad sol8 mi' mi4\tr

   %88
   r2 do8\f do4 si8
   la la4 sol8 fad4 sol8 fad
   mi4 red\tr mi r

   %91
   R1*6
   si'1\p
   do4 si la r

   %99
   dod1
   re4 dod si r
   R1

   %102
   dod8 r re r dod r re r
   dod4 fad2 mi4~
   mi re2 dod4

   %105
   si r r2
   R1*3
   re,4\f\staccatissimo re\staccatissimo re8\staccatissimo r sol16 la si do

   %110
   re4\staccatissimo re\staccatissimo re8\tr r re16 mi fad re
   sol8 sol4 la8 fad fad4 sol8
   mi mi4 fad8 re re4 mi8

   %113
   do do4 la'8 si, sol4 si8
   fad16 mi fad re sol fad sol mi fad mi fad re sol fad sol mi
   fad8 si la sol sol\tr fad r4

   %116
   R1
   r2 r4 re'16\f dod re mi
   fa8 sold,4 la8 fa' sold,4 la8

   %119
   re,4\p do re do
   re'8\f re \appoggiatura mi16 re8 do16 si do8 la' la4\tr
   re,8 re \appoggiatura mi16 re8 do16 si do8 la16 sold la si do re\mbreak

   %122
   mi8 fad,4 sol8 mi' fad,4 sol8
   r2 r4 r8 si\p
   la re, mi fad sol4 si16 la si sol

   %125
   la8 re, mi fad sol4 si,16 la si sol
   do4 dod16 si dod la re4  red16 dod red si
   mi4 r r2

   %128
   R1
   re4\f \staccatissimo re\staccatissimo re8\staccatissimo r sol16 la si do
   re4\staccatissimo re\staccatissimo re8\tr r re16 mi fad re

   %131
   sol4 mi2\p re4~\mbreak
   re do2 si4~
   si la2 sol4

   %134
   mi la2 fad4
   r2 fad4-.(fad-.)
   r2 fad4-.(fad-.)

   %137
   r2 fad4-.(fad-.)
   r2 fad4-.(fad-.)
   R1*4

   %143
   re4\f \staccatissimo re\staccatissimo re8\staccatissimo r sol16 la si do
   re4\staccatissimo re\staccatissimo re8\tr r re16 dod re mi
   fa8 sold,4 la8\mbreak fa' sold,4 la8

   %146
   mi' fad,!4 sol8 mi' fad,4 sol8
   do do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   do,8 do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr

   %149
   r2 mi8\p mi4 re8
   do do4 si8\mbreak la4\tr si8\f sol
   sol4 fad\tr sol r

   %152
   do8\p do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   do,8 do \appoggiatura re16 do8 si16 la si8 sol' sol4\tr
   r2 mi8\f mi4 re8

   %155
   do do4 si8 la sol16 fad sol8 si,
   do4\staccatissimo re\staccatissimo sol,\fermata r

}

Ivlan = \relative do'{

   si4\staccatissimo si\staccatissimo si\staccatissimo r
   la\staccatissimo la'\staccatissimo  la\staccatissimo r
   si mi la, re
   sol,8 do4 la8 fad si4 si8
   mi, la4 fad8 re4\staccatissimo  re\staccatissimo\mbreak
   re\tr r re\staccatissimo re\staccatissimo
   re\tr r8 re re re r4
   si4\staccatissimo si\staccatissimo si\staccatissimo r
   la\staccatissimo la'\staccatissimo  la\staccatissimo r
   la8 si mi,4 la8 si mi,4
   la8\p si mi,4 la8 si mi,4
   sold8\f sold la mi mi mi mi mi
   sold sold la mi mi4 r
   r8 la re,4 sol!8 la re,4
   sol8\p la re,4 sol8 la re,4
   fad8\f fad sol re re re re re
   fad fad sol re\mbreak re re re re'
   sol,4\p sol sol sol
   mi8 mi4 mi8 fad4\f sol8 mi
   re4 re si8 sol' sol4\tr
   fad8\p fad sol re re re re re
   fad fad sol re re re re re'\mbreak
   sol,4\f sol sol sol
   mi8 mi4 do8 re mi16 fad sol8 si,
   do4\staccatissimo re\staccatissimo sol, r
   sol'-.\p(sol-. sol-.) r
   sol r sol r
   re-.(re-. re-.) r\mbreak
   re r re r
   sol-.(sol-. sol-.) r
   sol r sol r
   fad sol re r
   fad sol re r
   fad sol re r
   r2 re4-.(re-.
   re-.) r re r\mbreak
   re r re r
   re-. (re-.) sol,-.(sol-.)
   r2 mi'4-.(mi-.
   mi-.) r mi r
   mi r mi r
   mi-.(mi-.) la,-.(la-.
   la-.) r la-.(la-.)
   r2 la4-.(la-.)\mbreak
   r2 la4-.(la-.)
   r2 la4-.(la-.)
   R1*3
   fad4\staccatissimo\f fad\staccatissimo fad8\staccatissimo r r4
   mi\staccatissimo mi'\staccatissimo mi\staccatissimo r
   fad si mi, la
   re,8 sol4 mi8 dod fad4 fad8
   si, mi4 dod8 la4\staccatissimo la\staccatissimo \mbreak
   la\tr r la\staccatissimo la\staccatissimo
   la\tr r8 la la la r4
   r8 dod\p re la la la la la
   dod dod re la la la la la'
   re,4\f re re re
   si8 si4 si8\mbreak mi mi la si
   la4 la fad8 re' re4
   dod,8\p dod re la la la la la
   dod dod re la la la la la'
   re,4\f re re re
   si8 si4 sol8 la si16 dod re8 fad\mbreak
   sol4\staccatissimo la\staccatissimo  re, r
   r2 re4\p-.(re-.
   re-.) r re-.(re-.
   re-.) r re-.(re-.
   re-.) r re-.(re-.
   re-.) r r2
   R1*2
   r2 sol,4-.(sol-.
   sol-.) r\mbreak sol-.(sol-.
   sol-.) r sol-.(sol-.
   sol-.) r sol-.(sol-.
   sol-.) r r2
   R1*7
   r8 red'\f mi si si si si si
   red\p red mi si si si si si'
   mi,4\f mi mi mi\mbreak
   do'8 do4 do8 si4 si,8 do
   si4 si sol r
   R1*18
   si4\staccatissimo si\staccatissimo si\staccatissimo r
   la\staccatissimo la'\staccatissimo  la\staccatissimo r
   si mi la, re
   sol,8 do4 la8 fad si4 si8
   mi, la4 fad8 re4\staccatissimo  re\staccatissimo\mbreak
   re\tr r re\staccatissimo re\staccatissimo
   re\tr r8 re re re r4
   R1*2
   la'8 si mi,4 la8 si mi,4
   r2 r4 r8  mi\mbreak
   sold sold la mi mi mi mi mi
   sold sold la mi mi4 r
   r8 la re,4 sol8 la re,4
   R1*6
   si4\staccatissimo si\staccatissimo si\staccatissimo r
   la\staccatissimo la'\staccatissimo  la\staccatissimo r
   R1*4
   r2 re,4-.\p (re-.)
   r2 re4-.(re-.)
   r2 re4-.(re-.)
   r2 re4-.(re-.)
   R1*4
   si4\staccatissimo\f si\staccatissimo si\staccatissimo r
   la\staccatissimo la'\staccatissimo  la\staccatissimo r
   la8 si mi,4 la8 si mi,4
   sol8 la re,4 sol8 la re,4
   fad8 fad sol re re re re re
   fad fad sol re re re re re'\mbreak
   sol,4\p sol sol sol
   mi8 mi4 mi8 fad4\f sol8 mi
   re4 re si8 sol' sol4\tr
   fad8\p fad sol re re re re re
   fad fad sol re re re re re'\mbreak
   sol,4\f sol sol sol
   mi8 mi4 do8 re mi16 fad sol8 si,
   do4\staccatissimo re\staccatissimo sol,\fermata r

}

Icbn = \relative do{

   sol'4\staccatissimo sol\staccatissimo sol\staccatissimo r
   fad\staccatissimo fad\staccatissimo fad\staccatissimo r
   mi dod re si'

   %4
   do! la si sol
   la fad sol sol,
   re'\staccatissimo re\staccatissimo re\tr r\mbreak

   %7
   re re re'8 re, r4
   sol\staccatissimo sol\staccatissimo sol\staccatissimo r
   fa\staccatissimo fa\staccatissimo fa\staccatissimo r

   %10
   re do re do
   re\p do re do
   si8 mi,\f fad sold la4 do16 si do la

   %13
   si8 mi, fad sold la4 r\mbreak
   do si do si
   do\p si do si8 si'

   %16
   la re,\f mi fad sol4 si16 la si sol
   la8 re, mi fad sol4 si16 la si sol
   do4\p do do do

   %19
   do do re8 do\f si do\mbreak
   re do re re, sol4 si,16 la si sol
   la8 re,\p mi fad sol4 si16 la si sol

   %22
   la8 re, mi fad sol4 si16 la si sol
   do4\f do do do
   do do do si\staccatissimo

   %25
   do\staccatissimo re\staccatissimo  sol, r\mbreak
   R1*24

   %50
   re'4\f\staccatissimo re\staccatissimo re\staccatissimo r\mbreak
   dod\staccatissimo dod\staccatissimo dod\staccatissimo r
   si sold la fad'

   %53
   sol! mi fad re
   mi dod re re,
   la'\staccatissimo la\staccatissimo la\tr r

   %56
   la la la'8 la, r4
   r8 la\p si dod re4 fad16 mi fad re\mbreak
   mi8 la, si dod re4 fad16 mi fad re

   %59
   sol4\f sol sol sol
   sol sol la,8 la' fad sol
   la sol la la, re4 fad16 mi fad re

   %62
   mi8 la,\p si dod re4 fad16 mi fad re
   mi8 la, si dod\mbreak re4 fad16 mi fad re
   sol4\f sol sol sol

   %65
   sol sol sol fad\staccatissimo
   sol\staccatissimo la\staccatissimo re, r
   R1*19

   %86
   r8 si\f dod red mi4 sol16 fad sol mi\mbreak
   fad8 si,\p dod red mi4 sol16 fad sol mi
   la4\f la la la

   %89
   la la la8 la sol la
   si4 si, mi r
   R1*18
   sol4\staccatissimo\f sol\staccatissimo sol\staccatissimo r

   %110
   fad\staccatissimo fad\staccatissimo fad\staccatissimo r
   mi dod re si'
   do! la si sol

   %113
   la fad sol sol,
   re' \staccatissimo re\staccatissimo re\staccatissimo r\mbreak
   re re re'8 re, r4

   %116
   R1*2
   re4\f dod re dod

   %119
   r2 r4 r8 do'
   si mi, fad sold la4do16 si do la\mbreak
   si8 mi, fad sold la4 r

   %122
   do, si do si
   R1*6
   sol'4\staccatissimo \f sol\staccatissimo sol\staccatissimo r\mbreak

   %130
   fad\staccatissimo fad\staccatissimo fad\staccatissimo r
   R1*12
   sol4\f\staccatissimo sol\staccatissimo sol\staccatissimo r

   %144
   fa\staccatissimo fa\staccatissimo fa\staccatissimo r\mbreak
   re do re do
   do si do si8 si'

   %147
   la re, mi fad sol4 si16 la si sol
   la8 re, mi fad sol4 si16 la si sol
   do4\p do do do

   %150
   do do re8 do si\f do\mbreak
   re do re re, sol4 si,16 la si sol
   la8 re,\p mi fad sol4 si16 la si sol

   %153
   la8 re, mi fad sol4 si16 la si sol
   do4\f do do do
   do do do si\staccatissimo

   %156
   do\staccatissimo re\staccatissimo sol,\fermata r

}

Ibcn = \relative do {

   sol'4\staccatissimo sol\staccatissimo sol\staccatissimo r
   fad\staccatissimo fad\staccatissimo fad\staccatissimo r
   mi dod re si'

   %4
   do! la si sol
   la fad sol sol,
   re'\staccatissimo re\staccatissimo re\tr r\mbreak

   %7
   re re re'8 re, r4
   sol\staccatissimo sol\staccatissimo sol\staccatissimo r
   fa\staccatissimo fa\staccatissimo fa\staccatissimo r

   %10
   re do re do
   re\p do re do
   si8 mi,\f fad sold la4 do16 si do la

   %13
   si8 mi, fad sold la4 r\mbreak
   do si do si
   do\p si do si8 si'

   %16
   la re,\f mi fad sol4 si16 la si sol
   la8 re, mi fad sol4 si16 la si sol
   do4\p do do do

   %19
   do do re8 do\f si do\mbreak
   re do re re, sol4 si,16 la si sol
   la8 re,\p mi fad sol4 si16 la si sol

   %22
   la8 re, mi fad sol4 si16 la si sol
   do4\f do do do
   do do do si\staccatissimo

   %25
   do\staccatissimo re\staccatissimo  sol, r\mbreak
   R1*20
   r2 r4 r8 sol'^\p

   %47
   fad4 r8 re16 mi fad8 sol mi la
   fad4 r8 re16 mi fad8 sol mi la
   re, mi fad sol la sol la la,

   %50
   re4\f\staccatissimo re\staccatissimo re\staccatissimo r\mbreak
   dod\staccatissimo dod\staccatissimo dod\staccatissimo r
   si sold la fad'

   %53
   sol! mi fad re
   mi dod re re,
   la'\staccatissimo la\staccatissimo la\tr r

   %56
   la la la'8 la, r4
   r8 la^\p si dod re4 fad16 mi fad re\mbreak
   mi8 la, si dod re4 fad16 mi fad re

   %59
   sol4\f sol sol sol
   sol sol la,8 la' fad sol
   la sol la la, re4 fad16 mi fad re

   %62
   mi8 la,\p si dod re4 fad16 mi fad re
   mi8 la, si dod\mbreak re4 fad16 mi fad re
   sol4\f sol sol sol

   %65
   sol sol sol fad\staccatissimo
   sol\staccatissimo la\staccatissimo re, r
   R1

   %68
   r2 sol4\p sol
   sol r r2
   r sol4 sol

   %71
   sol r\mbreak fad re
   re r re la'
   fad re sol sol

   %74
   sol r r2
   r do,4 do
   do r r2

   %77
   r do4 do
   do r si sol
   sol r sol re'\mbreak

   %80
   si sol do do
   do r dod dod
   re r red red

   %83
   mi la, re! r
   re sol, do r
   do fad, si r

   %86
   r8 si^\f dod red mi4 sol16 fad sol mi\mbreak
   fad8 si,\p dod red mi4 sol16 fad sol mi
   la4\f la la la

   %89
   la la la8 la sol la
   si4 si, mi r
   sol^\p la si r

   %92
   sol la si sol
   red si mi r\mbreak
   fad r sol r

   %95
   si do re r
   si do re8 do si la
   sol4 fa mi re

   %98
   do sold la r
   la' sol? fad mi
   re lad si r8 si'\mbreak

   %101
   lad4 la sold sol
   fad fad fad fad
   fad re mi dod

   %104
   re si sold lad
   si' la! sol? fad
   mi mi mi mi

   %107
   mi re lad fad\mbreak
   si fad'\fermata si, r
   sol'\staccatissimo\f sol\staccatissimo sol\staccatissimo r

   %110
   fad\staccatissimo fad\staccatissimo fad\staccatissimo r
   mi dod re si'
   do! la si sol

   %113
   la fad sol sol,
   re' \staccatissimo re\staccatissimo re\staccatissimo r\mbreak
   re re re'8 re, r4

   %116
   sol\p sol sol r
   fa fa fa r
   re^\f dod re dod

   %119
   r2 r4 r8 do'
   si mi, fad sold la4do16 si do la\mbreak
   si8 mi, fad sold la4 r

   %122
   do, si do si
   do\p si do si
   R1*3

   %127
   r4 la'8\p sol fad re mi fad
   sol si do la re do re re,
   sol4\staccatissimo \f sol\staccatissimo sol\staccatissimo r\mbreak

   %130
   fad\staccatissimo fad\staccatissimo fad\staccatissimo r
   mi dod^\p re si'
   do! la fad sold

   %133
   la fad sol! sol,
   do la re re,
   R1*3

   %138
   r2 r4 r8 do''
   si4 r8 sol\mbreak fad8 mi fad re
   sol4 r8 sol fad mi fad re

   %141
   sol si do la re do re re,
   mi4 fad sol8 do, re4_\fermata
   sol,\f\staccatissimo sol'\staccatissimo sol\staccatissimo r

   %144
   fa\staccatissimo fa\staccatissimo fa\staccatissimo r\mbreak
   re do re do
   do si do si8 si'

   %147
   la re, mi fad sol4 si16 la si sol
   la8 re, mi fad sol4 si16 la si sol
   do4\p do do do

   %150
   do do re8 do si\f do\mbreak
   re do re re, sol4 si,16 la si sol
   la8 re,\p mi fad sol4 si16 la si sol

   %153
   la8 re, mi fad sol4 si16 la si sol
   do4\f do do do
   do do do si\staccatissimo

   %156
   do\staccatissimo re\staccatissimo sol,\fermata r

}

Ibfn = \figures {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1
   <6>
   s4 <6 5> s <6 5>
   s <6 5> s <6 5>
   s <6 5> s2
   s4 <6 4> <5 3> s
   s <7 5>8 <6 4> <6 4> <5 3> s4
   s1
   <6>
   <_->4 <6> <_-> <6>
   s1
   <6\\>
   <6\\>
   s4 <6> s2
   s1
   <6>
   <6>
   s
   <6 5>2 s4 <6>
   <6 4> <5 3> s2
   <6>1
   <6>
   s
   <6 5>4 s <4 2> <6>
   s1*21
   s2 s4 s8 <4\+ 2>
   <6>2 s4 s8 <_+>
   <6>2 s4 s8 <_+>
   s2 <6 4>4 <5 _+>
   s1
   <6>
   s4 <6 5> s <6 5\+>
   s <6\\ 5> <5\+> <6 5>
   s <6 5>  s2
   <_+>4 <6 4> <5 _+> s
   s <7 _+>8 <6 4> <6 4> <5 _+> s4
   s8 <7 _+> s4 s2
   <6>1
   s1
   <6 5>2 <_+>
   <6 4>4 <5 _+> s2
    <6\\>1
    <6\\>
    s
    <6 5>2 <4\+ 2>4 <6>
    s <_+> s2
    s1*4
    s2 <6>
    s1
    <5>
    s1*4
    s2 <6>
    s2 s4 <_->
    <5->1
    s2 <6 5>
    s <6 5>
    s4 <7> s2
    s4 <7> s2
    s4 <7> <_+> s
    s8 <7 _+> s4 s2
    <6\\>1
    s
    <6 5>2 <4\+ 2>4 <6>
    <6 4> <5 _+> s2
    <6>4 <6 5> <_+> s
    <6 > <6 5> <_+> <6>
    <6> <7> s2
    <6>1
    <6>4 <6 5> s2
    <6>4 <6 5> s2
    s4 <4 2> <_+> <4\+ 2>
    <6> <6> s2
    <_+>4 <4\+ 2> <_+> <4\+ 2>
    <6> <6> s4 s8 <6>
    <7>4 <6> <7> <6>
    <_+> <6 4> <5\+ _+> <6 4>
    <5\+ _+> <6> <9> <6>
    <9> <6> <6 5> <6 5>
    <5>8 <6> <7> <6> <7> <6> <7> <6>
    <7> <6!> s4 s2
    <4 2>4 <6> s2
    s4 <_+> s2
    s1
    s
    s4 <6 5> s <6 5>
    s <6 5> s <6 5>
    s <6 5> s2
    s4 <6 4> <5 3> s
    s4 <7  5>8 <6 4> <6 4> <5 3> s4
    s1
    <6>
    <_->4 <6> <_-> <6>
    s2 s4 s8 <6>
    <6\\>1
    <6\\>
    s4 <6> s <6>
    s1*4
    s2 <6>
    s4 <6> <4> <3>
    s1
    s
    s4 <6 5> <9> <6>
    <9> <8> <6 5> <6 5>
    <9> <6 5> <9> <8>
    <6>1
    s1*3
    s2 s4 s8 <4 2>
    <6>1
    s
    s4 <6> <4> <3>
    s <6 5> s2
    s1
    <6>
    <_->4 <6> <_-> <6>
    <5> <6> s <6>
    <6>1
    <6>
    s
    <6 5>
    <6 4>4 <5 3> s2
    <6>1
    <6>
    s
    <6 5>2 <4 2>4 <6>

}

forma = {

   \key sol\major
   \time 4/4
   \tempo 2 = 55
   s1*156
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

Icb = {
   \Iglobal
   \clef bass
   <<\Icbn \forma>>

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
}

IIfln = \relative do'' {

   r4 r8 re sol re si sol
   re' re r4 re8 si16 do re8 re
   sold sold r si si fa  mi re

   %4
   do4 r8 mi, do' do16. do32 do8 do
   fad4 r8 do do do fad la
   sib! sib r re, sib sib do re \mbreak

   %7
   sol, sol r mib sib' sib sib sib
   mib mib r4 sib8 sol16 lab sib8 mib16 fa
   sol8 sol r sib, sib mib16 sol sib8 sol

   %10
   mi4 r sol8 do,16. do32 mi8 sol
   lab lab r4 lab4. fa8
   reb4 r8 fa fa4 reb

   %13
   si4. mib8 do do r4
   r r8 sol^\markup\huge"Andante"  mib' mib16. mib32 mib8 mib
   mib16 re do4 do8 fa16 sol lab8 lab fa

   %16
   re16(do sib4) mib8 re16 (do sib4) mib8
   do sib16 mib lab,8.\tr sol16 sol4 r8 sib
   sol' sol16. sol32 sol8 sol sol fa r fa\mbreak

   %19
   fa mib16. mib32 mib8 mib mib\tr re r do
   si16(la sol4) do8 si16(la sol8) r lab'
   sol (fa16 mib) mib8(re\tr) do4 r8 do

   %22
   sol' sol16. sol32 sol8 lab16. sib32\mbreak lab16 sol fa8 r do
   la'! la16. la32 la8 si16. do32 si16(la sol4) do8
   si16(la sol8) r4 r r8 fa

   %25
   mib re16 do si8 do re16 (do re4) sol8\mbreak
   mib re16 do si8 do re\staccatissimo r4  re8^\markup\huge"Lento"
   sol4 re si sol

   %28
   fa'8 fa r4 fa8 re16 mib fa8 fa
   si si r re re lab sol fa\mbreak
   mib4 r16 mib fa sol do,8 mib sol do

   %31
   la!4 r do8 mib,16. mib32 mib8 mib
   re4 r sib'8 re,16. re32 re8 re
   do4 r8 la' la8.[mib16 re8. do16]\mbreak

   %34
   sib4 r8 re mib do do' la
   fad4 r8 sol sol re r4
   R1

}


IIvlIn =  \relative do'' {

   re1^\p_\markup\italic"con Sordini"~
   re~
   re

   %4
   do~
   do
   sib~\mbreak

   %7
   sib~
   sib~
   sib~

   %10
   sib
   lab4 do2.
   reb1

   %13
   re!4\staccatissimo  r r si\staccatissimo
   do r r r8 do\mbreak
   do mib16. mib32 mib8 mib do do do lab

   %16
   fa16(mib re4) sol8 fa16(mib re4) sol8
   mib mib mib re mib sib'16. sib32 sib8 sib
   sib4 r8 mib mib re re re

   %19
   re do do do do si r mib,
   re16(do si4) mib8\mbreak re16(do si4) si'8
   do do do si do mib16. mib32 mib8 mib

   %22
   mi4 r8 mi fa fa16. fa32 fa8 fa
   re4 r8 re re16(do si4) mib8
   re16(do si4) do8 si16(la sol4) si8\mbreak

   %25
   do lab sol sol sol sol sol re'
   do lab sol sol sol\staccatissimo r r4
   R1

   %28
   fa'1~
   fa
   mib~

   %31
   mib8 mib16. mib32 mib8 mib mib4 r
   r8 re16. re32 re8 re re4 r
   r8 do16. do32 do8 do do4 r

   %34
   sib8 sol'16. sol32 sol2.
   r2 r4 fad\staccatissimo^\markup\italic"senza Sordini"
   sol\staccatissimo r r2

}

IIvlIIn = \relative do'' {

   si1~
   si1~
   si

   %4
   la~
   la
   sol~

   %7
   sol~
   sol~
   sol~

   %10
   sol
   fa
   lab~

   %13
   lab4\staccatissimo r r sol\staccatissimo
   sol\staccatissimo r r r8 sol
   lab lab16. lab32 lab8 lab lab16(sol fa8) fa fa

   %16
   fa fa fa mib fa fa fa mib
   lab, sib do sib sib sol'16. sol32 sol8 sol
   sol4 r8 sib\mbreak sib sib16. sib32 sib8 sol

   %19
   sol sol la! la sol sol sol do,
   re re re do re re re re
   mib lab sol fa mib sol16. sol32 sol8 sol

   %22
   sol4 r8 do do lab16. lab32 lab8 lab\mbreak
   la!4 r8 la re, re re do
   re re re mib re16(do si4) sol'8

   %25
   sol fa16 mib re8 mib si si si si'
   sol fa16 mib re8 mib si r r4
   R1

   %28
   re'1~
   re
   do~

   %31
   do8 do16. do32 do8 do do4 r
   sib8 sib16. sib32 sib8 sib sib4 r
   la8 la16. la32 la8 la la4 r

   %34
   sol8 sib16. sib32 sib2 la4\mbreak
   r2 r4 la\staccatissimo _\markup\italic"senza Sordini"
   sib\staccatissimo r r2

}

IIvlan = \relative do' {

   sol'1_\markup\italic"con Sordini"^\p~
   sol(
   si2) sold

   %4
   mi1
   re~
   re

   %7
   mib!~
   mib~
   mib\mbreak

   %10
   sol2 mi
   do1
   fa~

   %13
   fa4\staccatissimo r r re\staccatissimo
   mib!\staccatissimo r r r8 do
   lab'8 lab16. lab32 lab8 lab lab16(sol fa8) fa fa

   %16
   sib, sib sib sib sib sib sib sol
   lab sol fa sib mib, mib'16. mib32 mib8 mib
   mib4 r8 mib, sib' sib16. sib32 sib8 si\mbreak

   %19
   do do fad, fad sol sol16. sol32 sol8 sol
   sol sol sol sol sol sol sol fa
   mib fa sol sol do, do'16. do32 do8 do

   %22
   do4 r8 do\mbreak fa fa16. fa32 fa8 fa
   fad4 r8 fad, sol sol16. sol32 sol8 sol
   sol sol sol sol sol sol sol sol

   %25
   la fa sol do, sol' sol sol sol\mbreak
   do fa, sol do, sol' r r4
   R1

   %28
   si'
   re2 si
   sol1

   %31
   fa8 fa16. fa32 fa8 fa la4 r
   fa8 fa16. fa32 fa8 fa fa4 r
   fa8 fa16. fa32 fa8 fa mib!4 r

   %34
   re8 re16. re32 re4 do mib
   r2 r4 re\staccatissimo_\markup\italic"senza Sordini"
   re\staccatissimo r r2

}

IIcbn = \relative do {

   R1*36

}

IIbcn = \relative do {

   fa1~
   fa(
   mi)

   %4
   la
   re,
   sol

   %7
   mib
   reb~
   reb

   %10
   do
   fa~
   fa~

   %13
   fa4\staccatissimo r r sol\staccatissimo
   do, \staccatissimo r r2
   R1*13

   %28
   lab'1
   sol
   do,

   %31
   fa~
   fa~
   fa2 fad

   %34
   sol do,~
   do4 r r re\staccatissimo
   sol,\staccatissimo r r2

}

IIbfn = \figures {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   <6 4! 2>1
   s
   <7 _+>
   <5!>
   <7 _+>
   s
   s
   <6 4 2>
   s
   <7 _!>
   <_->
   <6- _->
   <6! 4! _->2. <_!>4
   s1*14
   <6 4 2!>1
   <7 _!>
   s
   <7>
   <6 4>
   <5 3>2 <7>
   s <7>4 <6>
   <6 4\+ _->4 s s <_+>

}

forma = {

   \key sol\minor
   \time 4/4
   \tempo 4 = 45
   s1*13
   \tempo 4 = 50
   s1*13
   \tempo 4 = 45
   s1*10
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

IIcb = {
   \IIglobal
   \clef bass
   <<\IIcbn \forma>>
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
   \terzine\senza
}

IIIfln = \relative do'' {

   R4.*41
   sol8\solo sol sol
   sol si16 sol do la

   %44
   re8 sol4\tr
   \tuplet 3/2 { fad16(mi re) } la'8.[(si32 do)]
   si16(la) sol4~

   %47
   sol4.~
   sol~
   sol~

   %50
   sol16 re sol si re si
   la re, fad la re la
   si re, sol si re si

   %53
   la re, fad la re la
   si sol fad mi sol si
   la fad mi re fad la\mbreak

   %56
   sol mi re dod mi sol
   fad re la' fad re' la
   si sol fad mi sol si

   %59
   la fad mi re fad la
   sol fad mi fad re  mi
   dod si la4~

   %62
   la4.~
   la~
   \once\tieDashed la~

   %65
   la16 dod mi sol fad mi
   fad la re, fad mi re
   dod la mi' sol fad mi

   %68
   fad re la' do! si la
   si re, si' re dod si
   dod mi la, sol fad mi

   %71
   fad8 si la
   sol fad r\mbreak
   fad si la

   %74
   sol fad r
   si4.
   la

   %77
   sol
   fad8. mi16 re8
   mi dod4\tr

   %80
   re8 si'4
   la4.
   sol

   %83
   fad16(la) re4
   re,16 (sol) mi4
   fad16(la) re4

   %86
   re,16(sol) mi4
   sol8. la16 fad8
   si dod,4\tr

   %89
   re8 r r
   R4.*26
   re16\solo dod re la si dod

   %117
   re dod re la re fad
   mi re mi la, dod re
   mi re mi la, mi' sol

   %120
   fad8la4\tr
   mi8 la4\tr
   fad8 la4\tr

   %123
   mi8 la4\tr
   fad16 la sol la re, la'
   dod, la' sol la la, la'

   %126
   fad la sol la re, la'\mbreak
   dod, la' sol la la, la'
   sol si la si mi, si'

   %129
   red, si' la si si, si'
   sol si la si mi, si'
   red, si' la si si, si'

   %132
   sol8 do16 si la sol
   fad8 si16 la sol fad
   mi8 la16 sol fad mi

   %135
   red dod si8 si'~
   si4.~
   si~

   %138
   si~
   si16 si, red fad si la
   sol fad sol si mi si

   %141
   do la, do mi la sol
   fad mi fad la re la\mbreak
   si sol, si re sol fad

   %144
   mi re mi sol do sol
   la fad, la do fad  mi
   red dod red fad si fad

   %147
   sol8 do si
   la\tr sol r
   sol do si

   %150
   la sol16 fad sol8~
   sol16 la fad8.\tr mi16
   mi8 r r

   %153
   R4.*5
   mi16\solo red mi si dod red
   mi red mi si mi sol

   %160
   fad mi fad si, red mi\mbreak
   fad mi fad si, fad' la
   sol fad sol si, mi sol

   %163
   sol fad sol mi sol si
   la sol la re, fad sol
   la sol la re, la' do!

   %166
   si8 re,4\tr
   la'8 re,4\tr
   si'8 re,4\tr

   %169
   la'8 re,4\tr
   si'16 sol re' si sol si
   la fad re' la fad la

   %172
   sol mi mi' sol, mi sol
   fad re la' fad  mi re
   mi do sol' mi do mi

   %175
   re si sol' re si re
   do la la' do, la do
   R4.*12

   %189
   sol16\solo si re sol fad sol
   mi sol do, sol' mi sol
   sol, si re sol fad sol

   %192
   mi sol do, sol' mi sol
   la, dod mi la sol la
   fad la re, la' fad la

   %195
   la, dod mi la sol la
   fad la re,  la' fad mi\mbreak
   re fad la re do re

   %198
   si re sol, re' si re
   re, fad la re do re
   si re sol, re' si re

   %201
   mi re do si la mi'
   re do si la sol re'
   do si la si sol la

   %204
   fad(mi re8) r
   re do'16 la si sol
   fad4\tr sol8

   %207
   la16 si do la si sol
   fad4\tr sol8
   mi16 fad sol mi la sol

   %210
   fad sol la fad si la
   sol la si sol do si
   la si do la re do\mbreak

   %213
   si8 mi re
   do si r
   si mi re

   %216
   do si r
   mi4.
   re

   %219
   do
   si8. la16 sol8
   la fad4\tr

   %222
   sol8 mi4
   re4.
   do

   %225
   si16 re sol4
   mi16 la fad4
   si,16 re sol4

   %228
   mi16 la fad4
   sol16 la la8.\tr [sol32(la)]
   si16 re do si la sol

   %231
   do8. re16 si8~
   si16 la la8.\tr sol16\mbreak
   sol4.~

   %234
   sol~
   sol~
   sol~

   %237
   sol8 fad mi
   re8. do16 si8~
   si16 do la4\tr

   %240
   sol8 r r
   R4.*28

}


IIIvlIn =  \relative do'' {

   sol8 sol sol
   sol si16 sol do la
   re8 sol, sol

   %4
   sol si16 sol do la
   re8 sol4\tr
   mi8 sol4\tr

   %7
   re8 sol4\tr
   mi8 sol4\tr
   re8 do si

   %10
   si\tr la16 si do la
   re8 do si
   si\tr la r

   %13
   sol sol sol
   sol si16 sol do la
   re8 sol, fa'

   %16
   fa?\tr mi r
   la, la la
   la dod16 la re si

   %19
   mi8 la, sol'\mbreak
   sol\tr fad r
   re, do'16 la si sol

   %22
   fad4\tr sol8
   la16(si do) la si sol
   fad4\tr sol8

   %25
   la16 si do re mi fad
   sol16.\tr fad64(sol) la8\staccatissimo r
   si, do la

   %28
   sol mi'16\p re mi do
   re8 do4\tr
   si8 mi16 re mi do

   %31
   re8 do4\tr
   si16\f do re  mi fad sol
   la8\staccatissimo do,\staccatissimo r

   %34
   si do la
   sol sol, sol
   sol si16 sol do la

   %37
   re8 si16 sol do la
   re8 do'16 la si sol\mbreak
   fad la fad re sol8

   %40
   do, la re
   sol,4 r8
   R4.*4

   %46
   sol'8\p mi'16 re mi do
   re8 do4\tr
   si8 mi16 re mi do

   %49
   re8 do4\tr
   si r8
   R4.*10

   %61
   la,8\p sol'16 mi fad re
   dod4\tr re8
   mi16(fad sol) mi fad re

   %64
   dod4\tr re8
   mi4 r8
   R4.*7\mbreak

   %73
   re8\p sol fad
   mi re r
   r sol16 la si dod

   %76
   re8 re,16 mi fad re
   mi8 dod16 si dod la
   re8 re16 mi fad re

   %79
   sol8 la la,
   re4 r8
   R4.*8

   %89
   re8\f re re
   re fad16 re sol mi\mbreak
   la8 re, re

   %92
   re fad16 re sol mi
   la8 re4\tr
   si8 re4\tr

   %95
   la8 re4\tr
   si8 re4\tr
   la8 sol fad

   %98
   fad\tr mi16 fad sol mi
   la8 sol fad
   fad\tr mi r

   %101
   la, sol'16 mi fad re
   dod4\tr re8
   mi16(fad sol) mi fad re

   %104
   dod4\tr re8
   mi16 fad sol la si dod
   re16.\tr dod64(re) mi8\staccatissimo r

   %107
   fad, sol mi
   re si'16\p la si sol
   la8 sol4\tr \mbreak

   %110
   fad8 si16 la si sol
   la8 sol4\tr
   fad16\f sol la si dod re

   %113
   mi8 sol, r
   fad sol mi
   re4 r8

   %116
   R4.*4
   re8\p fad16 mi fad re
   la'8 dod16 si dod la

   %122
   re8 fad,16 mi fad re
   la'8 dod16 si dod la
   re8 r la'

   %125
   mi r r
   fad r fad\mbreak
   mi r r

   %128
   sol r sol
   fad r r
   sol r sol

   %131
   fad r r
   R4.*3
   si,,8\p la'16 fad sol mi

   %136
   red4\tr mi8
   fad16(sol la) fad sol mi
   red4 mi8

   %139
   fad4 r8
   sol'4 r8
   sol4 r8

   %142
   fad4 r8\mbreak
   fad4 r8
   mi4 r8

   %145
   mi4 r8
   red4 r8
   mi, la sol

   %148
   fad\tr mi r
   R4.*3
   mi8\f mi mi

   %153
   mi sol16 mi la fad
   si8 sol16 mi la fad
   si8 la'16 fad sol mi

   %156
   red fad red si mi8
   la, fad si
   mi,4 r8

   %159
   R4.*7
   sol8\p si16 la si sol
   re8 fad16 mi fad re

   %168
   sol8 si16 la si sol
   re8 fad16 mi fad re
   sol4 r8

   %171
   R4.*6
   sol8\f sol sol
   sol si16 sol do la\mbreak

   %179
   re8 sol, sol
   sol si16 sol do la
   re8 sol4\tr

   %182
   mi8 sol4\tr
   re8 sol4\tr
   mi8 sol4\tr

   %185
   re8 do si
   si\tr la16 si do la
   re8  do si

   %188
   si\tr la r
   r sol\p sol
   sol4 r8

   %191
   R4.*2
   r8 la la
   la4 r8

   %195
   R4.*2
   r8 re re
   re4 r8

   %199
   R4.*5
   re,8 do'16 la si sol
   fad4 sol8

   %206
   la16(si do) la si sol
   fad4 sol8
   la16(si do8) si

   %209
   R4.*6
   sol8\p do si
   la sol r

   %217
   r do,16 re mi fad
   sol8 sol16 la si sol
   la8 fad16 mi fad re

   %220
   sol8 sol16 la si sol
   do8 re re,
   sol4 r8

   %223
   R4.*10\mbreak
   sol8\p mi'16 re mi do
   re8 do4\tr

   %235
   si8 mi16 re mi do
   re8 do4\tr
   si8 la sol

   %238
   fad re mi
   do re4
   sol8\f sol sol

   %241
   sol si16 sol do la
   re8 sol, fa'
   fa?\tr mi r

   %244
   la, la la
   la dod16 la re si
   mi8 la, sol'

   %247
   sol\tr fad r
   re do'16 la si sol
   fad4\tr sol8

   %250
   la16 si do la si sol\mbreak
   fad4\tr sol8
   la16 sol fad mi re do'

   %253
   si8\staccatissimo la\staccatissimo r
   sol la fad
   sol mi16\p re mi do

   %256
   re8 do4\tr
   si8 mi16 re mi do
   re8 do4\tr

   %259
   si16\f do re mi fad sol
   la8\staccatissimo do,\staccatissimo r
   si do la

   %262
   sol sol, sol
   sol re'16 si do la
   re8 si16 sol do la

   %265
   re8 do'16 la si sol
   fad la fad re sol8
   do, la re

   %268
   sol,4\fermata r8

}

IIIvlIIn = \relative do'' {

   R4.
   sol8 sol sol
   sol si16 sol do la

   %4
   re8 sol, sol
   sol sol'4\tr
   mi8 sol4\tr

   %7
   re8 sol4\tr
   mi8 sol4\tr
   si,8 la sol

   %10
   sol\tr fad16 sol la fad
   si8 la sol
   sol\tr fad r

   %13
   R4.
   sol8 sol sol
   sol si16 sol re' re

   %16
   re8\tr do r
   R4.
   la8 la la

   %19
   la dod16 la mi' mi\mbreak
   mi8\tr re r
   R4.

   %22
   re,8 do'16 la si sol
   fad4\tr sol8
   la16(si do) la si sol

   %25
   mi8 la la
   si\staccatissimo la\staccatissimo r
   sol la fad

   %28
   sol4 r8
   r mi'16 \p re mi do
   re8 do4\tr

   %31
   si8 mi16 re  mi do
   re8\f la la
   la\staccatissimo  la\staccatissimo r

   %34
   sol la fad
   sol sol, sol
   sol si16 sol do la

   %37
   re8 si16 sol do la
   re8 do'16 la si sol\mbreak
   fad la fad re sol8

   %40
   do, la re
   sol,4 r8
   R4.*5

   %47
   sol'8\p mi'16 re mi do
   re8 do4\tr
   si8 mi16 re mi do

   %50
   re8 sol, r
   R4.*11
   la,8 sol'16 mi fad re

   %63
   dod4\tr re8
   mi16 (fad sol) mi fad re
   dod4 r8

   %66
   R4.*7\mbreak
   re8\p sol fad
   mi re r

   %75
   r sol16 la si dod
   re8 re,16 mi fad re
   mi8 dod16 si dod la

   %78
   re8 re16 mi fad re
   sol8 la la,
   re4 r8

   %81
   R4.*9
   re8\f re re
   re fad16 re sol mi

   %92
   la8 re, re
   re re'4\tr
   si8 re4\tr

   %95
   la8 re4\tr
   si8 re4\tr
   fad,8 mi re

   %98
   re  dod16 re mi dod
   fad8 mi re
   re\tr dod r

   %101
   R4.
   la8 sol'16 fad sol mi
   dod4\tr re8

   %104
   mi16(fad sol) mi fad re
   si8 mi mi
   fad mi r

   %107
   re mi dod
   re4 r8
   r si'16\p la si sol\mbreak

   %110
   la8 sol4\tr
   fad8 si16 la si sol
   la8\f mi mi

   %113
   mi mi r
   re mi dod
   re4 r8

   %116
   R4.*4
   re8\p fad16 mi fad re
   la'8 dod16 si dod la

   %122
   re8 fad,16 mi fad re
   la'8 dod16 si dod la
   re8 r  re

   %125
   dod r r
   re r re\mbreak
   dod r r

   %128
   mi r mi
   red r r
   mi r la

   %131
   red, r r
   R4.*4
   si,8 la'16 fad sol mi

   %137
   red4\tr mi8
   fad16(sol la) fad sol mi
   red4 r8

   %140
   mi'4 r8
   mi4 r8
   re4 r8\mbreak

   %143
   re4 r8
   do4 r8
   do4 r8

   %146
   si4 r8
   mi, la sol
   fad\tr mi r

   %149
   R4.*3
   mi8\f mi mi
   mi sol16 mi la fad

   %154
   si8 sol16 mi la fad
   si8 fad' mi
   red16 fad red si mi8

   %157
   la, fad si
   mi,4 r8
   R4.*7

   %166
   sol8\p si16 la si sol
   re8 fad16 mi fad re
   sol8 si16 la si sol

   %169
   re8 fad16 mi fad re
   sol4 r8
   R4.*7

   %178
   sol8\f sol sol
   sol si16 sol do la
   re8 sol, sol

   %181
   sol sol'4\tr
   mi8 sol4\tr
   re8 sol4\tr

   %184
   mi8 sol4\tr
   si,8 la sol
   sol\tr fad16 sol la fad

   %187
   si8 la sol
   sol\tr fad r
   si,\p si si

   %190
   do4 r8
   R4.*2
   dod8 dod dod

   %194
   re4 r8
   R4.*2
   fad8 fad fad

   %198
   sol4 r8
   R4.*6
   re8\p re re

   %206
   re re re
   re re re
   re re re

   %209
   R4.*6
   sol8\p do si
   la sol r

   %217 OOKKK
   r do,16 re mi fad
   sol8 sol16 la si sol
   la8 fad16 mi fad re

   %220
   sol8 sol16 la si sol
   do8 re re,
   sol4 r8

   %223
   R4.*11
   sol8\p mi'16 re mi do
   re8 do4\tr

   %236
   si8 mi16 re mi do
   re8 do si
   la fad sol

   %239
   do, re4
   sol,\f r8
   sol' sol sol

   %242
   sol si16 sol re' re
   re8\tr do r
   R4.

   %245
   la8 la la
   la dod16 la mi' mi\mbreak
   mi8\tr re r

   %248
   R4.
   re,8 do'16 la si sol
   fad4\tr sol8

   %251
   re do'16 la si sol
   fad4 fad'8
   sol\staccatissimo re\staccatissimo r

   %254
   si do la
   sol4 r8
   r mi'16\p re mi do

   %257
   re8 do4\tr
   si8 mi16 re mi do
   re8\f la la

   %260
   la\staccatissimo la\staccatissimo r
   sol la fad
   sol sol, sol

   %263
   sol re'16 si do la
   re8 si16 sol do la
   re8 do'16 la si sol

   %266
   fad la fad re sol8
   do, la re
   sol,4\fermata r8

}

IIIvlan = \relative do' {

   sol8 si16 sol do la
   re8 sol sol
   si, sol' sol

   %4
   si, sol' sol
   si re16 do re si
   sol8 sol do

   %7
   si re16 do re si
   sol8 sol sol
   sol re re

   %10
   re re re
   re4 mi8
   re re r

   %13
   R4.*2
   si8 re si
   sol sol sol

   %17
   mi' dod r
   R4.
   dod8 mi dod\mbreak

   %20
   la8 la la
   la fad' sol
   la re, re

   %23
   re re re
   re re re
   mi mi re

   %26
   re\staccatissimo re\staccatissimo r
   re mi re16 do
   si8\p sol sol

   %29
   sol sol sol
   sol sol sol
   sol sol sol

   %32
   sol'\f la sol
   fad\staccatissimo re\staccatissimo r
   re mi re16 do

   %35
   si8 sol sol
   sol si16 sol do la
   re8 si16 sol do la

   %38
   re8 do'16 la si sol\mbreak
   fad la fad re sol8
   do, la re

   %41
   sol,4 r8
   R4.*31
   re'8\p sol fad

   %74
   mi re r
   r sol16 la si dod
   re8 re,16 mi fad re

   %77
   mi8 dod16 si dod la
   re8 re16 mi fad re
   sol8 la la,\tr

   %80
   re4 r8
   R4.*8
   re8\f fad16 re sol mi

   %90
   la8 re, re\mbreak
   fad, re' re
   fad, re' re

   %93
   fad la16 sol la fad
   re8 re sol
   fad la16 sol la fad

   %96
   re8 re re
   re la la
   la la la

   %99
   la4 si8
   la la16 si dod re
   mi8 dod re

   %102
   mi mi la,
   la la la
   la la la

   %105
   si si la
   la la r
   la si la

   %108
   re\p re re
   re re re\mbreak
   re re re

   %111
   re re re
   re\f mi re
   dod la r

   %114
   la si la16 sol
   fad4 r8
   R4.*4

   %120
   re'8\p fad16 mi fad re
   la'8 dod16 si dod la
   re8 fad,16 mi fad re

   %123
   la'8 dod16 si dod la
   re8 r la
   la r r

   %126
   la r la\mbreak
   la r r
   si r si

   %129
   si r r
   si r si
   si r r

   %132
   R4.*20
   mi,8\f mi mi
   mi sol16 mi la fad

   %154
   si8 sol16 mi la fad
   la4 mi'8
   red8. si16 mi8

   %157
   la, fad si
   mi,4 r8
   R4.*7

   %166
   sol8\p si16 la si sol
   re8 fad16 mi fad re
   sol8 si16 la si sol

   %169
   re8 fad16 mi fad re
   sol4 r8
   R4.*6

   %177
   sol,8\f si16 sol do la
   re8 sol sol\mbreak
   si, sol' sol

   %180
   si, sol' sol
   si8 re16 do re si
   sol8 sol do

   %183
   si re16 do re si
   sol8 sol sol
   sol re re

   %186
   re re re
   re4 mi8
   re re r

   %189
   R4.*2
   r8 sol\p sol
   sol4 r8

   %193
   R4.*2
   r8 la la
   la4 r8\mbreak

   %197
   R4.*2
   r8 re re
   re4 r8

   %201
   R4.*14
   sol,8\p do si
   la sol r

   %217
   r do,16 re  mi fad
   sol8 sol16 la si sol
   la8 fad16 mi fad re

   %220
   sol8 sol16 la si sol
   do8 re re,
   sol4 r8

   %223
   R4.*19
   si,8\f re si
   si si si

   %244
   mi dod r
   R4.
   dod8 mi dod

   %247
   la la' la
   fad4\tr sol8
   la la re,

   %250
   re re re\mbreak
   re re re
   re re re

   %253
   re\staccatissimo re\staccatissimo r
   re mi re16 do
   si8\p sol sol

   %256
   sol sol sol
   sol sol sol
   sol sol sol

   %259
   sol'\f la sol
   fad\staccatissimo re\staccatissimo r
   re mi re16 do

   %262
   si8 sol sol
   sol si16 sol do la\mbreak
   re8 si16 sol do la

   %265
   re8 do'16 la si sol
   fad la fad re sol8
   do, la re

   %268
   sol,4\fermata r8

}

IIIcbn = \relative do {

   sol8 sol sol
   sol sol sol
   sol sol sol

   %4
   sol sol sol
   sol si16 la si sol
   do8 mi16 re mi do

   %7
   sol'8 si,16 la si sol
   do8 mi16 re mi do
   sol'8 fad sol

   %10
   re4 do8
   si4 do8
   re re, r

   %13
   R4.*2
   sol8 sol sol
   do do16 re mi re

   %17
   dod8 la r
   R4.
   la8 la la\mbreak

   %20
   re re16 dod re mi
   fad8 re re
   re re re

   %23
   re re re
   re re sol
   do do do

   %26
   si\staccatissimo fad\staccatissimo  r
   sol do, re
   sol,4 r8

   %29
   R4.*3
   sol'8 fad mi
   re16 mi fad8\staccatissimo r

   %34
   sol do, re
   sol, sol sol
   sol si16 sol do la

   %37
   re8 si16 sol do la
   re8 do'16 la si sol\mbreak
   fad la fad re sol8

   %40
   do, la re
   sol,4 r8
   R4.*47

   %89
   re'8\f re re
   re re re
   re re re

   %92
   re re re
   re fad16 mi fad re\mbreak
   sol8 si,16 la si sol

   %95
   re'8 fad16 mi fad re
   sol8 si,16 la si sol
   re'8 dod re

   %98
   la4 sol8
   fad4 sol8
   la la16 sol la si

   %101
   dod8 la la
   la la la\mbreak
   la la la

   %104
   la la re
   sol sol sol
   fad dod r

   %107
   re sol, la
   re,4 r8
   R4.*3

   %112
   re'8 dod si
   la16 si dod8\staccatissimo r
   re sol, la\mbreak

   %115
   re,4 r8
   R4.*36
   mi'8\f mi mi

   %153
   mi sol16 mi la fad
   si8 sol16 mi la fad
   si4 mi8

   %156
   red8. si16 mi8
   la, fad si
   mi,4\p r8

   %159
   R4.*18
   sol,8\f sol sol
   sol sol sol

   %179
   sol sol sol
   sol sol sol
   sol si16 la si sol

   %182
   do8 mi16 re mi do\mbreak
   sol'8 si,16 la si sol
   do8 mi16 re mi do

   %185
   sol'8 fad sol
   re4 do8
   si4 do8

   %188
   re re, r
   R4.*53
   sol8\f sol sol
   do do16 re mi re\mbreak
   dod8 la r

   %245
   R4.
   la8 la la
   re re16 mi fad mi

   %248
   re8 re re
   re re re
   re re re

   %251
   re re re
   re re' re\mbreak
   sol,\staccatissimo fad\staccatissimo r

   %254
   sol do, re
   sol,4 r8
   R4.*3

   %259
   sol'8 fad mi
   re16 mi fad8\staccatissimo r
   sol do, re

   %262
   sol, sol sol
   sol si16 sol do la\mbreak
   re8 si16 sol do la

   %265
   re8 do'16 la si sol
   fad la fad re sol8
   do, la re

   %268
   sol,4\fermata r8

}

IIIbcn = \relative do {

   sol8 sol sol
   sol sol sol
   sol sol sol

   %4
   sol sol sol
   sol si16 la si sol
   do8 mi16 re mi do

   %7
   sol'8 si,16 la si sol
   do8 mi16 re mi do
   sol'8 fad sol

   %10
   re4 do8
   si4 do8
   re re, r

   %13
   R4.*2
   sol8 sol sol
   do do16 re mi re

   %17
   dod8 la r
   R4.
   la8 la la\mbreak

   %20
   re re16 dod re mi
   fad8 re re
   re re re

   %23
   re re re
   re re sol
   do do do

   %26
   si\staccatissimo fad\staccatissimo  r
   sol do, re
   sol,4 r8

   %29
   R4.*3
   sol'8 fad mi
   re16 mi fad8\staccatissimo r

   %34
   sol do, re
   sol, sol sol
   sol si16 sol do la

   %37
   re8 si16 sol do la
   re8 do'16 la si sol\mbreak
   fad la fad re sol8

   %40
   do, la re
   sol,4 r8
   R4.

   %43
   sol'8\p sol sol
   sol si16 sol do la
   re8 fad, re

   %46
   sol4 r8
   R4.*3
   sol8 si sol

   %51
   fad re r
   sol si sol
   fad re r

   %54
   sol4 r8\mbreak
   fad8 si4
   mi,8 la4

   %57
   re,8 fad re
   sol4 r8
   fad4 r8

   %60
   mi sol mi
   la4 r8
   R4.*3

   %65
   la8\p dod, la
   re fad sol
   la dod la

   %68
   re fad, re\mbreak
   sol sold mi
   la dod, la

   %71
   re sol fad
   mi re r
   R4.*7

   %80
   r8 sol16\p la si dod
   re8 re,16 mi fad re
   mi8 dod16 si dod la

   %83
   re8 fad16 mi fad re\mbreak
   si'8 sol la
   re, fad16 mi fad re

   %86
   si'8 sol la
   si dod re
   sol, la la,

   %89
   re\f re re
   re re re
   re re re

   %92
   re re re
   re fad16 mi fad re\mbreak
   sol8 si,16 la si sol

   %95
   re'8 fad16 mi fad re
   sol8 si,16 la si sol
   re'8 dod re

   %98
   la4 sol8
   fad4 sol8
   la la16 sol la si

   %101
   dod8 la la
   la la la\mbreak
   la la la

   %104
   la la re
   sol sol sol
   fad dod r

   %107
   re sol, la
   re,4 r8
   R4.*3

   %112
   re'8 dod si
   la16 si dod8\staccatissimo r
   re sol, la\mbreak

   %115
   re,4 r8
   fad'4^\p r8
   re4 r8

   %118
   dod4 r8
   la4 r8
   re4 r8

   %121
   R4.*3
   re8 r fad
   la r r

   %126
   re, r fad
   la r r\mbreak
   mi r sol

   %129
   si r r
   mi, r sol
   si r r

   %132
   mi, mi mi
   re re re
   do do do

   %135
   si4 r8
   R4.*3\mbreak
   si'4 r8

   %140
   mi,4 r8
   la4 r8
   re,4 r8

   %143
   sol4 r8
   do4 r8
   fad,4 r8

   %146
   si4 r8
   R4.*2
   mi,8 la sol

   %150
   fad red' mi
   la, si si,\mbreak
   mi\f mi mi

   %153
   mi sol16 mi la fad
   si8 sol16 mi la fad
   si4 mi8

   %156
   red8. si16 mi8
   la, fad si
   mi,4\p r8

   %159
   sol4 r8
   red4 r8
   si4 r8\mbreak

   %162
   mi4 r8
   mi4 r8
   fad4 r8

   %165
   re4 r8
   sol4 r8
   R4.*3

   %170
   sol4 r8
   fad4 r8
   mi4 r8

   %173
   re4 r8
   do4 r8\mbreak
   si4 r8

   %176
   la4 r8
   sol\f sol sol
   sol sol sol

   %179
   sol sol sol
   sol sol sol
   sol si16 la si sol

   %182
   do8 mi16 re mi do\mbreak
   sol'8 si,16 la si sol
   do8 mi16 re mi do

   %185
   sol'8 fad sol
   re4 do8
   si4 do8

   %188
   re re, r
   R4.*2
   si'8\p si si

   %192
   do4 r8\mbreak
   R4.*2
   dod8 dod dod

   %196
   re4 r8
   R4.*2
   fad8 fad fad

   %200
   sol4 r8
   do4 r8
   si4 r8

   %203
   la do la
   re re, re
   R4.*4\mbreak

   %209
   do8\p do do
   re re re
   mi mi mi

   %212
   fad fad fad
   sol do si
   la sol r

   %215
   R4.*7
   r8 do,16\p re mi fad
   sol8 sol16 la si sol\mbreak

   %224
   la8 fad16 mi fad re
   sol8 si16 la si sol
   do8 re re,

   %227
   sol si16 la si sol
   do8 re do
   si fad re

   %230
   sol4 r8\mbreak
   mi fad sol
   do, re re,

   %233
   sol4 r8
   R4.
   sol4 r8

   %236
   R4.
   sol4 r8
   R4.*4

   %242
   sol8\f sol sol
   do do16 re mi re\mbreak
   dod8 la r

   %245
   R4.
   la8 la la
   re re16 mi fad mi

   %248
   re8 re re
   re re re
   re re re

   %251
   re re re
   re re' re\mbreak
   sol,\staccatissimo fad\staccatissimo r

   %254
   sol do, re
   sol,4 r8
   R4.*3

   %259
   sol'8 fad mi
   re16 mi fad8\staccatissimo r
   sol do, re

   %262
   sol, sol sol
   sol si16 sol do la\mbreak
   re8 si16 sol do la

   %265
   re8 do'16 la si sol
   fad la fad re sol8
   do, la re

   %268
   sol,4\fermata r8

}

IIIbfn = \figures {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s4.*9
   <6 4>8 <5 3> s
   <6>4 <7 5>8
   <6 4> <5 3> s
   s4.*2
   s4 <7->8
   <9 4->8 <8 3>4
   <6>4.
   s
   <_+>4 <7>8
   <9 4> <8 3>4
   <6>4 <6 4>8
   <5 3>4 <6 4>8
   <5 3>4 <6 4>8
   <5 3>4.
   <6>4 <4 2>8
   <6> <6> s
   s4.*5
   s8 <6> <6\\>
   s <6 5!>8 s
   s4.*21
   <6>8 <7>4
   <7>8 <7 _+>4
   s4.
   s
   <6>
   s
   <_+>
   s4.*3
   <_+>4.
   s
   <_+>
   s
   s8 <6>4
   <_+>4.
   s4 <6>8
   <6\\>4.
   s4.*8
   <4>8 <3>4
   <9>8 <6 5>4
   <9>8 <6>4
   s <_+>8
   s4.
   s4 <_+>8
   <6> <6 5> s
   s <_+> s
   s4.*9
   <6 4>8 <5 _+> s
   <6>4 <7 5>8
   <6 4> <5 _+> s
   <6> s <6 4>
   <5 _+> s <6 4>
   <5 _+> s <6 4>
   <5 _+> s s
   <6> s <4\+ 2>
   <6> <6> s
   s4 <_+>8
   s4.*4
   s8 <6> <6\\>
   <_+> <6 5!> s
   s4 <_+>8
   s4.
   <6>
   s
   <6>
   <7 _+>
   s4.*5
   <_+>4.
   s
   <_+>
   s
   <_+>
   s
   <_+>
   s8 <6> s
   <7> <6> s
   <7> <6> s
   <_+>4.
   s4.*3
   <_+>4.
   s
   <7>
   <7>
   <7>
   <7>
   <7>
   <_+>
   s
   s
   s4 <6>8
   <6\\>4.
   s8 <4> <_+>
   s4.
   s
   <_+>
   <_+>
   s
   s4 <_+>8
   s4.
   <6>
   <6>
   <7 _+>
   s
   s
   <6>
   <7>
   s4.*5
   <6>4.
   <6\\>s
   s
   <6> <6>
   s4.*9
   <6 4>8 <5 3> s
   <6>4 <7 5>8
   <6 4> <5 3> s
   s4.*2
   <6>4.
   s4.*3
   <6>4.
   s4.*3
   <6>4.
   s
   s
   <6>
   s4.*6
   s4 <6>8
   <5> s <6>
   <5> s <6>
   <5> s <6>
   s4 <6>8
   <6>4.
   s4.*8
   <4>8 <3> s
   <9> <6 5> s
   <9> <6> s
   s4.*5
   <6>8 <6 5> s
   s <4> <3>
   s4.*9
   s4 <7->8
   <9 4-> <8 3> s
   <6>4.
   s
   <_+>4 <7 _+>8
   <9 4> <8 3> s
   s4 <6 4>8
   <5 3> s <6 4>
   <5 3> s <6 4>
   <5 3> s <6 4>
   <5 3>4.
   s8 <6> s
   s4.*5
   s8 <6> <6\\>
   s <6 5!> s

}

forma = {

   \key sol\major
   \time 3/8
   \tempo 4. = 70
   s4.*268
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

IIIcb = {
   \IIIglobal
   \clef bass
   <<\IIIcbn \forma>>
}

IIIbc = {
   \IIIglobal
   \clef bass
   <<\IIIbcn \forma \IIIbfn>>
   \typeset

}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

   systems-per-page = #3
   print-first-page-number = ##t
   first-page-number = #2

}

\markup\huge "[1.] Allegro assai "

\score {
   {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
      }<<

         \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"Flauto""Traversiero"}
            \Ifl
         >>

         \new PianoStaff <<

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
            \set Staff.instrumentName = \markup \center-column{"Violetta"}
            \Ivla
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Basso""Ripieno"}
            \Icb
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         }<<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{"Basso"}
            \Ibc

         >>
      >>
   }

   \layout {

      indent = 1.8\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup\huge "[2.] Lento "

\score {
   {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
      }<<

         \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IIfl
         >>

         \new PianoStaff <<

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
            \set Staff.midiInstrument = #"viola"
            \IIcb
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         }<<
            \set Staff.midiInstrument = #"cello"
            \IIbc

         >>
      >>
   }

   \layout {

      indent = 0.5\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

\markup\huge "[3.] Vivace "

\score {
   {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
      }<<

         \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IIIfl
         >>

         \new PianoStaff <<

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
            \set Staff.midiInstrument = #"viola"
            \IIIcb
         >>

         \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
         }<<
            \set Staff.midiInstrument = #"cello"
            \IIIbc

         >>
      >>
   }

   \layout {

      indent = 0.5\cm

      \context	{
         \Score
         \override StaffGrouper.staff-staff-spacing.padding = #1
         \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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
