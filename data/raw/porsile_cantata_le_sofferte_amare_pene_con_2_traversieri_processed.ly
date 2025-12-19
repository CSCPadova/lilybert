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



IflIn = \relative do'' {

    r8 la re
    re(dod) fa
    fa(mi) la

    %4
    la(sol) la
    sib16.(do32) \grace sib8 la4\tr
    sol4.~

    %7
    sol8 sib sol
    la8. sol16 fa8
    sol mi!4

    %10
    fa r8
    r r do\p~\mbreak
    do mib(do)

    %13
    sib sol sol'~
    sol la sol
    fa8.\f sol16 la8

    %16
    sol16 la \grace sol8 fa4\tr
    mi4 r8
    la4.~

    %19
    la~
    la~
    la~

    %22
    la4 r8
    sold r r\mbreak
    sol! r r

    %25
    fa\f sol mi
    sol32(mi16.) fa32(re16.) mib32(dod16.)
    \grace dod?8 re4 r8

    %28
    fa16 sol mi8.\tr [re16]
    re4 r8
    R4.*6

    %36
    r8 mi\p sol
    sol fa4~
    fa8 sol fa

    %39
    mi8~mi8.\tr re32 mi
    fa8 r r
    do re do

    %42
    mi fa\fermata r
    sol \parenthesize mi4
    fa4\f r8

    %45
    r do fa
    fa mi fa
    sol16. la32 \grace sol8 fa4\tr

    %48
    mi8 sol mi
    do4.~
    do8. sib16 la8

    %51
    sib sol4
    fa r8
    r sol'\p sib

    %54
    sib?(la4)~
    la8 sib la\mbreak
    \grace la8 sold4.(

    %57
    sol!)
    fa8 fa8.(mi32 fa)
    mi4 r8

    %60
    la4.~
    la~
    la~

    %63
    la
    R4.*7
    r8 la,\f re

    %72
    re(dod) fa
    fa(mi) la
    la(sol) la

    %75
    sib16. do32 \grace sib8 la4\tr
    sol4.~
    sol8 sib sol

    %78
    la8. sol16 fa8
    sol mi4\tr
    fa4 r8

    %81
    r r do\p~
    do mib do
    sib sol sol'~

    %84
    sol la sol
    fa8.\f mi16 re8
    mi dod4

    %87
    sol'32(mi16.) fa32(re16.) mib32(dod16.)
    re4 r8
    fa16. mi?32 mi8.\tr[re16]

    %90
    re8 r r
    r do\p sol'
    sol fad4\tr

    %93
    sol8 re32[(sib la sib)] re(sib la sib)
    fa'(re do re) fa[(re do re)] fa(re do re)\mbreak
    fa(re do re) fa[(re do re)] fa(re do re)

    %96
    lab'(fa mib fa) lab[(fa mib fa)] lab(fa mib fa)
    sol(mib re mib) sol[(mib re mib)] sol(mib re mib)
    solb(mib re mib) solb[(mib re mib)] solb(mib re mib)

    %99
    mib?4 re8
    r32 re re (mib) mib[(fa) fa(sol)] sol(lab) lab32.\tr (sol128 lab)
    sib4 r8

    %102
    r32 mib, mib(fa) fa[(sol) sol32.\tr (fa128 sol)] lab8
    r32 fa fa sol sol[(lab?) lab32.\tr(sol128 lab)] sib16 re,
    mib4.~

    %105
    mib16. lab32 fa8.[mib16]
    mib?32\f sib'(lab sib) sol[sib(lab sib)] sol sib(la sol)
    la16 sol sol4

    %108
    fad r8
    R4.*8

}


IflIIn = \relative do'' {

    R4.
    r8 la re
    re(dod) fa

    %4
    fa(mi) fa
    sol16.(la32) \grace sol8 fa4\tr
    mi8 sol mi

    %7
    do4.~
    do8. sib16 la8
    sib sol4

    %10
    fa la'8\p~
    la do la\mbreak
    fad~fad8.\tr (mi32 fad)

    %13
    sol4 mi8
    dod~dod8.\tr(si32 dod)
    re8.\f mi16 fa8

    %16
    mi16 fa \grace mi8 re4
    dod4.
    r8 la\p re

    %19
    re dod fa
    fa  mi re
    re dod fa

    %22
    fa mi r
    re r r\mbreak
    dod r r

    %25
    re\f mi dod
    re re sib
    la4 r8

    %28
    re16 mi dod8.[re16]
    re4 r8
    R4.*6

    %36
    r8 dod\p mi
    mi re r
    r sol, sib~

    %39
    sib sol4\tr
    la8 r r
    la sib la

    %42
    sib do\fermata r
    sib sol4\mbreak
    fa8\f do' fa

    %45
    fa mi la
    la sol la
    sib16. do32 la4\tr

    %48
    sol4.~
    sol8 sib sol
    la8. sol16 fa8

    %51
    sol mi4
    fa r8
    R4.

    %54
    r8 do\p mib
    re4.~\mbreak
    re8 mi? re

    %57
    dod la mi'~
    mi la, re
    re(dod) r

    %60
    R4.*12
    r8 la\f re
    re(dod) fa

    %74
    fa(mi) fa
    sol16. la32 \grace sol8 fa4\mbreak
    mi8 sol mi

    %77
    do4.~
    do8. sib16 la8
    sib sol4

    %80
    fa la'8\p~
    la do la
    fad~fad8.\tr(mi32. fad64)

    %83
    sol4 mi8
    dod~dod8.\tr(si32 dod)
    re8.\f mi16 fa8

    %86
    sol mi4
    re8 re sib\mbreak
    la4 r8

    %89
    re16. si?32 dod8.\tr [re16]
    re8 r r
    R4.

    %92
    r8 la\p do
    do sib32[(sol fad sol)] sib(sol fad sol)
    sib sib(la sib) re[(sib la sib)] re(sib la sib)\mbreak

    %95
    re(sib la sib) re[(sib la sib)] re(sib la sib)
    fa'(re do re) fa[(re do re)] fa(re do re)
    sib(sol fa sol) sib[(sol fa sol)] sib(sol fa sol)

    %98
    do8 do do
    do4 sib?8\mbreak
    r8 r32 re re (mib) mib[(fa) fa32.\tr(mib128 fa)]

    %101
    sol4 r8
    r32 do, do(re) re[(mib) mib32.(re128 mib)] fa8
    r32 re re mib mib[(fa) fa(sol)] sol16 fa

    %104
    sol8 r r
    R4.
    r32 sol\f fa sol mib[sol fa sol] mib8

    %107
    r32 do' sib do la[do sib do] la do sib do
    \grace sib8 la4 r8
    R4.*8

}

Ivocen = \relative do'' {

    \autoBeamOff

    R4.*28
    r8 la re
    re[(dod)] fa

    %31
    fa[(mi)] re
    dod re4
    r8 sol fa\mbreak

    %34
    mi[sol] re
    dod re8.\tr[ dod32 re]
    mi8 la, r

    %37
    r fa' re
    sib4.
    sol'16. [(fa32) mi16.(re32) do16.(sib32)]

    %40
    la8[(sib? la)]
    do[(re do)]
    mi fa\fermata r

    %43
    sib ,\parenthesize sol4
    fa4.
    R4.*7

    %52
    r8 do' fa
    fa[mi] do
    mib[fa] mib

    %55
    re16[dod] re4~
    re8 [mi? re]
    dod la r

    %58
    R4.
    r8 mi' la,
    la[fa'] la,

    %61
    la[mi'] la,
    la[fa'] la,
    la[mi'] la,

    %64
    sol' fa4~
    fa8 mi16[re] dod[sib]\mbreak
    la4 re8

    %67
    mi16[fa] dod4
    sol'32[(mi16.) fa32(re16.) mib32(dod16.)]
    \grace dod?8 re4 r8

    %70
    mi?16[fa] dod4
    re4.
    R4.*18

    %90
    r8  re fa
    mib4.
    do16[mib] re8 do

    %93
    do sib r
    r fa'8. re16\mbreak
    sib8 sib4

    %96
    fa'8 sib,8. lab16
    \grace lab?8 sol sol r
    mib' solb, solb

    %99
    solb?4 fa8\mbreak
    R4.
    r8 mib' sib

    %102
    do16[fa~] fa lab32[sol]  fa16[mib]
    re[fa16.] fa32[re do] sib16[lab]
    sol[mib32 re] mib[fa sol lab] sib16[do32 re]\mbreak

    %105
    mib16 do re8. mib16
    mib?4 r8
    R4.

    %108
    r8 re8. do16
    sib[sol32 fad] sol[la sib do] re8~
    re16[mi32 fa] mi16[re] mi32[re do si!]\mbreak

    %111
    do16[la32 sold] la[si do re] mi16[fa]
    mi la, sold8. la16
    re32[(do16.)do32(la16.) sib32(sold16.)]

    %114
    la4 r8
    si?16[do] sold8. la16
    la4.

}

Itesto = \lyricmode {

    Le soffer - te amare  _ pene _
    pon mo -- strarti_o _ bella _ Irene _
    la costan - - - - - za del mio cor.
    Le soffer - te amare  _ pe - - ne
    pon mo -- strarti_o _ bella _ Irene_o _ bella _ Irene _
    la co -- stanza _  del mio cor - del mio cor.
    Dopo_il _ duol de le tempeste _ _
    sì fre -- quenti _  e sì fu -- neste _ e sì fu -- neste _
    sorga_o - mai - - - - - - - - - più lieto_a - mor,
    sorga_o - mai - - - - - - - - - più lieto_a -- mor - più lieto_a - mor.

}

Ibcn = \relative do {

    re4 sib8
    la4 r8
    la4 r8

    %4
    fa4 re'8
    mi fa fa,
    do'4 re8

    %7
    mi4 mi8
    fa4 fa,8
    sib8. do16 do,8

    %10
    fa' fa fa
    mib4 mib8\mbreak
    re4 re,8

    %13
    sol sol sol
    la4 r8
    re4 re,8

    %16
    sol sold4
    la4.
    R

    %19
    \clef tenor r8 la'\p re
    re dod fa
    fa mi re

    %22
    re dod r
    si r r\mbreak
    \clef bass la8 r r

    %25
    re,\f sol, la
    sib la sol
    fa4 r8

    %28
    sol' la la,
    re4 r8
    \clef tenor r8 la' re

    %31
    re dod fa
    fa mi re
    \clef bass si4 la8\mbreak

    %34
    sol4 fa8
    mi re si
    la r dod

    %37
    re4 re,8
    sol sol sol
    mi mi mi

    %40
    fa4 r8
    \clef tenor fa'' fa fa
    sol la r

    %43
    \clef bass sib, do \parenthesize re
    fa,4 fa,8
    do'4 r8

    %46
    do4 fa8
    mi fa fa,
    do'4 re8

    %49
    mi4 r8
    fa4 fa,8
    sib do do,

    %52
    fa4 fa'8
    do do do
    fa, fa fa

    %55
    sib sib \parenthesize sib
    mi,! mi mi
    la4 dod8

    %58
    re fa sol
    la4 dod,8
    re r re

    %61
    dod r dod
    re re re
    dod r re

    %64
    sib'4 la8
    sol r sol\mbreak
    sol4 fa8

    %67
    sol la la,
    sib' la sol
    fa4 r8

    %70
    sol la la,
    re4 sib8
    la4 r8

    %73
    la4 r8
    fa r fa'
    mi fa fa,\mbreak

    %76
    do'4 re8
    mi4 mi8
    fa4 fa,8

    %79
    sib do do,
    fa fa' fa
    mib4 mib8

    %82
    re4 re,8
    sol sol sol
    la4 r8

    %85
    re4 re,8
    sol' la la,
    sib' la sol\mbreak

    %88
    fa4 r8
    sol la la,
    re r re

    %91
    re do do
    la la la
    sol16-.(sol-. sol-. sol-. sol-. sol-.)

    %94
    re'-.(re-. re-. re-. re-. re-.)\mbreak
    re-.(re-. re-. re-. re-. re-.)
    sib-.(sib-. sib-. sib-. sib-. sib-.)

    %97
    sib-.(sib-. sib-. sib-. sib-. sib-.)
    la-.(la-. la-. la-. la-. la-.)
    sib4.\mbreak

    %100
    sib16-.(sib-. sib-. sib-. lab-. lab-.)
    sol-.(sol-. sol-. sol-. sol-. sol-.)
    lab-.(lab-. lab-. lab-. lab-. lab-.)

    %103
    sib-.(sib-. sib-. sib-. sib-. sib-.)
    mib-.(mib-. mib-. mib-.) re[re]\mbreak
    sib? lab sib'?8[sib,]

    %106
    mib16-.(mib-. mib-. mib-. mib-. mib-.)
    do-.(do-. do-. do-. dod-. dod-.)
    re,8 re'16 mi fad re

    %109
    sol,8 sol' fa
    mi mi, sold'\mbreak
    la la, si

    %112
    do16 re mi8[mi,]
    fa' mi re
    do4 r8

    %115
    re mi mi,
    la4 r8

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6>8
    <4>8 <_+> s
    <6 4> <5 _+> s
    s4.
    < 6 5->
    s
    <6 5->
    s
    <6>
    s
    <6 4>
    s
    <_->8 s <6 _->
    <7>4.
    s
    <6 _->8 <6 5> s
    <_+>4.
    s
    s
    s8 <6> <6>
    <6> <6\\> s
    s <6> s
    <6\\>4.
    <7 _+>
    s8 <6 _-> s
    <6> <6 4> <4\+ 2>
    <6>4.
    <6 _->8 <_+> s
    s4.
    s8 <_+> s
    s <6> <6>
    <6>4.
    <6>4 <6>8
    <6 _+>4 <6>8
    <6>4 <6>8
    <_+>4.
    s
    <7 _->
    s4.*3
    <6 _->8 <6> s
    s4.
    s
    <4>8 <3> s
    <4> <5 3> s
    <6 5->4.
    s
    <6 5->
    s4.*3
    <4>8 <3> s
    <7->4.
    s
    <_+>
    <7 _+>
    s8 <6> <_->
    <4>8 <_+> <6>
    s4.
    <6>8 s <6>
    s4.
    <6>
    <6>8 s <6>
    <7> <6> s
    <4\+ 2> s <6>
    <_!> <_+> s
    <6> <6> s
    <6>4.
    <6 _!>8 <_+> s
    s4 <6>8
    <4> <_+> s
    <6 4> <5 3> s
    s4.
    <6 5->
    s
    <6 5->
    s
    <6>
    s
    <4 2>
    <7 _+>
    <_->
    <7 _+>
    s
    <6 _->8 <_+> s
    <6 > <6> <4\+ 2>
    s4.*8
    <7->4.
    <6 4->
    <7->
    <6 4->4 <5 3>8
    s4.*8
    <_+>4.
    <_->
    <_+>4 <6>8
    s4.
    <6>8 <_+> s
    <6> <6 4> <4\+ 2>
    <6>4.
    <6>8 <_+> s

}


forma = {

    \time 3/8
    \key do\major
    \tempo 4 = 50
    s4.*89
    s8\fermopz \bar"||"\break s4
    s4.*26
    \bar "||"
    \mark\markup\smaller"D.C."

}

IflI = {
    \notypeset
    <<\IflIn \forma>>

}

IflII = {
    <<\IflIIn \forma>>

}

Ivoce = {
    \new Voice = "sofferte"
    <<\Ivocen \forma>>
}



Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}



IIvocen = \relative do'' {

    \autoBeamOff

    r4 r8 sol do do do si
    do do r do mi do do re
    sib8. sib16 sib8 la la la r4\mbreak

    %4
    mi'8 mi16 mi dod8 la re4 r16 re re mi
    do4 do8 mi do8. do16 do8 si
    sol sol r si\mbreak re re re fa

    %7
    fa si, r4 re8 re16 re re8 mi
    dod4 r16 dod dod re mi8 mi r4\mbreak
    la,8 la la la16 sib sol4 sol

    %10
    mi'8 mi16 mi mi8 mi dod8. dod16 dod8 re
    re re r re\mbreak si8. si16 si8 do
    la la do4 r8 mi16 mi do8 si16 la

    %13
    red4r16 mi red mi si8 si r4\mbreak
    \parenthesize r4 r8 dod4 dod16 dod lad8 lad16 dod
    dod?8 fad, r fad lad4 lad8 lad16 dod

    %16
    sid8 sid r16 sid sid red\mbreak red8 sold, r4
    sold8 sold sold sold16 la la4 la
    r8 red16 red sid8 sid16 sold dod4 dod

    %19
    r dod8 re\mbreak re4. re16 do
    do8 do r si si16[lad] si8 fad fad
    r2 r8 si mi4

    %22
    r mi8 mi16 fa re4 re\mbreak
    r re8 re16 re si8 si r si
    re re fa mi do do r4

    %25
    la8 la16 la la8 sib\mbreak sib sib r sib
    sol sol sol sol dod dod r16 dod dod la
    re8 re mib2 r8 do

    %28
    do4 do8 si!\mbreak si si r re
    re sol, sol la si \parenthesize si r16 si si do
    re8 re r re re re fa mi\mbreak

    %31
    do do r do16 do sib4. sib16 la
    fa8 fa r16 la la la la8 la r fa
    fa fa fa sol lad4 lad\mbreak

    %34
    r8 la! la sol fad fad r la
    la la do sib sib sib r mib
    dod8. re16 la8. la16 r2

}

IItesto = \lyricmode {

    Sovvien - ti_i -- dolo _ mio _
    che prima _ che il mio co -- re_amar -- ti_ar -- disse _
    volle _ saper _ da te se quella _  fiamma _
    offenderti _ _ _  po -- trebbe? _
    Sov -- vienti _  che tu all' ora
    troppo _ beni - gna_ai -- me!
    mi promettesti _ _ _
    colla _ gloria _ d’amarti _ _
    il sospirato _ _ _ ben de la spe -- ranza? _
    Di poi cangiasti _ _ idea, _
    ma non perciò _ il mio cor cangiò _ pensiero. _ _
    O quante _ volte _ o quante _
    con ire _ con ri -- gori _ e con dis -- prezzi _
    dura _ prova _  facesti _ _
    di mia fede_e _ costanza _ _
    gloria ogn -- ora e trofeo _ _  de l’amor _ mio. _
    Ma che? Troppo _ tu sai _
    quan -- to_in -- nocente _ _ sof -- fersi_i _ tuoi gastighi _ _
    senza _ che_un’ eco _  sola _
    mi uscisse _ _  mai dal seno a quere - larti. _
    Deh! dol -- cissima _  I -- rene _
    poi che l’ar -- dente _  fiamma _ ond’io _ di -- vampo _
    da te permessa _ _ crebbe _
    te benigna_a _ _ me trovi _
    e quella _ speme _
    che fu per te cru -- dele _
    il mio martoro _ _ sia
    ancor per te pietosa _ _ il mio ri -- storo. _

}

IIbcn = \relative do {

    mi1~
    mi
    re2 dod~\mbreak

    %4
    dod fad,~
    fad1
    sol2~\mbreak sol

    %7
    fa'~fa
    mi dod~\mbreak
    dod1~

    %10
    dod2 sol
    fa\mbreak mi
    la1~

    %13
    la2 si4 mi,\mbreak
    lad1~
    lad2 mi'

    %16
    red \mbreak sid2~
    sid1~
    sid2 mi~

    %19
    mi\mbreak mid
    mi!2. fad4
    si,2 sold~

    %22
    sold1~\mbreak
    sold~
    sold2 la~

    %25
    la\mbreak dod~
    dod sol'
    fa4 fad2.~

    %28
    fad2\mbreak fa~
    fa1
    si,\mbreak

    %31
    do1
    fa2 mib~
    mib re~\mbreak

    %34
    re do~
    do sol~
    sol4 la re2

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <6>1
    s
    <6- 4>2 <6>
    s <6>
    s1
    s
    <6 4 2>
    <6\\>2 <6>
    s1
    s2 <4\+ 2>
    <6> <_+>
    s1
    <4\+ 2>2 <_+>4 s
    <6\\ _+>1
    s2 <4\+ 2>
    s <6\\ 4>
    s1
    s2 <6\\ _+>
    s <7->
    <6\\ 4>4 <5 3> s4 <_+>
    s2 <6>
    s1*4
    s2 <4\+ 2>
    <6>4 <7->2.
    s2 <6 4!>
    s1
    <6>
    s
    s2 <4 2>
    s <5->
    s <4\+ 2>
    s <_->
    s4 <_+>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 65
    s1*36
    \bar "||"

}

IIvoce = {

    \notypeset
    \new Voice = "idolo"
    <<\IIvocen \forma>>

}



IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}




IIIflIn = \relative do'' {

    re8[fa mi8. re32 dod]
    re4\staccatissimo sib\p
    la8 sib sol4

    %4
    re'8\f[fa mi8. re32 dod]
    re4\staccatissimo sib'
    la\p\staccatissimo sold

    %7
    la8(la,) sol'4\f~
    sol8 la, fa'4~
    fa8 la, mi'4~\mbreak

    %10
    mi8 la, re4
    re8 dod r4
    sib'8\p[(la sold la)]

    %13
    sol![(fa mi fa)]
    mib[(re dod re)]
    dod16 la\f si? dod re mi fa sol

    %16
    la sib la sib la sib la sib
    la la,\p si! dod re mi fa sol
    la sib la sib\mbreak la\f sib la si32 dod

    %19
    re8 re, r sol\f
    fa4 mi
    re r

    %22
    R2
    r4 sib\staccatissimo\p
    la8 sib sol4\tr

    %25
    re'8\f[fa mi8. re32 dod]
    re4 r\mbreak
    r sib'\staccatissimo\p

    %28
    la\staccatissimo sold
    la8 la, sol'4~
    sol8 la, fa'4\f ~

    %31
    fa8 la, mi'4~
    mi8 la, re4~
    re dod\fermata

    %34
    r8 la16 si dod re mi fa
    sol la sol  la sol la fa\parenthesize sol\mbreak
    la8 re,r fa

    %37
    sol4\staccatissimo mi\tr
    re r
    r sib\p

    %40
    la8 sib? sol4
    re'8[fa mi8. re32 dod]
    re4 r

    %43
    r re\staccatissimo\p \mbreak
    re\staccatissimo re
    dod r

    %46
    la'2~
    la~
    la\p~

    %49
    la8 la,16 si dod re mi fa
    sol la sol la sol la fa sol
    la4 r\mbreak

    %52
    R2
    r16 sol,\p la si do re mi fa
    sol la sol la sol la sol la

    %55
    sol sol, la si do re mi fa
    sol la sol la sol la sol la
    sol8[fa mi re]

    %58
    mi[fa mi re]\mbreak
    mi4 r
    R2*2

    %62
    do8\f[mi  re8. do32 si]
    do4 la\staccatissimo\p
    sol\staccatissimo  fa

    %65
    do'8\f[mi re8. do32 si]
    do4 la'\staccatissimo\p
    sol fad

    %68
    sol16 sol,\f la si do re mi fa?
    sol la sol la sol la sol la
    sol8 la16 si do8 fa,

    %71
    mi4 re
    do r
    R2*4\mbreak

    %77
    la'8\f la, sol'4~
    sol8(la,) fa'4
    fa8(mi) r fad\p

    %80
    sol[(la sol fad)]
    sol[(la sol fad)]
    sol4 r

    %83
    R2*7
    sib8\p[(la sold la)]
    sol![(fa mi fa)]\mbreak

    %92
    mib[(re dod re)]
    dod16 la\f si? dod re mi fa sol
    la\p sib la sib la sib la sib

    %95
    la la,\p si! dod re mi fa sol
    la sib la sib la sib la sib
    la2~

    %98
    la8[sib(la sold)]\mbreak
    la2~
    la8[ sib(la sold)]

    %101
    la re, re4
    dod8 re4 mi8~
    mi fa4 sol8

    %104
    dod, re~re4
    dod2
    R2^\markup\center-align {\musicglyph #"scripts.ufermata"}\mbreak

    %107
    R2*4
    re8\f[fa mi8. re32 dod]
    re4\staccatissimo sib\p

    %113
    la8 sib sol4
    re'8\f[fa mi8. re32 dod]
    re4\staccatissimo sib'\staccatissimo\p

    %116
    la\staccatissimo sold
    la8\f(la,) sol'4~
    sol8 la, fa'4~

    %119
    fa8 la, mi'4~
    mi8 la, re4
    \once\slurDashed re8 (dod) r4

    %122
    sib'8\p[(la sold la)]
    sol![(fa mi fa)]\mbreak
    \once\slurDashed mib?[(re dod re)]

    %125
    red16 la\f si? dod re? mi fa sol
    la sib la sib la sib la sib
    la la, si? dod re mi fa sol

    %128
    la\p sib la sib la sib la si32 dod
    re8 re, r sol\f
    fa4 mi\mbreak

    %131
    re\fermopz r  %%%%%%% mettere doppia barra per dire fine
    R2
    r4 la\p

    %134
    sol\staccatissimo  fa
    do'8\f[mi re8. do32 si]
    do4 r

    %137
    r mib\p
    re dod
    la'8[re, mi8. re32 dod]\mbreak

    %140
    re4 r
    R2*11
    la'8 la, la'4~

    %153
    la8 si, sol'4~
    sol8[la, fa' re]
    \grace la'8 sold4\f r

    %156
    fa4.\p sol?8\mbreak
    \grace sol8 mi4. fa8
    \grace mi8 re4.\tr  mi8

    %159
    do4 r
    R2*6

}


IIIflIIn = \relative do'' {

    re8[fa mi8. re32 dod]
    re4\staccatissimo sol,\p
    fa mi

    %4
    re'8\f[fa mi8. re32 dod]
    re4\tr re\staccatissimo
    re re

    %7
    dod r8 mi\f
    mi(re) r re
    re(dod) r sol\mbreak

    %10
    sol(fa) r fa
    fa mi r4\slurDashed
    sol'8\p[(fa mi fa)]

    %13
    mib[(re dod re)]
    do! [(sib la sib)]\slurSolid
    la si!16\f dod re mi fa sol

    %16
    fa sol fa sol fa sol fa sol
    fa la,\p si dod re mi fa sol
    fa sol fa sol \mbreak fa\f sol fa sol

    %19
    fa4 r8 re\f
    re4 dod
    re r

    %22
    R2
    r4 sol,\p
    fa\staccatissimo mi

    %25
    re'8\f[fa mi8. re32 dod]
    re4 r\mbreak
    r re\p

    %28
    re re
    dod r
    la'2\f~

    %31
    la~
    la~
    la_\fermata

    %34
    r4 la,16 si dod re
    mi fa mi fa mi fa re mi
    fa4 r8 re

    %37
    mi4\staccatissimo dod
    re r
    r sol,\p

    %40
    fa\staccatissimo mi
    re'8[fa mi8. re32 dod]
    re4 r

    %43
    r sib'\p\mbreak
    la sold
    la8 la, sol'?4~

    %46
    sol8 la, fa'4~
    fa8 la, mi'4~
    mi8\p la, re4

    %49
    re8 dod la16 si dod re
    mi fa mi fa mi fa re mi
    fa4 r\mbreak

    %52
    R2
    r16 sol,\p la si do re mi fa
    mi fa mi fa mi fa mi fa

    %55
    mi sol, la si do re mi fa
    mi fa mi fa mi fa mi fa
    mi8[re do si]

    %58
    do[re do si]\mbreak
    do4 r
    R2*2

    %62
    do8\f [mi  re8. do32 si]
    do4 fa,\p\staccatissimo
    mi re

    %65
    do'8\f [mi  re8. do32 si]
    do4 do\p
    do do\staccatissimo

    %68
    si16 sol\f la si do re mi fa\mbreak
    mi fa mi fa mi fa mi fa
    mi4 r8 do

    %71
    do4 si
    do r
    R2*4\mbreak

    %77
    r4 r8 mi\f
    mi(re) r re
    \once\slurDashed re (dod) r do

    %80
    sib[(do sib la)]
    sib[(do sib la)]
    sib?4 r

    %83
    R2*7
    \once\slurDashed sol'8\p[(fa mi fa)]
    mib[(re do re)]\mbreak

    %92
    do![(sib la sib)]
    la8 si?16\f dod re mi re mi
    fa\p sol fa sol fa sol fa sol

    %95
    fa la,\p si dod re mi fa sol
    fa sol fa sol fa sol fa sol
    fa8 r r4

    %98
    R2*4
    r4 r8 dod~
    dod re4 mi8~

    %104
    mi fa~fa4
    mi2
    R^\markup\center-align {\musicglyph #"scripts.ufermata"}\mbreak

    %107
    R2*4
    re8\f[fa mi8. re32 dod]
    re4\staccatissimo sol,\p

    %113
    fa mi
    re'8\f[fa mi8. re32 dod]
    re4\staccatissimo  re\p

    %116
    re\staccatissimo re\staccatissimo
    dod\f r8 mi
    mi(re) r re

    %119
    re(dod) r sol\mbreak
    sol(fa) r fa
    fa (mi) r4

    %122
    sol'8\p[(fa mi fa)]\slurDashed
    mib[(re dod re)]
    do![(sib la sib)]\slurSolid

    %125
    la si!16\f dod re mi fa sol
    fa sol fa sol fa sol fa sol
    fa la, si dod re mi fa sol

    %128
    fa\p sol fa sol \mbreak fa sol fa sol
    fa4 r8 re\f
    re4 dod

    %131
    re\fermopz r
    R2
    r4 fa,\p

    %134
    mi re
    do'8\f mi re8. do32 si]
    do4 r

    %137
    r sol\p
    fa mi
    la'8[re, mi8. re32 dod]\mbreak

    %140
    re4 r
    R2*14
    mi8\f mi, mi'4~

    %156
    mi8 mi, re'4~\mbreak
    re8 mi, do'4\p ~
    do8 mi, si'4~

    %159
    si8 mi, la4
    R2*6

}

IIIvocen = \relative do'' {

    \autoBeamOff

    R2*21
    re8 fa mi8. re32 [dod]
    re4\staccatissimo sib^\p

    %24
    la8 sib sol4
    fa r
    re'8^\f fa mi8. [re32 dod]\mbreak

    %27
    re4 sib^\p
    la sold
    la r8 mi'

    %30
    mi[(re) ]r re
    re dod r sol
    sol[(fa)] r fa

    %33
    fa4 mi\fermata
    R2*4
    re'8 fa mi8. re32[dod]

    %39
    re4\staccatissimo sib^\p
    la8 sib sol4
    fa r

    %42
    re'8 fa mi8.[re32 dod]
    re4\staccatissimo sib\mbreak
    la sold

    %45
    la r8 mi'
    mi[(re)] r re
    re dod r sol^\p

    %48
    sol[fa] r fa
    fa mi4 r8
    R2

    %51
    r4 fa'8 fa\mbreak
    fa mi16[re] do8 si
    do4. sol'8

    %54
    do,4. sol'8
    do,2~
    do~

    %57
    do8[re do si]
    do[re do si]\mbreak
    do16  [mi re fa] mi [sol fa la]

    %60
    sol8.[fa32 mi] re8[do]
    do4(re)
    do r

    %63
    R2*9
    do16[(re mi fa] sol8) do,
    do4(si8) r

    %74
    sib[(mi sol)] sib,
    sib?4(la8) dod
    re mi fa4\mbreak

    %77
    mi r
    R2
    r4 la,8 la

    %80
    sib[(do sib)] la
    sib[(do sib)] la
    sib16[la sol fad] sol[re' dod re]

    %83
    mi[re dod si!] la[mi' re mi]\mbreak
    fa[mi re dod] re[fa mi re]
    dod8 la r4

    %86
    mib' re
    la8 sol' fa mi16[re]
    dod2

    %89
    re4 r
    R2*4
    la4 la

    %95
    la2~
    la~
    la8[mib' re dod]

    %98
    re2~\mbreak
    re8[mib re dod]
    re2~

    %101
    re8[sib la sold]
    la si!4 dod8~
    dod re4 mi8~

    %104
    mi fa4~fa16 mi32[re]
    mi8[la] la,4\tr
    R2^\markup\center-align {\musicglyph #"scripts.ufermata"}\mbreak

    %107
    mib'8 [re] dod[re]
    sib[la sold la]~
    la sol' fa mi16[re]

    %110
    dod2
    re4 r
    R2*19

    %131
    R2^\markup\center-align {\musicglyph #"scripts.ufermata"}\mbreak
    do8 mi re8.[do32 si]
    do4\staccatissimo la\staccatissimo

    %134
    sol8 la fa4\tr
    mi r
    sol'8 do, re8.[(do32 si)]

    %137
    do4 mib
    re(dod)
    re r\mbreak

    %140
    r4 re8 mi16[fa]
    sol8 do, do4~
    do8 sol' do,4~

    %143
    do16[re mi fa] sol8[do,]
    sib[la] sib4
    r re8 si!

    %146
    sold4 la
    si4. dod8\mbreak
    re[dod] re4~

    %149
    re8 fa[mi] red
    mi re!16[do] si8 la
    sold2

    %152
    la4 r
    R2*3
    fa'4. sol8\mbreak

    %157
    \grace fa mi4. fa8
    \grace mi re4. mi8
    do16[si la sold] la[si do re]

    %160
    mi8 fa4~fa16 mi32[re]
    mi16[re do si] la[si do re]
    mi8 fa4~fa16 mi32[re]

    %163
    mi8[la, si fad]
    sold2
    la4 r

}

IIItesto = \lyricmode {

    Non sprezzar _ più no un fido _ core _
    do -- ve_a -- mo -- re
    che costan - te a te lo rende, _ a te lo rende, _
    non sprezzar _ più no un fido _ core _
    do -- ve_a -- mo -- re
    che costan - te a te lo rende _ a te lo rende _
    cau -- to_ac -- cende _ i più dolci _ de suoi stra - - - - - - li.
    Non sprezzar _ non sprezzar _ più fido _ co -- re
    do -- ve_a -- mo -- re cau -- to_ac -- cen - - - - - - de
    i più dolci _ de suoi stra -- li, i più dol- - - - - - - - - - - ci
    i più dol -- ci de suoi stra -- li.
    Bel sere - no e lieta _ calma _
    torni_a _ l’al -- ma a l'al -- ma
    e non men che fra_i tor -- men  - - ti
    sal -- di_o -- gni_ora _ fra_i con -- tenti _
    fe -- de_e_a -- more_in _ me ve -- dra -- i
    fe -- de_e_a -- more_in _ me ve -- dra -  - - - - - - - - - - i.

}

IIIbcn = \relative do {

    re'8 re, sol la
    re,4 r
    R2

    %4
    re8 re, sol la
    re,4 r
    R2

    %7
    \clef tenor r8 la''16\f si dod si dod la
    re8 re,16 mi fa mi fa re
    \clef bass la'8 la,16 si dod si dod la\mbreak

    %10
    re8 re,16 mi fa8 sol
    la4 r
    R2*3

    %15
    la'8^\f[sol fa mi]
    re re, re' re,
    re'4 r

    %18
    re8\p re,\mbreak re' re,
    re'4 r8 sol\f
    la4 la,

    %21
    re r
    re'8 re, sol8. la16
    re,4 r

    %24
    R2
    re'8 re, sol la
    re, re, sol la\mbreak

    %27
    re,4 r
    R2
    \clef tenor r8 la''16\f si dod si dod la

    %30
    re8 re,16 mi fa mi fa re
    \clef bass la'8 la,16 si dod^\p si dod la
    re8 re,16 mi fa8 sol

    %33
    la2\fermata
    la'4 r8 fa
    mi[mi mi mi]\mbreak

    %36
    re4 r8 sib'
    sol4 la
    re,8 re, sol la

    %39
    re,4 r
    R2
    re''8\f [re, sol la]

    %42
    re, re, sol la
    re,4 r\mbreak
    R2

    %45
    \clef tenor r8 la''16 si dod si dod la
    re8 re,16 mi fa mi fa re
    \clef bass la'8 la,16 si dod si dod la

    %48
    re8 re,16 mi fa8 sol
    la4 r8 fa'
    mi[mi mi mi]

    %51
    re4 r8 mi\mbreak
    fa4 r8 re
    mi[fa mi re]

    %54
    mi4 r8 re
    mi[fa mi re]
    mi4 r

    %57
    R2*2\mbreak
    do4 r8 re
    mi4 fa

    %61
    sol sol,
    do'8[do, fa sol]
    do,4 r

    %64
    R2
    do'8[do, fa sol]
    do,4 r

    %67
    R2
    sol'8[fa mi re]\mbreak
    do do, do' do,

    %70
    do'4 r8 fa
    sol4 sol,
    do r8 fa

    %73
    sol[la sol fa]
    mi4 r8 do
    fa[sol fa mi]

    %76
    re4 sold,\mbreak
    la'8 la,16 si dod si dod la
    re8 re,16 mi fa8 sol

    %79
    la4 r8 re
    sol,4 r8 re'
    sol,4 r8 re'

    %82
    sol la sib sib,
    la si? dod la\mbreak
    re mi fa sol

    %85
    la4 r
    sol fa
    mi re8 sol

    %88
    la4 la,
    re r
    R2*3

    %93
    la'8 sol fa mi
    re4 r8 mi
    fa[sol fa mi]

    %96
    re4 re,
    re' r
    R2*3

    %101
    re4 sib'
    la  la,
    la' la,

    %104
    la' re,
    la2
    R^\markup\center-align {\musicglyph #"scripts.ufermata"}\mbreak

    %107
    sol'4 fa
    mi re
    dod re8 sol

    %110
    la4 la,
    re'8[re, sol la]
    re,4 r

    %113
    R2
    re8[re, sol la]\mbreak
    re,4 r

    %116
    R2
    \clef tenor r8 la''16\f si dod si dod la
    re8 re,16 mi fa mi fa re

    %119
    \clef bass la'8 la,16 si dod\p si dod la
    re8 re,16 mi fa8 sol
    la4 r

    %122
    R2*3
    la'8[sol fa mi]
    re re, re' re,

    %127
    re'4 r
    re8 re, re' re,
    re'4 r8 sol

    %130
    la4 la,\mbreak
    \parenthesize re\fermopz r
    mi fa8 sol

    %133
    do,4 r
    R2
    do'8 do, fa sol

    %136
    do[mi, fa sol]
    do,4 r
    R2

    %139
    re'8[fa, sol la]\mbreak
    re,4 r8 re
    mi[fa mi re]

    %142
    mi[fa mi re]
    mi4 r8 do
    re do re do

    %145
    re4 fa
    r8 mi[re do]
    si4 la\mbreak

    %148
    sold4. la8
    si4 r8 si
    do4 re

    %151
    mi mi,
    la8 la'16 si do si do la
    mi'8 mi,16 re dod8 la

    %154
    re, re'16 mi fa mi fa re
    mi4 r
    r8 mi, mi4\mbreak

    %157
    r8 mi mi4
    r8 mi mi4
    la r8 si

    %160
    do[re do si]
    do4 r8 si
    do[re do si]

    %163
    do4 re
    mi mi,
    la4 r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <6 _->8 <_+>
    s2
    s
    s4 <6 _->8 <_+>
    s2
    s
    <_+>4 <6>
    s <6>
    <6 4>8 <5 _+> <6>4
    s <6>
    <4>8 <_+> s4
    s2*3
    \bassFigureExtendersOn< _+>8 <_+> <6> <6>\bassFigureExtendersOff
    s2*4
    <6 4>4 <5 _+>
    s2 s4 <6 _->8. <_+>16
    s2
    s
    s4 <6 _->8 <_+>
    s4 <6 _->8 <_+>   %% bar 25 p 6 2do sistema prima battuta
    s2*2
    <_+>4 <6>
    s2
    <4 2>8 <_+> <6>4
    <4>8 <3> <6>4
    <6 4>2
    <_+>
    <6\\>
    s
    <6 _->4 <_+>
    s2*3
    s4 <6 _->8 <_+>
    s4 <6 4>
    s2*2
    <_+>4 <6>
    s <6>
    <4 2>8 <_+> <6>4
    s <6>
    <_+>4 s8 <6>
    <6\\>2
    s
    s4 s8 <6>
    <6>4 <6>8 <6>
    <6>4 s8 <6>
    <6>4 <6>
    <6>2
    s2*2
    s4 s8 <6>
    <6>2
    <6 4>4 <5 3>
    s <6>
    s2*2
    s4 <6>
    s2*2
    s4 <6>
    s2*2
    <6 4>4 <5 3>
    s2*2
    <6 5->4 s8 <7->
    s4 s8 <6\\>
    s4 <7>
    s8 <_+> <6>4
    <4>8 <3> <6>4
    s s8 <_+>
    <_->4 s8 <_+>
    <_->4 s8 <_+>
    <_->4 <6>
    <_+> <6>
    s <6>
    <_+> s
    <6-> <6>
    <6->2
    <_+>
    s2*4
    <_+>4 <6>
    s2
    <6>4 <6>
    s2*5
    s4 <6>
    <_+>2
    <_+>
    <_+>
    <_+>
    s
    <6->4 <6>
    s <4\+ 2>
    <6>2
    <_+>
    s4 <6>8 <_+>
    s2*2
    s4 <6>
    s2*2
    s4 <_+>

}


forma = {

    \time 2/4
    \key do\major
    \tempo 2 = 60
    s2*131
    \bar "||"\break
    s2*34
    \bar "|."
    \mark\markup\smaller "D.C."

}

IIIflI = {
    %\notypeset
    <<\IIIflIn \forma>>

}

IIIflII = {
    <<\IIIflIIn \forma>>

}

IIIvoce = {
    \new Voice = "non"
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

    \markup \huge {"[1.] Lento"}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Traversiere [I]"}
                \set Staff.midiInstrument = #"flute"
                \IflI \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Traversiere [II]"}
                \set Staff.midiInstrument = #"flute"
                \IflII \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \time 3/8\override Staff.TimeSignature.style = #'numbered  s8^\markup\center-align"Soprano"}
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \Ivoce \global
                \new Lyrics \lyricsto "sofferte" \Itesto
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

}

\bookpart {

    \paper {

        systems-per-page = #6

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
                \new Lyrics \lyricsto "idolo" \IItesto
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
                \override StaffGrouper.staff-staff-spacing.padding = #2
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

    \markup \huge {"[3.] Alleg[ro]"}

    \score {

        \new ChoirStaff	<<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \IIIflI \global
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \IIIflII \global
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \time 2/4 \override Staff.TimeSignature.style = #'numbered  }
                \clef violin
                \set Staff.midiInstrument = #"voice oohs"
                \IIIvoce \global
                \new Lyrics \lyricsto "non" \IIItesto
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

}
