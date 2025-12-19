\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tr = \trill

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizz."

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = ^\markup \italic "Tutti"

pad = \once \override TextScript.padding = #3

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

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


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f

}

Itenoren = \relative do' {

   \autoBeamOff

   r4 do8 re mi mi16 mi sol8 mi
   sib8. sib16 sib4 r8  sib sib la
   sol sol 16 la sib8 la16 sol dod4 dod

   %4
   r8 dod mi la, fa' fa r fa
   mi si16 do? re8 mi16 si dod8 dod r dod
   red4 red8  red mi mi, si' si16 do?\mbreak

   %7
   re?8 re r16 re do si la8. la16 la4
   r2 r4 r8 mi'
   do do si la re re16 re r8 re\mbreak

   %10
   re do16 do re8 la si si16 si r8 si
   si re si sol do8. do16 do4
   r8 do16 re mi8 fa16 \parenthesize sol sol4 sib,\mbreak

   %13
   r8 sib do sol la la16 la fa'8 re
   si? do do sol16 sol r2
   R1*2

}

Itesto = \lyricmode {

    Proh, quos cri -- minis _ in cleme - ntia _ super _ mor -- tales _ in -- duxit  _ mœ -- rores, _

    dum primus _ homo _ de ligno _ man -- ducans _ er -- roris, _ hor -- rendo _ de -- creto _ mor -- ti æ -- ternæ _ a -- djudi - catus _ est.

    Et ec -- ce! Cœli _ Do -- minus,  _ ut per __ ditum _ vitæ _ red -- deret, _ ser -- vus pro e -- o fie - [ri],

    et de Vir -- gini _ nasci, _ et in præse - pio _ recli - nari _ volu - it.

}

IvlIn = \relative do'' {

    <<{sol1\pp ~
    sol\f~
    sol~

    %4
    sol4.\tr}\\{s1 s s2\p s\f}>> la8 si2~
    si(sib4\f) la_\markup {(\musicglyph #"p")}~
    la8 si!  do2\f si4_\markup {(\musicglyph #"p")}~\mbreak

    %7
    si8 do re4. re8\f do do
    do do si si si si si\p si
    la2~la~\mbreak

    %10
    la <<{\stemUp sol\f~
          sol1~
          sol

          %13
          sol2}\\{s2 s s\p}>>\mbreak fa4 la8 re~
    re do do si do mib,\f mib mib
    mib? mib re re re re re re

    %16
    mi?1

}

IvlIIn = \relative do'' {

    mi,1~
    mi~
    mi2\parentSlur (mi)

    %4
    \parentSlur (mi) mi
    mi mi
    la sold

    %7
    sold r8 la_\markup {[\musicglyph #"f"]} la la
    la la la la la la sold\p sold
    la2~la

    %10
    \parentSlur (la) re,~
    re mi
    \parentSlur (mi1)

    %13
    mi2 do
    sol' sol8 do,\f do do
    do do do do do do si si

    %16
    do1

}

Ivlan = \relative do' {

    do1(
    mi)~
    mi~

    %4
    mi4 dod? re2~
    re4 si mi2
    la,4. si8 do8 re mi4

    %7
    mi si r8 la_\markup {[\musicglyph #"f"]} fa' fa
    fad fad fad fad mi mi mi_\markup {[\musicglyph #"p"]} mi
    mi2 \parentSlur (re)

    %10
    re~re~
    re do~
    do1

    %13
    do2 fa~
    fa8 mi re[re] do do\f sol  sol
    la la la la sol sol sol sol

    %16
    sol1

}

Ibcn = \relative do {

    do1_\markup\italic"T[utti] Bassi mà piano"
    dod^\f~
    dod2\p sib^\f

    %4
    la4^\p la' sold2\parentSlur (
    sold) sol^\f
    fa^\p mi

    %7
    mi2 fa8 fa\f fa fa
    red red red red mi  mi mi mi
    la,2 fad'\parentSlur (

    %10
    fad )fa~
    fa mi~
    mi1\parentSlur (

    %13
    mi2) fa
    sol do,8 do^\f do do
    fad fad fad fad sol sol sol sol

    %16
    do,1

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1
   <7->
   s2 <6 4 2+>
   <_+>2 <7>
   <6> <6 4+ 3->4\bassFigureExtendersOn <6 4+ 2>
   <6\\ 3> <6\\ 5> \bassFigureExtendersOff <6 _+> \bassFigureExtendersOn <5 _+>
   \bassFigureExtendersOff <7 _+>2 <6>4 <5>
   <7> <6> <4> <_+>
   s2 <6>
   <6> <4 2>
   <4 2> <6>
   <6> <5->
   <5->1
   <7>8 <6 4> <5 4> <3>
   s8 <_-> s4
   <7-> <6> <4> <3>




}

forma = {

   \key do\major
   \time 4/4
   %\override Staff.TimeSignature.style = #'single-digit
   \tempo 4 = 60
   s1*16
   \bar "||"

}

Itenore = {
   \new Voice = "proh"
   %\notypeset
   \Iglobal
   <<\Itenoren\forma>>
}


IvlI = {
   \Iglobal
   \clef violin
   <<\IvlIn \forma>>
}


IvlII = {
   \Iglobal
   \clef violin
   <<\IvlIIn \forma>>
}


Ivla = {
   \Iglobal
   \clef alto
   <<\Ivlan \forma>>
}


Ibc = {
   \Iglobal
   \clef bass
   <<\Ibcn \forma \Ibfn>>
   \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


IIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f

}

IItenoren = \relative do' {

   \autoBeamOff

   R2.*25
   r8 do do re4 do8
   re16[mi] mi4\tr fa do8\mbreak

   %28
   R2.
   r8 do do re4 do8
   re16[mi] mi4\tr fa do8

   %31
   R2.
   r8 fa mi re4 do8
   R2.

   %34
   r8 fa mi mi re4
   R2.
   re8 sol, re' re dod dod

   %37
   la mi'  sol sol8. fa16 fa8~
   fa16[mi32 re mi16 si mi re] dod[re ] mi4~
   mi8[re16 dod] re8~re16[mi] dod8.[re16]\mbreak

   %40
   re4 r8 r4.
   R2.
   r4. re8 re do?

   %43
   do8. si16 si8 sol re' fa\mbreak
   fa8. mi16 mi8\parentSlur ( mi16)[do32 re mi16 fa sol8]~
   sol16[fa32 mi fa16 do fa do] fa4.~

   %46
   fa16[mi32 re mi16 do re do] si[sol32 la si16 sol do sib]
   la[do] fa8.[re16] mi[do] re8. re16\mbreak
   do4 r8 r4.

   %49
   R2.*7
   R1*6
   r2 r4 r8 sol

   %63 OK
   sol8. sol16 sol8 la16[si] do4 do,8 do'\mbreak
   re do fa8. mi16 mi4 r
   r r8 do do8. si16 si8 si

   %66
   si la r re re re, r re'
   si16 [sol'32 fa mi16 re] do [do32 si la16 sol] fad8 re r re'\mbreak
   re re, r la' sold16[mi'32 re do16 si] la[la32 sold la16 si]

   %69
   mi,[mi'32 re do16 si] la[la32 sold la16 dod]re[dod re8]~re16 [fa? mi re]
   do8 la' si,8. si16 la4 r
   R1

   %72
   r4 r8 mi' dod8. dod16 re8 mi
   fa16[mi] re8 r re re re, r re'
   si16[sol] si [do] re[mi] do [re] mi4 r8 do

   %75 OK
   do do, r mi' mi8. re16 re8 do\mbreak
   do8 si r re re re, r re'
   mi16[do re si] do[la si sol] fad8 re r re'

   %78
   re8. do16 do8 si si la r mi'
   re16[sol fad sol] re[mi re mi] re[sol fad sol] re[mi re mi]\mbreak
   re8 sol la,8. la16 sol4 r

   %81
   R1
   r4 r8re' si8. si16 do8 re
   mi16[re] do8 r sol' sol sol, r sol'\mbreak

   %84
   mi16[sol32 fa mi16 re] do[si la sol] fa?8 re' r re
   re re, r re' si16[re32 do si16 la] sol[fa mi re]
   mi8 mi' r sol sol sol, r sol'

   %87
   mi16[sol32 fa mi16 re] do[sib la sol] la8 fa r la\mbreak
   si4 r16 si[la si] do[do si do] re[re do re]
   mi[mi re mi] fa[fa mi fa] sol8[si,] do[la]

   %90
   si4. do8 do sol do4~
   do~do2~do4~\mbreak
   do16[sol'32 fa mi16 re] do[sib la sol] fa[fa'32 mi re16 do] si![la sol fa]

   %93
   mi8 do' re si do16[sol' mi do] re8 si
   do4 r r2
   R1*6

   %101
   R2.*16

}

IItesto = \lyricmode {

    Dormi _ De -- us in -- car -- na -- te, dormi _ De -- us in -- car -- na -- te

    dormi _ amor _ ex -- op -- tate _  no -- xas e -- li -- mina _ corda _ il -- lumi - na - - il -- lumi -- na

    no -- xas e -- li -- mina _ corda _ il -- lu -- mi -- na - - - -  il -- lu -- mi -- na.

    Jam cri -- minum _ in -- fe -- sta  pel -- lun -- tur  nu -- bila _ tot gau -- diis _ ju -- cundis _ ap -- plaudant _

    applau - - - dant ap -- plaudant _ ap -- plau - - - - - dant ju -- bila _

    jam cri -- minum _ in -- festa _ pel -- luntur _ pel -- lun -- tur nu -- bi -- la

    ap -- plaudant _ tot gau -- di -- is ju -- cundis _ ap -- plaudant, _ ap -- plau - - dant, tot gau -- diis _

    ju -- cundis _ ap -- plau - - - - dant ju -- bi -- la tot gau -- diis _  ju -- cundis _ ap -- plaudant _

    ap -- plau  - - dant ap -- plaudant _ ap -- plau  - - dant ap -- plaudant _ ap -- plau  - - dant ap --

    plau - - - - - - dant ju -- bi -- la ap -- plau - - - - dant ju -- bi -- la ju -- bi -- la.

}

IIrecIn = \relative do'' {

    r8 do do re4 do8
    re16[(mi)] mi8.\tr re32 mi fa8 do r
    R2.

    %4
    r8 do' do re sib16(do re8)
    re(do) r r4.
    r8 fa, fa sol mi16(fa sol8)

    %7
    sol (fa) r r4.\mbreak
    r8 la la sib sol16(la sib8)
    sib(la)  r r4.

    %10
    R2.*4
    r8 sol sol la4 sol8
    la16[(si)] si8.\tr la32 si do8 sol r\mbreak

    %16
    R2.
    r8 sol sol la fa16(sol la8)
    la (sol) r r4.

    %19
    r8 do do re si16(do re8)\mbreak
    re\parentSlur (do) r r4.
    r8 do do do16[sib?32 la] sib16 fa sib fa

    %22
    sib4.~sib16[la32 sol] la16 mi la mi
    la4.~la16[sol32 fa] sol16 re sol re\mbreak
    mi4. fa4 mi8~

    %25
    mi16 do32 re mi16 do fa8\noBeam~fa16[sol] sol8. fa16
    fa4 r8 r4.
    R2.*3

    %30
    r4. r8 la la
    sib4 la8 sib sol do16 sib\mbreak
    la4 r8 r4.

    %33
    R2.
    r4. r8 si si
    do la16 si do8~do16 re do re do re\mbreak

    %36
    do8 si r r4.
    R2.*2
    r4. r8 la4\mbreak

    %40
    la16 sol32 fa sol16 re sol re sol4.~
    sol16 mi32 fa sol16 mi la sol fa8 sol16 la sib?8~
    sib16[mi,] mi8. re16 re4 r8

    %43
    R2.*5
    r8 sol sol la fa16(sol la8)
    la(sol) r r4.

    %50
    r r8 sol sol16.\tr fa64 sol
    la4.~la16 sol32 fa sol16 re sol re\mbreak  % fine p.11
    sol4.~sol16 fa32 mi fa16 do fa do

    %53
    fa4.~fa16 mi32 re mi16 do do' sib!
    la(sol) sol(fa) fa(mi) fa4.\parentSlur (
    fa4) mi8~mi16[\parentSlur (fa)] re8. do16\mbreak

    %56 OK
    do4 r r2
    R1*44
    r8 sol' sol la4 sol8

    %102
    la16(si) si8. [la32 si] do8 sol r
    R2.*3
    r4. r8 sol sol16.\tr fa64 sol
    la4.~la16 sol32 fa sol16 re sol re\mbreak

    %108
    sol4.~sol16 fa32 mi fa16 do fa do
    fa4.~fa16 mi32 re mi16 do do' sib
    la(sol) sol(fa) fa(mi) fa4.~

    %111
    fa4 mi8 mi16[fa] re8. do16\mbreak
    do8 mi16\parentSlur (re) re\parentSlur (do) mi4.
    r r8 do'16\f sib sib la

    %114
    la(sol) sol(fa) fa(mi) fa4.~
    fa4 mi8 la\noBeam^\markup\italic"adag[io]" sol8. sol16
    sol4. r

}

IIrecIIn = \relative do'' {

    r8 la la sib4 la8
    sib sol do16 sib la \parentSlur (sol) la8 r
    R2.\mbreak

    %4
    r8 la' la sib sol16(la sib8)
    sib(la) r r4.
    r8 la, la sib sol16(la sib8)

    %7
    sib(la) r r4.\mbreak
    r8 do do re sib16(do re8)
    re(do) r r4.

    %10
    R2.*4
    r8 mi mi fa4 mi8
    fa re sol16(fa) mi(re) mi8 \parenthesize r\mbreak

    %16
    R2.
    r8 mi mi fa re16(mi fa8)
    fa(mi) r r4.

    %19
    r8 mi mi fa re16(mi fa8)\mbreak
    fa \parentSlur (mi) r r4.
    r8 do do re4.~

    %22
    re16 sib32 do re16 sib mib re do4.~
    do16 la32 sib do16 la re do sib4.~\mbreak
    sib16 sol32 la sib16 sol do sib la fa32 sol la16 fa sib la

    %25
    sol8 do r re16[mi] mi8. fa16
    fa4 r8 r4.
    R2.*3

    %30
    r4. r16 do la fa fa' mib
    re4 do8 re16[(mi?)] mi8.\tr re32 mi\mbreak

    %32
    fa8 do4 r4.
    R2.
    r4. r8 re re

    %35
    mi8 do16 re mi8~mi16 fa mi fa mi fa\mbreak
    mi8 re r r4.
    R2.*3

    %40
    r8 sib4~sib16 sol32 la sib16 sol do sib
    la8 mi'4~mi8 re16 dod re8~
    re16 mi dod8.[re16] re4 r8

    %43
    R2.*5
    r8 mi mi fa re16(mi fa8)
    fa(mi) r r4.

    %50
    r8 sol sol16.\tr fa64 sol la8 mi mi16.\tr re64 mi
    fa8 do do16.\tr sib64 do sib4.~\mbreak
    sib16 sol32 la sib16 sol do sib la4.~

    %53
    la16 fa32 sol la16 fa sib la sol8 do4
    r8 r do~do16 (si) si(la) re(do)
    si16 sol32 la si16 sol do8\noBeam ~do16[\parentSlur (re)] si8. do16\mbreak

    %56 OK
    do4 r r2
    R1*44
    r8 mi mi fa4 mi8

    %102
    fa re sol16 fa mi(re) mi8 r
    R2.*3
    r4. r8 sol sol16.\tr fa64 sol
    la4.~la16 sol32 fa sol16 re sol re\mbreak

    %108
    sol4.~sol16 fa32 mi fa16 do fa do
    fa4.~fa16 mi32 re mi16 do do' sib
    la(sol) sol(fa) fa(mi) fa4.~

    %111
    fa4 mi8 mi16[fa] re8. do16\mbreak
    do8 mi16\parentSlur (re) re\parentSlur (do) mi4.
    r r8 do'16\f sib sib la

    %114
    la(sol) sol(fa) fa(mi) fa4.~
    fa4 mi8 la \noBeam sol8. sol16
    sol4. r

}

IIflIn = \relative do'' {

    R2.
    r4. r8 do do
    re4 do8 re16[(mi)] mi8.\tr re32 mi\mbreak

    %4
    fa8 do r r4.
    r8 la' la sib sol16 (la sib8)
    sib(la) r r4.

    %7
    r8 do, do re sib16(do re8)\mbreak
    re(do) r r4.
    r8 la' la la16[sol32 fa] sol16 re sol re

    %10
    sol4.~sol16[fa32 mi] fa16 do fa do
    fa4.~fa16[mi32 re] mi16 do do' sib\mbreak
    la16(sol) sol(fa) fa(mi) fa4.~

    %13
    fa4 mi8~mi16[fa] re8. do16
    do4. r
    r r8 mi mi\mbreak

    %16
    fa4 mi8 fa re sol16 \parentSlur (fa)
    mi16 \parentSlur (re )mi8 r r4.
    r8 mi mi fa re16 \parentSlur (mi fa8)

    %19
    fa(mi) r r4.\mbreak
    r8 sol sol la fa16(sol la8)
    la(sol) fa fa r fa

    %22
    sol r sol mi r mi
    fa r fa re r re\mbreak
    do r do' do r do

    %25
    do r do sib16 sol32 la sib16 sol do sib
    la4 r8 r4.
    r4. r16 do, la fa fa' mib

    %28
    re4 do8 re16[\parentSlur (mi?)] mi8.\tr re32 mi
    fa4 do8 r4.
    R2.*3

    %33
    r8 fa mi re4 do8
    R2.*4
    r8 sol'4~ sol16 mi32 fa sol16 mi la sol

    %39
    fa8 sol16 la sib8~sib16[sol] mi8. re16
    \parenthesize re4 r8 r4.
    R2.*4

    %45
    r8 la'4~la16 fa32 sol la16 fa la fa
    sol4.~sol8. fa16 mi re
    do8 re si do16[sol'] si,8. do16\mbreak

    %48
    do4 r8 r4.
    r8 mi mi fa re16(mi fa8)
    fa \parentSlur (mi) r r4.

    %51
    R2.
    do'8 do, r r r la'
    re re, r r sol4~

    %54
    sol8 do, fa~fa sol, r
    fa'4 mi8 la sol16 re sol sol % OK
    sol4 r r2

    %57
    R1*44
    R2.
    r4. r8 sol sol

    %103
    la4 sol8 la16 si si8.\tr[la32 si]\mbreak
    do8 sol r r4.
    r8 mi mi fa re16 mi fa8

    %106
    fa mi r r sol sol16.\tr fa64 sol
    la4.~la16 sol32 fa sol16 re sol re\mbreak
    sol4.~sol16 fa32 mi fa16 do fa do

    %109
    fa4.~fa16 mi32 re mi16 do do' sib
    la(sol) sol(fa) fa(mi) fa4.~
    fa4 mi8 mi16[fa] re8. do16\mbreak

    %112
    do4 r8 r mi16 re re do
    do4 r8 r do'16\f sib sib la

    %114
    la(sol) sol(fa) fa(mi) fa4.~
    fa4 mi8 la\noBeam sol8. sol16
    sol4. r

}

IIflIIn = \relative do'' {

    R2.
    r4. r8 la la
    sib4 la8 sib sol do16 sib\mbreak

    %4
    la(sol) la8 r r4.
    r8 do do re sib16 \parentSlur (do re8)
    re(do) r r4.

    %7
    r8 la la sib sol16(la sib8)\mbreak
    \parenthesize sib(\parenthesize la) r r4.
    r8 do do sib4.~

    %10
    sib16 sol32 la sib16[sol do sib] la4.~
    la16 fa32 sol la16[fa sib la] sol8 do4\mbreak
    r8 r do~ do16(si) si(la) re(do)

    %13
    si16 sol32 la si16 sol  do8\noBeam~do16[re] si8. do16
    do4. r
    r r8 sol sol\mbreak

    %16
    la4 sol8 la16[\parentSlur (si)] si8. la32 si
    do8 sol r r4.
    r8 sol sol la fa16 \parentSlur (sol la8)

    %19
    la \parentSlur (sol) r r4.\mbreak
    r8 mi' mi fa re16(mi fa8)
    fa \parentSlur (mi) r r fa re

    %22
    r sib? sib' r mi, do
    r la la' r re, sib\mbreak
    r do do' r do, do'

    %25
    r do, do' r4.
    R2.
    r4. r8 la, la
    sib4 la8 sib sol do16 \parentSlur (sib)

    %29
    la \parentSlur (sol) la8 r r4.
    R2.*3
    r8 do si la4 sol8

    %34
    R2.*15
    r8 sol sol la fa16(sol la8)
    la \parentSlur (sol) r r4.

    %51
    R2.\mbreak
    r8 r sol' do,4 r8
    r r re sol,4 r8

    %54
    r r la' la re,16 mi fa mi
    re16 sol,32 la si16 sol do8\noBeam ~do16[\parentSlur (re)] si8. do16\mbreak  %%% OK
    do4 r r2

    %57
    R1*44
    R2.
    r4. r8 mi mi

    %103
    fa4 mi8 fa re sol16 fa
    \parenthesize mi16(\parenthesize re) \parenthesize mi8 r r4.
    r8 sol, sol la fa16 sol la8

    %106
    la sol r r sol' sol16.\tr fa64 sol
    la4.~la16 sol32 fa sol16 re sol re\mbreak
    sol4.~sol16 fa32 mi fa16 do fa do

    %109
    fa4.~fa16 mi32 re mi16 do do' sib
    la(sol) sol(fa) fa(mi) fa4.~
    fa4 mi8 mi16[fa] re8. do16\mbreak

    %112
    do4 r8 r sol16 fa fa mi
    mi4 r8  r do''16\f sib sib la

    %114
    la(sol) sol(fa) fa(mi) fa4.~
    fa4 mi8 la\noBeam sol8. sol16
    sol4. r

}

IIvlIn = \relative do'' {

    R2.*26
    r4. fa,~\p
    fa~fa

    %29
    R2.
    r4. fa~
    fa~fa~

    %32
    fa8 r4 r4.
    fa16(sol la8) sol fa mi4
    r4. sol~

    %35
    sol~sol~
    sol8 r4 r4.
    R2.*3

    %40
    r8 sol, sol' mi r mi
    dod r dod re4 r8
    sol la la, r4.

    %43
    R2.*5
    do4.~\parenthesize do~
    do~do

    %50
    do8 r do fa do4
    fa8 r fa sol r sol
    mi r mi fa r fa

    %53
    re r sib? do r mi
    fa r fa re r re
    sol4 la8 fa sol sol,\mbreak

    %56 OK
    do16 re mi re do32 (re mi fa sol la si do) do,16 re mi re do32 (re mi fa sol la si do)
    re,16 mi fa mi re32(mi fa sol la si do re) re,16 mi fa mi re32(mi fa sol la si do re)
    mi,16 fa sol fa mi32(fa sol la si do re mi) mi,16 fa sol fa mi32(fa sol la si do re mi)

    %59
    fa,16 sol la sol fa32(sol la si do re mi fa) fa,16 sol la sol fa32(sol la si do re mi fa)\mbreak
    mi,16 sol'32 fa mi16 re do si la sol la fa'32 mi re16 do si la sol fa
    fa mi fa8~fa32 re mi fa sol la si do fa,16 mi fa8~fa32 re mi fa sol la si do

    %62
    mi,16 do' si do re,8 si' do16 [si32(la sol fa mi re)] do4
    R1
    r2 do'16\p re mi re do32(re mi fa sol la si do)

    %65
    do,16\f re mi re do32(re mi fa sol la si do) re,16 do32(si la sol fa mi) re4~
    re16\p mi fad mi re32(mi fad sol la si do re) re,16\f mi fad mi re32(mi fad sol la si do re)
    re,8\p re' r4 re,16\f mi fad mi re32 mi fad sol la si do re\mbreak

    %68
    re,16\p mi fad mi re32 mi fad sol la si do re re,8\f re' \parenthesize r4
    sold,8\p sold'? r4 la,8\f la' r4
    mi,8\p do' fad, sold la16\f si do si la32 si do re mi fad sold la

    %71
    la,16\p si do si la32 si do re mi fad sold la re,16\f dod re8~re16 fa? mi re\mbreak
    la8 la'  \parenthesize si, \parenthesize si' la4 r
    re,,16\p mi fa mi re32 mi fa sol la si dod re re,16\f mi fa mi re32 mi fa sol la si dod re

    %74
    re,8 re' r4 do,16\f re mi re do?32 re mi fa sol la si do
    do,16\p re mi re do32 re mi fa sol la si do fad,8 re' r4\mbreak
    sol,16\f la si la sol32 la si do re mi fad sol sol,16\p la si la sol32 la si do re mi fad sol

    %77
    sol,8\f sol' r4 re,16\p mi fad mi re32 mi fad sol la si do re
    mi,8\f mi' r4 r2
    R1

    %80
    r2 sol,16 \f la si do sol32 (la si do re mi fad sol)
    sol,16 \p la si do sol32 (la si do re mi fad sol) do,16\f si do8 do16 mi re do
    si8 sol' la, fad' <sol si, re, sol,>4 r

    %83
    do,,16\p re mi re do32 re mi fa sol la si do do,16\f re mi re do32 re mi fa sol la si do
    do,8 do' r4 re,16\f mi fa mi re32(mi fa sol la si do re)
    re,16\p mi fa mi re32(mi fa sol la si do re) \once\stemUp re,8\f sol' r4

    %86
    mi,16\p fa sol fa mi32 fa sol la si do re mi mi,16\f fa sol fa mi32 fa sol la si do re mi
    \once\stemUp do,8\p mi' r4 fa,16\f sol la sol fa32(sol la si do re mi fa)\mbreak
    fa,16\p sol la sol fa32\parentSlur (sol la si do re mi fa) sol,8\f sol' r4

    %89
    R1*5
    do,,16\f re mi re do32 re mi fa sol la si do do,16\p re mi re do32 re mi fa sol la si do
    re,16\f mi fa mi re32\parentSlur (mi fa sol la si do re) re,16\p mi fa mi re32\parentSlur  (mi fa sol la si do re) \mbreak

    %96
    mi,16\f fa sol fa mi32 fa sol la si do re mi mi,16\p fa sol fa mi32 fa sol la si do re mi
    fa,16\f sol la sol fa32\parentSlur (sol la si do re mi fa) fa,16\p sol la sol fa32\parentSlur (sol la si do re mi fa)
    sol,16 sol'32\f fa mi16 re do si la sol la fa'32 mi re16 do si la sol fa

    %99
    fa mi fa8~fa32 re mi fa sol la si do fa,16 mi fa8~fa32 re mi fa sol la si do
    re,16 do' si do re,8 si' do,32 do' si la sol fa mi re do32 do' si la sol fa mi re
    do4 r8 r4.

    %102
    R2.*2
    <<{r8 sol'' \p sol la fa16(sol la8)
    la sol r r4.}\\{r8 mi mi fa re16(mi fa8)\f
                    fa [mi]}>>

    %106
    r8 sol\mf\tu sol16. fa64 sol la8 mi mi16.\tr re64 mi
    fa8 do do16.\tr si64 do sib4.~\mbreak
    sib16 sol32 la sib16 sol do sib la4.~

    %109
    la16 fa32 sol la16 fa sib la sol8 do4
    r8 r do~do16 si! si la re do
    si sol32 la si16 sol do8~do16[re] si8. do16\mbreak

    %112
    do8 mi16(re) re(do) do4 r8
    r8 sol16\p fa fa mi mi8 r r
    r8 do'4~do16 sib sib(la) re do

    %115
    si! sol32 la si16 sol do8~do16[re] si8. do16
    do4. r

}

IIvlan = \relative do' {

    R2.*26
    r4. fa~\p
    fa~fa

    %29
    R2.
    r4. fa~
    fa~fa~

    %32
    fa8 r4 r4.
    fa16(sol la8) sol fa mi4
    r4. sol~

    %35
    sol~sol~
    sol8 r4 r4.
    R2.*3

    %40
    r8 sol, sol' mi r mi
    dod r dod re4 r8
    sol la la, r4.

    %43
    R2.*5
    do4.~\parenthesize do~
    do~do

    %50
    do8 r do fa do4
    fa8 r fa sol r sol
    mi r mi fa r fa

    %53
    re r sib? do r mi
    fa r fa re r re
    sol4 la8 fa sol sol,\mbreak

    %56 OK
    mi'8 mi mi mi  mi mi mi do
    do do si si si si si re
    re re do do sol sol sol mi'

    %59
    mi mi re re la la la fa'
    fa fa mi sol~sol fa16 mi re8 re
    re re16 do si8 si si si re re

    %62
    re sol la re, mi4 r
    R1*7
    r4 r8 mi do do do do

    %71
    do mi4 la8 fad fad si si\mbreak
    mi, mi fa si, dod?4 r8 dod!
    re la'16 sol fa8 fa fa la la la

    %74
    la la sol sol sol sol16 fa mi8 mi
    mi sol16 fa mi8 do la4 r\mbreak
    re8 re16 do si8 si si re re re

    %77
    do4 r8 mi la, la si si
    sol4 r r2
    R1\mbreak

    %80
    r4 r8 la si [re16 do si8 si]
    si si re sol mi mi la la
    re, [re mi si16 re] re4 r

    %83
    R1*11
    mi8 mi mi mi mi mi mi do
    do do si si si si si re\mbreak

    %96
    re re do do sol sol sol mi'
    mi mi re re la la la fa'
    fa fa mi sol sol fa16 mi re8 re

    %99
    re re16 do si8 si si si re re\mbreak
    si sol' la re, mi4 r16 mi mi mi
    mi4 r8 r4.

    %102
    R2.*4
    r8 r mi do4  do8
    do r la' re, r re\mbreak

    %108
    do r do do r do
    re r re do r sol'
    do, r do re r re

    %111
    re4 do8 la' re, sol\mbreak
    sol4 r8 r4.
    r sol8 mi16 fa sol8

    %114
    do, r do re r re
    re4 do8 fa re8. do16
    do4. r

}

IIbcn = \relative do {

    fa4._\markup\italic"Senza Ripieni Bassi sempre"~ fa~
    fa~ fa~
    fa~ fa~

    %4
    fa \parentSlur (fa)~
    fa~fa~
    fa~fa~

    %7
    fa~fa~
    fa \parentSlur (fa)~
    fa8 r fa sol r sol

    %10
    mi r mi fa r fa
    re r sib do r mi\mbreak
    fa r fa re r re

    %13
    sol r la fa sol sol,
    do4.~do~
    do~do~\mbreak

    %16
    do~do~
    do~do~
    do~do~

    %19
    do~do~
    do~do~
    do8 r la sib r sib'

    %22
    sol r sol la r la
    fa r fa sol r sol\mbreak
    do,4.~do~

    %25
    do4 la8 sib sol do\breathe
    \tieUp fa,4.^\markup\italic"Organo senza Ripieni" ~fa~
    fa\breathe \tieNeutral fa'~

    %28
    fa~fa~\breathe
    fa_\markup\italic "orga[no]"~fa~
    fa~\breathe fa~

    %31
    fa fa~
    fa8 \breathe la_\markup\italic "orga[no]" sol fa4 mi8\breathe
    fa16(sol la8) sol fa mi4\breathe

    %34
    re^\markup\italic "orga[no]"  do8\breathe sol'4.~
    sol~sol~\mbreak
    sol8\breathe sol^\markup\italic "orga[no]"   fa mi la la,16 si

    %37
    dod la32 si dod16 la dod la re8 r re
    sol r sol la r la
    sib4 r8 sol la la,\mbreak

    %40
    re\breathe sol, sol' mi r mi
    dod r dod re4 r8
    sol la la,\breathe r16 re32 ^\markup\italic "orga[no]"  mi fa16 re mi fa

    %43
    sol8 sol, sol' si,16 sol32 la si16 sol la si\mbreak
    do8 r do' do, r mi
    fa r fa re r re

    %46
    si do fa sol r do,
    fa re sol si,? sol' sol,\breathe \mbreak
    do4.~\parenthesize do~

    %49
    do~do
    do8 r do fa do4
    fa8 r fa sol r sol\mbreak

    %52 OK
    mi r mi fa r fa
    re r sib? do r mi
    fa r fa re r re

    %55
    sol4 la8 fa sol sol,\mbreak
    do8_\markup\italic"Tutti Bassi" do do do do do do do
    sol' sol sol sol sol sol sol sol

    %58
    do, do do do do do do do
    re re re re re re re re\mbreak
    mi mi mi mi fa fa fa fa

    %61
    sol sol sol sol sol sol sol sol
    do mi, fa sol do, re mi do
    si^\p la si sol la16 la' sol fa mi8[do]\mbreak

    %64
    fa mi re sol do, do do do
    do do do do sol' sol, sol' sol,
    re' re re re re \breathe re'\f re re,\breathe

    %67
    sol\p sol, mi' do re re re re
    re\breathe re'\f re re,\breathe  mi^\p mi mi mi
    mi mi mi mi fa fad sol sold

    %70
    la do, re mi la,\breathe la'\f la  la,
    r la' la la, si si' sold sold\mbreak
    la do, re mi \breathe la^\p sol fa mi

    %73
    re\breathe re'^\f_\markup\italic"Rip[ieni]" re re, r re' re re,
    r sol sol sol, r do' do do,
    r do'\p do do, re re mi fad\mbreak

    %76
    sol\breathe sol\f sol sol, r sol' sol sol,\breathe
    do\p do do dod re dod si sol
    do? re mi do re fad sol do,

    %79
    si sol fad' re si' sol fad re\mbreak
    sol si, do re sol, \breathe sol'^\f_\markup\italic"R[ipieni]" sol sol,
    r sol' sol sol, la la' fad fad

    %82
    sol si, do re sol,\p sol'16 fa mi8[re]
    do\breathe do'^\f _\markup\italic"R[ipieni]" do do, r do' do do,\mbreak
    do' do, mi do r re'^\f re re,

    %85
    r re' re re, sol\p sol, si sol
    do\breathe  do'\f do do, r do' do do,\breathe
    do'\p do, mi do fa fa, fa' mi\mbreak

    %88
    re4 r8 re do do' si si,
    do do' re re, mi sol la fa
    sol fa sol sol, do4 r

    %91
    do16\f re mi re do32 re mi fa sol la si do do,16 re mi re do32 re mi fa sol la si do\mbreak
    mi,4 r8\breathe do\p re4 r8 si
    do la' fa sol mi la fa sol

    %94
    do,\f do do do do\p do do do
    sol'^\f sol sol sol sol\p sol sol sol\mbreak
    do,^\f do do do do\p do do do

    %97
    re^\f re re re re\p re re re
    mi^\f mi mi mi fa fa fa fa
    sol sol sol sol sol^\p sol sol sol\mbreak

    %100
    do_\markup\italic "orga[no]" mi, fa sol do,4 r16 do do do
    do4.^\markup\italic"Tutti Bassi"\p ~do\parentSlur (
    do)\parentSlur (do)

    %103
    \parentSlur (do)\parentSlur (do)\parentSlur (\mbreak
    do) \parentSlur (do)~
    do~do

    %106
    do8 r do fa do4
    fa8 r fa sol r sol\mbreak
    mi r mi fa r fa

    %109
    re r sib do r mi
    fa r fa re r re
    sol4 la8 fa sol sol,\mbreak

    %112
    do4.~do~
    do~do8 r mi
    fa r fa re r re

    %115
    sol4 la8 fa_\markup\italic"adag[io]" sol sol,
    do4. r

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s2.*25
   s4. <6 4>4 <5 3>8
   <6 4>16 <7>\bassFigureExtendersOn <7>4 <5 3>4.\bassFigureExtendersOff
   s2.
   s4. <6 4>4 <5 3>8
   <6 4>16 <7 2> s4 <5 3>4.
   s2.
   s8 <6> <6 _!> <6>4 <6>8
   s2.
   <5>4 <6!>8 <6 4>8 <5 3>4
   s2.
   s8 <_!>\bassFigureExtendersOn <_!> <7> <_+>4
   s2.
   s4 <_6 !>8 <7 _+> <7 _+>8 <7 _+> <5>4 <5>8 s <_+>4
   s2.*2
   s4. s4 <6+>8 <4> <_!> s <6>4 s8
   <4>8 s <3> s4.
   <9>8 s <8> s4.
   <6 5>4. <_!>
   s4 <_!>8 s <_!>4
   <3>2.
   s2.*7
   s1
   <5  4>
   <9>4 <8> s2
   <9>4 <8> s2
   <9>4 <8> <9>8 <8> s4
   <7>2 <7>4 <7>s <6> s2
   <6> <5>4 <6>8 s\bassFigureExtendersOff
   <6>8 <6> s4 s2
   s2 <4>8 <3> s4
   <6 4>8 <5 _+> \bassFigureExtendersOn <5 _+> <5 _+> s2\bassFigureExtendersOff
   s4 <5> <_+>2
   <_+> <7 _+>4 <6 4>
   <5 _+> <5 4> <6> <5>8 <6>
   s s <6 _+> <5 _+> s2
   s <5+>4 <6 5>
   s4 <6>8 <_+> <_+>4 <6>8 <6\\>
   <5 _->4 s s2
   s8 <5 4> s4 s8 <6> <6> <6>
   s2 <9 _+>8 <8> <7> <5>
   s1
   s2 <_+>4 <_!>
   <9> <6> <4>8 <6> s4
   <6>4 s8 <_+> s4 s8 <_+>
   s4 <6>8 <5 _+> s2
   s2 <5>
   s4 <6>8 <_+> s4 <6>8 <6>
   s1
   s2 s8 <5 3> s4
   s1
   s
   s2 s4 s8 <6>
   <6>4 s8 <6> s2
   s1
   <5 3>
   s1*4
   <7>4 <3> s2
   <9>4 <8> s2
   <9>4 <8> s2
   <9>4 <8> <9>8 <8> s4
   <7>2 \bassFigureExtendersOn <7>4 <7>\bassFigureExtendersOff
   s1
   s4. <6 4>4 <5 3>8
   <6 4>4 <7 3>8 <5>4.
   <6 4>4 <5 3>8 <6 4>8 <7 3>4
   <5>4. <6 4>
   <6 4>8 <5 3>4 <6 4>4.
   <6 4>8 s <5> s4.
   s <_->8 s <_->
   <5->\bassFigureExtendersOn <5-> s <9 3> s <8>
   <5> s <6> <5> s <6>
   s4. <7>8 s <6>
   <7>4 <5>8 <7> <5> s

}

forma = {

   \key fa\major
   \time 6/8
   %\override Staff.TimeSignature.style = #'single-digit
   \tempo 4. = 37
   s2.*55
   \bar "||"\break
   \mark\markup\huge"          [3.] Allegro forte"
   \time 4/4
   \tempo 2 = 38
   \key do\major
   s1*45\break
   \time 6/8
   \mark\markup\huge"          [4.] Larghetto"
   \tempo 4. = 37
   s2.*16
   \bar"|."

}

IItenore = {
   \new Voice = "dormi"
   %\notypeset
   \IIglobal
   <<\IItenoren\forma>>
}


IIrecI = {
   \IIglobal
   \clef violin
   <<\IIrecIn \forma>>
}


IIrecII = {
   \IIglobal
   \clef violin
   <<\IIrecIIn \forma>>
}


IIflI = {
   \IIglobal
   \clef violin
   <<\IIflIn \forma>>
}


IIflII = {
   \IIglobal
   \clef violin
   <<\IIflIIn \forma>>
}


IIvlI = {
   \IIglobal
   \clef violin
   <<\IIvlIn \forma>>
}


IIvla = {
   \IIglobal
   \clef alto
   <<\IIvlan \forma>>
}


IIbc = {
   \IIglobal
   \clef bass
   <<\IIbcn \forma \IIbfn>>
   \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion:     Il documento non è stato modificato.
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \markup\huge\bold\fill-line {"Mottetto per il Natale di N.S.J. [ZWV 172]"}
    \markup \fill-line{"  ""  ""J. D. Zelenka (1679-1745)"}

    \markup \huge {[1. Recitativo] Senza Flauti}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violin[o] 1"}
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino] 2"}
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key do\major\time 4/4  r4 do'^\markup \right-align"Tenore" }
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \Itenore
                \new Lyrics \lyricsto "proh" \Itesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.8
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

}



\bookpart {

    \paper  {

        systems-per-page = #2

    }

    \markup \huge {[2.] Larghetto e sempre piano}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"recorder"
                \set Staff.instrumentName = \markup  \center-column{"Flauto 1"}
                \IIrecI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"recorder"
                \set Staff.instrumentName = \markup  \center-column{"Flauto 2"}
                \IIrecII
            >>
            >>

            \new PianoStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Traversa 1"}
                \IIflI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"flute"
                \set Staff.instrumentName = \markup  \center-column{"Traversa 2"}
                \IIflII
            >>
            >>

            \new PianoStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"Violini"}
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Viole"}
                \IIvla
            >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef tenor \key fa\major\time 6/8\numericTimeSignature  r1.^\markup \right-align"Tenore" }
                \clef "treble_8"
                \set Staff.midiInstrument = #"voice oohs"
                \IItenore
                \new Lyrics \lyricsto "dormi" \IItesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"church organ"
                \set Staff.instrumentName = \markup  \center-column{"Organo""Bassi"}
                \IIbc
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.8
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.8
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

}