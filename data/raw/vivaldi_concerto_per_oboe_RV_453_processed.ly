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

Iobn = \relative do'' {

    r8
    R1*15
    r2 r4 r8 la\solo
    re4 mi fad16 mi re dod re mi fad sol

    %18
    la8 re, si' re, dod re r la'
    si16 dod re4 \appoggiatura dod8 si \appoggiatura la sol4. la8
    fad16[mi re mi fad sol la fad] fad8\tr mi r mi

    %21
    la4 si dod16 si la sold \once\stemDown la8 mi,
    la4 si dod16 si la sold la8 la'
    sold si re, re re [\appoggiatura {re16[mi]} fad8 mi re]

    %24
    dod [\appoggiatura{dod16[re]} mi8 re dod] si mi, sold si
    re4 red\mbreak mi8 mi, sold si
    re?4 dod si r8 mi

    %27
    re16 mi fad8~fad16 re dod si sold' la si8~si16 re, dod si
    dod re mi8~mi16 dod si la fad' sold la8~la16 dod, si la
    sold[si la dod si re dod mi] re[fad mi sold fad la sold si]

    %30
    la8[(sold?16 fad mi8 red] fad)[re16(dod si8 la]
    si4.\tr) la8 la4 r
    R1*7

    %39
    r2 r4 r8 la\solo
    fad16 sol la si la dod si la re [fad mi re dod si la sol]\mbreak
    la[re dod si la sol fad mi] fad8 mi re4

    %42
    fad'16 re dod re la re dod re fad re dod re la re dod re
    mi re dod si la si dod re mi re dod si la mi' re dod
    re si la si sold si fad si mi, fad sold la si dod re dod

    %45
    re8 sold si re, re8\tr dod r mi
    fad16 sold la fad mi red mi red mi sold la mi re dod re dod
    re sold la re, dod si dod si\mbreak dod sold' la dod, si la si la

    %48
    si sold' la si, la sold la sold la si dod re mi8 la,
    fad'16 sol? fad mi re dod si la sold[fad mi fad sold la si dod]
    si8\tr si\tr si\tr si\tr sold'\tr sold\tr sold\tr sold\tr

    %51
    lad\tr lad \tr lad \tr lad \tr  si16 fad sol? fad si fad sol fad
    sol mi fad re mi dod re si lad8 fad r dod'
    re16 si do8~do16 si do si fad' si, do8~do16 si do si

    %54
    sol' si, do8~do16 si do si\mbreak lad' si, do8~do16 si do si
    \tuplet 3/2 { re dod? si fad'[mi re] } si'8 fad  \tuplet 3/2 { re16 dod si fad'[mi re] }  si'8 fad
    \senza \tuplet 3/2 { re16 fad mi re[dod si] } dod8. si16 si4 r

    %57 OOKK
    R1*8
    fad16 \solo la re8~re16 la fad la fad la re8~re16 la fad la
    sol si re8~re16 si sol si sol si re8~re16 si sol si

    %67
    sold si mi8~mi16 si sold si\mbreak sold si mi8~mi16 si sold si
    la dod mi8~mi16 dod la dod la dod mi8~mi16 dod la dod
    lad dod fad8~fad16 dod lad dod lad dod fad8~ fad16 dod lad dod

    %70
    si re fad8~fad16 re si re si re fad8~fad16 re si re
    si re sol8~sol16 re si re si re sol8~sol16 re si re
    dod8 la mi dod la'4 r

    %73
    la'16 re, dod re fad re la' re, si' re, dod re sol re si' re,\mbreak
    la' re, dod re fad re la' re, si' re, dod re sol re si' re,
    la' re, dod re fad re la' re, si' la sol fad mi8 re

    %76
    mi4 dod re r
    la8 re4 la8 si re4 si8
    la re4 la8 si re4 si8

    %79
    la re4 la8 si16 la si dod re8 sol,
    fad4 mi re r
    R1*7

    %88
    R1^\markup\center-align {\musicglyph #"scripts.ufermata"}  %%OOKK

}

IvlIn =  \relative do'' {

    re,8
    fad la re4 la8 sol fad re
    fad la re4 fad,8 mi re fad'
    mi[re16 dod re8 mi] dod8 si la16 re mi fad

    %4
    mi8[re16 dod re8 mi] dod8 si la si'
    la[sol16 fad sol8 la] fad mi re16 sol la si
    la8[sol16 fad sol8 la] fad mi re si'

    %7
    sold la re, re re[dod16 si mi8 re]
    dod4 si\mbreak la4 r8 re,
    fad la re4 la8 sol fad re

    %10
    fad la do4 si8 la sol mi
    sold si mi4 si8 la sold mi
    sold si re4 dod?8 si la si'

    %13
    la sol4 fad16 mi fad sol la8 r re,
    mi re4 dod8 re la4 si8
    la sol4 fad16 mi fad sol la8 r re,

    %16
    mi re4 dod8\mbreak re4 r
    R1*14
    r2 r4 r8 re

    %32
    fad la re fad la4~la16 sol fad mi
    re8[do16 si do8 do] si la sol re'
    sold, si mi sold si4~si16 la sold fad

    %35
    mi8[re16 dod? re8 re] dod si la dod
    re16 la sol? la re la re la mi' la, sol la mi' la, mi' la,
    fad' la, sol la fad' la, fad' la, sol'8 si~si16 la sol8~

    %38
    sol16 fad mi8~mi16 re dod8~dod16 sol' la si la8 sol
    fad4 mi re r
    R1*16

    %56
    r2 si8 re fad4
    re8 dod si fad si re fad4
    re8 dod si fad' red fad si4

    %59
    fad8 mi red si' red, fad si4
    sol8 fad mi sol dod, mi la4
    mi8 re? dod la'\mbreak dod, mi la4

    %62
    fad8 mi re16 la si dod re la si dod re la si dod
    re8 la4 sol8 fad16 la si dod re mi fad sol
    la8 sol4 fad8 mi la, r4

    %65 OOKK
    la8\p la la la la la la la
    si si si si si si si si
    si si si si\mbreak si si si si

    %68
    dod dod dod dod dod dod dod dod
    dod dod dod dod dod dod dod dod
    re re re re re re re re

    %71
    re re re re re re re re
    dod la mi dod la4 r
    fad'8(la re fad,) sol\parentSlur (si re sol,)

    %74
    fad(la re fad,) sol(si re sol,)
    fad(la re fad,) sol4 r8 re
    sol,4 la re r

    %77
    la'16 re, re' re, la' re, re' re, si' re, re' re, si' re, re' re,
    la' re, re' re, la' re, re' re, si' re, re' re, si' re, re' re,
    la' re, re' re, la' re, re' re, si' la si dod re8 sol,

    %80
    fad4 mi re r8 re
    fad la re4 la8 sol fad re
    fad la do4 si8 la sol mi

    %83
    sold si mi4 si8 la sold mi
    sold si re4 dod?8 si la si'
    la sol4 fad16 mi fad sol la8 r re,

    %86
    mi re4 dod8 re la4 si8
    la sol4 fad16 mi fad sol la8 r re,
    mi re4 dod8\mbreak re4\fermata r

}

IvlIIn = \relative do'' {

    la8
    la la la sol fad mi re la'
    la la la sol la sol fad re'
    dod[si16 la si8 sold] la si dod16 si dod re

    %4
    dod8 si16 la si8 sold la4 r8 sol'?
    fad[mi16 re mi8 dod] re mi fad16 mi fad sol
    fad8[mi16 re mi8 dod] re4 r8 re

    %7
    re mi fad4 si,8[ la16 sold dod8 si]
    la4 sold\mbreak la4 r8 la %% inizio ripresa
    la la la sol? fad  mi re la'

    %10
    la la la la sol4 r8 si
    si si si la sold fad mi si'
    si si si si la4 r8 sol'?

    %13
    fad mi4 re16 dod re8[dod16 si la8 la]
    si4 la8 sol fad4 r8 sol
    fad mi4 re16 dod re4 r8 fad

    %16
    sol fad4 mi8\mbreak fad4 r %% fine ripresa
    R1*14
    r2 r4 r8 la

    %32
    la la la la la la la la\mbreak
    la la la la sol sol sol sol
    si si si si si si si si

    %35
    si si si si la la la la
    fad' fad fad fad dod dod dod dod
    re re re re mi sol~sol16 fad mi8~

    %38
    mi16 re dod8~dod16 si la8~la16 mi' fad sol fad8 mi
    re4 dod re r
    R1*16

    %56
    r2 fad,8 si re4
    fad8 mi re dod fad, si re4
    fad8 mi re fad, si red fad4

    %59
    red8 dod si fad' si, red fad4
    mi r8 si la dod mi4
    dod8 si la mi'\mbreak la, dod mi4

    %62
    re r8 re16 mi fad dod re mi fad dod re mi
    fad4 dod re r8 mi
    fad mi4 re8 dod4 r

    %65
    fad,8\p fad fad fad fad fad fad fad
    sol sol sol sol sol sol sol sol
    sold sold sold sold\mbreak sold sold sold sold

    %68
    la la la la la la la la
    lad lad lad lad lad lad lad lad
    si si si si si si si si

    %71
    si si si si si si si si
    la la mi dod la4 r
    fad'8(la re fad,) sol\parentSlur (si re sol,)

    %74
    fad(la re fad,) sol(si re sol,)
    fad(la re fad,) sol4 r8 re
    sol,4 la re r

    %77
    la'16 re, re' re, la' re, re' re, si' re, re' re, si' re, re' re,
    la' re, re' re, la' re, re' re, si' re, re' re, si' re, re' re,
    la' re, re' re, la' re, re' re, si' la si dod re8 sol,

    %80
    fad4 mi re r8 la' %% inizio ripresa
    la la la sol? fad  mi re la'
    la la la la sol4 r8 si

    %83
    si si si la sold fad mi si'
    si si si si la4 r8 sol'?
    fad mi4 re16 dod re8[dod16 si la8 la]

    %86
    si4 la8 sol fad4 r8 sol
    fad mi4 re16 dod re4 r8 fad
    sol fad4 mi8\mbreak fad4\fermata r

}

Ivlan =  \relative do' {

    fad8
    fad fad fad sol re4 r8 fad
    fad fad fad sol re4 r8 la'
    la mi mi mi mi4 r8 la

    %4
    la mi mi mi mi4 r8 re'
    re la la la la4 r8 re
    re la la la la4 r8 la

    %7
    si4. dod8 mi,4 r8 mi
    mi4 mi\mbreak mi4 la8 sol %% inizio ripresa
    fad sol la4 fad8 sol la4

    %10
    fad8 sol la fad re4 r
    sold8 la si4 sold8 la si4
    sold8 la si sold mi4 r

    %13
    la8 la la la la4 r8 la
    mi si' mi, mi re4 r8 si
    la' la, la la la4 r8 la

    %16
    si si la la\mbreak la4 r %fine ripresa
    R1*14
    r2 r4 r8 fad'

    %32
    fad fad fad fad fad fad fad fad\mbreak
    fad fad fad fad re re re sol
    sold sold sold sold sold sold sold sold

    %35
    sold? sold sold sold mi mi mi mi
    la la la la  la la la la
    la la la la  la la la la

    %38
    la la la la  la la la la
    la4 la la r
    R1*16

    %56
    r2 re,8 fad si4
    si r8 re, re fad si4
    si r8 fad fad si red4

    %59
    red? r8 fad, fad si red4
    si4 r8 mi, mi la dod4
    dod r8 mi,\mbreak mi la dod4

    %62
    la r8 la la la la la
    la4 la la r8 la
    la si si si mi,4 r

    %65
    re8\p re re re re re re re
    re re re re re re re re
    mi mi mi mi\mbreak mi mi mi mi

    %68
    mi mi mi mi mi mi mi mi
    fad fad fad fad fad fad fad fad
    fad fad fad fad fad fad fad fad

    %71
    sol sol sol sol sol sol sol sol
    la la mi dod la4 r
    re8 \parentSlur (fad la fad) re \parentSlur (sol si sol)\mbreak

    %74
    re(fad la fad) re(sol si sol)
    re(fad la re,) sol,4 r8 re'
    sol,4 la re r

    %77
    fad8 fad fad fad sol sol sol sol
    fad fad fad fad sol sol sol sol
    fad fad fad fad sol4 r8 sol,

    %80
    re'4 la re r8 fad
    fad sol la4 fad8 sol la4
    fad8 sol la fad re4 r

    %83
    sold8 la si4 sold8 la si4
    sold8 la si sold mi4 r
    la8 la la la la4 r8 la

    %86
    mi si' mi, mi re4 r8 si
    la' la, la la la4 r8 la
    si si la la\mbreak la4\fermata r

}

Ibcn = \relative do {

    re8
    re mi fad mi re mi fad mi
    re mi fad mi re mi fad re
    la' la sold mi la4 r8 re,

    %4
    la' la sold mi la4 r8 sol
    re' re, dod la re4 r8 re
    re'8 re, dod la re4 r8 re'16 dod

    %7
    si8 dod si la sold4 r8 mi
    la4 mi\mbreak la8 sol? fad re  %% inizio ripresa
    re mi fad mi re mi fad mi

    %10
    re mi fad re sol la si sol
    mi fad sold fad mi fad sold fad
    mi fad sold mi la si la sol?

    %13
    re la' la la re, fad fad fad
    sol sol la la re, re re sol
    re la' la la re, re re re

    %16
    sol, sol la la\mbreak re mi fad mi %% fine ripresa
    re4 dod re8 mi fad mi
    re fad sol sold la sol? fad re

    %19
    sol4 fad mi8 re dod la
    re4 r8 re la' si dod sold
    la4 sold la8 mi fad dod

    %22
    la'4 sold la8 mi fad re
    mi fad sold fad mi re dod si
    la dod si la mi 'fad sold fad

    %25
    mi si' la[la,]\mbreak mi' fad sold mi
    si' mi, la red, mi mi' dod la
    si la si re mi re mi sold,

    %28
    la sold la la, re' dod re re,
    mi fad sold la si dod re mi
    fad,4. si8 sold4. la8

    %31
    mi4 mi, la8[la'16 sol? fad8 re]
    re re re re re re re re\mbreak
    re re re re sol sol sol sol

    %34
    mi mi mi mi mi mi mi mi
    mi mi mi mi la, la la la
    la la la la la la la la

    %37
    la la la la la la la la
    la la la la la la la la
    re4 la re8 mi fad  dod

    %40
    re4 r re r\mbreak  %%% OOKK
    re4 r re8 mi fad mi
    re4 r re r

    %44
    la r la r
    si r sold r
    mi'8 fad sold mi la si dod la

    %47
    re4 r dod r
    si r\mbreak la r
    sold4 r8 mi la si dod la

    %50
    re,4. re8 mi4. mi8
    mi mi mi mi mi mi mi mi
    mi mi mi mi re re re re

    %53
    mi mi mi mi fad fad fad fad
    si,4 r si r
    mi r\mbreak fad r

    %56
    si,8 si si si si si si si
    si si fad'[fad,] si dod re dod
    si dod re dod si dod re dod

    %59
    si dod re dod si dod red dod
    si dod red dod si dod red si
    mi fad sol mi la, si dod si

    %62
    la si dod si\mbreak  la si dod la
    re4 r8 la' re, la' re, la'
    re,4 la re r8 la

    %65
    re sol sol sold la sol? fad mi
    re4 r r2
    R1*6

    %72
    r8 la' mi dod la la' dod, la
    re4 r sol, r\mbreak
    re' r sol, r

    %75
    re' r sol, r
    r2 re'16[re' dod si la sol fad mi]
    re4 r r2

    %78
    R1*2
    r2 r4 r8 re  %% inizio ripresa
    re mi fad mi re mi fad mi

    %82
    re mi fad re sol la si sol
    mi fad sold fad mi fad sold fad
    mi fad sold mi la si la sol?

    %85
    re la' la la re, fad fad fad
    sol sol la la re, re re sol
    re la' la la re, re re re

    %88
    sol, sol la la\mbreak re4\fermata r

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s1*6
    <6+>1
    s4 <_+> s2 %ripresa
    s1*14
    s2 <7>
    s <_+>
    s1
    s8 <7> s <7> s2
    s <_+>
    s1
    <_+>
    s1*3
    s4 <7-> s2
    <_+>1
    s4 <7> s2
    <6 4> <5 3>
    <6 4> <7 5>
    s1*11
    s2 <_+>
    s <_+>
    <6 4+> <6>
    s <_+>
    s1
    s2 <_+>
    s1*3
    s2 <_+>

}

forma = {

    \key re\major
    \time 4/4
    \tempo 2 = 55
    \partial 8 s8
    s1*88
    \bar"|."

}

Iob = {
    \Iglobal
    \notypeset
    <<\Iobn \forma>>

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

IIobn = \relative do'' {

    re8[fa16 sol la8 fa] fa\tr mi r la,
    mi'[sol16 la sib8 sol] sol\tr fa r fa
    mi la re, sib' dod,4 r8 la'

    %4
    fad sol16 la do,?8 la' sib16 la sol8~sol16 fa mi re
    mi8 fa16 sol do,8 sol' la16 sol fa8~fa16 mi re do\mbreak
    si sold' si8 re, si do16 mi la la, si8.\tr la16

    %7
    la4 r8 la' fad mib16 re do8 sib?16 la
    sib8 la16 sol sol'4~sol16 fa?32 mib re16 sol, la8.\tr sol16
    sol4 r8 sol' mi? re16 do sib8 la16 sol

    %10
    la8 sol16 fa fa'4~fa16 mi32 re do16 fa, sol8. fa16\mbreak
    fa4 r8 la re[fa16 sol la8 fa]
    fa\tr mi r la, mi'[sol16 la sib8 sol]

    %13
    sol fa r la sib, la16 sol sol'8 la16 sib
    sol,4~sol16 dod mi sol fa8 mi16 re dod8. re16
    sol,4~sol16 dod mi sol fa8 mi16 re dod8. re16

    %16
    re1\fermata

}

IIbcn = \relative do {

    re8 mi fa re la si dod si
    la mi' sol la, re mi fa re
    dod do si sib la la' dod, la

    %4
    re mi fad re sol la sib sol
    do, re mi do fa sol la la,\mbreak
    sold' mi si' sold la la, mi'[mi,]

    %7
    la si do la re mib? fad re
    sol la sib la sol sol, re' re,
    sol' la sib sol do, re mi do

    %10
    fa sol la sol fa fa, do'[do,]\mbreak
    fa' mi re dod re mi fa re
    la si dod si la mi' sol la,

    %13
    re mi fa re sol, la sib sol
    la si dod la re sol la la,
    mi' re dod la re sol la la,

    %16
    re1\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6 4>
    <5 3>4 s8 <7> <5 4>4 s8 <3>
    s2 <_+>
    <_+>1
    s
    s
    s2 <_+>
    s1*4
    <6 4>2 s4 s8 <7>
    <6 4>4 s8 <5 3> s2
    <7>1
    s4 s8 <7>

}

forma = {

    \key re\minor
    \time 4/4
    \tempo 4 = 35
    s1*16
    \bar"|."

}

IIob = {
    \IIglobal
    %\notypeset
    <<\IIobn \forma>>

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
}

IIIobn = \relative do'' {

   R1.*15
   r2. r4. r8 r la\solo
   re fad mi re dod si la re dod si la sol

   %18
   fad4 sol8 la4 si8 la4 re,8 r r re'
   fad mi re fad mi re la' sol fad mi fad re
   dod4 re8 mi4 fad8 mi la, si dod re mi

   %21
   <<
      {
         \tupletSpan 4. \tuplet 4/3 { fad8 re dod re si [re dod re]} sold,8 sold la si dod re
         \tuplet 4/3 { mi8 dod si dod la [dod si dod]} fad,8 fad sold la si dod
         \tuplet 4/3 { re8 si la si sold si la si]}
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
         \set Staff.midiInstrument = #"oboe"\override TupletBracket #'bracket-visibility = ##f
         \key re\major  \senza \tuplet 2/3 { fad'16^\markup\italic"manoscritto" [re dod re^2] si [re dod re]} sold,8 sold la si dod re
         \tuplet 2/3 { mi16 dod si dod^2 la dod si dod } fad,8 fad sold la si dod
         \tuplet 2/3 { re16 [si la si\parenthesize ^2] sold[si la si] }
      }
   >> mi,4. r8 r mi'

   %24
   mi fad mi mi fad mi mi sold si mi, sold si
   re, mi re re mi re re sold si re, sold si
   dod, mi la si, mi sold la sold fad mi fad re\mbreak

   %27
   dod si la si4.\tr la4 r8 r4.
   R1.*9
   la8\solo mi' re dod si la si re dod si la sold

   %38
   la dod si la sold fad mi4. r
   re'8 dod si la sold fad\mbreak mi si' si fad si si
   sold si si fad si si mi, si' si fad si si

   %41
   sold si si fad si si mi,4. r
   mi'8 re dod si la sold fad dod' dod sold dod dod
   la dod dod sold dod dod fad, dod' dod sold dod dod

   %44
   la dod dod sold dod dod fad,4. r
   fad'8 dod fad la4 dod,8 re fad si mi, fad si
   mi, si mi sold4 si,8\mbreak dod mi la dod, mi la

   %47
   re, la re fad4 la,8 si re sold si, re sold
   la sold fad~ \parenthesize fad4 dod8 la' sold fad ~fad4 dod8
   re dod si~si4 fad'8 sold dod, si la sold fad

   %50 OOKK
   dod' fad sold dod, la' sold fad4 r8 r4.
   R1.*6
   r2. r4. r8 fad,\solo sold

   %58
   la dod fad~fad dod si\mbreak la dod fad~fad dod si
   la fad la dod la dod fad4.  r
   si,8 re fad~fad re dod si re fad~fad re dod

   %61
   si fad si re si re fad4. r8 r fad
   sol mi si'~si la sol fad re la'~la sol fad
   mi dod sol'~sol fad mi re si fad'~fad mi re

   %64
   dod4 fad,8 r r dod'\mbreak si fad' fad dod fad fad
   re fad fad dod fad fad si, fad' fad dod fad fad
   re fad fad dod fad fad si,4.~si8 re16 dod si8

   %67
   fad' re16 dod si8 fad' re16 dod si8 si' re, si dod4.\tr
   si4 r8 r4. r2.
   R1.*5

   %74
   do4.\solo~do8 la si do fad la do, si la
   si sol la si4 r8 re4.~re8 si dod?
   re sold si re, dod si dod la si dod4 r8

   %77
   mi4.~mi8 dod mi\mbreak fad sol? la fad mi re
   dod mi la mi re dod re fad la fad mi re
   dod mi la mi re dod re fad la fad mi re

   %80
   dod si la r4. re, <<
      {
         \tupletSpan 4. \tuplet 4/3 { r8 fad mi re}
         la'4 la8  \tuplet 4/3 { la dod si la } re4 re8 \tuplet 4/3 { re8 fad mi re}
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
         \set Staff.midiInstrument = #"oboe"\override TupletBracket #'bracket-visibility = ##f
         \key re\major  \senza \tuplet 2/3 { r16^\markup\italic"manoscritto" fad,^2  [mi re]}
         la'4 la8 \tuplet 2/3 { la16^2 [dod si la] } re4 re8 \tuplet 2/3 {re16^2[fad mi re] }
      }
   >>
   si'4. la, si8 la sol sol' fad mi

   %83
   la, sol fad fad' mi re sol, fad mi mi' re dod
   fad, mi re re' dod si\mbreak la si dod~dod re mi~
   mi fad sol~sol fad mi fad la sol fad mi re

   %86
   mi4.\tr~\parenthesize mi4 re8 re4. r
   R1.*10
   R1.^\markup\center-align {\musicglyph #"scripts.ufermata"}

}

IIIvlIn =  \relative do'' {

   re4 r8 mi re dod re4 r8 si4 r8
   la4 r8 sol4 r8 fad mi re r re' mi
   fad mi re fad mi re la'4 r8 la,4 r8

   %4
   re4. si\tr dod8 si la fad' mi red
   mi4 mi,8 mi' re? dod re4 mi,8 re' dod si
   dod4 mi,8 dod' si la si4 mi,8 fad' mi red

   %7
   mi fad sold la4 la8 la sold fad mi fad re?\mbreak
   dod si la si4.\tr la r4.
   re,8 la' re mi, la re fad, la re mi, la re

   %10
   re,4 do'8 do4 do8 si la sol r4.
   mi8 si' mi fad, si mi sold, si mi fad, si mi
   mi,4 re'8 re4 re8 dod si la si'4.

   %13
   la8 sol fad sol4. fad8 mi re si4.
   la8 sol fad sol4. fad8 mi re re'4 re8\mbreak
   re4 re8 re mi dod re dod si la si sol

   %16
   fad4. mi re r
   R1.*10
   r2. la'4\tu r8 si la sold

   %28
   la4 r8 fad'4 r8 mi4 r8 re4 r8
   dod si la r la' si dod si la dod si la
   mi'4 r8 mi,4 r8 la, mi' la si, mi la

   %31
   dod, mi la si, mi la la,4 sol'?8 sol4 sol8
   fad mi re r4.  si8 fad' si dod, fad si
   red, fad si dod, fad si\mbreak si,4 la'8 la4 la8

   %34
   sold fad mi fad4. mi8 re dod re4.
   dod8 si la la'4 la8 la4 la8 la si sold
   la sold fad mi fad re dod4. si

   %37
   la4. r r2.
   R1.*12
   r2. fad'4 r8 sold fad mid

   %51
   fad4 r8 re4 r8 dod4 r8 si4 r8\mbreak
   la sold fad r fad' sold la sold fad la sold fad
   dod'4 r8 dod,4 r8 si'4.~si8 la sold

   %54
   la sold fad r4. dod~dod8 si la
   re4.~re8 dod si dod4.~dod8 si la
   re4.~re8 dod si dod fad mi re dod si

   %57
   la sold fad dod'4 dod,8 fad4. r
   R1.*10
   si4\tu r8 dod lad fad si4 r8 sol'4 r8

   %69
   fad4 r8 mi4 r8 re dod si r si dod
   re dod si re dod si fad'4 r8 fad,4 r8\mbreak
   re'4 r8 mi re dod re4 r8 si4 r8

   %72
   la4 r8 sol4 r8 fad mi re r re' mi
   fad mi re fad mi re la'4. la,
   R1.*12

   %86
   r2. re,8 la' re mi, la re
   fad, la re mi, la re re,4 do'8 do4 do8
   si la sol r4. mi8 si' mi fad, si mi

   %89
   sold, si mi fad, si mi mi,4 re'8 re4 re8
   dod si la si'4. la8 sol? fad sol4.
   fad8 mi re si4. la8 sol fad sol4.\mbreak

   %92
   fad8 mi re re'4 re8 re4 re8 re mi dod
   re dod si la si sol fad4. mi
   re4 la'8 re4 re8 re4 re8 re mi dod

   %95
   re dod si la4 sol8 fad4. mi
   re4 fad'8 mi4 mi8 fad4 re'8 re4 dod8
   re4.\fermopz r r2.\fermata

}

IIIvlIIn = \relative do'' {

   fad4 r8 sol fad mi fad4 r8 sol4 r8
   mi4 r8 dod4 r8 re4 r8 r fad sol
   la sol fad la sol fad mi4 r8 la,4 r8

   %4
   re4. si\tr dod8 si la fad' mi red
   mi4 mi,8 mi' re? dod re4 mi,8 re' dod si
   dod4 mi,8 dod' si la si4 mi,8 fad' mi red

   %7
   mi fad sold la4 la8 la sold fad mi fad re?\mbreak
   dod si la si4.\tr la r4.
   re,8 la' re mi, la re fad, la re mi, la re

   %10
   re,4 do'8 do4 do8 si la sol r4.
   mi8 si' mi fad, si mi sold, si mi fad, si mi
   mi,4 re'8 re4 re8 dod si la si'4.

   %13
   la8 sol fad sol4. fad8 mi re si4.
   la8 sol fad sol4. fad8 mi re re'4 re8\mbreak
   re4 re8 re mi dod re dod si la si sol

   %16
   fad4. mi re r
   R1.*10
   r2. dod'4\tu r8 re dod si

   %28
   dod4 r8 re4 r8 si4 r8 sold4 r8
   la4 r8 r dod re mi re dod mi re dod
   si4 r8 sold4 r8 la mi' la si, mi la

   %31
   dod, mi la si, mi la la,4 sol'?8 sol4 sol8
   fad mi re r4.  si8 fad' si dod, fad si
   red, fad si dod, fad si\mbreak si,4 la'8 la4 la8

   %34
   sold fad mi fad4. mi8 re dod re4.
   dod8 si la la'4 la8 la4 la8 la si sold
   la sold fad mi fad re dod4. si

   %37
   la4. r r2.
   R1.*12
   r2. la'4 r8 si la sold

   %51
   la4 r8 fad4 r8 sold4 r8 mid4 r8\mbreak
   fad4 r8 r la si dod si la dod si la
   sold4 r8 sold4 r8 sold4.~sold8 fad mid

   %54
   fad4. r la,~la8 sold fad
   si4.~si8 la sold la4.~la8 sold fad
   si4.~si8 la sold la fad' mi re dod si

   %57
   la sold fad dod'4 dod,8 fad4. r
   R1.*10
   re'4\tu r8 mi dod! lad re4 r8 mi4 r8

   %69
   dod4 r8 lad4 r8 si4 r8 r re mi
   fad mi re fad mi re dod4 r8 lad4 r8\mbreak
   fad'4 r8 sol fad mi fad4 r8 sol4 r8

   %72
   mi4 r8 dod4 r8 re4 r8 r fad sol
   la sol fad la sol fad mi4. dod
   R1.*12

   %86
   r2. re,8 la' re mi, la re
   fad, la re mi, la re re,4 do'8 do4 do8
   si la sol r4. mi8 si' mi fad, si mi

   %89
   sold, si mi fad, si mi mi,4 re'8 re4 re8
   dod si la si'4. la8 sol? fad sol4.
   fad8 mi re si4. la8 sol fad sol4.\mbreak

   %92
   fad8 mi re re'4 re8 re4 re8 re mi dod
   re dod si la si sol fad4. mi
   re4 la'8 re4 re8 re4 re8 re mi dod

   %95
   re dod si la4 sol8 fad4. mi
   re4 re'8 re4 dod8 re4 fad8 mi4 mi8
   fad4.\fermata r r2.\fermata

}

IIIvlan =  \relative do' {

   la'4 r8 si4 r8 la4 r8 sol4 r8
   la4 r8 la,4 r8 la4 r8 la'4 r8
   la4 r8 la4 r8 la dod,re mi re dod

   %4
   sold'4. sold mi si'
   sold4 r8 sold4 r8  sold4 r8 sold4 r8
   la4 r8 la4 r8 sold4 r8 dod4 r8

   %7
   si4 r8 la4 fad8 red4. si'\mbreak
   mi, sold mi8 sold fad mi re dod
   re4 r8 mi4 r8 fad4 r8 mi4 r8

   %10
   re fad sol? la sol fad re4 r8 re do? si
   mi4 r8 fad4 r8 sold4 r8 fad4 r8
   mi4 r8 si' la sold mi4 r8 sol?4 r8

   %13
   fad4 r8 mi4 r8 re4 r8 sol4 r8
   fad4 r8 mi4 r8 re4. r\mbreak
   fad8 la fad sol si mi, la4 si8 mi,4.

   %16
   re dod re r
   R1.*10
   r2. mi4 r8 fad4 r8

   %28
   mi4 r8 re4 r8 mi4 r8 mi4 r8
   mi4. r8 r mi mi4 r8 mi4 r8
   mi4 r8 si4 r8 la'4 r8 si4 r8

   %31
   dod4 r8 si4 r8 la[sol? fad mi re dod]
   la'[dod si la sol fad] si4 r8 dod4 r8
   red4 r8 dod4 r8\mbreak si8 la sold? fad mi red

   %34
   si'4. re,4 r8 dod4 r8 si4 r8
   la4. r dod' mi,8 fad sold
   mi4 fad8 si4 r8 la4 r8 sold4 r8

   %37
   la4 r8 r4. r2.
   R1.*12
   r2. dod4 r8 re4 r8

   %51
   dod4 r8 dod4 r8 mid,4 r8 mid4 r8\mbreak
   dod4 r8 dod4 r8 dod4 r8 dod4 r8
   mid4 r8 mid4 r8 mid4 r8 mid4 r8

   %54
   dod4. r fad2.~
   fad~fad~
   fad~fad8 fad mi re dod si

   %57
   la' sold fad dod'4 dod,8 fad4. r\mbreak
   R1.*10
   fad4 r8 sol4 r8 fad4 r8 mi4 r8

   %69
   fad4 r8 fad4 r8 fad4 r8 fad4 r8
   fad4 r8 fad4 r8 fad4 r8 fad4 r8\mbreak
   la?4 r8 si4 r8 la4 r8 sol4 r8

   %72
   la4 r8 la,4 r8 la4 r8 la4 r8
   la4 r8 la4 r8 dod4 r8 la4 r8
   R1.*12

   %86
   r2. re4 r8 mi4 r8
   fad4 r8 mi4 r8 re4 r8 la' sol fad
   re4. re8 do? si mi4 r8 fad4 r8

   %89
   sold4 r8 fad4 r8 mi4 r8 si' la sold
   mi4 r8 sol?4 r8 fad4 r8 mi4 r8
   re4 r8 sol4 r8 fad4 r8 mi4 r8\mbreak

   %92
   re4. r fad8 la fad sol si mi,
   la4 si8 mi,4. re dod
   re4 \parenthesize re,8 r4. fad'8 la fad sol si mi,

   %95
   la4 si8 mi,4. re dod
   re4 la'8 la4 la8 la4 la8 la4 la8
   la4.\fermata r r2.\fermata

}

IIIbcn = \relative do {

   re4 r8 sol,4 la8 re4 r8 sol4 r8
   dod,4 r8 la4 r8 re re' re, re re' re,
   re4 r8 re4 r8 dod la si dod si la

   %4
   si' la si sold fad mi la4 r8 la4 r8
   mi4 r8 mi4 r8 mi4 r8 mi4 r8
   mi4 r8 mi4 r8 mi4 r8 la4 r8

   %7
   sold4 r8 fad4 red8 si4. sold\mbreak
   la mi' la,8 mi' re dod si la
   re4 r8 mi4 r8 fad4 r8 mi4 r8

   %10
   re la' sol fad mi re sol4 re8 si la sol
   mi'4 r8 fad4 r8 sold4 r8 fad4 r8
   mi si' la sold fad mi la4 r8 sol4 r8

   %13
   fad4 r8 mi4 r8 re4 r8 sol4 r8
   fad4 r8 mi4 r8 re4. r\mbreak
   re8[re' do si sol la] fad4 sol8 dod,4.

   %16
   re4 sol8 la4 la,8 re la' sol fad sol mi
   re4. r re r
   re4 mi8 fad4 dod8 re la' sol fad mi fad

   %19
   re4 r8 re4 r8 dod4 r8 sold4 r8
   la4 si8 dod4 re8 la4. la'4 r8
   re4 r8 sold,4 r8\mbreak mi4. r

   %22
   dod' fad, re r
   si' mi, dod8 la' si dod si la
   sold4. sold sold sold

   %25
   sold? sold sold sold
   la mi la, sold\mbreak
   la mi' la, re4 mi8

   %28
   la,4 r8 re4 r8 sold,4 r8 mi4 r8
   la la' la, la la' la, la la' la, la la' la,
   sold mi' mi, mi mi' sold la4 r8 si4 r8

   %31
   dod4 r8 si4 r8 la mi' re dod si la
   re[la sol fad mi re] si'4 r8 dod4 r8
   red4 r8 dod4 r8\mbreak si fad mi red dod si

   %34
   mi4 r8 re?4 r8 dod4 r8 si4 r8
   la4. r la'8 mi' re dod re mi
   dod4 re8 sold,4 r8 la4 r8 mi4 r8

   %37
   la,4. r mi' r
   la, r mi'8 [si' la sold fad mi]
   si4.  red\mbreak mi4 r8 fad4 r8

   %40
   sold4 r8 fad4 r8 mi4 r8 fad4 r8
   sold4 r8 fad4 r8 mi si' la sold fad mi
   dod'4. mid, fad4 r8 sold4 r8

   %43
   la4 r8 sold4 r8 fad4 r8 sold4 r8
   la4 r8 sold4 r8 fad dod' si la sold fad
   la4 r8 fad4 r8 si4 r8 si4 r8

   %46
   sold4 r8 mi4 r8\mbreak la4 r8 la4 r8
   fad4 r8 re4 r8 sold4 r8 mid4 r8
   fad4 r8 fad4 r8 fad4 r8 fad4 r8

   %49
   si4 r8 re4 r8 mid,4 r8 fad4 si8
   dod4 r8 dod,4 r8 fad4 r8 si4 dod8
   fad,4 r8 fad4 r8 mid4 r8 dod4 r8\mbreak

   %52
   fad fad, fad' fad fad, fad' fad4 r8 fad4 r8
   mid sold dod mid, sold dod mid, sold dod mid, sold dod
   fad, la dod fad, la dod fad, la dod fad, la dod

   %55
   fad, si re fad, si re fad, la dod fad, la dod
   fad, si re fad, si re fad,\clef tenor fad' mi re dod si
   la sold fad dod'4 \clef bass dod, 8fad4. fad

   %58
   fad fad\mbreak fad fad
   fad fad fad8 dod' si lad sold fad
   si4. si si si

   %61
   si si si8 si dod re dod si
   mi,4. mi re re
   dod dod si si

   %64
   fad'8 dod 'si lad sold fad\mbreak si4 r8 dod4 r8
   re4 r8 dod4 r8 si4 r8 dod4 r8
   re4 r8 dod4 r8 si4 r8 si,4 r8

   %67
   si4 r8 si4 r8 si4 r8 fad'4 r8
   si,4 r8 mi4 fad8 si,4 r8 mi4 r8
   lad,4 r8 fad4 r8 si si' si, si si' si,

   %70
   si4 r8 si4 r8 fad'4 r8 fad,4 r8\mbreak
   re'4 r8 sol,4 la8 re4 r8 sol4 r8
   dod,4 r8 la4 r8 re re' re, re re' re,

   %73
   re4 r8 re4 r8 la'4 r8 la,4 r8
   r fad' mi re fad sol la4. fad
   sol8 si, la sol4 r8 \parenthesize r sold' fad mi sold la

   %76
   si4. sold la8 dod, si la4.
   r8 la' si dod la dod\mbreak re4 r8 re,4 r8
   la'4 r8 la,4 r8 re'4 r8 re,4 r8

   %79
   la'4 r8 la,4 r8 re'4 r8 re,4 r8
   la' mi re dod si la re4 r8 re4 r8
   dod4 r8 dod4 r8 si4 r8 si4 r8

   %82
   la la' sol fad mi re sol4 r8 mi4 r8
   fad4 r8 re4 r8 mi4 r8 dod4 r8
   re4 r8 sold,4 r8\mbreak la4 r8 la4 r8

   %85
   la4 r8 la4 r8 re4 r8 re,4 r8
   la''4 r8 la,4 r8 re4 r8 mi4 r8
   fad4 r8 mi4 r8 re la' sol fad mi re

   %88
   sol re do si la sol mi'4 r8 fad4 r8
   sold4 r8 fad4 r8 mi si' la sold fad mi
   la4 r8 sol?4 r8 fad4 r8 mi4 r8

   %91
   re4 r8 sol4 r8 fad4 r8 mi4 r8\mbreak
   re4. r re8 re' do si sol la
   fad4 sol8 dod,4. re4 sol8 la4 la,8

   %94
   re4 re,8 r4. re'8 re' do si sol la
   fad4 sol8 dod,4. re4 sol8 la4 la,8
   re4 re8 la'4 la,8 re4 re8 la'4 la,8

   %97
   re4.\fermata r r2.\fermata  %%%%% OOKK

}

IIIbfn = \figures {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s1.*3
   s2. s4. <6 4+>
   <_+>2. <7>
   <6 4> <_+>4. <6 4+>
   <6>2. <7>
   s1.*2
   s4. <6 5-> s2.
   s1.
   s4. <6  5> s2.
   s1.*12
   <6 5>1.
   s1.*8
   <_+>1.
   s1.*18
   s2. <6 5>
   s s
   <6 4> <5 3>
   <6 4> <5 3>
   s1.*17
   s8 <6 5-> s s4. <_-> <6 5->
   s2. s8 <6 5> s s4.
   s <6 5> s2.
   s1.*8
   s4. <7> s s
   s1.*10
   s4. <5 4>4 <3>8 s4. <5 4>4 <3>8

}

forma = {

   \key re\major
   \time 12/8
   \tempo 2. = 60
   s1.*97
   \bar"|."

}

IIIob = {
   \IIIglobal
   %\notypeset
   <<\IIIobn \forma>>

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

    \header {
        title = \markup\smaller {"Concerto per Hubois (!) [RV 453]"}
        composer = \markup \center-column{"   ""A. Vivaldi (1678-1741)"}
    }

    \markup\huge "[1.] All[egr]o"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"H[a]u[t]bois"}
                \Iob
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
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

        \new ChoirStaff <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois"}
                \IIob
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \IIbc
            >>
        >>

        \layout {

            indent = 1.5\cm
            #(layout-set-staff-size 18)

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #6
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

\bookpart {

    \paper  {

        systems-per-page = #4

    }

    \markup\huge "[3.] All[egr]o"

    \score {

        \new ChoirStaff  \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1.5
        } <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"oboe"
                \set Staff.instrumentName = \markup \center-column{"Hautbois"}
                \IIIob
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \IIIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.5\cm

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
