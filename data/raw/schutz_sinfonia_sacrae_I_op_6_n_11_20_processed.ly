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



IvlIn = \relative do'' {

    R1*9
    sol'8 la sol mi fa  mi re fa
    mi re re dod re2

    %12
    R1
    re8 mi re si do si la do
    si do re sol,\mbreak la2

    %15
    la'8 sib la fad sol fa? mi sol
    fa mi re re do2
    r2 r4 re

    %18
    mi8 mi fad4 sol r8 mi
    fad fad sold4\mbreak la8 la, re do
    si4 do8 mi la sol? fad4

    %21
    mi r r r8 mi
    la sol fad4 re r8 re sol
    fa? mi4 do8 fa la sol  %%% fin qui OK fine p Spitta

    %24
    fad4 sol2 fad4 % inizio quarta riga
    sol1
    R1*2

    %28
    r2 r4 sol
    sol8[fa fa mi16 re] mi4. mi8
    re2 r

    %31
    re8. re16 mi4 fad sol~
    sol fad sol sol
    sol8[fa fa mi16 re]\mbreak mi4. mi8

    %34
    re2 r
    r4 mi8. mi16 fad2
    sold4 la2 sold4

    %37
    la2 r4 sol~
    sol8 sol fa4 mi2
    re4 fad8. fad16 sol4 la~

    %40
    la sol2 fad4
    sol1
    R1*6

    %48
    r4 la8 re,\mbreak mi la, mi' la
    fa1
    mi4 do8 la mi' la, mi' sol

    %51
    sold4 la2 sold4
    la2 sol?4. sol8
    sol2 mi4. fad8

    %54
    sol1
    fad2 r
    r4 la8 mi fa re mi la

    %57
    fad4 sol2 fad4\mbreak
    sol4 r sol8 re mi sol
    si mi, sol4 sol2

    %60
    R1*9
    r2 r8 sol sol sol
    sol4 mi fad4. fad8

    %71
    sol2 la
    re, r
    R1*5

    %78
    r8 re mi fa\mbreak sol mi la sol
    fad re sol fa? mi2
    re r

    %81
    r8 si do re mi do fa mi
    re si mi re re4 dod
    re8 la si dod re si mi re\mbreak

    %84
    do la re do si2
    la r
    R1

    %87
    r8 do re mi fa re sol fa
    mi re fa mi re2
    do r8 si do re

    %90
    mi do fa mi re si mi4~
    mi fad sol mi
    re1

    %93
    re\longa\fermopz

}

Isopranon = \relative do'' {

    \autoBeamOff

    re8 mi re si do si la do
    si do re sol, la2
    sol8 la sol mi fa mi re fa

    %4
    mi re re dod re2
    r2 re'8 mi re si
    do si la do si do re mi

    %7
    la,2 la8 sib la fad
    sol fa? mi sol fad sol la re,
    mi sol do si la sol4 fad8

    %10
    sol2 r
    R1
    r4 re mi8 mi fad4

    %13
    sol8 re sol fa mi4(la)
    sol r r2
    r r4 sol

    %16
    la8 la si4 do8 sol do8. [si16]
    la8 sol fa4 mi8 do sol' fa
    mi mi la4 si8 si dod4

    %19
    re r r8 do fa  mi
    re4 do8 sol do do red4
    mi8 si mi re dod4 la

    %22
    r8 la re do? si4 sol
    r8 sol do si la2~
    la1

    %25
    si
    r4 re re8[do do si16 la]
    si4. si8 la4 si8 si

    %28
    dod4 re2 dod4
    re2 r
    r4 re re8[do do si16 la]

    %31
    si8. la16 sol4 r2  %%% fine pagina
    r4 do do8[si si la16 sol]
    la4. la8 la2

    %34
    r4 sol sol8[fa fa mi16 re]
    mi4. mi8 re4 re'
    re8[do do si16 la] si4. si8

    %37
    la4 do8. do16 re4 mi~
    mi re2 dod4
    re2 r4 do~

    %40
    do8 do si4 la2
    si1
    R1*2

    %44
    r2 re4. re8
    re2 la4. si8
    do1

    %47
    si4 mi8 la, si mi, si' mi
    dod4 re2 dod4
    re la8 re, fa re la' re

    %50
    do2 la
    r mi'4. mi8
    mi2 do4. re8

    %53
    mi1~
    mi2 red4 dod
    red2 mi8 si do! la

    %56
    si mi, mi'4 re la8 mi
    fad la sol si la [sol] la4
    sol mi8 do sol' si do sol

    %59
    re' do4 si8 do2
    R1*3
    r8 re re re re4 si

    %64
    dod4. dod8 re2
    mi1
    la,2 r8 sol la si

    %67
    do la re do si sol do si
    la2 sol
    R1*3

    %72
    r8 sol sol sol sol4 mi
    fad4. fad8 sol2
    la re,8 sol la si

    %75
    do la re do si sol do si
    la2 sol
    r8 re' re re re4 si

    %78
    re re8 re mi2
    la, r
    R1

    %81
    r8 re, mi fa sol mi la sol
    fa re sol fa mi2
    re1

    %84
    r2 r8 sold la si
    do la re do si sol! do si
    la4 fa r2

    %87
    r8 la si do re si mi re
    do si re do si2
    sol r8 sol la si

    %90
    do la re do si sol do si
    la2 sol4 la
    fad sol2 fad4

    %93
    sol\longa\fermopz

}

ItestoI = \lyricmode {

    Bene - dicam _  Domi - num in omni _ tempo - re,  bene - dicam _  Domi - num in omni _ tempo - re,

    bene - dicam _  Domi - num in omni _ tempo - re,  bene - dicam _  Domi - num in omni _ tempo - re,

    in omni _ tem - po -- re, sem -- per laus e -- jus in o -- re me -- o, sem -- per laus e -- jus in o - re me -- o,

    in o -- re me -- o, sem -- per laus e -- jus in o -- re me -- o, sem -- per laus e -- jus in o -- re me -- o,

    in o -- re me -- o, in o -- re me -- o.

    Lau -- da - bi -- tur ani - ma me - a,  lau -- da - bi -- tur, lau -- da - bi -- tur, lau -- da - bi -- tur,

    lau -- da - bi -- tur ani - ma me - - a, a -- ni -- ma me -- a.

    Au -- diant _ man -- su -- e -- ti, et læ -- tentur, _ et læ -- ten - - tur, et læ -- tentur, _ et læ -- ten -- tur,

    au -- diant _ man -- su -- e - - ti et læ -- tentur, _ et læ -- ten -- tur, et læ -- tentur, _ et læ -- ten - tur,

    et læ -- tentur, _ et læ -- ten - - tur.

    Magni - fica - te Do -- minum _ me -- cum, et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    magni - fica - te Do -- minum _ me -- cum, et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    magni - fica - te Do -- minum _ me -- cum, et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum, et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,  in id -- i - psum.

}

Itenoren = \relative do' {

    \autoBeamOff

    R1*10
    r2 re8 mi re si
    do si la re do si la la

    %13
    sol2 r2
    sol8 la sol mi fa mi re mi \mbreak
    fa sol la re, sol2

    %16
    r2 r4 sol
    la8 la si4 do r8 sol
    do si la4 sol r8 sol

    %19
    re' do si4\mbreak la r
    r8 sol do si la4 si
    r r8 si mi  re dod4

    %22
    la r8 la re8 do? si4
    sol r8 sol do si la4\mbreak
    la8 re do si la2

    %25
    sol1
    R1*3
    r2 r4 do

    %30
    do8[si si la16 sol] la4. la8
    sol2 la8. la16 si4
    do la\mbreak r si8. si16

    %33
    dod4 re2 dod4
    re2 r4 la
    la8[sol sol fa16 mi] la4. la8

    %36
    mi4 do'8. do16 re4 mi
    la,2 r\mbreak
    dod8. dod16 re4 mi la,

    %39
    fad8. fad16 la4 si mi,
    fad8. fad16 sol4 la re,
    r2 re'4. re8

    %42
    re2 sol,4. la8\mbreak
    sib1~
    sib2 la4 sol

    %45
    la1
    r2 r4 do8 la
    mi' si do re si2

    %48
    la r
    re4. re8 re2
    la4. si8 do2\mbreak  %% fine pagina ed antica

    %51
    si4 mi8 la, si mi, si' mi
    do4. re8 mi2~
    mi do

    %54
    r4 re8 sol, si sol si mi,
    fad2 mi4 r\mbreak
    mi'8 si do la re si dod4

    %57
    re r r re8 la
    si sol do la re si mi do
    si [do] re4 mi2\mbreak

    %60
    r8 do do do do4 la
    si4. si8 dod2
    re1

    %63
    si
    R1*4
    r8 re re re re4 si

    %69
    re re8 re mi2~\mbreak
    mi la,
    r8 do do do do4 la

    %72
    si4. si8 do2
    re si
    R1

    %75
    r2 r8 sol la si
    do la re do\mbreak si sol do si
    la2 sol

    %78
    R1
    r8 re mi fa sol mi la sol
    fad re sol fa? mi2

    %81
    re4 r r2
    r8 re mi fa sol mi la sol
    fad re sol la fad4 sol4~

    %84
    sol8 mi la2  sold4
    la2 r8 sol? la si\mbreak
    do la re do si sol do si

    %87
    la2 la
    r r8 si do re
    mi do fa mi re si mi re\mbreak

    %90
    do4 la r8 sol la si
    do la re do si sol do4~
    do si4 la2

    %93
    sol\longa\fermata

}

ItestoII = \lyricmode {

    Bene - dicam _  Domi - num in omni _ tempo - re,  bene - dicam _  Domi - num in omni _ tempo - re,

    sem -- per laus e -- jus in o -- re me -- o, in o -- re me -- o,  in o -- re me -- o,

    in o -- re me -- o, in o -- re me -- o,  in o -- re me -- o, in o -- re me -- o.

    Lau -- da - bi -- tur a -- ni -- ma me -- a,  a -- ni -- ma me - a, lau -- da - bi -- tur,

    ani - ma me -- a, a -- ni -- ma me -- a a -- ni -- ma me -- a, a -- ni -- ma me -- a.

    Au -- diant _ man -- su -- e - - ti, et læ -- tentur, _ et læ -- ten -- tur,

    au -- diant _ man -- su -- e -- ti et læ -- tentur, _ et læ -- ten - - tur, et læ -- tentur, _ et læ -- ten -- tur,

    et læ -- tentur, _ et læ -- ten -- tur, et læ -- ten -- tur, et læ -- tentur, _ et læ -- ten - tur.

    Magni - fica - te Do -- minum _ me -- cum, magni - fica - te Do -- minum _ me -- cum,

    magni - fica - te Do -- minum _ me -- cum, et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    et ex -- al -- temus _ nomen _ e -- jus in id -- i - - - - psum, et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,  et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum.

}

Ibasson = \relative do {

    \autoBeamOff

    R1
    sol'8 la sol mi fa mi re fa
    mi fa sol la re,2\mbreak

    %4
    r re8 mi re si
    do si la do si do re mi
    la,2\mbreak sol'8 la sol mi

    %7
    fa mi re mi fa sol la re,
    sol2 re8 mi re si
    do si la si do mi do re\mbreak

    %10
    sol,2 r4 re'
    sol8 sol la4 re, r
    R1

    %13
    r4 re mi8 mi fad4
    sol r r2
    r r4 do,\mbreak

    %16
    fa8 fa sol4 do, r8 do
    fa mi re4 do r
    r r8 re sol fa mi4

    %19
    re r8 mi la sol fa4\mbreak
    sol r r2
    r r8 la, la' sol

    %22
    fad4 re r8 sol, sol' fa
    mi4 do r8 fa, fa' mi
    re1

    %25
    sol,
    R
    r2 r4 sol'\mbreak

    %28
    sol8[fa fa mi16 re] mi4. mi8
    re2 r4 mi8. mi16
    fad4 sol2 fad4

    %31
    sol do, do8[si si la16 sol]
    la4. la8 sol2
    r2 r4 la8. la16\mbreak

    %34
    si2 dod4 re~
    re dod re2
    R1

    %37
    r2 fa8. fa16 sol4
    la1
    re,2 si8. si16 do4

    %40
    re1
    sol,
    R

    %43
    r2 sol'4. sol8
    sol2 re4. mi8
    fa1\mbreak

    %46
    mi4 do8 la mi' la, mi' la
    sold4 la2 sold4
    la1

    %49
    R1*2
    mi4. mi8 mi2
    la,4. si8 do2~

    %53
    do1
    si
    r4 si'8 fad\mbreak sold mi la fad

    %56
    sold4 la r2
    re,8 la si sol re' mi re4
    sol, r si8 sol do mi\mbreak

    %59
    sol la sol4 do,2
    R1*5
    r8 sol' sol sol sol4 mi

    %66
    fad4. fad8 sol2
    la re,
    r8 re mi fa\mbreak sol mi la sol

    %69
    fad re sol fa? mi2~
    mi re
    R1*2

    %73
    r2 r8 sol, la si
    do la re do si sol do si\mbreak
    la2 sol

    %76
    R1
    r8 re' mi fa sol mi la sol
    fad re sol fa? mi2

    %79
    re r2
    r8 sol, la si\mbreak do la re do
    si sol do2 do4

    %82
    re2 sol,4 r
    r8 re' re re re4 si
    do re8 re mi2

    %85
    la,\mbreak r8 mi' fa sol
    la fa sib la sol mi la sol
    fa1

    %88
    sol2 r8 sol la si
    do la re do\mbreak si sol do si
    la4 fa sol mi

    %91
    do re mi do
    re1
    sol,\longa\fermopz

}

ItestoIII = \lyricmode {

    Bene - dicam _  Domi - num in omni _ tempo - re,  bene - dicam _  Domi - num in omni _ tempo - re,

    bene - dicam _  Domi - num in omni _ tempo - re,  bene - dicam _  Domi - num in omni _ tempo - re,

    sem -- per laus e -- jus, sem -- per laus e -- jus, sem -- per laus e -- jus in o -- re me -- o,

    in o -- re me -- o, in o -- re me -- o, in o -- re me -- o, in o -- re me -- o,

    in o -- re me -- o.

    Lau -- da - bi --tur a -- nima _ me - a,  lau -- da - bi -- tur, ani - ma me - - a, a -- ni -- ma me -- a,

    a -- ni -- ma me -- a.

    Au -- di -- ant man -- su -- e -- ti, et læ -- tentur, _ et læ -- ten - - tur, au -- di -- ant man -- su -- e -- ti,

    et læ -- tentur, _ et læ -- ten -- tur, et læ -- tentur, _ et læ -- ten -- tur, et læ -- tentur, _ et læ -- ten -- tur.

    Magni - fica - te Do -- minum _ me -- cum, et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    magni - fica - te Do -- minum _ me -- cum, et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum,

    et ex -- al -- temus _ nomen _ e -- jus in id -- i -- psum, nomen _ e -- jus in id -- i -- psum.

}

Ibcn = \relative do {

    \clef violin re''8 mi re si do si la do
    \clef bass sol, la sol mi fa mi re fa
    mi fa sol la re,4 sib

    %4
    sol la\mbreak re8 mi re si
    do si la do si do re mi
    la,4 la' sol8 la sol mi

    %7
    fa mi re mi fa sol la re,
    sol4 do,\mbreak re8 mi re si
    do si la si do mi do re

    %10
    sol,4 do, fa sib
    sol8 sib la4 re sol,\mbreak
    do4 re8 si do4 re

    %13
    sol sol, do re
    sol8 la sol mi fa mi re mi
    fa sol la re, sol4 do,\mbreak

    %16
    fa8 fa sol4 do,4. do8
    fa mi re4 do si
    do re sol8 fa mi4

    %19
    re mi la8 sol fa4
    sol do8 si la4 si\mbreak
    mi, sold la8 la, la' sol?

    %22
    fad4 re sol, sol'8 fa?
    mi4 do fa, fa'8 mi
    re1

    %25
    sol,
    sol'2 fad
    sol re4 sol\mbreak

    %28
    sol8 [fa fa mi16 re] mi2
    re do4 mi
    fad sol2 fad4

    %31
    sol do, do8[si si la16 sol]
    la2 sol4 \clef tenor si'
    dod re2 \clef bass la,8 la\mbreak

    %34
    si2 dod4 re~
    re dod re2
    mi4 \clef tenor do'8 do re4 mi

    %37
    la,2 \clef bass fa8 fa sol4
    la1
    re,2 si8 si do4

    %40
    re1\mbreak
    sol,
    sol'2 sol4. fad8

    %43
    sol2 sol4. sol8
    sol2 re4. mi8
    fa1

    %46
    mi4 do8 la mi' la, mi' la
    sold4 la2 sold4
    la1

    %49
    re,
    la'\mbreak
    mi2 mi

    %52
    la,4. si8 do2~
    do1
    si

    %55
    si2 sold'8 mi la fad
    sold4 la\clef tenor re8 si dod4
    \clef bass re,8 la si sol re' mi re4

    %58
    sol, do si8 sol do mi
    sol la sol4 do,2
    do2. re4

    %61
    sol2 mi
    re1
    sol,2 sol'

    %64
    la fa
    mi1
    re2 si

    %67
    la sol\mbreak
    re'4 mi8 fa sol mi la sol
    fad re sol fa? mi2~

    %70
    mi re
    do la
    sol4 sol' mi2

    %73
    re sol8 sol, la si
    do la re do\mbreak si sol do si
    la2 sol8\clef tenor sol' la si

    %76
    do la re do si sol do si
    la \clef bass re, mi fa sol mi la sol
    fad re sol fa?\mbreak mi2

    %79
    re4 mi8 fa sol mi la sol
    fad sol, la si do la re do
    si sol do2 do4

    %82
    re2 sol,4 la
    re re8 re re4 si\mbreak
    do4 re mi2

    %85
    la, mi'4 fa8 sol
    la fa sib la sol mi la sol
    fa2~fa

    %88
    sol sol4 la8 si
    do la re do\mbreak si sol do si
    la4 fa sol mi

    %91
    do re mi do
    re1
    sol,\longa\fermopz

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    s4 s8 <_+> s2
    <6>8 <5> <_+>4 s2
    s s4 s8 <_+>
    s1
    s2 s8 <_-> <_+> <_+>
    s2 <_+>4 <_+>
    s8 <6> s4 <6> s8 <_+>
    s1
    <6>4 <_+> <_+> s
    s <_+>8 <6> s4 <_+>
    s2 s4 <_+> s1
    s8 <_-> <_+> <_+> s2
    s1
    s4 <6> s <6>
    s <_+> s <[6+]>
    <_+> <_+> s <6>8 <5>
    s2 s4 <_+>
    s <6> <_+> <_+>
    <6> <_+> s2
    <6> s
    <[3+]>4 <4>2 <[3+]>4
    s1
    s
    s2 <_+>
    <[4+]>4 <6> <7> <[6+]>
    <4>4 <3> s <6>
    s1
    s2 <[4+]>4 <6>
    <7> <[6+]> s <6>
    s2 s4 <_+>
    <6>1
    s2 <_+>
    <_+>4 <6> s <_+>
    s2 <6>4 <6>
    <[3+]>4 <4>2 <[3+]>4
    <_+>2 <6>4 <6>
    <[3+]> <4>2 <[3+]>4
    s1
    s
    <_->2 <_->
    s1
    <6>2 <5>
    <6> <6>4 <6>
    s1
    <[3+]>4 <4>2 <[3+]>4
    s1*2
    <[3+]>4 <4> <4>  <[3+]>
    s1*2
    <6 4>1
    <_+>2 <6>
    <6> s4 <6>
    <_+>8  <[6+]> <6>4 <4> <_+>
    s2 <6>4 s8 <6>
    s4 <4>8 <[3]> s2
    s s4 <_+>
    s2  <[6+]>
    <_+>2 <[3+]>
    s1
    <_+>2 <6>
    <7> <[6+]>
    <_+>2 s
    s1*2
    s2 <[6+]>4 <7>
    s <[6+]> <_+>2
    s1
    s2 <[6]>
    <_+>1
    <6>2 <6>
    s1
    <6>2 <6>
    s8 <_+> s4 s2
    <6>1
    <[_+]>2 <6>
    s1*2
    s2 <6>8 <5> <_+>4
    <_+>2 <_+>4 <6>
    s2 <4>4 <[3+]>
    s1*2
    s2 <6>4 <5>
    <4> <3> s2
    s1
    s4 <6>8 <5> s4 <6>8 <5>
    <6>4 <_+> s <6>
    <[3+]> <4>2 <[3+]>4

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 65
    s1*92
    s\longa
    \bar "|."

}

IvlI = {
    \notypeset
    <<\IvlIn \forma>>

}

Isoprano = {
    \new Voice = "benedicam1"
    <<\Isopranon \forma>>
}

Itenore = {
    \new Voice = "benedicam2"
    <<\Itenoren \forma>>
}

Ibasso = {
    \clef bass
    \new Voice = "benedicam3"
    <<\Ibasson \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}





IIvlIn = \relative do'' {

    r4 si4. la8 la la
    sol4. sol8 fad2
    r r4 re'4~

    %4
    re8 do do do si4. si8
    la2 r4 sol'4~
    sol8 fa fa fa mi4. mi8

    %7
    re4 r\mbreak r re~
    re8 do do do si4. si8
    la4 la si mi,

    %10
    fad sold la2
    r4 re mi la,
    si2 dod

    %13
    re4 r r2
    r4 sol la re,
    mi8 fa sol2 fa8 mi

    %16
    fa2 mi
    re1\mbreak
    r2 re4 re

    %19
    re re8 re re si do re
    mi2. re8 mi
    fa4 mi2 re4

    %22
    mi2 dod8 la si dod
    red4 mi8 fad red2
    mi1

    %25
    fad8 red? mi fad sol4 fad8 fad\mbreak
    mi2 do
    R1

    %28
    r2 fad4 fad
    fad fad8 fad fad re mi fad
    sol4 fad8 fad mi dod re mi

    %31
    fad4 mi8 mi red2
    red fad4 sol4~
    sol8 sol re4 re2\mbreak

    %34
    re4 mi4. mi8 re4
    mi1
    mi4 la4. sold8 sold4

    %37
    la2 r
    R1*3
    r4 do, si8 si si si

    %42
    do4 do re8 mi fa re
    mi[fa16 sol do,8 re16 mi]\mbreak si8[do16 re sol,8 la16 si]
    do8[re16 mi la,8 si16 do] fa,8 sol16 la si8 do16 re]

    %45
    sol,8[la16 si mi,8 fa16 sol] la8[si16 do fa,8 sol16 la]
    sold8[la16 si do8 re16 mi] si2
    la r

    %48
    r sol'8 fad sol mi
    fa? [sol16 la re,8 mi16 fa] mi4 fa
    sol2. sol4

    %51
    sol2 r4 re
    si8 si si si mi2
    la, r

    %54
    R1*3\mbreak %% fine pagina
    sol'8 fa mi sol fa[sol16 la re,8 sol16 fa]
    mi8[fa16 sol fa8 sol16 la] mi4. mi8

    %59
    re mi fa re mi[fa16 sol do,8 re16 mi]\mbreak
    re8 mi16 fad sol2 fad4
    sol2 r

    %62
    R1
    r4 sol fa4. fa16 fa
    mi4 mi r8 re mi4

    %65
    do re si r
    r8 sol' la4 fa sol\mbreak
    mi r r re

    %68
    do4. do16 do si4 si8 si
    do4 la sol sol8 sol'
    la4 fa sol mi8 mi

    %71
    fa4 re mi do8 do
    re4 si la re,
    r8 re' mi4\mbreak do re

    %74
    si8 si do4 la si~
    si la2 sold4
    la do re si

    %77
    la la r8 re mi4
    do re si r
    r2 r8 sol' la4

    %80
    fad sol\mbreak mi r8 mi
    re4 si la2
    sol1

    %83
    r4 mi' fa2
    re4 mi si r
    r2 r4 do

    %86
    re2 si4 do
    sol r r la
    re,2 re'

    %89
    re1
    re\breve

}

IIsopranon = \relative do'' {

    \autoBeamOff

    r4 re4. do8 do do
    si4. si8 la4 la
    si mi, fad sold

    %4
    la2 r4 re
    mi la,\mbreak si dod
    re2 r4 la~

    %7
    la8 sol sol sol fa4. fa8
    mi2 r
    r4 re'4. do8 do do

    %10
    si4. si8 la4 do
    re sol, mi fad
    sol r sol la

    %13
    re, mi2 fad4
    sol2 r4 si
    do sol mi2

    %16
    la1
    la
    R1*3

    %21
    la4 la\mbreak la la8 la
    sold mi fad sold la2~
    la4 sol?8 sol fad2

    %24
    mi r
    r si'4 si
    si si8 si la fad sol? la\mbreak

    %27
    si2 sol4 sol
    fad si2 lad4
    si1

    %30
    r2 sol8 mi fad sol
    la4 sol8 sol fad2
    fad si4 re~

    %33
    re8 do si4\mbreak r si
    sol4. la8 si4 r
    sol si4. la8 sol4

    %36
    sol mi'4. si8 si4
    dod2 r
    r4 la sold8 sold sold sold\mbreak

    %39
    la4 la si8 do re si
    do [re16 mi la,8 si16 do] si8 [do16 re sol,8 la16 si]
    la8[si16 do fa,8 sol16 la]\mbreak re,8[mi16 fa mi8 re]

    %42
    mi [fa16 sol do,8 re16 mi] re4. re8
    do2 r
    R1*2

    %46
    r4 la' sold8 sold sold sold
    la4 la\mbreak si8 do re si
    do [re16 mi la,8 si16 do] si8 [do16 re sol,8 la16 si]

    %49
    la8[si16 do si8 do16 re] do8 [re16 mi la,8 si16 do]
    si8 [do16 re do8 re16 mi] re4. re8
    do4 sol fad8 fad fad fad

    %52
    sold2 la
    r si8 do re si
    do [re16 mi la,8 si16 do] sold8[la16 si mi,8 fad16 sold]

    %55
    la4. la8 si2
    r do8 si la do
    si8 [do16 re sol,8 la16 si] la8[si16 do si8 do16 re]\mbreak

    %58
    dod8 [re16 mi] re2 dod4
    re2 r
    R1

    %61
    r4 re do4. do16 do
    si4 si8 si do4 la
    sol sol8 sol la4. si16 si

    %64
    do4 do r2\mbreak
    r r4 r8 si
    do4 la si sol

    %67
    r8 sol la4 fad sol~
    sol fad sol re'
    mi do re si\mbreak

    %70
    r la si4. dod16 dod
    re4 la8 re do4. do16 do
    si4 si8 si do4 la

    %73
    si sol8 sol la4 fad\mbreak
    sol mi r re'
    do4. do16 do si4 si8 si

    %76
    do4 la si sol
    r8 la re4 si do
    la4 r\mbreak r8 si do4

    %79
    la si sol r
    r2 r8 sol la4
    fad sol2 fad4

    %82
    sol2 r4 si
    do2 la
    si4 sol r2\mbreak

    %85
    r4 sol la2
    fad sol4 mi
    r sol do2~

    %88
    do si
    la1
    si\breve

}

IItestoI = \lyricmode {

    Ex -- qui -- si -- vi Do -- minum _

    et ex -- au -- di -- vit me, et ex -- au -- di -- vit me, ex -- qui -- si -- vi Do -- minum _

     ex -- qui -- si -- vi Do -- minum _ et ex -- au -- di -- vit me,

    et ex -- au -- di -- vit me, et ex -- au -- di -- vit me,

    et ex o -- mnibus _ tribu - lati - o -- nibus _ me -- is,

    et ex o -- mnibus _ tribu - lati - o -- nibus _ me - - is, tribu - lati - o -- nibus _ me -- is,

    e -- ri -- puit, _ e -- ri -- puit, _  e -- ri -- puit, _  e -- ri -- puit _ me.

    Ac -- cedi - te ad e -- um et il -- lumi - na - - - - - mi -- ni,

    ac -- cedi - te ad e -- um et il -- lumi - na - - - - - mi -- ni,

    ac -- cedi - te ad e -- um et il -- lumi - na - - mi -- ni, et il -- lumi - na - - - mi -- ni,

    et fa -- cies _ ve -- stræ non con -- fun -- den -- tur,

    et fa -- cies _ ve -- stræ non con -- fun -- den -- tur,

    non con -- fun -- den - tur, non con -- fun -- den -- tur,

    et fa -- cies _ ve -- stræ et fa -- cies _ ve -- stræ non con -- fun -- den -- tur,

    non con -- fun -- den -- tur,

    et fa -- cies _ ve -- stræ non con -- fun -- den -- tur,

    non con -- fun -- den -- tur, non con -- fun -- den -- tur, non con -- fun -- den - tur,

    non con -- fun -- den -- tur, non con -- fun -- den -- tur, non con -- fun -- den -- tur.

}

IItenoren = \relative do' {

    \autoBeamOff

    r4 sol4. la8 la la
    si4. do8 re2
    r r4 re

    %4
    mi la, si2
    dod4 re r2\mbreak
    r r4 do?4~

    %7
    do8 si si si la4. la8
    la2 r
    R1

    %10
    r2 r4 do4~
    do8 si si si la4. la8
    sol4 re' mi la,\mbreak

    %13
    si2 dod4 re
    R1
    r4 re mi do?

    %16
    la re2 dod4
    re1
    R1*5

    %23
    si4 si si si8 si
    si sol la si\mbreak do4. do8
    si2 r

    %26
    mi4 mi mi mi8 mi
    red si dod red mi2~
    mi4 re?8 re do?2

    %29
    si4 re8 re\mbreak re4 re8 re
    re si do re mi4 re8 re
    do2 si

    %32
    r4 si re4. do8
    si4 r si re~
    re8 do si4 sol si~

    %35
    si8 la sol4 sol si4~
    si8 sol do4 si2
    r4 la sold8 sold sold sold

    %38
    la4 la si8 do re si
    do[re16 mi la,8 si16 do]\mbreak sold8[la16 si mi,8 fad16 sold]
    la8[si16 do fa,?8 sol?16 la] sol4 mi

    %41
    fa2 sol
    do, r
    R1*4

    %47
    r4 la' sold8 sold sold sold\mbreak
    la2 si
    R1

    %50
    r4 do si8 si si si
    do2 re
    r2 r4 la

    %53
    fad8 fad fad fad sold2\mbreak
    la si8 do re si
    do[re16 mi la,8 si16 do] si8[do16 re sol,8 la16 si]

    %56
    la8[si16 do fa,8 sol16 la] sol4 la
    si do\mbreak re4. do16 [si]
    la[sol fa mi] fa[mi fa re] la'4. la8

    %59
    re,2 r
    r4 re' do4. do16 do
    si4 si8 si do4 la\mbreak

    %62
    sol sol r2
    r r4 r8 re'
    mi4 do re si8 si

    %65
    do4 la si sol
    R1
    r2 r4 r8 re'\mbreak

    %68
    mi4 do re si8 re
    do4. do16 do si4 si8 si
    do4 la sol sol

    %71
    R1
    r8 re' mi4 do re\mbreak
    si8 si do4 la si

    %74
    sol8 sol la4 fad sol
    mi2 r4 mi'
    do4. do16 do si4 si8 si

    %77
    re4 la\mbreak sol sol
    r2 r4 r8 mi'
    fa4 re mi do

    %80
    r4 r8 re mi4 do
    re2. re,4
    r re' mi2

    %83
    do re\mbreak
    si4 r r si
    do2 la

    %86
    si sol4 r
    r mi la2
    fad2 sol~

    %89
    sol fad?
    sol\breve

}

IItestoII = \lyricmode {

    Ex -- qui -- si -- vi Do -- minum _

    et ex -- au -- di -- vit me, ex -- qui -- si -- vi Do -- minum _

     ex -- qui -- si -- vi Do -- minum _ et ex -- au -- di -- vit me,

    et ex -- au -- di - vit me,

    et ex o -- mnibus _ tribu - lati - o -- ni -- bus,

    et ex o -- mnibus _ tribu - lati - o -- nibus _ me -- is, et ex o -- mnibus _

    tribu - lati - o -- nibus _ me -- is,

    e -- ri -- puit, _ e -- ri -- puit, _  e -- ri -- puit, _  e -- ri -- puit _ me.

    Ac -- cedi - te ad e -- um et il -- lumi - na - - - - - mi -- ni,

    ac -- cedi - te ad e -- um, ac -- cedi - te ad e -- um,

    ac -- cedi - te ad e -- um et il -- lumi - na - - - - - - - - - - - mi -- ni,

    et fa -- cies _ ve -- stræ non con -- fun -- den -- tur,

    non con -- fun -- den -- tur,

    non con -- fun -- den -- tur, non con -- fun -- den -- tur,

    et fa -- cies _ ve -- stræ non con -- fun -- den -- tur,

    non con -- fun -- den -- tur, non con -- fun -- den -- tur,   %%OOKK bar 74

    non con -- fun -- den -- tur,

    et fa -- cies _ ve -- stræ  non con -- fun -- den -- tur,

    non con -- fun -- den -- tur, non con -- fun -- den -- tur,  %% 81 OOKK

    non con -- fun -- den -- tur, non con -- fun -- den -- tur, non con -- fun -- den - tur.

}

IIbasson = \relative do {

    \autoBeamOff

    R1
    r2 r4 re~
    re8 do do do si4. si8

    %4
    la2 r4 sol'~
    sol8 fa fa fa\mbreak mi4. mi8
    re4 re mi la,

    %7
    si dod re2
    r4 la' si mi,
    fad2 sold4 la

    %10
    re, mi la,2
    si\mbreak dod4 re
    R1

    %13
    r4 sol la re,
    mi2 fad4 sol
    r si do do,\mbreak

    %16
    re2 la'
    re,1
    R

    %19
    sol4 sol sol sol8 sol
    sol8 mi fa sol la2~
    la4 sol8 sol fa2

    %22
    mi1
    R
    mi4 mi mi mi8 mi

    %25
    red8 si dod red\mbreak mi4 re?8 re
    do?1
    si

    %28
    R
    si4 si\mbreak si si8 si
    si8 sol la si do4 si8 si

    %31
    la2 (si)
    si si4 sol'~
    sol8 la si4\mbreak sol2

    %34
    sol,4 mi'4. fa8 sol4
    mi2 r4 mi,
    do'4. re8 mi2

    %37
    la, r
    R1*4
    r4 do si8 si si si

    %43
    do4 do sol'8 la si sol
    la8[si16 do fa,8 sol16 la] \mbreak re,8[mi16 fa sol8 la16 si]
    mi,8[fa16 sol do,8 re16 mi] fa8[sol16 la re,8 mi16 fa]

    %46
    mi4 la, mi'4. mi8
    la,2 r\mbreak
    la'8 si do la sol8[la16 si mi,8 fa16 sol]

    %49
    re2 la'8[si16 do fa,8 sol16 la]
    sol[fa mi re] mi[re mi do] sol'4. sol8
    do,2 r\mbreak

    %52
    r4 mi dod8 dod dod dod
    re2 (mi)\mbreak
    la, r

    %55
    la'8 si do la sol[la16 si mi,8 fa16 sol]
    fa8[sol16 la re,8 mi16 fa]\mbreak mi8[fa16 sol fa8 sol16 la]
    sol4. sol8 re2

    %58
    R1
    r4 re do4. do16 do\mbreak
    si4 si8 si do4 la

    %61
    sol4 sol r2
    r4 sol' fa4. fa16 fa
    mi4 mi8 mi fa4 re

    %64
    do4 do r4 r8 sol'
    la4 fa sol mi
    r8 mi fa4\mbreak re mi

    %67
    do4 r8 do re4 si
    la2 sol
    r2 r4 sol'

    %70
    fa4. fa16 fa mi2
    re r4 r8 la'
    si4 sol la fad8 fad

    %73
    sol4 mi fa re8 re
    mi4 do re si8 si
    do4 la\mbreak mi mi

    %76
    r4 la' sol4. sol16 sol\mbreak
    fad4 fad8 fad sol4 mi
    fa?4 re8 re mi4 do

    %79
    re si r4 r8 do
    re4 si do la8 la\mbreak
    si4 sol re2

    %82
    sol r4 sol'
    la2 fa
    sol4 mi r2

    %85
    r4 mi fa2
    re mi4 do
    r2 r4 la\mbreak

    %88
    si2 sol
    re1
    sol\breve

}

IItestoIII = \lyricmode {

    Ex -- qui -- si -- vi Do -- minum, _  ex -- qui -- si -- vi Do -- minum _

    et ex -- au -- di -- vit me, et ex -- au -- di -- vit me, et ex -- au -- di -- vit me,

    et ex -- au -- di -- vit me, et ex -- au -- di -- vit me,

    et ex o -- mnibus _ tribu - lati - o -- nibus _ me -- is,

    et ex o -- mnibus _ tribu - lati - o -- nibus _ me -- is,

    et ex o -- mnibus _ tribu - lati - o -- nibus _ me -- is

    e -- ri -- puit _ me, e -- ri -- puit _ me, e -- ri -- puit _ me.

    Ac -- cedi - te ad e -- um et il -- lumi - na - - - - - - mi -- ni,

    et il -- lumi - na - - - - - mi -- ni,

    ac -- cedi - te ad e -- um et il -- lumi - na - - - mi -- ni,

    et fa -- cies _ ve -- stræ non con -- fun -- den -- tur,

    et fa -- cies _ ve -- stræ non con -- fun -- den -- tur,

    non con -- fun -- den -- tur, non con -- fun -- den -- tur, non con -- fun -- den -- tur,

    et fa -- cies _ ve -- stræ non con -- fun -- den -- tur,

    non con -- fun -- den -- tur, non con -- fun -- den -- tur, non con -- fun -- den -- tur,

    et fa -- cies _ ve -- stræ non con -- fun -- den -- tur,

    non con -- fun -- den -- tur, non con -- fun -- den -- tur, non con -- fun -- den -- tur,

    non con -- fun -- den -- tur, non con -- fun -- den -- tur, non con -- fun -- den -- tur.

}

IIbcn = \relative do {

    \clef tenor r4 sol'4. la8 la la
    si4. do8 re4\clef bass re,~
    re8 do do do si2

    %4
    la sol4 sol'~
    sol8 fa fa fa\mbreak mi2
    re4 re mi la,

    %7
    si dod re2
    la4 la' si mi,
    fad2 sold4 la

    %10
    re, mi la,2
    si\mbreak dod4 re
    sol \clef tenor re' mi la,

    %13
    si\clef bass sol la re,
    mi2 fad4 sol
    do si do do,\mbreak

    %16
    re2 la'
    re,1
    sol

    %19
    sol2 sol
    sol8 mi fa sol la2~
    la4 sol fa2

    %22
    mi la,
    si1
    mi2 mi

    %25
    red8 si dod red\mbreak mi4 re?
    do?1
    si

    %28
    si2 fad'
    si, si
    si8 sol la si do4 si

    %31
    la2 si
    si si4 sol'~
    sol8 la si4\mbreak sol2

    %34
    sol,4 mi'4. fa8 sol4
    mi2. mi,4
    do'~do8 re mi2

    %37
    la, mi
    la mi'
    la, mi'

    %40
    la,4 fa' sol mi\mbreak
    fa2 sol
    do, si8 si si si

    %43
    do2 sol'
    la4 fa re sol
    mi do fa re

    %46
    mi la, mi'2
    la, mi'
    la sol4 mi

    %49
    re2 la'4 fa8 la
    sol4 mi sol2
    do,\clef tenor re'

    %52
    mi4\clef bass mi, dod8 dod dod dod
    re2 mi\mbreak
    la, mi'

    %55
    la sol4 mi
    fa re mi fa
    sol2 re

    %58
    \clef tenor la'8 mi fa re la'2
    re,4\clef bass re do4. do8\mbreak
    si4 si do la

    %61
    sol\clef tenor sol' do la
    sol\clef bass sol fa4. fa8
    mi4 mi fa re

    %64
    do2 sol4 sol'
    la fa\mbreak sol mi~
    mi8 mi fa4 re mi

    %67
    do4. do8 re4 si
    la2 sol4\clef tenor sol'
    do4. do8 si4 \clef bass sol

    %70
    fa4. fa8\mbreak mi2
    re la4 la'
    si sol la fad8 fad

    %73
    sol4 mi fa re8 re
    mi4 do re si8 si
    do4 la\mbreak mi2

    %76
    la4 la' sol4. sol8
    fad4 fad8 fad sol4 mi
    fa?4 re8 re mi4 do

    %79
    re si mi do
    re si\mbreak do la8 la
    si4 sol re2

    %82
    sol sol'
    la fa
    sol4 mi mi2~

    %85
    mi4 mi fa2
    re mi4 do\mbreak
    do2 la

    %88
    si sol
    re1
    sol\breve

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6>2 <_+>4 <_+>
    <6>2 <[5+]>4 <[6+]>
    <4> <3> s2
    s8 <[5+]> <6>4 <5> <[6+]>
    <4> <3> s2
    <7>8 <6> s4 s2
    <4>1
    <6>
    <_+>4 <[_+]> s2
    <6> s4 <_+>
    s <6> <[6+]> <_+>
    s <6> <_+> <_+>
    s1
    s4 <6> s2
    s <4>4 <[3+]>
    s1*3
    <6>1
    <6>4 <6> <7> <6>
    <_+>2 <_+>
    <[3+]>4<4> <[3+]>2
    s <6>
    <6>8 <[_+]> s4 s <6>
    <7>2 <6>
    <[3+]> <4>
    <4>4 <3> <4> <[3+]>
    s1
    <6>2 s4 <[5+]>8 <6>
    <[6+]>4 <5> <_+>2
    <_+> <_->
    s1*3
    <5>4 <6> <4> <[3+]>
    s2 <_+>
    s <_+>
    s <_+>
    s1*2
    s2 <6>
    s1*3
    <_+>2 <_+>
    s <_+>
    s1
    s2 s4 s8 <6>
    s4 <6> s2
    s <_+>
    <_+>4 <_+> <6>2
    <_+> <_+>
    s <_+>
    s1
    s2 <6>
    s1
    <_+>8 <[6+]> <6>4 <4> <[3+]>
    s1
    <6>2 s4 <[6+]>
    s1*2
    <6>2 s4 <5>8 <6>
    s2 s4 <6>
    s4 <6> s <6>
    s2 <6>
    <6> <_+>4 <6>
    <7> <[6+]> s2
    s4 <6> <6>2
    s <5>4 <[6+]>
    s1
    s4 <6> s <6>
    s <6> s <6>
    s <6> <_+>2
    s <4>4 <[3+]>
    s1
    <6>2 s4 <6> s1
    s2 s4 <6>
    <_+> <6> s2
    s <4>4 <[3+]>
    s2 <6>
    s <6>
    s1
    <6>
    <6>
    s1
    <7>
    <4>2 <[3+]>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 60
    s1*89
    s\breve
    \bar "|."

}

IIvlI = {
    \notypeset
    <<\IIvlIn \forma>>

}

IIsoprano = {
    \new Voice = "exquisivi1"
    <<\IIsopranon \forma>>
}

IItenore = {
    \new Voice = "exquisivi2"
    <<\IItenoren \forma>>
}

IIbasso = {
    \clef bass
    \new Voice = "exquisivi3"
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



IIItbIn = \relative do'' {

    sol\breve sib1
    re sib re
    fa re fa

    %4
    la fa2 sol la sol
    fa mi re do sib la
    sol la sib la la1\mbreak

    %7
    sol1. fad4 mi? fad1
    sol\breve r1
    R\breve.*3

    %12
    re'\breve mi1
    fa re fa
    la mi sol

    %15
    fa mi\breve
    re\breve.~
    re

    %18
    r1 sol, sib
    re sib re\mbreak
    fa re2 mi fa mi

    %21
    re do sib la sol la
    sib sol la1. la2
    sib\breve r1

    %24
    R\breve.*4
    r1 sol sib
    re sib re

    %30
    fa1. mi2 re1
    do\breve re1
    mib1. re2 do1\mbreak

    %33
    sib\breve do1
    re1. do2 sib1
    la1. sol2 fa1

    %36
    sol1. fad2 sol la
    sib do re sib do la
    sib sol la1. sol2

    %39
    sol la sib do re mi
    fa mi fa re mib do\mbreak
    re sib do1. sib2

    %42
    sib\breve.\fermata
    R\breve.*10
    R1

    %54
    sol'2. mi4
    mi1
    r2 mi~

    %57
    mi4 do do2
    si4 mi, mi'2~
    mi mi

    %60
    mi4 mi2 re8 mi
    fa2 mi~
    mi4 re re2~

    %63
    re do4 si\mbreak
    do la do2~
    do sib?4 la

    %66
    sib sol sib2~
    sib la
    sol1

    %69
    r2 sol'~
    sol4 mi mi2
    do1~

    %72
    do2 sib4 la
    sol2 fa
    do'2. sib4

    %75
    la2 fa'~
    fa4 do2 re4
    re sib re2~

    %78
    re4 do sib2
    la re
    re1\fermata

    %81 %inizia sinfonia
    R1
    re8 dod re sol, re'4 mi
    fa4. re8 mib4. do8

    %84
    re4. sib8 do4. la8
    sib4. sol8 la4. sib8
    la4. sib8 la sib la sib

    %87
    do4. re8 do4. re8
    do re do sib la2
    sol1

    %90
    R1*3
    re'8 dod re sol, re'4 mi
    fa2. sol4

    %95
    la4. fa8 sol4. mi8
    fa4. re8 mib4. do8
    re4. sib8 do4. la8

    %98
    sib4 re2 do4~
    do sib la2
    sol4 re'\mbreak do re~

    %101
    re8 sib do4. la8 sib4~
    sib8 sol la4. fa8 re'4
    mib re fa sol

    %104
    fa1
    fa2 r4 re
    mi fad sol2

    %107
    fad1\fermata
    R1*25
    re2. si4\mbreak

    %134
    si?1
    mi2. do4
    do2 mi~

    %137
    mi4 mi re2
    mi1~
    mi2 mi

    %140
    mi1
    r4 fa2 do4
    re2 r4 sol~

    %143
    sol fa re2
    mi2. mi4
    re2 r4 re~

    %146
    re sol, sol2\mbreak
    R1
    r4 re'2 la4

    %149
    si2~si8 sol la si
    do2~do8 si do re
    mib2~mib8 re do si

    %152
    do2. re4
    mib1~
    mib2 re4 do

    %155
    re2. re4
   re\longa

}

IIItbIIn = \relative do'' {

    R\breve.
    sol\breve sib1
    re la re

    %4
    fa re fa
    la2 sol fa mi re do
    sib do re sib do re

    %7
    sib do la1. la2\mbreak
    sol\breve r1
    R\breve.

    %10
    do\breve re1
    mi do mi
    sol re sol

    %13
    fa1. mi2 re1
    do2 sib do la sib do
    re1 re1. dod2

    %16
    re\breve r1
    R\breve.*2\mbreak
    r1 sol, sib

    %20
    re sib re
    fa2 mi re do sib la
    sol1 do\breve

    %23
    sib1. re2 re mi
    fa1. mi2 re1
    do fa, la

    %26
    do sol do\mbreak
    mib1. re2 do1
    sib1. la2 sol1

    %29
    re\breve r1
    re'1. do2 sib1
    la1. sol2 fa1

    %32
    sol\breve r1
    R\breve.
    r1 sib re

    %35
    fa do fa\mbreak
    mib1. re2 do1
    re2 mi fa re mi fad

    %38
    sol1. fad4 mi fad1
    sol sol,2 la sib sol
    la sol la fa sol la\mbreak

    %41
    sib1. la4 sol la1
    sib\breve.\fermata
    R\breve.*10

    %53
    R1
    si2. do4
    do1

    %56
    sol2. la4
    la2 mi'~
    mi4 do do2

    %59
    si\mbreak si
    la do~
    do4 si? la sol

    %62
    fa2. sol4
    la si do re
    mi do mi fad

    %65
    sol2 re~
    re4 sib re mi\mbreak
    fa mi re do

    %68
    si2 do~
    do si
    do1

    %71
    r2 sol'~
    sol4 mi mi2
    r do~

    %74
    do4 sol do2~
    do4 la la2
    r fa'~

    %77
    fa4 mi re2
    r\mbreak re~
    re la

    %80
    si1\fermata % OOKK
    sol8 fad sol re sol4 la
    sib2. la8 sol

    %83
    la re, re'4. si8 do4~
    do8 la sib?4. sol8 la4~
    la8 fa sol la\mbreak fad4. sol8

    %86
    fad4. sol8 fad sol fad sol
    la4. sib8 la4. sib8
    la sol sol2 fad4

    %89
    sol1
    R1*2\mbreak
    sol8 fad sol do, sol'4 la

    %93
    sib2. do4
    re4. do8 sib4 la8 sol
    do4 re4. sib8 do4~

    %96
    do8 la sib4. sol8 la4~
    la8 fa\mbreak sol4. mi8 la4
    sol re la' sol

    %99
    re'1
    re4 sol4. mi8 fa4~
    fa8 re mib4. do8 re4~

    %102
    re8 sib do4. la8 sib4~
    sib sib\mbreak do8 re mib4~
    mib re4 do2

    %105
    sib la
    do4 do re2
    re1\fermata

    %108
    R1*25
    sib2. re4
    re1

    %135
    do2. mi4\mbreak
    mi1
    r2 re~

    %138
    re4 re do2
    si si
    la4 mi'2 do4

    %141
    la1
    R1*2
    r2 r4 la'~

    %145
    la4 fad re2
    r4 re2 sib4
    la2 sib\mbreak

    %148
    la1
    sol4 sol'2 re4
    mib2~mib8 sol, la si

    %151
    do2~do8 si do re
    mib2 mib8 re do si
    do1~

    %154
    do2 si4 la\mbreak
    si2. si4
    si\longa

}

IIItbIIIn = \relative do' {

    R\breve.*8
    re,\breve fa1
    la fa la

    %11
    do sol do
    sib1. la2 sol1
    la\breve re,1\mbreak

    %14
    mi la re,
    re la'\breve
    la1 re, fa

    %17
    la fa la
    sib\breve.
    sib

    %20
    sib\breve sib1
    sib\breve mib,1~
    mib fa\breve

    %23
    sib fa1\mbreak
    fa re2 mi fa sol
    la1. sol2 fa1

    %26
    sol\breve.
    r1 do, mib
    sol mib sol

    %29
    sib1. la2 sol1\mbreak
    fa re fa
    la fa la

    %32
    do1. sib2 la1
    sol\breve la1
    sib fa sol

    %35
    do, fa la
    do sol do\mbreak
    sib re, la'

    %38
    re, re\breve
    re\breve r1
    re'1. la2 do1

    %41
    fa, fa\breve
    fa\breve.\fermata
    R\breve.*10

    %53
    R1
    re2. do4
    do2 sol'~

    %56
    sol4 mi mi2
    mi1~
    mi

    %59
    mi
    mi2 la~
    la mi

    %62
    la2. sol8 fa
    mi1
    la

    %65
    re,
    sol
    do,2 re~

    %68
    re do
    sol'2. fa4
    mi re do2\mbreak

    %71
    sol' do,
    sol'1~
    sol2 la

    %74
    sol1
    fa2 do'~
    do4 la2 sib4

    %77
    sib1~
    sib2 la4 sol
    la2 la

    %80
    sol1\fermata
    R1*8
    sol8 fad sol do,\mbreak sol'4 la

    %90
    sib4. sol8 la4. fa?8
    sol4. mi8 fa4. re8
    mib2. re8 do

    %93
    sol'2. sol4\mbreak
    la2 fa4 do'~
    do8 la sib4. sol8 la4~

    %96
    la8 fa sol4. mib8 fa4~
    fa8 re mib4. do8 re4~
    re sol8 fa mib fa sol la\mbreak

    %99
    fad4 sol2 fad4
    sol sib do4. la8
    sib4. sol8 la4. fa8

    %102
    sol4. mib8 fa4. sib8
    sol la sib sol la4 sol\mbreak
    la sib2 la4

    %105
    sib2 fa
    sol4 la sib2
    la1\fermopz

    %108
    R1*25
    fa2. sol4
    sol1

    %135
    sol2. la4
    la1
    do2 si4 la\mbreak

    %138
    sold2 la
    si mi,
    mi1

    %141
    r4 do'2 la4
    fa sib2 sol4
    mi2 la~

    %144
    la la
    la4 re,2 la'4
    sib2 r

    %147
    r4 re2 re,4\mbreak
    re2 r4 re'~
    re re, re2

    %150
    r sol~
    sol4 sol mib2
    r sol~

    %153
    sol4 sol do,2
    R1
    sol'2. sol4

    %156
    sol\longa

}

IIItbIVn = \relative do {

    R\breve.*7
    sol\breve sib1
    re sib re

    %10
    fa1. mi2 re1\mbreak
    do1. sib2 la1
    sol'1. fa2 mi1

    %13
    re1. do2 sib1
    la\breve sol1~
    sol la\breve\mbreak

    %16
    re,\breve.~
    re
    R\breve.*5

    %23
    r1 sol sib
    re sib re
    fa1. mi2 re1

    %26
    do\breve.
    do,
    R

    %29
    sol'\breve sib1\mbreak
    re sib re
    fa1. mi2 re1

    %32
    do\breve re1
    mib1. re2 do1
    sib1. la2 sol1

    %35
    fa1. mi2 re1
    do do' mib\mbreak
    sol sib, la

    %38
    sol re'\breve
    sol, sol'1
    re1. re2 do1

    %41
    sib fa'\breve
    sib,\breve.\fermata
    R\breve.*10

    %53
    R1
    sol2. do,4
    do1

    %56
    do'2. la4
    la1
    mi~

    %59
    mi2 mi
    la1~
    la2 la

    %62
    la1
    la~
    la2 la

    %65
    sol1~
    sol
    fa

    %68
    sol~
    sol
    do,~

    %71
    do
    do'
    do~

    %74
    do
    fa,
    fa'2. sib,4

    %77
    sib2. do4
    re2 re~
    re re,

    %80
    sol1\fermata
    R1*7
    do8 si do sol do4 re\mbreak

    %89
    mib2. re8 do
    re4 mib do re
    si do la si

    %92
    do2. si?8 la
    sol1\mbreak
    re'8 dod re la re4 mi

    %95
    fa re mib do
    re sib do la
    sib sol la fa\mbreak

    %98
    sol sib do mib
    re1
    sol,4 sol' la fa

    %101
    sol mib fa re
    mib do re sib\mbreak
    mib sol fa mib

    %104
    fa1
    sib,2 re
    do4 la sol2

    %107
    re'1\fermata
    R1*25
    sib2. sol4

    %134
    sol1
    do2. la4
    la1

    %137
    fa'2. fa4
    mi2 la,
    mi'1

    %140
    la,~
    la
    sib

    %143
    la~
    la
    re,

    %146
    sol
    re'~
    re

    %149
    sol,\mbreak
    do~
    do2 do

    %152
    do1~
    do
    r2 sol'~

    %155
    sol sol,
    sol\longa

}

IIIbasson = \relative do {

    \autoBeamOff
    R\breve.*42
    sol\breve sib1
    re sib re

    %45
    fad re fad
    la sib sol
    fad la1. re,2

    %48
    re\breve r1
    r sol fad
    re fa? re

    %51
    si mib do
    la re1. sol,2
    sol1

    %54 OOKK
    r2 sol'~
    sol4 mi mi2~
    mi do'2~

    %57
    do4 la4 la2
    sold la2~
    la sold

    %60
    la1
    r2 do~
    do4 fa,4 fa2

    %63
    r la2~
    la4 mi mi2
    r sol2~

    %66
    sol4 re\mbreak re2
    r fa
    fa mib

    %69
    re1
    do2 sol'2~
    sol4 mi mi2

    %72
    R1
    mi2 fa~
    fa mi

    %75
    fa1
    R
    fa2 sol~

    %78
    sol fad4 mi
    fad2 fad
    sol1\fermata

    %81 ookk
    R1*27
    r2 re
    mi4 fad sol4. sol8

    %110
    fad1
    r4 la\mbreak sol fad
    sib2. la4

    %113
    sold2 la~
    la4 sol? fad2
    sol2. fa?4

    %116
    mi2 fad
    sol1
    r2 mib

    %119
    re4 do\mbreak sib4. sib8
    la1
    r4 re do si

    %122
    mib2. re4
    dod2 re~
    re4 do? si2

    %125
    do2. sib?4
    la2 sol\mbreak
    re' fa~

    %128
    fa4 mi re2
    sol2. fa4
    mi2 fa

    %131
    sib,1
    r2 fa'~
    fa4 re re2~

    %134
    re sol~
    sol4 mi mi2~
    mi\mbreak do'~

    %137
    do4 la la2
    si2 la~
    la sold

    %140
    la4 do2 la4
    fa la2 fa4
    re sol2 mi4

    %143
    dod2 re~
    re dod
    re4 la'2 fad4

    %146
    re sib'2 sol4
    fad2 sol~
    sol fad

    %149
    sol sol~
    sol4 sol mib2\mbreak
    r sol~

    %152
    sol4 sol do,2
    r sol'~
    sol4 sol sol,2

    %155
    R1
    R\longa

}

IIItesto = \lyricmode {

    Fi -- li mi, fi -- li mi,  fi -- li mi, fi -- li mi, Ab -- salon, _

    fi -- li mi,  fi -- li mi, fi -- li mi, Ab -- sa -- lon, Ab -- salon, _ Ab -- salon, _ fi - li mi,

    Ab -- salon, _ Ab -- salon, _ Ab -- salon, _ fi -- li fi -- li mi, Ab -- salon, _ fi - li mi, fi - - - - li mi.

    Quis mi -- hi tri -- buat, _ ut e -- go mo -- ri -- ar, mo -- ri -- ar, mo -- ri -- ar, pro te,

    quis mi -- hi tri -- buat, _ ut e -- go mo -- ri -- ar, mo -- ri -- ar, mo -- ri -- ar pro te,

    mo -- ri -- ar, mo -- ri -- ar pro te!

    Ab -- salon, _ Ab -- salon, _ Ab -- salon, _ fi - li mi, fi -- li mi,  fi -- li mi, fi -- li mi,

    Ab -- salon, _ fi -- li mi, fi -- li mi, Ab -- sa -- lon, Ab -- salon, _ Ab -- salon, _ Ab -- salon! _

}

IIIbcn = \relative do {

    sol\breve sol1
    sol\breve sol1
    re\breve re1

    %4
    re\breve re'1
    re\breve re,1
    sol\breve do1

    %7
    sol re'\breve
    sol,\breve sib1
    re sib re

    %10
    fa1. mi2 re1\mbreak
    do1. sib2 la1
    sol'1. fa2 mi1

    %13
    re1. do2 sib1
    la\breve sol1~
    sol la\breve

    %16
    re,\breve.
    re'\breve re1
    sol\breve.

    %19
    sol\breve sib1
    sib\breve sib1
    sib\breve mib,1~

    %22
    mib fa\breve\mbreak
    sib,1 sol sib
    re sib re

    %25
    fa1. mi2 re1
    do\breve.
    do\breve mib1

    %28
    sol mib sol
    sol,\breve  sib1
    re sib re

    %31
    fa1. mi2 re1
    do\breve re1\mbreak
    mib1. re2 do1

    %34
    sib1. la2 sol1
    fa1. mi2 re1
    do do' mib

    %37
    sol sib, la
    sol re'\breve
    sol, sol1

    %40
    re'1. re2 do1
    sib fa'\breve
    sib,\breve.\fermata

    %43  OOKK
    sol\breve.
    sol\breve sol1
    re\breve.

    %46
    re'1 sol,\breve
    re'1 la1. re2
    re\breve r1

    %49
    sol,\breve re'1
    re\breve re1
    sol, do la\mbreak

    %52
    fa1 re1. sol2 % OOKK 4/4
    sol1
    sol2. do,4

    %55
    do1
    do'2. la4
    la1

    %58
    mi~
    mi
    la~

    %61
    la2 la
    la1
    la~

    %64
    la2 la\mbreak
    sol1~
    sol

    %67
    fa
    sol~
    sol

    %70
    do,~
    do
    do'

    %73
    do~
    do
    fa,

    %76
    fa'2. sib,4
    sib2~sib4 do
    re1~

    %79
    re
    sol,\fermata % OOKK
    \clef tenor\key fa\major sol'8 fad sol re\mbreak sol4 la

    %82
    \clef bass \key fa\major sol2. fa?8 mi
    re2 sol4 la
    fad sol mi fa?

    %85
    re mib re4. sol,8
    re'4. sol,8 re'4. sol8
    fa4. sib,8 fa'4. sib,8\mbreak

    %88
    do si do sol do4 re
    mib2. re8 do
    re4 mib do re

    %91
    si do la si
    do2. si?8 la
    sol1\mbreak

    %94
    re'8 dod re la re4 mi
    fa re mib do
    re sib do la

    %97
    sib sol la fa
    sol sib do mib
    re1

    %100
    sol,4 sol' la fa\mbreak
    sol mib fa re
    mib do re sib

    %103
    mib sol fa mib
    fa1
    sib,2 re

    %106
    do4 la sol2
    re'1\fermata  % OOKK
    re

    %109
    do4 la sol2
    re'1
    re

    %112
    sol,4 sol'2 fa4
    mi re dod2
    re2. do?4

    %115
    si2 do2~
    do4 si?4 la2\mbreak
    sol1

    %118
    mib'
    re4 do sib2
    la1

    %121
    sib2 la4 sol
    do2. sib4
    la sol fad2

    %124
    sol2. fa?4
    mi re do2\mbreak
    fa2 sol

    %127
    re1
    re'2. do4
    si2 do~

    %130
    do fa,
    sib1~
    sib

    %133
    sib2. sol4
    sol1
    do2. la4

    %136
    la1
    fa'
    mi2 la,

    %139
    mi'1\mbreak
    la,~
    la

    %142
    sib2~sib
    la1~
    la

    %145
    re,
    sol
    re~

    %148
    re
    sol
    do~

    %151
    do2 do
    do1~
    do

    %154
    sol2 sol~
    sol sol
    sol\longa

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s\breve.*5
    s\breve <6>1
    s <_+> s
    s\breve.*7
    s1 <[4]> s2 <_+>
    <_->1 s s
    s\breve.*9
    <_->\breve.
    <_->
    s\breve.*4
    <_->\breve.
    s\breve.*5
    s1 <_+> s
    s\breve.
    s1 s <_->
    s\breve.*4
    <_+>\breve.
    <_+>
    <_+>1 <_+> s
    <_+> s s
    s s <_+>
    <_-> s s
    <_+> <_-> s
    s <_+> s
    <_+>1   %%% 4/4
    <_+>
    s1*3
    <[3+]>2 <4>
    s <[3+]>
    <_->1
    <6>2 <5>
    <6 3> <6 4>
    <4> <3>
    s1
    <4>2 <3>
    s1
    <4>2 <3>
    <[3+]> <4>
    s <[3+]>
    s1*3
    <3>2 <4>
    s <3>
    s1
    s
    s2 <6>
    <6 4>1
    <_+>
    <[_+]>
    s
    s
    s2 <[6-]>
    <6> <6>
    <6> <_+>
    <_+> <_+>
    s1
    <6>8 <6> s4 s <_+>
    s1
    <6>2 <6>
    <6> <6>
    <_-> s
    s1
    s4 s8 <6> s4 <6>
    s <6> s <6>
    s <6> <_-> <6>
    s <6> s <6>
    s2 <6>4 <6>
    <[3+]>4 <4>2 <[3+]>4
    s2 s4 <6>
    s <6> s <6>
    s <6> s s
    s1
    <3>4 <4>2 <3>4
    s1
    s4 <[6+]> s2
    <_+>1
    <_+>
    s4 <[6+]> s2
    <_+>1
    <_+>
    s
    <_+>2 <6>
    <_+> s
    <6>1
    s2 <[6+]>
    s1*2
    s4 <6> <7> <6>
    <_+>1
    s
    <_->
    <_+>2 <6>
    <_+> s
    <6>1
    s1*3
    <6>1
    s1*3
    s2. <_+>4
    s1*3
    <7>2 <6>
    <_+>1
    <4>2 <[3+]>
    <_->1
    <6>
    <5>2 <6>
    <[3+]>2 <4>
    s <[3+]>
    <_+>1
    s
    <[3+]>2 <4>
    s <[3+]>
    <_+>1
    <_->
    s1
    <_->
    s
    <[6-]>2 <_+>

}


forma = {

    \time 3/1
    \key fa\major
    \tempo  1 = 120
    s\breve.*52\break
    \time 4/4
    \tempo 2 = 50
    s1*28\break
    \mark\markup\huge\bold"Sinfonia"
    \tempo 2 = 70
    s1*27\break
    \tempo 2 = 50
    s1*48
     \set Score.measureLength = #(ly:make-moment 16 4)  s\longa
    \bar "|."

}

IIItbI = {
    \notypeset
    <<\IIItbIn \forma>>

}

IIItbII = {
    <<\IIItbIIn \forma>>

}

IIItbIII = {
    \clef tenor
    <<\IIItbIIIn \forma>>

}

IIItbIV = {
    <<\IIItbIVn \forma>>

}

IIIbasso = {
    \clef bass
    \new Voice = "fili"
    <<\IIIbasson \forma>>
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



IVtbIn = \relative do'' {

    do2 fa~
    fa4 fa mi2
    R1*3

    %6
    r4 do4. do8 re4
    do1
    do~

    %9
    do
    R1*2
    do4 do do re

    %13
    mi mi mi fa
    sol4. sol8 fa sol mi fa
    re4 mi\mbreak fa sol

    %16
    la4. la8 sol la fa sol
    mi4 do8 re mi re mi fa
    sol2 do,

    %19
    sol4 sol sol la
    si si si do
    re mi re2

    %22
    sol, r
    do4 do do sib\mbreak
    la la la sol

    %25
    fa do' re mi
    fa fa fa mi
    re re re do

    %28
    sib sol8 la sib la sib do
    re4 sib8 do re mi fa re
    mi do re mi fa mi fa re\mbreak

    %31
    sol la fa2 mi4
    fa1\fermata
    R1*35

    %68
    fa1
    mi4. mi8 fad4 sol~
    sol mi fa4. do8

    %71
    re2 re16 do re mi fa4~
    fa mib8 re do2\mbreak
    re1

    %74
    R
    re4 re mi8 fad sol mi
    fad2 sol

    %77
    do,4 sib la4. la8
    sol4 sol'2 fa4
    mi4. mi8 re2

    %80
    r fa
    fa4. fa8 fa4 sol~
    sol fa4 mib4. mib8

    %83
    re4 re16 mi fa re\mbreak sol2~
    sol4 fa8 mi fa4 re
    mi16 fa sol mi la4. sol8 mi4

    %86
    fad1
    R
    r2 sol4 sol

    %89
    fa8 sol fa mi re2
    mi r
    fa4 fa sol4. sol8

    %92
    do,2 re8 mi fa re
    mi2 mi\mbreak
    re8 do si do re2~

    %95
    re dod
    re1
    r2 fa4 fa

    %98
    sol la sol4. do,8
    do1\fermata
    fa2 mi4 re  %%% sinfonia

    %101
    do sib la do
    sib la la2~
    la sol

    %104
    la r4 do
    re mi fa2~
    fa mi

    %107
    re1\mbreak
    do~
    do

    %110
    R1*6
    do4 do do do
    la2 re

    %118
    do8 re do sib la sib la sol
    fa4 sol la fa
    sib2. sol4

    %121
    la2 sib~
    sib4 la la sol8 fa
    sol1

    %124
    do,2 fa~
    fa4 mi8 re mi2\mbreak
    fa2~fa8 mi fa sol

    %127
    la2 r
    R1
    fa'4 fa fa fa

    %130
    re2 sol
    fa8 sol fa mi re mi fa re
    mi2 fa~

    %133
    fa mi
    fa1
    R1*3

    %138
    fa2 fa4 re
    la'4. la8 sol4 sol~
    sol mi\mbreak fa8 mi fa re

    %141
    mi4 re8 do re2
    do1
    R1*2

    %145
    do2 do4 la
    re4. re8 do4 la~
    la do sol sol8 la

    %148
    sib2~sib8 la la sol
    la2 r
    r fa'

    %151
    fa4 re sol4. sol8
    fa4 re2 fa4\mbreak
    sib, sib8 do re2~

    %154
    re dod4 si
    dod2 r4 fa
    fa fa mi2

    %157
    fa4 fa, fa fa
    mi1
    re

    %160
    R
    r2 r4 sib'
    sib sib la2

    %163
    sib fa'8 re16 mi fa sol la fa\mbreak
    sol4 fa mi8 do16 re mi fa sol mi
    fa4 mi re8 sib16 do re mi fa re

    %166
    mib4 re do2
    sib4 re re re
    do1

    %169
    si4. do8 re2
    r2 r4 do
    do do\mbreak si2

    %172
    do r4 re
    re re do2
    re1

    %175
    r2 fad8 re16 mi fad sol la fad
    sol4 mib re2
    do si8 sol16 la si do re si

    %178
    do4 la sol2\mbreak
    fa mi'8 do16 re mi fa sol mi
    fa4 re do do

    %181
    fa8 re16 mi fa sol la fa sol4 fa
    mi8 do16 re mi fa sol mi fa2~
    fa4 mi re2

    %184
    do1\mbreak
    R
    do

    %187
    do2 do
    do1
    do

    %190
    r2 si8 sol16 la si do re si
    do4 sib? la4. la8
    fa' re16 mi fa sol la fa

    %193
    sol4 sol fa2~
    fa4 do\mbreak  re1
    r2 fa2

    %196
    fa4 re sol2~
    sol fad
    sol1

    %199
    r2 re8 sol,16 la si do re si
    do4 sib? la2
    fa fa'8 re16 mi fa sol la fa\mbreak

    %202
    sol4 la sol2
    fa do8 la16 sib do re mib do
    re4 sib la8 fa16 sol la sib do la

    %205
    sib2 re
    fa1
    fa\longa

}

IVtbIIn = \relative do'' {

    R1
    fa,2 do'~
    do4 do la2

    %4
    R1*2
    r2 r4 sib~
    sib8 sib la4 sol2

    %8
    la1
    fa4 fa fa sol
    la la\mbreak la sib

    %11
    do4. re8 sib do la sib
    sol4. la8 sol la fa sol
    mi4 sol8 la sib sol do la

    %14
    re4. sib8 do la sib do\mbreak
    re4 sib re mi
    fa4. fa8 mi fa re mi

    %17
    do4 la8 si do si do re
    mi4 do8 re mi re mi fa
    sol4. sol8\mbreak fa sol mi fa

    %20
    re4. mi8 re mi do re
    si4 do2 si4
    do1

    %23
    R
    fa,4 fa fa sol
    la la sib do

    %26
    re4. do16 sib\mbreak la2
    fa'4 fa fa mi
    re sib8 do re do re mi

    %29
    fa4 re8 mi fa sol la fa
    sol mi fa sol la [sol la sol16 fa]\mbreak
    mi4 fa sol4. do,8

    %32
    do1\fermata  %% fine sinfonia OOKK
    R1*35
    re1

    %69
    dod4. dod8 re4 re~
    re do? do4. fa8
    fa1\mbreak

    %72
    r4 re16 do re mi fa2
    fa1
    R1*2

    %76
    r2 re4 re
    mi8 fad sol mi fad2
    sol mi4 re

    %79
    dod4. dod8 re2
    r re
    do?4. do8 sib2\mbreak

    %82
    do4 re mib do
    fa2 r
    r4 la,16 sib do la re2~

    %85
    re dod
    re1
    r2 do?4 do

    %88
    sib8 la sol la sib2
    la r
    sol4 sol sol8 fa sol la\mbreak

    %91
    sib2. la8 sol
    la2 la'4 la
    sol8 fa mi fa sol2

    %94
    sol fa8 mi re mi
    fa2 mi
    r re4 re

    %97
    mi2 fa~
    fa mi
    fa1\fermata\mbreak

    %100 OOKK Sinfonia
    la,1~
    la2 la\mbreak
    sol do,

    %103
    re1
    mi2 la
    sib do4. re8

    %106
    si2 do~
    do si?
    do1

    %109
    R1*2
    do4 do do do
    la2 re

    %113
    do8 re do sib la sib la sol
    fa4 sol la fa\mbreak
    sib8 la do sib la sol sib la

    %116
    sol4 fa sol2
    fa1
    R

    %119
    fa'4 fa fa fa
    re2 sol
    fa8 sol fa mi re mi fa re

    %122
    mi4 do fa2~
    fa mi\mbreak
    fa1

    %125
    R1*5
    sib,4 sib sib sib
    la2 re

    %132
    do8 re do sib la sol la sib
    do1
    do

    %135
    R1*51
    la'1
    la2 la

    %188
    sol1
    fa
    fad8 re16 mi fad sol la fad sol4 fa?

    %191
    mi mi do8 la16 sib do re mi? do\mbreak
    re8 sib16 do re mi fa re mib2~
    mib4 re do4. fa8

    %194
    fa1
    r2 re
    re2. re4

    %197
    do1
    si2 si8 sol16 la si la si do\mbreak
    re4 do si2

    %200
    sol r
    fa'8 re16 mi fa mi fa sol la4 fa
    mi fa2 mi4

    %203
    fa1
    r2 do8 la16 sib do re mib do\mbreak
    re2 sib

    %206
    re1
    do\longa

}

IVtbIIIn = \relative do' {

    R1*2
    do,2 fa~
    fa4 fa mi2

    %5
    R1
    r4 la4. la8 sol4~
    sol fa2 mi4

    %8
    fa fa fa sol
    la la la sib\mbreak
    do4. re8 do re sib do

    %11
    la4. sib8 sol la fa sol
    mi4. fa8 mi fa re mi
    do4 mi8 fa sol4 la

    %14
    sib4. do8\mbreak la sib sol la
    fa4 sol la sib
    do fa,2 sol4

    %17
    la1
    sol
    R1*2

    %21
    sol4 sol sol fa
    mi mi mi re
    do1

    %24
    do'4 do do sib
    la la la sol\mbreak
    fa4. sol8 la si do la

    %27
    sib4 la8 sol fa sol la4
    re,1~
    re2 la'

    %30
    sol fa4 do'~
    do sib8 la sol2
    la1\fermata

    %33
    R1*35
    la1
    la4. la8 la4 si~

    %70
    si do la4. la8
    sib?2 r4 re,16 mi fa sol
    la4 sib2 la4\mbreak

    %73
    sib1
    sol4 sol la8 si do la
    si2 do

    %76
    la4 la sib?4. la8
    sol2 r
    r sol4 sol

    %79
    la4. la8 re,2
    r2 r4 sib'\mbreak
    do4. do8 re4 mib~

    %82
    mib sib do4. do8
    fa,2 sib16 la sib do re4~
    re do8 sib la2

    %85
    r4 mi16 fa sol mi la2
    la la4 re,\mbreak
    mi8 fad sol mi fad2

    %88
    sol sol4 sol
    la8 si do la si2
    do r

    %91
    r sib4 sib
    la8 sib la sol fa2
    do'1  %%fine pagina

    %94 OOKK
    sib8 la sol la sib2
    la1
    R

    %97
    sol4 sol la2
    sol4 fa sol4. sol8
    la1\fermata

    %100 OOKK Sinfonia
    do,2 re4 mi
    fa do re2~
    re4 mi fa2~

    %103
    fa\mbreak mi4 re
    dod2 r4 mi
    fa sol la2

    %106
    re, r
    sol4 sol sol sol
    mi2 la

    %109
    sol8 la sol fa mi fa mi re
    do2 fa~
    fa4 mi8 re\mbreak mi2

    %112
    fa8 sol fa mi re mi fa re
    mi2 do
    re4 mi fa do

    %115
    re8 do re mi fa mi sol fa
    mi4 fa2 mi4
    fa2~fa8 mi fa sol\mbreak

    %118
    la2 fa
    R1*6
    do'4 do do do

    %126
    la2 re
    do8 re do sib la sib la sol
    fa2 sib~

    %129
    sib4 la8 sol la2
    sib sol
    do\mbreak sib4 la

    %132
    sol2 fa
    sol1
    fa

    %135
    R1*51
    fa'1
    fa2 do4 fa~

    %188
    fa mi8 re\mbreak mi2
    fa do8 la16 sib do re mi do
    re4 do si sol

    %191
    sol8 mi16 fa sol la sib? sol la4 sol
    fa sib2 do4~
    do sib2 la4\mbreak

    %194
    sib1
    r2 sib
    sib sol

    %197
    do,1
    sol'
    R

    %200
    r2 do8 la16 sib do re mi do
    re2 do
    do1

    %203
    do2 la8 fa16 sol la sib do la\mbreak
    sib4 re do2
    sib fa~

    %206
    fa4 sol8 la sib2
    la\longa

}

IVtbIVn = \relative do {

    R1*3
    fa,2 do'~
    do4 do la2

    %6
    r4 fa'4. fa8 sib,4
    do1
    fa,~

    %9
    fa\mbreak
    fa4 fa fa sol
    la la la sib

    %12
    do1~
    do4. do8 sib do la sib
    sol2 la

    %15
    sib4. sib8 la sib sol la
    fa1
    R

    %18
    do4 do do re
    mi mi mi fa
    sol1

    %21
    R
    do4 do do sib
    la la la sol

    %24
    fa1
    fa'4 fa fa mi\mbreak
    re re re do

    %27
    sib2 la
    sib1~
    sib2 fa

    %30
    do'1~
    do
    fa,\fermata

    %33 OOKK
    R1*35
    re1
    la'4. la8 re,4sol~

    %70
    sol do, fa4. fa8
    sib,2 sib'
    fa1

    %73
    sib,2 sib'4 sib
    do8 re do sib la2
    sol r

    %76
    R1
    do4 do re4. re8
    sol,1\mbreak

    %79
    R
    r2 sib
    fa'4. fa8 sib,4 mib~

    %82
    mib re do4. do8
    sib2 r4 sol16 la sib sol
    re'2. do8 sib

    %85
    la1
    re,1
    R1*3

    %90
    r2 do'4 do
    sib8 do sib la sol2
    fa1

    %93
    R1*2
    r2 la4 la
    sib2. sib4

    %97
    do2 r4 la
    do2 do,
    fa1\fermata

    %100 OOKK
    fa1~
    fa2 fa
    sol la

    %103
    sib1
    la
    sol2 fa

    %106
    sol1~
    sol
    do,

    %109
    do'4 do do do\mbreak
    la2 re
    do8 re do sib la sib la sol

    %112
    fa2 sib
    la2. la4
    sib2 la

    %115
    sol fa
    do'1
    fa,~

    %118
    fa~
    fa
    R1*3

    %123
    do'4 do do do
    la2 re
    do8 re do sib la sib la sol

    %126
    fa1
    fa'4 fa fa fa\mbreak
    re2 sol

    %129
    fa8 sol fa mi re mib re do
    sib2 mib
    fa sib,

    %132
    do re
    do1
    fa,

    %135 Fine sinfonia OOKK
    R1*51
    fa1
    fa2 fa

    %188
    do'1
    fa,
    R

    %191
    r2 la8 fa16 sol la sib do la
    sib2 mib,
    fa1

    %194
    sib
    r2 sib
    sib sib

    %197
    la1
    sol
    R\mbreak

    %200
    r2 la8 fa16 sol la sib do la
    sib2 fa
    do' do,

    %203
    fa fa4 fa
    sib2 fa'
    sib,1~

    %206
    sib
    fa\longa

}

IVbasson = \relative do {

    \autoBeamOff

    R1*32
    do2 fa~
    fa4 fa mi2\mbreak

    %35
    r4 fa4. fa8 la,4
    do1
    fa,

    %38
    r2 fa'
    sib2. sib4
    la1

    %41
    r4 sol4. sol8 si,4\mbreak
    re1
    sol,2 mib'~

    %44
    mib re
    do1
    sib

    %47
    r2 fa'4 sib,
    re sol, do2~
    do re

    %50
    mib1
    re2 r4 sib
    re mi fa4. mi16 [re]\mbreak

    %53
    do4. sib16 [la] sol8 sol'4 fa16[ mi]
    re4. do16 [sib] la8 la'4 sol16 [fa]
    mi4 fa sol2~

    %56
    sol do,
    r sol'4 do,
    mi la, re2~

    %59
    re do
    sib1
    la

    %62
    r4 fa la sib
    do do8 do mi4 fa
    sol4. fa16 [mi] re4. do16 [sib]

    %65
    la4. sol16 [fa] mi4 fa\mbreak
    do'1
    fa,

    %68
    r2 re'
    mi4. la,8 re2
    sol,4 sol' fa4. fa8

    %71
    re2 r4 sib16 [do re sib]
    fa'2 fa,
    sib re4 re\mbreak

    %74
    mi8 fad sol mi fad2
    sol do,4 do
    re4. re8 sol,2

    %77
    R1*3
    r2 sib'
    la4. la8 sib4 sol

    %82
    la sib2 la4\mbreak
    sib1
    r2 re,16 [mi fa re] la'4~

    %85
    la4 sol8 [fa] mi2
    re re4 re
    do8 re do sib la2

    %88
    sol r
    fa'4 fa sol4. sol8\mbreak
    do,2 mi4 mi

    %91
    re8 mi fa re mi2
    fa1
    R1*3

    %96
    fa4 fa sol2~
    sol4 sol do,2
    r4 la do4. do8

    %99
    fa,1\fermopz\mbreak
    R1*35
    fa'2 fa4 re

    %136 OOKK
    sib'4. sib8 la4 re,~
    re fa sib, sib8 do
    re1

    %139
    do
    R1*2\mbreak
    la2 la4 fa

    %143
    re'4. re8 do4 fa~
    fa mi re do8 sib
    la1

    %146
    sib2 r
    R1*2
    re2 re4 sib

    %150
    sol'4. sol8 fa4 sib,~
    sib re\mbreak sol, sol8 la
    sib2. la4

    %153
    sol1
    la
    r4 la' la  la

    %156
    sol1
    fa2 r4 re
    re re dod2

    %159
    re\mbreak fad8 re16 [mi] fad [sol la fad]
    sol4 fa? mi8  do16 [re] mi [fa sol mi]
    fa4 mi re8 sib16 [do] re [mi fa re]\mbreak

    %162
    mib4 re do2
    sib1
    R1*3

    %167
    r2 r4 sol'
    sol sol fad2
    sol r4 sib,

    %170
    sib sib la2
    sol1\mbreak
    r4 fa' fa fa

    %173
    mib1
    re2 fad8 re16 [mi?] fad[sol la fad]
    sol4 mib re2

    %176
    do si8 sol16 [la] si[do re si]\mbreak
    do4 la sol2
    fa mi'8 do16 [re] mi[fa sol mi]

    %179
    fa4 re do2
    sib la'8 fa16 [sol] la[sib do la]\mbreak
    sib4 la sol8 mi16 [fa] sol[la sib sol]

    %182
    la4 sol fa8 re16 [mi] fa[sol la fa]
    sol4 do, sol2
    do1

    %185
    R
    fa
    fa2\mbreak fa

    %188
    sol1
    la
    R

    %191
    mi8 do16 [re] mi[fa sol mi] fa4 mi
    re re sol8 mib16[ fa] sol[ la sib sol]
    la4 re,\mbreak fa2

    %194
    sib,1
    r2 fa'
    fa sol

    %197
    la1
    re,
    fad8 re16 [mi] fad[sol la fad] sol4 fa\mbreak

    %200
    mi8 do16 [re] mi[fa sol mi] fa4 mi
    re4. mi8 fa4. mi16 [re]
    do8.[re16 la8. sib16] do2

    %203
    fa,\mbreak fa'4 fa
    sib,2 fa
    fa'4 mi re do

    %206
    sib1
    fa'\longa

}

IVtesto = \lyricmode {

    At -- ten -- dite _ popu - le me -- us, at -- ten -- dite _ popu - le me -- us, le -- gem me -- am,

    incli - nate _ au -- rem ve -- stram in verba _ o - - - - - - - - - - - - ris me -- i,

    incli - nate _ au -- rem ve -- stram in verba _ o -- ris, in verba _ o - - - - - - ris me -- i.

    A -- peri - am in pa -- ra -- bo -- lis os _ me -- um, lo -- quar propo - siti - o -- nes ab i -- ni -- ti -- o,

    a -- peri - am in pa -- ra -- bo -- lis os me - - um, lo -- quar propo - siti - o -- nes ab i -- ni -- ti -- o,

    lo -- quar propo - siti - o -- nes ab i -- ni -- ti -- o,  i -- ni -- ti -- o.

    Quan -- ta au -- divi - mus et co -- gno -- vimus _ e -- a,

    quan -- ta au -- divi - mus et co -- gno -- vimus _ e -- a,

    quan -- ta au -- divi - mus et co -- gno -- vimus _ e - - a

    et patres _ no -- stri, et patres _ no -- stri nar -- ra - verunt  _  nar -- ra - verunt,  _

    nar -- ra - verunt  _  no -- bis, et patres _ no -- stri,  et patres _ no -- stri,  et patres _ no -- stri,

    nar -- ra - verunt  _  no -- bis, nar -- ra - verunt  _  no -- bis, nar -- ra - verunt  _  no -- bis,

    nar -- ra - verunt,  _ nar -- ra - verunt  _ nar -- ra - verunt  _  no -- bis, et patres _ no -- stri,

    nar -- ra - verunt  _  no -- bis, nar -- ra - verunt  _  no -- bis, et patres _ no -- stri,

    nar -- ra - verunt, _  nar -- ra - verunt  _ no - - - - - bis, nar -- ra -- verunt  _ no - - - - bis.

}

IVbcn = \relative do {

    \clef alto do'2 fa
    fa, do'
    \clef bass \key fa\major do,2 fa

    %4
    fa, do'~
    do4 do la2
    r4 fa'4. fa8 sib,4

    %7
    do1
    fa,
    fa\mbreak

    %10
    fa4 fa fa sol
    la la la sib
    do1~

    %13
    do4. do8 sib do la sib
    sol2 la
    sib4. sib8 la sib sol la

    %16
    fa4 fa'2 sol4\mbreak
    la1
    do,,4 do do re

    %19
    mi mi mi fa
    sol1
    sol

    %22
    do4 do do sib
    la la la sol
    fa1

    %25
    fa'4 fa fa mi\mbreak
    re re re do
    sib2 la

    %28
    sib1~
    sib2 fa
    do'1

    %31
    do
    fa,\fermata
    do'2_\markup\italic"Basso Solo" fa~

    %34
    fa4 fa mi2
    r4 fa4. fa8 la,4
    do1\mbreak

    %37
    fa,
    r2 fa'
    sib2. sib4

    %40
    la1
    r4 sol4. sol8 si,4
    re1

    %43
    sol,2 mib'~
    mib re
    do1

    %46
    sib
    sib
    re4 sol, do2~

    %49
    do re\mbreak
    mib1
    re2 sib~

    %52
    sib fa
    do' sol
    re' la

    %55
    mi'4 fa sol2~
    sol do,
    do1

    %58
    mi4 la, re2~
    re do
    sib1

    %61
    la\mbreak
    fa
    do'2. sib8 la

    %64
    sol2 re'4. do16 sib
    la4. sol16 fa mi4 fa
    do'1

    %67
    fa,
    re
    la'4. la8 re,4 sol~

    %70
    sol do, fa4. fa8
    sib2 sib
    fa1

    %73
    sib2 sib
    do8 re do sib la2
    sol do

    %76
    re sol,
    do re
    sol, sol'\mbreak

    %79
    la re,
    r sib
    fa' sib,4 mib~

    %82
    mib re do2
    sib2. sol4
    re'2. do8 sib

    %85
    la1
    re,2 re'4 re
    do8 re do sib\mbreak la2

    %88
    sol sol'
    fa sol
    do, do4 do

    %91
    sib8 do sib la sol2
    fa1
    do'2 do'

    %94
    sib8 la sol la sib2
    la la,
    sib1\mbreak

    %97
    do2 la
    do4 la do2
    fa,1\fermata

    %100 OOKK
    fa1~
    fa2 fa
    sol la

    %103
    sib1
    la
    sol2 fa

    %106
    sol1~
    sol
    do

    %109
    do4 do do do\mbreak
    la2 re
    do4. sib8 la4. sol8

    %112
    fa2 sib
    la1
    sib2 la

    %115
    sol fa
    do'1
    fa,

    %118
    fa~
    fa
    sib'2~sib4 sol

    %121
    la2 sib~
    sib4 la la sol8 fa
    do4 do do do

    %124
    la2 re
    do4. sib8 la4. sol8
    fa1

    %127
    fa'4 fa fa fa\mbreak
    re2 sol
    fa4. mi8 re4. do8

    %130
    sib2 mib
    fa sib,
    do re

    %133
    do1
    fa,
    fa'2 fa4 re

    %136
    sib'2 la4 re,~
    re fa\mbreak sib,4. do8
    re1

    %139
    do2 do~
    do4 do re2
    do  sol

    %142
    la la4 fa
    re'2 do4 fa~
    fa mi re do8 sib

    %145
    la1\mbreak
    sib2 fa~
    fa do'

    %148
    sib4. la8 sol2
    re' re4 sib
    sol'2 fa4 sib,~

    %151
    sib re sol,4. la8
    sib2. la4
    sol1\mbreak

    %154 OOKK
    la1~
    la2 la'
    sol1

    %157
    fa2. re4
    re2 dod
    re fad

    %160
    sol4 fa? mi2
    fa4 mi re2
    mib4 re do2

    %163
    sib\mbreak sib'4 la
    sol2 la4 sol
    fa2 sol4 fa

    %166
    mib2 fa
    sib,2. sol'4
    sol2 fad

    %169
    sol2. sib,4
    sib2 la
    sol1\mbreak

    %172
    fa4 fa' fa2
    mib1
    re2 fad

    %175
    sol4 mib re2
    do si
    do4 la sol2

    %178
    fa mi'
    fa4 re\mbreak do2
    sib la'

    %181
    sib4 la sol2
    la4 sol fa2
    sol4 do, sol2

    %184
    do1
    R
    fa,

    %187
    fa2 fa
    do'1
    fa,2 fa'\mbreak

    %190
    re2 sol
    do, la
    sib mib,

    %193
    fa1
    sib
    r2 sib

    %196
    sib sib
    la1
    sol

    %199
    re'2 sol,
    do la\mbreak
    sib fa

    %202
    do'1
    fa,2 fa4 fa
    sib2 fa'

    %205
    sib,1~
    sib
    fa\longa

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*5
    s2 s4 <6>
    <3>4 <4>2 <3>4
    s1*6
    s2 <6>4 <5>
    s2 <6>
    s1*4
    <_+>1
    <[3+]>4 <4>2 <[3+]>4
    s1*5
    s2 <6>
    s1*2
    <5>2 <5>
    <3>4 <4>2 <3>4
    s1*8
    <_+>1
    s
    <4>2 <[3+]>
    s1
    s2 <[6]>
    <7> <6>
    s1*2
    s2 <_->
    s <6>
    <7> <6>
    <_+>1
    s1*3
     s2 <[3+]>4 <4>
     s <[3+]> s2
     s1
     <_+>
     s2 <6>
     <7> <6>
     <_+>1
     s1*3
     s2 <6>
     s1*3
     <_+>2 <_+>4 <_+>
     s1*2
     <3>2 <4>
     s1
     s2 <[6+]>
     <_+>1
     <_+>
     s2 <_+> s <6>4 <5>
     <_+>2 <_+> s1
     s2 s4 <3>
     <4> <6> <7> <6>
     s1
     <4>2 <3>
     <4> <[3+]>
     s1
     s8 <_+> s4 <[6+]>2
     s1
     s2 <_+>
     s1
     s2 <6>
     <5> <6>
     s1
     <6>
     <6>2 <_+>
     <5> <6>
     s <6>
     <4>4 <6> s2
     s1*2
     s2 <6>
     s <6>
     <7> <6>
     <_+> <[_-]>
     s1
     <[3+]>2 <4>
     s <[3+]>
     <5> <6>
     s1*5
     s2 <6>
     <5>4 <6> s2
     <3>4 <4>2 <3>4
     <5>2  <6>
     s1*2
     s2 <6>
     <6>1
     <4>2 <6>
     <4> <3>
     <6> s
     <4>1
     <5>2 <6>
     s1*2
     <4>1
     s1*3
     <4>2 <3>
     s1*2
     s2 <_+>
     s1*2
     <6>1
     s
     s2 <_+>
     <_->1
     s1*9
     s2 s4 <6>
     s1
     <4>2 <[3+]>
     <_+> <5>4 <6>
     <7>2 <6>
     s1
     <2>
     s
     s2 <6>
     s <6>
     s <6>
     s1*5
     <4>1
     <_+>2 <_->
     s1
     <4>2 <[3+]>
     s <6>
     <7> <6>
     s1
     s2 <_+>
     <_->1
     s2 <_+>
     s1*3
     s4 <6> s2
     s4 <6> s2
     <_+> <_+>
     s1*6
     <_+>2 <_+>
     s <6>
     s <5>4 <6>
     <3>4 <4>2 <3>4
     s1*2
     s2 <6>
     <7> <[6+]>
     <_+>1
     <_+>2 <_+>
     s <6>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 70
    s1*32
    s1*67\break
    \mark\markup\huge\bold"    Sinfonia"
    s1*107
    s\longa
    \bar "|."

}

IVtbI = {
    \notypeset
    <<\IVtbIn \forma>>

}

IVtbII = {
    <<\IVtbIIn \forma>>

}

IVtbIII = {
    \clef tenor
    <<\IVtbIIIn \forma>>

}

IVtbIV = {
    <<\IVtbIVn \forma>>

}

IVbasso = {
    \clef bass
    \new Voice = "attendite"
    <<\IVbasson \forma>>
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

    re4 re re do
    si8 re si re sol, si do re
    mi2. re4

    %4
    do2. do4
    si2. si4
    la sol la2\mbreak

    %7
    sol1
    R1*3
    re'4 re re do

    %12
    si8 re si re sol, la si do
    re1
    sol4 sol sol fa

    %15
    mi8 sol mi sol do, mi fa sol\mbreak
    la2. sol4
    fa2. fa4

    %18
    mi re mi2
    re1
    la4 la la sol

    %21
    fad8 la fad la re, la' si do
    re2 r
    R1

    %24
    sol4 sol sol fa\mbreak
    mi8 sol mi sol re mi fa re
    mi re mi fad sol fad sol mi

    %27
    fad4 sol2 fad4
    sol8 re si re sol, si do re
    mi2 re\mbreak

    %30
    do1
    si\fermata
    R1*24

    %56
    r4 fad'8 sol la si do si
    la2. la4
    sol1

    %59
    re8 mi16 re mi re do si do2
    si\mbreak r8 la do la
    mi'4 si re8 do16 si la sol la si

    %62
    do8 si16 la sol fad sol la si8 sol la4~
    la8 fa sol4 r re'8 do16 si\mbreak
    la sol la si do8 si16 la sol fad sol la si8 sol

    %65
    la2 re,
    R1*5
    r2 r8 mi' sol mi

    %72
    la4 fad\mbreak sol8 fa?16 mi re do re mi
    fa8 mi16 re do si do re mi2
    re do

    %75
    si4 la si2
    mi,1
    R1*2\mbreak

    %79
    r2 sol'8 la16 sol la sol fa mi
    fa1
    mi8 do mi do sol'4 re

    %82
    fa8 mi16 re do si do re mi2~
    mi4 re2 dod4
    re2 r

    %85
    R1
    r2 r8 re fa re\mbreak
    la'4 mi sol8 fa16 mi re do re mi

    %88
    fa2 mi8 do mi do
    sol'4 re fa8 mi16 re do si do re
    mi2 re4 r

    %91
    la'8 si do si la2
    sol1\mbreak
    re4 re re do

    %94
    si8 re si re sol, si do re
    mi2. re4
    do2. do4

    %97
    si2. si4
    la sol la2
    sol1

    %100
    R1*3
    re'4 re\mbreak re do
    si8 re si re sol, la si do

    %105
    re1
    sol4 sol sol fa
    mi8 sol mi sol do, mi fa sol

    %108
    la2. sol4
    fa2. fa4\mbreak
    mi fa8 re mi2

    %111
    re1
    la4 la la sol
    fad8 la fad la re, re mi fad

    %114
    sol2 r
    R1
    sol'4 sol sol fa\mbreak

    %117
    mi8 sol mi sol re mi fa re
    mi re mi fad sol fad sol mi
    fad4 sol2 fad4

    %120
    sol1
    R
    sol4 fa8 mi re mi fa re\mbreak

    %123
    mi4 do mi2
    re\longa

}

VtbIn = \relative do' {

    R1
    sol'4 sol sol fa
    mi8 sol mi sol do, mi fa sol

    %4
    la4 la,8 si do re  mi fad\mbreak
    sol4 sol,8 la si do re mi
    fad4 sol2 fad4

    %7
    sol2 r8 si, do re
    mi2. re4
    do2. do4

    %10
    si2. si4
    la sol la2
    sol r4 re'

    %13
    si8 re si re sol,4 la\mbreak
    si2 r
    do4 do do sib

    %16
    la8 do la do fa, la si? do
    re4 la re4. mi8
    dod4 re2 dod4

    %19
    re la la sol
    fad8 la fad la\mbreak re, la' si do
    re2 r

    %22
    re4 re re do
    si8 re si re sol, si do re
    mi4 re8 do si do re si

    %25
    do4 sol' sol fa
    mi8 sol mi sol\mbreak si, la si sol
    la4 si la2

    %28
    sol r
    r8 sol' mi sol re mi fa re
    mi2 fad

    %31
    sol1\fermata
    R1*24
    r4 re8 mi fad sol la mi\mbreak

    %57
    fad4 sol2 fad4
    sol1
    R1*2

    %61
    sol8 la16 sol la sol fa mi fa2
    mi r8 re fa re
    la'4 mi sol8 fa16 mi re do re mi\mbreak

    %64
    fa8 mi16 re do si do re mi4 sol~
    sol fad sol2
    R1*6

    %72
    r2 r8 sol, si sol
    re'4 la do8 si16 la sol fad sol la\mbreak
    si8 la16 sol fad mi fad sol la4. si8

    %75
    sold4 la2 sold4
    la1
    R1*5

    %82
    r2 sol'4 sol
    fa4. mi16 re mi2
    la,4 re mi4. re16 do

    %85
    re2 r\mbreak
    R1
    r2 sol4 sol8 sol

    %88
    fa4 re la'8 sol16 fa mi re mi fa
    sol2 fa
    r sol8 fa16 mi re do re mi

    %91
    fad4 sol2 fad4
    sol1\mbreak
    R

    %94
    sol4 sol sol fa
    mi8 sol mi sol do, mi fa sol
    la4 la,8 si do re  mi fad\mbreak

    %97
    sol4 sol,8 la si do re mi
    fad4 sol2 fad4
    sol2 r8 si, do re

    %100
    mi2. re4
    do2. do4
    si2. si4

    %103
    la sol la2
    re r4 re
    si8 re si re sol,4 la\mbreak

    %106
    si2 r
    do4 do do sib
    la8 do la do fa, la si? do

    %109
    la4. sol16 la sib4 la
    la1
    la4 la la sol

    %112
    fad8 la fad la\mbreak re, la' si do
    re2 r
    re4 re re do

    %115
    si8 re si re sol, si do re
    mi2. fa4
    sol sol sol fa

    %118
    mi1
    R\mbreak
    sol4 fa8 mi re mi fa re

    %121
    mi1
    re
    do

    %124
    re\longa

}

Vfgn = \relative do {

    R1*6
    sol'4 sol sol fa
    mi8 sol mi sol do, mi fa sol

    %9
    la4 la,8 si do re mi fad
    sol4 sol,8 la si do re mi\mbreak
    fad4 sol2 fad4

    %12
    sol1
    sol4 sol sol fa
    mi8 sol mi sol do, sol' la si

    %15
    do4 do,2 re8 mi\mbreak
    fa2. mi4
    re8 fa re fa sib, re fa sol

    %18
    la4 re, la'2
    re,1
    R

    %21
    re4 re re do\mbreak
    \parenthesize si8 re si re sol, re' mi fa
    sol2. fa4

    %24
    mi2. re4
    do2 si
    do mi

    %27
    re1
    sol,2 r8 sol' mi sol
    do,2 si

    %30
    la1
    sol\fermata
    R1*24

    %56
    r4 re'2 do4
    re1
    sol,

    %59
    R
    sol'8 la16 sol la sol fa mi fa2
    mi r8 re fa re

    %62
    la'4 mi\mbreak sol8 fa16 mi re do re mi
    fa8 mi16 re do si do re mi8 re16 do si la si do
    re8 do16 si la sol la si do4 si

    %65
    la2 sol
    R1*7\mbreak %% fine pagina
    r8 re' fa re la'4 mi

    %74
    sol8 fa16 mi re dod re mi fa8 mi16 re do? si do re
    mi4 do si2
    la1

    %77
    R1*4
    do'4 do sib2\mbreak
    la8 fa la fa do'4 sol

    %83
    la fa mi2
    re r
    R1

    %86
    r8 do mi do sol'4 re
    fa16 mi fa sol la8 sol16 fa mi re mi fa sol4\mbreak
    re2 r8 la do la

    %89
    mi'4 sol re16 do re mi fa8 mi16 re
    do si do re mi re mi fa sol4. fa16 mi
    re4 do re2

    %92
    sol,1\mbreak
    R1*6 %%% inizio sinfonia
    sol'4 sol sol fa

    %100
    mi8 sol mi sol do, mi fa sol
    la4 la,8 si do re mi fad
    sol4 sol,8 la si do re mi\mbreak

    %103
    fad4 sol2 fad4
    sol1
    sol4 sol sol fa?

    %106
    mi8 sol mi sol do, sol' la si
    do4 do,2 re8 mi
    fa2. mi4

    %109
    re8 fa re fa\mbreak sib, re fa sol
    la4 re, la'2
    re,1

    %112
    R
    re4 re re do
    si8 re si re sol, re' mi fa

    %115
    sol2. fa4
    mi2. re4
    do2\mbreak si

    %118
    do mi
    re1
    sol,

    %121
    r2 mi'4 re8 do
    si la si do re4 si
    do1

    %124
    sol\longa

}

Vsopranon = \relative do'' {

    \autoBeamOff

    R1*31
    re2. do4
    si2 si4 do8 re\mbreak

    %34
    mi1
    re4 sol,8[la] si[do re sol,]
    la2. la4

    %37
    sol1
    R1*4
    la2. sol4

    %43
    fad2\mbreak la4 si8 do
    re1
    do4 la8[si] do[re mi la,]

    %46
    do1
    si
    la2 r4 do8[re]

    %49
    mi[fa sol do,] re4. re8
    do1
    R\mbreak

    %52
    re2. do4
    si2 sol4 la8 si
    do1

    %55
    si
    r2 r4 mi
    la,2. re4

    %58
    re1
    R1*8
    re4 re do2

    %68
    si\mbreak r8 la do la
    mi'4 si re8[do16 si] la[sol la si]
    do8[si16 la] sol[fad sol la] si8[la16 sol] fad[mi fad sol]\mbreak

    %71
    la8[sol16 fad?] mi[re mi fad!] sol4 mi
    fad8.[sol16] la4 si2
    R1*3

    %76
    r2 la4 la
    sol2 fad
    r8 sol si sol\mbreak re'4 la

    %79
    do8[si16 la] sol[fad sol la] si4 do~
    do si8[la] si2
    do r

    %82
    R1
    la4 la sol2
    fad8 re fad re\mbreak la'4 mi

    %85
    sol8[fa?16 mi] re[do re mi] fa4 fa
    mi2 re
    r8 la' do la mi'4 si

    %88
    re8[do16 si] la[sol la si] do2\mbreak
    si la
    sol re8[mi16 fa] sol[la si do]

    %91
    re4 mi  la,8[si16 do] re4
    re1
    R1*5

    %98
    re4 do8[si]\mbreak la[si do la]
    si4 sol re'2
    sol,1

    %101
    R
    sol4 fa8[mi] re[mi fad sol]
    la4 re, la'2

    %104
    sol r\mbreak
    sol4 fa8[mi] re[mi fa re]
    mi2. la4

    %107
    sol1
    fa2 r
    R1

    %110
    la4 sol8[fa] mi[fa sol mi]
    fad4 re la'2\mbreak
    re,1

    %113
    R1*3
    mi'4 re8[do] si[do re si]
    do4 sol re'2

    %118
    sol,1
    R1*2
    mi'4 re8[do] si[la si do]\mbreak

    %122
    re2 si
    sol4. la16[si] do2
    si\longa

}

VtestoI = \lyricmode {

    Do -- mi -- ne, la -- bia _ me -- a a - pe -- ri -- es, Do -- mi -- ne, la -- bia _ me -- a a - pe -- ri -- es,

    a - pe -- ri -- es, Do -- mi -- ne, la -- bia _ me -- a a -- pe -- ri -- es,

    et os me -- um an -- nun -- ti -- a -- bit lau - - - - - - - - dem tu - am,

    et os me -- um an -- nun -- ti -- a -- bit lau - - dem tu - am,

    et os me -- um an -- nun -- ti -- a -- bit lau - - dem tu -- am,

    an -- nun -- ti -- a -- bit lau - - dem tu -- am, lau - - dem tu - am, lau - - - dem tu -- am,

    lau - - -  dem tu -- am, lau - - - dem tu -- am, lau - - - dem tu -- am, lau - - - dem tu -- am,

    lau - - - dem tu - - am.

}

Vtenoren = \relative do' {

    \autoBeamOff
    R1*31
    R1*5
    sol2. fa4

    %38
    mi2 mi4 fa8 sol\mbreak
    la1
    sol4 re8 [mi] fa [sol la re,]

    %41
    mi2. mi4
    re1
    la'2. sol4

    %44
    fad2 mi4 fad8 sol\mbreak
    la1
    mi4 la8 [si] do [re mi re,]

    %47
    mi2. mi4
    la la8 [si] do [re mi la,]
    si4 do2 si4

    %50
    do1
    re2. do4
    si2 r\mbreak

    %53
    r si4 do8 re
    mi1
    re4 sol,8 [la] si [do re sol,]

    %56
    la1~
    la2 la
    si1

    %59
    R1*3
    r2 re4 re
    do2 si

    %64
    r r8 mi re si\mbreak
    do4 la si8 [do16 re] mi[fa mi re]
    do8[si16 la] sol[fad sol la] si4 sol

    %67
    fad sol2 fad4
    sol sol8 sol fa?2
    mi\mbreak r8 re fa re

    %70
    la'4 mi sol8 [fa16 mi] re[do re mi]
    fa8 [mi16 re] do[si do re] mi4 mi
    re2 sol

    %73
    R1*2
    mi'4 mi re2\mbreak
    dod r8 la dod la

    %77
    mi'4 si re8 [do16 si] la[sol la si]
    do8[si16 la] sol[fad sol la] sib8[la16 sol] fa[mi fa sol]\mbreak
    la8[sol16 fa] mi[re mi fa] sol4 mi

    %80
    re1
    do2 r
    R1*2

    %84
    re'4 re do2
    si8 sol si sol re'4 la\mbreak
    do8[si16 la] sol[fad sol la] si4 re

    %87
    la la si2
    la r
    r8 sol si sol re'4 la

    %90
    do8[si16 la] sol [fad sol la]\mbreak si4 sol
    la1
    si

    %93
    R1*7
    si4 do8[re] mi[do re si]
    do4 la mi'2

    %102
    re r
    re4 do8[si] la[si do la]\mbreak
    si4 sol re'2

    %105
    sol, r
    R1*2
    do4 re8[mi] fa[re mi do]

    %109
    re2. mi4
    dod re2 dod4
    re1

    %112
    R
    re4 do8[si]\mbreak la[si do la]
    si2. la4

    %115
    sol8[la si sol] re'2
    sol, r
    R1

    %118
    do4 si8[la] sol[la si sol]
    la4 si la2
    sol r\mbreak

    %121
    do4 si8[la] sol[ fad sol la]
    si2 sol
    mi4. fa8 sol2

    %124
    sol\longa

}

VtestoII = \lyricmode {

    Do -- mi -- ne, la -- bia _ me -- a a - pe -- ri -- es, Do -- mi -- ne, la -- bia _ me -- a a - pe -- ri -- es,

    a - - pe -- ri -- es, Do -- mi -- ne, la -- bia _ me -- a a - pe -- ri -- es,

    et os me -- um an -- nun -- ti -- a -- bit lau - - - - dem tu - - am,

    et os me -- um an -- nun -- ti -- a -- bit lau - - - - dem tu -- am,

    et os me -- um an -- nun -- ti -- a -- bit lau - - - - - - - - dem tu -- am,

    et os me -- um an -- nun -- ti -- a -- bit lau - - dem lau -- dem tu -- am,

    an -- nun -- ti -- a -- bit lau - - dem tu -- am, lau - - - dem tu -- am,

    lau - - -  dem tu -- am, lau - - - dem tu - - am, lau - - - dem tu - am, lau - - - dem tu -- am,

    lau - - - dem tu - - am.

}

Vbcn = \relative do {

    \clef violin re''4 re re do
    \clef alto sol sol sol fa
    mi8 sol mi sol do, mi fa sol

    %4
    la4 la,8 si do re  mi fad\mbreak
    sol4 sol,8 la si do re mi
    <<{fad4 sol2 fad4}\\{re re re do}>>

    %7
    \clef bass sol4 sol sol fa
    mi8 sol mi sol do, mi fa sol
    la4 la,8 si\mbreak do re mi fad

    %10
    sol4 sol,8 la si do re mi
    fad4 sol2 fad4
    sol1

    %13
    sol4 sol sol fa
    mi8 sol mi sol do, sol' la si\mbreak
    do4 do,2 re8 mi

    %16
    fa2. mi4
    re8 fa re fa sib, re fa sol
    la4 re, la'2

    %19
    re,1~
    re
    re4 re re do\mbreak

    %22
    si8 re si re sol, re' mi fa
    sol2. fa4
    mi2. re4

    %25
    do2 si
    do mi
    re1

    %28
    sol,2~sol8 sol' mi sol\mbreak
    do,2 si
    la1

    %31
    sol\fermata
    sol'2 fad
    sol1

    %34
    do,
    sol'2 sol,
    do re

    %37
    sol,1
    do
    fa,

    %40
    do'2 sib
    sol la\mbreak
    re1~

    %43
    re
    \clef tenor re2 re4 fad?8 sol
    la1

    %46
    mi4 la8 si do re mi  re,
    mi2. mi4
    la2 \clef bass la

    %49
    sol1
    do,\mbreak
    sol'2 fad

    %52
    sol la
    sol4 fa? mi re
    do la8 si do re mi fa

    %55
    sol2. fa8 mi
    re2. do4
    re1

    %58
    sol,\mbreak
    sol'4 sol la2
    sol4 sol fa2

    %61
    mi re4 fa8 re
    la'4 mi sol re
    fa do mi si\mbreak

    %64
    re la do si
    la2 sol
    la4 do sol si

    %67
    re si la2
    sol4 sol' fa2
    mi\mbreak re4 fa8 re

    %70
    la'4 mi sol re
    fa do mi mi
    re2 sol

    %73
    re4 fa8 re la'4 mi\mbreak
    sol re fa do
    mi do si2

    %76
    la \clef tenor la'4 dod8 la
    mi'4 si re la
    do sol\mbreak sib fa

    %79
    la mi sol mi
    re1
    do4 do' sib2

    %82
    la8 fa la fa do'4 sol
    la fa mi2\mbreak
    \clef bass re4 si la2

    %85
    sol8\clef tenor sol' si sol re'4 la
    do8\clef bass do, mi do sol'4 re
    fa la\mbreak mi sol

    %88
    re fa la8 la, do la
    mi'4 sol re fa
    do mi sol4. fa16 mi

    %91
    re4 do re2
    sol,1\mbreak
    \clef violin re'''4 re re do

    %94
    \clef alto sol sol sol fa
    mi8 sol mi sol do, mi fa sol
    la4 la,8 si do re mi fad\mbreak

    %97
    sol4 sol,8 la si do re mi
    <<{fad4 sol2 fad4}\\{re re re do}>>
    \clef bass sol4 sol sol fa

    %100
    mi8 sol mi sol do, mi fa sol
    la4 la,8 si\mbreak do re mi fad
    sol4 sol,8 la si do re mi

    %103
    fad4 sol2 fad4
    sol1
    sol4 sol sol re

    %106
    mi8 sol mi sol do, sol' la si\mbreak
    do4 do,2 re8 mi
    fa2. mi4

    %109
    re8 fa re fa sib, re fa sol
    la4 re, la'2
    re,1~

    %112
    re
    re4 re re do\mbreak
    si8 re si re sol, re' mi fa

    %115
    sol2. fa4
    mi2. re4
    do2 si

    %118
    do mi
    re1
    sol,2 si

    %121
    do mi4 re8 do
    si2 si
    do1

    %124
    sol\longa

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*2
    s8 <6> s <6> s4 <6>
    s2 s4 <6>
    s2 s4 <_+>
    s1*2
    s8 <6> s <6> s4 <6>
    s2 s4 <6> s2 s4 <6>
    s1*3 s2 s4 <6>
    s2 s4 <[6-]>
    s1
    s2 s4 <6>
    <_+>2 <4>4 <[3+]>
    <_+>\breve
    <_+>1
    s2 s4 <6>
    s1 s2 s4 <6>
    s2 <6>4 <5>
    s1
    <[3+]>4 <4>2 <[3+]>4
    s2 s4 <6>
    s1
    <5>2 <[6+]>
    s1*5
    <6>2 <_+>
    s1*4
    <6>2 <_+>
    <_+>1
    s
    <_+>
    s
    <6>
    <_+>
    s
    <3>4 <4>2 <3>4
    s1*6
    <[_+]>2. <6>4
    <_+>1
    s1*6
    s2 s4 <6>
    <7> <[6+]> s2
    s s4 <6>
    <_+> <6> <7> <[6+]>
    s1*2
    s2 s4 <_+>

    s1
    <_+>
    s
    s2 s4 <[6]>
    <_+> <6> <7> <[6+]>
    <_+>1
    s4 <6> <_+> <[6+]>
    s1
    s2 s4 <6>
    <7>2 <6>
    s <6>
    s s4 <6>
    s <6> <7> <[6+]>
    <_+> <[3+]> s2
    s s4 <6>
    s1*5
    <_+>2 <[4]>4 <_+>
    s1*3
    s8 <6> s <6> s4 <6>
    s2 s4 <6>
    s2 s4 <6>
    s1*2
    s8 <6> s <6> s4 <6>
    s2 s4 <6>
    s2 s4 <6>
    s1*3
    s8 <6> s <6> s <6> <6> s
    s2 s4 <[6-]>
    s1
    s8 <6> s <6> s8 <[6-]> s4
    <_+>2 <[4]>4 <_+>
    <_+>\breve
    <_+>4 <_+> s2
    s8 <6> s <6> s <6> <6> s
    s1
    s2. <6>4s2 <6> s1
    <[3+]>4 <4>2 <[3+]>4
    s2 <6>
    s1
    <6>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 65
    s1*92\break
    \mark\markup\huge\bold "            Sinfonia"
    s1*31
    s\longa
    \bar "|."

}

VvlI = {
    %\notypeset
    <<\VvlIn \forma>>

}

VtbI = {
    \clef alto
    <<\VtbIn \forma>>

}

Vfg = {
    <<\Vfgn \forma>>

}

Vsoprano = {
    \new Voice = "domine1"
    <<\Vsopranon \forma>>
}

Vtenore = {
    \new Voice = "domine2"
    <<\Vtenoren \forma>>
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
#(set-global-staff-size 17)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.7
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \override Staff.NoteHead.style = #'baroque

}

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup \smaller "XI. Benedicam Dominum [SWV 267]"
        composer = \markup \center-column{"H. Schütz (1585-1672"}
    }

    \markup\huge\bold {"                 ""Prima Pars"}

    \score {

        <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"trumpet"
                \set Staff.instrumentName = \markup  \center-column{"Cornetto, o"\vspace #-0.2"Violino"}
                \IvlI\global
            >>

            \new ChoirStaff   <<

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major\time 4/4  re''8^\markup \center-align"Cantus" mi'' re'' si'}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Isoprano\global
                    \new Lyrics \lyricsto "benedicam1" \ItestoI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major\time 4/4  r1^\markup \center-align"Tenor" }
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \Itenore\global
                    \new Lyrics \lyricsto "benedicam2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Bassus"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \Ibasso \global
                    \new Lyrics \lyricsto "benedicam3" \ItestoIII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassus"\vspace #-0.2"Pro Organo"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup \smaller "XII. Exquisivi Dominum [SWV 268]"
        composer = \markup \center-column{"H. Schütz (1585-1672"}
    }

    \markup\huge\bold {"                 ""Secunda Pars"}

    \score {

        <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"trumpet"
                \set Staff.instrumentName = \markup  \center-column{"Cornetto, o"\vspace #-0.2"Violino"}
                \IIvlI\global
            >>

            \new ChoirStaff   <<

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major\time 4/4  r4^\markup \center-align"Cantus" re''4. do''8}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIsoprano\global
                    \new Lyrics \lyricsto "exquisivi1" \IItestoI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major\time 4/4  r4^\markup \center-align"Tenor" sol4. la8}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \IItenore\global
                    \new Lyrics \lyricsto "exquisivi2" \IItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Bassus"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIbasso \global
                    \new Lyrics \lyricsto "exquisivi3" \IItestoIII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassus"\vspace #-0.2"Pro Organo"}
                \set Staff.midiInstrument = #"contrabass"
                \IIbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup \smaller "XIII. Fili mi Absalon [SWV 269]"
        composer = \markup \center-column{"H. Schütz (1585-1672"}
    }

    \markup\huge\bold {"                                        ""Sinfonia"}

    \score {

        <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major\time 3/1\numericTimeSignature  sol\breve  ^\markup \column\center-align {"Trombone [I]"\vspace #-0.3"overo Violino, alla Ottava" } }
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIItbI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major\time 3/1\numericTimeSignature  r\breve ^\markup\center-align {"Trombone [II]"}_\markup\center-align {"overo Violino, alla Ottava" } }
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIItbII\global
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"trombone"
                \set Staff.instrumentName = \markup {"         Trombone [III]"}
                \IIItbIII\global
            >>


            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef subbass \key fa\major\time 3/1\numericTimeSignature  r\breve ^\markup\center-align {"Trombone [IV]"} }
                \clef bass
                \set Staff.midiInstrument = #"trombone"
                \IIItbIV\global
            >>

            \new StaffGroup   <<
                \override StaffGroup.SystemStartBracket.collapse-height = #4
                \override Score.SystemStartBar.collapse-height = #4

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Bassus"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIIbasso\global
                    \new Lyrics \lyricsto "fili" \IIItesto
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassus"\vspace #-0.2"Pro Organo"}
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc\global
            >>
        >>

        \layout {

            indent = 4\cm
            incipit-width = 3\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup \smaller "XIV. Attendite popule meus [SWV 270]"
        composer = \markup \center-column{"H. Schütz (1585-1672"}
    }

    \markup\huge\bold {"                                        ""Sinfonia"}

    \score {

        <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major\time 4/4  do'4  ^\markup \column\center-align {"Trombone [I]"\vspace #-0.3"o Violino, alla Ottava" } fa'2. }
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IVtbI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major\time 4/4  r1 ^\markup\center-align {"Trombone [II]"}_\markup\center-align {"o  Violino, alla Ottava" } }
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IVtbII\global
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"trombone"
                \set Staff.instrumentName = \markup {"         Trombone [III]"}
                \IVtbIII\global
            >>


            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef subbass \key fa\major\time 4/4  r1^\markup\center-align {"Trombone [IV]"} }
                \clef bass
                \set Staff.midiInstrument = #"trombone"
                \IVtbIV\global
            >>

            \new StaffGroup   <<
                \override StaffGroup.SystemStartBracket.collapse-height = #4
                \override Score.SystemStartBar.collapse-height = #4

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Bassus"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVbasso\global
                    \new Lyrics \lyricsto "attendite" \IVtesto
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassus"\vspace #-0.2"Pro Organo"}
                \set Staff.midiInstrument = #"contrabass"
                \IVbc\global
            >>
        >>

        \layout {

            indent = 4\cm
            incipit-width = 3\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup \smaller "XV. Domine, labia mea aperies [SWV 271]"
        composer = \markup \center-column{"H. Schütz (1585-1672"}
    }

    \markup\huge\bold {"                   ""Sinfonia"}

    \score {

        <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Cornetto o""Violino"}
                \set Staff.midiInstrument = #"trumpet"
                \VvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Trombone"}
                \set Staff.midiInstrument = #"trombone"
                \VtbI\global
            >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef varbaritone \key do\major\time 4/4  r1 ^\markup\center-align {"Fagotto"} }
                    \clef bass
                    \Vfg\global
                \set Staff.midiInstrument = #"bassoon"
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major\time 4/4  r1 ^\markup\center-align {"Cantus"} }
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Vsoprano\global
                    \new Lyrics \lyricsto "domine1" \VtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major\time 4/4  r1 ^\markup\center-align {"Tenor"} }
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \Vtenore\global
                    \new Lyrics \lyricsto "domine2" \VtestoII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassus"\vspace #-0.2"Pro Organo"}
                \set Staff.midiInstrument = #"contrabass"
                \Vbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #5
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

}
