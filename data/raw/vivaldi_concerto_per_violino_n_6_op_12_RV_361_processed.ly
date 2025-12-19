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

    fa,8
    sib sib4 sib8
    fa' fa4 fa8
    sib la16 sol fa mib re do

    %4
    sib8 fa4 sib8
    do do4 re8
    mib fa,4 mib'8

    %7
    mib re r fa
    sib sib4 re,8\mbreak
    mib mib4 do8

    %10
    la' la4 do,8
    re re4 sib8
    sol' sol4 sib,8

    %13
    la fa4 mi'8
    fa8 mib!16(re) do(sib) la(sib)
    do8 fa,4 mi'8
    fa mib!16(re) do(sib) la(sib)

    %17
    do8 fa,4 fa'8
    sib la16(sol) fa(mib) re(mib)
    fa8 sib,4 la'8\mbreak

    %20
    sib la16(sol) fa(mib) re(mib)
    fa8 sib, r lab'
    sol16 lab sib8 r sib,

    %23
    la?16 sib do8 r do'
    sib16 do re8 r sib,
    la 16 sol' fa8~ fa16 sol fa8~

    %26
    fa16 sol fa8~fa16 re do sib
    do sol' fa8~fa16 sol fa8~
    fa16 sol fa8~\mbreak fa16 do sib la

    %29
    sib sol' fa8~fa16 sol fa8~
    fa16 sol fa8~fa16 sib, la sol
    la8 fa' reb4~

    %32
    reb8 do sib4~
    sib8 la16 sol fa8 mib
    re sib' do la

    %35
    sib fa'\p reb4~
    reb8 do sib4~
    sib8 la16 sol  fa8 mib

    %38
    re8 [sib'\mbreak do la]
    sib sib'4\solo la16 sol
    fa mib re4 do8

    %41
    sib sib'4 la16 sol
    fa mib re4 do8
    sib re'4 do16 sib
    la sol fa8 r fa

    %45
    sib16 fa re sib fa' re sib fa
    re' sib fa re sib' fa re sib
    la8 sol'4 fa16 mib %%%% fine Vta riga

    %48
    re do sib8 r fa''
    re16 fa sib, fa' re fa sib, fa'
    do fa la, fa' do fa la, fa'

    %51
    re16 fa sib, fa' re fa sib, fa'
    do8 fa, r sol'
    mib16 sol do, sol' mib sol do, sol'

    %54
    re sol si, sol' re sol si, sol'\mbreak
    mib16 sol do, sol' mib sol do, sol'
    re8 sol, r la'

    %57
    fa16 la re, la' fa la re, la'
    mi la dod, la' mi la dod, la'
    fa la re, la' fa la re, la'

    %60
    mi8 la, r la'
    \tuplet 3/2 { re16 re,(mi fa[mi re)] }\mbreak la\staccatissimo re\staccatissimo sib'\staccatissimo la\staccatissimo
    sib8 \once\stemUp sol, sib re

    %63
    \tuplet 3/2 { do'16 do,(re mi[re do)] } sol\staccatissimo do\staccatissimo do'\staccatissimo sol\staccatissimo
    \stemDown la8[\stemUp fa, la do]\stemNeutral
    \tuplet 3/2 { sib'16 sib, (do re[do sib)]} fa\staccatissimo sib\staccatissimo sib'\staccatissimo fa\staccatissimo

    %66
    \stemDown sol8[\stemUp mi, la dod]\stemNeutral
    \tuplet 3/2 { la'16 la,(si dod[si la)] sol' la,(si dod[si la)]}
    fa'4 r8 fa

    %69
    mi[(sold la) re,]
    dod16. la32 re16. sol32 fa8 mi\tr
    re4. fa8

    %72
    mi?[(sold la) re,]
    dod16. la32 re16. sol32 fa8 mi\tr
    re\tu re4 re8

    %75
    la' la4 la8
    re do16 sib\mbreak la sol fa mi
    re8 la4 re8

    %78
    mi mi4 fa8
    sol la,4 sol'8
    sol\tr fa r sold

    %81
    la sol!16(fa) mi(re) dod(re)
    mi8 la,4 sold'8
    la sol!16(fa) mi(re) dod(re)

    %84
    mi8 la,4 la'8
    re do16(sib)\mbreak la(sol) fa(sol)
    la8 re,4 dod'8

    %87
    re do!16(sib) la(sol) fa(sol)
    la sib la8~la16 sib la8~
    la16 sib la8~la16 fa mi re

    %90
    mi sib' la8~la16 sib la8~
    la16 sib la8~la16 mi re dod
    re sib' la8~\mbreak la16 sib la8~

    %93
    la16 sib la8~la16 re, dod si
    dod8 la' fa4~
    fa8 mi re4~

    %96
    re8 do?16 sib la8 sol
    fa re' mi dod
    la16\solo(re fa) re la re la re

    %99
    la(re fa) re la re la re
    la(re mi) re la  re la re
    la(re mi) re la  re la re

    %102
    <<{ sol, (dod mi) dod sol dod sol dod
    sol (dod mi) dod sol dod sol dod
    mi,(dod' sol') dod, mi, dod' mi, dod'

    %105
    mi,(dod' sol') dod, mi, dod' mi, dod'
    re,(re' fa) re re, re' re, re'
    re,(re' fa) re re, re' re, re'

    %108
    fa,(re' sib') re, fa, re' fa, re'
    fa,(re' sib') re, fa, re' fa, re'}
      \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \key sib\major
            {
            \set Staff.midiInstrument = #"violin"
                <<<mi dod>2^\markup\italic"Le Cène"\\sol,>>
                <<<mi' dod>\\sol,>>
                <<sol'\\<dod, mi,> >>
                <<sol'\\<dod, mi,>^\markup\italic"etc." >>
            }
        }
    >>
    mi,16(do'? sib') do, mi, do' mi, do'

    %111
    mi,(do' sib') do, mi, do' mi, do'
    fa,(do' la') do, fa, do' fa, do'
    fa,(do' la') do, fa, do' fa, do'

    %114
    sol(mi' do') mi, sol, mi' sol, mi'
    sol,(mi' do') mi, sol, mi' sol, mi'
    fad,(re' do') re, fad, re' fad, re'

    %117
    fad,(re' do') re, fad, re' fad, re'
    sol,(re' sib') re, sol, re' sol, re'
    sol,(re' sib') re, sol, re' sol, re'

    %120
    la(fa' re') fa, la, fa' la, fa'
    la,(fa' re') fa, la, fa' la, fa'  %%% penultima riga
    sold,(mi' re') mi, sold, mi' sold, mi'

    %123
    sold,(mi' re') mi, sold, mi' sold, mi'
    la,(mi' do') mi, la, mi' la, mi'
    la,(mi' do') mi, la, mi' la, mi'

    %126
    fad,(re' do') re, fad, re' fad, re'
    fad,(re' do') re, fad, re' fad, re'
    sol,(re' sib') re, sol, re' sol, re'

    %129
    sol,(re' sib') re, sol, re' sol, re'
    mi,(do' sib') do, mi, do' mi, do'
    mi,(do' sib') do, mi, do' mi, do'

    %132
    fa,(do' la') do, fa, do' fa, do'
    fa,(do' la') do, fa, do' fa, do'
    la(do fa) do la do la do

    %135
    la(do fa) do la do la do
    sol(sib fa') sib, sol sib sol sib
    sol(sib fa') sib, sol sib sol sib

    %138
    sol(do mi) do sol do sol do
    sol(do mi) do sol do sol do
    <<<fa do>8\\fa,>> fa4\tu fa8

    %141
    do' do4 do8
    fa mi16 re do sib la sol
    la8 fa r mib'!\mbreak

    %144
    re16 mib fa8 r fa,
    mi16 fa sol8 r sol'
    fa16 sol la8 r fa,

    %147
    mi16 re' do8~do16 re do8~
    do16 re do8~do16 sib la sol
    \once\stemUp la8  do' lab4~

    %150
    lab8 sol fa4~
    fa8 mi16 re do8 sib
    la[fa' sol mi]\mbreak

    %153
    fa8\solo la16 sol fa8 mi16 re
    do8 fa16 mi re8 do16 sib
    la8 sol16 fa do'8 sib16 la

    %156
    fa'8 sol16 la sib8 la
    la4\tr sol
    r8 re'16 do sib8 la16 sol

    %159
    fad8 sib16 la sol8 fad16 mi
    re8 do16 sib sib'8 la16 sol
    re'8 do16 sib\mbreak la8 sol

    %162
    sol4\tr fad
    r8 re'16 do \once\stemDown sib8 sol,16 fa
    \once\stemUp mib!8 do''16 sib la8 \once\stemDown fa,16 mib

    %165
    \once\stemUp re8 sib''16 la \once\stemDown sol8 mib,16 re
    \once\stemUp do8 la''16 sol \once\stemDown fad8 re,16 do
    sib8 sib'16 do re sib la sol

    %168
    \once\stemUp re8 fad'16 sol la fad mi re
    \once\stemUp re,8 la''16 sib\mbreak do la fad re
    sib'4 sib16\tr(la sib) do

    %171
    re8 fad, sol4~
    sol sol16\tr(fad sol) la
    sib8 dod, re4~

    %174
    \tupletSpan 4 \tuplet 3/2 { re8(mi fad sol[la sib)] }
    \appoggiatura sol fad4.\tr sol8
    sol4 r8 fa,\tu

    %177
    sib sib4 sib8
    fa' fa4 fa8
    sib la16 sol fa mib re do

    %180
    sib8 fa4 sib8
    do do4 re8
    mib fa,4 mib'8

    %183
    mib\tr re r sib'
    sib la16 sol fa8 mib16 re
    mib8 re4 do16 sib

    %186
    mib8 re4 do16 sib
    mib8 re4 do16 sib
    sib'8 la16 sol fa8 mib

    %189
    re16 do sib8 r fa'
    sib,16(re fa) sib sib8(fa16) re\mbreak
    sib(re fa) lab lab8(sol16) fa

    %192
    sol mib sib sol mib' sib sol mib
    do'(mi sol) do do8(sol16) mi
    do(mi sol) sib sib8(la16) sol

    %195
    la fa do la fa' do la fa
    re'(fad la) re re8(la16) fad
    re(fad la) do\mbreak do8(sib16) la

    %198
    sib(do re) sib sib8(la16) sol
    fa(sol la) fa fa8(mib16) re
    do(re mib) re re8(do16) sib

    %201
    la sol fa8 r do'
    reb16(do sib la) sib4~
    sib8 do16(reb mib reb mib do)

    %204
    reb(do sib la) sib4~\mbreak
    sib8 do16(reb mib reb mib do)
    reb(do sib la) sib8 fa'

    %207
    \appoggiatura la sol16(fa sol8) \appoggiatura sib8 la16(sol la8)
    sib la16(sol fa mib re? do)
    re(sib la sib) do4\tr

    %210
    sib4. fa'8
    \appoggiatura la sol16(fa sol8) \appoggiatura sib8 la16(sol la8)
    sib la16 \parentSlur (sol fa mib re do)

    %213
    re(sib la sib) do4\tr
    sib8 sib'4\tu re,8\mbreak
    mib mib4 do8

    %216
    la' la4 do,8
    re re4 sib8
    sol' sol4 sib,8

    %219
    la4 r8 lab'
    sol16 lab sib8 r sib,
    la?16 sib do8 r do'

    %222
    sib16 do re8 r sib,
    la fa' reb4~
    reb8 do sib4~\mbreak

    %225
    sib8 la16 sol fa8 mib
    re sib' do la
    sib fa' reb4~

    %228
    reb8 do sib4~\mbreak
    sib8 la16 sol fa8 mib
    re sib' do la

    %231
    sib2\fermata

}

IvlIn =  \relative do'' {

   fa,8
    sib sib4 sib8
    fa' fa4 fa8
    sib la16 sol fa mib re do

    %4
    sib8 fa4 sib8
    do do4 re8
    mib fa,4 mib'8

    %7
    mib re r fa
    sib sib4 re,8\mbreak
    mib mib4 do8

    %10
    la' la4 do,8
    re re4 sib8
    sol' sol4 sib,8

    %13
    la fa4 mi'8
    fa8 mib!16(re) do(sib) la(\parenthesize sib)
    do8 fa,4 mi'8
    fa mib!16(re) do(sib) la(sib)

    %17
    do8 fa,4 fa'8
    sib la16(sol) fa(mib) re(mib)
    fa8 sib,4 la'8\mbreak

    %20
    sib la16(sol) fa(mib) re(mib)
    fa8 sib, r lab'
    sol16 lab sib8 r sib,

    %23
    la?16 sib do8 r do'
    sib16 do re8 r sib,
    la 16 sol' fa8~ fa16 sol fa8~

    %26
    fa16 sol fa8~fa16 re do sib
    do sol' fa8~fa16 sol fa8~
    fa16 sol fa8~\mbreak fa16 do sib la

    %29
    sib sol' fa8~fa16 sol fa8~
    fa16 sol fa8~fa16 sib, la sol
    la8 fa' reb4~

    %32
    reb8 do sib4~
    sib8 la16 sol fa8 mib
    re sib' do la

    %35
    sib fa'\p reb4~
    reb8 do sib4~
    sib8 la16 sol  fa8 mib

    %38
    re8 [sib'\mbreak do la]
    sib4 r
    R2*8

    %48
    r4 r8 fa'\p
    fa[fa fa fa]
    fa[fa fa fa]

    %51
    fa[fa fa fa]
    fa4\mbreak r8 sol
    sol[sol sol sol]

    %54
    sol[sol sol sol]
    sol[sol sol sol]
    sol4 r8 la

    %57
    la[la la la]
    la[la la la]
    la[la la la]

    %60
    la4 r8 dod,
    re[re re re]
    sib [sib sib sol]

    %63
    do[do do do]
    la[la la fa]
    sib[sib sib sib]

    %66
    si[dod dod dod]
    dod?[dod dod dod]
    re4 r

    %69
    R2*5
    re8\f re4 re8

    %75
    la' la4 la8
    re do16 sib\mbreak la sol fa mi
    re8 la4 re8

    %78
    mi mi4 fa8
    sol la,4 sol'8
    sol\tr fa r sold

    %81
    la sol!16(fa) mi(re) dod(re)
    mi8 la,4 sold'8
    la sol!16(fa) mi(re) dod(re)

    %84
    mi8 la,4 la'8
    re do16(sib)\mbreak la(sol) fa(sol)
    la8 re,4 dod'8

    %87
    re do!16(sib) la(sol) fa(sol)
    la sib la8~la16 sib la8~
    la16 sib la8~la16 fa mi re

    %90
    mi sib' la8~la16 sib la8~
    la16 sib la8~la16 mi re dod
    re sib' la8~\mbreak la16 sib la8~

    %93
    la16 sib la8~la16 re, dod si
    dod8 la' fa4~
    fa8 mi re4~

    %96
    re8 do?16 sib la8 sol
    fa re' mi dod
    re\p fa fa4

    %99
    r8 fa fa4
    r8 mi mi4
    r8 mi? mi4

    %102
    r8 mi? mi4
    r8 mi? mi4
    r8 mi? mi4

    %105
    r8 mi? mi4
    r8 fa fa4
    r8 fa fa4

    %108
    r8 fa fa4
    r8 fa fa4
    r8 sol sol4

    %111
    r8 sol sol4
    r8 la la4
    r8 la la4

    %114
    r8 sol sol4
    r8 sol sol4
    r8 fad fad4\mbreak

    %117
    r8 fad fad4
    r8 re re4
    r8 re re4

    %120
    r8 fa fa4
    r8 fa fa4
    r8 sold sold4

    %123
    r8 sold sold4
    r8 mi mi4
    r8 mi mi4

    %126
    r8 fad fad4\mbreak
    r8 fad fad4
    r8 re re4

    %129
    r8 re re4
    r8 mi mi4
    r8 mi? mi4

    %132
    r8 do do4
    r8 fa fa4
    r8 fa fa4

    %135
    r8 fa fa4
    r8 fa fa4
    r8 fa\mbreak fa4

    %138
    r8 mi mi4
    r8 mi? mi4
    fa8 fa,4\f fa8

    %141
    do' do4 do8
    fa mi16 re do sib la sol
    la8 fa r mib'!\mbreak

    %144
    re16 mib fa8 r fa,
    mi16 fa sol8 r sol'
    fa16 sol la8 r fa,

    %147
    mi16 re' do8~do16 re do8~
    do16 re do8~do16 sib la sol
    \once\stemUp la8  do' lab4~

    %150
    lab8 sol fa4~
    fa8 mi16 re do8 sib
    la[fa' sol mi]\mbreak

    %153
    fa4 r
    R2*16
    sol,8\p [fad sol la]

    %171
    sib[la sol fad?]
    mib? [re mib do]
    sib la sol sol'

    %174
    fad[re sib sol]
    re'[do re re]\mbreak
    sol,4 r8 fa'\f

    %177
    sib sib4 sib8
    fa' fa4 fa8
    sib la16 sol fa mib re do

    %180
    sib8 fa4 sib8
    do do4 re8
    mib fa,4 mib'8

    %183
    mib\parenthesize -\trill re r4
    R2*5
    r4 r8 re\p

    %190
    re[re re re]
    re[re re re]
    sib[sib sib sib]

    %193
    do[do do do]
    do[do do do]
    do[do do do]

    %196
    re[re re re]
    re[re re re]
    re[re re re]

    %199
    do[do re re]
    do[do re re]
    do[do do do]

    %202
    sib[do reb reb]
    reb?[sib do la]
    sib[do reb reb]

    %205
    reb?[sib do la]
    sib[do reb re]\mbreak
    sib[sib do do]

    %208
    re[re do do]
    sib[sib la la]
    sib[re re re]

    %211
    sib[sib do do]
    re[re do do]
    sib[sib la la]

    %214
    sib' sib4\f re,8
    mib mib4 do8

    %216
    la' la4 do,8
    re re4 sib8
    sol' sol4 sib,8

    %219
    la4 r8 lab'
    sol16 lab sib8 r sib,
    la?16 sib do8 r do'

    %222
    sib16 do re8 r sib,
    la fa' reb4~
    reb8 do sib4~\mbreak

    %225
    sib8 la16 sol fa8 mib
    re sib' do la
    sib fa' reb4~

    %228
    reb8 do sib4~\mbreak
    sib8 la16 sol fa8 mib
    re sib' do la

    %231
    sib2\fermata

}

IvlIIn = \relative do'' {

   r8
   r sib sib4
   r8 fa' fa4
   r8 sib la16 sol fa mib

   %4
   re8 re,4 fa8
   la la4 sib8
   do la4 do8\mbreak

   %7
   fa,[fa fa fa]
   r re' fa sib~
   sib sol16 fa sol8 mib

   %10
   r do fa la~
   la fa16 mib fa8 re
   r sib mib sol

   %13
   do,4 r8 do
   re do16 \parentSlur (sib) fa'8 fa,
   fa4\mbreak r8 do'

   %16
   re do16 \parentSlur (sib) fa'8 fa,
   fa4 r8 fa'
   sol fa16 \parentSlur (mib) sib'8 sib,

   %19
   sib4 r8 fa'
   sol fa16 \parentSlur (mib) sib'8 sib,
   sib4 sib~

   %22
   sib do~
   do re~
   re mib~\mbreak

   %25
   mib16 mib re8~re16 mib re8~
   re16 mib re8~re16 re mib fa
   la, mib' re8~re16 mib re8~

   %28
   re16 mib re8~re16 do re mib
   sol, mib' re8~re16 mib re8~\mbreak
   re16 mib re8 ~re16 sib do re

   %31
   fa,8 fa' reb4~
   reb8 do sib4~
   sib8 la16 sol fa8 mib

   %34
   re sib' do la
   sib fa'\p reb4~
   reb8 do sib4~

   %37
   sib8 la16 sol\mbreak fa8 mib
   re[re' mib do]
   re4 r

   %40
   R2*8
   r4 r8 do\p
   re[re re re]

   %50
   do[do do do]
   re[re re re]
   do4 r8 re

   %53
   mib[mib\mbreak mib mib]
   re[re re re]
   mib[mib mib mib]

   %56
   re4 r8 mi
   fa[fa fa fa]
   mi[mi mi mi]

   %59
   fa[fa fa fa]
   mi4 r8 mi\mbreak
   la, la la fa'

   %62
   re[re re sib]
   sol sol sol mi'
   do[do do la]

   %65
   fa[fa fa re']
   sol,[sol sol sol]
   sol sol mi' dod\mbreak

   %68
   la4 r
   R2*5
   r8 re\f re4

   %75
   r8 la' la4
   r8 re do16 sib la sol
   fa8 fa,4 la8

   %78
   dod dod4 re8
   mi dod4 mi8
   la, la r mi'\mbreak

   %81
   fa mi16 re la'8 la,
   la4 r8 mi'
   fa mi16 \parentSlur (re) la'8 la,

   %84
   la4 r8 la'
   sib la16 \parentSlur (sol) re'8 re,
   re4 r8 la'

   %87
   sib la16 \parentSlur (sol) re'8 re,
   re16 sol fa8~\mbreak  fa16 sol fa8~
   fa16 sol fa8~fa16 fa sol la

   %90
   dod, sol' fa8~fa16 sol fa8~
   fa16 sol fa8~fa16 mi fa sol
   sib,16 sol' fa8~fa16 sol fa8~

   %93
   fa16 sol fa8~\mbreak fa16 re mi fa
   la,8 la' fa4~
   fa8 mi re4~

   %96
   re8 do16 sib la8 sol
   fa fa' sol mi
   re\p re re4

   %99
   r8 re re4
   r8 re re4
   r8 re re4\mbreak

   %102
   r8 dod dod4
   r8 dod? dod4
   r8 dod? dod4

   %105
   r8 dod? dod4
   r8 re re4
   r8 re re4

   %108
   r8 re re4
   r8 re re4
   r8 mi mi4

   %111
   r8 mi? mi4
   r8 fa fa4
   r8 fa\mbreak fa4

   %114
   r8 do do4
   r8 mi mi4
   r8 re re4

   %117
   r8 re re4
   r8 sib sib4
   r8 sib sib4

   %120
   r8 re re4
   r8 re re4
   r8 si si4

   %123
   r8 si? si4
   r8 do do4\mbreak
   r8 do do4

   %126
   r8 la la4
   r8 la la4
   r8 sib? sib4

   %129
   r8 sib sib4
   r8 sol sol4
   r8 sol sol4

   %132
   r8 la la4
   r8 la la4
   r8 la la4

   %135
   r8 la la4
   r8 sib sib4
   r8 sib sib4

   %138
   r8 sib sib4
   r8 sib sib4
   la8 fa\f fa4

   %141
   r8 do' do4
   r8 fa mi16 re do sib
   la8 la fa4~

   %144
   fa sol~
   sol la~\mbreak
   la sib~

   %147
   sib16 sib la8~la16 sib la8~
   la sib16 la~la sol fa mib
   \once \stemUp fa8 do'' lab4~

   %150
   lab8 sol fa4~
   fa8 mi16 re do8 sib
   la[la sib sol]

   %153
   la4 r
   R2*16\mbreak
   sol8\p [fad sol la]

    %171
    sib[la sol fad?]
    mib? [re mib do]
    sib la sol sol'

    %174
    fad[re sib sol]
    re'[do re re]\mbreak
    sol,4 r

    %177
   r8 sib'\f sib4
   r8 fa' fa4
   r8 sib la16 sol fa mib

   %180
   re8 sib4 fa8
   la la4 sib8
   do la4 do8\mbreak

   %183
   fa, fa r4
   R2*5
   r4 r8 fa\p

   %190
   fa[fa fa fa]
   fa[fa fa sib]
   sol[sol sol sol]

   %193
   sol[sol sol sol]
   sol[sol sol do]
   la[la la la]

   %196
   la[la la la]
   la la la re
   sib[sib sib sib]

   %199
   la la fa' fa\mbreak
   sol sol sol, sol
   la[la la la]

   %202
   fa la sib sib
   sib[fa la fa]
   fa[la sib sib]

   %205
   sib[fa la fa]
   fa[la sib sib]
   sol[sol fa fa]\mbreak

   %208
   fa[fa fa fa]
   fa[fa fa fa]
   re[fa fa sib]

   %211
   sol[sol fa fa]
   fa[fa fa fa]
   fa[fa fa fa]

   %214
   re re'\f fa sib~
   sib sol16 fa\mbreak sol8 mib
   r do fa la~

   %217
   la fa16 mib fa8 re
   r sib mib sol
   do,4 sib~

   %220
   sib do~
   do re~re mib
   re8 fa reb4~

   %223
   reb8 do sib4~
   sib8 la16 sol\mbreak fa8 mib
   re [re' mib do]

   %226
   sib fa' reb4~
   reb8 do sib4~
   sib8 la16 sol fa8 mib
   re8[re' mib do]

   sib2\fermata

}

Ivlan =  \relative do' {

   r8
   re[re re re]
   do[do do do]
   sib[sib do do]

   %4
   re[re re re]
   do[do do sib]
   la la la16 sol fa mib\mbreak

   %7
   re8[re re re]
   R2
   r8 sol' do mib~

   %10
   mib do16 sib do8 la
   r fa sib re~
   re sib16 la sib8 sol

   %13
   la fa16 sol la8 fa
   r la16 sib do8 fa,
   r fa16 sol la8 fa\mbreak

   %16
   r la16 sib do8 fa,
   r fa16 sol la8 fa
   r re16 mib fa8 sib,

   %19
   r sib16 do re8 sib
   r re16 mib fa8 sib,
   fa'2

   %22
   sol
   la
   sib

   %25
   do,8 r fa r
   mib r re r
   r4\mbreak fa8 r

   %28
   mib r re r
   r4 r8 fa
   mib r re r

   %31
   r4 r8 fa
   sol4. fa8
   mi4 do

   %34
   fa,8[re' mib? do]
   sib4 r8 fa'\p
   sol4. fa8

   %37
   mi4 do
   fa,8[fa' sol fa]
   fa4 r

   %40
   R2*8
   r4 \mbreak r8 la\p
   sib[sib sib sib]

   %50
   la[la la la]
   sib[sib sib sib]
   la4 r8 si

   %53
   do[do do do]
   si[si si si]
   do[do do do]

   %56
   si4 r8 dod
   re[re re re]\mbreak
   dod[dod dod dod]

   %59
   re[re re re]
   dod4 r8 la
   fa[fa fa fa]

   %62
   sol[sol sol sol]
   mi[mi mi mi]
   fa[fa fa fa]

   %65
   re[re re re]
   mi [la, la la]\mbreak
   la[la la la]

   %68
   re4 r
   R2*5
   fa8\f[fa fa fa]

   %75
   mi[mi mi mi]
   re[re mi mi]
   fa[fa fa fa]

   %78
   mi[mi mi re]
   dod dod dod'16 si la sol
   la8 la16 si\mbreak dod8 la

   %81
   r dod,16 re mi8 la,
   r la'16 si dod8 la
   r dod,16 re mi8 la,

   %84
   r la'16 si dod8 la
   r fa16 sol la8 re,
   r re16 mi fa8 re

   %87
   r fa16 sol la8 re,\mbreak
   re r la' r
   sol r fa r

   %90
   r4 la8 r
   sol r fa r
   r4 la8 r

   %93
   sol r fa r
   r4 r8 la
   si4. la8

   %96
   sold4 mi
   la,8 la' sib la
   fa\p la la4\mbreak

   %99
   \repeat unfold 11 {r8 la la4}
   \repeat unfold 6 {r8 do do4}
   r8 la la4

   %117
   r8 la la4
   r8 sol sol4
   r8 sol sol4

   %120
   r8 la la4
   r8 la la4
   r8 sold sold4

   %123
   r8 sold? sold4
   \repeat unfold 4 {r8 la la4}
   r8 sol? sol4

   %129
   r8 sol sol4
   r8 do, do4
   \repeat unfold 4 {r8 do do4}\mbreak

   %135
   r8 fa fa4
   r8 re re4
   r8 re re4

   %138
   r8 do do4
   r8 do do4
   do8[la\f la la]

   %141
   sol[sol sol sol]
   fa[fa sol sol]
   do2

   %144
   re
   mi
   fa

   %147
   sol,8 r\mbreak do r
   sib r do mi
   do4 r8 do'

   %150
   re4. do8
   si4 sol
   do,8[do re do]

   %153
   do4 r
   R2*22
   r4 r8 re\f

   %177
   re[re re re]
   do[do do do]
   sib [sib do do]

   %180
   re[re re re]
   do[do do sib]
   la la la16 sol fa mib

   %183
   re8 re r4
   R2*5
   r4 r8 sib'\p

   %190
   sib[sib sib sib]
   sib[sib sib sib]
   mib[mib mib mib]

   %193
   mi[mi mi mi]
   mi?[mi mi mi]
   fa[fa fa fa]

   %196
   fad[fad fad fad]
   fad?[fad fad fad]
   sol[sol sol sol]

   %199
   la[la sib sib]\mbreak
   mib,[mib mi mi]
   \repeat unfold 5 {fa8[fa fa fa]}

   %206
   fa[fa reb sib]
   mib[mib mib mib]
   re re la la\mbreak

   %209
   sib sib fa' fa,
   sib[sib sib sib]
   mib[mib mib mib]

   %212
   re re la la
   sib sib fa' fa,
   sib4 r

   %215
   r8 sol'\f do mib~
   mib do16 sib do8 la
   r fa sib re~\mbreak

   %218
   re sib16 la sib8 sol
   la4 fa
   sol2

   %221
   la
   sib
   fa4 r8 fa

   %224
   sol4. fa8
   mi4 do
   fa,8[fa' sol fa]

   %227
   fa4 r8 fa
   sol4. fa8
   mi4 do

   %230
   fa,8[fa' sol fa]
   fa2\fermata

}

Ibcn = \relative do {

   r8
   sib' sib sib sib
   la la la la
   sol sol la la

   %4
   sib sib, sib sib'
   la la la sol\mbreak
   fa fa fa16 mib re do

   %7
   sib8 sib sib sib
   r8 sib'16 do re8 sib
   do do, do do

   %10
   fa fa, fa fa
   sib' sib, sib sib
   mib mib, mib mib\mbreak

   %13
   fa4 fa'8 fa,
   fa4 fa
   fa fa'8 fa,

   %16
   fa4 fa
   fa fa'8 sib,
   sib4 sib

   %19
   sib sib'8 sib,
   sib4 sib
   sib sib'8 sib,

   %22
   mib mib\mbreak mi mi
   fa fa fad fad
   sol sol sol sol

   %25
   fa r re' r
   do r sib r
   r4 re8 r

   %28
   do r sib r
   r4 re8 r
   do r\mbreak sib r

   %31
   fa' fa, r sib
   mi,4. reb?8
   do4 la

   %34
   sib8 sib' mib, fa
   sib,4 r8 sib'\p
   mi,4. reb?8

   %37
   do4 la
   sib8 sib' mib, fa
   sib, sib'\mbreak sib,4\solo

   %40
   r8 sib' sib,4
   r8 sib' sib,4
   r8 sib' sib,4

   %43
   r8 sib' sib,4
   fa'8 mib re do
   sib4 sib

   %46
   sib sib
   fa'8 sol la fa
   sib, sib' sib,4

   %49
   R2*3\mbreak
   r8 fa' si, sol
   do4 r

   %54
   R2*2
   r8 sol' dod, la
   re4 r

   %58
   R2*2
   r8 la' dod, la
   R2*7

   %68
   r8 re' fa, re
   la'4 r
   la8 sib\mbreak la la,

   %71
   re re' fa, re
   la'4 r
   la8 sib la la,

   %74
   re'^\markup\italic"[Tutti]"  re re re
   do do do do
   sib sib dod, dod

   %77
   re re, re re'\mbreak
   dod dod dod si
   la la la'16 sol fa mi

   %80
   re4 la'8 la,
   la4 la
   la la'8 la,

   %83
   la4 la
   la la'8 re,
   re4\mbreak re

   %86
   re re'8 re,
   re4 re
   re8 r fa r

   %89
   mi r re r
   r4 fa8 r
   mi r re r

   %92
   r4 fa8 r
   mi r\mbreak re r
   la' la, r re'

   %95
   sold,4. fa!8
   mi?4 dod
   re8 re'sol, la

   %98
   re,4\p r8 re
   re4 r8 fa
   la4 r8 la,

   %101
   la4 r8 la\mbreak
   la4 r8 la
   la4 r8 la

   %104
   la4 r8 la
   la4 r8 la
   re4 r8 re

   %107
   re4 r8 re
   re4 r8 re
   re4 r8 re

   %110
   mi4 r8 mi\mbreak
   mi4 r8 mi
   fa4 r8 fa

   %113
   fa4 r8 fa
   mi4 r8 mi
   do4 r8 do

   %116
   re4 r8 re
   re4 r8 re
   sol4 r8 sol

   %119
   sol4 r8 sol\mbreak
   fa4 r8 fa
   fa4 r8 fa

   %122
   mi4 r8 mi
   mi?4 r8 mi
   la,4 r8 la'

   %125
   la4 r8 la
   re,4 r8 re
   re4 r8 re

   %128
   sol4 r8 sol\mbreak
   sol4 r8 sol
   do,4 r8 do

   %131
   do4 r8 do
   fa4 r8 fa
   fa4 r8 fa

   %134
   fa4 r8 fa
   fa4 r8 fa
   sol4 r8 sol

   %137
   sol4 r8 sol\mbreak
   do,4 r8 do
   do4 r8 do^\markup\italic"[Tutti]"

   %140
   fa fa fa fa
   mi mi mi mi
   re re mi mi

   %143
   fa fa fa fa,
   sib sib si si\mbreak
   do do dod dod

   %146
   re re re re
   do r la' r
   sol r fa do'

   %149
   fa, fa, r fa''
   si,4. lab?8
   sol4 mi

   %152
   fa8 fa,\mbreak sib do
   fa,4\solo r
   fa r

   %155
   fa' fa
   fa sib,8 si
   do re mi dod

   %158
   re4 r
   re r
   sol sol

   %161
   sol dod,
   re8 mi\mbreak fad re
   sol4 r8 sol16 fa

   %164
   mib!4 r8 fa16 mib
   re4 r8 mib16 re
   do4 r8 re16 do

   %167
   sib4 r
   re r
   re8 fad fad re

   %170
   R2*6
   r4 \mbreak r8 sib'\tu
   sib sib sib sib

   %178
   la la la la
   sol sol la la
   sib sib sib sib

   %181
   la la la sol
   fa fa fa16 mib re do\mbreak
   sib8\solo sib re sib

   %184
   r sib re sib
   sib4 sib
   sib sib

   %187
   sib sib
   sib la
   sib8 do re sib

   %190
   R2*24\mbreak
   r8 sib'16\tu do re8 sib
   do do, do do

   %216
   fa fa, fa fa
   sib' sib, sib sib
   mib mib, mib mib

   %219
   fa4 sib'8 sib,\mbreak
   mib mib mi mi
   fa fa fad fad

   %222
   sol sol sol sol
   fa4 r8 sib
   mi,4. reb?8

   %225
   do4 la
   sib8 sib' mib, fa\mbreak
   sib,4 r8 sib'

   %228
   mi,4. reb?8
   do4 la
   sib8 sib' mib, fa

   %231
   sib,2\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2
    <6>
    s2*3
    <7>2
    <4>4< 3>
    s2
    <7>
    <7>
    <7>
    <7>
    s4 s8 <7!>
    <6 4>4 <5 3>
    s s8 <7->
    <6 4>4 <5 3>
    s2
    <6 4>4 <5 3>
    s s8 <7>
    <6 4>4 <5 3>
    s s8 <7->
    <5>4 <6>
    <5> <6>
    <5> <6>
    <7>2
    s2*5
    s4 s8 <_->
    <7->8 <6>8 s <6>
    <7>4 <6 5>
    s <6 5>
    s s8 <_->
    <7->8 <6>8 s <6>
    <7>4 <6 5>
    s <6 5>
    s2*13
    s4 <6 5>
    s2*3
    s8 <_!> <6 5>4
    s2*3
    s8 <_+> <6>4
    s2*7
    s4 <6>
    <_+>2
    <_+>4 <6 4>8 <_+>
    s4 <6>
    <_+>2
    <_+>4 <4>8 <_+>
    s2
    <6>
    <6>4 <6 5>
    s2
    <6>
    <7 _+>
    <4>8 <3> <4> <_+>
    <6 4>4 <5 _+>
    s s8 <7 _+>
    <6 4>4 <5 _+>
    s2
    <6 4>4 <5 3>
    s2
    <6 4>4 <5 3>
    s2*6
    <_+>2
    <7>8 <6> s4
    s <6 5>
    s <6 5>8 <_+>
    s2*2<6 4>2 <5 4>
    <_+>
    <7 _+>
    <7 _+>
    <7 _+>
    s2*2
    <6>2
    s
    <6 5>
    <6 5>
    s
    s
    <6>
    <_!>
    <7 _+>
    s2*3
    <6>2
    s
    <7 _+>
    s2*3
     <7 _+>2
     s2*3
     <7 _!>2
     s2*5
      <7>2
      s
      <7 _!>
      s
      s
      <6>
      <6>
      s4 s8 <7->
      <5>4 <6>  %%%4ta rga seconda pag
      <5> <6>
      <5> <6>
      <7>2
      s
      s4 s8 <_->
      <7->2
      <7>4 <6 5>
      s <6 5>8 <_!>
      s2*4
      <6 4>2
      s
      <_+>
      s
      s4 <6 5>
      <4> <6>
      s2*3
      s4 s8 <_+>
      s2
      <_+>
      <_+>4 <6>
      s2*8
      <6>2
      s2*36
    <7>2
    <7>
    <7>
    <7>
    s4 s8 <7!>
    <5>4 <6>
    <5> <6>
    <5> <6>
    s4 s8 <_->
    <7->2
    <7>4 <6 5>
    s <6 5>
    <_-> s8 <_->
    <7->2
    <7>4 <6 5>
    s <6 5>

}

forma = {

    \key sib\major
    \time 2/4
    \tempo 2 = 54
    \partial 8 s8
    s2*231
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

   r8 \set Staff.midiInstrument = #"acoustic guitar (nylon)" sib\pizz fa[sib] re, fa
   sib, sib' fa[sib] re, fa
   sib, sib' re[fa] re sib\mbreak

   %4
   fa do' la[do] fa, do'
   \once\stemUp la, \once\stemDown  do' la[do] fa, fa'
   re fa re fa sib, re

   %7
   sol, sol' mib sol do, mib
   la, fa la[do] fa, mib
   R2.\set Staff.midiInstrument = #"violin"

   %10
   sib'4^\markup\italic"Solo Cantabile"(re) fa
   sib sib, r
   fa'(re) sib

   %13
   la8 fa la[do] mib4\mbreak
   la mib4. do8
   \appoggiatura do re4. do8 sib4

   %16
   re fa lab
   sol4. fa8 mib4
   mi8(fa sol la? sib sol)

   %19
   la4. mi8 fa4~
   fa8 sol sol4.\tr fa8
   fa2.

   %22
   R2.*2
   fa4(la) do
   \appoggiatura fa,8 mi4. re8 do4

   %26
   mi(sol) sib\mbreak
   la4. sol8 fa4
   \tupletSpan 4 \tuplet 3/2 { re8(mi fad) fad[(sol la)] la(sib do) }

   %29
   do2.~
   do8 la(sol fad mi re)
   sib'4. la8 sol4

   %32
   do, la' do
   fad,4. re8 sol4~
   sol8 la la4.\tr sol8

   %35
   sol2 r4
   sib, (re) fa
   sib sib, r

   %38
   fa'(re) sib\mbreak
   la8 (fa la[do] mib4)
   do'(la) mib

   %41
   \appoggiatura mib8 re4. do8 sib4
   fa'(re) sib
   sol4. mib8 sol[(sib)]

   %44
   sol'4(mib) do
   la4. fa8 la[(do)]
   la'4(fa) re

   %47
   sib4. sol8 sib[(re)]
   sib'4(sol) mib
   mib4. do8 re4~

   %50
   re8 sol do,4.\tr sib8
   sib4 r r
   R2.*4

}

IIvlIn =  \relative do'' {

   r8 \set Staff.midiInstrument = #"acoustic guitar (nylon)" sib\pizz fa[sib] re, fa
   sib, sib' fa[sib] re, fa
   sib, sib' re[fa] re sib\mbreak

   %4
   fa do' la[do] fa, do'
   \once\stemUp la, \once\stemDown do' la[do] fa, fa'
   re fa re fa sib, re

   %7
   sol, sol' mib sol do, mib
   la, fa la[do] fa, mib
   re sib' mib,[sib'] fa la

   %10
   sib,4 r r
   r8 sib' fa[sib] re, fa
   sib, sib' fa[sib] re, sib'\mbreak

   %13
   fa do' fa,[mib'] do la
   fa do' la[do] fa, la
   sib, sib' fa[sib] re, fa

   %16
   sib, sib' fa[sib] re, sib
   mib mib' sib[mib] sol, mib\mbreak
   do do' mi,[do'] do, mi

   %19
   fa fa' do[sib] la fa
   sib, sib' mi,[sol] do, do'
   fa, fa' do[fa] la, do

   %22
   fa, fa' do[fa] la, do\mbreak  %% fine riga 4
   fa, fa' la,[fa'] sol, mi'
   fa4 r r

   %25
   r8 do sol[do] mi, sol
   do,[do'] sol do mi,[do]
   fa fa' do[fa] la, do

   %28
   fad, mi'? do[mi] la, do\mbreak
   fad, do' la[do] fad, la
   re, do' la[do] fad, re

   %31
   sol re' sib[re] sol, sib
   mib, mib'? do[mib] la, do
   re, re' la[fad] re re'\mbreak

   %34
   mib, mib' fad,[la] re, \parenthesize re'
   sol, sib sol[sib] re, fa?
   sib,4 r r

   %37
   r8 sib' fa[sib] re, fa
   sib, sib' fa[sib] re, sib'
   fa do' fa,[mib'] do la\mbreak

   %40
   fa mib' la,[do]  fa, la
   sib, sib' fa[sib] re, fa
   sib, sib' fa[sib] re, fa

   %43
   mib sol sib[mib] sib sol
   mib sol sib[mib] sol, mib\mbreak
   fa la do[fa] do la

   %46
   fa la do[fa] la, fa
   sol sib re[sol] re sib
   sol sib re[sol] sib, sol

   %49
   fa do' la[do] sib re,\mbreak
   mib mib' la,[do] fa, la
   sib fa're[fa] sib, re

   %52
   sol, sol' mib sol do, mib
   la, fa la do fa, mib
   re sib' mib,[sib'] fa la

   %55
   sib,2\fermata r4

}

IIvlIIn = \relative do'' {

   r8 \set Staff.midiInstrument = #"acoustic guitar (nylon)" sib\pizz fa[sib] re, fa
   sib, sib' fa[sib] re, fa
   sib, sib' re[fa] re sib\mbreak

   %4
   fa do' la[do] fa, do'
   \once\stemUp la, \once\stemDown do' la[do] fa, fa'
   re fa re fa sib, re

   %7
   sol, sol' mib sol do, mib
   la, fa la[do] fa, mib
   re sib' mib,[sib'] fa la

   %10
   sib,4 r r
   r8 sib' fa[sib] re, fa
   sib, sib' fa[sib] re, sib'\mbreak

   %13
   fa do' fa,[mib'] do la
   fa do' la[do] fa, la
   sib, sib' fa[sib] re, fa

   %16
   sib, sib' fa[sib] re, sib
   mib mib' sib[mib] sol, mib\mbreak
   do do' mi,[do'] do, mi

   %19
   fa fa' do[sib] la fa
   sib, sib' mi,[sol] do, do'
   fa, fa' do[fa] la, do

   %22
   fa, fa' do[fa] la, do\mbreak  %% fine riga 4
   fa, fa' la,[fa'] sol, mi'
   fa4 r r

   %25
   r8 do sol[do] mi, sol
   do,[do'] sol do mi,[do]
   fa fa' do[fa] la, do

   %28
   fad, mi'? do[mi] la, do\mbreak
   fad, do' la[do] fad, la
   re, do' la[do] fad, re

   %31
   sol re' sib[re] sol, sib
   mib, mib'? do[mib] la, do
   re, re' la[fad] re re'\mbreak

   %34
   mib, mib' fad,[la] re, \parenthesize re'
   sol, sib sol[sib] re, fa?
   sib,4 r r

   %37
   r8 sib' fa[sib] re, fa
   sib, sib' fa[sib] re, sib'
   fa do' fa,[mib'] do la\mbreak

   %40
   fa mib' la,[do]  fa, la
   sib, sib' fa[sib] re, fa
   sib, sib' fa[sib] re, fa

   %43
   mib sol sib[mib] sib sol
   mib sol sib[mib] sol, mib\mbreak
   fa la do[fa] do la

   %46
   fa la do[fa] la, fa
   sol sib re[sol] re sib
   sol sib re[sol] sib, sol

   %49
   fa do' la[do] sib re,\mbreak
   mib mib' la,[do] fa, la
   sib fa're[fa] sib, re

   %52
   sol, sol' mib sol do, mib
   la, fa la do fa, mib
   re sib' mib,[sib'] fa la

   %55
   sib,2\fermata r4

}

IIvlan =  \relative do' {

   sib4\solo sib sib
   sib sib sib
   sib sib sib

   %4
   fa' fa fa
   la, la la
   sib sib sib

   %7
   mib mib mib
   fa fa la,
   re mib fa

   %10
   sib, r r
   sib sib sib\mbreak
   sib sib sib

   %13
   fa' fa fa
   fa fa fa
   sib, sib sib

   %16
   sib sib sib
   mib mib mib
   do do do

   %19
   fa do'8[sib] la fa
   sib,4 do do
   fa fa fa

   %22
   fa fa fa\mbreak
   fa do do
   fa r r

   %25
   do do do
   do do do
   fa fa fa

   %28
   fad fad fad
   fad? fad fad
   re re re

   %31
   sol, sol sib
   do do do\mbreak
   re do sib

   %34
   do re re,
   sol sib sib
   sib r r

   %37
   sib sib sib
   sib sib sib
   fa' fa fa

   %40
   fa fa fa
   sib, sib sib
   sib sib sib

   %43
   mib mib mib\mbreak
   mib mib mib
   fa fa fa

   %46
   fa fa fa
   sol sol sol
   sol sol sol

   %49
   fa fa sib,
   mib fa fa,
   sib sib re

   %52
   mib mib mib
   fa fa la,
   sib mib fa

   %55
   sib,2\fermata r4

}

forma = {

    \key sib\major
    \time 3/4
    \tempo 2 = 40
    s2.*55
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
    \typeset

}

IIIglobal = {
   \override Score.MetronomeMark #'transparent = ##t
   \override Score.BarNumber #'font-size = #0.5
   \override Score.BarNumber #'padding = #1.3
   \override TupletBracket #'bracket-visibility = ##f
}

IIIvln = \relative do'' {

   sib2.
   fa
   re4 do sib

   %4
   re' r16 do re mib fa4
   sol, r16 fa sol la sib4
   do, r16 sib do re mib4

   %7
   re do sib
   fa'2.
   fa'8 mib re2~

   %10
   re8 do sib[la] sol fa
   sol' fa mib2~\mbreak
   mib8 re do[sib] la sol

   %13
   la' sol fa2~
   fa8 mib re[do] sib la
   sib4\p(fa') reb

   %16
   do(fa) la,
   sib(fa') reb
   do(fa) la,

   %19
   sib8\f sib' sib,[sib] sib16 do re do
   sib8 sib' sib,[sib] sib16 do re do\mbreak
   sib8 fa' fa,[fa] fa16 sol la sol

   %22
   fa8 fa' fa,[fa] fa16 sol la sol
   fa8 fa' mib re16 do re8 do16 sib
   fa4\p sol'(fa)

   %25
   r8 mib\f re do16 sib do8 sib16 la
   sib8 fa' mib re16 do re8 do16 sib\mbreak
   fa4\p sol'(fa)

   %28
   r8 mib\f re do16 sib do8 sib16 la
   <<<fa' sib,>4\\{re,8 \once\slurUp sol'16\solo(la)}>> sib(la) sol(fa) sol(fa) mib(re)
   <<<sol do,>4\\{mib,8 \once\slurUp sol'16(fa)}>> mib(re) do(sib) do(sib) la(sol)

   %31
   <<la4\\{fa8 \once\slurUp do'16(re)}>> mib(do) sib(la) fa'(mib) re(do)
   re8 sib fa[re] do4
   <<<fa' sib,>4\\{re,8 \once\slurUp sol'16\solo(la)}>> sib(la) sol(fa) sol(fa) mib(re)

   %34
   <<<sol do,>4\\{mib,8 \once\slurUp sol'16(fa)}>> mib(re) do(sib) do(sib) la(sol)
   <<la4\\{fa8 \once\slurUp do'16(re)}>> mib(do) sib(la) fa'(mib) re(do)
   <<
      {
         fa2.

         %37
         fa
         fa
         fa

         %40
         sib,
         sib
         do

         %43
         do
         fa,
         fa

         %46
         mi
         la4
      }\\{
         \slurUp re16(sib) re(sib) re(sib) re(sib) re(sib) re(sib)
         do(la) do(la) do(la) do(la) do(la) do(la)
         re(sib) re(sib) re(sib) re(sib) re(sib) re(sib)
         do(la) do(la) do(la) do(la) do(la) do(la)
         fa(re) fa(re) fa(re) fa(re) fa(re) fa(re)
         sol(mib) sol(mib) sol(mib) sol(mib) sol(mib) sol(mib)
         sol(mi) sol(mi) sol(mi) sol(mi) sol(mi) sol(mi)
         la(fa) la(fa) la(fa) la(fa) la(fa) la(fa)
         do(la) do(la) do(la) do(la) do(la) do(la)
         do(sol) do(sol) do(sol) do(sol) do(sol) do(sol)
         do(sol) do(sol) do(sol) do(sol) do(sol) do(sol)
         <fa' do>4
      }
   >> fa'2\tu\slurNeutral
   do2.

   %49
   la4 sol fa
   sol'2.
   re

   %52
   sib4 la sol
   sib r16 la sib do re4\mbreak
   fad, r16 mi fad sol la4

   %55
   dod, r16 re mi fad sol4
   fad mi re
   re'8 do sib2~

   %58
   sib8 la sol fa? mib? re
   mib' re do2~
   do8 sib la[sol] fa mib

   %61
   fad' mi re2~\mbreak
   re8 do sib[la] sol fad
   sol8 sol' sol,[sol] sol16 la sib la

   %64
   sol8 sol' sol,[sol] sol16 la sib la
   sol8 re' do sib16 la sib8 la16 sol
   re4 mib'\p(re)

   %67
   r8 do\f sib la16 sol la8 sol16 fad\mbreak
   sol16\solo fad mi re sib' la sol fad re' do sib la
   sol' fad mi re sib' la sol fad re' do sib la

   %70
   sib sol re sol sib sol re sol sib sol re sol\mbreak
   mib do sol do mib do sol do mib do sol do
   la' fa do fa la fa do fa la fa do fa

   %73
   re sib fa sib re sib fa sib re sib fa sib\mbreak
   sol' mi si mi sol mi si mi sol mi si mi
   dod la mi la dod la mi la dod la mi la

   %76
   re dod si la fa' mi? re dod la' sol fa mi!\mbreak
   re'4. do16 sib la sol fa mi
   re dod si la fa' mi re dod la' sol fa mi

   %79
   re'4. do16 sib la sol fa mi
   re8 la mi'2\tr
   re2.^\markup\italic"[Tutti]"

   %82
   fa,
   fa4 mi re
   re' r16 dod re mi fa4\mbreak

   %85
   sib, r16 la sib do re4
   sol, r16 fad sol la sib4
   mi, r16 re mi fa? sol4

   %88
   \once\stemUp la,8 la'' sol fa16 mi fa8 mi16 re
   la4\p sol'(fa)
   r8 sol\f fa mi16 re mi8 re16 dod

   %91
   re4\p sib' la\mbreak
   r8 sol\f fa mi16 re mi8 re16 dod
   re\solo re la re fa, re' la re fa, re' la re

   %94
   fa,8 re' re4.\tr(dod16 re)
   mi dod la dod mi, dod' la dod mi, dod' la dod
   \once \stemUp mi,8 sol'  sol4.\tr(fa16 mi) \mbreak

   %97
   fa re' la re fa, re' la re fa, re' fa, re'
   re,8 fa fa4.\tr(mi16 re)
   sib' sol mi sol do, sol' mi sol do, sol' mi sol

   %100
   do,8 sol' sol4.\tr(fa16 mi)
   la8 sol16(fa) mi(re) do(sib)  la \parentSlur (sol) fa \parentSlur (mi)\mbreak
   fa8 la mib'?[fa,] \once\stemUp la, \once\stemDown mib''

   %103
   re do16(sib) la(sol) fa(mib) re(do) sib(la)
   sib8 \once\stemDown fa'' lab[sib,] \once \stemUp re, \once \stemDown lab''
   sol fa16(mib) re(do) sib(lab) sol(fa) mib(re)

   %106
   mib8 sib' reb[mib,] \once\stemUp sol, \once\stemDown reb''
   do8 sib16(lab) sol(fa) mib(re) do(sib) lab(sol)\mbreak
   lab8 \once\stemDown do' fa[fa,] la, \once\stemDown  mib''

   %109
   re8 do16(sib) la(sol) fa(mib) re(do) sib(la)
   sib8 \once\stemDown re' sol[sol,] si, \once\stemDown fa''
   mib re16(do) si(la) sol(fa) mib(re) do(si)

   %112
   do8\once\stemDown mib' lab[mib] \once\stemUp fa, \once\stemDown  lab'
   lab?4. sol16(fa) mib(re) do(sib)\mbreak
   mib,8 re' sol[re] \once \stemUp mib, \once\stemDown sol'

   %115
   sol4. fa16(mib) re(do) sib(lab)
   re,8 do' fa[do] lab fa'
   fa4. mib16(re) do(si) lab?(sol)

   %118
   do(re) mib(re) do(sib) lab(sol) fa(mib) re(do)
   \once\stemUp sol8 \once\stemDown si' do[mib,] \once\stemUp sol,8 \once\stemDown si'
   do2.\tu\mbreak %%%% mancano sette righe

   %121
   sol
   mib4 re do
   sib'2.

   %124
   fa
   re4 do sib
   re' r16 do re mib fa4

   %127
   sol, r16 fa sol la sib4
   do, r16 sib do re mib4
   re do sib

   %130
   sib''8\solo la16(sol) fa(mib) re(do) sib(la) sol(fa)
   sib4(do) re\mbreak
   mib8(re do[re]) re4

   %133
   sib'8 la16(sol) fa(mib) re(do) sib(la) sol(fa)
   sib4(do) re
   mib,2\tr re4

   %136
   sib'16 (fa re fa) sib (fa re fa) sib (fa re fa)
   sib8 sib16(do re8) re16(mib fa8) fa16(sol
   lab4 sol fad)

   %139
   fad?(sol2)\mbreak
   do,16\parentSlur (sol mi sol) do\parentSlur (sol mi sol) do\parentSlur (sol mi sol)
   do8 do16(re mi8) mi16(fa sol8) sol16(la

   %142
   sib4 la sold)
   sold?(la2)
   re,16\parentSlur (la fad la) re\parentSlur (la fad la) re\parentSlur (la fad la)\mbreak

   %145
   re8 re16(mi fad8) fad16(sol la8) la16(sib
   do4 sib la)
   la(sib2)

   %148
   sib8(la16 sol fa?2)
   sol8(fa16 mib re2)
   mib8(re16 do sib2)

   %151
   sol'\tr fa4
   reb8(do reb mib fa reb)
   do(sib do reb mib do)\mbreak

   %154
   sib(la sib[do] reb sib)
   la(sol fa sol la sib)
   do(reb mib fa sol la)

   %157
   sib16(la) sol(fa) sol(fa) mib(re?) mib(re) do(sib)
   do(sib) la(sol) la(sol) fa(mib) fa(mib) re(do)\mbreak
   sib8 sib' do2\tr

   %160
   <<{fa8[mib]}\\sib4\tu>> re2~
   re8 do sib[la] sol fa
   sol' fa mib2~

   %163
   mib8 re do[sib] la sol
   la' sol fa2~
   fa8 mib re[do] sib la

   %166
   sib4(fa') reb
   do(fa) la,\mbreak
   sib(fa') reb

   %169
   do(fa) la,
   sib8 sib' sib, [sib] sib16 do re do
   sib8 sib' sib, [sib] sib16 do re do

   %172
   sib8 fa' fa,[fa] fa16 sol la fa
   sib4 mib, fa
   sib,2\fermata r4

}

IIIvlIn =  \relative do'' {

   sib2.
   fa
   re4 do sib

   %4
   re' r16 do re mib fa4
   sol, r16 fa sol la sib4
   do, r16 sib do re mib4

   %7
   re do sib
   fa'2.
   fa'8 mib re2~

   %10
   re8 do sib[la] sol fa
   sol' fa mib2~\mbreak
   mib8 re do[sib] la sol

   %13
   la' sol fa2~
   fa8 mib re[do] sib la
   sib4\p(fa') reb

   %16
   do(fa) la,
   sib(fa') reb
   do(fa) la,

   %19
   sib8\f sib' sib,[sib] sib16 do re do
   sib8 sib' sib,[sib] sib16 do re do\mbreak
   sib8 fa' fa,[fa] fa16 sol la sol

   %22
   fa8 fa' fa,[fa] fa16 sol la sol
   fa8 fa' mib re16 do re8 do16 sib
   fa4\p sol'(fa)

   %25
   r8 mib\f re do16 sib do8 sib16 la
   sib8 fa' mib re16 do re8 do16 sib\mbreak
   fa4\p sol'(fa)

   %28
   r8 mib\f re do16 sib do8 sib16 la
   sib4 r r
   R2.*17

   %47
   fa'2.\tu
   do2.

   %49
   la4 sol fa
   sol'2.
   re

   %52
   sib4 la sol
   sib r16 la sib do re4\mbreak
   fad, r16 mi fad sol la4

   %55
   dod, r16 re mi fad sol4
   fad mi re
   re'8 do sib2~

   %58
   sib8 la sol fa? mib? re
   mib' re do2~
   do8 sib la[sol] fa mib

   %61
   fad' mi re2~\mbreak
   re8 do sib[la] sol fad
   sol8 sol' sol,[sol] sol16 la sib la

   %64
   sol8 sol' sol,[sol] sol16 la sib la
   sol8 re' do sib16 la sib8 la16 sol
   re4 mib'\p(re)

   %67
   r8 do\f sib la16 sol la8 sol16 fad\mbreak
   sol4 r r
   R2.*11

   %80
   \parenthesize r2.
   re'2.\tu
   fa,

   %83
   fa4 mi re
   re' r16 dod re mi fa4

   %85
   sib, r16 la sib do re4
   sol, r16 fad sol la sib4
   mi, r16 re mi fa? sol4

   %88
   \once\stemUp la,8 la'' sol fa16 mi fa8 mi16 re
   la4\p sol'(fa)
   r8 sol\f fa mi16 re mi8 re16 dod

   %91
   re4\p sib' la\mbreak
   r8 sol\f fa mi16 re mi8 re16 dod
   re8\p fa, re fa re fa

   %94
   re fa re fa re fa
   la, dod la dod la dod
   la dod? la dod la dod

   %97
   re fa re fa re fa
   re la' fa la re, fa\mbreak
   sol do mi,[do'] mi, do'

   %100
   mi,? do' mi,[do'] mi, do
   fa4 r r
   R2.*18
   do'2.\tu

   %121
   sol
   mib4 re do
   sib'2.

   %124
   fa
   re4 do sib
   re' r16 do re mib fa4

   %127
   sol, r16 fa sol la sib4
   do, r16 sib do re mib4
   re do sib

   %130
   R2.*6
   sib'4\p sib sib
   sib sib sib

   %138
   sib4 r r
   R2.
   do4 do do

   %141
   do do do
   do4 r r
   R2.

   %144
   re4 re re\mbreak
   re re re
   re r r

   %147
   R2.
   sol4 fa fa
   mib re re

   %150
   do sib sib
   sol' fa fa
   sib, sib sib

   %153
   lab lab lab
   solb solb solb
   fa fa fa

   %156
   fa fa fa
   sib, r r
   R2.\mbreak

   %159
   sib4 fa' fa
   fa'8\f mib re2~
   re8 do sib[la] sol fa
   sol' fa mib2~

   %163
   mib8 re do[sib] la sol
   la' sol fa2~
   fa8 mib re[do] sib la

   %166
   sib4(fa') reb
   do(fa) la,\mbreak
   sib(fa') reb

   %169
   do(fa) la,
   sib8 sib' sib, [sib] sib16 do re do
   sib8 sib' sib, [sib] sib16 do re do

   %172
   sib8 fa' fa,[fa] fa16 sol la fa
   sib4 mib, fa
   sib,2\fermata r4

}

IIIvlIIn = \relative do'' {

   sib2.
   fa
   re4 do sib

   %4
   re' r16 do re mib fa4
   sol, r16 fa sol la sib4
   do, r16 sib do re mib4

   %7
   re do sib
   fa'2.
   re'8 do sib2~

   %10
   sib8 la sol [fa] mib re
   mib' re do2~
   do8 sib la[sol] fa mib\mbreak

   %13
   fa' mib re2~
   re8 do sib[la] sol fa
   r8 fa'16\p mib reb8 sib fa'4~

   %16
   fa8 do16 sib la8 fa fa'4~
   fa8 fa16 mib reb8 sib fa'4~
   fa8 do16 sib la8 fa fa'4~

   %19
   fa8\f sib sib,[sib] sib16 do re do\mbreak
   sib8 sib' sib,[sib] sib16 do re do\mbreak
   sib8 fa' fa,[fa] fa16 sol la sol

   %22
   fa8 fa' fa,[fa] fa16 sol la sol
   fa8 re' do sib16 la sib8 la16 sol
   la4\p mib'(re)\mbreak

   %25
   r8 do\f sib la16 sol la8 sol16 fa
   re8 re' do sib16 la sib8 la16 sol
   la4\p mib'(re)

   %28
   r8 do\f sib la16 sol la8 sol16 fa
   re4 r r
   R2.*17

   %47
   fa'2.\tu \mbreak
   do2.

   %49
   la4 sol fa
   sol'2.
   re

   %52
   sib4 la sol
   sib r16 la sib do re4\mbreak
   fad, r16 mi fad sol la4

   %55
   dod, r16 re mi fad sol4
   fad mi re\mbreak
   sib'8 la sol2~

   %58
   sol8 fa? mib? re do sib
   do' sib la2~
   la8 sol fa mib re do

   %61
   la''8 sol fad2~
   fad8 mi re[do] sib la
   sib sol' sol,[sol] sol16 la sib la\mbreak

   %64
   sol8 sol' sol,[sol] sol16 la sib la
   sol8 sib la sol16 fad sol8 fad16 mi
   fad4 do'\p(sib)

   %67
   r8 fad'\f sol[sib,] do sib16 la
   sib4 r r
   R2.*11

   %80
   \parenthesize r2.
   re2.\tu
   fa,

   %83
   fa4 mi re
   re' r16 dod re mi fa4

   %85
   sib, r16 la sib do re4
   sol, r16 fad sol la sib4
   mi, r16 re mi fa? sol4

   %88
   la,8 \once\stemDown fa'' mi re16 dod re8 dod16 si\mbreak
   dod4\p sib' la
   r8 dod,\f re[fa,] sol fa16 mi

   %91
   fa4\p sol' fa
   r8 dod re[fa,] sol fa16 mi
   fa8\p fa re fa re fa

   %94
   re fa re fa re fa
   la, dod la dod la dod
   la dod? la dod la dod

   %97
   re fa re fa re fa
   re la' fa la re, fa\mbreak %%%%%%%% qui ok
   sol do mi,[do'] mi, do'

   %100
   mi,? do' mi,[do'] mi, do
   fa4 r r
   R2.*18
   do'2.\tu

   %121
   sol
   mib4 re do
   sib'2.

   %124
   fa
   re4 do sib
   re' r16 do re mib fa4

   %127
   sol, r16 fa sol la sib4
   do, r16 sib do re mib4
   re do sib

   %130
   R2.*6
   fa'4\p fa fa
   fa fa fa\mbreak

   %138
   fa r r
   R2.
   sol4 sol sol

   %141
   sol sol sol
   sol r r
   R2.

   %144
   la4 la la
   la la la
   la r r

   %147
   R2.
   mib'4 re re
   do sib sib

   %150
   sol fa fa
   mib' re re\mbreak
   sib sib sib

   %153
   lab lab lab
   solb solb solb
   fa fa fa

   %156
   fa fa fa
   sib, r r
   R2.\mbreak

   %159
   sib4 fa' fa
   re'8\f do sib2~
   sib8 la sol [fa] mib re

   %162
   mib' re do2~\mbreak
   do8 sib la[sol] fa mib
   fa' mib re2~

   %165
   re8 do sib[la] sol fa
   r8 fa'16 mib reb8 sib fa'4~
   fa8 do16 sib la8 fa fa'4~

   %168
   fa8 fa16 mib reb8 sib fa'4~
   fa8 do16 sib la8 fa fa'4~\mbreak
   fa8 sib sib,[sib] sib16 do re do

   %171
   sib8 sib' sib,[sib] sib16 do re do
   sib8 fa' fa,[fa] fa16 sol la fa
   sib4 mib, fa

   %174
   sib,2\fermata

}

IIIvlan =  \relative do' {

   sib'2.
   fa
   re4 do sib

   %4
   re'4 r16 do re mib fa4
   sol,4 r16 fa sol la sib4\mbreak
   do, r16 sib do re mib4

   %7
   re do sib
   fa'2.
   fa~

   %10
   fa4. fa8 mib[re]
   sol2.~\mbreak
   sol4. sol8 fa[mib]

   %13
   la2.~
   la4. la8 sol[fa]
   fa\p sib (reb4) sib

   %16
   la(do) la
   fa8 sib (reb4) sib
   fa(do') la

   %19
   sib,8\f sib' sib,[sib] sib16 do re do
   sib8 sib' sib,[sib] sib16 do re do\mbreak
   sib8 fa' fa,[fa] fa16 sol la sol

   %22
   fa8 fa' fa,[fa] fa16 sol la sol
   fa8 fa' sol la fa sol
   do,4\p r r

   %25
   la'8\f la fa fa fa fa,
   fa fa' sol[la] fa sol\mbreak
   do,4\p r r

   %28
   la'8\f la fa fa fa fa,
   fa4 r r
   R2.*17

   %47
   fa'2.\tu
   do
   la4 sol fa

   %50
   sol'2.
   re
   sib4 la sol
   sib'4 r16 la sib do re4\mbreak

   %54
   fad,4 r16 mi fad sol la4
   dod, r16 re mi fad sol4
   fad mi re

   %57
   re2.~
   re4. re8 do[sib]
   mib2.~

   %60
   mib4. mib8 re[do]
   fad2.~
   fad4. la8 sol[fad]\mbreak

   %63
   re sol sol,[sol] sol16 la sib la
   sol8 sol' sol,[sol] sol16 la sib la
   sol8 re' mib[re] re mi

   %66
   la,4\p r r
   la'8\f fad re re mib re
   re4 r r

   %69
   R2.*11
   \parenthesize r2.
   re'2.\tu

   %82
   fa,\mbreak
   fa4 mi re
   re'4 r16 dod re mi fa4

   %85
   sib, r16 la sib do re4
   sol, r16 fad sol la sib4
   mi, r16 re mi fa sol4

   %88
   la,8 la' sib la la si
   mi,4\p r r\mbreak
   mi?8\f dod la[la] sib la

   %91
   la4 \p r r
   mi'8\f dod la[la] sib la
   la4 r r

   %94
   R2.*26
   do'2.\tu
   sol

   %122
   mib4 re do
   sib'2.
   fa

   %125
   re4 do sib
   re' r16 do re mib fa4\mbreak
   sol, r16 fa sol la sib4

   %128
   do,r16 sib do re mib4
   re do sib
   R2.*6

   %136
   re4\p re re
   re re re
   re r r

   %139
   R2.
   mi4 mi mi
   mi? mi mi

   %142
   mi? r r
   R2.
   fad4 fad fad\mbreak

   %145
   fad fad fad
   fad? r r
   R2.

   %148
   sib,4 sib sib
   sib sib sib
   sib sib sib

   %151
   sib sib sib
   sib' sib sib
   lab lab lab

   %154
   solb solb solb
   fa fa fa
   fa fa fa\mbreak

   %157
   sib, r r
   R2.
   sib4 fa' fa,

   %160
   fa'2.\f~
   fa4. fa8 mib[re]
   sol2.~\mbreak

   %163
   sol4. sol8 fa[mib]
   la2.~
   la4. la8 sol[fa]

   %166
   fa\p sib (reb4) sib
   la(do) la
   fa8 sib \parentSlur (reb4) sib

   %169
   la\parentSlur (do) la
   fa8 sib sib,[sib] sib16 do re do
   sib8 sib' sib,[sib] sib16 do re do

   %172
   sib8 fa' fa,[fa] fa16 sol la fa
   sib4 mib fa
   sib,2\fermata r4

}

IIIbcn = \relative do {

   sib'2.
   fa
   re4 do sib

   %4
   \clef tenor \key sib\major re'4 r16 do re mib fa4
   \clef bass \key sib\major sol,4 r16 fa sol la sib4\mbreak
   do, r16 sib do re mib4

   %7
   re do sib
   fa'2.
   re4 r8 mib16 fa sol la sib do

   %10
   re4 re, sib
   mib r8 fa16 sol la sib do re
   \clef tenor \key sib\major mib4 mib, do

   %13
   fa r8 sol16 la sib do re mib
   fa4  \clef bass \key sib\major fa, fa,
   sib2.^\p

   %16
   fa'
   sib,
   fa'

   %19
   sib,8\f sib' sib,[sib] sib16 do re do\mbreak
   sib8 sib' sib,[sib] sib16 do re do
   sib8 fa' fa,[fa] fa16 sol la sol

   %22
   fa8 fa' fa,[fa] fa16 sol la sol\mbreak
   fa8 sib mib[fa] sib, mi
   fa4 r r

   %25
   fa8 la sib[sib,] fa' fa,
   sib sib' mib,[fa]  sib, mi
   fa4 r r\mbreak

   %28
   fa8 la sib[sib,] fa' fa,
   sib4\solo r r
   mib r r

   %31
   fa r r
   sib, sib' sib,
   sib r r

   %34
   mib r r\mbreak
   fa r r
   re' do sib

   %37
   la sol fa
   re' do sib
   la sol fa

   %40
   re do sib
   mib fa sol
   mi re do\mbreak

   %43
   fa sol la
   fa mi fa
   do' sib do

   %46
   do, sib do
   fa2.\tu
   do

   %49
   la4 sol fa
   sol'2.
   re

   %52
   sib4 la sol\mbreak
   sib' r16 la sib do re4
   fad, r16 mi fad sol la4

   %55
   dod, r16 re mi fad sol4
   fad mi re
   sib r8 do16 re mib fa sol la\mbreak

   %58
   sib4 sib, sol
   do r8 re16 mib fa sol la sib
   do4 do, la

   %61
   re r8 mi16 fad sol la sib do
   re4 fad, re\mbreak
   sol,8 sol' sol,[sol] sol16 la sib la

   %64
   sol8 sol' sol,[sol] sol16 la sib la
   sol8 sol' do,[re] sol, dod
   re4 r r\mbreak

   %67
   re'8 re, sol[sol,] do re
   sol,4\solo re' fad
   sol re' fad,

   %70
   sol sol sol
   do, do do
   fa fa fa

   %73
   sib, sib sib\mbreak
   mi mi mi
   la, la la

   %76
   re la' dod
   re8 sol, la4 la,
   re la' dod

   %79
   re8 sol, la4 la,
   \parenthesize re4 \parenthesize mi2
   re'2.\tu

   %82
   fa,\mbreak
   fa4 mi re
   \clef tenor \key sib\major re' r16 dod re mi fa4

   %85
   sib, r16 la sib do re4
   \clef bass \key sib\major sol, r16 fad sol la sib4\mbreak %fine seconda riga
   mi, r16 re mi fa sol4

   %88
   \once\stemUp la,8 re' sol,[la] re, sold
   la4 r r
   la8 la, re[re,] sol la

   %91
   re,4 r r\mbreak
   la''8 la, re[re,] sol la
   re,4 r r

   %94
   R2.*7
   fa'4\solo r r
   fa fa fa

   %103
   sib, r r
   sib sib sib
   mib r r\mbreak

   %106
   mib mib mib
   lab, r r
   lab la la %%%%%%%%%% <-----

   %109
   sib r r
   sib si si
   do r r

   %112
   do fa fa
   sib sib sib\mbreak
   mib, mib mib

   %115
   lab lab lab
   re, re re
   sol sol sol

   %118
   mib8 do do[re] mib fa
   sol4 do,8[fa] sol sol,
   do'2.\tu\mbreak

   %121
   sol
   mib4 re do
   sib'2.

   %124
   fa
   re4 do sib
   \clef tenor \key sib\major  re' r16 do re mib fa4

   %127
   \clef bass \key sib\major  sol, r16 fa sol la sib4
   do, r16 sib do re mib4\mbreak
   re do sib

   %130
   sib\solo r r
   sib' la sol
   fa la, sib

   %133
   sib r r
   sib' la sol
   fa la, sib

   %136
   R2.*3
   mib4 sol, mib
   R2.*3\mbreak

   %143
   fa'4 la, fa
   R2.*3
   sol'4 sib, sol

   %148
   R2.*12
   re'4\tu r8 mib16 fa sol la sib do
   re4 re, sib

   %162
   mib r8 fa16 sol la sib do re\mbreak
   \clef tenor \key sib\major  mib4 mib, do
   fa r8 sol16 la sib do re mib

   %165
   fa4 \clef bass \key sib\major   fa, fa,
   sib2.
   fa'

   %168
   sib,
   fa'
   sib,8 sib' sib,[sib] sib16 do re do\mbreak

   %171
   sib8 sib' sib,[sib] sib16 do re do
   sib8 fa' fa,[fa] fa16 sol la fa
   sib4 mib fa

   %174
   sib,2\fermata r4

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s2.*2
   <6>4 <6> s
   <6>2.
   s
   s
   <6>4 <6> s
   s2.*7
   <_->2.
   s
   <_->
   s2.*5
   s2 s8 <6 5>
   s2.*2
   s2 s8 <6 5>
   s2.*3
   <6>2.
   s2.*3
   <6>2.
   s
   <6>
   <6>
   <6>
   <6>
   <6>
   s2 <6>4
   <6>2.
   s2.*2
   <5 4>2.
   <_!>
   s2.*7
   <6>2 <_+>4
   <6> s16 <_+> s8 s4
   s2.*2
   s4 <6>2
   s2.
   s4 <6>2
   <_+>2.
   <_+>4 <6>2
   s2.*2
   s2 s8 <6 5>
   s2.
   <_+>2 <6 5>8 <_+>
   s4 <_+> <6>
   s4 <_+> <6>
   s2.*5
   <_+>2.
   s4 <_+> <6>
   s <4> <_+>
   s4 <_+> <6>
   s <4> <_+>
   s2.*3
   s4 <6\\> s
   s2.*4
   s2 s8 <6 5>
   <_+>2.
   <_+>2 <6 5>8 <_+>
   s2.
   <_+>2 <6 5>8 <_+>
   s2.*9
   <7>2.
   s
   <7->
   s
   <7->
   s
   s4 <6 5>2
   s2.
   s4 <6 5>2
   s2.
   s4 <_->2
   <7->2.
   <7>
   <7>
   <7>
   <7 _!>
   s
   <_!>2 <4>8 <_!>
   s2.*2
   s4 <6> <6>
   s2.*6
   <6>4 <6>2
   s2.*9
   s4 <6>2
   s2.*3
   s4 <6>2
   s2.*3
   s4 <6>2
   s2.*13
   s4 <6>2
   s2.
   s4 <6>2
   s2.*2
   <_->2.
   s
   <_->
   s2.*4
   s4 <6 5>2

}

forma = {

   \key sib\major
   \time 3/4
   \tempo 2 = 60
   s2.*174
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

\header { tagline = ##f }

\bookpart {

    \paper  {

   systems-per-page = #4

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

   systems-per-page = #5

}

   \markup\huge "[2.] Largo, senza Bassi"

   \score {

      \new ChoirStaff \with {
         \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
      } <<

         \new Staff  = "main" <<
            \IIvl
         >>

         \new PianoStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
         } <<

            \new Staff <<
               \IIvlI
            >>

            \new Staff <<
               \IIvlII
            >>
         >>

         \new Staff <<
            \IIvla
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

}

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

