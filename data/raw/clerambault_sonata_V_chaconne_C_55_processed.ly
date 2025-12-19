\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

s1^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza I]"}\bar "|"

\cadenzaOff

}

MyCadenzabis = \relative do'' {

\cadenzaOn

s2.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza III]"}\bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

saltabis = #(skip-of-length MyCadenzabis)

parentSlur =
 -\tweak stencil
 #(lambda (grob)
   (let* ((cp (ly:grob-property grob 'control-points))
          (lp (grob-interpret-markup grob (markup #:teeny "(")))
          (rp (grob-interpret-markup grob (markup #:teeny ")"))))
     (set! lp (ly:stencil-aligned-to lp Y CENTER))
     (set! lp (ly:stencil-aligned-to lp X 0.2))
     (set! lp (ly:stencil-translate lp (first cp)))
     (set! rp (ly:stencil-aligned-to rp Y CENTER))
     (set! rp (ly:stencil-aligned-to rp X -0.2))
     (set! rp (ly:stencil-translate rp (last cp)))
     (list-set! cp 0
       (cons (cdr (ly:stencil-extent lp X))
             (cdr (first cp))))
     (list-set! cp (1- (length cp))
       (cons (car (ly:stencil-extent rp X))
             (cdr (last cp))))
     (ly:grob-set-property! grob 'control-points cp)
     (apply ly:stencil-add (list lp rp
       (ly:slur::print grob)))))
 \etc

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

quarto = \tupletSpan 4

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


global = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \quarto \senza
}

dsn = \relative do'' {

    r4 fad re
    mi dod la
    re8.[dod16 re8. mi16 fad8. sol16]

    %4
    la8[sol16 fad mi8. fad16 sol8. la16]
    fad4\prall fad re
    mi dod la

    %7
    re8.[dod16 re8. mi16 fad8. sol16]\mbreak
    la4 mi4.\prall re8
    re4 la re

    %10
    dod la do
    si re sol
    mi la8.[sol16 la8. mi16]

    %13
    fad4 la, re
    dod la8.[si16 do8. re16]\mbreak
    si4 re sol

    %16
    mi la8.[sol16 la8. mi16]
    fad8 re16 mi fad8 la16 sol fad8 mi16 re
    mi8 la,16 si dod8 mi16 re dod8 si16 la

    %19
    re8 si16 dod re8 fad16 mi re8 dod16 si\mbreak
    mi8 dod16 re mi8 fad16 sol la8 sol16 la
    fad8 re16 mi fad8 la16 sol fad8 mi16 re

    %22
    mi8 la,16 si dod8 mi16 re dod8 si16 la
    re8 si16 dod re8 fad16 mi re8 dod16 si
    mi8 dod16 re \mbreak mi8 fad16 sol la8 sol16 la

    %25
    fad8 re la[fad] re re'
    dod la' mi[dod] la la'
    re, si' sol[re] sol re

    %28
    mi la mi[dod] la la'
    fad re la[fad] re re'\mbreak
    dod la' mi[dod] la la'

    %31
    re, si' sol[re] sol re
    mi la mi[dod] la la'
    fad\prall la,16 sol fad8 fad16 mi re8 re'

    %34
    dod8 mi16 re dod8 dod16 si la8 la' %%% fine pagina OOKK
    re, si'16 la sol8 sol16 fad mi8 mi16 re
    dod8 si16 dod la8 sol16 la mi8 fad16 sol

    %37
    fad8 la16 sol fad8 fad16 mi re8 re'
    dod mi16 re dod8 dod16 si la8 la'\mbreak
    re, si'16 la sol8 sol16 fad mi8 mi16 re

    %40
    dod8 si16 dod la8 sol16 la mi8 fad16 sol
    fad4 re'2
    dod4 mi2

    %43
    re4 fad2\mbreak
    mi8.[re16 mi8. fad16 sol8. la16]
    fad4\prall re2

    %46
    dod4\prall mi2
    re4 fad2
    mi8.[re16 mi8. fad16 sol8. la16]

    %49
    fad8\prall mi16 fad re8 la re[fad]\mbreak
    mi8 re16 mi dod8 la dod[mi]
    re8 dod16 re si8 sol si[re]

    %52
    dod16 la' sol fad mi8 fad sol la
    fad\prall mi16 fad re8 la re[fad]\mbreak
    mi re16 mi dod8 la dod[mi]

    %55
    re8 dod16 re si8 sol si[re]
    dod16 la' sol fad mi4.\prall re8
    re4 re,8.[mi16 fad8. sol16]

    %58
    la4 la4.\prall sol16 la\mbreak
    si8. dod16 re2
    r4 dod4.\prall si16 dod

    %61
    re4 re,8.[mi16 fad8. sol16]
    la4 la4.\prall sol16 la\mbreak
    si8. dod16 re2

    %64
    r4 dod4.\prall si16 dod\mbreak %%%fine p. 2  OOKK
    re4 fad8.[sol16 la8. si16]
    la4 mi8.[fad16 sol8. la16]

    %67
    sol4 re8.[mi16 fad8. sol16]
    fad4 mi fad8. sol16
    fad4 fad8.[sol16 la8. si16]

    %70
    la4 mi8.[fad16 sol8. la16]\mbreak
    sol4 re8.[mi16 fad8. sol16]
    fad8. sol16 mi4.\prall re8

    %73
    re4 fa^\markup\italic"[mineur]" sol
    mi\prall la8.[sol16 la8. dod,16]
    re4 sol8.[fa16 sol8. si,?16]

    %76
    dod8. re16 re4.\prall dod8\mbreak
    re4 fa sol
    mi\prall la8.[sol16 la8. dod,16]

    %79
    re4 sol8.[fa16 sol8. si,?16]
    dod8. re16  re4.\prall dod8
    re4 la sib

    %82
    sol mi la\mbreak
    fa re sol
    sol fa4.\prall mi8

    %85
    fa4 la sib
    sol mi la
    fa re sol

    %88
    fa8 mi mi4. re8\mbreak
    re4 <<{re'2
           re4 do2\parentSlur (

           %91
           do4) sib2~
           sib4 la mi
           fa re'2~

           %94
           re4 do2~
           do4 sib2~
           sib4}\\{re4 fa,
                   mi2 mi4
                   re2 re4
                   dod2.
                   re4 re' fa,
                   mi2 mi4
                   re2 re4}>> la' mi

    %97
    fa fa'2
    r4 mi2
    r4 re2~

    %100
    re4 dod4. si16 dod
    re4 fa2  % fine p. 3
    <<{r4 mi2

       %103
       r4 re2
       re4 dod4. si16 dod
       re8.[la'16 sol8. fa16 mi8. re16]}\\{sol,2 sol4
                                           la2 la4
                                           si mi,2
                                           re8.}>>

    %106
    dod'8.[la'16 la8. sol16 la8. dod,16]
    re8.[sol16 sol8. fa16 sol8. si,16]\mbreak
    dod8.[fa16 mi8. fa16 sol8. mi16]

    %109
    fa8.[la16 sol8. fa16 mi8. re16]
    dod8.[la'16 la8. sol16 la8. dod,16]
    re8.[sol16 sol8. fa16 sol8. si,16]

    %112
    dod8.[fa16 mi8. fa16 sol8. mi16]
    fa4 fa2
    mi4\prall la2

    %115
    fa4\prall sib2
    mi,8 fa mi4.\prall re8
    re4 fa2

    %118
    mi4 la2
    fa4 sib2\mbreak
    mi,8 fa mi4.\prall re8

    %121
    re8.[dod16 re8. mi16 fa8. sol16]
    la8.[sib?16 la8. sol16 fa8. mi16]
    re8.[la'16 sol8. fa16 mi8. re16]

    %124
    dod8.[si16 dod8. re16 mi8. dod16]
    re8.[dod?16 re8. mi16 fa8. sol16]
    la8.[sib16 la8. sol16 fa8. mi16]

    %127
    re8.[la'16 sol8. fa16 mi8. re16]
    dod8.[si16 dod8. re16 mi8. dod16]
    re4 re2

    %130
    do\prall r8 sib
    la4 re2~
    re4 dod4.\prall re8\mbreak

    %133
    re4 re2
    do2\prall r8 sib
    la4 re2~

    %136
    re4 dod4. re8
    re4 fa8. [sol16 fa8. mi16]
    re4 sol8.[la16  sol8. fa16]

    %139
    mi4 la8.[sib16 la8. sol16]\mbreak   %%fine p. 4
    fa4 sol8.[fa16 mi8. fa16]
    re4 fa8.[sol16 fa8. mi16]

    %142
    re4 sol8.[la16 sol8. fa16]
    mi4 la8.[sib16 la8. sol16]
    fa4 sol8.[fa16 mi8. fa16]

    %145
    re4 fa8.[mi16 fa8. sol16]\mbreak
    mi8.[re16 mi8. sol16 fa8. mi16]
    re8 mi16 fa sol8.[fa16 mi8. re16]

    %148
    dod8.[re16 mi8. fa16 sol8. mi16]
    fa4 fa8.[mi16 fa8. sol16]
    mi8.[re16 mi8. sol16 fa8. mi16]

    %151
    re8 mi16 fa sol8.[fa16 mi8. re16]
    dod8.[re16 mi8. fa16 sol8. mi16]
    fa4 la,8. sol16 fad4

    %154
    mi fad8. sol16 la4
    re, mi8. fad16 sol4\mbreak
    mi la8. [si16 la8. sol16]

    %157
    fad4 la8. sol16 fad4
    mi fad8. sol16 la4
    re, mi8. fad16 sol4

    %160
    mi la8. [si16 la8. sol16]
    fad4 re' mi\mbreak
    dod r r

    %163
    r fad8.[mi16 re8. dod16]
    si8. re16 re4.\prall dod8
    re4 re mi

    %166
    dod\prall r r
    r fad8.[mi16 re8. dod16]\mbreak
    si8. re16 re4.\prall dod8

    %169
    re8.[la16 la8. la16 fad8. la16]
    re,8. [la'16 la8. la16 re8. mi16]
    dod8.[mi16 mi8. mi16 dod8. mi16]

    %172
    la,8.[la'16 la8. la16 mi8. la16]
    fad8.[la,16 la8. la16 fad8. la16]\mbreak  %%% fine p. 5
    re,8. [la'16 la8. la16 re8. mi16]

    %175
    dod8.\prall[mi16 mi8. mi16 dod8. mi16]
    la,8.[la'16 la8. la16 mi8. la16]
    fad4\prall re2

    %178
    r4 dod2
    r4 si2\mbreak
    r4 la4. sol8

    %181
    fad4 re'2
    r4 dod2
    r4 si2

    %184
    r4 la4. sol8
    fad8.[fad'16 mi8. fad16] re8 mi16 fad\mbreak
    mi8.[mi16 re8. mi16 dod8 re16 mi]

    %187
    re8.[re16 dod8. re16 si8 dod16 re]
    dod8.[si16 la8. sol16 fad8. mi16]
    fad8. [fad'16 mi8. fad16 re8 mi16 fad]

    %190
    mi8.[mi16 re8. mi16 dod8 re16 mi]
    re8.[re16 dod8. re16 si8 dod16 re]
    dod8.[si16 la8. sol16 fad8. mi16]

    %193
    fad8.[la16 sol8. la16 fad8. la16]
    re,4 r r
    r8 sol8[si8. re16 si8. sol16]\mbreak

    %196
    sol'8.[fad16 mi8. fad16 sol8. la16]
    fad8.[la,16 sol8. la16 fad8. la16]
    re,4 r r

    %199
    r8 sol8[si8. re16 si8. sol16]\mbreak
    sol'8.[fad16 mi8. fad16 sol8. la16]
    fad4\prall re8. [mi16 fad8. sol16]

    %202
    la4 la la
    la2 sold8 fad16 sold
    la8[sol?16 fad mi8. la16] dod,8.\prall  la16

    %205
    re8.[dod16 re8. mi16 fad8. sol16]
    la4 la la\mbreak
    la2 sold8\prall fad16 sold

    %208
    la8[sol?16 fad mi8. la16 dod,8.  la16]
    re4 re re
    re do4.\prall si8

    %211
    si4. la8[si8. dod!16]\mbreak
    re4 re4.\prall dod8
    re4 re re

    %214
    re do4.\prall si8
    si4. la8[si8. dod!16]
    re4 re4.\prall dod8

    %217
    re2 r4

}

bcn = \relative do {

    re4 re'2
    dod2.
    si

    %4
    la2 la,4
    re re2
    dod2.

    %7
    si\mbreak
    la
    re4 re'2

    %10
    la2 fad4
    sol2 mi4
    la2 la,4

    %13
    re re2
    la2 fad4\mbreak
    sol2 mi4

    %16
    la2.
    re4 re'2
    dod2.

    %19
    si
    la2.
    re,

    %22
    dod
    si
    la

    %25
    re,4 re'2
    dod2.
    si

    %28
    la
    re,4 re'2\mbreak
    la2.

    %31
    si
    la
    re,4 re'2

    %34
    la'2.\mbreak  %%%fine pagina OOKK
    si2 sol4
    la2 la,4

    %37
    re re2
    la2.\mbreak
    si2 sol4

    %40
    la2.
    re,8 re'16 mi fad8[la16 sol fad8 mi16 re]
    la'8 la16 si dod8 mi16 re dod8 si16 la

    %43
    si8 la16 sol fad8 fad16 sol la8 sol16 fad\mbreak
    sol4 mi la
    re,8 re16 mi fad8[la16 sol fad8 mi16 re]

    %46
    la'8 la16 si dod8 mi16 re dod8 si16 la
    si8 la16 sol fad8 fad16 sol la8 sol16 fad
    sol4 mi la

    %49
    re, re'2\mbreak
    dod2.
    si

    %52
    la2 la,4
    re re2\mbreak
    dod2.

    %55
    si
    la
    re,4 re'2

    %58
    re'4 dod2\mbreak
    si4. la8 si8. sol16
    la8.[sol16 la8. si16 la8. la,16]

    %61
    re2 re,4
    re' dod2
    si4. la8[si8. sol16]

    %64
    la8.[sol16 la8. si16] la4  %%% fine p. 2
    re4 re'2
    dod4 do2

    %67
    si2.
    la2 la,4
    re2.

    %70
    dod4 do2\mbreak
    si2.
    la

    %73
    re4 re'2
    dod4 do la
    sib2 sol4

    %76
    la2 la,4\mbreak
    re re2
    dod4 do la

    %79
    sib2 sol4
    la2.
    re4 re'2

    %82
    dod4 do2
    si4 sib2
    la4 la,2

    %85
    re4 re2
    dod4 do2
    si4 sib2

    %88
    la2.\mbreak
    re,2 re'4
    la'2 la4

    %91
    sib2 sol4
    la2 la,4
    re2 re,4

    %94
    la'2 la4
    sib2 sol4\mbreak
    la2 la4

    %97
    re,2 re'4
    mi2 mi4
    fa2 fa4

    %100
    sol la la,
    re2 re,4\mbreak %%fine p.3
    mi2 mi4

    %103
    fa2 fa4
    sol la2
    re2.

    %106
    la'2 r8 la
    sib2 r8 sol\mbreak
    la2 la,4

    %109
    re2.
    la2 r8 la
    sib2 r8 sol

    %112
    la2.
    re,4 re'8.[mi16 fa8. sol16]\mbreak
    la4 fa8.[sol16 la8. fa16]

    %115
    sib4 sol8.[la16 sib8. sol16]
    la4 la,8.[si16 dod8. la16]
    re4 re,8.[mi16 fa8. sol16]

    %118
    la4 fa8.[sol16 la8. fa16]
    sib4 sol8.[la16 sib8. sol16]\mbreak
    la8.[sol16 la8. si16 dod8. la16]

    %121
    re4 re'2
    dod4 do2
    si4 sib2

    %124
    la4 la,2
    re4 re2
    dod4 do2

    %127
    si4 sib2
    la2.
    re,8 re'16 dod re8 mi fa re

    %130
    mi[mi16 re mi8 fa sol mi]
    fa[fa16 mi fa8 sol la fa]
    sol[la16 sib la8 sol la la,]\mbreak

    %133
    re8 [re16 dod re8 mi fa re]
    mi[mi16 re mi8 fa sol mi]
    fa[fa16 mi fa8 sol la fa]

    %136
    sol[la16 sib la8 sol la la,]
    re4 \clef violin re' re
    sol mi mi

    %139
    la fa fa\mbreak  %%%fine p.4
    sib sol la
    re, re re

    %142
    sol mi mi
    la fa fa
    sib sol la

    %145
    re, \clef bass re, re\mbreak
    la' la4.\prall la8
    sib4 sol4.\prall sol8

    %148
    la2 la,4
    re re re
    la' la4.\prall la8\mbreak

    %151
    sib4 sol4.\prall sol8
    la2 la,4
    re re'2

    %154
    la fad4
    sol2 mi4\mbreak
    la la,2

    %157
    re4 re2
    la fad4
    sol2 mi4

    %160
    la la2
    re,4 re'2\mbreak
    r4 sol la

    %163
    fad8.[mi16 fad8. sol16 la8. fad16]
    sol4 la la,
    re re,2

    %166
    r4 sol la
    fad8.[mi16 fad8. sol16 la8. fad16]\mbreak
    sol4 la2

    %169
    re,4 re'2
    fad, re4
    la' la'2

    %172
    dod,4 la2
    re2.\mbreak
    fad,2 re4

    %175
    la' la'2
    dod,4 la2
    re8.[la'16 fad8. fad16 re8. la'16]

    %178
    la,8.[la'16 mi8. mi16 la,8. la'16]
    si,8. sol'16 re8.[re16] sol,8. sol'16\mbreak
    la,8.[la'16 sol8. la16 la,8. la'16]

    %181
    re,8. la'16 fad8. [fad16 re8. la'16]
    la,8. la'16 mi8. [mi16] la,8.[ la'16]
    si,8. sol'16 re8.[re16] sol,8. sol'16

    %184
    la,8.[la'16] sol8. la16 la,8.[la'16]
    re,4 re'2\mbreak
    dod2.

    %187
    si
    la2 la,4
    re re2

    %190
    dod2.\mbreak
    si
    la

    %193
    re,
    r8 re'[fad8. la16 fad8. re16]
    sol2 r8 fad\mbreak

    %196
    mi4 la la,
    re2 re,4
    r8 re'[fad8. la16 fad8. re16]

    %199
    sol2 r8 fad
    mi4 la la,
    re4 re'2\mbreak

    %202
    dod8.[si16 do8. re16 do8. re16]
    si8.[la16 si8. do16 si8. do16]
    la2 sol4

    %205
    fad8. mi16 re2
    dod8. [si16 do8. re16 do8. re16]\mbreak
    si8.[la16 si8. do16 si8. do16]

    %208
    la2 sol4
    fad8. mi16 re4 mi
    fad fad2

    %211
    sol4 sol'8.[fad16 sol8. la16]\mbreak
    si8. sol16 la4 la,
    re re, mi

    %214
    fad fad2
    sol4 sol'8.[fad16 sol8. la16]
    si8 sol la4 la,

    %217
    re2 re,4

}

bfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \key re\major
   \time 3/4
   \override Staff.TimeSignature.style = #'single-digit
   \tempo 2 = 58
   s2.*72
   s4 \key do\major s2
   s2.*79
   s4 \key re\major s2
   s2.*64
   \bar"|."

}

ds = {
   \global
   %\notypeset
   <<\dsn \forma>>

}

bc = {
   \global
   \clef bass
   <<\bcn \forma \bfn>>
   \typeset

}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion: 2.18.0
%}
#(set-global-staff-size 18)


\pointAndClickOff

\paper  {

    systems-per-page = #6
    print-first-page-number = ##t
    first-page-number = #2

}

    \header {
        subtitle = \markup {Sonata V ”Chaconne”}
        composer = \markup\smaller \center-column{"N. Clérambault (1686-1768)"}
    }

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major\time 3/2\numericTimeSignature  \override Staff.TimeSignature.style = #'single-digit r4 fad'' re''^\markup \center-align"[Dessus]"}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \ds
            >>

            \new Staff \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basse""continue]"}
                \bc
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

    %\pageBreak


