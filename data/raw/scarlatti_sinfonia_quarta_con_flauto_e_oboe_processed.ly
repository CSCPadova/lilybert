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

    mi4 r fad r
    mi8 fad mi mi fad4 r
    si r fad r

    %4
    re8 mi re16 mi re mi fad4 r
    r8 sol re'4 r8 mi, si'4
    r8 la do4\mbreak r8 do do4

    %7
    r8 re, sol4 r8 re' re4
    r8 re re4 r8 re re4
    r8 re re4 r8 si si4

    %10
    r8 mi, la[mi] r2
    si'2\tr~\mbreak si4 r8 mi,
    la2\tr~la4 r8 la

    %13
    la sol la4 la la
    la1\tr~
    la4 fad8 red mi4 mi

    %16
    si' si\mbreak si2\tr~
    si si4 r8 la
    red,4 r8 mi fad4 r8 mi

    %19
    fad4 r8 si si2\tr~
    si si\tr~
    si red,4 si'

    %22
    fad r r2\fermata
    fad8\p sol la sol\mbreak fad4 r
    fad8 sol la16 sol fad la sol8 la si16 la sol si

    %25
    la8 do16 si la si do la si8 do re16 do re do
    si4 r si8 do re16 do si la
    sold8 la si16 la si sold la4 r

    %28
    sold8 la si16 la si sold la8 la la la
    la fa16 sol la sol fa la sol8 sol sol sol\mbreak
    sol sol sol sol sold4 r8 sold

    %31
    la4 r8 la si4 r8 si
    do do si2 lad8.\tr si16
    si4 r8 sol sol fad? r fad

    %34
    sol fad sol4 fad r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Iobn = \relative do'' {

    sol'4 r red r
    si8 red si[si] red4 r
    sol r la r

    %4
    sol8 la sol[sol] la4 r
    r r8 si, mi4 r8 sol
    la4 r8 mi\mbreak la4 r8 fad

    %7
    sol4 r8 sol sol4 r8 re
    re4 r8 re re4 r8 re
    re4 r8 la mi' sold, si sold

    %10
    mi'4 r8 si fad' lad, dod lad
    fad'4 si,8 fad'\mbreak si,2
    la4 r8 la re4 r8 mi

    %13
    la,8 si fad'[mi] fad la fad4
    fad1\tr~
    fad4 si8 si, dod4 dod

    %16
    red si\mbreak r8 si red4
    si mi8 si sol'4 r8 mi
    fad4 r8 sol red4 r8 sol

    %19
    red4 r8 fad mi8.[fad16 mi8 mi]
    fad16 sol red mi fad8 fad si,2\tr~
    si si4 sol

    %22
    si r r2\fermata
    red8\p mi fad mi red4 r
    red8 mi fad16 mi red fad mi8 fad sol4~

    %25
    sol fad sol r
    re?8 mi fa16 mi fa mi re4 r
    r2 do8 re mi16 re do re

    %28
    si4 r r2
    la8 la la la re re re re\mbreak
    re do r4 r8 re fa fa

    %31
    mi mi mi mi fa fa fa fa
    mi mi si[si] mi mi dod[dod]
    fad fad si,[si] si si r si

    %34
    mi mi mi4 si r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}


IvlIn = \relative do'' {

    sol'4 r16 sol la sol fad4 r16 fad sol fad
    sol[fad sol fad sol fad sol la] fad4 r
    sol r16 sol la sol fad4 r16 fad sol fad

    %4
    sol[fad sol fad sol fad sol la] fad4 r16 re' re re
    re do do do do si si si si la la la la sol sol sol
    do si do si do si do si\mbreak do si do si do si do re

    %7
    si la sol fad sol la si sol mi fad sol la sol8 fad
    sol16 fad sol la si do si la si do si la si do si la
    si8 si, r16 si' la si sold la si la sold la si sold

    %10
    la8 mi r16 do' si do lad si dod si lad si dod lad
    si lad si lad si red, mi red\mbreak mi red mi fad sol la? si[sold]
    la mi la,[si] dod re mi dod re dod si dod re mi fad sol

    %13
    fad mi re mi fad sol la sol fad mi fad mi fad sol la sol
    la sol fad mi red mi fad sol la sol la sol la sol la sol
    la sol la sol la fad sol la sol fad sol fad sol mi fad sol

    %16
    red mi fad red mi fad sol mi\mbreak fad sol la sol fad sol la fad
    sol fad mi red mi sol fad la sol la si sol la8. si16
    si4 r16 mi, fad mi red4 r16 sol la sol

    %19
    fad4 r16 fad sol fad sol[fad sol fad sol fad sol la]
    fad[si la sol fad mi red dod] si[lad si lad si lad si lad]
    si la sol fad sol fad sol la fad sol la fad sol fad sol la

    %22
    fad4 r r2\fermata % OOKK
    si,2\p ~\mbreak  si
    si4. si8 mi4 r

    %25
    r2 re'8\p mi fa16 mi fa mi
    re4 r r2
    si8 do re16 do re si do4 r

    %28
    si8 do re16 do re si mi8 mi mi mi
    mi re16 mi fa8[fa, fa fa fa fa]\mbreak
    mi mi' r mi re si si si

    %31
    do4 r8 do re re re re
    do la fad'![fad] mi mi mi mi
    si si si[mi] mi red r r16 red

    %34
    mi8 mi mi4 red r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IvlIIn = \relative do'' {

    mi4 r16 mi fad mi red4 r16 red mi red
    mi[red mi red mi red mi fad] red4 r
    si' r16 si do si la4 r16 la si la

    %4
    si[la si la si la si do] la4 r8 fad
    sol sol, fad'[fad,] mi' mi, re'[re,]
    do' do, fad'16 sol la sol\mbreak la sol  la sol la sol la si

    %7
    sol la si do re, do re si do re si do si8 la
    si sol'16 fad sol la sol fad sol la sol fad sol la sol fad

    %9
    sol8 re r re mi fa mi fa
    mi do r mi fad! sol fad sol
    fad red mi16 fad sol fad\mbreak sol fad mi red mi fad sold si,

    %12
    mi la dod, re mi fad sol? la la,8 re, re'16 dod re dod
    re dod si dod re8 mi la, dod re16 mi fad mi
    fad8 red si16 dod red mi red mi fad mi fad mi fad mi

    %15
    fad mi fad mi fad red mi fad dod red mi red mi dod red mi
    si dod red si sol' la si sol\mbreak red mi fad mi red mi fad red
    mi8 do! si[si'] si, mi mi,[mi']

    %18
    red4 r16 sol la sol fad4 r16 mi fad mi
    red4 r16 red mi red mi [red mi red mi red mi fad]
    red mi fad mi red dod si lad si fad sol fad sol fad sol mi

    %21
    red fad mi red mi red mi fad red mi fad red mi red mi fad
    red4 r r2\fermata
    r2 fad8\p sol la sol

    %24
    fad4 r r2
    R1
    si8 do re16 do re do si4 r

    %27
    r2 la8 si do16 si la si
    sold4 r mi8 fa sol?16 fa mi sol
    fa8 la re,[re] re re sol[sol]\mbreak

    %30
    sol4 r8 mi si' sold sold sold
    mi' mi, r mi si' si si si
    mi, mi' red[red] mi sol sol sol

    %33
    fad fad sol[sol,] si si r fad
    dod' dod dod4 fad, r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ivlan = \relative do' {

    si'4 r8 si si4 r8 si
    si si si si si4 r
    re r8 re re4 r8 re

    %4
    re re re re re4 r8 re
    sol,4 re mi si'8 sol
    sol fad la[mi]\mbreak re4 fad8 re

    %7
    re4 re8 re mi re re8. re16
    re8 re re re re re re re
    re4 r8 la' si4 si

    %10
    do r8 si dod4 dod
    fad,8. fad16 sol la si la\mbreak si8 si si [si]
    dod mi, mi mi fad re16 mi fad sol la mi

    %13
    fad8 sol re[la'] la la la[la]
    red, red fad[si,] fad' red red red
    red red red red mi4 dod'

    %16
    fad,8 si si [si]\mbreak fad red fad[si]
    sol la si[fad] mi si' do4
    fad, r8 si si4 r8 si

    %19
    si4 r8 si si si si si
    si4 r red, si'8 si,
    fad'4 si8 si, fad' si,  mi[si]

    %22
    si4 r r2\fermata
    r2 red8\p mi fad mi
    red4 r r2

    %25
    r sol,4 sol
    sol sol sol8 sol fa[fa]
    mi mi mi mi mi mi mi mi

    %28
    mi mi re[re'] dod dod dod dod
    re re do![do] si si si si\mbreak
    do4 r8 do si re re re

    %31
    do do, r do' sold sold sold sold
    la la si[si] do do dod[dod]
    red red mi[mi,] si' si r si

    %34
    lad lad lad4 si r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ivcn = \relative do {

    \clef tenor mi8 fad sol mi si' la si si,
    mi si' sol [mi] si'4 r
    sol8 la si sol re' do re re,

    %4
    sol re' si sol re4 r8 re'
    mi16 mi, mi mi  re' re, re re do' do, do do si' si, si si
    la' la, la la la'8[sol]\mbreak fad mi re fad

    %7
    sol la si sol do sol re'[re,]
    sol re sol[re] sol re' sol,[re']
    sol16 sol, sol sol sol'8[fa] mi re mi re

    %10
    do16 la la la la'8[sol] fad! mi fad mi
    red si sol'[fad]\mbreak mi si mi[re?]
    dod la la[sol] fad sol fad mi

    %13
    re sol fad[dod'] re16 la la la re8[do]
    si si, si'[ si,] si' si, si'[ si,]
    si' si, si si' lad4 lad

    %16
    si8 si, si'[ si,] \mbreak si' si, si si'
    mi8 fad sol red mi16 fad sol mi do8[do,]
    si16 si' la si sol8[mi] si16 si' la si sol8 mi

    %19
    si' la si si, mi si' sol' [mi]
    si si, r4 si'8 si, r4
    si'8 si, r4 si'8 si, si'8 si,

    %22
    si'4 r r2\fermata
    R1
    r2 r4 mi8 si

    %25
    do la re[re,] sol4 sol
    sol sol sol8 sol fa[fa]
    mi mi mi mi mi mi mi mi

    %28
    mi mi re[re'] dod dod dod dod
    re re do![do] si si si si\mbreak
    do4 r8 do si re re re

    %31
    do do, r do' sold sold sold sold
    la la si[si] do do dod[dod]
    red red mi[mi,] si' si, r si'

    %34
    lad lad lad4 si r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ibcn = \relative do {

    mi8 fad sol mi si' la si si,
    mi si' sol mi si'4 r
    sol8 la si sol re' do re re,

    %4
    sol re si sol re'4 r8 re
    mi mi, re'[re,] do' do' si[si,]
    la' la, la'[sol]\mbreak fad mi re fad

    %7
    sol la si sol do sol re'[re,]
    sol re sol,[re'] sol re sol,[re']
    sol sol, sol'[fa] mi re mi re

    %10
    do la la'[sol] fad! mi fad mi
    red si sol'[fad]\mbreak mi si mi[re?]
    dod la la'[sol] fad sol fad mi

    %13
    re sol fad[dod] re la re[do]
    si4 si si si
    si si lad lad

    %16
    si si\mbreak si si
    mi8 fad sol red mi sol do[do,]
    si si' sol[mi] si si' sol mi

    %19
    si' la si si, mi si' sol mi
    si4 r si r
    si r si si

    %22
    si r r2\fermata
    R1*10
    r4 r8 mi si'[si,] r si'

    %34
    lad lad lad4 si r
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <_+>
    s8 <_+> <6>4 <_+>2
    s1
    s4 <6> s2
    <7>8 <6 > <7> <6> <7> <6> <7> <6>
    <7> <6> <6> <6 4> <6 5>4 <7>
    s2 s4 <6 4>8 <3>
    s1
    s4 s8 <6> <_+>8 <6> s4
    <6> s8 <6> <_+>2
    s4 <6>8 <6+> s <_+> s <6 4+>
    s4 <_+>8 <6 4+> s4 s8 <6+>
    s4 <6> s8 <_+> s <6>
    <_+ 7>1
    <_+ 7>2 <7 5>
    <_+>4 <6 4> <_+>2
    s8 <6+> <6>4 s8 <6> s <6>
    <_+>4 <6> <_+> <6>
    <_+>2 s8 <_+> <6>4
    <_+>2 <_+>
    <_+> <_+>4 <6 4>
    <_+>1
    s1*10
    s2 <6 4>8 <5 3+> s <_+>
    <7 5>2 <_+>
}


forma = {

    \time 4/4
    \key mi\minor
    \tempo 2 = 48
    s1*22\break\once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    \mark\markup\huge "Adagio"
    \tempo 4 = 65
    s1*13
    \bar "||"

}

Ifl = {
    \notypeset
    <<\Ifln \forma>>

}

Iob = {
    <<\Iobn \forma>>

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

    R1
    r4 mi mi red
    si'8 la sol fad sol fad mi red

    %4
    mi2 fad\mbreak
    sol8 la si sol fad2
    fad r

    %7
    R1
    r4 si si lad
    si1

    %10
    la!
    si
    si2 r

    %13
    R1
    r2 r4 mi,\mbreak
    la mi r2

    %16
    R1*2
    r4 si' si lad
    si2 r

    %20
    R1*10
    r4 sol sol fad
    sol si la re8 do

    %32
    si la sol fad sol fad mi re
    mi re do si la4 re\mbreak
    sol, re' sol re

    %35
    mi8 re mi fad sol fad sol la
    fad mi fad sol la sol la si
    sol fad sol la si la si do

    %38
    la sol la si do si do re
    si2 r
    R1*4

    %44
    r4 si si lad\mbreak
    si2 r
    r4 la la sold

    %47
    la2 r
    R1*4
    r4 la la sold

    %53
    la do si mi8 re
    do4 la r2\mbreak
    r2 r4 la

    %56
    la2 si
    do r
    sol1\tr~

    %59
    sol
    sol2 la
    si r

    %62
    mi,1\tr~
    mi\mbreak
    R1*2

    %66
    r4 mi mi red
    mi2 fad
    mi8 fad sol la fad sol la si

    %69
    sol2~sol8 fad sol la
    fad2 r
    R1

    %72
    r4 si si lad\mbreak
    si1~
    si~

    %75
    si
    r2 r4 sol
    fad2 si

    %78
    r4 si fad si
    r si mi,2
    r4 mi si'2

    %81
    si r\fermata

}

IIobn = \relative do'' {

    R1*3
    r4 mi mi red\mbreak
    mi sol re? dod

    %6
    re si fad'8 mi re dod
    si4 re mi fad
    mi8 fad sol fad mi4 fad

    %9
    fad2 r4 re
    dod la r mi'
    red si r fad'

    %12
    mi si do2
    si fad'
    si,8 la sol fad mi2~\mbreak

    %15
    mi4 do' do si
    sol'2~sol8 fad sol la
    fad2 r

    %18
    R1*6
    r4 mi mi red
    mi si mi si

    %26
    r re la' re,
    r re sol re
    R1

    %29
    r4 sol sol fad
    sol2 r
    R1*9

    %40
    r4 la la sol
    fad2 r
    R1

    %43
    r4 fad si si,
    r si mi dod\mbreak
    re8 dod re mi fad mi fad sol

    %46
    mi2 re
    do8 si do re si do re mi
    la,2 r

    %49
    R1*2
    r4 re re do
    re1

    %53
    do2 r
    r4 la re si\mbreak
    r mi mi2

    %56
    R1*2
    r4 mi re2
    r4 mi re2

    %60
    re1\tr~
    re
    mi4 la, si2

    %63
    do si\mbreak
    do4 mi mi red
    mi8 fad sol la fad4 si8 la

    %66
    sol4 mi r2
    r4 mi mi red
    mi2 si

    %69
    si1
    si2 r4 fad'
    fad red r2

    %72
    R1
    r4 fad fad mi
    fad8 sol la fad sol fad sol la

    %75
    fad sol la fad mi2
    si r4 mi
    la2 red,

    %78
    si4 mi fad4. fad8
    mi4 mi do2
    r4 la' red,2

    %81
    si r\fermata

}


IIvlIn = \relative do'' {

    r4 mi mi red
    mi sol fad si8 la
    sol fad mi red mi re do si

    %4
    do si la sol fad4 si\mbreak
    mi,2 fad
    re lad

    %7
    si4 fad' sol re
    si'2 dod
    re8 dod re mi fad mi fad sol

    %10
    mi re mi fad sol fad sol la
    fad mi fad sol la sol la si
    sol2 fad

    %13
    si,4 mi la fad
    r si, si' mi,\mbreak
    r mi, la fad

    %16
    sol8 fad sol la si la si dod
    re2 dod
    si r

    %19
    r4 fad fad' fad,
    r si si lad
    si la!8 sol fad4 fad'

    %22
    r mi la fad
    r si, si' mi,\mbreak
    mi8 re do si la do si la

    %25
    sol fad sol la si la si do
    la sol la si do si do re
    si la si do re mi fa re

    %28
    mi re mi fad! sol fad sol la
    si4 si, la2
    si r

    %31
    R1*8
    r4 sol' sol fad
    mi2 r4 mi

    %41
    mi re dod2
    re4 si fad' fad,
    r re'8 dod re4 fad

    %44
    si,8 la sol fad mi4 fad\mbreak
    r si re si
    do!2 si

    %47
    la mi
    do'8 si do re mi re mi fa
    re do re mi fa mi fa sol

    %50
    mi4 do' do si
    la2 r4 la
    la8 sol fa mi re4 mi

    %53
    mi mi, fa mi
    mi2 r4 si'\mbreak
    mi do r2

    %56
    r4 la' la sold
    la do do si
    do mi, r sol

    %59
    sol mi r sol
    sol si, la re'
    re si r re

    %62
    re do r mi,
    mi do r mi\mbreak
    mi2 fad

    %65
    sol4 mi la fad
    r si, la' fad
    r sol fad si8 la

    %68
    sol4 mi r fad
    sol8 fad mi red mi red mi fad
    red mi fad sol dod, red mi fad

    %71
    fad,2 r4 dod'
    red8 mi fad red mi fad sol mi\mbreak
    fad sol la fad sol fad sol la

    %74
    si4 si, sol' si,
    r si' si lad
    si red, mi si'

    %77
    la2 fad
    sol4. sol8 fad4. fad8
    sol la si sol do2

    %80
    r4 la fad2
    sol r\fermata

}

IIvlIIn = \relative do'' {

    R1*4
    r4 si si lad
    si re dod fad8 mi

    %7
    re dod si lad si la sol fad
    sol fad  mi re dod4 fad
    si, si' re si

    %10
    r dod mi dod
    r red fad red
    mi2 la,

    %13
    sol4 si red2
    mi8 red mi fad sol4 si,\mbreak
    mi2. red4

    %16
    mi si mi sol,
    r fad mi' fad,
    r si mi dod

    %19
    fad8 mi re dod re dod si lad
    si la! sol fad mi4 fad~
    fad8 sol la si do!2

    %22
    si4 mi mi red
    mi8 fad sol fad sol4 si,\mbreak
    la2 r

    %25
    R1*4
    r4 re la' re,
    re2 r

    %31
    R1*8
    r2 r4 re
    re do si2

    %41
    r4 si si lad
    si re dod fad8 mi
    re dod si lad si la sol fad

    %44
    sol fad mi re dod4 fad\mbreak
    si,2 r
    R1

    %47
    r4 la' la sold
    la2 r4 la
    si sol r si

    %50
    do8 re mi fa re4 sol
    sol fa mi2
    re r

    %53
    r4 la re si
    r la' la sold\mbreak
    la4. si8 do4. mi,8

    %56
    la sol fa mi re4 mi
    do8 re mi do re mi fa sol
    mi4 do' do si

    %59
    r do do si
    r sol sol fad!
    r sol sol fad

    %62
    r la la sold
    r la la sold\mbreak
    la8 do, si do la4 si

    %65
    si2 r4 si
    si' si, r si
    si' si, r2

    %68
    r4 si si' si,
    r mi, sol mi
    si'8 dod red mi mi,4 dod'

    %71
    red8 mi fad sol dod, red mi fad
    fad,4 si dod8 red mi dod \mbreak
    red8 mi fad red  mi red mi fad

    %74
    red4 fad fad mi
    red8 mi fad red mi sol fad mi
    fad sol la fad sol4 mi

    %77
    mi2 red
    mi4. mi8 mi4 red
    mi4. mi8 mi2

    %80
    r4 mi red2
    mi r\fermata

}

IIvlan = \relative do' {

    R1*11
    r4 mi mi red
    mi sol fad si8 la

    %14
    sol fad mi red mi re do si\mbreak
    do si la sol fad4 si
    mi, mi' sol mi

    %17
    si2 dod
    re4 fad mi fad
    fad2 si,4 re~

    %20
    re mi2 dod4
    red8 mi fad sol la2
    sol4 si la si

    %23
    si2 r\mbreak
    r4 mi, la fad
    sol2 r4 mi

    %26
    la re, r la'
    re,2 r4 si'
    sol2. mi4

    %29
    re2 mi4 fad
    si,2 r
    R1*8

    %39
    r2 r4 la'
    la2 r4 si
    si2 r4 fad

    %42
    fad2 fad
    fad r
    R1*4

    %48
    r4 la, do la
    r si re si
    r sol' sol2

    %51
    r4 la la2
    fa4 la re, si'
    la2 r

    %54
    R1
    r4 mi la la,
    re2. si4

    %57
    la la' fa re
    do8 re mi fa sol4 si,
    do8 re mi fa sol4 si,

    %60
    si re re fad,!
    sol8 la si do re mi fad sol
    la4 mi r mi

    %63
    la,8 si do re mi4 si'\mbreak
    la2. fad4
    mi si do si

    %66
    mi2 la,4 si
    mi sol si fad
    si2 fad

    %69
    mi r
    R1
    r4 si' si lad

    %72
    si si, si2\mbreak
    r4 fad' dod2
    red mi

    %75
    fad4 si, dod2
    red4 si' si4. si8
    do2 si

    %78
    si4. si8 do4 si
    si2 la
    r4 do si2

    %81
    si r\fermata

}

IIvcn = \relative do {

    \clef tenor R1*16
    r4 si' si lad
    si re dod fad8 mi

    %19
    re dod si lad si la sol fad
    sol fad mi re dod4 fad
    si, mi mi red
    mi sol fad si8 la

    %23
    sol' fad mi red mi re do si\mbreak
    do si la sol fad4 si
    mi mi, sol mi

    %26
    r fad la fad
    r sol si sol
    r do mi do

    %29
    si si, do re
    sol si\solo la re8 do
    si4 sol sol fad

    %32
    sol re' mi si
    do la fad re\mbreak
    mi8 fad sol la si sol la si

    %35
    do,4 do' mi do
    r re fad re
    r mi sol mi

    %38
    fad fad, la fad
    sol8 la si do re4 re,
    la'8 si do re mi4 mi,

    %41
    si'8 dod re mi fad4 fad,
    re'2 lad
    si r

    %44
    R1*6
    r4 do sol' sol,
    r re la' la,
    re re' si mi

    %53
    r la, la sold
    la do si mi8 re\mbreak
    do si la sold la sol fa mi

    %56
    fa mi re do si4 mi
    la2 r
    r4 do sol' sol,

    %59
    r do sol' sol,
    r sol re' re,
    r sol re' re,

    %62
    r la' mi' mi,
    r la mi' mi,\mbreak
    la sol fad si

    %65
    r mi, mi red
    mi sol fad si8 la
    sol4 mi si'2

    %68
    sol' red
    mi r
    r4 si si lad

    %71
    si2 r
    si r\mbreak
    si r

    %74
    si r
    si r
    r4 si mi sol,

    %77
    la2 si
    mi,8 fad sol mi la4 si
    mi, sol la2

    %80
    r4 la si si,
    mi2 r\fermata

}

IIbcn = \relative do {

    R1*20
    r4 mi mi red
    mi sol fad si8 la

    %23
    sol fad mi red mi re do si\mbreak
    do si la sol fad4 si
    mi, mi' sol mi

    %26
    r fad la fad
    r sol si sol
    r do, mi do

    %29
    si2 do4 re
    sol,2 r
    R1*8

    %39
    r4 sol' re' re,
    r la' mi' mi,
    si'2 fad

    %42
    re lad
    si r
    R1*6

    %50
    r4 do sol' sol,
    r re' la' la,
    re2 si4 mi

    %53
    la, la' la sold
    la do si mi8 re\mbreak
    do si la sold la sol fa mi

    %56
    fa mi re do si4 mi
    la,2 r
    r4 do sol' sol,

    %59
    r do sol' sol,
    r sol' re' re,
    r sol re' re,

    %62
    r la' mi' mi,
    r la mi' mi,\mbreak
    la sol fad si

    %65
    r mi, mi red
    mi sol fad si8 la
    sol4 mi si2

    %68
    sol' red
    mi r
    r4 si' si lad

    %71
    si2 r
    si r\mbreak
    si r

    %74
    si r
    si r
    r4 si mi sol,

    %77
    la2 si
    mi,8 fad sol mi la4 si
    mi, sol, la2

    %80
    r4 la' si si,
    mi2 r\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*20
    s1*18
    s2 <4>4 <3>
    s2 <4>4 <3!>
    <4>4 <3!> <4> <3+>
    <6>1
    s1*7
    s2 <4>4 <3>
    s <_-> <4> <3->
    <_->2 <7>4 <_+ 7>
    s2 <4 2 6->
    s4 <6> <7> <_+>
    <6>1
    s2 <7>4 <_+>
    s1
    s2 <4>4 <3>
    s2 <4>4 <3>
    s2 <4>4 <3>
    s2 <4>4 <3>
    s2 <4>4 <3+>
    s2 <4>4 <3+>
    s <6> <7> <_+>
    s2 <2 6 4>
    s4 <7> <7> <_+>
    <6>2 <4>4 <3+>
    <6>1
    s
    s4 <_+> <2+>2
    <_+>1
    <_+>
    <_+>
    <_+>
    <_+>
    s4 <_+> s <6>
    <6 5>2 <_+>
    s <6 5>4 <_+>
    s <6> s2
    s <_+>

}


forma = {

    \time 2/2
    \key mi\minor
    \tempo 1 = 50
    s1*81
    \bar "||"

}

IIfl = {
    \notypeset
    <<\IIfln \forma>>

}

IIob = {
    <<\IIobn \forma>>

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

    sol'4 do8 si do4
    do si r
    sol re'8 do re4

    %4
    re do r
    sol do8 si la sol
    la sol fa2

    %7
    fa?4 mi r
    mi la8 sol la sol
    sol4 fad! r

    %10
    la4 re8 do re do
    si do re4. do16 si
    la8 sol la fad sol do\mbreak

    %13
    si4 la2
    sol4 r r
    R2.*5

    %20
    re4 sol8 fad sol fad
    mi re mi fad sol4
    mi la8 sol la sol

    %23
    fad mi fad sol la4
    fad si8 la si la
    sol fad sol mi si'4\parentSlur (

    %26
    si) lad4. si8\mbreak
    si4 r r
    R2.

    %29
    r8 mi, sold4 si8. do16
    re8 [si sold si re do16 si]
    do4 r r

    %32
    r8 re, fad4 la8. si16
    do8[la fad la do si16 la]
    si4 r r

    %35
    r8 r16 si si8.[lad16 si8. dod16]
    lad8.[mi16 mi8. fad16] sol fad sol la?\mbreak
    fad8. sol16 la sol la si sol fad sol la

    %38
    si8. do16 la4. si8
    si4 r r
    red, mi mi

    %41
    fad2.

}

IIIobn = \relative do'' {

    R2.*13
    re4 sol8 fad sol4
    sol fad r

    %16
    re la'8 sol la4
    la sol r
    re sol8 fa mi re

    %19
    mi re do2
    do4 si r
    R2.*6

    %27
    r8 si red4 fad?8. sol16
    la8 fad red fad la[sol16 fad]
    sol4 mi r

    %30
    R2.
    r8 r16 la mi8.[mi16 mi8. mi16]
    fad4 r r

    %33
    R2.
    r8 r16 si,\noBeam re8.[re16 re8. fad16]
    re4 r r

    %36
    dod r r\mbreak
    si4 r8 r16 si si4
    red la2

    %39
    fad'4 r r
    fad si, mi
    red2.

}


IIIvlIn = \relative do'' {

    R2.*30
    r8 r16 mi dod'8.[dod16 dod8. dod16]
    re4 r r

    %33
    R2.
    r8 r16 si si8.[si,16 si8. si16]
    si4 r r

    %36
    dod r r\mbreak
    fad4 r8 r16 fad sol4
    red mi2

    %39
    si'4 fad red
    si si si
    si2.

}

IIIvlIIn = \relative do'' {

    R2.*13
    sol,2 mi'4
    re4. dod8 re mi

    %16
    fad4. mi8 re do?
    si4. mi8 re do
    si4. la8 si4

    %19
    do8 si la4 re
    sol r r
    R2.*6\mbreak

    %27
    si,4. dod8 red4~
    red fad red
    mi r r

    %30
    R2.
    r8 r16 do' mi8.[mi16 mi8. mi16]
    la4 r r

    %33
    R2.
    r8 r16 re, re8.[re16 re8. re16]
    re4 r r

    %36
    lad r r\mbreak
    si r8 r16 si mi4
    fad la,2

    %39
    red4 r r
    fad, sol sol
    fad2.

}

IIIvlan = \relative do' {

    R2.*13
    sol2 mi'4
    re4. dod8 re mi

    %16
    fad4. mi8 re do?
    si4. mi8 re do
    si4. la8 si4

    %19
    do8 si la4 re
    sol, r r
    R2.*6

    %27
    si4. dod8 red4~
    red fad red
    mi r r

    %30
    R2.
    r8 r16 la la8.[la16 la8. la16]
    re,4 r r

    %33
    R2.
    r8 r16 re fad8.[fad16 fad8. fad16]
    sold4 r r

    %36
    fad r r\mbreak
    fad r8 r16 si si4
    si mi,2

    %39
    fad4 r r
    red si si
    red2.

}

IIIvcn = \relative do {

    \clef tenor do'2 mi4
    re sol, la
    si4. la8 sol fa

    %4
    mi4. la8 sol fa
    mi4 mi'4. mi8
    fa mi re4 sol,

    %7
    do4. re8 mi re
    dod4. si8 la4
    re4. mi8 re mi

    %10
    fad?4. mi8 re4
    sol,4. la8 si sol
    do4. re8 mi do\mbreak

    %13
    re do re4 re,
    sol r r
    R2.*5

    %20
    sol4. la8 si4
    do4. re8 mi re
    dod4. si8 dod4

    %23
    re4. mi8 fad mi
    red4. dod8 red4
    mi4. dod8 re? si

    %26
    sol' mi fad4 fad,\mbreak
    si r r
    R2.

    %29
    mi,4. fad8 sold4~
    sold si sold
    la8.[la16] sol!8.[sol16 sol8. sol16]

    %32
    fad4. mi8 fad4~
    fad la fad
    sol8.[sol16] fad8.[fad16 fad8. fad16]

    %35
    mid4 r r
    mi! r r\mbreak
    red4 r8 r16 red' mi4

    %38
    si do2
    si4 r r
    si sol mi

    %41
    si2.

}

IIIbcn = \relative do {

    R2.*30
   r8 r16 la' sol8.[sol16 sol8. sol16]

    %32
    fad4 r r
    R2.
    r8 r16 sol fad8.[fad16 fad8. fad16]

    %35
    mid4 r r
    mi! r r\mbreak
    red4 r8 r16 red mi4

    %38
    si do2
    si4 r r
    si' sol mi

    %41
    si2.

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*30
    <_->4 <6 4+>2
    <6>2.
    s
    s4 <6 4>2
    <7 5>2.
    <6+ 4+>
    s
    <_+>4 <6>2
    <_+>2.
    <_+>4 <6>2
    <_+>

}


forma = {

    \time 3/4
    \key mi\minor
    \tempo 2 = 50
    s2.*41
    \bar "||"

}

IIIfl = {
    \notypeset
    <<\IIIfln \forma>>

}

IIIob = {
    <<\IIIobn \forma>>

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

    r4 r8
    r2. r8 r la' si4.
    r2. fad8 sol la fad4.
    r2. r8 r do' do4.\mbreak

    %4
    R1.*2
    r2. r8 r fad, sol la sol
    fad4. r4 r8 r r fad sol la sol

    %8
    fad sol fad mi4 si'8 lad4.~lad4 si8
    si lad si fad4 lad8 si4. r8 r re
    dod4. dod re \mbreak r4 r8

    %11
    r2. r4 r8 r r re
    do si la r r re do si la r r la
    sib do sib la4 la8 re4.~re8 do si

    %14
    do si la si4 sold8 la4. r4 r8
    r r re, fad sol? la la4. r4 r8
    r4 r8 r r si\mbreak do re do si4.

    %17
    r4 r8 r r si do re do si do si
    la si la sol4. r2.
    r4 r8 r r si do4. r8 r do

    %20
    si4. r8 r si do4. r8 r do
    si4. r4 r8 r r si fad4 sol8
    la do si do si la si4.~si8 la sol\mbreak

    %23
    fad sol la sol4 fad8 mi4. r4 r8
    r2. r8 r mi fad sol la
    r8 r sol la4 la8 si4. r4 r8

    %26
    r2. r8 r si do si la
    r4 r8 fad4 fad8 mi4.

}

IVobn = \relative do'' {

    r4 r8
    r2. r8 r fad sol4.
    r2. red8 mi fad red4.
    r2. r8 r8 la' la4.\mbreak

    %4
    R1.*3
    r8 r fad sol la sol fad4. r4 r8
    R1.

    %9
    r2. r4 r8 r r fad
    mi4. mi re\mbreak r4 r8
    r2. r4 r8 r r fa

    %12
    mi re do r r fa mi re do r4 r8
    R1.*2
    r8 r la re mi fad fad4. r4 r8

    %16
    r8 r si, sol'4 fad8\mbreak r4 r8 r r fad
    sol la sol fad4. r2.
    r4 r8 r r re mi fad mi re mi re

    %19
    do re do si4. r8 r la' fad4.
    r8 r sol mi4. r8 r mi la4.
    r8 r re, fad4 mi8 fad4. r4 r8

    %22
    R1.\mbreak
    r8 r do si4 red8 mi4. r4 r8
    r r mi si4. si r8 r red

    %25
    si4. r4 r8 r r fad' mi4 mi8
    mi4. si si r4 r8
    r4 r8 fad4 si8 si4.

}


IVvlIn = \relative do'' {

    r8 r si'
    sol fad mi mi4 do'8 do4. r8 r8 si
    la si sol fad sol la red,4. r8 r la'
    sold la si mi,4 re'8 do4.~do4 si8\mbreak

    %4
    la si sol fad4 do'8 si4.~si4 la8
    sol la fad mi4 mi8 lad4.~lad4 si8
    si lad si fad4 lad8 si4. r4 r8

    %7
    r r lad,, si4. lad4. r4 r8
    R1.
    r4 r8 r r fad'' fad4 mi8 fad4 si8

    %10
    si4. lad si r4 fad8
    si do si do4 la8 sold4 mi8 fa4.
    r8 r mi fa4. r8 r mi la4.

    %13
    R1.
    r4 r8 r r mi mi fad! sol sol4 sol8
    sol4(fad8) r r fad fad sol la la4 la8

    %16
    la4(sol8) r4 r8\mbreak r2.
    R1.*2
    r2. r8 r la la4.

    %20
    r8 r sol si4. r8 r la la4.
    r8 r sol fad4 sol8 fad4. r4 r8
    R1.\mbreak

    %23
    r2. r8 r mi si' la sol
    fad sol la sol4 fad8 mi4. r8 r fad
    sol la si r4 r8 r r fad si la sol

    %26
    fad sol la sol4 fad8 mi4. r8 r do\p
    si la sol la4 fad8 sol4.

}

IVvlIIn = \relative do'' {

    r4 r8
    mi4. r8 r sol fad4. r8 r re
    mi4.~mi4 fad8 si,4. r8 r fad'
    mi4 sold8 si,4 sold'8 la4.~la4 sol8\mbreak

    %4
    sol4 mi8 la,4 fad'8 sol4 re8 si4 red8
    mi4. si4 si8 dod re dod fad4 fad8
    dod4. re4 dod8 re4. r4 r8

    %7
    R1.*2
    r4 r8 r r lad si4. si4 re8
    dod re mi dod4 dod8 re4.\mbreak r4 r8

    %11
    fad4. la4 fad8 mi4. re
    r8 r do re4. r8 r do mi4.
    R1.

    %14
    r4 r8 r r si dod re mi mi4 mi8
    re4 la8 r r la red mi fad fad4 fad8
    mi4 si8 r4 r8\mbreak r4 r8 r r red,

    %17
    mi4. red r2.
    r4 r8 r r si do4 do'8 si4 si,8
    la si la sold4. r8 r mi'' fad4.

    %20
    r8 r mi mi4. r8 r do' do4.
    r8 r si si,4 mi8 red4. r4 r8
    R1.\mbreak

    %23
    r2. r4 r8 r r mi
    mi4. mi4 red8 mi4. r8 r red
    mi fad sol r4 r8 r r red mi4 mi8

    %26
    mi4. mi4 red8 mi4. r8 r mi,\p
    fad4 mi8 mi4 red8 mi4.

}

IVvlan = \relative do' {

    r4 r8
    si'4. r8 r mi, la4. r8 r sol
    la4 si8 do si do fad,4. r8 r do'
    si4 mi,8 r r mi mi4.~mi4 re8\mbreak

    %4
    mi4. re4 re8 re4. mi4 fad8
    si4.~si4 si,8 fad'4.~fad4 fad8
    sol4. fad4 fad8 fad4. r4 r8

    %7
    r r lad, si4. lad r4 r8
    R1.
    r4 r8 r r dod' si4. fad4 fad8

    %10
    sol4. fad fad r4 r8
    si4. fad4 do'8 si4. si
    r8 r do si4. r8 r do la4.

    %13
    R1.
    r4 r8 r r mi la4. r8 r dod
    la4. la4 la8 la4. r8 r red,

    %16
    mi4. r4 r8\mbreak r4 r8 r r red
    mi4. red r2.
    r4 r8 r r si do4 do'8 si4 si,8

    %19
    la si la sold4. r8 r do' do4 la8
    sol4 si8 si la sol la4 mi8 re4 fad8
    sol la si si4 si8 si4. r8 r si

    %22
    do4 la8 r4 r8 r2.\mbreak
    r8 r la, si4 la8 sol4. r8 r si'
    do4 do8 si4 si8 sol4. r8 r si

    %25
    si4. r4 r8 r r si si4 si8
    do4 do8 si4 la8 sol4. r8 r la\p
    fad4 si,8 do4 si8 si4.

}

IVvcn = \relative do {

    \clef tenor r4 r8
    mi4. r8 r mi' re4. r8 r sol,
    do4 si8 la4. si4 la8 si4 red8
    mi4. sold,4 mi8 la si do la4 si8\mbreak

    %4
    do4. re4 re,8 sol? la si sol'4 fad8
    mi4 fad8 sol4 sol,8 fad4 mi8 fad4 re'8
    mi4 mi,8 fad'4 fad,8 si4. r8 r si

    %7
    lad4. r4 r8 r r lad si4 si8
    la! si la sol4 sol'8 fad4 mi8 fad4 re8
    mi4 mi,8 fad4 fad'8 sol4 sol,8 re4 re'8
    mi re dod fad4 fad,8 si4. r4 r8

    %11
    re4. red mi sold,
    r8 r la sold4. r8 r la do4.
    re4 re8 do re do si4 la8 sold la sold

    %14
    la si do re4 mi8  dod4. r8 r la
    re4 re,8 re'4 do8 si4. r8 r si
    mi4 mi,8 mi'4 red8 \mbreak mi4. red

    %17
    r4 r8 r r red mi4 mi,8 re'4 re,8
    do'4 do,8 si'4 si,8 r2.
    r4 r8 r r sold' la4 la8 red,4.
    r8 r mi sol?4. r8 r la fad4.

    %21
    r8 r sol red4 mi8 si'4. r4 r8
    r4 r8 la4 fad8 sol4 sol'8 red4 mi8\mbreak
    la,4 la8 si4 la8 sol4.~sol8 fad mi

    %24
    la,4 la'8 si4 si,8 mi4 mi'8 red4 si8
    mi4. do si4 si8 sol4 mi8
    la,4 la'8 si4 si,8 mi4. r8 r la\p

    %27
    red,4 mi8 la4 si8 mi,4.

}

IVbcn = \relative do {

    r4 r8
    mi4. r8 r mi re4. r8 r sol
    do4 si8 la4. si4 la8 si4 red,8
    mi4. sold4 mi8 la4 la,8 la'4 si8\mbreak

    %4
    do4. re4 re,8 sol?4 sol,8 sol'4 fad8
    mi4. sol fad4 mi8 fad4 re8
    mi4. fad4 fad,8 si4. r4 r8

    %7
    R1.*2
    r4 r8 r r fad' sol4. re4 re8
    mi4 dod8 fad4 fad,8 si4. r4 r8

    %11
    re4. red mi sold
    r8 r la sold4. r8 r la do,4.
    R1.

    %14
    r2. dod4. r8 r la
    re4 re,8 re'4 do8 si4. r8 r si
    mi4 mi,8 r4 r8\mbreak r2.

    %17
    R1.*2
    r2. r8 r la' red,4.
    r8 r mi sol4. r8 r la fad4.

    %21
    r8 r sol red4 mi8 si4. r4 r8
    R1.\mbreak
    r2. r4 r8 r r mi

    %24
    la,4. si  mi r8 r si
    mi4. r4 r8 r r si' sol4 mi8
    la,4. si mi r8 r la\p

    %27
    red,4 mi8 la,4 si8 mi,4.

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    s s8 s <6> <7>2.
    <6>4 <6 4>8 <6 5>4. <_+>4 <6>8 s4 <7 5>8
    <_+>2. s4. s4 <6!>8
    <6 5>4. s4 <7>8 s4. <6>4 <6+>8
    s4. <6> <_+> s4 <6>8
    <6+ 5>4. <6 4>4 <3>8 s2.
    s1.*2
    s4 s8 s s <_+> <7>4 <6>8 <6>4.
    <6+ 5> <_+ 7> s s
    <6> <7 5> <_+> <7- 5>
    s <7- 5> s <6>
    s1.
    s2. <6>4. s4 <7>8
    s4. s4 <6 4 3>8 <_+ 7>4. s8 s <_+ 7>
    <4>4 <3!>8 s4. s2.
    s1.*2
    s2. s4. <7 5>
    s <6> s <6 4>
    s2. <_+>
    s1.*2
    <6 4>4. <6 4>4 <3>8 s4. s8 s <_+>
    s2. s8 s <_+> <6>4.
    <6 5> <6 4>4 <3>8 s2.
    s4. <6 5>

}


forma = {

    \time 12/8
    \key mi\minor
    \tempo 2. = 55
    \partial 4. s4.
    s1.*9
    s2. s4. \bar ":..:"\break s
    s1.*16
    s2. s4.
    \bar ":|."

}

IVfl = {
    %\notypeset
    <<\IVfln \forma>>

}

IVob = {
    <<\IVobn \forma>>

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
#(set-global-staff-size 16)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\paper {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

    \header {
        subtitle = \markup "Sinfonia Quarta con Flauto e Oboe [autografo 1715] "
        composer = \markup {"A. Scarlatti (1660-1725)"}
    }

    \markup \huge {[1.] Vivace}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \set Staff.instrumentName = \markup \center-column{"Flauto"}
                    \Ifl \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \center-column{"Oubuoè"\vspace #-0.3"o Violino"}
                    \Iob \global
                >>
            >>

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

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                    \Ivla\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violoncello"}
                    \set Staff.midiInstrument = #"cello"
                    \Ivc\global
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso"\vspace #-0.3"continuo]"}
                \set Staff.midiInstrument = #"harpsichord"
                \Ibc\global
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

    \markup \huge {[2.] All[egr]o}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \IIfl \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIob \global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIvc\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIbc\global
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

    \markup \huge {[3.] Adagio}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \IIIfl \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IIIob \global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IIIvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IIIvc\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IIIbc\global
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

    \markup \huge {[4.] All[egr]o}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"recorder"
                    \IVfl \global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \IVob \global
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IVvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IVvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \IVvla\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"cello"
                    \IVvc\global
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"harpsichord"
                \IVbc\global
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



