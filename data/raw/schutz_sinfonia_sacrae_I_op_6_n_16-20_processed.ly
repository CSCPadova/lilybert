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



IfgIn = \relative do' {

    R1*4
    re4 re re re
    si do8 re mib4 do

    %7
    re sib8 do re do sib la
    sol4 la8 sib\mbreak do sib la sol
    fad4 sol2 fad4

    %10
    sol8 la sib do re4 sib
    la2 re,
    R1

    %13
    la'4 la la la
    fa sol8 la sib4 sol\mbreak
    la fa8 sol la sol fa mi

    %16
    re4 re' re re
    dod re8 mi fa4 re
    mi re8 mi fa mi re do?

    %19
    sib4 do8 re\mbreak mib re do sib
    la4 fa8 sol la sol la sib
    do4 fa,8 sol la sol la sib

    %22
    do4 re do2
    sib r
    fa'4 fa fa fa\mbreak

    %25
    re mi8 fa sol4 mib
    fa re8 mi ?fa mi re do
    sib2 r

    %28
    r4 do8 re mib re do sib
    la2 r4 re\mbreak
    sol,4. fad8 sol la sib sol

    %31
    la sib do sib la2
    sol1\fermopz
    R1*45

    %78
    R1*3
    re4. mi8\mbreak fa sol la sib
    dod4 re2 dod4

    %83
    re2 r8 re do sib
    la fa la sib do2
    sol r8 sib la sol

    %86
    fa re fa sol la4. sol16 fa\mbreak
    mi8 do  mi fa sol4. fa16 mi
    re4 do re2

    %89
    do8 do' sib la sol mib sol la
    sib2~ sib8 sib la sol
    la4 do la2

    %92
    sol1\mbreak
    R1*23
    re'2\tu sib4 sib

    %117
    do2 sib4 la
    do2 do4 do
    re2 do4 sib

    %120
    re2 re4 re
    mi2 re\mbreak
    do sib

    %123
    do r4 re
    re re8 re do4 do8 do
    sib do re2 dod4

    %126
    re2 sib
    sol1~
    sol2 re'\mbreak

    %129
    re4 sib2 la8 sol
    fa2. sol4
    la sib2 la4

    %132
    sib\longa

}

IfgIIn = \relative do' {

    sol4 sol sol sol
    fad sol8 la sib4 sol
    la4 fa?8 sol la sol fa mi

    %4
    re4 mi8 fa sol4 mi
    fa2~ fa8 re mi fa\mbreak
    sol2~ sol8 fad sol la

    %7
    sib2~ sib8 sol la sib
    do2~ do8 la sib do
    re4 sib la2

    %10
    sol1
    re4 re re re
    dod4 re8 mi fa4 re

    %13
    fa2\mbreak mi
    re r
    la'4 la la la

    %16
    fa sol8 la sib4 sol
    la sib8 do re4 si
    dod si8 dod re do? sib? la

    %19
    sol4 la8 sib\mbreak do sib la sol
    fa2 r4 fa8 sol
    la sol la sib do4 fa,8 sol

    %22
    la4 sib2 la4
    re4. do8 sib2~
    sib4 la8 sol la2

    %25
    sib4. la8 sol4 do\mbreak
    fa,1
    r4 sib8 do re do sib la

    %28
    sol4 la8 sib do sib la sol
    fad2 sol4 fa?
    mib re8 do re4. mi?8

    %31
    fad4 sol2 fad4
    sol1\fermopz\mbreak
    R1*45

    %78
    sol,4. la8 sib do re mi
    fa4. sol8 la4. sol16 fa
    mi4 fa mi2\mbreak

    %81
    fa4 la8 sol fa mi re4
    mi sol mi2
    re8 sol fa mi re la re mi

    %84
    fa2 r8 la sol fa
    mi do mi fa sol2
    re r8 fa mi re\mbreak

    %87
    do8 la do re mi4. re16 do
    si4 do2 si4
    do2 r

    %90
    r8 sol' fa mi re sib re mi
    fad?8 re sol2 fad!4
    sol1\mbreak

    %93
    R1*23
    sib2 mib,4 sol
    fa2 fa

    %118
    r4 do' fa, la
    sol2 sol
    r4 re' sol, sib\mbreak

    %121
    la2. sol4~
    sol do, sol'2
    do, r4 sib'

    %124
    sib sib8 sib fa4 fa8 fa
    re2 la'
    la sol~

    %127
    sol sib
    mib, re\mbreak
    re fa

    %130
    re2. mi?4
    fa1
    fa\longa

}

IfgIIIn = \relative do {

   R1*2
   re4 re re re
   si do8 re mib4 do

   %5
   re4 sib8 do re do sib la
   sol2 do
   sol'2. fa4

   %8
   mib1
   re\mbreak
   sol,4 sol sol sol

   %11
   fad sol8 la sib4 sol
   la fa?8 sol la sol fa mi
   re mi fa sol la sib do la

   %14
   sib2 sol
   re'2. do4\mbreak
   sib2~ sib

   %17
   la re,
   R1*4
   fa'4 fa fa fa

   %23
   re mi8 fa sol4 mib
   fa re8 mi? fa mi re do
   sib4 do8 re mib4 do

   %26
   re sib8 do\mbreak re do sib la
   sol4 sol'8 la sib la sol fa
   mib4. re8 do2

   %29
   re4. do8 si2
   do4 sib?8 la sol4 fa8 mi
   re4 do re2

   %32
   sol1\fermopz\mbreak
   R1*45
   R1

   %79
   re4. mi8 fa sol la si
   dod4 re2 dod4
   re2. do?8 sib

   %82
   la4 sol la2
   re,1
   r8 re' do sib la fa la sib

   %85
   do2 sol
   r8 sib la sol fa re fa sol
   la4. sol16 fa mi8 do mi fa

   %88
   sol4 la\mbreak fa sol
   do,2~do8 do' sib la
   sol2~sol8 sol fa mi

   %91
   re4 do re2
   sol1
   R1*23\mbreak

   %116
   R1
   r4 fa' sib, re
   do2 r

   %119
   r4 sol' do, mib
   re2 r
   r4 la re sol,

   %122
   do la sol2
   fa sib
   sib\mbreak la

   %125
   sol la
   re mib~
   mib re

   %128
   do re
   sol, la
   sib2. la8 sol

   %131
   fa1
   sib\longa

}

Isopranon = \relative do'' {

    \autoBeamOff
    R1*32
    R1*8
    r2 r4 re8 do

    %42
    sib4 do\mbreak la2
    sol4 r r do8 sib
    la la fa' mi re4 mib

    %45
    do2 sib\mbreak
    r2 r4 la8 sol
    fad fad sol la sib4 sol

    %48
    fad sol2 fad4
    sol1
    r4 sol re4. dod8

    %51
    re4 re mib2\mbreak
    re2 r4 re
    mi mi8 mi sol2~

    %54
    sol4 fa8 mi mi2
    mi r4 fa
    sol1

    %57
    la~
    la
    R

    %60
    r2 r4 la
    sib sib8 sib\mbreak re2~
    re4 sib8 la sol2

    %63
    sol1
    r2 r4 fa
    sol1

    %66
    la
    r4 do8 sib la4 la
    sib2 la

    %69
    r4 sol8 la sib4 sol\mbreak
    r4 la8 sib do4 la
    si do2 si4

    %72
    do do8 re mib4 do
    r re8 mi? fa4 re
    dod re2 dod4\mbreak

    %75
    re2 r4 sib8 do
    re4 do16 [sib la sol] sol4 fad
    sol1

    %78
    R1*15
    R1*3
    re4. mi8 fa[sol la sib]

    %97
    dod4 re2 dod4
    re8 re do? sib la fa la sib
    do2 la

    %100
    r8 re do sib la fa r4\mbreak
    r8 do' sib la sol mib r4
    r8 sib' la fa re re fa sol

    %103
    la4 sib2 la4
    sib2 r4 sib
    la la\mbreak r sol8 fad

    %106
    sol4 sol r sol16 [mi fad sol]
    la[sol la si] do2 si4
    r do do do8 do

    %109
    do4. re16 do \mbreak si2
    la r
    R1

    %112
    r4 sib sib sib8 sib
    sib2. do8 sib
    la1

    %115
    sol
    r4 fa16[re mi fa]\mbreak sol[fa sol la] sib4~
    sib la r2

    %118
    r4 sol16[mi fa sol] la[sol la si] do4~
    do si r2
    r4 la16[fad sol la] sib?[la sib do] re4~

    %121
    re dod\mbreak re16[do si la] si[sol la si]
    do[sib? la sol] la[fa sol la] sib2~
    sib4 la r2

    %124
    R1*2
    r4 sib sib sib8 sib\mbreak
    sib2. do8 sib

    %128
    la1
    sol4 re' re re8 re
    re2. do8 do

    %131
    do1
    sib\longa

}

ItestoI = \lyricmode {

    nec re -- spondit  _ mi -- hi, nec re -- spondit, _ nec re -- spondit _ mi -- hi,

    nec re -- spondit,  _ nec re -- spondit  _ mi - - hi,

    in lec -- tulo _ per no  -- ctes quem di -- ligit _ a -- nima _ me -- a quae -- si -- vi,

    quem di -- ligit _ a -- nima _ me -- a quae -- si -- vi,

    nec re -- spondit  _ mi -- hi,

    nec re -- spondit,  _ nec re -- spondit  _ mi - - hi, nec re -- spondit,  _ nec re -- spondit  _ mi - - hi,

    nec re -- spondit  _ mi - hi.

    Sur - - - - - gam et circu - ibo _ civi - ta -- tem, et circu - ibo, _ et circu - ibo, _ et circu - ibo, _

    civi - ta - - tem, per vi -- cos et pla -- te -- as quae - - ram quem di -- ligit _ a -- nima _ me -- a,

    quem di -- ligit _ a -- nima _ me -- a, quae - - ram, quae - - ram, quae - - ram, quae - - - - ram

    quem di -- ligit _ a -- nima _ me -- a, quem di -- ligit _ a -- nima _ me -- a.

}

Ialton = \relative do' {

    \autoBeamOff
    R1*32
    r4 re  sol,4. fad8
    sol4 sol\mbreak sib2

    %35
    sol2 r4 sol
    la la8 la do2~
    do4 sib8 la la2

    %38
    la2 r4 sib\mbreak
    do1
    re2 r4 re8 do

    %41
    sib4 do la2
    sol r4 re'8 do
    sib sib fa' mi re4 mib

    %44
    do2 sib\mbreak
    r4 fa'8 mi? re re do re
    mib re re2 do4

    %47
    re2 r4 sib8 do
    re4 sib la2
    sol1

    %50
    R1*6
    r2 r4 re'
    dod4. si8 dod4 mi

    %58
    fa2 re4 re
    mi mi8 mi sol2~
    sol4 fad8 mi fad2

    %61
    sol1
    r2 r4 sib,\mbreak
    do1

    %64
    re2 r4 re
    mi fa2 mi4
    fa2 r4 do8 re

    %67
    mi4 sol fad2
    sol r4 re8 do
    sib4 sib\mbreak r mib8 re

    %70
    do4 do r fa8 mi?
    re4 mib re2
    do r4 mib8 fa

    %73
    sol4 sol r fa8 sol
    la4 fa\mbreak mi2
    re4 sib8 do re4 do16[sib la sol]

    %76
    fad4 sol2 fad4
    sol1
    R1*15\mbreak

    %93
    sol4. la8 sib[do re mi]
    fad4 sol2 fad4
    sol8 sol fa mi re sib re mi

    %96
    fa2 re
    R1
    fa,4. sol8\mbreak la[sib do re]

    %99
    mi[fad] sol2 fad4
    sol2 r8 la sol fa?
    mi do r4 r8 sol' fa mib

    %102
    re sib r4\mbreak r8 fa' mib re
    do la do re mib2
    re1

    %105
    r4 fa mi? mi
    r mi8 re mi4 mi
    r4 do16[la si do]\mbreak re[do re mi] fa4~

    %108
    fa mi r2
    R1
    r4 fa fa fa8 fa

    %111
    fa4. sol16 fa mi2
    re r4 sol
    sol sol8 sol sol2~

    %114
    sol4 fad8 mi\mbreak fad2
    sol1
    R

    %117
    r4 do,16[la sib do] re[do re mi] fa4~
    fa mi r2
    r4 re16[si do re] mi[re mi fad] sol4~
    sol fad\mbreak r2

    %121
    r4 la16[sol fad mi] fad[re mi fad] sol[fa? mi re]
    mi[do re mi] fa2 mi4
    r2 r4 fa\mbreak

    %124
    fa fa8 fa fa2~
    fa4 sol8 fa mi2
    re r4 sol

    %127
    sol sol8 sol sol2~
    sol4 fad8 mi fad2\mbreak
    sol r4 fa?

    %130
    fa fa8 fa fa2~
    fa4 mib8 re do2
    re\longa

}


ItestoII = \lyricmode {


    In lec -- tulo _ per no  -- ctes quem di -- ligit _ a -- nima _ me -- a quae -- si -- vi,

    nec re -- spondit  _ mi -- hi, nec re -- spondit, _ nec re -- spondit _ mi -- hi,

    nec re -- spondit,  _ nec re -- spondit  _ mi - hi,

    nec re -- spondit  _ mi -- hi, in lec -- tulo _ per no -- ctes quem di -- ligit _ a -- nima _ me -- a quae -- si -- vi,

    quae -- si - - vi,

    nec re -- spondit  _ mi -- hi, nec re -- spondit,  _ nec re -- spondit,  _ nec re -- spondit  _ mi -- hi,

    nec re -- spondit,  _ nec re -- spondit,  _ mi -- hi,  nec re -- spondit  _ mi - - hi.

    Sur - - - - - gam et circu - ibo _ civi - ta -- tem, sur - - - - - gam et circu - ibo, _ et circu - ibo, _ et circu - ibo, _

    civi - ta -- tem, per vi -- cos et pla -- te -- as quae - - ram quem di -- ligit _ a -- nima _ me -- a,

    quem di -- ligit _ a -- nima _ me -- a, quae - - ram, quae - - ram, quae - - - - ram,

    quem di -- ligit _ a -- nima _ me -- a, quem di -- ligit _ a -- nima _ me -- a, quem di -- ligit _ a -- nima _ me -- a.

}

Ibcn = \relative do {

   sol'4 sol sol sol
   fad sol8 la sib4 sol
   re re re re

   %4
   si do8 re mib4 do
   re4 sib8 do re do sib la
   sol2 do

   %7
   sol'2. fa4
   mib1
   re\mbreak

   %10
   sol,4 sol sol sol
   fad sol8 la sib4 sol
   la sol8 fa re2~

   %13
   re\mbreak la'
   sib sol
   re'2. do4

   %16
   sib2~sib
   la re,
   la'' re,

   %19
   mib do
   fa1~
   fa2 fa

   %22
   fa4 sib, fa' fa\mbreak
   re mi8 fa sol4 mib
   fa re8 mi? fa mi re do

   %25
   sib4 do8 re mib4 do
   re sib8 do\mbreak re do sib la
   sol1

   %28
   mib'2 do
   re4. do8 si2
   do4 sib8 la sol4 fa8 mi

   %31
   re4 do re2
   sol1\fermata
   sol^\markup\italic"a 2."~

   %34
   sol2 sol~
   sol sol'
   fad1

   %37
   fad2 fad~
   fad sol
   mib1

   %40
   re2. re4
   sol do, re2
   sol4 do, re2

   %43
   sol4 la sib mib,\mbreak
   fa2 sib,4 mib
   fa2 sib,

   %46
   do4 re mib2
   re sib
   do re

   %49
   sol,1
   sol~
   sol2 do~

   %52
   do si\mbreak
   dod1
   dod2 dod~

   %55
   dod re
   sib1
   la2. dod4

   %58
   re2 re~
   re dod
   re1

   %61
   sol,
   mib'
   mib

   %64
   re4. mi?8 fa4 re\mbreak
   do sib do2
   fa, fa'

   %67
   do re
   sol fad
   sol mib

   %70
   fa1
   sol
   do,2 do

   %73
   sib1
   la
   re4 sol fa mib\mbreak

   %76
   re sol, re'2
   sol,1
   sol4. la8 sib do re mi

   %79
   re,4. mi8 fa sol la sib
   dod4 re2 dod4
   re2. do?8 sib\mbreak

   %82
   la4 sol la2
   re,1
   re'4 do8 sib la fa la sib

   %85
   do2 sol
   sib4 la8 sol fa re fa sol
   la4. sol16 fa\mbreak mi8 do mi fa

   %88
   sol4 la fa sol
   do,2~do8 do' sib la
   sol2~sol8 sol fa mi

   %91
   re4 do re2
   sol1\mbreak
   sol'2. fa8 mi

   %94
   re4 do re2
   sol,1
   re'2. do8 sib

   %97
   la4 sol la2
   re fa
   do re

   %100
   sol, fa
   do' mib
   sib re\mbreak

   %103
   fa4 re do2
   sib sib
   fa' do

   %106
   do do
   fa re
   do la

   %109
   re mi
   la, sib
   sol la

   %112
   re4~re sol2
   mib re\mbreak
   do2 re

   %115
   sol,1
   sib'2 mib,4 sol
   fa2 sib,4 re

   %118
   do do' fa, la
   sol2 do,4 mib
   re re' sol, sib

   %122
   la la, re sol,\mbreak
   do la sol2
   fa sib

   %125
   sib la
   sol la
   re4~re mib2

   %128
   mib re
   do re
   sol, la

   %131
   sib2. la8 sol
   fa1 sib\longa

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6>
    s
    <6>
    s <_+>2 <_->
    s1
    <6>
    <[3+]>4 <4>2 <[3+]>4
    s1
    <6>
    <_+>4 <6> s2
    s1*2
    s2. <6>4
    s2 <6>
    <_+>1
    <_+>
    s2 <_->
    s1*3
    <6>1
    s1*4
    s2 <_->
    <_+>2 <6>
    <_-> s
    <_+>4 <_-> <[4]>4 <_+>
    s1*7
    <6>1
    <_+>
    s4 <_-> <_+>2
    s4 <_-> <_+>2
    s4 <6>8 <5> s2
    s1*2
    s4 <6> <7> <6>
    <_+>1
    <_->2 <_+>
    s1
    <_+>
    s2 <_->
    <2>1
    s1*3
    <6>1
    <_+>2. <6>4
    s1
    <2>
    <4>2 <[3+]>
    s1*2
    <6>1
    s
    s4 <6> s2
    s1
    s2 <_+>
    s <6>
    s1*2
    <[3+]>4 <4>2 <[3+]>4
    s2 <_->
    <6>2 <5>
    <[3+]>4 <4>2 <[3+]>4
    <_+>1
    <_+>2 <4>4 <[3+]>
    s1*5
    <_+>2 <4>4 <[3+]>
    s1*5
    <_+>2 s4 <_+>
    s1*2
    <_+>2 <4>4 <[3+]>
    s1
    s
    <_+>4 <_-> <4> <[3+]>
    s1*2
    <_+>2 <4>4 <[3+]>
    <_->1
    s2 <4>4 <[3+]>
    s1*3
    s4 <6> <_->2
    s1*3
    s2 <7>4 <[6+]>
    <4> <3> s2
    s <_+>
    s1
    s2 <_+>
    <_+>4 <6> s2
    s <6>
    s <_+>
    s1*2
    <4>4 <3> s2 <4>1
    <4>4 <[3+]> s2
    <4>4 <_+> s2
    <[4]>4 <_+> <_+> <_+>
    s <6> <7> <6>
    <4> <3> s2
    s <6>
    s <4>4 <[3+]>
    <_+> <6> s2
    s <6>
    <_-> <_+>
    s <6>
    s1
    <[3]>4 <4>2 <3>4

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 75
    \once\override Score.RehearsalMark.extra-offset = #'(6 . +1.0)
    \mark\markup\italic "Sinfonia"
    s1*77\break
    \once\override Score.RehearsalMark.extra-offset = #'(6 . 0.0)
    \mark\markup\italic "Sinfonia"
    s1*54
    s\longa
    \bar "|."

}

IfgI = {
    \notypeset
    \clef tenor
    <<\IfgIn \forma>>

}

IfgII = {
    <<\IfgIIn \forma>>

}

IfgIII = {
    \clef bass
    <<\IfgIIIn \forma>>

}

Isoprano = {
    \new Voice = "lectulo1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "lectulo2"
    <<\Ialton \forma>>
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



IIfgIn = \relative do' {

    r2 re4 re
    re re8 re re do la sib
    do4 re do fa,

    %4
    do' la sib do
    re sib la r8 re\mbreak
    la4 re, la'2

    %7
    re8 sib sol re sol fa sol la
    sib4 sol sib sib
    la r8 la16 sib do4 do

    %10
    sib8 la sib do re4. re8\mbreak
    do sib do la sib4 sib
    la2 r4 la

    %13
    sol8 fa sol la sib4. sib8
    la sol la sib do4. do8
    sib8 la sib do re4. re8\mbreak

    %16
    do sib do re mib4. mib8
    re do re mi? fa4. fa8
    mi8 re mi fa sol2~

    %19
    sol4 fa mi2
    re1
    re8 la fad re sib' do16 re do8 sib

    %22
    la4 sib la2
    sol1\mbreak
    R1*30

    %54

    \footnote #' (+1 . 2) \markup\column\smaller {"Nell'edizione antica 3/1""  "}r2 r la
    sol la sol
    sol sol sol

    %57
    la sib la
    la la la\mbreak
    si do4 do si2

    %60
    la1 do2
    do2. do4 do2
    do2. do4 do2

    %63
    r r re
    re2. re4 re2
    mi2. mi4 mi2\mbreak

    %66
    r r la,
    sol2. sol4 sol2
    la1 sib2

    %69
    sib la1
    sib si2
    si?2. si4 si2

    %72
    do2. do4 do do
    dod2. dod4 dod2\mbreak
    do!2. do4 do do

    %75
    re2. re4 la2
    sib1 re2
    re dod1

    %78
    re do?2
    do2. do4 do2
    re2. re4 re re\mbreak

    %81
    re2. re4 re2
    mib2. mib4 mib mib
    mi!2. mi4 mi2

    %84
    fad2. fad4 fad2
    sol1 re2
    sol, re'1

    %87
    re1
    R1*2
    sib8 do16 re do8 sib la2

    %91
    R1
    r2 la8 sib16 do sib8 la
    sol2 r

    %94
    R1*3
    sib8 do16 re do8 sib la2
    R1*2

    %100
    sib8 do16 re do8 sib la2\mbreak
    R1*2
    mib'8 fa16 sol fa8 mib re2

    %104
    R1*2
    mib8 fa16 sol fa8 mib re2
    r mib8 fa16 sol fa8 mib

    %108
    re2 r
    \footnote #' (+1 . 2) \markup\column\smaller {"Nell'edizione antica 3/1""  "} r2 r la\mbreak
    sol la sol

    %111
    sol sol sol
    la sib la
    la la la

    %114
    si do4 do si2
    la1 do2
    do2 do4 do do do

    %117
    do1 do2
    r r re
    re re4 re re re

    %120
    mi1 mi2
    r r la,
    sol sol4 sol sol sol

    %123
    la2 la sib\mbreak
    sib la2. sol4
    sib1 si2

    %126
    si? si4 si si si
    do2 do do
    dod dod4 dod dod dod

    %129
    do!2 do do\mbreak
    re2 re4 la la la
    sib1 re2~

    %132
    re dod1
    re do?2
    do do4 do do do

    %135
    re1 sib2
    R1.
    r2 r mib\mbreak

    %138
    mi! mi4 mi mi mi
    fad2 fad4 fad fad fad
    sol1 re2

    %141
    sol, re'2. re4
    re1 r2
    R1.*3

    %146
    r2 r sib\mbreak
    la la4 la la la
    sib2 fa

    %149
    do' sol
    re'4 re, re'2~
    re4 do8 sib la2

    %152
    sol\longa

}

IIfgIIn = \relative do' {

    sib4 sib sib sib8 sib
    sib la fa sol la4 sib
    la fa la2

    %4
    sol4 do sib la8 sol
    fad4 sol fad mi
    fad2 fad

    %7
    R1\mbreak
    sol8 re sib sol re' do re mi
    fa4 fa mi r8 mi16 fa

    %10
    sol4 sol fa8 mi fa sol
    la4. la8 sol fad sol re
    fa?4 fa\mbreak mi r8 do16 sib

    %13
    mi8 re mi fa sol4. sol8
    fa mi fa sol la4. la8
    sol fa sol la sib4. sib8

    %16
    la sol la sib\mbreak do4. do8
    sib la sib do re4. re8
    dod si dod re mi!4 re

    %19
    dod re2 dod4\mbreak
    re8 la fad re sib' do16 re do8 sib
    la2 sol8 la16 sib la8 sol

    %22
    fad4 sol2 fad4
    sol1\mbreak
    sol8 do si la sol fa mib re

    %25
    do re mib do re2
    sol,1
    R

    %28
    la'8 re do sib la sol fa mi?
    re mi fa re mi2
    la,\mbreak r

    %31
    fa'8 sib la sol fa mi re do
    sib2 do
    fa, r

    %34
    R1
    r4 re' mi fad
    sol4. sol16 fa mi8 la16 sol fa8 sib16 la\mbreak

    %37
    sol2 la4 r8 la16 sol
    fa8 sib16 la sol8 do16 sib la4. fa8
    sol4 la sib r8 sib16 la

    %40
    sol8 do16 sib la8 re16 do\mbreak sib4. la8
    la4. sib16 do re2
    re4 r8 sol,16 fa mib8 fa16 mib re8 mib16 re

    %43
    do4 r r2
    R1*2
    r2 mib8 mib re do\mbreak

    %47
    sib la sib do re4 mi
    fa2 fa8 fa mib re
    do si do re mi4 fa

    %50
    sol2 sol8 sol fa mi
    re do re mi fa4 sol\mbreak
    la2 sol

    %53
    R1
    r2 r do,
    do do do

    %56
    sol' do, re
    re re re
    la' re, mi

    %59
    mi mi4 mi mi2\mbreak
    mi1 r2
    r r la

    %62
    la2. la4 la2
    la2. la4 la2
    R1.

    %65
    r2 r mi
    mi2. mi4 mi2
    mi1.

    %68
    fad1 sol2\mbreak
    re fa1
    sib, re2

    %71
    sol2. sol4 sol2
    sol2. sol4 sol sol
    la2. la4 la2

    %74
    la2. la4 la la
    la2. la4 re2\mbreak
    re1 sib2

    %77
    la la1
    la r2
    R1.

    %80
    r2 r re,
    sol2. sol4 sol sol
    sol1 mi2

    %83
    la2. la4 la la
    la1 la2
    sol1 sol2\mbreak

    %86
    mib la1
    sol1
    sib8 fa re sib r2

    %89
    sol'8 re sib sol r2
    sol'8 la16 sib la8 sol re2
    R1

    %92
    r2 fa8 sol16 la sol8 fa
    do2 r
    R1*3\mbreak

    %97
    sol'8 la16 sib la8 sol fad2
    R1*2
    sol8 la16 sib la8 sol fad2

    %101
    R1*2
    do'8 re16 mib re8 do si2
    R1*2

    %106
    do8 re16 mib re8 do si2\mbreak
    r2 do8 do,16 re mib8 fa
    sol2 r

    %109
    r2 r do,
    do do do
    sol' do, re

    %112
    re re re
    la' re, mi
    mi mi4 mi mi2

    %115
    mi1 r2\mbreak
    r r la
    la la4 la la la

    %118
    la1 la2
    R1.
    r2 r mi

    %121
    mi mi4 mi mi mi
    mi1 mi2
    fad1 sol2

    %124
    re fa?1
    sib, re2
    sol sol4 sol sol sol\mbreak

    %127
    sol2 sol sol
    la la4 la la la
    la2 la la

    %130
    la la4 re re re
    re1 sib2
    la la2. la4

    %133
    la1 r2
    R1.
    r2 r re

    %136
    re re4 re re re
    mib1 do2
    r r la

    %139
    la la4 la re re
    sib1 sib2
    mib, la2. la4

    %142
    sol1 la4 fa
    do2 fa, r
    do''2 sol re4 sol,

    %145
    r2 fa'4 re la2\mbreak
    re1 re2
    fa fa4 fa fa fa

    %148
    re4 mi fa re
    mi fa sol mi
    la4. sol8 la8. sol16 la8. sol16

    %151
    la8 re, re'2 re,4
    re\longa

}

IIfgIIIn = \relative do {  %%% da qui in poi

    sol'4 sol sol sol8 sol
    sol fa re mi fa4 sol
    fa sib, fa' re

    %4
    mi fa sol mib
    re r8 sol re4 sol,\mbreak
    re'2 re

    %7
    R1*5
    re8 la fa re la' sol la sib

    %13
    do4 do sib4 r8 sib16 do\mbreak
    re4 re do8 sib do re
    mib4. re16 do sib8 do re mi?

    %16
    fa4. mi16 re do8 re mib fa
    sol4. fa16 mi? re8 mi fa sol
    la4. la8 sol la sib sol

    %19
    la4 re, la'2
    re, sol8 re sib sol
    fad2 sol

    %22
    re'4 sol, re'2
    sol,1
    R1*2

    %26
    re'8 sol fa mi re do sib la
    sol la sib sol la2
    re,1

    %29
    R
    la'8 re do sib la sol fa mi
    re1\mbreak

    %32
    R
    r4 fa sol la
    sib4. sib16 la sol8 do16 sib la8 re16 do

    %35
    sib2 do4 re
    sol,2 r
    r r4 la

    %38
    sib do re4. re16 do
    sib8 mib16 re do8 fa16 mib re4 sib\mbreak
    do4 re mib do

    %41
    re1
    sol,2 r4 si
    do8 si16 do re8 do16 re mib8 re16 mib fa8 mib16 fa\mbreak

    %44
    sol1
    do,
    R

    %47
    r2 sib8 sib la sol
    fa mi fa sol la4 sib
    do2 do8 do sib la

    %50
    sol fa sol la sib4 do
    re2 re8 re do sib
    la sol la sib\mbreak do4 re

    %53
    mi fa sol2
    fa1 fa,2
    do' fa, r2

    %56
    r r sol
    re' sol, r
    r r la

    %59
    mi' la,4 la mi2
    la1.
    la'

    %62
    fa
    re
    sol

    %65
    mi
    la,\mbreak
    R1.*3

    %70
    r2 r sol
    sol1.
    do

    %73
    la
    fa'
    re

    %76
    sol1 sol2
    fad la1
    re, fa,2

    %79
    fa1.
    sib
    sol

    %82
    do\mbreak
    la
    re

    %85
    sol1 sib,2
    do re1
    sol,1

    %88
    r2 fa'8 do la fa
    r2 re'8 la fad re
    R1*2

    %92
    fa'8 do la fa r2
    R1*3\mbreak
    r2 re'8 la fad re

    %97
    R1*2
    r2 re'8 la fad re
    R1*2

    %102
    r2 sol'8 re si sol
    R1*2
    r2 sol'8 re si sol

    %106
    R1
    sol'8 re si sol r2\mbreak
    R1

    %109
    r2 r fa %%% allegro
    do' fa, r
    r r sol
    re' sol, r

    %113
    r r la
    mi' la,4 la mi2
    la1.

    %116
    la'\mbreak
    fa
    re

    %119
    sol
    mi
    la,

    %122
    R1.*3
    r2 r sol
    sol1.
    do

    %128
    la
    fa'
    re

    %131
    sol1 sol2\mbreak
    fad2 la1
    re, fa,2

    %134
    fa1.\mbreak
    sib
    sol

    %137
    do
    la
    re

    %140
    sol1 sib,2
    do re1
    sol, r2\mbreak

    %143
    r fa'4 do sol2
    do, r sol''4 re
    sol,2 re r

    %146
    r2 r sib'
    fa1 fa2
    sib1

    %149
    do
    re1~
    re2 re

    %152
    sol,\longa

}

IIsopranon = \relative do'' {

    \autoBeamOff
    R1*23
    sol2. sol4
    sol2 fad

    %26
    sol1
    R
    la2. la4

    %29
    la2 sold
    la1
    r4 la2 sib4\mbreak

    %32
    sol2 sol
    fa1
    r4 fa sol la

    %35
    sib4. la8 la2
    sol r
    R1

    %38
    r2 r4 la
    sib do re2~
    re~ re~

    %41
    re4 la la2\mbreak
    sol r4 sol
    la si do2~

    %44
    do4 si si2
    do1
    R

    %47
    sib8 sib la sol fa mi fa sol
    la4 la r2\mbreak
    do8 do sib la sol fa sol la

    %50
    sib4 sib r2
    re8 re do sib la sol la sib
    do4 do r8 do sib la\mbreak

    %53
    sol4 la sib2
    la1 r2
    r r do

    %56
    si do sib?
    la sol re'
    dod re do?

    %59
    si la4 la sold2\mbreak
    la1 r2
    R1.

    %62
    r2 r la
    la2. la4 la2
    sib2. sib4 sib sib

    %65
    si2. si4 si2
    do2. do4 do do
    dod2. dod4 dod2\mbreak

    %68
    re1 mib2
    fa do1
    sib r2

    %71
    R1.*7
    r2 r la
    la2. la4 la2

    %80
    sib2. sib4 sib sib
    si2. si4 si2\mbreak
    do2. do4 do do

    %83
    dod2. dod4 dod2
    re1.~
    re1 re2

    %86
    sib la1
    si1
    r4 sib?4. la16 sol la4~

    %89
    la8 fad sol4. mi8 fad4\mbreak
    re r r re'~
    re8 do16 sib do4. la8 sib4~

    %92
    sib8 sol la4 fa r
    r do'4. sib16 la sib4~
    sib8 sol la4. fad8 sol4~

    %95
    sol8 fa16 mi la4. sol8 sib sol
    sol8. fad16 la8 sol fad4 fad
    r2 r4 re8 mi

    %98
    fad4 fad8 fad fad fad fad mi\mbreak
    fad4. fad8 fad2
    R1

    %101
    fad8 fad sol la sib4 do8 re
    la2 sol
    r2 r4 sol8 la

    %104
    si4 si8 si si si si la\mbreak
    si4. si8 si2
    R1

    %107
    si8 si do re mib4 re8 do
    si4 do2 si4
    do1 r2

    %110
    r r do
    si do sib?\mbreak
    la sol re'

    %113
    dod re do?
    si la4 la sold2
    la1 r2

    %116
    R1.
    r2 r la
    la la4 la la la\mbreak

    %119
    sib2 sib sib
    si si4 si si si
    do2 do do

    %122
    dod dod4 dod dod dod
    re2 re mib\mbreak
    fa do2. sib4

    %125
    sib1 r2
    R1.*7
    r2 r la

    %134
    la la4 la la la
    sib2 sib sib
    si si4 si si si\mbreak

    %137
    do2 do do
    dod dod4 dod dod dod
    re1.~

    %140
    re1 re2
    sib la2. la4
    si1 r2

    %143
    r do si\mbreak
    do4 sib? la2 sol4 re'
    dod2 re4 fa mi2

    %146
    re1 re2
    do do4 do do \parenthesize do
    re1

    %149
    do2 sib\mbreak
    la4. sib8 la8. [sib16 la8. sib16]
    la2. la4

    %152
    si\longa

}

IItestoI = \lyricmode {

    In -- ve -- ne -- runt me, in -- ve -- ne -- runt me, in -- ve -- ne -- runt me, cu -- sto -- des ci -- vi -- ta -- tis,

    cu -- sto -- des ci -- vi -- ta -- tis, cu -- sto -- des ci -- vi -- ta -- tis.

    Pau -- lu -- lum cum per -- tran -- sirem _ e -- os, pau -- lu -- lum cum per -- tran -- sirem _ e -- os,

    pau -- lu -- lum cum per -- tran -- sirem _ e -- os, cum per -- tran -- sirem _ e -- os,

    in -- ve -- ni, in -- ve -- ni, in -- ve -- ni, in -- ve -- ni, in -- ve -- ni

    quem di -- li -- git a -- nimam, _ quem di -- li -- git a -- nimam, _ quem di -- li -- git a -- ni -- mam me -- am,

    quem di -- li -- git a -- nimam, _ quem di -- li -- git a -- nimam, _ quem di -- li -- git a -- ni -- mam me -- am.

    Te  -- nui _ nec di -- mit -- tam il -- lum, te  -- nui _ nec di -- mit -- tam il -- lum,

    te  -- nui _ nec di -- mit -- tam, te  -- nui _ nec di -- mit -- tam, nec di -- mit -- tam il -- lum.

    E -- gre -- di -- mini, _ fi -- liae _ Hie -- ru -- salem, _ et con -- gra -- tu -- la -- mini  _ mi -- hi,

    e -- gre -- di -- mini, _ fi -- liae _ Hie -- ru -- salem, _ et con -- gra -- tu -- la -- mini  _ mi - - hi.

    Can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te

    di -- lecto _ me -- o,  can -- ta -- te  di -- lecto _  me -- o, can -- ta -- te  di -- lecto _  me -- o

    cum lae -- ti -- ti -- a, can -- ta -- te

    di -- lecto _ me -- o,  can -- ta -- te  di -- lecto _  me -- o, can -- ta -- te  di -- lecto _  me -- o

    cum cy -- tha -- ra, can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te

    di -- lecto _  me -- o cum cy - - - tha -- ra.

}

IIalton = \relative do' {

    \autoBeamOff
    R1*23
    R1*2
    re2. re4

    %27
    re2 dod
    re1
    R

    %30
    r4 mi2 fa4
    fa1~
    fa2 mi

    %33
    fa1\mbreak
    R1*2
    r4 re mi fa

    %37
    sol4. fa8 mi2
    re1
    r2 r4 re

    %40
    mi fad sol mi
    fad sol2 fad4
    sol si,\mbreak do re

    %43
    mib2. re4
    re1
    do

    %46
    mib8 mib re do sib la sib do
    re4 re r2
    fa8 fa mi re\mbreak do si do re

    %49
    mi4 mi r2
    sol8 sol fa mi re do re mi
    fa4 fa r2

    %52
    la8 la sol fa mi re mi fa\mbreak
    sol4 fa2 mi4
    fa1 fa2

    %55
    mi fa mi
    re do sol'
    fad sol fa?

    %58
    mi re la'
    sold la4 mi mi2\mbreak
    mi1 mi2

    %61
    mi2. mi4 mi2
    fa2. fa4 fa fa
    fad2. fad4 fad2

    %64
    sol2. sol4 sol sol
    sold2. sold4 sold2\mbreak
    la2. la4 la2

    %67
    R1.*3
    r2 r re,
    re2. re4 re2

    %72
    mib2. mib4 mib mib
    mi2. mi4 mi2
    fa2. fa4 fa fa\mbreak

    %75
    fad2. fad4 fad2
    sol1 sol2
    la mi1

    %78
    fad r2
    r r fa?
    fa2. fa4 fa2
    sol2. sol4 sol sol\mbreak

    %82
    sol2. sol4 sol2
    la2. la4 la la
    la2. la4 la2

    %85
    sib1 sol2
    sol fad1
    sol1

    %88
    re4. mib16 re\mbreak do4. re8
    sib4. do8 la4 la
    r2 fa'4. mib16 re

    %91
    mib4. do8 re4. sib8
    do4 do r2
    mib4. re16 do\mbreak re4. sib8

    %94
    do4. la8 sib4. la16 sol
    do4. la8 re sib sib8. la16
    do4 sib la la

    %97
    r2 r4 fad8 sol\mbreak
    la4 la8 la la la la sol
    la4. la8 la2

    %100
    r la8 la sib do
    re4 mi8 mi fad4 sol~
    sol fad sol2\mbreak

    %103
    r r4 si,8 do
    re4 re8 re re re re do
    re4. re8 re2

    %106
    r re8 re mi fa
    sol1~
    sol4 fa8 mib\mbreak re2

    %109
    do1 fa2
    mi fa mi
    re do sol'

    %112
    fad sol fa?
    mi re la'
    sold la4 mi mi2\mbreak

    %115
    mi1 mi2
    mi mi4 mi mi mi
    fa2 fa fa

    %118
    fad fad4 fad fad fad
    sol2 sol sol
    sold sold4 sold sold sold\mbreak

    %121
    la2 la r
    R1. *3
    r2 r re,

    %126
    re re4 re re re
    mib2 mib mib
    mi! mi4 mi mi mi\mbreak

    %129
    fa2 fa fa
    fad fad4 fad fad fad
    sol1 sol2

    %132
    la mi2. mi4
    fad1 r2
    r r fa?\mbreak

    %135
    fa fa4 fa fa fa
    sol2 sol sol
    sol sol4 sol sol sol

    %138
    la2 la la
    la la4 la la la\mbreak
    sib1 sol2

    %141
    sol fad2. fad4
    sol1 fa?2
    mi fa4 mi re2

    %144
    do4 sol' fad2 sol4 fa?
    mi2 re4 re dod2\mbreak
    re1 fa2

    %147
    fa fa4 fa fa fa
    fa2~fa8 [mi fa sol]
    la2 sol4 sol

    %150
    fad4. sol8\mbreak fad8. [sol16 fad8. sol16]
    fad4 sol2 fad4
    sol\longa

}


IItestoII = \lyricmode {

    In -- ve -- ne -- runt me, in -- ve -- ne -- runt me cu -- sto -- des ci -- vi -- ta -- tis,

    cu -- sto -- des ci -- vi -- ta - - tis, cu -- sto -- des ci -- vi -- ta -- tis.

    Pau -- lu -- lum cum per -- tran -- sirem _ e -- os, pau -- lu -- lum cum per -- tran -- sirem _ e -- os,

    pau -- lu -- lum cum per -- tran -- sirem _ e -- os, pau -- lu -- lum  cum per -- tran -- sirem _ e - - os,

    in -- ve -- ni, in -- ve -- ni, in -- ve -- ni, in -- ve -- ni, in -- ve -- ni,  in -- ve -- ni

    quem di -- li -- git a -- nimam, _ quem di -- li -- git a -- nimam, _ quem di -- li -- git a -- ni -- mam,

    quem di -- li -- git a -- nimam, _ quem di -- li -- git a -- nimam, _ quem di -- li -- git a -- ni -- mam me -- am,

    quem di -- li -- git a -- nimam, _ quem di -- li -- git a -- nimam, _ quem di -- li -- git a -- ni -- mam me -- am.

    Te  -- nui _ nec di -- mit -- tam il -- lum, te  -- nui _ nec di -- mit -- tam il -- lum,

    te  -- nui _ nec di -- mit -- tam, te  -- nui _ nec di -- mit -- tam, nec di -- mit -- tam il -- lum.

    E -- gre -- di -- mini, _ fi -- liae _ Hie -- ru -- salem, _ et con -- gra -- tu -- la -- mini  _ mi - - hi,

    e -- gre -- di -- mini, _ fi -- liae _ Hie -- ru -- salem, _ et con -- gra -- tu -- la -- mini  _ mi -- hi.

    Can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te

    di -- lecto _ me -- o,  can -- ta -- te  di -- lecto _  me -- o, can -- ta -- te  di -- lecto _  me -- o,

    can -- ta -- te  di -- lecto _  me -- o, can -- ta -- te  di -- lecto _  me -- o, can -- ta -- te  di -- lecto _  me -- o

    com ju -- bi -- lo,

    can -- ta -- te  di -- lecto _  me -- o, can -- ta -- te  di -- lecto _  me -- o, can -- ta -- te  di -- lecto _  me -- o

    cum cy -- tha -- ra, can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te, can -- ta -- te,

    can -- ta -- te di -- lecto _  me - o cum cy - - - - tha -- ra.

}

IIbcn = \relative do {

    sol'4 sol sol sol8 sol
    sol fa re mi fa4 sol
    fa sib, fa' re

    %4
    mi fa sol mib
    re sol,8 sol' re4 sol,\mbreak
    re'2 re

    %7
    \clef tenor re'8 sib sol re sol fa sol la
    \clef bass sol re sib sol re' do re mi
    fa4 fa mi4. mi16 fa\mbreak

    %10
    sol4 sol fa8 mi fa sol
    la4. la8 sol fad sol re
    re8 la fa re la' sol la sib

    %13
    do4 do sib4. sib16 do\mbreak
    re4 re do8 sib do re
    mib4. re16 do sib8 do re mi?

    %16
    fa4. mi16 re do8 re mib fa
    sol4. fa16 mi? re8 mi fa sol
    la4. la8 sol la sib sol

    %19
    la4 re, la'2
    re, sol8 re sib sol
    fad2 sol

    %22
    re'4 sol, re'2
    sol,1\mbreak
    sol'8 do si la sol fa mib re

    %25
    do2 re
    sol,1
    sol2 la

    %28
    re,1
    re'2 mi
    la, la8 sol fa mi\mbreak

    %31
    re2. re'4
    sib2 do
    fa, sol4 la

    %34
    sib4. sib16 la sol8 do16 sib la8 re16 do
    sib2 do4 re
    sol,4. sol'16 fa\mbreak mi8 la16 sol fa8 sib16 la

    %37
    sol4 sol la la,
    sib do re4. re16 do
    sib8 mib16 re do8 fa16 mib re4 sib\mbreak

    %40
    do4 re mib do
    re1
    sol,2 do4 si

    %43
    do re mib fa
    sol1
    do,2 fa8 fa mi re

    %46
    do sib do re\mbreak mib mib re do
    sib2. la8 sol
    fa4. sol8 la4 sib

    %49
    do2. sib8 la
    sol4. la8 sib4 do
    re2. do8 sib

    %52
    la4. sib8\mbreak do4 re
    mi fa sol2  %%% OOKK
    fa1 fa,2  %%% allegro

    %55
    do' fa, do'
    sol' do, sol
    re' sol, re'

    %58
    la' re, la
    mi' la,4 la mi2
    la1 la2
    la'1.

    %62
    fa
    re
    sol

    %65
    mi
    la,
    mi'\mbreak

    %68
    fad1 sol2
    re fa1
    sib, sol2

    %71
    sol1.
    do
    la

    %74
    fa'
    re
    sol1 sol2

    %77
    fad la1
    re, fa,2
    fa1.\mbreak

    %80
    sib
    sol
    do

    %83
    la
    re
    sol1 sib,2

    %86
    do re1
    sol,1 %% adagio OOKK
    sib'2 fa

    %89
    sol re
    sol, re'\mbreak
    sol4 la sib2

    %92
    fa fa,
    do' sol'
    fa sol

    %95
    do, si~
    si4 do re2
    sol, re'

    %98
    re1~
    re2 re,
    sol\mbreak re'

    %101
    re~re4 do
    re2 sol,
    do sol

    %104
    sol1
    sol2 sol
    do sol~

    %107
    sol do
    sol'1\mbreak  %%OO KK
    do,1 fa,2 %%% allegro

    %110
    do' fa, do'
    sol' do, sol
    re' sol, re'

    %113
    la' re, la
    mi' la,4 la mi2\mbreak
    la1 la2

    %116
    la'1.
    fa
    re

    %119
    sol
    mi
    la,

    %122
    mi'\mbreak
    fad1 sol2
    re fa?1

    %125
    sib, sol2
    sol1.
    do

    %128
    la
    fa'
    re

    %131
    sol1.
    fad?2 la1
    re, fa,2

    %134
    fa1.\mbreak
    sib
    sol

    %137
    do
    la
    re

    %140
    sol1 sib,2
    do re1
    sol, fa'2

    %143
    do fa, sol
    do re sol,\mbreak
    la re la

    %146
    re1 sib2
    fa1 fa2
    sib1

    %149
    do2~do
    re1~
    re

    %152
    sol,\longa

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s2 <6>8 <5> s4
    s1
    <6>
    s2 <_+>4 <6>
    <_+>2 <_+>
    s1
    s2 <6>
    s2 <6>
    s <6>
    s s4 s8 <6>
    s8 <6> s4 s2   %%% fin qui
    s2 <6>
    s <6>
    s s4 <6>
    s2 <_->4 <6>
    s2 s4 <6>
    <_+>2 <6>4 <[6]>
    <_+>2 <4>4 <[3+]>
    <_+>1
    s
    <_+>2 <4>4 <[3+]>
    s1*2
    <_->2 <_+>
    s1
    s2 <_+>
    <_->1
    <_->2 <_+>
    s1
    s2. <6>4
    s1*3
    s2 <6>4 <_+>
    s1
    s2 <_+>4 <_+>
    s1*3
    <[3+]>4 <4>2 <[3+]>4
    <_+>2 <_->
    <6>4 <[6+]> <6>2
    <4> <[3+]>
    s1
    <_->
    s1*6
    <6>2 <7>4 <6>
    s1.
    s
    <_+>
    <_+>
    <_+>
    <_+>1 <_+>2
    <_+>2 s  <_->
    s1.*2
    <_+>1.
    s
    <_+>
    <_->
    <[6+]>
    <6>1 <[6-]>2
    <6> s1
    s <_+>2
    <_+>1.
    <_->
    <_+>
    s
    <_+>
    s
    <6>1 <_+>2
    <_+>1.
    s
    s
    <_+>
    <_->
    s
    <_+>
    s1 <6>2
    <_-> <_+>1
    <_+>1
    s2 <4>4 <3>
    s2 <4>4 <[3+]>
    s2 <_->
    <[6-]>1
    <4>4 <3> s2
    <_->2 <4>4 <3>
    <4> <3> s2
    <6> <6>
    s4 <_-> <_+>2
    s <_+>
    <_+>1
    s2 <_+>
    s <_+>
    <_+> <6>4 <_->
    <4> <[3+]> <_+>2
    <_->2 <_+>
    <_+>1
    <_+>
    <_->2 <_+>
    s <_->
    <[3+]>4 <4>2 <[3+]>4
    s1.
    s
    <_+>
    <_+>
    <_+>
    <_+>2 s <_+>
    <_+> s <_->
    s1.
    s
    <_+>
    s
    <_+>
    <_->
    <[6+]>
    <6>1 <[6-]>2
    <6> s s
    s s <_+>
    <_+> s s
    <_-> s s
    <_+> s s
    s s s
    <_+> s s
    s s s
    <6> <_+> s
    <_+>1.
    s
    s
    <_+>
    <_->
    <_+>
    <_+>
    s2 s <6>
    <6> <_+> s
    <_+> s s
    s s <_+>
    s <_+> s
    <_+> s <_+->
    s1.*2
    s1
    <6>2 <5>
    <[3+]>1
    s4 <4>2 <[3+]>4
    <[_+]>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 60
    \once\override Score.RehearsalMark.extra-offset = #'(6 . +1.0)
    \mark\markup\italic "Sinfonia"
    s1*53\break
    \once\override Score.RehearsalMark.extra-offset = #'(6 . 0.0)
    \mark\markup\italic "Allegro"
    \time 3/2
    \tempo 1 = 120
    s1.*33\break
    \time 4/4
    \tempo 2 = 50
    \once\override Score.RehearsalMark.extra-offset = #'(6 . +1.0)
    \mark\markup\italic "Adagio"
    s1*22\break
    \once\override Score.RehearsalMark.extra-offset = #'(6 . 0.0)
    \mark\markup\italic "Allegro"
    \time 3/2
    \tempo 1 = 120
    s1.*39
    \time 4/4
    \tempo 2 = 75
    s1*4
    s\longa
    \bar "|."

}

IIfgI = {
    \notypeset
    \clef tenor
    <<\IIfgIn \forma>>

}

IIfgII = {
    <<\IIfgIIn \forma>>

}

IIfgIII = {
    \clef bass
    <<\IIfgIIIn \forma>>

}

IIsoprano = {
    \new Voice = "invenerunt1"
    <<\IIsopranon \forma>>
}

IIalto = {
    \new Voice = "invenerunt2"
    <<\IIalton \forma>>
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



IIItbIn = \relative do' {

    do1~
    do2 mi
    sol fa4 mi

    %4
    re2. do8 si
    la4 re, re'2
    r4 re re do\mbreak

    %7
    sib2~sib8 re sib do
    re1
    sol,2 r4 sol'

    %10
    sol fa mi2~
    mi8 sol fa mi re2
    do1~

    %13
    do
    r2 do~
    do4 sib8 la\mbreak sol4. sol8

    %16
    fa2 r4 do'
    mi2 sol
    re4 re fa2

    %19
    la la,4 la
    do4. re8 mi2
    r4 mi mi re\mbreak

    %22
    dod2~dod8 mi dod re
    mi1
    la,2 mi'

    %25
    la4. la8 la2
    mi4 fa la8 sol mi mi
    fad4 sol2 fad4\mbreak

    %28
    sol1
    r2 r4 re
    sol4. sol8 mi2

    %31
    fa4 sol la8 sol fa fa
    mi2 re
    r4 re4. la8 re4

    %34
    re1
    R1*41
    do4. re8 mi4. fa8

    %77
    sol4. fa8 re4. mi8
    fa4. sol8\mbreak la4. sol8
    mi4. fa8 sol2

    %80
    re re4. do8
    si4 sol sol'2~
    sol fad2

    %83
    sol1~
    sol
    r2 r4 sol

    %86
    sol fa mi2~
    mi8 sol fa mi re2
    do1

    %89
    R1*2
    r2 do
    mi4 re8 mi fa4 fa

    %93
    mi fa mi re
    dod1
    re2 si4 do

    %96
    re2 mi
    re1\mbreak
    re

    %96
    R1*39
    r2 r4 sol\tu
    sol sol sol sol

    %140
    \parenthesize sol2 sol4 sol \mbreak
    fa4. fa8 fa4 mi
    mi2 mi4 sol

    %143
    sol4. sol8 mi2
    r r4 sol
    mi4. mi8 re2

    %146
    r2 r4 la'\mbreak
    fad4. fad8 sol4 mi
    fad2 mi4 mi

    %149
    mi4. mi8 re4 re
    re4. sol8 sol2
    r4 re re2

    %152
    re\mbreak r4 re8 re
    mi4 fa sol8 fa fa mi
    mi re re do re2

    %155
    R1
    r2 r4 sol8 sol
    sol4 fa\mbreak mi re

    %158
    mi2 sol
    sol1
    r2 re

    %161
    re2. re4
    re\longa

}

IIItbIIn = \relative do' {

    R1*3
    re,1
    fad4 fad sol2~

    %6
    sol fad
    sol4 re' re do
    si2~si8 re si do

    %9
    re2 sol,
    sol1
    r4 sol sol fa\mbreak

    %12
    mi2\parentSlur (mi8) sol mi fa
    sol2 do,
    r4 fa la2

    %15
    do1
    la4 fa la2
    do sol

    %18
    R1
    r4 la do2
    mi4 do8 si la2~

    %21
    la sold
    la4 mi' mi re\mbreak
    dod2~dod8 mi dod re

    %24
    mi2 la,
    la1
    r2 la

    %27
    re4. re8 re2
    si4 do re8 do si si
    la2 la

    %30
    sol4 la si8 la sol sol
    la1
    sol2\mbreak r4 si8 do

    %33
    re do si si la2
    sol1
    R1*41

    %76
    R1
    sol4. la8 si4. do8
    re4. do8 la4. si8

    %79
    do4. re8\mbreak mi2
    si sol4. la8
    si4. do8 re2~

    %82
    re4 do8 si la4. la8
    sol4 re' re do
    si2~si8 re si do

    %85
    re2 sol,
    sol1
    R

    %88
    r2 sol
    la4 la8 si\mbreak do4 do
    si do si la

    %91
    sold2 la
    si1
    si

    %94
    la4 si la sol
    fad2 sol
    la1~

    %97
    la
    sol
    R1*39\mbreak

    %138
    r2 r4 si
    si si si sol
    si2 si4 sol

    %141
    la4. la8 la4 la
    sold2 sold4 do
    si4. si8 do2

    %144
    r r4 si
    la4. la8 la2\mbreak
    r r4 do

    %147
    si4. si8 si4 mi
    si2 sold4 sold
    la4. la8 la4 la

    %150
    sol?4. sol8 sol2~
    sol4 sol la2
    si r4 si8 si

    %153
    sol4 la do re\mbreak
    sol,4. sol8 sol2
    R1

    %156
    r2 r4 si8 si
    do4 re sol, re
    sol2 do8 re mi4

    %159
    re2 re,
    fad sol
    la2. la4

    %162
    sol\longa

}

IIItbIIIn = \relative do {

    R1*2
    sol1~
    sol2 si4 si

    %5
    re1~
    re2 re
    sol,1~

    %8
    sol
    r4 sol' sol fa
    mi2~mi8 sol mi fa

    %11
    sol2 sol,
    do1~
    do2 r4 do

    %14
    do sib\mbreak la2~
    la8 do la si do2
    fa,1

    %17
    r2 r4 sol
    si2 re
    la1

    %20
    r4 la do4. re8
    mi2 mi
    la,1~

    %23
    la
    r4 la' la sol
    fad2~fad8 la fad sol\mbreak

    %26
    la1
    re,2 re
    sol4. sol8 sol,2

    %29
    re'4 mi fa8 mi re re
    mi1
    re2 re4 re

    %32
    mi8 re do do si4. la16 sol
    fad4 sol re'2
    sol,1

    %35
    R1*41\mbreak
    R1*2
    re'4. mi8 fa4. sol8

    %79
    la4. sol8 mi4. fa8
    sol4. la8 si4. do8
    re4 si8 la sol4 sol,16 la si sol

    %82
    re'2. re4
    sol,1~
    sol

    %85
    r4 sol' sol fa
    mi2~mi8 sol mi fa\mbreak
    sol1

    %88
    do,~
    do
    r2 do

    %91
    mi4 re8 mi fa4 fa
    mi fa mi re
    mi1

    %94
    la,2 la
    re4 do8 re mi4 mi
    re mi re dod?

    %97
    re1
    sol,
    R1*39\mbreak

    %138
    r2 r4 sol
    sol sol sol do
    sol2 sol4 sol

    %141
    re'4. re8 re4 la
    mi'2 mi4 do
    sol'4. sol8 do,2

    %144
    r r4 sol'
    la4. la8 re,2\mbreak
    r r4 la'

    %147
    si4. si8 mi,4 do'
    si2 mi,4 mi
    la4. la8 re,2

    %150
    r4 sol, do4. do8
    sol4 sol re'2
    sol, r4 sol'8 sol\mbreak

    %153
    mi4 re do si
    do4. do8 sol2
    R1

    %156
    r2 r4 sol'8 sol
    mi4 re do si
    do2. do4

    %159
    sol2 si
    re1~
    re2 re

    %162
    sol,\longa

}

IIIsopranoIn = \relative do'' {

    \autoBeamOff

    R1
    sol1~
    sol2 si

    %4
    re1~
    re2 do4 si
    la2 la

    %7
    sol r4 re'
    re do\mbreak si2~
    si8 [re si do] re2~

    %10
    re8 [sol, la si] do2~
    do si
    do4 sol sol fa\mbreak

    %13
    mi2~mi8 [sol mi fa]
    sol [do, re mi ]fa2~
    fa mi

    %16
    fa1
    r4 sol si2
    re la4 la

    %19
    do2 mi~
    mi re4 do
    si2 si

    %22
    la\mbreak r4 mi'
    mi re dod2~
    dod8 [mi dod re] mi2~

    %25
    mi8 [la, si dod ] re2~
    re dod
    re1~

    %28
    re
    R
    r2 sol,

    %31
    re'4. re8 re2\mbreak
    si4 do re8 do si si
    la4 si2 fad4

    %34
    sol1
    R1*41
    r2 sol4. la8

    %77
    si4. do8\mbreak re2
    la4 la4. si8 do4~
    do8 re mi2 si4~

    %80
    si sol4. la8 si4~
    si8 do re2 do8 si
    la2. la4

    %83
    si2 r4 re
    re do si2~
    si8 [re si do] re2~

    %86
    re8 [sol, la si] do2~
    do si
    do1

    %89
    r2 sol
    si4 la8 si do4 do
    si do si la

    %92
    sold2\mbreak la~
    la sold?
    la1

    %95
    la4 si la sol
    fad2 sol~
    sol fad?

    %98
    sol1
    R1*39\mbreak
    r2 r4 re'

    %139
    re re re mi
    re2 re4 si
    la4. la8 la4 la

    %142
    si2 si4 do
    re4. re8\mbreak mi2
    r r4 re

    %145
    dod4. dod8 re2
    r r4 mi
    red4. red8 mi4 la,

    %148
    si2 si
    r r4 re\mbreak
    si4. si8 do4 do

    %151
    re1
    re2 r4 si8 si
    do4 re mi8 [re re do]

    %154
    do [si si] la si2
    R1
    r2 r4 re8 re\mbreak

    %157
    mi4 fa sol8 [fa fa mi]
    mi [re re do] do [si si] la
    si1

    %160
    la2 re~
    re la
    si\longa

}

IIItestoI = \lyricmode {

    Ve -- ni, ve -- ni, di -- le -- cte mi, in hortum _ me  - - - um, in hortum _ me  - - - um,

    ve -- ni,  ve -- ni,  ve -- ni,  ve -- ni,  di -- le -- cte mi, in hortum _ me  - - - um,

    ut come - das  pre -- ti -- osum _ fructum _  tu - - um.

    Ve - - - - ni, ve - - - - ni, ve - - - - ni, di -- le -- cte mi, in hortum _ me  - - - um,

    ut come - das  fructum _  pre -- ti -- osum _ tu - - um, pre -- ti -- osum _ tu - - um.

    Com -- e -- di -- te di -- le -- cti et bi -- bite _ a -- mi -- ci, et bi -- bite, _ et bi -- bite, _ et bi -- bite _

    a -- mi -- ci,  et bi -- bite _  a -- mi -- ci,  et in -- e -- bri -- a - mi -- ni,

    et in -- e -- bri -- a - - mi -- ni, ca -- ris -- si -- mi.

}

IIIsopranoIIn = \relative do'' {

    \autoBeamOff
    R1*33
    r2 sol8^\markup\italic"a 2"[la si do]
    re4. re8 sol,2\mbreak

    %36
    sol8[la si do] re4. re8
    sol,2 si4 do
    re do si do~

    %39
    do si8 [la] si2\mbreak
    do1
    do,8[re mi fa] sol4. sol8

    %42
    do,2 do8[re mi fa]
    sol4. sol8 mi2
    sol4 la si do

    %45
    si1
    la
    fad4 sol la si\mbreak

    %48
    la1
    sol
    si4 si8 si si sol la si

    %51
    do2 do8 do si la
    si4 do2 si4
    do2 r

    %54
    sol4 sol8 sol\mbreak sol mi fa sol
    la2 la8 la sol fa
    sold4 la2 sold4

    %57
    la1
    r2 r4 mi
    fad fad8 fad sol4 sol\mbreak

    %60
    la2 si4 si
    do do8 do re4 re
    mi2 re4 si

    %63
    do re mi2~
    mi4 re8 do si2
    la\mbreak r4 mi

    %66
    fad fad8 fad sol4 sol
    la2 si4 si
    do do8 do re4 re

    %69
    mi4. re16[do] si8[do re si]
    do2 si
    r4 sol la fa

    %72
    sol4. fa8 mi2
    re4. mi16 [fa] sol2~
    sol fad

    %75
    sol1\mbreak
    R1*22
    r2 re'8^\markup\italic"a 2"[do si la]

    %99
    sol4. sol8 re2
    sol8[la si do] re4. re8
    sol,2 si4 do

    %102
    re do si do~
    do si8 [la] si2
    do1  %% OOKK

    %105
    sol8 [fa mi re] do4. do8
    sol'2 do,8[re mi fa]\mbreak
    sol4. sol8mi2

    %108
    sol4 la si la
    si1
    mi,2 la4 sol

    %111
    fad sol la sol~
    sol fad8 [mi] fad2\mbreak
    sol1

    %114
    si4 si8 si si sol la si
    do2 la8 la sol la
    si4 do2 si4

    %117
    do2 r\mbreak
    sol4 sol8 sol sol mi fa sol
    la2 fad8 re mi fad

    %120
    sold4 la2 sold4
    la1
    R1*2\mbreak

    %124
    r2 r4 mi
    fad4. fad8 sol4 sol
    la2 la4 la

    %127
    sib2 si
    do1
    si2 r4 mi

    %130
    re mi\mbreak do8 si re do
    si4 si si2
    la1

    %133
    R1*2
    r2 r4 re
    do re si8 la do si\mbreak

    %137
    la4 sol2 fad4
    sol2 r4 si
    si si si do

    %140
    si2 si4 re
    re4. re8 re4 mi\mbreak
    mi2 mi

    %143
    r r4 do
    la4. la8 si2
    r r4 re

    %146
    si4. si8 la2
    r r4 mi'
    red4. red8 mi2

    %149
    r4 la,\mbreak fad4. fad8
    sol4 sol mi4. mi8
    re4 sol2 fad4

    %152
    sol1
    R
    r2 r4 si8 si

    %155
    do4 re mi8 [re re do]\mbreak
    do[si si] la si2
    r4 re8 re mi4 fa

    %158
    sol8[fa fa mi] fa[re re] do
    re1~
    re2 si

    %151
    la re
    re\longa

}

IIItestoII = \lyricmode {

    Ve - nio, _  ve - ni -- o, soror _ me -- a spon - - - sa,

    ve - nio, _  ve - nio, _ soror _ me -- a spon -- sa,  soror _ me -- a spon -- sa,

    ve -- nio, _ soror _ me -- a spon -- sa,   in hortum _ me - - um,

    ve -- nio, _ soror _ me -- a spon -- sa, in hortum _ me - - um,

    et mes -- sui _ myrrham _ me -- am, et mes -- sui _ myrrham _ me -- am cum a -- ro -- ma -- tibus _ me -- is,

    et mes -- sui _ myrrham _ me -- am, et mes -- sui _ myrrham _ me - - - am,

    cum a -- ro -- ma -- tibus _ me - - - is.

    Ve - nio, _  ve - ni -- o, soror _ me -- a spon - - - sa,

    ve - nio, _  ve - nio, _ soror _ me -- a spon -- sa,  soror _ me -- a spon - - - sa,

    ve -- nio, _ soror _ me -- a spon -- sa,   in hortum _ me - - um,

    ve -- nio, _ soror _ me -- a spon -- sa, in hortum _ me - - um,

    com -- e -- di favum _ meum _ cum mel -- le me -- o,

    cum la -- cte meo _  vinum _ meum _ bi -- bi,

    cum la -- cte meo _  vinum _ meum _ bi -- bi.

    Com -- e -- di -- te di -- le -- cti et bi -- bite _ a -- mi -- ci, et bi -- bite, _ et bi -- bite, _ et bi -- bite, _

    et bi -- bi -- te,  et bi -- bi -- te  a -- mi -- ci,  et in -- e -- bri -- a - mi -- ni,

    et in -- e -- bri -- a - mi -- ni, ca -- ris -- si -- mi.

}

IIItenoren = \relative do' {

    \autoBeamOff
    R1*33
    R1
    sol8^\markup\italic"a 2"[la si do] re4. re8

    %36
    sol,2\mbreak sol8[la si do]
    re4. re8 sol,2
    si4 do re mi

    %39
    re1
    do2 do,8[re mi fa]\mbreak
    sol4. sol8 do,2

    %42
    do8[re mi fa] sol4. sol8
    do,2 do'4 do
    si la sold la~

    %45
    la sold8 [fad] sold2
    la do4 si
    la sol?\mbreak fad4 sol~

    %48
    sol fad8[mi] fad2
    sol re'4 re8 re
    re si do re mi2

    %51
    mi r8 mi re do
    re1
    do2 si4 si8 si\mbreak

    %54
    si sol la si do2
    do r8 do si la
    si1

    %57
    la2 r4 mi
    fad fad8 fad sol4 sol
    la2 si4 si\mbreak

    %60
    do do8 do re4 re
    mi4. re16 [do] si8 [do re si]
    do2 si4 sol

    %63
    la si do si8 la
    sold4 la2 sold4\mbreak
    la1

    %66
    r2 r4 mi
    fad fad8 fad sol4 sol
    la2 si4 si

    %69
    do do8 do re4 re
    mi2 re
    R1

    %72
    r4 si do la
    si4. la8 sol2
    la1

    %75
    sol
    R1*22
    R1

    %99
    re'8^\markup\italic"a 2"[do si la] sol4. sol8
    re2 sol8[la si do]
    re4. re8 sol,2\mbreak  %% fine pagina

    %102 OOKK5
    si4 do re do
    re1
    sol,2 sol8[fa mi re]

    %105
    do4. do8 sol'2
    do,8[re mi fa] sol4. sol8
    do,2 do'4 do

    %108
    si la sold la~
    la sold8 [fad]\mbreak sold2
    la1

    %111
    la4 sol? fad sol
    la1
    re,2 re'4 re8 re

    %114
    re si do re mi2
    do8 la si do re2~
    re1

    %117
    do2 si4 si8 si\mbreak
    si sol la si do2
    la8 fa sol la si2~

    %120
    si1
    la2 r4 mi
    fad4. fad8 sol4 sol

    %123
    la2 si4 si
    do2\mbreak dod
    re1

    %126
    dod2 r4 la
    sol2 sold
    la1

    %129
    sold
    R1*2
    r2 r4 la

    %133
    sol la fa8 mi sol fa
    mi4 mi mi2\mbreak
    re r4 si'

    %136
    sol la si sol
    mi8 fa sol mi la2
    sol r4 re'

    %139
    re re re do
    re2 re4 re\mbreak
    re4. la8 la4 do

    %142
    si2 mi,
    r r4 sol
    fad4. fad8 sol2

    %145
    r r4 la
    sold4. sold8 la2
    R1

    %148
    r2 r4 mi'\mbreak
    dod4. dod8 re2
    r4 re do?4. do8

    %151
    si4 si la2
    sol1
    R

    %154
    r2 r4 re'8 re
    mi4 fa sol8[fa mi re]
    mi[re re] do\mbreak re2

    %157
    r4 la8 la do4 re
    do4. do8 sol2~
    sol sol

    %160
    la sol~
    sol fad
    sol\longa

}

IIItestoIII = \lyricmode {

    Ve - nio, _  ve - ni -- o, soror _ me -- a spon -- sa,

    ve - nio, _  ve - nio, _ soror _ me -- a spon - - - sa,  soror _ me -- a spon - - - sa,

    ve -- nio, _ soror _ me -- a spon -- sa,   in hortum _ me -- um,

    ve -- nio, _ soror _ me -- a spon -- sa, in hortum _ me -- um,

    et mes -- sui _ myrrham _ me -- am, et mes -- sui _ myrrham _ me - - - am cum a -- ro -- ma -- tibus _ me - - is,

    et mes -- sui _ myrrham _ me -- am, et mes -- sui _ myrrham _ me -- am,

    cum a -- ro -- ma -- tibus _ me -- is.

    Ve - nio, _  ve - ni -- o, soror _ me -- a spon -- sa,

    ve - nio, _  ve - ni -- o, soror _ me -- a spon - - - sa,  soror _ me -- a spon -- sa,

    ve -- nio, _ soror _ me -- a spon -- sa,   in hortum _ me -- um,

    ve -- nio, _ soror _ me -- a spon -- sa, in hortum _ me -- um,

    com -- e -- di favum _ meum _ cum mel -- le me -- o,

    cum la -- cte me -- o,  cum la -- cte me -- o meum _ vinum _  bi -- bi,

    cum la -- cte me -- o  meum _ vinum _  bi -- bi.

    Com -- e -- di -- te di -- le -- cti et bi -- bite _ a -- mi -- ci, et bi -- bite, _ et bi -- bite, _ et bi -- bite, _

    et bi -- bi -- te a -- mi -- ci,  et in -- e -- bri -- a - mi -- ni,

    et in -- e -- bri -- a -- mi -- ni, ca -- ris - si -- mi.

}

IIIbcn = \relative do {

    \clef alto do'1~
    do2 mi
    \clef bass sol,,1~

    %4
    sol2 si
    re1~
    re

    %7
    sol,1
    sol
    sol'2. fa4

    %10
    mi2~mi8 sol mi fa
    sol2 sol,
    do1

    %13
    do2. do4\mbreak
    do sib? la2~
    la8 do la si do2

    %16
    fa,4\clef tenor fa' la2
    do sol4\clef bass sol,
    si2 re

    %19
    la1
    la2 do4. re8
    mi1

    %22
    la,
    la\mbreak
    la'2 la4 sol

    %25
    fad2~fad8 la fad sol
    la1
    re,2 re

    %28
    sol sol,
    re'4 mi fa8 mi re re
    mi1

    %31
    re2 re4 re
    mi8 re do do\mbreak si4. la16 sol
    fad4 sol re'2

    %34
    sol,1_\markup\italic "Tiorba"
    sol
    sol

    %37
    sol
    sol'4 la sol mi
    fa2 sol

    %40
    do,1
    do
    do

    %43
    do\mbreak
    mi4 fa mi do
    re2 mi

    %46
    la,1
    re4 mi re si
    do2 re

    %49
    sol,1
    sol'2 sol8 mi fa sol
    la2 la\mbreak

    %52
    sol4 fa8 mi sol2
    do, mi
    mi mi8 do re mi

    %55
    fa2 fa
    mi4 re8 do mi2
    la, la

    %58
    re\mbreak mi
    re si
    la sol

    %61
    do sol
    do sol'
    fa4 re do re

    %64
    mi1
    la,2 la
    re mi

    %67
    re si\mbreak
    la sol
    do sol

    %70
    do sol
    sol' fa4 re
    mi4. re8 do2

    %73
    re mi
    do re
    sol,1\mbreak

    %76
    \clef alto do'4. re8 mi4. fa8
    \clef tenor sol,4. la8 si4. do8
    \clef bass re,4. mi8 fa4. sol8

    %79
    la4. sol8 mi4. fa8
    sol4. la8 sol4. la8
    si4. la8 sol4 sol,

    %82
    re'1
    sol,
    sol

    %85
    sol'2. fa4
    mi2~mi8 sol mi fa
    sol1

    %88
    do,
    do\mbreak
    sol'2 do,

    %91
    mi4 re8 mi fa2
    mi4 fa mi re
    mi1

    %94
    la,2 la
    re4 do8 re mi4 mi\mbreak
    re4 mi re dod

    %97
    re1
    sol,_\markup\italic"Tiorba"
    sol

    %100
    sol
    sol
    sol'4 la sol mi

    %103
    re1
    do
    do

    %106
    do
    do\mbreak
    mi4 fa mi do

    %109
    si1
    la2 la
    re4 mi re si

    %112
    la1
    sol
    sol'2 sol8 mi fa sol\mbreak

    %115
    la2 fa8 re mi fa
    sol1
    do,2 mi

    %118
    mi mi8 do re mi
    fa2 re8 si do re
    mi1

    %121
    la,2 la
    re mi\mbreak
    re sol

    %124
    fa mi
    re do4 si
    la2 re

    %127
    sol, mi
    la1
    fa2 mi'

    %130
    fad4 sold la fa?
    re fa\mbreak mi2
    la, la

    %133
    si4 dod re sib
    sol sib la2
    re sol,4 sol'

    %136
    mi fad sol mi
    do mi re2\mbreak
    sol, r4 sol

    %139
    sol sol sol do
    sol2 sol4 sol
    re' re re la

    %142
    mi'2 mi4 do
    sol'2 do,4 do
    re2\mbreak sol,4 sol'

    %145
    la2 re,4 re
    mi2 la,4 la'
    si2 mi,4 do'

    %148
    si2 mi,4 mi
    la2 re,4 re\mbreak
    sol sol, do4. do8

    %151
    sol4 sol re'2
    sol,2. sol'4
    mi re do si

    %154
    do2 sol4 sol'\mbreak
    mi re do si
    do2 sol4 sol'

    %157
    mi re do si
    do2. do4
    sol2 si

    %160
    re1~
    re
    sol,\longa

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s2 <6>
    <[3+]> <4>
    s <[3+]>
    s1*2
    s2. <6>4 <6>2 s8 <6> s4
    <4>2 <[3]>
    s1*2
    s2 <6>
    s1
    s2 <6>s1
    <6>
    s
    s2 <6>
    <4>2 <[3+]>
    <_+>1
    <_+>
    <_+>
    <6>
    <4>2 <[3+]>
    <[3+]> 4 <4> <4> <[3+]>
    s1*5
    <6>2 <4>4 <[3+]>
    s1*4
    s2 s4 <6>
    s1*5
    s2 <_+>4 <_+>
    s2 <_+>
    s1
    <_+>2 <_+>4 <6>
    s2 <_+>
    s1
    s2 <6>
    s1
    s2 <4>4 <3>
    s1
    s2 <6>
    s1
    <_+>2 <4>4 <[3+]>
    s1*16
    <6>1
    s2 <_+>
    s1*6
    <6>1
    <4>2 <[3+]>
    s1*2
    s2 s4 <6>
    <6>2 s8 <6> <6> s
    <4>2 <3>
    s1\mbreak
    <6>2 <5>
    s <6>
    <_+>1
    <_+>2 <4>
    <4> <[3+]>
    <_+>1
    <_+>
    <_+>
    <4>2 <[3+]>
    s1*4
    s2 s4 <6>
    <7>2 <6>
    s1*4
    s2 <_+>4 <6>
    <7>2 <[6+]>
    <_+>1
    <_+>2 <_+>4 <6>
    <7>2 <[6+]>
    s1
    s2 <6>
    s2 <6>
    <3>4 <4>2 <3>4
    s1
    s2 <6>
    s <6>
    <[3+]> 4 <4>2 <[3+]> 4
    s1
    <_+>
    <_+>
    s
    <_+>
    <_+>2 <_+>
    <_-> <_+>
    s1
    <_+>2 <_+>
    <6>4 <6> s <6>
    <6> <4> <_+>2
    <_+> s
    <6>4 <6> s <6>
    <6>  <4> <4> <[3+]>
    <_+>1
    <6>4 <6> s2
    <6>2 <[4]>4 <_+>
    s1*4
    <_+>1
    s
    <_+>
    <_+>2 <_+>
    s1
    <_+>2 s4 <6>
    <_+>2 <_+>
    <_+> <_+>s1
    s2 <[4]>4 <_+>
    s1
    <6>
    s
    <6>2 s4 <6>
    s1
    <6>
    s
    s2 <6>
    <[3+]>  <4>
    s <[3+]>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 53
    s1*161
    s\longa
    \bar "|."

}

IIItbI = {
    \notypeset
    \clef alto
    <<\IIItbIn \forma>>

}

IIItbII = {
    \clef tenor
    <<\IIItbIIn \forma>>

}

IIItbIII = {
    \clef bass
    <<\IIItbIIIn \forma>>

}

IIIsopranoI = {
    \new Voice = "veni1"
    <<\IIIsopranoIn \forma>>
}

IIIsopranoII = {
    \new Voice = "veni2"
    <<\IIIsopranoIIn \forma>>
}

IIItenore = {
    \new Voice = "veni3"
    <<\IIItenoren \forma>>
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

    R1*5
    fa,4 fa fa8. [sol16 fa8. sol16]
    la8. [sib16 la8. sib16] do4. sib16 la

    %8
    sol4 do8. re16\mbreak mi8. [fa16 mi8. fa16]
    sol2 mi
    r8 do do do sol8 do16 re mi re mi fa

    %11
    sol4 do,8 re mi2
    do8 do do do\mbreak sol8 do16 re mi re mi fa
    sol4 la sol2

    %14
    fa1
    R1*5
    fa,4 fa fa8. [sol16 fa8. sol16]

    %21
    la8. [sib16 la8. sib16] do2~
    do4 sib8 la\mbreak sol2~
    sol8.[la16 sol8. la16] si8 sol sol'4

    %24
    sol1
    R
    sol,4 sol sol8.[la16 sol8. la16]

    %27
    sib8.[do16 sib8. do16] re2~
    re4 do8 sib\mbreak la2~
    la8.[si?16 la8. si16] dod8 la la'4

    %30
    la1
    R
    r8 do, do do sol do16 re mi re mi fa

    %33
    sol2. fa8 mi\mbreak
    re mi16 fa sol fa sol la sib2~
    sib4 la8 sol la4. re,8

    %36
    re1
    sol8 la sol mi fa4 fa8 re
    mi fa mi do re2

    %39
    do r\mbreak
    R1*3
    fa8 sol fa re mib4 mib8 do

    %44
    re  mib re sib do4. fa,8
    r2 la'8 sib la fa
    sol4 sol8 mi?\mbreak fa mi re mi

    %47
    dod4 re2 dod4
    re1
    r2 fa8 sol fa do

    %50
    re4 sib8 fa' fa sol la fa
    mi4 fa2 mi4
    fa1\mbreak

    %53 inizia 3/1
    \footnote #' (+1 . 2) \markup\column\smaller {"Nell'edizione antica 3/1""  "} r1.
    R1.*5
    la,4 sib do do re mi

    %60
    fa2 fa r
    r r4 la, si do
    re2. re4 dod2

    %63
    re1 r2\mbreak
    R1.*3
    re4 do si si do re

    %68
    mi2 mi r
    r2 r4 sol, la si
    do2. do4 si2

    %71
    do1 r2\mbreak
    R1.
    r4 mi fa la sol2
    fa mi1

    %75 OOKK 4/4
    fa1
    R1*28

    %104 %% 3/1 finale
    \footnote #' (+1 . 2) \markup\column\smaller {"Nell'edizione antica 3/1""  "} r1.
    R1.*5
    la,4 sib do do re mi
    fa2 fa r

    %112
    r r4 la, si do
    re2. re4 dod2
    re1 r2

    %115
    R1.*3\mbreak
    re4 do si si do re
    mi2 mi r

    %120
    r r4 sol, la si
    do2. do4 si2
    do1 r2

    %123
    R1.\mbreak
    r4 mi fa la sol2
    fa mi1

    %126
    fa\breve\fermata

}

IVvlIIn = \relative do'' {

    R1*6
    do4 do do8.[re16 do8. re16]
    mi8.[fa16 mi8. fa16] sol2

    %9
    mi r8 do do do
    sol do16 re mi re mi fa\mbreak sol4 do,8 re
    mi2 do8 do do do

    %12
    sol do16 re mi re mi fa sol4 do,8 do
    re16 do re  mi fa2 mi4
    la1

    %15
    R1*6
    do,4 do do8. [re16 do8. re16]
    mi8.[fa16 mi8. fa16] sol2~

    %23
    sol4 fa8 mi re2
    mi1
    R1*2

    %27
    re4 re re8.[mi16 re8. mi16]
    fa8.[sol16 fa8. sol16] la2~
    la4 sol8 fa mi2

    %30
    fad1
    R\mbreak
    r2 r8 do do do

    %33
    sol do16 re mi re mi fa sol2~
    sol4 fa8 mi re4. mi8
    fad4 sol2 fad4

    %36
    sol1
    R
    sol8 la sol mi fa4 fa8 re\mbreak

    %39
    mi fa mi do re2
    do r
    R1*3

    %44
    r2 la'8 sib la fa
    sol4 sol8 mi fa sol fa re
    mi4 mi8 do re mi fa re

    %47
    mi4 fa mi2
    re r\mbreak
    do8 re do sol do4 do

    %50
    r re la'8 sib do la
    sol1
    la

    %53 OOKK
    R1.*6
    do,4 re mi mi fa sol
    la2 la r

    %61
    r4 fa sol la sol2\mbreak
    fa2 mi1
    re r2

    %64
    R1.*3
    sol,4 sol re' re mi fad
    sol2 sol r

    %69
    r4 re mi sol fa2
    mi re1
    do r2

    %72
    R1.
    r4 sol' la do sib2\mbreak
    la sol2. do,4

    %75
    do1 %%% inizia 4/4
    R1*28
    R1.*6  %%% inizia 3/2

    %110
    do4 re  mi mi fa sol
    la2 la r
    r4 fa sol la sol2

    %113
    fa mi1\mbreak
    re1 r2
    R1.*3

    %118
    sol,4 sol re' re mi fad
    sol2 sol r
    r4 re mi sol fa2

    %121
    mi re1
    do r2
    R1.

    %124
    r4 sol' la do sib2
    la sol2. do,4
    do\breve\fermata

}

IVfgn = \relative do {

    R1*5
    r2 fa,4 fa
    fa8.[sol16 fa8. sol16] la8.[sib16 la8. sib16]

    %8
    do1~
    do~
    do

    %11
    do
    do2 r8 do do do
    sol4 fa do'2\mbreak

    %14
    fa,1
    R1*5
    r2 fa4 fa

    %21
    fa8.[sol16 fa8. sol16] la8.[sib16 la8. sib16]
    do2. sib8 la
    sol1

    %24
    do,
    R
    r2 sol'4 sol

    %27
    sol8.[la16 sol8. la16]\mbreak sib8.[do16 sib8. do16]
    re2. do8 sib
    la1

    %30
    re,
    R1*2
    r2 r8 do' do do

    %34
    sol2. fa8 mi
    re1
    sol

    %37
    R1*2
    do8 re do la sib4 sib8 sol\mbreak
    la sib la fa sol2

    %41
    fa r
    R1*2
    r2 fa'8 sol fa  re

    %45
    mi!4 mi8 do re4. re8
    do4 do8 do sib4. sib8
    la4 re, la'2

    %48
    re, r\mbreak
    R1
    r4 sib' fa8 fa fa fa

    %51
    do1
    fa

    %53 OOKK inizia 3/1
    R1.*7
    fa'4 mi re do sib sol
    fa2 fa4 re sol la

    %62
    sib2 sol la
    re,1 r2
    R1.*4\mbreak

    %68
    do4 re mi sol la si
    do2 do4 do, fa sol
    la2 fa sol

    %71
    do,1 r2
    R1.
    r2 r sib'

    %74
    sib do1
    fa,1  %% inizia 4/4
    R1*28

    %104
    R1.*7
    fa'4 mi re do sib sol
    fa2 fa4 re sol la

    %113
    sib2 sol la
    re,1 r2
    R1.*4\mbreak

    %119
    do4 re mi sol la si
    do2 do4 do, fa sol
    la2 fa sol

    %122
    do,1 r2
    R1.
    r2 r sib'

    %125
    sib do1
    fa,\breve\fermata

}

IVtenoreIn = \relative do' {

    \autoBeamOff

    fa,4 fa fa8.[sol16 fa8. sol16]
    la8.[sib16 la8. sib16] do2
    la\mbreak r8 fa fa fa

    %4
    do [re16 mi] fa [mi fa sol] la2~
    la4 sol8 fa sol2
    fa1\mbreak

    %7
    R1*12
    r2 fa4 fa
    fa8.[sol16 fa8. sol16] la8.[sib16 la8. sib16]

    %21
    do1~
    do~
    do2 si

    %24
    do1
    r2 sol4 sol
    sol8.[la16 sol8. la16]\mbreak sib8.[do16 sib8. do16]

    %27
    re1~
    re~
    re2 dod

    %30
    re r8 re re re
    la [sib16 do] re [do re mi] fa4 mi8 re
    mi!2 mi\mbreak

    %33
    r2 r8 do do do
    sib [sol16 la] sib [la sib do] re4 sib8 sol
    la4 re, re'2

    %36
    si1
    R1*4
    do8 re do la\mbreak sib4 sib8 sol

    %42
    la sib la fa sol2
    fa r
    R1*4

    %48
    re'8 mib re la si4 si
    R1
    r4 re\mbreak do8 sib la do

    %51
    do4. sib16 [la] sol2
    fa1

    %53 OOKK
    do'4 sib la la sol fa
    sol2 sol r
    re'4 do sib sib la sol\mbreak

    %56
    la2 la r
    r4 la si dod re2
    do? si1

    %59
    la r2
    R1.*3
    fa4 sol la la sib do

    %64
    re2 re r\mbreak
    r4 sib do re do2
    sib la1

    %67
    sol r2
    R1.*3
    r4 sol la do sib2

    %72
    la sol1
    fa re2
    fa do'1

    %75 OOKK
    la1
    R1*6
    r2 re

    %83
    do sib
    sol8 sib sol sib la2
    sol r4 do

    %86
    si2 do
    la8 do la do sol2
    fa4 fa\mbreak la8 fa la fa

    %89
    do'4. do8 sol2
    r4 sol sib8 sol sib sol
    re'4 mib re4. re8

    %92
    do1
    sol8 do sib la\mbreak sol4 sol
    R1

    %95
    re'8 sol fa mi re do sib la
    sol4 fa re2
    mi mi8 la sol fa

    %98
    mi4 mi r2\mbreak
    r re'8 sol fa mi
    re do sib la sol4 la~

    %101
    la fa fa2~
    fa mi
    fa1

    %104 inizia il 3/1 finale
    do'4 sib la la sol fa\mbreak
    sol2 sol r
    re'4 do sib sib la sol

    %107
    la2 la r
    r4 la si do re2
    do si1

    %110
    la r2
    R1.*3\mbreak
    fa4 sol la la sib do

    %115
    re2 re r
    r4 sib do re do2
    sib la1

    %118
    sol r2
    R1.*3
    r4 sol la do sib2\mbreak

    %123
    la sol1
    fa re2
    fa do'1

    %126
    la\breve\fermata

}

IVtestoI = \lyricmode {

    Buc -- ci -- na - - te in neo - me - - nia _ tu -- ba, buc -- ci -- na - - - te, buc -- ci -- na - - - te

    in neo - me - - nia _ tu -- ba, in neo - me - - nia _ tu - - ba

    in in -- signi _ di -- e so -- lem -- ni -- tatis _ ve -- strae,

    in in -- signi _ di -- e so -- lem -- ni -- tatis _ ve - - strae.

    Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja,

    Al - - - le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja,

    Al - - - le -- lu -- ja, Al - - - le -- lu -- ja, Al -- le -- lu -- ja.

    In vo -- ce ex -- ul -- ta -- ti -- o -- nis, in vo -- ce ex -- ul -- ta -- ti -- o -- nis,

    in vo -- ce tubae _ cor -- ne -- ae, in vo -- ce tubae _ cor - - ne -- ae

    ex -- ul -- ta -- te De -- o, ex -- ul -- ta -- te De -- o ad -- ju -- to -- ri no -- stro,

    ex -- ul -- ta -- te De -- o, ex -- ul -- ta -- te De -- o ad -- ju -- to - ri no - stro.

     Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja,

    Al - - - le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja,

    Al - - - le -- lu -- ja, Al - - - le -- lu -- ja, Al -- le -- lu -- ja.

}

IVtenoreIIn = \relative do' {

    \autoBeamOff
    R1*13
    fa,4 fa fa8.[sol16 fa8. sol16]
    la8.[sib16 la8. sib16] do2

    %16
    la r8 fa fa fa\mbreak
    do[re16 mi] fa[mi fa sol] la2~
    la4 sol8 fa sol2

    %19
    fa1
    R1*2
    sol4 sol sol8.[la16 sol8. la16]

    %23
    si8.[do16 si8. do16] re2
    do\mbreak r8 do do do
    sol[la16 si] do[si do re] mib4 re8 do

    %26
    re2 re
    R1
    la4 la la8.[si16 la8. si16]\mbreak

    %29
    dod8.[re16 dod8. re16] mi2
    re1
    R1*3

    %34
    r8 re re re sib[sol16 la] sib[la sib do]
    re4 do8 sib la2
    sol1

    %37
    R1*3\mbreak
    do8 re do la sib4 sib8 sol
    la sib la fa sol2

    %42
    fa r
    R1*4
    r2 la8 sib la mi

    %48
    fad4 fad r2\mbreak
    R1
    r4 sib la8 sol fa fa

    %51
    sol4. la16[sib] do2
    do1

    %53 3/2
    R1.
    sol4 fa mi mi re do
    re2 re r

    %56
    R1.
    r2 r4 mi fad sol
    la2. la4 sold2

    %59
    la1 r2
    R1.*3
    re,4 mi fa fa sol la

    %64
    sib2 sib r\mbreak
    r2 r4 re, mi fad
    sol2. sol4 fad2

    %67
    sol1 r2
    R1.*3
    r2 r4 mi fa sol

    %72
    fa2. fa4 mi2
    fa1 sol2
    re sol1

    %75 4/4
    fa1
    R1*8
    sol2 fad

    %85
    sol mib8 sol mib sol
    re2 do
    r2 r4 sol'

    %88
    la8 fa la fa do'4. do8
    sol2 r4 sol
    sib8 sol sib sol\mbreak re'4. do8

    %91
    si4 do2 si4
    do2 mi,8 la sol fa
    mi4 mi r2

    %94
    la8 re do sib la sol fa mi
    re4 dod re2~
    re4 mi8[fa]\mbreak sol2

    %97
    la1
    r2 fa8 sib la sol
    fa4 fa sib8 mib re do

    %100
    sib la sol fa mi2
    la4 sib2 sol4
    sol1

    %103
    fa

    %104 3/1 finale
    R1.
    sol4 fa mi mi re do
    re2 re r

    %107
    R1.
    r2 r4 mi fad sol
    la2. la4 sold2

    %110
    la1 r2
    R1.*3
    re,4 mi fa fa sol la

    %115
    sib2 sib r\mbreak
    r2 r4 re, mi fad
    sol2. sol4 fad2

    %118
    sol1 r2
    R1.*3
    r2 r4 mi fa sol

    %123
    fa2. fa4 mi2
    fa1 sol2
    re sol1

    %126
    fa\breve\fermata

}

IVtestoII = \lyricmode {

    Buc -- ci -- na - - te in neo - me - - nia _ tu -- ba, buc -- ci -- na - - te,

    in neo - me - - nia _ tu -- ba, buc -- ci -- na - - te in neo - me - - nia _ tu -- ba

    in in -- signi _ di -- e so -- lem -- ni -- tatis _ ve -- strae,

    in in -- signi _ di -- e so -- lem -- ni -- tatis _ ve - - strae.

    Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al -- le -- lu -- ja,

    Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al - - - le -- lu -- ja,

    Al -- le -- lu -- ja.

    In vo -- ce ex -- ul -- ta -- ti -- o -- nis,

    in vo -- ce tubae _ cor -- ne -- ae, in vo -- ce tubae _ cor - - - ne -- ae

    ex -- ul -- ta -- te De -- o, ex -- ul -- ta -- te De -- o ad -- ju -- to -- ri no - - stro,

    ex -- ul -- ta -- te De -- o, ex -- ul -- ta -- te De -- o ad -- ju -- to - - ri no -- stro.

     Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al -- le -- lu -- ja,

    Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al - - - le -- lu -- ja,

    Al -- le -- lu -- ja.

}

IVbasson = \relative do {

    \autoBeamOff
    R1*20
    r2 do4 do
    do8.[re16 do8. re16] mi8.[fa16 mi8. fa16]

    %23
    sol2 sol,
    do1
    R\mbreak

    %26
    sol'4 sol sol2
    sol, re'4 re
    re8.[mi16 re8. mi16] fa8.[sol16 fa8. sol16]

    %29
    la2 la,
    re1
    R1*2

    %33
    r8 do do do\mbreak sol8[do16 re] mi[re mi fa]
    sol2. fa8 mi
    re1

    %36
    sol,
    R1*5
    fa'8 sol fa re mib4 mib8 do

    %43
    re mib re sib\mbreak do2
    sib r
    R1*3

    %48
    r2 sol'8 la sol re
    mi!4 mi r2
    r4 re fa8 fa fa fa,

    %51
    do'1
    fa,

    %53
    R1.*3\mbreak  %%% Inizia 3/1
    fa'4 mi re re do sib
    la2 la4 la re mi

    %58
    fa2 re mi
    la,1 r2

    %60
    R1.*4\mbreak
    sib4 do re re mi fad
    sol2 sol4 sol, do re

    %66
    mib2 do re
    sol,1 r2
    R1.*3

    %71
    r2 r4 do re mi\mbreak
    fa2 sib, do
    fa,1 sib2

    %74
    sib do1
    fa,1 %%% 4/4
    r2 fa'

    %77
    mi fa
    re8 fa re fa mi2
    re4 sol,\mbreak sib8 sol sib sol

    %80
    re'4. re8 sol,4 re'
    fa8 re fa re la'4. la8
    re,4 sib re8 sib re sib

    %83
    fa'4. fa8 sib,2
    R1*2\mbreak
    r2 r4 fa

    %87
    la8 fa la fa do'4. do8
    fa,2 r
    r4 do' mib8 do mib do

    %90
    sol'1~
    sol2 sol
    do,\mbreak do8 fa mi re

    %93
    do4 do r2
    fa8 sib la sol fa mi re do
    sib4 la sib2~

    %96
    sib1
    la
    r2 re8 sol fa mi\mbreak

    %99
    re do sib la sol2~
    sol4 la8 [sib] do2
    re sib

    %102
    do1
    fa,
    R1.*3\mbreak  %%% Inizia 3/1

    %107
    fa'4 mi re re do sib
    la2 la4 la re mi
    fa2 re mi

    %110
    la,1 r2
    R1.*4\mbreak
    sib4 do re re mi fad

    %116
    sol2 sol4 sol, do re
    mib2 do re
    sol,1 r2

    %119
    R1.*3
    r2 r4 do re mi\mbreak
    fa2 sib, do

    %124
    fa,1 sib2
    sib do1
    fa,\breve\fermata

}

IVtestoIII = \lyricmode {

    Buc -- ci -- na - - - te, buc -- ci -- na -- te, buc -- ci -- na - - - te

    in neo - me - - nia _ tu -- ba

    in in -- signi _ di -- e so -- lem -- ni -- tatis _ ve -- strae,

    in in -- signi _ di -- e so -- lem -- ni -- tatis _ ve -- strae.

    Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al -- le -- lu -- ja,

    Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al - - - le -- lu -- ja,

    Al -- le -- lu -- ja.

    In vo -- ce ex -- ul -- ta -- ti -- o -- nis,

    in vo -- ce tubae _ cor -- ne -- ae, in vo -- ce tubae _ cor -- ne -- ae, in vo -- ce tubae _ cor -- ne -- ae,

    in vo -- ce tubae _ cor -- ne -- ae, in vo -- ce tubae _ cor -- ne -- ae

    ex -- ul -- ta -- te De -- o, ex -- ul -- ta -- te De -- o ad -- ju -- to -- ri no -- stro,

    ex -- ul -- ta -- te De -- o ad -- ju -- to - - - ri no -- stro.

     Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al -- le -- lu -- ja,

    Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al - - - le -- lu -- ja,

    Al -- le -- lu -- ja.

}

IVbcn = \relative do {

    fa,1
    fa2 fa
    fa fa~

    %4
    fa fa4 mi8 re
    do1
    fa2 fa4 fa

    %7
    fa4. sol8 la4. sib8
    do1
    do

    %10
    do
    do\mbreak
    do2~do8 do do do

    %13
    sol4 fa do'2
    fa,1
    fa2 fa

    %16
    fa fa~
    fa fa4 mi8 re
    do1

    %19
    fa~
    fa2 fa
    fa4. sol8 la4. sib8\mbreak

    %22
    do2. sib8 la
    sol1
    do,

    %25
    do'
    sol2 sol
    sol4. la8 sib4. do8

    %28
    re2. do8 sib
    la1
    re,2 re

    %31
    re'1
    la2 do\mbreak
    do sol8 do do do

    %34
    sol2. fa8 mi
    re1
    sol

    %37
    \clef violin \key fa\major do''2 re
    do re
    \clef bass\key fa\major do,,8 re do la sib4 sib8 sol\mbreak

    %40
    la sib la fa sol2
    fa sol'
    fa8 sol fa re mib4 mib8 do

    %43
    re  mib re sib do2
    sib fa'8 sol fa re
    mi!4 mi8 do\mbreak re4. re8

    %46
    do4 do8 do re4. re8
    la4 re, la'2
    re,  sol

    %49
    do  la
    sib \parenthesize fa
    do'1

    %52
    fa,

    %53 OOKK 3/1
    fa'1 re2
    do1 la2\mbreak
    sol1 mib'2

    %56
    re1 sib2
    la2. la4 re mi
    fa2 re mi

    %59
    la,1 sol2
    fa'4 mi re do sib sol
    fa2 fa4 re sol la\mbreak

    %62
    sib2 sol la
    re1 do2
    sib re mi4 fad

    %65
    sol2 sol4 sol, do re
    mib2 do re
    sol,1 sol2

    %68
    do,4 re mi sol la si\mbreak
    do2 do4 do, fa sol
    la2 fa sol

    %71
    do,2. do'4 re mi
    fa2 sib, do
    fa,1 sib2~

    %74
    sib do1

    %75 OOKK 4/4
    fa,1
    r2 fa'^\markup\italic "a 3"
    mi fa

    %78
    re la
    re4 sol, sib8 sol sib sol
    re'4. re8 sol,4 re'

    %81
    fa8 re fa re la'4. la8\mbreak
    re,4 sib re8 sib re sib
    fa'4. fa8 sib,2

    %84
    mib4 sol re2
    sol, do,
    sol' do,4 fa

    %87
    la8 fa la fa do'4. do8\mbreak
    fa,1
    do'2 mib8 do mib do

    %90
    sol'1
    sol
    do,2 do8 fa mi re

    %93
    do2 do
    fa8 sib la sol fa mi re do
    sib4 la\mbreak sib2~

    %96
    sib~ sib
    la1~
    la2 re8 sol fa mi

    %99
    re do sib la sol2~
    sol4 la8 sib do2
    re sib

    %102
    do1
    fa,

    %104
    fa'1 re2 %%% inizia il 3/2 OOKK
    do1 la2\mbreak
    sol1 mib'2

    %107
    re1 sib2
    la2. la4 re mi
    fa2 re mi

    %110
    la,1 sol2
    fa'4 mi re do sib sol
    fa2 fa4 re sol la\mbreak

    %113
    sib2 sol la
    re1 do2
    sib re mi4 fad

    %116
    sol2 sol4 sol, do re
    mib2 do re
    sol,1 sol2

    %119
    do,4 re mi sol la si\mbreak
    do2 do4 do, fa sol
    la2 fa sol

    %122
    do,2. do'4 re mi
    fa2 sib, do
    fa,1 sib2~

    %125
    sib do1
    fa,\breve\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*22
    <4>2 <[3+]>
    s1
    <_->
    s1*3
    <4>2 <[3+]>
    <_+>1
    <_->
    s1*3
    <[3+]>4 <4>2 <[3+]>4
    <_+>1
    s1*6
    s2 <_->
    s1
    <6>
    s
    <_+>2 <4>4 <[3+]>
    <_+>2 <_+>
    s <6>
    s1
    <3>4 <4>2 <3>4
    s1
    s1.*4   %%% alleluia
    <_+>1 <_+>2
    s1 <_+>2
    s1.*2
    s1 <_+>2
    s1 <_+>2
    s1.*2
    s1 s4 <_+>
    s1 <_+>2
    <_+>1.
    s1.
    s1 s4 <[_+]>
    s1 <_+>2
    s1 <6>2
    s1.*3
    s1*2 %%% 4/4
    <6>1
    s2 <_+>
    s1
    <_+>
    s2 <_+>
    s1*2
    s2 <_+>
    s <_->
    <_+>1
    s1*4
    <[3+]>4 <4>2 <[3+]>4
    s1*3
    <5>8 <6> <6> <5> s2
    <6>4 <5> <6>2
    <_+>1
    s
    s
    s2 <5>4 <6>
    <5> <6> <5> <6>
    <4>2 <3>
    s1
    s1.*4   %%% alleluia
    <_+>1 <_+>2
    s1 <_+>2
    s1.*2
    s1 <_+>2
    s1 <_+>2
    s1.*3
    s1 <_+>2
    <_+>1.
    s1.
    s1 s4 <[_+]>
    s1 <_+>2
    s1 <6>2

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 60
    s1*52\break
    \time 3/2
    \tempo 1 = 80
    s1.*22\break
    \time 4/4
    \tempo 2 = 60
    s1*29\break
    \time 3/2
    \tempo 1. = 60
    s1.*22
    \time 4/4
    s\breve
    \bar "|."

}

IVvlI = {
    \notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVfg = {
    <<\IVfgn \forma>>

}

IVtenoreI = {
    \new Voice = "buccinate1"
    <<\IVtenoreIn \forma>>
}

IVtenoreII = {
    \new Voice = "buccinate2"
    <<\IVtenoreIIn \forma>>
}

IVbasso = {
    \clef bass
    \new Voice = "buccinate3"
    <<\IVbasson \forma>>
}

IVbc = {
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

    r2 la8 si do la
    si do re si do4 do
    fa8 sol la fa sol la sib sol

    %4
    la4 fa\mbreak r la
    sol fa8 fa mi4. mi8
    re2 r

    %7
    R1
    la8 si do la si do re si
    do2 sol4 sol'

    %10
    fa mi8 mi\mbreak re4. re8
    do2 r
    R1*2

    %14
    r2 re8 mi fa re
    mi fa sol mi fa4 fa8 fa
    mi4 re8 re re4. dod8

    %17
    re2 r
    R1*2\mbreak
    do8 re mi do re mi fa re

    %21
    mi4 mi r la
    sol fa8 fa mi4 re
    la4. la8 la2

    %24
    R1*2
    r2 r4 sol'
    fa mi8 mi\mbreak re4 do~

    %28
    do si do2
    r4 sol' mi8 [mi16 mi mi8 do]
    sol4 sol' mi8 [mi16 mi mi8 do]

    %31
    do4 do' la8 [la16 la la8 fa]\mbreak
    do4 do' la8[la16 la la8 fa]
    mi do do la' sol mi mi fa

    %34
    mi do do re mi fa16 mi fa mi re mi
    fa1
    r2 r4 la\mbreak

    %37
    sol8 mi mi fa mi do do la'
    sol mi mi fa sol la16 sol la sol fa sol
    la1

    %40
    r4 fad fad fad~
    fad8 la la mi la2\mbreak
    r4 re, re4. re8

    %43
    re1
    R1*4
    fa4^\markup\italic "Sinfonia" fa fa4. do8

    %49
    mi fa mi4 mi4. si8
    dod4 re dod si\mbreak
    dod4. dod8 dod2

    %52
    r4 la'4. la8 la4
    sol sol fa2
    mi r4 fa~

    %55
    fa8 fa fa4 fa mi
    re4. mi8 fa2

    %57  %% inizia il 3/1
    \footnote #' (+1 . 2) \markup\column\smaller {"Nell'edizione antica 3/1""  "} fa1 r2
    R1.*6
    la,4 sib do do re mi

    %65
    fa2 fa r
    r2 r4 la, si do
    re2. re4 dod2\mbreak

    %68
    re1 r2
    R1.*3
    re4 do si si do re

    %73
    mi2 mi r
    r r4 sol, la si
    do2. do4 si2\mbreak

    %76
    do1 r2
    R1.
    fa,4 sol  la sib do re

    %79
    mi1 r2
    sol,4 la sib do re mi
    fa1 r2

    %82
    la,4 si do re mi fa\mbreak
    sol2. fa4 mi2
    re1 dod2

    %85 4/4
    re1
    r4 la' la la
    la2 r

    %88
    R1
    r4 fa fa fa
    mi8 fa sol la re,4. do8\mbreak

    %91
    si8 do re2 dod4
    re8 la si do? re mi fa sol
    la2 r8 fa sol la

    %94
    sol4 fa fa2~
    fa mi
    fa\longa

}

VvlIIn = \relative do'' {

    r2 do8 re mi do
    re mi fa re mi4 mi
    re8 mi fa re mi fad sol mi

    %4
    fa?4 la4. sol8 fa4
    mi re r2\mbreak
    R1

    %7
    re8 mi fa re mi fad sol mi
    fad2 sol4 sol
    fa mi8 mi re4. re8

    %10
    do2 r
    R1*2
    do8 re mi do re mi fa re

    %14
    mi4 mi fa8 sol la fa\mbreak
    sol la sib sol la4 la8 la
    sol4 fa mi4. mi8

    %17
    re2 r
    R1*3
    do8 re mi do re mi fa re

    %22
    mi4 la sol fa8 fa
    mi4. mi8 re2
    R1*3

    %27
    r4 sol\mbreak fa mi8 mi
    re4. re8 do4 sol'
    mi8 [mi16 mi mi8 do] sol4 sol'

    %30
    mi8 [mi16 mi mi8 do] sol4 do'
    la8 [la16 la sol8 fa] do4 do'
    la8 [la16 la sol8 fa] do4 la'\mbreak

    %33
    sol8 mi mi fa mi do do la'
    sol mi mi fa sol la16 sol la sol fa sol
    la1

    %36
    r2 r4 fa
    mi8 do do la' sol mi mi fa
    mi do do re\mbreak mi4. re16 mi

    %39
    fa4. mi16 re do2
    r4 la' la la~
    la8 fad fad la fad4 fad~

    %42
    fad sol fad4. fad8
    sol1
    R1*4

    %48
    r4 la la la~
    la8 fa sol la sol4 sol\mbreak
    r re mi fa

    %51
    mi4. mi8 mi2
    r4 do4. do8 do4
    do sol do2

    %54
    do r4 la'4~
    la8 la la4 la la
    fa4. mi8 re2

    %57 inizia 3/2
    la'1 r2
    R1.*6
    do,4 re  mi mi fa sol

    %65
    la2 la r
    r4 fa sol la sol2\mbreak
    fa2 mi1

    %68
    re r2
    R1.*3
    sol,4 sol re' re mi fad

    %73
    sol2 sol r
    r4 re mi sol fa2
    mi re1

    %76
    do r2
    R1.
    fa2 fa fa

    %79
    sol1 r2
    sol2 sol sol
    la1 r2

    %82
    la2 la la
    si4 sol la si do2
    la2 sol1

    %85 4/4
    fad1
    r4 fa? fa fa
    mi2 r

    %88
    R1\mbreak
    r4 la la la
    la2 r8 fad? sol la

    %91
    sol4. fa8 mi2
    re4 re8 mi fa sol la si
    do2 r8 la sib? do

    %94
    sib2 la
    sol1
    <<la\longa\\do,\fermata>>

}

Vfgn = \relative do {

    do8 re mi do fa4 mi
    re2 do4 do
    sib la sol2

    %4
    fa fa8 sol la fa
    sol la sib sol la2
    R1*8

    %14
    r4 do sib la8 la\mbreak
    sol4. sol8 fa2
    R1*5

    %21
    r4 la sol fa8 fa
    mi4 re sol2
    la re,

    %24
    R1*2
    r4 sol fa mi8 mi
    re4 do fa2

    %28
    sol do,\mbreak
    do'1
    do

    %31
    fa,~
    fa2 fa
    do1~

    %34
    do
    fa~
    fa2 fa

    %37
    do1~
    do
    fa

    %40
    r4 re' re re~
    re4 re8 dod re4 re~
    re sol, re4. re8

    %43
    sol1
    R1*4\mbreak
    re'4 re re4. la8

    %49
    do re do4 do4. sol8
    la4 sib la sol
    la4. la8 la2

    %52
    r4 la4. la8 la4
    mi' mi fa2
    do\mbreak r4 re~

    %55
    re8 re re4 la la
    sib1

    %57 3/2
    fa1 r2
    R1.*7
    fa'4 mi re do sib sol

    %66
    fa2 fa4 re sol la
    sib2 sol la
    re,1 r2

    %69
    R1.*4\mbreak
    do4 re mi sol la si
    do2 do4 do, fa sol

    %74
    la2 fa sol
    do,1 r2
    R1.

    %77
    fa2 fa fa
    do1 r2
    sol'2 sol sol

    %80
    re1 r2
    la'2 la la\mbreak
    mi2 fa4 sol la2

    %84
    fa mi1

    %85 4/4
    re1
    r4 re re re
    la'2 r

    %88
    R1
    r4 re, re re
    la'2 r8 re  mi fad\mbreak

    %91
    sol4 sol, la2
    re,4 re re re
    la'1

    %94
    sib2. sib4
    do1
    fa,\longa

}

VtenoreIn = \relative do' {

    \autoBeamOff

    R1*3
    r2 la8 si do la
    si do re si dod2\mbreak

    %6
    re r4 la
    sol fa8 fa mi4. mi8
    re2 sol8 la si sol\mbreak

    %9
    la si do la si2
    do r
    do8 re mi do re mi fa re

    %12
    mi2 re
    la8 si do la\mbreak si do re si
    do4 do r2

    %15
    R1*2
    r4 re do sib8 sib
    la4. la8 sol2

    %19
    la8 si do la\mbreak si do re si
    do4 do r2
    R1

    %22
    r2 si8 do re si
    dod re mi dod re4 re
    r re\mbreak do? sib8 sib

    %25
    la4 sol2 fad4
    sol2 r
    R1

    %28
    r2 r4 do
    do8 sol sol4 r2
    r4 do do8 sol sol4

    %31
    r do\mbreak do8 la la4
    r2  r4 do
    do8 sol sol do do sol sol la

    %34
    do4. sib16 [la] sol2
    fa r4 do'\mbreak
    do8 la la do do la la4

    %37
    R1
    r4 do do2
    do1

    %40
    r4 re re re~
    re8 re re mi re4 la~
    la sol la4. la8

    %43
    si1\mbreak
    r4 re re re4~
    re8 sib do re do4 do

    %46
    r sol la sib
    la4. la8 la2
    R1*4

    %52
    r4 mi'!4. mi8 mi4
    mi mi\mbreak do2
    do r4 la4~

    %55
    la8 la la4 la la
    re1

    %57 3/2 OOKK
    do1 r2
    do4 sib la la sol fa
    sol2 sol r

    %60
    re'4 do sib sib la sol\mbreak
    la2 la r
    r4 la si dod? re2

    %63
    do? si1
    la r2
    R1.*3

    %68
    fa4 sol la la sib do
    re2 re r\mbreak
    r4 sib do re do2

    %71
    sib la1
    sol r2
    R1.*3

    %76
    r4 sol la do sib2
    la sol1
    fa r2

    %79
    do'2 do do\mbreak
    re1.
    re2 re re

    %82
    mi1.
    R1.*2

    %85 4/4
    R1
    r4 re re re
    mi8 do [re mi] re4 do

    %88
    si8 [do] re2 dod4\mbreak
    re re re re
    mi2 r

    %91
    R1
    r4 re re re
    mi8 do re mi la,2

    %94
    r2 r8 sib [do re]\mbreak
    sol,4 do do2
    do\longa

}

VtestoI = \lyricmode {

    Ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o in chor -- dis et or -- gano, _

    ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o, ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o,

    ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o in chor -- dis et or -- gano, _

    ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o,  ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o

    in chor -- dis et or - ga -- no,  in tympano, _ _ in tympano, _ _ in tympano, _ _ in tympano, _ _

    in tympano _ _ et cho - - ro, in tympano, _ _  in tympano _ _ et cho -- ro.

    Can -- ta -- te et ex -- ul -- ta -- te et psal -- li -- te,  can -- ta -- te et ex -- ul -- ta -- te et psal - - li -- te,

    psal -- li -- te sa -- pi -- en -- ter, psal -- li -- te sa -- pi -- en -- ter.

    Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja,

    Al - - - le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja,

    Al - - - le -- lu -- ja, Al - - - le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja,  %%fine 3/2 OOKK

    Al -- le -- lu -- ja,  Al - le -- lu - - ja,  Al -- le -- lu -- ja,  Al -- le -- lu -- ja,

    Al -- le -- lu -- ja, Al - le -- lu -- ja.

}

VtenoreIIn = \relative do' {

    \autoBeamOff
    R1*4
    r2 la8 si dod la
    si do? re si dod2

    %7
    re r
    R1
    r2 sol,8 la si sol\mbreak

    %10
    la si do la si2
    do r
    la8 si do la si do re si

    %13
    do4 do r2
    R1*3
    r4 sib la sol8 sol

    %18
    sol4. fad8 sol2
    R1
    la8 si do la si do re si

    %21
    do4 do r2
    R1\mbreak
    r2 fa,8 sol la fa

    %24
    sol la sib sol la4 re,8 re'
    do4 sib8 sib la4. la8
    sol2 r

    %27
    R1*2
    r4 do do8 sol sol4
    r2 r4 do\mbreak

    %31
    do8 la la4 r do
    do8 la la do do la la4
    R1

    %34
    r2 r4 do
    do8 la  la do do la la4
    r2 r4 do\mbreak

    %37
    do8 sol sol do do sol sol la
    do4. sib16[la] sol2
    fa r4 la

    %40
    la la4.re,8 fad sol
    la4 la2 re4\mbreak
    la sib la4. la8

    %43
    sol1
    sib4 sib sib4. fa8
    la sib la4 la4. mi8

    %46
    fad4 sol fad mi
    fad4. fad8 fad2\mbreak
    R1*4

    %52
    r4 do'4. do8 do4
    do sib la2
    sol r4 re'4~

    %55
    re8 re re4 do do
    sib1
    sib1 r2

    %58
    R1.
    sol4 fa mi mi re do
    re2 re r

    %61
    R1.
    r2 r4 mi fad sol
    la2. la4 sold2

    %64
    la1 r2
    R1.*3
    re,4 mi fa fa sol la

    %69
    sib2 sib r\mbreak
    r2 r4 re, mi fad
    sol2. sol4 fad2

    %72
    sol1 r2
    R1.*3
    r2 r4 mi fa sol

    %77
    fa2. fa4 mi2
    fa1 r2
    do4 re mi fa sol la

    %80
    sib2 sib r
    re,4 mi fa sol la si
    do2 do r

    %83
    R1.*2

    %85 %4/4
    R1
    r4 re,8 mi fa sol la si
    do2 la8 fad? [sol la]

    %88
    sol4. fa?8 mi2
    re4 re8 mi fa sol la si\mbreak
    do4 do r2

    %91
    R1
    r4 fa, fa fa
    mi8 la [sib do] fa,4 mi

    %94
    re1
    sol
    fa\longa

}

VtestoII = \lyricmode {

    Ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o

    ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o,

    ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o in chor -- dis et or -- gano, _

    ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o,  ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o

    in chor -- dis et or -- ga -- no,  in tympano, _ _ in tympano, _ _ in tympano, _ _ in tympano, _ _

    in tympano _ _ in tympano, _ _  in tympano, _ _ in tympano _ _ et cho - - ro.

    Can -- ta -- te et ex -- ul -- ta -- te et psal - - li -- te,  can -- ta -- te et ex -- ul -- ta -- te et psal - - - - li -- te,

    psal -- li -- te sa -- pi -- en -- ter, psal -- li -- te sa -- pi -- en -- ter.

    Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al -- le -- lu -- ja,

    Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al - - - le -- lu -- ja,

    Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja,  %%% fine 3/2

    Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al - le -- lu -- ja,

    Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja,

    Al - le -- lu - ja.

}

Vbasson = \relative do {

    \autoBeamOff
    R1*5
    r2 la8 si dod? la
    si do re si dod2

    %8
    re r
    R1
    r2 sol8 la si sol\mbreak

    %11
    la si do la si2
    do r4 sol
    fa mi8 mi re4. re8

    %14
    do2 r
    r fa8 sol la fa
    sol la sib sol la4 la\mbreak

    %17
    sib,8 do re sib do re mib do
    re4 re mi?8 fa sol mi
    fa sol la fa sol4 sol8 sol

    %20
    fa4 mi8 mi re4. re8
    do2 r\mbreak
    R1

    %23
    r2 r4 re
    do sib8 sib la4 sol
    do2 re

    %26
    sol, r
    R1*2
    r2 r4 sol'

    %30
    sol8 mi mi4 r2
    r r4 fa\mbreak
    fa8 do do re re do do4

    %33
    r2 do
    do1
    fa,2 r4 fa'

    %36
    fa8 do do fa fa do do4
    r2 do
    do1

    %39
    fa,\mbreak
    r4 re' re re~
    re8 re re dod re4 re~

    %42
    re sol, re'4. re8
    sol,1
    sol'4 sol sol4. re8

    %45
    fad sol fa4 fa4. do8\mbreak
    re4 mib re do
    re4. re8 re2

    %48
    R1*4
    r4 la'4. la8 la4
    mi mi fa2

    %54
    do r4 re~
    re8 do re4 la la
    sib1\mbreak

    %57 3/2 OOKK
    fa1 r2
    R1.*3
    fa'4 mi re re do sib

    %62
    la2 la4 la re mi
    fa2 re mi
    la,1 r2

    %65
    R1.*4\mbreak
    sib4 do re re mi fad
    sol2 sol4 sol, do re

    %71
    mib2 do re
    sol,1 r2
    R1.*3

    %76
    r2 r4 do re mi\mbreak
    fa2 sib, do
    fa,1 r2

    %79
    do'2 do do
    sol1 r2
    re'2 re re

    %82
    la1 r2
    R1.*2
    R1

    %86
    r4 re re re
    la2 r8 re [mi fa]\mbreak
    sol4 sol, la2

    %89
    re,4 re' re re
    do2 r
    R1

    %92
    r4 re re re
    la1
    sib2. sib4

    %95
    do1
    fa,\longa

}

VtestoIII = \lyricmode {

    Ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o

    ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o in chor -- dis et or -- gano, _

    ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o,  ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o,

    ju -- bi -- la -- te, ju -- bi -- la -- te  De -- o

    in chor -- dis et or -- ga -- no,   in chor -- dis et or - - ga -- no,

    in tympano, _ _ in tympano, _ _ in tympano _ _ et cho -- ro, in tympano, _ _ in tympano _ _ et cho -- ro.

    Can -- ta -- te et ex -- ul -- ta -- te et psal  -- li -- te,  can -- ta -- te et ex -- ul -- ta -- te et psal - - - - li -- te,

    psal -- li -- te sa -- pi -- en -- ter, psal -- li -- te sa -- pi -- en -- ter.

    Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al -- le -- lu -- ja,

    Al -- le -- lu -- ja, Al - - - le -- lu -- ja, Al - - - le -- lu -- ja,

    Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al -- le -- lu -- ja, Al - le -- lu -- ja, Al -- le -- lu -- ja,

    Al -- le -- lu -- ja, Al -- le -- lu -- ja.

}

Vbcn = \relative do {

    do8 re mi do fa4 mi
    re2 do
    sib4 la sol2

    %4
    fa fa
    sol la
    sol' la,8 si dod? la\mbreak

    %7
    si do? re si dod!2
    re \clef tenor \key fa\major sol8 la si sol
    la si do la sol la si sol\mbreak

    %10
    la si do la \clef bass \key fa\major sol8 la si sol
    la si do la sol2
    la sol4 sol

    %13
    fa mi8 mi re2\mbreak
    do4 do sib la
    sol2 fa

    %16
    sol la
    sib do8 re mib do
    re2 mi?8 fa sol mi

    %19
    fa sol la fa\mbreak sol2
    fa4 mi re2
    do4 la sol fa

    %22
    mi re sol2
    la re,4 re'
    do sib la sol

    %25
    do2 re\mbreak
    sol,4 sol fa mi
    re do fa2

    %28
    sol do,
    do1~
    do

    %31
    fa~
    fa2 fa
    do1~

    %34
    do
    fa~
    fa2 fa

    %37
    do1~
    do
    fa

    %40
    r4 re' re re~
    re re8 dod\mbreak re4 re~
    re sol, re'2

    %43
    sol,1
    sol'4 sol sol4. re8
    fa sol fa4 fa4. do8

    %46
    re4 mib re do\mbreak
    re4. re8 re2
    re4 re re4. la8

    %49
    do re do4 do4. sol8
    la4 sib la sol
    la4. la8 la2\mbreak

    %52
    r4 la4. la8 la4
    mi' mi fa2
    do r4 re4~

    %55
    re8 re re4 la la
    sib1

    %57
    fa1 r2
    fa'1 re2
    do1 la2

    %60
    sol1 mib'2
    re1 sib2
    la2. la4 re mi

    %63
    fa2 re mi
    la,1 sol2
    fa'4 mi re do sib sol

    %66
    fa2 fa4 re sol la\mbreak
    sib2 sol la
    re1 do2

    %69
    sib re mi4 fad
    sol2 sol4 sol, do re
    mib2 do re

    %72
    sol,1 sol2
    do,4 re mi sol la si\mbreak
    do2 do4 do, fa sol

    %75
    la2 fa sol
    do,2. do'4 re mi
    fa2 sib, do

    %78
    fa, fa fa
    do1 do2
    sol' sol sol

    %81
    re1 re2
    la' la la\mbreak
    mi fa4 sol la2

    %84
    fa mi1

    %85 4/4
    re1
    r4 re' re re
    la2 re

    %88
    sol, la
    re,4 re' re re\mbreak
    la2 re

    %91
    sol, la
    re,4 re' re re
    la1

    %94
    sib
    do
    fa,\longa

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 s4 <6>
    <[6+]>1
    s4 <6> <6>2
    s1
    <6>4 <5> <_+>2
    <_+>1
    <6>
    <_+>
    <6> s
    s2 <_+>
    s <_+>4 <_+>
    s <6> <6>2
    s s4 <6>
    <6>1
    <6>4 <5> <4> <[3+]>
    s2 <6>
    <4>4 <[3+]> s2
    s <_+>
    s4 <6> <[6+]>2
    s2 s4 <6>
    s2 <6>4 <5>
    <_+>1
    s
    <6>4 <5> <4> <_+>
    s1
    s2 <6>4 <5>
    <4> <[3+]> s2
    s1*11
    s4 <_+> s2
    s4 s8 <6> <_+>2
    s <_+>
    s1*2
    <6>4 <5>8 <6> s2
    <_+>4 s <_+>2
    <_+> <_+>
    s1
    <6>4 <5>8 <6> s2
    <_+> <_+>4 <_+>
    <_+>1
    s4 <_-> s2
    s1*4
    s1.*5
    <_+>1.
    s1 <_+>2
    s1.*2
    s1 <_+>2
    s1 <_+>2
    s1.*2 s1 s4 <_+>
    s1 <_+>2
    <_+>1.
    s1.*2
    s1 <_+>2
    s1 <6>2
    s1.*6
    s2 s4 <_+> s2
    <6>2 <7> <[6+]>
    <_+>1
    s4 <[_-]> s2
    <_-> <_+>
    <_+> <4>4 <[3+]>
    s1
    <_->2 <_+>
    <_+> <4>4 <[3+]>
    s1
    <5>2 <6>
    <6> <5>
    <4> <3>

}


forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 60
    s1*56\break
    \time 3/2
    \tempo 1 = 80
    s1.*28\break
    \time 4/4
    \tempo 2 = 60
    s1*11
    s\longa
    \bar "|."

}

VvlI = {
    %\notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}

Vfg = {
    <<\Vfgn \forma>>

}

VtenoreI = {
    \new Voice = "jubilate1"
    <<\VtenoreIn \forma>>
}

VtenoreII = {
    \new Voice = "jubilate2"
    <<\VtenoreIIn \forma>>
}

Vbasso = {
    \clef bass
    \new Voice = "jubilate3"
    <<\Vbasson \forma>>
}

Vbc = {
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
        title = \markup \smaller "XVI. In lectulo per noctes [SWV 272]"
        composer = \markup \center-column{"H. Schütz (1585-1672"}
    }

    \markup\huge\bold\column\left-align {"                     Prima Pars""  "}

    \score {

        <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Fagotto [I]"\vspace #-0.2"o Viola"}
                \set Staff.midiInstrument = #"bassoon"
                \IfgI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef varbaritone \key fa\major\time 4/4  sol4^\markup\center-align {"Fagotto [II]"}_\markup\center-align{"o Viola"} sol}
                \clef bass
                \set Staff.midiInstrument = #"bassoon"
                \IfgII\global
            >>

            \new Staff <<
                \IfgIII\global
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Fagotto [III]"\vspace #-0.2"o Viola"}
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key fa\major\time 4/4  r1 ^\markup\center-align {"Cantus"} }
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Isoprano\global
                    \new Lyrics \lyricsto "lectulo1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key fa\major\time 4/4  r1 ^\markup\center-align {"Altus"} }
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Ialto\global
                    \new Lyrics \lyricsto "lectulo2" \ItestoII
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

            %#(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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
        title = \markup \smaller "XVII. Invenerunt me custodes civitatis [SWV 273]"
        composer = \markup \center-column{"H. Schütz (1585-1672"}
    }

    \markup\huge\bold\column\left-align {"                     Secunda Pars""  "}

    \score {

        <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Fagotto [I]"\vspace #-0.2"o Viola"}
                \set Staff.midiInstrument = #"bassoon"
                \IIfgI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef varbaritone \key fa\major\time 4/4  sib4^\markup\center-align {"Fagotto [II]"}_\markup\center-align{"o Viola"} sib}
                \clef bass
                \set Staff.midiInstrument = #"bassoon"
                \IIfgII\global
            >>

            \new Staff <<
                \IIfgIII\global
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.instrumentName = \markup \center-column{"Fagotto [III]"\vspace #-0.2"o Viola"}
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key fa\major\time 4/4  r1 ^\markup\center-align {"Cantus"} }
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIsoprano\global
                    \new Lyrics \lyricsto "invenerunt1" \IItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key fa\major\time 4/4  r1 ^\markup\center-align {"Altus"} }
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIalto\global
                    \new Lyrics \lyricsto "invenerunt2" \IItestoII
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

            %#(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #3
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup \smaller "XVIII. Veni, dilecte mi, in hortum meum [SWV 274]"
        composer = \markup \center-column{"H. Schütz (1585-1672"}
    }

    \score {

        <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Trombone [I]"}
                \set Staff.midiInstrument = #"trombone"
                \IIItbI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Trombone [II]"}
                \set Staff.midiInstrument = #"trombone"
                \IIItbII\global
            >>

            \new Staff <<
                \IIItbIII\global
                \set Staff.midiInstrument = #"trombone"
                \set Staff.instrumentName = \markup \center-column{"Trombone [III]"}
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major\time 4/4  r1 ^\markup\center-align {"Cantus [I]"} }
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIIsopranoI\global
                    \new Lyrics \lyricsto "veni1" \IIItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major\time 4/4  r1 ^\markup\center-align {"Cantus [II]"}}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIIsopranoII\global
                    \new Lyrics \lyricsto "veni2" \IIItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major\time 4/4  r1 ^\markup\center-align {"Tenor"} }
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIItenore\global
                    \new Lyrics \lyricsto "veni3" \IIItestoIII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassus"\vspace #-0.2"Pro Organo"\vspace #-0.2"Tiorba"}
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15.5)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #3
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup \smaller "XIX. Buccinate in neomenia tuba [SWV 275]"
        composer = \markup \center-column{"H. Schütz (1585-1672"}
    }

    \markup\huge\bold\column\left-align {"                     Prima Pars""  "}

    \score {

        <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Cornetto [I]"}
                \set Staff.midiInstrument = #"trumpet"
                \IVvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Trombetta"\vspace #-0.2"Cornetto [II]"}
                \set Staff.midiInstrument = #"trumpet"
                \IVvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef subbass \key fa\major\time 4/4  r1^\markup\center-align {"Fagotto"}  }
                \clef bass
                \set Staff.midiInstrument = #"bassoon"
                \IVfg\global
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key fa\major\time 4/4  fa ^\markup\center-align {"Tenor Primo"} fa }
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVtenoreI\global
                    \new Lyrics \lyricsto "buccinate1" \IVtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key fa\major\time 4/4 r1^\markup\center-align {"Tenor Secondo"}  }
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVtenoreII\global
                    \new Lyrics \lyricsto "buccinate2" \IVtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVbasso\global
                    \new Lyrics \lyricsto "buccinate3" \IVtestoIII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef subbass \key fa\major\time 4/4  fa,1^\markup\center-align {"Bassus"} _\markup\center-align{"Pro Organo"}  }
                \clef bass
                \set Staff.midiInstrument = #"contrabass"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15.5)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #3
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
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

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup \smaller "XX. Jubilate Deo in chordis [SWV 276]"
        composer = \markup \center-column{"H. Schütz (1585-1672"}
    }

    \markup\huge\bold\column\left-align {"                     Secunda Pars""  "}

    \score {

        <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Cornetto [I]"}
                \set Staff.midiInstrument = #"trumpet"
                \VvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Trombetta"\vspace #-0.2"Cornetto [II]"}
                \set Staff.midiInstrument = #"trumpet"
                \VvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef subbass \key fa\major\time 4/4  do8^\markup\center-align {"Fagotto"} [re mi do] }
                \clef bass
                \set Staff.midiInstrument = #"bassoon"
                \Vfg\global
            >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key fa\major\time 4/4  r2 ^\markup\center-align {"Tenor Primo"} }
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \VtenoreI\global
                    \new Lyrics \lyricsto "jubilate1" \VtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key fa\major\time 4/4 r2^\markup\center-align {"Tenor Secondo"}  }
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \VtenoreII\global
                    \new Lyrics \lyricsto "jubilate2" \VtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \Vbasso\global
                    \new Lyrics \lyricsto "jubilate3" \VtestoIII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef subbass \key fa\major\time 4/4  do8^\markup\center-align {"Bassus"} _\markup\center-align{"Pro Organo"} [re mi do] }
                \clef bass
                \set Staff.midiInstrument = #"contrabass"
                \Vbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15.5)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #3
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
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

}
