\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

MyCadenza = \relative do'' {

\cadenzaOn

    s4.^\markup\column\italic\center-align{"Qui si ferma a piaci[men]to"\vspace #-0.2"[v. Cadenza]"}
    \bar "|"

\cadenzaOff

}

salta = #(skip-of-length MyCadenza)

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

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

pf =  #(make-dynamic-script "pf")


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



IcrIn = \relative do'' {

    mi4 mi, r
    R2.
    mi'4 mi, r

    %4
    R2.
    mi'4 do r8 mi
    re4 sol, r8 re'

    %7
    mi4 mi, r8 mi'
    re4 sol, r
    mi'2.

    %10
    fa
    sol
    la8 sol fa mi re do

    %13
    re4 r8 re mi do
    re4 r8 re8 mi do\mbreak
    re4 r r

    %16
    R2.*6
    mi4 mi, r
    r mi' re

    %24
    mi mi, r
    r mi' re
    do sol'8 mi do sol

    %27
    do4 sol'8 mi do sol
    do4 r r
    R2.*2\mbreak

    %31
    mi4 mi, r
    do' do do
    do sol r8 mi'

    %34
    re4 sol, r8 re'
    mi4 do r8 mi
    re4 sol, r8 re'

    %37
    mi4 mi, r8 mi'
    fa4 re r8 fa
    sol4 sol, r8 sol'

    %40
    la sol fa mi re do
    sol4 re' r
    R2.

    %43
    re4 re r
    r r re
    re re r

    %46
    R2.*8
    r4 do sol
    mi do r

    %56
    R2.*3
    r4 re' re
    r re re

    %61
    r re re
    re re r
    R2.*12

    %75
    do2.
    re
    mi4 re do

    %78
    R2.
    re2 re4
    mi re r

    %81
    re2 re4
    mi r r\mbreak
    r r re~

    %84
    re re re
    re re re
    re re re

    %87
    re r r
    R2.*44
    mi4 mi, r

    %133
    R2.
    mi'4 mi, r
    R2.

    %136
    mi'4 mi, r
    r r re'
    mi4 mi, r

    %139
    r r r8 re'
    mi2.
    fa

    %142
    sol
    la8 sol fa mi re do
    sol4 r8 re' mi do

    %145
    re4 r8 re mi do
    re4 r8 re mi do
    re4 re r

    %148
    R2.*13
    r4 sol sol
    r sol sol

    %163
    r sol sol
    sol r r
    R2.*12

    %177
    do,2.
    mi
    re4 mi fa

    %180
    r mi re
    sol r r
    r mi re

    %183
    sol r r\mbreak
    r mi re
    mi r r

    %186
    r mi mi
    r mi re
    do sol'8 mi do sol

    %189
    do4 sol'8 mi do sol
    do4 do do
    do r r

}

IcrIIn = \relative do'' {

    do4 do, r
    R2.
    do'4 do, r

    %4
    R2.
    do'4 sol r8 do
    sol4 sol r8 sol

    %7
    do4 do, r8 do'
    sol4 sol r
    do2.

    %10
    do
    do
    do4 re8 do fa mi

    %13
    re4 r8 sol, do do,
    sol'4 r8 sol do do,\mbreak
    sol'4 r r

    %16
    R2.*6
    do4 do, r
    r do' sol

    %24
    do do, r
    r do' sol
    mi mi'8 do sol mi

    %27
    mi4 mi'8 do sol mi
    mi4 r r
    R2.*2\mbreak

    %31
    do'4 do, r
    do do do
    mi do r8 do'

    %34
    sol4 sol r8 sol
    do4 do, r8 do'
    sol4 sol r8 sol

    %37
    do4 do, r8 do'
    re4 sol, r8 re'
    mi4 mi, r8 mi'

    %40
    fa mi re do fa mi
    re4 sol, r
    R2.

    %43
    re'4 re r
    r r re
    sol, sol r

    %46
    R2.*8
    r4 do sol
    mi do r

    %56
    R2.*3
    r4 re' sol,
    r re' sol,

    %61
    r re' sol,
    re' re r
    R2.*10

    %73
    sol,2.
    sol
    sol

    %76
    sol
    sol4 sol sol
    R2.

    %79
    sol2 sol4
    do re r
    sol,2 sol4

    %82
    do r r \mbreak
    r4 r sol~
    sol re' re

    %85
    sol, sol sol
    sol sol sol
    sol r r

    %88
    R2.*44
    do4 do, r
    R2.\mbreak

    %134
    do'4 do, r
    R2.
    do'4 do, r

    %137
    r r r8 sol'
    do4 do, r
    r r r8 sol'

    %140
    do2.
    do
    do

    %143
    fa8 mi re do fa mi
    re4 r8 sol, do do,
    sol'4 r8 sol do do,

    %146
    sol'4 r8 sol do do,
    sol'4 sol r
    R2.*13

    %161
    r4 sol do
    r sol do
    r sol do

    %164
    sol r r
    R2.*12
    do,2.

    %178
    do'
    do4 do do
    r do re

    %181
    do r r
    r do re
    do r r\mbreak

    %184
    r do sol
    do r r
    r do do

    %187
    r do sol
    mi mi'8 do sol mi
    mi4 mi'8 do sol mi

    %190
    mi4 mi mi
    mi r r

}


IobIn = \relative do'' {

    do4. do8 re mi
    fa4 fa,8.[sol16 la8 fa]
    mi4 r8 mi' fa sol

    %4
    la4 la,8.[si16 do8 la]
    sol4 r8 sol'16[la sol8 sol]
    sol4 re8 mi fa mi16 re

    %7
    mi4r8 sol16[la sol8 sol]
    sol4 re8 mi fa mi16 re
    mi2 mi8 sol

    %10
    fa2 fa8 la
    sol2 sol8 sib
    la sol fa mi re do

    %13
    si?4 r8 re mi do
    si4 r8 re mi do\mbreak
    si4 r r

    %16
    R2.*6
    sol'16 do sol sol sol do sol sol sol8 fa16 mi

    %23
    la8. fa16 mi4 re
    sol16 do sol  sol sol do sol sol sol8 fa16 mi
    la8. fa16 mi4 re

    %26
    do8 mi16 do sol'8 mi do sol
    do8 mi16 do sol'8 mi do sol
    do4 r r

    %29
    do4. do8 re mi
    fa4 fa,8.[sol16 la8 fa]\mbreak
    mi4. mi'8 fa sol

    %32
    la4 la,8.[si16 do8 la]
    sol4 r8 sol'16[la sol8 sol]
    sol4 re8. mi16 fa8 mi16 re

    %35
    mi32(fa sol8.) r8 sol16 [la sol8 sol]
    sol4 re8. mi16 fa8 mi16 re
    mi4 mi, r8 mi'

    %38
    fa4 fa, r8 fa'
    sol4 sol, r8 sol'
    la sol fa mi re do

    %41
    si4 sol sol16(la32 si do re mi fad)
    sol8.[re16 si'8. sol16 re'8. si16]
    la4 re, re,16(mi32 fad sol la si do)

    %44
    re8.[la16 fad'8. re16 la'8. do,16]
    si4 sol r
    R2.*3

    %49
    re'8. la16 fad'8. re16  la'8. fad16
    la4 fad r
    R2.*3

    %54
    do8.[sol16 mi'8. do16 sol'8. mi16]
    sol4 mi r
    R2.*3

    %59
    r4 la sib
    la8 re, la'4 sib
    la8 re, la'4 sib

    %62
    sib? la r
    R2.*6
    r4 re, si  %% inizio p.9

    %70
    la8 si do4 si
    la8 si do4 si
    si la r

    %73
    R2.*2
    do2.
    si

    %77
    la8.[la16 si8. si16 do8. do16]
    mi8 do si4 la
    re16 sol re re re sol re re re8 do16 si

    %80
    mi8. do16 si4 la
    re16 sol re re re sol re re re8 do16 si
    mi8 re16 mi fad8 mi16 fad sol8 fad16 sol\mbreak

    %83
    r4 r  re~
    re re re
    re re re

    %86
    re re re
    sol sol, r
    R2.*44

    %132
    do4. do8 re mi
    fa4 fa,8. sol16 la8 sol16 fa\mbreak
    mi4 r8 mi' fa8 sol

    %135
    la4 la,8. si16 do8 si16 la
    sol4 r8 sol'16 [la sol8 sol]
    sol4 re8 mi fa8 mi16 re

    %138
    mi4 do8 [sol'16 la sol8 sol]
    sol4 re8 mi fa8 mi16 re
    mi2.

    %141
    fa
    sol
    la8 sol fa mi re do

    %144
    si re16 si sol'8 re mi do
    si re16 si sol'8 re mi do
    si re16 si sol'8 re mi do

    %147
    si4 sol r
    R2.*3
    sol8. [re16 si'?8. sol16 re'8. si16]

    %152
    sol'4 sol, r
    R2.*3
    fa8. [do16 la'8. fa16 do'8. la16]

    %157
    fa'4 fa, r
    R2.*3
    r4 sol' mib

    %162
    re8 sol, sol'4 mib
    re sol mib
    re8 si sol'4 r

    %165
    R2.*6
    r4 sol mi
    re8 mi fa4 mi

    %173
    re8 mi fa4 mi
    mi re r
    R2.*2

    %177
    fa2.
    mi
    re4 mi fa

    %180
    la8. fa16 mi4 re
    sol16 do sol sol sol do sol sol sol8 fa16 mi
    la la, fa' re do4 re4
    sol16 do sol  sol sol do sol sol sol8 fa16 mi\mbreak

    %184
    la8 fa mi4 re4 %% inizio p. 16
    mi8 sol16 mi fa8 sol la do
    si4 do sol

    %187
    la8 la, sol4 si4\tr
    do8 mi16 do sol'8[mi do sol]
    do8 mi16 do sol'8[mi do sol]

    %190
    do4 do do
    do r r

}

IobIIn = \relative do'' {

    R2.*2
    do4. do8 re mi
    fa4 fa,8.[sol16 la8 fa]

    %5
    mi4 r8 sol'16[la sol8 sol]
    sol4 re8 mi fa mi16 re
    mi4r8 sol16[la sol8 sol]

    %8
    sol4 re8 mi fa mi16 re
    do2.
    do

    %11
    do
    la'8 sol fa mi re do
    si4 r8 sol do do,

    %14
    sol'4 r8 sol do do,\mbreak
    sol'4 r r
    R2.*6

    %22
    mi'16 sol mi mi mi sol mi mi mi8 re16 do
    fa8. re16 do4 si
    mi16 sol mi mi mi sol mi mi mi8 re16 do

    %25
    fa8. re16 do4 si
    do8 do16 sol mi'8 do sol mi
    do' do16 sol mi'8 do sol mi

    %28
    do'4 r r
    R2.*2\mbreak
    do4. do8 re mi

    %32
    fa4 fa,8.[sol16 la8 fa]
    mi4 r8 sol'16 [la sol8 sol]
    r4 r8. mi16 fa8 mi16 re

    %35
    mi32(fa sol8.) r8 sol16 [la sol8 sol]
    sol4 re8. mi16 fa8 mi16 re
    do4 do, r8 do'

    %38
    si4 si r8 si
    do4 do, r8 do'
    la' sol fa mi re do

    %41
    si4 sol sol16(la32 si do re mi fad)
    sol8.[re16 si'8. sol16 re'8. si16]
    la4 re, re,16(mi32 fad sol la si do)

    %44
    re8.[la16 fad'8. re16 la'8. do,16]
    si4 sol r
    R2.*3

    %49
    re'8. la16 fad'8. re16  la'8. fad16
    la4 fad r
    R2.*3

    %54
    do8.[sol16 mi'8. do16 sol'8. mi16]
    sol4 mi r
    R2.*3

    %59
    r4 re sol
    fad re sol
    fad re sol

    %62
    sol fad r
    R2.*6
    r4 si, sol

    %70
    fad8 sol la4 sol
    fad?8 sol la4 sol
    sol fad r

    %73
    sol2.
    sol
    sol

    %76
    sol
    sol2 sol4
    sol sol fad

    %79
    re'16 sol re re re sol re re re8 do16 si
    do8. la16 sol4 fad
    re'16 sol re re re sol re re re8 do16 si

    %82
    mi8 re16 mi fad8 mi16 fad sol8 fad16 sol\mbreak
    r4 r  re~
    re re re

    %85
    re re re
    re re re
    sol sol, r

    %88
    R2.*46\mbreak
    do4. do8 re mi
    fa4 fa,8. sol16 la8 sol16 fa\mbreak

    %136
    mi4 r8 sol'16 [la sol8 sol]
    sol4 re8 mi fa8 mi16 re
    mi4 do8 [sol'16 la sol8 sol]

    %139
    sol4 re8 mi fa8 mi16 re
    do2.
    do

    %142
    do
    la'8 sol fa mi re do

    %144
    si re16 si sol'8 re mi do
    si re16 si sol'8 re mi do
    si re16 si sol'8 re mi do

    %147
    si4 sol r
    R2.*3
    sol8. [re16 si'?8. sol16 re'8. si16]

    %152
    sol'4 sol, r
    R2.*3
    fa8. [do16 la'8. fa16 do'8. la16]

    %157
    fa'4 fa, r
    R2.*3
    r4 re' do

    %162
    si8 sol re'4 do
    si8 sol re'4 do
    si8 sol si4 r

    %165
    R2.*6
    r4 mi do
    si8 do re4 do

    %173
    si8 do re4 do
    do si r
    do2.

    %176
    do
    do
    do

    %179
    do2 do4
    fa8. re16 do4 si
    sol'16 do sol sol sol do sol sol sol8 fa16 mi

    %182
    la la, fa' re do4 re4
    sol16 do sol  sol sol do sol sol sol8 fa16 mi\mbreak
    fa8 re do4 si

    %185
    do8 sol'16 mi fa8 sol la sol
    fa4 mi do
    fa8 la, sol4 si\tr

    %188
    do4 mi8 do sol mi
    do' mi16 do mi8 do sol mi
    do'4 sol mi

    %191
    mi r r

}

IvlIn = \relative do'' {

    <do mi,>4. \grace re16 do32(si do16) re8 mi
    fa4 fa,8. sol16 la8 sol16 fa
    mi32(fa sol8.) r8 \grace fa'16 mi32(re mi16) fa8 sol

    %4
    la4 la,8. si16 do8 si16 la
    sol32(fa mi8.) r8 sol'16 [la sol8 sol]
    sol4 re16 fa mi sol \grace sol16 fa8 mi16 re

    %7
    mi32(fa sol8.) r8 sol16 [la sol8 sol]
    sol4 re16 fa mi sol \grace sol16 fa8 mi16 re
    mi do si do mi, do' si do mi do sol' mi

    %10
    fa do si do fa, do' si do fa re la' fa
    sol do, si  do sol do si do sol' mi sib' sol
    la8 sol\grace sol16 fa8 mi \grace mi16 re8 do

    %13
    \once\stemUp <sol' si, re,>8\noBeam re16 si sol'8[re mi do]
    \once\stemUp <sol' si, re,>8\noBeam re16 si sol'8[re mi do]\mbreak
    \once\stemUp  <sol' si, re,>4 r r

    %16
    R2.*2
    fa2.\p
    mi

    %20
    re4(mi) fa
    la8 sol16 fa mi4 re
    sol16\f do sol sol sol do sol sol \grace la sol8 fa16 mi\mbreak

    %23
    la la, fa' re do8. re16 re4\tr
    sol16 do sol  sol sol do sol sol\grace la sol8 fa16 mi
    la la, fa' re do8. re16 re4\tr

    %26
    do8 mi16 do sol'8 mi do sol
    do8 mi16 do sol'8 mi do sol
    <do sol do,>4 <mi do mi,> r

    %29
    <do mi,>4. \grace re16 do32(si do16) re8 mi
    fa4 fa,8. sol16 la8 sol16 fa\mbreak
    mi32(fa sol8.) r8 \grace fa'16 mi32(re mi16) fa8 sol

    %32
    la4 la,8. si16 do8 si16 la
    sol32(fa mi8.) r8 sol'16 [la sol8 sol]
    sol4 re8. mi16 fa8 mi16 re

    %35
    mi32(fa sol8.) r8 sol16 [la sol8 sol]
    sol4 re8. mi16 \grace sol16 fa8 mi16 re
    mi do si do mi, do' si do mi do sol' mi

    %38
    fa do si do fa, do' si do fa re la' fa
    sol do, si  do sol do si do sol' mi sib' sol
    la8 sol\grace sol16 fa8 mi \grace mi16 re8 do

    %41
    \once\stemUp <sol' si, re,>4 sol, sol16(la32 si do re mi fad)
    sol8.[re16 si'8. sol16 re'8. si16]
    la4 re, re,16(mi32 fad sol la si do)

    %44
    re8.[la16 fad'8. re16 la'8. do,16]
    si4 sol r8 re'
    sol8\p(sib) sib[\parentSlur (la)] la(sol)\mbreak

    %47  OOKK
    \grace la16 sol8 fa \grace sol16 fa8[mib] \grace fa16 mib8 re
    re dod dod[sib' sol dod,]
    re8.\f la16 fad'8. re16  la'8. fad16

    %50
    re'4 re, r8 re\p
    fa! lab lab[sol] \grace lab16 sol8 fa
    \grace sol16 fa8 mib \grace fa16 mib8[re] \grace mib16 re8 do

    %53
    do si  si[lab' fa si,]
    do8.\f[sol16 mi'8. do16 sol'8. mi16]
    do'4 do, r8 do\p

    %56
    mib8 sol sol[fa] fa mib
    mib? re re[do] do sib
    sib4 do sib

    %59
    sib? \once\stemUp <la' re, re,> \once\stemUp <sib re, re,>
    la8 re, \once\stemUp <la' re, re,>4 \once\stemUp <sib re, re,>
    la8 re, \once\stemUp <la' re, re,>4 \once\stemUp <sib re, re,>

    %62
    sib? la r
    R2.*2
    do,2.\parenthesize \p \mbreak

    %66  OOKK fine p 8 manoscritto
    si!
    la4(si) do
    <<mi\\{mi8[do]}>> \grace si4 la2

    %69
    sol4 r r
    re r r
    re r r

    %72
    re' re, r
    R2.*2
    do'16\parenthesize \f do do do do do do do do do do do

    %76
    \repeat unfold 12 {si}
    la8.[la16 si8. si16 do8. do16]
    mi8 re16 do si4 la

    %79
    re16 sol re re re sol re re \grace mi re8 do16 si
    mi8 do16 la sol8. la16 la4\tr
    re16 sol re re re sol re re \grace mi re8 do16 si

    %82
    mi8 re16 mi fad8 mi16 fad sol8 fad16 sol\mbreak
    la8 do, la' do, si sol'
    si, sol' la,4 fad'

    %85
    sol8 re16 si si'8 sol re si
    sol'8 re16 si si'8 sol re si
    \once\stemUp < sol' si, re,>4 sol, r

    %88
    r sol mi
    si si' la
    sol fad mi

    %91
    si2.
    R2.*2
    mi'2.

    %95
    sold,
    la4 si do
    si do re

    %98
    do si la
    sold la si
    do si la

    %101
    r re la'\mbreak
    r re, sol
    r mi la

    %104
    r do, la'
    r si, fad'
    r si, sold'

    %107
    la8 mi mi sold la do,
    si4 la'8 fad sol mi
    sol, mi' fad,4 red'

    %110
    mi mi, r
    sol'2.\p
    fa

    %113
    mi4 fa mi
    mi re2
    sol8 la si4 si

    %116
    \grace si4 la2 sol4
    fad8 sol la4 sol
    sol fad r

    %119
    r la do,\mbreak
    r sol' fa!
    r sol(sold)

    %122
    r la sol!
    fad la, r
    r fad' la

    %125
    sol fad r
    r fad la
    sol fa! r

    %128
    mi la sol
    fad8 la sol si, re sol
    mi do la re fad, la

    %131
    sol4 r r
    <do mi,>4. \f\grace re16 do32(si do16) re8 mi
    fa4 fa,8. sol16 la8 sol16 fa\mbreak

    %134
    mi32(fa sol8.) r8 \grace fa'16 mi32(re mi16) fa8 sol
    la4 la,8. si16 do8 si16 la
    sol32(fa mi8.) r8 sol'16 [la sol8 sol]

    %137
    sol4 re16 fa mi sol \grace sol16 fa8 mi16 re
    mi4 do8 [sol'16 la sol8 sol]
    sol4 re16 fa mi sol \grace sol16 fa8 mi16 re

    %140
    mi do si do mi, do' si do mi do sol' mi
    fa do si do fa, do' si do fa re la' fa
    sol do, si  do sol do si do sol' mi sib' sol

    %143
    la8 sol\grace sol16 fa8 mi \grace mi16 re8 do
    \once\stemUp <sol' si, re,>8\noBeam re16 si sol'8[re mi do]
    \once\stemUp <sol' si, re,>8\noBeam re16 si sol'8[re mi do]

    %146
    \once\stemUp <sol' si, re,>8\noBeam re16 si sol'8[re mi do]
    \once\stemUp  <sol' si, re,>4 sol,4 r8 sol\p
    do mib mib[re] \grace mib16 re8 do

    %149
    \grace re16 do8 sib \grace do16 sib8[la] \grace sib16 la8 sol\mbreak %% OOKK fine pagina 13
    sol fad fad[mib' do fad,]
    sol8. re16 si'!8.\f[sol16] re'8. si16

    %152
    sol'4 sol, r8 sol\p
    sib reb \grace mib?16 reb8 [do] \grace reb16 do8 sib
    \grace do16 sib?8 lab lab8 [sol] sol fa!

    %155
    fa mi! mi[reb' sib mi,]
    fa8. do16 la'!8.\f[fa16] do'8. la16
    fa'4 fa, r8 fa\p

    %158
    lab do \grace re16 do8[sib] \grace do16 sib8 lab
    lab? sol \grace lab16 sol8[fa] \grace sol16 fa8 mib
    mib'8 sol fa4 mib

    %161
    re8 sol, \once\stemUp <re' sol, si,>4\f \once\stemUp <mib sol, do,>
    re8 sol, \once\stemUp <re' sol, si,>4\once\stemUp <mib sol, do,>
    re8 sol, \once\stemUp <re' sol, si,>4\once\stemUp <mib sol, do,>

    %164
    re8 sol, sol'4 r
    R2.*2\mbreak
    fa2.

    %168
    mi
    re4 mi fa
    la,8 re do4 si

    %171
    do do, r
    sol' sol, r
    sol' sol, r

    %174
    sol' sol, r
    R2.*2
    fa''16\f[fa fa fa fa fa fa fa fa fa fa fa]

    %178
    mi[mi mi mi mi mi mi mi mi mi mi mi]
    re8.[re16 mi8. mi16 fa8. fa16]
    la8. fa16 mi4 re

    %181
    sol16 do sol sol sol do sol sol \grace la sol8 fa16 mi
    la la, fa' re do8. re16 re4\tr
    sol16 do sol  sol sol do sol sol\grace la sol8 fa16 mi\mbreak

    %184
    la la, fa' re do8. re16 re4\tr %% inizio p. 16
    mi8 sol16 mi fa8 sol la do
    si4 do sol8 fa16 sol

    %187
    la8 la, sol8. si16 si4\tr
    do8 mi16 do sol'8[mi do sol]
    do8 mi16 do sol'8[mi do sol]

    %190
    \stemUp <mi' do mi,>4 <mi do mi,> <mi do mi,>
    <mi do mi,> r r

}

IvlIIn = \relative do'' {

    R2.*2
    <do mi,>4. \grace re16 do32(si do16) re8 mi
    fa4 fa,8. sol16 la8 sol16 fa

    %5
    sol32(fa mi8.) r8 sol'16 [la sol8 sol]
    sol4 re16 fa mi sol \grace sol16 fa8 mi16 re

    %7
    mi32(fa sol8.) r8 sol16 [la sol8 sol]
    sol4 re16 fa mi sol \grace sol16 fa8 mi16 re
    mi do si do mi, do' si do mi do sol' mi

    %10
    fa do si do fa, do' si do fa re la' fa
    sol do, si  do sol do si do sol' mi sib' sol
    la8 sol\grace sol16 fa8 mi \grace mi16 re8 do

    %13
    \once\stemUp <sol' si, re,>8\noBeam re16 si sol'8[re mi do]
    \once\stemUp <sol' si, re,>8\noBeam re16 si sol'8[re mi do]\mbreak
    \once\stemUp  <sol' si, re,>4 r r

    %16
    do,2.\p
    do
    do

    %19
    do
    do2 do4
    fa8 mi16 re do4 si

    %22
    mi16\f sol mi mi mi sol mi mi mi8 re16 do
    fa la, fa' re do8. re16 re4\tr
    mi16 sol mi mi mi sol mi mi \grace fa16 mi8 re16 do

    %25
    la' la, fa' re do8. re16 re4\tr
    do8 do16 sol mi'8 do sol mi
    <do' mi,>8\noBeam do16 sol mi'8 do sol mi

    %28
    <do' sol do,>4 <mi do mi,> r
    R2.*2
    <do mi,>4. \grace re16 do32(si do16) re8 mi

    %32
    fa4 fa,8. sol16 la8 sol16 fa
    sol32(fa mi8.) r8 sol'16 [la sol8 sol]
    sol4 re8. mi16 fa8 mi16 re

    %35
    mi32(fa sol8.) r8 sol16 [la sol8 sol]
    sol4 re8. mi16 \grace sol16 fa8 mi16 re
    mi do si do mi, do' si do mi do sol' mi

    %38
    fa do si do fa, do' si do fa re la' fa
    sol do, si  do sol do si do sol' mi sib' sol
    la8 sol\grace sol16 fa8 mi \grace mi16 re8 do

    %41
    \once\stemUp <sol' si, re,>4 sol, sol16(la32 si do re mi fad)
    sol8.[re16 si'8. sol16 re'8. si16]
    la4 re, re,16(mi32 fad sol la si do)

    %44
    re8.[la16 fad'8. re16 la'8. do,16]
    si4 sol r8 re'
    sol8\p(sib) sib[\parentSlur (la)] la(sol)\mbreak

    %47  OOKK
    \grace la16 sol8 fa \grace sol16 fa8[mib] \grace fa16 mib8 re
    re dod dod[sib' sol dod,]
    re8.\f la16 fad'8. re16  la'8. fad16

    %50
    re'4 re, r8 re\p
    fa! lab lab[sol] \grace lab16 sol8 fa
    \grace sol16 fa8 mib \grace fa16 mib8[re] \grace mib16 re8 do

    %53
    do si  si[lab' fa si,]
    do8.\f[sol16 mi'8. do16 sol'8. mi16]
    do'4 do, r8 do\p

    %56
    mib8 sol sol[fa] fa mib
    mib? re re[do] do sib
    sol4 la sol

    %59
    sol <la' re, fad,> <sol sib, re,>
    fad8 re<la' re, re,>4 <sol sib, re,>
    fad8 re<la' re, re,>4 <sol sib, re,>

    %62
    sol fad r
    sol,2.\p
    sol

    %65
    sol\mbreak
    sol
    sol2 sol4~

    %68
    sol\grace sol fad2
    sol4 r r
    re r r

    %71
    re r r
    re' re, r
    sol16\f sol sol sol sol sol sol sol sol sol sol sol

    %74
    sol sol sol sol sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol sol sol sol sol

    %77
    sol4 sol sol
    do8 si16 la sol4 fad

    %79
    re'16 sol re re re sol re re \grace mi re8 do16 si
    mi8 do16 la sol8. la16 la4\tr
    re16 sol re re re sol re re \grace mi re8 do16 si

    %82
    mi8 re16 mi fad8 mi16 fad sol8 fad16 sol\mbreak
    la8 do, la' do, si sol'
    si, sol' la,4 fad'

    %85
    sol8 si,16 sol sol'8 re si sol
    si re16 si sol'8 re si sol
    \once\stemUp <sol' si, re,>4 sol, r

    %88
    r sol mi
    si si' la
    sol fad mi

    %91
    si2.
    R2.*4
    mi'2.

    %97
    sold,
    la4 si do
    si do re

    %100
    do re do
    r la re\mbreak
    r si si

    %103
    r do do
    r la do
    r fad, si

    %106
    r sold si
    do8 mi mi sold la mi
    red4 fad?8 red mi sol,?

    %109
    mi sol red4 fad
    sol mi r
    mi'2.\p

    %112
    re
    do4 re do
    do si2

    %115
    si8 do re4 re
    \grace re do2 si4
    la8 si do4 si

    %118
    si la r
    r re la\mbreak
    r re si

    %121
    r mi re
    r mi dod
    re fad, r

    %124
    r la do?
    si la r
    r la do

    %127
    si re r
    sol, do2
    la8 fad' sol si, re sol

    %130
    mi do la re re, fad
    sol4 r r
    R2.*2\mbreak

    %134
    <do mi,>4. \f\grace re16 do32(si do16) re8 mi
    fa4 fa,8. sol16 la8 sol16 fa
    sol32(fa mi8.) r8 sol'16 [la sol8 sol]

    %137
    sol4 re16 fa mi sol \grace sol16 fa8 mi16 re
    mi4 do8 [sol'16 la sol8 sol]
    sol4 re16 fa mi sol \grace sol16 fa8 mi16 re

    %140
    mi do si do mi, do' si do mi do sol' mi
    fa do si do fa, do' si do fa re la' fa
    sol do, si  do sol do si do sol' mi sib' sol

    %143
    la8 sol\grace sol16 fa8 mi \grace mi16 re8 do
    \once\stemUp <sol' si, re,>8\noBeam re16 si sol'8[re mi do]
    \once\stemUp <sol' si, re,>8\noBeam re16 si sol'8[re mi do]

    %146
    \once\stemUp <sol' si, re,>8\noBeam re16 si sol'8[re mi do]
    \once\stemUp  <sol' si, re,>4 sol,4 r8 sol\p
    do mib mib[re] \grace mib16 re8 do

    %149
    \grace re16 do8 sib \grace do16 sib8[la] \grace sib16 la8 sol\mbreak %% OOKK fine pagina 13
    sol fad fad[mib' do fad,]
    sol8. re16 si'!8.\f[sol16] re'8. si16

    %152
    sol'4 sol, r8 sol\p
    sib reb \grace mib?16 reb8 [do] \grace reb16 do8 sib
    \grace do16 sib?8 lab lab8 [sol] sol fa!

    %155
    fa mi! mi[reb' sib mi,]
    fa8. do16 la'!8.\f[fa16] do'8. la16
    fa'4 fa, r8 fa\p

    %158
    lab do \grace re16 do8[sib] \grace do16 sib8 lab
    lab? sol \grace lab16 sol8[fa] \grace sol16 fa8 mib
    do' mib re4 do

    %161
    re8 sol, \once\stemUp <re' sol, si,>4\f \once\stemUp <mib sol, do,>
    re8 sol, \once\stemUp <re' sol, si,>4\once\stemUp <mib sol, do,>
    re8 sol, \once\stemUp <re' sol, si,>4\once\stemUp <mib sol, do,>

    %164
    re8 sol, sol'4 r
    do,2.\mbreak
    do

    %167
    do
    do
    do2 do4

    %170
    la8 fa mi4 re
    mi do r
    sol' sol, r

    %173
    sol' sol, r
    sol' sol, r
    do'16\f [do do do do do do do do do do do]

    %176
    do[do do do do do do do do do do do]
    do[do do do do do do do do do do do]
    do[do do do do do do do do do do do]

    %179
    do4 do do
    fa8. re16 do4 la

    %181
    sol'16 do sol sol sol do sol sol \grace la sol8 fa16 mi
    la la, fa' re do8. re16 re4\tr
    sol16 do sol  sol sol do sol sol\grace la sol8 fa16 mi\mbreak

    %184
    la la, fa' re do8. re16 re4\tr %% inizio p. 16
    mi8 sol16 mi fa8 sol la sol
    fa4 mi sol8 fa16 sol

    %187
    la8 la, sol8. si16 si4\tr
    do8 do16 sol mi'8 do sol mi
    <do' mi,>8\noBeam do16 sol mi'8 do sol mi

    %190
    <do' sol do,>4 <do sol do,> <do sol do,>
    <do sol do,> r r

}

Ivlan = \relative do' {

    mi4 sol sib
    la la, la
    sol do r

    %4
    r do do
    do mi8 sol fa mi
    re4. si8 do re

    %7
    do4 mi8 sol fa mi
    do4. si8 do re
    do do do do do do

    %10
    do do do do do do
    do do do do do do
    fa mi re do si la

    %13
    sol4 r8 sol' sol fad
    sol4. sol8 sol fad\mbreak
    R2.

    %16
    r8 do\p do do do do
    r si si si si si
    r la la la la la

    %19
    r sol sol sol sol sol
    fa4 sol la
    fa sol sol'

    %22
    do \f do, mi
    fa la fa
    mi do mi

    %25
    fa sol sol,
    do do, r
    do' do, r

    %28
    do' do, r
    mi' sol sib
    la do, la\mbreak

    %31
    sol do r
    r do' fa,
    mi4. sol8 fa mi

    %34
    re4 sol,8 si do re
    do4 mi8 sol fa mi
    re4 sol,8 si do re

    %37
    do4 sol' r 8 do
    si4 si, r 8si'
    do4 do, r8 mi

    %40
    fa mi re do si la
    sol4 si r
    si' re sol,

    %43
    la la, r
    la' re, re
    re si r

    %46
    sol'\p sol, r\mbreak
    sol' sol sol
    sol sol sol

    %49
    fad\f re' la
    fad re r
    fa!\p  fa, r

    %52
    fa' fa fa
    fa fa fa
    mi\f do' sol

    %55
    mi do r
    mib mib fa
    sol fa mib

    %58
    mib? do dod
    re re re
    re re re

    %61
    re re re
    re re r
    r8 sol sol sol sol sol

    %64
    r fad fad fad fad fad
    r mi mi mi mi mi\mbreak
    r re re re re re

    %67
    do4 re mi
    do re re,
    sol r sol

    %70
    re' fad, sol
    re' fad,? sol
    re' re8 do si la

    %73
    r si\f si si si si
    r si si si si si
    r mi mi mi mi mi

    %76
    r re re re re re
    do4 re mi
    mi re re

    %79
    sol2 sol4
    sol sol fad
    sol2 sol4

    %82
    sol do si\mbreak
    la re, re~
    re fad la

    %85
    si re, sol
    sol sol, sol'
    sol, r r

    %88
    R2.*2
    si'2.
    red,

    %92
    mi4 fad? sol
    fad? sol la
    sol fad? mi

    %95
    fa! mi re
    do2.
    re

    %98
    mi
    mi
    mi

    %101
    r4 re fad\mbreak
    r fad mi
    r la, la'

    %104
    r fad la
    r red, red
    r mi mi

    %107
    mi mi la,
    si2 mi4
    mi, si' si

    %110
    mi r r
    R2.*21
    mi4 sol sib

    %133
    la la, la\mbreak
    sol mi r
    do'' la fa

    %136
    do' do,8 sol' fa mi
    re4. si8 do re
    do4 mi8 sol fa mi

    %139
    re4. si8 do re
    do do do do do do
    do do do do do do

    %142
    do do do do do do
    fa mi re do si la
    sol4. sol'8 sol fad

    %145
    sol4. sol8 sol fad
    sol4. sol8 sol fad
    sol4 sol8 fa mib re

    %148
    do4 do, r
    do' do do\mbreak
    do do do

    %151
    si sol'\f re
    si sol r
    sib\p sib r

    %154
    sib? sib sib
    sib? sib sib
    la r r

    %157
    R2.
    lab4\p lab r
    lab? lab sol

    %160
    do fa fad
    sol4\f sol sol
    sol sol sol

    %163
    sol sol sol
    sol r r
    r8 do, do do do do\mbreak

    %166
    r si si si si si
    r la la la la la
    r sol sol sol sol sol

    %169
    fa4 sol la
    fa sol sol
    do r r

    %172
    R2.*3
    r8 mi\f mi mi mi mi
    r mi mi mi mi mi

    %177
    r la la la la la
    r sol sol sol sol sol
    la4 sol fa

    %180
    fa sol fa
    mi r do'
    do do si

    %183
    do r do\mbreak
    do do si
    do8 si la sol fa mi

    %186
    re4 do do'
    do si re,
    mi do do

    %189
    do do, do'
    do do do
    do r r

}

Isolionen = \relative do'' {

    \autoBeamOff
    R2.*28
    do4 do r
    r do la\mbreak

    %31
    sol4. sol8 sol4
    la do do
    do do r

    %34
    sol2 sol4
    sol sol r8 sol
    sol2 sol4

    %37
    sol sol r
    si si r
    do do r8 do

    %40
    do4 re4. do8
    si4 si r
    R2.

    %43
    la4 la r
    r r la8 la
    si8. si16 si4 r\mbreak

    %46
    R2.*2
    \stemUp dod2\soli dod4
    re4. la8 la4\stemNeutral

    %50
    R2.*3
    \stemUp si2 si4
    do4. sol8 sol4\mbreak\stemNeutral

    %55
    R2.*3
    \stemUp sib4 do sib
    sib? la r\stemNeutral

    %60
    R2.*3
    sol2.
    sol

    %65
    \stemUp do
    si?
    la4 si do

    %68
    mi8[do] \grace si4 la2
    si4 re si
    la8[si] do4 si

    %71
    la8 [si] do4 si
    si la r\stemNeutral
    R2.*2

    %75
    do2.
    si
    la4 si do

    %78
    mi8[do] si4(la)
    si r re
    do8 do si4 la

    %81
    si2 re4
    sol, do si\mbreak  %% fine p. 9
    do2 si4~

    %84
    si la2
    si4 r r
    R2.*10

    %96
    mi2.
    sold,
    la4(si) do

    %99
    si(do) re
    do(si) la
    la si do\mbreak

    %102
    si r r
    do do do
    la2.

    %105
    fad2 si4
    si si2
    do4 do do

    %108
    si2 si4~
    si8 si si2
    si4 r r

    %111
    R2.*4
    re4^\markup{\italic Solo Palchetto} re re
    \grace re do2 si4

    %117
    la8[si] do4 si
    si la r
    R2.*2

    %121
    \tupletSpan 4 mi'4~\tuplet 3/2 { mi8[fad mi] \override TupletBracket.bracket-visibility = ##f re[dod] re}
    dod2.
    re4 r r8 la

    %124
    re8. do16 do8 si do la
    si4 la4. si16[do]
    re4 do8[si do la]

    %127
    si4 re2~
    re4 do2~
    do4 si re

    %130
    mi8[re16 do] \grace si4 la2
    sol4 r r
    do2.\tu~

    %133
    do4 do do\mbreak
    do4. do8 do4
    r r do

    %136
    do4. do8 do4
    r r r8 re
    do4 do r

    %139
    r r8 si do re
    do4 do do8 do
    do2 do4

    %142
    do2 do8 do
    do4(si8) do re do
    si4 si do8 do

    %145
    si4. re8 do do
    si4. (re8) do do
    si4 si r

    %148
    R2.*2
    \stemUp mib2.\soli
    re4. re8 re4

    %152
    R2.*3
    \stemUp reb4 reb reb
    do4. do8 do4

    %157
    R2.*3
    do8[mib] re4 do
    si r r

    %162
    R2.*3
    \stemNeutral do2.
    do4. do8 do4

    %167
    \stemUp fa2.
    mi2 mi4
    re mi fa

    %170
    la,8[re] do4 si
    do mi do
    si8[do] re4 do

    %173
    si8[do] re4 do
    do si r
    \stemNeutral do2.

    %176
    do4. do8 do4
    do2.
    do2 do4

    %179
    do do do
    la8[re] do4 si
    do r r

    %182
    do do si
    do r r \mbreak
    do4 do si

    %185
    do4. do8 re do
    si4 do do
    do si si

    %188
    do r r
    R2.*3

}

Itesto = \lyricmode {

    Dixit _ dixit _ Do -- mi -- nus Do -- mi -- no meo: _ se -- de sede _ ad de -- xtris meis _

    sede _ sede _ ad de - xtris meis _ dixit _ dixit _ Do -- mi -- nus di -- xit Do -- mi -- nus

    di -- xit Do -- mi -- nus Do -- mi -- no meo: _ se -- de se -- de ad de -- xtris me - is

    dixit _ Do -- mi -- nus Do -- mi -- no meo: _ se -- de ad de -- xtris me - is

    ad de -- xtris me - is ad de - - - xtris me -- is.

    Do -- nec po -- nam i -- ni -- mi -- cos tu - - os scabel - lum pe -- dum [sca -- bel -- lum]

    scabel - lum pe -- dum  tuo - rum.

    e -- mit -- tet Do -- mi -- nus _ ex Sion: _

    do - mi -- na -- re in medi - o

    i -- ni -- mi -- co - - - - - - - rum tu -- o - rum.

    Te -- cum prin -- cipi - um prin -- cipi - um in die _ virtu - tis tuæ _  in splen -- do -- ri -- bus

    in splen -- do -- ri -- bus San -- cto -- rum in splen -- do -- ri -- bus San -- cto -- rum

    San -- cto -- rum

    ex u -- te -- ro an -- te lu -- cife - rum ge -- nui _ te

    ex u -- te -- ro an -- te lu -- cife - rum

    ge -- nui _ te dixit _ Do -- minus _ Do -- mino _ meo _

    ex u -- te -- ro an -- te lu -- cife - rum ge -- nui _ te ge -- nui _ te

    ge -- nui _ te an -- te lu -- cife - rum ge -- nui _ te.

}

Isolitwon = \relative do'' {

    \autoBeamOff
    s2.*47
    sol4 la sib
    \stemDown la4. fad8 fad4


    %50
    R2.*3
    fa?4 sol lab
    sol4. mi8 mi4

    %55
    R2.*3
    sol4 la sol
    sol fad s4

    %60
    s2.*5
    sol2.
    sol

    %67
    sol4 sol sol
    do8[la] \grace sol4 fad2
    sol4 si sol

    %70
    fad8[sol] la4 sol
    fad8[sol] la4 sol
    sol fad s

    %73
    s2.*77
    do'4 la fad
    sol4. sol8 sol4

    %152
    s2.*3
    sib4 sol mi
    fa4. fa8 fa4

    %157
    s2.*3
    mib8[sol] fa4 mib]
    re4 s s

    %162
    s2.*5
    do'2.
    do2 do4

    %169
    do4. do8 do4
    la8 [fa] mi4 re
    mi sol mi

    %172
    re8[mi] fa4 mi
    re8[mi] fa4 mi
    mi re s

}

Isopranon = \relative do'' {

    \autoBeamOff

    R2.*28
    do4 do r
    r do la\mbreak

    %31
    sol4. sol8 sol4
    la do do
    do do r

    %34
    sol2 sol4
    sol sol r8 sol
    sol2 sol4

    %37
    sol sol r
    si si r
    do do r8 do

    %40
    do4 re4. do8
    si4 si r
    R2.

    %43
    la4 la r
    r r la8 la
    si8. si16 si4 r\mbreak

    %46
    R2.*3
    r4 la la
    re la r

    %51
    R2.*3
    r4 sol sol
    do sol r

    %56
    R2.*3
    r4 re' sib
    la re sib

    %61
    la re sib
    sib? la r
    R2.*12

    %75
    do2.
    si
    la4 si do

    %78
    mi8[do] si4(la)
    si r re
    do8 do si4 la

    %81
    si2 re4
    sol, do si\mbreak  %% fine p. 9
    do2 si4~

    %84
    si la2
    si4 r r
    R2.*10

    %96
    mi2.
    sold,
    la4(si) do

    %99
    si(do) re
    do(si) la
    la si do\mbreak

    %102
    si r r
    do do do
    la2.

    %105
    fad2 si4
    si si2
    do4 do do

    %108
    si2 si4~
    si8 si si2
    si4 r r

    %111
    R2.*4
    R2.*17
    do2.\tu~

    %133
    do4 do do\mbreak
    do4. do8 do4
    r r do

    %136
    do4. do8 do4
    r r r8 re
    do4 do r

    %139
    r r8 si do re
    do4 do do8 do
    do2 do4

    %142
    do2 do8 do
    do4(si8) do re do
    si4 si do8 do

    %145
    si4. re8 do do
    si4. (re8) do do
    si4 si r

    %148
    R2.*3
    r4 si si
    si8. si16 si4 r

    %153
    R2.*3
    r4 la la
    la \parenthesize la r

    %158
    R2.*3
    r4 re do
    si re do

    %163
    si re do
    si si r
    R2.*10
    do2.

    %176
    do4. do8 do4
    do2.
    do2 do4

    %179
    do do do
    la8[re] do4 si
    do r r

    %182
    do do si
    do r r \mbreak
    do4 do si

    %185
    do4. do8 re do
    si4 do do
    do si si

    %188
    do r r
    R2.*3

}

ItestoI = \lyricmode {

    Dixit _ dixit _ Do -- mi -- nus Do -- mi -- no meo: _ se -- de sede _ ad de -- xtris meis _

    sede _ sede _ ad de - xtris meis _ dixit _ dixit _ Do -- mi -- nus dixit _ dixit _ dixit _ dixit _

    dixit _ Do -- mi -- nus Do -- mi -- no meo: _ se -- de ad de -- xtris me - is

    ad de -- xtris me - is ad de - - - xtris me -- is.

    Do -- nec po -- nam i -- ni -- mi -- cos tu - - os scabel - lum pe -- dum [sca -- bel -- lum]

    scabel - lum pe -- dum  tuo - rum.

    Te -- cum prin -- cipi - um prin -- cipi - um in die _ virtu - tis tuæ _  in splen -- do -- ri -- bus

    in splen -- do -- ri -- bus San -- cto -- rum in splen -- do -- ri -- bus San -- cto -- rum

    San -- cto -- rum

    dixit _ Do -- mi -- nus dixit _ dixit _  dixit _ Do -- mi -- nus Do -- mi -- no meo: _

    ex u -- te -- ro an -- te lu -- cife - rum ge -- nui _ te ge -- nui _ te

    ge -- nui _ te an -- te lu -- cife - rum ge -- nui _ te.

}

Ialton = \relative do' {

    \autoBeamOff
    R2.*28
    sol'4 mi r
    r fa fa\mbreak

    %31
    mi4. mi8 mi4
    mi la la
    sol sol r

    %34
    sol2 fa4
    mi mi r8 mi
    sol2 fa4

    %37
    mi mi r
    fa fa r
    sol sol r8 sol

    %40
    la[sol fa la] sol[fad]
    sol4 sol r
    R2.

    %43
    fad4 re r
    r r re8 re
    sol8. sol16 sol4 r\mbreak

    %46
    R2.*3
    r4 fad fad
    la fad? r

    %51
    R2.*3
    r4 mi mi
    sol mi r

    %56
    R2.*3
    r4 la sol
    fad la sol

    %61
    fad? la sol
    sol fad r
    R2.*10

    %73
    sol2.
    sol
    sol

    %76
    sol
    sol4 sol sol
    sol sol(fad)

    %79
    sol r sol
    sol8 sol sol4 fad
    sol2 sol4

    %82
    sol mi sol\mbreak %% fine p. 9
    la2 sol4~
    sol fad2

    %85
    sol4 r r
    R2.*4
    si2.

    %91
    red,
    mi4(fad?) sol
    fad?(sol) la

    %94
    sol(fad?) mi
    fa!(mi) re
    do2.

    %97
    re
    mi
    mi~

    %100
    mi4 r r
    R2.\mbreak
    sol4 sol sol

    %103
    mi2.
    fad4 r r
    si si si

    %106
    sold2.
    la4(sold) la
    fad2 sol!4~

    %109
    sol8 sol fad2
    sol4 r r
    sol2.^\markup{\italic Solo Palchetto}

    %112
    fa?
    mi4 fa mi
    mi re2

    %115
    sol8[la] si4 si
    \grace si4 la2 sol4
    fad8[sol] la4 sol

    %118
    sol fad r
    R2.\mbreak
    \tupletSpan 4 sol4~\tuplet 3/2 { sol8[la sol] fa![mi] fa }

    %121
    mi8. fad16 sol4 sold
    la~\tuplet 3/2 { la8[si la] sol![fad] sol }
    fad4 fad r8 re

    %124
    re2~re8 re
    re2.~
    re2 re4

    %127
    sol fa?8[mi] fa[re]
    mi4 la sol
    fad sol sol~

    %130
    sol8[la] \grace sol4 fad2
    sol4 r r
    sol2.\tu(

    %133
    la4) la la\mbreak
    sol4. sol8 sol4
    r r la

    %136
    sol4. sol8 sol4
    r r r8 sol
    sol4 sol r

    %139
    r r8 sol fa sol
    sol4 sol sol8 sol
    fa2 fa4

    %142
    sol2 sol8 sol
    la[sol fa] sol sol fad
    sol4 sol sol8 fad

    %145
    sol4. sol8 sol fad
    sol2 sol8 fad
    sol4 sol r

    %148
    R2.*3
    r4 sol sol
    sol8. re16 re4 r

    %153
    R2.*3
    r4 fa fa
    fa \parenthesize fa r

    %158
    R2.*3
    r4 sol sol
    sol sol sol

    %163
    sol sol sol
    sol sol r
    R2.*10

    %175
    mi2.
    mi4. fa8 sol4
    la2.

    %178
    mi2 sol4
    la sol fa
    la sol sol

    %181
    sol r r
    la sol sol
    sol r r\mbreak

    %184
    la sol sol
    sol r8 sol la sol
    sol4 sol sol

    %187
    la sol4. sol8
    sol4 r r
    R2.*3

}

ItestoII = \lyricmode {

    Dixit _ dixit _ Do -- mi -- nus Do -- mi -- no meo: _ se -- de sede _ ad de -- xtris meis _

    se -- de sede _ ad de -- xtris meis _ dixit _ dixit _ Do -- mi -- nus dixit _ dixit _ dixit _ dixit _

    dixit _ Do -- mi -- nus Do -- mi -- no meo: _ se -- de se -- de ad de -- xtris me - is

    ad de -- xtris me - is ad de - - - xtris me -- is.

    Do -- nec po -- nam i -- ni -- mi -- cos i -- ni -- mi -- cos tu -- os scabel - lum pe -- dum

    scabel - lum pe - dum pe -- dum tu -- o -- rum.

    Vir -- gam vir -- tu -- tis tu -- ae  e -- mit -- tet Do -- mi -- nus _ ex Sion: _

    do - mi -- na - - re do - mi -- na -- re in medi - o

    i -- ni - mi -- co - - - rum tu -- o -- rum.

    Te -- cum prin -- cipi - um prin -- cipi - um in die _ virtu - tis tuæ _  in splen -- do -- ri -- bus

    in splen -- do -- ri -- bus San -- cto -- rum in splen -- do -- ri -- bus San -- cto -- rum  San -- cto -- rum

    dixit _ Do -- mi -- nus dixit _ dixit _  dixit _ Do -- mi -- nus Do -- mi -- no meo: _

    ex u -- te -- ro an -- te lu -- cife - rum ge -- nui _ te ge -- nui _ te

    ge -- nui _ te an -- te lu -- cife - rum ge -- nui _ te.





}

Itenoren = \relative do' {

    \autoBeamOff
    R2.*28
    mi4 do r
    r do do\mbreak

    %31
    do4. do8 do4
    do fa fa
    mi mi r

    %34
    re4. \parentSlur (si8) do[re]
    mi4 do r8 mi
    re4. si8[do] re

    %37
    mi4 do r
    re re r
    do mi r8 mi

    %40
    do8[fa mi re] re [\parenthesize do]
    re4 re r
    R2.

    %43
    re4 re r
    r r re8 re
    re8. re16 re4 r

    %46
    R2.*3
    r4 re re
    re re r

    %51
    R2.*3
    r4 do do
    do do r

    %56
    R2.*3
    r4 re re
    re re re

    %61
    re re re
    re re r
    R2.*10

    %73
    si2.
    si
    do

    %76
    re
    mi4 re do
    mi re2

    %79
    re4 r re
    mi8 mi re2
    re re4

    %82
    mi do mi\mbreak %fine p. 9
    re2 re4~
    re re2

    %85
    re4 r r
    R2.*8
    mi2.

    %95
    sold,
    la4(si) do
    si(do) re

    %98
    do (si) la
    sold \parentSlur (la) si
    do r r

    %101
    re re re\mbreak
    si2.~
    si4 la si

    %104
    do2.
    si
    mi4 mi mi

    %107
    mi2 mi4
    red2 mi4~
    mi8 mi red2

    %110
    mi4 r r
    mi2.^\markup{\italic Solo Palchetto}
    re

    %113
    do4 re do
    do si2
    R2.*4

    %119
    \tupletSpan 4 re4~\tuplet 3/2 { re8[mi re] do[si] do }\mbreak
    si2.
    do2 sib4

    %122
    la2 la4
    re8. do16 do8 si do la
    si4 la4. si16[do]

    %125
    re4 do8[si do la]
    si4 la4. si16[do]
    si2 sol4

    %128
    do4. re8 mi4
    re mi si
    do re2

    %131
    sol,4 r r
    mi'2.\tu(
    fa4) fa fa\mbreak

    %134
    mi4. mi8 mi4
    r r fa
    mi4. mi8 mi4

    %137
    r r r8 re
    mi4 mi r
    r r8 re fa re

    %140
    mi4 mi mi8 mi
    re2 re4
    do2 do8 do

    %143
    la[do re ] mi si do
    re4 re mi8 do
    re4. re8 mi do

    %146
    re4.~ re8 mi do
    re4 re r
    R2.*3

    %151
    r4 re re
    re8. si16 si4 r
    R2.*3

    %156
    r4 do do
    do la r
    R2.*3

    %161
    r4 do mib
    re re mib
    re re mib

    %164
    re re r
    R2.*12
    fa2.

    %178
    mi2 mi4
    re mi fa
    fa mi re

    %181
    mi r r
    fa mi re
    mi r r\mbreak

    %184
    fa mi re
    mi8[re] do[mi] re mi
    fa4 mi mi

    %187
    re re4. re8
    mi4 r r
    R2.*3

}

ItestoIII = \lyricmode {

    Dixit _ dixit _ Do -- mi -- nus Do -- mi -- no meo: _ se -- de sede _ ad de - xtris meis _

    se -- de sede _ ad de -- xtris meis _ dixit _ dixit _ Do -- mi -- nus dixit _ dixit _ dixit _ dixit _

    dixit _ Do -- mi -- nus Do -- mi -- no meo: _ se -- de se -- de ad de -- xtris me - is

    ad de -- xtris me -- is ad de - - - xtris me -- is.

    Do -- nec po -- nam i -- ni -- mi -- cos tu - os  scabel - lum pe -- dum tu -- o -- rum

    scabel - lum pe -- dum  pe -- dum tuo - rum.

    Vir -- gam vir -- tu -- tis tu -- ae do - mi -- na - - re in medi - o

    i -- ni -- mi -- co - - - - - - - - - - - - - rum tu -- o - rum.

    Te -- cum prin -- cipi - um prin -- cipi - um in die _ virtu - tis tuæ _  in splen -- do -- ri -- bus

    in splen -- do -- ri -- bus San -- cto -- rum in splen -- do -- ri -- bus San -- cto -- rum  San -- cto -- rum

    dixit _ Do -- mi -- nus dixit _ dixit _  dixit _ Do -- mi -- nus Do -- mi -- no meo: _

    an -- te lu -- cife - rum ge -- nui _ te ge -- nui _ te

    ge -- nui _ te an -- te lu -- cife - rum ge -- nui _ te.

}

Ibasson = \relative do {

    \autoBeamOff
    R2.*28
    do'4 do, r
    r la' fa\mbreak

    %31
    do'4. do,8 do4
    do' do do
    do do, r

    %34
    si'4.(sol8) la[si]
    do4 do, r8 do'
    si4. sol8[la]  si

    %37
    do4 do, r
    re re r
    mi mi r8 mi

    %40
    fa[mi re do'] si[la]
    sol4 sol r
    R2.

    %43
    fad4 fad r
    r r fad?8 fad
    sol8. sol16 sol4 r

    %46
    R2.*3
    r4 re' la
    fad re r

    %51
    R2.*3
    r4 do' sol
    mi do r

    %56
    R2.*3
    r4 fad sol
    re fad? sol

    %61
    re fad sol
    re' re, r
    R2.*10

    %73
    sol2.
    fad
    mi

    %76
    re
    do4 re mi
    do re \parentSlur (do)

    %79
    si r si'
    do8 do re4(do)
    si2 si4

    %82
    do la sol\mbreak
    fad2 sol4~
    sol re2

    %85
    sol4 r r
    R2.*2
    si2.

    %89
    red,
    mi4(fad?) sol
    fad?(sol) la

    %92
    sol(fad?) mi
    red(mi) fad?
    sol(la) si

    %95
    re! do si
    la2.
    R2.*3

    %100
    la4 la la
    fad2.\mbreak
    sol4(fad) mi

    %103
    la la, r
    fad' fad fad
    red2.

    %106
    re!
    do4 si la
    si2 mi4~

    %109
    mi8 mi si2
    mi4 r r
    R2.*21

    %132
    do'2.\tu~
    do4 la fa\mbreak
    do'4. do,8 do4

    %135
    r r fa
    do'4. do,8 do4
    r r r8 si'

    %138
    do4 do, r
    r r8 sol' la si
    do4 do, do8 do

    %141
    re2 re4
    mi2 mi8 mi
    fa[mi re] do si la

    %144
    sol4 sol' do8 la
    sol4. si8 do la
    sol4.(si8) do la

    %147
    sol4 sol r
    R2.*3
    r4 sol re

    %152
    si8. sol16 sol4 r
    R2.*3
    r4 fa' do

    %157
    la fa r
    R2.*3
    r4 si' do

    %162
    sol si do
    sol si do
    sol sol r

    %165
    R2.*10
    do2.
    si4. si8 si4

    %177
    la2.
    sol2 sol4
    fa sol la

    %180
    fa sol fa
    mi r r
    fa sol fa

    %183
    mi r r\mbreak
    fa sol sol
    do8[si] la[sol] fa mi

    %186
    re4 do mi
    fa sol4. sol8
    do,4 r r

    %189
    R2.*3

}

ItestoIV = \lyricmode {

    Dixit _ dixit _ Do -- mi -- nus Do -- mi -- no meo: _ se -- de sede _ ad de - xtris meis _

    se -- de sede _ ad de -- xtris meis _ dixit _ dixit _ Do -- mi -- nus dixit _ dixit _ dixit _ dixit _

    dixit _ Do -- mi -- nus Do -- mi -- no meo: _ se -- de se -- de ad de -- xtris me - is

    ad de -- xtris me -- is ad de - - - xtris me -- is.

    Do -- nec po -- nam i -- ni -- mi -- cos i -- ni -- mi -- cos tu - - os scabel - lum pe -- dum tuo - rum

    scabel - lum pe -- dum  scabel - lum pe -- dum tuo - rum.

    Te -- cum prin -- cipi - um prin -- cipi - um in die _ virtu - tis tuæ _  in splen -- do -- ri -- bus

    in splen -- do -- ri -- bus San -- cto -- rum in splen -- do -- ri -- bus San -- cto -- rum  San -- cto -- rum

    dixit _ Do -- mi -- nus dixit _ dixit _  dixit _ Do -- mi -- nus Do -- mi -- no meo: _

    ex u -- te -- ro an -- te lu -- cife - rum ge -- nui _ te ge -- nui _ te

    ge -- nui _ te an -- te lu -- cife - rum ge -- nui _ te.

}

Ibcn = \relative do {

    do'4 do, r
    r do' do,
    do do, r

    %4
    r fa' fa,
    do' do'8 mi re do
    si4. sol8 la si

    %7
    do4 \once\stemUp do,8 mi' re do
    si4. sol8 la si
    do do, do do do do

    %10
    re' re, re re re re
    mi' mi, mi mi mi mi
    fa' mi re do si la

    %13
    sol4. si8 do la
    sol4. si8 do la\mbreak
    sol4 sol8 fa mi re

    %16
    do4 r r
    R2.*5
    do'4 do, mi

    %23
    fa sol fa
    mi do mi
    fa sol sol,

    %26
    do do, r
    do' do, r
    do' do, r

    %29
    do'' do, r
    r la' fa\mbreak
    do' do, do

    %32
    r la' fa
    do' \once\stemUp do,8 mi' re do
    si4 si,8 sol' la si

    %35
    do4 \once\stemUp do,8 mi' re do
    si4 si,8 sol' la si
    do4 do, r8 do

    %38
    re4 re, r8 re'
    mi4 mi,4 r8 mi'
    fa mi re do si la

    %41
    sol4 sol' r
    sol sol, sol'
    fad fad,? r

    %44
    fad'? fad,? fad'
    sol sol, sol
    R2.*3

    %49
    r4 re'' la
    fad re r
    R2.*3

    %54
    r4 do' sol
    mi do r
    R2.*3

    %59
    r4 fad sol
    re fad? sol
    re fad sol

    %62
    re' re, r
    R2.*9
    r4 re8 do si la

    %73
    r sol' sol sol sol sol
    r fad fad fad fad fad
    r mi mi mi mi mi

    %76
    r re re re re re
    do4 re mi
    do re do

    %79
    si2 si4
    do re do
    si2 si4

    %82
    do la' sol\mbreak
    fad fad sol
    sol, re' re,

    %85
    sol sol sol'
    sol sol, sol'
    sol, r r

    %88
    r sol' mi
    si si' la
    sol fad? mi

    %91
    si2.~
    si~
    si~

    %94
    si
    si
    la

    %97
    si
    do
    R

    %100
    la'4 la la
    fad2.\mbreak
    sol4 fad mi

    %103
    la la, r
    fad'  fad fad
    red2.

    %106
    re!
    do4 si la
    si2 mi4

    %109
    mi, si' si
    mi r r
    r \footnote #' (-1 . 3) \markup\column\smaller {"  "" Il riferimento a ”Palchetto” significa che una parte del coro con il continuo stava in una parte sopraelevata della chiesa""  "} mi ^\markup {\italic Solo Palchetto}do

    %112
    r si' sol
    do fa, fad
    sol re si

    %115
    sol r sol'
    re fad sol
    r fad sol

    %118
    re' la fad
    re r fad\mbreak
    sol si, sol

    %121
    do do' sib
    la dod, la
    re r fad

    %124
    sol re' fad,
    sol, re' fad
    sol, re' fad

    %127
    sol si si,
    do4. re8 mi4
    re mi si'

    %130
    do re re,
    sol sol8\tu fa! mi re
    do4 do' do,

    %133
    r la' fa\mbreak
    do' do, do
    r la' fa

    %136
    do' do,8 mi re do
    si4. sol'8 la si
    do4 do,8 mi re do

    %139
    si4. sol'8 la si
    do do, do do do do
    re re re re re re

    %142
    mi mi mi mi mi mi
    fa mi re do si la
    sol4. si'8 do la

    %145
    sol4. si8 do la
    sol4. si8 do la
    sol4 sol, r

    %148
    R2.*3
    r4 sol' re
    si sol r

    %153
    R2.*3
    r4 fa' do
    la fa r

    %158
    R2.*3
    r4 si do
    sol' si, do

    %163
    sol' si, do
    sol' sol,8 fa' mi re
    do4 r r\mbreak

    %166
    R2.*8
    r4 sol'8 fa mi re
    r do do do do do

    %176
    r si si si si si
    r la la la la la
    r sol sol sol sol sol

    %179
    fa4 sol la
    fa' sol fa
    mi r mi

    %182
    fa sol fa
    mi r mi\mbreak
    fa sol sol,

    %185
    do'8 si la sol fa mi
    re4 do mi
    fa sol sol,

    %188
    do do, do'
    do do, do'
    do do do

    %191
    do r r

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s2.
    s4 <5 6> s
    <3 5>2.
    s
    s
    <6>
    s
    <6>
    s
    <7>
    <6>
    s
    s2 s8 <6+>
    s2 s8 <6+>
    s2.*8
    s4 <4 6> <4 6>
    s2.
    s4 <5 6> <3 5>
    s2.*6
    s4 <6>2
    s2.
    <6>
    s
    <6>
    s
    <6>
    <6>s2 s8 <6+>
    s2.
    s
    <6>
    s2.*5
    s4 <_+> <4 6+>
    <6>2.
    s2.*3
    s2 <4 6>4
    <6>2.
    s2.*3
    s4 <6> <3->
    <_+> s <5 3->
    s2 <3->4
    <_+>2.
    s2.*11
    s8 <2 4>2 s8
    s8 <6>2 s8
    s8 <4 6>2 s8
    <4 6>4 <4 5> <3 6>
    s <4 6> <2 4+>
    <6>2.
    s4 <4 6> <2 4+>
    <6>2.
    <5 3>4 <5> <6>
    <5 6>2.
    s4 <_+>2
    s2.*3
    s4 <6>2
    <3+>2.
    <6>4 <5+> s
    <5> <3+ 6> <7>
    <4 6> <3+ 5+> <6 4>
    <3+ 5+> <4 6> <5+ 7>
    <4 6>2.
    <3! 5! 6+>
    <3 5>
    <6+>
    <6>
    s
    s
    <6>
    <6 4>
    <9>4 <8>2
    <3 5>2.
    <6>
    <2 4+>
    <6>4 <6+> s
    <3+>2.
    s4 <_+>2
    s2.
    s4 <6>2
    s4 <6>2
    <_+>4 <6 8> <5 7>
    <4 6> <4 6> <6>
    s2.
    <3+ 5 7>2 <3 5>4
    s <4 6> <3 5>
    <4 6> <4 6 5> s
    <3+> s <6>
    s2 <7>4 %% inizio p. 12 OOKK
    s2 <6+>4
    <3+>2 <_+>4
    <3+>2.
    s4 <7> <5 6>
    <3 5>8 s \bassFigureExtendersOn <_+ 5 7>4 <5>\bassFigureExtendersOff
    s4 <7> s
    s <3 5!> s
    <9> <6 8> <3 6>
    <3+ 7> <3 5> <6>
    s s <3+> %%% bar 130 OOKK
    s2.
    <3 5>
    s4 <6> s
    <3 5>2.
    s4 <6>2
    s2.
    <6>2 <6>8 <4 6>
    s2.
    s2 <6>8 <5 6>
    <3 5>2.
    <3 7>
    <6>
    s8 <6> <6> <5> <6> <6+>
    s2 s8 <6+>
    s2 s8 <6+>
    s2 s8 <6+>
    s2.*4
    s4 <3 5> <4 6>
    <6>2.
    s2.*3
    s4 <3 5> <4 6>
    <6>2.
    s2.*3
    s4 <6> <3- 5>
    s2 <3->4
    s2 <3->4
    <3 5>2.
    s2.*11
    s8 <2 4> s2
    s8 <6> s2
    s8 <4 6> s2
    <5 6>4 <4 6> <3 6>  %%OOKK
    s <4 6> <4 6>
    <6>2.
    s4 <4 6> <4 6>
    <6>2.
    s4 <4 6> <3 5>
    s2 <6>8 <6>
    <6>2.
    <5 6>4 <3 5>2

}


forma = {

    \time 3/4
    \key do\major
    \tempo 2 = 55
    s2.*191
    \bar "|."

}

IcrI = {
    \notypeset
    <<\IcrIn \forma>>

}

IcrII = {
    <<\IcrIIn \forma>>

}

IobI = {
    <<\IobIn \forma>>

}

IobII = {
    <<\IobIIn \forma>>

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Ivla = {
    \clef alto
    <<\Ivlan \forma>>

}

Isolione = {
    \new Voice = "dixit0"
    <<\Isolionen \forma>>
}

Isolitwo = {
    \new Voice = "dixit0"
    <<\Isolitwon \forma>>
}

Isoprano = {
    \new Voice = "dixit1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "dixit2"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "dixit3"
    <<\Itenoren \forma>>
}

Ibasso = {
    \clef bass
    \new Voice = "dixit4"
    <<\Ibasson \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
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



IIvlIn = \relative do'' {

    <fa, la,>16.\f sol32 fa8 r16 fa_\upl la_\upl sib_\upl <do mi,>16. re32 do8 r16 do\upl re\upl mi\upl
    <fa la,>16. sol32 fa8 r16 la\upl fa\upl re\upl <do fa,>16. re32 do8 r16 fa,_\upl la_\upl do_\upl
    <sib re,>16. do32 sib8~sib16 la sol fa mi fa mi re do sib la sol\mbreak

    %4
    <fa' la,>16.  sol32 fa8 r16 fa_\upl la_\upl sib_\upl <do mi,>16. re32 do8 r16 do\upl re\upl mi\upl
    <fa la,>16. sol32 fa8 r16 la\upl fa\upl re\upl <do fa,>16. re32 do8 r16 fa,_\upl la_\upl do_\upl
    <sib re,>16. do32 sib8 r16 re,_\upl mi_\upl fa_\upl <mi do>16. fa32 mi8 r16 sol_\upl la_\upl sib_\upl

    %7
    <la fa>16. sib32 la8 r16 la\upl si\upl do\upl <si re,>16. do32 si8 r16 fa'\upl re\upl si\upl\mbreak
    do[sol sol sol sol sol sol sol] sol do mi do sol fa mi re
    do8 do do\noBeam r mib'16.\p fa32 mib8~mib16 mib mib mib

    %10
    mib16. fa32 mib8~ mib16 mib mi mi fa16. sol32 fa8~ fa16 fa sol sol
    sol sol sol sol fad fad mi! mi fad re la la la re la la
    la4 r <sib re,>16.\f do32 sib8 r16 sib\upl re\upl mib\upl

    %13
    <fa la,>16. sol32 fa8 r16 fa\upl sol\upl la\upl <sib re,>16. do32 sib8 r16 sib,\upl re\upl mib\upl\mbreak
    <fa sib,>16. sol32 fa8 r16 sib,\upl re\upl fa\upl mib16. fa32 mib8 r16 sol,_\upl la_\upl sib_\upl
    la16. sib32 la8 r16 do\upl re\upl mib\upl <re fa,>16. mib32 re8 r16 re\upl mi\upl fa\upl

    %16
    <mi sib>16. fa32 mi8 r16 sib'\upl sol\upl mi\upl fa[do do do do do do do]
    do fa la fa do sib la sol fa8 fa fa\noBeam r
    fa'16.\p sol32 fa8~ fa16 fa fa fa fa16. sol32 fa8~fa16 fa fa fa

    %19
    fa4~fa16 fa fad fad sol[sol mib mib re re do do]
    re(sol) re re re(sol) re re re4 r

}

IIvlIIn = \relative do'' {

    <fa, la,>16.\f sol32 fa8 r16 fa_\upl la_\upl sib_\upl <do mi,>16. re32 do8 r16 do\upl re\upl mi\upl
    <fa la,>16. sol32 fa8 r16 la\upl fa\upl re\upl <do fa,>16. re32 do8 r16 fa,_\upl la_\upl do_\upl
    <sib re,>16. do32 sib8~sib16 la sol fa mi fa mi re do sib la sol\mbreak

    %4
    <fa' la,>16.  sol32 fa8 r16 fa_\upl la_\upl sib_\upl <do mi,>16. re32 do8 r16 do\upl re\upl mi\upl
    <la, fa>16. sib32 la8 r16 la'\upl fa\upl re\upl <do fa,>16. re32 do8 r16 do,_\upl fa_\upl la_\upl
    sol16. la32 sol8 r16 re_\upl mi_\upl fa_\upl <mi do>16. fa32 mi8 r16 mi_\upl fa_\upl sol_\upl

    %7
    fa16. sol32 fa8 r16 fa_\upl fa_\upl fa_\upl fa16. mi32 fa8 r16 re_\upl fa_\upl fa_\upl
    fa[fa fa fa mi mi re re] mi do' mi do sol fa  mi re
    do8 do do\noBeam r do'16.\p re32 do8~do16 do do do

    %10
    do16. re32 do8~do16 do do do do8 do~do16 do dod dod
    re re sib sib la la sol sol la fad fad fad fad la fad fad
    fad?4 r  <sib re,>16.\f do32 sib8 r16 sib\upl re\upl mib\upl

    %13
    <fa la,>16. sol32 fa8 r16 fa\upl mib\upl do\upl re16. mib32 re8 r16 sib\upl re\upl mib\upl
    <fa sib,>16. sol32 fa8 r16 fa,_\upl sib_\upl re_\upl sol,16. la32 sol8 r16 mib_\upl fa_\upl sol_\upl
    do,16. re32 do8 r16 la'\upl sib\upl do\upl sib16. do32 sib8 r16 sib\upl sib\upl re\upl

    %16
    sib8 sib~sib16\noBeam sol_\upl sib_\upl sib_\upl sib[sib sib sib la la sol sol]
    la fa' la fa do sib la sol fa8 fa fa\noBeam r
    lab16.\p sib32 lab8~lab16 lab lab lab lab16. sib32 lab8~lab16 lab la la

    %19
    \parenthesize sib4~sib16 sib do do do [do do do si si la la]
    si(re) si si si(re) si si si4 r

}


IIobIn = \relative do'' {

    fa, 16.\f sol32 fa8 r16 fa_\upl la_\upl sib_\upl do16. re32 do8 r16 do\upl re\upl mi\upl
    fa16. sol32 fa8 r16 la\upl fa\upl re\upl do16. re32 do8 r16 fa,_\upl la_\upl do_\upl
    sib16. do32 sib8~sib16 la sol fa mi fa mi re do sib' la sol\mbreak

    %4
    fa16.  sol32 fa8 r16 fa_\upl la_\upl sib_\upl do16. re32 do8 r16 do\upl re\upl mi\upl
    fa16. sol32 fa8 r16 la\upl fa\upl re\upl do16. re32 do8 r16 fa,_\upl la_\upl do_\upl
    sib16. do32 sib8 r16 re,_\upl mi_\upl fa_\upl mi16. fa32 mi8 r16 sol_\upl la_\upl sib_\upl

    %7
    la16. sib32 la8 r16 la\upl si\upl do\upl si16. do32 si8 r16 fa'\upl re\upl si\upl\mbreak
    do[sol sol sol sol sol sol sol] sol do mi do sol fa mi re
    R1*3
    r2 sib'16.\f do32 sib8 r16 sib\upl re\upl mib\upl

    %13
    fa16. sol32 fa8 r16 fa\upl sol\upl la\upl sib16. do32 sib8 r16 sib,\upl re\upl mib\upl\mbreak
    fa16. sol32 fa8 r16 sib,\upl re\upl fa\upl mib16. fa32 mib8 r16 sol,_\upl la_\upl sib_\upl
    la16. sib32 la8 r16 do\upl re\upl mib\upl re16. mib32 re8 r16 re\upl mi\upl fa\upl

    %16
    mi16. fa32 mi8 r16 sib'\upl sol\upl mi\upl fa[do do do do do do do]
    do fa la fa do sib la sol fa4 r
    R1*3

}

IIobIIn = \relative do'' {

    fa, 16.\f sol32 fa8 r16 fa_\upl la_\upl sib_\upl do16. re32 do8 r16 do\upl re\upl mi\upl
    fa16. sol32 fa8 r16 la\upl fa\upl re\upl do16. re32 do8 r16 fa,_\upl la_\upl do_\upl
    sib16. do32 sib8~sib16 la sol fa mi fa mi re do sib' la sol\mbreak

    %4
    fa16.  sol32 fa8 r16 fa_\upl la_\upl sib_\upl do16. re32 do8 r16 do\upl re\upl mi\upl
    fa16. sol32 fa8 r16 la\upl fa\upl re\upl do16. re32 do8 r16 do,_\upl fa_\upl la_\upl
    sol16. la32 sol8 r16 re_\upl mi_\upl fa_\upl mi16. fa32 mi8 r16 mi_\upl fa_\upl sol_\upl

    %7
    fa16. sol32 fa8 r16 fa_\upl fa_\upl fa_\upl fa16. mi32 fa8 r16 re_\upl fa_\upl fa_\upl
    fa8 fa mi re mi 16do' mi do sol fa  mi re
    R1*3

    %12
    r2 sib'16.\f do32 sib8 r16 sib\upl re\upl mib\upl
    fa16. sol32 fa8 r16 fa\upl mib\upl do\upl re16. mib32 re8 r16 sib\upl re\upl mib\upl
    fa16. sol32 fa8 r16 fa,_\upl sib_\upl re_\upl sol,16. la32 sol8 r16 mib_\upl fa_\upl sol_\upl

    %15
    do,16. re32 do8 r16 la'\upl sib\upl do\upl sib16. do32 sib8 r16 sib\upl sib\upl re\upl
    sib8 sib~sib16\noBeam sol_\upl sib_\upl sib_\upl sib[sib sib sib la la sol sol]
    la fa' la fa do sib la sol fa4 r

    %18
    R1*3

}

IIvlan = \relative do' {

    r8 la do la r sol mi' sol,
    r la la la r fa' la fa
    r re\noBeam sib'16 la sol fa mi fa mi re do sib la sol\mbreak

    %4
    fa8\noBeam la do la r sol mi' sol,
    r la la' la, r fa' do fa
    r re sol sib, r sol do sol

    %7
    r do fa fa, r fa' re re
    r do do do do16 do' mi do sol fa mi re
    do4 r r2

    %10
    R1*2
    r4re16 mib re do sib8\noBeam re fa re
    r do la do r re re' sib\mbreak

    %14
    r sib sib sib, r sol' sol mib
    r do do la r fa' fa re
    r sib' sol mi! r fa fa fa

    %17
    r16 fa la fa do sib la sol fa8 fa fa8\noBeam r
    R1*3

}

IIsopranon = \relative do'' {

    \autoBeamOff
    R1*8
    r2 do4.^\markup"Palchetto"  do8
    do4. do8 do4. dod8

    %11
    re2 re
    r fa2\tu
    fa,4. sol16[la] sib4. la16[sol]\mbreak

    %14
    fa4 r8 fa sol4. la16[sib]
    la4. la8 sib4. re8
    sib2~sib4(la8) sol

    %17
    la2 r
    lab4.^\markup"Palchetto" lab8 lab4. la8
    sib4. do8 do4 si8[la]

    %20
    si?2 r

}

IItestoI = \lyricmode {

    et non pæni - te -- bit e -- um,

     ju -- ra -- vit Do -- mi -- nus ju -- ra - -  vit Do - - mi -- nus

     et non pæni - te -- bit e - um.

}

IIalton = \relative do' {

    \autoBeamOff
    R1*8
    r2 mib4.^\markup"Palchetto" mib8
    mib4. mi8 fa4. sol8

    %11
    sol4 fad8 [mi] fad2
    R1
    r2 sib\tu

    %14
    sib,4. do16[re] mib4. mib16[re]
    do4 r8 do re4. mi!16[fa]
    fa4. mi8 fa4. do8

    %17
    do2 r
    fa4.^\markup"Palchetto" fa8 fa4. fa8
    fa4. fad8 sol2

    %20
    sol r

}

IItestoII = \lyricmode {

    et non pæni - te -- bit e - um,

     ju -- ra -- vit Do -- mi -- nus ju -- ra - -  vit Do -- mi -- nus

     et non pæni - te -- bit e -- um.

}

IItenoren = \relative do' {

    \autoBeamOff

    R1*4
    fa2\tu fa,4. sol16[la]
    sib4. sib16[la] sol4 r8 sol

    %7
    la4. si16[do] si4. si8
    do4. sol8 sol2
    r2 do4.^\markup"Palchetto" sib!8

    %10
    lab4. sol8 fa lab4 sib8
    sib4 la!8[sol] la2
    R1*2

    %14
    r2 do\tu
    fa, fa
    R1*2

    %18
    fa'4.^\markup"Palchetto" mib8 reb4. do8
    reb?4. mib8 mib4 re8[do]
    re2 r

}

IItestoIII = \lyricmode {

     Ju -- ra -- vit Do -- minus _ ju -- ra - -  vit Do -- minus _

     et non pæni - te - bit e - um,

     ju -- ra -- vit et non pæ -- ni -- te -- bit e - um.

}

IIbasson = \relative do {

    \autoBeamOff
    R1*3
    do'2\tu do,4. re16[mi]
    fa4. mi16[re] do4 r8 do

    %6
    re4. mi16[fa] mi4. mi8
    fa4. la8 fa2~
    fa4(mi8) re mi2

    %9
    R1*6
    r2 sib'2
    sol fa~

    %17
    fa r
    R1*3

}

IItestoIV = \lyricmode {

    Ju -- ra -- vit Do -- minus _ ju -- ra - -  vit Do - - minus _ ju -- ra --  vit

}

IIbcn = \relative do {

    r8 fa\f la fa r mi sol mi
    r re fa re r la do la
    r sol' sib16 la sol fa mi fa mi re do sib la sol\mbreak

    %4
    fa8\noBeam fa' la fa r mi sol mi
    r re fa re r la do la
    r sol sib sol r do mi do

    %7
    r fa la fa r re fa re
    r do do do r16 do' mi do sol fa mi re
    do4 r r8 do'^\markup "Palchetto" do sib

    %10
    r lab lab sol r fa fa mib
    r re re re r re re re
    re4 re16 mib re do sib8\noBeam sib' re sib

    %13
    r la do la r sol sib sol\mbreak
    r re fa re r do mib do
    r fa la fa r sib, re sib

    %16
    r sol sib sol r fa fa fa
    r16 fa' la fa do sib la sol fa4 r
    r8 fa''^\markup"Palchetto" fa mib r reb reb do

    %19
    r sib sib lab r sol sol sol
    r sol sol sol sol4

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 s8 <6> s4
    s8 <5> s4 s8 <6> s4
    s8 <3> s4 s2
    s2 s8 <6> s4
    s8 <3 5> s4 s8 <6> s4
    s8 <3 5> s4 s8 <5> s4
    s2 s8 <6!> s4
    s8 <4> <3 5> <2> s16 <3> s8 s4
    s2 s4 s8 <2 4->
    s8 <3 5-> s <6!>  s <3- 5> s <3 6+>
    s <8 6> <3+ 5!> <2! 4> s <3+ 5> s4
    <_+> <6> <3 5> s
    s8 <6> s4 s8 <5> s4
    s8 <6> s4 s8 <3- 5> s4
    s8 <3 5> s4 s2
    s8 <6!> s4 s8 <4> <3 5> <2>
    s16 <3> s8 s4 s2
    s8 <3-> s4 s8 <3 5-> s <6!>
    s8 <3- 5> s <6+> s <4 6-> <3! 5> <2 4>
    s8 <3! 5>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 34
    s1*20
    \bar "|."

}

IIobI = {
    \notypeset
    <<\IIobIn \forma>>

}

IIobII = {
    <<\IIobIIn \forma>>

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIvla = {
    \clef alto
    <<\IIvlan \forma>>

}

IIsoprano = {
    \new Voice = "iuravit1"
    <<\IIsopranon \forma>>
}

IIalto = {
    \new Voice = "iuravit2"
    <<\IIalton \forma>>
}

IItenore = {
    \new Voice = "iuravit3"
    <<\IItenoren \forma>>
}

IIbasso = {
    \clef bass
    \new Voice = "iuravit4"
    <<\IIbasson \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
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



IIIvlIn = \relative do'' {

    R4.*2
    re16 sol, mi'! sol, fa' sol,
    mi' sol, fa' sol, sol' sol,

    %5
    sol' sol, fa' sol, mi' sol,
    re'8 sol sold\mbreak
    la r r

    %8
    R4.
    mi16 la, fa' la, sol' la,
    fa' la, sol' la, la' la,

    %11
    la' la, sol' la, fa' la,
    mi'8\noBeam la16 la, si dod
    re8\noBeam re16 la sib? do!

    %14
    sib8\noBeam sib'16 fa sol la
    sol8\noBeam fa16 mi mi re
    dod8\noBeam la'16 dod, re mi

    %17
    re8\noBeam dod16 la' sib dod,
    re la' sib sol sol mi
    fa re mi, dod' mi, dod'

    %20
    re re, fa re la' fa
    re'8 r r
    R4.

    %23
    do?16 fa, re' fa, mib' fa,
    re' fa, mib' fa, fa' fa,
    fa' fa, mib' fa, re' fa,

    %26
    do'8\noBeam fa fad
    \once\stemUp <sol sib, re,> r r
    R4.

    %29
    re16 sol, mi'! sol, fa' sol,
    mi' sol, fa' sol, sol' sol,
    sol' sol, fa' sol, mi' sol,

    %32
    re'8 re si
    do8. do16 do8
    la' la sol

    %35
    fa8. fa16 fa8
    sib sib la
    sol16 mi sol mi fa la,

    %38
    sol mi' sol sib, la do
    re[sib] sol8 mi'
    la,16 fa' la fa do fa

    %41
    re sib la fa' sol, sib
    la fa' la fa do fa
    re sib la fa' sol, mi'

    %44
    fa do la do fa do
    fa do la do fa do
   \stemUp  <fa do fa,>8 <fa do fa,> <fa do fa,>

    %47
    <fa do fa,> r r

}

IIIvlIIn = \relative do'' {

    R4.*2
    re16 sol, mi'! sol, fa' sol,
    mi' sol, fa' sol, sol' sol,

    %5
    sol' sol, fa' sol, mi' sol,
    re'8 sol sold\mbreak
    la r r

    %8
    R4.
    mi16 la, fa' la, sol' la,
    fa' la, sol' la, la' la,

    %11
    la' la, sol' la, fa' la,
    mi'8\noBeam la16 la, si dod
    re8\noBeam re16 la sib? do!

    %14
    sib8\noBeam sib'16 fa sol la
    sol8\noBeam fa16 mi mi re
    dod8\noBeam la'16 dod, re mi

    %17
    re8\noBeam dod16 la' sib dod,
    re la' sib sol sol mi
    fa re mi, dod' mi, dod'

    %20
    re re, fa re la' fa
    re'8 r r
    R4.

    %23
    do?16 fa, re' fa, mib' fa,
    re' fa, mib' fa, fa' fa,
    fa' fa, mib' fa, re' fa,

    %26
    do'8\noBeam fa fad
    \once\stemUp <sol sib, re,> r r
    R4.

    %29
    re16 sol, mi'! sol, fa' sol,
    mi' sol, fa' sol, sol' sol,
    sol' sol, fa' sol, mi' sol,

    %32
    re'8 sol, sol
    sol' sol sib,!
    la8. sib16 do8

    %35
    re re do
    sib8. re16 re8
    sol16 mi sol mi fa la,

    %38
    sol mi' sol sib, la do
    re[sib] mi,8 sol
    fa16 fa' la fa do fa

    %41
    re sib la fa' sol, sib
    la fa' la fa do fa
    re sib la fa' sol, mi'

    %44
    fa do la do fa do
    fa do la do fa do
   \stemUp  <fa do fa,>8 <fa do fa,> <fa do fa,>

    %47
    <fa do fa,> r r

}


IIIcrIn = \relative do'' {

    R4.*2
    mi4.
    mi

    %5
    mi
    mi4 r8\mbreak
    R4.*2

    %9
    fa4.
    fa
    fa

    %12
    fa4 r8
    fa4.
    sol!

    %15
    sol
    fa4 r8
    R4.*2

    %19
    fa4.
    re8 re re
    re r r

    %22
    R4.
    re4.
    re

    %25
    re
    re4 r8\mbreak
    R4.*2

    %29
    mi4.
    mi
    mi

    %32
    mi4 r8
    R4.*2
    fa4.

    %36
    R
    r8 r fa
    mi mi fa

    %39
    sol\noBeam mi mi
    fa r la
    sol fa mi

    %42
    fa r la
    sol fa mi
    re fa re

    %45
    re fa re
    re re re
    re r

}

IIIcrIIn = \relative do'' {

    R4.*2
    mi4.
    mi

    %5
    mi
    mi4 r8\mbreak
    R4.*2

    %9
    fa,4.
    fa
    fa

    %12
    fa4 r8
    re'4.
    mi

    %15
    mi
    fa4 r8
    R4.*2

    %19
    fa,4.
    fa8 fa fa
    fa r r

    %22
    R4.
    re4.
    re

    %25
    re
    re4 r8\mbreak
    R4.*2

    %29
    mi'4.
    la,
    la

    %32
    mi'4 r8
    R4.*2
    re4.

    %36
    R
    r8 r re
    la la re

    %39
    mi la,[la]
    re r re
    re re la

    %42
    re r re
    re re la
    fa la fa

    %45
    fa la fa
    fa fa fa
    fa r r

}


IIIobIn = \relative do'' {

    R4.*2
    re8 mi! fa
    mi fa sol

    %5
    sol fa mi
    re r r\mbreak
    R4.*2

    %9
    mi8 fa sol
    fa sol la
    la sol fa

    %12
    mi r r
    la4.~
    la8 sol fa

    %15
    sol4.~
    sol8 la sol
    fa la sib

    %18
    la sib16 sol sol mi
    fa8 mi4
    re16 re, fa re la' fa

    %21
    re'8 r r
    R4.
    do8 re mib

    %24
    re mib? fa
    fa mib re
    do4 r8\mbreak

    %27
    R4.*2
    re8 mi! fa
    mi fa sol

    %31
    sol fa mi
    re4 r8
    R4.

    %34
    la'8 la sol
    fa8. fa16 fa8
    sib sib la

    %37
    sol mi fa
    sol,16 mi' sol sib, la do
    re[sib] sol8 do

    %40
    la16 fa' la fa do fa
    re sib la mi' sol, sib
    la fa' la fa do fa

    %43
    re sib la fa' sol, mi'
    fa do la do fa do
    fa do la do fa do

    %46
    fa8 do do
    do r r

}

IIIobIIn = \relative do'' {

    R4.*2
    sol4.
    mi'!8 re do

    %5
    do si do
    si? r r\mbreak
    R4.*2

    %9
    la4.
    fa'8 mi re
    re dod re

    %12
    dod r r
    la8 sib do
    sib4.~

    %15
    sib8 la sol
    dod4.
    re8 mi dod

    %18
    re4 re8
    re dod4
    re16 re, fa re la' fa

    %21
    re'8 r r
    R4.
    fa,4.

    %24
    re'8 do sib
    sib la sib
    la4 r8\mbreak

    %27
    R4.*2
    sol4.
    mi'!8 re do

    %31
    do si do
    si?4 r8
    sol' sol sib,!

    %34
    la8. sib16 do8
    re re do
    sib8. re16 re8

    %37
    mi sol fa
    sol,16 mi' sol sib, la do
    re[sib] sol8 do

    %40
    la16 fa' la fa do fa
    re sib la mi' sol, sib
    la fa' la fa do fa

    %43
    re sib la fa' sol, mi'
    fa do la do fa do
    fa do la do fa do

    %46
    la8 la la
    la r r

}

IIIvlan = \relative do' {

    R4.*2
    si8 do re
    do re mi

    %5
    mi re do
    si si' r\mbreak
    R4.*2

    %9
    dod,8 re mi
    re mi fa
    fa mi re

    %12
    dod mi la
    la4.
    re,8 sol fa

    %15
    mi fa sol
    mi la sol
    fa la mi

    %18
    la re, re
    re dod mi
    fa re' re,

    %21
    re r r
    R4.
    la8 sib do

    %24
    sib do re
    re do sib
    la la' r\mbreak

    %27
    R4.*2
    si,8 do re
    do re mi

    %31
    mi re do
    si sol fa'
    mi4 r8

    %34
    fa fa mi
    re8. re16 re8
    sol sol fa

    %37
    mi do fa
    mi mi fa
    re do do

    %40
    do do fa
    fa fa mi
    r fa fa

    %43
    fa fa mi
    r fa do
    la fa' do

    %46
    la la la
    la r r

}

IIIcantounon = \relative do'' {

    \autoBeamOff
    sol8 sol sol
    sol4.~
    sol

    %4
    sol~
    sol
    R4.

    %7
    la8 la la
    la4.~
    la

    %10
    la~
    la
    R

    %13
    la8 sib do
    sib4.~
    sib8[la] sol

    %16
    dod4.
    re8 dod dod
    re4 re8

    %19
    re dod4
    re4 r8
    R4.*2

    %23
    do?8 [re] mib
    re [do] sib
    sib  [la] sib

    %26
    la la r\mbreak
    R4.*2
    re8 [mi!] fa

    %30
    mi[re] do
    do[si] do
    si?  si r

    %33
    do do sib!
    \stemDown la la la\stemNeutral
    re re do

    %36
    sib sib sib
    \stemDown sib sib la\stemNeutral
    sol4 la8

    %39
    sib sol4
    la4 r8
   \stemDown  sib  sol sol\stemNeutral

    %42
    la4 r8
    \stemDown sib sol sol\stemNeutral
    la4 r8

    %45
    R4.*3

}

IIIcantoduen = \relative do'' {

    \autoBeamOff

    s4.*32

    %33
    \stemUp do8 do [sib!]
    la4.
    re8 re [do]

    %36
    sib4.
    sib8 sib [la]
    s4.*3
    sib8  [la sol]

    %42
    s4.
    sib8 [la sol]
    s4.

    %45
    R4.*3

}


IIItestoI = \lyricmode {

    Tu es sa -- cer -- dos tu es sa -- cer -- dos

    secun - dum or -- di -- nem Melchi - se -- dech Mel -- chise - dech

     in æ -- ter -- num   in æ -- ter -- num  in æ -- ter -- num   in æ -- ter -- num

     secun - dum or -- di -- nem secun - dum or -- di -- nem

     Mel -- chise - dech Mel -- chise - dech Mel -- chise - dech Mel -- chise - dech.

}

IIItestoIbis = \lyricmode {

    \repeat unfold 24 { \skip 4.}

    Do -- mi -- nus a de -- xtris tuis _ Do -- mi -- nus a de -- xtris tuis _

    con -- fre - git _ _ in di - e _ _ i -- ræ _ su -- æ re - ges re -  - ges re - - ges.

}

IIIaltounon = \relative do' {

    \autoBeamOff
    sol'8 sol sol
    sol4.~
    sol

    %4
    sol\parentSlur (
    sol)
    R4.\mbreak

    %7
    la8 la la
    la4.~
    la

    %10
    la~
    la
    R

    %13
    la~
    la8 sol fa
    sol4.~

    %16
    sol8[la] sol
    fa[la] sib
    la[sib sol]

    %19
    la la4
    la4 r8
    R4.*2

    %23
    \stemDown fa4.
    fa
    fa\stemNeutral

    %26
    fa8 do r\mbreak
    R4.*2
    \stemDown sol'4.

    %30
    sol
    sol\stemNeutral
    sol8 sol r

    %33
    R4.
    \stemDown la8 la sol\stemNeutral
    fa8. fa16 fa8

    %36
    sib sib la
    \stemDown sol4 fa8\stemNeutral
    mi4 fa8

    %39
    sol \grace fa mi4
    fa4 r8
    fa fa mi

    %42
    fa4 r8
    fa fa mi
    fa4 r8

    %45
    R4.*3

}

IIIaltoduen = \relative do' {

    \autoBeamOff

    s4.*22

    %23
    \stemUp fa4 fa8
    fa4 fa8
    fa4 fa8
    s4.
    s4.*2
    sol4 sol8
    sol4 sol8
    sol4 sol8
    s4.*2
    s8 la[sol]
    s4.*2
    sol8 sol4

}

IIItestoII = \lyricmode {

    Tu es sa -- cer -- dos tu es sa -- cer -- dos

    secun - dum or -- di -- nem Mel -- chi - se -- dech

    tu es sa -- cer -- dos tu es sa -- cer -- dos tu es sa -- cer - dos

     secun - dum or -- di -- nem

     Mel -- chise - dech Mel -- chise - dech Mel -- chise - dech.

}

IIItestoIIbis = \lyricmode {

   \repeat unfold 21 { \skip 4.}

   Domi -- nus_a dextris tuis _ Domi -- nus_a dextris tuis _

    con -- fre - - git _ in di - e___iræ _ su -- æ re - ges re -  - ges re - - ges.

}

IIItenoreunon = \relative do' {

    \autoBeamOff
    R4.*2
    re8[mi] fa8
    mi[re] do

    %5
    do[si] do
    si? si r
    R4.*2

    %9
    mi8[fa] sol
    fa[mi] re
    re[dod] re

    %12
    dod dod r
    re4.~
    re8 mi fa

    %15
    mi4.~
    mi8[fa] mi
    re[mi] mi

    %18
    fa[re sol]
    fa mi4
    fa r8

    %21
    R4.*2
    la,8 [sib] do
    sib[do] re

    %25
    re[do] sib
    fa' fa, r\mbreak
    R4.*2

    %29
    si8[do] re
    do[re] mi
    mi[re] do

    %32
    sol' sol, r
    mi' mi do
    do8. do16 do8

    %35
    fa fa mi
    re8. re16 re8
    do do do

    %38
    do4 do8
    re do4
    do r8

    %41
    re do do
    re4 r8
    re do do

    %44
    do4 r8
    R4.*3

}

IIItenoreduen = \relative do' {

    \autoBeamOff
    s4.*32

    %33
    \stemUp
    mi8 mi [re]
    do8. do16 s8
    s4.
    re
    do8 do4
    s4.*10

}

IIItestoIII = \lyricmode {

    In æ -- ter -- num   in æ -- ter -- num  in æ -- ter -- num   in æ -- ter -- num

     se -- cun -- dum or -- di -- nem

     Mel -- chi - se -- dech

      in æ -- ter -- num  in æ -- ter -- num   in æ -- ter -- num  in æ -- ter -- num

       se -- cun -- dum or -- di -- nem  se -- cun -- dum or -- di -- nem

     Mel -- chi -- se -- dech Mel -- chi -- se -- dech Mel -- chi -- se -- dech Mel -- chi -- se -- dech.

}

IIItestoIIIbis = \lyricmode {

     \repeat unfold 27 { \skip 4.}

    Do -- mi -- nus a de -- xtris tuis _ Do -- mi -- nus a de -- xtris tuis _

    con -- fre - - git _ in di - e _ _ i -- ræ _ su -- æ re - ges re -  - ges re - - ges.

}

IIIbassounon = \relative do {

    \autoBeamOff
    R4.*2
    si8[do] re
    do[re] mi

    %5
    mi[re] do
    sol' sol, r\mbreak
    R4.*2

    %9
    dod8[re] mi
    re[mi] fa
    fa[mi] re

    %12
    la' la, r
    fa'4.
    sol8[mi] re

    %15
    mi[fa] sol
    la4.
    sib8 la sol

    %18
    fa[sol] sib
    la4 la8
    re,4 r8

    %21
    fa fa fa
    \once\tieDown fa4. ~
    fa

    %24
    fa~
    fa4 r8
    R4.

    %27
    sol8 sol sol
    \tieDown sol4.~
    sol

    %30
    sol~
    sol
    R4.*2

    %34
    fa8 fa mi
    re8. re16 re8
    sol sol fa

    %37
    mi4 fa8
    do4 fa8
    sib do4

    %40
    fa, r8
    sib do do,
    fa4 r8

    %43
    sib do do,
    fa4 r8
    R4.*3

}

IIIbassoduen = \relative do {

    \autoBeamOff
    s4.*21

    %22
    \stemUp
    fa4 fa8
    fa4 fa8
    s4.*4
    sol4 sol8
    sol4 sol8
    sol4 sol8
    s4.*3
    fa8 fa4
    re4.
    s8 sol[fa]
    mi8 mi fa

}

IIItestoIV = \lyricmode {

    In æ -- ter -- num   in æ -- ter -- num  in æ -- ter -- num   in æ -- ter -- num

     se -- cun -- dum or -- di -- nem

     Mel -- chi -- se -- dech Mel -- chi -- se -- dech

     tu es sa -- cer -- dos tu es sa -- cer -- dos

      se -- cun -- dum or -- di -- nem  se -- cun -- dum or -- di -- nem

     Mel -- chi -- se -- dech Mel -- chi -- se -- dech Mel -- chi -- se -- dech.

}

IIItestoIVbis = \lyricmode {

    \repeat unfold 30 { \skip 4.}

    Do - mi -- nus__a___dextris tuis Do - mi -- nus__a___dextris tuis

    con -- fre - git _ _ in di - e_____iræ _  su -- æ re - ges re -  - ges re - - ges.

}

IIIbcn = \relative do {

    \clef violin sol''8 sol sol
    sol4.
    \clef bass si,,8 do re

    %4
    do re mi
    mi re do
    sol' sol, r\mbreak

    %7
    \clef violin la'' la la
    la4.
    \clef bass dod,,8 re mi

    %10
    re mi fa
    fa mi re
    la' la, r

    %13
    fa'4.
    sol8 mi re
    mi fa sol

    %16
    la4.
    sib8 la sol
    fa sol sib

    %19
    la la, la
    re re' re,
    re r r

    %22
    R4.
    fa8 fa, r
    sib' sib, r

    %25
    re do sib
    fa' fa, r
    R4.*2

    %29
    sol'8 sol, r
    do' do, r
    mi re do

    %32
    sol' sol, fa'
    mi4 r8
    fa fa mi

    %35
    re8. re16 re8
    sol sol fa
    mi do fa

    %38
    do do' fa,
    sib do do,
    fa fa, la

    %41
    sib do do,
    fa' fa, la
    sib do do,

    %44
    fa fa' fa,
    fa fa' fa,
    fa fa fa

    %47
    fa r r

}

IIIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown
    s4.*2
    <6>4 <6>8\bassFigureExtendersOff
    <3>4.
    <6>
    <3!>
    s
    s
    <6>
    s
    <6>
    <3+>
    <6>
    <9>8 <3 5> <3>
    <5>4.
    <3+ 7>
    <5>
    <6>
    <4 6>8 <8 5>4
    s4.*3
    <5>4.
    <5>
    <6>
    <3>
    s4.*2
    <_!>4.
    s
    <6>8 <6!>4
    <3!>4.
    <6>
    <3 5>4 <2 4 6>8
    \bassFigureExtendersOn <3- _ 5>4 <_>8\bassFigureExtendersOff
    <5 6>4 <6 7>8
    s4.
    <6>8 <3>4

}


forma = {

    \time 3/8
    \key fa\major
    \tempo 4. = 60
    s4.*47
    \bar "|."

}

IIIcrI = {
    \notypeset
    <<\IIIcrIn \forma>>

}

IIIcrII = {
    <<\IIIcrIIn \forma>>

}

IIIobI = {
    <<\IIIobIn \forma>>

}

IIIobII = {
    <<\IIIobIIn \forma>>

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>

}

IIIcantouno = {
    \new Voice = "tu1"
    <<\IIIcantounon \forma>>
}

IIIcantodue = {
    \new Voice = "tu1"
    <<\IIIcantoduen \forma>>
}

IIIaltouno = {
    \new Voice = "tu2"
    <<\IIIaltounon \forma>>
}

IIIaltodue = {
    \new Voice = "tu2"
    <<\IIIaltoduen \forma>>
}

IIItenoreuno = {
    \new Voice = "tu3"
    <<\IIItenoreunon \forma>>
}

IIItenoredue = {
    \new Voice = "tu3"
    <<\IIItenoreduen \forma>>
}

IIIbassouno = {
    \clef bass
    \new Voice = "tu4"
    <<\IIIbassounon \forma>>
}

IIIbassodue = {
    \clef bass
    \new Voice = "tu4"
    <<\IIIbassoduen \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
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



IVvlIn = \relative do'' {

    sib4 fa sol4. fa8
    mib re do sib fa'4 fa
    sib' fa8.\tr mib32 fa sol8 sol, sol' fa

    %4
    mib re do sib la16 [do fa do fa do fa do]
    la[do fa do fa do fa do] sib[re fa re fa re fa re]
    do[mib do' mib, do' mib, do' mib,] re8 sib' r8 fa16 lab

    %7
    sol8 sib r do,16 mib re8 fa r sib,16 re
    do[sol' fa mib re do sib la?] sib8\p sib' r fa16 lab
    sol8 sib r do,16 mib re8 fa r sib,16 re

    %10
    do[sol' fa mib re do sib la] sib\f fa' sib fa sol sib, mib sol,\mbreak
    fa8 fa'16 sib, do4\tr sib8 fa sib,\noBeam r
    sib'4\p fa sol4. fa8

    %13
    mib re do sib fa'4 fa
    sib' fa8.\tr mib32 fa sol8 sol, sol' fa
    mib re do sib la fa' fa,4

    %16
    r8 do' fa la sol4 do,~
    do8 sol' la sib la4 fa,
    r8 do' fa la sol4 do,~

    %19
    do8 sol' la sib la fa, la do
    fa4 do r do\mbreak
    fa8 r sib, r la fa'4 do8

    %22
    sib la sol la sol8. do,16\f mi do sol' mi
    do'4 r r do\p
    r sib r sib

    %25
    la do r8 la_\upl sib_\upl sol_\upl
    la4 do r8 la_\upl sib_\upl sol_\upl
    la fa' r do16 mib! re8 fa r sol,16 sib

    %28
    la8 do r fa,16 la sol[re' do sib la sol fa mi]
    fa8 fa' r do16 mib! re8 fa r sol,16 sib
    la8 do r fa,16 la sol[re' do sib la sol fa mi]

    %31
    fa8 fa'4\f do16\p sib\mbreak la8 sib \grace la sol4
    do8 re4\f do16\p sib la8 do\upl re\upl sib\upl
    la16 \f [fa' la, fa' la, fa' la, fa'] sol,[mi' sol, mi' sol, mi' sol, mi']

    %34
    fa,8 fa'4 mi16 re do8[la sib la16 sol]
    la8 fa'4 mi16 re do8[la sib la16 sol]
    fa8 do la\noBeam r fa'4 do\p

    %37
    re4. do8 sib do re mi
    fa do' \grace sib la4 sib' fa8.\tr mib32 fa
    sol4. la8 mib re do sib

    %40
    la16\f\noBeam do\p[do do do do do do] do\upl\f\noBeam do\p[do do do do do do]
    do\upl\f\noBeam do\p[do do do do do do]\mbreak do[do do do do do do do]
    sib\f\noBeam sib\p[sib sib sib sib sib sib] sib\f\noBeam sib\p[sib sib sib sib sib sib]

    %43
    <sib sol>\f\noBeam <sib sol>\p[<sib sol> <sib sol> <sib sol> <sib sol> <sib sol> <sib sol>] <sib sol>[<sib sol> <sib sol> <sib sol> <sib sol> <sib sol> <sib sol> <sib sol>]
    la\f [do fa do fa do fa do] la\p[do fa do fa do fa do]
    sib\f[re fa re fa re fa re] do\p[mib do' mib, do' mib, do' mib, ]

    %46
    re\f[fa sib fa sib fa sib fa] re8\p [fa fa lab]
    lab? r lab, r fa' r lab, r
    sol4 sol'\upl sol\upl sol,\upl

    %49
    r sol'\upl sol\upl sol,\upl
    r fa'\upl fa\upl fa,\upl
    r fa'\upl fa\upl fa,\upl

    %52
    r mib'\upl mib\upl mib,\upl\mbreak
    r do'\upl do\upl mib,\upl
    r re'\upl fa\upl lab,\upl

    %55
    sol do16 do do do do do do do mib mib mib mib
    re8 fa sol mib re4 do
    re8\pf sib' r fa16 lab sol8 sib r do,16 mib

    %58
    re8\p fa r sib,16 re do[sol' fa mib re do sib la]
    sib8\pf sib' r fa16 lab sol8 sib r do,16 mib
    re8 fa r sib,16 re do[sol' fa mib re do sib la]

    %61
    sib8 fa'4\f mib8\p re mib \grace re do4
    re8 fa4\f mib8\p re mib \grace re do4\mbreak
    re8\upl\f [sib'16\upl fa\upl mib8\upl re\upl] do\upl fa\upl re\upl sib'\upl

    %64
    do, sib' do, la' sib,16 fa' sib fa sib fa sol lab
    sol mib re do fa8 la, sib16 fa' sib fa sib fa sol lab
    sol mib re do fa8 la, sib re16 sib fa'8 fa16 re

    %67
    \stemUp sib'8 <sib re, fa,> <sib re, fa,> <sib re, fa,> <sib re, fa,>4 r

}

IVvlIIn = \relative do'' {

    sib4 fa sol4. fa8
    mib re do sib fa'4 fa
    sib' fa8.\tr mib32 fa sol8 sol, sol' fa

    %4
    mib re do sib fa16[la do la do la do la]
    fa[la do la do la do la] fa[sib re sib re sib re sib]
    mib,[do' mib do mib do mib do] re8 sib' r8 fa16 lab

    %7
    sol8 sib r do,16 mib re8 fa r sib,16 re
    do[sol' fa mib re do sib la?] sib8\p sib' r fa16 lab
    sol8 sib r do,16 mib re8 fa r sib,16 re

    %10
    do[sol' fa mib re do sib la] sib\f fa' sib fa sol sib, mib sol,\mbreak
    fa8 fa'16 sib, do4\tr sib8 fa sib,\noBeam r
    sib'4\p fa sol4. fa8

    %13
    mib re do sib fa'4 fa
    sib' fa8.\tr mib32 fa sol8 sol, sol' fa
    mib re do sib la fa' fa,4

    %16
    r8 la do fa do4 mi,8 fa
    sol mi' fa sol fa4 fa,
    r8 la do fa do4 mi,8 fa

    %19
    sol mi' fa sol \once\stemDown fa do, fa la
    do4 la r la\mbreak
    la8 r sol r fa la4 la8

    %22
    sol fa mi fa mi8. do16\f mi do sol' mi
    do'4 r r fa,\p
    r sol4 r sol

    %25
    fa4 la r8 fa_\upl sol_\upl mi_\upl
    fa4 la r8 fa_\upl sol_\upl mi_\upl
    fa fa' r do16 mib! re8 fa r sol,16 sib

    %28
    la8 do r fa,16 la sol[re' do sib la sol fa mi]
    fa8 fa' r do16 mib! re8 fa r sol,16 sib
    la8 do r fa,16 la sol[re' do sib la sol fa mi]

    %31
    fa8 sib4\f la16\p[sol]\mbreak fa8 sol \grace fa mi4
    fa8 sib4\f la16\p sol fa8 la_\upl sib_\upl sol_\upl
    fa16\f[la fa la fa la fa la] mi[sol mi sol mi sol mi sol]

    %34
    fa8 re'4 do16 sib la8 [fa sol fa16 mi]
    fa8 re'4 do16 sib la8 [fa sol fa16 mi]
    fa8 do la\noBeam r fa'4 do\p

    %37
    re4. do8 sib do re mi
    fa do' \grace sib la4 sib' fa8.\tr mib32 fa
    sol4. la8 mib re do sib

    %40
    <la fa>16\noBeam\f la\p[la la la la la la] sol\noBeam\f sol\p[sol sol sol sol sol sol]
    <la fad>\f\noBeam <la fad>\p[<la fad> <la fad> <la fad> <la fad> <la fad> <la fad>]\mbreak  la[la la la la la la la]
    re,\f\noBeam re\p[re re re re re re] fa?\f\noBeam fa\p[fa fa fa fa fa fa]  %% fin qui

    %43
    sol\f\noBeam sol\p[sol sol sol sol sol sol] mi\f\noBeam mi\p[mi mi mi mi mi mi]
    do\f[fa la fa la fa la fa] do\p[fa la fa la fa la fa]
    fa\f[sib re sib re sib re sib] mib,?\p[do' mib do mib do mib do]

    %46
    fa,\f[sib re sib re sib re sib] fa8\p [re' re fa]
    fa r fa, r lab r fa r
    r4 sib\upl sib\upl sib,_\upl

    %49
    r4 sib'\upl sib\upl sib,_\upl
    r4 sib'\upl sib\upl sib,_\upl
    r4 sib'\upl sib\upl sib,_\upl

    %52
    r4 sol'\upl sol\upl sol,_\upl\mbreak
    r la'_\upl la_\upl do,_\upl
    r fa_\upl lab_\upl fa_\upl

    %55
    mib mib16 mib mib mib la! la la la do do do do
    fa,8 re' mib sib sib4 la
    sib8\pf sib' r fa16 lab sol8 sib r do,16 mib

    %58
    re8\p fa r sib,16 re do[sol' fa mib re do sib la]
    sib8\pf sib' r fa16 lab sol8 sib r do,16 mib
    re8 fa r sib,16 re do[sol' fa mib re do sib la]

    %61
    sib8 re4\f do8\p sib sol \grace sib la4
    sib8 re4\f do8\p sib sol \grace sib la4\mbreak
    sib8\f\upl re\upl do\upl sib\upl la\upl do\upl sib\upl re\upl

    %64
    fa, re' la do sib16 fa' sib fa sib fa sol lab
    sol mib re do fa8 la, sib16 fa' sib fa sib fa sol lab
    sol mib re do fa8 la, sib re16 sib fa'8 fa16 re

    %67
    \stemUp sib'8 <sib re, fa,> <sib re, fa,> <sib re, fa,> <sib re, fa,>4 r

}
IVvlan = \relative do' {

    sib'4 fa sol4. fa8
    mib re do sib fa' mib re do
    re4 sib sib sib'8 la

    %4
    sib4 sol do,8 do do do
    do do do do re re re re
    fa fa fa fa fa r sib r

    %7
    sib r fa r fa r fa r
    sol r fa r re\p r sib' r
    sib r fa r fa r fa r

    %10
    sol r fa r fa\f r sib4\mbreak
    la8 sib4 la8 sib4 r
    sib fa sol4. fa8

    %13
    mib re do sib fa'  mib re do
    sib4 re mib mib8 fa
    sol4 mib fa8 sib la sol

    %16
    fa, r fa' r mi do' sol fa
    mi4 do fa8 do' la sol
    fa r fa r mi do' sol fa

    %19
    mi?4 do fa8 fa do la
    fa4 fa' r fa\mbreak
    la,8 r do r fa do la fa

    %22
    sib4. si8 do do' sol mi
    do4 sib? la r
    sol r do r

    %25
    fa fa, r do'
    fa fa, r do'
    fa8 r la r sib r mi, r

    %28
    fa r la, r sib r do r
    fa r la, r sib r mi r
    fa r fa, r sib r do r

    %31
    la r sib r\mbreak do r do, r
    la' r sib r  fa' fa sib, sib
    do do do do do, do do do

    %34
    fa'4 sib fa8 re' sib do
    fa,4 sib fa8 re'sib \parenthesize do
    fa,4 r fa la

    %37
    sib sib,8 la sol4 sol'
    fa8 mib! re do sib4 re
    mib8 sib mib re do4 sol'

    %40
    fa8\upl\f\noBeam fa\p fa fa mib\f\upl\noBeam mib\p mib mib
    re\f\upl\noBeam re\p re re\mbreak fad fad fad fad
    <<sol\f\parenthesize\upl\\{sol sol\p sol sol}>> re\f\parenthesize\upl \noBeam re\p re re

    %43
    mi\f\noBeam\parenthesize\upl mi \p mi mi do do do do
    fa\f fa fa fa mib!\p mib mib mib
    re\f re re re la\p la la la

    %46
    sib\f sib sib sib sib\p sib sib sib
    sib4 sib' r sib,
    mib mib, r mib'

    %49
    mib mib, r mib'
    re re, r re'
    re re, r re'

    %52
    do do, r do'\mbreak
    la fa r fa
    sib sib' r sib,

    %55
    mib do fa la,
    sib mib fa8 fa fa, fa
    sib r re r mib r la, r

    %58
    sib r re r mib r fa r
    sib, r re r mib r la, r
    sib r re r mib r fa r

    %61
    sib, r fa' r sol mib fa fa,
    sib r fa' r sol  mib fa fa,\mbreak
    sib\f sib mib mib fa4 sib

    %64
    fa fa, re'8 r fa r
    sib, r la do re r fa r
    sib, r la do re fa re re

    %67
    re sib' fa re sib4 r

}

IVbassoIn = \relative do {

    \autoBeamOff
    R1*11
    sib'4 fa sol4. fa8
    mib [re] do[sib] fa'4 fa

    %14
    R1*2
    do'4. re8 do2~
    do8 sol la sib la4 fa

    %18
    R1*2
    r4 do'\mbreak re8[sib]do4~\mbreak
    do8[la] sib[sol] la4. do8

    %22
    sib[sol] sol la la4 sol
    r2 r8 fa sol la
    sib2~sib8 sol la sib

    %25
    la8.[sib16 la8. sib16] do8[ la sib sol]
    la8.[sib16 la8. sib16] do8[ la sib sol]
    la4 r8 do re sib r4

    %28
    la8 do do la sol2
    la4 r8 do re sib r4
    la8 do do la sol2

    %31
    do8 re4 do16 [sib] \mbreak la8[sib] sol4
    do8 re4 do16[sib] la8[do re] sib
    la2 sol\tr

    %34
    fa4 r r2
    R1*3
    r2 sib4 fa

    %39
    sol4. fa8 mib![re] do[sib]
    fa'4 fa r do'
    do re,~\mbreak re8[la'] sib do

    %42
    sib4 sol r2
    R1
    r2 r4 la

    %45
    sib fa r2
    r r4 sol
    lab4. lab8 lab do sib lab

    %48
    sol4. sib8 mib[sib sol sib]
    mib,4 r r2
    r4 r8 sib' re[sib sol sib]

    %51
    re,4 r r2
    r4 r8 sol do[sol mib sol]\mbreak
    do,4 r r2

    %54
    r8 fa4 fa lab fa8
    sol do4 do do mib8
    re[sib] sol [sib] re,4 do

    %57
    sib r8 sib' sib sol r4
    sib8 re re sib sib4 la
    sib4 r8 sib sib sol r4

    %60
    sib8 re re sib sib4 la
    sib8 re4 do8 sib[sol] \grace sib la4
    sib8 re4 do8 sib[sol] \grace sib la4\mbreak

    %63
    sib8 re do sib la4 sib
    sib la sib r
    R1*3

}

IVtestoI = \lyricmode {

    Do -- mi -- nus a de -- xtris tuis _ Do -- mi -- nus a de -- xtris tuis _

    con -- fre - - - - - git in di -- e in di -- e i -- ræ su -- æ re - - - ges

    in di -- e i -- ræ su -- æ re -- ges in di -- e i -- ræ su -- æ re - - - - - - - - - ges re - ges.

    Do -- mi -- nus a de -- xtris tuis _ con -- fre - git in di -- e

    con -- fre --  git in di -- e i -- ræ su -- æ re - - - - - - - - - - - - - - - - - - - ges re - ges

    in di -- e i -- ræ su -- æ re - ges in di -- e i -- ræ su -- æ re - - - - - - - - - - - - ges

    i -- ræ su -- æ re - ges.

}

IVbassoIIn = \relative do {

    \autoBeamOff
    R1*13
    sib'4 fa sol4. fa8
    mib [re] do[sib] fa'4 fa

    %16
    R1*2
    do'4. re8 do2~
    do8 sol la sib la4 fa

    %20
    r la sib8[sol] la4~\mbreak
    la8[fa] sol[mi] fa4. la8
    sol[fa] mi fa fa4 mi

    %23
    r8 do re mi fa2~
    fa8[re mi] fa mi4 fa8[sol]
    fa8.[sol16 fa8. sol16] la8[fa sol mi]

    %26
    fa8.[sol16 fa8. sol16] la8[fa sol mi]
    fa4 r8la sib fa r4
    fa8 la la fa sib,4 do

    %29
    fa r8 la sib fa r4
    fa8 la la fa sib,4 do
    fa8 sib4 la16[sol] fa8[sol] mi4

    %32
    fa8 sib4 la16[sol] fa8[la sib] sol
    fa2 mi\tr
    fa4 r r2

    %35
    R1
    r2 fa4 do
    re4. do8 sib[do] re[mi]

    %38
    fa4 fa, r2
    R1*3
    r2 r4 sib'

    %43
    sib do,~do8[sol'] la sib
    la4 fa r2
    r r4 do'

    %46
    re sib r re,
    fa4. fa8 fa lab sol fa
    mib?4 r r2

    %49
    r4 r8 sib' mib [sib sol mib]
    fa4 r r2
    r4 r8 do' re[sib fa re]

    %52
    mib4 r r2\mbreak
    r4 r8 la do[la mib do]
    re re4 re fa re8

    %55
    mib la!4 la la do8
    sib[re,] mib[sol] fa2
    sib,4 r8 fa' sol mib r4

    %58
    re8 fa fa re do2
    re4 r8 fa sol mib r4
    re8 fa fa re do2

    %61
    sib8 fa'4 mib8 re[mib] do4
    re8 fa4 mib8 re[mib] do4\mbreak
    re8 fa mib re do4 re

    %64
    fa2 sib,4 r
    R1*3

}

IVtestoII = \lyricmode {

    Do -- mi -- nus a de -- xtris tuis _ Do -- mi -- nus a de -- xtris tuis _

    con -- fre - - - - - git in di -- e in di -- e i -- ræ su -- æ re - - - ges

    in di -- e i -- ræ su -- æ re - ges in di -- e i -- ræ su -- æ re - - - - - - - - - - ges re - ges.

    Do -- mi -- nus a de -- xtris tuis _ con -- fre - git in di -- e

    con -- fre --  git in di -- e i -- ræ su -- æ re - - - - - - - - - - - - - - - - - - - ges re -- ges

    in di -- e i -- ræ su -- æ re -- ges in di -- e i -- ræ su -- æ re - - - - - - - - - - - ges

    i -- ræ su -- æ re -- ges.

}

IVbcn = \relative do {

    sib'4 fa sol4. fa8
    mib re do sib fa' mib re do
    sib4 re mib4. fa8

    %4
    sol4 mib fa8 fa fa fa
    mib mib mib mib re re re re
    la la la la sib r re r

    %7
    mib r la, r sib r re r
    mib r fa r sib,^\p r re r
    mib r la, r sib r re r

    %10
    mib r fa r re4^\f mib\mbreak
    fa8 re mib fa sib,4 r
    sib' fa sol4. fa8

    %13
    mib re do sib fa'  mib re do
    sib4 re mib mib8 fa
    sol4 mib fa8 sib la sol

    %16
    fa, r fa' r mi do' sol fa
    mi4 do fa8 do' la sol
    fa r fa r mi do' sol fa

    %19
    mi?4 do fa8 fa do la
    fa4 fa' r fa\mbreak
    la,8 r do r fa do la fa

    %22
    sib4. si8 do do' sol mi
    do4 sib? la r
    sol r do r

    %25
    fa fa, r do'
    fa fa, r do'
    fa8 r la r sib r mi, r

    %28
    fa r la, r sib r do r
    fa r la, r sib r mi r
    fa r fa, r sib r do r

    %31
    la r sib r\mbreak do r do, r
    la' r sib r  fa' fa sib, sib
    do do do do do, do do do

    %34
    fa'4 sib fa8 re' sib do
    fa,4 sib fa8 re'sib \parenthesize do
    fa,4 r fa la

    %37
    sib sib,8 la sol4 sol'
    fa8 mib! re do sib4 re
    mib8 sib mib re do4 sol'

    %40
    fa8\upl^\f\noBeam fa^\p fa fa mib^\f\upl\noBeam mib^\p mib mib
    re^\f\upl\noBeam re^\p re re\mbreak fad fad fad fad
    <<sol^\f\parenthesize\upl\\{sol sol^\p sol sol}>> re^\f\parenthesize\upl \noBeam re^\p re re

    %43
    mi^\f\noBeam\parenthesize\upl mi ^\p mi mi do do do do
    fa^\f fa fa fa mib!^\p mib mib mib
    re^\f re re re la^\p la la la

    %46
    sib^\f sib sib sib sib^\p sib sib sib
    sib4 sib' r sib,
    mib mib, r mib'

    %49
    mib mib, r mib'
    re re, r re'
    re re, r re'

    %52
    do do, r do'\mbreak
    la fa r fa
    sib sib' r sib,

    %55
    mib do fa la,
    sib mib fa8 fa fa, fa
    sib r re r mib r la, r

    %58
    sib r re r mib r fa r
    sib, r re r mib r la, r
    sib r re r mib r fa r

    %61
    sib, r fa' r sol mib fa fa,
    sib r fa' r sol  mib fa fa,\mbreak
    sib\f sib mib mib fa4 sib

    %64
    fa fa, sib8 r re r
    mib r fa r sib, r re r
    mib r fa r sib, sib' sib, sib

    %67
    sib sib' fa re sib4 r

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <5>
    s4 <6>8 <5> s4 <6>8 <6>
    s4 <6> s2
    <6>4 <5 6> <3>2
    <2 4> <6>
    <5 6>1
    s4 <5 6> s <6>
    <6>2 s4 <6>
    s <5 6> s <6>
    <6>2 <6>
    <3>8 <6> <6 5> <3 5> s2
    s <5>
    <5>8 <6> <5> s s4 <6>8 <6>
    s4 <6> s2
    <6>4 <6> s2
    s <6>
    <6>4 <_!> s2
    s <6>
    <6>1
    s
    s4 <3!> s2
    s4. <5 7>8 <4 6>2
    s4 <2 4+> <6>2
    <7> <3! 7>
    <3 5> s4 <3!>
    s2 s4 <3!>
    s2 s4 <5 6>
    s <6> <6> <3!>
    s <6>  s <4 6>
    s2 <6>4 <3!>
    <6>2 <4 6>4 <3!>
    <6>1
    <4 6>2 <3! 5>
    s2 s4 s8 <3!>
    s1
    s2 s4 <6>
    s s8 <6> <5>4 <5>8 <6!>
    s4 <6>8 <6> s4 <6>
    s4 s8 <6> s4 <6>8 <5>
    <3 5>2 <3 6>
    <3+ 7> <5 6>
    <3 5> <6>
    <5> <3! 5 7>
    s <2 4>
    <6>1
    s1*4
    <6>1
    s
    <5>
    <6>
    s2 s4 <5 7->
    <5> <6> s2
    s <4>4 <3>s <6> s <5 6>
    s <6> <5 6> <3 5>
    s <6> s <5 6>
    s <6> <5 6> s
    s <4 6>8 <3 5> <3 5>2
    s4 <4 6>8 <3 5> <3 5>2
    s1
    <4>4 <3 5> s <5>

}


forma = {

    \time 4/4
    \key sib\major
    \tempo 2 = 55
    s1*67
    \bar "|."

}

IVvlI = {
    \notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}

IVbassoI = {
    \clef bass
    \new Voice = "dominus1"
    <<\IVbassoIn \forma>>
}

IVbassoII = {
    \clef bass
    \new Voice = "dominus2"
    <<\IVbassoIIn \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
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



VvlIn = \relative do'' {

    re8\p re re re mib mib mib mib
    fad fad fad fad sol re re re
    dod dod dod dod re(do) sib sib

    %4
    la la la la sib re re re\mbreak
    mib mib mib mib fad fad fad fad
    sol re re re re re re re

    %7
    re re do do re\f re re re
    mib mib mib mib re re re re
    dod dod dod dod re sib la sol

    %10
    la la la la si si si si
    do do do do do do do do
    re fa4\f mib16\p re do8 mib4\f re16\p do

    %13
    re8 fa4\f mib16\p re do8 mib4\f re16\p do
    re8 fa sol mib re re do do\mbreak
    re re re re mi mi mi mi

    %16
    fa do do do do do do do
    si si si si do si do do
    re do do si do mib mib mib

    %19
    mib do re mib re re re re
    dod dod dod dod re mib4\f re16\p do?
    sib8 re4\f do16 \p sib la8 mib' re do

    %22
    sib sib la la sib sib sib sib
    sib sib sib sib la re re dod
    sib sib sib sib la la la la

    %25
    sib sib sib sib\mbreak la la la la
    sib do sib la sib re re sib
    la la la la la4 r

}

VvlIIn = \relative do'' {

    sib8\p sib sib sib do do do do
    do mib(re) do sib sib sib sib
    sib sib(la) sol fad fad sol sol

    %4
    sol sol fad fad sol\noBeam sib sib sib\mbreak
    do do do do do mib(re) do
    sib sib sib sib la la la la

    %7
    sol sol sol sol fad\f fad fad fad
    <la fad?> <la fad> <la fad> <la fad> <sib sol> <sib sol> <sib sol> <sib sol>
    sol sol la <sib sol> <sib sol> <sib sol> fad mi

    %10
    fad fad fad fad sol sol sol re
    mib? mib mib sol la la la la
    sib re4\f do16\p sib la8 do4\f sib16\p la

    %13
    sib8 re4\f do16\p sib la8 do4\f sib16\p la
    sib8 re mib do sib sib la la\mbreak
    sib fa fa fa sib sib sib sib

    %16
    la la la la la la la la
    re, re re re sol fa sol sol
    fa mib mib re mib sol sol sol

    %19
    <la fad> <la fad> <la fad> <la fad> <sib sol> <sib sol> <sib sol> <sib sol>
    <sib sol> <sib sol> sol sol fad do'4\f sib16\p la
    sol8 sib4\f la16\p sol fad8 fad sol la

    %22
    sol sol fad fad sol re re re
    sol sol sol sol fad fad fad fad
    sol sol sol sol fad fad fad fad

    %25
    sol sol sol sol\mbreak fad fad fad fad
    sol la sol fad sol sib sib sol
    fad fad fad fad fad4 r

}

Vvlan = \relative do' {

    sol'8\p sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol(fa)
    mib mib mib mib re re re re

    %4
    re re re re sol, sol sol sol\mbreak
    sol sol sol sol sol sol sol sol
    sol sol' sol sol fa fa fa fa

    %7
    mib mib mib mib re re re re
    do do do do sib sib sib sib
    sib sib la sol re' re re re

    %10
    re re re re sol sol sol sol
    do, do do do fa fa fa fa
    sib, sib sib sib fa' fa fa fa

    %13
    sib, sib sib sib fa' fa fa fa
    sib, sib mib mib fa fa fa, fa\mbreak
    sib sib sib sib sol sol sol sol

    %16
    fa fa fa fa fa fa fa fa
    sol sol sol fa mib re mib mib
    fa fa sol sol do, do do' do

    %19
    do mib re do sib sib sib sib
    mib mib mib mib re re re re
    re re re re re do sib do

    %22
    re re re re sol, sol sol sol
    dod, dod dod dod re re re re
    re re re re re re re re

    %25
    re re re re\mbreak re' re re re
    re re re re sol sol sol, sol
    re' re re re re4 r

}

Vsopranon = \relative do'' {

    \autoBeamOff
    R1*3
    r2 sib4.^\markup\italic "Palchetto" sib8\mbreak
    do4 do4. do8 do do

    %6
    sib4. re16[do] la4. sib16[la]
    sib4 sol la2
    R1*2

    %10
    r8 re re do si4. do8
    do4. re16[mib] fa2
    fa1

    %13
    r8 fa4 mib16[re] do8 mib4 re16[do]
    re8 sib sib do sib4 la\mbreak
    sib r r2

    %16
    r r8 la la la
    si4. do16[re] do4. re16[mib]
    re8 do4 si8 do4 r

    %19
    R1
    r8 dod dod dod re mib4 re16[do?]
    sib8 re[do sib] la[mib'16 do] re8[do16 la]

    %22
    sib4 (la8) la sib4 r
    r2 r8 la la la
    sib re4 do16[sib] la8 do4 sib16[la]

    %25
    re2\mbreak re~
    re8[do sib la] sib4. sib8
    la2~la4 r8 la

}

VtestoI = \lyricmode {

    Judi - cabit _ in nati - o - - - - ni -- bus in nati - o - - - - - - - - - ni -- bus

    in nati - o -- ni -- bus in nati - o - - - - - ni -- bus in nati - o - - - - - - - - ni -- bus

    n nati - o - - - - - - - ni -- bus im-

}

Valton = \relative do' {

    \autoBeamOff
    R1*3
    r2 sol'4.^\markup\italic "Palchetto" sol8
    sol4 sol r8 fad fad fad

    %6
    sol2 re4 la'
    sol4. sol8 fad2
    R1*2

    %10
    r2 r8 sol sol fa?
    mib4. fa16[sol] fa8 fa fa mib
    re fa4 mib16[re] do8 mib4 re16[do]

    %13
    re4 r r2
    r8 fa sol sol fa4. fa8\mbreak
    fa4 r r2

    %16
    R1
    r8 sol sol sol sol[fa mib sol]
    lab4 sol sol r

    %19
    R1
    r8 sol sol sol fad2
    sol8 sib4 la16[sol] fad8 [la] sib[la16 fad]

    %22
    sol4(fad8) fad sol4 r
    r2 r8 fad fad fad
    sol sib4 la16[sol] fad8 la4 sol16[fad]

    %25
    \parenthesize sib8 sol4. la8 fad4 la8
    sol[la sol fad] sol4. sol8
    fad2~fad4 r8 \parenthesize la

}

VtestoII = \lyricmode {

    Judi - cabit _ in nati - o - - - ni -- bus in nati - o -- ni -- bus

    in nati - o - - - - ni -- bus in nati - o -- ni -- bus in nati - o - ni -- bus

    in nati - o - - - - - - ni -- bus in nati - o - - - - - - - - - - - - ni -- bus im-

}

Vtenoren = \relative do' {

    \autoBeamOff
    R1*3
    r2 re4.^\markup\italic "Palchetto" re8\mbreak
    mib4 mib4. mib8 mib mib

    %6
    re1~
    re4 do re2
    R1*3

    %11
    r8 mib mib re do4. re16[do]
    sib8 re4 do16[sib] la8 do4 sib16[la]
    sib4 r r2

    %14
    r8 re mib mib re4 do\mbreak
    re4 r r2
    r r8 do do re

    %17
    re4. re8 sol,[la si do]
    fa mib4 re8 mib4 sib
    R1

    %20
    r8 sib8 sib sol la do4 sib16[la]
    sol2 la8[do re mib]
    re4. re8 re4 r

    %23
    R1
    r2 r8 la la la
    sib re4 do16[sib]\mbreak la8 do4 sib16[la]

    %26
    sib8[do] re2 re4
    re2~re4 r

}

VtestoIII = \lyricmode {

    Judi - cabit _ in nati - o -- ni -- bus in nati - o -- ni -- bus

    in nati - o -- ni -- bus in nati - o -- ni -- bus in nati - o - - - - - ni -- bus

    in nati - o - - - - - ni -- bus in nati - o - - - - - - - ni -- bus

}

Vbasson = \relative do {

    \autoBeamOff
    R1*3
    r2 sol'4. sol8\mbreak
    sol4 sol4. sol8 sol sol

    %6
    sol2 fa
    mib4. mib8 re2
    R1*3

    %11
    r8 do' do sib la4. la8
    sib4 r r8 fa la fa
    sib re4 do16[sib] la8 do4 sib16[la]

    %14
    sib8 sib, sol' mib fa4 fa,\mbreak
    sib r r2
    R1

    %17
    r8 sol' sol fa mib4. mib8
    fa4 sol8 sol, do4 r
    R1

    %20
    r8 mib mib mib re2
    re re8 [do sib do]
    re4. re8 sol,4 r

    %23
    R1
    r2 r8 fad' fad fad
    sol sib4 la16[sol]\mbreak fad8 la4 sol16[fad]

    %26
    sol4. la8 sol4. sol,8
    re'2~re4 r

}

VtestoIV = \lyricmode {

    Judi - cabit _ in nati -- o - - - ni -- bus in nati - o -- ni -- bus

    in nati - o - - - - ni -- bus in nati - o -- ni -- bus in nati - o - - - ni -- bus

    in nati - o - - - ni -- bus in nati - o - - - - - - - - ni -- bus

}

VsopranoIn = \relative do'' {

    \autoBeamOff
    R1*6
    r2 re'
    fad, sol dod, re
    R1*5
    sib'2 mi,
    fa fa
    R1
    r2 do'
    fad, sol
    sol r
    R1
    r2 sol
    dod, re~
    re1
    re
    R
    r2 r4 r8 la'

}

ValtoIn = \relative do' {

    \autoBeamOff
    R1*6
    r2 re'
    fad, sol dod, re
    R1*5
    sib'2 mi,
    fa fa
    R1
    r2 do'
    fad, sol
    sol r
    R1
    r2 sol
    dod, re~
    re1
    re
    R
    r2 r4 r8 la'

}

VtenoreIn = \relative do' {

    \autoBeamOff
    R1*6
    r2 re'
    fad, sol dod, re
    R1*5
    sib'2 mi,
    fa fa
    R1
    r2 do'
    fad, sol
    sol r
    R1
    r2 sol
    dod, re~
    re1
    re
    R
    r2 r4 r8 la'

}

VbassoIn = \relative do {

    \autoBeamOff
    R1*6
    r2 re'
    fad, sol dod, re
    R1*5
    sib'2 mi,
    fa fa
    R1
    r2 do'
    fad, sol
    sol r
    R1
    r2 sol
    dod, re~
    re1
    re
    R
    r2 r4 r8 la'

}

VtestoV = \lyricmode {

    Ju -- di -- ca - bit ju -- di -- ca -- bit ju -- di -- ca -- bit ju -- di -- ca -- bit im-

}

Vbcn = \relative do {

    sol'8_\markup\italic "Violoncelli soli" sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol fa
    mib mib mib mib re re re re

    %4
    re re re re sol sol sol sol\mbreak
    sol sol sol sol sol sol sol sol
    sol sol sol sol fa fa fa fa

    %7
    mib mib mib mib re_\markup\italic\column{"Tutti ma"\vspace #-0.2"senza Organi"} re re re
    do do do do sib sib sib sib
    sib sib la sol re' re re re

    %10
    re\noBeam re_\markup\italic"Violoncelli soli" re re sol sol sol sol
    do, do do do fa fa fa fa
    sib, sib sib sib fa' fa fa fa

    %13
    sib, sib sib sib fa' fa fa fa
    sib, sib mib mib fa fa fa, fa\mbreak
    sib_\tu sib sib sib sol sol sol sol

    %16
    fa fa fa fa fa_\markup\italic"Violoncelli" fa fa fa
    sol sol sol fa mib re mib mib
    fa fa sol sol do_\tu do do do

    %19
    do mib re do sib sib sib sib
    mib mib mib mib re\noBeam re_\markup\italic"Violoncelli soli" re re
    re re re re re do sib do

    %22
    re re re re sol sol sol sol
    dod, dod dod dod re re re re
    re re re re re re re re

    %25
    re re re re\mbreak re re re re
    re re re re sol sol sol, sol
    re' re re re re4 r

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key sib\major
    \tempo 2 = 37
    s1*27
    \bar "||"

}

VvlI = {
    \notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}

Vvla = {
    \clef alto
    <<\Vvlan \forma>>

}

Vsoprano = {
    \new Voice = "in1"
    <<\Vsopranon \forma>>
}

Valto = {
    \new Voice = "in2"
    <<\Valton \forma>>
}

Vtenore = {
    \new Voice = "in3"
    <<\Vtenoren \forma>>
}

Vbasso = {
    \clef bass
    \new Voice = "in4"
    <<\Vbasson \forma>>
}

VsopranoI = {
    \new Voice = "ju1"
    <<\VsopranoIn \forma>>
}

ValtoI = {
    \new Voice = "ju2"
    <<\ValtoIn \forma>>
}

VtenoreI = {
    \new Voice = "ju3"
    <<\VtenoreIn \forma>>
}

VbassoI = {
    \clef bass
    \new Voice = "ju4"
    <<\VbassoIn \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
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



VIvlIn = \relative do'' {

    R4.*3
    r8 r re,\f
    sol sol sol

    %6
    fad re re
    sib' sib sib
    la re, re

    %9
    re' re re
    do sib la
    sib la sol

    %12
    re'\noBeam <fad la, re,> <la la, re,>
    fad?16 la, sib do re mib
    fa!8 re fa\mbreak

    %15
    fa re r
    fa re fa
    fa re r

    %18
    fa\noBeam re fa
    fa sib fa\parentSlur (
    fa) mib re

    %21
    do\noBeam fa,16 mib re do
    sib do re sib do re
    mib fa sol fa mib re

    %24
    do re mib do re mib
    fa sol la sol fa mib
    re mib fa re mib fa

    %27
    sol la sib la sol fa\mbreak
    mib fa sol sib sol mib
    fa8\noBeam mib'16 do re fa

    %30
    sol mib do fa la, do
    sib8 sib, r
    <do' fa, la,> r r

    %33
    <re fa, re> r r
    <mi sib mi,> r r
    \stemUp <fa do fa,> r r

    %36
    <la re, re,> r r
    <sib re, sol,> r r
    <sol sib, mib,> r r

    %39
    <fad la, re,> r re,
    \stemNeutral sol sol sol
    fad re re

    %42
    sib' sib sib
    la re, re
    re' re re

    %45
    do sib la\mbreak
    re fad sol
    sol fad <fad la, re,>\noBeam
    \stemUp <fad? la, re,> <la la, re,> r\stemNeutral

    %49
    sib sol sib
    sib sib, r
    sib' sol sib

    %52
    sib sib, r
    sib' re, sib'\parentSlur (
    sib) la sol

    %55
    sol\noBeam \stemUp <fad la, re,> <la la, re,>\stemNeutral
    <fad? la, re,>\noBeam re,16 do sib la
    sol la sib sol la sib

    %58
    do re mi re do sib
    la sib do la sib do
    re mi? fa mi re do

    %61
    sib do re sib do re
    mib! fa sol fa  mib re
    do re mib do la' sol\mbreak

    %64
    \once\stemUp fad8 la' sol\parentSlur (
    sol\noBeam) <fad la, re,> <fad la, re,>
    sol4.\fermata

    %67
    r8 r re
    mib do' sol
    fad la16 fad \stemUp <sol sib, re,>8\noBeam~

    %70
    <sol sib, re,> <fad la, re,> <fad la, re,>\stemNeutral
    sol16 re re sib re sib
    sol' re re sib re sib

    %73
    sol' re re sib re sib
    \stemUp <sol' sib, re,>8 <sol sib, re,> <sol sib, re,>
    <sol sib, re,> r r

}

VIvlIIn = \relative do'' {

    R4.*3
    r8 r re,\f
    sol sol sol

    %6
    fad re re
    sib' sib sib
    la re, re

    %9
    re' re re
    do sib la
    sib la sol

    %12
    re'\noBeam <fad la, re,> <la la, re,>
    fad?16 la, sib do re mib
    re8 sib re\mbreak

    %15
    re sib r
    re sib re
    re sib r

    %18
    re\noBeam sib re
    re fa re\parentSlur (
    re) do sib

    %21
    la fa16 mib re do
    sib do re sib do re
    mib fa sol fa mib re

    %24
    do re mib do re mib
    fa sol la sol fa mib
    re mib fa re mib fa

    %27
    sol la sib la sol fa\mbreak
    mib fa sol sib sol mib
    fa8\noBeam do'16 la sib re

    %30
    mib sol, la do fa, la
    sib8 sib, r
    <do' fa, la,> r r

    %33
    <re fa, re> r r
    <mi sib mi,> r r
    \stemUp <fa do fa,> r r

    %36
    <la re, re,> r r
    <sib re, sol,> r r
    <sol sib, mib,> r r

    %39
    <fad la, re,> r re,
    \stemNeutral sol sol sol
    fad re re

    %42
    sib' sib sib
    la re, re
    re' re re

    %45
    do sib la\mbreak
    sol do sib
    sib la <fad' la, re,>\noBeam
    \stemUp <fad? la, re,> <la la, re,> r\stemNeutral

    %49
    re, sib re
    re re, r
    re' sib re

    %52
    re re, r
    re' sib re~
    re do sib

    %55
    sib\noBeam <fad' la, re,> <la la, re,>\stemNeutral
    <fad? la, re,>\noBeam re,16 do sib la
    sol la sib sol la sib

    %58
    do re mi re do sib
    la sib do la sib do
    re mi? fa mi re do

    %61
    sib do re sib do re
    mib! fa sol fa  mib re
    do re mib do la' sol\mbreak

    %64
    fad8 do' sib
    la\noBeam la la
    <re sol,>4.\fermata

    %67
    r8 r sol,
    sol sol' mib
    la, do16 la sib8\noBeam

    %70
    <sol' sib, re,> <fad la, re,> <fad la, re,>\stemNeutral
    sol16 sib, sib sol sib sol
    re' sib sib sol sib sol

    %73
    re' sib sib sol sib sol
    <sib sol sol,>8 <sib sol sol,> <sib sol sol,>
    <sib sol sol,> r r

}


VIobIn = \relative do'' {

    R4.*3
    r8 r re,
    sol sol sol

    %6
    fad re re
    sib' sib sib
    la re, re

    %9
    re' re re
    do sib la
    sib la sol

    %12
    re' fad la
    fad?r r
    fa!8 re fa\mbreak

    %15
    fa re r
    fa re fa
    fa re r

    %18
    fa re fa
    fa sib fa~
    fa mib re

    %21
    do4 r8
    sib4.~
    sib4 sib8

    %24
    mib4.
    do4 do8
    fa4.

    %27
    re4 re8\mbreak
    sol4.
    do,4 re8

    %30
    mib do4
    re r8
    R4.*7

    %39
    r8 r8 re,
    sol sol sol
    fad re re

    %42
    sib' sib sib
    la re, re
    re' re re

    %45
    do sib la\mbreak
    re fad sol
    sol fad fad
    fad? r r

    %49
    sib sol sib
    sib sib, r
    sib' sol sib

    %52
    sib sib, r
    sib' re, sib'~
    sib la sol

    %55
    sol fad la
    fad? r r
    R4.

    %58
    sol,
    do4 do8
    la4.

    %61
    re4 re8
    sib4.
    mib!4 mib8\mbreak

    %64
    re la' sol~
    sol \noBeam fad fad
    sol4.\fermata

    %67
    r8 r sol~
    sol do sol
    fad la16 fad sol8~

    %70
    sol\noBeam fad fad
    sol16 re re sib re sib
    sol' re re sib re sib

    %73
    sol' re re sib re sib
    sol'8 re re
    re r r

}

VIobIIn = \relative do'' {

    R4.*3
    r8 r re,
    sol sol sol

    %6
    fad re re
    sib' sib sib
    la re, re

    %9
    re' re re
    do sib la
    sib la sol

    %12
    fad re' fad
    re r r
    re sib re\mbreak

    %15
    re sib r
    re sib re
    re sib r

    %18
    re sib re
    re fa re~
    re do sib

    %21
    la4 r8
    fa4.
    sol~

    %24
    sol
    la~
    la

    %27
    sib\parentSlur (\mbreak
    sib)
    la4 sib8~

    %30
    sib la4
    sib r8
    R4.*7

    %39
    r8 r8 re,
    sol sol sol
    fad re re

    %42
    sib' sib sib
    la re, re
    re' re re

    %45
    do sib la\mbreak
    sol do sib
    sib la la

    %48
    la r r
    re sib re
    re re, r

    %51
    re' sib re
    re re, r
    re'sib re~

    %54
    re do sib
    \parenthesize re sib re
    la4 r8

    %57
    R4.
    mi4.~
    mi

    %60
    fa~
    fa
    sol~

    %63
    sol\mbreak
    la8 do sib
    la4.

    %66
    re\fermata
    r8 r re
    mib sol mib

    %69
    la,4 sib8~
    sib la[la]
    sol16 sib sib sol sib sol

    %72
    re' sib sib sol sib sol
    re' sib sib sol sib sol
    sib8 sib sib

    %75
    sib r r

}

VIvlan = \relative do' {

    R4.*3
    r8 r re
    sol sol sol
    fad re re


    %7
    sib' sib sib
    la re, re
    re' re re

    %10
    do sib la
    sib la sol
    re' re, re

    %13
    re re do
    sib4 r8\mbreak
    sib' sib, sib'

    %16
    sib sib, r
    sib' sib, sib'
    sib sib, r

    %19
    sib' sib, sib'
    sib, mib mi
    fa fa, r

    %22
    sib16 do re sib do re
    mib fa sol fa mib re
    do re mib do re mib

    %25
    fa sol la sol fa mib
    re mib fa re mib fa
    sol la sib la sol fa\mbreak

    %28
    mib fa sol sib sol mib
    fa8 fa, sib
    mib fa fa,

    %31
    sib4 r8
    fa' r r
    fa r r

    %34
    sib r r
    la r r
    re, r r

    %37
    re r r
    sol r r
    la r re,

    %40
    sol sol sol
    fad re re
    sib' sib sib

    %43
    la re, re
    re' re re
    do sib la\mbreak  % fine p 29

    %46
    sib la sol
    re re' re,
    re\noBeam re16 do sib la

    %49
    sol4 r8
    sol' sol, sol'
    sol sol, r

    %52
    sol' sol, sol'
    sol sol, sib
    do4 dod8

    %55
    re\noBeam re' re,
    re re16[do sib la]
    sol la sib sol la sib

    %58
    do re mi re do sib
    la sib do la sib do
    re mi? fa mi re do

    %61
    sib do re sib do re
    mib! fa sol fa mib re
    do re mib do la' sol\mbreak

    %64
    fad8 re sol
    do, re do
    sib4._\fermata

    %67
    r8 r sib
    do mib do
    re4 sol,8~

    %70
    sol\noBeam re' re,
    sol sol sol
    sol sol sol

    %73
    sol sol sol
    sol sol sol
    sol r r

}

VIsopranon = \relative do'' {

    \autoBeamOff
    re8 re re
    re la la
    sib la sol

    %4
    re'4.~
    re~
    re~

    %7
    re~
    re~
    re8[do sib]

    %10
    do4 do8
    re do sib
    sib la r

    %13
    R4.
    re8 [sib] re\mbreak
    re re r

    %16
    re[sib] re
    re re r
    re[sib] re

    %19
    re4.~
    re8[do] sib
    la8. la16 la8

    %22
    sib4. %%% comincia la doppia strofa
    sol4 sol8
    do4.

    %25
    la4 la8
    re4.
    sib4 sib8\mbreak

    %28
    mib4.
    \stemUp do8[la] \stemNeutral sib
    sib la4

    %31
    sib r8
    R4.*3
    r8 r la

    %36
    re re la
    la sol la
    sib la sol

    %39
    re'4.~
    re~
    re~

    %42
    re~
    re~
    re8[do sib]

    %45
    do4 do8\mbreak
    re do sib
    sib la r

    %48
    R4.
    re8[sib] re
    re re, r

    %51
    re'[sib] re
    re re, r
    r r re'~

    %54
    re[do] sib
    la4 r8
    R4.

    %57
    sol4.
    mi4 mi8
    la4.

    %60
    fa4 fa8
    sib4.
    sol4 sol8

    %63
    do4.\mbreak
    do8 do sib
    la4.

    %66
    re\fermata
    r8 r re
    do do do

    %69
    la4 sib8~
    sib la4
    sib4.

    %72
    R4.*4

}

VItestoI = \lyricmode {

    -ple -- bit rui - nas rui - nas  im -- ple -- bit im -- ple -- bit  rui - nas

    con -- quas -- sabit  _ con -- quas -- sabit  _  con -- quas -- sa -- bit   ca -- pita _

    in terra _  in terra _ in terra _  in terra  mul -- to - rum.

    Im -- ple -- bit rui - nas rui - nas  im -- ple -- bit im -- ple -- bit  ru -- i -- nas

    con -- quas -- sabit  _ con -- quas -- sabit  _   ca -- pita _

    in terra _  in terra _ in terra _  in terra _  mul -- to -- rum in terra _  mul -- to - - rum.

}

VItestoIbis = \lyricmode {

    \repeat unfold 32 {\skip 4.}
    mul -- ta in ter -- ra in ter -- ra in ter -- ra co -- pio - sa.
    \repeat unfold 29 {\skip 4.}
    mul -- ta in ter -- ra in ter -- ra  in ter - ra  co -- pio -- sa in ter -- ra  co -- pio - - sa.

}

VIalton = \relative do' {

    \autoBeamOff
    R4.*5
    r4 fad8
    sol4.

    %8
    fad4 fad8
    sib4.
    la8[sol] fad

    %11
    sol fad? sol
    sol fad r
    R4.

    %14
    fa?8[re] fa\mbreak
    fa4 fa8
    fa[re] fa

    %17
    fa fa r
    fa[re] fa
    fa4.~

    %20
    fa8[sol] sol
    fa8. fa16 fa8
    re4.

    %23
    mib4 mib8
    mib4.
    fa4 fa8

    %26
    fa4.
    sol4 sol8\mbreak
    sol[mib sol]

    %29
    fa fa fa
    sol fa4
    fa r8

    %32
    R4.*9
    r8 r fad
    sol4.

    %43
    fad4 la8
    sib4.
    la8[sol] fad

    %46
    sol fad sol
    sol fad? r
    R4.

    %49
    sib8[sol] sib
    sib sib, r
    sib'[sol] sib

    %52
    sib sib, r
    r r sib'~
    sib[la] sol

    %55
    fad4 r8
    R4.
    sib,4.

    %58
    do4 do8
    do4.
    re4 re8

    %61
    re4.
    mib4 mib8
    sol4.\mbreak

    %64
    la8 la sol\parentSlur (
    sol) fad4
    sol4.\fermata

    %67
    r8 r sol
    sol sol sol
    fad4 sol8~

    %70
    sol fad?4
    sol4.
    R4.*4

}

VItestoII = \lyricmode {

    Im -- ple -- bit ru -- i -- nas im -- ple -- bit rui - nas

    con -- quas -- sabit  _ con -- quas -- sabit  _  con -- quas -- sa -- bit   ca -- pita _

    in terra _  in terra _ in terra _  in terra _  mul -- to - rum.

   Im -- ple -- bit ru -- i -- nas  im -- ple -- bit  ru -- i -- nas

    con -- quas -- sabit  _ con -- quas -- sabit  _   ca -- pita _

    in terra _  in terra _ in terra _  in terra _  mul -- to -- rum in terra _  mul -- to - - rum.

}

VItestoIIbis = \lyricmode {

    \repeat unfold 27 {\skip 4.}
    mul -- ta in ter -- ra in ter -- ra in ter -- ra - co -- pio - sa.
    \repeat unfold 23 {\skip 4.}
    mul -- ta in ter -- ra in ter -- ra  in ter - ra  co -- pio -- sa in ter -- ra  co -- pio - - sa.

}

VItenoren = \relative do' {

    \autoBeamOff
    R4.*3
    r8 r la
    sib4.

    %6
    la4 la8
    re4.
    do4 do8

    %9
    re4.
    mib4 mib8
    re re re

    %12
    re re r
    R4.*2\mbreak
    fa8[re] fa

    %16
    fa fa r
    fa[re] fa
    fa fa r

    %19
    re[sib] re
    fa[mib] mib
    do8. do16 do8

    %22
    R4.
    sib4.
    do8[sol] do

    %25
    do4.
    re8[la] re
    re4.\mbreak

    %28
    mib8 sib mib
    mib4 re8
    mib do4

    %31
    re4 sib8
    fa' fa do
    re sib do

    %34
    re do sib
    la fa r
    R4.*3

    %39
    r8 r la
    sib4.
    la4 la8

    %42
    re4.
    do4 do8
    re4.

    %45
    mib4 mib8\mbreak
    re re re
    re re r

    %48
    R4.*2
    re8[sib] re
    re re, r

    %52
    re'[sib] re
    re[sib] re
    mib4 mi8

    %55
    la,4 r8
    R4.*2
    sol4.

    %59
    la4 la8
    la4.
    sib4 sib8

    %62
    sib4.
    mib8 mib mib\mbreak
    re4.

    %65
    mib8 re4
    re4.\fermata
    r8 r re

    %68
    mib mib mib
    re4 re8~
    re re4

    %71
    re4.
    R4.*4

}

VItestoIII = \lyricmode {

     Im -- ple -- bit ru -- i -- nas im -- ple -- bit im -- ple -- bit rui - nas

    con -- quas -- sabit  _ con -- quas -- sabit  _  con -- quas -- sa -- bit   ca -- pita _

    in terra _  in terra _ in terra _  mul -- to - - - rum.

    Im -- ple -- bit rui - nas im -- ple -- bit ru -- i -- nas

    im -- ple -- bit rui - nas im -- ple -- bit im -- ple -- bit  ru -- i -- nas

    con -- quas -- sabit  _ con -- quas -- sabit  _   ca -- pita _

    in terra _  in terra _ in terra _  mul -- to - - rum in terra _  mul -- to - - rum.

}

VItestoIIIbis = \lyricmode {

    \repeat unfold 30 {\skip 4.}
    mul -- ta in ter -- ra in ter -- ra - co -- pio - - - sa.
    \repeat unfold 38 {\skip 4.}
    mul -- ta in ter -- ra in ter -- ra –  co -- pio - - sa in ter -- ra  co -- pio - - sa.

}

VIbasson = \relative do {

    \autoBeamOff
    re'8 re re
    re la la
    sib la sol

    %4
    re'4 re,8
    sol4.
    fad4 re8

    %7
    sib'4.
    la4 re,8
    re'4.

    %10
    do8[sib] la
    sib la sol
    re' re, r

    %13
    R4.*2
    re'8[sib] re
    sib sib r

    %17
    re[sib] re
    sib sib r
    sib[sib,] sib'

    %20
    sib[mib,] mi
    fa8. fa16 fa8
    R4.

    %23
    mib
    do4 do8
    fa4.

    %26
    re4 re8
    sol4.\mbreak
    mib?8 sol mib

    %29
    fa4 sib8
    mib, fa4
    sib, r8

    %32
    R4.*7
    r8 r re
    sol4.

    %41
    fad4 re8
    sib'4.
    la4 re,8

    %44
    re'4.
    do8[sib] la\mbreak
    sib la sol

    %47
    re' re, r
    R4.*2
    sol8[sol,] sol'

    %51
    sol sol, r
    sol'[sol,] sol'
    sol [sol,] sib

    %54
    do4 dod8
    re4 r8
    R4.*2

    %58
    do4.
    la4 la8
    re4.

    %61
    sib4 sib8
    mib4.
    do8 do la'\mbreak

    %64
    fad4 sol8
    do, re[do]
    si4.\fermata

    %67
    r8 r sib?
    do mib do
    re4 sol8 ~

    %70
    sol re4
    sol,4.
    R4.*4

}

VItestoIV = \lyricmode {

     -ple -- bit rui - nas rui - nas  imple -- bit im -- ple -- bit  ru -- i -- nas im -- ple -- bit im -- ple -- bit ru -- i -- nas

    con -- quas -- sabit  _ con -- quas -- sabit  _  con -- quas -- sa -- bit   ca -- pita _

    in terra _  in terra _ in terra _  mul -- to - - - rum.

    Im -- ple -- bit rui - nas im -- ple -- bit im -- ple -- bit  ru -- i -- nas

    con -- quas -- sabit  _ con -- quas -- sabit  _   ca -- pita _

    in terra _  in terra _ in terra _  mul -- to - - - rum in terra _  mul -- to - - rum.

}

VItestoIVbis = \lyricmode {

    \repeat unfold 40 {\skip 4.}
    mul -- ta in ter -- ra in ter -- ra - co -- pio - - - sa.
    \repeat unfold 26 {\skip 4.}
    mul -- ta in ter -- ra in ter -- ra –  co -- pio - - - sa in ter -- ra  co -- pio - - sa.

}

VIbcn = \relative do {

    \clef violin re''8_\markup\italic"Organi" re re
    re la la
    sib la sol

    %4
    re'4\clef bass re,,8\tu
    sol sol sol
    fad re re

    %7
    sib' sib sib
    la re, re
    re' re re

    %10
    do sib la
    sib la sol
    re' re, re

    %13
    re re do
    sib4 r8\mbreak
    sib' sib, sib'

    %16
    sib sib, r
    sib' sib, sib'
    sib sib, r

    %19
    sib' sib, sib'
    sib, mib mi
    fa fa, r

    %22
    sib16 do re sib do re
    mib fa sol fa mib re
    do re mib do re mib

    %25
    fa sol la sol fa mib
    re mib fa re mib fa
    sol la sib la sol fa\mbreak

    %28
    mib fa sol sib sol mib
    fa8 fa, sib
    mib fa fa,

    %31
    sib4 r8
    la r r
    sib r r

    %34
    sol' r r
    fa r r
    fad r r

    %37
    sol r r
    mib r r
    re4 re8

    %40
    sol sol sol
    fad re re
    sib' sib sib

    %43
    la re, re
    re' re re
    do sib la\mbreak  % fine p 29

    %46
    sib la sol
    re re' re,
    re\noBeam re16 do sib la

    %49
    sol4 r8
    sol' sol, sol'
    sol sol, r

    %52
    sol' sol, sol'
    sol sol, sib
    do4 dod8

    %55
    re\noBeam re' re,
    re re16[do sib la]
    sol la sib sol la sib

    %58
    do re mi re do sib
    la sib do la sib do
    re mi? fa mi re do

    %61
    sib do re sib do re
    mib! fa sol fa mib re
    do re mib do la' sol\mbreak

    %64
    fad8 re sol
    do, re do
    sib4._\fermata

    %67
    r8 r sib
    do mib do
    re4 sol,8~

    %70
    sol\noBeam re' re,
    sol sol sol
    sol sol sol

    %73
    sol sol sol
    sol sol sol
    sol r r

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*3
    s4 <3+>8
    <3 5>4.
    <6>
    <6>
    <3 4 6+>
    <6>
    s4 <6+>8
    <6> <6+> s
    <4 6> <3+ 5> s
    <3+ 5> <6> <6>
    <3 5>4.
    s4.*5
    s8 <3 6> <4 7>
    <3 5>4.
    <3 5>
    <3 5>
    <3 5>
    <3 5>
    <3 5>
    <3 5>s
    <7>
    s
    s
    <6>
    s
    <6!>
    s
    <6>
    s
    s
    <3+>
    <5>
    <6>
    <6>
    <6+>
    <6>
    s4 <6+>8
    <6>8 <6+> <3>
    <4 6> <3+ 5> s
    s4.*5
    s4 <8>8
    <7 9>8 <6 8> <5 7>
    <3+ 5>4.
    <_+>
    s
    <3!>
    <3 5!>
    <3 5>
    <3 5>
    <3 5>
    <3 5>
    <5 6>8 s <3 5>
    <5 6> <3+ 5> s
    <6>4.
    s
    s
    <3+>
    s8 <_+>4

}


forma = {

    \time 3/8
    \key sib\major
    \tempo 4. = 60
    s4.*75
    \bar "|."

}

VIobI = {
    \notypeset
    <<\VIobIn \forma>>

}

VIobII = {
    <<\VIobIIn \forma>>

}

VIvlI = {
    <<\VIvlIn \forma>>

}

VIvlII = {
    <<\VIvlIIn \forma>>

}

VIvla = {
    \clef alto
    <<\VIvlan \forma>>

}

VIsoprano = {
    \new Voice = "implebit1"
    <<\VIsopranon \forma>>
}

VIalto = {
    \new Voice = "implebit2"
    <<\VIalton \forma>>
}

VItenore = {
    \new Voice = "implebit3"
    <<\VItenoren \forma>>
}

VIbasso = {
    \clef bass
    \new Voice = "implebit4"
    <<\VIbasson \forma>>
}

VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
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



VIIvlIn = \relative do'' {

    sib2.\mf mib8(do)
    sib re4 mib sib8_\upl sol_\upl mib_\upl
    sib'2. mib8 \parentSlur (do)

    %4
    sib re4 mib sib8 sol mib
    sib4\f \grace {mib'16[re do]} re8. mib16 fa8\upl re\upl lab\upl fa\upl
    sib,4 mib'8. fa16\mbreak sol8\upl mib\upl sib\upl sol\upl

    %7
    sib,4 \grace {sol''16[fa mib]} fa8. sol16 lab8 fa sib sol
    sol4 fa2 r4
    r8 sib,4\p mib sol sib8~

    %10
    sib lab4\f sol fa re8
    mib sib4\p mib sol sib8~\mbreak
    sib lab4 sol fa re8

    %13
    mib(sib4) reb8 do mib,4 do'8
    sib16\f (mib,8.) do'16[(lab8.)] sib16(sol8.) lab16[(fa8.)]
    sib,4. mib16 fa fa2\tr

    %16
    mib4 sib mib r
    sib'2.mib8(do)
    sib re4 mib sib8_\upl sol_\upl mib_\upl\mbreak

    %19
    sib'2. mib8(do)
    sib re4 mib sib8_\upl sol_\upl mib_\upl
    sib4\f \grace {mib'16[re do]} re8.\p mib16 fa8\upl re\upl \parenthesize lab\upl fa\upl

    %22
    sib,4\f mib'8.\p fa16 sol8\upl mib\upl sib\upl sol\upl
    sib,4\f fa''8.\p sol16 lab8\upl fa\upl re\upl lab\upl
    sol4 mib'2 sib4

    %25
    do sib lab fa
    sol8.\f mib'16 sib8. sol16 mib8. sib16 sol8. sib16
    mib2 r

    %28
    r4 fa'\p fa fa
    mib mib do do
    r re re re

    %31
    r do do do\mbreak
    r sol' sol sib,
    la do do do

    %34
    re re re re
    mib mib mib mib
    re fa  mib8 re \grace re16 do8 sib

    %37
    la4 do8 la fa2
    r8 fa4 sib re fa8~
    fa\f mib4 re do la8\p

    %40
    sib fa4 sib re fa8~
    fa\f mib4 re do la8\p
    sib fa4 sib re fa8

    %43
    fa16(mib8.) mib16[(re8.)] \grace mib16 re(do8.) \grace re16 do[(sib8.)]\mbreak
    la4 do fa sol
    re re do do

    %46
    \tuplet 3/2 { re8\upl\f\noBeam re\p re re[re re] mib\upl\noBeam mib\p mib mib[mib mib]\senza
    fa\upl\noBeam\f fa\p fa fa[fa fa] sol\f sol sol mib[mib mib]
    re re re re[re re] do do do do[do do]}

    %49
    sib' sib,4 sib'8 lab! sib,4 lab'8
    sol16(mib8.) sib'16[(sol8.)] fa16(sib,8.) mib16[(do8.)]
    fa,4. sib16 do do2\tr

    %52
    sib4 fa sib, r
    fa'2.\p sib8 sol
    fa la4 sib4 fa8_\upl re_\upl sib_\upl\mbreak

    %55
    fa'2. sib8 sol\mbreak
    fa8 re'4 mib sib8 sol mib
    do' re4 mib sib8 sol mib

    %58
    do'4(mib) sib(mib)~
    mib do re re
    mib8.\f mib,16 sol8. sib16 mib8. sib16 sol8. sib16

    %61
    mib,4 <sol' sib, mib,> r2
    sib,4\p sib sib sib\mbreak
    sib sib sib sib

    %64
    reb reb reb reb
    r do fa do
    r sib mib sib

    %67
    r lab fa' lab,
    sol sib mib mib\mbreak
    sib,\f\upl re'8.\p mib16 fa8\upl re\upl lab\upl fa\upl

    %70
    sib,4 \f\upl mib'8.\p fa16 sol8\upl mib\upl sib\upl sol\upl\mbreak
    sib,4\f\upl re'8.\p mib16 fa8\upl re\upl lab\upl fa\upl
    sib,4 \f \upl mib'8.\p fa16 sol8\upl mib\upl sib\upl sol\upl

    %73
    fa2 r\fermata
    r8 sib4\p mib sol sib8~
    sib\f lab4 sol fa re8\p

    %76
    mib sib4 mib sol sib8~
    sib\f lab4 sol fa re8\p
    mib sib4 sol' sib reb,8

    %79
    do8. do16 sib8.\tr lab16 re!8. re16 do8.\tr sib16
    mib4 mib2 mib4~
    mib mib2 lab4\f

    %82
    sol4 fa16(mib8.) re16[(mib8.)] do16(lab8.)\mbreak
    sol2 r\fermata
    mib8 sib'4 mib sol sib8~

    %85
    sib\f lab4 sol fa re8
    mib(sib4) reb8 do(fa,4) lab8
    sib,8. re16 mib8. fa16 fa2\tr

    %88
    mib4 sib mib2\fermata

}

VIIvlIIn = \relative do'' {

    sol2. do8(lab)
    sol8 lab4 sol mib8_\upl sib_\upl sol_\upl
    sol'2. do8(lab)

    %4
    sol8 lab4 sol sib8_\upl sol_\upl mib_\upl
    sib4\f  \grace {do'16[sib lab]} sib8. do16 re8_\upl sib_\upl fa_\upl re_\upl
    sib4 sol'8.[lab16]\mbreak sib8_\upl sib_\upl sol_\upl mib_\upl

    %7
    sib4\f \grace {mib'16[re do]} re8. mib16 fa8 re sol mib
    mib4 re2 r4
    r8 sib4\p mib sol sib8~

    %10
    sib lab4\f sol fa re8
    mib sib4\p mib sol sib8~\mbreak
    sib lab4 sol fa re8

    %13
    mib(sib4) reb8 do mib,4 do'8
    sib16\f (mib,8.) do'16[(lab8.)] sib16(sol8.) lab16[(fa8.)]
    sib,4. mib16 fa fa2\tr

    %16
    mib4 sib mib r
    sol2. do8(lab)
    sol8 lab4 sol mib8_\upl sib_\upl sol_\upl

    %19
    sol'2. do8(lab)
    sol8 lab4 sol sib8_\upl sol_\upl mib_\upl
    sib4\f  \grace {do'16[sib lab]} sib8.\p do16 re8_\upl sib_\upl fa_\upl re_\upl

    %22
    sib4\f sol'8.\p[lab16]\mbreak sib8_\upl sib_\upl sol_\upl mib_\upl
    sib4\f re'8.\p mib16 fa8\upl re\upl lab\upl fa\upl
    mib4 sol2 mib4

    %25
    mib mib'2 re4
    mib,8.\f  mib'16 sib8. sol16 mib8. sib16 sol8. sib16
    mib2 r

    %28
    r4 sib'\p sib sib
    sol sol la la
    r fa fa fa

    %31
    r sol sol sol\mbreak
    r do do sol
    do, la' la la

    %34
    sib sib sib sib
    do do do do
    sib fa' mib8 re \grace re16 do8 sib

    %37
    la4 do8 la fa2
    r8 fa4 sib re fa8~
    fa\f mib4 re do la8\p

    %40
    sib fa4 sib re fa8~
    fa\f mib4 re do la8\p
    sib fa4 sib re fa8

    %43
    sol2. sol4\mbreak
    do, la sib sib
    sib sib la la

    %46
    \tuplet 3/2 { sib8\upl\f\noBeam sib\p sib sib[sib sib] la\upl\noBeam la\p la la[la la]\senza
    sib\upl\noBeam\f sib\p sib sib[sib sib] sib\f sib sib do[do do]
    sib sib sib sib'[sib sib] sib sib sib la[la la]}

    %49
    sib sib,4 sib'8 lab! sib,4 lab'8
    sol16(mib8.) sib'16[(sol8.)] fa16(sib,8.) mib16[(do8.)]
    fa,4. sib16 do do2\tr

    %52
    sib4 fa sib, r
    re2.\p sol8[mib]
    re mib4 re fa8_\upl re_\upl sib_\upl

    %55
    re2. sol8[mib]\mbreak
    re re'4 mib sib8 sol mib
    do' re4 mib sib8 sol mib

    %58
    mib4(do') mib,(sib')
    lab lab fa fa
    sol8.\f mib16 sol8. sib16 mib8. sib16 sol8. sib16

    %61
    mib,4 <sol' sib, mib,> r2
    mib,4\p mib mib mib
    reb reb reb reb

    %64
    sib sib' sib sib
    r mib, do' fa,
    r mib sib' mib,

    %67
    r fa lab fa
    mib sol la la\mbreak
    <<re,\upl\f\\sib>> sib'8.\p do16 re8_\upl sib_\upl fa_\upl re_\upl

    %70
    sib4\f\upl sol'8.\p lab16 sib8_\upl sib_\upl sol_\upl mib_\upl
    sib4\upl\f fa'8.\p sol16 lab8_\upl lab_\upl fa_\upl re_\upl
    sib4\upl\f sol'8.\p lab16 sib8_\upl sib_\upl sol_\upl mib_\upl

    %73
    re2 r\fermata
    r8 sib'4\p mib sol sib8~
    sib\f lab4 sol fa re8\p

    %76
    mib sib4 mib sol sib8~
    sib\f lab4 sol fa re8\p
    mib sib4 sol' sib reb,8

    %79
    do8. do16 sib8.\tr lab16 re!8. re16 do8.\tr sib16
    mib4 do8 do sib sib lab lab
    sol sol do[do] sib sib re\f[re]

    %82
    mib4 re16(do8.) sib16[(do8.)] lab16(fa8.)\mbreak
    mib2 r\fermata
    mib8 sib'4 mib sol sib8~

    %85
    sib\f lab4 sol fa re8
    mib(sib4) reb8 do(fa,4) lab8
    sib,8. re16 mib8. fa16 fa2\tr

    %88
    mib4 sib mib2\fermata

}

VIIvlan = \relative do' {

    r4 mib\mf mib mib
    mib mib, mib2
    r4 mib' mib mib

    %4
    mib mib, mib2
    sib'4\f r r2
    sib4 r r2\mbreak

    %7
    sib4 r r mib
    sib' sib, sib'8 lab sol fa
    mib4\upl\p sib'\upl sol\upl mib\upl

    %10
    fa\upl\f lab\upl sib\upl sib,\upl
    r sib'\upl\p sol\upl mib\upl\mbreak
    fa lab sib sib,

    %13
    mib sol lab lab,
    sol lab mib' lab
    r sol lab sib

    %16
    mib,2 r
    r4 mib sol lab
    mib mib, mib2\mbreak

    %19
    r4 mib' sol lab
    mib mib, mib2
    sib'4 r r2

    %22
    sib4 r r2
    sib4 r r2
    r4 mib do' sol

    %25
    lab sol fa sib,
    mib mib,\f mib mib
    mib mib'\p mib mib

    %28
    re re re re
    do do fa fa
    sib, sib sib sib

    %31
    mib mib mib mib\mbreak
    mib mib mi mi
    fa fa mib! mib

    %34
    re re re re
    la la la la
    sib sib' sol mi

    %37
    fa fa, fa'8 mib! re do
    sib4 fa'\upl re\upl sib\upl
    do\f mib fa fa,

    %40
    r fa'\p re sib
    do\f mib fa fa,
    r fa'\p re sib

    %43
    mib mib, r mi'\mbreak
    fa mib! re mib
    fa fa fa, fa

    %46
    sib\f sib\p do\f do\p
    re\f re\p mib\f mib
    fa fa fa, fa

    %49
    re' re fa fa
    sib, sib'2 sol4
    r sib sib la

    %52
    sib2 r
    r4 sib\p sib, sib
    sib sib' sib,2

    %55
    r4 sib' sib, sib\mbreak
    sib sib'8. lab16 sol4 mib
    r mib sol mib

    %58
    lab lab sol sol
    fa fa sib, sib
    mib \f mib, mib mib

    %61
    mib2 r
    r4 sol' sol sol
    r sol sol sol

    %64
    r sol sol sol
    lab lab lab lab
    sol sol sol sol

    %67
    fa fa re sib
    mib mib do do\mbreak
    sib\f r r2

    %70
    sib4 r r2
    sib4 r r2
    sib4 r r2

    %73
    sib2 r\fermata
    r4 sol'\upl sib\upl sol\upl
    do,\upl fa\upl r fa,\upl

    %76
    sol\upl sol'\upl sib\upl sol\upl
    do, fa r fa,
    sol sol' mib sib'

    %79
    lab fa sib lab
    sol lab sol fa
    mib lab sol fa\f

    %82
    mib fa sol lab
    sib1_\fermata
    sol4 lab sib sol

    %85
    do, fa mib re
    sib mib mib mib
    r mib mib re

    %88
    mib2 r\fermata

}

VIIsopranon = \relative do'' {

    \autoBeamOff
    R1*16
    sib2.^\markup {\italic Solo Palchetto} mib8[do]
    sib4 mib, r2

    %19
    sib'2. mib8[do]
    sib4 mib, r sib'
    sib1

    %22
    sib2. sib4
    sib1
    sib4 mib2.~

    %25
    mib4 do8 sib \grace sib4 lab2
    sol r
    r r4 sol

    %28
    sol8. fa16 fa2 sib4
    sib la8 sol fa4 mib'
    mib8[dod] re4 r re~

    %31
    re8[si] do!4 r do~\mbreak
    do mib8.[re16] do4 sib
    la8.[fa16] fa2\tr do'8[sib16 la]

    %34
    sib8.[fa16] fa2\tr re'8[do16 sib]
    do8.[fa,16] fa2\tr mib'8[re16 do]
    re4 fa \grace fa16 mib8[re] \grace re16 do8[sib]

    %37
    la[sol16 fa] fa4  \parenthesize r2
    R1
    r2 do'4 \grace do16 sib8[la]

    %40
    sib4 fa r2
    r4 do'8[re] mib[do] sib[la]
    sib4 fa r fa'

    %43
    fa16[(mib8.)] mib16 re8. re16[(do8.)] do16[(sib8.)]\mbreak
    la16[(fa8.)] do'16[(la8.)] fa'16[(re8.)] mib16[(do8.)]
    \grace mib16 re8[do16 sib] \grace sib16 la8[sol16 fa] do'2\tr

    %46
    re mib4\upl do\upl
    fa\upl re\upl sol8[mib] re[do]
    \grace mib16 re8[do16 sib] \grace sib16 la8[sol16 fa] do'2\tr

    %49
    sib r
    R1*3
    fa2. sib8[sol]

    %54
    fa4 sib r2
    fa2. sib8[sol]\mbreak
    fa4 sib r sib

    %57
    do4 sib r sib
    do mib8[re] mib4 re8[do]
    \grace sib4 lab1

    %60
    sol2 r
    r r4 sib
    sib la8. sol16 fa4 mib

    %63
    reb2 sib'~
    sib4 reb4. fa8[mib reb]~
    reb?[sib] do4 r8 fa4 do8

    %66
    \grace do16 sib8[la] sib4 r8 mib4 sib8
    lab?8.[sib16] lab4 \senza\tuplet 3/2 { r8 fa[sol] lab[sol fa]}
    sol4 mib'~mib8[do] sib[la]\mbreak

    %69
    sib1~
    sib~
    sib~

    %72
    sib
    sib2 sib4 r\fermata
    R1

    %75
    r2 fa'8[re] sib[lab]
    sol4 sib r2
    r4 fa' sib, lab

    %78
    sol sib r sib
    do sib8. lab16 re4 do8. [sib16]
    mib4 mib2 mib4~

    %81
    mib mib2 fa4
    sol fa16[(mib8.)] re16[(mib8.)] do16[(lab8.)]\mbreak
    mib4.\fermata fa8 fa2\tr

    %84
    mib\fermata r
    R1*4

}

VIItesto = \lyricmode {

    De tor -- rente _ de tor -- rente _ in vi -- a in vi -- a in vi -- a bi -- bet,

    prop -- te -- rea _ prop -- te -- rea _ ex -- al -- ta - - - - - - - - - - - - - - - - - - - bit ca -- put.

    De tor -- rente _  in vi -- a bi -- bet, prop -- te -- rea _ ex -- al -- ta - - bit ca - - put

     ex -- al -- ta -- bit ex -- al -- ta -- bit ca -- put.

     De tor -- rente _ de tor -- rente _ in vi -- a in vi - - a bi -- bet,

     prop -- te -- rea _ ex -- al -- ta - - - - - - - - - - - - - - - - bit ca - put.

     De tor -- rente _  in vi -- a bi -- bet, prop -- te -- rea _ ex -- al -- ta - - - - - - - bit ca - - put.

}

VIIbcn = \relative do {

    r4 mib^\mf mib mib
    mib mib, mib2
    r4 mib' mib mib

    %4
    mib mib, mib2
    sib'4^\f r r2
    sib4 r r2\mbreak

    %7
    sib4 r r mib
    sib' sib, sib'8 lab sol fa
    mib4\upl\p sib'\upl sol\upl mib\upl

    %10
    fa\upl\f lab\upl sib\upl sib,\upl
    r sib'\upl\p sol\upl mib\upl\mbreak
    fa lab sib sib,

    %13
    mib sol lab lab,
    sol lab mib' lab
    r sol lab sib

    %16
    mib,2 r
    r4 mib sol lab
    mib mib, mib2\mbreak

    %19
    r4 mib' sol lab
    mib mib, mib2
    sib'4 r r2

    %22
    sib4 r r2
    sib4 r r2
    r4 mib do' sol

    %25
    lab sol fa sib,
    mib mib,\f mib mib
    mib mib'\p mib mib

    %28
    re re re re
    do do fa fa
    sib, sib sib sib

    %31
    mib mib mib mib\mbreak
    mib mib mi mi
    fa fa mib! mib

    %34
    re re re re
    la la la la
    sib sib' sol mi

    %37
    fa fa, fa'8 mib! re do
    sib4 fa'\upl re\upl sib\upl
    do\f mib fa fa,

    %40
    r fa'\p re sib
    do\f mib fa fa,
    r fa'\p re sib

    %43
    mib mib, r mi'\mbreak
    fa mib! re mib
    fa fa fa, fa

    %46
    sib\f sib\p do^\f do\p
    re^\f re\p mib\f mib
    fa fa fa, fa

    %49
    sib sib re re
    mib mib re mib
    r re mib fa

    %52
    sib,2 r
    r4 sib' \p sib, sib
    sib sib' sib,2

    %55
    r4 sib' sib, sib\mbreak
    sib sib'8. lab16 sol4 mib
    r mib sol mib

    %58
    lab lab sol sol
    fa fa sib, sib
    mib \f mib, mib mib

    %61
    mib2 r
    r4 sol' sol sol
    r sol sol sol

    %64
    r sol sol sol
    lab lab lab lab
    sol sol sol sol

    %67
    fa fa re sib
    mib mib do do\mbreak
    sib\f r r2

    %70
    sib4 r r2
    sib4 r r2
    sib4 r r2

    %73
    sib2 r\fermata
    mib4\upl sib'\upl sol\upl mib\upl
    fa\upl lab\upl sib\upl sib, \upl

    %76
    mib4\upl sib'\upl sol\upl mib\upl
    fa\upl lab\upl sib\upl sib, \upl
    mib sib' sol mib

    %79
    lab fa sib lab
    sol lab sol fa
    mib lab sol fa\f

    %82
    mib fa sol lab
    sib1_\fermata
    mib,4 fa sol mib

    %85
    fa lab sib lab
    sol mib lab do
    sib sol lab sib

    %88
    mib,2 r\fermata

}

VIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s4 <5/ 3> s <6 4>
    <5 3>1
    s2 s4 <6 4>
    <5 3>1
    <4 3>
    <6 4>
    <7 5>
    <6 4>4 <5 3> s2
    s <6>
    s1*2
    <5>4 <6> <6 4> <5 3>
    s1*2
    s4 <6> <6 4> <5 3>
    s1
    s2 <6>4 <5>
    s1
    s2 <6>4 <5>
    s1*2
    <4 6>1
    <3 5>
    s2 <5>4 <6>
    s <6> <7> <7>
    s1*2
    s4 <6> s2
    <5> <3!>
    <5>1
    <7>4 <_-> s2
    s1
    s2 <2>
    <6>1
    <6>
    s2 <6>4 <6>
    <3!>1
    s2 <6>
    s <3!>
    s <6>
    s <_!>
    s <6>
    s1
    \bassFigureExtendersOn <3!>4 <3!> <6> s\bassFigureExtendersOff
    <4 6>2 <3 5>
    s2 <6!>
    <6>1
    <4 6>2 <3! 5>
    s <6>
    s <6>
    s4 <6> <5 6> <3! 5>
    s1
    s2 s4 <4 6>
    <3 5>1
    s2 s4 <4 6>
    s2 <6>
    s1
    s2 <6>
    <7> <7>
    s1*2
    s4 <6> s2
    s4 <5-> s2s1
    <5>2 <6>
    <7> <6>
    s1
    s2 <6!>
    s1
    <4 6>
    <3 5> <4 6>
    <3 5>
    s1*6
    <6>1
    s1*3
    s4 <6> <6> s
    <5> <6> <4 6> <2 4>
    <6>1
    s4 <6 > <5-> <3 4>

}


forma = {

    \time 2/2
    \key mib\major
    \tempo 4 = 70
    s1*88
    \bar "|."

}

VIIvlI = {
    \notypeset
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    <<\VIIvlIIn \forma>>

}

VIIvla = {
    \clef alto
    <<\VIIvlan \forma>>

}

VIIsoprano = {
    \new Voice = "torrente"
    <<\VIIsopranon \forma>>
}

VIIbc = {
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
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



VIIIvlIn = \relative do'' {

    sol'16 sol sol sol fa fa fa fa fa fa fa fa mi mi fad fad
    sol sol sol sol sol sol sol sol sol sol sol sol fa! fa fa fa
    r fa fa fa r fa fa fa r si, si si r mi mi mi

    %4
    r mi mi mi r mi mi mi r la, re re r la' la la
    re, re mi mi fa fa mi mi mi mi mi mi mi mi mi mi
    mi mi mi mi re re do do re re re re re re re re

    %7
    re sol re re re sol re re re4 r
    <do mi,>4. \grace  re16  do32[si do16] re8 mi
    fa4 fa,8. sol16 la8 sol16 fa

    %10
    mi32(fa sol8.) r8 mi' fa sol
    la4 la,8. si16 do8 si16 la\mbreak %% fine p 37
    sol4 r8 sol'16[la sol8 sol]

    %13
    sol4 re8 mi \grace sol16 fa8 mi16 re
    mi32(fa sol8.) r8 sol16[la sol8 sol]
    sol4 re8 mi fa mi16 re

    %16
    mi8 re16 do sol'8 sol sol mi
    re do16 si sol'8 sol sol sol
    sol4 fad2\fermata

    %19
    sol2.
    R1*6
    r4 sol sol sol

    %27
    la la mi mi
    fa mi8 re sol4 fa
    mi mi re do

    %30
    si2 sol'
    sol fa
    fa mi4 do

    %33
    sol'2. fa4
    mi2 sol4 sol
    la sol8 fa sol4 sol

    %36
    sol mi do2
    re do\mbreak
    do4 r r2

    %39
    sol'4 sol, sol' la8 sol
    fa4 fa, fa' sol8 fa
    mi4 mi la sol

    %42
    fa re la fa'
    mi mi2 fa8 mi
    re4 re, re2

    %45
    R1
    r2 mi'4 mi
    fa mi8 re sol4 fa

    %48
    mi re8 do fa4 mi
    re do8 si mi4 re
    do2 mi4 mi\mbreak

    %51
    fa mi8 re sol4 fa
    mi dod la' sol8 fa
    mi2. fa8 mi

    %54
    re2 r
    la'4 la, la la'
    sol sol, sol sol'

    %57
    fad fad, fad fad'
    mi mi, si'' sol
    fad2. sol8 fad

    %60
    mi4 mi, mi mi'
    fa!2 mi
    mi fad4 fad

    %63
    sol fad8 mi la4 sol\mbreak
    fad re sol2
    sol fa!

    %66
    fa mi4 mi
    fa mi8 re sol4 fa
    mi do sol'2~

    %69
    sol fa
    re4 re mi mi
    fa mi8 re sol4 fa

    %72
    mi re8 do sol'4 sol
    la2 sol
    sol4 fa8 sol la sol fa mi

    %75
    re4 sol mi do'
    re, do' re, si'\mbreak
    do sol8[do, la' do, sib' do,]

    %78
    la'4 la,8 do sol4 si!
    do sol'8[do, la' do, sib' do,]
    la'4 la,8 do sol4 si!

    %81
    do4 sol' si, re
    mi sol si, re
    <do sol do,>4 r r2

}

VIIIvlIIn = \relative do'' {

    re16 re re re re re re re re re re re do do do do
    mi mi mi mi mi mi mi mi re re re re re re re re
    r re re re r re re re r re re re r do do do

    %4
    r si si si r dod dod dod r re re re r do do do
    si si do do re re re re re re re re do do si si
    do do do do do do do do do do do do si si la la

    %7
    si do si si si do si si si4 r
    R2.*2
    <do mi,>4. \grace  re16  do32[si do16] re8 mi

    %11
    fa4 fa,8. sol16 la8 sol16 fa
    mi4 r8 sol'16[la sol8 sol]

    %13
    sol4 re8 mi \grace sol16 fa8 mi16 re
    mi32(fa sol8.) r8 sol16[la sol8 sol]
    sol4 re8 mi fa mi16 re

    %16
    mi8 re16 do sol'8 sol sol mi
    re do16 si sol'8 sol sol re
    do2.\fermata

    %19
    si
    R1*9
    r4 do do do

    %30
    mi mi si si
    do si8 la re4 do
    si sol do2\parentSlur (

    %33
    do) si
    do2. mi4
    re re, re' re

    %36
    do2 la4 la
    sib la8 sol do4 sib\mbreak
    la fa fa'2~

    %39
    fa mi~
    mi re~
    re dod

    %42
    re4 fa, re la'
    sib2 la
    la4 r si! si

    %45
    do si8 la re4 do
    si sol do2~
    do si~

    %48
    si la~
    la sold
    do2. re8 do\mbreak

    %51
    si2. do8 si
    la1
    R

    %54
    r2 si4 si
    do si8 la re4 do
    si la8 sol do4 si

    %57
    la sol8 fad si4 la
    sol mi mi'2\parentSlur (
    mi) re\parentSlur (

    %60
    re) do
    si2. do8 si
    la2. si8 la

    %63
    sol2 do\mbreak
    la4 r si si
    do si8 la re4 do

    %66
    si sol do2\parentSlur (
    do) si
    mi4 mi re do8 si

    %69
    la2. si8 la
    sol4 si do do
    re re si si

    %72
    do do2 do4
    do do si si
    mi mi2 re8 do

    %75
    si4 si do mi
    sol, sol' si, re\mbreak
    mi mi8[do fa do sol' do,]

    %78
    fa4 fa,8 la sol4 re
    mi mi'8[do fa do sol' do,]
    fa4 fa,8 la sol4 re

    %81
    mi mi' sol, si
    do mi sol, si
    <do sol do,> r r2

}


VIIIcrIn = \relative do'' {

    R1*7
    mi4 mi, r
    r do' do

    %10
    mi mi, r
    r do' do\mbreak
    mi mi, r

    %13
    re' re r
    mi mi, r
    re' re  r

    %16
    mi mi, r
    R2.
    do'\fermata

    %19
    re
    R1*14
    r4 mi mi mi

    %35
    re2 re4 re
    do2 r
    r do4 do\mbreak

    %38
    do r r2
    R1*7
    r2 mi4 mi

    %47
    fa2 re4 re
    mi2 r
    R1

    %50
    r2 mi\mbreak
    fa mi
    mi, r

    %53
    R1
    r2 re'
    mi re

    %56
    re r
    R1
    r2 mi

    %59
    fad1
    mi2 mi
    R1*5

    %66
    sol,1
    sol
    sol

    %69
    sol
    r4 re' mi mi
    fa! mi8 re sol4 fa

    %72
    mi2 mi
    re1
    mi2 re4 re

    %75
    re2 mi
    re re4 re\mbreak
    do r r2

    %78
    r re4 re
    mi r r2
    r re4 re

    %81
    do2\upl re\upl
    mi\upl re
    do4 r r2

}

VIIIcrIIn = \relative do'' {

    R1*7
    do4 do, r
    r do do

    %10
    do' do, r
    r do do\mbreak
    do' do, r

    %13
    sol' sol r
    do do, r
    sol' sol r

    %16
    do do, r
    R2.
    do'\fermata

    %19
    sol
    R1*14
    r4 do do do

    %35
    do2 sol4 sol
    mi2 r
    r do4 do\mbreak

    %38
    do r r2
    R1*7
    r2 do'4 do

    %47
    re2 sol,4 sol
    do2 r
    R1

    %50
    r2 do\mbreak
    re mi
    mi, r

    %53
    R1
    r2 sol
    do re

    %56
    sol, r
    R1
    r2 mi'~

    %59
    mi re~
    re do
    R1*5

    %66
    sol,1
    sol
    sol

    %69
    sol
    r4 sol' do do
    re re sol, sol

    %72
    do2 do~
    do sol
    do re4 re

    %75
    sol,2 do
    sol sol4 sol\mbreak
    mi r r2

    %78
    r sol4 sol
    do r r2
    r sol4 sol

    %81
    mi2\upl sol\upl
    do\upl sol\upl
    mi4 r r2

}


VIIIobIn = \relative do'' {

    sol'4 fa8 fa fa4 mi8 fad
    sol4 sol8 sol sol sol fa! fa
    fa fa re re re re do do

    %4
    si si dod dod re re do do
    si do re[re] re re do si
    re mi re do re re re re

    %7
    re16 sol re re re sol re re re4 r % OOKK
    do4. do8 re mi
    fa4 fa,8. sol16 la8 sol16 fa

    %10
    mi4 r8 mi' fa sol
    la4 la,8. si16 do8 si16 la\mbreak
    sol4 r8 sol'16[la sol8 sol]

    %13
    sol4 re8 mi \grace sol16 fa8 mi16 re
    mi32(fa sol8.) r8 sol16[la sol8 sol]
    sol4 re8 mi fa mi16 re

    %16
    mi8 re16 do sol'8 sol sol mi
    re do16 si sol'8 sol sol re
    \grace re4 do2.\fermata

    %19
    si
    R1*6
    r4 sol' sol sol

    %27
    la la mi mi
    fa mi8 re sol4 fa
    mi mi re do

    %30
    si2 sol'
    sol fa
    fa mi4 do

    %33
    sol'2. fa4
    mi2 sol4 sol
    la sol8 fa sol4 sol

    %36
    sol mi do2
    re do\mbreak
    do4 r r2

    %39
    sol'4 sol, sol' la8 sol
    fa4 fa, fa' sol8 fa
    mi4 mi la sol

    %42
    fa re la fa'
    mi mi2 fa8 mi
    re4 re, re2

    %45
    R1
    r2 mi'4 mi
    fa mi8 re sol4 fa

    %48
    mi re8 do fa4 mi
    re do8 si mi4 re
    do2 mi4 mi\mbreak

    %51
    fa mi8 re sol4 fa
    mi dod la' sol8 fa
    mi2. fa8 mi

    %54
    re2 r
    la'4 la, la la'
    sol sol, sol sol'

    %57
    fad fad, fad fad'
    mi mi, si'' sol
    fad2. sol8 fad

    %60
    mi4 mi, mi mi'
    fa!2 mi
    mi fad4 fad

    %63
    sol fad8 mi la4 sol\mbreak
    fad re sol2
    sol fa!

    %66
    fa mi4 mi
    fa mi8 re sol4 fa
    mi do sol'2~

    %69
    sol fa
    re4 re mi mi
    fa mi8 re sol4 fa

    %72
    mi re8 do sol'4 sol
    la2 sol
    sol4 fa8 sol la sol fa mi

    %75
    re4 sol mi do'
    re, do' re, si'\mbreak
    do sol8[do, la' do, sib' do,]

    %78
    la'4 la,8 do sol4 si!
    do sol'8[do, la' do, sib' do,]
    la'4 la,8 do sol4 si!

    %81
    do4 sol' si, re
    mi sol si, re
    do4 r r2

}

VIIIobIIn = \relative do'' {

    re4 re8 re sol,4 sol8 la
    sib4 sib8 sib sib sib la la
    la la la la sold sold la la
    la la sol! sol la la la la
    re, mi fa[fa] mi mi mi re
    mi sol sol do do do si la
    si16 do si si si do si si si4 r  %OOKK
    R2.*2
    do4. do8 re mi
    fa4 fa,8. sol16 la8 sol16 fa
    mi4 r8 sol'16[la sol8 sol]

    %13
    sol4 re8 mi \grace sol16 fa8 mi16 re
    mi32(fa sol8.) r8 sol16[la sol8 sol]
    sol4 re8 mi fa mi16 re

    %16
    mi8 re16 do sol'8 sol sol mi
    re8 do16 si sol'8 sol sol sol,
    sol4 fad2\fermata

    %19
    sol2.
    R1*9
    r4 do do do  %% OOKK

    %30
    mi mi si si
    do si8 la re4 do
    si sol do2\parentSlur (

    %33
    do) si
    do2. mi4
    re re, re' re

    %36
    do2 la4 la
    sib la8 sol do4 sib\mbreak
    la fa fa'2~

    %39
    fa mi~
    mi re~
    re dod

    %42
    re4 fa, re la'
    sib2 la
    la4 r si! si

    %45
    do si8 la re4 do
    si sol do2~
    do si~

    %48
    si la~
    la sold
    do2. re8 do\mbreak

    %51
    si2. do8 si
    la1
    R

    %54
    r2 si4 si
    do si8 la re4 do
    si la8 sol do4 si

    %57
    la sol8 fad si4 la
    sol mi mi'2\parentSlur (
    mi) re\parentSlur (

    %60
    re) do
    si2. do8 si
    la2. si8 la

    %63
    sol2 do\mbreak
    la4 r si si
    do si8 la re4 do

    %66
    si sol do2\parentSlur (
    do) si
    mi4 mi re do8 si

    %69
    la2. si8 la
    sol4 si do do
    re re si si

    %72
    do do2 do4
    do do si si
    mi mi2 re8 do

    %75
    si4 si do mi
    sol, sol' si, re\mbreak
    mi mi8[do fa do sol' do,]

    %78
    fa4 fa,8 la sol4 re
    mi mi'8[do fa do sol' do,]
    fa4 fa,8 la sol4 re

    %81
    mi mi' sol, si
    do mi sol, si
    do r r2

}

VIIIvlan = \relative do' {

    sol'16 sol sol sol sol sol sol sol sol sol sol sol sol sol la la
    sib sib sib sib sib sib sib sib sib sib sib sib la la la la
    la8 la la la sold sold la la

    %4
    la la sol! sol la la la la
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %7
    sol sol, sol' sol sol4 r
    mi4 mi, r
    r do' do

    %10
    do do r
    r do do\mbreak
    do4. do8 re mi

    %13
    re4 si8 sol' la si
    do4 do,8 do re mi
    re4 si8 sol' la si

    %16
    si4 mi, mi
    sol re re
    mi do2\fermata

    %19
    re2.
    R1*3
    r4 do do do

    %24
    mi mi si si\mbreak
    do si8 la re4 do
    si sol la si

    %27
    do2 do\parentSlur (
    do) si\parentSlur (
    si) la

    %30
    sol mi'
    do re\parentSlur (
    re) do4 mi

    %33
    re2 re
    r do\parentSlur (
    do) sib\parentSlur (

    %36
    sib?) la
    sol1\mbreak
    la2 la4 la

    %39
    sib la8 sol do4 sib
    la sol8 fa sib4 la
    sol mi mi'2

    %42
    r re~
    re do~
    do si!

    %45
    la la
    sol1
    R1*2

    %49
    r4 re' re re
    fa fa do do\mbreak
    re do8 si mi4 re

    %52
    dod la re2~
    re do!~
    do si4 re

    %55
    mi2 re
    re mi
    mi red

    %58
    mi si
    do si
    si do4 do

    %61
    re do8 si mi4 re
    dod la re2\parentSlur (
    re) do!\parentSlur (\mbreak

    %64
    do) si
    la4 do re mi
    re re mi do

    %67
    re2 re
    do4 r si si
    do si8 la re4 do

    %70
    si sol mi' do
    si2 re
    do mi

    %73
    re2. mi8 re
    do2 do4 la'
    sol2 sol

    %76
    sol sol\mbreak
    sol4 r r2
    r4 do, do si

    %79
    mi r r2
    r4 fa sol sol,
    sol2 sol'

    %82
    sol sol
    sol4 r r2

}

VIIIsopranon = \relative do'' {

    \autoBeamOff
    re4\tu re8 re sol,4 sol8[la]
    sib4 sib8 sib sib8. la16 la4
    re re re do8 do

    %4
    si!4 dod re do
    si8[do] re2 do8[si]
    do2. si8[la]

    %7
    si2~si4 r
    R2.
    r4 do la

    %10
    sol do r
    r do la\mbreak
    sol8. do16 do4 r

    %13
    r r8 si do re
    do4 sol r
    r r8 si do re

    %16
    do2.
    re
    do\fermata

    %19
    si
    R1*9
    r4 do do do

    %30
    mi mi si si
    do si8 la re4 do
    si sol do2~

    %33
    do si
    do2. mi4
    re1

    %36
    do2 la4 la
    sib la8 sol do4 sib\mbreak
    la fa fa'2~

    %39
    fa mi~
    mi re~
    re dod

    %42
    re r
    R1
    r2 si!4 si

    %45
    do si8 la re4 do
    si sol do2~
    do si~

    %48
    si la~
    la sold
    do2. re8 [do]\mbreak

    %51
    si2. do8 [si]
    la1
    R

    %54
    r2 si4 si
    do si8 la re4 do
    si la8 [sol] do4 si

    %57
    la sol8[fad] si4 la
    sol mi mi'2~
    mi re~

    %60
    re do
    si2. do8[si]
    la2. si8[la]

    %63
    sol2 do\mbreak
    la4 r si si
    do si8 la re4 do

    %66
    si sol do2~
    do si
    mi re4 do8[si]

    %69
    la2~la
    sol4 si do do
    re re si si

    %72
    do do8 do do4 do
    do2 si
    mi2. re8[do]

    %75
    si2 do
    do si\mbreak
    do4 r r2

    %78
    r4 do2 si4
    do r r2
    r4 do2 si4

    %81
    do2\upl si\upl
    do\upl si\upl
    do4 r r2

}

VIIItestoI = \lyricmode {

    Glo -- ria _ Pa -- tri Pa -- tri et Fili - o et Spi -- ri -- tui _ Sanc - - - - - - - - to.

    Si -- cut e -- rat in prin -- cipi - o, et nunc et sem -- per et nunc et sem -- per sem -- per

    et nunc et sem -- per  et in sæ -- cula _ sæcu - lorum _ a - - - - men

    et in sæ -- cula _ sæcu - lorum _ a - - - men et in sæ -- cula _ sæcu - lorum _ a - - - - - - - men

    et in sæ -- cula _ sæcu - lorum _  sæcu - lo - - rum amen _ a - - - - - - - - men

    et in sæ -- cula _ sæcu - lorum _  a - - - - - men

    et nunc et sem -- per  et in sæ -- cula _ sæcu - lo -- rum a - - men a - men a - men  a - men a -- men a -- men.

}

VIIIalton = \relative do' {

    \autoBeamOff
    fa4\tu fa8 fa fa4 mi8[fad]
    sol4 sol8 sol sol8. fa!16 fa4
    la4 la sold la8 la

    %4
    la4 sol! la2
    sol1
    sol

    %7
    sol2~sol4 r
    R2.
    r4 fa fa

    %10
    mi mi r
    r fa fa\mbreak
    mi8. sol16 sol4 r

    %13
    r r8 sol sol sol
    sol4 mi r
    r r8 sol sol sol

    %16
    sol2.
    sol
    sol4 fad2\fermata

    %19
    sol2.
    R1*6
    r4 sol sol sol

    %27
    la la mi mi
    fa mi8 re sol4 fa
    mi mi re do

    %30
    si2 sol'~
    sol fa~
    fa mi4 do

    %33
    sol'2. fa4
    mi2 sol4 sol
    la sol8 fa sol4 sol

    %36
    sol mi do2
    re do\mbreak
    do4 r r2

    %39
    sol'1
    fa
    mi2 la4 sol

    %42
    fa2 r
    R1*3
    r2 mi4 mi

    %47
    fa mi8 re sol4 fa
    mi re8[do] fa4 mi
    re do8[si] mi4 re

    %50
    do2 mi4 mi\mbreak
    fa mi8 re sol4 fa
    mi dod la' sol8[fa]

    %53
    mi2. fa8[mi]
    re2 r
    la'1

    %56
    sol
    fad
    mi2 si'4 sol

    %59
    fad1
    mi2 mi
    fa! mi

    %62
    mi fad4 fad
    sol fad?8 mi la4 sol\mbreak
    fad4 re sol2~

    %65
    sol fa!~
    fa mi4 mi
    fa mi8 re sol4 fa

    %68
    mi do sol'2~
    sol fa
    re4 re mi mi

    %71
    fa mi8[re] sol4 fa
    mi4 re8 do sol'4 sol
    la2 sol

    %74
    sol la
    sol sol
    sol1\mbreak

    %77
    sol4 r r2
    r4 la sol2
    sol4 r r2

    %80
    r4 la sol2
    sol\upl sol\upl
    sol\upl sol\upl

    %83
    sol4 r r2

}

VIIItestoII = \lyricmode {

    Glo -- ria _ Pa -- tri Pa -- tri et Fili - o et Spi -- ri -- tui _ Sanc - - - - to.

    Si -- cut e -- rat in prin -- cipi - o, et nunc et sem -- per et nunc et sem -- per sem - per

    et nunc et sem -- per  et in sæ -- cula _ sæcu - lo - - rum a - - - - - - men

    et in sæ -- cula _ sæcu - lorum _ a - - men a - - - - men et in sæ -- cula _ sæcu - lorum _ sæcu - lorum _ a - men

    et in sæ -- cula _ sæcu - lorum  _ a - - - men a - - - - - - - - - - men

    et in sæ -- cula _ sæcu - lorum _  a -- men

    et in sæ -- cula _ sæcu - lo -- rum a - men et nunc et sem -- per  et in sæ -- cula _ sæcu - lo -- rum a - - men

    a -- men a - men  a - men a -- men a -- men.

}

VIIItenoren = \relative do' {

    \autoBeamOff
    re4\tu re8 re re4 do
    mi mi8 mi re8. re16 re4
    fa fa si, mi8 mi

    %4
    mi2 re
    re8[mi] fa8[mi16 re] mi2~
    mi4 re8[do] re2~

    %7
    re~re4 r
    R2.
    r4 do do

    %10
    do do r
    r do do\mbreak
    do8. mi16 mi4 r

    %13
    r4 r8 re fa fa
    mi4 do r
    r r8 re fa fa

    %16
    mi2.
    re
    mi4 do2\fermata

    %19
    re2.
    R1*3
    r4 do do do

    %24
    mi mi si si\mbreak
    do si8 la re4 do
    si sol la si

    %27
    do2 do~
    do si~
    si la

    %30
    sol mi'
    do re~
    re do4 mi

    %33
    re2 re
    r do~
    do sib~

    %36
    sib la
    sol1\mbreak
    la2 la4 la

    %39
    sib la8 sol do4 sib
    la sol8[fa] sib4 la
    sol mi r2

    %42
    r re'~
    re do~
    do si!

    %45
    la1
    sol
    R1*2

    %49
    r4 re' re re
    fa fa do do\mbreak
    re do8 si mi4 re

    %52
    dod la re2~
    re do!~
    do si4 re

    %55
    mi2 re~
    re mi~
    mi red

    %58
    mi si
    do si
    si do4 do

    %61
    re do8 si mi4 re
    dod la re2~
    re do!~\mbreak

    %64
    do si
    la4 do re mi
    re2 mi4 do

    %67
    re1
    do4 r si si
    do si8 la re4 do

    %70
    si sol mi' do
    si2 re
    do mi

    %73
    re2. mi8[re]
    do2. fa4
    re2 mi

    %76
    re1\mbreak
    mi4 r r2
    r4 fa re2

    %79
    mi4 r r2
    r4 fa re2
    mi\upl re\upl

    %82
    mi\upl re\upl
    mi4 r r2

}

VIIItestoIII = \lyricmode {

    Glo -- ria _ Pa -- tri Pa -- tri et Fili - o et Spi -- ri -- tui _ Sanc - - - - - to.

    Si -- cut e -- rat in prin -- cipi - o, et nunc et sem -- per et nunc et sem -- per sem - per

    et nunc et sem -- per  et in sæ -- cula _ sæcu - lo - - rum a - - - - - - - - - - men a - - - men

    et in sæ -- cula _ sæcu - lorum _ a - - men a - - - men

    et nunc et sem -- per et in sæ -- cula _ sæcu - lorum _ a - - - - - - - - - - - men

    et in sæ -- cula _ sæcu - lorum _  a - - - - - - - - - - men

    et in sæ -- cula _ sæcu - lo -- rum a - - - - - - - - - - men

    a -- men a - men  a - men a -- men a -- men.

}

VIIIbasson = \relative do {

    \autoBeamOff
    si4\tu si8 si do4 do
    dod dod8 dod re8. re16 re4
    re re mi2

    %4
    mi4 mi fa fad
    sol1~
    sol

    %7
    sol2~sol4 r
    R2.
    r4 la fa

    %10
    do' do, r
    r la' fa\mbreak
    do'8 do, do4 r

    %13
    r r8 sol' la si
    do4 do, r
    r r8 sol' la si

    %16
    do2.
    si
    la\fermata

    %19
    sol %% OK
    r4 sol sol sol
    la la mi mi

    %22
    fa mi8 re sol4 fa
    mi la sol fa
    mi do sol'2~\mbreak

    %25
    sol fa~
    fa mi4 re
    do r r2

    %28
    R1*4
    sol'1~
    sol4 sol sol sol

    %34
    la la mi mi
    fa mi8 re sol4 fa
    mi do fa2~

    %37
    fa mi\mbreak
    fa r
    R1*2

    %41
    r4 la la  la
    sib sib fa fa
    sol fa8 mi la4 sol

    %44
    fad re sol2~
    sol fa!~
    fa mi4 do

    %47
    re1
    do
    si

    %50
    la4 r la'2~\mbreak
    la sol~
    sol fa4 fa

    %53
    sol fa8 mi la4 sol
    fad re sol2~
    sol fad~

    %56
    fad mi
    r4 si' si si
    do do sol sol

    %59
    la sol8 fad si4 la
    sold mi la2~
    la sol!~

    %62
    sol fad
    mi1\mbreak
    re2 r

    %65
    R1
    sol
    sol

    %68
    sol
    sol
    sol~

    %71
    sol4 sol sol sol
    la la mi mi
    fa mi8 re sol4 fa

    %74
    mi do fa re
    sol2 do
    sol sol,\mbreak

    %77
    do4 r r2
    r4 fa sol2
    do,4 r r2

    %80
    r4 fa sol2
    do,\upl sol'\upl
    do\upl sol\upl

    %83
    do,4 r r2  %% OOKK

}

VIIItestoIV = \lyricmode {

    Glo -- ria _ Pa -- tri Pa -- tri et Fili - o et Spi -- ri -- tui _ Sanc - - to.

    Si -- cut e -- rat in prin -- cipi - o, et nunc et sem -- per et nunc et sem -- per sem -- per

    et nunc et sem -- per  et in sæ -- cula _ sæcu - lo - - rum a - - - - - men

    et - nunc et sem -- per et in sæ -- cula _ sæcu - lorum _ a - men

    et nunc et sem -- per et in sæ -- cula _ sæcu - lorum _ a - - - - - - men a -- men

    et in sæ -- cula _ sæcu - lorum _  a - men

    et nunc et sem -- per  et in sæ -- cula _ sæcu - lo -- rum a - - - men

    et nunc et sem -- per  et nunc et sem -- per  et in sæ -- cula _ sæcu - lo -- rum sæcu - lo -- rum

    a - men a - men  a - men a -- men a -- men.

}

VIIIbcn = \relative do {

    si8 si si si do do do do
    dod dod dod dod re re re re
    re re re re mi mi mi mi

    %4
    mi mi mi mi fa fa fad fad
    sol sol sol sol sol sol sol sol
    sol sol, sol sol sol sol sol sol

    %7
    sol sol sol sol sol4 r
    do'4 do, r
    r la' fa

    %10
    do' do, r
    r la' fa\mbreak
    do'4 do,8 mi re do

    %13
    si4 sol8 sol' la si
    do4 do,8 mi re do
    si4 sol8 sol' la si

    %16
    do4 do, do'
    si si, si'
    la2._\fermata

    %19
    sol
    r4 sol\tasto sol sol
    la la mi mi

    %22
    fa mi8 re sol4 fa
    mi4 <<{do' do do
           mi mi si si

           %25
           do si8 la re4 do
           si sol la si}\\{la sol fa
                           mi do sol'2~
                           sol fa~
                           fa mi4 re}>>
    do r \clef tenor do'2~

    %28
    do si~
    si la
    sol mi'

    %31
    do re
    \clef bass sol,1~
    sol4 sol sol sol

    %34
    la la mi mi
    fa mi8 re sol4 fa
    mi do fa2~

    %37
    fa mi\mbreak
    fa \clef tenor la4 la
    sib la8 sol do4 sib

    %40
    la sol8 fa sib4 la
    sol\clef bass la, la la
    sib sib fa' fa

    %43
    sol fa8 mi la4 sol
    fad re sol2~
    sol fa!~

    %46
    fa mi4 do
    re1
    do

    %49
    si
    la4 r la'2~
    la sol~

    %52
    sol fa4 fa
    sol fa8 mi la4 sol
    fad re sol2~

    %55
    sol fad~
    fad mi
    r4 si' si si

    %58
    do do sol sol
    la sol8 fad si4 la
    sold mi la2~

    %61
    la sol!~
    sol fad
    mi1\mbreak

    %64
    re2 \clef tenor si'
    la4 do re mi
    \clef bass <<{sol,1

                  %67
                  sol
                  sol
                  sol

                  %70
                  sol
                  sol4}\\{sol,1
                          sol
                          sol
                          sol
                          sol
                          \stemUp\shiftOn sol4}>>  sol' sol sol
    la la mi mi

    %73
    fa mi8 re sol4 fa
    mi do fa re
    sol2 do,

    %76
    sol' sol,\mbreak
    do4 r r2
    r4 fa sol sol,

    %79
    do r r2
    r4 fa sol sol,
    do2\upl sol'\upl

    %82
    do\upl sol\upl
    do,4 r r2

}

VIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <6>4 <5 10>
    <4 9 5> < 3 8>8 <4+ 6>
    <5 7->2 <4 6->4 <3! 5>
    s2 <3+ 5! 7>4 <4 6>
    <4 5!> <3! 6+> <6> <5 6>
    <3 5>8 <4 6> <9 7>4 <5 6>2
    <4 6> <4 5>4 <3>8 <2>
    <3 5>1
    <3 5>2.
    s4\bassFigureExtendersOn <6> <6>
    <3 5>2.
    s4 <6> <6>\bassFigureExtendersOff
    s2.
    <6>
    s
    <6>
    s
    <6>
    <7>2 <6+>4
    s2.
    s1*8
    <2 4>2 <3 6>
    <2 4>1
    <3 6>2 <3 5>
    <5 6> <3 5>
    <3 5 7> <4 6>
    <4 5> <3 5>
    <3 5> <6>
    <5 6> <3->
    <5- 6> <3>
    <2 4-> <5- 6>
    s <6>4 s
    \bassFigureExtendersOn <5 _ 6> <_>8 <_>16 s  <3_ 5>4 <_>\bassFigureExtendersOff
    s1
    <5 6>4 <4 5> <3+ 5>2
    <3 5> <6>
    <5 6> <3 5>
    <5 6> <3!>
    <2> <6>4 <5>
    <2>2 <6>
    <7> <6>
    <7> <6>
    <7> <6+>
    <3 6> <3 5>
    <2 4> <6>
    <2 4+> <6>
    <5 6> <3! 5>
    < 5 6> <3 5>
     <2 4><6>4 <5>
     <2 4>2 <6>4 <5>
     s4 <4 5+ 8> <3+ 5+ 8> <7>
     <3 5>2 <6>
     <5 6+> <3 5+>
     <5 6> <3 5>
     <2 4> <3 6>4 <5>
     <2 4+>2 <6>
     <7> <6!>
     <3+ 7> <6>
     \bassFigureExtendersOn <7>4 <7> <3!> <6>\bassFigureExtendersOff
     <3 5 7>2 <4 6>
     <4 5> <3 8>4 <7>
     <4 6>2 <3 5>
     <2 4> <2 5 7>
     <3 5> <4 6>
     <3 5> <3 5 8>4 <3 5 7>
     <3 5>2 <6>
     <5 6>4 s \bassFigureExtendersOn <3 _ 5> <_>\bassFigureExtendersOff
     <6>2 <3 7>4 <3 5>
     <3 5> 2<3 5>
     <4 5> <3>
     s1
     s2 <4>4 <3>
     s1
     s2 <4>4 <3>

}

forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 43
     \once\override Score.RehearsalMark.extra-offset = #'(+6 . -2.0) \mark\markup\huge "And[anti]no"
    s1*7
    \bar "||"\once\override Score.RehearsalMark.extra-offset = #'(+6 . -3.0)
    \mark\markup\huge "Adagio"
    \time 3/4
    \tempo 4 = 45
    s2.*12
    \bar "||"\once\override Score.RehearsalMark.extra-offset = #'(+6 . 0)
    \mark\markup\huge "[Allegro]"
    \time 4/4
    \tempo 1 = 45
    s1*64
    \bar "|."

}

VIIIcrI = {
    %\notypeset
    <<\VIIIcrIn \forma>>

}

VIIIcrII = {
    <<\VIIIcrIIn \forma>>

}

VIIIobI = {
    <<\VIIIobIn \forma>>

}

VIIIobII = {
    <<\VIIIobIIn \forma>>

}

VIIIvlI = {
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    <<\VIIIvlIIn \forma>>

}

VIIIvla = {
    \clef alto
    <<\VIIIvlan \forma>>

}

VIIIsoprano = {
    \new Voice = "gloria1"
    <<\VIIIsopranon \forma>>
}

VIIIalto = {
    \new Voice = "gloria2"
    <<\VIIIalton \forma>>
}

VIIItenore = {
    \new Voice = "gloria3"
    <<\VIIItenoren \forma>>
}

VIIIbasso = {
    \clef bass
    \new Voice = "gloria4"
    <<\VIIIbasson \forma>>
}

VIIIbc = {
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
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
%#(set-global-staff-size 16.5)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \con\tupletSpan 4

}

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {
        systems-per-page = #1
    }

    \header {
        subtitle = \markup {Dixit à 4. \super o con Ist[rumen]ti [1763]}
        composer = \markup {"B. Galuppi (1706-1785)"}
    }

    \markup \huge {[1.] All[egr]o con spirito}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Corni"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"french horn"
                        \IcrI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"french horn"
                        \IcrII\global
                    >>
                >>

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Oboè"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \IobI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \IobII\global
                    >>
                >>

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \Ivla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 3/4 \numericTimeSignature r2.^\markup\center-align "Soli"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \new Voice \Isolione \global
                    \new Voice \Isolitwo \global
                    \new Lyrics \lyricsto "dixit0" \Itesto
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 3/4 \numericTimeSignature r2.^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Isoprano \global
                    \new Lyrics \lyricsto "dixit1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 3/4\numericTimeSignature r2.^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Ialto \global
                    \new Lyrics \lyricsto "dixit2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 3/4\numericTimeSignature r2.^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \Itenore \global
                    \new Lyrics \lyricsto "dixit3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \Ibasso \global
                    \new Lyrics \lyricsto "dixit4" \ItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16.5)
            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[2.] Largo}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Oboè"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \IIobI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \IIobII\global
                    >>
                >>

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \IIvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key fa\major \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIsoprano \global
                    \new Lyrics \lyricsto "iuravit1" \IItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key fa\major \time4/4 r1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIalto \global
                    \new Lyrics \lyricsto "iuravit2" \IItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key fa\major \time4/4 r1^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \IItenore \global
                    \new Lyrics \lyricsto "iuravit3" \IItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIbasso \global
                    \new Lyrics \lyricsto "iuravit4" \IItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                \set Staff.midiInstrument = #"contrabass"
                \IIbc\global
            >>
        >>

        \layout {

           #(layout-set-staff-size 18.5)
            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[3. Allegro]}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Corni"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"french horn"
                        \IIIcrI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"french horn"
                        \IIIcrII\global
                    >>
                >>

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Oboè"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \IIIobI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \IIIobII\global
                    >>
                >>

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \IIIvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  = "soprano" <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key fa\major \time 3/8 \numericTimeSignature sol'8^\markup\center-align "[Canto]" sol' sol'}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \new Voice \IIIcantouno \global
                    \new Voice \IIIcantodue \global
                    \new Lyrics  \lyricsto "tu1" \IIItestoI
                    \new Lyrics \with { alignAboveContext = "soprano" }
                    \lyricsto "tu1" \IIItestoIbis
                >>

                \new Staff = "alto"<<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key fa\major \time 3/8\numericTimeSignature r4.^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \new Voice \IIIaltouno \global
                    \new Voice \IIIaltodue \global
                    \new Lyrics  \lyricsto "tu2" \IIItestoII
                    \new Lyrics \with { alignAboveContext = "alto" }
                    \lyricsto "tu2" \IIItestoIIbis
                >>

                \new Staff = "tenore" <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key fa\major \time 3/4\numericTimeSignature r4.^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \new Voice \IIItenoreuno \global
                    \new Voice \IIItenoredue \global
                    \new Lyrics  \lyricsto "tu3" \IIItestoIII
                    \new Lyrics \with { alignAboveContext = "tenore" } \lyricsto "tu3" \IIItestoIIIbis
                >>

                \new Staff = "basso" <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"voice oohs"
                   \new Voice \IIIbassouno \global
                    \new Voice \IIIbassodue \global
                    \new Lyrics  \lyricsto "tu4" \IIItestoIV
                    \new Lyrics \with { alignAboveContext = "basso" } \lyricsto "tu4" \IIItestoIVbis
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15.5)
            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {
        systems-per-page = #2
    }

    \markup \huge {[4.] Allegro à 2}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \IVvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso I]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVbassoI \global
                    \new Lyrics \lyricsto "dominus1" \IVtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso II]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVbassoII \global
                    \new Lyrics \lyricsto "dominus2" \IVtestoII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Primo, e""2do Organo"}
                \set Staff.midiInstrument = #"church organ"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {
        systems-per-page = #1
    }

    \markup \huge {[5.] Andantino}

    \score {
        <<

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key sib\major \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Vsoprano \global
                    \new Lyrics \lyricsto "in1" \VtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key sib\major \time 4/4 r1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Valto \global
                    \new Lyrics \lyricsto "in2" \VtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key sib\major \time 4/4 r1^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \Vtenore \global
                    \new Lyrics \lyricsto "in3" \VtestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \Vbasso \global
                    \new Lyrics \lyricsto "in4" \VtestoIV
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key sib\major \time 4/4 r1^\markup\center-align "[Canto I]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \VsopranoI \global
                    \new Lyrics \lyricsto "ju1" \VtestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key sib\major \time 4/4 r1^\markup\center-align "[Alto I]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \ValtoI \global
                    \new Lyrics \lyricsto "ju2" \VtestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key sib\major \time 4/4 r1^\markup\center-align"[Tenore I]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \VtenoreI \global
                    \new Lyrics \lyricsto "ju3" \VtestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso I]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \VbassoI \global
                    \new Lyrics \lyricsto "ju4" \VtestoV
                >>
        >>

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \Vvla\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.2"e Organo"}
                \set Staff.midiInstrument = #"cello"
                \Vbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16.5)
            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[6.] Implebit}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Oboè"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \VIobI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \VIobII\global
                    >>
                >>

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \VIvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff   = "soprano" <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key sib\major \time 3/8\numericTimeSignature re''8^\markup\center-align "[Canto]" re'' re''}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIsoprano \global
                    \new Lyrics  \lyricsto "implebit1" \VItestoI
                    \new Lyrics \with { alignAboveContext = "soprano" } \lyricsto "implebit1" \VItestoIbis
                >>

                \new Staff = "alto" <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key sib\major \time3/8\numericTimeSignature r4.^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIalto \global
                    \new Lyrics  \lyricsto "implebit2" \VItestoII
                    \new Lyrics \with { alignAboveContext = "alto" } \lyricsto "implebit2" \VItestoIIbis
                >>

                \new Staff = "tenore" <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key sib\major \time 3/8\numericTimeSignature r4.^\markup\center-align"[Tenore]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \VItenore \global
                    \new Lyrics  \lyricsto "implebit3" \VItestoIII
                    \new Lyrics \with { alignAboveContext = "tenore" } \lyricsto "implebit3" \VItestoIIIbis
                >>

                \new Staff = "basso" <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIbasso \global
                    \new Lyrics  \lyricsto "implebit4" \VItestoIV
                    \new Lyrics \with { alignAboveContext = "basso" } \lyricsto "implebit4" \VItestoIVbis
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Organi""[Bassi]"}
                \set Staff.midiInstrument = #"contrabass"
                \VIbc\global
            >>
        >>

        \layout {

           #(layout-set-staff-size 18.5)
            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {
        systems-per-page = #2
    }

    \markup \huge {[7.] Andante}

    \score {

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \VIIvla\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key mib\major \time 2/2 r1^\markup\center-align "[Canto]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \clef violin
                    \VIIsoprano \global
                    \new Lyrics \lyricsto "torrente" \VIItesto
                >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Organo e""Bassi]"}
                \set Staff.midiInstrument = #"cello"
                \VIIbc\global
            >>
            >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}

\bookpart {

    \paper {
        systems-per-page = #1
    }

    \markup \huge {[8.] Gloria}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Corni"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"french horn"
                        \VIIIcrI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"french horn"
                        \VIIIcrII\global
                    >>
                >>

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Oboè"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \VIIIobI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \VIIIobII\global
                    >>
                >>

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIIIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIIIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \VIIIvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 re''4^\markup\center-align "[Canto]" re''8 re''}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \new Voice \VIIIsoprano \global
                    \new Lyrics \lyricsto "gloria1" \VIIItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 fa'4^\markup\center-align "[Alto]" fa'8 fa'}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIIIalto \global
                    \new Lyrics \lyricsto "gloria2" \VIIItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 re'4^\markup\center-align"[Tenore]" re'8 re'}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIIItenore \global
                    \new Lyrics \lyricsto "gloria3" \VIIItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIIIbasso \global
                    \new Lyrics \lyricsto "gloria4" \VIIItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Organo"\vspace #-0.2"e Violone]"}
                \set Staff.midiInstrument = #"contrabass"
                \VIIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 16.5)
            indent = 2.2\cm
            incipit-width =2.3\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

}
