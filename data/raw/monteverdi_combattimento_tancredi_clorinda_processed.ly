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

st = \staccatissimo

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



vlIn = \relative do'' {

    R1*9
    la4 sol fa sol
    la sol fa sol

    %12
    la sol fa sol
    la r r2
    R1*4

    %18  3/2
    r1 r re,
    re\breve re1
    re\breve re1

    %21
    re\breve re1
    re\breve re1
    re\breve re1

    %24
    re1 re2 re1 re2
    re1 re2 re1 re2
    re1 r r

    %27
    r1 re4 re re1 re4 re
    re1 re4 re re1 re4 re
    re1 re4 re re1 re4 re

    %30
    re1 r r
    r1 la'2 fad re la'
    fad re la' fad re re'

    %33
    si sol re' si sol sol'\mbreak
    re4 re re re re2 si sol sol'
    re4 re re re re2 si sol sol'

    %36
    re4 re re re re2 si sol sol'
    sol1 r r

    %38 OOKK 4/4
    R1*20
    sol,2^\markup\italic"passaggio bellicoso grave" sol
    sol la

    %60
    si4 r r2
    sol sol
    sol la

    %63
    si4 r r2
    sol sol
    sol la\mbreak

    %66
    si4 r r2
    sol sol
    sol la

    %69
    si4 r r2
    \repeat unfold 16 {si16}
    \repeat unfold 8 {si16} re2

    %72
    si4 r r2
    sol2. la4
    sib2 sib

    %75
    do do
    re2. fa4
    mib re sol2

    %78
    do,1
    sib
    sib4^\markup\italic"passaggio più ristretto" do re mi

    %81
    fa r r2
    fa,4 sol la si
    do r r2\mbreak

    %84
    do4 re mi fad
    sol r r2
    re4 do8 sib la2

    %87
    sol4 r r2
    R1*18
    sib4^\markup\italic"passaggio ristretto" do re mi

    %107
    fa r r2
    fa,4 sol la si
    do r r2

    %110
    do4 re mi fad
    sol r r2
    re4 do8 sib la2

    %113
    sol r\mbreak
    R1*19\break

    %133 % 3/2  OOKK  Non schivar
    R\breve.
    sol1 r r
    sol r r

    %136
    si r re
    si2 r r1 re
    si2 r r1 r

    %139 4/4
    re4 r mi r\mbreak
    re4 r do r
    si r do r

    %142
    re r mi r
    re r do r
    si r sol4. sol8

    %145
    sol4 sol8 sol sol2
    re re
    R1

    %148
    r8 re' si4\mbreak r8 si re4
    r8 re si4 r8 sol' re4
    r8 si re4 r8 re si4

    %151
    r8 sol' re4 r8 re si4
    sol8. sol16 si8. si16 re8. re16 sol8. sol16\mbreak
    re8. re16 si8. si16 re8. re16 sol8. sol16

    %154
    re8. re16 si8. si16 re8. re16 si8. si16
    re2 r
    si8 la sol la si la sol la\mbreak

    %157
    si re si re si re si re
    si fad' sol fad sol fad sol fad
    sol8 fad16 mi re do si la sol2\mbreak

    %160
    sol'8 fad16 mi re do si la sol8 la16 si do re mi fad
    sol8 fad16 mi re do si la sol8 la16 si do re mi fad\mbreak
    sol4 sol2 fad4

    %163
    sol,16 \repeat unfold 15 {sol}
    sol2 r2
    \repeat unfold 16 {si16}

    %166
    si2 r2
    \repeat unfold 16 {re16}
    re4 r r2

    %169
    r r8 sol sol4\mbreak
    re4 r r8 sol sol4
    si,16\p \repeat unfold 15 {si}

    %172
    re16\f \repeat unfold 15 {re}
    sol16 \repeat unfold 15 {sol}
    \repeat unfold 16 {re}

    %175
    si4 ^\markup\italic\column{"qui si lascia l'arco, e si strappano"\vspace#-0.3"le corde con duoi diti"} r si r
    re r re r

    %177 3/2
    sol1 re sol
    re sol re\mbreak
    sol re sol

    %180
    re\breve r1

    %181 4/4
    si4 r r2
    R1
    r4 re2^\markup\italic"qui si ripiglia l'arco" mi4~

    %184
    mi4 re2 mi4~
    mi re2 <<
        {
            mi4~
            mi2 mi

            %187
            re r
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"sopra" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"voice oohs"
            \key do\major\clef violin \autoBeamOff <<
                {
                    mi4~^\markup\italic "parti separate di Viole"
                    mi r r2
                    R1
                }\\{
                    \stemUp\shiftOn \tieDown sol,4~
                    sol s s2
                    s1
                }\\{
                    \stemDown \tieDown mi4~
                    mi s s2
                    s1
                }
            >>
        }
    >>

    R1*2
    sol'4 mi fa re

    %191
    mi do re si
    do la si sol\mbreak
    R1

    %194
    r4 sol'2 fa4~
    fa mi2 re4~
    re do2 si4~

    %197
    si la sol sol
    sol2 fad
    \repeat unfold 16 {si16}\mbreak

    %200
    \repeat unfold 16 {re16}
    \repeat unfold 16 {sol16}\mbreak
    \repeat unfold 8 {sol16} re2

    %203
    re4 sib sib sib
    sib2 r
    re4 sib sib sib

    %206
    sib2 r
    sib4 sol sol sol
    sol2 r\mbreak

    %209
    sib4 sol sol sol
    sol2 r
    sol4 re re re

    %212
    re2 r
    R1*15
    R1*71

    %299 OOKK Guerra
    si'16 \repeat unfold 15 {si16}
    si2 r
    \repeat unfold 16 {si16}
    si2 r

    %303 3/2
    si2 sol sol' re4 re re re re2
    si sol\mbreak sol' re4 re re re re2
    si sol sol' re4 re re re re2
    si4 si si si si2 re4 re re re re2
    si4 si si si si2 re4 re re re re2

    %308 4/4 OOKK
    \repeat unfold 16 {si16}
    sol16\p\repeat unfold 15 {sol}
    si16\f \repeat unfold 15 {si16}

    %311
    re\repeat unfold 15 {re16}
    re8 [sol] sol4 re8 [re] re4
    si8 [sol'] sol4 re8 [re] re4\mbreak

    %314
    si8 [sol'] sol4 re8 [re] re4
    \repeat unfold 16 {si16}
    la2 sol4 r
    R1*48

    %365 si bemolle OOKK
    sib1
    \footnote #' (-1 . 3) \markup\column\smaller {"Così fino alla fine nelle parti separata"} sib2^\f^\markup\italic "arcata sola"~sib^\p
    R1

    %368
    sol2^\f^\markup\italic "arcata sola"~sol^\p\mbreak
    R1
    do2^\f^\markup\italic "arcata sola"~do^\p

    %371
    R1
    la
    r2 mi

    %374
    R1
    fad
    R

    %377
    sol2\f^\markup\italic "arcata sola"~sol\p
    R1
    sol2\f^\markup\italic "arcata sola"~sol\p

    %380
    R1
    do2\f^\markup\italic "arcata sola"~do\p
    R1

    %383
    la2\f^\markup\italic "arcata sola"~la\p
    R1*55
    r2 sold~^\markup\italic"soave arcate"

    %440
    sold la
    si r4 do
    re2 re

    %443
    r sib
    la1
    la\breve^\markup\italic\column\center-align{"questa ultima nota"\vspace #-0.3"va in arcata morendo"}

}

vlIIn = \relative do' {

    R1*9
    fa4 mi re mi
    fa mi re mi

    %12
    fa mi re mi
    fa r r2
    R1*4

    %18 OOKK 3/2
    r1 r la,
    la\breve la1
    la\breve la1

    %21
    la\breve la1
    la\breve la1
    la\breve la1

    %24
    la1 la2 la1 la2
    la1 la2 la1 la2
    la1 r r

    %27
    r la4 la la1 la4 la
    la1 la4 la la1 la4 la
    la1 la4 la la1 la4 la

    %30
    la1 r r
    r1 fad'2 re la fad'
    re la fad' re la la'

    %33
    sol re si' sol re re'
    si4 si si si si2 sol re re'
    si4 si si si si2 sol re re'

    %36
    si4 si si si si2 sol re re'
    re1 r r

    %38 OOKK 4/4
    R1*20
    re,2 re
    re fad

    %60
    sol4 r r2
    re2 re
    re fad

    %63
    sol4 r r2
    re2 re
    re fad\mbreak

    %66
    sol4 r r2
    re2 re
    re fad

    %69
    sol4 r r2
    \repeat unfold 16 {sol16}
    \repeat unfold 8 {sol16} sol4. fad8

    %72
    sol4 r r2
    sib2. la4
    sol2 sib

    %75
    sib la
    sib2. do4
    sib la sib2

    %78
    sib la
    sib1
    fa4 la si do

    %81
    do r r2
    do,4 mi fad sol
    sol r r2\mbreak

    %84
    sol4 sib do re
    re r r2
    sib4 la8 sol sol4 fad

    %87
    sol r r2
    R1*18
    fa4 la si do

    %107
    do r r2
    do,4 mi fad sol
    sol4 r r2

    %110
    sol4 sib do re
    re r r2
    sib4 sol sol fad

    %113
    sol2 r\mbreak
    R1*19

    %133 OOKK 3/2
    R\breve.
    re1 r r
    re r r

    %136
    sol r la
    sol2 r r1 la
    sol2 r r1 r

    %139 4/4
    si4 r sol r
    si r sol r\mbreak
    si r sol r

    %142
    si r sol r
    si r sol r
    sol r re4. re8

    %145
    re4 re8 re re2
    la si
    R1

    %148
    si'4 r8 si re4 r8 si
    sol4 r8 re'\mbreak si4 r8 sol'
    re4 r8 re si4 r8 re

    %151
    si4 r8 si sol2
    re8. re16 sol8. sol16 si8. si16 re8. re16
    sol8. sol16 re8. re16 si8. si16 re8. re16\mbreak

    %154
    sol8. sol16 re8. re16 si8. si16 re8. re16
    si2 r
    sol8 la si la sol la si la

    %157
    sol fad sol fad sol fad sol fad\mbreak
    si la sol la si la sol  la
    si la16 sol  fad?  mi re do si2

    %160
    si'8 la16 sol  fad?  mi re do si8 do16 re mi fad sol la\mbreak
    si8 la16 sol fad? mi re do si8 do16 re mi fad sol la
    si4. do8 re2

    %163
    re,16 \repeat unfold 15 {re}
    re2 r
    \repeat unfold 16 {sol16}

    %166
    sol2 r
    \repeat unfold 16 {si16}
    si4 r r2

    %169
    r8 sol' sol4 re r
    r8 sol sol4 re r\mbreak
    sol,16\p  \repeat unfold 15 {sol16}

    %172
    si16\f  \repeat unfold 15 {si16}\mbreak
    \repeat unfold 16 {re16}
    \repeat unfold 16 {si16}

    %175
    sol4 r sol r
    si r si r

    %177 3/2
    si1 sol si
    sol si sol
    si sol sol

    %180
    fad\breve r1

    %181 4/4
    sol4 r r2
    R1\mbreak
    r4 si2 sol4~

    %184
    sol si2 sol4~
    sol si2 sol4~
    sol do4 do2

    %187
    si r
    R1*2
    r4 do la si

    %191
    sol la fa sol
    mi fa re mi\mbreak
    R1

    %194
    r2 r4 re'~
    re do2 si4~
    si la2 sol4~

    %197
    sol fa mi re
    re1
    \repeat unfold 16 {sol16}\mbreak

    %200
    \repeat unfold 16 {si16}
    \repeat unfold 16 {re16}\mbreak
    \repeat unfold 8 {re16} sib2

    %203
    sib4 sol sol sol
    sol2 r
    sib4 sol sol sol

    %206
    sol2 r\mbreak
    sol4 re re re
    re2 r

    %209
    sol4 re re re
    re2 r
    re4 sib sib sib

    %212
    sib2 r\mbreak
    R1*15
    R1*71

    %299 OOKK Guerra
    sol'16\repeat unfold 15 {sol16}
    sol2 r\mbreak
    sol16\repeat unfold 15 {sol16}
    sol2 r

    %303 3/2 OOKK
    <<
        {
            sol2 re re' si4 si si si sol2
            sol2 fa re' si4 si si si si2
            sol2 fa re' si4 si si si si2
            sol4 sol sol sol sol2 si4 si si si si2
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"alto" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"voice oohs"
            \key do\major\clef violin \autoBeamOff sol2^\markup\italic "Viola Alto: così nella parte separata" re re' si sol sol'
            re4 re re re re2 si sol sol'
            re4 re re re re2 si sol sol'
            re4 re re re re2 si4 si si si si2
        }
    >>

    sol4 sol sol sol sol2 fad4 fad fad fad fad2

    %308 4/4 OOKK
    sol16\repeat unfold 15 {sol16}
    re16\p\repeat unfold 15 {re16}
    sol16\f\repeat unfold 15 {sol16}

    %311
    si16\repeat unfold 15 {si16}
    si8 re re4 si8 sol' sol4
    re8 re re4 si8 sol' sol4

    %314
    re8 re re4 si8 sol' sol4
    re16\repeat unfold 15 {re16}
    re2 si4 r

    %317
    R1*48

    %365 si bemolle OOKK
    sol1
    \footnote #' (-1 . 3) \markup\column\smaller {"Così fino alla fine nella parte separata"} re2\f^\markup\italic "arcata sola"~re\p
    R1

    %368
    re2\f^\markup\italic "arcata sola"~re\p\mbreak
    R1
    sol2\f^\markup\italic "arcata sola"~sol\p

    %371
    R1
    mi
    r2 dod

    %374
    R1
    re
    R

    %377
    re2~\f^\markup\italic "arcata sola"re\p
    R1
    re2~\f^\markup\italic "arcata sola"re\p

    %380
    R1
    sol2\f^\markup\italic "arcata sola"~sol\p
    R1

    %383
    mi2\f^\markup\italic "arcata sola"~mi\p
    R1*55
    r2 mi~

    %440
    mi mi
    sol r4 sol
    sib2 fa

    %443
    r sol
    mi1
    re\breve\p

}

vlan = \relative do' {

    R1*9
    fa,4 sol la sol
    fa sol la sol

    %12
    fa sol la sol
    fa r r2
    R1*4

    %18 OOKK 3/2
    r1 r fad1
    fad\breve fad1
    fad\breve fad1

    %21
    fad\breve fad1
    fad\breve fad1
    fad\breve fad1

    %24
    fad1 fad2 fad1 fad2
    fad1 fad2 fad1 fad2
    fad1 r r

    %27
    r1 fad4 fad fad1 fad4 fad\mbreak
    fad1 fad4 fad fad1 fad4 fad
    fad1 fad4 fad fad1 fad4 fad

    %30
    fad1 r r
    r1 re'2 la fad re'
    la fad re' la fad fad'

    %33
    re si \parenthesize sol' re si sol'\mbreak
    \clef alto sol4 sol sol sol sol2 re si si'
    sol4 sol sol sol sol2 re si si'

    %36
    sol4 sol sol sol sol2 re si si'
    si1 r r

    %38 OOKK 4/4
    R1*20
    si,2 si
    si re

    %60
    re4 r r2
    si2 si
    si re

    %63
    re4 r r2
    si2 si
    si re

    %66
    re4 r r2
    si2 si
    si re

    %69
    re4 r r2
    \repeat unfold 16 {re16}
    \repeat unfold 8 {re16}\mbreak re2

    %72
    re4 r r2
    re2. re4
    sol2 fa

    %75
    sol fa
    fa2. fa4
    sol la sol2

    %78
    fa1
    fa
    re4 mi sol sol

    %81
    la r r2
    la,4 dod8 si re4 re
    mi r r2\mbreak

    %84
    mi4 fa la la
    sol r r2
    re4 mib re2

    %87
    re4 r r2
    R1*18
    re4 mi sol sol

    %107
    la r r2
    la,4 dod8 si re4 re
    mi r r2

    %110
    mi4 fa la la
    sol r r2
    re4 mib re2

    %113
    re r\mbreak
    R1*19

    %133 OOKK 3/2
    R\breve.
    si1 r r
    si r r

    %136
    re r fad
    sol2 r r1 fad\mbreak
    sol2 r r1 r

    %139 4/4
    sol4 r mi r
    sol r mi r
    sol r mi r

    %142
    sol r mi r
    sol r mi r\mbreak
    re4 r re4. si8

    %145
    si4 si8 si si2
    la sol
    R1

    %148
    r8 sol' sol,4 r8 sol' re4
    r8 si sol4 r8 re' si4\mbreak
    r8 re si4 r8 re sol4

    %151
    r8 re si4 r8 si re4
    si8. si16 re8. re16 sol8. sol16 si8. si16
    si,8. si16 re8. re16\mbreak sol8. sol16 re8. re16

    %154
    si8. si16 re8. re16 sol8. sol16 re8. re16
    sol2 r
    sol,8 fad sol fad sol fad sol fad\mbreak

    %157
    sol la si la sol la si la
    sol re' si re si re si re
    si2 si'8 la16 sol fad  mi re do\mbreak

    %160
    si2 si'8 la16 sol fad  mi re do
    si8 do16 re  mi fad sol la si8 la16 sol fad  mi re do
    re2 re\mbreak

    %163
    \repeat unfold 16 {si16}
    si2 r
    \repeat unfold 16 {re16}

    %166
    re2 r
    \repeat unfold 16 {sol16}
    sol4 r r2

    %169
    re16  \repeat unfold 15 {re16}
    sol16 \repeat unfold 15 {sol16}
    re16\p  \repeat unfold 15 {re16}

    %172
    sol16\f \repeat unfold 15 {sol16}
    \repeat unfold 16 {si16}
    \repeat unfold 16 {sol16}

    %175
    re4 r re r
    sol r sol r
    si,1 re si

    %178
    re si re
    si re re\mbreak
    re\breve r1

    %181 4/4
    re4 r r2
    R1
    r4 sol2 mi4~

    %184
    mi sol2 mi4~
    mi sol2 mi4~
    mi2 mi

    %187
    sol r
    R1
    sol4 mi fa re\mbreak

    %190
    mi do re si
    do la si sol
    la fa sol mi

    %193
    R1*2
    r2 sol'
    fa mi

    %197
    re si
    la1
    \repeat unfold 16 {re16}

    %200
    \repeat unfold 16 {sol16}
    \repeat unfold 16 {si16}
    \repeat unfold 8 {si16} sol2\mbreak

    %203
    sol4 re re re
    re2 r
    sol4 re re re

    %206
    re2 r
    re4 sib sib sib
    sib2 r\mbreak

    %209
    re4 sib sib sib
    sib2 r
    sib4 sol sol sol

    %212
    sol2 r
    R1*15
    R1*71

    %299 OOKK Guerra
    re'16 \repeat unfold 15 {re}
    re2 r
    re16 \repeat unfold 15 {re}
    re2 r

    %303 OOKK 3/2
    re2 si si' sol4 sol sol sol sol2
    re2 si si' sol4 sol sol sol sol2
    re2 si si' sol4 sol sol sol sol2
    re4 re re re re2 sol4 sol sol sol sol2
    re4 re re re re2 re4 re re re re2

    %308 4/4 OOKK
    re16\repeat unfold 15 {re}
    si16\p \repeat unfold 15 {si}
    re16\f \repeat unfold 15 {re}

    %311
    sol16\repeat unfold 15 {sol}
    re16\repeat unfold 15 {re}
    si16\p \repeat unfold 15 {si}

    %314
    re16\repeat unfold 15 {re}
    sol16\repeat unfold 15 {sol}
    fad2 sol4 r

    %317
    R1*48

    %365 si bemolle OOKK
    re1
    \footnote #' (-1 . 3) \markup\column\smaller {"Così fino alla fine nella parte separata"} sol,2\f^\markup\italic "arcata sola"~sol\p
    R1

    %368
    sol2\f^\markup\italic "arcata sola"~sol\p\mbreak
    R1
    mib'2\f^\markup\italic "arcata sola"~mib\p

    %371
    R1
    dod
    r2 la

    %374
    R1
    la
    R

    %377
    sib2~\f^\markup\italic "arcata sola"sib\p
    R1
    sol2~\f^\markup\italic "arcata sola"sol\p

    %380
    R1
    mib'2\f^\markup\italic "arcata sola"~mib\p
    R1

    %383
    la,2\f^\markup\italic "arcata sola"~la\p
    R1*55
    r2 si~

    %440
    si la
    re r4 do
    fa2 sib,

    %443
    r re
    la1
    la\breve\p

}

clorindan = \relative do'' {

    \autoBeamOff
    R1*17
    R\breve.*20
    R1*2

    %40
    r4^\markup\italic "Clorinda" re si r8 mi
    do4 la8 la la4. la8
    re2 r

    %43
    R1*2
    re8^\markup\italic "Clorinda" re re re\mbreak si4 r
    r8 si si16 si si si si8. si16 si8 si16 la

    %47
    si8 si16 re sol,8. la16 la2
    sol r
    R1*84

    %133 OOKK
    R\breve.*6
    R1*38
    R\breve.*4

    %181 OOKK
    R1*104
    r8^\markup\italic "Clorinda" la re8. do16 re4 re8 re
    re8. re16 re4. re8 re re\mbreak

    %287
    la4. sol8 si4 si
    r4 si8 si re4 re8 do
    re4 r r8 mi do8. si16

    %290
    do4 do8 do16 do la4~la16 do do re\mbreak
    re4. do8 do do r4
    R1*11

    %303
    R\breve.*5
    R1*57
    r2^\markup\italic "Clorinda sola in 4 Viole" r4 re

    %366
    sib2 sib
    r2 r4 re
    sol,2 sol\mbreak

    %369
    r4 re' re re
    mib1
    r4 sib sib sib8 la

    %372
    la2 la
    r8 mi'? mi8. la,16 la2
    r4 la la4. mi8

    %375
    fad4 fad r2
    r4 la la4. sib8
    sib1

    %378
    r4 re2 sol,8 fad\mbreak
    sol4 sol r2
    r4 re' re8 re16 re re8. re16

    %381
    \footnote #' (-1 . 2) \markup\column\smaller {"Così nella partitura""  "} mib2 r
    r8 sib sib sib sib4. la8
    la2 la

    %384 OOKK
    R1*55
    r2^\markup\italic "Clorinda sola in  4 Viole" si~
    si do

    %441
    re r4 mi
    fa2 re
    r re

    %444
    re^\markup\italic"lunga voce in piano"~re8 [mi16 fad] re4~
    re\breve

}

testoI = \lyricmode {

    O tu, che por -- te, cor -- ren -- do sì?

    Guer -- ra e mort'ha -- vrai

    io non ri -- fiuto _  dar -- lati _ se lei cer -- chi e fer -- mo_at -- ten -- de.

    In -- dar -- no chie -- di quel c'ho per u -- so di non far pa -- le -- se.

    Ma chi -- un -- que_io mi sia, tu_in -- nan -- zi ve -- di_un di quei duo che la gran tor -- re_ac -- ce -- se.

    A -- mi -- co, hai vin -- to: io ti per -- don... per -- do -- na

    tu_an -- co -- ra, al cor -- po no, che nul -- la pa -- ve,

    a l'al -- ma sì: deh! per lei pre -- ga, e do -- na

    bat -- tes -- mo_a me ch'o -- gni mia col -- pa la -- ve.

    S'a -- pre_il ciel: io va -- do in pa -- ce.

}

tancredin = \relative do' {

    \autoBeamOff
    R1*17
    R\breve.*20
    R1*5

    %43
    r8^\markup\italic "Tancredi" sol do do r4 r8 fa,
    sol4 fa r2
    R1*88

    %133 3/2 OOKK
    R\breve.*6
    R1*38
    R\breve.*4
    R1*82

    %263 OOKK
    la4^\markup\italic "Tancredi" la8 la la4. sol8
    la2~la8 la la \footnote #' (-1 . 3) \markup\column\smaller {"Così nella partitura"} sol
    la4 la la la8 la

    %266
    sib2~sib8 sib sib sib\mbreak
    sib?4. la8 la4 la
    <<
        {
            r la do4. do8

            %269
            do8. do16 do4 do  do8 sib?
            do4 do8 re sib4~sib16 sib sib la\mbreak
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"tancredi" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"voice oohs"
            \key do\major\clef "treble_8" \autoBeamOff r4 ^\markup\italic "Così nella partitura" la do4. la8
            la8. la16 la4 la la8 sol
            la4 la8 la sib4 sib16 sib sib la
        }
    >>

    do4 la8 la16 sol sol4 sol

    %272
    sold4. sold8 sold2
    r4 si8 si mi,4. mi8
    mi4. re8 mi4 mi\mbreak

    %275
    r4 mi8 mi mi4 mi8 fad
    sold4 sold8 sold la4 la
    la4. sold8 (la2)

    %278
    r8 mi la mi fad4 fad8 la\mbreak
    fad4~fad16 fad fad mi sol4 sol
    sol4 fa?8 fa fa4 fa

    %281
    r8 fa fa mi mi4 fa
    mi1
    re2 r

    %284 OOKK comincia Testo poi Clorinda
    R1*10
    r4^\markup\italic "Tancredi" la'8 la re4 re8 re
    mi4 mi r mi8 mi

    %296
    mi4 mi8 mi mi8. mi16 mi8. fad16
    re4 re\mbreak re la16 la la la
    <<
        {si8. re16 re8. dod16 re4 re}

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"tancredi" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"voice oohs"
            \key do\major\clef "treble_8" \autoBeamOff si4 ~^\markup\italic "Così nella partitura" si16 re re dod re4 re
        }
    >>

    %299 OOKK
    R1*4
    R\breve. *5
    R1*137

    %445
    r\breve

}

testoII = \lyricmode {

    E guer -- ra e mor -- te.

    No -- stra sven -- tu -- ra_è ben che qui s'im -- pie -- ghi

    tan -- to va -- lor, do -- ve si -- len -- zio_il co -- pra.

    Ma poi che sor -- te ria vien che ci nie -- ghi

    e lo -- de_e te -- sti -- mon de -- gni de l'o -- pra,

    pre -- go -- ti se fra l'ar -- mi_han lo -- co_i prie -- ghi

    che'l tuo no -- me_e'l tuo sta -- to a me tu sco -- pra,

    ac -- ciò ch'io sap -- pia, o vin -- to_o vinci - to -- re,

    chi la mia mor -- te o la mia vi -- ta_ho -- no -- re.

    E_in mal pun -- to_il di -- ce -- sti;  e'l tuo dir e'l ta -- cer di par m'al -- let -- ta,

    bar -- baro _ di -- scor -- te -- se,_a la ven -- det -- ta.

}

teston = \relative do' {

    \autoBeamOff
    R1
    r4 la la2
    la r4 la8 la

    %4
    la4. la8 la4. la8
    la2 la
    la4. la8 la4 la8 sol

    %7
    sol4 sol r8 fa fa mi
    mi1\mbreak
    re

    %10
    R1*2
    la'4 la la la8 la
    la4 la la si

    %14
    do2 do4 si
    re do si2
    la r8 la la sol

    %17
    sol4. fa8 mi2\mbreak

    %18 OOKK inizia 3/2
    re\breve r1
    R\breve.*7
    fad1 fad2 fad fad sol

    %27
    la la r1 r\mbreak
    R\breve.*2
    la2 la la la la sol

    %31
    la la r1 r
    R\breve.*2\mbreak
    r1 si2 si1 si2

    %35
    si1 sol2 si1 re2
    si sol re' si sol re'
    si sol sol si1 re2

    %38 OOKK Inizia 4/4
    sol,8 sol sol2 sol8 sol\mbreak
    sol4. fad8 la4 la
    R1*2

    %42
    r4^\markup\italic "Testo" sol mi mi
    R1*2
    r2\mbreak r4 sol8^\markup\italic "Testo" sol

    %46
    R1*3
    r4^\markup\italic "Testo" sol sol4. sol8
    sol2 sol4 mi16 mi mi mi\mbreak

    %51
    mi4~ mi16 mi mi re mi4 mi8 mi
    sol4. fa8 fa4 fa
    r mi re2

    %54
    do r4 do
    sol'8 sol16 sol sol4~ sol16 sol sol la si8 si
    r4 sol8 sol\mbreak si8 si16 si re8. re16

    %57
    re4. do8 re4 re
    R1*5
    r8 si si si si4 si

    %64
    R1*2\mbreak
    r8 si si si si4. la8
    si4 si r2

    %68
    R1
    sol4. sol8 si4 si8 re
    si4 si r r8 re

    %71
    sol,4. la8\mbreak la2
    sol4 r r2

    %73 % sol minore OOKK
    R1*15
    sol2^\markup\italic "Testo" sol
    r4 sol sol sol

    %90
    sol8. sol16 sol8 sol sib2
    la sib
    do4 la re2~

    %93
    re dod
    re\mbreak r8 re re re
    mib4 fa2 sib,8. do16

    %96
    do1
    sib
    re4 sib8 sib sib4. la8

    %99
    do2 do4 do8 re
    mib4 mib8 re re2
    do2 sol4 sol8 la\mbreak

    %102
    sib2. la4
    do2 sib
    la1

    %105
    sol
    R1*8
    sib2.^\markup\italic "Testo" sib4

    %115
    sib sib8 sol sib2
    la1
    r2 sib

    %118
    do4 la re2~
    re dod
    re r4 re

    %121
    re fa mib4. re8
    re4. do8 mib4. re16 [do]
    sib4~sib16 [fa sol la]\mbreak sib [do re mib?] fa8 sib,

    %124
    do1
    sib2 re4 sib8 sib
    sib4. la8 do4. do8

    %127
    mib4 mib re2
    do do4 sol8 sol
    sib4. la8 la2

    %130
    <<
        {
            re,16[mi fa sol] la[sib do re]~\mbreak re4 mib?16[re mib fa]
            sol2 sib,4. la8
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"tasso" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"voice oohs"
            \key fa\major\clef "treble_8" re,16^\markup\italic "Così nella parte separata di Testo" [mi fa sol] la[sib do re] re16.[mib32 re16. mib32] re16.[mib32 re16. mib32]
            re32[re re re re re re re] re8[mib?32 re mib fa] sol4 sib,8.\noBeam la16
        }
    >>

    la1\tr

    %133 3/2 OOKK
    sol1 r r
    r2 sol4 fad sol1 r
    r2 sol4 fad sol1 r

    %136
    r4 sol sol sol sol2. sol4  la2 la4 la\mbreak
    si1 r4 re si la la2. sol4
    sol2 sol r1 r

    %139 4/4
    r4 si r do
    r re r mi
    r re r do

    %142
    r si r do
    r re r mi
    r re si4. sol8\mbreak

    %145
    re4 re8 re re2
    re4 re8 re re4 re
    re' re8 re re2

    %148
    re r
    re4. re8 re4 re8 re
    re4 re r2\mbreak

    %151
    r8 re re re re4. re8
    re4 re8 re re4. re8
    si4 si8 si si4 si8 si16 si

    %154
    sol2 sol
    re'4 re8 re re2\mbreak
    re1

    %157
    r4 re re re
    re re re2
    re r4 re\mbreak

    %160
    re re re re
    re2 r4 re
    si4. la8 la2

    %163
    sol\mbreak  r
    sol8 sol16 sol sol sol sol sol sol sol sol sol sol sol sol fad?
    sol8 sol r4 r2\mbreak

    %166
    r16 sol sol sol sol sol sol sol sol sol sol sol sol sol sol la
    si8 si r4 r2
    si4 si16 si si si\mbreak si si si si si si si la

    %169
    si8 si r4 r2
    r8 si16 si si8 si16 si do8. do16 do8. re16
    si8 si\mbreak r4 r2

    %172
    re8. re16 re8 re16 re re4 re16 re re re
    re4 re16 re re re si4 si8 si\mbreak
    <<
        {si4. la8 la4. sol8}

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"tasso" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"voice oohs"
            \key do\major\clef "treble_8" si2~^\markup\italic "Così nella parte separata di Testo" si8 la la8. sol16
        }
    >>

    %175
    sol8 sol si si r la si si
    r16 si si la si8 si r8 la si si

    %177 3/2
    re1 si re
    si re si
    re si si
    la\breve r1

    %181 4/4
    sol4 r r sol
    sol2~sol8 sol sol sol
    sol2 sol

    %184
    sol sol
    sol sol~
    sol8 sol sol sol\mbreak sol4. la8

    %187
    si4 si r8 si si si
    si4. do8 re2
    r4 mi4. re8 re4~

    %190
    re8 do do4. si8 si4~
    si la2 sol4~
    sol fa2 mi4~

    %193
    mi8 mi fad4 sol sol\mbreak
    sol2 sol
    sol sol

    %196
    sol sol
    sol sol4 sol
    la1

    %199
    sol2 sol8 sol16 fad? sol8 sol
    r2\mbreak si8 si16 la si8 si
    <<
        {re8 re16 do re4 re16 re re re re8. do16}

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"tasso" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"voice oohs"
            \key do\major\clef "treble_8" \autoBeamOff re8^\markup\italic "Così nella parte separata di Testo"re16 re re8 re16 re re re re8. re16
        }
    >>

    %202
    do8 do16 do do8. si16 sib4 sib
    R1*2\mbreak
    r2 r4 sol

    %206
    sol2 sol
    R1*2
    r4 sol sol sol

    %210
    sol2 sol
    r4 sol sol sol
    sol sol sol2~

    %213
    sol4 fa fa mi
    fa2 fa\mbreak
    <<
        {
            r8 fa fa fa fa2

            %216
            fa4 fa8 fa fa2~
            fa r4 mi
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"tasso" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"voice oohs"
            \key do\major\clef "treble_8" \autoBeamOff r8 ^\markup\italic "Così nella parte separata di Testo"fa fa fa fa2~
            fa8 fa fa fa fa2~
            fa r4 mi
        }
    >>

    mi1

    %219
    re
    r4 re re4. dod8
    re2 re

    %222
    r8 re re re re4. dod8
    re2 re4 re\mbreak
    re4~re16 re re re re4 re8 re

    %225
    re2. re4
    re1
    re

    %228 OOKK
    fa8. fa16 fa8 fa16 fa fa8. fa16 fa8. mib16
    mib4 mib16 mib mib mib sol4~sol16 mib mib mib\mbreak
    mib4. do8 fa4 fa

    %231
    r2 fa8 fa16 fa fa4
    fa16 fa fa fa fa8. mi16 fa4 fa16 fa fa sol\mbreak
    la4 la8 do sol8. sol16 sol8. fa16

    %234
    fa4 fa8 fa sol4 sol~
    sol8 sol sol la si4 si8 re(\mbreak
    mi2.) r4

    %237
    la,8 la la8. sold16 sold4 sold8 sold
    sold4 sold16 sold sold sold  la4 la8 la
    la4. sold8 (la2)\mbreak

    %240
    si8. si16 si2 mi8 si
    dod4 dod r8 mi (fad4)
    re8. re16 re8 re re8. re16 re8 re16 re\mbreak

    %243
    re4~re16 dod dod dod dod4. si8
    si4 si r2
    mi8. mi16 mi8 mi16 mi mi2~

    %246
    mi8 si si8. la16 si2\mbreak
    si4 si8 si mi4 si8 si
    do4 do8 do do2~

    %249
    do4(sib8.) la16 la4. sold8
    (la1)
    r8 mi mi mi mi2\mbreak

    %252
    mi8 mi mi mi mi4 mi
    r2 fa~
    fa8 fa fa fa fa4 fa8 fa

    %255
    re4. re8 fa4 fa
    fa2. mi4
    (fa2) r\mbreak

    %258
    sol8 sol16 sol sol8. sol16 sol4. sol8
    mi4 mi8 mi sol4 sol
    r8 re re re re4.\footnote #' (-1 . 3) \markup\column\smaller {"Così nella parte separata"} mi8

    %261
    fad2 fad4 fad8 mi
    sol4 sol r2\mbreak
    R1*20

    %283
    r2^\markup\italic "Testo" r4 re
    fad4~fad16 fad fad fad la4 la
    R1*7

    %292
    sol4^\markup\italic "Testo" sol8 fad sol4~sol16 sol sol sol
    si4. re8 la4 la
    R1*6

    %300
    si8.^\markup\italic "Testo" si16 si8 si16 si si4~ si16 si si la
    si4 si r2
    <<
        {
            si8. si16 si8 si16 si sol8. la16 la8. sol16

            %303 OOKK 3/2
            \footnote #' (-1 . 3) \markup\column\smaller {"Così nella partitura""  "} sol2 sol r1 r
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"tasso" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"voice oohs"
            \key do\major\clef "treble_8" \autoBeamOff sol8.^\markup\italic "Così nella parte separata" sol16 sol8 sol16 sol sol8. si16 re8. re16
            si2 si r1 r
        }
    >>

    r si2 si1 si2\mbreak
    si2. si4 si si si1 la2

    %306
    si1 si2 r si si\mbreak
    si2. si4 si2 si2. la4 la sol

    %308 OOKK 4/4
    sol4 sol r2\mbreak
    R1
    si8 si16 do re4~re16 re re re re8. do16

    %311
    re8 re16 re\mbreak re re re16. do32 do8. do16 do8. si16
    si4 si8 si si4~si16 la la sol
    si4 si r2\mbreak

    %314
    r16 si si si sol8 sol16 fad sol4 sol
    sol8. sol16 sol8. sol16 sol4. la8
    la2 si4 r

    %317
    r2 r4 fad
    fad4. fad8 fad2\mbreak
    fad4 fad8 fad fad4. mi8

    %320
    fad2 fad4 fad
    fad2~fad8 fad fad fad
    fad4. fad8 fad4. sol8

    %323
    mi2 mi
    mi4 si'8 la si4~si16 si si si\mbreak
    si4. la8 si4 si16 dod dod si

    %326
    dod4 dod8 dod dod4 dod~
    dod8 dod dod4 re re
    r4 re8 la la4 la8 la

    %329
    la2 la4 la8 sol
    la2 la4 la8 la\mbreak
    la4 la8 la la4 la~

    %332
    la8 la la4 sol sol
    si si8 dod red4. dod8
    mi4 mi r si~

    %335
    si4 si8 si si4 la8 la
    la4 sol r fad
    fa!4. fa8 fa2\mbreak

    %338
    mi4 r mi mi8 mi
    mi2. (red4)
    mi1

    %341
    sol4 sol16 sol sol la si8 si r4
    r16 si si si si8. si16 si8. si16 si8 si16 si
    do8. do16 do8. si16\mbreak re8 re r4

    %344
    r2 sol,~
    sol4 sol sol  sol8 sol
    fa4 fa r fa

    %347
    fa4. fa8 fa4 fa8 mi
    fa4 fa re2
    re4 re8 re re4. re8

    %350
    mi2 mi4 fad
    sold sold\mbreak r la
    si si8 si do4 do8 si

    %353
    re4 la la4. (sold8)
    la1
    la4 la8 sol la2~

    %356
    la8 mi mi mi la4. mi8
    fad4 fad r la
    fad4. fad8 fad4. mi8

    %359
    sol2 sol
    r8 sol sol sol sol4 sol8 sol
    sol4. la8 fa?2

    %362
    r8 fa fa fa fa4. mi8
    mi1
    re

    %365 inizia Clorinda e poi testo
    R1*19
    r8^\markup\italic "Testo" sol sol sol sol4. fad?8
    sol4. sol8 sol4 r8 sol\mbreak

    %386
    sol4 sol8 sol sol sol sol sol
    mib4. mib8 mib4 re
    mib4 mib8 mib mib4. re8

    %389
    re4 re16 re re re re4. do8
    re4 re r re\mbreak
    re2~re8 re re re

    %392
    re4. re8 re4 re
    re2 (dod)
    re1

    %395
    mi8. mi16 mi8 mi16 mi mi8. mi16 mi8. re16
    mi4 mi8 mi16 mi mi8 mi16 mi mi8. fa16\mbreak
    fa4. mi8 fa4 fa

    %398
    la4. fa16 mi sol4 sol8 sol
    sol4~sol16 sol sol la si8 si r4
    r sib4 sib la

    %401
    la2 la4 la
    la4. sol8 sol4. sol8
    mi2 mi\mbreak

    %404
    r4 mi mi2~
    mi4 mi mi mi
    mi2 mi4 mi8 mi

    %407
    mi4 mi8 mi mi mi mi mi
    mi2 re4 re
    r re8 do mi4 mi8 mi

    %410
    sol sol16 \footnote #' (-0.5 . 3) \markup\column\smaller {"Così nella partitura""  "} sol si8 si\mbreak r16 do do si re8 re
    R1
    r4 re, re re

    %413
    re2 re
    r4 re re re
    r re re re

    %416
    R1
    re'2 fad,4 fad
    R1

    %419
    mi'4 r8 la,16 la la4. sold8(
    la2) r8 mi mi mi
    fa2 r8 fa fa fa

    %422
    fa8. fa16 fa8 fa fa4 fa8 fa
    re4 re8 re fa8. fa16 fa8. sol16
    sol2 fa

    %425
    r4 fa8 fa fa4 fa8 mi\mbreak
    sol4 sol8 sol sol4. sold8
    la4 la la si8 dod

    %428
    re4 re16 re mi fa sold,4 la
    la sold (la2)
    mi4 mi8 mi mi4. mi8

    %431
    mi2 mi
    mi mi\mbreak
    fa2 fa8 fa sol8. la16

    %434
    sib4~sib16 sib sib la do4. fa,8
    fa8. [sol32 la] sol4 fa2
    r4 fa fa~fa16 fa fa fa

    %437
    fa4 fa8 fa16 mi sol4 sol\mbreak
    la4. la8 si4 si
    R1*6

    %445
    r\breve

}

testoIII = \lyricmode {

    Tan -- cre -- di che Clo -- rinda_un _ ho -- mo sti -- ma vol ne l'ar -- mi pro -- varla _ al para - go -- ne.

    Va gi -- rando _ co -- lei l'al -- pe -- stre ci -- ma ver altra _ por -- ta, o -- ve d'en -- trar di -- spo -- ne.

    Se -- gue egli im -- pe -- tuo -- so, on -- de_as -- sai pri -- ma che giun -- ga,

    in gui -- sa_a -- vien che d'ar -- mi suo -- ne  che d'ar -- mi che d'ar -- mi che d'ar -- mi suo -- ne

    ch'el -- la si volge_e _ gri -- da:

    Ri -- spose: _ dis -- se:

    Ne vol Tan -- cre -- di, ch'eb -- be_a piè ve -- duto_il _ suo ne -- mi -- co, u -- sar ca -- vallo, _ e scen -- de

    e_im -- pugna _ l'un, l'al -- tro_il ferro_a - cu -- to, et a -- guz -- za l'or -- goglio_e _ l'i -- ra_ac -- cen -- de;

    e van-- si_in -- con-- tro a pas -- si tardi_e _ len -- ti quai due to -- ri ge -- lo -- si e d'i -- ra_ar -- den -- ti.

    Not -- te, che nel pro -- fondo_o - scu -- ro se -- no chiu -- de - - - sti e nell' o -- blio fat -- to sì gran -- de,

    de -- gne d'un chia -- ro sol, de -- gne d'un pie -- no The -- a -- tro, opre _ sa -- rian sì me -- mo -- ran -- de.

    Pia -- cia -- ti ch'in -- di_il trag -- ga e'n bel se -- re - no a le fu -- ture_e - tà lo spie - - - - ghi_e man -- de.

    Vi -- va la fa -- ma lor, e tra lor glo -- ria splen -- da dal fo -- sco  tuo l'al - - - ta me -- mo -- ria.

    Non schi -- var, non pa -- rar, non pur ri -- trarsi vo -- gli -- on co --

    stor, ne qui de -- strez -- za_ha par -- te.

    Non dan -- no_i col -- pi_hor fin -- ti-hor pie -ni_hor scar -- si:

    to -- glie l'om -- bra_e'l fu -- ror l'u -- so de l'ar -- te.

    O -- di le spa -- de o -- di o -- di  le spa -- de orri - bil -- men -- te_ur --  -- tar -- si

    a mez -- zo_il fer -- ro; e'l piè d'or  -- ma non par -- te:

    sem -- pre_il piè fer -- mo e la man sem -- pre_in mo -- to,

    né scen -- de ta -- glio_in van, né pun -- ta_a vo -- to.

    %164
    L'on -- ta ir -- ri --ta lo sde -- gno  a la ven -- det -- ta_a la ven -- det -- ta,

    e la ven -- det -- ta poi e la ven -- det -- ta poi l'on -- ta ri -- nova: _

    on -- de sem -- pre_al fe -- rir sem -- pre_al fe -- rir, sem -- pre_a la fretta _

    sti -- mol no -- vo s'ag -- giun -- ge_e pia -- ga nova. _

    D'or in or più si me -- sce e più ri -- stret -- ta

    si fa la pu -- gna, e spa -- da_o -- prar non giova; _

    dansi _ con po -- mi, e_in -- fel -- lo -- niti _ e cru -- di

    coz -- zan con gli_el -- mi_in -- sie --  me_e con gli scu -- di.

    Tre vol -- te_il ca --  va -- lier la don -- na strin -- ge

    con le ro -- bu -- ste brac -- cia, e alt -- ret -- tan -- te

    poi da quei no -- di da quei no -- di te -- na -- ci ella si scin -- ge,

    no -- di di fier ne --  mi -- co_e non d'a -- man -- te.

    Tor -- na -- no_al fer -- ro tor -- na -- no_al fer -- ro tor -- na -- no_al fer -- ro, e l'un e l'al -- tro_il tin -- ge

    di mol -- to san -- gue, e stan -- co e a -- ne -- lan -- te

    e que -- sti_e que -- gli_al fin pur si ri -- ti -- ra,

    e do -- po lun -- go fa -- ti -- car re -- spi -- ra.

    L'un l'al -- tro guar -- da, e del suo cor -- po_e -- san -- gue

    su'l po -- mo de la spa --  da ap -- pog -- gia_il pe -- so.

    Già de l'ul -- tima _ stella_il _ rag -- gio lan -- gue

    sul primo_al - bor ch'è in o -- rien -- te_ac -- ce -- so.

    Ve -- de Tan -- cre -- di in maggior _ copia_il _ san -- gue

    del suo ne -- mi -- co e se non tan -- to_of -- fe -- so,

    ne go -- de e_in su -- per -- bi -- sce. Oh no -- stra fol -- le

    men -- te ch'o -- gni aura _ di for -- tu -- na e -- stol -- le!

    Mi -- sero, _ di che go -- di? Oh quan -- to me -- sti

    si -- ano _ i tri -- on -- fi_e in -- fe -- li -- ce_il van -- to!

    Gli_oc -- chi tuoi pa -- ghe -- ran s'in vi -- ta re -- sti

    di quel san -- gue ogni stil -- la un mar di pian -- to.

    Co -- sì ta -- cen -- do e ri -- mi -- ran -- do, que -- sti

    san -- gui -- no -- si guer -- rier ces -- sa -- ro_al -- quan -- to.

    Rup -- pe_il si -- len -- zio_al fin Tan -- cre -- di e dis -- se,

    per -- ché_il suo no -- me l'un l'al -- tro sco -- pris -- se:

    Ri -- spo -- se la fe -- ro -- ce:

    Ar -- se di sde -- gno_a quel par -- lar Tan -- cre -- di:

    Tor -- na l'i -- ra ne' co -- ri_e li tra -- spor -- ta,

    ben -- ché de -- boli,_in _ guer -- ra_a fie -- ra pu -- gna!

    Ù' l'ar -- te_in ban -- do,_ù' già la for -- za_è mor -- ta,

    o -- ve,_in ve -- ce, d'en -- tram -- bi_il fu -- ror pu -- gna!

    O che san -- gui -- gna e spa -- zio -- sa por -- ta

    fa l'u -- na_e l'altra _ spa -- da,_o -- vun -- que giu -- gna

    ne l'ar -- mi_e ne le car -- ni! e se la vi -- ta

    non e -- sce, sde -- gno tien -- la_al pet -- to_u -- ni -- ta.

    Ma ec -- co_ho -- mai l'ho -- ra fa -- tal è giun -- ta

    che'l vi -- ver di Clo -- rin -- da_al suo fin de -- ve.

    Spin -- ge_e -- gli_il fer -- ro nel bel sen di pun -- ta

    che vi s'im -- mer -- ge e'l san -- gue_a -- vi -- do be -- ve;

    e la ve -- ste che d'or va -- go tra -- pun -- ta

    le mam -- mel -- le strin -- gea te -- ne -- re_e lie -- ve,

    l'em -- pie d'un cal -- do fiu -- me. El -- la già sen -- te

    mo -- rir -- si, e'l piè le man -- ca e -- gro_e lan -- guen -- te.

    Se -- gue_e -- gli la vit -- to -- ria, e la tra -- fit -- ta

    ver -- gi -- ne mi -- nac -- cian -- do_in -- cal -- za_e pre -- me.

    El -- la, men -- tre ca -- de -- a, la vo -- ce_af -- flit -- ta

    mo -- ven -- do, dis -- se le pa -- ro -- le_e -- stre -- me:

    pa -- ro -- le pa -- ro -- le ch'a lei no -- vo spir -- to_ad -- di -- ta,

    spir -- to di fè, di ca -- ri -- tà, di spe -- me,

    vir -- tù che Dio l'in -- fon -- de, e se ru -- bel -- la

    in vi -- ta fu, la vol in mor -- te_an -- cel -- la.

    In que -- ste vo -- ci lan -- gui -- de ri -- suo -- na

    un non so che di fle -- bi -- le_e so -- a -- ve

    ch'al cor gli scen -- de ed o -- gni sde -- gno_am -- mor -- za,

    e gli_oc -- chi_a la -- gri -- mar l'in -- vo -- glia_e sfor -- za.

    Po -- co quin -- di lon -- tan nel sen d'un mon -- te

    sca -- tu -- ria mor -- mo -- ran -- do_un pic -- ciol ri -- o.

    E -- gli v'ac -- cor -- se e l'el -- mo_em -- piè nel fon -- te,

    e tor -- nò me -- sto al gran -- de_uf -- fi -- cio_e pi -- o.

    Tre -- mar sen -- tì la man, men -- tre la front -- e

    non co -- no -- sciu -- ta_an -- cor sciol -- se e sco -- pri -- o.

    La vi -- de la vi -- de e la co -- nob -- be: e re -- stò sen -- za

    e vo -- ce e mo -- to. Ahi vi -- sta! ahi co -- no -- scen -- za!

    Non mo -- rì già, ché sue vir -- tu -- ti_ac -- col -- se

    tut -- te_in quel pun -- to_e in guar -- dia_il cor le mi -- se,

    e pre -- men -- do_il suo_af -- fan -- no a dar si vol -- se

    vi -- ta con l'ac -- qua a chi col fer -- ro_uc -- ci -- se.

    Men -- tre_e -- gli_il suon de' sa -- cri det -- ti sciol -- se,

    co -- lei di gio -- ia tras -- mu -- tos -- si,_e ri - se:

    e_in at -- to di mo -- rir lie -- ta_e vi -- va -- ce dir pa -- re -- a:

}

bcn = \relative do {

    re1
    R
    re

    %4
    R
    re
    R

    %7
    sol,
    la\mbreak
    re

    %10
    re4 mi fa mi
    re mi fa mi
    re mi fa mi

    %13
    re mi fa sol
    la1
    re,2 mi

    %16
    la, re
    sol, la\mbreak

    %18 La mossa del cavallo
    re\breve re1
    re\breve re1
    re\breve re1

    %21
    re\breve re1
    re\breve re1
    re\breve re1

    %24
    re1 re2 re1 re2
    re1 re2 re1 re2
    re1 re2 re1 re2

    %27
    re1 re4 re re1 re4 re\mbreak
    re1 re4 re re1 re4 re
    re1 re4 re re1 re4 re

    %30
    re1 re4 re re1 re4 re
    re1 re2 re re re
    re re re re re re

    %33
    sol, sol sol sol sol sol\mbreak
    sol'4 sol sol sol sol2 sol sol sol
    sol4 sol sol sol sol2 sol sol sol

    %36
    sol4 sol sol sol sol2 sol sol sol
    sol sol sol sol1 sol2

    %38 OOKK 4/4
    sol,1~
    sol2 re'~
    re sol

    %41
    do la\mbreak
    sol do,
    r8 do la4 r r8 fa

    %44
    do'4 fa, r2
    fad' sol4 r\mbreak
    sol,2~sol

    %47
    sol4 si re2
    sol, r\mbreak
    do1\parentSlur(

    %50
    do2)\parentSlur ( do)~
    do~do~\mbreak
    do fa,~

    %53
    fa sol
    do1
    sol'2~\mbreak sol

    %56
    sol~ sol
    la sol\mbreak
    sol,2 sol

    %59
    sol re'
    sol,4 r r2
    sol2 sol

    %62
    sol re'
    sol,4 r r2
    sol sol

    %65
    sol re'\mbreak
    sol,4 r r2
    sol sol

    %68
    sol re'
    sol,4 r r2
    \repeat unfold 16 {sol16}\mbreak

    %71
    \repeat unfold 8 {sol16} re'2
    sol,4 r r2

    %73 Sinfonia
    sol'2. fa4
    mib2 re
    do fa

    %76
    sib2. la4\mbreak
    sol fa mib2
    fa1

    %79
    sib,
    sib'4 la sol do
    fa, r r2

    %82
    fa4 mi re sol
    do, r r2
    do4 sib la re

    %85
    sol,4 r r2\mbreak
    sib4 do re2
    sol,4 r r2

    %88
    sol1
    sol
    sol

    %91
    re'2 sol
    fa2. sol4
    la1\mbreak

    %94
    re,2 sib
    mib re
    fa1

    %97
    sib,
    sib \mbreak
    fa'2 fa

    %100
    do sol'
    do,1
    sol2 re'

    %103
    la sol
    re'1\mbreak
    sol,

    %106
    sib'4 la sol do
    fa, r r2
    fa4 mi re sol

    %109
    do, r r2
    do4 sib la re
    sol, r r2

    %112
    sib4 do re2
    sol,4 r r2
    sol1\mbreak

    %115
    sol
    re'
    sol

    %118
    fa2. sol4
    la1
    re,

    %121
    re2 do
    sib mib\mbreak
    re sib

    %124
    fa'1
    sib,
    sib2 fa'\mbreak

    %127
    do sol'
    do,1
    sol2 re'~

    %130
    re\mbreak sib
    sol~sol
    re'1\mbreak

    %133 3/2 OOKK
    sol,1 r  sol4 sol sol2
    sol1 r sol4 sol sol2
    sol1 r sol4 sol sol2

    %136
    sol1 r re'\mbreak
    sol,2 r r1 re'
    sol,2 r r1 r

    %139 4/4
    sol'4 r do r
    sol r do, r
    sol' r do r

    %142
    sol r do, r
    sol' r do r
    sol r sol,4. sol8\mbreak
    sol4 sol8 sol sol2

    %146
    fad2 sol
    R1
    sol'4 r8 sol sol,4 r8 sol

    %149
    sol'4 r8 sol sol,4 r8 sol
    sol'4 r8 sol sol,4 r8 sol\mbreak
    sol'4 r8 sol sol,2

    %152
    sol'8. sol16 sol8. sol16 sol8. sol16 sol8. sol16
    sol8. sol16 sol8. sol16 sol8. sol16 sol8. sol16
    sol8. sol16 sol8. sol16 sol8. sol16 sol8. sol16

    %155
    sol,2 r\mbreak
    sol'8 re sol, re' sol re sol, re'
    sol8 re sol, re' sol re sol, re'

    %158
    sol8 re sol, re' sol re sol, re'
    sol2 sol8 fad16 mi re do si la\mbreak
    sol2 sol'8 fad16 mi re do si la

    %161
    sol8 la16 si do re mi fad sol8 fad16 mi re do si la
    sol2 re'
    sol,16 \repeat unfold 15 {sol16}

    %164
    sol2 r
    \repeat unfold 16 {sol16}\mbreak
    sol2 r

    %167
    sol'16 \repeat unfold 15 {sol16}
    sol2 r
    \repeat unfold 16 {sol16}

    %170
    \repeat unfold 16 {sol16}
    sol,16\p \repeat unfold 15 {sol16}
    sol'16\f \repeat unfold 15 {sol16}

    %173
    \repeat unfold 16 {sol16}
    \repeat unfold 16 {sol16}
    sol,4 r sol r

    %176
    sol r sol r

    %177 3/2
    sol'1 sol, sol'
    sol, sol' sol,
    sol' sol, sol

    %180
    re'\breve r1
    sol,4 r r2
    R1

    %183
    r4 si2 do4~
    do si2 do4
    do si2 do4~

    %186
    do2 \mbreak do
    sol~ sol
    sol'1

    %189
    sol4 do la sib
    sol la fa sol
    mi fa re mi

    %192
    do re si? do
    la2 sol\mbreak
    sol sol

    %195
    sol sol
    sol sol
    sol sol

    %198
    re'1
    sol,16 \repeat unfold 15 {sol16}
    \repeat unfold 16 {sol16}

    %201
    sol' \repeat unfold 15 {sol16}
    \repeat unfold 8 {sol16} sol,2
    sol4 sol sol sol

    %204
    sol2 r\mbreak
    sol4 sol sol sol
    sol2 r

    %207
    sol4 sol sol sol
    sol2 r
    sol4 sol sol sol

    %210
    sol2 r
    sol4 sol sol sol
    sol2 r

    %213
    R1
    re'\mbreak
    re2 sib

    %216
    sib la
    sol1
    do

    %219
    re
    R
    sol,

    %222
    sol
    sol\mbreak
    sol

    %225
    fad
    sol
    re

    %228
    sib'2~sib
    mib2~\mbreak mib
    mib sib

    %231
    r sib~
    sib sib
    fa do'\mbreak %%% fine p 34 basso continuo

    %234 OOKK
    fa, do'~
    do sol'~
    sol fa~

    %237
    \footnote #' (-1 . 2) \markup\column\smaller {"Così e in seguito nella parte di Testo""  "}fa mi!~
    mi la,
    mi' la

    %240
    la sold
    la~la
    si!~si

    %243
    si~si
    sold~sold
    sold~sold

    %246
    sold~sold~
    sold~sold
    la4 sol? fa mi

    %249
    re2 mi
    la,1
    la2~la

    %252
    la~la
    r fa
    fa fa

    %255
    sib la
    sol1
    fa2 r

    %258
    do'~do~
    do sol
    sol1

    %261
    re'
    sol,
    re'

    %264
    re
    re
    sol,~

    %267
    sol2 re'~
    re la~
    la la

    %270
    fa sib
    fa do'
    mi1

    %273
    mi
    mi2 la,~
    la la

    %276
    mi' fa
    mi la,~
    la re~

    %279
    re sol,
    do4 la sib2
    la sol

    %282
    la1
    re2~re
    re~re

    %285
    re fad
    fad~fad
    fad sol

    %288
    sol~sol
    sol4 r r2
    do4 la fa4. mi8

    %291
    sol2 do4 r
    si,2~si
    sol re'

    %294
    re fad
    la~la
    la~la

    %297
    fad~fad
    sol4. la8 re,2

    %299 Guerra OOKK
    sol,16 \repeat unfold 15 {sol}
    sol2 r
    sol16 \repeat unfold 15 {sol}
    \footnote #' (-1 . 3) \markup\column\smaller {"Così il Basso nella parte separata di Testo"}sol2~sol4 re'

    %303 3/2
    sol,2 sol sol sol4 sol sol sol sol2
    sol' sol sol sol4 sol sol sol sol2
    sol sol sol sol4 sol sol sol sol2
    sol,4 sol sol sol sol2 sol'4 sol sol sol sol2
    sol,4 sol sol sol sol2 re'4 re re re re2

    %308 4/4 OOKK
    sol,16 \repeat unfold 15 {sol}
    sol16\p \repeat unfold 15 {sol}
    sol'16\f \repeat unfold 15 {sol}

    %311
    sol16 \repeat unfold 15 {sol}
    sol16 \repeat unfold 15 {sol}
    sol,16\p \repeat unfold 15 {sol}

    %314
    sol16 \repeat unfold 15 {sol}
    sol'16\f\repeat unfold 15 {sol}
    re2 sol,4 r

    %317
    si1
    si
    si

    %320
    si
    si
    si

    %323
    sold
    sold2 sold'
    sold sold

    %326
    la~ la~
    la fad
    fad1

    %329
    fad
    fad
    fad

    %332
    fad2 sol
    sol fad
    mi mi~

    %335
    mi do
    si1
    sib2 la

    %338
    sold r
    si1
    mi

    %341
    do2 sol'4 r
    sol2 sol
    do sol4 r

    %344
    r2 mi~
    mi do
    fa, sib

    %347
    sib1
    sib
    sib

    %350
    la
    mi'2 r4 fad
    sold2 la

    %353
    fa mi
    la,1
    la

    %356
    la
    re
    re

    %359
    sol,
    do
    do2 fa,

    %362
    sib re
    la1
    re

    %365 OOKK sib
    sol,1
    sol
    R

    %368
    si!
    R
    do

    %371
    R
    dod
    r2 dod

    %374
    R1
    re
    R

    %377
    sol,
    R
    si!

    %380
    R
    do
    R

    %383
    dod
    do?
    do

    %386
    do
    do
    do

    %389
    sol
    re2 re'
    re2 do

    %392
    sib1
    la
    re

    %395
    la
    la
    sol2 fa

    %398
    fa do'
    do sol'4 r
    sol1

    %401
    re
    sib
    la

    %404
    r2 sold
    sold1
    sold

    %407
    sold
    la2 fa
    fa mi

    %410
    do'4 sol'do sol
    R1
    R

    %413
    sol,
    r2 sol
    r sol

    %416
    R1
    mi'2 re
    R1

    %419
    fa2 mi
    la,1
    fa

    %422
    fa
    sib2 fa
    do' fa,

    %425
    fa1
    do'2 do4 si
    la2 la

    %428
    re fa
    mi la,
    la1

    %431
    la
    la2 sol
    fa1

    %434
    sib2 fa'
    do fa,
    fa1

    %437
    fa2 do'
    la sol
    r2 mi'~

    %440
    mi la
    sol r4 do
    sib1

    %443
    r2 sol
    la1
    re,\breve

}

bfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <_!>1
    s
    <_!>
    s
    <_!>
    s1*3
    <_+>1
    <_!>
    s1*4
    s2 <_+>
    <_+> <_+>
    <_-> <_+>

    %3/2 Motto del cavallo
    <_+>\breve.
    s\breve.*5
    <_+>\breve.
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    s\breve.*5

    %4/4 Tancredi e Clorinda
    s1
    s2 <_+>
    s1*19
    s2 <_+>
    s1
    s
    s2 <_+>
    s1*30
    <_+>1
    s1*25
    <_+>1
    <_+>
    <_!>2  <_->

    %122 OOKK
    s1*5
    <_->1
    s1*5

    %133 inizia 3/2 Principio della guerra
    s\breve.*3
    s1 s <_+>
    s s <_+>
    s\breve.

    %139 4/4
    s1*17
    s8 <_+> s <_+> s <_+> s <_+>
    s8 <_+> s <_+> s <_+> s <_+>
    s8 <_+> s <_+> s <_+> s <_+>
    s1*3
    s2 <_+>
    s1*14

    %177 3/2
    s\breve.*3
    <_+>\breve.

    %181 4/4
    s1*17
    <_+>1
    s1*2
    <_!>1
    <_!>2 <_->
    <_->4 <_-> <_-> <_->
    <_->1
    <_->4 <_-> <_-> <_->
    <_->1
    <_->4 <_-> <_-> <_->
    <_->1
    <_->4 <_-> <_-> <_->
    <_->1
    <_->4 <_-> <_-> <_->
    <_->1
    s1*4
    <_->1
    s
    <_+>
    s
    <_->
    <_->
    <_->
    <_->
    s
    <_->
    s1*10
    s2 <_+>
    <_+>1
    s
    s
    <_+>
    s1*7
    s2 <_+>
    <_+>1
    <_!>
    s1*4
    <_->1
    s1*4
    <_+>1
    s
    <_!>
    <_!>
    <_!>
    <_->
    <_->
    s1*4
    <_+>1
    <_+>
    <_+>
    s
    <_+>
    s
    s2 <_+>
    <_+>1
    s
    s2 <_->
    s1
    <_+>
    <_+>
    <_+>
    s1*7
    s2 <_+>
    <_+>1
    <_+>
    <_+>
    s1*6

    %303 3/2
    s\breve.*4
    s1 s2 <_+>1 <_+>2

    %308 4/4
    s1*9
    <_+>1
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    s
    s
    s
    <_+>2 <_+>
    <_+>1
    s1*6
    <_+>2 <_!>
    s1
    <_+>
    s
    s
    <_+>
    <_+>
    s1*10
    <_+>1
    s1*3
    <_+>1
    <_+>
    <_+>
    <_+>
    s1*18
    <_->1
    s1*3
    <_->1
    s
    s
    <_!>
    <_!>
    <_->
    <_->
    <_->
    <_->
    s1*3
    <_+>1
    <_+>
    s1*5
    <_->1
    s
    s
    <_+>
    s1*5
    s2 <_+>
    s1*3
    <_->1
    s2 <_->
    s <_->
    s1*11
    s2 <_+>
    s1
    s2 <_+>
    <_!>1
    s1*8
    s2 <_+>
    s1*3
    s2 <_->
    s1
    <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 60
    s1*17\break\once \override Score.RehearsalMark.extra-offset = #'(+13 . -1)
    \mark\markup\italic\column{ "Trotto del Cavallo"}
    \time 3/2
    \set Score.measureLength = #(ly:make-moment 6 2)
    \tempo \breve. = 120
    s\breve.*20\break
    \time 4/4
    \set Score.measureLength = #(ly:make-moment 4 4)
    \tempo 2 = 65
    s1*35\break\once \override Score.RehearsalMark.extra-offset = #'(+13 . -1)
    \mark\markup\italic\column{ "Sinfonia"}
    \key fa\major
    s1*60\break\once \override Score.RehearsalMark.extra-offset = #'(+15 . -1)
    \mark\markup\italic\column{ "Principio della guerra"}
    \key do\major
    \time 3/2
    \tempo \breve. = 120
    \set Score.measureLength = #(ly:make-moment 6 2)
    s\breve.*6
    \time 4/4
    \set Score.measureLength = #(ly:make-moment 4 4)
    \tempo 2 = 60
    s1*38\break
    \time 3/2
    \once \override Staff.TimeSignature.style = #'single-digit
    \tempo \breve. = 70
    \set Score.measureLength = #(ly:make-moment 6 2)
    s\breve.*4
    \time 4/4
    \set Score.measureLength = #(ly:make-moment 4 4)
    \tempo 2 = 60
    s1*47
    \bar "||"\break
    s1*70
    s1
    \mark\markup\italic"          Guerra"
    s1*4\break
    \time 3/2
    \once \override Staff.TimeSignature.style = #'single-digit
    \tempo \breve. = 120
    \set Score.measureLength = #(ly:make-moment 6 2)
    s\breve.*5
    \time 4/4
    \tempo 2 = 60
    s1*57\break
    \key fa\major
    s1*19
    \bar "||"\break
    \key do\major
    s1*61
    \set Score.measureLength = #(ly:make-moment 4 2)
    s\breve
    \bar"|."

}

vlI = {
    %\notypeset
    <<\vlIn \forma>>

}

vlII = {
    <<\vlIIn \forma>>

}

vla = {
    <<\vlan \forma>>

}

clorinda = {
    \new Voice = "tasso1"
    <<\clorindan \forma>>
}

tancredi = {
    \new Voice = "tasso2"
    <<\tancredin \forma>>
}

testo = {
    \new Voice = "tasso3"
    <<\teston \forma>>
}

bc = {
    \clef bass
    <<\bcn \forma \bfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 15.5)


\pointAndClickOff

global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.7
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override Staff.NoteHead.style = #'baroque

}

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup \smaller \center-column{"Combat[t]imento di Tancredi et Clorinda"\smaller"Parole del Signor Torquato Tasso"}
    composer = \markup \center-column{"C. Monteverdi (1567-1643"}
}

\score {

    <<

        \new Staff = "sopra" <<
            \set Staff.instrumentName = \markup \center-column{"Viola da brazzo"\vspace #-0.2"Soprano / Violino"}
            \set Staff.midiInstrument = #"violin"
            \vlI\global
        >>

        \new Staff  = "alto"<<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major\time 4/4  r1^\markup\center-align\center-column {"     Viola da brazzo"\vspace #-0.3"    Alto / Violino" }}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \vlII\global
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef tenor \key do\major\time 4/4  r1 ^\markup\center-align\center-column { "       Viola da brazzo"\vspace#-0.3 "    Tenore"}}
            \clef alto
            \vla\global
            \set Staff.midiInstrument = #"viola"
        >>

        \new ChoirStaff <<

            \new Staff = "clorinda" <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major\time 4/4  r1 ^\markup\center-align {"Clorinda"} }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \clorinda\global
                \new Lyrics \lyricsto "tasso1" \testoI
            >>

            \new Staff  = "tancredi" <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major\time 4/4  r1 ^\markup\center-align {"Tancredi"}}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \tancredi\global
                \new Lyrics \lyricsto "tasso2" \testoII
            >>

            \new Staff = "tasso" <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major\time 4/4  r1 ^\markup\center-align {"Testo"} }
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \testo\global
                \new Lyrics \lyricsto "tasso3" \testoIII
            >>
        >>

        \new Staff = "main"
        <<
            \set Staff.instrumentName = \markup  \center-column{"Contrabasso da Gamba"\vspace #-0.2"Viola da brazzo Basso"\vspace #-0.2"Clavicembano"}
            \set Staff.midiInstrument = #"cello"
            \bc\global
        >>
    >>

    \layout {

        indent = 3\cm
        incipit-width = 3\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #3
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##f
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


