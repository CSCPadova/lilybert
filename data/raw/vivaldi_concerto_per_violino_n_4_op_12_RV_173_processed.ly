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

Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine\con
}

Ivln = \relative do'' {

    <<{do4 si}\\{\stemUp \override Stem.transparent = ##t mi, re}\\{\stemDown sol, sol}>> r
    <<{re'' do}\\{\stemUp \override Stem.transparent = ##t fa, mi}\\{\stemDown sol, sol}>> r
    <<{sol''}\\{\stemUp \override Stem.transparent = ##t do,}\\{\stemDown mi,}>> r16 do'(re32 mi fa sol) la8\noBeam r

    %4
    mi,8.[do'16 fa,8. do'16 sol8. si16]
    do2 r4
    <<{do4 si}\\{\stemUp \override Stem.transparent = ##t mi, re}\\{\stemDown sol, sol}>> r

    %7
    <<{re'' do}\\{\stemUp \override Stem.transparent = ##t fa, mi}\\{\stemDown sol, sol}>> r
    <<{sol''}\\{\stemUp \override Stem.transparent = ##t do,}\\{\stemDown mi,}>> r16 do'(re32 mi fa sol) la8\noBeam r
    mi,8.[do'16 fa,8. do'16 sol8. si16]

    %10
    do2 r4
    do8\f sol'16 \parentSlur(fa mi re do si) do8\staccatissimo(do\staccatissimo do\staccatissimo ) sol
    do\staccatissimo(do\staccatissimo do\staccatissimo) sol do16. re32 mi16. fa32 sol8 do,

    %13
    la' sol~sol16 mi(re do)\mbreak la'8 sol~sol16 re(do si)
    la'8 sol~sol16 do,(si la) la'8 sol~sol16 si,(la sol)
    fa8\staccatissimo \parentSlur (fa\staccatissimo fa\staccatissimo) fa' fa\tr mi r sol\pp

    %16
    mib re16. do32 si8 do sol\staccatissimo sol\staccatissimo sol\staccatissimo sol'
    \tuplet 3/2 { la16(sol fad) } fa8\noBeam \tuplet 3/2 { sol16(fa mi) } mib8\noBeam \mbreak re8 sol, sol[sol']
    mi?16. sol32 do,8 sib16. sol'32 sib,8 la fa fa la'

    %19
    fad16. la32 re,8 do16. la'32 do,8 si? sol sol[re']
    \tuplet 3/2 { mi16( fa? sol) } sol8\noBeam \tuplet 3/2 { mi16( fa sol) } sol8\noBeam \tuplet 3/2 { mi16( fa sol) } sol8\noBeam \tuplet 3/2 { mi16( fa sol) } sol8\noBeam\mbreak
    do\f si16 la sol fa mi re do8 si16 la sol fa mi re

    %22
    do4 r8 sol''\solo \tuplet 3/2 { la16(sol fa) } sol8\noBeam \tuplet 3/2 { fa16(mi re) } mi8\noBeam
    \tuplet 3/2 { re16(do si) } do4 sol'8 \tuplet 3/2 { la16(sol fa) } sol8\noBeam \tuplet 3/2 { fa16(mi re) } mi8\noBeam
    \tuplet 3/2 { re16(do si) } do4 sol'8 \mbreak \tuplet 3/2 { do16(si do re[do si)] } \tuplet 3/2 { do16(si do re[do si)] }

    %25
    do8 sol4 do8 si16(do re do si la sol fa)
    fa8\tr mi r mi \tuplet 3/2 { re16 (si do re[mi fad] } sol8) si,
    \tuplet 3/2 { do16 (la si do[re mi] } fad8) la,\mbreak \tuplet 3/2 { si16(la si do[si la)] si16(la si do[si la)] }

    %28
    si8 sol' \tuplet 3/2 { si16(la sol) la[(sol fad)] } sol8 mi \tuplet 3/2 { re16(do si) do[(si la)] }
    si8 sol' \tuplet 3/2 { si16(la sol) la[(sol fad)] } sol8\tu fad16( mi re do si la)\mbreak
    si8 sol\staccatissimo(sol\staccatissimo sol\staccatissimo) la16. si32 do16. re32 mi8 do

    %31
    si sol sol[re'] si16. do32 re16. mi32 fa8 re
    do la r mi'\pp do si16. la32 sold8  la
    mi\staccatissimo(mi\staccatissimo mi\staccatissimo) mi' do si16. la32 sold8 la\mbreak

    %34
    mi\staccatissimo(mi\staccatissimo mi\staccatissimo) mi' \tuplet 3/2 { red16(dod? si) } re8\noBeam \tuplet 3/2 { dod!16(si la) } do8\noBeam
    si mi, mi mi' do16. mi32 la,8 sol?16. mi'32 sol,8
    fa re re fa' re16. fa32 si,8 la16. fa'32 la,8

    %37
    sold mi r mi'\mbreak \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam
    \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam la\f sol16 fa mi re do si
    la8 sol16 fa mi re do si la4 r8 la'\solo\mbreak

    %40
    \tuplet 3/2 { do16(la) do mi[(do) mi] la\parentSlur(mi) la do[\parentSlur(la) do] } si8 mi, r mi,
    \tuplet 3/2 { sold16 mi sold si[sold si] re si re si'[mi, re] } do8 la r mi'
    sib'16(sol fa) mi sib'(sol fa )mi\mbreak fa(re) re8\tr\noBeam  fa16(re) re8\tr\noBeam

    %43
    la'16(fa mi) re la'(fa mi) re mi(do) do8\tr\noBeam mi16(do) do8\tr\noBeam
    sol'16(mi re) do sol'(mi re) do re(sib) sib8\tr\noBeam re16(sib) sib8\tr\noBeam
    sol'16 sib32 la sol16 fa mi sol32 fa mi16 re dod mi32 re dod16 si? la mi32 re dod16  si

    %46
    la4 r8 mi'' \tuplet 3/2 { fa16 re fa sol[mi sol] la fa la sib[sol sib] }
    dod,4~\tuplet 3/2 { dod16 mi(re dod[si? la)] }\mbreak sol'4~\tuplet 3/2 { sol16 sib(la sol[fa mi)] }
    dod'4(re8) fa, \tuplet 3/2 {
        la,16 re mi fa[mi re] la re mi fa[mi re]

        %49
        la re mi fa[mi re] }
    mi4\tr re8 la'16\f(sol fa mi re dod)
    re8\staccatissimo(re\staccatissimo re\staccatissimo la\staccatissimo) re8\staccatissimo(re\staccatissimo re\staccatissimo la\staccatissimo)\mbreak  %%%% fine seconda riga
    red8\staccatissimo(red\staccatissimo red\staccatissimo mi\staccatissimo) fad16. sol32 la16. si32 do8 la

    %52
    sol mi mi si' \tuplet 3/2 { lad16(sold fad) } la8\noBeam \tuplet 3/2 { sold16(fad mi) } sol8\noBeam
    fad8 si, si fad' \tuplet 3/2 { sol16\p(la si) } si8\noBeam \tuplet 3/2 { sol16(la si) } si8\noBeam
    \tuplet 3/2 { sol16(la si) } si8\noBeam \tuplet 3/2 { sol16(la si) } si8\noBeam\mbreak si16\f sol la fad sol mi fad red

    %55
    mi si\solo sol si mi, mi' sol mi fad red si red fad, fad' la fad
    sol si, sol si \once\stemUp mi, sol' si sol fad8 si, r4
    la'16 mi do mi la, la' do la\mbreak si sold mi sold si, si' re si

    %58
    do la mi la la, la' do la si8 mi, r4
    mi'8. re16\staccatissimo (do\staccatissimo si\staccatissimo la\staccatissimo sold\staccatissimo) sold4 la
    re8. do16\staccatissimo (si\staccatissimo la\staccatissimo sol?\staccatissimo fad\staccatissimo) fad4(sol)

    %61
    do8. si16\staccatissimo (la\staccatissimo sol\staccatissimo fa?\staccatissimo mi\staccatissimo) mi4 fa
    \tuplet 3/2 { fa16(sol la) re,[(mi fa)] si, (do re) re,[(mi fa)] } \once\stemUp sol,8 re''\f re re
    do16. re32 mi16. fa32 sol8 do, la' sol~sol16 mi re do

    %64
    la'8 sol~sol16 si, la sol fa8 fa fa fa'
    fa\tr mi r r16 sol\solo lab4 fa\mbreak
    sol16(mib re)  do sol'(mib re) do lab'4 fa\tr

    %67
    sol16(mib re) do sol'(mib re) do lab'(sol fa mib re8) do
    do\tr si r sol' si(lab16 sol fa mi? fa sol)
    lab(sol fa mi fa8) sol lab(sol16 fa mib re mib fa)\mbreak

    %70
    sol(fa mib re mib8) sol do,16(re mib fa sol8) do,
    lab'(sol4) fa8 mib16(do si do re mib fa sol)
    lab8(sol4) sol8 \tuplet 3/2 { fad16(mi? re) } fa8\noBeam \tuplet 3/2 { mi16(re do) } mib8\noBeam

    %73
    re sol,4 sol'8\p\mbreak \tuplet 3/2 { fad16 mi? re } fa8\noBeam \tuplet 3/2 { mi16 re do } mib8\noBeam
    re sol,4 sol'8 \tuplet 3/2 { la16(sol fa la[sol fa)] si(la sol si[la sol)] }
    do8 si16 la sol8 fa \tuplet 3/2 { mi16(re do mi[re do)] re(do si re[do si)] }

    %76
    \appoggiatura si8 do4. sol'8 \tuplet 3/2 { la16(sol fa la[sol fa)] si(la sol si[la sol)] }
    do8 si16 la sol8 fa \tuplet 3/2 { mi16(re do mi[re do)] re(do si re[do si)] }
    \appoggiatura si8 do4. sol'8 \tu  mi16. sol32 do,8 sib16. sol'32 sib,8\mbreak

    %79
    la fa fa la' fad16. la32 re,8 do16. la'32 do,8
    si? sol sol[re'] \tuplet 3/2 { mi16(fa sol) } sol8\noBeam  \tuplet 3/2 { mi16(fa sol) } sol8\noBeam
    \tuplet 3/2 { mi16(fa sol) } sol8\noBeam \tuplet 3/2 { mi16(fa sol) } sol8\noBeam do si16 la sol fa mi re\mbreak

    %82
    do4 r8 sol'\p \tuplet 3/2 { mi16(fa sol) } sol8\noBeam  \tuplet 3/2 { mi16(fa sol) } sol8\noBeam
    \tuplet 3/2 { mi16(fa sol) } sol8\noBeam \tuplet 3/2 { mi16(fa sol) } sol8\noBeam do,\f si16 la sol fa mi re
    do1\fermopz

}

IvlIn =  \relative do'' {

    <<{do4 si}\\{\stemUp \override Stem.transparent = ##t mi, re}\\{\stemDown sol, sol}>> r
    <<{re'' do}\\{\stemUp \override Stem.transparent = ##t fa, mi}\\{\stemDown sol, sol}>> r
    <<{sol''}\\{\stemUp \override Stem.transparent = ##t do,}\\{\stemDown mi,}>> r16 do'(re32 mi fa sol) la8\noBeam r

    %4
    mi,8.[do'16 fa,8. do'16 sol8. si16]
    do2 r4
    <<{do4 si}\\{\stemUp \override Stem.transparent = ##t mi, re}\\{\stemDown sol, sol}>> r

    %7
    <<{re'' do}\\{\stemUp \override Stem.transparent = ##t fa, mi}\\{\stemDown sol, sol}>> r
    <<{sol''}\\{\stemUp \override Stem.transparent = ##t do,}\\{\stemDown mi,}>> r16 do'(re32 mi fa sol) la8\noBeam r
    mi,8.[do'16 fa,8. do'16 sol8. si16]

    %10
    do2 r4
    do8\f sol'16 (fa mi re do si) do8\staccatissimo(do\staccatissimo do\staccatissimo ) sol
    do\staccatissimo(do\staccatissimo do\staccatissimo)sol do16. re32 mi16. fa32 sol8 do,

    %13
    la' sol~sol16 mi(re do)\mbreak la'8 sol~sol16 re(do si)
    la'8 sol~sol16 do,(si la) la'8 sol~sol16 si,(la sol)
    fa8\staccatissimo (fa\staccatissimo fa\staccatissimo) fa' fa\tr mi r sol\pp

    %16
    mib re16. do32 si8 do sol\staccatissimo sol\staccatissimo sol\staccatissimo sol'
    \tuplet 3/2 { la16(sol fad) } fa8\noBeam \tuplet 3/2 { sol16(fa mi) } mib8\noBeam \mbreak re8 sol, sol[sol']
    mi?16. sol32 do,8 sib16. sol'32 sib,8 la fa fa la'

    %19
    fad16. la32 re,8 do16. la'32 do,8 si? sol sol[re']
    \tuplet 3/2 { mi16( fa? sol) } sol8\noBeam \tuplet 3/2 { mi16( fa sol) } sol8\noBeam \tuplet 3/2 { mi16( fa sol) } sol8\noBeam \tuplet 3/2 { mi16( fa sol) } sol8\noBeam\mbreak
    do\f si16 la sol fa mi re do8 si16 la sol fa mi re

    %22
    do4 r r2
    R1*6
    r2 sol''8\tu fad16( mi re do si la)\mbreak
    si8 sol\staccatissimo(sol\staccatissimo sol\staccatissimo) la16. si32 do16. re32 mi8 do

    %31
    si sol sol[re'] si16. do32 re16. mi32 fa8 re
    do la r mi'\pp do si16. la32 sold8  la
    mi\staccatissimo(mi\staccatissimo mi\staccatissimo) mi' do si16. la32 sold8 la\mbreak

    %34
    mi\staccatissimo\parentSlur (mi\staccatissimo mi\staccatissimo) mi' \tuplet 3/2 { red16(dod? si) } re8\noBeam \tuplet 3/2 { dod!16(si la) } do8\noBeam
    si mi, mi mi' do16. mi32 la,8 sol?16. mi'32 sol,8
    fa re re fa' re16. fa32 si,8 la16. fa'32 la,8

    %37
    sold mi r mi'\mbreak \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam
    \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam la\f sol16 fa mi re do si
    la8 sol16 fa mi re do si la4 r

    %40
    R1
    r2 r4 r8 la''\p
    sib sib sib sib la la la la

    %43
    la la la la sol sol sol sol
    sol sol sol sol fa fa fa fa\mbreak
    sol sol mi mi dod dod mi,[mi]

    %46
    mi mi mi[dod'] re dod fa re
    dod dod dod dod dod dod dod dod
    mi mi fa re dod re dod re

    %49
    dod re re dod\mbreak re la'16\f(sol fa mi re dod)
    re8\staccatissimo(re\staccatissimo re\staccatissimo la\staccatissimo) re8\staccatissimo(re\staccatissimo re\staccatissimo la\staccatissimo)\mbreak  %%%% fine seconda riga
    red8\staccatissimo(red\staccatissimo red\staccatissimo mi\staccatissimo) fad16. sol32 la16. si32 do8 la

    %52
    sol mi mi si' \tuplet 3/2 { lad16(sold fad) } la8\noBeam \tuplet 3/2 { sold16(fad mi) } sol8\noBeam
    fad8 si, si fad' \tuplet 3/2 { sol16\p(la si) } si8\noBeam \tuplet 3/2 { sol16(la si) } si8\noBeam
    \tuplet 3/2 { sol16(la si) } si8\noBeam \tuplet 3/2 { sol16(la si) } si8\noBeam\mbreak si16\f sol la fad sol mi fad red

    %55
    mi4 r r2
    R1*3
    mi8\p mi fa mi re re re re

    %60
    re re mi re do do do do
    do do re do si si si si
    si si si si si re\f re re\mbreak

    %63
    do16. re32 mi16. fa32 sol8 do, la' sol~sol16 mi re do
    la'8 sol~sol16 si, la sol fa8 fa fa fa'
    fa\tr mi r mib\p fa fa re re

    %66
    mib mib mib mib\mbreak fa fa re re
    mib mib mib mib do do re re
    re re re re do do do do

    %%69
    do do do do sib sib sib sib
    sib? sib sib sib\mbreak mib mib mib mib
    fa mib mib re mib mib mib mib

    %72
    fa re mib mib re re do do
    si si mib mib re re do do
    si si do do\mbreak do do re re

    %75
    mi? mi re re do do si si
    do mi mi mi do do re re
    mi mi re re do do si si

    %78
    sol4 r8 sol'\f\mbreak mi16. sol32 do,8 sib16. sol'32 sib,8\mbreak
    la fa fa la' fad16. la32 re,8 do16. la'32 do,8
    si?8 sol sol[re'] \tuplet 3/2 { mi16(fa sol) } sol8\noBeam  \tuplet 3/2 { mi16(fa sol) } sol8\noBeam

    %81
    \tuplet 3/2 { mi16(fa sol) } sol8\noBeam \tuplet 3/2 { mi16(fa sol) } sol8\noBeam do si16 la sol fa mi re\mbreak
    do4 r8 sol'\p \tuplet 3/2 { mi16(fa sol) } sol8\noBeam  \tuplet 3/2 { mi16(fa sol) } sol8\noBeam
    \tuplet 3/2 { mi16(fa sol) } sol8\noBeam \tuplet 3/2 { mi16(fa sol) } sol8\noBeam do,\f si16 la sol fa mi re

    %84
    do1\fermopz

}

IvlIIn = \relative do'' {

    <<{do4 si}\\{\stemUp \override Stem.transparent = ##t mi, re}\\{\stemDown sol, sol}>> r
    <<{re'' do}\\{\stemUp \override Stem.transparent = ##t fa, mi}\\{\stemDown sol, sol}>> r
    <<{sol''}\\{\stemUp \override Stem.transparent = ##t do,}\\{\stemDown mi,}>> r16 do'(re32 mi fa sol) la8\noBeam r

    %4
    mi,8.[do'16 fa,8. do'16 sol8. si16]
    do2 r4
    <<{do4 si}\\{\stemUp \override Stem.transparent = ##t mi, re}\\{\stemDown sol, sol}>> r

    %7
    <<{re'' do}\\{\stemUp \override Stem.transparent = ##t fa, mi}\\{\stemDown sol, sol}>> r
    <<{sol''}\\{\stemUp \override Stem.transparent = ##t do,}\\{\stemDown mi,}>> r16 do'(re32 mi fa sol) la8\noBeam r
    mi,8.[do'16 fa,8. do'16 sol8. si16]

    %10
    do2 r4
    mi4\f r8 sol, sol\staccatissimo(sol\staccatissimo sol\staccatissimo) mi
    sol\staccatissimo(sol\staccatissimo sol\staccatissimo) mi mi'16. fa32 sol16.  fa32  mi8 mi

    %13
    fa mi4 sol8 fa mi4 sol8\mbreak
    fa mi4 sol8 fa mi4 sol8
    si,\staccatissimo(si\staccatissimo si\staccatissimo) re re\tr do r sol'\pp

    %16
    mib re16. do32 si8 do sol\staccatissimo sol\staccatissimo sol\staccatissimo sol'
    \tuplet 3/2 { la16(sol fad) } fa8\noBeam \tuplet 3/2 { sol16(fa mi) } mib8\noBeam \mbreak re8 sol, sol[sol']
    sol4~sol16 fa mi re do4. la'8\mbreak

    %19
    la4~la16 sol fad mi re4. si8
    \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam
     do'\f si16 la sol fa mi re do8 si16 la sol fa mi re

    %22
    do4 r r2
    R1*6
    r2 si'4\tu r8 re

    %30
    re si\staccatissimo(si\staccatissimo si\staccatissimo) do16. re32 mi16. re32 do8 la
    sol re re[si'] re16. mi32 fa16. mi32 re8 si
    la mi r mi'\pp do si16. la32 sold8 la

    %33
    mi\staccatissimo(mi\staccatissimo mi\staccatissimo) mi' do si16. la32 sold8 la\mbreak
    mi\staccatissimo\parentSlur (mi\staccatissimo mi\staccatissimo) mi' \tuplet 3/2 { red16(dod? si) } re8\noBeam \tuplet 3/2 { dod!16(si la) } do8\noBeam
    si mi, mi mi' mi4~mi16 re do si

    %36
    la4. fa'8 fa4~fa16 mi re do
    si4. si8 \tuplet 3/2 { la16(si do) } do8\noBeam \tuplet 3/2 { la16(si do) } do8\noBeam
    \tuplet 3/2 { la16(si do) } do8\noBeam \tuplet 3/2 { la16(si do) } do8\noBeam\mbreak la'8\f sol16 fa mi re do si

    %39
    la8 sol16 fa mi re do si la4 r
    R1
    r2 r4 r8 mi''\p

    %42
    mi mi mi mi fa fa fa fa
    re re re re mi mi mi  mi
    do do do do re re re re\mbreak

    %45
    re re sib sib sol sol mi mi
    dod dod dod la' la sol re' sib
    mi, mi mi mi mi mi mi mi

    %48
    mi dod' la fa mi la mi la
    mi la la la fa4 r8 la\f
    la\staccatissimo(la\staccatissimo la\staccatissimo fa\staccatissimo) la\staccatissimo(la\staccatissimo la\staccatissimo fa\staccatissimo)

    %51
    fad'\staccatissimo(fad\staccatissimo fad\staccatissimo sol\staccatissimo) la16. si32 la16. sol32 fad8 fad
    mi si si si' \tuplet 3/2 {lad16(sold fad) } la8\noBeam \tuplet 3/2 { sold16(fad mi) } sol8\noBeam
    fad8 si, si red \tuplet 3/2 { mi16\p(fad sol) } sol8\noBeam \tuplet 3/2 { mi16(fad sol) } sol8\noBeam

    %54
    \tuplet 3/2 { mi16(fad sol) } sol8\noBeam \tuplet 3/2 { mi16(fad sol) } sol8\noBeam sol16\f mi fad red mi sol, la fad?
    mi4 r r2
    R1*3

    %59
    la8\p la re si la la la la
    sol sol do la sol sol sol sol
    fa fa si sol fa fa fa fa\mbreak

    %62
    re re re re re si'\f si si
    mi16. fa32 sol16. fa32 mi8 mi fa mi4 sol8
    fa mi4 sol8 si, si si re

    %65
    re\tr do r do\p do do si si
    sol sol do do do do do si
    sol sol do sol\mbreak lab lab la la

    %68
    sol sol si si sol sol sol do
    lab lab lab sol fa fa fa sib
    sol sol sol sol sol sol sol sol

    %71
    re sol sol si sol sol sol sol
    re re' do do\mbreak la? sol sol la
    si sol sol do la sol sol la

    %74
    si sol sol mi' la, la sol sol
    sol sol sol sol sol sol sol sol
    mi sol sol do la la sol sol

    %77
    sol sol sol sol\mbreak sol sol sol sol
    mi4 r8 sol'\f sol4~sol16 fa mi re
    do4 r8 la' la4~la16 sol fad mi

    %80
    re4. si8 \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam
    \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam \mbreak do' si16 la sol fa mi re
    do4 r8 mi\p \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam

    %83
    \tuplet 3/2 { do16(re mi) } mi8\noBeam \tuplet 3/2 { do16(re mi) } mi8\noBeam do\f si16 la sol fa mi re
    do1\fermata

}

Ivlan =  \relative do' {

    sol4 sol r
    si sol r
    mi' r do8 r

    %4
    mi r fa r sol r
    mi2 r4
    sol,\p sol r

    %7
    si sol r
    mi' r do8 r
    mi r fa r sol r

    %10
    mi2 r4
    sol4\f r8 sol mi mi mi mi
    mi mi mi mi sol sol sol sol

    %13
    r mi' mi[mi,] r re' re[re,]
    r do' do[do,]\mbreak r si' si[si,]
    si4. si8 sol4 r8 re'\pp

    %16
    sol, la' re,[mib] re do \once\stemUp si [re']
    re re do do si si, re[si]
    mi fa sol4 la4. do8

    %19
    fad, sol la4 si4. si8\mbreak
    mi,8 mi re re do do si la
    sol\f la' si sol mi do si[si]

    %22
    sol4 r r2
    R1*6
    r2 re'4\tu r8 fad

    %30
    sol sol sol sol mi mi la la
    re, do re re\mbreak fa fa si si
    mi, re mi si' \pp mi, re16 do si8 do

    %33
    si4. si'8 mi, re16 do si8 do
    si4. do'8 fad, si mi, fad
    sold, la si sold do re mi4

    %36
    fa?4. la8\mbreak re, mi fa4
    sold,8 la si sold do do si si
    la la sold fa' mi\f la sold sold

    %39
    mi fa sold, sold mi4 r
    R1
    r2 r4 r8 do''\p

    %42
    dod dod dod dod\mbreak re re re re
    si? si si si do? do do do
    la la la la sib sib sib sib

    %45
    sib? sib sol sol mi mi dod dod
    la la la la re mi fa sol\mbreak
    la, la la la la la la la

    %48
    la la la la la la la la
    la la la la re4 r8 mi\f
    fa fa fa fa fa fa fa la

    %51
    si! si si si la la la si
    si sol sol sol dod? si si? dod
    red, mi fad red sol\p sol fad fad

    %54
    mi mi red do' si16\f si do si si si, do si
    sol4 r r2
    R1*3\mbreak

    %59
    do8 \p do re mi fa fa fa fa
    si, si do[re] mi mi mi mi
    la, la si do re re re re

    %62
    sol, sol sol sol sol4\f re'8 si
    sol sol' sol sol r mi' mi[mi,]\mbreak
    re re' re[re,] re4. si8

    %65
    sol sol r do\p fa, fa sol sol
    do do do do fa, fa sol sol
    do do do do fa, fa fad fad

    %68
    sol sol sol' fa mi mi mi mi\mbreak
    fa fa fa mib re re sib[sib]
    mib mib mib mib mib do do do

    %71
    si? si si si do do do do
    si si do do re si do[fad,]
    sol sol do do\mbreak re si do[fad,]

    %74
    sol sol mi' ?mi fa fa fa fa
    mi mi si[si] do do sol sol
    do do do do fa fa fa fa

    %77
    mi mi si[si]\mbreak do do sol sol
    do4 r8 mi\f mi fa sol4
    la4. do8 fad, sol la4

    %80
    si4. si8 mi, mi re re
    do do si la sol la' si sol
    mi4 r8 mi\p\mbreak mi mi re re

    %83
    do do si la do'\f si16 la sol fa mi re
    do1\fermata

}

Ibcn = \relative do {

    do4 sol r
    sol' do, r
    do r fa8 r

    %4
    mi r fa r sol r
    do,2 r4
    do4\p sol r

    %7
    sol' do, r
    do r fa8 r
    mi r fa r sol r

    %10
    do,2 r4
    do4\f r8 sol' do, re mi[re]
    do re mi[re] do re mi[do]

    %13
    r do' do[do,] r si' si[si,]
    r la' la[la,]\mbreak r sol' sol[sol,]
    re' do si[sol] do re mi[si]\pp

    %16
    do fad sol[do,] do la \once\stemUp sol[si']
    do si sib[fad] sol sol, si?[sol]
    do re mi[do] fa sol la[fa]\mbreak

    %19
    re mi fad[re] sol la si[sol]
    do do si[si] la la sol[fa]
    mi\f fa sol[sol,] do fa sol[sol,]

    %22
    do4 r8 do\solo fa mi re[do]
    sol' mi re[do] fa mi re[do]\mbreak
    sol' mi re[do] do' sol do [sol]

    %25
    do, re mi[do] sol' fa sol[sol,]
    do re mi[do] sol' la si[sol]
    la do, re[fad] sol fad sol[fad]

    %28
    sol sol, re'[re,] \once\stemUp sol do' si [fad]\mbreak
    sol sol, re'[re,] sol4\tu r8 re'
    sol, la si[sol] do la fad[fad']

    %31
    sol la si [sol] re si sold[sold']
    la si do[sold]^\pp la la, mi'[la,]
    sold fad? mi[\once\stemDown sold'] la la, mi'[la,]\mbreak

    %34
    sold fad \once\stemUp mi[\once\stemDown la'] si sold la[red,]
    mi fad sold[mi] la, si do[la]
    re mi fa[re] si do re[si]

    %37
    mi fad sold[mi] la la sold[sold]
    fa fa mi[re]\mbreak do^\f re mi[mi,]
    la re mi[mi,] la\solo si do[si]

    %40
    la si do[la] mi' fad sold[fad]
    mi fad sold[mi] la sold  la[la,]
    R1*7

    %49
    r2 re4 r8 la^\f
    re mi fa[mi]\mbreak re mi fa[re]
    si si' la[sol] fad mi red[red']

    %52
    mi, fad sol[mi] fad red mi[lad,]
    si dod red[si] mi'\p mi re?[re]
    do do si [la]\mbreak mi16\f mi la, si mi, mi' la, si

    %55
    mi,4\solo r si' r
    mi, r si''8 la sold[mi]
    la4 r mi r

    %58
    la, r mi'8 fad sold[mi]
    R1*3
    r2 sol,8\f la si [sol]

    %63
    do re mi [do]\mbreak r do' do[do,]
    r si' si[si,] re do si[sol]
    do do,  r4 r2

    %66
    R1*12
    do'8\tu do'16 si do8 do, do re mi[do]
    fa sol la[fa] re mi fad[re]

    %80
    sol la si[sol]\mbreak do do si[si]
    la la sol[fa] mi fa sol[sol,]
    do do'16\p si do8 do, do' do si[si]

    %83
    la la sol [fa] do'8\f si16 la sol fa mi re
    do1\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*3
    <6>4 <6 5> s
    s2.*4
    <6>4 <6 5> s
    s2.
    s1*2
    s2 s8 <6> s4
    s1
    s4 <6 5> <6 4> <6>
    <_->8 <6 5> s <_-> <6>2
    <6 4\+>8 <6 5!> <6 4> <7-> s2
    s4 s8 <7-> s2
    <_+>4 s8 <7> s2
    s4 <6> s2
    s1
    s2 s8 <6> <6>4
    s8 <6> <6>4 s8 <6> <6>4
    s8 <6> <6>4 s2
    s <6 4>4 <5 3>
    <4> s8 <3> s <6\\> <6>4
    s <_+> s2
    s4 <_+> s <6>8 <6>
    s4 <_+> s s8 <_+>
    s2 <6>4 <7>
    s2 <6>4 <7>
    s s8 <6> s4 <_+>
    <6> <_+> s <_+>
    s <_+> <_+>8 <6 5!> <_+> <7!>
    <_+>4 <6> s2
    s1
    <_+>
    s2 <6>4 <_+>
    s <_+> s2
    s <_+>
    s1*8
    s2 s4 s8 <_+>
    s1
    <_+>
    s2 <_+>8 <6 5!> <_+> <7!>
    <_+>4 <6> s2
    s s8 <6 5>16 <_+> s8 <6 5>16 <_+>
    s2 <_+>
    s2 <_+>4 <6>
    s2 <_+>
    s <_+>
    s1*5
    s8 <6> s4 <6> <6 5>
    s1*13
    s2 s4 s8 <7->
    s2 <7 _+>
    s1
    s2 <6>

}

forma = {

    \key do\major
    \time 3/4
    \tempo 4 = 60
    s2.*10
    \bar "||"\break
    \mark\markup\huge"[Allegro]"
    \time 4/4
    \tempo 2 = 45
    s1*74
    \bar"|."

}

Ivl = {
    \Iglobal
    \notypeset
    <<\Ivln \forma>>

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
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

IIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

IIvln = \relative do'' {

    R1*2
    sol'16.\solo fa32 mi16. re32 do8 do do4~do16 do(mi sol)
    la8 do,~do16 fa(la do,) si32[(la sol16)] re'32(do si16) si32[(la sol16)] la'32(sol fa16)

    %5
    fa8\tr mi r mi? sib'?4~sib32(sol la sol) sib![(sol la sol)]\mbreak
    sol8\tr fa r re do'4~do32(la si? la) do[(la si la)]
    la8\tr sol r16 mi(sol si) do,4~do16 la(do la')

    %8
    red,4~red16 si(red la') sol8 fad16 mi fad8.\tr mi16
    mi4 r8 mi\mbreak mi32(sold fad mi) si'[(sold fad mi)] re(sold fad mi) si'[(re, do si)]
    do8 la r mi' fa4~fa32 re(fa la sol[fa mi re)]

    %11
    mi4~mi32 do (mi sol fa[mi re do)]\mbreak re4~re32 si(re fa mi[re do si)]
    do4~do32 la (do mi re [do si la)] si8 sol r re'
    mi32(re do16) sol'32[(fa mi16)] mi32(re do16) sib32[(la sol16)] la32(sol fa16) la'32[(sol fa16)] fa32(mi re16) do32[(si? la16)]\mbreak

    %14
    si32(la sol16) si'32[(la sol16)] sol32(fa mi16) re32[(do si16)] mi sol do do, re8.\tr do16
    do4 r8 sol' sib,32(la sol16) mi'32[(re do16)] sol'32(fa mi16) sib'32[(la sol16)]
    la si? do do, re8.\tr do16 do2

    %17
    R1^\markup{\parenthesize \musicglyph "scripts.ufermata" }

}

IIvlIn =  \relative do'' {

    r8 mi,16.\p fa32 sol8[mi] r la16. si32 do8[la]
    r re,16. mi32 fa8 re r mi16. fa32 sol8 mi
    r2 r8 mi16. fa32 sol8 mi

    %4
    r la16. si32 do8 la r re,16. mi32 fa8 re\mbreak
    r8 mi16. fa32 sol8[mi] r8 mi16. fa32 sol8[mi]
    r8 fa16. sol32 la8 fa r fad16. sol32 la8 fad

    %7
    r sol16. la32 si8 sol r mi16. re32 mi8 do
    r fad16. mi32 fad8 red\mbreak r si' red[si]
    r sol16. la32 si8 sol r sold16. la32 si8 sold

    %10
    r do,16. re32 mi8 do r la'16. sol?32 la8 re,
    r sol16. fa32 sol8 do,\mbreak r fa16. mi32 fa8 si,
    r mi16. re32 mi8 fa r re16. do32 re8 si

    %13
    r sol'16. fa32 sol8 mi r la16. sib32 do8 la
    r si?16. do32 re8 si\mbreak r sol si[sol]
    r8 mi16. fa32 sol8[mi] r8 sol16. fa32 sol8 mi

    %16
    r sol si[si] r mi,16. fa32 sol8 mi
    r si16. do32 re8 si mi2\fermata

}

IIvlIIn = \relative do'' {

    r8 do,16.\p re32 mi8 do r fa16. sol32 la8 fa
    r si,16. do32 re8 si r do16. re32 mi8 do
    r2 r8 do16. re32 mi8 do

    %4
    r fa16. sol32 la8 fa r si,16. do32 re8 si\mbreak
    r8 do16. re32 mi8 do r dod16. re32 mi8 dod
    r re16. mi32 fa8 re r red16. mi32 fad8 red

    %7
    r mi16. fad32 sol8 mi r la,16. si32 do8 la
    r si16. dod32 red8 si\mbreak r mi si'[si,]
    r mi16. fad32 sol8 mi r mi16. fad32 sold8 mi

    %10
    r la,16. si32 do8 \parenthesize la r re16. mi32 fa8 si,
    r do16. re32 mi8 la, r si16. do32 re8 sold,?\mbreak
    r la16. si32 do8 la r sol?16. la32 si8 sol

    %13
    r do16. re32 mi8 do r fa16. sol32 la8 fa
    r sol16. la32 si8 sol r do, sol'[sol,]
    r do16. re32 mi8 do r do16. re32 mi8 do\mbreak

    %16
    r  do sol' [sol,] r do16. re32 mi8 do
    r sol16. la32 si8 sol do2\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key do\major
    \time 4/4
    \tempo 4 = 40
    s1*17
    \bar"|."

}

IIvl = {
    \IIglobal
    \notypeset
    <<\IIvln \forma>>

}

IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>

}

IIvlII = {
    \IIglobal
    <<\IIvlIIn \forma>>
    \typeset

}

IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

IIIvln = \relative do'' {

    sol'4 mi
    do4. sol8
    do[sol do re]

    %4
    mi[do mi fa]
    sol4 fa
    mi8[re do si]

    %7
    la[sol fa mi]
    re[do si la]
    sol4 r

    %10
    sol'' mi
    dod4. la8
    dod[la dod re]\mbreak

    %13
    mi[dod mi fa]
    sol4 la
    fa8 mi re4

    %16
    la' fad
    red4. si8
    red[si red mi]

    %19
    fad[red? fad sol?]
    la4 si
    sol8 fad mi4

    %22
    sol do,
    si4. la8
    sol[fa mi re]

    %25
    do[re mi fa]
    sol4 r
    sol'\mbreak do,

    %28
    \appoggiatura do8 si4.\tr do8
    re[mib fa sol]
    \appoggiatura do,8 si4.\tr do8

    %31
    re[mib fa sol]
    sol,4 lab'8 r
    sol r fa r

    %34
    mib re16 do re8 si
    do4 lab'8 r
    sol r fa r

    %37
    mib re16 do re8 si\mbreak
    do4 r
    do16\solo(re mi?) do sol'(la si) sol

    %40
    do8 si16 la sol fa mi re
    do(re mi) do sol'(la si) sol
    do8 si16 la sol fa mi re

    %43
    do8[sol mi do]
    sol4 r
    mi''16(fa sol) mi\mbreak do(re mi) do

    %46
    la(sib do) la fa(sol la) fa
    fa'(sol la) fa re(mi fa) re
    si?(do re) si sol(la si) sol

    %49
    sol' (la si) sol mi(fa sol) mi
    do(re mi) do\mbreak la(si do) la
    la'(si do4.)

    %52
    fad,16(sol la4.)
    la,16(si do4.)
    si8 sol' \once\stemUp re, \stemDown fad'

    %55
    \stemUp do, [\stemDown mi'  \stemUp si, \stemDown re']
    \stemUp la, [\stemDown do'  \stemUp sol,\stemDown si']\stemNeutral
    fad16 re sol re la' re, si' re,

    %58
    do'8(la'4) si,8
    do8(la'4) si,8
    do la'16(sol fad mi re do)

    %61
    si8 sol' \stemUp re, \stemDown fad'\stemNeutral
    sol4\tu re
    si4. re8

    %64
    sol[re sol la]
    si[sol si do]
    re4 do

    %67
    si8[la sol fad]
    mi[re do si]
    la[sol fad mi]

    %70
    re16\solo(la' fad') la, re,(si' sol') si,
    re, \parentSlur (do' la') do, re, \parentSlur (si' sol') si,
    re, \parentSlur (la' fad') la, re, \parentSlur (si' sol') si,\mbreak

    %73
    re, \parentSlur (do' la') do, re, \parentSlur (si' sol') si,
    <<fad'4\\{\stemUp \override Stem.transparent = ##t la,}\\\stemDown re,>> r\stemNeutral
    R2

    %76
    mi16 si' sol' si, mi, do' la' do,
    mi, re' si' re, mi, do' la' do,
    mi, si' sol' si, mi, do' la' do,\mbreak  %%%fine prima pagina

    %79
    mi, re' si' re, mi, do' la' do,
    <<sol'4\\{\stemUp \override Stem.transparent = ##t si,}\\\stemDown mi,>> r
    <<sold'4\\{\stemUp \override Stem.transparent = ##t si,}\\\stemDown mi,>> r\stemNeutral

    %82
    la,16 mi' do' mi, la, fa' re' fa,
    la, sol' mi' sol, la, fa' re' fa,
    la, mi' do' mi, la, fa' re' fa,\mbreak

    %85
    la, sol' mi' sol, la, fa' re' fa,
    <<do'4\\{\stemUp \override Stem.transparent = ##t mi,}\\\stemDown la,>> r\stemNeutral
    R2

    <<
        {
            %88
            re16_\markup\italic\smaller"A. Ephrikian, Ricordi"  la' fa' la, re, si' sol' si,
            re, do' la' do, re, si' sol' si,
            re, la' fa' la, re, si' sol' si,

            %91
            re, do' la' do,\mbreak re, si' sol' si,
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \key do\major
            {
            \set Staff.midiInstrument = #"violin"
                %88bis
                re,16_\markup\italic\smaller"Le Cène"  la' fa' la, re, la' sol' la,
                re, la' la' la, re, la' sol' la,
                re, la' fa' la, re, la' sol' la,

                %91bis
                re, la' la' la,\mbreak re, la' sol' la,
            }
        }
    >>
    <<fa'4\\{\stemUp \override Stem.transparent = ##t la,}\\\stemDown re,>> r8 la''\stemNeutral
    sib16(la) sol4 sib8

    %94
    la16 sol fa mi re dod si? la
    sib'?16(la) sol4 sib!8
    la16 sol fa mi re dod si la

    %97
    fa'(mi) re4 fa8\mbreak
    mi16(re) dod4 mi8
    re4\tu fa

    %100
    re4. la8
    re[la re mi]
    fa[re fa sol]

    %103
    la4 sol
    fa8[mi re do]
    sib[la sol fa]

    %106
    mi[re dod si?]
    la4 r
    la''\solo fad\mbreak

    %109
    red4. si16 dod
    red si red mi fad red fad sol
    la8 sol16(la) si(la) sol(fad)

    %112
    sol fad mi8 r4
    si'16(la sol) fad mi re? do si
    do la do mi\mbreak do la do mi

    %115
    la(sol fad) mi re do si la
    si sol si re si sol si re
    sol(fad mi) re do si la sol

    %118
    la fad la do la fad la do\mbreak
    fad?(mi red?) dod si la sol fad
    sol8 mi r mi'

    %121
    \appoggiatura sol fa?16(mi fa4) mi8
    red16 dod si4 mi8
    \appoggiatura sol fa16(mi fa4) mi8

    %124
    red16 dod si4 fad'8
    sol16 mi la mi si' mi, do' mi,\mbreak
    mi'8 mi, fad4\tr

    %127
    mi r
    sol\tu mi
    do4. sol8

    %130
    do[sol do re]
    mi[do mi fa]
    sol4 fa

    %133
    mi8[re do si]
    la[sol fa mi]
    re[do si la]

    %136
    sol16(re' si') re,\mbreak sol,(mi' do') mi,
    sol,\parentSlur (fa' re') fa, sol,\parentSlur (mi' do') mi,
    sol,\parentSlur (re' si') re, sol, \parentSlur (mi' do') mi,

    %139
    sol,\parentSlur (fa' re') fa, sol,\parentSlur (mi' do') mi,
    <<si'4\\{\stemUp \override Stem.transparent = ##t re,}\\\stemDown sol,>> sol''4~
    sol16 fa(mi) re(do) si(la) sol(

    %142
    fa4) la'~
    la16 sol(fa) mi(re) do(si) la(
    sol4) si'~

    %145
    si16 la(sol) fa(mi) re(do) si(
    la4) do'~
    do16 si(la) sol(fa) mi(re) do(

    %148
    si4) r8 si'16\solo do
    re si sol si\mbreak re si sol si
    re si fa si re si fa si

    %151
    do sol mi sol do sol mi \parenthesize sol
    do sol re sol do sol re sol
    si sol re sol si sol re si'

    %154
    do4\mbreak r8 si,16 do
    re si sol si re si sol si
    re si fa si re si fa si

    %157
    do sol mi sol do sol mi sol
    do sol re sol do sol re sol\mbreak
    si sol re sol si sol re si'

    %160
    do4. do8\tu
    re[mib fa sol]
    \appoggiatura do, si4.\tr  do8

    %163
    re[mib fa sol]
    sol,4 lab'8 r
    sol r fa r

    %166
    mib re16 do re8 si
    do4 lab'8 r
    sol r fa r

    %169
    mi! re16 do re8 si\mbreak
    do2\fermata

}

IIIvlIn =  \relative do'' {

    sol'4 mi
    do4. sol8
    do[sol do re]

    %4
    mi[do mi fa]
    sol4 fa
    mi8[re do si]

    %7
    la[sol fa mi]
    re[do si la]
    sol4 r

    %10
    sol'' mi
    dod4. la8
    dod[la dod re]\mbreak

    %13
    mi[dod mi fa]
    sol4 la
    fa8 mi re4

    %16
    la' fad
    red4. si8
    red[si red mi]

    %19
    fad[red? fad sol?]
    la4 si
    sol8 fad mi4

    %22
    sol do,
    si4. la8
    sol[fa mi re]

    %25
    do[re mi fa]
    sol4 r
    sol'\mbreak do,

    %28
    \appoggiatura do8 si4.\tr do8
    re[mib fa sol]
    \appoggiatura do,8 si4.\tr do8

    %31
    re[mib fa sol]
    sol,4 lab'8 r
    sol r fa r

    %34
    mib re16 do re8 si
    do4 lab'8 r
    sol r fa r

    %37
    mib re16 do re8 si\mbreak
    do4 r
    R2*23

    %62
    sol'4\tu re
    si4. re8

    %64
    sol[re sol la]
    si[sol si do]
    re4 do

    %67
    si8[la sol fad]
    mi[re do si]
    la[sol fad mi]

    %70
    re4 re\p
    re re
    re re

    %73
    re re
    \once\stemUp re8 fad'16\f sol la8 la
    red, fad16 sol\mbreak la8 la

    %76
    sol4 mi,\p
    mi mi
    mi mi

    %79
    mi mi
    \once\stemUp mi8 sol'16\f la si8 si
    re, sold16 la si8 si

    %82
    la4 la,,\p
    la la
    la la

    %85
    la la
    la8 do'16\f re\mbreak mi8 mi
    dod mi16 fa sol8 sol

    %88
    fa4 re,\p
    re re
    re re

    %91
    re re
    \once\stemUp re8 fa'16 sol la8 fa
    re4 r

    %94
    R2*5
    re4\tu fa

    %100
    re4. la8
    re[la re mi]
    fa[re fa sol]

    %103
    la4 sol
    fa8[mi re do]
    sib[la sol fa]

    %106
    mi[re dod si?]
    la4 r
    R2*20

    %128
    sol''4\tu mi
    do4. sol8

    %130
    do[sol do re]
    mi[do mi fa]
    sol4 fa

    %133
    mi8[re do si]
    la[sol fa mi]
    re[do si la]

    %136
    sol4\p sol
    sol sol
    sol sol

    %139
    sol sol
    sol r
    do'8 do\mbreak do do

    %142
    do4 r
    re8[re re re]
    re4 r

    %145
    mi8[mi mi mi]
    mi4 r
    fa8[fa fa fa]

    %148
    fa4 r
    R2*11
    r4 r8 do\tu

    %161
    re[mib fa sol]
    \appoggiatura do, si4.\tr  do8

    %163
    re[mib fa sol]
    sol,4 lab'8 r
    sol r fa r

    %166
    mib re16 do re8 si
    do4 lab'8 r
    sol r fa r

    %169
    mi! re16 do re8 si\mbreak
    do2\fermata

}

IIIvlIIn = \relative do'' {

    mi4 do
    sol4. mi8
    sol[mi sol si]

    %4
    do[sol do re]
    re4 re
    do4. si8

    %7
    la[sol fa mi]
    re[do si la]
    sol4 r

    %10
    r sol''~
    sol mi~
    mi la,8 fa

    %13
    dod'[la dod re]
    mi4 mi
    re2

    %16
    r4 la'~
    la fad~
    fad si,8 sol

    %19
    red'[si red mi]
    fad4 fad\mbreak
    mi2

    %22
    sol4 do,
    si4. la8
    sol[fa mi re]

    %25
    do[re mi fa]
    sol4 r
    sol' do,

    %28
    \appoggiatura do8 si4.\tr do8
    re[mib fa sol]
    \appoggiatura do,8 si4.\tr do8

    %31
    re[mib fa sol]
    sol,4 fa'8 r
    mib r re r\mbreak

    %34
    r mib fa[re]
    mib4 fa8 r
    mib r re r

    %37
    r mib fa[re]
    mi!4 r
    R2*23

    %62
    re4\tu si
    sol4. si8
    re[si re fad]

    %65
    sol[re sol la]
    la4 la
    sol4. fad8\mbreak

    %68
    mi[re do si]
    la[sol fad mi]

    %70
    re4 re\p
    re re
    re re

    %73
    re re
    re8 re'16\f mi fad8 fad
    si, red16 mi fad8 fad

    %76
    mi4 mi,\p
    mi mi
    mi mi

    %79
    mi mi
    mi8 mi'16\f fad\mbreak sol8 sol
    si, mi16 fad sold8 sold

    %82
    mi4 la,,\p
    la la
    la la

    %85
    la la
    la8 la'16\f si do8 do
    la dod16 re mi8 mi

    %88
    re4 re,\p
    re re
    re re

    %91
    re re\mbreak
    re8 re'16\f mi fa8 re
    sib4 r

    %94
    R2*5
    fa'4\tu  re
    la4. fa8

    %101
    la8 fa la dod
    re la re mi
    mi4 mi

    %104
    re4. do?8
    sib [la sol fa]
    mi[re dod si?]

    %107
    la4 r
    R2*20\mbreak
    mi''4\tu do

    %129
    sol4. mi8
    sol[mi sol si]
    do[sol do re]

    %132
    re4 re
    do4. si8
    la[sol fa mi]

    %135
    re[do si la]
    sol4\p  sol
    sol sol

    %138
    sol sol
    sol sol
    sol r\mbreak

    %141
    sol'8 [sol sol sol]
    la4 r
    la8[la la la]

    %144
    si4 r
    si8[si si si]
    do4 r

    %147
    do8[do do do]
    re4 r
    R2*11

    %160
    r4 r8 do\tu
    re[mib fa sol]
    \appoggiatura do, si4.\tr  do8

    %163
    re[mib fa sol]
    sol,4 fa'8 r
    mib r re r

    %166
    r mib fa[re]
    mib4 fa8 r
    mib r re r

    %169
    r mi! fa[re]
    mi2\fermata

}

IIIvlan =  \relative do' {

    do'4 sol
    mi4. do8
    mi4. sol8

    %4
    sol4. la8
    si4 si
    sol4. sol8

    %7
    la[sol fa mi]
    re do si la
    sol4 r

    %10
    r mi'~
    mi dod~
    dod dod?8 la

    %13
    la'2~
    la
    la4 la,

    %16
    r\mbreak fad'~
    fad red~
    red red?8 si

    %19
    si'2~
    si
    si4 si,

    %22
    mi8[fa? sol mi]
    re4. la'8
    sol[fa mi re]

    %25
    do[re mi fa]
    sol4 r
    mib8[fa sol lab]

    %28
    re,4. mib8
    re[do si mib]
    re4~re8 mib

    %31
    re[do si mib]
    re[mib do re]
    mib[sol si sol]

    %34
    sol[sol lab sol]
    mib[mib do re]
    mib[sol si sol]

    %37
    sol[sol la? sol]
    sol4 r
    R2*23

    %62
    si4\tu sol
    re4. sol8
    si4. fad8

    %65
    re4. mi8
    re4 re
    re4. fad8

    %68
    mi re do si
    la[sol fad mi]
    re4 re\p

    %71
    re re
    re re
    re re

    %74
    \once\stemUp re8[la''\f fad fad]
    fad? [fad red red]
    si4 mi\p

    %77
    mi mi
    mi mi
    mi mi

    %80
    mi8[si'\f si si]
    sold[sold mi mi]
    do4 la\p

    %83
    la la
    la la
    la la

    %86
    la8[mi'\f mi mi]
    mi[mi mi dod]
    la4 re\p

    %89
    re re
    re re
    re re\mbreak

    %92
    re8[la'\f la la]
    sol4 r
    R2*5

    %99
    re'4\tu la
    fa4. re8
    fa4. la8

    %102
    la4. la8
    la4 dod
    la4. do!8

    %105
    sib[la sol fa]
    mi re dod si?
    la4 r

    %108
    R2*20
    do'4\tu\mbreak sol
    mi4. do8

    %130
    mi4. sol8
    sol4. la8
    si4 si

    %133
    sol4. sol8
    la[sol fa mi]
    re do si la

    %136
    sol4\p sol
    sol sol
    sol sol

    %139
    sol sol
    sol r
    mi'8[mi mi mi]

    %142
    fa4 r\mbreak
    fa8[fa fa fa]
    sol4 r

    %145
    sol8[sol sol sol]
    la4 r
    la8[la la la]

    %148
    si4 r
    R2*11
    r4 r8 mib,\tu

    %161
    re[do si mib]
    re4. mib8
    re[do si mib]

    %164
    re[mib do re]
    mib[sol si sol]
    sol[sol lab sol]

    %167
    mib[mib do re]
    mib[sol si sol]
    sol[sol la! sol]

    %170
    sol2\fermata

}

IIIbcn = \relative do {

    do'8 si do do,
    do' si do do,
    do' si do sol

    %4
    do si do fa,
    si, la\mbreak si sol
    do sol' do, sol'

    %7
    la sol fa mi
    re do si la
    sol sol' mi re

    %10
    dod si dod la
    la' sol la la,
    la' sol\mbreak la re,

    %13
    la' sol la re,
    dod si dod la
    re la' fa mi

    %16
    red dod red si
    si' la si si,
    si' la si mi,\mbreak

    %19
    si' la si mi,
    red dod red si
    mi fad sol mi

    %22
    do re mi do
    sol' fa sol la
    sol fa mi re\mbreak

    %25
    do re mi fa
    sol fa mi re
    do re mib fa

    %28
    sol fa sol do,
    si la sol do
    sol' fa sol do,

    %31
    si la\mbreak sol do
    sol' do, fa si,
    do mib re sol,

    %34
    do do' fa, sol
    do, do fa si,
    do mib re sol,

    %37
    do do'\mbreak fa, sol
    do,4  r
    do\solo r

    %40
    do si8 sol
    do4 r
    do si8 sol

    %43
    do4 r
    sol8 la si sol
    do'4 do,

    %46
    fa fa,
    re''\mbreak re,
    sol sol,

    %49
    mi'' mi,
    la la,
    fad'8 fad fad fad

    %52
    re re re re
    fad fad fad fad
    sol4 re'8 r

    %55
    do r si r\mbreak
    la r sol r
    re re re re

    %58
    re mi fad sol
    re mi fad sol
    la re, mi fad

    %61
    sol16 la si do\mbreak re8 re,
    sol\tu fad sol sol,
    sol' fad sol sol,

    %64
    sol' fad sol re
    sol fad sol do,
    fad mi fad re

    %67
    sol4. fad8\mbreak
    mi re do si
    la sol fad mi

    %70
    re4 re^\p
    re re
    re re

    %73
    re re
    re8 re'\f re re
    si si si si\mbreak

    %76
    mi4 mi^\p
    mi mi
    mi mi

    %79
    mi mi
    mi8 mi\f mi mi
    mi mi mi mi

    %82
    la,4 la^\p
    la la
    la la\mbreak %% fine pagina

    %85
    la4 la
    la8 la\f la la
    la la la la

    %88
    re4 re^\p
    re re
    re re

    %91
    re re
    re8 re\f re re\mbreak
    sol la sib sol

    %94
    dod,4 r8 re
    sol la sib sol
    dod,4 r8 re

    %97
    re mi fa re
    la'4 la,
    re'8\tu dod re re, \mbreak

    %100
    re' dod re re,
    re' dod re la
    re dod re sol,

    %103
    dod, si dod la
    re4. do'?8
    sib la sol fa

    %106
    mi re\mbreak dod si?
    la4 r
    la8\solo la' la la,

    %109
    si si' si si,
    si si' si si,
    si si' si red,

    %112
    mi mi' mi mi,\mbreak
    sol4. sol8
    la la, la la'

    %115
    fad4. fad8
    sol sol, sol sol'
    mi4. mi8

    %118
    fad fad, fad fad'
    red4. red8
    mi mi,\mbreak mi mi'

    %121
    la4. la8
    si la sol mi
    la4. la8

    %124
    si dod red si
    mi,4 r
    mi si'8 si,

    %127
    mi4 r
    do'8\tu si do do,\mbreak
    do' si do do,

    %130
    do' si do sol
    do si do fa,
    si, la si sol

    %133
    do sol' do, si'
    la sol fa mi
    re do\mbreak si la

    %136
    sol4\p sol
    sol sol
    sol sol

    %139
    sol sol
    sol r
    R2

    %142
    fa'8 fa fa fa
    R2
    sol8 sol sol sol

    %145
    R2\mbreak
    la8 la la la
    R2

    %148
    sol8 sol sol sol
    sol, sol sol sol
    sol sol sol sol

    %151
    sol sol sol sol
    sol sol sol sol\mbreak
    sol sol sol sol

    %154
    do,4 r8 sol'
    sol sol sol sol
    sol sol sol sol

    %157
    sol sol sol sol
    sol sol sol sol
    sol sol sol sol

    %160
    do,4 r8 do'\tu
    si la sol do
    sol' fa sol do,

    %163
    si la sol do
    sol' do, fa si,
    do mib re sol,

    %166
    do do'\mbreak fa, sol
    do, do fa si,
    do mib re sol,

    %169
    do do' fa, sol
    do,2\fermata

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2*4
    <6>4 <6>
    s2*4
    <6 4>2
    <7>
    s
    s
    <6 5>
    s4 <6>
    <6 5>2
    <7 _+>
    <_+>
    <_+>
    <6 5>
    s2*6
    <_->2
    s4 s8 <_->
    s4 s8 <_->
    s4 s8 <_->
    s4 s8 <_->
    s8 <_-> <7- _-> <7->
    <_-> s <6!> <7!>
    <_-> s <6 5 _-> <_!>
    <_-> s <_-> <7->
    <_-> s <6!> <7 _!>
    <_->4 <6 5>
    s2*2
    s4 <6>
    s2
    s4 <6>
    s2*8
    <6 5>2
    s
    <6  5>
    s4 <_+>
    s2
    s
    <_+>8 <6 4> <7 5> <6 4>
    <7 _+>4 <6 5>
    <7 _+>2
    s
    s4 <4>8 <_+>
    s <6> s4
    s8 <6> s4
    s8 <6> s4
    s8 <6> s4
    <6>2
    s2*3
    s4 <6 4>
    <7 5> <6 5>
    <5 _+> <6 4>
    <7 5> <6 4>
    <5 _3>2
    <7 _+>
    s4 <6 4>
    <7 5> <6 4>
    <5 3> <6 4>
    <7 5> <6 4>
    <5 3>2
    <7 _+>
    s4 <6 4>
    <7 5> <6 4>
    <5 3> <6 4>
    <7 5> <6 4>
    <5 3>2
    <7 _+>
    s4 <6 4>
    <7 5> <6 4>
    <5 3> <6 4>
    <7 5> <6 4>
    <5 3> s
    <_->2
    <6>
    <_->
    <6 5>
    s
    <_+>
    s2*4
    <6>2
    s2*2
    s4 <6>
    s2
    <6\\ 5>
    <_+>
    <_+>
    <_+>
    s2*3
    <6>2
    s
    <6>
    <5>
    <6>
    s
    s4. <6\\ 5>8
    <_+>4 <6>
    s4. <6\\ 5>8
    <_+>4 <6>
    s2
    s4 <4>8 <_+>
    s2*5
    <6>2
    s2*3
    s4 <6 4>
    <7 5> <6 4>
    <5 3> <6 4>
    <7 5> <6 4>
    <5 3>2
    s2*9
    <7>2
    <6 4>
    <5 4>
    <3>
    s2*2
    <7>2
    <6 4>
    <5 3> <3>
    s2
    <6>4 s8 <_->
    s4 s8 <_->
    s4 s8 <_->
    s4 <_->8 <7->
    <_-> <6> <7> <7>
    <_->4 <6 5 _->
    <_-> <_->8 <7 ->
    <_-> <6> <7> <7>
    <_!>4 <6 5>

}

forma = {

    \key do\major
    \time 2/4
    \tempo 2 = 58
    s2*170
    \bar"|."

}

IIIvl = {
    \IIIglobal
    %\notypeset
    <<\IIIvln \forma>>

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}

IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}
#(set-global-staff-size 15)


\pointAndClickOff

\paper  {

   print-first-page-number = ##t
   first-page-number = #2

}

\bookpart {

    \paper  {

   systems-per-page = #4

}

   \markup\huge "[1.] Largo Spiccato"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
      } <<

         \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Principale"}
            \Ivl
         >>

         \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         } <<

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
               \IvlI
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
               \IvlII
            >>
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \Ivla
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.2"e Organo"}
            \Ibc
         >>
      >>

      \layout {

         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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

   systems-per-page = #6

}

   \markup\huge "[2.] Largo"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
      } <<

         \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Principale"}
            \IIvl
         >>

         \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         } <<

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
               \IIvlI
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
               \IIvlII
            >>
         >>
      >>

      \layout {

         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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

\pageBreak

\bookpart {

    \paper  {

   systems-per-page = #4

}

   \markup\huge "[3.] Allegro"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
      } <<

         \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Principale"}
            \IIIvl
         >>

         \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         } <<

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Primo"}
               \IIIvlI
            >>

            \new Staff <<
               \set Staff.midiInstrument = #"violin"
               \set Staff.instrumentName = \markup \center-column{"Violino"\vspace #-0.2"Secondo"}
               \IIIvlII
            >>
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Viola"}
            \IIIvla
         >>

         \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.2"e Organo"}
            \IIIbc
         >>
      >>

      \layout {

         indent = 2\cm

         \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
            \override SpacingSpanner.uniform-stretching = ##t
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

