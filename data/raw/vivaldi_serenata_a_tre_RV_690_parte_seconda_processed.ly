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



IvlIn = \relative do'' {

   si16 la si la si la si la si la si la
   si do re do si do re do si re do si
   la si do si la si do si la do si la

   %4
   si do re do si do re do si re do si
   la4 r r
   si16 do re do si do re do si re do si

   %7
   mi4 r r\mbreak
   dod16 re mi re dod re mi re dod mi re dod
   fad4 r r

   %10
   si,16 la si la si la si la si la si la
   si re do? si la si la sol fad sol fad mi
   re sol fad mi re mi re do si do si la

   %13
   sol4 r r
   R2.*2
   si'16 la si la si la si la si la si la

   %17
   si4 r r
   R2.*5
   fad'16 mi fad mi fad mi fad mi fad mi fad mi

   %24
   fad4 r r
   R2.*8\mbreak
   si,16 do re do si do re do si do re si

   %34
   la si do si la si do si la si do la
   si sol fad mi re mi re do si do si la
   sol8 do re4. re8

   %37
   si'16 do re do si do re do si re do si
   la si do si la si do si la do si la\mbreak
   si la si la si la si la si la si la

   %40
   si re do si la si la sol fad sol fad mi
   re si' la sol fad sol fad mi re mi re do
   si4\fermata r r

   %43
   R2.\mbreak
   si'16 dod si dod si dod si dod la si la si
   sold la sold la sold la sold la sold la sold si

   %46
   la si la si la si la si sol? la sol la
   fad sol fad sol fad sol fad sol fad sol fad la
   sol la sol la sol la sol fad mi re dod si

   %49
   lad8 si fad'16 sol fad mi\mbreak fad8 fad
   si,4 r r
   R2.*8

   %59
   R2.\fermata

}

IvlIIn = \relative do'' {
   
   sol16 fad sol fad sol fad sol fad sol fad sol fad
   sol la si la sol la si la sol si la sol
   fad sol la sol fad sol la sol fad la sol fad
   
   %4
   sol la si la sol la si la sol si la sol
   fad4 r r
   sol16 la si la sol la si la sol si la sol
   
   %7
   do4 r r\mbreak
   la16 si dod si la si dod si la dod si la
   re4 r r
   
   %10
   sol,16 fad sol fad sol fad sol fad sol fad sol fad
   sol si la sol fad sol fad mi re mi re do
   si sol' fad mi re sol fad mi re mi re do
   
   %13
   si4 r r
   R2.*2
   sol'16 fad sol fad sol fad sol fad sol fad sol fad
   
   %17
   sol4 r r
   R2.*5
   re'16 do re do re do re do re do re do
   
   %24
   re4 r r
   R2.*8
   sol,16 la si la sol la si la sol la si sol
   
   %34
   fad sol la sol fad sol la sol fad sol la fad
   sol sol fad mi re mi re do si do si la
   sol8 do re4. re8
   
   %37
   sol16 la si la sol la si la sol si la sol
   fad sol la sol fad sol la sol fad la sol fad\mbreak
   sol fad sol fad sol fad sol fad sol fad sol fad
   
   %40
   sol si la sol fad sol fad mi re mi re do
   si si' la sol fad sol fad mi re mi re do
   si4\fermata r r
   
   %43
   R2.\mbreak
   si'16 dod si dod si dod si dod la si la si
   sold la sold la sold la sold la sold la sold si

   %46
   la si la si la si la si sol? la sol la
   fad sol fad sol fad sol fad sol fad sol fad la
   sol la sol la sol la sol fad mi re dod si

   %49
   lad8 si fad'16 sol fad mi\mbreak fad8 fad
   si,4 r r
   R2.*8

   %59
   R2.\fermata
   
}

Ivlan = \relative do' {
   
   R2.*4
   fad16 sol la sol fad sol la sol fad sol fad mi
   re4 r r
   
   %7
   mi16 fad sol fad mi fad sol fad mi fad mi re\mbreak
   dod4 r r
   fad16 sol la sol fad sol la sol fad mi re do?
   
   %10
   si8 sol sol sol sol sol
   sol sol sol sol sol sol
   sol sol sol sol sol sol
   
   %13
   sol4 r r
   R2.*2 
   sol'16 fad sol fad sol fad sol fad sol fad sol fad
   
   %17
   sol4 r r
   R2.*5
   re'16 do re do re do re do re do re do
   
   %24
   re4 r r
   R2.*12
   re,8 re re re re re 
   
   %38
   re re re re re re
   re4 r r
   R2.
   
   %41
   r16 sol fad mi re mi re do si do si la
   sol4\fermata r r
   R2.\mbreak
   
   %44
   si'8 si si si la[la]
   sold sold sold sold sold sold
   la la la la sol![sol]
   
   %47
   fad fad fad fad fad fad
   sol sol sol16 la sol fad mi re dod si
   lad8 si fad'16 sol fad mi\mbreak fad8 fad,
   
   %50
   si4 r r
   R2.*8
   R2.\fermata

}

Itenoren = \relative do {

   \autoBeamOff

   R2.*12
   r4 re'4. mi8
   re8.[do16 si8.] la16 sol4\mbreak
   
   %15
   mi'8 re do2
   si r4
   r re4. mi8
   
   %18
   re8. si16 sol4 mi'8 do
   la[sol] la4 re8 mi16 fad
   sol8 sol, mi'4. mi8\mbreak
   
   %21
   mi4 re mi8 dod
   la re dod4. re8
   re2 r4
   
   %24
   r re4. do8
   si8. la16 sol4 mi'8. mi16
   mi4 re re8. re16\mbreak
   
   %27
   sol8 mi do4. do8
   fad re si4. si8
   mi do la4. si8
   
   %30
   do8.[si16] do4 re8. do16
   si8 la16[sol] la4. sol8
   sol4 si4. do8\mbreak
   
   %33
   re2.~
   re~
   re4. mi8 re do
   
   %36
   si la16[sol] si4(la8\tr) sol
   sol4 r r
   R2.*4
   
   %42
   r4 si4. do8
   si4. mi8 red mi\mbreak
   fad4 si, red8. red16
   
   %45
   mi4 si8 si mi re
   dod4 dod mi8 la,
   re4 re8 fad re8. do16
   
   %48
   do4 si si8. dod16
   fad,8 re' dod4\tr~\mbreak dod8 si
   si4 r si8. si16
   
   %51
   red4 red8 fad red8. mi16
   mi4 si sol'8 mi
   do4. do8 do si\mbreak
   
   %54
   si2 mi8 si
   do2.
   red
   
   %57
   mi4(si) mi
   fad red2\mbreak   
   mi2.\fermata
   
}

ItestoIII = \lyricmode {

   Ac -- que pla -- cide _ che cor -- re -- te, ac -- que pla -- cide _ che cor -- re -- te,
   dolce _  i -- ma --  go_a me por -- ge -- te 
   di so -- ave _ li -- ber -- tà.
   
   Ac -- que pla -- cide _ che cor -- re -- te,
   dol -- ce_i -- ma --  go_a me por -- gete _ dol -- ce_i -- ma --  go_a me por -- ge -- te
   di so -- ave _ li -- ber -- tà, di so -- a -- ve di so -- ave _ li -- ber -- tà.
   
   E da voi ben so -- lo_ap -- prendo _
   girne _ sciolto _ ogn’or _ fu[g] -- gendo _ girne _ sciolto _ ogn’or _ fu[g] -- gendo _
   quel do -- lor ch’amor _ ne dà,
   girne _ sciolto _ ogn’or _ fu[g] -- gendo _ 
   quel do -- lor ch’amor _ ne dà, quel do -- lor - - 
   ch’a -- mor ne dà.

}

Ibcn = \relative do {

   R2.*4
   \clef tenor \key sol\major re'16 mi fad mi re mi fad mi re mi re do
   si4 r r

   %7
   do16 re mi re do re mi re do re do si\mbreak
   la4 r r
   re16 mi fad mi re mi fad mi re do si la

   %10
   \clef bass \key sol\major sol8 sol, sol sol sol sol
   sol sol sol sol sol sol
   sol\p sol sol sol sol sol

   %13
   sol4 r r
   R2.*4
   sol'16\pp la sol la sol la sol la sol la sol la

   %19
   fad sol fad sol fad sol fad sol fad sol fad sol
   mi fad mi fad mi fad mi fad mi fad mi sol\mbreak
   fad sol fad sol fad sol fad la sol la sol la

   %22
   fad8 re la'4 la,
   re r r
   R2.

   %25
   sol16 la sol la sol la sol la sol la sol la
   fad sol fad sol fad sol fad sol fad sol fad sol\mbreak
   mi fad mi fad mi fad mi fad mi fad mi fad

   %28
   re mi re mi re mi re mi re mi re mi
   do re do re do re do re do re do mi
   re mi re mi re mi re  mi re mi fad re

   %31
   sol8 sol, re'4 re,
   sol r r\mbreak
   R2.*4

   %37
   sol8 sol sol sol sol sol
   re' re re re re re\mbreak
   sol,4 r r

   %40
   R2.
   r16 sol' fad mi re mi re do si do si la
   sol4\fermata r r

   %43
   R2.*7
   si'16 dod si dod si dod si dod si dod si dod
   la si la si la si la si la si la si

   %52
   sol la sol la sol la sol fad mi fad mi fad
   red fad red fad red fad red fad red fad red fad\mbreak
   sol la sol la sol la sol la sol la sol si

   %55
   la si la si la si la si la si la do
   si do si do si do si do si do si la
   sol la sol la sol la sol fad mi re do si

   %58
   la4 si2\mbreak
   mi,2._\fermata

}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 3/4
   \key sol\major
   \tempo 4 = 60
   s2.*59
   \bar "|."
   \mark\markup  "D.C."

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

Itenore = {
   \new Voice = "acque"
   <<\Itenoren \forma>>
}

Ibc = {
   \clef bass
   <<\Ibcn \forma \Ibfn>>
}




IIsopranoIn = \relative do'' {

   \autoBeamOff

   R1*2
   r2 r4 r16 sol sol sol\mbreak
   do8 do r mi do do r8 re
   sib sib la sol fad fad r4
   do'8 do16 do do8 sib sol sol r4
   R1*5
   R1\fermata

}

IItestoI = \lyricmode {

   Or ve -- di_Al -- cindo _ in questo _
   fio --  ri -- to,_a -- meno _ colle _
   tutto _ spirar _ a -- more. _

}

IIsopranoIIn = \relative do'' {

   \autoBeamOff

   R1*6
   re4 r16 re re re\mbreak sib4 r8 re
   sol, sol r4 re'8 re16 re re8 mi

   %9
   mi mi r4 mi8 si re re16 do
   la4 do8 do16 re mib8 mib r4\mbreak
   mi8 do16 do do8 sib sib sib  dod re

   %12
   la la r4 r2\fermata

}

IItestoII = \lyricmode {

   Deh os -- serva _ sì, ten priego, _
   come _ quel zeffi - retto _
   fido _ bacia _ quel fior, indi _ quell’ onda _
   lambe _ cos -- tan -- te_ogn’ or la verde _ sponda. _

}

IItenoren = \relative do' {

   \autoBeamOff

   do8 sol16 mi' do4 r8 do do16 do do re
   sib8 sib r sib sib sib sib la
   la4 r16 la si do sol8 sol r4
   R1*8
   R1\fermata

}

IItestoIII = \lyricmode {

   Ten -- ta lo so, ma pur lo ten -- ta_in -- vano _
   d’in -- cate - nar -- mi_il cuor la nin -- fa_Eu -- rilla. _

}

IIbcn = \relative do {

   do1~
   do
   fa2 sol4 do,~\mbreak

   %4
   do1
   dod2 do~
   do sib~

   %7
   sib1~
   sib
   sold

   %10
   la2 fad~\mbreak
   fad sol?
   la re,\fermata

}

IIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 65
   s1*12
   \bar "|."

}

IIsopranoI = {
   \new Voice = "vedi"
   <<\IIsopranoIn \forma>>
}


IIsopranoII = {
   \new Voice = "deh"
   <<\IIsopranoIIn \forma>>
}

IItenore = {
   \new Voice = "tenta"
   <<\IItenoren \forma>>
}

IIbc = {
   \clef bass
   <<\IIbcn \forma \IIbfn>>
}





IIIvlIn = \relative do'' {

   sib16 do
   re8 re re mib re[sib 16 do re8 re]
   re[re re do16 sib] sib8 la r la16 sib
   do8[la16 sib do8 re] do[la16 sib do8 re]

   %4
   do[do do sib16 la]sib la sib8 r re
   mib[mib mib re16 do] re8 re, re re'
   do do, do do' sib sib, sib sib'\mbreak

   %7
   la sol16 la re,8[fad] sol4 r8 sib16 do
   re8 re re mib re[sib16 do re8 re]
   re sib16 [do re8 do16 sib]  sib8 la r la16 sib

   %10
   do8 [la16 sib do8 re] do [la16 sib do8 re]\mbreak
   do[do do sib16 la] sib16 la sib8 r4
   R1*2

   %14
   r8 sol sib re mib[mib mib re16 do]
   re8 re, re re' do do, do do'\mbreak
   sib sib, sib sib'  la [sol16 la re,8 fad]

   %17
   sol4 r8 re'16 mib fa8 fa fa fa
   fa[re16 mib fa8 fa] fa [fa fa mib16 re]
   mib re mib8 r do16 re mib8 mib mib mib

   %20
   mib [do16 re mib8 mib]\mbreak
   mib[mib mib re16 do] re do re8 re sol,
   re' sol, re' sol, re' sol, re' sol,

   %23
   re' sol, re' sol, mib'[(re16 do sib8 la)]
   re8[(do16 sib la8 sol)] fad8 mib' re sol,
   sib4(la\tr)\mbreak sol r8 re'

   %26
   mib[mib mib re16 do] re8 re, re re'
   do do, do do' sib sib, sib sib'
   la[sol16 la re,8 fad] sol4 re'8 re

   %29
   re[mib!16 dod re8 re]\mbreak re[mi16 fad sol8 sol,]
   sib4(la\tr) sol8 sol sib re
   mib[mib mib re16 do] re8 re, re re'

   %32
   do do, do do' sib sib, sib sib'
   la[sol16 la re,8 fad] sol4\fermata r
   R1*3

   %37
   r4 la8 re sib la la re
   sib la la re sib la la re
   dod8 si16 la fa'8 mi16 re dod8 si16 la fa'8 mi16 re

   %40
   dod2\tr \mbreak re4 r8 fa16 sol
   la8[la la sol16 fa] sol8 sol sol fa16 mi]
   fa8 re r4 r2

   %43
   R1*3
   R1\fermopz

}

IIIvlIIn = \relative do'' {
   
   sol16 la
   sib8 sib sib do sib[sol16 la sib8 sib]
   sib[sib sib la16 sol] sol8 fad r fad16 sol
   la8[fad16 sol la8 sib] la[fad16 sol la8 sib]
   
   %4
   la[la la sol16 fad] sol fad sol8 r re'
   mib[mib mib re16 do] re8 re, re re'
   do do, do do' sib sib, sib sib'\mbreak

   %7
   la sol16 la re,8[fad] sol4 r8 sol16 la
   sib8 sib sib do sib[sol16 la sib8 sib]
   sib[sol16 la sib8 la16 sol] sol8 fad r fad16 sol
   
   %10
   la8[fad16 sol la8 sib]  la8[fad16 sol la8 sib]\mbreak
   la[la la sol16 fad] sol8 sol r4
   R1*2
   
   %14
   r8 sol sib re mib[mib mib re16 do]
   re8 re, re re' do do, do do'\mbreak
   sib sib, sib sib'  la [sol16 la re,8 fad]

   %17
   sol4 r8 si16 do re8 re re re
   re [si16 do re8 re] re[re re do16 si]
   do[si] do8 r8 la16 sib? do8 do do do
   
   %20
   do[la16 sib do8 do] \mbreak 
   do8 [do do sib16 la] sib8 sib sib\noBeam r
   sib r sib r sib r sib r
   
   %23
   sib r sib r sol4 r
   R1
   r2\mbreak r4 r8 re'

   %26
   mib[mib mib re16 do] re8 re, re re'
   do do, do do' sib sib, sib sib'
   la[sol16 la re,8 fad] sol4 sib8 sib
   
   %29
   sib r sib sib\mbreak sib r r sol
   sol4 fad sol r8 re'
   mib[mib mib re16 do] re8 re, re re'

   %32
   do do, do do' sib sib, sib sib'
   la[sol16 la re,8 fad] sol4\fermata r
   R1*3

   %37
   r4 fa8 fa sol fa fa la
   sol fa fa la sol fa fa la
   la dod re mi16 fa mi8 re16 dod re8 fa,
   
   %40
   mi2\mbreak fa4 r8 re'16 mi
   fa8[fa fa mi16 re] mi8[mi mi re16 dod]
   re8 la r4 r2
   
   %43
   R1*3
   R1\fermopz
   
}

IIIvlan = \relative do' {
   
   sol8
   sol sol sol sol sol sol sol sol
   sol sol sol sol re' re re re
   re re re re re re re re
   
   %4
   re re re re sol, sol r sib'
   sol4 la fa r8 re'
   sol,4 la re, r8 re\mbreak
   
   %7
   mib4 la,8 re sib4 r8 sol
   sol sol sol sol sol sol sol sol
   sol sol sol sol re' re re re
   
   %10
   re re re re re re re re\mbreak
   re re re re sol, sol r4
   R1*2
   
   %14
   r8 re' sol sib sol4 la
   fa r8 re' sol,4 la\mbreak
   re,4 r8 re mib4 la,8 re
   
   %17
   sib4 r8 sol sol sol sol sol
   sol sol sol sol sol sol sol sol
   do4 r8 fa, fa fa fa fa
   
   %20
   fa fa fa fa\mbreak 
   fa fa fa fa sib sib sol\noBeam r
   sol r sol r sol r sol r
   sol r sol r sol4 r
   
   %24
   R1*4
   r2 r4 sol'8 sol
   sol r sol sol\mbreak sol r r sol,
   
   %30
   re'2 sol,8 re' sol sib
   sol4 la fa r8 re'
   sol,4 la re, r8 re
   
   %33
   mib4 la,8 re\mbreak sib4\fermata r
   R1*3
   r4 re8 re re re re re
   
   %38
   re re re re re re re re
   la la la la la la la la
   la4 la\mbreak re r8 la'
   
   %41
   la4 r8 la dod4 r8 dod
   la fa r4 r2
   R1*3
   
   %46
   R1\fermopz
   
}

IIIsopranoIIn = \relative do'' {

   \autoBeamOff

   r8
   R1*6
   r2 r4 r8 sib16 do
   re8 re re mib re sib16 [do] re8 re

   %9
   re sib16 do re8 do16 [sib]  sib8 la r la16 sib
   do8  la16 sib do8 re] do la16 [sib] do8 re\mbreak
   do do do sib16 [la] sib16[la] sib8 re mib

   %12
   re mib re mib re mib re mib
   re do16[sib] la8 sol sib4(la\tr)
   sol4 r r2

   %15
   R1*2
   r4 r8 si16 do re8 re re re
   re si16[do] re8 re re re re do16[si]
   do[si] do8 r8 do16 re mib8 mib mib mib

   %20
   mib do16 [re] mib8 mib\mbreak
   mib mib mib re16 [do] re [do] re8 re sol,
   re' sol, re' sol, re' sol, re' sol,

   %23
   re' sol, re' sol, mib'[(re16 do sib8 la)]
   re8[(do16 sib la8 sol)] fad8 mib' re sol,
   sib4(la\tr)\mbreak sol r

   %26
   r4 do8 do do4 sib
   r la8 la la4 sol8 re'
   mib sib la16[sib do re] sib8 sol re' re

   %29
   re mib!16 [dod] re8 re\mbreak re mi16 [fad] sol8 sol,
   sib4(la\tr) sol r
   R1*2

   %33
   r2 r4 la8 re
   mi la, r mi' fa[mi] re mi
   dod[si] la4 r la8 re

   %36
   sib[la] sol sib do[re] do sib\mbreak
   la16[sol] fa8 r4 r la8 re
   sib la la re sib la la re

   %39
   dod8 [si16 la] fa'8 [mi16 re] dod8 si16 la fa'8 mi16 re
   dod2\tr \mbreak re4 r
   R1

   %42
   r4 re8 fa si, do fa mib16 re
   mib16[re] do8 do mib\mbreak la, sib mib re16 do
   re[do] sib8 sib do la sib do sib16 la

   %45
   sib[re do sib] do[mib re do] re8 do16 sib fa'8 sib,\mbreak
   re4(do\tr) sib2\fermata

}

IIItestoII = \lyricmode {

   Come _ l’er -- ba_in vago _ prato _ 
   se lan -- guisce _ o_un mesto _ fiore, _ come _ l’er -- ba o_un mesto _ fiore, _ 
   se lan -- gui -- sce_in vago _ prato _ 
   dal ru -- scello _ vita _ prende, _ dal ru -- scello _ vita _ pren -- de.
   
   Come _ l’er -- ba che lan -- guisce _ che lan -- gui -- sce_in vago _ prato _ 
   vago _ fiore _ che lan -- guisce _ che lan -- gui -- sce_in vago _ prato _ 
   dal ru -- scello _ vita _ prende, _ l'er -- ba_il fio -- re_in  vago _ pra - - to 
   vita _ prende, _ l'er -- ba_e_il fio -- re l'er -- ba_e_il fio -- re in  vago _ pra - to 
   dal ru -- scello _ dal ru -- scello _ vita _ prende. _
   
   Sì d’Al -- cindo _ il vol -- to_a -- ma - to
   della _ vaga _ Eu -- rilla _ al core _ 
   fiamma _ degna _  fiamma _ de -- gna_e spir -- to_ac -- cen - - de
   e spir -- to ac -- cen -- de.
   
   Sì d’Al -- cindo _ il vol -- to_a -- ma -- to, sì d’Al -- cindo _ il vol -- to_a -- ma -- to
   fiamma _ de -- gna e spir -- to_ac -- cen - - de
    e spir -- to_ac -- cen -- de.

}

IIIbcn = \relative do {

   r8
   R1*3
   r2 r4 r8 sol'
   do4 fa, sib r8 sib

   %6
   mi,4 fad sol r8 sib,\mbreak
   do4 re sol, r
   R1*3\mbreak

   %11
   r2 r4 sol
   sol sol sol sol
   sol r8 sol re'4 re,

   %14
   sol r8 sol' do4 fa,
   sib r8 sib mi,4 fad\mbreak
   sol r8 sib, do4 re

   %17
   sol, r r2
   R1*2
   R2\mbreak

   %21
   r2 r4 sol8 r
   sol r sol r sol r sol r
   sol r sol r do4 r

   %24
   sib do re8 do sib sol
   re'4 re,\mbreak sol'8 la sib sol
   do4 fa, sib r8 re,

   %27
   mi4 fad sol r8 sib,
   do4 re sol, r
   R1

   %30
   r2 sol4  r8 sol'
   do4 fa, sib r8 sib
   mi,4 fad sol r8 sib,

   %33
   do4 re\mbreak sol,\fermata fa'8 re
   la si dod la re mi fa sol
   la sol fa mi fa mi fa re

   %36
   sol la sib sol mi re mi do\mbreak
   fa8 fa, r4 r2
   R1*2

   %40
   r2 r4 r8 re'
   re4 r8 re la4 r8 la
   re4 fa8 re sol mib re[sol,]

   %43
   do re mib do\mbreak fa re do[la]
   sib do re[mib]fa re mib[fa]
   sib,4 la sib8 do re sib\mbreak

   %46
   fa'2 sib,_\fermata

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key sol\minor
   \tempo 2 = 60
   \partial 8 s8
   s1*19
   \set Score.measureLength = #(ly:make-moment 2 4) s2
   \set Score.measureLength = #(ly:make-moment 4 4) s1*26
   \bar "|."
   \mark\markup "D.C."

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


IIIsopranoII = {
   \new Voice = "erba"
   <<\IIIsopranoIIn \forma>>
}

IIIbc = {
   \clef bass
   <<\IIIbcn \forma \IIIbfn>>
}




IVsopranoIn = \relative do'' {

    \autoBeamOff
    
    R1*4
    r4 r8 la re re re re
    si4 r16 do16 fa mib do8 do r4\fermata

}

IVtestoI = \lyricmode {
   
   Ma ti -- mido _ noc -- chier non giun -- ge_al lido. _
 
}

IVtenoren = \relative do' {

    \autoBeamOff
    
    sib8 sib sib sib16 do re4 r16 do mib re
    sib?8 sib r16 re re re si8 si r si
    si si si si mi mi r4
    mi8 si re dod16 si dod8 dod r16 re sol fa
    re8 re r4 r2
    R1\fermopz

}

IVtestoIII = \lyricmode {
   
   A suo grado _ scherzar _ può ben Eu -- rilla, _
   ma so ben io _che a voli _ più su -- blimi _ 
   spiega _  l’a -- li_a -- mo -- rose _ il suo Cu -- pido. _

}

IVbcn = \relative do {
   
   sib1~
   sib2 fa'~
   fa sold,~
   sold
   sol
   la4 re~re2
   re sol4 do,\fermata

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    
    




}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 60
    s1*6
    \bar "|."

}

IVsopranoI = {
    \new Voice = "timido"
    <<\IVsopranoIn \forma>>
}

IVtenore = {
    \new Voice = "grado"
    <<\IVtenoren \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
}





VvlIn = \relative do'' {

   r4 fa,8 sib
   sib[la16 sib do8 mib,]
   mib\tr[fa sib, do]
   re\tr[do16 sib re8 mib]

   %5
   fa4 fa8 sib
   sib[la16 sib do8 mib,]
   mib\tr[re sib do]

   %8
   re\tr[do16 sib re8 mib]
   fa4 r16 fa sol la
   sib8[sib sib16 do re mib]

   %11
   fa8[fa16 mib fa8 la,]
   sol[mib'16 re mib8 sol,]\mbreak
   fa[re'16 do re8 fa,]

   %14
   mib[do'16 sib do8 mib,]
   mib\trill[re sib' re,]
   mib\trill[re sib' re,]

   %17
   mib\trill[re sib' sib,]
   do\tr[sib sib' sib,]
   do\tr[sib sib16 do re mib]

   %20
   fa8.[re16 mib fa sol la]
   sib8.\tr [la16 sib do re mib]
   fa mib re do re do sib la

   %23
   sib la sol fa sol fa mib re
   mib re do sib fa'8 fa\mbreak
   sol,2\tr~

   %26
   sol4 fa'8 sib
   sib[la16 sib do8 mib,]
   mib\tr[re sib do]

   %29
   re\tr[do16 sib re8 mib]
   fa4 fa8 sib
   sib[la16 sib do8 mib,]

   %32
   mib\tr[re sib do]
   re\tr[do16 sib re8 mib]
   fa4 r16 fa sol la

   %35
   sib8[fa re do16 sib]
   sol'8\tr[fa fa16 fa sol la]\mbreak
   sib8[sib sib16 do re mib]

   %38
   fa8[fa16 mib fa8 la,]
   sol8 [mib'16 re mib8 sol,]
   fa[re'16 do re8 fa,]

   %41
   mib[do'16 sib do8 mib,]
   mib\tr[re sib' re,]
   mib\tr[re sib' re,]

   %44
   mib8.\tr[re16 mib fa sol la]
   sib8.\tr[la16 sib do re mib]
   fa8 fa, r16 sol la sib

   %47
   do8[sib16 la sib do re mi]
   fa4 fa8 fa\mbreak
   fa16 mi re do re do sib la

   %50
   sib la sol fa sol fa mi re
   do8[mi fa sib]
   sib[la16(sib) do(sib) la(sol)]

   %53
   fa4 r8 sib
   sib[la16(sib) do(sib) la(sol)]
   fa4 fa8 sib

   %56
   sib[la16 sib do8 mib,?]
   mib\tr[re sib do]
   re\tr[do16 sib re8 mib]

   %59
   fa4 fa8 sib\mbreak
   sib[la16 sib do8 mib,]
   mib\tr[re sib do]

   %62
   re\tr[do16 sib re8 mib]
   fa4 r16 fa sol la
   sib8[do16(re) mib(re) do(sib)]

   %65
   la8 fa fa4
   re16 fa sib fa re fa sib fa
   mib sol sib sol mib sol sib sol

   %68
   re fa sib fa re fa sib fa
   mib sol sib sol mib sol sib sol
   mi sol do sol mi sol do sol\mbreak

   %71
   fa la do la fa la do la
   mi sol do sol mi sol do sol
   la8 fa r re'

   %74
   mib[mib, re re']
   do[do, sib sib']
   la[la, sol sol']

   %77
   fa16 sol la fa sol la sib sol
   la sib do la sib do re sib
   la8.\tr[sol16 fa mib re do]

   %80
   sib8.\tr[la16 sib do re mib]
   fa8.\tr [re16 mib fa sol la]\mbreak
   sib8. [la16 sib do re mib]

   %83
   fa mib re do re do sib la
   sib la sol fa sol fa mib re
   mib[fa sol la sib8 mib]

   %86
   mib[re16(mib) fa(mib)re(do)]
   sib4 r8 mib,
   mib[re16(mib) fa(mib)re(do)]

   %89
   sib4 r8 mib
   mib[re16(mib) fa(mib)re(do)]
   sib4  fa'8 sib

   %92
   sib[la16 sib do8 mib,]
   mib\tr[re sib do]
   re\tr[do16 sib re8 mib]\mbreak

   %95
   fa4 fa8 sib
   sib [la16 sib do8 mib,]
   mib\tr[re sib do]

   %98
   re\tr[do16 sib re8 mib]
   fa4 r16 fa sol la
   sib8[sib sib16 do re mib]

   %101
   fa8 [fa, mib mib']
   re[re, do do']
   sib[sib, la la']

   %104
   sol fa16 mib fa8 mib16 re
   mib8\tr[re sib' re,]
   mib\tr[re sib' re,]\mbreak

   %107
   mib8.\tr[re16 mib fa sol la]
   sib8.\tr[la16 sib do re mib]
   fa mib re do re do sib la

   %110
   sib la sol fa sol fa mib re
   mib8[re16(mib) fa(mib) re (do)]
   re8[sib sib mib]

   %113
   mib8[re16(mib) fa(mib) re (do)]
   re8[sib sib mib]
   mib8[re16(mib) fa(mib) re (do)]
   sib4 \fermata  r8 sol'

   %117
   sib [la16 sib sol8 la]\mbreak
   sib8[la16 sib sol8 sib]
   do[sib16 do la8 re]

   %120
   sib16 do re sib sol la sib sol
   fad sol la fad re8 re'
   mib[mib, re re']

   %123
   do[do, sib sib']
   la[la, sol sol']
   fad[mi16 re sib'8 sol]

   %126
   fad[mi16 re sib'8 sol]
   fad[re fad re]\mbreak
   sol[do, re re]

   %129
   sol,16 la sib sol la sib do la
   sib do re sib do re mib do
   re8[sol, sol re']

   %132
   re4\tr~re16 mi fa sol
   la8 la, r dod
   re\tr[dod la' dod,]

   %135
   re\tr[dod la' dod,]
   re\tr dod fa dod\mbreak
   re[mi fa re]

   %138
   sol[fa16(sol) la(sol) fa(mi)]
   re8[mi fa re]
   sol[fa16(sol) la(sol) fa(mi)]

   %141
   re2\fermata

}

Vtenoren = \relative do {

   \autoBeamOff

   R2*25
   r4 r8 fa'
   re4 mib8 mib

   %28
   fa4 sib,8 mib
   fa[mib16 re] do8 sib
   la[sol] fa fa'

   %31
   re4 mib8. mib16
   fa4 sib,8 mib
   fa[mib16 re] do8 sib

   %34
   la[sol] fa4
   R2
   r4 r8 fa\mbreak

   %37
   sib4 sib16[do] re[mib]
   fa8[fa16 mib fa8 la,]
   sol[mib'16 re mib8 sol,]

   %40
   fa[re'16 do re8 fa,]
   mib[do'16 sib do8 mib,]
   mib\tr[re sib' re,]

   %43
   mib\tr[re sib' re,]
   mib8.[re16 mib fa sol la]
   sib8.[la16 sib do re mib]

   %46
   fa4 fa,
   r4 r8 do'
   fa4 fa8 fa\mbreak

   %49
   fa16[mi re do] re[do sib la]
   sib[la sol fa] sol[fa mi re]
   do8[mi] fa sib

   %52
   sib[la16 sib] do[sib] la[sol]
   fa4 r8 sib
   sib[la16 sib] do[sib] la[sol]

   %55
   fa4 r
   R2*3
   r4 r8 fa'\mbreak

   %60
   re4 mib8. mib16
   fa4 sib,8 mib
   fa[mib16 re] do8 sib

   %63
   la[sol] fa4
   R2
   r4 r8 fa

   %66
   sib4 sib8 sib
   sib2~
   sib

   %69
   sib4 r8 sol
   do4 do8 do\mbreak
   do2~

   %72
   do
   do4 r8 fa
   sol4 fa

   %75
   mib re
   do sib
   la16[sib do la] sib[do re sib] %%% fin qui

   %78
   do[re mib do] re[mib fa re]
   do8 fa, r4
   r r8 sib

   %81
   la[sol16 fa sol la sib do]\mbreak
   re8.[do16 re mib fa sol]
   fa[mib re do] re[do sib la]

   %84
   sib[la sol fa] sol[fa mib re]
   mib[fa sol la] sib8 mib
   mib[re16 mib] fa[mib] re[do]

   %87
   sib4 r8 mib
   mib[re16 mib] fa[mib] re[do]
   sib4 r8 mib

   %90
   mib[re16 mib] fa[mib] re[do]
   sib4 r
   R2*24

   %116
   r4 r8 sol
   sib[la] sol la\mbreak
   sib[la] sol sib

   %119
   do[sib] la re
   sib[la] sol4
   r r8 re'

   %122
   mib4 re8 re
   do4 sib8 sib
   la4 sol8 sol

   %125
   fad[mi16 re sib'8 sol]
   fad[mi16 re sib'8 sol]
   fad[mi16 re] re'8 do\mbreak

   %128
   sib4 la8\tr sol
   sol4 r
   R2

   %131
   r4 r8 re'
   re[fa] mi re
   dod[si] la la

   %134
   la2~
   la~
   la8[si16 do]re8 mi\mbreak

   %137
   fa[mi] re la
   sib4 mi,8 dod'
   re4 r8 la

   %140
   sib4 mi,8 dod'
   re2\fermata

}

VtestoIII = \lyricmode {

   Del -- l’al -- ma su -- perba _ 
   la fiamma _ ri -- serba _ la fiamma _ ri -- serba _
   del -- l’al -- ma su -- perba _
   per chi può_in -- al -- zar - - - - - - - - ti
   per chi può_in -- al -- zar - - - - ti
   d’un so -- glio_al ful -- gor,  d’un so -- glio_al ful -- gor.
   
   Del -- l’al -- ma su -- perba _ 
   la fiamma _ ri -- serba _ 
   per chi può_in -- al -- zar -- ti per chi può_in -- al -- zar -- ti
   d’un so - - - - - - - - - - glio d’un so - - - - - - glio  d’un so -- glio_al ful -- gor, 
   d’un so -- glio_al ful -- gor d’un so -- glio_al ful -- gor.
   
   Né per -- der l’a -- more _
   del grande _ tuo co -- re del grande _ tuo co -- re 
   del grande _ tuo co - - re
   con vi -- le pa -- stor,  
   
   né per -- der l’a -- more _
   del gran -- de tuo core _ 
   con vi -- le pa -- stor con vi -- le pa -- stor. 

}

Vfgn = \relative do {

   r4 fa8 sib
   sib[la16 sib do8 mib,]
   mib\tr[fa sib, do]
   re\tr[do16 sib re8 mib]

   %5
   fa4 fa8 sib
   sib[la16 sib do8 mib,]
   mib\tr[re sib do]

   %8
   re\tr[do16 sib re8 mib]
   fa4 r16 fa sol la
   sib8[sib sib16 do re mib]

   %11
   fa8[fa16 mib fa8 la,]
   sol[mib'16 re mib8 sol,]\mbreak
   fa[re'16 do re8 fa,]

   %14
   mib[do'16 sib do8 mib,]
   mib\trill[re sib' re,]
   mib\trill[re sib' re,]

   %17
   mib\trill[re sib' sib,]
   do\tr[sib sib' sib,]
   do\tr[sib sib16 do re mib]

   %20
   fa8.[re16 mib fa sol la]
   sib8.\tr [la16 sib do re mib]
   fa mib re do re do sib la

   %23
   sib la sol fa sol fa mib re
   mib re do sib fa'8 fa,\mbreak
   sol2\tr~

   %26
   sol4 fa'8 sib
   sib[la16 sib do8 mib,]
   mib\tr[re sib do]

   %29
   re\tr[do16 sib re8 mib]
   fa4 fa8 sib
   sib[la16 sib do8 mib,]

   %32
   mib\tr[re sib do]
   re\tr[do16 sib re8 mib]
   fa4 r16 fa sol la

   %35
   sib8[fa re do16 sib]
   sol'8\tr[fa fa16 fa sol la]\mbreak
   sib8[sib sib16 do re mib]

   %38
   fa8[fa16 mib fa8 la,]
   sol8 [mib'16 re mib8 sol,]
   fa[re'16 do re8 fa,]

   %41
   mib[do'16 sib do8 mib,]
   mib\tr[re sib' re,]
   mib\tr[re sib' re,]

   %44
   mib8.\tr[re16 mib fa sol la]
   sib8.\tr[la16 sib do re mib]
   fa8 fa, r16 sol la sib

   %47
   do8[sib16 la sib do re mi]
   fa4 fa8 fa\mbreak
   fa16 mi re do re do sib la

   %50
   sib la sol fa sol fa mi re
   do8[mi fa sib]
   sib[la16(sib) do(sib) la(sol)]

   %53
   fa4 r8 sib
   sib[la16(sib) do(sib) la(sol)]
   fa4 fa8 sib

   %56
   sib[la16 sib do8 mib,?]
   mib\tr[re sib do]
   re\tr[do16 sib re8 mib]

   %59
   fa4 fa8 sib\mbreak
   sib[la16 sib do8 mib,]
   mib\tr[re sib do]

   %62
   re\tr[do16 sib re8 mib]
   fa4 r16 fa sol la
   sib8[do16(re) mib(re) do(sib)]

   %65
   la8 fa fa4
   re16 fa sib fa re fa sib fa
   mib sol sib sol mib sol sib sol

   %68
   re fa sib fa re fa sib fa
   mib sol sib sol mib sol sib sol
   mi sol do sol mi sol do sol\mbreak

   %71
   fa la do la fa la do la
   mi sol do sol mi sol do sol
   la8 fa r re'

   %74
   mib[mib, re re']
   do[do, sib sib']
   la[la, sol sol']

   %77
   fa16 sol la fa sol la sib sol
   la sib do la sib do re sib
   la8.\tr[sol16 fa mib re do]

   %80
   sib8.\tr[la16 sib do re mib]
   fa8.\tr [re16 mib fa sol la]\mbreak
   sib8. [la16 sib do re mib]

   %83
   fa mib re do re do sib la
   sib la sol fa sol fa mib re
   mib[fa sol la sib8 mib]

   %86
   mib[re16(mib) fa(mib)re(do)]
   sib4 r8 mib,
   mib[re16(mib) fa(mib)re(do)]

   %89
   sib4 r8 mib
   mib[re16(mib) fa(mib)re(do)]
   sib4  fa'8 sib

   %92
   sib[la16 sib do8 mib,]
   mib\tr[re sib do]
   re\tr[do16 sib re8 mib]\mbreak

   %95
   fa4 fa8 sib
   sib [la16 sib do8 mib,]
   mib\tr[re sib do]

   %98
   re\tr[do16 sib re8 mib]
   fa4 r16 fa sol la
   sib8[sib sib16 do re mib]

   %101
   fa8 [fa, mib mib']
   re[re, do do']
   sib[sib, la la']

   %104
   sol fa16 mib fa8 mib16 re
   mib8\tr[re sib' re,]
   mib\tr[re sib' re,]\mbreak

   %107
   mib8.\tr[re16 mib fa sol la]
   sib8.\tr[la16 sib do re mib]
   fa mib re do re do sib la

   %110
   sib la sol fa sol fa mib re
   mib8[re16(mib) fa(mib) re (do)]
   re8[sib sib mib]

   %113
   mib8[re16(mib) fa(mib) re (do)]
   re8[sib sib mib]
   mib8[re16(mib) fa(mib) re (do)]
   sib4 \fermata  r8 sol'

   %116
   sib [la16 sib sol8 la]\mbreak
   sib8[la16 sib sol8 sib]
   do[sib16 do la8 re]

   %119
   sib16 do re sib sol la sib sol
   fad sol la fad re8 re'
   mib[mib, re re']

   %122
   do[do, sib sib']
   la[la, sol sol']
   fad[mi16 re sib'8 sol]

   %125
   fad[mi16 re sib'8 sol]
   fad[re fad re]\mbreak
   sol[do, re re,]

   %128
   sol16 la sib sol la sib do la
   sib do re sib do re mib do
   re8[sol, sol re']

   %131
   re4\tr~re16 mi fa sol
   la8 la, r dod
   re\tr[dod la' dod,]

   %134
   re\tr[dod la' dod,]
   re\tr dod fa dod\mbreak
   re[mi fa re]

   %137
   sol[fa16(sol) la(sol) fa(mi)]
   re8[mi fa re]
   sol[fa16(sol) la(sol) fa(mi)]

   %140
   re2\fermata

}

Vbcn = \relative do {

   sib4 sib
   sib la
   sib sib8 do

   %4
   re[do16 sib re8 mib]
   fa4 sib,
   sib la

   %7
   sib sib8 do
   re[do16 sib re8 mib]
   fa4 fa8 mib

   %10
   re4 re8 do
   sib4 r8 fa'
   mib4 r8 mib\mbreak

   %13
   re4 r8 re
   do4 r8 do
   sib4 sib

   %16
   sib sib
   sib sib
   sib sib

   %19
   sib sib
   la la
   sol sol

   %22
   fa fa'
   re sib
   mib16 re do sib fa'8 fa,\mbreak

   %25
   sib8[sib' sib, sib]
   sib4 sib
   sib r8 do

   %28
   sib4 sib8 do
   re[do16 sib re8 mib]
   fa4 sib,

   %31
   sib r8 do
   sib4 sib8 do
   re[do16 sib re8 mib]

   %34
   fa4  fa8 mib
   re8[re re do16 sib]
   sib4 fa'8 mib\mbreak

   %37
   re4 re8 do
   sib4 r8 fa'
   mib4 r8 mib

   %40
   re4 r8 re
   do4 r8 do
   sib4 r8 sib

   %43
   sib4 r8 sib
   sib4. la8
   sol4. sol8

   %46
   fa[fa' mi re]
   do4. sib8
   la[sib la sol]\mbreak

   %49
   fa4 fa'
   re sib
   do8[sib la sol]

   %52
   fa4 do'
   fa,8[do'16 sib la8 sol]
   fa4 do'

   %55
   fa, sib
   sib la
   sib sib8 do

   %58
   re[do16 sib re8 mib]
   fa4 sib,\mbreak
   sib r8 do

   %61
   sib4 sib 8 do
   re[do16 sib re8 mib]
   fa4 fa8 mib

   %64
   re4 do8 re16 mib
   fa4 fa8 mib
   re4. re8

   %67
   mib4. mib8
   re4. re8
   mib4. mib8

   %70
   mi4. mi8\mbreak
   fa4. fa8
   mi4. mi8

   %73
   fa4 r8 re'
   mib[mib, re re']
   do[do, sib sib']

   %76
   la[la, sol sol']
   fa4 sol
   la sib

   %79
   la fa
   sib,4. sib8
   fa'4. fa8\mbreak

   %82
   sib4 la8 sol
   fa4 fa
   re sib

   %85
   mib r8 mib
   la,8 sib fa' fa,
   sib4 r8 mib

   %88
   la,8 sib fa' fa,
   sib4 r8 mib
   la,8 sib fa' fa,

   %91
   sib4 sib
   sib la
   sib sib8 do

   %94
   re[do16 sib re8 mib]\mbreak
   fa4 sib,
   sib la

   %97
   sib  sib8 do
   re[do16 sib re8 mib]
   fa4 fa8 mib

   %100
   re4 re8 do
   sib fa' mib4
   re do

   %103
   sib la
   sol fa
   sib sib

   %106
   sib sib\mbreak
   mib4. mib8
   re4 do8 sib

   %109
   la4 fa'
   re sib
   la8[sib fa' fa,]

   %112
   sib4 r8 mib
   la,8[sib fa' fa,]
   sib4 r8 mib

   %115
   la,8[sib fa' fa,]
   sib4\fermata r8 sol
   sol4 r8 re'\mbreak

   %118
   sol,4 r8 sol'
   la4 r8 fad
   sol4 sol,

   %121
   re' r8 re'
   mib4 re
   do sib

   %124
   la sol
   re sol,
   re' sol,

   %127
   re'4. re8
   sol [do, re re,]
   sol4 la

   %130
   sib do
   re8[sol, sol re']
   re4\tr~re16 mi fa sol

   %133
   la8 la, r la
   re la r la
   re la r la

   %136
   re la r la\mbreak
   re[mi fa re]
   sol,4 la

   %139
   re8[mi fa re]
   sol,4 la
   re,2\fermata

}

Vbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 2/4
   \key sib\major
   \tempo 2 = 55
   s2*141
   \bar "|."
   \mark\markup "D.C."

}

VvlI = {
   <<\VvlIn \forma>>

}

Vtenore = {
   \new Voice = "alma"
   <<\Vtenoren \forma>>
}

Vfg = {
   \clef bass
   <<\Vfgn \forma>>
}

Vbc = {
   \clef bass
   <<\Vbcn \forma \Vbfn>>
}





VIvlIn = \relative do'' {

   R1*8
   la8
   re4 re8 re4 re8 re fad mi re4 re8
   re fad mi re4 re8

   %10
   re(dod) si la4 si8
   la(sol) la~la4 si8 la(sol) la~la4 la8
   sol'4. fad8(mi fad) mi4. r8 r mi

   %13
   mi(re dod si la sold)\mbreak la4.~la4 mi'8
   mi(re dod si la sold) la4. r8 r fad'
   fad4.(mi4) fad8 fad4.(mi4) re8

   %16
   dod mi re dod si la si4. sold
   la4. r8 r la re4 re8 re4 re8
   re fad mi re4 re8\mbreak re fad mi re4 re8
   re[dod si] la4 si8 la sol la~la4 si8

   %20
   la sol la~la4 la8 sol'4. fad8 mi fad
   mi4. r8 r mi mi[re dod] si la sold
   sold?4.(la4) mi'8\mbreak mi[re dod] si la sold

   %23
   sold?4.(la4) fad'8 fad4.(mi4) fad8
   fad4.(mi4) re8 dod[mi re] dod[si la]
   sold?4.~sold4 la8 la2.~

   %26
   la4. r8 r la re4 re8 re4 re8
   re fad mi re4 re8\mbreak re fad mi re4 re8
   re[dod si] la4 si8 la sol la~la4 si8

   %29
   la sol la~la4 la8 sol'4. fad8 mi fad
   mi4. r8 r mi mi[re dod] si la sold
   sold?4.(la4) mi'8\mbreak mi[re dod] si la sold

   %32
   sold?4.(la4) fad'8 fad4.(mi4) fad8
   fad4.(mi4) re8 dod[mi re] dod[si la]
   sold?4.~sold4 la8 la2.~

   %35 OOKK
   la4.\fermata r8 r la re4 re8 re4 re8\mbreak
   re mi fad fad mi re do si do do si do
   do?4 si8 r r si mi4 mi8 mi4 mi8

   %38
   mi fad sol sol fad mi re dod? re re dod re
   re4 dod8 r r mi la,[si dod] re[mi fad]
   mi4 la,8 r r mi' la,[si dod] re[mi fad]\mbreak

   %41
   mi4 la,8 r r la sol'4. fad8 mi fad
   mi4. r8 r mi sol, fad sol~sol4 mi'8
   fad,[sol fad] la[si la] re4. sol

   %44
   fad8[mi re]mi re dod re4. r8 r sol,
   sol4.(fad4) re'8 re4.(dod4) sol'8
   sol4.(fad4) mi8\mbreak fad[mi re] dod4 re8

   %47
   re4. r8 r la re4 re8 re4 re8
   re fad mi re4 re8 re fad mi re4 re8
   re dod si la4 la8 sol'4. fad8 mi fad

   %50
   mi4. r8 r mi la,(si dod re mi fad)
   fad4.\tr(mi4) mi8 la,(si dod re mi fad)\mbreak
   fad4.\tr(mi4) sol,8 sol4.(fad4) re'8

   %53
   re4.(dod4) sol'8 sol4.(fad4) mi8
   fad mi re dod4 re8 re4.\fermata r8 r si

   %55
   re dod si~si4 fad'8 re dod si~si4 si8
   mi4. re8 dod re re4. dod4 fad,8\mbreak
   mi'4. re8 dod re re4. dod4 fad8

   %58
   fad[mi re] dod[si la] sol4.~sol4 mi'8
   mi[re dod] si[la sol] fad[sold lad] si4 mi8
   re4. dod8 si dod si4. r8 r si

   %61
   fad'4 fad8 fad sold lad\mbreak si fad re si4 re8
   dod si dod~dod4 re8 dod si dod~dod4 dod8
   fad[mi re] dod4 si8 si4. la4 dod8

   %64
   fad[mi re] dod4 si8 si4. la4 dod8
   re4. mid fad8[mi? re] dod4 si8\mbreak
   la4. sold4 fad8 fad2.\fermata

}

VIsopranoIn = \relative do'' {

   \autoBeamOff

   r4 r8 re la la r fa'
   re re r16 re re si sold4 r8 do
   la la do4 r8 do16 do si8 do

   %4
   la la r la\mbreak la la la la
   red red red mi mi si r si
   mi mi mi dod lad lad r si

   %7 OOKK
   sol sol r re' si4 si
   R1
   r8
   R1.*8

   %17
   r4 r8 r r la re4 re8 re4 re8
   re fad mi re4 re8\mbreak re fad mi re4 re8
   re[dod si] la4 si8 la[sol] la~la4 si8

   %20
   la[sol] la~la4 la8 sol'4. fad8[mi] fad
   mi4. r8 r mi mi[re dod] si[la] sold
   sold?4.(la4) mi'8\mbreak mi[re dod] si[la] sold

   %23
   sold?4.(la4) fad'8 fad4.(mi4) fad8
   fad4.(mi4) re8 dod[mi re] dod[si la]
   sold?4.~sold4 la8 la2.~

   %26
   la4. r8 r la re4 re8 re4 re8
   re fad mi re4 re8\mbreak re fad mi re4 re8
   re[dod si] la4 si8 la[sol] la~la4 si8

   %29
   la[sol] la~la4 la8 sol'4. fad8[mi] fad
   mi4. r8 r mi mi[re dod] si[la] sold
   sold?4.(la4) mi'8\mbreak mi[re dod] si[la] sold

   %32
   sold?4.(la4) fad'8 fad4.(mi4) fad8
   fad4.(mi4) re8 dod[mi re] dod[si la]
   sold?4.~sold4 la8 la2.~

   %35 OOKK
   la4.\fermata r8 r la re4 re8 re4 re8\mbreak
   re mi fad fad[mi] re do[si] do do[si] do
   do?4 si8 r r si mi4 mi8 mi4 mi8

   %38
   mi fad sol sol[fad] mi re[dod?] re re [dod] re
   re4 dod8 r r mi la,[si dod] re[mi fad]
   mi4 la,8 r r mi' la,[si dod] re[mi fad]\mbreak

   %41
   mi4 la,8 r r la sol'4. fad8[mi] fad
   mi4. r8 r mi sol,[fad] sol~sol4 mi'8
   fad,[sol fad] la[si la] re4. sol

   %44
   fad8[mi re]mi[re] dod re4. r8 r sol,
   sol4.(fad4) re'8 re4.(dod4) sol'8
   sol4.(fad4) mi8\mbreak fad[mi re] dod4 re8

   %47
   re4. r r2.
   R1.*6
   r2. r4. r8 r si

   %55
   re[dod] si~si4 fad'8 re[dod] si~si4 si8
   mi4. re8[dod] re re4. dod4 fad,8\mbreak
   mi'4. re8[dod] re re4. dod4 fad8

   %58
   fad[mi re] dod[si la] sol4.~sol4 mi'8
   mi[re dod] si[la sol] fad[sold lad] si4 mi8
   re4. dod8[si] dod si4. r4 r8

   %61
   r2.\mbreak r4. r8 r re
   dod[si] dod~dod4 re8 dod[si] dod~dod4 dod8
   fad[mi re] dod4 si8 si4. la4 dod8

   %64
   fad[mi re] dod4 si8 si4. la4 dod8
   re4. mid fad8[mi? re] dod4 si8\mbreak
   la4. sold4 fad8 fad2.\fermata

}

VItestoI = \lyricmode {

   Al -- cindo, _ Al -- cindo _ io t’apro_il _ sen, m’as -- colta. _
   Ah ch’im -- por -- tuno _ giunge _ 
   a chiu -- dermi _ nel labro_il _ più che bramo, _ 
   per al -- tro_io ti di -- rei: _  Al -- cindo, _ io t’amo. _

   La dolce _ dol -- ce_au -- retta, _
   che vezzo - setta _ che vezzo - setta _
   spi -- rando, _ scher -- zando _
   tu vedi _ col fior
   ti dice _  ch’a -- mor
   do -- vres -- ti_al mio sen, a -- mor a -- mor
   do -- vres - ti_al mio sen.
   
   La dolce _ dol -- ce_au -- retta, _
   che vezzo - setta _ che vezzo - setta _
   spi -- rando, _ scher -- zando _
   tu vedi _ col fior
   ti dice _  ch’a -- mor
   do -- vres -- ti_al mio sen, a -- mor a -- mor
   do -- vres - ti_al mio sen.
   
   La dolce _ dol -- ce_au -- retta, _
   che vezzo - setta _ vezzo - setta _ 
   la dolce _ dol -- ce_au -- retta, _
   che vezzo - setta _ vezzo - setta _
   spi -- ran - - do, scher - - zando _
   tu vedi _ col fior
   ti dice _  ch’a -- mor - - 
   do -- vres -- ti_al mio sen, a -- mor a -- mor a -- mor
   do -- vres -- ti_al mio sen.
      
   Di -- let -- ti, affet - ti 
   pro -- mette _ vez -- zo -- sa
   la fiam -- ma_a -- mo -- rosa _
   strin -- gen - - - - - - do strin -- gen -- do_il suo ben,
   
   Di -- let -- ti, affet - ti 
   pro -- mette _ vez -- zo -- sa
   la fiam -- ma_a -- mo -- rosa _
   strin -- gen - - do strin -- gen -- do_il suo ben.

}

VIbcn = \relative do {

   re1~
   re
   dod4 red,~red2~

   %4
   red1
   la'2 sol~
   sol mi'~

   %7
   mi4 mid fad2
   si,1\fermata
   r8
   re4 r8 re4 r8 re4. r

   %10
   re r re r
   dod4 r8 la4 r8 re4 r8 fad4 r8
   mi4 r8 re4 r8 la4 r8 la4 r8

   %13
   la4. r\mbreak la4 r8 la4 r8
   la4. r la4 r8 la4 r8
   la4 r8 la4 r8 la4 r8 sold4 r8

   %16
   la4 r8 dod4 r8 re4 r8 mi4 r8
   la,4. r r2.
   R1.*29

   %47
   r2. re4 r8 re4 r8
   re4. r re r
   re4 r8 fad4 r8 mi4 r8 re4 r8

   %50
   la4 r8 la4 r8 la4 r8 la4 r8
   la4 r8 la4 r8 la4 r8 la4 r8\mbreak
   la4 r8 la4 r8 la4 r8 la4 r8

   %53
   la4 r8 la4 r8 la4 r8 la4 r8
   re4 r8 la4 r8 re4._\fermata r
   R1.*6

   %61
   si4 r8 si4 r8\mbreak si4 r8 si4 r8
   R1.*4
   R1._\fermata

}

VIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*8
   \bar "||"\break
   \time 12/8
   \key re\major
   \tempo 2. = 60
   \once \override Score.RehearsalMark.extra-offset = #'(-6 . 0.5)
   \mark\markup\huge\larger "[7.] All[egr]o - la dolce auretta"
   \partial 8 s8\set Score.currentBarNumber = #9
   s1.*58
   \bar "||"\key re\major
   \mark\markup "D.C."

}

VIvlI = {
   <<\VIvlIn \forma>>

}

VIsopranoI = {
   \new Voice = "apro"
   <<\VIsopranoIn \forma>>
}

VIbc = {
   \clef bass
   <<\VIbcn \forma \VIbfn>>
}





VIIvlIn = \relative do'' {

   R1*6
   do8
   mib[sol16 fa mib8 mib] sol4. fa16 mib
   re8[mib fa mib16 re] mib8 do sol do

   %9
   mib[sol16 fa mib8 mib] sol4. fa16 mib
   re8[mib fa mib16 re] mib4 r8 do
   lab' do, lab' do, si sol4 re'8

   %12
   mib fad4 sol8 si, sol4 re'8\mbreak
   mib fad4 sol8 sol, la16 si do8 fa?
   mib4 re\tr do r8 sol

   %15
   do [mib16 re do8 do] sol'4. fa16 mib
   re8 [do16 si do8 re] si la sol sol
   do [mib16 re do8 do] sol'4. fa16 mib\mbreak

   %18
   re8 [do16 si do8 re] si[la sol sol'16 lab]
   sib8 sol mib sib mib sib mib sib
   sol'4 fa8 sib, mib sib mib sol,

   %21
   lab4 sol8 mib' re [mib fa mib16 re]
   mib8[re16 do sib8 lab8]\mbreak sol[sib mib lab,]
   sol[mib' fa, re'] mib,4. sol8
   
   %24
   do [mib16 re do8 do] sol'4. fa16 mib
   re8 [do16 si do8 re] si la sol sol
   do [mib16 re do8 do] sol'4. fa16 mib\mbreak

   %27
   re8 [do16 si do8 re] si[la sol sol'16 lab]
   sib8 sol mib sib mib sib mib sib
   sol'4 fa8 sib, mib sib mib sol,

   %30
   lab4 sol8 mib' re [mib fa mib16 re]
   mib8[re16 do sib8 lab8]\mbreak sol[sib mib lab,]
   sol[mib' fa, re'] mib,4. do'8

   %33 fine della replica
   mi[sol16 fa mi8 mi] sib'4. lab16 sol
   lab8 lab, do fa re[fa16 mib re8 re]
   lab'4. sol16 fa sol8 sib, mib, do'

   %36
   si do re do do si r mib\mbreak
   re mib fa mib mib re r sol
   sol mib mib do do8 sib lab fa'

   %39
   fa re re sib  sib lab sol mib'
   mib do do lab lab sol fa fa'
   fa re re fa si, sol4 re'8\mbreak

   %42
   mib fad4 sol8 si, sol4 re'8
   mib fad4 sol8 si,[la16 sol do8 fa?]
   mib4 re do r8 sol'

   %45
   fa[mib re do] si[la sol re']
   mib fad4 sol8 si,[la sol re']
   mib fad4 sol8 si,[la16 sol do8 fa?]\mbreak

   %48
   mib4 re\tr do r8 do
   mib[sol16 fa mib8 mib] sol4. fa16 mib
   re8[mib fa mib16 re] mib8 do sol do

   %51
   mib[sol16 fa mib8 mib] sol4. fa16 mib
   re8[mib fa mib16 re] mib4 r8 do
   lab' do, lab' do, si sol4 re'8

   %54
   mib fad4 sol8 si, sol4 re'8\mbreak
   mib fad4 sol8 si, [la16 si do8 fa?]
   mib4 re\tr do\fermata r8 sib

   %57
   mib sib sol sib mib sib sol sib
   mib sib sol mib' re [mib fa mib16 re ]
   mib8 sib4 lab8 sol [mib' fa mib16 re]

   %60
   mib8 sib sol sib\mbreak mib sib sol sib
   reb [reb reb do16 sib] lab8 sol fa do'
   mib [mib mib re?16 do] sib8 la sol mib'

   %63
   re do sib la sol4~sol16[la sib do]
   re8[sib] mib4 re~re16[do sib la]
   sib8 sol la fad\mbreak sol[re'16 do sib8 sib]

   %66
   sib[re16 do sib8 sib] mib mib mib mib
   mib re do do fa fa fa mib
   re do sib mib re [mib fa mib16 re]

   %69
   mib4~mib16[re do sib] do4~do16[sib lab sol]
   lab4~lab16[sol fa mib] sib'4 r8 mib\mbreak
   fa4 re mib2\fermata

}


VIIvlIIn = \relative do'' {

   R1*6
   sol8
   do[mib16 re do8 do] mib4. re16 do
   si8[do re do16 si] do8 sol mib sol
   
   %9
   do[mib16 re do8 do] mib4. re16 do
   si8[do re do16 si] do4 r8 do
   lab' do, lab' do, si sol4 re'8

   %12
   mib fad4 sol8 si, sol4 re'8\mbreak
   mib fad4 sol8 sol, la16 si do8 fa?
   mib4 re\tr do r8 do
   
   %15
   mib8[sol16 fa mib8 mib] mib4. re16 do
   si8[do16 re mib8 fa] sol4 sol,8 do
   mib8[sol16 fa mib8 mib] mib4. re16 do
   
   %18
   si8[do16 re mib8 fa] sol re sol, mib'16 fa
   sol8 mib sib sol mib' sib mib sib
   mib4 re8 sib mib sib mib mib,
   
   %21
   fa4 \once\stemUp mib8 sol' fa[sol lab sol16 fa]
   sol8 sib, fa'[sib,]\mbreak sib mib sol sib,
   sib mib fa, re' mib,4. do'8
   
   %24
   mib8[sol16 fa mib8 mib] mib4. re16 do
   si8[do16 re mib8 fa] sol4 sol,8 do
   mib8[sol16 fa mib8 mib] mib4. re16 do
   
   %27
   si8[do16 re mib8 fa] sol re sol, mib'16 fa
   sol8 mib sib sol mib' sib mib sib
   mib4 re8 sib mib sib mib mib,
   
   %30
   fa4 \once\stemUp mib8 sol' fa[sol lab sol16 fa]
   sol8 sib, fa'[sib,]\mbreak sib mib sol sib,
   sib mib fa, re' mib,4. sol8 %% fine ritornello
   
   %33
   do[mi16 re do8 do] sol'4. fa16 mi
   fa8 fa, lab do sib[re16 do sib8 sib]
   fa'4. mib?16 re mib8 sol, mib mib'
   
   %36
   re mib fa mib mib re r do\mbreak
   si do re do do si r4
   r8 sol' sol mib mib re do4
   
   %39
   r8 fa fa re re do sib4
   r8 mib mib do do sib lab re
   re si si re si sol4 re'8\mbreak

   %42
   mib fad4 sol8 si, sol4 re'8
   mib fad4 sol8 si,[la16 sol do8 fa?]
   mib4 re do r8 sol'

   %45
   fa[mib re do] si[la sol re']
   mib fad4 sol8 si,[la sol re']
   mib fad4 sol8 si,[la16 sol do8 fa?]\mbreak

   %48
   mib4 re\tr do r8 sol 
   do[mib16 re do8 do] mib4. re16 do
   si8[do re do16 si] do8 sol mib sol
   
   %51
   do[mib16 re do8 do] mib4. re16 do
   si8[do re do16 si] do4 r8 do
   lab' do, lab' do, si sol4 re'8

   %54
   mib fad4 sol8 si, sol4 re'8\mbreak
   mib fad4 sol8 si, [la16 si do8 fa?]
   mib4 re\tr do\fermata r8 sol
   
   %57
   sib sol mib sol sib sol mib sol
   sib sol mib sol' fa [sol lab sol16 fa]
   sol8 sol,4 fa8 \once\stemUp mib[sol' lab sol16 fa]
   
   %60
   sol8 mib sib mib\mbreak sol mib sib mib
   sol4. sol8 do,4. fa8
   la4. la8 re,4 r8 do
   
   %63
   sib la sol fad sol4~sol16 fad sol la
   sib8 sol do4 sib~sib16 la sol fad
   sol8 sib do la\mbreak sol[sib16 la sol8 sol] 
   
   %66
   sol[sib16 la sol8 sol] sib4. sib8
   do sib lab4 do4. do8
   fa, fa' mib sol fa[sol lab sol16 fa]

   %69
   mib4~mib16[re do sib] do4~do16[sib lab sol]
   lab4~lab16[sol fa mib] sib'4 r8 sol\mbreak
   lab4 fa sol2\fermata
   
}


VIIvlan = \relative do' {

   R1*6
   r8 
   sol'4 r mib8 fa sol lab
   re,4 si sol r
   
   %9
   sol' r mib8 fa sol lab
   re,4 si sol8 fa' sol mib
   do4 r8 lab' re, si re si
   
   %12
   sol4 r sol8 si re si\mbreak
   sol4 r re' sol8 si
   do lab si, sol' mib4 r
   do r do8 re mib fa
   
   %16
   sol4 r sol8 fa mib re
   do4 r do8 re mib fa\mbreak
   sol4 r sol r8 mib
   
   %19
   mib4. mib8 mib fa sol mib
   sib4 sib8 mib mib fa sol mib
   sib4 mib8 mib sib4 sib
   
   %22
   mib4 re\mbreak mib r8 re   
   mib sol, lab sib mib,4. r8
   do'4 r do8 re mib fa
   
   %25
   sol4 r sol8 fa mib re
   do4 r do8 re mib fa\mbreak
   sol4 r sol r8 mib
   
   %28
   mib4. mib8 mib fa sol mib
   sib4 sib8 mib mib fa sol mib
   sib4 mib8 mib sib4 sib
   
   %31
   mib4 re\mbreak mib r8 re
   mib sol, lab sib mib,4. sol'8
   sol4 r mi4. mi8
   
   %34
   do4 lab'8 fa fa4 r
   re4. re8 sib4 r8 do 
   sol' sol, sol' sol, sol' sol, r8 sol'\mbreak
   
   %37
   sol sol, sol' sol, sol' sol, r8 do
   do4 do fa8 fa sol lab
   sib,4 sib mib8 mib fa sol
   
   %40
   lab,4 lab re8 re mib fa
   sol,4 sol sol8 sol' sol, sol'\mbreak
   do,4 r sol8 sol' sol, sol'
   
   %43
   do,4 r sol'8 fa mib re
   do fa sol sol, do re mib do
   lab'4 fa sol8 sol, sol' sol,
   
   %46
   do4 r sol'8 sol, sol' sol,
   do4 r sol'8 fa mib re\mbreak
   do fa sol sol, do4 r
   
   %49
   sol'4 r mib8 fa sol lab
   re,4 si sol r
   sol'4 r mib8 fa sol lab
   
   %52
   re,4 si sol8 fa' sol mib
   do4 r8 lab' re, si re si
   sol4 r sol8 si re si\mbreak
   
   %55
   sol4 r re' sol8 si
   do lab si, sol' mib4\fermata r8 mib
   mib4 mib mib mib
   
   %58
   mib mib sib sib
   mib re mib sib
   mib mib\mbreak mib mib
   
   %61
   mi mi fa fa
   fad fad sol4. do,8
   re4 re, sol sol
   
   %64
   sol sol sol sol
   sol8 sol do re\mbreak sol,4 sol
   sol sol sol sol 
   
   %67
   lab lab lab lab
   sib sol'8 mib sib4 sib
   mib mib mib mib
   
   %70
   fa mib re r8 sol,\mbreak
   lab4 sib mib,2\fermata

}

VIItenoren = \relative do' {

   \autoBeamOff

   re8 si16 si la8 si sol4 r16 sol sol sol
   do8 do r do mi mi fa sol
   do, do r4 do8 do do do16 re\mbreak

   %4
   si4 r16 mi mi fa do8 do r do16 la
   mib'4 mib8 re re4 mib8 mib16 re
   sib8 sib r4 r2\fermata

   %7
   r8
   R1*7
   r2 r4 r8 sol
   do mib16[re] do8 do sol'4. fa16 mib

   %16
   re8 do16[si] do8 re si[la] sol sol
   do mib16[re] do8 do sol'4. fa16 mib\mbreak
   re8 do16[si] do8 re si[la] sol4

   %19
   r4 r8 sib mib sib mib sib
   sol'4 fa8 sib, mib sib mib sol,
   lab4 sol8 mib' re mib fa mib16[re]

   %22
   mib8[re16 do sib8] lab8\mbreak sol[sib mib] lab,
   sol[mib'] fa,[re'] mib,4.  sol8
   do mib16[re] do8 do sol'4. fa16 mib

   %25
   re8 do16[si] do8 re si[la] sol sol
   do mib16[re] do8 do sol'4. fa16 mib\mbreak
   re8 do16[si] do8 re si[la] sol4

   %28
   r4 r8 sib mib sib mib sib
   sol'4 fa8 sib, mib sib mib sol,
   lab4 sol8 mib' re mib fa mib16[re]

   %31
   mib8[re16 do sib8] lab8\mbreak sol[sib mib] lab,
   sol[mib'] fa,[re'] mib,4. r8
   R1*2

   %35
   r2 r4 r8 do'
   si do re do do si r mib\mbreak
   re mib fa mib mib re r sol

   %38
   sol mib mib do do8[sib] lab fa'
   fa re re sib  sib[lab] sol mib'
   mib do do lab lab[sol] fa4

   %41
   r4 r8 re' si sol4 re'8\mbreak
   mib fad4 sol8 si, sol4 re'8
   mib fad4 sol8 si,[la16 sol do8] fa?

   %44
   mib4 re do r8 sol'
   fa[mib re do] si[la sol re']
   mib fad4 sol8 si,[la sol re']

   %47
   mib fad4 sol8 si,[la16 sol do8] fa?\mbreak
   mib4 re\tr do r
   R1*7

   %56
   r2 r4 r8 sib
   mib sib sol sib mib[sib] sol sib
   mib[sib] sol mib' re mib fa mib16[re]

   %59
   mib8 sib4 lab8 sol mib' fa mib16[re]
   mib4 sib\mbreak  r4 r8 sib
   reb reb reb do16[sib] lab8[sol] fa do'

   %62
   mib mib mib re?16[do] sib8[la] sol mib'
   re do sib la sol4~sol16[la sib do]
   re8[sib] mib4 re~re16[do sib la]

   %65
   sib8 sol la fad\mbreak sol4 r
   r r8 sib mib mib mib mib
   mib[re] do do fa fa fa mib

   %68
   re[do] sib mib re mib fa mib16[re]
   mib4~mib16[re do sib] do4~do16[sib lab sol]
   lab4~lab16[sol fa mib] sib'4 r8 mib\mbreak

   %71
   fa4 re mib2\fermata

}

VIItestoIII = \lyricmode {

   Non di -- leg -- giarmi _ più, già sò ben io _ 
   che_a’ vas -- ti_a -- mo -- ri_av -- vezza _
   ad amar _ un pas -- tor chinar _ non puoi. _
   La -- scia_in pace_il _ mio cuor, ama _ gl’e -- roi. _
   
   L’al -- tero _ bianco _ giglio _
   non degna _ la vio - la non degna _ la vio - la, 
   l’al -- tero _ bianco _ giglio _
   perché _ sel -- vag -- gia_e sola _ perché _ sel -- vag -- gia_e sola _ 
   su -- perbo _ di bac -- ciar, su -- per -- bo di bac -- ciar.
   
   L’al -- tero _ bianco _ giglio _
   non degna _ la vio - la non degna _ la vio - la, 
   l’al -- tero _ bianco _ giglio _
   perché _ sel -- vag -- gia_e sola _ perché _ sel -- vag -- gia_e sola _ 
   su -- perbo _ di bac -- ciar, su -- per -- bo di bac -- ciar.
   
   L’al -- tero _ bianco _ giglio _
   non degna _ la vio - la non degna _ la vio - la, 
   per -- ché sel -- vag -- gia_e sola _ perché _ sel -- vag -- gia_e sola _ 
   su -- per - - - - - - - - - - - - bo di bac -- ciar, su -- per - - - - - - - - - bo di bac -- ciar.
   
   Ben -- sì tal’ or si sposa _  si sposa _ 
   con la pur -- purea _ rosa _ con la pur -- purea _ rosa _
   per -- ché_il vago _ ver -- mi -- glio per -- ché_il vago _ ver -- mi -- glio
   sol può così _ for -- mar, - - - - così _ for -- mar,
   per -- ché_il vago _ ver -- miglio _ perché_il _ vago _ ver -- miglio _
   sol può così _ for -- mar, - - - co -- sì for -- mar.

}

VIIbcn = \relative do {

   sol'1
   mi~
   mi~
   
   %4
   mi2 la,~
   la si4 mib,
   fa2 si\fermata
   
   %7
   r8
   do4 r do8 re mib fa
   sol4 sol, do r
   do r do8 re mib fa
   
   %10
   sol4 sol, do8 re mib do
   fa sol lab fa sol sol, sol' sol,
   do4 r sol'8 sol, sol' sol,\mbreak
   
   %13
   do4 r sol'8 fa mib re 
   do fa sol sol, do4 r_\markup\italic "Viol[ett]e, e Viol[oncel]li Soli" 
   do r do8 re mib fa
   
   %16
   sol4 r sol8 fa mib re
   do4 r do8 re mib fa\mbreak
   sol4 r sol r8 mib
   
   %19
   mib4. mib8 mib fa sol mib
   sib4 sib8 mib mib fa sol mib
   sib4 mib8 mib sib4 sib
   
   %22
   mib4 re\mbreak mib r8 re   
   mib sol, lab sib mib,4. r8
   do'4 r do8 re mib fa
   
   %25
   sol4 r sol8 fa mib re
   do4 r do8 re mib fa\mbreak
   sol4 r sol r8 mib
   
   %28
   mib4. mib8 mib fa sol mib
   sib4 sib8 mib mib fa sol mib
   sib4 mib8 mib sib4 sib
   
   %31
   mib4 re\mbreak mib r8 re
   mib sol, lab sib mib,4. do'8_\tu
   do4 r do8 re mi do
   
   %34
   fa4 r8 fa sib,4 r
   sib8 do re sib mib4 r8 do_\markup\italic "Viol[ett]e, e Viol[oncel]li Soli"
   sol' sol, sol'[sol,] sol' sol, r8 sol'\mbreak
   
   %37
   sol sol, sol'[sol,] sol' sol, r8 do
   do4 do fa8 fa sol lab
   sib,4 sib mib8 mib fa sol
   
   %40
   lab,4 lab re8 re mib fa
   sol,4 sol sol8 sol' sol, sol'\mbreak
   do,4 r sol8 sol' sol, sol'
   
   %43
   do,4 r sol'8 fa mib re
   do fa sol sol, do re mib do
   lab'4 fa sol8 sol, sol' sol,
   
   %46
   do4 r sol'8 sol, sol' sol,
   do4 r sol'8 fa mib re\mbreak
   do fa sol sol, do4 r
   
   %49
   do_\tu r do8 re mib fa
   sol4 sol, do r
   do r do8 re mib fa
   
   %52
   sol4 sol, do8 re mib do
   fa sol lab fa sol sol, sol' sol,
   do4 r sol'8 sol, sol' sol,\mbreak
   
   %55
   do4 r sol'8 fa mib re
   do fa sol sol, do4\fermata r8 mib_\markup\italic \center-column{"Viol[ett]e, e"\vspace #-0.3" Viol[oncel]li Soli"}
   mib4 mib mib mib
   
   %58
   mib mib sib sib
   mib re mib sib
   mib mib\mbreak mib mib
   
   %61
   mi mi fa fa
   fad fad sol4. do,8
   re4 re, sol sol
   
   %64
   sol sol sol sol
   sol8 sol do re\mbreak sol,4 sol
   sol sol sol sol 
   
   %67
   lab lab lab lab
   sib sol'8 mib sib4 sib
   mib mib mib mib
   
   %70
   fa mib re r8 sol,\mbreak
   lab4 sib mib,2\fermata
    
}

VIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*6
   \bar "||"\break
   \time4/4
   \key sib\major
   \tempo 2 = 60
   \once \override Score.RehearsalMark.extra-offset = #'(-6 . 0.5)
   \mark\markup\huge\larger "[9.] All[egr]o - L'altero bianco giglio"
   \partial 8 s8\set Score.currentBarNumber = #7
   s1*65
   \bar "||"\key sib\major
   \mark\markup "D.C."

}

VIIvlI = {
   <<\VIIvlIn \forma>>

}

VIIvlII = {
   <<\VIIvlIIn \forma>>

}

VIIvla = {
   \clef alto
   <<\VIIvlan \forma>>

}

VIItenore = {
   \new Voice = "dileggiarmi"
   <<\VIItenoren \forma>>
}

VIIbc = {
   \clef bass
   <<\VIIbcn \forma \VIIbfn>>
}





VIIIvlIn = \relative do'' {

   R1*7
   fa,4\parenthesize \p la
   do re8 mi

   %10
   fa[re do sib]
   la sol fa4
   re' re

   %13
   mi,8[sol fa mi]
   do'4 do
   re,8[fa mi re]

   %16
   si'4 si
   do,8[re mi fa]
   sol[la si sol]

   %19
   do4 fa
   sol sol,
   do2

   %22 ritornello
   fa,4\parenthesize \p la
   do re8 mi\mbreak
   fa[re do sib]

   %25
   la sol fa4
   re' re
   re8 si do4

   %28
   fa fa
   fa8[re mi sol]
   fa[mi re do]

   %31
   si[la sol do]
   sol4\fermata fa8 sol
   do,2\fermata

   %34
   fa4\parenthesize \p la
   do re8 mi\mbreak
   fa[re do sib]

   %37
   la sol fa4
   re' re
   re8 si do4

   %40
   fa fa
   fa8[re mi sol]
   fa[mi re do]

   %43
   si[la sol do]
   sol4\fermata fa8 sol
   do,2\fermata

   %46 con il basso
   fa4\f la
   do re8 mi\mbreak
   fa[re do sib]

   %49
   la sol fa4
   la\parenthesize \p do  %%% con la parte
   fa fa,8 fa'

   %52
   mi[re do sib]
   la sol fa4
   mib' mib

   %55
   mib? re
   fa fa
   fa mi?

   %58
   r r8 fa
   mi[re do sib]
   la[sib do la]\mbreak

   %61
   re[do sib la]
   sol[la sib sol]
   do[sib la sol]

   %64
   fa[sol la sib]
   do[re mi do]
   fa4 fa,8 re'

   %67
   do4 sib8 do
   fa,2
   r4 fa'8 mi

   %70
   re[do sib la]
   sol[fa mi re]
   do4 fa8 sib\mbreak

   %73
   do4\fermata sib8 do
   fa,2
   fa4\f la
   do re8 mi

   %77
   fa[re do sib]
   la[sol fa fa']
   mi[re do sib]

   %80
   la[sib do la]
   re[do sib la]
   sol[la sib sol]

   %83
   do[sib la sol]
   fa[sol la sib]
   do4 do,\mbreak

   %86
   fa'2\fermata
   mi8 mi mi
   mi mi mi

   %89
   mi mi mi
   fa fa fa
   fa fa fa

   %92
   mi mi mi
   mi mi mi
   mi mi mi

   %95
   la, la la\mbreak
   la si si
   si? si si

   %98
   do do do
   si si si
   do do do

   %101
   do si si
   do do do
   do do do

   %104
   re re re\mbreak
   re re re
   dod dod dod

   %107
   dod? dod dod
   re re re
   re8. mi16 dod8

   %110
   re4.\fermata

}


VIIIvlIIn = \relative do'' {

   R1*7
   fa,4\parenthesize \p la
   do re8 mi

   %10
   fa[re do sib]
   la sol fa4
   re' re

   %13
   mi,8[sol fa mi]
   do'4 do
   re,8[fa mi re]

   %16
   si'4 si
   do,8[re mi fa]
   sol[la si sol]

   %19
   do4 fa
   sol sol,
   do2

   %22 ritornello
   fa,4\parenthesize \p la
   do re8 mi\mbreak
   fa[re do sib]

   %25
   la sol fa4
   re' re
   re8 si do4

   %28
   fa fa
   fa8[re mi sol]
   fa[mi re do]

   %31
   si[la sol do]
   sol4\fermata fa8 sol
   do,2\fermata

   %34
   fa4\parenthesize \p la
   do re8 mi\mbreak
   fa[re do sib]

   %37
   la sol fa4
   re' re
   re8 si do4

   %40
   fa fa
   fa8[re mi sol]
   fa[mi re do]

   %43
   si[la sol do]
   sol4\fermata fa8 sol
   do,2\fermata

   %46 con il basso
   fa4\f la
   do re8 mi\mbreak
   fa[re do sib]

   %49
   la sol fa4
   la\parenthesize \p do  %%% con la parte
   fa fa,8 fa'

   %52
   mi[re do sib]
   la sol fa4
   mib' mib

   %55
   mib? re
   fa fa
   fa mi?

   %58
   r r8 fa
   mi[re do sib]
   la[sib do la]\mbreak

   %61
   re[do sib la]
   sol[la sib sol]
   do[sib la sol]

   %64
   fa[sol la sib]
   do[re mi do]
   fa4 fa,8 re'

   %67
   do4 sib8 do
   fa,2
   r4 fa'8 mi

   %70
   re[do sib la]
   sol[fa mi re]
   do4 fa8 sib\mbreak

   %73
   do4\fermata sib8 do
   fa,2
   fa4\f la
   do re8 mi

   %77
   fa[re do sib]
   la[sol fa fa']
   mi[re do sib]

   %80
   la[sib do la]
   re[do sib la]
   sol[la sib sol]

   %83
   do[sib la sol]
   fa[sol la sib]
   do4 do,\mbreak

   %86
   fa'2\fermata
   do8 do do
   do do do

   %89
   do do do
   si si si
   si? si si

   %92
   si? si si
   si? si si
   do do do

   %95
   mi, mi mi\mbreak
   fad fad fad
   sold sold sold

   %98
   mi mi mi
   mi mi mi
   mi mi la

   %101
   la sold sold
   mi mi mi
   mi mi mi

   %104
   la la la\mbreak
   la la la
   mi mi mi

   %107
   mi mi mi
   fa fa fa
   fa8. sol16 mi8

   %110
   re4.\fermata

}


VIIIvlan = \relative do' {

   R1*7
   fa,4\p la
   do re8 mi

   %10
   fa[re do sib]
   la sol fa4
   re' re

   %13
   mi,8[sol fa mi]
   do'4 do
   re,8[fa mi re]

   %16
   si'4 si
   do,8[re mi fa]
   sol[la si sol]

   %19
   do4 fa
   sol sol,
   do2

   %22 inizia ritornello
   fa,4\p la
   do re8 mi\mbreak
   fa[re do sib]

   %25
   la sol fa4
   fa' fa
   fa mi

   %28
   re sol,
   do4. do'8
   re[mi re do]

   %31
   si[la sol do]
   sol4_\fermata fa8 sol
   do,2_\fermata

   %34
   fa,4\p la
   do re8 mi\mbreak
   fa[re do sib]

   %37
   la sol fa4
   fa fa
   fa mi

   %40
   re sol
   do,4. do'8
   re[mi re do]

   %43
   si[la sol do]
   sol4_\fermata fa8 sol
   do,2_\fermata%%% fine ritornello

   %46
   fa4\f la
   do re8 mi\mbreak
   fa[re do sib]

   %49
   la sol fa4
   la\p do
   fa fa,8 fa'
   mi[re do sib]

   %53
   la[sol fa sol]
   la[sib do la]
   sib[do re do]

   %56
   si[do re si]
   do[re mi do]
   fa,[sol la fa]

   %59
   mi'[re do sib]\mbreak
   la[sib do la]\mbreak
   re[do sib la]

   %62
   sol[la sib sol]
   do[sib la sol]
   fa[sol la sib]

   %65
   do[re mi do]
   fa4 fa,8 re'
   do4 sib8 do

   %68
   fa,[sol la sol]
   fa4 fa'8 mi
   re[do sib la]

   %71
   sol[fa mi re]
   do4 fa8 sib\mbreak
   do4_\fermata sib8 do

   %74
   fa,2
   fa4\f la
   do re8 mi

   %77
   fa[re do sib]
   la[sol fa fa']
   mi[re do sib]

   %80
   la[sib do la]
   re[do sib la]
   sol[la sib sol]

   %83
   do[sib la sol]
   fa[sol la sib]
   do4 do,\mbreak

   %86
   fa'2\fermata
   la8 la la
   la la la

   %89
   la la la
   la la la
   sold sold sold

   %92
   sold? sold sold
   sold? sold sold
   la la la

   %95
   do, do do\mbreak
   re re re
   mi mi mi

   %98
   la,la la
   sold sold sold
   la la do

   %101
   re mi mi,
   la la la
   la la la

   %104
   fa fa fa\mbreak
   sol?sol sol
   la la la

   %107
   dod dod dod
   re mi fa
   sol la la,

   %110
   re,4.\fermata

}

VIIIsopranoIIn = \relative do'' {

   \autoBeamOff
   sib8 sol re'do16 re sib8 sib r4
   sib?8 sib sib do16 re sol,4 r16 sol do sol
   la8 la r la re re re re\mbreak
   re re r4 mi,8 mi mi mi16 mi
   re'8 re re do la la r16 do fa do
   re8 re r re re re dod re
   la4 la r2

   %8 OOKK
   R2*14
   fa4 la
   do re8 mi\mbreak
   fa[re] do sib

   %25
   la [sol] fa4
   re' re
   re8 [si] do4

   %28
   fa fa
   fa8[re] mi sol
   fa[mi re do]

   %31
   si[la] sol do
   sol4\fermata fa8 sol
   do,2\fermata

   %34
   fa4 la
   do re8 mi\mbreak
   fa[re] do sib

   %37
   la [sol] fa4
   re' re
   re8 [si] do4

   %40
   fa fa
   fa8[re] mi sol
   fa[mi re do]

   %43
   si[la] sol do
   sol4\fermata fa8 sol
   do,2\fermata

   %46
   R2*4
   la'4 do
   fa fa,8 fa'

   %52
   mi[re] do sib
   la [sol] fa4
   mib' mib

   %55
   mib? re
   fa fa
   fa mi?

   %58
   r r8 fa
   mi[re do sib]
   la[sib do la]\mbreak

   %61
   re[do sib la]
   sol[la sib sol]
   do[sib la sol]

   %64
   fa[sol la sib]
   do[re mi do]
   fa4 fa,8 re'

   %67
   do4 sib8 do
   fa,2
   r4 fa'8 mi

   %70
   re do sib la
   sol[fa mi re]
   do4 fa8 sib\mbreak

   %73
   do4\fermata sib8 do
   fa,2
   R2*12

   %87
   r8 do' re
   mi8. fa16 mi8
   mi8. fa16 mi8

   %90
   re[do] re
   r si do
   re8. mi16 re8

   %93
   re mi re
   do[si] do
   r mi mi,\mbreak

   %96
   fad re' fad,
   sold mi' sold,
   la4 r8

   %99
   r si mi
   do8. si16 la8
   la8. si16  sold8

   %102
   la4 r8
   r mi' la,
   re8. mi16 re8\mbreak

   %105
   re8. mi16 re8
   dod[si] la
   r mi' la,

   %108
   fa' mi re
   re8. mi16 dod8
   re4.\fermata

}

VIIItestoII = \lyricmode {

   Dove, _ dim -- mi_o’_in -- dis -- creto, _
   ap -- pren -- desti _ il rigor: che fai tuo fasto? _
   Non regna _ tal fie -- rezza _ 
   nella _  pla -- cida _ pace _ de’ pa -- stori _
   ov’ han -- no_il nido _ i più soa - vi_a -- mori. _

   Di Co -- cito _ nell’ or -- rido _ Regno _
   ha ri -- cetto _ ha ri -- cetto _ fie -- rez - za fie -- rez -- za_e ri -- gor.
   Di Co -- cito _ nell’ or -- rido _ Regno _
   ha ri -- cetto _ ha ri -- cetto _ fie -- rez - za fie -- rez -- za_e ri -- gor.
   Di Co -- cito _ nell’ or -- rido _ Regno _
   ha ri -- cetto _ ha ri -- cetto _ fie -- rez - - - - - - - za fie -- rez -- za_e ri -- gor,
   ha ri -- cetto _ ha ri -- cet - to fie -- rez -- za_e ri -- gor.
   
   Ma ove spie -- ga_il pia -- cer i suoi vanti, _
   en -- tro_il te -- nero _ sen de -- gl’a -- manti _
   sol pie -- tade _ v’al -- ber -- ga_ed a -- mor,
   sol pie -- tade _ v’al -- ber -- ga_ed a -- mor,
   en -- tro_il te -- nero _ sen de -- gl’a -- manti _
   sol pie -- tade _ v’al -- ber -- ga_ed a -- mor.

}

VIIIbcn = \relative do {

   sol'1~
   sol2 mib
   re1

   %4
   sold,~
   sold2 la
   sib1

   %7
   la2 re,\fermata\mbreak
   \clef tenor \key fa\major fa'4\p la
   do re8 mi

   %10
   fa[re do sib]
   la sol fa4
   re' re

   %13
   mi,8[sol fa mi]
   do'4 do
   re,8[fa mi re]

   %16
   si'4 si
   do,8[re mi fa]
   sol[la si sol]

   %19
   do4 \clef bass \key fa\major fa,
   sol sol,
   do2

   %22 inizia ritornello
   \clef tenor \key fa\major fa4\p la
   do re8 mi\mbreak
   fa[re do sib]

   %25
   la sol fa4
   \clef bass \key fa\major fa fa
   fa mi

   %28
   re sol,
   do4. do'8
   re[mi re do]

   %31
   si[la sol do]
   sol4_\fermata fa8 sol
   do,2_\fermata

   %34
   \clef tenor \key fa\major fa4\p la
   do re8 mi\mbreak
   fa[re do sib]

   %37
   la sol fa4
   \clef bass \key fa\major fa fa
   fa mi

   %40
   re sol,
   do4. do'8
   re[mi re do]

   %43
   si[la sol do]
   sol4_\fermata fa8 sol
   do,2_\fermata%%% fine ritornello

   %46
   \clef tenor \key fa\major fa4\f la
   do re8 mi\mbreak
   fa[re do sib]

   %49
   la sol fa4
   la\p do
   fa fa,8 fa'
   mi[re do sib]

   %53
   la[sol fa sol]
   la[sib do la]
   sib[do re do]

   %56
   si[do re si]
   do[re mi do]
   \clef bass \key fa\major fa,[sol la fa]

   %59
   mi'[re do sib]\mbreak
   la[sib do la]\mbreak
   re[do sib la]

   %62
   sol[la sib sol]
   do[sib la sol]
   fa[sol la sib]

   %65
   \clef tenor \key fa\major do[re mi do]
   fa4 fa,8 re'
   do4 sib8 do

   %68
   fa,[sol la sol]
   fa4 fa'8 mi
   re[do sib la]

   %71
   sol[fa mi re]
   do4 fa8 sib\mbreak
   do4_\fermata sib8 do

   %74
   fa,2
   fa4\f la
   do re8 mi

   %77
   fa[re do sib]
   la[sol fa fa']
   mi[re do sib]

   %80
   la[sib do la]
   re[do sib la]
   sol[la sib sol]

   %83
   do[sib la sol]
   fa[sol la sib]
   do4 do,\mbreak

   %86
   \clef bass \key fa\major fa2\fermata
   la8_\markup\italic\column {"Viol[ett]e e"\vspace #-0.3"Viol[oncel]li Soli"} la la
   la la la

   %89
   la la la
   la la la
   sold sold sold

   %92
   sold? sold sold
   sold? sold sold
   la la la

   %95
   do, do do\mbreak
   re re re
   mi mi mi

   %98
   la,la la
   sold sold sold
   la la do

   %101
   re mi mi,
   la la la
   la la la

   %104
   fa fa fa\mbreak
   sol?sol sol
   la la la

   %107
   dod dod dod
   re mi fa
   sol la la,

   %110
   re,4.\fermata

}

VIIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*7
   \bar "||"\break
   \time 2/4
   \key fa\major
   \tempo 2 = 65
   \once \override Score.RehearsalMark.extra-offset = #'(-6 . 0.5)
   \mark\markup\huge\larger "[11.] [Aria] - Di Cocito nell’orrido Regno"
   s2*79
   \bar "||"\break
   \time 3/8
   \key fa\major
   \tempo 4 = 40
   s4.*24
   \bar "||"
   \key fa\major
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

VIIIsopranoII = {
   \new Voice = "indiscreto"
   <<\VIIIsopranoIIn \forma>>
}

VIIIbc = {
   \clef bass
   <<\VIIIbcn \forma \VIIIbfn>>
}




IXsopranoIn = \relative do'' {

   \autoBeamOff

   do8 do mi si16 do la8 la dod si16 la
   re8 re r re16 re sib4 dod8 re
   la la r4 r2

   %4
   R1*3
   r2 r4 r8 re16 re
   si8 si <<
      {
         \autoBeamOff re^\markup\italic "a 2" mi16 re dod2

         %9
         si4
      }\\{
         \autoBeamOff si8_\markup "I - " lad16_\markup"dolo" si si4_\markup "mi" lad_\markup "-"
         si4_\markup "o."
      }
   >> r r2
   R1*5
   mi4 r8 mi16 mi si8 si r mi

   %16
   dod dod r4 la8 la la la16 si
   dod8 dod si la re re r4
   re8 re16 re dod8 si lad lad lad si

   %19
   fad fad r4 r2\fermata

}

IXtestoI = \lyricmode {

   Almen _ fingi _ d’a -- marmi, _  e si lu -- singhi _
   la mia po -- vera _ fiamma. _
   
   Mio di -- letto. _ 
   
   Deh mi di -- leggi _ o_Al -- cindo, _ o se po -- tes -- se_il
   cuor pre -- starti _ fede _
   pronta _ n’a -- vre -- sti_an -- cor la gran mer -- cede. _

}

IXtenoren = \relative do' {

   \autoBeamOff

   R1*2
   r4 r8 la16 la\mbreak re4 re8 la
   si si r4 r si8 si16 dod

   %5
   re8 re r16 re re dod la8 la r4
   mi'8 mi dod dod16 re mi4 mi8 mi16 fad\mbreak
   re8 re r re16 re re8 la r4

   %8
   R1
   r4 r8 re si si r re
   dod dod r dod\mbreak dod sold r sold

   %11
   si si si la la la r fad'
   re re re dod sid sid lad sold
   dod dod r dod\mbreak dod dod sid? dod

   %14
   la4 dod8 sid16 dod sold8 sold r4
   R1*4
   R1\fermata

}

IXtestoIII = \lyricmode {

   
   E d’a -- mar vuoi ch’io finga? _ Ec -- comi _ pronto _
   per compia - certi. _
   Inci - vile _ così _ poi non son io. _
   Mio te -- soro. _
   
   Eu -- rilla _ oh Dio _ da questi _
   benché _ men -- ti -- ti_af -- fetti _
   mi scese_un _ tal piacer _ fur  -- tivo_in _ seno, _
   che mi co -- strin -- ge_al fin ora ad a -- marti. _

}

IXbcn = \relative do {

   la'2~la4 sol
   fa2 sol
   la4 fa~\mbreak fa2
   mi1~
   mi2 dod
   la1
   fad
   sol2 fad
   si1
   mid1~
   mid2 fad~
   fad1
   mi
   fad2 sold4 dod,~
   dod2 sold'\mbreak
   la1
   sol2 fad~
   fad mi
   fad si,_\fermata



}

IXbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*19
   \bar "|."

}

IXsopranoI = {
   \new Voice = "fingi"
   <<\IXsopranoIn \forma>>
}

IXtenore = {
   \new Voice = "amar"
   <<\IXtenoren \forma>>
}

IXbc = {
   \clef bass
   <<\IXbcn \forma \IXbfn>>
}





XvlIn = \relative do'' {

   la16 fad' la, fad' la, la' la, la' la, fad' la, fad' la, la' la, la'
   la, mi' la, mi' la, la' la, la' la, mi' la, mi' la, la' la, la'
   la, fad' la, fad' la, la' la, la' la, fad' la, fad' la, la' la, la'

   %4
   mi8 la, r la' la16[la la la la la la la]
   si,16[dod re mi fad sol la si] sol[sol sol sol sol sol sol sol]
   la,[si dod re mi fad sol la]\mbreak fad[fad fad fad fad fad fad fad]

   %7
   sol,[la si dod re mi fad sol] mi[mi mi mi mi mi mi mi]
   la, mi' la, mi' la, la' la, la' la, fad' la, fad' la, la' la, la'
   la, mi' la, mi' la, la' la, la' <<{fad8 fad mi mi}\\{re re re dod}>>

   %10
   <<fad4\\\stemUp \once \override Stem.transparent = ##t la,\\\stemDown re,>> r r2
   R1*2
   la'16 mi' la, fad' la, mi' la, fad' la, mi' la, fad' la, mi' la, fad'

   %14
   la, mi' la, fad' la, mi' la, fad' la, mi' la, la' la, mi' la, la'
   fad8 re r4 r2
   R1*3

   %19
   dod16 si dod re mi dod re si dod si dod re mi dod re si
   dod2\tr\fermata la16 fad' la, fad' la, la' la, la'
   la, fad' la, fad' la, la' la, la'\mbreak la, mi' la, mi' la, la' la, la'

   %22
   la, mi' la, mi' la, la' la, la' <<fad4\\\stemUp \once \override Stem.transparent = ##t la,\\\stemDown re,>> r
   R1
   r2 la'16 mi' la, fad' la, mi' la, fad'

   %25
   la, mi' la, fad' la, mi' la, sol' la, fad' la, sol' la, fad' la, la'
   re,8 dod r4\mbreak r2
   R1*2

   %29
   r2 fad16 sol la sol fad sol mi sol
   fad sol la sol fad sol mi sol fad2\tr\fermata
   la,16 fad' la, sol' la,la' la, sol'\mbreak  la, fad' la, sol' la, la' la, fad'

   %32
   <<sol4\\\stemUp \once \override Stem.transparent = ##t si,\\\stemDown \once \override Stem.transparent = ##t re,\\\stemDown sol,>> r r2
   R1*6
   la'16 fad' la, fad' la, la' la, la' la, fad' la, fad' la, la' la, la'

   %40
   la, mi' la, mi' la, la' la, la' la, mi' la, mi' la, la' la, la'
   fad8 re r la'\mbreak la16[la la la la la la la]
   si,16[dod re mi fad sol la si] sol[sol sol sol sol sol sol sol]

   %43
   la,[si dod re mi fad sol la]\mbreak fad[fad fad fad fad fad fad fad]
   sol,[la si dod re mi fad sol] mi[mi mi mi mi mi mi mi]
   la, mi' la, mi' la, la' la, la' la, fad' la, fad' la, la' la, la'

   %46
   la, mi' la, mi' la, la' la, la' <<{fad8 fad mi mi}\\{re re re dod}>>
   <<fad4\fermata\\\stemUp \once \override Stem.transparent = ##t la,\\\stemDown re,>> r r2
   R1*4

   %52
   si'16 fad' si, si' si, la' si, sol' si, fad' si, sol' si, fad' si, mi
   re4 r r2
   R1*4

   %58
   R1\fermata

}

XvlIIn = \relative do'' {

   la16 fad' la, fad' la, la' la, la' la, fad' la, fad' la, la' la, la'
   la, mi' la, mi' la, la' la, la' la, mi' la, mi' la, la' la, la'
   la, fad' la, fad' la, la' la, la' la, fad' la, fad' la, la' la, la'

   %4
   mi8 la, r la' la16[la la la la la la la]
   si,16[dod re mi fad sol la si] sol[sol sol sol sol sol sol sol]
   la,[si dod re mi fad sol la]\mbreak fad[fad fad fad fad fad fad fad]

   %7
   sol,[la si dod re mi fad sol] mi[mi mi mi mi mi mi mi]
   la, mi' la, mi' la, la' la, la' la, fad' la, fad' la, la' la, la'
   la, mi' la, mi' la, la' la, la' <<{fad8 fad mi mi}\\{re re re dod}>>

   %10
   <<fad4\\\stemUp \once \override Stem.transparent = ##t la,\\\stemDown re,>> r r2
   R1*2
   la'16 mi' la, fad' la, mi' la, fad' la, mi' la, fad' la, mi' la, fad'

   %14
   la, mi' la, fad' la, mi' la, fad' la, mi' la, la' la, mi' la, la'
   fad8 re r4 r2
   R1*3

   %19
   la16 sold la si dod la si sold la sold la si dod la si sold
   la2\tr\fermata la16 fad' la, fad' la, la' la, la'
   la, fad' la, fad' la, la' la, la'\mbreak la, mi' la, mi' la, la' la, la'

   %22
   la, mi' la, mi' la, la' la, la' <<fad4\\\stemUp \once \override Stem.transparent = ##t la,\\\stemDown re,>> r
   R1
   r2 la'16 mi' la, fad' la, mi' la, fad'

   %25
   la, mi' la, fad' la, mi' la, sol' la, fad' la, sol' la, fad' la, la'
   re,8 dod r4\mbreak r2
   R1*2

   %29
   r2 re16 mi fad mi re mi dod mi
   re mi fad mi re mi dod mi re2\tr\fermata
   la16 fad' la, sol' la,la' la, sol'\mbreak  la, fad' la, sol' la, la' la, fad'

   %32
   <<sol4\\\stemUp \once \override Stem.transparent = ##t si,\\\stemDown \once \override Stem.transparent = ##t re,\\\stemDown sol,>> r r2
   R1*6
   la'16 fad' la, fad' la, la' la, la' la, fad' la, fad' la, la' la, la'

   %40
   la, mi' la, mi' la, la' la, la' la, mi' la, mi' la, la' la, la'
   fad8 re r la'\mbreak la16[la la la la la la la]
   si,16[dod re mi fad sol la si] sol[sol sol sol sol sol sol sol]

   %43
   la,[si dod re mi fad sol la]\mbreak fad[fad fad fad fad fad fad fad]
   sol,[la si dod re mi fad sol] mi[mi mi mi mi mi mi mi]
   la, mi' la, mi' la, la' la, la' la, fad' la, fad' la, la' la, la'

   %46
   la, mi' la, mi' la, la' la, la' <<{fad8 fad mi mi}\\{re re re dod}>>
   <<fad4\fermata\\\stemUp \once \override Stem.transparent = ##t la,\\\stemDown re,>> r r2
   R1*4

   %52
   si'16 fad' si, si' si, la' si, sol' si, fad' si, sol' si, fad' si, mi
   re4 r r2
   R1*4

   %58
   R1\fermata

}

Xvlan = \relative do' {

   la'8 sol la sol fad la sol fad
   dod re mi re dod mi re dod
   la' sol la sol fad la sol fad

   %4
   la,4 r8 mi' mi16[mi mi mi mi mi mi mi]
   fad4 r re16[re re re re re re re]
   mi4 r\mbreak la,16[la la la la la la la]

   %7
   si4 r si16[si si si si si si si]
   dod8 re mi dod fad4. fad8
   dod re mi dod la la' la la

   %10
   la4 r r2
   R1*9
   r2\fermata la8 sol la sol

   %21
   fad la sol fad\mbreak dod re mi re
   dod re mi dod la4 r
   R1*8

   %31
   la'8 si do si\mbreak la si do la
   si4 r r2
   R1*6

   %39
   la8 sol la sol fad la sol fad
   dod re mi re dod re mi dod
   la4 r8 fad' mi16[mi mi mi mi mi mi mi]

   %42
   fad4 r re16[re re re re re re re]
   mi4 r la,16[la la la la la la la]
   si4 r si16[si si si si si si si]

   %45
   dod8 re mi dod fad4. fad8
   dod re mi dod la la' la la
   la4\fermata r r2

   %48
   R1*4
   re,8 sol fad mi re mi re dod
   si4 r r2

   %54
   R1*4
   R1\fermata

}

XsopranoIn = \relative do'' {

   \autoBeamOff

   R1*9
   r4 r8 la re re re re
   re16[mi fad mi] re[mi dod mi] re8[dod16 si la si sol la]\mbreak

   %12
   fad[la si dod] re[fad mi re] dod[mi la, si] dod[re mi fad]
   sol8 fad r re dod re r re
   dod re la fad' mi la, r dod

   %15
   re16[mi fad mi] re[mi dod re]  si[re sold, la] si[re dod si]
   dod[mi la, si] dod[mi re dod]\mbreak re[fad si, dod] re[fad mi re]
   mi[sol dod, re] mi[sol fad mi] fad[mi re dod re mi fad sold]

   %18
   la8 la, r mi' dod si16[la] sold8. la16
   la[si dod re] mi[dod re si] la[si dod re] mi[dod re si]
   la2\fermata r

   %21
   R1
   r4 r8 la re re re re
   re16[mi fad mi] re8 [dod] si16[dod re dod] si8[la]

   %24
   sol16[la si dod re8 mi] dod la r re
   dod re la mi' re mi la, fad'
   fad mi r la,\mbreak si16[la sol8]~sol16 [si dod re]

   %27
   dod[si la8]~la16[dod re mi] re[dod si8]~si16[re  mi fad]
   mi[re dod8]~dod16[mi fad sol] fad8 re r mi
   la, re mi re16[dod] re[mi fad mi] re[mi dod mi]

   %30
   re[mi fad mi] re[mi dod mi] re2\fermata
   r2\mbreak r4 r8 la
   si16[re sol, la] si[re dod si] dod[mi la, si] dod[mi re dod]

   %33
   re[fad si, dod] re[fad mi re] mi[sol dod, re] mi[sol fad mi]
   fad4 r16 fad [mi fad]re[mi dod re] si[dod la si]
   sol[si la sol] la[dod si la] si [re dod si] dod[mi re dod]

   %36
   re[fad mi re] mi[sol fad mi]\mbreak fad[mi re dod re mi fad sol]
   la8 la, r re dod re la dod
   re16[mi fad sol la8] re, mi4 dod

   %39
   re r r2
   R1*7
   r4 r8 re si do16[re] sol,8 si

   %48
   la16 [re fad, sol] la[do si la] si[re sol, la] si[re do si]
   la8 re, r la' si re dod? si
   lad16[dod si dod] fad,8 [dod'] re16[fad mi fad] si,8[re]

   %51
   dod fad, r mi'\mbreak re dod16[si] lad8.\tr si16
   si4 r r2
   r8 fad si4~si8 re16[dod] si8 lad

   %54
   si fad si4~si8 re16[dod] si8 lad
   si16[re dod si] dod[sold la si] la8 fad r dod'\mbreak
   la sold16[fad] mid8. fad16 fad[la fad sold] la[dod si la]

   %57
   sold[si sold la] si[re dod si] la[si la si dod8] fad
   la,4 sold fad2\fermata

}

XtestoI = \lyricmode {

   Vor -- resti _ lusin - gar  - - - - - - - mi,
   lo veggo _ lo veggo _ sì lo veggo _ per far - - - - - - - - - - - mi
   trofeo _ di cru -- del -- tà. - - - - 
   
   Vor -- resti _ lusin - gar - - - - - mi si si si si lo veggo _ sì lo veggo _
   per far - - - - mi trofeo _ di cru -- del -- tà, - - - -
   per far - - - - - - - - - - - - - - - - - - - mi trofeo _ di cru -- del -- tà, di cru -- del -- tà.
   
   Sì folle _ la spe -- ran - - - - za
   in me già non s’a -- van - - - - za
   che_in te sii fe -- del -- tà, 
   sì fol -- le la spe -- ran -- za_in me già non s’a -- van - - za
   che_in te sii fe -- del -- tà, - - - - sii fe -- del -- tà.

}

Xbcn = \relative do {

   re8 mi fad mi re fad  mi re
   la si dod si la dod si la
   re mi fad mi re fad mi re

   %4
   dod4 r8 dod dod dod dod dod
   re4 r si8 si si si
   dod4 r\mbreak re8 re re re

   %7
   sol,4 r sol8 sol sol sol
   la si dod la re mi fad re
   la si dod la re re la' la,

   %10
   re4 r r r8 re'
   re, re re mi fad sol la dod, \mbreak
   re16 dod re8 r sold la16 sold la8 r la,

   %13
   la1\tasto~
   la2~la8 si dod la
   re4 r8 la' sold16 fad sold8 r sold

   %16
   la16 sold la8 r la\mbreak si16 la si8 r si
   dod16 si dod8 r dod re16 dod re8 r re
   dod la si sold la re, mi[mi,]

   %19
   la4 r la r
   la2_\fermata re8 mi fad mi
   re fad mi re\mbreak la si dod si

   %22
   la si la sol fad4 r
   re' r sol r8 fad
   mi4 sol la,2\tasto~

   %25
   la1~
   la8 la' fad re\mbreak sol4 sol,
   la' la, si' si,

   %28
   dod' dod, re8 mi fad sol
   la fad sol la re,4 r
   re r re2_\fermata

   %31
   re~\mbreak re4. re8
   sol16 fad sol8  r sol la16 sol la8 r la
   si16 la si8 r si dod16 si dod8 r dod

   %34
   re mi re dod si la sol fad
   mi4 fad sol la
   si dod\mbreak re16 dod re8 r sol,

   %37
   fad mi fad re la' re, la'[la,]
   re4 r8 fad sol4 la
   re,8 mi fad mi re fad mi re

   %40
   la si dod si la si dod la
   re mi fad re\mbreak dod dod dod dod
   re4 r si8 si si si

   %43
   dod4 r re8 re re re
   sol,4 r sol8 sol sol sol
   la si dod la re mi fad re

   %46
   la si dod la re re la' la,\mbreak
   re4\fermata r8 re sol la si sol
   fad4 r sol r

   %49
   re8 mi fad re sol4 mid
   fad8 sold lad fad si,4 r8 si'
   fad sold lad fad\mbreak si[mi,] fad fad,

   %52
   si1\tasto~
   si4 r8 re mi4 fad
   si, r8 re mi4 fad

   %55
   si,8 si' mid,4 fad8 sold la mid\mbreak
   fad si, dod dod, fad4 r
   mid' r fad r8 la,

   %58
   si4 dod fad,2\fermata

}

Xbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key re\major
   \tempo 2 = 55
   s1*58
   \bar "|."
   \mark\markup "D.C."

}

XvlI = {
   <<\XvlIn \forma>>

}

XvlII = {
   <<\XvlIIn \forma>>

}

Xvla = {
   \clef alto
   <<\Xvlan \forma>>

}

XsopranoI = {
   \new Voice = "vorresti"
   <<\XsopranoIn \forma>>
}

Xbc = {
   \clef bass
   <<\Xbcn \forma \Xbfn>>
}




XIsopranoIn = \relative do'' {

   \autoBeamOff

   R1*5
   r4 r8 si sol sol si do
   re re r4 la8 si do do16 si\mbreak

   %8
   sol4 re'8 mi16 fa si,8 si r4
   re8 re16 re fa8 mi do do sol sol16 sol
   do4 r8 do do do do re\mbreak

   %11
   sib sib r4 sib8 sib mi fa16 sol
   sib,4 sib8 sib16 la fa fa fa8 r4
   r8 re' la4 fa'8 re r re

   %14
   la la r4\mbreak re8 re16 re re8 mib
   mib?16 mib mib8 do do16 sib sol8 sol r4
   sol8 sol16 sol sol8 la si si r4

   %17
   re8 re16 re mi8 fa\mbreak
   si,4 re8 re16 do la8 la r4
   re do8. re16 sib8 sib r sol

   %20
   dod8 dod dod re la la r4

}

XItestoI = \lyricmode {

   Or senti _ qual mer -- cede _
   si pre -- pa -- ra_il tuo_a -- mor. 
   Lun -- ge_o su -- perbo _
   vanne _ da -- gl’oc -- chi miei. _
   Preda _ d’a -- mor io ti bramai _ al fine _
   di punir _ nel tuo sen tan -- ta al -- te -- rigia. _
   Olà _ ninfe, _ pa -- stori, _
   nel -- l’a -- mo -- rosa  _ cac -- cia _
   colsi _ la fiera, _ onde _ co’ scherzi _ vostri _
   ad isbra - nar -- le_il cuor pronti _ vi chiamo: _ 
   con -- tro_un al -- tero, _ un gran rigor _ io bramo. _

}

XItenoren = \relative do' {

   \autoBeamOff

   mi4 r8 fa re re r la
   re re re mi do do do do16 si
   sol8 sol r si si si si si

   %4
   fa' fa r fa\mbreak re4 re8 do16 si
   do4 r8 mi red mi do do
   R1*11

   %17
   R2
   R1*3

}

XItestoIII = \lyricmode {

   No non fingo, _ di tua beltà _ su l’ara _
   giuro _ d’a -- marti, _ ed_a quest’ ora _ io sento _
   pie -- tà chieder _ il cuor al suo tor -- mento. _ 

}

XIbcn = \relative do {

   la'2 fad~
   fad red
   mi1

   %4
   sold
   la2~la4 si
   mi,1

   %7
   fad
   sol2 fa?~
   fa mi

   %10
   mi1~
   mi
   do2 la

   %13
   re1~
   re
   fad2 sol~

   %16
   sol fa?~
   fa
   sold,2 la

   %19
   fad sol?~
   sol la4 re,\fermata

}

XIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 60
   s1*16
   \set Score.measureLength = #(ly:make-moment 2 4) s2
   \set Score.measureLength = #(ly:make-moment 4 4) s1*3
   \bar "|."

}

XIsopranoI = {
   \new Voice = "senti"
   <<\XIsopranoIn \forma>>
}

XItenore = {
   \new Voice = "fingo"
   <<\XItenoren \forma>>
}

XIbc = {
   \clef bass
   <<\XIbcn \forma \XIbfn>>
}





XIIcrIn = \relative do'' {
   
   r8 fa, la
   do do do
   fa la, do
   
   %4
   do fa, do'
   fa16 sol fa sol fa sol
   fa sol fa sol fa sol
   
   %7
   fa sol fa sol fa sol
   fa8 fa,16 fa fa fa
   fa8 do' do
   
   %10
   fa do do\mbreak
   fa do fa
   sol4.
   
   %13
   do,8 do,16 do do do
   do4 r8
   do' do,16 do do do
   
   %16
   do4 r8
   fa'4.~
   fa~
   
   %19
   fa
   fa8 fa16 fa fa fa
   sol4.~
   
   %22
   sol~\mbreak
   sol
   sol8 sol16 sol sol sol
   
   %25
   sol4 r8
   do,16 do fa fa la la
   do, do fa fa la la
   
   %28
   do, do fa fa la la
   do,8 do do
   fa fa, fa
   
   %31
   do' do, do
   fa fa16 fa fa fa
   fa8 do' do
   
   %34
   fa fa, fa\mbreak
   do' do, do
   fa4.\fermata
  
}

XIIcrIIn = \relative do'' {
   
   r8 fa, la
   do do do
   fa la, do
   
   %4
   do fa, do'
   la do la
   la do la
   
   %7
   do do do
   do fa,16 fa fa fa
   fa8 do' do
   
   %10
   fa do do\mbreak
   fa do fa
   sol4.
   
   %13
   do,8 do,16 do do do
   do4 r8
   do' do,16 do do do
   
   %16
   do4 r8
   fa'4.~
   fa~
   
   %19
   fa
   fa8 fa16 fa fa fa
   sol4.~
   
   %22
   sol~\mbreak
   sol
   sol8 sol16 sol sol sol
   
   %25
   sol4 r8
   la,16 la do do fa fa
   la, la do do fa fa
   
   %28
   la, la do do fa fa
   la,8 do do
   fa fa, fa
   
   %31
   do' do, do
   fa fa16 fa fa fa
   fa8 do' do
   
   %34
   fa fa, fa\mbreak
   do' do, do
   fa4.\fermata

}

XIIvlIn = \relative do'' {
   
   r8 fa,16[sol  la sib]
   do8 do do
   fa la, do

   %4
   do fa, do'
   fa16[sol fa sol fa sol]
   la,[sib la sib la sib]

   %7
   do8 do do
   do8 fa,16 fa fa fa
   fa8 do' do
   
   %10
   fa do do\mbreak
   fa do fa
   sol4.
   
   %13
   do,4 r8 
   do do,16 do do do
   do4 r8 
   
   %16
   do' do,16 do do do
   fa8 do' do
   do fa, fa

   %19
   do' do16 re mib8
   mib re16 re re re
   re8 re re

   %22
   re sol, sol\mbreak
   re' re16 mi fa8
   fa mi16 mi mi mi
   
   %25
   mi8 do do 
   do16 do la la fa fa
   do' do la la fa fa
   
   %28
   do' do la la fa fa
   do'8 do do
   fa fa, fa
   
   %31
   do' do, do
   fa fa16 fa fa fa
   fa8 do' do
   
   %34
   fa fa, fa\mbreak
   do' do, do
   fa4.\fermata
   
}

XIIvlan = \relative do' {
   
   fa8 fa16 sol la sib
   do8 do do
   fa, la do
   
   %4
   do fa, do'
   do, la do
   do la do
   
   %7
   la la la
   la fa'16 fa fa fa
   fa8 do' do
   
   %10
   fa, do' do\mbreak
   fa, do' do
   sol4 sol,8
   
   %13
   do4 r8
   do do16 do do do
   do4 r8
   
   %16
   do do16 do do do
   fa8 la, la
   la la la
   
   %19
   la la la
   sib sib16 sib sib sib
   re8 si si
   
   %22
   si? si si\mbreak
   si si si
   do do16 do do do
   
   %25
   do4 r8
   la'16 la fa fa do do
   la' la fa fa do do
   
   %28
   la' la fa fa do do
   do8 do' do
   fa, fa fa
   
   %31
   do' do, do
   fa fa16 fa fa fa
   fa8 do' do
   
   %34
   fa, fa fa\mbreak
   do' do, do
   fa4.\fermata

}

XIIsopranoIn = \relative do'' {

   \autoBeamOff

   r8 fa,16[sol] la[sib]
   do8 do do
   fa la, do

   %4
   do fa, do'
   fa16[sol fa sol fa sol]
   la,[sib la sib la sib]

   %7
   do8 do do
   do fa, r
   r do' do

   %10
   fa do do\mbreak
   fa do do
   re sol, si

   %13
   do4.~
   do~
   do~

   %16
   do4 r8
   r do do
   do fa, fa

   %19
   do' do16[re] mib8
   mib? re4
   r8 re re

   %22
   re sol, sol\mbreak
   re' re16[mi] fa8
   fa mi4

   %25
   r8 do do
   do4.~
   do~

   %28
   do~
   do8 do do
   fa fa, fa

   %31
   do' do, do
   fa4 r8
   r do' do

   %34
   fa fa, fa\mbreak
   do' do, do
   fa4.

}

XIItestoI = \lyricmode {
 
   Si pu -- nisca, _  si sbrani, _ s’uc -- cida _ 
   si sbra - - ni s'uc --  cida _
   il su -- perbo, _ spie -- tato _ spie -- tato _ suo cuor._-_-_-_-
   
   Delle _ ninfe _ nel sen non s’an -- nida, _ delle _ ninfe _ nel sen non s’an -- nida _ 
   mai pie -- tà_-_-_-_- mai pie -- tà con chi vanta  _ ri --  gor,
   mai pie -- tà con chi vanta  _ ri --  gor.

}

XIItenoren = \relative do {

   \autoBeamOff

   r8 fa16[sol] la[sib]
   do8 do do
   fa la, do

   %4
   do fa, do'
   fa16[sol fa sol fa sol]
   la,[sib la sib la sib]

   %7
   do8 do do
   do fa, r
   r do' do

   %10
   fa do do\mbreak
   fa do do
   re sol, si

   %13
   do4.~
   do~
   do~

   %16
   do4 r8
   r do do
   do fa, fa

   %19
   do' do16[re] mib8
   mib? re4
   r8 re re

   %22
   re sol, sol\mbreak
   re' re16[mi] fa8
   fa mi4

   %25
   r8 do do
   do4.~
   do~

   %28
   do~
   do8 do do
   fa fa, fa

   %31
   do' do, do
   fa4 r8
   r do' do

   %34
   fa fa, fa\mbreak
   do' do, do
   fa4.

}

XIItestoIII = \lyricmode {

   Si pu -- nisca, _  si sbrani, _ s’uc -- cida _ 
   si sbra - - ni s'uc --  cida _
   il su -- perbo, _ spie -- tato _ spie -- tato _ suo cuor._-_-_-_-
   
   Delle _ ninfe _ nel sen non s’an -- nida, _ delle _ ninfe _ nel sen non s’an -- nida _ 
   mai pie -- tà_-_-_-_- mai pie -- tà con chi vanta  _ ri --  gor,
   mai pie -- tà con chi vanta  _ ri --  gor.

}

XIIbcn = \relative do {
   
   fa,8 fa'16 sol la sib
   \clef tenor \key fa\major do8 do do 
   fa la, do
   
   %4
   do fa, fa
   fa fa fa
   fa fa fa
   
   %7
   fa fa fa
   fa fa16 fa fa fa
   fa8 do' do
   
   %10
   fa do do\mbreak
   fa do la
   \clef bass\key fa \major sol4 sol,8
   
   %13
   do4 r8
   do do16 do do do
   do4 r8
   
   %16
   do do16 do do do
   fa8 fa fa
   fa fa fa
   
   %19
   fa fa fa
   sib, sib16 sib sib sib
   si8 sol' sol
   
   %22
   sol sol sol\mbreak
   sol sol sol
   do, do16 do do do
   
   %25
   do4 r8
   fa, fa16 fa fa fa
   fa8 fa16 fa fa fa
   
   %28
   fa8 fa16 fa fa fa
   fa8\clef tenor \key fa\major do'' do
   fa fa, fa
   
   %31
   do' do, do
   fa fa16 fa fa fa
   fa8 do' do
   
   %34
   fa fa, fa\mbreak
   \clef bass \key fa\major do' do, do
   fa,4.\fermata
   
}

XIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}


forma = {

   \time 3/8
   \key fa\major
   \tempo 4. = 70
   s4.*16
   \bar ":..:"%\break
   s4.*20
   \bar ":|."

}

XIIcrI = {
   <<\XIIcrIn \forma>>

}

XIIcrII = {
   <<\XIIcrIIn \forma>>

}

XIIvlI = {
   <<\XIIvlIn \forma>>

}

XIIvla = {
   \clef alto
   <<\XIIvlan \forma>>

}

XIIsopranoI = {
   \new Voice = "punisca1"
   <<\XIIsopranoIn \forma>>
}

XIItenore = {
   \new Voice = "punisca2"
   <<\XIItenoren \forma>>
}

XIIbc = {
   \clef bass
   <<\XIIbcn \forma \XIIbfn>>
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

      systems-per-page = #4

   }

   \header {
      title = \markup\smaller\center-column {"Serenata a tre [RV 690]""Parte Seconda"}
      composer = \markup \center-column{"A. Vivaldi (1678 - 1741)"}
   }

   \markup \huge {[1.] [Largo] -  Acque placide, che correte}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \IvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"[Violino II]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \IvlII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Viola]"
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \Ivla
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef tenor \key sol\major \time 3/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi r4^\markup\center-align "[Alcindo]" re'4. mi'8}
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ten"
            \Itenore\global
            \new Lyrics \lyricsto "acque" \ItestoIII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \Ibc\global
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

   \pageBreak

   \markup \huge {[2. Recitativo] - Tenta lo so, ma pur lo tenta invano }

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r16^\markup\center-align "Eu[rilla]" sol' sol' sol'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "sop1"
            \IIsopranoI \global
            \new Lyrics \lyricsto "vedi" \IItestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 re''4^\markup\center-align "Ni[ce]" r16 re''}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "sop2"
            \IIsopranoII \global
            \new Lyrics \lyricsto "deh" \IItestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef tenor \key do\major \time 4/4 do'8^\markup\center-align "Al[cindo]" sol16 mi'}
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ten"
            \IItenore \global
            \new Lyrics \lyricsto "tenta" \IItestoIII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \IIbc\global
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

   \pageBreak

   \markup \huge {[3.] All[egr]o -  Come l'erba in vago prato}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"[Violino I]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \IIIvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"[Violino II]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \IIIvlII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Viola]"
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \IIIvla
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key sol\minor \time 4/4 r2^\markup\center-align "Ni[ce]" r4 r8 sib'16 do''}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "sop2"
            \IIIsopranoII\global
            \new Lyrics \lyricsto "erba" \IIItestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \IIIbc\global
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

   \markup \huge {[4.] [Recitativo] - A suo grado scherzar può}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r4 r8^\markup\center-align "Eu[rilla]" la' re''}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "sop1"
            \IVsopranoI \global
            \new Lyrics \lyricsto "timido" \IVtestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef tenor \key do\major \time 4/4 sib8^\markup\center-align "Al[cindo]" sib}
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ten"
            \IVtenore \global
            \new Lyrics \lyricsto "grado" \IVtestoIII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \IVbc\global
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

   \markup \huge {[5.] All[egr]o -  Dell'alma superba}

   \score {
      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violini"\vspace #-0.3"unisoni"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl"
            \VvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef tenor \key sib\major \time 2/4\numericTimeSignature \override Staff.TimeSignature.style = #'single-digi r4 r8^\markup\center-align "Al[cindo]" fa'}
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ten"
            \Vtenore \global
            \new Lyrics \lyricsto "alma" \VtestoIII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column {"Fagotto"}
            \set Staff.midiInstrument = #"bassoon"
            \set Staff.shortInstrumentName = "fg"
            \Vfg\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column {"Violone"\vspace #-0.2"Solo"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \Vbc\global
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

   \markup \huge {[6.] [Recitativo] - Alcindo, io t'apro il sen}

   \score {
      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
      }  <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{"Violini"\vspace #-0.4"Unisoni"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \VIvlI\global
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r4^\markup\center-align "Eu[rilla]" r8 re''}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "sop1"
            \VIsopranoI \global
            \new Lyrics \lyricsto "apro" \VItestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \VIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2\cm

         \context {
            \Staff
            \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
         }

         \context	{
            \Score
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

   \paper  {

      systems-per-page = #4

   }

   \markup \huge {[8.] [Recitativo] -  Non dileggiarmi più}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Violino [I]"\vspace #-0.2"e Oboè [I]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "vl1"
            \VIIvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Violino [II]"\vspace #-0.2"e Oboè [II]"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "vl2"
            \VIIvlII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Viola]"
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \VIIvla
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef tenor \key do\major  \time 4/4 re'8^\markup\center-align "Al[cindo]" si16 si}
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ten"
            \VIItenore\global
            \new Lyrics \lyricsto "dileggiarmi" \VIItestoIII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \VIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 14)
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

   \pageBreak

   \markup \huge {[10.] [Recitativo] -  Dove, dimmi o’ indiscreto}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Violino [I]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \VIIIvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Violino [II]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \VIIIvlII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Viola]"
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \VIIIvla
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major  \time 4/4 sib'8^\markup\center-align "Ni[ce]" sol'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "sop2"
            \VIIIsopranoII\global
            \new Lyrics \lyricsto "indiscreto" \VIIItestoII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \VIIIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 14)
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

   \markup \huge {[12.] Recitativo -  Almen fingi d'amarmi}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 do''8^\markup\center-align "Eu[rilla]" do''}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "sop1"
            \IXsopranoI \global
            \new Lyrics \lyricsto "fingi" \IXtestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef tenor \key do\major \time 4/4 la16^\markup\center-align "Al[cindo]" la}
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ten"
            \IXtenore \global
            \new Lyrics \lyricsto "amar" \IXtestoIII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column {"[Basso]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \IXbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2\cm

         \context {
            \Staff
            \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
         }

         \context	{
            \Score
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

   \paper  {

      systems-per-page = #4

   }

   \markup \huge {[13.] All[egr]o -  Vorresti lusingarmi}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"[Violini I]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl1"
            \XvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"[Violini II]"}
            \set Staff.midiInstrument = #"violin"
            \set Staff.shortInstrumentName = "vl2"
            \XvlII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Viola]"
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \Xvla
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key re\major  \time 4/4 r4 r8^\markup\center-align "Eu[rilla]" la' re''}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "sop1"
            \XsopranoI\global
            \new Lyrics \lyricsto "vorresti" \XtestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Basso]"
            \set Staff.midiInstrument = #"cello"
            \set Staff.shortInstrumentName = "bc"
            \Xbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 14)
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

   \markup \huge {[14.] Recitativo -  No, non fingo}

   \score {

      \new ChoirStaff <<

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key do\major \time 4/4 r4 r8^\markup\center-align "Eu[rilla]" si' sol'}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "sop1"
            \XIsopranoI \global
            \new Lyrics \lyricsto "senti" \XItestoI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef tenor \key do\major \time 4/4 mi'4^\markup\center-align "Al[cindo]" r8 fa'}
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \set Staff.shortInstrumentName = "ten"
            \XItenore \global
            \new Lyrics \lyricsto "fingo" \XItestoIII
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup \center-column {"[Basso]"}
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.shortInstrumentName = "bc"
            \XIbc\global
         >>
      >>

      \layout {

         #(layout-set-staff-size 17)
         indent = 2\cm

         \context {
            \Staff
            \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
         }

         \context	{
            \Score
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

   \paper  {

      systems-per-page = #3

   }

   \markup \huge {[15.] Coro: All[egr]o -  Si punisca, si sbrani, s'uccida}

   \score {

      \new ChoirStaff  <<

         \new ChoirStaff <<
            \set ChoirStaff.instrumentName = \markup\center-column {"Corni da"\vspace #-0.2"Caccia"}

            \new Staff <<
               \set Staff.midiInstrument = #"french horn"
               \set Staff.shortInstrumentName = "cr1"
               \XIIcrI
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"french horn"
               \set Staff.shortInstrumentName = "cr2"
               \XIIcrII
            >>
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup\center-column {"Violini & Oboè"\vspace #-0.3"Unisoni"}
            \set Staff.midiInstrument = #"oboe"
            \set Staff.shortInstrumentName = "vl"
            \XIIvlI
         >>

         \new Staff <<
            \set Staff.instrumentName = \markup "[Viola]"
            \set Staff.midiInstrument = #"viola"
            \set Staff.shortInstrumentName = "vla"
            \XIIvla
         >>
         

            \new ChoirStaff <<
               \set ChoirStaff.instrumentName = \markup {"Coro unisoni"}

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef soprano \key fa\major \time 3/8 \numericTimeSignature r8^\markup\center-align "Soprani"fa'16 [sol']}
                  \clef violin
                  \set Staff.midiInstrument = #"voice oohs"
                  \set Staff.shortInstrumentName = "sop"
                  \XIIsopranoI\global
                  \new Lyrics \lyricsto "punisca1" \XIItestoI
               >>

               \new Staff <<
                  \set Staff.instrumentName = \markup \center-column{""}
                  \incipit { \clef tenor \key fa\major \time 3/8 \numericTimeSignature r8_\markup\center-align "Tenore"fa16 [sol]}
                  \clef "treble_8"
                  \set Staff.midiInstrument = #"voice oohs"
                  \set Staff.shortInstrumentName = "ten"
                  \XIItenore \global
                  \new Lyrics \lyricsto "punisca2" \XIItestoIII
               >>
            >>

            \new Staff <<
               \set Staff.instrumentName = \markup \center-column {"[Basso]"}
               \set Staff.midiInstrument = #"contrabass"
               \set Staff.shortInstrumentName = "bc"
               \XIIbc\global
            >>
         >>

         \layout {

            #(layout-set-staff-size 15)
            indent = 1.5\cm

            \context	{
               \Score
               \override StaffGrouper.staff-staff-spacing.padding = #2
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



