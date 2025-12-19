\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

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

dolce = _\markup\italic"doux"

fort = _\markup\italic"fort"

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



IdsIn = \relative do'' {

    r2 la'~
    la sol4 fa
    sol1

    %4
    fa2. fa4
    fa2. sol4
    la sol fa2~

    %7
    fa mi4 re
    mi1
    fa2. mib4

    %10
    re2. sol4
    mi? fa8 sol mi4.\prall fa8
    fa1

    %13
    r2 r4 do8 re
    mi mi mi do sol' [sol re8. mi16]
    fa4 do re8[mi fa mi16 re]

    %16
    sol8 mi la sol fa[mi fa8. sol16]
    mi8.[fa16 sol8 mi] fa[sol la8. sib16]\mbreak
    sol4\prall mi8 sol do, fa fa mi

    %19
    fa4 do4. do8[do8. do16]
    sib8[sib16 do re8 mib] fa2~
    fa4 mib8 re do fa mib lab

    %22
    sol2~sol8[fa fa8. sol16]\mbreak
    mi4\prall do8 do re mi fa sol
    mi\prall re16 do fa4. fa8 mib4~

    %25
    mib8 mib reb4 do8[reb mib8. fa16]
    re?8[mi! fa8. sol16] lab8 [mi fa8. sol16]
    mi4\prall fa4. sol16[lab mi8.\prall fa16]\mbreak

    %28
    fa4\prall r r8 do re mi
    fa2 r
    R1*11

    %41
    r4 la8. la16 la8(sol) sol8. sol16
    sol8[fa fa8. fa16] fa8[mi re mi16 fa]
    mi8 fa sol4 r8 sol, la si\mbreak

    %44
    do mi fa sol sol fa fa mi
    fa4. mi8 fa re mib do
    re[re mi fad sol la fad8. sol16]

    %47
    sol8 sol mi fa re16[mi fa8 fa8.\prall mi16]

%%% 3/2
    \override NoteHead #'duration-log = 1
    \tweak Stem.transparent ##t fa2 r4
    R2.*3

    %52
    r4 fa, la
    re mi fa
    fa4. sol8 mi4

    %55
    fa do r
    R2.*3
    r4 r la'~

    %60
    la sol4. fa8
    mi4 mi mi
    la, la' sol

    %63
    \tweak Stem.transparent ##t fa2 fad4
    sol sol la
    re, sol8[(fa) mi(re)]\mbreak

    %66
    dod4 re8[(mi) fa(la)]
    sol[(fa) mi(fa) sol(fa)]
    re4. mi8 dod4

    %69
    \tweak Stem.transparent ##t re2.
    R \revert NoteHead #'duration-log

%%% 4/4
    fa1~

    %72
    fa2 mi4.\prall mi8
    fa4. mi8 re2
    do4. do8 sib[la sol la16 sib]

    %75
    la4. la'8 sib[sib16 la sol la sol fa]
    mi[fa sol mi la sol fa mi] re[mi fa mi re8 sol16 fa]\mbreak
    mi4 fa8 sol16 la re,4. re8

    %78
    mi4 fa4. sol8 mi4\prall
    fa do8 re mi[fa] sol do,
    fa4 sol8 la sib[la sol8.\prall fa16]

    %81
    mi4 fa4. sol8 [mi8.\prall fa16]
    fa4 r r2

%%% 3/4
    R2.*8

    %% 2/2
    R1

    %92 % 4/4
    R1*11
    r4 mi8. mi16 fa8[fa mi fad16 sol]
    fad4. fad8 sol[la16 sib fad8. sol16]

    %105
    sol4 re8. re16 mib8[mib re mi16 fa]
    mi8[do fa8. sol16] la8[sol fa sol16 la]\mbreak
    re,4. mi8 fa[fa, fa8. sol16]

    %108
    la8[sib do re mib fa16 sol fa8.\prall mib16]
    re8 sib sib'4. la8[sol8.\prall fa16]
    fa2 r8 mi16[mi mi8 mi]

    %111
    fa4 fa r8 fa16[fa fa8 fa]\mbreak
    sol4 sol8 sol la8.[sol16 la8 fa]
    sol4 sol8 mi sol[mi sol8. sol16]

    %114
    mi1
    fa~\mbreak
    fa8[sib, mib mib16 re] do8[sib do re16 mib]

    %117
    re8.[mib16 fa8 re] sol8[do, do8.\prall sib16]

%%% 2/2 bianca
    \override NoteHead #'duration-log = 1
    \tweak Stem.transparent ##t sib2 r4
    R2.*2

    %121
    r4 sol' mi
    fa4. mi8 re4
    \tweak Stem.transparent ##t mi2 mi4

    %124
    R2.*6
    la4 sol fa\mbreak
    mi4. mi8 fa4

    %132
    sol fa mi
    re4. re8 mi4
    fa8 sol mi4.\prall fa8

    %135
    \tweak Stem.transparent ##t fa2.

%%%2/2
    \revert NoteHead #'duration-log R1
    r4 re mi sol~

    %138
    sol fa fa4. sol8
    mi2 la4 sol\mbreak
    fa2. fa4

    %141
    mi2 mi4 re
    mi1
    mi2 fa4 mi8 re

    %144
    mi4 fad sol4. la8
    fad4 re mi4. fad8
    sol4 sol fa?4. sol8

    %147
    mi4 mi fa4. sol8\mbreak
    la4 fa fa4. fa8
    fa4 re mib4. fa8

    %150
    sol2 sol4 la
    fad sol~sol fad
    sol1~

    %153
    sol4 mi fa2~
    fa4 sol mi4.\prall fa8
    fa\breve

}


IdsIIn = \relative do'' {

    R1*2
    r2 mi2~
    mi re4 do

    %5
    re1
    do2. do4
    re2 do4 si

    %8
    do1~
    do~
    do2 sib?~

    %11
    sib4 la sol la8 sib
    la1

    %13 %% 4/4
    R1*2
    r4 fa8 sol la la la fa
    do'2~do8 do do si

    %17
    do8.[re16 mi8 do] re[mi fa8. sol16]\mbreak
    mi4\prall r r8 do16[do do8 do]
    la4 la8 do fa,2

    %20
    fa8 fa sib do re2~
    re4 do8 si do[re sol fa16 mib]
    re8[do16 si do re mib8] re[re re8.\prall do16]\mbreak

    %23
    do4 r r2
    r4 fa,8 fa sol la sib do
    la_\prall sol16 fa sib4. sib8 sib la

    %26
    sib[do re8. mi!16] fa4 do8 sib16 lab
    sol8 do16 sib lab4. sib16[do sol8._\prall fa16]\mbreak
    fa8[sol la sib do la sib sol]

    %29
    la2 r
    R1*11
    r4 do8. do16 do8(sib) sib8. sib16

    %42
    sib8[la la8. la16] si8 do do si
    do re mi fa sol mi fa re\mbreak
    mi sol do,4. do8 re sib

    %45
    do la sib do do sib sib la
    sib[re do sib sib do la8.\prall sol16]
    sol8 sib sol do sib[la sol la16 sib]

    %48 %% 3/2 OOOOO KKKKK
    \override NoteHead #'duration-log = 1 \tweak Stem.transparent ##t la2 r4
    R2.*3
    fa4 la do~

    %53
    do sib la
    sol4. sol8 [la sib]
    la4 la r

    %56
    R2.*3
    r4 r fa'~
    fa mi8 [re mi la,]

    %61
    la4 dod dod
    re re mi
    fa re re~

    %64
    re4. mi8 fad4
    sol8[(fa) mi(re) dod(re)]\mbreak
    mi4 la,8(si) dod4

    %67
    re sol,8(la) sib4~
    sib la4. sol8
    \tweak Stem.transparent ##t fa2.

    %70
    R\revert NoteHead #'duration-log
    re'1~%%% 4/4 OOOK
    re4. re8 sol,8.[la16 sib8 do]\mbreak

    %73
    re[mi fa sol16 la] sib8[sib16 la sol la sol fa]
    mi[fa sol mi la sol fa mi] re[mi fa8 fa8. mi16]
    fa8[do fa fa16 mib] re8[re16 do sib do sib la]

    %76
    sol[la sib sol do8. do16] do8[re16 do si8.\prall do16]\mbreak
    do2~do4 sib~
    sib la sol4. la16 sib

    %79
    la4. si8 do4 sol8 la
    sib4 mib8 do re[do sib8.\prall la16]
    sol4 la4. sol8[sol8._\prall fa16]

    %82
    fa4 r r2
    R2.*8%%% 3/4 OOOOOKKK
    R1 %%% 2/2

    %92
    R1*10  %%% 4/4
    r4 la8. la16 sib8[sib si dod16 re]
    dod4. dod8 re[mi16 fa dod8. re16]

    %104
    re4 la8. la16 sib8[sib la si16 do]
    si4. si8 do[re16 mib si8. do16]
    do1~\mbreak

    %107
    do4 sib?4. sib8[la8. sib16]
    do8[re mib re do sib la8.\prall sol16]
    fa8 fa' re sol mi[fa16 mi mi8.\prall fa16]

    %110
    fa2 r
    r8 do16[do do8 do] re4 re8 re\mbreak
    mi4 mi8 mi fa8.[mi16 fa8 re]

    %113
    mi4 do8 do do[sol' mi8. mi16]
    do1~
    do4 do r8 sib fa' re\mbreak

    %116
    sib[sib do do16 sib] la8 sib sib la
    sib2~sib8 sib sib la

    %118 %%% 3/2 OOOOOOKKK
    \override NoteHead #'duration-log = 1 \tweak Stem.transparent ##t sib2 r4
    R2.*2
    r4 do do

    %122
    do4. do8 si4\mbreak
    \tweak Stem.transparent ##t do2 do4
    R2.*6

    %130
    do4 sib la\mbreak
    sol4. sol8 la4
    sib la sol

    %133
    fa4. fa8 sol4
    la8 sib sol4._\prall fa8
    \tweak Stem.transparent ##t fa2.  \revert NoteHead #'duration-log

    %136 %% "/" OOKK
    R1
    r4 si do mi
    re re re4.\prall do8

    %139
    do2 mi~\mbreak
    mi re~
    re8 do si do la2~

    %142
    la4 si sold4._\prall la8
    la2. si4
    do2 dod4. dod8

    %145
    re2 do
    re4 sib? do4. re8
    sol,4 sib la8 sib do re\mbreak

    %148
    do2. do4
    sib1~
    sib4 sol mib'2~

    %151
    mib4 re do4.\prall sib8
    sib4 sib' re, sol
    do,2. do4

    %154
    do sib sib4. do8
    la\breve  %%%OOOOKK

}

Ivocen = \relative do {

    \autoBeamOff
    R1*5
    r2 la'~
    la(sol4)(fa)(

    %8
    sol1\prall)(
    fa)
    R1*3

    %13
    r4 fa8 sol la la la fa
    do' do16 do sol8. la16 sib8 sib fa8. sol16
    la4. sol16 sol fa8 fa fa8. sol16

    %16
    mi4\prall fa8[mi](re)[do](re4)\prall
    do2 r\mbreak
    r8 do'16 do do8 do la4 la8 do

    %19
    fa,4 fa4. mib16 mib mib8 mib16 [fa]
    re4 re8 fa sib4 sib16 sib sib sib
    sol4\prall sol8 sol la si do re

    %22
    si la16 sol do2(si4)\mbreak
    do2 r
    R1*2

    %26
    r4 sib8[lab16 sol](fa8)[sol lab8. sib16]
    do[sib lab sol fa fa mib reb](do2)\mbreak
    R1

    %29
    r4 do'8 la fa fa16 fa sib4~
    sib8 sib la2(sol8.\prall)[fa16]
    mi4\prall sol2 fa8 mi

    %32
    re re r sol mi mi r do'\mbreak  %%% fine prima pagina
    la8 la re16 re re la sib4 do8 re
    sol,8 sol sol16 sol sol la sib4(si8) do16 re(

    %35
    do8.) do16 do8 r r4 mi,8 mi\mbreak
    la sol16 la fad8 fad r8 la16 la re8 do16 re
    si8 si do8. re16 mib8 sib? la8.\prall sib16

    %38
    sol2 r4 do8. do16
    do8[sib] sib8. sib16\mbreak sib8[la] la8. la16
    la8[sol16\prall fa sol8 la16 sib] la4(sol\prall)

    %41
    fa2 r
    R1*2\mbreak
    r8 sol8[la sib](do)[la sib sol](

    %45
    la8) fa r4 r2
    R1*2

    %48 3/2 OOOKKK
    r4 \override NoteHead #'duration-log = 1 fa la
    \tweak Stem.transparent ##t do2 do4
    r la la

    %51
    re do sib
    la fa r
    R2.*2

    %55
    r4 fa la
    \tweak Stem.transparent ##t do2 do4
    r la la\mbreak

    %58
    re do sib
    la fa la
    si si8 si dod re

    %61
    dod4 la r
    r re do
    \tweak Stem.transparent ##t sib2 la4

    %64
    r re do
    sib4. la8 sol sib\mbreak
    la4.(sol8)[fa\prall mi](

    %67
    sol4.)(fa8) mi[re]
    fa4(\tweak Stem.transparent ##t mi2\prall)
    \tweak Stem.transparent ##t re2.

    %70
    R\revert NoteHead #'duration-log

    %71 %%% 4/4 OOOKKKK
    r4 fa8. fa16 fa8. fa16 fa fa sol la
    sib4 sib8 sib sib sib16 sib sol8[la16] sib\mbreak
    la4. la8 re re16 do sib[do sib la](

    %74
    sol)[la sib sol do sib la sol](fa8) fa do4
    fa2 r
    R1\mbreak

    %77
    r4 la4. sol16\prall[fa] sol4~
    sol fa sol4.\prall fa16[sol](
    fa2) r

    %80
    R1*2
    r4 la8 fa do' do do8. sib16

    %83 %% 3/4 OOOOOKKKKK
    re4 re re\mbreak
    do4.\prall sib8 la4
    sib8[la sib sol la sib](

    %86
    la4\prall) fa la
    sol4.\prall fa8 mi4
    fa8[mi fa re mi fa](

    %89
    mi4\prall) do do'
    la4. sol8 la si

    %91 %% 2/2 e poi 4/4
    do1
    r8 sol sol la\mbreak fad[re sol fa16 sol](
    mi8) do do' sib16 la sib[la sib do sib la sol mi](

    %94
    la8) fa16 do' do8 re si[sol do sib16 do](
    la8) fa fa mib16 re mib[re mib fa mib re mib do](\mbreak
    re8) sib r sib' sol sib mi,8. sol16

    %97
    do,8 do r4 fa4. fa16 fa
    fa4 sib8. sol16 mi8.[fa16 sol8 fa16\prall mi](
    la4) la la4. re8\mbreak

    %100
    si si r do do fa, r sib?
    sib mi, r la la4(sol\prall)\mbreak
    fa2 r

    %103
    R1*2
    r2 sol~
    sol4 r r2\mbreak

    %107
    R1*3
    r2 r8 sol16 sol sol8 sol
    la4 la16 la la la si4 si8 do\mbreak

    %112
    do4 do r2
    r8 do, mi sol mi do do'8. do16
    sol16[fa sol la sol la sol la sib la sib sol do sib do sol](

    %115
    la8) la16 la fa8 fa re re16 re sib'8 sib\mbreak
    sol sol16 fa mib4. re8 do4
    sib2 r

    %118  %%% 3/2
    \override NoteHead #'duration-log = 1 \parenthesize r4 sib' sol
    mi4. mi8 mi4
    \tweak Stem.transparent ##t fa2 mi16[re mi8]

    %121
    \tweak Stem.transparent ##t mi2 do4
    R2.\mbreak
    r4 sol' sol

    %124
    sol sol8. sol16 sol8 fa
    \tweak Stem.transparent ##t la2 la4
    do sib la

    %127
    sol4. sol8 sol4
    la (sol4.\prall) fa8
    \tweak Stem.transparent ##t fa2 r4

    %130
    R2.*6

    %136 %%% 2/2
    \revert NoteHead #'duration-log r4 do' do4. re8
    si4 sol do2~
    do(si4.) do8

    %139
    do2. do4\mbreak
    do4. do8 si4 re
    sold, sold8 sold la4 si

    %142
    do2(si\prall)
    la r
    r4 la la4. la8

    %145
    la4 fad sol4. la8
    sib2 r
    r4 sol la4. sib8\mbreak

    %148
    do4 la sib4. do8
    re1~
    re2 do~

    %151
    do4 sib la2\prall
    sol sib~
    sib la

    %154
    la(sol\prall)
    fa\breve

}

Itesto = \lyricmode {

    JOD._-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-
    Manum _ suam _ misit _ hostis _ ad omni - a ad omni - a desi - dera - bili - a e -- jus: quia _ vidit _ gentes _  in -- gres -- sas san -- ctu -- a -- ri -- um su -- um, de qui -- bus praece - peras _ ne_in -- tra -- rent in eccle - siam _ tu -- am.

    CAPH. -
    Omnis _ popu - lus e -- jus ge -- mens, et quae -- rens panem: _ dede - runt de -- derunt _ preti - osa _ quae -- que pro cibo _ ad refo - cillan - dam a -- ni -- mam. Vide _ Domi - ne vide _ vide _ Domi - ne vide _ vide _  et consi - de -- ra, quoni - am facta _ sum facta _ sum vil -- is.

    LA -- MED.
    O vos omnes _ qui tran -- si -- tis per vi -- am, o vos omnes _ qui tran -- si -- tis per vi -- am, at -- ten -- dite, _ et vi -- de -- te si est do -- lor si est do -- lor  si -- cut do -- lor me -- us: quo -- ni -- am vin -- demi - avit  _ me, ut lo -- cu -- tus est Domi - nus in die  _ fu -- ro -- ris su -- i.

    MEM. - - - - -
    De ex -- cel -- so mi -- sit i -- gnem in os -- si -- bus me -- is in os -- si -- bus me -- is et e -- rudi - vit me: ex -- pan -- dit re -- te pe -- di -- bus me -- is, ex -- pan -- dit re -- te pe -- di -- bus me -- is, con -- ver -- tit me re -- tror -- sum; po -- su -- it me de -- so -- la -- tam, to -- ta di -- e mae -- ro -- re mae -- ro -- re con -- fec -- tam.

    NUN.-__-__-__-__-__-__
    Vi -- gi -- la -- vit ju -- gum i -- niqui - ta -- tum me -- arum: _ in manu _ ejus _ con -- vo -- lu -- tae sunt, et im -- posi - tae et im -- posi - tae col -- lo me -- o: in -- fir -- ma -- ta est vir -- tus me -- a: de -- dit me Domi - nus in manu, _ de qua non pote - ro sur -- ge -- re.

    Je -- ru -- sa -- lem, Je -- ru -- sa -- lem, con -- ver -- tere _ ad Domi - num De -- um tu -- um, con -- ver -- te -- re Je -- ru -- sa -- lem, con -- ver -- te -- re ad Domi - num De -- um tu -- um, De -- um tu -- um.

}

Ibcn = \relative do {

    fa4 mi re do
    sib2 do4 re
    do2. sib4

    %4
    la2. la4
    sib1
    fa2. fa4

    %7
    sib2 do4 re
    do2. sib4
    la2. la4

    %10
    sib2 sol
    do1
    fa,

    %13
    fa'4. sol8 la4 fa
    do'8[do, sib8. la16] sol4 sib
    fa'4. mi8 re2

    %16
    mi8 do fa mi re2
    do4 do'8 sib la sol fa sib,\mbreak
    do4. do'8 la4 la8 do

    %19
    fa,2 la,
    sib1
    mib2~mib8 re  mib fa

    %22
    sol8.[fa16 mib8 do] sol'4 sol,\mbreak
    do4 lab~lab8 sol lab sib
    do sib' lab fa do'2

    %25
    fa,4 solb8 mib fa2
    sib,4 sib'8 lab16 sol fa8[sol lab8. sib16]
    do4 fa, do2\mbreak

    %28
    fa,4 fa'8 sol la fa sib do
    fa,2 re
    do si

    %31
    do4 mi, fa2
    sol8.[la16 sib8 sol] do8.[re16 mi8 do]\mbreak
    fa4 fad sol8 sol, la sib

    %34
    do8. re16 mib4 re2
    do1\mbreak
    dod4 re fad2

    %37
    sol8[fa? mib8. re16] do4 re8. do16
    si4 do la2
    sib?4 sol\mbreak la fa

    %40
    sib2 do
    fa,4 fa' sol2
    la4. fa8 sol do, sol' sol,

    %43
    do4 do8 re mi do fa sol\mbreak
    do,4. sib8 la4 sol
    fa8 fa' sol la re,4 do

    %46
    sib8[sib do re mib do re8. do16]
    sib8 sol do la sib fa do'4

    %48 OK 3/2
    \override NoteHead #'duration-log = 1  \tweak Stem.transparent ##t fa,2 fa'4
    \tweak Stem.transparent ##t mi2.
    \tweak Stem.transparent ##t fa

    %51
    sib4 la sol
    \tweak Stem.transparent ##t fa2.
    sib4 sol fa

    %54
    sib do do,
    \tweak Stem.transparent ##t fa2 fa4
    \tweak Stem.transparent ##t mi2.

    %57
    \tweak Stem.transparent ##t fa
    sib,4\tweak Stem.transparent ##t do2
    \tweak Stem.transparent ##t fa, fa'4

    %60
    sol4. fa8 [mi re]
    la4 la' sol
    fa fa mi

    %63
    \tweak Stem.transparent ##t re2 do4
    sib sib la
    \tweak Stem.transparent ##t sol2.~

    %66
    sol4 fa8 sol la4
    sib4. la8 sol4~
    sol\tweak Stem.transparent ##t la2

    %69
    \tweak Stem.transparent ##t re,2.
    r4 re' do \revert NoteHead #'duration-log

    %71 %%% 4/4
    sib2~sib4. la8
    sol1\mbreak
    re'4. do8 sib2

    %74
    do8 sib la la sib fa do'4
    fa,8[fa'16 mib re8 re16 do] sib4. sib8
    sib4 la8 sib16 do fa,8 fa sol4\mbreak

    %77
    la2 sib
    do1
    fa,4 fa' mi mib

    %80
    re do sib4. sib8
    do1
    fa,4 fa' la2

    %83 %%%% 3/4
    sib2.\mbreak
    la
    sol

    %86
    fa
    mi
    re

    %89
    do4. re8 mi4
    fa4. mi8 re4

    %91 %2/2 e 4/4
    do1
    do2 ~\mbreak do4 si
    sib! la~la sol

    %94
    fa fa'~fa mi
    mib re~re do\mbreak
    sib1

    %97
    la
    sol
    fa2 fa'~\mbreak

    %100
    fa4 mi re2
    do1
    fa,4. fa'8 sol4 fa

    %103
    mi la8. sol16 fa8 re la' la,
    re4 re'8. do16 sib8 sol re' re,
    sol4. fa8 mib do sol' sol,

    %106
    do[sib la8. sol16] fa8[sol la sol16 fa]\mbreak
    sib4 sol re'8[re do8. sib16]
    la1

    %109
    sib4. sib8 do2
    fa,4~fa16 fa' mi re do2~
    do1~\mbreak

    %112
    do2 fa
    do1~
    do

    %115
    fa,4 la sib re\mbreak
    mib4. mib8 fa sib, fa4
    sib8.[do16 re8 sib] mib mib fa fa,

    %118 %3/2
    \override NoteHead #'duration-log = 1 \tweak Stem.transparent ##t sib2.
    \tweak Stem.transparent ##t do
    \tweak Stem.transparent ##t re

    %121
    \tweak Stem.transparent ##t do2 do4
    \tweak Stem.transparent ##t re2.
    \tweak Stem.transparent ##t do2 do4

    %124
    \tweak Stem.transparent ##t mi,2.
    fa4 fa' re
    la \tweak Stem.transparent ##t sib2~

    %127
    \tweak Stem.transparent ##t sib2.
    la4 \tweak Stem.transparent ##t do2
    re4 do sib

    %130
    la \tweak Stem.transparent ##t sib2
    do4 sib la
    sol \tweak Stem.transparent ##t la2

    %133
    sib4. la8 sol4
    re'8 sib \tweak Stem.transparent ##t do2
    \tweak Stem.transparent ##t fa,2.

    %136 %%%2/2
    \revert NoteHead #'duration-log fa'2 mi
    re4 fa mi do
    sol'2 sol,

    %139
    do1\mbreak
    re1
    mi2 fa

    %142
    mi2. re4
    dod2 re
    la1

    %145
    re4 do sib4. la8
    sol4 sol la4. sib8
    do4 re do4. sib8\mbreak

    %148
    la1
    sib4 sib do4. re8
    mib2. do4

    %151
    re1
    sol,2. sol4
    la2 fa

    %154
    do'1
    fa,\breve

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <7>2 s4 <6+>
    s1
    <6 5>
    s
    s
    <7>2 s4 <6+>
    s1
    s
    <9>
    <7 3>4 <6 4> <5 4> <3>
    s1

    %%% 4/4 OOKK
    s1
    s4 <4+> s2
    s1
    s2 <7>4 <6+>
    s2 <6 4>
    s <6>
    s1
    s
    <9 7>4 <8 6>8 <7 5+> <4+>2
    <_+> <5 4>4 <3>
    <3+>2 <4+>8 <6> <6> <6 _->
    <_+>2 <5 4>4 <3->
    <7 _+>2 <5 4>4 <3>
    s1
    s4 <_-><6 4>4 <5 3>
    <_+>1
    s2 <7>4 <6->
    <7> <6> <7> <6>
    s2 <9 7>4 <8 6>8 <7 5>
    s4 <_+> s2
    s2 s4 <6>8 <6>
    <3+>2 <6->4 <6+>
    <_+>1
    s
    <5+>4 <6 4+> <8 6>8 <7 5> <5 4>8. <3>16
    s2 <7 5>
    <9 7 5+> <9 7>
    <7 5>4 <6> <6 4> <5 4>8 <3>
    s2 <11 9>4 <10 8>
    <9 7> <8 6> <7 _+> <5 4>8 <3>
    s2 s4 s8 <_+>
    s2 <7>8 <6> <7> <6> s2 <7>8 <6> <7> <6>
    s1
    <_+>2 s4 <5 4>8. <3>16

    %%%% 3/2 OOKK bar 48
    s2.*3
    s4 <6> <6>
    s2.
    <9>4 <6> s
    <6 5> <5 4> <5 3>
    s2.*3
    s4 <6 4> <5 3>
    s2.
    <_+ 9 7>4 <8 6> s
    <_+> s <4+>
    <6> <6> <6->
    <6->2 <6>4
    <6>2 <6+>4
    <5>2 <6>4
    <4+> <6> <_+>
    <6> s8 <6> <8 6>4
    <7 5> <5 4> <5 3>
    <_->2.
    s

    %%% 4/4 bar 71  OOOKKK
    s1
    <7>2 <6>
    s <5>4 <6>
    s1
    s4 <6> <5> <6>
    <4+>1
    s2 <9 7>4 <8 6>
    <7 3> <6 4> <5 4> <5 3>
    s1
    <6>4 <7>8 <6> <5>4 <6>
    <7 3> <6 4> <5 4> <5 3>
    s1

    %%% 3/4 bar 83 OOOKKK
    <7>2 <6>4
    <7>2 <6>4
    <7>2 <6>4
    <7>2 <6>4
    <7>2 <6>4
    <7>2 <6+>4
    s2.*2

    %%% 2/2 e 4/4
    s1
    <5>4 s8 <6> <4+ 2>4 <6>
    <4+ 2> <6> <6 4 2> <7>8 <6>
    s4 <5>8 <6> <4+ 2>4 <6>
    <4+ 2> <6> <6 4 2> <7 _->8 <6>
    <5 3>2 <6 4+>
    <6>1
    <7>2 <6>
    s <5>4 <6>
    <4+ 2> <6> <7> <6->
    <7 3> <6 4> <6 4> <5 3><5> <6> <_-> <6 4+>
    <6+> <_+> <6> <_+>
    <_+> <_+> <6> <_+>
    <_+> s <6> <_+>
    s1
    s2 <6>4 <6 4>
    <6>2 <5->
    <5>4 <6> <7 3>8 <6 4> <5 4> <5 3>
    s1
    <6 4>2 <9 7+ 4>
    <5 3>2 <5>4 <6>
    s1
    <8>2 <7>
    s4 <6> s <6>
    <5> <6> <7> <4>8 <3>
    s1

    %%% 3/2  bar 118 OOOKKK
    <5>2 <6>4
    <5>2 <6>4<7>2 <6+>4
    <5>2 <6>4
    <7>2 <6+>4
    s2.*3
    <6>4 <8 6> <7 5>
    <4+>2.
    s4 <5 4> <5 3>
    s2.
    <6>4 <8 6> <7 5>
    s2 <6->4 <6> <6> <5>
    s2 <6>4
    s <5 4> <5 3>
    s2.

    %%% 2/2 finale bar 136 OOOKKK
    s2 <6>
    <6+>1
    s
    <5>2 <6>
    <9 7> <8 6+>
    <_+>1
    <6 4> 2 <5 4>4 <5 3>
    s1
    <_->2 <_+>
    <_+>4 <4+ 2> <6 4> s
    s1
    s4 <6 4> <6 4>2
    s1
    s
    <7>2 <6>4 <6>
    <9 7 3+>4 <8 6 4> <7 5 4> <3>
    s1
    <9>

}


forma = {

    \time 2/2
    \key fa\major
    \tempo 2 = 57
    s1*12
    \bar "||"\break
    \time 4/4
    \tempo 2 = 37
    s1*35\break
    \time 3/2
    \set Timing.measureLength = #(ly:make-moment 3/4)
    \tempo 2. = 50
    s2.*23\break
    \time 4/4
    \tempo 2 = 37
    s1*12\break
    \time 3/4
    \tempo 2. = 50
    \once\override Staff.TimeSignature.style = #'single-digit
    s2.*8\break
    \time 2/2
    \tempo 2 = 57
    s1
    \time 4/4
    \tempo 2 = 37
    s1*26\break
    \time 3/2
    \set Timing.measureLength = #(ly:make-moment 3/4)
    \tempo 2. = 50
    s2.*18\break
    \time 2/2
    \tempo 2 = 65
    s1*19
    s\breve
    \bar "|."

}

IdsI = {
    \notypeset
    <<\IdsIn \forma>>

}

IdsII = {
    <<\IdsIIn \forma>>

}

Ivoce = {
    \new Voice = "prima"
    <<\Ivocen \forma>>
}



Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}




IIdsIn = \relative do'' {

    R1*2
    r2 r4 fa
    mi4. re8 mi4 do

    %5
    re2 sol~
    sol4 sol fa4. sol8
    mi4. fa8 sol4 mi

    %8
    fa4. mi8 fa4 re\mbreak
    mi2. do4
    fa sol8 fa mi4.\prall fa8

    %11
    fa1
    R1*23
    la8[sol fa la sol fa mi sol]

    %36
    fa4 re fa sol8 fa
    mi2 fa~
    fa4 sol~sol fa~

    %39
    fa sol8 fa mi4.\prall  fa8
    fa1~
    fa4 sol fa mib

    %42
    re mi! fa sol\mbreak
    la1
    sol4 la sib2~

    %45
    sib4 la8 sib sol4.\prall fa8
    fa1

%%% 4/4
    R1*2

    %49
    r2 r8 fa[re8. re16]\mbreak
    mi4. mi8 mi2
    mi4. mi8 la[la la8. la16]

    %52
    la4 sol r8 sol[sol8. sol16]
    sol4 fa r8 fa sib sol
    mi mi mi4. mi8 re8. re16\mbreak

    %55
    do4. fa8 re2
    r8 re[re8. re16] do4 sib8. do16
    la8[sol la sib do re16 do sib8._\prall la16]

    %58
    sol4 do8 re mi[do do8. do16]
    sib4 sib la8.[la16 la8. la16]\mbreak

%%% 3/2 bar 60 OOKK
    \override NoteHead #'duration-log = 1 \tweak Stem.transparent ##t la2 si4

    %61
    \tweak Stem.transparent ##t dod2.
    \tweak Stem.transparent ##t re2.
    re4 mi4. mi8

    %64
    mi4 dod re
    \tweak Stem.transparent ##t re2 dod4
    re do?4. re8

    %67
    sib!4 sib sib
    la  la si8 do\mbreak
    si4 si dod8 re

    %70
    dod4 la re~
    re8 mi dod4. re8
    \tweak Stem.transparent ##t re2.
    R\revert NoteHead #'duration-log

    %74 %% 4/4
    R1*3
    re8.[mib16 re sib8 re16] do8.[re16 do la8 do16]
    sib4 sib8. do16 la8[fa fa'8. fa16]

    %79
    fa8 sol16 fa mib4. re8[do re16 mib]
    re1

    %81 4/4
    R1*22
    R1 %%% 2/2
    R1 %%% Jerusalem

    %105
    r4 re mi sol~
    sol fa fa4. sol8
    mi2 la4 sol\mbreak
    fa2. fa4

    %109
    mi2 mi4 re
    mi1
    mi2 fa4 mi8 re

    %112
    mi4 fad sol4. la8
    fad4 re mi4. fad8
    sol4 sol fa?4. sol8

    %115
    mi4 mi fa4. sol8\mbreak
    la4 fa fa4. fa8
    fa4 re mib4. fa8

    %118
    sol2 sol4 la
    fad sol~sol fad
    sol1~

    %121
    sol4 mi fa2~
    fa4 sol mi4.\prall fa8
    fa\breve

}


IIdsIIn = \relative do'' {

    R1
    r2 r4 do
    la4. sol8 la4 fa

    %4
    sol2 do~
    do4 do sib4. do8
    la4. si8 si4.\prallprall la16 si

    %7
    do1~
    do2. si4\mbreak
    do2 la

    %10
    si do4. sib?8
    la1
    R1*23

    %35
    do4 re~re do~
    do re8 do si4. do8
    do2. do4

    %38
    re8[do sib? re do sib la do]
    sib4 sol sib do8 sib
    la4 sib do la

    %41
    re mib re do
    sib do re mi?\mbreak
    fa2 do4 re

    %44
    mi fa sol fa
    mi fa8 sol mi4.\prall fa8
    fa1

    %47 %% 4/4 OOKK
    R1*2
    r2 r8 la,[fa'16 mi re do]\mbreak
    si8[sold la16 si do8] si[dod re8. mi16]

    %51
    dod4 r8 do fa4 fa8. mi16
    re4 re4. re8[mi sol]
    do,4 do re4. re8

    %54
    do2~do8[do si do16 re]\mbreak
    sol,4 do4. sib8 sib[sol]
    fa2~fa8 fa fa mi

    %57
    fa4 fa8[sol8 la sib16 la sol8._\prall fa16]
    mi4 mi8 fa  sol[mi mi8. mi16]
    mi4 mi mi8.[mi16 re8. re16]\mbreak

    %60 %% 3/2 OOKK
    \override NoteHead #'duration-log = 1 mi4. fad8 sold4
    \tweak Stem.transparent ##t la2.
    r4 la si8 do

    %63
    si4 si dod8 re
    dod4 la la~
    la sol4. la8

    %66
    fad4 fad fad
    \tweak Stem.transparent ##t sol2.~
    \tweak Stem.transparent ##t sol2 fad4

    %69
    \tweak Stem.transparent ##t sol2.~
    \tweak Stem.transparent ##t sol2 fa?4
    mi mi4._\prall re8

    %72
    \tweak Stem.transparent ##t re2.
    R\revert NoteHead #'duration-log

    %74 %% 4/4 OOKK
    R1*3
    sib'8.[do16 sib sol8 sib16] la8.[sib16 la fa8 la16]
    sol2 fa8[la la sib16 la]

    %79
    sol8[sol do do16 sib] la8[sib sib8._\prall la16]
    sib1

    %81 4/4
    R1*22
    R1 %%% 2/2
    R1 %%% Jerusalem

    %105
    r4 si do mi
    re re re4.\prall do8

    %107
    do2 mi~\mbreak
    mi re~
    re8 do si do la2~

    %110
    la4 si sold4._\prall la8
    la2. si4
    do2 dod4. dod8

    %113
    re2 do
    re4 sib? do4. re8
    sol,4 sib la8 sib do re\mbreak

    %116
    do2. do4
    sib1~
    sib4 sol mib'2~

    %119
    mib4 re do4.\prall sib8
    sib4 sib' re, sol
    do,2. do4

    %122
    do sib sib4. do8
    la\breve

}

IIvocen = \relative do {

    \autoBeamOff
    R1*6
    r2 r4 do'
    la4. (sol8 la4 fa\mbreak

    %9
    sol2) (do8[sib la sol)](
    fa4) (mi8[re] do2)(
    fa1)

    %12
    fa2 sol4 la
    la la la do
    sol la sib2

    %15
    la2. la4
    re re do do
    do sib8 [la] sib2~\mbreak

    %18
    sib4 la sol2\prall
    fa1
    r4 fa2 sol4

    %21
    la sib do re
    sol,2 sol~
    sol4 fa fa4. sol8

    %24
    mi2 la~
    la sol4 fa
    fa2(mi\prall)

    %27
    re1\mbreak
    sib'4. sib8 sib4 do
    re8[do sib re do sib la do](

    %30
    sib4) sol sib do
    la8[sol fa la sol fa mi sol](
    fa4) re fa8 [sol] la[si]

    %33
    do4 la re2~
    re4 sol, sol2\prall \mbreak
    fa2 r

    %36
    R1*4\break
    fa4(sol la fa)(
    sib)(mib,)(fa2)(

    %42
    sib,) r\mbreak
    R1*4

    %47 %% 4/4 OOOKKK
    r8 la' la sib sol fa mi[fa16] sol
    fa4 fa r8 dod dod re
    re4 re r8 re' si8. re16\mbreak

    %50
    sold,8 mi la2(sold8) sold(
    la2) r8 do do8. do16
    do4 sib r8 sib sib8. sib16

    %53
    sib4 la4. la8 re sib
    sol sol sol4. do8 fa, fa16 sol\mbreak
    mi4 la4. sol8 sol4~

    %56
    sol8 sol sol8. sol16 la4(sol\prall)
    fa2 r
    r2 r8 sol sol8. sol16
    sol4 sol la8. sol16 fa8[mi16] fa\mbreak

    %60 3/2  OOKK
    \override NoteHead #'duration-log = 1 \tweak Stem.transparent ##t dod2 r4
    r mi(fad8) sol
    fad4. fad8 fad4

    %63
    \tweak Stem.transparent ##t sol2.~
    \tweak Stem.transparent ##t sol2 fa?4
    fa(\tweak Stem.transparent ##t mi2\prall)

    %66
    \tweak Stem.transparent ##t re2.
    R2.*7\revert NoteHead #'duration-log

    %74 % 4/4 OOOKK
    r2 r8 re' re4(
    do8.)[re16 do la8 do16](sib8.)[do16 sib sol8 sib16](
    la8)[fa sib8. fa16](\mbreak sol8)[mib](fa4)(

    %77
    sib,2) r
    R1*2
    R1 %% 2/2

    %81
    r8 fa' fa16 fa fa sol\mbreak la4 la16 fa sol la
    sib8. sib16 do8 re8 re4(do8.) sib16
    la4 re8. re16 sol,8 sol fa fa16 sol

    %84
    mi8 mi do'8. do16 fa,8 fa mib mib16 fa\mbreak
    re8 re r sol la sib la8.\prall sol16
    sol4 sib8. sib16 mi,8 mi la8. la16

    %87
    re,8 re mi fa16 sol do,8 do r sol'
    do4. fa,8 fa4(mi8.\prall) fa16\mbreak
    fa2 r

    %90
    r4 la r16 la la la la8[si16] do
    si4 dod8. dod16 re4. (dod16) re
    dod4 r8 la fad4 fad8 re'

    %93
    si si r16 do do sib?\mbreak la[sol] fa[mi] re4\prall
    do r r2
    r4 r8 do' sol sol mi sol

    %96
    do,4 do r8 mi sol sol16 fa
    la4 la r sib8 sib16 do\mbreak
    re4 sib8 re do16[la re do sib la sol fa](

    %99
    mi)[fa sol fa mi fa mi re](do8) do fa fa16 sol
    la4 fa8 la sol16[mi la sol fa mi re do](
    si)[re mi fa sol re mi fa](\mbreak mi)[sol la sib do sol la sib](

    %102
    la8)[fa do'16 sib la sol](fa8) [mi16 re](do4)
    fa1

    %104 Jerusalema
    r4 do' do4. re8
    si4 sol do2~
    do(si4.) do8

    %107
    do2. do4\mbreak
    do4. do8 si4 re
    sold, sold8 sold la4 si

    %110
    do2(si\prall)
    la r
    r4 la la4. la8

    %113
    la4 fad sol4. la8
    sib2 r
    r4 sol la4. sib8\mbreak

    %116
    do4 la sib4. do8
    re1~
    re2 do~

    %119
    do4 sib la2\prall
    sol sib~
    sib la

    %122
    la(sol\prall)
    fa\breve

}

IItesto = \lyricmode {

    A -- LEPH._-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-
    E -- go vir videns _ pauper - ta -- tem me -- am in virga _ indi - gnati - o -- nis e -- jus.
    Me mina - vit, et ad -- du -- xit in tene - bras, et non in lu -- cem.
    Tan -- tum in me ver -- tit, et con -- ver -- tit ma -- num suam _ to -- ta di -- e.

    BETH._-__-__-__-__-__-__-__-__-__-__-__-__-__-
    Vetus - tam fecit  _ pellem _ meam, _ et carnem _ meam. _ Con -- tri -- vit ossa _ me -- a. Ae -- di -- fi -- cavit,  _
    ae -- di -- fi -- cavit  _ in gyro _ meo _  et circum - dedit _ me felle _ fel -- le et la -- bo -- re.
    In tene - brosis _ collo - ca -- vit me qua -- si mor -- tuos _ sem -- pi -- ter -- nos.

    GHI -- MEL._-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-__-
    Circum - aedi - fi -- cavit _ ad -- versum _ me, ut non egre - di -- ar,
    aggra - vavit  _ com -- pedem _ meum, _ aggra - vavit  _ com -- pedem _ meum _ ut non egre - di -- ar,
    aggra - vavit  _  aggra - vavit  _ com -- pedem _ meum _ ut non egre - di -- ar.
    Sed et cum cla -- mave - ro et ro -- ga -- ve -- ro, exclu - sit exclu - sit ora - ti -- o -- nem me -- am.
    Conclu - sit vias _  meas _ la -- pi -- di -- bus quadris, _ semi - tas meas _ sub -- ver  -- tit,
    semi - tas meas _ sub -- ver  -- tit.

    Je -- ru -- sa -- lem, Je -- ru -- sa -- lem, con -- ver -- tere _ ad Domi - num De -- um tu -- um, con -- ver -- te -- re Je -- ru -- sa -- lem, con -- ver -- te -- re ad Domi - num De -- um tu -- um, De -- um tu -- um.



}

IIbcn = \relative do {

    fa,2. fa'4
    mi4. re8 mi4 do
    re1

    %4
    do2. la4
    sib2. do4
    re1

    %7
    mi4. re8 mi4 do
    fa1\mbreak
    do

    %10
    re2 do
    fa,1
    fa'2 mi

    %13
    fa1~
    fa~
    fa

    %16
    sib2 la4 do
    fad,2 sol4 sib\mbreak
    mi, fa do2

    %19
    re4 fa la,2
    sib4 re sol,2
    fa4 sol la sib

    %22
    do re mi sol
    si,1
    do4 sib? la fa

    %25
    sol la sib sol
    la1
    re,2 re'4 do\mbreak

    %28
    sib2 mib
    sib' la
    sol1

    %31
    fa2 mi?
    re1
    do4 fa sib,2

    %34
    si do\mbreak
    fa mi
    re1

    %37
    do4 do' la fa
    sib2 la
    sol1

    %40
    fa4 sol la fa
    sib mib, fa fa,
    sib sib' la sol\mbreak

    %43
    fa sol la sib
    do2 sib
    do do,
    fa2. mi4

    %47 %% 4/4 OOKK
    re2~re4 dod
    re1~
    re~\mbreak

    %50
    re4 do8 la mi'2
    la,4 la'8 sol fa2
    sib sol

    %53
    la sib,
    do4. sib8 la4 si\mbreak
    do4 la sib?2

    %56
    si do
    fa,4 fa' la, sib
    do1~
    do2 dod4 re\mbreak

    %60  %% 3/2 OK
    \override NoteHead #'duration-log = 1 \tweak Stem.transparent ##t la2.~
    \tweak Stem.transparent ##t la
    \tweak Stem.transparent ##t re

    %63
    \tweak Stem.transparent ##t sol,
    \tweak Stem.transparent ##t la2 re4
    \tweak Stem.transparent ##t la2.

    %66
    \tweak Stem.transparent ##t re,2 re'4
    \tweak Stem.transparent ##t mib2.
    do4 \tweak Stem.transparent ##t re2

    %69
    \tweak Stem.transparent ##t sol,2.
    fa4. mi8 re4
    sol \tweak Stem.transparent ##t la2

    %72
    \tweak Stem.transparent ##t re,2.
    R\revert NoteHead #'duration-log

    %74 %% 4/4 OOKK
    re'4 do sib2
    fa'4 fad sol2
    fa8.[mib16 re8 sib]\mbreak mib4 fa8 fa,

    %77
    sib2 fa'~
    fa4 mi! fa8[fa re8. re16]
    mib4. do8 fa sib, fa' fa,
    sib1

    %81 %% 4/4 OOKK
    sib2\mbreak fa'4 mib
    re8.[re16 do8 sib] do2
    re4. do8 si2

    %84
    do4. sib?8 la2\mbreak
    sib la8 sol re' re,
    sol2 do4 fa,

    %87
    sib sol la sib
    la4. sib8 do2\mbreak
    re4. la8 sib4 do

    %90
    fa,2 fa'~
    fa4 mi re2
    la'4 dod, re2

    %93
    sol4 mi\mbreak fa8 fa, sol4
    do8[do'16 sib la sol fa mi] re8 do sol' sol,
    do2 sib

    %96
    la mi
    fa fa'8[mib re8. do16]\mbreak
    sib4. sib'8 la fa sol mi

    %99
    do2~do8[sib la8. sol16]
    fa4. fa'8mi do re si
    sol2\mbreak do4 mi

    %102
    fa la, sib8 do16 re do4
    fa,1

    %104 Jerusalema
    fa'2 mi
    re4 fa mi do
    sol'2 sol,

    %107
    do1\mbreak
    re1
    mi2 fa

    %110
    mi2. re4
    dod2 re
    la1

    %113
    re4 do sib4. la8
    sol4 sol la4. sib8
    do4 re do4. sib8\mbreak

    %116
    la1
    sib4 sib do4. re8
    mib2. do4

    %119
    re1
    sol,2. sol4
    la2 fa

    %122
    do'1
    fa,\breve

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6>
    <7>4. <4>8 <6>2
    s1
    s
    <5 4>2 <6+ 3>
    s1
    s
    s
    <6+>2 <3>
    s1*3
    <9 7+ 4>1
    <8 5 3>
    s2 <6+>4 <6>
    <6 5->2 <6>4 <6>
    <6 5->2 <5 3+>
    s1
    s2 <7>4 <6>
    s1*2
    <6>2 <5->
    s1
    <9>
    <6 4>2 <5 4>4 <5 3>
    s1*2
    <5>4 <6> <7> <6>
    <7>2 <6>
    <7>4 <6> <7> <6>
    <7>2 <6+>
    s1*2
    <5>4 <6> <7> <6>
    <7>2 <6+>
    s1
    <5>4 <6> <7> <6>
    <7>2 <6>
    s1
    s2 <6 4>4 <5 3>
    s <4+ 2> <6 4> <6>
    s1*2
    <7 3>4 <6 4> <5 4> <5 3>
    s1*2
    <8 5 3>2 <8 7+ 4>
    <8 5>2 <8 5 6>
    <4+>4 s <5 4> <5 3>
    <_+> <_-> s2
    <9 7>4 <8 6> s2
    <9 7>4 <8 6> <7> <6>
    s2 <7>4 <5->
    s <6> <9 7> <8 6>
    <6 5->2 <6 4>4 <5 4>8 <5 3>
    s1*2
    <7>2 <6>

    %%% 3/2 bar 60
    <8 5 3+>2 <9 7+ 4>4
    <8 5 3+>2.
    <_+>
    <5 _+>2 <6 _+>4
    <7 _+>2.
    <6 4>4 <5 4> <3>
    <8> <7 _+> <6 _+>
    s2.
    <6 5>4 <5 4> <5 3>
    <5 _+>2 <6 _+>4
    <9 7 5+>2.
    s4 <_+>2
    <_->2.
    s

    %% 4/4 bar 74
    s1
    s2 <5>4 <6>
    s2 <7 5>4 <4>8 <3>
    s1*2
    <9 7>4 <8 6> <7> <4>8 <3>
    s1
    s2 s4 <4+>
    s2 <9 7>4 <8 6>8. <7 5>16
    <_+>1
    s
    <5 3>4 <4+ 6> <6+>2
    s1
    s4 <6> <6> <6>
    s2 <5 4>4 <5 3>
    s2 <6 5>4 <4>8 <3>
    s1
    <4+>4 <6+> s2
    <_+>2 <_+>
    s <5>8 <6 5> <4> <3>
    s2 <6+>4 <4>8 <3>
    s2 <4+>
    <6> <6>
    s s4 <6 4>
    <5> <6> s8 <6> <_->4
    s1
    <5>4 <6> s8 <6> s4
    <_+>2 s
    s s4 <6 4>8 <5 3>
    s1

    %%% 2/2 Jerusalem bar 104 OOOKKK
    s2 <6>
    <6+>1
    s
    <5>2 <6>
    <9 7> <8 6+>
    <_+>1
    <6 4> 2 <5 4>4 <5 3>
    s1
    <_->2 <_+>
    <_+>4 <4+ 2> <6 4> s
    s1
    s4 <6 4> <6 4>2
    s1
    s
    <7>2 <6>4 <6>
    <9 7 3+>4 <8 6 4> <7 5 4> <3>
    s1
    <9>



}


forma = {

    \time 2/2
    \key fa\major
    \tempo 2 = 57
    s1*11
    \bar "||"\break
    \time 2/2
    \tempo 2 = 57
    s1*35\break
    \time 4/4
    \tempo 2 = 37
    s1*13\break
    \time 3/2
    \set Timing.measureLength = #(ly:make-moment 3/4)
    \tempo 2 = 50
    s2.*14\break
    \time 4/4
    \tempo 2 = 37
    s1*6
    \time 2/2
    s1\break
    \time 4/4
    \tempo 2 = 37
    s1*22
    \time 2/2
    s1\break
    \time 4/4
    \tempo 2 = 65
    s1*19
    s\breve
    \bar "|."

}

IIdsI = {
    \notypeset
    <<\IIdsIn \forma>>

}

IIdsII = {
    <<\IIdsIIn \forma>>

}

IIvoce = {
    \new Voice = "seconda"
    <<\IIvocen \forma>>
}



IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}




IIIdsIn = \relative do'' {

    R1
    do2. re4
    mi2 do

    %4
    fa2. mib4
    re do re mi
    fa do re mi8 fa

    %7
    mi4 fa sol2
    do,4 re mib do
    re2. mi?4

    %10
    fa2~fa8 sol la fa
    sol1\mbreak
    fa~

    %13
    fa4. fa8 sol4 la
    sib2~sib8 la sol fa
    mi4 mi la4. la8

    %16
    sol4 fa fa mi
    fa re mib do
    re8 mi? fa4 fa4.\prall mi8

    %19
    fa1
    r4 fa8 fa fa4~fa16 fa sol la
    sol2~sol8[sol la8. la16]

    %22
    la8[sol fa8.\prall mi16] fa8[sol16 la sol8.\prall fa16]
    mi2 r\mbreak
    r4 fad8. sol16 la4~ la8. la16

    %25
    sol8.[fad16 sol la sib8] mi,[la sol fa?16 mi]
    fa8[sol la8. la16] sol8[fa mi8.\prall re16]
    re4 r r2\mbreak

    %28
    R1*3
    r8 la[si dod re dod re mi]\mbreak
    fa4 fad8. fad16 sold8[la16 si sold8. la16]

    %33
    la4 r r2
    R1*2\mbreak
    r2 r4 do,8 re

    %37
    mib re do4. sib8[la8._\prall sol16]
    sol4 r r2
    R1\mbreak

    %40
    r2 r4 r8 fa'16 fa
    sol8[la sib la16 sol] la8[fa do8. do16]
    re4 do8. do16 do4. do8

    %43
    do4 fa8. mib16 re8.[mib16 fa8 re]
    sol fa mib re\mbreak do16[re mib re do8 fa16 mib]
    re8[fa sol la re, sol sol8.\prall fa16]

    %46
    mi8[mi la16 sol fa sol] mi8[fa16 sol mi8.\prall fa16]
    fa2 r4 %% 3/4
    R2.*2

    %50
    r4 r sol
    sol4.\prall fa8 sol4\mbreak
    la4 sol la

    %53
    sib la sol
    fa8 sol mi4.\prall fa8
    fa2 r4
    R2.*2

    %58
    r4 la2
    mi fad4
    sol4. sol8 fa? mi

    %61
    re4 mi2
    fa8 sol fa mi fa re\mbreak
    mi re mi fa sol la

    %64
    re, do si dod re mi
    fa mi fa sol la si?
    mi, re dod re mi fa

    %67
    sol fa mi fad sol la
    sib la sol la sol fa
    mi re mi fa sol4

    %70
    fa mi4. re8
    re2 re4
    do2 do4\mbreak

    %73
    do8 si do re  mi fa
    sol4. fa8 fa sol
    mi4 mi8 fa sol mi

    %76
    fa4 mib8 do re mib
    re do re mi? fa sol
    la4 mi4. fa8

    %79
    fa mi re mi fa sol
    la4. re,8 mi fa
    mi4 do fa~

    %82
    fa8 sol mi4.\prall fa8
    fa2.
    R1*13

    %97
    r4 r16 dod re mi fa4 re8 fa
    si,8 si do4. si8[si8._\prall la16]
    la4 r r2

    %100
    R1*2
    r4 r8 fa' re[mi fa8. sol16]
    mi4 r r2\mbreak

    %104
    R1*4
    r4 r8 sib' fa[fa16 sol lab8. sib16]
    sol8 fa mib4. re8[do re16 mib]

    %110 3/2 OOKK
    \override NoteHead #'duration-log = 1 re4 fa fa
    fa sib,8 do re4
    do4. do8 [do re]\mbreak

    %113
    mi4. mi8 fa4
    mi4 mi mi
    mi4. mi8 [fa mi]

    %116
    \tweak Stem.transparent ##t fa2.~
    fa4. sol8 [sol fad]
    sol4 re mi

    %119
    fa4. fa8 fa4
    sol fa mi\mbreak
    \tweak Stem.transparent ##t fa2 mi4

    %122
    \tweak Stem.transparent ##t fa2 sol4~
    sol4. fa8 [mi sol]
    fa4 mi4. la8

    %125
    re,4 re4. mi8
    \tweak Stem.transparent ##t dod2.
    R2.*16

    %143
    r4 r8 la[la8. sib16]
    do8 re mib4 re8 mib
    re4. re8 [re mi?]

    %146
    fa4 fa4. sol8
    mi4 do fa~
    fa8 sol mi4.\prall fa8\mbreak

    %149
    \tweak Stem.transparent ##t fa2.\revert NoteHead #'duration-log
    R1 %%% Jerusalem
    r4 re mi sol~

    %152
    sol fa fa4. sol8
    mi2 la4 sol\mbreak
    fa2. fa4

    %155
    mi2 mi4 re
    mi1
    mi2 fa4 mi8 re

    %158
    mi4 fad sol4. la8
    fad4 re mi4. fad8
    sol4 sol fa?4. sol8

    %161
    mi4 mi fa4. sol8\mbreak
    la4 fa fa4. fa8
    fa4 re mib4. fa8

    %164
    sol2 sol4 la
    fad sol~sol fad
    sol1~

    %167
    sol4 mi fa2~
    fa4 sol mi4.\prall fa8
    fa\breve

}


IIIdsIIn = \relative do'' {

    R1*4
    fa,2. sol4
    la2 fa

    %7
    do'2. sib4
    la sib do2
    fa,4 sol la sib

    %10
    do1~
    do\mbreak
    do2. la4

    %13
    re4. re8 mib2
    fa4 mib re2\prall
    do2. fa4

    %16
    re re do4. sib8
    la4 sib do2~
    do8 sib la re sol,4 do8 sib

    %19
    la1
    R %% 4/4 OK
    r4 re8 re re[re16 mi fa8. sol16]

    %22
    mi2~mi8[re mi8. fa16]
    dod2 r\mbreak
    r4 la4. la8[re8. re16]

    %25
    re8.[dod16 re mi fa sol] dod,8[re16 mi dod8. re16]
    re8[mi fa16 mi re do]si[dod! re8 re8.\prall dod16]
    re4 r r2\mbreak

    %28
    R1*3
    r2 r8 la[si dod]\mbreak
    re4 re4. do8[si dod16 re]

    %33
    dod4 r r2
    R1
    r2 r4 do?8 re\mbreak

    %36
    mib[do la8. do16] sib8[sol la si]
    do[sib? la8. sol16] fad8[sol16 la fad8. sol16]
    sol4 r r2

    %39
    R1
    r4 r8 do16 do re8[mi fa8. sol16]
    mi8[fa sol fa16 mi] fa8[la, la8. la16]

    %42
    sib4 la8. la16 sol8[la sib8. do16]
    la8.[sib16 do8 la] sib2~
    sib8 sib la sib\mbreak la16[sib do sib la8.\prall sib16]

    %45
    sib8 re mib do~do[sib do8. re16]
    sol,8[sol do re16 do] sib8[la sol do16 sib]

    %47 3/4 OOKK
    la2.
    R2.*3
    r4 r do\mbreak

    %52
    do4. sib8 do4
    re do sib
    la4 sol4._\prall fa8

    %55
    fa2 r4
    R2.*2
    r4 do'2

    %59
    sol la4
    sib4. sib8 la sol
    fa4 sol2

    %62
    la8 sib la sol la fa\mbreak
    sol4 do8 si do re
    si la sol la si dod

    %65
    re4 re8 dod re mi
    dod si la si dod la
    re4 dod8 re mi fad

    %68
    sol fa? mi fa mi re
    dod si dod re mi4
    re2 do4

    %71
    do2 sib4~
    sib8 la sib sol la sib\mbreak
    la sol la si do re

    %74
    mi4 si8 do re si
    do4. sib?8 sib do
    la4 do2

    %77
    fa,8 mi fa sol la sib
    do4. sol8 la sib
    la4 sib8 do re mi

    %80
    fa4 do4. si8
    do2 la4
    re sol,4._\prall fa8
    fa2.\mbreak

    %84 4/4 OOKK
    R1*13
    r4 r16 la si dod re4 si8 re
    sold, sold la4 r8 si[sold8._\prall la16]

    %99
    la4 r r2
    R1*2
    r8 do la re si do do si

    %103
    do4 r r2
    R1*4
    r4 r8 re re re16 mib fa4
    sib,4. do8 la[sib16 do la8.\prall sib16]

    %110 3/2 OOKK
    \override NoteHead #'duration-log = 1 sib4 re re
    re4. do8 [sib re]
    sol,4. sol8 sol4\mbreak

    %113
    sol4. sol8 la4
    sol sol sol
    la4. sib8 do4~

    %116
    do4. sib8 [la do]
    sib4. sib8 [sib la]
    sib4 sib sib8 do

    %119
    \tweak Stem.transparent ##t re2 re4
    \tweak Stem.transparent ##t mi2.
    re4 la8 [si do la]

    %122
    re4 re4. mi8
    \tweak Stem.transparent ##t dod2 dod4
    re sol, la~

    %125
    la4. sib8 sol4_\prall
    \tweak Stem.transparent ##t la2.
    R2.*16

    %143
    r4 r8 fa[fa8. sol16]
    la8 sib do4. do8
    do4 sib4. sib8

    %146
    sib4 la re
    sol, mi la
    sol sol la8 sib\mbreak
    \tweak Stem.transparent ##t la2.\revert NoteHead #'duration-log

    %150%%% Jerusalem
    R1
    r4 si do mi
    re re re4.\prall do8

    %153
    do2 mi~\mbreak
    mi re~
    re8 do si do la2~

    %156
    la4 si sold4._\prall la8
    la2. si4
    do2 dod4. dod8

    %159
    re2 do
    re4 sib? do4. re8
    sol,4 sib la8 sib do re\mbreak

    %162
    do2. do4
    sib1~
    sib4 sol mib'2~

    %165
    mib4 re do4.\prall sib8
    sib4 sib' re, sol
    do,2. do4

    %168
    do sib sib4. do8
    la\breve

}

IIIvocen = \relative do {

    \autoBeamOff

    R1*8
    fa2. sol4
    la2. fa4
    do'2(sib4)(la8) sib\mbreak
    la2. fa4
    sib4. sib8 sib4 do
    re2 sol,
    r4 sol do4. do8
    sib4 la sol2\prall
    fa r
    R1*2
    r4 la8 la la4~la16 la si do
    si4 si8 si si si16 dod re8. [mi16]
    dod2 r
    r4 la8. la16 la8 la16 sol sol8. la16\mbreak
    fad4 re'8. re16 re8 re16 do sib8.\prall la16
    sib8 re sol,8. sol16 sol8 [fa16\prall mi] mi4
    re2 r
    r8 la' la la16 si do8 do do8. re16\mbreak
    si4\prall r16 si do sold la8[si16 si8\prall la16 sold la]
    sold4\prall la8 si do la si dod
    re4 re8 do16 si do4(si8.\prall) la16
    la4 r r2\mbreak
    R1
    r4 r8 mi mi mi mi8. la16
    fad8 fad sol8. la16 sib8 sib do re
    mib do la8. do16 fad,8 fad16 fad sol4~\mbreak
    sol8 la fad8. sol16 sol4 r
    R1
    r4 si8 re la la16 la la8 si16 do
    si8 si16 si sol8 sol do do sol[la16] sib!\mbreak
    la4 do8. do16 do4 \parentSlur (si8.) do16
    do4 do,8. do16 fa8 fa mib8. fa16
    re4 fa8. fa16 fa4(mi8.) fa16
    fa2 r
    R1*3

    %47 %% 3/4 OOKK
    r4 r sol
    mi4.\prall fa8 sol4
    la sol la
    sol fa2
    mi r4\mbreak
    R2.*2
    r4 r do'
    la4. sib8 do4
    re do re
    do sib2
    la r4
    r do2
    sol4 sol la
    sib8 [do sib la sib sol](
    fa2) fa4\mbreak
    do8 [si do re mi fa](
    sol4.)~sol8 [fa  mi](
    re)[dod re mi fa sol](
    la4.) la8 la4
    sib2 sib4
    r sol4. sol8
    la2 sol4~sol la4. sol8
    fad4 sol2
    r4 mi4. mi8
    fa2 do4~
    do sol'4. sol8
    do,4 do'2
    r4 la4. la8
    sib2 fa4~
    fa do'4. do,8
    fa2 r4
    R2.*4

    %84
    r4 r8 sol mi4 do8 do' %%% 4/4
    la la re re16 do sib8. sib16 la8 sol
    fad8. fad16 fad4 la~la16 la sib do
    sib4 sib re,~re16 re mi fa\mbreak
    mi4(fad8) sol sol4.(fad8)
    sol4 si8 re si si si8. la16
    si8 si mi re do si la8.\prall sol16
    fad8 fad r8 si sol4(fad\prall)\mbreak
    mi r r r8 si'
    mi4~mi16 re do si la4 re8 si
    sold4 sold8 sold la4.(sold16) la
    sold4 r16 sold la si do4 la8 do\mbreak
    fad,4 sold8 la la4(sold8.\prall) la16
    la4 r r2
    R1
    r4 la fa8 fa16 fa sib8 sib16 do
    la8 fa r la\mbreak sol sol sol8. la16
    sib8. sib16 sib8 do la si16 do do8[si]
    do4 r r2
    r4 sol4. sol16 sol sol8 mi\mbreak
    do do do'4. do16 do do8 la
    fa fa fa fa16 fa fa8 mib mib re
    re4 re8 sib' fa fa16 sol lab8. sib16\mbreak
    sol4 la8 fa sib4.(la8)
    sib2 r
    R1

    %110 %% 3/2
    \override NoteHead #'duration-log = 1  r4 sib sib
    sib4. la8 sol sib
    mi,4. mi8 mi sol\mbreak
    do,4. do8 do4
    r do' do
    do4. sib8 la do
    fa,4. fa8 fa la
    re,4. re8 re4
    r r sib'
    la4. la8 la4~
    la la la\mbreak
    \tweak Stem.transparent ##t la2 la4
    \tweak Stem.transparent ##t la2 sol4
    \tweak Stem.transparent ##t la2.
    R2.*3
    \tweak Stem.transparent ##t mi2 mi8 mi
    \tweak Stem.transparent ##t mi2 la4
    \tweak Stem.transparent ##t fad2 fad4
    r la la8 la
    \tweak Stem.transparent ##t la2 re4
    \tweak Stem.transparent ##t si2 si4
    \tweak Stem.transparent ##t do2~do16 sib la sol
    fa4.(mi8)(re4\prall)
    \tweak Stem.transparent ##t do2.~
    \tweak Stem.transparent ##t do
    r4 r8 do mi8. fa16
    \tweak Stem.transparent ##t sol2 sol4
    sol8 la sib4(la8) sib
    la4.\prall la8 sib do
    re4. sol,8 sol[la16 sib]
    la4(\tweak Stem.transparent ##t sol2\prall)
    \tweak Stem.transparent ##t fa2 r4
    R2.*6

    %150 Jerusalem
    r4 do' do4. re8
    si4 sol do2~
    do(si4.) do8
    do2. do4\mbreak
    do4. do8 si4 re
    sold, sold8 sold la4 si
    do2(si\prall)
    la r
    r4 la la4. la8
    la4 fad sol4. la8
    sib2 r
    r4 sol la4. sib8\mbreak
    do4 la sib4. do8
    re1~
    re2 do~
    do4 sib la2\prall
    sol sib~
    sib la
    la(sol\prall)
    fa\breve

}

IIItesto = \lyricmode {

    In -- ci -- pit o -- ra -- ti -- o Je -- remi - ae Pro -- phe -- tae, Je -- remi - ae Pro -- phe -- tae.

    Recor - da -- re Domi - ne quid ac -- ci -- derit _ no -- bis;
    intu - ere _ et respi - ce intu - ere _ et respi - ce oppro - bri -- um nos -- trum.
    Haere - ditas _ nostra _ versa _ est ad ali - e -- nos, domus _ nostrae _ domus _ nostrae _ ad extra - ne -- os.
    Pupil - li facti _ sumus _ absque _ patre; _ matres _ nostrae _ quasi _ vidu - ae, qua -- si vidu - ae.
    Aquam _ nostram _ pecu - nia _ bibi - mus, ligna _ nostra _ preti - o compa - ra -- vi -- mus,
    ligna _ nostra _ preti - o compa - ra -- vi -- mus.

    Cer -- vici - bus nostris _  mi -- na -- ba -- mur, cer -- vici - bus nostris _  mi -- na -- ba -- mur;
    lassis _ non da -- ba -- tur re -- qui -- es, lassis _ non da -- ba -- tur re -- qui -- es,
    non non da -- ba -- tur re -- qui -- es, non non da -- ba -- tur re -- qui -- es.

    Ae -- gyp -- to Ae -- gyp -- to dedi - mus manum _  et As -- sy -- ri -- is ut sa -- tura - re -- mur
    ut sa -- tura - re -- mur pa -- ne.
    Patres _ nostri _ pecca - ver -- unt, patres _ nostri _ pecca - ver -- unt et non sunt, et nos
    i -- niqui - ta -- tes e -- o -- rum por -- ta -- vi -- mus, i -- niqui - ta -- tes e -- o -- rum por -- ta -- vi -- mus.

    Ser -- vi do -- mina - ti sunt nostri; _ non fuit _ qui re -- di -- meret _ de manu _  e -- o -- rum.
    In ani - ma -- bus nostris, _ in ani - ma -- bus nostris, _ affe - reba - mus
    pa -- nem no -- bis a faci - e gladi - i in de -- ser -- to.

    Pel -- lis nostra _  quasi _ cliba - nus ex -- usta _ est, pel -- lis nostra _  quasi _ cliba - nus ex -- usta _ est
    a faci - e tempes _ ta -- tum far - nis.
    Muli - e -- res in Si -- on, muli - e -- res in Si -- on hu -- mi -- li -- a -- ve -- runt
    et virgi - nes in civi - ta -- ti -- bus in civi - ta -- ti -- bus Ju -- da.

    Je -- ru -- sa -- lem, Je -- ru -- sa -- lem, con -- ver -- tere _ ad Domi - num De -- um tu -- um, con -- ver -- te -- re Je -- ru -- sa -- lem, con -- ver -- te -- re ad Domi - num De -- um tu -- um, De -- um tu -- um.



}

IIIbcn = \relative do {

    fa2. sol4
    la2 fa
    do'2. sib4

    %4
    la fa sol la
    sib2 la4 sol
    fa mi re2

    %7
    do4 re mi2
    fa la,
    sib la4 sol

    %10
    fa2 fa'
    mi1\mbreak
    mib

    %13
    re2. do4
    sib1
    do2 la

    %16
    sib do
    re la
    sib do

    %19
    fa,1
    fa'1~% 4/4 OOKK
    fa2~fa8. mi16 re4

    %22
    la'4. dod,8 re[mi16 fa sol8. sol16]
    la2 dod,\mbreak
    re fad,

    %25
    sol8.[la16 sib8 sol] la2
    re4. re8 sol re la' la,
    re2 la'4 fad\mbreak

    %28
    sol mi fa re
    mi8 re do si la sol' fa mi
    re8.[mi16 fa8 mi16 re] mi4 mi,

    %31
    la8[sol' fa mi fa sol fa mi]\mbreak
    re[do si8. si16] do8 la mi' mi,
    la2 dod

    %34
    re8 do sib la sol' fa mib re
    do2 re4 mib8 re\mbreak
    do4 re sol,8 fa' mib re

    %37
    do re mib do re sol, re' re,
    sol4 sol'~sol fad
    sol4. fa?8 mi?2\mbreak

    %40
    fa4 mi re2
    do4. do8 fa4 mib
    re fa do2

    %43
    fa,8.[sol16 la8 fa] sib8.[do16 re8 sib]
    mib re do sib\mbreak fa' mib fa fa,
    sib sib' sib la sib [sol la8. sib16]

    %46
    do8[do16 sib la8 sib] sol fa do' do,
    fa2 si,4% 3/2 OOKK
    do4. re8 mi4

    %49
    fa mi fa
    mi re si
    do4. re8 mi4\mbreak

    %52
    fa2.
    sib,4 do2
    re8 sib do2

    %55
    fa4. sol8 la4
    sib la sib
    la sol mi

    %58
    fa fa,8 sol la sib
    do4 do'2
    sol la4

    %61
    sib sol2
    fa fa4\mbreak
    do8 si do re mi fa

    %64
    sol4. sol8 fa mi
    re dod re mi fa sol
    la2 la4

    %67
    sib2~sib8 la
    sol2 sol4
    la2 sol4~

    %70
    sol la4. sol8
    fad4 sol4. fa?8
    mi2 mi4\mbreak

    %73
    fa2 do4~
    do sol' sol,
    do do'2

    %76
    fa,4 la2
    sib fa4~
    fa do' do,

    %79
    fa, sib la8 sol
    fa sol la sib do re
    do4 la fa

    %82
    sib do2
    fa,2 fa'4
    do si do mi% 4/4 OOOKKK

    %85
    fa fad sol do,
    re2 fad,
    sol sib~\mbreak

    %88
    sib4 la8 sol re'4 re,
    sol2 sol'~
    sol4 sold la2~

    %91
    la4 sol8 sol, do la si4\mbreak
    mi, r r mi'8 re
    do2 fa4 si,

    %94
    do2 la
    mi'4 sold, la8. si16 do4~\mbreak
    do si8 la mi'4 mi,

    %97
    la la' re,2~
    re4 do8 re mi4 mi,
    la dod re~re8 mi

    %100
    fa4 fa,\mbreak do' sib8. la16
    sol8[sol'16 fa mi8 do] fa8.[mi16 re8 sol]
    do, do fa re sol mi re sol

    %103
    do,2 sib\mbreak
    la1
    la

    %106
    sib2 re\mbreak
    mib re8 mib fa fa,
    sib2~sib4~sib16 do re sib

    %109
    mib8 fa sol mib fa sib, fa4
    \override NoteHead #'duration-log = 1  \tweak Stem.transparent ##t sib2.~ %% 3/2
    \tweak Stem.transparent ##t sib2 sib4

    %112
    \tweak Stem.transparent ##t do2.
    do4. do8 fa,4
    \tweak Stem.transparent ##t do'2.

    %115
    \tweak Stem.transparent ##t la~
    \tweak Stem.transparent ##t la
    sib4. sib8 [sib re]

    %118
    sol,4 sol sol
    \tweak Stem.transparent ##t re'2 re4
    \tweak Stem.transparent ##t dod2.

    %121
    \tweak Stem.transparent ##t re2 do4
    \tweak Stem.transparent ##t sib2.
    \tweak Stem.transparent ##t la2.

    %124
    \tweak Stem.transparent ##t re2 do4
    \tweak Stem.transparent ##t sib2.
    \tweak Stem.transparent ##t la2.

    %127
    \tweak Stem.transparent ##t dod~
    \tweak Stem.transparent ##t dod
    \tweak Stem.transparent ##t re

    %130
    \tweak Stem.transparent ##t fad,~
    \tweak Stem.transparent ##t fad
    sol4 sol'4. fa8

    %133
    mi4 fa4. mi8
    \tweak Stem.transparent ##t re2.
    do4. sib8 [la sol]

    %136
    \tweak Stem.transparent ##t fa2.
    \tweak Stem.transparent ##t do'
    sib4 sib4. la8

    %139
    \tweak Stem.transparent ##t sol2.
    fa4 fa'8 [mib re do]
    \tweak Stem.transparent ##t sib2.

    %142
    \tweak Stem.transparent ##t do
    re4. re8 [do sib]
    \tweak Stem.transparent ##t la2 la4

    %145
    sib4. sib8 [sib do]
    re4. do8 sib4
    do4. sib8 la4

    %148
    sib \tweak Stem.transparent ##t do2
    \tweak Stem.transparent ##t fa,2.
    fa'2 mi % Jerusalem

    %151
    re4 fa mi do
    sol'2 sol,
    do1\mbreak

    %154
    re1
    mi2 fa
    mi2. re4

    %157
    dod2 re
    la1
    re4 do sib4. la8

    %160
    sol4 sol la4. sib8
    do4 re do4. sib8\mbreak
    la1

    %163
    sib4 sib do4. re8
    mib2. do4
    re1

    %166
    sol,2. sol4
    la2 fa
    do'1

    %169
    fa,\breve

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*3
    s2 <7>
    s <6 4>4 <6>
    s <6 4> <6+>2
    s1
    s2 <5->
    <5>4 <6> <6 4> <6>
    s1*2
    <4+ 2>1
    <5 3>4. <6>8 <6 4 2->4 <6>
    <5>2 <6>
    s1
    s2 <5 4>4 <5 3>
    s2 <5->
    <9 7>8 <8 6> <7 5>4 <5 4> <3>
    s1
    s
    <6 4+>2 s8. <6+>16 s4
    <_+>2 <9>4 <6>
    <_+>2 <6>4 <5->
    <_+>2 <6>4 <5->
    s2 <7 3+>8 <6 4> <5 4> <3>
    s2 <_+>4 <5 4>8 <5 3>
    s2 <_->
    <_+>4 <_+ 5>8 <6> s4 <6>
    <_+> <6 4+> <_->8 <4+ 2> <6 4+> <6+>
    s2 <6 4>4 <5 4>8. <3>16
    s8 <4+ 2> <6 4+> <6+> <6> <4+ 2> <6 4+> <6+>
    <_->4 <5> <9 5+> <_+>
    <_+>1
    <_+>8 <4+ 2> <6 4+> <6+> <_-> <4 2> <6 4+> s
    <5 _->4 <6> s <6>
    <6 4> <_+> s8 <4 2> <6 4+> <6+>
    s4 <6> <7 _+> <_+>
    <_-> <_+> <4 2> s
    <_+>1
    s2 <7>4 <6+>
    s1
    s2 <5 4>4 <5 3>
    s4 <6> s <6>
    s8 <6> <6> s
    s8 <6 5> <3> s
    s4 <4 2> <9> <7>
    s2 <6+>4 <3>

    %% 3/4
    s2.*6
    s4 <6> <5>
    s <3>2
    s2.*2
    <6>4 <6> s
    s2.*2
    s2 <6>4
    s <6+>2
    s2.*2
    <_+>2.
    s
    <3+>
    <6 3>4 <6 4+> s8 <6+>
    <5>2 <6>4
    s2.
    s4 <5 4> <3->
    <6 5->4 <5 4> <3->
    <6 5->2.
    s
    s4 <3+>2
    s2.
    s4 <5->2
    s2.
    s4 <3>2
    s2.
    s2 s8 <6+>
    s2.
    <6 5>4 <5 3>2
    s2.

    % 4/4
    s1
    s2 s4 <6 _->
    s1
    s2 <6>
    <6 4+>4 <6+> <4> <3>
    <_+>2 <_+>
    s <5>4 <6+>
    <4+> <6> s <4>8 <3>
    s1
    s2 <7>4 <7>
    <9 7 5+>1
    <_+>2 s4 <6>
    <4+>4 <6+> <4> <3>
    <_-> <_+> <5> <6>
    <4+> s <6 4> <5 4>8. <3>16
    s2 <5>4 <6>
    s2 s4 <6 4+>
    s2 <5>8 <6> <7> <_+>
    s2 <_+>8 <6> <7> <_+>
    s2 <4+>
    <6>1
    <6>2 <5->
    s <6>4 <5->
    <5 3> <6 4+> <6> <4>8 <3>
    s1
    s4 <6> <7> <3>


    %%% 3/2
    s2.
    s2 <6>4
    s2.*3
    <5>2 <6>8 <5>
    <6>2 <6>4
    s2.*5
    <7>2 <6>4
    <7 _+>2.
    <5 3>4 <4 2> <6>
    <7>2 <6>4
    <_+>2.
    s
    s
    <_+>
    s2.*4
    <7>2 <6+>4
    s2.*3
    <6 4+>2.
    <5>2 <6+>4
    s2
    <6 4>8 <6>
    <5>2 <6>4
    <6 4>4  <5 4> <3>
    s2 <6 4>8 <6>
    <6>4 <5-> s
    <9>4 <8>2
    s2.*2
    <6 5>4 <5 3>2
    s2.

%%% 2/2 Jerusalem bar 104 OOOKKK
    s2 <6>
    <6+>1
    s
    <5>2 <6>
    <9 7> <8 6+>
    <_+>1
    <6 4> 2 <5 4>4 <5 3>
    s1
    <_->2 <_+>
    <_+>4 <4+ 2> <6 4> s
    s1
    s4 <6 4> <6 4>2
    s1
    s
    <7>2 <6>4 <6>
    <9 7 3+>4 <8 6 4> <7 5 4> <3>
    s1
    <9>

}


forma = {

    \time 2/2
    \key fa\major
    \tempo 2 = 57
    s1*19
    \bar "||"\break
    \mark\markup\italic"petite pause"
    \time 4/4
    \tempo 2 = 37
    s1*27\break
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 50
    s2.*37\break
    \time 4/4
    \tempo 2 = 37
    s1*26\break
    \time 3/2
    \set Timing.measureLength = #(ly:make-moment 3/4)
    \tempo 2 = 50
    s2.*40\break
    \time 4/4
    \tempo 2 = 65
    s1*19
    s\breve
    \bar "|."

}

IIIdsI = {
    %\notypeset
    <<\IIIdsIn \forma>>



}

IIIdsII = {
    <<\IIIdsIIn \forma>>

}

IIIvoce = {
    \new Voice = "terza"
    <<\IIIvocen \forma>>
}


IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}

#(set-global-staff-size 17)

\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza

}

\header {
    title = \markup\smaller {"Trois leçons de ténèbres"}
    %subsubtitle = \markup\tiny#(string-append "  ")
    composer = \markup \center-column{"M.A. Charpentier (1643-1704)"}
}

\paper {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup \huge {"[1.] Troisième leçon de ténèbres du Mercredi Saint pour une Basse [H 141]"}

\score {

    \new ChoirStaff	<<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \time 2/2\key fa\major  r2 la''^\markup\center-align"[1.er Dessus]"}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IdsI \global
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \time 2/2\key fa\major  r1^\markup\center-align"[2.me Dessus]"}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IdsII \global
        >>

        \new Staff <<
            \clef bass
            \set Staff.instrumentName = \markup "Basse"
            \set Staff.midiInstrument = #"voice oohs"
            \Ivoce \global
            \new Lyrics \lyricsto "prima" \Itesto
        >>

        \new Staff = "main"
        \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }<<
            \set Staff.instrumentName = \markup  \center-column{"[Basse"\vspace #-0.2"Continue]"}
            \set Staff.midiInstrument = #"church organ"
            \Ibc \global
        >>
    >>

    \layout {

        indent = 2.3\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            skipBars = ##t
        }

    }

    \midi {
        \context {
            \Voice
            \remove Dynamic_performer
        }
    }

}

\pageBreak

\markup \huge {"[2.] Troisième leçon de ténèbres du Jeudi Saint pour une Basse [H 142]"}

\score {

    \new ChoirStaff	<<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \time 2/2\key fa\major  r1^\markup\center-align"[1.er Dessus]"}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IIdsI \global
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \time 2/2\key fa\major  r1^\markup\center-align"[2.me Dessus]"}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IIdsII \global
        >>

        \new Staff <<
            \clef bass
            \set Staff.instrumentName = \markup "Basse"
            \set Staff.midiInstrument = #"voice oohs"
            \IIvoce \global
            \new Lyrics \lyricsto "seconda" \IItesto
        >>

        \new Staff = "main"
        \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }<<
            \set Staff.instrumentName = \markup  \center-column{"[Basse"\vspace #-0.2"Continue]"}
            \set Staff.midiInstrument = #"church organ"
            \IIbc \global
        >>
    >>

    \layout {

        indent = 2.3\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            skipBars = ##t
        }

    }

    \midi {
        \context {
            \Voice
            \remove Dynamic_performer
        }
    }

}

\pageBreak

\markup \huge {"[3.] Troisième leçon de ténèbres du Vendredi Saint pour une Basse [H 143]"}

\score {

    \new ChoirStaff	<<

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \time 2/2\key fa\major  r1^\markup\center-align"[1.er Dessus]"}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IIIdsI \global
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef french \time 2/2\key fa\major  r1^\markup\center-align"[2.me Dessus]"}
            \clef violin
            \set Staff.midiInstrument = #"violin"
            \IIIdsII \global
        >>

        \new Staff <<
            \clef bass
            \set Staff.instrumentName = \markup "Basse"
            \set Staff.midiInstrument = #"voice oohs"
            \IIIvoce \global
            \new Lyrics \lyricsto "terza" \IIItesto
        >>

        \new Staff = "main"
        \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        }<<
            \set Staff.instrumentName = \markup  \center-column{"[Basse"\vspace #-0.2"Continue]"}
            \set Staff.midiInstrument = #"church organ"
            \IIIbc \global
        >>
    >>

    \layout {

        indent = 2.3\cm
        incipit-width = 2\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            skipBars = ##t
        }

    }

    \midi {
        \context {
            \Voice
            \remove Dynamic_performer
        }
    }

}

