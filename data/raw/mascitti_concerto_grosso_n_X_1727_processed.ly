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

arco = _\markup \italic \center-align"con l'arco"

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

IvlIn = \relative do'' {

    mi4. r16 mi red8. [red16 mi8. mi16]
    si2 re!4. r16 re
    dod8.[dod16 re8. re16] la2

    %4
    do!4. r16 do si8.[si16 do8. do16]
    sol8.[la16 sol8. fad16] mi8.[fad16 sol8. la16]
    si4 si, mi2

    %7
    mi'8.[fad16 sol8. mi16] fad4 si~
    si8. mi,16 la4~la8.[si16 sol8. la16]\mbreak
    fad2 mi8.[sol16 fad8. mi16]

    %10
    fad4. si8 sold8. mi16 la4~
    la8. re,16 sol4~sol8.[la16 fad8. sol16]
    mi4. la8 fad8. re16 sol4~

    %13
    sol fad sol r8 re\p
    do'4. re8 si4. si8
    la4. si8 sol8. la16 si4~

    %16
    si la si2
    fad4.\f r16 fad fad4 fad
    fad2 mi4. r16 mi

    %19
    mi4 mi mi2\mbreak
    re4. r16 re re4 re
    re8.[re16 dod8. si16] si4 lad

    %22
    si re4. re8 re4~
    re8.[re16 mi8. si16] do8. mi,16 do'4~
    do8. la16 do4. la8[re8. la16]

    %25
    si8. sol16 si4. sol8 si4~
    si8. [sol16 do8. si16] la8. fad16 la4~
    la8. fad16 la4~la8.[fad16 si8. la16]\mbreak

    %28
    sol8. si16 mi4. red8[red8. red16]
    sol4 r8 sold8 la8.[la16 si8. si16]
    do4. r16 la si8.[si16 la8. la16]

    %31
    si4. si8 la4. si8
    sol4. sol8 fad4. fad8
    mi4. fad8 re4. mi8

    %34
    do4. do8 si4. sol'8
    la8.[sol16 fad8. mi16] red4. r16 fad
    sol8.[sol16 fad8. fad16]\mbreak sol4 sold8. sold16

    %37
    la8.[la16 si8. si16] do8. [do16 si8. si16]
    la8. [la16 la8. la16] sol4 sol\p
    fad2. sol4

    %40
    fad2. fad4
    fad2 mi
    si4.\f r16 si si4 si

    %43
    si2 la4. r16 la
    la4 la la2
    sol4. r16 sol sol4 sol\mbreak

    %46
    sol8.[sol16 fad8. mi16] red4. r16 fad
    sol8.[sol16 fad8. fad16] sol4 r8 r16 sold
    la8.[la16 si8. si16] do8.[do16 si8. si16]

    %49
    si8.[si16 la8. la16] sol4 sol
    fad2. sol4
    fad2. fad4

    %52
    fad2 mi4 si'~
    si la si2\fermata

}

IvlIIn = \relative do'' {

    mi4. r16 mi red8. [red16 mi8. mi16]
    si2 re!4. r16 re
    dod8.[dod16 re8. re16] la2

    %4
    do!4. r16 do si8.[si16 do8. do16]
    sol8.[la16 sol8. fad16] mi8.[fad16 sol8. la16]
    si4 si, mi2

    %7
    si'4 mi2 re4
    dod4. fad8\mbreak red8. si16 mi4~
    mi red mi8. si16 mi4~

    %10
    mi re?2 do8. la16
    si4. mi8 dod8. la16 re4~
    re do?4. re8[si8. do16]

    %13
    la4. re8 si8. sol16 sol'4\p~
    sol fad4. si,8 mi4~
    mi red mi fad

    %16
    mi2 red
    re!4.\f r16 re dod8.[dod16 re8. re16]
    lad2 dod4. r16 dod\mbreak

    %19
    si8.[si16 dod8. dod16] sold2
    si4. r16 si la8.[la16 si8. si16]
    fad8.[fad16 mi8. re16] dod2

    %22
    si4. fad'8 mi8.[mi16 sold8. la16]
    si4. sold8 la4. mi8
    la4 fad8. sol?16 la4. fad8

    %25
    sol8.[re16 re8. re16] sol4. fad8
    mi4 sol8. mi16 do'4. do8
    fad,4. mi8 red4 fad8. red16\mbreak

    %28
    mi4 r8 si' fad'4 fad~
    fad8. [si,16 mi8. si16] mi8.[mi16 mi8. sold16]
    la4. r16 fad sol8.[sol16 fad8. fad16]

    %31
    sol8. re16 sol2 fad4~
    fad mi4. fad8 re4~
    re8 mi do4. re8 si4~

    %34
    si8 do la4~ la8.[si16 sol8. si16]
    do8.[si16 la8. sol16] fad4. r16 red'

    %36
    mi8.[mi16 red8. red16] mi4. r16 mi\mbreak
    mi8. [mi16 mi8. sold16] la8.[la16 sol8. sol16]
    sol8.[sol16 fad8. fad16] fad4 mi\p~

    %39
    mi mi mi2~
    mi4 mi mi2~
    mi4 red mi2

    %42
    sol,4.\f r16 sol fad8.[fad16 sol8. sol16]
    red2 fad4. r16 fad
    mi8.[mi16 fad8. fad16] dod2

    %45
    mi4. r16 mi re8.[re16 mi8. mi16]\mbreak
    si8.[si'16 la8. sol16] fad4. r16 red
    mi8.[mi16 red8. red16] mi4. r16 mi

    %48
    mi8.[mi16 mi8. sold16] la4 red,8. red16
    mi8.[mi16 fad8. fad16] fad4 mi~
    mi mi mi2~

    %51
    mi4 mi mi2~
    mi4 red mi fad
    mi2 red\fermata

}

IbcIn = \relative do {

    mi'4. r16 mi red8. [red16 mi8. mi16]
    si2 re!4. r16 re
    dod8.[dod16 re8. re16] la2

    %4
    do!4. r16 do si8.[si16 do8. do16]
    sol8.[la16 sol8. fad16] mi8.[fad16 sol8. la16]
    si4 si, mi2

    %7
    mi4. mi8 si'4. si,8
    mi8.[mi16 fad8. fad16] si,4 do\mbreak
    la si mi4. mi8

    %10
    la8.[fad16 si8. si,16] mi4 fa
    re mi la si
    sol la re, mi

    %13
    do re sol,4. si'8^\p
    la8.[la16 re8. re16] sol,4. do8
    fad,8.[fad16 si8. si16] mi,4 re

    %16
    do2 si
    si'4.^\f r16 si lad8.[lad16 si8. si16]
    fad2 la!4. r16 la

    %19
    sold8.[sold16 la8. la16] mi2\mbreak
    sol!4. r16 sol fad8.[fad16 sol8. sol16]
    re4 mi fad fad,

    %22
    si8.[si'16 si8. la16] sold8.[sold16 sold8. fad16]
    mi8.[fad16 sold8. mi16] la,8.[la'16 la8. sol?16]
    fad8.[fad16 fad8. mi16] re8.[mi16 fad8. re16]

    %25
    sol,8.[sol'16 sol8. fad16] mi8.[mi16 mi8. re16]
    do8.[re16 mi8. do16] fad,8.[fad'16 fad8. mi16]
    red8.[red16 red8. dod16] si8.[dod16 red8. si16]\mbreak

    %28
    mi8.[fad16 sol8. mi16] la8.[fad16 si8. si,16]
    mi8.[mi'16 mi8. re16] do8.[la16 sold8. mi16]
    la8.[si16 do8. re16] sol,4 re

    %31
    sol,8.[sol'16 si8. sol16] dod,8.[dod16 red8. si16]
    mi8.[fad16 sol8. mi16] la8.[la16 si8. si16]
    sold8.[sold16 la8. la16] fad8.[fad16 sol?8. sol16]

    %34
    mi8.[mi16 fad8. fad16] red8. [red16 mi8. mi16]
    la,4. la8 si8.[dod16 red8. si16]
    mi4 si\mbreak mi8. [mi'16 mi8. re16]

    %37
    do8.[la16 sold8. mi16] la4 si
    dod red mi8.[mi16 sol,8.^\p sol16]
    la8.[la16 si8. si16] do8.[do16 sol8. sol16]

    %40
    la8.[la16 si8. si16] do8.[do16 lad8. lad16]
    si4 si, mi2
    mi4.\f r16 mi red8.[red16 mi8. mi16]

    %43
    si2 re!4. r16 re
    dod8.[dod16 re8. re16] la2
    do!4. r16 do si8.[si16 do8. do16]\mbreak

    %46
    sol4 la si8.[dod16 red8. si16]
    mi4 si mi,8.[mi'16 mi8. re16]
    do8.[la'16 sold8. mi16] la,8.[la16 si8. si16]

    %49
    dod8.[dod16 red8. red16] mi8.[mi,16 sol8. mi16]
    la8.[la16 si8. si16] do?8.[do16 sol8. sol16]
    la8.[la16 si8. si16] do8.[do16 lad8. lad16]

    %52
    si4 si mi re
    do2 si\fermata

}

IvlIIIn = \relative do'' {

    mi4. r16 mi red8. [red16 mi8. mi16]
    si2 re!4. r16 re
    dod8.[dod16 re8. re16] la2

    %4
    do!4. r16 do si8.[si16 do8. do16]
    sol8.[la16 sol8. fad16] mi8.[fad16 sol8. la16]
    si4 si, mi2

    %7
    mi'8.[fad16 sol8. mi16] fad4 si~
    si8. mi,16 la4~la8.[si16 sol8. la16]\mbreak
    fad2 mi8.[sol16 fad8. mi16]

    %10
    fad4. si8 sold8. mi16 la4~
    la8. re,16 sol4~sol8.[la16 fad8. sol16]
    mi4. la8 fad8. re16 sol4~

    %13
    sol fad sol r
    R1*3
    fad4.\f r16 fad fad4 fad
    fad2 mi4. r16 mi

    %19
    mi4 mi mi2\mbreak
    re4. r16 re re4 re
    re8.[re16 dod8. si16] si4 lad

    %22
    si re4. re8 re4~
    re8.[re16 mi8. si16] do8. mi,16 do'4~
    do8. la16 do4. la8[re8. la16]

    %25
    si8. sol16 si4. sol8 si4~
    si8. [sol16 do8. si16] la8. fad16 la4~
    la8. fad16 la4~la8.[fad16 si8. la16]\mbreak

    %28
    sol8. si16 mi4. red8[red8. red16]
    sol4 r8 sold8 la8.[la16 si8. si16]
    do4. r16 la si8.[si16 la8. la16]

    %31
    si4. si8 la4. si8
    sol4. sol8 fad4. fad8
    mi4. fad8 re4. mi8

    %34
    do4. do8 si4. sol'8
    la8.[sol16 fad8. mi16] red4. r16 fad
    sol8.[sol16 fad8. fad16]\mbreak sol4 r8 r16 sold

    %37
    la8.[la16 si8. si16] do8. [do16 si8. si16]
    la8. [la16 la8. la16] sol4 r
    R1*3
    si,4.\f r16 si si4 si

    %43
    si2 la4. r16 la
    la4 la la2
    sol4. r16 sol sol4 sol\mbreak

    %46
    sol8.[sol16 fad8. mi16] red4. r16 fad
    sol8.[sol16 fad8. fad16] sol4 r8 r16 sold
    la8.[la16 si8. si16] do8.[do16 si8. si16]

    %49
    si8.[si16 la8. la16] sol4 sol
    fad2. sol4
    fad2. fad4

    %52
    fad2 mi4 si'~
    si la si2\fermata

}

Ivlan = \relative do' {

    mi'4. r16 mi red8. [red16 mi8. mi16]
    si2 re!4. r16 re
    dod8.[dod16 re8. re16] la2

    %4
    do!4. r16 do si8.[si16 do8. do16]
    sol8.[la16 sol8. fad16] mi8.[fad16 sol8. la16]
    si4 si, mi2

    %7
    sol4. sol8 fad4 fad
    sol fad\mbreak fad mi
    do' si si4. sol8

    %10
    do4 si si la
    fa mi mi re
    si' la la sol

    %13
    mi re re r
    R1*3
    si'4.\f r16 fad fad8.[dod'16 si8. si16]

    %18
    dod2 la4. r16 la
    mi8.[si'16 la8. la16] si2
    sol4. r16 sol re8.[la'16 sol8. sol16]

    %21
    si8.[fad16 sol8. sol16]\mbreak fad2
    fad4. fad8 si,8.[si16 mi8. fad16]
    sold4 mi8. mi16 mi4. mi8

    %24
    re8.[re16 re8. mi16] fad4 re
    re si8. re16 mi4. fad8
    sol4 mi8. sol16 fad8. [red16 red8. mi16]

    %27
    fad8.[red16 si8. mi16] fad4 red
    si r8 sol' do?8.[la16 si8. si16]
    si4 sold8. sold16 mi8.[do'16 si8. sold16]\mbreak

    %30
    mi4. r16 re re4 re
    re4. r16 re mi8.[mi16 fad8. red16]
    sol8.[la16 si8. sol16] do8.[do16 si8. si16]

    %33
    si8.[si16 la8. la16] la8. [la16 sol8. sol16]
    sol8.[sol16 fad8. fad16] fad8.[fad16 mi8. mi16]
    mi4 do' si4. r16 si

    %36
    si4 si si4. r16 mi,
    mi4 mi mi r8 si'\mbreak
    mi,4 fad si, r

    %39
    R1*3
    si4.\f r16 mi fad8.[fad16 si,8. mi16]
    fad2 fad4. r16 re

    %44
    mi8.[la,16 la8. re16] mi2
    do4. r16 do re8.[sol,16 sol8. do16]
    re4 do8. do'16 si4. r16 si,

    %47
    si4 si si4. r16 si
    do8.[do16 si8. mi16] mi8. [la16 fad8. fad16]\mbreak
    mi8.[dod16 si8. si16] si4 si

    %50
    do si mi si
    do si mi dod
    si2 si4 fad

    %53
    sol mi fad2\fermopz

}

IbcIIn = \relative do {

    mi'4. r16 mi red8. [red16 mi8. mi16]
    si2 re!4. r16 re
    dod8.[dod16 re8. re16] la2

    %4
    do!4. r16 do si8.[si16 do8. do16]
    sol8.[la16 sol8. fad16] mi8.[fad16 sol8. la16]
    si4 si, mi2

    %7
    mi4. mi8 si'4. si,8
    mi8.[mi16 fad8. fad16] si,4 do\mbreak
    la si mi4. mi8

    %10
    la8.[fad16 si8. si,16] mi4 fa
    re mi la si
    sol la re, mi

    %13
    do re sol,4 r
    R1*3
    si'4.^\f r16 si lad8.[lad16 si8. si16]
    fad2 la!4. r16 la

    %19
    sold8.[sold16 la8. la16] mi2\mbreak
    sol!4. r16 sol fad8.[fad16 sol8. sol16]
    re4 mi fad fad,

    %22
    si8.[si'16 si8. la16] sold8.[sold16 sold8. fad16]
    mi8.[fad16 sold8. mi16] la,8.[la'16 la8. sol?16]
    fad8.[fad16 fad8. mi16] re8.[mi16 fad8. re16]

    %25
    sol,8.[sol'16 sol8. fad16] mi8.[mi16 mi8. re16]
    do8.[re16 mi8. do16] fad,8.[fad'16 fad8. mi16]
    red8.[red16 red8. dod16] si8.[dod16 red8. si16]\mbreak

    %28
    mi8.[fad16 sol8. mi16] la8.[fad16 si8. si,16]
    mi8.[mi'16 mi8. re16] do8.[la16 sold8. mi16]
    la8.[si16 do8. re16] sol,4 re

    %31
    sol,8.[sol'16 si8. sol16] dod,8.[dod16 red8. si16]
    mi8.[fad16 sol8. mi16] la8.[la16 si8. si16]
    sold8.[sold16 la8. la16] fad8.[fad16 sol?8. sol16]

    %34
    mi8.[mi16 fad8. fad16] red8. [red16 mi8. mi16]
    la,4. la8 si8.[dod16 red8. si16]
    mi4 si\mbreak mi8. [mi'16 mi8. re16]

    %37
    do8.[la16 sold8. mi16] la,4 si
    dod red mi r
    R1*3
    mi4.\f r16 mi red8.[red16 mi8. mi16]

    %43
    si2 re!4. r16 re
    dod8.[dod16 re8. re16] la2
    do!4. r16 do si8.[si16 do8. do16]\mbreak

    %46
    sol4 la si8.[dod16 red8. si16]
    mi4 si mi,8.[mi'16 mi8. re16]
    do8.[la'16 sold8. mi16] la,8.[la16 si8. si16]

    %49
    dod8.[dod16 red8. red16] mi8.[mi,16 sol8. mi16]
    la8.[la16 si8. si16] do?8.[do16 sol8. sol16]
    la8.[la16 si8. si16] do8.[do16 lad8. lad16]

    %52
    si4 si mi re
    do2 si\fermata

}

IbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    <_+>1
    <6>2 <_+>
    s <6>
    <6> s4 <6>
    <4> <3+> s2
    s <4>4. <3->8
    <6+ 5>2 <7 _+>
    <6 5>4 <_+> s2
    <6 5>4 <_-> <7 _+> s
    <6 5 _-> <_-> <7 _+> s
    <6 5>2 <7>
    <6 5> s4. <6>8
    <7>4 <7> <7> <6>8 <7>
    <7>4 <7 _+> s <6>
    <7> <6> <_+>2
    <_-> <6>
    <_+> <_+>
    <6>4 <_+> <_+> s
    s2 <6>
    <6>4 <6+ 5> <4> <3+>
    s2 <6 5->
    <7 _+> s
    <6 5-> <7>
    s1
    <7>2 <6+ 5->
    <6 5-> <7 _+>
    s2 <6 5>4 <_+>
    <9> <8 _+> <6> <6 5->
    s1
    s2 <6 5->4 <5->
    <9> <6> <6 5> <_->
    <6 5->2 <6 5->
    <6 5> <6 5->
    s <_+>
    s4 <_+> <_-> <_+>
    <6> <6> s <6 _->
    <6 5-> <5-> <9> <6>
    <6 5> <5 4> <4 3> <6>
    <6 5> <5 4> <4 3> <6 5->
    <4> <3+> s2
    s <6>
    <_+> s
    <6> <_+>
    s <6>
    s4 <6 5> <_+>2
    s4 <_+> <_-> <_+>
    <6> <6 5-> s <_+>
    <7> <5-> <9> <6>
    <6 5> <5 4> <4 3> <6>
    <6 5> <5 4> <4 3> <6 5->
    <4> <3+> s <6>
    <7> <6> <_+>

}

IbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>
    <_+>1
    <6>2 <_+>
    s <6>
    <6> s4 <6>
    <4> <3+> s2
    s <4>4. <3->8
    <6+ 5>2 <7 _+>
    <6 5>4 <_+> s2
    <6 5>4 <_-> <7 _+> s
    <6 5 _-> <_-> <7 _+> s
    <6 5>2 <7>
    <6 5> s4 s
    s1*3
    <_->2 <6>
    <_+> <_+>
    <6>4 <_+> <_+> s
    s2 <6>
    <6>4 <6+ 5> <4> <3+>
    s2 <6 5->
    <7 _+> s
    <6 5-> <7>
    s1
    <7>2 <6+ 5->
    <6 5-> <7 _+>
    s2 <6 5>4 <_+>
    <9> <8 _+> <6> <6 5->
    s1
    s2 <6 5->4 <5->
    <9> <6> <6 5> <_->
    <6 5->2 <6 5->
    <6 5> <6 5->
    s <_+>
    s4 <_+> <_-> <_+>
    <6> <6 5-> s <6! _->
    <6 5-> <5-> <9> s
    s1*3
    s2 <6>
    <_+> s
    <6> <_+>
    s <6>
    s4 <6 5> <_+>2
    s4 <_+> <_-> <_+>
    <6> <6 5-> s <_+>
    <7> <5-> <9> <6>
    <6 5> <5 4> <4 3> <6>
    <6 5> <5 4> <4 3> <6 5->
    <4> <3+> s <6>
    <7> <6> <_+>

}


forma = {

    \key mi\minor
    \time 4/4
    \tempo 2 = 50
    s1*52
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -3.0)
    \mark\markup\huge "Adagio"
    \tempo 4 = 45
    s1
    \bar "|."

}


IvlI = {
    \notypeset
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

IbcI = {
    \clef bass
    <<\IbcIn \forma \IbfIn>>

}

IvlIII = {
    <<\IvlIIIn \forma>>

}


Ivla = {
    \clef alto
    <<\Ivlan \forma>>

}


IbcII = {
    \clef bass
    << \IbcIIn \forma \IbfIIn >>
    \typeset

}

IIvlIn = \relative do'' {

    r8 sol' sol sol fad4 si
    mi, la4. sol8[sol la16 sol]
    fad8 sol fad4 mi16 sol fad sol mi fad sol la

    %4
    si8[fad16 mi fad8 si,] mi dod dod dod
    red [si si dod16 si] lad4 si~
    si lad si8 si'\p si si

    %7
    lad4 la sol8 mi\f si do16 si
    la8[la la si16 la]\mbreak sol8 mi4 mi'8
    red si mi2 red4

    %10
    mi8 si mi2 re?4~
    re do2 si4~
    si la4. sol8 sol sol

    %13
    fad4 si2 lad4
    si16 re dod re si dod re mi fad8[mi16 re dod8 red]
    mi4. mi,8\mbreak fad si si si

    %16
    do mi mi mi re[re re mi16 re]
    dod8 la la la sol16 la sol fad mi fad sol la
    fad8 re sol2 fad4

    %19
    sol r8 re' do'16 si do re do re do re
    si la si do si do si do la sol la si la si la si
    sol fad sol la sol la sol la fad mi fad sol fad sol fad sol\mbreak

    %22
    mi red mi fad mi fad mi fad red8 si mi4~
    mi red mi16 fad sol mi fad si, si' la
    sol8 mi4 red8 mi re dod4

    %25
    si16 dod re si dod fad, fad' mi re8 si4 lad8
    si'16 si, si si' la si, si la' sol4 sold\tr
    la16 la, la la' sol la, la sol' fad4 fad\tr\mbreak

    %28
    sol16 sol, sol sol' fa sol, sol fa' mi sol la sol mi sol la sol
    fad? la si la fad la si la sol mi sol si sol mi sol si
    sold mi sold si sold mi sold si la[mi la mi la mi la mi]

    %31
    lad[mi lad mi lad mi lad mi] si' fad sol fad re fad sol re
    dod fad sol fad dod fad sol fad\mbreak si, mi fad mi si mi fad mi
    lad, fad' sol fad si re, dod si sol' fad mi re dod4

    %34
    si16 re\p dod re si dod re mi fad8[mi16 re dod8 red]
    mi si\f mi4. re8 re re
    re[do do si16 la] si4. si8

    %37
    mi,16 mi' re mi la, si do la re,8 re' re re
    si4 r8 re\mbreak la'16 sol la si la si sol la
    si8 sol\p si do re[do16 si la8 si]

    %40
    do[si16 la sol8 la] si[la16 sol fad8 sol]
    la[sol16 fad mi8 fad] sol[la16 si la8 sol]
    fad si\f si si si mi, la4~

    %43
    la8 sol sol sol fad4 si~
    si8 la la la re,4 sol~
    sol8 fad fad mi red si mi4~\mbreak

    %46
    mi red mi8[re16\p do si8 do]
    re[do16 si la8 si] do[si16 la sol8 la]
    si[la16 sol fad8 sol] la[sol16 fad mi8 fad]

    %49
    sol[la16 si la8 sol] fad si\f si si
    si mi, la4. sol8 sol sol
    fad4 si4. la8 la la

    %52
    re,4 sol4. fad8 fad mi
    red si mi2 red4
    mi1\fermata

}

IIvlIIn = \relative do'' {

    R1*3
    r8 re re re dod4 fad
    si, mi4. re8[re mi16 re]

    %6
    dod8 re dod4 si16\p re dod re si dod re mi
    fad8 mi16 re dod8 red mi si\f mi4~
    mi re4. do?8[do si16 la]

    %9
    si8[si si do16 si] la8[la la si16 la]
    sol8 sol' sol sol fad8.[sol16 la8 si]\mbreak
    mi,8.[fad16 sol8 la] re,8.[mi16 fad8 sol]

    %12
    dod,8.[red16 mi8 fad] si,4. si8
    la fad' fad fad mi[mi mi fad16 mi]
    re8 si r si dod fad fad fad

    %15
    si,16 sol fad sol mi fad sol la si8[la16 sol fad8 sold]
    la mi la2 sol?4~
    sol8 fad fad fad mi4 la

    %18
    re,8 re' re re\mbreak do16 re do si la si do la
    si8 re sol4. fad8 fad fad
    fad mi mi4. re8 re re

    %21
    re do do4. si8 si si
    si la la4. sol8[sol la16 sol]
    fad8 sol fad4 mi8 mi'4 red8

    %24
    mi16 fad sol mi fad si, si' la sol8 si4 lad8
    si si,4 lad8 si16 dod re si dod fad, fad' mi\mbreak
    re4 red mi16 mi, mi mi' re? mi, mi re'

    %27
    do4 dod re16 re, re re' do? re, re do'
    si4. si8 sol[mi] r la
    la fad r si si sol r si

    %30
    si si si si mi, mi mi mi'
    mi mi, mi mi' re4 r8 sol
    sol dod, fad r r si, mi r

    %33
    r dod fad, si si dod16 si si8. lad16\mbreak
    si8 si'\p si si lad4 la
    sol8[mi si\f do16 si] la4. si16 la

    %36
    sold8 mi' mi mi re16 do re mi re fa mi re
    do8 la do4. la8 fad re
    r re' sol4~sol8 fad fad16 sol mi fad

    %39
    sol4 sol8\p la si[la16 sol fad8 sol]
    la[sol16 fad mi8 fad] sol[fad16 mi red8 mi]\mbreak
    fad[mi16 red? dod8 red!] mi[fad16 sol fad8 mi]

    %42
    <<{\stemUp red4. red8}\\{s8 s\f s4}>> mi4. fad8
    si,4. si'8 la fad fad fad
    mi4. mi8 fad re re re

    %45
    dod4 do si4. do8
    sol4 fad mi r
    si'8\p[la16 sol fad8 sol] la[sol16 fad mi8 fad]

    %48
    sol[fad16 mi red8 mi] fad[mi16 red dod8 red] \mbreak
    mi[fad16 sol fad8 mi] <<{\stemUp red4. red8}\\{s8 s\f s4}>>
    mi4. fad8 si,4. si'8

    %51
    la fad fad fad mi4. mi8
    fad re re re dod4 do
    si8 si' si do sol fad fad4

    %54
    mi1\fermata

}

IIbcIn = \relative do {

    mi4 mi'4. re8 re re
    do si do la si4 mi,
    si'8 la si si, mi4. mi'8

    %4
    re4 si~si8 la la la
    la4 sol fad si
    fad fad, si r

    %7
    r2 r8 sol'\parenthesize  ^\f sol sol
    fad4 si\mbreak mi, la~
    la8[sol sol la16 sol] fad4 si,

    %10
    mi16 sol fad sol mi fad sol la si8[la16 sol fad8 sol]
    la8[sol16 fad mi8 fad] sol[fad16 mi re8 mi]
    fad[mi16 red dod8 red] mi si mi4~

    %13
    mi8 re? re re dod4 fad
    si,8 si' si si lad4 la
    sol8 mi mi mi\mbreak red4 re

    %16
    r8 do do do si4 mi
    la, re2 do4~
    do8 si si si la4 re

    %19
    \once\stemUp sol,8 si' si si la4 re
    sol,8 do do do fad,4 si
    mi,8 la la la re,4 sol\mbreak

    %22
    do,8 fad fad fad si,4 do
    la si mi si
    mi si' mi,8 si fad' fad,

    %25
    si4 fad si fad'
    si8 si, si si mi, mi' mi mi
    la la, la la re, re' re re\mbreak

    %28
    sol sol, sol sol do do dod dod
    re re red red mi mi mi mi
    re re re re do? do do do

    %31
    dod dod dod dod si si' si si
    lad4 la\mbreak sold sol
    fad re mi fad

    %34
    si, r r2
    r8 sol'^\f sol sol fad4 si
    mi, la2 sold4

    %37
    r8 la la la fad4 re
    sol8 sol si sol\mbreak do la re re,
    sol4 r si8[do re do16 si]

    %40
    la8[si do si16 la] sol8[la si la16 sol]
    fad8[sol la sol16 fad] mi4 la,
    <<{\stemUp si4. si8}\\{s8 s\f s4}>> dod4. red8

    %43
    mi4 mi'~mi8 re re re
    dod4 do~do8 si si si
    lad4 la~la8 sol sol la\mbreak

    %46
    si4 si, mi mi'8\parenthesize \p re16 do
    si8[do re do16 si] la8[si do si16 la]
    sol8[la si la16 sol] fad8[sol la sol16 fad]

    %49
    mi4 la, <<{\stemUp si4. si8}\\{s8 s\f s4}>>
    dod4. red8 mi si mi4~
    mi8 re re re dod4 do~

    %52
    do8 si si si lad4 la~
    la8 sol sol la si la si4
    mi,1\fermata

}

IIvlIIIn = \relative do'' {

   R1*7
   r2 r8 do\parenthesize \f [do si16 la]
   si8 si mi2 red4

   %10
   mi8 si mi2 re?4~
   re do2 si4~
   si la4. sol8 sol sol

    %13
    fad4 si2 lad4
    si16 re dod re si dod re mi fad8[mi16 re dod8 red]
    mi4. mi,8\mbreak fad si si si

    %16
    do mi mi mi re[re re mi16 re]
    dod8 la la la sol16 la sol fad mi fad sol mi
    fad8 re sol2 fad4

    %19
    sol r8 re' mi do fad la,
    si sol mi' sol, la fad re' fad,
    sol mi do' mi, fad re si' re,

    %22
    mi do la' do si si mi4~
    mi red mi8 mi fad si,
    si mi4 red8 mi re dod4

    %25
    si8 si dod fad, re' si4 lad8
    si si si si si si si si
    do? la la la\mbreak la la la la

    %28
    si sol sol sol sol do, r mi
    re fad r fad mi si' r sol
    sold mi sold mi mi do' la la

    %31
    lad dod mi dod fad4 r8 re
    dod4 r8 dod si si r si
    lad4 r8 si si mi16 re dod4

    %34
    si r r2
    r8 si\f mi4. re8 re re
    re[do do si16 la] si4. si8

    %37
    mi,16 mi' re mi la, si do la re,8 re' re re
    si4 r8 re\mbreak la'16 sol la si la si sol la
    si8 sol r4 r2

    %40
    R1*2
    r8 si\f si si si mi, la4~

    %43
    la8 sol sol sol fad4 si~
    si8 la la la re,4 sol~
    sol8 fad fad mi red si mi4~\mbreak

    %46
    mi red mi  r
    R1*2
    r2 r8 si\f si si

    %50
    si mi, la4. sol8 sol sol
    fad4 si4. la8 la la
    re,4 sol4. fad8 fad mi

    %53
    red si mi2 red4
    mi1\fermata

}

IIvlan = \relative do' {

   R1*7
   r2 r8 mi\parenthesize \f  mi mi
   fad sol mi mi fad fad fad fad

   %10
   mi4 r r2
   R1*2
   r2 r8 dod dod dod

   %14
   re re re re dod4. fad8
   sol4. si,8 si4. si8
   la la do? la fad'4 mi

   %17
   mi re\mbreak si do
   la8 si sol re' mi la, la re
   re4 r r8 la' la fad

   %20
   sol4. mi8 fad4. re8
   mi4. do8 re4. si8
   do4. la8 si4 sol8 do

   %23
   do do' si4 si8 si si fad
   sol si si fad sol fad fad4
   fad8 fad fad dod\mbreak re fad fad dod

   %26
   re fad fad fad mi sol si mi,
   mi mi mi mi re fad la re,
   re re re sol, sol4 r8 mi'

   %29
   fad re r fad sol mi r sol
   mi mi mi mi la mi do la
   fad' dod lad dod re si r si\mbreak

   %32
   dod lad r fad' fad sold r mi
   mi4 fad8 fad mi dod dod fad
   re4 r r2

   %35
   R1
   r8 mi\f do mi fa4 mi8 si
   do4. la'8 la4 la8 fad

   %38
   re4 r8 si' mi, do re re
   re4 r r2
   R1*2

   %42
   r8 fad\f fad fad\mbreak mi dod r si
   si4 r8 si' do re fad, si
   dod mi, r la la si sol si,

   %45
   dod4 la8 mi' fad sol mi do?
   si4 si si r
   R1*2

   %49
   r2 r8 fad'\f fad fad
   mi dod r si si4. sol8
   do re si mi mi dod r mi,\mbreak

   %52
   la si sol si dod lad r mi'
   fad sol mi do si do si4
   si1\fermata

}

IIbcIIn = \relative do {

    R1*6
    r2 r8 sol'\parenthesize ^\f sol sol
    fad4 si\mbreak mi, la~
    la8[sol sol la16 sol] fad4 si,

    %10
    mi4. mi8 si'8[la16 sol fad8 sol]
    la8[sol16 fad mi8 fad] sol[fad16 mi re8 mi]
    fad[mi16 red dod8 red] mi si mi4~

    %13
    mi8 re? re re dod4 fad
    si,8 si' si si lad4 la
    sol8 mi mi mi\mbreak red4 re

    %16
    r8 do do do si4 mi
    la, re2 do4~
    do8 si si si la4 re

    %19
    \once\stemUp sol,8 si' si si la4 re
    sol,8 do do do fad,4 si
    mi,8 la la la re,4 sol\mbreak

    %22
    do,8 fad fad fad si,4 do
    la si mi si
    mi si' mi,8 si fad' fad,

    %25
    si4 fad si fad'
    si8 si, si si mi, mi' mi mi
    la la, la la re, re' re re\mbreak

    %28
    sol sol, sol sol do do dod dod
    re re red red mi mi mi mi
    re re re re do? do do do

    %31
    dod dod dod dod si si' si si
    lad4 la\mbreak sold sol
    fad re mi fad

    %34
    si, r r2
    r8 sol'^\f sol sol fad4 si
    mi, la2 sold4

    %37
    r8 la la la fad4 re
    sol8 sol si sol\mbreak do la re re,
    sol,4 r r2

    %40
    R1*2
    r8 si^\f si si dod4. red8

    %43
    mi4 mi'~mi8 re re re
    dod4 do~do8 si si si
    lad4 la~la8 sol sol la\mbreak

    %46
    si4 si, mi r
    R1*2

    %49
    r2 r8 si^\f si si
    dod4. red8 mi si mi4~
    mi8 re re re dod4 do~

    %52
    do8 si si si lad4 la~
    la8 sol sol la si la si4
    mi,1\fermata

}

IIbfIn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s2 <2>8 <6>  s4
	<7> <6> <7 _+> s
	<4> <3+> s2
	<6> <4 2+>8 <6> s4
	<4+ 2> <6> <7 _+> s
	<4> <3+> s2
	s s8 <6> s4
	<7> <7 _-><7>8 <6> s4
	<4+ 2> <6> <7> <7 _+>
	s2 <4>4 <6>
	<4> <6> <4> <6>
	<4> <6> <4> <3>
	<4+ 2>8 <6> s4 <7> <7 _+>
	s2 <6>4 <3+>8 <4+>
	<6>2 <6>4 <3+>8 <4+>
	s8 <6> s4 <7> <7->
	<7 _+> s <4 2> <6>
	<4 2>8 <6> s4 <7> <7>
	s4 <6> <7> <7>
	<7> <7> <7> <7>
	<7> <7> <7> <7>
	<7> <7> <7 _+> s
	<6 5> <_+> s <4>8 <3+>
	s4 <4>8 <3+> s4 <4>8 <3+>
	s4 <4>8 <3+> s4 <4>8 <3+>
	<_->4 <7 _+> <_-> <7 _+>
	<_-> <7 _+> s <7>
	s <7-> s <6 5->
	<5> <6 5-> <_-> s
	<6 4+>2 <6>
	<6+> <_->4 <6>
	<7 _+> <6 _+> <7> <6>
	<7 _+> <6> <6+ 5> <4>8. <3+>16
	s1
	s8 <6> s4 <7> <7 _->
	<7 _+> s <6- 4 2> <6 5->
	s2 <6 5->
	s4 <6> <6 5>2
	s1
	s2 <6>4 <_+>
	<6+>2 s4 <6 5>
	<_+> 2 <7>4 <6>
	<4> <3> <4 2>8 <6> s4
	<7> <6> <4 2>8 <6> s4
	<7 _+>4 <6 _-> <4+ 2>8 <6> s4
	<4> <3+> s2
	s1
	<6>4 <_+> <6+> s
	s <6  5> <_+>2
	<7>4 <6> <4> <3>
	<4 2>8 <6> s4 <7> <6>
	<4 2>8 <6> s4 <7 _+> <6 _->
	<4+ 2>4 <6> <4> <3+>

}

IIbfIIn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s1*6
	s2 s8 <6> s4
	<7> <7 _-><7>8 <6> s4
	<4+ 2> <6> <7> <7 _+>
	s2 <4>4 <6>
	<4> <6> <4> <6>
	<4> <6> <4> <3>
	<4+ 2>8 <6> s4 <7> <7 _+>
	s2 <6>4 <6 3+>8 <6 4+>
	<6>2 <6>4 <6 3+>8 <6 4+>
	s8 <6> s4 <7> <7->
	<7 _+> s <4 2> <6>
	<4 2>8 <6> s4 <7> <7>
	s4 <6> <7> <7>
	<7> <7> <7> <7>
	<7> <7> <7> <7>
	<7> <7> <7 _+> s
	<6 5> <_+> s <4>8 <3+>
	s4 <4>8 <3+> <6+>4 <4>8 <3+>
	s4 <4>8 <3+> s4 <4>8 <3+>
	<_->4 <7 _+> <_-> <7 _+>
	<_-> <7 _+> s <7>
	s <7-> <5> <6 5->
	<5> <6 5-> <_-> s
	<4+ 2>2 <6>
	<6+> <_->4 <6>
	<7 _+> <6 _+> <7> <6>
	<7 _+> <6> <6+ 5> <4>8. <3+>16
	s1
	s8 <6> s4 <7> <7 _->
	<7 _+> s <6- 4 2> <6 5->
	s2 <6 5->
	s4 <6> <6 5>2
	s1*3
	s8 <_+> s4 <7>4 <6>
	<4> <3> <4 2>8 <6> s4
	<7> <6> <4 2>8 <6> s4
	<7 _+>4 <6 _-> <4+ 2>8 <6> s4
	<4> <3+> s2
	s1*2
	s2 s8 <_+> s4
	<7>4 <6> <4> <3>
	<4 2>8 <6> s4 <7> <6>
	<4 2>8 <6> s4 <7 _+>8 <6 _+> <6 _->4
	<4+ 2>4 <6> <4> <3+>

}


forma = {

\key mi\minor
\time 4/4
\tempo 2 = 60
s1*54
\bar "|."

}


IIvlI = {
	\notypeset
	<<\IIvlIn \forma>>

}

IIvlII = {
	<<\IIvlIIn \forma>>

}

IIbcI = {
	\clef bass
	<<\IIbcIn \forma \IIbfIn>>

}

IIvlIII = {
	<<\IIvlIIIn \forma>>

}


IIvla = {
	\clef alto
	<<\IIvlan \forma>>

}


IIbcII = {
	\clef bass
	<< \IIbcIIn \forma \IIbfIIn >>
	\typeset

}

IIIvlIn = \relative do'' {

    mi8[si si mi sol fad16(mi)]
    fad4 fad, r
    si'8[si, si si' re dod16(si)]

    %4
    si4 lad r
    la!8 la, la la' la la
    la2 sol4

    %7
    fad fad2
    mi8[si si mi sol fad16(mi)]
    fad4 fad, r

    %10
    mi'8[si si mi sold fad16(mi)]
    la4 la, r
    la'8[la, la la' sol fad16(mi)]\mbreak

    %13
    fad2 fad8.\tr(mi32 fad)
    sol8[sol,\p sol sol' fa mi16(re)]
    mi8(re) do4 si

    %16
    la8 (si) si(la) la4
    sol'8[sol,\f sol sol' sol fad16(mi)]
    fad4 fad, r

    %19
    la'8[la,\p la la' la sol16(fad)]
    sol8[sol, sol sol' sol fad16(mi)]
    mi4 red2\f

    %22
    mi4. sol,8 sol sol\mbreak
    fad2 si4
    si la la

    %25
    la sol sol
    sol fad fad
    fad mi2~

    %28
    mi4 red2
    mi4 mi red
    mi'8[si\p si mi sol fad16(mi)]

    %31
    mi8 red red2
    mi8 mi,\f mi mi' mi(re?)\mbreak
    re(do) do, do' do(si)

    %34
    si(la) do, la' la(sol)
    sol(fad) fad(sol) fad(mi)
    red4 r mi~

    %37
    mi mi4. red8
    mi2\p si'4~
    si si4. la8

    %40
    si2.\fermata

}

IIIvlIIn = \relative do'' {

    R2.
    si'8 [si, si si] red8 dod16(si)
    fad'4 fad, r

    %4
    mi'8 [mi, mi mi'] mi fad16(mi)\mbreak
    mi4 mi, mi'
    red2 mi4~

    %7
    mi mi4. red8
    mi2 r4
    si'8[si, si fad' la sol16(fad)]

    %10
    sol2 r4
    mi8[mi, mi mi' re do16(si)]
    do2 dod8.\tr(si32 dod)

    %13
    re8[re, re re' do si16 (la)]
    si2 si4\p
    do8(si) si(la) la(sol)

    %16
    fad(sol) sol4 fad
    sol2\f r4\mbreak
    re'8[re, re re' re do16(si)]

    %19
    do2\p r4
    si'8[si, si si' si la16(sol)]
    fad4 fad2\f

    %22
    mi4 si do
    do si8 fad fad fad
    mi4. mi8 mi mi

    %25
    red4 mi si'
    do2 do4
    si2 si4

    %28
    la2 si8(la)
    sol(fad) fad2
    mi r4

    %31
    fad'8[si,\p si fad' la sol16(fad)]\mbreak
    sol8[sol,\f sol sol' fad fad]
    mi mi, mi mi' re re

    %34
    do do, do do' si si
    do2 do4
    si r si

    %37
    do8 fad, fad2
    mi4.\p sol8 fad4
    sol8 fad mi2

    %40
    red2.\fermata

}

IIIbcIn = \relative do {

    mi'4 mi mi
    red red red
    re! re re

    %4
    dod dod dod
    do! do do
    si2 lad4

    %7
    si2 si,4
    mi mi mi
    red red si

    %10
    mi mi re?
    do4. do8 sold4
    la4. la8 la la\mbreak

    %13
    re4. re8 re re
    sol2 sol,4^\p
    do8 re mi fad sol sol,

    %16
    re' do re4 re,
    sol4.\f sol8 si dod
    re4. re8 fad sold

    %19
    la4.\p fad8 red si
    mi4. mi8 sol la
    si[si,\f si si' la sol16 fad]

    %22
    sol8 mi mi, mi' mi mi\mbreak
    red red re re re re
    dod dod do do do do

    %25
    si si mi, mi' mi mi
    la, la re, re' re re
    sol, sol do do do do

    %28
    fad, fad si si si si
    mi la, si4 si
    mi\p mi mi

    %31
    si si si
    mi4.\f mi8 si4\mbreak
    do4. do8 sol4

    %34
    la4. la8 mi4
    la2 la4
    la r sol

    %37
    la si2
    mi8 mi,\parenthesize \p mi mi' red si
    mi re! do2

    %40
    si2.\fermata

}

IIIvlIIIn = \relative do'' {

    si4 si si
    si fad r
    si re si

    %4
    dod mi, r
    la do la
    si2 mi,4

    %7
    fad si fad
    sol si sol
    red fad r

    %10
    sol sol mi
    mi4. do'8 re4
    mi4. do8 la4

    %13
    la4. fad8 la4
    sol r r
    R2.*2

    %17
    re'4.\f si8 sol la\mbreak
    fad4. fad8 fad si
    la4.\p la8 fad si

    %20
    si4 r r
    si\f si fad
    si4. sol8 sol sol

    %23
    fad2 si4
    si la la
    la sol sol

    %26
    sol fad fad
    fad mi2~
    mi4 red2

    %29
    mi4 mi red
    mi r r
    R2.

    %32
    mi'4\f r8 mi mi(re)\mbreak
    re(do) r do do(si)
    si(la) r la la(sol)

    %35
    sol(fad) fad(sol) fad(mi)
    red4 r mi~
    mi mi4. red8

    %38
    mi2 si'4\p~
    si si4. la8
    si2.\fermopz

}

IIIvlan = \relative do' {

    sol'4 sol si
    fad si r
    fad fad fad

    %4
    mi dod r
    mi la mi
    fad2 dod'4

    %7
    si2 si4
    sol sol si
    fad si r

    %10
    si si si\mbreak
    do4. la8 si4
    mi,4. mi8 mi mi

    %13
    re4. la'8 la fad
    re4 r r
    R2.*2

    %17
    si'4.\f si8 si la
    la4. la8 la mi
    mi4.\p fad8 fad red

    %20
    mi2 r4
    fad2\f fad8 la
    sol4 sol mi

    %23
    la si si,
    sol' la la,
    fad' sol mi

    %26
    mi fad re\mbreak
    re mi do
    do si fad'

    %29
    sol8 do si4 si,
    sol r r
    R2.

    %32
    si'4.\f si8 si4
    sol4. sol8 sol4
    mi4. mi8 mi4

    %35
    do la la'8 sol
    fad4 r sol
    do, si2

    %38
    si si8 red,
    mi fad sol4 mi
    fad2.\fermata

}

IIIbcIIn = \relative do {

    mi'4 mi, mi
    red red red
    re'! re, re

    %4
    dod dod dod
    do'! do, do
    si2 lad4

    %7
    si2.
    mi4 mi mi
    red red si

    %10
    mi mi re?
    do2 sold4
    la2 la4\mbreak

    %13
    re2 re4
    sol, r r
    R2.*2

    %17
    sol4.\f sol8 si dod
    re4. re8 fad sold

    %19
    la4.\p fad8 red si
    mi4 r r
    si'8[si,\f si si' la sol16 fad]

    %22
    sol8 mi mi, mi' mi mi\mbreak
    red red re re re re
    dod dod do do do do

    %25
    si si mi, mi' mi mi
    la, la re, re' re re
    sol, sol do do do do

    %28
    fad, fad si si si si
    mi la, si4 si
    mi, r r

    %31
    R2.
    mi'4.\f mi8 si4\mbreak
    do4. do8 sol4

    %34
    la4. la8 mi4
    la2 la4
    la r sol

    %37
    la si2
    mi8 mi,\parenthesize \p mi mi' red si
    mi re! do2

    %40
    si2.\fermata

}

IIIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6>
    <6>
    <7>4 <6+>2
    <6!>2.
    <7 _+>2 <7- 5->4
    <4>2 <3+>4
    s2.
    <6>4 s <7 _+>
    <_->2 <6 4+>4
    <6> s <6 5->
    <_-> s <7 _+>
    s2 <7>4
    s2 <7->4
    s4 <6 5>8 <5-> <9> <8>
    s <7 5> <6 4>4 <3>
    s2 <6>8 <5->
    s2 <6>8 <5->
    s2 <6 5->4
    s2 <6 5>4
    <4> <3+> s
    <6> <5> <6>
    <7> <6> s
    <7> <6> s
    <7 _+>2.
    <7>4 <7> s
    <7>4 <7> s
    <7 5-> <7 _+> s
    s <4> <3+>
    s2.
    <4>4 <3+> <7 _+>
    s2 <4>8 <3>
    <9>4 <8> <4>8 <3>
    <9>4 <8> <4>8 <3>
    <7>4 <6> <6 5>
    <4+ 2> s <6>
    <6 5> <4> <3+>
    s2 <6>4
    s8 <6> <7>4 <6>
    <_+>

}

IIIbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <6>
    <6>
    <7>4 <6+>2
    <6!>2.
    <7 _+>2 <7- 5->4
    <4>2 <3+>4
    s2.
    <6>4 s <7 _+>
    <_->2 <4+ 2>4
    <6> s <6 5->
    <_-> s <7 _+>
    s2 <7>4
    s2.*3
    s2 s8 <5->
    s2 <6>8 <5->
    s2 <6 5->4
    s2.
    <4>4 <3+> s
    <6> <5> <6>
    <7> <6> s
    <7> <6> s
    <7 _+>2.
    <7>4 <7> s
    <7>4 <7> s
    <7 5-> <7 _+> s
    s <4> <3+>
    s2.*2
    s2 <4>8 <3>
    <9>4 <8> <4>8 <3>
    <9>4 <8> <4>8 <3>
    <7>4 <6> <6 5>
    <4+ 2> s <6>
    <6 5> <4> <3+>
    s2 <6>4
    s8 <6> <7>4 <6>
    <_+>

}


forma = {

    \key mi\minor
    \time 3/4
    \tempo 4 = 60
    s2.*40
    \bar "|."

}


IIIvlI = {
    \notypeset
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIbcI = {
    \clef bass
    <<\IIIbcIn \forma \IIIbfIn>>

}

IIIvlIII = {
    <<\IIIvlIIIn \forma>>

}


IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>

}


IIIbcII = {
    \clef bass
    << \IIIbcIIn \forma \IIIbfIIn >>
    \typeset

}

IVvlIn = \relative do'' {

    mi4 si'
    sold8[(fad) mi(red)]
    mi[(red) mi(fad)]

    %4
    sold[(fad) sold(la)]\mbreak
    si[(mi,) dod'(mi,)]
    mi4 red

    %7
    mi8[si mi, re']
    re?[dod16(si) dod8 mi]
    fad[dod fad, mi']

    %10
    mi[red16(dod) red8 fad]
    sold[fad16(mi) fad8 si,]
    mi[red16(dod) red8 sold,]

    %13
    dod[si16(la) si8 mi,]
    dod'16[(red) mi8 fad, red']
    mi[sold16\p(fad) sold8 si]~

    %16
    si[fad16(mi) fad8 si]~\mbreak
    si[sold16\f (fad) sold8 si]~
    si[fad16(mi) fad8 si]~

    %19
    si[mi,16 (red) mi8 fad]
    red[fad16(mi) fad8 si,]~
    si[sold'16(fad) sold8 si,]~

    %22
    si[fad'16(mi) fad8 si,]
    sold'8. fad16 mi(red) dod(si)
    lad8 [dod16\p(si) dod8 fad,]~

    %25
    fad[re'16(dod) re8 fad,]~
    fad[dod'16(si) dod8 fad,]~
    fad[si16(lad) si8 dod]

    %28
    lad[dod16\f(red?) mi8 dod]\mbreak
    fad,[dod'16(red) mi8 red16(dod)]
    red8 si'16(la) sold(fad) mi(red)

    %31
    sold(fad) mi(red) dod8. si16
    si\p(mi) fad(sold) dod,8. si16
    si2

    %34
    si4\f fad'
    red8[(dod) si(lad)]
    si[(la!) la sold16(fad)]

    %37
    sold4 mi
    mi' si'
    sold8[(fad) mi(red)]

    %40
    mi[(re) re dod16(si)]\mbreak
    dod8[mi16 (re) mi8 dod]
    mi, si'16(la) si(dod) re(mi)

    %43
    dod8[fad16(mi) fad8 dod]
    fad, dod'16(si) dod(red?) mi(fad)
    red8[sold16(fad) sold8 red]

    %46
    sold, red'16(dod) red(mi) fad(sold)
    mi8[la16(sold) la8 mi]
    red[sold16(fad) sold8 red]

    %49
    dod la'16(sold) fad(mi) red(dod)
    sid8 sold'16(fad) mi(red) dod(sid)\mbreak
    dod8.[red16 red8. dod16]

    %52
    dod8[dod16(red) mi8 dod]
    fad, dod'16(si) dod(red) mi(fad)
    red8[fad16(sold) la8 fad]

    %55
    si, fad'16(mi) fad(sold) la(si)
    sold8[si16(la) si8 mi,]~
    mi[dod'16(si) dod8 mi,]~

    %58
    mi[si'16(la) si8 mi,]
    dod'8. si16 la(sold) fad(mi)
    red8 [fad16\p(mi) fad8 si,]~

    %61
    si[sol'16(fad) sol8 si,]~\mbreak
    si[fad'16(mi) fad8 si,]~
    si[mi16(red) mi8 la,]

    %64
    red [fad16\f(sold) la8 fad]
    si,[fad'16(sold) la8 sold16(fad)]
    sold8[si16(la) sold(fad) mi(red)]

    %67
    mi8.[fad16 fad8. mi16]
    mi8[si16(dod) re8 si]
    mi,[si'16(dod) re8 dod16(si)]

    %70
    dod8[si16(la) si8 mi,]
    la[sold16(fad) sold8 dod,]
    fad[mi16(red) mi8 la,]\mbreak

    %73
    red fad16\p(mi) fad8 si,]~
    si[sol'16(fad) sol8 si,]~
    si[fad'16(mi) fad8 si,]~

    %76
    si[mi16(red) mi8 fad]
    red[fad16\f(sol) la8 fad]
    si,[fad'16(sol) la8 sol16(fad)]

    %79
    sol mi sol si do do do do
    do do do do si si si si
    si si si si la la la la\mbreak

    %82
    si[si si si si si si si]
    si si si si la la la la
    la la la la sol sol sol sol

    %85
    fad[fad fad fad fad fad fad fad]
    sol mi mi mi sol sol si si
    <<mi8\\\shiftOn\stemUp si\\\stemDown mi,>> r r4

}

IVvlIIn = \relative do'' {

    R2
    mi4 si'
    sold8[(fad) mi(red)]

    %4
    mi[(red) mi(fad)]\mbreak
    sold[(sold) la(sold)]
    fad2

    %7
    si,8[si si si]
    mi,[mi mi dod']
    dod[dod dod dod]

    %10
    fad,[fad si red]
    mi[mi si si]
    r la[sold sold]

    %13
    r mi[mi mi]
    mi[dod' red, fad]
    sold[si\p si sold']

    %16
    fad[si si, fad']
    sold[si si,\f sold']
    fad[si si, fad']

    %19
    mi[dod lad lad]
    r red[si fad]
    r si[si sold]

    %22
    r si[si fad]
    r si[si mi]
    dod[lad\p fad fad]

    %25
    r fad[fad re']
    r fad,[fad dod]
    r mi[mi sol]

    %28
    dod,[lad'\f lad lad]
    r fad[fad fad]
    r fad'[si, si]\mbreak

    %31
    si[si si lad]
    si\p[si si lad]
    si2

    %34
    R
    si4\f fad'
    fad,8[mi fad red]

    %37
    mi2
    R
    mi'4 si'

    %40
    si,8[la si sold]
    mi[dod' dod la]
    r mi[mi mi]

    %43
    r dod'[dod fad]
    r fad,[fad fad]
    r red'[red sold]\mbreak

    %46
    r sold,[sold sold]
    r mi'[mi la]
    r red,[red sold]

    %49
    r dod,[dod fad]
    r sid, [sid sold']
    r dod,[dod sid]

    %52
    dod[mi, sold mi]
    r fad[fad fad]
    r red'[red red]

    %55
    r si[si si]
    r sold'[si, si]
    dod[mi mi dod]\mbreak

    %58
    r mi[mi si]
    r red[mi dod]
    r si\p[si fad]

    %61
    r si[si sol]
    s si[si fad]
    r la[la mi]

    %64
    r red'\f[red red]
    r si[si si]
    r fad'[si, si]

    %67
    r mi[mi red]
    mi[sold, sold sold]
    r mi[mi mi]

    %70
    r mi[mi sold]\mbreak
    r dod,[dod mi]
    r si[la dod]

    %73
    r red\p[si si]
    sol'[si, si sol']
    fad si r fad

    %76
    mi[la, la la']
    fad[red\f red red]
    r si[si si]

    %79
    r16 sol'[sol sol sol sol sol sol]
    fad[fad fad fad fad fad fad fad]\mbreak
    mi[mi mi mi mi mi mi mi]

    %82
    red[red red red red red red red]
    mi[mi mi mi mi mi mi mi]
    red[red red red] mi mi mi mi

    %85
    mi mi mi mi red red red red
    mi mi mi mi sol sol si si
    <<mi8\\\shiftOn\stemUp si\\\stemDown mi,>> r r4

}

IVbcIn = \relative do {

    mi4 red
    mi8[fad sold si]
    mi,[si' sold si]

    %4
    mi,4 r\mbreak
    mi la
    si8[dod si la]

    %7
    sold[sold sold sold]
    la[la la la]
    lad[lad lad lad]

    %10
    si[si si si,]
    mi[mi red red]
    dod[dod si si]

    %13
    la[la sold sold]
    la[la si si]
    mi[mi'\p mi mi]

    %16
    red[red red red]\mbreak
    mi[mi,\f mi mi]
    red[red red red]

    %19
    dod[dod fad fad]
    si, [si red red]
    mi[mi mi mi]

    %22
    red[red red red]
    mi[fad sold mi]
    fad[fad\p lad lad]

    %25
    si[si si si]
    la[la la la]
    sol[sol sol mi]

    %28
    fad [fad\f fad fad]\mbreak
    lad[lad lad lad]
    si[red, mi si]

    %31
    mi[si' mi, fad]
    sold\p[mi fad fad,]
    si2
    si4\f lad

    %35
    si8[dod red fad]
    red[dod red si]
    mi[fad sold fad]

    %38
    mi4 red
    mi8[fad sold si]
    sold[fad sold mi]\mbreak

    %41
    la[la la la]
    sold[sold sold sold]
    la[la la la]

    %44
    lad[lad lad lad]
    si[si si si]
    sid[sid sid sid]

    %47
    dod[dod dod dod]
    si?[si si si]
    la[la la la]

    %50
    sold[sold sold sold]\mbreak
    la[fad sold sold,]
    dod[dod dod dod]

    %53
    lad[lad lad lad]
    si[si si si]
    red[red red red]

    %56
    mi[mi sold sold]
    la[la la la]
    sold[sold sold sold]

    %59
    la[si dod la]
    si[red,\p red red]
    mi[mi mi mi]\mbreak


    %62
    re[re re re]
    do[do do do]
    si[si\f si si]

    %65
    red?[red red red]
    mi[red mi si']
    dod[la si si,]

    %68
    mi[mi mi mi]
    sold[sold sold sold]
    la[la sold sold]

    %71
    fad[fad mi mi]
    red[red dod dod]\mbreak
    si[si red red]

    %74
    mi[mi mi mi]
    re[re re re]
    do[do do la]

    %77
    si[si\f si si]
    red[red red red]
    mi16 mi mi mi  mi mi mi mi

    %80
    red red red red re re re re
    dod dod dod dod do do do do\mbreak
    si[si si si si si si si]

    %83
    do do do do do do do do
    si si si si mi mi mi mi
    lad, lad lad lad si si si si

    %86
    mi[mi, mi mi mi mi mi mi]
    mi8 r r4

}

IVvlIIIn = \relative do'' {

    R2*2
    mi8[(red) mi(fad)]

    %4
    sold[(fad) sold(la)]\mbreak
    si[(mi,) dod'(mi,)]
    mi4 red

    %7
    mi8[si mi, re']
    re?[dod16(si) dod8 mi]
    fad[dod fad, mi']

    %10
    mi[red16(dod) red8 fad]
    sold[fad16(mi) fad8 si,]
    mi[red16(dod) red8 sold,]

    %13
    dod[si16(la) si8 mi,]
    dod'16[(red) mi8 fad, red']
    mi4 r

    %16
    R2 %% fin qui
    r8 sold16\f [(fad) sold8 si]~
    si[fad16(mi) fad8 si]~

    %19
    si[mi,16 (red) mi8 fad]
    red[fad16(mi) fad8 si,]~
    si[sold'16(fad) sold8 si,]~

    %22
    si[fad'16(mi) fad8 si,]
    sold'8. fad16 mi(red) dod(si)
    lad8 [dod16\p(si) dod8 fad,]~

    %25
    fad[re'16(dod) re8 fad,]~
    fad[dod'16(si) dod8 fad,]~
    fad[si16(lad) si8 dod]

    %28
    lad[dod16\f(red?) mi8 dod]\mbreak
    fad,[dod'16(red) mi8 red16(dod)]
    red8 si'16(la) sold(fad) mi(red)

    %31
    sold(fad) mi(red) dod8. si16
    si\p(mi) fad(sold) dod,8. si16
    si2

    %34
    si4\f fad'
    red8[(dod) si(lad)]
    si[(la!) la sold16(fad)]

    %37
    sold4 mi
    mi' si'
    sold8[(fad) mi(red)]

    %40
    mi[(re) re dod16(si)]\mbreak
    dod8[mi16 (re) mi8 dod]
    mi, si'16(la) si(dod) re(mi)

    %43
    dod8[fad16(mi) fad8 dod]
    fad, dod'16(si) dod(red?) mi(fad)
    red8[sold16(fad) sold8 red]

    %46
    sold, red'16(dod) red(mi) fad(sold)
    mi8[la16(sold) la8 mi]
    red[sold16(fad) sold8 red]

    %49
    dod la'16(sold) fad(mi) red(dod)
    sid8 sold'16(fad) mi(red) dod(sid)\mbreak
    dod8.[red16 red8. dod16]

    %52
    dod8[dod16(red) mi8 dod]
    fad, dod'16(si) dod(red) mi(fad)
    red8[fad16(sold) la8 fad]

    %55
    si, fad'16(mi) fad(sold) la(si)
    sold8[si16(la) si8 mi,]~
    mi[dod'16(si) dod8 mi,]~

    %58
    mi[si'16(la) si8 mi,]
    dod'8. si16 la(sold) fad(mi)
    red8 [fad16\p(mi) fad8 si,]~

    %61
    si[sol'16(fad) sol8 si,]~\mbreak
    si[fad'16(mi) fad8 si,]~
    si[mi16(red) mi8 la,]

    %64
    red [fad16\f(sold) la8 fad]
    si,[fad'16(sold) la8 sold16(fad)]
    sold8[si16(la) sold(fad) mi(red)]

    %67
    mi8.[fad16 fad8. mi16]
    mi8[si16(dod) re8 si]
    mi,[si'16(dod) re8 dod16(si)]

    %70
    dod8[si16(la) si8 mi,]
    la[sold16(fad) sold8 dod,]
    fad[mi16(red) mi8 la,]\mbreak

    %73
    red fad16\p(mi) fad8 si,]~
    si[sol'16(fad) sol8 si,]~
    si[fad'16(mi) fad8 si,]~

    %76
    si[mi16(red) mi8 fad]
    red[fad16\f(sol) la8 fad]
    si,[fad'16(sol) la8 sol16(fad)]

    %79
    sol mi sol si do do do do
    do do do do si si si si
    si si si si la la la la\mbreak

    %82
    si[si si si si si si si]
    si si si si la la la la
    la la la la sol sol sol sol

    %85
    fad[fad fad fad fad fad fad fad]
    sol mi mi mi sol sol si si
    <<mi8\\\shiftOn\stemUp si\\\stemDown mi,>> r r4

}

IVvlan = \relative do' {

    R2*2
    mi8[si' si fad]
    mi4 r

    %5
    sold r
    fad2
    mi8[mi mi mi]

    %8
    mi[la mi mi]
    dod[fad fad fad]
    fad[si fad fad]

    %11
    mi[sold fad fad]
    r mi[red red]
    r dod[si si]

    %14
    r dod'[si si]
    si4 r
    R2\mbreak

    %17
    r8 si\f [sold mi]
    fad[fad fad red]
    sold[sold fad fad]

    %20
    r si[fad red]
    r sold[si, mi]
    r fad[si, si]

    %23
    r mi[mi sold]
    lad fad r4
    R2*3

    %28
    r8 dod\f[dod dod]
    r dod[dod dod]
    r fad[sold si]

    %31
    sold[fad sold fad]\mbreak
    r sold\p[si fad]
    fad2

    %34
    R2*2
    si,8\f[dod si si]
    si2

    %38
    sold'4 fad
    si8[la sold fad]
    sold[la mi mi]

    %41
    dod[la dod mi]
    r si[si si]
    r dod[la dod]

    %44
    r dod[lad dod]
    r si'[sold sold]\mbreak
    r fad[red red]

    %47
    r mi[dod mi]
    r red[si red]
    r mi[dod dod]

    %50
    r red[red red]
    r la'[sold sold]
    r sold[sold sold]

    %53
    r mi[mi mi]
    r fad[fad fad]
    r fad[red fad]

    %56
    r mi[mi mi]
    r dod[mi mi]\mbreak
    r si'[mi, mi]

    %59
    r si'[mi, dod']
    fad,4 r
    R2*3

    %64
    r8 fad\f[fad la]
    r fad[fad fad]
    r fad[sold fad]

    %67
    r dod'[si si]
    sold[sold si, si]
    r sold'[mi sold]

    %70
    r dod,[si si]
    r la[sold sold]\mbreak
    r fad[mi mi]

    %73
    fad4 r
    R2*3
    r8 fad\f[fad la]

    %78
    r fad[fad fad]
    r16 si si si sol sol' sol sol
    la la la la fad fad fad fad

    %81
    sol sol sol sol mi mi mi mi
    fad fad fad fad\mbreak  fad fad fad fad
    mi mi sol sol la la mi mi

    %84
    fad fad fad fad mi mi mi mi
    dod dod dod dod si si si si
    si si si si si si si si

    %87
    si8 r r4

}

IVbcIIn = \relative do {

    R2*2
    mi8[si' sold si]

    %4
    mi,4 r\mbreak
    mi la
    si8[dod si la]

    %7
    sold[sold sold sold]
    la[la la la]
    lad[lad lad lad]

    %10
    si[si si si,]
    mi[mi red red]
    dod[dod si si]

    %13
    la[la sold sold]
    la[la si si]
    mi4 r

    %16
    R2
    r8 mi\f[mi mi]
    red[red red red]

    %19
    dod[dod fad fad]
    si, [si red red]
    mi[mi mi mi]

    %22
    red[red red red]
    mi[fad sold mi]
    fad4 r

    %25
    R2*3
    r8 fad^\f[fad fad]\mbreak
    lad[lad lad lad]
    si[red, mi si]

    %31
    mi[si' mi, fad]
    sold\p[mi fad fad,]
    si2
    R2*2
    red8^\f[dod red si]
    mi[fad sold fad]

    %38
    mi4 red
    mi8[fad sold si]
    sold[fad sold mi]\mbreak

    %41
    la[la la la]
    sold[sold sold sold]
    la[la la la]

    %44
    lad[lad lad lad]
    si[si si si]
    sid[sid sid sid]

    %47
    dod[dod dod dod]
    si?[si si si]
    la[la la la]

    %50
    sold[sold sold sold]\mbreak
    la[fad sold sold,]
    dod[dod dod dod]

    %53
    lad[lad lad lad]
    si[si si si]
    red[red red red]

    %56
    mi[mi sold sold]
    la[la la la]
    sold[sold sold sold]

    %59
    la[si dod la]
    si4 r
    R2*3
    r8 si,\parenthesize ^\f [si si]

    %65
    red?[red red red]
    mi[red mi si']
    dod[la si si,]

    %68
    mi[mi mi mi]
    sold[sold sold sold]
    la[la sold sold]

    %71
    fad[fad mi mi]
    red[red dod dod]\mbreak
    si4 r
    R2*3

    %77
    r8 si^\f [si si]
    red[red red red]
    mi[mi mi mi]

    %80
    red[red re re]
    dod[dod do do]\mbreak
    si[si si si]

    %83
    do[do do do]
    si[si mi mi]
    lad,[lad si si]

    %86
    mi[mi, mi mi]
    mi8 r r4

}

IVbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6>
    s <6>
    s <6>
    s2*2
    <4>4 <3>
    <6> <6 5->
    <4-> <3>
    <6> <6 5->
    <4> <3>
    s <6>
    s <6>
    s <6>
    <6 5>2
    s
    <6>
    s <6>
    <7>4 <7 _+>
    s <6>
    s2
    <6>
    s4 <6>
    <_+> <6 5->
    <_->2
    <6>
    <7>4 <6>
     <_+> <7 _+>
     <6 5->2
     s8 <6> s4
     s <6 5>8 <_+>
     s <6 5> <4> <3+>
     s2
     s4 <6>
     s8 <6+> s <_+>
     <6>4 <6 5->
     s2
     s4 <6 5->
     s <6>
     <6> <6 5->
     s2
     <6 5->
     <5>4 <6>
     <6 5->2
     <5>4 <6>
     <6 5->2
     <5>4 <6>
     <7> <6>
     <7> <6>
     <7 _+>2
     s4 <4>8 <3+>
     s2
     <6 5->
     s4 <7>
     <6 5->2
     s4 <6>
     s2
     <6>
     s4 <6>
     s <6>
     <_->2
     <6>4 <6>
     <7> <6>
     <_+> <7>
     <6 5->2
     <_+>8 <6 5-> s4
     s <4>8 <3>
     s4 <7->
     <6 5->2
     s4 <6>
     s <6>
     <6> <6>
     s <6>
     <_->2
     <6>
     <7>4 <6>
     <_+> <7 _+>
     <6 5->2
     s4 <6>
     <7 5-> <6>
     <7 5-> <6>
     <_+>2
     <7>4 <6>
     <7 _+> <_->
     <6 5-> <_+>

}

IVbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*2
    s4 <6>
    s2
    s4 <6 5>
    <4>4 <3>
    <6> <6 5->
    <4-> <3>
    <6> <6 5->
    <4> <3>
    s <6>
    s <6>
    s <6>
    <6 5>2
    s
    s
    s
    <6>
    <7>4 <7 _+>
    s <6>
    s2
    <6>
    s
    <_+>4 s
    s2*3
     s8 <_+> <7 _+>4
     <6 5->2
     s8 <6> s4
     s <6 5>8 <_+>
     s s <4> <3+>
     s2*3
     <6>4 <6 5->
     s2
     s4 <6>
     s <6>
     <6> <6 5->
     s2
     <6 5->
     <5>4 <6>
     <6 5->2
     <5>4 <6>
     <6 5->2
     <5>4 <6>
     <7> <6>
     <7> <6>
     <7 _+>2
     <6>4 <4>8 <3+>
     s2
     <6 5->
     s4 <7>
     <6 5->2
     s4 <6>
     s2
     <6>
     s2*5
     s8 <_+> <7 _+>4
     <6 5->2
     s8 <5-> s4
     s <4>8 <3>
     s4 <7->
     <6 5->2
     s4 <6>
     s <6>
     <6> <6>
     s2*4
     s8 <_+> <7 _+>4
     <6 5->2
     s4 <6>
     <7 5-> <6>
     <7 5-> <6>
     <_+>2
     <7>4 <6>
     <7 _+> <_->
     <6 5-> <_+>

}


forma = {

    \key mi\major
    \time 2/4
    \tempo 2 = 50
    s2*33
    \bar":..:"\break
    s2*40\break
    \key mi\minor
    s2*14
    \bar ":|."

}


IVvlI = {
    %\notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVbcI = {
    \clef bass
    <<\IVbcIn \forma \IVbfIn>>

}

IVvlIII = {
    <<\IVvlIIIn \forma>>

}


IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}


IVbcII = {
    \clef bass
    << \IVbcIIn \forma \IVbfIIn >>
    \typeset

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}

\markup \huge {[1.] Allegro moderato}

\score {

    \new ChoirStaff \with { \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino I"\vspace #-0.2"Concertino"}
                \IvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino II"\vspace #-0.2"Concertino"}
                \IvlII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso del"\vspace #-0.2"Concertino"}
                \IbcI \global
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"di Ripieno"}
                \IvlIII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \Ivla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"Basso di"\vspace #-0.2"Ripieno"}
                \IbcII\global
            >>
        >>
    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
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

\markup \huge {[2.] Allegro}

\score {

    \new ChoirStaff \with { \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIbcI \global
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlIII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IIbcII\global
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
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

\markup \huge {[3.] Larghetto et affettuoso}

\score {

    \new ChoirStaff \with { \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIIbcI \global
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlIII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIIvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IIIbcII\global
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
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

\markup \huge {[4.] Allegro moderato}

\score {

    \new ChoirStaff \with { \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }<<

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IVbcI \global
            >>
        >>

        \new PianoStaff <<
            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IVvlIII \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IVvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IVbcII\global
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #0.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
            \override BarLine.hair-thickness = #1.2
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
