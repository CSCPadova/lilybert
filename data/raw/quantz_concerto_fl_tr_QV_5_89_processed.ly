\language "italiano"
	%********************************** VARIABILI

\version "2.18.0"

acc = \once \override Flag.stroke-style = #"grace"

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto Solo"

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
    \senza \terzinequarto
}

Ifln = \relative do'' {

    \new CueVoice {
        \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f \tuplet 3/2 { mib,8 mib mib mib[mib mib] mib mib mib mib[mib mib] }
        do'4\staccatissimo sib\staccatissimo re\staccatissimo mib\staccatissimo
        do sib8. mib16 re4\staccatissimo mib\staccatissimo

        %4
        do\tr sib r2
        do16\p[(lab8.) sol16(fa8.)]\mbreak sib4 re,
        \grace re4 mib2 lab16[(fa8.) mib16(re8.)]

        %7
        \grace re4 mib2 lab16[(fa8.) mib16(re8.)]
        R1*23
        \tuplet 3/2 { do'8\f do do do[do do] do do do re[re re] }\mbreak
        \tuplet 3/2 {

            %32
            mib sol fa mib[re do] sib do sib lab[sol lab]
            sol sol sol mib'[mib mib] fa, fa fa re'[re re]
            mib, mib mib mib[mib mib] mib mib mib mib[mib mib]

            %35
            lab mib mib sib'[mib, mib] do' mib, mib re' [mib, mib]
        }\mbreak
        mib'4\staccatissimo do\staccatissimo lab\staccatissimo sib\staccatissimo
        mib,2 r
    }

    %38
    sib'4.\solo do16 re mib8 sol fa mib
    do'4 sib2.
    do16[(lab8.) sol16(fa8.)] sib4 re,

    %41
    \grace re mib2 lab16[(fa8.) mib16(re8.)]\mbreak
    \grace re4 mib2 lab16[(fa8.) mib16(re8.)]
    \grace re4 mib4. sib'8 lab4 sol

    %44
    \grace lab8 sol4 fa8. sib16 lab4 sol
    sol\tr fa r2
    \new CueVoice {
        \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f \tuplet 3/2 { mib,8\f mib mib mib[mib mib] mib mib mib mib[mib mib] }

        %47
        reb'4\staccatissimo do\staccatissimo sib\staccatissimo lab\staccatissimo
        reb\staccatissimo do\staccatissimo
    }  reb'2\solo
    do16[(lab8.) sol16(fa8.)] \grace lab8 sol4 \grace fa8 mi4

    %50
    \grace mi fa2 sib16[(sol8.) fa16(mi8.)]
    \grace mi4 fa2 sib16[(sol8.) fa16(mi8.)]\mbreak
    <<fa4\\{\new CueVoice {\shiftOn
        \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f \tuplet 3/2 { fa,8\f fa fa fa[fa fa] fa fa fa fa[fa fa] }}}>>
        \new CueVoice {
        \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f

        %53
        mib'4\staccatissimo re!\staccatissimo do\staccatissimo sib\staccatissimo
        mib\staccatissimo re\staccatissimo
    } mib'2\solo
    re16[(sib8.) la16(sol8.)] \grace sib8 la4 \grace sol8 fad4

    %56
    \grace fad4 sol2 do16[(la8.) sol16(fad8.)]\mbreak
    \grace fad4 sol2 do16[(la8.) sol16(fad8.)]
    \tuplet 3/2 { sol8 fad sol } sol4\tr \tuplet 3/2 { la8 sol la } la4\tr

    %59
    \tuplet 3/2 { sib8 la sib do[sib do] re do sib la[sib sol] }
    \grace sol4 fad2 r4 sib\mbreak
    \tuplet 3/2 { la8 fad re la'[fad re] sib' sol re sib'[sol re] }

    %62
    la'8. dod16 re2 sib4
    \tuplet 3/2 { la8 fad re la'[fad re] sib' sol re sib' sol re }
    la'8. dod,16 re2 la'4
    \tuplet 3/2 {

        %65
        sib8 sol re sib'[sol re]\mbreak mib sol do mib,[sol do]
        la fa? do la'[fa do] re fa sib re,[fa sib]
        sol mib sib sol'[mib sib] do mib la do,[mib la]

        %68
        fad re la fad'[re la] sib re sol sib,[re sol]\mbreak
        mib do re mib[re do] sol' do, re mib[re do]
    }
    do'4. sib8 la sol fa mib
    \tuplet 3/2 {

        %71
        re mib fa sol[la sib] la sol fa mib[re do]
        re mib fa sol[la sib] la sol fa mib[re do]
        re do sib fa'[mib re] lab'! sol fa do'[sib lab]

        %74
        sol fa mib mib'[re do]
    } \grace sib4 la2\mbreak
    \tuplet 3/2 { sib8 la sol } fa2 sol4
    \tuplet 3/2 { re8 do sib la[sol fa] } do'2\tr

    %77
    \tuplet 3/2 { sib'8 la sol } fa8[fa] fa fa fa sol
    re16[(re'8.) la16(sib8.)] do,2\tr
    \new CueVoice {
        \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f

        %79
        <<sib4\\{\new CueVoice {
        \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f \shiftOn \tuplet 3/2 { sib8\f sib sib sib[sib sib] sib sib sib sib[sib sib] }}}>>\mbreak
        sol'4\staccatissimo fa\staccatissimo la\staccatissimo sib\staccatissimo
        sol fa8. sib16 la4 sib

        %82
        sol\tr fa r2
        sol16\p[(mib8.) re16(do8.)] fa4 la,
        \grace la sib2 mib16[(do8.) sib16(la8.)]\mbreak

        %85
        \grace la4 sib2 mib16[(do8.) sib16(la8.)]
        \tuplet 3/2 { sib8\f do re mib[fa sol] fa sol la sib[do re] }
        \grace re4 do2. mib,4

        %88
        \tuplet 3/2 { re8 mib fa } fa4 mib re
        re\tr  do8. fa16\mbreak mib4 re
        re\tr do r2
    }
    \tuplet 3/2 {

        %91
        sib8\solo re mib fa[sol la] sib re, mib fa[sol la]
        sib re, mib fa[sol la]\mbreak
    } sib sib,16 do re mib fa sol
    lab!4 lab2 sol16(fa8.)

    %94
    \tuplet 3/2 { mib8 sol fa mib[re do] do' sol fa mib[re do] }
    lab'4 lab2 sol16(fa8.)
    \tuplet 3/2 { mib8 sol fa mib[re do] do' sol fa mib[re do] }

    %97
    lab'8 sib lab sol fa mib re do
    si2 r4 re
    \tuplet 3/2 {
        mib8 sol mib do [mib do] sol si re fa[mib re]

        %100
        mib sol mib do [mib do] sol si re fa[mib re]
        mib sol mib do[mib sol]\mbreak lab do lab fa[lab fa]
        re fa re sib[re fa] sol sib sol mib[sol mib]

        %103
        do mib do lab[do mib] fa lab fa re[fa re]
        si re si sol[si re] mib sol do sol[mib do]
        si re si sol[si re] mib sol do sol[mib do]

        %106
        si sol si re[si re] sol re sol si[sol si]
    }
    re fa, fa fa fa fa lab16 sol fa8
    re' fa, fa fa fa fa lab16 sol fa8\mbreak

    %109
    re' do si lab sol fa mib re
    \tuplet 3/2 {
        mib sol mib do[mib do] si re si sol[sol' fa]
        mib sol mib do[mib do] si re si sol[sol' fa]
    }

    %112
    mib16(mib'8.) si16 (do8.) re,2\tr\mbreak
    \new CueVoice {\override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f
        <<do4^\f\\{\new CueVoice {\shiftOn \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f  \tuplet 3/2 {do,8 do do do [do do] do do do do[do do] }}}>>
        sib''4\staccatissimo lab\staccatissimo sol\staccatissimo fa\staccatissimo

        %115
        mi\tr fa r2
        \tuplet 3/2 { sib,,8 sib sib sib[sib sib] sib sib sib sib[sib sib]}\mbreak
        lab''4\staccatissimo sol\staccatissimo fa\staccatissimo mib!\staccatissimo

        %118
        re\tr mib r2
        \tuplet 3/2 {
            sol8 sol sol sol[sol sol] fa sib, sib sib[sib sib]
            lab' lab lab lab[lab lab] sol do, do do[do do]

            %121
            sib' sib sib sib[sib sib] \mbreak la re, re re[re re]
            sol sol sol sol[sol sol] fa sib, sib sib[sib sib]
            mib mib mib mib[mib mib] re sol, sol sol[sol sol]

            %124
            do do do do[do do] do do do do[do do]
            fad sol la
        } la2 do,4
        \tuplet 3/2 {
            sib8 sib sib sol'[sol sol] la, la la fad'[fad fad]

            %127
            \once\stemUp sol,\p sib' sib sib[sib sib] la re, re re[re re]
            sol sol sol sol[sol sol]\mbreak fa sib, sib sib[sib sib]
            mib mib mib mib[mib mib] re sol, sol sol[sol sol]

            %130
            do\f do do do[do do] do do do do[do do]
            fad sol la
        } la2 do,4
        \tuplet 3/2 { sib8 sib sib sol'[sol sol] la, la la fad'[fad fad] }

        %133
        sol4\staccatissimo mib,\staccatissimo do\staccatissimo re\staccatissimo
        sol,2 r
    }

    %135
    sib'4.\solo do16 re mib8 sol fa mib
    do'4 sib2.
    do16[(lab8.) sol16(fa8.)] sib4 re,

    %138
    \grace re mib2 lab16[(fa8.) mib16(re8.)]\mbreak
    \grace re4 mib2 lab16[(fa8.) mib16(re8.)]
    \grace re8 mib4. sib'8 lab4 sol

    %141
    \grace lab8 sol4 fa8. sib16 lab4 sol
    sol\tr fa r2

    %143
     \new CueVoice {
        \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f
        \tuplet 3/2 { mib,8\f mib mib mib[mib mib] mib mib mib mib[mib mib] }
    reb'4\staccatissimo do\staccatissimo sib\staccatissimo lab\staccatissimo

    %145
    reb\staccatissimo do\staccatissimo} reb'2\solo
    do16[(lab8.) sol16(fa8.)] \grace lab8 sol4 \grace fa8 mi4
    \grace mi fa2 sib16[(sol8.) fa16(mi8.)]

    %148
    \grace mi4 fa2 sib16[(sol8.) fa16(mi8.)]\mbreak
     \new CueVoice {
        <<fa4\\{\new CueVoice { \shiftOn \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f
        \tuplet 3/2 {fa,8\f fa fa fa[fa fa] fa fa fa fa[fa fa] }}}>>
        mib'4\staccatissimo re!\staccatissimo do\staccatissimo sib\staccatissimo

        %151
        mib\staccatissimo re\staccatissimo} mib'2\solo
    re16[(sib8.) la16(sol8.)] \grace sib8 la4 \grace sol8 fad4
    \grace fad4 sol2 do16[(la8.) sol16(fad8.)]\mbreak
    \grace fad4 sol2 do16[(la8.) sol16(fad8.)]

    %155
   \new CueVoice {
        <<sol4\\{\new CueVoice { \shiftOn \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f
        \tuplet 3/2 {sol,8\f sol sol sol[sol sol] sol sol sol sol[sol sol] }}}>>
    fa'4\staccatissimo mib\staccatissimo re\staccatissimo do\staccatissimo
    fa\staccatissimo mib\staccatissimo} lab!2\solo

    %158
    sol16[(mib8.) re16(do8.)] lab'4 do,
    \tuplet 3/2 { si8 sol si re [si re] sol re sol si [sol si]
    do sol mib sol[mib do]\mbreak do' sol mib sol[mib do]

    %161
    si8 sol si re [si re] sol re sol si [sol si]
    do sol mib sol[mib do]\mbreak do' sol mib sol[mib do]
    la fa la do[la do] fa la, fa' la[fa la]

    %164
    sib fa re fa[re sib] sib' fa re fa[re sib]
    la fa la do[la do] fa la, fa' la[fa la]\mbreak
    sib fa re fa[re sib] sib' fa re fa[re sib]

    %167
    sol mib sol sib[sol sib] mib sib mib sol[mib sol]}
    do16[(lab8.) sol16(fa8.)] sib16[(sol8.) fa16(mib8.)]\mbreak
    lab2. sol8 fa

    %170
    \tuplet 3/2 { sol fa mib re[mib fa] mib sol sib lab[sol fa]
    sol fa mib re[mib fa] mib sol sib lab[sol fa]
    sol fa mib} reb'2.\mbreak

    %173
    do16[(sib8.) lab16(sol8.)] fa16[(mib8.) re16(do8.)]
    sib4.\tr do16 re mib4 lab
    \tuplet 3/2 { sol8 fa mib re[do sib] } fa'2\tr

    \new CueVoice {
        \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f

        %176
        <<mib4\\{\new CueVoice {
        \shiftOn \override TupletNumber.transparent = ##t
        \override TupletBracket.bracket-visibility = ##f
        \tuplet 3/2 { mib,8\f mib mib mib[mib mib] mib mib mib mib[mib mib] }}}>>

    %177
    do'4\staccatissimo sib\staccatissimo re\staccatissimo mib\staccatissimo
    do\tr sib8. mib16 re4\staccatissimo mib\staccatissimo
    do\tr sib r2}

    %180
    do'16\solo[(lab8.) sol16(fa8.)] sib4 re,
    \grace re mib2 lab16[(fa8.) mib16(re8.)]\mbreak
    \grace re4 mib2 lab16[(fa8.) mib16(re8.)]

    %183
    \grace re4 mib2 \tuplet 3/2 { fa8 mib fa sol[fa sol] }
    lab8.(sib16 do2) sib16(lab8.)
    \tuplet 3/2 { \once\stemDown sol8 mib, fa sol[fa mib]\mbreak sib' re fa lab[sol fa]

    %186
    \once\stemDown sol mib, fa sol[fa mib]\mbreak sib' re fa lab[sol fa]
    sol mib re mib[re mib] lab mib re mib[re mib]\mbreak
    sib' mib, re mib[re mib]} do' lab re sib

    %189
    mib4. re16 do sib4 lab
    sol16(fa mib4.) fa2\tr \mbreak
    mib4 do'4~do16 sib lab sol fa mib re do

    %192
    sib8.(do32 re) mib4 r lab,
    \tuplet 3/2 { sol8 mib' re do[sib lab] } sol4 fa\tr
    mib r r2

    %195
    R1*24

}

IvlIn = \relative do'' {

    \tuplet 3/2 { mib,8 mib mib mib[mib mib] mib mib mib mib[mib mib] }
    do'4\staccatissimo sib\staccatissimo re\staccatissimo mib\staccatissimo
    do sib8. mib16 re4\staccatissimo mib\staccatissimo

    %4
    do\tr sib r2
    do16\p[(lab8.) sol16(fa8.)]\mbreak sib4 re,
    \grace re4 mib2 lab16[(fa8.) mib16(re8.)]

    %7
    \grace re4 mib2 lab16[(fa8.) mib16(re8.)]
    \tuplet 3/2 { mib8\f fa sol lab[sib do] sib do re mib[fa sol] }
    \grace sol4 fa2. lab,4

    %10
    \tuplet 3/2 { sol8 lab sib } sib4 lab sol
    \grace lab8 sol4\tr fa8. sib16 lab4 sol
    sol\tr fa r2

    %13
    \tuplet 3/2 { mib8 mib mib mib[mib mib] mib mib mib mib[mib mib] }
    reb'4\staccatissimo do\staccatissimo sib\staccatissimo lab\staccatissimo
    reb\staccatissimo do\staccatissimo reb,\p\staccatissimo  do\staccatissimo\mbreak

    %16
    R1
    \tuplet 3/2 { fa8\f fa fa fa[fa fa] fa fa fa fa[fa fa] }
    mib'4\staccatissimo re!\staccatissimo do\staccatissimo sib\staccatissimo

    %19
    mib\staccatissimo re\staccatissimo mib,\p\staccatissimo  re\staccatissimo
    R1
    \tuplet 3/2 { fa'8\p lab, lab } lab2 sol16(fa8.)

    %22
    \tuplet 3/2 { fa'8 lab, lab } lab2 sol16(fa8.)\mbreak
    fa'16\f[(mib8.) re16(do8.)] sib16[(lab8.) sol16(fa8.)]
    \tuplet 3/2 {
        sol8 sol' sol sol[sol sol] fa sib, sib sib[sib sib]

        %25
        mib mib mib mib[mib mib] re sol, sol sol[sol sol]
        do do do do[do do] do do do re[re re]
        mib sol fa mib[re do] sib do sib lab[sol lab]

        %28
        sol sol sol mib'[mib mib] fa, fa fa re'[re re]
        \once\stemUp mib, sol'\p sol sol[sol sol] fa sib, sib sib[sib sib]
        mib mib mib mib[mib mib] re sol, sol sol[sol sol]
    }

    %31
    \tuplet 3/2 { do8\f do do do[do do] do do do re[re re] }\mbreak
    \tuplet 3/2 {
        mib sol fa mib[re do] sib do sib lab[sol lab]
        sol sol sol mib'[mib mib] fa, fa fa re'[re re]

        %34
        mib, mib mib mib[mib mib] mib mib mib mib[mib mib]
        lab mib mib sib'[mib, mib] do' mib, mib re' [mib, mib]
    }\mbreak
    mib'4\staccatissimo do\staccatissimo lab\staccatissimo sib\staccatissimo

    %37
    mib,2 r
    R1*8
    \tuplet 3/2 { mib8\f mib mib mib[mib mib] mib mib mib mib[mib mib] }

    %47
    reb'4\staccatissimo do\staccatissimo sib\staccatissimo lab\staccatissimo
    reb\staccatissimo do\staccatissimo r2
    R1*3

    %52
    \tuplet 3/2 { fa,8\f fa fa fa[fa fa] fa fa fa fa[fa fa] }
    mib'4\staccatissimo re!\staccatissimo do\staccatissimo sib\staccatissimo
    mib\staccatissimo re\staccatissimo r2

    %55
    R1*5
    \tuplet 3/2 { re,8\p re re re[re re] re re re re[re re] }
    la''4 r sib r

    %62
    \tuplet 3/2 { re,,8 re re re[re re] re re re re[re re] }
    la''4 r sib r\mbreak
    \tuplet 3/2 { re,,8 re re re[re re] re re re re[re re] }

    %65
    sib''4 r do r
    la r sib r
    sol r la r

    %68
    fad r sol r
    r mib\mbreak mib mib
    mib1\f

    %71
    re4\p sib' la r
    re,4 sib' la r
    R1*6

    %79
    \tuplet 3/2 { sib,8\f sib sib sib[sib sib] sib sib sib sib[sib sib] }\mbreak
    sol'4\staccatissimo fa\staccatissimo la\staccatissimo sib\staccatissimo
    sol fa8. sib16 la4 sib

    %82
    sol\tr fa r2
    sol16\p[(mib8.) re16(do8.)] fa4 la,
    \grace la sib2 mib16[(do8.) sib16(la8.)]\mbreak

    %85
    \grace la4 sib2 mib16[(do8.) sib16(la8.)]
    \tuplet 3/2 { sib8\f do re mib[fa sol] fa sol la sib[do re] }
    \grace re4 do2. mib,4

    %88
    \tuplet 3/2 { re8 mib fa } fa4 mib re
    re\tr  do8. fa16\mbreak mib4 re
    re\tr do r2

    %91
    fa,4\p r8. mib16 re4 r8. mib16
    fa4 r8. mib16 re4 r
    \tuplet 3/2 { fa'8 fa fa fa[fa fa] fa fa fa fa[fa fa] }

    %94
    mib4 r sol r\mbreak
    \tuplet 3/2 { fa8 fa fa fa[fa fa] fa fa fa fa[fa fa] }
    mib4 r mib r

    %97
    re re re re
    \tuplet 3/2 { sol,8 sol sol sol[sol sol] sol sol sol sol[sol sol] }
    sol4 r sol'2

    %100
    sol1~
    sol2 lab~
    lab sol~

    %103
    sol fa~
    fa mib4 r
    re r mib r

    %106
    re1
    r4 re re re
    r re re re

    %109
    r re re re\mbreak
    R1*3
    \tuplet 3/2 { do,8\f do do do[do do] do do do do [do do] }

    %114
    sib''4\staccatissimo lab\staccatissimo sol\staccatissimo fa\staccatissimo
    mi\tr fa r2
    \tuplet 3/2 { sib,,8 sib sib sib[sib sib] sib sib sib sib[sib sib]}\mbreak

    %117
    lab''4\staccatissimo sol\staccatissimo fa\staccatissimo mib!\staccatissimo
    re\tr mib r2
    \tuplet 3/2 {
        sol8 sol sol sol[sol sol] fa sib, sib sib[sib sib]

        %120
        lab' lab lab lab[lab lab] sol do, do do[do do]
        sib' sib sib sib[sib sib] \mbreak la re, re re[re re]
        sol sol sol sol[sol sol] fa sib, sib sib[sib sib]

        %123
        mib mib mib mib[mib mib] re sol, sol sol[sol sol]
        do do do do[do do] do do do do[do do]
        fad sol la
    } la2 do,4
    \tuplet 3/2 {

        %126
        sib8 sib sib sol'[sol sol] la, la la fad'[fad fad]
        \once\stemUp sol,\p sib' sib sib[sib sib] la re, re re[re re]
        sol sol sol sol[sol sol]\mbreak fa sib, sib sib[sib sib]

        %129
        mib mib mib mib[mib mib] re sol, sol sol[sol sol]
        do\f do do do[do do] do do do do[do do]
        fad sol la
    } la2 do,4

    %132
    \tuplet 3/2 { sib8 sib sib sol'[sol sol] la, la la fad'[fad fad] }
    sol4\staccatissimo mib,\staccatissimo do\staccatissimo re\staccatissimo
    sol,2 r

    %135
    R1*8
    \tuplet 3/2 { mib'8\f mib mib mib[mib mib] mib mib mib mib[mib mib] }
    reb'4\staccatissimo do\staccatissimo sib\staccatissimo lab\staccatissimo

    %145
    reb\staccatissimo do\staccatissimo r2
    R1*3
    \tuplet 3/2 { fa,8\f fa fa fa[fa fa] fa fa fa fa[fa fa] }

    %150
    mib'4\staccatissimo re!\staccatissimo do\staccatissimo sib\staccatissimo
    mib\staccatissimo re\staccatissimo r2
    R1*3

    %155
    \tuplet 3/2 { sol,8\f sol sol sol[sol sol] sol sol sol sol[sol sol] }\mbreak
    fa'4\staccatissimo mib\staccatissimo re\staccatissimo do\staccatissimo
    fa\staccatissimo mib\staccatissimo r2

    %158
    R1
    re4\p r si' r
    do r r2

    %161
    re,4 r si' r
    do r r2\mbreak
    do,4 r la' r

    %164
    sib? r r2
    do,4 r la' r
    sib r r2

    %167
    sib,4 r mib r
    R1*8
    \tuplet 3/2 { mib,8\f mib mib mib[mib mib] mib mib mib mib[mib mib] }

    %177
    do'4\staccatissimo sib\staccatissimo re\staccatissimo mib\staccatissimo
    do\tr sib8. mib16 re4\staccatissimo mib\staccatissimo
    do\tr sib r2

    %180
    R1*4
    r2 lab'\mbreak
    sol4 r lab2

    %186
    sol4 r lab2
    sol4 r lab4 r
    sib r r2

    %189
    R1*5
    \tuplet 3/2 { mib,,8\f mib mib mib[mib mib] mib mib mib mib[mib mib] }
    reb'4\staccatissimo do\staccatissimo sib\staccatissimo lab\staccatissimo

    %196
    reb\staccatissimo do\staccatissimo reb,\p\staccatissimo do\staccatissimo\mbreak
    R1
    \tuplet 3/2 { fa8\f fa fa fa[fa fa] fa fa fa fa[fa fa] }

    %199
    mib'4\staccatissimo re!\staccatissimo do\staccatissimo sib\staccatissimo
    mib\staccatissimo re\staccatissimo mib,\staccatissimo\p re\staccatissimo
    R1

    %202
    \tuplet 3/2 { fa'8\p lab, lab } lab2 sol16(fa8.)
    \tuplet 3/2 { fa'8 lab, lab } lab2 sol16(fa8.)\mbreak
    fa'16\f[(mib8.) re16(do8.)] sib16[(lab8.) sol16(fa8.)]
    \tuplet 3/2 {

        %205
        sol8 sol' sol sol[sol sol] fa sib, sib sib[sib sib]
        mib mib mib mib[mib mib] re sol, sol sol[sol sol]
        do do do do[do do] do do do re[re re]

        %208
        mib sol fa mib[re do] sib do sib lab[sol lab]
        sol sol sol mib'[mib mib] fa, fa fa re'[re re]
        mib, sol'\p sol sol[sol sol] fa sib, sib sib[sib sib]

        %211
        mib mib mib mib[mib mib] re sol, sol sol[sol sol]
    }
    \tuplet 3/2 { do8\f do do do[do do] do do do re[re re] }\mbreak
    \tuplet 3/2 {
        mib sol fa mib[re do] sib do sib lab[sol lab]

        %214
        sol sol sol mib'[mib mib] fa, fa fa re'[re re]
        mib, mib mib mib[mib mib] mib mib mib mib[mib mib]
        lab mib mib sib'[mib, mib] do' mib, mib re' [mib, mib]
    }\mbreak

    %217
    mib'4\staccatissimo do\staccatissimo lab\staccatissimo sib\staccatissimo
    mib,2\fermata r

}

IvlIIn = \relative do'' {

    \tuplet 3/2 { mib,8 mib mib mib[mib mib] mib mib mib mib[mib mib] }
    do'4\staccatissimo sib\staccatissimo re\staccatissimo mib\staccatissimo
    do sib8. mib16 re4\staccatissimo mib\staccatissimo

    %4
    do\tr sib r2
    do16\p[(lab8.) sol16(fa8.)]\mbreak sib4 re,
    \grace re4 mib2 lab16[(fa8.) mib16(re8.)]

    %7
    \grace re4 mib2 lab16[(fa8.) mib16(re8.)]
    \tuplet 3/2 { mib8\f fa sol lab[sib do] sib do re mib[fa sol] }
    \grace sol4 fa2. fa,4\mbreak

    %10
    \tuplet 3/2 { mib8 fa sol } sol4 fa mib
    \grace fa8 mib4 re8. sol16 fa4 mib
    mib\tr re r2

    %13
    \tuplet 3/2 { mib8 mib mib mib[mib mib] mib mib mib mib[mib mib] }
    sib'4\staccatissimo lab\staccatissimo reb\staccatissimo do\staccatissimo\mbreak
    sib\staccatissimo lab\staccatissimo sib,\p\staccatissimo lab\staccatissimo

    %16
    R1
    \tuplet 3/2 { fa'8\f fa fa fa[fa fa] fa fa fa fa[fa fa] }
    do'4\staccatissimo sib\staccatissimo mib\staccatissimo re!\staccatissimo

    %19
    do\staccatissimo sib\staccatissimo do,\p\staccatissimo sib\staccatissimo
    R1\mbreak
    r8 r16 fa'\p fa2 mib16( re8.)

    %22
    r8 r16 fa fa2 mib16( re8.)
    re'16\f[(do8.) sib16(lab8.)] sol16[(fa8.) mib16(re8.)]
    mib4 mib'2 re4~

    %25
    re do2 sib4~
    sib do8. sib16 \tuplet 3/2 { lab8 lab lab lab[lab lab]
    sol mib' re do[sib lab] sol lab sol fa[mib fa]

    %28
    sol sol sol sol[sol sol]\mbreak fa fa fa fa[fa fa]}
    mib4 mib'2\p re4~
    re do2 sib4~

    %31
    sib\f do8. sib16 \tuplet 3/2 { lab8 lab lab lab[lab lab]\mbreak
    sol mib' re do[sib lab] sol lab sol fa[mib fa]
    sol sol sol sol[sol sol] fa fa fa fa[fa fa]

    %34
    mib mib mib mib[mib mib]\mbreak mib mib mib mib[mib mib]
    lab mib mib sib'[mib, mib] do' mib, mib re' [mib, mib] }
    mib'4\staccatissimo do\staccatissimo lab\staccatissimo sib\staccatissimo

    %37
    mib,2 r
    R1*8
    \tuplet 3/2 { mib8\f mib mib mib[mib mib] mib mib mib mib[mib mib] }

    %47
    sib'4\staccatissimo lab\staccatissimo reb\staccatissimo do\staccatissimo\mbreak
    sib\staccatissimo lab\staccatissimo r2
    R1*3\mbreak

    %52
    \tuplet 3/2 { fa8\f fa fa fa[fa fa] fa fa fa fa[fa fa] }
    do'4\staccatissimo sib\staccatissimo mib\staccatissimo re\staccatissimo
    do\staccatissimo sib\staccatissimo r2

    %55
    R1*5\mbreak
    \tuplet 3/2 { re,8\p re re re[re re] re re re re[re re] }
    fad'4 r sol r

    %62
    \tuplet 3/2 { re,8 re re re[re re] re re re re[re re] }
    fad'4 r sol r
    \tuplet 3/2 { re,8 re re re[re re] re re re re[re re] }

    %65
    re'4 r mib r
    do r re r
    sib r do r

    %68
    la r sib r\mbreak
    r do do do
    do1\f

    %71
    sib4\p sol' do, r
    sib sol' do, r
    R1*6

    %79
    \tuplet 3/2 { sib8\f sib sib sib[sib sib] sib sib sib sib[sib sib] }\mbreak
    sol'4\staccatissimo fa\staccatissimo la\staccatissimo sib\staccatissimo
    sol fa8. sib16 la4 sib

    %82
    sol\tr fa r2
    sol16\p[(mib8.) re16(do8.)] fa4 la,
    \grace la sib2 mib16[(do8.) sib16(la8.)]\mbreak

    %85
    \grace la4 sib2 mib16[(do8.) sib16(la8.)]
    \tuplet 3/2 { sib8\f do re mib[fa sol] fa sol la sib[do re] }
    \grace re4 do2. do,4

    %88
    \tuplet 3/2 { sib8 do re} re4 do sib\mbreak
    sib\tr la?8. re16 do4 sib
    sib\tr la r2

    %91
    re,4\p r8 r16 do sib4 r8 r16 do
    re4  r8 r16 do sib4 r
    \tuplet 3/2 { re'8 re re re[re re]\mbreak re re re re[re re] }

    %94
    do4 r mib r
    \tuplet 3/2 { re8 re re re[re re] re re re re[re re] }
    do4 r do r

    %97
    do do do do
    \tuplet 3/2 { sol8 sol sol sol[sol sol] sol sol sol sol[sol sol] }
    sol4 r fa'2(

    %100
    mib4) r fa2(
    mib4) r fa2~
    fa mib~

    %103
    mib re~
    re do4 r
    si r do r

    %106
    si1
    r4 si? si si
    r si? si si

    %109
    r si? si si
    R1*3
    \tuplet 3/2 { do,8\f do do do[do do] do do do do [do do] }

    %114
    sol'4\staccatissimo fa\staccatissimo sib\staccatissimo lab\staccatissimo
    sol\tr  fa r2\mbreak
    \tuplet 3/2 { sib,8 sib sib sib[sib sib] sib sib sib sib[sib sib]}

    %117
    fa'4\staccatissimo mib\staccatissimo lab\staccatissimo sol\staccatissimo
    fa4\tr mib r2
    sib'4 mib2 re4

    %120
    do fa2 mib4
    re sol2 fa4~
    fa mib2 re4~

    %123
    re do2 sib4~
    sib do8. sib16 \tuplet 3/2 { la8 la la la[la la]
    la? sib do} do2 la4

    %126
    \tuplet 3/2 { sib8 sib sib sib[sib sib] la la la la[la la] }\mbreak
    sol4\p sol'2 fa4~
    fa mib2 re4~

    %129
    re do2 sib4~
    sib\f do8. sib16 \tuplet 3/2 { la8 la la la[la la]
    la? sib do} do2 la4

    %132
    \tuplet 3/2 { sib8 sib sib sib[sib sib] la la la la[la la] }
    sol4\staccatissimo mib\staccatissimo do\staccatissimo re\staccatissimo
    sol,2 r

    %135
    R1*8
    \tuplet 3/2 { mib'8\f mib mib mib[mib mib] mib mib mib mib[mib mib] }
    sib'4\staccatissimo lab\staccatissimo reb\staccatissimo do\staccatissimo\mbreak

    %145
    sib\staccatissimo lab\staccatissimo r2
    R1*3\mbreak
    \tuplet 3/2 { fa8\f fa fa fa[fa fa] fa fa fa fa[fa fa] }

    %150
    do'4\staccatissimo sib\staccatissimo mib\staccatissimo re!
    do\staccatissimo sib\staccatissimo r2
    R1*3

    %155
    \tuplet 3/2 { sol8\f sol sol sol[sol sol] sol sol sol sol[sol sol] }
    re'4\staccatissimo do\staccatissimo fa\staccatissimo mib\staccatissimo
    re\staccatissimo do\staccatissimo r2\mbreak

    %158
    R1
    si4 \p r re r
    mib r r2

    %161
    si4 r re r
    mib r r2
    la,4 r do r

    %164
    re r r2\mbreak
    la4 r do r
    re r r2

    %167
    sol,4 r sib r
    R1*8
    \tuplet 3/2 { mib,8\f mib mib mib[mib mib] mib mib mib mib[mib mib] }

    %177
    do'4\staccatissimo sib\staccatissimo re\staccatissimo mib\staccatissimo
    do\tr sib8. mib16 re4\staccatissimo mib\staccatissimo
    do\tr sib r2

    %180
    R1*4
    r2 fa'
    mib4 r fa2

    %186
    mib4 r fa2
    mib4 r mib r\mbreak
    mib r r2

    %189
    R1*5
    \tuplet 3/2 { mib,8 \f mib mib mib[mib mib] mib mib mib mib[mib mib] }
    sib'4\staccatissimo lab\staccatissimo reb\staccatissimo do\staccatissimo\mbreak

    %196
    sib\staccatissimo lab\staccatissimo sib,\p\staccatissimo lab\staccatissimo
    R1
    \tuplet 3/2 { fa'8\f fa fa fa[fa fa] fa fa fa fa[fa fa] }

    %199
    do'4\staccatissimo sib\staccatissimo mib\staccatissimo re!\staccatissimo
    do\staccatissimo sib\staccatissimo do,\p\staccatissimo sib\staccatissimo
    R1\mbreak

    %202
    r8 r16 fa'\p fa2 mib16( re8.)
    r8 r16 fa fa2 mib16( re8.)
    re'16\f[(do8.) sib16(lab8.)] sol16[(fa8.) mib16(re8.)]

    %205
    mib4 mib'2 re4~
    re do2 sib4~
    sib do8. sib16 \tuplet 3/2 { lab8 lab lab lab[lab lab]

    %208
    sol mib' re do[sib lab] sol lab sol fa[mib fa]
    sol sol sol sol[sol sol]\mbreak fa fa fa fa[fa fa]}
    mib4 mib'2\p re4~

    %211
    re do2 sib4~
    sib\f do8. sib16 \tuplet 3/2 { lab8 lab lab lab[lab lab]\mbreak
    sol mib' re do[sib lab] sol lab sol fa[mib fa]

    %214
    sol sol sol sol[sol sol] fa fa fa fa[fa fa]
    mib mib mib mib[mib mib]\mbreak mib mib mib mib[mib mib]
    lab mib mib sib'[mib, mib] do' mib, mib re' [mib, mib] }

    %217
    mib'4\staccatissimo do\staccatissimo lab\staccatissimo sib\staccatissimo
    mib,2\fermopz r

}

Ivlan = \relative do' {

    sol4 sol8. lab16 sib4 mib
    mib mib lab sol
    mib mib lab sol

    %4
    mib mib r2
    mib4\p do sib sib
    do sol lab sib\mbreak

    %7
    do sol lab sib
    sol\f fa sol sib
    r re mib fa

    %10
    sib, sib sib sib
    sib sib sib sib
    sib\p sib r2

    %13
    R1
    \tuplet 3/2 { sol8\f sol sol lab[lab lab] sol sol sol lab[lab lab] }
    sol4 lab mib\p lab

    %16
    R1*2
    \tuplet 3/2 { la8\f la la sib[sib sib]  la la la sib[sib sib]}\mbreak
    la4 sib fa\p sib

    %20
    R1
    re4\p re re re
    re re re re

    %23
    re\f re re re
    sib sib sib sib\mbreak
    sol sol sol sol

    %26
    \tuplet 3/2 { mib'8 mib mib mib[mib mib] mib mib mib fa[fa fa]}
    mib2. sib4
    sib sib do sib

    %29
    sib sib\p sib sib
    sol sol sol sol\mbreak
    \tuplet 3/2 { mib'8\f mib mib mib[mib mib] mib mib mib fa[fa fa]}

    %32
    mib2. fa4
    sib, sib do sib
    \tuplet 3/2 { sol8 sol sol sol[sol sol] sol sol sol sol[sol sol]}

    %35
    mib4 mib' mib fa\mbreak
    sol\staccatissimo do\staccatissimo lab\staccatissimo sib\staccatissimo
    mib,2 r

    %38
    R1*9
    \tuplet 3/2 { sol,8\f sol sol lab[lab lab] sol sol sol lab[lab lab] }
    sol4\staccatissimo lab\staccatissimo r2

    %49
    R1*4
    \tuplet 3/2 { la8\f la la sib[sib sib]  la la la sib[sib sib]}\mbreak
    la4\staccatissimo sib\staccatissimo r2

    %55
    R1*24
    re4\f re8. mib16 fa4 re\mbreak
    sib sib mib re

    %81
    sib sib mib re
    sib sib r2
    sib4\p sol' fa mib

    %84
    re fa sol fa16(mib8.)\mbreak
    re4 fa sol do,
    fa\f mib sib' re,

    %87
    r la' sib re
    fa, fa fa fa
    fa fa fa fa\mbreak

    %90
    fa fa r2
    R1*11
    sib1\p

    %103
    lab
    sol~
    sol~

    %106
    sol
    R1*6\mbreak
    do,2\f r

    %114
    \tuplet 3/2 { mi8 mi mi fa[fa fa] mi mi mi fa[fa fa]}
    sib4 lab r2
    R1

    %117
    \tuplet 3/2 { re,8 re re mib! [mib mib] re re re mib[mib mib] }
    lab4 sol r2
    r4 sib, sib sib

    %120
    r do\mbreak do do
    r re re re
    sib sib sib sib

    %123
    sol sol' sol sol \mbreak
    \tuplet 3/2 { mib8 mib mib mib[mib mib] la la la la[la la]
    fad fad fad fad[fad fad] fad fad fad fad[fad fad]}

    %126
    re4 re mib re\mbreak
    re\p re re re
    sib sib sib sib

    %129
    sol sol' sol sol
    \tuplet 3/2 { mib8 mib mib mib[mib mib] la la la la[la la]
    fad fad fad fad[fad fad] fad fad fad fad[fad fad]}

    %132
    mib4 re mib re8. do16
    sib4\staccatissimo mib\staccatissimo do\staccatissimo re\staccatissimo
    sol,2 r\mbreak

    %135
    R1*9
    \tuplet 3/2 { sol'8\f sol sol lab[lab lab] sol sol sol lab[lab lab] }
    sol4\staccatissimo lab\staccatissimo r2

    %146
    R1*4
    \tuplet 3/2 { la,8\f la la sib[sib sib]  la la la sib[sib sib]}\mbreak
    la4\staccatissimo sib\staccatissimo r2

    %152
    R1*4
    \tuplet 3/2 { si8 si si do[do do] si si si do[do do]}
    si4\staccatissimo do\staccatissimo r2

    %158
    R1*18
    sol4\f sol8. lab16 sib4 mib
    mib mib lab sol

    %178
    mib mib lab sol
    mib mib r2
    R1*14\mbreak

    %194
    \tuplet 3/2 { mib8\f mib mib mib[mib mib] mib mib mib mib[mib mib]
    sol, sol sol lab[lab lab] sol sol sol lab[lab lab]}
    sol4 lab mib\staccatissimo\p lab\staccatissimo

    %197
    R1*2\mbreak
    \tuplet 3/2 { la8\f la la sib[sib sib] la8 la la sib[sib sib] }
    la4 sib fa\p sib

    %201
    R1
    re4\p re re re
    re re re re\mbreak

    %204
    re\f re re re
    sib sib sib sib
    sol sol sol sol

    %207
    \tuplet 3/2 { mib'8 mib mib mib[mib mib] mib mib mib fa[fa fa] }
    mib2. sib4
    sib sib do sib

    %210
    sib sib\p sib sib
    sol sol sol sol\mbreak
    \tuplet 3/2 { mib'8\f mib mib mib[mib mib] mib mib mib fa[fa fa]}

    %213
    mib2. fa4
    sib, sib do sib
    \tuplet 3/2 { sol8 sol sol sol[sol sol] sol sol sol sol[sol sol]}

    %216
    mib4 mib' mib fa\mbreak
    sol\staccatissimo do\staccatissimo lab\staccatissimo sib\staccatissimo
    mib,2\fermopz r

}

Icbn = \relative do {

    mib4 mib8. fa16 sol4 mib
    lab\staccatissimo sol\staccatissimo fa\staccatissimo mib\staccatissimo
    lab sol fa mib

    %4
    lab sol r2 \mbreak
    lab,4 lab'\p sol sib
    do sol lab sib

    %7
    do sol lab sib
    sol\f fa sol mib
    r sib do re\mbreak

    %10
    mib mib re mib
    sib' sib, sib mib
    sib' \parenthesize \p sib, r2

    %13
    R1
    \tuplet 3/2 { mib8\parenthesize \f  mib mib mib[mib mib] mib mib mib mib[mib mib]}\mbreak
    mib4 lab, r2

    %16
    R1*2
    \tuplet 3/2 { fa'8 \f fa fa fa[fa fa] fa fa fa fa [fa fa] }
    fa4 sib, r2

    %20
    R1\mbreak
    sib4\p re fa sib
    sib, re fa sib

    %23
    sib,\f re fa sib
    mib,4 mib16 fa sol lab sib4 sib,
    do4 do16 re mib fa\mbreak sol4 sol,

    %26
    lab lab'8. sol16 fa4 sib,
    do2. re4
    mib sol lab sib

    %29
    mib,4 mib16\p fa sol lab sib4 sib,\mbreak
    do do16 re mib fa sol4 sol,
    lab\f lab'8. sol16 fa4 sib,

    %32
    do2. re4
    mib sol, lab sib\mbreak
    \tuplet 3/2 { mib,8 mib mib mib[mib mib] reb' reb reb reb[reb reb]}

    %35
    do4 sol lab lab'
    sol\staccatissimo do\staccatissimo lab\staccatissimo sib\staccatissimo
    mib,2 r\mbreak

    %38
    R1*9
    \tuplet 3/2 { mib8\f mib mib mib[mib mib]mib mib mib mib[mib mib] }
    mib4 lab, r2
    R1*4

    %53
    \tuplet 3/2 { fa'8\f fa fa fa[fa fa] fa fa fa fa[fa fa]}
    fa4 sib, r2
    R1*24
    sib4\f sib8. do16 re4 sib

    %80
    mib re do sib
    mib re do sib
    mib re r2

    %83
    mib,4\p mib' re fa
    sol re\mbreak mib fa
    sol re mib fa

    %86
    re\f do re sib
    r fa sol la
    sib sib la sib

    %89
    fa' fa, fa sib\mbreak
    fa' \parenthesize fa, r2
    R1*22
    do'2\f r\mbreak

    %114
    \tuplet 3/2 { do8 do do do[do do] do do do do[do do]}
    do4 fa, r2
    R1

    %117
    \tuplet 3/2 { sib8 sib sib sib[sib sib] sib sib sib sib[sib sib]}
    sib4 mib, r2\mbreak
    mib'4 mib16 fa sol lab sib4 sib,

    %120
    fa' fa16 sol lab sib do4 do,
    sol' sol16 lab sib do re4 re,
    mib mib16 fa sol lab sib4 sib,\mbreak %% fine p. 2

    %123
    do do16 re mib fa sol4 sol,
    la la'8. sol16 fad4 la
    \tuplet 3/2 { re,8 re re re[re re] re re re re[re re]}

    %126
    sol4 sib do re\mbreak
    sol,\p sol16 la sib do re4 re,
    mib mib16 fa sol lab sib4 sib,

    %129
    do do16 re mib fa sol4 sol,
    la la'8. mib16 fad4 la
    \tuplet 3/2 { re,8 re re re[re re] re re re re[re re]}

    %132
    sol4 sib do re
    sol,\staccatissimo mib\staccatissimo do\staccatissimo re\staccatissimo
    sol,2 r

    %135
    R1*9
    \tuplet 3/2 { mib'8\f mib mib mib[mib mib] mib mib mib mib[mib mib]}
    mib4 lab, r2
    R1*3
    fa'2\f r

    %150
    \tuplet 3/2 { fa8 fa fa fa[fa fa] fa fa fa fa[fa fa]}
    fa4 sib, r2
    R1*3
    sol'2\f r

    %156
    \tuplet 3/2 { sol8 sol sol sol[sol sol] sol sol sol sol[sol sol]}
    sol4 do,  r2
    R1*18
    mib4\f mib8. fa16 sol4 mib

    %177
    lab sol fa mib
    lab sol fa mib
    lab sol r2

    %180
    R1*14
    mib2\f r

    %195
    \tuplet 3/2 { mib8 mib mib mib[mib mib] mib mib mib mib[mib mib]}
    mib4 lab, r2
    R1*2

    %199
    \tuplet 3/2 { fa'8\f fa fa fa[fa fa] fa fa fa fa[fa fa]}\mbreak
    fa4 sib, r2
    R1

    %202
    sib4\p re fa sib
    sib, re fa sib
    sib,\f re fa sib

    %205
    mib, mib16 fa sol lab sib4 sib,
    do do16 re mib fa sol4 sol,
    lab lab'8. sol16 fa4 sib,

    %208
    do2. re4
    mib sol lab sib\mbreak
    mib, mib16\p fa sol lab sib4 sib,

    %211
    do do16 re mib fa sol4 sol,
    lab\f lab'8. sol16 fa4 sib,
    do2. re4

    %214
    mib sol, lab sib
    \tuplet 3/2 { mib,8 mib mib mib[mib mib] reb' reb reb reb[reb reb] }\mbreak
    do4 sol lab lab'

    %217
    sol do lab sib
    mib,2\fermopz r

}

Ibcn = \relative do {

    mib4 mib8. fa16 sol4 mib
    lab\staccatissimo sol\staccatissimo fa\staccatissimo mib\staccatissimo
    lab sol fa mib

    %4
    lab sol r2 \mbreak
    lab,4 lab'\p sol sib
    do sol lab sib

    %7
    do sol lab sib
    sol\f fa sol mib
    r sib do re\mbreak

    %10
    mib mib re mib
    sib' sib, sib mib
    sib'\parenthesize \p  sib, r2

    %13
    R1
    \tuplet 3/2 { mib8\parenthesize \f  mib mib mib[mib mib] mib mib mib mib[mib mib]}\mbreak
    mib4 lab, r2

    %16
    R1*2
    \tuplet 3/2 { fa'8 \f fa fa fa[fa fa] fa fa fa fa [fa fa] }
    fa4 sib, r2

    %20
    R1\mbreak
    sib4\p re fa sib
    sib, re fa sib

    %23
    sib,\f re fa sib
    mib,4 mib16 fa sol lab sib4 sib,
    do4 do16 re mib fa\mbreak sol4 sol,

    %26
    lab lab'8. sol16 fa4 sib,
    do2. re4
    mib sol lab sib

    %29
    mib,4 mib16\p fa sol lab sib4 sib,\mbreak
    do do16 re mib fa sol4 sol,
    lab\f lab'8. sol16 fa4 sib,

    %32
    do2. re4
    mib sol, lab sib\mbreak
    \tuplet 3/2 { mib,8 mib mib mib[mib mib] reb' reb reb reb[reb reb]}

    %35
    do4 sol lab lab'
    sol\staccatissimo do\staccatissimo lab\staccatissimo sib\staccatissimo
    mib,2 r\mbreak

    %38
    r r4 sol\p
    lab sol8. fa16 sol4 mib
    lab lab sol sib

    %41
    do sol lab sib\mbreak
    do sol lab sib
    do sol fa mib

    %44
    sib' sib, sib mib
    sib' sib, r2
    R1\mbreak

    %47
    \tuplet 3/2 { mib8\f mib mib mib[mib mib]mib mib mib mib[mib mib] }
    mib4 lab, r mi'\p
    fa lab sib do

    %50
    reb lab\mbreak sib do
    reb lab sib do
    fa,2\f r %%% fine pagina

    %53
    \tuplet 3/2 { fa8 fa fa fa[fa fa] fa fa fa fa[fa fa]}
    fa4 sib, r fad'\p
    sol sib do re

    %56
    mib sib do re
    mib sib do re
    sib sol fad re

    %59
    sol la sib do
    re re,8. mi16 fad4 sol
    re r re r

    %62
    re mi fad sol\mbreak
    re r re r
    re mi fad re

    %65
    sol r do, r
    fa! r sib, r
    mib r la, r\mbreak

    %68
    re r sol, r
    do do sib sib
    la\f sol fa la

    %71
    sib\p mib fa r
    sib, mib fa r
    sib, re\mbreak r re

    %74
    mib mib mib mib
    re re re mib
    fa fa fa mib

    %77
    re re re mib
    fa fa fa fa\mbreak
    sib,\f sib8. do16 re4 sib

    %80
    mib re do sib
    mib re do sib
    mib re r2

    %83
    mib,4\p mib' re fa
    sol re\mbreak mib fa
    sol re mib fa

    %86
    re\f do re sib
    r fa sol la
    sib sib la sib

    %89
    fa' fa, fa sib\mbreak
    fa' fa, r2
    R1*2

    %93
    r4 si\p si si
    do r do r
    r si si si

    %96
    do r do r\mbreak
    fa fa fa fa
    sol sol,8. la16 si4 sol

    %99
    do mib si sol
    do mib si sol
    do do' fa, sol\mbreak

    %102
    sib re mib, sol
    lab do re, fa
    sol si do, mib

    %105
    sol r lab, r
    sol1
    r4 re' si sol\mbreak

    %108
    r re' si sol
    r sol si sol
    do mib sol si

    %111
    do, mib sol si
    do lab fa sol
    do,2\f r\mbreak

    %114
    \tuplet 3/2 { do8 do do do[do do] do do do do[do do]}
    do4 fa, r2
    R1

    %117
    \tuplet 3/2 { sib8 sib sib sib[sib sib] sib sib sib sib[sib sib]}
    sib4 mib, r2\mbreak
    mib'4 mib16 fa sol lab sib4 sib,

    %120
    fa' fa16 sol lab sib do4 do,
    sol' sol16 lab sib do re4 re,
    mib mib16 fa sol lab sib4 sib,\mbreak %% fine p. 2

    %123
    do do16 re mib fa sol4 sol,
    la la'8. sol16 fad4 la
    \tuplet 3/2 { re,8 re re re[re re] re re re re[re re]}

    %126
    sol4 sib do re\mbreak
    sol,\p sol16 la sib do re4 re,
    mib mib16 fa sol lab sib4 sib,

    %129
    do do16 re mib fa sol4 sol,
    la la'8. mib16 fad4 la
    \tuplet 3/2 { re,8 re re re[re re] re re re re[re re]}

    %132
    sol4 sib do re
    sol,\staccatissimo mib\staccatissimo do\staccatissimo re\staccatissimo
    sol,2 r

    %135
    r r4 sol'\p
    lab sol8. fa16 sol4 mib
    lab lab sol sib\mbreak

    %138
    do sol lab sib
    do sol lab sib
    do sol fa mib

    %141
    sib' sib, sib mib
    sib' sib, r2
    R1

    %144
    \tuplet 3/2 { mib8\f mib mib mib[mib mib] mib mib mib mib[mib mib]}
    mib4 lab, r mi'\p\mbreak
    fa lab sib do

    %147
    reb lab sib do
    reb lab sib do
    fa,2\f r

    %150
    \tuplet 3/2 { fa8 fa fa fa[fa fa] fa fa fa fa[fa fa]}
    fa4 sib, r fad'\p
    sol sib do re

    %153
    mib sib do re\mbreak
    mib sib do re
    sol,2\f r

    %156
    \tuplet 3/2 { sol8 sol sol sol[sol sol] sol sol sol sol[sol sol]}
    sol4 do,  r si\p
    do mib fa lab

    %159
    sol r fa r
    mib r r2
    sol4 r fa r\mbreak

    %162
    mib r r2
    fa4 r mib r
    re r r2

    %165
    fa4 r mib r
    re r r2
    mib4 r sol r

    %168
    lab lab sol sol
    r fa8. mib16 re4 sib
    mib sib' sol re

    %171
    mib sib' sol re\mbreak
    r mib fa sol
    lab lab lab lab~

    %174
    lab sol8.\p fa16 sol4 lab
    sib sib sib sib
    mib,\f mib8. fa16 sol4 mib

    %177
    lab sol fa mib
    lab sol fa mib
    lab sol r2

    %180
    lab,4\p lab' sol sib\mbreak
    do sol lab sib
    do sol lab sib

    %183
    do do, re mib
    fa mib re sib
    mib r re sib

    %186
    mib r re sib
    mib r do r
    sol r lab sib

    %189
    do do re re
    mib sol lab sib\mbreak
    do lab lab lab

    %192
    lab sol r fa
    mib lab sib sib,
    mib2\f r

    %195
    \tuplet 3/2 { mib8 mib mib mib[mib mib] mib mib mib mib[mib mib]}
    mib4 lab, r2
    R1*2

    %199
    \tuplet 3/2 { fa'8\f fa fa fa[fa fa] fa fa fa fa[fa fa]}\mbreak
    fa4 sib, r2
    R1

    %202
    sib4\p re fa sib
    sib, re fa sib
    sib,\f re fa sib

    %205
    mib, mib16 fa sol lab sib4 sib,
    do do16 re mib fa sol4 sol,
    lab lab'8. sol16 fa4 sib,

    %208
    do2. re4
    mib sol lab sib\mbreak
    mib, mib16\p fa sol lab sib4 sib,

    %211
    do do16 re mib fa sol4 sol,
    lab\f lab'8. sol16 fa4 sib,
    do2. re4

    %214
    mib sol, lab sib
    \tuplet 3/2 { mib,8 mib mib mib[mib mib] reb' reb reb reb[reb reb] }\mbreak
    do4 sol lab lab'

    %217
    sol do lab sib
    mib,2\fermopz r

}

Ibfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {
    \key mib\major
    \time 4/4
    \tempo 2 = 65
    s1*218
    \bar "|."

}

Ifl = {
    \Iglobal
    \notypeset
    <<\Ifln \forma>>

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

Icb = {
    \Iglobal
    \clef bass
    <<\Icbn \forma>>

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
    \senza
}

IIfln = \relative do'' {

    \new CueVoice {
     do8. sol16 sol8. mib16 mib8.\tr re32 do
    sol'8. re16 re8. si16 si8.\tr la32 sol
    fa'4 r r

    %4
    R2.
    re'2.}
    r8 si_\solo si mi, r mi [sold8. la16]

    %7
    si8 si r si16 do re8 re r16 re mi fa
    fa8 si, r si16. do32 re8.[re16 re8 mi]
    do4 r r

    %10
    r2 r8 fad[sol8. la16]
    la8 do, r do16 re mib!8.[mib16 mib8 re]
    sib!4 r r

    %13
    R2.*2
    r4 r16 sib mib! re\mbreak mib8 mib r16 mib fa sol
    fa8 fa r fa fa8.[fa16 sol8. lab16]

    %17
    sol4 r r
    R2.
    r8 sol[lab8. sib16] sib8 mib, r sib16 do

    %20
    reb8 mib, sib''4. sol8 mib reb\mbreak
    do4 r r
    R2.

    %23
    r8 do' \grace sib16 lab8 \grace sol16 fa8 \grace mib8 re4 r8 mib
    mib sib r4 r r8 sib
    mib mib4 sol8 fa16 re sib4 sib8\mbreak

    %26
    lab'8 lab4 sol16 fa sol fa mib8 r sib
    mib mib4 sol8 fa16 re sib4 sib8
    lab' lab4 sol8 sol fa r sib

    %29
    la!8.[sib16 do8 mib,]re16(mib32 fa) fa4 re'8\mbreak
    do32 sib la sol fa4 mib8 re16 mib32 fa fa4 fa8
    sol4\tr la\tr \tuplet 3/2 { sib16 la sol } fa4 fa8

    %32
    sol4\tr la\tr \tuplet 3/2 { sib16 la sol } fa4 mib8
    mib32(re16.) sol32(fa16.) mib32(re16.) do32(sib16.) la32(sol fa8.) \tuplet 3/2 { mib'8 [(re do)] }
    re32(mib fa16) fa4. r8 mib(re do)

    %35
    re32(mib fa16) fa4. r8 la16. sib32 \tuplet 3/2 { do16 sib la sol[fa mib]
    re(do sib)} re'8[(do sib)] la8.(sib32 do) mi,8.(fa32 sol)\mbreak
    fa8 do16 re \grace fa16 mib!8 re16 do \grace mib16 re8 do16 sib do4\tr

    %38
    \once\stemUp sib8 re'(do sib) la8.(sib32 do) mi,8.(fa32 sol)
    fa8 do' \grace fa,16 mib!8 re16 do \grace mib16 re8 do16 sib do4\tr
    sib r8 sib \grace mib re4~re16 do re mib

    %41
    fa8 sib, r re16 mib\mbreak fa8 sib,16 do re mib fa sol
    lab8 re, r16 re mib fa fa8. si,16 si8 do16 re
    re8 fa, r fa fa'8.[fa16 fa8 sol]

    %44
    mib4 r r
    r8. sol16[si8. do16 re8. fa,16]
    \grace fa8 mib4 r r\mbreak

    %47
    r8.mib16[la8. sib?16 do8. mib,16]
    \grace mib8 re4 r r
    R2.

    %50
    r8 re mib fa fa sib,
    r8 sib lab'8.[lab16 lab8. sol16]
    sol4 r r\mbreak

    %53
    R2.
    r8 sol [lab16 lab sib8 sib mib,]
    r mib sib'8.[sib16 do8 reb]

    %56
    reb8 sol, r sol sib8.[sib16 reb!8 do]
    \grace do lab4 r16 lab sib do sib8 sib r fa16 sol
    lab8. lab16 lab8 sib\mbreak \grace lab?8 sol4 r8 sol

    %59
    re'8. fa,16 fa4 r8 fa16 sol lab8 sol
    \grace fa8 mib4 r16 mib re do lab'8. [lab16 sol8 fa]
    si4 r16 si si do do8 sol r4

    %62
    R2.*5

}

IIvlIn = \relative do'' {

    do8. sol16 sol8. mib16 mib8.\tr re32 do
    sol'8. re16 re8. si16 si8.\tr la32 sol
    fa'4 r r

    %4
    R2.
    re'2.
    re1\p~

    %7
    re~
    re2 r
    la8.\f mi16 mi8. do16 do8.\tr si32 la

    %10
    la''1\fp~
    la2. r4
    sol,8.\f re16 re8. sib?16 sib8.\tr la32 sol

    %13
    re''8. la16 la8. fad16 fad8.\tr mi32 re
    sol8. re16 re8. sib16 sib8.\tr la32 sol
    sib'2 r

    %16
    R1
    r8._\markup\italic"Con sordini"  sib16^\p[sib8.(do16) do8. (re16)]
    mib8.[sib16 sib8. do16 do8. re16]

    %19
    mib4 r r2
    R1
    r8. mib16\f[mib8.(fa16) fa8.(sol16)]

    %22
    lab8.[mib16 mib8. \parentSlur (fa16) fa8.\parentSlur ( sol16)]
    lab4\p r fa r
    r sib,\f mib, r

    %25
    r8 sib' sib mib r fa fa fa
    mib mib fa fa sib, sib sib sib
    r sib sib mib r fa fa fa

    %28
    mib mib fa mib mib re re re\mbreak
    do do do do re re re sib
    do do do do re re re re

    %31
    sib sib do do re re re re
    sib sib do do re re sib do\mbreak
    re do do do do\staccatissimo do(sib la)

    %34
    sib\staccatissimo fa'(mib re) do\staccatissimo do(sib la)
    sib\staccatissimo fa'(mib re) do do do do
    re\staccatissimo fa(mib re) do do do do\mbreak

    %37
    do4 r8 do sib sib4 la8
    sib\staccatissimo fa'(mib re) do do do do
    do la sib do sib sib4 la8

    %40
    sib re16 mib fa8 fa fa fa fa fa\mbreak
    fa re16 mib fa8 fa fa fa fa fa
    fa1~

    %43
    fa4 r r2
    do8._\markup\italic"Senza sordini" sol16 sol8. mib16 mib8.\tr re32 do
    fa'2\p r4\mbreak

    %46
    do8.\f sol16 sol8. mib16 mib8.\tr re32 do
    mib'2 r4
    r8._\markup\italic"Con sordini" fa,16^\p [fa8. \parentSlur (sol16) sol8.\parentSlur ( la16)]

    %49
    sib8.\pp fa16 fa8. [\parentSlur(sol16) sol8.\parentSlur (la16)]
    sib4 r r\mbreak
    R2.

    %52
    r8. sib16\f[sib8.(do16) do8. (re16)]
    mib8. sib16 sib8. [(do16) do8. (re16)]
    mib4 r r

    %55
    R2.
    sib'1\p
    lab1~

    %58
    lab2 sol
    fa1
    mib4 r fa r

    %61
    re r r2
    do8._\markup\italic"Senza sordini" sol16 sol8. mib16 mib8.\tr re32 do
    sol'8. re16 re8. si16 si8.\tr la32 sol

    %64
    lab''2 r8\fermata r16 si,\pp \mbreak
    do8. fa,16 mib4(re\tr)
    do2\fermata r4

}

IIvlIIn = \relative do'' {

    do8. sol16 sol8. mib16 mib8.\tr re32 do
    sol'8. re16 re8. si16 si8.\tr la32 sol
    fa'4 r r

    %4
    si2.
    si
    si1\p~\mbreak

    %7
    si~
    si2 r
    la8.\f mi16 mi8. do16 do8.\tr si32 la

    %10
    do'1\fp~
    do2. r4
    sol8.\f re16 re8. sib?16 sib8.\tr la32 sol

    %13
    re''8. la16 la8. fad16 fad8.\tr mi32 re
    sol8. re16 re8. sib16 sib8.\tr la32 sol
    sol'2 r

    %16
    R1
    r8._\markup\italic"Con sordini" sol16^\p[sol8. lab16 lab8. fa16]
    sol8.[sol16 sol8. lab16 lab8. fa16]

    %19
    sol4 r r2
    R1
    r8. do16\f[do8. (reb16) reb8. (sib16)]

    %22
    do8. [do16 do8.( reb16) reb8. (sib16)]
    do4 \p r re r
    r sib\f mib, r\mbreak

    %25
    r8 sol sol sib sib sib sib sib
    do do sib sib r sol sol sol
    r sol sol sib sib sib sib sib

    %28
    do do sib sib sib sib sib sol\mbreak
    fa fa la la sib sib sib sib
    la la la la sib sib sib sib

    %31
    sol sol fa fa fa fa sib sib
    sol sol fa fa fa fa fa la\mbreak
    sib sib sib sib la fa fa fa

    %34
    fa re' do sib la fa fa fa
    fa re' do sib la la la la
    fa fa sol sol la la sib sib\mbreak

    %37
    la4 r8 la fa fa sol fa
    fa fa sol sol la la sib sib
    la la sol fa fa fa sol fa

    %40
    fa sib16 do re8 re re re re re
    re sib16 do re8 re re re re re\mbreak
    re1~

    %43
    re4 r r2
    do8._\markup\italic"Senza sordini" sol16 sol8. mib16 mib8.\tr re32 do
    re'2\p r4\mbreak

    %46
    do8.\f sol16 sol8. mib16 mib8.\tr re32 do
    do'2 r4
    r8._\markup\italic"Con sordini" re,16^\p[re8.(mib16) mib8.(re16)]

    %49
    re8.\pp[re16 re8.(mib16) mib8.(do16)]
    re4 r r
    R2.

    %52
    r8. sol16\f[sol8. (lab16) lab8. (fa16)]
    sol8.[sol16 sol8. (lab16) lab8. (fa16) ]
    sol4 r r

    %55
    R2.
    sol'1\p
    fa\mbreak

    %58
    fa2 mib
    re1
    do4 r do r\mbreak

    %61
    re r r2
    do8._\markup\italic"Senza sordini" sol16 sol8. mib16 mib8.\tr re32 do
    sol'8. re16 re8. si16 si8.\tr la32 sol

    %64
    si'2 r8\fermata r16 re,\pp
    mib8. re16 do4(si\tr)
    do2\fermata r4

}

IIvlan = \relative do' {

    do'8. sol16 sol8. mib16 mib8.\tr re32 do
    sol'8. re16 re8. si16 si8.\tr la32 sol
    lab'2.

    %4
    lab?
    lab?
    sold1\p~

    %7
    sold\parentSlur (
    sold2) r
    la8.\f mi16 mi8. do16 do8.\tr si32 la

    %10
    mib'!1\p~ \mbreak
    mib2. r4
    sol8.\f re16 re8. sib?16 sib8.\tr la32 sol

    %13
    re''8. la16 la8. fad16 fad8.\tr mi32 re
    sol8. re16 re8. sib16 sib8.\tr la32 sol
    mib'!2 r

    %16
    R1
    mib4_\markup\italic"(Con sordini)"^\p mib mib
    mib mib mib

    %19
    mib r r2
    R1\mbreak
    lab,4\f lab lab

    %22
    lab? lab lab
    lab? r sib r
    r sib'\f mib, r\mbreak

    %25
    r8 mib sol mib re re re re
    do do re re mib sib sol[mib]
    r mib' sol mib re re re re

    %28
    do do re mib sib sib sib sib
    fa' fa fa fa sib, sib sib sib
    fa' fa fa fa sib, sib sib sib

    %31
    mib mib mib mib re re re re
    mib mib mib mib re re re do
    sib mib mib mib fa fa fa fa

    %34
    fa fa fa fa fa fa fa fa
    fa fa fa fa fa fa fa fa\mbreak
    sib,4 mib, fa8 fa sol sol

    %37
    la4 r8 fa sib re mib fa
    sib,4 mib, fa8 fa sol sol
    la fa sol la sib re mib fa

    %40
    sib, sib sib sib sib sib sib sib
    sib sib sib sib sib sib sib sib\mbreak
    lab1\parentSlur (

    %43
    lab?4) r r2
    do'8. _\markup\italic"Senza sordini" sol16 sol8. mib16 mib8.\tr re32 do
    sol'2\p r4 \mbreak

    %46
    do8.\f sol16 sol8. mib16 mib8.\tr re32 do
    fa2 r4
    la,4_\markup\italic"Con sordini"^\p la la

    %49
    sib\pp sib sib
    sib4 r r\mbreak
    R2.

    %52
    mib4\f mib mib
    mib mib mib
    mib r r

    %55
    R2.
    reb'1\p
    do2 re!\mbreak

    %58
    re sib
    sol1
    sol4 r fa r\mbreak

    %61
    lab r r2
    do8._\markup\italic"Senza sordini" sol16 sol8. mib16 mib8.\tr re32 do
    sol'8. re16 re8. si16 si8.\tr la32 sol

    %64
    re'2 r8\fermata r16 sol,\pp
    sol8. lab16 sol4 \parentSlur (fa)
    mib2\fermata r4

}

IIcbn = \relative do {

    do'8. sol16 sol8. mib16 mib8.\tr re32 do
    sol'8. re16 re8. si16 si8.\tr la32 sol
    fa'8 fa fa fa fa fa

    %4
    fa fa fa fa fa fa
    fa fa fa fa fa fa
    mi4 r r2

    %7
    R1*2
    la8.\parenthesize \f mi16 mi8. do16 do8.\tr si!32 la\mbreak

    %10
    fad'2.\p r4
    R1
    sol8.\f re16 re8. sib?16 sib8.\tr la32 sol

    %13
    re''8. la16 la8. fad16 fad8.\tr mi?32 re\mbreak
    sol8. re16 re8. sib16 sib8.\tr la32 sol
    mib'!2 r

    %16
    R1
    mib4\p mib mib
    mib mib mib

    %19
    mib r r2
    R1
    lab4\f lab lab

    %22
    lab? lab lab
    lab?\p r r2
    r4 sib\f mib, r

    %25
    R1*17
    R1*2

    %44
    do'8. sol16 sol8. mib16 mib8.\tr re32 do
    si'2\p r4
    do8.\parenthesize \f sol16 sol8. mib16 mib8.\tr re32 do

    %47
    la'!2 r4
    sib,\p sib sib
    sib\pp sib sib\mbreak

    %50
    sib r r
    R2.
    mib4\parenthesize \f mib mib

    %53
    mib mib mib
    mib r r\mbreak
    R2.

    %56
    R1*5
    r2 r4 sol

    %62
    do,8. sol'16 sol8. mib16 mib8.\tr re32 do\mbreak
    sol'8. re16 re8. si16 si8.\tr la32 sol
    fa'2 r8\fermata r16 fa\pp

    %65
    mib8. fa16 sol4 sol,
    do,2\fermata

}

IIbcn = \relative do {

    do'8. sol16 sol8. mib16 mib8.\tr re32 do
    sol'8. re16 re8. si16 si8.\tr la32 sol
    fa'8 fa fa fa fa fa

    %4
    fa fa fa fa fa fa
    fa fa fa fa fa fa
    mi1~

    %7
    mi~
    mi2 r
    la8.\parenthesize \f mi16 mi8. do16 do8.\tr si!32 la\mbreak

    %10
    fad'1\p~
    fad2. r4
    sol8.\f re16 re8. sib?16 sib8.\tr la32 sol

    %13
    re''8. la16 la8. fad16 fad8.\tr mi?32 re\mbreak
    sol8. re16 re8. sib16 sib8.\tr la32 sol
    mib'!2 r

    %16
    R1
    mib4\p mib mib
    mib mib mib

    %19
    mib r r2
    R1
    lab4\f lab lab

    %22
    lab? lab lab
    lab?\p r lab r
    r sib\f mib, r

    %25
    R1*17
    si1~
    si4 r r2

    %44
    do'8. sol16 sol8. mib16 mib8.\tr re32 do
    si'2\p r4
    do8.\parenthesize \f sol16 sol8. mib16 mib8.\tr re32 do

    %47
    la'!2 r4
    sib,\p sib sib
    sib\pp sib sib\mbreak

    %50
    sib r r
    R2.
    mib4\parenthesize \f mib mib

    %53
    mib mib mib
    mib r r\mbreak
    R2.

    %56
    mi1\p
    fa2 re
    re mib\mbreak

    %59
    si1
    do4 r fa r
    fa r r sol

    %62
    do,8. sol'16 sol8. mib16 mib8.\tr re32 do\mbreak
    sol'8. re16 re8. si16 si8.\tr la32 sol
    fa'2 r8\fermata r16 fa\pp

    %65
    mib8. fa16 sol4 sol,
    do,2\fermata

}

IIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {
    \key sol\minor
    \time 3/4
    \tempo 4 = 50
    s2.*5
    \time 4/4 \once \override Score.RehearsalMark.extra-offset = #'(+6 . -1)
    \mark\markup\italic"Lento"
    s1*3
    \time 3/4
    s2.
    \time 4/4
    s1*2
    \time 3/4
    s2.*3
    \time 4/4
    s1*2
    \time 3/4
    s2.*2
    \time 4/4
    s1*2
    \time 3/4
    s2.*2
    \time 4/4
    s1*2
    \bar "||"\break \once \override Score.RehearsalMark.extra-offset = #'(+14 . -1.0)
    \mark\markup\italic"Arioso - Con sordini"
    \tempo 4 = 60
    s1*17 \once \override Score.RehearsalMark.extra-offset = #'(+6 . +1.0)
    \mark\markup\italic"Lento"
     \tempo 4 = 50
    s1*2
    \time 3/4
    s2.*12
    \time 4/4 \once \override Score.RehearsalMark.extra-offset = #'(+6 . 1.0)
    \mark\markup\italic"Lento"
    s1*6
    \time 3/4
    s2.*5
    \bar "|."

}

IIfl = {
    \IIglobal
    \notypeset
    <<\IIfln \forma>>

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

IIcb = {
    \IIglobal
    \clef bass
    <<\IIcbn \forma>>

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


IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIIfln = \relative do'' {

    \new CueVoice {
        sib8
        sib[sib sib sib]
        sib do16 re mib fa sol lab
        sib8[sib, sib sib]

        %4
        sib do16 re mib fa sol lab
        sib4 do
        re,8\tr mib r sol,16 lab\mbreak

        %7
        sib4\tr do8 mib,
        re\tr mib r4
        r8 sib' do4\tr
    }

    %10
    R2*26
    \new CueVoice {
        sol16(lab sib8) sib,4\tr

        %37
        \grace lab'16 sol8 fa16 sol \grace sib16 lab8 sol16 lab
        \grace do16 sib8 do16 re mib8 lab,
        sol16(fa mib8) fa4\tr

        %40
        mib16 fa sol lab sib do re mib\mbreak
        lab,4\staccatissimo sib\staccatissimo
        \once\stemUp mib,16 lab' sol fa mib re do sib

        %43
        lab4\staccatissimo sib\staccatissimo
        mib,
    } r8 sib'\solo
    mib4 mib

    %46
    mib2~
    mib8 sib'16 lab sol fa mib re\mbreak
    mib2~

    %49
    mib8 sib'16 lab sol fa mib re
    mib8 sib'16 lab sol fa mib re
    mib8[sib' sib sib]

    %52
    sib sib sib do16 re
    mib8[sib sib sib]
    sib sib sib do16 re

    %55
    mib4 mib,
    do' do\mbreak
    \grace do8 sib4. lab8

    %58
    sol fa4 mib8
    re[fa fa fa]
    fa fa fa sol16 la

    %61
    sib8[fa fa fa]
    fa fa fa sol16 la
    sib4 sib,

    %64
    lab'!4. sol16 fa
    \grace fa8 sol4. fa8\mbreak
    mib re16 do re8 mib

    %67
    \grace re8 do4 r
    r16 fa mi fa re fa mi fa
    do fa mi? fa sib fa mi fa

    %70
    la fa mi? fa re fa mi fa
    do fa mi? fa sib fa mi fa\mbreak
    la sol fa mi fa sol la sib

    %73
    do fa, mi fa re'4
    do16 fa, mi fa re'4
    do16 la sol la sib sol fa sol

    %76
    la fa mi fa sol fa mi fa
    do' la sol la sib sol fa sol\mbreak
    la fa mi fa sol fa mi fa

    %79
    re' fa, mi fa sol fa mib re
    mib mib re mib fa mib re mib
    do' mib, re mib fa mib re do

    %82
    re re do re mib re do re
    sib' la sol fa mi re do sib\mbreak
    la8 do 4 re16 mib!

    %85
    re8 mi4 fa16 sol
    fa2
    sol4\tr la?\tr

    %88
    sib8 la?16 sol fa8 mib
    re4 do\tr
    sib4 r

    %91
    R2*22
    \new CueVoice {
        do8 re16 mib re8 do

        %114
        re16 (mib fa8) fa,4\tr
        re'16 (mib fa8) fa,4\tr
        \grace mib'16 re8 do16 re \grace fa16 mib8 re16 mib

        %117
        fa8[la, sib mib]
        re16 do sib8 do4\tr
        sib16 re do sib la sol fa mib\mbreak %% fine p. 1

        %120
        re8[sib' do, la']
        sib sib,
    } r fa''\solo
    sib4 sib

    %123
    sib2~
    sib16 sib, do re mib fa sol la
    sib2~

    %126
    sib16 sib, do re mib fa sol la
    sib sib, do re mib fa sol la\mbreak
    sib8 sib,16 do re mib fa sol

    %129
    lab!8 lab4 sol16 fa
    \grace fa4 sol4. lab16 sib
    do sib lab sol fa8 mib

    %132
    re16 do sib8 r sib
    mib4 mib
    mib2~

    %135
    mib8 sib'16 lab sol fa mib re
    mib2~\mbreak
    mib8 sib'16 lab sol fa mib re

    %138
    do8 sib'16 lab sol fa mib re
    mib8 mib16 fa sol lab sib do
    reb2

    %141
    mi,
    fa16 mi? fa do fa mi fa lab
    sol fa sol do, sol' fa sol sib

    %144
    lab sol fa mi fa sol lab sib
    do2
    re,\tr

    %147
    mib?16 re mib sib mib re mib sol
    fa mib fa sib, fa' mib fa lab
    sol fa sol sib,  mib re mib sol\mbreak

    %150
    fa mib fa sib, fa' mib fa lab
    sol fa sol mib sol fa sol sib
    do sib lab sol fa4\tr

    %153
    sib16 lab sol fa mib4\tr
    do'16 sib lab sol fa4\tr
    sib16 lab sol fa mib4\tr \mbreak

    %156
    lab16 sol fa mib re mib fa re
    sol fa mib re do re mib do
    fa sol lab sol fa  mib re do

    %159
    si sol si re sol re si re
    sol, re' si? re sol fa mib re\mbreak
    mib do mib sol do sol mib sol

    %162
    do, sol' mi sol do sib lab sol
    lab fa, lab do fa do lab do
    fa, do' la do fa mib? re do

    %165
    re sib re fa sib fa re fa
    sib, fa' re fa sib lab sol fa
    sol mib sol sib mib mib mib mib

    %168
    mib sib sol sib mib, sol fa mib
    fa re fa sib re re re re
    re sib fa sib re, fa mib re

    %171
    mib do mib sol do do do do
    do sol mib sol do, mib re do\mbreak
    re sol, si re sol sol sol sol

    %174
    sol re si re sol, fa' mib re
    mib do si do re mib fa sol
    lab! fa mi fa si4\tr

    %177
    do8 sib!16 lab sol8 fa
    mib4 re\tr\mbreak
    do r

    %180
    R2*12
    \new CueVoice {
        mib16 sol sol sol sol sol sol sol
        sol sol sol sol sol sol sol sol

        %194
        sol sol sol sol si si si si
        do8 do,16 si do8 fa
        mib4 re\tr

        %197
        do8 sol16 sol sol sol sol sol
        sol sol sol sol sol sol sol sol
        sol sol sol sol si si si si

        %200
        do re mib fa sol8 \once\stemUp mib,
        fa4 sol
    }
    <<\new CueVoice {do,} \\{\once \override Rest.staff-position = #+3 r8 sol''8\solo\f[sol sol]}>>

    %203
    sol sol sol la16 si
    do8[sol sol sol]\mbreak
    sol sol sol la16 si

    %206
    do do, mib sol do, mib sol do
    si sol, si re sol, si re sol
    mib do mib sol do, mib sol do

    %209
    si la sol8r16 sol la si
    do sol mib sol do, mib sol do
    lab! fa, lab do fa lab sol fa

    %212
    sib fa re fa sib, re fa lab
    sol8[sib sib sib]
    sib sib sib do16 re\mbreak

    %215
    mib8[sib sib sib]
    sib sib sib do16 re
    mib4 mib,

    %218
    do' do
    \grace do4 sib4. lab8
    sol fa4 mib8

    %221
    re16 fa mib fa sib,4\tr \mbreak
    r16 fa' mib fa re fa mib re
    mib sol fa sol sib,4\tr

    %224
    r16 sol' fa sol mib sol fa mib
    fa lab sol lab sib,4\tr
    r16 lab' sol lab fa lab sol fa

    %227
    <<sol4\\{ \new CueVoice {sib,8[sib sib sib]}}>>
    \new CueVoice {
        sib do16 re mib fa sol lab

        %229
        sib8[sib, sib sib]
        sib do16 re mib fa sol lab
        sib4 do

        %232
        re,8\tr mib r sol,16 lab
        sib4\tr do8 mib,
        re\tr mib
    } r4\mbreak

    %235
    r8 sib'\solo do4\tr
    sib4 do16 re mib fa
    sol8 sib, do4\tr

    %238
    sib do16 re mib fa
    sol4 sol
    \grace sol4 fa4. mib16 re\mbreak

    %241
    mib4. re16 do
    re do sib8 r4
    do' do

    %244
    \grace do8 sib4. lab16 sol
    lab4. sol16 fa
    sol fa mib8 r sol

    %247
    fa16 sol lab lab sol lab sib sib\mbreak
    re, mib fa fa mib fa sol sol
    fa sol lab lab sol lab sib sib

    %250
    re, mib fa fa mib fa sol sol
    fa mib re do sib lab sol fa
    mib8 mib' do lab'\mbreak

    %253
    \grace mib4 re2\tr
    <<mib4\\\new CueVoice {r8 \stemNeutral  mib,\f[mib mib]}>>

    %255
    \new CueVoice {
        mib fa16 sol lab sib do re
        mib8 sib do4\tr
        sib do16 re mib fa

        %258
        sol sol mib mib sib sib mib mib\mbreak
        do do mib mib sib sib mib mib
        lab, lab mib' mib sol, sol mib' mib

        %261
        fa, sol lab sib do8
    } mib\solo
    re16 mib fa fa sib, re fa lab

    %263
    sol lab sib sib mib, sol sib sol
    re mib fa fa sib, re fa lab\mbreak
    sol lab sib sib mib, sol sib reb

    %266
    do mib, re mib fa mib re mib
    sib' mib, re mib fa mib re mib
    do' mib, re mib fa mib re mib

    %269
    sib' mib, re mib fa mib re mib\mbreak
    do' sib lab sol fa mib re do
    sib do re mib fa sol lab fa

    %272
    sib8 mib,\grace sol16 fa8 mib16 re
    mib4 \grace sol16 fa8 mib16 re
    mib4 \grace sol16 fa8 mib16 re

    %275
    mib8[sib' sib sib]\mbreak
    sib sib sib do16 re
    mib8[sib sib sib]

    %278
    sib sib sib do16 re
    mib8 re16 do sib8 lab
    sol4 fa\tr

    %281
    mib16 sol fa mib re do sib lab\mbreak
    sol8 mib' fa,4\tr
    mib r

    %284
    R2*35

}

IIIvlIn = \relative do'' {

    sib8
    sib[sib sib sib]
    sib do16 re mib fa sol lab
    sib8[sib, sib sib]

    %4
    sib do16 re mib fa sol lab
    sib4 do
    re,8\tr mib r sol,16 lab\mbreak

    %7
    sib4\tr do8 mib,
    re\tr mib r4
    r8 sib' do4\tr

    %10
    sib do16 re mib fa
    sol8 sib, do4\tr
    sib do16 re mib fa

    %13
    sol8 \once\stemUp mib, sol'16 fa sol mib
    \once\stemDown fa8 re, fa'16 mib fa re\mbreak
    \once\stemDown mib8 do, mib'16 re mib do

    %16
    \once\stemDown re8 sib, r4
    do'' do,
    sib4. sib'8

    %19
    lab16 sol fa mib re do sib lab
    sol fa mib8 r4
    R2

    %22
    r4 fa'-.\p(
    fa-. fa-.)
    fa8 sol16 lab sol8 fa\mbreak

    %25
    sol16(lab sib8) sib,4\tr
    sol'16(lab sib8) sib,4\tr
    \grace lab'16 sol8 fa16 sol \grace sib16 lab8 sol16 lab

    %28
    sib8[re, mib lab]
    sol16(fa mib8) fa4\tr
    mib r

    %31
    R2
    r4 fa,-.\f(
    fa-. fa-.)\mbreak

    %34
    fa8 (sol16 lab) sol8 fa
    sol16(lab sib8) sib,4\tr
    sol'16(lab sib8) sib,4\tr

    %37
    \grace lab'16 sol8 fa16 sol \grace sib16 lab8 sol16 lab
    \grace do16 sib8 do16 re mib8 lab,
    sol16(fa mib8) fa4\tr

    %40
    mib16 fa sol lab sib do re mib\mbreak
    lab,4\staccatissimo sib\staccatissimo
    \once\stemUp mib,16 lab' sol fa mib re do sib

    %43
    lab4\staccatissimo sib\staccatissimo
    mib, r
    R2

    %46
    r8 sib'\p do4\tr
    sib r
    r8 sib do4\tr

    %49
    sib r\mbreak
    R2
    r4 r8 sol'\p

    %52
    fa[mib re do]
    sib[sol' fa mib]
    re[do sib lab]

    %55
    sol4 r
    R2*3
    r4 r8 re'\p \mbreak

    %60
    do[sib la sol]
    fa[re' do sib]
    la[sol fa mib]

    %63
    re4 r
    R2*4
    r4 sib''8\p r

    %69
    la r re, r\mbreak
    do r sib' r
    la r re, r

    %72
    do4 r
    R2*6
    sol'2\p~

    %80
    sol4-. r
    fa2~
    fa4-. r\mbreak

    %83
    mi2(
    fa4-.) r
    R2*4

    %89
    r4 r8 fa,\f
    fa[fa fa fa]
    fa sol16 la sib do re mib

    %92
    fa8[fa, fa fa]
    fa sol16 la sib do re mib\mbreak
    fa4\staccatissimo sol\staccatissimo

    %95
    la,8\staccatissimo sib\staccatissimo r re,16 mib
    fa4\tr sol8 sol,
    la\tr sib r4

    %98
    r8 fa' sol4\tr
    fa sol16 la sib do
    re8 fa, sol4\tr

    %101
    fa sol16 la sib do\mbreak
    re8 sib, re'16 do re sib
    do8 la, do'16 sib do la
    sib8 sib, sib'16 la sib sol

    %105
    la8 fa r4
    sol'4 sol,
    fa4. fa'8

    %108
    mib16 re do sib la sol fa mib
    re \parentSlur (do sib8) r4\mbreak
    R2

    %111
    r4 do'-.\parenthesize \p (
    do-. do-.)
    do8 re16 mib re8 do

    %114
    re16 (mib fa8) fa,4\tr
    re'16 (mib fa8) fa,4\tr
    \grace mib'16 re8 do16 re \grace fa16 mib8 re16 mib

    %117
    fa8[la, sib mib]
    re16 do sib8 do4\tr
    sib16 re do sib la sol fa mib\mbreak %% fine p. 1

    %120
    re8[sib' do, la']
    sib sib, r4
    R2

    %123
    r8 fa''\p sol4\tr
    fa4 r
    r8 fa sol4\tr

    %126
    fa r
    R2*7
    r8 sib,\p do4\tr

    %135
    sib r\mbreak
    r8 sib do4\tr
    sib r

    %138
    R2*2
    r4 fa'8 r
    sol r mi sol

    %142
    do, r fa r
    sol r sib r
    lab4 r

    %145
    r8 lab[fa lab]
    r fa[re fa]\mbreak
    sib, r mib r

    %148
    fa r lab r
    sol r mib r
    fa r lab r

    %151
    sol4 r8 mib,
    lab[lab lab lab]
    sol[sol sol sol]

    %154
    lab[lab lab lab]
    sol[sol sol sol]
    fa[fa sib sib]

    %157
    mib,[mib lab lab]
    re,[re re re]
    re'4 r

    %160
    re8 r re r
    mib4 r
    mi8 r mi r

    %163
    fa4 r
    fa8 r fa r
    fa4 r

    %166
    fa8 r fa r
    sol4 r
    sol8[sol sol sol]

    %169
    fa4 r
    fa8[fa fa fa]\mbreak
    mib4 r

    %172
    mib8[mib mib mib]
    re4 r
    re8[re re re]

    %175
    mib4 r
    R2*2
    r4 r8 sol\f

    %179
    sol[sol sol sol]
    sol16 fa mib re do sib lab sol
    lab8[fa' fa fa]\mbreak

    %182
    fa16 mib re do sib lab sol fa
    sol8[mib' mib mib]
    mib16 re do sib lab sol fa mib

    %185
    fa8[re' re re]
    re16 do si la sol fa mib re
    mib8 do r4

    %188
    R2
    r4 re'-.\parenthesize \p (
    re-. re-.)

    %191
    re8 (mib16 fa) mib8 re
    mib16 sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %194
    sol sol sol sol si si si si
    do8 do,16 si do8 fa
    mib4 re\tr

    %197
    do8 sol16 sol sol sol sol sol
    sol sol sol sol sol sol sol sol
    sol sol sol sol si si si si

    %200
    do re mib fa sol8 \once\stemUp mib,
    fa4 sol
    do, r8 mib'\p

    %203
    re[do si la]
    sol[mib' re do]
    si[la sol fa]

    %206
    mib r sol' r\mbreak
    r4 sol8 r
    sol r sol r

    %209
    r sol[sol sol]
    sol[sol sol sol]
    lab r do r

    %212
    r fa,[fa fa]
    sol mib r sol
    fa[mib re do]

    %215
    sib[sol' fa mib]
    re[do sib lab]
    sol4 r

    %218
    R2*3
    r4 fa'\p
    fa fa

    %223
    sol sol
    sol sol
    fa fa

    %226
    fa r8 sib,\f
    sib[sib sib sib]
    sib do16 re mib fa sol lab

    %229
    sib8[sib, sib sib]
    sib do16 re mib fa sol lab
    sib4 do

    %232
    re,8\tr mib r sol,16 lab\mbreak
    sib4\tr do8 mib,
    re\tr mib r mib\p

    %235
    mib[mib mib mib]
    mib fa16 sol lab sib do re
    mib8 sol, lab4\tr

    %238
    sol4 lab16 sib do re
    mib8 sib do4~
    do sib~

    %241
    sib la\tr
    sib mib~
    mib fa~

    %244
    fa mib~
    mib re\tr
    mib8 sol16 lab sib8 r

    %247
    fa r sol r
    re r mib r \mbreak
    fa r sol r

    %250
    re r mib r
    R2*3  %% fine p. 2
    r8 mib,\f[mib mib]

    %255
    mib fa16 sol lab sib do re
    mib8 sib do4\tr
    sib do16 re mib fa

    %258
    sol sol mib mib sib sib mib mib\mbreak
    do do mib mib sib sib mib mib
    lab, lab mib' mib sol, sol mib' mib

    %261
    fa, sol lab sib do8 do,
    sib\p r fa'' r
    r4 sol

    %264
    r fa\mbreak
    r sol
    r do

    %267
    r sib
    r do
    r sib

    %270
    R2*5
    r8 sol\p[fa mib]
    re[do sib lab]\mbreak

    %277
    sol[sol' fa mib]
    re[do sib lab]
    sol4 r

    %280
    R2*3
    r8 sib\f do4\tr  %% ripresa
    sib do16 re mib fa

    %285
    sol8 sib, do4\tr
    sib do16 re mib fa
    sol8 \once\stemUp mib, sol'16 fa sol mib

    %288
    \once\stemDown fa8 re, fa'16 mib fa re\mbreak
    \once\stemDown mib8 do, mib'16 re mib do
    \once\stemDown re8 sib, r4

    %291
    do'' do,
    sib4. sib'8
    lab16 sol fa mib re do sib lab

    %294
    sol fa mib8 r4
    R2
    r4 fa'-.\p(

    %297
    fa-. fa-.)
    fa8 sol16 lab sol8 fa\mbreak
    sol16(lab sib8) sib,4\tr

    %300
    sol'16(lab sib8) sib,4\tr
    \grace lab'16 sol8 fa16 sol \grace sib16 lab8 sol16 lab
    sib8[re, mib lab]

    %303
    sol16(fa mib8) fa4\tr
    mib r
    R2

    %306
    r4 fa,-.\f(
    fa-. fa-.)\mbreak
    fa8 sol16 lab sol8 fa

    %309
    sol16(lab sib8) sib,4\tr
    sol'16(lab sib8) sib,4\tr
    \grace lab'16 sol8 fa16 sol \grace sib16 lab8 sol16 lab

    %312
    \grace do16 sib8 do16 re mib8 lab,
    sol16(fa mib8) fa4\tr
    mib16 fa sol lab sib do re mib\mbreak

    %315
    lab,4\staccatissimo sib\staccatissimo
    \once\stemUp mib,16 lab' sol fa mib re do sib
    lab4\staccatissimo sib\staccatissimo

    %318
    mib, r

}

IIIvlIIn = \relative do'' {

    sib8
    sib [sib lab lab]
    sol16 sib do re mib re mib fa
    sol8[sib, lab lab]

    %4
    sol16 sib do re mib fa sol lab
    sib4 do
    re,8\tr mib r sol,16 lab

    %7
    sib4\tr do8 mib,\mbreak
    re\tr mib r4
    r8 sol lab4\tr

    %10
    sol lab16 sib do re
    mib8 sol, lab4\tr
    sol lab16 sib do re

    %13
    mib8 mib, do'4~
    do sib~
    sib la

    %16
    sib sib'~
    sib lab~\mbreak
    lab8 sol16 fa sol8 sib

    %19
    lab16 sol fa mib re do sib lab
    sol fa mib8 mib'4-.(
    mib-. mib-.

    %22
    mib-. mib-.
    mib-. mib-.)
    re8 mib16 fa mib8 re

    %25
    sol16(lab sib8) sib,4\tr
    sol'16 (lab sib8) sib,4\tr
    \grace lab'16 sol8 fa16 sol \grace sib16 lab8 sol16 lab

    %28
    sib8[re, mib lab]
    sol16(fa mib8) fa4\tr
    mib mib,-.(

    %31
    mib-. mib-.
    mib-. mib-.
    mib-. mib-.)

    %34
    re8 (mib16 fa) mib8 re
    sol16(lab sib8) sib,4\tr
    sol'16(lab sib8) sib,4\tr

    %37
    \grace lab'16 sol8 fa16 sol \grace sib16 lab8 sol16 lab
    \grace do16 sib8 do16 re mib8 lab,
    sol16(fa mib8) fa4\tr

    %40
    mib16 re mib fa sol lab sib sol
    lab4\staccatissimo sib\staccatissimo
    mib,8 mib'16 re do sib lab sol

    %43
    lab4\staccatissimo sib\staccatissimo
    mib, r
    R2

    %46
    r8 sol\p lab4\tr
    sol4 r
    r8 sol lab4\tr

    %49
    sol4 r
    R2
    r4 r8 mib'\p

    %52
    re[do sib lab]
    sol[mib' re do]
    sib[lab sol fa]

    %55
    mib4 r
    R2*3\mbreak
    r4 r8 sib'\p

    %60
    la[sol fa mib]
    re[sib' la? sol]
    fa[mib re do]

    %63
    sib4 r
    R2*4
    r4 re'8\p r

    %69
    do r fa, r
    fa r re' r\mbreak
    do r fa, r

    %72
    fa4 r
    R2*6
    fa'2\p(

    %80
    mib4-.) r
    mib2(
    re4-.) r

    %83
    sib2(
    do4-.) r
    R2*4

    %89
    r4 r8 fa,\f
    fa[fa mib mib]
    re16 fa sol la sib la sib do

    %92
    re8[fa, mib mib]
    re16 fa sol la sib do re mib
    fa4 sol

    %95
    la,8\tr sib r re,16 mib
    fa4\tr sol8 sib,\mbreak
    la\tr sib r4

    %98
    r8 re mib4\tr
    re mib16 fa sol la
    sib8 re, mib4\tr

    %101
    re mib16 fa sol la
    sib8 sib, sol'4~
    sol fa~

    %104
    fa mi
    fa fa'~\mbreak
    fa mib!~

    %107
    mib8 re16 do re8 fa
    mib16 re do sib la sol fa mib
    re (do sib8) sib'4-.(

    %110
    sib-. sib-.
    sib-. sib-.
    sib-. sib-.)

    %113
    la8 sib16 do sib8 la
    re16 (mib fa8) fa,4\tr
    re'16 (mib fa8) fa,4\tr

    %116
    \grace mib'16 re8 do16 re \grace fa16 mib8 re16 mib
    fa8[la, sib mib]
    re16 do sib8 do4\tr

    %119
    sib16 re do sib la sol fa mib\mbreak %% fine p. 1
    re8[sib' do, la']
    sib sib, r4

    %122
    R2
    r8 re'\p mib4\tr
    re r

    %125
    r8 re mib4\tr \mbreak
    re r
    R2*7

    %134
    r8 sol,\p lab4\tr
    sol4 r
    r8 sol lab4\tr

    %137
    sol r
    R2*2
    r8 fa'16\p mib reb8 do

    %141
    sib lab sol4\tr
    lab8 r do r
    do r do r\mbreak

    %144
    do4 r
    r8 do[do do]
    r sib[sib sib]

    %147
    r4 sib8 r
    sib r sib r
    sib r sib r

    %150
    sib r sib r
    sib4 r8 mib,\mbreak
    lab[lab lab lab]

    %153
    sol[sol sol sol]
    lab[lab lab lab]
    sol[sol sol sol]

    %156
    fa[fa sib sib]
    mib,[mib lab lab]
    re,[re re re]

    %159
    si'4 r\mbreak
    si?8 r si r
    sol4 r

    %162
    sol8 r sol r
    fa4 r
    la8 r la r

    %165
    sib4 r
    re8 r re r
    mib4 r

    %168
    mib8[mib mib mib]\mbreak
    re4 r
    re8[re re re]

    %171
    do4 r
    do8[do do do]
    si4 r

    %174
    si8[si si si]
    do4 r
    R2*3

    %179
    r4 r8 do\f\mbreak
    do[do do do]
    do16 sib? lab sol fa mib re do

    %182
    re8[sib' sib sib]
    sib16 lab sol fa mib re do sib
    do8[lab' lab lab]

    %185
    lab16 sol fa mib re mib re do
    si8 sol' sol16 fa mib re
    mib8 do do'4-.(

    %188
    do-. do-.
    do-. do-.
    do-. do-.)

    %191
    si8 (do16 re) do8 si
    mib16(fa sol8) sol,4\tr
    mib'16(fa sol8) sol,4\tr

    %194
    \grace fa'16 mib8 re16 mib \grace sol16 fa8 mib16 fa
    sol8 do,16 si do8 re\mbreak
    do16 mib re do si la sol fa

    %197
    mib(fa sol8) sol,4\tr
    mib'16(fa sol8) sol,4\tr
    \grace fa'16 mib8 re16 mib \grace sol16 fa8 mib16 fa

    %200
    sol8 do16 re mib8 mib,
    fa4 sol
    do, r8 do'\p\mbreak

    %203
    si[la sol fa]
    mib[do' si la]
    sol[fa mib re]

    %206
    do4 r8 mib'
    re[si re si]
    mib4 r8 mib

    %209
    re[si re si]
    mib do r do\mbreak
    do[do do do]

    %212
    re sib r sib
    sib sol r mib'
    re[do sib lab]

    %215
    sol[mib' re do]
    sib[lab sol fa]
    mib4 r

    %218
    R2*3
    r4 re'\p\mbreak
    re re

    %223
    mib mib
    mib \once\stemDown mib8 sib,
    sib[sib sib sib]

    %226
    sib4 r8 sib'\f
    sib[sib lab lab]
    sol16 sib do re mib re mib fa

    %229
    sol8[sib, lab lab]\mbreak
    sol16 sib do re mib fa sol lab
    sib4 do

    %232
    re,8\tr mib r sol,16 lab
    sib4\tr do8 mib,
    re\tr mib r4

    %235
    r8 sol\p lab4\tr
    sol lab16 sib do re
    mib8[mib, mib mib]

    %238
    mib fa16 sol lab sib do re\mbreak
    mib8[mib, mib mib]
    re[re sol sol]

    %241
    do,[do fa fa]
    sib,[sib' sol mib]
    lab8 [lab lab lab]

    %244
    sol[sol do do]
    fa,[fa sib sib]
    mib,4 r8 mib

    %247
    re r mib r\mbreak
    fa r sol r
    re r mib r

    %250
    fa r sol r
    R2*3\mbreak %% fine p.2
    r8 mib\f[mib mib]

    %255
    mib fa16 sol lab sib do re
    mib8 sol, lab4\tr
    sol lab16 sib do re

    %258
    mib mib sib sib sol sol mib mib
    do' do mib mib sib sib mib mib\mbreak
    lab, lab mib' mib sol, sol mib' mib

    %261
    fa, sol lab sib do8 do,
    sib r sib'\p r
    r4 mib

    %264
    r re
    r mib
    r re\mbreak

    %267
    mib r
    r mib
    r mib

    %270
    R2*5
    r8 mib\p[re do]
    sib[lab sol fa]

    %277
    mib[mib' re do]
    sib[lab sol fa]\mbreak
    mib4 r

    %280
    R2*3
    r8 sol \f lab4\tr
    sol lab16 sib do re

    %285
    mib8 sol, lab4\tr
    sol lab16 sib do re
    mib8 mib, do'4~

    %288
    do sib~
    sib la
    sib sib'~

    %291
    sib lab~\mbreak
    lab8 sol16 fa sol8 sib
    lab16 sol fa mib re do sib lab

    %294
    sol fa mib8 mib'4-.(
    mib-. mib-.
    mib-. mib-.

    %297
    mib-. mib-.)
    re8 mib16 fa mib8 re
    sol16(lab sib8) sib,4\tr

    %300
    sol'16\parentSlur (lab sib8) sib,4\tr
    \grace lab'16 sol8 fa16 sol \grace sib16 lab8 sol16 lab
    sib8[re, mib lab]

    %303
    sol16(fa mib8) fa4\tr
    mib mib,-.(
    mib-. mib-.

    %306
    mib-. mib-.
    mib-. mib-.)
    re8 mib16 fa mib8 re

    %309
    sol16(lab sib8) sib,4\tr
    sol'16(lab sib8) sib,4\tr
    \grace lab'16 sol8 fa16 sol \grace sib16 lab8 sol16 lab

    %312
    \grace do16 sib8 do16 re mib8 lab,
    sol16(fa mib8) fa4\tr
    mib16 re mib fa sol lab sib sol

    %315
    lab4\staccatissimo sib\staccatissimo
    mib,8 mib'16 re do sib lab sol
    lab4\staccatissimo sib\staccatissimo

    %318
    mib, r

}

IIIvlan = \relative do' {

    r8
    r sol'[fa re]
    mib mib sib'4
    r8 sol[fa re]

    %4
    mib[mib sib' sib]\mbreak
    mib,[sol fa lab]
    fa\tr mib r sol16 lab

    %7
    sib4\tr do8 mib,
    re\tr mib r mib
    mib[mib mib mib]\mbreak

    %10
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]
    mib fa16 sol lab sib do re

    %13
    mib8[mib, mib mib]
    re[re re re]\mbreak
    sol[sol fa fa]

    %16
    fa[fa fa fa]
    mib[mib fa fa]
    fa[re mib mib]

    %19
    r do'[fa, fa]
    sol[lab sib do]\mbreak
    sib[lab sib sol]

    %22
    do[sib lab sib]
    do[sib do la]
    sib4 r8 sib

    %25
    sib mib, fa32(mib re8.)
    sib8 sib fa'16(mib re8)\mbreak
    sib[sib' lab lab]

    %28
    sol[fa mib fa]
    mib fa4 re8
    mib4 r8 do\p

    %31
    sib[lab sib sol]
    do[sib lab\f sib]\mbreak
    do[sib do la]

    %34
    sib4 r8 sib
    sib sib fa'16(mib re8)
    sib sib fa'16(mib re8)

    %37
    sib[sib lab lab]\mbreak
    sol[mib' sib re]
    mib fa4 re8

    %40
    mib4 r
    lab\staccatissimo sib\staccatissimo
    mib,4 r

    %43
    lab\staccatissimo sib\staccatissimo
    mib, r\mbreak
    R2*45

    %90
    r8 re\f[do la]
    sib sib fa'4
    r8 re[do la]

    %93
    sib sib fa' fa\mbreak
    sib,[re do mib]
    do\tr sib r re16 mib

    %96
    fa4\tr sol8 sib,
    la\tr sib r sib
    sib[sib sib sib]

    %99
    sib do16 re mib fa sol la
    sib8[sib, sib sib]
    sib do16 re mib fa sol la

    %102
    sib8[sib, sib sib]
    la[la la la]
    re[re do do]

    %105
    do[do do do]\mbreak
    sib[sib do do]
    sib[la sib sib]

    %108
    r sol' [do, do]
    re[mib fa sol]
    fa[mib fa re]\mbreak

    %111
    sol[fa mib fa]
    sol[fa sol mi]
    fa4 r8 fa

    %114
    fa sib, do16(sib la8)
    fa sib do16(sib la8)\mbreak
    fa[fa' mib mib]

    %117
    re[do sib do]
    sib fa' sol fa16 mib
    re4 r8 do

    %120
    sib[fa' sol do,]\mbreak
    re4 r
    R2*57

    %179
    r8 mib\f[mib mib]
    mib[fa sol mib]\mbreak
    lab4 r8 lab

    %182
    re,[mib fa re]
    sol4 r8 sol
    do,[re mib do]

    %185
    fa4 r8 fa
    sol[re re sol]\mbreak
    mib[fa sol lab]

    %188
    sol[fa sol mib]
    lab[sol fa sol]
    lab[sol lab fa]

    %191
    sol4 r8 sol
    lab do, re16(do si8)\mbreak
    sol do re16 (do si8)

    %194
    sol[sol' fa fa]
    mib[re do lab']
    sol4 sol,

    %197
    sol8 do re16 (do si8)
    sol8 do re16 (do si8)\mbreak
    sol8[sol fa fa]

    %200
    mib4 r8 mib'
    fa4 sol
    do, r

    %203
    R2*19
    r4 r8 sib\p\mbreak
    sib[sib sib sib]

    %224
    sib4 r8 sib
    sib[sib sib sib]
    sib4 r

    %227
    r8 sol'\f[fa re]
    mib mib sib'4\mbreak
    r8 sol\f[fa re]

    %230
    mib[mib sib' sib]
    mib,[sol mib lab]
    fa\tr mib r sol16 lab

    %233
    sib4\tr do8 mib,
    re\tr mib r mib\p\mbreak
    mib[mib mib mib]

    %236
    mib4 r
    r8 mib[mib mib]
    mib4 r

    %239
    r8 mib[mib mib]
    re[re sol sol]\mbreak
    do,[do fa fa]

    %242
    sib,[sib' sol mib]
    lab[lab lab lab]
    sol[sol do do]

    %245
    fa,[fa sib sib]
    mib,4 r
    r r8 sib'\mbreak

    %248
    sib[sib sib sib]
    sib4 r8 sib
    sib[sib sib sib]

    %251
    sib4 r
    R2*2
    r8 mib,\f[mib mib]

    %255
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]
    mib fa16 sol lab sib do re

    %258
    mib16 mib sib sib sol sol mib mib
    mib8[mib mib sol]
    lab[lab, sib sib]

    %261
    do[do do do]
    sib4 r
    R2*20\mbreak %% fine p. 2

    %283
    mib8\f[mib mib mib]
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]

    %286
    mib fa16 sol lab sib do re\mbreak
    mib8[mib, mib mib]
    re[re re re]

    %289
    sol[sol fa fa]
    fa[fa fa fa]
    mib[mib fa fa]\mbreak

    %292
    fa[re mib mib]
    r do'[fa, fa]
    sol[lab sib do]

    %295
    sib[lab sib sol]
    do[sib lab sib]\mbreak
    do[sib do la]

    %298
    sib4 r8 sib
    sib mib, fa16(mib re8)
    sib sib fa'16(mib re8)

    %301
    sib[sib' lab lab]
    sol[fa mib fa]
    mib fa4 re8

    %304
    mib4 r8 do\p
    sib[lab sib sol]
    do[sib lab\f sib]\mbreak

    %307
    do[sib do la]
    sib4 r8 sib
    sib sib fa'16(mib re8)

    %310
    sib sib fa'16(mib re8)
    sib[sib lab lab]\mbreak
    sol[mib' sib re]

    %313
    mib fa4 re8
    mib4 r
    lab\staccatissimo sib\staccatissimo

    %316
    mib,4 r
    lab\staccatissimo sib\staccatissimo
    mib, r

}

IIIcbn = \relative do {

    r8
    r mib[re sib]
    mib lab sol4
    r8 mib[re sib]

    %4
    mib lab sol mib16 fa
    sol8[mib lab fa]
    sib do r sol16 lab

    %7
    sib4\tr do8 mib,\mbreak
    re\tr mib r mib
    mib[mib mib mib]

    %10
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]
    mib fa16 sol lab sib do re

    %13
    mib8[mib, mib mib]
    re[re re re]
    do[do do do]\mbreak

    %16
    sib sib16 do re mib fa sol
    lab8[sol fa mib]
    re sib mib sol

    %19
    fa[lab sib sib,]
    mib[fa sol lab]
    sol[fa sol mib]

    %22
    lab[sib do sib]
    la[sol la fa]\mbreak
    sib4 r8 sib,

    %25
    mib16(fa sol8) re sib
    mib16(fa sol8) re sib
    mib[sib fa' sib,]

    %28
    sol'[sib do re]
    mib[sol, lab sib]
    mib,[fa sol\p lab]

    %31
    sol[fa sol mib]\mbreak
    lab[sib do\f sib]
    la[sol la fa]

    %34
    sib4 r8 sib,
    mib16(fa sol8) re sib
    mib16(fa sol8) re sib

    %37
    mib[sib fa' sib,]
    sol'[lab sol fa]
    mib[sol lab sib]

    %40
    mib,4 r\mbreak
    lab\staccatissimo sib\staccatissimo
    mib, r

    %43
    lab\staccatissimo sib\staccatissimo
    mib, r
    R2*45

    %90
    r8 sib\f [la fa]
    sib mib re4
    r8 sib[la fa]\mbreak

    %93
    sib mib re sib16 do
    re8[sib mib do]
    fa sol r re16 mib

    %96
    fa4\tr sol8 sib,
    la\tr sib r sib
    sib[sib sib sib]

    %99
    sib do16 re mib fa sol la?\mbreak
    sib8[sib, sib sib]
    sib do16 re mib fa sol la

    %102
    sib8[sib, sib sib]
    la[la la la]
    sol[sol sol sol]

    %105
    fa fa16 sol la sib do re
    mib8[re do sib]\mbreak
    la[fa sib re]

    %108
    do[mib fa fa,]
    sib[do re mib]
    re[do re sib]

    %111
    mib[fa sol fa]
    mi[re mi do]
    fa4 r8 fa,

    %114
    sib16(do re8) la fa
    sib16(do re8) la fa
    sib[fa do' fa,]

    %117
    re'[fa sol la]
    sib[re, mib fa]
    sol4 r8 la

    %120
    sib[re, mib fa]
    sib,4 r
    R2*57

    %179
    r8 do'\f [sol mib]
    do[re mib do]

    %181
    fa[sol lab fa]
    sib,[do re sib]
    mib[fa sol mib]

    %184
    lab,[sib do lab]
    re[mib fa re]
    sol,[la si sol]\mbreak

    %187
    do[re mib fa]
    mib[re mib do]
    fa[sol lab sol]

    %190
    fa[mib fa re]
    sol4 r8 sol,
    do16 (re mib8) si sol

    %193
    do16 (re mib8) si sol
    do[sol re' sol,]\mbreak
    mib'[sol lab fa]

    %196
    sol[fa sol sol,]
    do16\p (re mib8) si sol
    do16 (re mib8) si sol

    %199
    do\f[sol re' sol,]
    mib'4 r8 mib
    fa4 sol

    %202
    do, r
    R2*24

    %227
    r8 mib\f[re sib]
    mib lab sol4\mbreak
    r8 mib[re sib]

    %230
    mib lab sol mib16 fa
    sol8[mib lab fa]
    sib do r sol16 lab

    %233
    sib4\tr do8 mib,
    re\tr mib r4
    R2*19
    r8 mib\f [mib mib]

    %255
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]
    mib fa16 sol lab sib do re

    %258
    mib8[sib sol mib]
    lab[lab sol sol]\mbreak
    fa[fa mib mib]

    %261
    lab,[lab la la]
    sib4\p r
    R2*20

    %283
    r8 mib\f [mib mib]
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]

    %286
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]\mbreak
    re[re re re]

    %289
    do[do do do]
    sib sib16 do re mib fa sol
    lab8[sol fa mib]

    %292
    re sib mib sol
    fa[lab sib sib,]
    mib[fa sol lab]

    %295
    sol[fa sol mib]
    lab[sib do sib]
    la[sol la fa]\mbreak

    %298
    sib4 r8 sib,
    mib16(fa sol8) re sib
    mib16(fa sol8) re sib

    %301
    mib[sib fa' sib,]
    sol'[sib do re]
    mib[sol, lab sib]

    %304
    mib,\p[fa sol lab]
    sol[fa sol mib]\mbreak
    lab[sib do\f sib]

    %307
    la[sol la fa]
    sib4 r8 sib,
    mib16(fa sol8) re sib

    %310
    mib16(fa sol8) re sib
    mib[sib fa' sib,]
    sol'[lab sol fa]

    %313
    mib[sol lab sib]
    mib,4 r\mbreak
    lab\staccatissimo sib\staccatissimo

    %316
    mib, r
    lab\staccatissimo sib\staccatissimo
    mib, r

}

IIIbcn = \relative do {

    r8
    r mib[re sib]
    mib lab sol4
    r8 mib[re sib]

    %4
    mib lab sol mib16 fa
    sol8[mib lab fa]
    sib do r sol16 lab

    %7
    sib4\tr do8 mib,\mbreak
    re\tr mib r mib
    mib[mib mib mib]

    %10
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]
    mib fa16 sol lab sib do re

    %13
    mib8[mib, mib mib]
    re[re re re]
    do[do do do]\mbreak

    %16
    sib sib16 do re mib fa sol
    lab8[sol fa mib]
    re sib mib sol

    %19
    fa[lab sib sib,]
    mib[fa sol lab]
    sol[fa sol mib]

    %22
    lab[sib do sib]
    la[sol la fa]\mbreak
    sib4 r8 sib,

    %25
    mib16(fa sol8) re sib
    mib16(fa sol8) re sib
    mib[sib fa' sib,]

    %28
    sol'[sib do re]
    mib[sol, lab sib]
    mib,[fa sol\p lab]

    %31
    sol[fa sol mib]\mbreak
    lab[sib do\f sib]
    la[sol la fa]

    %34
    sib4 r8 sib,
    mib16(fa sol8) re sib
    mib16(fa sol8) re sib

    %37
    mib[sib fa' sib,]
    sol'[lab sol fa]
    mib[sol lab sib]

    %40
    mib,4 r\mbreak
    lab\staccatissimo sib\staccatissimo
    mib, r

    %43
    lab\staccatissimo sib\staccatissimo
    mib, r
    R2*2

    %47
    r8 mib\p[mib fa]
    sol mib r4
    r8 mib[mib fa]

    %50
    sol[mib mib fa]
    sol mib r4\mbreak
    R2*3

    %55
    r8 mib[sol mib]
    lab[sol fa mib]
    re[sib do re]

    %58
    mib[fa sol la]
    sib sib, r4
    R2*3

    %63
    r8 sib16\p do re8 mib
    fa[mib re sib]\mbreak
    mib[mib, mib' re]

    %66
    do[la' sib mib,]
    fa[fa' do la]
    fa4 r8 fa

    %69
    fa[fa fa fa]
    fa4 r8 fa
    fa[fa fa fa]

    %72
    fa4 r8 sol
    la[la sib sib]\mbreak
    la[la sib sib]

    %75
    la[re sol, do]
    fa,[fa sib sib]
    la?[re sol, do]

    %78
    fa,4 r
    si,2(
    do4) r

    %81
    la2(
    sib4) r
    sol2(\mbreak

    %84
    fa8)[fa' la fa]
    sib[la sol do]
    fa,[mib re sib]

    %87
    mib[re do fa]
    sib,[do re mib]
    fa4 fa,

    %90
    sib8[sib\f la fa]
    sib mib re4
    r8 sib[la fa]\mbreak

    %93
    sib mib re sib16 do
    re8[sib mib do]
    fa sol r re16 mib

    %96
    fa4\tr sol8 sib,
    la\tr sib r sib
    sib[sib sib sib]

    %99
    sib do16 re mib fa sol la?\mbreak
    sib8[sib, sib sib]
    sib do16 re mib fa sol la

    %102
    sib8[sib, sib sib]
    la[la la la]
    sol[sol sol sol]

    %105
    fa fa16 sol la sib do re
    mib8[re do sib]\mbreak
    la[fa sib re]

    %108
    do[mib fa fa,]
    sib[do re mib]
    re[do re sib]

    %111
    mib[fa sol fa]
    mi[re mi do]
    fa4 r8 fa,

    %114
    sib16(do re8) la fa
    sib16(do re8) la fa
    sib[fa do' fa,]

    %117
    re'[fa sol la]
    sib[re, mib fa]
    sol4 r8 la

    %120
    sib[re, mib fa]
    sib,4 r
    R2*2

    %124
    r8 sib'\p[sol mib]\mbreak %% fine p. 1
    re sib r4
    r8 sib'[sol mib]

    %127
    re[sib' sol mib]
    re4 sib16 do re mib
    fa8[mib re sib]

    %130
    mib[re do sib]
    lab[lab la la]
    sib sib' sib16 lab! sol fa\mbreak

    %133
    mib4 r
    R2
    r8 mib[mib fa]

    %136
    sol mib r4
    r8 mib[mib fa]
    sol[mib mib fa]

    %139
    sol mib r4
    r8 sib[sib' lab]
    sol lab16 sib do8 sib\mbreak

    %142
    lab[sol lab fa]
    mi[re mi do]
    fa4 r

    %145
    r8 fa[lab fa]
    sib[sib, sib' lab]
    sol[fa sol mib]

    %148
    re[do re sib]
    mib,[mib' sol mib]
    re[do re sib]

    %151
    mib4 r\mbreak
    R2*7
    sol4\p r

    %160
    sol8 r sol r
    do,4 r
    do8 r do r

    %163
    fa4 r
    fa8 r fa r
    sib,4 r

    %166
    sib8 r sib r
    mib4 r\mbreak
    mib8[mib mib mib]

    %169
    sib'4 r
    sib8[sib si si]
    do4 r

    %172
    do,8[do do do]
    sol'4 r
    sol,8 [sol sol sol]

    %175
    do4 r8 do
    fa[fa fa fa]
    mib[re mib fa]\mbreak

    %178
    sol[fa sol sol,]
    do\f[do' sol mib]
    do[re mib do]

    %181
    fa[sol lab fa]
    sib,[do re sib]
    mib[fa sol mib]

    %184
    lab,[sib do lab]
    re[mib fa re]
    sol,[la si sol]\mbreak

    %187
    do[re mib fa]
    mib[re mib do]
    fa[sol lab sol]

    %190
    fa[mib fa re]
    sol4 r8 sol,
    do16 (re mib8) si sol

    %193
    do16 (re mib8) si sol
    do[sol re' sol,]\mbreak
    mib'[sol lab fa]

    %196
    sol[fa sol sol,]
    do16\p (re mib8) si sol
    do16 (re mib8) si sol

    %199
    do\f[sol re' sol,]
    mib'4 r8 mib
    fa4 sol

    %202
    do, r
    R2*3\mbreak
    r8 do\p[mib do]

    %207
    sol'[sol si sol]
    do[do, mib do]
    sol'[sol fa fa]

    %210
    mib[mib mib mib]
    fa[fa fa fa]
    re[re re re]

    %213
    mib4 r
    R2*3
    r8 mib[sol mib]\mbreak

    %218
    lab[sol fa mib]
    re[sib do re]
    mib[fa sol la]

    %221
    sib4 sib
    lab! lab
    sol sol

    %224
    mib mib
    re re
    sib sib

    %227
    r8 mib\f[re sib]
    mib lab sol4\mbreak
    r8 mib[re sib]

    %230
    mib lab sol mib16 fa
    sol8[mib lab fa]
    sib do r sol16 lab

    %233
    sib4\tr do8 mib,
    re\tr mib r4
    R2*11

    %246
    r8 mib\p [sol mib]
    sib'2~
    sib~

    %249
    sib~
    sib
    sib8[sib, mib sib]

    %252
    mib[sol lab fa]
    sib[lab sib sib,]
    mib\f[mib mib mib]

    %255
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]
    mib fa16 sol lab sib do re

    %258
    mib8[sib sol mib]
    lab[lab sol sol]\mbreak
    fa[fa mib mib]

    %261
    lab,[lab la la]
    sib4\p r
    mib r

    %264
    sib r
    mib r8 mib
    lab[lab lab lab]

    %267
    sol4 r8 sol
    lab[lab lab lab]
    sol4 r8 sol

    %270
    lab[lab lab lab]\mbreak
    lab[lab lab lab]
    sol[sol lab sib]

    %273
    do[sol lab sib]
    do[sol lab sib]
    mib,4 r

    %276
    R2*2\mbreak  %% fine p. 2
    r4 r8 sib'\fp
    mib,[fa sol lab]

    %280
    sib[lab sib sib,]
    do4 r8 re
    mib[sol lab sib]

    %283
    mib,\f[mib mib mib]
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]

    %286
    mib fa16 sol lab sib do re
    mib8[mib, mib mib]\mbreak
    re[re re re]

    %289
    do[do do do]
    sib sib16 do re mib fa sol
    lab8[sol fa mib]

    %292
    re sib mib sol
    fa[lab sib sib,]
    mib[fa sol lab]

    %295
    sol[fa sol mib]
    lab[sib do sib]
    la[sol la fa]\mbreak

    %298
    sib4 r8 sib,
    mib16(fa sol8) re sib
    mib16(fa sol8) re sib

    %301
    mib[sib fa' sib,]
    sol'[sib do re]
    mib[sol, lab sib]

    %304
    mib,\p[fa sol lab]
    sol[fa sol mib]\mbreak
    lab[sib do\f sib]

    %307
    la[sol la fa]
    sib4 r8 sib,
    mib16(fa sol8) re sib

    %310
    mib16(fa sol8) re sib
    mib[sib fa' sib,]
    sol'[lab sol fa]

    %313
    mib[sol lab sib]
    mib,4 r\mbreak
    lab\staccatissimo sib\staccatissimo

    %316
    mib, r
    lab\staccatissimo sib\staccatissimo
    mib, r

}

IIIbfn = \figuremode {
    \bassFigureExtendersOff
    \bassFigureStaffAlignmentUp



}

forma = {
    \key mib\major
    \time 2/4
    \tempo 2 = 65
    \partial 8 s8
    s2*318
    \bar "|."

}

IIIfl = {
    \IIIglobal
    %\notypeset
    <<\IIIfln \forma>>

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

IIIcb = {
    \IIIglobal
    \clef bass
    <<\IIIcbn \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 16.7)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

    \header {
        title = \markup\smaller{Concerto per Flauto Traverso QV 5:89}
        composer = \markup \center-column{"J. J. Quantz (1697-1773)"}

    }

    \markup\huge "[1.] Allegro Spiritoso"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Flauto""Traverso"}
                    \set Staff.midiInstrument = #"flute"
                    \Ifl
                >>

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Basso""Ripieno"}
                \set Staff.midiInstrument = #"contrabass"
                \Icb
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Basso""Continuo"}
                \set Staff.midiInstrument = #"cello"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.5\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

    \markup\huge "[2.] Affettuoso"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \IIfl
                >>

            \new PianoStaff
            <<
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
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \IIcb
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

    \markup\huge "[3.] Vivace"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

                \new Staff
                <<
                    \set Staff.midiInstrument = #"flute"
                    \IIIfl
                >>

            \new PianoStaff
            <<
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
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"contrabass"
                \IIIcb
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1\cm

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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
