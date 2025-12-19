\language "italiano"
	%********************************** VARIABILI


\version "2.18.0"

su = \change Staff = up

giu = \change Staff = down

ten = _\markup \italic "ten"

cres = _\markup \italic "cres"

dolce = _\markup \italic "Dolce"

arco = _\markup \italic "arco"

pizz = _\markup \italic "pizzic"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

pad = \once \override TextScript.padding = #2.5

padall = \override TextScript.padding = #1.8

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

ds = _\markup \italic \right-align {"Dal Segno"}

notypeset = \set Score.skipTypesetting = ##f

typeset = \set Score.skipTypesetting = ##f

senza = \override TupletNumber.transparent = ##t

con = \override TupletNumber.transparent = ##f

tr = \trill

tu = _\markup \italic {"tutti"}

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


mbreak = { }



Icln = \relative do'' {

    fa4.~fa8. sol16 mi8 fa4.~fa8. sol16 mi8
     \slurDashPattern #0.5 #0.8 fa8. sol16 (la8) sol8. (la16) fa8 \grace fa mi4. la8. sol16 la8
    r4 r8 sol8. fa16 sol8\mbreak r4 r8 fa8.  mi16 fa8\slurSolid

    %4
    sib,2.~sib4 la8 \slurDashPattern #0.5 #0.8 la8. (sib16) sol8\slurSolid
    fa4. fa'8.(sol16) fa8 fa4 mi8 sol8.(la16) sol8
    sol4(fa8) fa8.(sol16) fa8\mbreak fa4(mib8) mib4(dod8)

    %7
    re2. dod4 re8 re8. mi16 dod8
    re4. r4 r8 r2.\mbreak
    R1.

    %10
    r2. fa4.~fa8. sol16 mi8
    fa4.~fa8.(sol16) mi8 fa4. r4 r8
    \slurDashPattern #0.5 #0.8 r2. r4 r8 sol8. (fa16) sol8

    %13
    r4 r8 fa8. (mib16) fa8\mbreak r4 r8 mib8. (re16) mib8
    R1.
    r4 r8 re8. (mib16) re8 re4 (do8)\slurSolid mib8.(fa16) mib8\mbreak

    %16
    mib?4\tr(re8) \slurDashPattern #0.5 #0.8 sol8. (fa16) mib!8 re8. (do16) sib8 la4.
    sol r4 r8 r2.\slurSolid
    R1.

    %19
    r4 r8 la'8.(sol16) la8 la4 sol8 \slurDashPattern #0.5 #0.8 sol8. (fa16) sol8
    sol4 (fa8) fa8. (mi16) fa8 fa4 mi8 r4 r8\slurSolid \mbreak
    mi8.(re16) mi8 r4 r8 fa8. mi16 fa8 r4 r8

    %22
    fa4(mi8) r4 r8 \slurDashPattern #0.5 #0.8 mi4 (re8) r4 r8
    R1.
    mi8. (re16) mi8 la4 sol8 fa8. mi16\slurSolid re8 re8.(mi16) dod8

    %25
    re4.~re8. mi16(dod8) re4. r4 r8\mbreak
    R1.
    r2. fa4.~fa8. sol16 mi8

    %28
    fa4.~fa8. sol16 mi8\mbreak fa8. sol16 la8 sol8. la16 fa8
    \grace fa mi4. la8. sol16 la8 r4 r8 sol8. fa16 sol8
    r4 r8 fa8. mi16 fa8 sib,2.~

    %31
    sib?4 la8 la8. sib!16 sol8 fa4. fa'8. sol16 fa8
    fa4 (mi8) sol8. la16 sol8 sol4 fa8 fa8. sol16 fa8
    fa4 mib8 mib4 dod8 re2.\mbreak

    %34
    dod4 re8 re8. mi16 dod8 re4.\fermata r4 r8
    mi8. re16 do?8 r4 r8 mi8. re16 do8 r4 r8
    r2.\mbreak r8 r si do4 re8

    %37
    mi4. r4 r8 sol4(fa8) mi4 re8
    mi4 re8 do4 do8 do4 si8 r4 r8\mbreak
    r2. r4 r8 sol'8. la16 sol8

    %40
    sol4 fa8 fa8.(sol16) fa8 fa4 mi8 mi8. fa16 mi8
    mi4(re8) re8. mi16 re8 re4 do8 do8.(re16) \parenthesize do8
    do4 si8 r4 r8 r2.

    %43
    R1.
    R2.

}


Ifln = \relative do'' {

    re4. ~re8. mi16 dod8 re4.~re8. mi16 dod8
    re8. mi16(fa8) mi8.(fa16) re8 \grace mi dod4. r4 r8
    sib8. la16 sib8 r4 r8\mbreak la8. sol16 la8 r4 r8

    %4
    re8. do16 re8 sol4 fa8 mi(do) fa fa8.(sol16) mi8
    \slurDashPattern #0.5 #0.8 fa4. la8. (sib16) la8 la4 \slurSolid sol8 mi8.(fa16) mi8
    \slurDashPattern #0.5 #0.8 mi4 re8 re8. (mi16) re8\mbreak \slurSolid sib4(sol8) \slurDashPattern #0.5 #0.8 sol4 (mi8)

    %7
    \slurSolid fa4 sib8 sib4(sold8) la8.(sol16) fa8 fa4(mi8)
    re4. r4 r8 r2.
    R1.

    %10
    r2. la''4.~la8. sib16 sol8
    \slurDashPattern #0.5 #0.8 la4.~la8. (sib16) sol8\mbreak la4. r4 r8\slurSolid
    r2. re,8.(do16) re8 r4 r8

    %13
    \slurDashPattern #0.5 #0.8 do8. (sib?16) do8 r4 r8\mbreak sib!8. (la16) sib8 r4 r8\slurSolid
    la8.(sol16) la8 r4 r8 r2.
    \slurDashPattern #0.5 #0.8 r4 r8 sib8. (do16) sib8 \slurSolid sib4(la8) do8.(re16) do8\mbreak

    %16
    \slurDashPattern #0.5 #0.8 do4 (sib8)\slurSolid r4 r8 sib8.(la16) sol8 \slurDashPattern #0.5 #0.8 sol8. (la16) fad8
    sol4. r4 r8 r2.\slurSolid
    R1.

    %19
    r4 r8 fa'8.(mi16) fa8 fa4 mi8 mi8.(re16) mi8
    mi4(re8) re8.(dod16) re8 re4 dod8 r4 r8\mbreak
    \slurDashPattern #0.5 #0.8 dod8. (si16) dod8 r4 r8 re8. dod16 re8 r4 r8\slurSolid

    %22
    la4(sol8) r4 r8 la4(fa8) r4 r8
    R1.
    dod'8.(si16) dod8 dod4 dod8 re4 la8 la4 sol8

    %25
    fa4.~fa8. sol16(mi8) fa4. r4 r8\mbreak
    R1.
    r2. re'4.~re8. mi16 dod8

    %28
    re4.~re8. mi16 dod8\mbreak re8. mi16 fa8 mi8. fa16 re8
    dod4. r4 r8 sib8. la16 sib8 r4 r8
    la8. sol16 la8 r4 r8 re8. do16 re8 sol4 fa8\mbreak

    %31
    mi8. do16 fa8 fa8. sol16 mi8 fa4. la8. sib?16 la8
    la4(sol8) mi8. fa16 mi8 mi4 re8 re8. mi16 re8
    sib4 sol8 sol4 mi8 fa4 sib8 sib4 sold8\mbreak

    %34
    la8. sol?16 fa8 fa4 mi8 re4.\fermata r4 r8
    do'8. si16 la8 r4 r8 do8. si16 la8 r4 r8
    r2.\mbreak r8 r sold la4 si8

    %37
    do4. r4 r8 mi4(re8) do4 sol?8
    sol4 sol8 sol4 la8 la4 sol8 r4 r8\mbreak
    r2. r4 r8 mi'8. fa16 mi8

    %40
    mi4 re8 re8.(mi16) re8 re4 do8 do8. re16 do8
    \slurDashPattern #0.5 #0.8  do4 (si8) si8. do16 si8 si4 la8 la8. (si16) \parenthesize la8\mbreak
    la4 sold8 r4 r8 r2.

    %43
    R1.
    R2.

}

Ivocen = \relative do'' {

    \autoBeamOff

    R1.*7
    re4.~re8. mi16[(dod8)] re4.~re8. mi16[dod8]\mbreak
    re8.[mi16] fa8 mi8.[(fa16) re8] \grace re dod4. re4 do?8

    %10
    sib8. la16[sol8] mi'4 sib8 la8.[sol16] fa8 r4 r8
    r4 r8 do'4 do8\mbreak do8. sib16[la8] re4 re8
    re8. do16[sib8] lab4 fad8 sol4. mib'8. [re16 mib8]

    %13
    fa,4. re'8.[do16 re8]\mbreak mib,4. do'8.[sib?16 do8]
    re,4 mib'8 re4. re8.[do16 sib8] sib4 la8
    sol4. r4 r8 r2.

    %16
    R1.
    r4 r8 sol4 do8 la4 fa8 mib4 mib'8
    re8. do16[(sib8)] re4 sol8\mbreak mi!4 do8 sib4 mi8

    %19
    fa4 fa,8 r4 r8 r2.
    r r4 r8 mi'4 dod8\mbreak
    sol4 dod8 mi4 sol,8 fa4. fa'8.[mi16 fa8]

    %22
    r4 r8 mi8.[re16 mi8] r4 r8 re8.[dod16 re8]
    dod4(la8) sol4 mi'8\mbreak fa4(re8) sib4(sold8)
    la2.~la8.[sol?16 fa8] fa4 mi8

    %25
    re4. r4 r8 r4 r8 re'4 fa8\mbreak
    mib4 mib8 dod4 mi,8 re4 sol'8 fa4.~
    fa8. mi16[re8] dod4. re r4 r8

    %28
    R1.*7
    la4.~la8. si16[(sold8)] la4.~la8. si16[sold8]
    la4 si8 do4.\mbreak si r4 r8

    %37
    do4.~do8. re16[(si8)] do4.~do8. re16[si8]
    do4 re8 mi4. re sol4 fa8\mbreak
    mi8. re16[do8] re[(do)] si do2.

    %40
    la8.[(sol16) la8] re r r sol,8.[fa16 sol8] do8 r r
    re8.[do16 re8] fa r r mi8.[re16 mi8] la8.[sol16 fa8]\mbreak
    mi4. fa16[(mi re  do si) re] do8.[si16 la8] sold4.

    %43
    la~la4 si8 mi,4 mi'8 do4(si8)
    la2.

}

Itesto = \lyricmode {

    Non v'è pe -- na ne l'amo - re che per te non soffra_un _ core _

    o fu -- nesta _ o fu -- nesta _ lonta - nan - - - - - - - - - - - za.

    Non v'è pe -- na ne l'amo - re che per te non soffra _ un cor

    o fu -- nesta _ lonta - nan - - - - - - - - - - - za, o fu -- nesta _ lontananza _ _ _ lonta - nan -- za.

    Per te_op -- pres -- sa l'alma _ te -- me per te pri -- va dalla _ speme _ fida _

    men della _ costan - - - - - - - - - - - - - za  della _ costan - za.

}

Ibcn = \relative do {

    re4 mi8 fa4 la8  re,4 mi8 fa4 la8
    re,4 re8 sol4 sold8 la4 sol?8 fa4 re8
    sol4 sol8 mi4 do8\mbreak fa4 fa8 la4 fa8

    %4
    sol4 sol8 sib4 sol8 do4 re8 sib4 do8
    fa,4 fa,8 fa'8. mi16 fa8 do'4 do,8 dod'8. si16 dod8
    re4 re,8 fa8. mi16 fa8\mbreak sol4 sol8 sol4 la8

    %7
    re,4 sol8 sol4 sib8 la4 sib8 sol4 la8
    re,4 mi8 fa4 la8 re,4 mi8 fa4 la8\mbreak
    re,4 sib8 sol4 sold8 la4 la'8 fa4 re8

    %10
    sol4 sol8 do,4 mi8 fa4 sol8 la4 do8
    fa,4 sol8 la4 do8\mbreak fa,4 fa,8 fad'4 re8
    sol4 sol,8 do4 re8 sib4 sol8 do4 sib8

    %13
    la4 fa8 sib4  la8\mbreak sol4 sol8 la4 sol8
    fad4. r8 r fad' sol4 do,8 re4 re,8
    sol4 sol'8 re4 mib8 fa4 fa,8 fad'4 fad8\mbreak

    %16
    sol4 sol,8 mib'8. re16 do8 sib4 mib8 do4 re8
    sol,4 sol'8 mi!4 do8 fa4 fa8 sol4 la8
    sib4 sib,8 si4 sol8\mbreak do4 do8 mi4 do8

    %19
    fa,4 fa'8 la4 fa8 do'4 do,8 dod'8. si16 dod8
    re4 re,8 fa4 re8 la'4 la,8 r4 r8\mbreak
    la4. r8 r la re4 re'8 la4 si!8

    %22
    do4 do,8 dod'4 la8 re4 re,8 fa4 sib8
    la4  la,8 si?4 dod8\mbreak re4 re8 sol4 sib8
    la4 la,8 dod4 la8 re4 re8 la'4 la,8

    %25
    re4 mi8 fa4 la8 re,4 mi8 fa4 re8\mbreak
    sol4 sol8 la4 sol8 fa4 mi8 re4 sib'8
    sold4 sold8 la4 la,8 re4 mi8 fa4 la8

    %28
    re,4 mi8 fa4 la8\mbreak re,4 re8 sol4 sold8
    la4 sol?8 fa4 re8 sol4 sol8 mi4 do8
    fa4 fa8 la4 fa8 sol4 sol8 sib4 sol8\mbreak

    %31
    do4 re8 sib4 do8 fa,4 fa,8 fa'8. mi16 fa8
    do'4 do,8 dod'8. si?16 dod8 re4 re,8 fa8. mi16 fa8
    sol4 sol8 sol4 la8 re,4 sol,8 sol4 sib8\mbreak

    %34
    la4 sib8 sol4 la8 re,4\fermata re'8 do4 si?8
    la4 si8 do4 mi8 la,4 si8 do4 mi8
    la,4 sold8 la4 red8\mbreak mi4 mi8 mi4 re?8

    %37
    do4 re8 mi4 sol8 do,4 re8 mi4 sol8
    do,4 si8 do4 fad8 sol4 sol,8 si4 sol8\mbreak
    do4 la'8 fa4 sol8 do,4 do8 mi4 do8

    %40
    re4 re'8 si4 sol8 do4 do, 8mi4 do8
    sol'4 sol,8 sold'4 sold8 la4 la,8 r r re\mbreak
    mi4 mi,8 r r sold' la4 fa8 mi4 mi,8

    %43
    do'4 si8 la4 sold8 la4 la8 mi'4 mi,8
    la4 la'8 fa4 mi8

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1.*12
    s2. <6->
    s1.*22
    s2. s4. <6 4>4 <6>8

}


forma = {

    \time 12/8
    \key do\major
    \tempo 4 = 70
    s1.*43
    \set Score.measureLength = #(ly:make-moment 3 4)
    s2.
    \bar "||"
    \mark\markup\smaller\center-column {"Da""Capo"}

}

Icl = {
    \notypeset
    <<\Icln \forma>>

}

Ifl = {
    <<\Ifln \forma>>

}

Ivoce = {
    \new Voice = "pena"
    <<\Ivocen \forma>>
}



Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}



IIvocen = \relative do'' {

    \autoBeamOff

    re2 mib,4 r16 mib'? mib mib
    do8 do r16 mib do la fad8 fad r la16 do\mbreak
    mib4 mib8 re sib4 sib8 sib16 re

    %4
    si!8 si r si16 si si4 do8 re
    re sold, r sold 16 sold\mbreak sold4 la8 si
    mi,4 r16 mi' si do la8 la r la

    %7
    sib sib sib la fa4 r16 la fad sol\mbreak
    sol8 sol r sol16 la si4 si8 do
    re re r re re8. re16 mi8 fa

    %10
    mi si re do\mbreak do do r4
    do8 do16 do do8 mi dod dod mi fa
    re re r4 mib do8 do\mbreak

    %13
    mib4 mib8 re sib sib r4
    sib?8 sib16 sib do8 re do do r4  %%% fin qui OK
    do8 la16 la la8 do do fa, r la

    %16
    do mib, mib re mib mib r mib'?16 re
    re8 re r re fa fa r16 lab, lab sol\mbreak
    lab8 lab r4 lab8 lab16 lab sol8 fa

    %19
    re'4 re8 re16 fa fa8 sib, r16 sib sib do\mbreak
    lab8 lab re16 fa mib re mib8 mib r mib16 re
    re4 la8 do\mbreak sib4 r16 mib do sib

    %22
    sol8 sol r4 r2

}

IItesto = \lyricmode {

    Lunge _ da l'idol _ caro, _ o quante _ pene _ proviam _

    tenero _ _ cor! Quanti _ pen -- sieri _ sugge - risce_a _ la mente _ quel pun --

    gente _ timor _ che_ognor _ l'affanna: _ _ pen -- sieri_in - fausti _ si; ma pur cre --

    duti; _ poi che tragi - ci_e -- sempi_in - segna - no a gli_a -- manti_o - gni mo -- mento, _

    quanto _ l'amor _ of -- fendan _ le distanze _ _ Ah Fille! _ Idolo _ _ mio, _  pensa _ che sol su'l pegno _ della _

    giurata _ _ fede _ respira _ ancor _ che mesta, _ l'alma _ mia; _ e pensa, _ o dolce _ bene, _

    ch'è d'un eroi - co_a -- mor nobi - le_im -- presa _ oppor - si_ai rischi _ della _ lontananza, _ _ _ col valor _ della _

    sì della _ costanza. _ _

}

IIbcn = \relative do {

    sol'1~
    sol
    fad2 sol

    %4
    fa?1
    mi2~mi~
    mi do

    %7
    dod re4 do?
    si!2~si
    si1

    %10
    sold2\mbreak la~
    la sol?
    fa fad~

    %13
    fad? sol~
    sol la~
    la~\mbreak la~

    %16
    la1
    sib2 re~
    re1~

    %19
    re
    si!2 do
    fad,\mbreak sol4 do

    %22
    re2 sol,

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 65
    s1*22
    \bar "|."

}

IIvoce = {

    \notypeset
    \new Voice = "lunge"
    <<\IIvocen \forma>>

}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}




IIIcln = \relative do'' {

    re8 mi fa
    mi \grace re dod4
    re16 dod re mi fa8

    %4
    fa sol la
    sol \grace fa mi4
    fa16 mi fa sol la8

    %7
    la sol16 fa mi re\mbreak
    dod8 re8.\tr dod32 re
    mi8 r r

    %10
    fa16 sol la sol fa mi
    \grace mi8 re4 r8
    sol16 la sib la sol fa

    %13
    \grace fa8 mi4.\tr\mbreak
    fa16 sol la sol fa mi
    \grace mi8 re4.

    %16
    mi16 fa sol fa mi re
    \grace re8 do4.\tr
    la'8(re,) sib'

    %19
    la(re,) sol~\mbreak
    sol fa sib
    la re, sol~

    %22
    sol fa sib
    la re, r
    fa16 mi fa sol la mi

    %25
    fa mi fa sol la mi
    fa8. mi16 re8\mbreak
    re dod?4

    %28
    re r8
    R4.*3
    re8  mi fa

    %33
    mi dod4\mbreak
    re16 dod re mi fa8
    fa8. sol16 la8

    %36
    la\noBeam sol8.\tr fa32 sol
    la8 r r
    fa16 sol la sol fa mi

    %39
    \grace mi8 re4.\tr
    sol16 la sib la sol fa
    \grace sol8 mi4.

    %42
    fa16 sol la sol fa mi
    \grace mi8 re4.
    mi16 fa sol fa mi re\mbreak

    %45
    dod8 mi la
    fa mi4
    re r8

    %48
    R4.*2
    re8 mi fa
    mi dod4\mbreak

    %52
    re16 dod re mi fa8
    fa8. sol16 la8~
    la\noBeam sol8. fa32 sol

    %55
    la8 r r
    fa16 sol la sol fa mi
    \grace mi8 re4.\mbreak

    %58
    sol16 la sib la sol fa
    \grace fa8 mi4.
    fa16 sol la sol fa mi

    %61
    \grace mi8 re4.
    mi16 fa sol fa mi re\mbreak
    \grace mi8 do4.

    %64
    R4.*2
    fa8 sol la
    sol mi4

    %68
    fa16 mi fa sol la8
    la, sib sol\mbreak
    fa4 r8

    %71
    R4.*5
    mi'8 la, fa'
    mi la, re~

    %78
    re dod fa
    mi la, la'
    fa8. sol16 la8

    %81
    re,(dod) \once\tieDashed mi~
    mi re r\mbreak
    R4.

    %84
    re8 mi fa
    sol4.~
    sol16 la sol la sol fa

    %87
    mi4.~\mbreak
    mi16 fa mi fa mi re
    dod si dod8 r

    %90
    R4.
    fa8 sol la
    sol mi4

    %93
    fa16 mi fa sol la8
    R4.*4
    re,8 mi fa

    %99
    mi \grace re dod4
    re16 dod re mi fa8
    fa sol la\mbreak

    %102
    sol \grace fa mi4
    fa16 mi fa sol la8
    la sol16 fa mi re

    %105
    dod8 re8.\tr dod32 re
    mi8 r r
    fa16 sol la sol fa mi

    %108
    \grace mi8 re4.\tr
    sol16 la sib la sol fa
    \grace fa8 mi4.

    %111
    fa16 sol la sol fa mi
    \grace mi8 re4.
    mi16 fa sol fa mi re\mbreak

    %114
    \grace re8 dod4.\tr
    la'8(re,) sib'
    la(re,) sol~

    %117
    sol fa sib
    la(re,) sol~
    sol(fa) sib

    %120
    la re, r
    fa16 mi fa sol la mi
    fa mi fa sol la mi\mbreak

    %123
    fa8. mi16 re8
    re dod4
    re\fermata r8

    %126
    R4.*3
    la8 si do\mbreak
    re si4

    %131
    do16 si do re mi8
    mi8. fa16 sol8
    fa mi4

    %134
    \grace mi8 re4.
    mi8. fa16 sol8
    fa mi4

    %137
    \grace mi8 re4.
    mib8.(fa16) mib8
    mib? mib4

    %140
    mib?8 re r
    R4.*6
    mi8 la, re~

    %148
    re do fa
    mi la, do~
    \parenthesize do si re~\mbreak

    %151
    re do mi~
    mi re fa~
    fa mi do~

    %154
    do si r
    R4.*2

}


IIIfln = \relative do'' {

    R4.*3
    re8 mi fa
    mi \grace re dod4
    re16 dod re mi fa8
    fa sib16 la sol fa\mbreak
    mi8 fa sol
    la r r
    R4.
    sib,16 do re do sib la
    \grace la8 sol4.
    do16 re mi re do sib\mbreak
    \grace sib8 la4.
    sib16 do re do sib la
    sol la sib la sol fa
    \grace fa8 mi4.
    r8 r sol'~
    sol fa sib\mbreak
    la re, sol~
    sol fa sib
    la re, sol~
    sol fa r
    re8. mi16 dod8
    re8. mi16 dod8
    re la la\mbreak
    fa mi4
    re r8
    R4.*3
    fa8 sol la
    sol mi4\mbreak
    fa16 mi fa sol la8
    re8. mi16 fa8
    mi re4
    dod8 r r
    R4.
    sib16 do? re do sib la
    \grace la8 sol4.
    do16 re mi re do sib
    la4.
    sib16 do re do sib la
    mi8 dod' re~\mbreak
    re dod4(
    re8) dod4
    re r8
    R4.*2
    fa,8 sol la
    sol mi4\mbreak
    fa16 mi fa sol la8
    la'8. sol16 fa8
    mi re4
    dod8 r r
    R4.
    sib16 do re do sib la\mbreak
    \grace la8 sol4.
    do16 re mi re do sib
    \grace sib?8 la4.
    sib16 do re do sib la
    \grace la8 sol4.\mbreak
    la16 sib do sib la sol
    fa8 r r
    R4.
    la'8 sib do
    sib sol4
    la16 sol la sib do8
    fa, sol mi\mbreak
    fa4 r8
    R4.*5
    r8 r re~
    re dod fa
    mi la, re~
    re dod mi~
    mi re fa~
    fa mi \once\tieDashed sol,~
    sol fa r\mbreak
    R4.
    fa'8 sol la
    sib4.
    sib?16 do sib do sib! la
    sol4.~\mbreak
    sol16 la sol la sol fa
    mi re mi8 r
    R4.
    re8 mi fa
    mi dod4 re16 dod re mi fa8
    R4.*7
    re8 mi fa\mbreak
    mi \grace re dod4
    re16 dod re mi fa8
    fa sib16 la sol fa
    mi8 fa sol
    la r r
    R4.\mbreak
    sib,16 do re do sib la
    \grace la8 sol4.
    do16 re mi re do sib
    \grace sib8 la4.
    sib16 do re do sib la
    sol la sib la sol fa\mbreak
    \grace fa8 mi4.
    r8 r sol'~
    sol fa sib
    la re, sol~
    sol fa sib
    la re, sol~
    sol fa r
    re8. mi16 dod8
    re8. mi16 dod8\mbreak
    re la la
    fa mi4
    re\fermopz r8
    R4.*3
    do'8 re mi\mbreak
    fa re4
    mi16 re mi fa sol8
    do,8. re16 mi8
    re do4
    \grace do8 si4.
    do8. re16 mi8
    re do4\mbreak
    \grace do8 si4.
    do8.(re16) do8
    do do4
    do8 si! r
    R4.*7
    mi8 la, re~
    re do la~
    la sold si~\mbreak
    si la do~
    do si re~
    re do la~
    la sold r
    R4.*2

}

IIIvocen = \relative do'' {

    \autoBeamOff

    R4.*28
    re8 mi fa
    mi dod4

    %31
    \parenthesize re 16[dod re mi] fa8
    la, sol fa
    sol mi4\mbreak

    %34
    fa16[mi fa sol] la8
    fa'8. mi16 re8
    dod re4

    %37
    mi8 la, r
    R4.*9
    re8 mi fa

    %48
    mi dod4
    re16[dod re mi] fa8
    la, sol fa

    %51
    sol mi4\mbreak
    fa16[mi fa sol] la8
    fa'8. mi16 re8

    %54
    dod re4
    mi8 la, r
    re16[(mi)] fa[(mi)] re[(do)]

    %57
    sib4.\mbreak
    mi16 [fa sol fa mi re]
    do4.

    %60
    re16 [mi fa mi re do]
    sib4.
    do16 [re mi re do sib?]\mbreak

    %63
    la16[sol fa sol la sib]
    do8. mi16 fa8
    fa, sol4

    %66
    fa r8
    R4.*3\mbreak
    la8 sib do

    %71
    re do4
    sib16[la sol fad] sol8
    si! dod re

    %74
    mi re4
    dod16[si la sold] la8\mbreak
    mi' la, fa'

    %77
    mi[la,] fa'
    mi[la, re]~
    re[dod mi]~

    %80
    mi[re fa]~
    fa[mi sol,]~
    sol fa r\mbreak

    %83
    la si dod
    re4.~
    re16[mib re mib re do]

    %86
    sib4.~
    sib?16 [do sib do sib la]\mbreak
    sol[fa] sol8 r

    %89
    mi' la, sol'
    fa mi4
    re r8

    %92
    R4.*2
    la8 re, sib'\mbreak
    la8 [re,] sib'
    la8. sol16 fa8

    %97
    sol mi4
    re r8
    R4.*27

    %126
    la'8 si do
    re si4
    do16[si do re] mi8

    %129
    do re mi\mbreak
    fa re4
    mi r8

    %132
    sol8. fa16 mi8
    re do4
    \grace do8 si4.

    %135
    sol'8. fa16 mi8
    re do4\mbreak
    \grace do8 si4.

    %138
    mib8. fa16 mib8
    mib? mib4
    mib?8 [re]  r

    %141
    re sol, fa'
    mi re4
    do16[re mi re do si]\mbreak

    %144
    la4.
    si16[do re do si la]
    sold[fa] mi8 r

    %147
    mi' la, fa'
    mi[la,] fa'
    mi[la, do]~

    %150
    do[si re]~
    re[do mi]~
    mi[re fa]~

    %153
    fa[mi la,]~
    la sold r16 mi'
    do8 si4

    %156
    la4.

}

IIItesto = \lyricmode {

    Se pur costante _ _ se -- i ai degni _ voti _ mie -- i grata _ ri -- sponde - rai. _

    Se pur costante _ _ se -- i ai degni _ voti _ mie -- i grata _ ri -- sponde - rai, _ risponde - - ra - - - - - - i risponde - - - i.

    Se pur costante _ _ se -- i ai degni _ voti _ mie -- i grata _ ris -- pon -- de -- ra -- i,

    rispon - dera - - - i ris -- ponde - ra - i, grata _ ris -- ponderai _ _ ris -- ponde - rai. _

    E se mai per mer - cè ti rende_il _ fato_a _ me bella _ del fido a -- mor cara _ di questo _

    cor cara _ di questo _ cor fede im -- parar _

    potra - - - - i fede im -- pa -- rar potra - i potra - - i.

}

IIIbcn = \relative do {

    re4 r8
    sol la sol
    fa8. mi16 re8

    %4
    sib' r fa
    sol la4
    re, r8

    %7
    re sol sol,\mbreak
    la re sib
    la la'16 sol fa  mi

    %10
    re4 r8
    sol4 r8
    sol4 r8

    %13
    la16 sib do sib la sol\mbreak
    fa4 r8
    sol16 la sib la sol fa

    %16
    mi8. fa16 sol8
    la16 sib la sol fa mi
    re4.~

    %19
    re~\mbreak
    re~
    re~

    %22
    re~
    re
    re8 la' la,

    %25
    re la' la,
    re8. mi16 fa8\mbreak
    sol la la,

    %28
    re4 r8
    fa mi re
    sol la4

    %31
    re, r8
    re4 r8
    sol, la4\mbreak

    %34
    re r8
    re4 r8
    la' sib4

    %37
    la r8
    re,16 mi fa mi re do\mbreak
    sib4.

    %40
    sib?8 sib sib
    do4.
    re8 re re

    %43
    sol4 r8
    sol sol sol\mbreak
    la8. sol16 fa8

    %46
    sol la la,
    re4 r8
    sol la sol

    %49
    fa8. mi16 re8
    R4.*3
    re8. mi16 fa sol

    %54
    la8 sib4
    la la,8
    R4.*6

    %62
    do4 r8\mbreak
    fa4 r8
    fa16 mi re do re8

    %65
    la sib do
    fa,4 fa'8
    sib do do,

    %68
    fa4 fa,8
    re' sib do\mbreak
    fa,4 r8

    %71
    fad4 r8
    sol4 r8
    sol4 r8

    %74
    sold4 r8
    la4 r8\mbreak
    la4.~

    %77
    la~
    la~
    la~

    %80
    la~
    la
    re8 re, r

    %83
    re'4 mi8
    fa  mi re
    sol,4 \parenthesize r8

    %86
    sol4 r8
    sol4 r8\mbreak
    sol4 r8

    %89
    la4 r8
    re la' la,
    re4 r8

    %92
    sol la sol
    fa8. mi16 re8
    dod re dod\mbreak

    %95
    re4 sol8
    fa8. mi16 re8
    sol, la4

    %98
    re r8
    sol la sol
    fa8. mi16 re8

    %101
    sib' r fa\mbreak
    sol la4
    re, r8

    %104
    re sol sol,
    la re sib
    la la'16 sol fa mi

    %107
    re4 r8\mbreak
    sol4 r8
    sol4 r8

    %110
    la16 sib do sib la sol
    fa4 r8
    sol16 la sib la sol fa

    %113
    mi8. fa16 sol8\mbreak
    la16 sib la sol fa mi
    re4.~

    %116
    re~
    re~
    re~

    %119
    \once\tieDashed re~
    re
    re8 la' la,

    %122
    re la' la,\mbreak
    re8. mi16 fa8
    sol la la,

    %125
    re4.\fermata
    do8 si la
    si mi16 re do si

    %128
    la4 r8
    la'8. sol16 fa mi\mbreak
    re8 sol sol,

    %131
    do4 r8
    do4 r8
    fa fad4

    %134
    sol16 la sol fa mi re
    do4 r8
    fa fad4\mbreak

    %137
    sol16 lab sol fa mib re
    do4.
    fad,8 fad4

    %140
    sol r8
    sol'4 la8
    fa sol4

    %143
    mi r8\mbreak
    fa16 sol la sol fa mi
    re4 red8

    %146
    mi8. re16 do si
    la4.~
    la~

    %149
    la
    mi'~\mbreak
    mi~

    %152
    mi~
    \once\tieDashed mi~
    mi8 mi, r16 do'

    %155
    re8 mi mi,
    la4.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.*43
    <6>4.
    s4.*28
    <_!>4.

}


forma = {

    \time 3/8
    \key do\major
    \tempo 4. = 75
    s4.*156
    \bar "|."
    \mark\markup\smaller\center-column {"Da""Capo"}

}

IIIcl = {
    %\notypeset
    <<\IIIcln \forma>>

}

IIIfl = {
    <<\IIIfln \forma>>

}

IIIvoce = {
    \new Voice = "costante"
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
    \con \terzine

}

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #4

    }

    \markup \huge {"[1.] Larghetto"}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Chalumeau""(Scialomuè)"}
                \set Staff.midiInstrument = #"clarinet"
                \Icl \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Traversiere""(Fluttalman)"}
                \set Staff.midiInstrument = #"flute"
                \Ifl \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \time 12/8\override Staff.TimeSignature.style = #'numbered  s8^\markup\center-align"Soprano"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce \global
                \new Lyrics \lyricsto "pena" \Itesto
            >>

            \new Staff = "main"
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \set Staff.midiInstrument = #"cello"
                \Ibc \global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}

\bookpart {

    \paper {

        systems-per-page = #7

    }

    \markup \huge {"[2.] Recit[ati]vo"}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \time 4/4} % \override Staff.TimeSignature.style = #'numbered  }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIvoce \global
                \new Lyrics \lyricsto "lunge" \IItesto
            >>

            \new Staff = "main"
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \IIbc \global
            >>
        >>

        \layout {

            indent = 1\cm
            incipit-width = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

}

\bookpart {

    \paper {

        systems-per-page = #4

    }

    \markup \huge {"[3.] Aria"}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \set Staff.midiInstrument = #"clarinet"
                \IIIcl \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \IIIfl \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \time 2/4 \override Staff.TimeSignature.style = #'numbered  }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIIvoce \global
                \new Lyrics \lyricsto "costante" \IIItesto
            >>

            \new Staff = "main"
            \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }<<
                \set Staff.midiInstrument = #"cello"
                \IIIbc \global
            >>
        >>

        \layout {

            indent = 1\cm
            incipit-width = 1\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

}
