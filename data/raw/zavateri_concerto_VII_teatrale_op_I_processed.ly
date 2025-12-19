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

arco = _\markup \italic \center-align"con l'arco"

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

quarto = \tupletSpan 4

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


global = {
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\terzine \senza
			}

IvlIn = \relative do'' {

    sib,4\upl re\upl fa\upl sib\upl
    r8 sib, re mib fa4 fa\tr
    r8 fa sol la sib4 sib\tr

    %4
    \grace {do16[re]} mib4. re16\p(do) re(do sib4.)
    \grace {mib?16\f[fa]} sol4.  fa16\p \parentSlur (mib!) re(mib fa4) sib,8\f
    \grace {do16[re]} mib4.\parenthesize \tr re16\p (do) re(do sib4) sib8\f

    %7
    sib la16(sib) do8 do do\tr sib16 (do) re8 re\mbreak
    re\upl do16(sib) do8 do do\parenthesize \tr sib fa'4~
    fa16 mib re do sib la sol fa sol4 sol'~

    %10
    sol16 fa mi! re do sib la sol la4 la'~
    la16 sol fa mib re do sib la sib4 sib'~
    sib16 la sol fa mib re do sib la do fa, do' re sib fa re'

    %13
    do la fa do' re sib fa re' do8 fa fa  [fa,]
    r fa' fa fa, fa'16 fa sib, fa' sol  mib sib sol'\mbreak
    fa re sib fa' sol mib sib sol' fa8 sib sib sib,

    %16
    r sib' sib sib, r sib'16 la sol fa mi! re
    mi sol do, sol' la fa do la' sol mi do sol' la fa do la'
    sol mi do sol' fa do la fa' mi8 mi16(fa) sol8 sol

    %19
    \grace la sol fa16(sol) la8 la \grace sib la sol16(la) sib8 sib
    \grace do sib la16(sol) \grace sib8 la sol16(fa) \tuplet 3/2 { sol16 (fa mi) mi[(re do)] do(sib la) la[(sol fa)]
    la'(sol fa) fa[(mi re)] re(do sib) sib[(la sol)] sib'(la sol) sol[(fa mi)] mi(re do) do[(sib la)]}

    %22
    do'8 fa, r16 fa \con \tuplet 3/2 {sol[(fa mi)]} do'8 fa, r16 fa \tuplet 3/2 {sol[(fa mi)]}
    fa8.\tr mi32(re) do8 sib \tuplet 3/2 { la16\upl do\upl sib\upl la_\upl [sol_\upl fa_\upl]} sol4\tr
    fa_\upl la_\upl do\upl fa\upl

    %25
    r8 fa, la sib do4 do\tr
    r8 do re mi fa4 fa\tr
    \grace {sol16[la]} sib4.\upl la16(sol) la(sol fa4.)

    %28
    sib,4.\p la16(sol)\mbreak la(sib do4.)
    do16\f(sib la4) la'8 sol16 sol sol sol sol sol sol sol
    sol sol sol sol fa fa fa fa sib sib sib sib sib sib sib sib

    %31
    la la la la la la la la sol\upl sol(fa sol) sib sol(fa sol)
    \tuplet 3/2 { sib(la sol) \senza sol[(fa mi)] mi(fa sol) sol[(fa mi)] } fa re(dod re) fa re(dod re)
    \tuplet 3/2 { lab'(sol fa) fa[(mib re)] re(mib fa) fa[(mib re)] } mib\upl mib(re mib) sol\upl mib(re mib)

    %34
    \tuplet 3/2 { sol(fa mib) mib[(re do)] do(re mib) mib[(re do)]\mbreak } re sib sib' sib sib sib sib sib
    do, la la' la la la la la sib, sol sol' sol sol sol sol sol
    fad la re, la' sib sol re sib' la8 fad sol sol

    %37
    \con \tuplet 3/2 { fad16(sol la) } la8\noBeam \tuplet 3/2 { do,16(re mib) } mib8\noBeam \tuplet 3/2 { la,16(sib do) } do8\noBeam \tuplet 3/2 { fad,16(sol la) } la8\noBeam
    re,16 re re re re re re re do''8 sib4 la8
    do, sib4 la8 \grace do sib la16(sol) re'8 re,

    %40
    \grace do' sib la16(sol) re'8 re, sol4 r\mbreak
    sol,\upl sib\upl re\upl sol\upl
    r8 sol sib do re4 re\tr

    %43
    r8 re mi fad sol4 sol\tr
    sib16 la sol fa? mi re dod sib la\parenthesize \f la la la la la la la
    sol' sol fa fa mi mi re re dod8 dod16(re mi8) mi
    \grace fa mi re16(mi fa8) fa \grace sol fa mi16(re sol8) sol

    %47
    \grace la sol(fa16 mi) \grace sol8 fa mi16(re mi8) la r16 re,\noBeam \tuplet 3/2 { \con mi(re dod) }
    la'8 re, r16 re \tuplet 3/2 { mi[(re dod)] }re8 la re,4
    sib4\upl re\upl fa\upl sib\upl
    r8 sib, re mib fa4 fa\tr

    %51
    r8 fa sol la sib4 fa'~
    fa16 mib re do sib la sol fa sol4 sol'~
    sol16 fa mi! re do sib la sol la4 la'~

    %54
    la16 sol fa mib re do sib la sib4 sib'~
    sib16 la sol fa mib re do sib la fa fa fa fa fa fa fa
    la do fa, do' re sib fa re' do8 fa fa  sib,

    %57
    la16 do fa, do' re sib fa re'\mbreak do8 sol' \con \tuplet 3/2 { fa16(mib re) } mib8\noBeam
    \tuplet 3/2 { re16(do sib) } sol'8\p\noBeam \senza\tuplet 3/2 { fa16(mib re) }  mib8\noBeam\tuplet 3/2 { re16(do sib) sib'\f[(la sol)] fa(mib re) do[(re sib)] }
    la8 la16 sib do8 do \grace re do sib16 do re8 re

    %60
    \grace mib? re do16 re mib!8 mib mib(re16 do) re8(do16 sib)
    \tuplet 3/2 { \con do(sib la) \senza la[(sol fa)] fa(mib re) re\parentSlur ([do sib)] re'(do sib) sib[(la sol)] sol(fa mib) mib[(re do)]
    mib'(re do) do[(sib la)] la(sol fa) fa[\parentSlur (mib re)]}\mbreak fa'8 sib, r16 sib \tuplet 3/2 { \con do[(sib la)] }

    %63
    fa'8 sib, r16 sib \tuplet 3/2 { do[(sib la)] } sib sib, sib sib sib sib sib sib
    \grace sol''8\p fa4. mib8 re16 sib,\f sib sib sib sib sib sib
    \grace sol''8\p fa4. mib8 sib'8.\f la32(sol) fa8 mib

    %66
    \tuplet 3/2 { \con re16\upl fa\upl mib?\upl re\upl[do\upl sib\upl] }  do4\tr \tuplet 3/2 { re16\p\upl fa\upl mib\upl re\upl[do\upl sib\upl] } do4\tr
    \tuplet 3/2 { re16\f\upl fa\upl mib\upl re\upl[do\upl sib\upl] } do4\tr sib8 sol mib fa
    sib,4 r r2

}

IvlIIn = \relative do'' {

    sib,4\upl re\upl fa\upl sib\upl
    r8 sib, re mib fa4 fa\tr
    r8 fa sol la sib4 sib\tr

    %4
    la16(sib do4) sib16\p(la) sib(do re4) do16(sib)
    do16\f(re mib4) re16\p\parentSlur (do) sib(do re4) re8\f
    \grace re8 do4.\tr sib16\p(la) sib(do re4) re8\f

    %7
    \grace re do4.\tr mib8\mbreak \grace mib re4.\tr fa8
    mib mib mib mib mib\tr re r4
    r fa~fa8 mib16 re mib8 mib,

    %10
    r4 sol'~sol8 fa16 mi! fa8 fa,
    r4 la'~la8 sol16 fa sol8 sol,
    r8 sol'~sol16 fa mib re do8 fa fa[fa,]

    %13
    r fa' fa sib, la16 do fa, do' re sib fa re'
    do la fa do' re sib fa re' do8 fa, r sib'\mbreak
    sib sib, r mib re16 fa sib, fa' sol mib sib sol'

    %16
    fa re sib fa' sol mib sib sol' fa8 fa fa16 la sol fa
    mi!8 do' do[do,] r do' do do,
    mi16 sol mi sol la fa do la' sol8 mi4 sib8

    %19
    la fa'4 do8 sib sol'4 sol8
    \grace la sol(fa16 mi) \grace sol8 fa(mi16 re) \tuplet 3/2 { mi(re do) do[(sib la)] mi(re do) do[(sib la)]
    fa''(mi re) re[(do sib)] fa(mi re) re[(do sib)] sol''(fa mi) mi[(re do)] do(sib la) la[(sol fa)]}

    %22
    la'8 do r16 la,\noBeam \con \tuplet 3/2 { sib(la sol) } la8 la' r16 la,\noBeam \tuplet 3/2 { sib(la sol) }
    la8 sib la sol fa fa sib, do
    fa4\upl la_\upl do\upl fa\upl

    %25
    r8 fa, la sib do4 do\tr
    r8 do re mi fa4 fa\tr
    mi16(fa sol4) fa16\parentSlur (mi) fa(sol la4.)

    %28
    mi,16\p(fa sol4) fa16(mi) fa(sol la4.)
    fa'16\f fa fa fa fa fa fa fa\mbreak fa fa fa fa mi mi mi mi
    la la la la la la la la la la la la sol sol sol sol

    %31
    sol sol sol sol fa fa fa fa mi\upl mi( re mi) sol\upl mi(re mi)
    \tuplet 3/2 { sol16(fa mi)\senza mi[(re dod)] dod(re mi) mi[(re dod)] } re\upl re(dod re) re, re'(dod re)
    \tuplet 3/2 { fa(mib re) re[(do si)] si(do re) re[(do si)] } do\upl do(si do) mib\upl do(si do)

    %34
    \tuplet 3/2 { mib?(re do) do[(sib? la)] la(sib do) do[(sib la)] }\mbreak sib8 re16 re re re, re' re,
    r8 do'16 do do re, do' re, r8 sib'16 sib sib re, sib' re,
    la'8 fad' sol sol fad16 la re, la' sib sol re sib'

    %37
    \con \tuplet 3/2 { la(sol fad) } fad8\noBeam \tuplet 3/2 { la,16(sib do) } do8\noBeam \senza \tuplet 3/2 { fad,16(sol la)} la8\noBeam \tuplet 3/2 { re,16(mi! fad) } fad8\noBeam
    re16 re re re fad fad fad fad la'8 sol4 fad8
    do sol4 fad8 \grace do' sib8(la16 sol) re'8 re,

    %40
    \grace do' sib8(la16 sol) re'8 re,\mbreak sol4 r
    sol,\upl sib\upl re\upl sol\upl
    r8 sol sib do re4 re\tr

    %43
    r8 re mi fad sol4 sol\tr
    sol16 fa? mi re sol fa mi re dod\parenthesize \f la la la la la la la
    mi' mi re re dod dod fa fa mi8 dod4 sol8

    %46
    fa re'4 la8 sol mi'4 mi8
    \grace fa mi re16 dod \grace mi8 re dod16 si dod8 la r16 fa \con \tuplet 3/2 { sol[(fa mi)] }\mbreak
    fa8 fa' r16 fa,\noBeam \tuplet 3/2 { sol(fa mi) } fa8 la re,4

    %49
    sib4\upl re\upl fa\upl sib\upl
    r8 sib, re mib fa4 fa\tr
    r8 fa sol la sib4 sib\parenthesize \tr

    %52
    r fa'~fa8 mib16 re mib8 mib,
    r4 sol'~sol8 fa16 mi! fa8 fa,
    r4 la'~la8 sol16 fa sol8 sol,

    %55
    r sol'~sol16 fa mib re do fa, fa fa fa fa fa fa
    fa8 fa' fa sib,\mbreak la16 do fa, do' re sib fa re'
    do8 fa fa sib, la4 r8 sol'

    %58
    \tuplet 3/2 { fa16(mib re) } mib8\p\noBeam \senza \tuplet 3/2 { re16(do sib) } sol'8\noBeam \senza \tuplet 3/2 { fa16[(mib re)] sol16\f(fa mib) re[(do sib)] la(sib do)] }
    do8 fa,4 mib8 re sib'4 fa8
    mib do'4 do8 \grace re do sib16 la \grace do8 sib la16 sol

    %61
    \tuplet 3/2 { la(sol fa) fa[(mib re)] la'(sol fa) fa[(mib re)] sib'(la sol) sol[(fa mib)] sib' (la sol) sol[(fa mib)]\mbreak
    do'(sib la) la[(sol fa)] do'(sib la) la[(sol fa)]} re'8 fa r16 re\noBeam \tuplet 3/2 { mib(re do)}
    re8 fa r16 re\noBeam \tuplet 3/2 { mib(re do) } re sib, sib sib sib sib sib sib

    %64
    \grace mib'8 re4.\p do8 sib16\f sib, sib sib sib sib sib sib
    \grace mib'8 re4.\p do8 sib'8.\f la32(sol) fa8 mib
    re sib4 la8 r sib4\p la8

    %67
    r sib4\f la8 sib sol mib fa
    sib,4 r r2

}

Ivlan = \relative do' {

    sib4\upl re\upl fa\upl sib\upl
    r8 sib, re mib fa4 fa\tr
    r8 fa sol la sib4 sib\tr

    %4
    r r8 fa\p fa fa fa fa
    mib\f mib do do fa,\p fa fa' fa
    la\f la la la fa\p fa fa fa

    %7
    fa\f fa fa fa\mbreak fa fa fa fa
    sib sib la la fa fa r4
    r8 fa16 mib re8 sib r sol'16 fa mib8 do

    %10
    r sol'16 fa mi!8 do r  la'16 sol fa8 do
    r la'16 sol fa8 re r sib'16 la sol8 mib
    r sib'16 la sol8 sol, la fa' sib sib

    %13
    la fa sib sib la fa sib sib \mbreak
    la  fa sib sib la sib sib sol
    re re sib sib sib fa' mib mib

    %16
    re fa mib mib re re re re
    sol, sol' fa fa mi! sol fa fa
    do1~

    %19
    do~
    do2. r4
    do r mi r

    %22
    r8 do'16. sib32 la8 mi r do16. sib32 la8 mi\mbreak
    la8 sol fa do' do4 r
    fa\upl la\upl do\upl fa\upl

    %25
    r8 fa, la sib do4 do\tr
    r8 do re  mi fa4 fa\parenthesize \tr
    r r8 do, do do do do

    %28
    sol\p la sib do r la'16 sib do8 la
    r la,16\f sib do8 la r do do do\mbreak
    r do do do fa fa mi mi

    %31
    do16 do do do do do do do do4 r
    mi8 mi re la la4 r
    re8 re re sol, sol4 r

    %34
    do8 do do fa, fa re' fa fa
    fa fa la la re, re re re
    re re' re, re'\mbreak re, re' re, re'

    %37
    re,4 r re16 re re re re re re re
    re4 r16 la la la fad'8 sol r4
    fad8 sol r4 \grace \parenthesize do8 sib8 la16 sol re'8 re,

    %40
    sib' la16 sol re'8 re, sol4 r
    sol,\upl sib\upl re\upl sol\upl
    r8 sol sib do re4 re\parenthesize \tr\mbreak

    %43
    r8 re, mi fad sol4 sol\parenthesize \tr
    r2 mi16\parenthesize \f mi mi mi mi mi mi mi
    la,2 la

    %46
    la la
    la~la8 la la la
    r8 la'16. sol32 fa8 la, la4 r

    %49
    sib\upl re\upl fa\upl sib\upl
    r8 sib, re mib fa4 fa\parenthesize \tr\tr\mbreak
    r8 fa sol la sib4 sib\parenthesize \tr

    %52
    r8 fa16 mib re8 sib r sol'16 fa mib8 do
    r sol'16 fa mi!8 do r la'16 sol fa8 do
    r la'16 sol fa8 re r sib'16 la sol8 mib

    %55
    r8 sib'16 la sol8 sol, fa'16 fa fa fa fa fa fa fa
    fa8 fa fa fa fa fa re re\mbreak
    fa do sib fa' fa do re do

    %58
    sib4 r sib\p r
    fa'1\f~
    fa

    %61
    fa4 r fa r
    la, r r8 fa'16 mib re8 do
    r8 fa16 mib re8 do sib16 sib sib sib sib sib sib sib

    %64
    sib8\p fa' fa la,\mbreak r16 sib\f sib sib sib sib sib sib
    sib8\p fa' fa la, re\f mib fa do
    fa, fa' sol fa fa\p fa sol fa

    %67
    fa\f fa sol fa sib, sol' mib fa
    sib,4 r r2

}

Ibcn = \relative do {

    sib4\upl re\upl fa\upl sib\upl
    r8 sib,8 re mib fa4 fa\tr
    r8 fa sol la sib4 sib\parenthesize \tr

    %4
    do8 sib la fa sib\p sib, sib sib
    la\f la la la sib\p sib sib sib
    la\f fa' fa fa, sib\p sib sib sib

    %7
    fa'\f fa fa fa sib sib sib sib
    sol sol la la sib sib, r4
    re8 re re re\mbreak mib mib sol mib

    %10
    r mi! mi mi fa fa la fa
    r fa fa fa sol sol sib sol
    r mib mib mib fa la sib sib,

    %13
    fa' la sib sib, fa' la sib sib,
    fa' la sib sib, fa' re mib mib
    sib re mib mib sib re mib mib

    %16
    sib re mib mib  sib sib' sib sib,
    do mi! fa fa, do' mi fa fa,\mbreak
    do'1\tasto~

    %19
    do~
    do2~do4 r
    fa r sol r

    %22
    r8 la16. sol32 fa8 do fa la16. sol32 fa8 do
    fa sol la mib fa4 r
    \clef tenor fa\upl la\upl do\upl fa\upl

    %25
    r8 fa, la sib do4 do\tr \mbreak
    r8 do re mi fa4 fa\tr
    \clef bass sol,8 fa mi do fa fa16 sol la8 fa

    %28
    sol\p fa mi do r fa16 sol la8 fa
    r fa16\parenthesize \f sol la8 fa r do16 re mi8 do
    r fa16 sol la8 fa re16 re re re mi mi mi mi

    %31
    fa fa fa fa fa fa fa fa do4 r\mbreak
    dod8 mi la la, re4 r
    si8 re sol sol, do4 r

    %34
    la8 do fa fa, sib sib' re sib
    fa fa fad fad sol sol sib sol
    re re' re, re' re, re' re, re'

    %37
    re,4 r re16 re re re re re re re\mbreak
    re4 r16 re re re re4 r
    re r \grace do'8 sib la16 sol re'8 re,

    %40
    sib' la16 sol re'8 re, sol4 r
    sol,4\upl sib\upl re\upl sol\upl
    r8 sol sib do re4 re\parenthesize \tr

    %43
    \clef tenor r8 re mi fad sol4 sol\parenthesize \tr
    r2\clef bass la,,16\f la la la la la la la\mbreak
    la2 la

    %46
    la la
    la~la8 dod re[la']
    r fa16. mi32 re8 la' re,4 r

    %49
    sib4\upl re\upl fa\upl sib\upl
    r8 sib, re mib fa4 fa\tr
    r8 fa sol la sib4 sib\tr

    %52
    re,8 re re re\mbreak mib mib sol mib
    r mi! mi mi fa fa la fa
    r fa fa fa sol sol sib sol

    %55
    r mib mib mib fa16 fa fa fa fa fa fa fa
    fa8 la sib sib, fa' la sib sib,
    fa' la sib sib, fa' mib re la

    %58
    sib4 r sib\p r
    fa'2\f~fa\mbreak
    fa~fa

    %61
    fa4 r sib, r
    do r r8 re16 do sib8 fa'
    r re16 do sib8 fa' sib,16 sib sib sib sib sib sib sib

    %64
    sib8\p sib' sib fa r16 sib,\f sib sib sib sib sib sib
    sib8\p sib' sib fa sib,\f do re la
    sib re mib[fa]\mbreak sib,^\p re  mib fa

    %67
    sib\f re, mib fa sol sol mib fa
    sib,4 r r2

}

Ibfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s1*4
	<7>4 s8 <6> s2
	<5>4 <7>8 <6> s2
	<5 4>4 <5> <9>2
	<6 5>1
	s2 <5/>4 <6>
	s8 <_+> <6> s <9>4 <6>
	s8 <5> <6>4 <9> <6>
	s1*2
	s2 s8 <6> s4
	s1*14
	s2 s8 <5 4> <6>4
	s8 <9>16 <5> <6>4 s2
	s1
	<7- 5>
	<7- 5>4 <_!> s2
	<7- 5>1
	s
	<_+>4 <6 4> <_+> <6 4>
	<_+>2 <_+>
	<_+>2 <7 _+>8 <6 4> s4
	<7 _+>8 <6 4> s4 s2
	s1*4
	s2 <_+>
	s2 <_+>
	<6 5>4 <6 4> <6 7> <6 5>
	<7 5 _+> <6> <7 5>2
	s8 <6> s4 s2
	s1*3
	s2 <9>8 <8> <6>4
	s8 <5> <6>4 <9>8 <8> <6>4
	s8 <5> <6>4 <9>8 <8> <6> <6->
	s8 <5> <6>4 s2
	s1
	s2 s4 s8 <7 5>
	s1
	s2 <6 5>
	<6 7>4 <5 6> <7 5> <6 4>
	<5 3>1
	<6>2 s8 <6> s4
	s1*2
	s2 s4 s8 <5->
	s8 <6> <6 5>4 <6> <6 5>
	s8 <6> <6 5>

}

forma = {

\time 4/4
\key re\minor
\tempo 2 = 50
s1*68
\bar"|."

}


IvlI = {
	\global
	\notypeset
	<<\IvlIn \forma>>

}

IvlII = {
	\global
	<<\IvlIIn \forma>>

}

Ivla = {
	\global
	\clef alto
	<<\Ivlan \forma>>

}

Ibc = {
	\global
	\clef bass
	<<\Ibcn \forma \Ibfn>>
	\typeset

}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine \con

}

IIvlIn = \relative do'' {

    re8
    sol re4 sib'8(la sol)
    fad \grace mib re4 do'8(sib la)
    sib \grace la sol4 re'8(do sib)

    %4
    sib4\tr la re
    si8 si4 si8(do re)
    fa,! fa4 fa8(sol lab)

    %7
    si, si4 lab'8(sol fa)
    mib re \grace re do4 do'
    la!8  la~[la] la(sib do)

    %10
    mib, mib4 mib8(fa sol)\mbreak
    la, la~[la] sol'(fa mib)
    re do \grace do sib4 sib'

    %13
    \grace la8 sol16(fad) sol4 fad8(mi re)
    dod16(si) la4 sol'8(fa mi)
    fa16 mi re4 mi8(re dod)

    %16
    \grace dod?8 re4. sib8(la sol)
    fa16(mi re4) sol8(fa mi)
    \grace mi?8 re2~re8 la'

    %19
    re la4 fa'8(mi re)
    dod \grace si la4 sol'8(fa mi)
    fa8 re4 la'8(sol fa)

    %22
    fa4\tr mi\p la\mbreak
    fad8 fad4 fad8(sol la)
    sib(la) \grace la sol4 r8 sol,\f

    %25
    do sol4 mib'?8((re do)
    si sol4 fa'8(mib re)
    mib do4 do'8 la sol

    %28
    fad fad4 fad8(sol la)
    sol sol4 sol8(la sib)
    la la4 do8(sib la)

    %31
    sib sib,4 sib8(la sol)
    fad16(la) mib'4 do8(sib la)
    sol4. la8\p(sol fad)

    %34
    sol16(sib) mib4 do8	\f(sib la)
    \grace la sol2~sol8\noBeam sol2.

}

IIvlIIn = \relative do'' {

    r8
    r re\upl sol\upl re(do sib)
    r fad\upl fad'\upl la(sol fad))
    r sol,\upl sol'\upl sib(la sol)

    %4
    sol4\tr fad r
    r8 sol,\upl re'\upl re(mib fa?)
    r sol,\upl re'\upl re(mib fa)

    %7
    r8 sol,\parenthesize \upl re'\parenthesize \upl fa(mib re)
    do sol do,4 r
    r8 fa\parenthesize \upl do'\parenthesize \upl do(re mib)

    %10
    r fa,\upl do'\upl do(re mib)
    r fa,\upl do'\upl do(re mib)\mbreak
    sib fa sib,4 r

    %13
    r r sol''
    mi16(re mi4) mi8(re dod)
    r la'\parenthesize \upl re\parenthesize \upl sol,(fa mi)

    %16
    r la,\parenthesize _\upl re\parenthesize _\upl sol,(fa mi)
    r la\parenthesize _\upl re\parenthesize _\upl mi,(re dod)
    \grace dod?8 re2~re8 r

    %19
    r la'_\upl re_\upl la(sol fa)
    r dod_\upl dod'_\upl mi(re dod)
    r re,\parenthesize _\upl re'\parenthesize _\upl fa(mi re)

    %22
    re4\tr dod r
    r8 la\p re re(mi fad)
    sol(re) sol, 4 r\mbreak

    %25
    r8 sol\parenthesize _\upl do\parenthesize _\upl sol(fa mib?)
    r si_\upl si'_\upl re(do si)
    r do,\parenthesize _\upl mib \parenthesize _\upl mib'(do sib?)

    %28
    r re,_\upl la'_\upl la(sib do)
    r sib,\parenthesize _\upl sib'\parenthesize _\upl sib(do re)
    r re,\parenthesize \upl fad'\parenthesize \upl la(sol fad)

    %31
    r re,\parenthesize _\upl sol\parenthesize _\upl re'\parentSlur (do sib)
    r8 do4 la8(sol fad)
    r re sol do\p(sib la)

    %34
    r do4 la8\f(sol fad)
    \grace fad? sol2~sol8 sol2.

}

IIvlan = \relative do' {

    r8
    sib4 re mib
    la, la re
    re re mib

    %4
    re2 r4
    sol,8 sol sol sol sol sol
    sol sol sol sol sol sol

    %7
    sol sol sol sol sol sol
    sol4 sol r
    fa'8 fa fa fa fa fa

    %10
    fa fa fa fa fa fa
    fa fa fa fa fa fa
    fa4 fa r\mbreak

    %13
    re8 re re re sib sib
    la la la la la la
    la4 r8 sib' la[la]

    %16
    fa4 r r
    r8 fa fa sib, la la
    la2~la8 r

    %19
    fa'4 la sib
    mi, mi la
    la la sib

    %22
    la la r
    la8\parenthesize ^\p re, re re re re
    re4 re si

    %25
    do\parenthesize ^\f do lab
    sol8 sol sol sol sol sol\mbreak
    sol sol sol sol sol sol

    %28
    re' re re re re re
    re re re re re re
    re re re re re re

    %31
    sol sol sol sol mib! mib
    la,4 r8 mib' re re
    sib4 r8 mib\p re re

    %34
    sib4 r8 mib\f re re
    <<{re2~re8}\\{sib2~sib8}>> <<re2.\\sib>>

}

IIbcn = \relative do {

    r8
    sol4 sib do
    re re re
    sol, sib do

    %4
    re2 r4
    sol,8 sol sol sol sol sol
    sol sol sol sol sol sol

    %7
    sol sol sol sol sol sol
    do4 do, r
    fa'8 fa fa fa fa fa

    %10
    fa fa fa fa fa fa\mbreak
    fa fa fa fa fa fa
    sib4 sib, r

    %13
    sib8 sib sib sib sol sol
    la la la la la la
    re mi fa sol la la,

    %16
    re4 r r
    r8 re fa sol la la,
    re2~re8 r

    %19
    re4 fa sol
    la la la
    re, fa sol

    %22
    la la, r\mbreak
    re8^\p re re re re re
    sol4 sol fa

    %25
    mib^\f mib fa
    sol8 sol, sol sol sol sol
    do do do do do do

    %28
    re re re re re re
    re re re re re re
    re re re re re re

    %31
    sol sol sol sol do, do
    re4 r8 do re re,
    sol4 r8 do\p re re,

    %34
    sol4 r8 do\f re re,
    sol2~sol8 sol2.

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2.*3
    <6 4>4 <5 3+> s
    <7 5 _!>2.
    <7 5 _!>
    <7 5 _!>
    s
    <_!>4 s s8 <7>
    <7->2.
    s
    s
    <6>4 s <6!>8 <5>
    s4 s8 <7> <6 4> <5 3+>
    s2.*2
    s4 s8 <6!> <6 4> <5 3+>
    s2.
    s4 <6> <6!>8 <5>
    <3+>2.
    s4 <6> <6!>
    <6 4> <5 3+> s
    <_+>2.
    s4 <_!> <6 4!>
    <6>2.
    <_!>
    s
    <_+>
    <6 4>
    <5 _+>4 s8 <7> <6 4> <5 3>
    s2.
    <_+>4 s <6 4>8 <5 3+>
    <_+>4 s <6 4>8 <5 3+>
    <_+>4 s <6 4>8 <5 3+>

}

forma = {

    \time 3/4
    \key sol\minor
    \tempo 4 = 65
    \partial 8 s8
    s2.*17
    s2 s8 \bar ":..:"\break
    \repeat volta 2{s8 s2.*16}
    \alternative {{\grace s8 s2 s8}{s2.}}
    \bar "|."

}


IIvlI = {
    \global
    \notypeset
    <<\IIvlIn \forma>>

}

IIvlII = {
    \global
    <<\IIvlIIn \forma>>

}

IIvla = {
    \global
    \clef alto
    <<\IIvlan \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

}


global = {
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\terzine \con

			}

IIIvlIn = \relative do'' {

    sib'8[sib, sib' sib]
    sib[sib, sib' sib]
    sib sib, r sib

    %4
    la[sol fa mib]
    re[do sib \once\stemDown sol'']\p
    fa16\upl fa(mib re) mib\upl mib(re do)

    %7
    re(do) sib8 r sib\f
    la[sol fa mib]
    re[do sib \once\stemDown sol'']\p

    %10
    fa16\upl fa(mib re) mib\upl mib(re do)
    re\f sib re fa sib sib sib sib
    re, sib re fa sib sib sib sib\mbreak

    %13
    do, la do fa la la la la
    do, la do fa la la la la
    sib, sol sib mib sol sol sol sol

    %16
    sib, sol sib mib sol sol sol sol
    la, do sib re do mib re fa
    mi! sol fa la sol sib la do

    %19
    sib8 re mi, sol
    sib, mi r sol
    r sib r re

    %22
    r16 sol, la sib la8 do
    r fa, r la
    r re, r16 fa sol la\mbreak

    %25
    sol8 sib r mi,
    r sol r sib,
    r16 la' sol fa sol8 fa

    %28
    mi16 do mi do fa do fa do
    sol' do, sol' do, la' do, la' do,
    mi\p do mi do fa do fa do

    %31
    sol' do, sol' do, la' do, la' do,
    sib'\f re do sib la8 sol
    fa4 sol\tr

    %34
    fa16 mi re do fa mi re do
    sib8 la16 sol la8 sib
    la4 sol\tr

    %37
    fa2
    fa'8[fa, fa' fa]
    fa[fa, fa' fa]

    %40
    fa fa, r fa'
    mi[re do sib]
    la[sol fa\once\stemDown re''\p]

    %43
    do16\upl do(sib la) sib\upl sib(la sol)
    la sol fa8 r fa\f
    mi[re do sib]

    %46
    la[sol fa\once\stemDown re''\p]
    do16\upl do(sib la) sib\upl sib(la sol)
    la\f fa do fa la la la la

    %49
    la fa do fa la la la la
    la fad re fad la la la la\mbreak
    la fad re fad la la la la

    %52
    sib sol re sol sib sib sib sib
    sib sol re sol sib sib sib sib
    do8 do r re,

    %55
    r do' \grace re do sib16 la
    sib8 re r fad,
    r la r do,

    %58
    r16 mib re do sib8 la
    sib32(la sol8.) r8 r16 sol'
    la4 fad\tr

    %61
    sol r8 r16 sib,\mbreak
    do4\p la\tr
    sol r16 fa'\f(sol la)

    %64
    sib8[sib, sib' sib]
    sib[sib, sib' sib]
    sib sib, r sib

    %67
    la[sol fa mib]
    re[do sib\once\stemDown sol'']
    fa sib r sol

    %70
    r mib r16 re do sib
    la fa la fa sib fa sib fa
    do' fa, do' fa, re' fa, re' fa,

    %73
    la\p fa la fa sib fa sib fa
    do' fa, do' fa, re' fa, re' fa,
    mib'\f sol fa mib re8 do

    %76
    sib4 \grace re8 do4\tr
    sib16 la sol fa sib la sol fa
    mib8 re16(do) re8 mib

    %79
    re4 do\tr
    sib sib''~
    sib16 la sol fa mib re do sib

    %82
    sol' fa mib re do sib la sol
    mib4 fa
    sib,2

}

IIIvlIIn = \relative do'' {

    sib'8[sib, sib' sib]
    sib[sib, sib' sib]
    sib sib, r sib

    %4
    la[sol fa mib]
    re[do sib \once\stemDown mib']\p
    re16\upl\p re(do sib) do\upl do(sib la)

    %7
    sib8 sib, r sib'\f
    la[sol fa mib]
    re[do sib \once\stemDown mib']\p

    %10
    re16\upl\p re(do sib) do\upl do(sib la)
    sib8 \f re4 fa8~
    fa sib4 re,8

    %13
    la do4 fa8~\mbreak
    fa la4 do,8
    sib mib4 sol8~

    %16
    sol sib4 sib,8
    la16 do sib re do mib re fa
    mi! sol fa la sol sib la do

    %19
    sib8 [sib sib, sib]
    sol sol r mi'!
    r sol r sib

    %22
    r16 mi, fa sol fa8 la
    r la r do
    r sib, r16 re mi fa

    %25
    mi8 sol r sol
    r mi r sol,
    r16 fa' sol la sib8 re,\mbreak

    %28
    sol, sol' r4
    do8[do, do' do]
    do\p[do, do' do]

    %31
    do[do, do' do]
    sol16\f sib la sol fa8 fa
    fa4 mi\tr

    %34
    fa16 do sib la la' do, sib la
    sol8 fa16 mi fa8 fa
    fa4 mi\tr

    %37
    fa2  %%% OOKK
    fa'8[fa, fa' fa]
    fa[fa, fa' fa]

    %40
    fa fa, r fa'
    mi[re do sib]
    la[sol fa\once\stemDown sib']\p

    %43
    la16\upl la(sol fa) sol\upl sol(fa mi)
    fa8 fa, r fa'\f
    mi[re do sib]

    %46
    la[sol fa\once\stemDown sib']\p
    la16\upl la(sol fa) sol\upl sol(fa mi)
    la,8\f do4 fa8~

    %49
    fa la4 do8~
    do fad,4 fad8~
    fad la4 fad8

    %52
    sol sol4 re'8\parentSlur (
    re) sib4 sol8
    fad la r fad

    %55
    r la la sol16 fad\mbreak
    sol8 sib r la
    r fad r la,

    %58
    r16 do sib la sol8 fad
    sol sol, r r16 sib'
    do4 la\tr

    %61
    sol8 sol, r r16 sol'
    la4\p fad\parenthesize \tr
    sol r16 fa'\f(sol la)

    %64
    sib8[sib, sib' sib]
    sib[sib, sib' sib]
    sib sib, r sib

    %67
    la[sol fa mib]
    re[do sib\once\stemDown mib']\mbreak
    re sol r mib

    %70
    r sol r sol
    do, fa, r4
    fa'8[fa, fa' fa]

    %73
    fa\p[fa, fa' fa]
    fa[fa, fa' fa]
    do16\f mib re do sib8 sib

    %76
    sib4 la\tr
    sib16 fa mib re re' fa, mib re
    do8 sib16 \parentSlur (la) sib8 sib

    %79
    sib4 la\tr
    sib r
    r sib''\f~\mbreak

    %82
    sib16 la sol fa mib re do sib
    mib,4 fa
    sib,2

}

IIIvlan = \relative do' {

    re'8[do sib la]
    sib[la sol fa]
    sol[sol fa re]

    %4
    r sol[fa mib]
    re do sib4
    R2

    %7
    r4 r8 sib'\f
    la[sol fa mib]
    re do sib4

    %10
    R2
    fa'16 fa fa fa fa sib, re fa
    sib, fa' fa fa fa re re re\mbreak

    %13
    do fa fa fa fa fa la do
    la fa fa fa fa fa la do
    sol sol sol sol sol mib sol sib

    %16
    sol sol, sol sol sol8 sol'
    fa[sol la sib]
    do,[re mi! fa]

    %19
    sol r mi r
    mi r sol r
    sib r sol r

    %22
    mi r do r
    fa r la r\mbreak
    re, r re r

    %25
    do r mi r
    sol r mi r
    la4 re,8 re

    %28
    do'[do, do' do]
    mi, [sol fa la]
    sol\p[sol la la]

    %31
    mi[sol fa la]
    mi\f[do do re]
    do4 do

    %34
    do do
    mi8[do do mi]
    do4 do

    %37
    la2\mbreak
    la'8[sol fa mi]
    fa[mi re do]

    %40
    re[re do la]
    r re'[do sib]
    la sol fa4

    %43
    R2
    r4 r8 fa\parenthesize \f
    mi[re do sib]

    %46
    la sol fa4
    R2
    fa'16\parenthesize \f fa fa fa fa fa la do

    %49
    do, do do do do fa la do
    fad, fad fad fad fad fad la re\mbreak
    re, re re re re re fad la

    %52
    sol sol sol sol sol sol sib re
    sol, sol sol sol sol sol sib re
    la8 r re, r

    %55
    fad r fad r
    re r fad r
    la r la r

    %58
    fad r re r
    sib[la sol re']
    mib4 re

    %61
    sib8[do re re]\mbreak
    mib4\p re
    re r

    %64
    re'8\f[do sib la]
    sib[la sol fa]
    sol[sol fa re]

    %67
    r sol[fa mib]
    re do sib4
    sib8 r sol' r

    %70
    sol r sol r
    fa[fa, fa' fa]
    la,[la sib sib]

    %73
    do\p[do re re]
    do[do sib sib]
    la\f [fa' fa sol]\mbreak

    %76
    fa4 fa
    re fa
    la,8[fa fa sol]

    %79
    fa4 fa
    re''16 do sib la sol fa mib re
    sol8[sol sol sol]

    %82
    mib mib r r16 sol
    mib4 fa
    sib,2

}

IIIbcn = \relative do {

    sib'8[la sol fa]
    sol[fa mib re]
    mib[mib re sib]

    %4
    r sol'[fa mib]
    re[do sib] r
    R2

    %7
    r4 r8 sib'
    la[sol fa mib]
    re[do sib] r

    %10
    R2
    sib'8\f[sib, sib' sib]
    sib[sib, sib' sib]

    %13
    fa'[fa, fa' fa]
    fa[fa, fa' fa]
    sol,[sol, sol' sol]\mbreak

    %16
    sol[sol, sol' mib]
    fa[sol la sib]
    do,[re mi! fa]

    %19
    sol r sol r
    mi r do r
    sol' r mi r

    %22
    do r fa r
    la r fa r
    sib, r sib' r

    %25
    mi, r do r
    mi r do r
    fa4 sib,8 si

    %28
    do[do la fa']
    mi[mi fa fa]\mbreak
    do'\p[do la fa]

    %31
    mi[mi fa fa]
    sol^\f[do, fa sib]
    do4 do,

    %34
    fa fa,
    sol'8[mi fa sib,]
    do4 do,

    %37
    fa2
    fa'8[mi re do]
    re[do sib la]

    %40
    sib[sib la fa]
    r re''[do sib]
    la sol fa4

    %43
    R2
    r4 r8 \clef tenor fa'\parenthesize \f\mbreak
    mi[re do sib]

    %46
    la sol fa4\clef bass
    R2
    fa'8\parenthesize \f[fa, fa' fa]

    %49
    mib[mib, mib' mib]
    re[re, re' re]
    do[do, do' do]

    %52
    sol[sol, sol' sol]
    sol[sol, sol' sol]
    la r fad r

    %55
    re r re r
    sol r re' r
    do r fad, r

    %58
    re r re r\mbreak
    sol[fa  mib sib]
    do[la re re,]

    %61
    sol[la sib sol]
    do^\p[la re re,]
    sol4 r

    %64
    sib'8\f[la sol fa]
    sol[fa mib re]
    mib[mib re sib]

    %67
    r sol'[fa mib]
    re[do sib] r
    sib r sib r

    %70
    mib r mi r
    fa[fa re re]\mbreak
    la[la sib sib]

    %73
    fa'\p[fa re re]
    la[la sib sib]
    do^\f [fa sib mib,]

    %76
    fa4 fa,
    sib sib
    do8 [fa, sib mib,]

    %79
    fa4 fa
    sib'16 la sol fa mib re do sib
    sib'8[sib, sib' sib]

    %82
    sib sib, r r16 sol'
    mib4 fa
    sib,2

}

IIIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s2*14
	<6->2
	<6->
	s
	<_!>
	s2*9
	s4 <6>
	s2
	s4 <6>
	s2
	<6>4 s8 <6 5>
	<6 4>4 <3>
	s2
	s
	<6 4>4 <5 3>
	s2*12
	<6 4>2
	<7 3+>
	<6 4+ 2>
	s
	s
	<6+>
	s4 <7>
	s <_+>
	<6 4+>s
	<7> <6 4>8 <3+>
	s2*3
	<6>4 <5 3+>
	s2*6
	s4 <6 4->
	s2
	s4 <6>
	<6>2
	s
	s
	<_->
	s
	s
	s8 <6> s4
	s2*2
	<6 4->2
	<6 4->
	<6 5>

}

forma = {

\time 2/4
\key fa\major
\tempo 2 = 60
s2*37
\bar":..:"\break
s2*47
\bar":|."

}


IIIvlI = {
	\global
	%\notypeset
	<<\IIIvlIn \forma>>

}

IIIvlII = {
	\global
	<<\IIIvlIIn \forma>>

}

IIIvla = {
	\global
	\clef alto
	<<\IIIvlan \forma>>

}

IIIbc = {
	\global
	\clef bass
	<<\IIIbcn \forma \IIIbfn>>
	\typeset

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller "Concerto VII ”Teatrale” [Op. I]"
    %subsubtitle = #(string-append " ")
    composer = \markup \center-column{"   ""L. Zavateri(1690 - 1764)"}
}

\markup \huge {[1.] Vivace}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"Violino""P.mo"}
            \IvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup  \center-column{"Violino ""Secondo"}
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
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup  \center-column{"Organo"}
            \Ibc

        >>
    >>

    \layout {

        indent = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[2.] Andante mezzo piano}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \IIbc

        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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

\markup \huge {[3.] Allegro}

\score {

    \new ChoirStaff <<

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            %\override SpacingSpanner.uniform-stretching = ##t
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
