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
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \terzine
}

Ivln = \relative do'' {

    re8
    sol [sib la fad]
    sol4 re8 mib
    \appoggiatura re do4 sib8 mib

    %4
    \appoggiatura re do4 sib8 mib
    do sib16 do la8 do
    sib la16 sol sib8 do\mbreak

    %7
    re4 r8 re
    sol[sib la fad]
    sol4 re8 sol

    %10
    mib4 re8 sol
    mib4 re8 fad
    sol la16 sib la8 sol

    %13
    fad4 r8 re
    sib' sol4 fa?8
    mib re4 do8

    %16
    la' fa4 mib8
    re do4 sib8
    sol' mib4 re8\mbreak

    %19
    do[sib' la sol]
    fad4 r8 la,
    re[do re fad,]

    %22
    \appoggiatura fad? sol4 fad!8 la
    \appoggiatura la sol4 fad8 la
    \appoggiatura la sol4 \once\stemUp fad8 la'

    %25
    sib la16 sol la8 fad
    sol4 r8 re\solo
    sol,16(la sib do re8) sib'

    %28
    sol4(fad8) sol\mbreak
    la,16(sib do re mib8) do
    sib[la sol sol']

    %31
    sib16(la sol8) fa?16(mib re8)
    mib16(re do4) fa8
    la16(sol fa8) mib16(re do8)

    %34
    re16 (do sib4) fa'8
    \appoggiatura sol fa16(mi? fa8) \appoggiatura sol fa16(mi fa8)
    sib la16(sol fa4)

    %37
    \appoggiatura sol8 fa16(mi fa8) \mbreak \appoggiatura sol fa16(mi fa8)
    sib la16(sol fa8) mib
    re16(sib la sib) sol'4\tr

    %40
    fa16(sib, la sib) sol'4\tr
    fa16 sib re, sib' do, la' sib, sol'
    la, fa' sol, mib' fa, re' mib, do'

    %43
    \tuplet 3/2 {
        re,(sib' do re[do sib)] re,(sib' do re[do sib)]
        mib,(sib' do re[do sib)]
    } <<do4\tr\\fa,>>
    \tuplet 3/2 {
        sib16(sib do re[do sib)] re,(sib' do re[do sib)]

        %46
        mib,(sib' do re[do sib)]
    } <<do4\tr\\fa,>>
    sib r8 fa'\tu
    sib fa sol sib,

    %49
    \appoggiatura sib la4 sib8 fa'
    \appoggiatura sib, la4\mbreak sib8 do
    re do16 sib re8 mib

    %52
    fa4. fa8
    sol[fa sol re]
    mib si do4~

    %55
    do8 re16 mib fa8 mib16 re
    mib8 si do4~
    do8 re16 mib fa8 mib16 re

    %58
    sol8 si,\mbreak do fa
    mib4 re
    do2~

    %61
    do8 si16 do re8 do16 si
    do8 si16 do re8 do16 si
    do8 sib!16 lab sol8 fa

    %64
    mib4 re
    do16 do'\solo si do mib(do si do)\mbreak
    sol'(do, si do) mib(do si do)

    %67
    sol'(do, si do) mib(do si do)
    lab'(sol fa mib re8) do
    si sol sol,4

    %70
    r16 do' si do mib(do si do)\mbreak
    sol'(do, si do) mib(do si do)
    sol'(do, si do) mib(do si do)

    %73
    lab'(sol fa mib re8) do
    do4\tr si
    do'2~

    %76
    do8(sib?16 la sol8 fad)
    fad?4(sol)
    sib2~

    %79
    sib8(lab16 sol fa8 mi!)
    mi4(fa)
    lab16 (sib lab) sol fa(sol fa) mib

    %82
    re(mib re) do sib(do sib) lab
    sol(lab sol) fa mib fa sol lab
    sib4 r8 sib

    %85 OOKKK
    mib mib, sol, \once\stemDown  sib'
    \once\stemDown do lab,\mbreak r do'
    fa fa, la,! \once\stemDown do'

    %88
    re re, r re'
    sol re si, \once\stemDown re'
    \once\stemDown mib do, r sol''

    %91
    lab16(sib lab) sol fa sol fa mib
    re8(sib) sib4\tr
    re8(sib) sib4\tr

    %94
    mib16(sib) do(sol) lab(fa) sol(mib)\mbreak %% fine pagina
    sib mib fa sol fa4\tr
    mib8\tu sib' mib4~

    %97
    mib8[fa sol fa]
    mib4 sib8 mib
    \appoggiatura re8 do4 sib8 mib

    %100
    \appoggiatura re8 do4 sib8 lab
    <<{sol fa16 mib \parenthesize fa8 \parenthesize sol}

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"violin"
            \key fa\major sol8^\markup\italic "Ed. Le Cène" fa16 mib <<{sol8^\markup\italic"Vl. I" la?}\\{lab_\markup\italic "Vl.II" [sib]}>>}>>

    sib2

    %103
    si
    do16 re mib fa sol8 do,
    si la16 sol la8 si\mbreak

    %106
    do!2
    dod
    re16 mi fa sol la8 re,

    %109
    dod si16 la si8 dod
    \appoggiatura dod? re4. la8
    sib?4 la8 mi'

    %112
    fa4 mi8 la
    fa mi16 re mi8 dod
    re16\solo(mi fa) sol la sol fa mi

    %115
    re \parentSlur (mi fa) sol la fa mi re\mbreak
    la(si dod) re mi re dod si
    la \parentSlur (si dod) re mi sol, fa mi

    %118
    fa8 re r4
    fad'16(la re4.)
    sib8 re, sol, r

    %121
    mi'16(sol do4.)
    la8 do, fa, r
    re'16(fa sib4.)

    %124
    sol8 si,! mi, r
    dod'16(mi la4.)\mbreak
    fa8 la, re, r

    %127
    \appoggiatura sib'' la16(sol la8) \appoggiatura sib la16(sol la8)
    \appoggiatura la sol16(fa sol8) \appoggiatura la sol16(fa sol8)
    \appoggiatura sol fa16(mi fa8) \appoggiatura sol fa16(mi fa8)

    %130
    mi16 re(dod) si(la4)
    \appoggiatura sib'8 la16(sol la8) \appoggiatura sib la16(sol la8)
    \appoggiatura la sol16(fa sol8) \appoggiatura la sol16(fa sol8)

    %133
    \tupletSpan 4 \tuplet 3/2 {
        fa(la sol fa mi re)
        mi(sol fa mi re dod)
    }
    dod?4(re)

    %136
    \tuplet 3/2 {
        fa8(la sol fa mi re)
        mi(sol fa mi re dod)
    }
    dod?4\tu(re8) la

    %139
    re[fa mi dod]
    re4 la8 sib
    \appoggiatura la sol4 fa8 sib

    %142
    \appoggiatura la sol4 fa8 re'\mbreak
    sol[sib la fad]
    sol4 re8 mib

    %145
    \appoggiatura re do4 sib8 mib
    \appoggiatura re do4 sib8 re
    sol la16 sib la8 sol

    %148
    fad[mi re re]
    sib'\solo la16(sol) \appoggiatura sib8 la sol16(fad)
    sol8 re4 mib8

    %151
    re do16(sib) \appoggiatura re8 do sib16(la)\mbreak
    sib8 sol4 re'8
    sib' la16(sol) \appoggiatura sib8 la sol16(fad)

    %154
    sol8 re4 do8
    \appoggiatura do sib la16 sol sib8 do
    re4. re8

    %157
    sib'16(sol fad sol) sib(sol fad sol)
    mib8 re4 do8
    la'16(fa? mi? fa) la(fa mi fa)\mbreak

    %160
    re8 do4 sib8
    sol'16(mib re mib) sol(mib re mib)
    do(mib re do) fad(mib re do)

    %163
    \once\stemUp re,(mib' re do) fad(mib re do)
    \once\stemUp re,(mib' re do) fad(mib re do)\mbreak
    la'8.(sib16 do8) sib16(la)

    %166
    sib4 r8 sib
    do,16 la' sib, sol' la, fa'? sol, mib'
    fa, re' mib, do' re, sib' do, la'

    %169
    sib, sol' la, fad' sol, la sib do
    re4 r8 sol'
    sib la16 sol\mbreak \appoggiatura sib8 lab sol16(fad)

    %172
    sol8[(mib re dod)]
    re[(mib re dod)]
    re mi?16 fad sol8 la

    %175
    sib la16(sol) \appoggiatura sib8 la sol16 fad
    sol4 r8 la,
    \appoggiatura do sib la16 sol \appoggiatura sib8 la sol16 fad

    %178
    sol8 mib(\mbreak  re) dod'(
    re) mib, \parentSlur (re) dod'
    re mi?16 fad sol8 la

    %181
    sib la16 sol la8 sol16 fad
    \appoggiatura fad?8 sol4 r8 re\tu
    sib' sol4 fa?8

    %184
    mib re4 do8
    la' fa4 mib8
    re do4 sib8

    %187
    sol' mib4 re8\mbreak
    do[sib' la sol]
    fad4 r8 la,

    %190
    re do re fad,
    \appoggiatura fad? sol4 fad!8 la
    \appoggiatura la sol4 fad8 la

    %193
    \appoggiatura la sol4 fad8 \once\stemDown la'
    sib la16 sol la8 fad
    sol fa!16 mib re8 do

    %196
    sib sol' re, \once\stemDown fad'
    sol2\fermata

}

IvlIn =  \relative do'' {

    re8
    sol [sib la fad]
    sol4 re8 mib
    \appoggiatura re do4 sib8 mib

    %4
    \appoggiatura re do4 sib8 mib
    do sib16 do la8 do
    sib la16 sol sib8 do\mbreak

    %7
    re4 r8 re
    sol[sib la fad]
    sol4 re8 sol

    %10
    mib4 re8 sol
    mib4 re8 fad
    sol la16 sib la8 sol

    %13
    fad4 r8 re
    sib' sol4 fa?8
    mib re4 do8

    %16
    la' fa4 mib8
    re do4 sib8
    sol' mib4 re8\mbreak

    %19
    do[sib' la sol]
    fad4 r8 la,
    re[do re fad,]

    %22
    \appoggiatura fad? sol4 fad!8 la
    \appoggiatura la sol4 fad8 la
    \appoggiatura la sol4 \once\stemUp fad8 la'

    %25
    sib la16 sol la8 fad
    sol4 r8 sol,,\p
    sol[la sib sol]

    %28
    re'[do re sol]
    do,[sib do fad]
    sol[fad sol sol,]

    %31
    sol' la si si,\mbreak
    do[re mib la,]
    fa'[sol la la,]

    %34
    sib[do re sib]
    sib'[do re sib]
    sib,[do re sib]

    %37
    sib'[do re sib]
    sib,[mib la, fa']
    sib,[re mib la,]\mbreak

    %40
    sib[re mib la,]
    sib sib' la sol
    fa[mib re do]

    %43
    sib r re r
    mib r fa r
    sib, r re r

    %46
    mib r fa r
    sib,4 r8 fa''\f \mbreak
    sib fa sol sib,

    %49
    \appoggiatura sib la4 sib8 fa'
    \appoggiatura sib, la4 sib8 do
    re do16 sib re8 mib

    %52
    fa4. fa8
    sol[fa sol re]
    mib si do4~

    %55
    do8 re16 mib fa8 mib16 re\mbreak
    mib8 si do4~
    do8 re16 mib fa8 mib16 re

    %58
    sol8 si, do fa
    mib4 re
    do2~

    %61
    do8 si16 do re8 do16 si
    do8 si16 do re8 do16 si
    do8 sib!16 lab\mbreak sol8 fa

    %64
    mib4 re
    \once\stemUp do8 [mib' mib mib]
    mib?[mib mib mib]

    %67
    mib?[mib mib mib]
    do[do do fa]
    si,[si si fa']

    %70
    mib [mib mib mib]
    mib?[mib mib mib]
    mib?[mib mib mib]

    %73
    do[do fa fa]
    re[re re re]
    do[do do do]

    %76
    la?[la la la]
    sib[sib sib sib]
    sib[sib sib sib]

    %79
    sol[sol sol sol]
    lab[lab\mbreak lab lab]
    R2*3

    %84
    sib8\p[sib sib sib]
    sib[sib sib sib]
    do[do do do]

    %87
    do[do do do]
    re[re re re]
    re[re re re]

    %90
    mib [mib mib mib]\mbreak
    do[do do do]
    sib[sib sib sib]

    %93
    sib[sib sib sib]
    sib4 r
    R2

    %96
    r8 sib\f mib4~
    mib8[fa sol fa]
    mib4 sib8 mib

    %99
    \appoggiatura re do4 sib8 mib
    \appoggiatura re do4\mbreak sib8 lab  %%% inizio seconda pagina
    sol fa16 mib \parenthesize fa8 \parenthesize sol
    sib2

    %103
    si
    do16 re mib fa sol8 do,
    si la16 sol la8 si\mbreak

    %106
    do!2
    dod
    re16 mi fa sol la8 re,

    %109
    dod si16 la si8 dod
    \appoggiatura dod? re4. la8
    sib?4 la8 mi'

    %112
    fa4 mi8 la
    fa mi16 re mi8 dod
    re4 r

    %115
    R2*4
    fad8\p[fad fad fad]
    re[re re re]

    %121
    mi[mi mi mi]\mbreak
    do[do do do]
    re[re re re]

    %124
    si[si si si]
    dod[dod dod dod]
    la[la la la]

    %127
    la'[la la la]
    sol[sol sol sol]
    fa[fa fa fa]\mbreak

    %130
    mi mi mi la,
    la'[la la la]
    sol[sol sol sol]

    %133
    fa[fa fa fa]
    mi[mi mi mi]
    re[re re re]

    %136
    fa[fa fa fa]
    mi[mi mi mi]
    re4 r8 la\f

    %139
    re fa mi dod
    re4 la8 sib
    \appoggiatura la sol4 fa8 sib

    %142
    \appoggiatura la sol4 fa8 re'
    sol [sib la fad]
    sol4 re8 mib

    %145
    \appoggiatura re do4 sib8 mib
    \appoggiatura re do4 sib8 re
    sol la16 sib la8 sol

    %148
    fad mi re4
    sol,,8\p[sib do re]
    sol, sol' sib fad

    %151
    sol[sol, do re]
    sol,[la sib la]\mbreak
    sol[sib do re]

    %154
    sol, sol' fad re
    sol[sib la sol]
    fad[mi fad re]

    %157
    sol4 sol,
    do8[do re mi?]
    fa?2

    %160
    sib,8[sib do re]\mbreak
    mib4. do8
    re4 r

    %163
    re r
    re r
    re8[sol la fad]

    %166
    sol[la sib sol]
    la4 r
    R2*2

    %170
    re,8[do sib la]
    sol[sib do re]\mbreak
    sol, sol' la sol

    %173
    fad[sol la sol]
    fad[re sib la]
    sol[sib do re]

    %176
    sol, sol' sib fad
    sol[sib, do re]
    sol,[do sib la]\mbreak

    %179
    r do sib la
    r do sib la
    sol[sib do re]

    %182
    sol,4 r8 re''\f
    sib' sol4 fa?8
    mib re4 do8

    %185
    la' fa4 mib8
    re do4 sib8
    sol' mib4 re8\mbreak

    %188
    do[sib' la sol]
    fad4 r8 la,
    re[do re fad,]

    %191
    \appoggiatura fad? sol4 fad!8 la
    \appoggiatura la sol4 fad8 la
    \appoggiatura la sol4 \once\stemUp fad8 la'

    %194
    sib la16 sol la8 fad
    sol fa!16 mib re8 do
    sib sol' re, \once\stemDown fad'

    %197
    sol2\fermata

}

IvlIIn = \relative do'' {

    re8
    sib[re do la]
    sib4 la8 sib
    \appoggiatura sib la4 sol8 sib

    %4
    \appoggiatura sib la4 sol8 sib
    la re,4 la'8
    sol2\mbreak

    %7
    la4 r8 la
    sib[re do la]
    sib4 sib8 re

    %10
    do4 sib8 re
    do4 sib8 la
    sib do16 re do8 sib

    %13
    la4 r8 re
    sib' sol4 fa?8
    mib re4 do8

    %16
    la' fa4 mib8
    re do4 sib8
    sol' mib4 re8\mbreak

    %19
    do[sib' la sol]
    fad4 r8 la,
    re[do re la]

    %22
    \appoggiatura do sib4 la8 re
    \appoggiatura do sib4 la8 re
    \appoggiatura do sib4\mbreak la8 fad'

    %25
    sol[sib, do la]
    sib4 r8 sol,\p
    sol[la sib sol]

    %28
    re'[do re sol]
    do,[sib do fad]
    sol[fad sol sol,]

    %31
    sol' la si si,\mbreak
    do[re mib la,]
    fa'[sol la la,]

    %34
    sib[do re sib]
    sib'[do re sib]
    sib,[do re sib]

    %37
    sib'[do re sib]
    sib,[mib la, fa']
    sib,[re mib la,]\mbreak

    %40
    sib[re mib la,]
    sib sib' la sol
    fa[mib re do]

    %43
    sib r re r
    mib r fa r
    sib, r re r

    %46
    mib r fa r
    sib,4 r8 re'\f
    fa[re mib re]

    %49
    do4 re8 re
    do4 re8 do
    sib2

    %52
    la4 r8 do
    re4. si8
    do re mib4~

    %55
    mib8[do re si]
    do re mib4~\mbreak
    mib8[do re si]

    %58
    do[re mib re]
    do4 si
    mib2~

    %61
    mib8 re16 mib fa8 mib16 re
    mib8 re16 mib fa8 mib16 re
    mib8 fa, re4

    %64
    do\mbreak si
    do8[sol'\p sol sol]
    sol[sol sol sol]

    %67
    sol[sol sol sol]
    lab[lab lab lab]
    re,[re re' si]

    %70
    sol[sol sol sol]
    sol[sol sol sol]\mbreak
    sol[sol sol sol]

    %73
    lab8[lab lab lab]
    sol[sol sol sol]
    sol[sol sol sol]

    %76
    fad[fad fad fad]
    re[re re re]
    re[re re re]

    %79
    mi![mi\mbreak mi mi]
    do[do do do]
    R2*3

    %84
    fa8\p[fa fa fa]
    mib[mib mib mib]
    mib?[mib mib mib]

    %87
    fa[fa fa fa]
    fa[fa fa fa]
    sol[sol\mbreak sol sol]

    %90
    sol[sol sol do]
    lab[lab lab lab]
    fa[fa fa fa]

    %93
    fa[fa fa fa]
    mib4 r
    R2

    %96
    r4 r8 sol\f
    do sib4 lab8\mbreak
    sol4 sol8 sib

    %99
    lab4 sol8 sib
    lab4 sol8 sib
    sib lab16 sol lab8 sib

    %102
    fa4 fa'~
    fa re8 si
    sol do mib4

    %105
    re8 do16 si do8 re
    sol,4 sol'~
    sol mi8 dod

    %108
    la re fa4
    mi 8re16 dod re8 mi
    la,4. la8

    %111
    sol4 fa8 la
    re4 dod8 mi
    re fa, sol mi

    %114
    re4 r
    R2*4
    la'8\p[la la la]

    %120
    sib[sib sib sib]
    sol[sol sol sol]
    la[la la la]

    %123
    fa[fa fa fa]
    sol[sol sol sol]
    mi[mi mi mi]

    %126
    fa[fa\mbreak fa fa]
    fa'[fa fa fa]
    mi[mi dod dod]

    %129
    la[la la la]
    dod[dod dod dod]
    fa[fa fa fa]

    %132
    mi[mi dod dod]
    la[la\mbreak la la]
    dod[dod dod la]

    %135
    fa[fa fa fa]
    la[la la la]
    dod[dod dod la]

    %138
    fa4 r8 la\f
    fa[la sol mi]
    fa4 mi8 fa\mbreak

    %141
    \appoggiatura fa mi4 re8 fa
    \appoggiatura fa mi4 re8 la'
    sib[re do la]

    %144
    sib4 la8 sib
    \appoggiatura sib la4 sol8 sib
    \appoggiatura sib la4 sol8 sib

    %147
    sib do16 re do8 sib
    la2
    sol,8\p[sib do re]

    %150
    sol, sol' sib fad
    sol[sol, do re]
    sol,[la sib la]\mbreak
    sol[sib do re]

    %154
    sol, sol' fad re
    sol[sib la sol]
    fad[mi fad re]

    %157
    sol4 sol,
    do8[do re mi?]
    fa?2

    %160
    sib,8[sib do re]\mbreak
    mib4. do8
    re4 r

    %163
    re r
    re r
    re8[sol la fad]

    %166
    sol[la sib sol]
    la4 r
    R2*2

    %170
    re,8[do sib la]
    sol[sib do re]\mbreak
    sol, sol' la sol

    %173
    fad[sol la sol]
    fad[re sib la]
    sol[sib do re]

    %176
    sol, sol' sib fad
    sol[sib, do re]
    sol,[do sib la]\mbreak

    %179
    r do sib la
    r do sib la
    sol[sib do re]

    %182
    sol,4 r8 re''\f
    sib' sol4 fa?8
    mib re4 do8

    %185
    la' fa4 mib8
    re do4 sib8
    sol' mib4 re8\mbreak

    %188
    do[sib' la sol]
    fad4 r8 la,
    re[do re la]

    %191
    \appoggiatura do sib4 la8 do
    \appoggiatura do sib4 la8 re
    \appoggiatura do sib4 la8 fad'

    %194
    sol[sib, do la]
    sib4 la
    sol8 sol' re, fad'

    %197
    sol2\fermata

}

Ivlan =  \relative do' {

    r8
    re[re mib re]
    re4 re8 sol
    fad[re re sol]

    %4
    fad[re re sol]
    fad4. fad8
    re re do sib

    %7
    la4 r8 fad'
    re [re\mbreak mib re]
    re4 re8 sol

    %10
    sol[la sib sib]
    sol[la sib fad]
    re4 mib8 mi

    %13
    fad[sol la fad]
    re[sib' do re]
    sol,[mib fa sol]

    %16
    do,[la' sib do]
    fa,[re mib fa]
    sib,[sol' la sib]\mbreak

    %19
    fad[sol mib mi]
    la,[sol' la sol]
    fad[sol la fad]

    %22
    re mi la, fad'
    re mi la, fad'
    re mi la, re

    %25
    re[re mib re]
    re4 r
    R2*20

    %47
    r4 r8 re\f
    re re sib sol'
    la4\mbreak fa8 fa

    %50
    fa4 fa8 fa
    fa4. sol8
    do,4 r8 lab'

    %53
    sol2~
    sol8 sol4 mib8
    do4 si

    %56
    sol8 sol'4 mib8
    do4 si
    sol8[sol' sol si]

    %59
    sol lab re, sol
    sol[fa sol  mib]
    lab do, si4

    %62
    sol8 do\mbreak si4
    sol r8 si
    sol4 sol

    %65
    sol8 [do\p do do]
    do[do do do]
    do[do do do]

    %68
    fa,[fa fa fa]
    sol[sol sol sol]
    do[do do do]

    %71
    do[do do do]
    do[do do do]
    fa,[fa fa fa]

    %74
    sol[sol sol sol]
    mib'[mib mib mib]
    re[re re re]

    %77
    sol,[sol sol sol]
    sol[sol sol sol]
    do[do do do]

    %80
    fa,[fa fa fa]
    R2*3
    sib8\p[sib lab lab]

    %85
    sol[sol sol sol]
    lab[lab lab lab]
    la![la la la]

    %88
    sib[sib sib sib]
    si[si si si]
    do[do do do]

    %91
    fa,[fa fa fa]
    sib[sib sib sib]
    lab[lab lab lab]

    %94
    sol4 r
    R2
    r4 r8 mib'\f

    %97
    lab fa sib,4
    sib sib
    mib mib

    %100
    mib?4. fa8
    sol4 fa8 mib\mbreak
    re[mib fa re]

    %103
    re2
    mib4. sol8
    sol2~

    %106
    sol8[fa sol mi!]
    mi!2
    fa4. la8

    %109
    la2~
    la8[sol la fa]
    re mi la, mi'

    %112
    la,[si' mi, dod]
    la[la sib? la]
    fa4 r

    %115
    R2*4
    re'8\p [re re re]
    sol,[sol\mbreak sol sol]

    %121
    do[do do do]
    fa,[fa fa fa]
    sib[sib sib sib]

    %124
    mi,[mi mi mi]
    la[la la la]
    re[re re re]

    %127
    re[re re re]
    mi mi la, la
    re[re re re]

    %130
    la[la la la]
    re[re re re]
    mi mi\mbreak la, la

    %133
    re[re re re]
    la[la la la]
    re[re re re]

    %136
    re[re re re]
    la[la la la]
    re4 r8 fa\f

    %139
    la, fa' sib, la
    la4 la8 re
    \footnote #' (-1 . 3) \markup\column\smaller {"Battuta mancante in Le Cène""  "} \parenthesize dod4 \parenthesize la8 \parenthesize re8

    %142
    dod4 la8 fa'
    re[re mib re]\mbreak
    re4 re8 sol

    %145
    fad4 re8 sol
    fad4 re
    re mib8 mi

    %148
    la,2
    R2*34
    re8\f[sib' do re]

    %184
    sol,[mib fa sol]
    do,[la' sib do]
    fa,[re mib fa]

    %187
    sib,[sol' la sib]\mbreak
    fad[sol mib mi]
    la,[sol' la sol]

    %190
    fad[sol la fad]
    re mi la, fad'
    re mi la, fad'

    %193
    re mi la, re
    re[re mib re]
    re4 re

    %196
    re8 re16 mib re8 re'
    sib2\fermata

}

Ibcn = \relative do {

    r8
    sol sol' do, re
    sol, sol' fad sol
    la fad sol sol,

    %4
    la' fad sol sol,
    la' sol fad re\mbreak
    sol sib la sol

    %7
    fad8. mi16 re do sib la
    sol8 sol' do, re
    sol, sol' sib sol

    %10
    do fad, sol sol,
    do' fad, sol re
    sib sol' do, dod

    %13
    re mi fad re
    sol, sol'\mbreak la si
    do do, re mib?

    %16
    fa, fa' sol la
    sib sib, do re
    mib, mib' fa sol

    %19
    la, sol do dod
    re mi fad mi
    re mi fad re

    %22
    sol dod, re re,
    sol' dod,\mbreak re re,
    sol' dod, re re,

    %25
    sol sol' do, re
    sol,4 r
    R2*20

    %47
    sib8 do re sib\tu
    sib sib' mib, mi
    fa mib re sib

    %50
    fa' mib re la
    sib4 la8 sol
    fa fa'\mbreak lab fa

    %53
    si, la si sol
    do sol' mib do
    fa do sol' sol,

    %56
    do sol' mib do
    fa do sol' sol,
    mib' sol mib si

    %59
    do fa sol sol,
    do re mib do
    fa lab sol sol,\mbreak

    %62
    do lab' sol sol,
    do fa si, sol
    do do, sol'' sol,

    %65
    do4 r
    R2*15
    fa4\solo fa

    %82
    fa re
    mib~mib8 re16 do
    sib4 r

    %85
    R2*10
    mib4 sib
    mib8\tu fa\mbreak sol mib

    %97
    fa re mib sib
    mib fa sol fa
    mib fa sol fa

    %100
    mib re mib sib
    mib, mib' re do
    sib do re sib

    %103
    sol' lab sol fa
    mib re mib do\mbreak
    sol sol' sol fa

    %106
    mib re mib do
    la' sib la sol
    fa mi fa re

    %109
    la la' la sol
    fa mi fa re
    sol dod, re dod

    %112
    re sold la la,
    re re sol,? la\mbreak
    re,4 r

    %115
    re'\solo fa8 sol
    la4 r
    la, si8 dod

    %118
    re mi fa re
    R2*19
    re8\tu mi fa mi

    %139
    re re' sol, la
    re,, re' dod re
    mi dod re re,

    %142
    mi' dod\mbreak re re,
    r sol' do,? re
    sol, sol' fad sol

    %145
    la fad sol sol,
    la' fad sol sol,
    sol sol' do, dod

    %148
    re do? sib la
    sol4 r
    R2*32\mbreak

    %182
    sol8 la sib la
    sol sol'\tu la si
    do do, re mib

    %185
    fa, fa' sol la
    sib sib, do re
    mib, mib' fa sol

    %188
    la, sol do dod
    re mi fad mi\mbreak
    re mi fad re

    %191
    sol dod, re re,
    sol' dod, re re,
    sol' dod, re re,

    %194
    sol sol' do, re
    sol,4 fad
    sol8 sib16 do re8 re,

    %197
    sol2\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s4 s8 <_+>
    s s <6> <6>
    <6\\> <6 5> s <6->
    <6\\> <6 5> s <6->
    <6\\>4 <6 5>\mbreak
    s4 <6>
    <6> <_+>
    s <6 5>8<_+>
    s2
    <_->8 <7-> s4
    <_->8 <7-> s <_+>
    s s <_-> <6 5>
    <_+>2
    s4 s8 <6 5>
    <_->4 s8 <6>
    s4 s8 <6 5->
    s2*2
    <6\\>8 s <6 _-> <6 5>
    <_+>2
    <_+>
    s8 <7> <_+>4
    s8 <7> <_+>4
    s8 <7> <_+>4
    s4 <6 5 _->8 <_+>
    s2*22
    s4 s8 <7>
    s4 <6>
    s <6>8 <6>
    s2*2
    <6>2
    <_->8 <_!> <6 5!>4
    s <7 _!>
    <_->8 < _!> <6>4
    s <7 _!>
    <6>8 <_!> <6> <6 5>
    <_->4 <_!>
    <_-> s
    <_-> <7 _!>
    s8 <6> <7 _!>4
    <_-> <6 5>
    <_-> <_!>
    s2*16
    <_->2
    <6>4 <6>
    s2*13
    s4 <6->
    <7->2
    s
    <6 4->
    <6 4->4 <3>
    s <6>
    s <6>
    <7 _!>2
    <6>
    <_!>
    s
    <7 _+>
    <6>
    <_+>
    <6>
    s8 <6 5>  s <6>
    s8 <6 5> <_+>4
    s <6 5>8 <_+>
    s2*2
    <_+>2
    <_+>
    s2*21
    s4 <6 5>8 <_+>
    s4 <6>
    <6\\>8 <6 5> s s
    <6\\> <6 5> s4
    s4 <6 5>8 <_+>
    s4 <6>8 <6->
    <6> <6 5> s <6->
    <6\\> <6 5> s4
    s <_->8 <6 5>
    <_+>2
    s2*34
    s4 s8 <6 5>
    <_->4 s8 <6>
    <7->4 s8 <5->
    s2*2
    <6>4 <6 _->8 <6 5>
    <_+>2
    <_+>
    s8 <7> <_+>4
    s8 <7> <_+>4
    s8 <7> <_+>4
    s <6 5 _->8 <_+>
    s4 <6 5>
    s8 <6> <4> <_+>

}

forma = {

    \key re\minor
    \time 2/4
    \tempo 2 = 55
    \partial 8 s8
    s2*197
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

    R2.
    r8 sol sol[sol] sol sol
    mib'2.~

    %4
    mib8 mib? re[do] sib la
    sib2.
    la8 la la [re] mi? fad

    %7
    sol2.
    la
    r8 re, sol[sol] sol sib

    %10
    mib,2.~
    mib8 do fa fa fa la
    re,2.~\mbreak
    re8 sib mib mib mib sol

    %14
    do,2.
    la8\p(sib) sib(do) do(sib)
    la\pp(sib) sib(do) do(sib)

    %17
    la8\ppp(sib) sib(do) do(sib)
    la2.
    sol'4\solo sib32(la sol8.) la32(sol fad8.)

    %20
    sol4 re sol
    do,16(mib re do) fad(mib re do) la'(do, sib la)\mbreak
    sib la sol fad \grace fad8 sol2

    %23
    sib'4 re32(do sib8.) re32(do sib8.)
    la4 do32(sib la8.) do32(sib la8.)
    sol4 sib32(la sol8.) sib32(la sol8.)

    %26
    sol4\tr fad r
    fa!~fa16(la sol fa) sib(re, do sib)\mbreak
    do(la sol fa) mib'(do sib la) fa'(mib re do)

    %29
    re(do sib la sib2)
    fa'4 \appoggiatura sol8 fa16 (mi? fa8) \appoggiatura sol8 fa16 (mi fa8)
    sib4~sib16 la(sol fa mib re do sib)

    %32
    fa'4 \appoggiatura sol8 fa16 (mi? fa8) \appoggiatura sol8 fa16 (mi fa8)
    sib4. la16(sol fa mib re do)\mbreak
    re(sib la sib) do2\tr

    %35
    sib r4
    sib(re) fa
    si,~si16 re do si lab'4

    %38
    sol(fa) re
    mib16\parenthesize re do si \appoggiatura si8 do4 r
    do (mi!) sol

    %41
    dod,~dod16(mi re dod) sib'4
    la(sol) mi
    fad16(mi re dod) \grace dod8 re2\mbreak

    %44
    sib'4. re16(do sib la sol fa?)
    \once \override Slur.outside-staff-priority = #400 mib4\tr(mib\tr mib\tr)
    la4. do16\parentSlur (sib la sol fa mib)

    %47
    \once \override Slur.outside-staff-priority = #400 re4\tr(re\tr re\tr)
    sol4. sib16(la sol fa mib re)
    do(mib re do) fad?(mib re do) la'(do, sib la)

    %50
    sib (la sol fad) sol4 r8 sol'\mbreak
    la do sol4(fad\tr)
    \appoggiatura fad?8 sol2.

    %53
    dod,4(la') sol
    do,!4(la') do,
    sib16(sib' la) sol fad4.\tr sol8

    %56
    sol4 r r
    r8 sol,\f sol[sol] sol sol
    mib'2.~

    %59
    mib8 mib? re do sib la
    sib sib sib sib sib sib
    la8\p(sib) sib(do) do(sib)

    %62
    la\pp(sib) sib(do) do(sib)
    la la'\f sib sib la la
    sol2.\fermata

}

IIvlIn =  \relative do'' {

    R2.
    r8 sol sol[sol] sol sol
    mib'2.~

    %4
    mib8 mib? re[do] sib la
    sib2.
    la8 la la [re] mi? fad

    %7
    sol2.
    la
    r8 re, sol[sol] sol sib

    %10
    mib,2.~
    mib8 do fa fa fa la
    re,2.~\mbreak
    re8 sib mib mib mib sol

    %14
    do,2.
    la8\p(sib) sib(do) do(sib)
    la\pp(sib) sib(do) do(sib)

    %17
    la8\ppp(sib) sib(do) do(sib)
    la2.
    sol,4.\p sib8 do[re]\mbreak

    %20
    sol, la sib la sib sol
    la4 re fad
    sol8 re sib la sib sol

    %23
    r sol' sol[sol] sol sol
    fad fa fa fa fa fa
    mi mib mib mib mib mib

    %26
    re4 r r\mbreak
    r8 sib sib[sib] sib sib
    fa'2.

    %29
    r8 re re[re] re mib
    fa2.~
    fa8 fa fa fa fa mib

    %32
    re2.~
    re8 re re re re fa
    fa fa la la la la\mbreak

    %35
    fa re' re re re mib
    fa2.~
    fa

    %38
    R
    r8 mib mib[mib] mib fa
    sol2.~

    %41
    sol
    R2.*2
    r8 re\p re [re] re re

    %45
    mib mib mib mib mib mib
    mib? mib mib mib mib mib\mbreak
    re re re re re re

    %48
    re re re re re re
    do do do do do do
    sib sib sib sib sib sib

    %51
    la la la la la la
    sib sib sib sib re re
    dod dod dod dod dod dod\mbreak

    %54
    do! do do do do do
    sib sib la la la la
    sib4 r r

    %57
    r8 sol\f sol[sol] sol sol
    mib'2.~
    mib8 mib re do sib la

    %60
    sib sib sib sib sib sib
    la8\p(sib) sib(do) do(sib)
    la\pp(sib) sib(do) do(sib)

    %63
    la la'\f sib sib la la
    sol2.\fermata

}

IIvlIIn = \relative do'' {

    r8 sol sol[sol] sol sol
    re'2.~
    re8 re do[sib] la sol

    %4
    fad2.
    sol
    fad8 fad fad fad sol la

    %7
    sol sib do[re] mib sib
    do2.\mbreak
    sib4 r r

    %10
    r8 do do[do] do mib
    la,2.~
    la8 fa sib[sib] sib re

    %13
    sol,2.~
    sol8 mib la la la do
    fad,\p(sol) sol(la) la(sol)

    %16
    fad\pp(sol) sol(la) la(sol)
    fad\ppp(sol) sol(la) la(sol)
    fad2.

    %19
    sol,4.\p sib8 do[re]\mbreak
    sol, la sib la sib sol
    la4 re fad
    sol8 re sib la sib sol

    %23
    r sol' sol[sol] sol sol
    fad fa fa fa fa fa
    mi mib mib mib mib mib

    %26
    re4 r r\mbreak
    r8 sib sib[sib] sib sib
    fa'2.

    %29
    r8 sib, sib[sib] sib do
    re2.~\mbreak
    re8 re re re re do

    %32
    sib2.~
    sib8 sib sib sib sib la
    sib fa' fa fa fa fa

    %35
    fa sib sib[sib] sib do
    re2.~
    re

    %38
    R
    r8 do do[do] do re\mbreak
    mi!2.~

    %41
    mi
    R2.*2
    r8 sib\p sib[sib] sib sib

    %45
    sib sib sib sib sib sib
    la la la la la la
    la la la la la la

    %48
    sol sol sol sol sol sol\mbreak
    la la la la la la
    re, re re re re re

    %51
    mib mib re re re re
    re re re' re sib sib
    mi,! mi mi mi mi mi\mbreak

    %54
    la la la la la la
    re, re fad fad fad fad
    re sol\f sol sol sol sol

    %57
    re'2.~
    re8 re do[sib] la sol
    fad2.

    %60
    sol8 sol sol sol sol sol\mbreak
    fad\p(sol) sol(la) la(sol)
    fad\pp(sol) sol(la) la(sol)

    %63
    fad fad'\f sol sol fad fad
    sol2.\fermata

}

IIvlan =  \relative do' {

    R2.*5
    r8 re re [re] re re
    mib2.~

    %8
    mib8 mib? re[do] sib la
    sib4 r r
    r8 sol' sol[sol] sol mib

    %11
    do do do[do] do la\mbreak
    fa' fa fa fa fa re
    sib sib sib sib sib sol

    %14
    sol sol do[do] do do
    re2.\p~
    re\pp~

    %17
    re~\ppp
    re
    R2.*7

    %26
    r8 re\p re[re] re do\mbreak
    sib2.
    r8 la la[la] la la

    %29
    sib2.
    r8 sib sib[sib] sib do
    re2.~

    %32
    re8 re re re re do
    sib2~sib8 fa
    sib sib fa'[fa] fa, fa\mbreak

    %35
    sib4 r r
    R2.*7
    r8 re\p re[re] re re

    %44
    sol sol sol sol sol sol
    do, do do do do do
    fa fa fa fa fa fa\mbreak

    %47
    sib, sib sib sib sib sib
    mib mib mib mib mib mib
    fad, fad fad fad fad fad

    %50
    sol sol sol sol sol sol
    do do re[re] re, re\mbreak
    sol sol sol sol sol sol

    %53
    la la la la la la
    fad fad fad fad fad fad
    sol sol re'[re] re, re

    %56
    sol4 r r
    R2.*2\mbreak
    r8 la\f la[la] la re

    %60
    re re re re re re
    re2.~\p
    re\pp~

    %63
    re8 re\f re re re re
    sib2.\fermata

}

IIbcn = \relative do {

    R2.*4
    r8 sol sol[sol] sol sol
    re'2.~

    %7
    re8 re do sib la sol
    fad2.
    sol4 r r

    %10
    r8 do do[do] do do
    fa? fa fa fa fa fa\mbreak
    sib, sib sib sib sib sib

    %13
    mib mib mib mib mib mib
    mib? mib mib mib mib mib
    re2._\tasto~

    %16
    re\parentSlur(
    re)~
    re

    %19
    R2.*18\mbreak
    r8 sol,^\p sol[sol] sol sol
    sol' sol, sol sol sol sol

    %39
    do4 r r
    R2.
    r8 la la[la] la la

    %42
    la' la, la la la la\mbreak
    re4 r r
    R2.*14

    %58
    r8 do do[do] do do
    re re re re re re
    sol, sol sol sol sol sol

    %61
    re'2.~\mbreak
    re~
    re8 re sol,[sol] re' re,

    %64
    sol2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*5
    <_+>2.
    <4 2->
    <7->
    s
    s8 <_-> s4 s
    <7->2.
    <7>
    <7>
    <6>
    s2.*22
    s8 <_!> s2
    <_!>2.
    <_->
    s
    s8 <7 _+> s2
    <7 _+>2.
    <_+>
    s2.*14
    s8 <6 5 _-> s2
    <9 _+>4 <8>2
    s2.
    <_+>
    <_+>
    s2 <_+>4



}

forma = {

    \key re\minor
    \time 3/4
    \tempo 4 = 50
    s2.*64
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

IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \terzine
}

IIIvln = \relative do'' {

    sol'16 la sib8 fad
    sol re mib~
    mib re16 do sib la

    %4
    sib8 sol mib'\p ~
    mib re16 do sib la
    sib8 sol re'\f\mbreak

    %7
    do16 sib la8 sol
    fad mi re
    sol'16 la sib8 fad8

    %10
    sol re sib'~
    sib la16 sol fa? mi
    fa8 re sib'\p ~

    %13
    sib la16 sol fa mi
    fa8 re sol\f
    fa mi4\tr

    %16
    re4 r8
    re,16 do sib do re mib
    fa8 fa'4\mbreak

    %19
    mib,16 re do re mi fad
    sol8 sol'4
    fad,16 mi re mi fad sol

    %22
    la8 la'4
    sib4.
    la

    %25
    sol
    fad16 mi fad re mi fad
    sol8 re sol

    %28
    la fad4\tr
    sol16\solo mib re do sib la
    sol mib re do sib la

    %31
    \once\stemUp sol8 sib'' sol
    fad16 mi? re8 r
    sol16 mib re do sib la

    %34
    sol mib re do sib la
    \once\stemUp sol8 sib'' sol
    sol4\tr fad8

    %37
    sib16(do re4)
    mib,16(fa sol4)
    la16(sib do4)\mbreak

    %40
    re,16(mib fa4)
    sol16(la sib4)
    \tuplet 3/2 { do,16(re mib } mib8 mib)

    %43
    \tuplet 3/2 { la,16 (sib do } do8 do)
    re16 sib la sib re sib
    fa'4.

    %46
    re16 sib la sib re sib
    sol'4.
    re16 sib la sib re sib

    %49
    la'4.
    sib8 la16 sol fa mib\mbreak
    \tuplet 3/2 { re(do sib)}  do4\tr

    %52
    sib r8
    sib'16(la sol fa mi!8)
    fa16(mib re do sib8)

    %55
    mib16(do) do4\tr
    sib16\tu do re8 la
    sib fa' sol~

    %58
    sol fa16 mib re do
    re8 sib sol'\p~
    sol fa16 mib re do

    %61
    re8 sib r\mbreak
    do16\f re mib8 si
    do sol' lab~

    %64
    lab sol16 fa mib re
    mib8 do lab'\p~
    lab sol16 fa mib re

    %67
    mib8 do r
    sol16\f fa mib fa sol lab
    sib8 fa'4

    %70
    lab,16 sol fa sol la si
    do8 sol'4\mbreak
    si,16 la sol la si do

    %73
    re8 fa4
    sol4.
    fa

    %76
    mib
    re16 do re si do re
    mib8 fa re

    %79
    do16\solo(mib sol lab sol8)
    si, la sol
    re16(sol si do re8)

    %82
    mib re do
    sol,16(do mib fa sol8)\mbreak
    si,8 la sol

    %85
    r16 mib'' re do mib sol
    \once\stemDown lab8 fa, mib
    re16 re' do sib re fa

    %88
    \once\stemDown sol8 mib, re
    do16 do' sib lab do mib
    \once\stemDown fa8 re, do

    %91
    si16 si' la sol si re
    mib8 do r
    lab'4.~\mbreak

    %94
    lab8 do (lab!)
    fad fad4(
    sol8) sib \parentSlur (sol)

    %97
    mi mi4(
    fa?8) lab(fa)
    re re(mib)~

    %100
    mib re16 do sib lab
    sol mib lab mib sib' mib,
    do' mib,? re' mib,! mib'8

    %103
    lab sol16(fa) mib(re)
    mib8 re16(do) sib(lab)\mbreak
    sol mib lab mib sib' mib,

    %106
    do' mib,? re' mib,! mib'8
    mib, fa4\tr
    \once\stemUp mib8\tu sol' re

    %109
    mib sib do~
    do8 sib16 lab sol fa
    sol8 mib do'~ \p

    %112
    do8 sib16 lab sol fa
    sol8 mib\once\stemDown sib''\f
    lab16 sol fa8 mib\mbreak

    %115
    re16 do sib8 r
    fa'16 sol lab8 mi!
    fa do reb~\p

    %118
    reb do16 sib lab sol
    lab8 fa reb'\p~
    reb do16 sib lab sol

    %121
    lab8 fa \once\stemDown lab'\f ~
    lab8 sol fa
    mib do sib'~

    %124
    sib la? sol
    fa re re'~
    re do16 sib la sol

    %127
    fa8 la re
    fa, mi4\tr
    re16\solo fa la re la fa

    %130
    re fa la re la fa
    la, dod mi la mi dod
    la dod mi la mi dod

    %133
    re, fa la re la fa
    re fa la re la fa\mbreak
    dod8 si la

    %136
    re'16 fa la re la fa
    re8 re'(si)
    \appoggiatura si?8 do4.

    %139
    do,16 mib? sol do sol mib
    do8 do'(la)
    \appoggiatura la8 sib4.

    %142
    sib,16 re fa sib fa re
    sib8 sib'! sold
    \appoggiatura sold? la4.

    %145
    sib8(la sold)
    sol!(fa mi)\mbreak
    mib(re dod)

    %148
    re16 mi? fa sol la8
    re, mi4\tr
    re16\tu mi fa8 dod

    %151
    re la sib'~
    sib la16 sol fa mi
    fa8 mi re

    %154
    sol16 la sib8 fad
    sol re mib~
    mib re16 do sib la

    %157
    sib8 la sol
    re16 do sib do re mib\mbreak
    fa8 fa'4

    %160
    mib,16 re do re mi fad
    sol8 sol'4
    fad,16 mi re mi fad sol

    %163
    la8 la'4
    sib4.
    la

    %166
    sol
    fad16 mi re8 re
    sib'16\solo fad sol re mib do

    %169
    re sib do la sib fad\mbreak
    sol re mib do re la
    sib8 sol r

    %172
    fad''16 la fad la do, la'
    si, re si re fa,? re'
    mi, sol' mi sol sib, ?sol'

    %175
    la, do la do mib, do'
    re, fa' re fa la, fa'
    sol, mib' do mib la, mib'\mbreak

    %178
    fad,(do' mib do si do)
    fad,(do' mib do si do)
    fad8(sol la)

    %181
    r16 do,(mib do si do)
    fad,(do' mib do si do)
    la'8(sib do)

    %184
    r16 la fad la do, mib
    la, do la do fad, do'\mbreak
    re,4 sol'8

    %187
    sib32(la sol8.) sib8\noBeam
    la32(sol fad8.) la8\noBeam
    sol(re) mib

    %190
    re32(do sib8.) re8\noBeam
    do32(sib la8.) do8\noBeam
    sib sol sol'

    %193
    sib32(la sol8.) sib8\noBeam
    la32(sol fad8.) la8\noBeam
    sol16 mib re do sib la\mbreak

    %196
    sol mib re do sib la
    sol4 sol''8
    \tuplet 3/2 { sib16(la sol) sib[(la sol)] la(sol fad) }

    %199
    sol16\tu la sib8 fad
    sol re mib~
    mib re16 do sib la

    %202
    sib8 sol mib'\p ~
    mib re16 do sib la
    sib8 la sol

    %205
    re16\f do sib do re mib\mbreak
    fa8 fa'4
    mib,16 re do re mi fad

    %208
    sol8 sol'4
    fad,16 mi re mi fad sol
    la8 la'4

    %211
    sib4.
    la
    sol

    %214
    fad16 mi fad re mi fad
    sol8 re sol
    la fad4\tr

    %217
    sol4\fermata r8

}

IIIvlIn =  \relative do'' {

    sol'16 la sib8 fad
    sol re mib~
    mib re16 do sib la

    %4
    sib8 sol mib'\p ~
    mib re16 do sib la
    sib8 sol re'\f\mbreak

    %7
    do16 sib la8 sol
    fad mi re
    sol'16 la sib8 fad8

    %10
    sol re sib'~
    sib la16 sol fa? mi
    fa8 re sib'\p ~

    %13
    sib la16 sol fa mi
    fa8 re sol\f
    fa mi4\tr

    %16
    re4 r8
    re,16 do sib do re mib
    fa8 fa'4\mbreak

    %19
    mib,16 re do re mi fad
    sol8 sol'4
    fad,16 mi re mi fad sol

    %22
    la8 la'4
    sib4.
    la

    %25
    sol
    fad16 mi fad re mi fad
    sol8 re sol

    %28
    la fad4\tr
    sol4 r8
    R4.*7

    %37
    re8\p re sib
    mib mib mib
    mib? mib mib

    %40
    re re re
    re re re
    do do do\mbreak

    %43
    do do do
    sib4 r8
    sib fa re

    %46
    sib4 r8
    sib' sol mib
    sib4 r8

    %49
    do' la fa
    sib, fa' la
    sib mib, fa

    %52
    sib,16 sol' fa mib re do
    sib4.
    la4 sib8\mbreak

    %55
    sol'16 mib fa8 fa
    sib16\f do re8 la
    sib fa' sol~

    %58
    sol fa16 mib re do
    re8 sib sol'\p~
    sol fa16 mib re do

    %61
    re8 sib r\mbreak
    do16\f re mib8 si
    do sol' lab~

    %64
    lab sol16 fa mib? re
    mib8 do lab'\p~
    lab sol16 fa mib re

    %67
    mib8 do r
    sol16\f fa mib fa sol lab
    sib8 fa'4

    %70
    lab,16 sol fa sol la si
    do8 sol'4\mbreak
    si,16 la sol la si do

    %73
    re8 fa4
    sol4.
    fa

    %76
    mib
    re16 do re si do re
    mib8 fa re

    %79
    do4 r8
    R4.*13
    mib8\p mib mib

    %94
    mib? mib mib
    re re re
    re re re\mbreak

    %97
    do do do
    do do do
    sib sib sib

    %100
    R4.*8
    mib16\f fa sol8 re
    mib sib do~

    %110
    do8 sib16 lab sol fa
    sol8 mib do'~ \p

    %112
    do8 sib16 lab sol fa
    sol8 mib\once\stemDown sib''\f
    lab16 sol fa8 mib\mbreak

    %115
    re16 do sib8 r
    fa'16 sol lab8 mi!
    fa do reb~\p

    %118
    reb do16 sib lab sol
    lab8 fa reb'\p~
    reb do16 sib lab sol

    %121
    lab8 fa \once\stemDown lab'\f ~
    lab8 sol fa
    mib do sib'~

    %124
    sib la? sol
    fa re re'~
    re do16 sib la sol

    %127
    fa8 la re
    fa, mi4\tr
    re4 r8

    %130
    R4.*7
    fa8\p fa fa\mbreak
    mib mib mib

    %139
    R4.
    mib8 mib mib
    re re re

    %142
    R4.
    re8 re re
    dod dod dod

    %145
    re4.
    dod8 re la
    sol4.

    %148
    fa8 mi dod
    re la' la,
    re'16\f mi fa8 dod

    %151
    re la sib'~
    sib la16 sol fa mi
    fa8 mi re

    %154
    sol16 la sib8 fad
    sol re mib~
    mib re16 do sib la

    %157
    sib8 la sol
    re16 do sib do re mib\mbreak
    fa8 fa'4

    %160
    mib,16 re do re mi fad
    sol8 sol'4
    fad,16 mi re mi fad sol

    %163
    la8 la'4
    sib4.
    la

    %166
    sol
    fad16 mi re8 r
    R4.*19

    %187
    sol,8\p sib sol\mbreak
    fad re fad
    sol sol, fad'

    %190
    sol sol, sib'
    la fad re
    sol sib, sol

    %193
    sol' sib sol
    fad re fad
    sol4 r8

    %196
    sol,4 r8
    sol sib sol
    sol' re' re,\mbreak

    %199
    sol'16\f la sib8 fad
    sol re mib~
    mib re16 do sib la

    %202
    sib8 sol mib'\p ~
    mib re16 do sib la
    sib8 la sol

    %205
    re16\f do sib do re mib\mbreak
    fa8 fa'4
    mib,16 re do re mi fad

    %208
    sol8 sol'4
    fad,16 mi re mi fad sol
    la8 la'4

    %211
    sib4.
    la
    sol

    %214
    fad16 mi fad re mi fad
    sol8 re sol
    la fad4\tr

    %217
    sol4\fermata r8

}

IIIvlIIn = \relative do'' {

    sib16 do re8 re
    sib4 do8~
    do la fad

    %4
    re4 do'8\p~
    do la fad
    re4 sib'8\f

    %7
    sol4 mi8
    re4 r8
    sib'16 do re8 re

    %10
    sib4 sol'8~
    sol mi dod
    la4 sol'8\p~

    %13
    sol mi dod
    la4 re8\f
    re4 dod8

    %16
    re4 r8\mbreak
    re,16 do? sib do re mib
    fa8 la'4\mbreak

    %19
    mib,16 re do re mi fad
    sol8 sib'4
    fad,16 mi re mi fad sol

    %22
    la8 fad'4
    sol4.
    fad

    %25
    sib
    la16 sol la fad sol la\mbreak
    sib8 sol re

    %28
    mib la,4\tr
    sol r8
    R4.*7

    %37
    sib8\p sib sol
    sol sol do
    la la la

    %40
    fa fa sib
    sol sol mib
    sol sol sol

    %43
    la la la
    fa4 r8\mbreak
    sib fa re

    %46
    sib4 r8
    sib' sol mib
    sib4 r8

    %49
    do' la fa
    sib, fa' la
    sib mib, fa

    %52
    sib,16 sol' fa mib re do
    sib4.
    la4 sib8\mbreak

    %55
    sol'16 mib fa8 fa
    re'16\f mib fa8 fa
    re4 mib8~

    %58
    mib do la
    fa4 mib'8\p~
    mib do la

    %61
    fa4 r8
    mib'16\f fa sol8 sol
    mib4 fa8~

    %64
    fa re si\mbreak
    sol4 fa'8\p~
    fa re si

    %67
    sol4 r8
    sol16\f fa mib fa sol lab
    sib8 lab'4

    %70
    lab,16 sol fa sol la si
    do8 mib4\mbreak
    si16 la sol la si do

    %73
    re8 re4
    mib4.
    re

    %76
    do
    si16 la si sol la si
    do8 re si

    %79
    do4 r8
    R4.*13
    lab'8\p lab lab

    %94
    lab? lab lab
    la! la la
    sol sol sol\mbreak

    %97
    sol sol sol
    fa fa fa
    fa fa mib

    %100
    R4.*8
    sol,16\f lab sib8 sib
    sol4 lab8~

    %110
    lab fa re
    sib4 lab'8\p~
    lab fa re

    %113
    sib4 mib'8\f
    do16 sib lab8 lab\mbreak
    fa fa r

    %116
    lab16 sib do8 do
    lab4 sib8~
    sib sol mi!

    %119
    do4 sib'8\p ~
    sib sol mi
    do4 fa'8\f ~

    %122
    fa mib re
    do4 sol'8~
    sol fa mi?

    %125
    re4 la'8
    sol mi dod\mbreak
    la4 fa'8

    %128
    re dod4\tr
    re4 r8
    R4.*7

    %137
    si8\p si si
    sol sol sol
    R4.

    %140
    la8 la la
    fa fa fa
    R4.

    %143
    fa'8 fa sold,
    mi mi mi
    re'4.

    %146
    dod8 re la\mbreak
    sol4.
    fa8 mi dod

    %149
    re la' la,
    fa''16\f sol la8 la
    fa4 sol8~

    %152
    sol mi dod
    la4 r8
    sib16 do re8 re

    %155
    sib4 do8~
    do la fad
    re4 r8\mbreak

    %158
    re16 do sib do re mib
    fa8 la'4\mbreak
    mib,16 re do re mi fad

    %161
    sol8 sib'4
    fad,16 mi re mi fad sol
    la8 fad'4

    %164
    sol4.
    fad
    re\mbreak

    %167
    re8 la r
    R4.*19

    %187
    sol8\p sib sol\mbreak
    fad re fad
    sol sol, fad'

    %190
    sol sol, sib'
    la fad re
    sol sib, sol

    %193
    sol' sib sol
    fad re fad
    sol4 r8

    %196
    sol,4 r8
    sol sib sol
    sol' re' re,

    %199
    sib'16\f do re8 re
    sib4 do8~
    do la fad

    %202
    re4 do'8\p~
    do la fad
    re4 re8

    %205
    re16\f do sib do re mib
    fa8 la'4
    mib,16 re do re mi fad

    %208
    sol8 sib'4
    fad,16 mi re mi fad sol
    la8 fad'4

    %211
    sol4.
    fad
    sib

    %214
    la16 sol la fad sol la
    sib8 sol re
    mib la,4\tr

    %217
    sol4\fermata r8

}

IIIvlan =  \relative do' {

    re4 re8
    re4 sol8
    la fad re

    %4
    sib4 sol'8\p
    la fad re
    sib4 sol'8\f

    %7
    mi4 dod8
    la4 r8
    re4 re8

    %10
    re4 re'8
    mi dod la
    fa4 re'8\p\mbreak

    %13
    mi dod la
    fa4 re8\f
    la'4 la8

    %16
    fa4 r8
    re16 do sib do re mib
    fa4 r8

    %19
    mib16 re do re mi fad
    sol4 r8
    fad16 mi re mi fad sol\mbreak

    %22
    la4 r8
    re4.
    re

    %25
    re
    re
    re8 sib sol

    %28
    mib re4
    sib r8
    R4.*7

    %37
    sol8\p sol sol
    do do do
    fa, fa fa

    %40
    sib sib sib\mbreak
    mib mib mib
    mib? mib mib

    %43
    fa fa fa
    sib,4 r8
    sib' fa re

    %46
    sib4 r8
    sib' sol mib
    sib4 r8

    %49
    do' la fa
    sib, fa' la\mbreak
    sib mib, fa

    %52
    sib,16 sol' fa mib re do
    sib4.
    la4 sib8

    %55
    sol'16 mib fa8 fa,
    fa'4\f fa8
    fa4 sib8

    %58
    do la fa
    re4 sib'8\p\mbreak
    do la fa

    %61
    re4 r8
    sol4\f sol8
    sol  mib do'

    %64
    re si sol
    mib4 do'8\p
    re si sol

    %67
    mib4 r8
    sol16\f fa mib fa sol lab\mbreak
    sib4 r8

    %70
    lab16 sol fa sol la si
    do4 r8
    si16 la sol la si do

    %73
    re4 r8
    sol,4.
    si

    %76
    sol
    sol
    sol8 lab sol\mbreak

    %79
    mib4 r8
    R4.*13
    do'8\p do do

    %94
    do do do
    do do do
    sib sib sib

    %97
    sib sib sib
    lab lab lab
    lab? lab sol

    %100
    R4.*8\mbreak
    sib,4\f sib8
    sib4 mib8

    %110
    fa re sib
    sol4 mib'8\p
    fa re sib
    sol4 sol'8\f

    %114
    lab fa do
    sib4 r8
    do4 do8

    %117
    do4 fa8
    sol mi! do\mbreak
    lab4 fa'8\p

    %120
    sol mi! do
    lab4 do8\f
    re si4

    %123
    sol mib'8
    mi! dod4
    la4 re8

    %126
    mi4.
    fa4 la8
    la la4
    fa4 r8

    %130
    R4.*7\mbreak
    sol,8\p sol sol
    do do do

    %139
    R4.
    fa,8 fa fa
    sib sib sib

    %142
    R4.
    re8 re mi
    la, la la

    %145
    re'4.
    dod8 re la
    sol4.\mbreak

    %148
    fa8 mi dod
    re la' la,
    la'4\f la8

    %151
    la4 re8
    mi dod la
    fa4 r8

    %154
    re4 re8
    re4 sol8
    la fad re

    %157
    sib4 r8\mbreak
    re16 do sib do re mib
    fa4 r8

    %160
    mib16 re do re mi fad
    sol4 r8
    fad16 mi re mi fad sol

    %163
    la4 r8\mbreak
    sol16 fad sol la sib sol
    re do re mi fad re

    %166
    sol fad sol la sib sol
    re'8 fad, r
    R4.*31

    %199
    re4\f re8
    re4 sol8
    la fad re

    %202
    sib4 sol'8\p
    la fad re
    sib la sib

    %205
    re16\f do sib do re mib
    fa4 r8\mbreak
    mib16 re do re mi fad

    %208
    sol4 r8
    fad16 mi re mi fad sol
    la4 r8

    %211
    re4.
    re
    re

    %214
    re
    re8 sib sol\mbreak
    mib re4

    %217
    sib\fermata r8

}

IIIbcn = \relative do {

    sol'4 re8
    sol,4 do'8
    fad,4.

    %4
    sol8 \once\stemUp sol, do'^\p
    fad,4.
    sol8 sol, sol'\f

    %7
    do,4 dod8\mbreak
    re mi fad
    sol4 re8

    %10
    sol,4 sol'8
    dod,4.
    re8 re, sol'\p

    %13
    dod,4.
    re8 re, sib''^\f
    la la,4

    %16
    re, r8
    re'16 do? sib do re mib\mbreak
    fa4 r8

    %19
    mib16 re do re mi fad
    sol4 r8
    fad16 mi re mi fad sol

    %22
    la4 r8
    sol16 fad sol la sib sol\mbreak
    re do re mi fad re

    %25
    sol fad sol la sib sol
    re4 r8
    sol16 fad sol la sib sol

    %28
    do,8 re re,
    sol4\solo r8
    sol4 r8\mbreak

    %31
    sol4 r8
    re'8. do16 sib la
    sol4 r8

    %34
    sol4 r8
    sol4 r8
    re'16 do re mi fad re

    %37
    sol4 r8
    R4.*18
    sib4\tu fa8\mbreak

    %57
    sib,4 mib'8
    la,4.
    sib8 \once\stemUp sib, mib'^\p

    %60
    la,4.
    sib8 sib, si'
    do4 sol8^\f

    %63
    do,4 fa8
    si,4.
    do8 do, fa'^\p

    %66
    si,4.
    do8 do, r\mbreak
    sol''16^\f fa mib fa sol lab

    %69
    sib4 r8
    lab16 sol fa sol la si
    do4 r8

    %72
    si16 la sol la si do
    re4 r8\mbreak
    do,16 si do re mib do

    %75
    sol' fa sol la si sol
    do, si do re mib do
    sol'4.

    %78
    do,8 fa, sol
    do,4\solo r8
    sol'4 r8\mbreak

    %81
    si4 r8
    do4 r8
    do4 r8

    %84
    sol4 r8
    do4 r8
    r fa mib

    %87
    re4 r8
    r mib re
    do4 r8

    %90
    r re do
    si4 r8\mbreak
    do16 re mib re do si

    %93
    do4 r8
    R4.*6
    mib4 r8

    %101
    mib? mib mib
    mib? mib mib
    R4.*2

    %105
    mib8 mib mib
    mib? mib mib\mbreak
    mib? sib' sib,

    %108
    mib4\tu sib8
    mib,4 lab'8
    re,4.

    %111
    mib8 mib, lab'\p
    re,4.
    mib8 mib, mib'\f

    %114
    fa4.
    sib,8 sib' mi,?
    fa4 do8\mbreak

    %117
    fa,4 sib'8
    mi,!4.
    fa8 \once\stemUp fa, sib'^\p

    %120
    mi,4.
    fa8 fa, fa'\f
    si,4.

    %123
    do
    dod
    re8 re, fa'

    %126
    mi4.
    re8 re, re'
    la' la, la'\mbreak

    %129
    re,4\solo r8
    re4 r8
    dod4 r8

    %132
    dod?4 r8
    re4 r8
    re4 r8

    %135
    la4 r8
    re4 r8
    R4.*2

    %139
    do4 r8
    R4.*2
    sib4 r8

    %143
    R4.*7
    re'4\tu la8\mbreak
    re,4 sol8

    %152
    dod,4.
    re8 mi fad
    sol4 re8

    %155
    sol,4 do'8
    fad,4.
    sol8 re sol,

    %158
    re'16 do  sib do re mib
    fa4 r8
    mib16 re do re mi fad\mbreak

    %161
    sol4 r8
    fad16 mi re mi fad sol
    la4 r8

    %164
    sol16 fad sol la sib sol
    re do re mi fad re
    sol fad sol la sib sol\mbreak

    %167
    re8 re, r
    sol4\solo r8
    sol4 r8

    %170
    sol4 r8
    sol'16 fad sol la sib do
    re4.

    %173
    sol,
    do
    fa,

    %176
    sib
    mib,
    re4 r8

    %179
    re4 r8\mbreak
    re4 r8
    re4 r8

    %182
    re4 r8
    re4 r8
    re4 r8

    %185
    re4 r8
    re4 r8
    R4.*12

    %199
    sol4\tu re8
    sol,4 do'8
    fad,4.

    %202
    sol8 \once\stemUp sol, do'\parenthesize ^\p
    fad,4.\mbreak
    sol4 sol,8

    %205
    re'16^\f do sib do re mib
    fa4 r8
    mib16 re do re mi fad

    %208
    sol4 r8
    fad16 mi re mi fad sol
    la4 r8\mbreak

    %211
    sol16 fad sol la sib sol
    re do re mi fad re
    sol fad sol la sib sol

    %214
    re4 r8
    sol16 fad sol la sib sol\mbreak
    do,8 re re,

    %217
    sol4\fermata r8

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <_+>8
    s4 <_->8
    <7->4.
    s4 <_->8
    <7->4.
    s
    s4 <6 5>8
    <_+>4.
    s4 <_+>8
    s4.
    <7>
    s
    <7>
    s4 <6>8
    s <4+>4s4.*5
    <6>4.
    <6\\>
    s
    <_+>
    s
    <_+>
    s
    <6 5 _->8 <4> <_+>
    s4.*3
    <_+>4.
    s4.*3
    <4>8 <_+> s
    s4.*20
    s4 <6>8
    <7>4.
    s4 <6>8
    <7>4.
    s4 <6>8
    s4 <_!>8
    <_->4 <_->8
    <7->4.
    <_->8 s <_->
    <7->4.
    <_->
    <6->
    s
    <6>
    <_->
    <6>
    s
    <_->
    <7 _!>
    <_->
    <_!>
    <_->8 s <_!>
    <_->4.
    <_!>  %%% fine pagina
    <6>
    <_->
    s
    <_!>
    <_->
    s8 <_->4
    <6>4.
    s8 <6>4
    <_->4.
    s8 <6!>4
    <6 5>4.
    <_->
    <6- _->
    s4.*7
    s8 <6 4-> <5 3>
    <6 4-> <7 5> <5 3>
    s4.*2
    s8 <6 4-> <5 3>
    <6 4-> <7 5> s
    s4.*3
    <7>4.
    s
    <7>
    s
    <_->
    s4 <6 5>8
    <_->4 <_!>8
    <_->4 <_->8
    <7->4.
    <_->4 <_->8
    <7->4.
    <_->
    <7->
    <_->
    <7>
    s4 <6>8
    <7>4 <6\\>8
    s4.
    <4>8 s <_+>
    s4.*2
    <6>4.
    s4.*3
    <_+>4.
    s
    s4.*13
    s4 <_+>8
    s4.
    <7>
    <_!>4 <6>8
    s4 <_+>8
    s4 <_->8
    <7->4.
    s8 <_+>4
    s4.*4
    <6>4.
    s
    s
    <_+>
    s4.*6
    <_+>4.
    <_!>
    s4.*4
    <7- _+>4.
    <7- _+>
    <_+>
    s4.*5
    <_+>4.
    s4.*12
    s4 <_+>8
    s4 <_->8
    <7->4.
    s4 <_->8
    <7->4.
    s
    <6>
    s
    s
    s
    <6>
    s
    s
    <_+>
    s
    <_+>
    s
    <7 5>8 <4> <_+>

}

forma = {

    \key re\minor
    \time 3/8
    \tempo 4. = 70
    s4.*217
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

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
  title = \markup\smaller {"Concerto I Op. 12 [RV 317]"}
  composer = \markup \center-column{"   ""A. Vivaldi (1678-1741)"}
}

\markup\huge "[1.] Allegro"

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
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

\pageBreak\markup\huge "[2.] Largo"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
        >>
    >>

    \layout {

        indent = 1\cm

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

\pageBreak

\markup\huge "[3.] Allegro"

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
    } <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \IIIvl
        >>

        \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \IIIvlII
            >>
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

