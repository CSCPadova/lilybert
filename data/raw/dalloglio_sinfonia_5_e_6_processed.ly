\language "italiano"
%********************************** VARIABILI

\version "2.24.0"

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
#(let ((m (make-articulation 'stopped)))
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
        \musicglyph "scripts.turn"
        \musicglyph "scripts.prall"
    }
}


mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto
}

IvlIn = \relative do'' {

    fa4 sib sol\tr
    fa sib,16(do re mib) fa4~
    fa sib sol\tr

    %4
    fa sib,16 (do re mib) fa4~
    fa sib sol\tr
    fa8 sol16 la \grace la8 sib4. r16 fa

    %7
    mib8 la16 sib \grace sib8 do4. r16 mib,
    re8. fa16 mib4 re\mbreak
    do4 la' la

    %10
    la\tr~\tuplet 3/2 { la8 (sol fa) mi (re do) }
    do\tr sib sol'4 sol
    sol\tr~\tuplet 3/2 { sol8(fa mi) re(do sib) }

    %13
    sib\tr la la'4\p la
    la\tr~\tuplet 3/2 { la8(sol fa) mi(re do)}
    do\tr sib sol'4 sol

    %16
    sol\tr~\tuplet 3/2 { sol8(fa mi) re(do sib) }
    sib\tr la  fa'4\f fa
    fa\tr mi4. fa16 sol

    %19
    la4 la la\mbreak
    la\tr sol4. la16 sib
    do4 do do

    %22
    re4. sol,8 sib re
    do4. fa,8 la do
    sib4. mi,8 sol sib

    %25
    la4 la8 sib do4~
    do sib la
    sol8 do sol la la4\tr

    %28
    sol8 do sol la la4\tr
    sib4. la16 sol la4~
    la8. sib16 la4 sol\tr

    %31
    fa mib!\p mib
    mib8\tr(re) re2
    sib16(do re mib) fa4 re\mbreak

    %34
    re8\tr(do) do2
    sib4\f la sol8 fa
    \grace fa mi2\tr fa4

    %37
    sib8(sol) la(fa) sol(mi)
    fa4 fa' re\tr
    do fa,16(sol la sib) do4~

    %40
    do fa re\tr
    do fa,16(sol la sib) do4~
    do8 mib? re do la' sol

    %43
    fad(la) sol(sib) la4~
    la8 sol fad mib re do
    sib4 re' re\mbreak

    %46
    re4 do8 sib do4~
    do8 la16 sib do4 do
    do sib8 la sib4~

    %49
    sib8 sol16 la sib4 sib
    sib la8 sol la4~
    la8 fad16 sol la4 la

    %52
    la sol8 fad sol4~
    sol8 la do sib la sol
    fad re sol4 sol

    %55
    sol8\tr fad16(sol) la4 la
    la8\tr sol sib4 sib
    sib8\tr la16(sib) do4 do\mbreak

    %58
    sib8(re) fad,(la) sol4~
    sol8(do) sib4 la\tr
    sol sib re,

    %61
    dod8 sib' la sol fa mi
    fa la, re4 re
    re\tr dod4. re16 mi

    %64
    fa4 fa fa
    fa\tr mi4. fa16 sol
    la4 la la

    %67
    la\tr sol2~
    sol4 fa2~
    fa4 mi2~

    %70
    mi4 re2~
    re8 sib' sol fa mi re\mbreak
    dod mi4 sold8(la) dod,

    %73
    re fa4 sold8(la) re,
    dod mi4\p sold8 (la) do,
    re fa4 sold8(la) re,

    %76
    dod4\tr r r
    r re4\f la
    mi'2.~

    %79
    mi4 re la
    sol'2.~
    sol4 fa la,

    %82
    sib'2.~
    sib4 la sol
    fa2.

    %85
    fa4\tr fa\tr fa\tr \mbreak
    mi la8 dod, re4~
    re8. mi16 re4 dod\tr

    %88
    re fa, mi\tr
    re r sib'16(do re mib!)
    fa4 sib sol\tr

    %91
    fa sib,16(do re mib) fa4~
    fa sib sol\tr
    fa sib,16(do re mib) fa4~

    %94
    fa8 sol mib(do) re(sib)
    do4 fa\p re\tr
    do fa re\tr

    %97
    do fa\f sib,
    lab'2.~
    lab4 lab? lab\mbreak

    %100
    lab? sol8 fa sol4~
    sol8 do, mi fa sol la!
    sib2.~

    %103
    sib4 sib sib
    sib la8 sol la4
    sol4. do8 \grace sib la sol

    %106
    fa4. sib8 \grace la sol fa
    mib2.~
    \tuplet 3/2 { mib8(fa sol) } fa4 mib

    %109
    re8 fa mib re do sib
    sol' fa mib re do sib
    la fa' la,4 sib

    %112
    do8(fa) \grace mib reb2\tr
    do8 fa la,4\p sib\mbreak
    do8(fa) \grace mib reb2\tr

    %115
    do8 fa re!4\f  mib
    fa8 sib \grace la sol2\tr
    fa8 sib re,4\p  mib

    %118
    fa8 sib\grace la sol2\tr
    fa4 \tuplet 3/2 { fa8\f(mib re) re(do sib) }
    sol'4 \tuplet 3/2 { sol8(fa mib) mib(re do) }

    %121
    la'4 \tuplet 3/2 { la8(sol fa) fa(mib re) }
    sib'4 \tuplet 3/2 { sib8(la sol) sol(fa mib) }
    do'4\tuplet 3/2 { do8(sib la) la(sol fa) }

    %124
    re'4 do sib~
    sib \tuplet 3/2 { sib8(la sol) sol(fa mi) }\mbreak
    \grace mi?8 fa2 sib,4~

    %127
    sib \tuplet 3/2 { sib8(la sol) sol(fa mib?) }
    fa4 la8 sib do re
    mib2.\tr

    %130
    re4 do sib
    \tuplet 3/2 { sol'8(fa mib) } re4 do\tr
    sib lab\p lab

    %133
    lab?8\tr(sol) sol2
    mib16(fa sol la?) sib4 sol
    sol8\tr(fa) fa2

    %136
    mib4\f re do8 sib
    \grace sib la2\tr sib4
    mib8(do) re(sib) do(la)

    %139
    sib4 re fa
    sib mib, fa
    sib,2\fermata r4

}

IvlIIn = \relative do'' {

    re4 re mib
    re re16(do sib do) re4~
    re re mib

    %4
    re re16(do sib do) re4~
    re re mib
    re \tuplet 3/2 { re8(do sib) } re4

    %7
    do \tuplet 3/2 { do8(sib la) } do4
    sib8. re16 do4 sib\mbreak
    la4 la' la

    %10
    la\tr~\tuplet 3/2 { la8(sol fa) mi(re do) }
    do\tr sib sol'4 sol
    sol\tr~\tuplet 3/2 { sol8 (fa mi) re(do sib) }

    %13
    sib\tr la la'4\p la
    la\tr~\tuplet 3/2 { la8(sol fa) mi(re do) }
    do\tr sib sol'4 sol

    %16
    sol\tr~\tuplet 3/2 { sol8 (fa mi) re(do sib) }
    sib\tr la r4 r\mbreak
    r sol'\f sol

    %19
    sol\tr fa4. sol16 la
    sib4 sib sib
    sib la la~

    %22
    la sol8 fa sol4~
    sol fa8 mi fa4~
    fa mi8 re mi4

    %25
    fa fa8 sol la4~
    la sol fa
    mi8 sol mi fa fa4\tr

    %28
    mi8 sol mi fa fa4\tr
    sol4. fa16 mi fa4~
    fa8. sol16 fa4 mi\tr \mbreak

    %31
    fa do\p do
    do8\tr(sib) sib2
    sib16(la sib do) re4 sib

    %34
    sib8\tr (la) la2
    sib4\f la sol8 fa
    \grace fa mi2\tr fa4

    %37
    sib8(sol) la(fa) sol(mi)
    fa4 la sib\tr
    la la16(sol fa sol) la4

    %40
    la la sib\tr
    la la16(sol fa sol) la4
    la la do

    %43
    do r do
    do8 mib re do sib la
    sib4 sol' fa

    %46
    mib2.~
    mib8 do16 re mib4 mib
    re2.~

    %49
    re8 sib16 do re4 re
    do2.~
    do8 la16 sib do4 do

    %52
    sib2.
    mib4 mib8 re do sib
    la4 r r

    %55
    R2.\mbreak
    r8 re sol4 sol
    sol8\tr fad16 (sol) la4 la

    %58
    sol do, sib
    la sol fad\tr
    sol r r

    %61
    r mi' dod
    re r r
    r mi mi

    %64
    mi?\tr re4. mi16 fa
    sol4 sol sol
    sol\tr fa4. sol16 la

    %67
    sib4. sib8 sol sib
    la4. do,8 fa la\mbreak
    sol4. sol8 mi sol

    %70
    fa4. la,8 re fa
    sib,4. re,8 sol sib
    mi,4 dod' mi,

    %73
    fa re' fa,
    mi dod'\p mi,
    fa re' fa,

    %76
    mi dod'\f la
    re2.~
    re4 dod la

    %79
    fa'2.~
    fa4 mi la,
    la'2.~

    %82
    la4 sol mi
    dod2 mi4~\mbreak
    mi re8 dod  re4

    %85
    re4\tr re\tr re\tr
    dod la la
    \tuplet 3/2 { sib8(la sol) } fa4 mi\tr

    %88
    fa re dod\tr
    re4 r r
    re' re mib

    %91
    re re16 (do sib do) re4~
    re re mib
    re re16 (do sib do) re4~

    %94
    re do8 la sib4
    la la\p sib\tr\mbreak
    la la sib\tr

    %97
    la r r
    r re8\f mib fa mib
    re4 fa fa

    %100
    fa mib8 re mib4
    R2.
    r4 mi8 fa sol fa

    %103
    mi4 sol sol
    sol fa8 mi fa4
    sib, do2

    %106
    la4 sib2
    sol4 sol2
    fa4 la8 sib do4~

    %109
    do sib8 do re4~
    re do sol\mbreak
    la fa sol

    %112
    la sib8 la sib4
    la fa\p sol
    la sib8 la sib4

    %115
    la sib\f do
    re mib8 re mib4
    re sib\p do

    %118
    re mib8 re mib4
    re sib\f sib
    sib do2~

    %121
    do4 re2~
    re4 mib2~
    mib4 fa2~

    %124
    fa4 fa fa
    fa(mi) sib
    sib(la) fa

    %127
    fa(mi) sib\mbreak
    sib(la) r
    r la'8 sib do la

    %130
    sib4 do re
    do sib la
    sib fa\p fa

    %133
    fa8\tr (mib) mib2
    mib16(re mib fa) sol4 mib
    mib8\tr(re) re2

    %136
    mib4\f re do8 sib
    \grace sib la2\tr sib4
    mib8(do) re(sib) do(la)

    %139
    sib4 re fa
    sib mib, fa
    sib,2\fermata r4

}

Ivlan = \relative do' {

    sib4 sib sib
    sib4 sib sib
    sib4 sib sib

    %4
    sib4 sib sib
    sib4 sib sib
    sib fa' fa

    %7
    fa fa fa
    fa sol sol
    la do do\mbreak

    %10
    do do la
    re, sib' sib
    sib sib sol

    %13
    do, do'\p do
    do do la
    re, sib' sib

    %16
    sib sib sol
    do, r la'\f
    sol do do

    %19
    do do la
    re, re sol
    sol fa fa

    %22
    fa mi mi
    mi? re re\mbreak
    re do do

    %25
    do fa fa
    fa re re
    mi do do

    %28
    do do' do,
    do do do
    re do do

    %31
    do fa\p fa
    fa fa fa
    fa fa fa

    %34
    fa fa, fa'
    fa\f fa re
    sol, sol do

    %37
    re do do\mbreak
    do fa fa
    fa fa fa

    %40
    fa fa fa
    fa fa fa
    sol sol mib

    %43
    la, r fad'
    fad? la re,
    re re sol

    %46
    sol sol sol
    fa? fa fa
    fa fa fa

    %49
    mib mib mib
    mib mib mib
    re re re\mbreak

    %52
    re re re
    do do mib
    la, re sib

    %55
    la re fad
    sol sol re'
    re la fad

    %58
    sol la sib
    mib, re re
    re r sol

    %61
    mi dod mi
    re la' fa?
    mi la la

    %64
    la2  la4
    sol do do\mbreak
    do2 do4

    %67
    fa, sol mi
    do do do
    re mi dod

    %70
    la la la
    sib sib sib
    la la' la,

    %73
    la la' la,
    la la'\p la,
    la la' la,

    %76
    la2.\f~
    la~
    la~

    %79
    la~
    la~
    la~

    %82
    la~
    la\mbreak
    re4 re do

    %85
    sib la sold
    la sol! fa
    sol la la

    %88
    la la la
    la r r
    sib sib sib

    %91
    sib sib sib
    sib sib sib
    sib sib sib

    %94
    sib fa' sib
    fa fa\p fa
    fa fa, fa

    %97
    fa r r\mbreak
    r fa'\f fa
    fa re sib'

    %100
    sib2 r4
    R2.
    r4 sol sol

    %103
    sol mi do'
    do2 do,4
    re mib! mib

    %106
    do re re
    sib do do
    do do fa

    %109
    fa fa fa
    sol sol sol
    do, fa mi

    %112
    fa fa fa\mbreak
    fa fa\p mi
    fa fa fa

    %115
    fa sib\f la
    sib sib sib
    sib sib\p la

    %118
    sib sib sib
    sib fa\f fa
    sib, sol' sol

    %121
    do, la' la
    re, sib' sib
    mib, do' do

    %124
    fa, sib re
    re sol, do
    do2 re,4

    %127
    re sol, do\mbreak
    do do8 sib la sib
    do4 do fa

    %130
    fa fa fa
    sol fa fa
    fa sib,\p sib

    %133
    sib sib sib
    sib sib sib
    sib sib sib

    %136
    sib\f sib sol'
    do, do fa
    sol fa fa

    %139
    fa re fa
    sib mib, fa
    sib,2\fermata r4

}


Ibcn = \relative do {

    sib4 sib sib
    sib sib sib
    sib sib sib

    %4
    sib sib sib
    sib sib sib
    sib re sib

    %7
    fa' la fa
    sib mib, mi
    fa fa8 sol la sol

    %10
    fa4 fa fa
    sol sol fa
    mi mi mi\mbreak

    %13
    fa fa8\p sol la sol
    fa4 fa fa
    sol sol fa

    %16
    mi mi mi
    fa la\f fa
    do do do

    %19
    fa fa fa
    sol sol sol
    la la la

    %22
    sib mi, mi
    la re, re
    sol do, do

    %25
    fa fa fa
    sib, sib si
    do do' do,

    %28
    do do' do,\mbreak
    do do fa
    sib, do do

    %31
    fa la\p fa
    sib sib,8 do re do
    sib4 sib sib

    %34
    fa' fa,8 sol la fa
    sib4\f sib sib
    do do8 sib la4

    %37
    sib do do,
    fa fa' fa
    fa fa fa

    %40
    fa fa fa
    fa fa fa
    mib mib mib

    %43
    re re re\mbreak
    fad fad fad
    sol8 la sib la sib sol

    %46
    do, re mib re mib do
    fa sol la sol la fa
    sib, do re do re sib

    %49
    mib fa sol fa sol mib
    la, sib do sib do la
    re mi fad mi fad re

    %52
    sol, la sib la sib sol\mbreak
    do4 do do
    re sib sol

    %55
    la fad' re
    sol sol sol
    re' re, re

    %58
    sol la, sib
    do re re
    sol, sol' sib

    %61
    la la, la
    re fa re
    la la la

    %64
    re re re
    do do do
    fa fa fa\mbreak

    %67
    re mi do
    fa la fa
    si, dod la

    %70
    re fa re
    sol, sol sol
    la la' la,

    %73
    la la' la,
    la la'\p la,
    la la' la,

    %76
    la2.^\tasto\f~
    la~
    la~

    %79
    la~
    la~
    la~

    %82
    la~
    la\mbreak %% fine pagina
    re4 re do

    %85
    sib la sold
    la sol! fa
    sol la la

    %88
    re la la
    re, r r
    sib' sib sib

    %91
    sib sib sib
    sib sib sib
    sib sib sib

    %94
    sib fa' sib
    fa fa\p fa
    fa fa, fa

    %97
    fa r r
    r sib8\f do re do\mbreak
    sib4 sib sib

    %100
    mib mib, r
    R2.
    r4 do'8 re mi re

    %103
    do4 do do
    fa fa, fa'~
    fa mib!8 re mib4~

    %106
    mib re8 do re4~
    re do sib
    la la la

    %109
    sib sib sib
    mib mib mib
    fa fa fa,

    %112
    fa fa' fa,\mbreak
    fa fa'\p fa,
    fa fa' fa,

    %115
    fa sib\f sib
    sib sib' sib,
    sib sib'\p sib,

    %118
    sib sib' sib,
    sib re\f re
    mib mib, mib'

    %121
    fa fa, fa'
    sol sol, sol'
    la la, la'

    %124
    sib sib, sib'
    sol sol sol
    fa fa fa,

    %127
    sol sol sol\mbreak
    fa fa r
    r fa' fa

    %130
    sib sib, sib
    mib fa fa,
    sib re\p sib

    %133
    mib mib8 fa sol fa
    mib4 mib mib
    sib' sib,8 do re sib

    %136
    mib4\f mib mib
    fa fa8 mib re4
    mib fa fa,

    %139
    sib re fa
    sib mib, fa
    sib,2\fermata r4

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6 4>4
    <3>2.
    s2 <6 4>4
    <3>2.
    s2 <6 4>4
    <3>2.
    <7>
    s4 <6> <7 5/>
    s2.
    s
    <4>4 <3> <6 4 2>
    <5/>2.
    <4>4 <3>2
    s2.
    <4>4 <3> <6 4 2>
    <5/>2.
    <4>8 <3> <6>2
    <4>4 <3!>2
    <9>4 <8>2
    <9>4 <8>2
    <9 7>4 <8 6> s
    <7> <7> s
    <7> <7> s
    <7> <7 _!> s
    s2.
    <9 7>4 <8 6> <7 5/>
    <_!> s <6 4>
    <5 3!> s <6 4>
    <7> <6> s
    <7 5> <6 4> <5 3!>
    s <6 5/> s
    <9 4> <8 3> s
    s2.
    <6 4>4 <8 3> s
    s2 <6>8 <5>
    <4>4 <_!> <6>
    <6 5> <6 4> <3!>
    s s <6 4>
    <5 3>2.
    s2 <6 4>4
    <3>2.
    <6 4 3>
    <7 _+>
    <6 5>
    s4 <6> s
    <9>4 <6> s
    <7> <6 5> s
    <9> <6> s
    <7> <6 5> s
    <9> <6> s
    <7 _+>4 <6> s
    <9>4 <6> s
    <6 5>2.
    <_+>4 <6> s
    <7>8 <6+> <6>4 s
    <9> <8> s
    <6 4> <7 3+> s
    s <6\+> <6>
    <6 5> <6 4> <3+>
    s2 <6>4
    <_+> <7> s
    s <6> s
    <5! 4>4 <3+> s
    <9> <8> s
    <4> <3!> s
    <9> <8> s
    <6 5> <5/> s
    <9> <6> s
    <6 5!> <5!> s
    <9> <6> s
    <6! 5>2.
    <_+>
    <6 4>
    < 5! 3+>
    <6 4>
    <5 3+>
    s2.*7
    <9>4 <8> <4 2>
    < 5> <6 4> <7/ 5>
    <_+> s <6>
    s <6 4> <3+>
    s <6 4> <5 3+>
    s2.
    s2 <6 4>4
    <5 3>2.
    s2 <6 4>4
    <5 3>2.
    s4 <7> s
    s s <6 4>
    <5 3> s <6 4>
    <5 3>2.
    s4 <7/> s
    s2.
    <4 9>4 <3 8> s
    s2.
    s4 <7/ _!>4 s
    s2.
    <4 9>4 <3 8> s
    <4 2> <6> s
    <4 2> <6> s
    <4 2> <3> <4 2>
    <6 5> s s
    <9> <8> s
    <7> <6> <5>
    s s <7! 4 2>
    <8 5 3> <6 4> s
    <5 3> s <7! 4 2>
    <8 5 3> <6- 4> s
    <5 3> <_!> <7 4 2>
    <8 5 3> <6 4> s
    <5 3> s <7 4 2 >
    <8 5 3> <6 4> s
    <5 3> <6> s
    <5> <6> s
    <5> <6> s
    <5> <6> s
    <5> <6> s
    <5>2.
    <7> 4 <6!> <6! 4 3>
    <8 4> <3> <6 4>
    <7> <6!> <6! 4 3>
    <8 4> <5> s
    s <7-> s
    s2.
    <6 5>4 <6 4> <3>
    s <6 5-> s
    <4- 9> <3 8> s
    s2.
    <6 4>4 <8 3> s
    s2.
    <4>4 <3> <6>
    <6 5> <6 4> <3>
    s <6> s
    s <6 5> <7>

}

forma = {

    \time 3/4
    \key sib\major
    \tempo 2 = 77
    s2.*141
    \bar"|."

}



IvlI = {
    \global
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

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIvlIn = \relative do'' {

    mib,8.-! [mib16 mib8.-! mib16] mib8.-! mib16 mib(sol sib mib)
    fa,8.[fa16 fa8. fa16] fa8. fa16 do(fa sol lab)
    fa8.[fa16 fa8. fa16] fa8. fa16  re(fa sol lab)

    %4
    sol8.[sol16 sol8. sol16] sol8. sol16 mib(sol sib mib)
    sol,8.[sol16 sol8. sol16] sol8. sol16 mib(sol sib sol)
    lab8.[lab16 lab8. lab16] lab8. lab16 lab(do mib do)\mbreak

    %7
    la8.[la16 la8. la16] la8. la16 la(mib' do la)
    sib8.\p[(fa16) sol8. (mib16)] fa8.[(sib16) sol8.(mib16)]
    fa8.[(sib16) sol8.\f(re16)] mib2\tr

    %10
    re1\fermata
    mib8\mp~mib32 (fa sol lab) sib8 mib fa,16(mib') re4 do8~
    do16(sib) fa'(mib) re(do) sib(lab) sol(fa sol fa32 mib) mib4\mbreak

    %13
    sol'8 sol~sol16(sib, sib' sol) fa8 fa~fa16(sib, sib' fa)
    mib8\tr~mib32 (do re mib) re8~re32(sib do re) re8.\tr(fa16) do4
    sib16(la') sol(fa) mi(re) do(sib) \grace sib8 la4. do8

    %16
    sib16(la') sol(fa) mi(re) do(sib) \grace sib8 la4.  sib8
    \terzine \tuplet 3/2 { do16(re mib!) do[(sib la?)] do(re mib) do[(sib la)]\mbreak sib(do re) } sib4 fa8
    \tuplet 3/2 { re'16(mib fa) re[(do sib)] re(mib fa) re[(do sib)]  do(re mib)} do4 fa,8

    %19
    \tuplet 3/2 { mib'16(fa sol) mib[(re do)] mib16(fa sol) mib[(re do)] } re8 sib'4 sol16(mi)
    fa8 mib!4 re16(do) re8 sib'4 sol16(mi)
    fa8 mib!4 re16(do)\tuplet 3/2 { re(do sib) } sol'8\noBeam ~\tuplet 3/2 { sol16  fa(mib re[do sib)]}

    %22
    \tuplet 3/2 { la(sol fa) sib[(mib do)] } do4\tr sib16( fa-. fa-. fa-.) fa8 mib\tr
    re16(fa sib mib) re8 do\tr sib16 (fa-. fa-. fa-.) fa8 mib\tr
    re16 sib' sol mib re8 do\tr \grace do sib2

    %25
    reb'16 fa, fa8\tr reb'16 fa, fa8\tr  reb'16 (mi,) mi8~mi16 fa(sol lab)
    sib(reb) do(sib) lab8 sol\tr lab16(do fa lab) sol(sib) mi,(sol)\mbreak
    fa(reb do sib) lab(fa) sol(mi) \grace mi8 fa2

    %28
    lab'16 do, do8\tr lab'16 do, do8\tr  lab'16(si,) si8~si16(do re mib)
    fa(lab) sol(fa) mib8 re\tr mib16 (sol) \grace sol8 lab~lab16 do,(re mib)
    re(fad) \grace fad8 sol~sol16 si,(do re) do(sib') lab(sol) fad(mib) re(do)

    %31
    si8 sol'4 si,16(re) do(fad) \grace fad8 sol4 do,16(mib)\mbreak
    re(fad) \grace fad8 sol4 re16(fa) mib(sol) fa(lab) sol(lab) fa(re)
    \grace do8 si4 do~do16 lab'(sol fa) mib(do) re(si)

    %34
    \grace si?8 do4. re16 mib sib!8. do32 sol lab8. sib32 fa
    sol4\tr fa~fa16(mib) do'(sib) lab(sol) fa(mib)
    re(mib fa re) \grace do8 sib4 mib8~mib32(fa sol lab) sib8 mib\mbreak

    %37
    fa,16(mib') re4 do8~do16(sib) fa'(mib) re(do) sib(lab)
    sol(fa sol fa32 mib) mib4 sib''16( reb,-. reb-. reb-.) reb4\tr
    lab'16(do,-. do-. do-.) do4\tr do'16(mib,-. mib-. mib-.) mib4

    %40
    sib'16(re,?-. re-. re-.) re4\tr sib16(re fa lab) sol(sib) sol(mib)
    fa(re) do4(sib8) sib16(re fa lab) sol(sib) sol(mib)\mbreak
    fa(re) do4(sib8) mib\tr(mib\tr mib\tr mib\tr )

    %43
    \tuplet 3/2 { mib16(fa sol)} mib8. sib'16 [\grace lab8 sol16 fa]  mib8\tr(mib\tr mib\tr mib\tr )
    \tuplet 3/2 { mib16(fa sol)} mib8. mib'16 [\grace re8 do16 sib] \grace sib8 la4. mib8
    \grace mib re4. do8~do16(sib) fa'(mib) re(do) sib(lab)

    %46
    sol8 mib'4 do8\tr sib16(sol) lab(fa) sol8 fa\tr
    mib16(sib-. sib-. sib-.) sib8 lab\tr sol16(sib mib lab) sol8 fa\tr\mbreak
    mib16(sib-. sib-. sib-.) sib8 lab\tr sol16(sib mib lab) sol8 fa\tr

    %49
    mib16(sol) sol(sib) sib(mib) mib(sol)  sol(mib) mib(sib) sib(sol) sol(mib)
    reb'8.-!\f [reb16 reb8.-! reb16] reb8.-! reb16 mib,(sol sib reb)
    do8.[do16 do8. do16] do8. do16 mib,(lab do re)

    %52
    mib8.[mib16 mib8. mib16] mib8. mib16 fa,(la do mib)\mbreak
    re?8.-![re16 re8.-! re16] re8.-! re16 sib(re fa sol)
    lab8.[lab16 lab8. lab16] lab8. lab16 sib,(re fa lab)

    %55
    solb8\p solb4 solb solb solb8
    solb8 solb4 solb solb solb8
    solb8.[solb16 solb8. solb16] solb8.[solb16 solb8. solb16]

    %58
    fa4\fermata r mib-!\f r
    mib-! r mib\p re\tr
    mib8.[mib16 \f sib8. sib16] sol8.[sol16 mib8. mib16]

    %61
    mib1\fermata

}

IIvlIIn = \relative do'' {

    R1
    mib,8.-! [mib16 mib8.-! mib16] mib8.-! [mib16 mib8.-! mib16]
    mib8. [mib16 mib8. mib16]  re8.[re16 re8. re16]

    %4
    mib8. [mib16 mib8. mib16] mib8. [mib16 mib8. mib16]
    mib8. [mib16 mib8. mib16] mib8. [mib16 mib8. mib16]
    mib8. [mib16 mib8. mib16] mib8. [mib16 mib8. mib16]

    %7
    mib8. [mib16 mib8. mib16] mib8. [mib16 mib8. mib16]\mbreak
    re8.\p[(re16) mib8.(do16)] re8.[(re16) mib8.(do16)]
    re8.[(re16) mib8.\f(re16)] do2\tr

    %10
    sib1\fermata
    sol'8\mp sol sol sol lab lab lab lab
    fa fa fa16(lab) sol(fa) mib4 r

    %13
    r8 sib' mib sol r sib, re fa
    r la, sib sib sib4 la\mbreak
    r8 sib sib la16(sol) fa(sol) la(sol) fa4

    %16
    r8  sib sib la16(sol) fa(sol) la(sol) fa8 sol
    la la fa fa fa fa fa fa
    r fa fa fa r fa fa fa

    %19
    r fa fa fa fa fa sib sib
    la do4 sib16(la) sib8 re sib sib\mbreak
    la8 do4 sib16(la) sib8 sib sib \tuplet 3/2 {
        sib16[(la sol)]
        fa(sol la)
    } sib4 la8 sib16(fa-. fa-. fa-.) fa8 mib\tr

    %23
    re16(fa) sib4 la8 sib16(fa-. fa-. fa-.)  fa8 mib\tr
    re sib4 la8 sib2
    r8 reb fa sib sib sol4 mi16(fa)

    %26
    sol(sib) lab?(sol) fa8 mi fa lab16(do) sib8 sol16(sib)\mbreak
    lab8 fa do16(lab) sib(sol) \grace sol8 lab2
    r8 lab' do fa fa re4 si16(do)

    %29
    re(fa) mib(re) do8(si) do mib,4 lab8
    lab re,4 sol8 sol do,4 fa8
    fa fa fa fa mib mib mib mib

    %32
    si si si si do do'4 lab8
    sol4. sol8 lab lab sol16(mib) fa(re)\mbreak
    \grace re8 mib4 r sol8 sol fa re

    %35
    mib mib re re sol, mib' do do
    sib4 r4 sol'8 sol sol sol
    lab lab lab lab fa4 fa16(lab) sol(fa)

    %38
    mib4 r mib8 sib' sib sib
    sib lab16 sol lab4 fa8 do' do do
    do sib16(la) sib4 re,8 re' mib mib

    %41
    mib re16(do) re4 re,8 re' mib mib\mbreak
    mib re16(do) re8 fa, sol sol sol sol
    sol sol sol sol sol sol sol sol

    %44
    sol sol sol sol fa do' do la
    sib fa fa fa fa fa fa16(lab) sol(fa)
    mib8 sib' do lab sol16(mib) fa(do) mib8 re\tr

    %47
    mib16(sib-. sib-. sib-.) sib8 lab\tr sol16(sib) mib4 re8\mbreak
    mib16(sib-. sib-. sib-.) sib8 lab\tr sol16(sib) mib4 re8
    mib8 mib16(sol) sol(sib) sib(mib) mib(sib) sib(sol) sol(mib) mib(mib)

    %50
    mib8.-!\f[mib16 mib8.-! mib16] mib8.-![mib16 mib8.-! mib16]
    mib8.[mib16 mib8. mib16] mib8.[mib16 mib8. mib16]
    fa8.[fa16 fa8. fa16] fa8.[fa16 fa8. fa16]

    %53
    fa8.[fa16 fa8. fa16] fa8.[fa16 fa8. fa16]\mbreak
    fa'8.[fa16 fa8. fa16] fa8.[fa16 fa8. fa16]
    mib8\p mib4 mib mib mib8

    %56
    mib8 mib4 mib mib mib8
    mib8.[mib16 mib8. mib16] mib8.[mib16 mib8. mib16]
    re4\fermata r mib-!\f r

    %59
    do-! r sol\p fa\tr
    sol8.[sol16\f sol8. sol16] mib8.[mib16 sib8. sib16]
    sol1\fermata

}

IIvlan = \relative do' {

    sol'8.-![sol16 sol8. -! sol16]  sol8.-![sol16 sol8. -! sol16]
    do,8.[do16 do8. do16] do8.[do16 do8. do16]
    sib8.[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]

    %4
    sib8.[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]
    sib8.[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]
    do8.[do16 do8. do16] do8.[do16 do8. do16]\mbreak

    %7
    do8.[do16 do8. do16] do8.[do16 do8. do16]
    sib2\p^\markup\italic "Sostenuto" sib
    sib\f la\tr

    %10
    sib1\fermata
    mib8\mp mib mib mib fa fa fa fa
    sib, sib sib sib mib mib sol sib
    mib, mib mib mib re re re re
    do do sib sib fa' fa, fa fa'\mbreak
    sol sol do, do fa fa16 sol la8 fa
    sol sol do, do fa fa, fa r
    fa' fa mib! mib re re' re re,
    r sib' sib sib, r la' la la,
    r la'? la la, sib  sib' sol sol
    la la fa fa sib sib sol sol\mbreak
    la la fa fa sib mib, mib mib
    mib re16 mib fa8 fa, sib sib' la fa
    sib sol fa fa, sib sib' la fa
    sib sol fa fa, sib2

    %25
    sib8 sib sib sib do do do do
    do do do do fa fa do' do,\mbreak
    fa reb do do, fa2
    fa'8 fa fa fa sol sol sol sol
    sol, sol sol sol do do do do
    sib sib sib sib lab lab lab lab
    sol sol sol sol sol sol sol sol
    sol sol sol sol do lab' mib fa
    sol fa mib do fa re sol sol,\mbreak
    do4 r mib8 mib fa sib,
    mib mib sib sib do do fa, fa
    sib4 r mib8 mib mib mib
    fa fa fa fa sib, sib sib sib
    mib mib sol sib sol sol sol sol
    lab lab lab lab la la la la
    sib sib sib sib sib, sib sib sib\mbreak
    sib sib sib sib sib sib sib sib
    sib sib sib lab sol sol sol sol
    lab lab lab lab  sib sib sib sib
    do do do do fa fa fa fa
    sib, sib sib sib re re re re
    re re lab' lab mib lab, sib sib
    mib, mib' re sib mib do sib sib\mbreak
    mib, mib' re sib mib do sib sib
    mib4 mib mib r

    %50
    sib8.-!\f[sib16 sib8.-! sib16] sib8.-![sib16 sib8.-! sib16]
    lab8.[lab16 lab8. lab16] lab8.[lab16 lab8. lab16]
    do8.[do16 do8. do16] do8.[do16 do8. do16]
    sib8.[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]\mbreak
    sib'8.[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]
    sib8.\p[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]
    sib8.[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]
    do8.[do16 do8. do16] do8.[do16 la8. la16]
    sib4\fermata r sib-!\f r
    fa-! r sib,\p sib sib sib\f sib sib
    sib1\fermata

}


IIbcn = \relative do {

    mib8.-![mib16 mib8.-! mib16] mib8.-![mib16 mib8.-! mib16]
    lab,8.[lab16 lab8. lab16] lab8.[lab16 lab8. lab16]
    sib8.[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]

    %4
    mib8.[mib16 mib8. mib16] mib8.[mib16 mib8. mib16]
    reb8.[reb16 reb8. reb16] reb8.[reb16 reb8. reb16]
    do8.[do16 do8. do16] do8.[do16 do8. do16]\mbreak

    %7
    do8.[do16 do8. do16] do8.[do16 do8. do16]
    sib2\p^\markup\italic "Sostenuto" sib
    sib\f sib\tr

    %10
    sib1\f
    mib8\mp^\markup\italic "Violoncello Solo" mib mib mib fa fa fa fa
    sib, sib sib sib mib mib sol sib

    %13
    mib, mib mib mib re re re re
    do do sib sib fa' fa, fa fa'\mbreak
    sol sol do, do fa fa16 sol la8 fa

    %16
    sol sol do, do fa fa, fa r
    fa' fa mib mib re re' re re,
    r sib' sib sib, r la' la la,

    %19
    r la' la la, sib sib' sol sol
    la la fa fa sib sib sol sol\mbreak
    la la fa fa sib mib, mib mib

    %22
    mib re16 mib fa8 fa, sib sib' la fa
    sib sol fa fa, sib sib' la fa
    sib sol fa fa, sib2

    %25
    sib8 sib sib sib do do do do
    do do do do fa fa do' do,\mbreak
    fa reb do do, fa2

    %28
    fa'8 fa fa fa sol sol sol sol
    sol, sol sol sol do do do do
    sib sib sib sib lab lab lab lab

    %31
    sol sol sol sol sol sol sol sol
    sol sol sol sol do lab' mib fa
    sol fa mib do fa re sol sol,\mbreak

    %34
    do4 r mib8 mib fa sib,
    mib mib sib sib do do fa, fa
    sib4 r mib8 mib mib mib

    %37
    fa fa fa fa sib, sib sib sib
    mib mib sol sib sol sol sol sol
    lab lab lab lab la la la la

    %40
    sib sib sib sib sib, sib sib sib\mbreak
    sib sib sib sib sib sib sib sib
    sib sib sib lab sol sol sol sol

    %43
    lab lab lab lab sib sib sib sib
    do do do do fa fa fa fa
    sib, sib sib sib re re re re

    %46
    mib mib lab lab mib lab, sib sib
    mib, mib' re sib mib do sib sib
    mib, mib' re sib mib do sib sib

    %49
    mib4 mib mib r
    sol,8.-!\f^\markup\italic "Cembalo"[sol16 sol8.-! sol16] sol8.-![sol16 sol8.-! sol16]
    lab8.[lab16 lab8. lab16] lab8.[lab16 lab8. lab16]

    %52
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    sib8.[sib16 sib8. sib16] sib8.[sib16 sib8. sib16]\mbreak
    re8.[re16 re8. re16] re8.[re16 re8. re16]

    %55
    mib8.\p[mib16 mib8. mib16] reb8.[reb16 reb8. reb16]
    dob8.[dob16 dob8. dob16] sib8.[sib16 sib8. sib16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]

    %58
    lab!4\fermata r sol^!\f r
    lab-! r sib\p sib
    mib mib\f mib, mib

    %61
    mib1\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6 5>
    <4>2 <3>
    s1
    <2>
    <6>
    <6!>
    <3>4 <6 4> <5 3> <6 4>
    <5 3>2 <7! 4 3>
    <8 5 3>1
    s1*39
    <6 5->1
    s
    <6 5>
    s
    <6 5>
    <_->2 <6 4  2>
    <7 5> <6 4>
    <7 5> s
    <6 4 2> <6>
    <6 5> <6 4>4 <5 3>

}

forma = {

    \time 4/4
    \key mib\major
    \tempo 4 = 50
    s1*10
    \bar"||"\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -3)
    \mark\markup "Andante"
    \tempo 4 = 60
    s1*39
    \bar"||"\break
    \once \override Score.RehearsalMark.extra-offset = #'(0 . -2)
    \mark\markup "Adagio Stac[c]ato"
    \tempo 4 = 50
    s1*12
    \bar "|."

}



IIvlI = {
    \global
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

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

    sib4 re
    do sol'~
    sol8 fa16 mib re8 do

    %4
    re do sib4
    sol' mib16(sol sib sol)
    fa8 sib4 fa8\p

    %7
    sol4 mib16(sol sib sol)
    fa8 sib4 fa8\f
    mib8 re16 do re4\tr

    %10
    do fa~
    fa8 mi16 fa sol8 mi
    fa sib,4 la8

    %13
    fa'\p mi16 fa sol8 mi
    fa sib,4 la8
    sib'4\f sib\mbreak

    %16
    sib8 do,~do16 sib' la sol
    la4 la
    la8 do,8~do16 la'\p sol fa

    %19
    sib4 sib
    sib8 do,~do16 sib' la sol
    la4 la

    %22
    la8 do,8~do16 la'\f sol fa
    lab4 lab
    lab?8 si,~si16 re\p fa sol

    %25
    lab4 lab
    lab?8 si,~si16 do re mi
    fa\f(sol) lab4 sol16 fa

    %28
    mi8.[do16 sol'8. mi16]
    sib'4. la16 sol\mbreak
    la?8.[fa16 sol8. re16]

    %31
    fa4 mi\tr
    fa8 la4\f sol16 fa
    sol8 do4 sol8

    %34
    fa fa4 mi16 re
    mi?8 la4 mi!8
    re4 re8 do16 sib

    %37
    do8 fa4 do8
    sib sol'4 sib,8
    la[fa' re sib]

    %40
    la4 sol\tr
    fa4 r fa4 r16 fa' mib re
    do4 si\tr

    %43
    do8 sol4 mib'8
    re sol,4 fa'8\mbreak %% fine pagina
    mib do lab'4~

    %46
    lab8(fad) sol4~
    sol8(mi) fa?4
    si2\tr

    %49
    do4. mib,8
    re si'4 do16 re
    do4. mib,8\p

    %52
    re si'4 do16 re
    do8. lab16\f lab8.\tr sol32 fad
    sol8. fa!16 fa8.\tr mib32 re

    %55
    mib8. reb16 reb8. do32 si
    do8 lab'16 sol fa mib re? do
    si8[sol do fa]\mbreak

    %58
    mib4 re\tr
    do8 [do' la! sol]
    fad sol16 la re,4~

    %61
    re8 mib' re16(do) sib(la)
    sib8 do16 re sol,4~
    sol8[sib sol fa]

    %64
    mi fa16 sol do,4~
    do8 reb' do16(sib) lab(sol)
    lab8 sib16 do fa,4~

    %67
    fa8[lab fa re]
    si do16 re sol,4~
    \once\stemUp sol8 lab' sol16(fa) mib(re)\mbreak

    %70
    mib8 fa16 sol do,4~
    do8[mib do la!]
    fad sol16 la re,4~

    %73
    \once\stemUp re8 mib' re16(do) sib(la)
    sib8 do16 re sol,4~
    sol8[sib sol mi]

    %76
    dod re16 mi la,4
    \once\stemUp la8 sib' la16(sol) fad(mi)
    fad8 sol16 la re,8 do'

    %79
    sib sol'4 sib,8
    la dod4 re8\p\mbreak
    sib sol'4 sib,8

    %82
    la re, re'4\tr \f
    mib8 do fad4\tr
    sol8 re la'4\tr

    %85
    sib8 sol dod4
    re re~
    re do!~

    %88
    do sib~
    sib la8 sol
    fad4\tr sol8. do16

    %91
    sib4(la8.\tr sol16)
    do,2\p(
    dod\tr)

    %94
    re8[fad, sol la]
    sol4 fad\tr
    sol r16 fa!\f sol la

    %97
    sib4 re
    do sol'~\mbreak
    sol8 fa16 mib re8 do

    %100
    re do sib4
    sol' mib16(sol sib sol)
    fa8 sib4 fa8\p

    %103
    sol4 mib16(sol sib sol)
    fa8 sib4 fa8\f
    mib re16 do re4\tr

    %106
    do fa~
    fa8 sol16 lab sol8 fa
    mib do mib4~

    %109
    mib8 fa16 sol fa8 mib
    re sib re4~
    re8 mib16 fa mib8 re

    %112
    do sol'4 do,8
    sib sol'4 sib,8\mbreak
    la do4 fa8

    %115
    sib, mi4 fa8
    la,\p do4 fa8
    sib, mi4 fa8

    %118
    fa,8. \f mib'16 \grace re8 do8. do'16
    \grace sib8 la2\tr
    sib8 la16 sol fa8 sol

    %121
    re4 do\tr
    mib8 re4 do16 sib
    do8 fa4 do8

    %124
    sib4 sib8 la16 sol
    la8 re4 la8
    sol4 sol8 fa16 mib

    %127
    fa8 sib4 fa8
    mib do'4 mib,8
    re[sib' sol mib]

    %130
    re4 do\tr
    sib4 r

}

IIIvlIIn = \relative do'' {

    sib4 re
    do sib
    la8 sib16 do sib8 la

    %4
    sib do re4
    r8 mib[sib mib]
    re re4 re8\p

    %7
    mib[mib sib mib]
    re re4 re8\f
    do sib16 la sib4\tr

    %10
    la la~
    la8 sol16 la sib8 sol
    la sol4 fa8

    %13
    la\p sol16 la sib8 sol
    la sol4 fa8
    sol'4\f sol\mbreak

    %16
    sol32(fa mi8.) sol,32(fa mi8.)
    fa'4 fa
    fa32(sol la8.) do,32(sib la8.)

    %19
    sol'4\p sol
    sol32(fa mi8.) sol,32(fa mi8.)
    fa'4 fa

    %22
    fa32(sol la8.) do,32(sib la8.)
    fa'4\f fa
    fa32(sol lab8.) re,32(do si8.)

    %25
    fa'4\p fa
    fa32(sol lab8.) re,32(do si8.)
    re32\f(mi fa8.) fa8 mi16 re\mbreak

    %28
    do4 mi8. do16
    sol'32(fa mi8.) mi32(fa sol8.)
    fa4 re8. sib16

    %31
    la4 sol\tr
    fa fa'\f~
    fa8 mi16 re mi4~

    %34
    mi8 re16 do re4~
    re8 do16 sib do4~
    do8 sib16 la sib4~

    %37
    sib la
    sol8 sib4 sol8
    fa4 fa~

    %40
    fa mi\tr
    fa r fa r
    lab4 sol16 fa mib re\mbreak

    %43
    mib8 mib4 do'8
    si si4 re8
    do4 mib

    %46
    re8 re,4 re'8
    do do,4 do'8
    si re4 mib16 fa

    %49
    mib8 mib4 do8
    si re4 mib16 fa
    mib8 mib4 do8\p

    %52
    si re4 mib16 fa
    mib4 do\f
    sib!4 lab\mbreak %% fine pagina

    %55 OOKK
    sol fa
    mib lab
    sol r8 do

    %58
    do4 si \tr
    do r
    r8 fad[la fad]\mbreak

    %61
    re4 la'~
    la sol16 la sib la
    sol4 r

    %64
    r8 mi [sol mi]
    do4 sol'~
    sol fa16 (mi fa sol)

    %67
    lab4 r
    r8 si, [re si]
    sol4 re'~

    %70
    re do16(si do re)
    mib4 r
    r8 fad,[la fad]

    %73
    re4 la'~
    la sol16 fad sol la
    sib4 r

    %76
    r8 dod,[mi dod]\mbreak
    la4 mi'~
    mi re8 fad

    %79
    sol sib4 sol8
    fad fad4 fad8\p
    sol sib4 sol8

    %82
    fad4 sib\f\tr
    do la
    sib fad\tr

    %85
    sol sol\tr
    fad fad'
    sol la

    %88
    re, sol~
    sol mib
    re re8. sol,16

    %91
    sol4 fad\tr
    sol\p sol
    sol sol\tr

    %94
    fad8[la sol mib]
    sib4 la\tr \mbreak
    sol r

    %97
    sib'\f re
    do sib
    la8 sib16 do sib8 la

    %100
    sib do re4
    r8 mib[sib mib]
    re re4 re8\p

    %103
    mib[mib sib mib]
    re re4 re8\f
    do sib16 la sib4 \tr

    %106
    la do~
    do si8 do16 re
    do8 sol sib!4~

    %109
    sib la8 sib16 do
    sib8 fa fa4
    fa8 fa4 fa8

    %112
    sol do4 sol8
    sol sib4 sol8\mbreak
    fa[la la la]

    %115
    r sib[sib sib]
    r la\p[la la]
    r sib [sib sib]

    %118
    la4 \f la8. sib16
    do8 mib4 do8
    re4 sib~

    %121
    sib la
    sib sib~
    sib8 la16 sol la4~

    %124
    la8 sol16 fa sol4~
    sol8 fa16 mib fa4~
    fa8 mib16 re mib4~

    %127
    mib re
    do8 mib4 do8
    sib4 sib

    %130
    sib la\tr
    sib r

}

IIIvlan = \relative do' {

    fa4 fa
    sol sol
    do, fa

    %4
    fa r
    sib sib
    sib sib

    %7
    sib\p sib
    sib fa\f
    fa fa

    %10
    fa r
    do do
    do r

    %13
    do\p  do
    do r
    do8\f[mi sol do]

    %16
    do,[mi sol do]\mbreak
    do,[fa la do]
    do,[fa la do]

    %19
    do,8\p[mi sol do]
    do,[mi sol do]
    do,[fa la do]

    %22
    do,[fa la do]
    si,\f[re fa lab]
    si,[re fa lab]

    %25
    si,\p[re fa lab]
    si,[re fa lab]
    si,\f[re re re]

    %28
    mi4 do
    do do\mbreak
    do re

    %31
    do do
    do do\f
    do do'

    %34
    la la
    la la
    fa fa

    %37
    fa fa
    fa mi
    fa re

    %40
    do do
    do r do r
    re sol

    %43
    sol sol
    sol sol
    sol do

    %46
    fa, sib\mbreak
    mib, lab
    re, sol

    %49
    sol sol
    sol sol
    sol sol\p

    %52
    sol sol
    sol r
    R2*2

    %56
    r4 r8 fa\f
    sol[fa mib fa]
    sol4 sol

    %59
    sol mib
    re fad
    la re

    %62
    re sib
    re, re
    do mi\mbreak

    %65
    sol do
    do lab
    do lab

    %68
    sol si
    re sol,
    sol mib

    %71
    sol mib
    re fad
    la re,

    %74
    re sib
    re sib
    la dod

    %77
    mi la,
    la r8 re
    re[re' re, re]

    %80
    re[re' re, re\p]\mbreak
    re[re' re, re]
    re2\f

    %83
    re
    re
    re

    %86
    re4 re
    mi fad
    sol re

    %89
    mib! mib
    la, sib8. do16
    re4 re

    %92
    mib\p mib
    mib mib
    re r8 mib

    %95
    re4 re
    re r
    fa\f fa

    %98
    sol sol\mbreak
    do, fa
    fa r

    %101
    sib sib
    sib sib\p
    sib sib

    %104
    sib  fa\f
    fa fa
    fa fa

    %107
    re sol
    sol mib
    do fa

    %110
    fa sib
    sib sib
    sol sol

    %113
    sol sol
    do,8[fa fa fa]
    r sol[sol sol]\mbreak

    %116
    r fa\p[fa fa]
    r sol[sol sol]
    fa4\f fa

    %119
    fa fa
    fa re8 sol
    fa4 fa

    %122
    fa fa
    fa fa
    re re

    %125
    re re
    sib sib
    sib sib

    %128
    sib la
    sib sib8 sol
    fa4 fa

    %131
    fa r

}


IIIbcn = \relative do {

    sib4 sib
    mib mib
    fa fa

    %4
    sib sib,
    mib mib
    sib' sib,

    %7
    mib\p mib
    sib' sib,\f
    fa' sib

    %10
    fa8[sol la fa]
    do'4 do,
    fa fa,

    %13
    do'\p do
    fa fa,
    do'8\f[do' do, do]

    %16
    do[do' do, do]
    do[do' do, do]\mbreak
    do[do' do, do\p]

    %19
    do[do' do, do]
    do[do' do, do]
    do[do' do, do]

    %22
    do[do' do, do\f]
    si [si' si, si]
    si [si' si, si\p]

    %25
    si [si' si, si]
    si [si' si, si]
    si\f [si' si, si]

    %28
    do4 do
    do do
    fa sib,\mbreak

    %31
    do do
    fa fa\f
    do do

    %34
    re re
    la la
    sib sib

    %37
    fa fa
    do' do
    fa sib,

    %40
    do do
    fa, r fa r
    fa' sol

    %43
    do do,
    sol' sol,
    do do'

    %46
    si sib
    la lab
    sol8[sol sol, sol]\mbreak

    %49
    sol[sol' sol, sol]
    sol[sol' sol, sol]
    sol[sol' sol, sol\p]

    %52
    sol[sol' sol, sol]
    do4 r
    R2*2

    %56
    r4 r8 fa\f
    sol[fa mib fa]
    sol4 sol,

    %59
    do do
    re re
    fad fad

    %62
    sol sol
    sib, sib
    do do\mbreak

    %65
    mi mi
    fa fa
    fa fa

    %68
    sol sol
    si, si
    do do

    %71
    do do
    re re
    fad fad

    %74
    sol sol
    sol, sol
    la la

    %77
    dod dod
    re8[re' re, re]
    re8[re' re, re]

    %80
    re8[re' re, re\p]\mbreak
    re8[re' re, re]
    re2^\tasto\f ~

    %83
    re~
    re~
    re~

    %86
    re4 re
    mi fad
    sol sol,

    %89
    do do
    do sib8. do16
    re4 re

    %92
    mib\p mib
    mib mib
    re8[do sib do]

    %95
    re4 re,
    sol r
    sib\f sib\mbreak

    %98
    mib mib
    fa fa
    sib sib,

    %101
    mib mib
    sib' sib,\p
    mib mib

    %104
    sib' sib,\f
    fa' sib
    fa lab

    %107
    sol sol,
    do solb'
    fa fa,

    %110
    sib sib'
    sib, sib
    mib mib

    %113
    mib mib
    fa8[fa fa, fa]\mbreak
    fa[fa' fa, fa]

    %116
    fa\p[fa' fa, fa]
    fa[fa' fa, fa]
    fa4 r

    %119
    fa8\f[fa' fa, fa]
    sib4 re8 mib
    fa4 fa,

    %122
    sib sib
    fa' fa
    sol sol

    %125
    re re
    mib mib
    sib sib

    %128
    fa fa
    sib mib
    fa fa,

    %131
    sib r

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    <6>4 <5>
    <7>2
    s2*5
    <7>2
    s4 <6>
    <6 4>4 <7  5 _!>
    s2
    <6 4>4 <7 5 _!>
    s2
    <7 _!>
    s
    <6 4>
    s
    <7 _!>
    s
    <6 4>
    s
    <7- 5>
    s2*4
    <_!>2
    <7>
    s4 <6 5>
    <6 4> <5 3!>
    s s
    <4>4 <_!>
    <9> <8>
    <4> <3>
    <9> <8>
    <4> <3>
    <7 4> <_!>
    s s <6 4> <5 3!>
    s2 s
    <6 5 3->4 <_!>
    s2
    <_!>
    s4 <6->
    <7!> <6>
    <7> <8>
    <_!>2
    <6 4>
    <5 3!>
    <6 4>
    <5 3!>
    s2*3
    s4 s8 <6 5 _->
    <_!>4 <6>
    <6 4> <5 3!>
    s <6! 5>
    <_+>2
    <6 5/>
    <9>4 <8>
    <6> s
    <_!>2
    <6 5/>
    <9 3->4 <8>
    <_-> <6 5>
    <_!> s
    <7/>2
    <9>4 <8>
    <6 5>2
    <_+>
    <6>
    <9>4 <8>
    <6! 5>2
    <_+>
    <6>
    <9 _+>4 <8>
    <6 4>2
    <5 3+>
    <6 4>
    <5 3+>
    s2*3
    s4 <_+>
    <7> <5/>
    <4> <3>
    <7 3-> <6 5>
    <4+ 2> <6>
    <6 4> <5 3+>
    <6>2
    <6+>
    <_+>4 <6>
    <6 4> <5 3+>
    s2*2
    <6>4 <5>
    <7>2
    s2*5
    <7>2
    s4 <6>
    <7 4> <_!>
    s <6>
    <7 4> <3>s2
    s
    <6> <5>
    s
    s8 <7!> s <8>
    s8 <8 5 3> s4
    s8 <7!> s <8>
    s2
    s8 <7-> s4
    s4 <6>
    <6 4>4 <3>
    s2
    <4>4 <3>
    <9> <8>
    <4> <3>
    <9> <8>
    <4> <3>
    <7 4> <3>
    s2
    <6 4>4 <3>

}

forma = {

    \time 2/4
    \key sib\major
    \tempo 2 = 60
    \repeat volta 2 {s2*40}
    \alternative {{s2}{s}}\break
    \set Score.currentBarNumber = #42
    \bar ".|:"
    s2*90
    \bar":|."

}



IIIvlI = {
    \global
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

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {

    re,2 re'
    r4 fad, sol la
    re,2 re'

    %4
    r4 fad, sol la
    re,4 fad sol la
    re, la' sol8(fad mi re)

    %7
    la2 la'
    r4 dod, re mi
    la,2 la''

    %10
    r4 dod, re mi
    la, dod, re mi
    la, si'' la8(sol fad mi)\mbreak

    %13
    re2 re'
    r4 fad,, sol la
    re,2 re''

    %16
    r4 fad,, sol la
    re, re''2 dod4
    si si2 la4

    %19
    sold mi, sold si
    mi, sold'2 si4
    la mi, la dod

    %22
    mi, la'2 dod4
    si mi,, sold si
    mi, si''2 re4

    %25
    \grace re8 dod2.\tr si8 la
    mi2 re'\p
    \grace re8 dod2.\tr si8 la

    %28
    mi2 re'\f
    dod4 sold sold(la)\mbreak
    la red, red(mi)

    %31
    mi si si(do)
    do? sold sold(la)
    mi fad8 sold la si dod? re

    %34
    mi4 dod re si
    dod8(si la4) la'2\tr
    fad8(mi re4) la'2\tr

    %37
    dod,8(si la4) la'2\tr\p
    fad8(mi re4) la'2\tr
    dod,8(si la4) la'2\tr\f

    %40
    fad\tr re\tr
    fad, re'4\tr  dod8 si
    fad2 re'4\tr dod8 si

    %43
    la2~la4.(mi8)
    si'1\tr\mbreak
    la4 la' dod, mi

    %46
    la, dod mi, la
    la,2 r
    la la'

    %49
    r4 dod, re mi
    la,2 la''
    r4 dod, re mi

    %52
    la, dod, re mi
    la, sol'' fad8(mi) re(dod)
    si2 si'

    %55
    r4 re,, mi fad
    si,2 si''
    r4 re,, mi fad

    %58
    si, red' mi fad
    si, do' si8(la) sol(fad)
    sol2 mi

    %61
    r4 si' si, re
    do2\tr re8(mi fad sol)\mbreak
    la4 la do, la'

    %64
    si,(la') sol2\tr
    r4 sol sol, sol'
    la,2 si8(dod red mi)

    %67
    fad4 fad la, fad'
    sol,(fad') mi2
    si'4(mi,) mi2\tr

    %70
    do'4(mi,) mi2\tr
    dod'!4(sol) sol\tr fad8 mi
    red(dod si2) si'4

    %73
    la si,2 sol'4
    fad si,2 si'4\p
    la si,2 sol'4

    %76
    fad si,2 do'4\f
    do? si2 la4
    sol fad8 sol la4 sol8 la

    %79
    si4 la8 sol fad4 mi\mbreak
    si2(dod8 red mi fad)
    fad1\tr

    %82
    sol4\p fad8 sol la4 sol8 la
    si4 la8 sol fad4 mi
    si2(dod8 red mi fad)

    %85
    fad1\tr
    mi2 r8 si'\f sol mi
    si2 re

    %88
    dod\tr r8 mi dod la
    mi2 sol
    fad re'

    %91
    r4 fad, sol la
    re,2 re'
    r4 fad, sol la

    %94
    re, fad sol la
    re, la' sol8(fad) mi(re)
    la2 la'\mbreak

    %97
    r4 dod, re mi
    la,2 la''
    r4 dod, re mi

    %100
    la, dod, re mi
    la, si'' la8(sol) fad(mi)
    fad2 re'

    %103
    r4 la sol8(fad) mi(re)
    si'4(red,) mi2
    si'4\p(red,) mi2

    %106
    si'4(red,) mi2
    r4 si'\f la8(sol) fad(mi)
    la4(dod,) re2

    %109
    la'4\p(dod,) re2
    la'4(dod,) re2
    r4 la'\f sol8(fad) mi(re)

    %112
    sol4(fad) fad(mi)\mbreak
    mi(re) re dod8 si
    dod4 si2 la4

    %115
    fa' mi2 re4
    dod si2 la4
    fa' \p mi2 re4

    %118
    dod si2 la4
    r la8\f si dod re mi fad
    sol4-! sol-! sol-! sol-!

    %121
    sol4-! sol-! sol-! sol-!
    dod2 mi
    r8 sol, la si la4 sol

    %124
    fad4 re' si sol
    fad2 mi\tr
    fad4 re' si sol

    %127
    fad2 mi\tr
    re4 re' fad, la
    re, re fad, la

    %130
    re,2 r

}

IVvlIIn = \relative do'' {

    re,2 re'
    r4 fad, sol la
    re,2 re'

    %4
    r4 fad, sol la
    re,4 fad sol la
    re, la' sol8(fad mi re)

    %7
    la2 la'
    r4 dod, re mi
    la,2 la''

    %10
    r4 dod, re mi
    la, dod, re mi
    la, si'' la8(sol fad mi)\mbreak

    %13
    re2 re'
    r4 fad,, sol la
    re,2 re''

    %16
    r4 fad,, sol la
    re, fad'2 fad4
    fad fad2 fad4

    %19
    mi mi, sold si
    mi, si'2 re4
    dod mi, la dod

    %22
    mi, dod'2 mi4
    re mi, sold si
    mi, sold'2 si4

    %25
    la2 la4. dod,8
    si2 sold'\p\mbreak
    la la4. dod,8

    %28
    si2 sold'\f
    la4 sold sold(la)
    la red, red(mi)

    %31
    mi si si(do)
    do? sold sold(la)
    mi fad8 sold la si dod? re

    %34
    dod4 la si sold
    la8(si) dod2 dod4
    re fad,2 re'4

    %37
    dod mi,2 dod'4\p
    re fad,2 re'4
    dod2 la'\tr\f

    %40
    fad\tr re\tr\mbreak
    fad, re'4\tr  dod8 si
    fad2 re'4\tr dod8 si

    %43
    la2 la
    la sold\tr
    la4 la' dod, mi

    %46
    la, dod mi, la
    la,2 r
    la la'

    %49
    r4 dod, re mi
    la,2 la''
    r4 dod, re mi

    %52
    la, dod, re mi
    la, sol'' fad8(mi) re(dod)
    si2 si'

    %55
    r4 re,, mi fad
    si,2 si''
    r4 re,, mi fad

    %58
    si, red' mi fad
    si, do' si8(la) sol(fad)
    sol2 mi

    %61
    si' si
    si la
    do, do

    %64
    do? si
    sol' sol
    sol fad

    %67
    la, la
    la sol
    si4 si2 si4

    %70
    do? do2 do4
    dod! dod2 dod4
    fad,(red') red fad\mbreak

    %73
    fad(red) red-! mi-!
    mi(red) red-! fad-!\p
    fad(red) red-! mi-!

    %76
    mi(red) red-! la'\f-!
    la sol2 fad4
    mi sol2 fad4~

    %79
    fad mi dod dod
    red2 mi~
    mi red\tr

    %82
    mi4\p sol2 fad4~
    fad mi dod dod
    red2 mi~

    %85
    mi red\tr
    mi r8 si'\f sol mi
    si2 re\mbreak

    %88
    dod\tr r8 mi dod la
    mi2 sol
    fad2 re'

    %91
    r4 fad, sol la
    re,2 re'
    r4 fad, sol la

    %94
    re, fad sol la
    re, la' sol8 (fad) mi (re)
    la2 la'\mbreak

    %97
    r4 dod, re mi
    la,2 la''
    r4 dod, re mi

    %100
    la, dod, re mi
    la, si'' la8(sol) fad(mi)
    fad2 re'

    %103
    r4 la sol8(fad) mi(re)
    si'4(red,) mi2
    si'4\p(red,) mi2

    %106
    si'4(red,) mi2
    r4 si'\f la8(sol) fad(mi)
    la4(dod,) re2

    %109
    la'4\p(dod,) re2
    la'4(dod,) re2
    r4 la'\f sol8(fad) mi(re)

    %112
    sol4(fad) fad(mi)\mbreak
    mi(re) re dod8 si
    la4 sold2 la4

    %115
    re dod2 si4
    la sold2 la4\mbreak
    re\p dod2 si4

    %118
    la sold2 la4
    r4 la8\f sold la si dod re
    mi4-! mi-! mi-! mi-!

    %121
    mi4-! mi-! mi-! mi-!
    mi2 dod4. re8
    mi2 mi~

    %124
    mi re~
    re dod\tr
    re re~

    %127
    re dod\tr
    re4 re' fad, la
    re, re fad, la

    %130
    re,2 r

}

IVvlan = \relative do' {

    fad2 fad
    fad4 fad sol la
    re,2 fad

    %4
    fad4 fad sol la
    re, fad sol la
    fad2 fad

    %7
    mi dod
    dod4 dod re mi
    la,2 dod\mbreak

    %10
    dod4 dod re mi
    la, dod re mi
    la,2 mi'

    %13
    fad fad
    fad4 fad sol la
    re,2 fad

    %16
    fad4 fad sol la
    re,2 re
    re re

    %19
    mi mi
    mi mi
    mi mi

    %22
    mi mi
    mi mi
    mi mi

    %25
    mi mi
    mi mi\p
    mi mi

    %28
    mi mi\f
    la la
    la la

    %31
    sold sold
    la fa
    mi r

    %34
    mi mi
    la,4 la dod mi
    la la, re fad

    %37
    la la,\p dod mi
    la la, re fad
    la la,\f dod la

    %40
    re2 re
    re re\mbreak
    re re

    %43
    dod dod
    si mi
    mi r

    %46
    dod dod
    dod r
    dod dod

    %49
    dod4 dod re mi
    la,2 dod
    dod4 dod re mi

    %52
    la, dod re mi
    dod2 fad
    re re

    %55
    re4 re mi fad
    si,2 re
    re4 re mi fad

    %58
    si,2 si\mbreak
    fad' si
    si sol

    %61
    mi mi
    mi mi
    re re

    %64
    re re
    do do
    do? do

    %67
    si si
    si si
    sol' sol

    %70
    la la
    lad lad
    si si

    %73
    si si
    si si\p
    si si

    %76
    si si\f
    si si
    si la\mbreak

    %79
    sol fad
    fad sol4. la8
    si2 si

    %82
    si\p la
    sol fad
    fad sol4. la8

    %85
    si2 si
    si r
    mi,\f mi

    %88
    mi r
    la, la
    la fad'

    %91
    fad4 fad sol la
    re,2 fad
    fad4 fad sol la

    %94
    re, fad sol la
    fad2 fad
    mi dod\mbreak

    %97
    dod4 dod re mi
    la,2 dod
    dod4 dod re mi

    %100
    la, dod re mi
    la,2 mi'
    fad fad

    %103
    la la
    si si
    si\p si

    %106
    si si
    si\f si
    la la

    %109
    la\p la
    la la
    re,\f re

    %112
    dod re
    la'2. sold4\mbreak
    la la la, la

    %115
    la la' la, la
    la la' la, la
    la\p la' la, la

    %118
    la la' la, la
    la2 r
    mi'\f re

    %121
    dod si
    la si4. dod8
    dod2 dod

    %124
    re sol
    la la
    la si

    %127
    la la
    fad r
    fad fad

    %130
    fad r

}


IVbcn = \relative do {

    re2 re
    re4 fad sol la
    re,2 re

    %4
    re4 fad sol la
    re, fad sol la
    re,2 re

    %7
    la la
    la4 dod re mi
    la,2 la

    %10
    la4 dod re mi\mbreak
    la, dod re mi
    la,2 dod

    %13
    re re
    re4 fad sol la
    re,2 re

    %16
    re4 fad sol la
    re,2 re
    re re

    %19
    mi mi
    mi mi
    mi mi

    %22
    mi mi
    mi mi
    mi mi

    %25
    la, la'
    sold mi\p\mbreak
    la, la'

    %28
    sold mi\f
    la la
    la la

    %31
    sold sold
    la fa!
    mi r

    %34
    mi mi
    la,4 la dod mi
    la la, re fad

    %37
    la la,\p dod mi
    la la, re fad
    la la,\f dod la

    %40
    re2 re
    re re
    re re\mbreak

    %43
    mi mi
    mi, mi
    la r

    %46
    la la
    la r
    la la

    %49
    la4 dod re mi
    la,2 la
    la4 dod re mi

    %52
    la, dod re mi
    la,2 lad
    si si

    %55
    si4 re mi fad
    si,2 si
    si4 re mi fad

    %58
    si,2 si\mbreak
    red red
    mi mi

    %61
    sol sol
    la la
    fad fad

    %64
    sol sol
    mi mi
    fad fad

    %67
    red red
    mi mi
    sol sol

    %70
    la la
    lad lad
    si4^\tasto si, si si'

    %73
    si si, si si'
    si si, si si'\p
    si si, si si'

    %76
    si si, si si'\f
    si2 si,\mbreak
    mi fad

    %79
    sol la
    si si
    si, si

    %82
    mi\p fad
    sol la
    si si

    %85
    si, si
    mi mi\f
    sold sold

    %88
    la la
    dod, dod
    re re

    %91
    re4 fad sol la
    re,2 re
    re4 fad sol la

    %94
    re, fad sol la
    re,2 re
    la la

    %97
    la4 dod re mi\mbreak
    la,2 la
    la4 dod re mi

    %100
    la, dod re mi
    la,2 dod
    re re4. mi8

    %103
    fad2 fad
    sol sol
    sol\p sol

    %106
    sol sol
    sol\f sol
    fad fad

    %109
    fad\p fad
    fad fad
    fad\f fad

    %112
    mi re
    dod si
    la4^\tasto la' la, la\mbreak

    %115
    la la' la, la
    la la' la, la
    la\p la' la, la

    %118
    la la' la, la
    la2 r
    mi'\f re

    %121
    dod si
    la la4. si8
    dod2 dod

    %124
    re sol
    la la,
    re sol

    %127
    la la,
    re r
    re re

    %130
    re r

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*11
    s2 <6 5>
    s1*5
    <6>2 < 5>
    <_+>1
    s
    <6 4>
    s
    <7 3+>
    s
    s
    <6>2 <7 _+>
    s1
    <6>2 <7 _+>
    s1
    s2 <4+>
    <6>1
    <3!>2 <6+>
    <8 _+>1
    <6 4>2 <_+>
    s1
    <6 4>
    <3>
    <6 4>
    <3>
    s
    <6>
    s
    <6 4>
    <4>2 <_+>
    s1*8
    s2 <6 5/>
    s1*4
    <_+>1
    s2 <5/>
    s1
    <6 5>
    <9 _!>2 <8>
    <5/> s
    <9 4> <8 3>
    <6! 5> s
    <9> <8>
    <5/> s
    <9 4> <8 3>
    <6> s
    <_!> s
    <_+> <7/>
    <_+>1
    <7 5>2 s4 <6 4>
    <5 3+>1
    <7>2 s4 <6 4>
    <5 3+>1
    <7>
    s2 <9>4 <8>
    <7> <6> <6 5>2
    <_+> <6 4>
    <4> <_+>
    s2 <9>4 <8>
    <7> <6> <6 5>2
    <_+> <6 4>
    <4> <_+>
    s1
    <5/>
    s
    <5/>2 s
    s1
    s1*10
    s2 <6 5>
    s1
    <6>1
    <6>
    s
    s
    s
    <6>
    s
    s
    s
    <6>2 <8>
    <6>2 <7>4 <6\+>
    s1
    <6! 4>1
    <5 3>
    <6! 4>
    <5 3>
    s
    <5>2 <4 2>
    <5>2 <6 4>
    s1
    <6>2 <5/>
    <9> <6 5>
    <6 4> <3>
    s <6 5>
    <6 4> <3>

}

forma = {

    \time 4/4
    \key re\major
    \tempo 1 = 65
    s1*47
    \bar ":..:"\break
    s1*83
    \bar":|."

}



IVvlI = {
    \global
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}


IVvla = {
    \global
    \clef alto
    <<\IVvlan \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzine
}

VvlIn = \relative do'' {

    sol,8\mp -! [sol'-! sol,-! sol'-!]
    \once\stemUp si,16 mi' re8~re16 do(si la)
    sol,8-! [sol'-! sol,-! sol'-!]

    %4
    \once\stemUp si,16 mi' re8~re16 do(si la)
    sol(si) la(do) si(mi) re(fad,)
    sol(si) la(do) si(mi) re(fad,)

    %7
    sol(si) re(fad) sol re (do si)
    la(re) re,4.
    re8-! [re'-! mi,-! re'-!]

    %10
    \once\stemUp fad,16 si' la8. sol16[(fad mi)]\mbreak
    re,8-! [re'-! mi,-! re'-!]
    \once\stemUp fad,16 si' la8. sol16[(fad mi)]

    %13
    fad(mi re dod) re (si la sold)
    la8 la'\tr~la8.(sold32 la)
    la,8 la'\tr~la8.(sold32 la)

    %16
    la,8 la'\tr~la8.(sold32 la)
    la,8 la'\tr~la8.(sold32 la)
    la,8 dod4 re8

    %19
    \tuplet 3/2 { mi16(re dod)} mi4 fad8
    \grace fad sol4. mi8\mbreak
    fad16(la) sol(fad) sol8 mi

    %22
    fad16(la) sol(fad) sol8 mi
    fad8 re' r si
    r sol r mi

    %25
    \grace re dod2\tr
    re16 fa,-.(fa-. fa-. fa-. fa-. fa-. fa-.)
    fa?\tr(mi) mi4 dod'8

    %28
    re16 fa,-.(fa-. fa-. fa-. fa-. fa-. fa-.)
    mi la(dod re) mi8 r
    r16 mi(sol la) si8 r

    %31
    r sold [sold sold]\mbreak
    \tuplet 3/2 { la16(sol! fad) mi[(fad re)] } mi8 dod\tr
    \tuplet 3/2 { sol16(fad mi) fad[(mi re)] } fad8 mi\tr

    %34
    re8-! [re'-! mi,-! re'-!]
    \once\stemUp fad,16 si' la8. sol16[(fad mi)]
    re,8-! [re'-! mi,-! re'-!]

    %37
    \once\stemUp fad,16 si' la8. sol16[(fad mi)]
    re(do! si do) re,(do' la') do,
    do\tr(si) si4 re8

    %40
    re16\tr(dod) dod4 mi8
    mi16\tr(re) re4 fad8\mbreak
    sol16(si,) lad(si) lad(si) sol'8\tr

    %43
    fad16(si,) lad(si) lad(si) fad'8\tr
    mi16(fad,)mid(fad) mid(fad) mid'?8
    \tuplet 3/2 { re16(dod si) } lad'8\noBeam(si) fad

    %46
    \tuplet 3/2 { sol16(fad mi?) } lad8\noBeam(si) sol
    \tuplet 3/2 { fad16(mi re)}  lad'8\noBeam(si) fad
    \tuplet 3/2 { mi16(re dod) } sol'8\noBeam fad16(mi) re(dod)

    %49
    re(fad) mi (re) mi8 dod\tr \mbreak
    re16(fad) mi (re) mi8 dod\tr
    re si'4 si8~

    %52
    si si4 re,8
    dod re16 mi re8 sol
    \tuplet 3/2 { fad16(mi re) mi[(re dod)] } re8 dod\tr

    %55
    si8. do!16 do8\tr re16 fad,
    sol,8 -! [sol'-! sol,-! sol'-!]
    \once\stemUp si,16 mi' re8~re16 do(si la)

    %58
    sol,8-! [sol'-! sol,-! sol'-!]
    \once\stemUp si,16 mi' re8~re16 do(si la)
    sol(si) la(do) si(mi) re(fad,)

    %61
    sol(si) la(do) si(mi) re(fad,)
    sol(si re fad) sol re (do si)
    la8 re\tr~re8. (dod32 re)

    %64
    re,8 re'\tr~re8. (dod32 re)
    re,8 re'\tr~re8. (dod32 re)
    re,8 re'\tr~re8. (dod32 re)

    %67
    re,8 fad4 la8
    si4 do\tr
    re16(do si8.) do16[(si la)]

    %70
    si4 do\tr
    re16(do si8.) re16[(sol fa)]\mbreak
    mi\tr(red mi8.) do'16[(la fad)]

    %73
    re\tr(dod re8.) si'16[(sol re)]
    do\tr(si do8.) la'16[(fad do)]
    si\tr(la si8.) sol'16[sol(fad)]

    %76
    mi(re) do\tr(si) la\tr(sol) fad\tr(mi)
    re dod' dod\tr(re) sol, dod dod\tr (re)
    re, dod' dod\tr(re) sol, dod dod\tr (re)

    %79
    re,2\mbreak
    sol'16 sib,-.(sib-. sib-. sib-. sib-. sib-. sib-.)
    sib?\tr(la) la4 fad'8

    %82
    sol16 sib,-.(sib-. sib-. sib-. sib-. sib-. sib-.)
    la(re re, re') si'8.(re,16)
    si(do re, do') la'8.(do,16)

    %85
    la(si re, si') si'8.(re,16)
    si(do re, do') la'8.(do,16)
    la(si re, si')  sol'8.\tr (fad16)\mbreak

    %88
    red(mi) si(do) sold(la) mi'(sol,)
    \tuplet 3/2 { fad(mi re) do'[(si la)] mi'(re do) la'[(sol fad)] }
    do'(si) la(sol) fad(mi) re(do)

    %91
    si8 sol'4\tr fad16 mi
    \tuplet 3/2 { re(fad sol) mi[( re do)] } si8 la\tr
    si dod r dod

    %94
    \tuplet 3/2 { re16(do! si) la[(si sol)] } la8 fad\tr
    \tuplet 3/2 { do16(si la) si[(la sol)] } si8 la\tr
    sol4 r

}

VvlIIn = \relative do'' {

    si,8\mp[si do do]
    re[si' la do,]
    si[si do do]

    %4
    re[si' la do,]
    si16(sol') fad(la) sol(do,) si(la)
    si(sol') fad(la) sol(do,) si(la)

    %7
    si8 si' si16 si(la sol)
    sol8 fad~fad16 sol(fad mi)
    fad8[fad sol sol]

    %10
    la[fad' mi sol,]
    fad[fad sol sol]
    la[fad' mi sol,]\mbreak

    %13
    fad4 r8 fad'
    dod4 re
    mi16(re dod8)~dod16 re(dod si)

    %16
    dod4 re
    mi16(re dod8)~dod16 re(dod si)
    dod8 mi,4 fad8

    %19
    sol dod4 re8
    \grace re mi4. dod8
    re16(fad) mi(re) mi8 dod

    %22
    re16(fad) mi(re) mi8 dod
    re fad r sol
    r si, r sol

    %25
    \grace fad mi2\tr\mbreak
    fa16 re-.(re-. re-. re-. re-. re-. re-.)
    re\tr(dod) dod4 mi8

    %28
    fa16 re-.(re-. re-. re-. re-. re-. re-.)
    dod4 r16 dod'(mi fad)
    sol8 r r16 sol(si dod)

    %31
    re8[re, re re]
    dod re16 fad, sol8 mi
    mi re4 dod8\tr

    %34
    re[fad sol sol]
    la[fad' mi sol,]
    fad[fad sol sol]\mbreak

    %37
    la[fad' mi sol,]
    fad[sol la la]
    la sol16 la si8 si

    %40
    si la16 si dod8 dod
    dod? si16 dod re8 re
    mi[mi sol si]

    %43
    r re,[fad si]
    r dod,[mi dod]
    re fad4 si,8

    %46
    si sol'4 si,8
    si fad'4 si,8
    si si4 lad8

    %49
    si16(re) dod(si) dod8 lad\tr
    si16(re) dod(si) dod8 lad\tr\mbreak
    si re4 fad8

    %52
    sol re4 si8
    lad si16 dod si8 si
    si si4 lad8\tr

    %55
    si4 r
    si,8[si do? do]
    re[si' la do,]

    %58
    si[si do do]
    re[si' la do,]
    si16(sol') fad(la) sol(do,) si(la)

    %61
    si(sol') fad(la) sol(do,) si(la)
    si8 si' si16 si(la sol)
    fad4 sol\mbreak

    %64
    la16(sol fad8)~fad16 sol(fad mi)
    fad4 sol
    la16(sol fad8)~fad16 sol(fad mi)

    %67
    fad8 la4 fad8
    sol sol'\tr~sol8.(fad32 sol)
    sol,8 sol'\tr~sol8.(fad32 sol)

    %70
    sol,8 sol'\tr~sol8.(fad32 sol)
    sol,8 re'4 re8
    re do16 (si) do8 do~

    %73
    do si16(la) si8 si~
    si la16(sol) la8 la\mbreak
    la sol16(fad) sol8 re'

    %76
    re do16\tr(si) la\tr(sol) fad\tr(mi)
    fad8[fad mi sol]
    fad8[fad mi sol]

    %79
    fad2
    sib16 sol-.(sol-. sol-. sol-. sol-. sol-. sol-.)
    sol\tr(fad) fad4 la8

    %82
    sib16 sol-.(sol-. sol-. sol-. sol-. sol-. sol-.)
    fad4 r8 si'!
    si(la) r la

    %85
    la(sol) r si
    si(la) r la\mbreak
    la(sol) r fad

    %88
    red16(mi) si(do) sold(la) mi'(sol,)
    \tuplet 3/2 { fad(mi re) do'[(si la)] mi'(re do) la'[(sol fad)] }
    do'(si) la(sol) fad(mi) re(do)

    %91
    si8 sol'4\tr fad16 mi
    \tuplet 3/2 { re(fad sol) mi[( re do)] } si8 la\tr
    sol sol r sol

    %94
    fad sol16 si do8 la
    la sol4 fad8\tr
    sol4 r

}

Vvlan = \relative do' {

    sol8\mp r la r
    si[sol' re re]
    sol, r la r

    %4
    si[sol' re re]
    sol,4 r8 re'
    sol4 r8 re

    %7
    sol[sol, si do]
    re8 re~re16 mi re dod
    re8 r mi r

    %10
    fad[re' la la,]
    re r mi r
    fad[re' la la,]\mbreak

    %13
    re[re si si]
    la[la' si, la']
    dod, la'~la16 fad mi re

    %16
    la8[la' si, la']
    dod, la'~la16 fad mi re
    la8[la' la, la]

    %19
    la8[la' la, la]
    la8[la' la, la]
    re4 r8 la'

    %22
    re re, r la'
    re [re, sol sol]\mbreak
    mi mi, mi'16 re dod si

    %25
    la2
    sold8[sold sold sold]
    la8[la' la, la]

    %28
    sold8[sold sold sold]
    la8[la' la, la]
    la8[la' la, la]

    %31
    re [sib sib sib]
    la re sol, la16 si
    dod8 [re la' la,]

    %34
    re r mi r\mbreak
    fad[re' la la,]
    re r mi r

    %37
    fad[re' la la,]
    re [mi fad re]
    sol sol, sold' mi

    %40
    la la, lad' fad
    si[si, re si]
    mi[mi mi mi]

    %43
    re[re re re]
    lad[lad lad lad]
    si[si re re]

    %46
    mi[mi mi mi]\mbreak
    re[re re re]
    dod[dod fad, fad]

    %49
    si [si' fad fad]
    si, [si' fad fad]
    si, [si' re, si']

    %52
    mi, [si' mid, si']
    fad[fad si mi,]
    fad[fad fad, fad]

    %55
    si4 r
    sol8 r la r
    si[sol' re re]

    %58
    sol, r la r\mbreak
    si[sol' re re]
    sol,4 r8 re'

    %61
    sol4 r8 re
    sol[sol, si do]
    re[re' mi, re']

    %64
    fad, re'~re16 si la sol
    re8[re' mi, re']
    fad, re'~re16 si la sol

    %67
    re8 re' re,16 do si la
    sol8[sol' la, sol']
    si, sol'~sol16 mi re do\mbreak

    %70
    sol8[sol' la, sol']
    si, sol' sol, si
    do[do' la la,]

    %73
    si[si' sol sol,]
    la[la' fad re]
    sol [sol, sol sol']

    %76
    do, [do dod dod]
    re[re re re]
    re[re re re]

    %79
    re2
    dod8[dod dod dod]
    re[re re re]

    %82
    dod[dod dod dod]\mbreak
    re[re re re]
    re[re re re]

    %85
    re[re re re]
    re[re re re]
    re[re re re]

    %88
    do[do do do]
    re4 r
    fad8[fad fad fad]

    %91
    sol[si do do,]
    si[do re re]
    mib[mib mib mib]

    %94
    re sol do, re16 mi
    fad8[sol re re,]
    sol4 r

}


Vbcn = \relative do {

    sol8\mp r la r
    si[sol' re re]
    sol, r la r

    %4
    si[sol' re re]
    sol,4 r8 re'
    sol4 r8 re

    %7
    sol[sol, si do]
    re8 re~re16 mi re dod
    re8 r mi r

    %10
    fad[re' la la,]
    re r mi r
    fad[re' la la,]\mbreak

    %13
    re[re si si]
    la[la' si, la']
    dod, la'~la16 fad mi re

    %16
    la8[la' si, la']
    dod, la'~la16 fad mi re
    la8[la' la, la]

    %19
    la8[la' la, la]
    la8[la' la, la]
    re4 r8 la'

    %22
    re re, r la'
    re [re, sol sol]\mbreak
    mi mi, mi'16 re dod si

    %25
    la2
    sold8[sold sold sold]
    la8[la' la, la]

    %28
    sold8[sold sold sold]
    la8[la' la, la]
    la8[la' la, la]

    %31
    re [sib sib sib]
    la re sol, la16 si
    dod8 [re la' la,]

    %34
    re r mi r\mbreak
    fad[re' la la,]
    re r mi r

    %37
    fad[re' la la,]
    re [mi fad re]
    sol sol, sold' mi

    %40
    la la, lad' fad
    si[si, re si]
    mi[mi mi mi]

    %43
    re[re re re]
    lad[lad lad lad]
    si[si re re]

    %46
    mi[mi mi mi]\mbreak
    re[re re re]
    dod[dod fad, fad]

    %49
    si [si' fad fad]
    si, [si' fad fad]
    si, [si' re, si']

    %52
    mi, [si' mid, si']
    fad[fad si mi,]
    fad[fad fad, fad]

    %55
    si4 r
    sol8 r la r
    si[sol' re re]

    %58
    sol, r la r\mbreak
    si[sol' re re]
    sol,4 r8 re'

    %61
    sol4 r8 re
    sol[sol, si do]
    re[re' mi, re']

    %64
    fad, re'~re16 si la sol
    re8[re' mi, re']
    fad, re'~re16 si la sol

    %67
    re8 re' re,16 do si la
    sol8[sol' la, sol']
    si, sol'~sol16 mi re do\mbreak

    %70
    sol8[sol' la, sol']
    si, sol' sol, si
    do[do' la la,]

    %73
    si[si' sol sol,]
    la[la' fad re]
    sol [sol, sol sol']

    %76
    do, [do dod dod]
    re[re re re]
    re[re re re]

    %79
    re2
    dod8[dod dod dod]
    re[re re re]

    %82
    dod[dod dod dod]\mbreak
    re^\tasto[re re re]
    re[re re re]

    %85
    re[re re re]
    re[re re re]
    re[re re re]

    %88
    do[do do do]
    re4 r
    fad8[fad fad fad]

    %91
    sol[si do do,]
    si[do re re]
    mib[mib mib mib]

    %94
    re sol do, re16 mi
    fad8[sol re re,]
    sol4 r

}

Vbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <7>
    <6>  s8 <7>
    s4 <7>
    <6> s8 <7>
    s2*3
    <4>8 <3> s4
    s4 <7>
    <6> <_+>8 <7>
    s4 <7>
    <6> <_+>8 <7>
    s4 <6\+>
    <_+> <7>
    <6> s
    <_+> <7>
    <6> s
    <_+> s
    <7>2
    <_+>
    s4 s8 <_+>
    s4 s8 <_+>
    s2
    s
    <_+>
    <7! 5>
    <6! 4>4 <5 3+>
    <7! 5>2
    <_+>
    <7 _+>
    s8 <6\+> s4
    <_+> <6>8 <_+>
    <5/>4 <6 4>8 <_+>
    s4 <7>
    <6> <_+>8 <7>
    s4 <7>
    <6> <_+>8 <7>
    <9 4>8 <8 3> <6 5> <7>
    <9 4>8 <8 3> <6 5> <7>
    <9> <8> <6>4
    s2
    s
    <6>
    <6 5>
    s
    s
    <6>
    <7>4 <4>8 <_+>
    s4 <7 _+>
    s <7 _+>
    s <6>
    s <7/>
    <_+> s8 <6 5>
    <4>4 <6 4>8 <_+>
    s2
    s4 <7>
    <6> s8 <7>
    s4 <7>
    s <7>
    s2*3
    s4 <7>
    <6> s
    s <7>
    <6> s
    s2
    s4 <7>
    <6> s
    s <7>
    <6> s8 <5!>
    <9>2
    <9>
    <9>
    <9>4 <8>
    <9>8 <8> <6>4
    s <7\+ 4 2>
    s <7\+ 4 2>
    <8 5 3>2
    <7- 5>
    <6- 4>4 <5 3>
    <7- 5>2
    s2*6
    <7>2
    <5/>
    s
    <6>4 <6 4>8 <3>
    <6\+>2
    s4 <6>
    s <6 4>8 <3>

}

forma = {

    \time 2/4
    \key sol\major
    \tempo 2 = 37
    s2*96
    \bar"|."

}



VvlI = {
    \global
    <<\VvlIn \forma>>

}

VvlII = {
    \global
    <<\VvlIIn \forma>>

}


Vvla = {
    \global
    \clef alto
    <<\Vvlan \forma>>

}

Vbc = {
    \global
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}




global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIvlIn = \relative do'' {

    re,2 mi4\tr
    fad8(la dod mi) re4
    mi,2 fad4\tr

    %4
    sol8(la dod mi) re4
    fad,2 sol4\tr
    la si8 dod re mi

    %7
    fad la sol4 fad
    \grace fad8 mi2 r4
    mi,2 re'4

    %10
    dod8(mi dod ) sold la4
    mi2 re'4
    dod8(mi dod ) sold la4\mbreak

    %13
    fad' fad4.\tr mi16 re
    dod4 si\tr la
    fad8 (re') dod si la sold

    %16
    la4. sol!8 fad mi
    re2 mi4\tr
    fad8(la dod mi) re4

    %19
    mi,2 fad4\tr
    sol8(la dod mi) re4
    fad,2 sol4\tr

    %22
    la si8 dod re4
    sol, fad mi\tr
    re2 r4

    %25
    re'2\p mi4\tr
    fa8(re) mi2
    la,4(mi') fa\tr

    %28
    sol8(mi) fa2
    sib la4
    sol2\tr  fa4

    %31
    dod8(re) re2\tr
    mi8(dod re sib?) la4
    re2 mi4\tr

    %34
    fa8(re) mi2
    la,4(mi') fa\tr
    sol8(mi) fa2

    %37
    \appoggiatura {sol16[la]} sib2 la4
    sol fa8 mi fa4
    re8 sib la sol fa mi

    %40
    \grace mi fa2 r4
    \tuplet 3/2 { mib'8(re do) } do2\tr
    \tuplet 3/2 { sib8(la sol) } sol2\tr

    %43
    \tuplet 3/2 { fa'8(mi? re) } re2\tr
    \tuplet 3/2 { dod8(si la) } la2 \tr
    dod8 re sol4 fa

    %46
    mi sold8 si la4
    dod,8 re sol4 fa
    \grace fa8 mi4. la,8 si dod

    %49
    re4 fa,(mi)\tr
    mi' sol,(fa)\tr
    re' fa,(mi)\tr

    %52
    mi' sol,(fa)\tr
    \tuplet 3/2 { sib8(la sol) } fa4 mi\tr
    re2 r4

}

VIvlIIn = \relative do'' {

    re,2 mi4\tr
    fad8(la dod mi) re4
    mi,2 fad4\tr

    %4
    sol8(la dod mi) re4
    fad,2 sol4\tr
    la si8 dod re mi

    %7
    fad la sol4 fad
    \grace fad8 mi2 r4
    mi,2 re'4

    %10
    dod8(mi dod ) sold la4
    mi2 re'4
    dod8(mi dod ) sold la4\mbreak

    %13
    fad' fad4.\tr mi16 re
    dod4 si\tr la
    fad8 (re') dod si la sold

    %16
    la4. sol!8 fad mi
    re2 mi4\tr
    fad8(la dod mi) re4

    %19
    mi,2 fad4\tr
    sol8(la dod mi) re4
    fad,2 sol4\tr

    %22
    la si8 dod re4
    sol, fad mi\tr
    re2 r4

    %25
    re'2\p mi4\tr
    fa8(re) mi2
    la,4(mi') fa\tr

    %28
    sol8(mi) fa2
    sib la4
    sol2\tr  fa4

    %31
    dod8(re) re2\tr
    mi8(dod re sib?) la4
    re2 mi4\tr

    %34
    fa8(re) mi2
    la,4(mi') fa\tr
    sol8(mi) fa2

    %37
    \appoggiatura {sol16[la]} sib2 la4
    sol fa8 mi fa4
    re8 sib la sol fa mi

    %40
    \grace mi fa2 r4
    \tuplet 3/2 { mib'8(re do) } do2\tr
    \tuplet 3/2 { sib8(la sol) } sol2\tr

    %43
    \tuplet 3/2 { fa'8(mi? re) } re2\tr
    \tuplet 3/2 { dod8(si la) } la2 \tr
    dod8 re sol4 fa

    %46
    mi sold8 si la4
    dod,8 re sol4 fa
    \grace fa8 mi4. la,8 si dod

    %49
    re4 fa,(mi)\tr
    mi' sol,(fa)\tr
    re' fa,(mi)\tr

    %52
    mi' sol,(fa)\tr
    \tuplet 3/2 { sib8(la sol) } fa4 mi\tr
    re2 r4

}

VIvlan = \relative do' {

    re4 re re
    re re re
    re re re

    %4
    re re re
    re re re
    re re re

    %7
    re si sol
    la2 r4
    sold' si mi,

    %10
    la la, r
    sold' si mi,
    la la, r\mbreak

    %13
    re dod si
    la si dod
    re mi mi,

    %16
    la2 r4
    re4 re re
    re re re

    %19
    re re re
    re re re
    re re re

    %22
    re re re
    si la la
    re,2 r4

    %25
    re'\p fa dod
    re la8 si dod re
    dod2 re4

    %28
    mi re8 dod re4
    sol2 fa4
    mi2 re4

    %31
    la sib2
    la4 la'8 sol fa mi
    re4 fa dod

    %34
    re la8 si dod re
    dod2 re4
    mi re8 dod re4

    %37
    sol2 fa4
    mi do? fa\mbreak
    sib, do do

    %40
    fa,2 r4
    fad' la re,
    sol sib la

    %43
    sold si! mi,
    la dod, la
    la dod re

    %46
    la la' la,
    la dod re
    la la' sol

    %49
    fa re dod
    sol' mi re
    fa re dod

    %52
    sol' mi re
    sol la la,
    re2 r4

}


VIbcn = \relative do {

    re4^\tasto re re
    re re re
    re re re

    %4
    re re re
    re re re
    re re re

    %7
    re si sol
    la2 r4
    sold' si mi,

    %10
    la la, r
    sold' si mi,
    la la, r\mbreak

    %13
    re dod si
    la si dod
    re mi mi,

    %16
    la2 r4
    re4^\tasto re re
    re re re

    %19
    re re re
    re re re
    re re re

    %22
    re re re
    si la la
    re,2 r4

    %25
    re'\p fa dod
    re la8 si dod re
    dod2 re4

    %28
    mi re8 dod re4
    sol2 fa4
    mi2 re4

    %31
    la sib2
    la4 la'8 sol fa mi
    re4 fa dod

    %34
    re la8 si dod re
    dod2 re4
    mi re8 dod re4

    %37
    sol2 fa4
    mi do? fa\mbreak
    sib, do do

    %40
    fa,2 r4
    fad' la re,
    sol sib la

    %43
    sold si! mi,
    la dod, la
    la dod re

    %46
    la la' la,
    la dod re
    la la' sol

    %49
    fa re dod
    sol' mi re
    fa re dod

    %52
    sol' mi re
    sol la la,
    re2 r4

}

VIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*6
    s4 <6> <7>
    s2.
    <6>4 s <7 _+>
    s2.
    <6>4 s <7 _+>
    s2.
    s2 <6\+>4
    s <6\+> <6>
    <6 5> <6 4> <_+>
    s2.*7
    <6>4 <6 4> <3>
    s2.
    s4 <6> <6>4
    s <_+>2
    <6>2.
    <6\+>
    <_->
    <6\+>
    <_+>4 <6+>2
    <_+>2.
    s4 <6> <6>4
    s  <_+>2
    <6>2.
    <6\+>
    <_->
    <5/>
    <6 5>4 <4> <3>
    s2.
    <7->4 <6+ 4 3> <7 _+>
    <_-> <6> s
    <7/>4 <6 4 3> <7 _+>
    <_+>4 <6>2
    <_+>4 <5/> s
    <_+>2.
    s4 <5/>2
    <_+>2 <4+ 2>4
    <6>2 <6>4
    <6> <6\+> s
    <6> s <6>
    <6> <6+> s
    <_->4 <6 4> <_+>

}

forma = {

    \time 3/4
    \key re\major
    \tempo 2 = 70
    s2.*8
    \bar":..:"
    s2.*16
    \bar":|."\break
    \mark\markup "[Minore]"
    \key do\major
    s2.*16
    \bar":..:"
    s2.*13
    \mark \markup "Da Capo il Minuetto"
    s2.
    \bar ":|."

}



VIvlI = {
    \global
    <<\VIvlIn \forma>>

}

VIvlII = {
    \global
    <<\VIvlIIn \forma>>

}


VIvla = {
    \global
    \clef alto
    <<\VIvlan \forma>>

}

VIbc = {
    \global
    \clef bass
    <<\VIbcn \forma \VIbfn>>

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \header {
        title = \markup\smaller{Sinfonia V in Sib maggiore}
        composer = \markup \center-column{"D. Dall'Oglio (1700ca -1764)"}

    }

    \markup\huge {[I.1] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    %\pageBreak

    \markup\huge {[I.2] Adagio e stac[c]ato}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    %\pageBreak

    \markup\huge {[I.3] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    \header {
        title = \markup\smaller{Sinfonia VI in Re maggiore}
        composer = \markup \center-column{"D. Dall'Oglio (1700ca -1764)"}

    }

    \markup\huge {[II.1] Allegro}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \IVbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    %\pageBreak

    \markup\huge {[II.2] Andante}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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

    %\pageBreak

    \markup\huge {[II.3] Minuetto}

    \score {

        \new ChoirStaff <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
                \set Staff.shortInstrumentName = "vl1"
                \VIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
                \set Staff.shortInstrumentName = "vl2"
                \VIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"Viola"}
                \set Staff.shortInstrumentName = "vla"
                \VIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \VIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #1.7
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.uniform-stretching = ##f
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 4)  %aumenta lo spazio orizzontale
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