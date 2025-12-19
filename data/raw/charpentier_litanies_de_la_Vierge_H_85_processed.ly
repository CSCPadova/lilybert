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

ovr = \override Stem.transparent = ##t

rev = \revert Stem.transparent

soli = ^\markup \italic { Seuls }

solo = ^\markup \italic { Seul }

sola = ^\markup \italic { Seule }

tu = ^\markup \italic "Tous"

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



IflIn = \relative do'' {

    R2.*3
    r4 sol'4. la8
    fad4. mi8 fad4

    %6
    sol re4.\prall re8
    mib4 mi4. mi8
    fa?4 do4.\prall do8

    %9
    re4. mib8 fa4
    sol mib4. mib8
    mib4 re8 do re4~

    %12
    re8 mib do4. \upprall sib8
    sib2.
    R2.*4

    %18
    sib'4 sol4. \prall sol8
    sol4 la8 sol fa4
    mi mi4.\upprall re8

    %21
    re2.
    fad8 mi fad sol fad sol
    la4. sol8 la4

    %24
    sib si4. si8
    do2 do4
    R2.*2

    %28
    sol4 sol4. sol8\mbreak
    la2 la4
    R2.

    %31
    r4 la la
    sib8 la la4.\prall sol8
    sol2.

    %34
    sol4 fa4. sol8
    mi4 la8 sol fad4
    sol sol4.\prall fad8

    %37
    sol2.
    R2.*15
    fa4 fa fa

    %54
    fa4. sol8 mi4
    fa2.
    R2.*3

    %59
    r4 r re
    sol2 r4
    R2.*5

    %66
    la4. sol8 fad4
    sol sol4. la8
    fad2.\mbreak

    %69
    R2.*6
    mi1
    do4 fa sol la

    %77
    sib2. sib4
    R1*6
    r2 re,4. re8

    %85
    re4 re  mi4. mi8
    mi4 la, re2
    mi1 \downprall

    %88
    re
    fad2. fad8 fad
    sol2 mi

    %91
    fad2. fad4
    R1*2
    r2 re4. do8

    %95
    sib4 sib mib4. mib8
    mib2 re\mbreak
    do2. re8 mib

    %98
    re1
    R1*3
    re2.~re8 re

    %103
    do4 do do4. do8
    re2 re
    re1

    %106  OOKK
    re
    R2.*26
    r4 fa4. fa8

    %134
    fa2 r4
    r sol8 sol sol fa
    mib2 \parenthesize r4\mbreak

    %137
    r la8 la la sol
    fa2.
    R2.*8

    %147
    re8 mib fa mib re do
    sib2 do4
    re re8 do re mib\mbreak

    %150
    do4\prall do r
    R2.*4
    sib2 sib4

    %156
    do re2\prall
    mib4. mib8 mib4
    re2 mib4

    %159
    fa2 re4
    mib2.
    fa

    %162
    r4 mib4. re8
    do2 fa4
    re4. do8 sib4\mbreak %OOKK

    %165
    fa'2.
    r4 r re
    re sol2~

    %168
    sol4 mi mi
    mi la2~
    la4 fad la

    %171
    re,4. mi8 fa!4
    mi2 mi4
    R2.*5

    %178
    fad4. re8 mi fad
    sol4. sol8 sol4\mbreak
    r4 sol sol

    %181
    fa re fa
    mi4. re8 do4
    do do la

    %184
    sib sib do
    do sib4. do8
    do2.

    %187
    R2.*3
    r4 fa8 fa mib re
    do4 r2

    %192
    r4 fa2
    r4 fa fa\mbreak
    fa fa re

    %195
    sol2 sol,4
    la la4. sib8
    la2 la4

    %198
    r2 sib
    la4 la re2~
    re2. dod4

    %201
    re1
    sol
    re~

    %204
    re~
    re2 do4. sib8
    la2 sib4 sol

    %207
    re'1
    re

}

IflIIn = \relative do'' {

    r4 sol'4. la8
    fad4. mi8 fad4
    sol4. re8 mib4

    %4
    re4. mib8 do4\prall
    do4. sib8 la4
    sib si4. si8

    %7
    do4 sol4. sol8
    la4. sol8 la4
    sib2.~

    %10
    sib4 do4. sib8
    la4. la8 sib4~
    sib8 do la4.\upprall sib8

    %13
    sib2.
    R2.*4
    re4 mi4. re8

    %19
    dod4. dod8 re4~
    re8 mi dod4.\parenthesize \upprall re8
    re2.

    %22
    re8 dod re mi re mi
    fad4. mi8 fad4
    sol re4. re8

    %25
    mib2 mib4
    R2.*2
    sib4 sib4. sib8\mbreak

    %29
    do2 do4
    R2.
    r4 fad8 mi fad4

    %32
    sol8 la fad4.\prall sol8
    sol2.
    do,4 si4. si8

    %35
    do re do sib? la4
    sib la4. sol8
    sol2.

    %38
    R2.*14
    re'4 re re
    do do re

    %54
    sib sib8[la sib do]
    la2 r4
    R2.*3

    %59
    re4. do8[sib la]
    do2 r4
    R2.*5

    %66
    re2 re4
    re4. mib8 do4
    re2.\mbreak

    %69
    R2.*6
    sib1
    la4 la sib do

    %77
    re2. re4
    R1*6
    la2.~la8 la

    %85
    sol4 sol sol4. sol8
    la2 la
    la1

    %88
    la
    re2. re8 re
    re2 dod

    %91
    re2. re4
    R1*3
    r2 do4. do8

    %96
    do2 sib\mbreak
    do do4.\prall sib8
    sib1

    %99
    R1*2
    r2 re4. do8
    si4 si si4. si8

    %103
    do1~
    do2 sib
    la2.(sib8) do

    %106 OOKK
    si1
    R2.*25
    r4 do4. do8

    %133
    do2 r4
    r r8 re re do
    sib2 r4

    %136
    r r8 mib mib re\mbreak
    do2 r4
    R2.*9

    %147
    sib8 do re do sib la
    sol2 la4
    sib sib8 la sib do\mbreak

    %150
    la4\prall la r
    R2.*4
    re2 sib4

    %156
    la re2
    sol,4. sol8 do4
    sib2 do4

    %159
    re2 sib4
    do2.
    re

    %162
    do2 do4
    do2 re4
    sib4. la8 sol4

    %165 OOKK
    do2 do4
    re2.
    si4 si si

    %168
    mi2.
    dod4 dod mi
    la, re re

    %171
    re4. dod?8 sib4
    la2 la4
    R2.*5

    %178
    la4. fad8 sol la
    sib4. sib8 sib4\mbreak %%OOKK
    r sol sol

    %181
    do sib do
    do4. re8 mi4
    fa4. fa8 fa4

    %184
    re mi fa
    fa4. sol8 mi4
    fa2.

    %187
    R2.*3
    r4 re8 re do sib
    la4 r r

    %192
    r sib2
    r4 la8 sib do la\mbreak
    sib4 re sib

    %195
    sol2 sol4
    do do4. do8
    do4. sib8 do la

    %198
    sib2 sol
    re' la4 la
    sib2 sol

    %201
    re' r
    sol,1
    la2 re~

    %204
    re  si4. re8
    sol,4 sol do2~
    do sib4 sib

    %207
    la2. si8 do
    si1

}


IvlIn = \relative do'' {

    R2.*3
    r4 sol'4. la8
    fad4. mi8 fad4

    %6
    sol re4.\prall re8
    mib4 mi4. mi8
    fa?4 do4.\prall do8

    %9
    re4. mib8 fa4
    sol mib4. mib8
    mib4 re8 do re4~

    %12
    re8 mib do4. \upprall sib8
    sib2.
    re4 re8 do re mib\mbreak

    %15
    do4 do re
    mib mib4. fa8
    re2\prall re4

    %18
    sib'4 sol4. \prall sol8
    sol4 la8 sol fa4
    mi mi4.\upprall re8

    %21
    re2.
    R2.*4
    la'4 la4. la8

    %27
    sib2 sib4
    R2.*2
    fad4 fad4. fad8

    %31
    sol2 r4
    R2.*2
    sol4 fa4. sol8

    %35
    mi4 la8 sol fad4
    sol sol4. \prall fad8
    sol2.

    %38
    R2.*18
    r4 mib sol\mbreak
    re2 r4

    %58
    R2.*3
    r4 r8 fa[sol fa]
    fa2 fa4

    %63
    R2.*12
    mi1
    do4 fa sol la

    %77
    sib2. sib4
    R1*6
    r2 re,4. re8

    %85
    re4 re  mi4. mi8
    mi4 la, re2
    mi1 \downprall

    %88
    re
    fad2. fad8 fad
    sol2 mi

    %91
    fad2. fad4
    R1*2
    r2 re4. do8

    %95
    sib4 sib mib4. mib8
    mib2 re\mbreak
    do2. re8 mib

    %98
    re1
    R1*3
    re2.~re8 re

    %103
    do4 do do4. do8
    re2 re
    re1

    %106  OOKK
    re
    R2.*48
    sib2 sib4

    %156
    do re2\prall
    mib4. mib8 mib4
    re2 mib4

    %159
    fa2 re4
    mib2.
    fa

    %162
    r4 mib4. re8
    do2 fa4
    re4. do8 sib4\mbreak %OOKK

    %165
    fa'2.
    r4 r re
    re sol2~

    %168
    sol4 mi mi
    mi la2~
    la4 fad la

    %171
    re,4. mi8 fa!4
    mi2 mi4
    R2.*5

    %178
    fad4. re8 mi fad
    sol4. sol8 sol4\mbreak
    r4 sol sol

    %181
    fa re fa
    mi4. re8 do4
    do do la

    %184
    sib sib do
    do sib4. do8
    do2.

    %187
    R2.
    r4 mib8 re mib fa
    re2 re4
    R2.
    r4 fa2

    %192
    R2.
    r4 fa fa\mbreak
    fa fa re

    %195
    sol2 sol,4
    la la4. sib8
    la2 la4

    %198
    r2 sib
    la4 la re2~
    re2. dod4

    %201
    re1
    sol
    re~

    %204
    re~
    re2 do4. sib8
    la2 sib4 sol

    %207
    re'1
    re


}

IvlIIn = \relative do'' {

    r4 sol'4. la8
    fad4. mi8 fad4
    sol4. re8 mib4

    %4
    re4. mib8 do4\prall
    do4. sib8 la4
    sib si4. si8

    %7
    do4 sol4. sol8
    la4. sol8 la4
    sib2.~

    %10
    sib4 do4. sib8
    la4. la8 sib4~
    sib8 do la4.\upprall sib8

    %13
    sib2.
    sib4 sib8 la sib do\mbreak
    la4 la si

    %16
    do sol4. la8
    sib2 sib4
    re4 mi4. re8

    %19
    dod4. dod8 re4~
    re8 mi dod4.\parenthesize \upprall re8
    re2.

    %22
    R2.*4
    do4 do4. do8
    re2 re4

    %28
    R2.*2
    la4 la4. si8
    do2 r4

    %32
    R2.*2
    do4 si4. si8
    do re do sib? la4

    %36
    sib la4. sol8
    sol2.
    R2.*18

    %56
    r4 do sol\mbreak
    sib2 r4
    R2.*3

    %61
    r4 r8 sib[do la]
    re4. do8 sib4
    R2.*12

    %75
    sib1
    la4 la sib do

    %77
    re2. re4
    R1*6
    la2.~la8 la

    %85
    sol4 sol sol4. sol8
    la2 la
    la1

    %88
    la
    re2. re8 re
    re2 dod

    %91
    re2. re4
    R1*3
    r2 do4. do8

    %96
    do2 sib\mbreak
    do do4.\prall sib8
    sib1

    %99
    R1*2
    r2 re4. do8
    si4 si si4. si8

    %103
    do1~
    do2 sib
    la2.(sib8) do

    %106 OOKK
    si1
    R2.*48
    re2 sib4

    %156
    la re2
    sol,4. sol8 do4
    sib2 do4

    %159
    re2 sib4
    do2.
    re

    %162
    do2 do4
    do2 re4
    sib4. la8 sol4

    %165 OOKK
    do2 do4
    re2.
    si4 si si

    %168
    mi2.
    dod4 dod mi
    la, re re

    %171
    re4. dod?8 sib4
    la2 la4
    R2.*5

    %178
    la4. fad8 sol la
    sib4. sib8 sib4\mbreak %%OOKK
    r sol sol

    %181
    do sib do
    do4. re8 mi4
    fa4. fa8 fa4

    %184
    re mi fa
    fa4. sol8 mi4
    fa2.

    %187
    R2.
    r4 sol,8 fa sol la
    sib2 sib4

    %190
    R2.
    r4 fa'2
    R2.

    %193
    r4 la,8 sib do la\mbreak
    sib4 re sib

    %195
    sol2 sol4
    do do4. do8
    do4. sib8 do la

    %198
    sib2 sol
    re' la4 la
    sib2 sol

    %201
    re' r
    sol,1
    la2 re~

    %204
    re  si4. re8
    sol,4 sol do2~
    do sib4 sib

    %207
    la2. si8 do
    si1

}

IsopranoIn = \relative do'' {

    \autoBeamOff
    R2.*37
    R2.*37
    mib1

    %76
    do4 do re mib
    fa2. fa4
    R1*3

    %81
    r2 sol4.\solo fa8
    mi?4 mi fa2\mbreak
    mi1

    %84
    r2 re4.\tu re8
    re4 re mi4. mi8
    mi4 la, re2

    %87
    mi1
    R1
    fad2. fad8 fad

    %90
    sol2 mi
    fad2. fad4
    R1*2

    %94
    r2 re4.\tu do8
    sib4 sib mib4. mib8
    mi2 re\mbreak

    %97
    do2.(re8[mib])
    re1
    R1*3

    %102
    re2.(re8) re
    do4 do do4. do8
    re2 re

    %105
    re1
    re
    re4.^\p do8 re4

    %108
    mib2 mib4
    re4. do8 re mib
    do4.\prall do8 do4\mbreak

    %111
    fa4. mib8 re4
    sib mib4. re8
    do la sib4. do8

    %114
    la2.
    re4 re4. mib8
    si2 si4

    %117
    r do re
    mib fa4. sol8
    mib4(re2\prall)

    %120
    do2.
    R2.*9
    fad4 fad sol
    mi4. mi8 mi4

    %132
    R2.
    fa4. fa8 mib4
    re re r

    %135
    r mib8 mib mib re
    do2 r4
    r4 fa8 fa fa mib

    %138
    re2.
    sol4. fa8 mib re
    mib2 fa4

    %141
    sol4. fa8 mib re
    do2 do4
    re8 [mib fa mib re do](

    %144
    sib2) do4
    re re8[do] re[mib]
    do4\prall do r

    %147
    R2.*5  %% fine p. 4 e inizio p 5
    sol'4 mib4. sol8
    do,4.(re16 [mib] fa4)

    %154
    re2.
    sib2\tu sib4
    do re2\prall

    %157
    mib4. mib8 mib4
    re2 mib4
    fa2 re4

    %160
    mib2.
    fa
    r4 mib4. re8

    %163
    do2 fa4
    re8([do])(sib2)\mbreak
    fa'2.

    %166
    r4 r re
    re sol2~
    sol4 mi mi

    %169
    mi la2~
    la4 re,2
    re4. mi8 fa4

    %172
    mi2 mi4
    fa\solo re fa
    mi2 mi4

    %175
    sol fa mi
    fa(mi2\prall)
    re2.

    %178
    fad4. re8 mi fad
    sol4. sol8 sol4\mbreak
    r sol sol

    %181
    fa re fa
    mi4. re8 do4
    r do la

    %184
    sib sib do
    do2.
    do

    %187
    R2.*2
    re4. do8 re mib
    fa2 fa4

    %191
    R2.*2
    r4 fa\tu fa\mbreak
    fa fa re

    %195
    sol2 sol,4
    la la4. sib8
    la2 la4

    %198
    r2 sib
    la4 la re2~
    re2. (dod4)

    %201
    re1
    sol
    re

    %204
    r2 re~
    re do4. sib8
    la2 sib4 sol

    %207
    re'1
    si

}

ItestoI = \lyricmode {

    Pa -- ter de caelis _  De -- us mi -- se -- re -- re  no -- bis

    mi -- se -- re -- re  mi -- se -- re -- re no -- bis

    Spi -- ritus _ Sanc -- te De -- us mi -- se -- re -- re  mi -- se -- re -- re no -- bis

    mi -- se -- re -- re  mi -- se -- re -- re no -- bis.

    Sancta _ Ma -- ri -- a, Sancta _  Dei _ ge -- nitrix _

    Sancta _ Vir -- go Sancta _ Vir -- go virgi - num ora _ pro no -- bis ora _ ora _ pro no -- bis.

    Mater _ cas -- tis -- sima, _  in -- teme _ rata, _   admi - rabi - lis admi - rabi - lis

    Mater _ Crea - to -- ris,  Mater _  Salva - to -- ris o -- ra ora _ pro no -- bis  ora _ pro no -- bis.

    Virgo _ pru -- den -- tis -- sima _  Virgo _  vene - ran -- da Virgo _  prae -- di -- can -- da

    Virgo _ cle -- mens Vir -- go cle -- mens Virgo _  fi -- delis _

    ora _ pro no -- bis ora _ pro no -- bis.

    Specu - lum ius -- ti -- tiae _ cau -- sa nostrae _  lae -- ti -- tiae _  ora _ ora _ pro no -- bis.

    Vas spiri - tu -- a -- le vas in -- signe _ in -- signe _  de -- vo -- ti -- o -- nis

    o -- ra pro no -- bis o -- ra o -- ra  pro no -- bis pro no -- bis.

}

IsopranoIIn = \relative do'' {

    \autoBeamOff
    R2.*37
    R2.*37
    sib1

    %76
    la4 la sib do
    re2. re4
    R1*2

    %80
    r2 re4.\solo do8
    si4 si mi4. re8
    dod4 dod re2

    %83
    dod1
    la2.\tu~la8 la
    sol4 sol sol4. sol8

    %86
    la2 la
    la1
    la

    %89
    re2. re8 re
    re2 dod
    re2. re4

    %92
    r la2\solo la4
    sib sib8 do re4 sib
    la2. la4

    %95
    r2 do4.\tu do8
    do2 sib
    do1\downprall

    %98
    re
    R1*2
    r2 re4. do8

    %102
    si4 si si4. si8
    do1~
    do2 sib

    %105
    la2.(si8) [do]
    si1
    R2.*14

    %121
    r4 mi fa %%%  mater christi
    re2\prall   re4
    mi mi8 re do\prall si\mbreak

    %124
    dod4. dod8 dod4
    re dod re
    mi4. la,8 la4

    %127
    si dod re
    re2(dod4)
    re2.

    %130
    la4 la sib
    sol4. sol8 sol4
    do4. do8 sib4

    %133
    la la r
    r r8 sib sib la
    sol2 r4

    %136
    r4 r8 do do sib\mbreak
    la2 r4
    R2.

    %139
    mib'4. re8 do si
    do2 re4
    mib4. re8 do sib?

    %142
    la2 la4
    sib8 [do re do sib la](
    sol2) la4

    %145
    sib sib8[la] sib[do]
    la4 la r
    R2.*4

    %151
    fa'4 re4. fa8  %%OOKK
    sib,2.~
    sib2(la4)

    %154
    sib2.
    re2\tu sib4
    la re2

    %157
    sol,4. sol8 do4
    sib2 do4
    re2 sib4

    %160
    do2.
    re
    do2 do4

    %163
    do2 re4
    sib2.\mbreak
    do4 la la

    %166
    re2.
    si4 si si
    mi2.

    %169
    dod4 dod dod
    re2 re4
    re4. dod?8 sib4

    %172
    la2 la4
    re si re
    dod2 dod4

    %175
    re do? re
    re2(dod4)
    re2.

    %178
    R
    re4.\tu do8 sib la\mbreak
    sol4. sol8 sol4

    %181
    r sib do
    do4. re8 mi4
    fa4. fa8 fa4

    %184
    re mi fa
    fa2(mi4)
    fa2.

    %187
    do4.\solo sib8 do re
    mib2 mib4
    sib4. la8 sib do

    %190
    re2 re4
    R2.*2
    r4 do\tu do\mbreak

    %194 OOKK
    re re sib
    sol2 sol4
    do do4. do8

    %197
    do4.(sib8)[do la](
    sib2) sol
    re' la4 la

    %200
    si2(sol)
    re'2 r
    sol,1

    %203
    la2 re~
    re si4. re8
    sol,4 sol do2~

    %206
    do sib4 sib
    la1\prallprall
    sol

}

ItestoII = \lyricmode {

    Pa -- ter de caelis _  De -- us mi -- se -- re -- re  mi -- se -- re -- re no -- bis

    mi -- se -- re -- re  mi -- se -- re -- re no -- bis Spi -- ritus _ Sanc -- te De -- us

    Sanc -- ta Tri -- nitas _ unus _  De -- us mi -- se -- re -- re no -- bis

    mi -- se -- re -- re  mi -- se -- re -- re no -- bis.

    Mater _ Christi _  Mater _  divi - nae gra -- tiae _ Mater _  pu -- ris -- sima _ o -- ra pro no -- bis

    Mater _ ca -- stis -- sima _ in -- vio - lata _  ama - bi -- lis ama - bi -- lis

    Mater _ Crea - to -- ris,  Mater _  Salva - to -- ris o -- ra ora _ pro no -- bis  ora _ pro no -- bis.

    Virgo _ pru -- den -- tis -- sima _  Virgo _  vene - ran -- da Virgo _  prae -- di -- can -- da

    Virgo _ po -- tens  Virgo _ cle -- mens Virgo _  Virgo _   Virgo _  fi -- delis _

    ora _ pro no -- bis  ora _ pro no -- bis.

    Sedes _ sapi - en -- tiae _ cau -- sa nostrae _  lae -- ti -- tiae _  ora _ pro no -- bis.

    Vas spiri - tu -- a -- le vas spiri - tu -- a -- le

    vas in -- signe _ in -- signe _  de -- vo -- ti -- o -- nis

    o -- ra pro no -- bis o -- ra o -- ra  pro no -- bis o -- ra pro no -- bis.

}

Ialton = \relative do' {

    \autoBeamOff
    R2.*37
    r4 sol'4. la8
    fad4 fad4. fad8

    %40
    sol4 re4. re8
    mib2 mib4
    do2\prall do4\mbreak

    %43
    r do4. do8
    re2 r4
    r sib4. sib8

    %46
    do4 do4. sib8
    la2 fa'4~
    fa4. fa8 mib4~

    %49
    mib2 re4
    do2(re8)[mib]
    re2.

    %52
    R2.*3
    r4 do re
    mib4. mib8 mib4\mbreak

    %57
    r r8 re re sol
    fad4. fad8 fad4
    R2.

    %60
    r4 sol sol8 sol
    do,4. re8 mib fa
    re2 re4

    %63
    r mi?4. mi8
    fad2 fad4
    sol2(fad8) sol

    %66
    fad2.
    R2.*3
    r4 sol4. fa?8

    %71
    mi4 fad sol
    fad4.(re8)(sol4)~
    sol(fad4.) sol8

    %74  OOKK
    sol2.
    sol1
    fa4 fa sol la

    %77
    sib2. sib4
    fa2.\tu mi8 re
    mi4 mi fa sol

    %80
    la2. la4
    R1*2\mbreak
    r2 la4. sol8

    %84
    fad4 fad fad4. fad8
    sol1~
    sol2 fa

    %87
    mi2.(fad8)[sol]
    fad1
    la2. la8 la

    %90
    sib2 sol
    la2. la4
    r fad2\solo fad4

    %93
    sol sol8 fad sol4. la8
    fad2. fad4
    r2 sol4.\tu sol8

    %96
    sol2 fa?\mbreak
    fa1
    fa2 sol4. fa8

    %99
    mi4 mi la4. sol8
    fad4 fad sol2
    fad1

    %102
    r2 sol4. fa?8
    mi4 mi la4. sol8
    fad4 fad sol2~

    %105
    sol2. (fad4)
    sol1
    R2.*48

    %155
    fa2\tu fa4
    fa fa2
    sol4. sol8 sol4

    %158
    sol2 sol4
    la2 sib4
    sol2.

    %161
    fa
    sol2 sol4
    fa2 fa4

    %164
    fa(mi2)\mbreak
    fa2.
    R

    %167
    r4 re re
    sol2.
    mi4 mi mi

    %170
    la2 la4
    sol4. sol8 sol4
    sol4. fa8(mi4)

    %173
    R2.*6
    sib'4.\tu la8 sol fa\mbreak
    mi4. mi8 mi4

    %181
    r fa la
    sol4. fa8 sol4
    la4. sol8 fa4

    %184
    fa sol la
    la(sol2\prall)
    fa2.

    %187
    R2.*4
    la4\soli la4. la8
    sib4.(la8)[sib sol](

    %193
    la4.) la8 la4\mbreak
    r fa\tu sol
    mi2 mi4

    %196
    fad fad4. sol8
    la2 la4
    r2 sol

    %199
    la fad
    sol2.(la4)
    fad1

    %202
    R
    r2 la~
    la sol4. fa8

    %205
    mi4 mi la2
    fad4 re sol2~
    sol2.(fad4)

    %208
    sol1

}

ItestoIII = \lyricmode {

    Kyri - e Kyri - e Kyri - e e -- leison _ Kyri - e Kyri - e Kyri - e Kyri - e e -- lei -- son

    Christe _  audi _ nos Christe _  ex -- audi _ nos Ky -- rie _ Ky -- rie _ e -- leison _

     Christe _  Chris -- te au -- di nos Christe _  Christe _ ex -- au -- di nos.

     Pa -- ter de caelis _  De -- us Fili _ re -- demp -- tor mun -- di De -- us

    mi -- se -- rere _   mi -- se -- re -- re  no -- bis Spi -- ritus _ Sanc -- te De -- us

    Sanc -- ta Tri -- nitas _ unus _  De -- us mi -- se -- re -- re no -- bis

    mi -- se -- re -- re mi -- se -- re -- re  no -- bis mi -- se -- re -- re mi -- se -- re -- re  no -- bis.

    Virgo _ pru -- den -- tis -- sima _  Virgo _  vene - ran -- da Virgo _  prae -- di -- can -- da

    Virgo _  po -- tens Virgo _ cle -- mens Virgo _  fi -- delis. _ Sedes _ sapi - en -- tiae _

    cau -- sa nostrae _  lae -- ti -- tiae _  ora _ pro no -- bis.

    Vas ho -- no -- ra -- bile _ vas in -- signe _  de -- vo -- ti -- o -- nis o -- ra pro no -- bis

    o -- ra pro no -- bis o -- ra pro no -- bis.





}

Itenoren = \relative do' {

    \autoBeamOff
    R2.*38
    r4 re4. re8
    si4 si4. si8

    %41
    do4 sol(la8[sib?])
    la2 la4\mbreak
    r4 la4. la8

    %44
    sib2 r4
    r sol4. sol8
    la4 la4. sol8

    %47
    fa4 fa'8 mib re sib
    sol4 sol do
    la2(sib4)~

    %50
    sib2(la4)
    sib2.
    R2.*3

    %55
    r4 la si
    sib?4. sib8 sib4\mbreak
    r4 r8 sib sib  do

    %58
    la4. la8 la4
    R2.
    sol4. la8 sib do

    %61
    la4 la la
    sib2 sib4
    sol4. sol8 do4~

    %64
    do2 sib4
    sib2~sib8 do
    re2.

    %67
    R
    r4 re4. do8\mbreak
    sib4 sib sib

    %70
    si2 si4
    do2.~
    do2 sib?4

    %73
    la2(si8) do
    si2.  %%%OOKK
    mib1

    %76
    mib4 mib re do
    sib2. sib4
    re2. do8 sib

    %79
    do4 do re mi?
    fa2. fa4
    R1*3

    %84
    r2 re4. do8
    si4 si mi4. re8
    dod4 dod re2~

    %87
    re2.(dod4)
    re1
    re2. re8 re

    %90
    sol,2.  sol4
    re'2. re4
    R1*3

    %95
    r2 do4.\tu sib8
    la4 la sib2~\mbreak
    sib2.(la4)

    %98
    sib2 sib4. la8
    sol4 sol do4. sib8
    la4 la sib2

    %101
    la1
    r2 re4. re8
    re4 sol, la4. la8

    %104
    la2 sib4(do)
    re1
    re %% OOKK

    %107
    R2.*48
    re2\tu re4
    do si2

    %157
    do4. do8 do4
    R2.
    re2 re4

    %160
    sol,2(la4)
    sib2.
    r4 sib4. do8

    %163
    la2 la4
    sib8[(la)](sib4.)(do8)\mbreak
    la4 do do

    %166
    fa2.
    re4 re re
    mi2.

    %169
    mi4 la, la
    la2 la4
    si4. dod8 re4

    %172
    dod2 dod4
    R2.*7
    r4 do\parenthesize \tu  do

    %181
    do re do
    do4. do8 do4
    r do do

    %184
    re sib la
    do2.
    la

    %187
    la4.\solo sol8 la si
    do2 do4
    R2.*2

    %191
    do4\soli do4. do8
    re4.(do8)[re sib](
    do4.) do8 do4\mbreak

    %194
    r re\tu re
    do2 do4
    do do4. sib8

    %197
    re2 re4
    r2 re~
    re re4 re

    %200
    mi1
    la,2 re~
    re do~

    %203
    do2. re4
    si2 si
    do mib4 mib

    %206
    re1~
    re
    re

}

ItestoIV = \lyricmode {

    Kyri - e Kyri - e e -- leison _ Kyri - e Kyri - e Kyri - e Kyri - e e -- leison _

    e -- lei -- son Christe _  audi _ nos Christe _  ex -- audi _ nos Ky -- rie _ e -- leison _

    e -- leison _ Christe _  Chris -- te au -- di nos Christe _

    Christe _  ex -- au -- di nos ex -- au -- di nos.

    Pa -- ter de caelis _  De -- us Fili _ re -- demp -- tor mun -- di De -- us

    mi -- se -- rere _   mi -- se -- re -- re  no -- bis Spi -- ritus _ Sanc -- te De -- us

    mi -- se -- re -- re  no -- bis mi -- se -- rere _   mi -- se -- re -- re  no -- bis

    mi -- se -- rere _   mi -- se -- re -- re  no -- bis.

    Virgo _ pru -- den tis -- sima _   vene - ran -- da Virgo _  prae -- di -- can -- da

    Virgo _ po -- tens Virgo _  po -- tens Virgo _ cle -- mens Virgo _  fi -- delis. _

    Cau -- sa nostrae _  lae -- ti -- tiae _ ora, _ ora _ pro no -- bis.

    Vas spiri - tu -- a -- le vas ho -- no -- ra -- bile _

    vas in -- signe _  de -- vo -- ti -- o -- nis o -- ra pro no -- bis o -- ra pro no -- bis o -- ra pro no -- bis.

}

Ibasson = \relative do {

    \autoBeamOff
    R2.*37
    r4 sol'4. sol8
    re'4 re,4. re8

    %40
    sol4 sol4. sol8
    do,2 do4
    fa2 fa4\mbreak

    %43
    R2.
    r4 re4. re8
    mi?2 r4

    %46
    r do4. do8
    re2.
    mib?

    %49
    fa~
    fa
    sib,

    %52
    sib'4 sib sib
    la la sib
    sol2.\downprall

    %55
    fa
    do4. re8 mib fa\mbreak
    sol2 sol4

    %58
    r re'4. do8
    sib4. la8 sol fa
    mi?2 r4

    %61
    fa4 mib8 re do fa
    sib,2.
    r4 do4. do8

    %64
    re2 re4
    mib2(mib8) re
    re2.

    %67
    R2.*2\mbreak
    r4 sol4. fa8
    mib4 mib re

    %71
    do do do
    re2.~
    re2~re8 re

    %74
    <<sol2.\\sol,_\markup "nos.">>
    R1*3
    sib'2. sib8 sib

    %79
    sib4 sib la sol
    fa2. fa4
    sol2.~sol8 sol

    %82
    la4 la re,2\mbreak
    la'1
    r2 re,4.\tu re8

    %85
    sol4 sol mi4. mi8
    fa2 re
    la' (la,)

    %88
    re1
    R1*3
    r4 re'2 re4

    %93
    sol, sol8 la sib4 sol
    re'2. re4
    sol,4. fa8 mib4 mib

    %96
    fa1~\mbreak
    fa %OOKK p.4
    sib,

    %99
    do2.~do8 do
    re4 re sol2
    re1

    %102
    r2 sol4. sol8
    do4 do la4. la8
    sib2 sol

    %105
    re'(re,)
    sol1
    R2.*48

    %155
    sib2\tu sib,4 %%%OOKK
    fa' re2
    do4. do8 do4

    %158
    sol'2 sol4
    fa2 sol4
    mib2.\prall

    %161
    re
    r4 mib4. mib8
    fa2 fa4

    %164
    sol2.\mbreak
    fa
    r4 re re

    %167
    sol2.
    mi4 mi mi
    la2.

    %170
    fad4 fad fad
    sol sol4. sol8
    la2 la4

    %173
    fa\solo sol re
    la'2 la4
    sib la sol~

    %176
    sol la2
    re,2.
    re'4.\tu do8 sib la

    %179
    sol4. sol8 sol4\mbreak %% fine p. 5 OOKK
    r4 do do
    la sib fa

    %182
    do'4. do8 do4
    r fa, fa
    sib sol fa

    %185
    do'(do,2)
    fa2.
    fa4.\solo fa8 mib re

    %188
    do2 do4
    sol'4. sol8 fa mib
    re2 re4

    %191
    r fa2
    r4 sib2
    r4 fa\tu fa\mbreak

    %194
    sib sib sib
    sib2 sib4
    la la4. sol8

    %197
    fad2 fad4
    sol1
    fa?2. fa4

    %200
    mi1\downprall
    re
    mi

    %203
    fad2. fad4
    sol1
    do,2. do4

    %206
    re1~
    re
    sol

}

ItestoV = \lyricmode {

    Kyri - e Kyri - e Kyri - e e -- leison _ Kyri - e Kyri - e e -- lei -- son

    Christe _ e -- leison _ e -- lei -- son Kyri - e e -- leison _

    Christe, _  Christe _  audi _ nos Christe _  exau - di nos

    Christe, _  Christe _  au -- di nos Christe, _  Christe exau - di nos exau - di

    Fili _ re -- demp -- tor mun -- di De -- us mi -- se -- rere _  no -- bis

    mi -- se -- rere _   mi -- se -- re -- re  no -- bis

    Sanc -- ta Tri -- nitas _ unus _  De -- us mi -- se -- re -- re  no -- bis

    mi -- se -- re -- re  no -- bis mi -- se -- re -- re  mi -- se -- re -- re no -- bis.

    Virgo _ pru -- den -- tis -- sima _  Virgo _  vene - ran -- da Virgo _  prae -- di -- can -- da

    Virgo _  cle -- mens Virgo _  cle -- mens Virgo _ Virgo _  fi -- delis _

    ora _ pro no -- bis ora _ pro no -- bis.

    Spe -- culum _ ius -- ti -- tiae _ cau -- sa nostrae _  lae -- ti -- tiae _ ora, _ ora _ pro no -- bis.

    Vas spiri - tu -- a -- le vas spiri - tu -- a -- le vas vas vas in -- signe _  in -- signe _

    de -- vo -- ti -- o -- nis o -- ra pro no -- bis o -- ra pro no -- bis pro no -- bis.

}

Ibcn = \relative do {

    sol'4. la8 sib4
    la2.
    sol2 do,4

    %4
    re mib2
    re2.
    sol2 sol4

    %7
    do,2.
    fa2 fa4
    sib,4. do8 re4

    %10
    mib do4. do8
    fa2 sib4
    mib, fa2

    %13
    sib,2.
    sib4 sib4. sib8\mbreak
    fa'4 mib re

    %16
    do do4. do8
    sol'2 sol4
    sol4. fa8 mi4

    %19
    la8 sol fa mi re4
    sol, la2
    re,2.

    %22
    re'
    re
    sol,4 sol'4. sol8

    %25
    do,2 do4
    fa fa4. fa8
    sib,2 sib4

    %28
    mib mib4. re8\mbreak
    do2 do4
    re re4. re8

    %31
    mib4 re8 do re4
    do re re,
    sol sol' fa

    %34
    mib re4. re8
    do4. do8 re4
    sol, re2

    %37
    sol2.
    sol'
    re'4 re,4. re8

    %40
    sol4 sol4. sol8
    do,2 do4
    fa2 fa4\mbreak

    %43
    fa2 mib4
    re re4. re8
    mi?2 re4

    %46
    do do4. do8
    re2.
    mib

    %49
    fa
    fa,
    sib

    %52
    sib'
    la2 sib4
    sol2.

    %55
    fa4 mib re
    do4. re8 mib fa\mbreak
    sol2 sol,4

    %58
    re'2.
    sib'4. la8 sol fa
    mi?2.

    %61
    fa4 mib8 re do fa
    sib,2.
    do

    %64
    re
    mib
    re

    %67
    mib
    re\mbreak
    sol2~sol8 fa

    %70
    mib2 re4
    do2.
    re

    %73
    re
    sol,
    mib'2 mib'

    %76
    mib re4 do
    sib1
    sib~

    %79
    sib2 la4 sol
    fa1
    sol

    %82
    la2 re,\mbreak
    la'1
    re2 re,

    %85
    sol mi
    fa re
    la' la,

    %88
    re1
    re'
    sol,

    %91
    re
    re'2. re4
    sol,4. la8 sib4 sol

    %94
    re'1
    sol,4. fa8 mib2
    fa1\mbreak

    %97
    fa,
    sib
    do

    %100
    re2 sol,
    re'1
    sol2. sol8 sol

    %103
    do2 la
    sib sol
    re' re,

    %106 OOKK
    sol1
    sol2.
    do4. sib8 la4

    %109
    sib2~sib8 mib,
    fa2~fa8 mib\mbreak
    re2.

    %112
    mib
    mi!
    fa

    %115
    fad
    sol2 fa4
    mib2 fa4

    %118
    sol lab fa
    sol2 sol,4
    do2.

    %121
    do'4. sib8 la4
    sib2 la4
    sol2.\mbreak

    %124
    la2 sol4
    fa mi re
    dod2 re4

    %127
    sol, la sib!
    la2.
    re

    %130
    re'2 sol,4
    do2.
    mi,

    %133
    fa4 la,2
    sib4. do8 re4
    mib2.

    %136
    mib\mbreak
    fa2.
    sib4. lab8 sol fa

    %139
    mib2.
    mib
    mib

    %142
    fa4. mib8 re do
    sib4. do8 re4
    mib re do

    %145
    sib sib sib
    fa'8 sol la sol fa mib
    re2.

    %148
    mib4 re do
    sib sib4. sib8\mbreak   %%% OOKK
    fa'2 mib4

    %151
    re2.
    mib
    fa

    %154
    sib,
    sib
    fa'4 re2

    %157
    do2.
    sol'
    fa2 sol4

    %160
    mib2.
    re
    mib

    %163
    fa
    sol\mbreak
    fa

    %166
    re4 re re
    sol2.
    mi?

    %169
    la
    fad
    sol

    %172
    la
    fa4 sol re
    la'2 la4

    %175
    sib la sol
    sol la2
    re,2.

    %178
    re'4. do8 sib la
    sol2.\mbreak
    do4 do do

    %181
    la sib fa
    do'2 do4
    fa, fa fa

    %184
    sib sol fa
    do' do,2
    fa2.

    %187
    fa4. fa8 mib re
    do2 do4
    sol'4. sol8 fa mib

    %190
    re2 re4
    fa2.
    sib,

    %193
    fa'4 fa fa\mbreak
    sib2.
    sib

    %196
    la4 la4. sol8
    fad2.
    sol1

    %199
    fa?
    mi
    re

    %202
    mi
    fad
    sol

    %205
    do,
    re
    re,

    %208
    sol

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>4
    <6+>2.
    s
    s4 <7> <6>
    <7 _+>2.
    <_->4 <_+> s
    <_->4 <_+> s
    s2.*3
    <7>2.
    s2.*7
    <7 _+>2.
    s2.*4
    <_->4 <_+>2
    s2.*5
    <_+>2.
    <6>
    s
    s
    <6>4 <6+>2
    s2.*2
    <_->2.
    s
    s
    <_+>
    <_->
    s2.*4
    <6>2.
    s
    <9 7>2 <8 6>4
    <7 3>2 <6 4>4
    <5 4>2 <3>4
    s2.*3
    <7>2 <6>4
    s2.*3
    <_+>2.
    s2.*3
    <5>2 <6>4
    <_+>2.
    <7 _+>2 <6>4
    <7>2 <6>4
    <5 _+>2 <6>4
    <7>2 <6>4
    <_+>2.
    s
    <5+>
    s
    <7 3+>2 <6 4>4
    <5 4>4 <3>2
    <_+>2.
    s1
    <4+>2 <6 4>
    s1*2
    <4+>2 <6 4>
    <5> <6>
    <_+ 5> <_- 6>
    <_+> <_->
    <_+>1
    <_+>
    <_+>2 <5>
    <5+ 9> s
    <5 4> <3>
    <_+> s
    <_+> s
    <5> <6 4+>
    s1*4
    s2 <6>
    <9 7 3> <8 6 4>
    <5 4>2. <3>4
    <5>2 <6>
    <5 _+> <6 _->
    <_+>1
    <_+>
    s
    <9 _+>2 <5>
    <9 7 5+>1
    <5 4>2 <3>
    s1
    <_+>2.
    <_->
    s2.*3
    <5>4 <6>2
    <6> 4 <5->2
    s2.*2
    <_+>2.
    <6>
    <_+>
    s
    <_->
    <_+>
    s
    <6>
    <_+>
    <6>4 <6+>2
    s2.
    <_+>
    <4>2<3>4
    s2.*7
    <6>2.
    s
    s
    <5>2 <6>4
    <6>2 <9 7>4
    <5>2 <6>4
    s2.*5
    <6>2.
    s2.*5
    <5 4>2 <3>4
    s2.*2
    s4 <6+>2
    <_->2.
    s
    <6>
    <6>
    <6>
    s
    <5>2 <6>4
    <7>4 <6>2
    s2.*2
    <_+>2.
    <5>
    <_+>
    s
    <_+>2 <_->4
    <_+ 7>2.
    s
    <_+>
    s2.*9
    s4 <6>2
    s2.*10
    <4+>2.
    <6+>
    s
    s1
    <6>
    <7>2. <6+>4
    <_+>1
    <7>2 <6>
    <6 5->1
    <9>2 <8>
    <_+ 9 5>2 <_- 8 6>
    <7 3+> <6 4>
    <5 4>2. <3>4

}


forma = {

    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 50
    s2.*37\break
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \mark\markup\huge "[2. Kyrie]"
    s2.*37\break
    \time 2/2
    \once \override Score.RehearsalMark.extra-offset = #'(7 . 0) \mark\markup\huge "[3. Pater de caelis]"
    s1*31
    s1\fermata\break
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \once \override Score.RehearsalMark.extra-offset = #'(7 . 0) \mark\markup\huge "[4. Sancta Maria]"
    s2.*91\break
    \time 2/2
    s1*11
    \bar "||"

}

IflI = {
    \notypeset
    <<\IflIn \forma>>

}

IflII = {
    <<\IflIIn \forma>>

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

IsopranoI = {
    \new Voice = "kyrie1"
    <<\IsopranoIn \forma>>
}

IsopranoII = {
    \new Voice = "kyrie2"
    <<\IsopranoIIn \forma>>
}

Ialto = {
    \new Voice = "kyrie3"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "kyrie4"
    <<\Itenoren \forma>>
}

Ibasso = {
    \clef bass
    \new Voice = "kyrie5"
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



IIflIn = \relative do'' {

    R1*17
    r4 sol'8\sola la sib la sol fa
    mi4 mi fad8 fad sol la

    %20
    sib la sol fa mi4 la8 sol
    fad2 r\mbreak

    %22
    R1*2
    r4 fa?\sola do fa
    re4. do8 sib4 r

    %26
    R1*5
    fa'2\sola re
    mi4 fa fa4.\prall mi8

    %33
    fa2 r\mbreak
    R1*4
    r2 fa

    %39
    sol mib~
    mib4 re do fa8 mib
    re1

    %42 inizia il 3/2
    \override NoteHead.duration-log = 1 R2.*20
    r4 r8 sol8\sola[sol8. re16]
    mib4 mi4. mi8

    %64
    \ovr fa2.~
    \rev fa4. sol16 fa mib4
    re re4.\prall do8

    %67
    \ovr do2.
    R2.*34
    \rev r4 r8 re\sola[re8. re16]

    %103
    \ovr mib2.\mbreak
    \rev r4 r8 mib[mib8. mib16]
    fa4 fa4. sol8

    %106
    mib4 mib4. fa8
    \ovr re2.
    R2.*6

    %114
    r4 sol2
    lab2.~
    \rev lab4. sib16 lab sol4

    %117
    fa4. sol8 lab sib
    sol4. fa8 mib4
    lab fa4.\prall fa8

    %120
    fa4. mib16 re mib4~
    mib8 re re4.\prall do8

    %122 inizia il 2/2
    \revert NoteHead.duration-log do1
    R
    r2 r4 sol'

    %125
    fa mi? re re8 mi
    do2 do4 r
    R1

    %128
    r2 r4 re
    re2 sol4 sol\mbreak
    do, do8 do fa4. fa8

    %131
    sib,2 do~
    do4 sib la la'
    sib2 sib4 do

    %134
    la la la4. sib8
    sol4 fad sol4. la8
    fad2. r4

    %137
    R1*2
    r4 do fa?2
    re mib~

    %141
    mib4 re do re8 mib
    re1
    R1*2

    %145
    r2 r4 re
    sol2 sol4 sol
    mi? mi8 dod re4 mi

    %148
    fa2. mi8 fa
    mi1
    R1*3

    %153
    r2 mi
    dod4 dod re2~
    re2. dod4

    %156
    re mi fad4. fad8\mbreak
    sol4 re sol4. sol8
    sol4 fa8 mi fa4 sol8 fa

    %159
    mi4 fad sol4. la8
    fad1

    %161 OOKK inizia agnus dei inizia 3/2
    \override NoteHead.duration-log = 1
    R2.*28
    \rev fa4 fa4. fa8
    \ovr sol2.

    %191
    \rev sol4 la4. sib8
    \ovr la2.
    \rev sib4 lab4. sib8\mbreak

    %194
    sol4 la? sib
    sib4. do8 la4
    sib re, re

    %197
    fa do do
    re sib sib
    \ovr fa'2 \rev re4
    \ovr sol2.\rev

    %201  %% inizia 2/2 finale
    \revert NoteHead.duration-log
    do,2 fa~
    fa4 fa mi2~
    mi4 mi re2

    %204
    mi r
    R1*3
    fa2 sol

    %209
    mib4 do la4. la8
    sib4 do re2~
    re r

    %212
    mib~mib4. mib8
    re2 re
    re1

    %215
    re\breve

}

IIflIIn = \relative do'' {

    R1*16
    r2 fa8\sola mib fa do
    re4 mi?8 fad sol fa? mi re

    %19
    dod4 dod re8 re mi fad
    sol fa! mi re dod4. re8
    re2 r\mbreak

    %22
    R1*2
    r4 la\sola la la
    sib4. do8 re4 r

    %26
    R1*4
    r2 do2\sola
    la sib~

    %32
    sib4 la sol do8 sib
    la2 r\mbreak
    R1*4

    %38
    r2 re
    mib do4. sib8
    la4 sib sib4. la8

    %41
    sib1

    %42 inizia il 3/2
    \override NoteHead.duration-log = 1 R2.*21
    r4 r8 do\sola[do8. sol16]
    lab4 la4. la8

    %65
    \ovr si2 \rev do4~
    do8 re si4. do8
    \ovr do2.

    %68
    R2.*35
    \rev r4 r8 si\sola[si8. si16]\mbreak
    \ovr do2.

    %105
    \rev re4. do8 si4
    do do4. re8
    \ovr si2.

    %108
    R2.*8
    \rev re4 sib mib~\mbreak
    mib8 fa re4.\prall mib8

    %118
    mib4. re8 do4
    fa4. mib8 [re8.\prall do16]
    si4 sol do~
    do8 re si4. do8

    %122 inizia il 2/2 OOKK
    \revert NoteHead.duration-log do1
    R
    r2 r4 mi?

    %125
    fa do do do8 sib
    do2 do4 r
    R1

    %128
    r2 r4 la
    sib2 sib4 sib\mbreak
    fa' fa8 fa la,4. la8

    %131
    sib2 sol
    la re4 fad
    sol2 re~

    %134
    re4 re re4. re8
    re4. mib8 do4.\prall sib16 do
    re2. r4

    %137
    R1*2
    r2 r4 do
    sib re do re

    %141
    do sib sib(la)
    sib1
    R1*2

    %145
    r2 r4 si
    si2 si4 si
    dod dod8 la si4 dod

    %148
    re2. dod8 re
    dod1
    R1*3

    %153
    r2 r8 sib sib sib
    la1
    la

    %156
    la4 sib do sib8 la\mbreak
    sib2 si4. si8
    dod4 la re2~

    %159
    re4. mi8 dod4. re8
    re1

    %161 OOKK agnus dei inizia 3/2
    \override NoteHead.duration-log = 1
    R2.*28
    re4 re4. re8
    \ovr mib2.

    %191
    \rev mi!4 mi4. mi8
    fa4 do do
    re4. mib8 fa4\mbreak

    %194
    sib, do re
    do4. re8 mib fa
    re4\prall sib sib

    %197
    do do la
    sib sib sib
    \ovr do2 \rev fa,4
    \ovr sib2.\rev

    %201  %% inizia 2/2 finale
    \revert NoteHead.duration-log
    la2 re4. do8
    si2. si4
    dod dod re4. mi8

    %204
    dod2 r
    R1*3
    re2~re4. re8

    %209
    do2 do
    sib?4 la sol2
    la re~

    %212
    re4. re8 do2~
    do sib
    la2. si8 do

    %215
    si\breve

}


IIvlIn = \relative do'' {

    R1*6
    r2 fa8\solo mib fa sol
    fa4 sol8 fa mib re mib fa

    %9
    re4 re do8 sib do re
    mib4 re8\prall do sib la sib do\mbreak
    re[mib re do sib do re mib]

    %12
    fa4 sol do,4.\prall sib8
    sib2 r
    R1*8

    %22
    r4 re\solo re sol
    mi?4. fa8 sol4 r
    R1*3

    %27
    r4 fa\solo re8 do re mib
    do4 do r2
    R1*7

    %36
    r2 r4 do\parenthesize \solo
    re fa fa4.\prall mi?8
    fa2 fa\tu

    %39
    sol mib~
    mib4 re do fa8 mib
    re1

    %42 inizia il 3/2
    \override NoteHead.duration-log = 1 R2.*8
    re4.\solo do8 sib la
    sib4 si4. si8

    %52
    do4 re4. re8
    mib8 fa mib re do si
    do re mib re do sib?

    %55
    \ovr la2.
    R2.*24
    \rev sol'4.\solo fa8 mib re

    %81
    mib4. re8 do_\prall si
    do4. re8 mib4
    \ovr re2 \rev re8. mib16

    %84
    do8 si do4. re8
    \ovr si2.
    R2.*28

    %114
    r4 \ovr sol'2
    \rev mib4 \ovr lab2~
    \rev lab4. sib16 lab sol4\mbreak

    %117
    fa4. sol8 lab sib
    sol4. fa8 mib4
    lab fa4.\prall fa8

    %120
    fa4. mib16 re mib4~
    mib8 re re4.\prall do8 \revert NoteHead.duration-log

    %122 inizia il 2/2 OOKK
    do1
    R
    r2 r4 sol'

    %125
    fa mi? re re8 mi
    do2 do4 r
    R1

    %128
    r2 r4 re
    re2 sol4 sol\mbreak
    do, do8 do fa4. fa8

    %131
    sib,2 do~
    do4 sib la la'
    sib2 sib4 do

    %134
    la la la4. sib8
    sol4 fad sol4. la8
    fad2. r4

    %137
    R1*2
    r4 do fa?2
    re mib~

    %141
    mib4 re do re8 mib
    re1
    R1*2

    %145
    r2 r4 re
    sol2 sol4 sol
    mi? mi8 dod re4 mi

    %148
    fa2. mi8 fa
    mi1
    R1*3

    %153
    r2 mi
    dod4 dod re2~
    re2. dod4

    %156
    re mi fad4. fad8\mbreak
    sol4 re sol4. sol8
    sol4 fa8 mi fa4 sol8 fa

    %159
    mi4 fad sol4. la8
    fad1

    %161 OOKK inizia agnus dei inizia 3/2
    \override NoteHead.duration-log = 1 R2.*10
    r4 sol4. sol8
    sol4 fa fa

    %173
    fa sol8 fa mib4
    re re4.\prall do8
    \ovr do2.

    %176
    R2.*20
    r4 \rev re re
    fa do do

    %198
    re sib sib
    \ovr fa'2 \rev re4
    \ovr sol2.\rev

    %201  %% inizia 2/2 finale
    \revert NoteHead.duration-log
    do,2 fa~
    fa4 fa mi2~
    mi4 mi re2

    %204
    mi r
    R1*3
    fa2 sol

    %209
    mib4 do la4. la8
    sib4 do re2~
    re r

    %212
    mib~mib4. mib8
    re2 re
    re1

    %215
    re\breve

}

IIvlIIn = \relative do'' {

    R1*6
    r2 re8\solo do re mib
    re4 mib8 re do sib do re

    %9
    sib4 sib la8 sol la si
    do4 sib?8\prall la sol fa sol la\mbreak
    sib[do sib la sol la sib do]

    %12
    re4 do8 sib la4. sib8
    sib2 r
    R1*8

    %22
    r4 si\solo si si
    do4. do8 do4 r
    R1*3

    %27
    r4 la\solo sib8 la sib do
    la4 la r2
    R1*6

    %35
    r2 r4 sol\solo
    la sib sib4. la8
    sib4 la sol do8 sib

    %38
    la2 re\tu
    mib do4. sib8
    la4 sib sib4. la8

    %41
    sib1

    %42 inizia il 3/2
    \override NoteHead.duration-log = 1 R2.*5
    re4. do8 sib_\prall la
    \ovr sib2 \rev la8. sib16

    %49
    sol8 fad sol4. la8
    \ovr fad2.
    \rev sol4 sol'8 fa mib\prall re

    %52
    mib4 si4. si8
    do re do sib? la sol
    la sib do sib la sol

    %55
    \ovr fad2.
    R2.*25
    \rev do'4.\solo sib8 lab_\prall sol

    %82
    \ovr lab2.~
    \rev lab4 sol sol
    sol4. lab8 fa4\prall

    %85
    \ovr sol2.
    R2.*30
    \rev re'4 sib mib~\mbreak

    %117
    mib8 fa re4.\prall mib8
    mib4. re8 do4
    fa4. mib8 [re8.\prall do16]

    %120
    si4 sol do~
    do8 re si4. do8

    %122 inizia il 2/2
    \revert NoteHead.duration-log do1
    R
    r2 r4 mi?

    %125
    fa do do do8 sib
    do2 do4 r
    R1

    %128
    r2 r4 la
    sib2 sib4 sib\mbreak
    fa' fa8 fa la,4. la8

    %131
    sib2 sol
    la re4 fad
    sol2 re~

    %134
    re4 re re4. re8
    re4. mib8 do4.\prall sib16 do
    re2. r4

    %137
    R1*2
    r2 r4 do
    sib re do re

    %141
    do sib sib(la)
    sib1
    R1*2

    %145
    r2 r4 si
    si2 si4 si
    dod dod8 la si4 dod

    %148
    re2. dod8 re
    dod1
    R1*3

    %153
    r2 r8 sib sib sib
    la1
    la

    %156
    la4 sib do sib8 la\mbreak
    sib2 si4. si8
    dod4 la re2~

    %159
    re4. mi8 dod4. re8
    re1

    %161 OOKK agnus dei inizia 3/2
    \override NoteHead.duration-log = 1
    R2.*10
    r4 mib4. mib8
    mib4 re8 mib re do

    %173
    si4. si8 do4~
    do8 re si4. do8
    \ovr do2.

    %176
    R2.*20
    r4 \rev sib sib
    do do la

    %198
    sib sib sib
    \ovr do2 \rev fa,4
    \ovr sib2.\rev

    %201  %% inizia 2/2 finale
    \revert NoteHead.duration-log
    la2 re4. do8
    si2. si4
    dod dod re4. mi8

    %204
    dod2 r
    R1*3
    re2~re4. re8

    %209
    do2 do
    sib?4 la sol2
    la re~

    %212
    re4. re8 do2~
    do sib
    la2. si8 do

    %215
    si\breve

}

IIsopranoIn = \relative do'' {

    \autoBeamOff

    R1*41

    %42 inizia il 3/2
    R2.*80

    %122 inizia il 2/2 OOKK
    \revert NoteHead.duration-log r2 r4 mi\tu
    sol mi fa re
    mi2 mi4 sol

    %125
    fa mi re re8 mi
    do2 do4 r
    R1

    %128
    r2 r4 re
    re2 sol4 sol\mbreak
    do,4 do8 do fa4. fa8

    %131
    sib,2 do~
    do la
    R1*6

    %139
    r4 do fa2
    re mib~
    mib4 re do(re8[mib)]

    %142
    re2. re4\solo
    do2 do4 re\mbreak
    mib fa sol(fa8\prall) mib

    %145
    re2. re4\tu
    sol2 sol4 sol
    mi? mi8 dod re4 mi

    %148
    fa2. (mi8) fa
    mi1
    sol~

    %151
    sol2 fa4 fa
    fa2(mi\prall)
    re mi

    %154
    dod4 la re2~
    re2.(dod4)
    re1\mbreak

    %157
    R1*4

    %161 OOKK inizia agnus dei inizia 3/2
    \override NoteHead.duration-log = 1
    R2.*15
    r4 mib mib
    do do fa

    %178
    re re mib
    fa fa8 fa mib8. re16
    \ovr do2 \rev do4\mbreak

    %181
    fa fa4. fa8
    \ovr sol2.
    \rev mib4 mib4. mib8

    %184
    \ovr fa2.
    \rev re4 re4. re8
    \ovr re2(\rev do4)

    %187
    re(do4.\prall) sib8
    \ovr sib2.
    R2.*7

    %196
    r4 \rev re\tu re
    fa do do
    re sib sib

    %199
    \ovr fa'2 \rev re4
    \ovr sol2.\rev

    %201  %% inizia 2/2 finale
    \revert NoteHead.duration-log
    do,2 fa~
    fa4 fa mi2~
    mi4 mi re2

    %204
    mi fa\solo~
    fa4 mi fa4. fa8
    mi2.(fad8)[sol]\mbreak

    %207
    fad1
    fa!2\tu sol
    mib4 do la4. la8

    %210
    sib4 do re2
    re r
    mib~mib4. mib8

    %213
    re2 re
    re1
    re\breve

}

IItestoI = \lyricmode {

    Re -- gina _ ange - lorum _

    Re -- gina _ patri - ar -- charum _

    %Re -- gina _ prophe - tarum _

    Re -- gina _ Re -- gina _  apo - sto -- lo - rum

    %Re -- gina _ Re -- gina _ mar -- ty -- rum

    Regi- _ na confes - so -- rum

    Re -- gina _ Re -- gina _  virgi - num

    Re -- gina _ Re -- gina _ sancto - rum om -- ni -- um o -- ra pro no -- bis o -- ra pro no -- bis.

    Agnus _  Dei _ qui tollis _ qui tollis _ peccata _ _ mundi _

    exaudi _ _ nos exaudi _ _ nos exaudi _ _ nos Do -- mi -- ne.

    Agnus _  Dei _ qui tollis _  pec -- cata _ mun -- di

    mi -- se -- re -- re no -- bis mi -- se -- re -- re no -- bis

    mi -- se -- re -- re mi -- se -- re -- re no -- bis mi -- se -- re -- re no -- bis.

}

IIsopranoIIn = \relative do'' {

    \autoBeamOff

    R1*41

    %42 inizia il 3/2
    R2.*80

    %122 inizia il 2/2 OOKK
    \revert NoteHead.duration-log r2 r4 do\tu
    mi? do re si
    do2 do4 do

    %125
    do do8[sol] sol4 sol8 sol
    sol2 sol4 r
    R1

    %128
    r2 r4 la
    sib?2 sib4 sol\mbreak
    do do8 do la4. la8

    %131
    sib2(sol)
    la r
    R1*6

    %139
    r2 r4 do
    sib re do re
    do(sib)(do2\prall)

    %142
    sib2. sib4\solo
    la2 la4 si\mbreak
    do re mib(re8\prall) do

    %145
    si2. si4\tu
    si2 si4 si
    dod dod8 mi si4 mi

    %148
    la,2~la4. la8
    la1
    si2. dod8 re

    %151
    dod4(la)(re2)~
    re2.(dod4)
    re2 r8 sib? sib sib

    %154
    la1~
    la
    la\mbreak

    %157
    R1*4

    %161 OOKK agnus dei inizia 3/2
    \override NoteHead.duration-log = 1
    R2.*15
    r4 sol do
    la la la

    %178
    sib sib do
    re re8 re do8.\prall sib16
    \ovr la2\prall \rev la4\mbreak

    %181
    R2.
    sib4 sib4. sib8
    \ovr do2.

    %184
    \rev la4 la4. la8
    sib4 sib4. sib8
    \ovr sib2.

    %187
    \rev sib4(la4.\prall) sib8
    \ovr sib2.
    R2.*7

    %196
    r4 \rev sib\tu sib
    do do la
    sib sib sib

    %199
    \ovr la2 \rev fa4
    \ovr sib2.\rev

    %201  %% inizia 2/2 finale
    \revert NoteHead.duration-log
    la2 re~
    re4 re mi mi
    mi8 [re dod si] ( la2)

    %204
    la la4.\solo la8
    si4 dod re2~
    re2.(dod4)\mbreak

    %207
    re1
    re2\tu~re4. re8
    do2 do

    %210
    sib4(la)
    (sol2)
    la re~re4. re8 do4 sib

    %213
    la4. la8 sib4 sol
    la1\downprall
    sol\breve

}

IItestoII = \lyricmode {

    Re -- gina _ ange - lorum _

    Re -- gina _ patri - ar -- charum _

    %Re -- gina _ prophe - tarum _

    Re -- gina _ Re -- gina _  apo - sto -- lo -- rum

    %Re -- gina _ Re -- gina _ mar -- ty -- rum

    Re -- gina _ confes - so -- rum

    Re -- gina _ Re -- gina _  virgi - num

    Re -- gina _ Re -- gina _ sancto - rum om -- ni -- um o -- ra pro no -- bis o -- ra pro no -- bis.

    Agnus _  Dei _ qui tollis _ qui tollis _ peccata _ _ mundi _

    exaudi _ _ nos exaudi _ _ exaudi _ _ nos Do -- mi -- ne.

    Agnus _  Dei _ qui tollis _  pec -- cata _ mun -- di

    mi -- se -- re -- re no -- bis mi -- se -- re -- re no -- bis

    mi -- se -- re -- re  no -- bis mi -- se -- re -- re mi -- se -- re -- re no -- bis.

}

IIalton = \relative do' {

    \autoBeamOff

    r2 fa8 [mib fa sol](
    fa4)(sol8)[fa](mib8)[re mib fa](
    re4) re do8[sib do re](

    %4
    mib4)(re8\prall) [do](sib)[la sib do](
    re)[mib re do sib do re mib](
    fa4) sol do,4.\prall sib8

    %7
    sib2 r
    R1*5
    r2 re8[do re sib](

    %14
    do4)(re8)[mib](fa8)[mib fa do](
    re4) sib re8[do re mi!](
    fa4.) sol8 mi4. fa8

    %17
    fa2 r
    R1*3
    r4 fad fad fad\mbreak

    %22
    sol4. sol8 sol4 r
    r mi mi mi
    fa4. fa8 fa4 r

    %25
    r re4. mib8 fa4
    sib, do re8 do re mi
    do4 do r2

    %28
    r fa
    re sol
    mi4 fa fa(mi)

    %31
    fa2 r
    R1
    r2 la\mbreak

    %34
    sib4 fa fa2\prall
    sol2 mib
    mib4 re do2\prall

    %37
    sib r
    R1*4

    %42 inizia il 3/2
    \override NoteHead.duration-log = 1 R2.*27
    r4 lab'4. lab8
    fa4. fa8 fa fa

    %71
    \ovr re2\prall \rev re4
    sol4.(fa8)[mib\prall re](
    mib4.)(re8)[do\prall si](

    %74
    \ovr do2)\rev do4
    R2.
    fa4.(mib8)[re\prall do](

    %77
    \ovr re2) \rev re4
    mib4. fa8 sol4\mbreak
    sol fa4.\prall (mib8)

    %80
    \ovr re2.
    R2.*4
    \rev r4 r8 sol sol8. re16

    %86
    mib4. mib8 mi8. mi16
    \ovr fa2 \rev sol8. lab16
    \ovr sib2(\rev lab8.\prall)[sol16](

    %89
    \ovr lab2.)~
    \rev lab4.(sol8)[fa mi!](
    \ovr fa2.)(\mbreak

    %92
    fa2)(\rev mi4)
    \ovr fa2 r4
    r \rev lab4. lab8

    %95
    fa4. fa8 fa fa
    \ovr re2 \rev re4
    r r8 mib mib8. mib16

    %98
    \ovr mib2.
    r4 r8\rev mib mib8. mib16
    fa4 fa4. fa16 sol

    %101
    \ovr mib2.\downprall
    re
    R2.*4

    %107
    r4 sol2
    \rev mib4 \ovr lab2
    fa\prall \rev mib4

    %110
    mib(\ovr re2\prall)
    \rev do4 \ovr sol'2~
    \rev sol4 fa fa~

    %113
    fa mib4.\prall re8
    mib4(\ovr re2\prall)
    do r4

    %116
    R2.*6 \rev

    %122 inizia il 2/2 OOKK
    \revert NoteHead.duration-log R1*2
    r2 r4 sol'\tu
    la sol sol fa8 sol

    %126
    mi?2 mi4 mi
    mi fad sol4. la8
    fad2 fad4 fad

    %129
    sol2 sol4 sol\mbreak
    la4 la8 sol fa4. re8
    sol2. (la4)

    %132
    fad1
    R1*3
    r2 r4 fad\solo

    %137
    sol2 mi4 mi
    fa? fa fa4.\prall mi8
    fa2. fa4\tu

    %140
    fa fa sol sol
    fa1
    fa

    %143
    R1*2
    r2 r4 sol
    sol2 sol4 sol

    %147
    la la8 la re,4 sol
    fa2~fa4. sol8
    la1

    %150
    R1*2
    r2 la
    fad4 re sol2~

    %154
    sol fa?4 fa
    mi2.(fad8)[(sol)]
    fad1

    %157
    R1*4

    %161 OOKK agnus dei inizia 3/2
    \override NoteHead.duration-log = 1
    r4 la la
    sib sib sib
    sol sol8 sol la8. la16

    %164
    fad4 fad r
    R2.
    r4 fa?4. mib8

    %167
    re4 re sol~
    sol4. sol8 fa4~\mbreak
    \ovr fa2 \rev mib4

    %170
    mib(re4.\prall) mib8
    \ovr do2 r4
    R2.*24

    %196
    r4 \rev fa\tu fa
    fa fa fa
    fa mi mi

    %199
    \ovr fa2 \rev fa4
    \ovr fa2(\rev mi4)\rev

    %201  %% inizia 2/2 finale
    \revert NoteHead.duration-log
    fa2 la~
    la4 la sol2~
    sol4 sol fa2

    %204
    mi r
    R1*3
    r4 sib'2 ~ sib8 sib

    %209
    la2 fad
    sol1
    fad

    %212
    r4 sol8 sol la4 sol
    fad2(sol)~
    sol2.(fad4)

    %215
    sol\breve

}

IItestoIII = \lyricmode {

    Ro -- sa ro -- sa  my -- sti -- ca ro -- sa ro -- sa  my -- sti -- ca

    turris _ Da -- vi -- dica _ turris _ e -- bur -- nea _

    ia -- nua _ caeli _ stella _ matu _ -tina _ o -- ra o -- ra pro no -- bis

    o -- ra pro no -- bis o -- ra pro no -- bis.

    Conso- _ latrix _ afflic- _ to -- rum  sa -- lus sa -- lus sa -- lus in -- fir -- mo -- rum

    re -- fugi- _ um re -- fugi- _ um pecca- _ to -- rum

    conso- _ latrix _ afflic- _ to -- rum

    aux -- ili- _ um aux -- ili- _ um chri -- stia- _ no -- rum

    o -- ra o -- ra pro no -- bis o -- ra o -- ra pro no -- bis.

    %Regina angelorum

    Re -- gina _ patri - ar -- charum _

    Re -- gina _ prophe - tarum _

    Re -- gina _ Re -- gina _  apo - sto -- lo -- rum

    Re -- gina _ Re -- gina _ mar -- ty -- rum

    Re -- gina _ confes - so -- rum

    %Regina virginum

    Re -- gina _ Re -- gina _ sancto - rum om -- ni -- um o -- ra pro no -- bis pro no -- bis.

    Agnus _  Dei _ qui tollis _  peccata _ _ mundi _

    parce _ nobis _ par -- ce no -- bis Do -- mi ne.

    Agnus _  Dei _ qui tollis _  pec -- cata _ mun  -- di

    %exaudi _ _ nos exaudi _ _ nos exaudi _ _ nos Do -- mi -- ne.

    mi -- se -- re -- re no -- bis mi -- se -- re -- re no -- bis mi -- se -- re -- re no -- bis.

}

IItenoren = \relative do' {

    \autoBeamOff

    R1*41

    %42    inizia 3/2
    \override NoteHead.duration-log = 1
    \once \override Stem.transparent = ##t R2.*13
    r4 r8 re re8. la16
    sib4. sib8 si8. si16\mbreak

    %57
    \ovr do2 \rev re8. mib16
    \ovr fa2(\rev mib8.\prall) [re16]
    \ovr mib2.~

    %60
    \rev mib4. re8[do si](
    \ovr do2.)~
    do2(\rev si4)

    %63
    \ovr do2 r4
    R2.*5
    r4 \rev fa4. fa8

    %70
    re4. re8 re re
    \ovr si2 \rev si4
    R2.

    %73
    do4.(sib?8)[lab\prall sol](
    \ovr lab2) \rev lab4
    fa'4.(mib8)[re\prall do](

    %76
    re4.)(do8)[si\prall la?](
    \ovr si2) \rev si4
    \ovr do2 \rev do4\mbreak

    %79
    la(\ovr re2)
    si2.
    R2.*8

    %89
    \rev r4 do4. do8
    \ovr do2.
    sib?2 \rev sib4\mbreak

    %92
    lab \ovr sol2\prall
    fa2 r4
    r \rev fa'4. fa8

    %95
    re4. re8 re re
    \ovr si2 \rev si4
    R2.

    %98
    r4 r8 si si8. si16
    \ovr do2.
    re2~\rev re8 re16 mib

    %101
    \ovr do2.
    si2.
    R2.*5

    %108
    r4 do2
    \rev la4(si) do
    \ovr do2(\rev si4)

    %111
    do \ovr sib!2
    \rev la4 \ovr re2
    \rev si4 sol do~

    %114
    \ovr do2(\rev si4)
    \ovr do2 r4
    R2.*6\rev

    %122 inizia il 2/2
    \revert NoteHead.duration-log
    R1*2
    r2 r4 mi?\tu
    re do do do8 si

    %126
    do2 do4 r
    R1
    r2 r4 re

    %129
    re2 mib4 mib\mbreak
    mib mib8 mib re4. re8
    re2(do)

    %132
    re1
    R1*3
    r2 r4 re\solo

    %137
    si2 do4 si
    la la sol(la8) sib?
    la2. la4\tu

    %140
    sib sib do sib
    la(sib2)(la4)
    sib1

    %143
    R1*2
    r2 r4 si
    mi2 mi4 mi

    %147
    dod dod8 la si4 dod
    re2.(dod8) re
    dod1

    %150
    R1*3
    r2 mi~
    mi re4 re

    %155
    mi1\downprall
    re\mbreak
    R1*4

    %161 OOKK agnus dei inizia 3/2
    \override NoteHead.duration-log = 1
    R2.*3
    r4 re re
    mib mib mib

    %166
    do do8 do re8. re16
    si4 si mib~
    mib4. mib8 re do\mbreak

    %169
    \ovr si2 (\rev  do4)~
    do(si4.) do8
    \ovr do2 r4

    %172
    R2.*24
    r4 \rev re\tu re
    do do do

    %198
    sib? sib sib
    \ovr do2 \rev re4
    \ovr sib2.\rev

    %201  %% inizia 2/2 finale
    \revert NoteHead.duration-log
    do2 r
    si2. si4
    dod dod re2

    %204
    dod2 r
    R1*3
    re2~re4. re8

    %209
    mib2 re
    re4(do)(sib2)
    la sib4. la8

    %212
    sol4 sol do4. do8
    do2 sib
    la2.(si8) [do]

    %215
    si\breve

}

IItestoIV = \lyricmode {

    Re -- fugi- _ um re -- fugi- _ um pecca- _ to - - rum

    conso- _ latrix _ afflic- _ to -- rum  sa -- lus sa -- lus in -- fir -- mo -- rum

    conso- _ la -- trix af -- flicto- _ rum conso- _ latrix _ afflic- _ to -- rum

    aux -- ili- _ um chri -- stia- _ no -- rum

    o -- ra pro no -- bis o -- ra o -- ra pro no -- bis.

    %Regina angelorum

    Re -- gina _ patri - ar -- charum _

    % Re -- gina _ prophe - tarum _

    Re -- gina _ Re -- gina _  apo - sto -- lo -- rum

    Re -- gina _ Re -- gina _ mar -- ty -- rum

    Re -- gina _ confes - so -- rum

    %Regina virginum

    Re -- gina _ Re -- gina _ sancto - rum om -- ni -- um o -- ra pro no -- bis.

    Agnus _  Dei _ qui tollis _  peccata _ _ mundi _

    par -- ce nobis _  Do -- mi ne.

    Agnus _  Dei _ qui tollis _  pec -- cata _ mun  -- di

    %exaudi _ _ nos exaudi _ _ nos exaudi _ _ nos Do -- mi -- ne.

    mi -- se -- re -- re no -- bis mi -- se -- re -- re no -- bis mi -- se -- re -- re mi -- se -- re -- re no -- bis.

}

IIbasson = \relative do {

    \autoBeamOff

    R1*41

    %42 inizia il 3/2
    \override NoteHead.duration-log = 1 re'4.(do8)[sib\prall la](
    \ovr sib2) \rev sib4
    do4.(sib8)[la\prall sol](

    %45
    la4.)(sol8)[fad mi?](
    \ovr fad2) \rev fad4
    r fad fad

    %48
    \ovr sol2 ( \rev fa?8.) [sol16]
    \ovr mib2.\downprall
    re

    %51
    R2.*16
    r4 \rev do'4. do8
    \rev lab4. lab8 lab lab

    %69
    \ovr fa2 \rev fa4
    R2.
    r4 sol8[fa mib\prall re](

    %72
    mib4.)(re8)[do_\prall sib](
    do4) do r
    r do'8[sib lab\prall sol](

    %75
    lab4.)(sol8)[fa\prall mi!](
    fa4) fa r
    r sol sol

    %78
    do,4. re8 mib4\mbreak
    fa \ovr fa2\prall
    sol2.

    %81
    R2.*5
    r4 r8 \rev do do8. sol16
    lab4. lab8 sol8.\prall fa16

    %88
    \ovr mi!2.
    fa2 \rev mib4
    \ovr re2.

    %91
    (reb)\mbreak
    \rev do4 do'4. do8
    lab4. lab8 lab lab

    %94
    \ovr fa2 \rev fa4
    R2.
    r4 r8 sol sol8. sol16

    %97
    \ovr sol2.
    \rev r4 r8 sol sol8. sol16
    \ovr lab2.

    %100
    \rev fa4. fa8 sol4
    \ovr do,2.
    sol'

    %103
    R2.*7
    r4 sol2
    mib \rev mib4

    %112
    \ovr fa2.
    sol2 \rev lab8 [fa]
    \ovr sol2.

    %115
    do,2 r4
    R2.*6 \rev

    %122 inizia il 2/2 OK
    \revert NoteHead.duration-log
    R1*2
    r2 r4 mi?\tu
    fa do sol' sol8 sol

    %126
    do,2 do4 sol'
    sol la sib4. do8
    la2 la4 re,

    %129
    sol2 sol4 sol\mbreak
    fa4 fa8 fa fa4. sol8
    mib1\downprall

    %132
    re
    R1*6
    r2 r4 fa

    %140
    sib sib mib, mib
    fa1
    sib,

    %143
    R1*2
    r2 r4 sol'
    mi?2 mi4 mi

    %147
    la la8 sol fa4 mi
    re2~re4. re8
    la'1

    %150
    R1*3
    re2 sib4 sol
    la1(

    %155
    la,)
    re\mbreak
    R1*4

    %161 OOKK agnus dei inizia 3/2
    \override NoteHead.duration-log = 1
    R2.*3
    r4 la' si
    do do do

    %166
    lab lab8 sol fa8. fa16
    sol4 sol mib8. mib16
    \ovr fa2\rev fa4\mbreak

    %169
    \ovr sol2.~
    sol2~\rev sol8 sol
    \ovr do,2 r4

    %172
    \rev R2.*9
    re4 re4. re8
    \ovr mib2.

    %183
    \rev do4 do4. do8
    \ovr re2.
    \rev sib4 sib4. sib8

    %186
    \ovr mib2.
    fa2~\rev fa8 fa
    \ovr sib,2.

    %189
    R2.*7
    \rev r4 sib'\tu sib
    la la la

    %198
    sol sol sol
    \ovr la2 \rev sib4
    \ovr sol2\downprall r4\rev

    %201  %% inizia 2/2 finale
    \revert NoteHead.duration-log
    fa1
    sol2. sol4
    la la re,2

    %204
    la' fa4.\solo fa8
    sol2 re
    la'1\mbreak

    %207
    \parenthesize re,1
    sib'2\tu~sib4. sib8
    do2 re

    %210
    sol,1
    re
    do2~do4. do8

    %213
    re2 sol
    re1
    sol\breve

}

IItestoV = \lyricmode {

    Sa -- lus sa -- lus  infir- _ mo - rum

    conso- _ latrix _ afflic- _ to -- rum  sa -- lus sa -- lus salus _ salus _ in -- firmo-  _ rum

    re -- fugi- _ um re -- fugi- _ um pecca- _ to -- rum

    conso- _ latrix _ afflic- _ to -- rum

    aux -- ili- _ um aux -- ili- _ um chri -- stia- _ no -- rum

    o -- ra pro no -- bis pro no -- bis.

    %Regina angelorum

    Re -- gina _ patri - ar -- charum _

    Re -- gina _ prophe - tarum _

    Re -- gina _ Re -- gina _  apo - sto -- lo -- rum

    %Regina martyrum

    Re -- gina _ confes - so -- rum

    %Regina virginum

    Re -- gina _ Re -- gina _ sancto - rum om -- ni -- um o -- ra pro no -- bis.

    Agnus _  Dei _ qui tollis _  peccata _ _ mundi _

    par -- ce nobis _  Do -- mi ne.

    Exaudi _ _ nos exaudi _ _ nos exaudi _ _ nos Do -- mi -- ne.

    Agnus _  Dei _ qui tollis _  pec -- cata _ mun -- di

    mi -- se -- re -- re no -- bis mi -- se -- re -- re no -- [bis] mi -- se -- re -- re no -- bis

    mi -- se -- re -- re no -- bis.

}

IIbcn = \relative do {

    sib'1~
    sib2 la
    sib4 sib, fa' mib8 re

    %4
    do4 re mib re8 do
    sib4 sib'8 la sol sol fa mib
    re4 mib fa fa,

    %7
    sib1
    sib'2 la
    sib4 sib, fa' mib8 re

    %10
    do4 re mib re8 do\mbreak
    sib2 mib
    re4 mib fa fa,

    %13
    sib2 sib'~
    sib la
    sib1

    %16
    la2 sol
    fa4 sol la2
    sib sol

    %19
    la re8 do sib la
    sol2 la
    re, re'\mbreak

    %22
    sol,1
    do
    fa,

    %25
    sib2. re,4
    mib2 sib
    fa' sib,

    %28
    fa'4 sol la fa
    sib2 sol
    la4 fa do' do,

    %31
    fa2 sib,
    do4 fa, do'2
    fa, fa'4 mib\mbreak

    %34
    re1
    mib2 do
    fa4 sib, fa2

    %37
    sib4 fa do'2
    fa,4 fa'8 mib re4 sib
    mib2. do4

    %40
    fa sib, fa2
    sib1

    %42    inizia 3/2
    \override NoteHead.duration-log = 1
    \once \override Stem.transparent = ##t fad'2.
    sol4. fa?8 mib re

    %44
    mib4. re8 do sib
    \override Stem.transparent = ##t do2.\mbreak
    re

    %47
    re
    sol2 \revert Stem.transparent fa8. sol16
    \override Stem.transparent = ##t mib2.

    %50
    re
    sol
    \revert Stem.transparent do,4 \override Stem.transparent = ##t sol2

    %53
    do2.
    do
    re

    %56
    \rev sol4. sol8 [sol8. re16]\mbreak
    \ovr mib2 \rev re8. do16
    \ovr si2.

    %59
    do2 \rev sib?4
    \ovr lab2.
    lab

    %62
    sol
    do
    fa,

    %65
    sol
    sol
    do\mbreak

    %68
    fa,
    fa'
    fa

    %71
    \rev sol4. fa8 mib re
    mib4. re8 do si
    do4 do'8 sib lab sol

    %74
    lab4. sib8 lab sol
    \ovr fa2.
    fa

    %77
    fa
    \rev do4. re8 mib4\mbreak
    \ovr fa2.

    %80
    sol
    do,
    do

    %83
    sib
    lab
    sol

    %86
    \rev do4. do'8[do8. sol16]
    \ovr lab2 \rev sol8. fa16
    \ovr mi!2.

    %89
    fa2 \rev mib4
    \ovr re2.
    reb\mbreak

    %92
    do
    fa
    fa

    %95
    fa
    sol
    sol

    %98
    sol
    lab
    fa2 \rev sol4

    %101
    \ovr do,2.
    sol'
    sol\mbreak

    %104
    lab
    fa2 \rev sol4
    \ovr do,2.

    %107
    sol'
    \rev do4 \ovr fa,2
    \rev fa4 sol lab

    %110
    fa \ovr sol2
    \rev do,4. re8 mib4
    \ovr fa2.

    %113
    sol2 \rev lab8 fa
    sol4 \ovr sol,2
    \rev do4 fa, fa'

    %116
    sib8 lab sol fa mib4\mbreak  %%% fine pagina 8
    lab sib sib,
    \ovr mib2 \rev lab4

    %119
    \ovr fa2 \rev fa4
    \ovr sol2 \rev lab4
    fa sol sol,

    %122
    \revert NoteHead.duration-log  %%% comincia il 2/2
    do1
    do4 do' fa, sol
    do,2 do4 mi

    %125
    fa do sol' sol,
    do2 do4 do
    sib la sol2

    %128
    re' re4 re
    sol2 sol\mbreak
    fa1

    %131
    mib
    re
    sol2 sol4 sol

    %134
    fa1
    mib
    re2. re4

    %137
    sol2 do,4 do
    re sib do2
    fa,2. fa'4

    %140
    sib2 mib,
    fa fa,
    sib1

    %143
    fa'2 mib4 re\mbreak
    do2~do8 re mib fa
    sol2. sol4

    %146
    mi?2. mi4
    la la8 sol fa4 mi
    re1

    %149
    la'
    mi
    fa2 re

    %152
    la'1
    sib2 sol
    la1

    %155
    la,
    re\mbreak
    sol2. mi4

    %158
    fa2 re
    la' la,
    re1

    %161 OOKK agnus dei inizia 3/2
    \override NoteHead.duration-log = 1 \ovr re2.
    re
    \rev mib4. re8 do4

    %164
    \ovr re2 \rev sol4
    \ovr do,2.
    \rev lab'4. sol8 fa4

    %167
    \ovr sol2 \rev mib4\mbreak
    \ovr fa2.\mbreak
    sol

    %170
    sol,
    \rev do4. re8 mib4
    \ovr fa2.

    %173
    sol2 \rev lab4
    fa sol sol,
    \ovr do2.

    %176
    do
    fa
    sib,2 \rev mib4

    %179
    \ovr re2 \rev mib4
    fa4. sol8 fa mib\mbreak
    \ovr re2.

    %182
    mib
    do
    re

    %185
    sib
    mib
    \rev fa4 \ovr fa,2

    %188
    sib2.
    \rev sib'4 sib4. sib8
    \ovr mib,2.

    %191
    \rev do4 do4. do8
    \ovr fa2.
    \rev sib,4. do8 re4\mbreak

    %194
    mib do sib
    fa' \ovr fa,2
    \rev sib4 sib' sib

    %197
    \ovr la2 \rev la4
    \ovr sol2.
    la2 \rev sib4

    %200
    \ovr sol2.\rev

    %201  %% inizia 2/2 finale
    \revert NoteHead.duration-log
    fa1
    sol
    la2 re,

    %204
    la' fa
    sol re
    la' la,\mbreak

    %207
    re re'4 do
    sib1
    do2 re

    %210
    sol,1
    re2 sib
    do1

    %213
    re2 sol,
    re' re,
    sol\breve

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*11
    s2 <3>
    s1
    <4 2>
    s
    <6>2 <6>
    s1
    s2 <5 _->4 <6>
    <_+>2 <_+>
    s2 <_+>
    <_+>1
    <_+>
    s1*9
    <7>2 <4>4. <3>8
    s1*3
    <7>2 <4>4. <3>8
    s2 <4>4. <3>8
    s1
    <5>2 <6>
    <7> <4>4. <3>8
    s1

    %%% 3/2
    s2.*2
    <6>2.
    <6 _->2 <_+>4
    s2.*3
    <7>2 <6>4
    <_+>2.
    <_->4 <_+>2
    <_->4 <_+>2
    <5 _->2.
    <6 _->
    <_+>
    s2 <_+>4
    s2 <6+>4
    s2.
    s
    <7>
    <6>
    <6 4>2 <5 3>4
    <_->4 <_+>2
    <5 _->4 <6 _+>2
    <7 3+>2 <6 4>4
    <5 4>4 <5 3>2
    <_->2.
    <_->2.
    <_->2.
    <6 _->
    <_+>
    s2.*3
    <_->2.
    <6 _->
    <4+>
    s
    <_+ 9 7>4 <_- 8 6>2
    s2.
    <5 _->
    <6 _->
    <7>4 <6>2
    <7>4 <6>2
    <_+>2.
    <_->2 <_+>4
    <6>2 <6+>4
    <5->2.
    <_->2.
    <7>
    <6>
    <6 4>4 <5 4> <3>
    <_->2.
    <_->
    <6 _->
    <_+>
    <_+ 6->
    <_+ 6->
    <5>
    <6>2 <_+>4 <_->2.
    <_+>
    <6- _+>
    <5>
    <6>2 <_+>4
    <_->2.
    <_+>
    s4 <_->2
    <_+>4 <_+>2
    <7 5>4 <5 4> <3>
    s2.
    <_+ 9 7>4 <_- 8 6>2
    <_+ 7>2.
    <6- 4>4 <5 4> <3>
    s2.
    <7>
    s4 <5 4> <3>
    s2.
    <6 _->
    <7 _+>
    <7 5>4 <4> <3>

    %% inizio regina angelorum
    <_+>1
    s2 <6>4 <_+>
    s1
    s2 <4>4 <3>
    s1
    <4+>
    <_+>
    <9>2 <6->
    <7> <6>
    <7> <6>
    <_+ 7>1
    <5>
    <6>
    <7>2 <6>
    <_+>1
    <_+>2 <5 _+>4 <6>
    <5>2 <4>4 <3>
    s1
    s2 <6>
    <7 3>4 <6 4> <5 4> <3>
    s1*4
    <5>1
    <_+>2 <4+>4 <6+>
    s1
    <_+>
    s
    <9 7 5+>
    <4>2. <3>4
    <9 7 5+>1
    <7 3+>2 <6 4>
    <5 4>2. <3>4
    <_+>1
    s
    <9 7 5+> s
    <_+>

    %%% inizia il 3/2 finale Agnus Dei
    <_+>2.
    <6- _+>
    s
    s2 <_+>4
    <_->2.
    s
    s
    <9 7>2 <8 6>4
    <7 3+>2 <6 4>4
    <5 4>4 <3>2
    s2.
    <9 7 _->4 <8 6 _->2
    <_+>2 <5>4
    s2.
    <_->
    <_->
    s
    s2 <6>4
    <6>2 <6>4
    s2.
    <6> s
    <6>
    <5 _->
    s
    <7>2 <6>4
    <6 4> <5 4> <3>
    s2.*3
    <_+>2.
    s2.*3
    <5 4>4 <3>2
    s2.
    <6>
    <7>4 <6+>2
    s2.
    <7>2 <6+>4
    <5>2 <6>
    <9 7 _+>2 <8 6 _+>2
    <_+ 7>1
    s
    <_+>
    <5 4>2 <3>
    <_+>1
    s
    s2 <7 _+>
    s1
    s
    <9 7 _->2 <8 6>
    <7 _+>

}


forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 2 = 55
    \set Score.currentBarNumber = #209
    s1*41\break
    \once \override Score.RehearsalMark.extra-offset = #'(7 . 0)  \mark \markup\huge "[6.] Salus infirmorum"
    \time 3/4
    \tempo 4 = 67
    s2.*80\break
    \once \override Score.RehearsalMark.extra-offset = #'(7 . 0)  \mark \markup\huge "[7.] Regina Angelorum"
    \time 2/2
    \tempo 2 = 65
    s1*39\break
    \once \override Score.RehearsalMark.extra-offset = #'(7 . 0)  \mark \markup\huge "[8.] Agnus Dei"
    \time 3/4
    \tempo 4 = 67
    s2.*40\break
    \time 2/2
    \tempo 4 = 55
    s1*14
    s\breve
    \bar "|."

}

IIflI = {
    %\notypeset
    <<\IIflIn \forma>>

}

IIflII = {
    <<\IIflIIn \forma>>

}

IIvlI = {
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIsopranoI = {
    \new Voice = "rosa1"
    <<\IIsopranoIn \forma>>
}

IIsopranoII = {
    \new Voice = "rosa2"
    <<\IIsopranoIIn \forma>>
}

IIalto = {
    \new Voice = "rosa3"
    <<\IIalton \forma>>
}

IItenore = {
    \new Voice = "rosa4"
    <<\IItenoren \forma>>
}

IIbasso = {
    \clef bass
    \new Voice = "rosa5"
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
#(set-global-staff-size 15.5)


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
    title = \markup "Litanies de la Vierge [H. 85] "
    composer = \markup {"M. A. Charpentier (1643-1704)"}
}

\markup \huge {[1.] Prelude}

\score {
    <<

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \time 3/4\override Staff.TimeSignature.style = #'single-digit r1^\markup\center-align "[I] Flutes"}
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IflI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \time 3/4\override Staff.TimeSignature.style = #'single-digit r4^\markup\center-align "[II] Flutes" sol''4. la''8}
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IflII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \time 3/4\override Staff.TimeSignature.style = #'single-digit r2.^\markup\center-align "[I] Violons"}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \time 3/4\override Staff.TimeSignature.style = #'single-digit r4^\markup\center-align "[II] Violons" sol''4. la''8}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IvlII\global
            >>
        >>

        \new ChoirStaff  \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[I. Soprano]"}
                \set Staff.midiInstrument = #"voice oohs"
                \IsopranoI \global
                \new Lyrics \lyricsto "kyrie1" \ItestoI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[II. Soprano]"}
                \set Staff.midiInstrument = #"voice oohs"
                \IsopranoII \global
                \new Lyrics \lyricsto "kyrie2" \ItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 3/4\override Staff.TimeSignature.style = #'single-digit r2.^\markup\center-align "[Alto]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Ialto \global
                \new Lyrics \lyricsto "kyrie3" \ItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major \override Staff.TimeSignature.style = #'single-digit   \time 3/4 r2.^\markup\center-align"[Tenor]"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \Itenore \global
                \new Lyrics \lyricsto "kyrie4" \ItestoIV
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basse]"}
                \set Staff.midiInstrument = #"voice oohs"
                \Ibasso \global
                \new Lyrics \lyricsto "kyrie5" \ItestoV
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Viole""et Clavecin"}
            \set Staff.midiInstrument = #"contrabass"
            \Ibc\global
        >>
    >>

    \layout {

        indent = 2.5\cm
        incipit-width =2.5\cm

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

\markup \huge {[5.] Rosa mystica}

\score {
    <<

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2
        } <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \time 2/2\override Staff.TimeSignature.style = #'single-digit r1^\markup\center-align "[I] Fl[utes]"}
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IIflI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \time 2/2\override Staff.TimeSignature.style = #'single-digit r1^\markup\center-align "[II] Fl[utes]"}
                \clef violin
                \set Staff.midiInstrument = #"flute"
                \IIflII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \time 2/2\override Staff.TimeSignature.style = #'single-digit r1^\markup\center-align "[I] Vio[lo]ns"}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \time 2/2\override Staff.TimeSignature.style = #'single-digit r1^\markup\center-align "[II] Vio[lo]ns"}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIvlII\global
            >>
        >>

        \new ChoirStaff  \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[I. Soprano]"}
                \set Staff.midiInstrument = #"voice oohs"
                \IIsopranoI \global
                \new Lyrics \lyricsto "rosa1" \IItestoI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{"[II. Soprano]"}
                \set Staff.midiInstrument = #"voice oohs"
                \IIsopranoII \global
                \new Lyrics \lyricsto "rosa2" \IItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key fa\major \time 2/2\override Staff.TimeSignature.style = #'single-digit r2^\markup\center-align "[Alto]"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIalto \global
                \new Lyrics \lyricsto "rosa3" \IItestoIII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major \override Staff.TimeSignature.style = #'single-digit   \time 2/2 r1^\markup\center-align"[Tenor]"}
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \IItenore \global
                \new Lyrics \lyricsto "rosa4" \IItestoIV
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basse]"}
                \set Staff.midiInstrument = #"voice oohs"
                \IIbasso \global
                \new Lyrics \lyricsto "rosa5" \IItestoV
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Viole""et Clavecin]"}
            \set Staff.midiInstrument = #"contrabass"
            \IIbc\global
        >>
    >>

    \layout {

        indent = 2.5\cm
        incipit-width =2.5\cm

        \context	{
            %\Staff \RemoveEmptyStaves
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
