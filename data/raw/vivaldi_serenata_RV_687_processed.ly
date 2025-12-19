\language "italiano"
	%********************************** VARIABILI

\version "2.24.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

tr = \trill

unis = _\markup\italic "Unisoni"

arco = _\markup \italic "arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzic."

soli = ^\markup \italic { Soli}

dolce = _\markup \italic { dolce }

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

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

pratu = ^\markup \override #'(baseline-skip . 1) {
    \halign #-0
    \center-column {
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}
mbreak = { }


Ialton = \relative do' {

   \autoBeamOff

   do8 do fa fa16 sol la8 la r4
   la8 la la la16 sol sol8 sol r4
   sol8 sol sol la16 sib\mbreak mi,8 mi r16 sol sib la

   %4
   la8 la r4 la8 fa16 fa fa8 mi
   mi mi r16 mi mi fad\mbreak sold8 sold r si
   sold sold fad mi la la r la

   %7
   mi mi fa sol dod, dod r4\mbreak
   mi8 mi mi mi16 fa sol8 sol fa mi
   fa fa r16 la sol la sib8 sib r4\mbreak

   %10
   sol8 sol16 sol sol8 fa re re r4\fermata

}

ItestoII = \lyricmode {

   Dal -- l’ec -- celsa _ mia Reggia _
   ove _ splende _ d’in -- torno _
   di virtù_e _ di gran -- dezza _ il primo _ vanto, _
   scendo_ed _ in questo _ giorno _
   che d’Ime - neo _ sfa -- vil -- lerà _ la face, _
   al genio _ sem -- pre_au -- gusto _
   del gran Re che la Senna _ ogn’or  o -- nora _ 
   ap -- plausi_e _ voti _ offre _ la Glo -- ria_an -- cora. _

}

Ibcn = \relative do {

   fa1~
   fa2 do~
   do1

   %4
   fa
   sold,2 re'~
   re do~

   %7
   do sol'~
   sol la,
   re sol,~

   %10
   sol la4 re,

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 55
   s1*10
   \bar "|."

}

Ialto = {
   \new Voice = "reggia"
   <<\Ialton \forma>>
}

Ibc = {
   \clef bass
   <<\Ibcn \forma \Ibfn>>
}





IIvlIn = \relative do'' {

   fa,16 fa8 fa16 fa fa8 fa16 do' do8 do16 do do8 do16
   fa fa8 fa16 fa fa8 fa16 mi32 fa sol fa mi re do sib mi fa sol fa mi re do sib
   la16 sol fa8 r la sol32(la si16) si32[(do re16)] re32(mi fa16)] fa32[(mi re16)]

   %4
   mi32 fa sol16 sol32[fa mi16] mi32[re do16] sib?32 la sol16 fa32[sol la16] la32 sib do16 do32[re mib16] mib32 re do16\mbreak
   re32 mi fa16 fa32[mi re16] re32 do sib16 sib32[la sol16] do,32 re mi16 mi32[fa sol16] sol32 la sib16 sib32[la sol16]
   la la8 fa16 do' do8 do16 fa16 mi32 re do16 sib mi sol,8 mi'16

   %7
   fa mi32 re do16 sib mi sol,8 mi'16  fa mi32 re do16 sib la[sol32 fa] sib,16 do
   fa4 do'8\p do do do do do
   do do sib sib sib sib sib sib

   %10
   la la do fa, mi16 mi8\tr do16 sol' sol8\tr fa32 mi
   fa16 fa8\tr re16 la' la8\tr sol32 fa sol16 sol8\tr mi16 sib' sib8\tr la32 sol
   la16 la8\tr fa16 do' do8\tr si32 la si do re16 re32[do si16]si32 la sol16 fa32[mi re16]

   %13
   mi mi8\tr do16 sol' sol8\tr mi16\mbreak la la8\tr fa16 si si8\tr sol16
   do si32 la sol16 fa mi8 re  do16\f do8 do16 sol' sol8 sol16
   do do8 do16 si32 do re do si la sol fa sol'16 fa32 mi re16 do re sol,8 si16

   %16
   sol' fa32 mi re16 do re sol,8 si16 do sol do,8 sol'\p sol
   sol sol sol sol sol sol fa fa\mbreak
   fa fa fa fa mi sol sol sol

   %19
   sol sol sol sol fa fa fa sib
   mi,32(fa sol16) sol32[(la sib16)] sib32( do re16) re32[(do sib16)] la la8 la16 do32[sib la16] la32 sol fa16
   sol sol8 sol16  sib32 la sol16  sol32[fa mi16] fa fa8 fa16 la32 sol fa16 fa32[mi re16]

   %22
   mi mi8 do16 sol' sol8 mi16 sib' sib8 sol16 re'32 do sib16 sib32[la sol16]\mbreak
   la si8 do16 do, do8 do16 la' si8 do16 do, do8 do16
   la' sol32 fa do'16 fa, sol8. fa16 fa4 r8 la16 fa

   %25
   mi32 [fa sol16 sol sol] fa32[sol la16 la la] sol32[la sib16 sib sib] la32[sib do16 do do]
   sib32[la sol16] la32[sol fa16] sol8. fa16 fa\f fa8 fa16 do' do8 do16
   fa fa8 fa16 mi32 fa sol fa mi re do sib la8 fa r la

   %28
   sol32(la sib16) sib32[(do re16)] re32(mi fa16) fa32[(mi re16)]\mbreak mi32 fa sol16 sol32[fa mi16] mi32 re do16 sib32[la sol16]
   la la8 fa16 do' do8 do16 fa mi32 re do16 sib la sol32 fa sib,16[do]
   fa4\fermata la8\p la la la la la

   %31
   sib sib sib sib dod, dod dod la'
   la la la la\mbreak sib sib sib lab
   sol16 sol8 sol16 sol32[la sib16] do32[re mib16] fa, fa8 fa16 fa32[sol la16] sib32[do re16]

   %34
   mib, mib8 mib16 mib32[fa sol16] la32[sib do16] re, [re8 mib16] fa [fa8 sol16]
   \terzine\con \tuplet 3/2 { la[sol fa] } re' sib la8.\tr sib16 sib8 sib sib sib
   sol sol sol sol\mbreak fad16[fad8 re'16] fad,[fad8 la16]

   %37
   sol[sol8 re'16] sol,[sol8 sib16] la[la8 re16] la[la8 re16]
   sib8 la16 sol fad8.\tr sol16 sol2\fermata
   fa16 fa8 fa16 fa fa8 fa16 re' re8 re16 re re8 re16

   %40
   sol sol8 sol16 sol sol8 sol16 mi32 fa sol fa mi re do sib mi fa sol fa mi re do sib
   la8 fa r la fa'16 fa8 fa16 mi sol,8 mi'16
   fa fa8 fa16 mi sol,8 mi'16 fa re do sib la fa sib, do

   %43
   fa4

}

IIvlIIn = \relative do'' {

   fa,16 fa8 fa16 fa fa8 fa16 do' do8 do16 do do8 do16
   fa fa8 fa16 fa fa8 fa16 mi32 fa sol fa mi re do sib mi fa sol fa mi re do sib
   la16 sol fa8 r la sol32(la si16) si32[(do re16)] re32(mi fa16)] fa32[(mi re16)]

   %4
   mi32 fa sol16 sol32[fa mi16] mi32[re do16] sib?32 la sol16 fa32[sol la16] la32 sib do16 do32[re mib16] mib32 re do16\mbreak
   re32 mi fa16 fa32[mi re16] re32 do sib16 sib32[la sol16] do,32 re mi16 mi32[fa sol16] sol32 la sib16 sib32[la sol16]
   la la8 fa16 do' do8 do16 fa16 mi32 re do16 sib mi sol,8 mi'16

   %7
   fa mi32 re do16 sib mi sol,8 mi'16  fa mi32 re do16 sib la[sol32 fa] sib,16 do
   fa4 la8\p la sol sol sol sol\mbreak
   fa fa fa fa mi mi mi mi

   %10
   do do la' la do,16 do8\parenthesize \tr do16 mi mi8\tr re32 do
   re16 re8\parenthesize \tr re16 fa fa8\tr mi32 re mi16 mi8\parenthesize \tr mi16 sol sol8\tr fa32 mi
   fa16 fa8\parenthesize \tr fa16 la la8\tr sol32 fa re8 re re re

   %13
   do16 do8\parenthesize \tr sol16 mi' mi8\parenthesize \tr do16\mbreak do' do8\tr la16 re re8\tr si16
   mi8 do,4 si8 do16\f do8 do16 sol' sol8 sol16
   do do8 do16 si32 do re do si la sol fa sol'16 fa32 mi re16 do re sol,8 si16

   %16
   sol' fa32 mi re16 do re sol,8 si16 do sol do,8 mi\p mi
   re re re re do do do do\mbreak
   si si re sol sol sol sol sol

   %19
   la la la la la la la fa
   sol sol sol sol la la la la
   sol sol sol sol fa fa fa fa

   %22
   sol16 sol8 mi16 mi mi8 do16 sol' sol8 mi16 sib' sol8 mi16\mbreak
   fa sol8 la16 mi mi8 mi16 fa sol8 la16 mi mi8 mi16
   do8 do mi mi do do la' la

   %25
   sol[(mi)] la(fa) sib[(sol)] do(la)
   sol fa mi4\fermata fa16\f fa8 fa16 do' do8 do16
   fa fa8 fa16 mi32 fa sol fa mi re do sib la8 fa r la

   %28
   sol32(la sib16) sib32[(do re16)] re32(mi fa16) fa32[(mi re16)]\mbreak mi32 fa sol16 sol32[fa mi16] mi32 re do16 sib32[la sol16]
   la la8 fa16 do' do8 do16 fa mi32 re do16 sib la sol32 fa sib,16[do]
   fa4\fermata fa8\p fa mi mi mi mi

   %31
   fa fa fa fa sol sol sol sol
   fa fa fa fa\mbreak fa fa sib sib
   sib sib do do do do sib sib

   %34
   sib sib la la fa fa re' re
   do sib la fa re fa fa fa
   mi mi mi do'\mbreak la16 la8 la16 la la8 do16

   %37
   sib sib8 sib16 sib sib8 sol16 fad fad8 fad16 fad fad8 fad16
   sol re' do sib la8.\tr sol16 sol2\tr
   fa16 fa8 fa16 fa fa8 fa16 re' re8 re16 re re8 re16

   %40
   sol sol8 sol16 sol sol8 sol16 mi32 fa sol fa mi re do sib mi fa sol fa mi re do sib
   la8 fa r la fa'16 fa8 fa16 mi sol,8 mi'16
   fa fa8 fa16 mi sol,8 mi'16 fa re do sib la fa sib, do

   %43
   fa4

}

IIvlan = \relative do' {

   la8 la la la sol sol sol sol
   fa fa fa fa sol sol mi' mi
   do do do do re re re re

   %4
   sol, sol sol' sol do, do do do\mbreak
   re re re re sol, sol mi' mi
   do do sol' sol fa fa sol sol

   %7
   fa fa sol sol fa sol do,sib16 do
   fa,4 fa'8\p fa mi mi mi mi\mbreak
   re re re re do do do do

   %10
   fa, fa fa fa do' do do do
   re re re re mi mi mi mi
   fa fa fa fa sol, sol sol sol

   %13
   do do do do\mbreak fa, fa fa fa
   mi fa sol sol mi'\f mi re re
   do do re re mi mi si[re]

   %16
   mi mi si[re] mi4 do8\p do
   si si si si la la la la\mbreak
   sol sol sol sol do do do do

   %19
   dod dod dod dod re re re re
   do? do do do fa fa fa fa
   mi mi mi mi re re re re

   %22
   do do do do do do do do\mbreak
   do do do do do do do do
   fa, fa do'[do] fa, fa fa fa

   %25
   do' do re re mi mi fa fa
   do do do4\fermata la8\f la sol sol
   fa fa sol mi' do do do do

   %28
   re re re re\mbreak sol, sol sol mi'
   do do sol' sol fa sol do, sib16 do
   fa,4\fermata re'8\p re do do do do

   %31
   sib sib sib sib la la la dod
   re re re re\mbreak re re re re
   mib mib mib mib re re re re

   %34
   do do do do sib sib sib sib
   fa' sib, fa' fa, sib sib sib sib
   do do do do\mbreak re re re re

   %37
   re re re re re re re re
   re re re re sol,2\fermata
   fa16 fa8 fa16 fa fa8 fa16 re' re8 re16 re re8 re16

   %40
   sol sol8 sol16 sol sol8 sol16 mi32 fa sol fa mi re do sib mi fa sol fa mi re do sib
   la8 fa r la fa'16 fa8 fa16 mi sol,8 mi'16
   fa fa8 fa16 mi sol,8 mi'16 fa re do sib la fa \parenthesize sib \parenthesize do

   %43
   fa,4

}

IIalton = \relative do' {

   \autoBeamOff

   R1*7
   r4 fa16[sol] la[sib] do8 do do16[la] sib sol\mbreak
   fa[mi] fa8 fa fa sib sib sib la16[sol]

   %10
   la[sol] fa8 do' fa, mi16 [mi8\tr do16] sol' [sol8\tr fa32 mi]
   fa16 [fa8\tr re16] la' [la8\tr sol32 fa] sol16 [sol8\tr mi16] sib' [sib8\tr la32 sol]
   la16 [la8\tr fa16] do' [do8\tr si32 la] si [do re16] re32[do si16] si32 [la sol16] fa32[mi re16]

   %13
   mi [mi8\tr do16] sol' [sol8\tr mi16]\mbreak la [la8\tr fa16] si [si8\tr sol16]
   do [si32 la sol16] fa mi8 re do4 r
   R1

   %16
   r2 r4 do16[re] mi[fa]
   sol8 sol sol16[mi] fa re do8 do do' la\mbreak
   fa fa fa mi16[re] mi[re] do8 do do

   %19
   sol' sol sol fa16[mi] fa[mi] re8 r fa16 sib
   mi,32 [fa sol16] sol32[la sib16] sib32[do re16] re32[do sib16] la [la8 la16] do32[sib la16] la32 [sol fa16]
   sol [sol8 sol16]  sib32 [la sol16]  sol32[fa mi16] fa [fa8 fa16] la32[ sol fa16] fa32[mi re16]

   %22
   mi [mi8 do16] sol' [sol8 mi16] sib' [sib8 sol16] re'32 [do sib16] sib32[la sol16]\mbreak
   la [si8 do16] do, [do8 do16] la' [si8 do16] do, [do8 do16]
   la' [sol32 fa do'16] fa, sol8. fa16 fa4 r8 la16 fa

   %25
   mi32 [fa sol16 sol sol] fa32[sol la16 la la] sol32[la sib16 sib sib] la32[sib do16 do do]
   sib32[la sol16] la32[sol fa16] sol8. fa16 fa4 r
   R1*3

   %30
   r4 re16[mi] fa[sol] la8 la la sib16[do]
   re8 re, re re mi sib' la16[sol] fa[mi]
   fa[mi] re8 r la'16 fa\mbreak sib8 sib sib lab

   %33
   sol16 [sol8 sol16] sol32[la sib16] do32[re mib16] fa, [fa8 fa16] fa32[sol la16] sib32[do re16]
   mib, [mib8 mib16] mib32[fa sol16] la32[sib do16] re, [re8 mib16] fa [fa8 sol16]
   \terzine\con \tuplet 3/2 { la[sol fa] } re' sib la8.\tr sib16 sib4 r8 sib16 re\mbreak

   %36
   mib,8 mib do'16[sib] la[sol]\mbreak fad[fad8 re'16] fad,[fad8 la16]
   sol[sol8 re'16] sol,[sol8 sib16] la[la8 re16] la[la8 re16]
   sib8 la16 [sol] fad8.\tr sol16 sol2\fermata

   %39
   R1*4
   r4

}

IItestoII = \lyricmode {


   Al -- l’a -- mene _ fran __ che_a --  re -- ne, o
   gran Re vien _ la tua sposa _
   tut -- ta_af -- fet - - - - - - - - - - - - - - - - to_e tutta _ fé.
   
   Al -- l’a -- mene _ fran -- che_a --  re -- ne, o
   gran Re vien _ la tua spo -- sa_o gran Re vien _ la tua sposa _
   tut -- ta_af -- fet - - - - - - - - - - - - - - - - - - - - - - - to_e tutta _ fé,
   tut -- ta_af -- fet - - - to_e tutta _ fé.
    
   Vedrò _ ben con piacer _ mio _
   se pur bello _ è quel desio _ 
   che per me sarà _  fe -- del - - - - - - - - - - - - fe -- del 
   per me che per me sarà _  fe -- del - - - - - - fe -- del 
   per me.

}

IIbcn = \relative do {

   fa8 fa fa fa mi mi mi mi
   re re re re do do do do
   fa fa fa fa si, si si si

   %4
   do do do mi fa fa fa fa\mbreak
   sib,? sib sib sib do do do do
   fa fa mi mi re re do do

   %7
   re re do do re mi fa16 fa, sib do
   fa,4 r r2\mbreak
   R1*5

   %14
   r2 do'8 do si si
   la la sol sol do do sol' sol,
   do do sol' sol, do4 r

   %17
   R1*9
   r2 fa8 fa mi mi
   re re do do fa fa fa fa

   %28
   si, si si si\mbreak do do do do
   fa fa mi mi re mi fa16 fa, sib do
   fa,4\fermata r r2

   %31
   R1*7
   R1\fermata
   fa'8 fa fa fa mi mi mi mi

   %40
   re re re re do do do do
   fa fa fa fa re re do do
   re re do do re [mi fa sib,16 do]

   %43
   fa,4

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key fa\major
   \tempo 4 = 55
   s1*7
   s4
   \bar "||"
   \mark\markup \segno
   s2.
   s1*30
   \bar "||"
   s1*4
   \set Score.measureLength = #(ly:make-moment 1 4) s4
   \bar "||"
   \mark \markup\center-column {"Dal" \segno}

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

IIalto = {
   \new Voice = "arene"
   <<\IIalton \forma>>
}

IIbc = {
   \clef bass
   <<\IIbcn \forma \IIbfn>>
}




IIIsopranon = \relative do'' {

   \autoBeamOff

   mi,8 mi 16 mi la8 si do do do si16 la
   sold8 sold r do la la r4\mbreak
   la8 mi r do'16 si si8 si r re

   %4
   sol, sol sol la fa fa r16 re re mi
   fa8 fa r re'\mbreak si si la sol
   do do r do sol sol sol la

   %7
   sib sib sib la fa fa r4\mbreak
   do'8 re mib mib16 re sib 8 sib r4
   sib? r16 sib lab sib sol8 sol r4

   %10
   mib'8 la,16 la la8 sib\mbreak fa fa r4\fermata

}

IIItestoI = \lyricmode {

   Or del po -- lono _ cielo _
   beltà _ più rara _ e grande _
   vieni, _ accon - senti _ e vogli _ ch’io ti vegga _
   col gran Lu -- igi _ a casto _ no -- do_av -- vinta; _
   al ta -- lamo _ re -- a -- le_io ti son guida, _
   egli _ lieto _ t’at --  tende: _
   già all’ amor _ tuo _ an --  ch’il suo_a -- mor si rende. _

}

IIIbcn = \relative do {

   la1
   re2 do~
   do fa
   si,1
   sol2~sol
   mi'~mi
   do fa~
   fa sib,~
   sib mib~
   mib fa4 sib,\fermata

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 55
   s1*10
   \bar "|."

}

IIIsoprano = {
   \new Voice = "cielo"
   <<\IIIsopranon \forma>>
}

IIIbc = {
   \clef bass
   <<\IIIbcn \forma \IIIbfn>>
}





IVvlIn = \relative do'' {

   r4 sol~
   sol8[fa16 mib fa8 re]
   mib do do'4~

   %4
   do8[re16 mib re8 do]
   si sol r sol
   mib'[mib mib sol,]

   %7
   lab16 fa lab8~lab16 do re8~
   re16[mib re do sib lab sol fa]
   sol mib sol8~sol16 sib do8~

   %10
   do16[re do sib lab sol fa mib]
   fa8 re sib'4~
   sib8[lab16 sol do8 re]

   %13
   mib mib, sib'4~\mbreak
   sib8 lab16 sol do8 re
   mib re16 do sib lab sol fa

   %16
   sol8 fa16 mib fa8 mib16 re
   mib2
   r4 sol\p~

   %19
   sol8 fa16 mib fa8 re
   mib do do'4~
   do8 re16 mib re8 do

   %22
   si sol r sol
   mib' [mib mib sol,]\mbreak  %% fine prima pagina
   lab16 fa lab8~lab16 do re8~

   %25
   re16[mib re do sib lab sol fa]
   sol mib sol8~sol16 sib do8~
   do16[re do sib lab sol fa mib]

   %28
   fa re re'8~re16 do sib lab
   sol8 mib sib'4~
   sib8 [lab16 sol do8 re]

   %31
   mib mib, sib'4~
   sib8 [lab16 sol lab sib do re]
   mib8 mib, r lab\mbreak

   %34
   sol8 do sib16 lab sol fa
   mib4 mib'~\f
   mib8[re16 do re8 sib]

   %37
   sol mib sol'4~
   sol8[fa16 mib fa8 re]
   mib16 sib sol'8~sol16 mib fa re

   %40
   mib16 sib sol'8~sol16 mib fa re
   mib8[sol, fa re']
   mib4 sol,\p~

   %43
   sol8[fa16 mib sol8 la?]
   sib sib, lab'4~
   lab8[sol16 fa la8 si]

   %46
   do do, do'4~
   do8[re16 mib re8 do]
   si sol r sol

   %49
   do, [do' mib sol,]
   lab fa~ fa16 lab sol fa
   re'8 sib~sib16 lab sol fa

   %52
   sol8 mib~mib16 sol fa mib
   do'8 lab~lab16 sol fa mib
   fa8 re~re16 fa mib re\mbreak

   %55
   si'[do re do si la? sol fa]
   mib8 do r sol'
   fad mib' re16 do si la

   %58
   si8 la16 sol lab8 sol16 fa
   sol8 fa16 mib fa8 mib16 re
   mib8 do sol'4~

   %61
   sol8 fa16 mib fa8 mib16 re
   mib8 do sol'4~
   sol8[la?16 si do8 re]

   %64
   mib do r lab\mbreak
   sol [do mib, re]
   do4 r8 do'

   %67
   re[sol, sol sol]
   do fa,~fa16 lab sol fa
   sib8 mib,~mib16 sol fa mib

   %70
   lab8 re,~re16 fa mib re
   mib8 re16 do lab'4
   sol8 fa16 mib fa8 mib16 re

   %73
   mib8 do lab'4
   sol8 fa16 mib fa8 mib16 re
   mib8 [sol do fa,]\mbreak

   %76
   mib do' re do16 si
   do4 sol\f~
   sol8[fa16 mib fa8 re]

   %79
   mib do do'4~
   do8[re16 mib re8 do]
   si sol r do

   %82
   re[sol, sol sol]
   do fa,~fa16 lab sol fa
   sib8[mib, mib mib]

   %85
   lab re,~re16 fa mib re
   mib8 do lab'4
   sol8 fa16 mib fa8 mib16 re\mbreak

   %88
   mib8[do' re si]
   do4\fermata sol8\p mib
   sib' sib sib do16 re

   %91
   mib8 mib, sib' lab16 sol
   lab8[fa re lab']
   lab? sol mib16 fa sol lab!

   %94
   sib8[do16 re mib8 fa]
   re sib r4
   mib, sol8 lab\mbreak

   %97
   sib4 mib,
   reb' reb8 reb
   reb?4 do

   %100
   mib mib8 mib
   mib4 re
   sib4. lab16 sol

   %103
   do4. sib16 lab
   re4. do16 sib
   mib4 mib,

   %106
   sol mib\mbreak
   sib' sol
   r8 do[sol fa]

   %109
   mib4 r
   sib'4. la16 sol
   fad8 mi16 re do'8 sib16 la

   %112
   sib8 la16 sol mib'4
   re8 do16 sib do8 sib16 la
   sib8 sol mib'4

   %115
   re8 do16 sib do8 sib16 la
   sib8 sol r4\mbreak
   mib do

   %118
   fad re
   r8 do'[sib la]
   sib4. la16 sol

   %121
   fad4. mi16 re
   do'4. sib16 la
   sib8[sol la fad]

   %124
   sol2\fermata

}

IVvlIIn = \relative do'' {

   mib,8[mib mib mib]
   re[re re re]
   do[mib sol sol]

   %4
   lab[lab la la]
   sol[sol si si]
   do[do do do]

   %7
   do[do lab lab]
   lab?[lab lab lab]
   sol[sol sol sol]

   %10
   sol[sol sol sol]
   fa[fa fa fa]
   sol[sol mib fa]

   %13
   sol[sol fa fa]\mbreak
   sol[sol mib fa]
   sol[fa fa fa]

   %16
   mib[mib re re]
   sib2
   mib8\p[mib mib mib]

   %19
   re[re re re]
   do[mib sol sol]
   lab[lab la la]

   %22
   sol[sol si si]
   do[do do do]
   do[do lab lab]

   %25
   lab?[lab lab lab]
   sol[sol sol sol]
   sol[sol sol sol]

   %28
   fa[fa fa fa]
   sol[sol fa fa]
   sol[sol mib fa]

   %31
   sol[sol fa fa]
   sol[sol fa fa]
   sol[sol fa fa]\mbreak

   %34
   sol[mib re re]
   mib mib sol\f sol
   fa[fa fa fa]

   %37
   mib[mib mib' mib]
   mib[mib re re]
   sib[mib mib re]

   %40
   sib[mib mib re]
   sib[mib, re sib']
   sol [sol mib\p mib]

   %43
   mib[mib mib fa]
   fa[fa fa fa]\mbreak
   fa[fa fa sol]

   %46
   sol[sol sol sol]
   lab[lab la la]
   sol[sol re' re]

   %49
   mib[mib mib mib]
   mib[mib mib mib]
   re[re re re]

   %52
   re[re re re]
   do[do do do]
   do[do do do]\mbreak

   %55
   si[si si si]
   sol[sol do do]
   do[do do fad,]

   %58
   sol[re fa? re]
   mib[do re si]
   do[sol mib' mib]

   %61
   mib[do re si]
   do sol si' si
   si?[si si si]

   %64
   do[do fa, fa]\mbreak
   mib[do do si]
   do[do sol' sol]

   %67
   lab[sol sol sol]
   sol[fa fa fa]
   fa[mib mib mib]

   %70
   mib[re re re]
   mib[mib fa fa]
   mib[mib re re]

   %73
   do[do fa fa]
   mib [mib re re]
   do[do do re]\mbreak  %%% metà p.13

   %76
   do[mib re re]
   mib\f[mib mib mib]
   re[re re re]

   %79
   do[mib sol sol]
   lab[lab la la]
   sol[sol sol sol]

   %82
   lab]re re re]
   sol,[do do do]
   fa,[sib sib sib]

   %85
   mib,[lab sol sol]
   sol[sol fa fa]
   mib[mib re re]\mbreak

   %88
   do[mib fa re]
   mib4\fermata sib'8\p sib
   sib[sib sib sib]

   %91
   sol[sol sol sib]
   lab[lab lab fa]
   mib[mib sol sol]

   %94
   fa[fa mib do']
   sib[sib sib sib]
   mib,[mib mib mib]\mbreak

   %97
   mib[mib mib mib]
   mib[mib mib mib]
   mib[mib mib mib]

   %100
   mib[mib mib mib]
   fa[fa fa fa]
   fa[fa fa fa]

   %103
   sol[sol sol sol]
   mib[mib mib mib]
   fa[fa fa fa]

   %106
   sol[sol sol sol]\mbreak
   sol[sol sol sol]
   mib[mib mib re]

   %109
   mib[sol sol sol]
   sol[sol sib sib]
   re[fad, fad fad]

   %112
   sol[sib do do]
   sib[sol la re,]
   sol[re do' do]

   %115
   sib[sol la re,]
   sol[re sib' sib]\mbreak
   mib,[mib mib sol]

   %118
   fad[fad fad fad]
   fad?[fad fad fad]
   sol[sol sol sol]

   %121
   la[la la la]
   la[la la la]
   sol[sib do la]

   %124
   sib2\fermata

}

IVvlan = \relative do' {

   sol8 [sol sol sol]
   sol[sol sol sol]
   sol[sol mib' mib]

   %4
   mib[mib la,! la]
   re[re re si]
   sol[sol mib' mib]

   %7
   mib[mib mib mib]
   re[re re re]
   re[re re re]

   %10
   do[do do mib]
   sib[sib sib sib]
   sib[sib do sib]

   %13
   sib[sib sib sib]\mbreak
   sib[sib do sib]
   sib[do re re]

   %16
   sib[sib sib sib]
   sol2
   sol8\p [sol sol sol]

   %19
   sol[sol sol sol]
   sol[sol mib' mib]
   mib[mib la,! la]

   %22
   re[re re si]
   sol[sol mib' mib]
   mib[mib mib mib]

   %25
   re[re re re]
   re[re re re]
   do[do do do]

   %28
   re[re re re]
   sib[sib sib sib]
   sib[sib do sib]

   %31
   sib[sib sib sib]
   sib[sib do do]
   sib[sib re re]\mbreak

   %34
   sib[do re sib]
   sol[sol sib\f sib]
   sib[sib sib sib]

   %37
   sib[sib sib sib]
   sib[sib sib' sib]
   sol[sib sib sib]

   %40
   sol[sib sib sib]
   sol[sib, sib sib]
   sib sib sib\p sib

   %43
   sib[sib sib do]
   re[re do do]\mbreak
   do[do do re]

   %46
   mib[mib mib mib]
   mib[mib la,! la]
   re[re sol sol]

   %49
   sol[sol sol mib]
   lab[lab lab lab]
   lab?[lab lab lab]

   %52
   sol[sol sol sol]
   sol[sol sol sol]
   fa[fa fa fa]\mbreak

   %55
   fa[fa fa re]
   mib[mib sol mib]
   la,[la la re]

   %58
   re[si re sol,]
   sol[sol sol sol]
   sol[sol sol sol]

   %61
   sol[sol sol sol]
   sol[sol re' re]
   re[re re si]

   %64
   sol[sol re' re]\mbreak
   sol,[sol sol sol]
   sol[sol mib'mib]

   %67
   re[re re re]
   do[do do do]
   sib[sib sib sib]

   %70
   lab[lab lab lab]
   sol[sol do do]
   do [mib si si]

   %73
   sol[sol do do]
   do [mib si si]
   sol[sol sol sol]\mbreak

   %76
   sol[sol lab sol]
   sol\f[sol sol sol]
   sol[sol sol sol]

   %79
   sol[sol mib' mib]
   mib[mib la,! la]
   re[re mib mib]

   %82
   mib[mib la, la]
   re[re mib mib]
   fa[sol sol sol]

   %85
   mib[fa fa fa]
   re[mib mib mib]
   do[re re si]\mbreak

   %88
   sol[sol lab sol]
   sol4\fermata sol'8\p sol
   fa[fa fa fa]

   %91
   mib[mib mib sol]
   fa[fa fa re]
   sib[sib sib sib]

   %94
   re[re sol fa]
   fa[fa re re]
   sib[sib sib sib]\mbreak

   %97
   sib[sib sib sib]
   sib[sib sib sib]
   sib[sib sib sib]

   %100
   mib[mib mib mib]
   do[do do do]
   fa[fa fa fa]

   %103
   mib[mib mib mib]
   do[do do do]
   sib[sib sib sib]

   %106
   sib[sib sib sib]\mbreak
   sib[sib sib sib]
   do[do sib sib]

   %109
   sib[sib sib sib]
   sol[sol sol sol]
   la[la la la]

   %112
   sol[sol sol sol]
   sol[sol sol sol]
   sol[sol sol sol]

   %115
   sol[sol sol sol]
   sol[sol sol sol]\mbreak
   sol[sol sol do]

   %118
   la[la la la]
   la[la la la]
   mi'[mi mi mi]

   %121
   re[re re re]
   re[re re re]
   re[re mib re]

   %124
   re2\fermata

}

IVsopranon = \relative do'' {

   \autoBeamOff

   R2*17
   r4 sol~

   %19
   sol8 fa16 mib fa8 re
   mib do do'4~
   do8 re16 mib re8 do

   %22
   si sol r sol
   mib' mib mib sol,\mbreak  %% fine prima pagina
   lab16 [fa lab8]~lab16 [do re8]~

   %25
   re16[mib re do sib lab sol fa]
   sol [mib sol8]~sol16 [sib do8]~
   do16[re do sib lab sol fa mib]

   %28
   fa [re re'8]~re16 [do sib lab]
   sol8  [mib] sib'4~
   sib8 [lab16 sol do8 re]

   %31
   mib [mib,] sib'4~
   sib8 [lab16 sol lab sib do re]
   mib8 mib, r lab\mbreak

   %34
   sol8 do sib16 [lab] sol [fa]
   mib4 r
   R2*6
   r4 sol\p~

   %43
   sol8 fa16 mib sol8 la?
   sib sib, lab'4~
   lab8 sol16 fa la8 si

   %46
   do do, do'4~
   do8 re16 mib re8 do
   si sol r sol

   %49
   do, do' mib sol,
   lab [fa]~ fa16 [lab sol fa]
   re'8 [sib]~sib16 [lab sol fa]

   %52
   sol8 [mib]~mib16 [sol fa mib]
   do'8 [lab]~lab16 [sol fa mib]
   fa8 [re]~re16 [fa mib re]\mbreak

   %55
   si'[do re do si la? sol fa]
   mib8 do r sol'
   fad mib' re16 [do] si [la]

   %58
   si8 [la16 sol] lab8 [sol16 fa]
   sol8 [fa16 mib] fa8 [mib16 re]
   mib8 [do] sol'4~

   %61
   sol8 [fa16 mib] fa8 [mib16 re]
   mib8 [do] sol'4~
   sol8[la?16 si do8 re]

   %64
   mib do r lab\mbreak
   sol do mib, re
   do4 r8 do'

   %67
   re sol, sol sol
   do [fa,]~fa16 [lab sol fa]
   sib8 [mib,]~mib16 [sol fa mib]

   %70
   lab8 [re,]~re16 [fa mib re]
   mib8 [re16 do] lab'4
   sol8 [fa16 mib] fa8 [mib16 re]

   %73
   mib8 [do] lab'4
   sol8 [fa16 mib] fa8 [mib16 re]
   mib8 [sol] do fa,\mbreak

   %76
   mib do' re do16 [si]
   do4 r
   R2*11

   %89
   r4 sol8 mib
   sib' sib sib do16 re

   %91
   mib8 mib, sib' lab16 [sol]
   lab8 fa re lab'
   lab? sol mib16 [fa] sol [lab!]

   %94
   sib8 do16 [re] mib8 fa
   re sib r4
   mib, sol8 lab\mbreak

   %97
   sib4 mib,
   reb' reb8 reb
   reb?4 do

   %100
   mib mib8 mib
   mib4 re
   sib4. lab16 [sol]

   %103
   do4. sib16 [lab]
   re4. do16[sib]
   mib4 mib,

   %106
   sol mib\mbreak
   sib' sol
   r8 do sol fa

   %109
   mib4 r
   sib'4. la16 [sol]
   fad8 mi16 re do'8 sib16 [la]

   %112
   sib8 [la16 sol] mib'4
   re8 [do16 sib] do8 [sib16 la]
   sib8 [sol] mib'4

   %115
   re8 [do16 sib] do8 [sib16 la]
   sib8 sol r4\mbreak
   mib do

   %118
   fad re
   r8 do' sib la
   sib4. la16 [sol]

   %121
   fad4. mi16 [re]
   do'4. sib16 [la]
   sib8 sol la fad

   %124
   sol2\fermata

}

IVtestoI = \lyricmode {

   Te -- nero _ fanciul - letto _
   ar -- dere _ fa la face: _
   al regio _ cor di -- let - - - - - - - to
   por -- gi col tuo splen -- dor.
   
   Te -- nero _ fanciul - letto _ te -- nero _ fanciul - letto _
   ar -- dere _ fa la face: _
   al regio _ cor di -- let - - - - - - to al regio _ cor di -- let - - - - - - - - - to
   por -- gi col tuo splen -- dor,
   al regio _ cor di -- let - - - - - - - - - - - to
   por -- gi col tuo splen -- dor.
   
   Se per te co -- stante _ e forte _
   con so -- ave_e _ dol -- ce_as -- petto _
   fausta _ rendi _ l’alta _ sorte _
   e in sem -- biante _ omai _ se -- reno, _ omai _ se -- reno, _
   di con -- ten -- to_e gio -- ia pieno, _
   nutri _ veglia _ un dol -- ce_ar -- dor,
   di con -- ten -- to e gio -- ia pie - - - - - - - - no,
   nutri _ veglia _ un dol -- ce ar -- dor  - - - - -
   un dol -- ce_ar -- dor.

}

IVbcn = \relative do {

   do8[do do do]
   si[si si si]
   do[do mib mib]

   %4
   fa [fa fad fad]
   sol[sol sol sol]
   do,[do do do]

   %7
   fa[fa fa fa]
   sib,?[sib sib sib]
   mib[mib mib mib]

   %10
   lab,[lab lab lab]
   re[re re re]
   mib[mib lab, lab]

   %13
   sol[sol re' re]\mbreak
   mib[mib lab, lab]
   sol[lab sib sib]

   %16
   mib[mib sib sib]
   mib,2
   do'8\p[do do do]

   %19
   si[si si si]
   do do mib mib
   fa[fa fad fad]

   %22
   sol[sol sol sol]
   do,[do do do]\mbreak
   fa[fa fa fa]

   %25
   sib,[sib sib sib]
   mib[mib mib mib]
   lab,[lab lab lab]

   %28
   re[sib sib sib]
   mib[mib re re]
   mib[mib lab, lab]

   %31
   sol[sol re' re]
   mib[mib lab, lab]
   sol[sol sib sib]\mbreak

   %34
   mib[lab sib sib,]
   mib\f[mib mib mib]
   sib[sib sib sib]

   %37
   mib[mib mib mib]
   sib'[sib sib sib]
   mib,[mib sib' sib,]

   %40
   mib[mib sib' sib,]
   mib[mib sib' sib,]
   mib[mib mib\p mib]

   %43
   mib[mib mib mib]
   re[re fa fa]\mbreak
   fa[fa fa fa]

   %46
   mib[mib mib mib]
   fa[fa fad fad]
   sol[sol si, si]

   %49
   do[do do do]
   fa[fa fa fa]
   sib,[sib sib sib]

   %52
   mib[mib mib mib]
   lab,[lab lab lab]
   re,[re re re]\mbreak

   %55
   sol[sol sol sol]
   do[do do do]
   re[re re re]

   %58
   sol,[sol sol sol]
   sol[sol sol sol]
   sol[sol sol sol]

   %61
   sol[sol sol sol]
   sol[sol sol sol]
   sol[sol sol sol]

   %64
   do[do si si]\mbreak
   do[do sol' sol,]
   do[do do' do]

   %67
   do[do sib sib]
   sib[sib lab lab]
   lab?[lab sol sol]

   %70
   sol[sol fa si,]
   do[do do do]
   do[do do do]

   %73
   do[do do do]
   do[do do do]
   do[do do si]\mbreak

   %76
   do[mib fa sol]
   do,\f[do do do]
   si[si si si]

   %79
   do[do mib mib]
   fa[fa fad fad]
   sol[fa? mib do]

   %82
   do[do sib sib]
   sib[sib lab lab]
   lab?[lab sol sol]

   %85
   sol[sol si si]
   do[do do do]
   do[do sol sol]\mbreak

   %88
   do[do fa sol]
   do,4\fermata mib8\p mib
   re[re re re]

   %91
   do[do mib mib]
   fa[sib, sib sib]
   mib[mib mib mib]

   %94
   re[re do la!]
   sib[sib lab lab]
   sol[sol sol sol]\mbreak

   %97
   sol[sol sol sol]
   sol[sol sol sol]
   lab[lab lab lab]

   %100
   la![la la la]
   sib[sib sib sib]
   mib[mib mib mib]

   %103
   lab,[lab lab lab]
   lab?[lab lab lab]
   sol[sol sol sol]

   %106
   mib'[mib mib mib]\mbreak
   mib[mib mib mib]
   lab,[lab sib sib]

   %109
   mib[mib mib mib]
   mib[mib mib mib]
   re[re re re]

   %112
   sol,[sol sol sol]
   sol[sol sol sol]
   sol[sol sol sol]

   %115
   sol[sol sol sol]
   sol[sol sol sol]\mbreak
   do[do do do]

   %118
   re[re re re]
   re[re re re]
   dod[dod dod dod]

   %121
   do![do do do]
   fad,[fad fad fad]
   sol[sol do re]

   %124
   sol,2\fermata

}

IVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s2*3
   <_->2
   <_!>
   s
   <7 _->
   <7->
   <7>
   <7>
   s
   <5>4 s8 <6 4>
   s2
   s4 s8 <6 4>
   s2*6
   <_->2
   <_!>
   s
   <7>
   <7>
   s2*10
   <5 4>4 <3>
   s2
   <6 4>4 <5 3>
   s <6 4>8 <5 3>
   s4 <6 4>8 <5 3>
   s2*39
   <_->2
   s
   <2>4 <3>
   <2> <3>
   <2> <3>
   <2-> <3>
   s <6->
   <5> <7>

}


forma = {

   \time 2/4
   \key sib\major
   \tempo 2 = 56
   s2*124
   \bar "||"
   \mark\markup "D.C."

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

IVsoprano = {
   \new Voice = "fanciulletto"
   <<\IVsopranon \forma>>
}

IVbc = {
   \clef bass
   <<\IVbcn \forma \IVbfn>>
}




Vsopranon = \relative do'' {

   \autoBeamOff

   R1*5
   sol8 sol sib sib16 la la8 la r4
   sol8 la sib sib16 la\mbreak fa8 fa r4

   %8
   la8 la re do16 re sib4 re8 dod16 re
   la la la8 r4 r2
   R1*9

}

VtestoI = \lyricmode {

   Quan -- to_a  -- vran più di pregio _
   que -- sti_Au -- gusti _ Spon -- sali _
   se per pro -- nu -- ba_an -- cor hanno _ la Glo -- ria. _

}

Valton = \relative do' {

   \autoBeamOff

   re8 re sol sol16 la fad8 fad r4
   fad?8 la re, re16 mi fad!8 fad r4
   fad?8 sol la la16 sib sol8 sol r re

   %4
   sol sol fa? sol\mbreak mib mib r4
   sol8 sol16 sol fad8 sol re re r4
   R1*3

   %9
   r2 la'4 r8 la
   fa8 fa fa fa\mbreak re16 re re8 r4
   fa8 fa fa fa16 mi mi8 mi r si'

   %12
   sold sold fad mi la la r16 la fa? la
   mi8 mi r4 la8 la la la16 la\mbreak
   fad8 fad r16 fad red mi fad8 fad r4

   %15
   la8 la16 la sol8 fad sol sol r si
   sol sol fad? sol mi mi r sol
   sol sol sol fad re4 r16 fad si la

   %18
   fad8 fad r4 r2\fermata

}

VtestoII = \lyricmode {

   E voi, Gra --  zie ed_A -- mori, _
   intes - sete _ di fiori _ 
   odo - rose _ ghir -- lande, _
   e_il letto _ nuzi - ale _
   meco _ spar -- gen -- do_an -- date. _

   O av -- ventu - rosa _ cop -- pia _
   di già scelta _ dal fato _ 
   a render _ me più_il -- lustre _ e te fe -- lice. _
   
   Quanto _ darti _ può mai _ di lie -- ti_in -- flussi _
   Ogni _ be -- nigna _ stella _ 
   per me ti sian con -- cesse, _
   e_il mondo _ con stupor _ in te ciò veda. _

}

Vbcn = \relative do {

   sol2 re'~
   re1~
   re2 sol,~
   sol do~
   do re4 sol,~
   sol2 dod~
   dod\mbreak re~
   re sol,
   la4 re~re2~
   re~re~
   re sold,~
   sold do4. re8
   mi4 la,~la2\mbreak
   red1~
   red2 mi~
   mi1~
   mi2 si
   dod fad,\fermata

}

Vbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*18
   \bar "|."

}

Vsoprano = {
   \new Voice = "pregio"
   <<\Vsopranon \forma>>
}

Valto = {
   \new Voice = "grazie"
   <<\Valton \forma>>
}

Vbc = {
   \clef bass
   <<\Vbcn \forma \Vbfn>>
}




VIvlan = \relative do' {

   si4 sol'
   fad8[mi re dod]
   si4 re'

   %4
   dod8[si lad sold]
   fad4 fad'
   mi8[re dod si]

   %7
   lad[sold fad mi]
   re dod si4
   re'8[fad16 mi re dod si la]

   %10
   sol8[si16 la sol fad mi re]
   dod8 [mi'16 re dod si la sol]
   fad8[la16 sol fad mi re dod]\mbreak

   %13
   si8[re'16 dod si la sol fad]
   mi8[sol16 fad mi re dod si]
   lad4 si

   %16
   mi fad
   si,\p sol'
   fad8[mi re dod]

   %19
   si4 si'
   lad8[sold fad mi]
   re4 re'

   %22
   dod8[si lad sold]
   fad[mi re dod]
   si4 sol'\mbreak

   %25
   mi si'
   lad8[sold fad mi]
   re[dod si lad]

   %28
   si4 si'
   sol8[fad] mi(re)
   dod4 la'

   %31
   fad8[re fad la]
   si[re16 dod si la sol fad]
   mi8[dod mi sol]

   %34
   la[dod16 si la sol fad mi]
   re8[si re fad]
   sol[si16 la sol fad mi re]

   %37
   dod8[la'16 sol la8 la,]\mbreak
   la[sol'16 fad sol8 la,]
   la[fad'16 mi fad8 la,]

   %40
   la4 r
   la' re,
   dod re

   %43
   sol la
   re,8[mi16 fad sol la si dod]
   re8 [re, mi dod]

   %46
   re8[mi16 fad sol la si dod]
   re8 [re, mi dod]
   re4\f si'

   %49
   la8[sol fad mi]\mbreak
   re4 re'
   dod8[si la sol]

   %52
   fad4 fad'
   mi8[re dod si]
   lad[sold fad mi]

   %55
   re dod si4
   si\p sol'
   fad8[mi re dod]

   %58
   si4 si'
   dod8[si lad sold]
   fad[mi re dod]

   %61
   si4 sol'
   mi si'
   lad8[sold fad mi]\mbreak

   %64
   re[dod si lad]
   si4 si'
   dod8 [fad, sol fad]

   %67
   mid dod'4 si8
   lad fad4 mi8
   red si'4 la8

   %70
   sold mi4 re8
   dod la'4 sol8
   fad re4 dod8

   %73
   si sol'4 fad8
   mi4 r
   mi8[sol fad mi]

   %76
   dod'[sol fad mi]\mbreak
   dod'[sol fad mi]
   dod'[sol fad mi]

   %79
   re4 r
   re si'
   mi, si'

   %82
   fad lad
   si,8[dod16 re mi fad sol la]
   si8 [re, mi fad]

   %85
   si,8[dod16 re mi fad sol la]
   si8 [re, mi fad]
   \once\stemUp si,[fad''16\f mi re dod si la]

   %88
   sol8 [si16 la sol fad mi re]\mbreak
   \once\stemUp dod8[mi'16 re dod si la sol]
   fad8[la16 sol fad mi re dod]

   %91
   \once\stemUp si8[re'16 dod si la sol fad]
   mi8[sol16 fad mi re dod si]
   lad4 si

   %94
   mi fad
   si,2\fermata
   fad'4 la
   sold8[la si sold]

   %98
   dod,4 si'
   la8[sold] fad4
   fad re'\mbreak

   %101
   mid, dod'
   mi,! dod'
   red, si'

   %104
   re,! si'
   dod, fad
   sold8[fad sold mid]

   %107
   fad4 r8 dod'
   re16[mi re dod] si[dod si la]
   sold[la sold fad] mi4

   %110
   dod'16[re dod si] la[si la sold]
   fad[sold fad mi] re4\mbreak
   si'16[dod si la] sold[la sold fad]

   %113
   mid8[dod fad si]
   dod4 dod,
   fad dod'8 fad,

   %116
   si,4 re
   dod4. dod8
   fad2\fermata

}

VIalton = \relative do' {

   \autoBeamOff

   R2*16
   si4 sol'
   fad8[mi] re dod

   %19
   si4 si'
   lad8[sold] fad mi
   re4 re'

   %22
   dod8[si] lad[sold]
   fad[mi] re[dod]
   si4 sol'\mbreak

   %25
   mi si'
   lad8[sold] fad4
   R2

   %28
   si,4 si'
   sol8[fad] mi(re)
   dod4 la'

   %31
   fad8[re fad la]
   si[re16 dod si la sol fad]
   mi8[dod mi sol]

   %34
   la[dod16 si la sol fad mi]
   re8[si re fad]
   sol[si16 la sol fad mi re]

   %37
   dod8[la'16 sol la8 la,]\mbreak
   la[sol'16 fad sol8 la,]
   la[fad'16 mi fad8 la,]

   %40
   la4 r
   la' re,
   dod re

   %43
   sol la
   re,8[mi16 fad sol la si dod]
   re8 re, mi dod

   %46
   re8[mi16 fad sol la si dod]
   re8 re, mi dod
   re4 r

   %49
   R2*7
   si4 sol'
   fad8[mi] re dod

   %58
   si4 si'
   dod8[si] lad[sold]
   fad[mi] re[dod]

   %61
   si4 sol'
   mi si'
   lad8[sold] fad4\mbreak

   %64
   R2
   si,4 si'
   dod8 fad, sol fad

   %67
   mid dod'4 si8
   lad fad4 mi8
   red si'4 la8

   %70
   sold mi4 re8
   dod la'4 sol8
   fad re4 dod8

   %73
   si sol'4 fad8
   mi4 r
   mi8[sol fad mi]

   %76
   dod'[sol fad mi]\mbreak
   dod'[sol fad mi]
   dod'[sol fad mi]

   %79
   re4 r
   re si'
   mi, si'

   %82
   fad lad
   si,8[dod16 re mi fad sol la]
   si8 re, mi fad

   %85
   si,8[dod16 re mi fad sol la]
   si8 re, mi fad
   si,4 r

   %88
   R2*8
   fad'4 la
   sold8[la] si sold

   %98
   dod,4 si'
   la8[sold] fad4
   fad re'\mbreak

   %101
   mid, dod'
   mi,! dod'
   red, si'

   %104
   re,! si'
   dod, fad
   sold8[fad] sold[mid]

   %107
   fad4 r8 dod'
   re16[mi re dod] si[dod si la]
   sold[la sold fad] mi4

   %110
   dod'16[re dod si] la[si la sold]
   fad[sold fad mi] re4\mbreak
   si'16[dod si la] sold[la sold fad]

   %113
   mid8[dod fad] si
   dod4 dod,
   fad dod'8 fad,

   %116
   si,4 re
   dod4. dod8
   fad2\fermata

}

VItestoII = \lyricmode {

   Questo _ nodo _ e questo _ strale _ e questo _ strale _
   già ch’a -- prì pia -- ga vi -- tale _
   non po -- trà più pa -- ven -- tar, - - - - - - - - - 
   non po -- trà più pa -- ven -- tar, - più pa -- ven -- tar, - più pa -- ven -- tar.
   
   Questo _ nodo _ e questo _ strale _ 
   già ch’a -- prì pia -- ga vi -- tale _
   non po -- trà più pa -- ven -- tar, - - - - - - - - - - - - - - - - - - - - - - - - - - 
   non po -- trà più pa -- ven -- tar, -
   più pa -- ven -- tar, - più pa -- ven -- tar.
   
   Per quel genio _ e per quel core _
   egual _ spir -- to,_e -- gual va -- lore _
   si pre -- pa -- ra_a tri -- on -- far, - - - - - - - - - - - - 
   a tri -- on -- far si pre -- pa -- ra_a tri -- on -- far.

}

VIbcn = \relative do {

   si4 sol'
   fad8[mi re dod]
   si4 re'

   %4
   dod8[si lad sold]
   fad4 fad'
   mi8[re dod si]

   %7
   lad[sold fad mi]
   re dod si4
   re'8[fad16 mi re dod si la]

   %10
   sol8[si16 la sol fad mi re]
   dod8 [mi'16 re dod si la sol]
   fad8[la16 sol fad mi re dod]\mbreak

   %13
   si8[re'16 dod si la sol fad]
   mi8[sol16 fad mi re dod si]
   lad4 si

   %16
   mi fad
   si,\p sol'
   fad8[mi re dod]

   %19
   si4 si'
   lad8[sold fad mi]
   re4 re'

   %22
   dod8[si lad sold]
   fad[mi re dod]
   si4 sol'\mbreak

   %25
   mi si'
   lad8[sold fad mi]
   re[dod si lad]

   %28
   si[dod re si]
   sol'[fad mi re]
   la[si dod la]

   %31
   re[re fad la]
   si[re16 dod si la sol fad]
   mi8[dod mi sol]

   %34
   la[dod16 si la sol fad mi]
   re8[si re fad]
   sol[si16 la sol fad mi re]

   %37
   dod8[la'16 sol la8 la,]\mbreak
   la[sol'16 fad sol8 la,]
   la[fad'16 mi fad8 la,]

   %40
   la4 r
   la' re,
   dod re

   %43
   sol, la
   re8[mi16 fad sol la si dod]
   re8[re, sol, la]

   %46
   re8[mi16 fad sol la si dod]
   re8[re, sol, la]
   re4\f si'

   %49
   la8[sol fad mi]\mbreak
   re4 re'
   dod8[si la sol]

   %52
   fad4 fad'
   mi8[re dod si]
   lad[sold fad mi]

   %55
   re dod si4
   si\p sol'
   fad8[mi re dod]

   %58
   si4 si'
   dod8[si lad sold]
   fad[mi re dod]

   %61
   si4 sol'
   mi si'
   lad8[sold fad mi]\mbreak

   %64
   re[dod si lad]
   si4 si'
   dod8[fad, sol fad]

   %67
   dod[dod dod dod]
   fad[fad fad fad]
   si,[si si si]

   %70
   mi[mi mi mi]
   la,[la la la]
   re[re re re]

   %73
   sol[sol lad, si]
   fad'4 r
   fad fad

   %76
   fad fad\mbreak
   fad fad
   fad fad

   %79
   si,8[dod re dod]
   si4 si'
   mi, si'

   %82
   fad lad
   si,8[dod16 re mi fad sol la]
   si8[re, mi fad]

   %85
   si,[dod16 re mi fad sol la]
   si8[re, mi fad]
   \once\stemUp si,[fad''16\f mi re dod si la]

   %88
   sol8 [si16 la sol fad mi re]\mbreak
   \once\stemUp dod8[mi'16 re dod si la sol]
   fad8[la16 sol fad mi re dod]

   %91
   \once\stemUp si8[re'16 dod si la sol fad]
   mi8[sol16 fad mi re dod si]
   lad4 si

   %94
   mi fad
   si,2\fermata
   fad'8\p[sold la fad]

   %97
   sold[la si sold]
   dod,[red mid dod]
   fad[sold la fad]

   %100
   fad[fad fad fad]\mbreak
   mid[mid mid mid]
   mi![mi mi mi]

   %103
   red[red red red]
   re![re re re]
   dod4 fad

   %106
   si,8[la si dod]
   fad[fad fad fad]
   si,[si si si]

   %109
   mi[mi mi mi]
   la,[la la la]
   re[re re re]\mbreak

   %112
   sold,8 [sold sold sold]
   dod dod fad si
   dod4 dod,

   %115
   fad dod'8 fad,
   si,4 re
   dod2

   %118
   fad,\fermata

}

VIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 2/4
   \key si\minor
   \tempo 2 = 55
   s2*118
   \bar "||"
   \mark\markup "D.C."

}

VIvla = {
   \clef alto
   <<\VIvlan \forma>>

}

VIalto = {
   \new Voice = "nodo"
   <<\VIalton \forma>>
}

VIbc = {
   \clef bass
   <<\VIbcn \forma \VIbfn>>
}




VIIsopranon = \relative do'' {

   \autoBeamOff

   r4 r8 si sol sol sol la
   fad fad r16 la do si si8 si r si
   fad4 r8 fad red red r si'\mbreak

   %4
   sol sol r dod mi, mi sol fad
   re re r4 re'8 si16 si si8 si
   sold sold r16 sold la si mi,8 mi r4

   %7
   si'8 si16 si si8 do\mbreak do do r4
   do8 la16 la do8 si sol sol r16 si si do
   do8 do r4 do8 do do si16 do

   %10
   la4 do8 si16 do sol8 sol r4\fermata

}

VIItestoI = \lyricmode {

   Del -- l’in -- clita _ Re -- gina _
   al dolce _ sguardo _  il ciel, la terra, _ il mare _ 
   ap -- plaudo - no giu -- livi; _
   scorron _ di mie -- le_i rivi, _
   fio -- riti_i _ prati _ e di più chiara _ luce _ 
   splendon _ il sol, le stelle _ e_in ogni _ riva _
   sol si sente _ d’A -- mor voce _ giu -- liva. _
   
}

VIIbcn = \relative do {

   sol1
   re'2 red~
   red1
   mi,2 lad
   si1
   re~
   re2 la
   fad sol
   mi'1
   fa2 sol4 do,\fermata

}

VIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 55
   s1*10
   \bar "|."

}

VIIsoprano = {
   \new Voice = "regina"
   <<\VIIsopranon \forma>>
}

VIIbc = {
   \clef bass
   <<\VIIbcn \forma \VIIbfn>>
}





VIIIvlIn = \relative do'' {

   fa,8
   fa(mi) mi la la(sold) sold do
   do(si) si re do[re16 mi fa8 la,]

   %3
   sold4 r8 mi' la, la la la
   fa'8.\tr[mi16 re do si la] sol8 sol sol sol
   mi'8.[re16 do si la sol] fa8 fa fa fa

   %6
   re'8.[do16 si la sold fa] fa4(mi8) fa\mbreak
   fa4(mi8) fa fa4(mi8) re'
   do[si16 la si8 sold] la4\p la

   %9
   la8 [si16 do re8 do16 si] do8 si la4
   la la la8 [si16 do re8 do16 si]
   do8 si la4 r sol8 do

   %12
   do4(si8) fa fa4 \parenthesize (mi8) la\mbreak
   la4(sol8) do si la sol fa
   mi4 r8 do sol'[sol sol\tr fa16 mi]

   %15
   do'4.\tr si16 la sol8[sol sol\tr fa16 mi]
   do'4.\tr si16 la sol8[sol sol\tr fa16 mi]
   la8[la la\tr sol16 fa] si8[si si\tr la16 sol]

   %18
   do8 sol do4~do8[si16 la sol8 fa]
   mi sol do4~do8[si16 la sol8 fa]\mbreak
   mi8 re16 do re4\tr sol8\f sol sol sol

   %21
   do8.[si16 la sol fa mi] fa8 fa fa fa
   si8.[la16 sol fa mi re] mi8 do' re si
   do4\p sol sol8 [la16 si do8 si16 la]

   %24
   la4\parenthesize \tr sol sol sol
   sol8 [la16 si do8 si16 la] la4\tr sol
   r mi8 sib'\mbreak sib4(la8) re,

   %27
   re4(dod8) sol' sol4(fa8) la
   la4(sold8) re' do si la4
   mi\tr mi\tr mi8[fa16 sol la8 sol16 fa]

   %30
   mi4\tr mi\tr mi8[fa16 sol la8 sol16 fa]
   mi4 r8 mi mi mi mi mi
   la4.\tr sol16 fa mi8 mi mi mi\mbreak %% metà p 23

   %33 OOKK
   la4.\tr sol16 fa mi8[mi mi\tr re16 do]
   fa8[fa fa\tr mi16 re] sold8[sold sold\tr fad16 mi]
   la8 mi do'4\tr~do8 [si16 la si8 la16 sold]

   %36
   la8 mi do'4\tr~do8 [si16 la si8 la16 sold]
   la8[sol16 fa? mi8 fa] fa4(mi8) fa
   fa4(mi8) la la4(sold8) re'

   %39
   do si16 la si4 la r8 mi'\f\mbreak
   la,8 la la la fa'8.\tr[mi16 re do si la]
   sol8 sol sol sol mi'8.\tr[re16 do si la sol]

   %42
   fa8 fa fa fa re'8.\tr[do16 si la sold fa]
   fa4(mi8) fa fa4(mi8) re'
   do[si16 la si8 sold] la4\fermata r

   %45
   do\p do do8 [mi,16 fa] sol8 fa16 mi]
   la4\tr sol\mbreak do do
   do8 [mi,16 fa sol8 fa16 mi] la4\tr sol

   %48
   do4 do do8[si16 la sol8 fa]
   mi do mi sol do4 do
   do8[si16 la sol8 fa] mi4 r8 sol

   %51
   do do, re4\tr do r
   sol' sol sib8[la16 sol fa8 mi]
   sol4 sol\mbreak sib8[la16 sol fa8 mi]

   %54
   fa mi re4 la' la
   sib8 sib sib sib sol4~sol16 fa mi re
   dod'8 dod dod dod la4~la16 sol fa mi

   %57
   fa8 re fa la re[do16 sib la8 sol]
   fa mi16 re mi4 re2\fermata

}

VIIIvlIIn = \relative do'' {

   r8
   r4 r8 fa, fa(mi) mi la
   la(sold) sold si do[si16 do re8 fa,]
   mi4 r8 mi' la, la la la

   %4
   fa'8.\tr[mi16 re do si la] sol8 sol sol sol
   mi'8.[re16 do si la sol] fa8 fa fa fa
   re'8.[do16 si la sold fa] fa4(mi8) fa\mbreak

   %7
   fa4(mi8) fa fa4(mi8) re'
   do[si16 la si8 sold] do4\p do
   do8[do si la16 sold] la8 sold la4

   %10
   do do do8[do si la16 sold]
   la8 sold la4 r mi8 mi'
   mi4(re8) re re4(do8) fa,\mbreak

   %13
   fa4(mi8) la sol fa mi re
   do4 r8 do sol'[sol sol\tr fa16 mi]

   %15
   do'4.\tr si16 la sol8[sol sol\tr fa16 mi]
   do'4.\tr si16 la sol8[sol sol\tr fa16 mi]
   la8[la la\tr sol16 fa] si8[si si\tr la16 sol]

   %18
   do8 sol do4~do8[si16 la sol8 fa]
   mi sol do4~do8[si16 la sol8 fa]\mbreak
   mi8 re16 do re4\tr sol8\f sol sol sol

   %21
   do8.[si16 la sol fa mi] fa8 fa fa fa
   si8.[la16 sol fa mi re] mi8 mi fa re
   mi4\p mi mi8 sol la fa

   %24
   fa4\tr mi mi mi
   mi8 sol la fa fa4\parenthesize \tr  mi
   r dod8 sol'\mbreak sol4(fa8) fa

   %27
   fa4(mi8) mi mi4(re8) re'
   do4(si8) si la sold la4
   do,\parenthesize \tr do\parenthesize \tr  do8[re16 mi fa8 mi16 re]

   %30
   do4 do do8[re16 mi fa8 mi16 re]
   do4 r8 mi mi mi mi mi
   la4.\tr sol16 fa mi8 mi mi mi\mbreak %% metà p 23

   %33 OOKK
   la4.\tr sol16 fa mi8[mi mi\tr re16 do]
   fa8[fa fa\tr mi16 re] sold8[sold sold\tr fad16 mi]
   la8 mi do'4\tr~do8 [si16 la si8 la16 sold]

   %36
   la8 mi do'4\tr~do8 [si16 la si8 la16 sold]
   la8[sol16 fa? mi8 fa] fa4(mi8) fa
   fa4(mi8) la la4(sold8) re'

   %39
   do si16 la si4 la r8 mi'\f\mbreak
   la,8 la la la fa'8.\tr[mi16 re do si la]
   sol8 sol sol sol mi'8.\tr[re16 do si la sol]

   %42
   fa8 fa fa fa re'8.\tr[do16 si la sold fa]
   fa4(mi8) fa fa4(mi8) re'
   do[si16 la si8 sold] la4\fermata r

   %45
   mi\p mi mi8 mi16 fa sol8 fa16 mi
   fa4\parenthesize \tr mi\mbreak mi mi
   mi8 [mi16 fa sol8 fa16 mi] fa4\parenthesize \tr mi

   %48
   mi' mi mi re
   sol, r mi' mi
   mi re sol, r8 do

   %51
   do4 si mi,8 fa sol fa
   mi4 mi sol8[fa16 mi re8 dod]
   mi4 mi\mbreak sol8[fa16 mi re8 dod]

   %54
   la'8 sol fa4 fa fa
   re8 re re re sib'4~sib16 la sol fa
   mi8 mi mi mi dod'4. dod8

   %57
   la4 r8 fa fa4 mi
   re dod re2\fermata

}

VIIIvlan = \relative do' {

   r8
   r do do do r si si mi
   r si si sold r la la la
   mi' sold si sold r mi mi mi

   %4
   r la, la la r re re re
   r sol, sol sol r do do do
   r fa, fa fa r do' do do\mbreak

   %7
   r si si si r si si si
   r mi fa si, do4 r
   R1*11

   %20
   r2 r8 mi sol mi
   r mi mi mi r fa, la fa
   r re re sol sol sol la sol

   %23
   sol4 r r2
   R1*13
   la'4 do,8 re re4(do8) re

   %38
   re4(do8) do' do4(si8) si
   la4  sold la r
   r8 mi mi mi r la, la la

   %41
   r re re re r sol, sol sol
   r do do do r fa, fa fa
   r do' do do  r si si si

   %44
   r mi fa si, do4 \fermata r
   R1*14

}

VIIIsopranon = \relative do'' {

   \autoBeamOff

   r8
   R1*7
   r2 la4 la

   %9
   la8 si16 [do] re8 do16 [si] do8 [si] la4
   la la la8 si16 [do] re8 do16 [si]
   do8 [si] la4 r sol8 do

   %12
   do4(si8) fa fa4 mi8 la\mbreak
   la4(sol8) do si [la] sol [fa]
   mi4 r8 do sol'[sol sol\tr fa16 mi]

   %15
   do'4.\tr si16 [la] sol8[sol sol\tr fa16 mi]
   do'4.\tr si16 [la] sol8[sol sol\tr fa16 mi]
   la8[la la\tr sol16 fa] si8[si si\tr la16 sol]

   %18
   do8 [sol] do4~do8[si16 la sol8 fa]
   mi [sol] do4~do8[si16 la sol8 fa]\mbreak
   mi8 re16 [do] re4\tr do r

   %21
   R1*2
   sol'4 sol sol8 la16 [si] do8 si16 [la]

   %24
   la4 sol sol sol
   sol8 la16 [si] do8 si16 [la] la4\tr sol
   r mi8 sib'\mbreak sib4(la8) re,

   %27
   re4(dod8) sol' sol4(fa8) la
   la4(sold8) re' do [si] la4
   mi\tr mi\tr mi8[fa16 sol la8 sol16 fa]

   %30
   mi4\tr mi\tr mi8[fa16 sol la8 sol16 fa]
   mi4 r8 mi mi [mi mi mi]
   la4.\tr sol16 [fa] mi8 [mi mi mi]\mbreak %% metà p 23

   %33 OOKK
   la4.\tr sol16 [fa] mi8[mi mi\tr re16 do]
   fa8[fa fa\tr mi16 re] sold8[sold sold\tr fad16 mi]
   la8 [mi] do'4\tr~do8 [si16 la] si8 [la16 sold]

   %36
   la8 [mi] do'4\tr~do8 [si16 la si8 la16 sold]
   la8[sol16 fa? mi8 fa] fa4(mi8) [fa]
   fa4(mi8) [la] la4(sold8) [re']

   %39
   do si16 [la] si4 la r
   R1*5
   do4 do do8 mi,16 fa sol8 fa16 mi

   %46
   la4\tr sol\mbreak do do
   do8 mi,16 [fa] sol8 fa16 mi la4\tr sol
   do4 do do8 [si16 la sol8 fa]

   %49
   mi [do mi sol] do4 do
   do8[si16 la sol8 fa] mi4 r8 sol

   %51
   do do, re4\tr do r
   sol' sol sib8[la16 sol fa8] mi
   sol4 sol\mbreak sib8[la16 sol fa8] mi

   %54
   fa [mi] re4 la' la
   sib8 [sib sib sib] sol4~sol16 [fa mi re]
   dod'8 [dod dod dod] la4~la16 [sol fa mi]

   %57
   fa8 [re fa la] re[do16 sib la8] sol
   fa mi16[re] mi4 re2\fermata

}

VIIItestoI = \lyricmode {

   Scher -- ze -- ran sempre _ d’in -- torno _
   fes -- toset - ti gl’a -- mo -- retti _
   e_in pu -- di -- co re - gio petto _
   ar -- de -- rà la fiam - - - - - - - - - - - - - ma bella, _ 
   
   Scher -- ze -- ran sempre _ d’in -- torno _
   fes -- toset - ti gl’a -- mo -- retti _
   e_in pu -- di -- co re -- gio petto _ re -- gio petto _
   ar -- de -- rà - - - - la fiam - - - - - - - - - - - - - - - - - - ma bella. _ 
   
   E di nuo -- va in -- dus -- tri -- a_a -- dorno _
   sempli - cet -- to e mol -- le_af -- fet -- to
   si ve -- drà - - - - - con sua fa -- cella, _
   sempli - cet -- to mol -- le mol -- le_af -- fet -- to
   si ve -- drà - - - - - con sua fa -- cel -- la.

}

VIIIbcn = \relative do {

   r8
   r la la' la, r mi mi' mi,
   r mi mi' mi, r la re re,
   mi mi mi' mi, r do' la' do,

   %4
   r re fa re r si sol' si,
   r do mi do r la fa' la,
   r si re si r la la' la,\mbreak

   %7
   r sold sold' sold, r sold sold' sold,
   la do re mi la,\p si do si
   la la si mi, la si do si

   %10
   la si do si la la si mi,
   la si do la do re mi do
   sol la si sol do re mi re\mbreak

   %13
   do re mi do sol la si sol
   do re mi re do re mi re
   do re mi fa mi fa mi re

   %16
   do re mi fa mi re mi do
   fa mi fa re fa la sol fa
   mi fa mi re do re si sol

   %19
   do re mi re do re si sol\mbreak
   do do sol' sol, do\f do mi do
   r do mi do r re fa re

   %22
   r sol, si sol do do fa, sol
   do\p re mi re do do fa fa,
   do' re mi re do re mi re

   %25
   do do fa fa, do' re mi re
   dod re mi dod\mbreak re mi fa re
   la si dod la re mi fa re

   %28
   mi fad sold mi la,4 r8 la
   la si do si la4 r
   la8 si do si la4 r

   %31
   la8 si do si la si do si
   la si do sold la si do si\mbreak
   la si do sold la si do la

   %34
   re do re re, mi' fa mi re
   do re do si la do re mi
   la, si do si la do re mi

   %37
   la, la la' la, r la la' la,
   r la la' la, r mi mi' mi,
   r la mi' mi,

   %40
   la4 r8 la\f\mbreak r8 do la' do, r re fa re
   r si sol' si, r do mi do
   r la fa' la, r si re si

   %43
   r la la' la, r sold sold' sold,
   la do re mi la,4\fermata r
   do8\p re mi re do re mi re

   %46
   do re mi re\mbreak do re mi re
   do re mi re do re mi re
   do re mi re do4 si

   %49
   do r do8 re mi re
   do4 si do8 re mi re
   do4 sol do8 re mi re

   %52
   dod re mi re dod re mi re
   dod re mi re\mbreak dod re mi dod
   re mi fa mi re mi fa re

   %55
   sol, la sib la sol la sib sol
   la si dod si dod la si dod
   re mi fa mi re4 dod

   %58
   re la re2\fermata

}

VIIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key la\minor
   \tempo 2 = 45
   \partial 8 s8
   s1*58
   \bar "||"
   \mark\markup "D.C."

}

VIIIvlI = {
   <<\VIIIvlIn \forma>>

}

VIIIvlII = {
   <<\VIIIvlIIn \forma>>

}

VIIIvla = {
   \clef alto
   <<\VIIIvlan \forma>>

}

VIIIsoprano = {
   \new Voice = "amoretti"
   <<\VIIIsopranon \forma>>
}

VIIIbc = {
   \clef bass
   <<\VIIIbcn \forma \VIIIbfn>>
}




IXsopranon = \relative do'' {

   \autoBeamOff

   R1*7
   r2 si8 si16 si si8 dod
   dod? dod r4\mbreak sold sold8 la

   %10
   si4 r re8 si16 si si8 la
   fad fad r4 r2
   R1*3

}

IXtestoI = \lyricmode {

   Del lumi - noso _  ciglio _
   più che da me vengon _ sì cari _ nodi. _

}

IXalton = \relative do' {

   \autoBeamOff

   sol'8 sol sol fa16 mi la8 la r la
   fad fad sol la re, re r16 re fad la\mbreak
   si8 si r4 sol8 sol16 sol sol8 fad

   %4
   re re r4 la' r8 si
   fad4 fad8 sol\mbreak mi mi r si'
   sol sol fad mi lad lad r4

   %7
   lad?8 dod mi, mi16 fad\mbreak re4 r16 si' lad! si
   fad8 fad r4 r2
   R1*2

   %11
   r4 r8 la\mbreak fad fad la sold
   mi mi r mi sold sold sold la
   la la la sold?16 la\mbreak fad8 fad r fad

   %14
   fad? fad sold la mi mi r4

}

IXtestoII = \lyricmode {

   Impa - ziente _ il desio _
   at -- tende _ la sua gioia _
   per il so -- ave _ indi - solu - bil nodo. _
   
   O pro -- pizio _ mo -- mento _
   per cui l’au -- gusta _ sposa _ 
   spe -- ra_ap -- pien di go -- der del suo con -- tento. _

   S’u -- nisca - no mai sempre, _
   e sien i cas -- ti_af -- fetti _
   delle _ più forti, _  a -- daman - tine _ tempre. _

}

IXbcn = \relative do {

   do2 fad,~
   fad1
   sol

   %4
   la4 re red2~
   red mi~
   mi1~

   %7
   mi2 mid
   fad4 si,~si2
   mid~mid~

   %10
   mid1
   fad2 sid,
   dod1

   %13
   fad2 re~
   re mi4 la,\fermata

}

IXbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*14
   \bar "|."

}

IXsoprano = {
   \new Voice = "ciglio"
   <<\IXsopranon \forma>>
}

IXalto = {
   \new Voice = "desio"
   <<\IXalton \forma>>
}

IXbc = {
   \clef bass
   <<\IXbcn \forma \IXbfn>>
}





XvlIn = \relative do'' {

   re4. re re8 re (mi fad sol la)
   re,4. re re8 re (mi fad sol la)
   re,4. si' la sol

   %4
   fad8 mi re la' sol fad si4. la
   la, sol' fa8(mi fa) fad4.
   sol8(fad sol) sold4. la8 sold fad mi4 re8

   %7
   dod4. si la2.\mbreak
   re4. re re8 re \parenthesize (mi fad sol la)
   re,4. re re8 re \parenthesize (mi fad sol la)

   %10
   re,4. si' la sol
   fad r8 r re fad mi re la' sol fad
   si4. la fad8 mi re  la' sol fad

   %13
   si4. la r la4 dod,8
   re mi fad mi4 re8\mbreak dod4. r8 dod re
   mi re mi mi4. fa8 mi fa fad4.

   %16
   sol8 fad sol sold4. la r8 r la
   sold fad mi fa4. mi8 re dod re4.
   dod8 si la la'4. sold8 fad mi dod'4.

   %19
   si8 re dod si la sold la(sold fad mi4) la8
   si4. sold la2.\fermata
   R1.*17

   %38
   r2. re,4.\f re
   re8 re (mi fad sol la) re,4. re
   re8 re (mi fad sol la) re,4. si'

   %41
   la sol fad8 mi re la'4 r8
   sold8 fad mi fa4. mi8 re dod re4.
   dod8 si la sol'4. fad8 re' fad, mi re' dod\mbreak

   %44
   re2.\fermata fad,4. fad
   fad8 re mi fad4 fad8 fad4. si,
   si'4. si si8 sol la si4 si8

   %47
   si4. mi, r fa4 mi8
   red4.~red8 dod si la'4.~la8 sold fad
   sold4.~sold8 fad mi\mbreak re4.~re8 do si

   %50
   do si la la' sol fad sol fad mi red4 mi8
   mi8 si' la sol fad mi sol4. fad
   mid~mid8 red dod si'4.~si8 la sold

   %53
   la dod si la sold fad mid4.~mid4 fad8
   fad1.

}

Xvlan = \relative do' {

   fad4 r8 fad4 r8 fad4 r8 fad4 r8
   fad4 r8 fad4 r8 fad4 r8 fad4 r8
   fad4 r8 sol4 r8 fad4. mi

   %4
   re fad sol fad
   dod4 r8 mi4 r8 re4 r8 re4 r8
   mi4 r8 re4 r8 dod4 r8 si4 r8

   %7
   la'4 r8 sold4 r8 la2.\mbreak
   R1.*30
   r2. fad4. fad

   %39
   fad4 r8 fad4 r8  fad4 r8 fad4 r8
   fad4 r8 fad4 r8 fad4. sol
   fad4. dod' la fad4 r8

   %42
   si4 r8 la4 r8 sol4 r8 fad4 r8
   mi4 r8 dod4 r8 la4 la'8 la4 la8\mbreak
   fad2.\fermata r

   %45
   R1.*10

}

Xalton = \relative do' {

   \autoBeamOff

   R1.*7
   re4. re re8 [re mi] fad [sol la]
   re,4. re re8 [re mi] fad [sol la]

   %10
   re,4. si' la sol
   fad r8 r re fad [mi] re la' [sol] fad
   si4. la fad8 [mi re]  la' [sol fad]

   %13
   si4. la r la4 dod,8
   re [mi] fad mi4 re8\mbreak dod4. r8 dod [re]
   mi [re mi] mi4. fa8 [mi fa] fad4.

   %16
   sol8 [fad sol] sold4. la r8 r la
   sold [fad mi] fa4. mi8 [re dod] re4.
   dod8 [si la] la'4. sold8 [fad mi] dod'4.

   %19
   si8 [re dod] si [la] sold la[(sold fad] mi4) la8
   si4. sold la2.\fermata
   fad4.  fad fad8 [mi re] si'4.

   %22
   la sol fad8 [mi re] si'4.
   la sol fad r8 r la
   dod,8[re] mi mi[re] dod sol'4. fad

   %25
   la(si4) re,8 dod[re mi] re4.
   la'(si4) re,8 dod[re mi] re4.\mbreak
   r4. la'4 sol8 fad[mi] re do[si] la

   %28
   \tupletSpan 2. \con \tuplet 4/6 {si re4 sol8}~sol[fad mi] re[dod si]
   \tuplet 4/6 {dod mi4 la8}~la[sol fad] mi[re dod]
   \tuplet 4/6 {re fad4 si8}~si[la sol] fad[mi re]

   %31
   \tuplet 4/6 {mi sol4 dod8}~dod[si la] sol[fad mi]\mbreak
   fad4. r la(si4) sol8
   fad[mi] re mi[re] dod re4. la'

   %34
   sold8[fad mi] fa4. mi8[re dod] re4.
   dod8[si la] mi'4. fa8[mi fa] fad4.
   sol8[fad mi] sold4. la r

   %37
   la, sol' fad8[la sol] fad[mi] re\mbreak
   mi4. dod re2.
   R1.*5

   %44
   r2. fad4. fad
   fad8 [re] mi fad4 fad8 fad4. si,
   si'4. si si8 [sol] la si4 si8

   %47
   si4. mi, r fa4 mi8
   red4.~red8 dod [si] la'4.~la8 sold [fad]
   sold4.~sold8 [fad mi]\mbreak re4.~re8 [do si]

   %50
   do [si la] la' [sol fad] sol [fad] mi red4 mi8
   mi4. r sol fad
   mid~mid8 red [dod] si'4.~si8 la [sold]

   %53
   la [dod si] la [sold] fad mid4.~mid4 fad8
   fad1.

}

XtestoII = \lyricmode {

   Go - - - - - - - - - - di pur ch’il caro _ caro _ sposo _
   già fa -- stoso, _
   sempre _ fido _ t’ame - rà - - - - - - - - - - - - - - - - - - sempre _ fi -- do
   t’a -- me -- rà.
   
   Go - - - - - - - - di pur ch’il caro _ caro _ sposo _
   già fa -- stoso, _ caro _ sposo _
   sempre _ fido _ t’ame - rà - - - - - - - - - - - - - - - - sem -- pre fi -- do
   t’a -- me -- rà - - - - - - - - - - - - sempre _ fi - do t’a -- me -- rà.
   
   E mi -- ran -- do_il vago _ viso _
   tutto _ riso _ tutto _ riso _ 
   in lui sol si spec -- chie -- rà - - - - 
   si spec -- chie -- rà in lui sol si spec -- chie -- rà - si spec -- chie -- rà.

}

Xbcn = \relative do {

   re4 r8 re4 r8 re4 r8 re4 r8
   re4 r8 re4 r8 re4 r8 re4 r8
   re4 r8 re4 r8 re4 r8 re4 r8

   %4
   re4 r8 re4 r8 re4 r8 re4 r8
   la'4 la8 la4 la8 la4 la8 la4 la8
   la4 la8 la4 la8 la4 la8 sold4 r8

   %7
   la4 r8 mi4 r8 la,2.\mbreak
   re4 r8 re4 r8 re4 r8 re4 r8
   re4 r8 re4 r8 re4 r8 re4 r8

   %10
   re4 r8 re4 r8 re4 r8 re4 r8
   re4 r8 re4 r8 re4 r8 re4 r8
   re4 r8 re4 r8 re4 r8 re4 r8

   %13
   re4 r8 re4 r8 re4 r8 re4 r8
   re4 r8 sold,4 r8\mbreak la4 r8 la4 r8
   la4 r8 la4 r8 la4 r8 la4 r8

   %16
   la4 r8 la4 r8 la4 r8 la4 r8
   mi'4 r8 mi4 r8 mi4 r8 mi4 r8
   mi4 r8 mi4 r8 mi4 r8 mi4 r8

   %19
   mi4 r8 mi4 r8 la,4 r8 dod4 r8
   re4 r8 mi4 r8 la,2._\fermata\mbreak
   re4 r8 re4 r8 re4 r8 re4 r8

   %22
   re4 r8 re4 r8 re4 r8 re4 r8
   re4 r8 re4 r8 re4 r8 la4 r8
   la4 r8 la4 r8 la4 r8 re4 r8

   %25
   fad4 r8 sol4 r8 la4 r8 re,4 r8
   fad4 r8 sol4 r8 la4 r8 re,4 r8\mbreak
   re4 r8 re4 r8 re4 r8 re4 r8

   %28
   sol,4 r8 sol4 r8 sol4 r8 sol4 r8
   la4 r8 la4 r8 la4 r8 la4 r8
   si4 r8 si4 r8 si4 r8 si4 r8

   %31
   dod4 r8 dod4 r8 dod4 r8 dod4 r8\mbreak
   re4 r8 re4 r8 dod4 r8 dod4 r8
   re4 r8 la'4 r8 re,4 r8 fad4 r8

   %34
   mi4 r8 re4 r8 dod4 r8 si4 r8
   la4 r8 la4 r8 la4 r8 la4 r8
   la4 r8 la4 r8 la4 r8 la4 r8

   %37
   la4 r8 la4 r8 re4 r8 re4 r8\mbreak
   sol,4 r8 la4 r8 re4 r8 re4 r8
   re4 r8 re4 r8 re4 r8 re4 r8

   %40
   re4 r8 re4 r8 re4 r8 re4 r8
   re4 r8 la4 r8 re4 r8 re4 r8
   re4 r8 re4 r8 re4 r8 re4 r8

   %43
   la4 r8 la4 r8 re4 re8 la'4 la,8\mbreak
   re2.\fermata si4 r8 si4 r8
   si4 r8 si4 r8 si4 r8 si4 r8

   %46
   mi4 r8 mi4 r8 mi4 r8 mi4 r8
   mi4 r8 sol4 r8 la4 r8 la4 r8
   si,4 r8 si4 r8 si4 r8 si4 r8

   %49
   mi4 r8 mi4 r8\mbreak mi4 r8 mi4 r8
   la,4 r8 red4 r8 mi4 r8 si4 r8
   mi4 r8 mi4 r8 si4 r8 si4 r8

   %52
   dod4 r8 dod4 r8 dod4 r8 dod4 r8
   fad4 r8 fad4 r8 dod'4 r8 dod,4 r8
   fad1.\fermata

}

Xbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 12/8
   \key re\major
   \tempo 1 = 50
   s1.*54
   \bar "||"
   \mark\markup "D.C."

}

XvlI = {
   <<\XvlIn \forma>>

}

Xvla = {
   \clef alto
   <<\Xvlan \forma>>

}

Xalto = {
   \new Voice = "godi"
   <<\Xalton \forma>>
}

Xbc = {
   \clef bass
   <<\Xbcn \forma \Xbfn>>
}




XIsopranon = \relative do'' {

   \autoBeamOff

   r4 r8 sol si si do re
   sol, sol r4 si8 si16 si la8 sol
   do do r16 do sib do\mbreak la4 r8 fa

   %4
   si si si do sol sol r4
   R1*3
   do8 do16 do do8 re\mbreak sib sib r sol

   %9
   do do do re sib sib sib la
   la la r4\mbreak do8 do16 do sib8 do
   re re sib la fa fa r4\fermata

}

XItestoI = \lyricmode {

   Al vez--zo, al guar -- do,_al brio _
   s’ac -- cende - ran più sempre _
   nel Regio _ sen l’a  -- ma -- bili _ fa -- ville. _

   Parmi _ già_u -- dir lo sposo, _
   che fis -- so_in que’ be -- gl’oc -- chi sì lu -- centi _
   vada _ scio -- glien -- do_il la -- bro_in que -- sti_ac -- centi. _

}

XIalton = \relative do' {

   \autoBeamOff

   R1*4
   sol'8 sol sol mi16 mi dod8 dod r4\mbreak
   r8 mi re mi fa fa r4
   fa8 re sold sold16 la mi8 mi r4
   R1*4

}

XItestoII = \lyricmode {

   Eli - tro -- pio_a -- mo -- roso _ a que’ bei rai _
   for -- za_ac -- quista _ l’af -- fetto. _

}

XIbcn = \relative do {

   sol1~
   sol
   mi'2 fa~

   %4
   fa sol4 do,~
   do2 sol'~
   sol re~

   %7
   re mi4 la,~
   la2 mi'~
   mi1

   %10
   fa2~fa
   sib, do4 fa,\fermata

}

XIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*11
   \bar "|."

}

XIsoprano = {
   \new Voice = "vezzo"
   <<\XIsopranon \forma>>
}

XIalto = {
   \new Voice = "amoroso"
   <<\XIalton \forma>>
}

XIbc = {
   \clef bass
   <<\XIbcn \forma \XIbfn>>
}





XIIvlIn = \relative do'' {

   sol4. sib8(la sol)
   re'4. re
   sol, sib8(la sol)

   %4
   sol'4. sib,8 la sol
   fad'4. do8 sib la
   la'4. do,8 sib la

   %7
   \con \tuplet 4/6 { sib8. la16 sol4 }
   sol4. sib8 la sol
   re'4. re

   %10
   sol, sib8 la sol
   mib'4. mib\mbreak
   sol,4. sib8 la sol

   %13
   fad'4. do8 sib la
   la'4. do,8 sib la
   sib4 sol'8 la,4 fad'8

   %16
   sol4. r4 r8
   sol,4.\p sib8 la sol
   re'4. re

   %19
   sol, sib8 la sol
   re'4. re
   sol,8[re' do] sib la sol\mbreak

   %22
   fad4 mi!8 re4.
   sib'4. re8 do sib
   fa'4. fa

   %25
   sib,4. re8 do sib
   fa'4. fa
   sib,8 re do re do sib

   %28
   do sib la sib4 re8
   re4. do
   re fa8 mib re

   %31
   R2.*9
   sol,4.\f sib8 la sol
   re'4. re

   %42
   sol,4. sib8 la sol\mbreak
   sol' fa mib re mib do
   sib do la sol4.

   %45
   sol4.\p sib8 la sol
   re'4. re
   sol,4. sib8 la sol

   %48
   re'4. re
   sol,8 re' do sib la sol
   fad4 do'8 mib re do

   %51
   sib4. r
   sol'4. sib8 la sol\mbreak
   sol4. r

   %54
   la4. do8 sib la
   sol4. r
   la,, r

   %57
   sib r
   do dod
   re4 la''8 fad8 mi re

   %60
   la do sib do re mib?
   mib4. fad,\mbreak
   la8 do sib do re mib

   %63
   mib4. fad,
   do' do4 la8
   sib re do sib la sol

   %66
   la4. fad
   sol r
   la8 do sib do re mib

   %69
   mib4. fad,
   la8 do sib do re mib
   mib4. fad,\mbreak

   %72
   do' do4 do8
   sib re do sib la sol
   la4. fad

   %75
   sol4.\f sib8 la sol
   re'4. re
   sol, sib8 la sol

   %78
   la'4. do,8 sib la
   \con \tuplet 2/3 { sib8. la16} sol4.
   sol4. sib8 la sol

   %81
   re'4. re
   sol, sib8 la sol\mbreak
   mib'4. mib

   %84
   sol, sib8 la sol
   fad'4. do8 sib la
   la'4. do,8 sib la

   %87
   sib4 sol'8 la,4 fad'8
   sol2.\fermata
   R2.*4

   %93
   lab,4.\p do4 lab8\mbreak
   sol[lab sib] mib,4.
   sib' re4 sib8

   %96
   la?[sib do] fa,4 mib'8
   re4. do
   re fa8 mib re

   %99
   re4. fa8 mib re
   mib4. sol8 fa mib
   re4. fa8 mib re

   %102
   mib4. r
   R2.*2\mbreak
   mib4. sol8 fa mib

   %106
   fa4. re
   do2.\fermata

}

XIIvlIIn = \relative do'' {

   R2.
   sol4. sib8(la sol)
   re'4. re

   %4
   sib re8 do sib
   la4. la8 sol fad
   fad'4. la,8 sol fad

   %7
   \con  \tuplet 4/6 { sol8. fad16 sol4 }
   R2.
   sol4. sib8 la sol

   %10
   re'4. re
   sol, sib8 la sol\mbreak
   mib'4. mib

   %13
   re la8 sol fad
   fad'4. la,8 sol fad
   sol4 sib8 la4 la8

   %16
   sol4. r
   R2.
   sol4.\p sib8 la sol

   %19
   re'4. re
   sol, sib8 la sol
   re'4. re8 do sib\mbreak

   %22
   la4. la
   R2.
   sib4. re8 do sib

   %25
   fa'4. fa
   sib, re8 do sib
   fa' fa mib fa mib re

   %28
   la sol fa re'4 do8
   sib4. la
   sib re8 do sib

   %31
   R2.*10
   sol4.\f sib8 la sol
   re'4. re\mbreak

   %43
   mib8 re do sib do la
   sol la fad sol4.
   R2.

   %46
   sol4.\p sib8 la sol
   re'4. re
   sol, sib8 la sol

   %49
   re'4. re8 do sib
   la4 la8 do sib la
   sol4. r

   %52
   mib' sol8 fa mib\mbreak
   mib4. r
   fad la8 sol fad

   %55
   sib4. r
   la,, r
   sib r

   %58
   do dod
   re4 fad'8  do4 la8
   R2.

   %61
   la8 do sib do re mib\mbreak
   mib4. fad,
   la8 do sib do re mib

   %64
   mib4. fad,
   sol8 sib do re do sib
   do4. la

   %67
   sol r
   fad r
   la8 do sib do re mib

   %70
   mib4. fad,
   la8 do sib do re mib\mbreak
   mib4. fad,

   %73
   sol8 sib do re do sib
   do4. la
   sol r

   %76
   sol\f sib8 la sol
   re'4. re
   fad la,8 sol fad

   %79
   \con \tuplet 2/3 { sol8. fad16} sol4.
   R2.
   sol4. sib8 la sol

   %82
   re'4. re\mbreak
   sol, sib8 la sol
   mib'4. mib

   %85
   re la8 sol fad
   fad'4. la,8 sol fad
   sol4 sib8 la4 la8

   %88
   sib2.\fermata
   R2.*4
   fa4.\p lab4 fa8\mbreak

   %94
   sib4. sol
   sol sib4 sol8
   do4. la4 do8

   %97
   sib4. la
   sib re8 do sib
   si4. re8 do si

   %100
   do4. mib8 re do
   si4. re8 do si
   do4. r

   %103
   R2.*2
   do4. mib8 re do
   re4. si

   %107
   do2.\fermata

}

XIIvlan = \relative do' {

   sib4. r
   sib4. r
   sib4. r

   %4
   re r
   re r
   re r

   %7
   re re
   sib4. r
   sib4. r

   %10
   sib4. r
   sib4. r\mbreak
   sib4. r

   %13
   la r
   re r
   re4 re8 re4 re8

   %16
   sib4. r
   R2.*23
   sib4. r

   %41
   sib4. r
   sib4. r\mbreak
   do re

   %44
   re re
   R2.*30
   sib4. r

   %76
   sib4. r
   sib4. r
   re re

   %79
   re re
   sib4. r
   sib4. r

   %82
   sib4. r\mbreak
   sib4. r
   do r

   %85
   la fad'
   la, fad'
   re4 re8 re4 re8

   %88
   re2.\fermata
   R2.*4
   re2.\mbreak

   %94
   mib4. mib,
   mi'2.
   fa4. fa,

   %97
   sib4 mib?8 fa4 fa,8
   sib4. r
   R2.*9

}

XIIsopranon = \relative do'' {

   \autoBeamOff

   R2.*16
   sol4. sib8 [la] sol
   re'4. re

   %19
   sol, sib8 [la] sol
   re'4. re
   sol,8[re' do] sib [la] sol\mbreak

   %22 OOKK
   fad4 (mi!8) re4.
   la'4. la4 la8
   la do[sib] la4.

   %25
   la la4 la8
   la do[sib] la4.
   la8[fa' mib] re[do] sib

   %28
   la[sol fa] sib4 mib8
   re4. do
   sib4.~sib4 fa8

   %31
   sol[fa mib] mib[fa sol]\mbreak
   la[sol fa] fa[sol la]
   sib[la sol] sol[la sib]

   %34
   do[sib la] la[sib do]
   re[do sib] sib[do re]
   mib[re do] sib[la sol]

   %37
   fa4. r8 r mib'
   re4. do
   sib2.

   %40
   R2.*5
   sol4. sib8 [la] sol
   re'4. re

   %47
   sol,4. sib8 [la] sol
   re'4. re
   sol,8 [re' do] sib [la] sol

   %50
   fad4(mi8) re4.
   re'8[do sib] la[sol] fa?
   mib?4. mib\mbreak

   %53
   mib'8[re do] sib[la] sol
   fad4. ~fad4 la8
   sib[sol fad] sol[la sib]

   %56
   do[la sol] la[sib do]
   re[sib la] sib[do re]
   mib[re do] sib[la sol]

   %59
   fad4. r
   la8[do sib] do[re] mib
   mib4. fad,\mbreak

   %62
   la8 [do sib] do [re] mib
   mib4. fad,
   do' do4 la8

   %65
   sib re [do] sib [la] sol
   la4. fad
   sol r

   %68
   la8 [do sib] do [re] mib
   mib4. fad,
   la8 [do sib] do [re] mib

   %71
   mib4. fad,\mbreak
   do' do4 do8
   sib re [do] sib [la] sol

   %74
   la4. fad
   sol2.
   R2.*13

   %89
   fa4. la8[sol] fa
   sib4. fa
   sib re8[do] sib

   %92
   la4(sol8) fa4.
   lab4. do4 lab8\mbreak
   sol[lab sib] mib,4.

   %96
   sib' re4 sib8
   la?[sib do] fa,4 mib'8
   re4. do

   %99
   sib2.
   si4. si4 si8
   do[sib lab] sol4 do8

   %102
   fa,4.~fa4 re'8
   mib,[sol fa] mib[re do]
   lab'[do sib] lab[sol fa]

   %105
   si[re do] si[la sol]\mbreak
   do4 do,8 r r do'
   re4. si

   %108
   do2.\fermata

}

XIItestoI = \lyricmode {

   Ca -- re pu -- pille _
   tra mille_e _ mille _
   de -- gne voi sie -- te de -- gne voi sie - te
   pu -- pille _ ca - re
   de --  gne voi sie -- te
   sol di re -- gnar, - - - - - - - - - - - - - - 
   sol di re -- gnar.
   
   Ca -- re pu -- pille _
   tra mille_e _ mille _
   tra mille_e _ mil -- le 
   de --  gne ben sie -- te
   sol di re -- gnar, - - - - - - - - - -
   ca - re ca -- re ca -- re pu -- pille _ 
   de --  gne ben sie -- te -
   sol di re -- gnar, tra mille_e _ mille _ 
   ca -- re pu -- pille _ de --  gne ben sie -- te -
   sol di re -- gnar.
   
   
   Co -- me mi piace _ 
   con egual _ fa -- ce
   amor _ e re -- gno amor _ e Re -- gno
   ve -- drò bril -- lar,
   con egual _ fa -- ce
   a -- mor e re - - - - - - gno 
   ve -- drò bril -- lar.

}

XIIbcn = \relative do {

   sol4. r
   sol r
   sol r

   %4
   sol r
   re' r
   re r

   %7
   sol  sol,
   sol r
   sol r

   %10
   sol r
   sol r\mbreak
   sol r

   %13
   re' r
   re r
   sol,4 sol'8 re4 re,8

   %16
   sol4. r
   sol r
   sol r

   %19
   sol r
   sol r
   sol sol\mbreak

   %22
   re' re,
   re' r
   sib r

   %25
   sib r
   sib r
   sib sib

   %28
   fa' re4 la8
   sib4 mib8 fa4 fa,8
   sib4. sib

   %31
   mib r\mbreak
   fa r
   sol r

   %34
   la r
   sib r
   do r

   %37
   la8 do sib la sol fa
   sib4 mib,8 fa4 fa,8
   sib2.

   %40
   sol4. r
   sol r
   sol r\mbreak

   %43
   sol' sol,
   re' sol,
   sol r

   %46
   sol r
   sol r
   sol r

   %49
   sol' sol,
   re' re,
   sib' sib

   %52
   do do\mbreak
   do do
   re re

   %55
   sol, r
   R2.*3
   re'4. re

   %60
   re r
   re r\mbreak
   re r

   %63
   re r
   re re
   sol sol,

   %66
   do re
   sol, r
   re' r

   %69
   re r
   re r
   re r\mbreak

   %72
   re re
   sol sol,
   do re

   %75
   sol, r
   sol r
   sol r

   %78
   re' re,
   sol' sol,
   sol r

   %81
   sol r
   sol r\mbreak
   sol r

   %84
   do r
   re re,
   re' re,

   %87
   sol4 sol'8 do,4 re8
   sol,2.\fermata
   sol4. fa'

   %90
   re8 do sib re do sib
   sib4. sib
   fa' fa,

   %93
   R2.*5
   sib4. sib
   sol' sol,

   %100
   do do
   re sol,
   do r

   %103
   fa r
   sol r
   do, do

   %106
   fa, sol
   do2.\fermata

}

XIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s2.*10
   <6->2.
   s
   <_+>

}


forma = {

   \time 6/8
   \key sol\minor
   \tempo 2. = 60
   s2.*107
   \bar "||"
   \mark\markup "D.C."

}

XIIvlI = {
   <<\XIIvlIn \forma>>

}

XIIvlII = {
   <<\XIIvlIIn \forma>>

}

XIIvla = {
   \clef alto
   <<\XIIvlan \forma>>

}

XIIsoprano = {
   \new Voice = "pupille"
   <<\XIIsopranon \forma>>
}

XIIbc = {
   \clef bass
   <<\XIIbcn \forma \XIIbfn>>
}





XIIIvlIn = \relative do'' {

}

XIIIvlIIn = \relative do'' {

}

XIIIvlan = \relative do' {

}

XIIIsopranon = \relative do'' {

   \autoBeamOff
   
   R1*9
   r2 do8 do16 do la8 do\mbreak
   fa,16 fa fa8 r la do do mib re
   
   %12
   sib sib r16 sib do re sol,4 r16 sib mib do
   la4 r8 sib\mbreak fa fa r4
   R1*4
   
}

XIIItestoI = \lyricmode {
   
   Di fortu - na -- ti_aus --  pi -- cii: _
   se -- condi_il _ sommo _ Giove, _
   che rende_i  _ re al par di lui fe -- lici. _

}

XIIIalton = \relative do' {

   \autoBeamOff
   
   r4 r8 la' fa fa fa mi
   mi mi r16 mi mi fa sol8 sol sol  la16 sib
   mi,8 mi r mi\mbreak sol sol r sib
   
   %4
   sol sol sol fa re4 r
   la' la8 la fad fad r la
   fad fad sol la\mbreak re, re r re
   
   %7
   sol sol r sol16 la fa4 r
   fa4 fa8 mi do16 do do8 r sol'16 la\mbreak
   la8 la r fa re re fa mi16 fa
   
   %10
   do do do8 r4 r2
   R1*2
   r2 r4 r16 fa16 fa sib
   
   %14
   mi,8 mi r4 mi8 fa sol fa16 mi
   fa8 fa r4 fa8 fa16 fa fa8 mi\mbreak
   do do r4 la'8 la la sol16 la
   
   %17
   fa4 la8 sold16 la mi8 mi r4\fermata
   
}

XIIItestoII = \lyricmode {
   
   Da_in -- nesto _ co -- sì_au -- gusto _
   formar _ ve -- dransi _ alti _ ram -- polli _ a’ quali _ 
   for -- tuna _ ce -- derà. _ Già nel vo -- lume _
   del fato _ stan des -- critte _
   le gesta, _ le virtù, _ l’alte _ me -- mo -- rie, _
   i tri -- onfi, _ l’im -- prese _ e le vit -- to -- rie. _

   De’ Gigli _ d’oro _ sotto _ l’ombra _ a -- mena _
   fido _ ri -- covro _ stassi _
   ove _ gode - si_o -- gnor pace _ se -- rena. _

}

XIIIbcn = \relative do {
   
   fa1
   do
   dod2~dod~
   
   %4
   dod re~
   re do?~
   do~do
   
   %7
   si1
   sol2 do
   fa sib,
   
   %10
   do4 fa,~fa2~
   fa1
   sib2 mib~
   
   %13
   mib fa4 sib,
   dod1
   sold
   
   %16
   la
   re2 mi4 la,\fermata

}

XIIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*17
   \bar "|."
   
}

XIIIvlI = {
   <<\XIIIvlIn \forma>>

}

XIIIvlII = {
   <<\XIIIvlIIn \forma>>

}

XIIIvla = {
   \clef alto
   <<\XIIIvlan \forma>>

}

XIIIsoprano = {
   \new Voice = "auspici"
   <<\XIIIsopranon \forma>>
}

XIIIalto = {
   \new Voice = "innesto"
   <<\XIIIalton \forma>>
}

XIIIbc = {
   \clef bass
   <<\XIIIbcn \forma \XIIIbfn>>
}





XIVvlIn = \relative do'' {

   fa,8[(do') la(mi)]
   fa4. re'8
   do32(sib la8.) sib32(la sol8.)

   %4
   la32(sol fa8.)~fa8 fa'
   mi32(re do8.) sib32(la sol8.)
   la32(sol fa8.)~fa4

   %7
   do' sib16(la) sol(fa)
   \terzine\senza\tuplet 3/2 { sol(fa mi fa[mi re)] } do4
   do' sib16(la) sol(fa)

   %10
   \tuplet 3/2 { sol(fa mi fa[mi re)] } do4\mbreak
   fad4 fad
   fad?32[(sol la sol] fad!8) do'32[(re mib re] do8)

   %13
   fad,32[(sol la sol] fad8) do'32[(re mib re] do8)
   sib8 [la] sol4
   sold sold

   %16
   la8~[la16 sol32 (fa)] mi4
   fa8~[fa16 mi32 (re)] do4
   re8~[re16 do32 (si)] la8 re'

   %19
   do32 (si la8.) si32 (la sold8.)\mbreak
   la8(fa4) re'8
   do32(si la8.) si32(la sold8.)

   %22
   la2
   fa8\p[do' la mi]
   fa4. re'8

   %25
   do32[sib la8.] sib32[la sol8.]
   la32[sol fa8.]~fa8 fa'
   mi32(re do8.) sib32(la sol8.)

   %28
   la32 sol fa8.~fa4
   do' sib16(la sol fa)\mbreak
   \tuplet 3/2 { sol fa mi fa[mi re] } do4

   %31
   do' sib16 la sol fa
   \tuplet 3/2 { sol fa mi fa[mi re] } do4
   fad fad

   %34
   fad?32[sol la sol] fad!8 do'32[re mib re] do8
   fad,32[sol la sol] fad8 do'32[re mib re] do8
   sib8 [la] sol4

   %37
   sold sold
   la8~[la16 sol32 fa] mi4\mbreak
   fa8~[fa16 mi32 re] do4

   %40
   re8~[re16 do32 si] la8 re'
   do32 si la8. si32 la sold8.
   la8(fa4) re'8

   %43
   do32 si la8. si32 la sold8.
   la2
   fa16\f[(fa' mi re do sib la mi)]

   %46
   fa4. re'8
   do32(sib la8.) sib32(la sol8.)\mbreak
   la32(sol fa8.)~fa4

   %49
   fa8\p[do' la mi]
   fa4. re'8
   do32[sib la8.] sib32[la sol8.]

   %52
   la32[sol] fa8.~fa8 fa'
   do32[sib la8.] sib32[la sol8.]
   la32 sol fa8.~fa4

   %55 due battute alla fine di p. 40
   mib4 mib
   mib32[re do8.] la'32[sol fa8.]\mbreak
   do'32[sib la8.] mib32[re do8.]

   %58
   re32[do sib8.]~sib4
   fa'4 fa
   fa32[mi? re8.] si'32[la sol8.]

   %61
   re'32[do si8.] fa32[mi re8.]
   mi32[re do8.]~do4
   do sib'?

   %64
   la8 \appoggiatura sol8 fa4.\tr
   sib8 \appoggiatura la8 sol4.\tr
   la8 \appoggiatura sol8 fa4.\tr\mbreak

   %67
   sib8 sol4.\tr
   lab4 si
   do sib!

   %70
   la32[sol fa8.] sol32[fa mi8.]
   fa4 fa'
   R2*5\mbreak

   %77
   fa,8[(do') la(mi)]
   fa4. re'8
   do32(sib la8.) sib32(la sol8.)

   %80
   la32(sol fa8.)~fa8 fa'
   mi32(re do8.) sib32(la sol8.)
   la32(sol fa8.)~fa4

   %83
   do4 sib'
   la8 \appoggiatura sol8 fa4.\tr
   sib8 \appoggiatura la8 sol4.\tr

   %86
   la8 \appoggiatura sol8 fa4.\tr
   sol32[(la sib la] sol8) fa32[(sol la sol] fa8)\mbreak
   mi32[(fa sol fa] mi8) re32[mi fa mi] re8

   %89
   do4 lab'
   si do
   la32(sol fa8.) sol32(fa mi8.)

   %92
   \appoggiatura mi8 fa2\fermata
   re4\p sib'
   dod,8 \noBeam dod(re4)

   %95
   r8 sib' [la sol]
   fa16[mi re dod] re4\mbreak
   fad32[sol la8.] re,32[mi fad8.]

   %98
   sol32[(la sib8.)]~sib8 la
   sold32[la si8.] mi,32[fad sold8.]
   la32[si do8.]~do4

   %101
   re, si'
   sold32[la si la] sold8 mi32[fad sold fad] mi8
   la8.[sol32 fa] mi8 do'\mbreak

   %104
   la4(sold8\tr) la
   la2
   re,4 la'

   %107
   sib32[la sol8.] la32[sol fad8.]
   sol4 mib
   re32[do sib8.] do32[sib la8.]

   %110
   sib8[re sol do]
   sib4(la8\tr) sol
   \parenthesize sol2\fermata

}

XIVvlan = \relative do' {

   fa,8[(do') la(mi)]
   fa4. re'8
   do32(sib la8.) sib32(la sol8.)

   %4
   la32(sol fa8.)~fa8 fa'
   mi32(re do8.) sib32(la sol8.)
   la32(sol fa8.)~fa4

   %7
   do' sib16(la) sol(fa)
   \terzine\senza\tuplet 3/2 { sol(fa mi fa[mi re)] } do4
   do' sib16(la) sol(fa)

   %10
   \tuplet 3/2 { sol(fa mi fa[mi re)] } do4\mbreak
   fad4 fad
   fad?32[(sol la sol] fad!8) do'32[(re mib re] do8)

   %13
   fad,32[(sol la sol] fad8) do'32[(re mib re] do8)
   sib8 [la] sol4
   sold sold

   %16
   la8~[la16 sol32 (fa)] mi4
   fa8~[fa16 mi32 (re)] do4
   \parenthesize re \parenthesize la'8 re

   %19
   do32 (si la8.) si32 (la sold8.)\mbreak
   la8(fa4) re'8
   do32(si la8.) si32(la sold8.)

   %22
   la2
   R2*22
   fa16\f[(fa' mi re do sib la mi)]

   %46
   fa4. re'8
   do32(sib la8.) sib32(la sol8.)\mbreak
   la32(sol fa8.)~fa4

   %49
   R2*28

   %77
   fa8[(do') la(mi)]
   fa4. re'8
   do32(sib la8.) sib32(la sol8.)

   %80
   la32(sol fa8.)~fa8 fa'
   mi32(re do8.) sib32(la sol8.)
   la32(sol fa8.)~fa4

   %83
   do4 sib'
   la8 \appoggiatura sol8 fa4.\tr
   sib8 \appoggiatura la8 sol4.\tr

   %86
   la8 \appoggiatura sol8 fa4.\tr
   sol32[(la sib la] sol8) fa32[(sol la sol] fa8)\mbreak
   mi32[(fa sol fa] mi8) re32[mi fa mi] re8

   %89
   do4 lab'
   si do
   la32(sol fa8.) sol32(fa mi8.)

   %92
   \appoggiatura mi8 fa2\fermata
   R2*20

}

XIValton = \relative do' {

   \autoBeamOff

   R2*22
   fa8[do' la] mi
   fa4. re'8

   %25
   do32[sib la8.] sib32[la sol8.]
   la32[sol] fa8.~fa8 re'
   do32[sib la8.] sib32[la sol8.]

   %28
   la32[sol] fa8.~fa4
   do' sib16[(la] sol [fa)]\mbreak
   \tuplet 3/2 { sol [fa mi] fa[mi re] } do4

   %31
   do' sib16 [\parenthesize (la] sol [fa)]
   \tuplet 3/2 { sol [fa mi] fa[mi re] } do4
   fad fad

   %34
   fad?32[sol la sol] fad!8 do'32[re mib re] do8
   fad,32[sol la sol] fad8 do'32[re mib re] do8
   sib8 [la] sol4

   %37
   sold sold
   la8~[la16 sol32 fa] mi4\mbreak
   fa8~[fa16 mi32 re] do4

   %40
   re8~[re16 do32 si] la8 re'
   do32 [si la8.] si32 [la sold8.]
   la8(fa4) re'8

   %43
   do32 [si la8.] si32 [la sold8.]
   la2
   R2*4

   %49
   fa8[do' la] mi
   fa4. re'8
   do32[sib la8.] sib32[la sol8.]

   %52
   la32[sol] fa8.~fa8 re'
   do32[sib la8.] sib32[la sol8.]
   la32[sol] fa8.~fa4

   %55
   mib4 mib
   mib32[re do8.] la'32[sol fa8.]\mbreak
   do'32[sib la8.] mib32[re do8.]

   %58
   re32[do] sib8.~sib4
   fa'4 fa
   fa32[mi? re8.] si'32[la sol8.]

   %61
   re'32[do si8.] fa32[mi re8.]
   mi32[re] do8.~do4
   do sib'?

   %64
   la8 \appoggiatura sol8 fa4.\tr
   sib8 \appoggiatura la8 sol4.\tr
   la8 \appoggiatura sol8 fa4.\tr\mbreak

   %67
   sib8 sol4.\tr
   lab4 si
   do sib!

   %70
   la32[sol fa8.] sol32[fa mi8.]
   fa4 r
   sol32[la sib la sol8] fa32[sol la sol fa8]

   %73
   mi32[fa sol fa mi8] re32[mi fa mi re8]
   do4 sib'
   la32[sol fa8.] sol32[fa mi8.]

   %76
   fa2\mbreak
   R2*16
   re4 sib'

   %94
   dod,8 \noBeam dod(re4)
   r8 sib' la sol
   fa16[mi re dod] re4\mbreak

   %97
   fad32[sol la8.] re,32[mi fad8.]
   sol32[(la sib8.)]~sib8 la
   sold32[la si8.] mi,32[fad sold8.]

   %100
   la32[si] do8.~do4
   re, si'
   sold32[la si la] sold8 mi32[fad sold fad] mi8

   %103
   la8.[sol32 fa] mi8 do'\mbreak
   la4(sold8\tr) la
   la2

   %106
   re,4 la'
   sib32[la sol8.] la32[sol fad8.]
   sol4 mib

   %109
   re32[do sib8.] do32[sib la8.]
   sib8[re sol] do
   sib4(la8\tr) sol

   %112
   \parenthesize sol2\fermata

}

XIVtestoII = \lyricmode {

   Al se -- ren d’a -- mi -- ca cal -- ma d’a -- mi -- ca cal -- ma
   di -- vien l’al - ma di -- vien l’al - ma
   bel tro --  fe  - - - - - - - - o bel tro --  fe - - - - o d’a -- mo -- re_e fé, d’a -- mo -- re_e fé.
   
   Al se -- ren d’a -- mi -- ca cal -- ma d’a -- mi -- ca cal -- ma
   di -- vien l’al - - - - ma di -- vien l’al - - - - ma bel tro --  fe - - - - - - - - - o
   d’a -- mo -- re_e fé,  bel tro --  fe - o d’a -- mo -- re_e fé.
   
   Splen -- de -- rà - più lumi - no -- so
   quel -- l'a -- ma -- bi -- le ri -- po -- so
   d’un a -- man - - - - - te cor mer -- cé,
   d’un a -- man - - - - - - te cor mer -- cé.

}

XIVbcn = \relative do {

   fa8_\markup\italic"Senza Cembali"[fa fa do]
   re[re re sib]
   do[do do do]

   %4
   fa8[fa fa sib,]
   do[do do do]
   fa[fa fa fa]

   %7
   fa[fa fa fa]
   do[do do do]
   fa[fa fa fa]

   %10
   do[do do do]\mbreak
   re[re re re]
   re[re re re]
   re[re re re]
   sol,[sol sol sol]
   mi'[mi re re]
   do[do do do]
   la[la la la]
   fa[fa fa re]
   mi[mi mi mi]\mbreak


   la[re re re]
   mi[mi mi, mi]

   %13
   la2
   fa'8\p[fa fa do]
   re[re re sib]

   %16
   do[do do do]
   fa8[fa fa sib,]
   do[do do do]

   %19
   fa[fa fa fa]
   fa[fa fa fa]
   do[do do do]

   %22
   fa[fa fa fa]
   do[do do do]
   re[re re re]

   %25
   re[re re re]
   re[re re re]
   sol,[sol sol sol]

   %28
   mi'[mi re re]
   do[do do do]\mbreak
   la[la la la]

   %31
   fa'[fa fa re]
   mi[mi mi mi]
   la,[re re re]

   %34
   mi[mi mi, mi]
   la2
   fa'8\f[fa fa do]

   %37
   re[re re sib]
   do[do do do]\mbreak
   fa[fa fa fa]

   %40
   fa\p[fa fa do]
   re[re re sib]
   do[do do do]

   %43
   fa[fa fa sib,]
   do[do do do]
   fa[fa fa fa]

   %46
   fa[fa fa fa]
   fa[fa fa fa]\mbreak
   fa[fa fa fa]

   %49
   sib,[sib sib sib]
   si[si si si]
   si?[si si si]

   %52
   si?[si si si]
   do[do do do]
   do[do do do]

   %55
   do[do do do]
   do[do do do]
   do[do do do]\mbreak

   %58
   do[do do do]
   fa[fa fa fa]
   mi[mi mi mi]

   %61
   fa[fa do do]
   fa[fa fa fa]
   mi[mi re re]

   %64
   do[do sib sib]
   la[la mi' mi]
   fa[fa do do]

   %67
   fa,2\mbreak
   fa'8\f[fa fa do]
   re[re re sib]

   %70
   do[do do do]
   fa[fa fa re]
   do[do do do]

   %73
   fa[fa fa fa]
   mi[do do do]
   do[do do do]

   %76
   do[do do do]
   fa[fa fa fa]
   mi[mi re re]\mbreak

   %79
   do do sib sib
   do do fa fa
   fa[fa mi mi]

   %82
   fa[fa do do]
   fa,2\fermata
   re'8\p [re sol sol]

   %85
   la[la fa fa]
   sol[sol dod, dod]
   re[re re re]\mbreak

   %88
   re[re do do]
   sib[la sol re']
   mi[mi re re]

   %91
   do[si la la]
   fa[fa re re]
   mi mi re re

   %94
   do[do' do la]\mbreak
   mi'[mi mi, mi]
   la'[la sol sol]

   %97
   fad[fad re re]
   sol,[sol re' re]
   sol,[sol fad fad]

   %100
   sol sol re' re
   sol,[sol mib' mib]
   re4 re,

   %103
   sol2\fermata

}

XIVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 2/4
   \key fa\major
   \tempo 2 = 48
   s2*112
   \bar "||"
   \mark\markup "D.C."

}

XIVvlI = {
   <<\XIVvlIn \forma>>

}

XIVvla = {
   \clef alto
   <<\XIVvlan \forma>>

}

XIValto = {
   \new Voice = "calma"
   <<\XIValton \forma>>
}

XIVbc = {
   \clef bass
   <<\XIVbcn \forma \XIVbfn>>
}




XVsopranon = \relative do'' {

   \autoBeamOff
   
   mi,8 mi16 mi la8 si do do do do16 si
   si8 si r4 fad8 fad fad fad16 sol
   la8 la r4 la la8\parenthesize la16 \parenthesize sol\mbreak
   
   %4
   mi4 r r2
   R1*3
   r2 si'8 si si si16 do\mbreak
   
   %9
   do8 do r16 do do si sol8 sol r si
   mi si r4 si8 do re re16 do\mbreak
   la8 la r4 do8 do do do16 do
   
   %12
   fad,8 fad r4 fad8 fad lad si16 dod\mbreak
   re4 si8 dod16 re la8 la r4\fermata
 
}

XVtestoI = \lyricmode {

   Già della _ regal _ pompa _
   stu -- pido_il _ mondo _ tut -- to_ am -- mi -- ra_e 
   loda _ l’al -- ta [ma -- es] -- tà.

   Vivan _ sempre _ be -- ati _
   gl’ec -- celsi _ nodi, _ e come _ 
   io li strinsi _ fra loro, _ 
   li rad -- doppi - no poi _
   e del -- l’o -- ro l’e -- tà torni _ fra noi. _

}

XValton = \relative do' {

   \autoBeamOff
   
   R1*3
   r4 r8 mi sol sol r4
   sol8 si sol sol16 fad fad8 fad r4\mbreak
   
   %6
   fad8 sold lad sold16 fad si8 si r fad
   fad? fad mi fad!\mbreak sol sol r16 sol lad si
   fad8 fad r4 r2
   
   %9
   R1*5
   
}

XVtestoII = \lyricmode {

   Se_il Cielo _ faus -- to_ar -- ride_a’ _ miei voti _
   mi vedran _ più fas -- tosa _
   col sem -- pre_in -- vit -- to_e -- roe _ l’au -- gusta _ sposa. _

}

XVbcn = \relative do {
   
   la1
   red~
   red2 \parenthesize la
   
   %4
   mi'1~
   mi2 lad,~
   lad re
   
   %7
   red mi
   fad4 si,~si2\mbreak
   fad 'sol
   
   %10
   sold1\mbreak
   la
   lad
   
   %13
   si,2 la4 re\fermata

}

XVbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 70
   s1*13
   \bar "|."

}

XVsoprano = {
   \new Voice = "pompa"
   <<\XVsopranon \forma>>
}

XValto = {
   \new Voice = "sempre"
   <<\XValton \forma>>
}

XVbc = {
   \clef bass
   <<\XVbcn \forma \XVbfn>>
}





XVIvlIn = \relative do'' {

   si8
   mi[si si si]
   do4 si8 mi
   do4 si8 la

   %4
   sol[fad sol mi]
   si'4 r8 si
   mi[si si mi]

   %7
   dod4 re8 mi
   dod4 re8 mi
   re[si dod lad]

   %10
   si4. si8\p
   mi[si si si]
   do4 si8 mi

   %13
   do4 si8 la
   sol[fad sol mi]
   si'4 r8 si

   %16
   mi[si si mi]
   dod4 re8 mi
   dod4 re8 mi

   %19
   re[si dod? lad]
   si4. si8
   mi[si si mi]\mbreak

   %22
   do8 [si do la]
   re[la la re]
   si[la si si]

   %25
   mi[si si si]
   do4 si8 mi
   do4 si8 mi

   %28
   red mi fad mi16 red
   mi4.

}

XVIvlIIn = \relative do'' {

   sol8
   si[sol sol sol]
   la4 sol8 si
   la4 sol8 fad

   %4
   mi[red mi sol]
   fad4 r8 sol
   si[sol sol si]

   %7
   lad4 si8 dod
   lad4 si8 dod
   si[re, mi dod]

   %10
   si4. sol'8\p
   si[sol sol sol]
   la4 sol8 si

   %13
   la4 sol8 fad
   mi[red mi sol]
   fad4 r8 sol

   %16
   si[sol sol si]
   lad4 si8 dod
   lad4 si8 dod

   %19
   si[re, mi dod]
   si4. sold'8
   si[sold sold si]\mbreak

   %22
   la[sold la la]
   la[fad fad la]
   sol[fad sol sol]

   %25
   si[sol sol sol]
   la4 sol8 si
   la4 sol8 sol

   %28
   fad sol la sol16 fad
   mi4.

}

XVIvlan = \relative do' {

   r8
   r sol[si sol]
   r sol[si sol]
   r mi'[mi si]

   %4
   si2
   si8[red mi sol,]
   r sol[si sol]

   %7
   r fad'[re dod]
   r fad[re dod]
   r fad,[sol fad]

   %10
   fad4. r8
   R2*9
   r4. r8

   %21
   R2*8
   r4.

}

XVIsopranon = \relative do'' {

   \autoBeamOff

   r8
   R2*9
   r4. si8
   mi si si si

   %12
   do4 si8 mi
   do4 si8 la
   sol fad sol mi

   %15
   si'4 r8 si
   mi si si mi
   dod4 re8 mi

   %18
   dod4 re8 mi
   re si dod? lad
   si4. si8

   %21
   mi si si mi\mbreak
   do8 [si] do la
   re la la re

   %24
   si[la] si si
   mi si si si
   do4 si8 mi

   %27
   do4 si8 mi
   red mi fad mi16 [red]
   mi4.

}


XVItestoI = \lyricmode {

   Ve -- drò sempre _ la pace _ la pace, _
   che tan -- to_io bra -- mo_o -- gnor,
   e_il ben che tan -- to piace, _ che piace  _ 
   a -- vrò per que -- sto_a -- mor.
   
   Del -- l’in -- no -- cenza _ ca -- ra
   go -- drà con -- tento_il _ cor
   né più di so -- rte a -- vara _ a -- vara _ 
   si ri -- vedrà_il _ ri -- gor.

}

XVIalton = \relative do' {

   \autoBeamOff

   r8
   R2*9
   r4. sol'8
   si sol sol sol

   %12
   la4 sol8 si
   la4 sol8 fad
   mi red mi sol

   %15
   fad4 r8 sol
   si sol sol si
   lad4 si8 dod

   %18
   lad4 si8 dod
   si re, mi dod
   si4. sold'8

   %21
   si sold sold si\mbreak
   la[sold] la la
   la fad fad la

   %24
   sol[fad] sol sol
   si sol sol sol
   la4 sol8 si

   %27
   la4 sol8 sol
   fad sol la sol16 [fad]
   mi4.

}

XVItestoII = \lyricmode {
   
   Ve -- drò sempre _ la pace _ la pace, _
   che tan -- to_io bra -- mo_o -- gnor,
   e_il ben che tan -- to piace, _ che piace  _ 
   a -- vrò per que -- sto_a -- mor.
   
   Del -- l’in -- no -- cenza _ ca -- ra
   go -- drà con -- tento_il _ cor
   né più di so -- rte a -- vara _ a -- vara _ 
   si ri -- vedrà_il _ ri -- gor.

}

XVIbcn = \relative do {

   r8
   r mi[sol mi]
   r mi[sol mi]
   r mi[sol red]

   %4
   mi2
   red8[si' sol mi]
   r mi[sol mi]

   %7
   r fad[si fad]
   r fad[si fad]
   si,[si mi fad]

   %10
   si,4. r8
   r mi[sol mi]
   r mi[sol mi]

   %13
   r mi[sol red]
   mi2
   red8[si' sol mi]

   %16
   r mi[sol mi]
   r fad[si fad]
   r fad[si fad]

   %19
   si,[si mi fad]
   si,4. r8
   r mi[sold mi]\mbreak

   %22
   r mi[la la,]
   r re[fad re]
   r re[sol sol,]

   %25
   r mi'[sol mi]
   r mi[sol mi]
   r mi[sol mi]

   %28
   si'[mi, la, si]
   mi,4.

}

XVIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 2/4
   \key mi\minor
   \tempo 2 = 65
   \partial 8 s8
   s2*9
   s4. \bar ":..:" s8
   s2*9
   s4. \bar ":..:" s8
   s2*8
   \once \override Score.RehearsalMark.extra-offset = #'(+0 . 0)
   \mark\markup\column\smaller{"Dopo terminata gli Istromenti la""replicano tutta una volta per parte"}
   s4.
   \bar":|."

}

XVIvlI = {
   <<\XVIvlIn \forma>>

}

XVIvlII = {
   <<\XVIvlIIn \forma>>

}

XVIvla = {
   \clef alto
   <<\XVIvlan \forma>>

}

XVIsoprano = {
   \new Voice = "pace1"
   <<\XVIsopranon \forma>>
}

XVIalto = {
   \new Voice = "pace2"
   <<\XVIalton \forma>>
}

XVIbc = {
   \clef bass
   <<\XVIbcn \forma \XVIbfn>>
}





XVIIvlIn = \relative do'' {

}

XVIIvlIIn = \relative do'' {

}

XVIIvlan = \relative do' {

}

XVIIsopranon = \relative do'' {

   \autoBeamOff

   r4 r8 sol si si si la
   la la r16 la la si sol8 sol r16 sol sol fad
   re8 re r4 r2

   %4
   R1*3
   r8 fad si si16 do do8 do r do
   la la la si sold sold r4

   %9
   sold?8 sold sold la16 si mi,4 r16 si' re do\mbreak
   la8 la r mi la la sol la
   fa fa la sold16 la mi8 mi r4\fermata

}

XVIItestoI = \lyricmode {

   Non tur -- bino _ giam -- mai _ no -- iose _ cure _
   sì bel ri -- poso. _ 
   
   Ar -- disce _ e tenta _
   ta -- lor fama _ bu -- giarda _
   of -- fuscar _ lo splendor _  qual vil va -- pore, _
   ma come _ presto _ nacque, _ ei così _ muore. _
 
}

XVIIalton = \relative do' {

   \autoBeamOff

   R1*2
   r2 la'8 re, r re\mbreak
   re re re dod dod dod r sol'

   %5
   mi mi re dod re re r si'
   sol sol la si fad fad r4\mbreak
   R1*5

}

XVIItestoII = \lyricmode {

   Vanti _ un co -- sì_il -- lu -- stre_af -- fetto _
   e -- terna _ la co -- stanza _ 
   et e -- mula _ la fede. _

}

XVIIbcn = \relative do {

   sol1
   dod
   re~

   %4
   re2 lad~
   lad si
   mi fad4 si,~

   %7
   si2 red~
   red re~
   re sold,

   %10
   la1
   re2 mi4 la,_\fermata

}

XVIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 70
   s1*11
   \bar "|."

}

XVIIvlI = {
   <<\XVIIvlIn \forma>>

}

XVIIvlII = {
   <<\XVIIvlIIn \forma>>

}

XVIIvla = {
   \clef alto
   <<\XVIIvlan \forma>>

}

XVIIsoprano = {
   \new Voice = "cure"
   <<\XVIIsopranon \forma>>
}

XVIIalto = {
   \new Voice = "affetto"
   <<\XVIIalton \forma>>
}

XVIIbc = {
   \clef bass
   <<\XVIIbcn \forma \XVIIbfn>>
}





XVIIIvlIn = \relative do'' {
   sol'8
   do[mi, fa sol]
   fa4\tr mi8 sol
   fa4\tr mi8 re

   %4
   mi[re16(mi) fa(mi) re(do)]
   sol'8[sol sol la16 si]
   do8[do do si16 la]

   %7
   sol4 do,8 sol'
   fa4\tr mi8 sol
   fa4\tr mi8 do'

   %10
   fa,[mi16 fa sol8 sol,]
   do4 r8 sol'\p\mbreak
   do[mi, fa sol]

   %13
   fa4\tr mi8 sol
   fa4\tr mi8 sol
   fa4\tr mi

   %16
   mi8[re16 mi fa mi re do]
   sol'4 sol8 fa
   mi8[re16 mi fa mi re do]

   %19
   sol'4 sol8 la
   si[la16 si do si la sol]
   re'4 re8 do\mbreak

   %22 OOKK fine seconda riga
   si8[la16 si do si la sol]
   re'4 re8 do
   si la16 sol re8 re

   %25
   sol,4 r8 sol'\f
   do[mi, fa sol]
   fa4\tr mi8 sol

   %28
   fa4\tr mi8 re
   mi8[re16 mi fa mi re do]
   sol'4 sol8 sol\p

   %31
   do[mi, fa sol]
   fa4\tr mi8 sol\mbreak
   fa4\tr mi8 sol

   %34
   fa4\tr mi
   mi8[re16 mi fa mi re do]
   sol'4 sol8 fa

   %37
   mi8[re16 mi fa mi re do]
   sol'4 r8 r16 sol
   do4 do

   %40
   do4. si16 la
   sol8[fa16 mi fa8 la]
   sol4. do8

   %43
   sol8[fa16 mi fa8 la]\mbreak
   sol[mi fa la]
   sol[mi fa la]

   %46
   sol[fa16 mi fa sol la si]
   do8[si16 la sol8 fa]
   mi8 do' re, sol,

   %49
   do4. re8
   mi[re16 mi fa mi re do]
   sol'4 sol8 fa

   %52
   mi[re16 mi fa mi re do]
   sol'4 sol
   sol8[la16 si do8 re]

   %55
   mi[re16 do si8 la]\mbreak
   sol8[la16 si do8 fa,]
   sol2

   %58
   do,4 r8 sol'\f
   do[mi, fa sol]
   fa4\tr mi8 sol

   %61
   fa4\tr mi8 re
   mi[re16 mi fa mi re do]
   sol'8[sol sol la16 si]

   %64
   do8[do do si16 la]
   si8 sol do4
   fa, sol

   %67
   do,\fermata r8 mi\p
   la[mi fa sol]
   fa4\tr mi8 mi\mbreak

   %70
   la[si do re]
   mi4 mi,8 mi
   la[si do re]

   %73
   mi[re do si]
   la[sol fa la]
   re[do si la]

   %76
   sol[fa mi sol]
   do[si la sol]
   fa[mi re la']

   %79
   si[la sold fad]
   sold fad mi4
   do'8[si16 do re do si la]\mbreak

   %82
   mi'4 mi8 re
   do[si16 do re do si la]
   mi'4 mi8 re

   %85
   do si16 la re,8 mi
   la, [do' si fad]
   sol[fad16 sol la sol fad mi]

   %88
   si'4 si8 la
   sol[fad16 sol la sol fad mi]
   si'8[dod16 red mi8 mi,]

   %91
   si2
   mi,\fermata

}

XVIIIvlan = \relative do' {

   sol'8
   do[mi, fa sol]
   fa4\tr mi8 sol
   fa4\tr mi8 re

   %4
   mi[re16(mi) fa(mi) re(do)]
   sol'8[sol sol la16 si]
   do8[do do si16 la]

   %7
   sol4 do,8 sol'
   fa4\tr mi8 sol
   fa4\tr mi8 do'

   %10
   fa,[mi16 fa sol8 sol,]
   do4 r8 sol'\p\mbreak
   do[mi, fa sol]

   %13
   fa4\tr mi8 sol
   fa4\tr mi8 sol
   fa4\tr mi

   %16
   mi8[re16 mi fa mi re do]
   sol'4 sol8 fa
   mi8[re16 mi fa mi re do]

   %19
   sol'4 sol8 la
   si[la16 si do si la sol]
   re'4 re8 do\mbreak

   %22 OOKK fine seconda riga
   si8[la16 si do si la sol]
   re'4 re8 do
   si la16 sol re8 re

   %25
   sol,4 r8 sol'\f
   do[mi, fa sol]
   fa4\tr mi8 sol

   %28
   fa4\tr mi8 re
   mi8[re16 mi fa mi re do]
   sol'4 sol8 sol\p

   %31
   do[mi, fa sol]
   fa4\tr mi8 sol\mbreak
   fa4\tr mi8 sol

   %34
   fa4\tr mi
   mi8[re16 mi fa mi re do]
   sol'4 sol8 fa

   %37
   mi8[re16 mi fa mi re do]
   sol'4 r8 r16 sol
   do4 do

   %40
   do4. si16 la
   sol8[fa16 mi fa8 la]
   sol4. do8

   %43
   sol8[fa16 mi fa8 la]\mbreak
   sol[mi fa la]
   sol[mi fa la]

   %46
   sol[fa16 mi fa sol la si]
   do8[si16 la sol8 fa]
   mi8 do' re, sol,

   %49
   do4. re8
   mi[re16 mi fa mi re do]
   sol'4 sol8 fa

   %52
   mi[re16 mi fa mi re do]
   sol'4 sol
   sol8[la16 si do8 re]

   %55
   mi[re16 do si8 la]\mbreak
   sol8[la16 si do8 fa,]
   sol2

   %58
   do,4 r8 sol'\f
   do[mi, fa sol]
   fa4\tr mi8 sol

   %61
   fa4\tr mi8 re
   mi[re16 mi fa mi re do]
   sol'8[sol sol la16 si]

   %64
   do8[do do si16 la]
   si8 sol do4
   fa, sol

   %67
   do,\fermata r8 mi\p
   la[mi fa sol]
   fa4\tr mi8 mi\mbreak

   %70
   la[si do re]
   mi4 mi,8 mi
   la[si do re]

   %73
   mi[re do si]
   la[sol fa la]
   re[do si la]

   %76
   sol[fa mi sol]
   do[si la sol]
   fa[mi re la']

   %79
   si[la sold fad]
   sold fad mi4
   do'8[si16 do re do si la]\mbreak

   %82
   mi'4 mi8 re
   do[si16 do re do si la]
   mi'4 mi8 re

   %85
   do si16 la re,8 mi
   la, [do' si fad]
   sol[fad16 sol la sol fad mi]

   %88
   si'4 si8 la
   sol[fad16 sol la sol fad mi]
   si'8[dod16 red mi8 mi,]

   %91
   si2
   mi,\fermata

}

XVIIIsopranon = \relative do'' {

   \autoBeamOff

   r8
   R2*10
   r4 r8 sol
   do[mi,] fa [sol]

   %13
   fa4\tr mi8 sol
   fa4\tr mi8 sol
   fa4\parenthesize \tr mi

   %16
   mi8[re16 mi] fa [mi] re [do]
   sol'4 sol8[fa]
   mi8[re16 mi fa mi re do]

   %19
   sol'4 sol8 la
   si[la16 si do si] la [sol]
   re'4 re8 [do]\mbreak

   %22 OOKK fine seconda riga
   si8[la16 si do si la sol]
   re'4 re8 do
   si la16 [sol] la4\tr

   %25
   sol4 r
   R2*4
   r4 r8 sol

   %31
   do[mi,] fa [sol]
   fa4\tr mi8 sol\mbreak
   fa4\tr mi8 sol

   %34
   fa4\tr mi
   mi8[re16 mi] fa [mi] re [do]
   sol'4 sol8 [fa]

   %37
   mi8[re16 mi fa mi re do]
   sol'4 r8 r16 sol
   do4 do

   %40
   do4. si16 [la]
   sol8[fa16 mi fa8 la]
   sol4. do8

   %43
   sol8[fa16 mi fa8] la\mbreak
   sol[mi fa la]
   sol[mi fa la]

   %46
   sol[fa16 mi fa sol la si]
   do8[si16 la sol8 fa]
   mi8 do' re,4

   %49
   do r
   mi8[re16 mi fa mi re do]
   sol'4 sol8 [fa]

   %52
   mi[re16 mi fa mi re do]
   sol'4 sol
   sol8[la16 si do8 re]

   %55
   mi[re16 do si8 la]\mbreak
   sol8[la16 si] do8 fa,
   sol2\tr

   %58
   do,4 r
   R2*8
   r4 r8 mi

   %68
   la[mi] fa [sol]
   fa4\tr mi8 mi\mbreak

   %70
   la[si] do [re]
   si4 si,
   R2

   %73
   mi'8[re] do si
   la[sol] fa la
   re[do] si [la]

   %76
   sol[fa] mi sol
   do[si] la [sol]
   fa[mi] re la']

   %79
   si[la] sold [fad]
   sold [fad] mi4
   do'8[si16 do] re[(do)] si [(la)]\mbreak

   %82
   mi'4 mi8 [re]
   do[si16 do re do si la]
   mi'4 mi8 [re]

   %85
   do si16[ la] si8[la16 sol]
   la4 r
   sol8[fad16 sol] la [(sol)] fad [(mi)]

   %88
   si'4 si8 [la]
   sol[fad16 sol la sol fad mi]
   si'8[dod16 red] mi8 mi,

   %91
   sol4(fad\tr)
   mi2\fermata

}

XVIIItestoI = \lyricmode {

   Se_in -- gra -- ta nube _ 
   lan -- guire _ il sole _
   fa su nel Cie - - - lo
   to -- sto fu -- ga - - - ta
   splen -- de più bel -- lo.
   
   Se_in -- gra -- ta nube _ 
   lan -- guire _ il sole _
   fa su nel Cie - - lo
   to -- sto fu -- ga - - - - - ta
   splen -  - - de più bel -- lo, splen - - - - - - - - de
   più bel -- lo.
   
   Se_un fred -- do gelo _ 
   in -- du -- ra l’onda _ 
   di -- sciol -- to_al -- fine _
   dal -- l’em -- pie brine _ dal -- l’em -- pie brine _ 
   lam -- bir la sponda _
   ve -- di_il ru -- scel - - - lo, il ru -- scel -- lo,
   ve -- di_il ru -- scel - - - lo,_il ru -- scel -- lo.

}

XVIIIbcn = \relative do {

   sol'8
   do[mi, fa sol]
   fa4\tr mi8 sol
   fa4\tr mi8 re

   %4
   mi[re16(mi) fa(mi) re(do)]
   sol'8[sol sol la16 si]
   do8[do do si16 la]

   %7
   sol4 do,8 sol'
   fa4\tr mi8 sol
   fa4\tr mi8 do'

   %10
   fa,[mi16 fa sol8 sol,]
   do4 r8 sol'\p\mbreak
   do[mi, fa sol]

   %13
   fa4\tr mi8 sol
   fa4\tr mi8 sol
   fa4\tr mi

   %16
   mi8[re16 mi fa mi re do]
   sol'4 sol8 fa
   mi8[re16 mi fa mi re do]

   %19
   sol'4 sol8 la
   si[la16 si do si la sol]
   re'4 re8 do\mbreak

   %22 OOKK fine seconda riga
   si8[la16 si do si la sol]
   re'4 re8 do
   si la16 sol re8 re

   %25
   sol,4 r8 sol'\f
   do[mi, fa sol]
   fa4\tr mi8 sol

   %28
   fa4\tr mi8 re
   mi8[re16 mi fa mi re do]
   sol'4 sol8 sol\p

   %31
   do[mi, fa sol]
   fa4\tr mi8 sol\mbreak
   fa4\tr mi8 sol

   %34
   fa4\tr mi
   mi8[re16 mi fa mi re do]
   sol'4 sol8 fa

   %37
   mi8[re16 mi fa mi re do]
   sol'4 r8 r16 sol
   do4 do

   %40
   do4. si16 la
   sol8[fa16 mi fa8 la]
   sol4. do8

   %43
   sol8[fa16 mi fa8 la]\mbreak
   sol[mi fa la]
   sol[mi fa la]

   %46
   sol[fa16 mi fa sol la si]
   do8[si16 la sol8 fa]
   mi8 do' re, sol,

   %49
   do4. re8
   mi[re16 mi fa mi re do]
   sol'4 sol8 fa

   %52
   mi[re16 mi fa mi re do]
   sol'4 sol
   sol8[la16 si do8 re]

   %55
   mi[re16 do si8 la]\mbreak
   sol8[la16 si do8 fa,]
   sol2

   %58
   do,4 r8 sol'\f
   do[mi, fa sol]
   fa4\tr mi8 sol

   %61
   fa4\tr mi8 re
   mi[re16 mi fa mi re do]
   sol'8[sol sol la16 si]

   %64
   do8[do do si16 la]
   si8 sol do4
   fa, sol

   %67
   do,\fermata r8 mi\p
   la[mi fa sol]
   fa4\tr mi8 mi\mbreak

   %70
   la[si do re]
   mi4 mi,8 mi
   la[si do re]

   %73
   mi[re do si]
   la[sol fa la]
   re[do si la]

   %76
   sol[fa mi sol]
   do[si la sol]
   fa[mi re la']

   %79
   si[la sold fad]
   sold fad mi4
   do'8[si16 do re do si la]\mbreak

   %82
   mi'4 mi8 re
   do[si16 do re do si la]
   mi'4 mi8 re

   %85
   do si16 la re,8 mi
   la, [do' si fad]
   sol[fad16 sol la sol fad mi]

   %88
   si'4 si8 la
   sol[fad16 sol la sol fad mi]
   si'8[dod16 red mi8 mi,]

   %91
   si2
   mi,\fermata

}

XVIIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 2/4
   \key do\major
   \tempo 2 = 60
   \partial 8 s8
   s2*92
   \bar "||"
   \mark\markup "D.C."

}

XVIIIvlI = {
   <<\XVIIIvlIn \forma>>

}

XVIIIvla = {
   \clef alto
   <<\XVIIIvlan \forma>>

}

XVIIIsoprano = {
   \new Voice = "nube"
   <<\XVIIIsopranon \forma>>
}

XVIIIbc = {
   \clef bass
   <<\XVIIIbcn \forma \XVIIIbfn>>
}




XIXalton = \relative do' {

   \autoBeamOff

   r4 r8 mi la la la si
   sold sold r4 mi8 mi si' la16 si
   do8 do r la16 la fa4 sold8 la\mbreak

   %4
   mi8 mi r4 la la8 la
   fad fad r fad fad fad sol la
   red, red r4 fad8 fad fad fad16 sol\mbreak

   %7
   la8 la r16 la la sol mi8 mi r4
   r r8 si' sold sold si la
   fad fad r4\mbreak fad8 fad la si16 dod

   %10
   fad,8 fad fad mi16 fad re8 re r4
   fad8 fad si si16 la\mbreak fad8 fad r4\fermata

}

XIXtestoII = \lyricmode {

   Invan _ potrà _ la sorte _
   a sì belle _ ri -- torte _
   porger _ leg -- ge_o com -- mando. _ Argo _ no -- vello _
   sarò _ nel rimi - rare _
   e del -- l’u -- no_e del -- l’altra _ i_a  -- viti _ preghi. _
   S’ap -- pa -- ghi_il lor de -- sio, _
   si ma -- turi _ l’im -- pegno, _
   on -- de_il mio nu -- me ogn’or _ fassi _ più degno. _

}

XIXbcn = \relative do {

   la1
   re
   la2 re

   %4
   mi4 la,~la2
   red1
   si~

   %7
   si2 mi~
   mi mid
   fad~fad~

   %10
   fad si,~
   si dod4 fad,\fermata

}

XIXbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 65
   s1*11
   \bar "|."

}

XIXalto = {
   \new Voice = "sorte"
   <<\XIXalton \forma>>
}

XIXbc = {
   \clef bass
   <<\XIXbcn \forma \XIXbfn>>
}





XXvlIn = \relative do'' {

    si'16_\markup\italic\smaller "Tutti gl'Istrom[enti] Sordini" la sold fad
    mi8 mi4 fad8
    sold8 sold4 la8
    si[red,16 dod red8 mi]

    %4
    si'[red,16 dod red8 mi]
    la8 sold16 fad sold8 fad16 mi
    fad8 si, r si'

    %7
    red,16 fad mi sold fad la sold si
    fad8 si4 mi,8
    red16 fad mi sold fad la sold si

    %10
    fad4 r8 si(\mbreak
    lad) [la(sold) sol](
    fad)[red(mi) si']

    %13
    la4 fad\tr
    mi4 si'16\p la sold fad
    mi8 mi4 fad8

    %16
    sold8 sold4 la8
    si[red,16 dod red8 mi]
    si'[red,16 dod red8 mi]

    %19
    la8 sold16 fad sold8 fad16 mi
    fad8 si, si'16 la sold fad
    mi8 mi4 fad8

    %22
    sold8 sold4 la8
    si[red,16 dod red8 mi]
    si'[red,16 dod red8 mi]

    %25
    la8 sold16 fad sold8 fad16 mi
    fad8 si, r8 si'(   %%% fine p. 52
    lad)[la(sold) sol](

    %28
    fad) [red(mi) si'](
    lad) [la(sold) sol](
    fad) [red(mi) si']

    %31
    red,8.[mi16 fad8. sold16]
    fad8 si4 mi,8
    red16 [fad mi sold] fad [la sold si]

    %34
    fad8 si4 mi,8
    red16 [fad mi sold] fad [la sold si]
    fad8 sold16 lad si8 si,

    %37
    red4(dod\tr)\mbreak
    si si'16\f la sold fad
    mi8 mi4 fad8

    %40
    sold8 sold4 la8
    si[red,16 dod red8 mi]
    si'[red,16 dod red8 mi]

    %43
    la8 sold16 fad sold8 fad16 mi
    fad8 si, sold'\p fad16 mi
    re8 re4 re8

    %46
    si' re,4 re8
    re? dod mi16 fad mi re!\mbreak
    dod8 lad lad' sold16 fad

    %49
    mi8 mi4 mi8
    dod' mi,4 mi8
    mi red? la'16[sold fad mi]

    %52
    fad8[red si' fad]
    sold fad4 mi8
    la sold4 fad8

    %55
    sold fad16 mi si'8 la16 sold
    fad4 r8 si
    red,8.[mi16 fad8. sold16]\mbreak

    %58
    fad8 si4 mi,8
    red16 [fad mi sold] fad [la sold si]
    fad8 si4 mi,8

    %61
    red16 [fad mi sold] fad [la sold si]
    la8 sold16 fad sold8 fad16 mi
    fad2\tr

    %64
    mi4 r8 si'
    lad[la sold sol]
    fad [red mi si']

    %67
    lad [la sold sol]
    fad [red mi si']\mbreak
    si,4~si16[red dod si]

    %70
    la'8 la4 la8
    si,4~si16[red dod si]
    sold'8 sold4 sold8

    %73
    si,4~si16[red dod si]
    fad'8 fad4 red8
    mi16 fad sold la si8 la

    %76
    sold fad16 mi fad4\tr
    mi4 si'16\f la sold fad
    mi8 mi4 fad8

    %79
    sold8 sold4 la8
    si[red,16 dod red8 mi]
    si'[red,16 dod red8 mi]

    %82
    la8 sold16 fad sold8 fad16 mi
    fad8 si, r si'
    si,4~si16[red dod si]

    %85
    la'8 la4 la8
    si,4~si16[red dod si]
    sold'8 sold4 sold8

    %88
    si,4~si16[red dod si]
    fad'8 fad4 la8
    sold16 fad sold la si8 la

    %91
    sold4 fad\tr
    mi4\fermata sold16\p fad mi red\mbreak
    dod8 dod4 red8

    %94
    mi mi4 fad8
    sold8[fad16 mi] la8[sold16 fad]
    sold8[fad16 mi] la8[sold16 fad]

    %97
    sold8 dod, sold'16 fad mi red
    dod8 dod4 red8
    mi8 dod r4

    %100
    r r8 dod'(
    sid)[si(lad) la](
    sold) [sol?(fad) fa?](

    %103
    mi16) red mi fad sold8 fad\mbreak
    mi8 [sold16 fad mi8 red16 dod]
    red2\tr

    %106
    dod4 r
    r r8 fad(
    mid)[mi(red) re](

    %109
    dod) do?(si) si(
    la16) sold la si dod8 fad
    mid[red16 dod] fad8 si

    %112
    la4(sold\tr)
    fad r8 la(
    sold)[mid(fad) re](

    %115
    dod) [mid(fad) si]
    la4(sold\tr)
    fad2\fermata

}

XXvlIIn = \relative do'' {

    r4
    r si'16_\markup\italic\smaller "Tutti gl'Istrom[enti] Sordini" la sold fad
    mi8 mi4 fad8
    sold la4 sold8

    %4
    fad la4 sold8
    fad[(si) mi,(si')]
    red, fad si,4

    %7
    r4 r8 si'
    red,16 fad mi sold fad la sold si
    fad8 si4 mi,8

    %10
    red16 fad mi sold fad la sold si\mbreak
    fad4 r8 si (
    lad8)[la (sold) sol]

    %13
    fad4 red\tr
    mi r
    r si'16\p la sold fad

    %16
    mi8 mi4 fad8
    sold la4 sold8
    fad la4 sold8

    %19
    fad[(si) mi,(si')]
    red,4  r
    r si'16 la sold fad

    %22
    mi8 mi4 fad8
    sold la4 sold8
    fad la4 sold8

    %25
    fad[(si) mi,(si')]
    red,4  r\mbreak
    r r8 si'(

    %28
    lad)[la(sold) sol](
    fad) [red(mi) si'](
    lad) [la(sold) sol](

    %31
    fad4) r8 si
    red,8.[mi16 fad8. sold16]
    fad8 si4 mi,8

    %34
    red16 [fad mi sold] fad [la sold si]
    fad8 si4 mi,8
    red4 r8 si

    %37
    si4 (lad\tr)\mbreak
    si4 r
    r si'16\f la sold fad

    %40
    mi8 mi4 fad8
    sold8 la4 sold8
    fad la4 sold8

    %43
    fad[(si) mi,(si')]
    red,4  r
    r sold8\p fad16 mi

    %46
    re8 sold4 si8
    la la, dod16 re? dod si\mbreak
    lad8 fad r4

    %49
    r lad'8 sold16 fad
    mi8 lad4 dod8
    si si, fad'16 mi red dod

    %52
    red8 si r4
    r si'8 sold
    fad mi4 red8

    %55
    mi4 sold8 fad16 mi
    red4 r
    r r8 si'\mbreak

    %58
    red,8.[mi16 fad8. sold16]
    fad8 si4 mi,8
    red16 [fad mi sold] fad [la sold si]

    %61
    fad8 si4 mi,8
    fad4 mi~
    mi red

    %64
    mi r
    r r8 si'
    lad[la sold sol]

    %67
    fad [red mi si']
    lad [la sold sol]\mbreak
    fad4 r

    %70
    si,4~si16[red dod si]
    la'8 la4 la8
    si,4~si16[red dod si]

    %73
    sold'8 sold4 sold8
    si,4~si16[red dod si]
    sold' fad mi fad sold8 fad

    %76
    mi4 red
    mi r
    r si'16\f la sold fad

    %79
    mi8 mi4 fad8
    sold8 la4 sold8\mbreak
    fad la4 sold8
    fad[(si) mi,(si')]

    %83
    red,4 r
    r r8 si'
    si,4~si16[red dod si]

    %86
    la'8 la4 la8
    si,4~si16[red dod si]
    sold'8 sold4 sold8

    %89
    si,4~si16[red mi fad]
    mi red mi fad sold8 fad
    mi4 red\tr

    %92
    mi\fermata r \mbreak
    r sold16\p fad mi red
    dod8 dod4 red8

    %95
    mi red16 dod fad8 mi16 red
    mi8 red16 dod fad8 mi16 red
    mi8 dod r4

    %98
    r sold'16 fad mi red
    dod8 dod r4
    R2

    %101
    r4 r8 dod'(
    sid)[si(lad) la](
    sold)[dod,16 red mi8 red]\mbreak

    %104
    dod2~
    dod4 sid
    dod r

    %107
    R2
    r4 r8 fad(
    mid)[mi(red) re](

    %110
    dod) fad,16 sold la8 la'
    sold4 la8 fad
    fad4 (mid\tr)

    %113
    fad r8 fad(
    mid)[dod(red) si](
    la)[sold'(la) fad]

    %116
    fad4 (mid\tr)
    fad2\fermata

}

XXvlan = \relative do' {

    r4
    si'16_\markup\italic\smaller "Tutti gl'Istrom[enti] Sordini" la sold fad mi8 red
    mi[sold16 fad mi8 si]
    mi[fad si, mi]

    %4
    red[fad si, mi]
    red[red mi mi]
    si[si red si]

    %7
    si[mi red mi]
    r mi[red mi]
    r mi[red mi]

    %10
    r mi[red mi]\mbreak
    fad(red) mi4
    si8 si mi4

    %13
    la, si
    mi r4
    si'16\p la sold fad mi8 red

    %16
    mi[sold16 fad mi8 si]
    mi[fad si, mi]
    red[fad si, mi]

    %19
    red[red mi mi]
    si si r4
    si'16 la sold fad mi8 red

    %22
    mi[sold16 fad mi8 si]
    mi[fad si, mi]
    red[fad si, mi]

    %25
    red[red mi mi]
    si si red si\mbreak
    fad' red mi4

    %28
    fad8 si, mi4
    fad8 si, mi4
    fad8 si, mi4

    %31
    si8[mi red mi]
    r mi[red mi]
    r mi[red mi]

    %34
    r mi[red mi]
    r mi[red mi]
    r fad[red si]

    %37
    fad'4 fad,\mbreak
    si r
    si'16\f la sold fad mi8 red

    %40
    mi[sold16 fad mi8 si]
    mi[fad si, mi]
    red[fad si, mi]

    %43
    red[red mi mi]
    si4 r
    r8 mi\p[mi, mi']

    %46
    r mi[mi, mi']
    r la[la, la']\mbreak
    r fad[fad, fad']

    %49
    r fad[fad, fad']
    r fad[fad, fad']
    r si[si, si']

    %52
    r si[si, si']
    si, si' si,4~
    si8 si' si,4

    %55
    mi r8 mi
    si8[si red si]
    r mi[red mi]\mbreak

    %58
    r mi[red mi]
    r mi[red mi]
    r mi[red mi]

    %61
    r mi[red mi]
    si4 mi
    si' si,

    %64
    mi8[mi red si]
    fad'(red) mi4
    fad8 si, mi4

    %67
    fad8 si, mi4
    fad8 si, mi4\mbreak
    si8 si' si,4~

    %70
    si8 si' si,4~
    si8 si' si,4~
    si8 si' si,4~

    %73
    si8 si' si,4~
    si8 si' si,4
    mi4 r8 si

    %76
    mi4 si
    mi r
    si'16\f la sold fad mi8 si

    %79
    mi[sold16 fad mi8 si]
    mi[fad si, mi]
    red[fad si, mi]

    %82
    red[red mi mi]
    si[si red si]~
    si8 si' si,4~

    %85
    si8 si' si,4~
    si8 si' si,4~
    si8 si' si,4~

    %88
    si8 si' si,4~
    si8 si' si,4
    mi4. si8

    %91
    mi4 si
    mi\fermata r\mbreak
    sold16\p fad mi red dod8 sid

    %94
    dod[mi16 red dod8 sold]
    dod4 dod
    dod dod

    %97
    dod r
    sold'16 fad mi red dod8 sid
    dod8[red mi red]

    %100
    dod2~
    dod2~
    dod2~

    %103
    dod4. sold8\mbreak
    dod4 dod
    sold' sold,

    %106
    dod r
    fad2~
    fad2~

    %109
    fad2~
    fad4 r8 fad
    dod4 r8 re

    %112
    dod4 dod,
    fad'8[sold la fad]
    dod2~

    %115
    dod4 fad8 re
    dod2
    fad,\fermata

}

XXalton = \relative do' {

    \autoBeamOff

    r4
    R2*13
    r4 si'16[la] sold [fad]
    mi8 mi4 fad8

    %16
    sold8 sold4 la8
    si[red,16 dod red8 mi]
    si'[red,16 dod red8 mi]

    %19
    la8 [sold16 fad] sold8 [fad16 mi]
    fad8 si, si'16[la] sold [fad]
    mi8 mi4 fad8

    %22
    sold8 sold4 la8
    si[red,16 dod red8 mi]
    si'[red,16 dod red8 mi]

    %25
    la8 [sold16 fad] sold8 [fad16 mi]
    fad8 si, r si'\mbreak
    lad la [sold] sol

    %28
    fad red[mi] si'
    lad la sold sol
    fad red[mi] si'

    %31
    red,8.[mi16 fad8. sold16]
    fad8 si4 mi,8
    red16 [fad mi sold] fad [la sold si]

    %34
    fad8 si4 mi,8
    red16 [fad mi sold] fad [la sold si]
    fad8 sold16 [lad] si8 si,

    %37
    red4(dod\tr)\mbreak
    si r
    R2*5

    %44
    r4 sold'8 fad16[mi]
    re8 re4 re8

    %46
    si' re,4 re8
    re? dod r4\mbreak
    r lad'8 sold16[fad]

    %49
    mi8 mi4 mi8
    dod' mi,4 mi8
    mi red? r4

    %52
    r si'8 fad
    sold fad4 mi8
    la sold4 fad8

    %55
    sold fad16 [mi] si'8 la16 [sold]
    fad4 r8 si
    red,8.[mi16 fad8. sold16]\mbreak

    %58
    fad8 si4 mi,8
    red16 [fad mi sold] fad [la sold si]
    fad8 si4 mi,8

    %61
    red16 [fad mi sold] fad [la sold si]
    la8 sold16 [fad] sold8 fad16 [mi]
    fad2\tr

    %64
    mi4 r8 si'
    lad la [sold] sol
    fad red [mi] si'

    %67
    lad la sold sol
    fad red [mi] si'\mbreak
    si,4~si16[red dod si]

    %70
    la'8 la4 la8
    si,4~si16[red dod si]
    sold'8 sold4 sold8

    %73
    si,4~si16[red dod si]
    fad'8 fad4 red8
    mi16 [fad sold la si8] la

    %76
    sold fad16 [mi] fad4\tr
    mi4 r
    R2*14

    %92
    r4 sold16 [fad] mi [red]\mbreak
    dod8 dod4 red8

    %94
    mi mi4 fad8
    sold8[fad16 mi] la8[sold16 fad]
    sold8[fad16 mi] la8[sold16 fad]

    %97
    sold8 dod, r4
    R2
    r4 sold'8 mi

    %100
    dod2~
    dod~
    dod~

    %103
    dod16[red mi fad] sold8 fad\mbreak
    mi8 [sold16 fad] mi8 [red16 dod]
    red2

    %106
    dod4 dod'8 la
    fad2~
    fad~

    %109
    fad~
    fad16[sold la si] dod8 fad,
    mid[red16 dod] fad8 si

    %112
    la4(sold\tr)
    fad r8 la
    sold[mid] fad re

    %115
    dod mid fad si
    la4(sold\tr)
    fad2\fermata

}

XXtestoII = \lyricmode {

    Ogn' or colmi _ d’e -- strema _ dol -- cez - - - - za
    sie -- te_al certo _ be -- a -- ti_oc -- chi mie - - - - i,
    d’e -- strema _ dol -- cez -- za sin' or colmi _  voi sie -- te
    be -- a - - - - - - - - - - - ti oc -- chi mie -- i.

    Ogn' or colmi _ d’e -- strema _ dol -- cez -- za
    ogn' or colmi _ d’e -- strema _ dol -- cez -- za
    sie -- te_al certo _ be -- a - - - ti_oc -- chi mie -- i
    be -- a - - - - - - - - - - - ti oc -- chi mie -- i,
    d’e -- strema _ dol -- cez -- za sin -- nor colmi _ voi foste _
    be -- a - - - - - - - - - - - - ti oc -- chi mie -- i.

    Va -- gheg -- giando _ la loro _ bel -- lez - - - - za
    sempre _ lie -- ti mi -- rar vi vor -- rei,
    sempre _ lie -- ti mi -- rar vi vor -- re  -- i,
    mi -- rar vi vor -- rei _ vi vor -- re -- i.

}

XXbcn = \relative do {

    r4
    mi8[mi mi si']
    mi,[mi mi si]
    mi[fad si, mi]

    %4
    red[fad si, mi]
    red4 mi
    si2~

    %7
    si~
    si~
    si~

    %10
    si~\mbreak
    si~
    si4 mi

    %13
    la, si
    mi, r
    mi'8[mi mi si']

    %16
    mi,[mi mi si]
    mi[fad si, mi]
    red[fad si, mi]

    %19
    red4 mi
    si r
    mi8[mi mi si']

    %22
    mi,[mi mi si]
    mi[fad si, mi]
    red[fad si, mi]

    %25
    red4 mi
    si r\mbreak
    \repeat unfold 9 {si2~}

    %36
    si8[fad' red si]
    fad'4 fad,\mbreak
    si4 r

    %39
    mi8[mi mi si']
    mi,[mi mi si]
    mi[fad si, mi]

    %42
    red[fad si, mi]
    red4 mi
    si r

    %45
    r8 mi[mi, mi']
    r8 mi[mi, mi']
    r la[la, la']\mbreak

    %48
    r fad[fad, fad']
    r fad[fad, fad']
    r fad[fad, fad']

    %51
    r si[si, si']
    r si[si, si']
    si,2~

    %54
    si
    mi4 r8 mi
    si2~

    %57
    si~\mbreak
    si2~
    si2~

    %60
    si2~
    si2~
    si4 mi

    %63
    si2
    mi4 si
    si2~

    %66
    si2~
    si2~
    si2~\mbreak

    %69
    si2~
    si2~
    si2~

    %72
    si2~
    si2~
    si2

    %75
    mi4. si8
    mi4 si
    mi r

    %78
    mi8[mi mi si']
    mi,[mi mi si]
    mi[fad si, mi]\mbreak

    %81
    red[fad si, mi]
    red4 mi
    si2~

    %84
    si~
    si~
    si~

    %87
    si~
    si~
    si

    %90
    mi4. si8
    mi4 si
    mi\fermata r\mbreak

    %93
    dod8[dod dod sold']
    dod,[dod dod sold]
    dod4 dod

    %96
    dod dod
    dod r
    dod8[dod dod sold']

    %99
    dod,[red mi dod]
    dod2~
    dod~

    %102
    dod~
    dod4. sold8\mbreak
    dod4 dod

    %105
    sold' sold,
    dod r
    fad2~

    %108
    fad~
    fad~
    fad4. fad8

    %111
    dod4 r8 re
    dod4 dod,
    fad'8[sold la fad]

    %114
    dod2~
    dod4 fad8 re
    dod2

    %117
    fad,\fermata

}

XXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/4
    \key mi\major
    \tempo 2 = 53
    \partial 4 s4
    s2*117
    \bar "||"
    \mark\markup "D.C."

}

XXvlI = {
    <<\XXvlIn \forma>>

}

XXvlII = {
    <<\XXvlIIn \forma>>

}

XXvla = {
    \clef alto
    <<\XXvlan \forma>>

}

XXalto = {
    \new Voice = "occhi"
    <<\XXalton \forma>>
}

XXbc = {
    \clef bass
    <<\XXbcn \forma \XXbfn>>
}




XXIsopranon = \relative do'' {

    \autoBeamOff

    mi,8 mi16 mi la8 si dod dod r8 mi
    si si re dod dod16 dod r4 la8
    la la sol la fad fad sol la\mbreak

    %4
    mi8 mi r4 la8 la16 la la8 si
    do do r4 do8 mi do do16 si
    si8 si r4 si la8 sol

    %7
    do4 r8 do\mbreak do do la si16 do
    sol8 sol r4 r2
    R1*9

}

XXItestoI = \lyricmode {

    Delle _ re -- gali _ nozze _
    com -- pi -- to_il Sa -- gro_Uf  -- ficio, _
    or la dama _ n’ac -- cer -- ti_il mondo _ tutto. _
    Con la sua tromba _ d’oro _
    for -- mi e -- chi_ed ap -- plausi, _
    giu -- bi -- li_ogn’ un con lieti _ suoni _ e danze. _

}

XXIalton = \relative do' {

    \autoBeamOff

    R1*7
    r4 r16 sol' mi fa sol4 r8 sol
    sol sol la sib mi, mi r4

    %10
    sol8 fa mi re16 do\mbreak fa8 fa r sol
    mib mib mib re re4 fa8 fa16 sol
    lab8 lab lab lab16 sol mib4 r8 sib'

    %13
    sol sol r sol\mbreak sol sol sol la
    mi4 r8 mi sol sol r fa
    re re r4 la'8 la la la16 si

    %16
    sold8 sold r4\mbreak si8 la sold fad16 mi
    la4 la8 sold16 la mi mi mi8 r4\fermata

}

XXItestoII = \lyricmode {

    E voi Signor, _ ch’in sen dell’A -- dria_or _ fate _
    questi _ degni  _ spon -- sali _
    con Gioia _ fe -- steggiar, _ io ne de -- coro _
    l’alto _ pensier. _ S’ac -- cresce _
    a voi per que -- sto_an -- cor, e merto _ e Gloria; _
    nel mio tempio _ scol -- pita _
    inde - lebil  _ sa -- rà questa _ me -- mo -- ria. _

}

XXIbcn = \relative do {

    la1~
    la~
    la2 re
    mi4 la,~la2
    fad1
    sol
    mi'2~mi4 fa
    sol do,~do2~
    do1~
    do2 la~
    la sib~
    sib mib
    mi!~mi
    dod1
    re~
    re2~re
    do4 re mi la,\fermata

}

XXIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 60
    s1*17
    \bar "|."

}

XXIsoprano = {
    \new Voice = "nozze"
    <<\XXIsopranon \forma>>
}

XXIalto = {
    \new Voice = "signor"
    <<\XXIalton \forma>>
}

XXIbc = {
    \clef bass
    <<\XXIbcn \forma \XXIbfn>>
}





XXIIvlIn = \relative do'' {

    do'8 la16 sol la sib
    do8 la16 sol la sib
    do8 sib16 la sib do

    %4
    la8 fa la
    sol16 fa sol8 la
    sib16 la sib8 la

    %7
    sol4 r8
    r re re
    mi4 fa8

    %10
    sol mi4\tr
    fa r8
    R4.*3

    %15
    do'8 la16 sol la sib
    sol4 r8
    R4.

    %18
    r8 mi16 fa sol mi
    fa4 r8
    R4.*10

    %30
    sol8 mi16 re mi fa
    sol4 r8
    R4.

    %33
    mi8 mi16 re mi fa
    sol8 mi16 re mi fa
    sol8 mi re

    %36
    do sol do,
    R4.*4
    do''8 la16 sol la sib

    %42
    do4 r8
    R4.*4
    do,,4\p r8

    %48
    do4 la8
    sib sib sib
    do do do

    %51
    fa4 r8
    fa4 r8
    fa sib, do

    %54
    fa fa' fa,\mbreak
    r fa' fa,
    r fa la,

    %57
    sib sib sib
    do do do
    fa4 r8

    %60
    fa4 r8
    fa sib, do
    do''8 la16 sol la sib

    %63
    do8 la16 sol la sib
    do8 sib la
    la sib sol

    %66
    fa4.\fermata
    R4.*2
    r8 re16 mi re mi

    %70
    fa4 r8
    R4.
    r8 mi16 fa sol mi

    %73
    fa4 r8
    R4.*4
    r8 do16 sib do re

    %79
    mib4 r8
    R4.*7

}

XXIIvlIIn = \relative do'' {

    la'8 fa16 mi fa sol
    la8 fa16 mi fa sol
    la8 sol16 fa sol la

    %4
    fa8 la fa
    mi16 re mi8 fa
    sol16 fa sol8 fa

    %7
    mi do do
    do4.
    sib4 la8

    %10
    sib sol4\tr
    fa r8
    R4.*3

    %15
    la'8 fa16 mi fa sol
    mi4 r8
    R4.

    %18
    r8 sol16 la sib sol
    la4 r8
    R4.*10

    %30
    mi8 do16 si do re
    mi4 r8
    R4.

    %33
    do8 do16 si do re
    mi8 do16 si do re
    mi8 do si

    %36
    do sol do,
    R4.*4
    la''8 fa16 mi fa sol

    %42
    la4 r8
    R4.*4
    do,,4\p r8

    %48
    do4 la8
    sib sib sib
    do do do

    %51
    fa4 r8
    fa4 r8
    fa sib, do

    %54
    fa fa' fa,\mbreak
    r fa' fa,
    r fa la,

    %57
    sib sib sib
    do do do
    fa4 r8

    %60
    fa4 r8
    fa sib, do
    la''8 fa16 mi fa sol

    %63
    la8 fa16 mi fa sol
    la8 sol fa
    fa sol mi

    %66
    fa4.\fermata
    R4.*2\mbreak
    r8 fa16 sol fa sol

    %70
    la4 r8
    R4.
    r8 dod,16 re mi dod

    %73
    re4 r8
    R4.*4
    r8 la16 sol la sib

    %79
    do4 r8
    R4.*7

}

XXIIvlan = \relative do' {

    do4 r8
    do4 r8
    do mi4

    %4
    do8 do16 sib do re
    mi4 r8
    mi4 r8

    %7
    mi la16 sib do la
    fa8 re16 mi fa re
    sol8 mi do

    %10
    re do4
    la r8
    R4.*21

    %33
    sol'4 r8
    sol4 r8
    sol sol sol

    %36
    mi sol do,
    R4.*10
    do4\p r8

    %48
    do4 la8
    sib sib sib
    do do do

    %51
    fa4 r8
    fa4 r8
    fa sib, do

    %54
    fa fa' fa,\mbreak
    r fa' fa,
    r fa la,

    %57
    sib sib sib
    do do do
    fa4 r8

    %60
    fa4 r8
    fa sib, do
    do'4 r8

    %63
    do4 r8
    do4 r8
    do re do

    %66
    la4.\fermata
    R4.*20

}

XXIIsopranon = \relative do'' {

    \autoBeamOff

    R4.*10
    do8 la16 [sol] la [sib]
    do8 la16[sol la sib]

    %13
    do8 la16[sol la sib]\mbreak
    do8[sib16 la sib do]
    la8 r la

    %16
    sol16[fa sol8] la
    sib16[la sib8] la
    la sol r

    %19
    r r re'
    re4.~
    re8[do16 sib la sol]

    %22
    do4.~
    do8[sib16 la sol fa]
    sib4.~

    %25
    sib8[la16 sol fa mi]
    la8[la16 sol la sib]\mbreak
    do8[la16 sol la sib]

    %28
    do4 do8
    sib la4\tr
    sol8 r sol

    %31
    do16[si] la [sol] do8
    re si4
    do r8

    %34
    R4.*3
    do8 la16 [sol] la [sib]
    do8 la16[sol la sib]

    %39
    do8 [la16 sol la sib]\mbreak
    do8[sib16 la sib do]
    la4 r8

    %42
    R4.*2
    re16[do] sib[la] sol[fa]
    re'8 fa,4

    %46
    mi16[fa] sol8 r
    r r do
    lab sol do

    %49
    sib [sib sib]
    sib [sib sib]
    la16[sol la sib do8]

    %52
    la16[sol la sib] do8
    la sib sol
    fa4 r8\mbreak

    %55
    sib la r
    re do do
    sib [sib sib]

    %58
    sib [sib sib]
    la16[sol la sib do8]
    la16[sol la sib] do8

    %61
    la sib sol
    fa4 r8
    R4.*4

    %67
    la8 sol fa
    sib sib4\mbreak
    sib8 la r

    %70
    la re la
    sol fa4
    fa8 mi r

    %73
    re' re re
    re4.~
    re8[do16 si] la[sold]

    %76
    do8[si] la
    re si4
    la r8

    %79
    do do do
    do4.~
    do8[sib16 la] sol[fad]\mbreak

    %82
    sib8[sib16 la sib do]
    re8[sib16 la sib do]
    re8 r re

    %85
    sib la4\tr
    sol4.\fermata

}

XXIItestoI = \lyricmode {

    In braccio _ de’ con -- ten - -  ti
    go -- drà fe -- li -- ce_ogn’ alma _
    più ca - - - - ro il suo pia -- cer,
    più ca -- ro il suo pia -- cer.

    In braccio _ de’ con -- ten -  ti
    go -- drà fe -- li -- ce_ogn’ al -- ma
    più caro _ più ca - - - ro il suo pia -- cer,
    ca -- ro ca -- ro più ca - - - ro il suo pia -- cer.

    In sen d’a -- mica _ calma _
    già lieta _ più sfa -- villa _
    la fa -- ce_al bel go -- der,
    al bel go -- der, la fa -- ce_al bel go -- der - -
    al bel go -- der.

}

XXIIalton = \relative do' {

    \autoBeamOff

    R4.*10
    la'8 fa16[mi] fa[sol]
    la8 fa16[mi fa sol]

    %13
    la8 fa16[mi fa sol]\mbreak
    la8[sol16 fa sol la]
    fa8 r fa

    %16
    mi16[re mi8] fa
    sol16[fa sol8] fa
    fa mi do'

    %19
    do4.~
    do8[sib16 la sol fa]
    sib4.~

    %22
    sib8[la16 sol fa mi]
    la4.~
    la8[sol16 fa mi re]

    %25
    sol4.
    fa8[fa16 mi fa sol]\mbreak
    la8[fa16 mi fa sol]

    %28
    la4 la8
    sol fa4\tr
    mi8 r mi

    %31
    sol16[fa] mi8 mi
    fa re4
    do r8

    %34
    R4.*3
    la'8 fa16[mi] fa[sol]
    la8 fa16[mi fa sol]

    %39
    la8[fa16 mi fa sol]\mbreak
    la8[sol16 fa sol la]
    fa4 r8

    %42
    do'16[sib] la[sol] fa[mib]
    do'8 mib,4
    re16[mi?] fa8 r

    %45
    R4.
    r8 r sol
    lab sol r

    %48
    r r do,
    re [re re]
    mi [mi mi]

    %51
    fa16[mi fa sol la8]
    fa16[mi fa sol] la8
    fa sol mi

    %54
    fa4 r8\mbreak
    sol fa r
    sib la  do,

    %57
    re [re re]
    mi [mi mi]
    fa16[mi fa sol la8]

    %60
    fa16[mi fa sol] la8
    fa sol mi
    fa4 r8

    %63
    R4.*4
    fa8 mi re
    sol sol4\mbreak

    %69
    sol8 fa r
    fa la fa
    mi re4

    %72
    re8 dod r
    R4.
    la'8 la la

    %75
    sold4 sold8
    la4 do8
    la sold4

    %78
    la r8
    R4.
    sol8 sol sol

    %81
    fad4 fad8\mbreak
    sol[sol16 fad sol la]
    sib8[sol16 fad sol la]

    %84
    sib8 r sib
    sol fad4\tr
    sol4.\fermata

}

XXIItestoII = \lyricmode {

    In braccio _ de’ con -- ten - -  ti
    go -- drà fe -- li -- ce_ogn’ alma _
    più ca - - - - - ro il suo pia -- cer,
    più ca -- ro il suo pia -- cer.

    In braccio _ de’ con -- ten -  ti
    go -- drà fe -- li -- ce_ogn’ al -- ma
    più caro _ più ca - - - ro il suo pia -- cer,
    ca -- ro ca -- ro più ca - - - ro il suo pia -- cer.

    In sen d’a -- mica _ calma _
    già lieta _ più sfa -- villa _
    la fa -- ce_al bel go -- der,
    al bel go -- der, la fa -- ce_al bel go -- der - -
    al bel go -- der.

}

XXIIbcn = \relative do {

    fa4 r8
    fa4 r8
    fa do' do,

    %4
    fa fa16 sol la sib
    do4 r8
    do,4 r8

    %7
    do fa16 sol la fa
    sib8 sib16 do re sib
    do4 fa,8

    %10
    sib do do,
    fa4 r8
    fa4 r8

    %13
    fa4 r8\mbreak
    fa sol do,
    fa r fa

    %16
    do'4 fa,8
    do'4 fa,8
    do'4 do,8

    %19
    fa4 r8
    sib4 r8
    sol4 r8

    %22
    la4 r8
    fa4 r8
    fa4 r8

    %25
    mi4 r8
    fa4 r8\mbreak
    fa4 r8

    %28
    fa4 fa8
    sib, si4
    do r8

    %31
    do4 do8
    fa sol sol,
    do4 r8

    %34
    do4 r8
    do sol' sol,
    do sol do,

    %37
    fa'4 r8
    fa4 r8
    fa4 r8\mbreak

    %40
    fa4 r8
    fa4 r8
    fa4 r8

    %43
    fa la fa
    sib,4 r8
    sol si sol

    %46
    do4 r8
    R4.*15
    fa4 r8

    %63
    fa4 r8
    fa4 r8
    fa sib, do

    %66
    fa,4.\fermata
    re'4 r8
    re re re\mbreak

    %69
    re re, r
    re'4 re8
    sol sold4

    %72
    la8 la, r
    re4 r8
    fa fa fa

    %75
    mi4 mi8
    la,4 la'8
    fa mi mi,

    %78
    la4 r8
    R4.
    mib'8 mib mib

    %81
    re4 re8\mbreak
    sol4 r8
    sol4 r8

    %84
    sol r sol
    do, re re,
    sol4.\fermata

}

XXIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key fa\major
    \tempo 4. = 60
    s4.*86
    \bar "||"
    \mark\markup "D.C."

}

XXIIvlI = {
    <<\XXIIvlIn \forma>>

}

XXIIvlII = {
    <<\XXIIvlIIn \forma>>

}

XXIIvla = {
    \clef alto
    <<\XXIIvlan \forma>>

}

XXIIsoprano = {
    \new Voice = "braccio1"
    <<\XXIIsopranon \forma>>
}

XXIIalto = {
    \new Voice = "braccio2"
    <<\XXIIalton \forma>>
}

XXIIbc = {
    \clef bass
    <<\XXIIbcn \forma \XXIIbfn>>
}


global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

   \paper  {

      systems-per-page = #6

   }

    \header {
        title = \markup\smaller\center-column {"La Gloria e Imeneo [RV 687]"}
        composer = \markup \center-column{"A. Vivaldi (1678 - 1741)"}
    }

   \markup \huge \column{"[1.] [Recitativo] - Dall'eccelsa mia reggia"}

   \score {
      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
      }  <<

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 do'8^\markup\center-align "Gloria"  do'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "glo"
                \Ialto \global
                \new Lyrics \lyricsto "reggia" \ItestoII
            >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \Ibc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 20)
         indent = 2\cm

         \context {
            \Staff
            \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
         }

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #5
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

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[2.] And[an]te -  Alle amene franche arene}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Violino [I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Violino [II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 r4^\markup\center-align "[Gloria]" fa'16[sol']}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "glo"
                \IIalto\global
                \new Lyrics \lyricsto "arene" \IItestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

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

   \paper  {

      systems-per-page = #6

   }

   \markup \huge \column{"[3.] [Recitativo] - Or del polono cielo"}

   \score {
      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
      }  <<

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 mi'8^\markup\center-align "Imeneo"  mi'16 mi'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ime"
                \IIIsoprano \global
                \new Lyrics \lyricsto "cielo" \IIItestoI
            >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \IIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 20)
         indent = 2\cm

         \context {
            \Staff
            \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
         }

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #5
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

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[4.] All[egr]o -  Tenero fanciulletto}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Violino [I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Violino [II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \IVvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 2/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi r4^\markup\center-align "[Imeneo]" sol'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ime"
                \IVsoprano\global
                \new Lyrics \lyricsto "fanciulletto" \IVtestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \IVbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

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

   \paper  {

      systems-per-page = #6

   }

   \markup \huge {[5.] [Recitativo] - E voi Grazie ed Amori}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r4 sol'8^\markup\center-align "Ime[neo]" sol'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ime"
            \Vsoprano \global
            \new Lyrics \lyricsto "pregio" \VtestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key do\major \time 4/4 re'8^\markup\center-align "Glo[ria]" re'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \Valto \global
            \new Lyrics \lyricsto "grazie" \VtestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \Vbc\global
         >>
      >>

      \layout {
         #(layout-set-staff-size 16.5)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

   \markup \huge {[6.] All[egr]o - Questo nodo e questo strale}

   \score {
      \new ChoirStaff <<


         \new Staff <<
            \set Staff.instrumentName = \markup "Violette"
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \VIvla\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key do\major \time 2/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi si4^\markup\center-align "Glo[ria]" sol'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \VIalto \global
            \new Lyrics \lyricsto "nodo" \VItestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "Bassi"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \VIbc\global
         >>
      >>

      \layout {
         #(layout-set-staff-size 17)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

   \paper  {

      systems-per-page = #5

   }

   \markup \huge \column{"[7.] [Recitativo] - Dell'inclita Regina"}

   \score {
      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
      }  <<

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 4/4 r4 r8^\markup\center-align "Ime[neo]"  si' sol'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ime"
                \VIIsoprano \global
                \new Lyrics \lyricsto "regina" \VIItestoI
            >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \VIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 22)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #7
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

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[8.] And[an]te molto -  Scherzeran sempre d'intorno}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Violino [I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \VIIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"Violino [II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \VIIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \VIIIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 4/4 r2^\markup\center-align "[Imeneo]" la'4 la'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ime"
                \VIIIsoprano\global
                \new Lyrics \lyricsto "amoretti" \VIIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \VIIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

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

   \paper  {

      systems-per-page = #6

   }

   \markup \huge {[9.] [Recitativo] - Impaziente il desio}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 si'8^\markup\center-align "Im[eneo]" si'16 si'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ime"
            \IXsoprano \global
            \new Lyrics \lyricsto "ciglio" \IXtestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key do\major \time 4/4 sol'8^\markup\center-align "Glo[ria]" sol'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \IXalto \global
            \new Lyrics \lyricsto "desio" \IXtestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \IXbc\global
         >>
      >>

      \layout {
         #(layout-set-staff-size 16.5)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

   \paper  {

      systems-per-page = #4

   }

   \markup \huge {[10.] All[egr]o -  Godi pur ch'il caro sposo}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Violini]"\vspace #-0.3"unisoni"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \XvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \Xvla \global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key re\major \time 12/8\numericTimeSignature re'4.^\markup\center-align "[Gloria]" re'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \Xalto \global
            \new Lyrics \lyricsto "godi" \XtestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column {"[Bassi]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \Xbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 16)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
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

   \paper  {

      systems-per-page = #5

   }

   \markup \huge {[11.] [Recitativo] - Al vezzo al guardo}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 sol'8^\markup\center-align "Ime[neo]" si' si'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ime"
            \XIsoprano \global
            \new Lyrics \lyricsto "vezzo" \XItestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key do\major \time 4/4 sol'8^\markup\center-align "Glo[ria]" sol'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \XIalto \global
            \new Lyrics \lyricsto "amoroso" \XItestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \XIbc\global
         >>
      >>

      \layout {
         #(layout-set-staff-size 17)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[12.] All[egr]o - Care pupille}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \XIIvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \XIIvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \XIIvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sib\major \time 6/8\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi sol'4.^\markup\center-align "[Imeneo]" sib'8[la'] sol'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "ime"
                \XIIsoprano\global
                \new Lyrics \lyricsto "pupille" \XIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Basso]"
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \XIIbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

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

   \paper  {

      systems-per-page = #5

   }

   \markup \huge {[13.] [Recitativo] - Da innesto così augusto}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r2^\markup\center-align "Ime[neo]" do''8 do''16 do''}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ime"
            \XIIIsoprano \global
            \new Lyrics \lyricsto "auspici" \XIIItestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key do\major \time 4/4 r4 r8 la'8^\markup\center-align "Glo[ria]" fa'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \XIIIalto \global
            \new Lyrics \lyricsto "innesto" \XIIItestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \XIIIbc\global
         >>
      >>

      \layout {
         #(layout-set-staff-size 17)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

   \paper  {

      systems-per-page = #4

   }

   \markup \huge {[14.] And[an]te molto -  Al seren d'amica calma}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Violini]"\vspace #-0.3"unisoni"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \XIVvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \XIVvla \global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key fa\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi fa'8[^\markup\center-align "[Gloria]" do'' la']}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \XIValto \global
            \new Lyrics \lyricsto "calma" \XIVtestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column {"[Bassi]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \XIVbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 16)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
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

   \paper  {

      systems-per-page = #6

   }

   \markup \huge {[15.] [Recitativo] - Già della regal pompa}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 mi'8^\markup\center-align "Ime[neo]" mi'16 mi'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ime"
            \XVsoprano \global
            \new Lyrics \lyricsto "pompa" \XVtestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key do\major \time 4/4 r4 r8 mi'^\markup\center-align "Glo[ria]" sol'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \XValto \global
            \new Lyrics \lyricsto "sempre" \XVtestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \XVbc\global
         >>
      >>

      \layout {
         #(layout-set-staff-size 16.5)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

   \paper  {

      systems-per-page = #3

   }

   \markup \huge {[16.] All[egr]o - Vedrò sempre la pace}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \XVIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \XVIvlII\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \XVIvla\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key mi\minor \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r4 r8 si'^\markup\center-align "[Imeneo]" }
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ime"
            \XVIsoprano \global
            \new Lyrics \lyricsto "pace1" \XVItestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key mi\minor \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r4 r8 sol'^\markup\center-align "[Gloria]"}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \XVIalto \global
            \new Lyrics \lyricsto "pace2" \XVItestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \XVIbc\global
         >>
      >>

      \layout {
         #(layout-set-staff-size 16.5)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

   \paper  {

      systems-per-page = #5

   }

   \markup \huge {[17.] [Recitativo] -   Non  turbino giammai noiose cure}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r4 r8 sol'^\markup\center-align "Ime[neo]" si'16 si'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ime"
            \XVIIsoprano \global
            \new Lyrics \lyricsto "cure" \XVIItestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key do\major \time 4/4 r2 la'8^\markup\center-align "Glo[ria]" re'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \XVIIalto \global
            \new Lyrics \lyricsto "affetto" \XVIItestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \XVIIbc\global
         >>
      >>

      \layout {
         #(layout-set-staff-size 17.5)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

   \paper  {

      systems-per-page = #4

   }

   \markup \huge {[18.] All[egr]o -  Se ingrata nube languire il sole fa}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Violini"\vspace #-0.3"unisoni]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \XVIIIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \XVIIIvla \global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r4 r8 sol'^\markup\center-align "[Imeneo]" do'' [mi']}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ime"
            \XVIIIsoprano \global
            \new Lyrics \lyricsto "nube" \XVIIItestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column {"[Bassi]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \XVIIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 16)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
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

   \paper  {

      systems-per-page = #5

   }

   \markup \huge \column{"[19.] [Recitativo] - Invan potrà la sorte"}

   \score {
      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
      }  <<

             \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key do\major \time 4/4 r4 r8 mi'8^\markup\center-align "Glo[ria]"  la'}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "glo"
                \XIXalto \global
                \new Lyrics \lyricsto "sorte" \XIXtestoII
            >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \XIXbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 20)
         indent = 2\cm

         \context {
            \Staff
            \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
         }

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #6
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

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[20.] All[egr]o non molto - Ogn'or colmi d'estrema dolcezza}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl1"
                \XXvlI\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup\center-column {"[Violino II]"}
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vl2"
                \XXvlII\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup "[Viola]"
                \set Staff.midiInstrument = #"viola"
                \set Staff.shortInstrumentName = "vla"
                \XXvla\global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key mi\major \time 2/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi r4^\markup\center-align "[Gloria]" si'16[la']}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \set Staff.shortInstrumentName = "glo"
                \XXalto\global
                \new Lyrics \lyricsto "occhi" \XXtestoII
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso]"\vspace #-0.3"Senza Cembali"}
                \set Staff.midiInstrument = #"cello"
                \set Staff.shortInstrumentName = "bc"
                \XXbc\global
            >>
        >>

        \layout {

            #(layout-set-staff-size 15)
            indent = 2\cm

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

   \paper  {

      systems-per-page = #6

   }

   \markup \huge {[21.] [Recitativo] -   Delle regali nozze}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 mi'8^\markup\center-align "Ime[neo]" mi'16 mi'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ime"
            \XXIsoprano \global
            \new Lyrics \lyricsto "nozze" \XXItestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key do\major \time 4/4 r4 r16 sol'^\markup\center-align "Glo[ria]" mi' fa'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \XXIalto \global
            \new Lyrics \lyricsto "signor" \XXItestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \XXIbc\global
         >>
      >>

      \layout {
         #(layout-set-staff-size 17.5)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

}

\bookpart {

   \paper  {

      systems-per-page = #3

   }

   \markup \huge {[22.] All[egr]o - Duo - In braccio dei contenti}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Violino I]"}
            \set Staff.midiInstrument = #"recorder"
            \set Staff.shortInstrumentName = "vl1"
            \XXIIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \XXIIvlII\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"[Viola]"}
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \XXIIvla\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit do''8^\markup\center-align "Ime[neo]"  la'16[sol']}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ime"
            \XXIIsoprano \global
            \new Lyrics \lyricsto "braccio1" \XXIItestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key fa\major \time 3/8\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'8^\markup\center-align "Glo[ria]" fa'16[mi']}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "glo"
            \XXIIalto \global
            \new Lyrics \lyricsto "braccio2" \XXIItestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \XXIIbc\global
         >>
      >>

      \layout {
         #(layout-set-staff-size 16.5)
         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}