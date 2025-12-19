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
      \musicglyph "scripts.prall"}}

%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f

}

IvlIn = \relative do'' {

    do16
    do8. [sol16 sol8. mi16] mi8. [do16 do8. mi'16]
    mi8.[sol16 sol8. do,16] do8(si) r8. do16
    do8. [sol16 sol8. mi16] mi8. [do16 do8. mi'16]

    %4
    mi8.[sol16 sol8. do,16]  sol,4 r8 r32 sol'' \parentSlur (fa mi)
    la8.[la16 la8. do,16] do8(re) r8 r32 re \parentSlur (do si)
    sol'8.[sol16 sol8. si,16] si8(do) r8 r32 do \parentSlur (si la)\mbreak

    %7
    fa'8.[fa16 fa8. la,16] la8(si) r8. sol16\parenthesize \p
    sol8.[si16 si8. re16] re8.[fa,16 fa8. si16]\parenthesize \mf
    si8.[re16 re8. mi16] fa8.[si,16 si8. sol'16]\mbreak  %% fine p. 2

    %10
    sol8.[fa16 fa8. mi16] mi4 r8. sol16\p
    sol8.[fa16 fa8. mib16] mib8.[re16 re8. sol16]
    sol8.[fa16 fa8. mib16] mib8.[re16 re8. do16]\mbreak

    %13
    do8.[sol16 sol8.mi16] mi8.[do16 do8. mi'16]
    mi8.[sol16 sol8. do,16] do4(si8) sol'\parenthesize \p
    la16 si la sol fa sol fa mi re mi re do si do si la\mbreak

    %16
    sol la sol fa mi fa mi re \once\stemUp do8 mi' fa re
    do4 r8 sol'\f la16 si la sol fa sol fa mi
    re mi re do si do si la sol la sol fa mi fa mi re\mbreak

    %19
    \once\stemUp do8 mi' fa re do4 r8. do16\parenthesize \f
    do8. [sol16 sol8. mi16] mi8.[do16 do8. mi'16]
    mi8.[sol16 sol8. do,16] do8(si) r8. sib'16\parenthesize \p\mbreak

    %22
    sib?8.[la16 la8. sol16] sol8.[fa16 fa8. fa16]
    fa8.[mib16 mib8. re16] re8(dod) r8. la'16\f
    re,4~re8. do?16 si?4~si8. sol'16\mbreak

    %25
    do,4~do8. sib16 la4~la8. fa'16
    sib,4~sib8. la16 sol4~sol8. mi'16
    la,4~la8. sol16  fa4 r8. la16\mbreak

    %28
    la4~la8. sib16 la4~la8. sib16
    la8.[la'16 sol8. fa16] sol4 mi
    re r8. la16\parenthesize \p la4~la8. sib16\mbreak

    %31
    la4~la8. sib16 la8.[la'16 sol8. fa16]
    sol4 mi re r8. re16\parenthesize \f
    re8.[la16 la8. fa16] fa8.[re16 re8. fa'16]\mbreak

    %34
    fa8.[la16 la8. re,16] re8(dod) r16 la si dod
    re mi fa sol la8 re, sib'4 r16 sol, la sib
    do? re mi fa sol8 la, la'4 r16 fa, sol la\mbreak

    %37
    sib do re mi fa8 sib, sol'4 r16 mi, fa sol
    la si? dod re mi8 la, fa'4 r8. fa16\p
    fa8.[mi16 mi8. re16] re8. [do?16 do8. fa16]\mbreak

    %40
    fa8.[mi16 mi8. re16] re8.[do16 do8. sold'16\f]
    la si la sol? fa sol fa mi re mi re do si do si la
    sold8 la' si sold la4 r8 sold\p\mbreak

    %43
    la16 si la sol? fa sol fa mi re mi re do si do si la
    sold8 la si sold la4 r8. la'16\f
    la8.[mi16 mi8. do16] do8.[la16 la8. do'16]\mbreak

    %46
    do8.[mi16 mi8. la,16] la8(sold) r8 sold
    la4. sol?16 fa mi re dod si la8 sol'
    fad do'?(si la) r4 r8 fad!\mbreak

    %49
    sol4. fa?16 mi re do si la sol8 fa'
    mi sib'(la sol) r4 r8 mi
    fa4. mib?16 re do sib la sol fa8 mib'!\mbreak

    %52
    re mi? fa4~fa mi8 re
    do4 la'~la sol?8 fad
    sol4 r16 si, dod red mi fad sol la si8 mi,\mbreak

    %55
    do'4 r16 la, si do re mi fad sol la8 re,
    si'4 r16 sol, la si do re mi fad sol8 do,
    la'4 r16 fad, sol la si dod red mi fad8 si,\mbreak

    %58
    sol'4 r8. si16\p si8.[la16 la8. sol16]
    sol8.[fad16 fad8. si16] si8.[la16 la8. sol16]
    sol8. fad16 fad8 si\f sol mi fad red\mbreak

    %61
    mi4 r8. do16 do8.[sol16 sol8. mi16]
    mi8. [do16 do8. mi'16] mi8.[sol16 sol8. do,16]
    si4 r8. sol'16\p sol8. [fa16 fa8. mib16]\mbreak

    %64
    mib8.[re16 re8. sol16] sol8.[fa16 fa8. mib16]
    mib?8.[re16 re8. re16\f] re8.[re16 re8. mi?16]
    fa8.[fa16 fa8. mi16] re8.[re16 re8. mi16]\mbreak

    %67
    fa8.[fa16 fa8. mi16] re4 r8 sol
    la16 si la sol fa sol fa mi re mi re do si do si la
    sol la sol fa mi fa mi re \once\stemUp do8 mi' fa re

    %70
    do4 r8 sol'\p la16 si la sol fa sol fa mi
    re mi re do si do si la sol la sol fa mi fa mi re\mbreak
    \once\stemUp do8 mi' fa re do2\fermata

    %73
    sol'2\parenthesize \f  fad
    sol1\fermata

}

IvlIIn = \relative do'' {

    sol16
    sol8.[mi16 mi8. do16] do8.[sol16 sol8. do'16]
    do8.[mi16 mi8. mi16] mi8(re) r8. sol,16
    sol8.[mi16 mi8. do16] do8.[sol16 sol8. do'16]

    %4
    do8.[mi16 mi8. sol,16] sol,4 r8 r32 sol'' \parentSlur (fa mi)
    la8.[la16 la8. do,16] do8(re) r8 r32 re \parentSlur (do si)
    sol'8.[sol16 sol8. si,16] si8(do) r8 r32 do \parentSlur (si la)\mbreak

    %7
    fa'8.[fa16 fa8. la,16] la8(si) r4
    r2 r4 r8. sol16\parenthesize \mf
    sol8.[si16 si8. re16] re8. [sol,16 sol8. si16]\mbreak

    %10
    si8.[re16 re8. do16] do4 r8. mib16\p
    mib?8.[re16 re8. do16] do8.[si16 si8. mib!16]
    mib?8.[re16 re8. do16] do8.[si16 si8. sol16\f]\mbreak

    %13
    sol8.[mi16 mi8. do16] do8.[sol16 sol8. do'16]
    do8.[mi16 mi8. mi16] mi4(re)
    r la'16\parenthesize \p si la sol fa sol fa mi re mi re do\mbreak

    %16
    si do si la sol la sol fa mi8 do' re si
    do4 r r la'16\f si la sol
    fa sol fa mi re mi re do si do si la sol la sol fa\mbreak

    %19
    mi8 do' re si do4 r8. sol16\f
    sol8.[mi16 mi8. do16] do8.[sol16 sol8. do'16]
    do8.[mi16 mi8. mi16] mi8(re) r8. sol16\parenthesize \p\mbreak

    %22
    sol8.[mi16 mi8. mi16] la,8.[la16 la8. la16]
    sib8.[sib16 sib8. sib16] mi,?4 r8. re'16\f
    la4~la8. la16 sol4~sol8. re'16\mbreak

    %25
    sol,4~sol8. sol16 fa4~fa8. do'16
    fa,4~fa8. fa16 mi4~mi8. dod'16
    mi,4~mi8. mi16 re4 r8. fa16\mbreak

    %28
    fa4~fa8. sol16 fa4~fa8. sol16
    fa8.[fa'16 mi8. re16] mi4 dod
    re r8. fa,16\parenthesize \p fa4~fa8. sol16\mbreak

    %31
    fa4~fa8. sol16  fa8.[fa'16 mi8. re16]
    mi4 dod re r8. fa,16\parenthesize \f
    la8.[fa16 fa8. re16] re8.[la16 la8. re'16]\mbreak

    %34
    re8.[fa16 fa8. fa16] fa8(mi) r4
    re1
    do\mbreak

    %37
    sib?
    la2. r8. re16\p
    re8.[si16 si8. si16] mi,8.[mi16 mi8. si'16]

    %40
    re8.[si16 si8. si16] mi,8.[mi16] mi4
    r la'16\f si la sol fa sol fa mi re mi re do
    si8 do re si do4 r\mbreak

    %43
    r la'16\p si la sol fa sol fa mi re mi re do
    si8 do re si la4 r8. mi'16\f
    mi8.[do16 do8. la16] la8.[mi16 mi8. la'16]\mbreak

    %46
    la8.[do16 do8. do16] do8(si) r4
    r2 r4 r8. dod,16
    re4. do?16 si la sol fad mi re8 do'\mbreak

    %49
    si8 fa'?(mi re) r4 r8 si
    do4. sib16 la sol fa mi re do8 sib'
    la mib'\parentSlur (re do) r4 r8 do\mbreak

    %52
    sib4 do si2
    la4 do si2
    si4 r mi2~\mbreak

    %55
    mi2 re~
    re do~
    do si~\mbreak

    %58
    si4 r8. sol'16\p sol8.[fad16 fad8. mi16]
    mi8.[red16 red8. sol16] sol8.[fad16 fad8. mi16]
    mi8.[red16 red8. red16]\f mi8 sol, la fad\mbreak

    %61
    sol4 r8. sol16 sol8.[mi16 mi8. do16]
    do8.[sol16 sol8. do'16] do8.[mi16 mi8. mi16]
    re4 r8. mib16\p mib8.[re16 re8. do16]\mbreak

    %64
    do8.[si16 si8. mib16] mib8.[re16 re8. do16]
    do8.[si16 si8. si16\f] si8.[si16 si8. do16]
    re8.[re16 re8. do16] si8.[si16 si8. do16]\mbreak

    %67
    re8.[re16 re8. do16] si4 r
    r la'16 si la sol fa sol fa mi re mi re do
    si do si la sol la sol fa mi8 do' re si\mbreak

    %70
    do4 r r la'16\parenthesize \p si la sol
    fa sol fa mi re mi re do si do si la sol la sol fa\mbreak
    mi8 do're si do2\fermata

    %73
    do\parenthesize \f re
    re1\fermata

}

Ivlan = \relative do' {

    mi16
    mi8.[do16 do8. sol16]sol8.[mi16 mi8. sol'16]
    sol8.[sol16 sol8. sol16] sol4 r8. mi16
    mi8.[do16 do8. sol16] sol8.[mi16 mi8. sol'16]\mbreak

    %4
    sol8.[sol16 sol8. sol16] si,4 r
    r la'2 fa4
    re sol2 mi4\mbreak

    %7
    do fa2 re4
    si8.[re16 re8. fa16]fa8.[si,16 si8. re16]
    re8.[fa16 fa8. si16] si8.[re,16 re8. re16]\mbreak

    %10
    re8.[si'16 si8. sol16] sol4 r8. do,16\p
    do8.[do16 do8. do16] sol'8.[sol,16 sol8. sol16]
    do8.[do16 do8. do16] sol'8.[sol,16 sol8. mi'?16\f]\mbreak

    %13
    mi8.[do16 do8. sol16] sol8.[mi16 mi8. sol'16]
    sol8.[sol16 sol8. sol16] sol4 sol
    r2 si,4\parenthesize \p si\mbreak

    %16
    r2 sol8 sol' la sol
    mi8.\f[fa16 sol8. mi16] do4 r
    si si r2\mbreak

    %19
    sol8\footnote #' (-1 . 2) \markup\column\smaller {"  ""Possible mistake in the autograph, corrected by G. F. Malipiero"  "  "}   \parenthesize sol'\parenthesize la\parenthesize sol mi4 r8. mi16\f
    mi8.[do16 do8. sol16] sol8.[mi16 mi8. sol'16]
    sol8.[sol16 sol8. sol16] sol4 r8. dod,16\p\mbreak

    %22
    dod?8.[dod16 dod8. dod16] re8.[re16 re8. re16]
    sol,8.[sol16 sol8. sol16] la4 r8. re16\f
    re4~re8. re16 re4~re8. si16\mbreak

    %25
    do4~do8. do16 do4~do8. la16
    sib4~sib8. sib16 si4~si8. sol16
    la4~la8. la16 la4 r8. fa'16\mbreak

    %28
    fa8.[sol16 la8. mi16] fa8.[sol16 la8. mi16]
    fa4 r8. la16 sib4 la
    fa r8. fa16\parenthesize \p fa8.[sol16 la8. mi16]\mbreak

    %31
    fa8.[sol16 la8. mi16] fa4 r8. la16
    sib4 la fa r8. fa16\f
    fa8. [re16 re8. la16] la8.[fa16 fa8. la'16]\mbreak

    %34
    la8.[la16 la8. la16] la4 mi
    la fa re sib
    sol' mi do la\mbreak

    %37
    fa' re sib sol
    mi' dod la r8. sold16\p
    sold?8.[sold16 sold8. sold16] la8.[la16 la8. sold16]\mbreak

    %40
    sold8.[sold16 sold8. sold16] la8. la16 la8 si\f
    do4 r la r
    mi'8 mi fa mi mi4 r\mbreak

    %43
    do\p r la r
    mi'8 mi fa mi do4 r8. do'16\f
    do8.[la16 la8. mi16] mi8.[do16 do8. mi16]\mbreak

    %46
    mi8.[mi16 mi8. mi16] mi8 sold si sold
    r dod, mi dod r mi mi dod
    r la la fad r la la fad\mbreak

    %49
    r re' re si r re re si
    r sol sol mi r sol sol mi
    r do' do la r do do la\mbreak

    %52
    fa' sol la4 re,4. mi8
    mi2 fad
    mi4 red si' sol\mbreak

    %55
    mi do la' fad
    re si sol' mi
    do la fad' red\mbreak

    %58
    si4 r8. mi16\p mi8.[mi16 mi8. mi16]
    si'8.[si,16 si8. si16] mi8.[mi16 mi8. mi16]
    si'8.[si,16 si8. fad'?16\f] sol8 si, do si\mbreak

    %61
    si4 r8. mi16 mi8.[do16 do8. sol16]
    sol8.[mi16 mi8. sol'16] sol8.[sol16 sol8. sol16]
    sol4 r8. do,16\parenthesize \p  do8.[do16 do8. do16]\mbreak

    %64
    sol'8.[sol,16 sol8. sol16] do8.[do16 do8. do16]
    sol'8.[sol,16 sol8. sol16] sol8.[sol16 sol8. sol16]
    si8.[si16 si8. sol16] sol8.[sol16 sol8. sol16] \mbreak

    %67
    si8.[si16 si8. sol16] sol8.[si'16 do8. mi,16]
    do4 r si si
    r2 sol8 sol' la sol\mbreak

    %70
    mi8.[fa16\p sol8. mi16] do4 r
    si si r2\mbreak
    sol8 sol' la sol mi2\fermata

    %73
    mi\parenthesize \f  la
    sol1\fermata

}


Ibcn = \relative do {

    do16
    do8.[do16 do8. do16] do8.[do16 do8. do16]
    do8.[do16 do8. do16] sol'4 sol,8. do16
    do8.[do16 do8. do16] do8.[do16 do8. do16]

    %4
    do8.[do16 do8. do16] sol'8.[fa16 mi8. do16]
    fa8.[sol16 la8. fa16] si8.[la16 si8. sol16]
    si8.[la16 si8. sol16] la8.[sol16 la8. fa16]

    %7
    la8.[sol16 la8. fa16] sol8.[fa16 sol8.  sol,16]
    sol'8.[fa16 sol8.  sol,16] sol'8.[fa16 sol8.  sol,16]
    sol'8.[fa16 sol8.  sol,16] sol'8.[fa16 sol8.  sol,16]

    %10
    sol'8.[fa16 sol8.  sol,16] do4 r
    R1
    r2 r4 r8. do16\parenthesize \f

    %13
    do8.[do16 do8. do16] do8.[do16 do8. do16]
    do8.[do16 do8. do16] sol'4 sol,
    r2 sol'4\parenthesize \p sol,\mbreak  %% fine p. 3

    %16
    r2 do8 do fa, sol
    do8.\f [re16 mi8. do16] fa4 r
    sol sol, r2\mbreak

    %19
    do8 do fa, sol do4 r8. do16\f
    do8.[do16 do8. do16] do8.[do16 do8. do16]
    do8.[do16 do8. do16] sol'8 sol, r4\mbreak

    %22
    R1
    r2 r4 r8. re'16\parenthesize \f
    fad8.[mi16 fad8. re16] sol8.[la16 sol8. fa?16]\mbreak

    %25
    mi8.[re16 mi8. do16] fa8.[sol16 fa8. mi16]
    re8.[do16 re8. sib?16] mi8.[fa16 mi8. re16]
    dod8.[si?16 dod8. la16] re4 r8. re16\mbreak

    %28
    re8.[mi16 fa8. dod16] re8.[mi16 fa8. dod16]
    re4 r8. re16 sol,4 la
    re r8. re16  re8.[mi16 fa8. dod16] \mbreak

    %31
    re8.[mi16 fa8. dod16] re4 r8. re16
    sol,4 la re, r8. re'16\parenthesize \f
    re8.[re16 re8. re16] re8.[re16 re8. re16]\mbreak

    %34
    re8.[re16 re8. re16] la'8 la, la' sol
    fa mi fa re sol la sib sol
    mi re mi do fa sol la fa\mbreak

    %37
    re do re sib mi fa sol mi
    dod si! dod la re4 r
    R1\mbreak

    %40
    r2 r4 r8 mi^\f
    la,4 r re r
    mi8 la re, mi la, la' si mi,^\p\mbreak

    %43
    la,4 r re r
    mi8 la re, mi la,4 r8. la16\f
    la8.[la16 la8. la16] la8.[la16 la8. la16]\mbreak

    %46
    la8.[la16 la8. la16] mi'8 mi sold mi
    r la, dod la r la dod la
    r re fad re r re fad re\mbreak

    %49
    r sol, si sol r sol si sol
    r do mi do r do mi do
    r fa la fa r fa la fa\mbreak

    %52
    sib,4 la sold2
    la2 red
    mi8 mi, si'' la sol fad sol mi\mbreak

    %55
    la si do la fad mi fad re
    sol la si sol mi re mi do
    fad sol la fad red dod red si\mbreak

    %58
    mi4 r r2
    R1
    r4 r8 si\parenthesize \f mi mi la, si\mbreak

    %61
    mi,4 r8. do'16 do8. [do16 do8. do16]
    do8. [do16 do8. do16] do8. [do16 do8. do16]
    sol'4 r r2\mbreak

    %64
    R1
    r4 r8. sol,16\parenthesize \f sol8.[sol16 sol8. sol16]
    sol8.[sol16 sol8. sol16] sol8.[sol16 sol8. sol16]\mbreak

    %67
    sol8.[sol16 sol8. sol16] sol8.[sol'16 mi8. do16]
    fa4 r sol sol,
    r2 do8 do fa, sol\mbreak

    %70
    do8.[re16\p mi8. do16] fa4 r
    sol sol, r2\mbreak
    do8 do fa, sol do,2\fermata

    %73
    do'1\parenthesize \f
    si\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s16
    s1*4
    s2 <7>
    <6> <7>
    <6> <7>
    s1*17
    s4 s8. <7->16 s2
    <6->1
    s
     s4 s8. <7->16  s4 s8. <7->16
     s1
     s2  s4 s8. <7->16
      s4 s8. <7->16 s2
      s1*2
      s2 <_+>
      s <_->
      s1
      <6->
      s1*2
      s2 s4 s8 <7>
      s1
      <_+>2 s4 s8 <_+>
      s1*3
      s2 <_+>
      s1
      s8 <7 _+> s4 s2
      s8 <7> s4 s2
      s8 <7-> s4 s2
      s8 <7-> s4 s2
      <3>8 <6 4> <6>4 <7!>2
      s2 <6 5>
      s4 <_+> s2
      s1*18
      s2 <6 4+ 2>

}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 60
    \partial 16 s16
    s1*72
    \bar"||"
     \once \override Score.RehearsalMark.extra-offset = #'(7 . -2)
    \mark\markup \huge"[2.] Adagio"
    \tempo 4 = 50
    s1*2
    \bar "|."

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

    do'8\parenthesize \f sol mi do~do4
    sol'8 re si sol~sol4
    do8 sol mi do~do4

    %4
    sol' r8 la16\parentSlur (si do re mi fa)\mbreak
    sol8 mi do sol~sol4
    la'8 fa re la~la4

    %7
    sol8 la16\parentSlur (si do re mi fa) sol8 si,
    do2 r4
    do'8\p sol mi do~do4

    %10
    sol'8 re si sol~sol4
    do8 sol mi do~do4
    sol' r8 la16\parentSlur (si do re mi fa)\mbreak

    %13
    sol8 mi do sol~sol4
    la'8 fa re la~la4
    sol8 la16\parentSlur (si do re mi fa) sol8 si,

    %16
    do2 r4
    do8\f mi sol mi do' do,
    sol si re si sol' sol,

    %19
    do, mi sol mi do' do,\mbreak
    sol' si re si sol' si,
    sol do mi do sol' sol,

    %22
    la re fa re la' la,
    si sol re' si sol' si,
    do16 si do re do si do re do si do re\mbreak

    %25
    mi re mi fa mi re mi fa mi re mi fa
    sol fa sol la sol fa sol la sol fa mi re
    do si do re do si do re do re mi fa\mbreak

    %28
    sol fa sol la sol fa sol la sol fa mi re
    do si do re do si do re mi fa sol mi
    la sol la si la sol la si la sol fa mi\mbreak

    %31
    re do re mi re do re mi re mi fa sol
    mi do si la sol fa mi re do4
    sol''8 r sol r sol r

    %34
    sol r sol r sol r\mbreak
    sol r sol r sol r
    sol r sol r sol r

    %37
    sol r sol r sol r
    la r la r la r
    re, r re r re r\mbreak

    %40
    mi do(mi sol sib4)~
    sib la2~
    la4 sol2~

    %43
    sol4 fa2~
    fa8 si,(re fa sol4)~\mbreak
    sol8 do,(mi sol sib4)

    %46
    la8 do,(fa sol la4)~
    la8 si,(re fa sol fa)
    mi do16(re mi8) mi16 (fa sol4)

    %49
    r8 do,16(re mi8) mi16(fa sol4)\mbreak
    r8 si,?16(do re8) re16(mi fa4)
    r8 la,16(si do8) do16 (re mi4)

    %52
    r8 si16(do re8) re16(mi fa8) re
    mi do16(re mi8) mi16(fa sol4)\mbreak
    r8 la,16(si do8) re16(mi fa4)

    %55
    r8 si,16(do re8) re16(mi fa8) sol
    mi16 do' sol do sol do sol do sol do sol do
    sol do sol do sol do sol do sol do sol do\mbreak

    %58
    sol do sol do sol do sol do sol do sol do
    sol do sol do sol do sol do sol do sol do
    sol si sol si  sol si sol si  sol si sol si \mbreak

    %61
    sol do sol do sol do sol do sol do sol do
    re, do' re, do' re, do' re, do' re, do' re, do'
    re, si' re, si' re, si' re, si' re, si' re, si'

    %64
    do8 sol4 mi do8
    do' sol4 mi do8
    sol' re4 si sol8

    %67
    do la4 mi do8\mbreak
    sol' re4 si sol8
    sol'' mi4 do sol8

    %70
    la' fa4 re la8
    re si4 sol re8
    mi do mi sol do4

    %73
    r4 sol'\p lab
    \appoggiatura sib8 lab?4 sol2
    \appoggiatura lab8 sol4 fa2~

    %76
    fa4 mib8(re) do(si)
    sol'4(mib) do\mbreak
    lab'(fa) reb

    %79
    si lab'(sol8) fa
    do(re mib fa sol4)
    do,8(re mib fa sol4)

    %82
    do,8(re mib fa sol4)\mbreak
    do,8(re mib fa sol4)
    si,8(do re mib fa sol)

    %85
    do,(re mib fa sol4)
    do,8(re mib fa sol lab)
    si,8\parentSlur (do re mib fa sol)\mbreak

    %88
    mib4(re) do
    lab'(sol) fad
    sol(fa?) mi

    %91
    fa(mib!) re
    mib8(re do4) si\mbreak
    do2.~

    %94
    do~
    do4 reb8(do) si4
    do sol'(mib)

    %97
    do\tr sol'(mib)\mbreak
    do\tr sol'(mib)
    do\tr sol'(mib)

    %100
    do\tr sol'(mib)
    do\tr sol'(mib)
    do\tr lab'(do,)\mbreak

    %103
    si8 lab'(sol fa mib re)
    mib(re do si) do4
    lab'8(sol fad re do fad)

    %106
    sol(fa? mi do sib mi)
    fa(mib! reb si do re?)\mbreak
    sol,(si re fa mib re)

    %109
    sol(fa mib do si do)
    lab'(sol fa mib re do)
    si do do4.\tr si8

    %112
    do\parenthesize \f sol' mi do~do4
    sol'8 re si sol~sol4
    do8 la mi do~do4

    %115
    sol' r8 la16\parentSlur (si do re mi fa)\mbreak
    sol8 mi do sol~sol4
    la'8 fa re la~la4

    %118
    sol8 la16\parentSlur (si do re mi fa) sol8 si,
    do2 r4
    do16 mi, sol, mi' do' mi, sol, mi' do' mi, sol, mi'

    %121
    do' re, sol, re' do' re, sol, re' do' re, sol, re'
    si' re, sol, re' si' re, sol, re' si' re, sol, re'\mbreak
    \acciaccatura <mi sol,>8 <do' mi,>2.

    %124
    do16 mi, sol, mi' do' mi, sol, mi' do' mi, sol, mi'
    do' re, sol, re' do' re, sol, re' do' re, sol, re'
    si' re, sol, re' si' re, sol, re' si' re, sol, re'\mbreak

    %127
    \acciaccatura <mi sol,>8 <do' mi,>2.\fermata

}

IIvlIIn = \relative do'' {

    do'8\parenthesize \f sol mi do~do4
    sol'8 re si sol~sol4
    do8 sol mi do~do4

    %4
    sol' r8 la16\parentSlur (si do re mi fa)\mbreak
    sol8 mi do sol~sol4
    la'8 fa re la~la4

    %7
    sol8 la16\parentSlur (si do re mi fa) sol8 si,
    do2 r4
    do'8\p sol mi do~do4

    %10
    sol'8 re si sol~sol4
    do8 sol mi do~do4
    sol' r8 la16\parentSlur (si do re mi fa)\mbreak

    %13
    sol8 mi do sol~sol4
    la'8 fa re la~la4
    sol8 la16\parentSlur (si do re mi fa) sol8 si,

    %16
    do2 r4
    do8\f mi sol mi do' do,
    sol si re si sol' sol,

    %19
    do, mi sol mi do' do,\mbreak
    sol' si re si sol' si,
    sol do mi do sol' sol,

    %22
    la re fa re la' la,
    si sol re' si sol' si,
    do16 si do re do si do re do si do re\mbreak

    %25
    mi re mi fa mi re mi fa mi re mi fa
    sol fa sol la sol fa sol la sol fa mi re
    do si do re do si do re do re mi fa\mbreak

    %28
    sol fa sol la sol fa sol la sol fa mi re
    do si do re do si do re mi fa sol mi
    la sol la si la sol la si la sol fa mi\mbreak

    %31
    re do re mi re do re mi re mi fa sol
    mi do si la sol fa mi re do4
    r8 sol'' r sol r sol

    %34
    r sol r sol r sol\mbreak
    r sol r sol r sol
    r sol r sol r sol

    %37
    r sol r sol r sol
    r la r la r la
    r re, r re r re\mbreak

    %40
    do sol(do mi sol4)
    mi4. do8(mi la)
    re,4. si8(re sol)

    %43
    do,4. la8(do fa)
    si,? sol si re si sol\mbreak
    do2.~

    %46
    do
    si!
    do8(mi16 fa sol8) sol16(la sib4)

    %49
    r8 mi,16(fa sol8) sol16(la sib4)\mbreak
    r8 re,16(mi fa8) fa16(sol la4)
    r8 do,16(re mi8) mi16(fa sol4)

    %52
    r8 sol,16(la si8) si16(do re8) si
    do mi16(fa sol8) sol16(la sib4)\mbreak
    r8 fa,16(sol la8) si16(do re4)

    %55
    r8 sol,16(la si8) si16(do re8) si
    do16 sol' mi sol mi sol mi sol mi sol mi sol
    mi sol mi sol mi sol mi sol mi sol mi sol\mbreak

    %58
    re sol re sol re sol re sol re sol re sol
    do, sol' do, sol' do, sol' do, sol' do, sol' do, sol'
    si, sol' si, sol' si, sol' si, sol' si, sol' si, sol'\mbreak

    %61
    do, sol' do, sol' do, sol' do, sol' do, sol' do, sol'
    do, la' do, la' do, la' do, la' do, la' do, la'
    si, sol' si, sol' si, sol' si, sol' si, sol' si, sol'\mbreak

    %64
    mi8 mi4 do sol8
    sol' mi4 do sol8
    re' si4 sol re8

    %67
    la' mi4 do la8\mbreak
    si' sol4 re si8
    mi' do4 sol mi8

    %70
    do' re4 la fa8
    si sol4 re si8
    do do mi sol do4

    %73
    do2.\p
    re
    do

    %76
    si
    do\mbreak
    reb

    %79
    re!
    mib2 r4
    do8(re mib fa sol4)

    %82
    do,8(re mib fa sol4)\mbreak
    do,8(re mib fa sol4)
    si,8(do re mib fa sol)

    %85
    do,(re mib fa sol4)
    do,8(re mib fa sol lab)
    si,8\parentSlur (do re mib fa sol)\mbreak

    %88
    mib4(re) do
    mib2 re4
    re2 do4

    %91
    do2 fa4
    sol8(fa mib4) re\mbreak
    sol(mib) do

    %94
    lab'(fa) do~
    do reb8(do) si4
    do r sol'(

    %97
    mib) do\tr sol'(\mbreak
    mib) do\tr sol'(
    mib) do\tr sol'(

    %100
    mib) do\tr sol'(
    mib) do\tr sol'
    lab do,\tr lab'\mbreak

    %103
    re,8 lab'(sol fa mib re)
    mib(re do si) do4
    lab'8(sol fad re do fad)

    %106
    sol(fa? mi do sib mi)
    fa(mib! reb si do re?)\mbreak
    sol,(si re fa mib re)

    %109
    sol(fa mib do si do)
    lab'(sol fa mib re do)
    si do do4.\tr si8

    %112
    do\parenthesize \f sol' mi do~do4
    sol'8 re si sol~sol4
    do8 la mi do~do4

    %115
    sol' r8 la16\parentSlur (si do re mi fa)\mbreak
    sol8 mi do sol~sol4
    la'8 fa re la~la4

    %118
    sol8 la16\parentSlur (si do re mi fa) sol8 si,
    do2 r4
    do16 mi, sol, mi' do' mi, sol, mi' do' mi, sol, mi'

    %121
    do' re, sol, re' do' re, sol, re' do' re, sol, re'
    si' re, sol, re' si' re, sol, re' si' re, sol, re'\mbreak
    \acciaccatura <mi sol,>8 <do' mi,>2.

    %124
    do16 mi, sol, mi' do' mi, sol, mi' do' mi, sol, mi'
    do' re, sol, re' do' re, sol, re' do' re, sol, re'
    si' re, sol, re' si' re, sol, re' si' re, sol, re'\mbreak

    %127
    \acciaccatura <mi sol,>8 <do' mi,>2.\fermata

}

IIvlan = \relative do' {

    mi4\parenthesize \f  mi mi
    re re re
    do do do

    %4
    si2 r4
    do do mi
    re re fa

    %7
    si, si re
    mi2 r4
    mi4\p  mi mi

    %10
    re re re
    do do do
    si2 r4

    %13
    do do mi
    re re fa
    si, si re

    %16
    mi2 r4
    mi4\f  mi mi
    re re re

    %19
    do do do
    si2 r4
    do do mi

    %22
    re re fa
    re re re
    mi2 r4

    %25
    sol sol sol
    re re re
    fa fa fa

    %28
    si,2 r4
    sol' sol sol
    re re re

    %31
    si si si
    do2 r4
    mi  mi mi

    %34
    re re re
    do do do
    si2 r4

    %37
    do' do do
    do do do
    si si si

    %40
    sol2 mi4
    sol la do
    fa, sol si

    %43
    mi, fa la
    \footnote #' (-1 . 2) \markup\column\smaller {" ""See first movement note 1. "" "} \parenthesize re,2 r4
    sol2.

    %46
    re~
    re2 si4
    sol2 r4

    %49
    sol' mi mi\mbreak
    fa re re
    mi do do

    %52
    re2 r4
    sol sol mi\mbreak
    do do la'

    %55
    re, re si
    sol2 r4
    sol' sol sol

    %58
    sol sol sol
    sol sol sol
    sol2 r4\mbreak

    %61
    sol sol sol
    fa fa la
    si sol sol\mbreak

    %64
    sol2 r4
    mi mi mi
    re re re

    %67
    mi mi mi\mbreak
    si2 r4
    mi mi mi

    %70
    la la la
    sol sol sol,
    sol2 r4

    %73
    do'\p do do
    si sib sib
    la? lab lab

    %76
    sol2 r4
    mib mib mib
    fa fa fa

    %79
    sol sol sol
    do,2 r4
    do' do do

    %82
    si sib sib
    la lab lab
    sol2 r4

    %85
    mib mib mib
    fa fa fa
    sol sol sol

    %88
    do,2 r4
    do' do do
    si si sib

    %91
    la la lab
    sol2 r4
    mib mib mib

    %94
    fa fa fa
    sol sol sol
    do,2 r4

    %97
    do' do do
    si sib sib
    la lab lab

    %100
    sol2 r4
    mib mib mib
    fa fa fa

    %103
    sol sol sol
    do,2 r4
    do' do do

    %106
    si sib sib
    la lab lab
    sol2 r4

    %109
    mib mib mib
    fa fa fa
    sol sol sol

    %112
    mi\parenthesize \f mi mi
    re re re
    do do do

    %115
    si2 r4
    do do mi
    re re re

    %118
    re re re
    mi2 r4
    sol, sol sol

    %121
    sol sol sol
    sol sol sol
    sol2 r4

    %124
    sol sol sol
    sol sol sol
    sol sol sol

    %127
    sol2.\fermata

}


IIbcn = \relative do {

    do'4\parenthesize \f  do do
    si si si
    la la la

    %4
    sol2 r4\mbreak
    mi mi mi
    fa fa fa

    %7
    sol sol sol
    do,2 r4
    do'4 \p do do

    %10
    si si si
    la la la
    sol2 r4\mbreak

    %13
    mi mi mi
    fa fa fa
    sol sol sol

    %16
    do,2 r4
    do'4 \f do do
    si si si

    %19
    la la la
    sol2 r4\mbreak
    mi mi mi

    %22
    fa fa fa
    sol sol sol
    do,2 r4\mbreak

    %25
    do'4 do do
    si si si
    la la la

    %28
    sol2 r4\mbreak
    mi mi mi
    fa fa fa

    %31
    sol sol sol
    do,2 r4
    do'4 do do

    %34
    si si si
    la la la
    sol2 r4\mbreak

    %37
    mi mi mi
    fa fa fa
    sol sol sol

    %40
    do,2 r4
    do'4 do do
    si si si

    %43
    la la la
    sol2 r4\mbreak
    mi mi mi

    %46
    fa fa fa
    sol sol sol
    do,2 r4

    %49
    do'4  do do
    si si si
    la la la

    %52
    sol2 r4\mbreak
    mi mi mi
    fa fa fa

    %55
    sol sol sol
    do,2 r4
    do'4 do do

    %58
    si si si
    la la la
    sol2 r4\mbreak

    %61
    mi mi mi
    fa fa fa
    sol sol sol

    %64
    do,2 r4
    do'4 do do
    si si si

    %67
    la la la
    sol2 r4\mbreak
    mi mi mi

    %70
    fa fa fa
    sol sol sol
    do,2 r4

    %73
    do'\p do do
    si sib sib
    la? lab lab

    %76
    sol2 r4
    mib mib mib
    fa fa fa

    %79
    sol sol sol
    do,2 r4
    do' do do

    %82
    si sib sib
    la lab lab
    sol2 r4

    %85
    mib mib mib
    fa fa fa
    sol sol sol

    %88
    do,2 r4
    do' do do
    si si sib

    %91
    la la lab
    sol2 r4
    mib mib mib

    %94
    fa fa fa
    sol sol sol
    do,2 r4

    %97
    do' do do
    si sib sib
    la lab lab

    %100
    sol2 r4
    mib mib mib
    fa fa fa

    %103
    sol sol sol
    do,2 r4
    do' do do

    %106
    si sib sib
    la lab lab
    sol2 r4

    %109
    mib mib mib
    fa fa fa
    sol sol sol

    %112
    do do do
    si si si
    la la la

    %115
    sol2 r4\mbreak
    mi mi mi
    fa fa fa

    %118
    sol sol sol
    do,2 r4
    do do do

    %121
    sol' sol sol
    sol, sol sol\mbreak
    do2 r4

    %124
    do do do
    sol' sol sol
    sol, sol sol

    %127
    do,2.\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*5
    <6 5>2.
    s2.*7
    <6 5>2.
    s2.*7
    <6 5>2.
    s2.*7
    <6 5>2.
    s2.*7
    <6 5>2.
    s
    s
    <7->4 <6> s
    <7> <6> s
    <7> <6> s
    <7>2.
    s2 <6 5->4
    <6 5>2.
    <9>2 <8>4
    s2.*5
    s2 <6 5->4
    s2.*8
    <6 5>4 s2
    s2.*7
    <6 5>2.
    s
    s
    s2 <6->4
    <7-> <6> s
    <7> <6> s
    <7>2.
    s
    <6 5->
    <3!>
    s2.*9
    <6->2 <4+ 2>4
    <6> s <4 2>
    <6> s <6 4>
    s2.*3
    <6 4>4 <6- 4> <3!>
    s2.*6
    <_->2.
    <_!>
    s
    <6->4 <4+ 2> s
    <6> <4! 2> s
    <6> <6 4-> <6 4!>
    <_!>2.
    s
    <_->
    <_!>4 <5 4> <3!>
    s2.*9
    <5 4>2.
    <3>
    s
    s
    <5 4>
    <3>

}

forma = {

    \time 3/4
    \key do\major
    \tempo 2 = 65
    s2.*72\break
    \key sol\minor
    s2.*39\break
    \key do\major
    s2.*16
    \bar"|."

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


global = {
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
}

IIIvlIn = \relative do'' {

   re,16 fad re re re fad re re re si' fad fad fad re' si si
   si fad' re re re si' re, re dod4 r
   si2\p re

   %4
   fad si4. re,8
   dod1\fermata\mbreak
   lad16\f dod lad lad lad dod lad lad lad mi' dod dod dod sol' mi mi

   %7
   mi lad mi mi mi dod' mi, mi re4 r
   si'2\p la
   sol fad4 mi

   %10
   re1
   dod\fermata\mbreak
   <<{si8.^\f[dod16 re8 dod] si8.[dod16 re8 dod]}\\{<fad, si,>4. s8 <fad si,>4.}>>

   %13
   si8 fad re si <<
      {
         si'8.[dod16 re8 dod]
         si8.[dod16 re8 dod]
      }\\{
         <fad, si,>4. s8
         <fad si,>4.
      }
   >> si8 dod re mi
   fad4 r16 fad-. re-. dod-. dod4(si16) la-. sol-. fad-.

   %16
   \appoggiatura fad8 sol fad~fad16 fad'-. re-. dod-. dod4(si16) la-. sol-. fad-.
   \appoggiatura fad8(mi) re r fad'\mbreak re16-. dod-. si-. sol' sol8(fad16) dod
   re16-. dod-. si-. sol' sol8(fad16)  si, lad sold fad sol' sol8(fad16) lad

   %19
   lad?8[(si16) sol fad mi re dod] re dod si8 si32(dod re dod si16) r
   si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
   si8[sol' fad16 mi re dod] si4 si'32\p(dod re dod si16) r

   %22
   si32(dod re dod si16) r si32(dod re dod si16) r\mbreak si32(dod re dod si16) r si32(dod re dod si16) r
   si8 sol\f fad16 mi re dod si fad si re, mi dod fad lad,
   si fad' si re, mi dod fad lad, si4 r

   %25
   fad''2\solo sol4.\tr(fad16 sol)
   fad4. si8 lad[si \appoggiatura {lad16[si]} dod8 si16 lad]
   \appoggiatura lad?8 si4. re16 fad, \appoggiatura fad8 sol[fad16 sol mi8 la?]

   %28
   \appoggiatura sol8 fad16 mi re4 la'8\mbreak \appoggiatura dod8 si la16 si \appoggiatura re8 dod si16 dod
   re8 fad, sol4~sol8[mi'16-.(re-. dod-. si-. la-. sol-.)]
   sol4\tr fad r8 la-.(la-. la-.)

   %31
   la16.[(si32 do16 ) si] la4~la8 do si16(la) sol(fad)
   sol32(red16. mi16 fad) mi4 r8 si'-.(si-. si-.)
   si16.(dod?32 re16) dod si4~si8[ re dod16(si) la(sold)]

   %34
   la32(mid16. fad16 sold?) fad4 dod'2
   re16(dod si lad si4)\mbreak mid2
   re8[mi!16(re) dod(si) la(sold)] la32[(fad16.)] si32(sold16.) \appoggiatura{fad16[sold]} sold4\tr

   %37
   fad4 mid'8(fad) la,32[(fad16.)] si32(sold16.) sold4\tr
   fad2 \senza \tuplet 3/2 {
      si,16(re) fad si[(fad) re]  si(re) fad si[(fad) re]
      si(mi) sol si[(sol) mi] si(mi) sol si[(sol) mi] dod mi sol la[mi dod] la dod mi la[mi dod]

      %40
      re fad la re[la fad] re fad la re[la fad]\mbreak re sol si re[si sol]  re sol si re[si sol]
      mi sold si mi[si sold] mi sold si mi[si sold] mi la dod mi[dod la] mi la dod mi[dod la]
      fad lad dod fad[dod lad] fad lad dod fad[dod lad]
   } re fad re fad, sol si sol si,

   %43
   dod16 mi' dod la  sol dod mi sol, sol8\tr fad r16 re(fad sold)
   la4~la16[sold] la32(sold) la16\mbreak sol?32(fad) sol16 fad32[(mi) fad16] mi(sold) la8\noBeam
   sol!32(fad) sol16 fad32[(mi) fad16] mi(sold) la8\noBeam re16 dod32 si la16 re, mi4\tr

   %46
   <<
      {
         <fad la,>4. s8 <fad la,>4. s8
         fad8 la, fad re <fad' la,>4. s8
         <fad la,>4.
      }\\{
         re,8.[sol'16 la8 sol] re,8.[sol'16 la8 sol]
         <la, re,>4 s re,8.[sol'16 la8 sol]
         re,8.[sol'16 la8 sol]
      }
   >> fad re fad sold

   %49
   la4 r16 la-. fad-. mi-. mi4(re16) do si la
   \appoggiatura la8 si4~si16 si'-. sold-. fad-.\mbreak fad4(mi16) re-. dod?-. si-.
   dod la re fad, sol mi la la, re dod' re fad, sol mi la la,

   %52
   re\solo re' fad re' do re, fad do' si re, sol si la re, fad la
   sol[fad mi re dod? si la sol] fad8 re r16 re' fad re'
   re8[(do16) si la sol fad mi] mi4(red16) do' si la

   %55
   sol fad mi8 r16 mi sol mi' mi8[(re?16) dod? si la sold fad]\mbreak
   fad4(mid16) re' dod si la sold fad8 r16 fad, la dod
   fad la fad dod la fad la dod re si fad re si re fad si

   %58
   sold  sid red sold sid sold red sid mid dod sold mid dod mid sold dod
   la\p [dod] dod\tr(si?32 dod) fad16[dod] dod\tr(si32 dod) la'16[dod,] dod\tr(si32 dod) fad16[dod] dod\tr(si32 dod)
   re16[re ] re\tr(dod32 re) sold4~sold16[la-.(sold-. fad-. mi?-. re-. dod-. sid-.)]\mbreak

   %61 %% inizia p.9
   dod16[dod ] dod\tr(sid32 dod) fad4~fad16[sol?-.(fad-. mi-. re-. dod-. si?-. lad-.)]
   lad?8 (si16) si si8(mid16) mid mid8 sold~sold16[sold] sold(la?32 si)
   mid,16[sold] sold(la32 si) dod,16[sold'] sold(la32 si) la16[la] la(si32 dod) fad,16[la] la(si32 dod)

   %64
   re16[re] re(mi32 fad) si,16[re] re(mi32 fad) sold,16[sold] sold \parentSlur (la32 si) mi,16[sold] sold \parentSlur (la32 si)
   dod16[dod] dod \parentSlur (re32 mi) la,16[dod] dod \parentSlur (re32 mi)\mbreak fad,16[fad] fad(sold32 la) re,16[fad] fad(sold32 la)
   sid,16[sid] sid(dod32 red) fad,16[sid] sid(dod32 red) mi,16[mi'] mi(fad32 sold) dod,16[mi] mi(fad32 sold)

   %67
   lad,16[lad'] lad(si32 dod) mi,16[lad] lad(si32 dod) re,16[si'] si(dod32 re) fad,16[si] si(dod32 re)
   do16-.[(re-. do-. si-. la-. sol-. fad-. mi-.)] red16 [red] red[(mi32 fad)] la,16[red] red(mi32 fad)
   sol,8 (sol' fad mi) red (do' si la)\mbreak

   %70 55 inizio p. 10
   mi'8[re?16-.(do?-. si-. la-. sol-. fad-.)] mi16\p[mi] mi(fad32 sol) mi16[mi] mi(fad32 sol)
   fa16[fa] fa(sol32 la) red,16[red] red(mi32 fad?) mi16[mi] mi(fad32 sol) mi16[mi] mi(fad32 sol)
   fa16[fa] fa(sol32 la) red,16[red] red(mi32 fad?) mi16[si'] si(dod!32 red) mi16[si] si(dod32 red)

   %73
   mi8 mi,16. fad32 fad4\tr mi16[si'\f] dod32(si) dod(red) mi16[si] dod32(si) dod(red)\mbreak
   mi8 sol,16. la32 fad4\tr mi8. do'16 do8(si16 ) la
   sol16 fad mi sol sol8(fad16) mi re dod! si sol' sol8(fad16) si,

   %76
   lad sold fad sol'? sol8(fad16) lad lad8 [(si16) sol fad mi re dod]
   re dod si8 si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
   si32(dod re dod si16) r si32(dod re dod si16) r si fad si re, mi dod fad lad,

   %79
   si fad' si re, mi dod fad lad, si4 r
   fad''2\solo sol4.\tr(fad16 sol)
   fad4. si8 lad16(si dod si) si(dod re dod)

   %82
   dod(re mi re) lad(si dod si) si4~si16 re32 mi fad16 mi32 re
   dod16 re lad dod si mi,32 fad sol16 fad32 mi re16 fad re lad si mi,32 fad sol16 fad32 mi
   re16 dod si8 r4 <<
      {
         <<
            {
               si''16 si si re re8(si16) la

               %85
               sol sol sol la la8 (sol16) la sol sol sol dod dod8(la16) sol
            }\\{
               fad2
               mi2~mi
            }
         >>
      }

      \new Staff \with {
         \override VerticalAxisGroup.default-staff-staff-spacing =
         #'((basic-distance . 0.5) (padding . +1))
         \remove "Time_signature_engraver"
         alignAboveContext = #"main" fontSize = #-3
         \override StaffSymbol.staff-space = #(magstep -3)
         \override StaffSymbol.thickness = #(magstep -3)
      }
      {
         \set Staff.midiInstrument = #"violin"
         \key si\minor
         <si' fad>16^\markup\italic\tiny "Execution proposed by G. F. Malipiero" <si fad> <si fad> <re fad,> <re fad,>8(<si fad>16) <la fad>
         <sol mi> <sol mi> <sol mi> <la mi> <la mi>8(<sol mi>16) <la mi>
         <sol mi> <sol mi> <sol mi> <dod mi,> <dod mi,>8(<la mi>16) <sol mi> ^\markup\italic\tiny "etc."
      }
   >>

   <<
      {
         fad fad fad sol sol8(fad16) sol fad fad fad si si8(sol16) fad
         mi mi mi fad fad8(mi16) r lad,2

         %88
         re,16 re re fad' fad8. sol16 fad-.(fad-. fad-. fad-. fad8.) sol16
         fad4sol8. la16 sol-.(sol-. sol-. sol-. sol8.) la16
         sol4 lad8. si16\mbreak lad4
      }\\{
         re,2 ~re
         dod16 dod dod re re8(dod16) si fad fad fad sol sol8(fad16) mi
         si si si re' re8. re16 re4~re8. re16
         re re dod si mi4~mi~mi8. mi16
         mi mi re dod fad4~\mbreak fad16 lad32 si dod16 dod32 re
      }
   >> mi16 lad, si dod

   %91
   re,16 si'32 dod re16 re32 mi fad16 fad, sol la sol32 la si la sol fad mi red mi fad sol fad mi re? dod si
   fad16(lad mi') sol sol8(fad16) mi re32 si dod si fad'8\noBeam\tr  re32 si dod si fad'8\tr\noBeam
   sol32 mi fad mi sold8\tr\noBeam la?32 mi fad mi lad8\tr\noBeam si si, r4

   %94
   \senza \tuplet 3/2 {
      fad16(re' si') re,[ fad, re'] fad,(re' si') re,[ fad, re']  fad,(re' si') re,[ fad, re']  fad,(re' si') re,[ fad, re']
      mid,(re' si') re,[mid, re'] mid,(re' si') re,[mid, re'] mid,(dod' si') dod,[mid, dod']  mid,(dod' si') dod,[mid, dod']
      fad,(dod' la') dod,[fad, dod'] fad,(dod' la') dod,[fad, dod'] fad,(re' la') re,[fad, re'] fad,(re' la') re,[fad, re']

      %97
      mi,?(re' sold) re [mi, re'] mi,(re' sold) re [mi, re'] mi,(dod' sold') dod, [mi, dod'] mi,(dod' sold') dod, [mi, dod']
      re,(dod' fad) dod [re, dod']  re,(dod' fad) dod [re, dod'] re,(si' fad') si,[re, si'] re,(si' fad') si,[re, si']
      red,(si' fad') si,[red, si'] red,(si' fad') si,[red, si'] mi,(si' la') si,[ mi, si'] mi,(si' la') si,[ mi, si']

      %100
      mi,(si' sol') si,[mi, si']  mi,(si' sol') si,[mi, si'] mid,(dod' sold') dod,[mid, dod'] mid,(dod' sold') dod,[mid, dod']
      mid,?(dod' si') dod,[mid, dod'] mid,(dod' si') dod,[mid, dod'] fad,(dod' lad') dod,[fad, dod'] fad,(dod' lad') dod,[fad, dod']
   }
   << <si' re,>8\\fad,>> r16 si'32\p(dod) re[(dod) si(la)] si(la) sol(fad) sol8\noBeam r16 dod32(re) mi[(re) dod(si)] dod(si) lad(sold)\mbreak

   %103
   lad8 r16 re32(mi) fad[(mi) re(dod)] re(dod) si(lad) si8 r16 si16\p si32[(dod re16)] re-. (dod)-.
   dod8(si16) mi, mi32(fad sol16) sol-.[(fad -.)] fad8(mi16) dod' dod32[(re mi16)] mi-.(re-.)
   re8(dod16) fad, fad32[(sold lad16)] lad-.(sold-.) sold8(fad16) fad si,32[(dod re16)] re16-.(si-.)

   %106
   si8(do16) sol' do,32[(re mi16)] mi-.(si-.) si8(lad16) lad' lad32[(si dod?16)] dod-.(dod-.)
   dod32[(re mi16)] mi\parenthesize -.[(mi\parenthesize -.)] mi32(fad sol16) sol\parenthesize -.[(mi\parenthesize -.)] mi8\tr re r16 fad,\f(re si)
   fad4~fad16 fad'(re si) mi,4~mi16 fad'(re si)

   %109
   re,8 si'16 dod dod4\tr si~\tuplet 3/2 { si16 fad'(mi re[dod si)] }
   fad4\tr~\tuplet 3/2 { fad16 fad'(mi re[dod si)] } mi,4\tr~\tuplet 3/2 { mi16 fad' mi re[dod si] }
   \once\stemUp re,16[si''32(dod) re(si) dod(lad)] si16 [si32(dod) re(si) dod(lad)] si8 si,16 dod <<dod4\tr\\fad,>>

   %112
   <<{si8.^\f[dod16 re8 dod] si8.[dod16 re8 dod]}\\{<fad, si,>4. s8 <fad si,>4.}>>
   si8 fad re si <<
      {
         si'8.[dod16 re8 dod]
         si8.[dod16 re8 dod]
      }\\{
         <fad, si,>4. s8
         <fad si,>4.
      }
   >> si8 dod re mi

   %115
   fad4 r16 fad-. re-. dod-. dod4(si16) la-. sol-. fad-.
   \appoggiatura fad8 sol fad~fad16 fad'-. re-. dod-. dod4(si16) la-. sol-. fad-.
   \appoggiatura fad8(mi) re r fad'\mbreak re16-. dod-. si-. sol' sol8(fad16) dod

   %118
   re16-. dod-. si-. sol' sol8(fad16)  si, lad sold fad sol' sol8(fad16) lad
   lad?8[(si16) sol fad mi re dod] re dod si8 si32(dod re dod si16) r
   si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r

   %121
   si8[sol' fad16 mi re dod] si4 si'32\p(dod re dod si16) r
   si32(dod re dod si16) r si32(dod re dod si16) r\mbreak si32(dod re dod si16) r si32(dod re dod si16) r
   si8 sol\f fad16 mi re dod si fad si re, mi dod fad lad,

   %124
   si fad' si re, mi dod fad lad, si4\fermata r

}

IIIvlIIn = \relative do'' {

   re,16 fad re re re fad re re re si' fad fad fad re' si si
   si fad' re re re si' re, re dod4 r
   si2\p re

   %4
   fad si4. re,8
   dod1\fermata\mbreak
   lad16\f dod lad lad lad dod lad lad lad mi' dod dod dod sol' mi mi

   %7
   mi lad mi mi mi dod' mi, mi re4 r
   si'2\p la
   sol fad4 mi

   %10
   re1
   dod\fermata\mbreak
   <<{si8.^\f[dod16 re8 dod] si8.[dod16 re8 dod]}\\{<fad, si,>4. s8 <fad si,>4.}>>

   %13
   si8 fad re si <<
      {
         si'8.[dod16 re8 dod]
         si8.[dod16 re8 dod]
      }\\{
         <fad, si,>4. s8
         <fad si,>4.
      }
   >> si8 dod re mi
   fad4 r16 fad-. re-. dod-. dod4(si16) la-. sol-. fad-.

   %16
   \appoggiatura fad8 sol fad~fad16 fad'-. re-. dod-. dod4(si16) la-. sol-. fad-.
   \appoggiatura fad8(mi) re r fad'\mbreak re16-. dod-. si-. sol' sol8(fad16) dod
   re16-. dod-. si-. sol' sol8(fad16)  si, lad sold fad sol' sol8(fad16) lad

   %19
   lad?8[(si16) sol fad mi re dod] re dod si8 si32(dod re dod si16) r
   si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
   si8[sol' fad16 mi re dod] si4 si'32\p(dod re dod si16) r

   %22
   si32(dod re dod si16) r si32(dod re dod si16) r\mbreak si32(dod re dod si16) r si32(dod re dod si16) r
   si8 sol\f fad16 mi re dod si fad si re, mi dod fad lad,
   si fad' si re, mi dod fad lad, si4 r

   %25
   r8 fad'\p si fad r dod mi dod
   r fad si fad r fad dod' dod
   re re fad re r dod mi dod

   %28
   r la re fad,\mbreak r re' dod sol
   fad la sol si mi, la dod mi
   re, re' re mi la, la red fad,

   %31
   r do' red fad, fad la si si
   mi, mi' mi la, si si mid sold,
   r re'! mid sold, sold si dod dod

   %34
   fad, fad' fad si, dod sold' fad dod
   si4 r8 si'\mbreak sold4. dod,8
   dod4 r8 mid fad fad dod sold

   %37
   la dod si dod fad, fad' dod[sold]
   la dod fad dod fad\p fad fad fad
   sol sol sol sol sol sol sol sol

   %40
   fad fad fad fad\mbreak re re re re
   mi mi mi mi mi mi mi mi
   fad fad fad fad fad re,\p mi[sol]

   %43
   la la, dod la re mi fad re
   dod si la[fad']\mbreak mi re dod la
   mi' re dod la fad' re la'[la,]

   %46
   <<
      {
         <fad'' la,>4. s8 <fad la,>4. s8
         fad8 la, fad re <fad' la,>4. s8
         <fad la,>4.
      }\\{
         re,8.[sol'16 la8 sol] re,8.[sol'16 la8 sol]
         <la, re,>4 s re,8.[sol'16 la8 sol]
         re,8.[sol'16 la8 sol]
      }
   >> fad re fad sold

   %49
   la4 r16 la-. fad-. mi-. mi4(re16) do si la
   \appoggiatura la8 si4~si16 si'-. sold-. fad-.\mbreak fad4(mi16) re-. dod?-. si-.
   dod la re fad, sol mi la la, re dod' re fad, sol mi la la,

   %52
   re4 r r2
   R1
   mi'8\p mi mi do? si si si red

   %55
   si sol r4 fad'8 fad fad re?\mbreak
   dod dod dod mid dod4 r
   R1*2

   %59
   dod8\p la dod fad dod la dod fad
   re re re re re4 r\mbreak
   dod8 dod dod dod dod4 r

   %62
   fad,8 si sold sold sold dod mid sold
   r dod, mid sold la2~
   la8 re, fad si sold2~

   %65
   sold8 dod, mi la\mbreak fad2~
   fad8 sid, red fad mi2~
   mi8 lad, dod mi re2

   %68
   sol4. mi8 fad fad, la red
   r si (la sol) r la'(sol fad)\mbreak
   sol4 r r8 sol,, sol sol

   %71
   la la si si do sol sol sol
   la la si si mi r sol' r

   %73
   sol r fad r sol r sol r\mbreak
   sol r fad r sol16 fad mi do' do8(si16) la
   sol16 fad mi sol sol8(fad16) mi re dod! si sol' sol8(fad16) si,

   %76
   lad sold fad sol'? sol8(fad16) lad lad8 [(si16) sol fad mi re dod]
   re dod si8 si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
   si32(dod re dod si16) r si32(dod re dod si16) r si fad si re, mi dod fad lad,

   %79
   si fad' si re, mi dod fad lad, si4 r
   r8 fad'\p si fad r dod mi dod
   r fad si fad r dod' re fad~

   %82
   fad lad, dod mi re si, re si
   lad fad' sol lad,  si fad' sol lad,
   si16 fad' si re, mi dod fad lad, si8 re'\p re re\mbreak

   %85
   si si si si dod dod dod dod
   la la la la si si si re
   lad lad r4 dod8 dod r4

   %88
   re,8 re re re re re re re
   re r si' si si si si si
   si r lad lad\mbreak lad lad fad[fad]

   %91
   fad fad fad[si] sol sol sol sol
   fad fad fad dod' re re re re
   si si dod dod re16 fad, si re, mi dod fad lad,

   %94
   si8 r re' r re r re r\mbreak
   re r re r dod r dod r
   dod r dod r re r re r

   %97
   re r  re r dod r dod r
   dod r dod r si r si r
   si r si r si r si r

   %100
   si r si r dod r dod r
   dod r dod r dod r dod r
   re16 si\p fad re si4 r16 mi' si sol mi4\mbreak

   %103
   r16 fad' dod lad fad4 r16 si fad re si4
   sol'8\p sol sol sol sol sol sol sol
   lad lad lad lad si[si] fad fad

   %106
   sol? sol sol mi' dod? dod dod dod\mbreak
   dod dod dod dod fad, fad fad fad
   fad fad fad fad mi mi mi mi

   %109
   re si' si lad si re, re re
   fad fad fad fad mi mi mi mi
   fad r fad r fad si si lad

   %112
   <<{si8.^\f[dod16 re8 dod] si8.[dod16 re8 dod]}\\{<fad, si,>4. s8 <fad si,>4.}>>
   si8 fad re si <<
      {
         si'8.[dod16 re8 dod]
         si8.[dod16 re8 dod]
      }\\{
         <fad, si,>4. s8
         <fad si,>4.
      }
   >> si8 dod re mi
   fad4 r16 fad-. re-. dod-. dod4(si16) la-. sol-. fad-.

   %116
   \appoggiatura fad8 sol fad~fad16 fad'-. re-. dod-. dod4(si16) la-. sol-. fad-.
   \appoggiatura fad8(mi) re r fad'\mbreak re16-. dod-. si-. sol' sol8(fad16) dod
   re16-. dod-. si-. sol' sol8(fad16)  si, lad sold fad sol' sol8(fad16) lad

   %119
   lad?8[(si16) sol fad mi re dod] re dod si8 si32(dod re dod si16) r
   si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
   si8[sol' fad16 mi re dod] si4 si'32\p(dod re dod si16) r

   %122
   si32(dod re dod si16) r si32(dod re dod si16) r\mbreak si32(dod re dod si16) r si32(dod re dod si16) r
   si8 sol\f fad16 mi re dod si fad si re, mi dod fad lad,
   si fad' si re, mi dod fad lad, si4\fermata r

}

IIIvlIIIn = \relative do'' {

   si,16 re si si si re si si si fad' re re re si' fad fad
   fad re' si si si fad' si, si lad4 r
   fad2\p si
   re fad4. si,8
   lad1\fermata
   fad16\f lad fad fad fad lad fad fad fad dod' lad lad lad mi' dod dod
   dod mi dod dod dod mi dod dod si4 r
   red2\p fad
   mi dod
   si1
   lad\fermata\mbreak
   <<{si8.^\f[dod16 re8 dod] si8.[dod16 re8 dod]}\\{<fad, si,>4. s8 <fad si,>4.}>>

   %13
   si8 fad re si <<
      {
         si'8.[dod16 re8 dod]
         si8.[dod16 re8 dod]
      }\\{
         <fad, si,>4. s8
         <fad si,>4.
      }
   >> si8 dod re mi
   fad4 r16 fad-. re-. dod-. dod4(si16) la-. sol-. fad-.

   %16
   \appoggiatura fad8 sol fad~fad16 fad'-. re-. dod-. dod4(si16) la-. sol-. fad-.
   \appoggiatura fad8(mi) re r fad'\mbreak re16-. dod-. si-. sol' sol8(fad16) dod
   re16-. dod-. si-. sol' sol8(fad16)  si, lad sold fad sol' sol8(fad16) lad

   %19
   lad?8[(si16) sol fad mi re dod] re dod si8 si32(dod re dod si16) r
   si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
   si8[sol' fad16 mi re dod] si4 si'32\p(dod re dod si16) r

   %22
   si32(dod re dod si16) r si32(dod re dod si16) r\mbreak si32(dod re dod si16) r si32(dod re dod si16) r
   si8 sol\f fad16 mi re dod si fad si re, mi dod fad lad,
   si fad' si re, mi dod fad lad, si4 r

   %25
   r8 re\p fad re r dod mi dod
   r re fad re r re sol fad
   fad fad si fad r sol sol dod,

   %28
   r fad la fad\mbreak r si sol dod,
   r fad re si dod mi sol dod,
   r la' la sol fad la fad red

   %31
   r la' la fad red do' fad, red
   r si' si la sold si sold mid
   r si' si sold mid re' sold, mid

   %34
   r dod' dod si la si dod la
   fad4 r8 re'\mbreak mid, fad sold mid
   la4 r8 dod dod fad,16 re' mid,8 mid

   %37
   fad la si la r fad16[re'] mid,8 mid
   dod la' dod la re\p re re re
   mi mi mi mi mi mi mi mi

   %40
   re re re re\mbreak si si si si
   si si si si dod dod dod dod
   dod dod dod dod re8 re,\p mi[sol]

   %43
   la la, dod la re mi fad re
   dod si la[fad']\mbreak mi re dod la
   mi' re dod la fad' re la'[la,]

   %46
   <<
      {
         <fad'' la,>4. s8 <fad la,>4. s8
         fad8 la, fad re <fad' la,>4. s8
         <fad la,>4.
      }\\{
         re,8.[sol'16 la8 sol] re,8.[sol'16 la8 sol]
         <la, re,>4 s re,8.[sol'16 la8 sol]
         re,8.[sol'16 la8 sol]
      }
   >> fad re fad sold

   %49
   la4 r16 la-. fad-. mi-. mi4(re16) do si la
   \appoggiatura la8 si4~si16 si'-. sold-. fad-.\mbreak fad4(mi16) re-. dod?-. si-.
   dod la re fad, sol mi la la, re dod' re fad, sol mi la la,

   %52
   re4 r r2
   R1
   la'8\p la do? la fad fad fad fad

   %55
   sol4 r si8 si re si\mbreak
   sold sold sold sold la4 r
   R1*2

   %59
   la8\p fad la dod la fad la dod
   la la si si si4 r\mbreak
   sold8 sold la la la4 r

   %62
   fad8 fad mid mid mid sold dod mid
   r2 r8 fad, la fad'
   re2~re8 sold, si re

   %65
   dod2~\mbreak dod8 fad, la dod
   red2 dod8 sold dod mi
   dod2 si8 fad si fad

   %68
   do' do do do red red, fad si
   r sol(la si) r red(mi fad)\mbreak
   si,4 r r8 sol, sol sol

   %71
   la la si si do sol sol sol
   la la si si mi r si' r
   si r red r si r si r\mbreak

   %74
   si r red r sol16 fad mi do'? do8(si16) la
   sol16 fad mi sol sol8(fad16) mi re dod! si sol' sol8(fad16) si,

   %76
   lad sold fad sol'? sol8(fad16) lad lad8 [(si16) sol fad mi re dod]
   re dod si8 si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
   si32(dod re dod si16) r si32(dod re dod si16) r si fad si re, mi dod fad lad,

   %79
   si fad' si re, mi dod fad lad, si4 r
   r8 re\p fad re r dod mi dod
   r re fad re r lad' si fad

   %82
   dod'4. lad8 fad si, re si
   lad fad' sol lad,  si fad' sol lad,
   si16 fad' si re, mi dod fad lad, si8 fad'\p fad fad\mbreak

   %85
   sol sol sol sol mi mi mi mi
   fad fad fad fad re re re re
   mi mi r4 lad8 lad r4

   %88
   fad8 fad fad fad fad fad fad fad
   fad r sol sol sol sol sol sol
   sol r dod dod\mbreak dod dod dod dod

   %91
   re re si[si] si si si si
   dod dod dod lad fad fad fad si
   sol mi la? fad fad16 fad si re, mi dod fad lad,

   %94
   si8 r fad' r fad r fad r\mbreak
   sold r sold r sold r sold r
   la r la r la r la r

   %97
   si r si r sold r sold r
   la r la r fad r fad r
   fad r fad r mi r mi r

   %100
   mi r si' r si r si r
   si r sold r lad r lad r
   fad16 si\p fad re si4 r16 mi' si sol mi4\mbreak

   %103
   r16 fad' dod lad fad4 r16 si fad re si4
   sol'8\p sol sol sol sol sol sol sol
   lad lad lad lad si[si] fad fad

   %106
   sol? sol sol mi' dod? dod dod dod\mbreak
   dod dod dod dod fad, fad fad fad
   fad fad fad fad mi mi mi mi

   %109
   re si' si lad si re, re re
   fad fad fad fad mi mi mi mi
   re r re r re re fad fad

   %112
   <<{si8.^\f[dod16 re8 dod] si8.[dod16 re8 dod]}\\{<fad, si,>4. s8 <fad si,>4.}>>
   si8 fad re si <<
      {
         si'8.[dod16 re8 dod]
         si8.[dod16 re8 dod]
      }\\{
         <fad, si,>4. s8
         <fad si,>4.
      }
   >> si8 dod re mi
   fad4 r16 fad-. re-. dod-. dod4(si16) la-. sol-. fad-.

   %116
   \appoggiatura fad8 sol fad~fad16 fad'-. re-. dod-. dod4(si16) la-. sol-. fad-.
   \appoggiatura fad8(mi) re r fad'\mbreak re16-. dod-. si-. sol' sol8(fad16) dod
   re16-. dod-. si-. sol' sol8(fad16)  si, lad sold fad sol' sol8(fad16) lad

   %119
   lad?8[(si16) sol fad mi re dod] re dod si8 si32(dod re dod si16) r
   si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r si32(dod re dod si16) r
   si8[sol' fad16 mi re dod] si4 si'32\p(dod re dod si16) r

   %122
   si32(dod re dod si16) r si32(dod re dod si16) r\mbreak si32(dod re dod si16) r si32(dod re dod si16) r
   si8 sol\f fad16 mi re dod si fad si re, mi dod fad lad,
   si fad' si re, mi dod fad lad, si4\fermata r

}

IIIvlan = \relative do' {

   fad,8 fad fad fad fad si si re
   re fad fad fad fad4 r
   re2\p fad

   %4
   si re
   fad,1\fermata\mbreak
   dod8\f dod dod dod dod fad fad lad

   %7
   lad? lad lad lad fad4 r
   fad2\p red
   si fad'~

   %10
   fad sold
   dod,1\fermata\mbreak
   re4\f r8 fad re4 r8 fad

   %13
   si fad re si re4 r8 fad
   re4 r8 fad re mi fad sol
   lad,4 r8 fad' fad fad fad re

   %16
   mi re re fad fad fad fad re
   sol, fad fad re'\mbreak fad8[fad] dod dod
   fad fad mi[re] dod dod dod dod

   %19
   dod re dod lad fad4 fad'8 fad
   sol sol lad,[lad] si[si] fad' fad
   sol sol lad, lad si4 fad'8\p fad

   %22
   sol sol lad, lad\mbreak si si fad'[fad]
   sol sol\f lad, lad si16 fad' si [re,] mi dod fad lad,
   si16 fad' si[re,] mi dod fad lad, si4 r  %%%fine ripresa

   %25
   r8 si\p re si r lad dod lad
   r si re si r si mi fad
   si, si re si r mi dod la?

   %28
   r re fad re\mbreak r sol mi la,
   r re si sol la dod mi la,
   r re fad mi red fad red si

   %31
   r la' fad red si la' red, si
   r8 si' sol fad mid sold mid dod
   r si' sold mid dod si' mid, dod

   %34
   r dod' la sold fad sold la fad
   si,4 r8 si'\mbreak dod, red mid dod
   fad4 r8 dod fad re16 si dod8 dod,

   %37
   fad fad' sold fad r re16 si dod8[dod,]
   fad fad' la fad si8\p si si si
   si si si si dod dod dod dod

   %40
   la la la la\mbreak sol sol sol sol
   mi mi mi mi la la la la
   fad fad fad fad si8 re,\p mi[sol]

   %43
   la la, dod la re mi fad re
   dod si la[fad']\mbreak mi re dod la
   mi' re dod la fad' re la'[la,]

   %46
   fad' fad mi dod la fad' mi dod
   la la' fad re la fad' mi dod
   la fad' mi dod la la'4 si8
   
   %49
   mi, mi fad fad la la la la
   re, re re sold\mbreak si si si si
   mi,16 la re fad, sol? mi la la, re dod' re fad, sol mi la la,
   
   %52
   re4 r r2
   R1
   la8\p la la la si si si si
   
   %55
   mi,4 r si'8 si si si\mbreak
   dod dod dod dod fad,4 r
   R1*2
   
   %59
   fad'8 \p fad fad fad fad fad fad fad
   fad fad mid mid mid4 r\mbreak
   mi!8 mi red red red4 r
   
   %62
   re?8 re dod dod dod dod dod dod
   dod dod dod dod fad fad fad fad
   si, si si si mi? mi mi mi
   
   %65
   la, la la la\mbreak re re re re
   sold ,sold sold sold dod dod dod dod
   fad, fad fad fad si si si si
   
   %68
   mi, mi la do si si si si
   mi mi mi mi si si si si\mbreak
   sol4 r r8 sol sol sol

   %71
   la la si si do sol sol sol
   la la si si mi, r mi' r
   mi r si r mi r mi r\mbreak

   %74
   mi r si r si' sol fad fad
   si, si dod! dod fad, fad' mi re
   dod dod dod dod dod re dod lad
   
   %77
   fad4 fad'8 fad sol sol lad,[lad]
   si si fad '[fad] fad16 fad si re, mi dod fad lad,\mbreak
   si fad' si re, mi dod fad lad, si4 r
   
   %80
   r8 si\p re si r lad dod lad
   r si re si r fad' re si
   lad[dod] fad lad, si8 si  re si
   
   %83
   lad fad' sol lad,  si fad' sol lad,
   si16 fad' si re, mi dod fad lad, si8 si\p si si\mbreak
   mi mi mi mi la, la la la
   
   %86
   re re re re sol, sol sol sol
   dod dod r4 fad8 fad r4
   si,8 si si si si si si si
   
   %89
   si r mi mi mi mi mi  mi
   mi r mi mi\mbreak mi mi lad, lad
   si si red[red] mi mi mi mi
   
   %92
   lad, lad lad lad si si si si
   mi mi mi mi re16 fad si re, mi dod fad lad,
   si8 r si r si r si r\mbreak 
   
   %95
   si r si r si r si r
   la r fad' r fad r fad r
   sold r sold r mi r mi r
   
   %98
   fad r fad r re r re r
   si r si r si r si r
   sol r mi' r sold r sold r
   
   %101
   sold? r sold r fad r fad r
   fad16 si\p fad re si4r16 mi' si sol mi4\mbreak
   r16 fad' dod lad fad4 r16 si fad re si4
   
   %104
   mi8\p mi mi mi mi mi mi mi
   fad fad fad fad re re re re
   mi mi mi mi fad fad fad fad\mbreak
   
   %107
   fad fad lad, lad si si si si
   re re re re dod dod dod dod
   si si fad' fad, si si si si
   
   %110
   re re re re dod dod dod dod
   si r si r si si fad'[fad,]
   re'4\f r8 fad re4 r8 fad
   
   %113
   si fad re si re4 r8 fad
   re4 r8 fad re mi fad sol
   lad,4 r8 fad' fad fad fad re
   
   %116
   mi re re fad fad fad fad re
   sol, fad fad re'\mbreak fad8[fad] dod dod
   fad fad mi[re] dod dod dod dod
   
   %119
   dod re dod lad fad4 fad'8 fad
   sol sol lad,[lad] si[si] fad' fad
   sol sol lad, lad si4 fad'8\p fad
   
   %122
   sol sol lad, lad\mbreak si si fad'[fad]
   sol sol\f lad, lad si16 fad' si [re,] mi dod fad lad,
   si16 fad' si[re,] mi dod fad lad, si4 \fermata r  %%%fine ripresa

}


IIIbcn = \relative do {

   si8 si si si si si si si
   si si si si fad'4 r
   si8\p [re16. dod32 si8 si] si fad re si

   %4
   si' [re16. dod32 si8 si] si fad re si
   fad'1\fermata\mbreak
   fad8\f fad fad fad fad fad fad fad

   %7
   fad fad fad fad si,4 r
   si'8^\p [red16. dod32 si8 si] si fad red si
   mi8[sol16. fad32 mi8 mi] lad, fad' fad lad,

   %10
   si8\p [re'?16. dod32 si8 si] mid,2
   fad1\fermata\mbreak
   si,4\f r8 fad' si,4 r8 fad'

   %13
   si fad re si si4 r8 fad'
   si,4 r8 fad' si,4 la8 sol
   fad4 r8 si si si si si

   %16
   si si si si si si si si
   si si si si\mbreak si si lad[lad]
   si si si[si] fad' fad fad fad

   %19
   fad si, lad fad si4 re8 re
   mi mi fad[fad] sol sol re[re]
   mi mi fad fad si,4 re8\p re

   %22
   mi mi fad fad\mbreak sol sol re[re]
   mi mi\f fad fad si,16 fad' si[re,] mi dod fad lad,
   si16 fad' si[re,] mi dod fad lad, si4 r  %%%fine ripresa

   %25
   R1*13
   r2 si8\pp[si] si16 si si si
   mi8 mi mi16 mi mi mi la,8 la la16 la la la

   %40
   re8 re re16 re re re\mbreak sol,8 sol sol16 sol sol sol
   sold8 sold sold16 sold sold sold la8 la la16 la la la
   lad8 lad lad16 lad lad lad si4 r

   %43
   R1*3
   re8 re' dod la re, re' dod la
   re, la' fad re re re' dod la

   %48
   re, re' dod la re,4 re'
   dod8 la re re, fad fad fad fad
   sol sol sol mi\mbreak sold sold sold sold  %% inizio p.8

   %51
   la16 la re fad, sol? mi la la, re dod' re fad, sol mi la la,
   re4 re re re
   mi la, re16 re' la fad re4

   %54
   R1
   r16 mi' si sol mi4 r2\mbreak
   r r16 fad' dod la fad4
   fad, r8 fad' si,4 r

   %58
   sid r8 sold' dod,4 r
   R1*15
   r2 mi8 mi red red

   %75
   mi mi lad, lad si si si si
   fad' fad fad fad fad si, lad fad
   si4 re8 re mi mi fad[fad]

   %78
   sol sol re[re] re16 fad si re, mi dod fad lad,\mbreak
   si fad' si re, mi dod fad lad, si4 r
   R1*4 %% fine prima riga p. 11

   %84
   r16 fad' si re, mi dod fad lad, si4 r\mbreak
   R1*8
   r2 r16 fad' si re, mi dod fad lad,

   %94
   si8 r si r si r si r\mbreak
   mid r mid r mid r mid r
   fad r fad r fad r fad r

   %97
   mi? r mi r mi r mi r
   re r re r re r re r
   red r red r mi r mi r

   %100
   mi r mi r mid r mid r
   dod r dod r fad r fad r
   si,16 si'\p fad re si4 r16 mi' si sol mi4\mbreak

   %103
   r16 fad' dod lad fad4 r16 si fad re si4
   R1*8
   si4\f r8 fad' si,4 r8 fad'

   %113
   si fad re si si4 r8 fad'
   si,4 r8 fad' si,4 la8 sol
   fad4 r8 si si si si si

   %116
   si si si si si si si si
   si si si si\mbreak si si lad[lad]
   si si si[si] fad' fad fad fad

   %119
   fad si, lad fad si4 re8 re
   mi mi fad[fad] sol sol re[re]
   mi mi fad fad si,4 re8\p re

   %122
   mi mi fad fad\mbreak sol sol re[re]
   mi mi\f fad fad si,16 fad' si[re,] mi dod fad lad,
   si16 fad' si[re,] mi dod fad lad, si4\fermata r  %%%fine ripresa

}

IIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown
   
   s1*7
   <_+>2 <7>
   s <6 5>
   s <7>
   <_+>1
   s1*4
   <6 4>8 <5 3> s4 s2
   <6 4>8 <5 3> s4 s <7>8 <6>
   s s <6 4> <5 3> <_+>2
   s1*20
   s2 <7>
   s1*8
   s2 <5>4 <6 4+>
   <6> s <7> <6>
   s s8 <_+> <7>4 <6>
   s1
   s4 <7! 5> <6 4> <3>
   s <7> s2
   s1*20
   s2 s4 <7!>
   s <7> s <6 4>8 <5 3>
   s1*19
   <7>2 <6 5>
   s <6>
   <7 _+> <6>
   <7> <6>
   s <5 4>
   <3>1
   <7 _+>2 <_+>
   s1*14
   <6 4>8 <5 3> s4 s2
   <6 4>8 <5 3> s2 <7>8 <6>
   s4 <6 4>8 <5 3> <_+>2

}

forma = {

   \time 4/4
   \key si\minor
   \tempo 4 = 65
   s1*11
   \bar "||"\break
   \once \override Score.RehearsalMark.extra-offset = #'(10 . -1)
   \mark\markup\huge "All[egr]o non molto"
   \tempo 4 = 75
   s1*113
   \bar"||"

}

IIIvlI = {
   \global
   <<\IIIvlIn \forma>>

}

IIIvlII = {
   \global
   <<\IIIvlIIn \forma>>

}


IIIvlIII = {
   \global
   <<\IIIvlIIIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IVvlIn = \relative do'' {
   
   \set Staff.midiInstrument = #"acoustic guitar (nylon)"
   mi,16_\markup\italic"Pizzicato" sol si mi sol mi si sol fad si red fad la fad red si
   sold si mi sold si sold mi si do la do mi la mi do la
   red si red fad si fad red si \once\stemDown sol' mi, sol, mi 'la, mi'  si mi
   
   %4
   do mi sol, mi' la, mi' si red mi4 r8_\markup\italic\center-align"con arco"  \set Staff.midiInstrument = #"violin" mi'^\markup\italic\center-align"Solo"
   si'4 si8.\tr(la32 si) do4 r8 mi,
   la8~la32 sol(fad mi) red4\tr \appoggiatura red8 mi4 r8 mi\mbreak
   
   %7
   mi'4.~mi32 re(dod si) lad8[(si16 dod) dod8 mi,]
   mi\tr re r fad fad\noBeam ~fad32 mi(red? dod) si8(la)
   sol(si mi) si' sol16(fad mi re dod8) si 
   
   %10
   lad(dod? fad) dod' mi16[re(dod) si(lad) sold(fad mi)]
   re16.\tr dod32 si8 r fad' fad16 \appoggiatura mi8 re16 \appoggiatura dod8 si r si'
   si si,16 re dod4\tr si r8 re\mbreak
   
   %13
   si'4~si32 la(sold fad) mi16 [si'] do?(si la8) r mi
   fa re'~re32 do(si la sol fa mi re) mi8 do'~do32 si(la sol fa mi re do)
   re8 si'~si32 la(sold fad? mi re do si) do8 la r la'
   
   %16
   la fad si, la' sol fad16 mi si'8.\tr(la32 si)
   do4 red8.\tr(dod32 red) mi8 mi, r si'
   do,?4. la'8 red,4. si'8\mbreak
   
   %19
   sol16 fad mi8 r si' si4 si8\tr\noBeam ~si32 la(si do) 
   si4 si8\tr\noBeam ~si32 la(si do) si8 mi, r si'
   si4~si32 la(sol fad mi re do si) la16(do) si(sol') fad4\tr 
   
   %22
   mi8 si'16 mi, fad4\tr \set Staff.midiInstrument = #"acoustic guitar (nylon)" mi16^\markup\italic "[Pizzicato]" mi, sol si mi sol si mi,
   do mi la mi red fad si red, mi2\fermata
   
}

IVvlIIn = \relative do'' {
   
   mi,16_\markup\italic"Pizzicato" sol si mi sol mi si sol fad si red fad la fad red si
   sold si mi sold si sold mi si do la do mi la mi do la
   red si red fad si fad red si \once\stemDown sol' mi, sol, mi 'la, mi'  si mi
   
   %4
   do mi sol, mi' la, mi' si red mi4 r8 si'
   si si si si la do do do
   do do red red si16 mi, sol si mi si' sol mi\mbreak
   
   %7
   si8 si si mi dod dod dod dod
   si16 fad si re fad si fad re si8 si si si
   si si si si dod dod dod dod
   
   %10
   dod? dod dod dod dod dod dod dod
   re16 si re, si' mi, si' fad si  sol si re, si' mi, si' fad si
   sol si re, si' mi, si' fad lad \once\stemUp si,8 re' re re\mbreak
   
   %13
   re re re re do16 la do mi la mi do la
   fa'8 fa fa fa mi mi mi mi
   re re re re do mi mi mi
   
   %16
   fad? fad fad fad mi mi mi mi
   mi mi fad fad sol sol sol sol
   sol sol sol sol fad fad fad fad\mbreak
   
   %19
   \once \stemDown sol16 mi, sol, mi' la, mi'  si mi \parenthesize do  mi sol, mi' la, mi' si mi
   do mi sol, mi' la, mi' si red mi mi sol, mi' la, mi' si mi
   do mi sol, mi' la, mi' si mi do mi sol, mi'  la, mi' si red
   
   %22
   mi8 mi si4\fermata mi16 mi sol si mi sol si mi,
   do mi la mi red fad si red, mi2\fermata
   
}

IVvlIIIn = \relative do'' {
   
   sol8 sol sol sol red red red red
   si si si sol' mi mi mi la
   fad fad fad si si16 mi, sol, mi 'la, mi'  si mi
   
   %4
   do mi sol, mi' la, mi' si red mi4 r8  sol
   sol sol sol sol mi mi mi mi
   mi mi fad fad sol sol sol sol\mbreak
   sol sol sol sol lad lad lad lad
   fad fad fad fad fad fad fad fad
   sol sol sol sol sol sol sol sol
   lad lad lad lad lad lad lad lad
   fad16 si re, si' mi, si' fad si  sol si re, si' mi, si' fad si
   sol si re, si' mi, si' fad lad  si,8 si' si si\mbreak
   si sold sold sold mi do' do do
   la la la la la la la do
   sold sold sold sold mi do' do do
   do do do do si si si si
   la do si si si si si si
   mi mi mi mi red red red red\mbreak
   si16 mi, sol, mi' la, mi'  si mi \parenthesize do  mi sol, mi' la, mi' si mi
   do mi sol, mi' la, mi' si red mi mi sol, mi' la, mi' si mi
   do mi sol, mi' la, mi' si mi do mi sol, mi'  la, mi' si red
   
   %22
   mi8 mi si4\fermata mi8 sol sol sol
   mi[do'] fad, fad sol2\fermata
   
}

IVvlan = \relative do' {
   
   mi8 mi mi mi si si si si
   mi, mi mi mi la la la la
   si si si si mi sol, la si
   
   %4
   do sol la si mi,4 r8 mi'
   mi mi mi mi la, la la la
   do do si si mi mi mi mi\mbreak
   
   %7
   mi mi mi mi fad fad fad fad
   si, si si si red red red red
   mi mi mi mi mi mi mi mi
   
   %10
   fad fad fad fad fad fad fad fad
   si, re mi fad sol re mi fad
   sol re mi fad si, sold' sold sold\mbreak
   
   %13
   sold? mi mi mi la, la la la
   re re re re do do do do
   si si mi, mi la la la la
   
   %16
   red red red red mi mi mi mi
   la, la la la sol mi' mi sol,
   la la la la si si si si\mbreak
   
   %19
   mi sol, la si do sol la si
   do sol la si mi, sol la si
   do sol la si do sol la si
   
   %22
   mi,4 si'\fermata mi8 mi mi mi
   la, la si si mi,2\fermata
   
}

forma = {

    \time 4/4
    \key mi\minor
    \tempo 4 = 50
    s1*23
    \bar"||"

}



IVvlI = {
    \global
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}

IVvlIII = {
    \global
    <<\IVvlIIIn \forma>>

}


IVvla = {
    \global
    \clef alto
    <<\IVvlan \forma>>

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


%{
convert-ly (GNU LilyPond) 2.24.0  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VvlIn = \relative do'' {

    fad,8
    si fad re'\f r
    dod r fad, dod'
    mi lad, mi'\f r

    %4
    re r si fad'
    sol mi la\f r
    fad r re la'

    %7
    si sol dod\f r
    re r re, sol
    fad la, dod8\f r

    %10
    re4 r8 re\mbreak
    fad8 re r sold\f
    la r la, mi'

    %13
    sol? mi lad\f r
    si r si, r
    si16\p(dod re8) dod si

    %16
    \appoggiatura si8 do4 si
    si16 (dod? re8) dod si
    sol'4 fad

    %19
    fad8. sol32 la si8 r
    mi,8. fad32 sol la8 r
    re,8. mi32 fad sol8 r

    %22
    dod,8. re32 mi fad8 r\mbreak  %% fine p. 16
    fad,16\f(mi') re8 fad,16(re') dod8
    fad,16(dod') si8 fad16(mi') re8

    %25
    fad,16(re') dod8 fad,16(dod') si8
    fad[re' si'\f] r
    mi,8[re16 dod re8 mi]

    %28
    re8[fad si\f] r %% inizio ripresa
    mi,[re16 dod re8 mi]
    re[fad, si\f] r

    %31
    fad[mi16 re mi8 fad]
    re[fad si\f] r
    fad[mi16 re mi8 fad]

    %34
    si,4 r8 fad''\solo % fine ripresa
    si,16(re fad) lad si8 fad
    sol4\tr fad8 si,\mbreak

    %37
    fad16(lad dod) mi fad8 dod
    \appoggiatura dod8 re4 si8 fad'
    si,16(re fad) lad si8 dod

    %40
    \appoggiatura dod re4 dod8 re
    \appoggiatura dod8 si16(lad si dod) si8 dod
    \appoggiatura sol8 fad16(mi fad sol) fad8 re

    %43
    si16(re fad) si re8 si
    si4\tr lad
    r16 fad' dod re re8(dod16) re

    %46
    dod fad dod re re8 (dod16) re
    dod fad, dod' re \appoggiatura re8 mi dod
    re16 fad re dod si la sol fad\mbreak

    %49
    sol mi' si dod dod8(si16) dod
    si mi si dod dod8(si16) dod
    si mi, si' dod \appoggiatura dod8 re si

    %52
    dod16 mi dod si la sol fad mi
    fad re' la si \appoggiatura si8 do4
    si16 mi si dod? \appoggiatura dod8 re4

    %55
    dod8 la sol8.\tr fad32 mi
    fad8 la sol8.\tr fad32 mi
    fad16 la la, si \appoggiatura si8 do4

    %58
    si16 mi si dod? \appoggiatura dod8 re4
    \con \tuplet 3/2 { dod16(si la) } re[si] mi dod fad[re]
    \tuplet 3/2 { sol(fad mi) } la16[fad]\mbreak si sol dod[la]

    %61
    re re sold, la la8(sold16) la
    sold re' fad, sol sol8(fad16) sol
    fad re' re, mi mi8(re16) mi

    %64
    re4 r8 dod'\p(
    re4) r8 sold,(
    la4) r8 dod\f

    %67
    \senza \tuplet 3/2 { re16(dod si) la[(sol fad)] sol (fad mi) fad[(mi re)] }
    re'8 re,16 mi mi4\tr
    re8\f\tu la fad' r

    %70
    mi r la, mi'
    sol dod, sol'\f r\mbreak  %% fine p. 18
    fad r re la'

    %73
    si sol dod\f r
    re r re, la
    sol[fad16 mi fad8 sol]

    %76
    fad[la re\f] r
    sol,[fad16 mi fad8 sol]
    \once\stemUp fad [la' re\f] r

    %79
    la,[sol16 fad sol8 la]
    re,16\solo re(fad la re dod re dod)
    re(la re sold la sold la sold)

    %82
    la(re, fad la re dod re dod)
    re8.[dod32 si la8 sol?]
    fad32 (mi re8.) sol32(fad mi8.)\mbreak

    %85
    fad32 (mi re8.) la'32(sol fad8.)
    fad4\tr mi
    re'8. mi32 fad mi8 re

    %88
    mi8. fad32 sol fad8 mi
    fad16 re la re fad re la re
    fad4 mi

    %91
    R2
    \senza \tuplet 3/2 { fad,16(sol la) la,[(si do)] } re, fad la do
    \tuplet 3/2 { fad16(sol la) la,[(si do)] } re, fad la do

    %94
    \tuplet 3/2 { sol'16(la si) si,[(dod? re)] } re, sol si re\mbreak
    \tuplet 3/2 { sol16(la si) si,[(dod re)] } re, sol si re
    \tuplet 3/2 { sold16(la si) si,[(dod re)] } re, sold si re

    %97
    \tuplet 3/2 { sold16(la si) si,[(dod re)] } re, sold si re
    \tuplet 3/2 { dod(re mi) la,[(si dod)]} la, dod mi sol?
    \tuplet 3/2 { dod(re mi) la,[(si dod)]} la, dod mi sol

    %100
    fad re do'4.
    \tuplet 3/2 { fad16(sol la) red,[(mi fad)] } si, red fad la
    sol mi sold4.

    %103
    \tuplet 3/2 { si,16(do re) sold,[(la si)] } mi, sold si re\mbreak
    do la do'4.
    do?16[(si la sol? fad mi red mi)]

    %106
    mi4\tr red
    mi'16-. si-. sol-. mi'-. mi si sol mi'
    \tuplet 3/2 { do(la la,) la[(la' do)] do(la la,) la[(la' do)]}

    %109
    re la fad re' re la fad re'
    \tuplet 3/2 { si(sol sol,) sol[(sol' si)] si(sol sol,) sol[(sol' si)]}
    do sol mi do' do sol mi do'

    %112
    \tuplet 3/2 {
        red, si si, si[si' red] red si si, si[si' red]
        red? la si, si[la' red] red la si, si[la' red]
        mi sol, si, si[sol' mi'] mi sol, si, si[sol' mi']

        %115
        fad la, si, si[la' fad'] fad la, si, si[la' fad']
        mi sol, si, si[sol' mi'] mi sol, si, si[sol' mi']
    }
    << <red fad,>4\\ si,>> r16 sol'' (la si)

    %118
    si-. sol-. fad8(mi16) do(re mi)
    mi-. do-. si8(la16) la'(si do?)
    do-. si-. si8(lad4)~

    %121
    lad16 lad(si dod?)~dod mi,(red mi)
    si red fad si si, mi sol si
    si, red fad si si, mi sol si

    %124
    si,4 mi'\mbreak
    do16(si la sol fad mi red fad)
    mi4 mi'

    %127
    do16(si la sol fad mi red fad)
    mi8\f[si sol'] r
    fad r si, la'

    %130
    sol[mi sol\f] r
    mi lad, mi' r
    re r32 fad sol la si8 r

    %133
    mi,8. fad32 sol la8 r
    re,8. mi32 fad sol8 r
    dod,8. re32 mi fad8 r\mbreak

    %136
    fad,16(mi') re8 fad,16(re') dod8
    fad,16(dod') si8 fad16(mi') re8
    fad,16(re') dod8 fad,16(dod') si8

    %139
    fad[re' si'] r
    mi,[re16 dod re8 mi]
    re[fad si] r

    %142
    mi,[re16 dod re8 mi]
    re[fad si] r
    fad,8[mi16 re mi8 fad]

    %145
    si,4 r8 fad''\solo
    si16-. fad-. sol-. re-. mi dod re si
    fad8 [mi'(re dod)]\mbreak

    %148
    si'16 fad sol re mi dod re si
    fad8 [mi'(re dod)]
    <<
        {
            r16 fad fad8~fad16 fad fad8~

            %151
            fad16 fad fad8(sol16) sol sol8(
            fad16) fad fad8~fad16 fad fad8~
            fad16 fad fad8~fad16 fad fad8(

            %154
            sol16) sol sol8(fad16) fad fad8
            sol4
        }\\{
            re16 re re8(dod16) si si8(
            re16) re re8(mi16) mi mi8(
            re16) dod dod8(re16) re re8(
            dod16) si si8(re16) re re8\parentSlur (
            mi16) mi mi8(re16) dod dod8
            re16 fad si re,
        }
    >> mi dod re si
    fad fad' si re, mi dod re si

    %157
    fad2\tr\mbreak
    \tuplet 3/2 {
        fad'16(mi re) re[(dod si)] si(la sol) la[(sol fad)]
        sol(fad sol) sol[(fad sol)] si(la si) mi[(re mi)]

        %160
        sol(fad mi) mi[(re dod)] dod si la si[la sol]
        la sold la la[sold la] dod si dod fad[mi fad]
        la sol fad fad[mi re] re dod si dod[si la]

        %163
        si la si re[dod re] sol fad sol si[la si]
        dod, si dod mi[re mi] la sol la dod[si dod]
        re, dod re fad[mi fad] si la si re[dod re]

        %166
        mi, re mi sol[fad sol] dod si dod mi[dod mi]
        lad, si dod dod[si lad] mi fad sol sol[fad mi]\mbreak
    }
    re si fad re si[do'] si32(la) sol(fad)

    %169
    sol16 si' sol mi si[sol'] mi32(re) dod?(si)
    fad16 fad' dod lad fad sol' fad32 mi re dod
    re16 si si,8 r16 fad''\noBeam fad(sol32 la)

    %172
    sol16 sold sold[(la32 si)] la16 lad lad[(si32 dod)]
    si8 si, r16 fad'\noBeam fad(sol?32 la)
    sol16 sold sold[(la32 si)] la16 lad lad[(si32 dod)]\mbreak

    %175
    si16 si si[(dod32 re)] dod16 dod dod[(re32 mi)]
    re16 re re[(mi32 fad)] mi16 mi mi[(fad32 sol)]
    fad4 r

    %178
    r8 fad,\p[\appoggiatura mi re dod16(si)]
    \appoggiatura si8 do si si4~
    si8[fad' \appoggiatura mi re dod?16(si)]

    %181
    \appoggiatura la'8 sol fad fad4~
    fad8[fad \appoggiatura mi re dod16 (si)]
    lad'8 lad(si4)~

    %184
    si8 sol fad16(mi) re(dod)
    \appoggiatura mi8 re dod16 si dod4\tr
    si r16 si'(sol red)\mbreak

    %187
    mi16(sol fad mi) dod'(re dod si)
    lad(sol fad mid) fad(re' dod si)
    do4~do16 mi(do lad)

    %190
    si4~si16[sol\f]fad32(mi) re(dod)
    re16 fad re si \once\stemUp re,[sol'] fad32(mi) re(dod)
    re16 fad re si \once\stemUp re,[si'' la32(sol) fad(mi)]

    %193
    re16 fad re si \once\stemUp fad[si' la32(sol) fad(mi)]
    re16 fad si si, <<dod4\tr\\fad,>>
    si8[fad' si\f] r %% inizio ripresa

    %196
    mi,[re16 dod re8 mi]
    re[fad, si\f] r
    fad[mi16 re mi8 fad]

    %199
    re[fad si\f] r
    fad[mi16 re mi8 fad]
    si,4\fermata r % fine ripresa

}

VvlIIn = \relative do'' {

    fad,8
    si fad re'\f r
    dod r fad, dod'
    mi lad, mi'\f r

    %4
    re r si fad'
    sol mi la\f r
    fad r re la'

    %7
    si sol dod\f r
    re r re, sol
    fad la, dod8\f r

    %10
    re4 r8 re\mbreak
    fad8 re r sold\f
    la r la, mi'

    %13
    sol? mi lad\f r
    si r si, r
    si16\p(dod re8) dod si

    %16
    \appoggiatura si8 do4 si
    si16 (dod? re8) dod si
    sol'4 fad

    %19
    fad8. sol32 la si8 r
    mi,8. fad32 sol la8 r
    re,8. mi32 fad sol8 r

    %22
    dod,8. re32 mi fad8 r\mbreak  %% fine p. 16
    fad,16\f(mi') re8 fad,16(re') dod8
    fad,16(dod') si8 fad16(mi') re8

    %25
    fad,16(re') dod8 fad,16(dod') si8
    fad[re' si'\f] r
    mi,8[re16 dod re8 mi]

    %28
    re8[fad si\f] r %% inizio ripresa
    mi,[re16 dod re8 mi]
    re[fad, si\f] r

    %31
    fad[mi16 re mi8 fad]
    re[fad si\f] r
    fad[mi16 re mi8 fad]

    %34
    si,4 r  %%% fine ripresa
    si8\p[dod re si]
    mi [lad, si re]\mbreak

    %37
    lad[fad' lad, fad']
    si,[dod re lad]
    si[lad' sold fad]

    %40
    si[mid, fad si,]
    r si'[re, mi?]
    fad[lad, si si']

    %43
    re[dod si mid,]
    fad[sold lad fad]
    lad\p[lad si lad]

    %46
    lad?[lad si lad!]
    lad?[lad lad lad]
    fad4 r\mbreak

    %49
    sol8[sol la? sol]
    sol[sol la sol]
    sol[sol sol sol]

    %52
    mi4 r
    r8 re'\p[re re]
    re[mi mi mi]

    %55
    mi[mi mi mi]
    fad[fad mi mi]
    fad [la, la la]

    %58
    si[si si si]
    dod[si,\p dod re]
    mi fad\mbreak sol la

    %61
    fad r mi r
    re r dod r
    re r la r

    %64
    re8[re' dod la]
    fad[re si' re,]
    dod [la la' sol]

    %67
    fad[re mi re]
    si'[sol la la,]
    re'\f  la fad' r

    %70
    mi r la, mi'
    sol dod, sol'\f r\mbreak  %% fine p. 18
    fad r re la'

    %73
    si sol dod\f r
    re r re, la
    sol[fad16 mi fad8 sol]

    %76
    fad[la re\f] r
    sol,[fad16 mi fad8 sol]
    \once\stemUp fad [la' re\f] r

    %79
    la,[sol16 fad sol8 la]
    re,4 r
    R2*10

    %91
    mi'8[dod la'] r
    la,8\p[la la la]
    la[la la la]

    %94
    si[si si si]\mbreak
    si[si si si]
    si[si si si]

    %97
    si[si si si]
    dod[dod dod dod]
    dod[dod dod dod]

    %100
    la[la la la]
    do[do do do]
    si[si si si]

    %103
    si[si si si]\mbreak
    do[do do do]
    do?[do do do]

    %106
    si[si si si]
    R2*10
    r8 si\p[sol fad]

    %118
    mi[re do si]
    la[sol' fad mi]
    red[mi fad sol]

    %121
    fad mi lad,4
    si8[fad'' sol sol]
    fad[fad sol sol]

    %124
    fad[fad sol sol]\mbreak
    mi[mi red red]
    mi4 si'8 sol

    %q127
    mi[mi red red]
    mi\f[si sol'] r
    fad r si, la'

    %130
    sol[mi sol\f] r
    mi lad, mi' r
    re r32 fad sol la si8 r

    %133
    mi,8. fad32 sol la8 r
    re,8. mi32 fad sol8 r
    dod,8. re32 mi fad8 r\mbreak

    %136
    fad,16(mi') re8 fad,16(re') dod8
    fad,16(dod') si8 fad16(mi') re8
    fad,16(re') dod8 fad,16(dod') si8

    %139
    fad[re' si'] r
    mi,[re16 dod re8 mi]
    re[fad si] r

    %142
    mi,[re16 dod re8 mi]
    re[fad si] r
    fad,8[mi16 re mi8 fad]

    %145
    si,4 r
    R2
    fad'8\p [mi'(re dod) ]%%%fine primo sistema p. 22

    %148
    re4 r
    fad,8\p [mi'(re dod) ]
    re [si, lad si]

    %151
    si' si, mi lad,
    si[fad' si si,]
    lad[si si' si,]

    %154
    mi lad, si fad'
    si,4 r8 mid
    fad4 r8 mid

    %157
    fad[sold lad fad]\mbreak
    si[si si si]
    si[si si si]

    %160
    dod[dod dod dod]
    dod[dod dod dod]
    re[re re re]

    %163
    re [re mi mi]
    mi[mi fad fad]
    fad[fad sol sol]

    %166
    sol[sol lad lad]
    mi[mi dod dod]\mbreak
    fad fad si,, red

    %169
    mi[mi sol sol]
    lad,[lad lad fad']
    si, si'\p[fad red]

    %172
    mi[re! dod fad]
    si,[si' fad red]
    mi[re! dod fad]\mbreak

    %175
    si,[si' lad fad]
    si,[si' lad fad]
    si16 re\p re mi fad fad fad mi

    %178
    re8[fad, fad fad]
    sol[fad fad fad]
    fad[fad fad fad]

    %181
    si[si si si]
    si si re re
    dod [dod fad mi]

    %184
    re[si dod lad]
    fad[si si lad]
    si[re re] r\mbreak

    %187
    mi mi dod dod
    dod[dod dod fad]
    do[do do 8. dod16]

    %190
    si8[si si dod]
    re4 r8 dod
    re4 r8 dod

    %193
    re4 r8 dod
    re[re dod dod]
    re8[fad si\f] r %% inizio ripresa

    %196
    mi,[re16 dod re8 mi]
    re[fad, si\f] r
    fad[mi16 re mi8 fad]

    %199
    re[fad si\f] r
    fad[mi16 re mi8 fad]
    si,4\fermata r  %%% fine ripresa

}

VvlIIIn = \relative do'' {

    fad,8
    si fad re'\f r
    dod r fad, dod'
    mi lad, mi'\f r

    %4
    re r si fad'
    sol mi la\f r
    fad r re la'

    %7
    si sol dod\f r
    re r re, sol
    fad la, dod8\f r

    %10
    re4 r8 re\mbreak
    fad8 re r sold\f
    la r la, mi'

    %13
    sol? mi lad\f r
    si r si, r
    si16\p(dod re8) dod si

    %16
    \appoggiatura si8 do4 si
    si16 (dod? re8) dod si
    mi4 re

    %19
    r red8. mi32 fad
    sol8 r dod,8. re32 mi
    fad8 r si,8. dod32 re

    %25
    mi8 r lad,8. si32 dod\mbreak
    re16\f(mi re8) fad,16(re') dod8
    fad,16(dod') si8 fad16(mi') re8

    %25
    fad,16(re') dod8 fad,16(dod') si8
    fad[re' si'\f] r
    mi,8[re16 dod re8 mi]

    %28
    re8[fad si\f] r %% inizio ripresa
    mi,[re16 dod re8 mi]
    re[fad, si\f] r

    %31
    fad[mi16 re mi8 fad]
    re[fad si\f] r
    fad[mi16 re mi8 fad]

    %34
    si,4 r  %%% fine ripresa
    si8\p[dod re si]
    mi [lad, si re]\mbreak

    %37
    lad[fad' lad, fad']
    si,[dod re lad]
    si[lad' sold fad]

    %40
    si[mid, fad si,]
    r si'[re, mi?]
    fad[lad, si si']

    %43
    re[dod si mid,]
    fad[sold lad fad]
    lad\p[lad si lad]

    %46
    lad?[lad si lad!]
    lad?[lad lad lad]
    fad4 r\mbreak

    %49
    sol8[sol la? sol]
    sol[sol la sol]
    sol[sol sol sol]

    %52
    mi4 r
    r8 la\p[la la]
    si[si si si]

    %55
    dod[dod dod dod]
    la la dod dod
    la[re, re re]

    %58
    re[mi mi mi]
    mi [si\p dod re]
    mi fad\mbreak sol la

    %61
    fad r mi r
    re r dod r
    re r la r

    %64
    re8[re' dod la]
    fad[re si' re,]
    dod [la la' sol]

    %67
    fad[re mi re]
    si'[sol la la,]
    re'\f  la fad' r

    %70
    mi r la, mi'
    sol dod, sol'\f r\mbreak  %% fine p. 18
    fad r re la'

    %73
    si sol dod\f r
    re r re, la
    sol[fad16 mi fad8 sol]

    %76
    fad[la re\f] r
    sol,[fad16 mi fad8 sol]
    \once\stemUp fad [la' re\f] r

    %79
    la,[sol16 fad sol8 la]
    re,4 r
    R2*10

    %91
    dod'8[la mi'] r
    fad,8\p[fad fad fad]
    fad[fad fad fad]

    %94
    re[re re re]\mbreak
    re[re re re]
    sold[sold sold sold]

    %97
    sold?[sold sold sold]
    mi[mi mi mi]
    mi[mi mi mi]

    %100
    fad[fad fad fad]
    fad[fad fad fad]
    sol[\parenthesize si si si]

    %103
    sold[sold sold sold]\mbreak
    mi[mi mi mi]
    mi[mi mi do']

    %106
    fad,[fad fad fad]
    R2*10
    r8 si\p[sol fad]

    %118
    mi[re do si]
    la[sol' fad mi]
    red[mi fad sol]

    %121
    fad mi lad,4
    si8 [red' mi mi]
    red[red mi mi]

    %124
    red[red mi mi]\mbreak
    do[do fad, fad]
    sol[si mi si]

    %127
    do[do fad, fad]
    mi'\f[si sol'] r
    fad r si, la'

    %130
    sol[mi sol\f] r
    mi lad, mi' r
    r4 red8. mi32 fad

    %133
    sol8 r dod,8. re?32 mi
    fad8 r si,8. dod32 re
    mi8 r lad,8. si32 dod\mbreak

    %136
    re16(mi re8) fad,16(re') dod8
    fad,16(dod') si8 fad16(mi') re8
    fad,16(re') dod8 fad,16(dod') si8

    %139
    fad[re' si'] r
    mi,[re16 dod re8 mi]
    re[fad si] r

    %142
    mi,[re16 dod re8 mi]
    re[fad si] r
    fad,8[mi16 re mi8 fad]

    %145
    si,4 r
    R2
    fad'8\p [dod'(si lad) ]%%%fine primo sistema p. 22

    %148
    si4 r
    fad8\p [dod'(si lad) ]
    si[si, lad si]

    %151
    si' si, mi lad,
    si[fad' si si,]
    lad[si si' si,]

    %154
    mi lad, si fad'
    si,4 r8 mid
    fad4 r8 mid

    %157
    fad[sold lad fad]\mbreak
    fad[fad fad fad]
    sol[sol sol sol]

    %160
    sol[sol sol sol]
    la[la la la]
    la[la la la]

    %163
    si[si si si]
    dod[dod dod dod]
    re[re re re]

    %166
    mi[mi mi mi]
    dod[dod lad lad]\mbreak
    fad fad si, red

    %169
    mi[mi sol sol]
    lad,[lad lad fad']
    si, si'\p[fad red]

    %172
    mi[re! dod fad]
    si,[si' fad red]
    mi[re! dod fad]\mbreak

    %175
    si,[si' lad fad]
    si,[si' lad fad]
    si16 si\p si dod re re re dod

    %178
    si8[fad fad fad]
    sol[fad fad fad]
    fad[fad fad fad]

    %181
    si[si si si]
    si si re re
    dod [dod fad mi]

    %184
    re[si dod lad]
    fad[si si lad]
    si[fad fad] r\mbreak

    %187
    si si sold sold
    lad[lad lad fad]
    sol[sol sol fad]

    %190
    fad[fad sol dod]
    fad,4 r8 fad
    fad4 r8 fad

    %193
    fad4 r8 fad
    fad[si si lad]
    re8[fad si\f] r %% inizio ripresa

    %196
    mi,[re16 dod re8 mi]
    re[fad, si\f] r
    fad[mi16 re mi8 fad]

    %199
    re[fad si\f] r
    fad[mi16 re mi8 fad]
    si,4\fermata r  %%% fine ripresa

}

Vvlan = \relative do' {

    re8
    fad re fad\f r
    lad r lad, lad'
    lad? dod, lad'!\f r

    %4
    fad r re re'
    mi dod dod\f r
    la? r fad fad

    %7
    re si la'\f r
    la r la mi
    la fad mi\f r

    %10
    fad4 r8 la\mbreak
    la fad si\f r
    mi, r mi dod'

    %13
    si sol dod\f r
    fad, r fad r
    fad4\p fad

    %16
    sol fad
    fad fad
    dod' fad,

    %19
    re'8 r fad, r
    si r mi, r
    la r re, r

    %22
    sol r dod, r\mbreak
    fad\f r fad r
    fad r fad r

    %25
    fad r fad r
    fad[fad fad] r
    sol[lad, si lad]

    %28
    fad'[fad fad] r %% inizio ripresa
    sol[lad, si lad]
    fad'[fad fad] r

    %31
    fad[mi16 re mi8 fad]
    fad[fad fad] r
    fad[mi16 re mi8 fad]

    %34
    si,4 r  %% fine ripresa
    si8\p[dod re si]
    mi [lad, si re]\mbreak

    %37
    lad[fad' lad, fad']
    si,[dod re lad]
    si[lad' sold fad]

    %40
    si[mid, fad si,]
    r si'[re, mi?]
    fad[lad, si si']

    %43
    re[dod si mid,]
    fad[sold lad fad]
    fad\p[fad fad fad]

    %46
    fad[fad fad fad]
    fad[fad fad fad]
    si,4 r\mbreak

    %49
    mi8[mi mi mi]
    mi[mi mi mi]
    mi[mi mi mi]

    %52
    la,4 r
    r8 fad'\p[fad fad]
    sol[sold sold sold]

    %55
    la[la, la  la]
    re re la la
    re[fad, fad fad]

    %58
    sol[sold sold sold]
    la [si\p dod re]
    mi fad\mbreak sol la

    %61
    fad r mi r
    re r dod r
    re r la r

    %64
    re8[re' dod la]
    fad[re si' re,]
    dod [la la' sol]

    %67
    fad[re mi re]
    si'[sol la la,]
    fad'\f fad la r

    %70
    dod r mi, dod'
    dod mi, dod'\f r\mbreak
    la r fad fad

    %73
    re si mi\f r
    la r la fad
    sol[fad16 mi fad8 sol]

    %76
    fad[fad la\f ] r
    sol[fad16 mi fad8 sol]
    fad fad\f la r

    %79
    la[sol16 fad sol8 la]
    re,4 r
    R2*10

    %91
    la'8[mi dod'] r
    re,\p[re re re]
    re[re re re]

    %94
    sol,[sol sol sol]\mbreak
    sol[sol sol sol]
    mi'[mi mi mi]

    %97
    mi[mi mi mi]
    la,[la la la]
    la[la la la]

    %100
    re[re re re]
    red[red red red]
    mi[mi mi mi]

    %103
    mi[mi mi mi]\mbreak
    la,[la la la]
    la[la la la]

    %106
    si[si si si]
    R2*10
    r8 si'\p[sol fad]

    %118
    mi[re do si]
    la[sol' fad mi]
    red[mi fad sol]

    %121
    fad mi lad,4
    si8[si si si]
    si[si si si]

    %124
    la[si' sol mi]\mbreak
    la,[la si si]
    mi[fad sol mi]

    %127
    la,[la si si]
    sol'\f[sol si] r
    red, r red red

    %130
    si[sol' si\f] r
    lad dod, lad' r
    fad r fad r

    %133
    si r mi, r
    la r re, r
    sol r dod, r\mbreak

    %136
    fad r fad r
    fad r fad r
    fad r fad r

    %139
    fad[fad fad] r
    sol[lad, si lad]
    fad'[fad fad] r

    %142
    sol[lad, si lad]
    fad'[fad fad] r
    fad[mi16 re mi8 fad]

    %145
    si,4 r
    R2
    fad'4.\p fad8\mbreak

    %148
    si,4 r
    fad'4.\p fad8
    si,[si lad si]

    %151
    si' si, mi lad,
    si[fad' si si,]
    lad[si si' si,]

    %154
    mi lad, si fad'
    si,4 r8 mid
    fad4 r8 mid

    %157
    fad[sold lad fad]\mbreak
    re[re re re]
    mi[mi mi mi]

    %160
    mi[mi mi mi]
    fad[fad fad fad]
    fad[fad fad fad]

    %163
    sol[sol sol sol]
    la[la la la]
    si[si si si]

    %166
    dod[dod dod dod]
    fad,[fad fad fad]\mbreak
    si,[si si red]

    %169
    mi[mi sol sol]
    lad,[lad lad fad']
    si, si'\p[fad red]

    %172
    mi[re! dod fad]
    si,[si' fad red]
    mi[re! dod fad]\mbreak

    %175
    si,[si' lad fad]
    si,[si' lad fad]
    si[si,\p si si]

    %178
    si[re re re]
    mi[re re re]
    re[re re re]

    %181
    mi[re re re]
    re[si si si]
    fad' [mi re dod]

    %184
    si[mi lad, fad']
    si, si fad' fad,
    si[si si] r\mbreak

    %187
    sol' sol mid mid
    fad[fad fad re]
    mi?[mi mi mi]

    %190
    re[re mi lad,]
    si4 r8 lad
    si4 r8 lad

    %193
    si4 r8 lad
    si[si fad' fad,]
    fad'[fad fad] r %% inizio ripresa

    %196
    sol[lad, si lad]
    fad'[fad fad] r
    fad[mi16 re mi8 fad]

    %199
    fad[fad fad] r
    fad[mi16 re mi8 fad]
    si,4\fermata r  %% fine ripresa

}


Vbcn = \relative do {

    r8
    si'16 si si si si re dod si
    fad fad fad fad fad lad sold fad
    fad fad fad fad fad lad sold fad

    %4
    si si si si si re dod si
    la? la la la la dod si la
    re re, re re re fad mi re

    %7
    sol sol sol sol sol sol fad mi
    fad fad fad fad fad mi re dod
    re mi fad sol la8 la,

    %10
    re16 re re re re fad mi re\mbreak
    re' re re re re re dod si
    dod dod dod dod dod dod si la

    %13
    mi' mi mi mi mi mi re dod
    re re re re re re dod si
    si,4\p si

    %16
    mi re
    si si
    lad si

    %19
    si'8 r la r
    sol r sol r
    fad r fad r

    %22
    mi r mi r\mbreak
    re\f si fad' r
    fad r fad r

    %25
    fad r fad r
    fad16 si si si si re dod si
    mi,8 [fad si fad]

    %28
    si,16 si' si si si re dod si  %% inizio ripresa
    mi,8 [fad si fad]
    si,16 si si si si re dod si

    %31
    fad'8[mi16 re mi8 fad]
    si,16 si si si si re dod si
    fad'8[mi16 re mi8 fad]

    %34
    si,4 r %% fine ripresa
    R2*34
    re16 re re re re fad mi re

    %70
    la' la la la la dod si la
    la, la la la la dod si la\mbreak
    re re re re re fad mi re

    %73
    sol sol sol sol sol sol fad mi
    fad fad fad fad fad fad mi re
    sol8[fad16 mi fad8 sol]

    %76
    fad16 re re re re fad mi re
    sol8[fad16 mi fad8 sol]
    fad16 re re re re fad mi re

    %79
    la'8[sol16 fad sol8 la]
    re,4 r
    re r

    %82
    re r
    re8[re' dod la]
    re[re, mi la,]\mbreak

    %85
    re[mi fad re]
    la'[sol la la,]
    re re, r re'

    %88
    dod la r dod
    re re, r re'
    la'[sol la la,]

    %91
    la'16 la la la la si dod la
    re4 r
    R2*14

    %107
    sol,8[sol sol sol]
    la[la la la]
    fad[fad fad fad]

    %110
    sol[sol sol sol]
    mi[mi mi mi]
    si[si si si]

    %113
    si[si si si]\mbreak
    si[si si si]
    si[si si si]

    %116
    si[si si si]
    si4 r
    R2*10

    %128
    mi16 mi mi mi mi sol fad mi
    si si si si si red dod si
    mi mi mi mi mi sol fad mi

    %131
    fad fad fad fad fad lad sold fad
    si8 r la? r
    sol r sol r

    %134
    fad r fad r
    mi r mi r\mbreak
    re si fad' r

    %137
    fad r fad r
    fad r fad r
    fad16 si si si si re dod si

    %140
    mi,8[fad si fad]
    si,16 si' si si si re dod si
    mi,8[fad si fad]

    %143
    si,16 si si si si re dod si
    fad'8[mi16 re mi8 fad]
    si,4 r

    %146
    si r
    R2\mbreak
    si4 r

    %149
    R2
    si4 r
    R2*44

    %195
    si16 si' si si si re dod si  %% inizio ripresa
    mi,8 [fad si fad]
    si,16 si si si si re dod si

    %198
    fad'8[mi16 re mi8 fad]
    si,16 si si si si re dod si
    fad'8[mi16 re mi8 fad]

    %201
    si,4\fermata r %% fine ripresa

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s8
    s2*2
    <7>2
    s
    <7>
    s
    s4 <6 4>
    s2*3
    s4 <6 4+>
    s2
    s4 <6 4+>
    s2
    s
    <6!>4 <6>

    s2
    <7>4 <5>
    s <6 4+>
    s <6 4>
    s <6 4>
    s <6 4+>
    s2*4
    s8 <_+> s <7 _+>
    s2
    s8 <_+> s <7 _+>
    s2*41
    <7>4 s
    s2
    s4 <6 4>
    s2*12
    <6 4>4 <5 3>
    s2*21
    <_!>2
    s2*2
    <6!>2
    <_+>
    <7>
    <6 4>
    <7 5>
    <6 4>
    <_+>
    s2*11
    <_+>2
    s
    <7 _+>
    s4 <6 4+>
    <6> <6 4>
    s <6 4>
    s <6 4+>
    s2*4
    s8 <_+> s <7>
    s2
    s8 <_+> s <7>
    s2*53
    s8 <_+> s <7 _+>

}

forma = {

    \time 2/4
    \key si\minor
    \partial 8 s8
    \tempo 2 = 60
    s2*201
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

VvlIII = {
    \global
    <<\VvlIIIn \forma>>

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


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17.5)


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
        title = \markup\smaller{Concerto di Parigi n. 5 in Do maggiore [RV 114]}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] All[egr]o }

    \score {

        \new StaffGroup <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino 1]"}
                \set Staff.shortInstrumentName = "vl1"
                \IvlI
            >>

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\column  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \IvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Ivla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)

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

    \pageBreak

    \markup \huge {[3.] Ciaccona }

    \score {

        \new StaffGroup  <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino 1]"}
                \set Staff.shortInstrumentName = "vl1"
                \IIvlI
            >>

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\column  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIbc
            >>
        >>

        \layout {

            indent = 1.8\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #9
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

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller{Concerto per Violino in Si minore [RV 390]}
        composer = \markup \center-column{"A. Vivaldi (1678-1741)"}

    }

    \markup \huge {[1.] And[ant]e molto }

    \score {

        \new StaffGroup \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }  <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino""principale]"}
                \set Staff.shortInstrumentName = "vlp"
                \IIIvlI
            >>

            \new StaffGroup \with {
                \override StaffGrouper.staff-staff-spacing.basic-distance = #3 } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\column  {"[Violino 1]"}
                \set Staff.shortInstrumentName = "vl1"
                \IIIvlII
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\column  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \IIIvlIII
            >>
        >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \IIIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 1.8\cm
            #(layout-set-staff-size 18)

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[2.] Larghetto }

    \score {

        \new StaffGroup   <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino""principale]"}
                \set Staff.shortInstrumentName = "vlp"
                \IVvlI
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"acoustic guitar (nylon)"
                \set Staff.instrumentName = \markup\column  {"[Violini 1]""Pizzicati"}
                \set Staff.shortInstrumentName = "vl1"
                \IVvlII
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"acoustic guitar (nylon)"
                \set Staff.instrumentName = \markup\column  {"[Violini 2]""Pizzicati"}
                \set Staff.shortInstrumentName = "vl2"
                \IVvlIII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"acoustic guitar (nylon)"
                \set Staff.instrumentName = \markup\center-column  {"[Viole]""Pizzicate"}
                \set Staff.shortInstrumentName = "vla"
                \IVvla
            >>
        >>

        \layout {

            indent = 1.8\cm
            #(layout-set-staff-size 18)

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[3.] All[egr]o }

    \score {

        \new StaffGroup \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #2 }  <<

            \new Staff  = "main" <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column {"[Violino""principale]"}
                \set Staff.shortInstrumentName = "vlp"
                \VvlI
            >>

            \new StaffGroup \with {
                \override StaffGrouper.staff-staff-spacing.basic-distance = #3 } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\column  {"[Violino 1]"}
                \set Staff.shortInstrumentName = "vl1"
                \VvlII
            >>

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup\column  {"[Violino 2]"}
                \set Staff.shortInstrumentName = "vl2"
                \VvlIII
            >>
        >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  {"[Viola]"}
                \set Staff.shortInstrumentName = "vla"
                \Vvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \set Staff.shortInstrumentName = "bc"
                \Vbc
            >>
        >>

        \layout {

            indent = 1.8\cm
            #(layout-set-staff-size 18)

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
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
