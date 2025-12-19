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



IobIn = \relative do'' {

    sol'8. [sol16 mi8. mi16] do4 r8 r32 re mi fa
    sol8. [sol16 mi8. mi16] do4 r8 r32 re mi fa
    sol8.[sol16 do,8. do16] la4 r8 r32 la si do

    %4
    sol8.[sol16 fa8. fa16] mi4 do
    R1*4
    sol''8.[sol16 sol8. la16] fa8.[fa16 fa8. sol16]

    %10
    mi8.[mi16 mi8. fad?16] re4 r
    R1*2
    sol8\parenthesize \f r32 fa mi re do8 r32 si la sol fa4 r

    %14
    R1*3
    r2 r4 r8 r16 mi'\f
    fa4 re mi r8 do

    %19
    fa, fa re' re sol, sol mi' mi
    la, la fa' fa si, do r r16 fad,
    sol4 sol do, r
    do'8\parenthesize \p do do do si si si si

    %23
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    do' do do do mi, mi mi mi

    %26
    fa fa fa fa sol sol sol sol
    sol'\parenthesize \f sol mi mi do do sol sol
    R1*5

    %33
    r2 r4 r8 r16 mi'
    fa4 re mi8 sol, mi do
    r2 r4 r8 mi'

    %36
    fa[mi fa mi16 re] mi8 sol, mi do
    R1
    do'8 do do do si si si si

    %39
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol

    %42
    sol'4 r8 r32 la sol fa mi4 r8 r32 fa mi re
    do4 r r2
    R1*16

    %60
    do8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa\mbreak mi mi mi mi

    %63
    fa fa fa fa sol sol sol sol
    sol' r32 fa mi re do8 r32 si la sol fa4 r
    R1*3

    %68
    r4 r8 r16 mi'\parenthesize \f fa4 re
    mi1\fermata

}


IobIIn = \relative do'' {

    mi8.[mi16 do8. do16] sol4 r8 r32 si do re
    mi8.[mi16 do8. do16] sol4 r8 r32 si do re
    mi8.[mi16 sol,8. sol16] fa4 r8r32 fa sol la

    %4
    re,8.[re16 re8. re16] do4 \parenthesize do
    R1*4
    mi'8.[mi16 mi8. fa16] re8.[re16 re8. mi16]

    %10
    do8.[do16 do8. re16] si4 r
    R1*2
    sol'8\parenthesize \f r32 fa mi re do8 r32 si la sol fa4 r

    %14
    R1*3
    r2 r4 r8 r16 do'
    re4 si do r8 do

    %19
    fa, fa re' re sol, sol mi' mi
    la, la fa' fa si, do r r16 fad,
    sol4 sol do, r
    do'8\parenthesize \p do do do si si si si

    %23
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    do' do do do mi, mi mi mi

    %26
    fa fa fa fa sol sol sol sol
    mi'\parenthesize \f mi do do sol sol mi mi
    R1*5

    %33
    r2 r4 r8 r16 do'
    re4 si do8 sol mi do
    r2 r4 r8 do'

    %36
    re[do re do16 si] do8 sol mi do
    R1
    do'8 do do do si si si si

    %39
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol

    %42
    sol'4 r8 r32 la sol fa mi4 r8 r32 fa mi re
    do4 r r2
    R1*16

    %60
    do8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa\mbreak mi mi mi mi

    %63
    fa fa fa fa sol sol sol sol
    sol' r32 fa mi re do8 r32 si la sol fa4 r
    R1*3

    %68
    r4 r8 r16 do'\f re4 si
    do1\fermopz

}


IvlIn = \relative do'' {

    sol'8. [sol16 mi8. mi16] do4 r8 r32 re mi fa
    sol8. [sol16 mi8. mi16] do4 r8 r32 re mi fa
    sol8.[sol16 do,8. do16] la4 r8 r32 la si do

    %4
    sol8.[sol16 fa8. fa16] mi4 do
    R1*4
    sol''8.[sol16 sol8. la16] fa8.[fa16 fa8. sol16]

    %10
    mi8.[mi16 mi8. fad?16] re4 r
    R1*2
    sol8\parenthesize \f r32 fa mi re do8 r32 si la sol fa4 r

    %14
    r2\mbreak r4 r8 r16 mib'\p
    fa8.[fa16 re8. re16] mib4 r
    r2 r4 r8 r16 mib\p

    %17
    fa8.[fa16 re8. re16] mib4 r8 r16 mi\f
    fa4 re do r8 do
    fa,-. fa-. re'-. re-. sol, sol mi' mi

    %20
    la, la fa' fa si,8-. do-. r r16 fad,
    sol4 sol, do r
    do'8\p do do do si si si si

    %23
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    do' do do do mi, mi mi mi

    %26
    fa fa fa fa sol sol sol sol
    sol'\f sol mi mi do do sol sol
    R1*5

    %33
    r2 r4 r8 r16 mi'
    fa4 re mi8 sol, mi do
    r2 r4 r8 mi'

    %36
    fa[mi fa mi16 re] mi8 sol, mi do
    R1
    do'8 do do do si si si si

    %39
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol

    %42
    sol'4 r8 r32 la sol fa mi4 r8 r32 fa mi re
    do4 r mib,8\p mib mib mib
    fa fa fa fa sol, sol sol sol

    %45
    do' [do sol sol mib mib do do]\mbreak
    fad fad fad fad fad fad fad fad
    sol sol re re si si sol sol

    %48
    do do do do do do do do
    fa? fa fa fa fa fa fa fa
    sib, sib sib sib sib sib sib sib

    %51
    mib mib mib mib mib mib mib mib
    lab, lab lab lab lab lab lab lab
    fa' fa fa fa fad fad fad fad

    %54
    sol, sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %57
    sol sol sol sol sol sol sol sol
    do do do do sol sol sol sol
    do' do sol sol mib mib do do

    %60
    do' do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa\mbreak mi mi mi mi

    %63
    fa fa fa fa sol sol sol sol
    sol' r32 fa mi re do8 r32 si la sol fa4 r
    r4 r8 r16 mib'\p fa8.[fa16 re8. re16]

    %66
    mib4 r r2
    r4 r8 r16 mib\p fa8.[fa16 re8. re16]
    mib4 r8 r16 mi\f fa4 re

    %69
    mi1\fermata

}

IvlIIn = \relative do'' {

    mi8.[mi16 do8. do16] sol4 r8 r32 si do re
    mi8.[mi16 do8. do16] sol4 r8 r32 si do re
    mi8.[mi16 sol,8. sol16] fa4 r8r32 fa sol la

    %4
    re,8.[re16 re8. re16] do4 sol
    R1*4
    mi''8.[mi16 mi8. fa16] re8.[re16 re8. mi16]

    %10
    do8.[do16 do8. re16] si4 r
    R1*2
    sol'8\parenthesize \f r32 fa mi re do8 r32 si la sol fa4 r

    %14
    r2\mbreak r4 r8 r16  do'\p
    re8.[re16 si8. si16] do4 r
    r2 r4 r8 r16 do\p

    %17
    re8.[re16 si8. si16] do4 r8 r16 do\f
    re4 si do r8 do
    fa,-. fa-. re'-. re-. sol, sol mi' mi

    %20
    la, la fa' fa si,8-. do-. r r16 fad,
    sol4 sol, do r
    do'8\p do do do si si si si

    %23
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    do' do do do mi, mi mi mi

    %26
    fa fa fa fa sol sol sol sol
    mi'8\f mi do do sol sol mi mi
    R1*5

    %33
    r2 r4 r8 r16 do'
    re4 si do8 sol mi do
    r2 r4 r8 do'

    %36
    re[do re do16 si] do8 sol mi do
    R1
    do'8 do do do si si si si

    %39
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol

    %42
    sol'4 r8 r32 la sol fa mi4 r8 r32 fa mi re
    do4 r mib,8\p mib mib mib
    fa fa fa fa sol, sol sol sol

    %45
    do' [do sol sol mib mib do do]\mbreak
    fad fad fad fad fad fad fad fad
    sol sol re re si si sol sol

    %48
    do do do do do do do do
    fa? fa fa fa fa fa fa fa
    sib, sib sib sib sib sib sib sib

    %51
    mib mib mib mib mib mib mib mib
    lab, lab lab lab lab lab lab lab
    fa' fa fa fa fad fad fad fad

    %54
    sol, sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %57
    sol sol sol sol sol sol sol sol
    do do do do sol sol sol sol
    do' do sol sol mib mib do do

    %60
    do' do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa\mbreak mi mi mi mi

    %63
    fa fa fa fa sol sol sol sol
    sol' r32 fa mi re do8 r32 si la sol fa4 r
    r4 r8 r16 do'\p re8.[re16 si8. si16]

    %66
    do4 r r2
    r4 r8 r16 do\p re8.[re16 si8. si16]
    do4 r8 r16 do\f re4 si

    %69
    do1\fermata

}

IvlaIn = \relative do' {

    do'8.[do16 sol8. sol16] mi4 r
    do'8.[do16 sol8. sol16] mi4 r
    sol8.[sol16 mi8. mi16] do4 r

    %4
    si8.[si16 si8. si16] sol4 mi
    R1*4
    sol'8.[sol16 do8. do16] fa,8.[fa16 si8. si16]

    %10
    mi,8.[mi16 la8. la16] re,4 r
    R1*2
    mi8 r sol r do,4 r

    %14
    r2 r4 r8 r16 sol'\p
    lab8.[lab16 sol8. sol16] sol4 r
    r2 r4 r8 r16 sol\p

    %17
    lab8.[lab16 sol8. sol16] sol4 r8 r16 sol\f
    la?4 sol mi r8 do'
    fa,-. fa-. re'-. re-. sol, sol mi' mi

    %20
    la, la fa' fa si,8-. do-. r r16 fad,
    sol4 sol, do r
    do'8\p do do do si si si si

    %23
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    do' do do do mi, mi mi mi

    %26
    fa fa fa fa sol sol sol sol
    do08\f do sol sol mi mi do do
    R1*5

    %33
    r2 r4 r8 r16 sol'
    la4 sol sol8 sol mi do
    r2 r4 r8 r16 sol'

    %36
    la8 sol la sol sol sol mi do
    R1
    do'8 do do do si si si si

    %39
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol

    %42
    mi4 r sol r
    mi r mib 8\p mib mib mib
    fa fa fa fa sol, sol sol sol

    %45
    do' [do sol sol mib mib do do]\mbreak
    fad fad fad fad fad fad fad fad
    sol sol re re si si sol sol

    %48
    do do do do do do do do
    fa? fa fa fa fa fa fa fa
    sib, sib sib sib sib sib sib sib

    %51
    mib mib mib mib mib mib mib mib
    lab, lab lab lab lab lab lab lab
    fa' fa fa fa fad fad fad fad

    %54
    sol, sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %57
    sol sol sol sol sol sol sol sol
    do do do do sol sol sol sol
    do' do sol sol mib mib do do

    %60
    do' do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa\mbreak mi mi mi mi

    %63
    fa fa fa fa sol sol sol sol
    mi r sol r do,4 r
    r r8 r16 sol'\p lab8.[lab16 sol8. sol16]

    %66
    sol4 r r2
    r4 r8 r16 sol\p lab8.[lab16 sol8. sol16]
    sol4 r8 r16 sol\f la4 sol

    %69
    sol1\fermata

}

IsopranoIn = \relative do'' {

    \autoBeamOff
    R1*21
    mi1
    mi

    %24
    mi
    mi2. mi4
    la, fa' re4.\tr do8

    %27
    do1
    R1*5
    r2 r4 r8 r16 mi

    %34
    fa4 re mi r
    r2 r4 r8 do
    re do re do16[si] do4 r

    %37
    R1
    mi2 mi
    mi mi

    %40
    mi mi
    do4 fa re2\tr
    mi r

    %43
    r do
    re si
    do r4 mib\mbreak

    %46
    re mib re (do8\tr) si
    si1
    mib4 mib mib mib

    %49
    mib?8 [re do si!] do2
    re4 re re re
    re8 [do sib? la] sib2

    %52
    do1
    reb2 do
    si!4 re do2~

    %55
    do4 mib re fa
    mib si! do2~
    do4 mib re fa

    %58
    mib re8[do] si2\tr
    do1
    mi?2 mi

    %61
    mi mi
    mi\mbreak mi
    re4 fa re2\tr

    %64
    mi r
    R1*5

}

ItestoI = \lyricmode {

        Be -- a -- tus vir qui ti -- met Do -- mi -- num,

        Be -- atus _ vir qui timet _  Do -- minum, _

        in man -- da -- tis e -- jus volet _ ni -- mis.

        Be -- a -- tus vir qui ti -- met Domi - num,

        in man -- da -- tis e -- jus  in man -- da -- tis e -- jus

        vo - - - - - - - - - - - - - - - let ni -- mis,

        in man -- da -- tis e -- jus vo -- let ni -- mis.

}

IaltoIn = \relative do' {

    \autoBeamOff
    R1*21
    %\clef soprano
    do'1
    do

    %24
    do
    do2. do4
    re4 do si4.\tr do8

    %27
    do1
    R1*5
    %\clef alto
    r2 r4 r8 r16 sol

    %34
    la4 sol sol r
    r2 r4 r8 mi
    fa mi fa mi16[re] mi4 r

    %37
    R1
    do'2 do
    do do

    %40
    do do
    la4 do si2\tr
    do r

    %43
    r sol
    lab re,
    mib  r4 sol\mbreak

    %46
    la!4 la la la
    re,1
    R

    %49
    lab'4 lab lab lab
    lab?8[sol fa mi] fa2
    sol4 sol sol sol

    %52
    fa2 fa
    lab la
    re,4 fa mib2~

    %55
    mib4 sol fa lab
    sol fa mib2~
    mib4 sol fa lab

    %58
    sol fa8[mib] re2
    mib1
    do'2 do

    %61
    do do
    do\mbreak do
    la4 do si2\tr

    %64
    do r
    R1*5

}

ItestoII = \lyricmode {

    Be -- a -- tus vir qui ti -- met Do -- mi -- num,

    Be -- atus _ vir qui timet _  Do -- minum, _

        in man -- da -- tis e -- jus volet _ ni -- mis.

        Be -- a -- tus vir qui ti -- met Domi - num,

        in man -- da -- tis e -- jus  in man -- da -- tis e -- jus

        vo - - - - - - - - - - - - - - let ni -- mis,

        in man -- da -- tis e -- jus vo -- let ni -- mis.

}

ItenoreIn = \relative do' {

    \autoBeamOff

    R1*32
    r2 r4 r8 r16 do
    re4 si do r

    %35
    r2 r4 r8 sol
    la sol la sol sol4 r
    R1

    %38
    mi'2 re
    do si
    la sol

    %41
    la4 la si2
    sol r
    R1*17

    %60
    mi'2 re
    do si
    la\mbreak sol

    %63
    la4 la si2
    sol r
    R1*5

}

ItestoIII = \lyricmode {

    Be -- atus _ vir qui timet _  Do -- minum, _

    in man -- da -- tis e -- jus volet _ ni -- mis,

    in man -- da -- tis e -- jus volet _ ni -- mis.

}

IbassoIn = \relative do {

    \autoBeamOff

    R1*32
    r2 r4 r8 r16 do
    fa4 sol do, r

    %35
    r2 r4 r8 do
    fa do fa sol do,4 r
    R1
    do'2 si

    %38
    la2 sol
    fa mi

    %41
    fa4 fa sol2
    do, r
    R1*17

    %60
    do'2 si
    la sol
    fa\mbreak mi

    %63
    fa4 fa sol2
    do, r
    R1*5

}

ItestoIV = \lyricmode {

    Be -- atus _ vir qui timet _  Do -- minum, _

    in man -- da -- tis e -- jus volet _ ni -- mis,

     in man -- da -- tis e -- jus volet _ ni -- mis.



}

IbcIn = \relative do {

    do'8.[do16 do,8. do16] do4 r
    do'8.[do16 do,8. do16] do4 r
    do'8.[do16 do,8. do16] fa4 r

    %4
    sol8.[sol16 sol,8. sol16] do4 do,
    R1*4
    do''8.[do16 do8. la16] si8.[si16 si8. sol16]

    %10
    la8.[la16 la8. fad16] sol4 r
    R1*2
    do,8 r mi r fa4 r

    %14
    r2\mbreak r4 r8 r16 do\p^\markup\italic"Senza Org[ano]"
    fa8.[fa16 sol8. sol16] do,4 r
    r2 r4 r8 r16 do\p

    %17
    fa8.[fa16 sol8. sol16] do,4 r8 r16 do\f \tu
    fa4 sol do, r8 do'
    fa,-. fa-. re'-. re-. sol, sol mi' mi

    %20
    la, la fa' fa si,8-. do-. r r16 fad,
    sol4 sol, do r
    R1*5

    %27
    do'8 do do, do do do do do
    R1*5
    r2 r4 r8 r16 do

    %34
    fa4 sol do,8 sol' mi do
    r2 r4 r8 do
    fa do fa sol do,  sol' mi do

    %37
    R1
    do'8 do do do si si si si

    %39
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol

    %42
    do,4 r do r
    do r r2
    R1*16

    %60
    do'8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa\mbreak mi mi mi mi

    %63
    fa fa fa fa sol sol sol sol
    do, r mi r fa4 r
    r r8 r16 do\p ^\markup\italic"Senza Org." fa8.[fa16 sol8. sol16]

    %66
    do,4 r r2
    r4 r8 r16 do\p fa8.[fa16 sol8. sol16]
    do,4 r8 r16 do\f \tu fa4 sol

    %69
    do,1\fermata

}

IbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s4 <7> s2

}


IvlIIIn = \relative do'' {

    R1*4
    sol'8.[sol16 mi8. mi16] do4 r8 r32 re mi fa
    sol8.[sol16 mi8. mi16] do4 r8 r32 re mi fa

    %7
    sol8.[sol16 do,8. do16] la4 r8 r32 la si do
    sol8.[sol16 fa8. fa16] mi4 do
    R1*2

    %11
    sol'8.\pp[sol16 sol8. la16] fa8.[fa16 fa8. sol16]
    mi8.[mi16 mi8. fad?16] re4 r
    R1

    %14
    la''8\f r32 sol fad mi re8 r32 do si la\mbreak sol4 r
    r2 r4 r8 r16 mi'!\parenthesize \p
    fa4 re mi r

    %17
    r2 r4 r8 r16 mi\parenthesize \f
    fa4 re mi r8 do
    fa,-. fa-. re'-. re-. sol, sol mi' mi

    %20
    la, la fa' fa si,8-. do-. r r16 fad,
    sol4 sol, do r
    R1*6

    %28
    do'8\p do do do si si si si
    la la la la sol sol sol sol\mbreak
    fa fa fa fa mi mi mi mi

    %31
    do' do do do mi, mi mi mi
    fa fa fa fa sol sol sol sol
    sol'\f sol mi mi do do sol sol

    %34
    r2 r4 r8 r16 do
    re4 si do8 sol mi do
    r2 r4 r8 mi'

    %37
    fa[mi fa mi16 re]mi8 sol, mi do
    do'8 do do do si si si si

    %39
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol

    %42
    sol'4 r8 r32 la sol fa mi4 r8 r32 fa mi re
    do4 r r2
    R1*16

    %60
    do8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa\mbreak mi mi mi mi

    %63
    fa fa fa fa sol sol sol sol
    do,4 r la''8 r32 sol fad mi re8 r32 mi re do
    sol4 r r2

    %66
    r4 r8 r16 mi'?\parenthesize \p fa4 re
    mi r r2
    r4 r8 r16 mi\parenthesize \f fa4 re

    %69
    mi1\fermata

}

IvlIVn = \relative do'' {

    R1*4
    mi8.[mi16 do8. do16] sol4 r8 r32 si do re
    mi8.[mi16 do8. do16] sol4 r8 r32 si do re

    %7
    mi8.[mi16 sol,8. sol16] fa4 r8r32 fa sol la
    re,8.[re16 re8. re16] do4 sol
    R1*2

    %11
    mi'8.\pp[mi16 mi8. fa16] re8.[re16 re8. mi16]
    do8.[do16 do8. re16] si4 r
    R1

    %14
    la''8\f r32 sol fad mi re8 r32 do si la\mbreak sol4 r
    r2 r4 r8 r16 do\parenthesize \p
    re4 si do r

    %17
    r2 r4 r8 r16 do
    re4 si do r8 do
    fa,-. fa-. re'-. re-. sol, sol mi' mi

    %20
    la, la fa' fa si,8-. do-. r r16 fad,
    sol4 sol, do r
    R1*6

    %28
    do'8\p do do do si si si si
    la la la la sol sol sol sol\mbreak
    fa fa fa fa mi mi mi mi

    %31
    do' do do do mi, mi mi mi
    fa fa fa fa sol sol sol sol
    mi'8\f mi do do sol sol mi mi

    %34
    r2 r4 r8 r16 sol
    la4 sol sol8 sol mi do
    r2 r4 r8 do'

    %37
    re[do re do16 si] do8 sol mi do
    do'8 do do do si si si si

    %39
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol

    %42
    sol'4 r8 r32 la sol fa mi4 r8 r32 fa mi re
    do4 r r2
    R1*16

    %60
    do8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa\mbreak mi mi mi mi

    %63
    fa fa fa fa sol sol sol sol
    do,4 r la''8 r32 sol fad mi re8 r32 mi re do
    sol4 r r2

    %66
    r4 r8 r16 do\parenthesize \p re4 si
    do r r2
    r4 r8 r16 do\parenthesize \f re4 si

    %69
    do1\fermata

}

IvlaIIn = \relative do' {

    R1*4
    do'8.[do16 sol8. sol16] mi4 r
    do'8.[do16 sol8. sol16] mi4 r

    %7
    sol8.[sol16 mi8. mi16] do4 r
    si8.[si16 si8. si16] sol4 mi
    R1*2

    %11
    sol8.\pp[sol16 do8. do16] fa,8.[fa16 si8. si16]
    mi,8.[mi16 la8. la16] re,4 r
    R1

    %14
    fad'8\f r la r\mbreak re,4 r
    r2 r4 r8 r16 sol\parenthesize \p
    la4 sol sol r

    %17
    r2 r4 r8 r16 sol
    la4 sol sol r8 do
    fa,-. fa-. re'-. re-. sol, sol mi' mi

    %20
    la, la fa' fa si,8-. do-. r r16 fad,
    sol4 sol, do r
    R1*6

    %28
    do'8\p do do do si si si si
    la la la la sol sol sol sol\mbreak
    fa fa fa fa mi mi mi mi

    %31
    do' do do do mi, mi mi mi
    fa fa fa fa sol sol sol sol
    do8\f do sol sol mi mi do do

    %34
    r2 r4 r8 r16 mi
    fa4 re mi8 sol mi do
    r2 r4 r8 sol'

    %37
    la sol la sol sol sol mi do
    do' do do do si si si si

    %39
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol

    %42
    mi4 r sol r
    mi r r2
    R1*16

    %60
    do'8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa\mbreak mi mi mi mi

    %63
    fa fa fa fa sol sol sol sol
    do,4 r fad8 r la r
    re,4 r r2

    %66
    r4 r8 r16 sol\parenthesize \p  la4 sol
    sol r r2
    r4 r8 r16 sol\parenthesize \f la4 sol

    %69
    sol1\fermata

}

IsopranoIIn = \relative do'' {

    \autoBeamOff

    R1*27
    mi1
    mi\mbreak
    mi2 mi
    mi2. mi4
    la, fa' re2\tr
    do1
    r2 r4 r8 r16 do
    re4 si do r
    r2 r4 r8 do
    re8 do re do16[si] do4 r
    mi2 mi
    mi mi

    %40
    mi mi
    do4 fa re2\tr
    mi r

    %43
    R1*17
    mi?2 mi

    %61
    mi mi
    mi\mbreak mi
    re4 fa re2\tr

    %64
    mi r
    R1*5

}

ItestoV= \lyricmode {

    in man -- da -- tis e -- jus volet _ ni -- mis,

    Be -- atus _ vir qui timet _  Do -- minum, _

    in man -- da -- tis e -- jus volet _ ni -- mis,

    in man -- da -- tis e -- jus volet _ ni -- mis.

}

IaltoIIn = \relative do' {

    \autoBeamOff

    R1*27
    %\clef soprano
    do'1
    do\mbreak

    %30
    do2 do
    do2. do4
    re do si2\tr

    %33
    do1
    r2 r4 r8 r16 si
    do4 la si r

    %36
    r2 r4 r8 si
    do si do si16[la] si4 r
    %\clef alto
    do2 do

    %39
    do do
    do do
    la4 do si2\tr
    do r

    %43
    R1*17
    do2 do

    %61
    do do
    do\mbreak do
    la4 do si2\tr

    %64
    do r
    R1*5

}

ItestoVI = \lyricmode {

    in man -- da -- tis e -- jus volet _ ni -- mis,

    Be -- atus _ vir qui timet _  Do -- minum, _

    in man -- da -- tis e -- jus volet _ ni -- mis,

    in man -- da -- tis e -- jus volet _ ni -- mis.

}

ItenoreIIn = \relative do' {

    \autoBeamOff

    R1*33
    r2 r4 r8 r16 sol
    la4 sol sol r
    r2 r4 r8 sol
    do sol do re sol,4 r
    mi'2 re
    do si
    la sol

    %41
    la4 la si2
    sol r
    R1*17

    %60
    mi'2 re
    do si
    la\mbreak sol

    %63
    la4 la si2
    sol r
    R1*5

}

ItestoVII = \lyricmode {

    Be -- atus _ vir qui timet _  Do -- minum, _

    in man -- da -- tis e -- jus volet _ ni -- mis,

    in man -- da -- tis e -- jus volet _ ni -- mis.

}

IbassoIIn = \relative do {

    \autoBeamOff

    R1*33
    r2 r4 r8 r16 do
    fa4 sol do, r
    r2 r4 r8 do
    fa do fa sol do,4 r
    do'2 si

    %38
    la2 sol
    fa mi

    %41
    fa4 fa sol2
    do, r
    R1*17

    %60
    do'2 si
    la sol
    fa\mbreak mi

    %63
    fa4 fa sol2
    do, r
    R1*5

}

ItestoVIII = \lyricmode {

    Be -- atus _ vir qui timet _  Do -- minum, _

    in man -- da -- tis e -- jus volet _ ni -- mis,

    in man -- da -- tis e -- jus volet _ ni -- mis.

}

IbcIIn = \relative do {

    R1*4
    do'8.[do16 do,8. do16] do4 r
    do'8.[do16 do,8. do16] do4 r

    %7
    do'8.[do16 do,8. do16] fa4 r
    sol8.[sol16 sol,8. sol16] do4 do,
    R1*2

    %11
    do'8.\pp^\markup\italic "Senza Organi"[do16 do8. la16] si8.[si16 si8. sol16]
    la8.[la16 la8. fad16] sol4 r
    R1

    %14
    re'8\f\tu r fad r\mbreak sol4 r
    r2 r4 r8 r16 do,
    fa4 sol do, r

    %17
    r2 r4 r8 r16 do
    fa4 sol do, r8 do'
    fa,-. fa-. re'-. re-. sol, sol mi' mi

    %20
    la, la fa' fa si,8-. do-. r r16 fad,
    sol4 sol, do r
    R1*11

    %33
    do'8\parenthesize \f [do do, do] do do do do
    r2 r4 r8 r16 do
    fa4 sol do,8 sol' mi do

    %36
    r2 r4 r8 do
    fa do fa sol do, sol' mi do
    do' do do do si si si si

    %39
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol

    %42
    do,4 r do r
    do r r2
    R1*16

    %60
    do'8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa\mbreak mi mi mi mi

    %63
    fa fa fa fa sol sol sol sol
    do,4 r  re8 r fad r
    sol4 r r2

    %66
    r4 r8 r16 do,\parenthesize \p fa4 sol
    do, r r2
    r4 r8 r16 do\parenthesize \f fa4 sol

    %69
    do,1\fermata

}

IbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*7
    s4 <7> s2
    s1*5
    <_+>1
    s1*49
    s2 <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 55
    s1*69
    \bar "|."

}

IobI = {
    \notypeset
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

IvlaI = {
    \clef alto
    <<\IvlaIn \forma>>

}

IsopranoI = {
    \new Voice = "beatus1"
    <<\IsopranoIn \forma>>
}

IaltoI = {
    \new Voice = "beatus2"
    <<\IaltoIn \forma>>
}

ItenoreI = {
    \new Voice = "beatus3"
    <<\ItenoreIn \forma>>
}

IbassoI = {
    \clef bass
    \new Voice = "beatus4"
    <<\IbassoIn \forma>>
}



IbcI = {
    \clef bass
    <<\IbcIn \forma \IbfIn>>
    \typeset
}

IvlIII = {
    <<\IvlIIIn \forma>>

}

IvlIV = {
    <<\IvlIVn \forma>>

}

IvlaII = {
    \clef alto
    <<\IvlaIIn \forma>>

}

IsopranoII= {
    \new Voice = "beatus5"
    <<\IsopranoIIn \forma>>
}

IaltoII= {
    \new Voice = "beatus6"
    <<\IaltoIIn \forma>>
}

ItenoreII = {
    \new Voice = "beatus7"
    <<\ItenoreIIn \forma>>
}

IbassoII = {
    \clef bass
    \new Voice = "beatus8"
    <<\IbassoIIn \forma>>
}



IbcII = {
    \clef bass
    <<\IbcIIn \forma \IbfIIn>>
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

    la8 mi do
    la4 la8
    do' la mi

    %4
    do4 do8
    la' sol16. fa32 mi16. re32
    do16. si32 la8 r

    %7
    la' si dod
    re16 re, re8 do'
    si16. la32 sol8 r

    %10
    sol la si\mbreak
    do16 do, do8 sib'
    la16 si! do8 re

    %13
    si sol do
    fa, re sol
    mi do do'

    %16
    fa, re sol
    mi do16. re32 mi16. fa32
    sol16. fa32 sol16. la32 si16. sol32

    %19
    do8 fa, sol
    do,4 r8
    la' mi do\mbreak

    %22
    la4 la8
    do' la mi
    do4 do8

    %25
    la' sol16 fa mi re
    do si la8 r
    la' si dod

    %28
    re16 re, re8 do'
    si16 la sol8 r
    sol la si\mbreak

    %31
    do16 do, do8 sib'
    la fa16 sol la sib
    do8 do, r

    %34
    do' la fa
    re sib' la
    do, la' sol

    %37
    sib, sol' fa
    la, fa' la
    sib mi, fa

    %40
    si! do fa,\mbreak
    do16. re32 mi16. fa32 sol16. la32
    sib8 la sol

    %43
    do fa,16. mi32 fa8
    si,! do4
    fa8 la do

    %46
    sib, sib' re
    do, mi fa
    sib do do,

    %49
    fa la do
    la16 sol fa8 r
    do' sib16  la sol fa

    %52
    mi re do8 r
    R4.
    la'8 sol fa

    %55
    do'16 sib la sol fa mib
    re8 do sib
    R4.*3

    %60
    do'8 fad, do'
    sib re re,\mbreak
    mi la, sol'

    %63
    fa la re,
    sold si mi,
    do' la mi

    %66
    do si la
    mi'4.
    la8 mi do

    %69
    la4 la8
    la' sol16 fa mi re
    do si la8 r

    %72
    la' si dod
    re16 re, re8 do'
    si16 la sol8 r

    %75
    do mi, do
    sol'4 sol8
    re' fa, re

    %78
    la'4 la8
    mi' sold, mi
    la la,16. si32 do16. re32

    %81
    mi16. re32 mi16. fad32 sold16. mi32
    la8 la,16. si32 do16. re32
    mi4.

    %84
    la8 do mi,\mbreak
    fa re' do
    mi, do' si

    %87
    re, si' la
    do, la' sol
    si, sol' fa

    %90
    la, fa' mi
    sold, fa' mi
    si' sold mi

    %93
    fab red la'
    sold fad16 mi la8
    re, mi4

    %96
    la,8 la la
    la la16. si32 do16. re32
    mi16. re32 mi16. fad32 sold16. mi32

    %99
    la16. si32 la16. sol?32 fa?16. mi32
    fa16. sol32 fa16. mi32 re16. do32
    re16. mi32 re16. do32 si16. la32

    %102
    mi'8 fad16. sold32 la8
    re, mi4\tr
    la,4.\fermata

}

IIvlaIn = \relative do' {

    la'8 mi do
    la4 la8
    do' la mi

    %4
    do4 do8
    la' sol16. fa32 mi16. re32
    do16. si32 la8 r

    %7
    la' si dod
    re16 re, re8 do'
    si16. la32 sol8 r

    %10
    sol la si\mbreak
    do16 do, do8 sib'
    la16 si! do8 re

    %13
    si sol do
    fa, re sol
    mi do do'

    %16
    fa, re sol
    mi do16. re32 mi16. fa32
    sol16. fa32 sol16. la32 si16. sol32

    %19
    do8 fa, sol
    do,4 r8
    la' mi do\mbreak

    %22
    la4 la8
    do' la mi
    do4 do8

    %25
    la' sol16 fa mi re
    do si la8 r
    la' si dod

    %28
    re16 re, re8 do'
    si16 la sol8 r
    sol la si\mbreak

    %31
    do16 do, do8 sib'
    la fa16 sol la sib
    do8 do, r

    %34
    do' la fa
    re sib' la
    do, la' sol

    %37
    sib, sol' fa
    la, fa' la
    sib mi, fa

    %40
    si! do fa,\mbreak
    do16. re32 mi16. fa32 sol16. la32
    sib8 la sol

    %43
    do fa,16. mi32 fa8
    si,! do do,
    fa la' do

    %46
    sib, sib' re
    do, mi fa
    sib do do,

    %49
    fa la do
    la16 sol fa8 r
    do' sib16  la sol fa

    %52
    mi re do8 r
    R4.
    la'8 sol fa

    %55
    do'16 sib la sol fa mib
    re8 do sib
    R4.*3

    %60
    do'8 fad, do'
    sib re re,\mbreak
    mi la, sol'

    %63
    fa la re,
    sold si mi,
    do' la mi

    %66
    do si la
    mi'4.
    la8 mi do

    %69
    la4 la8
    la' sol16 fa mi re
    do si la8 r

    %72
    la' si dod
    re16 re, re8 do'
    si16 la sol8 r

    %75
    do mi, do
    sol'4 sol8
    re' fa, re

    %78
    la'4 la8
    mi' sold, mi
    la la,16. si32 do16. re32

    %81
    mi16. re32 mi16. fad32 sold16. mi32
    la8 la,16. si32 do16. re32
    mi4.

    %84
    la8 do mi,\mbreak
    fa re' do
    mi, do' si

    %87
    re, si' la
    do, la' sol
    si, sol' fa

    %90
    la, fa' mi
    sold, fa' mi
    si' sold mi

    %93
    fab red la'
    sold fad16 mi la8
    re, mi mi,

    %96
    la la la
    la la16. si32 do16. re32
    mi16. re32 mi16. fad32 sold16. mi32

    %99
    la16. si32 la16. sol?32 fa?16. mi32
    fa16. sol32 fa16. mi32 re16. do32
    re16. mi32 re16. do32 si16. la32

    %102
    mi'8 fad16. sold32 la8
    re, mi4\tr
    la,4.\fermata



}

IIbassoIn = \relative do {

    \autoBeamOff
    R4.*20
    la'8 mi do\mbreak

    %22
    la4 la8
    do' la mi
    do4 do8

    %25
    la' sol16 [fa] mi re
    do [si] la8 r
    la' [si] dod

    %28
    re16 re, re8 do'
    si16 [la] sol8 r
    sol [la] si\mbreak

    %31
    do16 do, do8 sib'
    la [fa16 sol la sib]
    do8 do, r

    %34
    do' la fa
    re [sib' la]
    do, [la' sol]

    %37
    sib, [sol' fa]
    la, [fa' la]
    sib [mi, fa]

    %40
    si! [do fa,]\mbreak
    do16. [re32 mi16. fa32 sol16. la32]
    sib8 [la sol]

    %43
    do fa,16. mi32 fa8
    si,! do4
    fa, r8

    %46
    R4.*3
    fa'8 la do
    la16 [sol] fa8 r
    do' sib16  [la] sol fa

    %52
    mi [re] do8 r
    R4.
    la'8 [sol] fa

    %55
    do'16 sib la [sol] fa [mib]
    re8 [do] sib
    R4.*3

    %60
    do'8 fad, do'
    sib [re re,]\mbreak
    mi [la, sol']

    %63
    fa [la re,]
    sold [si mi,]
    do' [la mi]

    %66
    do [si la]
    mi'4.
    la8 mi do

    %69
    la4 la8
    la' sol16 [fa] mi re
    do [si] la8 r

    %72
    la' [si] dod
    re16 re, re8 do'
    si16 [la] sol8 r

    %75
    do mi, do
    sol'4 sol8
    re' fa, re

    %78
    la'4 la8
    mi' sold, mi
    la [la,16. si32 do16. re32]

    %81
    mi16. [re32 mi16. fad32 sold16. mi32]
    la8 [la,16. si32 do16. re32]
    mi4.

    %84
    la8 do mi,\mbreak
    fa [re' do]
    mi, [do' si]

    %87
    re, [si' la]
    do, [la' sol]
    si, [sol' fa]

    %90
    la, [fa' mi]
    sold, [fa' mi]
    si' [sold mi]

    %93
    fab [red la']
    sold fad16 mi la8
    re, mi4\tr

    %96
    la,4.
    la8 la16. [si32] do16. [re32]
    mi16. [re32 mi16. fad32 sold16. mi32]

    %99
    la16. [si32 la16. sol?32 fa?16. mi32]
    fa16. [sol32 fa16. mi32 re16. do32]
    re16. [mi32 re16. do32 si16. la32]

    %102
    mi'8 fad16. sold32 la8
    re, mi4\tr
    la,4.\fermata

}

IItestoIV = \lyricmode {

        Po -- tens in ter -- ra  po -- tens in ter -- ra erit _ semen _ e -- jus:

        gene - ra -- tio _ rec -- torum _ gene - ra -- tio _ rec -- to - rum bene - di -- ce - - - - - - - - tur,

        be -- ne -- di -- ce -- tur.

        Po -- tens in ter -- ra e -- rit semen _ e -- jus:

        gene - ra -- tio _ rec -- torum _ bene - di -- ce - - - - - tur.

        Po -- tens in ter -- ra e -- rit semen _ e -- jus:

        ge -- ne -- ra -- tio _ rec -- torum _ bene - di -- ce -- tur bene - di -- ce -- tur

        bene - di -- ce - - tur bene - di -- ce - - - - - - - - - tur

        be -- ne di -- ce -- tur be -- ne -- di -- ce - - - - tur be -- ne -- di --  ce -- tur.

}

IIbcIn = \relative do {

    la'8 mi do
    la4 la8
    do' la mi

    %4
    do4 do8
    la' sol16. fa32 mi16. re32
    do16. si32 la8 r

    %7
    la' si dod
    re16 re, re8 do'
    si16. la32 sol8 r

    %10
    sol la si\mbreak
    do16 do, do8 sib'
    la16 si! do8 re

    %13
    si sol do
    fa, re sol
    mi do do'

    %16
    fa, re sol
    mi do16. re32 mi16. fa32
    sol16. fa32 sol16. la32 si16. sol32

    %19
    do8 fa, sol
    do,4 r8
    la' mi do\mbreak

    %22
    la4 la8
    do' la mi
    do4 do8

    %25
    la' sol16 fa mi re
    do si la8 r
    la' si dod

    %28
    re16 re, re8 do'
    si16 la sol8 r
    sol la si\mbreak

    %31
    do16 do, do8 sib'
    la fa16 sol la sib
    do8 do, r

    %34
    do' la fa
    re sib' la
    do, la' sol

    %37
    sib, sol' fa
    la, fa' la
    sib mi, fa

    %40
    si! do fa,\mbreak
    do16. re32 mi16. fa32 sol16. la32
    sib8 la sol

    %43
    do fa,16. mi32 fa8
    si,! do do,
    fa la' do

    %46
    sib, sib' re
    do, mi fa
    sib do do,

    %49
    fa la do
    la16 sol fa8 r
    do' sib16  la sol fa

    %52
    mi re do8 r
    R4.
    la'8 sol fa

    %55
    do'16 sib la sol fa mib
    re8 do sib
    R4.*3

    %60
    do'8 fad, do'
    sib re re,\mbreak
    mi la, sol'

    %63
    fa la re,
    sold si mi,
    do' la mi

    %66
    do si la
    mi'4.
    la8 mi do

    %69
    la4 la8
    la' sol16 fa mi re
    do si la8 r

    %72
    la' si dod
    re16 re, re8 do'
    si16 la sol8 r

    %75
    do mi, do
    sol'4 sol8
    re' fa, re

    %78
    la'4 la8
    mi' sold, mi
    la la,16. si32 do16. re32

    %81
    mi16. re32 mi16. fad32 sold16. mi32
    la8 la,16. si32 do16. re32
    mi4.

    %84
    la8 do mi,\mbreak
    fa re' do
    mi, do' si

    %87
    re, si' la
    do, la' sol
    si, sol' fa

    %90
    la, fa' mi
    sold, fa' mi
    si' sold mi

    %93
    fab red la'
    sold fad16 mi la8
    re, mi mi,

    %96
    la la la
    la la16. si32 do16. re32
    mi16. re32 mi16. fad32 sold16. mi32

    %99
    la16. si32 la16. sol?32 fa?16. mi32
    fa16. sol32 fa16. mi32 re16. do32
    re16. mi32 re16. do32 si16. la32

    %102
    mi'8 fad16. sold32 la8
    re, mi4\tr
    la,4.\fermata

}

IIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*6
    s8 <6> <6 5>
    <_+> s <6 4+>
    s4.*2
    s4 <6 5>8
    s4.*15
    s8 <6> <6 5>
    <_+> s <6 4+>
    s4.*2
    s4 <6 4>8
    s4.*12
    <6 5>4.
    s4.*22
    <_+>4.
    s4.*4
    s8 <6> <6 5>
    <_+> s <6 4+>

}


IIvlIIIn = \relative do'' {

    R4.
    la8 mi do
    la4 la8
    do' la mi

    %5
    do4 do8
    la' sol16. fa32 mi16. re32
    do16. si32 la8 r

    %8
    re8 mi fad
    sol16 sol, sol8 fa'?
    do16. si32 la8 r\mbreak

    %11
    do re mi
    fa16 sol la8 re
    si sol do

    %14
    fa, re sol
    mi do do'
    fa, re sol

    %17
    mi do16. re32 mi16. fa32
    sol16. fa32 sol16. la32 si16. sol32
    do8 fa, sol

    %20
    do,4 r8
    R4.
    la'8 mi do\mbreak

    %23
    la4 la8
    do' la mi
    do4 do8

    %26
    la' sol16 fa mi re
    do si la8 r
    re mi fad

    %29
    sol16 sol, sol8 fa'?
    mi16 re do8 r\mbreak
    do re mi

    %32
    fa16 sol la8 fa
    mi re do
    do' la fa

    %35
    re sib' la
    do, la' sol

    %37
    sib, sol' fa
    la, fa' la
    sib mi, fa

    %40
    si! do fa,\mbreak
    do16. re32 mi16. fa32 sol16. la32
    sib8 la sol

    %43
    do fa,16. mi32 fa8
    si,! do4
    fa8 la do

    %46
    sib, sib' re
    do, mi fa
    sib do do,

    %49
    fa4 r8
    fa la do
    la16 sol fa8 r

    %52
    do' sib16  la sol fa
    mi re do8 r
    R4.*3

    %57
    sib'8 la sol
    re'16 do sib la sol fa
    mi8 re do

    %60
    do'8 fad, do'
    sib re re,\mbreak
    mi la, sol'

    %63
    fa la re,
    sold si mi,
    do' la mi

    %66
    do si la
    mi'4.
    R

    %69
    la8 mi do
    la4 la8
    la' sol16 fa mi re

    %72
    do si la8 r
    re mi fad
    sol16 sol, sol8 fa'?

    %75
    mi16 re do8 r
    sol' si,! sol
    re'4 re8

    %78
    la' do, la
    mi'4 mi8
    la la,16. si32 do16. re32

    %81
    mi16. re32 mi16. fad32 sold16. mi32
    la8 la,16. si32 do16. re32
    mi4.

    %84
    la8 do mi,\mbreak
    fa re' do
    mi, do' si

    %87
    re, si' la
    do, la' sol
    si, sol' fa

    %90
    la, fa' mi
    sold, fa' mi
    si' sold mi

    %93
    fab red la'
    sold fad16 mi la8
    re, mi mi,

    %96
    la la la
    la la16. si32 do16. re32
    mi16. re32 mi16. fad32 sold16. mi32

    %99
    la16. si32 la16. sol?32 fa?16. mi32
    fa16. sol32 fa16. mi32 re16. do32
    re16. mi32 re16. do32 si16. la32

    %102
    mi'8 fad16. sold32 la8
    re, mi4\tr
    la,4.\fermata

}

IIvlaIIn = \relative do' {

    R4.
    la'8 mi do
    la4 la8
    do' la mi

    %5
    do4 do8
    la' sol16. fa32 mi16. re32
    do16. si32 la8 r

    %8
    re8 mi fad
    sol16 sol, sol8 fa'?
    do16. si32 la8 r\mbreak

    %11
    do re mi
    fa16 sol la8 re
    si sol do

    %14
    fa, re sol
    mi do do'
    fa, re sol

    %17
    mi do16. re32 mi16. fa32
    sol16. fa32 sol16. la32 si16. sol32
    do8 fa, sol

    %20
    do,4 r8
    R4.
    la'8 mi do\mbreak

    %23
    la4 la8
    do' la mi
    do4 do8

    %26
    la' sol16 fa mi re
    do si la8 r
    re mi fad

    %29
    sol16 sol, sol8 fa'?
    mi16 re do8 r\mbreak
    do re mi

    %32
    fa16 sol la8 fa
    mi re do
    do' la fa

    %35
    re sib' la
    do, la' sol

    %37
    sib, sol' fa
    la, fa' la
    sib mi, fa

    %40
    si! do fa,\mbreak
    do16. re32 mi16. fa32 sol16. la32
    sib8 la sol

    %43
    do fa,16. mi32 fa8
    si,! do do,
    fa la' do

    %46
    sib, sib' re
    do, mi fa
    sib do do,

    %49
    fa,4 r8
    fa' la do
    la16 sol fa8 r

    %52
    do' sib16  la sol fa
    mi re do8 r
    R4.*3

    %57
    sib'8 la sol
    re'16 do sib la sol fa
    mi8 re do

    %60
    do'8 fad, do'
    sib re re,\mbreak
    mi la, sol'

    %63
    fa la re,
    sold si mi,
    do' la mi

    %66
    do si la
    mi'4.
    R

    %69
    la8 mi do
    la4 la8
    la' sol16 fa mi re

    %72
    do si la8 r
    re mi fad
    sol16 sol, sol8 fa'?

    %75
    mi16 re do8 r
    sol' si,! sol
    re'4 re8

    %78
    la' do, la
    mi'4 mi8
    la la,16. si32 do16. re32

    %81
    mi16. re32 mi16. fad32 sold16. mi32
    la8 la,16. si32 do16. re32
    mi4.

    %84
    la8 do mi,\mbreak
    fa re' do
    mi, do' si

    %87
    re, si' la
    do, la' sol
    si, sol' fa

    %90
    la, fa' mi
    sold, fa' mi
    si' sold mi

    %93
    fab red la'
    sold fad16 mi la8
    re, mi mi,

    %96
    la la la
    la la16. si32 do16. re32
    mi16. re32 mi16. fad32 sold16. mi32

    %99
    la16. si32 la16. sol?32 fa?16. mi32
    fa16. sol32 fa16. mi32 re16. do32
    re16. mi32 re16. do32 si16. la32

    %102
    mi'8 fad16. sold32 la8
    re, mi4\tr
    la,4.\fermata

}

IIbassoIIn = \relative do {

    \autoBeamOff

    R4.*21
    la'8 mi do\mbreak

    %23
    la4 la8
    do' la mi
    do4 do8

    %26
    la' sol16 [fa] mi re
    do [si] la8 r
    re [mi] fad

    %29
    sol16 sol, sol8 fa'?
    mi16 [re] do8 r\mbreak
    do [re] mi

    %32
    fa16 sol la8 fa
    mi [re] do
    do' la fa

    %35
    re [sib' la]
    do, [la' sol]

    %37
    sib, [sol' fa]
    la, [fa' la]
    sib [mi, fa]

    %40
    si! [do fa,]\mbreak
    do16. [re32 mi16. fa32 sol16. la32]
    sib8 [la sol]

    %43
    do fa,16. mi32 fa8
    si,! do4
    fa, r8
    R4.*4
    fa' 8la do
    la16 [sol] fa8 r

    %52
    do' sib16 [la] sol fa
    mi [re] do8 r
    R4.*3

    %57
    sib'8 [la] sol
    re'16 do sib [la] sol [fa]
    mi8 [re] do

    %60
    do'8 fad, do'
    sib [re re,]\mbreak
    mi [la, sol']

    %63
    fa [la re,]
    sold [si mi,]
    do'[la mi]

    %66
    do [si la]
    mi'4.
    R

    %69
    la8 mi do
    la4 la8
    la' sol16 [fa] mi re

    %72
    do [si] la8 r
    re [mi] fad
    sol16 sol, sol8 fa'?

    %75
    mi16 [re] do8 r
    sol' si,! sol
    re'4 re8

    %78
    la' do, la
    mi'4 mi8
    la la,16. [si32] do16. [re32]

    %81
    mi16. [re32 mi16. fad32 sold16. mi32]
    la8 [la,16. si32 do16. re32]
    mi4.

    %84
    la8 do mi,\mbreak
    fa [re' do]
    mi, [do' si]

    %87
    re, [si' la]
    do, [la' sol]
    si, [sol' fa]

    %90
    la, [fa' mi]
    sold, [fa' mi]
    si' [sold mi]

    %93
    fab [red la']
    sold fad16 mi la8
    re, mi4\tr

    %96
    la,4.
    la8 la16. [si32] do16. [re32]
    mi16. [re32 mi16. fad32 sold16. mi32]

    %99
    la16. [si32 la16. sol?32 fa?16. mi32]
    fa16. [sol32 fa16. mi32 re16. do32]
    re16. [mi32 re16. do32 si16. la32]

    %102
    mi'8 fad16. sold32 la8
    re, mi4\tr
    la,4.\fermata

}

IItestoVIII = \lyricmode {

    Po -- tens in ter -- ra  po -- tens in ter -- ra erit _ semen _ e -- jus:

        gene - ra -- tio _ rec -- torum _ ge -- ne -- ra -- tio _ rec -- to -- rum be -- ne -- di -- ce - - - - - - - - tur,

        be -- ne -- di -- ce -- tur.

        Po -- tens in ter -- ra e -- rit semen _ e -- jus:

        gene - ra -- tio _ rec -- torum _ bene - di -- ce - - - - - tur.

        Po -- tens in ter -- ra e -- rit semen _ e -- jus:

        ge -- ne -- ra -- tio _ rec -- torum _ bene - di -- ce -- tur bene - di -- ce -- tur

        be -- ne -- di -- ce - tur bene - di -- ce - - - - - - - - - tur

        be -- ne di -- ce -- tur be -- ne -- di -- ce - - - - tur be -- ne -- di --  ce -- tur.

}

IIbcIIn = \relative do {

    R4.
    la'8 mi do
    la4 la8
    do' la mi

    %5
    do4 do8
    la' sol16. fa32 mi16. re32
    do16. si32 la8 r

    %8
    re8 mi fad
    sol16 sol, sol8 fa'?
    do16. si32 la8 r\mbreak

    %11
    do re mi
    fa16 sol la8 re
    si sol do

    %14
    fa, re sol
    mi do do'
    fa, re sol

    %17
    mi do16. re32 mi16. fa32
    sol16. fa32 sol16. la32 si16. sol32
    do8 fa, sol

    %20
    do,4 r8
    R4.
    la'8 mi do\mbreak

    %23
    la4 la8
    do' la mi
    do4 do8

    %26
    la' sol16 fa mi re
    do si la8 r
    re mi fad

    %29
    sol16 sol, sol8 fa'?
    mi16 re do8 r\mbreak
    do re mi

    %32
    fa16 sol la8 fa
    mi re do
    do' la fa

    %35
    re sib' la
    do, la' sol

    %37
    sib, sol' fa
    la, fa' la
    sib mi, fa

    %40
    si! do fa,\mbreak
    do16. re32 mi16. fa32 sol16. la32
    sib8 la sol

    %43
    do fa,16. mi32 fa8
    si,! do do,
    fa la' do

    %46
    sib, sib' re
    do, mi fa
    sib do do,

    %49
    fa,4 r8
    fa' la do
    la16 sol fa8 r

    %52
    do' sib16  la sol fa
    mi re do8 r
    R4.*3

    %57
    sib'8 la sol
    re'16 do sib la sol fa
    mi8 re do

    %60
    do'8 fad, do'
    sib re re,\mbreak
    mi la, sol'

    %63
    fa la re,
    sold si mi,
    do' la mi

    %66
    do si la
    mi'4.
    R

    %69
    la8 mi do
    la4 la8
    la' sol16 fa mi re

    %72
    do si la8 r
    re mi fad
    sol16 sol, sol8 fa'?

    %75
    mi16 re do8 r
    sol' si,! sol
    re'4 re8

    %78
    la' do, la
    mi'4 mi8
    la la,16. si32 do16. re32

    %81
    mi16. re32 mi16. fad32 sold16. mi32
    la8 la,16. si32 do16. re32
    mi4.

    %84
    la8 do mi,\mbreak
    fa re' do
    mi, do' si

    %87
    re, si' la
    do, la' sol
    si, sol' fa

    %90
    la, fa' mi
    sold, fa' mi
    si' sold mi

    %93
    fab red la'
    sold fad16 mi la8
    re, mi mi,

    %96
    la la la
    la la16. si32 do16. re32
    mi16. re32 mi16. fad32 sold16. mi32

    %99
    la16. si32 la16. sol?32 fa?16. mi32
    fa16. sol32 fa16. mi32 re16. do32
    re16. mi32 re16. do32 si16. la32

    %102
    mi'8 fad16. sold32 la8
    re, mi4\tr
    la,4.\fermata

}

IIbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*7
    s4 <6 5>8
    s4 <6 4>8
    s4.
    s4 <6 5->8
    s4.*16
    s4 <6 5>8
    s4.*2
    s4 <6 5->8
    s4 <6 4!>8
    s4.*11
    <6 5>4.
    s4.*22
    <_+>4.
    s4.*6
    s4 <6 4>8

}


forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key la\minor
    \tempo 4. = 45
    s4.*104
    \bar "|."

}

IIvlI = {
    \notypeset
    <<\IIvlIn \forma>>

}

IIvlaI = {
    \clef alto
    <<\IIvlaIn \forma>>

}

IIbassoI = {
    \clef bass
    \new Voice = "potens4"
    <<\IIbassoIn \forma>>
}

IIbcI = {
    \clef bass
    <<\IIbcIn \forma \IIbfIn>>
    \typeset
}

IIvlIII = {
    <<\IIvlIIIn \forma>>

}

IIvlaII = {
    \clef alto
    <<\IIvlaIIn \forma>>

}

IIbassoII = {
    \clef bass
    \new Voice = "potens8"
    <<\IIbassoIIn \forma>>
}

IIbcII = {
    \clef bass
    <<\IIbcIIn \forma \IIbfIIn>>
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



IIIobIn = \relative do'' {

    do8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol
    do do sol sol mi mi do do
    do' do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol
    do,1\fermata

}


IIIvlIn = \relative do'' {

    do8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol
    do do sol sol mi mi do do
    do' do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol
    do,1\fermata

}

IIIvlaIn = \relative do' {

    do'8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol
    do do sol sol mi mi do do
    do' do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol
    do,1\fermata

}

IIIsopranoIn = \relative do'' {

    \autoBeamOff
    mi1
    mi2 mi
    mi2.  mi4
    re fa re4. do8
    do1
    mi2 mi
    mi mi
    mi mi
    re4 fa re2
    mi1\fermata

}

IIItestoI = \lyricmode {

    Be -- a -- tus  vir qui ti -- met  Do -- mi -- num,

    in man -- da -- tis e -- jus vo -- let ni -- mis.

}

IIIaltoIn = \relative do' {

    \autoBeamOff
    sol'1
    sol2 sol
    sol2. sol4
    la do sol4. sol8
    sol1
    sol2 sol
    sol sol
    sol sol
    la4 do sol2
    sol1\fermata

}

IIItestoII = \lyricmode {

    Be -- a -- tus  vir qui ti -- met  Do -- mi -- num,

    in man -- da -- tis e -- jus vo -- let ni -- mis.

}

IIItenoreIn = \relative do' {

    \autoBeamOff

    do1
    do2 do
    do2. do4
    do do si4. si8
    do1
    do2 do
    do do
    do do
    do4 do si2
    do1\fermata

}

IIItestoIII = \lyricmode {

    Be -- a -- tus  vir qui ti -- met  Do -- mi -- num,

    in man -- da -- tis e -- jus vo -- let ni -- mis.

}

IIIbassoIn = \relative do {

    \autoBeamOff
    do'2 si
    la sol
    fa mi
    fa sol4. sol8
    do,1
    do'2 si
    la sol
    fa mi
    fa4 fa sol2
    do,1\fermata

}

IIItestoIV = \lyricmode {

    Be -- a -- tus  vir qui ti -- met  Do -- mi -- num,

    in man -- da -- tis e -- jus vo -- let ni -- mis.

}

IIIbcIn = \relative do {

    do'8 do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol
    do do sol sol mi mi do do
    do' do do do si si si si
    la la la la sol sol sol sol
    fa fa fa fa mi mi mi mi
    fa fa fa fa sol sol sol sol
    do,1\fermata

}

IIIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*10
    \bar "|."

}

IIIobI = {
    \notypeset
    <<\IIIobIn \forma>>

}

IIIvlI = {
    <<\IIIvlIn \forma>>

}

IIIvlaI = {
    \clef alto
    <<\IIIvlaIn \forma>>

}

IIIsopranoI = {
    \new Voice = "vir1"
    <<\IIIsopranoIn \forma>>
}

IIIaltoI = {
    \new Voice = "vir2"
    <<\IIIaltoIn \forma>>
}

IIItenoreI = {
    \new Voice = "vir3"
    <<\IIItenoreIn \forma>>
}

IIIbassoI = {
    \clef bass
    \new Voice = "vir4"
    <<\IIIbassoIn \forma>>
}



IIIbcI = {
    \clef bass
    <<\IIIbcIn \forma \IIIbfIn>>
    \typeset
}



IVvlIn = \relative do'' {

    la16 sold la si la si do re
    mi re mi fa mi re do si
    la8 sol16 fa mi8 re'

    %4
    do[si16 la si8 mi,]
    do'16[si la sold la si do re]
    mi8 mi, r4

    %7
    R2*6
    mi'16 re dod si la mi' fa sol
    fa mi re dod re4

    %15
    R2*2
    re16 do si la sol re' mi fa
    mi re do si do4

    %19
    R2*2\mbreak
    do16 re mi re do si la sol
    la do fa mi re do si la

    %23
    si do re mi fa la sol fa
    mi8[re16 do re8 si]
    do4 r

    %26
    R2*4
    la16 \p^\markup\italic"Violini Soli"  sold la si do si do re
    mi re mi fa mi re do si

    %32
    la8 [sol16 fa mi8 re']
    do [si16 la si8 mi,]  %% controllo fin qui
    do'16 si la sold la si do re

    %35
    mi8 mi, r4
    R2*6 %% segue con la parte
    mi'16 re dod si la dod re mi

    %43
    fa mi re dod re4
    R2*2
    re16 do? si la sol re' mi fa

    %47
    mi re do si do4
    R2*2
    do8 do4 do8

    %51
    do do4 do8
    do16[re mi re do si la sol]
    la[do fa mi re do si la]

    %54
    si[do re do si la sol fa]\mbreak
    mi8 [sol do fa]
    mi re16 do re8. do16

    %57
    do4 r
    R2*6
    mi16\f^\markup\italic"Haut. e Violini"  re mi fa mi fa sol mi

    %65
    re do re mi re mi fa re
    mi8[do re si]
    do[sol mi do]

    %68
    sol'16\p^\markup\italic"Senza Hautbois" fa sol la sol la si sol
    do si do re do re mi do
    si do re do si la sol fa

    %71
    mi8[sol do re]
    mi16 re do si do re mi fa\mbreak
    sol8 sol, r4

    %74
    R2*6
    mi'16 re do si la dod re mi
    fa mi re dod re4

    %82
    R2*2
    re16 do? si la sol si do re
    mi re do si do4

    %86
    R2*2
    la8 la4 la8
    la la4 la8

    %90
    la16 si do re mi re do si\mbreak
    la si do re mi do si la
    mi'8. mi,16 mi4

    %93
    R2*5
    mi'8 mi,4 mi8
    fa16[re mi fa sol la si do]

    %100
    re do si la si la sold fad
    sold[mi fad sold la si do re]
    mi re do si do si la sold

    %103
    la do si la si re do si
    do mi re do re fa mi re
    mi8[sold, la re]

    %106
    do[si 16 la] si8.\tr la16
    la4 r\mbreak
    R2*8

    %116
    la16 si do re mi re do si
    la4 r
    la16 do si la si re do si

    %119
    do mi re do re fa mi re
    mi8[sold, la re]
    do si16 la si8. la16

    %122
    la4 r
    R2*3
    mi'16\parenthesize \f ^\markup\italic"Vio. e Haut." re mi fa mi re mi fa

    %127
    re do re mi re do re mi
    do8[la' si sold]
    la2\fermata

}


IVvlIIn = \relative do'' {

    la16 sold la si la si do re
    mi re mi fa mi re do si
    la8 sol16 fa mi8 re'

    %4
    do[si16 la si8 mi,]
    do'16[si la sold la si do re]
    mi8 mi, r4

    %7
    R2*6
    mi'16 re dod si la mi' fa sol
    fa mi re dod re4

    %15
    R2*2
    re16 do si la sol re' mi fa
    mi re do si do4

    %19
    R2*2\mbreak
    do16 re mi re do si la sol
    la do fa mi re do si la

    %23
    si do re mi fa la sol fa
    mi8[re16 do re8 si]
    do4 r

    %26
    R2*4
    la16 \p  sold la si do si do re
    mi re mi fa mi re do si

    %32
    la8 [sol16 fa mi8 re']
    do [si16 la si8 mi,]
    do'16 si la sold la si do re

    %35
    mi8 mi, r4
    R2*6 %% segue con la parte
    mi'16 re dod si la dod re mi

    %43
    fa mi re dod re4
    R2*2
    re16 do? si la sol re' mi fa

    %47
    mi re do si do4
    R2*2
    do8 do4 do8

    %51
    do do4 do8
    do16[re mi re do si la sol]
    la[do fa mi re do si la]

    %54
    si[do re do si la sol fa]\mbreak
    mi8 [sol do fa]
    mi re16 do re8. do16

    %57
    do4 r
    R2*6
    do16\f  si do re do re mi do

    %65
    si la si do si do re si
    do8[mi fa re]
    do[sol mi do]

    %68
    sol'16\p fa sol la sol la si sol
    do si do re do re mi do
    si do re do si la sol fa

    %71
    mi8[sol do re]
    mi16 re do si do re mi fa\mbreak
    sol8 sol, r4

    %74
    R2*6
    mi'16 re do si la dod re mi
    fa mi re dod re4

    %82
    R2*2
    re16 do? si la sol si do re
    mi re do si do4

    %86
    R2*2
    la8 la4 la8
    la la4 la8

    %90
    la16 si do re mi re do si\mbreak
    la si do re mi do si la
    mi'8. mi,16 mi4

    %93
    R2*5
    mi'8 mi,4 mi8
    fa16[re mi fa sol la si do]

    %100
    re do si la si la sold fad
    sold[mi fad sold la si do re]
    mi re do si do si la sold

    %103
    la do si la si re do si
    do mi re do re fa mi re
    mi8[sold, la re]

    %106
    do[si 16 la] si8.\tr la16
    la4 r\mbreak
    R2*8

    %116
    la16 si do re mi re do si
    la4 r
    la16 do si la si re do si

    %119
    do mi re do re fa mi re
    mi8[sold, la re]
    do si16 la si8. la16

    %122
    la4 r
    R2*3
    do16\parenthesize \f  si do re do si do re

    %127
    si la si do si la si do
    la8[do re si]
    do2\fermata

}

IVvlaIn = \relative do' {

    do8 r do r
    si r si r
    re r si r

    %4
    mi r mi r
    mi r la r
    sold4 r

    %7
    R2*6
    dod,8 r mi r
    la4 r

    %15
    R2*2
    si,8 r re r
    sol4 r

    %19
    R2*2
    sol8 r sol r
    do, r la' r

    %23
    re, r si' r
    sol[sol la re,]
    mi4 r

    %26
    R2*4
    do8\p r do r
    si r si r

    %32
    re r si r
    mi r mi r
    mi r la r

    %35
    sold4 r
    R2*6
    dod,8 r mi r

    %43
    la4 r
    R2*2
    si,8 r re r

    %47
    sol4 r
    R2*2
    sol8 r sol r

    %51
    sol r sol r
    sol r sol r
    do, r la' r

    %54
    re, r sol r\mbreak
    sol, r sol r
    sol do si4

    %57
    do r
    R2*6
    sol'8[sol sol sol]

    %65
    sol[sol sol sol]
    sol[sol la sol]
    mi[sol mi do]

    %68
    mi\p r re r
    do r la' r
    re, r sol, r

    %71
    sol r mi' r
    sol r do r\mbreak
    si4 r

    %74
    R2*6
    dod,8 r mi r
    la4 r

    %82
    R2*2
    si,8 r re r
    sol4 r

    %86
    R2*2
    do,8 r do r
    do r do r

    %90
    do r si r\mbreak
    do r do r
    si4 r

    %93
    R2*5
    do8 r do r
    la r fa' r

    %100
    la r fad r
    si, r si r
    si' r sold r

    %103
    mi r mi r
    mi r la r
    sold[mi mi sold]

    %106
    mi r sold r
    mi4 r
    R2*8

    %116
    mi8 r si' r
    mi,4 r
    mi8 r mi r

    %119
    mi r la r
    sold[mi mi sold]
    mi r sold r

    %122
    mi4 r
    R2*3
    mi8\parenthesize \f  [mi mi mi]

    %127
    fa[fa sold sold]
    mi[mi fa mi]
    mi2\fermata

}

IVsopranoIn = \relative do'' {

    \autoBeamOff
    R2*29
    la16 [sold la si] do [si do re]
    mi [re mi fa] mi [re do si]

    %32
    la8 sol16 fa mi8 re'
    do si16 [la] si8 mi,
    do'16 [si la sold] la [si] do [re]

    %35
    mi8 mi, r4
    R2*6
    mi'16 [re] dod [si] la [dod] re mi

    %43
    fa [mi] re [dod] re4
    R2*2
    re16 [do?] si [la] sol [re'] mi fa

    %47
    mi [re] do [si] do4
    R2*2
    do8 do4 do8

    %51
    do do4 do8
    do16[re mi re do si la sol]
    la[do fa mi re do si la]

    %54
    si[do re do si la sol fa]\mbreak
    mi8 sol do fa
    mi re16 do re8. do16

    %57
    do4 r
    R2*10

    %68
    sol16 [fa sol la] sol [la si sol]
    do [si do re] do [re mi do]
    si [do] re [do] si [la] sol [fa]

    %71
    mi8 sol do re
    mi16 [re do si do re] mi [fa]\mbreak
    sol8 sol, r4

    %74
    R2*6  %%%%%%% fin qui!
    mi'16 [re] do [si] la [dod] re mi
    fa [mi re dod] re4

    %82
    R2*2
    re16 [do?] si [la] sol [si] do re
    mi [re do si] do4

    %86
    R2*2
    la8 la4 la8
    la la4 la8

    %90
    la16 [si do re] mi [re do si]\mbreak
    la [si do re] mi [do si la]
    mi'8. mi,16 mi4

    %93
    R2*5
    mi'8 mi,4 mi8
    fa16[re mi fa sol la si do]

    %100
    re [do si la] si [la sold fad]
    sold[mi fad sold la si do re]
    mi [re do si ]do [si la sold]

    %103
    la [do si la] si [re do si]
    do [mi re do] re [fa mi re]
    mi8 sold, la re

    %106
    do si 16 la si8.\tr la16
    la4 r\mbreak
    R2*8

    %116
    la16 [si do re] mi [re do si]
    la4 r
    la16 [do si la] si [re do si]

    %119
    do [mi re do] re [fa mi re]
    mi8[sold,] la re
    do si16 la si8. la16

    %122
    la4 r
    R2*7

}

IVtestoI = \lyricmode {

        Glo - - - - ria _ et di -- vi -- ti -- ae in do - mo e -- jus,

        et jus -- ti -- tia _ e - jus et jus -- ti -- tia _ e - jus ma -- net

        in sae -- cu -- lum sae - - - culi _ in sae -- cu -- lum sae -- culi. _

        Glo - - - ria _ et di -- vi -- ti -- ae in do -- mo e -- jus,

        et jus -- ti -- tia _ e -- jus et jus -- ti -- tia _ e -- jus ma -- net

        in sae -- cu -- lum sae - - - - culi _ ma -- net in sae - - - - - - - - - - cu -- lum

        in sae -- cu -- lum sae -- culi _ ma - net ma - - - - net in sae -- cu -- lum sae -- culi. _

}

IVbcIn = \relative do {

    la8 r la' r
    sold r sol r
    fa r sold, r

    %4
    la r sold' r
    la r fa r
    mi16 re mi fa mi re do si

    %7
    la4 r
    R2*5
    la'8 r dod r

    %14
    re8.[la16 sol fa mi re]
    R2*2
    sol8 r si r

    %18
    do8.[sol16 fa mi re do]
    R2*2\mbreak
    mi8 r mi, r

    %22
    fa' r fa, r
    sol' r sol, r
    do[mi fa sol]

    %25
    do,4 r
    R2*4
    la8\p r la' r

    %31
    sold r sol r
    fa r sold, r
    la r sold' r

    %34
    la r fa r
    mi16 re mi fa mi re do si
    la4 r

    %37
    R2*5
    la'8 r dod r
    re8.[la16 sol fa mi re]

    %44
    R2*2
    sol8 r si r
    do8.[sol16 fa mi re do]

    %48
    R2*2
    do16[re mi fa sol fa mi re]
    do re mi fa sol fa mi re

    %52
    do8 r mi r
    fa r fad r
    sol r sol, r\mbreak

    %55
    do[re mi re]
    do[la' sol sol,]
    do4 r

    %58
    R2*6
    do8\f[do do do]
    sol'[sol sol, sol]

    %66
    do[do fa sol]
    do[sol mi do]
    do'\p r si r

    %69
    la r fad r
    sol r sol, r
    do r do' r

    %72
    do, r la' r\mbreak
    sol16 fa sol la sol fa mi re
    do4 r

    %75
    R2*5
    la'8 r dod r
    re8.[la16 sol fa mi re]

    %82
    R2*2
    sol8 r si r
    do8.[sol16 fa mi re do]

    %86
    R2*2
    la16[si do re mi re do si]
    la[si do re mi re do si]

    %90
    la8 r sold' r\mbreak
    la r la, r
    sold'16 la sold fad mi re do si

    %93
    la4 r
    R2*4
    la16 si do re mi do si la

    %99
    re8 r re r
    fa r red r
    mi r mi r

    %102
    sold r mi r
    la r sold r
    la r fa r

    %105
    mi[re do si]
    la[fa' mi mi,]
    la4 r\mbreak

    %108
    R2*8
    la'8 r sold r
    la4 r

    %118
    la8 r sold r
    la r fa r
    mi[re do si]

    %121
    la fa' mi mi,
    la4 r
    R2*3

    %126
    la8\parenthesize \f [la la la]
    re[re mi mi]
    la,[la' re, mi]

    %129
    la,2\fermata

}

IVbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    <6>
    s4 <6 5>
    s2*9
    <_+>2
    s2*28
    <_+>2
    s2*37
    <_+>2
    s2*19
    s4 <_+>
    <_+>2

}


IVvlIIIn = \relative do'' {

    R2*6
    la16 sold la si la si do re
    mi re mi fa mi re do si

    %9
    la8 sol16 fa mi8 re'
    do [si16 la si8 mi,]
    do'16 si la sold la si do re

    %12
    mi8 mi, r4
    R2*2
    mi'16 re dod si la mi' fa sol

    %16
    fa mi re dod re4
    R2*2
    re16 do si la sol re' mi fa

    %20
    mi re do si do4
    R2*4
    do16 re mi re do si la sol

    %26
    la do fa mi re do si la
    si do re mi fa la sol fa
    mi8[re16 do re8 si]

    %29
    do4 r
    R2*6
    la16\p sold la si do si do re

    %37
    mi re mi fa mi re do si\mbreak
    la8[sol16 fa mi8 re']
    do8[si16 la si8 mi,]

    %40
    do'16 si la sold la si do re
    mi8 mi, r4
    R2*2

    %44
    mi'16 re dod si la  dod re mi
    fa mi re dod re4
    R2*2

    %48
    re16 do si la sol re' mi fa
    mi re do si do4
    R2*7

    %57
    do8 do4 do8
    do do4 do8
    do16[re mi re do si la sol]

    %60
    la[ do fa mi re do si la]
    si[do re do si la sol fa]
    mi8[sol do fa]

    %63
    mi re16 do re8.\tr do16
    mi16\f  re mi fa mi fa sol mi

    %65
    re do re mi re mi fa re
    mi8[do re si]
    do[sol mi do]
    R2*6

    %74
    sol'16 fa sol la sol la si sol
    do si do re do re mi do
    si do re do si la sol fa

    %77
    mi8[sol do re]
    mi16 re do si do re mi fa
    sol8 sol, r4

    %80
    R2*2
    mi'16 re dod si la dod re mi
    fa mi re dod re4

    %84
    R2*2
    re16 do si la sol si do re
    mi re do si do4

    %88
    R2*5
    la8 la4 la8
    la la4 la8

    %95
    la16 si do re mi re do si
    la si do re mi do si la
    mi'8. mi,16 mi4

    %98
    R2*9
    mi'8 mi,4 mi8\mbreak
    fa16[re mi fa sol la si do]

    %109
    re do si la si la sold fad
    sold[mi fad sold la si do re]
    mi[re do si] do[si la sold]

    %112
    la[do si la] si[re do si]
    do[mi re do] re[fa mi re]
    mi8[sold, la re]

    %115
    do si16 la si8. la16
    la4 r
    la16 si do re mi re do si

    %118
    la4 r
    R2*3
    la16  do si la si re do si

    %123
    do mi re do re fa mi re
    mi8[sold, la re]\mbreak
    do si16 la si8. la16

    %126
    mi'16\parenthesize \f re mi fa mi re mi fa

    %127
    re do re mi re do re mi
    do8[la' si sold]
    la2\fermata

}

IVvlIVn = \relative do'' {

    R2*6
    la16 sold la si la si do re
    mi re mi fa mi re do si

    %9
    la8 sol16 fa mi8 re'
    do [si16 la si8 mi,]
    do'16 si la sold la si do re

    %12
    mi8 mi, r4
    R2*2
    mi'16 re dod si la mi' fa sol

    %16
    fa mi re dod re4
    R2*2
    re16 do si la sol re' mi fa

    %20
    mi re do si do4
    R2*4
    do16 re mi re do si la sol

    %26
    la do fa mi re do si la
    si do re mi fa la sol fa
    mi8[re16 do re8 si]

    %29
    do4 r
    R2*6
    la16\p sold la si do si do re

    %37
    mi re mi fa mi re do si\mbreak
    la8[sol16 fa mi8 re']
    do8[si16 la si8 mi,]

    %40
    do'16 si la sold la si do re
    mi8 mi, r4
    R2*2

    %44
    mi'16 re dod si la  dod re mi
    fa mi re dod re4
    R2*2

    %48
    re16 do si la sol re' mi fa
    mi re do si do4
    R2*7

    %57
    do8 do4 do8
    do do4 do8
    do16[re mi re do si la sol]

    %60
    la[ do fa mi re do si la]
    si[do re do si la sol fa]
    mi8[sol do fa]

    %63
    mi re16 do re8.\tr do16
    do\f si do re do re mi do
    si la si do si do re si

    %66
    do8[mi fa re]
    do[sol mi do]
    R2*6

    %74
    sol'16 fa sol la sol la si sol
    do si do re do re mi do
    si do re do si la sol fa

    %77
    mi8[sol do re]
    mi16 re do si do re mi fa
    sol8 sol, r4

    %80
    R2*2
    mi'16 re dod si la dod re mi
    fa mi re dod re4

    %84
    R2*2
    re16 do si la sol si do re
    mi re do si do4

    %88
    R2*5
    la8 la4 la8
    la la4 la8

    %95
    la16 si do re mi re do si
    la si do re mi do si la
    mi'8. mi,16 mi4

    %98
    R2*9
    mi'8 mi,4 mi8\mbreak
    fa16[re mi fa sol la si do]

    %109
    re do si la si la sold fad
    sold[mi fad sold la si do re]
    mi[re do si] do[si la sold]

    %112
    la[do si la] si[re do si]
    do[mi re do] re[fa mi re]
    mi8[sold, la re]

    %115
    do si16 la si8. la16
    la4 r
    la16 si do re mi re do si

    %118
    la4 r
    R2*3
    la16  do si la si re do si

    %123
    do mi re do re fa mi re
    mi8[sold, la re]\mbreak
    do si16 la si8. la16

    %126
    do\parenthesize \f  si do re do si do re
    si la si do si la si do
    la8[do re si]

    %129
    do2\fermata

}

IVvlaIIn = \relative do' {

    R2*6
    do8 r do r
    si r si r
    re r si r

    %10
    mi r mi r
    mi r la r
    sold4 r

    %13
    R2*2
    dod,8 r mi r
    la4 r

    %17
    R2*2
    si,8 r re r
    sol4 r

    %21
    R2*4
    sol8 r sol r
    do, r la' r

    %27
    re, r si' r
    sol[sol la re,]
    mi4 r

    %30
    R2*6
    do8\p r do r
    si r si r

    %38
    re r si r
    mi r mi r
    mi r la r

    %41
    sold4 r
    R2*2
    dod,8 r mi r

    %45
    la4 r
    R2*2
    si,8 r re r

    %49
    sol4 r
    R2*7
    sol8 r sol r

    %58
    sol r sol r
    sol r sol r
    do, r la' r

    %61
    re, r sol r
    sol, r sol r
    sol do si4

    %64
    sol'8[sol sol sol]
    sol[sol sol sol]
    sol[sol la sol]

    %67
    mi[sol mi do]
    R2*6
    mi8 r re r

    %75
    do r la' r
    re, r sol, r
    sol r mi' r

    %78
    sol r do r
    si4 r
    R2*2

    %82
    dod,8 r mi r
    la4 r
    R2*2

    %86
    si,8 r re r
    sol4 r
    R2*5

    %93
    do,8 r do r
    do r do r
    do r si r

    %96
    do r do r
    si4 r
    R2*9

    %107
    do8 r do r
    la r la r
    la' r fad r

    %110
    si, r si r
    si' r sold r
    mi r mi r

    %113
    mi r la r
    sold[mi mi sold]
    mi r sold r

    %116
    mi4 r
    mi8 r si' r
    mi,4 r

    %119
    R2*3
    mi8 r mi r
    mi r la r

    %124
    sold[mi mi sold]
    mi r sold r
    mi8\parenthesize \f  [mi mi mi]

    %127
    fa[fa sold sold]
    mi[mi fa mi]
    mi2\fermata

}

IVsopranoIIn = \relative do'' {

    \autoBeamOff

    R2*35
    la16 [sold la si] do [si do re]

    %37
    mi [re mi fa] mi [re do si]\mbreak
    la8 sol16 fa mi8 re'
    do8 si16 [la] si8 mi,

    %40
    do'16[ si la sold] la [si] do [re]
    mi8 mi, r4
    R2*2

    %44
    mi'16 [re] dod [si] la  [dod] re mi
    fa [mi] re [dod] re4
    R2*2

    %48
    re16 [do] si [la] sol [re'] mi fa
    mi [re] do [si] do4
    R2*7

    %57
    do8 do4 do8
    do do4 do8
    do16[re mi re do si la sol]

    %60
    la[ do fa mi re do si la]
    si[do re do si la sol fa]
    mi8 sol do fa

    %63
    mi re16 do re8.\tr do16
    do4 r
    R2*9

    %74
    sol16 [fa sol la] sol [la si sol]
    do [si do re] do [re mi do]
    si [do] re [do] si [la] sol [fa]

    %77
    mi8 sol do re
    mi16 [re do si do re] mi [fa]
    sol8 sol, r4

    %80
    R2*2
    mi'16 [re] dod [si] la [dod] re mi
    fa [mi re dod] re4

    %84
    R2*2
    re16 [do] si [la] sol [si] do re
    mi [re do si] do4

    %88
    R2*5
    la8 la4 la8
    la la4 la8

    %95
    la16 [si do re] mi [re do si]
    la [si do re] mi [do si la]
    mi'8. mi,16 mi4

    %98
    R2*9
    mi'8 mi,4 mi8\mbreak
    fa16[re mi fa sol la si do]

    %109
    re [do si la] si [la sold fad]
    sold[mi fad sold la si do re]
    mi[re do si] do[si la sold]

    %112
    la[do si la] si[re do si]
    do[mi re do] re[fa mi re]
    mi8 sold, la re

    %115
    do si16 la si8. la16
    la4 r
    la16 [si do re] mi [re do si]

    %118
    la4 r
    R2*3
    la16  [do si la] si [re do si]

    %123
    do [mi re do] re [fa mi re]
    mi8[sold,] la re\mbreak
    do si16 la si8. la16

    %126
    la4 r
    R2*3

}

IVtestoV= \lyricmode {

    Glo - - - - ria _ et di -- vi -- ti -- ae in do - mo e -- jus,

        et jus -- ti -- tia _ e - jus et jus -- ti -- tia _ e - jus ma -- net

        in sae -- cu -- lum sae - - - culi _ in sae -- cu -- lum sae -- culi. _

        Glo - - - ria _ et di -- vi -- ti -- ae in do -- mo e -- jus,

        et jus -- ti -- tia _ e -- jus et jus -- ti -- tia _ e -- jus ma -- net

        in sae -- cu -- lum sae - - - - culi _ ma -- net in sae - - - - - - - - - - cu -- lum

        in sae -- cu -- lum sae -- culi _ ma - net ma - - - - net in sae -- cu -- lum sae -- culi. _

}

IVbcIIn = \relative do {

    R2*6
    la8 r la' r
    sold r sol r

    %9
    fa r sold, r
    la r sold' r
    la r fa r

    %12
    mi16 re mi fa mi re do si
    la4 r
    R2

    %15
    la'8 r dod r
    re8.[la16 sol fa mi re]
    R2*2

    %19
    sol8 r si r
    do8.[sol16 fa mi re do]\mbreak
    R2*4

    %25
    mi8 r mi, r
    fa' r fa, r
    sol' r sol, r

    %28
    do[mi fa sol]
    do,4 r
    R2*6

    %36
    la8 r la' r
    sold r sol r\mbreak
    fa r sold, r

    %39
    la r sold' r
    la r fa r
    mi16 re mi fa mi re do si

    %42
    la4 r
    R2
    la'8 r dod r

    %45
    re8.[la16 sol fa mi re]
    R2*2
    sol8 r si r

    %49
    do8.[sol16 fa mi re do]
    R2*7
    do16[re mi fa sol fa mi re]

    %58
    do[re mi fa sol fa mi re]
    do8 r mi r
    fa r fad r

    %61
    sol r sol, r
    do[re mi re]
    do[la' sol sol,]

    %64
    do\f[do do do]
    sol'[sol sol, sol]
    do[do fa sol]

    %67
    do[sol mi do]
    R2*6
    do'8 r si r

    %75
    la r fad r
    sol r sol, r
    do r do' r

    %78
    do, r la' r
    sol16 fa sol la sol fa mi re
    la4 r

    %81
    R2
    la'8 r dod r
    re8.[la16 sol fa mi re]

    %84
    R2*2
    sol8 r si r
    do8.[sol16 fa mi re do]

    %88
    R2*5
    la16 si do re mi re do si
    la si do re mi re do si

    %95
    la8 r sold' r
    la r la, r
    sold'16 la sold fad mi re do si

    %98
    la4 r
    R2*8
    la16 si do re mi do si la\mbreak

    %108
    re8 r re r
    fa r red r
    mi r mi r

    %111
    sold r mi r
    la r sold r
    la r fa r

    %114
    mi[re do si]
    la[fa' mi mi,]
    la4 r

    %117
    la'8 r sold r
    la4 r
    R2*3

    %122
    la8 r sold r
    la r fa r
    mi[re do si]\mbreak

    %125
    la fa' mi mi,
    la8\parenthesize \f [la la la]
    re[re mi mi]

    %128
    la,[la' re, mi]
    la,2\fermata_\markup\right-align\italic"Vivaldi ai copisti ”Qui copiate Beatus vir...”. Si ripete l'Antifona"

}

IVbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*7
    <6>2
    s4 <6 5>
    s2*5
    <_+>2
    s2*28
    <_+>2
    s2*35
    <_+>2
    s
    <_+>
    s2*27
    <_+>2

}


forma = {

    \time 2/4
    \key do\major
    \tempo 4 = 70
    s2*129
    \bar "|."

}

IVvlI = {
    \notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVvlaI = {
    \clef alto
    <<\IVvlaIn \forma>>

}

IVsopranoI = {
    \new Voice = "gloria1"
    <<\IVsopranoIn \forma>>
}

IVbcI = {
    \clef bass
    <<\IVbcIn \forma \IVbfIn>>
    \typeset
}

IVvlIII = {
    <<\IVvlIIIn \forma>>

}

IVvlIV = {
    <<\IVvlIVn \forma>>

}

IVvlaII = {
    \clef alto
    <<\IVvlaIIn \forma>>

}

IVsopranoII= {
    \new Voice = "gloria5"
    <<\IVsopranoIIn \forma>>
}

IVbcII = {
    \clef bass
    <<\IVbcIIn \forma \IVbfIIn>>
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

   R1*3
   do8 do do do do do re mi
   fa fa fa fa fa sol la si

   %6
   do4 r do r8 re
   sib sol, sol sol sib'4 r8 do
   la fa, fa fa\mbreak la'4 r8 sib

   %9
   sol4 r do, r8 re\pp^\markup\italic"Violini Soli"
   sib sol sol sol sib4 r8 do
   la fa fa fa la4 r8 sib

   %12
   sol4 r mib'2\f ^\markup\italic "Anco gli Haut[bois]" ~
   mib8 mib re do si sol si re
   fa2~fa8 fa mi re

   %15
   dod la dod mi sol2~
   sol8 sol fa mi fa2
   sol la4 r

   %18
   fa8 mi re do r2
   sib8 la sol fa r2
   r4 sib'8 r la r sol r

   %21
   fa r sib,\p r la r sol r
   fa4 r\mbreak r8 do'\p^\markup\italic"Violini Soli" do do
   r do do do r do do do

   %24
   r do do do r do do do
   r do do do r do do do
   r8 do do do r mi mi mi

   %27
   r mi mi mi r mi mi mi
   r sib sib sib r la la la
   r sib la la r sib do do

   %30
   do1\fermata
   r2 r8 re\f ^\markup\italic "Anco gli Haut[bois]" re re
   si2 r8 mi mi mi

   %33
   dod2 r8 fa fa fa
   sib,?2 lab
   lab?4. lab8 sol sol' sol sol

   %36
   do,2\mbreak sib
   sib4. sib8 la4 re~
   re mi dod2\tr

   %39
   re8 la la sib do do do re
   mib mib mib mib mib mib re do
   si si si si fa' fa fa fa

   %42
   fa fa mi re dod dod dod dod
   re re re re re re re re
   re re do? do si si si si

   %45
   do4 r r2
   do2 do4. do8
   do1\mbreak

   %48
   re2 re4. re8
   re2 mi
   mi4. mi8 mi4 mi8 mi

   %51
   fa4 fa, mib'2
   re8. re16 re4 r8 re sib sol
   sol4 la8 la sol2

   %54
   la8 la la la mib'2
   re8. re16 re4 r8 re sib sol
   sol4 la8 la sol2

   %57
   la8 la' la la sol sol sol sol
   la la, la la sol sol sol sol
   la1\fermata

}

VvlIIn = \relative do'' {

   R1*2
   fa,8 fa fa fa fa sol la sib
   do do do do do do do do

   %5
   do do do do do do do do
   sol'4 r la r8 sib
   sol mi, mi mi sol'4 r8 sol

   %8
   fa do, do do\mbreak fa'4 r8 sol
   mi4 r la,  r8 sib\pp
   sol mi mi mi sol4 r8 sol

   %11
   fa do do do fa4 r8 sol
   mi4 r do'2\f~
   do8 do sib la re si re fa

   %14
   re2~re8 re do si
   mi dod mi sol mi2~
   mi8 mi re dod re2~

   %17
   re8 re do sib la4 r
   fa'8 mi re do r2
   sib8 la sol fa r2

   %20
   r4 sol'8 r fa r mi r
   fa r sol,\p r fa r mi r
   fa4 r\mbreak r8 la\p la la

   %23
   r la la la r sol sol sol
   r sol sol sol r sol sol sol
   r la la la r la la la

   %26
   r la la la r do do do
   r do do do r do do do
   r do do do r do do do

   %29
   r re do do r sib sib sib
   la1\fermata
   r2 r8 fa\f fa fa

   %32
   fa2 r8 mi sol sol
   sol2 r

   %34
   r8 fa fa fa fa fa fa fa
   fa fa fa fa mib4 r
   r8 sol sol sol\mbreak sol sol sol sol

   %37
   sol sol sol sol fa4 r
   sib sib  la2
   la8 fa fa sol la la la sib

   %40
   do la la la la la la la
   sol sol sol sol re' re re re
   re re do si la la la la

   %43
   fa fa fa fa mi mi mi mi
   mi mi mi mi mi mi mi mi
   mi4 r r2

   %46
   r8 mi mi mi fad fad fad fad
   fad?4 r8 fad fad fad fad fad\mbreak
   sol sol16 sol sol8 sol sol sol r sol

   %49
   fa fa fa fa mi mi sol sol16 sol
   sol8 sol r sol sol sol sol sol16 sol
   la8 la r4 la2

   %52
   fa8. fa16 fa4 r8 fa fa re
   mi4 fa8 fa fa4(mi)
   fa8 fa fa fa la2

   %55
   fa8. fa16 fa4 r8 fa fa re
   mi4 fa8 fa fa4(mi)
   fa8 fa' fa fa fa fa mi mi

   %58
   fa fa, fa fa fa fa mi mi
   fa1\fermata

}

VvlaIn = \relative do' {

   R1
   do8 do do do do do re mi
   fa do do do do do sib la

   %4
   sol sol sol sol sol sol fa mi
   la la' la la la la sol fa
   mi4 r fa8 fa fa fa

   %7
   mi mi mi mi mi mi mi mi
   do la la la\mbreak fa' fa fa re
   sol,4 r fa8\pp fa fa fa

   %10
   mi mi mi mi mi mi mi do'
   do la la la do do do re
   sol,4 r la'8\f la la la

   %13
   la la la la sol sol sol re
   si' si si si si si si si
   la la la mi dod' dod dod dod

   %16
   dod? dod dod dod la la la fa
   sib sib sol sol do,4 r
   fa8 mi re do r2

   %19
   sib8 la sol fa r2
   r4 mi'8 r do r do r
   la8 r mi'\p r do r do r

   %22
   la4 r r8 fa'\p fa fa
   r fa fa fa r mi mi mi
   r mi mi mi r mi mi mi

   %25
   r fa fa fa r fa fa fa
   r fa fa fa r sol sol sol
   r sol sol sol r sol sol sol

   %28
   r fa fa fa r fa fa fa
   r fa fa fa r re mi mi\mbreak
   fa1\fermata

   %31
   r2 r8 sib,8\f sib sib
   re2 r8 do do do

   %33
   mi2 r
   r8 re re re re re re re
   re re re re sib4 r

   %36
   r8 mi! mi mi\mbreak mi mi mi mi
   mi mi mi mi do4 r
   mi mi mi2

   %39
   fa8 fa mi re do do do sib
   la do do do do do do do
   re re re re si' si si si

   %42
   si? si si sold mi mi mi mi
   la, la la la si si si si
   la la la la la la sold sold

   %45
   la4 r r2
   r8 do do do la la la la
   la4 r8 la la la la la\mbreak

   %48
   re re16 re re8 re re si r re
   re re si si sol sol sol sol16 sol
   sol8 sol r sol sol do do do16 do

   %51
   do8 do r4 do2
   sib8. sib16 sib4 r8 sib sib sib
   sib4 la8 do do2

   %54
   do8 do do do do2
   sib8. sib16 sib4 r8 sib sib sib
   sib4 la8 do do2

   %57
   do8 do' do do do do do do
   do do, do do do do do do
   do1\fermata

}

VsopranoIn = \relative do'' {

   \autoBeamOff
   R1*24
   r4 fa, la do
   fa fa, do'2

   %27
   do1~
   do4. do8 do2
   re4 do sib2

   %30
   la1\fermata
   r2 r8 re re re
   si2 r8 mi mi mi

   %33
   dod2 r8 fa fa fa
   sib,2  lab
   lab?4. lab8 sol sol' sol sol

   %36
   do,2\mbreak sib
   sib4. sib8 la4 re~
   re mi dod2\tr

   %39
   re4 r r2
   mib2~mib4 re8 do
   si2 fa'~

   %42
   fa4 mi?8 re dod4. dod8
   re4 re re2~
   re4 do8 do si2

   %45
   do r
   do do4. do8
   do1\mbreak

   %48
   re2 re4. re8
   re2 mi
   mi4. mi8 mi4 mi8 mi

   %51
   fa4 fa, mib'2
   re8. re16 re4 r8 re sib sol
   sol4 la8 la sol2

   %54
   la4 r mib'2
   re8. re16 re4 r8 re sib sol
   sol4 la8 la sol2

   %57
   la2 r
   R1*2

}

VtestoI = \lyricmode {

   Ex -- or -- tum est in te - nebris _  lu --  men rec -- tis,

   ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est in te -- nebris _

   ex -- or -- tum est in te -- nebris _  lu --  men rec -- tis,

   mi -- seri - cors mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus,

   mi -- seri - cors mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus,

   mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus,

   mi -- se -- ri -- cors et mi -- se -- ra -- tor et ju -- stus.

}

ValtoIn = \relative do' {

   \autoBeamOff
   R1*25
   r2 r4 do
   mi sol do do,

   %28
   fa4. fa8 fa2
   sol4 la sol2
   fa1\fermata

   %31
   r2 r8 fa fa fa
   fa2 r8 mi sol sol
   sol2 r

   %34
   r8 fa fa fa fa fa fa fa
   fa fa fa fa mib4 r
   r8 sol sol sol\mbreak sol sol sol sol

   %37
   sol sol sol sol fa4 r
   sib sib  la2
   la4 r r2

   %40
   la2 la4. la8
   sol2 si
   si?4. si8 la4. la8

   %43
   fa4 fa mi2~
   mi4 mi8 mi mi2
   mi r

   %46
   r8 mi mi mi fad fad fad fad
   fad?4 r8 fad fad fad fad fad\mbreak
   sol sol16 sol sol8 sol sol sol r sol

   %49
   fa fa fa fa mi mi sol sol16 sol
   sol8 sol r sol sol sol sol sol16 sol
   la8 la r4 la2

   %52
   fa8. fa16 fa4 r8 fa fa re
   mi4 fa8 fa fa4(mi)
   fa r la2

   %55
   fa8. fa16 fa4 r8 fa fa re
   mi4 fa8 fa fa4(mi)
   fa2 r

   %58
   R1*2

}

VtestoII = \lyricmode {

   Ex -- or -- tum est in te -- nebris _  lu --  men rec -- tis,

   ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est in te -- ne -- bris in te -- ne -- bris

   ex -- or -- tum est in te -- nebris _ in te -- nebris _  lu --  men rec -- tis,

   mi -- se -- ri -- cors mi -- se -- ri -- cors et mi -- se -- ra -- tor et ju -- stus,
   
   ex -- or -- tum est in te -- nebris _ ex -- or -- tum est in te -- nebris _ lu --  men rec -- tis,
   
   mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus, et mi -- se -- ra -- tor et ju -- stus,

   mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus,

   mi -- se -- ri -- cors et mi -- se -- ra -- tor et ju -- stus.

}

VtenoreIn = \relative do' {

   \autoBeamOff
   R1*21
   r4 fa, la do
   fa fa, do'2~

   %24
   do1~
   do2 do
   do do

   %27
   sib1~
   sib4. sib8 la2
   sib4 la re(mi)

   %30
   la,1\fermata
   r2 r8 sib sib sib
   re2 r8 do do do

   %33
   mi2 r
   r8 re re re re re re re
   re re re re sib4 r

   %36
   r8 mi! mi mi\mbreak mi mi mi mi
   mi mi mi mi do4 r
   mi mi mi2

   %39
   fa4 r r2
   do do4. do8
   re2 re

   %42
   re4. re8 mi4. mi8
   la,4 la si2
   la4 la8 la la4(sold)

   %45
   la2 r
   r8 do do do la la la la
   la4 r8 la la la la la\mbreak

   %48
   re re16 re re8 re re si r re
   re re si si sol sol sol sol16 sol
   sol8 sol r sol sol do do do16 do

   %51
   do8 do r4 do2
   sib8. sib16 sib4 r8 sib sib sib
   sib4 la8 do do2

   %54
   do4 r do2
   sib8. sib16 sib4 r8 sib sib sib
   sib4 la8 do do2

   %57
   do r
   R1*2

}

VtestoIII = \lyricmode {
   
   Ex -- or -- tum est in te -- ne -- bris in te -- ne -- bris lu --  men rec -- tis,

   ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est in te -- ne -- bris in te -- ne -- bris

   ex -- or -- tum est in te -- nebris _ in te -- nebris _  lu --  men rec -- tis,

   mi -- se -- ri -- cors mi -- se -- ri -- cors et mi -- se -- ra - tor et ju -- stus,
   
   ex -- or -- tum est in te -- nebris _ ex -- or -- tum est in te -- nebris _ lu --  men rec -- tis,
   
   mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus, et mi -- se -- ra -- tor et ju -- stus,

   mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus,

   mi -- se -- ri -- cors et mi -- se -- ra -- tor et ju -- stus.

}

VbassoIn = \relative do {

   \autoBeamOff
   R1*22
   r2 r4 do
   mi sol do do,

   %25
   fa1~
   fa2 mi~
   mi1

   %28
   fa4. fa8 fa2
   fa4 fa sol (do,)
   fa1\fermata

   %31
   r2 r8 sib, sib sib
   sol'2 r8 do, do do
   la'2 r

   %34
   r8 sib, sib sib sib sib sib sib
   sib sib sib sib mib4 r
   r8 do do do\mbreak do do do do

   %37
   do do do do fa4 r
   sol sol la la,
   re r r2

   %40
   fad2 fad4. fad8
   fa!2 sold,
   sol'4. sold8 sol4. sol8

   %43
   fa4 re sold2
   la4 la8 la mi2
   la, r

   %46
   r8 la la la re re re re
   re4 r8 re do do do do\mbreak
   si si16 si si8 si si si r si

   %49
   si? si si si  do do do do16 do
   do8 do r do sib? sib sib sib16 sib
   la8 la r4 fa'2

   %52
   sib,8. sib16 sib4 r8 sib sib sib
   do4 fa8 fa do2
   fa4 r fa2

   %55
   sib,8. sib16 sib4 r8 sib sib sib
   do4 fa8 fa do2
   fa r

   %58
   R1*2

}

VtestoIV = \lyricmode {
   
   Ex -- or -- tum est in te - - ne -- bris lu --  men rec -- tis,

   ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est in te -- ne -- bris in te -- ne -- bris

   ex -- or -- tum est in te -- nebris _ in te -- nebris _  lu --  men rec - tis,

   mi -- se -- ri -- cors mi -- se -- ri -- cors et mi -- se -- ra - tor et ju -- stus,
   
   ex -- or -- tum est in te -- nebris _ ex -- or -- tum est in te -- nebris _ lu --  men rec -- tis,
   
   mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus, et mi -- se -- ra -- tor et ju -- stus,

   mi -- se -- ri -- cors et mi -- se -- ra -- tor et ju -- stus,

   mi -- se -- ri -- cors et mi -- se -- ra -- tor et ju -- stus.

}

VbcIn = \relative do {

   fa8\staccatissimo fa\staccatissimo fa\staccatissimo fa\staccatissimo fa sol la sib
   do do, do do do do do sib
   la la la la la la sol fa

   %4
   mi mi mi mi mi mi re do
   fa fa' fa fa fa fa mi re
   do4 r fa8 fa fa re

   %7
   do do do do do do do do
   fa fa fa fa\mbreak fa fa fa sib,
   do4 r fa8\pp^\markup\italic"Senza Org[ani]" fa fa re

   %10
   sol, do do do do do do do
   fa fa fa fa fa fa fa sib,
   do4 r fad8\tu\f fad fad fad

   %13
   fad? fad fad fad fa fa fa fa
   sold, sold sold sold sold sold sold sold
   sol! sol sol sol la la la la

   %16
   la la la la re re re re
   mi mi mi mi fa4 r
   fa'8 mi re do r2

   %19
   sib8 la sol fa r2
   r4 do8 r do r do r
   do r do^\p r do r do r

   %22
   fa,4 r\mbreak r2
   r r4 do'
   mi sol do do,

   %25
   fa1~
   fa2 mi~
   mi1

   %28
   fa4. fa8 fa2~
   fa sol4 do,
   fa1\fermata

   %31
   r2 r8 sib, sib sib
   sol'2 r8 do, do do
   la'2 r

   %34
   r8 sib, sib sib sib sib sib sib
   sib sib sib sib mib4 r
   r8 do do do\mbreak do do do do

   %37
   do do do do fa fa fa fa
   sol sol sol sol la la la, la
   re re do sib la la la sol

   %40
   fad fad' fad fad fad fad fad fad
   fa! fa fa fa sold, sold sold sold
   sold' sold sold sold sol! sol sol sol

   %43
   fa fa re re sold sold sold sold
   la la la la mi mi mi, mi
   la4 r r2

   %46
   r8 la la la re re re re
   re4 r8 re do do do do\mbreak
   si[si16 si si8 si] si si r si

   %49
   si? si si si  do[do do do16 do]
   do8 do r do sib?[sib sib sib16 sib]
   la8 la la la fa' fa fa fa

   %52
   sib, sib sib sib sib sib sib sib
   do do fa[fa] do do do, do
   fa fa fa fa fa' fa fa fa

   %55
   sib, sib sib sib sib sib sib sib
   do do fa fa do do do, do
   fa' fa fa fa do' do do, do

   %58
   fa, fa fa fa do' do do, do
   fa1\fermata

}

VbfIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s1*4
   s2 s4 s8 <6!>
   s2 s4 s8 <6>
   <7>1
   s1*4
   s2 <7->
   s <6 4!>
   <7 5> s
   <6 4+> <7 _+>
   s1
   <7>
   s
   s
   s4 <7 5> <6 4> <5 3>
   <6 4> <7 5> <6 4> <5 3>
   s1*5
   <6 5>1
   <5 4>2 <3>
   <6 4>4 <5 3> s <7>
   s1
   s
   <7 _!>
   <7 _+>
   s2 <7->
   s1
   s8 <_!> s4 <7>2
   s1
   <6 5>2 <_+>
   s1
   <7->
   <6 4!>2 <7->
   s <6 4+>
   <6> <6 5>
   <5 4>4 <3!> <5 4> <3+>
   s1
   s2 <7 _+>
   s <6 4+>
   s1
   s
   s2
   <6 4>
   s <7 ->
   s2 s4 s8 <6>
   <7>2 <5 4>4 <3>
   s2 <7->s2 s4 s8 <6>
   <7>2 <5 4>4 <3>
   s2 <5 4>4 <3>
   s2 <6 4>4 <3>

}


VvlIIIn = \relative do'' {

   R1*3
   do8 do do do do do re mi
   fa fa fa fa fa sol la si

   %6
   do4 r do r8 re
   sib sol, sol sol sib'4 r8 do
   la fa, fa fa\mbreak la'4 r8 sib

   %9
   sol4 r do, r8 re\pp
   sib sol sol sol sib4 r8 do
   la fa fa fa la4 r8 sib

   %12
   sol4 r mib'2\f  ~
   mib8 mib re do si sol si re
   fa2~fa8 fa mi re

   %15
   dod la dod mi sol2~
   sol8 sol fa mi fa2
   sol la4 r

   %18
   r2 re,8 do sib la
   r2 sol8 fa mi re
   do4 sib''8 r la r sol r

   %21
   fa r sib,\p r la r sol r
   fa4 r\mbreak r8 do'\p do do
   r do do do r do do do

   %24
   r do do do r do do do
   r do do do r do do do
   r8 do do do r mi mi mi

   %27
   r mi mi mi r mi mi mi
   r sib sib sib r la la la
   r sib la la r sib do do

   %30
   do1\fermata
   r8 la la la sib2
   r8 si si si do2

   %33
   r8 dod dod dod re4 r
   re,2 fa
   sib sib4 r

   %36
   mi,!2\mbreak sol
   do do4 re~
   re mi dod2\tr

   %39
   re8 la la sib do do do re
   mib mib mib mib mib mib re do
   si si si si fa' fa fa fa

   %42
   fa fa mi re dod dod dod dod
   re re re re re re re re
   re re do? do si si si si

   %45
   do4 r r2
   R1*3
   r2 r4 do,

   %50
   mi sol do do,
   fa8. fa16 fa4 mib'2
   re8. re16 re4 r8 re sib sol
   sol4 la8 la sol2

   %54
   la8 la la la mib'2
   re8. re16 re4 r8 re sib sol
   sol4 la8 la sol2

   %57
   la8 la' la la sol sol sol sol
   la la, la la sol sol sol sol
   la1\fermata

}

VvlIVn = \relative do'' {

   R1*2
   fa,8 fa fa fa fa sol la sib
   do do do do do do do do

   %5
   do do do do do do do do
   sol'4 r la r8 sib
   sol mi, mi mi sol'4 r8 sol

   %8
   fa do, do do\mbreak fa'4 r8 sol
   mi4 r la,  r8 sib\pp
   sol mi mi mi sol4 r8 sol

   %11
   fa do do do fa4 r8 sol
   mi4 r do'2\f~
   do8 do sib la re si re fa

   %14
   re2~re8 re do si
   mi dod mi sol mi2~
   mi8 mi re dod re2~

   %17
   re8 re do sib la4 r
   r2 re8 do sib la
   r2 sol8 fa mi re

   %20
   do4 sol''8 r fa r mi r
   fa r sol,\p r fa r mi r
   fa4 r\mbreak r8 la\p la la

   %23
   r la la la r sol sol sol
   r sol sol sol r sol sol sol
   r la la la r la la la

   %26
   r la la la r do do do
   r do do do r do do do
   r do do do r do do do

   %29
   r re do do r sib sib sib
   la1\fermata
   r8 fa fa fa fa2
   r8 sol sol sol sol2
   r8 la la la la4 r

   %34
   sib,2 re
   fa sol4 r
   do,2\mbreak mi!

   %37
   sol2 la4 r
   sib sib  la2
   la8 fa fa sol la la la sib

   %40
   do la la la la la la la
   sol sol sol sol re' re re re
   re re do si la la la la

   %43
   fa fa fa fa mi mi mi mi
   mi mi mi mi mi mi mi mi
   mi4 r r2

   %46
   R1*2
   r4 sol, si re

   %49
   sol sol, do4. do8
   do2 sol'4. sol8
   fa4 fa la2

   %52
   fa8. fa16 fa4 r8 fa fa re
   mi4 fa8 fa fa4(mi)
   fa8 fa fa fa la2

   %55
   fa8. fa16 fa4 r8 fa fa re
   mi4 fa8 fa fa4(mi)
   fa8 fa' fa fa fa fa mi mi

   %58
   fa fa, fa fa fa fa mi mi
   fa1\fermata

}

VvlaIIn = \relative do' {

   R1
   do8 do do do do do re mi
   fa do do do do do sib la

   %4
   sol sol sol sol sol sol fa mi
   la la' la la la la sol fa
   mi4 r fa8 fa fa fa

   %7
   mi mi mi mi mi mi mi mi
   do la la la\mbreak fa' fa fa re
   sol,4 r fa8\pp fa fa fa

   %10
   mi mi mi mi mi mi mi do'
   do la la la do do do re
   sol,4 r la'8\f la la la

   %13
   la la la la sol sol sol re
   si' si si si si si si si
   la la la mi dod' dod dod dod

   %16
   dod? dod dod dod la la la fa
   sib sib sol sol do,4 r
   r2 re8 do sib la

   %19
   r2 sol8 fa mi re
   do4 mi'8 r do r do r
   la8 r mi'\p r do r do r

   %22
   la4 r r8 fa'\p fa fa
   r fa fa fa r mi mi mi
   r mi mi mi r mi mi mi

   %25
   r fa fa fa r fa fa fa
   r fa fa fa r sol sol sol
   r sol sol sol r sol sol sol

   %28
   r fa fa fa r fa fa fa
   r fa fa fa r re mi mi\mbreak
   fa1\fermata

   %31
   r8 do do do re2
   r8 re re re mi2

   %33
   r8 mi mi mi fa4 r
   fa,2 sib
   re mib4 r

   %36
   sol,2\mbreak do
   mi! fa4 r
   sol sol fa2

   %39
   fa8 fa mi re do do do sib
   la do do do do do do do
   re re re re si' si si si

   %42
   si? si si sold mi mi mi mi
   la, la la la si si si si
   la la la la la la sold sold

   %45
   la4 r r2
   R1*2


   %48
   sol2 sol
   sol1
   sol2. do4

   %51
   do do do2
   sib8. sib16 sib4 r8 sib sib sib
   sib4 la8 do do2

   %54
   do8 do do do do2
   sib8. sib16 sib4 r8 sib sib sib
   sib4 la8 do do2

   %57
   do8 do' do do do do do do
   do do, do do do do do do
   do1\fermata

}

VsopranoIIn = \relative do'' {

   \autoBeamOff

   R1*24
   r4 fa, la do
   fa fa, do'2

   %27
   do1~
   do4. do8 do2
   re4 do sib2

   %30
   la1\fermata
   r8 la la la sib2
   r8 si si si do2

   %33
   r8 dod dod dod re4 r
   re,2 fa
   sib sib4 r

   %36
   mi,!2\mbreak sol
   do do4 re~
   re mi dod2\tr

   %39
   re4 r r2
   mib2~mib4 re8 do
   si2 fa'~

   %42
   fa4 mi?8 re dod4. dod8
   re4 re re2~
   re4 do8 do si2

   %45
   do2 r
   R1*3
   r2 r4 do,

   %50
   mi sol do do,
   fa8. fa16 fa4 mib'2
   re8. re16 re4 r8 re sib sol
   sol4 la8 la sol2

   %54
   la4 r mib'2
   re8. re16 re4 r8 re sib sol
   sol4 la8 la sol2

   %57
   la r
   R1*2

}

VtestoV= \lyricmode {
   
   Ex -- or -- tum est in te - nebris _  lu --  men rec -- tis,

   ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est  in te -- ne -- bris

   lu --  men rec -- tis,

   mi -- seri - cors mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus,

   ex -- or -- tum est  in te -- ne -- bris
   
   mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus,

   mi -- se -- ri -- cors et mi -- se -- ra -- tor et ju -- stus.

}

ValtoIIn = \relative do' {

   \autoBeamOff
   R1*25
   r2 r4 do
   mi sol do do,

   %28
   fa4. fa8 fa2
   sol4 la sol2
   fa1\fermata

   %31
   r8 fa fa fa fa2
   r8 sol sol sol sol2
   r8 la la la la4 r

   %34
   sib,2 re
   fa sol4 r
   do,2\mbreak mi!

   %37
   sol2 la4 r
   sib sib  la2
   la4 r r2

   %40
   la2 la4. la8
   sol2 si
   si?4. si8 la4. la8

   %43
   fa4 fa mi2~
   mi4 mi8 mi mi2
   mi r

   %46
   R1*2
   r4 sol,
   si re

   %49
   sol sol, do4. do8
   do2 sol'4. sol8
   fa4 fa la2

   %52
   fa8. fa16 fa4 r8 fa fa re
   mi4 fa8 fa fa4(mi)
   fa r la2

   %55
   fa8. fa16 fa4 r8 fa fa re
   mi4 fa8 fa fa4(mi)
   fa2 r

   %58
   R1*2

}

VtestoVI = \lyricmode {
   
   Ex -- or -- tum est in te -- nebris _  lu --  men rec -- tis,

   ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est in te -- ne -- bris

    lu --  men rec -- tis,

   mi -- se -- ri -- cors mi -- se -- ri -- cors et mi -- se -- ra -- tor et ju -- stus,
   
   ex -- or -- tum est in te -- ne -- bris lu --  men rec -- tis,
   
   mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus, 

   mi -- se -- ri cors et mi -- se -- ra -- tor et ju -- stus.

}

VtenoreIIn = \relative do' {

   \autoBeamOff
   R1*21
   r4 fa, la do
   fa fa, do'2~

   %24
   do1~
   do2 do
   do do

   %27
   sib1~
   sib4. sib8 la2
   sib4 la re(mi)

   %30
   la,1\fermata
   r8 do do do re2
   r8 re re re mi2

   %33
   r8 mi mi mi fa4 r
   fa,2 sib
   re mib4 r

   %36
   sol,2\mbreak do
   mi! fa4 r
   mi mi mi2

   %39
   fa4 r r2
   do do4. do8
   re2 re

   %42
   re4. re8 mi4. mi8
   la,4 la si2
   la4 la8 la la4(sold)

   %45
   la2 r
   r r4 re,
   fad la re re,\mbreak

   %48
   sol2 sol
   sol1
   sol2. do4

   %51
   do do do2
   sib8. sib16 sib4 r8 sib sib sib
   sib4 la8 do do2

   %54
   do4 r do2
   sib8. sib16 sib4 r8 sib sib sib
   sib4 la8 do do2

   %57
   do r
   R1*2

}

VtestoVII = \lyricmode {
   
   Ex -- or -- tum est in te -- ne -- bris in te -- ne -- bris  lu --  men rec -- tis,

   ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est in te -- ne -- bris

    lu --  men rec -- tis,

   mi -- se -- ri -- cors mi -- se -- ri -- cors et mi -- se -- ra - tor et ju -- stus,
   
   ex -- or -- tum est in te -- ne -- bris lu --  men rec -- tis,
   
   mi -- seri - cors et mi -- se -- ra -- tor et ju -- stus, 

   mi -- se -- ri cors et mi -- se -- ra -- tor et ju -- stus.

}

VbassoIIn = \relative do {

   \autoBeamOff
   R1*22
   r2 r4 do
   mi sol do do,

   %25
   fa1~
   fa2 mi~
   mi1

   %28
   fa4. fa8 fa2
   fa4 fa sol (do,)
   fa1\fermata

   %31
   r8 fa fa mib re2
   r8 sol sol fa mi?2
   r8 la la sol fa4 r

   %34
   sib,2 sib
   sib2 mib4 r
   do2 do

   %37
   do2 fa4 r
   sol sol la la,
   re r r2

   %40
   fad2 fad4. fad8
   fa!2 sold,
   sol'4. sold8 sol4. sol8

   %43
   fa4 re sold2
   la4 la8 la mi2
   la,4 la do mi

   %46
   la la, re2~
   re do\mbreak
   si2 si~

   %49
   si2 do~
   do sib!
   la fa'

   %52
   sib,8. sib16 sib4 r8 sib sib sib
   do4 fa8 fa do2
   fa4 r fa2

   %55
   sib,8. sib16 sib4 r8 sib sib sib
   do4 fa8 fa do2
   fa r

   %58
   R1*2

}

VtestoVIII = \lyricmode {
   
   Ex -- or -- tum est in te - - ne -- bris  lu --  men rec -- tis,

   ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est ex -- or -- tum est in te -- ne -- bris

    lu --  men rec - tis,

   mi -- se -- ri -- cors mi -- se -- ri -- cors et mi -- se -- ra - tor et ju -- stus,
   
   ex -- or -- tum est in te -- ne -- bris lu --  men rec -- tis,
   
   mi -- se -- ri -- cors et mi -- se -- ra -- tor et ju -- stus, 

   mi -- se -- ri cors et mi -- se -- ra -- tor et ju -- stus.

}

VbcIIn = \relative do {

   fa8\staccatissimo fa\staccatissimo fa\staccatissimo fa\staccatissimo fa sol la sib
   do do, do do do do do sib
   la la la la la la sol fa

   %4
   mi mi mi mi mi mi re do
   fa fa' fa fa fa fa mi re
   do4 r fa8 fa fa re

   %7
   do do do do do do do do
   fa fa fa fa\mbreak fa fa fa sib,
   do4 r fa8\pp^\markup\italic"Senza Org[ani]" fa fa re

   %10
   sol, do do do do do do do
   fa fa fa fa fa fa fa sib,
   do4 r fad8\tu\f fad fad fad

   %13
   fad? fad fad fad fa fa fa fa
   sold, sold sold sold sold sold sold sold
   sol! sol sol sol la la la la

   %16
   la la la la re re re re
   mi mi mi mi fa4 r
   r2 re'8 do sib la

   %19
   r2 sol8 fa mi re
   do4 do8 r do r do r
   do r do r do r do r

   %22
   fa,4 r\mbreak r2
   r r4 do'
   mi sol do do,

   %25
   fa1~
   fa2 mi~
   mi1

   %28
   fa4. fa8 fa2~
   fa sol4 do,
   fa1\fermata

   %31
   r8 fa fa mib re2
   r8 sol sol fa mi?2
   r8 la la sol fa4 r

   %34
   sib,1~
   sib2 mib4 r
   do1~

   %37
   do2 fa8 fa fa fa
   sol sol sol sol la la la, la
   re re do sib la la la sol

   %40
   fad fad' fad fad fad fad fad fad
   fa! fa fa fa sold, sold sold sold
   sold' sold sold sold sol! sol sol sol

   %43
   fa fa re re sold sold sold sold
   la la la la mi mi mi, mi
   la4 la do mi

   %46
   la la, re2~
   re do\mbreak
   si1~

   %49
   si2 do~
   do sib!
   la fa'8 fa fa fa

   %52
   sib, sib sib sib sib sib sib sib
   do do fa[fa] do do do, do
   fa fa fa fa fa' fa fa fa

   %55
   sib, sib sib sib sib sib sib sib
   do do fa fa do do do, do
   fa' fa fa fa do' do do, do

   %58
   fa, fa fa fa do' do do, do
   fa1\fermata

}

VbfIIn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s1*4
   s2 s4 s8 <6!>
   s2 s4 s8 <6>
   <7>1
   s1*4
   s2 <7->
   s <6 4!>
   <7 5> s
   <6 4+> <7 _+>
   s1
   <7>
   s
   s
   s4 <7 5> <6 4> <5 3>
   <6 4> <7 5> <6 4> <5 3>
   s1*5
   <6 5>1
   <5 4>2 <3>
   <6 4>4 <5 3> s <7>
   s1
   s
   s8 <_!> s <6 4!> s2
   s8 <_+> s <6 4+> s2
   <7->1
   s
   <_!>2 <7> 
   s1
   <6 5>2 <_+>  
   s1
   <7->
   <6 4!>2 <7->
   s <6 4+>
   <6> <6 5>
   <5 4>4 <3!> <5 4> <3+>
   s1
   s2 <7 _+>
   s <6 4+>
   s1
   s
   s2
   <6 4>
   s <7 ->
   s2 s4 s8 <6>
   <7>2 <5 4>4 <3>
   s2 <7->s2 s4 s8 <6>
   <7>2 <5 4>4 <3>
   s2 <5 4>4 <3>
   s2 <6 4>4 <3>

}


forma = {

   \time 4/4
   \key fa\major
   \tempo 2 = 50
   s1*59
   \bar "|."

}

VvlI = {
   \notypeset
   <<\VvlIn \forma>>

}

VvlII = {
   <<\VvlIIn \forma>>

}

VvlaI = {
   \clef alto
   <<\VvlaIn \forma>>

}

VsopranoI = {
   \new Voice = "exortum1"
   <<\VsopranoIn \forma>>
}

ValtoI = {
   \new Voice = "exortum2"
   <<\ValtoIn \forma>>
}

VtenoreI = {
   \new Voice = "exortum3"
   <<\VtenoreIn \forma>>
}

VbassoI = {
   \clef bass
   \new Voice = "exortum4"
   <<\VbassoIn \forma>>
}

VbcI = {
   \clef bass
   <<\VbcIn \forma \VbfIn>>
   \typeset
}

VvlIII = {
   <<\VvlIIIn \forma>>

}

VvlIV = {
   <<\VvlIVn \forma>>

}

VvlaII = {
   \clef alto
   <<\VvlaIIn \forma>>

}

VsopranoII= {
   \new Voice = "exortum5"
   <<\VsopranoIIn \forma>>
}

ValtoII= {
   \new Voice = "exortum6"
   <<\ValtoIIn \forma>>
}

VtenoreII = {
   \new Voice = "exortum7"
   <<\VtenoreIIn \forma>>
}

VbassoII = {
   \clef bass
   \new Voice = "exortum8"
   <<\VbassoIIn \forma>>
}

VbcII = {
   \clef bass
   <<\VbcIIn \forma \VbfIIn>>
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


VIsopranoIn = \relative do'' {

    \autoBeamOff
    r8
    R1*12
    r4 r8 la mi'[re] do[si]
    la16[si do si] la8 la si16[do] re4 do16[si]

    %15
    do[re] mi4 re16[do] do8 si16[la] si4
    r r8 mi sold,[la] si do
    si[do] re[mi] re fa mi16[re] do[si]

    %18
    do8. si16 la4 r2
    dod8 dod dod dod re16[mi fa8]~fa16[mi re do?]
    si8[si si\tr la16 si] do[re mi8]~mi16[re do si]

    %21
    la8[la la\tr sold16 la]\mbreak si[do re8]~re16[do si la]
    sold8[sold sold la16 si] do[si] la8 r4
    r2 mi'4 mi8 mi

    %24
    mi[re16 do] si4~si8[la16 sol] la8[sol16 fad]
    sol8[mi sol si] mi[re16 do] si4~
    si8[la16 sol] la8[sol16 fad]  sol[mi fad sol la si dod red]

    %27
    mi8 re?16[do?] si8 la sol mi' sol,[fad16] mi
    mi4 r r2
    R1

    %30
    r8 si' si si mi[re16 do] si4
    r8 si si si mi[re16 do] si4
    r8 mi do si la8[do] si16[la] sol[fad]

    %33
    sol8. fad16 mi4 r r8 mi'
    mi[do] la4 r8 re re re
    re[si] sol4 r8 do do do

    %36
    do[la] fa!4 re'8 re4 do16[si]
    do8. si16 la4 mi'8 mi, mi mi
    fa[la] re fa\mbreak re[do] si[la]

    %39
    sold16[si la si] sold [si la sold] la[do si do] la[do si la]
    si[re do re] si[re do si] do[la] do[re] mi8 re
    do si16[la] si8.\tr la16 la4 r

    %42
    r8 mi' do sold la16 [do si do] la [do si la]
    si [re do re] si [re do si] do [mi re mi ]do [mi re do]
    re[fa mi fa]re[fa mi re] mi[re] do[si] la8 re

    %45
    do si16[la] si8.\tr la16 la4 r
    R1*10

}

VItestoI = \lyricmode {

     Ju -- cun -- dus ho -- mo, qui mi -- se - retur _ et com --  modat, _

    dis -- po -- net ser -- mo -- nes su -- os in ju -- di -- cio, _

    quia _ in ae -- ter - - - - - - num non com -- mo -- ve - - - - - - - - bitur _ non

    com -- mo -- ve -- bi -- tur.

    Ju -- cun -- dus ho -- mo, qui mi -- se -- re -- tur  qui mi -- se -- re -- tur et com --  modat, _

    dis -- po -- net ser -- mo -- nes su -- os ser -- mo -- nes su -- os in ju - di -- cio, _

    quia _ in ae -- ter -- num non com -- mo -- ve - - - - - -  bi -- tur

    non com -- mo -- ve --  bitur _ non com -- mo -- ve - - - - - -  - - bitur _

    non com -- mo -- ve --  bi -- tur.

}


VImdn = \relative do'' {

   mi8
   la la la la la16 si do si la8 mi
   la16 si do si la8 mi la[sol16 fa mi8 re]
   do16 si la8 r mi' la16 sol fa mi la sol fa mi

   %4
   fa8 re fa la sol16 fa mi re  sol fa  mi re
   mi8 do mi sol fa16 mi re do fa mi re do
   re8 si re fa mi16 re do si mi re do si
   do8 la do re mi2\tr~

   %8
   mi~mi~
   mi~mi8[la16 sold la8 la]
   fa[la16 sold la8 la] mi8[la16 sold la8 la]

   %11
   re,[la'16 sold la8 la] do,16[mi fa mi fa mi fa mi]
   la mi fa mi fa mi fa mi\mbreak la8 mi do si
   la4 r r2  %%% fine ripresa

   %14
   R1
   r4 r8 mi' sold sold sold sold
   la16[sol? fa mi re do si la] si4 r

   %17
   r2 r4 r8 sold'
   la la la la la16 si do si la8 mi
   la16 sol fa mi la sol fa mi fa8 re fa la

   %20
   sol16 fa mi re sol fa mi re mi8 do mi sol
   fa16 mi re do fa mi re do\mbreak re8 si re fa
   mi16 re do si mi re do si la[si do re mi fa sol la]

   %23
   fad mi fad sol la fad mi fad sol si la si mi,8 r
   si'1~
   si~

   %26
   si~
   si2~si16 sol fad mi mi8 red
   mi mi mi mi mi16 fad sol fad mi8 si'

   %29
   mi,16 fad sol fad mi fad sol la si8 mi, fad red
   mi4 r r16 sol la si mi, sol la si\mbreak
   mi,4 r r16 sol la si mi, sol la si

   %32
   mi,4 r r2
   r16 sol la si mi, sol la si si, sol' la si mi, sol la si
   do,[re mi fad sol la si do] re, fad sol la re, fad sol la

   %35
   si,[do re mi fad sol la si]do, mi fa! sol do, mi fa sol
   la,[si do re mi fa sol la] si, sold' la si si, sold' la si
   la mi re mi do mi re mi la,4 r

   %38
   R1*3
   r2 r16 la' sold la la, do si la
   mi'1\tr~

   %43
   mi~
   mi2~mi
   r2 la16\tu sol fa mi la sol fa mi

   %46
   fa8 re fa la sol16 fa mi re  sol fa  mi re
   mi8 do mi sol fa16 mi re do fa mi re do
   re8 si re fa mi16 re do si mi re do si
   do8 la do re mi2\tr~

   %50
   mi~mi~
   mi~mi8[la16 sold la8 la]
   fa[la16 sold la8 la] mi8[la16 sold la8 la]

   %53
   re,[la'16 sold la8 la] do,16[mi fa mi fa mi fa mi]
   la mi fa mi fa mi fa mi\mbreak la8 mi do si
   la4 r r2  %%% fine ripresa

}

VImsn = \relative do {

   r8_\markup\italic "Tutti gl'Organi con principale, e flautino"
   la4 r la r
   la r la sold
   la8 si do si la4 dod

   %4
   re r si si
   do r la la
   si r sold sold

   %7
   la r r r8 mi'
   fad fad sold sold la la si si
   do do re re mi do r4

   %10
   re r do r
   si r la r
   la r\mbreak la,8 do re mi

   %13
   la,4 r la8[si do re16 mi]
   la,8 mi' do la mi' si' sold mi
   la si do la mi fad sold mi

   %16
   la,4 r8 la mi'4 r8 la
   sold la si do si la sold mi
   la, si do si la4 r

   %19
   la' la re, r
   sol sol do, r
   fa fa\mbreak si, r

   %22
   mi mi la, r8 la'
   si fad red si mi fad sol fad
   mi fad sol mi red mi fad si,

   %25
   mi fad sol fad mi fad sol mi
   red mi fad si, mi do' si la
   sol la red, si mi do' si si,

   %28
   mi_\markup\italic"Tutti gl'Org[ani]" fad sol fad mi si' sol red
   mi si' sol fad mi sol la si
   mi, _\markup\italic"Org[ano] Solo" fad sol fad mi fad sol fad\mbreak

   %31
   mi fad sol fad mi fad sol fad
   mi fad sol mi fad la red, si
   mi4 mi mi mi

   %34
   la r fad fad
   sol r mi mi
   fa! r sold, sold

   %37
   la r la8 si do la
   re mi fa sol\mbreak  fa mi re fa
   mi4 mi fa fa

   %40
   sold, sold la8 la' sold mi
   la fa re mi la,4 r
   r r8 mi' fad4 fad

   %43
   sold sold la la
   si si do r8 sold
   la fa mi mi,\mbreak la4 dod

   %46
   re r si si
   do r la la
   si r sold sold

   %49
   la r r r8 mi'
   fad fad sold sold la la si si
   do do re re mi do r4

   %52
   re r do r
   si r la r
   la r\mbreak la,8 do re mi

   %55
   la,4\fermata r r2_\markup\right-align\italic"Vivaldi ai copisti ”Poi copiate Beatus vir...”. Si ripete l'Antifona"

}


forma = {

    \time 4/4
    \key la\minor
    \tempo 2 = 50
    \partial 8 s8
    s1*55
    \bar "|."

}

VIsopranoI = {

    \notypeset
    \new Voice = "jucundus"
    <<\VIsopranoIn \forma>>
}



 VImd = {
    \context Staff = up
    <<\VImdn \forma>>

}

VIms = {
    \clef bass
    \context Staff = down
    <<\VImsn \forma>>
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

    r8 do\staccatissimo do\staccatissimo sol\staccatissimo sol\staccatissimo lab\staccatissimo
    fa\staccatissimo re'\staccatissimo re\staccatissimo fa,\staccatissimo fa\staccatissimo sol\staccatissimo
    mib\staccatissimo mib' mib2~

    %4
    mib8 fa si,4. re8
    do sol' sol4. do,8
    lab fa' fa4. si,8

    %7
    sol mib' sol, mib' sol, mib'
    lab,2.~
    lab8 re fa, re' fa, re'

    %10
    sol,2.~
    sol8 do mib, do' mib, do'
    fa,2.~

    %13
    fa8 fa' fa si, si re
    mib sol,(fa sol lab sol)
    mib' sol,(fa sol lab sol)

    %16
    mib'8. fa16 mib4 re
    do r r
    R2.*11

    %29
    sol8\p mib' sol, mib' sol, mib'
    lab,2.~
    lab8 re fa, re' fa, re'

    %32
    sol,2.~
    sol8 do mib, do' mib, do'
    fa,2.~

    %35
    fa8 re' si re do4~
    do8 re do4 si\tr
    do8 do do sol sol lab

    %38
    fa re' re fa, fa sol
    mib4 r r
    R2.*24

    %64
    sol8\p mib' sol, mib' sol, mib'
    lab,2.~
    lab8 re fa, re' fa, re'

    %67
    sol,2.~
    sol8 do mib, do' mib, do'
    fa,2.~

    %70
    fa8 si re, si' re, si'\mbreak
    sol4 r r
    R2.*11

    %83
    mib'8 sol,(fa sol lab sol)
    mib'8. fa16 mib4 re
    do2.\fermata

}

VIIvlIIn = \relative do'' {

    R2.*2
    r8 do\staccatissimo do\staccatissimo sol\staccatissimo sol\staccatissimo lab\staccatissimo
    fa\staccatissimo re'\staccatissimo re\staccatissimo fa,\staccatissimo fa\staccatissimo sol\staccatissimo

    %5
    mib\staccatissimo mib' mib2~
    mib8 fa si,4. re8
    do do mib, do' mib, do'

    %8
    mib,2.
    re8 sib' re, sib' re, sib'
    re,2.

    %11
    do8 lab' do, lab' do, lab'
    do,2.
    si8 re' re re, re si'

    %14
    sol mib(re mib fa mib)
    do' mib,(re mib fa mib)
    do'8. re16 do4 si

    %17
    do r r
    R2.*11
    mib,8\p do' mib, do' mib, do'

    %30
    mib,2.
    re8 sib' re, sib' re, sib'
    re,2.

    %33
    do8 lab' do, lab' do, lab'
    do,2.
    si8 si' re, si' mib,[mib']~

    %36
    mib fa re2\tr
    mib8 sol, sol mib mib do'
    re, si' si re, re si'

    %39
    sol4 r r
    R2.*24
    mib8\p do' mib, do' mib, do'

    %65
    mib,2.
    re8 sib' re, sib' re, sib'
    re,2.

    %68
    do8 lab' do, lab' do, lab'
    do,2.
    si8 sol' si, sol' si, sol'\mbreak

    %71
    mib4 r r
    R2.*11
    do'8 mib,\parentSlur ( re mib fa mib)

    %84
    do'8. re16 do4 si
    do2.\fermata

}

VIIvlaIn = \relative do' {

    R2.*4
    r8 do'\staccatissimo do\staccatissimo sol\staccatissimo sol\staccatissimo lab\staccatissimo
    fa\staccatissimo re'\staccatissimo re\staccatissimo fa,\staccatissimo fa\staccatissimo sol\staccatissimo

    %7
    mib4\staccatissimo r r
    do8 lab' do, lab' do, lab'
    sib,2.~

    %10
    sib8 sol' sib, sol' sib, sol'
    lab,2.~
    lab8 fa' lab, fa' lab, fa'

    %13
    sol, sol' sol sol, sol sol'
    do, do do do do do
    do do do do do do

    %16
    do[fa] sol fa sol sol,
    do4 r r
    R2.*12

    %30
    do8\p lab' do, lab' do, lab'
    sib,2.~
    sib8 sol' sib, sol' sib, sol'

    %33
    lab,2.~
    lab8 fa' lab, fa' lab, fa'
    sol, sol' sol, sol' sol, sol'

    %36
    sol, sol' sol, sol' sol, sol'
    do, mib mib do do mib
    si re sol re si sol

    %39
    do4 r r
    R2.*25
    do8\p lab' do, lab' do, lab'

    %66
    sib,2.~
    sib8 sol' sib, sol' sib, sol'
    lab,2.~

    %69
    lab8 fa' lab, fa' lab, fa'
    sol,2.\mbreak
    do4 r r

    %72
    R2.*11
    sol'8 sol, sol sol sol sol
    sol lab' sol sol sol sol

    %85
    mib2.\fermata

}

VIIaltoIn = \relative do' {

    \autoBeamOff
    R2.*16
    r4 do do
    lab'4. lab8 sol fa\mbreak

    %19
    mib[re] do4. do'8
    sib la? sol2~
    sol8 la fad2

    %22
    sol4 r si8 si
    do sol sol4. lab8
    fa?4. fa8 sol sol

    %25
    sol[fa] mib4 la!8 la
    sol4 re sib'?8 sib
    sib4. la8 la la

    %28
    re,[mib fa sol lab fa]
    mib4 do sol'8 sol
    lab4. lab8 lab lab

    %31
    lab?[sol] fa4 fa8 fa
    sol4. sol8 sol sol
    sol[fa] mib4 mib8 mib\mbreak

    %34
    fa4. fa8 fa fa
    fa4. re8 mib4~
    mib8 fa re2\tr

    %37
    do r4
    R2.
    r4 sol'2~

    %40
    sol4 fa2~
    fa4 mib2~
    mib4 re4. fad8

    %43
    sol4 re r
    R2.
    re2 re4

    %46
    sol8[mi] do4 r\mbreak
    r8 sol' sol sol16 sol sol8 sol
    lab2.~

    %49
    lab8 lab sib[lab] sol[fa]
    sol2.~
    sol8 sol lab[sol] fa[mib]

    %52
    fa2.~
    fa8 fa sol[fa] mib[re]
    mib2 mib4

    %55
    r8 sol sol sol16 sol sol8 sol
    sib sib la[sib] la[sol]
    fad re sol[la] sol[fa?]

    %58
    mi do fa[mib!] re[do]
    sol' sol r4 r\mbreak
    la2.

    %61
    sol
    fad4.(mib8) re4
    R2.

    %64
    r4 do do
    lab'4. sol8 fa mib
    fa4 fa re8 re

    %67
    sol4. fa8 mib re
    mib4 mib do8 do
    fa4. mib8 re do

    %70
    re4 re re8 re\mbreak
    mib do r4 r
    do'8[lab] fa4. do'8

    %73
    sib[sol] mib4. sib'8
    lab[fa] re4. lab'8
    sol mib sol4 r

    %76
    lab8 fa mib4(re\tr)
    do r r
    do'8[lab] fa4. do'8

    %79
    sib[sol] mib4. sib'8
    lab[fa] re4. lab'8
    sol mib sol4 r

    %82
    lab8 fa mib4(re\tr)
    do2 r4
    R2.*2

}

VIItestoII = \lyricmode {

    In me -- mo -- ria _ ae -- ter -- na  ae -- ter -- na e -- rit jus -- tus

    in me -- mo -- ria _ ae -- ter -- na e -- rit jus -- tus, e -- rit jus -- tus

    in me -- mo -- ria _ ae -- ter - na in me -- mo -- ria _ ae -- ter -- na

    in me -- mo -- ria _ ae -- ter -- na  in me -- mo -- ria _ ae -- ter -- na e -- rit jus -- tus,

   non ti -- me - - - bit non ti -- me -- bit

   ab au -- diti - one _ ma -- la non ti -- me -- bit non ti -- me -- bit non ti -- me -- bit

   ab au -- diti - one _ ma -- la non ti -- me -- bit non ti -- me -- bit non ti -- me -- bit

   non ti -- me -- bit.

   In me -- mo -- ria _ ae -- ter -- na in me -- mo -- ria _ ae -- ter -- na in me -- mo -- ria _ ae -- ter -- na

   e -- rit jus -- tus e - rit jus - tus e - rit jus -- tus non non ti -- me -- bit

   e - rit jus - tus e - rit jus -- tus non non ti -- me -- bit.



}

VIItenoreIn = \relative do' {

    \autoBeamOff

    R2.*19
    r4 sol sol
    mib'4. mib8 re do

    %22
    sib[la] sol4. fa'8
    mib re do2~
    do8 re si2

    %25
    do4 r fad8 fad
    re[do] sib4 sol8 sol
    mib'4. mib8 re do

    %28
    si [do re mib fa re]
    do4 sol r
    r r mib'8 mib

    %31
    re4. re8 re re
    re4 re re8 re
    do4. do8 do do\mbreak

    %34
    do4 do4. do8
    si4. si8 do4~
    do8 re do4(si\tr)

    %37
    do2 r4
    R2.
    r8 do do do16 do do8 do

    %40
    mib mib re[mib] re[do]
    si sol do[re] do[sib?]
    la fa sib[do] sib[la]

    %43
    sib sol re'2~
    re4 do2~
    do4 sib2~

    %46
    sib4 lab4. si8\mbreak
    do4 sol r
    r8 mib' mib mib16 mib mib8 mib

    %49
    fa2.~
    fa8 fa sol[fa] mib[re]
    mib2.~

    %52
    mib8 mib fa[mib] re[do]
    re2.~
    re8 do re[do] sib[la]

    %55
    sib sol re'2~
    re4 do2~
    do4 sib2~

    %58
    sib4 lab2
    sol8 re' re re16 re re8 re\mbreak
    mib mib re[mib] re[do]

    %61
    si sol do[re] do[sib?]
    la? fa sib[do] sib[la]
    sib sol si[do] re[si]

    %64
    do sol r4 r
    r4 mib'2
    re2.

    %67
    r4 re2
    do2.
    r4 do2

    %70
    si2.\mbreak
    do8 do mib2~
    mib4 re2~

    %73
    re4 do2~
    do4 si2
    do4 mib r

    %76
    do8 do do4 (si\tr)
    do mib2~
    mib4 re2~

    %79
    re4 do2~
    do4 si2
    do8 sol mib'4 r

    %82
    do8 do do4(si\tr)
    do2 r4
    R2.*2

}

VIItestoIII = \lyricmode {

    In me -- mo -- ria _ ae -- ter -- na  ae -- ter -- na e -- rit jus -- tus e -- rit jus -- tus

    in me -- mo -- ria _ ae -- ter - na

    in me -- mo -- ria _ ae -- ter -- na in me -- mo -- ria _ ae -- ter -- na ae -- ter -- na

    e -- rit jus -- tus.

   Ab au -- diti - one _ ma -- la non ti -- me -- bit non ti -- me -- bit non ti -- me -- bit

   non ti -- me - - - bit, ab au -- diti - one _ ma -- la non ti -- me -- bit non ti -- me -- bit

    non ti -- me -- bit non ti -- me - bit ab au -- diti - one _ ma -- la non ti -- me -- bit

    non ti -- me -- bit non ti -- me -- bit non ti -- me -- bit e -- rit jus -- tus non ti -- me -- bit

    non ti -- me - bit non non ti -- me -- bit non ti -- me - -  bit non non ti -- me -- bit.

}

VIIbassoIn = \relative do {

    \autoBeamOff

    R2.*22
    r4 do do
    lab'4. lab8 sol fa

    %25
    mib[re] do4. do'8
    sib la ?sol2~
    sol8 la fad2

    %28
    sol r4
    R2.
    r4 r do8 do

    %31
    sib4. sib8 sib sib
    sib4 sib sib8 sib
    lab4. lab8 lab lab\mbreak

    %34
    lab?4 lab4. lab8
    sol4. sol8 do4
    fa,4 sol(sol,)

    %37
    do2 r4
    R2.*5
    r8 sol' sol sol16 sol sol8 sol

    %44
    sib sib la[sib] la[sol]
    fad re sol[la] sol[fa?]
    mi do fa[sol] fa[re]\mbreak

    %47
    mib do r4 r
    r8 do' do do16 do do8 do
    re2.~

    %50
    re8 re mib[re] do[sib]
    do2.~
    do8 do re[do] si[la!]

    %53
    si2.
    do8 la sib![la] sol[fad]
    sol sol, r4 r

    %56
    R2.*3
    r4 sol'2~\mbreak
    sol4 fa2~

    %61
    fa4 mib2~
    mib4 re4. fad8
    sol sol, sol'[lab] sol[fa?]

    %64
    mib do r4 r
    r8 do' do do16 do do8 do
    sib sib sib sib sib4

    %67
    sib8 sib sib sib16 sib sib8 sib
    lab lab lab lab lab4
    lab?8 lab lab lab16 lab lab8 lab

    %70
    sol sol sol sol sol4\mbreak
    do, do'8[re] do sib
    lab fa sib[do sib lab]

    %73
    sol mib lab[sib] lab sol
    fa re sol[lab sol fa]
    mib do do'4 r

    %76
    fa,8 lab sol4 sol,
    do do'8[re] do sib
    lab fa sib[do sib lab]

    %79
    sol mib lab[sib] lab sol
    fa re sol[lab sol fa]
    mib do do'4 r

    %82
    fa,8 lab sol4 sol,
    do2 r4
    R2.*2

}

VIItestoIV = \lyricmode {

    In me -- mo -- ria _ ae -- ter -- na  ae -- ter -- na e -- rit jus -- tus

    in me -- mo -- ria _ ae -- ter -- na

    in me -- mo -- ria _ ae -- ter -- na ae -- ter -- na

    e -- rit jus -- tus.

   Ab au -- diti - one _ ma -- la non ti -- me -- bit non ti -- me -- bit non ti -- me -- bit,

   ab au -- diti - one _ ma -- la non ti -- me -- bit non ti -- me - bit

    non ti -- me -- bit % OOKK

    non ti -- me - - - bit non ti -- me -- bit

    ab au -- diti - one _ ma -- la non ti -- me -- bit ab au -- diti - one _ ma -- la non ti -- me -- bit

    ab au -- diti - one _ ma -- la non ti -- me -- bit ab au -- diti -- one _ ma - la

    ab au -- diti -- one _ ma - la non non ti -- me - bit ab au -- diti -- one _ ma - la

    ab au -- diti -- one _ ma - la non non ti -- me - bit.

}

VIIbcIn = \relative do {

    R2.*16
    r8_\markup\italic"Un Org[ano] e Bassi" mib mib do do mib
    fa do' do si si sol\mbreak

    %19
    do sol mib do do[fad]
    sol re sib! sol sol sib
    do do' re re, re  re,

    %22
    sol re' sol[si, sol sol']
    do,[do, do do' do do]
    lab' lab, lab lab' sol fa

    %25
    mib re do do, do \once \stemDown do''
    sib la? sol sol, sol sol'
    sol la \stemDown fad[\stemUp re, re \stemDown fad']\stemNeutral

    %28
    sol do, sol do fa[si,]
    do4 r r
    R2.*9

    %39
    r8 do do re mib re
    \once\stemUp do mib' re mib re do
    si sol do[re do sib?]

    %42
    la fa sib[do sib la]
    sib sol sol sol, sol sol'
    sib sib la sib la sol

    %45
    fad re sol la sol fa
    mi[do] fa sol fa re\mbreak
    mib do do sol' mib do

    %48
    fa do' do, do' do do,
    sib sib' sib, sib' sib sib,
    mib, mib' mib, mib' mib mib,

    %51
    lab lab' lab, lab' lab lab,
    re, re' re, re' re re,
    sol sol' sol, sol' sol sol,

    %54
    do do' fad,[la sol fad]
    sol, sol' sol, sol' sol sol,
    sol[sol'] do, do' do do,

    %57
    do[do'] sib, sib' sib sib,
    sib[sib'] lab, lab' lab lab
    sol, sol'sol, sol' sol sol,\mbreak

    %60
    sol[sol'] fa, fa' fa fa,
    fa[fa'] mib, mib' mib mib,
    mib[mib'] re, re' re fad

    %63
    sol sol, sol'[lab sol fa?]
    mib do r4 r
    R2.*6

    %71
    r4 do'8 re do sib
    lab fa sib do sib lab
    sol mib lab sib lab sol

    %74
    fa re sol lab sol fa
    mib do do'[sol mib do]
    fa lab sol fa sol sol,

    %77
    do4 do'8 re do sib
    lab fa sib do sib lab
    sol mib lab sib lab sol

    %80
    fa re sol lab sol fa
    mib[do] do' sol mib do
    fa lab sol fa sol sol,

    %83
    do do do do do do
    do fa sol fa sol sol,
    do2.\fermata_\markup\right-align\italic"Vivaldi ai copisti ”Qui si replica Beatus vir...”. Si ripete l'Antifona"

}

VIIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*17
    <_->8 <5-> s <7> s <7>
    s2 s8 <6 5>
    <_->2.
    <6 5>4 <_+> s
    s2 s8 <7>
    s2.
    <6>4 <2!> s
    s2 <6! 4+>4
    s2.
    <6 3>4 <7> s
    <_!> <7> <_->8 <7>
    s2.*11
    <5>2.
    <6 5>
    <6 5>2 s8 <6+>
    s2.*2
    <6 5>2.
    <6 5>2 s8 <6!>
    s2.
    <_->4 <6-> s
    <7->2.
    <7>
    <7>
    <7>
    <7>
    <9 3>8 <8> s2
    <_->2.
    s4 <6>2
    <6 4+>4 <6>2
    <6 4!>4 <6>2
    <_!>2.
    <6 3>4 <6>2
    <4! 2>4 <6>2
    <4+ 2>4 <3+>2
    s4 <_!>2
    s2.*8
    <6 5>2.
    <6 5>
    <6 5>4 <_!>2
    s2.
    <_->4 <6 4> <5 3!>
    s2.
    <6 5>
    <6 5>
    <6 5>4 <_!> s
    s2.
    <_->4 <6 4> <5 3!>
    s2.
    s4 <6 5> <5 3!>

}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key sib\major
    \tempo 2 = 45
    s2.*85
    \bar "|."

}

VIIvlI = {
    \notypeset
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    <<\VIIvlIIn \forma>>

}

VIIvlaI = {
    \clef alto
    <<\VIIvlaIn \forma>>

}

VIIaltoI = {
    \new Voice = "memoria2"
    <<\VIIaltoIn \forma>>
}

VIItenoreI = {
    \new Voice = "memoria3"
    <<\VIItenoreIn \forma>>
}

VIIbassoI = {
    \clef bass
    \new Voice = "memoria4"
    <<\VIIbassoIn \forma>>
}



VIIbcI = {
    \clef bass
    <<\VIIbcIn \forma \VIIbfIn>>
    \typeset
}



VIIIobIn = \relative do'' {

    r8 mi sol
    r re sol
    r mi sol

    %4
    r re sol
    r mi sol
    r mi la

    %7
    la4 sol8~
    sol fad la,
    si re sol

    %10
    R4.*8
    r8 si, re
    r re sold

    %20
    r sol? si
    r la do
    R4.*4

    %26
    sol,16 si mi sol si si,
    do la do  mi la r
    la, dod mi la dod mi,

    %29
    fad la, do? fad la r
    si, red fad si fad red
    mi si mi sol si r

    %32
    mi, si mi sol si r
    mi,8 mi, r
    mi16 mi' fad, mi' sol, mi'

    %35
    la, mi' si mi si red
    mi si mi sol si sol
    fad si, red fad si fad


    %38
    sol4 si,8
    mi sold si
    r r la,

    %41
    re fad la\mbreak
    r8 r sol,
    do mi sol

    %44
    R4.*12
    fa16 sol la sol la fa

    %57
    do'4 do8
    do4.
    do

    %60
    do
    do
    do4 do8

    %63
    do4 si!8\mbreak
    do16 mi, re do si la
    sol do si la sol fa

    %66
    mi la sol fa mi re
    do8 do''4~
    do4.

    %69
    do~
    do
    do~

    %72
    do8. re16 do8
    re4.~
    re

    %75
    re~
    re
    re~

    %78
    re8. mi16 re8
    mi4.~
    mi

    %81
    mi~
    mi
    mi~

    %84
    mi8. mi16 mi8\mbreak
    do si8. si16
    do mi, re do si la

    %87
    sol do si la sol fa
    mi la sol fa mi re
    do' re mi re mi do

    %90
    sol'4 sol8
    sol4.~
    sol

    %93
    sol
    sol~
    sol8. sol16 sol8

    %96
    sol,8. fa16 mi re
    do re mi fa sol la
    re, mi fa sol la si

    %99
    mi, fa sol la si do
    fa, sol la si do re
    si8. si16 sol8

    %102
    la sol8. sol16
    mi4 r8\mbreak
    r8 sol'16 la si sol

    %105
    do8. do,16 do8
    re4 re8
    mi8. fa16 sol8

    %108
    la sol8.\parenthesize \tr sol16
    mi4.\fermata

}


VIIIobIIn = \relative do'' {

    r8 do mi
    r si re
    r do mi

    %4
    r si re
    r do mi
    r do mi

    %7
    fad4 re8
    mi re fad,
    sol si re

    %10
    R4.*8
    r8 sol, si
    r si re

    %20
    r re sold
    r mi la
    R4.*4

    %26
    mi,16 sol si mi sol sol,
    la mi la do mi r
    mi, la dod mi la dod,

    %29
    re fad, la re fad r
    fad, si red fad red si
    si sol si mi sol r

    %32
    si, sol si mi sol r
    si,8 sol r
    mi16 mi' fad, mi' sol, mi'

    %35
    la, mi' si mi si red
    mi sol, si mi sol mi
    red fad, si red fad red

    %38
    mi4 sol,8
    si mi sold
    r r dod,

    %41
    la re fad\mbreak
    r r si,
    sol do mi

    %44
    R4.*13
    do16 re mi re mi do

    %58
    fa4 fa8
    mi16 fa sol fa sol mi
    fa[sol la sol la fa]

    %61
    sol[la sib la sib sol]
    la8 la la
    sol4 sol8\mbreak

    %64
    sol16 mi re do si la
    sol do si la sol fa
    mi la sol fa mi re

    %67
    do8 sol''16[fa mi re]
    do4 do8
    sol'16[la sol fa mi re]

    %70
    do8. do16 do8
    sol'16[la sol fa mi re]
    do8. si16 do8

    %73
    la'16[si la sol fad mi]
    re4 re8
    la'16[si la sol fad mi]

    %76
    re8. re16 re8
    la'16[si la sol fad mi]
    re8. do16 re8

    %79
    si'16[do si la sold fad]
    mi4 mi8
    si'16[do si la sold fad]

    %82
    mi8. mi16 mi8
    si'16[do si la sold fad]
    mi8. re16 mi8\mbreak

    %85
    la la sold
    la16 mi re do si la
    sol do si la sol fa

    %88
    mi la sol fa mi re
    R4.
    sol16 la si la si sol
    do4 do8

    %92
    re4.
    mi
    fa

    %95
    mi8. mi16 mi8
    do[si16 la sol fa]
    mi[fa sol la si do]

    %98
    fa,[sol la si do re]
    sol,[la si do re mi]
    la,[si do re mi fa]

    %101
    fa8. re16 mi8~
    mi16 fa re8. do16
    do8 do16 re mi do\mbreak

    %104
    sol'4.~
    sol~
    sol~

    %107
    sol8. fa16 mi8
    fa re8.\tr do16
    do4.\fermata

}


VIIIvlIn = \relative do'' {

    r8 mi sol
    r re sol
    r mi sol

    %4
    r re sol
    r mi sol
    r mi la

    %7
    la4 sol8~
    sol fad la,
    si re sol

    %10
    R4.*8
    r8 si, re
    r re sold

    %20
    r sol? si
    r la do
    R4.*4

    %26
    sol,16 si mi sol si si,
    do la do  mi la r
    la, dod mi la dod mi,

    %29
    fad la, do? fad la r
    si, red fad si fad red
    mi si mi sol si r

    %32
    mi, si mi sol si r
    mi,8 mi, r
    mi16 mi' fad, mi' sol, mi'

    %35
    la, mi' si mi si red
    mi si mi sol si sol
    fad si, red fad si fad


    %38
    sol4 si,8
    mi sold si
    r r la,

    %41
    re fad la\mbreak
    r8 r sol,
    do mi sol

    %44
    R4.
    re,8 re re
    re re re

    %47
    re re re
    sol sol sol
    do, do do

    %50
    re re re
    R4.*5
    fa'16 sol la sol la fa

    %57
    do'4 do8
    do4.
    do

    %60
    do
    do
    do4 do8

    %63
    do4 si!8\mbreak
    do16 mi, re do si la
    sol do si la sol fa

    %66
    mi la sol fa mi re
    do8 do''4~
    do4.

    %69
    do~
    do
    do~

    %72
    do8. re16 do8
    re4.~
    re

    %75
    re~
    re
    re~

    %78
    re8. mi16 re8
    mi4.~
    mi

    %81
    mi~
    mi
    mi~

    %84
    mi8. mi16 mi8\mbreak
    do si8. si16
    do mi, re do si la

    %87
    sol do si la sol fa
    mi la sol fa mi re
    do' re mi re mi do

    %90
    sol'4 sol8
    sol4.~
    sol

    %93
    sol
    sol~
    sol8. sol16 sol8

    %96
    sol,8. fa16 mi re
    do re mi fa sol la
    re, mi fa sol la si

    %99
    mi, fa sol la si do
    fa, sol la si do re
    si8. si16 sol8

    %102
    la sol8. sol16
    mi4 r8\mbreak
    r8 sol'16 la si sol

    %105
    do8. do,16 do8
    re4 re8
    mi8. fa16 sol8

    %108
    la sol8.\parenthesize \tr sol16
    mi4.\fermata

}

VIIIvlIIn = \relative do'' {

    r8 do mi
    r si re
    r do mi

    %4
    r si re
    r do mi
    r do mi

    %7
    fad4 re8
    mi re fad,
    sol si re

    %10
    R4.*8
    r8 sol, si
    r si re

    %20
    r re sold
    r mi la
    R4.*4

    %26
    mi,16 sol si mi sol sol,
    la mi la do mi r
    mi, la dod mi la dod,

    %29
    re fad, la re fad r
    fad, si red fad red si
    si sol si mi sol r

    %32
    si, sol si mi sol r
    si,8 sol r
    mi16 mi' fad, mi' sol, mi'

    %35
    la, mi' si mi si red
    mi sol, si mi sol mi
    red fad, si red fad red

    %38
    mi4 sol,8
    si mi sold
    r r dod,

    %41
    la re fad\mbreak
    r r si,
    sol do mi

    %44
    R4.
    re,8 re re
    re re re

    %47
    re re re
    sol sol sol
    do, do do

    %50
    re re re
    R4.*6
    do'16 re mi re mi do

    %58
    fa4 fa8
    mi16 fa sol fa sol mi
    fa[sol la sol la fa]

    %61
    sol[la sib la sib sol]
    la8 la la
    sol4 sol8\mbreak

    %64
    sol16 mi re do si la
    sol do si la sol fa
    mi la sol fa mi re

    %67
    do8 sol''16[fa mi re]
    do4 do8
    sol'16[la sol fa mi re]

    %70
    do8. do16 do8
    sol'16[la sol fa mi re]
    do8. si16 do8

    %73
    la'16[si la sol fad mi]
    re4 re8
    la'16[si la sol fad mi]

    %76
    re8. re16 re8
    la'16[si la sol fad mi]
    re8. do16 re8

    %79
    si'16[do si la sold fad]
    mi4 mi8
    si'16[do si la sold fad]

    %82
    mi8. mi16 mi8
    si'16[do si la sold fad]
    mi8. re16 mi8\mbreak

    %85
    la la sold
    la16 mi re do si la
    sol do si la sol fa

    %88
    mi la sol fa mi re
    R4.
    sol16 la si la si sol
    do4 do8

    %92
    re4.
    mi
    fa

    %95
    mi8. mi16 mi8
    do[si16 la sol fa]
    mi[fa sol la si do]

    %98
    fa,[sol la si do re]
    sol,[la si do re mi]
    la,[si do re mi fa]

    %101
    fa8. re16 mi8~
    mi16 fa re8. do16
    do8 do16 re mi do\mbreak

    %104
    sol'4.~
    sol~
    sol~

    %107
    sol8. fa16 mi8
    fa re8.\tr do16
    do4.\fermata

}

VIIIvlaIn = \relative do' {

    r8 sol' sol
    r sol si
    r sol sol

    %4
    r sol si
    r sol sol
    r la do

    %7
    re4 si8
    la4 re,8
    re sol si

    %10
    R4.*8
    r8 re, sol
    r sold si

    %20
    r si re
    r do mi
    R4.*4

    %26
    si,8 si mi
    mi mi mi
    dod dod dod

    %29
    la la la
    la la la
    sol sol sol

    %32
    sol' sol sol
    sol mi r
    sol, la si

    %35
    do si si
    si si si
    si si si

    %38
    si4 mi8
    sold si mi
    r r mi,

    %41
    fad la re\mbreak
    r r re,
    mi sol? do

    %44
    R4.
    re,8 re re
    re re re

    %47
    re re re
    sol sol sol
    do, do do

    %50
    re re re
    R4.*7
    fa16 sol la sol la fa

    %59
    do'4 do8
    la16 sib do sib do la
    sib4.

    %62
    la16 sib do8 la
    re,4 re8\mbreak
    mi16 mi' re do si la

    %65
    sol do si la sol fa
    mi la sol fa mi re
    do8 mi sol

    %68
    la sib do
    mi, fa sol
    la sib do

    %71
    mi, fa sol
    la8. si?16 la8
    r fad la

    %74
    si do re
    fad, sol la
    si do re

    %77
    fad,[sol] la
    si8. do16 si8
    r sold si

    %80
    do[re] mi
    sold,[la] si
    do re mi

    %83
    sold,[la] si
    do8. re16 do8\mbreak
    mi mi8. mi16

    %86
    mi16 mi re do si la
    sol do si la sol fa

    %88
    mi la sol fa mi re
    R4.*3
    sol,16[la si la si sol]

    %93
    do4 do8
    si16[do re do re si]
    mi8. do16 do8

    %96
    R4.
    mi8[re16 do si la]
    fa'8[mi16 re do si]

    %99
    sol'8[fa16 mi re do]
    re8[do16 si la sol]
    re'8. si16 do8~

    %102
    do16 do do8 si
    do4 r8\mbreak
    R4.*2

    %106
    r8 sol16[la si sol]
    do8. do16 do8
    do do si

    %109
    do4.\fermata

}

VIIIsopranoIn = \relative do'' {

    \autoBeamOff

    do4.
    si16[la] sol8 fa
    mi16[re] do4

    %4
    sol'8 si sol
    do8. do,16 do8
    do'4 la8 fad re sol

    %7
    do, re4\parenthesize \tr
    sol4.

    %10
    R4.*8
    si16[do] re8 si
    sold8. fad16 mi8

    %20
    si'16[do] re8 si
    do16 si la4
    R4.*4

    %26
    si8 r16 si si si
    do8. do16 do8
    dod r16 dod dod dod

    %29
    re8. re16 re8
    red8 red red8
    mi16 mi mi8 mi16 mi

    %32
    mi8 mi, mi'16 mi
    mi8 mi, r
    mi' re16[do si la]

    %35
    sol la fad4
    mi r8
    R4.

    %38
    r8 r mi'
    mi si r
    r r mi

    %41
    re la r\mbreak
    r r re
    do sol r

    %44
    R4.
    do4.
    re

    %47
    do4 do8
    sib4.~
    sib4 sib8

    %50
    la4.
    R4.*5
    fa16[sol] la[sol] la fa

    %57
    do'4 do8
    do4.
    do

    %60
    do
    do
    do4 do8

    %63
    do4 si!8\mbreak
    do4 r8
    si16[do re8] re

    %66
    mi mi r
    do4.~
    do

    %69
    do~
    do
    do~

    %72
    do8. re16 do8
    re4.~
    re

    %75
    re~
    re
    re~

    %78
    re8. mi16 re8
    mi4.~
    mi

    %81
    mi~
    mi
    mi~

    %84
    mi8. mi16 mi8\mbreak
    do si8. si16
    do4 r8

    %87
    R4.*3
    sol16[la si la] si[sol]
    do4 do8

    %92
    re4.
    mi
    fa

    %95
    mi8. mi16 mi8
    do[si16 la] sol[fa]
    mi[fa sol la si do]

    %98
    fa,[sol la si do re]
    sol,[la si do re mi]
    la,[si do re mi fa]

    %101
    fa8. re16 mi8~
    mi16 fa re8. do16
    do8 do16[re] mi[do]\mbreak

    %104
    sol'4.~
    sol~
    sol~

    %107
    sol8. fa16 mi8
    fa re8.\tr do16
    do4.\fermata

}

VIIItestoI = \lyricmode {

    Pa -- ratum _ cor e -- jus spe -- rare_in _ Do -- mino, _

    con -- fir -- matum _ est cor e -- jus, non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at

    non non com -- mo -- ve -- bitur _ non non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at  i -- ni -- mi -- cos i -- ni -- mi -- cos i -- ni -- mi -- cos su -- os.

    Dis -- persit, _ dis -- persit, _ dis -- persit, _ de -- dit pa -- u -- pe -- ri -- bus,

    jus -- ti -- tia _ e -- jus ma -- net in sae -- cu -- lum sae -- cu -- li.

    Cor -- nu e -- jus e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    e -- xal -- ta -- bitur _ in glo -- ri -- a,

    cor -- nu e -- jus  e - xal -- ta -- bitur _ e -- xal -- ta - - - -  bitur _

    in glo -- ri -- a, e -- xal -- ta -- bitur _ in glo -- ri -- a.

}

VIIIaltoIn = \relative do' {

    \autoBeamOff

    do'4.
    si16[la] sol8 fa
    mi16[re] do4

    %4
    sol'8 si sol
    do8. do,16 do8
    do'4 la8 fad re sol

    %7
    do, re4\parenthesize \tr
    sol,4.

    %10
    R4.*8
    si16[do] re8 si
    sold8. fad16 mi8

    %20
    si'16[do] re8 si
    do16 si la4
    R4.*4

    %26
    sol'8 r16 sol sol sol
    la8. la16 la8
    sol r16 sol sol sol

    %29
    fad8. fad16 fad8
    fad?8 fad fad8
    sol16 sol sol8 sol16 sol

    %32
    sol8 sol sol16 sol
    sol8 sol r
    mi mi mi

    %35
    mi mi[red]
    mi4 r8
    R4.

    %38
    r8 r si'
    sold mi r
    r r la

    %41
    fad re  r\mbreak
    r r sol
    fa do r

    %44
    R4.
    la'
    sib

    %47
    la4 la8
    sol4.~
    sol4 sol8

    %50
    fa4.
    R4.*6
    do16[re] mi[re] mi do

    %58
    fa4 fa8
    mi16[fa] sol[fa] sol[mi]
    fa[sol la sol la fa]

    %61
    sol[la sib la sib sol]
    la8 la la
    sol4 sol8\mbreak

    %64
    sol4 r8
    sol16[la si?8] si
    sol sol r

    %67
    sol16[la sol fa] mi[re]
    do4 do8
    sol'16[la sol fa] mi[re]

    %70
    do8. do16 do8
    sol'16[la sol fa] mi[re]
    do8. si16 do8

    %73
    la'16[si la sol] fad[mi]
    re4 re8
    la'16[si la sol] fad[mi]

    %76
    re8. re16 re8
    la'16[si la sol] fad [mi]
    re8. do16 re8

    %79
    si'16[do si la] sold [fad]
    mi4 mi8
    si'16[do si la] sold [fad]

    %82
    mi8. mi16 mi8
    si'16[do si la] sold[fad]
    mi8. re16 mi8\mbreak

    %85
    la la sold
    la4 r8
    R4.*2

    %89
    do,16[re mi re] mi[do]
    sol'4 sol8
    sol4.~

    %92
    sol
    sol
    sol~

    %95
    sol8. sol16 sol8
    sol8.[fa16] mi[re]
    do[re mi fa sol la]
    re, [mi fa sol la si]

    %99
    mi, [fa sol la si do]
    fa, [sol la si do re]
    si8. si16 sol8

    %102
    la sol8. sol16
    mi4 r8\mbreak
    r8 sol16 [la] si [sol]

    %105
    do8. do,16 do8
    re4 re8
    mi8. fa16 sol8

    %108
    la sol8.\parenthesize \tr sol16
    mi4.\fermata

}

VIIItestoII = \lyricmode {

    Pa -- ratum _ cor e -- jus spe -- rare_in _ Do -- mino, _

    con -- fir -- matum _ est cor e -- jus, non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at

    non non com -- mo -- ve -- bitur _ non non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at  i -- ni -- mi -- cos i -- ni -- mi -- cos i -- ni -- mi -- cos su -- os.

    Dis -- persit, _ dis -- persit, _ dis -- persit, _ de -- dit pa -- u -- pe -- ri -- bus,

    jus -- ti -- tia _ e -- jus ma -- net in sae - - cu -- lum sae -- cu -- li.

    Cor -- nu e -- jus cor -- nu e -- jus e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta --  bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    in glo -- ri -- a, cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta - - - - bitur _

    in glo -- ri -- a, e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _  in glo -- ri -- a.

}

VIIItenoreIn = \relative do' {

    \autoBeamOff

    do4.
    si16[la] sol8 fa
    mi16[re] do4

    %4
    sol'8 si sol
    do8. do,16 do8
    do'4 la8 fad re sol

    %7
    do, re4\parenthesize \tr
    sol4.

    %10
    R4.*8
    si16[do] re8 si
    sold8. fad16 mi8

    %20
    si'16[do] re8 si
    do16 si la4
    R4.*4

    %26
    mi'8 r16 mi mi mi
    mi8. mi16 mi8
    mi r16 mi mi dod

    %29
    la8. la16 la8
    la8 la la8
    si16 si si8 si16 si

    %32
    si8 si si16 si
    si8 si r
    sol la si

    %35
    do si4
    si r8
    R4.

    %38
    r8 r sol
    si sold r
    r r dod

    %41
    la fad r\mbreak
    r r si
    sol mi r

    %44
    R4.
    do'
    sib

    %47
    do4 fa8
    re4.
    mi4 mi8

    %50
    do4.
    R4.*7
    fa,16[sol] la[sol] la fa

    %59
    la4 la8
    la16[sib] do[sib] do[la]
    sib4.

    %62
    la16[sib] do[re] mi[fa]
    re4 re8\mbreak
    mi4 r8

    %65
    re4 re8
    do sol r
    r mi sol

    %68
    la[sib] do
    mi,[fa] sol
    la sib do

    %71
    mi,[fa] sol
    la8. si?16 la8
    r fad la

    %74
    si[do] re
    fad,[sol] la
    si do re

    %77
    fad,[sol] la
    si8. do16 si8
    r sold si

    %80
    do[re] mi
    sold,[la] si
    do re mi

    %83
    sold,[la] si
    do8. re16 do8\mbreak
    mi mi8. mi16

    %86
    mi4 r8
    R4.*5
    sol,16[la si la] si [sol]

    %93
    do4 do8
    si16[do re do] re[si]
    mi8. do16 do8

    %96
    R4.
    mi8[re16 do] si[la]
    fa'8[mi16 re do si]

    %99
    sol'8[fa16 mi re do]
    re8[do16 si la sol]
    re'8. si16 do8~

    %102
    do16 do do8 si
    do4 r8\mbreak
    R4.*2

    %106
    r8 sol16[la] si[sol]
    do8. do16 do8
    do do si

    %109
    do4.\fermata

}

VIIItestoIII = \lyricmode {

    Pa -- ratum _ cor e -- jus spe -- rare_in _ Do -- mino, _

    con -- fir -- matum _ est cor e -- jus, non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at

    non non com -- mo -- ve -- bitur _ non non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at  i -- ni -- mi -- cos i -- ni -- mi -- cos i -- ni -- mi -- cos su -- os.

    Dis -- persit, _ dis -- persit, _ dis -- persit, _ de -- dit pa -- u -- pe - ri -- bus,

    jus -- ti -- tia _ e -- jus ma -- net in sae - cu -- lum sae -- cu -- li.

    Cor -- nu e -- jus cor -- nu e -- jus e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta --  bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    in glo -- ri -- a, cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta - - - bitur _

    in glo -- ri -- a, e -- xal -- ta -- bitur _  in glo -- ri -- a.

}

VIIIbassoIn = \relative do {

    \autoBeamOff

    do'4.
    si16[la] sol8 fa
    mi16[re] do4

    %4
    sol'8 si sol
    do8. do,16 do8
    do'4 la8 fad re sol

    %7
    do, re4\parenthesize \tr
    sol,4.

    %10
    R4.*8
    si16[do] re8 si
    sold8. fad16 mi8

    %20
    si'16[do] re8 si
    do16 si la4
    R4.*4

    %26
    mi'8 r16 mi mi mi
    la8. la16 la8
    la, r16 la la la

    %29
    re8. re16 re8
    si8 si si8
    mi16 mi mi8 mi16 mi

    %32
    mi8 mi mi16 mi
    mi8 mi r
    mi fad sol

    %35
    la si [si,]
    mi4 r8
    R4.

    %38
    r8 r mi
    mi mi r
    r r la

    %41
    re, re r\mbreak
    r r sol
    do, do r

    %44
    R4.
    fa4.
    fa

    %47
    fa4 fa8
    sol4.
    do,4 do8

    %50
    fa4.
    R4.*8
    do16 [re] mi [re] mi do
    fa4 fa8

    %61
    mi16 [fa] sol [fa] sol [mi]
    fa8 fa fa
    sol sol,4\mbreak

    %64
    do r8
    sol'4 fa8
    mi do r

    %67
    r8 do mi
    fa [sol] la
    do, [re] mi

    %70
    fa sol la
    do, [re] mi
    fa8. fa16 fa8

    %73
    r re fad
    sol [la] si
    re, [mi] fad

    %76
    sol la si
    re, [mi] fad
    sol8. sol16 sol8

    %79
    r mi sold
    la [si] do
    mi, [fad] sold

    %82
    la si do
    mi, [fad] sold
    la8. la16 la8\mbreak

    %85
    la mi mi
    la,4 r8
    R4.*4

    %91
    do16 [re mi re] mi [do]
    sol'4 fa8
    mi16 [fa mi re] mi [do]

    %94
    sol' [la si la si sol]
    do8. do,16 do8
    do16 [re mi8] fad

    %97
    sol4.~
    sol~
    sol~

    %100
    sol~
    sol8. sol16 do,8
    fa sol sol,

    %103
    do4 r8\mbreak
    R4.
    r8 do16 [re] mi [do]

    %106
    sol'4 fa8
    mi8. re16 do8
    fa sol sol,

    %109
    do4.\fermata

}

VIIItestoIV = \lyricmode {

    Pa -- ratum _ cor e -- jus spe -- rare_in _ Do -- mino, _

    con -- fir -- matum _ est cor e -- jus, non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at

    non non com -- mo -- ve -- bitur _ non non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at  i -- ni -- mi -- cos i -- ni -- mi -- cos i -- ni -- mi -- cos su -- os.

    Dis -- persit, _ dis -- persit, _ dis -- persit, _ de -- dit pa -- u -- pe - ri -- bus,

    jus -- ti -- tia _ e -- jus ma -- net in sae -- cu -- lum sae -- cu -- li.

    Cor -- nu e -- jus cor -- nu e -- jus e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta --  bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    in glo -- ri -- a, cor -- nu e -- jus  e -- xal -- ta - bitur _ e -- xal -- ta -- bitur _

    in glo -- ri -- a, e -- xal -- ta - - bitur _  in glo -- ri -- a.

}

VIIIbcIn = \relative do {

    do8 do' do,
    r sol' sol,
    r do do,

    %4
    r sol'' sol,
    r do do,
    r do'' la

    %7
    fad re sol
    do, re re,
    sol sol' sol,

    %10
    R4.*8
    sol8 sol' sol,
    r mi' mi,

    %20
    r mi' mi,
    r la' la,
    R4.*4

    %26
    mi'16 mi mi mi mi mi
    la8 la, la
    la16 la la la la la

    %29
    re8 re re
    si16 si si si si si
    mi mi mi mi mi mi

    %32
    mi mi mi mi mi mi
    mi8 mi, r
    mi' fad sol

    %35
    la si si,
    mi mi mi
    si' si, si

    %38
    mi mi, mi'
    mi mi, r
    r r la'

    %41
    re, re, r\mbreak
    r r sol'
    do, do, r

    %44
    R4.*15
    do'16 re mi re mi do
    fa4 fa8

    %61
    mi16 fa sol fa sol mi
    fa8 fa, fa
    sol' sol, sol\mbreak

    %64
    do16 mi' re do si la
    sol do si la sol fa
    mi la sol fa mi re

    %67
    do8 do mi
    fa sol la
    do, re mi

    %70
    fa sol la
    do, re mi
    fa8. fa16 fa8

    %73
    r re fad
    sol la si
    re, mi fad

    %76
    sol la si
    re, mi fad
    sol8. sol16 sol8

    %79
    r mi sold
    la si do
    mi, fad sold

    %82
    la si do
    mi, fad sold
    la8. la16 la8\mbreak

    %85
    la mi mi,
    \once\stemUp la16 mi'' re do si la
    sol do si la sol fa

    %88
    mi la sol fa mi re
    \clef alto do' re mi re mi do
    sol' la si la si sol\clef bass

    %91
    do,, re mi re mi do
    sol'4 fa8
    mi16 fa mi re mi do

    %94
    sol' la si la si sol
    do8. do,16 do8
    do16 re mi8[fad]

    %97
    sol4.\tasto~
    sol~
    sol~

    %100
    sol~
    sol8. sol16 do,8
    fa sol sol,

    %103
    do4 r8\mbreak
    R4.
    r8 do16^\markup\italic"[Tutti]" re mi do

    %106
    sol8 sol' fa
    mi8. re16 do8
    fa sol sol,

    %109
    do4.\fermata

}

VIIIbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*5
    s8 <6>4
    s4.
    <6 5>8 <_+>4
    s4.*10
    s8 <_+>4
    s8 <7>4
    s4.*5
    <5>4.
    s
    <7 5+>
    <_+>
    <7 +>
    s4.*6
    <_+>4.
    s
    <_+>
    s8 s <_+>
    <_+>4.
    s4.*19
    <6 5>4.
    s
    <5 4>8 <3!>4
    s4.*4
    s8 <_->4
    s4.
    s8 <_->4
    s4.
    s
    s8 <_+>4
    s4.
    <_+>
    s
    <_+>
    s
    s8 <_+>4
    s4.
    <_+>
    s
    <_+>
    s
    s8 <5 4> <3+>
    s4.*6
    s4 <6 4>8
    s4.
    <7>
    s4.*6
    <7>4.
    <7>8 <5 4> <3>
    s4.*5
    s8 <5 4> <3>

}


VIIIvlIIIn = \relative do'' {

    R4.*9
    r8 mi sol
    r8 re sol

    %12
    r mi sol
    r re sol
    r mi sol

    %15
    r mi la
    la4 sol8~
    sol fad la,

    %18
    re4 r8
    R4.*3
    r8 do mi\mbreak

    %23
    r fad la
    r fad? la
    r sol si

    %26
    R4.
    la,16 do mi la do mi,
    dod la dod mi la r

    %29
    la, re fad la fad re
    fad si, red fad si r
    mi, si mi sol si r

    %32
    mi, si mi sol si r
    mi,8 mi, r
    mi16 mi' fad, mi' sol, mi'

    %35
    la, mi' si mi si red
    mi si mi sol si sol
    fad si, red fad si fad

    %38
    sol4 r8
    r r si,
    dod mi la

    %41
    r r la,\mbreak
    si re sol
    r r sol,

    %44
    la do fa
    R4.*5
    fa,8 fa fa

    %51
    fa fa fa
    fa fa fa
    sol sol sol

    %54
    do, do do
    fa fa fa
    fa'16 sol la sol la fa

    %57
    do'4 do8
    do4.
    do

    %60
    do
    do
    do4 do8

    %63
    do4 si!8\mbreak
    do16 mi, re do si la
    sol do si la sol fa

    %66
    mi la sol fa mi re
    do8 do''4~
    do4.

    %69
    do~
    do
    do~

    %72
    do8. re16 do8
    re4.~
    re

    %75
    re~
    re
    re~

    %78
    re8. mi16 re8
    mi4.~
    mi

    %81
    mi~
    mi
    mi~

    %84
    mi8. mi16 mi8\mbreak
    do si8. si16
    do mi, re do si la

    %87
    sol do si la sol fa
    mi la sol fa mi re
    do' re mi re mi do

    %90
    sol'4 sol8
    sol4.~
    sol

    %93
    sol
    sol~
    sol8. sol16 sol8

    %96
    sol,8. fa16 mi re
    do re mi fa sol la
    re, mi fa sol la si

    %99
    mi, fa sol la si do
    fa, sol la si do re
    si8. si16 sol8

    %102
    la sol8. sol16
    mi4 r8\mbreak
    r8 sol'16 la si sol

    %105
    do8. do,16 do8
    re4 re8
    mi8. fa16 sol8

    %108
    la sol8.\parenthesize \tr sol16
    mi4.\fermata

}

VIIIvlIVn = \relative do'' {

    R4.*9
    r8 do mi
    r si re

    %12
    r do mi
    r si re
    r do mi

    %15
    r do mi
    fad4 re8
    mi re fad,

    %18
    sol4 r8
    R4.*3
    r8 la do\mbreak

    %23
    r re fad
    r re fad
    r re sol

    %26
    R4.
    mi,16 la do mi la do,
    la mi la dod mi r

    %29
    fad, la re fad la fad
    red fad, si red fad r
    si, sol si mi sol r

    %32
    si, sol si mi sol r
    si,8 sol r
    mi16 mi' fad, mi' sol, mi'

    %35
    la, mi' si mi si red
    mi sol, si mi sol mi
    red fad, si red fad red

    %38
    mi4 r8
    r r sold,
    la dod mi

    %41
    r r fad,\mbreak
    sol si re
    r r mi,

    %44
    fa? la do
    R4.*5
    fa,8 fa fa

    %51
    fa fa fa
    fa fa fa
    sol sol sol

    %54
    do, do do
    fa fa fa
    R4.

    %57
    do'16 re mi re mi do
    fa4 fa8
    mi16 fa sol fa sol mi
    fa[sol la sol la fa]

    %61
    sol[la sib la sib sol]
    la8 la la
    sol4 sol8\mbreak

    %64
    sol16 mi re do si la
    sol do si la sol fa
    mi la sol fa mi re

    %67
    do8 sol''16[fa mi re]
    do4 do8
    sol'16[la sol fa mi re]

    %70
    do8. do16 do8
    sol'16[la sol fa mi re]
    do8. si16 do8

    %73
    la'16[si la sol fad mi]
    re4 re8
    la'16[si la sol fad mi]

    %76
    re8. re16 re8
    la'16[si la sol fad mi]
    re8. do16 re8

    %79
    si'16[do si la sold fad]
    mi4 mi8
    si'16[do si la sold fad]

    %82
    mi8. mi16 mi8
    si'16[do si la sold fad]
    mi8. re16 mi8\mbreak

    %85
    la la sold
    la16 mi re do si la
    sol do si la sol fa

    %88
    mi la sol fa mi re
    R4.
    sol16 la si la si sol
    do4 do8

    %92
    re4.
    mi
    fa

    %95
    mi8. mi16 mi8
    do[si16 la sol fa]
    mi[fa sol la si do]

    %98
    fa,[sol la si do re]
    sol,[la si do re mi]
    la,[si do re mi fa]

    %101
    fa8. re16 mi8~
    mi16 fa re8. do16
    do8 do16 re mi do\mbreak

    %104
    sol'4.~
    sol~
    sol~

    %107
    sol8. fa16 mi8
    fa re8.\tr do16
    do4.\fermata

}

VIIIvlaIIn = \relative do' {

    R4.*9
    r8 sol' sol
    r sol si

    %12
    r sol sol
    r sol si
    r sol sol

    %15
    r la do
    re4 si8
    la4 re,8

    %18
    re4 r8
    R4.*3
    r8 mi la\mbreak

    %23
    r la re
    r la do
    r si re

    %26
    R4.
    do,8 do do
    mi mi mi

    %29
    re la la
    si si si
    si si si

    %32
    si si si
    si si r
    R4.*4

    %38
    si4 r8
    r r mi
    mi la dod

    %41
    r r re,\mbreak
    re sol si
    r r do,

    %44
    do fa la
    R4.*5
    fa8 fa fa

    %51
    fa fa fa
    fa fa fa
    sol sol sol

    %54
    do, do do
    fa fa fa
    R4.*2
    fa16 sol la sol la fa

    %59
    do'4 do8
    la16 sib do sib do la
    sib4.

    %62
    la16 sib do8 la
    re,4 re8\mbreak
    mi16 mi' re do si la

    %65
    sol do si la sol fa
    mi la sol fa mi re
    do8 mi sol

    %68
    la sib do
    mi, fa sol
    la sib do

    %71
    mi, fa sol
    la8. si?16 la8
    r fad la

    %74
    si do re
    fad, sol la
    si do re

    %77
    fad,[sol] la
    si8. do16 si8
    r sold si

    %80
    do[re] mi
    sold,[la] si
    do re mi

    %83
    sold,[la] si
    do8. re16 do8\mbreak
    mi mi8. mi16

    %86
    mi16 mi re do si la
    sol do si la sol fa

    %88
    mi la sol fa mi re
    R4.*3
    sol,16[la si la si sol]

    %93
    do4 do8
    si16[do re do re si]
    mi8. do16 do8

    %96
    R4.
    mi8[re16 do si la]
    fa'8[mi16 re do si]

    %99
    sol'8[fa16 mi re do]
    re8[do16 si la sol]
    re'8. si16 do8~

    %102
    do16 do do8 si
    do4 r8\mbreak
    R4.*2

    %106
    r8 sol16[la si sol]
    do8. do16 do8
    do do si

    %109
    do4.\fermata

}

VIIIsopranoIIn = \relative do'' {

    \autoBeamOff

    R4.*9
    do4.
    si16[la] sol8 fa

    %12
    mi16[re] do4
    sol'8 si sol
    do8. do,16 do8

    %15
    do'4 la8
    fad re sol
    do, re4 \tr

    %18
    sol4.
    R4.*3
    do16[re] mi8 do\mbreak

    %23
    la8. sol16 fad8
    do'16[re] mi8 do
    si8. la16 sol8

    %26
    R4.
    do8 r16 do do do
    dod8. dod16 dod8

    %29
    re r16 re re re
    red8. red16 red8
    mi mi mi

    %32
    mi16 mi mi8 mi16 mi
    mi8 mi, r
    mi' re16[do si la]

    %35
    sol la fad4
    mi r8
    R4.*2

    %39
    r8 r mi'
    dod la r
    r r re\mbreak

    %42
    si sol r
    r r do
    la fa! r

    %45
    R4.*5
    do'4.

    %51
    re
    do4 do8
    sib4.~

    %54
    sib4 sib8
    la4.
    fa16[sol] la[sol] la fa

    %57
    do'4 do8
    do4.
    do

    %60
    do
    do
    do4 do8

    %63
    do4 si!8\mbreak
    do4 r8
    si16[do re8] re

    %66
    mi mi r
    do4.~
    do

    %69
    do~
    do
    do~

    %72
    do8. re16 do8
    re4.~
    re

    %75
    re~
    re
    re~

    %78
    re8. mi16 re8
    mi4.~
    mi

    %81
    mi~
    mi
    mi~

    %84
    mi8. mi16 mi8\mbreak
    do si8. si16
    do4 r8

    %87
    R4.*3
    sol16[la si la] si[sol]
    do4 do8

    %92
    re4.
    mi
    fa

    %95
    mi8. mi16 mi8
    do[si16 la] sol[fa]
    mi[fa sol la si do]

    %98
    fa,[sol la si do re]
    sol,[la si do re mi]
    la,[si do re mi fa]

    %101
    fa8. re16 mi8~
    mi16 fa re8. do16
    do8 do16[re] mi[do]\mbreak

    %104
    sol'4.~
    sol~
    sol~

    %107
    sol8. fa16 mi8
    fa re8.\tr do16
    do4.\fermata

}

VIIItestoV= \lyricmode {

    Pa -- ratum _ cor e -- jus spe -- rare_in _ Do -- mino, _

    con -- fir -- matum _ est cor e -- jus, non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at

    non non com -- mo -- ve -- bitur _ non non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at  i -- ni -- mi -- cos i -- ni -- mi -- cos su -- os.

    Dis -- persit, _ dis -- persit, _ dis -- persit, _ de -- dit pa -- u -- pe -- ri -- bus,

    jus -- ti -- tia _ e -- jus ma -- net in sae -- cu -- lum sae -- cu -- li.

    Cor -- nu e -- jus e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    e -- xal -- ta -- bitur _ in glo -- ri -- a,

    cor -- nu e -- jus  e - xal -- ta -- bitur _ e -- xal -- ta - - - -  bitur _

    in glo -- ri -- a, e -- xal -- ta -- bitur _ in glo -- ri -- a.

}

VIIIaltoIIn = \relative do' {

    \autoBeamOff

    R4.*9
    do'4.
    si16[la] sol8 fa

    %12
    mi16[re] do4
    sol'8 si sol
    do8. do,16 do8

    %15
    do'4 la8
    fad re sol
    do, re4 \tr

    %18
    sol4.
    R4.*3
    do,16[re] mi8 do\mbreak

    %23
    la8. sol16 fad8
    do'16[re] mi8 do
    si8. la16 sol8

    %26
    R4.
    la'8 r16 la la la
    sol8. sol16 sol8

    %29
    fad r16 fad fad fad
    fad?8. fad16 fad8
    sol sol sol

    %32
    sol16 sol sol8 sol16 sol
    sol8 sol r
    mi mi mi

    %35
    mi mi[red]
    mi4 r8
    R4.*2

    %39
    r8 r sold
    la mi r
    r r la\mbreak

    %42
    sol re r
    r r sol
    fa! do r

    %45
    R4.*5
    la'4.
    sib

    %52
    la4 la8
    sol4.~
    sol4 sol8

    %55
    fa4.
    R
    do16[re] mi[re] mi do

    %58
    fa4 fa8
    mi16[fa] sol[fa] sol[mi]
    fa[sol la sol la fa]

    %61
    sol[la sib la sib sol]
    la8 la la
    sol4 sol8\mbreak

    %64
    sol4 r8
    sol16[la si?8] si
    sol sol r

    %67
    sol16[la sol fa] mi[re]
    do4 do8
    sol'16[la sol fa] mi[re]

    %70
    do8. do16 do8
    sol'16[la sol fa] mi[re]
    do8. si16 do8

    %73
    la'16[si la sol] fad[mi]
    re4 re8
    la'16[si la sol] fad[mi]

    %76
    re8. re16 re8
    la'16[si la sol] fad[mi]
    re8. do16 re8

    %79
    si'16[do si la] sold[fad]
    mi4 mi8
    si'16[do si la] sold[fad]

    %82
    mi8. mi16 mi8
    si'16[do si la] sold[fad]
    mi8. re16 mi8\mbreak

    %85
    la la sold
    la4 r8
    R4.*2

    %89
    do,16[re mi re] mi[do]
    sol'4 sol8
    sol4.~

    %92
    sol
    sol
    sol~

    %95
    sol8. sol16 sol8
    sol8.[fa16] mi[re]
    do[re mi fa sol la]
    re, [mi fa sol la si]

    %99
    mi, [fa sol la si do]
    fa, [sol la si do re]
    si8. si16 sol8

    %102
    la sol8. sol16
    mi4 r8\mbreak
    r8 sol16 [la] si [sol]

    %105
    do8. do,16 do8
    re4 re8
    mi8. fa16 sol8

    %108
    la sol8.\parenthesize \tr sol16
    mi4.\fermata

}

VIIItestoVI = \lyricmode {

    Pa -- ratum _ cor e -- jus spe -- rare_in _ Do -- mino, _

    con -- fir -- matum _ est cor e -- jus, non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at

    non non com -- mo -- ve -- bitur _ non non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at  i -- ni -- mi -- cos i -- ni -- mi -- cos su -- os.

    Dis -- persit, _ dis -- persit, _ dis -- persit, _ de -- dit pa -- u -- pe -- ri -- bus,

    jus -- ti -- tia _ e -- jus ma -- net in sae - - cu -- lum sae -- cu -- li.

    Cor -- nu e -- jus cor -- nu e -- jus e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta --  bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    in glo -- ri -- a, cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta - - - - bitur _

    in glo -- ri -- a, e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _  in glo -- ri -- a.

}

VIIItenoreIIn = \relative do' {

    \autoBeamOff

    R4.*9
    do4.
    si16[la] sol8 fa

    %12
    mi16[re] do4
    sol'8 si sol
    do8. do,16 do8

    %15
    do'4 la8
    fad re sol
    do, re4 \tr

    %18
    sol4.
    R4.*3
    do16[re] mi8 do\mbreak

    %23
    la8. sol16 fad8
    do'16[re] mi8 do
    si8. la16 sol8

    %26
    R4.
    mi'8 r16 mi mi mi
    mi8. mi16 dod8

    %29
    la r16 la la la
    la8. la16 la8
    si si si

    %32
    si16 si si8 si16 si
    si8 si r
    sol la si

    %35
    do si4
    si r8
    R4.*2

    %39
    r8 r mi
    mi dod r
    r r fad\mbreak

    %42
    re si r
    r r mi
    do la r

    %45
    R4.*5
    do4.
    sib

    %52
    do4 fa8
    re4.
    mi4 mi8

    %55
    do4.
    R4.*2
    fa,16[sol] la[sol] la fa

    %59
    la4 la8
    la16[sib] do[sib] do[la]
    sib4.

    %62
    la16[sib] do[re] mi[fa]
    re4 re8\mbreak
    mi4 r8

    %65
    re4 re8
    do sol r
    r mi sol

    %68
    la[sib] do
    mi,[fa] sol
    la sib do

    %71
    mi,[fa] sol
    la8. si?16 la8
    r fad la

    %74
    si[do] re
    fad,[sol] la
    si do re

    %77
    fad,[sol] la
    si8. do16 si8
    r sold si

    %80
    do[re] mi
    sold,[la] si
    do re mi

    %83
    sold,[la] si
    do8. re16 do8\mbreak
    mi mi8. mi16

    %86
    mi4 r8
    R4.*5
    sol,16[la si la] si [sol]

    %93
    do4 do8
    si16[do re do] re[si]
    mi8. do16 do8

    %96
    R4.
    mi8[re16 do] si[la]
    fa'8[mi16 re do si]

    %99
    sol'8[fa16 mi re do]
    re8[do16 si la sol]
    re'8. si16 do8~

    %102
    do16 do do8 si
    do4 r8\mbreak
    R4.*2

    %106
    r8 sol16[la] si[sol]
    do8. do16 do8
    do do si

    %109
    do4.\fermata

}

VIIItestoVII = \lyricmode {

    Pa -- ratum _ cor e -- jus spe -- rare_in _ Do -- mino, _

    con -- fir -- matum _ est cor e -- jus, non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at

    non non com -- mo -- ve -- bitur _ non non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at  i -- ni -- mi -- cos i -- ni -- mi -- cos su -- os.

    Dis -- persit, _ dis -- persit, _ dis -- persit, _ de -- dit pa -- u -- pe - ri -- bus,

    jus -- ti -- tia _ e -- jus ma -- net in sae - cu -- lum sae -- cu -- li.

    Cor -- nu e -- jus cor -- nu e -- jus e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta --  bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    in glo -- ri -- a, cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta - - - bitur _

    in glo -- ri -- a, e -- xal -- ta -- bitur _  in glo -- ri -- a.



}

VIIIbassoIIn = \relative do {

    \autoBeamOff
    R4.*9
    do'4.
    si16[la] sol8 fa

    %12
    mi16[re] do4
    sol'8 si sol
    do8. do,16 do8

    %15
    do'4 la8
    fad re sol
    do, re4\parenthesize \tr

    %18
    sol,4.
    R4.*3
    do16[re] mi8 do\mbreak

    %23
    la8. sol16 fad8
    do'16[re] mi8 do
    si8. la16 sol8

    %26
    R4.
    la'8 r16 la la la
    la8. la,16 la8

    %29
    re r16 re re re
    si8. si16 si8
    mi mi mi

    %32
    mi16 mi mi8 mi16 mi
    mi8 mi r
    mi fad sol

    %35
    la si [si,]
    mi4 r8
    R4.*2

    %39
    r8 r mi
    la la, r
    r r re\mbreak

    %22
    sol sol, r
    r r do
    fa! fa, r

    %25
    R4.*5
    fa'4.
    fa

    %32
    fa4 fa8
    sol4.
    do,4 do8

    %35
    fa4.
    R4.*3
    do16 [re] mi [re] mi do
    fa4 fa8

    %61
    mi16 [fa] sol [fa] sol [mi]
    fa8 fa fa
    sol sol,4\mbreak

    %64
    do r8
    sol'4 fa8
    mi do r

    %67
    r8 do mi
    fa [sol] la
    do, [re] mi

    %70
    fa sol la
    do, [re] mi
    fa8. fa16 fa8

    %73
    r re fad
    sol [la] si
    re, [mi] fad

    %76
    sol la si
    re, [mi] fad
    sol8. sol16 sol8

    %79
    r mi sold
    la [si] do
    mi, [fad] sold

    %82
    la si do
    mi, [fad] sold
    la8. la16 la8\mbreak

    %85
    la mi mi
    la,4 r8
    R4.*4

    %91
    do16 [re mi re] mi [do]
    sol'4 fa8
    mi16 [fa mi re] mi [do]

    %94
    sol' [la si la si sol]
    do8. do,16 do8
    do16 [re mi8] fad

    %97
    sol4.~
    sol~
    sol~

    %100
    sol~
    sol8. sol16 do,8
    fa sol sol,

    %103
    do4 r8\mbreak
    R4.
    r8 do16 [re] mi [do]

    %106
    sol'4 fa8
    mi8. re16 do8
    fa sol sol,

    %109
    do4.\fermata




}

VIIItestoVIII = \lyricmode {

    Pa -- ratum _ cor e -- jus spe -- rare_in _ Do -- mino, _

    con -- fir -- matum _ est cor e -- jus, non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at

    non non com -- mo -- ve -- bitur _ non non com -- mo -- ve -- bitur _

    do -- nec des -- pici - at  i -- ni -- mi -- cos i -- ni -- mi -- cos su -- os.

    Dis -- persit, _ dis -- persit, _ dis -- persit, _ de -- dit pa -- u -- pe - ri -- bus,

    jus -- ti -- tia _ e -- jus ma -- net in sae -- cu -- lum sae -- cu -- li.

    Cor -- nu e -- jus cor -- nu e -- jus e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta --  bitur _

    cor -- nu e -- jus  e -- xal -- ta -- bitur _ e -- xal -- ta -- bitur _

    in glo -- ri -- a, cor -- nu e -- jus  e -- xal -- ta - bitur _ e -- xal -- ta -- bitur _

    in glo -- ri -- a, e -- xal -- ta - - bitur _  in glo -- ri -- a.



}

VIIIbcIIn = \relative do {

    R4.*9
    r8 do' do,
    r sol' sol,

    %12
    r do do,
    r sol'' sol,
    r do do,

    %15
    r do'' la
    fad re sol
    do, re re,

    %18
    sol4 r8
    R4.*3
    r8 la' la,\mbreak

    %23
    r re re,
    r re' re,
    r sol' sol,

    %26
    R4.
    la'16 la la la la la
    la8 la, la

    %29
    re16 re re re re re
    si8 si si
    mi16 mi mi mi mi mi

    %32
    mi mi mi mi mi mi
    mi8 mi, r
    mi' fad sol

    %35
    la si si,
    mi mi mi
    si' si, si

    %38
    mi 4 r8
    r r mi
    la la, r

    %41
    r r re\mbreak
    sol sol, r
    r r do

    %44
    fa! fa, r
    R4.*14
    do'16 re mi re mi do

    %60
    fa4 fa8
    mi16 fa sol fa sol mi
    fa8 fa, fa
    sol' sol, sol\mbreak

    %64
    do16 mi' re do si la
    sol do si la sol fa
    mi la sol fa mi re

    %67
    do8 do mi
    fa sol la
    do, re mi

    %70
    fa sol la
    do, re mi
    fa8. fa16 fa8

    %73
    r re fad
    sol la si
    re, mi fad

    %76
    sol la si
    re, mi fad
    sol8. sol16 sol8

    %79
    r mi sold
    la si do
    mi, fad sold

    %82
    la si do
    mi, fad sold
    la8. la16 la8\mbreak

    %85
    la mi mi,
    \once\stemUp la16 mi'' re do si la
    sol do si la sol fa

    %88
    mi la sol fa mi re
    \clef alto do' re mi re mi do
    sol' la si la si sol\clef bass

    %91
    do,, re mi re mi do
    sol'4 fa8
    mi16 fa mi re mi do

    %94
    sol' la si la si sol
    do8. do,16 do8
    do16 re mi8[fad]

    %97
    sol4.\tasto~
    sol~
    sol~

    %100
    sol~
    sol8. sol16 do,8
    fa sol sol,

    %103
    do4 r8\mbreak
    R4.
    r8 do16^\markup\italic"[Tutti]" re mi do

    %106
    sol8 sol' fa
    mi8. re16 do8
    fa sol sol,

    %109
    do4.\fermata

}

VIIIbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*14
    s8 <6>4
    s4.
    <6 5>8 <_+>4
    s4.*5
    s8  <_+>4
    s8 <7>4
    s4.*3
    <7 _+>4.
    <_+>
    <7 _+>
    s4.*6
    <_+>4.
    s
    s8 s <_+>
    <_+>4.
    s8 s <_+>
    s4.*19
    <6 5>4.

    s
    <5 4>8 <3!>4
    s4.*4
    s8 <_->4
    s4.
    s8 <_->4
    s4.
    s
    s8 <_+>4
    s4.
    <_+>
    s
    <_+>
    s
    s8 <_+>4
    s4.
    <_+>
    s
    <_+>
    s
    s8 <5 4> <3+>
    s4.*6
    s4 <6 4>8
    s4.
    <7>
    s4.*6
    <7>4.
    <7>8 <5 4> <3>
    s4.*5
    s8 <5 4> <3>

}


forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key do\major
    \tempo 4. = 60
    s4.*109
    \bar "|."

}

VIIIobI = {
    \notypeset
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

VIIIvlaI = {
    \clef alto
    <<\VIIIvlaIn \forma>>

}

VIIIsopranoI = {
    \new Voice = "paratum1"
    <<\VIIIsopranoIn \forma>>
}

VIIIaltoI = {
    \new Voice = "paratum2"
    <<\VIIIaltoIn \forma>>
}

VIIItenoreI = {
    \new Voice = "paratum3"
    <<\VIIItenoreIn \forma>>
}

VIIIbassoI = {
    \clef bass
    \new Voice = "paratum4"
    <<\VIIIbassoIn \forma>>
}



VIIIbcI = {
    \clef bass
    <<\VIIIbcIn \forma \VIIIbfIn>>
    \typeset
}

VIIIvlIII = {
    <<\VIIIvlIIIn \forma>>

}

VIIIvlIV = {
    <<\VIIIvlIVn \forma>>

}

VIIIvlaII = {
    \clef alto
    <<\VIIIvlaIIn \forma>>

}

VIIIsopranoII= {
    \new Voice = "paratum5"
    <<\VIIIsopranoIIn \forma>>
}

VIIIaltoII= {
    \new Voice = "paratum6"
    <<\VIIIaltoIIn \forma>>
}

VIIItenoreII = {
    \new Voice = "paratum7"
    <<\VIIItenoreIIn \forma>>
}

VIIIbassoII = {
    \clef bass
    \new Voice = "paratum8"
    <<\VIIIbassoIIn \forma>>
}



VIIIbcII = {
    \clef bass
    <<\VIIIbcIIn \forma \VIIIbfIIn>>
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



IXvlIn = \relative do'' {

    fa,8\staccatissimo
    re\staccatissimo [sib'\staccatissimo mi,\staccatissimo do'\staccatissimo ]
    la fa fa'4~

    %3
    fa mi~
    mi re~
    re do~

    %6
    do sib~
    sib la
    sol2\fermata

    %9
    la'16 do sib do la sib sol la
    fa la sol la fa sol mi fa
    re sib' la sib sol la fa sol

    %12
    mi sol fa sol mi fa re mi
    do la' sol la fa sol mi fa
    re fa mi fa re mi do re

    %15
    sib sol' fa sol mi fa re mi
    do mi re mi do re sib re\mbreak
    la4 r

    %18
    fad16 [fad fad fad fad fad fad fad]
    sol4 r
    sold16 [sold sold sold sold sold sold sold]

    %21
    la4 r
    sib16[sib sib sib sib sib sib sib]
    la4 r

    %24
    la8 fa' r la,
    sib8 fa' r sib,
    do8 sol' r mi

    %27
    fa4 r
    la,,8 fa' r la,
    sib8 fa' r sib,

    %30
    do8 sol' r mi\mbreak
    fa4 r8 fa
    re [sib' mi, do']

    %33
    la fa fa'4~
    fa mi~
    mi re~

    %36
    re do~
    do re
    mi,2\fermata

    %39
    do'8[do do do]
    re4 re
    mi mi\mbreak

    %42
    do do
    sib sib
    re re

    %45
    do do
    do8[do do do]
    do4 r

    %48
    do r
    do r
    do r

    %51
    do8[sib16 la sol fa mi re]
    do [do' do do do do do do]
    do4 r

    %54
    re16[re re re re re re re]
    re4 r
    do16 do do do do do do do

    %57
    do4 si\mbreak
    do si
    do si

    %60
    do16 do do do do do do do
    do do do do do8 r
    r16 la la la si8 r

    %63
    r16 si? si si do8 r
    r16 do do do re8 r
    r16 re re re mi8 r

    %66
    mi4 r
    mi8 do si4\tr
    la16 la' sol la fa sol mi fa

    %69
    re fa mi fa re mi do re
    si re do re si do la si
    sold8[do re si]

    %72
    la4 r8 la
    fa[re' sold, mi']
    do16 si la8 r mi'\mbreak

    %75
    fa8 re mi mi,
    mi'[do re re,]
    do'4\tr si\fermata

    %78
    si8[si si si]
    do4 r
    do mi

    %81
    re r
    re fad
    mi r

    %84
    mi mi
    mi r
    mi r

    %87
    mi r
    mi16 mi mi mi re re re re
    dod4 r\mbreak

    %90
    do!16 do do do do do do do
    re4 r
    mi16 mi mi mi mi mi mi mi

    %93
    mi4 mi
    do do
    do do

    %96
    do r
    R2
    r8 do[sol mi]

    %99
    \once\stemUp do16[mi' mi mi mi mi mi mi]
    mi[mi mi mi mi mi mi mi]
    fa fa, fa fa fa8 r

    %102
    r16 fa fa fa sol8 r
    r16 sol sol sol la8 r
    r16 la la la sib8 r\mbreak

    %105
    r16 sib sib sib do8 r
    do16 sol fa mi fa sol la sib
    la8[do mi, sol]

    %108
    la[do mi, sol]
    la16[la la la la la la la]
    la8 r fa r

    %111
    sol r sol r
    la r la r
    sib r sib sol

    %114
    la16[sol fa mi fa sol la sib]
    do8 fa, sol4\tr
    \once\stemUp la16 do' sib do la sib sol la

    %117
    fa do sib do la sib sol la
    la8 fa' r la,\mbreak
    sib8 fa' r sib,

    %120
    do8 sol' r mi
    fa2\fermata

}

IXvlIIn = \relative do'' {

    fa,8\staccatissimo
    re\staccatissimo [sib'\staccatissimo mi,\staccatissimo do'\staccatissimo ]
    la fa r4
    sol'2

    %4
    fa
    mi
    re

    %7
    do4. re8
    mi,2\fermata
    fa'16 la sol la fa sol mi fa

    %10
    re fa mi fa re mi do re
    sib sol' fa sol mi fa re mi
    do mi re mi do re sib do

    %13
    la fa'  mi fa re mi do re
    sib re do re sib do la sib
    sol mi' re mi do re sib do

    %16
    la do sib do la sib sol la\mbreak
    fa4 r
    do16 [do do do do do do do]

    %19
    si4 r
    re16[re re re re re re re]
    dod4 r

    %22
    sol'16[sol sol sol sol sol sol sol]
    fa4 r

    %24
    la8 fa' r la,
    sib8 fa' r sib,
    do8 sol' r mi

    %27
    fa4 r
    la,,8 fa' r la,
    sib8 fa' r sib,

    %30
    do8 sol' r mi\mbreak
    fa4 r8 fa
    re [sib' mi, do']

    %33
    la fa fa'4~
    fa mi~
    mi re~

    %36
    re do~
    do re
    mi,2\fermata

    %39
    fa8[fa fa fa]
    fa4 sib
    sib sib\mbreak

    %42
    la la
    fa fa
    fa sol

    %45
    sol sol
    la8[la la la]
    la4 r

    %48
    la r
    la r
    la r

    %51
    do8[sib16 la sol fa mi re]
    do [sol' sol sol sol sol sol sol]
    fad4 r

    %54
    sol16[sol sol sol sol sol sol sol]
    sold4 r
    mi16[mi mi mi mi mi mi mi]

    %57
    mi4 mi'\mbreak
    mi mi
    mi mi

    %60
    mi16 mi, mi mi mi mi mi mi
    mi mi mi mi mi8 r
    r16 fad fad fad fad8 r

    %63
    r16 sold sold sold sold8 r
    r16 la la la la8 r
    r16 si si si si8 r

    %66
    do4 r
    do8[la la sold]
    la4 r

    %69
    r16 la' sol la fa sol mi fa
    re fa mi fa re mi do re
    si8[la si sold]

    %72
    la4 r8 la
    fa[re' sold, mi']
    do16 si la8 r mi'\mbreak

    %75
    fa8 re mi mi,
    mi'[do re re,]
    do'4\tr si\fermata

    %78
    sold8[sold sold sold]
    la4 r
    la la

    %81
    la r
    la si
    si? r

    %84
    si? si
    do r
    do r

    %87
    do r
    si16 si si si si si mi mi
    mi4 r\mbreak

    %90
    la,16 la la la la la la la
    si4 r
    do16 do do do do do do do

    %93
    do4 do
    la sol
    la sol

    %96
    la r
    R2
    r8 do[sol mi]

    %99
    do16[do' do do do do do do]
    do do do do do do do do
    do do, do do do8 r

    %102
    r16 re re re re8 r
    r16 mi mi mi mi8 r
    r16 fa fa fa fa8 r\mbreak

    %105
    r16 sol sol sol sol8 r
    la16 sol fa mi fa sol la sib
    fa8[la sol mi]

    %108
    fa[la sol mi]
    fa16 fa fa fa fa fa fa fa
    fa8 r do r

    %111
    re r re r
    mi r mi r
    fa r fa do'

    %114
    la16[sol fa mi fa sol la sib]
    do8 fa, sol4\tr
    \once\stemUp fa16 la' sol la fa sol mi fa

    %117
    do la sol la fa sol mi fa
    \once\stemUp do8 \once\stemDown fa' r la,\mbreak
    sib8 fa' r sib,

    %120
    do8 sol' r mi
    fa2\fermata

}

IXvlaIn = \relative do' {
    la8
    fa[re'sol, mi']
    do la r do'
    re sib r sol

    %4
    do la r \parenthesize re
    sib sol r do
    la fa r sib

    %7
    sol mi r re
    mi2\fermata
    la8[la la la]

    %10
    la[la sib do]
    fa,[sol sol sol]
    sol[sol la sib]

    %13
    mi,[fa fa fa]
    fa[fa sol la]
    re,[mi mi mi]

    %16
    mi[mi mi fa]\mbreak
    do4 r
    do16 la la la la la re re

    %19
    re4 r
    re16 si si si si si si si
    mi4 r

    %22
    do16[do do do do do do do]
    do4 r
    la'16[la la la la la la la]

    %25
    sib[sib sib sib sib sib sib sib]
    do[do do do do do do do]
    fa,4 r

    %28
    la,16[la la la la la la la]
    sib[sib sib sib sib sib sib sib]
    do[do do do do do do do]\mbreak

    %31
    fa4 r8 la,
    fa[re' sol, mi']
    do la r8 \parenthesize la'

    %34
    sol4 r8 sol
    fa4 r8 fa
    mi4 r8 mi

    %37
    fa4 r8 fa
    mi2\fermata
    la,8[la la la]

    %40
    sib4 re
    sol sol\mbreak
    fa fa

    %43
    fa fa
    fa fa
    mi mi

    %46
    do8[fa fa fa]
    fa4 r
    fa r

    %49
    fa r
    fa r
    do'8[sib16 la sol fa mi re]

    %52
    do[mi mi mi mi mi mi mi]
    la,4 r
    si16[si si si si si si si]

    %55
    si?4 r
    la16[la la la la la la la]
    la4 sold\mbreak

    %58
    la sold
    la sold
    la16[la la la la la la la]

    %61
    la'16 la, la la la8 r
    r16 re re re re8 r
    r16 mi mi mi mi8 r

    %64
    r16 fa fa fa fa8 r
    r16 sold, sold sold sold8 r
    la4 r

    %67
    la'8[mi mi mi]
    do[do do do]
    fa[fa fa fa]

    %70
    fa[fa fa fa]
    sold,[mi' fa mi]
    do4 r8 do

    %73
    la fa' si, sold'
    mi do r la'
    re si r sol

    %76
    do la r la,
    mi'2\fermata
    mi8[mi mi mi]

    %79
    mi4 r
    mi dod
    fa r

    %82
    fa fad
    sold r
    sold? sold

    %85
    la r
    la r
    la r

    %88
    sold16 sold sold sold sold sold sold sold
    sol!4 r\mbreak
    fad16 fad fad fad fad fad fad fad

    %91
    fa!4 r
    sol16 sol sol sol sol sol sol sol
    sol4 sol

    %94
    fa do
    fa do
    fa r

    %97
    R2
    r8 do'[sol mi]
    do16 sol' sol sol sol sol sol sol

    %100
    sol sol sol sol sol sol sol sol
    la la, la la la8 r
    r16 sib sib sib sib8 r

    %103
    r16 do do do do8 r
    r16 re re re re8 r\mbreak
    r16 mi mi mi mi8 r

    %106
    fa4 r
    do8[do do do]
    do[do do do]

    %109
    do16 do do do do do do do
    do8 r la r
    sib r sib r

    %112
    la r la r
    re r re mi
    fa4 r

    %115
    fa8[sol mi mi]
    do[do do do]
    la[do do do]

    %118
    do16 [sol' sol sol sol sol sol sol]	\mbreak
    la la la la la la la la
    sib sib sib sib sib sib sib sib

    %121
    fa2\fermata

}

IXtenoreIn = \relative do' {

    \autoBeamOff
    r8
    R2*30
    r4 r8 do
    re,[sib'] mi, do'

    %33
    la fa r\parenthesize do'
    re[\appoggiatura do sib\appoggiatura la sol mi']
    do[\appoggiatura sib la \appoggiatura sol fa re']

    %36
    \appoggiatura do sib[\appoggiatura la sol \appoggiatura fa mi do']
    la2\tr
    sol\fermata

    %39
    r8 fa la do
    re16[mi do re] sib[do la sib]
    sol[mi' re mi] do[re sib do]\mbreak

    %42
    la[do sib do] la[sib sol la]
    fa[re' do re] sib[do la sib]
    sol[sib la sib] sol[la fa sol]

    %45
    mi[do' sib do] sol[la sib do]
    la4 r16 fa[sol fa]
    la[fa sol fa] la[fa sib sol]

    %48
    la[fa sol fa] la[fa sib sol]
    do[la sol la] do[la re sib]
    do[la sol la] do[la re sib]

    %51
    do8[sib16 la] sol[fa mi re]
    do4 r
    do'8 fad,16 fad fad8 fad

    %54
    sol16[fad] sol8 r4
    re'8 sold,16 sold sold8 sold
    la16[sold] la8 r4

    %57
    la16[sib do re] mi[re] do[si]\mbreak
    la[si do re] mi[re do si]
    la[si do re] mi[re do si]

    %60
    do8 la r4
    mi4. la8
    fad4. si8

    %63
    sold4. do8
    la4. re8
    si4. mi8

    %66
    do16[si la sold] la[si do re]
    mi8 la, si4\tr
    la r

    %69
    R2*3
    r4 r8 la
    fa[re'] sold, mi'

    %74
    do16[si] la8 r do\mbreak
    si4~si16[do32 si mi16 si]
    la4~la16[si32 la re16 la]

    %77
    la4\tr sold\fermata
    r8 si si si
    do16[si la sold la si do re]

    %80
    mi[re do si] la[sol fa mi]
    fa[re mi fa sol la si do]
    re[do si la] si[la sold fad]

    %83
    sold[mi fad sold la si do re]
    mi[re do si] mi[re do si]
    do[la si la] mi'[do re si]

    %86
    do[la si la] mi'[do re si]
    do[si la sold la si do re]
    mi8 mi, r4

    %89
    dod'8 dod16 dod dod8 dod\mbreak
    re  la r4
    si8 si16 si si8 si

    %92
    do8 sol r4
    do16[sib? la sol] do[sib la sol]
    la[fa la re] do[sib la sol]

    %95
    la[fa la re] do[sib la sol]
    la[fa sol fa] sib[sol la sol]
    do[la sib la] re[sib la sib]

    %98
    mi8[do sol mi]
    do2\tr
    R

    %101
    fa4. la8
    re,4 re8 sib'
    mi,4. do'8

    %104
    fa,4. re'8\mbreak
    sol,4. do8
    la16[sol fa mi fa sol la sib]

    %107
    do8  fa, sol4\tr
    fa8 do' sib4\tr
    la r

    %110
    fa16[sol la sib do la] sol[fa]
    sol[la sib do re sib] la[sol]
    la[sib do re mi do] sib [la]

    %113
    sib[do re mi] fa[re do sib]
    la[sol fa mi fa sol la sib]
    do8 fa, sol4\tr

    %116
    fa r
    R2*5

}

IXtestoIII = \lyricmode {

        Pec -- ca -- tor vi -- debit _ vi -- de - - - bit et i -- ra -- sce - - - - - - - - - - - - - - - - - - - - - - - tur,

        den -- tibus _ su -- is fre -- met den -- tibus _ su -- is fre -- met  et - ta -- be - - - - scet;

        de -- si -- de -- rium pec -- ca -- to -- rum pec -- ca -- to - rum pe -- ri -- bit.

        Pec -- ca -- tor vi -- debit _ vi -- de - - bit et i -- ra -- sce - - - - - - - - - - - - - - tur,

        den -- tibus _ su -- is fre -- met den -- tibus _ su -- is fre -- met

        et ta -- be - - - - - - - - scet; de -- si -- de -- ri -- um pec -- ca -- to -- rum

        pec -- ca -- to -- rum pe -- ri -- bit pe -- ri -- bit

        de -- si -- de -- rium pec -- ca -- to - - rum pe -- ri -- bit.

}

IXbcIn = \relative do {

    fa8
    sib, r do r
    fa fa, r la'
    sib[sol do do,]

    %4
    la' fa r8 \parenthesize sib
    sol[mi la la,]
    fa' re r sol

    %7
    mi[do fa si,]
    do2\fermata
    fa8[fa fa fa]

    %10
    fa[fa sol la]
    sib[mi, mi mi]
    mi[mi fa sol]

    %13
    la[re, re re]
    re[re mi fa]
    sol[do, do do]

    %16
    do[do re mi]\mbreak
    fa4 r
    re16[re re re re re re re]

    %19
    sol,4 r
    mi'16[mi mi mi mi mi mi mi]
    la,4 r

    %22
    mi'16[mi mi mi mi mi mi mi]
    fa4 r
    la16[la la la la la la la]

    %25
    sib[sib sib sib sib sib sib sib]
    do[do do do do do do do]
    fa,4 r

    %28
    la,16[la la la la la la la]
    sib[sib sib sib sib sib sib sib]
    do[do do do do do do do]\mbreak

    %31
    fa4 r
    sib,8 r do r
    fa fa, r \parenthesize la'

    %34
    sib [sol do, do']
    la fa r sib
    sol[mi la, la']

    %37
    fa re si4
    do2\fermata
    fa8[fa fa fa]

    %40
    sib,4 sib
    do do\mbreak
    fa fa

    %43
    re re
    sib si
    do mi

    %46
    fa8[fa fa fa]
    fa4 r
    fa4 r

    %49
    fa4 r
    fa4 r
    do'8[sib16 la sol fa mi re]

    %52
    do[do do do do do do do]
    re4 r
    si'16[si si si si si si si]

    %55
    mi,4 r
    la,16[la la la la la la la]
    la'4 sold\mbreak

    %58
    la sold
    la sold
    la16 la la la la la la la

    %61
    la_\markup\italic"Senza Org[ani]" la, la la la8 r
    r16 re re re re8 r
    r16 mi mi mi mi8 r

    %64
    r16 fa fa fa fa8 r
    r16 sold, sold sold sold8 r
    la4 r

    %67
    la'8[la, mi' mi,]
    la\tu[la la la]
    re[re re re]

    %70
    re[re re re]
    mi[la, re mi]
    la,4 r8 la

    %73
    re r mi r
    la la, la'4~\mbreak
    la sol~

    %76
    sol fa
    mi2\fermata
    mi8[mi mi mi]

    %79
    la,4 r
    la dod
    re r

    %82
    fa red
    mi r
    sold mi

    %85
    la, r
    la r
    la r

    %88
    mi'16[mi mi mi mi mi mi mi]
    la,4 r\mbreak
    re16 re re re re re re re

    %91
    sol4 r
    do,16 do do do do do do do
    do4 do

    %94
    fa mi
    fa mi
    fa sol

    %97
    la sib
    do8[do sol mi]
    do16[do do do do do do do]

    %100
    sib[sib sib sib sib sib sib sib]
    la_\markup\italic"Senza Org[ani]" la la la la8 r
    r16 sib sib sib sib8 r

    %103
    r16 do do do do8 r
    r16 re re re re8 r\mbreak
    r16 mi mi mi mi8 r

    %106
    fa4 r
    fa8\tu[fa, do' do,]
    fa'[fa, do' do,]

    %109
    fa16[fa fa fa fa fa fa fa]
    fa8 r la r
    sib r sib r

    %112
    do r do r
    re r re mi
    fa4 r

    %115
    fa8 fa, do' do,
    fa'8[fa fa fa]
    fa[fa fa fa]

    %118
    fa16[la la la la la la la]\mbreak
    sib sib sib sib sib sib sib sib
    do do do do do do do do

    %121
    fa,2\fermata_\markup\right-align\italic"Vivaldi ai copisti ”Qui si replica Beatus vir...”. Si ripete l'Antifona"

}

IXbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2*2
    <6 5>8 <7> s4
    <6 5>2
    <6 5>8 <7> s4
    <6 5>2
    <6 5>4 s8 <7>
    s2*10
    <7 _+>2
    s
    <7 _+>
    s
    <6 5>
    s
    s
    <6 5>
    s2*3
    <6 5>2
    s2*4
    <6 5>2
    <6 5>
    <6 5>
    <6 5>4 <7>
    s2*3
    <7>2
    s2*11
    <7 _+>2
    s
    <7 _+>
    s2*6
    s16 <_+> s8 <6!>4
    s16 <_+> s8 <6>4
    s16 <5> s8 <6>4
    s16 <5> s8 <6>4
    s2
    s4 <_+>
    s2*2
    <6!>2
    <_+>4 s8 <_+>
    s2
    s4 <_+>
    s2
    <4 2!>4 <6>
    <4 2> s
    <6 4> <5 3+>
    s2*5
    <_+>2
    s2*4
    <_+>2
    <7 _+>
    <7 _+>
    <7 _!>
    s2*8
    <6 4>2
    s
    s4 <6>
    s16 <5> s8 <6>4
    s16 <5> s8 <6>4
    s16 <5> s8 <6>4
    s2*5
    <6>2
    <6>
    <6>4 s8 <6 5>

}


forma = {

    \time 2/4
    \key fa\major
    \tempo 4 = 40
    \partial 8 s8
    s2*8\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    \mark\markup\huge "Presto"
    \tempo 2 = 55
    s2*22
    s4 \once \override Score.RehearsalMark.extra-offset = #'(+6 . -2)
    \mark\markup\huge "Largo" \tempo 4 = 40 s
    s2*7\break\once \override Score.RehearsalMark.extra-offset = #'(0 . -1)
    \mark\markup\huge "Presto"
    \tempo 2 = 55
    s2*33
    s4\once \override Score.RehearsalMark.extra-offset = #'(+6 . -2)
    \mark\markup\huge "Largo" \tempo 4 = 40 s
    s2*5\break
    \mark\markup\huge "Presto"
    \tempo 2 = 55
    s2*44
    \bar "|."

}

IXvlI = {
    \notypeset
    <<\IXvlIn \forma>>

}

IXvlII = {
    <<\IXvlIIn \forma>>

}

IXvlaI = {
    \clef alto
    <<\IXvlaIn \forma>>

}

IXtenoreI = {
    \new Voice = "peccator3"
    <<\IXtenoreIn \forma>>
}

IXbcI = {
    \clef bass
    <<\IXbcIn \forma \IXbfIn>>
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



XobIn = \relative do'' {

    sol'8. [sol16 mi8. mi16] do4 r8 r32 do mi fa
    sol8. [sol16 mi8. mi16] do4 r8 r32 do mi fa
    sol8.[sol16 do,8. do16] la4 r8 r32 do fa sol

    %4
    la8. [la16 re,8. re16] fa8.[fa16 si,8. si16]
    do8 sol mi do do' do do do
    si si si si la la la la

    %7
    sol sol sol sol fa fa fa fa
    mi mi mi mi fa fa fa fa
    sol sol sol sol do do sol sol

    %10
    mi mi do do r2
    R1*4
    r2 sol''8. [sol16 mi8. mi16]

    %16
    do4 r8 r32 dod fa sol la8.[la16 fad8. fad16]
    re4 r8 r32 re sol la si8.[si16 sold8. sold16]
    mi4 r8 r32 mi la si do8.[do16 la8. la16]

    %19
    fa4 r8 r32 si, re fa mi8.[mi16 do8. do16]
    re4 r8 r32 re sol si  la8.[la16 do,8. do16]
    si4 r8 r32 si re sol la,8.[la16 fad'8. fad16]

    %22
    sol8.[sol16 re8. re16] si8.[si16 sol8. sol16]
    fa!8.[fa16 re8. re16] si'8.[si16 sol8. sol16]
    mi4 do r2

    %25
    r sol'4. sol8\mbreak %% fine p.30
    do8[do16 do do8 do] si[sol sol la16 si]
    do8 do, do''2 si4~

    %28
    si la2 sol4~
    sol fad sol r
    R1

    %31
    r2 r4 r8 si
    si[si16 si do8 do] la la si si
    sol sol la la fa fa mi4

    %34
    do8 mi la2 sol4
    fa!2 sol
    fa4 la sold la~

    %37
    la sold la r\mbreak
    R1
    la,4. la8 mi'[mi16 mi mi8 re]

    %40
    do[la la do16 re] mi8 mi, r mi'
    do[do16 do do8 do] re4 si
    do8 do si4 la r

    %43
    si'1
    si
    si

    %46
    si
    si2\mbreak si8 mi, fad sold
    la4 sol! fad8[re mi fad]

    %49
    sol4 fa! mi fad
    sol2. fad4
    sol r r2

    %52
    re4. re8 sol[sol16 sol sol8 sol]
    fad[re re mi16 fad] sol8 sol, r4
    fad'16[mi fad sol] la[sol la fad] sol8 sol sol fad

    %55
    sol4 r sol4. sol8
    sol sol r4 r do~
    do si2 la4~

    %58
    la sol2 fa4~\mbreak
    fa mi8 fad sol2
    sol4 r re16[do re mi] fa[mi fa re]

    %61
    sol4 r la16[sol la si] la[sol fa mi]
    fa8 re fa la sol16[fa sol la] sol[fa mi re]
    mi8 do mi sol re4 r8 si'

    %64
    do la re la si sol r sol
    la[fa si fa] sol mi r mi
    fa[re sol re] mi16[re mi fa] sol8 r

    %67
    sol4. sol8 sol [sol16 sol sol8 sol]
    sol sol sol4 sol sol
    sol sol sol2\fermata

}


XobIIn = \relative do'' {

    mi8.[mi16 do8. do16] sol4 r8 r32 sol do re
    mi8.[mi16 do8. do16] sol4 r8 r32 sol do re
    mi8.[mi16 sol,8. sol16] fa4 r8 r32 la do mi

    %4
    fa8.[fa16 la,8. la16] do8.[do16 sol8. sol16]
    do8 sol mi do do' do do do
    si si si si la la la la

    %7
    sol sol sol sol fa fa fa fa
    mi mi mi mi fa fa fa fa
    sol sol sol sol do do sol sol

    %10
    mi mi do do r2
    R1*4
    r2 mi'8.[mi16 do8. do16]

    %16
    la4 r8 r32 la re mi fad8.[fad16 re8. re16]
    si4 r8 r32 si mi fad sold8. [sold16 mi8. mi16]
    do4 r8 r32 do mi sol la8.[la16 fa?8. fa16]

    %19
    re4 r8 r32 sol, si re do8. [do16 sol'8. sol16]
    si,4 r8 r32 si re sol re8.[re16 la8. la16]
    sol4 r8 r32 sol si re fad,8.[fad16 re'8. re16]

    %22
    re8.[re16 si8. si16] sol8.[sol16 re8. re16]
    re8.[re16 si'8. si16] sol8.[sol16 re8. re16]
    do4 sol' r2

    %25
    do4. do8 sol'[sol16 sol sol8 fa]\mbreak
    mi8[do do mi16 fa] sol8 sol, re'[sol]
    sol4 r8 mi fa re sol re
    mi do r do re[si mi si]

    %29
    do la r re si sol r4
    sol4. sol8 re' [re16 re re8 re]
    re4 do8 do fa [fa16 fa fa8 fa]

    %32
    mi2 re
    do si
    la4 r8 mi' red4 mi~

    %35
    mi re!2 dod4
    re2. do!4
    si4. mi8 mi2~\mbreak

    %38
    mi mi~
    mi mi~
    mi mi~

    %41
    mi mi~
    mi mi4 r
    r2 mi4. mi8

    %44
    si' [si16 si si8 la] sol mi mi sol16 la
    si8 si, r4 mi16[red mi fad] sol[fad sol mi]
    red[dod red mi] fad[mi fad red] sol[fad sol la] si[la si sol]

    %47
    fad8 sol fad4\mbreak mi r
    r8 la, si dod re4 do
    si8[sol la si] do2~

    %50
    do4 si la2
    sol4 r sol4. sol8
    re' [re16 re re8 do] si sol sol[si16 do]

    %53
    re8 re, r4 si'16[la si do] re[do re si]
    la[sol la si] do[si do la] si8 si la4
    sol r do16[si do re] mi[re mi do]

    %56
    si8 sol r4 r r8 mi'
    fa[re sol re] mi do r do
    re[si mi si] do la r la\mbreak

    %59
    si8[sol do mi] re2
    do16[si do re] mi [re mi do] sol'2
    mi16[re mi fa] mi[re do si] do8[la do mi]

    %62
    re16[do re mi] re[do si la] si8[sol si re]
    do16[si do re] do[mi re do] si8 sol r4
    r r8 do re[si sol' si,]\mbreak

    %65
    do la r la si[sol mi' sol,]
    la fa re'[si] sol4 r
    re'4. re8 mi[mi16 mi mi8 mi]

    %68
    re re re4 mi re
    mi re mi2\fermata


}


XvlIn = \relative do'' {

    sol'8. [sol16 mi8. mi16] do4 r8 r32 do mi fa
    sol8. [sol16 mi8. mi16] do4 r8 r32 do mi fa
    sol8.[sol16 do,8. do16] la4 r8 r32 do fa sol

    %4
    la8. [la16 re,8. re16] fa8.[fa16 si,8. si16]
    do8 sol mi do do' do do do
    si si si si la la la la

    %7
    sol sol sol sol fa fa fa fa
    mi mi mi mi fa fa fa fa
    sol sol sol sol do do sol sol

    %10
    mi mi do do r2
    R1*4
    r2 sol''8. [sol16 mi8. mi16]

    %16
    do4 r8 r32 dod fa sol la8.[la16 fad8. fad16]
    re4 r8 r32 re sol la si8.[si16 sold8. sold16]
    mi4 r8 r32 mi la si do8.[do16 la8. la16]

    %19
    fa4 r8 r32 si, re fa mi8.[mi16 do8. do16]
    re4 r8 r32 re sol si  la8.[la16 do,8. do16]
    si4 r8 r32 si re sol la,8.[la16 fad'8. fad16]

    %22
    sol8.[sol16 re8. re16] si8.[si16 sol8. sol16]
    fa!8.[fa16 re8. re16] si8.[si16 sol'8. sol16]
    mi4 do r2

    %25
    r sol'4. sol8\mbreak %% fine p.30
    do8[do16 do do8 do] si[sol sol la16 si]
    do8 do, do''2 si4~

    %28
    si la2 sol4~
    sol fad sol r
    R1

    %31
    r2 r4 r8 si
    si[si16 si do8 do] la la si si
    sol sol la la fa fa mi4

    %34
    do8 mi la2 sol4
    fa!2 sol
    fa4 la sold la~

    %37
    la sold la r\mbreak
    R1
    la,4. la8 mi'[mi16 mi mi8 re]

    %40
    do[la la do16 re] mi8 mi, r mi'
    do[do16 do do8 do] re4 si
    do8 do si4 la r

    %43
    si'1
    si
    si

    %46
    si
    si2\mbreak si8 mi, fad sold
    la4 sol! fad8[re mi fad]

    %49
    sol4 fa! mi fad
    sol2. fad4
    sol r r2

    %52
    re4. re8 sol[sol16 sol sol8 sol]
    fad[re re mi16 fad] sol8 sol, r4
    fad'16[mi fad sol] la[sol la fad] sol8 sol sol fad

    %55
    sol4 r sol4. sol8
    sol sol r4 r do~
    do si2 la4~

    %58
    la sol2 fa4~\mbreak
    fa mi8 fad sol2
    sol4 r re16[do re mi] fa[mi fa re]

    %61
    sol4 r la16[sol la si] la[sol fa mi]
    fa8 re fa la sol16[fa sol la] sol[fa mi re]
    mi8 do mi sol re4 r8 si'

    %64
    do la re la si sol r sol
    la[fa si fa] sol mi r mi
    fa[re sol re] mi16[re mi fa] sol8 r

    %67
    sol4. sol8 sol [sol16 sol sol8 sol]
    sol sol sol4 sol sol
    sol sol sol2\fermata

}

XvlIIn = \relative do'' {

    mi8.[mi16 do8. do16] sol4 r8 r32 sol do re
    mi8.[mi16 do8. do16] sol4 r8 r32 sol do re
    mi8.[mi16 sol,8. sol16] fa4 r8 r32 la do mi

    %4
    fa8.[fa16 la,8. la16] do8.[do16 sol8. sol16]
    do8 sol mi do do' do do do
    si si si si la la la la

    %7
    sol sol sol sol fa fa fa fa
    mi mi mi mi fa fa fa fa
    sol sol sol sol do do sol sol

    %10
    mi mi do do r2
    R1*4
    r2 mi'8.[mi16 do8. do16]

    %16
    la4 r8 r32 la re mi fad8.[fad16 re8. re16]
    si4 r8 r32 si mi fad sold8. [sold16 mi8. mi16]
    do4 r8 r32 do mi sol la8.[la16 fa?8. fa16]

    %19
    re4 r8 r32 sol, si re do8. [do16 sol'8. sol16]
    si,4 r8 r32 si re sol re8.[re16 la8. la16]
    sol4 r8 r32 sol si re fad,8.[fad16 re'8. re16]

    %22
    re8.[re16 si8. si16] sol8.[sol16 re8. re16]
    re8.[re16 si8. si16] sol8.[sol16 re'8. re16]
    do4 sol r2

    %25
    do'4. do8 sol'[sol16 sol sol8 fa]\mbreak
    mi8[do do mi16 fa] sol8 sol, re'[sol]
    sol4 r8 mi fa re sol re
    mi do r do re[si mi si]

    %29
    do la r re si sol r4
    sol4. sol8 re' [re16 re re8 re]
    re4 do8 do fa [fa16 fa fa8 fa]

    %32
    mi2 re
    do si
    la4 r8 mi' red4 mi~

    %35
    mi re!2 dod4
    re2. do!4
    si4. mi8 mi2~\mbreak

    %38
    mi mi~
    mi mi~
    mi mi~

    %41
    mi mi~
    mi mi4 r
    r2 mi4. mi8

    %44
    si' [si16 si si8 la] sol mi mi sol16 la
    si8 si, r4 mi16[red mi fad] sol[fad sol mi]
    red[dod red mi] fad[mi fad red] sol[fad sol la] si[la si sol]

    %47
    fad8 sol fad4\mbreak mi r
    r8 la, si dod re4 do
    si8[sol la si] do2~

    %50
    do4 si la2
    sol4 r sol4. sol8
    re' [re16 re re8 do] si sol sol[si16 do]

    %53
    re8 re, r4 si'16[la si do] re[do re si]
    la[sol la si] do[si do la] si8 si la4
    sol r do16[si do re] mi[re mi do]

    %56
    si8 sol r4 r r8 mi'
    fa[re sol re] mi do r do
    re[si mi si] do la r la\mbreak

    %59
    si8[sol do mi] re2
    do16[si do re] mi [re mi do] sol'2
    mi16[re mi fa] mi[re do si] do8[la do mi]

    %62
    re16[do re mi] re[do si la] si8[sol si re]
    do16[si do re] do[mi re do] si8 sol r4
    r r8 do re[si sol' si,]\mbreak

    %65
    do la r la si[sol mi' sol,]
    la fa re'[si] sol4 r
    re'4. re8 mi[mi16 mi mi8 mi]

    %68
    re re re4 mi re
    mi re mi2\fermata

}

XvlaIn = \relative do' {

    do'8. [do16 sol8. sol16] mi4 r
    do'8. [do16 sol8. sol16] mi4 r
    do'8. [do16 mi,8. mi16] do4 r

    %4
    do'8.[do16 la8. la16] la8.[la16 re,8. re16]
    do'8 sol mi do do' do do do
    si si si si la la la la

    %7
    sol sol sol sol fa fa fa fa
    mi mi mi mi fa fa fa fa
    sol sol sol sol do do sol sol

    %10
    mi mi do do r2
    R1*4
    r2 do'8.[do16 sol8. sol16]

    %16
    fa4 fa re'8.[re16 la8. la16]
    sol4 sol mi'8.[mi16 si8. si16]
    la4 la fa8.[fa16 fa8. fa16]

    %19
    si4 si sol8.[sol16 mi8. mi16]
    re4 re fad8.[fad16 fad8. fad16]
    re4 re re8.[re16 re8. re16]

    %22
    si'8.[si16 sol8. sol16] re8.[re16 si8. si16]
    si8.[si16 si8. si16] re8.[re16 si8. si16]
    sol4 mi sol'4. sol8

    %25
    do[do16 do do8 do] si [sol sol la16 si]\mbreak
    do8 do, r4 sol'16 fa mi re do si la sol
    do4 r re'2

    %28
    do si
    la4 la sol4. sol8
    do do16 do do8 do do4 si8 si

    %31
    mi mi16 mi mi8 mi mi4 re~
    re do2 si4~
    si la2 sold4

    %34
    mi4 r8 do' fad, si4 sol8
    do4 la8 fa! si mi,4 dod'8
    la4. fa8 si mi,4 mi8

    %37
    fa4 mi do r\mbreak
    la4. la8 mi'[mi16 mi mi8 re]
    do la la[do16 re mi8 mi,] r4

    %40
    la16 [sold la si] do[si do la] sold[fad sold la] si[la si sold]
    do[si do re] mi[re mi do] si[la si do] re[do re si]
    la8 [la la sold] la do16 re mi re mi do

    %43
    si8 sol! r4 r2
    si4. si8 mi mi16 mi mi8 mi
    red si si[dod16 red] mi8 mi, r4

    %46
    si'16[la si dod] red[dod red si] mi[red mi fad] sol[fad sol mi]
    red8 mi mi[red]\mbreak  mi4 r
    mi4. dod8 la4. re8

    %49
    re4. si8 sol[do la re]
    re2 mi4 re
    re'1

    %52
    re
    re
    re

    %55
    re4 r mi,16[re mi fa] sol[fa sol mi]
    re8 si r4 sol'4. sol8
    re' re re si do do do la

    %58
    si si si sol la la la fa\mbreak
    sol sol16 sol sol8 do do do do si
    do4 r si16[la si do] re[do re si]

    %61
    do4 r mi4. mi8
    la, [la16 la la8 la] re re r re
    sol, [sol16 sol sol8 sol] sol sol sol4~

    %64
    sol fa2 mi4~\mbreak
    mi re2 do4~
    do si do16[si do re] mi8 r

    %67
    si'4. si8 do[do16 do do8 do]
    do do si4 do si
    do si do2\fermata

}

XsopranoIn = \relative do'' {

    \autoBeamOff
    R1*4
    r2 do~
    do do

    %7
    do do~
    do re4. do8
    si4. si8 do2~

    %10
    do r
    R1*4
    r2 do4 do

    %16
    la la re re
    si8. si16 si8 si mi4 mi
    do do fa fa

    %19
    re8. re16 re4 mi mi
    re2~ re4 do
    si si la2

    %22
    si r
    R1*2
    r2 sol4. sol8\mbreak

    %26
    do8 do16 do do8 do si sol sol[la16 si]
    do8 do, r mi' fa[re sol re]
    mi do r do re[si mi si]

    %29
    do la r re si sol r4
    sol4. sol8 re' re16 re re8 re
    re4 do8 do fa fa16 fa fa8 fa

    %32
    mi2 re
    do si
    la r

    %35
    R1*4
    la4. la8 mi' mi16 mi mi8 re
    do la la[do16 re] mi8 mi, r mi'

    %41
    do do16 do do8 do re4 si
    do8 do si4 la r
    si1

    %44
    si2 si
    si si
    si si4 si

    %47
    si2\mbreak si4 r
    r8 la[si dod] re4 do
    si8[sol la si] do2~

    %50
    do4 si la2
    sol4 r sol4. sol8
    re' re16 re re8 do si sol sol[si16 do]

    %53
    re8 re, r4 si'16[la si do] re[do re si]
    la[sol la si] do[si do la] si8 si la4
    sol r do16[si do re] mi[re mi do]

    %56
    si8 sol r4 r r8 mi'
    fa[re sol re] mi do r do
    re[si mi si] do la r la\mbreak

    %59
    si8[sol do mi] re2
    do16[si do re] mi [re mi do] sol'2
    mi16[re mi fa] mi[re do si] do8[la do mi]

    %62
    re16[do re mi] re[do si la] si8[sol si re]
    do16[si do re] do[mi re do] si8 sol r4
    r r8 do re[si sol' si,]\mbreak

    %65
    do la r la si[sol mi' sol,]
    la fa re'[si] sol4 r
    si4. si8 do do16 do do8 do

    %68
    do do si4 do re
    mi re mi2\fermata

}

XtestoI = \lyricmode {

    Glo -- ri -- a Pa -- tri  et  Fi --li -- o.

    Si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per et in sae -- cula _

    sae -- cu -- lo - - rum a -- men et in sae -- cula _

    sae -- cu -- lo -- rum a - men a - - men a - - men a - men

    et in sae -- cula _ sae -- cu -- lo -- rum in sae -- cula _ sae -- cu -- lo -- rum a - men %% OOKK

    et in sae -- cula _ sae -- cu -- lo -- rum a - men in sae -- cula _ sae -- cu -- lo - - rum a -- men.

    Glo -- ri -- a et Spi -- ri -- tu -- i Sanc -- to, a - - - - - - men  et in sae -- cula _ sae -- cu -- lo -- rum

    s - men a - - - - men a -- men a - - men a - - men a - - men a - men a - men a - - - - - - - - men

    a - - men a - - men a -- men et in sae -- cula _ sae -- cu -- lo -- rum a -- men a -- men a -- men.

}

XaltoIn = \relative do' {

    \autoBeamOff
    R1*14
    r2 sol'4 sol
    fa fa  la la

    %17
    sol8. sol16 sol8 sol si4 si
    la la do do
    si8. si16 si4 do do

    %20
    si2 la
    sol4 sol sol fad
    sol2 r

    %23
    R1*2
    do,4. do8 sol' sol16 sol sol8 fa\mbreak
    mi8 do do[mi16 fa] sol8 sol, re'[sol]

    %27
    sol4 do2 si4~
    si la2 sol4~
    sol fad sol r

    %30
    R1
    r2 r4 r8 si
    si si16 si do8 do la la si si

    %33
    sol sol la la fa fa mi4
    mi2 r
    R1*2

    %37
    r2 mi~\mbreak
    mi mi~
    mi mi

    %40
    mi mi
    mi mi
    mi mi4 r

    %43
    r2 mi4. mi8
    si' si16 si si8 la sol mi mi[sol16 la]
    si8 si, r4 mi16[red mi fad] sol[fad sol mi]

    %46
    red[dod red mi] fad[mi fad red] sol[fad sol la] si[la si sol]
    fad8 sol fad4\mbreak sol8[mi fad sold]
    la4 sol! fad8[re mi fad]

    %49
    sol4 fa! mi fad
    sol2. fad4
    sol r r2

    %52
    re4. re8 sol sol16 sol sol8 sol
    fad re re [mi16 fad] sol8 sol, r4
    fad'16[mi fad sol] la[sol la fad] sol8 sol sol [fad]

    %55
    sol4 r sol4. sol8
    sol sol r4 r do~
    do si2 la4~

    %58
    la sol2 fa4~\mbreak
    fa mi8 [fad] sol2
    sol4 r re16[do re mi] fa[mi fa re]

    %61
    sol4 r la16[sol la si] la[sol fa mi]
    fa8 [re fa la] sol16[fa sol la] sol[fa mi re]
    mi8 [do mi sol] re4 r8 si'

    %64
    do [la re la] si sol r sol\mbreak
    la[fa si fa] sol mi r mi
    fa[re sol re] mi16[re mi fa] sol8 r

    %67
    sol4. sol8 sol sol16 sol sol8 sol
    sol sol sol4 sol sol
    sol sol sol2\fermata

}

XtestoII = \lyricmode {

    Si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per et in sae -- cula _

    sae -- cu -- lo - - rum a - men et in sae -- cula _

    sae -- cu -- lo -- rum a - men a -- men a - - - - men

    in sae -- cula _ sae -- cu -- lo -- rum in sae -- cula _ sae -- cu -- lo -- rum a -- men

    Glo -- ri -- a Pa -- tri et Fi -- li -- o

    et in sae -- cula _ sae -- cu -- lo -- rum a - men a - - - - - - men a - - - - - - - - - - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - men a - - men a -- men a -- men a -- men

    a - - - - - - men a - - - - - - - - men a - - men a - - men a - - men

    et in sae -- cula _ sae -- cu -- lo -- rum a -- men a -- men a -- men.

}

XtenoreIn = \relative do' {

    \autoBeamOff
    R1*14
    r2 do4 do
    do do re re

    %17
    re8. re16 re8 re mi4 mi
    mi mi do do
    re8. re16 re4 do do

    %20
    re1
    re4 re re2
    re r

    %23
    R1
    r2 sol,4. sol8
    do do16 do do8 do si sol sol[la16 si]\mbreak

    %26
    do8 do, r4 sol''16[fa mi re do si la sol]
    do4 r re2
    do si

    %29
    la4 la sol4. sol8
    do do16 do do8 do do4 si8 si
    mi mi16 mi mi8 mi mi4 re~

    %32
    re do2 si4~
    si la2 sold4
    la2 r

    %35
    R1*3\mbreak
    la4. la8 mi' mi16 mi mi8 re
    do la la[do16 re] mi8 mi, r4

    %40
    la16 [sold la si] do[si do la] sold[fad sold la] si[la si sold]
    do[si do re] mi[re mi do] si[la si do] re[do re si]
    la8 la la[sold] la do16[re mi re mi do]

    %43
    si8 sol! r4 r2
    si4. si8 mi mi16 mi mi8 mi
    red si si[dod16 red] mi8 mi, r4

    %46
    si'16[la si dod] red[dod red si] mi[red mi fad] sol[fad sol mi]
    red8 mi mi[red]\mbreak  mi4 r
    mi4. dod8 la4. re8

    %49
    re4. si8 sol[do la re]
    re2 mi4 re
    re2 re

    %52
    re re
    re4 re re8. re16 re4
    re re8 re re2

    %55
    re4 r mi16[re mi fa] sol[fa sol mi]
    re8 si r4 sol4. sol8
    re' re re si do do do la

    %58
    si si si sol la la la fa\mbreak
    sol sol16 sol sol8 do do do do[si]
    do4 r si16[la si do] re[do re si]

    %61
    do4 r mi4. mi8
    la, la16 la la8 la re re r re
    sol, sol16 sol sol8 sol sol sol sol'4~

    %64
    sol fa2 mi4~\mbreak
    mi re2 do4~
    do si do16[si do re] mi8 r

    %67
    re4. re8 mi mi16 mi mi8 mi
    re re re4 mi si
    do si do2\fermata

}

XtestoIII = \lyricmode {

    Si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per et in sae -- cula _

    sae -- cu -- lo - rum a -- men

    et in sae -- cula _

    sae -- cu -- lo -- rum a - men a -- men a - - - - men

    in sae -- cula _ sae -- cu -- lo -- rum in sae -- cula _ sae -- cu -- lo -- rum a - - - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - men a - - - - - - - - men a -- men a - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - men a - - - - men a -- men a - - - - - - - - men.

    Si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per a - - men

    si -- cut e -- rat in prin -- ci -- pio _ et nunc et nunc et sem -- per

    et in  sae -- cula _ sae -- cu -- lo -- rum a -- men a - men

    et in sae -- cula _ sae -- cu -- lo -- rum in sae -- cula _ sae -- cu -- lo -- rum

    a - - - - - -  men et in sae -- cula _ sae -- cu -- lo -- rum a -- men a -- men  a -- men.

}

XbassoIn = \relative do {

    \autoBeamOff
    R1*14
    r2 mi4 mi
    fa fa fad fad

    %17
    sol8. sol16 sol8 sol sold4 sold
    la la la la
    sol8. sol16 sol4 sol sol

    %20
    sol2 fad
    sol4 sol re2
    sol, r

    %23
    R1
    do4. do8 sol' sol16 sol sol8 fa

    %25
    mi do do [mi16 fa] sol8 sol, r4\mbreak
    do'16[si la sol fa mi re do] sol'4. fa8
    mi do do' do fa, fa16 fa si8 si

    %28
    mi, mi la la re, re16 re sol8 sol
    do, do re4 sol,4 sol'8 sol
    sol sol,16 sol sol'8 sol sol sol, sol' sol

    %31
    sol sol,16 sol sol'8 sol sol sol, r sol'
    sol sol16 sol la8 la fad fad sol sol
    mi mi fa! fa re re mi4

    %34
    la,2 r
    R1*3
    r2 mi'4. mi8
    la la16 la la8 la sold mi mi [fad16 sold]

    %40
    la8 la, r4 mi'16 [re mi fad] sold [fad sold mi]
    la [sold la si] do [si do la] sold [fad sold la] si [la si sold]
    la8 la, mi'4 la16[sol! la si] do[si do la]

    %43
    sol8 mi r4 r2
    r mi4. mi8
    si'8 si16 si si8 la sol mi mi [sol16 la]

    %46
    si8 si, si' la sol mi16 mi mi8 mi
    si'8 mi, si' [si,]\mbreak mi2
    la re,

    %49
    sol do,4 re
    sol,8 [sol' si sol] do [la re re,]
    sol4 r r2

    %52
    r sol4. sol8
    re'8 re16 re re8 do si sol r4
    re' re, sol8 sol, re'4

    %55
    sol16 [fa sol la] si [la si sol] do4 r
    sol2 sol4 sol
    sol2 sol4 sol

    %58
    sol8. sol16 sol4 sol2\mbreak
    sol sol4 sol8 sol
    sol4 sol sol sol

    %61
    sol sol sol sol
    sol8. sol16 sol8 sol sol4 sol
    sol sol sol sol

    %64
    sol sol8 sol sol4 sol\mbreak
    sol sol sol2
    sol do,4. do8

    %67
    sol' sol16 sol sol8 sol do4 do,
    sol' (sol,) do sol'
    do, sol' do,2\fermata

}

XtestoIV = \lyricmode {

    Si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per et in sae -- cula _

    sae -- cu -- lo - - rum a -- men

    et in sae -- cula _

    sae -- cu -- lo -- rum a - men a - - - men

    et in sae -- cula _ sae -- cu -- lo -- rum et in sae -- cula _ sae -- cu -- lo -- rum a -- men %OK bar 29

    et in sae -- cula _ sae -- cu -- lo -- rum

    et in sae -- cula _ sae -- cu -- lo -- rum  in sae -- cula _ sae -- cu -- lo -- rum

    in sae -- cula _ sae -- cu -- lo -- rum a -- men %%%OOKK bar 34

    et in sae -- cula _ sae -- cu -- lo -- rum a - men a - - - - - - men a - - - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - - - - - - - - men

    et in sae -- cula _ sae -- cu -- lo -- rum a -- men a -- men a - - men.

    Glo -- ri -- a Pa -- tri et Fi -- lio _ et Spi -- ri tui _ Sanc -- to,

    si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per et in sae -- cula _  sae -- cu -- lo -- rum

    a -- men et in sae -- cula _  sae -- cu -- lo -- rum a -- men a -- men a -- men.

}

XbcIn = \relative do {

    do'8.[do16 do,8. do16] do4 r
    do'8.[do16 do,8. do16] do4 r
    do'8.[do16 do,8. do16] fa4 r

    %4
    fa8.[fa16 fa8. fa16] fa8.[fa16 sol8. sol16]
    do8 sol mi do do' do do do
    si si si si la la la la

    %7
    sol sol sol sol fa fa fa fa
    mi mi mi mi fa fa fa fa
    sol sol sol sol do do sol sol

    %10
    mi mi do do r2
    R1*4
    r2 mi8.[mi16 mi8. mi16]

    %16
    fa4 fa fad8.[fad16 fad8. fad16]
    sol4 sol sold8.[sold16 sold8. sold16]
    la4 la la8.[la16  la8. la16]

    %19
    sol4 sol sol8.[sol16 sol8. sol16]
    sol4 sol fad8.[fad16 fad8. fad16]
    sol4 sol re8.[re16 re8. re16]

    %22
    sol,8.[sol16 sol'8. sol16] sol,8.[sol16 sol'8. sol16]
    sol,8.[sol16 sol'8. sol16] sol,8.[sol16 sol'8. sol16]
    do,4. do8 sol'[sol16 sol sol8 fa]

    %25
    mi do do mi16 fa sol8 sol, r4\mbreak
    do'16[si la sol fa mi re do] sol'4. fa8
    mi do do'[do]fa,[fa16 fa si8 si]

    %28
    mi, mi la la re,[re16 re sol8 sol]
    do, do re re, sol4 sol'8 sol
    sol sol, sol' sol sol sol, sol' sol

    %31
    sol sol, sol'[sol] sol sol, r sol'
    sol[sol16 sol la8 la] fad fad sol sol
    mi mi fa! fa re re mi mi

    %34
    la, la' do la si si, mi'[mi,]
    la la, re'[re,] mi' mi ,la[la,]
    re' re, fa re mi mi, la'[la,]

    %37
    re re, mi'[mi,] la4 r\mbreak
    r2 mi'4. mi8
    la[la16 la la8 la] sold[mi mi fad16 sold]

    %40
    la8 la, r4 mi'16 re mi fad sold fad sold mi
    la sold la si do si do la sold fad sold la si la si sold
    la8 la, mi'4 la16 sol! la si do si do la

    %43
    sol8 mi r4 \clef alto mi'4. mi8
    <<{si'8[si16 si si8 la]}\\{si,4. si8}>> \clef bass mi,4. mi8
    si'8[si16 si si8 la] sol[mi mi sol16 la]

    %46
    si8 si, si'[la] sol[mi16 mi mi8 mi]
    si'8 mi, si' si,\mbreak mi2
    la re,

    %49
    sol do,4 re
    sol,8 sol' si sol do la re re,
    \clef tenor <<{re'2 re}\\{sol,4 r r2}>>

    %52
    re' \clef bass sol,4. sol8
    re'8[re16 re re8 do] si sol r4
    re' re, sol8 sol, re'4

    %55
    sol16 fa sol la si la si sol do4 r
    sol1\tasto ~
    sol~

    %58
    sol~\mbreak
    sol~
    sol~

    %61
    sol~
    sol~
    sol~

    %64
    sol~
    sol~
    sol2 do,4. do8

    %67
    sol'[sol16 sol sol8 sol] do4 do,
    sol' sol, do sol
    do sol do2\fermata

}

XbfIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*17
    s2 <6>
    <7 5> <6 4>
    <5 3> s4 <6 5>
    s2 <_+>
    s1
    <7->
    s1*3
    s2 <6 5>
    <6 5> <6 5>
    <6 5>4 <_+> s2
    <6 4> <5 4>4 <3>
    <6 4>2 <7 6>4 s8 <7 5>
    s2 <6 5>
    <6 5> <6 4>4 <_+>
    s2 <7 _+>
    <6- 5>4 <_-> <7 3> <7 _+>
    <_->2 <7 _+>4 <_->
    <6 5>4 <_+> s2
    s1
    s
    s2 <_+>
    s <6 5>
    s4 <5 4>8 <3+> s2
    s1*2
    <_+>1
    <_+>
    <_+>4 <5+ 4>8 <3+> s4. <3+>8
    <7!>4 <3+> <_+> <7!>
    s4 <7-> s <7 _+>
    <5 4> s8 <3> <6 5>4 <_+>
    s1*2
    <_+>1
    <_+>2 s4 <_+>

}


XvlIIIn = \relative do'' {

    r2 sol'8.[sol16 mi8. mi16]
    do4 r8 r32 do mi fa sol8.[sol16 mi8. mi16]
    do4 r8 r32 do re mi fa8.[fa16 do8. do16]

    %4
    la4 r8 r32 re fa sol la8.[la16 re,8. re16]
    do8 sol mi do r2
    R1*4

    %10
    r2 do'8 do do do
    si si si si la la la la
    sol sol sol sol fa fa fa fa

    %13
    mi mi mi mi fa fa fa fa
    sol sol sol sol do do sol sol
    mi mi do do r2

    %16
    la''8.[la16 fa8. fa16] re4 r8 r32 re fad la
    si8.[si16 sol8. sol16] mi4 r8 r32 mi sold si
    do8.[do16 la8. la16] fa4 r8 r32 fa la do

    %19
    re8.[re16 si8. si16] sol4 r8 r32 do, mi sol
    si8.[si16 sol8. sol16] la4 r8 r32 do, fad la
    sol8.[sol16 si,8. si16] la8.[la16 fad'8. fad16]

    %22
    sol8.[sol16 re8. re16] si8.[si16 sol8. sol16]
    fa!8.[fa16 re8. re16] si8.[si16 sol'8. sol16]
    mi4 do r2

    %25
    r sol'4. sol8\mbreak %% fine p.30
    do8[do16 do do8 do] si[sol sol la16 si]
    do8 do, do''2 si4~

    %28
    si la2 sol4~
    sol fad sol r
    R1

    %31
    r2 r4 r8 si
    si[si16 si do8 do] la la si si
    sol sol la la fa fa mi4

    %34
    do8 mi la2 sol4
    fa!2 sol
    fa4 la sold la~

    %37
    la sold la r\mbreak
    R1
    la,4. la8 mi'[mi16 mi mi8 re]

    %40
    do[la la do16 re] mi8 mi, r mi'
    do[do16 do do8 do] re4 si
    do8 do si4 la r

    %43
    si'1
    si
    si

    %46
    si
    si2\mbreak si8 mi, fad sold
    la4 sol! fad8[re mi fad]

    %49
    sol4 fa! mi fad
    sol2. fad4
    sol r r2

    %52
    re4. re8 sol[sol16 sol sol8 sol]
    fad[re re mi16 fad] sol8 sol, r4
    fad'16[mi fad sol] la[sol la fad] sol8 sol sol fad

    %55
    sol4 r sol4. sol8
    sol sol r4 r do~
    do si2 la4~

    %58
    la sol2 fa4~\mbreak
    fa mi8 fad sol2
    sol4 r re16[do re mi] fa[mi fa re]

    %61
    sol4 r la16[sol la si] la[sol fa mi]
    fa8 re fa la sol16[fa sol la] sol[fa mi re]
    mi8 do mi sol re4 r8 si'

    %64
    do la re la si sol r sol
    la[fa si fa] sol mi r mi
    fa[re sol re] mi16[re mi fa] sol8 r

    %67
    sol4. sol8 sol [sol16 sol sol8 sol]
    sol sol sol4 sol sol
    sol sol sol2\fermata

}

XvlIVn = \relative do'' {

    r2 mi8.[mi16 do8. do16]
    sol4 r8 r32 sol do re mi8.[mi16 do8. do16]
    sol4 r8 r32 sol si do do8.[do16 la8. la16]

    %4
    fa4 r8 r32 la do mi fa8.[fa16 si,8. si16]
    do8 sol mi do r2
    R1*4

    %10
    r2 do'8 do do do
    si si si si la la la la
    sol sol sol sol fa fa fa fa

    %13
    mi mi mi mi fa fa fa fa
    sol sol sol sol do do sol sol
    mi mi do do r2

    %16
    fa'8.[fa16 do8. do16] la4 r8 r32 la re fad
    sol8.[sol16 re8. re16] si4 r8 r32 si mi sold
    la8.[la16 mi8. mi16] do4 r8 r32 do fa la

    %19
    si8.[si16 sol8. sol16] mi4 r8 r32 sol, do mi
    sol8.[sol16 re8. re16] fad4 r8 r32 la, re fad
    re8.[re16 sol,8. sol16] fad8.[fad16 la8. la16]

    %22
    re8.[re16 si8. si16] sol8.[sol16 re8. re16]
    re8.[re16 si8. si16] sol8.[sol16 re'8. re16]
    do4 sol r2

    %25
    do'4. do8 sol'[sol16 sol sol8 fa]\mbreak
    mi8[do do mi16 fa] sol8 sol, re'[sol]
    sol4 r8 mi fa re sol re
    mi do r do re[si mi si]

    %29
    do la r re si sol r4
    sol4. sol8 re' [re16 re re8 re]
    re4 do8 do fa [fa16 fa fa8 fa]

    %32
    mi2 re
    do si
    la4 r8 mi' red4 mi~

    %35
    mi re!2 dod4
    re2. do!4
    si4. mi8 mi2~\mbreak

    %38
    mi mi~
    mi mi~
    mi mi~

    %41
    mi mi~
    mi mi4 r
    r2 mi4. mi8

    %44
    si' [si16 si si8 la] sol mi mi sol16 la
    si8 si, r4 mi16[red mi fad] sol[fad sol mi]
    red[dod red mi] fad[mi fad red] sol[fad sol la] si[la si sol]

    %47
    fad8 sol fad4\mbreak mi r
    r8 la, si dod re4 do
    si8[sol la si] do2~

    %50
    do4 si la2
    sol4 r sol4. sol8
    re' [re16 re re8 do] si sol sol[si16 do]

    %53
    re8 re, r4 si'16[la si do] re[do re si]
    la[sol la si] do[si do la] si8 si la4
    sol r do16[si do re] mi[re mi do]

    %56
    si8 sol r4 r r8 mi'
    fa[re sol re] mi do r do
    re[si mi si] do la r la\mbreak

    %59
    si8[sol do mi] re2
    do16[si do re] mi [re mi do] sol'2
    mi16[re mi fa] mi[re do si] do8[la do mi]

    %62
    re16[do re mi] re[do si la] si8[sol si re]
    do16[si do re] do[mi re do] si8 sol r4
    r r8 do re[si sol' si,]\mbreak

    %65
    do la r la si[sol mi' sol,]
    la fa re'[si] sol4 r
    re'4. re8 mi[mi16 mi mi8 mi]

    %68
    re re re4 mi re
    mi re mi2\fermata

}

XvlaIIn = \relative do' {

    r2 do'8. [do16 sol8. sol16]
    mi4 r do'8. [do16 sol8. sol16]
    mi4 r la8.[la16 fa8. fa16]

    %4
    do4 r do8.[do16 si8. si16]
    do'8 sol mi do r2
    R1*4

    %10
    r2 do'8 do do do
    si si si si la la la la
    sol sol sol sol fa fa fa fa

    %13
    mi mi mi mi fa fa fa fa
    sol sol sol sol do do sol sol
    mi mi do do r2

    %16
    do'8.[do16 la8. la16] fad4 fad
    re'8.[re16 si8. si16] sold4 sold
    mi'8.[mi16 do8. do16] la4 la

    %19
    re,8. [re16 re'8. re16] do4 do
    re8.[re16 si8. si16] re,4 re
    si'8.[si16 re,8. re16] re8.[re16 re8. re16]

    %22
    si'8.[si16 sol8. sol16] re8.[re16 si8. si16]
    si8.[si16 si8. si16] re8.[re16 si8. si16]
    sol4 mi sol'4. sol8

    %25
    do[do16 do do8 do] si [sol sol la16 si]\mbreak
    do8 do, r4 sol'16 fa mi re do si la sol
    do4 r re'2

    %28
    do si
    la4 la sol4. sol8
    do do16 do do8 do do4 si8 si

    %31
    mi mi16 mi mi8 mi mi4 re~
    re do2 si4~
    si la2 sold4

    %34
    mi4 r8 do' fad, si4 sol8
    do4 la8 fa! si mi,4 dod'8
    la4. fa8 si mi,4 mi8

    %37
    fa4 mi do r\mbreak
    la4. la8 mi'[mi16 mi mi8 re]
    do la la[do16 re mi8 mi,] r4

    %40
    la16 [sold la si] do[si do la] sold[fad sold la] si[la si sold]
    do[si do re] mi[re mi do] si[la si do] re[do re si]
    la8 [la la sold] la do16 re mi re mi do

    %43
    si8 sol! r4 r2
    si4. si8 mi mi16 mi mi8 mi
    red si si[dod16 red] mi8 mi, r4

    %46
    si'16[la si dod] red[dod red si] mi[red mi fad] sol[fad sol mi]
    red8 mi mi[red]\mbreak  mi4 r
    mi4. dod8 la4. re8

    %49
    re4. si8 sol[do la re]
    re2 mi4 re
    re'1

    %52
    re
    re
    re

    %55
    re4 r mi,16[re mi fa] sol[fa sol mi]
    re8 si r4 sol'4. sol8
    re' re re si do do do la

    %58
    si si si sol la la la fa\mbreak
    sol sol16 sol sol8 do do do do si
    do4 r si16[la si do] re[do re si]

    %61
    do4 r mi4. mi8
    la, [la16 la la8 la] re re r re
    sol, [sol16 sol sol8 sol] sol sol sol4~

    %64
    sol fa2 mi4~\mbreak
    mi re2 do4~
    do si do16[si do re] mi8 r

    %67
    si'4. si8 do[do16 do do8 do]
    do do si4 do si
    do si do2\fermata

}

XsopranoIIn = \relative do'' {

    \autoBeamOff

    R1*9
    r2 do~
    do do

    %12
    do do
    do re4 re8 do
    si2\mbreak do~

    %15
    do r
    la4 la re re
    si si mi8. mi16 mi8 mi

    %18
    do4 do fa fa
    re re mi8. mi16 mi4
    re re re do

    %21
    si si la2
    si r
    R1*2
    r2 sol4. sol8\mbreak

    %26
    do8 do16 do do8 do si sol sol[la16 si]
    do8 do, r mi' fa[re sol re]
    mi do r do re[si mi si]

    %29
    do la r re si sol r4
    sol4. sol8 re' re16 re re8 re
    re4 do8 do fa fa16 fa fa8 fa

    %32
    mi2 re
    do si
    la r

    %35
    R1*4
    la4. la8 mi' mi16 mi mi8 re
    do la la[do16 re] mi8 mi, r mi'

    %41
    do do16 do do8 do re4 si
    do8 do si4 la r
    si1

    %44
    si2 si
    si si
    si si4 si

    %47
    si2\mbreak si4 r
    r8 la[si dod] re4 do
    si8[sol la si] do2~

    %50
    do4 si la2
    sol4 r sol4. sol8
    re' re16 re re8 do si sol sol[si16 do]

    %53
    re8 re, r4 si'16[la si do] re[do re si]
    la[sol la si] do[si do la] si8 si la4
    sol r do16[si do re] mi[re mi do]

    %56
    si8 sol r4 r r8 mi'
    fa[re sol re] mi do r do
    re[si mi si] do la r la\mbreak

    %59
    si8[sol do mi] re2
    do16[si do re] mi [re mi do] sol'2
    mi16[re mi fa] mi[re do si] do8[la do mi]

    %62
    re16[do re mi] re[do si la] si8[sol si re]
    do16[si do re] do[mi re do] si8 sol r4
    r r8 do re[si sol' si,]\mbreak

    %65
    do la r la si[sol mi' sol,]
    la fa re'[si] sol4 r
    si4. si8 do do16 do do8 do

    %68
    do do si4 do re
    mi re mi2\fermata

}

XtestoV= \lyricmode {

    Glo -- ri -- a et Spi -- ri -- tui _ Sanc -- to.

    Si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per et in sae -- cula _

    sae -- cu -- lo - - rum a -- men et in sae -- cula _

    sae -- cu -- lo -- rum a - men a - - men a - - men a - men

    et in sae -- cula _ sae -- cu -- lo -- rum in sae -- cula _ sae -- cu -- lo -- rum a - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - men in sae -- cula _ sae -- cu -- lo - - rum a -- men.

    Glo -- ri -- a et Spi -- ri -- tu -- i Sanc -- to, a - - - - - - men  et in sae -- cula _ sae -- cu -- lo -- rum

    s - men a - - - - men a -- men a - - men a - - men a - - men a - men a - men a - - - - - - - - men

    a - - men a - - men a -- men et in sae -- cula _ sae -- cu -- lo -- rum a -- men a -- men a -- men.

}

XaltoIIn = \relative do' {

    \autoBeamOff
    R1*15
    fa4 fa la la
    sol sol si8. si16 si8 si

    %18
    la4 la do do
    si si do8. do16 do4
    si si la2

    %21
    sol4 sol sol(fad)
    sol2 r

    %23
    R1*2
    do,4. do8 sol' sol16 sol sol8 fa\mbreak
    mi8 do do[mi16 fa] sol8 sol, re'[sol]

    %27
    sol4 do2 si4~
    si la2 sol4~
    sol fad sol r

    %30
    R1
    r2 r4 r8 si
    si si16 si do8 do la la si si

    %33
    sol sol la la fa fa mi4
    mi2 r
    R1*2

    %37
    r2 mi~\mbreak
    mi mi~
    mi mi

    %40
    mi mi
    mi mi
    mi mi4 r

    %43
    r2 mi4. mi8
    si' si16 si si8 la sol mi mi[sol16 la]
    si8 si, r4 mi16[red mi fad] sol[fad sol mi]

    %46
    red[dod red mi] fad[mi fad red] sol[fad sol la] si[la si sol]
    fad8 sol fad4\mbreak sol8[mi fad sold]
    la4 sol! fad8[re mi fad]

    %49
    sol4 fa! mi fad
    sol2. fad4
    sol r r2

    %52
    re4. re8 sol sol16 sol sol8 sol
    fad re re [mi16 fad] sol8 sol, r4
    fad'16[mi fad sol] la[sol la fad] sol8 sol sol [fad]

    %55
    sol4 r sol4. sol8
    sol sol r4 r do~
    do si2 la4~

    %58
    la sol2 fa4~\mbreak
    fa mi8 [fad] sol2
    sol4 r re16[do re mi] fa[mi fa re]

    %61
    sol4 r la16[sol la si] la[sol fa mi]
    fa8 [re fa la] sol16[fa sol la] sol[fa mi re]
    mi8 [do mi sol] re4 r8 si'

    %64
    do [la re la] si sol r sol\mbreak
    la[fa si fa] sol mi r mi
    fa[re sol re] mi16[re mi fa] sol8 r

    %67
    sol4. sol8 sol sol16 sol sol8 sol
    sol sol sol4 sol sol
    sol sol sol2\fermata

}

XtestoVI = \lyricmode {

    Si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per et in sae -- cula _

    sae -- cu -- lo - rum a -- men et in sae -- cula _

    sae -- cu -- lo -- rum a - men a -- men a - - - - men

    in sae -- cula _ sae -- cu -- lo -- rum in sae -- cula _ sae -- cu -- lo -- rum a -- men

    Glo -- ri -- a Pa -- tri et Fi -- li -- o

    et in sae -- cula _ sae -- cu -- lo -- rum a - men a - - - - - - men a - - - - - - - - - - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - men a - - men a -- men a -- men a -- men

    a - - - - - - men a - - - - - - - - men a - - men a - - men a - - men

    et in sae -- cula _ sae -- cu -- lo -- rum a -- men a -- men a -- men.

}

XtenoreIIn = \relative do' {

    \autoBeamOff
    R1*15
    do4 do re re
    re re mi8. mi16 mi8 mi

    %18
    mi4 mi do do
    re re do8. do16 do4
    re re re2~

    %21
    re4 re re2
    re r
    R1

    %24
    r2 sol,4. sol8
    do do16 do do8 do si sol sol[la16 si]\mbreak

    %26
    do8 do, r4 sol''16[fa mi re do si la sol]
    do4 r re2
    do si

    %29
    la4 la sol4. sol8
    do do16 do do8 do do4 si8 si
    mi mi16 mi mi8 mi mi4 re~

    %32
    re do2 si4~
    si la2 sold4
    la2 r

    %35
    R1*3\mbreak
    la4. la8 mi' mi16 mi mi8 re
    do la la[do16 re] mi8 mi, r4

    %40
    la16 [sold la si] do[si do la] sold[fad sold la] si[la si sold]
    do[si do re] mi[re mi do] si[la si do] re[do re si]
    la8 la la[sold] la do16[re mi re mi do]

    %43
    si8 sol! r4 r2
    si4. si8 mi mi16 mi mi8 mi
    red si si[dod16 red] mi8 mi, r4

    %46
    si'16[la si dod] red[dod red si] mi[red mi fad] sol[fad sol mi]
    red8 mi mi[red]\mbreak  mi4 r
    mi4. dod8 la4. re8

    %49
    re4. si8 sol[do la re]
    re2 mi4 re
    re2 re

    %52
    re re
    re4 re re8. re16 re4
    re re8 re re2

    %55
    re4 r mi16[re mi fa] sol[fa sol mi]
    re8 si r4 sol4. sol8
    re' re re si do do do la

    %58
    si si si sol la la la fa\mbreak
    sol sol16 sol sol8 do do do do[si]
    do4 r si16[la si do] re[do re si]

    %61
    do4 r mi4. mi8
    la, la16 la la8 la re re r re
    sol, sol16 sol sol8 sol sol sol sol'4~

    %64
    sol fa2 mi4~\mbreak
    mi re2 do4~
    do si do16[si do re] mi8 r

    %67
    re4. re8 mi mi16 mi mi8 mi
    re re re4 mi si
    do si do2\fermata


}

XtestoVII = \lyricmode {

    Si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per et in sae -- cula _

    sae -- cu -- lo -- rum a -- men

    et in sae -- cula _

    sae -- cu -- lo -- rum a - men a -- men a - - - - men

    in sae -- cula _ sae -- cu -- lo -- rum in sae -- cula _ sae -- cu -- lo -- rum a - - - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - men a - - - - - - - - men a -- men a - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - men a - - - - men a -- men a - - - - - - - - men.

    Si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per a - - men

    si -- cut e -- rat in prin -- ci -- pio _ et nunc et nunc et sem -- per

    et in  sae -- cula _ sae -- cu -- lo -- rum a -- men a - men

    et in sae -- cula _ sae -- cu -- lo -- rum in sae -- cula _ sae -- cu -- lo -- rum

    a - - - - - -  men et in sae -- cula _ sae -- cu -- lo -- rum a -- men a -- men  a -- men.

}

XbassoIIn = \relative do {

    \autoBeamOff
    R1*15
    fa4 fa fad fad
    sol sol sold8. sold16 sold8 sold

    %18
    la4 la la la
    sol sol sol8. sol16 sol4
    sol sol fad2

    %21
    sol4 sol re2
    sol, r
    R1
    do4. do8 sol' sol16 sol sol8 fa

    %25
    mi do do [mi16 fa] sol8 sol, r4\mbreak
    do'16[si la sol fa mi re do] sol'4. fa8
    mi do do' do fa, fa16 fa si8 si

    %28
    mi, mi la la re, re16 re sol8 sol
    do, do re4 sol,4 sol'8 sol
    sol sol,16 sol sol'8 sol sol sol, sol' sol

    %31
    sol sol,16 sol sol'8 sol sol sol, r sol'
    sol sol16 sol la8 la fad fad sol sol
    mi mi fa! fa re re mi4

    %34
    la,2 r
    R1*3
    r2 mi'4. mi8
    la la16 la la8 la sold mi mi [fad16 sold]

    %40
    la8 la, r4 mi'16 [re mi fad] sold [fad sold mi]
    la [sold la si] do [si do la] sold [fad sold la] si [la si sold]
    la8 la, mi'4 la16[sol! la si] do[si do la]

    %43
    sol8 mi r4 r2
    r mi4. mi8
    si'8 si16 si si8 la sol mi mi [sol16 la]

    %46
    si8 si, si' la sol mi16 mi mi8 mi
    si'8 mi, si' [si,]\mbreak mi2
    la re,

    %49
    sol do,4 re
    sol,8 [sol' si sol] do [la re re,]
    sol4 r r2

    %52
    r sol4. sol8
    re'8 re16 re re8 do si sol r4
    re' re, sol8 sol, re'4

    %55
    sol16 [fa sol la] si [la si sol] do4 r
    sol2 sol4 sol
    sol2 sol4 sol

    %58
    sol8. sol16 sol4 sol2\mbreak
    sol sol4 sol8 sol
    sol4 sol sol sol

    %61
    sol sol sol sol
    sol8. sol16 sol8 sol sol4 sol
    sol sol sol sol

    %64
    sol sol8 sol sol4 sol\mbreak
    sol sol sol2
    sol do,4. do8

    %67
    sol' sol16 sol sol8 sol do4 do,
    sol' (sol,) do sol'
    do, sol' do,2\fermata

}

XtestoVIII = \lyricmode {

    Si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per et in sae -- cula _

    sae -- cu -- lo - rum a -- men

    et in sae -- cula _

    sae -- cu -- lo -- rum a - men a - - - men

    et in sae -- cula _ sae -- cu -- lo -- rum et in sae -- cula _ sae -- cu -- lo -- rum a -- men %OK bar 29

    et in sae -- cula _ sae -- cu -- lo -- rum

    et in sae -- cula _ sae -- cu -- lo -- rum  in sae -- cula _ sae -- cu -- lo -- rum

    in sae -- cula _ sae -- cu -- lo -- rum a -- men %%%OOKK bar 34

    et in sae -- cula _ sae -- cu -- lo -- rum a - men a - - - - - - men a - - - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - men

    et in sae -- cula _ sae -- cu -- lo -- rum a - - - - - - - - men

    et in sae -- cula _ sae -- cu -- lo -- rum a -- men a -- men a - - men.

    Glo -- ri -- a Pa -- tri et Fi -- lio _ et Spi -- ri tui _ Sanc -- to,

    si -- cut e -- rat in prin -- ci -- pio _ et nunc et sem -- per et in sae -- cula _  sae -- cu -- lo -- rum

    a -- men et in sae -- cula _  sae -- cu -- lo -- rum a -- men a -- men a -- men.

}

XbcIIn = \relative do {

    r2 do'8.[do16 do,8. do16]
    do4 r do'8.[do16 do,8. do16]
    do4 r fa8.[fa16 fa,8. fa16]

    %4
    fa4 r fa'8.[fa16 sol8. sol16]
    do8 sol mi do r2
    R1*4

    %10
    r2 do'8 do do do
    si si si si la la la la
    sol sol sol sol fa fa fa fa

    %13
    mi mi mi mi fa fa fa fa
    sol sol sol sol do do sol sol
    mi mi do do r2

    %16
    fa8.[fa16 fa8. fa16] fad4 fad
    sol8.[sol16 sol8. sol16] sold4 sold
    la8.[la16 la8. la16] la4 la

    %19
    sol8.[sol16 sol8. sol16] sol4 sol
    sol8.[sol16 sol8. sol16] fad4 fad
    sol8.[sol16 sol8. sol16] re8.[re16 re8. re16]

    %22
    sol,8.[sol16 sol'8. sol16] sol,8.[sol16 sol'8. sol16]
    sol,8.[sol16 sol'8. sol16] sol,8.[sol16 sol'8. sol16]
    do,4. do8 sol'[sol16 sol sol8 fa]

    %25
    mi do do mi16 fa sol8 sol, r4\mbreak
    do'16[si la sol fa mi re do] sol'4. fa8
    mi do do'[do]fa,[fa16 fa si8 si]

    %28
    mi, mi la la re,[re16 re sol8 sol]
    do, do re re, sol4 sol'8 sol
    sol sol, sol' sol sol sol, sol' sol

    %31
    sol sol, sol'[sol] sol sol, r sol'
    sol[sol16 sol la8 la] fad fad sol sol
    mi mi fa! fa re re mi mi

    %34
    la, la' do la si si, mi'[mi,]
    la la, re'[re,] mi' mi ,la[la,]
    re' re, fa re mi mi, la'[la,]

    %37
    re re, mi'[mi,] la4 r\mbreak
    r2 mi'4. mi8
    la[la16 la la8 la] sold[mi mi fad16 sold]

    %40
    la8 la, r4 mi'16 re mi fad sold fad sold mi
    la sold la si do si do la sold fad sold la si la si sold
    la8 la, mi'4 la16 sol! la si do si do la

    %43
    sol8 mi r4 \clef alto mi'4. mi8
    <<{si'8[si16 si si8 la]}\\{si,4. si8}>> \clef bass mi,4. mi8
    si'8[si16 si si8 la] sol[mi mi sol16 la]

    %46
    si8 si, si'[la] sol[mi16 mi mi8 mi]
    si'8 mi, si' si,\mbreak mi2
    la re,

    %49
    sol do,4 re
    sol,8 sol' si sol do la re re,
    \clef tenor <<{re'2 re}\\{sol,4 r r2}>>

    %52
    re' \clef bass sol,4. sol8
    re'8[re16 re re8 do] si sol r4
    re' re, sol8 sol, re'4

    %55
    sol16 fa sol la si la si sol do4 r
    sol1\tasto ~
    sol~

    %58
    sol~\mbreak
    sol~
    sol~

    %61
    sol~
    sol~
    sol~

    %64
    sol~
    sol~
    sol2 do,4. do8

    %67
    sol'[sol16 sol sol8 sol] do4 do,
    sol' sol, do sol
    do sol do2\fermata

}

XbfIIn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s2 s4 <7>
    s1*13
    s2 <6>
    <7 5> <6 4>
    <3> s4 <6 5>
    s2 <_+>
    s1
    <7->
    s1*3
    s2 <6 5>
    <6 5> <6 5>
    <6 5>4 <_+> s2
    <6 4> <5 4>4 <3>
    <6 4>2 <7 6>4 s8 <7 5>
    s2 <6 5>
    <6 5> <6 4>4 <_+>
    s2 <7 _+>
    <6- 5>4 <_-> <7 3> <7 _+>
    <_->2 <7 _+>4 <_->
    <6 5>4 <_+> s2
    s1
    s
    s2 <_+>
    s <6 5>
    s4 <5 4>8 <3+> s2
    s1*2
    <_+>1
    <_+>
    <_+>4 <5+ 4>8 <3+> s4. <3+>8
    <7!>4 <3+> <_+> <7!>
    s4 <7-> s <7 _+>
    <5 4> s8 <3> <6 5>4 <_+>
    s1*2
    <_+>1
    <_+>2 s4 <_+>




}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 55
    s1*69
    \bar "|."

}

XobI = {
    %\notypeset
    <<\XobIn \forma>>

}

XobII = {
    <<\XobIIn \forma>>

}

XvlI = {
    <<\XvlIn \forma>>

}

XvlII = {
    <<\XvlIIn \forma>>

}

XvlaI = {
    \clef alto
    <<\XvlaIn \forma>>

}

XsopranoI = {
    \new Voice = "gloria1"
    <<\XsopranoIn \forma>>
}

XaltoI = {
    \new Voice = "gloria2"
    <<\XaltoIn \forma>>
}

XtenoreI = {
    \new Voice = "gloria3"
    <<\XtenoreIn \forma>>
}

XbassoI = {
    \clef bass
    \new Voice = "gloria4"
    <<\XbassoIn \forma>>
}



XbcI = {
    \clef bass
    <<\XbcIn \forma \XbfIn>>
    \typeset
}

XvlIII = {
    <<\XvlIIIn \forma>>

}

XvlIV = {
    <<\XvlIVn \forma>>

}

XvlaII = {
    \clef alto
    <<\XvlaIIn \forma>>

}

XsopranoII= {
    \new Voice = "gloria5"
    <<\XsopranoIIn \forma>>
}

XaltoII= {
    \new Voice = "gloria6"
    <<\XaltoIIn \forma>>
}

XtenoreII = {
    \new Voice = "gloria7"
    <<\XtenoreIIn \forma>>
}

XbassoII = {
    \clef bass
    \new Voice = "gloria8"
    <<\XbassoIIn \forma>>
}



XbcII = {
    \clef bass
    <<\XbcIIn \forma \XbfIIn>>
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
    \con

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
        title = \markup "Beatus vir in due Cori [RV 597]"
        composer = \markup {"A. Vivaldi (1678-1741)"}
    }

    \markup \huge {[1.] Beatus vir - All[egr]o}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "P.mo Coro"} "Hautbois  [I]"}
                    \set Staff.shortInstrumentName = "hb1"
                    \IobI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \right-column{"Hautbois  [II]"}
                    \set Staff.shortInstrumentName = "hb2"
                    \IobII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"Pmo Viol[in]o"}
                    \set Staff.shortInstrumentName = "vl1"
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"2do Viol[in]o"}
                    \set Staff.shortInstrumentName = "vl2"
                    \IvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola 1]"}
                    \set Staff.shortInstrumentName = "vla1"
                    \IvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 r1^\markup\center-align "[Canto 1]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \IsopranoI \global
                    \new Lyrics \lyricsto "beatus1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r1^\markup\center-align "[Alto 1]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt1"
                    \IaltoI \global
                    \new Lyrics \lyricsto "beatus2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r1^\markup\center-align"[Tenore 1]"}
                    \clef  "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten1"
                    \ItenoreI \global
                    \new Lyrics \lyricsto "beatus3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso 1]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \IbassoI \global
                    \new Lyrics \lyricsto "beatus4" \ItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo 1""[Basso continuo 1]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc1"
                    \IbcI \global
                >>
             >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "2.do Coro"} "[Violino 3]"}
                    \set Staff.shortInstrumentName = "vl3"
                    \IvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"[Violino 4]"}
                    \set Staff.shortInstrumentName = "vl4"
                    \IvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola 2]"}
                    \set Staff.shortInstrumentName = "vla2"
                    \IvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 r1^\markup\center-align "[Canto 2]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \IsopranoII \global
                    \new Lyrics \lyricsto "beatus5" \ItestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r1^\markup\center-align "[Alto 2]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt2"
                    \IaltoII \global
                    \new Lyrics \lyricsto "beatus6" \ItestoVI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r1^\markup\center-align"[Tenore 2]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten2"
                    \ItenoreII \global
                    \new Lyrics \lyricsto "beatus7" \ItestoVII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso 2]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \IbassoII \global
                    \new Lyrics \lyricsto "beatus8" \ItestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo 2" "[Basso continuo 2]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \IbcII \global
                >>
            >>
        >>

        \layout {

            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[2.] Potens in terra - All[egr]o non molto}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "P.mo Coro"} "Violini 1"}
                    \set Staff.shortInstrumentName = "vl1"
                    \IIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"Violette 1"}
                    \set Staff.shortInstrumentName = "vla1"
                    \IIvlaI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso 1]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \IIbassoI \global
                    \new Lyrics \lyricsto "potens4" \IItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo 1""[Basso continuo 1]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc1"
                    \IIbcI \global
                >>
             >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "2.do Coro"} "Violini 2"}
                    \set Staff.shortInstrumentName = "vl2"
                    \IIvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"Violette 2"}
                    \set Staff.shortInstrumentName = "vla2"
                    \IIvlaII\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso 2]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \IIbassoII \global
                    \new Lyrics \lyricsto "potens8" \IItestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo 2" "[Basso continuo 2]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \IIbcII \global
                >>
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #9
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[3.] Antifona Beatus vir - All[egr]o}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "Cori unisoni"} "Hautbois"}
                    \set Staff.shortInstrumentName = "hb"
                    \IIIobI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"Violini"}
                    \set Staff.shortInstrumentName = "vl"
                    \IIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"Viol[ett]e"}
                    \set Staff.shortInstrumentName = "vla1"
                    \IIIvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 mi''1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop"
                    \IIIsopranoI \global
                    \new Lyrics \lyricsto "vir1" \IIItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 sol'1^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt"
                    \IIIaltoI \global
                    \new Lyrics \lyricsto "vir2" \IIItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 do1^\markup\center-align"[Tenore]"}
                    \clef  "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten"
                    \IIItenoreI \global
                    \new Lyrics \lyricsto "vir3" \IIItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas"
                    \IIIbassoI \global
                    \new Lyrics \lyricsto "vir4" \IIItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo""[Basso continuo]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc"
                    \IIIbcI \global
                >>
             >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #9
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[4.] Gloria et divitiae - All[egr]o}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "P.mo Coro"} "Hautbois"\vspace #-0.1"Vio[lin]o 1"}
                    \set Staff.shortInstrumentName = "hb-vl1"
                    \IVvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{ "Vio[lin]o 2"}
                    \set Staff.shortInstrumentName = "vl2"
                    \IVvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola 1]"}
                    \set Staff.shortInstrumentName = "vla1"
                    \IVvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key la\minor \time 2/4 \numericTimeSignature r2^\markup\center-align "[Canto 1]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \IVsopranoI \global
                    \new Lyrics \lyricsto "gloria1" \IVtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo 1""[Basso continuo 1]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc1"
                    \IVbcI \global
                >>
             >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "2.do Coro"} "Viol[in]o 3"}
                    \set Staff.shortInstrumentName = "vl3"
                    \IVvlIII\global
                >>

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"[Viol[in]o 4]"}
                    \set Staff.shortInstrumentName = "vl4"
                    \IVvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola 2]"}
                    \set Staff.shortInstrumentName = "vla2"
                    \IVvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key la\minor \time 2/4 \numericTimeSignature r2^\markup\center-align "[Canto 2]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \IVsopranoII \global
                    \new Lyrics \lyricsto "gloria5" \IVtestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo 2" "[Basso continuo 2]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \IVbcII \global
                >>
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[5.] Exortum est in tenebris - And[ant]e molto}

    \score {

        <<

            \new ChoirStaff <<

                 \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "P.mo Coro"} "Hautbois"\vspace #-0.1"Vio[lin]o 1"}
                    \set Staff.shortInstrumentName = "hb-vl1"
                    \VvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"2do Viol[in]o"}
                    \set Staff.shortInstrumentName = "vl2"
                    \VvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola 1]"}
                    \set Staff.shortInstrumentName = "vla1"
                    \VvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key fa\major \time 4/4 r1^\markup\center-align "[Canto 1]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \VsopranoI \global
                    \new Lyrics \lyricsto "exortum1" \VtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef alto \key fa\major \time 4/4 r1^\markup\center-align "[Alto 1]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt1"
                    \ValtoI \global
                    \new Lyrics \lyricsto "exortum2" \VtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key fa\major \time 4/4 r1^\markup\center-align"[Tenore 1]"}
                    \clef  "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten1"
                    \VtenoreI \global
                    \new Lyrics \lyricsto "exortum3" \VtestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso 1]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \VbassoI \global
                    \new Lyrics \lyricsto "exortum4" \VtestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo 1""[Basso continuo 1]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc1"
                    \VbcI \global
                >>
             >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "2.do Coro"} "[Violino 3]"}
                    \set Staff.shortInstrumentName = "vl3"
                    \VvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"[Violino 4]"}
                    \set Staff.shortInstrumentName = "vl4"
                    \VvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola 2]"}
                    \set Staff.shortInstrumentName = "vla2"
                    \VvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key fa\major \time 4/4 r1^\markup\center-align "[Canto 2]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \VsopranoII \global
                    \new Lyrics \lyricsto "exortum5" \VtestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef alto \key fa\major \time 4/4 r1^\markup\center-align "[Alto 2]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt2"
                    \ValtoII \global
                    \new Lyrics \lyricsto "exortum6" \VtestoVI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key fa\major \time 4/4 r1^\markup\center-align"[Tenore 2]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten2"
                    \VtenoreII \global
                    \new Lyrics \lyricsto "exortum7" \VtestoVII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso 2]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \VbassoII \global
                    \new Lyrics \lyricsto "exortum8" \VtestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo 2" "[Basso continuo 2]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \VbcII \global
                >>
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #5

    }

    \markup \huge {[6.] Jucundus homo - All[egr]o}

    \score {

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key la\minor \time 4/4 r1^\markup\center-align "[Canto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop"
                    \VIsopranoI \global
                    \new Lyrics \lyricsto "jucundus" \VItestoI
                >>

                \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"church organ"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Organi"}
                \set PianoStaff.shortInstrumentName = "org"
                \VImd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \VIms
            >>
        >>
    >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #3
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #3

    }

    \markup \huge {[7.] In memoria aeterna - And[ant]e molto}

    \score {

        <<

            \new ChoirStaff <<

                 \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\larger "P.mo Coro Solo"} "Violino 1"}
                    \set Staff.shortInstrumentName = "vl1"
                    \VIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"2do Violino"}
                    \set Staff.shortInstrumentName = "vl2"
                    \VIIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola]"}
                    \set Staff.shortInstrumentName = "vla1"
                    \VIIvlaI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef alto \key sib\major \time 3/4\numericTimeSignature  r2.^\markup\center-align "[Alto]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt"
                    \VIIaltoI \global
                    \new Lyrics \lyricsto "memoria2" \VIItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key sib\major \time 3/4 \numericTimeSignature r2.^\markup\center-align"[Tenore]"}
                    \clef  "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten"
                    \VIItenoreI \global
                    \new Lyrics \lyricsto "memoria3" \VIItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas"
                    \VIIbassoI \global
                    \new Lyrics \lyricsto "memoria4" \VIItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organi""Bassi"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc"
                    \VIIbcI \global
                >>
             >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 1.5\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #0
                \override StaffGrouper.staff-staff-spacing.basic-distance = #0
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[8.] Paratum cor eius - All[egr]o}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "P.mo Coro"} "Hautbois  [I]"}
                    \set Staff.shortInstrumentName = "hb1"
                    \VIIIobI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \right-column{"Hautbois  [II]"}
                    \set Staff.shortInstrumentName = "hb2"
                    \VIIIobII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"Pmo Viol[in]o"}
                    \set Staff.shortInstrumentName = "vl1"
                    \VIIIvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"2do Viol[in]o"}
                    \set Staff.shortInstrumentName = "vl2"
                    \VIIIvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola 1]"}
                    \set Staff.shortInstrumentName = "vla1"
                    \VIIIvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key do\major \time 3/8 r1^\markup\center-align "[Canto 1]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \VIIIsopranoI \global
                    \new Lyrics \lyricsto "paratum1" \VIIItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef alto \key do\major \time 3/8 r1^\markup\center-align "[Alto 1]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt1"
                    \VIIIaltoI \global
                    \new Lyrics \lyricsto "paratum2" \VIIItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key do\major \time 3/8 r1^\markup\center-align"[Tenore 1]"}
                    \clef  "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten1"
                    \VIIItenoreI \global
                    \new Lyrics \lyricsto "paratum3" \VIIItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso 1]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \VIIIbassoI \global
                    \new Lyrics \lyricsto "paratum4" \VIIItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo 1""[Basso continuo 1]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc1"
                    \VIIIbcI \global
                >>
             >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "2.do Coro"} "[Violino 3]"}
                    \set Staff.shortInstrumentName = "vl3"
                    \VIIIvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"[Violino 4]"}
                    \set Staff.shortInstrumentName = "vl4"
                    \VIIIvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola 2]"}
                    \set Staff.shortInstrumentName = "vla2"
                    \VIIIvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key do\major \time 3/8 r1^\markup\center-align "[Canto 2]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \VIIIsopranoII \global
                    \new Lyrics \lyricsto "paratum5" \VIIItestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef alto \key do\major \time 3/8 r1^\markup\center-align "[Alto 2]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt2"
                    \VIIIaltoII \global
                    \new Lyrics \lyricsto "paratum6" \VIIItestoVI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key do\major \time 3/8 r1^\markup\center-align"[Tenore 2]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten2"
                    \VIIItenoreII \global
                    \new Lyrics \lyricsto "paratum7" \VIIItestoVII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso 2]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \VIIIbassoII \global
                    \new Lyrics \lyricsto "paratum8" \VIIItestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organo 2" "[Basso continuo 2]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \VIIIbcII \global
                >>
            >>
        >>

        \layout {

            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

        systems-per-page = #4

    }

    \markup \huge {[9.] Peccator videbit - Largo e spiccato }

    \score {

            \new ChoirStaff <<

                 \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "P.mo Coro"} "Violino 1"}
                    \set Staff.shortInstrumentName = "vl1"
                    \IXvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"2do Violino"}
                    \set Staff.shortInstrumentName = "vl2"
                    \IXvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola]"}
                    \set Staff.shortInstrumentName = "vla1"
                    \IXvlaI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key sib\major \time 2/4 \numericTimeSignature r8^\markup\center-align"[Tenore]" r2}
                    \clef  "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten"
                    \IXtenoreI \global
                    \new Lyrics \lyricsto "peccator3" \IXtestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"Organi""[Bassi]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc"
                    \IXbcI \global
                >>
             >>

        \layout {

            #(layout-set-staff-size 16)
            indent = 1.5\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

    \markup \huge {[10.] Gloria Patri - [Allegro]}

    \score {

        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "P.mo Coro"} "[Hautbois  I]"}
                    \set Staff.shortInstrumentName = "hb1"
                    \XobI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"oboe"
                    \set Staff.instrumentName = \markup \right-column{"[Hautbois  II]"}
                    \set Staff.shortInstrumentName = "hb2"
                    \XobII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"Pmo Viol[in]o"}
                    \set Staff.shortInstrumentName = "vl1"
                    \XvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"2do Viol[in]o"}
                    \set Staff.shortInstrumentName = "vl2"
                    \XvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola 1]"}
                    \set Staff.shortInstrumentName = "vla1"
                    \XvlaI\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 r1^\markup\center-align "[Canto 1]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop1"
                    \XsopranoI \global
                    \new Lyrics \lyricsto "gloria1" \XtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r1^\markup\center-align "[Alto 1]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt1"
                    \XaltoI \global
                    \new Lyrics \lyricsto "gloria2" \XtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r1^\markup\center-align"[Tenore 1]"}
                    \clef  "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten1"
                    \XtenoreI \global
                    \new Lyrics \lyricsto "gloria3" \XtestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso 1]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas1"
                    \XbassoI \global
                    \new Lyrics \lyricsto "gloria4" \XtestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Organo 1""Basso continuo 1]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc1"
                    \XbcI \global
                >>
             >>

            \new ChoirStaff <<

                \new Staff  <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{{\bold\huge "2.do Coro"} "[Violino 3]"}
                    \set Staff.shortInstrumentName = "vl3"
                    \XvlIII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \right-column{"[Violino 4]"}
                    \set Staff.shortInstrumentName = "vl4"
                    \XvlIV\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \right-column{"[Viola 2]"}
                    \set Staff.shortInstrumentName = "vla2"
                    \XvlaII\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 r1^\markup\center-align "[Canto 2]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "sop2"
                    \XsopranoII \global
                    \new Lyrics \lyricsto "gloria5" \XtestoV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r1^\markup\center-align "[Alto 2]"}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "alt2"
                    \XaltoII \global
                    \new Lyrics \lyricsto "gloria6" \XtestoVI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r1^\markup\center-align"[Tenore 2]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "ten2"
                    \XtenoreII \global
                    \new Lyrics \lyricsto "gloria7" \XtestoVII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Basso 2]"}
                    \set Staff.midiInstrument = #"synth voice"
                    \set Staff.shortInstrumentName = "bas2"
                    \XbassoII \global
                    \new Lyrics \lyricsto "gloria8" \XtestoVIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \right-column{"[Organo 2" "Basso continuo 2]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \set Staff.shortInstrumentName = "bc2"
                    \XbcII \global
                >>
            >>
        >>

        \layout {

            indent = 1.3\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
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

