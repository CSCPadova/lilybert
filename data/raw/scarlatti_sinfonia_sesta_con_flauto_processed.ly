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



Ifln = \relative do'' {

    r4
    mi r mi r
    mi r mi r
    mi r do'8.[do16 do8. do16]

    %4
    do4 r do r
    do r do r
    do r\mbreak fa, sol
    sol r r2

    %8
    R1*2
    r8 sol si sol sol16[la si la sol fad mi red]
    mi[do' si la sol fad mi red] mi4 r

    %12
    la r\mbreak sol r
    fad r mi r
    la sol mi fa!

    %15
    si r si r
    mi, re si' r
    mi,2~mi

    %18
    mi~mi
    fad4 fad si r
    s1
    r2 r8 sib16 la sol fad sol la

    %22
    fad8 fad fad fad sol sol sol sol
    lab lab16 sol fa mib fa sol mib8 sol sol sol\mbreak
    do sib16 la sol la sol la sib8 sib sib16 la sib do

    %25
    la8 fa16 sol la sol la sib sol fa mi fa sol fa sol la
    fa8 mi16 re sib'8 la sold4~ sold16 si? la sold
    la8 mi mi[la] re16 do re do si re do si

    %28
    do8 la do8 si16 la si8 mi, si' do16 si
    la sold la sold la4~la16 sold la si do4~\mbreak
    do16 si la sold la8 si16 do la4 sold8. la16

    %31
    la4 r r2
    R1
    r2 r8 mi si' mi,

    %34
    do'4 r r8 mi, si' mi,
    do'16 si la sold la4 r8 mi do' [la]
    mi4 mi mi r

}


IvlIn = \relative do'' {

    r8 r16 mi
    mi8 la, do mi la[sol16 fa mi re do si]
    mi[re do si la sol fa mi] la[sol fa mi re do si la]
    la'[mi fad sold la si do re] mi8. mi16 mi8. mi16

    %4
    sol8 do, mi sol do[si16 la sol fa mi re]
    sol[fa mi re do si la sol] do si la sol fa mi re do
    do'[sol la si do re mi do]\mbreak fa8. [fa16 fa8. fa16]

    %7
    mi mi mi mi la si do la re, re re re sol la si sol
    do, do do do fad sol la fad si, si si si mi fad sol mi
    la la, la la fad' la, la la sol'8.[mi16 mi8. si16]

    %10
    si8 mi, sol si mi[re16 do si la sol fad]
    si[la sol fad mi red? do si] si' si si si mi fad sol mi
    la, la la la re mi fad re\mbreak sol, sol sol sol dod re mi dod

    %13
    fad, fad fad fad si do? re si mi mi mi mi la si do la
    re, re re re sol la si sol do, do do do fa! sol la fa
    mi mi mi mi fa sol la fa mi mi mi mi fa sol la fa

    %16
    mi mi mi mi la si do re mi mi, mi mi re' mi, mi mi
    do' mi, mi mi si' mi, mi mi\mbreak la mi mi mi sold mi mi mi
    la mi mi mi si' mi, mi mi do' mi, mi mi do' mi, mi mi

    %19
    \once\stemDown do 'la, la la \once\stemDown do' la, la la si'4 r
    s1
    r8 la, la la sib4 r

    %22
    r8 la la la sol sol sol sol'
    fa fa16 mib re8 re do4 r\mbreak
    R1

    %25
    do4 r dod r
    fa r r2
    mi4 r sold, r

    %28
    la r si r
    R1*2
    r8 mi mi mi fa fa,\p fa fa

    %32
    fa mi mi mi mi4 r
    red4. mi8 mi4 r
    r8 do' do do si4 r

    %35
    r r8 do' si4 r8 la,\p
    sold4 sold sold r

}

IvlIIn = \relative do'' {

    r4
    do r do r
    do r do r
    do8. si16 do re mi fa do8.[do16 do8. do16]

    %4
    do4 r sol' r
    do, r sol r
    do r8 r16 do\mbreak do8. do16 si8. si16

    %7
    do4 r8 mi fad, sol r re'
    mi, fad r do' red, mi r mi'
    mi4 red mi8. si16 si8. sol16

    %10
    sol4 r sol r
    sol r mi r
    mi fad\mbreak si, mi

    %13
    dod re sold mi'8 mi,
    fad4 re'8 re, mi4 do'
    si do si do

    %16
    si re8 la' sold4 r
    la sold\mbreak mi16 do do do si sold sold sold
    mi do' do do mi sold, sold sold la do do do mi do do do

    %19
    la' do, do do fad fad fad fad sold4 r
    s1
    r8 mi, mi mi sol4 r

    %22
    r8 fad fad fad re' re re re
    re re, lab'[lab] sol4 r\mbreak
    R1

    %25
    la?4 r sol r
    la r r2
    la4 r re, r

    %28
    mi r sold r
    R1*2
    r8 la la la la la\p la la

    %32
    si si si si la4 r
    la, r sold r
    r8 la' la la sold4 r

    %35
    r r8 la' sold4 r8 fad,\p
    mi4 mi mi r

}

Ivlan = \relative do' {

    r4
    la' r mi r
    mi r mi r
    mi r la8.[la16 la8. la16]

    %4
    sol4 r mi r
    sol r mi r\mbreak
    sol r\mbreak re8. re16 re8. re16

    %7
    do4 r8 la' la sol r sol
    sol la r fad fad sol r mi

    %9
    do4 si si'8. sol16 sol8. mi16
    mi4 r si' r
    si r si r

    %12
    dod, re\mbreak re dod
    lad' fad si la?
    la re, do la'

    %15
    si la si la
    si la si r
    do si\mbreak do mi,

    %18
    do si la la'
    la la fa r
    s1

    %21
    r8 do do do mi4 r
    r8 re  mib mib re re re re
    re re re re mib4 r\mbreak

    %24
    R1
    fa4 r sol r
    la r r2

    %27
    mi4 r si r
    do r mi r
    R1*2

    %31
    r8 mi mi mi re la'\p la fa
    sol sol sol mi la,4 r
    la r si r

    %34
    r8 fad' fad fad si,4
    r4 r8 fad' sold4 r8 fad\p
    si,4 si si r

}

Ivcn = \relative do {

    \clef tenor r4
    la'8 do la do la4 r16 si la sold
    la4 r16 si la sold la4 r16 mi' re mi
    la,4 r la8.[la16 la8. la16]

    %4
    mi'8 mi do mi mi,4 r16 re' do si
    mi4 r16 re do si mi4 r16 sol, fa mi
    mi'4 r\mbreak re8. re16 sol,8. sol16

    %7
    do,4 r8 do' do si r si
    si la r la la sol r sol
    fad4 si mi8.[mi16 mi8. mi16]

    %10
    re,4 r mi' r
    mi, r sol r
    sol fad\mbreak fad mi8 mi'

    %13
    mi4 re re do
    do si si la
    sold la sold la

    %16
    sol! fa? mi r
    mi'8 mi, mi mi' mi mi, mi mi'
    mi mi, mi mi' mi mi, mi mi'

    %19
    \stemNeutral red4 red re r
    s1
    do8 do, do'[do] dod4 r

    %22
    r8 do! do do sib sib sib sib
    si! si si si do mib mib mib\mbreak
    mib sol16 fa mi8 mi mi do16 re mi8 mi

    %25
    fa fa, fa fa' mi dod16 re mi8 dod
    re re, re'[fa]  mi mi, re[re']
    do do, do do' si si16 la sold8 sold

    %28
    la do la[la] mi mi' red[mi]
    fad mi red mi fad mi red mi\mbreak
    red4. red8 mi mi, mi4

    %31
    r8 dod' dod dod re re,\p re re
    sol sol sol sol fa4 r
    fad r mi r

    %34
    r8 red red red mi4 r
    r4 r8 red' mi4 r8 red,
    mi4 mi mi r

}

Ibcn = \relative do {

    r4 la' r la r
    la r la r
    la r la,8.[la16 la8. la16]

    %4
    mi'4 r mi r
    mi r mi r
    mi r\mbreak re8. re16 sol,8. sol16

    %7
    do4 r8 do' do si r si
    si la r la la sol r sol
    fad4 si, mi8.[mi16 mi8. mi16]

    %10
    mi4 r mi r
    mi r sol r
    sol fad\mbreak fad mi

    %13
    mi re re do
    do si si la
    sold la sold la

    %16
    sol! fa? mi r
    mi' mi\mbreak mi mi
    mi mi mi mi

    %19
    red red re r
    s1
    do'8 do, do do dod4 r

    %22
    r8 do! do do sib sib sib sib
    si! si si si do4 r\mbreak
    R1

    %25
    fa4 r mi r
    re r r2
    do4 r si r

    %28
    la r mi' r
    R1*2
    r8 dod dod dod re re,\p re re

    %32
    sol sol' sol sol fa4 r
    fad r mi r
    r8 red red red mi4 r

    %35
    r4 r8 red mi4 r8 red
    mi4 mi mi r

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s4
    s1*3
    <6>2 <6>
    <6> <6>
    <6> <7>4 <7>
    s4 s8 <6> <4+ 2>4 s8 <6>
    <2>8 <6+> s <6+> <4+ 2> <6> s <6>
    <7>4 <_+ 7> s2
    s1
    s2 <6>
    <4+ 2> <2>4 <6+>
    <4+ 2+> <6> <4+ 2> <6>
    <4+ 2> <6> <2-> <6->
    s <6> s <6>
    <6> <6> <_+> s
    <6 4> <_+><6 4> <_+>
    <6 4> <_+> <6 4> s
    <7 5>2 <6 4+>
    s1
    <6>2 <7- 5>
    s8 <6 4+> s4 <6>2
    <7- 5> <_->
    s1
    s2 <6+>
    s1
    <6>2 <6+>
    s <_+>
    s1*3
    <7>8 <6> s4 <7>2
    <6+> <_+>
    s8 <7 5> s4 <_+> s
    s4 s8 <7 5> <_+>4 s8 <7 5>
    <_+>1

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 2 = 60
    \partial 4 s4
    s1*19
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}\break
    \once \override Score.RehearsalMark.extra-offset = #'(5 . -2)
    \mark\markup\huge "[2.] Adagio"
    \tempo 4 = 40
    s1*16
    \bar "||"

}

Ifl = {
    %\notypeset
    <<\Ifln \forma>>

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

Ivc = {
    \clef bass
    <<\Ivcn \forma>>
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



IIfln = \relative do'' {

    R1*19
    re'2 sol,
    r4 sol la fad

    %22
    sol8 re re mi fad sol la si
    do mi, mi fad sol la si do
    re2 sol,

    %25
    r4 sol la fad
    sol2 r
    R1*3

    %30
    r8 mi mi fa? sol2\mbreak
    r8 re[re mi fa sol la sib]
    la sol fa sol mi2

    %33
    re r
    R1*8
    do'2 fa,

    %43
    r4 fa sol mi
    fa8[do do re mi fa sol la]
    sol fa mi fa re2

    %46
    r8 mi mi fa sol2
    r8 re re mi fa2
    r8 la la si do2

    %49
    r8 sol sol  la si2
    r8 mi, [mi fad sol la si do]\mbreak
    si la sol la fad2

    %52
    mi r
    R1*8
    r8 la la si do2

    %62
    r8 si si dod re2
    r8 do,?[do re mi fad sold la]
    sold2 mi

    %65
    R1
    r2 r8 mi mi fad
    sol2 r8 fad fad sol

    %68
    la2 r8 sol sol la\mbreak
    si2 r
    R1

    %71
    r8 mi, mi fad sol re re mi
    fa! [mi re mi fa sol la si]
    do4 la si sold

    %74
    la mi fa red
    mi1~
    mi

    %77
    mi~
    mi\mbreak
    mi~

    %80
    mi
    r8 mi[mi fad sold la si sold]
    la mi fad sold la si do la

    %83
    si[mi, mi fad sold la si sold]
    la [mi fad sold la si do la]
    si2 r4 la

    %86
    si2 si
    re r4 la
    si2 si

    %89
    la s

}


IIvlIn = \relative do'' {

    mi2 la,
    r4 la' si sold
    la8 la, la si do re mi fa

    %4
    mi re do re si2
    la4 do2 si8 la
    sol fad sol mi la4 si

    %7
    do2 si4 sol
    red mi2 red4
    mi sol do si8 la

    %10
    la' sol fa mi sold4 si\mbreak
    mi,4. re8 do4 si8 la
    sold4 la2 sold4

    %13
    la4. la8 sol la si do
    sol la si dod red4 fad
    si, sol'2 fad8 mi

    %16
    fad4 si,8 do? la2
    r8 sol sol la si do re mi
    sol,4 re r8 la' la si

    %19
    do4. re8 mi fad sol la
    re,2 r8 re, re mi
    si2 mi4 re

    %22
    si'2 la4 fad8 sol
    la4 do si8 do sol la
    re,2 r8 re' do si

    %25
    do4 re mi la,
    r8 sol sol la si do re mi
    fa[fa, fa sol la si do re]

    %28
    mi[do do re mi fa sol la]
    sol fa mi fa re2
    mi r8 re re mi\mbreak

    %31
    la,2 r4 fa
    mi re sib' la
    re'2 la

    %34
    r4 re mi dod
    re8[re, re mi fa sol la sib]
    la sol fa sol mi2

    %37
    re8 fa fa re mi do do re
    mi mi, mi' do re4 sib'
    r8 fa fa sol la2~

    %40
    la4 do mi,8 fa sol la\mbreak
    sib8 sol la sib sol2
    la r

    %43
    r4 la,, sib do
    fa2 r
    R1

    %46
    r8 do' do re mi mi, mi fa
    sol si si do re re, re mi
    fa do' do re mi mi, mi fad

    %49
    sol si si do sol mi mi fad
    sol4. la8 si dod red mi\mbreak
    fad4 mi2 red4

    %52
    mi2 r4 mi,
    fa8 fa' fa, sol la si do re
    sol,4 mi fa la

    %55
    r la' si sold
    la8 la, la si do re mi fa
    mi2 la,

    %58
    r8 la la si dod re mi dod
    re2 r\mbreak
    r4 re mi8 fa sol mi

    %61
    fa2 r8 sol sol la
    re,2 r8 la' la si
    mi,2 r

    %64
    r8 si la sold la si do re
    do re mi fa re do re mi
    do la do re mi2

    %67
    r8 re re mi la,2
    r8 mi' mi fad si,2\mbreak
    mi4 si4. do8 si la

    %70
    si do si do la2
    si r8 si, si dod
    re4 fa8 mi re mi fa re

    %73
    do4 do re mi
    do2 la4 si
    si'2 do8 la la si

    %76
    do[si la si do re mi fad]
    sold2 la8 do, do re
    mi[re do re mi fad sold la]\mbreak

    %79
    sold la si sold la do, do re
    mi4 mi4. fad8 sold la
    sold2 mi

    %82
    r8 do re si do re mi do
    si do si la si do re si
    do mi re mi mi,4 la

    %85
    sold2 r4 mi'
    re8 mi fa re si4 sold'
    la2 r4 la

    %88
    la2 sold
    la s  %%% OOKK

}

IIvlIIn = \relative do'' {

    R1*4
    la2 mi
    r4 mi' fad red

    %7
    mi8 [mi, mi fad sol la si do]
    si la sol la fad2
    mi4 mi'2 re8 do

    %10
    fa! mi re do re4 mi\mbreak
    do4. si8 la4 sold8 la
    si4 do re2

    %13
    do8 re mi fad sol fad sol la
    si2 la4 la,
    sol4. la8 si dod red mi

    %16
    red4 mi2 red4
    mi8[mi, mi fad sol la si do]
    re4 sol r8 fad fad sol

    %19
    la4 mi2 do4\mbreak
    si8 sol sol la si2
    r4 si, do re

    %22
    sol,2 re'
    la' mi
    si r8 si la sol

    %25
    mi'4 si do re
    si' re, sol si
    la re la8 sol la si

    %28
    sol4 mi do'8 re mi fa
    re4 do2 si4
    do2 r4 sol'\mbreak

    %31
    fa2 r4 re,
    dod re sol, dod
    re la'2 fa'4

    %34
    sol sol, sol' mi
    re la re8 mi fa re
    mi4 re2 dod4

    %37
    re8 la la si do4 la
    sol8 sol' sol la sib4 sol
    fa8 re re mi fa la, la sib

    %40
    do4 la sol do\mbreak
    r8 mi fa sol fa4 mi
    fa8 la, la sib do re la sib

    %43
    do2 re4 sol,
    la do sol mi'
    re do2 si4

    %46
    do2 r8 sol sol la
    si4 sol r8 la fa sol
    la4 fa r8 sol sol la

    %49
    si2 r8 sol sol la
    si2 r4 sol\mbreak
    red mi la, si

    %52
    mi8 sol sol la si dod re mi
    la,2 r4 fa'
    mi8[mi, fa sol la si do re]

    %55
    mi mi, mi mi' re4 si
    mi8 do do re mi4 do
    si dod re8 fa mi sol

    %58
    fa2 mi4 la
    fa8[fa, fa sol la si dod re]\mbreak
    dod4 re2 dod4

    %61
    re2 r4 do?
    si8 sol' sol la re,4 re'
    do8 la,  la si do la si do

    %64
    si sold la si do re mi fa
    mi4 do sold si
    la la' sol2

    %67
    r4 si, fad2
    r4 la sol8 mi' mi fad\mbreak
    sol4. fad8 mi4 red8 mi

    %70
    red4 mi2 red4
    mi2 r
    R1

    %73
    r4 mi, fa? mi
    mi2 la4 fad
    sold2 la8 do do fa

    %76
    mi[re do re mi fad sold la]
    si4 si, do8 la la si
    do[si la si do re mi fad]\mbreak

    %79
    si, do re si do la la si
    do do, do' re mi4 si8 la
    si do si la si do re si

    %82
    do mi re mi mi,4 la
    sold2 mi
    r8 do' re si do re mi do

    %85
    si2 r4 la'
    la2 sold4 mi
    re2 r4 do'

    %88
    si2 si
    do s

}

IIvlan = \relative do' {

    R1*8
    mi2 la,
    r4 la' si sold\mbreak

    %11
    la8[la, la si do re mi fa]
    mi re do re si2
    la4 do si2

    %14
    mi,4 sol' la fad
    mi si'2 la4
    fad mi fad2

    %17
    sol4. fad8 mi4 re8 do
    si4 re8 mi fad4 re
    do mi r2\mbreak

    %20
    r r8 si si do
    re4 sol mi la
    sol2 re

    %23
    la' mi
    si r8 si la sol
    mi'4 si do re

    %26
    re si re re
    re2 do
    do2. do'4

    %29
    sol2 la4 sol
    sol2 r4 si\mbreak
    la2 r4 re,

    %32
    dod re sol, la
    re fa~fa8 sol la fa
    re4 re sib' la

    %35
    re,2. re4
    la' la sib la
    la fa la mi~

    %38
    mi do8 mi re2
    re r
    r8 do do re mi2~\mbreak

    %41
    mi4 do re do
    do2 r
    r4 la sib do

    %44
    fa, la8 si! do2
    si4 do fa, sol
    do,2 r8 mi' mi fa

    %47
    sol2 r8 re re mi
    fa2 r8 mi mi fad
    sol2 r8 mi mi fad

    %50
    sol2 r4 sol\mbreak
    red mi la, si
    mi si' mi,2

    %53
    re4 la' re,2
    do~do8 re do si
    la4 la' fa mi

    %56
    mi4. re8 do4 la
    si mi fa la
    la2 la

    %59
    r8 la la sol fa4 mi8 re\mbreak
    mi4 la8 sib sol2
    la r4 mi

    %62
    re2 r4 fad
    mi2 r4 la,
    mi'2 mi

    %65
    r4 la re, si'
    mi,2 mi
    r8 sol sol mi fad4 re

    %68
    r8 la' la fad mi2\mbreak
    r4 si' sol fad8 mi
    fad4 sol la2

    %71
    sol r8 si, si dod
    re2 r
    r4 do re mi

    %74
    do2 la4 si
    mi2 mi
    R1

    %77
    mi2 mi
    R1\mbreak
    mi2 mi

    %80
    la,4 mi' r2
    si' mi,
    mi1

    %83
    si'2 mi,
    mi1
    mi2 r4 mi

    %86
    fa8 sol la fa mi4 si'
    la2 r4 mi
    fa2 mi

    %89
    mi s

}

IIvcn = \relative do {

    \clef tenor R1*12
    la'2 mi
    r4 mi' fad red

    %15
    mi8[mi, mi fad sol la si do]
    si la sol la fad2
    mi r

    %18
    r8 si' si do re2
    r8 la[la si do re mi fad]\mbreak
    sol4 sol, r2

    %21
    R1*5
    sol'2 sol,
    re' fa

    %28
    do la
    si4 do fa, sol
    do2 r8 si si dod\mbreak

    %31
    re2 r
    R1
    r8 re re mi fa4 re

    %34
    sib4. la8 sol4 la
    fa2 r4 fa'
    dod re sol, la

    %37
    re2 la
    do sol'8 sol, sol la
    sib2 r8 fa fa sol

    %40
    la8[la, la sib do re mi fa]\mbreak
    sol4 fa sib do
    r8 fa, fa sol la sib do re

    %43
    la2 r
    r8 la[la si! do re mi do]
    si4 do fa, sol

    %46
    do,2 r
    R1*5
    r8 mi[mi fad sol la si dod]
    re re, re mi fa? sol la si

    %54
    do2 fa,
    do' re4 mi
    do la r la

    %57
    sold sol fa dod
    re2 la'
    r8 re, re mi fa sol la sib\mbreak

    %60
    la sol fa sol mi2
    re r8 mi mi fad
    sol2 r8 fad fad sold

    %63
    la2 r
    mi la,
    r4 la' si sold

    %66
    la8 la, la' si do2
    r8 si si dod re2
    r8 dod dod red mi2\mbreak

    %69
    r8 mi,[mi fad sol la si do]
    si la sol la fad2
    mi r

    %72
    R1*3
    mi'2 la,
    R1

    %77
    mi'2 la,
    R1
    mi'2 la,

    %80
    r8 la[la si do re mi fa]
    mi2 mi,
    mi' mi,

    %83
    mi' mi,
    mi' mi,
    mi' r4 do

    %86
    re4 re, mi2
    fa r4 do
    re2 mi

    %89
    la, s

}

IIbcn = \relative do {

    R1*12
    la2 mi
    r4 mi' fad red

    %15
    mi8[mi mi fad sol la si do]
    si la sol la fad2
    mi r

    %18
    r8 si si do re2
    r8 la[la si do re mi fad]\mbreak
    sol2 r

    %21
    R1*5
    sol2 sol,
    re' fa

    %28
    do la
    si4 do fa sol
    do,2 r8 si si dod\mbreak

    %31
    re2 r
    R1
    r8 re re mi fa4 re

    %34
    sib'4. la8 sol4 la
    fa2 r4 fa
    dod re sol, la

    %37
    re2 la
    do sol8 sol' sol la
    sib2 r8 fa fa sol

    %40
    la8[la, la sib do re mi fa]\mbreak
    sol4 fa sib, do
    fa,2 r

    %43
    R1*9
    r8 mi'[mi fad sol la si dod]
    re re, re mi fa? sol la si

    %54
    do2 fa,
    do re4 mi
    do la r la'

    %57
    sold sol fa dod
    re2 la
    r8 re re mi fa sol la sib\mbreak

    %60
    la sol fa sol mi2
    re r8 mi mi fad
    sol2 r8 fad fad sold

    %63
    la2 r
    mi la,
    r4 la' si sold

    %66
    la8 la, la si do2
    r8 si si dod re2
    r8 dod dod red mi2\mbreak

    %69
    r8 mi[mi fad sol la si do]
    si la sol la fad2
    mi r

    %72
    R1*3
    mi2 la,
    R1

    %77
    mi'2 la,
    R1
    mi'2 la,

    %80
    r8 la[la si do re mi fa]
    mi2 mi,
    mi' mi,

    %83
    mi' mi,
    mi' mi,
    mi' r4 do

    %86
    re2 mi
    fa r4 do
    re2 mi

    %89
    la, s

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*12
    s2 <_!>
    s <6+>
    s s4 <_+>
    <_+> <6> <7> <6+>
    s1
    s4 <6> <_+>2
    s s4 <6>
    s1*7
    <5>2 <5>
    <5> <5>
    <6> <6 5>
    s2 s8 <6> s4
    s1*2
    s2 <6>
    <6> <6 5>4 <_+>
    <6>2 s4 <6>
    s2 <_- 6 5>4 <_+>
    s2 <_->
    <5> <_->
    <5> s8 <5> s4
    <6>1
    <_- 6>2 <6 5>
    s1*10
    s2 <6>
    s <6>
    s1
    <6>2 <6 5>4 <_+>
    <6>1
    s4 <6 4+> <6>2
    s <_+>
    s2 s4 <_+>8 <6>
    <_+>4 <6>8 <_-> <7>4 <6+>
    s2 s8 <6> s4
    s1*2
    <_+>1
    s2 <6+>
    s <5>
    s8 <6> s4 <_+>2
    s1
    s2 s4 <_+>8 <6>
    <_+>4 <6> <7> <6+>
    s1*4
    <_+>1
    s
    <_+>
    s
    <_+>
    s
    <_+>
    <6 4>
    <_+>
    <6 4>
    <_+>2 s4 <6>
    <6 5>2 <_+>
    <6> s4 <6>
    <6 5>2 <_+>

}


forma = {

    \time 2/2
    \key la\minor
    \tempo 1 = 45
    s1*88
    s2 r\fermata
    \bar "||"

}

IIfl = {
    %\notypeset
    <<\IIfln \forma>>

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
IIvc = {
    \clef bass
    <<\IIvcn \forma>>
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



IIIfln = \relative do'' {

    r8 r16 fa la4~la8. fa16
    sol8. sol16 do4~do8. la16
    fa8.[mi16 fa8. la16 sol8. fa16]

    %4
    fa4 mi r8 r16 do'
    do8. si16 si4~si8. do16
    do4 sol r

    %7
    r r8 r16 sol re'8. re16
    re8 do16 sib do4~do8. do16
    do8 sib16 la sib4. sol8\mbreak

    %10
    lab8 sol16 fad sol4~sol8. do16
    sib8. la16 la2
    sol4 r r

    %13
    r r8 r16 la re8. re16
    re8. sol,16 dod4~dod8. re16
    re8. la16 sib8.[do16 sib8. la16]

    %16
    sold8. mi16 la4~la8. la16
    la8. sold16 si8. do16 re8 do16 si
    do8. si16 la4 r\mbreak

    %19
    r8 r16 fad sol8.[la16 si8. do16]
    la8. do16 si8.[do16 si8. la16]
    sol8.[fad16 mi8. sol16] do4~

    %22
    do8.[fa,?16 sol8. la16] sib4~
    sib8. mi,16 la8. sold16 la4~
    la8. re,16 re'8.[do16 si8. re16]

    %25
    do8.[si16 la8. si16] do4
    r8 r16 si si8. la16 si4
    r8 r16 la la8.[sold16 la8. si16]

    %28
    sold8. la16 si4~si8. si16\mbreak
    do8. si16 do2
    si4 sold si

    %31
    mi,2.

}


IIIvlIn = \relative do'' {

    R2.*5
    r4 r8 r16 sol do8. do16
    do8 sib16 la sib4 r

    %8
    r r8 r16 sol sol8. sol16
    fad4 re8. re16 re'8. re,16\mbreak
    mib4~mib8. mib16 re8. fad16

    %11
    sol4 sol fad
    r8 r16 sol re'8 mi16 fa mi8. re16
    dod8. dod16 re4 r

    %14
    R2.*4
    r8 r16 mi fa8. [sol16 la8. fa16]\mbreak
    red4 mi r

    %20
    do r r
    si r8 r16 sol sol8. sol16
    fa4 r8 r16 fa fa8. fa16

    %23
    mi4 r8 r16 mi mi8. mi16
    re4~re8. mi16 fa4
    mi r mi

    %26
    mi r  mi
    la r la
    si r r\mbreak

    %29
    la la la
    sold si sold
    sold?2.

}

IIIvlIIn = \relative do'' {

    R2.*5
    r4 r8 r16 mi, la8. la16
    la4 re, r

    %8
    r  r8 r16 mib mib8. mib16
    re4 sol, sib\mbreak
    do~do8.[do16 sib8. la16]

    %11
    sol4 re' re
    sib' la sol8. fa16
    mi4 la~la8. la16

    %14
    sol4 mi~mi8. sol16
    fa4 r r
    R2.*2

    %18
    r4 do' do\mbreak
    si8. la16 si4 r
    la r r

    %21
    sol r8 r16 mi mi8. mi16
    re4 r8 r16 re re8. re16
    do4 r8 r16 do do8. do16

    %24
    si4~si8. la16 sold4
    la r do
    si r si

    %27
    re r re
    sold r r\mbreak
    fad fad fad

    %30
    si, mi mi
    si'2.

}

IIIvlan = \relative do' {

    R2.*5
    r4 r8 r16 do mi8. mi16
    re4 sol r

    %8
    r r8 r16 mib mib8. mib16
    re4 sol, sib\mbreak
    do4~do8. do16 sib8. la16

    %11
    sol4 re' re,
    re' fa sib
    mi, fa~fa8. fa16

    %14
    mi4 la, la
    \parenthesize re, r r
    R2.*2

    %18
    r4 la''8.[si16 do8. la16]\mbreak
    fad4 mi r
    fad r r

    %21
    sol r r
    R2.*3
    r4 r mi

    %26
    sol r sol,
    la r la
    mi' r r\mbreak

    %29
    do do do
    mi sold si
    si,2.

}

IIIvcn = \relative do {

    \clef tenor fa'4 fa, fa'
    fa mi8. re16 do4
    re la si

    %4
    do~do8. [re16 mi8. do16]
    re4 sol sol,
    do do, la'

    %7
    fad sol sib
    mib mib, r
    R2.*3

    %12
    sol4 fa? sol
    la8. sol16 fa4~fa8. fa'16
    mi4 la, la

    %15
    re, re'~re8. re16
    re4 do8.[si16 do8. la16]
    si4~si8. la16 sold4

    %18
    la la la\mbreak
    la sol r
    red' r r

    %21
    mi r r
    R2.*3
    r4 r la,

    %26
    sol r sol
    fa r fa
    mi r r\mbreak

    %29
    red red red
    mi mi mi
    mi2.

}

IIIbcn = \relative do {

    R2.*5
    r4 do la
    fad sol r

    %8
    R2.*4
    sol'4 fa sol
    la8. sol16 fa4 r

    %14
    R2.*4
    r4 la, la'\mbreak
    la sol r

    %20
    red r r
    mi r r
    R2.*3

    %25
    r4 r la
    sol r sol
    fa r fa

    %28
    mi r r\mbreak
    red red red
    mi mi mi

    %31
    mi2.

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*5
    s2 <5>4
    <6 5> <_-> s
    s2.*4
    <_->4 <6> <_- 6>
    <_+> <6> s
    s2.*4
    s4 <6->2
    <4+ 2>4 <6>2
    <7 5>2.
    s2.*5
    <6>4 s <6>
    <6> s <6>
    <_+> s2
    <7 5>2.
    <_+>
    <_+>

}


forma = {

    \time 3/4
    \key la\minor
    \tempo 4 = 55
    s2.*31
    \bar "||"

}

IIIfl = {
    %\notypeset
    <<\IIIfln \forma>>

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
IIIvc = {
    \clef bass
    <<\IIIvcn \forma>>
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



IVfln = \relative do'' {

    R4.*12
    mi8 mi mi
    la la la

    %15
    la\noBeam sol16 fa mi re
    do8 re mi
    la,16 si do re mi fad

    %18
    sold8 sold sold
    la r r
    R4.*9

    %29
    do8 do do
    si r r
    re re re

    %32
    do r r
    si si si
    la r r\mbreak

    %35
    R4.*4
    sol8 sol sol
    do do do

    %41
    do si16 la sol fa
    mi8 fa sol
    do, r r

    %44
    do'16 si la sol fa mi
    fa8 r r
    re'16 do si la si la

    %47
    sold8 r r
    R4.*7
    la8 la la

    %56
    re r r
    sol, sol sol
    do r r

    %59
    sold16 la si do re do
    re8 r r
    mi, mi mi\mbreak

    %62
    do' r r
    mi, mi mi
    do' r r

    %65
    mi,16 fad sold la si do
    si8 r r
    mi,16 fad sold la si do

    %68
    si8 r r
    si16 la si do re si
    la8 si mi,

    %71
    mi r r
    mi si' mi,
    la16 sold la si do re

    %74
    la8 si mi,
    mi r r

}


IVvlIn = \relative do'' {

    mi8 mi mi
    la la la
    la sol16 fa mi re

    %4
    do8 re mi
    la,16 si do re mi fad
    sol8 sol sol

    %7
    sol16 la si la sol fad
    mi8 fad red
    mi8. fa!16 sol mi

    %10
    fa mi fa la sol fa\mbreak
    mi re mi fa mi fa
    re do re mi re mi

    %13
    do4 si8
    la16 si do re  mi fa
    mi8.\noBeam re16 do si

    %16
    la8 si do
    fa,16 sol la si do la
    si la si re do si

    %19
    do si la si do la
    si8 dod16 red mi fad
    sol8. fad16 sol la

    %22
    si8 fad red
    mi si16 dod re mi\mbreak
    la, sol la sol la si

    %25
    do si do re mi fa
    re mi fa re mi sol
    fa8 re, sold

    %28
    la8. la16 mi8
    mi r r
    sol' sol sol

    %31
    fa r r
    mi mi mi
    re r r

    %34
    fa fa fa\mbreak
    mi8. fa16 mi re
    do si la si do re

    %37
    do8 do'4
    do si8
    do r r

    %40
    R4.*3
    sol16 fa  mi re do si
    la8 r r

    %45
    la'16 sol fa  mi re do
    si8 r r
    si'16 la sold fad mi re

    %48
    do si la si do re
    mi fa sol? la si sold
    mi8 re si

    %51
    dod16 re dod re mi dod
    re mi fa? sol? la sol
    fa sol la8[dod]

    %54
    re8. re16 dod8
    re r r
    fa,16 sol la si do? re

    %57
    sol,8 r r
    mi16 fad sold la si do
    re,8 r r

    %60
    sold16 la si8[mi,]
    mi r r\mbreak
    mi16 re do re mi fad

    %63
    sold8 r r
    mi16 re do re mi fad
    sold8 r r

    %66
    mi16 fad sold la si do
    si8 r r
    mi,16 fad sold la si do

    %69
    si8 r r
    do si si
    do si16 la si si,

    %72
    do8 si si
    re r r
    la' la sold

    %75
    la r r

}

IVvlIIn = \relative do'' {

    R4.*4
    la8 la la
    mi' mi mi

    %7
    mi re16 do si la
    sol8 la si
    mi,16 fad sol la si dod

    %10
    re8 la si\mbreak
    do sold la
    si fad sold

    %13
    la4 sol!8
    fa16 sol la si do re
    do8 mi,4

    %16
    fa do8
    re do la
    mi'8. re16 mi8

    %19
    la16 si do re mi fad
    sol8. fad16 sol la
    si la si la sol fad

    %22
    mi8 do' fad,
    sol sol sol\mbreak
    sol fa! fa

    %25
    mi16 re mi re dod8\noBeam
    re4 la8
    re,4 re8

    %28
    mi4 si'8
    do r r
    mi mi mi

    %31
    la, r r
    do do do
    si r r

    %34
    re' re re\mbreak
    sol,16 fa mi re do si
    la si do re mi fa

    %37
    sol fa sol la fa sol
    mi fa re4
    mi8 r r

    %40
    R4.*3
    mi16 fa sol fa mi re
    do8 r r

    %45
    fa16 sol la sol fa mi
    re8 r r
    sold16 la si la sold fad

    %48
    mi re do si la si
    do re mi fad sold mi\mbreak
    la8 la sol!

    %51
    sol16 fa mi fa sol mi
    fa mi re mi fa sol
    la8 mi16 re la'8

    %54
    la, sol' mi
    fa r r
    la fa fa

    %57
    mi r r
    sol mi mi
    sold r r

    %60
    re16 mi fad sold la si
    do8 r r\mbreak
    do16 si la si do re

    %63
    si8 r r
    do,16 si la si do re
    si8 r r

    %66
    mi16 red mi fad sold la
    sold8 r r
    mi16 red mi fad sold la

    %69
    sold8 r r
    la la sold
    la mi sold

    %72
    la la sold
    la r r
    do, si si

    %75
    do r r

}

IVvlan = \relative do' {

    R4.*24
    mi8 mi mi
    la la la

    %27
    la sol16 fa mi re
    do8 re mi
    la,16 si do re mi fad

    %30
    sol8 si, sol'
    re r r
    la' mi do'

    %33
    sol r r
    la la la\mbreak
    mi16 fa sol8[sol]

    %36
    la16 sol fa8[fa]
    do sol' la
    sol la sol

    %39
    sol16 fa mi fa re mi
    fa sol la8[sol]
    la8. la16 si8

    %42
    do do, re
    mi16 re mi8[mi]
    mi r r

    %45
    fa16 mi fa8[fa]
    sol r r
    mi mi mi

    %48
    mi mi mi
    mi mi mi\mbreak
    mi fa mi

    %51
    mi la la
    la16 sol fa mi re mi
    re8 mi16 sol mi8

    %54
    la sib la
    la r r
    re, re re

    %57
    mi r r
    do' si mi,
    re r r

    %60
    si'8. mi,16 si'8
    la r r\mbreak
    mi mi mi

    %63
    mi r r
    mi mi mi
    mi r r

    %66
    sold16 la sold fad mi8\noBeam
    mi r r
    sold16 la sold fad mi8\noBeam

    %69
    mi r r
    mi fa! mi
    mi4 mi8

    %72
    mi fa mi
    re r r
    mi fa mi

    %75
    mi r r

}

IVvcn = \relative do {

    \clef tenor R4.*18
    la'8 la la
    mi' mi mi

    %21
    mi re16 do si la
    sol8 la si
    mi,16 fad sol la si dod\mbreak

    %24
    re8 re,16 mi fa sol
    la4 sol8
    fa fa' dod8

    %27
    re4 si8
    la4 sold8
    la r r

    %30
    mi16 fad sol la si dod
    re8 r r
    la16 si do? re mi fad

    %33
    sol8 r r
    re,16 mi fa sol la si\mbreak
    do8 do do

    %36
    fa fa, fa
    mi4 fa8
    sol fa sol

    %39
    do8. re16 si do
    la8 fa mi
    fa8. la16 re8
    do la si
    do8 do do

    %44
    fa,16 sol la si do la
    re8 re re
    sol,16 la si do re si

    %47
    mi8 mi mi
    la, la la
    la sol16 fa mi re\mbreak

    %50
    do8 re mi
    la la la
    re re re

    %53
    re do16 sib  la sol
    fa8 sol la
    re, r r

    %56
    re16 mi fa sol la si
    do8 r r
    do,16 re mi fad sold la

    %59
    si8 r r
    fa16 sol la si dod red
    mi8 r r\mbreak

    %62
    la, la la
    mi' r r
    la, la la

    %65
    mi' r r
    mi r r
    mi r r

    %68
    mi r r
    mi r r
    do re mi

    %71
    la, sol16 fa mi re
    do8 re mi
    fa r r

    %74
    do' re mi
    la, r r

}

IVbcn = \relative do {

    R4.*18
    la'8 la la
    mi' mi mi

    %21
    mi re16 do si la
    sol8 la si
    mi,16 fad sol la si dod\mbreak

    %24
    re8 re,16 mi fa sol
    la4 sol8
    fa4 dod8

    %27
    re4 si'8
    la4 sold8
    la r r

    %30
    mi16 fad sol la si dod
    re8 r r
    la,16 si do? re mi fad

    %33
    sol8 r r
    re16 mi fa sol la si\mbreak
    do8 do, do

    %36
    fa fa fa
    mi4 fa8
    sol fa sol

    %39
    do, r r
    R4.*3
    do8 do do

    %44
    fa r r
    re re re
    sol r r

    %47
    mi mi mi
    la la la
    la\noBeam sol16 fa mi re\mbreak

    %50
    do8 re mi
    la, la la
    re re re

    %53
    re do16 sib  la sol
    fa8 sol la
    re, r r

    %56
    re'16 mi fa sol la si
    do8 r r
    do,16 re mi fad sold la

    %59
    si8 r r
    si,16 do re mi fad sold
    la8 r r\mbreak

    %62
    la, la la
    mi' r r
    la, la la

    %65
    mi' r r
    mi r r
    mi r r

    %68
    mi r r
    mi r r
    do re mi

    %71
    la sol16 fa mi re
    do8 re mi
    fa r r

    %74
    do re mi
    la, r r

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*19
    <_!>4.
    s8 <6>16 <6> <6> <6+>
    <6>8 <6+ 5> <_+>
    s4.
    <4>8 <3->4
    <_-> <6 4+>8
    <6>4.
    s4 <6+>8
    s4.*6
    <_->4.
    s4.
    s
    <6>
    <6 4>4 <3>8
    s4.*8
    <_+>4.
    s
    s
    <6>8 <6 5> <_!>
    <_+>8 <7>4
    <_->4.
    s8 <6> <_+>
    <6> <_- 6 5> <_+>
    s4.*4
    <6+>4.
    <6+>
    s
    s
    <_+>
    s
    <_+>
    <_+>
    <_+>
    <_+>
    <_+>
    <6>8 <6 5> <_+>
    s4 <_+>8
    <6> <6 5> <_+>
    <6>4.
    <6>8 <6 5> <_+>

}


forma = {

    \time 3/8
    \key la\minor
    \tempo 4. = 65
    s4.*75
    \bar "|."

}

IVfl = {
    %\notypeset
    <<\IVfln \forma>>

}

IVvlI = {
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}


IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}
IVvc = {
    \clef bass
    <<\IVvcn \forma>>
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
#(set-global-staff-size 17)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.7
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \con

}

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    subtitle = \markup \larger "Sinfonia Sesta [autografo 1715]"
    composer = \markup {"A. Scarlatti (1660-1725)"}
}

\markup \huge {[1.] Vivace}

\score {

    <<

        \new Staff  <<
            \set Staff.midiInstrument = #"recorder"
            \set Staff.instrumentName = \markup {Flau[to]}
            \Ifl \global
        >>

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Primo]"}
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.3"Secondo]"}
                    \IvlII\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \Ivla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Violoncello]"}
                \set Staff.midiInstrument = #"cello"
                \Ivc\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.3"continuo]"}
                \set Staff.midiInstrument = #"harpsichord"
                \Ibc\global
            >>
        >>

    >>

    \layout {

        indent = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[3.] All[egr]o}

\score {

    <<

        \new Staff  <<
            \set Staff.midiInstrument = #"recorder"
            \IIfl \global
        >>

        \new ChoirStaff <<

            \new PianoStaff <<

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
                \set Staff.midiInstrument = #"viola"
                \IIvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIvc\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIbc\global
            >>
        >>

    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[4.] Adagio}

\score {

    <<

        \new Staff  <<
            \set Staff.midiInstrument = #"recorder"
            \IIIfl \global
        >>

        \new ChoirStaff <<

            \new PianoStaff <<

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
                \set Staff.midiInstrument = #"viola"
                \IIIvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIIvc\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIIbc\global
            >>
        >>

    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[5.] All[egr]o}

\score {

    <<

        \new Staff  <<
            \set Staff.midiInstrument = #"recorder"
            \IVfl \global
        >>

        \new ChoirStaff <<

            \new PianoStaff <<

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
                \set Staff.midiInstrument = #"viola"
                \IVvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IVvc\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IVbc\global
            >>
        >>

    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.padding = #1
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
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

