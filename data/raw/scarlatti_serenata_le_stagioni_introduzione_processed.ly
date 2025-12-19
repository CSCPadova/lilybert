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



ItpIn = \relative do'' {

    r16 fad
    fad4 fad fad r8 fad16 sol
    la8 la la la la fad16 sol la sol la si
    la sol la si la sol la si\mbreak la4 r

    %4
    la8 la16 la la8 la la4 r
    fad r\mbreak r2
    r r8 mi mi la

    %7
    mi4 r r8 la la mi\mbreak
    la,4 r r8 la mi' fad16 sold
    la4 r mi r

    %10
    R1*2
    r2 mi8 mi16 mi mi8 mi
    mi4 r\mbreak mi8 mi16 mi mi8 mi

    %14
    mi4 r r2
    r la4 r
    la la la la

    %17
    la8 la la la la la la la\mbreak
    la4 r r2
    la4 la re, re\mbreak

    %20
    la' la sold8 la sold[la]
    sold4 r la8 fad la[fad]\mbreak
    la4 r la sold

    %23
    la la fad sold\mbreak
    mi si' mi,8 mi sold[sold]
    sold sold sold sold sold4 r

    %26
    s1
    R4.*19

}


ItpIIn = \relative do'' {

    r16 re
    re4 re re r8 re16 mi
    fad8 fad fad fad fad re16 mi fad mi fad sol
    fad mi fad sol fad mi fad sol\mbreak fad4 r

    %4
    r2 la8 la16 la la8 la
    la4 r\mbreak r2
    R1

    %7
    r8 mi mi la mi4 r\mbreak
    r8 la la mi la,4 r
    r8 la mi' fad16 sold la4 r

    %10
    R1*3
    mi8 mi16 mi mi8 mi\mbreak mi4 r
    la r r2

    %15
    r\mbreak fad4 r
    fad fad fad fad
    fad8 fad fad fad fad fad fad fad\mbreak

    %18
    fad4 r r2
    mi4 mi sold sold\mbreak
    mi mi mi8 fad mi[fad]

    %21
    mi4 r mi8 re mi[re]\mbreak
    mi4 r fad si
    fad mi si' si\mbreak

    %24
    la fad sold8 sold mi[mi]
    mi si' si[si] si4 r
    s1
    R4.*19

}


IobIn = \relative do'' {

    r8
    R1*2
    r2 fad8. fad16 mi8. mi16
    fad8. fad16 mi8. mi16 fad8 mi fad [mi]

    %5
    fad4 r\mbreak r2
    r mi4 mi
    mi mi mi mi\mbreak

    %8
    mi mi mi8 mi  mi[mi]
    mi mi mi[mi] mi4 r8 r16 mi\solo
    mi4 mi mi r8 dod16 re\mbreak

    %11
    mi8 mi mi mi mi dod16 re mi re mi fad
    mi re mi fad mi re mi fad mi8.\upl\tu mi16 sold8. sold16
    mi8. mi16 sold8. sold16\mbreak mi8 sold mi [sold]

    %14
    mi4 r r2
    r\mbreak la4 r
    la la la la

    %17
    la8 la la la la la la la\mbreak
    la4 r r2
    la4 la sold sold\mbreak

    %20
    dod, dod si8 si' si[si]
    si4 r mi,8 fad mi[fad]\mbreak
    mi4 r si' si

    %23
    la la la sold\mbreak
    la la sold8 sold sold[sold]
    sold sold sold[sold] sold4 r

    %26
    s1
    R4.*19

}


IobIIn = \relative do'' {

    r8
    R1*2
    r2\mbreak re8. re16 dod8. dod16
    re8. re16 dod8. dod16 re8 dod re[dod]

    %5
    re4 r\mbreak r2
    r dod4 dod
    dod dod dod dod\mbreak

    %8
    dod dod dod8 dod dod[dod]
    dod dod dod[dod] dod4 r8 r16 dod\solo
    dod4 dod dod r8 la16 si\mbreak

    %11
    dod8 dod dod dod dod la16 si dod si dod re
    dod si dod re dod si dod re dod8.\upl\tu dod16 si8. si16
    dod8. dod16 si8. si16\mbreak dod8 si dod[si]

    %14
    dod4 r r2
    r\mbreak re4 r
    re re re re

    %17
    re8 re re re re re re re\mbreak
    re4 r r2
    mi4 mi re re\mbreak

    %20
    mi mi sold8 fad sold[fad]
    sold4 r la8 la la[la]\mbreak
    la4 r fad sold

    %23
    dod, mi fad si,\mbreak
    mi fad si,8 si si[si]
    si si si[si] si4 r

    %26
    s1
    R4.*19

}


Ifgn = \relative do {

    r8
    R1*2
    r2\mbreak re8. re16 la8. la16
    re8. re16 la8. la16 re8 la re[la]

    %5
    re4 r\mbreak r2
    r la'4 la
    la la la la\mbreak

    %8
    la la la8 la la[la]
    la la la[la,] la4 r
    R1*2

    %12
    r2 la'8. la16 mi8. mi16
    la8. la16 mi8. mi16 \mbreak la8 mi la[mi]
    la4 r r2

    %15
    r fad4 r
    fad fad fad fad
    fad8 fad fad fad fad fad fad fad\mbreak

    %18
    fad4 r r2
    dod'4 dod, si' si,\mbreak
    la la mi'8 red mi[red]

    %21
    mi4 r dod8 re? dod[re]\mbreak
    dod4 r re mi
    fad dod re mi\mbreak

    %24
    dod red mi8 mi mi[mi]
    mi mi mi[mi] mi4 r
    s1
    R4.*19

}


IvlIn = \relative do'' {

    r8
    R1*2
    r2 r16 re' re re dod dod dod dod
    re re re re dod dod dod dod re re dod dod re re dod dod

    %5
    re la, la la re si si si\mbreak mi dod dod dod fad re re re
    la' la, si dod re mi fad sold la la sold fad mi re dod si
    la dod si la sold fad mi re dod mi fad sold la si dod re\mbreak

    %8
    mi dod re mi fad sold la si dod8 la mi[dod]
    la mi' dod[la] mi4 r
    R1*2

    %12
    r2 r16 la' la la sold sold sold sold
    la la la la sold sold sold sold\mbreak la la sold sold la la sold sold
    la mi mi mi fad re re re sol! mi mi mi la fad fad fad

    %15
    si sol sol sol dod la la la\mbreak re re, mi fad sol la si dod
    re fad, mi re dod si la sol fad la si dod re mi fad sol
    la8 re la fad re la' fad re\mbreak

    %18
    la16 la' si la si si dod si dod dod re dod re re mi re
    mi mi, mi mi mi' mi, mi mi re' re, re re re' re, re re\mbreak
    dod' dod, dod dod dod' dod, dod dod si' si, si si si' si, si si

    %21
    si' la sold fad mi re dod si la' la, la la la' la, la la\mbreak
    la' sold fad mi re dod si la fad' la, si la sold' la, si la
    la' la, si la la' la, si la fad' la, si la sold' la, si la\mbreak

    %24
    la' la, si la la' la, si la sold' si, dod si  si'mi, fad mi
    re' mi, fad mi re' mi, fad mi re'4 r
    s1

    %27
    dod8 dod, r16 dod'
    dod8 si r16 si,
    dod8 dod dod

    %30
    fad, fad' r16 fad\mbreak
    fad8 fad, fad
    sold r16 sold'\noBeam la8

    %33
    r16 la \noBeam mi8 red
    sold sold, r16 sold'
    lad dod lad fad dod lad'\mbreak

    %36
    si8 si, r
    mi16 si' sold mi si sold'
    la8 la, r

    %39
    la16 la' fad[re la fad']
    sol8 sol, r\mbreak
    mi'16 sol mi dod la mi'

    %42
    sol mi dod la dod mi
    fad la\p fad re la[fad]
    mi8 mi mi

    %45
    mi r r

}

IvlIIn = \relative do'' {

    r8
    R1*2
    r2\mbreak r16 fad fad fad mi mi mi mi
    fad fad fad fad mi mi mi mi fad fad mi mi fad fad mi mi

    %5
    fad fad, fad fad si sold sold sold\mbreak dod la la la la8 sold
    mi' la, si16 dod re si dod dod si la sold fad mi re
    dod la' sold fad mi re dod si la dod re mi fad sold la si\mbreak

    %8
    dod la si dod re mi fad sold la8 mi dod[la]
    mi dod' la[mi] dod4 r
    R1*2

    %12
    r2 r16 dod'' dod dod si si si si
    dod dod dod dod si si si si\mbreak dod dod si si dod dod si si
    dod dod, dod dod re fad fad re re dod dod dod fad re re re

    %15
    re mi mi mi mi dod dod dod\mbreak fad fad, sol la si dod re mi
    fad re dod si la sol fad mi re fad sol la si dod re mi
    fad8 la fad re la fad' re la\mbreak

    %18
    fad16 re' re fad re mi mi mi mi mi fad mi la fad sol fad
    la la la la \once\stemDown dod la, la la sold' sold sold sold si sold sold sold\mbreak
    mi' mi, mi mi mi' mi, mi mi sold sold fad fad sold sold fad fad

    %21
    sold fad mi re dod si la sold mi' mi fad fad mi mi fad fad\mbreak
    mi mi, re ' dod si la sold fad si dod re dod si dod re dod
    fad dod re dod mi dod re dod si dod sold la mi fad sold mi\mbreak

    %24
    mi'8 re16 dod si dod si dod si sold la sold sold' sold la sold
    si sold la sold si sold la sold si4 r
    s1

    %27
    r16 mi,, mi mi mi mi
    mi mi mi mi mi mi
    lad lad lad lad lad lad
    si si si si si si\mbreak
    sid sid sid sid sid sid
    dod dod dod dod dod dod
    dod dod dod dod sid sid
    dod dod dod dod dod dod
    dod8 dod r\mbreak
    fad16 si fad red si fad'
    sold8 sold, r
    mi'16 la mi dod la mi'
    fad8 la, r
    re16 sol re si sol re'\mbreak
    dod mi dod la dod dod
    mi sol mi dod la dod
    re fad \p re la fad[re]
    re8 re re
    dod r r

}

Ivlan = \relative do' {

    r8
    R1*2
    r2\mbreak r8 la' la16 la la la
    la8. la16 la la la la la la la la la la la la

    %5
    la fad fad fad re8 mi16 mi\mbreak mi8 fad16 mi fad8 sold
    la fad fad[mi] mi4 mi
    mi mi mi mi\mbreak

    %8
    mi mi mi8 mi la[mi]
    dod la' mi[dod] la4 r
    R1*2

    %12
    r2 r8 mi' mi16 mi mi mi
    mi8. mi16 mi mi mi mi\mbreak mi8 mi mi[mi]
    mi8. mi16 la la fad fad mi mi mi mi re re re re

    %15
    sol si si si la mi mi mi\mbreak la4 r
    la la la la
    la8 fad re la' fad re la' fad\mbreak

    %18
    re4 sol mi fad
    mi la si la\mbreak
    mi mi mi8 si' mi,[si']

    %21
    mi,4 r la8 re, mi[re]\mbreak
    mi4 r fad si8 sold
    fad4 mi fad si,\mbreak

    %24
    mi fad si,8 mi si[si']
    si si si[si] sold4 r
    s1

    %27
    la8 la r16 la
    la8 sold r16 sold
    fad8 fad fad

    %30
    fad re r16 re\mbreak
    fad8 fad red
    dod r16 mi dod8\noBeam

    %33
    r16 dod\noBeam sold'8 la
    sold mid r
    fad lad r\mbreak

    %36
    fad fad r
    si si, r
    dod' dod, r

    %39
    re re r
    re si r\mbreak
    mi sol sol

    %42
    mi sol sol
    fad fad\p re16[la]
    si8 si si

    %45
    la r r

}

Ibcn = \relative do {

    r8
    R1*2
    r2 re8. re16 la' la la la
    re,8. re16 la' la la la re,8 la la[re]

    %5
    re8. re16 si8 mi\mbreak dod fad re[si]
    dod fad si,[mi] la,4 la
    la la la la\mbreak

    %8
    la la la8 la la[la]
    la la la[la] la4 r
    R1*2

    %12
    r2 la'8. la16 mi mi mi mi
    la,8. la16 mi' mi mi mi\mbreak la8 mi la[mi]
    la8. la16 fad8 si mi, la fad[si]

    %15
    sol mi la[sol]\mbreak fad4 r
    fad fad fad fad
    fad8 fad fad fad fad fad fad fad\mbreak

    %18
    fad4 sol la fad
    dod dod si si\mbreak
    la la mi'8 red mi[red]

    %21
    mi4 r dod8 re? dod[re]\mbreak
    dod4 r re mi
    fad dod re mi\mbreak

    %24
    dod red mi8 mi mi[mi]
    mi mi mi[mi] mi4 r
    s1

    %27
    la8 la, r16 la
    mi'8 mi, r16 mi'
    mi8 mi mi

    %30
    re re, r16 re'\mbreak
    red8 red red
    mi r16 mi\noBeam fad8

    %33
    r16 fad\noBeam sold8 fad
    mid mid r
    mi! mi r\mbreak

    %36
    red red r
    re! re r
    dod dod r

    %39
    do do r
    si si r\mbreak
    la la la

    %42
    la la la
    la la\p la
    sold sold sold

    %45
    la r r

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s8
    s1*4
    s4 <6+>8 <_+> <6> <5> s4
    s <7>8 <_+ 7> s2
    s1*5
    s2 s4 <_+>
    s <_+> s8 <_+> s <_+>
    s4 s8 <6> s <7> s <6>
    s1
    <6>2 <6>
    s1 s4 <5>8 <6> s4 <6>
    <6> s <6+> s
    s2 <_+>
    <_+> <6>
    <6> <6>8 <5> <_+>4
    <5> <6> <6>8 <5> <_+>4
    <6> <6>8 <5> <_+>4 s
    s8 <7 _+> s4 <7 _+> s
    s1
    s4.
    <6 4>8 <5 3+> s16 <_+>
    <4+ 2>4.
    <6>
    <6+>
    <6>8 s16 <6> s8
    s <6 4>8 <6+ 4+>
    <6>4.
    <6 4+>
    s
    <4+ 2>
    <6>
    <6 4>
    <6>
    <_+ 7>
    <7>
    s4 <6 _+>8
    <6 5>4.

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 50
    \partial 8 s8
    s1*25
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}\break
    \mark\markup\huge {[2.] Moderato}
    \time 3/8
    \tempo 4. = 35
    s4.*19
    \bar "||"

}

ItpI = {
    %\notypeset
    <<\ItpIn \forma>>

}

ItpII = {
    <<\ItpIIn \forma>>

}

IobI = {
    <<\IobIn \forma>>

}

IobII = {
    <<\IobIIn \forma>>

}

Ifg = {
    \clef bass
    <<\Ifgn \forma>>

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



IItpIn = \relative do'' {

    la'2 r
    la sol
    la r

    %4
    R1
    r4 fad8 sol la4  la\mbreak
    la2 r

    %7
    R1
    mi2 r
    mi r

    %10
    fad r\mbreak
    fad r
    sold r

    %13
    fad r
    r r4 sold8 la
    si2 r\mbreak

    %16
    R1*2
    mi,2 sold
    la r

    %20
    la mi
    mi r\mbreak
    la r

    %23
    mi r
    mi r
    la, r

    %26
    fad' r\mbreak
    fad r
    fad r

    %29
    fad r
    re r
    la' r\mbreak

    %32
    fad r
    sold r
    la r

    %35
    fad r
    sol! r\mbreak
    mi r

    %38
    r4 fad8 sol la2
    r fad
    sol r4 re

    %41
    fad8 mi fad sol la sol la sol\mbreak
    fad2 r
    la la

    %44
    la s

}


IItpIIn = \relative do'' {

    fad2 r
    fad re
    fad r

    %4
    R1
    r4 re8 mi fad4 fad\mbreak
    fad2 r

    %7
    R1
    r2 mi
    r mi

    %10
    r fad\mbreak
    r fad
    r mi

    %13
    r fad
    r r4 mi8 fad
    sold2 r\mbreak

    %16
    R1*2
    la2 mi
    mi r

    %20
    mi sold
    la r\mbreak
    mi r

    %23
    la r
    r mi
    mi r

    %26
    re r\mbreak
    re r
    re r

    %29
    r fad
    fad r
    mi r\mbreak

    %32
    r fad
    r sold
    r la

    %35
    r fad
    r sol?\mbreak
    r mi

    %38
    r4 re8 mi fad2
    r re
    re r4 re

    %41
    la'2 mi\mbreak
    re r
    fad mi

    %44
    fad s

}


IIobIn = \relative do'' {

    la'2 r
    fad sol
    re r

    %4
    R1
    la'2 r\mbreak
    r4 fad8 sol la4 la

    %7
    la2 r
    mi r
    mi r

    %11
    fad r\mbreak
    fad r
    sold mi4 mi

    %14
    mi re8 dod si2
    si r
    r4 sold'8 la si2\mbreak

    %17
    R1*2
    mi,2 sold
    mi r

    %21
    mi sold
    la r\mbreak
    mi r

    %24
    mi r
    mi r
    mi r

    %27
    re r\mbreak
    fad r re r
    fad lad

    %30
    si r4 fad8 sol
    la2 r8 mi fad sol\mbreak
    fad2 r8 fad sold la

    %33
    sold2 r8 sold la si
    la2 r
    fad fad

    %36
    si, r\mbreak
    mi2 mi
    la, r4 re8 mi

    %39
    fad2 la
    si r4 re,
    la2 mi'\mbreak

    %42
    fad r
    fad dod
    fad s

}


IIobIIn = \relative do'' {

    fad2 r
    la, re
    la r

    %4
    R1
    fad'2 r\mbreak
    r4 re8 mi fad4 fad

    %7
    fad2 r
    si, r
    dod r

    %10
    dod r\mbreak
    re r
    si4 re dod dod

    %13
    dod fad, fad'2
    sold r
    r4 mi8 fad sold2\mbreak

    %16
    R1*2
    dod,2 mi
    dod r

    %20
    dod re
    dod r\mbreak
    dod r

    %23
    dod r
    si r
    dod r

    %26
    fad r\mbreak
    re r
    fad r

    %29
    re dod
    re r4 re
    mi2 r4 la,\mbreak

    %32
    la2 r4 si
    si2 r4 dod
    dod2 r

    %35
    si si
    sol' r\mbreak
    la, la

    %38
    fad' r4 fad8 sol
    la2 fad
    re r4 si

    %41
    fad'2 mi\mbreak
    la, r
    re mi

    %44
    re s

}


IIfgn = \relative do {

    re2 r
    re si
    fad' r

    %4
    R1
    re2 r\mbreak
    re r

    %7
    re r
    sold r
    la r

    %10
    lad r\mbreak
    si r
    mi, la

    %13
    re, red
    mi r
    mi r\mbreak

    %16
    R1*2
    mi2 mi,
    la r

    %20
    la' mi
    la, r\mbreak
    la' r

    %23
    la r
    sold r
    la r

    %26
    si r\mbreak
    si r
    si r

    %29
    fad fad
    si, r4 si
    dod2 r4 dod\mbreak

    %32
    red2 r4 red
    mid2 r4 mid
    fad2 r

    %35
    red red
    mi r  \mbreak
    dod dod

    %38
    re r
    re re
    sol, r4 sol'

    %41
    la2 la,\mbreak
    re r
    re la

    %44
    re, s

}


IIvlIn = \relative do'' {

    re4 fad8 sol la4 la
    la si8 dod re4 re
    re re, re' re,

    %4
    sol la8 si la4 sol
    fad2 r\mbreak
    la,2 r

    %7
    r4 fad'8 sol la4 re,
    si' mi, si' mi,
    dod' la8 si dod4 mi,

    %10
    dod' fad, dod' fad,\mbreak
    re' si8 dod re4 re
    re dod8 si dod4 dod

    %13
    dod si8 la si4 la
    sold sold8 la si2
    si, r4 si'8 dod\mbreak

    %16
    re si dod si dod la si dod
    si sold la sold la4 re,
    dod2 si

    %19
    la8 si dod re mi fad sold mi
    dod'2 si
    la r

    %22
    la,4 dod8 re mi4 mi
    mi fad8 sold la4 la
    mi8 fad mi fad mi fad mi fad

    %25
    mi fad sol fad sol fad sol lad?
    fad4 re8 mi fad4 fad\mbreak
    fad8 sol fad sol fad sol fad sol

    %28
    fad si la sol fad mi re dod
    re dod re mi dod si dod re
    si4 re8 mi fad2

    %31
    r4 mi8 fad sol2\mbreak
    r4 fad8 sol la2
    r4 sold8 la si2

    %34
    r4 fad8 sold la4 la
    la8 sold? fad sol! la fad sol la
    sol fad mi fad sol4 sol\mbreak

    %37
    sol8 fad mi fad sol mi fad sol
    fad2 r
    r4 la8 si do si do la

    %40
    si la si la si sol la si
    fad2 mi\mbreak
    re8 mi fad sol la si dod la

    %43
    re2 dod
    re s

}

IIvlIIn = \relative do'' {

    la4 re8 mi fad4 mi
    fad sol8 la si4 si
    la2 r4 la,

    %4
    re2 mi
    la, r\mbreak
    fad r

    %7
    r4 re' re8 dod si la
    si2 r4 si
    mi, dod'8 re mi4 dod

    %10
    dod2 r4 dod\mbreak
    fad, re'8 mi fad4 fad
    sold la8 sold la4 mi

    %13
    fad2 fad
    si,4 mi8 fad sold2
    sold, r4 sold'8 la\mbreak

    %16
    si sold la sold la fad sol mi
    fad4 re mi la,
    la2 sold

    %19
    la8 sold la si dod re mi dod
    la'2 sold
    dod, r\mbreak

    %22
    fad,4 la8 si dod4 si
    dod re8 mi fad4 fad
    si,8 re dod si dod re dod si

    %25
    dod re mi re mi re mi fad
    re4 si8 dod re4 dod\mbreak
    re8 mi re mi re4 dod

    %28
    re8 mi fad mi re dod si4
    si2 lad
    si4 si8 dod re2

    %31
    r4 dod8 re mi2\mbreak
    r4 red8 mi fad2
    r4 mid8 fad sold2

    %34
    r4 la,8 si dod4 dod
    si2 si
    si'8 la sol la si4 re,\mbreak

    %37
    la2 la
    la' r
    r4 fad8 sol la sol la fad

    %40
    sol fad sol fad sol mi fad re
    re2 dod\mbreak
    re8 dod re mi fad sol la fad

    %43
    fad2 mi
    fad s

}

IIvlan = \relative do' {

    fad2 r4 mi
    la2 sol
    la r4 fad

    %4
    re2 la'
    la r\mbreak
    re, r

    %7
    r4 la' fad2
    mi r4 mi
    mi2 la

    %10
    fad r4 fad\mbreak
    fad2 fad
    mi mi

    %13
    re fad
    mi r
    mi r\mbreak

    %16
    mi mi
    si4 fad' mi fad
    mi2 mi

    %19
    mi r
    mi mi
    mi r\mbreak

    %22
    dod r4 si'
    la2 la,4 re
    re2 la4 mi'

    %25
    mi2 dod
    fad r4 fad\mbreak
    si,2 r4 fad'

    %28
    si,2 r4 sol'
    re8 mi fad sol fad2
    fad r4 si

    %31
    mi,2 r4 dod'\mbreak
    fad,2 r4 red
    sold2 r4 dod

    %34
    fad,2 r4 mi
    fad2 fad
    mi r4 si'\mbreak

    %37
    mi,2 mi
    re r
    la' fad

    %40
    re r4 re
    la'2 la\mbreak
    la r

    %43
    la  la
    la s

}

IIbcn = \relative do {

    re2 r4 dod
    re2 si
    fad r4 fad'

    %4
    si2 dod
    re r\mbreak
    re, r

    %7
    re fad
    sold r4 sold
    la2 la

    %10
    lad r4 lad\mbreak
    si2 si,
    mi la,

    %13
    re red
    mi r
    mi r\mbreak

    %16
    mi la
    re, dod4 re
    mi2 mi,

    %19
    la r
    la' mi
    la, r\mbreak

    %22
    la' r4 sold
    la2 fad
    sold la4 sold

    %25
    la2 lad
    si r4 lad\mbreak
    si2 r4 lad

    %28
    si2 r4 mi,
    fad2 fad,
    si r4 si

    %31
    dod2 r4 dod\mbreak
    red2 r4 red
    mid2 r4 mid

    %34
    fad2 r4 dod
    red2 red
    mi r4 si\mbreak

    %37
    dod2 dod
    re r
    re re

    %40
    sol, r4 sol'
    la2 la,\mbreak
    re r

    %43
    re la
    re, s

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <6>
    <6> s4 <6>
    <6>2 <6>
    s1*7
    <_+ 7>1
    <7 9>4 <6 8> s2
    <_+>1
    <_+>
    <_+ 7>
    s
    <6 4>2 <3>
    s1
    s2 <_+ 7>
    s1*2
    s2 <6>
    s1*5
    <6 4>2 <3>
    s1*4
    s2 s4 <6>
    s1
    s2 s4 <6>
    <6>2 <5>
    s1
    s2 <7->
    s1
    <6 4>2 <3>

}


forma = {

    \time 2/2
    \key re\major
    \tempo 1 = 60
    s1*21
    \bar ":..:"\break
    s1*22
    s2 r\fermata
    \bar":|."

}

IItpI = {
    %\notypeset
    <<\IItpIn \forma>>

}

IItpII = {
    <<\IItpIIn \forma>>

}

IIobI = {
    <<\IIobIn \forma>>

}

IIobII = {
    <<\IIobIIn \forma>>

}

IIfg = {
    \clef bass
    <<\IIfgn \forma>>

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
IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}
#(set-global-staff-size 17.5)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\paper {

    systems-per-page = #2
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller \center-column{{"Serenata a cinque Voci con Strumenti"}\line {"  "}\line{"Introduzione"}}
    composer = \markup {"A. Scarlatti (1660-1725)"}
}

\markup \huge {[1.] All[egr]o}

\score {
    <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup {"Tromba P."\super ma}
                \set Staff.midiInstrument = #"trumpet"
                \ItpI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup {"Tromba 2."\super da}
                \set Staff.midiInstrument = #"trumpet"
                \ItpII\global
            >>
        >>

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Oubuè [I]"}
                \set Staff.midiInstrument = #"oboe"
                \IobI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Oubuè [II]"}
                \set Staff.midiInstrument = #"oboe"
                \IobII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Fagotti due""del Concertino"}
                \set Staff.midiInstrument = #"bassoon"
                \Ifg\global
            >>
        >>

        \new ChoirStaff  <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \IvlI \global
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \IvlII \global
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \set Staff.midiInstrument = #"viola"
                \Ivla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc\global
            >>
        >>
    >>

        \layout {

            indent = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortlætatus-duration = #(ly:make-moment 1/4)
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

\markup \huge {[3.] Presto}

\score {
    <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"trumpet"
                \IItpI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"trumpet"
                \IItpII\global
            >>
        >>

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIobI\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"oboe"
                \IIobII\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"bassoon"
                \IIfg\global
            >>
        >>

        \new ChoirStaff  <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI \global
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII \global
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"viola"
                \IIvla\global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IIbc\global
            >>
        >>
    >>

        \layout {

            indent = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortlætatus-duration = #(ly:make-moment 1/4)
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
