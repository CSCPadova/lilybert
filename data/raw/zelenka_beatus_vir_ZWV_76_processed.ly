\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

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

dolce = _\markup\italic"doux"

fort = _\markup\italic"fort"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { solo }

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



IvlIn = \relative do'' {

    R1*2\set Staff.midiInstrument = #"oboe"
    sol2_\markup\italic "V.[iolino] e Oboe" mi'4.  fa16^\markup\italic "stacc[ato] sempre" mi
    re8 sol, r sol' do,16(si) do8 la'8.(do,16)\mbreak

    %5
    do8(si) sib4. do16 sib la8 sol
    la fa do'4. re16 do si?8 la
    si sol r do16 sib la8 fa fa' la,

    %8
    sib4 r8 re16 do si8 sol sol' si,\mbreak
    do4 r8 r16 re mib8 r16 mi fa8 r16 fad
    sol8 sol, fa'?4. sol16 fa mi8 re

    %11
    mi8 do sol'4. la16 sol fa8 mi
    fa si r16 do sol fa mi si do re re8. do16\mbreak
    do2 r

    %14
    R1\set Staff.midiInstrument = #"violin"
    sol2^\markup\italic "V.[iolino]" mi'4. fa16 mi\mbreak
    re8 sol, r sol' do,16(si) do8 la'8.(do,16)

    %17
    do8(si) r sol16\p fa mi8 do do' mi,
    fa4 r8 la16 sol fad8 re re' fad,\mbreak
    sol la si do re do re re,

    %20
    sol, sol'\f re'4. mi16 re do8 si
    do la do4. re16 do si8 la\mbreak
    si sol' la, fad' <sol si, re, sol,>4 r

    %23
    r2 r4 re8 re
    mi8. mi16 mi8 mi re re16 do si8 re\mbreak

    %25
    mi mi, mi' re do do16 do do8 si16 dod
    re1~
    re4 do?8 do si8. si16 do4\mbreak

    %28
    si4. si8 la4 mi'8 re
    do do16 re mi8 fad fad4 mi
    r8 red8 mi mi red dod16 red mi4~\mbreak

    %31
    mi red8. red16 mi8 mi mi mi
    mi mi re? re16 re re8 re re4
    re2 r\mbreak

    %34
    R1*4\set Staff.midiInstrument = #"oboe"
    r8 la^\markup\italic "V. e Oboe" re4. mi16 re do8 si
    do la mi'4. fad16 mi re8 dod\mbreak

    %40
    re si r si16 la sold8 mi mi' sold,
    la la' si, sold'  <la do, mi, la,>4 r
    R1

    %43
    r2 r4 r8 re,
    mi4 re8 si do do re mi
    la,4 re8 si do4. do8\mbreak

    %46
    la4 r r8 re mi mi
    do do fa fa re re do4~
    do si8. si16 do4 \set Staff.midiInstrument = #"violin" do,^\markup\italic "V.[iolino]"\mbreak

    %49
    la'4. sib16 la sol8 do, r do'
    fa,16(mi) fa8 re'8. fa,16 fa8 mi16 re do8 mi
    sol2~sol8\p si16 (la) sol4~

    %52
    sol8 fad16 mi fad8. sol16 sol8 re\f sib'4~\mbreak
    sib8 do16 sib la8 sol la fa? r4
    r8 fad\p re re' re,4 r

    %55
    r8 sold mi mi' mi,4 r
    R1
    r2 r4 r8 si'\f

    %58
    do r16 dod re8 r16 red mi8 mi, r4
    r2 r4 r8 fad'16\f mi
    red8 si si' red, mi16\p(fad) fad(sol) sol8 fad\mbreak

    %61
    mi16 (fad) fad(sol) la8 sol fad8. (sol16) sol8.\tr fad16
    fad?4 r8 r16 fad!\f sol8 r16 sold la8 r16 lad
    si8 si, la'?4. si16 la sol?8 fad

    %64
    sol mi fad, fad' r \set Staff.midiInstrument = #"oboe" mi^\markup\italic "[Violino e Oboe]" si sol\mbreak
    r8 mi sol si mi si16 dod red8 si
    r mi si sol do? la mi4

    %67
    do'8 mi4 mi,8 mi'4 mi8 mi
    re8. re16 re4 r2\mbreak
    R1*2

    %71
    r4 re8. re16 si8 sol si re
    sol8. sol16 sol8 fa mi16 fa re fa mi do re fa\mbreak
    mi fa re fa mi4. re4 do16 si

    %74
    la8 re, re'8. do16 si2\fermata
    R1*2\mbreak
    r2\fermata r16 do do do re la re do

    %78
    do8\upl si\upl r4 r sib4~
    sib8 do16 sib? la8 sol la fa do'4~
    do8 re16 do si?8 la si sol r do16 sib

    %81 OOKK
    la8 fa fa' la, sib re r re16 do
    si!8 sol sol' si, do re mib re
    do2. si4

    %84
    r do8 do reb reb16 reb reb8 do\mbreak
    si!4 do2 sib8 sib
    lab2 sol8 sol mib'4

    %87
    re r8 r16 re mib8 r16 mi fa8 r16 fad
    sol8 sol, fa'?4. sol16 fa mi8 mi\mbreak
    mi do sol'4. la16 sol fa8 mi

    %90
    fa si r16 do sol fa mi si do re re8. do16
    do do si la sol fa mi re do8 sol' do4

}

IvlIIn = \relative do'' {

    \set Staff.midiInstrument = #"oboe" do,2^\markup\italic "V.[iolino] e Oboe" la'4. sib16^\markup\italic "stacc[ato] sempre" la
    sol8 do, r do' fa,16(mi) fa8 re'8.(fa,16)
    fa8 mi16(fa) sol8 sol sol4 r8 do

    %4
    sol si16 do re8 si~si la16 sol fad8 la\mbreak
    sol re'4 sib16 la sol8 mi' r sol
    do, fa4 do16 si? la8 fad' r la

    %7
    re, sol r8 do,16 sib la8 fa fa'? la,
    sib4 r8 re16 do si8 sol sol' si,\mbreak
    do4 r8 r16 re mib8 r16 mi fa8 r16 fad

    %10
    sol8 sol, r la re, si' r sol'
    sol, mi' r sol,16 fa mi8 dod' r mi
    la,(sol) r re' sol, do?4 si8\mbreak

    %13
    do2 r
    R1*3\set Staff.midiInstrument = #"violin"
    r4 r8 sol16^\markup\italic "V.[iolino]"\p fa mi8 do do' mi,

    %18
    fa4 r8 la16 sol fad8 re re' fad,\mbreak
    sol la si do re do re re,
    sol, si'16\f la sol8 fad mi si' la sold

    %21
    la do16 si la8 mi la fad sol? fad\mbreak
    sol fad16 mi fad8 la si sol, r4
    r2 r4 re''8 re

    %24
    mi8. mi16 mi8 mi re re16 do si8 re\mbreak
    mi mi, mi' re do do16 do do8 si16 dod
    re1~

    %27
    re4 do?8 do si8. si16 do4\mbreak
    si4. si8 la4 mi'8 re
    do do16 re mi8 fad fad4 mi

    %30
    r8 red8 mi mi red dod16 red mi4~\mbreak
    mi red8. red16 mi8 mi mi mi
    mi mi re? re16 re re8 re re4

    %33
    re2 r\mbreak
    R1*4\set Staff.midiInstrument = #"oboe"
    r4 r8 si16^\markup\italic "V. e Oboe" la sold8 mi mi' sold,

    %39
    la4 r8 dod16 si lad8 fad? fad'? lad,\mbreak
    si4 r8 si16 la? sold8 mi mi' sold,
    la la' si, sold' <la do, mi, la,>4 r

    %42
    R1
    r2 r4 r8 re,
    mi4 re8 si do do re mi

    %45
    la,4 re8 si do4. do8\mbreak
    la4 r r8 re mi mi
    do do fa fa re re do4~

    %48
    do si8. si16 do8 \set Staff.midiInstrument = #"violin" mi,16^\markup\italic "V.[iolino]" fa sol8 mi\mbreak
    do4 r8 fa do mi16 re do8 mi
    la,4 r8 si do4 r

    %51
    R1*6
    r2 r4 si'\f~
    si8 la4 sold16 fad sold8 si r4

    %59
    R1*3
    r4 fad'4.\f mi4 red16 dod?
    red8 fad? la4. si16 la sol8 fad!

    %64
    sol mi fad, red' r \set Staff.midiInstrument = #"oboe" mi^\markup\italic "[Violino e Oboe]"si sol\mbreak
    r8 mi sol si mi si16 dod red8 si
    r mi si sol do? la mi4

    %67
    do'8 mi4 mi,8 mi'4 mi8 mi
    re8. re16 re4 r2\mbreak
    R1*2

    %71
    r4 re8. re16 si8 sol si re
    sol8. sol16 sol8 fa mi16 fa re fa mi do re fa\mbreak
    mi fa re fa mi4. re4 do16 si

    %74
    la8 re, re'8. do16 si2\fermata
    R1*2\mbreak
    r2\fermata r16 do do do re la re do

    %78
    do8\upl si\upl r4 r sib4~
    sib8 do16 sib? la8 sol la fa do'4~
    do8 re16 do si?8 la si sol r do16 sib

    %81
    la8 fa fa' la, sib re r re16 do
    si!8 sol sol' si, do re mib re
    do2. si4

    %84
    r do8 do reb reb16 reb reb8 do\mbreak
    si!4 do2 sib8 sib
    lab2 sol8 sol mib'4

    %87
    re4 r8 r16 re mib8 r16 mi fa8 r16 fad
    sol8 sol, r la re, si' r sol'\mbreak
    sol, mi' r sol,16 fa mi8 dod' r mi

    %90
    la,(sol) r re' sol, do4 si8
    do16 do si la sol fa mi re do8 sol' do4

}

IvlaIn = \relative do'{

    mi8^\markup\italic "stacc[ato] sempre" fa sol mi do4 r8 fa
    do mi16 re do8 mi la,4 r8 si
    do4 r8 si do re sol, la

    %4
    re4 r8 mi mi4 r8 fad\mbreak
    re4 r8 re mi sol mi do
    fa la r mi fad la fad re

    %7
    sol re sol, sol' do,4 r8 mib
    fa re la la' re,4 r8 fa?\mbreak
    sol fa mib sol sol, sol' do, do'

    %10
    si si,16 do re8 re sol re r re
    do sol'16 fa mi8 si r mi dod la'16 sol
    fa8 re sol4 r8 mi la sol\mbreak

    %13
    sol2 r
    R1*3
    r4 r8 sol16\p fa mi8 do do' mi,

    %18
    fa4 r8 la16 sol fad8 re re' fad,\mbreak
    sol la si do re do re re,
    sol sol, r4 r8 sold'\f mi8. mi16

    %21
    mi4 r re re8. re16\mbreak
    re4 r8 re re4 r
    r la'8 la si8. si16 si8 si16 la

    %24
    sol8 sol16 sol sol8 sol sol re r4\mbreak
    sol8 fa mi fa16 sol la8 la la4~
    la8 la, la' sol fa sol16 sol la8 si16 la

    %27
    sold4 la8 la la sold16 sold la4~~
    la8 la sold4 la2~
    la~la4 sol?8 sol

    %30
    fad si sol4(fad8.) fad16 sol4\mbreak
    fad4. fad8 sol sol sold sold
    la la la la16 la la8 sol sol4~

    %33
    sol fad r2
    R1*5
    r2 r4 r8 fad\mbreak

    %40
    si4\upl fad\upl mi8 sold16 fad mi8 re
    mi8. mi16 fa?8 si, do la r4
    R1*2

    %44
    r4 sol' la sol8 mi
    fa fa sol sol sol sol mi8. mi16\mbreak
    fa4 r8 fa sol sol mi8. mi16

    %47
    la8 la la fa sol2~
    sol4~sol8 sol sol2\mbreak
    R1*16

    %65
    r4 r8 red si mi fad sol
    si sol mi r r la, do mi
    la mi 16 fad  sold8 la la4 la8. sol?16

    %68
    fad8. fad16 fad4 r2\mbreak
    R1*2
    r2 r4 sol8. sol16

    %72
    mi8 do mi sol do si16 la sol8 sol\mbreak
    sol4. la16 sol fad4 sol~
    sol fad8. fad16 sol2\fermata

    %75
    R1*2
    r2\fermata r16 fa fa fa la la la la
    sol8\upl sol\upl r4 r2

    %79
    sol16 sol sol sol mi8(do) do4 r
    la'16 la la la fad8 re re4 r\mbreak
    fa?16 fa fa fa  fa8 do' fa,4 r

    %82
    sol16 sol sol sol sol8 re' sol,8 sol sol4~
    sol fad sol2
    r r4 fa?8 fa\mbreak

    %85
    lab8 lab16 lab lab8 sol fad4 sol8 re
    mib4 fa?8 mib re4 sol8 sol
    sol2  sol8 sol do, do'

    %88
    si4 r8 re,16 do si8 sol sol' si,\mbreak
    do8. re16 mi8 si r mi dod la'16 sol
    fa8 re sol4 r8 mi la sol

    %91
    sol4 r16 sol sol sol mi8 sol do4

}

IvlaIIn = \relative do' {

    mi8^\markup\italic "stacc[ato] sempre" fa sol mi do4 r8 fa
    do mi16 re do8 mi la,4 r8 si
    do4 r8 si do re sol, la

    %4
    re4 r8 mi mi4 r8 fad\mbreak
    re4 r8 re mi sol mi do
    fa la r mi fad la fad re

    %7
    sol re sol, sol' do,4 r8 mib
    fa re la la' re,4 r8 fa?\mbreak
    sol fa mib sol sol, sol' do, do'

    %10
    si si,16 do re8 re sol re r re
    do sol'16 fa mi?8 si r mi dod la'16 sol
    fa8 re sol4 r8 mi la sol\mbreak

    %13
    sol2 r
    R1*3
    r4 r8 sol16\p fa mi8 do do' mi,

    %18
    fa4 r8 la16 sol fad8 re re' fad,\mbreak
    sol la si do re do re re,
    sol sol, r4 r8 sold'\f mi8. mi16

    %21
    mi4 r re re8. re16\mbreak
    re4 r8 re re4 r8 sol,
    re'8. re16 re8 re si sol16 la si8 si

    %24
    do do, do' do16 do sol'8 sol sol8. fa16\mbreak
    mi8 re do re16 mi fa4 mi
    fa8 mi re mi16 mi fa8 mi re8. do16

    %27
    si4 do8 re mi4. mi8\mbreak
    mi4 mi8 re do do16 si la8 si
    do si la dod red8. red16 mi4

    %30
    r8 fad mi mi fad8. fad16 si,4\mbreak
    si4. si8 si si si si
    do do do do16 do si8 si si4

    %33
    la2 r
    R1*5
    r2 r4 r8 fad'\mbreak

    %40
    si4\upl fad\upl mi8 sold16 fad mi8 re
    mi8. mi16 fa?8 si, do la r4
    R1*3

    %45
    re8 re si si mi4 do8 do\mbreak
    fa8 fa re8. re16 sib4 r8 do
    fa fa fa2 mi4

    %48
    re4. re8 mi2\mbreak
    R1*16
    r4 mi8 si sol4 r8 mi

    %66
    sol si mi4 do r8 do
    la do r la do mi mi do16 si
    la8. la16 la4 r2\mbreak

    %69
    r4 r8 re re re16 re do8 la
    si4 do8 dod re8. do?16 si8 sol
    la4. la8 sol2

    %72
    r do,8 sol' do si\mbreak
    do re do2 si8 do
    re do16 si la8. la16 sol2\fermata

    %75
    R1*2
    r2\fermata r16 la la la la la la la
    re8\upl re\upl r4 r r8 sol,16 fa

    %79
    mi8 do do' mi, fa la r la16 sol
    fad8 re re' fad, sol si do sol\mbreak
    do do sib16 sib mib mib re8 re, r4

    %82
    re'8 re do16 do fa fa mib8 mib, r sol
    lab si ?do4 re re8 re
    do do16 do do8 sib lab4 lab\mbreak

    %85
    re8 re mib mib16 mib la,?8 mib' re4
    do re8 do si!4  do~
    do si do8 sol' do, do'

    %88
    si4 r8 re,16 do si8 sol sol' si,\mbreak
    do8. re16 mi8 si r mi dod la'16 sol
    fa8 re sol4 r8 mi la sol

    %91
    sol4 r16 sol sol sol mi8 sol do4

}

Isopranon = \relative do'' {

    \autoBeamOff

    R1*22
    r2 r4 re8 re
    mi8. mi16 mi8 mi re re16 do si8 re\mbreak

    %25
    mi mi, mi' re do do16 do do8 si16 [dod]
    re1~
    re4 do?8 do si8. si16 do4\mbreak

    %28
    si4. si8 la4 mi'8 re
    do do16 re mi8 fad fad4 mi
    r8 red8 mi mi red dod16 red mi4~\mbreak

    %31
    mi red8. red16 mi8 mi mi mi
    mi mi re? re16 re re8 re re4
    re2 r4 la\mbreak

    %34
    sib4. sib8 la re do sib
    la4 sib8 do la4 sib
    la2 sol8[fa? mi re]\mbreak

    %37
    mi4 fa8 [sol] la2
    la r
    R1*2

    %41
    r2 r8 mi' mi16[re] do[re]
    mi4 do8 mi la,8. si16 do4~\mbreak
    do re8 do do8. do16 si8 re

    %44
    mi4 re8 si do do re [mi]
    la,4 re8 si do4. do8\mbreak
    la4 r r8 re mi mi

    %47
    do do fa fa re re do4~
    do si8. si16 do2\mbreak
    R1*16

    %65
    r8 mi, sol si mi si16 dod red8 si
    r mi si sol do? la mi4
    do'8 mi4 mi,8 mi'4 mi8 mi

    %68
    re8. re16 re4 r2\mbreak
    R1*2
    r4 re8. re16 si8 sol si re

    %72
    sol8. sol16 sol8 fa mi16 [fa re fa] mi [do re fa]\mbreak
    mi [fa re fa] mi4. re4 do16 [si]
    la8 [re,] re'8. do16 si2\fermata

    %75
    r4 si si2
    do4 re do2\mbreak
    do2\fermata r16 do do do re la re do

    %78
    do8\upl si\upl r4 r sib4~
    sib8 do16 sib? la8 sol la fa do'4~
    do8 re16 do si?8 la si sol r do16 [sib]

    %81 OOKK
    la8 [fa fa' la,] sib re r re16 [do]
    si!8 [sol sol' si,] do re mib re
    do2. si4

    %84
    r do8 do reb reb16 reb reb8 do\mbreak
    si!4 do2 sib8 sib
    lab2 sol8 sol mib'4

    %87
    re2 do4 r
    R1*4

}

ItestoI = \lyricmode {

    Ge -- ne -- ra -- ti -- o re -- ctorum _ be -- ne -- di -- cetur, _
    et jus -- ti -- tia _ e -- jus ma -- net
    in sae -- culum _ sae -- cu -- li,
    et jus -- ti -- ti -- a e -- jus ma -- net ma -- net
    in sae -- culum _ sae - culi. _
    Ex -- or -- tum est in te -- nebris _ lu -- men re -- ctis,
    mi -- se -- ri -- cors et mi -- se -- ra -- tor, et jus - tus, et - - jus -- tus.
    Ju -- cun -- dus ho -- mo, qui mi -- se -- re -- tur et com -- mo -- dat,
    dis -- po -- net ser -- mones _ su -- os in ju -- di -- ci -- o,
    non com -- mo -- ve -- bitur, _ non com -- mo -- ve - bi -- tur.
    Dis -- per -- sit, de -- dit, dis -- per -- sit, dis -- per -- sit, dis -- per -- sit, dis -- per -- sit,
    de -- dit pau -- pe -- ribus. _
    Cor -- nu e -- ius ex -- al -- ta -- bitur _ in glo - - - - - - - ri -- a.
    Pec -- ca -- tor vi -- de -- bit et i -- ra -- sce -- tur, i -- ra -- sce -- tur,
    den -- ti -- bus su -- is fre -- met, den -- ti -- bus su -- is fre -- met, fre - - met,  fre - - met et ta -- be -- scet;
    de -- si -- de -- rium _ pec -- ca -- to - rum pe -- ri  -- bit, pe -- ri - bit.

}

Ialton = \relative do' {

    \autoBeamOff

    R1*22
    r4 la'8 la si8. si16 si8 si16 [la]

    %24
    sol8 sol16 sol sol8 sol sol re r4\mbreak
    sol8 fa mi fa16 sol la8 la la4~
    la8 la, la' sol fa sol16 sol la8 si16 [la]

    %27
    sold4 la8 la la sold16 sold la4~~
    la8 la sold4 la2~
    la~la4 sol?8 sol

    %30
    fad si sol4(fad8.) fad16 sol4\mbreak
    fad4. fad8 sol sol sold sold
    la la la la16 la la8 sol? sol4~

    %33
    sol fad r fad\mbreak
    sol4. sol8 fad sib la sol
    sol[fad] sol la fad la sol4~

    %36
    sol fad sol2~\mbreak
    sol4 fa! mi2
    fad r

    %39
    R1*2
    r2 r8 la do16[si] la[si]
    la4 la8 la la la la4~

    %43
    la la8 la sol8. sol16 sol4
    r sol la sol8 mi
    fa fa sol sol sol sol mi8. mi16\mbreak

    %46
    fa4 r8 fa sol sol mi8. mi16
    la8 la la fa sol2~
    sol4~sol8 sol sol2\mbreak

    %49
    R1*16

    %65
    r4 r8 red si mi fad sol
    si sol mi r r la, do mi
    la mi 16 fad  sold8 la la4 la8. sol?16

    %68
    fad8. fad16 fad4 r2\mbreak
    R1*2
    r2 r4 sol8. sol16

    %72
    mi8 do mi sol do si16 [la] sol8 sol\mbreak
    sol4. la16 [sol] fad4 sol~
    sol fad8. fad16 sol2\fermata

    %75
    r2 r4 sol
    sol sol8 sol16[fa?] mi2\mbreak
    fa2\fermata r16 fa fa fa la la la la
    sol8\upl sol\upl r4 r2

    %79
    sol16 sol sol sol mi8([do]) do4 r
    la'16 la la la fad8 [(re)] re4 r\mbreak
    fa?16 fa fa fa  fa8 [do'] fa,4 r

    %82
    sol16 sol sol sol sol8 [re'] sol,8 sol sol4~
    sol fad sol2
    r r4 fa?8 fa\mbreak

    %85
    lab8 lab16 lab lab8 sol fad4 sol8 re
    mib4 fa?8 mib re4 sol8 sol
    sol2  sol4 r

    %88
    R1*4

}

ItestoII = \lyricmode {

    Ge -- ne -- ra -- ti -- o re -- ctorum _ be -- nedi - cetur, _
    et ju -- sti -- tia _ e -- jus ma -- net, et ju -- sti -- tia _ e -- jus ma -- net,
    in sae -- culum _ sae -- cu -- li,  ma -- net ma -- net
    in sae -- culum _ sae -- cu -- li.
    Ex -- or -- tum est in te -- nebris _ lu -- men re -- ctis,
    mi -- se -- ri -- cors et mi -- se -- ra -- tor, et mi -- se -- ra -- tor, et - jus -- tus.
    Ju -- cun -- dus ho -- mo, qui mi -- se -- re -- tur et com -- mo -- dat,
    dis -- po -- net ser -- mones _ su -- os in ju -- di -- ci -- o,
    non com -- mo -- ve -- bi -- tur, non com -- mo -- ve -- bi -- tur.
    Dis -- per -- sit de -- dit, dis -- per -- sit, dis -- per -- sit de -- dit, dis -- per -- sit de -- dit pau -- pe -- ribus. _ %% bar 68 OOKK
    Cor -- nu e -- jus ex -- al -- ta -- bi -- tur in glo - - - - ri -- a.
    Pec -- ca -- tor vi -- de -- bit et i -- ra -- sce -- tur, i -- ra -- sce -- tur,
    fre -- met et ta -- be -- scet, fre -- met et ta -- be -- scet, fre -- met et ta -- be -- scet,
    fre -- met et ta -- be -- scet, ta -- be - scet,
    de -- si -- de -- rium _ pec -- ca -- to -- rum pe -- ri  -- bit, pe -- ri -- bit, pe -- ri -- bit.

}

Itenoren = \relative do' {

    \autoBeamOff

    R1*21
    r2 r4 r8 sol
    re'8. re16 re8 re si sol16 [la] si8 si

    %24
    do do, do' do16 do sol'8 sol sol8. fa16\mbreak
    mi8 re do re16 [mi] fa4 mi
    fa8 mi re mi16 mi fa8 mi re8. [do16]

    %27
    si4 do8 re mi4. mi8\mbreak
    mi4 mi8 re do do16 si la8 si
    do [si] la dod red8. red16 mi4

    %30
    r8 fad mi mi fad8. fad16 si,4\mbreak
    si4. si8 si si si si
    do do do do16 do si8 si si4

    %33
    la re4 re4. re8\mbreak
    re,4 re' re re
    re2 re4 re

    %36
    re4. do8 si4 la8 si\mbreak
    dod4 re2 dod4
    re2 r

    %39
    R1*2
    r2 r8 la la la
    do la16 mi' mi[re] do[re] mi8 mi16 mi mi8 mi\mbreak

    %43
    fa4 fa8 mi re8. re16 re4
    R1
    re8 re si si mi4 do8 do\mbreak

    %46
    fa8 fa re8. re16 sib4 r8 do
    fa fa fa2 mi4
    re4. re8 mi2\mbreak

    %49
    R1
    r2 sol,4. sol8
    mi'4. fa16[mi] re4 r8 sol

    %52
    do, la16[si] do8 do do si r4\mbreak
    r2 r8 la do4~
    do8[re16 do] si8[la] si[sol] re'4~

    %55
    re8[mi16 re] do8[si] do re mi4~
    mi re4. do16 si do4~\mbreak
    do8 la16 si do8. si16 si2

    %58
    r2 r4 r8 mi16[re]
    dod8 la la'[dod,] re4 do
    si4. si8 mi, si' mi re\mbreak

    %61
    dod8 dod16 dod fad8 mi red si mi4~
    mi8[red16 dod] red4 mi r
    R1*2\mbreak

    %65
    r4 mi8 si sol4 r8 mi
    sol si mi4 do r8 do
    la do r la do mi mi do16 si
    la8. la16 la4 r2\mbreak

    %69
    r4 r8 re re re16 re do8 la
    si4 do8 dod re8. do?16 si8 [sol]
    la4. la8 sol2

    %72
    r do,8 sol' do si\mbreak
    do re do2 si8 [do]
    re [do16 si] la8. la16 sol2\fermata

    %75
    r2 mi'
    mi4 si8 si do2\mbreak
    la\fermata r16 la la la la la la la
    re8\upl re\upl r4 r r8 sol,16 [fa]

    %79
    mi8 [do do' mi,] fa la r la16 [sol]
    fad8 [re] re' [fad,] sol si do sol\mbreak
    do do sib16 sib mib mib re8 re, r4

    %82
    re'8 re do16 do fa fa mib8 mib, r sol
    lab [si ?] do4 re re8 re
    do do16 do do8 sib lab4 lab\mbreak

    %85
    re8 re mib mib16 mib la,?8 mib' re4
    do re8 [do] si!4  do~
    do si do r

    %88
    R1*4

}

ItestoIII = \lyricmode {

    Po -- tens in ter -- ra e -- rit se -- men e -- jus,
    glo -- ria _  et di -- vi -- ti -- ae in do -- mo e -- jus,
    et jus -- ti -- tia _ e -- jus ma - net in sae -- cu -- lum,   et jus -- ti -- ti -- a e -- jus ma -- net in sae -- culum, _
    ma -- net in sae -- culum _ sae -- cu -- li.
    Ex -- or -- tum est in te -- nebris _ lu -- men re -- ctis,
    mi -- se -- ri -- cors et mi -- se -- ra -- tor, et mi -- se -- ra -- tor et jus - - tus.  %% bar 38 OOKK
    Ju -- cun -- dus ho -- mo, ju -- cun -- dus ho -- mo
    qui mi -- se -- re -- tur et com -- mo -- dat,
    qui -- a in ae -- ter -- num non com -- mo -- ve -- bitur, _ non com -- mo -- ve - - bi -- tur.
    In me -- mo -- ri -- a ae -- ter -- na e -- rit ju -- stus.
    Pa -- ra - - - - - tum cor e -- jus spe -- ra -- re in Do -- mi -- no.
    Non com -- mo -- ve - - - bitur _
    do -- nec de -- spi -- ciat _ i -- ni -- mi -- cos su - os.
    Dis -- per -- sit, dis -- per -- sit de -- dit, dis -- per -- sit,  dis -- per -- sit de -- dit pau -- pe -- ribus, _
    ju -- sti -- tia _ e -- jus ma -- net
    in sae -- cu -- lum sae -- cu -- li.
    Ex -- al -- ta -- bi -- tur in glo - - - ri -- a.
    Pec -- ca -- tor vi -- de -- bit et i -- ra -- sce -- tur, i -- ra -- sce -- tur
    fre - - met, fre - - - met, fre -- met, fre -- met, fre -- met  et ta -- be -- scet, fre -- met, fre -- met
    et ta -- be -- scet, et ta -- be -- scet;
    de -- si -- de -- rium _ pec -- ca -- to -- rum, de -- si -- de -- rium _ pec -- ca -- to -- rum pe -- ri - - bit.

}

Ibasson = \relative do {

    \autoBeamOff

    R1*12
    do2 la'4. si16 [do]
    sol4 r8 do fa, fa fa8. mi16

    %15
    mi4 do8 mi sol2~\mbreak
    sol8 [si16 la] sol8 sol sol4 fad
    r8 sol sib4. do16[sib] la8[sol]

    %18
    la[fa?] do'4. re16[do] si?8[la]\mbreak
    si[fad] sol[mi'] fad,4. sol8
    sol2 r

    %21
    R1\mbreak
    r4 r8 re sol8. sol16 sol8 sol
    fad8 re16 [mi] fad8 fad sol sol, sol' sol16 sol

    %24
    do8 do do8. do16 si8 la sol si\mbreak
    do4 do, r la'8 sol
    fa8 fa16 fa fa8 mi re [mi] fa re

    %27
    mi2. mi8 mi\mbreak
    mi4. mi8 la,4 do'8 si
    la la16 si do8 la si2~

    %30
    si4 si8 si si4. si16 si\mbreak
    si4. si8 mi, mi mi mi
    la la fad fad16 fad sol8 sol sol4

    %33
    re re' re4. re8\mbreak
    re,4 re' re re
    re2 re,4 sol

    %36
    re4. re8 mi[re] dod si\mbreak
    la1
    re2 r

    %39
    R1*3
    r8 la' la la do la16 la la8 sol\mbreak
    fa[mi] re fad sol8. sol,16 sol4

    %44
    R1
    r4 sol'8 sol mi mi la4\mbreak
    fa8 fa sib sib sol8. sol16 do4

    %47
    r8 la re re si?4 do
    sol4. sol8 do,2\mbreak
    R1*2

    %51
    r4 do'8 do do8. do16 si8 sol
    la la re, re sol4 r8 sol16[fa]\mbreak
    mi8[do do' mi,] fa4 r8 la16[sol]

    %54
    fad8[re re' fad,] sol4 r8 si16[la]
    sold8[mi mi' sold,] la[do] si mi,
    la4. la8 sold sold la mi\mbreak

    %57
    fad8.[sold16] la2 sold4
    r2 r8 mi sol!4~
    sol8 [la16 sol] fa?8 mi fa[re] la'4~

    %60
    la8[si16 la] sol8 [fad] sol8. fad16 mi8 mi\mbreak
    la sol fad fad16 fad si8 la sol la
    si4 si, mi r

    %63
    R1*2\mbreak
    r2 r8 mi' si sol
    mi8.[fad16] sol8 mi la8. la16 la4

    %67
    r8 la mi do la8. [si16] do8 la
    re8. re16 re4 r r8 sol\mbreak
    sol sol16 sol fa!8 re mi4 fa8 fad

    %70
    sol8. fa!16 mi4 re8[fad] sol4~
    sol fad8. fad16 sol2
    r r4 do,8 sol'\mbreak

    %73
    do si do la re4 (sol,)
    re4. re8 mi2\fermata
    r r4 mi

    %76
    do sol'8 sol la2\mbreak
    fa\fermata r16 fa fa fa fad fad fad fad
    sol8\upl sol\upl r4 r2

    %79
    R1
    r2 r4 mib~\mbreak
    mib8 fa16 mib re8 do re sib fa'4~

    %82
    fa8 sol16 fa mib8 re mib re do sib?
    lab2 sol4 sol'8 sol
    lab lab16 lab lab8 sol fa2~\mbreak

    %85
    fa4 mib8 mib re4 sol~
    sol fa2 mib8[fa]
    sol2 do,4 r

    %88
    R1*4

}

ItestoIV = \lyricmode {

    Be -- a -- tus vir qui ti -- met Do -- mi -- num,
    in man -- da - tis e -- jus vo - - - - - - - - let ni - mis.
    Po -- tens in ter -- ra e -- rit se -- men e -- jus,
    %Generatio rectorum benedicetur.
    glo -- ria _  et di -- vi -- ti -- ae in do -- mo e -- jus,
    et jus -- ti -- tia _ e -- jus ma -- net
    in sae -- culum _ sae -- cu -- li,
    et jus -- ti -- ti -- a e -- jus ma -- net
    in sae -- culum _ sae -- cu -- li.
    Ex -- or -- tum est in te -- nebris _ lu -- men re -- ctis,
    mi -- se -- ri -- cors et mi -- se -- ra -- tor, et mi -- se -- ra -- tor et jus -- tus.
    Ju -- cun -- dus ho -- mo,
    qui mi -- se -- re -- tur et com -- mo -- dat,
    qui -- a in ae -- ter -- num non com -- mo -- ve -- bitur, _ non com -- mo -- ve - - bi -- tur.
    Ab au -- di -- ti -- one _ ma -- la non ti -- me - - - - - - - - - - bit.
    Con -- fir -- ma -- tum est cor e - jus;
    non com - mo -- ve - - - bitur _
    do -- nec de -- spi -- ciat _ i -- ni -- mi -- cos su - os.
    Dis -- per -- sit, de -- dit pau -- pe -- ribus, _ dis -- per -- sit, de -- dit pau -- pe -- ribus, _
    ju -- sti -- tia _ e -- jus ma -- net
    in sae -- cu -- lum sae - - cu -- li.
    Ex -- al -- ta -- bitur _ in glo - ri -- a.
    Pec -- ca -- tor vi -- de -- bit et i -- ra -- sce -- tur, i -- ra -- sce -- tur,
    den -- ti -- bus su -- is fre -- met, den -- ti -- bus su -- is fre -- met  et ta -- be -- scet;
    de -- si -- de -- rium _ pec -- ca -- to -- rum pe -- ri  - bit, pe -- ri -- bit.

}

Ibcn = \relative do {

    do8\solo^\markup\italic "stacc[ato] sempre" re mi do fa mi fa re
    mi re mi do re do si sol
    do re mi re do si do la

    %4
    sol la si sol la4 r8 re\mbreak
    sol,4 r8 sol'16 fa mi8 do do' mi,
    fa4 r8 la16 sol fad8 re re' fad,

    %7
    sol fa? mib4. fa16 mib re8 do
    re sib fa'4. sol16 fa mib8 re\mbreak
    mib re do si? do sib' lab la

    %10
    sol4 r8 re16 do si?8 sol sol' si,
    do4 r8 mi?16 re dod8 la  la' dod,
    re sol16 fa mi8 si do? la' fa sol\mbreak

    %13
    do,^\markup\italic "senza R.[ipieni]" re mi do fa mi fa re
    mi re mi do re do si sol
    do re mi re do do, r do'

    %16
    si la si sol la4 r8 re
    sol sol, r4 r2
    R1*2

    %20
    r4 r8 si'16 la sold8 mi mi' mi,
    la,4 r8 la'16 sol fad8 re re' re,\mbreak
    sol,4 r8 re'\upl^\tu sol8.\upl [sol16\upl sol8\upl sol\upl]

    %23
    fad8\upl re16\upl mi\upl fad8\upl re\upl sol\upl sol, sol' sol16 sol
    do8[do do8. do16] si8 la sol si\mbreak
    do4 do, r la'8 sol

    %26
    fa8 fa fa mi re mi fa re
    mi1~\mbreak
    mi4. mi8 la,4 do'8 si

    %29
    la[la16 si do8 la] si2~
    si~si\mbreak
    si4 si, mi,8 mi' mi mi

    %32
    la la fad fad sol sol sol4
    re re' re4.\upl re8\upl\mbreak
    re,4\upl re'\upl re\upl re\upl

    %35
    re2\upl re,4\upl sol\upl
    re2 mi8 re dod si\mbreak
    la1

    %38
    re
    R
    r8 si'^\markup\italic "R."_\solo re4. mi16 re do8 si

    %41
    do do, re mi la, \clef tenor la'\tu la la
    do \clef bass la la la do8 la16 la la8 sol\mbreak
    fa mi re fad sol4 \clef violin r8 re''

    %44
    <<{mi4 re8 si do do re mi}\\{r4 sol,  la sol8 mi}>>
    \clef tenor re8 re \clef bass sol, sol mi mi la4\mbreak
    fa8 fa sib sib sol8. sol16 do4

    %47
    r8 la re re si4 do
    sol4. sol8 do,\solo re mi do\mbreak
    fa mi fa re mi re mi do

    %50
    re do si sol do re mi re
    do do, r do' sol'4^\markup\italic "s.[enza] R." r
    r2 r4 sol,\mbreak

    %53
    do4 r8 do fa4 la,
    re r8 re sol4 si,
    mi r8 mi la4 sol?

    %56
    fa2 mi4 la,\mbreak
    red2 mi8^\markup\italic "R." fad sold mi
    la sol? fa fad mi4 r

    %59
    R1*3
    r4 r8 si'^\markup\italic "R." mi, re do dod
    si4 r8 fa'16 mi red8 si si' red,

    %64
    mi do' la si mi,4 r\mbreak
    \clef violin r8 mi'_\upl sol_\upl si_\upl mi \parenthesize \upl\clef bass mi, si sol
    mi 8.[fad16 sol8 mi] la8. la16 la4

    %67
    r8 la mi do la8.[si16 do8 la]
    re8. re16 re4 r r8 sol\upl\mbreak
    <<
        {
            r4 r8 re' re re do la

            %70
            si4 do8 dod re8. do?16 si4
        }\\{
            sol8 sol16 sol fa?8 re mi4 fa8 fad
            sol8. fa!16 mi4 re8 fad sol4\parenthesize ~
        }
    >>
    <<la\\sol>> fad sol\clef alto sol'8. sol16
    mi8 do mi sol \clef bass do,, sol'  do, sol'\mbreak

    %73
    do8 si do la re4 sol,
    re2 mi\fermata
    r r4 mi

    %76
    do sol' la2\mbreak
    fa\fermata r16 fa fa fa fad fad fad fad
    sol8\upl sol\upl r4  r r8 sol16 fa?

    %79
    mi 8do do' mi, fa la r la16 sol
    fad8 re re' fad, sol la mib4\parenthesize ~\mbreak
    mib8 fa?16 mib re8 do re sib fa'4~

    %82
    fa8 sol16 fa mib8 re mib re do sib
    lab2 sol4 sol'8 sol
    lab lab16 lab lab8 sol fa2~\mbreak

    %85
    fa4 mib8 mib re4 sol~
    sol fa2 mib8 fa
    sol2 do,8 sib'? lab la

    %88
    sol4 r r2\mbreak
    r4 r8 mi?16 re dod8 la la' dod,
    re sol16 fa mi8 si do? la' fa sol

    %91
    do,4 r16 do do do do2

}

Ibfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s1
    <6>2 <5>4 <6>
    <4> <6> s2
    <6> <7>4 s8 <_+>
    s4 s8 <_-> <5-> <5->\bassFigureExtendersOff <6> <6>
    s4 s8 <5> <6>4 <6 _+>
    s4 <6>8 s \bassFigureExtendersOn <6 4> <6 4> <6-> <6>\bassFigureExtendersOff
    <6-> <5 _-> <6>4 \bassFigureExtendersOn  <4! 2>8 <4! 2> <6> <6!>\bassFigureExtendersOff
    <6>4 s8 <_!> <_-> <4!> <6> <6\\>
    <_!>4 s8 <5> s2
    s4 s8 <5> <6> <_+> <6 _+> s
    s <5 _!> <6>4 s <6>
    s2 <5>4 s8 <6>
    <6>2 <5>
    s1
    s2 <7>4 s8 <_+>
    s1*6
    s2 s4 \bassFigureExtendersOn <5>8 <5>\bassFigureExtendersOff
    s1
    s2 s4 <5>8 <4\+>
    \bassFigureExtendersOn <6>4 <6> s s8 <6>
    \bassFigureExtendersOff <7 _+>4 <6 4> <5 _+> <6 4>
    <4> <_+> s <6>
    s <6>8 <6\\> <7 _+>4 <6 4>
    <5+ 3+> <6 4> <5+ _+> <6 4>
    <4> <_+> s <_+>
    s <6 5> <9> <8>
    <4> <_+> s2
    s1
    s2 s4 <5->
    <4> <_+> <6>8 s \bassFigureExtendersOn <6> <6>\bassFigureExtendersOff
    <7 _+>4 <6 4> <5 4> <_+>
    s1*2
    s4 <6 _+>4\bassFigureExtendersOn <4+>8 <4+> <6> <6\\>
    \bassFigureExtendersOff <6>4 <6>8 <_+> s \bassFigureExtendersOn <5>8 <5> <5>\bassFigureExtendersOff
    <6> <5> s4 <6>2
    s4 s8 <7> <4>2
    s1
    s2 <6>
    s <_->4 <5 _!>
    s8 <6> s4 <5>2
    <4>4. <3>8 s2

    %49 OOKK
    s2 <6>
    s1*4
    <_+>4 s8 <_+> s4 <5+>
    <_+>4 s8 <_+> s4 <6>
    <7> <6> <_+> s
    <7>2 <4>4 <6>
    s8 <4+> <6> <6\\> s2
    s1*3
    s4 s8 <_+> s <4+> <6> <6\\>
    <_+>4 s8 <5+> <6> <_+> s4
    s8 <5> <6\\> <_+> s2
    s s4 <_+>8 <6>
    s1
    s4 <_+> s2
    <_+>1
    s
    s
    s2 s4 <5>
    <6> s <5>8 <5> s4
    s2 <7 _+>
    <4+> <5>
    s s4 <5>
    s1
    s2 s4 <6 5>
    <4>8 <3> s4 s s8 <_->
    <6>2 s8 <6> s <5>
    <6> <_+> s4 s8 <6> <6>4
    <6 4>4 <6>8 <6> <6>4  <5>8 <6>
    <4! 2>4 <6>8 <6!> s2
    <7>4 <6\\> <4> <3!>
    <3> <5-> <6- 4>2
    <6 4! _->4 <6> <7 _+> s
    <6- 4 2-> <6> <6 4! 2> s
    <4>4 <_!> <_->8 <4!> <6> <6\\>
    <_!>1
    s4 s8 <5> <6>4 <_+>
    s2 s4 <6>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 45
    s1*74\once \override Score.RehearsalMark.extra-offset = #'(+4 . -2)
    \mark\markup\huge "Grave"
    \tempo 4 = 60
    s1*2
    s2\once \override Score.RehearsalMark.extra-offset = #'(+2 . -2)
    \mark\markup\huge "Vivace"
    \tempo 2 = 50
    s2
    s\once \override Score.RehearsalMark.extra-offset = #'(+9 . -2)
    \mark\markup\huge "Andante"
    \tempo 2 = 45
    s
    s1*13
    \bar "|."

}

IvlI = {
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

IvlaI = {
    \clef alto
    <<\IvlaIn \forma>>

}

IvlaII = {
    \clef alto
    <<\IvlaIIn \forma>>

}

Isoprano = {
    \new Voice = "beatus1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "beatus2"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "beatus3"
    <<\Itenoren \forma>>
}

Ibasso = {
    \clef bass
    \new Voice = "beatus4"
    <<\Ibasson \forma>>
}



Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
}



%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
Applying conversion: 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}



IIvlIn = \relative do'' {

    r8 la16_\markup {\italic sempre \dynamic p} sold la8 la, la16 do mi la
    la,8 la'16 sold la8 la, la16 do mi la
    la,4 r la'

    %4
    re,8 re'16 dod re8 re, re16 fa la re
    sol,4 r si
    do,8 do'16 si do8 do, do16 mi sol do

    %7
    fa,4 r fa\mbreak
    si,8 si'16 la si8 si, si16 re sold si
    mi,2 fad4

    %10
    la red,2
    mi8 mi'16 red mi8 mi, mi16 sold si mi
    mi,8 mi'16 red mi8 mi, mi16 sold si mi

    %13
    mi,8 re'?16 dod re8 re, re16 fa la re
    re,8 do'?16 si do8 do, do16 mi la do\mbreak
    fa,4 mi re

    %16
    mi8 mi'16 red? mi8 mi, mi16 sold si mi
    re?4 r mi,16 sold si re
    do8 la16 sold la8 la, la16 dod mi sol?

    %19
    fa4 re fad
    r8 sol16 fad sol8 sol, sol16 si re fa?
    mi4 do mi\mbreak

    %22
    fa8 fa'16 mi fa8 fa, fa16 la do fa
    si,,8 si'16 la si8 si, si16 re sold si
    mi,8 mi'16 red mi8 mi, mi16 sold si mi

    %25
    fa,2 mi4
    re re re\mbreak
    re mi fa

    %28
    red mi mi
    fa8 fa'16 mi fa8 fa, fad'[re?]
    sol, sol'16 fad sol8 sol, sol16 si re sol

    %31
    fa?4 mi la,
    si si, do16 mi sol do
    la4 fa sol,16 si re sol\mbreak

    %34
    la,8 la'16 sold? la8 la, la16 do mi la
    fad8 fad'16 mi fad8 fad, fad16 la red fad
    si,8 si16 la si8 si, si16 red fad? si

    %37
    la4 sol8 fad? sol4
    la si si,
    mi8 mi'16 red? mi8 mi, mi16 sold si mi\mbreak

    %40
    mi,8 red'16 do red8 mi, mi16 sold si red
    do8 do16 si do8 red, red16 fad la do
    si,4 r8 si'16 la sol8 fad?

    %43
    mi mi' si4 si,
    mi2.\fermata

}

IIsopranon = \relative do'' {

    \autoBeamOff
    R2.
    mi2.~
    mi8. re16 do8 [si la do]

    %4
    fa2.~
    fa16 [mi] re4 si16[la] sol[si re fa]
    mi2.~

    %7
    mi16[re] do4 si8[la dod]\mbreak
    re2.~
    re4 do? si

    %10
    do8[(re)] do4. si8
    si4 r r
    r mi, mi

    %13
    fa4. sol8 fa4
    mi2 la4~\mbreak
    la8[red mi do sib la]

    %16
    sold4. fad?8 (mi4)
    r si' si
    sol8[la] do4(dod)

    %19
    re(fa) re8 [do?]
    si4. la8 si4
    do8 mi4 sol8 sib,4~\mbreak

    %22
    sib la r
    r re re
    re2.~

    %25
    re4 do8 si? do4~
    do8[sib16 do] re[mib] fa4 re8
    sib4 la8[sold] la4~

    %28
    la8 [fad] sold2
    la8[re, re' do si? la]
    si4. la8(si4)

    %31
    r4 do fa,
    fa mi8[re] mi4~
    mi8 do re2\mbreak

    %34
    do4 r do'8 si
    la2.~
    la

    %37
    red2 mi4
    mi8 fad, fad2
    mi r4

    %40
    R2.*5

}

IItestoI = \lyricmode {

    Glo -- ri -- a Pa - - - - - - - tri et Fi - li -- o et Spi -- ri -- tu -- i Sa - - ncto.

    Si -- cut e -- rat in prin -- ci -- pi -- o, et nunc et sem -- per

    et in sae -- cula _ sæ  - - cu -- lo - - - - - rum, sæ  -- cu -- lo - - rum, a -- men,

    sæ  -- cu -- lo - - - rum, a -- men.

}

IIbcn = \relative do {

    r8 la'16^\markup {\italic sempre \dynamic p} sold la8 la, la16 do mi la
    la,8 la'16 sold la8 la, la16 do mi la
    la,4 r la'

    %4
    re,8 re'16 dod re8 re, re16 fa la re
    sol,4 r si
    do,8 do'16 si do8 do, do16 mi sol do

    %7
    fa,4 r fa\mbreak
    si,8 si'16 la si8 si, si16 re sold si
    mi,2 fad4

    %10
    la red,2
    mi8 mi'16 red mi8 mi, mi16 sold si mi
    mi,8 mi'16 red mi8 mi, mi16 sold si mi

    %13
    mi,8 re'?16 dod re8 re, re16 fa la re
    re,8 do'?16 si do8 do, do16 mi la do\mbreak
    fa,4 mi re

    %16
    mi8 mi'16 red? mi8 mi, mi16 sold si mi
    re?4 r mi,16 sold si re
    do8 la16 sold la8 la, la16 dod mi sol?

    %19
    fa4 re fad
    r8 sol16 fad sol8 sol, sol16 si re fa?
    mi4 do mi\mbreak

    %22
    fa8 fa'16 mi fa8 fa, fa16 la do fa
    si,,8 si'16 la si8 si, si16 re sold si
    mi,8 mi'16 red mi8 mi, mi16 sold si mi

    %25
    fa,2 mi4
    re re re\mbreak
    re mi fa

    %28
    red mi mi,
    fa8 fa'16 mi fa8 fa, fad'[re?]
    sol, sol'16 fad sol8 sol, sol16 si re sol

    %31
    fa?4mi la
    si si, do16 mi sol do
    la4 fa sol,16 si re sol\mbreak

    %34
    la,8 la'16 sold? la8 la, la16 do mi la
    fad8 fad'16 mi fad8 fad, fad16 la red fad
    si,8 si16 la si8 si, si16 red fad? si

    %37
    la4 sol8 fad? sol4
    la si si,
    mi8 mi'16 red? mi8 mi, mi16 sold si mi\mbreak

    %40
    mi,8 red'16 do red8 mi, mi16 sold si red
    do8 do16 si do8 red, red16 fad la do
    si,4 r8 si'16 la sol8 fad?

    %43
    mi mi' si4 si,
    mi2.\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*4
    s2 <6>4
    s2.
    s2 <5+>4
    <6\\>2.
    <7 _+>4 <6> s
    s <7>2
    <_+>2.
    s
    <2>4 <3> s
    <2>4 <3> <6>
    <6\\> <6> <6->
    <_+>2.
    <4\+>2 <_+>4
    <6> s <_+>
    <6> s <6>
    s2.
    <6>4 s <5->
    <4-> <3> s
    <6\\> s2
    <7 _+>2.
    <6>2 <6>4
    <7>4 <6-> s
    s4 <_+> s
    s <_+> s
    s2 <6>4
    s2.
    <4>4 <6> <6>
    <5>2.
    <5>4 <6> s
    \bassFigureExtendersOn <5>2 <5>4 \bassFigureExtendersOff
    <6\\>2.
    <7 _+>
    <4+>4 s <6>
    s <4> <_+>
    s2 <_+>8 s
    \bassFigureExtendersOn <_+>2 <_+>4 \bassFigureExtendersOff
    <6>4 s8 <7> s4
    <7 _+> s <6>8 <6\\>
    s4 <4> <_+>

}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key do\major
    \tempo 4 = 60
    s2.*44
    \bar "|."

}

IIvlI = {
    <<\IIvlIn \forma>>

}
IIsoprano = {
    \new Voice = "gloria"
    <<\IIsopranon \forma>>
}


IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
}




IIIsopranon = \relative do'' {

    \autoBeamOff

    R1*4
    r4 do si la8[re]~
    re do4 si la8 [sol do]

    %7
    re[si mi re] si[do] re4
    do2. si4\mbreak
    r8 re[la si] do4 sib

    %10
    la r r8 mi' [si? dod]
    re4. mi16[re] dod8[mi] re4~
    re dod re2\mbreak

    %13
    R1
    r4 r8 re[la si] do4
    si8[mi la, re] si4 r

    %16
    R1\mbreak
    r2 mi
    re4 do8 fa4 mi re8~

    %19
    re [dod16 si] dod4 red mi~
    mi red mi2\mbreak
    R1

    %22
    r2 r4 do?
    sib4 la8 re4 do8 fa[re]
    mi fa4 mi8 r fa [do re]

    %25
    mi do sol'4 fa mi8[la]~\mbreak
    la sol4 fa8 mi4 re~
    re8 do4 re16[do] si4 do~

    %28
    do si do2~
    do4 do do2
    do1

}

IIItestoI = \lyricmode {

    A - - - - - - - - - men, a - - men, a - - - - - men, a - - men, a - - - - - - - - - men, a - - - men

    a - - men, a - - men, a - - - - - - - - - men, a -- men, a -- men.

}

IIIalton = \relative do' {

    \autoBeamOff
    r4 sol' fa mi8[la]~
    la sol4 fad8 sol[fa] mi4~
    mi8[re16 mi] fa4 mi re~

    %4
    re mi r la~\mbreak
    la sol2 fa4
    r sol fa mi8[la]~

    %7
    la sol4 fa8 sol[la fad sol]~
    sol[mi] fad4 r8 sol[re mi]\mbreak
    fa?4. mi16[re] mi4 fa8[sol]

    %10
    la2 sol
    fa4 r r8la[fa sol]
    mi2 re8. [mi16] fa4\mbreak

    %13
    mi r8 la re,[sol mi] fad
    sol2 fa?4 mi8[la]~
    la sol4 fad8 sol[fa? mi] do

    %16
    r4 la' sol fa8[sib]~\mbreak
    sib8 la4 sold8 la4 mi
    r8 si'?[mi, fa] sol?4 la

    %19
    sol8.[fa16] mi4 r8 si'[mi, sol]
    la4. sol16[fad] sol8.[la16] si4\mbreak
    la 4 r si la

    %22
    sol8 do4 si8 do4 r
    r la sol fa8[sib]~
    sib[la] sol4 fa r8 sol

    %25
    mi[fa mi do]~do[re sol mi]\mbreak
    re4 r sol fa
    mi fa2 mi8[fa]

    %28
    sol2 sol4 la
    sol2 la
    sol1

}

IIItestoII = \lyricmode {

    A - - - - - - - - - men, a - men, a - - - - - men, a - - - men, a - men, a - - - men, a - men

    a - - - - - men, a - - - - -  men, a - - -  men, a - - - - men, a - - - - men, a - - - men, a - men, a - - - - - men, a -- men, a -- men.

}

IIItenoren = \relative do' {

    \autoBeamOff

    R1
    r2 r4 do
    si la8 re4 do si8~

    %4
    si[la] sol[la]  si[la16 si] do4\mbreak
    si8[re] mi4 re4. do16[si]
    do4 sol r mi'

    %7
    re do8[fa] mi4 re
    mi(la,) re2\mbreak
    R1

    %10
    r8 re[la si] do4 sol
    la8 re[la sib] la[dod] re[do?]
    sib4 la r8 re[la si]\mbreak

    %13
    do4. si16[la] si8[sol] la4
    si2 r
    r r4 do

    %16
    sib la8 re4 dod8[re fa]\mbreak
    mi[do?] si!4 la r8 mi'
    la,[si] do4 si la

    %19
    mi'2 fad4 si,
    dod fad si, r8 mi\mbreak
    la,8[si] do?4 re mi8[la,]

    %22
    si sol r re' do8[re] mi4
    r8 fa[do fa] sol[sol,] la[fa]
    sol[la sib sol] la4. si8

    %25
    do4 r8 mi la,[si] do4\mbreak
    re8 sol[do,  re] mi4 fa8[re]
    sol mi[la,] re4 do16[re] mi8[do]

    %28
    re2 mi4 fa~
    fa mi fa2~
    fa4 mi8[re] mi2

}

IIItestoIII = \lyricmode {

    A - - - - - - - - - - - - - men, a - - - men, a -- men, a - -  men, a - - - men, a - - - - men, a - - - - - - men, a - - - men

    a - - - - men, a - - - - - men, a - men, a - - - - - men, a - - men, a - - men, a - - - - men, a -- men, a - men.

}

IIIbasson = \relative do {

    \autoBeamOff

    R1*2
    r2 r4 sol'
    fa mi8 la4 sol fad8\mbreak

    %5
    sol[fa? mi do] sol'4 r
    r2 r4 do
    si la8 re4 do si8

    %8
    la2 sol\mbreak
    r2 r8 la[re, mi]
    fa4. mi16[re] mi2

    %11
    fa8 sib[fa sol] la4 sib
    sol la re,2\mbreak
    r8 la'[mi fad] sol[mi do re]

    %14
    sol,2 r
    r r4 r8 la'
    re,8[mi] fa4 mi re\mbreak

    %17
    do8 fa [re mi] do la r do'
    fad,[sold] la4 sol? fa
    mi8 la, la'2 sol4

    %20
    fad2 mi4 sol\mbreak
    fa?4 mi8 la4 sol fad8
    sol[mi fa? sol] la4 r8 la

    %23
    re,8.[mi16] fa4 mi re
    do8[fa sib, do]fa,4 r
    r2 r4 do''\mbreak

    %26
    sib la8 re4 do si8
    do4 fa, sol2~
    sol do,4 fa

    %29
    do2 fa
    do1

}

IIItestoIV = \lyricmode {

    A - - - - - -  men, a - - - - - - men, a - - - men, a - - - - men, a - men, a - - - - men, a - men, a - - - - - men, a - - men,

    a - - - - men, a -- men, a - - - - - men, a - - - - - - men, a -- men, a -- men, a -- men.

}

IIIbcn = \relative do {

    \clef alto r4 sol'' fa mi8[la]~
    la sol4 fad8 sol[fa] <<
        {
            mi4~
            mi8[re16 re] mi4 mi
        }\\{do si la8 re4 do8}
    >> \clef bass sol4
    fa mi8 la4 sol fad8\mbreak

    %5
    sol[fa? mi do] sol'4 r
    r2 r4 do
    si la8 re4 do si8

    %8
    la2 sol\mbreak
    r2 r8 la[re, mi]
    fa4. mi16[re] mi2

    %11
    fa8 sib fa sol la4 sib
    sol la re,2\mbreak
    r8 la'[mi fad] sol[mi do re]

    %14
    sol,4 \clef violin <<
        {
            r8 re'''8 la[si] do4
            si8[mi la, re] si4 do8
        }\\{sol4 fa mi8[la]~la sol4 fad8 sol[fa?] mi8}
    >> \clef bass la,
    re,8[mi] fa4 mi re\mbreak

    %17
    do8 fa re mi do la r do'
    fad,[sold] la4 sol? fa
    mi8 la, la'2 sol4

    %20
    fad2 mi4 sol\mbreak
    fa?4 mi8 la4 sol fad8
    sol[mi fa? sol] la4 r8 la

    %23
    re,8.[mi16] fa4 mi re
    do8[fa sib, do] fa,4 la'8[si!]
    do4 r8 mi la,[si] do4\mbreak

    %26
    sib la8 re4 do si8
    do4 fa, sol2~
    sol do,4 fa

    %29
    do2 fa
    do1

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    s
    s2 s4 <4>8 <3>
    \bassFigureExtendersOn <6 4>8 <6 3>\bassFigureExtendersOff s <5 3> <4 2> <3> <4 2> s
    s4 <6> s2
    s1
    <7>8 <6> s <3> <2> <3> <4\+ 2> <6>
    <7>4 <6\\> s2
    s s4 \bassFigureExtendersOn <6->8 <6->\bassFigureExtendersOff
    <5>4 <6> <6> <5>8 <6\\>
    <6>4 <6>8 <_-> <_+>2
    <_->4 <_+> s2
    \bassFigureExtendersOn s8 <5> <6> <6> <_!>4 s8 <_+>\bassFigureExtendersOff
    s1
    s2 s4 s8 <5>
    \bassFigureExtendersOn <6-> <6->\bassFigureExtendersOff <5> <6> <7> <6\\> <5> <6->
    <7> <5> s <_+> <6>4 s8 <6>16 s
    \bassFigureExtendersOn <6>8 <6> \bassFigureExtendersOff s4 <7>8 <6> <7> <6>
    <7> <_+> <_+>4 <4+ 2> <6>
    <7> <6\\> s <6>
    <3>8 <6 4> <6> <3> <4 2><6> <4 2> <6>
    s <6> <5> <_!> <5>2
    \bassFigureExtendersOn <6->8 <6-> <5>\bassFigureExtendersOff <6> <7> <6> <5> <6->
    <7>4 \bassFigureExtendersOn <6>8 <6>16 s\bassFigureExtendersOff s4 <6>8 <6>
    <5>4 s8 <6>16 s \bassFigureExtendersOn <6>8 <6> s4\bassFigureExtendersOff
    <7>8 <6> <7> <3> <4 2> <6> <4 2> <6>
    s2 <7 3>4 <6 4>
    <4> <3> s2
    \bassFigureExtendersOn <5 4>4 <5 3> s2
    <5 4>4 <5 3>8 <2> <5 3>

}


forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 50
    s1*28
    \tempo 4 =60\once \override Score.RehearsalMark.extra-offset = #'(+7 . -3)
    \mark\markup\italic "adag[io]"
    s1*2
    \bar "|."

}

IIIsoprano = {
    \new Voice = "amen1"
    <<\IIIsopranon \forma>>
}

IIIalto = {
    \new Voice = "amen2"
    <<\IIIalton \forma>>
}

IIItenore = {
    \new Voice = "amen3"
    <<\IIItenoren \forma>>
}

IIIbasso = {
    \clef bass
    \new Voice = "amen4"
    <<\IIIbasson \forma>>
}


IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
}
#(set-global-staff-size 17)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f

}

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #2

    }


    \header {
        title = \markup "Beatus vir a 4 voci [ZWV 76] "
        composer = \markup {"J. D. Zelenka (1660-1725)"}
    }

    \markup \huge {[1.] Beatus vir. Andante}

    \score {
        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 1.""Oboe 1."}
                    \IvlI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"Violino 2.""Oboe 2."}
                    \IvlII\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Viola 1."}
                    \IvlaI\global
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"viola"
                    \set Staff.instrumentName = \markup \center-column{"Viola 2."}
                    \IvlaII\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 r8 ^\markup\center-align "Canto" fa''16 mib''}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \Isoprano \global
                    \new Lyrics \lyricsto "beatus1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r2 r8^\markup\center-align "Alto" fa'16 fa'}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \Ialto \global
                    \new Lyrics \lyricsto "beatus2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r2 r8 la la^\markup\center-align"Tenore"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \Itenore \global
                    \new Lyrics \lyricsto "beatus3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"synth voice"
                    \Ibasso \global
                    \new Lyrics \lyricsto "beatus4" \ItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/32)
                \override SpacingSpanner.uniform-stretching = ##t
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

    \paper {

        systems-per-page = #5

    }

    \markup \huge {[2.] Gloria Patri}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino 1. & 2."}
                \IIvlI\global
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r2. ^\markup\center-align "Canto" mi''}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \IIsoprano \global
                \new Lyrics \lyricsto "gloria" \IItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Organo"}
                \set Staff.midiInstrument = #"contrabass"
                \IIbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/32)
                \override SpacingSpanner.uniform-stretching = ##t
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

    \paper {

        systems-per-page = #3

    }

    \markup \huge {[3.] Amen. Strumenti colle voci }

    \score {

        <<

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 r1 r r r r4 ^\markup\center-align "Canto con VV. & Ob." do''}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \IIIsoprano \global
                    \new Lyrics \lyricsto "amen1" \IIItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r4^\markup\center-align "Alto con V.la 1." sol'}
                    \clef violin
                    \set Staff.midiInstrument = #"synth voice"
                    \IIIalto \global
                    \new Lyrics \lyricsto "amen2" \IIItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r1 r2 r4^\markup\center-align"Tenore & V.la 2." do'}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"synth voice"
                    \IIItenore \global
                    \new Lyrics \lyricsto "amen3" \IIItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"synth voice"
                    \IIIbasso \global
                    \new Lyrics \lyricsto "amen4" \IIItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Basso""continuo]"}
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc\global
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/12)
                \override SpacingSpanner.uniform-stretching = ##t
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